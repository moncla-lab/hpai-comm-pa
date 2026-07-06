####to run: python script.py path/to/xml_directory

import os
import re
import sys
from pathlib import Path


def purge_sequences(input_dir):
    input_path = Path(input_dir)

    if not input_path.exists():
        print(f"Error: Directory does not exist: {input_dir}")
        return

    # Create output directory
    output_dir = input_path / "xmls_seqs_purged"
    output_dir.mkdir(exist_ok=True)

    # Match sequence blocks:
    # <sequence>
    #     <taxon .../>
    #     NUCLEOTIDES
    # </sequence>
    sequence_pattern = re.compile(
        r'(<sequence>\s*'
        r'<taxon[^>]+/>\s*)'   # Keep taxon line
        r'([A-Za-z\-]+)'       # Nucleotide sequence
        r'(\s*</sequence>)',
        re.MULTILINE | re.DOTALL
    )

    xml_files = list(input_path.glob("*.xml")) 	##rglob vs glob should look through subdirs for xmls

    if not xml_files:
        print("No XML files found.")
        return

    for xml_file in xml_files:
        with open(xml_file, "r", encoding="utf-8") as f:
            content = f.read()

        modified_content = sequence_pattern.sub(
            r'\1insert_sequence_here\3',
            content
        )

        output_file = output_dir / xml_file.name

        with open(output_file, "w", encoding="utf-8") as f:
            f.write(modified_content)

        print(f"Processed: {xml_file.name}")

    print(f"\nDone. Modified XMLs saved to:")
    print(output_dir)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage:")
        print("python purge_xml_sequences.py /path/to/xml_directory")
        sys.exit(1)

    purge_sequences(sys.argv[1])
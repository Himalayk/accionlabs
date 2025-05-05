import csv

class SecurityFinding:
    def __init__(self, cve_id, app_name):
        self.cve_id = cve_id.strip()
        self.app_name = app_name.strip().upper()

    def __eq__(self, other):
        return (self.cve_id, self.app_name) == (other.cve_id, other.app_name)

    def __hash__(self):
        return hash((self.cve_id, self.app_name))

    def __lt__(self, other):
        return (self.cve_id, self.app_name) < (other.cve_id, other.app_name)

    def __str__(self):
        return f"{self.cve_id},{self.app_name}"


class SecurityReportParser:
    def __init__(self, filename):
        self.filename = filename
        self.findings = set()

    def parse_csv(self):
        with open(self.filename, mode='r', newline='', encoding='utf-8') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                cve_id = row["CVE_ID"]
                app_name = row["Application_Name"]
                if cve_id.strip().upper() != "N/A":
                    finding = SecurityFinding(cve_id, app_name)
                    self.findings.add(finding)

    def display_findings(self):
        for finding in sorted(self.findings):
            print(finding)


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python filter_cve_app.py <security_findings.csv>")
        sys.exit(1)

    parser = SecurityReportParser(sys.argv[1])
    parser.parse_csv()
    parser.display_findings()

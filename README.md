# DVP Week 13 Assignment — File & Text Processing

## Overview
This project demonstrates basic Linux shell scripting, text processing, backup automation, and cron scheduling.

## Project Files
- `file_stats.sh` — Counts the lines, words, and characters in a specified text file.
- `replace.sh` — Replaces every occurrence of `DevOps` with `CloudOps` in a specified file.
- `backup.sh` — Creates a timestamped compressed backup archive containing the sample file and processing scripts.
- `sample.txt` — Sample input file used to test the scripts.
- `mycronjobs.txt` — Exported cron configuration for the scheduled backup.
- `writeup.docx` — Assignment summary and real-world DevOps use case.
- `backups/` — Directory where generated `.tar.gz` archives are stored.
- `screenshots/` — Add terminal screenshots showing script execution and cron configuration here.

## Requirements
- Linux (for example, Amazon Linux or Ubuntu)
- Bash
- Standard utilities: `wc`, `sed`, `tar`, and `cron`/`crond`

## Usage
Make the scripts executable:

```bash
chmod +x file_stats.sh replace.sh backup.sh
```

Count lines, words, and characters:

```bash
./file_stats.sh sample.txt
```

Replace `DevOps` with `CloudOps`:

```bash
./replace.sh sample.txt
```

**Note:** `replace.sh` edits the input file in place. Keep a copy of the original file if you need to compare before and after.

Create a backup archive:

```bash
./backup.sh
```

List the contents of the latest backup archive:

```bash
tar -tzf "$(ls -t backups/*.tar.gz | head -1)"
```

## Cron Scheduling
The provided `mycronjobs.txt` contains an example schedule to run the backup every day at 2:00 AM:

```cron
0 2 * * * /home/ec2-user/DVP-Week13-Assignment/backup.sh >> /home/ec2-user/DVP-Week13-Assignment/backup.log 2>&1
```

Before using it, update the paths to match the actual location of this project on your Linux instance. Install and start the cron service if needed, then add the entry using:

```bash
crontab -e
```

Verify the active schedule and export it with:

```bash
crontab -l
crontab -l > mycronjobs.txt
```

## Real-World DevOps Use Case
Shell scripts can automate repetitive operational work such as log analysis, text updates, and backups. A scheduled backup of important configuration files can reduce manual effort and support recovery. In production, store backups separately, monitor job failures, and test restoration regularly.

## Evidence for Submission
Add genuine screenshots to the `screenshots/` directory showing:
1. File statistics output.
2. Text replacement output.
3. Successful backup creation.
4. Backup archive contents.
5. Active cron schedule and exported `mycronjobs.txt`.

## Notes
- Run commands from the project directory unless a command specifies another path.
- Verify script paths and permissions before scheduling the job.
- A configured cron entry does not prove it has run; check `backup.log` after the scheduled time.

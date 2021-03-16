import fixLength from "./fixLength";
import { exec } from "child_process";

const command: { [key: string]: string } = {
  darwin: "rm -rf ~/Library/Application\\ Support/Microsoft/Teams",
  win32: "rd %appdata%\\Microsoft\\Teams /S /Q",
};

if (["darwin", "win32"].includes(process.platform)) {
  console.log(`
 ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 ┃ Microsoft Teams cache cleaner ┃
 ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
 ┃ Detected platform: ${
   process.platform + fixLength(10 - process.platform.length)
 } ┃
 ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛`);

  exec(command[process.platform], (error, stdout, stderr) => {
    console.log(`
 ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 ┃ Done! Reload Teams to finish  ┃
 ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
`);
  });
} else {
  console.log(`
 ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 ┃ Microsoft Teams cache cleaner ┃
 ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
 ┃ Unsupported platform          ┃
 ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
`);
}

("━ ┃ ┏ ┓┗ ┛ ┣ ┫ ┳ ┻");

export default function fixLength(chars: number) {
  let out = "";
  for (let i = 0; i < chars; i++) out += " ";
  return out;
}

#!/bin/bash
# world.ryukyu-tane.com 記事公開スクリプト
# ObsidianのOkinawa_Renaissance_Notesフォルダから両サイトへ同期してpush

OBSIDIAN="/Users/kanmemacbookair/Desktop/github/obsidian/【Layer 2】studio ← 価値を作る（制作工房）/world.ryukyu-tane.com/03_Okinawa_Renaissance_Notes"
HUGO="/Users/kanmemacbookair/Desktop/github/world-ryukyu-tane-media/content/ja/series-f"
ASTRO="/Users/kanmemacbookair/Desktop/github/world-ryukyu-tane-astro/src/content/blog/ja/series-f"

echo "📂 Obsidianから記事を同期中..."
count=0
for f in "$OBSIDIAN"/2*.md; do
  filename=$(basename "$f")
  cp "$f" "$HUGO/$filename"
  cp "$f" "$ASTRO/$filename"
  echo "  ✅ $filename"
  count=$((count + 1))
done
echo "  → $count 件同期完了"

echo ""
echo "🚀 Hugo (world.ryukyu-tane.com) をpush中..."
git -C /Users/kanmemacbookair/Desktop/github/world-ryukyu-tane-media add -A
git -C /Users/kanmemacbookair/Desktop/github/world-ryukyu-tane-media commit -m "publish: 記事を更新 $(date '+%Y-%m-%d %H:%M')" 2>/dev/null || echo "  （変更なし）"
git -C /Users/kanmemacbookair/Desktop/github/world-ryukyu-tane-media push && echo "  ✅ Hugo push完了"

echo ""
echo "🚀 Astro (world2.ryukyu-tane.com) をpush中..."
git -C /Users/kanmemacbookair/Desktop/github/world-ryukyu-tane-astro add -A
git -C /Users/kanmemacbookair/Desktop/github/world-ryukyu-tane-astro commit -m "publish: 記事を更新 $(date '+%Y-%m-%d %H:%M')" 2>/dev/null || echo "  （変更なし）"
git -C /Users/kanmemacbookair/Desktop/github/world-ryukyu-tane-astro push && echo "  ✅ Astro push完了"

echo ""
echo "🎉 公開完了！"
echo "   Hugo  → https://world.ryukyu-tane.com/ja/"
echo "   Astro → https://world2.ryukyu-tane.com/ja/"

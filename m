Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1932DFA5B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691590; cv=none; b=iUln+1bRbwoYrPQH2MorYtqWznMJoU4Wcqu6OAC/UG1r85f5SCuSLy8CYjwZPdL9AZ/XWs/oVj5+BQCawPXGA5jRW5oU9tEpJCgA/pBVrvkKjwmYcb5DbLt5J11WxewGjjZXb4xwvNmrzGUhrxaKagrb5jwroP0OgYrnXQdV0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691590; c=relaxed/simple;
	bh=h3JrnIbUN2GzP+gFuNtYrMvncTxo28Sp9Dn+b6Tr+/Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FDjAeTzXsSABBXCgTt/3uqQxO4iEHY8pwhE2VDGMzGjj4hS+W4FMiVz0F59PxRgcnHwgkrUsudVM23lOHYoQ6UpJ99TREdSOXX1KKn7h1RVY7mO36yHzpt/88BRsRJi3xeu1cC1dpVepVvd68YtPugD0Q2FARSnLNgszB115anY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d443811ed2so86285565ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744691587; x=1745296387;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnIas0lcaKzbGOUEoy0vR8XY16WUU+nYVHcgY8rOES8=;
        b=OxcC/1xBWqOY8idTCHiF+MIagJO/Ot/yoACsLG6xxx+haZKCZEAEYCswjj4WEKD1YW
         aBR/UcKF7uSsWIW5kPHSeSzOCJk7YyIMcvcbeZmwHdvygam9+h7Osc8TkDXJhmfos72o
         cPVVf3w+yuGy4uJmcN5gRXg1RaFVmCwiSSMNmYi26l9aPEVbKL4VqTVSmg5AIXc3/yfT
         7bQTWUgO0aJvTXd0FtjGSkRS4eAHnmAcVxyx2nyvFwqREsm+EIjtVnAr3sSeyjE4kdwt
         GqUZxHEeE9r4iuma7jlIBTQTiGiLESSK7N/xUU1MdAGbqknQQPiVneBiYGUaL0b1KEjl
         SXzw==
X-Gm-Message-State: AOJu0Yz0vTNMDzogQIuontMEVbiI5rOWOWSmGNxQ8Zjit/gQV4PlR6dd
	gQ3nTvbKs65mVwdQrlOkaYu5WE0hb19a1ymOFjvCb1W3WNKUP8Oeni8Ck7j58eymDiwnYEYg9wd
	7M/Tb8VDJa6tEVN+K0WwSZVciGW9Elo5JztlIVMe9vjoc+ugvsocJcMc=
X-Google-Smtp-Source: AGHT+IGM3NVpIRAjJYqdaBZ2yO+WupxJq4cDM/xk3bdVhD/F7j+idtkU1iaCmbMlByKPkRTD36LAReSHPkX/kOFwsUT1HmWCcQV4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198e:b0:3d3:e296:1c1c with SMTP id
 e9e14a558f8ab-3d7ec1f4189mr135514495ab.9.1744691586995; Mon, 14 Apr 2025
 21:33:06 -0700 (PDT)
Date: Mon, 14 Apr 2025 21:33:06 -0700
In-Reply-To: <67faff52.050a0220.379d84.001b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fde182.050a0220.3483fc.0043.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
Author: shivankg@amd.com

On 4/14/2025 3:14 AM, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 7ee3647243e5c4a9d74d4c7ec621eac75c6d37ea
> Author: Matthew Wilcox (Oracle) <willy@infradead.org>
> Date:   Wed Apr 2 14:59:57 2025 +0000
> 
>     migrate: Remove call to ->writepage
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15be8fe4580000
> start commit:   01c6df60d5d4 Add linux-next specific files for 20250411
> git tree:       linux-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=17be8fe4580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=13be8fe4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
> dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10afca3f980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116f5c04580000
> 
> Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
> Fixes: 7ee3647243e5 ("migrate: Remove call to ->writepage")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz test

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index df575a873ec6..50759a846e22 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -15,6 +15,7 @@
 #include <linux/mempool.h>
 #include <linux/seq_file.h>
 #include <linux/writeback.h>
+#include <linux/migrate.h>
 #include "jfs_incore.h"
 #include "jfs_superblock.h"
 #include "jfs_filsys.h"
@@ -151,6 +152,54 @@ static inline void dec_io(struct folio *folio, blk_status_t status,
 		handler(folio, anchor->status);
 }
 
+static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
+				    struct folio *src, enum migrate_mode mode)
+{
+	struct meta_anchor *src_anchor = src->private;
+	struct metapage *mps[MPS_PER_PAGE] = {0};
+	struct metapage *mp;
+	int i, rc;
+
+	for (i = 0; i < MPS_PER_PAGE; i++) {
+		mp = src_anchor->mp[i];
+		if (mp && metapage_locked(mp))
+			return -EAGAIN;
+	}
+
+	rc = filemap_migrate_folio(mapping, dst, src, mode);
+	if (rc != MIGRATEPAGE_SUCCESS)
+		return rc;
+
+	for (i = 0; i < MPS_PER_PAGE; i++) {
+		mp = src_anchor->mp[i];
+		if (!mp)
+			continue;
+		if (unlikely(insert_metapage(dst, mp))) {
+			/* If error, roll-back previosly inserted pages */
+			for (int j = 0 ; j < i; j++) {
+				if (mps[j])
+					remove_metapage(dst, mps[j]);
+			}
+			return -EAGAIN;
+		}
+		mps[i] = mp;
+	}
+
+	/* Update the metapage and remove it from src */
+	for (int i = 0; i < MPS_PER_PAGE; i++) {
+		mp = mps[i];
+		if (mp) {
+			int page_offset = mp->data - folio_address(src);
+
+			mp->data = folio_address(dst) + page_offset;
+			mp->folio = dst;
+			remove_metapage(src, mp);
+		}
+	}
+
+	return MIGRATEPAGE_SUCCESS;
+}
+
 #else
 static inline struct metapage *folio_to_mp(struct folio *folio, int offset)
 {
@@ -175,6 +224,32 @@ static inline void remove_metapage(struct folio *folio, struct metapage *mp)
 #define inc_io(folio) do {} while(0)
 #define dec_io(folio, status, handler) handler(folio, status)
 
+static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
+				    struct folio *src, enum migrate_mode mode)
+{
+	struct metapage *mp;
+	int page_offset;
+	int rc;
+
+	mp = folio_to_mp(src, 0);
+	if (mp && metapage_locked(mp))
+		return -EAGAIN;
+
+	rc = filemap_migrate_folio(mapping, dst, src, mode);
+	if (rc != MIGRATEPAGE_SUCCESS)
+		return rc;
+
+	if (unlikely(insert_metapage(src, mp)))
+		return -EAGAIN;
+
+	page_offset = mp->data - folio_address(src);
+	mp->data = folio_address(dst) + page_offset;
+	mp->folio = dst;
+	remove_metapage(src, mp);
+
+	return MIGRATEPAGE_SUCCESS;
+}
+
 #endif
 
 static inline struct metapage *alloc_metapage(gfp_t gfp_mask)
@@ -554,6 +629,24 @@ static bool metapage_release_folio(struct folio *folio, gfp_t gfp_mask)
 	return ret;
 }
 
+/**
+ * metapage_migrate_folio - Migration function for JFS metapages
+ */
+static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
+				  struct folio *src, enum migrate_mode mode)
+{
+	int expected_count;
+
+	if (!src->private)
+		return filemap_migrate_folio(mapping, dst, src, mode);
+
+	/* Check whether page does not have extra refs before we do more work */
+	expected_count = folio_expected_refs(mapping, src);
+	if (folio_ref_count(src) != expected_count)
+		return -EAGAIN;
+	return __metapage_migrate_folio(mapping, dst, src, mode);
+}
+
 static void metapage_invalidate_folio(struct folio *folio, size_t offset,
 				    size_t length)
 {
@@ -570,6 +663,7 @@ const struct address_space_operations jfs_metapage_aops = {
 	.release_folio	= metapage_release_folio,
 	.invalidate_folio = metapage_invalidate_folio,
 	.dirty_folio	= filemap_dirty_folio,
+	.migrate_folio	= metapage_migrate_folio,
 };
 
 struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index aaa2114498d6..cb31c5b1eb6a 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -60,6 +60,7 @@ struct movable_operations {
 /* Defined in mm/debug.c: */
 extern const char *migrate_reason_names[MR_TYPES];
 
+int folio_expected_refs(struct address_space *mapping, struct folio *folio);
 #ifdef CONFIG_MIGRATION
 
 void putback_movable_pages(struct list_head *l);
diff --git a/mm/migrate.c b/mm/migrate.c
index 6e2488e5dbe4..0f01b8a87dec 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -445,7 +445,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
 }
 #endif
 
-static int folio_expected_refs(struct address_space *mapping,
+int folio_expected_refs(struct address_space *mapping,
 		struct folio *folio)
 {
 	int refs = 1;
@@ -458,6 +458,7 @@ static int folio_expected_refs(struct address_space *mapping,
 
 	return refs;
 }
+EXPORT_SYMBOL_GPL(folio_expected_refs);
 
 /*
  * Replace the folio in the mapping.
-- 
2.34.1

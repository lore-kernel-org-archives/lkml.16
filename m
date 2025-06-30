Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73980259C85
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282946; cv=none; b=VMUj1V3XjHOH5LYQGlQy8p0iVJah5Dg4Qqu23nHex7PKnGBiFPmWFJ46u9MWHUvvJyS+to5N4UGAD7E3FXt0v3VP4aTqdL6WZywDpieyvD0j5aM252/+LuRi5eQA+x1rvo5PfYfzponhN3iaAW2/R0feWvsavWZ2aybL6xHBYss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282946; c=relaxed/simple;
	bh=X1CNRvPYzbPKN7tIs9h0r7gxtEqgbPeiwSPVT3/6tZg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TAXM/5YdnAi3Ezno3v7dW5FKZ7mqZefodLJqD0dsW1P34GH5tf4qXoqFDJ1yIBzBrPoX1C7G3Zq2OkGTAYAup6TKCugOCB9wO0Kmgpt8INuGbdKB2pSUX/ZxWug41m52JDuXUdd9HEz0lBgv+uquD4E4TeWH2wTjEfEVwl7KKrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3df393bf5f2so21335765ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282943; x=1751887743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tigoKBK7omrN1+/SlGM0Z6LzZbxEyncBJTST7Sgcov4=;
        b=Q4ZCfJ/GAPKIDNluCknQ/s6/W58Ri9ub0qnyDL9119V41PnsIGqFcvf7KyV8uhM8jA
         aT09c1Gu4Otac/NUDt/Z/fJFDc8X6dl2ZMb6HBUPHu0hjTbart2XdIJHFnNd6gvS7eaS
         pA/+PwdnT4ZCYQ9Vge2Oox1Y3mOnF7Qa2wU982G1JWkcMmBXf/Xe42XMZNU1ZEStPhCv
         JjP1UPn+xUERgTBORHu4sZXueWm4zlnfsJOsq30d5o0gAr7bhg//A3BX0DNqp81TjpTd
         2yCF0WJD0lXJYbTt/Cr5gH3ToZ76MJmuBu6TNF5yKoKcfQqnPlOL7DJ8OxWYvZ8i9B0r
         6+oA==
X-Gm-Message-State: AOJu0Yx103luE2tn5juZRqhXIMAd4CaM7tUj48I5lblmLK95W2+RBcZB
	XCldQZkyNnNXwiFxOU4hk7O8tZjlHT6O8tB8sGsTBh6sKbJ+izmkWZl8NIUztPqISfRKdfsyThG
	kafcZ1clXuvjBUJWjjsPs8fp03GYsHZMnK+UF8wWu3snZwn03G03PVykUbuA=
X-Google-Smtp-Source: AGHT+IGrTQyWnEEBMWH2uEWvsKVhEeHq/G3aWcxPILwRGEoW/4slHNULi7GaWdVvZy/8+ncZc2ZLEaZPgr+MMbMjqc7gz7YoafIo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4416:10b0:3df:4c0a:a3 with SMTP id
 e9e14a558f8ab-3df4c0a013dmr86434525ab.20.1751282943616; Mon, 30 Jun 2025
 04:29:03 -0700 (PDT)
Date: Mon, 30 Jun 2025 04:29:03 -0700
In-Reply-To: <68610b72.a70a0220.2f4de1.0019.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686274ff.a70a0220.d08a1.0008.GAE@google.com>
Subject: Re: [syzbot] Private message regarding: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Private message regarding: [syzbot] [ntfs3?] WARNING in ni_rename
Author: kapoorarnav43@gmail.com

#syz test: 
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
From 00325fe8a9658ef0d9e0082dd98c09adc01875fa Mon Sep 17 00:00:00 2001
From: Arnav Kapoor <kapoor...@gmail.com>
Date: Sun, 29 Jun 2025 15:29:27 +0530
Subject: [PATCH] ntfs3: log error when cleanup in ni_rename fails

If ni_remove_name fails and undoing ni_add_name also fails,
add an error log so the failure is visible.

Reported-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Signed-off-by: Arnav Kapoor <kapoor...@gmail.com>
---
 fs/ntfs3/frecord.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index b7a83200f2cc..8e9d2ea4e37e 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ int ni_rename(struct ntfs_inode *dir_ni, struct ntfs_inode *new_dir_ni,
                struct ntfs_inode *ni, struct dentry *de, struct dentry 
*new_de,
                bool *is_bad)
 {
+       struct super_block *sb = ni->mi.sbi->sb;
        int err;
        struct ntfs_dir_entry *de2;
        bool undo;
 
        err = ni_add_name(new_dir_ni, ni, new_de);
        if (!err) {
                err = ni_remove_name(dir_ni, ni, de, &de2, &undo);
-               if (err && ni_remove_name(new_dir_ni, ni, new_de, &de2, 
&undo))
+               if (err && ni_remove_name(new_dir_ni, ni, new_de, &de2, 
&undo)) {
+                       ntfs_err(sb, "ni_rename: failed to clean up after 
add_name failure");
                        *is_bad = true;
+               }
        }
 
        /*
-- 
2.43.0


On Monday, 30 June 2025 at 16:51:05 UTC+5:30 syzbot wrote:

Hello, 

syzbot tried to test the proposed patch but the build/boot failed: 

failed to apply patch: 
checking file fs/ntfs3/frecord.c 
Hunk #1 FAILED at 3027. 
1 out of 1 hunk FAILED 



Tested on: 

commit: 1343433e Add linux-next specific files for 20250630 
git tree: linux-next 
kernel config: https://syzkaller.appspot.com/x/.config?x=a3d8d413c6928dae 
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64 
compiler: 
patch: https://syzkaller.appspot.com/x/patch.diff?x=115cb88c580000 


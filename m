Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CA023ABB5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751326677; cv=none; b=jf7haLIu9Rkfj6dxoBUgWuNe4X1o7O1FW2ZrY3gn/RQJKpCQQM9O0psGKV/BQopWeJTCDcX1m/K8pSELZTUY/FChrr0KIV70kWq8/D0ehteMwK+svI7/biU6Cr1EeKKDek+NQUHtcV3bZQN4R8ZTgTqi9AdOOekNaSViS+pOWrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751326677; c=relaxed/simple;
	bh=dK9sbnxD4m/YDHS9yUBeAQqhLNLLq7vDwIrf+SMPlpw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=s+B84hWF69m74w7odotumeZid5YjbUtTfwBnNgKv5kcpesUOrtJ2F2sVN6GmXvyLMuA/J+dM+WG27tt8NY/Ss3HFneHVPPn1OkUE2qN+gnHCJtrYXWlf17laLWeEo34FwcZl9FV7/HfC0oTNDek4nHiU5dyUnzb/He4fcHnVSlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd5311fd3so24730115ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751326674; x=1751931474;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pl5M05gS9CLz4rjryE7j3rB3/YkMxfSRM7TQPjreLoo=;
        b=rR2MsR3O/oUnwsqTQ+c/8ddhVVObzaTyB8Lm5uxdbd6LXEA6OpuIYtDMEwV7cGZpdJ
         r8pnAabRS70VEi1x70IhIMyVr9kVZfCxJIoEM0+yzZPdTqTZUWDgrRX7pm7IhgBdt+za
         n92KQVkg9F+6M3B/DTgKo3de2tDNZtloHxHaYBOyvKFAFfDGipBb76GunOQ7+9q3Wtl3
         qs9rCFBEaC5YQwxjWpkk/aVjcGCKMTNE3XPS0IhKbpBrtWAESHMenalB4YRoOj3GCYxY
         nba8W+MWz9VooNXiNa5JEe8AZcPzhw7DJ1vFPaElkj7GyRep68/7PchEutkIVu7gN4WI
         BSHg==
X-Gm-Message-State: AOJu0Yzj6YgUrIPfEjQgsE+xip/syyu4eyzN7QDKD51qcHtQn8WGYJEf
	BJfesWyqXvPCbribDT35ZdWLtpu1zA+Oh6qKaNwG+1C7G1yklnlFm2tCnMzLvZGriExFioyRVIw
	ce3eIkVAOlmx6UjE6SBTtnt0HervfBZkHtB10dIvvRHc3tlvsdo89Tl25z9c=
X-Google-Smtp-Source: AGHT+IGJI/PQ74KjA6osRzV/UuB2RhxUeuNhdAT1HTd8SDL9pIRX5wLp9f99xcN6uOWFQytzl5WfRSU4cryugT7lyQ8WIjbJNn0r
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:248e:b0:3df:29c5:2976 with SMTP id
 e9e14a558f8ab-3df4ab85a5amr156806005ab.14.1751326674591; Mon, 30 Jun 2025
 16:37:54 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:37:54 -0700
In-Reply-To: <68610b72.a70a0220.2f4de1.0019.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68631fd2.a70a0220.3b7e22.138c.GAE@google.com>
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
Subject: [PATCH] ntfs3: log warning instead of WARN_ON in ni_rename cleanup 
failure

If ni_remove_name fails and undoing ni_add_name also fails,
replace WARN_ON with a ntfs_warn log and mark the inode bad.
This keeps the error visible without triggering a kernel warning.

Reported-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Signed-off-by: Arnav Kapoor <kapoor...@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index b7a83200f2cc..xxxxxxxxxxxx 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3029,11 +3029,11 @@ int ni_rename(...)
 if (err && ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo)) {
     ntfs_err(sb, "ni_rename: failed to clean up after add_name failure");
     *is_bad = true;
-    WARN_ON(err);
+    ntfs_warn(sb, "ni_rename: incomplete rename cleanup, marking bad");
 }
 
 /*
-- 
2.43.0


On Monday, 30 June 2025 at 20:02:07 UTC+5:30 syzbot wrote:

Hello, 

syzbot tried to test the proposed patch but the build/boot failed: 

failed to apply patch: 
checking file fs/ntfs3/frecord.c 
patch: **** unexpected end of file in patch 



Tested on: 

commit: 1343433e Add linux-next specific files for 20250630 
git tree: linux-next 
kernel config: https://syzkaller.appspot.com/x/.config?x=a3d8d413c6928dae 
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64 
compiler: 
patch: https://syzkaller.appspot.com/x/patch.diff?x=1362988c580000 


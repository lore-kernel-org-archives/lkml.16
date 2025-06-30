Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFFE242909
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751327310; cv=none; b=FZoeVdxGDSB0D1BUgJPVT2RykIN4vPFYH6CyZUrdRvDJ/HFYV1jOCDOJZioyDyre9+AmRN2YssXXIJINxNkSNIXBmJA0GrZVrEvAlwICHHqyu5y2MOw2m+DzkOXiAH21ELp8+VlAbFsIg21LTyu4TrRmpPHubEcopN1NbiHARJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751327310; c=relaxed/simple;
	bh=lnnjbtmD7VkohqDV6Y47cj8iSpjRSfhgdcJyHkg9aII=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JSvKpmKGtYBZmzVGIY/TWktLVlRHoo6RWoeVSGO5oS9QYsWLcchEZ4sm7YMUh8lI4A9iD/msFozYP8ILKEMhAkHqD8ekE1omlJRRstpkx7vCeBfNykblC848ZHDamEj2uOouTcIw1ZqLy7U0oJJGELt5vD9tghenBMcWSgCqfO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3df2d0b7c50so28055195ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751327308; x=1751932108;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UprR3vaWG6TFDAez8TzWU2JKSLOOnmpyK0KuwVEEfUM=;
        b=ZSdbEdjgqZYsEKizb918oRI1IFfekHrx/ViQnGotf9JLggcthX2ilV1Uvt+e7MaSOq
         FWtpStxuY3bH/CBNZ4+ECT84dRanz1XFnTEkiq7uYVK2kUxHLqzGlTUGnaOz1/a4eeI/
         ERKmn6Xuk+f3l8umvbXzR0ZKdXcIQYdfUhN/nXDmefNhJy20ZXDObhaqsparW8+wfdT4
         NTSD35/b95PWJBuehTIFyhSvwkOmsubEsUDyS3fFdn3ROxmP7mLfMxCSy9hX4nqNDjJu
         H5uT1+vuNsPLH8L5joXBvTBpvfND6CIKbdAhfx2f/03rm4zHeGp1NC/JlXcnuHdXewoF
         eRuw==
X-Gm-Message-State: AOJu0YzVB5c9SH/5w0Yqr1Ztjzl5IIG2jdGdLSupGa3V2E15mcUeECjn
	2bohGFvW4il0eRsemUEVlZvAixzmLb6WcHE2RIAxC0bZe8Im+2cm20o/hHCQcLbvkMSQ6w/Obsd
	2hqW/CqPQV6P8Qb4lq1LjNZcKbDhlS9cF1cutjOD/BQtoiRXdspBIw7H26mdUzw==
X-Google-Smtp-Source: AGHT+IGJ2nnNUXpt+h9V50icm+sYWNzTzYiw0h7qW2vmk0nSwbQO2C+M1LFLTiU61mBCK8Vl+1SGGscfXvOaN2UdS7hDJioT0T/K
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a46:b0:3df:3154:2e90 with SMTP id
 e9e14a558f8ab-3df4abb9898mr188106225ab.19.1751327308376; Mon, 30 Jun 2025
 16:48:28 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:48:28 -0700
In-Reply-To: <68610b72.a70a0220.2f4de1.0019.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6863224c.a70a0220.3b7e22.138f.GAE@google.com>
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
From: Arnav Kapoor <kapoorarnav43@gmail.com <https://groups.google.com/>> 
Date: Sun, 29 Jun 2025 15:29:27 +0530 
Subject: [PATCH] ntfs3: log warning instead of WARN_ON in ni_rename cleanup 
failure 

If ni_remove_name fails and undoing ni_add_name also fails, 
replace WARN_ON with a ntfs_warn log and mark the inode bad. 
This keeps the error visible without triggering a kernel warning. 

Reported-by: syzbot+b03730...@syzkaller.appspotmail.com 
<https://groups.google.com/> 
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com 
<https://groups.google.com/>> 
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
- WARN_ON(err); 
+ ntfs_warn(sb, "ni_rename: incomplete rename cleanup, marking bad"); 
} 

/* 
-- 
2.43.0 


On Tuesday, 1 July 2025 at 05:15:05 UTC+5:30 syzbot wrote:

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
patch: https://syzkaller.appspot.com/x/patch.diff?x=174b448c580000 


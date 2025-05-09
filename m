Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0A2F507
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 03:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746762298; cv=none; b=B5v7EH5aWAjLF7AG/H942iX8AxdWDzeqUX7PHw3LBUSSTpQXN8aksWMUQnlYDYvaZLedaTOFowsYDf7ZqxZ4RZktjJnutZTVMIHIkh/SNzjDuptBIOUTShQsHZR7MJVx6zLNihw9DfKkIDqRuWazWLXwV260lTMUVnUnYaqLUpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746762298; c=relaxed/simple;
	bh=k8vpAy09m6rAXeiZCRCU8xbEbO4dS+lbuZUL6Gu87M4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MHYVGiw0uqa0gbYh9V356tacTNqbrvybqBc8a8f3vGm/c3N0gH564YNEsDGzElghn5w1XLZ2xjPfyaYvYpLk/1PzVSFEJKuvPmyJdWamzaOKMMihbQQYabNzXyWYFM77etbaEHNF5GyjUPgdVMCiaSMd3ue2r7Sr9dlX07WdzwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3da731b7df8so18029325ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 20:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746762296; x=1747367096;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjbHBLRwEKLRlKAOMklMOk4ZYdb6TtkbrCbgIFm0odE=;
        b=REf/GB+XoXJ3BI55c3jRNKCH1wMVQiSNtbI3S5BQZHM1C3hJtTPgitpn1cDfIC/mDC
         VtIl6VEz2npu/zvj8A9LrtcaSHbNAb5t4mM6g+fFaJciP+lHgA2Jr+mHnOyjFXG3Q72j
         0BirMyGMBRH58Gl9K5+yCLXLA9ZCsFPSudxTmZZZmOoygTqrF1ECIUFmnrY2Ke/r/JT+
         kDURoBEoJ36pOI9GccrjuDzkjgT8WNybne1H9+Fycv4rq1QO1QAlqzJPNJib+8PFm7lG
         toiLm6zmTDqJoOIEC2XL7azIhgb1Ihl1bXKR7iRdNdNFGekV1CMWGUpBgZ6NO2Nh9sfk
         /hNA==
X-Gm-Message-State: AOJu0YytIWfgLVVBXiMNSsX83RjmKeWJg6cg4Xv4TWoptJklasBSlyUX
	6iEDcqSuhFe+6Hb+RtPk8/aWl0boWDanTEkClI3Lbzm+O7wjAAJrhxUEigFa51B+CdJbkcbey1i
	Qghf48tiu4rG6T9ws98hlYmdzcrm6d9IKu1dE0/cUrcdL41wE+mJjEF0=
X-Google-Smtp-Source: AGHT+IE9bTS1s/5x7z4gWspG/iyue59d/4q8FqLUqzN247cdaX2qHXd5m5cIJByyXBSJvg2D2+CBju6i62RMVW0SOpNdpn+NIBaW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:370f:b0:3d9:3675:f531 with SMTP id
 e9e14a558f8ab-3da7e33fd44mr20735765ab.6.1746762296280; Thu, 08 May 2025
 20:44:56 -0700 (PDT)
Date: Thu, 08 May 2025 20:44:56 -0700
In-Reply-To: <6711ae3d.050a0220.1e4b4d.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681d7a38.050a0220.a19a9.0123.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [ext4?] WARNING in ext4_journal_check_start (2)
From: syzbot <syzbot+b75d75f957975f3d40e3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [ext4?] WARNING in ext4_journal_check_start (2)
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git c964ced77262

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 fs/ext4/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 54bdd4884fe6..d799f424f218 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2806,7 +2806,7 @@ static int ext4_writepages(struct address_space *mapping,
 	int ret;
 	int alloc_ctx;
 
-	if (unlikely(ext4_forced_shutdown(sb)))
+	if (unlikely(ext4_forced_shutdown(sb)) || mapping->host->i_sb->s_writers.frozen == SB_FREEZE_COMPLETE)
 		return -EIO;
 
 	alloc_ctx = ext4_writepages_down_read(sb);
-- 
2.43.0


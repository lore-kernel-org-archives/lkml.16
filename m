Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F319D081
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436776; cv=none; b=KSkb2rLMYsNtqqWmgovc0Re48o8g73P+IEcpoz597ZVLdupX6C1maPz0Iov7ol872kNqB2pPluqKGC9UU5ggTdYxZVVKNQ3DNuUBZ1/7CmCbVs4KT6wmSDqgLMlEvod02k5jA+YzYdlBWyJRbvE2iw2YPRsz9OnBl+PDXBqOgLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436776; c=relaxed/simple;
	bh=TEhg5G1TflnbuHtWyfon2NzSUtMhB80Kua3irQ4LsHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UCpxYVmwkgf0Bpn0R8xUVTIBoIb0nvCDzA/gKiiL/JhZK5HVwrZbRfA7tq2H1pLfmzQNNV7T2rdv2UgwNAwBatI/A5qIJhKEgY9YLWVsyLpkLbQzAMXhf7JjmIua4NGZiqfVirOgmBAnglMumn5zS5VSNeC6/nR+bGXtoULxLEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU4YcPrZ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU4YcPrZ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso2249471fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745436773; x=1746041573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ii5cwHF9ghnTeJsvB85dcnXrMjnihSfBctKt63IYmaA=;
        b=HU4YcPrZpvlspWUvePVWOgl0BUcHH6/O9UrWQR7gXQHm+0ufsJtNRITtlLqxsnga4t
         VpJqRfPA/s/sbK/ai250sqd6ZfgHfVAlxC/oJWzCj5yaorOQs59sS1rYe9NvgGVySdD5
         mNqZDRHxJ8dcrWx2IMghnkTU53O+AOSA+DbFU53SYk0ZHth52CeouLXKnLiKFWhYQGwJ
         JHrwSkf7le7VuDUi976GHpzAc0wXHqtM9oZLD9mraqdCtMzH9s2adwKmP6m5EvhG0pHx
         UgYS2nMZ5rIvh77kZ2EVRW7edg0phNslqwL5buFWhDEFAqFqD+y06jSCAFgyylZpCP/E
         VeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745436773; x=1746041573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ii5cwHF9ghnTeJsvB85dcnXrMjnihSfBctKt63IYmaA=;
        b=WmWayuf9u9d1O2VlFYWp0YuYk72rB+F0Zzzjce+wTCMdwl6+FSbchwSyK5hK5RtADb
         LSb6NjPN19fJFI35VydkMWkunHK0oHA+5ze0laZTd76mngCQQTR29tgprrL9VIA7WO9m
         uWcE8NY4yNJF3GF/hx85g6q/ft1/2+oxQ2+cAzUyqPhEE5kdPXDKXYcNuVq3n3EEnmAP
         xUXgwAF9qNCbKUopGF+3cz+WgPXICjmqKjj2l/1Ec2Ud5ocC5ZSj9WxrIR9Yy+WNlcY9
         xjw51XXUOnV26Sga4OGoeRWuW7qixiKm1t1eBCK3+4RgJd6Oj7GqYdY9DUCseRqBC+FA
         7eEw==
X-Forwarded-Encrypted: i=1; AJvYcCX7ZIJM5nSzT1wCCKqZMTXNSXRcopYz4BeXHbcvEG2xDGfYJV+pfTXaNvP8r6UNKGe/fLhdxUfd6/TH4yA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypOBRf9ZcH7rF/pZgo0RNgnyuq74vgAEL4KweO1nvXN5PD50Fu
	XcloWAS5QfY9kKiB5WDzEWPLC6fXDv/SyUJrBzTTfQtcvVPJjBcu
X-Gm-Gg: ASbGncsgt5euZhUvrP3nb3A1D6Z9cluE72XvdXiH65Bu9s8MEj2pZGy9Rw5V7yDvc8j
	0B02FSt0GUSnF2aU9R78p3a44RxRZyMPsHX4xek6hdVAGtfieGHx5asHpTsuZJs+N6MpwBrpTOW
	QVbGAsFxB+GGd1Q9ez7RqBiBc9Ja4zxUL91+h0y9f3cCH48jd7criLYJigu28u0zUH0NNv67g+p
	u8kaMhZLaDbp5/LU/zsbaXefKIHCd/h4ggflwM3g1wGvEkvV/AiwDEuDxM/SBkuyP+iJml0woHr
	Jq9dJ2b+8rGwTRyGLhbUVGc3zZsS9qkr9yCJdNv0QA==
X-Google-Smtp-Source: AGHT+IHYhkvmvfLA15BXO9JfM+4qofch0b3oi79VASt4f7Gmd7VAl74GUUx9CmpYJxYXC/JjKWgzCw==
X-Received: by 2002:a05:651c:2107:b0:30c:2590:124c with SMTP id 38308e7fff4ca-3179e6e74a9mr601471fa.11.1745436772518;
        Wed, 23 Apr 2025 12:32:52 -0700 (PDT)
Received: from leo-laptop.. ([85.89.126.105])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090783917sm19821821fa.41.2025.04.23.12.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:32:52 -0700 (PDT)
From: Leonid Arapov <arapovl839@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Leonid Arapov <arapovl839@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Ferenc Havasi <havasi@inf.u-szeged.hu>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: Decrease xattr length limit to avoid summary write error
Date: Wed, 23 Apr 2025 19:32:05 +0000
Message-ID: <20250423193209.5811-1-arapovl839@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When fuzzing, the following error is observed:

jffs2: warning: (1096) jffs2_sum_write_sumnode: Empty summary info!!!
------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:865!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 1 PID: 1096 Comm: syz-executor340 Not tainted
6.1.108-syzkaller-00007-g86fb5a1a71c9 #0
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 
04/01/2014
RIP: 0010:jffs2_sum_write_sumnode.cold+0x195/0x43b fs/jffs2/summary.c:865
Call Trace:
 jffs2_do_reserve_space+0xa18/0xd60 fs/jffs2/nodemgmt.c:388
 jffs2_reserve_space+0x55f/0xaa0 fs/jffs2/nodemgmt.c:197
 do_jffs2_setxattr+0x212/0x1570 fs/jffs2/xattr.c:1117
 __vfs_setxattr+0x118/0x180 fs/xattr.c:182
 __vfs_setxattr_noperm+0x125/0x600 fs/xattr.c:216
 __vfs_setxattr_locked+0x1d3/0x260 fs/xattr.c:277
 vfs_setxattr+0x13f/0x340 fs/xattr.c:309
 setxattr+0x14a/0x160 fs/xattr.c:617
 path_setxattr+0x19b/0x1d0 fs/xattr.c:636
 __do_sys_setxattr fs/xattr.c:652 [inline]
 __se_sys_setxattr fs/xattr.c:648 [inline]
 __x64_sys_setxattr+0xc0/0x160 fs/xattr.c:648
 do_syscall_64+0x35/0x80 arch/x86/entry/common.c:81

The error occurs when trying to create a new attribute of a file by xattr
syscall. Size and name of the attribure are set by user. Current limit of
total size of an attribute is equal to free size in a clean block and it
doesn't include space needed for summary data structures. So it is
possible to create an attribute whose size doesn't exceed the limit but
the total size of attribute and its summary data does. If requested size
of an attribute satisfies this condition, it leads to the following
behavior:

jffs2_do_reserve_space tries to reserve requested size for an attribute
and its summary. It fails to do so because even a clean block doesn't have
enough free space. Then it writes existing summary to the current block
and proceeds to the next block. Summary data is linked to a specific erase
block so it needs to be written to the current block before selecting
a new one.

Then this function is called again to reserve space in a new block.
It fails again and tries to write summary as the first time but at this
point collected summary for the block is empty and it leads to BUG() in
jffs2_summary_write_sumnode.

Decrease maximum allowed size of xattr buffer.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
Signed-off-by: Leonid Arapov <arapovl839@gmail.com>
---
 fs/jffs2/xattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index defb4162c3d5..7380f32e6d0f 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -1110,7 +1110,8 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 		return rc;
 
 	request = PAD(sizeof(struct jffs2_raw_xattr) + strlen(xname) + 1 + size);
-	if (request > c->sector_size - c->cleanmarker_size)
+	if (request > c->sector_size - c->cleanmarker_size -
+	    JFFS2_SUMMARY_XATTR_SIZE - JFFS2_SUMMARY_FRAME_SIZE)
 		return -ERANGE;
 
 	rc = jffs2_reserve_space(c, request, &length,
-- 
2.45.2


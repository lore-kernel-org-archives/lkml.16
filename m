Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C518871F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744946759; cv=none; b=BXP+LTmcwsSmZ4gRz3N3RzOkrd7o770sqSlwHxaradjxYoBgtj4sfKLx2MetNy+VIkOTSEc39EkPr7Q8+9H5Y8G3Q3PjBBRYRWnR46uy9TiU/Nr/nmiPDxB07hFHuFNBw2tYHwh4PgTfg7pjUzzly/9sS0eAJgzIvG/DvsDNA5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744946759; c=relaxed/simple;
	bh=AHHp/HCy61pslcQgqrWXbioECU/vdxqQvjXfFTWw26Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IrK8jE4cMIQVs/dzlya7l+4R+BvSJVZ8QQqOHKI5pFYdvmy+952NgSMKoVlcQRtautb4NrCvnAEmN70UdYMIwV9DICzYEpVaiZph+8N3ttLft3xgbCOJ+v02h7Xk4cOJlTfusNROg1Lqg85YQjxb99AeiF2QSkeGQUHPBPApjCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85e4f920dacso148202439f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744946757; x=1745551557;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9Du5hxt+SPzMYed8A4aZaHIu5PkRu+s4LbSnbJYYRY=;
        b=oBVweqfd5RqrhC2d4H/p85Tnep5r9FNXJSkl0xhTEB2ofhYRnaHwXX36qjkZ/C9wXk
         x4YC48tR0+Bh+axUIBRJSqakJC38g01nVnMHc6roogcQ9AgS3QHsO9l1rrfGs0LKcilw
         IiiMCx09S+f8phs/mQZCkQDWJVncY8jFh/zsWBNvzRP4qbpPCNywnzblhZbFf2A69R/P
         LCNOZkTQvkTa2vfsNSyOxChqvMj2+hzEYN46q1TLV6jZe3Oi3JRI4/YgP9DHD8qdBVTx
         ZjlJjGcdDh19leeON+dV4tGCemjuBcpX50kGzd+X7WOUApoqVImcbzA5TRpPsDfTdr1p
         TaGw==
X-Gm-Message-State: AOJu0YwEuzgP0VIrqXqnoVd9XY4bQe33jtJbVIi/zYAbPeu3rzyj64Y+
	H+FmCl5NwbSmBwyG/6Zt52TsglOpWHyZmSnXv8jHp+41t2MNRqgpEVX3QlSrf3W+PLIpLgOhlqZ
	tFsSczYxGer8uFwDcjrO5AVP88TxXX7DHvz9zDjQBjhFJP6W12mZ32kw=
X-Google-Smtp-Source: AGHT+IGqSc/dpQjQ40n+uA1wOcs3A8Pmvs2EdHIsYWJK+s9ntMOcrx75Xm65gTV5q7yqk+K2o59+oBb5oX6jOP6rIkDa4bd2wXyl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca48:0:b0:3d5:8922:77a0 with SMTP id
 e9e14a558f8ab-3d88ee5061fmr15931425ab.18.1744946757217; Thu, 17 Apr 2025
 20:25:57 -0700 (PDT)
Date: Thu, 17 Apr 2025 20:25:57 -0700
In-Reply-To: <67d9cf78.050a0220.3657bb.000f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6801c645.050a0220.243d89.0016.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in dtDelete
From: syzbot <syzbot+4f9c823a6f63d87491ba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in dtDelete
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e3a854b577cb

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 fs/jfs/jfs_dtree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 8f85177f284b..0a209b30686a 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2130,7 +2130,7 @@ int dtDelete(tid_t tid,
 					stbl = DT_GETSTBL(np);
 					ldtentry =
 					    (struct ldtentry *) & np->
-					    slot[stbl[0]];
+					    slot[stbl[0] % np->header.maxslot];
 					next_index =
 					    le32_to_cpu(ldtentry->index);
 					DT_PUTPAGE(nmp);
-- 
2.43.0


Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B7A270EAE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969604; cv=none; b=MJ4s2cSKNR3OUjWK5lkzngog6knAeswM01AFWYn/bcEsuWI94WVQE1BepmsbkO5F0tjcWrocrUxeJyFZgDd02VPLraLTGZlcjCuCnabm5UhqW9k6Lt8JWmh30stCexlefTaxuWHrHIzgx3HFS6yx7t/LWzS1PtaEXsUEIajbaQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969604; c=relaxed/simple;
	bh=iw2t7Tq55kSwufFT5aMDEe6x0nJERTHzjn7+26Eha94=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NW4nwM0WH+uwAaFF/Ug84nueOURjApGmV4vdlT0ndm8Nu5u8ZGns5YwOypFn1/3sg/Efai6ScV0ctikxSVhihZRFeUGBBIBQDf/yei0ZrEv2QUH+GhbWflqMtNuBkC9vm9dKRHuUE9foySWx8n1qbajRhi9GpuNKjF7Mp2RAy8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d81d99e4e6so13205085ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969602; x=1745574402;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zf4umU7WzpRoYwgPJcm+Ni+S52FuzI/HtwRnU1/nUo8=;
        b=tDo3LNXglsExW9Fn/OBils83H6dPd01y7SmLtL2LdSRrwhhtMZ+Ng+jwBH1O1gQeDx
         7jtMrJ+RdEJliwsNlZO6InOoO79c8CSBRh6725IEsBH6nR2q0Cdzyg/w82i3cjhpoCb5
         i/ucRypmM1/YxLuGC2FT6evXh0WJ5S3RAwLHpWklw5fPvgdKL6c7wjP574vhbYwx18PX
         YGnfIKIRdSCRdip4fBmt87nL7iqT+9zZ5xj7UrOYvfp9lM3dzNftsNpeJLFkSB3E6r+h
         vSgMRCJBqS90ih3ST/iSeGpJg850I/DLRTVChTiSuzVes69FmFjBjTs8U1Z/ukrucHDS
         rZ5Q==
X-Gm-Message-State: AOJu0Ywv89rjgdJ/bX7E2c5I5Ebi07JfjPtD+wgKPOwtfWW3s8A4G2Yw
	OhvPxWL/UVJmMnUxKdU2i/1R7T8VPIZjTT8+unfCb9wpSD7snlBclcxq1Fgb1EtMVAq+YPQVEaH
	M5pweOy1DlxW1wc8oEaNQet6hD183YeYphsS/6EVTR5ZYFqVonDvpugU=
X-Google-Smtp-Source: AGHT+IE0lixCZSyjN8rrkXpAeTW3umlB2ifGp16elNAnIgS7QkveelycQnY0zlOv+Hb4i13g8R2f7zXSP/ynGiljXMXFlpMtB/7t
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a8b:b0:3d6:d3f7:8813 with SMTP id
 e9e14a558f8ab-3d89428c3efmr18088015ab.22.1744969602282; Fri, 18 Apr 2025
 02:46:42 -0700 (PDT)
Date: Fri, 18 Apr 2025 02:46:42 -0700
In-Reply-To: <66fcb7f9.050a0220.f28ec.04e8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68021f82.050a0220.243d89.0019.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [jfs?] KASAN: null-ptr-deref Read in
 drop_buffers (3)
From: syzbot <syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [jfs?] KASAN: null-ptr-deref Read in drop_buffers (3)
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cb82ca153949

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 fs/buffer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index cc8452f60251..1e3a07c66c1a 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2885,7 +2885,7 @@ drop_buffers(struct folio *folio, struct buffer_head **buffers_to_free)
 
 	bh = head;
 	do {
-		if (buffer_busy(bh))
+		if (!bh || buffer_busy(bh))
 			goto failed;
 		bh = bh->b_this_page;
 	} while (bh != head);
@@ -2896,6 +2896,8 @@ drop_buffers(struct folio *folio, struct buffer_head **buffers_to_free)
 		if (bh->b_assoc_map)
 			__remove_assoc_queue(bh);
 		bh = next;
+		if (!bh)
+			goto failed;
 	} while (bh != head);
 	*buffers_to_free = head;
 	folio_detach_private(folio);
-- 
2.43.0


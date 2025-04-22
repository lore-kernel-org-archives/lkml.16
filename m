Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59591B666
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349762; cv=none; b=Vc0e5akxO6EeWm75QMh2JR/VSCZDzyRRdtTeC1mWdBEm+BX7/sPAsD8EZMfUBN4BcKb+T8f0nfHAFvyir2eqBZQX7Hkl8k0uC4YgwnMkmes6Ou+ZpGq2ZnsP319W/mve+4JwoWHmDQrLDpena57lJNUOpI+WivzIr29omLJ59Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349762; c=relaxed/simple;
	bh=2J0MNewUqSAhfomdsZ5DsdmPc7oeHxIS8PRFrb3fLyc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bJu8VJGQ92XBg5EmQKZf1LVTb5czepewoF1Z5oE8a9JNo1cEZAfjnHT0erBXU+1eUfALPYpTfaI3cNrmjc/IxkXvySEvDeDl0uHjDVcje/SYe6cH39Twu4cdxJ9yTaNj38+rpZXKf3mmMI2eZmKhinUPNRWyW4XRuwEdkr8RnII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d8dd0c9143so79084855ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349760; x=1745954560;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VqJEB2/emiFpbOcTWiaq/1rDZxvEsI8ksc0W8YpKhyA=;
        b=rnFTD4EvjfmU7mMciuNjWda7CxzaOZVXW36LRAWrT8mORWB7vMkYzGB2vDptIBDMzM
         tOfYtSb06t6mMwBkBD5OgQJLzL8Q3439prNdZiTUT4tBRfH2nLSUMBGs5i02GImgrAsD
         N7+TrVG4gwE7EyxUkNn1LXGCRPFpI5e3kL4L/Q9QAucwJLn9too/BtRl+bEczwjt08dk
         0t9e4JuhJrfYFWNI9dWYycx3IiPvmmvqzgX3nUr+KqcNxfqLQKwmFDqzrjtOuSWf0B/N
         yl+K+GJOZXEU8YJyksdFF3siQSNI1KfVp1on6v1tGJaZODGcZSYMxVp92rg33VpNv/ga
         kgJQ==
X-Gm-Message-State: AOJu0YybFjf/JRJPlYHRskrwUk/DC6MTcXRTy8754Jsl5/rHJDkMaUI2
	RanOJICrfMY+ftkl01cN5IazU+HE6COHK8a7QHDQwgKLPY6HRZe35gwHyHf4X8nMHJ781RrfKMX
	v1GEaQgZCyT0u0vbFWQIFkZc0OzDraUV41OV0p6wbDNmV9rv6HPTb6+I=
X-Google-Smtp-Source: AGHT+IHCAco3dix4SeXXeBndwnRv6Pfh6h/t8TAQcLDEPfWPEM2mQrjmwcNGarXeRJEC4DFtnSWp6gazgUXuUrroCaJIo16Zcoq+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c09:b0:3d4:700f:67e7 with SMTP id
 e9e14a558f8ab-3d88ee3d549mr163841275ab.17.1745349760467; Tue, 22 Apr 2025
 12:22:40 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:22:40 -0700
In-Reply-To: <66fcb7f9.050a0220.f28ec.04e8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6807ec80.050a0220.36a438.0001.GAE@google.com>
Subject: Re: [syzbot] [PATCH] Re: [syzbot] [jfs?] KASAN: null-ptr-deref Read
 in drop_buffers (3)
From: syzbot <syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] Re: [syzbot] [jfs?] KASAN: null-ptr-deref Read in drop_buffers (3)
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cb82ca153949

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 fs/buffer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/buffer.c b/fs/buffer.c
index cc8452f60251..e65a754176c1 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2883,6 +2883,8 @@ drop_buffers(struct folio *folio, struct buffer_head **buffers_to_free)
 	struct buffer_head *head = folio_buffers(folio);
 	struct buffer_head *bh;
 
+	if (!head)
+		goto out;
 	bh = head;
 	do {
 		if (buffer_busy(bh))
@@ -2897,6 +2899,7 @@ drop_buffers(struct folio *folio, struct buffer_head **buffers_to_free)
 			__remove_assoc_queue(bh);
 		bh = next;
 	} while (bh != head);
+out:
 	*buffers_to_free = head;
 	folio_detach_private(folio);
 	return true;
-- 
2.43.0


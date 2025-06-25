Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DA02868AD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849549; cv=none; b=qJSG4F1dHjxtKTGsSzA+nZy7Pf40Kx+GLGpQnxmbFF4RHajMmBA127Znpyro7pXbZju7F6w+EIYsH2XZttY3B2jiJ2w/4yqLtWNPU54qWwM0HGYv/cuX/r4oUUCnuKxM2k1/Wmivx0AeFZk62ERXpkhpM2unAtT12rR8zcwSBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849549; c=relaxed/simple;
	bh=vyRKtZy/2kPcnMWv/9m64yZU2aTVrPZeufxUwnEHYT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LhmNNZu9DN+tHbRzzFx0e9njwgCxZS/2Ml91aSe5EKl2T2HQqIbALW0ylSsMNZI03L28C9FpAh6hFTVjKTXM/BQAoeFRem5nzo1AG7lE2BbSx+I3HI0duYwFRnhUHcLdsSEBIKpZ2XR2NPms3U5xiyl/i6ABhi0ahRbgseHL1tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fnb94Nxu; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fnb94Nxu"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747e41d5469so6605030b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750849547; x=1751454347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNMyLG0/0oSyVY4Kn9SLnpAitEEY4h0zMz72v9Ot1R8=;
        b=Fnb94NxuVaO00DRa2hzgfPvDxmj20hbR21LjrjFRwgl74L4pAFHJj3lWARe8R+G5bf
         J78hfrstq76j5uz25bzZaWh1Y6oqGvHHR7luGqbrP6bXcan8IBBkDAnoKGEMJGHz1awR
         8t2lVkkfBkN0N/hLktBEvqlSJ57hHBAMdIgtfLiYRZ09uq/JMLI1AMaus86y1Wjay679
         sTm5ZMz5mdwl0tiHbHLrULh4C4irl6VrbtfHM9pDeBIYgI/WBmCE6B0nzjgNqs1L72vY
         UQ7GD6OAxIPDPMvDttEJ5o3OAuIgvi8OBW37wvjY8WnYlr3U7b5ZhmFCsCyENoT9kX6C
         qcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849547; x=1751454347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNMyLG0/0oSyVY4Kn9SLnpAitEEY4h0zMz72v9Ot1R8=;
        b=O/0toLCGWDa2pJ5w0UNodkdtLfOblUCYIWQp9Lw+CHXZqEj4U6KlIb4AxC34Dz7a83
         jYOwJaTBxcB2B5u1R2yT0+/KbGNsg811ddr8YMAlM1J17+wTlbu0yx4qg/E4Zgup0fTQ
         r/FnqMeoqM/Dz3UmoqCAnRpBCNw65p1IAj2AWQIgHZgo0SsVRR8a2+zvYRk4nyprxvOC
         wkf/2fvTKycEyNsIX5QRrp3x1lt0B8TpJrSAtt0zgj5V8etwd0HnPoY6QzuxavXvTyjn
         XV39ohGV+nWXJqOjAJL2t3cEkjhXeIE9Y3O3V1HUXi0t2OFry67YYPrcVa987feOoKNF
         5YPA==
X-Forwarded-Encrypted: i=1; AJvYcCVvGD3mHcJhCe5OhIlTr4HmKVdMuG0K23J7oojkQPF7wq/ATILnTU1n3RHe/P4IL5N4DM7upChzfK0PVaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaahGboU5xdJWDfBOEVLpSBpzA9t1dmNNkKIDhVsCtiV6izvkm
	IJb48f6LF9fNrwTlOmHuBxhWDTbUVhwklrCG2/pLiklvYXEOZEPmOLeF
X-Gm-Gg: ASbGnctKaNKStQUliEd9hZ43SWBgI7MjsI6BYZiIIFxHLm7A+xlS+SXSkKCe+e1puvM
	cmKu3WjQfhDRD50Fjl+WxRsLwirc3DaCGw5jC9FNEo/qAACcYVqD8O2Mgtzx1tog0DcdX9rDams
	3vLBkFWmDcnOkoTAoqoHIBhmG9AvPbaMW/q8VVm/APFbVzX2kR/buL6Q6zoDd40VTOJVaT/+H30
	wqicrxo5luP/iFZSf5cJAPLCkQt9JmWqYjuDj5l1JLk0AbaoHvDJbQO5CaoHYZmfI0V/lwQUFf8
	Oii1q2Tg5krD1V7Ofgfy6eoXcYTRYmJ1Yh7qZ1gyNxjXFlmRJa3OIqmbInIbP00R7t31z7xE1VB
	q4+DuXG18LGGeQEc3NzA=
X-Google-Smtp-Source: AGHT+IEysA6hmEMCHBftoGPxxrMX8x7rQIN8t6NhhCljZQ1qJAhej2tYzOSCXdyZVbFj0sKLouB8Nw==
X-Received: by 2002:a05:6a21:ad1b:b0:217:ff4b:cc57 with SMTP id adf61e73a8af0-2207f31cca4mr3128157637.39.1750849546835;
        Wed, 25 Jun 2025 04:05:46 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([2401:4900:88f7:9fa5:cd1:28e1:73f6:ea42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f12423d8sm10710622a12.41.2025.06.25.04.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:05:46 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: chao@kernel.org
Cc: abinashlalotra@gmail.com,
	abinashsinghlalotra@gmail.com,
	jaegeuk@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Subject: [PATCH v4] f2fs: fix KMSAN uninit-value in extent_info usage
Date: Wed, 25 Jun 2025 16:35:37 +0530
Message-ID: <20250625110537.22806-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <29dac4f4-3f46-49b6-8a9f-c26ffcde11d0@kernel.org>
References: <29dac4f4-3f46-49b6-8a9f-c26ffcde11d0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reported a use of uninitialized value in `__is_extent_mergeable()`
 and `__is_back_mergeable()` via the read extent tree path.

The root cause is that `get_read_extent_info()` only initializes three
fields (`fofs`, `blk`, `len`) of `struct extent_info`, leaving the
remaining fields uninitialized. This leads to undefined behavior
when those fields are accessed later, especially during
extent merging.

Fix it by zero-initializing the `extent_info` struct before population.

Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b8c1d60e95df65e827d4
Fixes: 94afd6d6e525 ("f2fs: extent cache: support unaligned extent")
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
v4 : Added Reviewed-by and Corrected Fixes
---
 fs/f2fs/extent_cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index cfe925a3d555..4ce19a310f38 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -414,7 +414,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
 	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
 	struct extent_tree *et;
 	struct extent_node *en;
-	struct extent_info ei;
+	struct extent_info ei = {0};
 
 	if (!__may_extent_tree(inode, EX_READ)) {
 		/* drop largest read extent */
-- 
2.43.0


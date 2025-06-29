Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641DE5661
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751229770; cv=none; b=nEIXJ2CNUnGh9AphVcOaQ4at2ROf9OWnIifV5zD1Vs1aBgoXpa+XIYtt4voAMCV7yfsI+EN0pzZI0Hd+zj7AcqHhck6vpyLWeKqanviRq/08PKlXya6H9u2edofCSDzSifEUlF2gPp8PGX1rsdg5t3+7bIgYzI+ETT6AqcsplSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751229770; c=relaxed/simple;
	bh=eaSXSBMSqGf+Agp7dTdZvJTsSniXtktqXNV9fsii5TI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXpvIx6HbeKoW+odbcPl/b3Ng/LU4DD0lH53qDUg++tdGGAKLPPyhBmgvZ/eEdMtqtTZOlDnQ+9hPxO0EdukhhxG3FvJZ54HiQi27epHHzMbXVPxxaIMLV+sRuc4PgyXKncNlOvKvVqVJf7aT11RH2C6R3EoTPtF3ySPMjW0I94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd8L5oIB; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd8L5oIB"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b34a8f69862so1375191a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751229769; x=1751834569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DirJRH7MmziZYdVMjQqFRTAlkdP6s2rnfn3J0zzduXE=;
        b=hd8L5oIBSnW86gYSkyOsgUokpIS/JyAWnFumR2IdAYF+1zbM2jE4Qwft1py2ATUJZ+
         n0tYiY/hV6htKe/GnJr1hctRS+49ZE8VV+v1eMNpBYBTLRqB37qxta5Ll9YllYEtHq2G
         Rxo2jdJPf4fzec1gLBAoHB46D6Ui2qqI01PNZMdSMsSTsKl83UEZ0IsXzYkcfALCLTlQ
         MWBHI3BU953dL85ZTNFfR+FPeGxAoFymPJtumXpt9CaK3gdsEw3cZhhUP7o5e2dT2PQw
         Z5SRiMupc/v07KVsYy91x+x2G+4WjFFSJkGvQJ6VqsjRhEADrEiG9WOqxYjBJGSMNews
         qVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751229769; x=1751834569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DirJRH7MmziZYdVMjQqFRTAlkdP6s2rnfn3J0zzduXE=;
        b=rVhxbTcKSXHvsQ/eaXOcidid/5jjrwWddDX0JvOE5PJRVRqEZLqXtaeinsVlrynSkd
         8NuRJMdQQL39rS4eKTva1T/OSFJNpKO/ukPFKSblHJVD9UNr+m0LC4NI0z5RhUiSUAOM
         fhuI/MYv+ihlC0kKnLhfDG8B59H0ALBDP8neuSv1HhEvsysptdT58d/FgmedoL24nYvY
         LkG4LoSZp05dFVcvl09NkrF1B6cfqj1nGo237oKRUhWL09zqJgJs/MfvzEpSJhLp6mwY
         rBiIs16EIE/D463k4J9I3ZJq6LZisNqBc34RKVY+R9ZCdzqMngs72s3vAiYdghzVn9ah
         3fYw==
X-Forwarded-Encrypted: i=1; AJvYcCWpnkgQ6jhsvBwQ2EEmBf+ABjkzXFBPvPxkhw8DaqwI56QiQIaJXW6XUzV/d3RIzRY5TjTF6edGeL4qCpk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7lnoF4hofXEFx5QHBf4fnJ0E3o27qP1YG8fN3qf/KsL7SLtU+
	d0+q9ypf2YMtWAof5ktHNt/3m7Uan6xlkx/RMD/XCg9Hcnp7sHmBDAze
X-Gm-Gg: ASbGncvZlupmluBfBN56bbXoITC4Gd/DvL6lxRt9by00ptp47kV1sL1y24/v9qsvQSp
	H0k/eehTConF5D85bQLq28kJCWex3K1KBbusu9NBhx0Qbr+BiM5rpZHW+Rer9Svxdm9kDAw4Mrj
	KlP/dAOKCWrSuAEoreV+XW9iW/3RMPku7l6NIEOCXAsDw9p4CXyI7gnSSvdTclnoCf7naVoaD63
	TRiWHlZKL/tYDUhurQgb/qFME6QpRAUWwjjyy6T8/UZT2zPk5/m2xSDbGRYOyQE7aWDk4CHE8mX
	LFoqzx1782v1IIbwwEmeWXxL8rHQCgUD6bDYqIeKH6FQ6RKh+PQOfSHr91G/oXBz55jSlI1JtFq
	3dyEYcj3DvJEoIpfDAPE=
X-Google-Smtp-Source: AGHT+IE4jl+a6y/SeKsfFaCxOplJiF004IBZL8OwquCVNHRD2+gPLNctbva44/6kHL7gLJq8LE+UVg==
X-Received: by 2002:a05:6a20:3d08:b0:218:9b3e:e8bd with SMTP id adf61e73a8af0-220a12a662fmr16637049637.10.1751229768632;
        Sun, 29 Jun 2025 13:42:48 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([2401:4900:88e3:d68:d7d3:6fa0:fee9:8056])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e301f704sm6348327a12.18.2025.06.29.13.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:42:48 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically allocating gntdev_copy_batch
Date: Mon, 30 Jun 2025 02:12:15 +0530
Message-ID: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While building the kernel with LLVM, a warning was reported due to
excessive stack usage in `gntdev_ioctl`:

	drivers/xen/gntdev.c:991: warning: stack frame size (1160) exceeds limit (1024) in function 'gntdev_ioctl'

Further analysis revealed that the large stack frame was caused by
`struct gntdev_copy_batch`, which was declared on the stack inside
`gntdev_ioctl_grant_copy()`. Since this function was inlined into
`gntdev_ioctl`, the stack usage was attributed to the latter.

This patch fixes the issue by dynamically allocating `gntdev_copy_batch`
using `kmalloc()`, which significantly reduces the stack footprint and
eliminates the warning.

This approach is consistent with similar fixes upstream, such as:

commit fa26198d30f3 ("iommu/io-pgtable-arm: dynamically allocate selftest device struct")

Fixes: a4cdb556cae0 ("xen/gntdev: add ioctl for grant copy")
Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
The stack usage was confirmed using the `-fstack-usage`  flag and mannual analysis, which showed:

  drivers/xen/gntdev.c:953: gntdev_ioctl_grant_copy.isra   1048 bytes
  drivers/xen/gntdev.c:826: gntdev_copy                     56 bytes

Since `gntdev_ioctl` was calling the inlined `gntdev_ioctl_grant_copy`, the total
frame size exceeded 1024 bytes, triggering the warning.

This patch addresses the warning and keeps stack usage within acceptable limits.
Is this patch fine or kmalloc may affect performance ?
---
 drivers/xen/gntdev.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 61faea1f0663..9811f3d7c87c 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -953,15 +953,19 @@ static int gntdev_grant_copy_seg(struct gntdev_copy_batch *batch,
 static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __user *u)
 {
 	struct ioctl_gntdev_grant_copy copy;
-	struct gntdev_copy_batch batch;
+	struct gntdev_copy_batch *batch;
 	unsigned int i;
 	int ret = 0;
 
 	if (copy_from_user(&copy, u, sizeof(copy)))
 		return -EFAULT;
-
-	batch.nr_ops = 0;
-	batch.nr_pages = 0;
+
+	batch = kmalloc(sizeof(*batch), GFP_KERNEL);
+	if (!batch)
+		return -ENOMEM;
+
+	batch->nr_ops = 0;
+	batch->nr_pages = 0;
 
 	for (i = 0; i < copy.count; i++) {
 		struct gntdev_grant_copy_segment seg;
@@ -971,18 +975,20 @@ static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __user *u)
 			goto out;
 		}
 
-		ret = gntdev_grant_copy_seg(&batch, &seg, &copy.segments[i].status);
+		ret = gntdev_grant_copy_seg(batch, &seg, &copy.segments[i].status);
 		if (ret < 0)
 			goto out;
 
 		cond_resched();
 	}
-	if (batch.nr_ops)
-		ret = gntdev_copy(&batch);
-	return ret;
+	if (batch->nr_ops)
+		ret = gntdev_copy(batch);
+	goto free_batch;
 
   out:
-	gntdev_put_pages(&batch);
+	gntdev_put_pages(batch);
+  free_batch:
+	kfree(batch);
 	return ret;
 }
 
-- 
2.43.0


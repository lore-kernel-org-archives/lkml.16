Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7C41E1DE2
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524925; cv=none; b=kbQUpkazyq8X3Rn249/ILs5lGlec5DUW4c29OIuVJpMgJSGRijoByjWTtZJupYkl+P9/Ss2EQ1CcX7hhs9jEIYwEYgEjCXb+DS2MBptVhmp9BXFdAOOwhfYVOsHyvLJrv7Km1o8w9rCJxKjbxi+GUYEiLYXfy1ivU2dXbiKWXkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524925; c=relaxed/simple;
	bh=yARVJ3xJ3JgrRQ2uEW2EIYoT+XDNijkk4+OGd3BX42I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/Q/AWw0/tH+8HazkEmM/TvNmyWzVgoVg9F2sfKdRrJ1PVFZrMbv5dPz8xUT0B/VWqpsZsE/7IFfn06JXXQQTR5qgd08AM4o/zBMOe/j0OL8LnNOtmsYgqezJKwt3iJt1p9PoxozQfj/QLKw2iOJd6VaPM7bYCxaA1T9oiS8B8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IrCHrp50; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IrCHrp50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Wx3gy
	NU/yA0NxmdhOD2r8ZlEsWhxsPF9Y05S/IbtjvU=; b=IrCHrp50xjLBv8SYchE9p
	wCDv+iD0DukM5BY3ujh8ZedWghiyCU6Ia3U+Jos8yqtpH4jURlOLapMtVV2jkiZM
	difcBOo3PJ7FegAmK6mkxlg0VQbOaz5QjAKdyeGbvwosD7C/BIFZ8VvUbAwEqply
	iYsB+lS/D2Fv29sGhz5qO0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wAHzmK_2hloI9kMFA--.14234S4;
	Tue, 06 May 2025 17:47:48 +0800 (CST)
From: oushixiong1025@163.com
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sean Paul <sean@poorly.run>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v2 3/3] drm/udl: use DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS
Date: Tue,  6 May 2025 17:47:40 +0800
Message-Id: <20250506094740.621420-3-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506094740.621420-1-oushixiong1025@163.com>
References: <20250506094740.621420-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHzmK_2hloI9kMFA--.14234S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDtrWrArykJF13Xw4fZrb_yoW3tFX_GF
	4ftwsrWFZ8uw4Dur1xAFW5Aryj934ruF48WF1Uta4Syw4xJw1Uury2vryvv3WUKF45AF9x
	J3yDXFsxAr4kCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8YsjUUUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYwlFD2gZ2bcW-gACsV

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
   udl 2-1.4:1.0: swiotlb buffer is full (sz: 2097152 bytes), total 65536 (slots), used 1 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
v1->v2:
        patch rebase.

 drivers/gpu/drm/udl/udl_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1922988625eb..b5fa5854c051 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -57,7 +57,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
-- 
2.17.1


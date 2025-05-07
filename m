Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F1D205AB9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611323; cv=none; b=ultlQif5C9Zz07HM2BdLMDueWVKTTfn7lqzpi4SNrSleVsHGnXu/Q7DnhcX3dHwyaN/jQMHLUwBEMtTSIVM3ZDCgm11lqzoTUtrMJ4MFhtBwh418uLtHc3bkSAhIT4C1DiYh52CukC6cWjYPpGY1x1KKbEjsG163UQPlx966+IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611323; c=relaxed/simple;
	bh=oe2iLbdMW2igYlRovUli17NXYbZYVAc9+xAChSjWPI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pz84JjqM8ArMM0HEp+5mqz3u05XCHKD9N7LKLVkPWJZ3rTP1j9hWaxQWnJ0NZb4Xrvp8Cu6Umru3OqqhZ/mYQxxMawG8tLBVkfiZXCiBdzOj1WjaeR05qQdO0S9BfCJvNkDTME3Wp+yzAcse0etCIvSdZy/KlkRO+A7xK3KdSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=K+2KUERz; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="K+2KUERz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BQHLC
	DBcHCYndNzTVgQbrhtOcaXMaNx6k06Orz9q5NA=; b=K+2KUERzEgO++ms1vsTju
	wBYuziRKwapSjl+wg55bW+p4sF2FMlSHStVNsC+oCr5zWGJa7oLKNWiCO7A92ra/
	geB3lozL5JsheedfrIjWZ4+RI5PJT6U58z4EFpFuLecarRwudxHrkczimza+PeYL
	+PKDFA5hdSpQ7PTwiOek3E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCn0Sw2LBtoPOJREw--.58097S4;
	Wed, 07 May 2025 17:47:39 +0800 (CST)
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
Subject: [PATCH v3 3/3] drm/udl: use DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS
Date: Wed,  7 May 2025 17:47:28 +0800
Message-Id: <20250507094728.603302-3-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507094728.603302-1-oushixiong1025@163.com>
References: <20250507094728.603302-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCn0Sw2LBtoPOJREw--.58097S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDtrWrArykJF13Xw4fZrb_yoW3urb_CF
	WftwsrWFZ8u34Dur1xAFW5Ary293s5uFs7WF4Utasayw4xJw4UuryIvr4vv3WUKF4rCF9x
	J397XrsxAr4kCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8YsjUUUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXAZGD2gbJDqw1AAAsa

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
   udl 2-1.4:1.0: swiotlb buffer is full (sz: 2097152 bytes), total 65536 (slots), used 1 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1922988625eb..cbfdcb75f1f2 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -57,7 +57,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_FOR_VMAP,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
-- 
2.17.1


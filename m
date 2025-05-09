Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7E94B1E7C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783302; cv=none; b=VRgpnnL4JItJFXY5ZqOS4+Sd2zGlFfQ0JmPVJxDdr+bAdHrDlZJoM+/bb18uKkJz6x3ZCEPvVssBNwiOmXLGGC/FfD87IDir5RqEBRBq0bywF8GEs3YFmmc+zTwEtpC6IRqR47aQiWVpllstsh+jwauh95kwq6XeMGW6o20NzSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783302; c=relaxed/simple;
	bh=IGOiQufy/ix3dQl0h7a7DaJ3f3/104DH1h+c3Ih5A1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HWdKELlVvWK+f8DMNq7ywhId+hK77EH4VZBCA9V6fYkKxdRtYX6eYPrdEgVlZFkWRsMPvTv3+z8O6wGsGOG4A8DcL/KygkW4ax4QiVA9s7ErEigObHuHLZt7u3Phe4Q7Q2HSxAD5Os7I+5gmuJt5Ddji1Fxm/tYffPPoAdxVPbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cRPXOmO3; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cRPXOmO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=KF
	YDVANZUJKYsNKaSyyJ/zVwgimw3KYp86b0+m488uo=; b=cRPXOmO3/TeoWpZLGS
	J14psE8Kr4G4XDV1mGc8wq3L1jQ4tGoYUx+KZFPkb9bdZPxpMaAi76KPCLaV6a0R
	3ksO3M8E9LB0bls701nfbh3IKiWfVOrgFrP3ZFYDAgqgxyidy2sKrzrQ0ELTy/u1
	Lx6U+OePA3WqWZyzYH542YCss=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgA3fmEVzB1oyGRhAA--.7417S3;
	Fri, 09 May 2025 17:34:16 +0800 (CST)
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
Subject: [PATCH v5 2/3] drm/ast: use DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT
Date: Fri,  9 May 2025 17:34:07 +0800
Message-Id: <20250509093408.611642-2-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509093408.611642-1-oushixiong1025@163.com>
References: <20250509093408.611642-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgA3fmEVzB1oyGRhAA--.7417S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWfCrWfKr15Gw4rXw1fZwb_yoW3uwbE9F
	10q3ZxXrWDua4Duw1Iyay5ZryIvr15WrWfGF1Utasxtw47tr4UZ34vvr4jvF1j9F4xZF98
	Aw1UXF45CFsakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8b_-PUUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYwRID2gdt39r5wACsT

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
  ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/ast/ast_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6fbf62a99c48..054acda41909 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
-- 
2.17.1


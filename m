Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBFD221299
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746760907; cv=none; b=Nx7Xr1lQ/bWPnLbftFgbwErxDG+/NCMwzaGTipS+PdoH3MdOCwmoFeptVvqE/XnMSzIRJr/LwZnzBWjl2PlzMOroqmdwXUF+KsKE9e61holLvN6U7CSvCOhnWUGzmNXWARVcXkxYAVyCBtSPq5F2ZTCJkzT87Y8kXCFBzP/cxYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746760907; c=relaxed/simple;
	bh=+on8D93+NbwIPaFwicB40yIh6rKPIGjUUp3vhVPTcAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hwmXt2lAaLauPXfE6wu61Xv3Moht1aIj6CSWkMMXQ3fnV/X+hnYz7bhIOm+uylphilbpdEoroeWcF9oxzcsJ38eByNdtDiWn1P5CDZRpjpgS3PCoFouPSJ6Tbix3iJwr1RTieczdT4Q6Sr5ZeR/o7iFYlvHo2Q4kArhbfFEkZBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FcadZueP; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FcadZueP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=OU
	uau8ngN3Zu4awKzPJSl+JZSPqgEV0KCFfOgXmVNvA=; b=FcadZuePXv6SjtdK57
	H5CJCZbrk/m+HEOCGGR7jc8hPOYbDRCn5ksANRi9Okkz5Nu1JdGeiTMNRooVHBfy
	VcoCqWBfTh4WTVzyAYyCniBYkHiImmCMNa+8WqcT9v6BxY551fKcRMzfq0JogBet
	D8yTnzQLfOK0WY4E3iwxzd/pA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXdfCKdB1o2Hx1AA--.7654S3;
	Fri, 09 May 2025 11:20:44 +0800 (CST)
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
Subject: [PATCH v4 2/3] drm/ast: use DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS
Date: Fri,  9 May 2025 11:20:39 +0800
Message-Id: <20250509032040.185730-2-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509032040.185730-1-oushixiong1025@163.com>
References: <20250509032040.185730-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXdfCKdB1o2Hx1AA--.7654S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWfCrWfKr15Gw4rXw1fZwb_yoW3uFbE9F
	10q3Z3WFWDua4Duw1Iyay5ZFyIvF1rurZ3JF1Utasxtw47tr4UZ34v9rWIvF1j9F4fZF98
	Aw17WF43CFsakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU88-PUUUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQ9ID2gdcFh0AwAAs-

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
  ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/ast/ast_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6fbf62a99c48..8efb8ec89f50 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_NO_SGT,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
-- 
2.17.1


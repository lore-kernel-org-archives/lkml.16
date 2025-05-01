Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CEB230BF2
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 06:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081848; cv=none; b=N6sFoeP+XTM1+K1/duax9/BDDk9w4NTkqt6fXUab5XBrqFpXVKpFIyLKLbUxFPLfh1fRAjooxQPpcPtjkeoOGFzRyttl/u5noUCcyymTPxAntNFwIRkaLPQnKMtgw5uUJfumawnn5ZUlqFzsrwZAsJ8vkF0+8Lq01L5rVZ36/uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081848; c=relaxed/simple;
	bh=XQdOzQ/IWIZAPHH/V16CjfRIpKxGpe21Cf8rGR8kS/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NLlTVVR3YQSDopCTBgGi7R+GG5qToztMzQeX3ZZAMNxBcjkdhnsHEVGICDiKsDk76Psz9MaUURRJai733GOvgsOZxdTYoSvUdMp0X+NVPW5pk36qYxvKRrG01CiElREVeGsVMkUqI7tpRjUjDUfZBBXHJPFUSHWo2GIsBHrSqxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hsP4OaLx; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hsP4OaLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=AAfXW
	sEd5uWoquOBBEcG/ZJ7DJq02VNrQQYiqnWq1nI=; b=hsP4OaLxGluUj99d+mZ4F
	ZWkr8nBeEugXNZOUaQ2ZT01hI8RHTRMZqiTFvFX26d4+ZtqJpAXFxo08tHpd7tpM
	VWekiveI6n3Xlkirm6L/EUYbhjcutcKcrsmRL1CPyJLxnH7UAQjzQ68HqovWJye9
	W9iHy0JmYGgaPx1kcMCg1k=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCHtnsNGBNoXyLXDg--.28203S4;
	Thu, 01 May 2025 14:43:29 +0800 (CST)
From: oushixiong1025@163.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sean Paul <sean@poorly.run>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH 3/3] drm/udl: use DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS
Date: Thu,  1 May 2025 14:43:24 +0800
Message-Id: <20250501064324.398650-3-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250501064324.398650-1-oushixiong1025@163.com>
References: <20250501064324.398650-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHtnsNGBNoXyLXDg--.28203S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyUuFWrZrW7KFyxXw4kXrb_yoW8WrWDpF
	4fC34IkrWIqF4ktF4fAa1xAa45Ca1xGaySgr4xJwna9wn5Cw1kJa45JFyFyasFyry7AF1a
	yF1vyryj9F40yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8txhUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQdAD2gTE+xLHQABsG

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
   udl 2-1.4:1.0: swiotlb buffer is full (sz: 2097152 bytes), total 65536 (slots), used 1 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 05b3a152cc33..8107549b12e5 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -49,22 +49,6 @@ static int udl_usb_reset_resume(struct usb_interface *interface)
 	return drm_mode_config_helper_resume(dev);
 }
 
-/*
- * FIXME: Dma-buf sharing requires DMA support by the importing device.
- *        This function is a workaround to make USB devices work as well.
- *        See todo.rst for how to fix the issue in the dma-buf framework.
- */
-static struct drm_gem_object *udl_driver_gem_prime_import(struct drm_device *dev,
-							  struct dma_buf *dma_buf)
-{
-	struct udl_device *udl = to_udl(dev);
-
-	if (!udl->dmadev)
-		return ERR_PTR(-ENODEV);
-
-	return drm_gem_prime_import_dev(dev, dma_buf, udl->dmadev);
-}
-
 DEFINE_DRM_GEM_FOPS(udl_driver_fops);
 
 static const struct drm_driver driver = {
@@ -72,8 +56,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
-	.gem_prime_import = udl_driver_gem_prime_import,
+	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
-- 
2.17.1


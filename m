Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5699864A8F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 03:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746760888; cv=none; b=t0oTwlDxmad69cWKg4143fG+5ZO4XSP63DdcoVgGkmTmKGBPJepvJHxdOQX+3FkZeGqHt0uQt5oa3eKULQSHPD3KJpyyPJWc5WS9wYEILBDnqpxo23nhMtGWIEbrL6rBSSt5vKd5+lpwwmFJL7lMiw9RTg81KystJWTKv5E/9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746760888; c=relaxed/simple;
	bh=TAFGggvGD8kUsAWjA8GSgPLFofW+oxqL5S7UnszTOrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iIw2w3zGfzD1QWZgzG3TsE8ZwcZjAcwOLg3nS5oPpvYUO/6HcyYVstADZFeIJMRCxhb1vVkTNh2W2+WeC2DYjE96X8iOEQZzDxVOeD6NEt7pYKfIbRBua91cV3y2bWCuW3miNkZ23+bMi2mBWFxu+/OX2oEW3Z3dyG81Y0mWsb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AVIMuKl0; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AVIMuKl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ph
	KIn8xb8XbVXQGCQjiCBCqZi+z6O78hdDfrHAQJV6E=; b=AVIMuKl00lo1q/Lms4
	6Y73Tu1IXKmKAiaeoBIWQYYQjDsD4fYLa3zisZL3qq7+UrslFaoJMIEMNyrJTZZw
	M++WvXioo000IZ4JMpExwicWJXKQOwUydXFU1qgzBjXMu/YiKVkYLJ1Wab8N6Hn7
	njNgcuCvGCFM6Wb+JVRfq9zmI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXdfCKdB1o2Hx1AA--.7654S4;
	Fri, 09 May 2025 11:20:45 +0800 (CST)
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
Subject: [PATCH v4 3/3] drm/udl: use DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS
Date: Fri,  9 May 2025 11:20:40 +0800
Message-Id: <20250509032040.185730-3-oushixiong1025@163.com>
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
X-CM-TRANSID:_____wAXdfCKdB1o2Hx1AA--.7654S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDtrWrArykJF13Xw4fZrb_yoW3Zwb_CF
	4ftrsrWFZ8uw1Duw1xAFW5Ary29a4ruF48WF47ta4Syw4xJw1j9ry0vrWvv3WUKF45CF9x
	J397XrsxAr4kCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8OAw3UUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYwNID2gdblKwZQAAs7

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
   udl 2-1.4:1.0: swiotlb buffer is full (sz: 2097152 bytes), total 65536 (slots), used 1 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1922988625eb..9c385771b483 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -57,7 +57,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_NO_SGT,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
-- 
2.17.1


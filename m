Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E029221D8F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897700; cv=none; b=hCcwuT6rU+fB1/YGs1OYBWdtOj1kuHQYmrwP83IIdahMovWFKDFBWcpwZTweHm+tx5wjWoM1eEKdVk/TW3B8gr4+2hhDTowqEDwNykcL+mcrDFCUjrr9Zeu/U74bIFp/rMZrPFtN7T+PjJsoGpvJ9JsJ6Tj8axo+ekBSQRHuDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897700; c=relaxed/simple;
	bh=IGOiQufy/ix3dQl0h7a7DaJ3f3/104DH1h+c3Ih5A1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CEL2STlnLMAemMJI4cmXYrgHAsr03K6J9ZBuV9Gm0iKsK9ilSrhK4kWjPPys7zXgjbYbANAvNQmFZOOxQ8toptdaUkG7UQOuHhkNBNU45Fa/cMMXfSZRlIlfXH4/nicUmU3FBYkfA6xd5P/ujl/vKM3SjKo0FhQaAuZF+z1N8HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RC5rPorM; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RC5rPorM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=KF
	YDVANZUJKYsNKaSyyJ/zVwgimw3KYp86b0+m488uo=; b=RC5rPorMRdDOy0SBT0
	rhrV3viKV+oGg2jQepf1iSDqMQIGbWCMthPOTjaDWQlE67BrIvRpxpYU6kvC5rPc
	ftfswqY7RcFhx7qjjj9LkJcqbtklZJkyJ1qs8N/vHOBhkIpWrpep9am8bGRKnvZY
	DvUKrt0UdCRGcPpu+sHn/g5dA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC3TPQpzS5oHcJjDA--.17971S3;
	Thu, 22 May 2025 15:07:24 +0800 (CST)
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
Subject: [PATCH v5 RESEND 2/3] drm/ast: use DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT
Date: Thu, 22 May 2025 15:07:13 +0800
Message-Id: <20250522070714.439824-2-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250522070714.439824-1-oushixiong1025@163.com>
References: <20250522070714.439824-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3TPQpzS5oHcJjDA--.17971S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWfCrWfKr15Gw4rXw1fZwb_yoW3uwbE9F
	10q3ZxXrWDua4Duw1Iyay5ZryIvr15WrWfGF1Utasxtw47tr4UZ34vvr4jvF1j9F4xZF98
	Aw1UXF45CFsakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8b_-PUUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXBtTD2gsLiHUmAADsf

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


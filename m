Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CEB27F16B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783301; cv=none; b=S8tkpxdI7vGM5n81XHrW5gfHq+wZkZW/vs2hsdP0cvz0k+xkEbbdTBTYCmpDnibcXyuhWdDV2uNF2skxTMqw0aTO9ruORojLKBpaas7APggkHOyuE/qB2eofng1Vf1bhydmeJR4JrWdSBtJvq0LYKsT9Ickl7+p68dr1gFyruUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783301; c=relaxed/simple;
	bh=i8odHOEXZ0/LlWqOD2Rsw7l00C6F6tf4TIPTTOf/pXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ifK9lh+hidDgc9ZoDLnwmkJmWbfJVQugMg/+dZpXaTpSSlkCsK1rd60qOeJscOpCI1xKeXSDn3oyrbCRZzpnulukyVUhke1/1e1QE32m0JDalp52nZbIVGF1F4Timzdae+bSN3+z+LKGGklJbjhNthgDzT1306/4lfMd9qbnCyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q6ZNHVAU; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q6ZNHVAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oS
	HaCqpmVSZUCNlkJRRPH5arZH3pbbqhuy+IBmltDeI=; b=Q6ZNHVAUJ8IupmCb8H
	dJ3Q9RG58rPh6gpSUXue7vnsBvp90tVTwTG4Og33L4JmBvroVgm6x7+YZEIDdPeR
	6pO9QorBkwg69PjdZslWPDzW73Ffei+x+K5tChtz2bBj3DPtRSrnWZ6s+pr0HV3b
	NjJMDhKoiU7k+/rOepkBE0hI4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgA3fmEVzB1oyGRhAA--.7417S4;
	Fri, 09 May 2025 17:34:17 +0800 (CST)
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
Subject: [PATCH v5 3/3] drm/udl: use DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT
Date: Fri,  9 May 2025 17:34:08 +0800
Message-Id: <20250509093408.611642-3-oushixiong1025@163.com>
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
X-CM-TRANSID:QCgvCgA3fmEVzB1oyGRhAA--.7417S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDtrWrArykJF13Xw4fZrb_yoW3urg_uF
	4ftwsrWFZ8u34Dur1IyFy5Zry29a4ruF4IgF4rta4Syw4xtw1jvryIvrs2v3WUKF4rCF9x
	J397XFsxAF4kCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8YsjUUUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQlID2gdxEzAPwAAsR

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
   udl 2-1.4:1.0: swiotlb buffer is full (sz: 2097152 bytes), total 65536 (slots), used 1 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1922988625eb..ce5ae7cacb90 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -57,7 +57,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
-- 
2.17.1


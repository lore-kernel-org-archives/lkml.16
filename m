Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2395B222581
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897704; cv=none; b=huqXCyYIpd1/pF6l2RheGjvjjzXaZbnE9t0j6IACXmpdC3vyX/zCZDSPBi0PW8EKuJqgsuOOd7pr7mKIRzLo6UbZm3HHmdY9/SBMurarojL0dF82AJ5RLrd8W1J0wfk89TN4m8/aygW4Z95waZVfVdKHF4TtyZtjnbSO+eG/ijs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897704; c=relaxed/simple;
	bh=i8odHOEXZ0/LlWqOD2Rsw7l00C6F6tf4TIPTTOf/pXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PqSAszE+UEgzmb/bJ90mnpFnl72vGeG8B4fYn+b9JQlnAYwOX8LQE1+3NoErLzyUmiWfDJ5EjoLdDKuKpcnFiLgXJghFT5TxKQw0UtvC2pDL8bJ4Q1Qpne/5KzTv3MnyhXj0Cdgb1xbSqA1dYetoPs54qn9ktHWkUXF2pbX8DNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oIgK5zXL; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oIgK5zXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oS
	HaCqpmVSZUCNlkJRRPH5arZH3pbbqhuy+IBmltDeI=; b=oIgK5zXLDWhi7b0u04
	A73gTuhWH5THecc7SgmkJUtfJdAYNA2vghGQgaRjuEFR4xiM3BlI0+5I5AmD9KpP
	eQstfhQvTX5ZUdHrlUk6Wq1GMTR/xYXSzJ4mEv4JGWdFJvZYl9F6FCVV/3oFSja+
	GNugqQZ2Rx8F3N7l7OgwHLipY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC3TPQpzS5oHcJjDA--.17971S4;
	Thu, 22 May 2025 15:07:27 +0800 (CST)
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
Subject: [PATCH v5 RESEND 3/3] drm/udl: use DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT
Date: Thu, 22 May 2025 15:07:14 +0800
Message-Id: <20250522070714.439824-3-oushixiong1025@163.com>
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
X-CM-TRANSID:_____wC3TPQpzS5oHcJjDA--.17971S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWDtrWrArykJF13Xw4fZrb_yoW3urg_uF
	4ftwsrWFZ8u34Dur1IyFy5Zry29a4ruF4IgF4rta4Syw4xtw1jvryIvrs2v3WUKF4rCF9x
	J397XFsxAF4kCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8YsjUUUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYxFVD2guxOrYlAAAsM

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


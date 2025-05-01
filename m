Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202E726D4E3
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 06:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081853; cv=none; b=GsphSH7kqPB9r2qDG7pQGZjxi5A135bPBEtRqi28fu3tDa/A/RHrxbPhKbNy32vPQtDsNsENEd4CWl6xPQsOwXuu2CiEAmSAt4WqY8aWXqu10w/9/oZTTo23uPwkjiQAHAm6y+QI51t+vHnC6Nmo5IAQyC5onJHpd7az+ajjzX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081853; c=relaxed/simple;
	bh=5sMTKF1jpkwChTY6gOqJexxLoFgjmmTFdCR2VqfRrSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iy9DuH3+1o4EFMehjvpDATOS7ydie+bMYUJcyppiDY+nLpg+ezYCpO2ibVxVVxXQckL61KJnoA9vLjze83s5YLCFZIrme4LqcPStspYpOxWHyGY1jKNltT+2z28E54msnXBD0QXqrgDegeKdi8I05eDICtTy9XSIrcqIWnhvNwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MXnXTKQb; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MXnXTKQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=OVCLR
	LpFKvXS9N9Z9M5wpx8Xetdjl5NDsdBiey0K5QU=; b=MXnXTKQbyEuO1j3mYOcVE
	H+58vg8tMDTxzvxfY/9w8wxXo4u8bh1qz/Cr9TjkgALVnKuwid01rflj/ZC5pHU5
	A/7CPTOafln3wuH0ktPpu+lZOiMcT5Iix0+aV25mr7oI6Hn8rN0yvf4IUuxRM3dy
	qaDvkx27f1UTBEOcqJraVw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCHtnsNGBNoXyLXDg--.28203S3;
	Thu, 01 May 2025 14:43:28 +0800 (CST)
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
Subject: [PATCH 2/3] drm/ast: use DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS
Date: Thu,  1 May 2025 14:43:23 +0800
Message-Id: <20250501064324.398650-2-oushixiong1025@163.com>
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
X-CM-TRANSID:_____wCHtnsNGBNoXyLXDg--.28203S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWfCrWfKr15Gw4rXw1fZwb_yoW3uFbEkF
	10qan3WFWDua4Duw1Iyay3ZFyIvr15urWfJF1Utasxtw47Jw4UZ34v9rW0vF1j9F4xZF9I
	yw1DWF45CFsakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8zyIUUUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQdAD2gTE+xLHQAAsH

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
  ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/ast/ast_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6fbf62a99c48..2dac6acf79e7 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
-- 
2.17.1


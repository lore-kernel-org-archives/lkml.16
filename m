Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D220102B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611319; cv=none; b=D7pgb0o0uLmRPysK+6F0tBilP+mq9XKimKNrpLdkT3sCjwkTtiX6VYvyExzbdBL+PiKNV197OrYCiYC1UJ/YC+FqE5lXjEvIF6gsFgbYqvkZkvALjMWLBLndzsBOcilnxh8X536Gthe9aOTqNLrFBGJcGE5jCA6J44chOpCAWSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611319; c=relaxed/simple;
	bh=E55NtfwtB28gprPcFuQyC4fPUd5/SSmi2oYbjJ8akhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h7FOvgeN+6lFTFouY+3+SV8QVuNCkWSDfFWpT/BJPMLe8svs0dD8vwohfmoZaV9DlP4hu0YbcVlOTf3++V4FFtUXSrE9IrKKGK2vCTEZOYpc0+91VROnHGhQB3Rw1tSB2JicwsaKflo/DQszFxZuj7BeK0LUyVKi3EjDrBrVPjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qYFaAZNn; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qYFaAZNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0ZHhP
	/CxGZHtKdJH/7NAAa54AxeBo79z1P920bna1RY=; b=qYFaAZNn7gF6GtNGTi/mA
	Q9m7Nr2KMEhoJGG3GVN3cHH7RjGo7DumsufzB7b8gdwAFN7FaKA8/q1uBjsxmGnJ
	5d7KI1kIEON54EAUIY/OcaEdopSZFIhOjff8aGUe6+WR0VHGx9j3y6dLyVGdV4zq
	WH0s2FqKW3pHb9xHoQBU/M=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCn0Sw2LBtoPOJREw--.58097S3;
	Wed, 07 May 2025 17:47:38 +0800 (CST)
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
Subject: [PATCH v3 2/3] drm/ast: use DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS
Date: Wed,  7 May 2025 17:47:27 +0800
Message-Id: <20250507094728.603302-2-oushixiong1025@163.com>
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
X-CM-TRANSID:_____wCn0Sw2LBtoPOJREw--.58097S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWfCrWfKr15Gw4rXw1fZwb_yoW3uFgEkF
	10qan3XFWDua4Duw1Iyay5ZryIvr1UurWfJF1Utasxtw47Jr4UZ3409r4jvF1j9F4xZF90
	yw1xWF45AFsakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8b_-PUUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQxGD2gbJmF-zwAAsc

From: Shixiong Ou <oushixiong@kylinos.cn>

Import dmabuf without mapping its sg_table to avoid issues likes:
  ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/ast/ast_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6fbf62a99c48..b626660e1fd7 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_FOR_VMAP,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
-- 
2.17.1


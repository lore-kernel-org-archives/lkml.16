Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6DB221544
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694152; cv=none; b=Gw+Y0SghsfE4umfVpUVy9U06vOyzTqvptjl1fPwbe2HQPh982RF8CERB5GvP9wY9fcmgFuOgjaARySz7XxFnV3lGpK2voxtCHXSkaPizl2z3AzrThw5WgcBF5aTlQhQ8/+Esgp+emZmYZ5E8gd50g2Et9pOS9bzUQnq82Vn/iXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694152; c=relaxed/simple;
	bh=TId6WnP0c/R/fv5j4StjJO9NdboY17rrqBwtziGvN24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqgCEtKQUJyZ97cvxPidOBjWP1yFHPY0ZR98r4dW4mw0Uy2tV0Fb/NDnA6ITe8K1EVKRt1rNkDg2e0T2udcnkIAQUZtk/5tODqwH03KLAMTJ/dHTFOxcjxiexHe1AaA0Dr7WzbisYNRQCg6ZU6gmClT7tRNx3JDpioc1e0hWPo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H9M6ArdX; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H9M6ArdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=6/
	GBVBQrueQTOo52t7yMjK40fijXSgB6E0CqsPdt1Mk=; b=H9M6ArdXIQYy2OgWxL
	eBFybNt83os07Zjnn9xx1GBmZiOdeJHiWRWwl8/A98oPdkOvgSh9u5gyXKXAlKF6
	1GYmPJegOWzzEI67d6GMPCTY2ey9gbHhTb+qeKfYBnuICW8bGyV7G1NPN2cTZ5O6
	e16cKUZ8yziYwMhs0D80iooVE=
Received: from ProDesk.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXPpLNbxxo9EHWDA--.1700S2;
	Thu, 08 May 2025 16:48:16 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: tzimmermann@suse.de
Cc: simona@ffwll.ch,
	mripard@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH] drm/gem-framebuffer: log errors when gem size < afbc_size
Date: Thu,  8 May 2025 16:47:57 +0800
Message-ID: <20250508084811.2472877-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBXPpLNbxxo9EHWDA--.1700S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4UGw4ftF48Cryftr4rGrg_yoWfXFc_Ca
	4xWr1DWw43CFyDZFs7ArZFy3s2yanY9Fs5Wa1Ygay3tr1UZw15JFyIqw45Gr1UJ3W3XryD
	Z3ZrZrWfAr1xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRX0el7UUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBNHXmgcbek6oAAAsI

Let the user know what went wrong in drm_gem_fb_afbc_init
failure paths.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 6f72e7a0f427..baf99a68bdb5 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -607,8 +607,11 @@ int drm_gem_fb_afbc_init(struct drm_device *dev,
 	if (ret < 0)
 		return ret;
 
-	if (objs[0]->size < afbc_fb->afbc_size)
+	if (objs[0]->size < afbc_fb->afbc_size) {
+		drm_dbg_kms(dev, "GEM object size (%zu) smaller than minimum afbc size (%u)\n",
+			    objs[0]->size, afbc_fb->afbc_size);
 		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.43.0


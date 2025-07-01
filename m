Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07F1D5CDE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367079; cv=none; b=aMG8vf14vd7R2l+k1ceLjMG7207wnC+AJACucemKhNJKdm+yIM6Z/VHyGo8B2az4S9w7vpWwshpCHEb1A2bi/DfRkvUbsudx1kf2r7RgN2SfYTpDT1s+m4slZ8D8nB/qZkBgyxIJxcQTbRAhAc21bPeuQSD8NcwDxXu73yJk9g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367079; c=relaxed/simple;
	bh=B1ageIM76CYeFiz/IR/5u5ZtiGofDdwmNOw8njBE8Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DijqM7JWMkV6jVIYRBaaiegvEUGfwMvfzxeXHLiIyJ5HlqjuJ2bcnl5EAHN53AKYhfoagKjbigMEzlzj3DCETw7/lMIviFXgUm7noz0LyekwHYikQ1Z/MGET5mjeBmGQmFrBvpP1jFOgQLywxVWG8k2VLdc6ztivTWy9y79xNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=orv+/qhq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="orv+/qhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E22C4CEEB;
	Tue,  1 Jul 2025 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751367078;
	bh=B1ageIM76CYeFiz/IR/5u5ZtiGofDdwmNOw8njBE8Ro=;
	h=From:To:Cc:Subject:Date:From;
	b=orv+/qhqCBjAjCmvMR7X4FGSHh02PkqLycMWFkKoY1zBqg+E4NDs0ddek0T/4SCJ2
	 AjKbNEEk47cTn0EG6x0HcYSoAwcIZwxuoSWpG94hAaIb4o6ewvSkY6BEKorjDOx3ut
	 5uagF3CzyiqKTXnG+ImB1WI5QRUk7/ukW4Gp3Mqs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5] drm/vgem/vgem_drv convert to use faux_device
Date: Tue,  1 Jul 2025 12:51:15 +0200
Message-ID: <2025070114-iron-shiny-b92e@gregkh>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3591; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=B1ageIM76CYeFiz/IR/5u5ZtiGofDdwmNOw8njBE8Ro=; b=owGbwMvMwCRo6H6F97bub03G02pJDBnJexd9ZveatVvbKOjp4t0aXqfOfNpvX81k3mxu2i4oU e7Oz7G4I5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACZivYRhvou03pl5ybc1nu1y r2EyN/rK71pVzbDg/FeV8IXs5YwtU36udKw6sGrdH4FVAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The vgem driver does not need to create a platform device, as there is
no real platform resources associated it,  it only did so because it was
simple to do that in order to get a device to use for resource
management of drm resources.  Change the driver to use the faux device
instead as this is NOT a real platform device.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v5: - rebased against 6.16-rc4 and resent as it seems to have been lost
v4: - api tweaked due to parent pointer added to faux_device create
      function.
v3: - new patch in the series.  For an example of the api working, does
      not have to be merged at this time, but I can take it if the
      maintainers give an ack.

 drivers/gpu/drm/vgem/vgem_drv.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 2752ab4f1c97..260c64733972 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -32,7 +32,7 @@
 
 #include <linux/dma-buf.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/shmem_fs.h>
 #include <linux/vmalloc.h>
 
@@ -52,7 +52,7 @@
 
 static struct vgem_device {
 	struct drm_device drm;
-	struct platform_device *platform;
+	struct faux_device *faux_dev;
 } *vgem_device;
 
 static int vgem_open(struct drm_device *dev, struct drm_file *file)
@@ -127,27 +127,27 @@ static const struct drm_driver vgem_driver = {
 static int __init vgem_init(void)
 {
 	int ret;
-	struct platform_device *pdev;
+	struct faux_device *fdev;
 
-	pdev = platform_device_register_simple("vgem", -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+	fdev = faux_device_create("vgem", NULL, NULL);
+	if (!fdev)
+		return -ENODEV;
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
 		ret = -ENOMEM;
 		goto out_unregister;
 	}
 
-	dma_coerce_mask_and_coherent(&pdev->dev,
+	dma_coerce_mask_and_coherent(&fdev->dev,
 				     DMA_BIT_MASK(64));
 
-	vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
+	vgem_device = devm_drm_dev_alloc(&fdev->dev, &vgem_driver,
 					 struct vgem_device, drm);
 	if (IS_ERR(vgem_device)) {
 		ret = PTR_ERR(vgem_device);
 		goto out_devres;
 	}
-	vgem_device->platform = pdev;
+	vgem_device->faux_dev = fdev;
 
 	/* Final step: expose the device/driver to userspace */
 	ret = drm_dev_register(&vgem_device->drm, 0);
@@ -157,19 +157,19 @@ static int __init vgem_init(void)
 	return 0;
 
 out_devres:
-	devres_release_group(&pdev->dev, NULL);
+	devres_release_group(&fdev->dev, NULL);
 out_unregister:
-	platform_device_unregister(pdev);
+	faux_device_destroy(fdev);
 	return ret;
 }
 
 static void __exit vgem_exit(void)
 {
-	struct platform_device *pdev = vgem_device->platform;
+	struct faux_device *fdev = vgem_device->faux_dev;
 
 	drm_dev_unregister(&vgem_device->drm);
-	devres_release_group(&pdev->dev, NULL);
-	platform_device_unregister(pdev);
+	devres_release_group(&fdev->dev, NULL);
+	faux_device_destroy(fdev);
 }
 
 module_init(vgem_init);
-- 
2.50.0


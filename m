Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5456822D4C3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887611; cv=none; b=XI+v1AkoQFkM91p1ruF/rk+9P5IyrdBf+e85wLtifoLFMP8Nd3zkx3qZ8LY94SlJdDDKxxMAiT08KoQ7PWgtPvmJ3skizuMRm4DwGI93gP8pKlzMyzngEpLkRx/0ghUzZdiar9NDFt+iMvoEu45+kXEkqMvyLIwaYQ/N/KMew8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887611; c=relaxed/simple;
	bh=X6tljyeoJCuwor1cd6cNwVaGQL05xjYEdjb/uanKFc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R//F4pM322U7dOz5FSa/h+r65wzltJjK0zt+jIt+NY2HrnOm1YSTGUY0LpgnTLnewT5sixBTVqJATcw64oJwE7j9rybyVP0lqkk9lgrAfYcObjdKX/lhH6JpWezgIsBhSQ/cwuKSxTd81fNeiPeCneNTs1GwSOqGXi66yCuUcb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqP+3grM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqP+3grM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B37C4CEE4;
	Thu, 17 Apr 2025 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744887609;
	bh=X6tljyeoJCuwor1cd6cNwVaGQL05xjYEdjb/uanKFc0=;
	h=From:To:Cc:Subject:Date:From;
	b=JqP+3grMeNmBu8sQuvELQHNZQHvQbrfGEsDwhQ3uS9ngiT7oomZCvtzdA1eIdnrOZ
	 i1mpyE26F10OYQpUKN2woYvm+CzRGsyfiIw12jFOTvlcG1npG0LRsBMz4To1kWwiPz
	 ngqPUqBDo2ngEqcteiRR62HGdyh5vy1kRJTKp1j0wOOBndQ6YtcLLPXgJM+tv/oYqo
	 SkEmP3Kl2u3SsUokhpL9IXHVTED8bFqQHGm1bJUabQJwId9hujOBOjDUWfr90F7jA8
	 k1C0QCjlsa73GkP7rr3mlestNTfLf9Hn7y3aqiKzY2OW+AhMUqv5U9pbYmcoLCRG7+
	 ++Vcq2afnkZFg==
From: Philipp Stanner <phasta@kernel.org>
To: Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/vmgfx: Use non-hybrid PCI devres API
Date: Thu, 17 Apr 2025 12:59:32 +0200
Message-ID: <20250417105931.32716-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmgfx enables its PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_regions() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Moreover, since both functions are already managed in this driver, the
calls to pci_release_regions() are unnecessary.

Remove the calls to pci_release_regions().

Replace the call to sometimes-managed pci_request_regions() with one to
the always-managed pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0f32471c8533..59e100222cad 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -733,7 +733,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 
 	pci_set_master(pdev);
 
-	ret = pci_request_regions(pdev, "vmwgfx probe");
+	ret = pcim_request_all_regions(pdev, "vmwgfx probe");
 	if (ret)
 		return ret;
 
@@ -753,7 +753,6 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		if (!dev->rmmio) {
 			drm_err(&dev->drm,
 				"Failed mapping registers mmio memory.\n");
-			pci_release_regions(pdev);
 			return -ENOMEM;
 		}
 	} else if (pci_id == VMWGFX_PCI_ID_SVGA2) {
@@ -774,11 +773,9 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		if (IS_ERR(dev->fifo_mem)) {
 			drm_err(&dev->drm,
 				  "Failed mapping FIFO memory.\n");
-			pci_release_regions(pdev);
 			return PTR_ERR(dev->fifo_mem);
 		}
 	} else {
-		pci_release_regions(pdev);
 		return -EINVAL;
 	}
 
@@ -872,7 +869,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		return ret;
 	ret = vmw_detect_version(dev_priv);
 	if (ret)
-		goto out_no_pci_or_version;
+		return ret;
 
 
 	for (i = vmw_res_context; i < vmw_res_max; ++i) {
@@ -1172,8 +1169,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 
 	if (dev_priv->ctx.staged_bindings)
 		vmw_binding_state_free(dev_priv->ctx.staged_bindings);
-out_no_pci_or_version:
-	pci_release_regions(pdev);
+
 	return ret;
 }
 
@@ -1216,8 +1212,6 @@ static void vmw_driver_unload(struct drm_device *dev)
 		idr_destroy(&dev_priv->res_idr[i]);
 
 	vmw_mksstat_remove_all(dev_priv);
-
-	pci_release_regions(pdev);
 }
 
 static void vmw_postclose(struct drm_device *dev,
-- 
2.48.1


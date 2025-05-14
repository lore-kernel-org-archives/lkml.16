Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751BBE55B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207911; cv=none; b=Liai98wJmQkiAgw9Ys9qGJYX8o6Mgd18a5EpdQ4YjwXE5sQDzX14dek0bx3MNYpSywyJ9y698nwRzwhcxfjK01Tpt0Cl90UdtsUS+54T28zq8ihOwq9DTq1Ra6sBkd9hoR0o7JGlUxF7wtSgnGbYO78aRt8H0EoLtP9V9buKe1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207911; c=relaxed/simple;
	bh=Mn5HbuWyqJ7C2JVqgyygApgDsStKx1RO3AbkQziNxxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FK+DWvI4HypL/Z6pfiPh3IBgC+lZAZF6zd0bdCKWfUxmDXSej4v0FhkoZG97MpPWFnUSLF3SzXxVU2ukNGoj3xifhoJd478qJZM+Cc30XN/b3NZ9tAUgMthHmZaXHqKERdPszvXW109Bdrey2X4norCAbZWaU8QT/zM17cQz4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TckigEK1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TckigEK1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DFCC4CEE9;
	Wed, 14 May 2025 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747207909;
	bh=Mn5HbuWyqJ7C2JVqgyygApgDsStKx1RO3AbkQziNxxk=;
	h=From:To:Cc:Subject:Date:From;
	b=TckigEK1BxIipXvIYkFynkipGEYWAr5NqeRY1R2x5o3+8hRLcdZf/xhiLCXWj/uQU
	 XOXpkgqTPZP5I67KS26pxRB0+zjJnk0VVoLL3Kfjd+xZS01gL6HQx8tPTwwWtjq+h+
	 LjqMtjNmfJg/yznQaSeBXDhEGRQm90/C4k3YvUVa1P6F1+wfwlPT0c4UYpbfvfSEqr
	 7XIUUXo1iBgMe9uiITCoWFLvuNxnwZPcxIQFHY3jCA8/4lxlv1RYhYd3O6NaDDVptK
	 40YyjLO61TGEtLH5eSzNrkzbHCG2ajTLZHYv6hcprNiZK4LZxstZ+HXFO8zaNhHqVo
	 0RZ7SOwQVzw/A==
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
Subject: [PATCH v3] drm/vmwgfx: Use non-hybrid PCI devres API
Date: Wed, 14 May 2025 09:31:27 +0200
Message-ID: <20250514073126.85443-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmwgfx enables its PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_regions() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Moreover, since both functions are already managed in this driver, the
calls to pci_release_regions() are unnecessary.

Remove the calls to pci_release_regions().

Replace the call to sometimes-managed pci_request_regions() with one to
always-managed pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
---
Changes in v3:
  - Use the correct driver name in the commit message. (Zack)

Changes in v2:
  - Fix unused variable error.
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0695a342b1ef..37b832e552a4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -713,7 +713,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 
 	pci_set_master(pdev);
 
-	ret = pci_request_regions(pdev, "vmwgfx probe");
+	ret = pcim_request_all_regions(pdev, "vmwgfx probe");
 	if (ret)
 		return ret;
 
@@ -733,7 +733,6 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		if (!dev->rmmio) {
 			drm_err(&dev->drm,
 				"Failed mapping registers mmio memory.\n");
-			pci_release_regions(pdev);
 			return -ENOMEM;
 		}
 	} else if (pci_id == VMWGFX_PCI_ID_SVGA2) {
@@ -754,11 +753,9 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
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
 
@@ -836,7 +833,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	int ret;
 	enum vmw_res_type i;
 	bool refuse_dma = false;
-	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	vmw_sw_context_init(dev_priv);
 
@@ -852,7 +848,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		return ret;
 	ret = vmw_detect_version(dev_priv);
 	if (ret)
-		goto out_no_pci_or_version;
+		return ret;
 
 
 	for (i = vmw_res_context; i < vmw_res_max; ++i) {
@@ -1152,15 +1148,13 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 
 	if (dev_priv->ctx.staged_bindings)
 		vmw_binding_state_free(dev_priv->ctx.staged_bindings);
-out_no_pci_or_version:
-	pci_release_regions(pdev);
+
 	return ret;
 }
 
 static void vmw_driver_unload(struct drm_device *dev)
 {
 	struct vmw_private *dev_priv = vmw_priv(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	enum vmw_res_type i;
 
 	unregister_pm_notifier(&dev_priv->pm_nb);
@@ -1196,8 +1190,6 @@ static void vmw_driver_unload(struct drm_device *dev)
 		idr_destroy(&dev_priv->res_idr[i]);
 
 	vmw_mksstat_remove_all(dev_priv);
-
-	pci_release_regions(pdev);
 }
 
 static void vmw_postclose(struct drm_device *dev,
-- 
2.49.0


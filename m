Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6610024676A;
	Tue, 29 Apr 2025 23:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970789; cv=none; b=s06P2wW8pYDioSNiDyZ77RhnVYzCJbrW02yNjjAFu9gCMznzrZmwkh1ue+VX2BjxTUcMbryfTZIZWP+Zq/uWxo1gheCelhNIE01nOhvnY9W11/MeqdtkLrp/jmF9wRrlnUrky+VrWV2r7jF3zBnVYdMqsYHDcomrmg1c+uCaUXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970789; c=relaxed/simple;
	bh=pZt2DPHAfask/sfLxdPOeDkn02Ro66UHuDGl1/Gb3Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DgS3dDNFjK31R/IGcSGVX0TR2hwla01nuejsBOs8LNmCEGkpEUO9gUU3neCDFmhWErRhrPIxfFzUF6ExX7+bh2iiVsOy+aNlpM1+Ab8zwbZVEs+/wwfQjyePPV+FWT8QEfGusHE+Tv6/qBBxJPssNuHcmk6RzpY6xzhJbupCdgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgL95Hfz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgL95Hfz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6B6C4CEF2;
	Tue, 29 Apr 2025 23:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970789;
	bh=pZt2DPHAfask/sfLxdPOeDkn02Ro66UHuDGl1/Gb3Bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MgL95HfzIMz/STrMCTMwKpS9wSIR7hvwZJR3377RiF2ZebkzF57adGdGWf5TfPBF+
	 3gApDA7jpxScmthCxMYaq01Y0DUDatsuv/ClbxQ3Rwr/JMQC1iOCy0N2TSAdfGcZwe
	 jGezGdHZyFkgTdrdOSIzMe2IrXgYb2MTpV3vD8Kgj6OeHwkPm1to3wVVcJ+8AUlQW/
	 Jl3DOhG5G1j6ssikGtAiHdOFidlZijs+pSiBacjtneSK4dW1K50uFgapqcaZ23qYEL
	 lQubGX3+/AkqsyA/agYCaWFXKIOeX+x06N3xLkeiNV+C3MyYA2fxU3paJooMi4vriK
	 y2i62VadOJaGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Kuehling <felix.kuehling@amd.com>,
	Hao Zhou <hao.zhou@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	airlied@gmail.com,
	simona@ffwll.ch,
	Yunxiang.Li@amd.com,
	tvrtko.ursulin@igalia.com,
	matthew.auld@intel.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 18/21] drm/amdgpu: Allow P2P access through XGMI
Date: Tue, 29 Apr 2025 19:52:30 -0400
Message-Id: <20250429235233.537828-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235233.537828-1-sashal@kernel.org>
References: <20250429235233.537828-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.88
Content-Transfer-Encoding: 8bit

From: Felix Kuehling <felix.kuehling@amd.com>

[ Upstream commit a92741e72f91b904c1d8c3d409ed8dbe9c1f2b26 ]

If peer memory is accessible through XGMI, allow leaving it in VRAM
rather than forcing its migration to GTT on DMABuf attachment.

Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
Tested-by: Hao (Claire) Zhou <hao.zhou@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 372c8d72c3680fdea3fbb2d6b089f76b4a6d596a)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 30 ++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index be4cc4868a748..493e18bcea069 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -43,6 +43,29 @@
 #include <linux/pci-p2pdma.h>
 #include <linux/pm_runtime.h>
 
+static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops;
+
+/**
+ * dma_buf_attach_adev - Helper to get adev of an attachment
+ *
+ * @attach: attachment
+ *
+ * Returns:
+ * A struct amdgpu_device * if the attaching device is an amdgpu device or
+ * partition, NULL otherwise.
+ */
+static struct amdgpu_device *dma_buf_attach_adev(struct dma_buf_attachment *attach)
+{
+	if (attach->importer_ops == &amdgpu_dma_buf_attach_ops) {
+		struct drm_gem_object *obj = attach->importer_priv;
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+
+		return amdgpu_ttm_adev(bo->tbo.bdev);
+	}
+
+	return NULL;
+}
+
 /**
  * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
  *
@@ -54,12 +77,14 @@
 static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 				 struct dma_buf_attachment *attach)
 {
+	struct amdgpu_device *attach_adev = dma_buf_attach_adev(attach);
 	struct drm_gem_object *obj = dmabuf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	int r;
 
-	if (pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
+	if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
+	    pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
 		attach->peer2peer = false;
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
@@ -482,6 +507,9 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
 	struct drm_gem_object *obj = &bo->tbo.base;
 	struct drm_gem_object *gobj;
 
+	if (!adev)
+		return false;
+
 	if (obj->import_attach) {
 		struct dma_buf *dma_buf = obj->import_attach->dmabuf;
 
-- 
2.39.5


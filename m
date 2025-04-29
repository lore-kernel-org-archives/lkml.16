Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C02BD90B;
	Tue, 29 Apr 2025 23:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970744; cv=none; b=QPA2zJUFVuNLE7Vm+imW8HOqU5dLkfkNl9Skz0UKYdqvdMgKEVxHu05jZ87J8i7IPjdT/fbbvag311gZLSx1iXkfPt9JX1wWG5wRkS7cJmhJ7b3ytlWI7o5gmy5A59lF+m5TRk8OktJ0yDBNOO3+qFml5/TMr70lLNj5iAA3Ugs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970744; c=relaxed/simple;
	bh=OQiDnOa+PcJKv/UKDOspbPrntYM9H/JMMIruI5jrWKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQiPLTr2mPHW57YG7MVuyWzjHON3+wSY6ehCm8Ci4npdUmFcsN50oFL2g0JlylUdyFHv5pUHp99RO7PerJqusnTMn8KAIbuFawamPiY57sKk28RTQhDkJpA4/vQzHLakJiok+tQRneDSsGn05wWNZOEwwJFfhFadE7y5ehhvZHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXMHYmxK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXMHYmxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841B5C4CEE3;
	Tue, 29 Apr 2025 23:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970744;
	bh=OQiDnOa+PcJKv/UKDOspbPrntYM9H/JMMIruI5jrWKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YXMHYmxKc9tv81CFKwles1ZNLxpPWPvrZG49U3mkwfwG9YH0lSTco+pdRfYsEPwNB
	 MaT/snzpyjPxMHcsQVyQqzm7PuNR5PcU3yCTsvwsj+HgcXzNM60bxkOibU4HYHmFBi
	 kM7g6v7GyWxm4FNv75tjCyiGBwMCtysj+8EHEJaB7to8Yb06VnlYO8bveO+riALS3f
	 m0Hpkv/gf2oKCOiXDCTVJGWT04JDToxxge4HWRcb6C2CirTKuvB4g9YfMt5zawdHR9
	 RyHcaFdpLrP7Zoqs64iDKlJSNmxKWmeJoUXh46pg+EGnZ4wEA6VAa6ar9ZAxa+yJzS
	 zsQfeZhnPPi6g==
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
Subject: [PATCH AUTOSEL 6.12 32/37] drm/amdgpu: Allow P2P access through XGMI
Date: Tue, 29 Apr 2025 19:51:17 -0400
Message-Id: <20250429235122.537321-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235122.537321-1-sashal@kernel.org>
References: <20250429235122.537321-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.25
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
index 2f90fff1b9ddc..e63a32c214475 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -42,6 +42,29 @@
 #include <linux/dma-fence-array.h>
 #include <linux/pci-p2pdma.h>
 
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
@@ -53,11 +76,13 @@
 static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 				 struct dma_buf_attachment *attach)
 {
+	struct amdgpu_device *attach_adev = dma_buf_attach_adev(attach);
 	struct drm_gem_object *obj = dmabuf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 
-	if (pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
+	if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
+	    pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
 		attach->peer2peer = false;
 
 	return 0;
@@ -456,6 +481,9 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
 	struct drm_gem_object *obj = &bo->tbo.base;
 	struct drm_gem_object *gobj;
 
+	if (!adev)
+		return false;
+
 	if (obj->import_attach) {
 		struct dma_buf *dma_buf = obj->import_attach->dmabuf;
 
-- 
2.39.5


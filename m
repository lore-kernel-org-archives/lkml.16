Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97EF1F4176
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 20:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153840; cv=none; b=uX86Q53zZpN4EgFgSxq06av3FqZiJnuHAIg1zQr5Hwyli4bhQvrycQSzbl2aum9wgo/z/z4sq8CA6VmcPE67s00qYzpWUlbLuTf0QP4u6jDfxlt9A3HcpdkeVpJhhNE7UmeYsr15LGiENSAEmHKo/ODy8IeW35mNbmQWlL0mV7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153840; c=relaxed/simple;
	bh=o1vWj2peYFzT+9B8W1tqxLwFgYA9lzDCmka4MeMf2gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/qRrbo0+9aGCOBxw2f3mAb2jmd9fuwJ2YDAOdzbuPNq0Yv1D9C02t87Sd1dOIKUaTa/NH+SUQbekNdQY8DpSvyiQNDRrgWgw1TdCnAPzBEm9rJCdsKkZEJQqIfqqONlphjmdUJhU6GG2/UCP58OoGqWH4QmNKIb/mAr1BGBVH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=KI9nhAcI; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="KI9nhAcI"
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 890631C11FF
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 23:03:45 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1749153825; x=
	1750017826; bh=o1vWj2peYFzT+9B8W1tqxLwFgYA9lzDCmka4MeMf2gg=; b=K
	I9nhAcIiu7lrXTn3NaSpYUL8bNKN3JuEZPUAtssONVOxwA0OfQrmMVRtqDrTfQST
	kfd5pvsOhmYcS89KLUgIxIfiT1B07gzs9+gNkR1YbWtLTB6hmsD1SiWoIZQ8MmcF
	WObORsAQhNJAosjXCOvEpGDGM+Y6fvXsMWBkPfkouw=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FDlrQ0HG8g9m for <linux-kernel@vger.kernel.org>;
	Thu,  5 Jun 2025 23:03:45 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id 786081C0D75;
	Thu,  5 Jun 2025 23:03:40 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: 
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] drm/nouveau/instmem/gk20a: fix overflow in IOVA calculation for iommu_map/unmap
Date: Thu,  5 Jun 2025 20:03:23 +0000
Message-ID: <20250605200332.336245-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix possible overflow in the address expression used as the second
argument to iommu_map() and iommu_unmap(). Without an explicit cast,
this expression may overflow when 'r->offset' or 'i' are large. Cast
the result to unsigned long before shifting to ensure correct IOVA
computation and prevent unintended wraparound.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v4.4+
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 201022ae9214..17a0e1a46211 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -334,7 +334,7 @@ gk20a_instobj_dtor_iommu(struct nvkm_memory *memory)
 	/* Unmap pages from GPU address space and free them */
 	for (i = 0; i < node->base.mn->length; i++) {
 		iommu_unmap(imem->domain,
-			    (r->offset + i) << imem->iommu_pgshift, PAGE_SIZE);
+			    ((unsigned long)r->offset + i) << imem->iommu_pgshift, PAGE_SIZE);
 		dma_unmap_page(dev, node->dma_addrs[i], PAGE_SIZE,
 			       DMA_BIDIRECTIONAL);
 		__free_page(node->pages[i]);
@@ -472,7 +472,7 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
 
 	/* Map into GPU address space */
 	for (i = 0; i < npages; i++) {
-		u32 offset = (r->offset + i) << imem->iommu_pgshift;
+		unsigned long offset = ((unsigned long)r->offset + i) << imem->iommu_pgshift;
 
 		ret = iommu_map(imem->domain, offset, node->dma_addrs[i],
 				PAGE_SIZE, IOMMU_READ | IOMMU_WRITE,
-- 
2.43.0


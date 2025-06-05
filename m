Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0FF13B590
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153840; cv=none; b=SIxRbCwz/f5XnoLQPHxCjbGit8F4DT1tyW+YPibTyNRzkol86Zd4+/oW0pcgKljfWLkLpN1+Qii10VQNoF9WaCPiHyOnFY+EXtFAml2an33hqFlWBbdhWF+xkYTmStJTBc8Jyudr2Nc0Q+6OQuUm8nrQ6k+xdOvppfQccKoJ+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153840; c=relaxed/simple;
	bh=TeGhnktdSvFxXreUkwhblyYxGqCrkCLuVr00TRFUiKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F88EAO/GGv9SF0RPdxmQ6+teoiKjseJclOcN5Jl9vEG08jZXZiLkRDrJQ+4+1CiQbOQSzpJMOZZ+L2IjV1Grp12SV2Ae0MiAzlStpQkXrXX8ey5iPWIr3msEEJRm9VPbW3lq45ladUmYn9hWTljn2ognJcPl41o5dDPFU5ijcdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=muyYK09A; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="muyYK09A"
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id AD95F1C2ABB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 23:03:51 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:to:from:from; s=
	dkim; t=1749153831; x=1750017832; bh=TeGhnktdSvFxXreUkwhblyYxGqC
	rkCLuVr00TRFUiKg=; b=muyYK09AKsd5svyarCM+wgyXi06Ne0zIQpr8osYyGlM
	mvFv38mvh3e1slWQweEQvM33yQ2sJPuyYfezhOkuBx44rteHQiJ3P3ULqQ0CTKY+
	Yf6RfncjFBjitQYbMnjScBBdtAJZeidKE5vZzL2zX0n+++cfU7vC7VRQHVDjnJt8
	=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9j4KrAqbXQx1 for <linux-kernel@vger.kernel.org>;
	Thu,  5 Jun 2025 23:03:51 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id EA2801C2ABA;
	Thu,  5 Jun 2025 23:03:49 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Lyude Paul <lyude@redhat.com>
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
Subject: [PATCH 2/2] drm/nouveau/instmem/gk20a: fix incorrect argument in iommu_unmap
Date: Thu,  5 Jun 2025 20:03:24 +0000
Message-ID: <20250605200332.336245-2-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605200332.336245-1-sdl@nppct.ru>
References: <20250605200332.336245-1-sdl@nppct.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The unmap logic assumes a fixed step size of PAGE_SIZE, but the
actual IOVA step depends on iommu_pgshift, not PAGE_SHIFT. If
iommu_pgshift > PAGE_SHIFT, this results in mismatched offsets and
causes iommu_unmap() to target incorrect addresses, potentially
leaving mappings intact or corrupting IOMMU state.

Fix this by recomputing the offset per index using the same logic as
in the map loop, ensuring symmetry and correctness.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v4.3+
Fixes: a7f6da6e758c ("drm/nouveau/instmem/gk20a: add IOMMU support")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 17a0e1a46211..f58e0d4fb2b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -481,8 +481,9 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
 			nvkm_error(subdev, "IOMMU mapping failure: %d\n", ret);
 
 			while (i-- > 0) {
-				offset -= PAGE_SIZE;
-				iommu_unmap(imem->domain, offset, PAGE_SIZE);
+				iommu_unmap(imem->domain,
+					    ((unsigned long)r->offset + i) << imem->iommu_pgshift,
+					    PAGE_SIZE);
 			}
 			goto release_area;
 		}
-- 
2.43.0


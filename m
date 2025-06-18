Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35032E7622
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242161; cv=none; b=D3yngqrHVzX2BK/h/61JecTGVgeakaI1ygX2PLvwHtt2xmkCi3/aSirFi0hu7rExYPm1AxMEENva9qI4kW1Kp38pA5dqqhGu/V7U/IzP+RHwnpGLeFhxq5LSGFdvTejDs5bQ3i2Lrm5k7vxbDSCjGgDAR9qZpGnGbKlEmCCb8Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242161; c=relaxed/simple;
	bh=Z1eQ/GUQiN4jxjZCX7Yswa1y9CgWC5cTrf8WNnn9IMo=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=H939mOso9YM/Ui2O2zKWirEDTcHiMZmUtHl9QaGRFKIeOs854myWoGz1FbTTMLW1eUrz/PGdSFZjkJ+hv6G9WnXybaeFNVewkEetmBdAwm/tY3zwqj+L9GzfaF6zbCeMdx4/NoCDSrHkldtsX0GO1p5jfU/D7RLSz1RuX1Oc5rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=j04e/btX; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="j04e/btX"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618102234euoutp01b3e60f89d0ed1d17fe95b578f37ed3fe~KG-d86h0R1794717947euoutp01a
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:22:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618102234euoutp01b3e60f89d0ed1d17fe95b578f37ed3fe~KG-d86h0R1794717947euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750242154;
	bh=JYJBKhF2v7bBNigZ2HXUlSgsH/gCPb2a5CyAJ0JNsB8=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=j04e/btXNi8Ji11HKhAS3wDGDW2yMiQE3HS7ZLUxpDVg5hVvQN9wkd4/wWEorSbxl
	 rA/GiV25041t5K01iNJtY4ydFGIgybKrCkXxMCYn1Y7/3bL6DjfqHHQAJu2JHuZQ8h
	 IODlOfwZlZ14IPkkB++wkUUAEzNhhKefh9KJL6xw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618102234eucas1p2a1899b494c5ed75e0f39ea517d81c81d~KG-dMKK5z1803418034eucas1p25;
	Wed, 18 Jun 2025 10:22:34 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250618102233eusmtip19348d4038a9799137d47f88522c45772~KG-cMZhq41210412104eusmtip1r;
	Wed, 18 Jun 2025 10:22:33 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 18 Jun 2025 12:22:14 +0200
Subject: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
	<frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
	Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250618102234eucas1p2a1899b494c5ed75e0f39ea517d81c81d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618102234eucas1p2a1899b494c5ed75e0f39ea517d81c81d
X-EPHeader: CA
X-CMS-RootMailID: 20250618102234eucas1p2a1899b494c5ed75e0f39ea517d81c81d
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
	<CGME20250618102234eucas1p2a1899b494c5ed75e0f39ea517d81c81d@eucas1p2.samsung.com>

Several RISC-V boards feature Imagination GPUs that are compatible with
the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi
4A board. This commit adjusts the driver's Kconfig dependencies to allow
the PowerVR driver to be compiled on the RISC-V architecture.

By enabling compilation on RISC-V, we expand support for these GPUs,
providing graphics acceleration capabilities and enhancing hardware
compatibility on RISC-V platforms.

Add a dependency on MMU to fix a build warning on RISC-V configurations
without an MMU and enable COMPILE_TEST to improve build coverage.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 5f9fff43d6baadc42ebf48d91729bfbf27e06caa..48fd31c031628c70b1e0952271baccf7f4694810 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -3,9 +3,10 @@
 
 config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
-	depends on ARM64
+	depends on (ARM64 || RISCV) || COMPILE_TEST
 	depends on DRM
 	depends on PM
+	depends on MMU
 	select DRM_EXEC
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_SCHED

-- 
2.34.1


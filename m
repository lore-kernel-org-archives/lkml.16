Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541BD2D12F6;
	Wed, 18 Jun 2025 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750255777; cv=none; b=CFqrfZNirDmYiafEdgHw5ZSZ6leGp4PQIz8sRPe+QScCQaRtmLUdbLZLQxujWwABsQ49My2ePsVZTWsyS5r7vmIQ/rFgSJAxNxIxMFJ7zKa6FrHoK0sFbSIPMVRMiXZw8FtKdu8pvYFMHjKgWhLrJR9Z9/MT6L/TDMCcjiut3ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750255777; c=relaxed/simple;
	bh=AbqsY+BazuQPKrih3PHbSIbfF8unqnM3+U3VJBeLOj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wrc8bDoV4Lnkf1vc2WqydO07//ij4HqW6wO/p/g8vK0n905Uyc8WKKhTqe5O+HiAxpl+4ADy2iuyShj/Mrk0T1OEjm95Xwt9ZgGYz157ujtTkdqFM6kbzPnw3J/Djebxq8xQpUnimJ6WOyMxW++B2FqPSH+iWPel+8Uxiv42xf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BF6Zile1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BF6Zile1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750255773;
	bh=AbqsY+BazuQPKrih3PHbSIbfF8unqnM3+U3VJBeLOj0=;
	h=From:To:Cc:Subject:Date:From;
	b=BF6Zile11yaAxf1Y9/5SyLmogOa92FtcI13KXHY8Az2py36Ch7W7wWPM8/R2TyxzD
	 29aLaP39PBFC/v/uiojZREEJd4NvDbtB7ZLFRQ7Zh1Y+K/sYYuyV/hcVLjPkCML3kF
	 etquDrL0A+UPNRJcWfD9tI2MVQD/qUXLlu2+mAY00n3X4elovblyKYGFVPr+yLzoRe
	 deQTQt5tW2b0qIwqm7SUlgC/J04lJiphuYN4zp7KQw5FtNUOkdWeUE0r44jdPZ6hnW
	 zBGDwxcBffMBc9dyn2UQyHxIgVknUtelXWrsCjpowwreqbUGABueymFY2Zq4rhiK40
	 ElFrgPHyjWaQQ==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:45c6:994a:f902:5c74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D04C217E0DD0;
	Wed, 18 Jun 2025 16:09:32 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 0/5] Add support for Verisilicon IOMMU used by media codec blocks
Date: Wed, 18 Jun 2025 16:09:09 +0200
Message-ID: <20250618140923.97693-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds support for the Verisilicon IOMMU, which is found in front
of hardware encoder and decoder blocks in several SoCs using Verisilicon IP. 
A first implementation of this IOMMU is available on the Rockchip RK3588 SoC.

Rockchip provides a driver for this hardware in their 6.1 kernel branch:
https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/iommu/rockchip-iommu-av1d.c

This series includes:
- a new binding for the Verisilicon IOMMU
- a basic driver implementation
- DT updates for RK3588

The driver was forward-ported from Rockchip’s 6.1 implementation, 
the prefix was renamed to vsi for generality, and several fixes were applied.

AV1 decoding was tested using the stateless VPU driver and Fluster.
The test results show a score of 205/239, which confirms that no regressions
were introduced by this series.

Feedback and testing welcome.

changes in version 2:
- Add a compatible "rockchip,rk3588-av1-iommu"
- Fix clock-names in binding 
- Remove "vsi_mmu" label in binding example.
- Rework driver probe function
- Remove double flush
- Rework driver internal structures and avoid allocate
  in xlate function.
- Do not touch to VPU driver anymore (path removed)
- Add a patch to enable the driver in arm64 defconfig

Thanks,
Benjamin


Benjamin Gaignard (5):
  dt-bindings: vendor-prefixes: Add Verisilicon
  dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
  iommu: Add verisilicon IOMMU driver
  arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
  arm64: defconfig: enable Verisilicon IOMMU

 .../bindings/iommu/verisilicon,iommu.yaml     |  72 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  11 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/iommu/Kconfig                         |  12 +
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/vsi-iommu.c                     | 841 ++++++++++++++++++
 7 files changed, 940 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
 create mode 100644 drivers/iommu/vsi-iommu.c

-- 
2.43.0


Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0BBAD58
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747055792; cv=none; b=D2gvE5WYjA8RahxGPDW0i599xbc+qLVQn4xypNWEiPUxuUaQPgMZVqXNyVe+3jukLnbL9Zb6KTmptYnGZdEtz88FDDw83b3P6CDGblEpPxjlrrBwSqed4azPdeQWzY32qWTSJUoMPg1NlE0J0QB13P3eG9Bw/+qzYjTdUAQcdB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747055792; c=relaxed/simple;
	bh=l/0gsrFoVPDA7ZtJpXzRTh0pyA35QHVBabd3tm5D8og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHITL3HEzR1vu1A/LMQ7V9ZhHDrwOlhtfeYPuQmVZzsIG9Kg4wIpYnwSYAVJ6PoBsFdxfiPLQ8NQm+68drC/WSFkOuI+acH8et8XjPSYXL7O0gNkEpGXgSBU67f4yq+Vnk8+25ZC+033dc3RZNkL28RrqEttEJkV5FdeMt4YlZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 94EA95FAA7;
	Mon, 12 May 2025 15:16:15 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bert Karwatzki <spasswolf@web.de>, Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 4/6] iommu: make inclusion of riscv directory conditional
Date: Mon, 12 May 2025 15:13:43 +0200
Message-ID: <2235451.Icojqenx9y@devpool92.emlix.com>
Organization: emlix GmbH
In-Reply-To: <1926170.CQOukoFCf9@devpool92.emlix.com>
References: <1926170.CQOukoFCf9@devpool92.emlix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Nothing in there is active if CONFIG_RISCV_IOMMU is not enabled, so the who=
le
directory can depend on that switch as well.

=46ixes: 5c0ebbd3c6c6 ("iommu/riscv: Add RISC-V IOMMU platform device drive=
r")
Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
=2D--
 drivers/iommu/Makefile       | 3 ++-
 drivers/iommu/riscv/Makefile | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index a486032d3e079..355294fa9033f 100644
=2D-- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
=2Dobj-y +=3D arm/ iommufd/ riscv/
+obj-y +=3D arm/ iommufd/
 obj-$(CONFIG_AMD_IOMMU) +=3D amd/
 obj-$(CONFIG_INTEL_IOMMU) +=3D intel/
+obj-$(CONFIG_RISCV_IOMMU) +=3D riscv/
 obj-$(CONFIG_IOMMU_API) +=3D iommu.o
 obj-$(CONFIG_IOMMU_SUPPORT) +=3D iommu-pages.o
 obj-$(CONFIG_IOMMU_API) +=3D iommu-traces.o
diff --git a/drivers/iommu/riscv/Makefile b/drivers/iommu/riscv/Makefile
index f54c9ed17d41d..b5929f9f23e64 100644
=2D-- a/drivers/iommu/riscv/Makefile
+++ b/drivers/iommu/riscv/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
=2Dobj-$(CONFIG_RISCV_IOMMU) +=3D iommu.o iommu-platform.o
+obj-y +=3D iommu.o iommu-platform.o
 obj-$(CONFIG_RISCV_IOMMU_PCI) +=3D iommu-pci.o
=2D-=20
2.49.0


=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner



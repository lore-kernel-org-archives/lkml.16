Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73FA70810
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 01:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420017; cv=none; b=hA4uPwbdyLooPsym0D9/t1YPc6v/QPt2QTXkUy5Dw9fIj63zPdomioFqWWSCz2PzjBJBIfgf/r75eOmU2Jl6aUW6i3+7q+oKgj2DQI3VTHuKHm//E4IC68neaVJg9CI4nB2AiRx+elJWMyqEJe5LG2OAK9yzhAv2uLOYYGPC4/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420017; c=relaxed/simple;
	bh=AF7omRMZRLd5scwxtbkEuD3UqDHzNIQwcvhUKNY2VNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Qr95FLUL6Xx6fRy4LqkWUvtU4MH342/h9JQ+oLG0tzIq3O479P9jtV9PszFPXzW/j4XZ8oAwWUSARNEcsz3RHNdoNRBao+AahhIlgduLEF90AiK53OblZRSdiePh4K4+IDOvk8gqxX1cUGtw+m+M9hx35kJeSw0vomNgRf55y2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VOg0IE7M; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VOg0IE7M"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250702013334epoutp02cbe0edc9eddecaf45ac64232fd515f36~OSzk7TqFX1647116471epoutp02S
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 01:33:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250702013334epoutp02cbe0edc9eddecaf45ac64232fd515f36~OSzk7TqFX1647116471epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751420014;
	bh=dAX8Jb9Bx+UN5wIdbfjnE5hKdAw3VOpDOA4U8IQYlBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VOg0IE7MnDnIPec+P6KpTpDtDKcczG86q+gmmVWOJpuPUhK0NFQWO+6fEtYHr8Xwc
	 1ZQ8+EDh3JbM7Th47edvXx/SMPALXiFhx9NUxgOomqycmLBO6jkwzOVXrn/5P9Qgwq
	 X3hS5Ffyq9/zGPJ9sKxvETJtS9z7p57TmB+75sd0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250702013333epcas2p1f160b339b02f3cc764218f175698cd60~OSzkpvePm0297702977epcas2p12;
	Wed,  2 Jul 2025 01:33:33 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bX2V52xyPz6B9mK; Wed,  2 Jul
	2025 01:33:33 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epcas2p1d9e8394c75dd90b6e32122050001fec3~OSzjadxBo0051400514epcas2p1A;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epsmtip22ff47c2e047a5efa0f8547e90bb56aa3~OSzjUs-0b2820728207epsmtip2m;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 0/5] ufs-exynos support for ExynosAutov920
Date: Wed,  2 Jul 2025 10:33:12 +0900
Message-ID: <20250702013316.2837427-7-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702013316.2837427-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702013332epcas2p1d9e8394c75dd90b6e32122050001fec3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702013332epcas2p1d9e8394c75dd90b6e32122050001fec3
References: <20250702013316.2837427-1-sowon.na@samsung.com>
	<CGME20250702013332epcas2p1d9e8394c75dd90b6e32122050001fec3@epcas2p1.samsung.com>

Hi,

This series adds support to the ufs-exynos driver for ExynosAutov920,
Samsung Automotive SoC series.
ExynosAutov920 has the UFSHCI 3.1 compliant UFS controller.

ExynosAutov920 has a different mask of UFS sharability from ExynosAutov9,
so this series provide flexible parameter for the mask.

With this series applied, UFS is functional. The Samsung KLUDG4UHYB is
tested for enumeration and I/O.

Sowon Na (5):
  phy: samsung-ufs: update calibration settings for EVT2
  dt-bindings: ufs: exynos: add ExynosAutov920 compatible string
  dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920
  scsi: ufs: exynos: add support for ExynosAutov920 SoC
  arm64: dts: exynosautov920: enable support for ufs device

 .../soc/samsung/samsung,exynos-sysreg.yaml    |   1 +
 .../bindings/ufs/samsung,exynos-ufs.yaml      |   1 +
 .../boot/dts/exynos/exynosautov920-sadk.dts   |  17 +++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  27 ++++
 drivers/phy/samsung/phy-exynosautov920-ufs.c  |  39 ++----
 drivers/phy/samsung/phy-samsung-ufs.h         |   1 -
 drivers/ufs/host/ufs-exynos.c                 | 130 ++++++++++++++++--
 7 files changed, 180 insertions(+), 36 deletions(-)

-- 
2.45.2


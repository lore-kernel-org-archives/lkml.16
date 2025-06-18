Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC99415D1;
	Wed, 18 Jun 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243197; cv=none; b=QxnkroBvh2q/M0Yeo26tTf02rCbqYEctTM2vXWALvsPbqfyC2HKA0iHWmnAOPVHHRYO1qpAUyDVUCnBKsRROqNhiT5DV5J5uCLGGCrZ++Gm5E2vepwIZB+8s60Bwdz43CCpOObgGUVtopiDZNUXi9hbEMlS5IIWKO/puP5uGZqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243197; c=relaxed/simple;
	bh=K+aq5iihv58ciWnJ3WgNPa2GI/6i665JhmCQdSA1G28=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Am07k+A7q3i/rGKgHsmjoEUrnJp3XdVX2TqeR/xtzzKb+7y0hbqgqHJeGoimOgi4SeAbS2uQrRi41noPwHSHO6xYU+UoiOTD7mfSdzFLcZzKy1PXCHEbMvyfKJEgqd+Sz1BhQv6OXZRx3JdRYuAC+K8FDQJlhkS4We7l/RTAXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=NKYSvK5W; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="NKYSvK5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750243196; x=1781779196;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K+aq5iihv58ciWnJ3WgNPa2GI/6i665JhmCQdSA1G28=;
  b=NKYSvK5WWQuod7b0kMpCvM0Ao85lKJyg/Hzrz8qOAh9pY3rw86qiMC8m
   0dTqF9J8Ok+1wWcweaSxRjHQnbxpk+xKm4zSmKsphg2Fn9PxLUC4Mrle2
   svi2/DBy9AltuzlZpAsj0BhaIWNao1sUqi+tR9nPxEHcfOJj8zl5vPzQw
   peqJKQfw1TXN3hNipfNqt8qdbKyOkirQKOw1/m3t1GmvCbC1H2qkv3v8V
   +9saSaLrqJx86KryKWmL/fIb3cSPCoA19eOEphnQsvgmYvOQmFVtvC/yr
   LX59p60V/wOft3oOiQx0uBI+VM3+9l6c/+/LUqmQhCaDkotvnnXZnib0p
   w==;
X-CSE-ConnectionGUID: 4uH6+ir5SsWi7jPBO6gg/A==
X-CSE-MsgGUID: Uoh+Bs9UR1qSERud6Gy6Pg==
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="274330070"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jun 2025 03:39:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Jun 2025 03:39:24 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 18 Jun 2025 03:39:22 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 0/2] Add cache configuration for Microchip SAMA7D and SAMA7G MPUs
Date: Wed, 18 Jun 2025 13:39:12 +0300
Message-ID: <20250618103914.2712-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
The cache configuration is described in datasheet chapter 15.2.

Changelog:

v1 -> v2:
- Remove the cache-unified property from l1-cache node

Mihai Sain (2):
  ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
  ARM: dts: microchip: sama7g5: Add cache configuration for cpu node

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
 arch/arm/boot/dts/microchip/sama7g5.dtsi  | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)


base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
-- 
2.50.0


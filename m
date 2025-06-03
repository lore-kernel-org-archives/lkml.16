Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ABC28152A;
	Tue,  3 Jun 2025 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748941499; cv=none; b=jgwSl97CXU2JQiCGlALFs5+16LhC4kPJ1qyixQS59S2nYHHNhuu2ClUyUYCEOQTPL290iraMA/NMlg0BZnbKg9+kO8ZrfONFZ0ae+T27rjXdDDS0CNQKkTP2QLiM/1VnOMthmCP13Y39DISLth1bc2rDm35KA3VHsICGuAnT1+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748941499; c=relaxed/simple;
	bh=oLamSk+rgK83ij/j0OMTDCK03G7O/CTlwPqfm4fU7fw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jZ1GblQzX53dwsce++V19N/yK2EmKJpHY8NOjCpnMfGNqXSEpOqv1bpdH+oVdIF+T6ZGZhqCqcM9sDDbVTzLeRnTRVwyrsFpzR+Z6R/YKzZy7geS6ccJysog/20UMyttYfWTpsCwPeKOdZTOQkXYqlDjaq7NPHf0BnVxADPyKwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ThDKtrxy; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ThDKtrxy"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5538E90X006202;
	Tue, 3 Jun 2025 11:04:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=gSqlkIscU9UECxCqO78pkp
	9mEBkzMbraZvF9QyX2Jpo=; b=ThDKtrxysbVp91fh7r33bOjfUH9bYyA8VxbX9l
	JWfdnsmeKNgsFISaQDSEFgoA1ORVzNoLrwWODwPqb3mQayp7EDxmwayq2HAXauQo
	D03yXs8jLL7423a22It4jBnndNwShoAieoXWijt7nDP0IoYTsx6vk5qMM/lFBhpm
	1/QE40YdnlrYwVGSJc9HAgbO70QyzJttxYQacgCFPFICd4x8pQZXYZNGE6PasAcX
	TtlunUt+PkiuCfheaKBalQVvNwcxhzIGbavOdlUllySRJq8pPa5jm2LxmRIHQKCM
	f4zWwBiKqgJhytfmKRTyCxlYParsjg5QRQrquZiHCluHDyIQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g93aym9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E77F4005D;
	Tue,  3 Jun 2025 11:03:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 605D76CF2C0;
	Tue,  3 Jun 2025 11:02:31 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:31 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH v2 0/7] Introduce STM32MP157F-DK2 board
Date: Tue, 3 Jun 2025 11:02:06 +0200
Message-ID: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA66PmgC/x3MQQqAIBBA0avIrBN0TKyuEi2kphpCC40IorsnL
 d/i/wcyJaYMnXgg0cWZ91iAlYBx9XEhyVMxoEKrLDqZz2AwHNq6WU4bSvR1U3ulW2c8lOpINPP
 9H/vhfT9M3JYNYQAAAA==
X-Change-ID: 20250527-stm32mp157f-dk2-2a484a01973a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>,
        Etienne Carriere
	<etienne.carriere@foss.st.com>,
        Pascal Paillet <p.paillet@foss.st.com>,
        Conor
 Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01

The main hardware difference with STM32MP157C-DK2 board is the SoC: 'F'
variant embeds a STM32MP157F SoC, which has the same level of features
than a STM32MP157C SoC but A7 clock frequency can reach 800Mhz (instead
of fixed 650Mhz for 'C' variant).
stm32mp157f-dk2 device tree reuses the existing sketeton for STM32MP15
DKx boards, but it is SCMI-based with I2C4 & PMIC managed by OP-TEE,
like other STM32 MPU boards (STM32MP135F-DK, STM32MP257F-DK/EV1, ...).
Himanshu's bindings patch [1] has been rerolled to introduce
st,stm32mp157f-dk2 compatible.

Link: https://lore.kernel.org/linux-arm-kernel/20250524100319.22521-3-himanshu.bhavani@siliconsignals.io/ [1]
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Changes in v2:
- Drop empty stm32mp15xa.dtsi and stm32mp15xd.dtsi files.
- Fulfill SCMI regulator defines and add Pascal's SoB
- Add patch [4/7] to use SCMI regulator defines
- Add patch [5/7] for OP-TEE async notif
- Link to v1: https://lore.kernel.org/r/20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com

---
Alexandre Torgue (1):
      ARM: dts: stm32: fullfill diversity with OPP for STM32M15xF SOCs

Amelie Delaunay (3):
      ARM: dts: stm32: use 'typec' generic name for stusb1600 on stm32mp15xx-dkx
      ARM: dts: stm32: use internal regulators bindings for MP15 scmi variants
      ARM: dts: stm32: add stm32mp157f-dk2 board support

Etienne Carriere (2):
      dt-bindings: regulator: Add STM32MP15 SCMI regulator identifiers
      ARM: dts: stm32: optee async notif interrupt for MP15 scmi variants

Himanshu Bhavani (1):
      dt-bindings: arm: stm32: add STM32MP157F-DK2 board compatible

 .../devicetree/bindings/arm/stm32/stm32.yaml       |   1 +
 arch/arm/boot/dts/st/Makefile                      |   3 +-
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi           |  10 +-
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi     | 196 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts           | 179 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp15xf.dtsi              |  17 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |   2 +-
 .../dt-bindings/regulator/st,stm32mp15-regulator.h |  40 +++++
 8 files changed, 443 insertions(+), 5 deletions(-)
---
base-commit: dc392342b7bb14b12f2de96201937cb02be7802f
change-id: 20250527-stm32mp157f-dk2-2a484a01973a

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>


Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62005221568;
	Tue, 29 Apr 2025 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939708; cv=none; b=W4tKNDT7UEs8hsEv19yE/cYlOyiKehNFmJxO/KjhxvPRtDBxwMsEv61U8yWtkuEM9ZCTq8DVbIJ2kfCom0Lx4T89o0BrQAB5+B+05gFdLKFzzgnBGMhIkw5/DN4KkX/x12yKKE7rDTau2bJTRLymM0z6C1T7Heu7CvkHKwr6dew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939708; c=relaxed/simple;
	bh=IJXZD13G+pdSX+EY4hqx15yCpjPmA9iatMu/62EMdmY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E6ctiW6ipjmUnHiujfuVpPST0PgubTShDuQBB+ZkksNmeKWB14XLVLnHRDeDKRdOMYiNzrBe9qT7aEdYLouStgx6sBQrgN+QuUI6ObEv5BTskSqtZWkUit5XDVvYA7m+BggZ09xWXFc691gnsfe8cX7CZNdL4vbC7AFw/tcLzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UKMn933M; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UKMn933M"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFEtE43129345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745939695;
	bh=eT1vk5XLAjl/TpZqvTHxGOR9jCT9UoSjSIUIYdqBtkE=;
	h=From:To:CC:Subject:Date;
	b=UKMn933M0o57lbaJ4fAAZ1jCkSHygKp9fWbNCyGFcDEk2b6xTPkjRQSmV2a0zrtKS
	 Z5Bde8Gn0XzjbSTkeifW6x1TwWC6F327OHjWjEh4xxwkElPFfh5kVYa1no1tx5KDAu
	 meC+vuHu3RzlqPlnPmeRfOnBOXvViDvMlMfPwSwQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFEtoW032103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:14:55 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:14:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:14:54 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFEslu129369;
	Tue, 29 Apr 2025 10:14:54 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>
Subject: [PATCH v3 0/3] Misc MMC updates
Date: Tue, 29 Apr 2025 10:14:51 -0500
Message-ID: <20250429151454.4160506-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series includes updates for eMMC and SD nodes across
Sitara K3 SoC boards:

Add boot phase flag to MMC nodes and dependency nodes to support SD and
eMMC boot. 
Add non-removable flag to eMMC nodes to void having to redetect
eMMC after suspend/resume.
Remove disable-wp for eMMC nodes since property is specific to SD.

Changes since v2:
- Split out patches meant for stable
- add review tags

Link to v2:
https://lore.kernel.org/linux-devicetree/20250417233040.3658761-1-jm@ti.com/
Link to v1:
https://lore.kernel.org/linux-devicetree/20241014194722.358444-1-jm@ti.com/

Judith Mendez (3):
  arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
  arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
  arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts             | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi      |  1 -
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts       |  2 +-
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     |  1 -
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              |  3 ++-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              |  2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi       |  2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts              |  1 -
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts       |  1 -
 .../dts/ti/k3-am6548-iot2050-advanced-common.dtsi    |  1 -
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                |  1 -
 11 files changed, 17 insertions(+), 10 deletions(-)


base-commit: d864bb528a6725e775d564fd4430762acbb9dd0d
-- 
2.49.0


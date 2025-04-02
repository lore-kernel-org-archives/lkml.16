Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5722356BD;
	Wed,  2 Apr 2025 11:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593532; cv=none; b=iXL6RqGvRBQ8edHuK4t2mzEGgXqoW7qxiBeOdEIERD7vetEZMJ45RU0Tk6hZMjnSE0uSI+C4LFDVf4mqorO7D3bnVr/B0rm9uqMvLVQ8qC+jzDdE1h4QWwLQvrok1o9XkFSPcDxiQs/ck2GJE/08vdk0uPgg8OyXUxe/vEUHTCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593532; c=relaxed/simple;
	bh=Jqq+tZb2iwvIgau84/D9AjPWpg3COyHfFgvOtSB+djA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UmfbDv1LYcye0n01VOJA8wc57xQTtqRB8OPJm/72TzSFdELHJZGTdQecj7agwMr3we6O+bzHEETKv3cbG5pgAPZEBbVc/Ee2GYoypdEKZ0hEelAcabxExMqLbZNFgFz0NAoP2JwXs2B9jFO4esMhFuEBrnBPUFWnToqzRfgtFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MXAwXoil; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MXAwXoil"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW34r3915796
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593523;
	bh=sX5h5CFojGv8LnhPEfyz9Mo/ZRxnuXNUcaxTQXypESI=;
	h=From:To:CC:Subject:Date;
	b=MXAwXoil58eJQ8IWzzweFdwgwECINiQYjhl8HmFBDifDlzNSj1wd7VnQe+mYlrl6z
	 AAAMhWayMGWrToZ2jXvO3RexlcBY3aOtl0XmVyVxmlW7orr4H+Sh8PY894bW2wQNdv
	 E/nll3EicOETX6va6myashBGoMw6Yu1bgtbZ2mFk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW3Dd013316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:03 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:03 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BW1jn017249;
	Wed, 2 Apr 2025 06:32:02 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 0/5] Use ti,j784s4-pcie-ctrl for PCIe CTRL spaces
Date: Wed, 2 Apr 2025 17:01:56 +0530
Message-ID: <20250402113201.151195-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello all,

Now that we have ti,j784s4-pcie-ctrl[0] let's use it. This makes these
K3 SoCs all match what is already done for J784s4.

No functional change, DT changes are fully backwards and forwards
compatible.

[0]: commit cc1965b02d6c ("dt-bindings: mfd: syscon: Add ti,j784s4-pcie-ctrl compatible")
<https://lore.kernel.org/all/20240204090336.3209063-1-s-vadapalli@ti.com/>

Posting next revision for PCIe control node cleanup with minor changes
to new overlays added after v1 was posted.

NOTE: Once the bindings are in the mainline tree, scm_conf will be
converted to "simple-bus" compatible which will unblock other
items like audio_refclk in scm_conf required for audio support
for TI SoC J721S2-EVM (currently giving dtbs_check warnings)

v1: <https://lore.kernel.org/all/20241016233044.240699-1-afd@ti.com/>

Changelog v1->v2:
- Change property description and add example in the binding
- Add changes in additional overlays using pcie*_ctrl node

Andrew Davis (5):
  dt-bindings: soc: ti: ti,j721e-system-controller: Add PCIe ctrl
    property
  arm64: dts: ti: k3-j721e: Add PCIe ctrl node to scm_conf region
  arm64: dts: ti: k3-j7200: Add PCIe ctrl node to scm_conf region
  arm64: dts: ti: k3-j721s2: Add PCIe ctrl node to scm_conf region
  arm64: dts: ti: k3-am64: Add PCIe ctrl node to main_conf region

 .../soc/ti/ti,j721e-system-controller.yaml    | 10 +++++++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi      |  7 ++++-
 .../boot/dts/ti/k3-am642-evm-pcie0-ep.dtso    |  2 +-
 .../ti/k3-am68-sk-base-board-pcie1-ep.dtso    |  2 +-
 .../boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso    |  2 +-
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi     |  7 ++++-
 .../boot/dts/ti/k3-j721e-evm-pcie0-ep.dtso    |  2 +-
 .../boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso    |  2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 28 ++++++++++++++++---
 .../boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso   |  2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  7 ++++-
 11 files changed, 58 insertions(+), 13 deletions(-)

-- 
2.34.1


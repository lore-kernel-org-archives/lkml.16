Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B7B28137C;
	Tue,  3 Jun 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944580; cv=none; b=cNUbJR6MnMuTPeuWK06RIXXtAqr6IDm0p5pnwZ77VPAgVchZ9jeemE+rGNXQQvCNhh4TNARUy9D8z1y30JRBHgZqN0Z7Pur74zz5P1arjsi0q0nO6cTSRPQJFFrLDQQ8R5Q8mk3W+Y+vBjm/zN7eq59REaf2zCf/Q1ad1eZ2fLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944580; c=relaxed/simple;
	bh=M5sY5DtpyLX5Rmv/fxHew8pIoyn0HcmIV46Z87QTH2E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=saqA0k7+7hDJMey/FrBovh+hAHEcEGWSwVI/+POzJcUl4/Bx5EwrcaOV0ePH36DgJ3HO6TqLZtKOrZay5MZrBLMm9MEeW9mBd4MTcDNBsU18FEH29qjiTCwwLWVDXNGqIGBZ062rlqdJHdeUVR6BmUHx398mmrsDLDnmocWfg9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=n2CvllgC; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n2CvllgC"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539uBju489441;
	Tue, 3 Jun 2025 04:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748944571;
	bh=tQ7y/oRhmpaCvS57YBMEWO6n0J/gF6oJwiPo/K5Qvl0=;
	h=From:To:CC:Subject:Date;
	b=n2CvllgCw3RVYtfEaG6CSFTkyCE8qVJeiQhA59nCLgTY0BllvNL6BzHoQY4EJCBay
	 KQpW3oV1s9v78mJoxRlA6sf3WiBTNxCz/aLX7oPfJUthXCJZ0Ekow/JY3fxCgvFnfn
	 tpFht+d2vyIf7icHkm+lvJ7Z6XvoFmwOst0i0bfI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539uBXM3661737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:56:11 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:56:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:56:10 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539u9TS166451;
	Tue, 3 Jun 2025 04:56:10 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 0/4] "scm_conf" node cleanup for TI's Jacinto SoC family
Date: Tue, 3 Jun 2025 15:26:05 +0530
Message-ID: <20250603095609.33569-1-j-choudhary@ti.com>
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

Hello All,

Now that we have PCIE ctrl node in scm_conf[0], we can go ahead and
convert "scm_conf" from "syscon" to "simple-bus".

For J7200, J721E and J721S2, "scm_conf" node is converted from a "syscon"
to a "simple-bus".
For J784S4, it removes the unnecessary "reg" property from "scm_conf" node
which already has a "simple-bus" compatible.

[0]: https://lore.kernel.org/all/174500270525.95799.12263001003103973109.b4-ty@ti.com/

Jayesh Choudhary (4):
  arm64: dts: ti: k3-j721e-main: Make the "scm_conf" node a "simple-bus"
  arm64: dts: ti: k3-j7200-main: Make the "scm_conf" node a "simple-bus"
  arm64: dts: ti: k3-j721s2-main: Make the "scm_conf" node a
    "simple-bus"
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Remove "reg" from
    "scm_conf"

 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi                | 5 ++---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi                | 5 ++---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi               | 5 ++---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 1 -
 4 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.34.1


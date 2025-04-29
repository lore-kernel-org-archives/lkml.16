Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2E924290C;
	Tue, 29 Apr 2025 16:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944431; cv=none; b=gJ3tHbzZpkOff1+57/sCqCRJh4EtSkiEFTeIPMYz99bzazfUC917kzfWj3Ow2lJ/A+PPgS03W5EzS98+/ft+NkaiZo7UWut+NLuPYgu4RDZJQemMtYdM5nk6fzs658PghuT8FcG9Ozp8aPGqcmeH4wwu3X4BKj82M+RMYL7uWko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944431; c=relaxed/simple;
	bh=u2nnUWFZyeaUlcKUTzRvXJUSJDS/GwSvtgl2IU4J2UA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AkxRCWttbcNWsLdTIIFQFi3Nm9NR1Kr9cUyeBoaO5vfI3l2widGTRF8elDNr5aavPpvUeeMUs3mn8TlryZphxpT4sfTbem2b1on94Bnz+zcjkIdkpaqESH2wfMVoCzbGS/l1nOv69sxQ6vaht0qcbYBU+/nw6zLTTI0AF/s3JlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uUi4JEz2; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uUi4JEz2"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TGXbFq3722128
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 11:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745944417;
	bh=phAgRZDLcEJL+2Qt4p20wfF/jzjcFFMyigWTHHdSwyM=;
	h=From:To:CC:Subject:Date;
	b=uUi4JEz2qI1eDMijaOFWC73rACjTB3ACNAB3xU0K0w+jMXJH5+v1oZ0k5wovH/oVJ
	 0w0Id6pHxRrpM+eFC8bSW3JyGabij8aLfl6L7zBfV1xKKU+sRYuCvcLgkI2DhrcMyo
	 F2eO1QVzLUANxxsLC5z/jbcnx3j5EKgTL/hLykxo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TGXbE8019666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 11:33:37 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 11:33:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 11:33:37 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TGXb2J093065;
	Tue, 29 Apr 2025 11:33:37 -0500
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
	<u-kumar1@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: [PATCH v2 0/3] Set eMMC clock parent to default
Date: Tue, 29 Apr 2025 11:33:34 -0500
Message-ID: <20250429163337.15634-1-jm@ti.com>
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

This series was split-off from "Misc MMC updates" patch series [0] and the
original patch further divided into three to help with backporting as per
review comments [1].

This series sets clock parent for eMMC to the default clock parent
MAIN_PLL0_HSDIV5_CLKOUT for am62, am62a, & am62p/j722s SoCs. Software (DM)
does not switch MMC clock parent correctly as per the Arasan IP requirement
to hold the IP in reset while clock source is switched. Since muxes to
switch clock parent are not glitch-free and the default parent is tested
and working fine, switch to the default as a preventative action.

Changes since v1:
- split original patch into three
- add cover-letter
- reword patch descriptions
- add review tags

[0] https://lore.kernel.org/linux-devicetree/20250417233040.3658761-1-jm@ti.com/
[1] https://lore.kernel.org/linux-devicetree/20250429142825.bvrbpoc5iz32wh35@garment/

Link to v1:
https://lore.kernel.org/linux-devicetree/20250429142333.4140010-1-jm@ti.com/

Judith Mendez (3):
  arm64: dts: ti: k3-am62-main: Set eMMC clock parents to default
  arm64: dts: ti: k3-am62a-main: Set eMMC clock parents to default
  arm64: dts: ti: k3-am62p-j722s-common-main: Set eMMC clock parents to
    default

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
 3 files changed, 6 deletions(-)


base-commit: d864bb528a6725e775d564fd4430762acbb9dd0d
-- 
2.49.0


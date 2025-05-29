Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C707722A817;
	Thu, 29 May 2025 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525709; cv=none; b=PhhiCLX4rhVL9sTld2EXNNBvRbIxhbbBCMIOknJIhdnvgGLwXd4CoDYjyCTb1QQ2U+E8REAh/OrDyn5+V8qKKlw8psb4YCoB8jr76Yf8wLyaFVKw5c01lvpnIDz+/kzLcs7RFuHPLXebuMHqAHpQHX6533G+sAMLtObnUvNx/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525709; c=relaxed/simple;
	bh=auCqu/A2chn9qI61rk0v6jutTIRphgbvOdGjnHKkFm0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ubZJZZvF8BlDXFlZQz/RPtNpSjqDmVuPL2czVwotnGXCYGOK28MxcdYIO7cTzyj0NgjV/LyRzrrPVdCGtvIsBkRNI2NSsEfTqrz1U4CChy7vWCMBfTjtEsb2s0EMVSUOGzlza6aclMotHAJD0WJCJl8m8hq4lqYU/OgS3dywZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vghXUpSW; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vghXUpSW"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDYmdk2378424;
	Thu, 29 May 2025 08:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525688;
	bh=K+DtiYfEQ69sC7t4z3+fzWpvG+vUEJo0fRdsX7ekjuA=;
	h=From:To:CC:Subject:Date;
	b=vghXUpSWuGLL3sjMCs6OlUHRnvevqAB6XJJ55ppAiOYrh3Bq3ezxv2VL5Y9TMnimF
	 iANUnWj5TpuNxMnNkAXGj44Bo4CkiwF7Pt2T4dVV/lg465sq71Fxkg/ngZEWuHweN7
	 /toNIBThohwn49NZvxv52P63/MDlM2Ln1emY/RU4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDYmqC2201524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:34:48 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:34:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:34:48 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8g1650971;
	Thu, 29 May 2025 08:34:44 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 00/13] TI-K3-DTS: Cleanup CPSW DT Nodes
Date: Thu, 29 May 2025 19:04:30 +0530
Message-ID: <20250529133443.1252293-1-s-vadapalli@ti.com>
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

Hello,

This series cleans up the CPSW Device-tree nodes by updating the SoC and
board files to keep CPSW disabled in the SoC files and enable it only in
the board files.

The following is a summary of the SoCs, CPSW instance and the Boards that
this series affects:

-----    -------    ----------------  --------------------------------------------
S.No.      SoC        CPSW Instance                    Board(s)
-----    -------    ----------------  --------------------------------------------
  1.       AM62          CPSW3G           AM625-Beagleplay, AM62-LP-SK, AM625-SK
  2.       AM65        MCU CPSW2G         AM654-Base-Board, IOT-2050 Based Boards
  3.       J7200       MCU CPSW2G         J7200-Common-Processor-Board
  4.       J721E       MCU CPSW2G         J721E-Common-Processor-Board
  5.       J721S2      MCU CPSW2G         J721S2-Common-Processor-Board

Series is based on linux-next tagged next-20250529.

I am posting this series to receive feedback and Reviewed-by / Tested-by tags.
I will repost the series when the merge window opens.

Logs:
1. AM625-SK:
https://gist.github.com/Siddharth-Vadapalli-at-TI/aa812fda8c0653f387931bb90f12cdd0
2. AM654-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/128b7ef2e0c371db4c8b3a4c4ddefcc6
3. J7200-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/66837169f7370faa2dae05cb39bdaad5
4. J721E-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/ad0f12f9aab3cd9b55f221062c53493d
5. J721S2-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/07dd468558f90d7637f8536d935d2368

Regards,
Siddharth.

Siddharth Vadapalli (13):
  arm64: dts: ti: k3-am625-beagleplay: Enable "cpsw3g" in the board file
  arm64: dts: ti: k3-am62-lp-sk: Enable "cpsw3g" in the board file
  arm64: dts: ti: k3-am625-sk: Enable "cpsw3g" in the board file
  arm64: dts: ti: k3-am62-main: Disable "cpsw3g" in the SoC file
  arm64: dts: ti: k3-am654-base-board: Enable "mcu_cpsw" in board file
  arm64: dts: ti: k3-am65-mcu: Disable "mcu_cpsw" in the SoC file
  arm64: dts: ti: iot2050-common: Remove redundant "mcu_cpsw" node
    status
  arm64: dts: ti: k3-j7200-common-proc-board: Enable "mcu_cpsw" in board
    file
  arm64: dts: ti: k3-j7200-mcu-wakeup: Disable "mcu_cpsw" in the SoC
    file
  arm64: dts: ti: k3-j721e-common-proc-board: Enable "mcu_cpsw" in board
    file
  arm64: dts: ti: k3-j721e-mcu-wakeup: Disable "mcu_cpsw" in the SoC
    file
  arm64: dts: ti: k3-j721s2-common-proc-board: Enable "mcu_cpsw" in
    board file
  arm64: dts: ti: k3-j721s2-mcu-wakeup: Disable "mcu_cpsw" in the SoC
    file

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts               | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 ++
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am625-sk.dts                 | 1 +
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi     | 4 ----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi                | 2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 13 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.34.1


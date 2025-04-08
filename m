Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B82261368;
	Tue,  8 Apr 2025 06:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092415; cv=none; b=s7RAX4ogFWkKtMtq/LUBWBJxvv7stBOkaLnsjcga4noMKljKRtYLxwDG2PdkaP/PBLnhNa6EIWCFuL79evHFW71Z94yHNIX4l9slnXf/5a/Hs3jQJ+00YJTvBSpSwlzhxh5zdpUsAI4PKkv1fSVdCL/KLrmms3DJX9HR+HUseew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092415; c=relaxed/simple;
	bh=lbyr4jAcBGFK8mXvlPAmwgrKXYVaOjbCX2i/IuY5L1U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJ6tAS5Ox/athuSMiUioLfgO4jxreqO18pMBo4Bk4JwtVpWD0LI8VmtirEewjozKnk8U8+IrdULNHt7NUx2Gx5kdwnvAocM2W7w6lLALmpLh2o7FeeudMl/1uUCSoY3tcQD9iJ6sbFdYkYLcCXe6NMqH+SAmsaxk1pxPuoC/jTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VrANH8gc; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VrANH8gc"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53866l1C1125966
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 01:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744092407;
	bh=fyZscUILXrq7HToqkjP2DEJv/CIstI5SN7efBYH3aaw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VrANH8gccndwQImRnI7znA/SNWESJbWJHGbAap4lkzAIexP1YUjxG9HMPDmZizUbU
	 W5xlO0XdBLtKh0xw3C1RUuv8/Li9qJ8jUoUG+kmaNRgLF8KbMThUN7Y5+dNOQmoaSt
	 XlkHV4iK2RjXSDSiwepcbMHRtVElNtQEQ1+YtbVs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53866lVY112422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 01:06:47 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 01:06:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 01:06:47 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53866bvq080076;
	Tue, 8 Apr 2025 01:06:44 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"
Date: Tue, 8 Apr 2025 11:36:36 +0530
Message-ID: <20250408060636.3413856-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408060636.3413856-1-s-vadapalli@ti.com>
References: <20250408060636.3413856-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Since "serdes0" and "serdes1" which are the sub-nodes of "serdes_wiz0"
and "serdes_wiz1" respectively, have been disabled in the SoC file already,
and, given that these sub-nodes will only be enabled in a board file if the
board utilizes any of the SERDES instances and the peripherals bound to
them, we may end up in a situation where the board file doesn't explicitly
disable "serdes_wiz0" and "serdes_wiz1". As a consequence of this, the
following errors show up when booting Linux:

  wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
  ...
  wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12

To not only fix the above, but also, in order to follow the convention of
disabling device-tree nodes in the SoC file and enabling them in the board
files for those boards which require them, disable "serdes_wiz0" and
"serdes_wiz1" device-tree nodes.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 6850f50530f1..beda9e40e931 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -32,6 +32,8 @@ serdes_wiz0: phy@f000000 {
 		assigned-clocks = <&k3_clks 279 1>;
 		assigned-clock-parents = <&k3_clks 279 5>;
 
+		status = "disabled";
+
 		serdes0: serdes@f000000 {
 			compatible = "ti,j721e-serdes-10g";
 			reg = <0x0f000000 0x00010000>;
@@ -70,6 +72,8 @@ serdes_wiz1: phy@f010000 {
 		assigned-clocks = <&k3_clks 280 1>;
 		assigned-clock-parents = <&k3_clks 280 5>;
 
+		status = "disabled";
+
 		serdes1: serdes@f010000 {
 			compatible = "ti,j721e-serdes-10g";
 			reg = <0x0f010000 0x00010000>;
-- 
2.34.1


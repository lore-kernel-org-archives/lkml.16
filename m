Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazrln10223025.outbound.protection.outlook.com [52.103.202.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4F2846F;
	Sun,  6 Jul 2025 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.202.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751816179; cv=fail; b=hbhenyppzmWs7t4P2mvXHI4l029Pn4zSaT5gLoU2f1fsSF823TuGNaY9fJb2usDu8lEjebUngULPD3WfuMgX79IL6o8KXoFU95jmS9IrVCrHeU1XeOsMXL8cNXAU4WV9yMPblSPg/fIQDR6nsDlnAhkmB9GJvViFPQKTMopjAKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751816179; c=relaxed/simple;
	bh=73TgGkmcXiPRHajnPGcQFot2sAzwo7OehtpClEzuD6I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oOPaNCFkU3ELLkU3QipV6+cSWrCsHrOWBul0NmNMC2iumz0IxkTA66G/va/1fl0RjTj1Ds+amAGKObUd7qkQ+PQbLiJNtBY13Ha8qO97qvVbRlRIzJ28S2VClOc+byI3J/RiAvCR16V4ffziSwGOf5g5StKebXkpProLCscYb+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=taln60.nuvoton.co.il; dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b=qOpkmsnH; arc=fail smtp.client-ip=52.103.202.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.b="qOpkmsnH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftLkbjwnYv8SEOL5mc6I0Cg0/0B0QM4GQLqarHOXwAcnCDtdbJ1LhMbPU0f59tTp+ovICEm4E+vEOrz1EIaw+FbJTrBJ2HYXm7SDbMUUEA9NHm15ceuG2jrFs7NwrBLHHniP8QRHTy7qqtEueek5/bJsrNT+4t9X5YptTi2SH/hk/P1TTaUYJZhyEFa4cULhvbEY05avB1V1jN4N7PNcgW079kHEEWqNLF7YemhkpCOJNuhyiltPp52UiYYo4cdcDSfSFRU++g4eFUiywMAqNQZPQA/Vq8ZgyQ+ajerS7hdmfvHchtE3FSh4pSVE8gPTBmTORj1D3SBAdPkMeVTuwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3EDT0To19aRCPpM+Jdbprdpyo50irPNarEweUcTeOU=;
 b=psMMnt5PyObjxkjTInHdoTLwdhfWNunVAkkUBSNStP2z+Bz/rnT4d9dpioZamfJk2+zZEFPqcOIAaVga205mc2/GIejFJH2UrLsBB25oJ2Pk84/P2eRnOttFh8qqM2X2bkAzGrpHR0jIbfHuYcipdkd77j9O7S+XCm0Zb5gNDl7Q7MrOzsZ59yoSD0vnWDrD7JtB1j7BAhHDguuLj6nnlm7yAeDLgcZlc1A1ze1fOpqoAzGUEjPjKR9FAKxwt5dGoWnjw6AARonyarzHu0u08steOi+tzDFgwLcQBHzURpIqxHuZYOsbgoWEAGcE42HY3Hv1i0JHRupLpgdXPcSYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 211.75.126.7) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=taln60.nuvoton.co.il; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3EDT0To19aRCPpM+Jdbprdpyo50irPNarEweUcTeOU=;
 b=qOpkmsnH1pdzW5yjk4H7KHcQRLqlCYUadJb51xb3Cdhb3hw7gGmP8xquthPEbHAq1666xUXedpWPMS7xft+K3oSofvH5Ombcs4iQhUY6LQHEewH8Fd9vMCs2zalvNJtBj1EaxIYN9P5y9QJE1jyDgCHKxBaocsX1zjGrBlKKfZ8=
Received: from SG2PR02CA0071.apcprd02.prod.outlook.com (2603:1096:4:54::35) by
 KU2PPF31556EE6A.apcprd03.prod.outlook.com (2603:1096:d18::40e) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.37; Sun, 6 Jul 2025 15:35:56 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:54:cafe::58) by SG2PR02CA0071.outlook.office365.com
 (2603:1096:4:54::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Sun,
 6 Jul 2025 15:35:56 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 211.75.126.7) smtp.mailfrom=taln60.nuvoton.co.il; dkim=none (message not
 signed) header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of taln60.nuvoton.co.il: DNS Timeout)
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20 via Frontend Transport; Sun, 6 Jul 2025 15:35:54 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Sun, 6 Jul
 2025 23:35:53 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 6 Jul 2025 23:35:53 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id CCD6D5F5D9;
	Sun,  6 Jul 2025 18:35:52 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id BB4E5DC386B; Sun,  6 Jul 2025 18:35:52 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
	<joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1] arm64: dts: nuvoton: npcm845: Add pinctrl groups
Date: Sun, 6 Jul 2025 18:35:51 +0300
Message-ID: <20250706153551.2180052-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|KU2PPF31556EE6A:EE_
X-MS-Office365-Filtering-Correlation-Id: 7958ba54-81b6-402c-1666-08ddbca2cbdc
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|48200799018|7093399015|35950700016|61400799027|35450700002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?09MRbyUPbKmTCwdh0/QW5Q/AyCsYYuzcPtKJvAuiAS95vydRtmrW2W6AITFL?=
 =?us-ascii?Q?LvIPxSKcUAoHNoZ4H5CkWAwKpqQdqY/S4y03QE0iUMtg1tJUxN0zPO8cirIq?=
 =?us-ascii?Q?388JOIZguk+GMQB8LKvrdh8n/XqokWZBGHhQK6JrF8BPllqnFrT5DyOI1hyZ?=
 =?us-ascii?Q?HslkzxfXKLNK/K8AgmGqtndjZ95nUG3PZlFtGnEBbCIrtxH8/S3zkhOuENkF?=
 =?us-ascii?Q?YFdScZ7QnYmfEt75R7/3eaxdcpwuQpV7S75GKs2onXVlWXrqr81wHpORliEi?=
 =?us-ascii?Q?mJMB9uGwS9Hf++BmIFc9amJcFwy/R9JLcMlWLIygwAEnUc+9r7uLBzdAhWdH?=
 =?us-ascii?Q?ocySQvu+uwE55Ed4V18Z/aO5OD0d+buqB33G/6OwWvi9eK0CwzzARk6Z09/M?=
 =?us-ascii?Q?QKN+x7p4tKgGZRo5vxz4crEWFhgdsI/okioAaA7gF3ZxQPPVWJIc6p8Nx3Wd?=
 =?us-ascii?Q?y11FBXb/ryYe7Ck0ITSQek6zivDPgB6Z2cCnOIoFgkrfGbORLhY4tEz5dopU?=
 =?us-ascii?Q?fUz8JmQC2oK1wLzdvPjZOUhjspI7f5H+JlWcuxPuIrQkT+0wez1VwPe1wxre?=
 =?us-ascii?Q?3PTjEhcHXss5g3re6lmHN6IfKsSvOTC6ZiHz63R0KAGoExmOjaTo5joBmIm4?=
 =?us-ascii?Q?7UgY/ML2/Ke/4txGaMv3BaT4gDfZR7vcqgv2ZVRMP6TjZ8SaHp3PJnJhYuIi?=
 =?us-ascii?Q?ZCw97bz1N8O3jXDtJMnOnUpRenN9eem4WWGx//FYPNRv1PwiGa4u1rPKX3qH?=
 =?us-ascii?Q?x4LQ7janfvjs1OZZcMtGpCUs/2mMfDYbdAqs0P0YoXZ0Qdd8WCbu8Q4cngPl?=
 =?us-ascii?Q?c1913h5AFow67YsnI3p7cQsAPe09Y2upjbp02il61mdWAUGO+QK6KzuBdJje?=
 =?us-ascii?Q?qqqi2AYsdDL5g6vTKEsnTxjavG0HLoIBgoXfAZpXbknbLg6orOOVraJW2FsI?=
 =?us-ascii?Q?rSGQc1Syln/HLP9kKOCUhrUnasK7qet2sj9MCNA9/rhGEp9SmjfFSv334LvO?=
 =?us-ascii?Q?PScFMrEc+skwcUy5Gpkxx/XLtdfw6YlaEWcxSPVqX6sj8OuWSDQk8Bh/o4NB?=
 =?us-ascii?Q?LcTK2FDbtd+ZQp4attSoucPVnQBStm8wcENtbsHPhaPKXCiCHnbWUc4hzVUN?=
 =?us-ascii?Q?ISEb+BUhJxzUZGVYZ4VA3xSWY8/Hq64/vhVaFi6z5RMO1+kPIQg3pQtRW0dm?=
 =?us-ascii?Q?R1oQEQPOXxcqlWEWwqapKjH0c9PRZVInmwCorppFya1Hp0jKGstL53K8IhbH?=
 =?us-ascii?Q?mhRGaQI6pxaYSgb3yWf8onhDL+A8N1zsUORH0nPyoI92//2KDaF5ojufeVck?=
 =?us-ascii?Q?2VdGeXtHRMb5+mL4X10lBuSTvwnFXdG197MRdNC9CRP3vC40OHGuDHpEZ6Ml?=
 =?us-ascii?Q?QQO3HCA+PI78Ijz76P0b7ZGG3TUqDeAUl41CkHvwB21ez3XgMwIfuu0/WgNu?=
 =?us-ascii?Q?Stx2+ZcsSB0U3aivS1fTUwLroqTp8NZvM4zxQvAIV+OhUIbzyz3xfhjHDaAL?=
 =?us-ascii?Q?dGqh/pR2XHdY6D9RY5McYnmD0JxCEB1Bn17n?=
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(48200799018)(7093399015)(35950700016)(61400799027)(35450700002);DIR:OUT;SFP:1022;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 15:35:54.6220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7958ba54-81b6-402c-1666-08ddbca2cbdc
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF31556EE6A

Add 64 missing pinctrl groups to the NPCM845 device tree source file to
support additional pinmux configurations defined in the npcm845-pinctrl
driver.

This enhances the pinmux configuration for the NPCM845 SoC, enabling
further hardware pin functionalities.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 649 ++++++++++++++++++
 1 file changed, 649 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 04a5029bfc7e..5cd877e6c20a 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -236,5 +236,654 @@ gpio7: gpio@f0017000 {
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-ranges = <&pinctrl 0 224 32>;
 		};
+
+		iox1_pins: iox1-mux {
+			groups = "iox1";
+			function = "iox1";
+		};
+		iox2_pins: iox2-mux {
+			groups = "iox2";
+			function = "iox2";
+		};
+		smb1d_pins: smb1d-mux {
+			groups = "smb1d";
+			function = "smb1d";
+		};
+		smb2d_pins: smb2d-mux {
+			groups = "smb2d";
+			function = "smb2d";
+		};
+		lkgpo1_pins: lkgpo1-mux {
+			groups = "lkgpo1";
+			function = "lkgpo1";
+		};
+		lkgpo2_pins: lkgpo2-mux {
+			groups = "lkgpo2";
+			function = "lkgpo2";
+		};
+		ioxh_pins: ioxh-mux {
+			groups = "ioxh";
+			function = "ioxh";
+		};
+		gspi_pins: gspi-mux {
+			groups = "gspi";
+			function = "gspi";
+		};
+		smb5b_pins: smb5b-mux {
+			groups = "smb5b";
+			function = "smb5b";
+		};
+		smb5c_pins: smb5c-mux {
+			groups = "smb5c";
+			function = "smb5c";
+		};
+		lkgpo0_pins: lkgpo0-mux {
+			groups = "lkgpo0";
+			function = "lkgpo0";
+		};
+		pspi_pins: pspi-mux {
+			groups = "pspi";
+			function = "pspi";
+		};
+		jm1_pins: jm1-mux {
+			groups = "jm1";
+			function = "jm1";
+		};
+		jm2_pins: jm2-mux {
+			groups = "jm2";
+			function = "jm2";
+		};
+		smb4b_pins: smb4b-mux {
+			groups = "smb4b";
+			function = "smb4b";
+		};
+		smb4c_pins: smb4c-mux {
+			groups = "smb4c";
+			function = "smb4c";
+		};
+		smb15_pins: smb15-mux {
+			groups = "smb15";
+			function = "smb15";
+		};
+		smb16_pins: smb16-mux {
+			groups = "smb16";
+			function = "smb16";
+		};
+		smb17_pins: smb17-mux {
+			groups = "smb17";
+			function = "smb17";
+		};
+		smb18_pins: smb18-mux {
+			groups = "smb18";
+			function = "smb18";
+		};
+		smb19_pins: smb19-mux {
+			groups = "smb19";
+			function = "smb19";
+		};
+		smb20_pins: smb20-mux {
+			groups = "smb20";
+			function = "smb20";
+		};
+		smb21_pins: smb21-mux {
+			groups = "smb21";
+			function = "smb21";
+		};
+		smb22_pins: smb22-mux {
+			groups = "smb22";
+			function = "smb22";
+		};
+		smb23_pins: smb23-mux {
+			groups = "smb23";
+			function = "smb23";
+		};
+		smb23b_pins: smb23b-mux {
+			groups = "smb23b";
+			function = "smb23b";
+		};
+		smb4d_pins: smb4d-mux {
+			groups = "smb4d";
+			function = "smb4d";
+		};
+		smb14_pins: smb14-mux {
+			groups = "smb14";
+			function = "smb14";
+		};
+		smb5_pins: smb5-mux {
+			groups = "smb5";
+			function = "smb5";
+		};
+		smb4_pins: smb4-mux {
+			groups = "smb4";
+			function = "smb4";
+		};
+		smb3_pins: smb3-mux {
+			groups = "smb3";
+			function = "smb3";
+		};
+		spi0cs1_pins: spi0cs1-mux {
+			groups = "spi0cs1";
+			function = "spi0cs1";
+		};
+		spi1cs0_pins: spi1cs0-mux {
+			groups = "spi1cs0";
+			function = "spi1cs0";
+		};
+		spi1cs1_pins: spi1cs1-mux {
+			groups = "spi1cs1";
+			function = "spi1cs1";
+		};
+		spi1cs2_pins: spi1cs2-mux {
+			groups = "spi1cs2";
+			function = "spi1cs2";
+		};
+		spi1cs3_pins: spi1cs3-mux {
+			groups = "spi1cs3";
+			function = "spi1cs3";
+		};
+		smb3c_pins: smb3c-mux {
+			groups = "smb3c";
+			function = "smb3c";
+		};
+		smb3b_pins: smb3b-mux {
+			groups = "smb3b";
+			function = "smb3b";
+		};
+		bmcuart0a_pins: bmcuart0a-mux {
+			groups = "bmcuart0a";
+			function = "bmcuart0a";
+		};
+		uart1_pins: uart1-mux {
+			groups = "uart1";
+			function = "uart1";
+		};
+		jtag2_pins: jtag2-mux {
+			groups = "jtag2";
+			function = "jtag2";
+		};
+		bmcuart1_pins: bmcuart1-mux {
+			groups = "bmcuart1";
+			function = "bmcuart1";
+		};
+		uart2_pins: uart2-mux {
+			groups = "uart2";
+			function = "uart2";
+		};
+		bmcuart0b_pins: bmcuart0b-mux {
+			groups = "bmcuart0b";
+			function = "bmcuart0b";
+		};
+		r1err_pins: r1err-mux {
+			groups = "r1err";
+			function = "r1err";
+		};
+		r1md_pins: r1md-mux {
+			groups = "r1md";
+			function = "r1md";
+		};
+		r1oen_pins: r1oen-mux {
+			groups = "r1oen";
+			function = "r1oen";
+		};
+		r2oen_pins: r2oen-mux {
+			groups = "r2oen";
+			function = "r2oen";
+		};
+		rmii3_pins: rmii3-mux {
+			groups = "rmii3";
+			function = "rmii3";
+		};
+		r3oen_pins: r3oen-mux {
+			groups = "r3oen";
+			function = "r3oen";
+		};
+		smb3d_pins: smb3d-mux {
+			groups = "smb3d";
+			function = "smb3d";
+		};
+		fanin0_pins: fanin0-mux {
+			groups = "fanin0";
+			function = "fanin0";
+		};
+		fanin1_pins: fanin1-mux {
+			groups = "fanin1";
+			function = "fanin1";
+		};
+		fanin2_pins: fanin2-mux {
+			groups = "fanin2";
+			function = "fanin2";
+		};
+		fanin3_pins: fanin3-mux {
+			groups = "fanin3";
+			function = "fanin3";
+		};
+		fanin4_pins: fanin4-mux {
+			groups = "fanin4";
+			function = "fanin4";
+		};
+		fanin5_pins: fanin5-mux {
+			groups = "fanin5";
+			function = "fanin5";
+		};
+		fanin6_pins: fanin6-mux {
+			groups = "fanin6";
+			function = "fanin6";
+		};
+		fanin7_pins: fanin7-mux {
+			groups = "fanin7";
+			function = "fanin7";
+		};
+		fanin8_pins: fanin8-mux {
+			groups = "fanin8";
+			function = "fanin8";
+		};
+		fanin9_pins: fanin9-mux {
+			groups = "fanin9";
+			function = "fanin9";
+		};
+		fanin10_pins: fanin10-mux {
+			groups = "fanin10";
+			function = "fanin10";
+		};
+		fanin11_pins: fanin11-mux {
+			groups = "fanin11";
+			function = "fanin11";
+		};
+		fanin12_pins: fanin12-mux {
+			groups = "fanin12";
+			function = "fanin12";
+		};
+		fanin13_pins: fanin13-mux {
+			groups = "fanin13";
+			function = "fanin13";
+		};
+		fanin14_pins: fanin14-mux {
+			groups = "fanin14";
+			function = "fanin14";
+		};
+		fanin15_pins: fanin15-mux {
+			groups = "fanin15";
+			function = "fanin15";
+		};
+		pwm0_pins: pwm0-mux {
+			groups = "pwm0";
+			function = "pwm0";
+		};
+		pwm1_pins: pwm1-mux {
+			groups = "pwm1";
+			function = "pwm1";
+		};
+		pwm2_pins: pwm2-mux {
+			groups = "pwm2";
+			function = "pwm2";
+		};
+		pwm3_pins: pwm3-mux {
+			groups = "pwm3";
+			function = "pwm3";
+		};
+		r2_pins: r2-mux {
+			groups = "r2";
+			function = "r2";
+		};
+		r2err_pins: r2err-mux {
+			groups = "r2err";
+			function = "r2err";
+		};
+		r2md_pins: r2md-mux {
+			groups = "r2md";
+			function = "r2md";
+		};
+		r3rxer_pins: r3rxer-mux {
+			groups = "r3rxer";
+			function = "r3rxer";
+		};
+		ga20kbc_pins: ga20kbc-mux {
+			groups = "ga20kbc";
+			function = "ga20kbc";
+		};
+		smb5d_pins: smb5d-mux {
+			groups = "smb5d";
+			function = "smb5d";
+		};
+		lpc_pins: lpc-mux {
+			groups = "lpc";
+			function = "lpc";
+		};
+		espi_pins: espi-mux {
+			groups = "espi";
+			function = "espi";
+		};
+		sg1mdio_pins: sg1mdio-mux {
+			groups = "sg1mdio";
+			function = "sg1mdio";
+		};
+		rg2_pins: rg2-mux {
+			groups = "rg2";
+			function = "rg2";
+		};
+		ddr_pins: ddr-mux {
+			groups = "ddr";
+			function = "ddr";
+		};
+		i3c0_pins: i3c0-mux {
+			groups = "i3c0";
+			function = "i3c0";
+		};
+		i3c1_pins: i3c1-mux {
+			groups = "i3c1";
+			function = "i3c1";
+		};
+		i3c2_pins: i3c2-mux {
+			groups = "i3c2";
+			function = "i3c2";
+		};
+		i3c3_pins: i3c3-mux {
+			groups = "i3c3";
+			function = "i3c3";
+		};
+		i3c4_pins: i3c4-mux {
+			groups = "i3c4";
+			function = "i3c4";
+		};
+		i3c5_pins: i3c5-mux {
+			groups = "i3c5";
+			function = "i3c5";
+		};
+		smb0_pins: smb0-mux {
+			groups = "smb0";
+			function = "smb0";
+		};
+		smb1_pins: smb1-mux {
+			groups = "smb1";
+			function = "smb1";
+		};
+		smb2_pins: smb2-mux {
+			groups = "smb2";
+			function = "smb2";
+		};
+		smb2c_pins: smb2c-mux {
+			groups = "smb2c";
+			function = "smb2c";
+		};
+		smb2b_pins: smb2b-mux {
+			groups = "smb2b";
+			function = "smb2b";
+		};
+		smb1c_pins: smb1c-mux {
+			groups = "smb1c";
+			function = "smb1c";
+		};
+		smb1b_pins: smb1b-mux {
+			groups = "smb1b";
+			function = "smb1b";
+		};
+		smb8_pins: smb8-mux {
+			groups = "smb8";
+			function = "smb8";
+		};
+		smb9_pins: smb9-mux {
+			groups = "smb9";
+			function = "smb9";
+		};
+		smb10_pins: smb10-mux {
+			groups = "smb10";
+			function = "smb10";
+		};
+		smb11_pins: smb11-mux {
+			groups = "smb11";
+			function = "smb11";
+		};
+		sd1_pins: sd1-mux {
+			groups = "sd1";
+			function = "sd1";
+		};
+		sd1pwr_pins: sd1pwr-mux {
+			groups = "sd1pwr";
+			function = "sd1pwr";
+		};
+		pwm4_pins: pwm4-mux {
+			groups = "pwm4";
+			function = "pwm4";
+		};
+		pwm5_pins: pwm5-mux {
+			groups = "pwm5";
+			function = "pwm5";
+		};
+		pwm6_pins: pwm6-mux {
+			groups = "pwm6";
+			function = "pwm6";
+		};
+		pwm7_pins: pwm7-mux {
+			groups = "pwm7";
+			function = "pwm7";
+		};
+		pwm8_pins: pwm8-mux {
+			groups = "pwm8";
+			function = "pwm8";
+		};
+		pwm9_pins: pwm9-mux {
+			groups = "pwm9";
+			function = "pwm9";
+		};
+		pwm10_pins: pwm10-mux {
+			groups = "pwm10";
+			function = "pwm10";
+		};
+		pwm11_pins: pwm11-mux {
+			groups = "pwm11";
+			function = "pwm11";
+		};
+		mmc8_pins: mmc8-mux {
+			groups = "mmc8";
+			function = "mmc8";
+		};
+		mmc_pins: mmc-mux {
+			groups = "mmc";
+			function = "mmc";
+		};
+		mmcwp_pins: mmcwp-mux {
+			groups = "mmcwp";
+			function = "mmcwp";
+		};
+		mmccd_pins: mmccd-mux {
+			groups = "mmccd";
+			function = "mmccd";
+		};
+		mmcrst_pins: mmcrst-mux {
+			groups = "mmcrst";
+			function = "mmcrst";
+		};
+		clkout_pins: clkout-mux {
+			groups = "clkout";
+			function = "clkout";
+		};
+		serirq_pins: serirq-mux {
+			groups = "serirq";
+			function = "serirq";
+		};
+		scipme_pins: scipme-mux {
+			groups = "scipme";
+			function = "scipme";
+		};
+		smb6_pins: smb6-mux {
+			groups = "smb6";
+			function = "smb6";
+		};
+		smb6b_pins: smb6b-mux {
+			groups = "smb6b";
+			function = "smb6b";
+		};
+		smb6c_pins: smb6c-mux {
+			groups = "smb6c";
+			function = "smb6c";
+		};
+		smb6d_pins: smb6d-mux {
+			groups = "smb6d";
+			function = "smb6d";
+		};
+		smb7_pins: smb7-mux {
+			groups = "smb7";
+			function = "smb7";
+		};
+		smb7b_pins: smb7b-mux {
+			groups = "smb7b";
+			function = "smb7b";
+		};
+		smb7c_pins: smb7c-mux {
+			groups = "smb7c";
+			function = "smb7c";
+		};
+		smb7d_pins: smb7d-mux {
+			groups = "smb7d";
+			function = "smb7d";
+		};
+		spi1_pins: spi1-mux {
+			groups = "spi1";
+			function = "spi1";
+		};
+		faninx_pins: faninx-mux {
+			groups = "faninx";
+			function = "faninx";
+		};
+		r1_pins: r1-mux {
+			groups = "r1";
+			function = "r1";
+		};
+		spi3_pins: spi3-mux {
+			groups = "spi3";
+			function = "spi3";
+		};
+		spi3cs1_pins: spi3cs1-mux {
+			groups = "spi3cs1";
+			function = "spi3cs1";
+		};
+		spi3quad_pins: spi3quad-mux {
+			groups = "spi3quad";
+			function = "spi3quad";
+		};
+		spi3cs2_pins: spi3cs2-mux {
+			groups = "spi3cs2";
+			function = "spi3cs2";
+		};
+		spi3cs3_pins: spi3cs3-mux {
+			groups = "spi3cs3";
+			function = "spi3cs3";
+		};
+		nprd_smi_pins: nprd-smi-mux {
+			groups = "nprd_smi";
+			function = "nprd_smi";
+		};
+		smi_pins: smi-mux {
+			groups = "smi";
+			function = "smi";
+		};
+		smb0b_pins: smb0b-mux {
+			groups = "smb0b";
+			function = "smb0b";
+		};
+		smb0c_pins: smb0c-mux {
+			groups = "smb0c";
+			function = "smb0c";
+		};
+		smb0den_pins: smb0den-mux {
+			groups = "smb0den";
+			function = "smb0den";
+		};
+		smb0d_pins: smb0d-mux {
+			groups = "smb0d";
+			function = "smb0d";
+		};
+		ddc_pins: ddc-mux {
+			groups = "ddc";
+			function = "ddc";
+		};
+		rg2mdio_pins: rg2mdio-mux {
+			groups = "rg2mdio";
+			function = "rg2mdio";
+		};
+		wdog1_pins: wdog1-mux {
+			groups = "wdog1";
+			function = "wdog1";
+		};
+		wdog2_pins: wdog2-mux {
+			groups = "wdog2";
+			function = "wdog2";
+		};
+		smb12_pins: smb12-mux {
+			groups = "smb12";
+			function = "smb12";
+		};
+		smb13_pins: smb13-mux {
+			groups = "smb13";
+			function = "smb13";
+		};
+		spix_pins: spix-mux {
+			groups = "spix";
+			function = "spix";
+		};
+		spixcs1_pins: spixcs1-mux {
+			groups = "spixcs1";
+			function = "spixcs1";
+		};
+		clkreq_pins: clkreq-mux {
+			groups = "clkreq";
+			function = "clkreq";
+		};
+		hgpio0_pins: hgpio0-mux {
+			groups = "hgpio0";
+			function = "hgpio0";
+		};
+		hgpio1_pins: hgpio1-mux {
+			groups = "hgpio1";
+			function = "hgpio1";
+		};
+		hgpio2_pins: hgpio2-mux {
+			groups = "hgpio2";
+			function = "hgpio2";
+		};
+		hgpio3_pins: hgpio3-mux {
+			groups = "hgpio3";
+			function = "hgpio3";
+		};
+		hgpio4_pins: hgpio4-mux {
+			groups = "hgpio4";
+			function = "hgpio4";
+		};
+		hgpio5_pins: hgpio5-mux {
+			groups = "hgpio5";
+			function = "hgpio5";
+		};
+		hgpio6_pins: hgpio6-mux {
+			groups = "hgpio6";
+			function = "hgpio6";
+		};
+		hgpio7_pins: hgpio7-mux {
+			groups = "hgpio7";
+			function = "hgpio7";
+		};
+		bu4_pins: bu4-mux {
+			groups = "bu4";
+			function = "bu4";
+		};
+		bu4b_pins: bu4b-mux {
+			groups = "bu4b";
+			function = "bu4b";
+		};
+		bu5_pins: bu5-mux {
+			groups = "bu5";
+			function = "bu5";
+		};
+		bu5b_pins: bu5b-mux {
+			groups = "bu5b";
+			function = "bu5b";
+		};
+		bu6_pins: bu6-mux {
+			groups = "bu6";
+			function = "bu6";
+		};
+		gpo187_pins: gpo187-mux {
+			groups = "gpo187";
+			function = "gpo187";
+		};
 	};
 };
-- 
2.34.1


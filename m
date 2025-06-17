Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72633290D8E;
	Tue, 17 Jun 2025 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150796; cv=fail; b=lzHCcbpU6GLUAbxkjv21sd4xiRAP1Eqi/3Mc4/9v/r/ycngvd+rSUYzGuVorRQhH69OaR6xlxBF37SVu7jqrJr3C9sJn+m2Mgqvi27B0JPHQfpaA//IQ+ixG0l52tnxba+9+JG073s/+HIkFMNfYTYNC46/Bpm4su21DLBPPfX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150796; c=relaxed/simple;
	bh=kWubV9DjTS+2erW6p2wyeoZKoSwaJdQ/riXueai6aho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WAJUZqIxgvBEWjERTsGdP1oklJqnCT0ztACNU2Ufmpp5qLVhPwfWUCI54UVt17qsGVWcG0yHeJzOi/465Azik2/EFKz4L9nkiGfwQal5FjFvAFEUAnjbfLA+GN2PUyXKnUVUL0JHX4q2VhStBVIzfScHk9K61WTRa927/z8Oj2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=cXJK25xa; arc=fail smtp.client-ip=40.107.237.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="cXJK25xa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETyY4/7+XoJEc2g0abYWuaI9a7Y7U+h9ooyBIjAPM5QGgKU4E/LFSpdEjgP8Y9MrlYPpicpO7OdkzsxoaPtSBAqFybG5aas5ebd2YPNIEWEn18EOrVyTGvKfPvZ/UehacFw90CALUqqVzJ1MHPie6J1/ff4E7YPiRa0JS1JSBuoQAopIJlBwY9N6nqA86ymiK7U+72LHSaXj8z2Mq51HQOZMENugCb73z2sePXghsPFXL+7H2TO10s1y9uQx2Azilc5Ra/SUvzmZG8tSpY5lxQleyyEZhMrKyN1y2+tWZhHZLdhpECfk4GHTrIOkKgwThSospkLuel7B5X2ZGpAu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwOBQUDlqCl3rHYae1iVdfMtgE/+2xKW+Y7BhKp1ULA=;
 b=b/v8dhKngc6+muIrjliCptvUg1saOvo+o+fEPflrk5wJsCYBkZmTU4ZLTmVB6gKU4K3LW6XhJEcJk9DmKgSvtPbmOJsgZn74tRXU2RbA+vkgdVFciwc/Kwgp3PiFWdiwfSpUQjej0EXvuojmw6djOem7GS0r2nyB3hfyXJUScKvl5coNxt5XUv8Aoe7j0q85XdWULGkTLBY4aS4ZdSgy/sGJH1C2MZeIiP+EH5Uf784dHwhKCE6C9r1+sdGz4M614y3sUOGfopZ1LBoxZ3U4ngL6oUbDn0PBDr/yyGRslqn9mqo6mb5Dou3tL+W/Qygov5VckHlKnlRxwdpzoCtBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwOBQUDlqCl3rHYae1iVdfMtgE/+2xKW+Y7BhKp1ULA=;
 b=cXJK25xau3ktTjvAcF8xA/6+5su7SEXpLVPrSogTTSCgbd2+RAmrCk3+aBoy5YOSfTBfIyoOACzuWxe7yPBHaqoG0TNTvtPFxkxqzIbT5+G4Dl6rf6G0cOPQ3qk7WnYAtI5X9gmFMZWqrPTLV+Khnnn0trfi1KgE0jENr96NGqoRBHViQCvmvPAQGkJ2Npqm+gl4evUSYA9FVJRLutKyW0xUthvHR7UW/vBJlxmkBDPtyjZnU5LZOdqe0wdMR/9/KHg4e9TTtxfPDf2ijd14UwrFGZxIfsJjcDTcihBrBCsy5I9EmaATNAaMOa+mnuQmR8fmnxcKn17BJHrgb4CYXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW5PR03MB6982.namprd03.prod.outlook.com (2603:10b6:303:1a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 08:59:51 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 08:59:51 +0000
From: adrianhoyin.ng@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com,
	Matthew Gerlach <matthew.gerlach@altrera.com>
Subject: [PATCH v2 1/2] arm64: dts: socfpga: agilex5: Add SMMU-V3-PMCG nodes
Date: Tue, 17 Jun 2025 16:58:54 +0800
Message-ID: <88923b0046c37bd9937cc381e03aa8d8721cf403.1750150179.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1750150179.git.adrianhoyin.ng@altera.com>
References: <cover.1750150179.git.adrianhoyin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) To
 DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MW5PR03MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: df53e880-3d7a-4545-6a7e-08ddad7d5223
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?epbmmLIDafG39QelAaxz82odHytVw5ZsXl0jNv7nOJJOpeAJQ7sQZA0pW5s7?=
 =?us-ascii?Q?jU5o+8dy+ed3WWt7w3/q44qQ6NTkjMlOHV3b6O95juCvltpS4G+p/2+MG3NX?=
 =?us-ascii?Q?ojaEsorVUNwNIKeexreMJQ8qPizZBwRBuegFbcpcw7YBRMoPdHvmNVImjEP8?=
 =?us-ascii?Q?INHbW6epHY7NDQK+Z7Ja59PSADd6BWKMk+GSXSDylV4HKuZZiFU+8K5ZEJOw?=
 =?us-ascii?Q?J7molCdUeumHieBCN+3B6i4/Vrj4nhyP7Pj7IEii/voYUpHheuTj1YrHWCOc?=
 =?us-ascii?Q?IP8E0n1IrIP8R3iHEs9x1LEwIMIAvYi4ROkoWpCXmEvGGWE/pNn+9yCVXNAp?=
 =?us-ascii?Q?uK3dew4wDJSFdr7Bs7acOGqMjTlMce2OCd/NgkCVJukOMXmO6Om7AX4yP3yT?=
 =?us-ascii?Q?+Dor/FQLZl/w8pILGSRfXxjENif5gYhASQmtuDJ2nqg5t9z2NEmQJbbhCblB?=
 =?us-ascii?Q?DjSDY3xjcmhdX2rL8ZKj32U9uMLe0DQG9MC3WUjfc54Om4XdxvQDm1iH+AXB?=
 =?us-ascii?Q?78tTY5kBgyoQevlctVgPiTRB3Oqgeo8HO8nf53A5LzXVkKWwyB5Gi1cCclyp?=
 =?us-ascii?Q?ySsd6D31WlsP+8IkRUtVbJG8QPxl9emiZPppg25QDu2wsZ5ST6m7ML1BrdX1?=
 =?us-ascii?Q?THinRPINx9xTKGxL8bNJBmnbk1b2gjtkV7USbeCs+YQGzW2ZXY61aA6NtWl1?=
 =?us-ascii?Q?qD/EjMr9Y3PFv3Mg9jt+jT9UdNnnbaTDkotuxBqQVY8iozi0/9aZCpZ23fdL?=
 =?us-ascii?Q?VfS+5DVBOzlBL/7tCdaBC+l0pjk/RvRAGec5l8S4dLt3+J0eeNuawYNxCY/G?=
 =?us-ascii?Q?jT7LHner4BOnxDjvvjZkA/oE0BxCYCW9zLGTpGkvn5n71SLh3Obr4nSof8wP?=
 =?us-ascii?Q?EkJTmgXBtzQjdBR5CMOfO1XpNGyMKQ0e/gRJO4GMADHB01E2NPRnDmrmzh0b?=
 =?us-ascii?Q?oAkdq/ii7CbUnbrl9PGw+6cqVPW+KUu1UIETj1DYGD+Yftc7YTyLo4xKo8Sg?=
 =?us-ascii?Q?NDp3VnrSmlCC4CrZif4xF5YreWnYuKXQnLrNXzDSTx3/2cbRzOdXn8jxiFmD?=
 =?us-ascii?Q?jnYmmcxdiHFy9vB3h3kej3/haIEq5v9fKQXrSA1xFL35wXZ3N6ROfsFPGHoW?=
 =?us-ascii?Q?cwnB49eDxQgztXCo8ElT5nm4d8hozpSjp6FZiKyqRqNa7hDQdUZHUGYeQnF1?=
 =?us-ascii?Q?eEYLA1UaFu2Glo7KiVN5L/kSAp7GcZvDi/JfsDlK9pvoGCKZHICjP/mwo/qc?=
 =?us-ascii?Q?qaaf6fkG1ZQZjfzxQfpU88E7xpnUiEX5BV8xT46DV4+qxfCa9PKmJGwOF9qo?=
 =?us-ascii?Q?9KczkB7f5hS/lHgYOhNKOtsCOF8fj8j0ugfSfFmJru/1KyYkKDjhFzz9SvUh?=
 =?us-ascii?Q?J1H1HzklmbDRb3heJaMRqoIsKuPwzI50qobqQ0nbDMXuQ4I7ZrszU9hYVSWK?=
 =?us-ascii?Q?7P7mhk35qDc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CUjr7odedDPJzC07KkSNzKc16Vg13goiLxJNnbADugWH4NcbcZsAdbSV4bDz?=
 =?us-ascii?Q?X7NGeMocK0wG/KN4Ei0AOc659+eesjF+WCRK8+SmCuP/V+yBl3dt1p+HlCUg?=
 =?us-ascii?Q?hifND4yqpVSyQwL4VBOcbvTg4OvWKKXd+0y0chF11PxKDTKbp+/5zXSx2DdS?=
 =?us-ascii?Q?NME0WnHObQOpq5qIMV2SyibtcFuVDdP429H8uktw0X+JIgsEi9YcTI3ocE82?=
 =?us-ascii?Q?fnN5l9wXMUHIMypNwgTxBSRHng7ldKNZnLzdWM//2tei7TE1PL1cAVFCZHIb?=
 =?us-ascii?Q?skd73XeULilZPT68jHaC85jpf10VWanJkBmsYeFlqYLMChTJxOCl7tPRBWia?=
 =?us-ascii?Q?dWrx8kGqCc/iDL8V6q/BISwO/7jrR6V+RlezJiPP1+C4sjCqx+JOxiWnyKWd?=
 =?us-ascii?Q?ULnF528gBwsEWgeqgTfuLf21NhuIp8iPXXUlUOY5Ss8Xj8e/BNVYoeOxD2fB?=
 =?us-ascii?Q?Jb00xiG4jZv3mr74lGEZ7jiIpUfoMDxVsh+u2R1DzAO4SZ0V5u9dKY/IK/c+?=
 =?us-ascii?Q?mPoBR1Y4HI0Zu2LV8p8jbTif3jGwSxAbhdxuX+Y6b2a3e7UAd9k/Kij84/XO?=
 =?us-ascii?Q?7yZQkW9hVErIdvYZeeE3tearduIYiTrs1crlLGAJ3xzScawpQNyjMWE4RcH2?=
 =?us-ascii?Q?GQ3Ypb7o7dYF3/x/1FsBqGFf3/95CRDEX5OR4FgH5BMv34QDBX2QEGrJUtJy?=
 =?us-ascii?Q?BzRBpqPi4/sH4haF5S/Yn8swP28h/FhkjZhFSJUmvT+u62kvJMCH5RUtEZsf?=
 =?us-ascii?Q?KdT2uq0VkXg8/EMGG09vSz2hXGbnwZv9nB747dsfTVaNIKanbd7QuDXqnV56?=
 =?us-ascii?Q?HfQQylwfmFZSdXdIaRwCHIQzwNj/myzm7Xtv/2ozx9UVwCWPKQb0SlbX2JkR?=
 =?us-ascii?Q?rpnWx263amywR4hCEFPynOfHJrukYY62dLctTP3C5iTVwEzGdftvLzo//J0s?=
 =?us-ascii?Q?9S44quXJ1ty29oc71L0S/tHRS90eEKBgnpZncyX/ZrIk6LBTQijy0eCDtdq7?=
 =?us-ascii?Q?0TxMvy19u6hTkaQHutAT3NtwgcwVC7V1YNgomAaAs+iSIqF0At7eUAtkMg3a?=
 =?us-ascii?Q?7x3htaB+D5MEHDDdtCtzwgA4GYldxPIIGXAJxGTLRBkzCFif51O4UNBtgdap?=
 =?us-ascii?Q?QfrfWzFa5MnF4CB60swm/0LtTfjqPERz63fCS2cyX5EXsDa9qimJ+ewRAIcj?=
 =?us-ascii?Q?YW1K6608oL9RtH20BvkmY86XacT/3vCDydfJEJl96AuE5EojYkdlrQKyr/yt?=
 =?us-ascii?Q?Yk0CrYyKbbp5YwnCvXmBlXpY/5EJ7X4zM1VqKortUSeYQ4Y7rgLno+/E9nYp?=
 =?us-ascii?Q?M4/AMZOltROC7bHwhDGNynZSdZCM3ktUlBw/oRmTr0/5BGrO5fmX0sy2ghjX?=
 =?us-ascii?Q?TCJ0YTFMlbAQC5uPdeXr39dDxe2Ujlov//nyzsKPSzP3buLufwcdIXcatMeZ?=
 =?us-ascii?Q?GGUR8XkRhM32hZTCJf/PWhSJSUBM9ooMybwWnDHB2x6oW4vPBCWm28E5h4h3?=
 =?us-ascii?Q?XT51oroKJX/mOGUiCNmdsqpe2Aly+BwnFkuA+99lM7BwwDvDCOzCzfvaXLss?=
 =?us-ascii?Q?glpKLOKb2oTXCkzIRmMUyGjJRTR6DNmctZ1ocYEGtCFZRu0sDrIx1gCilMKP?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df53e880-3d7a-4545-6a7e-08ddad7d5223
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:59:51.7853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJ3A9jFUz56vHUMY+oiyFN3ZmVGCd+MKPpzZoUd7UbfzXPgoijPKxSCxqdXg+B9K/n6AhkUnmOgvI2ITP1q7eIrwXNl7HHe8KNjFnC9FeCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6982

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add SMMU-V3 PMCG nodes for Agilex5.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altrera.com>
---
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 7d9394a04302..216bb9793ce5 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -133,6 +133,12 @@ usbphy0: usbphy {
 		compatible = "usb-nop-xceiv";
 	};
 
+	pmu0: pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		ranges = <0 0 0 0xffffffff>;
@@ -486,5 +492,61 @@ qspi: spi@108d2000 {
 			clocks = <&qspi_clk>;
 			status = "disabled";
 		};
+
+		pmu0_tcu: pmu@16002000 {
+			compatible = "arm,smmu-v3-pmcg";
+			reg = <0x16002000 0x1000>,
+				<0x16022000 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmu0_tbu0: pmu@16042000 {
+			compatible = "arm,smmu-v3-pmcg";
+			reg = <0x16042000 0x1000>,
+				<0x16052000 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmu0_tbu1: pmu@16062000 {
+			compatible = "arm,smmu-v3-pmcg";
+			reg = <0x16062000 0x1000>,
+				<0x16072000 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmu0_tbu2: pmu@16082000 {
+			compatible = "arm,smmu-v3-pmcg";
+			reg = <0x16082000 0x1000>,
+				<0x16092000 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmu0_tbu3: pmu@160a2000 {
+			compatible = "arm,smmu-v3-pmcg";
+			reg = <0x160A2000 0x1000>,
+				<0x160B2000 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmu0_tbu4: pmu@160c2000 {
+			compatible = "arm,smmu-v3-pmcg";
+			reg = <0x160C2000 0x1000>,
+				<0x160D2000 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmu0_tbu5: pmu@160e2000 {
+			compatible = "arm,smmu-v3-pmcg";
+			reg = <0x160E2000 0x1000>,
+				<0x160F2000 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+		};
 	};
 };
-- 
2.49.GIT


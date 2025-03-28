Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2116.outbound.protection.outlook.com [40.107.21.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946282D78A;
	Fri, 28 Mar 2025 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167135; cv=fail; b=bSnC39NDiW+ZysfFRwr4ZaKOLMGk/XsIbnpN8uUgAvlYeDt1gUJ+iYkWjHkvUsixVBCXo03seoh+jcehSxv4387nT/dJjQ985+eN8/iyVNX/eouKbR1Y8dfh/xFw+jSoYd+AHHnsQxn1BQngCnmP6LwB4T40pEcsn3xupr0g5e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167135; c=relaxed/simple;
	bh=Zf723zKNMjZUmc+3eyp4eB7Llna5qDdhpr/kPD7AkmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j5uavNCQJPZJptZ94Fbd5e1e/0beCq1ckLjCQvAh1aPD5+Yt6TgxPtaE4W1KaBTvJ4CLg4DFkwPFX0ED5N3R+ZgpUG6aV3bAMbbpWClbzPDbzRU5Jn1H02WlfefMWODLej4Fh3UEs0lKq6CjSkDLsPCU2+fr5cpZHu++ZaDhTGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=GsX1xK2q; arc=fail smtp.client-ip=40.107.21.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="GsX1xK2q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcWLJSJfrY9g/CC22Dq2Lg9C724pUpcV670Asptgbg3jzvw9itfnwdHhp2CkUcf/ff03quH/AU3i5hp/bCyAud5A1GRekTebBHv8Ny0qzSTq4kB0dOpncosTIYqxMPfY9NomFHsDHpQTpo9lnfQR/YhEdYjyX5UqmQTisbnF2iPrhE8tePLjgmjcRwQMgbsgnIrtcLQUk8rUQdyA3OWkg4XnT8cXc9WEdJ1bNo98Y+kdKbp/G9is65Y3cEEtyELNERZ2ahyRi0+kJLb9e92vyTF3U5n9mZUCL9tDvr4ob8m9yMdPo42N61s93O7W1ysCT4DSoZ1nMvIrn3lV88bkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sa7DgvLLHNj1GXIB4TZUEjTmB79clCDtdIiU7hCEbDs=;
 b=bK8AujDbKY4df7Lqm4BaDa8KIUueu0jZ8a+sod63wVBVdksd8oPzeVGr9t28WBtK3qjbmuE1k8IMQbVkfgsmIrN4MeAlqsZrn2zFJtcDAUHYWjNI6+mtzgyzZk1kxP6fcmhXUkHCT3I6HZGWGZ0VkligGXICe80kZkUX68aNF+HxPCjZUtVeySK3Ik15ukhHkEUfOy5tFVPSUbAZ/zYy5rLTofZ7fQqoKchOeQSwxTY8BYolrTKJtVFPq7hza8lqMHBdUMBcatjObL/+RRd9T/mAu5b/ty41iqtmqH1bR/EnoXL1271muuHMm5Fu3FlAwLIuFVvbF4gtFwftZ2CZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa7DgvLLHNj1GXIB4TZUEjTmB79clCDtdIiU7hCEbDs=;
 b=GsX1xK2q5aM8z6Bd/ddQJrHp0tK6Ud7E7tRlSUrwd2UXuRjWJzxGUCxO/4BzLm347UmxmV2eemoLBtgymFQ69k7QkLaG22U8s4j77W6zrHP/SjIhVV9j872B0IyB11NGYXQOpz2K8NRTfRmmPV7Zw0uJTUHMBNP/xuyHSVVVV8/VuNoSmqJHyA5TktNtaXqEG4XIqBZPMiYc8ywj2fakLqYjBZYzB3px9i9Uf1c32uN+/b8YBYzDV9l748pdsb9ZNGthlT7P5r64omP6BFAQPXHgZq03odtrGYQXJGSR7H1OHpUQDCC1iQxI7nYeGmtfkL9X7el19ho3M0Hr9pMY8A==
Received: from AS4P195CA0032.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::6)
 by PAWP195MB2679.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:46f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:05:28 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::68) by AS4P195CA0032.outlook.office365.com
 (2603:10a6:20b:65a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Fri,
 28 Mar 2025 13:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 13:05:28 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 14:05:27 +0100
Received: from [127.0.1.1] (172.25.39.168) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 14:05:27 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 28 Mar 2025 14:04:37 +0100
Subject: [PATCH 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-1-28324c7f81fa@phytec.de>
References: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
In-Reply-To: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Benjamin Hahn <b.hahn@phytec.de>,
	"Jan Remmet" <j.remmet@phytec.de>, Teresa Remmet <t.remmet@phytec.de>,
	"Yashwanth Varakala" <y.varakala@phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|PAWP195MB2679:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e05385-c189-4bd8-9388-08dd6df93644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk5mTXEybTVsNVova0lQRGNsa1lVeGhQOEhGdTJERy9ZUWN6czBrZ3VmMmV4?=
 =?utf-8?B?ZXZvM2FTVCtURjJCZXQrNWVLcnVEcjA0eTJrbENianBzRWVkdGUrQ1FBTDdj?=
 =?utf-8?B?V1pqNjlKd2phSzNiQVpQcGNDS2NVSHpFUHp4aXdZZWxiNFpBTXZIQ1hxQlUr?=
 =?utf-8?B?OUhQb29iRVhaeHZWdDRXYkhmU2F5TjA0M2JVSGppdHRyQ1ZJM3VHcEZTMnI2?=
 =?utf-8?B?NGZVMi9hTy95cElza2ZYKzhBRng4azQyYm05elVwR2ZLbHJtUUd1YUpEZUtO?=
 =?utf-8?B?NzZTZHhSZTZJQ2xNWWtjNEJ2cFhpVUxJU1pWQWpwZXJYbE9yRldIYTVaUHlG?=
 =?utf-8?B?RjF1VFNuQmgyOEM4RzU2VnVjV21UTG9GNWs4SW85aGptY25LR3Z5THhtUlI5?=
 =?utf-8?B?cnV3dGpzc0FhMHFaUnZ3QTlKQzNFdEdaaVpBVEppZlNzSlR0RnlIdDE4UUtX?=
 =?utf-8?B?NU9idlIxVERMdUZwdFpMTWg0MkRsNHR2NDRJVGtOYXVzMTJLVmJoLzk0bDBp?=
 =?utf-8?B?TWhLcXI3Yms5YWxlTmNVa2VXNGR1V0ZoQlFQTzB5dVB1VTk5K3VTamJ3ZmNx?=
 =?utf-8?B?bHFIWnMya3JmbEpOd0ZrVXJPYjFmUWltRlhobmUxSHI2Sll4UGNKRnRkNSt5?=
 =?utf-8?B?VVY2VUZERW5tNVJueDhaUzNCREJxclJEeHU3VGVqa1dMY2lFaDhseE04czJi?=
 =?utf-8?B?eFZBY2htUENERnBENnQ1b0U0Q2tQWU12WFNSaWNwY2xRdVJWNjhXdDVLY0Ny?=
 =?utf-8?B?M2MrZlVCYmtxUVJtTGRXOXYvcXRsZVdPeVpvWmo1cWJubGNlbHNRVDFiRW1j?=
 =?utf-8?B?N3dmVDdTZFZ4T2VkZFFRWGVDNmQ2Y3U1eU11RnE1dUpMYXp0ck1aQnllUXVz?=
 =?utf-8?B?UDdZVmV3cUp2YnNyU3ord1lzZThlV0l3QlJKTStoQ25WelM5ZXFtY0lmUkFa?=
 =?utf-8?B?MHoyTUhxdWMrMGtiM3dGdzM2MmVoQWFuWFBLREQ0YzliZ2dzZ2lqYjlOOVRl?=
 =?utf-8?B?dXozNkFUMU5JdjFTOFF2QkpZanFwOEswNFJUL3F2REM1UEx0TVA2T1g3aEtp?=
 =?utf-8?B?ai91aWpyUTRMd3BCaFVURUs0WnFXUWlBeFFncGpVdDFBelNwdktSNFcrRUdh?=
 =?utf-8?B?OEJrQmhUMVcveUpLZmFnbEJTVEF3T0dScGVoZXd2MEtMRlVlTnZ1b2hvQ2Nz?=
 =?utf-8?B?ZlNXRU1JUzZsbFczLzNyZGxFRmFmN01HV1lRQTZyYllpTndCRGNiRTkybWZK?=
 =?utf-8?B?dFlCNFYyUENNLzNjNEJUT2s4R3VrUjlHZ2hkOG12am1PV3lzZXBxL1ZhQnZR?=
 =?utf-8?B?WGdGQkRIN2RSam9hcjNLRmc4MmVGMWpNKzJCa0E3L2lvVkVocXViVTA5ZXdU?=
 =?utf-8?B?dXRoQ25LUlQ5WEw5ZC9Xdk5hbjd1bnl5UjcrdmVpcTZDalFiOXVxZHRwQWRW?=
 =?utf-8?B?N2NBYWFrK003WUdFOUFGc0RzQ0lkQWJQRDNTekZSOFZJZ0NuZlQ4UVN3aWYw?=
 =?utf-8?B?R1Iwbkc2alZnTU85RVlXSVlHV2hEajJzYkZCRmxySS9zV2RueFh2QWdNWGxz?=
 =?utf-8?B?Wiswc25KVjFQdUNKUU16RWhEbS94Vjl3aFVQK3k2aWhLUmlDZ0VuWnFZSGxQ?=
 =?utf-8?B?b1NRU1BTOXNKazVlVTl4UDRPTHZTTTM5TzRncXpFQzN2anVKVzE1eW5kcVNn?=
 =?utf-8?B?cW5sTVc3czdqNEorZVNaRlhDU3MzbEJGTGpEQmRLbGpHZnJrZ2Rpdi9ERVJV?=
 =?utf-8?B?bkFaUmpsNnFvWHRaTU12NVNDaHlvVm04L2VaSng0cWY1Q3NLbC9udnVBKzNn?=
 =?utf-8?B?L3RTa0ZtU0NKNWFXeTRFczJUZlJKb1ZvNGpCUW5LcS9KZHhoRlQ2ZjhSVk1w?=
 =?utf-8?B?UXlENXRpbllmWWpUZ0ZYd0dEc3hnWmRzUVJ5YzYrUkhWbHAzMnpnMDBiWkhR?=
 =?utf-8?B?WEN0amtXd1VDNHcyVHNxNjF1cFZ1Vm1pL2JUd2lRMWZqSmRhTk9tQVY0T2lU?=
 =?utf-8?B?VS9BcEwwUWZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:05:28.0757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e05385-c189-4bd8-9388-08dd6df93644
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2679

imx8mp-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 8M
Plus FPSC SoM. Add its description and binding.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a22e49355dd1f932bf3d84cd864b5f..22f05e6709fd60bef1d22a378cf0bd57090774d4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1156,6 +1156,13 @@ properties:
           - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP OSM-S SoM
           - const: fsl,imx8mp
 
+      - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
+        items:
+          - enum:
+              - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
+          - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
+          - const: fsl,imx8mp
+
       - description: PHYTEC phyCORE-i.MX8MP SoM based boards
         items:
           - const: phytec,imx8mp-phyboard-pollux-rdk # phyBOARD-Pollux RDK

-- 
2.48.1


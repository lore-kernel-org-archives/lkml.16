Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2101.outbound.protection.outlook.com [40.107.21.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460721882F;
	Wed,  7 May 2025 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623604; cv=fail; b=SbOmdKHkRELbS6Vp2Eyw5ZMOWdPkWPxJJZ+cwvZjPi/siflEhj/Nc7YnOm0uv/OjkX3c5MMrhXLBuxi1ZEiOoN+wq4asbxRimMLqrJKOCbk9JfrE0/iz2wmwgYdvV7gFivLk0LYOm9mvRhyTHlIk/3P2SgCGFSIBiXXDCYfpaJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623604; c=relaxed/simple;
	bh=dPxmRVfK39z24yxqbP7X0lLXavO+HD8/lw9OMomVATA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nieS8IY0GzLiBzqUGWPN0sXHXOB86EiRr0tfGHv4Vmy072l/sLOcQTOSma45/B1GUAh4YEBooEGvDSCcA8hEpeoPiESb2QhlkqR9DVFtJtI5FnBk31wIebE1/8UfkimrkXcZY8GbMPA571VfJOt2rL+/L3PXdK3ZiJru4NWN5p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=kuvLWxMQ; arc=fail smtp.client-ip=40.107.21.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="kuvLWxMQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2JAHXs2hjMoUTwTn+wMAj3gShJxLvQgQnPjhwZUxpaBYROqh6T2t3JVMqwZTyXUY5OB4nTSeq88/9GaJNvlgfKAI6dKqdA8hjaKu0huVIxjtV3JyY56Tdsne5pRL1E1ThA1DMqzqkUjPBp7X3PElQkjQt+0ehW8lwi7OGmx2P1XlZhKo0m3e0D3T7o12DrRwhK7WTrcjx1FER5CF/c0Yj4dvP1ZspCYuscnSrPU2i8iM6wqUzo3UdfTf+kfqSc+TBQrwF6nj/FmyM3ksUjMvljl6AddPr29AIz7/GRUntMSlpTju22G89SrktAOISivXioqTdFjyOnxpjXMU0Zfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO2vo/Px2DDofY6M2XK98QeEhDufwbcanla4Tz/OdY8=;
 b=x2FtAe2yThYa2maVZmRdz3+zqPa6+VnzzsQOFfE+3lilqihFrjgIc7p/p6s6ycVQJIdaaPNyk/Tu7Ngta1Ls/SpnTqkNmHJBf2rjd5PY29b7dr/xMvvIckzUUhanYrPPdJGwr9wYCyb8bb1pLDsbiS9ktvHtcwcHQm2yFS6VKHntgKb2NypivhJ0eG2xJhe/pnHrMdvUS6gIr/qjI3CDknpvuN7kXx83BGU0cuH4zUZgN2yHy1wJmEEMupVncp1Fn6Iq88JmQBklVFcOgE1VdXF+vnMvtL5XDrPTj9CjDs9pzvbnrDtV8vezLJaJo8s20ekZfHGqBlsaNShnJMbw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO2vo/Px2DDofY6M2XK98QeEhDufwbcanla4Tz/OdY8=;
 b=kuvLWxMQW1W6SHSeXGG9YVTWIOzkusM0yTlPtJGXHQOAAYYBVCKLPZ/VnqVTO5s6LgNrQQZOZjvI5l2s1WwstrTxUcY8VDKGEU4Vz7u1jXHE8B1Dvpkdi/VYWw8nLVIfiKvcGjJ6OIKIZKU9GETkjWrWk6VKLafttI4IXs8dCEWL7t2PmDoHTy0XZoD++NlRi/Lt2ivQbecWwv6nG6Ar0U4U6DpAqrALSb7THy3n7Yr7HflV7AOD2+u0gPVPDYeVm71In8e1m2Serqln1BoFUmKNggmXutXqiCjFacgvFDaWtszsp2tTd3ePl5/LcBM2DmMYXHSPaCm9Df95Ik9oig==
Received: from AM6P195CA0044.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::21)
 by DU4P195MB2567.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:55b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 13:13:18 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:209:87:cafe::82) by AM6P195CA0044.outlook.office365.com
 (2603:10a6:209:87::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 13:13:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 13:13:17 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 15:13:17 +0200
Received: from llp-moog.phytec.de (172.25.32.70) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 15:13:17 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Wed, 7 May 2025 15:13:12 +0200
Subject: [PATCH 1/2] dt-bindings: add imx95-libra-rdk-fpsc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
References: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
In-Reply-To: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <upstream@lists.phytec.de>, Benjamin Hahn <b.hahn@phytec.de>, "Teresa
 Remmet" <t.remmet@phytec.de>, Yashwanth Varakala <y.varakala@phytec.de>, "Jan
 Remmet" <j.remmet@phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5F:EE_|DU4P195MB2567:EE_
X-MS-Office365-Filtering-Correlation-Id: 242988ac-474b-43fc-51d7-08dd8d68eed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OERBK0lYWDJhd0JxQ3VnYmFNOFNTQjEwc1FBZk9BSFpWc25VUWljVklUTm0r?=
 =?utf-8?B?QWx3dDk4KzRzQndBUHdXTVlzWWRJVHQzRURNQmJVNDZ2aXRWazVvWWg0clFF?=
 =?utf-8?B?L1hkdjR3bFlLd05VK21KTk9WOS8raHhKbitHOUtNZjdnL2tkVjcxcEo2L1JZ?=
 =?utf-8?B?QlcxMU4zNUNpL0JybVBEUWlmejlOZ0tqRlJKajUzSG11WkZVNDdpdXViSXlQ?=
 =?utf-8?B?NGV0ZGJwa2QyTWdUblFlOFAwNG90OUNRM0pQcGcwcCtoM3VtNG1pb3JZTWkz?=
 =?utf-8?B?T3IxUVViSWNhcVVRM3BBWE12TU9ZV1FkWE40aS81WjFXUXRxM0kwK3crLy9I?=
 =?utf-8?B?b2NWcUlTQmxENlY5UmMvd1F0d1pTalVDQ0JiZVA2SWZZK2VHanZSYjVFMy8w?=
 =?utf-8?B?R0wwQUZVZ0daWTdpaDI0ejVhdVNTVElFWnRZeFp1YnJDVjl6bGhucFFPQm55?=
 =?utf-8?B?cEF0dW1XZHBXU2JmRFMwdmlld3R1amtnYjFobW5qTXZ4ZlBKRnh1MmRqRFoy?=
 =?utf-8?B?WnVleXkvQTNXbTBLcFc0Zkd5ajZOMlNtRVRWcUlLS3c2ek9ESlkyd1g3cUg2?=
 =?utf-8?B?ZFZHQTJYZDJBMCtBNlNlSnMwQkVtd0JHeldxRm44cWEydlpHdS9zU1k5K2xa?=
 =?utf-8?B?a05PRlJPRXNaS3JnOFg2UlNTV0w2U2lrZThnSTlFMitUYnNPVFhHa2RPUk54?=
 =?utf-8?B?Tk1UeUJoWnF6TVhPVGpQZnJ1NCt1Zk1xcGx4REFuS3ZwSjlKNGNjY3FHWThy?=
 =?utf-8?B?WS9Pb256azM4RFl4akR6dXNndWpFdXZGN3JacmdFMUdzaXlKazdxbWd2K0ht?=
 =?utf-8?B?bWNxa2h5L0tBRzFyb1hwMExWTzJ2V04xeVE3dEdZS3lMclRqd0xoSk9odHRq?=
 =?utf-8?B?aXRVK3EzazBJUm1DRTloUTQzTlVsbnlUSjdWUW8wZnl5RkdrZEZXQmdBWFBK?=
 =?utf-8?B?eEVCVVZ2ZkU3V2o4QkpPeXpFUlpyUEtod2x1Zi9JL0VsbkFkYXZEUWRCTGxX?=
 =?utf-8?B?anp6d2hVbTYvV3A5T09rYTlGZnprQnlGbzF6MUI2eGlRTE5rSWhyamViL3gz?=
 =?utf-8?B?OE94NmtvWEVHSTB2S1FsQ2M0cElsNGlkbTBWVGJkc1FWYmxrNk5CV0E2MkYz?=
 =?utf-8?B?QjJ0ZzM2L3RFWVRHbXJKcXZYd3RWVGc4TFdZVkJPM0QyQWwvK3N1YjFtdGx3?=
 =?utf-8?B?K3g4ZW1hWlJxTU51QUJqemlmNU1BUVJ0Y0NrRjBXZ1AvVnlvdGxFRDJoaXhx?=
 =?utf-8?B?T1VibGw5ZlJwdWtwTWRWSCszYVJVdG1ibC9xbzhxZzNFc0poL2Vxemh4SnQz?=
 =?utf-8?B?bHpWcnRQNG1NTHF3UzFxeHB5MHFiQ0FGb2U1Sm1VZ01QQmtoNGV5bWJHSGZ2?=
 =?utf-8?B?Skl0cmNpUVFIZ2k0d0ZXazU2dW1vNHdoSjk2ZUt3UzFkQWU4Z2VGQWU2dGtz?=
 =?utf-8?B?eXZSbFJtKzgrRllDTGQyZCt0Sm9CcG1GU2k3QkRDK1JCbG5iQk5rdlFBQnJZ?=
 =?utf-8?B?eElaaGh4RU9rUlR0ZDVRWUFFbTNjT3FpVzlaOXRleWNwaU1wRnFjNVZVS2VC?=
 =?utf-8?B?c2tNOWRlcmlacGF1L1cwRFUwN3drSkxNSVE4RkRFTnJRT09iWHBObCtIcDlK?=
 =?utf-8?B?WEhsR2RGSktsRGZ3QS8xeHhaQldvYkMzSXVDRExxOEZoOSt2bTJrWDc1YlF3?=
 =?utf-8?B?UXV3dVU1WWJ6QytlZVhRTWJCZ3ZzdDBsZ3ExYkszWWw5dU9yQXZnYmIzOFMv?=
 =?utf-8?B?c3FnNHFhd1h2aDFDeFdRQ3doemtCV0ticGNRZW1RUDdIYzZ3VEZtRC8zQ0pi?=
 =?utf-8?B?azV6WnY4VEFXSTNSRWtMblR4TWFDd3FrbWl4bGpIdU4xRC9ZeDJFSXZXZGZI?=
 =?utf-8?B?aUY1OG5BY0c5T2xKa3JjZVNteXRoVmFycVNBVGw3NXZHY09pRlpEWUJtUkFM?=
 =?utf-8?B?bFZ5Yk9aQXRsb3BkUlU5NlU3Z1JraFZ2cEcxWHQ3dzJKL1V6dmZNR1NVTE5t?=
 =?utf-8?B?V2x6VW9VbTl0NjhaQTdSVlE4RjVJQmZOZXQ3UWFCOFkyZXVubi85MFZYcjc0?=
 =?utf-8?Q?RpgZPa?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:13:17.9375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 242988ac-474b-43fc-51d7-08dd8d68eed9
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P195MB2567

imx95-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 95
Plus FPSC SoM. Add its description and binding.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 447054b52ea391f69d11409d51751a88bb8b539a..783550c61cd7e9aa12ffe78bfaa74478c19e0797 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1366,6 +1366,13 @@ properties:
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
           - const: fsl,imx95
 
+      - description: PHYTEC i.MX 95 FPSC based Boards
+        items:
+          - enum:
+            - phytec,imx95-libra-rdk-fpsc     # Libra-i.MX 95 FPSC
+          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.43.0


Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2095.outbound.protection.outlook.com [40.107.103.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35F28030A;
	Wed, 11 Jun 2025 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647173; cv=fail; b=M1nArr3fclAmOlh2P6V5zbrK8hyFJo79G9IfKfwUsnef9eTtaWSSId0POEZ0eU15Kq10wWlNYBNnFFcpyfE2gpZzRH4g22A/S0lartqwDA/m5LW7OO7j1yaplqfmSyYlf0e6A/5D83KIShcn+ShyCsCTRzbH/V+63j5ZDDBXE+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647173; c=relaxed/simple;
	bh=Q/ZmcbIW1JZc2LIKcJHzVviNw2PfHw6bFxJ4RG1lNNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qv9luKwlEHLxOZ7H1i9FjAEiG6lsambqZeRM3kcYtS+37PUs0h8CuqVOgcQ6wv6m7d5gBW6Xl/8nPkcIOLlq9Ouz2T1Zg3k9bruj5uBdt58Lf5ysS0/qRSm5d0yeco6n1nuFh39bB4+QUczTvhQDrnEYJUeoC88/Xnpa/l6b4Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Ub/7M6VS; arc=fail smtp.client-ip=40.107.103.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Ub/7M6VS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKEsDfW9sv+gEY3y/rW3ij03tUKTJs+IRrg9z9mT2jsIjQGYzc4iaLvjcPD0fKvNPnlDNbkzn2PsVtL7/j1iCyb9RmRcT3o8JeM6lcrpilzWSTTREBlbcLJGvJb7EGobgO0egpSk8CzRIZUym8mnILC76+1Dlo6XBE6d4se4IsiOPQuUeLOpEHCDUEskG+dsnjV8DVm3t5/lam4PSjLmo0n9p78JB8ZrFARb7p6wlK1+33d5bwKF3/fVzQBpjndnXT96vhMmGFvZjvu7//e5aDewo2Fn+UYVe7yX8gEgo72M1RbDRv7PvE22uTQAUKQV7UJ/lfqbELQCZm/uQpWLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80qGm/H+FlPRx6ZyYK8g7k2hEOgpCCUAFidzA+KNsS8=;
 b=aT+Pxs9+MkhGt1P9UYpVT7OpqdJxDBwzqLYExKhjCD8+sEA0IeDH9c2FROL56kC9o5AfSH8AIQMCtMXnyxOf0bZyYjE9T80wg4G/0lpjxci3A8qKBgY0pj3drsbKDTyh0pG/Hh44DllFqg8KvXp2AtD71/M8wVvcd5954GPb3V7ZjIUO1OUqCR/StxRNAPeHgrxQOfMydtMem1p6P/vDDD7t4axDKNul++Rd37nUVD0FyPZfuAV+l8rXZoj+x+xWl7mtTD/Fd+lcEIjDXcZvqfdY9NmHE/Z91l7F2WO8Ai7sruNPnOVt3Bf+I+7N3Me4EOp+eHx8RpRjrmJczjP5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=arm.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80qGm/H+FlPRx6ZyYK8g7k2hEOgpCCUAFidzA+KNsS8=;
 b=Ub/7M6VSIh3uuGqU3WMuSrof55Pgnn+oAWCLfQx5o/bJ7kbfzjdWpqRMdqesMjw7LmTqN/oue+zsIf7rdF/tFLOEin/995k+2D6HOyb5IFuwrMoeOieDfBUR0d4NGNv8m9SKA2+ORvvXlZDpxlfAstogQ0GYKOPAcmXRyJS/BCM/ty6VCEpWIZ2U8tsAbZNy4g0IEvRdXzPUFrAUiIxJwxCou9gSEcn4Y9FhcfpSK4s5qLynmgg0ney5KAv0Wg2dYFTgmI/x1wH4LR0oDdl9P3/8oALNzbQUJuI7CHBEdsH57FHW/WhjMv578gZNjIfCDfVSabv5rju9irtv/00aeQ==
Received: from DB3PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:8::32) by
 GV1P195MB1619.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:62::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.35; Wed, 11 Jun 2025 13:06:03 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::72) by DB3PR08CA0019.outlook.office365.com
 (2603:10a6:8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 13:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 13:06:02 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 11 Jun
 2025 15:06:02 +0200
Received: from llp-moog.phytec.de (172.25.32.81) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 11 Jun
 2025 15:06:01 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Wed, 11 Jun 2025 15:05:30 +0200
Subject: [PATCH v3 1/2] dt-bindings: add imx95-libra-rdk-fpsc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-1-c8d09f1bdbf0@phytec.de>
References: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de>
In-Reply-To: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <upstream@lists.phytec.de>, Benjamin Hahn <b.hahn@phytec.de>, "Teresa
 Remmet" <t.remmet@phytec.de>, Yashwanth Varakala <y.varakala@phytec.de>, "Jan
 Remmet" <j.remmet@phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749647161; l=1147;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=Q/ZmcbIW1JZc2LIKcJHzVviNw2PfHw6bFxJ4RG1lNNo=;
 b=v+vL/mzZllWH5acmtANbaAfCIBcWxwncf7YiBT3s9YPJEP9Gc4laiXSr0GX9fUz+9nPbVYs8K
 ZBaXgPch8ykD7tcMNlF+j46U9SDR1XM7mZXBaBeNkiIYUaPqOrNltLj
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|GV1P195MB1619:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bb6cbd-9591-4aaa-c9ec-08dda8e8b7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnJ3UnNudDNKYnI2Tmo4K2ZRNndXVmlabS9vQ0lRb2RobW4rakRldVM3blFr?=
 =?utf-8?B?WjZjbDRucWtqb2VTR2tGSzVYK1NhUUV0dkJoQVVnb2E0M2VReDh3MWNaZW1p?=
 =?utf-8?B?RFlpVGFxOXVkRzZ4L0xJQ254eEw3bkxsZWpKVHdDV1lyT1ZNOWhnSFNxcFFQ?=
 =?utf-8?B?NnlxTVZTMlFLMHhFQU1RUXplSll6VjkzWXNqeEc3cVJMSkdXemVlQURXL0N3?=
 =?utf-8?B?SnltQWsxbDVpOW1CSFl4MDBVUEFpL2t5dU10V1dtNVRmWWhJaDB0OHpoR0pJ?=
 =?utf-8?B?c05CQnZrRGxHTmpKODJNTzVhdk0wNVRhY1ZGM3pqTmxmYjFtTnJZRno5L20z?=
 =?utf-8?B?UURMTXEzYVZXZFZzZkJHN3BqYUowZUQwMlY3MUJQUEhVVk13V2c3OFZWTVdP?=
 =?utf-8?B?NWhmUEMxaHdnaGZqMDR3bHFZVm1mVlhNSkduWEY1aHN4c24wZ1VVVzhhbXBQ?=
 =?utf-8?B?Z1kxQWJKSlBFZ3dDdEtzRktGZm93YVh3NkpmWGw2Z3N2dm1jZ3B6dVdhY2Fh?=
 =?utf-8?B?UTh5ZVdva1ZlQ0lmT3ZhdFRJdHBiclh4aG55YzMzWTJHd1plZ3l1VndOZ00v?=
 =?utf-8?B?REt2M0tBV2ZLT09pV2pIQUh3ejZnbEZGZGpoTUJnYW1vbkJhUzVITndOd0ZR?=
 =?utf-8?B?aU1nWnN5amkwa1hHUms1NnFRdmg4SHo0WlFZRHVWQlJhOTRKZmJ1K3BFZkxl?=
 =?utf-8?B?TlNadmxOMDJHeE8vWmJsTU4yU0gxRlg4K3RpWjhIdTdxcEppQ2VTb0U5UDFR?=
 =?utf-8?B?clB0K2kzSEd4QUUwVm5lcE5jbm9RVVFYajJxWG9yVFErSWNqYUtMYS9JVlV4?=
 =?utf-8?B?cUlScTdDdDJRdTVzdWk3S2ErNjNVeW52d05wTXBjVEp4eXNsWkwxLzdUNzRR?=
 =?utf-8?B?aHlDaXpkcVFuSXJvZmtQU3h0MTFkSTloRSt4YkNCSHBMUXBJR2pZZCtoT0Iw?=
 =?utf-8?B?TnFUVXJQRTJIbWY5a3ZEbnhiRVJIMFYrNU1yM3EzYnFKcHFPMzl5N0hycU92?=
 =?utf-8?B?TEdaa1dsY3R6Rk9PQy91MGdWbjBpSUhtN2MraDZ4akFMM0Jja1FYU3k1MUs0?=
 =?utf-8?B?bEp0U0ZFd1lleVByaU5lSDN2MUYxbEh6d3I3Mlk5eW1SSlI2YVI0UUNXOW4y?=
 =?utf-8?B?QjZ3SEVueWRCV0dIRStVelpNN1N5V2s1NVdsR2F6bWVXUDlMT0cvR0hKWitK?=
 =?utf-8?B?ZEU3WDd2N2tTM2hqS0R3clJ6ZFhhMG1FVkRpMDZmQkE1UmtaT2xwRzhvKzJF?=
 =?utf-8?B?L0VZRjExWlN0eTBYMGR0cG5YSHcrdUNTa3dLY1RzRE1HZHFzTHRlVmNFSnhH?=
 =?utf-8?B?Vy9pK1VQSUhwSSt4NEpBWmVPNFRVTFA4eVR0VVR3dWVIdnp4RUd0Wm1DeERP?=
 =?utf-8?B?c3M5SnoyV00vYXFPdjNqZDh5L0ZBRjNURHU1RGs5Nm5CbWlkSmovZ2VPM1B4?=
 =?utf-8?B?RnZ5c2lYcVc1ZUhFNjNHMVJiNGt0UEx4SWlpcDNwR040dGxIS09vQ203TFAv?=
 =?utf-8?B?bFpTaHhCVXNnZkNGckVPZUUyZEFPVWhqUFlWOHZzcEVQamZvQzdoaWxwOVV1?=
 =?utf-8?B?M1F5NGU4eFBWcnZpRXhEdHF3OVlNOUx2K2t5QnhxUkVFZEFQNHpES2k1L2d1?=
 =?utf-8?B?RnZCZ2dTcDlicnB3aVFBbXdnTlMxVlRtRjh2dTlTRGMwN1BLSUgzTnZ1VERV?=
 =?utf-8?B?Nis4VUVSSzFjc0xnQWNSVlBIY3A1NnRqamFNRVlGV0dWMkUwNDk3cGFxNXFj?=
 =?utf-8?B?dUJiQUdpSWoyeVFCbGw0N1lIejU2SUJQRXZEb1ZCazBYcGtiYUhTVm9lTzBj?=
 =?utf-8?B?cEk3Y2lrMkNBbG85YkVNS1RxMFBZekZtdGdmOU9VMkpWTmN0T3JYaktEUGpX?=
 =?utf-8?B?YlNpTUNjYXdDakhEd3E4WGtDQno0VkVONjc3Vml1ZXpnVklOdnJxS0RrUUtz?=
 =?utf-8?B?cnFHU2FLNHpwTzhtU3h2bWpwanFlVDBjeVJIZUlUWVJEL25mL3lrLzVYeEMx?=
 =?utf-8?B?TlN5aWdYQURlcTgwenJDcTZ2enJqWXFjYkxzWk1ONmZyS2hCcGdiUzFsQ3Y0?=
 =?utf-8?Q?GEBUnE?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:06:02.8504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bb6cbd-9591-4aaa-c9ec-08dda8e8b7fd
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1619

imx95-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 95
Plus FPSC SoM. Add its description and binding.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e4166e35760c17c772aa0195137de93..8b0411f20f2ed67733ed6059cd6d1d86415c98a3 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1395,6 +1395,13 @@ properties:
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
           - const: fsl,imx95
 
+      - description: PHYTEC i.MX 95 FPSC based Boards
+        items:
+          - enum:
+              - phytec,imx95-libra-rdk-fpsc   # Libra-i.MX 95 FPSC
+          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.43.0


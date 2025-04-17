Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2134.outbound.protection.outlook.com [40.107.249.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D706D2356D3;
	Thu, 17 Apr 2025 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891316; cv=fail; b=s/Ln2YzPYFGPkY+8TAtjI8YwI9LMA+6PtaGy1wGYPnHx5b6+vD1Ox9Ni74c561wIksT1tXFfFBfykWTvM/VTh7mufanc4bLsXWMKLOyIFvbSazb8i0Ztn0QFTKW5mTlaoiLmJzciMdm5JgRDkHKJ0BiWy3FVFZYl2o5UPFHBCe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891316; c=relaxed/simple;
	bh=oBLr6GbuOhkfQ3Wi4zpMxlqOUW2nDLux/k7wF7IueAA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Y2yubXiqm0N2DZRUXeanhrY1k9EAOumQykhbFnE3wy7piDdRZUGxHvrTrjOm1V6z3QDglLUl3ALbM60u280044DqStLTsW5j8yq5+OqRUuBeJqzZv8AF6oCKrmscfbN8c8y6m+S3DnUWRxUpZTyihQ4l+Ot8rpP2N3Z2LTF+0tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=qAY4Nm6g; arc=fail smtp.client-ip=40.107.249.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="qAY4Nm6g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFcqSKWti7yE+lG1TgkursS9e1f0P91s/+TxYN2WpSao3YsJ8IPvF+kDqKQb9HY/03dO3CzZk5Cjmsn0KzrSLHQeEEGp5gIawSV5RC1ezTtliVwagK+HUsawdDNKQwrxYHjj4vJ2HSlMzI8DNynkQE8P3d0kmfInrNKJrc7AEFVC+BCbjegpmJcIBux9gFyaKgdz/3F1hzQqv5f8c8uZ6PYnnmJuGEzjVPZZbLz9jR4ksxoakh1mW01ruIAwdjoWzXzrZSVv7ykfjPuOVi0pH5vmrP7BeQvrTb+lsEIu55yYaAmVUTwiYTSGx8bFORtB5U1Y8LRJDRz1jDud3MMYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKowtDavVfKREwWGjK1WwAT+qARDiyUoQ6OrYsHyPRg=;
 b=sc59cjmTTngVFRO9sUwkCcWwjeBCWzGDnBzZcipsgvjQ7fWXaRmyhGHQQdcCQluAVyNlKlkj06+Od+IT7RjzGOoKH3x8DGgEMrNAUM8jJAAU5Ui+ncEJbLnkiCLoCceP6/RBaw7XtgYJvaXBVPkrnYnE242v1y8KuD2zz/qNEdShtO70a4G5VbNqtfvNqOlBclPwX3U6BPbsPf5UWFmuOWE8un4XtB7iJuR113jlpf0Q8Y6fw8GhY/rQrutmw2G4argpmD3+EjjVBKqzL0kaE7ymwXJfcGo+N2c2R9+ekPRMvlWzFlfHSUMhvwvXHZ0IwSHgkdXFeheb4YnkoM0LCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKowtDavVfKREwWGjK1WwAT+qARDiyUoQ6OrYsHyPRg=;
 b=qAY4Nm6gZE4r08512WqmoG8LePuTirbC/siO9go2n6QMXCZtBBhRNPRET7iaBlXFM6jNlR+z7LgeLkK0EzsRV8gou9GvE+LwRONo6OxgABuDq5QXEkIXtIWVwGnDZStMMoikNfdY6EQZY/Z9AqYwca/+utW54XT31YX5pikBB/LaNZYMcRA+daZoSWbQXgELIWXrpmXhX1lZeprsis2Lz5Fbbj+Ea9PtDdVzrAGsuA0AMzSxi23hCQmR7X0xV6ibi5RCRDJIyXEwCWGgflgYx858GpNbTRUNNZxsyijtTIxk54m+iF8/0OiEV6IxlRfesmmzlvbdc3yaQnXJ2PVK6Q==
Received: from DB6PR0301CA0087.eurprd03.prod.outlook.com (2603:10a6:6:30::34)
 by AM8P195MB0899.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1e8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 12:01:49 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::78) by DB6PR0301CA0087.outlook.office365.com
 (2603:10a6:6:30::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Thu,
 17 Apr 2025 12:01:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:01:48 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 14:01:48 +0200
Received: from llp-moog.phytec.de (172.25.32.59) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 14:01:48 +0200
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH v3 0/3] Add new imx imx8mp-libra-rdk-fpsc SBC
Date: Thu, 17 Apr 2025 14:01:11 +0200
Message-ID: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-0-ccb885b38ffd@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIftAGgC/5WOwW7DIBBEfyXi3K2WxXZoTv2Pqgd3WWIODggiN
 1bkfy+4h+bYHGc0em/uqkgOUtTpcFdZllBCvNRgXg6Kp/FyFgiuZkVInSaN8B0SrDDHeIY0rVd
 hcHUz3+ycWsExC/hUGJiOBqkfLHlSFZey+HDbVR+fNU+hXGNed/OiW9skPWrd/V+yaEDoEcV9v
 WnhQd5/969OmnMHGrJPAska6vjorfbjA7C9XujvaYfmCTBVMKMj8X6wZuRH8LZtPxH3/lWKAQA
 A
X-Change-ID: 20241210-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-c273025682f2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Benjamin Hahn <b.hahn@phytec.de>,
	"Jan Remmet" <j.remmet@phytec.de>, Teresa Remmet <t.remmet@phytec.de>,
	"Yashwanth Varakala" <y.varakala@phytec.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AM8P195MB0899:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c02a934-2305-4738-72ac-08dd7da7a1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjY0SEFncmlleGthdTlqaFhEdFBIajd2czMxL1psU1p6bzJiY3U0bmtIS2FF?=
 =?utf-8?B?a0JrN3FlaWxXbGZyQTVneElxMWdxMkVNM2haaGlCYXFtbnZjT213K1Q3c1Ji?=
 =?utf-8?B?eUFBQ1pkUHdVVS9pclFDSm51cEdHbkhHR1M3RmFDaW9JM0JnS3AyYlNYMFdG?=
 =?utf-8?B?ZjRKVWVOS3Q0Ujgzeng1dkdlUjQxTzNhMEVLd1RTSVRkYmlPamthaXZlNk5T?=
 =?utf-8?B?UTc2UFIvSlFoeE91bUZYZ1JGcEZSVEIwZTI0NG5vOWxrbklzTFVUZGVxOXNU?=
 =?utf-8?B?RTVvMnNpakQrcDdzWU9HSkhQa1lKd3J6OG10NEZ0VGJGR0RwZmEwcGF5VjBa?=
 =?utf-8?B?MHA5WWlka21FUTVDRzJ1cjhwQTI1dzBIZkcwTzNIaU1MU1VjNlEyeGtCYXlq?=
 =?utf-8?B?Ump4ODkxYmpHUUQrbUx4T25wMXFXaVdIUnlQNnBHdEEreHlvTDArMjJlSHhT?=
 =?utf-8?B?RTF2bUM0aTdiaWhEMTJaVkZmMHE5WmZ6aFlReUtDcng4K1lyQUg0YXZqMFFt?=
 =?utf-8?B?SjdMMEpsc1NlODlBVjk2c0hnZnpVN3RKSWxna1o3OGJuVkQwSmZMSWJ4WXZF?=
 =?utf-8?B?MHoweXdWRG5DODFqYTFzTzNSQ3RIQlJ6OE0xMmtoU3BsTWpvS3p3aTYvU1dQ?=
 =?utf-8?B?eXB3STdrWjhWRllGdWZaOWF1OXdvc0Q2YkRmLzN1MVE1a3FVYzJ6eWtlcEdK?=
 =?utf-8?B?eFViS0VFcEdyRG1nN3J3R1hpSk80ZS9UTi8rSlpOL0RNaTFHeGk2STRyMm9U?=
 =?utf-8?B?UnUwWEpNWkd3amwrU2JqVDNpWU1qOHRtQ0RKbEpBZFpidEt4UDZsOEJqempH?=
 =?utf-8?B?eWdvRi9NUWJEc0o1aDI1RFVvbmlselFmZi9ENTFoMUNLV0toVjFtbXBnVU9C?=
 =?utf-8?B?Z1MxSHhYNHBzeUZhZE5VQ2R3VTQvZ2VlVTBTbWF5T3dQL2gybWplYk5FWEdL?=
 =?utf-8?B?bnBGWkU3VXFJOUhnVTVXeExHWm1TUytBNXh2NnNQR3E2U1NkUVRjUXhidHhO?=
 =?utf-8?B?ZWJ2VmMrM1Z1OEJ6N2xOZmFkMmZveFd6a1d1WDhUeGdGbVlBcHhjcmFJVmw5?=
 =?utf-8?B?ZTVSUVREYXF4dG1ZOEJ5ZGlYYUFqNnVQL3gxc1dRbTUyVmlIWmMyMEQ3Q2lo?=
 =?utf-8?B?VWZXd3NnNllPWmhoWEF2R3dRR3NuNzhjeGJtODlLbGcxVC91aUJHS042b2dZ?=
 =?utf-8?B?aDNEWDBjUElQZTJSbWYwQ2Y4Rm1YRDdOMnNIS1IrUDhjenRCYjJidVBPcUd4?=
 =?utf-8?B?UE11aUxVcExqeU9HNmpCWFovSjlEYStac0E0MXRZYllUSTFJdjJMVU9lTmZv?=
 =?utf-8?B?K050elByN1p2dzZBS1hqUnZYZlYxUC9QUWdRamtYV1lQTHZCMzJEUkJSSmpG?=
 =?utf-8?B?NTBTTjdvcTEzcER4RFc5c2lqaVlkaU5DN0NKSGNHUVprd016MHB4ZEN0TlBz?=
 =?utf-8?B?d3pEVkh4RmtjZ0xVSDdqUVdRQytpVEZDbDcyb0srRVVLSkk1aXRCdFZzMDAy?=
 =?utf-8?B?K1MwWlRiRUJBeit5Sm5xOGU4dzQycDE3Qi9XQ29UMzFkZEdHNi9nUjZIVWZL?=
 =?utf-8?B?QnFhZXBabS91MkdSZWp6VDY1QUs0UVp4eDA0TnlhcUVXMkJPeStQVUNTY25o?=
 =?utf-8?B?bXFUWld3Y1lLTWxseHRNaEZ6YjlVR21WeE1rQXUyL0xsY3BIdUU2M1pld1RF?=
 =?utf-8?B?Y1ZHZnhoUm4zVXdGNm8rQWlRR3A5aHduZkhocE9ySUFJY05iYUl3a3VMNUkv?=
 =?utf-8?B?YUx1azF5eWpTU3d6TmVUOE9pWDJiMGk0V21NdFFhMVdwclcrTk1sVXova0ow?=
 =?utf-8?B?NzFWVnF0M291MHpWMDBhOU1sU1cyRlZ3OWZQYVFabjJmWFUvZGVFNU15YjFN?=
 =?utf-8?B?azJMK21LVkJ5bDBnWmdMYjBCamxLVFliRENDT3YrWU9iN1ZNaDhwUVArdEJw?=
 =?utf-8?B?c0RmTmE2MDBVTnRjNythUldzWDJYMndMcHN4aENiMTNXNzZwQVRsRmYzWG5w?=
 =?utf-8?B?MW94blcyYUZLY3RtaGRMelJ0YXVGNDBxSHQxRFIvcFlnVVhmTmtjU0lwR3Bt?=
 =?utf-8?B?ckZqUWRSQ3RDY0dTb1lLZEtuWktNa2oxb3FYQT09?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:01:48.6466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c02a934-2305-4738-72ac-08dd7da7a1fc
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB0899

The Libra i.MX 8M Plus is a SBC that consists of the Libra base board
and the phyCORE i.MX 8M Plus FPSC SoM.
This series adds its binding and device trees. In addition add an
overlay for an LVDS display that may optionally be connected to the
Libra board.

---
Changes in v3:
- Add FPSC prefix to inline comments
- improve commit description(s)
- Link to v2: https://lore.kernel.org/r/20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de

Changes in v2:
- reorder device tree nodes of SoM and board device trees according to https://github.com/lznuaa/dt-format
- fix typo in reg: regulator-12v0 -> regulator-vdd-12v0
- add to binding commit description the difference between phycore-som and phycore-fpsc
- Link to v1: https://lore.kernel.org/r/20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de

---
Yannic Moog (3):
      dt-bindings: add imx8mp-libra-rdk-fpsc
      arm64: dts: add imx8mp-libra-rdk-fpsc board
      arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay

 Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |  44 ++
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 290 ++++++++
 .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
 5 files changed, 1140 insertions(+)
---
base-commit: 90453dc4dee29b96b9162895f45776bc25526e07
change-id: 20241210-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-c273025682f2

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


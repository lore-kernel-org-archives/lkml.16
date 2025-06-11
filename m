Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2104.outbound.protection.outlook.com [40.107.22.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F8725BEEF;
	Wed, 11 Jun 2025 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647170; cv=fail; b=QsWJ1CshmQZrclXzgLNfBsQrnlmqv1x7SiLC8OBRO6F45y5Ifdbng4q1mkxk+7P/i658DfkUYaNp984llpoObmabBWmZELSL6gyUt1QxJBtpw1a5hN3/6itCEvqu0XDbwUAIeHECQAOMAfJpbUr9mb5NOq3BqaiKnv8HuQOzNDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647170; c=relaxed/simple;
	bh=4k06rxndBzTzfGNNrWYAiJYf4KovcU479vrS9GJ0AKI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ErQPTi+rzf2ILnO9i5QiUB1xB+939tQuWPMacbktkt/enFp2XtjEVHNj2mTiDqnEXaVmShQqEJ/etTfp0ewXoGCQemlO1hUwAgJdnCoZPxFG1IwwERUnjKJSkgAR6YNE3ZKLIDFxCuWaDXnzUleqiIDQMjElL+aYfQoSI1LSTDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=E/SqZSL3; arc=fail smtp.client-ip=40.107.22.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="E/SqZSL3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXyH+E2dO0CtO4inGcvyf4GI5KZN8/5qOa4xF3kFyIF7OJi8THBW9j+Lb8VEcBy9J8Ptz2R7XF4OUYySX8NUX2q7o4eSUsSZHvyq4pdHkpG7iJEtV71y1igDURNNiwghd+rlA+8XYfGgJ8dhuz+IRM6tBknZ+WxPWVD+zYRE4j3qJAkDplJ9/WUj4cwykCRJOrXIj8n+8cklsT4+QYpo+DFt3DLrjI5PDeyksRFqk7MHino4Hxj/baEVD4rQgHvSXWqUcCsGJ0xpzgEGeDcVAqZlXF5wfEuSwyog1BKw+2/eBWGYi6/ICoeHkV54dsWTt8Ti6HpI/1FSE13Z94EKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IUBYy2YfpxDgtci0XNauvXmiSDiYYwOMbpBWictcAc=;
 b=k7XGS21Z1CqcDe/1jZOt6s2nKh1pLzRy8HHe6bFqAXBjDzT+C0myoTlfk9KP+MKAast5xxJ/OH3oeW0tS2v6lSODWcIL15ijOESe7osk25PzAiUetckgm4svPw/FxrZ1ByOAQm+Z7q8m70E7uDMbdnYTiY+hLAow/lHgS/3BD5Cag/g+qM1Ol6/6TGaBlX0TFooOr7gPe8yU0zLQx/SZnQgU2vy50LPUQBimCxjq2N1oxIAQ9XACWZ9RViLiUUd3xvWkiHVzGD1uRgWRudU37eysxVtm0ehCY9pl34i1eGH3Mq0u1u2VKXX6OMbiVPbyc5zOWn5xXacxZQuFz6ujBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=arm.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IUBYy2YfpxDgtci0XNauvXmiSDiYYwOMbpBWictcAc=;
 b=E/SqZSL3d5EbQsElTOeaM493vjU5UGyhIxhJyfzHr3oFSLtwyrJu7MV+4TPRolzjfLs5SwBA476Ko0AAJ/dAOsGiGTTJas+WgcNJwWKlV/iYinDzLyd5hUqQBmfCORAdY2fL1le7WixQNsoBgWTsINrGvGeXAfB1zv1yrLPmrAqDA2UDjzTd0F6r+vUF7TuYQNsTuDqL4F9ZSu/UxVXGLEpGxWXvQsqG0t8F2nLkbbjNF1KWw6C0R5Msp3ZDMimStd5xO3sixP8yymOxXWlkJIe6VJWjaJhzVhqrJMsg+aF9g0CdrmtB6FJDfKVifxm9DY3U5bMohpDqFDrJsc+/hw==
Received: from DB3PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:8::40) by
 PAXP195MB1134.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:19a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Wed, 11 Jun 2025 13:06:02 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::ee) by DB3PR08CA0027.outlook.office365.com
 (2603:10a6:8::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
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
 2025 15:06:01 +0200
Received: from llp-moog.phytec.de (172.25.32.81) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 11 Jun
 2025 15:06:01 +0200
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH v3 0/2] Add new imx imx95-libra-rdk-fpsc SBC
Date: Wed, 11 Jun 2025 15:05:29 +0200
Message-ID: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABl/SWgC/43NQQ6DIBQE0KsY1v0NIMTSVe/RdCHwVZIqBg3VG
 O9e1I27djmTyZuFDBgcDuSeLSRgdIPzXQr5JSOmKbsawdmUCadcUsEkfFwPM7Te19A384gGbNq
 0k5LwdjqUwAujDEoptWIkMX3Ayk37xfOVcuOG0Yd5f4xsaw9c0uI3HhlQELrIbyIvrTD2ceyuF
 smGR34G1R8gBw6aC1YqJiuu8Qyu6/oFr+p1/yEBAAA=
X-Change-ID: 20250415-wip-y-moog-phytec-de-imx95-libra-27c9ce555b91
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749647161; l=1247;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=4k06rxndBzTzfGNNrWYAiJYf4KovcU479vrS9GJ0AKI=;
 b=oWJWByku1vfgZIiCmJ7TT0LMKQE1YbQs4mJribW1QYQN47L3mQGWxoVcYaM1sfqD5a0SfxHwF
 NWr79ahuK//Dzc2QqOoLC5nB51VFn2QRLeuYfJzgNPxi8pswj1mvUbY
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|PAXP195MB1134:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de72ff6-a3f8-4ad1-2101-08dda8e8b7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWNsWWRJczZOMkNaZXdzSHpucVliRzBjTTVsMFdHVnlOMDR4elczZWZjQ3hB?=
 =?utf-8?B?Z2RUbHRHc0ZveE81OTI0TkJYSXNNaEZrRHp2ai8yZm5OYVMxVFRVd2NhWUFv?=
 =?utf-8?B?cHVjaE9TdW5TNmhwLysrK0RQNW9HN1NYRkdnYXVvYWZyekR1UFh6ZTdsekc0?=
 =?utf-8?B?RGNWeEo3dk1BTWdtc1RDV2VrTkZIOGVHZjFqZWRibHdTMnBqTjhjVWVkWFUw?=
 =?utf-8?B?WTFrL2E1L0V0c3VRZ0lzZ3ZDY08rNnptcWZvN2U1WDRLUVpyaDlxdXltSVIr?=
 =?utf-8?B?ZDd1endYR0I3dE1ORzZvU1hYNWsrK1JRSWhwYkMrVHBuSksvOXIreE1YM29n?=
 =?utf-8?B?TEFrMlF4cU91d05nZ0RUNkNpUE9xZk1GUENaUlB0MzhYcEdiaWk2VlhoUzVj?=
 =?utf-8?B?YkdVVmsvTi8xYnIyaVk0QWpLdmZ2VHErQTdaOHVtT3hsbzUxcjlFMlY0SXlI?=
 =?utf-8?B?VkNIa3dCSitGZU40bWhFeEtmbzdBK1pTN3EyYUpNdFhvWURyaXprWk5BbVEr?=
 =?utf-8?B?ZHpzejdGOTdzZHhIY2VBNm9ZdEdXdHpVWHV4cm9IemZUdGhLa09qam5iQlRO?=
 =?utf-8?B?ZWpXWHhVdWRjMGszbDc2TkZydUFFVzZwNjAraFV2US81d1F1cC9ZWmVVTW5t?=
 =?utf-8?B?T04rdTlNei9ZVGl5czhacERIanFVOXFaRXRVN3VMMEphbFF1TlNvT3VHZUJD?=
 =?utf-8?B?RXdlRVkvSDVVV2hsQnpxeThJYkgrcHZORkVyUnhzeXY4c0ozZXUyWlNoNk9F?=
 =?utf-8?B?MkFxZ0FGemlvMmRmcDdsNTR2ak1KRzlSM1FNdVVKdTdSNEpyV3U5amFOTkc3?=
 =?utf-8?B?T28xT252RTh6SGI3eTJzQ0ttMFp5ZmFlVGJOQklhOTZyb3BhNTRkWWJ1K2ZZ?=
 =?utf-8?B?bXBFZTNkNmpCUjNXajU3cDUyQk1qdW1yZlNOTXEvZkxINHg5TjBvdnJWKzN1?=
 =?utf-8?B?ZFlycGRQMmxwYXhlbzE5bnBSbytYREF3TFdTWUpaNGFIYkNpQXhrSHQ5eDd4?=
 =?utf-8?B?WndIa1Z1R3NmeFZWWlRmWlY5SHFRQkppWnVUeGZCcHhNNkdQRS80djA4MnFt?=
 =?utf-8?B?bjRSb0w2cElhOHpJRHBYSy9jcHlnYVplMzVYckZPRGE2NVlndjc0S2dJeDFI?=
 =?utf-8?B?bHRhOFJYV1U5VFo0VFlPK3M0V25YaUFQWTNBczJIeG5hMUJqM1B5MVlEbmFH?=
 =?utf-8?B?dXNyWjFZc05oV1lJSjYwTFNqaWlyS1FqRFcwYlBJOHlDTHVBaDEveThjd0tP?=
 =?utf-8?B?YWkwTU5JYkUyRVN4T0d2NzE0QkJuRTIrZ1JPUERyN1YwS2g1T1ZIdkhLczRW?=
 =?utf-8?B?ZXFhTUEyalFwRC9nek1WS1JKZkw5N1FQcjJhMGpYQnRiQWhNMXJyWmpKdHdE?=
 =?utf-8?B?WDNVNWtHWGwzOU5YZkxEbmxUenhBTk9TbmErM1BPOEJWcUJtVTNTU1FlR002?=
 =?utf-8?B?NFhCRkdQektKMWhPU3VuZllNMzRyTnhlT1hzcDhIRWdXWU0xdVh6UGxsd2U0?=
 =?utf-8?B?Z056aDU3L24raWtIa2lDK2xSblpTVDF1VzZISVlvWXYzWmloYk1FdlhZNmRt?=
 =?utf-8?B?K0QyeWxJTXZ0YUVrUEphWXhubk9IR3oyTlBtS2FWRmpWWEpKRVE4bi9hNmNv?=
 =?utf-8?B?QzVDcHZ4U0VQTy9hS08xZHpUSitVcTU4K1NTOFlHS29LaFhtSTFtMjl6ay93?=
 =?utf-8?B?REFuWTRLSWdKOGtJZEJHV1ZVQWhMMUZUNTViQXlsS0NhWGlKalJweWdCd1pH?=
 =?utf-8?B?YTFYTFc4V01oVStmQmw1RjlGUk9aVDQyR0dhRGUza05aVUZtQXh6SFRNa2J5?=
 =?utf-8?B?QWtIV2x1Y1FiUTJiUlpUNFgrTXdLa1pqMWpRM3AwMFNxNFlueWk4TGcyUUNL?=
 =?utf-8?B?OUZxOWxlVUxzME9LYWdtMUNHWnFPU3JQaHdKcjlySTdBNklMcHQra0JHbGlJ?=
 =?utf-8?B?OUNzTTFjQzkxRTNZN0R3dTZYQ1VORU05NXp3U3IvSVhsdEVKV2c5WFF1ZXEw?=
 =?utf-8?B?VFZHS1VvQzUxRGYycnhST3JJblIxVXFxTGNwUzJmZkpJbzRHS0Jhcm9TY2RO?=
 =?utf-8?B?L0VmbmlrV21Tb3NONStUUzcvZU9aZmZ2MDcxdz09?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:06:02.3076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de72ff6-a3f8-4ad1-2101-08dda8e8b7ab
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1134

The Libra i.MX 95 is a SBC that consists of the Libra base board
and the phyCORE i.MX 95 FPSC SoM.
This series adds its binding and device trees.

---
Changes in v3:
- fix more style issues
- remove the rs232/485 gpio hog -> switch on the board is used instead
- remove erroneously added build artefacts
- Link to v2: https://lore.kernel.org/r/20250509-wip-y-moog-phytec-de-imx95-libra-v2-2-b241a915f2be@phytec.de

Changes in v2:
- fix indentation error in bindings
- align alias naming with FPSC enumeration
- Link to v1: https://lore.kernel.org/r/20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de

---
Yannic Moog (2):
      dt-bindings: add imx95-libra-rdk-fpsc
      arm64: dts: add imx95-libra-rdk-fpsc board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 318 ++++++++++
 .../boot/dts/freescale/imx95-phycore-fpsc.dtsi     | 656 +++++++++++++++++++++
 4 files changed, 982 insertions(+)
---
base-commit: 68087d05675e3ac0ed632bc7b175abf06617c584
change-id: 20250415-wip-y-moog-phytec-de-imx95-libra-27c9ce555b91

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


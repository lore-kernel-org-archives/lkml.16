Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2101.outbound.protection.outlook.com [40.107.249.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD0A286436;
	Wed,  7 May 2025 13:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623605; cv=fail; b=YneCnCkL6VffkW/9eZA/PhhdgrSnkjPWd8d5szERoBs6tsaO2DiMG1K/kuCCcFVsYru1/B7dKevVmXN/9RzZ6T0zOl41FzVzXkadQq5IAGuVpfZHhdLbSKx09WeFe9kMBoCkx2sb3zjqQ0WlKvzRrRytD0Dk2VGEAybqKCISCUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623605; c=relaxed/simple;
	bh=f8dvBMr5HQgBoGnGE7jiIMnbxlLnTemkmPpJNUrkkYE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=puUomPq65gQG24z2oT+ZLMcr8SRXaI9mN9b4hkkqiOR51hWHoxwsuntbDD2Nd9qx7Mo5D43E6BqRcpKI/kkB4xSHwnP+xHC+PSrDbP0oGQ/9fHxzSt6ZRSX+HLw8ekAJHBzyK86cOJqfr95sO6tqtw0NvzrqOtrOF++O9/uDAtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=CmI+wF2n; arc=fail smtp.client-ip=40.107.249.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="CmI+wF2n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESmcr/Ho5mNuZgDucygoi98fZ+bfvTfDQKCjmJt4QJc1OgE75xDhcLgFMuoFbZC8N64zRaG0njIExzxTXyI/4rFVOZchx4FKgt3gqtgfrgifGtHU4oZhKn1hAVu355owZyZQNer5gGylqTwhJRzC3FX3kpBRllAmz2TLGXcY1CIljirPwrzw+1+qUfeMfdxtGDIOX4lF6yO7JgttWieUj1Osq8FIHPgRDKMGm0XqgoVLj0KU154xIoRJdgIa3TcBLwsKU9B3/MtZInE0S2ihIPC2arqsO4uevqC8qukM9g8IhDcLvL/9Y4csepTmE0tJGGD7ZlE+idupmkDvYfLOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kqwtrw99Ez/4kZITdd5jGWTFQCWm5mfa5+0ryDTVTiI=;
 b=tRuy9isyPCyc35SshvDlaSBIOTmDGPt30g8XHBZFg7QUohqJF4jFd/EuMOG3G2XqJ0rUy0Qf2LU7VDh0rPxxY3uRsXOr8nd3a/Fl2J/aUod8OlnAwwm2vND/sY67fRL1PEEdaqabP5OAgf3iZkhW8npWJ+wUGVlgkRS/2CGE7skraNJVZqNGCaKPBZ646Hn5H5UqMi8WW6aw6RcldHJGbTiOfXBDQksOpAW7egbRKPncN1S7qIvoCpkaNRPeF3xdcdflvdUdxX9Q2CuG3+a8/VsaVLEpj1yi3nfNDbGfmtAII6rlIlraaHRdE0KhG95BQgDyp20NTI+rTEnli3TClg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kqwtrw99Ez/4kZITdd5jGWTFQCWm5mfa5+0ryDTVTiI=;
 b=CmI+wF2n8kEGYQrEgZ7khTNaKDI68pkIVBns1kAWt9evx9oWIDDO1/YBsMooT1oAu1V8uZUxM7zgin5ed0r4yyDBil14U0d2oO5ZAlpA2EPrIxhlwbNFwENcxm/p32+1tsa2XI0UlCiacIx9NJDRb1UvsysV8Hc/vtmuy2+yVITV7TaNvWUg1UmPLl9zaKdN9f9jayIG2aBX5QDDSNzxiDlmRN5sL8Pcjke6J34jOpwX2hQQA7WZQZNxtRgB35a+PeEbr7Vt+MSgVEWSulHkAn+6L731nHlmAFSDfrSVZ2Whgv18D1+4qVk4zG7Z1AkrJvfD81NR2jo5JtafZuUzqw==
Received: from AM6P195CA0070.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::47)
 by AS8P195MB1976.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:572::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 13:13:17 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:209:87:cafe::aa) by AM6P195CA0070.outlook.office365.com
 (2603:10a6:209:87::47) with Microsoft SMTP Server (version=TLS1_3,
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
 2025 15:13:16 +0200
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH 0/2] Add new imx imx95-libra-rdk-fpsc SBC
Date: Wed, 7 May 2025 15:13:11 +0200
Message-ID: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGdcG2gC/x2NSQqAMAwAvyI5G7DFIPUr4kFr1IDa0ooL4t8tH
 geGmQciB+EIdfZA4EOiuC2ByjOwc7dNjDIkBl1oKkpFeIrHG1fnJvTzvbPFITnrZQgX6UOHurL
 GMhH1RkHK+MCjXP+iad/3A0yGetFyAAAA
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
	<linux-arm-kernel@lists.infradead.org>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5F:EE_|AS8P195MB1976:EE_
X-MS-Office365-Filtering-Correlation-Id: a53aace2-375d-47f0-2211-08dd8d68ee98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1NhbHpQajBoWVcybFA4MTh4QUplS1JVQXhsV3RIWWFDSmpXVnRHWWxQVFFl?=
 =?utf-8?B?NGtTb0UydUM1MjBHaXRlWnFMdndBdDcvd0dnM0NQZFc0MHVOWnkxamJFSFpF?=
 =?utf-8?B?ckxaWE1pS2R6Yml3KytuUWNNYXpqdnBhY3IveUNBWHh0SERYSm1sQVUxOVFq?=
 =?utf-8?B?ZjVQNm0yWWZIaS9RaTJaNU56L3I5cGcxd21QTUs1M0E4VWxFREtRUTFoT1hs?=
 =?utf-8?B?RnBxQm10NjBSc2NyU04yYm1USWk1SmtLQUJQY2luNzJvZDlOVFVBa2RWaEdT?=
 =?utf-8?B?R1BadWtGOW1PL3EwVjNDRUtzS05hY0dGVWljMkgrYzFqMnZoeFBCQ0oyMlVs?=
 =?utf-8?B?TjByQUp5b05zQ1JxVTc3VE1VdXJiZTVVVW5jYktJS2pLMWFKbk1JOU5GYnJW?=
 =?utf-8?B?VzgwUVRxSGN2YThXUGxJREVrYzVsUU9BeWhXalZtZEwxUXc4WHR6LzlBcXFS?=
 =?utf-8?B?OCtiWjB2SzF4aDZVazZBT1ltSjNKVjRGLy9uTW1MTFYyU29HYnA5Ui8wazZ3?=
 =?utf-8?B?S2pVejJ3RGUxYUJyaStxMi9Sbi9zWVFUM25WR1p5enBTNUh1ZXRtR3c3aEI2?=
 =?utf-8?B?MVg4SlVhY1NsT3ZDOWwxaU1jUHZHQ1NXY1FDekZ1UjV5Wlh2ZlZJM3NMaEhl?=
 =?utf-8?B?dGQ4Wm1sVVc5RXk5QU5HQUhiSHkxWXdNT2pva3BrYTFBalBrUWROd3J4UHFr?=
 =?utf-8?B?eGVndE82QUYrRDNRWEttM1NHMDRwYk5YYjcrN2NmWnhyalBUanFjamkrNWpo?=
 =?utf-8?B?TElJVzF4YkwyQ0lqYlNCUXNwaysrYXBTeE9aaDB2cERDNHRzR2crYkl4Yy9Z?=
 =?utf-8?B?TWVjNXlCTHZQWmV1V05VYys3SXNIM1Bja1YyelJoWW5iUFNnQkhITUZwYldF?=
 =?utf-8?B?bzU4T2trQm4reEtURzRRalFJdWpKVGNpRWJYS0wyWUR0b2lQOC9CWGgrS3Z2?=
 =?utf-8?B?OEFkWnJyemx0SXZXeVZFblhSdFIyeXYzb1I1QlZuUzBicEx4VWQ5b1JEbG9k?=
 =?utf-8?B?UjNMcjBVV2lpcHd4a0hUMEhaN2pYYXJYNER6Y0JFbTdTZG1rbjdnUkFyc1pK?=
 =?utf-8?B?ZUZKYVZ1N01JUklJSGZvRDM5KzlQSFA0NjhIVGZSMkJPbkRsK0lDU2tZTTVR?=
 =?utf-8?B?ZTlqeVZ3QUYraVdwNWlPcGY1ODM5Q0VjcXlQb1gxeVY2N2VRVjl4OER0cmVr?=
 =?utf-8?B?Zk1MekpDeGhEUlRrNGZ4OEhETGg1OG9MZnpCdEZKemlGN3ljSWZaY0JlZnJn?=
 =?utf-8?B?bFVOUkFJRzR1UHBmYmdXOURuQ3lielA0WUNrNHVDb2M1Y1ovNmpzUGVYRWZT?=
 =?utf-8?B?R1F6VzlNOVhKVVg5ZUxYdGFSWkdKdzBDNUhNWGtKZmxTYnRYS3puQ2E4NnZR?=
 =?utf-8?B?VXNOUHh1SkROdk1uVmdweXRnbnVUdzYvcVlJZ3dBR3oyd1JpUG5BSzNDMVZQ?=
 =?utf-8?B?bTFudDlrckFHZlVSY084eDluTTFtZ3YrZklWL2JmL1FSTVVSdHppb1lXMCtz?=
 =?utf-8?B?MTVTcWM0V2RnVmZhMUtxR1h2Ym12ZzhwU1JVVEZySHlEbEFPdFptMERnaVBO?=
 =?utf-8?B?Y0FXYTVJaUJkbmUvdmltdDlkZEhjSTdzTnpYZGl0di8xN2xZQWp1Y2tKa3pi?=
 =?utf-8?B?S1JLZTlVRVpDYmo3bU5BVFEyWW9nd0J5SzV3b3l2d1RQWXpURlVybEducWRI?=
 =?utf-8?B?ZTdhanNWY3djR21QMzdNZnJNeVlOdjB2cGNFQk03RU8xUldBM0Y1OHlWTUx1?=
 =?utf-8?B?VHZpbS9RWGVkODZjSFliT2MrdUkrR1EvK0hrNkNtY2I5S2dpUjdpeVNWRFpB?=
 =?utf-8?B?TXRYS01OQ2JXUzUxUzBwSS9IY2p4Qk1HRTJEL1lBM1F1T01ZUUtXMDErNlAz?=
 =?utf-8?B?VzFFclhsQms4TUxCSmZzYWU2cnJCcmlDalpjSllra1Q3Q0NFa0NvUDl4Qk1w?=
 =?utf-8?B?Z3g0czZ3QmpudjFETFhZN3dSdit3cHl1NmVwQnRRZU1kOWoxazVUMGtOamJr?=
 =?utf-8?B?ZUFKbE5uditPbHpoOXZkbmFLZEhubWFNTHZBUSsvNVBGRTd1anlieHRoUzRx?=
 =?utf-8?Q?mkbmow?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:13:17.5111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a53aace2-375d-47f0-2211-08dd8d68ee98
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1976

The Libra i.MX 95 is a SBC that consists of the Libra base board
and the phyCORE i.MX 95 FPSC SoM.
This series adds its binding and device trees.

---
Yannic Moog (2):
      dt-bindings: add imx95-libra-rdk-fpsc
      arm64: dts: add imx95-libra-rdk-fpsc board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 327 ++++++++++
 .../boot/dts/freescale/imx95-phycore-fpsc.dtsi     | 656 +++++++++++++++++++++
 4 files changed, 991 insertions(+)
---
base-commit: 9bfe32fed9a8c17000f7cd6bc59ce8348aefe5e9
change-id: 20250415-wip-y-moog-phytec-de-imx95-libra-27c9ce555b91

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


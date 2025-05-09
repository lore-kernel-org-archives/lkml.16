Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2104.outbound.protection.outlook.com [40.107.21.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E347821CA10;
	Fri,  9 May 2025 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792970; cv=fail; b=ecHKFrrsnhKpxlk+rRTBq6Rusexlz+jUC1QE837G7/I0vI1bHiecVA7iJ++E8qYejZlNoS2o0uiZNst0N5xpcvn4kOCt8Y7kB9YN7tYmMb+/WGimwBBXQ7Em7btbyQkFvQA29OWcI5ii9XUZaG3maoZKbZaWGL7iLT4yue/RHf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792970; c=relaxed/simple;
	bh=v4l4I6sqC8qDwtMxjZEq/V2u5TK5A8buTqGqNmkCyME=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=XF293XL/lfY1Zlsn6p/+EvJwHzNs2Knz/2pnfVoS4sSvYI7zZNzTFkRtGR6XwyacQ2y8oauE8/ue+sVTzaKsiw7PnkgUlhTfebOmQog2c88JZKFEjcmm+6XRfw6VCBjTGGEvFQBUkRwtEWeoIWHKdMsyoNEzaPNpQvrE2GoS9+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=q3GWjd5m; arc=fail smtp.client-ip=40.107.21.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="q3GWjd5m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxHwPPj74spXDa3mvrEO7iKTzZwdQAXg4BpSm62Ixth+54pSj1QdlTlkHIePl5GJzro77nDp0Ma9HWxdcw7uPer2Qt7xhabui1L+LWq4q46VnrFHAMk+gg2MKF6s4IxKFVZaJcFDj2YFcuQwzscdcJHjFvuWEvUnHyyZYs6Y5a94D/GxCoIMeUXwampZ2s2jZtpqLUVDPa5B3HuDznbec62Oymldrc/Ch0hdlJUz92+H2RyaoO+0WzgpgzU+m95m9pIzN/9JxV9RIGWfAgsqtguECA/GRHDL7ZcLv/L/qSGUJcnkSqA8npeqhLwmKYPzxvZ7Zaq/4Msn8qM62FD3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQ5BEjDGUl5wwPg7TwY134gEflFu9akbPnu9IdlAY2k=;
 b=LuthuNwlcWg67uh5hP6J1eHfjFnqsWAGEF52LUQUNN0tGuWrhc6VXBkETTYf1eF4tjCiEhIwbGJItTwDX90Moaoz/nFs8nx4PaQPJdyngliLL3yK0LWuN6IRRqA1QwEVxz+anpvUaMTlDkpMceoT4HBTi7dJK3Ol/G/q0cGSWzPDrT11aKCaoHCoTY0fxJqDxQvBNUdkDTsLrII7dIuoyN6X6ri3eOLWenR11kl+nA/dZ/eP2hND6uhcGy+mF252WFRpJBoRFPy1XF1UQ5MNDxhZcSaviZq8gw0uVjEUrjJ4Se6jQSZJphjufSahLhgw6AqnYpNVXMkQIvAPouONeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=arm.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQ5BEjDGUl5wwPg7TwY134gEflFu9akbPnu9IdlAY2k=;
 b=q3GWjd5mWNxbyjedKM6JFKKbUpeTrgBkLs5CHKrvSsc9MXgyDZC7BZ/A12g2nYuebIbLzFESA5nrjmP9IX72cmN+WpAvdFhkiLIF9CsJoYRfyfQIeMrWVmpZ1Qnc8WRYxOnKhCMpzWS/D/5KqxjWLQaQWsq1tP0n0rmCwgrJd/e+oeiJ2CWuexGeOLLOo8UacpkXhztO+AYuKFl3KfwVEPokeM3QApoTqAmizV87wgO1lu6hVg8lx0sGSpMfH8AeSSL6gwfgI/zjvuw6i0QwqwjzyMwBxMEBtLX/403Y20VkckFXNa0ttxtTyC8WyOO5IqIM5brU2gkigxBRTcSMFw==
Received: from PAZP264CA0131.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f8::17)
 by PR3P195MB0505.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:38::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 12:16:01 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:102:1f8:cafe::89) by PAZP264CA0131.outlook.office365.com
 (2603:10a6:102:1f8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Fri,
 9 May 2025 12:16:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 12:16:01 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 9 May
 2025 14:16:00 +0200
Received: from augenblix2.phytec.de (172.25.0.51) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 9 May
 2025 14:16:00 +0200
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH v2 0/2] Add new imx imx95-libra-rdk-fpsc SBC
Date: Fri, 9 May 2025 14:15:49 +0200
Message-ID: <20250509-wip-y-moog-phytec-de-imx95-libra-v2-0-b241a915f2be@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXxHWgC/4WNQQ6CMBBFr0K6dkxbOkFceQ/DAtoRJhFKWoIQw
 t2tcACX7+fnvU1ECkxR3LNNBJo5sh8S6EsmbFcPLQG7xEJLjdIohA+PsELvfQtjt05kwaVPv5Q
 Ib25CDbqwpSVEbEolkmYM9OLlSDyrxB3HyYf1KM7qt55ylMV/+axAgmmK/Gby2hnrHufv6khU+
 75/AVAGEZnQAAAA
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
X-Mailer: b4 0.14.1
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|PR3P195MB0505:EE_
X-MS-Office365-Filtering-Correlation-Id: de5dd24a-4d29-42c1-fed1-08dd8ef3434e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVI2aFFBalJKWnRNVU1TWXFzcGJCYlorNmlGeGhITFZkOTZqNU1rRzRvQ1BV?=
 =?utf-8?B?bEw1U2hLM2FJNnMwMWpPdWhzT2RBNXF1UmlVQjZtTGJmWUNTUEhTUE1iUFBp?=
 =?utf-8?B?ejdFSXNzNjJISlhpZEdOb2dHOHZ4R1R2Y3I1bkllMFFGUTlHanNabnYwbnFw?=
 =?utf-8?B?enRTN1V0U05jWkZlbEc5cUVjT0g2ank0cGJjcFJ6MENtNTFOZHdKZmQrS0tL?=
 =?utf-8?B?b1EyUDRVVWlsekJmdE1iRFAzaVBPZG43MVJmM2FQZFMxRWNMNThPNmpIV05a?=
 =?utf-8?B?ZzdkVlpYTlg5dTllZExUWDhnWU01SEViZE8wWGZvcGUwRGhNSFdLS2lvQkdP?=
 =?utf-8?B?VlZkODBjRWd2MnQwTlZ5WlhPdUdzZlhzN2EwN1VBUlBBd1RsZ25ZKzdvQ2wr?=
 =?utf-8?B?cm93YkhwRnJoQTFDM1Rnd3RmVEFGWmlLTldHajlQYzAzSFYwNFVyLzlxUDB5?=
 =?utf-8?B?V0ExMmQ3MEhVaHRwR1JpdVg5Y1VFVnlCdXMzZUpTUHJCT2hycHkwMzQyYnBG?=
 =?utf-8?B?ck1zYnFlS3NoVFlzZ3h1VGFxcUNmQys2bzkyeUF0TDlTNTVYUUo3VVd0eFRU?=
 =?utf-8?B?UVhVMVpXbnpTQjNwTTBlbStSajNEZEJkME9iV1FHMnF5dk5nV3QwRm9SWEkz?=
 =?utf-8?B?Y3pGcG5wY0g0NG0veFVyK0lEam5rUlQzWWFsMFdZbVNwQUdQSk5YTzR5WjZU?=
 =?utf-8?B?WWdvNHl5L3ZUQ1I5RmxBYXJROVNhU1BwRnZWQzJJRlNOT01pNTFPZTY4b1Nk?=
 =?utf-8?B?cGtVZ0dFUHB3QzFoYTVaUkNBWERWREVoOGRXUklxWlQ1clNOOCtXOXdxaG1P?=
 =?utf-8?B?N0xCOXViYXQ3Y3c0RUZ1ZDM5YmhVaWlXNjVzdGt2eExYWURMbGNZTGUwN0Yw?=
 =?utf-8?B?SzJ1bS9QdDh6YStPajhnNnBDRXlFWG1abkdFUitYZUxHOU1pcjJPdkFOallQ?=
 =?utf-8?B?aDNUTGtCenBSdE1lL1Y5b1ltRlRlam82V1IvSkxtQUlHRFVxMGdoUkZSU2Yr?=
 =?utf-8?B?U21nSHBzSmNYQVZyanFGVnZUZGY1WmpJMnY3YnVHQkhhTFl6Q050TjQxNWNn?=
 =?utf-8?B?VXpFSXlXOUoyTmtlOGNnYTh5R2xXcUV6Rk9mQVBDckIzS20yNjdFaVl2Sy9P?=
 =?utf-8?B?S0RPR0VSM0o3L2cxOHBVcjNiajBEdUV1N0p6SFd4Y2JDQUhVbU9XYmNCTkVz?=
 =?utf-8?B?Um94UFB3QXBKbXMyeU10aUUyeWtPTDJyLy92alNteHo5TjZ1UTJlaVp3Ykll?=
 =?utf-8?B?Z3NRekRDa3Q3R1UvWlphV1JuYzBGWlVMbHJGYnE3WHJOQjBXdlpqa3RVMGs1?=
 =?utf-8?B?S05UeDhna1J2KzZ4enJUUzFmTHVZU1VPd1cxdkFiUG5mQXVUK096b2xHVXlt?=
 =?utf-8?B?V2kzcjBIUFRaVWZqd0VMRWRyS1pSbzNQRDBPT2M1aTljdkFEa0o4Z3Nrb0x0?=
 =?utf-8?B?TXFaZFNHdC9vVTc0VURDaGZIVldrMmR0VENZTTdaUHVCUGRYK04rd2pOdlR1?=
 =?utf-8?B?RnhVT2FOU3pna3hvbklBeHZ0VjVHYVVxalRYMVV2U2RhOEw5T0Jyd0VwdGRk?=
 =?utf-8?B?SGg1dWxYdWZUVmtvNTNoY2NHODlnMzE2WTI3RFloM3pwcXVVOTJGK2g2ek9L?=
 =?utf-8?B?MGt4b2JySUliRG5ZaitGMnFHR1FQQ2xrWFhGenlQNmMwQjFlaVorQTJtR2lu?=
 =?utf-8?B?Z3VyRW9aa0VpNXY0S084aWtiWm1PNjh5ZUZJSVVHWUJqVE5aZlNHQnhLcTlx?=
 =?utf-8?B?eTNzZmRuQVMvVmFFWlY3L0NQeHFwTHpKY3pIa3BOVEhuQTcyR054dk0xbU9J?=
 =?utf-8?B?L1RZS1lNMEs4MGsvb1p4R2E0eXVUa0x0VEtVbTJyOEUyd1kwUks5dzRSYW4y?=
 =?utf-8?B?YUI0dGFUUUdyRy9BYWtEMkM5YVR3U2NHOElTSTZKZnhHUUQ5K1dwdnlST2hR?=
 =?utf-8?B?ZkJMaUpTdm9uVFp4eGU5ZC80cmU2RUt1UU5tck1LcDdVZDJic1VGMFN0Yk8z?=
 =?utf-8?B?cFJjUVVDWUFCTjRSSzhkY1MzTTg2ajhaZXNZcEx1dnlxVWpBTDZtYXd2NDNT?=
 =?utf-8?B?cVU4bGx2ZUxvWTdMMmp4aGpGQlVpNGhLNGFBQT09?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 12:16:01.3477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de5dd24a-4d29-42c1-fed1-08dd8ef3434e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0505

The Libra i.MX 95 is a SBC that consists of the Libra base board
and the phyCORE i.MX 95 FPSC SoM.
This series adds its binding and device trees.

---
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
 .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 327 ++++++++++
 .../boot/dts/freescale/imx95-phycore-fpsc.dtsi     | 656 +++++++++++++++++++++
 fitImage                                           | Bin 0 -> 14928380 bytes
 fitImage.its                                       |   1 +
 6 files changed, 992 insertions(+)
---
base-commit: 9bfe32fed9a8c17000f7cd6bc59ce8348aefe5e9
change-id: 20250415-wip-y-moog-phytec-de-imx95-libra-27c9ce555b91

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


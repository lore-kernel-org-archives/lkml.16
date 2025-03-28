Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2139.outbound.protection.outlook.com [40.107.22.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435772F37;
	Fri, 28 Mar 2025 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167136; cv=fail; b=XDYwibfa/6egZzs5PP0iJJd3zkf7n7IiXAmFbOjtkS+aRBP7nQiZjKKcbIRsoD4yA7GOlvxI58BSKjEBV3ucj+Dcgjnr9rjpvsufWdKCR7RDP4QQbI6DjGxS8u4RM8coeujaXBPNbh62e/MRm+y7vXxdGIdV6vPoGlegi863QMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167136; c=relaxed/simple;
	bh=dK1PUOb8fTE3ruVzZWdTBA8rErxhCrEj3bi11sRE0N8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=SGBrPwp6gJDou+kvMLmJ3d04KPwDhWFMq1c1yQLdjv8+jNGQuABhuSVTJzQ8r3R1UIq1rOaUUxWdlgQ0Xtlfpc1xY9ePK3YzwUAXBfkevoDlSB3Zs2v1oeAGobeuJUK0nHBzvcIOYEjaJppbmRY7c4DjKeu++dxxGsbhmzUbA2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Qy+sQ3N6; arc=fail smtp.client-ip=40.107.22.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Qy+sQ3N6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PibHe14Xr3FF4nD6uBjdYl2IVBp1oUdPPzD20+7gspjGwAk2Ir0j6dyuFY0wN9PJyN58s8U3fun4SXsuK+jU+HF9YvkTPR4GkMpj1k07LMHeqaNWv2x87AfZXywxvQZvz4sVDEJqglFY8oMZuzUxLmFtv48chhoeEjOCG4diH2/g6texM47yTYQhos/pYCQW50EJUE2doEmGasz7v1eszj4PmtqBZD4tU54wSjz1PqMjUNOCcSxbM6G09EfkpoDzWc36LADqb2eVlJ6ge6+sN0yn0quGoXpAOed7OFmOPzIdWl7mfNkww/b1CUjUEjVEEXYLg1uBdSS2ZUDpn5aImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ch+xJIhNT6llCQDR65BvcG+QgaGbGi3JSaEvxyGXn08=;
 b=wvTRm+ZGLTbWaza1eE7pgis9bWKSOps2MG2345V3zc2Yjb/t5J5WYSBEAy62kY+4cKI7hEPUoamyw1DJ/KtpimPcipvp8Zm9Aa0WA0TbSWP1RwbP4CxZbN/gqOMHPnsAlOKhxIiBXFSCWDfFXHfmh7r9TLKsPtLpe6S7+SQNLfq6bsImLhHoOgUBe2oHMMjKd2ufEKcy04ogR6hn02Q5g974JX3ewmkrixTWdY9Emn4P1/Kh3iOdKd9RnOsmSh/yyMlsIf3HNRpGIdwe7U3yEze572SuyTi6iE4qrcr11kuu3k1xaUfr9OifAolKg5qe1RdrAuV8U32olv6L1L3TGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch+xJIhNT6llCQDR65BvcG+QgaGbGi3JSaEvxyGXn08=;
 b=Qy+sQ3N6zygoSIQxK0ZeMek1FcgrznZY8XeRbXUu06jUx3pT/547H6PiI7IW1jCrrDre78TWNiWvo8KfFVSWCaKBb+1IpmHMADzO6uUDjI27K6EUfBqqQA0XKizGSP6DDEqNklxnKEdROC7Bo2Kvq5H0vDrNhQ3W4facyDwYtvYntGC9cBNVAwakIxDC5Rg5JS7IqFivrLydgIEVRG0PRY5Xeugx7Lj/D1SxK4kvDsYOWTRHZ3LV/lev5DqvK5Hb+BNfeN26Hk+tcrw3VHhmtKgn3ugUL8mU1w6b73OZjOqZ8it5ypWUFqLMDlEF2uDo6xxhEQV6MStV6ZfOTwqUzw==
Received: from AS4P195CA0053.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::9)
 by AM9P195MB1346.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3a5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 13:05:27 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::32) by AS4P195CA0053.outlook.office365.com
 (2603:10a6:20b:65a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Fri,
 28 Mar 2025 13:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 13:05:27 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 14:05:27 +0100
Received: from [127.0.1.1] (172.25.39.168) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 14:05:26 +0100
From: Yannic Moog <y.moog@phytec.de>
Subject: [PATCH 0/3] Add new imx imx8mp-libra-rdk-fpsc SBC
Date: Fri, 28 Mar 2025 14:04:36 +0100
Message-ID: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGSe5mcC/42NQQ6CMBBFr0K6dkxnBERX3sOw0HaAWUCbliCEc
 HcLXsDle/n5b1WRg3BU92xVgSeJ4oYEeMqU6V5DyyA2sSJNORJq+IiHBXrnWvDdMrIBmzb9XPV
 +F8YFhsZHA4auF01FWVFDKt35wI3MR+pZJ+4kji4sR3nC3e6RQiPm/0cmBA2F1mzfN2RT8uO3P
 1tW9bZtX8npie/gAAAA
X-Change-ID: 20241210-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-c273025682f2
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|AM9P195MB1346:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f8babc-84c4-4e62-beda-08dd6df935ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blo1Q3c3QnZWalFLV0E3dkZKOHNFWFRGZzF5aHNESHVRWFNRMmI0Zk8yTEJi?=
 =?utf-8?B?TGk0VmRyamVXSmljWXk1V3RnVmIzNTN3czV2bmxScHNGT3E2eE16aVc5TXMz?=
 =?utf-8?B?U3hpbGVuSndLa1lmbWxYWUIwakVaNTN6R3duaEplK1hYd3J0VE5hb09zaE9W?=
 =?utf-8?B?V0p5N2JaMkNHNlNDQkwyb2NrcnVVSGU5Sm1MT1FmL0lDb0FHaDlPaWdsZ0VI?=
 =?utf-8?B?SWcwa2NNQUVsQ3lmL3FHbTUxNFZ1emZENnFUZWNWakZRQ0xvMVJLQWRqTzUz?=
 =?utf-8?B?Y2dFaGsxajB5SnlmeHBCNUhYODBPSi9jRWxkSkxaQnJGR3dsQnZzdVlGenVR?=
 =?utf-8?B?cnhYOXpCTWJob2ZlY0hKVTBkQ2NiSllieE1jdmVnTUVlVU1naENqeFZBaG5X?=
 =?utf-8?B?UFkzdjNnQ0V1SEMyTXY1V2xndEEvL3BjWmRSRWVtMFVtdlVrUTFqL293c2h5?=
 =?utf-8?B?eU5ud0tobXlvMUV1QUQ1dHZHOFErSi9iYnlSeUpJMWFMZ0pvaVEyTW9kVzRN?=
 =?utf-8?B?YlFKWkk4NGdmYkRiMUN6NURYNFV2NWxsWUtzZURJUVZDZHBxbUUyVjN6V2Vo?=
 =?utf-8?B?cGIrY0lhVGUrRFZRUzhUcG1iUFZTUkx2WEltK0Z3TklERG8xaTR5MlE1ZnF5?=
 =?utf-8?B?Q2psbXYyRDBaZnBOYXo3RXFmM09FSlJKNzRYRUVFeU96azdYVk9uajBTKzgw?=
 =?utf-8?B?Rktad1JNTDBiSGRlUytOaS8xYmVFdTdQdzVVa01SU24zTlNOL0orRW9XNnVG?=
 =?utf-8?B?Z29rV1NHQ3ArZldJYUNtc0ZVOWM5K1N2V210QUlJZTFYUEE5MklyV0xoemgy?=
 =?utf-8?B?TkRyNU5GWUJiVXZTemUzRlJYZkRHcUZkNXN3SjhKUFlPMm9lUDFtMytKbEFi?=
 =?utf-8?B?b2J6NU44N1RoaHdMZWxtWmNwQi9aMGpWUzFZalBob0NoYTN3MU16eWh2S0dN?=
 =?utf-8?B?ZjY1ajNSLzVORllWMG1ua1R6UlRiYU1jUGhXSmtNc3dtTThjNlZUVitMellX?=
 =?utf-8?B?V21BZEFacmF3L0VxZVZBZEMyMDErVHkrZ0N6OUVIVzNkbHRwQnhHT2lXdkRZ?=
 =?utf-8?B?QzJVRzk1ZjFUMmppWlB0MTI4SXVWU1hJbUt2TklvbmQ2ZFpOU3ZiRjNVTnBS?=
 =?utf-8?B?aEpIWTZZTjd3b3lERHBLeUh1ZTkyRXRkelMvZlZKTE85NG15TEVMb0pEY2tX?=
 =?utf-8?B?QlFoV2x4RTVXa2lYVExiY3ZHakVGSCt1UGxySzIva3I5SGtIQmVzMy85d21N?=
 =?utf-8?B?bUhoaTBFamZGcVBKVS9MZ3M1SlBvcUpWb1U5OEhoRVJlUE8wNmlLUkVsbVJa?=
 =?utf-8?B?TXpibldCUnBsblAzT0dBQXgyOCtlb3NzTHpkRlozWGkwcVNDRHNtdmRsYUdu?=
 =?utf-8?B?OG40VmdXOXFoMG45Vk1WaDVEeW5KUmJUNE5SWW5HY0tMV0tBTnlmYkNWRXlF?=
 =?utf-8?B?aHdxazVFU0FWRy9xWTNvZDJRVFZyTmlQYVIrQnZwUkdWbHU2cUxVVEUrK3FS?=
 =?utf-8?B?ZzRBNEY0dmhmQWZ4VEphWU5LcDR4VjdHbkZ6cGRMSFFLL2xJWituS0oyZEZ0?=
 =?utf-8?B?aHo0ZlJWSGdYM2NQaTVaOUd4N09JTWdOeXdWOE9mQk9QUnJBZDUybkROL3hJ?=
 =?utf-8?B?b081bEhRZGxVYXRxb0FLeVh1SWJGbkhTd205U3U4VDRwYW5Hb2l5UTFVSG1r?=
 =?utf-8?B?eWduM0pZSkp3VjFLbGs5Wkhqb2xaU1p4YnUva2VqTEtGeWpjL3JyMWpxUTd5?=
 =?utf-8?B?SWtLK0JkUHdubzFlWkZEYzM2VGlOakZUcWh1L0pRb1NMVnZ0Q29EeElsby9n?=
 =?utf-8?B?SHZSa3BnanI3MExuV1JrUkN2M04rTWlyNisxd1QwbkgrU3Z0ZGg4My9KUjZR?=
 =?utf-8?B?SzJKbU5GRC9iQ2RVcDJUcVgzNmVYZjdUNjVYNmZBWUhZVExFK3dhQVNWT01Y?=
 =?utf-8?B?QzcrckljYXQrTlZrZERvcHdIbGVJSExyNmJuT0x5OGFFZnl0YnBWNmNZS2JH?=
 =?utf-8?B?OE9Ea1ZNZGJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:05:27.5289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f8babc-84c4-4e62-beda-08dd6df935ee
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1346

The Libra i.MX 8M Plus is a SBC that consists of the Libra base board
and the phyCORE i.MX 8M Plus FPSC SoM.
This series adds its binding and device trees.
In addition add an overlay for an LVDS display that may optionally be
connected to the Libra board.

---
Yannic Moog (3):
      dt-bindings: add imx8mp-libra-rdk-fpsc
      arm64: dts: add imx8mp-libra-rdk-fpsc board
      arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay

 Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |  44 ++
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 291 ++++++++
 .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
 5 files changed, 1141 insertions(+)
---
base-commit: 90453dc4dee29b96b9162895f45776bc25526e07
change-id: 20241210-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-c273025682f2

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


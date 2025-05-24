Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020134.outbound.protection.outlook.com [52.101.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1277482;
	Sat, 24 May 2025 10:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081024; cv=fail; b=GPl+RD19uHNR8usDOTrWjaOesz8qzGs8nsQkINXDxnVtKhrW3+qWHdrBnhhyHyBOLI1iaYap2NCxYcTPFtzqP0M6VsPD1IJOBgF8bGOOhIQ9gGZ2/nn+dws3d+JUlGAGK5bDYailQdDrU9eQKnesAVWIGbGwNoLZQa6eQznRbjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081024; c=relaxed/simple;
	bh=ANK5vuSs6ski4NnZIX9DpPx5mSn5yCt+YLju4lCozxE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bbiJTbDLG2fQIiUtCJ5KTNk4pCxoRtVs2cwoh8yC5ydTnime11IZ8nDL/gy3JIory9GqhRer2zjSKKZE8s7/XK9HeNmn/4JsvjwbfEqsQMkzq9FmLbjX2/8r9/i8QYfuwoRRPu0ot1rt2MMWeLaLboyAHzXzBy7+12jAxCz18T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVLVS/jOTxv8HogQ1ocw4Q5VHfxl4XjQhsB0qbRg+x+44WmIn7E0Sve2QmmZob1ayAKTyUxCFxzsY2iCHvxXyXMDqG5gymIDRNJJ8nQBQ4pp9NSGedENIpjFm+vDs2znNLCrIrN72OtA2743enp3f572e1dr195IJ5aK5rliz1PO9tJ/mHMmDVavw5JYCP1/FS0cnUsvAdFKboSwQt9NA7yn4tgUcc5+8TKoMiHfFjZarjBRIbk2shbR1eZMTg56R4GevJRDzZjY9xBwtqaRBd0EbUm175PpN3AzysCFbLPoGuAPmWNgJDB0Y/l5KtLLGpkmI+ChoIz3PMm3+m+TZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chk5UkuLb7uHO3X7ffhHSFQBeG98D+aimVsZKG/Cc9I=;
 b=MunXR+TDKV2a5w8gYkx/VJEhCG5rDKZl2eVLhMKQ1dpjIkeQz8Ejo5YJ7PfstZsOXRddboIMTRB61ZVbohF6zb9AYPgFF6Rv6j/xR1foV+h//P03AkoTEgMP0YXkVVRHGcx8wAMuYTsnOxjuZiVpO46bIL+iGtWX0N+uRkX/F8ZbIutpJqu04CWvoiYnfUjiDo5v1fC1LNdT6m4yhIwe+tIummvpj8DP4ht2Tg7eJLyjV567w3gsVkJY8bbJHJj0JooRzmDArt8EFw64zyzHJPi07JMAe/cX1jVgnEcvxtBz2zfn7OQs6bv4veU1SLhY0c6iZID8cTgw9d544a7fqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN5P287MB4228.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Sat, 24 May
 2025 10:03:38 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f%7]) with mapi id 15.20.8769.022; Sat, 24 May 2025
 10:03:38 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: alexandre.torgue@foss.st.com,
	amelie.delaunay@foss.st.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Roan van Dijk <roan@protonic.nl>,
	David Jander <david@protonic.nl>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] add support of stm32mp157f-dk2 board
Date: Sat, 24 May 2025 15:33:12 +0530
Message-Id: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::7) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN5P287MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: 1320e735-6448-4bc3-1d24-08dd9aaa411c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oW/Xanvej/NlJMkSn1rtMCXJFXFISUp8qCtMWMaxS+1YLdnZ5e6nEsZC/u6m?=
 =?us-ascii?Q?LZKf/LyrJ+eu59r4ojHE0O6OhWFxuowZRasAPFJJSMnGWzVDgXs8z4bx//8F?=
 =?us-ascii?Q?jsZSEYirmQ3ypE4tU+q2ZXoyR09DDlLdgqpG7ITmlQgvnOkSLOHGWUvogx5R?=
 =?us-ascii?Q?336yj8XU19hwuzjcHOEvjel24+/o52etmvIcMLOI7O+iVx4NTMRg2Vd6fEK6?=
 =?us-ascii?Q?ZcZmLS2UAGcCxyj9wK3oGrx/KekB9e5PXQI7RktWicDRfQy+5G/AQ1Jb7Sao?=
 =?us-ascii?Q?5ysQKiCeiQ/G0AohYHSll+oxG22eqUdY7Tvnq+oiLX7zstrFcHydjdtNI8d3?=
 =?us-ascii?Q?BkcN1wU+SkLDrE7kap41RJXjNeaYLdJjOcse4BiAsuZinUaP+mj68KT2Y4aC?=
 =?us-ascii?Q?+bDzPStQUpKKVfQdlwQmEy2LEUQ+2qCQINdy5MXKBGCtywtkiIsZVkhz0CBk?=
 =?us-ascii?Q?b73gkySQOwRjTwB/DZbuWeJYAwoVeNv420B1XC1hCKUhrrev+F/e+72q3YzV?=
 =?us-ascii?Q?ENDtd1xHvt7J5QXsvTn1NFfzB22R9Sdg4o2cdqJnFVBuh0z3hp8kWzRNHGRc?=
 =?us-ascii?Q?sDqIFGt58QyBIfdIXjOI3YxQJC6tO9U66X7ioWuxyLgCVPUgdkhL27R8ypDn?=
 =?us-ascii?Q?W+zOdaL7JDlGF3yriaK/X5vPqQd9F9gaQ1WEHmWxXoMG+Szmmzgwnxluzd/X?=
 =?us-ascii?Q?d3a6D2ERuh1dW3PCuLSsw07jbCk4Em/tFmKh+oF91n+5Jff8D27Vjqd+dY65?=
 =?us-ascii?Q?Ns5RqxBBB0hvwppaXJMHoG48peR9QpwHRFbPMdOkS5y4DMOKV2y+17dv9zlS?=
 =?us-ascii?Q?0Ylmop6sTVHVTUalBIgL2GtPsQQJ1FJnPwgRUAQ/0RwN3Q7MWIck7zNEjI/v?=
 =?us-ascii?Q?ARbysQYNwXxabrlwhrqX54nvGgGU2LvFCF1bPSl6aHi0RO9ZmIey7CDFryiH?=
 =?us-ascii?Q?yVzfr35XHQWsR6mHgavPORLaELDumvfLz78QS/rLQkYtXYUq57nOKkTrIVwO?=
 =?us-ascii?Q?4lt95nRwGotjiWYv48pj8hrgXkaAHmEWBTfoIU3HpmonYWETmbCxdURK8gwf?=
 =?us-ascii?Q?wzrr+qkIkflqt6ERPUTcfSES53QcDXJH3h0vde5VJYmyrar8b21mkJVedMUj?=
 =?us-ascii?Q?YgPNIbgeuoSNDk8kMF0dZSi3s6XECh92VSGyQxxhUIe19eI0hDaMCeiksyvf?=
 =?us-ascii?Q?dW1pNc7QCBfPg9+lY/IDNkr3pgF46NfUihx7Qn+4ki1nGWFJ+v6rt8ryDfwk?=
 =?us-ascii?Q?qmTiU1Ro1f6Fy+Lypf5SuOWrAZTiVuF+uUz3lwYTJSpu8FRoWmzpM/7J+iZ+?=
 =?us-ascii?Q?rZzcEUGWHbeRpi9HPwzoDfKxzW8alX9eDdAjf98jkqV1bO+a9LDAEnZWQsrI?=
 =?us-ascii?Q?2IJB3HiVWXgAocIUw6sqSYsG9XjQ9/L6AMEoHV2qMn4AIc/zGGnfkQiLLRbZ?=
 =?us-ascii?Q?GRb8YTlftdmrvhFpm14NRcR608fbXEbDSFzgwqDMi3/P7HlwipepKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N8tBX3Yp9JnsdUvfUL5E44t2gCzpehl2Gasylx8uAg43Id1Q+YwnUdLBl/9r?=
 =?us-ascii?Q?JGEbVM2GaZKgAyms4/lpZEC9gOkawAsLxk6yMCwAwZEaL4WBDubrD/RTNgzF?=
 =?us-ascii?Q?ePXfHDqgG4mLNSIayT9ZT+W+df9zfZz/nUMjdQ0QlIW92r/xlMzEjtizA5fc?=
 =?us-ascii?Q?3+xoKuj2czg1Su9KvO3edHjrB4FFvi126U2C9qGuGsEFk6TZgdv4Wp5vBvt1?=
 =?us-ascii?Q?fa0BeywggtDXg6noR6EU8RfQT2mg7LUdkeyO/HQdexk3qMabqZCu2q/okLlY?=
 =?us-ascii?Q?n0bGzNAOOfTaCp4/7d5gK4hqYzlVLA1hxDaf7sPPwwNxT1Q1gB7bizMNWlAg?=
 =?us-ascii?Q?2wePvefIQ45uUqCxZdln9IeBqFujlhXNcsxHEL4UOwQlGQA4vdwpJOkWh3eL?=
 =?us-ascii?Q?dx99B1njhj1acQ+XnuuufAazKRJHH3SX2Kuh0GYI8IzFcuAtYBiWZJrCBBWe?=
 =?us-ascii?Q?oRsfjWWbE6gSNjRUlxaa5lMZtj5v1BvT4uaPigoAZ05RUkTLeYDy6kQbYmFo?=
 =?us-ascii?Q?2LSZrVoQ6zPR2y1HS0qErHqUk0fmeAxghgptMC8gZSjp+lCSE/rAB87PTGls?=
 =?us-ascii?Q?ea61UMH6qPQNc6PRE+PKgkkkTlp2mXOacL1AG6mK28geujvtKuEfI5k52tim?=
 =?us-ascii?Q?dnxYVHN2S75LV7/maEaPusNknCWr3ZifewRJCrfOQgtCZmFXsMuiWeK/oSs9?=
 =?us-ascii?Q?hCoPPDnKmjSRPgK3/LDTfXAYwXYwm43oceX2MeTJWyimm0vwN2Ha+vQXMty/?=
 =?us-ascii?Q?5tCOkO1wUK/AfCjWm2HLO5pLhCNEaxFvWWIb/mrzf73ub5RHWDXBN54M37zG?=
 =?us-ascii?Q?VMPj8a9wZtFNA+Pk2KV45pkw+jtvoM39ur+CzlnezY3QFkreZ7O31qyNKtc9?=
 =?us-ascii?Q?go6Bf9KrT0RYeelSIYSOAZR11xP1nyDZ1xSw60rRfQkOKkv6CeteGt1i80s5?=
 =?us-ascii?Q?UH+gCJdlHL1AmrLZceUD8TmdPZBOIycHYrWgivdnSsZfQeF2ePef+UjUVNyN?=
 =?us-ascii?Q?gTCOpxLOWzdodgaG4xkzhareAXFVjikimHi1mZ20IYkCuKCCOeDme/8IsKpL?=
 =?us-ascii?Q?j0Fmcsl90o50GwOuU44hJ6M/+UqVYDG654PGFgDcWwDfiL4l3Q33B4xS4rSB?=
 =?us-ascii?Q?7lUIsA1UkG0/zqlErCUkwUCMJ7nJDVLoFq1pZI7TVwSL1AUS1cB2SjEH1hen?=
 =?us-ascii?Q?8ppFoirj/XHhXRbdTAmt1bEEdb/2Q7HeMOkNDpbQ9LOxWAM/YjB+f/7ivFaa?=
 =?us-ascii?Q?uK+b1tTE/YXP29W4B24AUH06g+/1XjO6PdvXBW2uHxRW5IwjQ69rFZWl99z6?=
 =?us-ascii?Q?B8WhZEf1vQruZRr7/Rt23WgLOK3dYMbxE3rkPmrhrBk3zRnPp38kM5miV/hO?=
 =?us-ascii?Q?4O6yg0RaGj/zXE6f75athcajsKIHXfww0lzhvhQcOnmt+SeP/e59i57v95+T?=
 =?us-ascii?Q?w9LvyQC7mYLKkMYqgVQK/HUQy4+7nIaZNhRolreM7MmbA6qb63QwfdFAQ1aI?=
 =?us-ascii?Q?eCATDQwcEpgBah/wUsLHQanJfWgKD4v8d3Dut7R+oLDu9C6XeQDdZI5ZVNHb?=
 =?us-ascii?Q?81noWjJ87xVibnX9MMV+QWczQh/Nho14gEc215tG3TzyCO3Bc5hCos86GJIe?=
 =?us-ascii?Q?8nyUFrplzdI4oskX99yER5s=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 1320e735-6448-4bc3-1d24-08dd9aaa411c
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2025 10:03:38.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaqyH4y1VR7WOxvcdXoTF/4wNL5fQxAlP5ZWjPxkwkonOaNcK4yyrQS6PHkldDebGWTiBZhRvqdOTo0DcOqH4xGTohV3DlnMI1wOcRMOjRcYiMF+lCMzYMsaMggUNfHW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB4228


Himanshu Bhavani (2):
  ARM: dts: stm32: add support of stm32mp157f-dk2 board
  dt-bindings: arm: stm32: add STM32MP157F-DK2 board compatible

 .../devicetree/bindings/arm/stm32/stm32.yaml      |  1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts          | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32mp157f-dk2.dts

-- 
2.34.1


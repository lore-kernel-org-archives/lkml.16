Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E741FDA97;
	Wed, 28 May 2025 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422479; cv=fail; b=hxXHuGDOCD7Zvbt9z33E1W0cki9FUzmqGLX/22JryS7CfUmZSekbADrpm4VzgARI1cF++heBdnROqMtBT9vRsi+KueaYkN7JkIxVq91gLmQV4YYBPIWm7awQzlWSyn/ZBLzXVO4sRiLetHBP+NmybX8gMyj8rV4dZri4zjV2ASs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422479; c=relaxed/simple;
	bh=fZjlfyYxtYHYoFRxKlqaXC3hFlA5KNeJSt+SPxDAX4I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=W9SVobK5enuUQrhDjuR+6OP4IoXhPGs/ZFzJvrnkdSAeDa89ONExS23nuHJXaUGefJHb25h1aWEdIFlFyrBS9FLT+tcL1pGG0xRmc33n5mL25N+khXqFPDHi5DHW06j5hNWghZkDlWw+pf+Ap5ioaHwaWOYSCuLrF+PNu3NW2NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RiB73NK/; arc=fail smtp.client-ip=52.101.69.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RiB73NK/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neX9ANvrSIuXDT1uLGdiET4cBegQ8OPctCCcnqY8iCILuPxhqkGHo+tbyHBPtuZsn5sxIzMb+vkfkz4O0ph7g1jTJP+VKk8YOabHlBukpS1v4keB8AMqfw1MW/2VsAceZWesRfkW4qLIMrabp1B9RTcMOC0+RSEFN0/ywBrMa3vHgaG8ylfWULJL2iCQCxsBykEfGH/maLHWpkvD5SevYhM0GXiDkXrwQfCzch+XnuyZuVfp/h9OvS5JSCZCR3BKeCTWFu3O97AitB9crTmt+w4c2usw3pVjPXTM8kvnRdz53pJhZewG73DYz+/llnLVGCh0UMuUrQLH7oLbBcI4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nv35wmBFFWGjNnhY+W3jWEIqulBHmw2d55oRdcomZGI=;
 b=qHoTDuBR7TG9VAzo3MTQqH6yU+j2gEGLHPs20Hf46ka0Wf4uxDKZhTf/LTtAjjKPQzPDDxc1gFFJDOp0U14CgR8FWPc1AB1OL1D3bozJNZhKnZRYpA3bJhRbVKhSh0eH8MaY9hrybFOxxJdf2w4TiMWJBGOrEelurS2XA/FTuhoFUempjv4FBhgrZkQZkbRedMi6bfzMg51oM5v0uLMSG2OO+NfF0R+3XusMmBE/kQJOMEXbVkcKuQNL7FccDAGCjA6jZIT1wViMgFMrjSbHlDlLJea8a1YmUNPJJf3bBDlZNMWB1k9KWaR7Wv52VqkjwYg4CNAdSjT5HGCnBQVdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nv35wmBFFWGjNnhY+W3jWEIqulBHmw2d55oRdcomZGI=;
 b=RiB73NK/PojrvsT7RM91ao/201E1WFRZD2EGWSD5lY6J3HMx+zY2hNOPIFnBM4Isu4GL89bwi9U0r4ayClIKmelwMXFvUGtvKsF6JPZLca5F3jlPilxzvuxlUxrRoJecTN8UeIF7utdHC/MIYg0QN/mPWYjilHLO2bO55FQ51yAHAcYV3ozQDTi0itrdFyPvgG/SDQT3kHqmUyDGn/3DbqGvxuKqnWAIruQiCOi7ah5S+txPNK7eU3b0JitbPPBecEtDl5/QoeQFJ7Dh70GkwkEWYBgOSZR4f5NWoIO2Gqt4wrkwmkF0jcKhadztXl7XdOuWywa/Nf0Ne19qxcZmIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 08:54:34 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 08:54:34 +0000
From: Wei Fang <wei.fang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] update NETC node of i.MX95
Date: Wed, 28 May 2025 16:34:30 +0800
Message-Id: <20250528083433.3861625-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d72cc3-8d33-4b4f-6bf2-08dd9dc54499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+aNFjZyp/m3b01+CTjvt3zLIG9/t1aNH0kJ/33dJTkVoQEFHLTQuN66lmgAt?=
 =?us-ascii?Q?SZrXQj/DqyJvPmi/Xe6a8azJjYa2foK7zfRbvq/xwKr4yNt43gow6lsDdIkh?=
 =?us-ascii?Q?sgJfJ8fsgb8x8OeWjoYXIb+wCf4MH+eCNybyCJxhfnHDKyq6qIwNpM0Xa407?=
 =?us-ascii?Q?vI0FtwvltNfa6Ji0KUh/pBMhwJewAmAStabakfNuN4JQCbtPS7SrH3VTIoA8?=
 =?us-ascii?Q?Qu0z49+FYSBimAZS8q9jzCtzXqoGZSqeK4E+l6JAHyazQskgk5sOIKiVL7dT?=
 =?us-ascii?Q?xg2SsMvtJDPxE228UfI8Kpn2oW5QYQQzQjNS/hFtGqrDma3aEkZzHU987lIS?=
 =?us-ascii?Q?LHKUxRl1P9wOScNKBR02n4fJ4WTIcLPykYrZvPXYIU663tewBEilGPFhJOry?=
 =?us-ascii?Q?odhN3PIw7flBGvc02PcSy9yH+RtZZFSwRyyPTy2lDMAkD26arp9nno5IlG0q?=
 =?us-ascii?Q?nX3sphdXItYwKIOBqgburoTlEt6jeLqSwJKhtkCbccogHP2rHDS/CpjZXaU8?=
 =?us-ascii?Q?pW7No7IABqSZc7xBUIPcoEfjzKydlERpbFn7eeKQhHMhxYPyieor5y4jutRT?=
 =?us-ascii?Q?ujq1iNAPDOSJ8fDoub6K/1JHVgwZugtsvJI8kXcY8uPSHfo+aSZUT2WhOCSK?=
 =?us-ascii?Q?Lz9RTf2stYN/4ryN2ZYYlvqEc+fslSJNxMWVTe6YHh5Y2dqqG09+aDOKBz1G?=
 =?us-ascii?Q?zwLCb9rSMGkgv9eCu19iPFrFIjWASkNd4OmeH/Zv01yffF8+J5uN/mrFVZqU?=
 =?us-ascii?Q?2fOp+ZmWABkVFdNboJkJo7t184yi+T6TdBKoRM78fRL5YZ4EGyL4RY+l82Fm?=
 =?us-ascii?Q?TuHcVnuF+iGeBNj3oVvEMkU/fopsPFuG3WGHs8sbXOeHj2176Z0dcyEHKlq+?=
 =?us-ascii?Q?WTxEiSMdGYw2rfLfnUZZPzLJjAt92HJ1fFaLlgfxf0UMaL5rh1zLKUJbRmNn?=
 =?us-ascii?Q?S5t1PAo7ovr6lqxzr430evRZodCrW5xtMMNO2anDSgniAGzoCIlfyqef2gC8?=
 =?us-ascii?Q?yIakty+zI3iKK1LK6Rm61gUcFK+iWzO2H49KSAZy2PI9F0XKMyveH43jVnwk?=
 =?us-ascii?Q?62vTDNVkNow0mIODROandPrfX0rJfQiHBawMrBTxxQmEGdaDs9v0DPSLRsAp?=
 =?us-ascii?Q?W0HsMocXLrsE6x6ymjwRvbb6MfVLc2NofdrvDtSL59DnwHRMtka924M4TgfU?=
 =?us-ascii?Q?0Peka4ZSexw0rTxhjbMOVdtkChtd2gOOFUYDl4rGJIp0xKFH/t8/UqZ7GoT+?=
 =?us-ascii?Q?iDTIuaW2f7KVAlcrUl3spL6//KxBEZlFWWi7e+Qpux6Bfd6gAadJF0jqxl0P?=
 =?us-ascii?Q?uPmaT0RFTq+9B380PpV06NYgvtpGrJMwtwcrUiCsthoIqQinzAKMlB4nlw61?=
 =?us-ascii?Q?tEQmXVGPzHw2O7H33lTObMDTMncHozUGHkRPwr28YMQBwhASPiO5gHRGepnt?=
 =?us-ascii?Q?NehEf0siz4e8SD9dF9HJxktbRHJPuVLCsGciuBpSGHePkNKgdDKGgw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jcAKiH8+EpH2V2xb6g76cgwW1D3gW9dO1J7b8MJyOjhz+g2QSm/PF58juX37?=
 =?us-ascii?Q?8/Wd/2esXGAaKho5wRAOXx5G/Xdta5E4uUwiYTsW5JKxwMypbrFdvlDvFCVa?=
 =?us-ascii?Q?3j9mq9NKqqfKqqMuKE/pN2zKE5PDxeFfAYvdUSP26ZcOjA2jUMqc/husFPsL?=
 =?us-ascii?Q?HUiYfhdPz/kNdF1vAjqLt88sMvfQrFiYf2Rq7ueSqJC7769sJJxNaAHZ4V9Q?=
 =?us-ascii?Q?mp4ZP/U7YETjMzGafje1qegJO8cYcNy9Jt08LRhrey2ODza/PA8yVB53BFaO?=
 =?us-ascii?Q?h3a0lobzvy8k7mIPZ34HEEJVpo8J3juOz4b7GDDwCUQ6JHYpdQLxN8hse1eX?=
 =?us-ascii?Q?ZvkXKaNrEeSv4GVu+83UnmfQ7U8NnSmIGDEMafZ/ayJDpBWBV4NdheW1bJZ6?=
 =?us-ascii?Q?Ao7B+OIu6Ivj/WLv2NuMfl5bWq4rw5rYt7SVnmlHvVVkEzILYiCZqKeoVQQC?=
 =?us-ascii?Q?CyBkriX3MCyInuKCEByUz3Cl92/Xd28hyiW5G9VltACEaa9K/OJ0oUxy9bt3?=
 =?us-ascii?Q?7NkkmV0EzNeq48S5OTvjEhYIjrM7qOX0jo+exqSTWd/sBBQQ/KWkZO2UcYvX?=
 =?us-ascii?Q?cY+IGFOTB9KegbNuZt/QspSeOY3jBD5CnXRf3JX/Q141sEb5KNmyti/V5lbf?=
 =?us-ascii?Q?EfhbtAA3rfYH9oKEAb0KCDmjC0KVvImF5EEseE7dKxz/+aB8GzIcTJSUW9Iz?=
 =?us-ascii?Q?7Q9dV3Y8pgnYwOTSb2LX26hey905hENiZ45cIh+ONH9+iv46y8IQifd9PjVm?=
 =?us-ascii?Q?WjUt6Ez63nAfXVdiDs3Culfn8Ax2sKoj3liztD+7CbXavPR70um2X4LzLYNC?=
 =?us-ascii?Q?RqDqAgFtYi1RAx6WuepgF+DHUpYUNYTEnZj6F2/3V1mD4q1bZjB5DfZgf7PI?=
 =?us-ascii?Q?r57q/DEImgy5m0M55FuCn/PMNi2BBaShnYgyHw+lklrgOXCYEFshewDIjphp?=
 =?us-ascii?Q?jXd8Gf8OXWtSeZ9hl5JJ947txm7UDDynIPZ2Nh2+wJxcDjRRLVOl0nmjv6R4?=
 =?us-ascii?Q?KXoacuFbLqxPwpnClu0bpE2o0jk0mOYNeExKgGMqneS7wikAKXhMHMWbST00?=
 =?us-ascii?Q?tZPflqqjaq4PeFSmXQs/OdJJBrHouePF75aHeHzeUao/rR/sIdvrRu3HK+7V?=
 =?us-ascii?Q?G0/vMbw3PfBQ1wwzgsAiapMX0y/6S4ElP0RHTuPI3jmKnswTy+Te9AQXTsqu?=
 =?us-ascii?Q?AuUVoIOR7b8Wzrp2JlOHg7LqlLKJjz/VE6jQKsDRz1WywLipHCCMk6Io93Gq?=
 =?us-ascii?Q?bbi980UvvpBTcC7TURUB3CzJEWF7dlrD46mm7Q9GqvOwZxYjPbzw2zp6L9GZ?=
 =?us-ascii?Q?E5EIcxnAhaSiroIz2e7tWilWgT0YrkVIulETAot9p8R70Et7kfVesQNGon68?=
 =?us-ascii?Q?5z3kijkASiMcCrieOKZPsWt16jKj89oZ97AqdtRrqB/gLydZIYRnYkWfdaPW?=
 =?us-ascii?Q?NVD0l7S/IWQyZARn/4XbUqh+Y1gtHVZW5WbeWdjMbFxTdMj7VQ5wFVcCpq1l?=
 =?us-ascii?Q?jUs39cjZlU6BLjnbKLemGNDLVoMhVuR+hcYbdGhO3aAyzvnLFeFvLHGtZVSf?=
 =?us-ascii?Q?SgF3IKDh6VaKmKCydiQcydm6CFcMO48tuJxltLMW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d72cc3-8d33-4b4f-6bf2-08dd9dc54499
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 08:54:34.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOEED21ghTkeVqDqH1/3AX86dkOB8P4oG3GkLwSOQ/Dyo7Lkk5kgErrUFh3fe9Qsl86U+idCbFZRlz/a8wmHhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948

We found that NETC has an overshoot issue, so the drive strength of the
related pins needs to be reduced. The first two patches are used to fix
this issue. The third patch adds SMMU support for NETC.

Wei Fang (3):
  arm64: dts: imx95-19x19-evk: fix the overshoot issue of NETC
  arm64: dts: imx95-15x15-evk: fix the overshoot issue of NETC
  arm64: dts: imx95: add SMMU support for NETC

 .../boot/dts/freescale/imx95-15x15-evk.dts    | 28 ++++++++++++-------
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 12 ++++----
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  8 ++++++
 3 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.34.1


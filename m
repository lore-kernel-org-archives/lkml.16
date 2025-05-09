Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023077.outbound.protection.outlook.com [40.107.44.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B66268C69;
	Fri,  9 May 2025 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774747; cv=fail; b=oC9iPrOjFFXOB6r5CLWrfLC49CZGAaJSP1o1PmVEv+0pPNQCxnY8GNXO8pZEoYvodNdvchqlY1w47rzXwRQB003pw5miysOC1NbHdLbIwT8wE1K5JOOpxldd+vyZZ1RZ5gHHfb/gHtRuvGhBfbG7HR+yp+/qQ86Epd+U7+I/0mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774747; c=relaxed/simple;
	bh=7yctmgDPe4H1Z3cCwi6G/R69+7A0sy7I2gYDP5vl1I4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mVUUYoLbsEGKSKufBScmYOSe3xKRvwP2PJZRBtfzElm2GMzlflNp8/iF3xXYAi57dAxPntvkObNYKltWmDBuPocQOIiFKQMmoMOvUX6Nwtn+7/nQ9Kz0drqoxPBNG8KwtXZkh8ELYF7+qJdxszZtmptFkxwZB+eqhRDK5YTlCtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=technexion.com; spf=pass smtp.mailfrom=technexion.com; dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b=Kh79BIZ9; arc=fail smtp.client-ip=40.107.44.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=technexion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=technexion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b="Kh79BIZ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIzfYWF9tuw688yVLtaoEeRFqfUjki42NNrwFKoWaK8hDMcs7gVQJnWG1qlFmdhA33EJFBNcmDV4SeXLMDE/Cl5gWOiulToFY6bO+JVSnv6HcBmfsaayvo1OFk7wfHkNsjsH68R4Jx5do0NLl2rqRzlsEYGUUwBLrrIHzT4KkILABEWrxTlnmGIc4GBPsmMrbjK7ixloLZ1no9F9Mnl7Vo5SYDndH+dJQJ22VBiMeqMSdKUIjpuWLL9YcMgYow2pR3yEw+brdsjdYvQszNVQS8kFLWZEAqanmJ9Lu9fWVtshjg+eA/cC62gWRjc6s3Pd/sprV+dCiWcYFjHm7n2Q5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcCQ7YvTG0elOYlxiaKKpeXQAVsL4gKkG5MsomDvJnQ=;
 b=mtpLI9B8tuaRUNfefGFhIPnb5udP9PWwG55oa7xbo8qDL1L3Pnl4Lo9gvESy0rAYZLQ3gaJG5c1ImToxU3Tyk868fiNxxhKR0a/kY7R8nqnnopO6PcX97oH8tm/9i1S9MMy9/x+G4KTfYsVoqrfErVtxZOREzsHnjMe1YLup5PxlV5aZ1xI3R2fY9TWn0lOtf5Zho0VCuA0SSVU+maXfY1JaPXh5Pk/VW7j73McWzJfaU5qpBRDgsoD222wJrVf/Dg5vAoZDDCaS0qhpzpvVFnGBpTtP6PiFOpTjksKE7PEHKEseFBY6X8ScOJZJQd+AV/SJrSfI6X6NZ/IPmAgirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=technexion.com; dmarc=pass action=none
 header.from=technexion.com; dkim=pass header.d=technexion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technexion.onmicrosoft.com; s=selector2-technexion-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcCQ7YvTG0elOYlxiaKKpeXQAVsL4gKkG5MsomDvJnQ=;
 b=Kh79BIZ9tezpczmrnS6sXBc7RdwMSK0zJpgbfkLaZcT080ccHqHCPy8D6axiaz6uNN8+0kAPAyEPyoCJrwTh8gad0Jnuf3rUqX9LJ3PxZn0xpHhy6LSqtc/2mDHz6QWYs0JGBlO/2kqm1RctqTsVWoZQ+YYpdkc6mW/RgBRwbyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=technexion.com;
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
 by TYSPR03MB8719.apcprd03.prod.outlook.com (2603:1096:405:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 07:12:18 +0000
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404]) by KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 07:12:18 +0000
From: Richard Hu <richard.hu@technexion.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	marex@denx.de,
	Frank.Li@nxp.com,
	mwalle@kernel.org,
	frieder.schrempf@kontron.de,
	hs@denx.de,
	francesco.dolcini@toradex.com,
	Max.Merchel@ew.tq-group.com,
	tharvey@gateworks.com,
	alexander.stein@ew.tq-group.com,
	ray.chang@technexion.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Richard Hu <richard.hu@technexion.com>
Subject: [PATCH 0/2] Add TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board support
Date: Fri,  9 May 2025 15:11:59 +0800
Message-ID: <20250509071159.12068-1-richard.hu@technexion.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To KL1PR03MB7454.apcprd03.prod.outlook.com
 (2603:1096:820:ed::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7454:EE_|TYSPR03MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5f35b7-07f5-47ab-5c94-08dd8ec8d562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IJlddLAq0fssOl5xZlheyMgN0LNcHzK7POvG4nfst74KHgbuShjTDPVJsSfL?=
 =?us-ascii?Q?912MSEH9rBoeYNLBSdsixUVxniTSltnmnMGlq7ewvShCyk+eosg9jHghZKqR?=
 =?us-ascii?Q?3FZJMTf8hm0TXrJEKZTFMF6WGPkEEkajaDzWaBKDiowM+O/oDmoPy20j2gaW?=
 =?us-ascii?Q?KfUp5wjkhQKj33zml6bFjG4B+kNWuo5EaWIb3t/OTD5RN4zJUTWqhumbM8rz?=
 =?us-ascii?Q?xxCGpQPSlhMW3wsp2h9Plt7FrNUjnz1ETFQVhfuiOqUSGDAfhh53l7+ahsJ5?=
 =?us-ascii?Q?JU1XelGbo5WVzO0qzagBJ2yjV6ki4ahJ0OWRxsRIe9/BcZqYKkvR64/0VMPK?=
 =?us-ascii?Q?TaimSAryaBt2XoT0Oj/MTmg2mLZ/EdcGRrjsvT8ElIWMSxGAGbPhY4K6o0cl?=
 =?us-ascii?Q?fasZuaabHZXgHykCb8YJEfQihR9I3GDyoa3hs43gFYj2fhr/DwJzbkzzN5Vq?=
 =?us-ascii?Q?9bn6fpneyMRTRyJ6eJOwSs1x1S+IZmdMH3cR1o5RnsaeBaVaK/RWMTZIw3JE?=
 =?us-ascii?Q?JWiigmsDDoDZZvztxP0y0NgcnOBiaJ0tMttZy8tPGu/Q78xMXbw6wpdy8OBc?=
 =?us-ascii?Q?ST8bdYzLNgNa7NAhWmvq5sMwW5L0Ce1v5rWiB9EcRC/aqI6L+KNbLoln1+Ot?=
 =?us-ascii?Q?XcKnLCKYLd8M7UuhJUwUe3N6mytrPLT5aahdLZjSPMC3FzlC8ubr+ikMAK2a?=
 =?us-ascii?Q?m0tRrDwUBRCRf5yZr/MyDLIQKSMpzsLczExYUv6PDph53V1G6Fr4Lwlakbfe?=
 =?us-ascii?Q?jNUaaoZNKW9suiP+oGe2O3UEXyRn6J6/rtoeKI9ADUd6Z3QCL4X0J9hzSNqg?=
 =?us-ascii?Q?KaQKLIMoY0dHX3yWZhawJ3v1t704038HaPjNhSYjJmti/qbvKQ4skH72GMfY?=
 =?us-ascii?Q?6p3Sfz4yHLYDa7NLfDds+PZzIDynOYE9Tyzp1XA1I7iCsviM7ysV8o4T5FjQ?=
 =?us-ascii?Q?OB7pFGNSecaV6ds9X6u4PtMPy39OVMYauKkQkFVVWHIGbrxxEOSaLxr40nMc?=
 =?us-ascii?Q?uvafbqdz3lJGqpEVYmSyXKBF32SR22CjLM6UHR5VEhQcjwHoJzMiGb0M26Wr?=
 =?us-ascii?Q?arJ5nBTaRwhMR2xpYPgW30frTR/YGvsLKqeLPS1JrXc0I3M2j/puHjQA3X/h?=
 =?us-ascii?Q?qlBV59jaBdss0cUmZ/u4kX5hxEEU8Wyhvz8J78/+S98SNoMsL3x0ovTbT2pm?=
 =?us-ascii?Q?r0ibbpDiu5DCT0DdQxdgeKOS13Py/1+i6G1Ct0knsa/jGHYgxrw2gDxJdcDi?=
 =?us-ascii?Q?AWBk9Mngq1F5wGHZgqo6Xv/7SmIqMK+XG9MR/Gbb1SANRDXWSviUJo+2ycdS?=
 =?us-ascii?Q?CGMjFY0V25GOFGclOd0gT2qtCuYBF1eGnyst146N1wEpCN+uw4BM61UYy1iw?=
 =?us-ascii?Q?+Ms4AaPUY8TZRFpZ1iPQtU/3u8VPWv+NJXY9uy5GNssAQVe+iXyq4l2e+aMX?=
 =?us-ascii?Q?Bh7wtr3H3oRczU7NwH2sMWlmePR0M+k/5cfDuOTheuvV7mGayTub6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7454.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IB0yegq8+RV1xp1+SHYE8GHGQvKVfW33e4ORWXrFe+mhPfsYtcaz0DJtfMDD?=
 =?us-ascii?Q?qgcRw1pUgaxtDuAtL6OGnx6Rze0gS8AbR7JcBRwvLHhxKME/p3cCraVR1ay6?=
 =?us-ascii?Q?k+CtbL9Squ43bYGqfrgpg9KNsoZBga0d8b9O93oyYUgqnW6Iu0XszaTLPnPl?=
 =?us-ascii?Q?0WJjQg1XM95ALS8w+9Pa4KQXFZ6MwchFJYE6hUqft2fYqQ9KAqT39XjtNbx9?=
 =?us-ascii?Q?jOfqE/0DPVXN0i2J/txjbPISK9yuPsGty8kO9U1lzwCWvVPG5t9qP7dZn6m+?=
 =?us-ascii?Q?QhCqdTh1qx5RgNy48zTBIzPwD73jQmFqEnTkBH9XEVbdXFL4G21UZSti+jPb?=
 =?us-ascii?Q?NU3SyO6P3fONcKVaYgGXwLohL6P2bRBhvw//wWw4stBF8KvmFA9uL6Za3wjx?=
 =?us-ascii?Q?1B+savcwSvb/8oej8zD1Mc3aNw0A4kTZN4AhMe2tQ6Ji+W6ruZlF3RxGwoyO?=
 =?us-ascii?Q?QmSQ6BWJcRtl8eo2pgFPsDzk2ppl1/+pputNtygMaw1ZeZXIbX9dQlbYyjBw?=
 =?us-ascii?Q?QahpGftqowb/WZsN97fySNuN8rKyIQeEco8tXJEj0psyMLXDLY/nz8vRQwnK?=
 =?us-ascii?Q?VuyCuItoltFYOksKbRewih27ez4/IsG0+WJ9s0KLdjhgoCq4z41Nrc51Bm+G?=
 =?us-ascii?Q?uqytL//gMK2158V49gi8m8HHsIE1wULCgWScDQ6EaOSdzg6Y4/gOKnnWyrwC?=
 =?us-ascii?Q?f2Xw88qULyGoi+cYPzlLSaGzotKQE4gRNzh9/KuhBc4Um1pXk6N20MDloJVL?=
 =?us-ascii?Q?u5qNZVDNWmouYaEeYUzSTzBsgrXt5m4ivGCxWxO2+l5RySCnL8RPuSmwVwBR?=
 =?us-ascii?Q?Lum1OjpOjGX7uZZsH/14JqG+e1E9uRmc4ddDfl4EF0QEC1aJHXuQf/2YN4Jw?=
 =?us-ascii?Q?D/MtarQeYYYUbZoOMgOhBc+ZD3hwubiboyDaj3e6bhLDYX6IU34nr83Oy1wO?=
 =?us-ascii?Q?I9Z16xWEPYBEh6ruJtgvzy3WMd1iu1m8n8Cre/rwJ0ObHon99B0sL2Z6q3Cj?=
 =?us-ascii?Q?Z4iKB3ItYMLX6xsEEFWYLfRaIFzQ6yagERei6DI1aStElwKvTi8MKs6FVWzn?=
 =?us-ascii?Q?EhfGdr3w8Wg8I2MKy5SyTpaW1xTRxHPVzfc7LRRnLpLVD2rejEaf19GkrDQJ?=
 =?us-ascii?Q?7K5mRIrL2NzrxezBcg7hDffDvpbYQ2JusOsAzeZdQBKZ1jmkglFlTk/M81go?=
 =?us-ascii?Q?wyKiZOBqO/Liy56yLYBaWl66O4KSljA45zh5OIrCK2R5+d87gKswZ5J/MxF/?=
 =?us-ascii?Q?OxTSKLCZpB/xHUJP/AMfOKEXUuRC6iQd2Omdi2LEGGaO28Z3My8ghMzk8GjB?=
 =?us-ascii?Q?C+5yE5Z/s58683W3uQTGeLH1DEUjoovL+xueQdpzna6lsOs8QM6hinBa0Xl4?=
 =?us-ascii?Q?RvW+4b/DE/bkIggqVqptEnsRSMFfoblSqDfdNhrERkrPZnML8oxoRwSh1ATx?=
 =?us-ascii?Q?oLLJT3JBcJSVPH+K0NpmJbSd8m5fvxosqZ69r/uik3S1L1KNdEoV6U/81+k8?=
 =?us-ascii?Q?RKtwnh6HsnEk2JlKVmzFQFPIwl+mWMv6KB+7J3OpYt6GsdpSpQkrs+Duzjv0?=
 =?us-ascii?Q?3gaeUv30gqEB/V5EwmxOiGoO3l0klW4unuzUZatf/d3Mn7vaW2LsURyUQnzO?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: technexion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5f35b7-07f5-47ab-5c94-08dd8ec8d562
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7454.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:12:18.3781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5ee19679-b9a6-4497-8ed2-1eda849e753b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZjBj6z3Btc+K2WYFECLVlaVIQSLUCmTLuW2HFns/EX5EW9p4cK5dlRZj8WHJ6GgivZ0n746131tabClhMRKOnjB5snvlJuEETgF68ZVCMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8719

Add initial support for the TechNexion EDM-G-IMX8M-PLUS SOM and the WB-EDM-G carrier board.

Ray Chang (1):
  dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier
    board

Richard Hu (1):
  arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS SoM on WB-EDM-G
    carrier board

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mp-edm-g-wb.dts    | 404 +++++++++
 .../boot/dts/freescale/imx8mp-edm-g.dtsi      | 791 ++++++++++++++++++
 4 files changed, 1203 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi

-- 
2.43.0


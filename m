Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515E21CA04;
	Mon,  9 Jun 2025 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487989; cv=fail; b=Phtp02te3t+erNXWqMyg5Dzt1oFC9uLxRBZyrCZb/SA8P0Puf0XHI6ZThk3scibGri0WysOmsBrECBkplECC0rHa1N5y38axI1rFKF4P3794fsO4md3dq0S6HbC4IGJMBGdrMeIdVBbXw0hFVjOiRXU4d+/EuHuhYuekcZMJZR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487989; c=relaxed/simple;
	bh=k29RuYWhB5LyHATyhAam19DT9h8plAiglqiI5H9AmYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AuieV5OGUSoqdaqCb/oy91UM00709n5dthIAv8+Vt8yJonflTjjNcOw9y2cB9WzUm8/RL2eCo+px238UwJnT+/2Dgnum5FBSrQXFiLIGmzNrLL6x7FmwCjWkgZY6/1QpwZCVRHhWykDRgc6xlIwIa2ukiNkATFp23JW8NeNv8kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OH3t7ZjN; arc=fail smtp.client-ip=40.107.130.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OH3t7ZjN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqflfpfz/L82ZWJ+q9ocEAdMNA7DWxEiItM66RqSIqfy2hIWFpltOM6hga//3n536dbeEHE22kl2xJXKlqXrE5VBrjAp7Mxg8RQ3wBZIUXYwm60wyhn/tFdfY1eZxz6anUtbPSxOzrjQJjQGGVHZ5BYH3kkQQuALXvUsE2RcH6/1ZCHxAjApC7py6HGyA0xhibYUlj+yu1Ixc2In1mJ6RE60uek/GESSEyeqlgwgRIVi8BIxwqhcGGTPm0N37+mX49N7oOR1i/vuVJLYHSXA1lFbde8mFYXdXneZYpHhlIuJdrXSaf2WEz4X0JnfK5orMRnOtxJMHAdL4y+NregjAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgCBgIsTVm0flHskTQ3SNkSECVKX92SoDyCVrV9YsUY=;
 b=J9HwRHKLyarU6MZRcvInpciMtSMqHt0KS6H9cdY9pXVTeViz8DXduxGHYIkFal0B27qrMHb06TVMqHpaRcGoNBh3+xLTiNr1FYJR1nzFA9CGczX3TIxKOO6qFoYUHD7QVhtZ2xsrb55PURo+x8VCqjp5k2tiPpwu7XIU8P8fa7rkgg3dCH3Dq3j8VYek8pltYRhwghxXnLqlZ4lk44ZDu6kp69kqkGNGPFlpFIEBlUT9W6O2H2b3Kr4lcyXFyuvHH2otkhE5o8VFiQLU3vcoNgmwGLs1Y4BuTbjqpWiXG7oEWmhl+aPTMk4mETg2ADt+sLzt86zh2Uq3yFVOnRbuMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgCBgIsTVm0flHskTQ3SNkSECVKX92SoDyCVrV9YsUY=;
 b=OH3t7ZjNavEI571dH7PcTc7/ZYVWLv8A17YtDQKx//m+Km88YRkaj9gex0FOD4Mu20DtWhXDTKlyU0/Tle0cQOIcDC/sfwWoU/KxKhtpE2ZUaulyvMLHRrXB/JzLVNCsKUd4vcLgeYK/4++47HOSi1nmWxbcKKOn62MWu+ym5SGsR5+20JZkr7q3hMyduhIQ92vfSTMgXW8g08WyqrZyEfTapvz1tsvEkZYM1yPoTKvJOkKIBX9ZzEMOq4+Nn40hw3eOEEi3H3n6igFAYOWZmJ3Hf3zlXe5JeV6uquff7Xf0qn22U+Bd5VgA+bE8AOor6njqG6GDbmKNDKULeYNzpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 16:53:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:53:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 4/6] arm64: dts: imx93-11x11-evk: disable all realtek ethernet phy CLKOUT
Date: Mon,  9 Jun 2025 12:52:35 -0400
Message-Id: <20250609165237.1617560-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609165237.1617560-1-Frank.Li@nxp.com>
References: <20250609165237.1617560-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb23774-f542-435b-207f-08dda7761a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WyPTrp29vT0Pm4QNBtDG46xerTlnEZpT1hyNN6TuJ0u3K15hfLvsmHqAbvsu?=
 =?us-ascii?Q?RsOh3JBP8211YjK/gkWOHtQK4BYPRZvS0TTBheyTQTvF+Uj2mOX3OdcLdUbk?=
 =?us-ascii?Q?H89deS52kYF8DNKDdo2Q+dB1pNj6NRXSkxkilXM2Le8mrPsv8XdByZN3W/4a?=
 =?us-ascii?Q?zlXNcSpSIah+HMQvq+ItX5u5QpV9sJ1XuATrROwFqpW5KjTyaz+NFS9JEaqm?=
 =?us-ascii?Q?aeCO8Xxh4JFVmcQw8OXfiIHrw+HIBXIKk+ltSjdb9P5iSh3z1UBRoF4PEAfc?=
 =?us-ascii?Q?VeuYm3Hx9FYCR659r/6rYekLauQKQBqbm0VmERr4GMfR6AQVo7CGlmeL296I?=
 =?us-ascii?Q?p7oQg2UY6RaiwXXfqPmlpFQXmcNlII17ilMqJ0bheSwQmp1zJhn3yJCyX2nX?=
 =?us-ascii?Q?YsMH5Dyomp9pQimUeaTrdfgnfZrmkwa6R7OtNt+31Ft5KzipR8gKYZtq15iX?=
 =?us-ascii?Q?cnoRZ1RYauHumjXQCGx8rq/NQcCkfgrXZK5eZWkP8HLjPwrQnH9gPWPGf9eK?=
 =?us-ascii?Q?1JYCNDKnkzJJkwXU5nHQp1VQPwjegxptkkBqXzv7wq+ank9L4dr5aIkkeQdk?=
 =?us-ascii?Q?MkVrY+ypxRmAl+7/jlPsMRCFu9TjZreuYw/sIHXwQnsEdXdejh2/spdDtLKl?=
 =?us-ascii?Q?vDSDcdY3kzlIOxrdet8pSEaPRguMXhIMY9vVQb1X0hjAHTOxJMuDAWS64CnO?=
 =?us-ascii?Q?w+pgy+LSj2c2unYmqFix1BlDRoyPDhRQV9ABWR/EFGvaIeYXa3IDuRq5P66Y?=
 =?us-ascii?Q?A0JSPKo2aMEooLHtT1mJV2c1sT/A9UaFSUsSvOx42AYHFDON5S88yXq44L0P?=
 =?us-ascii?Q?RaajY3sevIHfjBcuhrk6U8hanXmTPHm8MY3pZhyMV3GIjNYp9uaGCqbuqr5N?=
 =?us-ascii?Q?g3n0dicTfjmv5GpkFyrZncDb0YteIuGXDG64qks2pZNQGw74U2Uar1l3LvId?=
 =?us-ascii?Q?d9F2VVIzc+8kLlfH/BMUGdNyi5cusnVpIHOiLPHb6v2/hxIiMTLRlsYEEpGq?=
 =?us-ascii?Q?4WQW0cAqUSY7Tw5/h/La9cb5JU1/zH1RGFygYk0qTa6gagMYWnNRV9zHRXTU?=
 =?us-ascii?Q?GIYo3dks2HqvcBJ/xxkrcjhq3F5lsq7mVQ/H3CRrB1vbs6k+hVnntYoaDred?=
 =?us-ascii?Q?R2nQR78uAnKyxyGeA2XnuUYSRySjOiu7BwY4OqyHTuuN4/XgOcufDWltKrDt?=
 =?us-ascii?Q?rSGLkMW53GfHPvaRmKJJfq2tLvbgorzhrvaXoVrouKkEMy/fMx5gmcBWMw9n?=
 =?us-ascii?Q?M8sm7fdl3Adb3dJ7O7Ie/dMErlDf/q9ZzqayjXUfmlpN+ayyQKHTRT/yaN6u?=
 =?us-ascii?Q?ZXE2DQe8aHrsO+p3RlDs+yX4UWCzzeaTXECuQtEz1sQUB/5x/rKqCky7r1eF?=
 =?us-ascii?Q?plQFS0mfqGJidNw7MS7LqiPX2fW/kL8YHcpi5pKAWgN38EiC+lBOoiR12Cpf?=
 =?us-ascii?Q?qvZD+vYPMbTIvtsFO/nugQ9eW27DCPWZKcBnXla6sGytabIQLF+9aCH+qbtg?=
 =?us-ascii?Q?ebhSIq2KdNiYFr0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lbQLGYdFdaJ/zgE7LT48eqALoOqxr/Jmfrb8SdN1aFfk3g3t2aV7WwgpzGd7?=
 =?us-ascii?Q?lsAtQ39elkV6UZkBYFmPTDcHxpHRtv1yqwrnP3qib/0dF0WkWDN/wTJVU7ze?=
 =?us-ascii?Q?fFWhnJaadQplaW0YP/KyTddd3IZY7rUTgxZ0N53fxRTKys78Tz/ZCbIjDAct?=
 =?us-ascii?Q?y3a6a+JIOVyRdggWxHdGJ1S3fFTaaI1t2b6njrsT5Nv8IpFwdhwdC83mbGi4?=
 =?us-ascii?Q?Sp3dJVlv6IbNcDlUsiVrMBu7OHm9vb4T2GZd6o/SoujIJGm3+rQGnG9ownxj?=
 =?us-ascii?Q?wGSnE5lF5h/Fjq34n3MKuJ1Svf534vrJR7b5OR02pM3+vqe0L86dswgciYzg?=
 =?us-ascii?Q?kMzCW7uOOaxJVXBcSizxDpgWNAGZrUqODxf89uQa1vd4OIec/pXmDc7o6RXQ?=
 =?us-ascii?Q?8UIuHlxjW19Rz41vX/+LhqiEbkskVKKEaK/5iXrCbRQb8vLFn2kpcLqt/quP?=
 =?us-ascii?Q?YN5wo+KzAWAFmMds2/hYc5eHY+6Xt6npw2L10boFKZD8nwNykbCUyOrlyMVO?=
 =?us-ascii?Q?bVzGMdXK992/UHdsVaT9k+yhLUYoPe+sFlNLo9/rRYc5GzQ6Lhu9jP/np4+m?=
 =?us-ascii?Q?O1SOwKjMR9MJ0nAaM7fxdQ//QszTmEQ2RxD7rfCCRFh+Qnpd/8aulgFClLOx?=
 =?us-ascii?Q?jeSf9Hw/qJWmHtrS3Ulk23u/M0c/zehvwRMlXvrBhxjbPbkCRK0wzPvBIdVP?=
 =?us-ascii?Q?aFOu+V5CIQTs4zMYR1QUPwU3mh4I7Y+WjalcqarOMCLPBKeyGGWCNS52ZAhd?=
 =?us-ascii?Q?1xOzoRhTNUP1FSq+abE00oCOTar7LZPw1hHtfI5lKWCG08f07Tvtkvysdc4a?=
 =?us-ascii?Q?GNtugvVuuofWM7e43SQZhJVMuTTu9lZkFWMHnhS5Fr+AR01IiAngm5lLluPe?=
 =?us-ascii?Q?8akIM0URofDX/lQT1vHgzLKB+lbhOl9ldL7eFDatMFfuIcVVkvFIIqV7oEs8?=
 =?us-ascii?Q?qZhQ+m4CTIZjqTrQm3lfit0HPkliOrpWJJshvZqpYceHVGYxfpAdm0vG1wYH?=
 =?us-ascii?Q?FSHQUoyDMU0xXRX8ZoSk1W8/qcfpvI7HFDIi1q0He0ZBK6jHtbE1vdzktq89?=
 =?us-ascii?Q?c3CbgwsfPVESG3l4syOP/ctIXq7LrHhsfUXjc3TB4LcuqR5ti5liyxSE9ZiF?=
 =?us-ascii?Q?1cU0iaWCvekraJln3Be69VmT9Jx9M6wj5MGuJUZT9AqGkwTp+wJ9tJzVZYgT?=
 =?us-ascii?Q?DTU8TChiOq3UAYtC9XkyNraopj79CSif/JsySgiT1FfHodChnVJWfugjpJjv?=
 =?us-ascii?Q?cYP2VaWcyCOoO7dpPSP1tBDq6V9brAdBZJ4ys4mOXTcwuqX3S4wpLRK422pw?=
 =?us-ascii?Q?oEFKYAHIT/DCL1afCPBdkhgY3kAz7QwyImrAintTeejhuPVmXavF+d9hQjxA?=
 =?us-ascii?Q?kNmu8xkRcj28BsHwgxnIP/BJIQbbOpOGPPFm0fgodXEEQpWBt8lv1FEQa5l1?=
 =?us-ascii?Q?0nLT3U9BEd6eh5aixWL6wpyguphDvcSLKIGBGOWNschtI6k4AAtP1cnoJ5JO?=
 =?us-ascii?Q?Ywx3rbwq+As61WrVs2InZJg9oynhKKmww15YPbvMlEf9FB2eTuBdpawu7Bgy?=
 =?us-ascii?Q?0Acq3mAONDaNvRGD6ACywA231ASc/GVmfP3sRfzG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb23774-f542-435b-207f-08dda7761a9e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:53:05.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDonHRBPqq9+/r9fClws3teKI50nP/zx9TBE/h5L/8O4C/HYfK17cXOpIrUoxL4sJzBbrUegAQav8rnvc5a3pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

From: Clark Wang <xiaoning.wang@nxp.com>

The realtek phy CLKOUT signal is not used. Disable it to save power.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add peng fan review tag
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 295eb8d90f03f..8688fcb382c06 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -251,6 +251,7 @@ ethphy1: ethernet-phy@1 {
 			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
+			realtek,clkout-disable;
 		};
 	};
 };
@@ -275,6 +276,7 @@ ethphy2: ethernet-phy@2 {
 			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
+			realtek,clkout-disable;
 		};
 	};
 };
-- 
2.34.1


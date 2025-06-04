Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFCE290BD2;
	Wed,  4 Jun 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046770; cv=fail; b=l3dlu52RVSc6rOZjr8BMTH1t7MlyQZkCTrudjyJLahDlRhEmByla73Qv4IdjHwvczPox7q4sMJj/a8QecT4NPvY0SliEbTtu3+icmiefYSKC0Eial3CpVmGTk5bO/tu+8uh77sOcU9aCxvR3aQgLNWymge9FsQQgTH/1OWpSCho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046770; c=relaxed/simple;
	bh=7fK4BsaEXqhZFIdUEG1yNjhgJw+n9MfelF0N/QYZJZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tmHeG4y4XtX/1+LSUX84ewAzF5x2ibDPZNp5F5E2YXlHqOszP0l+igAjDorGinoP9U6zfUeExzXR3u98R5hcwKNIVCPoe3js6mLsF00BTQTD0Fri1TeC8bolHKnZvGMkv43jY6/EKybjGV7j6mx+sSc8RfQrVpz7CiMxYcJUb/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W/TiDbDv; arc=fail smtp.client-ip=40.107.20.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W/TiDbDv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5SdONDAlGOqV5FCykblbUkVVs1EqaXrAGgSZKhRU1V2jGiyQTbodyXYBPYheWmdWVIBKYODn//kKgJW/MhHGMKyO8MG5fv8NH4+HYYltDvl6VXlLB+15bzo4m66VctmM1Y+aHTxZHAkGLUuo5E1qmQGDG84m3+UxQqcxSX5t0RzZHwWJkFOSzp+4RvujZY9rAqQuRHTv2q+j81CB5tFlvG1cG52oAfVjI5fU1Y8kvDLVjVCx+ZaPXkeuiBqzzOP07g6pUcRdoJxIIi4y9JLx5mxMgcdAH0NyhDazLSnwyaGOrEEFuMw2h8AVsouHIo1zn0YumVld9t9JLrvq8UoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fK4BsaEXqhZFIdUEG1yNjhgJw+n9MfelF0N/QYZJZo=;
 b=BD6iCTQF3hrrX1GyriRzK1gTnB94ByCkPQB/MFgNTQjQZCsPLs7cA/DezfB4xNiEAbrtVjLSzJq5Og/WdiflFPNDY7i0hAweMZk0nSPy80vkVjh4Prxw8gW/qnl/Aeo6M/CWsB0o2kext5dtKB4yNH9hFsVQf9h+rMUyS8IcWZywPu/MU2syrukBjLyXDYn+yql5kU3iqLJP7gT4Hbgk/dM5dnujEfQrkLev0wdWLqHJ4m/yMie+s4v971tptf2eKJPqjq0SRJHliVMVIgdY80iCOWAHcDF0kCvUiRpVfVT24jwMd6Zb3teiTMxw/mJceChp8H4M9IuBg2zBQcpRrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fK4BsaEXqhZFIdUEG1yNjhgJw+n9MfelF0N/QYZJZo=;
 b=W/TiDbDvQvJ4yYm+mLXoklUwbtQwZ2SxeTGU+M36RWa6wndlbMhto0wGdmj8X6lWxRHRSsE1Aq2YfuGlacm7TV0DInq1o/Jb4KlyFOWLYSSPJHogb7czkK8bjKZDiEv/isfnwd5RZv5DvwlVRePWui/5d1VPeDTjTWzPEEnBW5k7IKkCzabV7jjOZxunZAHb26fNBlcvfYSr6ChrW/etYKgBCnFhGA/FBNo2OF4DCwHDoBv8HEB2ZY1POn0SNVxExde/AxGTzCVEjx07sUmh/Q1cmJnNS060llNY/3Utxp/1xtuttGJhTTOIdNNZWyi5Owb4Xaou6m7LAYBLLwB89w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10619.eurprd04.prod.outlook.com (2603:10a6:800:26d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 14:19:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 14:19:25 +0000
Date: Wed, 4 Jun 2025 23:29:19 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Mathieu Othacehe <othacehe@gnu.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
Message-ID: <20250604152919.GA29462@nxa18884-linux>
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10619:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e990749-dff3-4656-6bc8-08dda372cefd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SsppRPXvuY9+gXWURC3BJU7v9arWiEgP1fOZBkN7AGY04lWXQmifQCzM3DTb?=
 =?us-ascii?Q?al9wVcYQ9szLcKwOMJmck5RHhS2bv4eyLR7q+mpY3aGHeMmcUfbFhOl8OEs9?=
 =?us-ascii?Q?x5saItB3FviUs10DAnfPM8HOvxWnVH2BsTXj4+6CX51xtpc0GLIGow+XV4+F?=
 =?us-ascii?Q?zhIbeLs0Onv8RhyywRcm3AAubnCaTObBYBW4/RDva4YA159Mj0zFfqDeqg1G?=
 =?us-ascii?Q?55KAgbeTlgzyKiYe/x9m9F1GsDj0Y0HrO8Mei5G9P4Bd8UIEuZsIIkCB8Ysc?=
 =?us-ascii?Q?vONhjfoLnAJouuw4wOahvzcmI+ndsiNNDiJw90FPEQAYihKocYFFHsGS8T8Y?=
 =?us-ascii?Q?tyqEPPQFcC5N/J4onsvv6Rks2hYoLdKUIDNmVbwbhzxhMiSuUezOpIZoJZjG?=
 =?us-ascii?Q?HaCMa/PNKD1fAlxYgzCMOMSbDR9PjeF1EbwpaM85HZpH5DYVL9hMf8p4dkDD?=
 =?us-ascii?Q?JoWMaKBuW5quz8EbccS0BAHq7cYdsas52tqrLk/CLux+YhZdVSItmyFsvant?=
 =?us-ascii?Q?uT3evp6pjWcSF6KiL7s7EzoddNHxqa8CUFtSLf1WnJtMv8miSL2flwKIipD9?=
 =?us-ascii?Q?UtkS/X+kSyGY4uolszVEzmAMrO/ulIVuqI33kWpU+QmIOlyAIrOwrPHpgX/g?=
 =?us-ascii?Q?6C6ecEE1mesTeWSjiM3UI7o2Kk85rev+7qRPrk5R+zV56aUtajKt99NMB5Rt?=
 =?us-ascii?Q?cazplpCfcasJ34kEltpNKAFNMlQHRkZ5IXSMWtOVzAoGqYg837kfPHKiT8xw?=
 =?us-ascii?Q?1dOX+1W/mO1YWJkb08Xk7lB149wEM6WhyzG6H/bl+jNzAWQbJliPDLQrNnpE?=
 =?us-ascii?Q?kRrcB5mLAzSQto/p8iksgl77oVXxdGCizm7hFdhVSKr/GIAabWsmX5APK6qK?=
 =?us-ascii?Q?zdlbemlhs6pN1HVogOI/ZN9KEmNxg2vhhsv7uDmzCN40tLacFukmrR40upPJ?=
 =?us-ascii?Q?bNtchS9dCmcPtli5mQDO9jz4qRu4yiVls5lvvzrsKjslugH2r86kcdjpZzUX?=
 =?us-ascii?Q?D27XngYq3UR77pxw1m+ty1CMjzR50UG+9lUytw391RM/Q5rEyBl9G/Vwtrui?=
 =?us-ascii?Q?xmMDcAt5HeZbCdU4Dpppt52oJkhxpjBlDztrR5yHgn4tbzmIXGVpCwyMFdVX?=
 =?us-ascii?Q?CAK6s9XcxpH78xktX9UpOquXzdoRJYJiZ+hw11eFrkltkSZ8zw40oQ5RQcQc?=
 =?us-ascii?Q?76UefMYOyvFF/dJTOFFCvoz+jhN9LMlo/CBrmoCD0RYP3EGSLGol8dhyVXqX?=
 =?us-ascii?Q?YZkfJvVXclRFLuLooFkYpYMTdF/zZtWSTpH4l637DmlbD97TUhFTc065lJMK?=
 =?us-ascii?Q?yhbJCaSfc1Mcwrm9k4XWCNpKYbr6hAeK8VgwbhnElr8EGUiT5b7b1JkgDa/L?=
 =?us-ascii?Q?kEn/KPPr3I1b5qcH4F1VE7ZjxcjISEk7kTuvzGUHT5GT+bDLgjdDMG2uNPnW?=
 =?us-ascii?Q?cdyBOMcq5tvjcj9Shylp2pIiGgVINjuh23h7wuzlPJVraR6kGnNECQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sg2tNXRviGrTpQN4NoTsmNGEQS8Mf4hDX14BOXD+D1H9Tw4eUdLTGswmCzvC?=
 =?us-ascii?Q?zsNpVJ27knDvTRygfbLkYaECm2xNgHl/PGWOT9yUbVycN0GefAS/XPPefkKV?=
 =?us-ascii?Q?cMpr6cSw2iryLV0VGoNRJ7FY0abQvxvXLjK+F9+luKNCnFxXtcP9nasMvkrM?=
 =?us-ascii?Q?Tg6tZbeFofP6tk+/v2tj4YbY5ie+jC1LHLepnG1a0AHh3Hv/lcBsGiKJwPkr?=
 =?us-ascii?Q?uozzX38XcB4FmNWDdcUW8CdjB6GEKXlOk06VV+1o148s7cUZgfzCaswRlXRb?=
 =?us-ascii?Q?TQh5xUdZOqJh6qDOkgqkajxUoxFHyB3HiLgXWlMUuokw9PmaPH2lr5B9BRiQ?=
 =?us-ascii?Q?N0AuZ8q4hcGVzZYhk/hOZ9BSJ7Ujwy0B7FFUERsY1ThMVK8kpkokDKjKJeSX?=
 =?us-ascii?Q?MW/+VvgnYbvcW3A9DQ9cb6N5ASH9TBFDnWZkKmZXqzYXUb/m6lkykXoxE1df?=
 =?us-ascii?Q?P0fdelLlwg9IINKPgCC9CIE4AZb6PV6D6qaLuTe0FKgdce9uj1rpkIGPSsY+?=
 =?us-ascii?Q?wwHB6BsA6zXtsjndeLPJCKF+6EyZ282SaH7v0F9lVVmPu/zwwA+VN0I0oVYv?=
 =?us-ascii?Q?ubVMsfOW64FnERTse6bsaxcjV7Ipy2nlYLghzVtBGxAxF0kh3ga/715D7HyG?=
 =?us-ascii?Q?50OvOWmVq2uVQp9yEnOLLRmI9H83UGctqbnUS62IneOukQNJNnZhZ4tp2ltq?=
 =?us-ascii?Q?0tso79S2LXq4XECrkYIJQD3E6NAjEi7H0OtnicU78TSO0CG9uxt9gRGvw7mf?=
 =?us-ascii?Q?lUTWrqnm6L3/ShWMfqEZmrtA+lBQ42dzem/P1UuIUCx2M3sZUHjr/xN+cOBS?=
 =?us-ascii?Q?3YFRTzZG1jd4t5qp5cb4/Cub54wzXrvF8t2xp84YHo5C83Mx9vljisKA5Q8r?=
 =?us-ascii?Q?f5R8q9NidfCMXa2ZigdQCZQsw+A7Roey2bTGeqJXJG01KfrAAT0F4M01LzHX?=
 =?us-ascii?Q?eZeVgDayPWPxBqT18Y/sy+8IAMQTrAt417YuPpUWGdV4vg3uoAk1xeivwOj4?=
 =?us-ascii?Q?1+Yq7Fole31vBOrxu5e0Og8TGaWuNxBCQQVYDj2vz1kCi91GEgmy0KjR8bDX?=
 =?us-ascii?Q?FkYwsSdtEWax8u+t64E+bdYA2gYuORwSHOu0SUBEHfEeUKblBMa5SCLpltY/?=
 =?us-ascii?Q?JsR63JWiL8qWwzFA03I+lLpxIBsLFhUN4AppwKf6J7/8d2oX89gWKLVYSsPh?=
 =?us-ascii?Q?nifrSlIqEy3NVwulEhXKx5PvBP/OYtaL483xVcCud3AAZRre4fExfSGquO0z?=
 =?us-ascii?Q?O1ZPsYIQpHQYlplcU8RhxvvOG6bsW3DRKN6VvEVap8LfFQXMJnMVSGtxw3Zt?=
 =?us-ascii?Q?PG7uAzi5inzVGVx8RG7tlDkz9nAANH1IyQt2bT+hHGt5sXh6ONQBl+I8zm8c?=
 =?us-ascii?Q?m8gRYqxdM2ftqVHaUEPvVJ17fdieyDfL9H7WhlB559Zhe7BeVtpCaU/FfNLn?=
 =?us-ascii?Q?qwxsX/t5sJ+KiekmleoCOBdGgYMs8TnL1Boia9lOzkHCJ9rKW+yE3EbWMlzr?=
 =?us-ascii?Q?mVIuW9G4K/FpoGxZWUJvWl8qd2fLMYW4fBbgVoX0RlMNPv9f24sFdLROceG4?=
 =?us-ascii?Q?c4eCAOehCVY1iYb1Z6k3RZiDcvwAW2f4zN/bmXNW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e990749-dff3-4656-6bc8-08dda372cefd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:19:25.3591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1wroKivVKOs7vMQmxlLeLrveBvok6GBKMBynflzPhLrGwvK5yATzf2f+DguWluIhzLm2NM70fkFnFOpbbMhMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10619

+Mathieu who upstreamed the initial support for this board.

Regards,
Peng

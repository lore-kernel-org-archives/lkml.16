Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF65E17F7;
	Wed,  5 Feb 2025 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738773816; cv=fail; b=ndG4yvvyMDXWfoO0H3rbv8/3G8FxvYuQq0t16D9Dvw1ddY5Q3/3ck5m3aP5yxzaJ9RaNlpg8LQXMAMqXBa+NGuU6btQ3Gxof7/u7+ApWJ/Ff1dwHZP7mtHzyoIZ3E5hA1HXh5hqSClJMWBT9SJLr+7e+JiLeyjmYzTY4jlrqORE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738773816; c=relaxed/simple;
	bh=hdSgd2pMjQQTq3JBENwFLJzXBiXudBYzHUMLE1rmbGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jTGgsmwaqvxw+6PPAUMthbDyyZLMQnzzy+fRdJprJbmien1hG2KPUiBMQ+eb194R2+XUVVeG/gOT3dfxd9+nbOk503TpIpCcKyoNQSoGDlnqszHxgKgPvO+GlQEKiu3LVpWsFgFkf7elEO2G3pXJUqxuob4Re3APh10bA2OMu+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UZ0/l8PV reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UZ0/l8PV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk5AyKWD2+Z7WrO7H/azVb1tyZnfoLuRXsCeRn4hM4hMrQ/nOKMk4G51tgXI68ET2ZN+IacjEXp8Ra1Noa06snCvXWv+1HefKu2l1DtD4WXhOZxqx//2FhncQlijmRLP+JH6T/+nloxDlZPA76NrDcBix1VC5AAOUyaQI5KqhvlC5nNQsFcffNDxkeLajGzrCrXuXNhpH3lSupfx6BapJkAo+MzcGBn3SXCDo8hbleys7fiqK23fEniTENY9oLIrkok3yQ24Q1n2yTDb9C9qAa0dLhqQzDxkLlbzX7NwNKFQDUPSW+aoiSzzI0PiRbi7cBp8HBcghxYwRpMi2Q1ENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCEWx8J7pmt8jN0oKw+Ae5INs9+16vcntHYKo3UeBNQ=;
 b=lf6RfCeeG/fAexizwAqiRjiJ8uxWNdq2td+1YY8cK/3TfvfU8XVrA8yiV9v7w3OCAw/+RtfDEa/dQZ6BQixU2CXwPEKPj5BLu9EBRxNCdx8Scua2WtGz8Dd3OjE6EE2zwWPD1LJWsbJnrZE68yutciRRCc4If8rgPe33ehM2MGtwOdq45FLiAi8Dok5zOxu6K74NzyUz4pGN4zPbbCQPEhg3JMf+zJ2LcQ1mTadkEM5Cl1aCkJ25/VAGvbXj7ww7F3y5+xwqeVeAu/5JnkYjIQSRtCzdcPsHZm7HMlkqQ+xeBG/+WhvVUxPE0mVD5owKGVZLcR83HRLJl9sbdHUiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCEWx8J7pmt8jN0oKw+Ae5INs9+16vcntHYKo3UeBNQ=;
 b=UZ0/l8PVTw3f7KwOXNEllQVW0f92L+6yTq42W3R5AIaLv9Ss2jtOsbIG4cwh3Ae6vLZZodfWdjLYmZLyGdPVYDv0zNwOjdsrskxI5r2dXpZ1kEgx9YsjrjAmoNkZAzFcMeZRIymX7gKbHJ3qzDlqFPqxhgv5UM4k8CI8czIXSrvPp7f4o+RX7AawaCc36p2TOk1Hz9om869v0U5fuxkJ0+gVHzYPGWoLyC3xDEt7Z1fepuxiwnui+/zmoQmhaFI7XBgfbw3HQM+g1TY2rFN+sYgtoZaUzEX5uQk0XYjVxek5PJl8b9aNEgufUu+l9m5/ztVw3b9HU3Bdy23EUVYMEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7785.eurprd04.prod.outlook.com (2603:10a6:10:1e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 16:43:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 16:43:30 +0000
Date: Wed, 5 Feb 2025 11:43:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] nvmem: imx-ocotp: Support accessing controller for
 i.MX8M Nano
Message-ID: <Z6OVKqy+bRLNa4GY@lizhi-Precision-Tower-5810>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
 <4961006.GXAFRqVoOG@steina-w>
 <Z5z0/382k8MkcZpP@lizhi-Precision-Tower-5810>
 <6396921.lOV4Wx5bFT@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6396921.lOV4Wx5bFT@steina-w>
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f5edaa-688c-41f6-fd57-08dd46043883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?n4NHNmU6a6H8qxthvORgZ8syPx+eZDmb6wzEwKWqtBK+8nnYRlhgPYHB+h?=
 =?iso-8859-1?Q?D8tHcTPxOXdU9rCcu/468Er5llh6rZg3aray1i8nwM0mBSs3lL+gqpzm1L?=
 =?iso-8859-1?Q?0+PPtDpN8bURO/xfR0oalRvXorS24z4w26Kx8ROyRUIVssH/YC4jBl0oIu?=
 =?iso-8859-1?Q?lyoTQNonDDFSqxhbI3317yz+To6SB7e0t7toQumQDOyHdWgyjYIfu/r/Gt?=
 =?iso-8859-1?Q?H8h+OMpii8Lzbxvy/54Z/ZkX5M+WsccjyGXT/MjS1n20+B4AOWx+fAbWoT?=
 =?iso-8859-1?Q?OLOTRKz1ARiYd9/A9wt58vs6l48z18Sw60au1UQNI7ao/Dontfn3xe3mxM?=
 =?iso-8859-1?Q?Uk6X5Y33+Z8jTyztnQYyophHcSvwLc4Kz/AbOoABO/OZ8TicU6Whq3TD9s?=
 =?iso-8859-1?Q?2U3B0ywiRtKcKzyBX+JNYPs0zhsSp4cHR4DN1F3IWTVQLXpGNpKxaXvUnQ?=
 =?iso-8859-1?Q?qYNVbaGSYXnupvWqx42aRFucqsNgb740ms94MvkHN+QppKK+AWPVhGC8fL?=
 =?iso-8859-1?Q?1dkwjPOAqGtWebRJzNackm5hgi9hZsQ+Tn3C9JeGCMuuL4prqDbal2L0g0?=
 =?iso-8859-1?Q?r+hmB0w9yu5FBjxtADNVnk6xAA+ZlUN/mely0+QvNaLtdut7iF/gh096xI?=
 =?iso-8859-1?Q?w7UH5PblDsrQnuwNjf9z2Y6UB9Ek7jnotuO4Of0XMJDoTMwawOrQ0Dq2NO?=
 =?iso-8859-1?Q?xnEJbOuegN4YzYbDA/jA/qe0i4bVBDic6TgXQ7VfGKPVz2LP8VagtWHB75?=
 =?iso-8859-1?Q?qeyTJDkjTtEFsm5Apttqz8zjVzCmIr7Z6kuqTlvrFcTj1I6ZD9vgAqJVBF?=
 =?iso-8859-1?Q?C1yL1hVihpzNBbpeDTzG55x7n+nllBX2p/FjF5IP7XdRNmcLVWIg/dpFxo?=
 =?iso-8859-1?Q?oR/txA1TfuuyaJhXlRfAcj+0e/RJsgMWQeD6KyXtFRkw4RkZv1cl8UXGmH?=
 =?iso-8859-1?Q?BlA2gv26LBRZM3xRqEqUiq1RNEzxK6HAB0h20kB0d5LoF4NW9f/MgyofG5?=
 =?iso-8859-1?Q?B32FjoVU4FWHB7qVr9ADEHk3m7zT4RbkdzvpvnD08NH6XzsYNAdQTR95Nc?=
 =?iso-8859-1?Q?Pu/3mV09eX2KNqJmrkoAqNsp25tDFM3CX3WiO60WC57Guz2l6CDslS0Y60?=
 =?iso-8859-1?Q?+E+U0cFi6s9Vt0tEFhPwhsMH0v2J3PSkVtL7pUJcKzLsynFHNceW0x6jZc?=
 =?iso-8859-1?Q?pDQhDcGZ4nG5SyKSTbFJYtSzYcM4vaEFFTXV39FwLuUQIcoa2z7rsT2aK2?=
 =?iso-8859-1?Q?4qwDhhZ+RrbDar/NbFnvq6U21PzRUGmXSvqcmTNaqPtfdPKo1lXdEizpoB?=
 =?iso-8859-1?Q?u9okfIVx+pIJwwH6jfHt/ym/MSRa14YVSA4dT7KqnZQFngxQwt56A+e8J5?=
 =?iso-8859-1?Q?X0naccOddExUxXCBRTwUG28h6SiXysQSfvq+wEB8FLkwyjRVJTVOQBAfkV?=
 =?iso-8859-1?Q?98znCdxk9ffO4sOQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?W88TnhkXwa6GlxjNbjJ2UuiJlXwOytLuzarsp76jWfc1Vjo6fAPhcHaaRI?=
 =?iso-8859-1?Q?vlz5ln9wyky3Si3APLabCXxzUCDlO1H8B0wCggezeLlx99evxSl8ffIUpB?=
 =?iso-8859-1?Q?kSdku3UTj83nVau45KQjrelBlKciyemFTO035p0b4LrfP6hFe1sdk6DQ6x?=
 =?iso-8859-1?Q?/0NNqHKykg4AofpycZux85W4GZUGOvW7q3LxCNX7HJbIATRLpH+mgaFtEB?=
 =?iso-8859-1?Q?ge15jhUkROHcCgfFxMR+RPXqSFzueMlAEOtnziEqt7XLn7YdZhGJ+2KdzH?=
 =?iso-8859-1?Q?tk3mSbkX2IRsopsSHQ2obQZ+Kh0OlzPXda+xsgNld8VIy9azqhcv3Jwchc?=
 =?iso-8859-1?Q?msAwhbTgbu8QqpJocNQ6KuKPnvT/RMJWiG/s5ftE+hOQuIbmZwkEC848Rl?=
 =?iso-8859-1?Q?7n9BROsqcWy9vkrPj8j5ayfD89chcSkKJn8sfpP769ZyEYKbZ9fpDUtsgv?=
 =?iso-8859-1?Q?szsZGyJi8ZDULMzC0YEr7w03b3747yVKR5t+qJAIpGh2Qv48c0taXUr8iJ?=
 =?iso-8859-1?Q?TN9BiAGyUqJltPoQ2D51PUjVOwMiy278zmF83Ymv1bsfwXtSlrPpukKR+3?=
 =?iso-8859-1?Q?dCyqsKudpFoX2Pp3C8rHDpre5KQ1SVO5oytrVkcQQZFyiEpP0M4i6P5zpH?=
 =?iso-8859-1?Q?Jvxo0bVH/Ovb9PEM5Kjob2S5iNOiEtyiIdGHBvDE/8fZ1QNLr/hpCuyqxW?=
 =?iso-8859-1?Q?xqBUXyJDU7ojnrVaJnqeKfKwk8lrv6Erb//zwzpmGtrpMudeMEN8rkZSdh?=
 =?iso-8859-1?Q?ITdLlvF/Omvy0/AwyrOJbQvBhKpJj/zl+Lttl92uJ4FNI0cmSiEozUN+WH?=
 =?iso-8859-1?Q?Uw2VJZbavFMjm1pUZLHjmgRLZldyl3sY9Fvlme95f8aB4+sXzsBe4ZL9J/?=
 =?iso-8859-1?Q?tTaHMQH8UQF/vF11bSR/0VTz2kxyGkao8SRzw0L1GPa8+jwTd8AjfxYZ8V?=
 =?iso-8859-1?Q?/RFP4Z+7RXAuERBhqtaSTJwo07j8+t6l2BE8wjGXt66Nw80lzCl+i5vsTS?=
 =?iso-8859-1?Q?l2tZiAC0kEGmcg4WllB5LE8YLl1Q6V+wzN9s32dLycSXnZWA2AXBD2pewx?=
 =?iso-8859-1?Q?Xh95yZWp/O6YJqK+T7iM7CE6OYn9d308SUJU/DPn0Nn9ZxlDXRl9b4TCnx?=
 =?iso-8859-1?Q?0aiio5qtuoMF8G4AEdRsgCKnS4YSXzRrY50rTAw/4e/+tRiX14k63buefG?=
 =?iso-8859-1?Q?MeCjMxOr7kMPtHggai8kMw5KX98NYoVAOVpP4nG1qqY/3wcl2gSKHWscLa?=
 =?iso-8859-1?Q?OahB+lsIa3cg/j0GYa4LkgmEH9M1aA7hHlObTBWuR02tkmzyVKuomxk2Yc?=
 =?iso-8859-1?Q?cwDGrkNkOXXtDQw2Fo4yLha7VEBDmkzSaYimuSCZGGOVExMbk+hOrjTq2j?=
 =?iso-8859-1?Q?u1QcYXzb2HQIzCF+6ICZqUI06QHuohJdHIQUR1gjDrFzZB/P7iuINrJWDJ?=
 =?iso-8859-1?Q?x8mV/knrji/Pm2N7ECJHZz/wHlfvkgV7ysBTi/PCHB0o745bMuFP4RVq2z?=
 =?iso-8859-1?Q?z9tkiVAhQ8kEeLVpiNo78k4whLat+qVChr2pdG/xreO40sY+DgTLK4ppxk?=
 =?iso-8859-1?Q?AS7GhTnUbOQpFm7C1bpZoN3/DUryO2vaT++LDjfa9/QVUY2HPHAXQPGt9d?=
 =?iso-8859-1?Q?IOGd3LXARDtNQQ3ASYWqnd3qJ0gLeNg+sB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f5edaa-688c-41f6-fd57-08dd46043883
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 16:43:29.9795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcJdt/jaT5l4wg2S+61Wv61RpxwDNOiLw+tAw1Id3sUvrxaIuLBmH4sU7ON2i5VD2/iZHXpGztJrnXXHG9borQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7785

On Wed, Feb 05, 2025 at 07:51:23AM +0100, Alexander Stein wrote:
> Am Freitag, 31. Januar 2025, 17:06:23 CET schrieb Frank Li:
> > On Fri, Jan 31, 2025 at 02:54:06PM +0100, Alexander Stein wrote:
> > > Hi,
> > >
> > > Am Donnerstag, 30. Januar 2025, 17:42:32 CET schrieb Frank Li:
> > > > On Thu, Jan 30, 2025 at 02:01:00PM +0100, Alexander Stein wrote:
> > > > > i.MX8M OCOTP supports a specific peripheral or function being fused
> > > > > which means disabled, so
> > > > >  - Introduce disable_fuse for a list of possible fused peripherals.
> > > > >  - Iterate all nodes to check accessing permission. If not
> > > > >    allowed to be accessed, detach the node
> > > > >
> > > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > ---
> > > > >  drivers/nvmem/Kconfig     |   3 ++
> > > > >  drivers/nvmem/imx-ocotp.c | 105 +++++++++++++++++++++++++++++++++++++-
> > > > >  2 files changed, 107 insertions(+), 1 deletion(-)
> > > > >
...
> > > multiples fuses for disables. This is an excerpt from imx8mp WIP
> > > > struct disable_fuse imx8mp_disable_fuse[] = {
> > > > 	[IMX8MP_OCOTP_CAN_DISABLE]		= { .fuse_addr = 16, .mask = BIT(28) },
> > > > 	[IMX8MP_OCOTP_CAN_FD_DISABLE]		= { .fuse_addr = 16, .mask = BIT(29) },
> > > > 	[IMX8MP_OCOTP_VPU_VC8000E_DISABLE]	= { .fuse_addr = 16, .mask = BIT(30) },
> > > > 	[IMX8MP_OCOTP_IMG_ISP1_DISABLE]		= { .fuse_addr = 20, .mask = BIT(0) },
> > > > 	[IMX8MP_OCOTP_IMG_ISP2_DISABLE]		= { .fuse_addr = 20, .mask = BIT(1) },
> > > > 	[IMX8MP_OCOTP_IMG_DEWARP_DISABLE]	= { .fuse_addr = 20, .mask = BIT(2) },
> > > > };
> > >
> > > Notice the fuse_addr of 16 and 20.
> >
> > Yes, I am not sure if it good idea to encode fuse_addr to IMX8MP_OCOTP_CAN_DISABLE
> >
> > like
> >
> > #define IMX8MP_OCOTP_CAN_DISABLE  16 << 16 | BIT(28)
> >
> > So dt-bindings/nvmem/fsl,imx8mn-ocotp.h can be moved to dts directory.
>
> Mh, I personally don't like encoding offsets into bits. How about using
> > '#access-controller-cells = <2>'
> and using the defines like this
> > #define IMX8MP_OCOTP_CAN_DISABLE  16 0x10000000

I think it is good. better told peng fan to align this!

Frank

>
> DT stays the same:
> > access-controllers = <&ocotp IMX8MP_OCOTP_CAN_DISABLE>;
>
> Note: It seems BIT(x) is not usable in DT.
>
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>

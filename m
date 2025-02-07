Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35981DE4CC;
	Fri,  7 Feb 2025 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925735; cv=fail; b=gNBxITFSaBIu79tEWZL4cXh1Yu1bkMeiw8Y/YUvFPmGU+1/k4atEicOZ1Wo/0uNeuwxAmff0bDDbDAHx4ysbz27rdLtkUKzvFFlZM9dTBmoZxB8BgZUaQAaDlonuF0nytdZcoybJWXOcM7MsJcvAXzLi1TTYBK5btypTLMLToRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925735; c=relaxed/simple;
	bh=e+dlZmBds7IMMH8MCWM/JAZW0AVILdXiS60CxPArWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CQs4tmNrkoM8O4qfThEJ6jXCDRoMLBZDvnKRUZNjYpZXV3aP9b/XU06JHzoV2lmeq+aNHdwsF/HUmoWkqOsnj/cAYEUCFEi0uUYtmgijJSfgZmV9YU2AVI/49BsGnVABsO+siOhkezKfxE2ILg7B0VQChS2ZBvQpCGxWoEhan7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tLRl9A2r; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tLRl9A2r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQIMSQ369ZO6TjQCjF8325US4eIuFTQqWLf1LQpBp/q8I6vXwB52oEjAijGpQw13XczRPZsBE8nCOP0q5Yy0xB83UxCIoBxkxZkBMZSPNCxFNj1qtSWZizetv0WwaFw5KO+cqwAzGByZaO2I4ZOrkx4qIdHTcKeVPbAZST1wsza3SqtLjrVykRjJ7u/hl15FVXmXH36X4gB3oZxdeASgE0XZwSQ09rJjMrS116hnO43NKb2cb1GwtbwIOUUA9FjTVe9zniS9zo1YL+Lx4RHELQnReYK2mdtsuNHH5H9DWriWtGpl7qYZSoZJ5tNL84bccTybf2q+evQudov9ijN5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvoDKjHgj8jSifn+b0gSfKRSg2LbD13n1777iRgM6qo=;
 b=I+gMqM73XWedTVXI5AxtjLi4ScQzf/L3Lfx2Z2VwqoPDFnBo9InWv8aPSw2UGf4jrHr7OyqrCWZem9KAuOot9rH5HQoESGvmjG7dvQbuoA5LzosAxgIlSp23JQKfFW4DSt3V1bLKUjKn9tt+uv8cfIEEPWHuo5muxMR83US3MOdw/YOz+UqqWrGjWA2P7EfqDVHUAImjSaaKFXQB2btoYpLqmr/oDGNNhVG8MHelto4i059yJjHATX/RYRbFbUzb5nYC1lB/pdi8oqU3PM4bFT4L+9EKl+AMUh37KM6ulV2WrXyd0pk4EBKX8cDPDTWL9pmh7oQVZDuMjPAUcDhOrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvoDKjHgj8jSifn+b0gSfKRSg2LbD13n1777iRgM6qo=;
 b=tLRl9A2reBgobtLuBfp+71xO23m7Z2aACKecFP2swZNsk+2vu27JIMDveIFFUue0V9Xo3GwgHqeQ9IS1v83oOvuIn+sBDH/8b+WxQquFkFfj7h5gvqSwjgLg3pzeHDbfK4GsW+pQ7XMiq6zYiNoccJHpBqx3+QaqHjpc2VT7s52kqRfOE310xFbpGWdvYBdokJ/lm2mH3MQHB0rd2BPiZbmvNbVBxyWfM3OsJOCs/UQAc03JiEpT/grNkqYFOtf+/Mg2+RDTiPiKwHZIOQ8YJ7H26yzPFTx/sIhPF3k6x8SCtOTeyEoccSZYPQ42RpihaS6OeDFrC9Lcl2ScMk9xbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 10:55:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 10:55:29 +0000
Date: Fri, 7 Feb 2025 20:02:13 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller
 references
Message-ID: <20250207120213.GD14860@localhost.localdomain>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
 <20250207083616.1442887-5-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207083616.1442887-5-alexander.stein@ew.tq-group.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 22039275-f7bb-4b68-d13f-08dd4765ef80
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ldDL+kB0p85i4F488B1SLvnq4+4Oxw31ku9kYx3uM/XPlhp2JR8rAleVV21r?=
 =?us-ascii?Q?HhYwGLb1jaMyBTqK4Q6pdmYDkn3DaY/97UVlzuBsgIwa6dqUDu8pqV1IjdFs?=
 =?us-ascii?Q?LjFSWpKUhJhHZ3cCApSzHqKpanRHP31I1rM52TsnFlvh5Puhdcbh1Baukzdv?=
 =?us-ascii?Q?pxCfM/eKCzM7OeNKndvCBlL9wm2fxXyaMEYxS4Mh/d61c1IWhiiaetXq8bib?=
 =?us-ascii?Q?jmSUGlQ0ihswb98nqJbgGpoKII0XMYKJg3kECp0nKxoZ/zefNprRqycP5Ci/?=
 =?us-ascii?Q?qlUYQSsDzHPKovVAJgp3L8j7I2uiHaxUmvaKm5qqdkLjO5fOru3FqipYsq5p?=
 =?us-ascii?Q?djv8+ECrVKM1Td49kQ9gehfainjWQwszEhanSrLNCIMVyfwQmt3Kkes1LwrR?=
 =?us-ascii?Q?MJl0HOK8gzZQ2j2VKq7qwHIGvWcgT3TT1faC8Yn5cxKdVCr1FyczJHuR1nXU?=
 =?us-ascii?Q?YxemRO4GnincH6JvMrprz+2oG7jE85tocAaQ9bU93j2pv0dKcBJWsEjHYM8J?=
 =?us-ascii?Q?qtMAec6iTEJrhKAXOzjyOMSyFefDN7ISRrbRvyjgQK6cpMO6bpHm0xUvGdfw?=
 =?us-ascii?Q?4ACa9MnGOw02uBPxhGJAm7sFV0OYiyEs+J3wx2QZLlPplF6eebg89M/MezLw?=
 =?us-ascii?Q?uu92PyVnLLoPBqIP6YhW6PjtH7x2alqLndPfobEjPMwAeYSi7hbXxDwulRuu?=
 =?us-ascii?Q?hCaM2PKJYOzzUj/arRy/2HSl+JCYAAwvYFuP/i1B5B4W/6O/sggvnIa89qia?=
 =?us-ascii?Q?xfypTCtKxNMWkj/7w0h36OBeMdv1apxUwcIqlXSsCCUzMvd+JOI0yZ/i+v1l?=
 =?us-ascii?Q?4Ac3y82Mgv3jwt4mFUgvNgQJnIg6JmAW6LwPeg/qlPeDpO7UGNIwFj9c7gcD?=
 =?us-ascii?Q?5H8cjK/1YeqZBhWHKMs4+HqVP4AkxhxtF1CKBrPeRtmRhNqCTB+y+ngVOghZ?=
 =?us-ascii?Q?Eo3zUzcJrsT3ObqEHujzyHP8RdH4I7YXTeislNWrMhC2NUw+z4arLOe01z6m?=
 =?us-ascii?Q?aRZBW0JdwzsL2oIH6rUzo5f7/SpKI6p72ewWR+rfhKG+dq/LKFg2QTHa0YRo?=
 =?us-ascii?Q?KgOY6yqra/zsu2yXrfJPUhRxjLM+VbxCcpRk8/keXPA8EXM3zw56AV/EZ80a?=
 =?us-ascii?Q?wOKN/urFVykW5j3d7HLI8aUFZ1G9T+52cNsy0BoaCkKdiTmwixea+WcFpZKW?=
 =?us-ascii?Q?nHqZS8k21isYAV92R2V5g/Ii233FQESjZIDV0eC7RbFvfqkKjxWrtHEHpRWv?=
 =?us-ascii?Q?wSmzuu1ZIe133zOckcAxinfWq3a3uHi2rPtgRdhO/uM8NXfhCELirrJSBu5A?=
 =?us-ascii?Q?zm7dl7H9vdwQN6jv2GU4VGjaJAlOSNDim90gpzyDJiHisLUyp/6ESI+eXPy2?=
 =?us-ascii?Q?9Ie8jHo6BeZ12N8ELQQJGcEnT1/pvx0KybtorwAbW/3X5aDSZerYk/658dPr?=
 =?us-ascii?Q?ScjfbRwn+EKx2c6JuGiD1mBYita+v6BW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LtU/mlqM9qOOAVE2E32XA9+3pgKiCZKvleDbQwKwe+5byBd8xDsENQj9JM5j?=
 =?us-ascii?Q?zdMQERcHzYwN7+oQYDKSNPYTqr7dcfV1onpomSeXXQrN3SBREQut5p66J0x+?=
 =?us-ascii?Q?CUDM0dQzrVeBcqwlyPy37OfNXw6WZwCq1lvigqb25DbNRt1XSK3CYdi5ITDs?=
 =?us-ascii?Q?yCRyJLdmp2dVnA6SReBkFb53qyt7x6pvqJmwaCGXYpHZbnUcCw6pdMmKmzBB?=
 =?us-ascii?Q?2K0WBRy0V05Wz1uOfFAUhSiTuNVyB2C4O3IuVVbCWRc8W+oSvJj80J02WSD9?=
 =?us-ascii?Q?FF/WLZSrr0a2O0ADebRg+0myViPW29f4WuB5tmxnqojSSX/SWhZUH82TUoHt?=
 =?us-ascii?Q?uKlo+fLDAn1Nn5bdZCLc3JJ5S3QPBM+2rnM9ds1krPlliUiPi2aXlbHEjVKd?=
 =?us-ascii?Q?sQC2w/mTV4ZpYIc118dIg1HyNGXXsCw+g+5wNC/hoPYb1WmDa/8aLtApif4s?=
 =?us-ascii?Q?7PEwbhwkR5YhiRsGewYr9q/Eb6wlmpj2rSEheigMjSQgCBPbwCjJyQ2ZptKE?=
 =?us-ascii?Q?xFnRTlsB5X1+7ublAxhEG2WKNnpjiCO9sfyGThFkfXTOfJk9MF1nXXTTa4/J?=
 =?us-ascii?Q?mzgAyfjl3stwpT0vZSOFkxw9qY68OlrN0V8I7CYA3ONRBlYMBVZJ0CX8JD9O?=
 =?us-ascii?Q?kkNrjWCraylL6w7astsfc/lcHbICgHwSW2gbA7oaA848K0/XeUnewO7pUqjR?=
 =?us-ascii?Q?MQShjZsaZuFX5qqBmkQZVvAc4XmPOxi1Bnpxwpcg56+BRywNZb5VV+9vM+gh?=
 =?us-ascii?Q?W1uAe5UMY74DgZ17xsI3CSKTPwAuXYFlUg2UJo2UaadNNxmMopkiUvW7TL+Q?=
 =?us-ascii?Q?P/E6lJX9ybS+zttRtiAVdSqmnC6WOtsxUsqo0nhxBjkGZiXz8CHuf0QHfzn9?=
 =?us-ascii?Q?fE+Um6ARIBgD/J9yaKPRJftuUuuwzsHVKGujbT/h9xmscS/lj5WeygsQIfIF?=
 =?us-ascii?Q?GTbBrmcOcjYgcHZeEYeHviPlRBlj5BrId7ngOsJLKoHfCCoAAG+lb8aIpdQM?=
 =?us-ascii?Q?ecrAck0N3FsRhvEFgctl+IaIBzJpsaleDCqg/0z9sfC7gGx2wqvz4I88hC5w?=
 =?us-ascii?Q?rSs63Sl/tk7raycrMZFwAF1POSVI+z+WJFNH86tQR1BbwUqPEgtRsBbxM65P?=
 =?us-ascii?Q?PuBmRK2nfA0uZY7NiUbYP8sA4+UZSfwQh7ZRh3egGQso5DmuN4iWngOF37F9?=
 =?us-ascii?Q?dOI/Zbza9teip1XGULSGCJoChljDq8whlUffXDqTiiC6/NOH5IoEeYrQHwYv?=
 =?us-ascii?Q?2C0zDb55i0juQGwpcu/IMedgAZNZv18Na3ccetgQuXfoRClb5Du4gUdWth7+?=
 =?us-ascii?Q?qptfPcdkJOistBBoKIomtnSYwfm79XgOARAyXWxqvUaCpkS48mLfpavGcHnR?=
 =?us-ascii?Q?v5BK3nCxtf1KjABLo9+ShpTZdjVVFvi4xsPNFaCWW9SpaJZeAtDQQU84j44I?=
 =?us-ascii?Q?d/jRV9mDG9Oxp9fPIf7fXsKJwII++eIFbmG0bKHgq75l2qBdfpUmPBysC1GB?=
 =?us-ascii?Q?CEzqOxNbzrn5CIUO5Vb+J+8p9mIXwVEgJDkL+vUweFGnrdflT5Rs1hRuN8uU?=
 =?us-ascii?Q?+BKsMDFXhEFTHKA72XzrRLaJ4Th6VFx4UBTkYBKn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22039275-f7bb-4b68-d13f-08dd4765ef80
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 10:55:29.3366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zLYNUkahFS1p7vRliNhQq6pfTjRjwIGWr7CLeVea33On6SZruFJ8qis2PfBDrJzqQrn7IBEsP2IdClZ7tVvDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786

On Fri, Feb 07, 2025 at 09:36:09AM +0100, Alexander Stein wrote:
>Mark ocotp as a access-controller and add references on peripherals
>which can be disabled (fused).

I am not sure whether gpcv2 changes should be included in this patchset
or not. Just add access-controller for fused IP will not work.

i.MX8M BLK-CTRL/GPC will hang if the related power domain is still touched
by kernel. The pgc can't power up/down because clock is gated. 

This comment also apply to i.MX8MM/P.

Regards
Peng


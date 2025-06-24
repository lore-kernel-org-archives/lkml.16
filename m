Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FD02475F2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799590; cv=fail; b=pMYoXmv1rqJ0AytuLk+k+xVAnKDNBCG7IQm+00nPByROgODm6P7uS0AzIVQ7TxoGxfzqfHNmsa9/aTZyLrYIHj2Pt4Y/rTtf2sxMaJKsmKnq2Uh7rAFK2k7s2Q/Z33xJPgC+k+WCk04a04em63bYQX5ecd1ZFLW2DjA/IOBu6qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799590; c=relaxed/simple;
	bh=W4TgJZQu1TEdV1lL1+ZpniJ5k67YhFZjdi/gutRIb+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uQsavxA+2qsIgTC9/x1x3T2XASQOZzObFYXlV6t0Kxk8PUFuqsrstgBHJGFASgy+MHz06gXh3PkWx+vp73WkbNGfwhb2D5H8QlFXcnSXcc0d3eMTSlpuvv2o/76cbWFSB4Pa0SNscB3vX8FSOq1IsxF27Q1vIbXEtcl5+PyULvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XbuRyqFF; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XbuRyqFF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/GXHZH6w6QF64ltnQkF622lxp5hSAr7rFqcgCH84pyu76mfn7dCXDN6vWlX/sfZHR52d2IAjMCNWIT1OMXLczZXSETenEKiGzbLHW96tIeqMlzpp4RzJRwiUicVg1T1qON+YsFPeZLxjHX8LLdfOtyWT4zxQnycgmed/3e1Ca6ETqJEl+lFKom+Md1qCUYCzIO5uUyoabLwY26464dw4c/efdkuvm9S0OYTxz1q5KcUsZuzoGz+2LeL6zgxjGhWJpNz9V4Iszb0c6qegVL0GvR9UeXGU2JUV6v3TUyL4ulYn+ClPzvQ5pPwm6a4LbR0LR53mgDr5J2iJmyd9YM7Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5O5iii0wEYbUn5ASPNO76r9P3roc4ahmdJSkZJ54I8=;
 b=BoDGlowbXrMtGb0gQqds1eCvaacCLDw7jpP9uPTHNISlDyw0ebLLK26NwW2ZIXySFDuXh8zoqHaFySJW+Kd7q0MH6r3RFxwb7W/9WrihcaEj0Kr5blV8OEafv4X8n8kPi/C0dbbtuQVJ5NkPjNnecM2oP2zrf3Kwgtz6b0aODCwCOdoAHEMmJXIt5Juafe8kNbrzp+vsF7BQVT1cXmETu1HeQS1/tXfUIFWlivu2BoSW+nb2RT4hMoERmKyKiE1JxUDW8Lln/NgjO/ENrB3zaPszV3iYtSImoNoZq3v54g3DBrVj529VRB1krofMG6T9NR2juP7eUdCBZtXza9AYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5O5iii0wEYbUn5ASPNO76r9P3roc4ahmdJSkZJ54I8=;
 b=XbuRyqFFmJbAaOrhk3MyxjeHaAB33cD5MGnMpz8pfp5AGrC3ylHuFYQMOeE2UjnSW85ny+VNqmDYuZe2c4Hdb3lvDO3+dvkXiDnQTJLwRIcpIbEeYRnm9y3rhGqiBzurh4Pz66GozYO8YpY0vkojZJ/UTOwzETS5I845Ra13ZtR/G3QYNTYE+WrHHzgNJ1sF6vozUvpi6wQ1CYZW0SoeHm0g/Hr/C7+IyH0X+KVBUnZEfHN7OMEJArIJabcv5XnD8Lj0V/lr4hf7bwcZOmJMDz7tcUHe7VExuZ0B/Rm+ni9Aoq/9NKnWtbMCPhBaVniM0W00pvGsC8ymlhH97k5j9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6789.eurprd04.prod.outlook.com (2603:10a6:20b:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 21:13:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 21:13:05 +0000
Date: Tue, 24 Jun 2025 17:13:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFsU3YjzjxzR2drQ@lizhi-Precision-Tower-5810>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
 <aFrpra9j69OkkMbL@lizhi-Precision-Tower-5810>
 <aFsK8sDj7WvIBZvW@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFsK8sDj7WvIBZvW@shikoro>
X-ClientProxiedBy: AM0PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 585fc445-c9e7-4901-def9-08ddb363e92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pjx8MLK5uHRuCF5Kbef1SU4EqJxDj+xdW1vuFfSQLi0E0Zg3rkdIPbt9qM3J?=
 =?us-ascii?Q?qI6sjLpmdEoYhSvYw73wHU4MFTPtF5DDeoUUoKYKkmASMbbNML0DRqJwGIcU?=
 =?us-ascii?Q?UHTg6Zt7pQJsgdf23kNqzCksbPPDgTEqqA1OvsjFdIiG9LmI+QWB93E4N6BT?=
 =?us-ascii?Q?1OeQJQFCEm4+ckSEW/WOTRT9VoBdpEu5i5srIcT5t6THMI32FR5ZAL94Xtj8?=
 =?us-ascii?Q?KO9E92i57wnq+hDANxnx0rOSIlMeviKbRjgO5y4dOduS66vyfp7xqgw+Px2L?=
 =?us-ascii?Q?AGs5eYf81JFckbPUcPDOa5BqX9QquWNs4Z+3fKVSoPJ8XYbBXQKOuup+v6eE?=
 =?us-ascii?Q?fg2cv11AevDDx0g7q85sg4OlmZYGAfyID2D2zLAfdIbYLt0LmFtdqEhXN5sC?=
 =?us-ascii?Q?QsdntdoW3/Z0JcFRVlfz4JE6a6PZQA7BTxYZ2pnfcvTfQXywI/Zrp+4pL/Th?=
 =?us-ascii?Q?PoKJ6kx3H/UkQK1NKe6gwp7Sbyyy0m6FeijTTO6nFZ72E6HcOeioFCpXTHAF?=
 =?us-ascii?Q?mZgN74YAOqiL0ZiFLB5NEzFTlgqnEZCRXz1hD34r1537COpFn0547XaKlxaZ?=
 =?us-ascii?Q?ghNMC4CWxyT6a5+pGQVbdyeL9Xp0To8mFlNKzV16Hl1pGX9GFFvg8oUDYX4V?=
 =?us-ascii?Q?QU8jyoSlDZ3TXMSThtxCyxi+rPkCx8XskbJOmXmE2Zg6sOHuIaeeN7prtZKV?=
 =?us-ascii?Q?UzlR8XbVn+YBo55hxb0yaolcjDkHTKv5sgzexqHwrjTfENsX/JKoIJvrLvM9?=
 =?us-ascii?Q?Znit8sWlpubSw/twMyeeYc4c/gRWgn61ju5CGHR/xzvCsgqeS3CqrJ8rNPez?=
 =?us-ascii?Q?TOEFBsUhxImQ1ynsse9/ZG3Ya1PHQw1VTnmrw+bdnsgc7OEW2Vn1jeFCLGUv?=
 =?us-ascii?Q?bXbqvYe+3m0EASMFQyk6rZH4mbTbhisLtTRKQLRKgR3y1lAUd92T1YXtQjmw?=
 =?us-ascii?Q?h+6GOxDWCsoW8VSf2LOVQw0/fhBfrZ7lZGny86N2PAjbB09/rvhQyu4L7Fde?=
 =?us-ascii?Q?qU19I7gzr3h7svTo6K1sqe9m9ob1PxFID7AkoAqNv/xo0J6/pThoFqfZDzk+?=
 =?us-ascii?Q?CB1dGwR/khXjaETvdAwLiUrH5oAfN+hzh9+OAUvl7FOSN2pcwg5zfH4eOs3J?=
 =?us-ascii?Q?h+NgdH+2gfPQQBFfOMeQZmmJPW3yEIXg97IigJQ3X2VUhL7bmwDyyKhV2/aH?=
 =?us-ascii?Q?O95WxAC8zFEaXvimgtR6Mik5j2+b2Nw13KSge2V/uRr5wJSgWgyCYKr5BUvK?=
 =?us-ascii?Q?m/bWr3ZVjsMz1qeKRRtoY6M86P+FSC3SBuB6ZmzRe/0qIOF6esZd726l7F6P?=
 =?us-ascii?Q?1q4Td65SXnITqxtu5ieeebh6qEuGBvpM8jY3Cv3WTizVGjo0TRiCk+5hC/nU?=
 =?us-ascii?Q?bJBTMJoJ7iBv2IC26aWtdaH0qpw76IWj1UsI20Wqgzt9ufo2CwqSKDpRLut7?=
 =?us-ascii?Q?4jKN4CeE6dICGlubTw5CkCPFihw7uwxzNCFdflFqooD0LcA8A1hs7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N2Pv2gftYHBsdFLGba5EhyUC7ceiA7pll9NIALxgThTMpL8Cu3VI8aPB3UJF?=
 =?us-ascii?Q?PX2BX/EkUY2FrYKOZhNZ1EQeSjdpkmEz2Cft1TRgdeKKRXH9Wjnm6uPir9Zv?=
 =?us-ascii?Q?DkKxqSCLSaDCFcAl83Ykt6yERwwEnSwr350ZU8F3xv96LYSXg7bgIWz70JZm?=
 =?us-ascii?Q?8AKY+jLRahNBQ4DoNTHlkMXBgc7zUTtzgdgNOHNquuu2o57RluZiYQQ6PuIN?=
 =?us-ascii?Q?nZZ0nGQD5ZJwO1cpBQzbcFOfPbG2fcaNNsIvzBqHCy4ffYeJkO+OoqY5n+FW?=
 =?us-ascii?Q?mB0jQzLyigDVxTOYwCuJq6+qkjS2aGPKcVwTd7mrPUr7KiarBetjCwuMYnkR?=
 =?us-ascii?Q?rWyAeY6E4/b6kqNV/X7CKSvFwqRx/BzT3zut8YQIYkNTxJmTSU9GSzAc+fTZ?=
 =?us-ascii?Q?bintwGhCk4AkBScHlD1CiH/IOAiWnf+8CqeuOOQbbNkmWOzDM2mAxLZXt+UO?=
 =?us-ascii?Q?n2X7MauoC/io119Je6t+RFHmA9M5gDjC3KSTSMeFVP7UruyqsLEDN0Q2f5kB?=
 =?us-ascii?Q?H17npFEdjO+SERe1cNwtliOOwE8yY6k6jKjC+BtKIj5/60WYhLKakZ/f17Hu?=
 =?us-ascii?Q?ORVlDnUAFa4IhPupIgSEuykYdyUaU2wsL/1K9C/s7z02lLazF3XBhy8cXUoC?=
 =?us-ascii?Q?Zx4IDJHlWItjKHg37pq3hRFovrqLW0wyp/ycyJcie+Vs3DMOXm77Ukg3b8Pg?=
 =?us-ascii?Q?Q91e9P28w55j9DYHE8cq/xxK9HynUwx2OrQuq3XofG5iaF2dra9qe0ELpCTv?=
 =?us-ascii?Q?LAnIX1tfxM7oTCQxQ87pmWfJEevYe4lyQxKYITG/uFtBniXcSYVkeYh+/jGP?=
 =?us-ascii?Q?Be71hk1NXRfDVdt1usYz8j9J7Qvv+1/CPsA9T0GGmElLj6MlIxJIWsfsmhXB?=
 =?us-ascii?Q?J8xT4BmCejbDEbG8YP1Y4cazJo2uePIZEJR3teDzjbovn5eYBemWA/OxXXb1?=
 =?us-ascii?Q?/iu3pQbg+hZwO3pBysgfA4e6n+0gm5MdDeTxOM9DydQxJ4r72qDJudt+NTz7?=
 =?us-ascii?Q?I5dxYDhPrKASDJsytZuQCEy/pBdMbSLJY8KcGdC1pqwvLnQ4YMQ0i54JDdHX?=
 =?us-ascii?Q?+asCciLn680MgSfpqUMWgDkD+XtX7kxku9s9RxDMY6qsS+Q2TrBbaeffjE0k?=
 =?us-ascii?Q?QMUqpk0Ly/lX8E63ClbAziLm4nhTY1jUnfES5zWzRrbu5Krsz2uJwBApo4r0?=
 =?us-ascii?Q?iTVlHKFoFA1qoqFlWeZ9WLIxKRKRCpvN+7eAZSUoBbUrF+Ppb/1RBizhFd2q?=
 =?us-ascii?Q?/+kQvM+labpDCSJl2KCt4vZ+WMkSvVhxefnLDSvU32T3k9Eb9houtAMLi2jg?=
 =?us-ascii?Q?fX3n+OzHUGfklnUbJr7pzvR3h8DynM5kCjYycYUg4dykfXIwwk2ccucgmJeR?=
 =?us-ascii?Q?7USPQzIUocXvt3hABEWpl2EgN/calt/SKtmQi0xKoGTr2rfQfawxDycEbBzu?=
 =?us-ascii?Q?I2AJKraKAuWfA9kc2vsnrQj0MGcAIvM+6haJM+Zmcrp7MkiwgmDG0ewU1pgH?=
 =?us-ascii?Q?HcaOQL683SbpAQoXAIoPoCG2x/2EC5+B1FnrrwPZT6hI3vY7rcZA2V20xjUL?=
 =?us-ascii?Q?UzIEu6YSPCkmweRiL3CYPRCs5U0WFl/isM1j5APW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 585fc445-c9e7-4901-def9-08ddb363e92e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:13:05.3174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9yekjXZrnGZ3om2tYdiJ2IbH3RUNzX8uKHU77AKvJUXLpZ5jAMTpz21xdE8QsdUjb71d/uIcZfBF12Dmv6hxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6789

On Tue, Jun 24, 2025 at 10:30:42PM +0200, Wolfram Sang wrote:
> On Tue, Jun 24, 2025 at 02:08:45PM -0400, Frank Li wrote:
> > On Tue, Jun 24, 2025 at 11:06:04AM +0200, Jorge Marques wrote:
> > > The I3C abstraction expects u8 buffers, but some controllers operate with
> > > a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
> > > reading or writing outside the buffer bounds, use 32-bit accesses where
> > > possible and apply memcpy for any remaining bytes
> > >
> > > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > > ---
> > >  drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++
>
> Is there a reason we don't put this in 'include/linux/i3c/master.h'?

master.h can be accessed in whole kernel tree. The scope is too big for these
helper functions, which should only limited to i3c drivers.

> 'internals.h' is used for the core only so far, and '#include
> <../something.h>' also looks a bit like a layering violation.

Not yet, you can look driver/pci/controller/*,  which include ../pci.h.

Frank
>



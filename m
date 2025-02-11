Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012029.outbound.protection.outlook.com [52.101.71.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2300479C0;
	Tue, 11 Feb 2025 02:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739240821; cv=fail; b=hVq63gd7r17niWCTZvE1UFm1a4iRwRHKLG5xyVKFKdbVcPA8qpcllC+mBjKLaqNS+qtLFTCQd/w0vqzB6c0PlEm0veklHsZ92BHU3+h+mb2uOnmXn+5B+M4ZDi2M1X9cq9+SzCZm2fHgploNxOlUaBaaHcml2tGzlQiVj+vCNQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739240821; c=relaxed/simple;
	bh=dgqnjUlY4XUmKai+/lVwMej9/zYVx2DHPd/gIBYiK10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u+/RlqPYq8VBjfubWUDI3JurUi9mPrR4mg1lUmj6zBtZngdYmIcYdoYRvuozyM+CY6qhtHjyB+LnQbd3FO9ZllIkyRcob18sERDstEdlOvZDgTzQciERsFnP9nMpoPZvD1uXNII6dd0YzXinQjahQ3M5JeKZGq3AhgGFDQLRnwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wl0fQUCl reason="signature verification failed"; arc=fail smtp.client-ip=52.101.71.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wl0fQUCl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQwORX0dWJkTl2Ls1LgKo0YLsxnmTcA5c7YzS4BN0ugcrJCjoBWdGEp6JbrVjBkrcoP+ikqVddZmI6juNgQLcrJrixZlgupzkdQf3E00uq3/Jyz13YvK68qz/qHZ+HVK6SG6mRkNZoX+RQz+2yRCPNFUs0SiYsnKWHPnWHhzymA8YcVMwA5Ma/mqalzZlsIJx4GQzdE3rZZBcCMSCXlglnR73PWHZS9dPKh6/fl7eCKGPZLGRzMZHQElGF2oT/rEeqvz2ZGsIDVbC7KTWWz+zM+EIL2MTCFFdothXLAX2yHv7JjUyXnohne6bB5jrOgTquKZGQyvyNY67HDt4gW0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3xfzKZGh/bqDqYfmtTs3nSe+MhWn/N67NkSJhs+OtA=;
 b=rHxk58RfJk6zpM2kb30AgsKddbLIWfhtEcZfseca3O+JnMiw72Ta+ROtyMwmwelnxDnOyAGVzTL2usOeG2a4axdQyAr2/w7hinKs+NpJ/Jz5ftEfJTD3fjyd0MZuq63rXt+DKeuSrdL0I5mPxwgw47vIP9La9JtWkoUrIzs0WfBZy6xr+iqUNfgH8j2YURW0UYKqRlxBoNqMLXj/kpBZ1MVLFuNzZroMHeV1wxqqbExtwoKed0ZeVMng8mF/k1a+gsfUh6yNKka+dDZf4mwbIZj3el8JZ2CgijBsJ9FlgL+DYxGy5OXC7VAxxWxq+BKKCH06XCJZyKS5e/WcHWp+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3xfzKZGh/bqDqYfmtTs3nSe+MhWn/N67NkSJhs+OtA=;
 b=wl0fQUClDieqvsZPQTzKM/JYi+aC8DwWTWsgoh4/dQa2RUddgsEVYL/q6lRm2ckdW/bG3lntB4ZdH8E0vT51O7ff9uuPHJpUJHUntexUJ8Txvbe3AGH+tN6sII+Ime5sNl1Cx/5gVHefguFbFrM25S0/jlnKMY3ioj0g0Fmeco2LxUDOJ6p0Itj0iwjsHHmxGnnQ/uXT6aPVsFPL7XDCH/d6xIFzBfft2zz9/laKAc/omA8dlscjcnd/c1UHI/WyBR2E5iALmf7QXYIX5uq8rra/W54Ewx5KmMaNa+YTk0hUtDvxrWmuDJNkSHTvYOi+TZk7TkHGemOJCNSBG1vFOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 02:26:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 02:26:55 +0000
Date: Tue, 11 Feb 2025 11:33:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller
 references
Message-ID: <20250211033340.GA13109@localhost.localdomain>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
 <8037692.EvYhyI6sBW@steina-w>
 <PAXPR04MB845912F48DC37B6BC599313888F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <2222299.irdbgypaU6@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2222299.irdbgypaU6@steina-w>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ba2413-2c92-488b-b8bb-08dd4a438d30
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?L5elgx/MctpHDXcZN3fVNbTGp6b5Zx/v/5EGmUxv4K1ie1IctphvJb+S4M?=
 =?iso-8859-1?Q?UADX8kTZMTRIWcmSAJz2gXxb5/Al6T/3ZP1vKDdSYU33eRzDQp0ecPN4gL?=
 =?iso-8859-1?Q?CF/4W1Xp9a+aKhmxeEeycIJ12H1+Jgljx1gb7p4BlkwbC9HKc/tntSZCcj?=
 =?iso-8859-1?Q?9Ous7ZHEx2idHOx2jOq2vfGfK2ehk8HruaFBrI9hBEwNWJr0+awgUYwIc2?=
 =?iso-8859-1?Q?aEqYxF5tRlYq8vXlmKDMIaAPqkZi9qMgX61QUQ2+tn0moOKqP41h2bLYQd?=
 =?iso-8859-1?Q?h0XFZLT0wKi4RlM1rufkoY7f1m0Y2TInK27ZZ4UCoRept0jiaCHsCuSfFN?=
 =?iso-8859-1?Q?yNuPQDUvHhimye/JatY0x/mAZjtcY91M8qdNfNWPNTaNFGEuIk4bldhFrI?=
 =?iso-8859-1?Q?P345CmdUlFsXqpbPYBy9fYTXHoM1ci+J1kKO7LZEx4MTApJCQ8wgxvi/q8?=
 =?iso-8859-1?Q?75RpshXJHFoTMCcqwRyCFj0uRsPdb1bAKX9IF3RAojHkWoDijDer4LLGf7?=
 =?iso-8859-1?Q?w80JWlNXpS4eHuc+8SfM4VH15K+jW3jUwpnss0J4I64k+n8bgrhVaIPLVY?=
 =?iso-8859-1?Q?UhZY4mwuPSITrt8LqgDVqH+z0PA3mAYSngJyxsWKMm7ltLO2XdiBUZqRpK?=
 =?iso-8859-1?Q?t6A2mbkyp3PLZHbVIGLKK1bkOi+9uBlsqfr9HPF/zE284CH14j8cnS/1HR?=
 =?iso-8859-1?Q?1aVr4bS9I/g4Vg14Oq7SDovcAjgaXxEYMWc6+/Rq7qUJrgW/+KRZXcEGMA?=
 =?iso-8859-1?Q?Tldvs1bSEy4VK1if2zjZ9yn+sO5ceLsTKPs0Ccd2w4Zm6tL53VjpUp6h/B?=
 =?iso-8859-1?Q?WnePfJMC6glYm2Uw93d+6dDEIbNNhZwR7m3BnjUZPhjKRHNgqczugDaFao?=
 =?iso-8859-1?Q?UXPwA3v8fiPAbxpqvuidyE5eDfIYAzPxeLUgQafEqZN8EYbUTy6o9nACk+?=
 =?iso-8859-1?Q?APxpnBgGLXadNNSuWDzt18GlFA7JHicjfC89xFFgEd80lIglFiQC0ewzMW?=
 =?iso-8859-1?Q?1ujVms+tWPp41XG4XTiUgqiPAt3moY/kgZUTxHvHcJszcaBVyrBobcnqdf?=
 =?iso-8859-1?Q?HuyXhstoWtkaMlpSLwOKZyC0FB1N5ZavjLTpt3zdCr/1VSfhlGMlfM7wlV?=
 =?iso-8859-1?Q?gbxS3Gp+o9RzJjIl//n/zwUPR4x+JIZt3hmOxJ+gm07946ev9GBj0Vf6yD?=
 =?iso-8859-1?Q?uAFPsRZ1R7bWhEWALTEklfyDm/36C1YpQXqq1GiDpzimWB2R2nQWKcDUW+?=
 =?iso-8859-1?Q?dACz+liwELgk+qdZxWPKWkx/G2VU3W1Eo6dGFy166SUrKBkN8Z7/XfbIHh?=
 =?iso-8859-1?Q?G2lo2MYnyvircdTlBB8ZNzi/C4RzbpC+W/fsUqIBEiIAxeaLisizMFEH3Q?=
 =?iso-8859-1?Q?ylv+0GtIJsY4CJ94rBY6Z1oMOv6O+sYRm6nOiIc6/jCHkXzck66he3WTh+?=
 =?iso-8859-1?Q?nGcGUEb1WUne2nqx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?hOWVj0cBTVOfa659fpR4quYqPgOLSserD7VXQ7Lud3vDIAtpHqVTSaPien?=
 =?iso-8859-1?Q?m2P+CwqYpcSgYPO+X689bjU0XtuJ3hVaQ34e2W7BTXkutm/bGN0DeNsCGB?=
 =?iso-8859-1?Q?tbdV+L581ZE0vSVREaHw52OhnIJUDlqQXEDzJkFTg9DhOZOOJYnDgUQHAo?=
 =?iso-8859-1?Q?TUCw+93esQPeSlEH2S1P4QMiArJui9I9quVTWw+LfRlS+JSuLoc0gQd3Lp?=
 =?iso-8859-1?Q?Q6mvJ645BRw9U+sYBFOFBWXS2N3OUreY5OLCyVhENP3RhyyNqJIbe92F15?=
 =?iso-8859-1?Q?qMdPJ7xrWIBKtmDY330UmWUZsR6rgtY+EqNV/lX3M5KE5OhZtTquy/wxfX?=
 =?iso-8859-1?Q?zGwJIEmgHAm6AU1A8k5VVhej9iNKZ+KZ27dCVdIAsUR3zYlCj1MGwhxV/T?=
 =?iso-8859-1?Q?CluQlUGLpapNxbG84ayZZeB+rbylTazWc2Iihd4RL+X9MOjWhdab/R1lTW?=
 =?iso-8859-1?Q?V+r5sCTQWSfdwdVP1tUTtdx7dGy0ynD+s1HPgUz/9dn1o6l4ZfPorqCiiI?=
 =?iso-8859-1?Q?DK5/Jv+2J/l1fhxqBhzGQK74tgEQ+n8vntESj7XVMJlyjQejeQc1XA6Q9u?=
 =?iso-8859-1?Q?OE7XWF2R8vp/EooJ+BzmhlC66fgJIZin9j5a56JqjIhkrenzE3Al9X404i?=
 =?iso-8859-1?Q?APLnuF7dauFNbo2QMsqx+HR159lHGQlXxXEWebG13F1sswXAvMKFgET4gF?=
 =?iso-8859-1?Q?TbnQ3rALMZ5wSTxeNbJ1wkVIctOqM+XINpvlv4skMX5biPPAYORv0Ku6/x?=
 =?iso-8859-1?Q?jLmzdYdSZG0MrSELjZALVXJwrqFb13BBCs+ACsNZZxxBp0YWRl+BfkQSOw?=
 =?iso-8859-1?Q?i87xG5QbLsOLDVpG1C7QRKHe+18wDRgcoS9P9Zy20c2x1CMr9d5Z/5vSXf?=
 =?iso-8859-1?Q?tMZg3L/I4Es7I6MQCr9J8sQuASFtKTzoE7P/U1gOcvBoXQ6N5y2L+D9paD?=
 =?iso-8859-1?Q?Du6AvD5JKTvZyxXhqknIc4/yItFmffkdzqPLnbcWARGBaNUalWv2EKK+ei?=
 =?iso-8859-1?Q?YfRxuXB0gQ0zb34K2kquwfPCdAP2H+6aPkogcmN1bkm9GNNyDyqKZn/R/u?=
 =?iso-8859-1?Q?HHqlPF+ljjA4YuFBk+9liQbUUlYR6iUa13XxlHg90VQdhVCxqy03Iq8uOO?=
 =?iso-8859-1?Q?7fFvzQ+yQIQMHOapRg/ybkIK2njA7G66syfWWtaa7jh5N67wwzzsaYXNXa?=
 =?iso-8859-1?Q?bRxGomUoizzJ852DXoXK6lrltIhWmgC3aNIlP8C0cKbTiDEwUw+f/T81Mf?=
 =?iso-8859-1?Q?1PVFKZ+SQfhagZ0ugtU7rAN/COTE327AJHTyFhI/ea4fBIxJ5JdqRTP1ZG?=
 =?iso-8859-1?Q?0m4EHM4fbmyhfin52WqopEfdYa+66gxvA3TXv4qjpEF+VPO0LHGXLOMpzO?=
 =?iso-8859-1?Q?fqpIQZAzwlqEfIApZURbi5DCE1bJb7lKEnoxjgv2Yhvi5kDTvXzJhxQ++w?=
 =?iso-8859-1?Q?255VoauCVdEJYB0x6M2liXyrdeBObAIIRGIkphPnI7hMkTgGv7DOlG26cV?=
 =?iso-8859-1?Q?yNvYfOXM9Cu5j2045O9pGJk6RRB4GHF1SvpYrqX65QcFzfuqvZ6LC0Yvji?=
 =?iso-8859-1?Q?L43NoqMd7naVfHDmyxT9IX2BkMtT7wr+o66CrX07YVotvFjIz5xy4mIAwY?=
 =?iso-8859-1?Q?QI8v7ijzFU/KoW7qdkUAwyXqPyjOsuBy/N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ba2413-2c92-488b-b8bb-08dd4a438d30
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 02:26:55.2061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5p/owOoee/FHzlWTQW1qC1bCpPiv9dD9j9p1otgzjHB30Pllr+uaGC7l3wqehbUwWJDbCXc575xXnJY+jkjGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9911

On Mon, Feb 10, 2025 at 04:48:56PM +0100, Alexander Stein wrote:
>Am Montag, 10. Februar 2025, 03:36:48 CET schrieb Peng Fan:
>> ********************
>> Achtung externe E-Mail: Öffnen Sie Anhänge und Links nur, wenn Sie wissen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten Sie die E-Mail im Zweifelsfall zur Prüfung an den IT-Helpdesk weiter.
>> Attention external email: Open attachments and links only if you know that they are from a secure source and are safe. In doubt forward the email to the IT-Helpdesk to check it.
>> ********************
>> 
>> > Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-
>> > controller references
>> > 
>> > Hi Peng,
>> > 
>> > Am Freitag, 7. Februar 2025, 13:02:13 CET schrieb Peng Fan:
>> > > On Fri, Feb 07, 2025 at 09:36:09AM +0100, Alexander Stein wrote:
>> > > >Mark ocotp as a access-controller and add references on peripherals
>> > > >which can be disabled (fused).
>> > >
>> > > I am not sure whether gpcv2 changes should be included in this
>> > > patchset or not. Just add access-controller for fused IP will not work.
>> > 
>> > Well, I was able to successfully boot a i.MX8M Nano DualLite.
>> > 
>> > > i.MX8M BLK-CTRL/GPC will hang if the related power domain is still
>> > > touched by kernel. The pgc can't power up/down because clock is
>> > gated.
>> > 
>> > Well, with GPU node disabled, no one should enable the power domain.
>> > But to be on the safe side I would also add access-controllers to the
>> > corresponding power domains as well.
>> > 
>> > > This comment also apply to i.MX8MM/P.
>> > 
>> > Sure. Do you have any information what is actually disabled by those
>> > fused?
>> > It seems it's the IP and their power domains. Anything else?
>> 
>> In NXP downstream there is a patch for  drivers/pmdomain/imx/imx8m-blk-ctrl.c
>> 
>> soc: imx8m-blk-ctrl: Support fused modules
>>     
>>     For fused module, its pgc can't power up/down and clock is gated.
>>     Because imx8m-blk-ctrl driver will pm_runtime_get_sync/pm_runtime_put
>>     all power domains during suspend/resume. So we have to remove the
>>     pgc and clock of fused module from blk-ctrl DTS node.
>>     Update the driver to support such case.
>> 
>> But this patch also needs U-Boot to update device tree nodes,
>> I recalled that U-Boot will remove gpc nodes, but not update blk-ctrl nodes.
>
>Does it work, if we add the access-controller as well for pgc_gpu3d
>on imx8mp? There is nothing in blk-ctrl AFAICS. But for VPU there is.

Adding access-controller under pgc_gpu node will not make fwdevlink
work for the pgc_gpu nodes. It does not have compatible, and device
is created by gpcv2 driver using platform_device_alloc. Same to vpu.

>Which clock needs to be removed there in case g1 is disabled?

Take i.MX8MP VC8000E as example, the vpumix blk ctrl, the vc8000e
reference under vpumix blkctrl should be removed, including pd and clock.

So for non-blkctrl nodes, it is fine to use access-controller and rely
on fwdelink to defer probe. But for blk ctrl nodes, it will not work.

For pgc nodes, it may or may not matter, not very sure for now.

For blk ctrl nodes, we need provide a generic API saying
access_control_check or directly using nvmem API.

Regards,
Peng

>
>Best regards,
>Alexander
>-- 
>TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht München, HRB 105018
>Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
>http://www.tq-group.com/
>
>

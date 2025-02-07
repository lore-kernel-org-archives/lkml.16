Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2085.outbound.protection.outlook.com [40.107.249.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A841194094;
	Fri,  7 Feb 2025 10:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923587; cv=fail; b=R5E31gDO3DA60xzZQtFEWB6DlYplzCcsn2BQez2YTQ5nZ28JMWqCeCTBIxMkU7TM4BlvZ1eTE1rDMcYM2q092qc7kdrmiDmz3AgNjzv/q5uTeDhcSBxu+ghvejPTaeoDXBMZIxun2X2G+7iocYNyG1H8agSJXNwHS4Kvy5zXvW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923587; c=relaxed/simple;
	bh=U6Si/PC2go0eAGkL8s2+FOLvbDMMR+QJ6yCtfql6luc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yxyadx7H6N1sOfxNd5OkNCTT0IGdUOC/2ElNthJgj1j+Wya6BwwGX0HpZzy4JLiIpA/mHfAO5KbWBWJpCKI98rKIxLxOBbeWDx/rGzeS+Qqt4KVTJmwrfOZvlEsSvah18sIo+UihoBl8iqmMebv4CusoApUZsXz/wnZErkAsJaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B9WBMg8w; arc=fail smtp.client-ip=40.107.249.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B9WBMg8w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWSBuV3HjOQbV9YZGFPqYfvappZxfxVlFV1ZGT519h8kZHo25WYRe7UD7dEaXU1qjfAv1TXLA6qzeWaW1j05FSb6cdBN54Mn3IY87a2AoMll/JD9IZJKXxNJffvccm4mCmHltzqVNr+ptxipwquXVeI6NfIYNoMyQ93/pPCjQLUC8MImZP+M5eH7+5Z6XO4nIX/dbKZ8hGZeFentCn274ndc7dQ8m4RMTztb2y8mpD+DRLGeSomfz7eGBQuT7x013kyknIUlNPeYo5HNP2vC8h4Cn7aTbOvWibsk04KSowtR8aTkIsfpHKjJLqW5uVEI5cWpURN96mDL8Av1vch9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72Ei9PKG627lJ8Vkr/gY1DUeCNRr+iRuRcd/SUWL8+s=;
 b=SbXoYh6/L1AG23gXQzCBZvILLNvDs/3r0dh1YxhRYngvbAh0qAwOxepvZShYo4NhMBTWMxLH+2snTdmsF/eDOosAEgNtJLdso0wfrwatfrgfpDSf9R8YxdYZknHP5bVUEQMIcr86hb+Gk34Bl0cZUhMrs2BdbeRJXAc/lk40jDrC4gGkizB2fvs+hKC42as0C5fFqMA7S+ncB/eYxgpsUafHrSRimvGJ1Jn1868yIPuDTjsvovj6AFidyggTMR8x6CWwvGCldOdp+3OWOCXv9ad7/PrRXAmaEewouKMpcaM++E4faFwqifqCxlETKA1SzqOmrFXWXyzusMfOY5jzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72Ei9PKG627lJ8Vkr/gY1DUeCNRr+iRuRcd/SUWL8+s=;
 b=B9WBMg8wxlTE6mvzQ15Ag+Dq+ptuI2sCkrwUSitlcYumL0j4Dv3DFWDjlzrBCzuJPBsr/ISrxNYIVcAmTHpIkqrVtH/6tACoXZ+r6ED7ySXci07tntww2oHgnaUCthU7Ln6FACESBcQb317P0HJ+kyAkWqcL97tTAVwjL2VfHnv8P13VQ6uhGnq5V2FTKhkLiXHvP2n5M69yRmbARJ38xaanOX5ie7RI9aZeHlf+DrA8WGSarJBdJs2P8wQxG9PmsGUUiin0SiLX9IO7YBCx1LbhrzvNVAxb3vhWaqgjPuZJ6VGBkMqRpRHABdEvJcWTmyxY4rTkpY0lRGyzV2KB4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Fri, 7 Feb
 2025 10:19:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 10:19:40 +0000
Date: Fri, 7 Feb 2025 19:26:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <20250207112622.GB14860@localhost.localdomain>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
 <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com>
 <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CABGWkvrKe6az5XR=MvdMwBOfeXqd5yPoF4Yf4pqyyGPD4Kpvpg@mail.gmail.com>
 <Z6TgesTZklGvmI56@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6TgesTZklGvmI56@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f7360a-0545-447a-4b70-08dd4760ee7d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QaK0h9/i/famw5NQ6tdDzpDaX2BU+rbAWIOG2OPgvS9zrHvMoJPdeRNBVDaO?=
 =?us-ascii?Q?Sj6XjRhK1/fo13SjIFKRvccxugPIQHdC3t18trN2ru9di9i71johFX63AY/k?=
 =?us-ascii?Q?6RrRa7/O8TBn9VzysOAY3+HLa4UHsJlwjbekqRUOPYdNX7NGHsc5r1i1pGyj?=
 =?us-ascii?Q?SeG10Hc1s1VsDqU/Mx9ta4/i1Sk78W07JO8FrQ2nlgaeJ5fAm0dzbMRvdlAh?=
 =?us-ascii?Q?1mwr0VEN/f9nqZUZkWvxMfxk+GRfRXl94g7XpWoJnu8gHWJiZrezqJ4Can4X?=
 =?us-ascii?Q?G/KNTXogjwjjjdiOS4D2ZZk6Ivan53j9sGdeUcskLQ7oBTbm41QbsoqTvQDI?=
 =?us-ascii?Q?Dt31HjdZEMvG1EY3O7o6jNxtlNZcTHLeaNoICEtQ9wda5am3MQJnjYXCjiIf?=
 =?us-ascii?Q?WofknL9tbHRFHGBokxjjYUGGs8f4ou3bvwfOwp48zYGgT3kPmfcxM2NVW1C7?=
 =?us-ascii?Q?YWfL+5tInPnW9SKRQ2znBREDHaCh9GGm0xFGux1vJaig8Msqi4L18QPW3msz?=
 =?us-ascii?Q?VT7mDkbqhCODQWk56nFljThujBtXp37sE0QRi5q0mtGwzs8YPwvLViSn7nUb?=
 =?us-ascii?Q?fVbMix1/ww/FtKDYJU56yLeBxkzNqSuIuxsVBCQn6pwgTjT4kscbHqi7QUGS?=
 =?us-ascii?Q?BAUCE84m7QLM7HUgol5vhO++zYaO0uQ2ju5cNISpxoOf/+xG7v8kk6Gk9AzP?=
 =?us-ascii?Q?GqpRSVXOH7sdQTtoaKGn2+n6HDiE0WbIwYEzcqQrNOxAF0TSLERU8j9IeGZO?=
 =?us-ascii?Q?xtdVYC+o1w6rqfkFXPAYFKMYAmJioHcYqulJX+LjvmoJyb5jbEc+qWrn5+34?=
 =?us-ascii?Q?B1792FlFl+9Y+MCrtE7zQDPPR0O2Bz2AwdoKDd3ZItQBN87vGFfrJAvbKhaZ?=
 =?us-ascii?Q?aHCsDXgg0nOCG2Z6Bbqx9bv4VAHydCSxCRthvnto9kK1fDiKWy7J7OcW4dTR?=
 =?us-ascii?Q?ix3hWQHrAEx89XK97ppHqE3IheXe8DrI5+i02PPsig3I8o7rV7q6BvUWIYLR?=
 =?us-ascii?Q?GNrbkgtkkR5OT/cnxqgB0t7S2386qEVBvm729p2cM35drY0KNHdJiD9E0Hk6?=
 =?us-ascii?Q?/YVVhCkEuIBT/dRf5qZSBzX5kWpNczlfPsHMeJI5SjqyiS71ZG1kZ2qu4R0u?=
 =?us-ascii?Q?0lToCf1zLSFIpfMM3t7u+VjBnRc3QlIovhUx1c+dTfnJcthP8lTR25TeAgug?=
 =?us-ascii?Q?paTYdTngCf84Q4rHeq+Ro/+c3v7MhAr5G/JGguf/ouANqhJhu78iYxSI+RSO?=
 =?us-ascii?Q?rZMcV7TU45q+GHDUtp26sdoKeANJKTMO7aZXKnj/iGKrBvSeb6GOlhnj+yEM?=
 =?us-ascii?Q?q00NWWI8Q2iwwX/N11Rn1h/6ZuwxFTYOkkRYFTcb6AteHUXcP51PGWdzy/Ds?=
 =?us-ascii?Q?QBhyFF8HB/qcWKOsE5f38MC4WDwrSZE6mLHdwnTiQUlOG0F9MNUCZYjlGmNp?=
 =?us-ascii?Q?zJqAwH97NR8Pn+PRdZ8slwdjYxK4tbQr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WoVcE+47aJHvxdgBQ/k+aSlA1joC+N7R2o3LetwJn5TtwM7uwajWVvzIq/Lc?=
 =?us-ascii?Q?+tuen7YiMK9Txo1bPcIlNgZ0zV7XcoEIyjWayMWMsW0GBc63B1J3MChBZute?=
 =?us-ascii?Q?wwxYUz39ifY339jZ6g0bdRJEwn8xeLDxomThh43P0A6hrY6yuvvhii+36gjB?=
 =?us-ascii?Q?+quJG70fD33O8z55udXgzCQZLc0nzzc28QFpk/g5cv2nwCJcBpeBfniXFUcO?=
 =?us-ascii?Q?EmkdgcZQ6pAsW7qk+bka6iu6792jXzkD+7fpJfrVD9J5T9eZjLpRAkfmcnZF?=
 =?us-ascii?Q?L/VE5YgcLLoUiiUXvZZX6smKtt/2F5J3aEg6WIxrxFv8RADZ6MgSuI1Hhiph?=
 =?us-ascii?Q?4vgIbrxSOD8a03mXWo+HTrC2GpGhBPaAq/d9XkRSEKgc/EOPatFFDVHMJ2/M?=
 =?us-ascii?Q?j51m9bhyFVy4yL2ntY/gU5DAwKbrnd8WXEhh2KYUlmYR6YHRQWLACURI+cDP?=
 =?us-ascii?Q?XM7Eon+dX6tRRnGeUFAlYZB4hATw3pM2qpPQ6Mi9gDJjpkNk9qUSRBRb8B1U?=
 =?us-ascii?Q?ql/0wn1JY2N5pDJZvQ94sAGQLN8BO1xfYAKUmBMR8vsVtdKK5VWSDm8KnXh+?=
 =?us-ascii?Q?HdHg3P2Ai8DoMpJnDO3So3TjIvJgANBS+hSRtdFqvbnK8gg1/BQHEEI4ES+5?=
 =?us-ascii?Q?lE3h7AcV7/xQAxh5ITeBE6RgyGblHl8SuM1KV/R/B/hoMMHaWQGQRNGt0cWk?=
 =?us-ascii?Q?d/VNS/E7RXSDhz2B/YwKWA1jviuPDZCM68GswFd2Q46i4j0A9WebZlHNGIV3?=
 =?us-ascii?Q?cBR1CBxqX85ym0I9r2VwY4HSxvEbAn5J3beU6JCgemdawAwbd1bzNQSjfLzk?=
 =?us-ascii?Q?kZ1QZlVJv8M6X2Q/LCGs8AhbJTc+b0xbquBHGzJYMFIc2QlawhBdASnu8LIs?=
 =?us-ascii?Q?/UdTVMy2musbrwp59IoCFZUzodGFFZCevH+Ve8KzslJ1dL6saJTqdt2OISpe?=
 =?us-ascii?Q?ShQtyS3yODJm8cJGCbOv2RhqGAQc8HwuQuDRUDo4itQxe+KZ8HgDWOe1UYrZ?=
 =?us-ascii?Q?r2R9wFEQ1p7Cs93EwJ/C6bsk7IzgIBH3LKNA5+XS9oG/VKgr0AXrEXTViISZ?=
 =?us-ascii?Q?i6z67smqjIIT82IiP7AyjDtm1qSMmtznFiwTNFFuPcS/QJ3A10JbVS1pILoL?=
 =?us-ascii?Q?oCvbzZOmqoDStg8Kf+l4z8aqcRpNHfOueQCF2T58GFrRnESJ7W+ynik7Ckt7?=
 =?us-ascii?Q?Vyobkn4JfWStYiGHl1IGsRgtNn3b4irtCK200Q5s8xt93Yymhr0morT8JEHp?=
 =?us-ascii?Q?FyBH9qPb6SL/snJqCkmjQgSVKLCGEcEP4qcsXJDU0KARUtyihjg7QrOAkNjK?=
 =?us-ascii?Q?irqgfjq4M+YT0PKE74qk4tjZ/p3BLufNC2mmM0vtk71HVJqXQqyYZveM15h9?=
 =?us-ascii?Q?sHcMbyBqe/aKVmfDkDrRzlwITJDaPhnWL7NsorHmN0s3o2XccR1mrrmtHA5y?=
 =?us-ascii?Q?ge8WaN6tMvCDORHfqVo4KkGY114p3WdP2fsD+reH6PGjVZDjVza5tOVk/zEk?=
 =?us-ascii?Q?/H2UfNmE5jUIGHJiSSP4g5WysCwv1UUW6B4RgK/ECj4fQDvXRh3ymbq2D5DA?=
 =?us-ascii?Q?/oTjRoKHyueyNRZEBNMIzJxN9+F20TDhRAtTQme6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f7360a-0545-447a-4b70-08dd4760ee7d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 10:19:40.2729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABoSsP78qu56nni+5leJRREnBCeA3sejgnaEShtaUWoSVt4JntDItzYHqWCOH+ui2eL0XF953COD48KiVQ6uvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

Hi Sudeep,

On Thu, Feb 06, 2025 at 04:16:58PM +0000, Sudeep Holla wrote:
>Hi Peng,
>
>I apologise in advance for exploiting this thread to make my point.
>
>On Thu, Feb 06, 2025 at 04:31:46PM +0100, Dario Binacchi wrote:
>>
>> Sorry if I miscounted the lines, but here we are not considering who
>> actually implemented
>> the algorithmic part of the SSC management and all the time spent
>> testing the code on more
>> than one platform/board with each submission of the series for all 9 versions.
>>
>> [1] https://lore.kernel.org/all/20250118124044.157308-18-dario.binacchi@amarulasolutions.com/
>>
>> Your changes, which are unnecessary for the clk-scmi.c changes, only
>> serve to support the
>> DT binding `assigned-clock-sscs`, which, as Krzysztof also reiterated:
>>
>> https://github.com/devicetree-org/dt-schema/pull/154
>>
>> you should have proposed during the review of series [1]. You are the
>> NXP reviewer.
>>
>> >
>> > If you think it is not fair, I could drop this patch in V3 and leave it to you to handle.
>> > I take this patch in the patchset, mainly to ease your work and make
>>
>> Sorry for quoting Krzysztof again, but:
>> "Three months iMX8 patchsets, multiple reviews and no single comment
>> from you till January!"
>>
>> So please, if you really want to ease my work, then remove this patch
>> from this series and resume
>> reviewing series [1].
>>
>
>I had complained once in the past. I am repeating that again. You are not
>new to the kernel development, yet at times I get really surprised with
>the way you manage your patches and create so much confusion. It gets
>extremely difficult to track what is happening if one doesn't follow all
>your patches for a week(week is too lenient IMO, you manage sometime to
>create same amount of confusion in just 2 days).

V2 is actually 2 weeks after V1. So after addressing the comments
from Stephen and Dan, also updated clk-scmi.c to use a non-vendor
changes, I posted out V2.

2 days, this is just after got Cristian's comments. Then I posted V2.
I try to follow your working style on handling scmi patches, but seems you are
not active, so I mainly count on Cristian's comments and update patches.

The i.MX pll patches in V2 is orthogonal to clk scmi, I did not expect
complains. But ...

>
>And as usually you ignore merge window and post a whole set of new series
>on the first day of merge window. Which is fine especially if you are new
>to kernel development(not true in your case though) or even otherwise if
>you don't regularly track upstream cycle so much because of corporate
>commitments(which may be true in your case and I am fine with that). But
>you need to wait at-least a few days after the merge window so you give
>every one a chance to follow your work.

In my view, maintainers have patchwork to maintain patches. patches send
out in merge window will not be reviewed in short time or surely not
picked up, I understand this. patches could just be marked new in patchwork.
If new version is out, old version just marked as not apply.
And I use b4 to manage patchset, and each revision has changelog.

Indeed I not track merge window since I am not maintainer role. I was
not aware this would introduce complain (: I will track the cycle
in following days.

>
>And in this case, I would have avoided scmi changes are you have non-scmi
>specific driver to get the core clock changes review first and then added
>SCMI as it is OEM specific and we need to analyse it without other things
>in flux or under discussion.

the pll changes is orthogonal to clk scmi.

it is just like common changes + several driver changes in a patchset
and this is just an early version (V2). Such as people use devm_x to 
simplify various drivers.
1. Introduce devm_x
2. driver1: use devm_x
3. driver2: use devm_x

2 and 3 not impact each other.

My initial idea to introduce pll changes in V2 is to ease Dario's work,
but seems not. Not expect that would introduce confusion to you.

The goal is still to use assigned-clock-sscs and let clk scmi support 
spread spectrum.

Thanks,
Peng.

>
>--
>Regards,
>Sudeep

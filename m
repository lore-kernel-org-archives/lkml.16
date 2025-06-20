Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021130.outbound.protection.outlook.com [52.101.70.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C854D28E616
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428979; cv=fail; b=EDddeUF63qsYRDcsotMbJSrfPhEur0NbzsYJ2v91rpPXljhrUslJ++1ZkTb5mgp3qwEJj0TuzDapouvFlsaZTQq55jqlXr4uTRq33EfnbMJvMBuWw99w4dYFyfHrVRlRBxgKG0TczgPjTmF5ZXVk9psDTOyaf3Rk3ogMzbG6Mgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428979; c=relaxed/simple;
	bh=T0wtuyPvJUw5oGDojZ97ko8d+/nk6Js4qjpuKii8M44=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RwMG8swrZP0906VKLnxWwADhj8B+Z2gzcP5ZF75bCBbbWKnb2d03/a8Dj9BQDZXqLMgEcRH59UeFCQF9xxTwhKT2MPfq9FxZAgvINmF0Qt06ZfiRi516qDmETiWtHHHiO58nMT8w9HHGbvC455UVz45U31czf+DxLslpNaxYq20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=hrG4yRj5; arc=fail smtp.client-ip=52.101.70.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="hrG4yRj5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUvyq2DDj4r7k9Mkfve250hNPXvfISkEHTRgy5uNcjx+KEt4B/Q/2dXvDt98ZUi5ZwsiEGaIFBAj6u5GDlUy6n1Seycsco4CAYIX6YBSYDdbT+Han8rLavAr0vjjNro/7mHfJ00q2mlNS7s8QdvpKeZxt8zjDQoDrpek99OyqrCRnF5ZVue8KPx6XRGFPiS66WHQpPnWtiWLb1ul4baJGDwU43zRDqi3x8+goc7bnRUAEfQ9ZGM1IkDM2jd4jV0wUBYzfXj8KgDRe/kRfSYmPfM2hZyaJtr7SFEZMXmivtA3TUm/SNUdGtL2Z7M5YL15jjr7UCD+9mHYSqFVPEBv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IooEvG1Lusx/u3yMd900qPos/kt5Qvij2f0+YjeLKuE=;
 b=M4WMcvbMKfUT+lTgg/1LV27WzjXR+/KxhHUb1GNTMsFaB62Bk4lyiKH5vjhq5W7g+fMusRpnaX6cs+4lH4SUdexOIMjzYRuQprb5AYRCBSpbH2A8sLAJoUcCsGo+5+02+j+frS7urXxI61eYTNeVMlSnOoCaEVRNDEPYLuPbfafb10jLP6+SJJm14IKRx6OeFxdI+ngqUhkU+nT3253mXL0kGyMpQJoNzPdmG60sjVp+9/bWWRdN2GJsl/ALGVPiygV5oPNnVKJXRXV7wfrqhJLvF7uVVCvs8ZwiF6NJzQ8qFEo5Dfr6Iw9D8IXNd46OF+H5xzL2icqHOGmXpzbiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IooEvG1Lusx/u3yMd900qPos/kt5Qvij2f0+YjeLKuE=;
 b=hrG4yRj5Qd5u+jIduRyHHzQBf7QTCCCHyvpWAvbeVpc8UPY/K76VFbnxGxBcsUzx9yXE0Sf71KMrBOZp6BGoWuhwbryTFSPLDLs4dX84HiPX7CQuXsHYUQsm3RcVyIXe+e/m+CwQA/Rj9GJY7CfccU2WuQB1v9Ln2yaeLVVb1VQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by DU0PR03MB9707.eurprd03.prod.outlook.com (2603:10a6:10:44d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 14:16:10 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 14:16:10 +0000
Date: Fri, 20 Jun 2025 16:16:06 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
 <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250620161606.2ff81fb1@nowhere>
In-Reply-To: <20250620113745.6833bccb@luca64>
References: <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
	<20250507222549.183e0b4a@nowhere>
	<92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
	<20250523214603.043833e3@nowhere>
	<c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
	<aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
	<8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
	<aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
	<880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
	<aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
	<20250620113745.6833bccb@luca64>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0193.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::11) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|DU0PR03MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d71cca-2a75-49e7-d779-08ddb0050169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RXgOq+PNapUMMhZRHTvJrtAszieF7VjYvCIUcc0o/9+8x28tMXXfNJTkCLVH?=
 =?us-ascii?Q?jFcz/Xx42dVpHRMMPjeGylFY7EUEScPjGKPhXG+IWpKJNBC3K/70WO64AI7A?=
 =?us-ascii?Q?nP8zfeZKdDHON+WXaSJk2H7/8xSiuTUhH3xJfRvSSbGIxikh+aI/KvFfhAvw?=
 =?us-ascii?Q?rM/WRbWv0p1vMwR4IXX7czJ9CY8T2qqqJiffQVGaGgC/2Ehvl2MMaAak62x3?=
 =?us-ascii?Q?vRuwiencaZhqgEDMIxWxfnvpm5LeDsiysg5n4UDj0MTbT0wxHo9WcMutzHry?=
 =?us-ascii?Q?mRTb1QEpUhsMLIZnggZ//uiVp5rDCDgUuq8PPTmCEbEQcDgzKkbNQ1AIfdVg?=
 =?us-ascii?Q?PsHvAHqZwlUGJQi2CSh/VVfxj1xeXD7ryahXuFDnn2oGKCqscqfYIXRJiUeV?=
 =?us-ascii?Q?Bq/w0EANWX7I97Itd1zoYlK0oPyxtSbN/UfBdux8Zzb1sDY7W8fExkqwLflA?=
 =?us-ascii?Q?7S8TvJ+KgfUfXkGqf73w2Im8whjH5EmkXzDBg0u1w5qpfc3nHzdnAiHyGTqR?=
 =?us-ascii?Q?1552tpDU6R8lsd1mO9Js+CBX9V81mGFCC74uJQ3cdMpGtWRGPDlvAkRCjN26?=
 =?us-ascii?Q?6RrW6mYaM27mzcMRwjGNm2NPpXqsj3nbK284hCxva/HDbY+yNX10PBq6B9p8?=
 =?us-ascii?Q?NXltxnXYXojErwZfbgaOKZZQtg1bTjFr7oNVao5kxJdamMV5mLR8x5VpcCf6?=
 =?us-ascii?Q?JYoaipkTPaacEYzGx1z/2mKC5pJFjaxSVQ97HhBAfwJd+AhWekKF/ylmoVGu?=
 =?us-ascii?Q?X9mS+HQOSfHlaSqg2nXLpuDKzwBgVeNT0LcgsyhvkU/lqkVH3qLGDfOMf2kz?=
 =?us-ascii?Q?gVRIFKqarmtVF+e1IQyhQoouM1wfQQRYeERJzjczoE5doOWdnoabz3nfQ8So?=
 =?us-ascii?Q?NJ2XU/nPMIq4AI58tnAZuPT994PTURYbj+uVZ19Ys8baJiZPfksVo2SaL3/g?=
 =?us-ascii?Q?M/VtgFPq6mUKx6EfSLH8vFrXsO5dD4X7UxI0ETCOxvcA2BaBp5Syd3PEkTUZ?=
 =?us-ascii?Q?P6PuuwNlllkyJkND8WkxG28NjSoKleGkYIgraQq7y+R/wkjzu5ALM7v23ce5?=
 =?us-ascii?Q?oD7T0ztOGK62u5O6IaTcyLHaMlVg8uxurgY/aHGABaRQgAbrj4RbnS69LYCi?=
 =?us-ascii?Q?v69/CfnD+/9qV8P5trphI30jPBijBaVzrUbewSkrHO15Hd3aRoPHyGU3D5jO?=
 =?us-ascii?Q?81uTNgf6V9ooMkQuYPeHuRSQaG7b9p5D4DBqgEIliRmdXW7mc8UZRzXEu4rv?=
 =?us-ascii?Q?iVChAi8rznR1PBTaoaBvqbE18V8kg044Yd8AGauyfwMyhmiKjwVOaVXfiUQO?=
 =?us-ascii?Q?gi3PLnidg9e665302JpAH8lIiyh+XWxa1lJCQ0t0GIIccS7KtWzCg0vh/goT?=
 =?us-ascii?Q?gyIbM+75QqfsQbKveoBeV7Ot6xXbFbgw9J9IL2ivJg23+Vfx2G6oz8trpr6T?=
 =?us-ascii?Q?RK5OYXB2qn8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4DpSxSp64Q4MeqaI3GrCMjgONKVzN5rYAAdBJ7zEVRmZd02WA8X7KFKaK7n8?=
 =?us-ascii?Q?XbD6h+QXp09bA3xBS93pfnIQheSYYIUwqFRd3X+wPRlt00LqTP3EF3y5sRmv?=
 =?us-ascii?Q?v3PuEBU5BmC+QekGBPfFvkEm4JnlTUF1cYg19eKLt+cg8SFa6boAuxyp9Tfq?=
 =?us-ascii?Q?TE97ASOQ37WKtm+UplCVTyyzKGVVDEvu4IU/vv209mWb521W7XuMgb4igb1C?=
 =?us-ascii?Q?UY+ApO+q5N5Fd2E9zr0ezKZXq7u74n9Sp610ikGzi96xdMcyijKVNnFtgG84?=
 =?us-ascii?Q?CCrilx2dyn7wleWWm2aII16i4uu22YqEzMKSCS9H0Mi6tcSPinXtwv5u8s98?=
 =?us-ascii?Q?hLQW4muFmd2RvSIM1vNwRHNj1Muv8IHIXs7UNgNZ5fK76LiuQcFuAp8uAGft?=
 =?us-ascii?Q?+PBvAyhJ4k3dgGAz7ZaoyJqGIZvIHcPEnMUjUXRfYy0s++ojs1Bh/P5bqXMz?=
 =?us-ascii?Q?+xW7FzpPcnSSbz3HBpFqr/RvqpB7zocUc0oY/U+0Q24zjq3Y3nmHHz0aNtBx?=
 =?us-ascii?Q?7zYHiD/jXrV8Yjtyb709JozjZdijjQ2ieFXBnMjIS0iq//gWameWrtcOuwld?=
 =?us-ascii?Q?6+9+Rk9JHs/GZtro6OVPCXTK19vEAq03qMZuA54pTFYOYmrPnxHY6FrXjE5z?=
 =?us-ascii?Q?djEzxA9cUPxe4Y4FF3wn3IJbfwE1tuPvYZM8XzaXUhyUT8zaeObydm0Xbd1g?=
 =?us-ascii?Q?LGJW67VtlweLcuUEQg6YcsRGgKazEyCIZA83EP3OgKynMO9cLYBvkrjt8q+2?=
 =?us-ascii?Q?j1Nl3MyFNNPhLiHpsQ+9NpvDDbhW+ohGoa//LjmGDl6kXVUPzGqrndrhvK6k?=
 =?us-ascii?Q?riNErzJzJ5o/ccRIhgzFJulRMyBvu70EnHDAGN3V5Q40FYX6OJtsae1rJh5s?=
 =?us-ascii?Q?aqAUNE2nUZVwx3bVzL4OGoJsYvtNa8dp4LAYLqjV8v011xWMjoMDT/TZ/VaA?=
 =?us-ascii?Q?ayu/S+zeB7z7iZuqCgOur/Ak5QytnsE3vG+Ak2tnn6yCBGnZvcT/LKmZd9o0?=
 =?us-ascii?Q?soFuNj6BSejKS8kkZm6vLfecUefbZ7iz8ctwGFRYjhVDJRQHPiUJ3/yYAaGd?=
 =?us-ascii?Q?SRFNg2NS1f/Sba7ZR/i5XJrKESa/vVUs76eKajqSzTixuEL/0USdrMtBIZFC?=
 =?us-ascii?Q?by4vpPAli3Eri+Mtv5ebjdW4bNwW0iVnN/BrdAglPSWiStBC7ThraHnMLam2?=
 =?us-ascii?Q?OHtZyRvCjH1lPtvJsreHpQ170sFuDeXGZ6/gwRx8hn+XsdnJlSJHm1IRVtuM?=
 =?us-ascii?Q?xU2WvK0UYTyZco5cXmuzu+raiLhKijdjsHvoMstSiv1CqjigYF2r817UZAEf?=
 =?us-ascii?Q?Hosl6JnbDV6b1uIXeV5QHAqS3Rb//ShW1V0+LuzpOLO4jJj7gE8chYHX8t4r?=
 =?us-ascii?Q?whk+DqWHiJBMeKd93TURPPJzzB8dmFqSy0jjXVeveNJfG05GqheBTmp7cNsE?=
 =?us-ascii?Q?uLhCldkRP2FYCUyYEA1zbsW5LZeDfqIvs5AXTqcopPDYK/wB3ytoGdGBRRHu?=
 =?us-ascii?Q?MkX4Ya1PwR1Y6tBBd5wzkn6VTma3dyy/olTmocOSbKvt9DBgGsGn9m/0laXR?=
 =?us-ascii?Q?UDUmJj94a6b12/VKp1muae7ofuRAj8agHIBlfFOuvHEFYonRtO2c7nt3+sEY?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d71cca-2a75-49e7-d779-08ddb0050169
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 14:16:10.3352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zg5LB9snMePVpYb6rdoXgh5aMTLC0qrmfN1u/Uv8gr0iD5eMGQpxGxqm3Q0ciojVgutSfe1Dlmwjna0hBCKpSb+LvBpcV7ZZW1Ey4hi9oQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9707

On Fri, 20 Jun 2025 11:37:45 +0200
luca abeni <luca.abeni@santannapisa.it> wrote:
[...]
> > Luca, Vineeth (for the recent introduction of max_bw), maybe we
> > could take a step back and re-check (and maybe and document better
> > :) what each variable is meant to do and how it gets updated?  
> 
> I am not sure about the funny values initially assigned to these
> variables, but I can surely provide some documentation about what
> these variables represent... I am going to look at this and I'll send
> some comments or patches.

So, I had a look tying to to remember the situation... This is my
current understanding:
- the max_bw field should be just the maximum amount of CPU bandwidth we
  want to use with reclaiming... It is rt_runtime_us / rt_period_us; I
  guess it is cached in this field just to avoid computing it every
  time.
  So, max_bw should be updated only when
  /proc/sys/kernel/sched_rt_{runtime,period}_us are written
- the extra_bw field represents an additional amount of CPU bandwidth
  we can reclaim on each core (the original m-GRUB algorithm just
  reclaimed Uinact, the utilization of inactive tasks).
  It is initialized to Umax when no SCHED_DEADLINE tasks exist and
  should be decreased by Ui when a task with utilization Ui becomes
  SCHED_DEADLINE (and increased by Ui when the SCHED_DEADLINE task
  terminates or changes scheduling policy). Since this value is
  per_core, Ui is divided by the number of cores in the root domain...
  From what you write, I guess extra_bw is not correctly
  initialized/updated when a new root domain is created?

All this information is probably not properly documented... Should I
improve the description in Documentation/scheduler/sched-deadline.rst
or do you prefer some comments in kernel/sched/deadline.c? (or .h?)


			Luca

> 
> 
> 			Luca


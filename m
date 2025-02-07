Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2C11C68A6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738969207; cv=fail; b=UaC/Ctc0NvNfMJkKbCJFaWdaZwplxx+qe7nSSsPzSZV9T6+7Epuzutyfdw4SXU1z/xNp+J62lvPOmsxc6zzb//25MPEUw9Er6zMglF6aN9VtlXAw0eRyNgd/tzxCeeBt41jv6VUUh37XHpYjE14qoMcJbIW01WYJ/WraIBw1LAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738969207; c=relaxed/simple;
	bh=Mz0M4PbChKFL5TKveLH+xFsTAWTGhc6KRwDP2OCszjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oN3iQI7D/GK+mSlF6PteYyqlWHh6fJxyq58sl6x2uz5/UUIQC7Hlj9yMROresk1tjJqW+oK4lA+H2ZWnuZ9DaU9IUx39lu5qamZRpwQnUorvxytR19IiMNppjQySah3J2LaWDp3xVP05d3FOiGsBamNhmfknhRTsuZZzf56naLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ie6jygoO; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ie6jygoO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McNTR3i3dn/cv9DktJMWB+nACnks8rrZAto+mSfn/pTpVgwMspzBInPYug1wyuRMR0h+NeVR+joOIn6JkWTcNKHDf9g6wRiee5T2TuB1AvHVI4eSJ3W7MOCk9X3Mq35vVaIQGN0oeGrpnwFVwskYtgLe8jEbRbQdx0Z5p0LCF/vbZ5DFqm08zD54irFE/NM12FdSheTs2iR3iXv3Cy55OJvmlII45YUCPyQ/oh6jc/UF//ozeX7l9+I1NCKhkmmUXNF0oAsXXXFLP7xo/xOhHglaVqjV02dNgPr7LxdIlNcfMp/w+BQCHmDELEBpJS3XS2d1xo7VgG0yFiGz3auBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Jg56Pe5mrBNSy1HB/yfGmvCXsvSP1sCudpAGlpUtoI=;
 b=ZJuS445U6XgRXWKWzNi+w9hs/GIqrWzi9S/t3q0BLqkWaqdSGIYn837TZ1IWxgHq/2P5Xc+wxMfJcGcElKINGyp+pbtUdN27AgOgLzKUECcSZ+gTMgXQ6BQ9F7krnLuxkjrc/5FtMadUkv8wlFumfT9l6GAmIAoRHXGWMgwaSu7Dol5fI1M+7Oc3IsFIw3a+nBo4+5+VD0A8dRmMutQZ0iDc+MJWv43n3kfX5UfRlqACgSz/EFBDArW/Nk9ZqsRSsHbSTHMbE9fl25EpeYl8f9Jt0NlNTxOu8IivIyM0eAHvXcBVrECtQG/F2whse3fXr4diOcaNanjQyWzHUuknZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Jg56Pe5mrBNSy1HB/yfGmvCXsvSP1sCudpAGlpUtoI=;
 b=ie6jygoOJy4sB0QpJXFiU0S9Y/MxAdaoK0aECc4AhfKrKE5f44P2Zdd5UIOh2OlQRq+eO6b5UIsbeljSInKRi4ob8HOGXw2g+w8jO0Oj1vaTbPyVqxkIGYcbWO35XASBMjzqONvdzbq2mDDj1zTShpFfCwz+gZgpalWhSo4shewAaJ8y93M7TkarU/uEQ8k/EolADeD+NtXHwKouBcp0VFD+vN8W8yrYDJixDpKMabgDg5Z6tbVENn7gMJYT/SLVn/bnboPB8OPT2hjCJyEfcBhE5HdmWnDzW5SHAGEXAcvaWMd2DVrSp7WjMwYu9P0VwZiSi9CteJslpFtzxrq0sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS0PR12MB7827.namprd12.prod.outlook.com (2603:10b6:8:146::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 23:00:00 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%7]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 23:00:00 +0000
Date: Fri, 7 Feb 2025 23:59:56 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: Re: [PATCH sched_ext/for-6.14-fixes 1/2] sched_ext: Implement auto
 local dispatching of migration disabled tasks
Message-ID: <Z6aQbFDeYADDlJJu@gpd3>
References: <Z6Zz79AUub1YuHwD@slm.duckdns.org>
 <Z6aK2J4F7fnzugxs@gpd3>
 <Z6aMtxceyZsi5PfC@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6aMtxceyZsi5PfC@slm.duckdns.org>
X-ClientProxiedBy: FR4P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::11) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS0PR12MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3b537d-300f-496f-1e9b-08dd47cb2628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wfutcotEnhyy45PzW8LXLTMfKbYAs3ekDP8r21Qy74CO4sFTJh/xQRj3WCb0?=
 =?us-ascii?Q?GQFy5c+XGALGvKIPoi/0na5Q8ydxpw4Nd9y/rrrVKR46gD+5nH7EypKia2Ic?=
 =?us-ascii?Q?UNaU4l+vyvdHgtSvavVfmQAezSWyYR+0wxx7ncEdRgInWk34ft6BTPls4/Zd?=
 =?us-ascii?Q?2p6H5/tqKEgvjkZOkn24LW9Ig8q6ptrRpo4PPNXZtyErWO6b0Lwez2fpJpsi?=
 =?us-ascii?Q?SqZ95PGr5fbPxwIxKebpSlvPcM08tCkoqzz3zWl2jqP24Hzc6f2zsuIdLzFo?=
 =?us-ascii?Q?5UkDc33bExHv91SQ9lN0xkrQdtXAftKhX/IX00IEoVCzM6ZoE/7rIxhDjoQU?=
 =?us-ascii?Q?9OI4hOGfsRF0aL7Zx6KBC0o453X1QgZ9thxjTFfwJhAOr0VkuOKaBzIdQLxZ?=
 =?us-ascii?Q?FkpdcISrQDyoMsvU7WIy+npBF+tJTMFprREDxXwl1wucXXxTq5ekwuZbHW8t?=
 =?us-ascii?Q?SkAuqvISEaEDFKnixFNqRaiHDCAHRsXENByqcUOTH3AbuY++LSjB1t076Z1G?=
 =?us-ascii?Q?TpcaWavxmIZh8Ct0+0JnYgEoYXRW75ORLwjEPjcb9OHGRlTAQQ92oAFn3kn5?=
 =?us-ascii?Q?miq8oIZS/qMGQaRo1wMAtuzrzGM/DShg55TPgCzGWWx/IMV5Jb3ZdDrQaT/g?=
 =?us-ascii?Q?8vqDD3VP93f8UjC4OYb8TcF+WyBTuhZ3gQzXgANMZXbkJUqFvXV7bM+ZO6kz?=
 =?us-ascii?Q?ZrxT/Vj6c2fw5NX+bVQEppx0VJ736Y6lstbY8makoKYYs+SsPmc0WuGJy1oa?=
 =?us-ascii?Q?MgWW1ScR2Wmsk5ZcSZFZUM3ZSMLi4Yyue/H81jC9tQeIfEAZrRhKGPKMEdal?=
 =?us-ascii?Q?eBTOX82hZn5l5RVm9njGVYMSxmsl9aT1YUXUiVBq1PZG9eou9wuSz3z+zyQJ?=
 =?us-ascii?Q?Bez/QD10B5qv+j1ryOsGCH39v7R63Bnxva7nZ3z2BBLJ/jpGnYTESwhsYkID?=
 =?us-ascii?Q?xYOVIJgPpnPrl4+oWwPWfFyIfsw8b53oYUVdy4GvBxpCSS9ZkpviUEnplkq6?=
 =?us-ascii?Q?FBnvg89q5h16w/d5fyT0GbwAw1RyaU4yok0HZOR8mxVBk6JozXKo1Qpam8KJ?=
 =?us-ascii?Q?FlYTqoIfYsO0U9O/JY95QrTTs21r8IT006grxbdL6KgloGt59gTnqfKkM9Cb?=
 =?us-ascii?Q?3RJ6UWa4vw7SzcnPsRlhILMZ5J68LOidmhuDDe5N0BI+Fpunto9R+hpCyyFT?=
 =?us-ascii?Q?10g4F+qJ3ZaLpkvldYhcWpH7vDVA1b+ar9fBZTIpyMi+2GaLbhFFYY27m4fl?=
 =?us-ascii?Q?GKKLPKYl/tDd9ePFJKvXh+DIG2pqotf0VPelYnUUltpVCCMUpLwkankrDal9?=
 =?us-ascii?Q?1vOZgGAKHnEBeLRqDahI19dM4MeN4ZWNP/b327tIU0i3P8jZRo5zpfI9tA3N?=
 =?us-ascii?Q?Di9aWucx26NyU+8BLIUynvK99cLC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vx9p0PUT6s/13IoruqbO5e9oo/oBSaDLQfNFucYZunSykaWroxlmK1sjy8RL?=
 =?us-ascii?Q?Lc6hwgwfiXu/03XOHNbluSmr+MGALmqna3KVHJ36h0N86wD+9UVuUjVqHa4G?=
 =?us-ascii?Q?7z74XBSy6x06I+vdxr2RETwsY+oAaV7z2uBxnpPLHDNhPj+FJJah2iTB1vko?=
 =?us-ascii?Q?0RWST8LE0zcoLWN32k8zLs6ORMR+g3uecfrjLMMLSiLoZmtgoioFqJcQYUk6?=
 =?us-ascii?Q?S8J9HbZM54mQdLBgiVnb+MYE/NmdW2EVHrIs6eclTZqz8uJNu/vOQyusTjQD?=
 =?us-ascii?Q?8mbNsL3LPLjKR1E94Sz5j7U7pxx1dQU1sShBKBco76QA7QnJMT46An18xQMM?=
 =?us-ascii?Q?lM8OfDi5XfIynVFQqdoe7UT+6ZvPiG7EHwRmF5xl1w3uYsURtZP6hmIo7kOi?=
 =?us-ascii?Q?p/HNbI55vRa36yJzPf4kk9zKtUXPQV+POCaoxCD91I79sP/Z66Notn2+R1Ud?=
 =?us-ascii?Q?I90dy5CZnmcmJLBVkqlDKUjpkzqG42d6zFd8EVmGK//u5q41O1wn/Ek8+DEy?=
 =?us-ascii?Q?5/p6IUtppvX+BBlgBcwmMZ9+odCYdpt7Hi80+SHbDf19+DaetPUsG6wWF+1k?=
 =?us-ascii?Q?HD+ntNPKQQ7hP61244p8jl7Gpx35/tevigDUQnm0hMBixzugvanfbBb2Eulg?=
 =?us-ascii?Q?SWOxFeC6+qiswoZIP1FsqEg8+qr4L/5l6X4WKZNsB1kzmtFK2bCZpzANKX+/?=
 =?us-ascii?Q?WpBB3ezLTj1fJYUbUG252SPJKZaKBYAu/GUpy/W9vS//zLOaG/lWUpeGEpdm?=
 =?us-ascii?Q?Zd0Tlf46oXhAmb5+Tvzg/2knyrI8xJ2YA4nAxTe0++p4Y3CbT5PQQndQwEHv?=
 =?us-ascii?Q?y636xFRAxJB/q+tPCJhxvBrksZkYC5n7sJZSDfxp3X3N1eiTcJUSycMoBOzx?=
 =?us-ascii?Q?/k+bCDbehNBTrKe/vUd3NzpCF/IwKZQeHIOdGgjVYhW0ClQz7XqXAI5t9BP5?=
 =?us-ascii?Q?uO5mRYHVg7HvmeOCzlGflbka1TIBx3P8HmkDLLjOaejFgdxV9sCgLF+cYo9b?=
 =?us-ascii?Q?oC7wMGKeddACf3A5EDbCIOzZZpmsHz56kQBzNgWbiymg1k9IbZSzYq5B7miL?=
 =?us-ascii?Q?08jcGhPQbvMMzVdZJRDpdIjLuotGggs1IaBh6gu3KyK1+r+IawbrB3eqFSBl?=
 =?us-ascii?Q?idvO/U6525cgGKdFeP2tj3m+bYF9xU20LWRqOFtldeorgGWcRuGS4g+BvCyv?=
 =?us-ascii?Q?0XkNBBCwQCKbE0dvVn+u8F4kDRk5N0brmP9+CLKXS0H96Tdnb1BVf1t7FeGu?=
 =?us-ascii?Q?mIk9RNOwLMyhJArgvB+S17jfvjjQ2wxluxNqeThrwuPPl1ZkIv6uYui8QveQ?=
 =?us-ascii?Q?PxugtmGymeCzuuGMWjkIEPa6xhgNzunsMbTb7ZjzGMX2Pur1dk8jAh/mQCQP?=
 =?us-ascii?Q?zmd7lKii/5mWrN74OJ27r+H7urS+AsUI8NV/QWPeYPH+j/pYQD/UW/nRfBtc?=
 =?us-ascii?Q?hHBtQtWTDg9ji3o7ujoVFo1SLzgdYPOheIdu2oCLj5ILbIJtFKLCgsrrEBtX?=
 =?us-ascii?Q?G35eJc3m7eOZfFKJdkmdzhp0nnuCQoFRkLR34NGrKOkQO77HwZcmUVyCVMzA?=
 =?us-ascii?Q?aCgnAbWqpqsmvk4Hme1aTnwkTMZCZQVdPCAOFzwN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3b537d-300f-496f-1e9b-08dd47cb2628
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 23:00:00.1767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm8v/qW04rMJWBQUohAG4xpbcU1FAP5Vt2woh/OfP8MKxdLEupiinJMt2DK0Yj6T477aYDxAIyfgfNhDoujPIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7827

On Fri, Feb 07, 2025 at 12:44:07PM -1000, Tejun Heo wrote:
...
> > I'm also a bit conflicted if the default should be on or off, we're
> > changing the previous behavior, but OTOH this is going to prevent some
> > potential breakage (due to the nr_cpus_allowed mismatch) and server
> > workload is going to benefit from this, so it seems that there are more
> > pros than cons at dispatching migration_disabled tasks directly by default.
> 
> Hmm.. I didn't see a lot of migrate_disable() while testing with stress-ng
> and migrate_disable() isn't used that much in the kernel to begin with. Do
> you happen to know where migrate_disable() was coming from when you saw them
> with bpfland?

I also don't see a lot of migrate_disable() invocations, but if I do the
usual benchmark, measuring the fps while building the kernel, with the
migration_disabled tasks dispatched directly I see a significant
performance drop in the fps and the kernel build is faster, so it seems
something related to the IO? I'll investigate a bit...

-Andrea

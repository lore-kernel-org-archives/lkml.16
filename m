Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD119049A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738911194; cv=fail; b=PSaJwnnUrCkJvGJBQ5SIvjO4s0ngLCLycPOf7s/8OZH4hFg6rTyBiaLJ83N62gVdmGXh8wQGe8WzxcmrsrR/Mm1PVH8yY9Q/sVsj3QEV47mZQRVqlTI9GF75LY6O59OnymIC7LUk9UjJJPacO4OyE3TKw3MXubODvpB+2y9Ywls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738911194; c=relaxed/simple;
	bh=SPO2LcBCNNbApByU0dYGp2134Tw9Qv5qCoT/wzVg62M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rDL37NoLhWKi58q7hlS8VhSMfHzrIjZ5YXp5sX76nTT2Jut/blPiQ5NN/kDyvM+1TzC92EEbsPSRemCO1Hftn303LembPtLGIU1mfBFboLM2aWRbH3Ui3ZwesY+26mEHmn6XNN35cSp+Y9CFK2EwjOEbW7OK6S7yjUSnDgn4gow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EB9yrURU; arc=fail smtp.client-ip=40.107.95.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EB9yrURU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0m5lEVd3pNRs0mVpNlfWBxRM+8qX5YYhS2a6sMbU3hHIIwz2MlKO9b046Z2hCDZjOR0ze30kQU0kHb9ozWUUEZsdc/OnnGoLKOr/1CJ/yWyx+d+Gnnw7nCdR/E2viXcjFnF3SpA8Rgf2pDvG0scotZNxQ2FA5ztmAwCfAl5RQVIqGO7IcSUqM60x1vF25aENLqNPQejbJv7Y8ZQylfxIzvZyCRHt5nwXraXpRESFMm81xsUL8//Ur/LODBx7T1L5lS7uM74hRDoH6mtDR2S6iDx8Ak5+VZfQOxi7wJc8mf+mBs5IFeRtamUmPanqLwaHoA5aKcAwFT1OP+w/1kVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQcOgzTjQZeWkeaFYn7fZxUgCjYRHMcxbpIumbvq+zU=;
 b=aP5OOo7TVp40SYbGwYWtnRXSPaS0u+YMr8H7XtdtxOpduiHB6ZeB2O6Z6t47XPF4zYW8IUZJ5XS7TsGhCb4C3V4U9qDnTxbBjiiNdG0AJ0dXYPN4UjCor8KP20mxKEJ7yLxdslcEa+97xpfq2TP7nNpxmDSWak77NCaLAYAZ8XvnRJRNM93Ep0vnCNd/Sgl6tVGtvuzQrb4RGT/zhPdERKYlLRCizb4XJvOr0CRWwktL2icay1/jTYApnFaonCdjrTUyydx4wJstUiCXQF8rhjUpxvk6nkwqWlHSShkgtK/rGOuvhP4/xoMlYxUosyzO/zToz4mllWqHLRyJr0b7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQcOgzTjQZeWkeaFYn7fZxUgCjYRHMcxbpIumbvq+zU=;
 b=EB9yrURUjHWQ0+80t0YXklv6Kn+u1R1lhbuteZgaCxOsCOyYFglW5nPvQObQD3mOJ0FX26T6+JNLBrZRDo7bI6Kimmfs4dWPCXw/k8F7hf1OGspIl9tiKeOFUieR97VK5T2HNtHd9b6OWz9i9XP/nKH0nCoLpBLQ12zV7Wmzr+lX4nyW4hA/pqpxahhDC9SgNUvGTcesZlmKrPTLgazi22AYbVcK3/jn9KIHEJbtSPqjtangQNfktHNryRJS8bHPWf/JaasItJEoXtHc3UgXilMQNdhigKxguGfp08wglTGtc8HSn4MC/PfWzrcF0a2wvJSyAQ0pMEwVuuaMHFOLgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH0PR12MB8529.namprd12.prod.outlook.com (2603:10b6:610:18d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 06:53:10 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%7]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 06:53:10 +0000
Date: Fri, 7 Feb 2025 07:53:06 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Changwoo Min <changwoo@igalia.com>
Cc: tj@kernel.org, void@manifault.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] sched_ext: Add a core event and update scx schedulers
Message-ID: <Z6Wt0kV6IPBbIGk8@gpd3>
References: <20250207031338.393045-1-changwoo@igalia.com>
 <Z6WnCHiwkvahtdgR@gpd3>
 <7623f8e9-d598-4c0f-8f65-5cb0cf563d4e@igalia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7623f8e9-d598-4c0f-8f65-5cb0cf563d4e@igalia.com>
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH0PR12MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 05aa719c-0143-4390-8d44-08dd4744157b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3S3IvmNDmcC+dAGPDJQsNTeNbZCeyHiUPcV2UTjCScNgYRos4Yhsh2MM4q3C?=
 =?us-ascii?Q?a2NW02BVHEDSewHdcOwzLW96jjMEiHlTfrJYBInd6KUhKQbKsUp6MNGAryWl?=
 =?us-ascii?Q?xdjR+5atspCEMKejtmtZYcLGBIIkpZdRcGn6GOGnr7y+1Gc6Jv5vSbuhuYgL?=
 =?us-ascii?Q?2upkwArqEb6TcWGZkOuGCdJPcTUtkPZj54x7KXQy63zYOxqqU76Z0XvYrjO4?=
 =?us-ascii?Q?hHKxQeFG4H+RfDv/wYJz0ji1atHpugmrcuDY8+Uthy18IgjMLmKkvxCgAQ/g?=
 =?us-ascii?Q?TMnCdpt1Zub3mEEV4CSnCMn7nzxOPgeqaY4CyWCfwEjwxuEBCJn2BEalxzbl?=
 =?us-ascii?Q?jwqiH3ohyF8uSsyzwZ2Lc97V/ufoqtjERKGDgSJ7Od7pk2TWjYQue+6XfkaG?=
 =?us-ascii?Q?e86zLpy9M9G8pYsorB+WmD4cuNk/aeVocCwm2DPvKCw1iMf8GD7YSnINkEuX?=
 =?us-ascii?Q?Q2LAV4MgGlRCQlgbwWH41p9w8TybhaFPG5FKQoDCR1s6b6fGdygG8diTTKp8?=
 =?us-ascii?Q?M3WOYlTLxKCxHHKm/Rpjox/2DDUnuXA6JLYMw4uK88lw/qwQsWuFvVK/ySL8?=
 =?us-ascii?Q?yfE0WEfox9s1YcbiyPeInnnJuVk9jToilRzGfaQW7LZCW2t6plyZ/9a5SUaq?=
 =?us-ascii?Q?r9KK/lcJDqfuuO3BprlDdkR5pjcxEH9MYNx8Rz77//4YF7eqwonBl8mmXhiE?=
 =?us-ascii?Q?m9qZYBLFnSKVu8oTm2b1TwHxaBjH3wbVeue+hktsN4N+OB0YhJIQo9HRcQ+l?=
 =?us-ascii?Q?G+uGf5xjRoyWSmhLi+wgWWYJURJ9yuIo/vLAf1C5c38pLFvFoghYGac3rsVQ?=
 =?us-ascii?Q?DGZn5flwOJnaHSE1nYda6ZYZNZN3lRGbLuiCxGNSEi8+P1BPqfKJz4SE441g?=
 =?us-ascii?Q?PoZ4246uBOm2RzvmIpMzF3biTtxMftq4yyKquz/VeQ/ywYre/WaYc0um5Bfk?=
 =?us-ascii?Q?djDo+X3IGCZN2nc6tkglrdM+Q5abYJz2XHme6MhQkgHNSKWlSDZlJsor88xr?=
 =?us-ascii?Q?ZZlB20U5yhpgyXfEPg1jpEEYqcNHp4evfxVLRMrp65Q2L//0VgDSqlPlTysh?=
 =?us-ascii?Q?h1rfYvBtSUQHv8OEBbNxGM6PI1/JmdGUY0GHF0Y3GG+HmnEe4nNYaPnBNpME?=
 =?us-ascii?Q?Y09rNEXlFu4mSkn07QEWKO1p+jb9jPsAjHnqkIGQB3xDKWEYqv/OUlpurNLf?=
 =?us-ascii?Q?uSOGYgbsfZVaDTSZxN91vgKmmyJhw5aVvaVdB/8NrRV/XtlgcEjvQGNPnX5c?=
 =?us-ascii?Q?72fID4mkYVSf5vBSp8y2nPGj6KETzhiiY6tC0OP7WxfX1Tb51gcbUC/x66lT?=
 =?us-ascii?Q?YpXR1gCK3DJuqRiJ3PfOpwhxtRx6G2slstD9JD1WnUZOdFFzoVl9Mz7GdOyx?=
 =?us-ascii?Q?ifklzn7mJ615QKDsEpHXUYiKbSBb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r3WxvIuJxy706jYp1BLPVKtSRt+kj3DqknJ8aS7hkIx02WpRqE8Yj8v8KRzD?=
 =?us-ascii?Q?gLrGUofRxd5IVIkthslCvIDWmr+Fyadc1ZywyGHM6HxfCkMtcmC3FSQFhqJK?=
 =?us-ascii?Q?er0rPMew+cTKwY3dRpyuXuRkTYCj/VQuq0EVye/uAOpD2dHGdiVhf0kwPn4J?=
 =?us-ascii?Q?8vtfmflWNEzRHalNPibDF9G7EfzKYSc1y4QiPpkxljjH6oJvHNjX8VJxYEBP?=
 =?us-ascii?Q?d7/obQgsTQInOpHI4XmlKyJS5BxjtkIk/bIcn1zEWWtswNIbmJaWVDfyPkRN?=
 =?us-ascii?Q?w1gUsb9noRTMSrO+61/C6ZiMVsSht23trjoipOKF/ekwE3wdTiafOm0iE8xu?=
 =?us-ascii?Q?h1fQh3sHbzh3J/SJ3lrTK24HTsml5uELxRCGZH6f7mGY8Qr55RvNp+U2RT3S?=
 =?us-ascii?Q?6IitGaAJscpQYwJdGfF5NAwbtjNfqoH5ECndJ+FVsuihyNk6eLwVqfj+MZ7D?=
 =?us-ascii?Q?1Iqbsc9tbXfc8ga1eYtgZ+GfZPndN2+7403yj/evxTuOY1urkJ1K988E/O/9?=
 =?us-ascii?Q?KA56FZx3fQMzHJuGKWThQSEtxUCpFpPRvZyIMHVCNsv5Aa/ubHgvqMrbUbRB?=
 =?us-ascii?Q?AIU9R4FtNfcouUS7sm+ijRZoh1zoAkaHizSUoM84q1zWuxpbhY0D5iWfNXwo?=
 =?us-ascii?Q?PRO30T+TzL/5xuTknxpdHbk42cz3diBZWQnD7RWvqw2i0A+6lCSPBHWgd8r7?=
 =?us-ascii?Q?j9YiSiXOMWWLRmuMGV73efcAPgFchhK9qkxaqa5p+SI+acvpuAjzNDzTPX+7?=
 =?us-ascii?Q?Wv2BwiBlUwjnuaeJErqFnjBh9zu7bC/n6HVUJAjYTfdokPRPUtmUszApKMpu?=
 =?us-ascii?Q?1kj+kGxvio3MCjKzwdWgybF0j9skgZ5NYx/JSIv11pTocdp/i/0FgLHIdzaP?=
 =?us-ascii?Q?Vs6vl+OAIMegUfPUj3kM65Z/TUB3wovS+nkrYjYvdQLJcE2YHv3wYSH0dH9h?=
 =?us-ascii?Q?T0Xnl6v/E0qNl+/cZG5zSpO65Dl+ZZr9O7eT7ezIt4e6e0HnWBmzt9p8XDXn?=
 =?us-ascii?Q?ejidYmc3YhA8hdW89q04sgZ4JHD7ko3OhygJaLwgiRmN/dqjBLgTuKHIpJgm?=
 =?us-ascii?Q?z3v+JgS4B/201jPmHbGsclp85LI+yR4eQ62c3iUSzfZGu5H7klOMu6LlCE88?=
 =?us-ascii?Q?nqyZGrz7dZeUPAysgu/veKizPyQO+gzSOanoPAL3qwIZl2P2zPRDglPJKLyw?=
 =?us-ascii?Q?Tnko5grmYHF0mIn4AR1MAr3hlHX99+Cyv1dTO/tIj+EI40mbvQ4Ce5vvlnpM?=
 =?us-ascii?Q?K4p5prXlwC64k0BgdhMEaZ4Y7p/uFOuG+6pOy8sBo11TKjrGxYXvgZmlR8E7?=
 =?us-ascii?Q?vgmDC+GlNUEGx7btMxG7345HN19t17sVruy1o81P3bp7ryXvdeIN2x3QHVAT?=
 =?us-ascii?Q?jD1rRd4aVXjGvwDxzwzMPb9ewueR6Cf4IzFVgHB40Iy583IzfwOPCKw8UykL?=
 =?us-ascii?Q?atRMSrTvPzB5i/VHO3yN00ewDPoUZS7ehnF8dkfpgj/GczjE/B/wzKwLDNOf?=
 =?us-ascii?Q?oUfyxPepgF1vzN/3U+WE4crjLwUuovHQoGnA6KeX1CUUiBmv2Xpvs9ZLTYru?=
 =?us-ascii?Q?vlIVFbyiVtgHVvkAsAjj+VtBEiAjTp6Pc3YZtB4u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05aa719c-0143-4390-8d44-08dd4744157b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:53:10.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vP8Fg2rFa+QGBAOyJl2YuENfWFrqnhaQoGZ8TgngXLP8nXQjif/37ffUlUMsCKzO0N6QATNSE8D+M4g/XUWjOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8529

On Fri, Feb 07, 2025 at 03:49:24PM +0900, Changwoo Min wrote:
> Hello,
> 
> On 25. 2. 7. 15:24, Andrea Righi wrote:
> > Hi,
> > 
> > On Fri, Feb 07, 2025 at 12:13:36PM +0900, Changwoo Min wrote:
> > > This patchset introduces a new event, SCX_EV_ENQ_SLICE_DFL, and updates
> > > two scx schedulers -- scx_qmap and scx_central -- to print out the new
> > > event.
> > > 
> > > SCX_EV_ENQ_SLICE_DFL counts how many times the tasks' time slice is set
> > > to the default value (SCX_SLICE_DFL) by the sched_ext core in the enqueue
> > > and pick_next paths.
> > > 
> > > Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
> > > of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
> > > Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
> > > scheduler bugs, causing latency spikes.
> > 
> > Not directly related to this patch set, but as a general thought: would it
> > be useful to introduce ops->slice_ms (in sched_ext_ops) to override
> > SCX_SLICE_DFL?
> > 
> > With that, schedulers that care about latency could set a smaller default
> > time slice to prevent potential spikes caused by the implicit use of
> > SCX_SLICE_DFL.
> > 
> > Opinions?
> 
> That sounds like a good idea!

Alright, I'll send a patch after this one is applied.

Thanks,
-Andrea

> 
> Regards,
> Changwoo Min

Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829F1DFF8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096468; cv=fail; b=L2xSjvaNMWNUSLKAy+QCA4cNZMq1+/vi7PzWQ5Qp6QjiJx3vhRBoJXu8jq8PK223761OY2JvH5gNczAuilHBhoF+TBuP+Z5gTBUVVVvtwmwhyD7znB70Zr9SzVzodW/yIEU0ISd/rIpj25NOo+UXGJkSANpxevKSlqo3H0vaeuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096468; c=relaxed/simple;
	bh=xCS6S9aJcUf+shh8mGA4A4bdnkggIwq0EhASF0oJaQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SskF3kjVYCYzAZ+1SvxBQKt2sV5gg0hU32jufyYpjjJCuqyduQBsrXN1icqkoLKmF9cl8F5M7XcGL1fml7LrthudQ1+zGJAQwoBJlPfmgjjvffGf2CMxKsvpbICv5AwSJI0ib6AAj3f/HN9cy/FmHEc6h4B/6Cq27iXDB3vCLXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EcyHaMSJ; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EcyHaMSJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIvOJXKdDINmBpg2ZZYWxjxf6eXxnkc9DIMp+F79Wm1HX/1o4Kq4m2SCjQhMH/SXKsYptpTyDrs/1pU85U9TPq+UejQnimzvuN2Bgp8ZDV89iH2T4CF7jhWLBOIsdJU93+VysxUi+h4/ySf49KKRbWEuDgUfIJN1UdfzQ1PoRJetXd0sCghRy8G5Mk03psticNjn4kpo17P3wiL+ZVe24UYWt2FIwoalG4lDOo4vlUskCk78XmTZ+lU9ilCgdLZXn2J/kA+DoVxX/9Fnj3YQ108FwrwBvF8NJCiIfVrqDHdzZ5G5J7deH5coPDaKqMQIw140ixRVa+K429r1wadQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTjpKB+trqq3USz5TubdsArA0IO+CGOAljGDdxUIjV8=;
 b=VdFljysZKK0pocJMEDtyWn4JAW+QqSLxG+ZJgm4biZyQMW5Ck88XFwMVFDtfyToYswG9s4PPDLw6YAIShX/nAkJAzOXIfE3tBAvsfefn8fRDvwrfLJ8u/AQJQzjX03///1tldzIxjWmZvXvTbee5Emh9sdTTwipOYh8TcbxchayE1Ijq64vMjNUJjxSqCdwJpmwgiIcd0wFI+SmtYdG1Fb0oQ+WwEu5B+jgRRlTHZorOLrr2LJUMiYbvYsjbKzdL6DbJpv/E5hnh3Orhl+X1qkOpTVVjAETPVnwnKWHzZ0RJUTIKEwe80ARqSjM/VpYTRFw1pg2j/VAfaCR/Hg8/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTjpKB+trqq3USz5TubdsArA0IO+CGOAljGDdxUIjV8=;
 b=EcyHaMSJ8+GT0dvn14YZ/6fnXuPHWUP/9NqbqbLg6RKeLbScjhNRNn9kRcQicyoo8LqNdUsfwsdBIbwHNtOj5LM2zm//tp0fuad31JJWrjPNPalGQtc/T2FwOdce8iPM4xzvoW6on51KvIxk/NlcM4sAUE1+OPYRwAQb6sprKvQkWGEv5xIPoqiz50EnSa1pvFb/GCiJN7kYaUg3ggUpGwrYr/FSAnL/Ij2NTksBMNV2e3HdTtQagweQKF4exWa6QgyyhgR9GaKaSG24PlNrqBjMOJzoDPbob3tiPvDkdaQQZAbSjIuTasMOzfNz0ixCfLZTHWqYtw79tcQvhhGveQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) by
 PH7PR12MB7843.namprd12.prod.outlook.com (2603:10b6:510:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 17:27:42 +0000
Received: from DM4PR12MB6424.namprd12.prod.outlook.com
 ([fe80::8133:5fd9:ff45:d793]) by DM4PR12MB6424.namprd12.prod.outlook.com
 ([fe80::8133:5fd9:ff45:d793%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 17:27:42 +0000
Date: Thu, 27 Mar 2025 18:27:39 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Message-ID: <Z-WKi_aKOMgbzU1M@gpd3>
References: <20250325140021.73570-1-arighi@nvidia.com>
 <Z-SasIwx5hINm1sf@slm.duckdns.org>
 <Z-UEkJfkkBBKqCyU@gpd3>
 <Z-UgI3dSwcLa-CRC@gpd3>
 <Z-WGRetAL9tSPEkv@slm.duckdns.org>
 <Z-WHnYrNHHYx3lpa@gpd3>
 <Z-WIh6obKP-ygcsP@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-WIh6obKP-ygcsP@slm.duckdns.org>
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To DM4PR12MB6424.namprd12.prod.outlook.com
 (2603:10b6:8:be::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6424:EE_|PH7PR12MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: afe6fa91-7d16-4050-dad0-08dd6d54ae3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6u2Pk20iuHQp3Yq9kLOEJZo6Teewmtw9CUZok4Tc+z6Jf2BbWvVbXKtlxKuz?=
 =?us-ascii?Q?6WEfZ+r62KsqL+0FotLqMVGWCTAfkZry4SL8RGsWY+haO9kCFo+2tMVGs74P?=
 =?us-ascii?Q?zP6l8o/ZmvbPak/P3VIrs5fFKUCSDAqqPzoPCf7EfkZigMt9Uq0pjo1riyr+?=
 =?us-ascii?Q?8K9kOORoxn8mErOLNkIB9JOzHHX6gkdaTGtDmJljpk3gh6xcw86KW+pUyPVQ?=
 =?us-ascii?Q?vomHW21NGIwu/6pi9P++1pBWioDqoH5G5pCyGG0L4so7cp/kNwstXQcxpXNl?=
 =?us-ascii?Q?qHdezIDa+JlQkHy7Arm5Z11jKh3LTbGQzorsdqJN/dlM36siJNE7MzGdb181?=
 =?us-ascii?Q?Ak1hFOVq994JCerP8u0NH5qR1BqMv4DmbAiibARC2JpknHYhzCeQ9WlR99Zy?=
 =?us-ascii?Q?BE6lPmuPt+Bjqhs9uEMS0ljl1itZudzCBlmFz5h82LZjOF7EEPjdsLFe/4WO?=
 =?us-ascii?Q?Szf1BCsDRUHPTapxYLe3Z5WVtZaRkqhWZqafdxrxD1ElXnYfkOe0dC5d/pg/?=
 =?us-ascii?Q?UxZTbrVA62RVXZtlx2n18w/pKkSFGpi6894t8GYwDDozkFlemPPOBRGqyKMl?=
 =?us-ascii?Q?PZtHv2cKogdd8818r72Dq/UwaTb96T6tEg5U2OwouclgYszyToT4A3zv60at?=
 =?us-ascii?Q?hvvLkX8+Oe3Xjh3S/CoLWjWABbzIAG9p98YEdQ9k/kdqm/iE2f6EpDKf9p/h?=
 =?us-ascii?Q?dNoxIXFxEN8JgRc+3tODkDGuYwTDlGm/n9kOame8Yy3PPhH+JPjlSWJqRHZt?=
 =?us-ascii?Q?hRr1iP5ti6DcdhhCJ3cV+AuTIbeLo13ykrMhd3Jt0mpboUTsx74TtY+ApPP5?=
 =?us-ascii?Q?O9j2d71C/OIOWx+O+rpRYLyEkRol8mVYxqLnH3F6d07IBf3RdxDMyMCeLRpg?=
 =?us-ascii?Q?KfNtCoC2jtaMq9Ig/i5VnEqM5T+F3NsO0dfrAKRT5x7Udfg/+0al0nzCRCMM?=
 =?us-ascii?Q?6/UBIlu5cKthoG5UYBJX0GHPTeytFpq+BT+ElJC/5vjurxB8JFlgE2PObi1M?=
 =?us-ascii?Q?8nYLmICFuJyhKfLK99lOihc3/7a5sDH0y105gXan7y36d6whm+Oc3BV1UQ1j?=
 =?us-ascii?Q?seqUYJFpklq8HQAo293OB0MFchHHk1JG3gD0qzZLRZsbu+k1uBZP45+wk5TS?=
 =?us-ascii?Q?4t1p8Qvh5D2CaNJkDVjOylAXmwUAdhP+JtS26ypjFjflmJEPpa6KbTZBRdny?=
 =?us-ascii?Q?UGyai49WmQHLtpdosTM5mAg1nIfFkVgL2UKuCz0KLsiTyt2cGXFchVgBYDEN?=
 =?us-ascii?Q?NEcrQav6tyvFWa7YRv201lx9arZabKRTyM7QmMkNX7bKB5IPpdGraz7cWnth?=
 =?us-ascii?Q?fFTNrBjbA0jd78Me94/iO8WHk/N6GuYBQW5oudFlk7wQq8YCQTPwh01TZHoh?=
 =?us-ascii?Q?xjY+FSdM+DuwsV8eRRRMmnABD8e6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6424.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Txku507ekkmOfNBX7JAwhvZ5tts/lR9DqIu/D0qtB5ir5NgqitkT6khjX8e?=
 =?us-ascii?Q?ATrMQh5PJk29jgSUdNIXlx5oUf3M3FyyjFnwWP6W16n7fBF0FqY0QRWmxaDJ?=
 =?us-ascii?Q?be24uvEvJXbftWdqWkdjtU0s8RMW4GEAjaMZiB5eeWNmBfixzzWdDJDZvQ2K?=
 =?us-ascii?Q?s1mmpgYgehVfQSCUgREuaScQxClpoSYZo5rmshiXp+DcPdCj2AWl9GbId5EA?=
 =?us-ascii?Q?SkALjxctcrobkvpZs0RSKFR3lZiQsCDRLB4KhOZ0B7MignvnS/dKisECDrmB?=
 =?us-ascii?Q?kmMO+4RVsSD+CYKfJB4u3XDrfsfxGtLv5Nvg3wytUFuc/8gpS8lJaQnA6J0/?=
 =?us-ascii?Q?1py9WLqHLpDue5yTd1+4HLKdSgCuaEeq3DvLMjEKe9aHRzx5M8IX//vx0j8Z?=
 =?us-ascii?Q?9d+iwjGGONQyKOTEE5zfZo4kVaLKggXgIpzpyafr1nBFGK1isWbtsMOEk0To?=
 =?us-ascii?Q?zZF5aYHeF6NjyjrEAVozWFGUoawNiJeVlKL+LTbOy5I7wf3z4ErJvgTQgsIG?=
 =?us-ascii?Q?qiYT3Imd7JOnBzglI5JhZC5KaJCIqeHY8zPWFuXCV9ebX1WYh40037gl+2ZM?=
 =?us-ascii?Q?VVjD0vimFtC9BhHAVeP55qk6q2UbJeffk6v5S0BfsKSsqAAUaPoQxg69I/zR?=
 =?us-ascii?Q?Ts1Z45GubhLKS0PI/Ysd3b2mjRIyyIB0S6XgF57sJDRcbC2oie6U7QlMP4xa?=
 =?us-ascii?Q?7EupCmLOLEd1MwPI06S+hOfURb859sPwGaxxwmh7N+IZVfuRbqi/POgzpvos?=
 =?us-ascii?Q?nuNFtqV30DZDVJQiR3WjLJJn/CzIEl8MPWoP59yzc1GLcqJ7G/87KNjZLjlU?=
 =?us-ascii?Q?t0pPuexUSC0KIPCCHx2wcgkOWhtze0U6lEM2CKt7eITY6TOUesOsqziYDi6K?=
 =?us-ascii?Q?yaEse1GXWp2R/FG1/zZFNbpdi0m2QhUdwxdFkgcscaN1n7sWyyxYkThm5Fms?=
 =?us-ascii?Q?QVthoYUf+unRrZ/reQZc2ItkrNYvwFxCtk/a6hAlBZ7A3m3ppQdEuzR53/aE?=
 =?us-ascii?Q?FTojZsr5QT1AGT65RMaDgBQEHy//sGjxCpRwq/dd9HQftthCKGdUoFD4Gm+F?=
 =?us-ascii?Q?NKwKEvkNTfGhDHTCWefQcgJSPuXsSGkU4A7j01uYu4dw+HUd7Enwft3DZFwE?=
 =?us-ascii?Q?gUhVGuQyC0utCLxhwoldLbTx6n8xKJKSqBnJ3b/hoxdu1OaS3AlOaW4ZNcq+?=
 =?us-ascii?Q?ZmusdsEU8rGE/EkfOJTyCroK610+1b+yL2dowQWdIt+saOoKnuR1Av5JMRr4?=
 =?us-ascii?Q?8mtgwsY+SfECyd1CvlE4xncebXOd26uPOPdEBP1XQa26gswejqgh2TE5edEN?=
 =?us-ascii?Q?8p86XMSG+23wnNIDud+4Gg9j6WHlZsNVSiZSPkr1fJVFSukKl+Il1D7sra8j?=
 =?us-ascii?Q?69dV4GTpV2wOEohdRO8ivZZnlx8Q5dM+7/eELQ97G2mo7Mdd05dJGgmyzdwR?=
 =?us-ascii?Q?xZ257LAHEuvfySzQfvKuB7mJ1XycuQwrUwZ7VPWUNDmPBn29R2kDwrY/gVaK?=
 =?us-ascii?Q?HODQwaYU7LDMQ9O5UBoVB2P9AMK1Ev0NZhbRVPhN/LJ7RyzVRy7Myk/Ki/oD?=
 =?us-ascii?Q?eqvQzhVzDqLuDkRvFpH+9MTk1ZK+GcU5YIRIH3od?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe6fa91-7d16-4050-dad0-08dd6d54ae3d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6424.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 17:27:42.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbyuFE2zxf+OVJOWntd2ErIwR2Pc5MvPJDfaBEG6ABV47wfF5N27mZEKvzST2ikrhEI6jVnOXPnlKU4CYLaBIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7843

On Thu, Mar 27, 2025 at 07:19:03AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Thu, Mar 27, 2025 at 06:15:09PM +0100, Andrea Righi wrote:
> > > If we don't want to do locked rq tracking, we can always use
> > > schedule_deferred() when any rq is locked too. That's a bit more expensive
> > > tho.
> > 
> > Yeah, I'm a bit worried that locked rq tracking might introduce overhead to
> > all the scx callbacks, just to address this issue.
> 
> All operaitons are already wrapped with SCX_CALL_OP() and updating per-cpu
> state (kf flags). It's unlikely that another percpu variable update is going
> to be noticeable.

Ack, I'll explore the locked rq tracking way then.

Thanks,
-Andrea

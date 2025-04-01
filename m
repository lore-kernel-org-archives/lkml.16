Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698116C684
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743488498; cv=fail; b=UqVO8iJ+nFOKxGbBiNSaiXRmqu4Y2AE8Hj0ayLBm7K29fAnerIaN26uyfG8uDjh+71YLCx2J1WEKWYF3tGj97fwSoiX8CtyTZnIKiXQAD+Tpy2rAwpjjh7Kusr4SHjCNgYZaUdbt/nzglWBHt3zME17UsYDGXowugwWYtkiHO70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743488498; c=relaxed/simple;
	bh=cN8EZQcqFzh4Z5IJP/Cdm++gzVsgCDUCJug38Lx84sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H99OJ3H1RMmSbIK/kinxmfZVMXif3qNVI5UjswtZDQmZiRH/Olwu+40i5BqzcBZRv1WKIgLr1ldKF2/vMzwDYSiI19SY9+PiDjEpoSgsdq5vTbawlA/agNIPSnVy82QbS+/z34CNUadwPb05QO7VMOtiS/WecwuMj5m4m+B32/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EoClabXa; arc=fail smtp.client-ip=40.107.94.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EoClabXa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRo/8sf1ddtOkJmgd8pxDDECoNjPKEVsy0pDOE0lhVoX1tF5XfDqSLN5JZdPWX1PtYl3NCC15HNkEnqaZMhUd3Fpkj9dI5fC9KTv1GnDgkTD8380Ocdk8sAfRNiKHwQGyXsr6yDzA2pjidk0SbgcUl/bpHaoy9RLyWA6YlgCTjNHGBYxn2zdgLoEo4ULd2BTobK78fUxmFEE+j/B2AywImM94el4Opyl+Ojf9LbnCHEdTaK9A0zCnT6VefV7U3hCNA4Mz1xnU95WPx6HTKZnnaPgQdDzwRgDABVQF+AznodpgpzXBepTNOH5xKpFroweXXWdhg7OgX0iA+jf+BEbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l8dF900bSCD20GOcqTe6PzXAiIi82XbwQuQGBFxjIE=;
 b=sKjstnqDpiyXjJBxHDCidYsKB7l+xJ2UKf8AceOmymEeTFicRb4lnHD2EEKGUhoIyvtqfAC6kZ7+V0/Lq2FYR6UcwCvyd6maJ96U3fvosf+xsQnskpYs7QESKV+9uZL79jIdp7hekrvBMNw7ZW2TYGfNp4XyqlhW+gWMAJzkxuC9aCVmovkdiTKiWayBeTfTc+QVjT7a/jYXHC3P+MhtNeazL2EqxcysoSCqaBAEODLlFI86VhZsdq4bzGeYse+rFv5W5keXKXy+A1Ixa26S0fviER9mgRCensPQxwQmN7qMK1TEQLmkTL0SY+BVa3+BmeRgs1M6biJ2VXiWfPVYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/l8dF900bSCD20GOcqTe6PzXAiIi82XbwQuQGBFxjIE=;
 b=EoClabXaj1jeb8dnUOcmmjBAboqavQV9NmDd4RigM0jaq12mNinpebtz2liqM047JcdjRyB0xp6nBryGB6iDmSiuqIdphFJXA0tY+xU9QHk4+SDhB+13T8jzwTtLxjPsfhnBujk3QBhR3n8DG13CfSSCEaVBpt3Zgpdj4MqU8l31BFD4dShHVLUjiICkmqOta1VRpEafLRGg84z+V2zo7HuukCP+l7qS7HTsKz0QHd4gEedn5Uag3X4kvU0YNmKQru9QvQx48keiQczo8xuXuvojVuLzoeurex44e5Z/YXHTntm/wzkRA+CkW9CTZ14kv//PXaT2SsquwWvcigVn2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 06:21:33 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 06:21:33 +0000
Date: Tue, 1 Apr 2025 08:21:22 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] sched_ext: idle: Explicitly pass allowed cpumask to
 scx_select_cpu_dfl()
Message-ID: <Z-uF4v0-MZ4iQFDZ@gpd3>
References: <20250321221454.298202-1-arighi@nvidia.com>
 <20250321221454.298202-3-arighi@nvidia.com>
 <Z-sOIwUNgrjbQJkx@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-sOIwUNgrjbQJkx@slm.duckdns.org>
X-ClientProxiedBy: ZR2P278CA0089.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::20) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SA1PR12MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: a60ed1f5-b84d-4e04-9b90-08dd70e572e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yh58rrUe4lsSfoOelkk7/30Em8CpjiRLwHNzR7/f7805vb7Gvit8e69LD0WS?=
 =?us-ascii?Q?ovLHeeUuZBlxvak2mMNgEnOlqoHNhFe5Jpa/gy/hZhYBR+/17K2HoqtwOS4i?=
 =?us-ascii?Q?fodKTPAYrwaIpBylSu5w7+srkYPeZi0FVa9T+iedwNTYdn7eyHYCoQAZHSXw?=
 =?us-ascii?Q?4uRnf9S4tYvD55jvW/tUnvRpqFhlWfEzzq7I31q8t56xZwpJN0SkLuzDo1Qq?=
 =?us-ascii?Q?b7Q/dsfz/hkPpeFSP0wOdXT9LTaedMIx4u3kUeLxuZCug8fmnIzqr/vvQ3US?=
 =?us-ascii?Q?tAIc02XkSO0FQityFQzRgJeJydqVTgqW0sV5nbKZWog9YbA5CXCYXu2LZ4KG?=
 =?us-ascii?Q?kMTTPcMIlHuiNU3bmbhsSs0CoaP9g3AXbeScDHe09v6gqNzWWuY+W/sdg3GD?=
 =?us-ascii?Q?5AXReoq6TAVTxRD4//fYvXTx4wpmw4njR5MglFRDJX0aJlCFFmZlRxt5Tl7l?=
 =?us-ascii?Q?oPbLIK29rCG/C3TnvAAzKY2+nIMEDgUEWCsCPLmzXsxI3g7l6MpZYz422s48?=
 =?us-ascii?Q?W3oub6b2OvDFjPl+0kS4NGUFT8CuAZTk+zVmAWXlsCGBOGhAip9mFvp/nQr0?=
 =?us-ascii?Q?BeKp62i8tT6aZG5Q/G42KqJAPRgDtZvYqinnshAqhZW1vIjmJUlLVVzm6DMz?=
 =?us-ascii?Q?oefG4oUvNjI7FZKp8x5j2Pjojbz94/ReMIr7GvioRpnVy20jPvDRnL1tPZHj?=
 =?us-ascii?Q?HBrzzvkk3KH8mSRG2pvrnlT2LhZA0gN1OTb2dV7c7jODNyhOKLzGbScXwxYB?=
 =?us-ascii?Q?vQ8tEVTw3zASotDtZOZg0hGUYCDBoQU3vl49YZb4tqqbwi9IEcMYbnjvpm6R?=
 =?us-ascii?Q?x33JxWX/ObOVJDtBNeI/vAX22kNcrnwiYy535jYF6xiMec/qo5xXm20Uwy4K?=
 =?us-ascii?Q?fpdaooNNip2Ecc/ZkQHVCpLIwrTpbKl9qF2k+ai/eQ1Q22zE+crWp1E3Z1Dp?=
 =?us-ascii?Q?fC8OimM/Qv1K+QbLNL9jB5iq5cHJfLXiR8DSZL0n8n10Xmj8rFzduRGHB9Lp?=
 =?us-ascii?Q?im58PdQExpI8ZVHVP4/HDPkMl/OZaTqB7Bk9e9LHQ8em4HgXB1P8FiRbqgKn?=
 =?us-ascii?Q?z4hx2v6qvkF41NT2CnBvnXjDBNqUeSsI1Uu9rDXAHlk2cfEig0p3cezK3YNJ?=
 =?us-ascii?Q?Nl7NKmE6jjyDjPljKEacaCZurdI1eke5Oe9qGZtzW0oZ+T9vRWnXq3AqkpSY?=
 =?us-ascii?Q?GXoHgD9IwOSPSpCjqhUZtaw/mw9q1Y5jB9hSI5tSBzGVD3WWvBG+wQvcTdea?=
 =?us-ascii?Q?xN77Y4z+m0mOJwqKGUzAEHMNl8g5C3YOT6mxvdKnWUrRsoOffsvtPplVPBOp?=
 =?us-ascii?Q?8N/vu1ftI/JybIpyiss0XIiLqnq5kVOM8TBsJYRwkq/Hg+eGPqa9Qc1q+UTR?=
 =?us-ascii?Q?BJgGto1ypa5UxN3+faiVlfr5k6Fu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7pnZCQk5o+z0ZasD2q7AkPqoXrccWLm8FR5f56tcVQMrj/CKwwAExxKwU4Mz?=
 =?us-ascii?Q?vTAi5eThPWKr3ONFpl9G8JX5KUEJkokkspBW3YL4BSvHAOrxAmdwFNWgfDfG?=
 =?us-ascii?Q?P7N6EpB1q1k28yOycv7TEoR2rvelhfWUNrQnEk7UperLQ98P1+AyTkiQXef3?=
 =?us-ascii?Q?BZK+aRXoAwEPqBC4eyAG1rWVUrm8Pre6QZDcVpx2SGv0h2l/Kz9gXz8VKUCs?=
 =?us-ascii?Q?D26S/3W9j/RRfG9fKOws3kROGrId8CVAxtxyIK0b124kPScEhEWUVnalpkYq?=
 =?us-ascii?Q?qQIv9buzcuiOqHc91ZYj83m2RxpUyYk5Cl8RnVFhJ1gt1ixk94CaS763/SCv?=
 =?us-ascii?Q?1oanAhNbE605dK2oG9VBGa8gag/WIf46+2F7Y9xUYbfO5iCS1vFB3uMj0lqk?=
 =?us-ascii?Q?CNbf6X/BUC+iiTNV5w0yoXmgV6EzxM6lhHxzmAzzCxhaYOJWAOqpfflNxCtS?=
 =?us-ascii?Q?mQZIzXvj6O2jS9qljq6MRDY4/Tb9C9l9Hv/oxwZcMudrPs+3fIAm3GUa2JGg?=
 =?us-ascii?Q?XaEbialTWZi6/EVaYKe+dqHq/likXOeuz/zbIeiQstwTQfERrptdPU4bHNg8?=
 =?us-ascii?Q?XTWR32+Vm8RBximFNassnMEWMSmRGqp4J1G6poDDAxsFC9cb6APP7/i+tM9a?=
 =?us-ascii?Q?1tZYoT8x33WVcFfGvqJS7pzEGvLfYDqnsKXdvrZKndkHP5e020q5TKgaZlOT?=
 =?us-ascii?Q?py75g8vmdjgnNbcTNzMos8iIIPe416htKDDIcZUIJohXvPAI6BlIBa4ry34O?=
 =?us-ascii?Q?a8E7pPo8BqSB2PwljETomIx+xS4keDU4Ndh/kDROyZe0xfemZW3ujFLqWOr6?=
 =?us-ascii?Q?EsL4ghy/iVIIZwRKYKr/S2pA9Gl3BNvwmsmlg9G2iUyQFpkLpxA602jRFZpa?=
 =?us-ascii?Q?nr+PTiFlyrOwCAuZKLdgebMQQYyijT/Xn4TRJs1aEUFxB2mfOYXc2nteFHZ8?=
 =?us-ascii?Q?VKnvsksffuMWgBU2LY1VlIUhzgqzeTzf32oIa6g4iEsWgXZ3xT6AHUnWiqzf?=
 =?us-ascii?Q?+JbOyEfuaYglrFQssnSEtO9ASYcwRzl/5D2YbdkbOAeYOFWaS//eoGYX4Bqr?=
 =?us-ascii?Q?suqocy2+m4ok2ztb1c0mjRF+9Q1oSLEeSoNRE0rM3OeLh3aLgVVDYF5W42hS?=
 =?us-ascii?Q?9ypj8qwPs4VnyD6/yGURFBICT4Nvy41iH0cGNewkp0H99TMy/ieftvveUpr7?=
 =?us-ascii?Q?h8Q1h8vZfwSNrEXJXaNs0tZUUPgqI4FETl/+iuYcYmvYTxTQ4Jw5GNePR6Fo?=
 =?us-ascii?Q?HXRTnLF7HGrTC5qviojBHdImpF9pdiWJH3fWOy5AbXS02BzDUbMxRRPC9YyZ?=
 =?us-ascii?Q?EzJ/s2bV6hoV1eeD+snAVRWbnFohbTZqg8REA0dKH82w9AI4SItREfHK/r5y?=
 =?us-ascii?Q?y8WU0HWjbhvkPOpHnRGyLqs5YMORf2a2iAEBm9YzjTnLkjuPX/d0AKYdKM3/?=
 =?us-ascii?Q?5G7hyOG96j8JxoBUiLzvnKkGW27d8qeHbYa3YAYkfdC1+T5ncmDr+FUVzyY5?=
 =?us-ascii?Q?fVGSgav7k1EUKTcgkEs//LVrlvjlFOZWDv0v1vBybivGlBymJoYls0vR9xmU?=
 =?us-ascii?Q?jXGh21xoFQMM8NsfTU1SB7B944jdCOyNFH5lHWsM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60ed1f5-b84d-4e04-9b90-08dd70e572e9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:21:33.5608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sH/eLO/E5cSR12yLRqGzQ+TEzbfhvAhXUIpQM0sPzMnpiU8hZXkmegEKYyoUA6A/CXhvkZFmzmz30/kgEga8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6870

On Mon, Mar 31, 2025 at 11:50:27AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Fri, Mar 21, 2025 at 11:10:48PM +0100, Andrea Righi wrote:
> ...
> > +s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
> > +		       const struct cpumask *cpus_allowed, u64 flags)
> >  {
> >  	const struct cpumask *llc_cpus = NULL, *numa_cpus = NULL;
> >  	int node = scx_cpu_node_if_enabled(prev_cpu);
> > @@ -457,9 +458,9 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64
> >  		struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_numa_idle_cpumask);
> >  		const struct cpumask *cpus = numa_span(prev_cpu);
> >  
> > -		if (task_affinity_all(p))
> > +		if (cpus_allowed == p->cpus_ptr && task_affinity_all(p))
> >  			numa_cpus = cpus;
> 
> Note that this test isn't quite correct. While the error isn't introduced by
> this patchset, this becomes a lot more prominent with the series.
> p->nr_cpus_allowed tracks the number of CPUs in p->cpus_mask. p->cpus_ptr
> can point away from p->cpus_mask without updating p->nr_cpus_allowed, so the
> condition that should be checked is p->cpus_ptr == &p->cpus_mask &&
> p->nr_cpus_allowed == num_possible_cpus().

Thanks for pointing this out. Considering that, it's more clear (and less
bug prone) to just use NULL when the caller doesn't want to specify an
additional cpumask. Will change it in the next version.

Thanks,
-Andrea

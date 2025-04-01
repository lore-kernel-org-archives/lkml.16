Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929C71DB55C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489336; cv=fail; b=S5KYhdSl88fFGqcMPa3hRhesYqB/hCxzTaF15dSS0hCgI3zb8AShYpksVKGwOF8Dwna49Hv3wd7Ijv4qwK9Vd6tJxvwG+ntG9icRTQ/jijTZeplI2uo+ED6t+XPlt8VxAU4nnC5QvgoWVo+qmOOAxlQ/BZ2C9zbBMjct40IB6+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489336; c=relaxed/simple;
	bh=PnhTLBg/favWm0t0DABRfIOGWO5s8hL88pnqw3oXFJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KHequywQeJuUEhPcQKnjFq1WCRK7MXN/WfkzB8wB1rhYNsEmVxtVDnPHPmJ0qcOVbOheeQyTcQtEvCHF06c9zrASQ7sup8rPGftlSSOKseUTFVx8vc2VLs96joMZtl/4EgVUFafO9e+hJUjzRA8qH0rNibqi31IxPv6GT0nr6Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=APFo2tu5; arc=fail smtp.client-ip=40.107.212.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="APFo2tu5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYhht1TIR45veERHGULJTGZvtzP5yZMYSWhju74oz5gVzaSyNtoFnIlYibHKT4Ryrq8Sj94n/mSW78nrYLZMuRVzmyYwpsCkbK36/JM3l7MhPH7I/WLPnvgmi0wEFDrLOqfw6VdZr37TCjWAQpxH/NGw/2tFYLoMeidWGxo4Sx/qK8CLHZdHoDrKeOgBwL7xupU6BeShER2aimPgxLDWc9bC0BAbqHwudIYwdXu8mF1Y2H5cghvtJyNT0kiUa7tG2HaHnAHiPesLMmTwkivPGbZbi+vem9EtsmkLAowOPFnJvGP738fHw4UNxHjP9pwpK8q3CrO0PJUAcxnBL5YCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY+D512B3vFz2BaoxIopAVzCETLDNo0Oz27fhtxkwgg=;
 b=N0TaBBs0G5ZtXRZRQzeRUSLTZWGZ3CCu12sNlS5e/k71ytSC6PxqtI6NcWrZHI2/uFJbqdOS1rNPzkj1gSVzOQhFB6SIEEazfEdyVt9CoBpLt9w/Ls8c0xi2AKaKidvMN/HKynPBfod/ljbOpu+85h07ouJoH6vhoZfwc1mm5g+E1Q+ZWN1OHIxlhXbLMeuOs1XYbJw4VaImW6XEk3rPXD0I0qgFIK13p5KFx9nEF+A4WnQ7TJnVkU1k5MkcGP0e10u5ccsVu8u9z3+GnQUnjeZJkTokMJAowGSkD26YuE9CxgTgWqgQwEByMLGkH+e3AdaOTT+WC2+GzkA/REsCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY+D512B3vFz2BaoxIopAVzCETLDNo0Oz27fhtxkwgg=;
 b=APFo2tu5Uj84HZKSEE3L63hzhrZ/PMyUoNYuYi+wmf7eNjSHDbrFNXKa+wagSC/ioeHPrlZKEx96xUTYH5x/PwpsEOw7OKhEEzEZjzGXIp+1guvm42CQ+zVVfmOcPUTZYNqMszLXTYfcMEIN+R2mEIC7APy3LLSWF9xxRCR08wrwGYSsG/4pP/f8NLffuEcDIQJreYL4JP/drBnvCOiBAAlMLdxxBTXP2D3j6e28Qgl5/CRehsKk8UzkxzNYZNMBxaIbCGd9KWq5IZ1Gb7cJKto3fZmtEFqXTMKWhUOyXmNnlXXBLIU4In2Bh/s/XTLNlRS4yhNZJmTUEidWJ1zE5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 06:35:30 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 06:35:30 +0000
Date: Tue, 1 Apr 2025 08:35:23 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] sched_ext: idle: Introduce scx_bpf_select_cpu_and()
Message-ID: <Z-uJK3LiiG2l5wZP@gpd3>
References: <20250321221454.298202-1-arighi@nvidia.com>
 <20250321221454.298202-5-arighi@nvidia.com>
 <Z-sQTkz8mOuUKar7@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-sQTkz8mOuUKar7@slm.duckdns.org>
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5a621f-547b-4891-4ef3-08dd70e76600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9YkMn/Lk11ujLV0bYnTTcNaq76ojBXAW5WDLFM2Lr8tFag9Wbjr6+QdCHcjU?=
 =?us-ascii?Q?uC2MyNKBBKNjS1/vuerObXyOoRHADh52Y71CqJzxxnRr07z9RfAikon5f98y?=
 =?us-ascii?Q?3D1xJX3HvTIauT3OfB0CUdXErsGgBXCT+hdasiEkEGC6JQTwwawbRXSLXHiA?=
 =?us-ascii?Q?Wh0f+wxtWNC+eQmrCsRpYpNJKokHv1qvydheWJZOTlYw76mqfJdPfLLK+wZ5?=
 =?us-ascii?Q?kdIilLGkblrk/5qUGJr8M/EyUrQ6vwfB5nL+GPeODg4lW3dM5tRVmYrjajI6?=
 =?us-ascii?Q?hHLuQryosYmB2rGPh3i/GGVKIP2yltep5VxfUSR8dXcwmjK9LRuCh8U6Uq2T?=
 =?us-ascii?Q?+/DYzCTw9mUur/IPjTdLBeq/lMEwxQrnhG/uvxgMiW46B2/YQwWZkgsRTHE2?=
 =?us-ascii?Q?y4ucsz+TICpssE4kJQw62kgQ3ee4X6ZhdTBAfdWcnQVcxQkBS6unCLxuFpG3?=
 =?us-ascii?Q?HHcyil/g1zOKCg4nTkG4Q93RvfGOvGyGlkMvCBmzxRTTt4PSe3rG3RzVzIS7?=
 =?us-ascii?Q?ALAhbnQqle/orqGaqPEe4iw+37rlFifjtvZqXi5W+rzTX5gmiBAE6RBfaQJY?=
 =?us-ascii?Q?0j42AHHdrGOZ9QCTuMGokYfktlfHaetrd9MaeAnH6kgUZ0AJQAPtJ+hi/B/S?=
 =?us-ascii?Q?atoTXesR/M0ftBLnyGZ8K7N5w8iYCvGmjIpEHBeWPJ+y+YJpn0KGPYSQxgCK?=
 =?us-ascii?Q?YtVWtVtc/GE05ctoveskb/EiqEXYRE01wecd7lNpHSoneOucNf7EVM6m6LCj?=
 =?us-ascii?Q?bbF/hehNBBxHCJ+VzzIt0ZD5ixwQehKai6bN9Mz2FOfHWHjvtIZksnrtrE8V?=
 =?us-ascii?Q?rJM0KifO0N8lHOeAydohdNFMfFZjA/V7Pf2/2vd+O04uOR/ow2NUlTw0ZTVT?=
 =?us-ascii?Q?UzNzG7t5+Y2XlQF1eOku62vaxm6TU/nWBUOX7JiM3hEhc8g16xd7sqlOv0d/?=
 =?us-ascii?Q?+iemr+YgMRSfPCiJF/l+C+yvrYtxWeun/0As+2ItvVr2oDeXxkZSEA3qAokc?=
 =?us-ascii?Q?9D3s2tjE2a2ptgNvOHM5VWFMXE1Kc58xTdB/6IOUTx+pzTYkt3qm5iQ1KS7U?=
 =?us-ascii?Q?CurbVM03HTc4HH17ZZ2LF4EkvCBOkfXfuBpR3ONUxzACjmeDEvJx4S6gwly/?=
 =?us-ascii?Q?wMlf7WnehyIFjqQlLz8HQsLi621rpebeuGCeCdstFdcg/9JQR9KywMu8HlwJ?=
 =?us-ascii?Q?XNjWqfEua3hY/Ge9n2dDAAaA2pgybnLLNz4Vkocg1Lp9tPxGJH+yRjyVYQ2i?=
 =?us-ascii?Q?SJjTiUQdCowelxXYv1Bc5VusY5EI2MkdJ0MC6/YFy1L370KcJbapgVeqKF9L?=
 =?us-ascii?Q?gUNDLbTSDmhQdSHO0i5ZYnVsGduXbNFsdYBEjyzp32vXImx23mzn0BqeaYrr?=
 =?us-ascii?Q?1uPFMW/08Rop7YjzVa2qpJO7+JRA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c0NdqwAW0hdRhQXy67QeohzumL/v9D6C/vGRxIsrVH0mV4I8WijMCgXCN4xv?=
 =?us-ascii?Q?3W2GWrw6i/UY4+sdwLaY0R7cbbZoDA7ESwtdyDDXTrDwhRAx44WWYlGie7Vr?=
 =?us-ascii?Q?2EI226vsQ2lmB7v+Iz8NnI4Oj6lsqguti9Mv32wlk9e2WCb+V04yPgmHvusV?=
 =?us-ascii?Q?lrX4YI348iEdzjq+4dxLqdj5Qxo8f4XtkgI6BAPRRVm3QpDVsT7YrNYEgm+5?=
 =?us-ascii?Q?ujEa47znAG2QYH7T0MbqVlcoZj4S2/IhXlDjrESKCNCoNs9kXZiYW4HA+dSh?=
 =?us-ascii?Q?dCYYGWhFmZfSsl9twMuGb+kaQmnsMoO1pqhCZNFx1p6sPNItKEoZW6o+Jh3+?=
 =?us-ascii?Q?3uV6Sj/W+ecOoREB0AK7NFBDBFE6iRgqHB6YwI0PlizZ2CYFx4sgUjRzNbAP?=
 =?us-ascii?Q?8v9X6IKEV2DP2psfMKkSsGdykVKWo2/aEq/CwJ8RKgeYZ4msLouQyXPbXW5Y?=
 =?us-ascii?Q?hmVoaOBljOhfZZ+N7buBqzIcWMhb9Oxg/A8NzngPEwgPjvPJO3hh++1h8VEh?=
 =?us-ascii?Q?Zfw/TIildxe652WURL7wSAMoJEBIEjvxVUMJFAya7ZnHU8DMbNggKB6OUIcT?=
 =?us-ascii?Q?uJyz+3kKIR0JfHk2CUCKbqi/NfPV7pkofO3ZA3G6jZqprSA4G1h01JxxWZcu?=
 =?us-ascii?Q?JvLh/63wRaOoecdxyL4ykE/UDoIPiMAoOuNDOCwIST/eT4I7WI0fB2TEdAjM?=
 =?us-ascii?Q?x82UiSeeaymzbyEfYe1Wi2i+JsckI5xC0GOFIE+ldGEw++AKbvRfr3rq72/L?=
 =?us-ascii?Q?po/GreG6V+IpH6bWdV5JJnLrDO+oAljq/9+TVb+44ovjJCTBH2SuJIgFV5FM?=
 =?us-ascii?Q?6vV9Qr1vb8zrJZPm60mlPPX/2A+XFTb5yPDSTOeCAqVkDPUV3F8Wac7RO18r?=
 =?us-ascii?Q?gC1f9v/3nrbx+DnvCjPBKobT7ZqMqrtxYHwTgMTRf86aliZlVjp3mxDNEswG?=
 =?us-ascii?Q?envNMQFYL0pYU9Nc5ZmKCyYkS9z+uFQz270aI8W2BtQkLFb+uTa9K0jjBuJ/?=
 =?us-ascii?Q?qnGBQcWWWSLl3dbc84iK9mGKlnuXSkItW69tMgKGp0FCbZcdH7G37EEMDm13?=
 =?us-ascii?Q?MvfjDAaW1spbF5PotnVeiAUTTGn+iSdRPEnNGuv2N6O68/XaZ4oLYOs29Ugq?=
 =?us-ascii?Q?+ZzRYnuwgNCWG8pBy7GclGxf6iLizHl8Jvbo/CQ0+1tAEwrefMZIY++QLTua?=
 =?us-ascii?Q?Bdbq1B3SehGiNf+r8NHJT2olG1MeL/uouxhR8h3vpteNzAja2/Dc3p+AGAeF?=
 =?us-ascii?Q?oT8bEezjBDuL+iplfD8A45r3QYMPsoqAPbgYsapAyWpYQ1laxxw2DNVtoyhp?=
 =?us-ascii?Q?pnjNTVVCH4sY/eO7OoKRJoRPII29YO6nnw7GuFyWrXrKKFECv4zQ2iMuweKV?=
 =?us-ascii?Q?cjp6XqQyi7TYWsuwPSLDeGTAnfxs9VoWXiQ6JwsTUGEh+PdwKc3U7/LoSinE?=
 =?us-ascii?Q?gMTSCFI7sdWKWgG4mWesGgI4OxegM8g+07RbDZFwuFoRsF/oWdnSIKKbbcLJ?=
 =?us-ascii?Q?UUXVeYYQZz16FuWXkIXc4t3L9GYA35cifNAl/aS5UfThMx5pAOHVqZ+uZ7//?=
 =?us-ascii?Q?qxa+0oR8dkGPYCDvbJAPCS2EC9eGFznihk40Kekn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5a621f-547b-4891-4ef3-08dd70e76600
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:35:30.8473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZAfMQxxYcqTwZGRjcY7Y6iDofxiUjEmvgbIRGoYec4up3nMhWQ/+ovPNixJJyorkg5ueauyepSpjcXe6dRZOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560

On Mon, Mar 31, 2025 at 11:59:42AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Fri, Mar 21, 2025 at 11:10:50PM +0100, Andrea Righi wrote:
> ...
> > +__bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
> > +				       const struct cpumask *cpus_allowed, u64 flags)
> > +{
> > +	s32 cpu;
> > +
> > +	if (!ops_cpu_valid(prev_cpu, NULL))
> > +		return -EINVAL;
> > +
> > +	if (!check_builtin_idle_enabled())
> > +		return -EBUSY;
> > +
> > +	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
> > +		return -EPERM;
> > +
> > +#ifdef CONFIG_SMP
> > +	cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags);
> > +#else
> > +	cpu = -EBUSY;
> > +#endif
> > +
> > +	return cpu;
> > +}
> 
> Later in the series, I find scx_bpf_select_cpu_and() being called with
> p->cpus_ptr really confusing. scx_bpf_select_cpu_and() is always constrained
> by p->cpus_ptr (except for the currently buggy case where p->nr_cpus_allowed
> is used while p->cpus_ptr is overridden), so what does it mean to call
> scx_bpf_select_cpu_and() with p->cpus_ptr as @cpus_allowed? I'd much prefer
> if the convention in such cases is calling with NULL @cpus_allowed.
> @cpus_allowed is the extra mask to and to p->cpus_ptr when searching for an
> idle CPU. If we're going to use p->cpus_ptr, we just don't have the extra
> cpumask to and.

Exactly, as mentioned in a previous email I also agree that using NULL as
@cpus_allowed would be much more clear and less bug prone. Will change
that.

-Andrea

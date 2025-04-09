Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B294827BF9A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225099; cv=fail; b=RafBJtcNt5EimmJ3nMnmYPyRbHUfp9ESQ4fQwwrH+/GceUGpSL31hj2voZrWzSQ5+ugYhoxNo21s924e3oAcgpKzALbp+6TZOYkmDC311o3Oh424+fSSxeKSLA6BHbsNQ/Ptivm0WcUEqjhGin86E2MppWmCYgaTb/akUoZtfmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225099; c=relaxed/simple;
	bh=1qpGuOdaqjMb0Ipw+S2cwIOV36bduB498+BhRSpTODA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jYwPsI6KDk/WOk0CkVnHCEyfO89zAQgcVLO5A7HdZ2/CU3sx7GDnmpwqCyX2P/aQJdGvfSwm0XZv3iRMgI8Cori3xlRgdkfUNckUOSREgRJf7E/cKmCCLDW/Ew7Jl2aEr5nX3IGfmi6bFK4u0FLrANaYHyWfo8zRotegsj7+drk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F5DLdSKE; arc=fail smtp.client-ip=40.107.220.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F5DLdSKE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oy5DItatpEy4xsigdlZZpwIOlxuWfUxRrjx5jW/qH8t5eezwInrP9WpBhXlv8Q/u0KmXvvSKIbFt342huZb/1Z15pypnFG28rysQkNxM8O7IxTJhGorBzNSJv0nNXzV+xuqReOCrVSLjaxKCC+rPoW8MRnA3HMd+5yk1+VK2IIteDtTTPg7gw35KuMBzo1gA8/EBWvx9oZA/ljCNUvAet+yFZpRUVdkuHo8YiGFZ0+cqgL004d8FT0Sdm5hw8pl3iDQRxf3k0L5bLu6sxPzu4y8DWO/Yr3k5+6CeURRrX8O7FGN8AQcbv5xKiWkRNDfKYuZ+MDc2QlqfwqJ5Nmp8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXqG9abJ+AqL96Dtb8B1LXSvVJIz8Vcnx9xjc9v2CWU=;
 b=MLoLanRIuJEh0rQQ6tJtYJlIGsBUJ2mzL6BEeUHte71TBzgdKUTE2pdSjVpw0e2lfsn+ARqpgAODYoRZPjY31cZREqXIn63nU6EVfxRlpC9B61HIZVBJKYPidBJR//iiCa8t1ZcNGBOYy2yvUMDhhpW4V8sADfxIEdPZL6ew04iJ7bEtJyE8zbKDh6XLFTfSpRR+4KhnbtIJMaq2d9DbzUl1k1XjoZ6DQY9ZHU0TOJ92efxMk383pQuTfNpT4Ep4HEvt7c4Hf51jrJ+1ijgJ4gLu0pAkrd5SmdhRNg5hE4vYfLhpX4sxfC4BETBKKW0kIIb2sEkOyMaYB6TxA+ls9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXqG9abJ+AqL96Dtb8B1LXSvVJIz8Vcnx9xjc9v2CWU=;
 b=F5DLdSKEqCLZAE7ywx+RTK9+VM+CaxLkqIAPPKYMHg/vwRATt4oIv4mXo7lgV7W4/rd/X2X+BUVvYEag9ex3HNsaGhJX0DIp0UaETvahso7R9P2Jln4PnGZt/c7zdQg5sDpzQuzmNm1e5Ue7W1Vk5qtJE+lpsahyWuV0UVCUjZQuN9/MCLb117CUq2LA7hR64NdHB4gyDgAPVPBBAfHqXg5LQJOdPHShiS35QmnMhe0DYDhOjQ0OtjoEzAqQ1rlDbHQAM7cFgQmOUOtsymMQ4/CL7CeFhtaEaDpsOZ6XDuZBDHtdewQvVgcYI5ub3kWiaWbozCe3Q85X81wIZ7lPWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH0PR12MB7959.namprd12.prod.outlook.com (2603:10b6:510:282::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 18:58:14 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 18:58:14 +0000
Date: Wed, 9 Apr 2025 20:58:10 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH 5/5] sched_ext: Make scx_has_op a bitmap
Message-ID: <Z_bDQtritOTHbFcO@gpd3>
References: <20250408230616.2369765-1-tj@kernel.org>
 <20250408230616.2369765-6-tj@kernel.org>
 <Z_Yoh6Is2BaxwdyC@gpd3>
 <Z_bBrENa2luRC7nT@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_bBrENa2luRC7nT@slm.duckdns.org>
X-ClientProxiedBy: MI0P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::18) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH0PR12MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 606ed598-5364-4768-18df-08dd77987aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8jzNezPujLn3astkUyBf2768DJFRXvE9NduWf7o15OdJyy69Jl/yrEx6nwaM?=
 =?us-ascii?Q?gPBbaL83REZ5Lx8X4xoV1iGVmBVNV6DMmDMPL1BFLMEZoDgoOo73QXX0CtvF?=
 =?us-ascii?Q?xICUbPkEDkrh+IQq9av6tOy7Hhc4MR37ivfNu9W5kSPN/oAzyiB0LLhx/keM?=
 =?us-ascii?Q?y77W5qBAvu2SNp1fkl4MWnZbGf4348hSa4Vm0+mKbt+pYVULn7TuJWY5MpaA?=
 =?us-ascii?Q?6aGaMWFkJpG95CMj2gQIIW1lr5i2waCPT0dI4RpX/9JvYwnzf+/He//H+Cib?=
 =?us-ascii?Q?KhVloXNnWXgObG2vxfoSGKoJTI7460Cz0QCCpQtMImZ0Q7vuQzxUuXHhoG7H?=
 =?us-ascii?Q?6UM3vuaxVn+SfEeSk2D736YdF8h2jnCzLkqkhlJfIE74/T/haXlzzWjGxwmL?=
 =?us-ascii?Q?WDLCmLOpvvora2Ggj7L9G36MgVLBCddoi8in7U8++FZJNTsekeuR0i+PD23N?=
 =?us-ascii?Q?HSqVItUKOK9FDxx5sSNaAWOkYD0O/4ceHd1NE8CqHj9iQcKcdAsVMHrkJ7H5?=
 =?us-ascii?Q?NkttqQobU4oFgsOVRrASA5lCB+Gt3aol8bdEsDiEsFV69He0CS4Wns6+rPVJ?=
 =?us-ascii?Q?t/6SQ0k27W7HpWmxxIH2ImeaZihZJWri43CGrnkE4irashQOkO+rskPVburo?=
 =?us-ascii?Q?Hr43J3Odhm0qFytK5LBHzAu0lmByWMMtES7hocjwjcFPwBkHhFfeu6mZg/KT?=
 =?us-ascii?Q?dYg/pvwAy/jwdMHqhzFCIECgKOMphrfg14ThTe3ABMH0mCLueYO6xtrwe6ML?=
 =?us-ascii?Q?3NOjkJRbD+eKbDJQTxzC0TmkWIwOrq21BOrtndKsqS9ylA4CnvZeVguSZ5N3?=
 =?us-ascii?Q?4Yet1oyqvMOGVSmRD+TVj0lchLkpTmR1s02r1AyYf9TKPybqiJPGYWdrwcgq?=
 =?us-ascii?Q?tEhMhBPmmzn6x6LVgUx58bXC7aWFY36Ig5Ew3SJIwp0+XpVucvqoMtqOHfHV?=
 =?us-ascii?Q?mF+ZOd9aP3Gmxs7IBlStH0ScX3l//XjfTgUfpn/n+r/f7um/pmdl6Q61c6By?=
 =?us-ascii?Q?XhEHNoWwJ3wlNEZYQ8KI2KzQ2yTC9f4OvzKVVNOvYLd2gWno1zrZDBzfmwVU?=
 =?us-ascii?Q?/6h5X4/jxhYnYyVsQT+U3lHh4WyKtFi/m/KiEG+LJMWcvbjeUHmRnoCEuex+?=
 =?us-ascii?Q?4zP6Pr/yNR/5K8sjYhlVwDorXedTchaOL1+pSrTNjOlFxLBheQSS6nt3PkFu?=
 =?us-ascii?Q?i8WBnUNXNNp6Nz2sRZJcHuk2Z07NfdVvzg/EVlXt9JsEPLqVhRLlIxnR0uyu?=
 =?us-ascii?Q?iXl9p1+4LVCwIgyjfKKp45VPBETmh7stR09Zteq12zh5DGZaecJLDTd0jQgV?=
 =?us-ascii?Q?0Q1TqJBTS93P6Au0WNZ+BXw6ZCTdD/sLxbeH3dUj75hJS4vvsFDKYdKVyYQ0?=
 =?us-ascii?Q?NSSFkKPQpYbSw4u21gBs1MUhu+6G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C0+FKTWbrwVhXT/yxyEPo5/hz2Ud6MYYI43uMjVUBmhlN1x3k2LRLCATPK5G?=
 =?us-ascii?Q?s6t62s1koiemxKtMuRFao/w6g3nWQeLK7J3XlyYZckbSgHEBi1JRTwDeonI3?=
 =?us-ascii?Q?9dXKVNb+CMhl8aXbSczDE5PqHbmoGPNgHjy+B6bYz1QZ+/USqYyr85VpqiH3?=
 =?us-ascii?Q?Me1ocBs2Rgi0SMOiE+bgnZ1BufU2WPB9byH/++A5zvaQJWD6mTE/bZDY8Qsb?=
 =?us-ascii?Q?0r4e0lDWD1u5vtybXy8F69wpYlDbFKTwksXBYgGjw6TkYaHb2W8yFMRhgUPY?=
 =?us-ascii?Q?ZHYM3TZiVqPYsxy/ApkhuQdugnQh2Lc9TcpZhPx/z0QtR6B7u6f4o2rxHXgM?=
 =?us-ascii?Q?8YnX8YSkObW/EjyHYaj9SiM8eiTw0/oT0vXj2RoR3DBLdsjjNSVaW6RVRv7E?=
 =?us-ascii?Q?cO8covw2Yx045HAJy4NqOO64F8dKY35VS18+Myh7hZcYvPPTqgcSfKihiSen?=
 =?us-ascii?Q?12iCMBoBBd97Re130vatTfnB75W8e1ZSgFAS8uFtQ8sMJnlFeBLDhXdLkba0?=
 =?us-ascii?Q?Uhyo1/nbrMaoR6EonfJX5o0o26z0TNtvJcTZhNYlrFC/ueBAEB+FZFJI+p3Z?=
 =?us-ascii?Q?sALxx+OKHI0qVnr8XCLlTnEO/C8TChrdKJSDVGfCBEzfu6x9QVgPj7xd+tK1?=
 =?us-ascii?Q?QjAX8ybAI5Bb4oMAaljMdwRu8ijIztF99dL3YxTf4+jWciYtit9XfS+wuyTV?=
 =?us-ascii?Q?y8jtzXJ22ZY/Y8SPRDbR+Y6DJmJcHU24tj8OkMEaVuWcDclfO2q2Sv7GjoZe?=
 =?us-ascii?Q?s7nUvhJ1sVcaflbBhyTj6TxvWrRYuU2H2HZGl8bLeB93Hm5DMx99HOMVhKFg?=
 =?us-ascii?Q?hxj0rN4NNSw6Kl1ccCJG21qVLvHgQUKp98vZJAg+NX7JYpsaPQ9U9xPVeb3J?=
 =?us-ascii?Q?Q7plc7GfLD3/sGYZcyGXIMzt+sW1nSQx4s1L2j88FOwVz7OqGhBWmQnYdt6i?=
 =?us-ascii?Q?ZnrhsFGDEPKmfj4ng80mPKdVNlZXXSyWv0oJhlJOQZ4WkF4KF48c23S0M2aH?=
 =?us-ascii?Q?wtJUzXyUwKRrdpsre0IkVNVwx8tBYdLQGo99142/bL7bxoQ+DSou2+6JRs87?=
 =?us-ascii?Q?wGzEwJpyXwXdtdfwp873LatHzjTp3HwgNd6RZCq2ryvXWYUoNpnz0p9Pw3ls?=
 =?us-ascii?Q?TcS887t8L11GtCAX1uzRk8hOmXdSlwMIU6hZ/by/mq1C/1RZO53hC8f2TNmK?=
 =?us-ascii?Q?HU8t715cr1VLyc66RGxBkB8t2b1WTjIhEwCiLeW271DsHLArZR0Cxzbu7aj2?=
 =?us-ascii?Q?7g/Jk7/XRc5WfDAIZ0Fk23C/MCjbalCjtQwbPCMDimrOpZVTXdEm1iQv0eeF?=
 =?us-ascii?Q?5KUoHKgM67TEOGUZZrbFKb/xq0pkQqvjh+0B+IV8c4q+UpZaD+34aG1tyiY6?=
 =?us-ascii?Q?ISjkhUXR9DSz9AHVjweU7cZa++UX/IRiwmnTT6xIYUDTfo8uPHnB0agxdQ3a?=
 =?us-ascii?Q?23j8HsGUzabFAULnebmWlHCAQmeR0RYheVtSLodU28PNT0hQaSIoRb7iy3JI?=
 =?us-ascii?Q?pieQ9iwhGGJG3R/+vVrlugMnzURWOYf3XG2N7AD6QGGiI4ekGEc+oHhIRZrT?=
 =?us-ascii?Q?ZyMNGZ1PkMqLemPOdgWudnQdiABINl/hGea++jJk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606ed598-5364-4768-18df-08dd77987aee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 18:58:13.9324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9P9EjSODJ8nj2wD0HX7pRdTaZp1NLluZJxs2mL8Y1J7GJkRqn5ck2rycmRh64+r+uIQH+z+9cBQoNFOOudQ98A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7959

On Wed, Apr 09, 2025 at 08:51:24AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Wed, Apr 09, 2025 at 09:57:59AM +0200, Andrea Righi wrote:
> > On Tue, Apr 08, 2025 at 01:06:05PM -1000, Tejun Heo wrote:
> > > scx_has_op is used to encode which ops are implemented by the BPF scheduler
> > > into an array of static_keys. While this saves a bit of branching overhead,
> > > that is unlikely to be noticeable compared to the overall cost. As the
> > > global static_keys can't work with the planned hierarchical multiple
> > > scheduler support, replace the static_key array with a bitmap.
> > > 
> > > In repeated hackbench runs before and after static_keys removal on an AMD
> > > Ryzen 3900X, I couldn't tell any measurable performance difference.
> > 
> > At this point I'm wondering if we should just do something like:
> > 
> >  #define SCX_HAS_OP(op) (scx_ops.op != NULL)
> > 
> > Do you think the bitmap can provide some measurable benefits? For the most
> > frequently used hot paths (enqueue, dispatch, select_cpu, running,
> > stopping) we likely have to fetch scx_ops.op anyway, so cache-wise the
> > difference should be minimal.
> 
> Performance-wise, unlikely. However, we need to be able to enable ops in
> stages during init - CPU hotplug ops need to be enabled before other ops. We
> can do that by setting the op pointers in stages but the code was already
> structured in a way which is easy to convert to bitmap, so that was the path
> of least resistance. We surely can change it.

Ah good point about the init stages. In that case, I agree that it's safer
to introduce the bitmap for now and, later, we can refactor the code to use
pointers if we want. Thanks for the clarification.

Acked-by: Andrea Righi <arighi@nvidia.com>

-Andrea

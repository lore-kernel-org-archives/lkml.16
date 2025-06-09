Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ABB1D63C2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482455; cv=fail; b=NiURB6o0fQNYD36dFqOZWCzQwMri4gUkn+Tm5ep4k2srL1zorVu6MBXXdVUU70A3CH3NUOyTL6mTlatQlxzSSS9TpBya/dH8aEnlNIlV9f9WPK5KUeSBNwLUVPaBW8u3o1GDGceFMBOc1hgesqwMrjHzA3UKIVbHPWcyNt9dadw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482455; c=relaxed/simple;
	bh=rCTHhU2fX3JE3Y75n18dqltAlWWThW5KqqVE5Oe492U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DfR9NiZZsnYRumdR7k5mtCC60v4se8pe3fO2ePZViwaZDQt2+u70UKq0UzCEKtVpmKScmyL7BosEVyv4mbeEF2iz8eIly9m+2jAJYB4axxVcoBLR7wQz9bMxJEE5rqJkDkVa4g2dzZmo+E6u+EZFKxOrsI2RhF24JWbCk+SB+nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OaJjYC98; arc=fail smtp.client-ip=40.107.96.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OaJjYC98"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayDI99Wb/OP2rpH6jD8yC38uUJ5lNpBQggH++PQrRnNqg+5hrN/agBg7eWwIHAXTPBHkoFLPKflYn6Uv4cZ2ZHI4Xi7mfFbt4RrR/3btR7hMkQaCw9ARKwh+FQVM2euoX/kxUZn5ShsZwPixYmqRPc4vYiqsoiguWQAsdf5yN7pSmYvnFagKVHspZx731JJxOvQGOia4MIMxLi+tFQN0MDTUWZOrYTmMJoYRoPAGvFu8FSEU+fm3AobyhMB8S1MRQsThVRpEmm6Yv0/660sAEdPu839cW7H/4PQeOPdz7wddzt/Gjf/u1w53bwzCCx5MPyEadK2WIuDNFA56QyA/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYgnHAvoZ/pEyLkfJ3P9pH+gbFlTJ6ruODqsgoH3GT4=;
 b=oxTA/2d0D2W3Sj+nW0kVQXVrjDem+wMwwNLUs11DtqfBeMTmyR+bQRu4p97r/TDE1e7MDB7Wn8+chK8QQMJM/REzlxEXswuhdEaF2uUpFVvBFXdeQ7I7cA+CuP0T11+XcFccjOFLYk2sNgoPX4p4JrFTPko2Evh3rcSz5ngTrRYjBLe1St4sVZiy47osn/tWcswYjEBQUIjgD1kxnG+rP4YnIuYtcTf5etqcWrJkguZj8BJiQ19MKdYB8aGD+lPqMGNheSW2qMZofAJgScNjUhhmoAQ9uM7sKOB3UMDhuUXi14zAXnM6fzZb1tYhQLVekqXkkoqQRiUX2CzhpkPcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYgnHAvoZ/pEyLkfJ3P9pH+gbFlTJ6ruODqsgoH3GT4=;
 b=OaJjYC98+gBHeaQDhDLHcemw0ENThC4iS5rxFra51Bk/Ftg8uaA7g9muycrpVHkv/Vh4dOEJWC3A6YnC0xE0OpD9X9VAkjiqKQNLVNFK8cr+Wldf1RKQ5E8JzVEBDc8491RQf9r6YIfCQPx1tc7fy61Nq993xcf1doDBZ+NL4yPiZOHPpHyozmZx/dUxh2haGqEeImZXSaiN6Oz1+w4wecbc19TmLsQY5RsL8tSwiWBK8JNsa8trkjYhxWpg/hsIU7FzKA1orLWjefpsno6dZr4OQUXcWBCYiPEyTwNMGOdmqLRuTH/6GmThMh9TnZC2z4Pg4JS2VaziACR3lIMswQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PPF864563BFB.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 9 Jun
 2025 15:20:48 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.039; Mon, 9 Jun 2025
 15:20:48 +0000
Date: Mon, 9 Jun 2025 17:20:34 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/topology: Fix for_each_node_numadist() lockup
 with !CONFIG_NUMA
Message-ID: <aEb7wg-uRW13VOgi@gpd4>
References: <20250609113536.29743-1-arighi@nvidia.com>
 <aEb3wfr3rgL2Pemu@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEb3wfr3rgL2Pemu@yury>
X-ClientProxiedBy: MI2P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PPF864563BFB:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f636136-4f71-4cd3-a5ed-08dda7693670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?00U8lEAo/BT/iJhiKHELV3sKQtg2saq1kyLcubWT8eJ+Ewb0DzRX3EPms7Z9?=
 =?us-ascii?Q?85cun3BaYsNo94Rs0rpU+/Fr6VaXAj+cOS47QexA9zW6ozF4MDRE3zTgNqLu?=
 =?us-ascii?Q?rR5bq/0JXStWD55XFEBfuuEEWEdV3gwV3rRA0XSn3pYD0jY0UjstxfZ5MVSy?=
 =?us-ascii?Q?a/jrW/b/yQczbfCy2Ci/W+jSR4I8g688IWMSD/MPdbh26pOB8uNMF8tPeQwC?=
 =?us-ascii?Q?nJZ8NjyJ07pcqVN7rbZ6PM6/eRT2++ECt2N5dSCxLdJySd7gZPPw2MK34Uy0?=
 =?us-ascii?Q?UaUy3VQLfip8OOvGdg2r3MUZmP4A5uLC6ZItm4GpPWdZUtJwEOlqSLwu5MoZ?=
 =?us-ascii?Q?PAr0ItjVN/TDAzp2qRGj9Si76QpCNw+CVhr+W9lkxRha3wAH9khZIv3jZIS4?=
 =?us-ascii?Q?fLpVCjbpX1/jY8CyrYxfWngKVybObL8DKqyFYfHrdeOb7wRV27ObgPbgbeon?=
 =?us-ascii?Q?TEqi3O5FSIOWK9+sedYFfnRVeeqWMCHY0S9GFNZ60HjRgP0i9Cm7cva0M2lJ?=
 =?us-ascii?Q?Iom+DdfHQlBZglrX0u5veJou2bSTwbIbxx5ViDb8+TA4n9qoj1GGQIMorbx+?=
 =?us-ascii?Q?RCV6+RxgwlyH2gpxvRiP3enfY4FdMe49xhRaDlOtYBghU/lYKIjNV13nv8P1?=
 =?us-ascii?Q?G0ISVA+9jtFskYu7n+ibUD4envdbvJd/yy88cSUW3QgjjOJxPxqm5FC7mEB0?=
 =?us-ascii?Q?z2QfbIBjrbP0YQn53ogPS12lu4ZyXR0t0vymFKj6Bk/wMhzX1o9Tlj/7UQvI?=
 =?us-ascii?Q?uv+911ya7Elmr+YdBs1vCct3DM2puPglRzex0MN21p6DL/1LIt5l7M+FtmMg?=
 =?us-ascii?Q?0SfX6UYARBsZzPeJNaIss+0X4iMl/3nzhAy/1RS1hryFjgsWFndMn1xAwE0L?=
 =?us-ascii?Q?Q6TNDt4m5Kb2KwqLRjQqv5EtJHD/ZZ63CrhRD+zvvleHTZqj8qrk3SsEn2ji?=
 =?us-ascii?Q?4plv7hUMGfM+lx6K8679cSaV1KIUV3HcPM4U9MfF6QgUZyOseRr1lXIl2/lB?=
 =?us-ascii?Q?/7eahi0orfEfcjhE1a0YstbDruSRlW45d/sX3KqdyU7Kb7c0DAp36H/B5TQF?=
 =?us-ascii?Q?LqolFfcXldlDyi2IYS9biCSZpSfVCJJuT+9VWprEAFEdWmuYneSwqcxWqO5l?=
 =?us-ascii?Q?lp+9AF6A3lfiqN6z5UtmFWvEXrtRs2BYdpMaYh7SCakOqNtOv8HZA1v9Nnr9?=
 =?us-ascii?Q?qIpMkdw8OCdxIJAcHjHSGppms1F74FODHk5wwewvS9for1qCMu+Cgz6wwSp9?=
 =?us-ascii?Q?ur8zHeim++vyKdOZKMJw67E2CtX3bTyVAzaahJMPVk4zCmihI7UdbHQXr5gw?=
 =?us-ascii?Q?kqsqx6JhZ5Xga5on5RwZRsWqeESauYBgGYgiotB180ZZTPG6mG2aWlKrxRWF?=
 =?us-ascii?Q?naneKFcTEv9SUpA8OTHBCVIeYsrZ844fm1oD17ravDHFTjzX32k0YPLvTLTj?=
 =?us-ascii?Q?a6KS+GZLlus=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q4nLdFac6NBSzG2qwzJ9xJwV8uY4JsSFVflYDEysfaFuCqQ6tFhpP9N3IFJ9?=
 =?us-ascii?Q?w3IRib2/sL8lFvlcXzbXn+sp3FFvYZTNb5lJ7piGnj6Jp7hgMqIdlP4DSC3Q?=
 =?us-ascii?Q?0vYATJySeSpyGZ/XjvOQbN8uTmNBXHQzTU7UNk0Hk7idETnNT+ZTLLWJYknt?=
 =?us-ascii?Q?41HuP+Qx71nygPVsJJgxJud/1QQbA3H0RGzkEFqbi9X4Yz3tHliNMqUL4XcY?=
 =?us-ascii?Q?3bfnvqAEYBztOXu3+79gMWQmA7uy20EfVTDlLf/I6yx4pcj+vJSFIYMm4y07?=
 =?us-ascii?Q?vq+bsHtHNovGvZwTEejJxwFE9zNVca0X+pkMkTi2iiv+LqtJCXFK9d9XgFhL?=
 =?us-ascii?Q?WzZBkQvFNcUybduWZSRcY3hzI4yMaLCIGz3usS/Jp6arDRHr4peeMBwUlE4L?=
 =?us-ascii?Q?IQwUO33n5O+6d8vgXVKNLWTCyAdBhPzcVWBDLfHpB7zBcS5Gb6QITUwu6iBL?=
 =?us-ascii?Q?FuSZOSTei+Hyd6A5Dh7MoivruP8G/xScmZQI7JbGfzdv/HuSGft/hZcyM3IW?=
 =?us-ascii?Q?c23LGufulHmhIXTp/e1gaP2KacKhTvanZXFXFrl/fwFDPVojy+4QK52lBuZ6?=
 =?us-ascii?Q?njFRH1h0N2QpOQ1Ds1Eaubm8O26Te8hxzsnXHf/znXxrlFLyMMzBJksW1rE7?=
 =?us-ascii?Q?DSMZemdn1vQJFOpPm+hkDjpj1JPTuu4t2ImDd2MFqgWNYVjigk29vRALADFV?=
 =?us-ascii?Q?5bCQH19MPtT/hWNGMHjdGPLOhzD3HIcOTvkprnLnxNUBPwxos1bEx4nJUjKM?=
 =?us-ascii?Q?TZqOcxBnSvtIOSD4KJDrsuP/e9K/l3HFTk4k/jG6hHbTjxBR8M0Y53iqHViJ?=
 =?us-ascii?Q?/zzw3aOxNOGI4mkQ9hzgNlp/1xVcRzSqUEDFVKvpdrQzGuJfH4zpOXnHy/Xw?=
 =?us-ascii?Q?/dpRwZw3LDu0nhSsaxa3FgDAFjR6g2LJVb9biAe1iNBqpiencrOgCq3IL6yS?=
 =?us-ascii?Q?bE+8Kv4Mih06EtUhEncRXI764Ztgk9DyMVbeQ/dELK7nKoHIa1VRxbwiuXdd?=
 =?us-ascii?Q?DVJXApQSETZD67V5q94GxCYj+C7MhsHZXmyplbu9z+G3KxsI0wIh1cpznBk0?=
 =?us-ascii?Q?Uj2ZZNzCzq2vYwxKecZEgD3E20L1KWdLs2MpfuvqYHe3o3sR6Qed95xVybTi?=
 =?us-ascii?Q?k9O6+xow4mDPy9cHT2qAsRdln6VHShxUnV4n/TMUvsd/4BdSkXo142/+bstU?=
 =?us-ascii?Q?ZY66Bgu50OMNcdzpfSPIzg9U6ViRhmz+CXl2yQAAdHGN3Hc8NY3TID1t9/tX?=
 =?us-ascii?Q?6tO5MmonTn2Es7LcfLi4kcIFjqStv8h5qo2nvegDeRnwx4lXKAcLDBloJYfA?=
 =?us-ascii?Q?O5afGbVJCoWUYgnvsIcFObv1ZgkDuW5k+OKK7y6eu/9NCFqdnBqmDReAcjn6?=
 =?us-ascii?Q?YQsNiaifAST9ijR7Mq46ZcSlfdjHZ+nMZ+qo4J0Gdxe9FEOgbnZp0x5GZv1I?=
 =?us-ascii?Q?LuDY19aHMOPAkWPrx48Gk9ENENBVIJw1N0jX0XxtWAyniv3rZfaKCimxdRmX?=
 =?us-ascii?Q?eFlSnJUjimmYChu6snuzEw5kRM2Xy5hQHYliiWqNnxbaOoX/2R+gBdCC0Lak?=
 =?us-ascii?Q?QU7ercvnPWgt/UoqHypOEC0oXAqf0K7ltgT6HDWz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f636136-4f71-4cd3-a5ed-08dda7693670
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:20:48.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+NvawcR529CPQbWwfDW/us08GMEnvbRzX/FXi4FimTi1zb4iJnVmLp+HssnvcJYfGgAjJ2vrm8ybJBJSN5BPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF864563BFB

Hi Yury,

On Mon, Jun 09, 2025 at 11:03:29AM -0400, Yury Norov wrote:
> On Mon, Jun 09, 2025 at 01:35:36PM +0200, Andrea Righi wrote:
> > for_each_node_numadist() can lead to hard lockups on kernels built
> > without CONFIG_NUMA. For instance, the following was triggered by
> > sched_ext:
> > 
> >   watchdog: CPU5: Watchdog detected hard LOCKUP on cpu 5
> >   ...
> >   RIP: 0010:_find_first_and_bit+0x8/0x60
> >   ...
> >   Call Trace:
> >   <TASK>
> >    cpumask_any_and_distribute+0x49/0x80
> >    pick_idle_cpu_in_node+0xcf/0x140
> >    scx_bpf_pick_idle_cpu_node+0xaa/0x110
> >    bpf_prog_16ee5b1f077af006_pick_idle_cpu+0x57f/0x5de
> >    bpf_prog_df2ce5cfac58ce09_bpfland_select_cpu+0x37/0xf4
> >    bpf__sched_ext_ops_select_cpu+0x4b/0xb3
> > 
> > This happens because nearest_node_nodemask() always returns NUMA_NO_NODE
> > (-1) when CONFIG_NUMA is disabled, causing the loop to never terminate,
> > as the condition node >= MAX_NUMNODES is never satisfied.
> > 
> > Prevent this by providing a stub implementation based on
> > for_each_node_mask() when CONFIG_NUMA is disabled, which can safely
> > processes the single available node while still honoring the unvisited
> > nodemask.
> > 
> > Fixes: f09177ca5f242 ("sched/topology: Introduce for_each_node_numadist() iterator")
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >  include/linux/topology.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > Changes in v2:
> >  - Provide a stub implementation for the !CONFIG_NUMA case
> >  - Link to v1: https://lore.kernel.org/all/20250603080402.170601-1-arighi@nvidia.com/
> > 
> > diff --git a/include/linux/topology.h b/include/linux/topology.h
> > index 33b7fda97d390..97c4f5fc75038 100644
> > --- a/include/linux/topology.h
> > +++ b/include/linux/topology.h
> > @@ -304,12 +304,17 @@ sched_numa_hop_mask(unsigned int node, unsigned int hops)
> >   *
> >   * Requires rcu_lock to be held.
> >   */
> > +#ifdef CONFIG_NUMA
> 
> While there, can you expand this optimization to MAX_NUMNODES == 1
> case?
>         #if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)

Makes sense, will send a v3, thanks!

-Andrea

> 
> With that:
> 
> Acked-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> Thanks,
> Yury
> 
> >  #define for_each_node_numadist(node, unvisited)					\
> >  	for (int __start = (node),						\
> >  	     (node) = nearest_node_nodemask((__start), &(unvisited));		\
> >  	     (node) < MAX_NUMNODES;						\
> >  	     node_clear((node), (unvisited)),					\
> >  	     (node) = nearest_node_nodemask((__start), &(unvisited)))
> > +#else
> > +#define for_each_node_numadist(node, unvisited)					\
> > +	for_each_node_mask((node), (unvisited))
> > +#endif
> >  
> >  /**
> >   * for_each_numa_hop_mask - iterate over cpumasks of increasing NUMA distance
> > -- 
> > 2.49.0

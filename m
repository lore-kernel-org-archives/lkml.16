Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D171202C2B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873930; cv=fail; b=HzD4Ru7uCjFr75ldcEJA3W/SWPZAezeSdTDNCA5g7Ca0UGgVsXeuEjIb7h97stv+LzN3gqM1ua0JvYmSABOymv2G6Pi8EuvLuqeBOzq6aeHwZy4QgPixvW0TazFu9jDIlUwi+xJrrB9PF/rtd/WGkPsBLDXa7bM7dYVgeJBN978=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873930; c=relaxed/simple;
	bh=mCwym75pYb0VDSbyAG+teCmcS9IKDOyWKkNKRQG7ytA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DbH4s6v0jO6yNmyFfwOvobgx+6nry4v931n25uXOBDbCNIyAC0Ed0osxBY6HQMsK6vRyGYXDE7qeu4Vb/YIy8qYQcZVynLPvpQQLE0cmE0ny0CCrE7sugAY8yGaGmsqeQE4CzLrtcZiQetseaJVz6MVsWLK0dRKQm7pufttJFN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jwIpB5dh; arc=fail smtp.client-ip=40.107.94.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jwIpB5dh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBh/7QLutyHspWVgh+BqwP31mCyp4RcuNdhJ+0zvoqcLvAVrMkRvUV8zKyBUiwLVgYp5uJ2WBwf36AN0o3zegqWf4u/+g5xi2aRGM7u9aVWn9/w6B8MC3l438D0+b4+BRSV8EOL2MAfsbCYAHY4Og1iQ8WrkhHdFx00E3lShSfYKwsa0ux5CImhVlgc5LiVEWMRwkjtPedvi14eFTgWebDrsG3f/ADJmjWf9H98ZBq1ervhpUwjgc1cVP8lspj/KTAskOIVnaaARX9DN2Z+8Wc4iqwEtrFlSLF1DawDtqAWdPv4IU5iWbzMHS57T+S5byrF28y0Da6XaVi/ZzkGK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecU8ptcbXXEQAHU83DgpavyfsW9P8YiU9Et/ZPPVkyU=;
 b=nA+PlW1CJP3YG9w83+pwA72MrP1IdgL2h7l6JKc4J8bDU5UQJ+cC/Wvxz/hgOUVWS1NGlLQnLit2H0sbUiE43f8O/2VNPM6Mh20/y8Y6+eVrCUJNRSJir3d4VfcEWvUekG38fnRhjZswJKrD8agJgZxim7egR88HmFk1hj4+CJH42fP6GYND4loxd4JCANMV+x26iBVbsMz/qqb32KJ+HGPyWWFW75ep4Lzrn/oOPMEozuR0n/DBhrEWdqjq48wMKmswB7Nt6WDPDsX9YtxJQvk7U1yv75DJOnnWhyhi8JiJnEmczChvnseeAKF8cGVYTIRnxGqzcBCah/mN8/964w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecU8ptcbXXEQAHU83DgpavyfsW9P8YiU9Et/ZPPVkyU=;
 b=jwIpB5dhJkyjAHg0hL7yJtyPanj6RcK9PqSBKiFyxOcZH+Xshb7GgkgV08VLNMuTDnytvPK70wMfKG8P9eI7ZsKUWWQKk82o5UCVATqyWBzRYcy8MVaUU8dS8iqgyu1V0AvKIM8A/XXuN/V4s/q1ZuRIUidLRkmp2v2epytGhvnGn+4pWzV/zSPZD0+j/0eAo8TYrDm7PirA9d93mbnVPIIWJnn2aF8xXZ4M4pvuZYejgD6zzrMthB5EIWlClvfzpYgrUM0+ZvInIRHAYP/Z7Vm+wshmVqFgNmH/ViMEIisbkzY6qEJ3VNCSrFAdwg7Vi/eQ8sHqTLc/RwtnTkzEfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS7PR12MB5742.namprd12.prod.outlook.com (2603:10b6:8:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 20:58:41 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:58:40 +0000
Date: Mon, 28 Apr 2025 22:58:28 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCHSET v2 sched_ext/for-6.16] sched_ext: Introduce scx_sched
Message-ID: <aA_r9GH_v4Dtbr8f@gpd3>
References: <20250425215840.2334972-1-tj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425215840.2334972-1-tj@kernel.org>
X-ClientProxiedBy: ZR0P278CA0145.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::15) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS7PR12MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: deda5298-954c-4a16-782e-08dd86977448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+wtbA5nLpMtm7eWjQ0WdCDJvbyIcy8tOweev696DlgiwK/d3Xw/WrpE6Jcwo?=
 =?us-ascii?Q?aQ33nIoXTz55Ifn2umvhY6WnnltGvllENh+5OeLiA25Id9Vg9O/zKBF6PhSM?=
 =?us-ascii?Q?XvpaZc9Ml9l3X2ELq3CbZJCkbWS241LA8HY5CCqm/9QenBdwkh/6PVS+jtuR?=
 =?us-ascii?Q?uhwUkWZlloBv41R0smgw+s+OX11t1g+erX+/vOpiUwZ2sCNo6rJMAecooaNZ?=
 =?us-ascii?Q?3p/XVXV3IMTxejx/y+/UnWBcvT8YgviTo09OklX1fv/ZcsTpnR8sN5MkMGOt?=
 =?us-ascii?Q?+HQp8L5hEZypNeuc+HxgB4XkTvjUX2mgibvS9nRJYF6pWgwXpw/NOqk4deUe?=
 =?us-ascii?Q?MEF1sf9L9pEK9R5C+O+r4DtTGJJXUH5ektYylarcuTtjsgnZGYi0n61ewbM9?=
 =?us-ascii?Q?RRUlpezta1czywI8qaci6crtnwfOJhxsABOFakT2XYv0hPvbR5nWvutSs+Ex?=
 =?us-ascii?Q?LgkFw6YJISSv6WMV7LlhektyyuCg9nEqrYTGytKUV3kp28TnxNhKkEVEwKeZ?=
 =?us-ascii?Q?nHHoc827rU1/hDbtiV7WGTeLEQU+zD5vlcLzi4E/7K2Pc2XxXy3ss9Btnb15?=
 =?us-ascii?Q?PoAWl6EKSaExqHZpsz7rDIvQUDKos7NMf3tm0Sue5DnigPlQIY80YAvWZoZL?=
 =?us-ascii?Q?rgFCy1j4aB/TAQ2nA12UNTz8mSq7C7eEIZui4bcIkTUybwAvjTLNF6oZ+Gyk?=
 =?us-ascii?Q?3OjakIElnsStj32iWCHQ/w4AAr58h39fbClp556DuB6OwAMW/R2LVrfM7/4M?=
 =?us-ascii?Q?HpzypXCOVx0U6+lN9atlS57oytNppoSjKfNP3yfMMjBve5cDP1N+c+uKLftT?=
 =?us-ascii?Q?TLvglUjrEbJBzisYVpDV89tLLiWt29/F5TN8SeORqez3LAiiroQbR5Xr00ne?=
 =?us-ascii?Q?yAQV8pioIl2mNEkwJYQXPfbdQjNFYN12TWRqQSNHZ9hffBzW5dA3GD/8FlZu?=
 =?us-ascii?Q?DLYtJOpu4depu/zt4u9KwMi+bTpv5IAt2ie7pj0XID8xdWG7jRB+WULXM8FA?=
 =?us-ascii?Q?oOpBzeqWjUriqspvYE5+nO93bMVbFXJ6d+lak3S68sLaXj65jtMtiNMWkvcC?=
 =?us-ascii?Q?9xfJsvbBGBVFtxPo/Vt5nKIarb36vc0I4G+ux8N3t7N6BatCQ+UqFRHs39zq?=
 =?us-ascii?Q?rxPbDQwk5figY/RWG5OiiRyVB3aBR1IvaSowEXgtAgQZKtYm/EhJdkfE+cVK?=
 =?us-ascii?Q?qQcQl79B7xVYr1qlFRXxZUCwUk9E3FHN0JiRwYEBC1zptoEpZIoNG/RTg/OX?=
 =?us-ascii?Q?JLJjoHStS5vnnX1qZ3h7fI2jOYkRCHQKPPQS2uQIsoySYsptEoKWYXRGSnvL?=
 =?us-ascii?Q?GAiYadf13kz5ROZj8ciF4Ewwkni84mJqCJSPEjKvcj7Z1TKs4STV99cVylfY?=
 =?us-ascii?Q?IV3xNTZGH/YMy7FZm7wdRUZ34FkHTc2HKOSmqz9RcNF9Rp4RusJmjFxUIVp9?=
 =?us-ascii?Q?gQL9447dsrI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A13XgVxjhwuIuLNVFhNrDe5YyJC02e/K52RFU/Xt773yvZCR7fBXQCC7RNoE?=
 =?us-ascii?Q?h0UW5ghU1vb09X4I9x++DCh95Ko8oorMZG3/DUb2YoaS50yfW/OdI7oIb+YQ?=
 =?us-ascii?Q?hLN+De4AeGVn9YnjlZBIXvEnMY5n9PL65xpdpoIz8M6B1F+1R8cd6I9HxZnS?=
 =?us-ascii?Q?Z9M2wgGFyJlsUJdnPAb07ICbVcoMB4mBaaYCojO9slPy1xaWM+jzl264Mxro?=
 =?us-ascii?Q?Hxb0ghuVfYws0LyRSm+pC8lzubjga/VW7X7ysZXyoUoOsNEjwqQTWht2HHu/?=
 =?us-ascii?Q?dyQnnfyn4zKBP0uuy3TfDuVsCKIcS4SMKTErJPUTgQXHG1QbJ79Thx6IsII6?=
 =?us-ascii?Q?nBpxuoSEaP2mkrPFZjeKpYtNQlz2YtwSbZNzmTEQNSoBUqTexqZqL8+ICftq?=
 =?us-ascii?Q?5iNYh0AZWt2Um0KaiQWhp5HFQSD73k1UZq4WpC6W4hV+KFIHB4tGoK9dGGCG?=
 =?us-ascii?Q?4gUkvFMo7Lo8P1aKbY2MeBZymMSlxTreR9ZHYmAIvRESLkKuRq4lv5ehL8Z3?=
 =?us-ascii?Q?NY8d+BzoaNrGmh/S2sEiTM+MpMjU5dTvfEo3Z5LXlxbT07d4IrC9oXOgOA26?=
 =?us-ascii?Q?iYXJ3VojUSyFPgsjEWVSlJIv1EsxnGNEYsdkBSKYzLyuAeo0WKaq2kVLppsb?=
 =?us-ascii?Q?IOu8m9nwa9ZPsf2fZTQDZibRmyRKdim7mJkLQzdiTqrJiS7V8rmL/Cerne6J?=
 =?us-ascii?Q?Zwzr+fFAKOuR0JtqWYiQtvKBFkYCVtJen/+XmlWGBAMgOAHBS6l3QmImfewi?=
 =?us-ascii?Q?qFj9QbjnyHHi0ZCFaCBAB5/2+JQ/Jd1GAd1if/1XEOmNZCMN/9C+mJTyMzis?=
 =?us-ascii?Q?jHXMd7C/Zz3hJPDgokPNpuAK6R/ezK2pt8hbMUfdAcsZyibx1Uzb9ZIljYxj?=
 =?us-ascii?Q?EuwQbcGlgnJz1OIF0xeIOZewX3i385UEvIQVtieId6mMAyzcJ1iM4i5V0kcL?=
 =?us-ascii?Q?SpEHOm9Ft16274/2exmRpKTpSjeX/oSVkk5tZV/m//OknIKyxFqnQNeBxRUx?=
 =?us-ascii?Q?5BI+i74wcAKYB/AiQ0Klqzn5qz4knsRziVvw0gHYi8l5hFL7nCTqqekTOKSJ?=
 =?us-ascii?Q?+AC1YlWYjZV7KzXylYQPzQHXHzLzZNwnqdldjzyt0+z66iGVhnsf6cZuodbv?=
 =?us-ascii?Q?ZXvWIuyM+jdGOjezeX0MZ+oXrv4ClG83hbSwCVu0cjluqA6PrN/GvBZ31CCu?=
 =?us-ascii?Q?maXHNZFxdIDM09MMtXfg+Zlf/aTpSiy9zeDlTtnwAH01Dbtb1jGEbyoe2Lgv?=
 =?us-ascii?Q?JbyCTTvuPk7M2HwHTY/Pkw9UHW+Mm5cgSXK6AzyQLXf3IapEXLp5QRX3JD2h?=
 =?us-ascii?Q?c9O0/UchU17szqmrXS90cQeygVSBwg5vLJS3zTnIYr/VVlSXA0l06Da2AdJn?=
 =?us-ascii?Q?W3cExqNRB60w83bkLOFUDec0atHJorY9z9WbHLWt3ZxLjznGIYZuc5QiGNCj?=
 =?us-ascii?Q?DUzlUQmQOhhOo4HMgljBEzo0WnKwJ0/I7rsXN1swI374syNJlMTmV72hgfdN?=
 =?us-ascii?Q?mnI6SvcLj7LHbo+5j7X4EGPaXeMz9KuJe+7mMlgTgcMFClihK10KPJIKciY/?=
 =?us-ascii?Q?WnpiIIAlkWUhDghwJ54N0jTt3dP3oCCM6DVowjyP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deda5298-954c-4a16-782e-08dd86977448
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:58:40.6927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJ1+8xsak/ICKr3XNBsAV3xcfUZgQZ1f6XiZvoKu76D5QovzWlHYpsdpQZ4sl3j6HjI+WhFg3OObDiQhIruk6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5742

Hi Tejun,

On Fri, Apr 25, 2025 at 11:58:15AM -1000, Tejun Heo wrote:
> v[1] -> v2:
> 
> - 0003-sched_ext-Use-dynamic-allocation-for-scx_sched.patch updated to store
>   scx_sched pointer in sched_ext_ops->priv so that bpf_scx_unreg() can
>   determine the scx_sched to destroy regardless of where initialization
>   failed. This will also help with supporting multiple schedulers.
> 
> - Minor updates to 0010-sched_ext-Move-event_stats_cpu-into-scx_sched.patch.
> 
> In preparation of supporting multiple hierarchical schedulers, this patchset
> packages the states which are currently global but need to become per
> scheduler instance into the new struct scx_sched.
> 
> Currently, the only supported scheduler instance is the system-wide root one
> (scx_root) and the code assumes scx_root in many places. A follow-up
> patchset will introduce multiple scheduler support scrutinizing and updating
> each such occurrence appropriately.
> 
> There's significant amount of churning but most changes are straightforward
> if not trivial, and no user visible changes are expected.
> 
>  0001-sched_ext-Introduce-scx_sched.patch
>  0002-sched_ext-Avoid-NULL-scx_root-deref-through-SCX_HAS_.patch
>  0003-sched_ext-Use-dynamic-allocation-for-scx_sched.patch
>  0004-sched_ext-Inline-create_dsq-into-scx_bpf_create_dsq.patch
>  0005-sched_ext-Factor-out-scx_alloc_and_add_sched.patch
>  0006-sched_ext-Move-dsq_hash-into-scx_sched.patch
>  0007-sched_ext-Move-global_dsqs-into-scx_sched.patch
>  0008-sched_ext-Relocate-scx_event_stats-definition.patch
>  0009-sched_ext-Factor-out-scx_read_events.patch
>  0010-sched_ext-Move-event_stats_cpu-into-scx_sched.patch
>  0011-sched_ext-Move-disable-machinery-into-scx_sched.patch
>  0012-sched_ext-Clean-up-SCX_EXIT_NONE-handling-in-scx_dis.patch

With v2 of PATCH 06 everything looks good now.

Reviewed-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea

> 
> and is also available in the following git branch:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx_sched-v2
> 
> diffstat follows. Thanks.
> 
>  kernel/sched/ext.c      |  892 ++++++++++++++++++++++++++----------------------
>  kernel/sched/ext_idle.c |    3
>  2 files changed, 496 insertions(+), 399 deletions(-)
> 
> --
> tejun
> 
> [1] http://lkml.kernel.org/r/20250423234542.1890867-1-tj@kernel.org

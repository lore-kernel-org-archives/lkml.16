Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F60E1C84A4
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238804; cv=fail; b=gFye2VbX6eTHhh7JaRqrkjLQAFdgocT3oIvbwxwYgp9m343X9Vq65TzleSLPlncgjlNJd+RHnnMrWRUk7+Nn/ZFooL9llw1dmx/bQwlhWPKap4uB7FDCqAyU6oo3XUQ7VGqOfk2BOlSQCh965qIJFpCpMSu568b+xSpKGWF5tx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238804; c=relaxed/simple;
	bh=5LGCJYiR4jVPyjlM4izpLbY8F3pgt9KYF60xnQ9o77w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LX++YmF2TLfN264P2mfl+zNHXmXEwf/5o2j4KeS+jACLiW/cG58eDItVtvxULkV9eV1wjTUvkE1ZBgr5OdWj8kb97mphUyWQN7j0GnSUsbL8raLPjXztmVPPrc3Xy5sJyrMDPCSVKW2Vv2S41/zxDH6mmWLR5XXbh3r9yToB/mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=upxb0mJ4; arc=fail smtp.client-ip=40.107.243.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="upxb0mJ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHYS2geY5WlBsxWV4ldGKlPPMk6FGMopSS+JCToPfK+g8xJzxGiLjkKtIb98v5UdKOGFFsPqqrRb+2fA6+qyyHnf8xK0PAGOVaKF6q6mTsE49ig2uufu0KUpqwuROc0KMcwos4iUOFZ1rXCaiqEo5BGyukFR12N/ixwdKGQqnPSOuK/0a0ZsqjDBfVgNGDQSC8LZl7vQbOfwBmUYvlxy8+/4qxMXuBW3l1Wad+dpWmjq9Bma2QNJYF+QEFld4a0++XSHG80Zc8Ir+8uswf/w5i8fi42EYghtkj/BVin4KELYdYWIwCE2xvi37QaC7lIf9PeJAtCw3FLNJvT27vJ2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS+sdeeizzM079WRUar2eM97ZAR+595dZN+D5WKhITs=;
 b=prcY4wmqYPxZqBJvf8TS8n+qxQqKCPz1qetA3mbVdYqQM8sOWO2yF2rM1h6rAYEJ1SqGydIMhPAQM8EVdAglE26HyfTc+aZNqM3kJNQkt98uOBoQWiafkp+lwsFT3lZA8+34tViQtv+tO/x/cRjk9dWAsNE3grd2RkaIH1pEMNonwDDMQVTAJOpY7xqygxa4D6RmDp8j+JQ2yZmRk/cAAuNM+teN8n09Ef5ZDihE/oshSugZ5T8dHHQn5SS5GkbJMjyyWz7PIsI6xMcI/C2Akj8m/rdEY3equAQWRCn+mm19MtvnAU3qDp2pGOzk3jFF7cmFEP2ZdpNxm9R0NA8KkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS+sdeeizzM079WRUar2eM97ZAR+595dZN+D5WKhITs=;
 b=upxb0mJ4eBbx7XgrfaLub/uGGCqElcF7F5GNxpbZf8pncd41lL0ula9UHSQDZ8LsMkbP+CRJKFL4QqCnnvMDzkPJdZTp7/oyGBHRgPDagpdqmfTBSg/aaJxE2fU3MH7LtFaUlvGpEJwi8oLrPgEl3GufzsDw/VxVRWwDzcirmQ/sFUJPLa55QyCnntUmFONHyxcKnafgq7oXvu83boYm0raKJ9qv4nvmsthxxvtfCko90pMpynb6RgrBEoXSzn8jf+Jrgtn78ZF76s6qzaLvHDjSOoNV8qQtMh5jpZtMeUphOU4S/yzkUuUEUA8YKIlR2JgRMcCqRHJglJKtZsH0ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH1PPFC908D89D1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::623) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.39; Wed, 14 May
 2025 16:06:40 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 16:06:40 +0000
Date: Wed, 14 May 2025 18:06:31 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Explain the temporary
 situation around scx_root dereferences
Message-ID: <aCS_hx4ew_E60nfg@gpd3>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
 <aCRjUQJ_97-B0Rpo@gpd3>
 <aCSlvpiraPTKUqOf@mtj.duckdns.org>
 <aCSoKBu0l-vTlScT@gpd3>
 <aCSyYU6EZzm4fJUa@mtj.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCSyYU6EZzm4fJUa@mtj.duckdns.org>
X-ClientProxiedBy: MI2P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH1PPFC908D89D1:EE_
X-MS-Office365-Filtering-Correlation-Id: b86def3e-1931-44ac-43b6-08dd93015018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CUdVQWZWwoIyCrRJJQ7GFUkLIUyHQkMkUKZ90StBtXgl0qHS+DGyEL/fc9S1?=
 =?us-ascii?Q?i3pGCbRTb/JXFoQAyF0q3WX4/vlx/ZsUeSrFzVh1+uOumPj+Zikn6u6c4gnt?=
 =?us-ascii?Q?WLZOxtJxtudyJXugl7iFJxqVguz6oFQCdL4vOeVtVxnEjEKX06Ah7x9MZIkZ?=
 =?us-ascii?Q?fyxqVEijqKPbTSJKczN3IGp5KE4z90JSBciBBSvIyv/pRrmLEmMksgxt9ihe?=
 =?us-ascii?Q?5ln+cNsUCNvKWRtcvbJN3TaL1iOughzphoDn5BOIZ2UMamma4UpJ/WjXq4Vf?=
 =?us-ascii?Q?jh1792WjZp3diY3myoDsiijNCrdXq+9SvgC69GKp/UWqc+FvkcNhCcbnoJ71?=
 =?us-ascii?Q?hWAU7u4daKTz4AZyvNoYZ2JcJCwUwNUG8Z0CQTLVBwWBfqzZKQEx8ky9Xsxr?=
 =?us-ascii?Q?C901yQSXckY/oEU8E0NW6k/W6Kfub0Q6bEmsX3LRBKbg65ALhJTQ31CtRwVk?=
 =?us-ascii?Q?tXIg0iXH5t7QFQBdYmnd3rrgWnhfXZBEbnj+0Et/p2fEEeGmSb9Yg2N9rATI?=
 =?us-ascii?Q?QHrLHkXLDBRy48yAWG9vA1YO4EEyWJnP1t86b187J3GB/M2jzlJijK9PSxEj?=
 =?us-ascii?Q?Vye++Jz4iQRMvENKTa09wbSDMnVV4YO3+lYnR2ChKFPfKDWifCIdAbZlak6q?=
 =?us-ascii?Q?dLt8rTA2lj8sR+ZDLDknB2GM71DTFhkcyopYHhhJa3CR7hJYAKdRojHuNCyL?=
 =?us-ascii?Q?+CzLtM25YIUign23jobR3OT00OO3u8nFm6GUcV6ik+8S/7wBh7xIdrUVQLiU?=
 =?us-ascii?Q?6oSY0Bo68KB640Lm+iTFjCsLUhg3ly/vSpSg3SGTuc5D2WXymijsIPLmHKRb?=
 =?us-ascii?Q?VdhL0tjDCQt1lQVSoAoIAN3ozFBWOKgbFVJdfUCOmH7FYUGkVQkGRRispniT?=
 =?us-ascii?Q?K3/mZtp3v14qlTZ0eoCTok/5p9qwdg85m5pmDoDhl+MA88q5TOvTOO/9y1yq?=
 =?us-ascii?Q?mQaSSsJznqIxwF3Vvuqg8sX5zCFHeqC5aqZa0HNTTN5pu3KbBpTMg1Ral1JH?=
 =?us-ascii?Q?WlngwwapSxJYiRluQRnY9xJN7t1qlWwcaClbgXX40pTcJ/34k92/6T+gclob?=
 =?us-ascii?Q?NIeWqjbqu4JJeKJymhQrWcbLAS/ZuDCXyJ24mi7Yx04csbmbqWbNpsE4kJU/?=
 =?us-ascii?Q?PKVQNoToDMpB0CefB6ReHg9Wkr61MZsvlv6eQwltuJEjCT+Ew2FP4chBA/Za?=
 =?us-ascii?Q?SlmkBZCGZBoiupofky0oueh8D9zw+pBpJdjbAXy10kiYJym38QJ78PUkYRj6?=
 =?us-ascii?Q?uz7EGdljPq/cqxGJmwuk1yFEeUmKigJYzbYxR6LS867CdfZc3i3D40RrVA5B?=
 =?us-ascii?Q?ia+8D4Y9wR6ix6gFyptZCmb+5/CeDCNbnck4moloMQFnH1oRHLOOyZFYOaOH?=
 =?us-ascii?Q?qih29B+0kZWh7zSJHKET8o83NHXmyOXtFLJNCXtkEAoxoqSfTd8CDuQSIsds?=
 =?us-ascii?Q?rz2Lvh4p5yo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+NMb1aZLNcWjQ9J9PTllWfxqqP3/sB1z9e8Yvjdpk5stp5YD9y6MFC0dNRGG?=
 =?us-ascii?Q?LRvSGaZdomCG97ecVlN2Bgg+1vYFhARWmAut5zB+UYOMZ54L54ky09ft7d89?=
 =?us-ascii?Q?PXxzje7xPiayHyOGcd70qqYF7cpguIeDuE8CF1bK7/Y//5MOL+yMUiBALQEH?=
 =?us-ascii?Q?/PNERm8rhJP2gNuVYH/SHFwxpzZfs/MuhbK8ZOt+3Hw7W79D9IteuiyEGHby?=
 =?us-ascii?Q?KoZFXdm4qhzXzwGPYeZR1D2B234wrD97wdgJIt5aENxdNwC62UCBWNc+gryE?=
 =?us-ascii?Q?v7mKObTfHABtw6HhB1iiLrOOWUrn9BnCLqUMFm/eF/sdNH5HXiErSRMPUIcn?=
 =?us-ascii?Q?VV/cP1XDavh5gTTm7AwBWjXNdaSqt3nGfA8peAOm3C4i8w7KBlikl26jfi1o?=
 =?us-ascii?Q?PKZlrc74TezBnOUrD9Q+1GVmELb7NXsVfv8+wA0nLp74UG3fbXY+XZECi37+?=
 =?us-ascii?Q?B88B/N78cSP8ybxv/H1CA6i0iuFW89bxCPmynkv9X7Nt+arunasoSXXUc8lS?=
 =?us-ascii?Q?UL4MCKKQ7PrYmHmpGNhaXhyjkMOAYTWPHKQ7SDjPZcbyyXmOPiSUFUZZtQtp?=
 =?us-ascii?Q?NbfqutC7AFNgI+OlN0COarqo2+3qn9qXmNQUe1/V6XG9sksK/Znd8oPOmRJJ?=
 =?us-ascii?Q?CH5D/Lx15TFOWkrNwryuFQLVFJLA5m2LxrP/4Pqf5uYGJw+V91o3HnZnOu2Q?=
 =?us-ascii?Q?77OZkqyqNF9plXfGINCiDAWBpYw5P4uJt9tRYE3ppyQqyhm/OQjfpx2OQlls?=
 =?us-ascii?Q?lHQ7S/shCiVvppRgGV6MiI/aLCWhVOYaSEvJHVwmA/f69n0sHfm5rv0tnmAi?=
 =?us-ascii?Q?KPN8kcMj2aLNbqSdzAEgKtbrIHJnGUD+dSnaPdi+Q+IBqa3yHyDX/KD2O3X0?=
 =?us-ascii?Q?lbsf+EFN3uubnOtqYjn+hlWSYkqKLInnJA7yZWPiF9AZkP6qmk8fP1lXV6C/?=
 =?us-ascii?Q?dGjbF1+uFfdIAYsBFPY929cEl67TXdLuu/FPsuZOFolUaPXdAl/6NFJAvdrN?=
 =?us-ascii?Q?UqwBD8xtEnPVok5zhyK8p+SVdgKkG9S4sDunKjc2Nk/uGkPh16VlwK4CN6zs?=
 =?us-ascii?Q?t83R07NHjWlc888TUiBngp5F2Yab7skHNEvT649KT3ehMSl2kNvWmV6Lk81V?=
 =?us-ascii?Q?vu8vTmo0jSxl6jyt844sSoxVGJrTl8SxwkEiSRdNuJ2eiaw0HP4oKjajlgnx?=
 =?us-ascii?Q?1UlJXJZyR/oYcbqjtBogiCtr2n1f7+OhMZGxMtO9aXI3f4V+fQdKbvy5RSXL?=
 =?us-ascii?Q?YYF6x/6KO/l2mbYUmqsiVzR0IX3fgD83euViJhFy+P7AS20xyCC/jtAHhA5p?=
 =?us-ascii?Q?uHEUhXbN3ljIeenGMoVCvuJmd66IPqjWMceuZ8zP/XjgPFYLyWzaMu9DeSUe?=
 =?us-ascii?Q?ERs1BMgA4Lkj5ieULe14WGutGAquOpaQGe4Juoz875z56+LTgk8T1sw740nx?=
 =?us-ascii?Q?Dh61IvN6Wlp+G5hqHXh894QyhajZiVm/QogQ7dDRclrTS2TDalblWS1+GuEW?=
 =?us-ascii?Q?d5VZz7e/2aKYwlsx0FU+S1j8q/1Vo4MS5rm2tlSNlje8WMa9XULC0RYnbJOW?=
 =?us-ascii?Q?NTYsZH7eGnmbF9kSpu8NqqHRSYhwMWIKs8yEGzF3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86def3e-1931-44ac-43b6-08dd93015018
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 16:06:40.5431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhzSAEqS19SrHqYbFWQ0LWaghVhLSEjFGRh6FeUjsPF1ROkegPjZBJQAk0fwrOSl2ATd8qV0Ox8nmApMbON8BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC908D89D1

On Wed, May 14, 2025 at 11:10:25AM -0400, Tejun Heo wrote:
> Naked scx_root dereferences are being used as temporary markers to indicate
> that they need to be updated to point to the right scheduler instance.
> Explain the situation.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Andrea Righi <arighi@nvidia.com>

Looks good, thanks!

Acked-by: Andrea Righi <arighi@nvidia.com>

-Andrea

> ---
>  kernel/sched/ext.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -1016,6 +1016,14 @@ enum scx_ops_state {
>  #define SCX_OPSS_STATE_MASK	((1LU << SCX_OPSS_QSEQ_SHIFT) - 1)
>  #define SCX_OPSS_QSEQ_MASK	(~SCX_OPSS_STATE_MASK)
>  
> +/*
> + * NOTE: sched_ext is in the process of growing multiple scheduler support and
> + * scx_root usage is in a transitional state. Naked dereferences are safe if the
> + * caller is one of the tasks attached to SCX and explicit RCU dereference is
> + * necessary otherwise. Naked scx_root dereferences trigger sparse warnings but
> + * are used as temporary markers to indicate that the dereferences need to be
> + * updated to point to the associated scheduler instances rather than scx_root.
> + */
>  static struct scx_sched __rcu *scx_root;
>  
>  /*

Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2088.outbound.protection.outlook.com [40.107.102.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15B514B965
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429760; cv=fail; b=EhkXil8b9hXocWgnXhuhuQdkV//NjZmLwjd0Q5EHZ9o8ecCR7rYQUrQcUTgtsS+nCQyS1JrN7KIq+ucNZRWPe8YVhmMMgUbCDzYRn+Qadw5X/l5YOPSeZkRcA/GfIwpYV25QZtxO10dSSDmD2BdUy9KBNa0BcXswj54LVnnDsfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429760; c=relaxed/simple;
	bh=6wJxvWj0Xo8Q2rosPTi+JoNhSYp10PvRaA0ToeDA9GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KnP95qjvJ/KCArf1ZGEhtPaRjThBMSOz4Nrw/EKp2B9t2C+dd4RbTtChCVAeVEvVc+sQqg46CGl/1cx0m5Fzxt6CzgTCBkpbg2p1jczDo/T4qo2ymVIkwrFu236njrquw8gU2CCtMb3AdBuEgdmiLgaTq4nlRDzS20yOltANnyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gxNOpSus; arc=fail smtp.client-ip=40.107.102.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gxNOpSus"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/kRpDZCySQ73d90f3p+cFrurhliYkNdW9+oDH0amDncRRqQNr4ba7TGDVSdHMbcDSD9kSJ3FLGou4IzTosIrjx4JDJeJC1kta68L6InVh61kX91rHZuJF/SPimadI+SjhN18FC8JKUxurKvlVDHi0F54e0orMjPgG4+4zlM0i9/k7NB+EnOO/kB/u2dvvHnbZ4Me6hEHZXFU68rTwQ+gK+c5wSgcvsHSq15kup7hTSgq/kmj9Rs5ZYBEt/aKpH5p5jicTMCPP/T6SHIF+HbCglw02BSM5JufqAzepQYlKozeJeqVTUMh5UDflWyRRdfMvBLghhAnCmQ8/PRdQY4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vGY7faXGHe9CSOZC+mucw43DZlHJJu3NKq88+TKYHM=;
 b=iRMCVATk9RJ4sayis/l4pOCXVK4LJ8Vmk148S2vvWh+Tfg6qfdU6CL0vQXgEg8xj1D5K+/OxLfBRSOSCHZ7HGOPye7n8WpZvHX3HwkmKZbHAqDFRJWHD/LVk9yu6uA8bKqZzX8Aajgvt4jqnGVHL7tgQBljCldtOXW3iKHXonERPLbvOhk8EYn4VOo4cCsJt+SN2mZqouwOelazy7Umaa0ZZvyX4MGfDRHFtz21+qqMe3RD//7U1+sJEYn4OZBKnzDLa557D3S9H7L4tC9+ZoHeAiVs58U3L/HkKIdqlj2C45VQF9H4krziH6Q6u66B7cghwtJDorECJC8/Kwp3GLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vGY7faXGHe9CSOZC+mucw43DZlHJJu3NKq88+TKYHM=;
 b=gxNOpSus3NHSoRjcT5AjlfXANj1jDHXw99H5ooPg3T6fZARGFFQouM4f8fgTgtI/dA3RkdzNPKkIDzUd86oF3M5Tw2I/04j8oeFk0cTQLOyuPO5l0btofCdIKBDpQLp9drYmfdM3glN5543GUYZBIXhFU1Kdr46nGXnJqBSsMCe0FW8i2nBcq62NwJvFkZUWBgdEzwr5LRhykA0MIZOrzqFpfjPYaRi2N8d5nHJAXqjpiX2tQj0auL2geurGdrmtgiITfT6GXrHz+mduv4JF4EpYMhHKG37en/E6sbT1pV2P9u6rB/XhSLbuZoQix3cyrhv7r8QMlGoK3i67ljFweQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SJ1PR12MB6075.namprd12.prod.outlook.com (2603:10b6:a03:45e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 5 May
 2025 07:22:35 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8699.024; Mon, 5 May 2025
 07:22:35 +0000
Date: Mon, 5 May 2025 09:22:25 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Bing Huang <huangbing@kylinos.cn>
Cc: tj@kernel.org, void@manifault.com, changwoo@igalia.com,
	joshdon@google.com, brho@google.com, haoluo@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/sched_ext: Fix errors when running make mrproper
Message-ID: <aBhnMUJJzBATtS2_@gpd3>
References: <20250430024833.196192-1-huangbing@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430024833.196192-1-huangbing@kylinos.cn>
X-ClientProxiedBy: ZR0P278CA0147.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::21) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SJ1PR12MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: e32fb4b7-1a30-4dd0-3245-08dd8ba59bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aM7dJGB0q/BqG2DGwuFNCYha5KHDBBJ5e61kxgxlQ1fFEq3DQhO8n/pwOW3n?=
 =?us-ascii?Q?OTzGRTiF+rx6ecKD47aam2ezaeqSlPoXWbSFt4r+4Ca0Y6yTxAlTbe34CL9n?=
 =?us-ascii?Q?vVj6ZEQj1TWdOYcpZ0dic+8xgk6mRm0/BpiARZUrGpCMvwqvRfsLogQSSmul?=
 =?us-ascii?Q?Bt5qEh4wE6s0eIyMJriTV7addABzCL+0YBZjTFvCgfoLT6YbuCCjdafQxric?=
 =?us-ascii?Q?5+v+O66SYvFo7JTC1cdPM9B8EiDJZoXqdH08JTt+2awlDnzqWkkcXlQgX/uE?=
 =?us-ascii?Q?gNsfSnYYsCKsBSMX89p5MHGvEd/X1dwiGH2Xt8Vd6K6gKX4eeQAB2FobFAT6?=
 =?us-ascii?Q?5jDj8+xglDGcwidRvPN+LRoKZXGZvuhp4EQgs45Wa3TFsMgbmUMstHGg+zBt?=
 =?us-ascii?Q?IJjJcJAV475z51UdPRJVWt2KyTlwFBv+aLSVN25t/GdUCKLET1HUqu7AfONp?=
 =?us-ascii?Q?t9OARXWDHMJwIwl6+jg8C8LilpyBJT2Lu+vZniUoREVBXwE1q3vb9Tm93G7l?=
 =?us-ascii?Q?MCeikVuk6laAb9n1oF0DXND4KyXKhp8xfDNlqDFr7WV2l8gvKzHoZ/FaZQvn?=
 =?us-ascii?Q?y5E3B/Zm+hhqR69FclC9DKGmz5dCErFukFmSxGzmiTD0HynewhIeQrCNaZct?=
 =?us-ascii?Q?hw+se0D+b9fupZ2PrHKgZSF8XUty9cGpOh7YkPUMCpny5ZRorcoLHMfo2XJe?=
 =?us-ascii?Q?8R9/nx+SqMS8j+lsT/x8IYrdrdblleSYTWsObwjMHV7yN7FQkWqQw6dtsptf?=
 =?us-ascii?Q?lz2Tp2GWfiRKaLQ4YM2dU1VeKKnlh/+3cOQ/2g/lLEi3ikljQ7kYN7Yge7ph?=
 =?us-ascii?Q?WnFJAQYqAnI9mf4Cai+NnMGNrmpXzKPHHKXPVx5iNGM0ld44MdiKBh8zfv+B?=
 =?us-ascii?Q?BB1DU5aFYkuOovTzNAW6hHhs64/I1yavCvIDa9Rn2koDjAA1QHvXX9iuSI3z?=
 =?us-ascii?Q?1uil1ReoHRVTFeqHDRjPr6wfystDSgSCt7kg9MCBu02eISYKTmpYWA7+XmMm?=
 =?us-ascii?Q?JFt0cbYBAcuto9Df5VXbX4gIEmDiY+RO20izTRdTJPbc6LSjoBRoFvN/Pu/F?=
 =?us-ascii?Q?Qpdsm5bZHbhXbBxXlXGGXqxRlBxM1HqaneBmhITMNqzaXcMj2cQQwjCEbLCX?=
 =?us-ascii?Q?dfjpIJQWC6EDU5zoVkYsJWpjqPjMqt7OtS9MdmGmYWPxjlo2uONjAmza4+hm?=
 =?us-ascii?Q?iB8aTEc1ERhuF9Lyo91MrptXmDx7MBSAQBHkC3QsUxczJ50cTOgb2k7ZOpvI?=
 =?us-ascii?Q?qbq5QqOqFFuj1fEvWdYSJHm/A0e6gcj7wBCEaee7UyWJ94WZp/lHdaj/LWil?=
 =?us-ascii?Q?tMBFH8wyFvotrHWZEEi0SdPYyFp3m9YTJ6RTikN7JdhLcBeuGRFgGY11WAt8?=
 =?us-ascii?Q?N5q/XTPOQBVhkv/uhW65ClV6LhnMwlhR+tcf30J4AV4PCOa9D13vNnGzHulM?=
 =?us-ascii?Q?ujfl0fACSqU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?09NJd4oV1aocugzSV9V56R/ZeadpptF0e7oUz7GRoKmS08D78tL5HYwFx7OK?=
 =?us-ascii?Q?6dLv7DaWRhFsPHP9WV+d1FjNZvm6hZcZcbpbIfYQ/vUCQ0UUoluGBNDCwXlh?=
 =?us-ascii?Q?V8mQpX1Gv0LRb/NYFiFL2Qg3nIgY4M8qomof3/706GqcF1t+ncc3uK52jkY1?=
 =?us-ascii?Q?ejVIpZ1NoJh3hqygWtNNf0oZVZwntUw2M1mrTwNMF76h/vqhe6oEK4u4MCN0?=
 =?us-ascii?Q?w5ahwR8Bu3QembrmYz3Ep/JMsmxEcxIkdb5rr2q9pTPZ8twIR3KLfG0XIq4c?=
 =?us-ascii?Q?cMJQwnPuITZh8x9+74qh8BslcIjEuIFWWnqtW6RMhQ1aNxwaa1pULTmSxCRl?=
 =?us-ascii?Q?/M1MBKntqWk3R3mgqCgFedXS25D9LVNnhcs1JsBj5sUIN7xgrTmWzJC/k8mh?=
 =?us-ascii?Q?Q/wbMcphSOQBl7iRk7RwYvuEfD8b9xgSa8ZI5B18elmEzezhbkkxs9YnPeg5?=
 =?us-ascii?Q?LRuFMqot9lx70W3u9/wJawlEGzPEmA07Z/RVSWrcXb+DlsHDwuJCf8MVijSV?=
 =?us-ascii?Q?T+5HdwRPbKloPegAIod2WQnX5uX4u9nFkZou14CkyzBntOT1iedCJpyeHYms?=
 =?us-ascii?Q?tHYpdXLXdt622sCtJmR+sn98s91KqsZuItmjKVKHWYSuGsEr8slX/e2r8A9b?=
 =?us-ascii?Q?zloNn0Yns16//UPhKFGAlzTEf7xV5jCTjGtICvmUL83iFY8sA13beL3KGQUJ?=
 =?us-ascii?Q?gcVHRVv6fWPDmjX+z7CGc4UB63qzucJbuuKmq583VZocy23fW+eNiu8j3bmO?=
 =?us-ascii?Q?FgY7G2rShdOEf3hn6GoHWc7UF/9z/bVGB9nWclRUqLUeC0yGpekzquecnBP9?=
 =?us-ascii?Q?mhMm+aP9IKaDnfuNSQmSFEADBT5Rzu5cUsFm91ngCst3WROzXGUVJ7hMgWNj?=
 =?us-ascii?Q?auhouo32uK4CYdGtKxPZElOCKXh7v5sRvMhamh8xQErJFiSBYlhyfX8KqL0l?=
 =?us-ascii?Q?UTJu9EkaY3JsYlUcpN9ys9FS7J2XIjuy/444zkWmaauaX563aPAXkRE/xvHH?=
 =?us-ascii?Q?M19s+mbPu3oyQ1ULaV41ziJQGGI+loWt1wjE2NDxFKfl1It/+f+0DOLipYb5?=
 =?us-ascii?Q?A4xz/jgwl/iKl7EhUsniSwtWknOw5pYt3THiun5AiQcu+aV66NgF+Hj3tAzQ?=
 =?us-ascii?Q?wcV2hFm1cey1JgTiIi3sUzcJ9FNtxkpx1mxT1/zopEn3Gmq2pgHFJeqx+sl7?=
 =?us-ascii?Q?V4kOTwK37D7X+Iyel6H2ww9uCNXj4PiJM7Bda9Kh3SThdys7i5jG8+pKApBu?=
 =?us-ascii?Q?UMFKKYr8Y3tcUto40hGuR+4Bzn0SBSjxKUOM7kN+KwtNL8YSRiFXsaPOWqTb?=
 =?us-ascii?Q?uiIsQdcgqzU8oHyZvvt964zb2dVn5yuNXuRFtEjR7+hPPH0ZRnrYDs8ftywS?=
 =?us-ascii?Q?cwPQwIkdWoPXe1jg2XyxUpuF521vfnXi+HP5+Itqe3t4X0Bqw9yfl5oVRqcQ?=
 =?us-ascii?Q?IrNyhbidVM4oHWMIbzc1iPxJkdccug+I2PBoUgIqfHeLc6rlkrXg150SOeAO?=
 =?us-ascii?Q?NZxhqjIjNdV21KOvsxpWWvZz+WY7SmQonlp6B/DngYrBpz/jY+UGIdkyHUUN?=
 =?us-ascii?Q?AOQvKKdt+5Edh1Wu7tGkTzvEr3/VsXaVzoGPBHhC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32fb4b7-1a30-4dd0-3245-08dd8ba59bc2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 07:22:35.6743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTSbXOVoWam1SpKJo/0qsVwbUoU+45b2c1uWcVPNujGo++fe0rC4a3f5rMdAFmJ26YnkU2OfIsKnUU16to+Wag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6075

Hi Bing,

On Wed, Apr 30, 2025 at 10:48:33AM +0800, Bing Huang wrote:
> If the system environment used to compile the kernel code does not
> have the BTF feature enabled, running make mrproper will result in
> errors similar to the following:
> 
> Makefile:84: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-4.4.131-20190505.kylin.server-generic".  Stop.
> make[2]: *** [Makefile:192: sched_ext_clean] Error 2
> make[1]: *** [/home/huangbing/klinux/Makefile:1374: sched_ext] Error 2
> make: *** [Makefile:236: __sub-make] Error 2
> 
> Signed-off-by: Bing Huang <huangbing@kylinos.cn>
> ---
>  tools/sched_ext/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/sched_ext/Makefile b/tools/sched_ext/Makefile
> index ca3815e572d8..5329cae284c6 100644
> --- a/tools/sched_ext/Makefile
> +++ b/tools/sched_ext/Makefile
> @@ -79,9 +79,11 @@ VMLINUX_BTF_PATHS ?= $(if $(O),$(O)/vmlinux)					\
>  		     /sys/kernel/btf/vmlinux					\
>  		     /boot/vmlinux-$(shell uname -r)
>  VMLINUX_BTF ?= $(abspath $(firstword $(wildcard $(VMLINUX_BTF_PATHS))))
> +ifeq ($(findstring $(MAKECMDGOALS),clean),)

Looks good, just a minor nit, can we do something like this instead?

ifneq ($(sort $(MAKECMDGOALS)),clean)

Since we only support "clean", we can simply check if "clean" is the only
target specified.

This also handles odd cases like `make clean clean`, where we still skip
the check as expected. WDYT?

Thanks,
-Andrea

>  ifeq ($(VMLINUX_BTF),)
>  $(error Cannot find a vmlinux for VMLINUX_BTF at any of "$(VMLINUX_BTF_PATHS)")
>  endif
> +endif
>  
>  BPFTOOL ?= $(DEFAULT_BPFTOOL)
>  
> -- 
> 2.25.1
> 

Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5623E346
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744137732; cv=fail; b=eRLC9Ns9Yn6xA3LZELJ4a9jiyFYK0cePNgTB19XMSX/9iiIC6kbPwm2siILTRBC3VIiueTkcwOgT+qkv6pzIH5jMJKMdHk+P5juhoAYkwb/2FecGZ+v6b1qwtlsnZ6vaFzeDJQKoX1i6NEjsv1zdhsbyDbTOjF2jTi19rT8BT84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744137732; c=relaxed/simple;
	bh=7fhNnm5qZ4VZegfsN4JyKtkkyCz4dnQSykUK+OqXKzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fcVoO2Mp66j+T5FRYgyQCY9uhvz2gZ3Wro4GKzpBUq9SZ3J3Rw6d1QOwreZxoamgD5EgUVhi++OssyIB/o+8vEptZQ6Hb75mIRQCyfzZr0pNemy5tKTIt8xKcnV0DQwIKqyOnfJZGlzhpmUXXXs0ziV0BBiDGpklGd5JZdbvFCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fnYwgCKL; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fnYwgCKL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVdoftUOvNw+JcO37fzDqGFLD1rulr3h3EVojJLUloRUw/ytVElrfQdmihbTspdykaZ46COnoor79BY0St/Ql0+LRNA990jIDcQqHN9CCoRMHg49BbW6j/9UCQdvVJmo2yduyyqqU7+Mv4Gjx7iYCCHXKRC/J8Y5x20cxlv42R8Qu32xTji8AyjjCr1QsBC9HjGF9nV9galznWTseSqbNv5qzWWvp+NnELjlVerfQw7dyOgO+x93H5lQfBHMQX4utHs1tq9ix4Aszkv7KuTGdfqlBMUmCsG/2j2AhmBneHTDOx4Xjtp2LmeHJmG5ZCImAFLKly6Ovfpo0NkyPNGSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWLN3V8tIJLsomuCm2lCNApr3+b2WNTTW39uSTiCn3k=;
 b=xriKo7n/inCcow4lrVvHlLPwBlTGeRjdPx788Z1g27vjSaABDc8jQ9UJQBS+FHtqsIRW06qKCV9SoxAYDmxT0fwTV3BjffV9MGFFK/X1p7683/ZFKHpfSUdPRhicSHyDY+8xqR3hyfr8/xozmbkvg4iQ2NOXHIir5UcHVqb1bWZ9ZU8IomDOQ+bNCDdK8IkwrgaWojkRxKSnyEc96Q0BQ6C4WCYC//UH22fhXJBv1UqOsZ40SFEtwOh79A/bfDScVNxVGLFEegam0yvKD2bZB5zaKpchwUcO9N+Sf0qYd3Ajd2uygtmOm5RtRLWj20svWnQ4lqBhzv9SmVVmy6/xsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWLN3V8tIJLsomuCm2lCNApr3+b2WNTTW39uSTiCn3k=;
 b=fnYwgCKLmC1NVQJ/qPYNgXDxy5KucjqgtaAt3/scpUh+DTo/i+l0s/Kalfo+GzvHIzaZHtJrNKJziHhbpLBWNLzlHi/GraXAJO36Fyy6lu7XYTHsS39GiYM5nUeGbtJsXZPZo3k0I/DIRPi+rP7j14E0e6C2rn29Zq8Jh35Y60hmb6a5++Ddobs3yJ4zjhj7Gx52AaFhfeoKTx8sNZwoR3bxF2XD7Vh4mp7K7jlboqpzJp5dJBcC8Fj3jFZshdpJK7tiiDeECwY0yylvQTczYMsl9/9muGwGdXrYgBot4zGJqUNO0HLfD1vkin6f5maBSHRPMMUaynYhO6dDaKWp1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH0PR12MB7931.namprd12.prod.outlook.com (2603:10b6:510:289::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 18:42:06 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 18:42:06 +0000
Date: Tue, 8 Apr 2025 20:41:58 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 sched_ext/for-6.15-fixes] sched_ext: Mark
 SCX_OPS_HAS_CGROUP_WEIGHT for deprecation
Message-ID: <Z_Vt9kWib7E5bH9K@gpd3>
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
 <Z_TXIe2fVpAt-CAg@gpd3>
 <Z_VnKbElcEWWg4CH@slm.duckdns.org>
 <Z_VrcMkl2w7EIPC0@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VrcMkl2w7EIPC0@slm.duckdns.org>
X-ClientProxiedBy: MI2P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::17) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH0PR12MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d2d671-8480-4fdb-96a2-08dd76cd0fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K3+iJz0jG8rnPGONBGLcCSPbaY6eJ4cBspROs0FDyM9He9EJgnXFWIZ1ohig?=
 =?us-ascii?Q?h0uFDdyMT2Ia+sseEAmcUnlCjcAu+E53VUpUpL2j3YAuQH23TCd0KSczYvqK?=
 =?us-ascii?Q?6t2UeZoTvWZpAxc+imAtxDepTOcPJ18Ki/YI/lLfGns+tFydtZV8w0bL6G9M?=
 =?us-ascii?Q?N+xI8Zrz0AKee+JR8/03vlxGfw7fXt5TRTrVV1Ulm48yXUO/0IYjk2cHf2uW?=
 =?us-ascii?Q?u08g1x4Yo5TCspTdlwgEWgz2K8MSNlHRF2MqtV8xVaQOLJABuWI321IYG4wB?=
 =?us-ascii?Q?KzXRqIKwtnhghZwROQ3SvDO64Yu/VXNrfr+LIwBydZRIxDpj3cOM73zyJug5?=
 =?us-ascii?Q?V2iAUgvg/TNpFq9ezKm2aytB8qATUvH6tlZoofhlIz4DCbflIOImm7fqvLf1?=
 =?us-ascii?Q?/YKMhoR9CLMukF0GOgw+v7zgfdkg6k4SsqQrcDUT60QiO/6N1Ew2Q+51TWXi?=
 =?us-ascii?Q?Olm0K6SnUlyUD4H+azs5BHsISaPhIZwmyzEb1TgPnTWUJINcpFn8LZG9QAGn?=
 =?us-ascii?Q?NXHh+V9KKHYGggvDeDKYoJ5UUSJOyo+5R4gnWHB2D9g3ZKt/EFbjF8FVqqEo?=
 =?us-ascii?Q?u369hC9MP1TeTCjULa1rmGpdebZxcZILH/NsFndKy/X9xFVj07d+vkSwKGl3?=
 =?us-ascii?Q?MyplJxz3/o1lXCI7ejpyL0W1+hSwASW6iTbvn8Pka+7rQXwsvR+NU1MPy7ml?=
 =?us-ascii?Q?g4UkU2XRqVi6rS45fo0Z2ZyFeDLNyGroIcrFh1U13ciq1uMRpacwiLSKsy2z?=
 =?us-ascii?Q?g020B4VLXBpDFD3If0fMhHIMrbAaGVfd4lm4mVCcnmuNPADsWmpqb7tmg8Wm?=
 =?us-ascii?Q?YQjGyJHD/uQJmRUH7Y1lZHVX/SlS0FN5GQaCqpr7OQ1b/5OGGJMcPeOH7hFt?=
 =?us-ascii?Q?U9skcSyS252yPw1TFzWft9M3AC99NAYBFXgw5Jkni7e4jiUi15h7Dl/4vJwy?=
 =?us-ascii?Q?NsfZjB9F60oj5wp0Jgleb4X3jInculIBlcVvbNg5l6NCj78Dty2dLI7qNABb?=
 =?us-ascii?Q?T0p3OqH7ShfdJeZL1dfZMYW+5XD7pKAICYdBHpQKMIOy5yRml4NAvq3Naaxh?=
 =?us-ascii?Q?WMYG8TX81hqq7nMEdLMoPxHEPDgCbeEDPtVuXpXcGElrrSBIzi4GoCKawo3d?=
 =?us-ascii?Q?Bqbh/6Q0JxuzVVc34hTi2OYHPILqVXjUls4JMQb+Cbd5s58LIoiF99li5Xyk?=
 =?us-ascii?Q?S8/JHcPIIfVixRJQlNyhq3fCnXVtMMQTa4oEAIrs0dc2AbiiR6BjUcA9HMeN?=
 =?us-ascii?Q?9wZG9R7OAXOGpKxPvY2WoRiQmjeLf3oOhn2QheUnohW979Veg/023je27x2g?=
 =?us-ascii?Q?8VH8xkk86waqRavPoHJ24flJKpf7IKsZNeDlEO5TQCfbG7k0Jq8vsZK9cqM0?=
 =?us-ascii?Q?MeFOG00SmM59dXr250+AE+CX02N1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?00C10rMdoGu+xulcDeA4FE/3PT0fll68IWN5e6nak8gEV7VEu9V6Qy7ogNcs?=
 =?us-ascii?Q?rI22rsEdEFalZwkP7+DmtczwVctKILZAuqTUcd8EXeI3S36bByDwcod462OI?=
 =?us-ascii?Q?/y+axzVONMw6Qh2LTZzyNsYSGXMXT2kfnysILXKT3Pnva3WrKsuxvUTHtAhy?=
 =?us-ascii?Q?yLn4CrF80HOH3BB6YTYBx4652qJeKU57G/BFgpDbSbUeH9RaQZb7lR5XLGxZ?=
 =?us-ascii?Q?V37ZwRrSudXlNKNQg4z0iyomY+RU7DNC6xcWyVrOuqJjCdA394rtbGvmADUa?=
 =?us-ascii?Q?/yNaourg8FChTxBH6QjFEOFox0NQBAgODn8soY91Mqt1nPNNGIMfezcTU4Mc?=
 =?us-ascii?Q?gdghJqNW83IOxfz3jcVb8ctcCOOzYC4xivBHNfYbXHrSZYBQ6TvkStE3vwog?=
 =?us-ascii?Q?XtGH1kzVxl6OLodoVHYlDt2J9fHBYG0zyBGVEfW9aJ1BZYz3bUzPsUCKmTq5?=
 =?us-ascii?Q?2TPM640ewiUWPevr8R+eCAk8ZKCvYm+vnH6sA+mXo9EyHkgR901FHDJR+urx?=
 =?us-ascii?Q?O5MCa6S5/ItaYK/0Ip3vz+kc6lQI356zMewhPsg1Us8Mt/aX7sfFeHMKxG74?=
 =?us-ascii?Q?Hlvk50IAAgw4lP5BZv3sRH4amSjAQEHHss1fxuobvYcDpuF7V0bveXI9w1Ab?=
 =?us-ascii?Q?QgQWfXanTMx+BLVKsIOzh5iSWsbpeCQVx6cFQ7ZfyZ+ohsTNLz7FDgpkO7yq?=
 =?us-ascii?Q?/ZBAP2lmycvZxtxo/pgTp30M9ztG30A9eA9NQXqj3Y4PYFOrVQKHcih+DS5k?=
 =?us-ascii?Q?dytq4F+6e1Wo3A9dlBELloz8aZRJyN87EgKrrQDsrUQpPfYmt40N/818fYKx?=
 =?us-ascii?Q?QiOcaC93o3hpwr6jWNyUzN32aY4G3Cwj6hlgcIheYeJazvz6FMb0rxbot+pD?=
 =?us-ascii?Q?4OJ8ctAkyZ2p3GhNFpPimxNwWszVu8wu5/DnAdzxxeaUUOI/TKhf/aYcUhm8?=
 =?us-ascii?Q?kHwpDdqPxg0v3OtvTDbc/gSCXn/2poVeKOnTarGtnqHY6cSJZNdQpYb8ViHm?=
 =?us-ascii?Q?AZ9RgGPoObrnqdvVMFuMPJre4bRzybk1yuTSlY6MIM29IB07RZOOAV7hawQR?=
 =?us-ascii?Q?ni1am7RM6Tx/3Dpxu4g49oqgpUrk+0z8eyKR8HHmTf8IP/P1pton8CL3hFs/?=
 =?us-ascii?Q?GEoWxOgvKlvR/YL6EOom0mTYUZF9I+3JS69C6BwQK6Bfu4+DKT1QANJ2skHB?=
 =?us-ascii?Q?nUWbmk0xpnHXS1qaPQjIT62FqC+4IUHRfKDVD/U6RhrtpQvCeA4qQE/ap28J?=
 =?us-ascii?Q?GA4E1pI5lBiWHr4rTW0KHt1b3C4Bs42a5Q4rbqHa/gsMeYfUbruipTzaYnic?=
 =?us-ascii?Q?AmwmCANJmHKp3tlx5ZFAQ/m5Ijb5qxs4Lob+zvZcenLUcjw/VZ+/7b6wO41v?=
 =?us-ascii?Q?EyBJ2H8VMZkx3d6jMOIK6di/3xPC63bc67ylIz3safQd8nwKh6pSmIAzSrr0?=
 =?us-ascii?Q?lSq/Z3xyzgfJh9op2Q7wm/CZ3GOUIzz6gtXou8eQpUVpER0IrOFwno3f8nwS?=
 =?us-ascii?Q?B2EAs4oYUtK25g//kCj30IAqTHUJEHkhr60ZMXz3rKCdHx1TPSKz5mtH3liZ?=
 =?us-ascii?Q?g7LaTfw9IGGtoOidEyffPyqGVjtLhIFaPzYUnAGG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d2d671-8480-4fdb-96a2-08dd76cd0fdb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 18:42:06.3795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QS+XkDFBuHNX70b58Xa7KrK8ot0BVmFALj2I0sJt2DXF7pyqyvGTOr+q87DINPvnaGQJOjCZ4gFaqFSxMc0nVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7931

On Tue, Apr 08, 2025 at 08:31:12AM -1000, Tejun Heo wrote:
> SCX_OPS_HAS_CGROUP_WEIGHT was only used to suppress the missing cgroup
> weight support warnings. Now that the warnings are removed, the flag doesn't
> do anything. Mark it for deprecation and remove its usage from scx_flatcg.
> 
> v2: Actually include the scx_flatcg update.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Suggested-by: Andrea Righi <arighi@nvidia.com>

Looks good, thanks!

Reviewed-by: Andrea Righi <arighi@nvidia.com>

-Andrea

> ---
>  kernel/sched/ext.c               |    5 ++++-
>  tools/sched_ext/scx_flatcg.bpf.c |    2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 21eaf081d336..fdbf249d1c68 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -163,7 +163,7 @@ enum scx_ops_flags {
>  	/*
>  	 * CPU cgroup support flags
>  	 */
> -	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* cpu.weight */
> +	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* DEPRECATED, will be removed on 6.18 */
>  
>  	SCX_OPS_ALL_FLAGS	= SCX_OPS_KEEP_BUILTIN_IDLE |
>  				  SCX_OPS_ENQ_LAST |
> @@ -5213,6 +5213,9 @@ static int validate_ops(const struct sched_ext_ops *ops)
>  		return -EINVAL;
>  	}
>  
> +	if (ops->flags & SCX_OPS_HAS_CGROUP_WEIGHT)
> +		pr_warn("SCX_OPS_HAS_CGROUP_WEIGHT is deprecated and a noop\n");
> +
>  	return 0;
>  }
>  
> diff --git a/tools/sched_ext/scx_flatcg.bpf.c b/tools/sched_ext/scx_flatcg.bpf.c
> index 2c720e3ecad5..fdc7170639e6 100644
> --- a/tools/sched_ext/scx_flatcg.bpf.c
> +++ b/tools/sched_ext/scx_flatcg.bpf.c
> @@ -950,5 +950,5 @@ SCX_OPS_DEFINE(flatcg_ops,
>  	       .cgroup_move		= (void *)fcg_cgroup_move,
>  	       .init			= (void *)fcg_init,
>  	       .exit			= (void *)fcg_exit,
> -	       .flags			= SCX_OPS_HAS_CGROUP_WEIGHT | SCX_OPS_ENQ_EXITING,
> +	       .flags			= SCX_OPS_ENQ_EXITING,
>  	       .name			= "flatcg");

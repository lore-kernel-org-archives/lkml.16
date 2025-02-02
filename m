Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1001A270
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 06:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738478243; cv=fail; b=CVEpFMek72joquTlIILX1bWL/unxBuOrkYfxC1t81g0EiyjX121COKhSyPd5MGrx6L/z34+gNrL3+uLAi0ghdKm9ZRYcPPAh0mfBqtR/x4FWfReCEzkVuR0eRFPBDcUpwKeXnVPqaQpZHrFEqngM7Vy66GSt1DAg1Iua4N2JfFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738478243; c=relaxed/simple;
	bh=aeH6d8l1aDzWQa61smzodQffkkSrDFMd5P4L/qcD/AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KdqwP5Cz/JN9Q1k453Y82nzvaKAERu0ZgkNiRuS6CgyYvDdFW4f4trZPAwoOIx2l5G2Qorf/Q6UHBrjdw+jdoXisHj2oqxTezcNLQ77y4CVwxSnHkXpybTlXski7qRxhWwJAyE5TPRG9LyND+x4veAu0adv11FeZI6cwRSTv7m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PbMJfTG+; arc=fail smtp.client-ip=40.107.220.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PbMJfTG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnCIuhOHemtGy7deGMdrzbAphumf0N+xO5lm9nF+PVockjDawAbqifmA3P7BsP6ZXC1VLhQJobNVUKJZMfbnioQz8AXRiTgHgb0/EJazR99e/srTz1IArYsq7ILS+g6O4KrfOdawXtf81xWrTLTBOWtV1+qxywT93OLwg0b1JKQWhjsA6HhPay7JeCtkWzlXJGF+VKwVMc/r1h3F7NGoOc3p6MABfKG1hzZcZLM5m3UNFCKCCZC4oeiU/SaWashTDxYnIjgf3RyjT3AJTC+5jwm7Z8rY1Qv50hFCYzuHFPvwc60xtCbfkc/SMqk0OQM6gZZPJrOj7jHEvIM0sgLYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkXJD+RWw+KN6rWcEh/Q87diFYqJ33JM+Ua59+9UGFQ=;
 b=F/ecDdcYd0CNDHIaZVX6dLngv73WIwcxjBYWuYEfDTn4gAKSeT/YL4GpJ9va5IDe0CP4DgvJCqeAJ7Ycptf7aC4R+mB7spQi4VI6eLFr1eoDKCpPrPJgJl24kpd6k4mZoKme98ymOMz/cXcXW8Jx+1Lhcc4GSFb8laGs6xmOTm5Zf6Ft73QNV8NXstIeVG1FfpQugwMJ2HHGShTpgx5UA2372ArwKbZnYIEvgJvnsIXKFryuKnGiItLKpxzGt0Midj1UpqvDrMLE6R9dRDJG4FXx5pL34Tku5MUHuSg78A+kZsPstR4yIjW6DeIzavhdHtyCZnVGCLavcxjQosNm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkXJD+RWw+KN6rWcEh/Q87diFYqJ33JM+Ua59+9UGFQ=;
 b=PbMJfTG+E/IW1B6Gd/D5EMVqDTeNNbQT7/D4s1wIjgJN0EeqKA3/yIqkV0deW71yTyFt69RQ4qCAd65V4AWNIXT9e7IhHWnD/OxTmnc7ccTSocxT+116Jz365Dx7L2N8X3JGlsZ+A+X+Xx2hpeGfNZeX8ZB3192Gemgr8C9NYxFq5GpXZXcTxLi1z+/gH24NYFIm4GTk82DquLtg9BIYC7X3WfJglfe4njA6s548ARj9RRl8vCydtttDCiMHxlMcUt8O12FqLTZ09Mzn16uKLp9RxSMCtPk0ZUywa6byRG8heDXiur5U3d6UaXleeq0IZ1lZnMaxv50ry51ENEwC1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sun, 2 Feb
 2025 06:37:18 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%4]) with mapi id 15.20.8398.018; Sun, 2 Feb 2025
 06:37:18 +0000
Date: Sun, 2 Feb 2025 07:37:13 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Changwoo Min <changwoo@igalia.com>
Cc: tj@kernel.org, void@manifault.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix incorrect time delta calculation in
 time_delta()
Message-ID: <Z58SmdNMlQiXt9fn@gpd3>
References: <20250202033748.359169-1-changwoo@igalia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202033748.359169-1-changwoo@igalia.com>
X-ClientProxiedBy: FR2P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::17) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 50683444-7a3c-44fa-5eab-08dd435409b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dham26RGCz94xlZrY80iUFGlaAInBiwOuygWlRPCCQOd95yFFYCdvqzyZ306?=
 =?us-ascii?Q?WQ3TvDjKr7VfU+jjI6C811V78sudHSui0njGBqMDtwWSlug6qzvTyO0KvBZu?=
 =?us-ascii?Q?Nt151HeS6zzYH6DvhiB4VbZlj8D9U3pmOjLPXe7p/yKrikuI2pHTw2KrHmKH?=
 =?us-ascii?Q?/Qd69TeOAecstjx0O3Mp4mFWVA0NyhIDpNKxol0zAOG+uZBgUwUfMFbeZj6h?=
 =?us-ascii?Q?bVf88UuLFH1Y7Azjgl6yfDAoVVJrc9RT/4wvYKt9FUpbOIiyFO6GU3TRiIrw?=
 =?us-ascii?Q?BDgTv0pT4y9fnDLIy1eun128DbgrsRh0OGZBbgRmT0FWOI51pi65abPMZytY?=
 =?us-ascii?Q?8zaQ6LxGYu/tFAwaYh2TtdcO/GphdXd+gnR1kxvvQVYWjNKrh9YcFeeyWnBt?=
 =?us-ascii?Q?mvy7HwJ//YuPomooHSqoO/6qZVfcjNYLT9V7DYkoa6NRel4TlpW9Pu2CHD6R?=
 =?us-ascii?Q?ZqeM4IN7UJMsATfl7fNUNZEnMnEwkJTS9Uwyo+OkP8TlWRurB9nvxCiuYlAj?=
 =?us-ascii?Q?uv+p5T2D/4iJ6+lIjY8ExxawBTXbFXAcc/8PmHt4Ofqsm+1l8ZhSXQLTQydz?=
 =?us-ascii?Q?IkZk1Z0/sLoPIMibxlUj85o1XLg/p+vJZDYtG6THr7xJqbYoqMTmVY9BGidr?=
 =?us-ascii?Q?P0LCa+YXw9DleZ8PIGnah+NJ6xCLFzoNV6oLaMpMidz+FAPuwYVNzsm1YsKr?=
 =?us-ascii?Q?ZwAZtj8a4PCm8jv8P+ee39iE6tJ2vNSd9SfgeWRf8hteuXyxhsCJ7Av5R5o2?=
 =?us-ascii?Q?gbwNxGo3hzOW2/pD8Ow02c5mVa+XufXZvX+bmSiOYgY27sAEcsI8nNvW6EDz?=
 =?us-ascii?Q?sdZ1GjabLvo6BzbVvoY/T7BtqemqhL6xn0szNI63fX8tEC1gxVRYvLKLsJym?=
 =?us-ascii?Q?GamZ6QZWuHQ7LjzyeXXaYpIfh5mGR//RvLQ9Oxx6UcB1e4woJMjqrZJTQH09?=
 =?us-ascii?Q?h5/xeUgsZ89MyfDfklxl1cdfI0+IBIwCMID3Krx1XaFfR5LKxltD0v2Q3DC8?=
 =?us-ascii?Q?us6o67WtbMRW/4SHijA02qToi6cZJBp1oQ3njvbU0bAgPbN4r5BV+3gyUOR8?=
 =?us-ascii?Q?WyOEeElsVATXBFOJpy1NRRNKmouwdv06KXbFeVUXxu/1VKxBbg6AaYFhKsI/?=
 =?us-ascii?Q?z+LoliNfUlGS5pga24z0JrSeeYq4x265CX7W5ytdkPCUDLILpLgA+0SjcsnE?=
 =?us-ascii?Q?mWNjGovGRoz9ZfuZdu3c4AEsTrDSVOGq2KtaLEgFkxIOTInn5FB08OQbw909?=
 =?us-ascii?Q?1e3tF/3j0qHVCTxG1mUG/zFQ9m7RmfWmMCXc/kB4zi9bOiDtd4zaQi3b5vK0?=
 =?us-ascii?Q?rF2wLVW2Fl0CYRLlo97VNx3lUa4qv3IcP9Ry2MW8ItTyoaPssGtmIPBeaHBY?=
 =?us-ascii?Q?efmc1NikOgBB0xwBwnWs6NELczgt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?161Tmls1FjUf/BxjQC6oQkFY7MeZQwjWgHh2dFgw4G0i/FFtfKn46/Aykejn?=
 =?us-ascii?Q?SQz8iSyuo3rNVw4vSwkKIW9DOvYN0CRFuNWa2zc0A/E3y2Z5Up/ik978bRR0?=
 =?us-ascii?Q?8wPGKjxpjevxfnGh24tUTt27GntOIipBecvJafx2Km0Nu+buggw7bvN0kVz4?=
 =?us-ascii?Q?a+f13uugk0WPOg/WTRYJPSxl8jmFLlyjdGsQnU2hIqnt7Z+202aO5SwmCOYs?=
 =?us-ascii?Q?nBe2mlBzjjkXE1nC9sPdYxVwvo+V+TffDkQwZSMiEOFh6K5G5aJqI1FFwC+Z?=
 =?us-ascii?Q?JdW7D3TXMkyFT8mzIpF68DXhHe7im6FscCJBdJOzpWtVR0Pi5F0VDfuiZsRY?=
 =?us-ascii?Q?dkc42E0Pm6qn2XuRJBTYJRzCUj4wJegs0CSZO8Gdn24dbUSBPLwwsy7RAewf?=
 =?us-ascii?Q?goh1nGlZkVreIlwoS/Tl2VH6xh2cbrtGHC/aHEDmwTvTqXv3GOvgptU4d9JM?=
 =?us-ascii?Q?hzw3ud87FNsde5VNXAFAcdpESSSGFyfJ6LnWLW/j1uIpIX8q2QrugtAGBf98?=
 =?us-ascii?Q?NlE/BiQymGCCnh9ptvkr2iVjym0T4tAV5UkTNJUg0GrAxlvBlpoLduz9nuao?=
 =?us-ascii?Q?VX/y2xNANstrI9EUU9ie45SuUpwYJdhdesola2CZ2vaDUb5JPofBCJPYpskO?=
 =?us-ascii?Q?4GbEHbTmGnbkb2YPlone1SkT+1QxhB09hUD7ELkBu4YFEgeR5MLObyuOWMoQ?=
 =?us-ascii?Q?fvxUUHk6f3ii/fNbG95s2WXvxkst43cRPzEG4pKuKUrKUzKlQWhFYnD7NpUY?=
 =?us-ascii?Q?LWUMW8Xh1uqwoPqLv6cDwAZtgeJJ4TeRIUFY6pkVSGytRWxbIrHmmKV7WG9R?=
 =?us-ascii?Q?VdgYD4Tmf1W4QXxKqZiOjKtjQY4wbrZbTDBM8xLb/B1DDhLrrSpkNmlQeV0S?=
 =?us-ascii?Q?w5Mq+KZvwtCXIYelKJKlW9pfS5rLpy4bI4LvVKtkeYqIuOksxoBV3jm62YiW?=
 =?us-ascii?Q?rhjCD08JcTbKz22GEyuBib7gAcjAjrovjN2ilwHoPKXdRJXxiiSPWTi7XnA4?=
 =?us-ascii?Q?kSSjzxbEclOXROADaK/he8wCRv1/mmIyOk5KBcLQMd+adGVWDp8KtQdI0sn+?=
 =?us-ascii?Q?iYeNhthSfjiPscE7VNO3mS9fdbQx2ziqylipoV+QC7MGvCc7kDkukH3Vc0Dx?=
 =?us-ascii?Q?250iSEcVs4Fc9S9+jhIIbJ4DwEcYxTw4GTb0f0X9ubFa57QDqcK4JwVfiOk0?=
 =?us-ascii?Q?0SsqDcYvdLW+87MUXnlT8jHGaxJ6ZAyLwME5RBB50whPmrVMkW0Y878w5eYi?=
 =?us-ascii?Q?VU5qcsG8UtVH42A43NFkLbyf8+CABdADXoX+IqxNTLbAlPjQizQt2rx59Hqd?=
 =?us-ascii?Q?j5uAjIx/ya082EYtOc9XX3SiSHd//j42zJlojdF42Iw+MGNbqFDv/ndaZCzv?=
 =?us-ascii?Q?e9YFSUiDVAGdhWNktFgweOo6NcV1R2FtVhFvFffwho656ECTKLl2LiNoBbZc?=
 =?us-ascii?Q?xV8H/rxv5078QMCGyVgJyorGzaV8gVAO4DnoNw0/2//pM1wT5fsNBmfaXNe4?=
 =?us-ascii?Q?E7VtSa9efNGItIOSEuu7iTENYhtPM7Kj5WlFwIUZt+Mc6ZkjyLRWP4hjaO76?=
 =?us-ascii?Q?BG53bpFT46ceA+hKOjh+QoTHCP7RBXBZso0UEjZX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50683444-7a3c-44fa-5eab-08dd435409b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2025 06:37:18.1213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CH2p+PvtXF4WsSK6fAT2B+W9iOvUdqsmLZZtDsF+zJh9A2+UxULwJJofyWCX3SMC25R1iziHdFzYe1kO/ivRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707

On Sun, Feb 02, 2025 at 12:37:48PM +0900, Changwoo Min wrote:
> When (s64)(after - before) > 0, the code returns the result of
> (s64)(after - before) > 0 while the intended result should be
> (s64)(after - before). That happens because the middle operand of
> the ternary operator was omitted incorrectly, returning the result of
> (s64)(after - before) > 0. Thus, add the middle operand
> -- (s64)(after - before) -- to return the corRECT time calculation.
> 
> Fixes: d07be814fc71 ("sched_ext: Add time helpers for BPF schedulers")
> Signed-off-by: Changwoo Min <changwoo@igalia.com>
> ---
>  tools/sched_ext/include/scx/common.bpf.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/include/scx/common.bpf.h
> index f254a39b86a5..d72b60a0c582 100644
> --- a/tools/sched_ext/include/scx/common.bpf.h
> +++ b/tools/sched_ext/include/scx/common.bpf.h
> @@ -432,7 +432,7 @@ void bpf_rcu_read_unlock(void) __ksym;
>   */
>  static inline s64 time_delta(u64 after, u64 before)
>  {
> -	return (s64)(after - before) > 0 ? : 0;
> +	return (s64)(after - before) > 0 ? (s64)(after - before) : 0;

Ugh.. how did we miss this? Thanks for noticing.

Acked-by: Andrea Righi <arighi@nvidia.com>

-Andrea

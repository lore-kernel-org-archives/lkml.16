Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980C92E62B4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743751838; cv=fail; b=mSrW90XvfGtJoBcIRbMRbkeCSwA5xTscYhu1cFtdVpVZTC1Td91IucDXr7IN5IkqjOMwjYHclXucTFZs8MNwR7NBHZA/brJBGHi9/vjPp4tiYoSMe9KCfkLaoTImWFZNrpvU8OkgcPj48zGdffxvrKQ0LITCw96cSOViUaSlyU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743751838; c=relaxed/simple;
	bh=pDgJpfmCDJCGa05+9cacWd6rVrMZs5uYNGpQvkvasrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AF126OmgX9tFJ/4h2CBFYG+2sHxozaX9ptEe94TK6BiLbkUmeISjG8L9LEpU4d3A3wTGujSemszwdfYqHvbpZjomvNxGZre3+V9+vjGZn+0A55VYfNzDIjC21PHSavadzM/WHVi4i2NyBN8TNaCshs3Ce6s/t0BdXCEyO3g1diY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gj7G/t1f; arc=fail smtp.client-ip=40.107.95.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gj7G/t1f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7f8Nar0r+jArGxc0K6+5XakBEKeYYMz2hEM776uiWmEZCEoFWS/WZ6nioCJ/6BD2fpd7aUcgjNCI+b3/T1ijkxkNG97VzHEuoOAEV4I4FtNJlYtahidN0zKlJDqRLSpM4+/b4mYfTZt6rSvmveOGzPmr6LyBolDXtI0Rb7A/Zbnna147NQPIdamTglJTZoZxLKJ47LCKW8f8h6eo5un5N9w7p3b6lT1q9fwwoFk5ZCwXTGg7EeRHJgEbl8+mqFgM1Y3k6W0/osbt0xXTvr+y3EblUifpLscHACvqYm0lOimWgnP9T99a3cKXD8/GR35RrTelCUTRA46jnR+bwyquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0v2oIC0pRprA7iZfExGSF8s5lY0kJp5vdUzrBcqOFc=;
 b=W53ohhedCX2lgF5WGHAoDQQxM9YumQPEopIM4H+/PTeSi0oSo34CEmOuAVuk5xswB58Oft/K+P5mLe0z+CIiSSG8nHVQtbZhZlZ9COqWBnz431qLt9P86D0QwwbIupIXIOPN4BHnJruwZIwonvetDuUImwVeDOoh7I1EVQiRbINKNzA7XP/2rgYMIeLHXKb/YtpafpNIYFeiNLKb4snbLka0EKvvC5WlLwnP5/SVY74YWzE3cNgB5ySkepshenCzM0ckeR+Q5xQghC3tno4DzVCd2WOGzk8xK03haXW8bTfNW10+T7hFhFrDSzcbaCIDF/4xprh0vC4OjF8bTy26AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0v2oIC0pRprA7iZfExGSF8s5lY0kJp5vdUzrBcqOFc=;
 b=Gj7G/t1fReNU407D1h9dQVny4W4vnUh/b580rTzXNeXFkTb/0Fqqe8InOZ3JMt8k/+JEe3RwzchDzDOE4BhKMsmkGa63WV5AaOS5Dp+TRQpHNrEfLAbRC+WmsDyL1xFhKgkus3CjfgnGXOLJiVWs8MEoT0nusmNj1xXlegq5op64mLUthB+seydEG2dkhs9mRNOLXymUjuA9Wk2nX7hzHEUneZrdUzQ1fCcPG3UwJynFxNSIrwXYGbYbbyeTl7YcbPolBZVbaWpDbRcqMDr+dmmKYccrwescUnCA/FxwpBK/B1jyua2TC2C6SDttwM4xCrQt5UjaSyIgegin5qGWPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH3PR12MB8259.namprd12.prod.outlook.com (2603:10b6:610:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 4 Apr
 2025 07:30:33 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 07:30:33 +0000
Date: Fri, 4 Apr 2025 09:30:23 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH 4/5] sched_ext: Drop "ops" from scx_ops_exit(),
 scx_ops_error() and friends
Message-ID: <Z--Kj36FTPoDrK2g@gpd3>
References: <20250403225026.838987-1-tj@kernel.org>
 <20250403225026.838987-5-tj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403225026.838987-5-tj@kernel.org>
X-ClientProxiedBy: MI0P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::13) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH3PR12MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: b69b3268-2b77-484a-0abd-08dd734a9565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8R57/3rkXJXUjLscNyhGb1ijyZg7ZSoOK9izt6veZs9DmMhuOpgpiJ0W+y0x?=
 =?us-ascii?Q?GFCZQmmZO+eXoKlLq7MHBThLiBtjUSo0CRL97DubP3WyLSzaGFxiTeR9M9CY?=
 =?us-ascii?Q?jl1IYZNQTvQt00aZgWQOxou6Kc6Hb5HRvykMIlvQHAinqco2y5zKeLL5YGqo?=
 =?us-ascii?Q?avesBpOovAOyt0RfYpR92ETTpD3Scmpx7QyxxUvd2WHFxF4UbQgqYDgsbiLm?=
 =?us-ascii?Q?Tb3+BcMsmzygh3qTADffgsJW2iA7EPj62PuqVMku2qv/t6nrPm44+V1Uvmju?=
 =?us-ascii?Q?y2gF2nQ9BPi2AWP3SbDJi/Bxm+D8XgFw4KAYqLVHOHjIbgFkEijhKP4FbJvy?=
 =?us-ascii?Q?bL9wv1t1gh0d7pV5o1gEDXTe4dROosmAhLSn9aCz6sC2Pf4Ghwr7feGlBoEx?=
 =?us-ascii?Q?sVl7Lll4sz2CQr/pEcIOn7M6hYsq5cw+8DHCqQ0hTqQk68wDbfMEgOqU99Sp?=
 =?us-ascii?Q?904bqDdc1Ay9u7SQbJS5zMXyR8IBxZo4Zd+b/vSJ1EH1FfvDQKgCFmlNvA55?=
 =?us-ascii?Q?NUJJMtvFRN8bs1iaK8y2hF94+QSdxBbdI1aYM2igPmSkVE+irtIpLrVX2DBg?=
 =?us-ascii?Q?2SudsvNfWCrU2HKwgTeMRzRgPQdMLY7KRG3muts02rrZoBtFAfO/nabG5Io5?=
 =?us-ascii?Q?oHYMSe23eo5xomAWoU+lQGhnfp2GVZvE5sZf21omBulwGLi+KALZWmiF2jI7?=
 =?us-ascii?Q?iDxQ2AJduWiFSavogCG9MGQEv5YUpnm+mE0AZjiIsqWHJ69pqBJdQVGKX6TT?=
 =?us-ascii?Q?ZyA6iKm7O6RQFrCj0Tp3+vKk+mjVK7R3VhgGFk5enL5mE3BX1SnXHMuLeiiM?=
 =?us-ascii?Q?JOiRxwf//iBRCHfbc1CGn5cl1wrGgP4uqTRF+5hUR41UAgMTrixq9Jto9bjK?=
 =?us-ascii?Q?bpT9PsDD/ny4BaNU4SaNLQreizikv6FtRJ/knsnNoiFcb8kqn+fhmQYe6yCF?=
 =?us-ascii?Q?0QC+XUJLfBWGItUvJTOv0w7iHdu4KOtlAbD5OK0F3IdPnZ0TrPboz7/ETfHz?=
 =?us-ascii?Q?OGImwqSSuT2wU7egb5BlWpiCH7cp2AlziwqAflc35wBtQRkrtucuNud41NC1?=
 =?us-ascii?Q?Koe5wIFHqqDDlwj8BaMrCvyHvRwCpqo956Pf3PoYkYWFhaYhyAXGtbFr0Mi6?=
 =?us-ascii?Q?YMTPMUT+Q557qvhkbrwrOwHgabNxrhL4F14BnTLVXKmQg5PIjWiWBCijm4cH?=
 =?us-ascii?Q?MSRh5EpbCoe29dGLtHyUdJh4BRmS81rsP/mdsQvenO3S11AchuT92xSEsstP?=
 =?us-ascii?Q?5fWYOwdQjpk3zcBNy0KoFERBnfzHZ7kn6DCvEhDOM17OJmiIHouWGmgpttrK?=
 =?us-ascii?Q?H7y7lkSIdcQtC760kP8H2JG6qICNI4Tv2MkWpaJDShfqybeMUycKq5TjaT6i?=
 =?us-ascii?Q?7jaxpMxgeJp0e8T1OAjWbrsxsP3X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PFNo6hk6OtmnHgC6shUPupT2w7RygFaxL+aZPYnBpg9wMI8xnhaZ1Pwtyzu6?=
 =?us-ascii?Q?AZ11Wef9/Cp7iFbc6iVYugH05C3NqJxScgkvueMOjbnXHll+tGxhBIej5uAA?=
 =?us-ascii?Q?oME0I+7l+qYPPyomh53wy1mEtCB504SzS2IgyGaJOu9R0jVRIp16uEIWOdbX?=
 =?us-ascii?Q?/3Wiigi7qaGMvQKW6EOjdcehF8FhS8neL7FfZiJyK2/ZRsrJSUmWVyBYJbXc?=
 =?us-ascii?Q?DhVGBjBk47BAByj7dq1IUbIq8dJky3Hdy4BJIssgDZcGoUSghKYoAknVVOBG?=
 =?us-ascii?Q?jrcFWqby2QjyO3ipTog78uZSgWmhhTii7CMlrR/HMxwK0bq4lruvTmGOb96a?=
 =?us-ascii?Q?OSAbWxoGuC6B5P7FPn/stqh1ul4ziP4UkVbIweIIxbvGBkwfJEVs15aNSARh?=
 =?us-ascii?Q?jCrWFxQo+d4/B1JqB8II1ayUaspkwjbU+GKsz6NSfPglM0hknLnACUHKb7Xj?=
 =?us-ascii?Q?FiaX8xfHeLTWIGIQnU9BGhuFH6NJh10qGht4ewYWupnRJtRiwgIqb9c/oo+u?=
 =?us-ascii?Q?ob2ZHX5CZ1yzz2OdNUcP/EK5xWRT7aW8spiuJEVgOWISvh/r6G6LlZQXImmr?=
 =?us-ascii?Q?GblRiAnyenSB0iKS3pgPcZ0zniFur6MXPjk/aChcYcJ1YEw+Z35pHazSmQHK?=
 =?us-ascii?Q?jslT+ObQKS3MHQRXYtMaoven0d+Y+WuK5292XD8zEsJLAG5djdGYcAJU/jir?=
 =?us-ascii?Q?0ZH49dy9kszg1uu4mO0Awh04H+ln0UNCUSOONU2rD+mB5y4fOj2BobNb5PI1?=
 =?us-ascii?Q?sDVQ3nlSC0fjtZ9IrbeJVe9dH+/NVRKSUut45bMwwqOFmE85rL9WTzr5wYxj?=
 =?us-ascii?Q?GMCg/l6rAEXCWxeVycEqWsK/gxCMINqbFeoOKUGAxpM4WMbTGm+Us6xXFzGO?=
 =?us-ascii?Q?2inrfTZI+S43UONffIWT5xP16HRJMoB0QeEbMJRHGgaQJgl8PXR6qyPPrxnf?=
 =?us-ascii?Q?cQ7uYdG2MU9cUvtOL4HfewSzhOCImXqFiAbt47TTkYXb9UW0ZsPMWg8qQalw?=
 =?us-ascii?Q?eQUGS52bNo+zKYH4eXQMTUqzpBwwgit5k8LYNH271W1jaQ8/JrqCjom3+xRX?=
 =?us-ascii?Q?/+/9be+/rXI5Od4O0a6J2AZTY1NUlXpqLCiCM48rSatVlSQ8bFfaOBFintzD?=
 =?us-ascii?Q?QSQ2gwaZzHKRVfNBTfCnGOWNxVXLVJRloi4yP4p40pd3drLtrhMsTOHmfXyt?=
 =?us-ascii?Q?z76dMmxzV3nhgoi8hpjCJL6heLOUsBsEBf6QNlIinSs9vejJTOrgzik8CPWh?=
 =?us-ascii?Q?PfOlCSOFGYiKLvWjpHrclqTQg3w5o4CisgthYLOFNxO0TiKM1bS3X+4Fv9/Y?=
 =?us-ascii?Q?7GL9D3B8jmgI3YWtafaBxPRoCDmXtmOSXkExrPupUBIA5sxJF4BtbfO3h4gU?=
 =?us-ascii?Q?5KOh2M4EBBJnS4CjIOGHRc2KRwjbCd5ILASA2zjscGGM9RpFe5xFsX/L6ft4?=
 =?us-ascii?Q?a4ECt9nv1JF1kGfNfyqQ0brIoEbwxahd4wBhyiZi/ctjNxpg62XJmSYFWvYY?=
 =?us-ascii?Q?nJ4wqVdFjpVYV+hVfZOSJFvZ9N+BBknQUM79a70p3Yz8IrDu2bc+rKMM95FH?=
 =?us-ascii?Q?S3QeHvPhHhE8LkACozrrgBAF8rZCS3Cw/V1B1vJX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69b3268-2b77-484a-0abd-08dd734a9565
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 07:30:33.0176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0E3nAKhWGmH0xE0aFrielZ+UEZ0CBWWuE/c6VtxSv62t7m5kWapH5d3C1H2ybqJiUpr/oiAnWGrUua+nGGXrkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8259

On Thu, Apr 03, 2025 at 12:49:46PM -1000, Tejun Heo wrote:
> The tag "ops" is used for two different purposes. First, to indicate that
> the entity is directly related to the operations such as flags carried in
> sched_ext_ops. Second, to indicate that the entity applies to something
> global such as enable or bypass states. The second usage is historical and
> causes confusion rather than clarifying anything. For example,
> scx_ops_enable_state enums are named SCX_OPS_* and thus conflict with
> scx_ops_flags. Let's drop the second usages.
> 
> Drop "ops" from scx_ops_exit(), scx_ops_error() and friends.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
...
> @@ -1043,18 +1043,17 @@ static struct kobject *scx_root_kobj;
>  
>  static void process_ddsp_deferred_locals(struct rq *rq);
>  static void scx_bpf_kick_cpu(s32 cpu, u64 flags);
> -static __printf(3, 4) void scx_ops_exit_kind(enum scx_exit_kind kind,
> -					     s64 exit_code,
> -					     const char *fmt, ...);
> +static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
> +				      const char *fmt, ...);
>  
> -#define scx_ops_error_kind(err, fmt, args...)					\
> -	scx_ops_exit_kind((err), 0, fmt, ##args)
> +#define __scx_error(err, fmt, args...)						\
> +	__scx_exit((err), 0, fmt, ##args)
>  

Can we move scx_error() here, right after __scx_error(), for better
readability?

> -#define scx_ops_exit(code, fmt, args...)					\
> -	scx_ops_exit_kind(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
> +#define scx_exit(code, fmt, args...)						\
> +	__scx_exit(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
>  
> -#define scx_ops_error(fmt, args...)						\
> -	scx_ops_error_kind(SCX_EXIT_ERROR, fmt, ##args)
> +#define scx_error(fmt, args...)							\
> +	__scx_error(SCX_EXIT_ERROR, fmt, ##args)

I've always found scx_exit_kind / exit_code a bit confusing, scx_exit_kind
represents the reason of the exit, while exit_code is an additional code to
describe the error.

Not necessarily for this patch set, but what do you think about renaming
scx_exit_kind to scx_exit_reason and scx_exit_reason() to
scx_exit_reason_str()?

Thanks,
-Andrea

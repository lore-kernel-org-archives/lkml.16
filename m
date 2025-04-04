Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B719B22173D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797225; cv=fail; b=KWgkR7W8M+sf8X1mLg1f4fyBGWTsy9CsThCPNVC+73k10OxGGBbQM6C5fsifoxegzvziMtAY62yLTbqb5IqMbqfLwYRmZFebDUVDQCL8MSDtwtp7qkNGRxoG0Nm9PvHAgirPwNeIew/DGEaw0y0RLbinU7JLF6ait0t4o4yljDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797225; c=relaxed/simple;
	bh=Nr+nXrZQV/FF8AsYO8gBq5OOu8/A4JdFUJcqrehP+VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r87kPvc4751Yy2J9fP8nle1hqkv+DxrdkddzitLiR4tQ8Bh69soO33yTn9Tf2gOv/ABif6+TJe17Jcn7fufLS190Zlm9vmDulKVkruUs988Vh0pqxwMyh95c5TpQpjJs+RmvOaZ+UNl9OJw8bw4IEMRIYzpOsxSGPCG1o2FdBrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uI2hHbTf; arc=fail smtp.client-ip=40.107.243.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uI2hHbTf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KntexjrEaATbrbNdh27UKyhoE7z+SSMzUqJUXjDp6ubu5BPIcoj/2gidA8SiHFRluPI+EeeAHuIBTernfzsFBOLtiMEVuIimAzv1BpcnrL19FWJCBGhPprqtvw7FekxbMiEZXqewSz/uJZOWNTQhmFbbipEe2iD6CHv468dzABZlkLgmsXV4u/7Tvf4aqJ4w6nGIKohuuVgm5qIuZA7RTKPWFu+4a4nTS25ZWFfFaNeM8o8EUIuW9bL3Kl4Zm/S8YB4C/C3qxIfcuL8XwiDjw3x1WgEvhga0EyRuByay+8mvtZJh6wL0dS9ftCdcVC1++P8bbL91KS+obVtt1NA0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hms2IO2BH+c0feYQa1mKyHBHEJCNx889VM9kANZtdik=;
 b=LxLihdj5/F9JgC/wr1imLTyZBTpm1xSzCdvf+WV7Lc0v9JTQEsHFZLxDJUzNUz+93J56QqT470QZ5oMuZFU89Z4LpdCAEwwr8B3aRsuue8mA7a2R5tNtrHVtUd3VqTgM2syI1RCumHu20OCzaXKmNeh1UImT2fM/Ok4CWssfYeqp3JmWggUDSG5m3tr7cNgdJDY9CUiEltULzY3ixiRk+TIJDqxi8wtEm8a0dHRGFxkjzoCOefR5TUBe3eIEk/cJyLOTgh03F/3b+Naahge4JwWTD0nhQfrxYK/ldxoOFqKpNgXoGZaol9tpjdniaNk7XMUo9wa/TEhtQEfv/6LEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hms2IO2BH+c0feYQa1mKyHBHEJCNx889VM9kANZtdik=;
 b=uI2hHbTfuCdvUSxVtfEbUrzHXVYlo16bFoNj4LB7i70C5nsMRkrAr6v+fgAdu70V75T10Y/tWqcIcr+DS4oHwNEelWIyORazaZRWwhmoEWxgIScT8IAJFAuXY14oRteud6LvUPLuoSB/TjVeLLjC9UzBrUTz56xEoZYxshBivOJbk0JJZVOIaVOiGisTCA0NkaLn+PfuNAcaeC5ta1tAus1az0a019Gf938FbBg+tKmZo7jiRLfFLh8rU1IcXd85dOctDk69iea8m7L7uAk1z3qMRLpgeyS+ubmnFXCxEI4uo9A4XTv9xaC44qCnrHpcbceUrH/jDH+S9/oUw2YREg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 20:07:01 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 20:07:00 +0000
Date: Fri, 4 Apr 2025 22:06:56 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH 4/5] sched_ext: Drop "ops" from scx_ops_exit(),
 scx_ops_error() and friends
Message-ID: <Z_A74OspwwIPuNQ_@gpd3>
References: <20250403225026.838987-1-tj@kernel.org>
 <20250403225026.838987-5-tj@kernel.org>
 <Z--Kj36FTPoDrK2g@gpd3>
 <Z_AuwsDt68U01rmL@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_AuwsDt68U01rmL@slm.duckdns.org>
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 8034a3e2-8e40-4509-f72f-08dd73b4429c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YYvHloMce7efJRnFObbw+hvPhrspTw9+3FCNVOffRqW+z9KUM9hxa7rPtLlp?=
 =?us-ascii?Q?Bnc4nYUkZztkxCVX4ccMYAtXqb4uMzA4BWOq2WzuUxG18XHsHJwUWP4NGZku?=
 =?us-ascii?Q?8E+69P77sKTiQ59Sp8lYn/nxXdGuLr2LwLLzkDkPropjy5GOiYMh4QnXrTDI?=
 =?us-ascii?Q?uw+JUkhpmbl9KnxETNeZ5wJ4dzmPbxJxOBYmetq7c+RhqkJ0pCDV+QpOFxQe?=
 =?us-ascii?Q?A0ADQFrTSXehGgFdcOqL9kDU2/YVXwS9aVdwtopm7wzY2t6nTryF+oGHSOFW?=
 =?us-ascii?Q?9Tf584VJbdIMCF3TT47DgiG+oAZGMp0E4jBzZxyxdXf1dsIEvSQ4K+vLMpem?=
 =?us-ascii?Q?I3NiceiDRtHb+JlF1BfJei2bxXDYgAPEZsexfj0Vbg5oKn154uQkJD7H1E6F?=
 =?us-ascii?Q?w4HOmD9g7GJCdtC/QmbmkG1i1Mxd86usRbVnzJWXNIn0VFwGZOfy2esKjzhK?=
 =?us-ascii?Q?vCQkPuHQzYEPAV1pDOvODcFavx/A/7BemZ3s5yYSyPvWaAB30SRuhbNVzvu6?=
 =?us-ascii?Q?Nmngky3vOj8gzxGTq+o53immGUxFnk3ZFDOw6lxBWUn1L9rVkOQxlM6t3y4k?=
 =?us-ascii?Q?9/Ae6zGMsD2ND7r2eEL3zz7KCdcQyI14Rv54RbMdc1P6Zpl5r3dtlbZ1OOps?=
 =?us-ascii?Q?03fxzraeYwV8CJiDyZUy+AGKQ5Z1iFE6Ozs6TpKqsvYLo4AA5mCrWlfUpGiV?=
 =?us-ascii?Q?YuTVummljgKi++40K9HilMGE8MxCEtNakVnxtSP/A0b37T6PvclsPe7N98fv?=
 =?us-ascii?Q?M7mcxVevDrwgNUFu0F2qpEfjfQQqKlW20cln9JTs3+He4ZYeNdzRUzAq5A34?=
 =?us-ascii?Q?PlPdlBkck9KnJyYk+74vRcVNx/tCDqXWdmQLQakCwKxvo6j+uRbIlITcbsWr?=
 =?us-ascii?Q?+MISaJlhyjokTmRYtqaoGIJ8ReJz7jfXkeWN60NcQB+bmj9MohVAUPyPTfPp?=
 =?us-ascii?Q?cnrm+LeS6++V/Lmth95PZV8QI1Asecg/2s0Yw4qisgbcqxzYjKD4He2Rt8cU?=
 =?us-ascii?Q?U5tZM05ZvpV2t+u9wsmsjr7P3eqNE4U/kY9p7M80F64BokvFLVYzhA+wOcMK?=
 =?us-ascii?Q?K9Sm/Xe22YKInRJdp+jWtVVh3kG0YPvvsy1oRkXC2u+njgWIesyOjNo8wkw7?=
 =?us-ascii?Q?SSV9OngwpP0h3OpZ0vOofxQa+7RIA1wtjYfR82LNNzfHWgoPdVEBrF2/Ze6S?=
 =?us-ascii?Q?dpvyC1ZRC+lDKcHEub/JTwLtWTAFjh59RiKt7sTxmBP4N87ugx8xmVZ5Ok6J?=
 =?us-ascii?Q?67fOjc9N+/1VUZ/wcn6/f5OIKpWLRkgB+sotNB+1qh74I4YleW8Mts/i754S?=
 =?us-ascii?Q?s+ogbsDzSEOu0SlHVj0j7gHkQdIzZkRcXc8Jjs+5gXm39aDm+7PJ6Tfgwzi0?=
 =?us-ascii?Q?OBxXKTJ01Hh2nydfn8CVA92i8eba?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8xFbu9DCBMEqBgJb7/sTs729FphX26oBW/DlAbktbgkxDhN8m8w2CWOA3JQ1?=
 =?us-ascii?Q?Hct7MNfV/qCgX+jmDAgGeQCQBfZsoJxNSXQlJZOhsqF6NvRr/v/7Hx6RNwu9?=
 =?us-ascii?Q?VzPlGOqsixN7h7iByYrLCs2VYuc9oewI3BNrvztgct84T1qn6L6fvFOvWaiY?=
 =?us-ascii?Q?CMy89FsiklyheGZXfgnS8TOQcs2XIOHTZu9PVOBiJl/YugMnxBgxSsUTsfX6?=
 =?us-ascii?Q?x4j10H8sKPjNnQ5F2n/PWo1H4qReq6Y76Bnx0+XbOnIVVUV6MxAKV+gH6wlN?=
 =?us-ascii?Q?gVrGMNTYZicwuq5v5eJh33eU7zPsTe0R/EbxzTlKuftxsBO1YNaYj4aBCk4O?=
 =?us-ascii?Q?nhouQNFOI9EDAge4o0mMBphmM8MXSuhh/N79Le/OIeOa93MwjXenIC1ueZEU?=
 =?us-ascii?Q?C+A3LKXJwtowbCz1JGCAF3Lo34ygN17qw7g05hE7vqKP9+GmvyL8rbsToago?=
 =?us-ascii?Q?x2kzw6uso1ogATTmy9zETO8lfhgR8feTPl867XZ+IPDtXnNhQvggE+ZYAsTy?=
 =?us-ascii?Q?SeVW+2+HhV/WclIcqv5HGbHHukjXMdYn1jo5Zx4+kUlqZqlkHBw+yN1e/9Ex?=
 =?us-ascii?Q?hYGsY/YbW1/TBx1fV2YcB2w3aIHu0vvrbIBYBuL0CG/Xe83vbJFBPR0fScQ6?=
 =?us-ascii?Q?/rK3aSRR3gWbaMCxzJrMbKaSjWSAf/s0SFnchIpR6+VTIO4ucXKrLf2zgjIS?=
 =?us-ascii?Q?M9vwuMXN1Wlv1VuUdEQYW6ZqUTUNeoMcuLraCEqNdY46q1EN3V/CsNM59NFI?=
 =?us-ascii?Q?gFWsKFlxwAjyWvcMzlnVo67CJDuml+ziP4V++LZ6RnKMwHMvlBPdiktpKOdp?=
 =?us-ascii?Q?TGu8dLEfUfFmpYF4V4NYleRQfds90yGJ/cooaQi0BQiyZb+27GlPDhN9cSeC?=
 =?us-ascii?Q?1WUl+X2kk0VES+hXNylkrgk9YX6diG5GE7nSkRL8X+8e87bxv5W9BT7sqSYf?=
 =?us-ascii?Q?s4HIONF2mfTa8gWNt6kRlJqZ9SWfWPvbHZMTwi7qekzSF12h2IaDCTFR15J4?=
 =?us-ascii?Q?GhXYFadc9aomvK0viBlbxce/+Gy+UcQIYzqW8OUOs+QWsWZC+ORyoeUhFbvt?=
 =?us-ascii?Q?a38Zw8ouTCBKLLzcnTEmK9A7l0tuXL7mYZAxddbePBKx0JSx/O3uKt9I4zG8?=
 =?us-ascii?Q?OV7vLXUtlLOjC0dI4mMv4HA+1IffNHzUI6Jlp7Tv3HEQJA4TH7Ly6F1mPN0Q?=
 =?us-ascii?Q?dO6fzIKMpCvsYRnrriHXg6PC9s1XljXtqskXFWJA8+c5T8AG4Mvzrk2AN0j/?=
 =?us-ascii?Q?Lwkwwv+zNkHU2PJqxvaIB35uz7uVQmPiionemsJAT3ArKhm50e+XclX9DxwB?=
 =?us-ascii?Q?Zo45JTnAPiEkptyPIa+b9LIV/KMwpzGttQCwVXRmezI8AQMSTeB9Tt3Oso6W?=
 =?us-ascii?Q?p150AR8hIZPf+AjZZcLRBFM8XW7Ty0sNiL075iqBzAdcHmeZnJtJZjwqNg45?=
 =?us-ascii?Q?7pTFTGDbe9sHGzzb8VVZjGoEJex92hT16rbiU6fhGf77aDpSnw7BwS0tjqSk?=
 =?us-ascii?Q?2SYRv2zZGF8qlWNGrfeBoohmT3Uu5LnhMprQXA347rsq4frYZPUZtoIhOfvD?=
 =?us-ascii?Q?czFxFV1qzPxW2TwHAngTKyb6V7CcFlDayIEsrpmT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8034a3e2-8e40-4509-f72f-08dd73b4429c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 20:07:00.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZ448npNAEzkTvPW71RyovviuJrdCa4e777VWjKwrhZxK8ylCDJQR4QfarEvHV8L/EVfeEyu5E4kYGMkEwyvGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169

On Fri, Apr 04, 2025 at 09:10:58AM -1000, Tejun Heo wrote:
> Hello, Andrea.
> 
> On Fri, Apr 04, 2025 at 09:30:23AM +0200, Andrea Righi wrote:
> > > @@ -1043,18 +1043,17 @@ static struct kobject *scx_root_kobj;
> > >  
> > >  static void process_ddsp_deferred_locals(struct rq *rq);
> > >  static void scx_bpf_kick_cpu(s32 cpu, u64 flags);
> > > -static __printf(3, 4) void scx_ops_exit_kind(enum scx_exit_kind kind,
> > > -					     s64 exit_code,
> > > -					     const char *fmt, ...);
> > > +static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
> > > +				      const char *fmt, ...);
> > >  
> > > -#define scx_ops_error_kind(err, fmt, args...)					\
> > > -	scx_ops_exit_kind((err), 0, fmt, ##args)
> > > +#define __scx_error(err, fmt, args...)						\
> > > +	__scx_exit((err), 0, fmt, ##args)
> > >  
> > 
> > Can we move scx_error() here, right after __scx_error(), for better
> > readability?
> 
> The current order is:
> 
>   __scx_exit()
>   __scx_error()
>   scx_exit()
>   scx_error()

I see, that's because there's __scx_exit() function definition before the
macros. It's a bit difficult to read, but not the end of the world.

> 
> If relocated as you suggested:
> 
>   __scx_exit()
>   __scx_error()
>   scx_error()
>   scx_exit()
> 
> which probably isn't optimal. We can do:
> 
>   __scx_exit()
>   scx_exit()
>   __scx_error()
>   scx_error()
> 
> Maybe that's a bit better. I don't know.

This looks better, but I'm just nitpicking here, so feel free to ignore
this.

> 
> > > -#define scx_ops_exit(code, fmt, args...)					\
> > > -	scx_ops_exit_kind(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
> > > +#define scx_exit(code, fmt, args...)						\
> > > +	__scx_exit(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
> > >  
> > > -#define scx_ops_error(fmt, args...)						\
> > > -	scx_ops_error_kind(SCX_EXIT_ERROR, fmt, ##args)
> > > +#define scx_error(fmt, args...)							\
> > > +	__scx_error(SCX_EXIT_ERROR, fmt, ##args)
> > 
> > I've always found scx_exit_kind / exit_code a bit confusing, scx_exit_kind
> > represents the reason of the exit, while exit_code is an additional code to
> > describe the error.
> > 
> > Not necessarily for this patch set, but what do you think about renaming
> > scx_exit_kind to scx_exit_reason and scx_exit_reason() to
> > scx_exit_reason_str()?
> 
> Even if those are better names, the enum is exposed and used from the
> schedulers and renaming it would need to go through compatibility process.
> I'm not sure the gain here would be justified.
> 
> We basically have two levels of exit descriptors. We call the higher level
> kind and lower level code. I think having two exit descriptors is going to
> be a bit confusing no matter what we do and maybe we should have stuck to
> one value. Anyways, here, I'm not sure the return would justify the cost.

Yeah, I wasn't considering that it's part of the BPF API, definitely not
worth changing it. Let's keep it as it is, maybe we can add a comment later
to scx_exit_kind to better explain the difference with the exit code.

Thanks,
-Andrea

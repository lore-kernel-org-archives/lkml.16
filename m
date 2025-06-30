Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44FD244688
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292685; cv=fail; b=LfWwU4sfq5mbeVLsSJc+Hh8FQxim5i73zfJVFyvaQB1gMgJBIZtb4R3BplFYEbFfkVEv8DRxzqWKc5SuePMtsAmBbk1y1dccg0g2OeRfgn26I+HuUwbXH9+ctXx+3YVj1JhE+FHomLYlg6hNXsatK50zo1jCmL3pMz9XhnGZbfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292685; c=relaxed/simple;
	bh=QPDPpa4kyHKNd7ORu5RiwOsSoB0th7khEpDY3dicTGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IaK0oZjT+W0WA/jkTnQrSGCaJmp2BwdtG5QsWFkYbKeNRsZ6h2DLY2kmJ2eSG46GNj3KJWrLpPF8kCmNiwDkqiVfM9yzsqzPTcbEJDhSXlCYp2DqVhFAwWhP+5jqXJMfPN/dXbaBGxPEIMC4JIHzEBT/sP2QdtKMX2zSLvcPKBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r/K/mVr2; arc=fail smtp.client-ip=40.107.101.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r/K/mVr2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPeclP7Pfr31bvGW3jpysNXwD0RaNo1qhQD9Bc4PPrpCO2lqQ4GlE4Jpe1iOLLkEhLn0zjycvK5+mOzKKR2rXHZtm7yq1hcC4rGnjzcV5QotVVJS1kR+uhAeevVjwCggobxZm5+gJXKP9jk40EfBh17Mhq919bekH1wCrrwxUA61Kuq5xCKo1H7+dOeu+GNIEqkDrXHrFKxgqdvzPFlxuPItQdSHBXZZIUBVpOZtg57go3NoJOORLFiIPEdb6XTAwLa4+1hf4CbKscs+Ey5t0O9BrJZf4VPzuIuz000ClniLrPhfrhjRvQoTaeFFF0z3F5WSNumoov7N3Onzbfh6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1aqF+l0kTxijMJUHYcvxJV3QLf3zQoJXQpoIlIoXUo=;
 b=XmZrI5XrYGwNR7EQXMWuS9IWaENceYumdDJ6rxKDGM/EY4AzkuZU8EsKDVv3oJIDmbs0TkEM1zlOnJedWB00k1RiXZS07Anh44AMyoMcVn48syjVfZlpHYtN6BzVxnWvfyaqP/Ra3fkGp2ulUbvLkPxV2lWrnnLR/ULlbVDtgTB0+yZz5qll30Rgud4aehgFZJWOvVMFTfxmJOZ4cWNji+cVtule98SpPYDS+0jQ1gMtuNyny/d3GIHDPL1oOgeMLbp/Q3z+mDHLU8QV7croT4Bkro9JSjrMU5BqjDu2vn0drlZfcPaInA2ZvT3/OZ5K55jv1fG/7K0R8aM04+ipWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1aqF+l0kTxijMJUHYcvxJV3QLf3zQoJXQpoIlIoXUo=;
 b=r/K/mVr2g95amAFYv0/ph546xhLRFmDObWts//hMM+tKWOde0HGt4UaIYpuxWowYJB9Rse6EtSPIUyrNiGwSYOJep52Q1LWG8vDAr//+/6S7dSYelTyoodTs6uxKzzptqEFpG7v8BmJYZ5Q/wkySOM0dtSUa8PeVPLAf+tR2GUWIMWtk1K8PC379QssZ22vr9hetC4VukMEwisVBIDMiZHuUdyKBssmAC0l9i1RnFOnDzHi8nhFM+6pSptBHgNahcgtg9mYkq8gzZXdZBeFwDh2sClYvS1IHf634UhqZxO75v5GxVE479/fd/sxzdMkgITL1xasf2RHmvd79Z+glkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA0PR12MB7464.namprd12.prod.outlook.com (2603:10b6:806:24b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 14:11:21 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Mon, 30 Jun 2025
 14:11:20 +0000
Date: Mon, 30 Jun 2025 10:11:18 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v5 02/14] sched/debug: Stop and start server based on if
 it was active
Message-ID: <20250630141118.GA2427040@joelnvbox>
References: <aFm2NSeFE9LJS_BU@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFm2NSeFE9LJS_BU@slm.duckdns.org>
X-ClientProxiedBy: MN2PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:208:120::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA0PR12MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e87cd4-da83-4a7e-dd8b-08ddb7dffc96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tZNfNv5wKBoyF5BDZ+cZhV4z/C7gNV9GC4pW4qCfBaoHvEUW0KHV7HzU8b4i?=
 =?us-ascii?Q?fJ/mzpVBAIa/M35G14J1Dd+nCrHPeleOzM/6NVlS3T1YQ32+rvnVCsqVWtXp?=
 =?us-ascii?Q?kALHWCXOtCLhVWAzp9wx6+NuByDh3pWjRWviPVqC0iXrTHF9YIcOZeog8+Gr?=
 =?us-ascii?Q?qSS1r0nKApE283IwVM+GMxnOytD+BdmifNbnncbGwYEEzHW1gxzjCUm8MhZc?=
 =?us-ascii?Q?FZHhAjNAQMHpWBVOZEAnAnFth/Yss7o2GAg4PaY5bcPmbWyzSduThpioo2Ek?=
 =?us-ascii?Q?xz3gT2Mc9xB/8RzNz2jGSCjQxW92Rk7KDmgwiL9N16qcfxgseK5x8u0dfQSc?=
 =?us-ascii?Q?q+GA9Wpa3Sl3qqBe/zkm+FXHm3x+7O/p+HTzCVIiZEWWzNUM6HfENlRXeJ/O?=
 =?us-ascii?Q?rvSXa7lJvKkwM2G2DhU7oXhwXe8FYHp5bf6ys8Tq1ysTGhPXLNog1fE4Jxx3?=
 =?us-ascii?Q?fconL6ULSf/3kYvoUdxcTeZFi19KD3psduSu1G+A6gtlyg2Y57Jx//fTCETy?=
 =?us-ascii?Q?ic4Hsrx/FkpLndDL45gWS7l1/JX8Y1EPPzfobDEb95BkVFBSOOsLHC20MDeV?=
 =?us-ascii?Q?ZONLCadJqCnO0Np5q/NYiYKLgW31QXhVmzBFVlnA313hmnnp9EIzQCV2AttY?=
 =?us-ascii?Q?Vtsn7LxZdoF2Xu1vSWGUA4wHA9wkER9NPMyiUIZQTIz0MpJmhSFYRbbkVm3M?=
 =?us-ascii?Q?Mvh4u7cwx2551qMcwR5DX/teiJvYkMBqdGvCA6M52YpCeKJvQDMF9h2prONn?=
 =?us-ascii?Q?kngnEndzTpKPHnf7cyROX1RlK6EQm+G9EzDqVPtsPx0hcY6WkD4u4iHCqlEd?=
 =?us-ascii?Q?adPcviT9ynvpwLm9CWavw44ZiE+4P6NBfmHulbgSkF+8gAn4+qT7IiEckibp?=
 =?us-ascii?Q?GGZOg3St83nPkyJ247OujGxIBWrosYfuSVGYlBm/V0LV/y+nqM+zXykTxiHp?=
 =?us-ascii?Q?SrD3TxfW0NDjNWMOYhG8h92bQK6AGFqOyLhakfkWSwFhABfUwUtPcePyrIy7?=
 =?us-ascii?Q?jARMbQb/9le8ESdxF13SfWgPo7osy+c1inHLDIkErJFdbVtiQB4gVFlMKGgQ?=
 =?us-ascii?Q?15Di6tANi8YKvQy0A8ejSgbQbbpsxTfJZoUNtrfp3qUHp8UuZjSwLUO3Hkjc?=
 =?us-ascii?Q?SBxd07nWfBcHSd/0Twq1b8LKVsxEsOSWImW/NS2I5ojfYqTc88bYuOHEh/i/?=
 =?us-ascii?Q?ZV9+xQpg+YIBmZo4+5rZAdZuiIgAUqnEI/zzRuxREcBMmXkG0odlpS5JnrfI?=
 =?us-ascii?Q?46mdF1MLJkU6mOnjcRAio1+73PcmMW1lDUrEUdsSNmatu+nIwPbt4swp0PR9?=
 =?us-ascii?Q?KALEsQgO3ThQ0IlvTMBq2dzKzD4jkmKAJMdYBsp4/lQ1k4PYNkcf+5t9c8Ln?=
 =?us-ascii?Q?lQfcyVsKBvdQh6LKctfpfQp0BrBUBZEvZPMndXOHX+QVwceTTb92LLcXDvHG?=
 =?us-ascii?Q?ggKtwTEsPcE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a9V2kYqRQhYDFNP6AQMVCaQIvAApgdNtrx+IVxoRJ1QkA86b88R1NriPkmyQ?=
 =?us-ascii?Q?vDX3WFe13KsFexBWzawChCtalUO1q5WSDUIfFvH9gabFLq7+5NnQhrIs6Zd3?=
 =?us-ascii?Q?FIl01t5Vmoh0HzsLOPd5uxin0drg/xISWPGSC0I84wttiVQ4bMeOW3E4/0GD?=
 =?us-ascii?Q?U/yByRbNMYsenQBzOGsbN11dOvPyJecN22prk+R+tEe+EB2q+Kod5JkFLNMg?=
 =?us-ascii?Q?djiEkcbvoXW4DBSoykV+ZpGQpr45JiOUzcjPw+jipX+9OyQxRb8UdTbkodAA?=
 =?us-ascii?Q?36nHpGBaEPy53K4rLCoTUF+xTU3bUl74vuVK4LUuCxtdIEAgWCf8m6b7nc77?=
 =?us-ascii?Q?s0C2bMTb+5xNF2KGn3QpJ6ul/6Q/kaNMWB/D+7lJVX6OSxgf9NfVmqI64tss?=
 =?us-ascii?Q?rQ1OpUpbpMu0McOIFUovLGPcZ2hCh7NGgSPJ1SdstvN14Z0IyAlkmU/kBnSg?=
 =?us-ascii?Q?bTTROuEAHLiinRTNDhnFD+5H3b9Ekg0WRvR0EMv08bl3NWBfW+6v1xAh0QAe?=
 =?us-ascii?Q?8CkCFOrBUTEmg+xrIEQJTtkBCR8cpGKW7O09e+5s5Ue9/zd3NTqLkoaq1IAS?=
 =?us-ascii?Q?YRSyF2HWBV2Hmvbn8NdfqFpAXB8flNDTYVbsy9vTr0rXjYIzD063s6azaL2P?=
 =?us-ascii?Q?DGiYbbJi2RoYetHmHC8KtFI2fegfLa15kVA0mPbwy25L8W0j3WkxMp8k4uiv?=
 =?us-ascii?Q?SPFSj+k5P4W1fB+/MEYFdsQdforFf73vKyVieoMj4P4jSwqNCg+eCIS9ZNJe?=
 =?us-ascii?Q?Ja3GsSWpix2hUMVEAkuooZAj0ZzRygbZoVx6XXrMI9yiIY9hwRfsOauPdXY1?=
 =?us-ascii?Q?idJoNTwxEVZnSmp8/HtwC6XezWiU3cO1OY29vzG7Gx7wA2IVzK2ohmO7uljg?=
 =?us-ascii?Q?n9XKPVOERCQCqxMrfRwJmdCYMN3TAfB84IXcx+SQQyJcV2mSpr+BmGQOZ46M?=
 =?us-ascii?Q?2ViRIiHpvXd4U7pZpUZQjAZ/r1zV/0/cReTjNWL/wGkfvL1cqXSGYsKb/8fH?=
 =?us-ascii?Q?4boibqTldddkpij/kcf93T80x7Xve+BmXSGg5CT7diporz7dJW3zLh4l2Vwf?=
 =?us-ascii?Q?BGXl0ZMs5NBJcxdi5jQGh97pxtSVOzNIaMJpWWT2CtAFzbUUkO4CcsMMASO9?=
 =?us-ascii?Q?3h1Eeb0j9vo5PZTyTc5YP32qyJdgQB8upIT4+hGrQfAEYl7JLU6XXTi/0Avt?=
 =?us-ascii?Q?2QOL66FjDN3d0vkwl+IC1CNabK7pWQsYqMLtBN9e8iO/2GpciFGEwuDDHnY9?=
 =?us-ascii?Q?dnNccubmDlgUK9PSF2n2SJAl10Sbl4DBoR9Ra27MfuWUfFR6BHHc5vsGN0pi?=
 =?us-ascii?Q?olAkoKXac5LL+R+014LFYhfFlvsdLab51YO58x31e9Ub4huNl3seZ3JFdJ6P?=
 =?us-ascii?Q?jUx34XevE6Ibs6Zermz45o+Ks9z+qb1CXs7YH6MZtbYkJcZfE18wH8Eb0dvB?=
 =?us-ascii?Q?52OGwJB44jiu/dDOdX+Eauar7/7EYUNNHa7838rsh5UY3AXmVTZQTHJSXILR?=
 =?us-ascii?Q?IB/1DuYo/f0r84lHx29UMbne1hlH7STaD9h+TdJP0Ppa7ilx4lAj+nkwoC8k?=
 =?us-ascii?Q?vkYdJkcnq1Y94tvNaqTOHX1zfaC22YiX5AHBnKHV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e87cd4-da83-4a7e-dd8b-08ddb7dffc96
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:11:20.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vZSsV9RBBjlrtxwZ8GOVZXT67eR/H9w9fh7wUm+N+cAeaAMchKd4Agqq5eB+rA3ARACJL+EnVu1tsJpk160Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7464

On Mon, Jun 23, 2025 at 10:16:53 -1000, Tejun Heo wrote:
> On Fri, Jun 20, 2025 at 04:32:17PM -0400, Joel Fernandes wrote:
> > @@ -381,7 +382,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
> >  		return  -EINVAL;
> >  	}
> >  
> > -	if (rq->cfs.h_nr_queued) {
> > +	if (dl_server_active(&rq->fair_server)) {
> > +		was_active = true;
> >  		update_rq_clock(rq);
> >  		dl_server_stop(&rq->fair_server);
> >  	}
> > @@ -392,7 +394,7 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
> >  		printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
> >  				cpu_of(rq));
> >  
> > -	if (rq->cfs.h_nr_queued)
> > +	if (was_active)
> 
> This is minor but the style looks a bit odd to me. Would it make more sense
> to put was_active in the scoped_guard block and do something like:
> 
>         is_active = dl_server_active(&rq->fair_server);
>         if (is_active) {
>                 ...
>         }
>         ...
>         if (is_active)
>                 dl_server_start(&rq->fair_server);

I agree, I will make this change.

> Other than that,
> 
> Acked-by: Tejun Heo <tj@kernel.org>

thanks!

 - Joel


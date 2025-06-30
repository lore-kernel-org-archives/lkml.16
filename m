Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA83D69;
	Mon, 30 Jun 2025 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291330; cv=fail; b=p6F5/5eu0pSfFKkueelcmDyfAmBqYHDvSG9wCtV/vT6qNFAiBZPlvWkLHfJ+SMQUphetJir7y9aV50RgPFP9f2nLpgQt/ZugQxaFeW9WuNFKuZeQxtp0Hai+DrGq0cmg+4FAFWmyMvushcmNSGssukJbnkkkDvHJ1DrV1R6ULdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291330; c=relaxed/simple;
	bh=O4EdNWXEogBfmdLW7Q+SaR/1DIc+R3hvDZbz4nhsH5w=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tNK0yVMfzJi8NFbSljuHdGPTQFuwcRJbyEmy9UMVlvIZ3nKLCEXAa0AUIh0Ip4G12BffHOk2kQFtFMwsA125ES5Bkc9s8gwRtrJrf6C0mBxffxS2P7ebtOA1XqJOtudrE12MafZ75pKtvxVx2KmKWG44Mm9BnEupv3e/357kPfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9ZjZ2Ga; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9ZjZ2Ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751291328; x=1782827328;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=O4EdNWXEogBfmdLW7Q+SaR/1DIc+R3hvDZbz4nhsH5w=;
  b=X9ZjZ2GabD9OPOkOzdIYD5vphNgId2Hj9in2PAIE2vzah8kmguujDxzQ
   1EAMwe6jnKWNDlWpS9odJJpXkbpXTS1kVYxr1Yc5nSLzjS2LdDkvPu4Ub
   DPLxE/yECK3+0xxaKTMhleFkK0flyW6JpNqv/fiiULx/c3p5ycoZt1LKY
   ky8H38WD4ZvF7xuzijy9RMfy5I/cdn4F55ACQ9zq8DnEBv2UZpFYY0/kM
   woCuDjrSarv1JGTw5846xwZaZAO7bjBlcPkabFDtrOUAv1gjs7N+GFgEb
   2DhAkE8pp4SUcIc3zKd16TlIb5hJNt9bVPdPPJbtKp/gEZ0lQP9ygPxOo
   g==;
X-CSE-ConnectionGUID: DyKygXdKR4WcfDtygBYaHA==
X-CSE-MsgGUID: NSXsC/6WQLC+FDwpHLfk6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64869740"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64869740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:48:48 -0700
X-CSE-ConnectionGUID: JvUduTnfQ+yH/LAa+VuRxg==
X-CSE-MsgGUID: 6M0WV0fjRJ+gTXk4sfvCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="158970216"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:48:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:48:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 06:48:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:48:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfDWJ+liuIjMHs8UFp5wZ7HcCkKRDsA3NntJbFPZDZTILEaZga+qwz6bw5wxPpkyuEoCGCxPIKonDiFmlI+qluJO54qrcV5wqxQwSIQ4sJUmYVQOxXS+GnfdxuETKxVHTGtj6rRBmlOhFKj1M+MjeWDTQ0bjxDQuE9oaAtSlePraHFAlo4uJbd54AHCejxFb/O24jCfNHrRa6dU4ao66GUUDfU9ocuxHEEjH97SzoIZcZIgv0WJkRZnfxn2O6lkRPqLUMWR5kot2v2TeJ7T/dS35BWtmLNah1vgwoqCk3zIVO+16TBVYUryF58gz9Ot0jfV88suYzjFuv7k5wrwb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJ+nyPeYUFylgsjaRr3DOGGYSqSuOtsQtq0gQVXCgTg=;
 b=SDxOWoRdGWIFhP4rDKjTp1m2xQ4nZ71C2/NXPxUpiY0jzu9hggbINj5xaKN0ufRvMWajf0NRJPxA4Rs8rtRqa8HEUQfYU8YfjwSDt8YtVi6D3U1eKHyPD9s3FbVRj/HJQNRE9JQZvZSqGZ8LuzQGZr0qWT6bSfnk/Vt2EQuxk4Y92KmmPYzCXHPrk/mGnn3gShTRgwMRhEvZVg2NurdGa0D2RR6WEAXm6UYBafwu0BmZnM+GgsXFY+I2UvLzxJwIOS46tNdsDwn5IxVOo0qwUSDxlYcuA13DEnIpAvmkBU9QbTsJPTf0e1DQJ1oJcTZvVL3GFBYiNPSu8n5Pw1n9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8438.namprd11.prod.outlook.com (2603:10b6:303:241::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 30 Jun
 2025 13:48:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Mon, 30 Jun 2025
 13:48:16 +0000
Date: Mon, 30 Jun 2025 08:48:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: early: xhci-dbc: Fix early_ioremap leak
Message-ID: <stfmkxxo2odewcw2i53rkrke2i3xecsuvhiagjna3blpw2keui@wqms2enxmkxf>
References: <20250627-xdbc-v1-1-43cc8c317b1b@intel.com>
 <2025062803-paver-octane-e038@gregkh>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2025062803-paver-octane-e038@gregkh>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d30c23c-8ca5-4a98-f21e-08ddb7dcc3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3nTopaK3TwuB3YBXK89iRuk+cIsf8B6gQuJaR7HgYVoG1f+vZgnFch8ntJ27?=
 =?us-ascii?Q?wMoehfRtb5dTK/HWEoJyOxwCIH/859H5U6SHDCR5fP9phFC7Eqg4V4axxbUw?=
 =?us-ascii?Q?40BA6qYXeCBXyjgQUcCDOqKmcc4UgKh+Qo8iLBa9X/q/GCFKB/vRHFfkQR/w?=
 =?us-ascii?Q?bhyfE6JKIYtrnAroLyPaKoO7xr9qXn6FPI6192CCjsaA/u1qq5MffUn2juVb?=
 =?us-ascii?Q?CUxOfP6eXFpFll7hQ8KJGUDjaEitFIpXqqbo3dmVBA3P2JNoU0UtmRroJLCF?=
 =?us-ascii?Q?bR9vTvxgX4Dofh3PcKLtOl0O6r63+7vDLwdqc8W3M+2coHSxgefufZwx0UHe?=
 =?us-ascii?Q?6fM2zgd0XyagBMGBJuoVAkttIT59GADuzNfsl6hcg1WZ18UBo1ERdLETEJ5S?=
 =?us-ascii?Q?70gRotdYqIzqPcYzYAxoyk1RRSUTvJ5t9g4Gp29ka8L4gGoBVFz2mwMdtOnU?=
 =?us-ascii?Q?2mYj+Gerr/lVMj2E1QAg5IkETt9KDjoQ1tqffHDh7kOP5jSMHfQYk4R2vjs8?=
 =?us-ascii?Q?wcagHcnufTMveopVXOsOnHsXJ8FUFZXId1lnDbq/dJg4Y1NzXNTOeOJOocRC?=
 =?us-ascii?Q?PKEx0T92oy3kOXuwyW3pZkWCQ9zHtE3WdxbUAIeOwrVzuriZtS5ivxc47ZCZ?=
 =?us-ascii?Q?L7F5FYLdGDuTbshft4/kO7Z6x2itn8dnEtbMJw8dHbsu84lz0ikgrihqJfSq?=
 =?us-ascii?Q?UD4zy+gB1t+PdH8BgZKxcMFrFUTd5x2I8SVcvk8DSc3jRzct+1ZqOnuJp+r3?=
 =?us-ascii?Q?CtfIsynHrpc6DyBG+/au7FGY7QRtvsoTYHSxlX/0LGiLhnVMGCiO63df5Q/9?=
 =?us-ascii?Q?09ZY20hmRJBMOtGKtyaAhXZ4z0cP4Rj1QJE+wrl0laX8G+LlpJsrNDjf/zJk?=
 =?us-ascii?Q?8qiwUqwwegzpDm1mPdsgYExBZutW1TvL4WTXuev1iDwbbZ0CU/y8/InJJNSh?=
 =?us-ascii?Q?RMxzQm9baRNS+eAWrneZXN7ohtJRzXln7sRAitkW+r55QCCP6AHi4qX4TCDb?=
 =?us-ascii?Q?zschQ4hNnWnI5wztBVSPFls5E0m6k3q+UkKMKGXNlRhF84MdJbvK+HXnmd1F?=
 =?us-ascii?Q?6yuo9wGnenDrppalmbkzroc/7TuvKf+UzSsKq+XVnurYEbEIa4xq7k1AGqOr?=
 =?us-ascii?Q?lxIszFlHCEo5ZkJ+Di3p52dzBYDRd9D0YeDd4yvF4lE58xzqn8Kr9xqHkIfh?=
 =?us-ascii?Q?CU2BSJ4SVkFgdzkBNC+p0scY9aZ4IpPUpse+fJz/9942NI0ups0YYNz8TKwx?=
 =?us-ascii?Q?br8Mg0KGt0o53/IQS2nSGjXK9VK/j8arlhiLD60obT4TzoG+wJ7syk/J6xxr?=
 =?us-ascii?Q?oG/oyoDCrZqeEaKbB/cnGVg2Ut3h3TUE2BIe5d/rYWa1ps9UV3KFCI+XhP37?=
 =?us-ascii?Q?qg7Q9158xBnGsCMYa9I6w11KiLvhBaewqitYpATivN17gydihHtvNLrsph7c?=
 =?us-ascii?Q?kpW5oxJq02c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HZrBAJxuLfGR2zlb/3Ed1yNbM712Y7ctjM7T7thtU9WKUw6Ydw9myPOLE8yd?=
 =?us-ascii?Q?K1AmOww+zDFEAq6NRdr8ii18tgC6l2ptiqVSNp4phJecbxr1vSf08/JIuPtV?=
 =?us-ascii?Q?1BFjwxDoJDV7Xmdc9JjWd0sZUndp/AWG6QfFtclAfDrtIqrQpeH3Y9CwN7U2?=
 =?us-ascii?Q?iyVjpXH6+tI6VciliGaK0WoGZHeVoXlAwfNAue6GGBC6+CFLuShEgrFnZeNF?=
 =?us-ascii?Q?kv+0DMnFUI5vbgd45kHbIuJTf6CMnfnV0KxSS1COeK6BCQpp2dXovNSUECbn?=
 =?us-ascii?Q?uMcuGvSRhJYsRJ2ulFNvAW7kn/xtK+IsjWTE0OF0RqHiNUs0+FGaQaMN8Y6o?=
 =?us-ascii?Q?HTTOKfBNh+wVImoEGarqeEcUXDhJHeGcRtVTQ9YDNoUYwerx6j7aLtXQruvZ?=
 =?us-ascii?Q?1mirLC9NQUmlusPhneX1MOe1FuJPTgxY9BrXl38F09ykIUwNYr63AWjQdFTe?=
 =?us-ascii?Q?tds0ysrDg+cVIk3WO1mPSskyHimCEyHTx8UxF6QVKgVFWDGiaf8n1dOj4EqP?=
 =?us-ascii?Q?e+DboBQivFF8tHiA9UJlQPLnIQiw8JSt2Wf7bAfVeXysDe84A5gYh/lspx6/?=
 =?us-ascii?Q?OJ7IWUZpt9emfKXvOkP9FJ+bOS0tW/jR8shEVFQmGHLrL3g32gorHB0ylc6F?=
 =?us-ascii?Q?ZC0fag6E2wepQZTua03UoflUl/Vhw3rbkSgIw1+aHKCmOQR6tsh9MLgrApUm?=
 =?us-ascii?Q?XzVmfwfY1TBm0nGU2R53hRIEFwOvVZ4BPKCbS9+bNteyqQzy8wEvC3V4AvD3?=
 =?us-ascii?Q?XXAwVBXPxgvc7ZZzXAHZZJnoD/pXYhfLcf0i6P0HTVnL0+K1FnJv17ISRA8K?=
 =?us-ascii?Q?otaMThtZ1ljypu7BQs5x5sS/+bYDyY4vY/dM9/XvIexHwVqQiQV70bCu/jLG?=
 =?us-ascii?Q?hWHVqix68Lvqr68dYEzuSxzLBCFjP1RUbSTj7Yk7ykS1+zpZ7rM53MRwsD0u?=
 =?us-ascii?Q?xzK4j8lz0N230Bedv4bGn7/nUeu0ThkMpknsZND9r9LsFYV/UWXgL+TJMB9y?=
 =?us-ascii?Q?5ksTExBp/c5jCqnrqUCGo8TT3pzWc0cCIZfplFsdHHlBlMbJcgNhb07wf8ov?=
 =?us-ascii?Q?n9RNYKnajEh2RM78qIvmWegnGQFFQoM1beuLm5qFrNguRCkEbDk2RyEeQR4G?=
 =?us-ascii?Q?M2uext6PWTvoHTMWNAGTJ3CRPzM/GgJF2TcLMJIuS/tKTITDykV6x6pkYNUL?=
 =?us-ascii?Q?nMHvB+oD00d8BV8leCEOyJkKp12LAC7oJt7ArLgjxo9iF7D+eoj2bMwQ1KBI?=
 =?us-ascii?Q?Wsn0koxNKQf4yEGlHtMhXivOecIR5tAiWniv10v79fqpFuafTQ+9AZpKfZPQ?=
 =?us-ascii?Q?RuJrAm7XWKIIht9DsDsDeUci9RRC4vjaLhUskM09E75SCP9Nv3zDos1OHTqD?=
 =?us-ascii?Q?DLOn7l49k2tytKpl5yU6VyE4CY4LEAg7edfv0Pyqd5mex8Yva++DwtjHWSCu?=
 =?us-ascii?Q?aiy0LnenszJPWWjiDtWVVurUX165J3Rq411BnlxX0ZkkftcOmJD4hW7KnWVx?=
 =?us-ascii?Q?kksJ4Q0jcsvzFLVzhi0I1ak1aAU9MuLORbEPr1CMlv/AiEspfQC4M/bii29D?=
 =?us-ascii?Q?DzMTswqfNaNQJ4VqHbvPu/Q0l0jL3JzM8DdvRVpl5oZTtzh//yenwHHbA1IY?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d30c23c-8ca5-4a98-f21e-08ddb7dcc3b4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:48:16.3163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMutEUHO5P8njfycZCz08aNKvfXlIaNBWnzzTHN2UDHUcS7A4idrdWn8vmQAMU31+tWJPzR1ULWko6Cfgf6NJRRkkRtptAxGuV3f3wwI8T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8438
X-OriginatorOrg: intel.com

On Sat, Jun 28, 2025 at 04:47:17PM +0200, Greg Kroah-Hartman wrote:
>On Fri, Jun 27, 2025 at 02:47:47PM -0700, Lucas De Marchi wrote:
>> Using the kernel param earlyprintk=xdbc,keep without proper hardware
>> setup leads to this:
>>
>> 	[ ] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
>> 	...
>> 	[ ] xhci_dbc:early_xdbc_setup_hardware: failed to setup the connection to host
>> 	...
>> 	[ ] calling  kmemleak_late_init+0x0/0xa0 @ 1
>> 	[ ] kmemleak: Kernel memory leak detector initialized (mem pool available: 14919)
>> 	[ ] kmemleak: Automatic memory scanning thread started
>> 	[ ] initcall kmemleak_late_init+0x0/0xa0 returned 0 after 417 usecs
>> 	[ ] calling  check_early_ioremap_leak+0x0/0x70 @ 1
>> 	[ ] ------------[ cut here ]------------
>> 	[ ] Debug warning: early ioremap leak of 1 areas detected.
>> 	    please boot with early_ioremap_debug and report the dmesg.
>> 	[ ] WARNING: CPU: 11 PID: 1 at mm/early_ioremap.c:90 check_early_ioremap_leak+0x4e/0x70
>>
>> When early_xdbc_setup_hardware() fails, make sure to call
>> early_iounmap() since xdbc_init() won't handle it.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/usb/early/xhci-dbc.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>
>What commit id does this fix?

by inspection it seems this bug was always there since this was
introduced, so:

Fixes: aeb9dd1de98c ("usb/early: Add driver for xhci debug capability")
Cc: <stable@vger.kernel.org>

It didn't seem a very important fix to propagate to stable, but I just
noticed it applies cleanly on all versions back to 5.4.

thanks
Lucas De Marchi

>
>thanks,
>
>greg k-h

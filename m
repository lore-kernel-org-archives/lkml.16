Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77744193436
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745460791; cv=fail; b=Q9E77QIwN1bdJG6jD95cnCZIDStNhi7GViPpuomQgvdqnjIhzOTrstdCFtKuzqt99SDQJRJVSG7x5QCG4x7lGkc5kkfO2Nq+83GxSqjjN/L+95AkkRNoq1FWwJrMZHe+jDsE/ACzr2YnEJol6MG3CssPGJEuEaFRw7CdbreR0oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745460791; c=relaxed/simple;
	bh=BTfWNytCga4NEjWgaVy7VhI5+/BO0hi4xY84yMpcaPQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XzWq+r+usjCV+T7TzxL4IknidK1uQ4QRI2eTOxiLx2B3ay+87gnZM6UCpiOowewzkNNpbcs8dtHcdAmCN4F+wwGPlSjhNgWOibp9jupSPfumacxEZnn2bulV5w0ohgKRsxF43wScaGUPEkFza33NCW6bMjY17Z2tm6cQL9XpkGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k87vzRol; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k87vzRol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745460789; x=1776996789;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BTfWNytCga4NEjWgaVy7VhI5+/BO0hi4xY84yMpcaPQ=;
  b=k87vzRoltEKp7wtGkjW4oymqZ5gJpl4kIADjZBodo8SbMoL+hGqIdp6G
   SzIiGFFu+Sie0qPRs3YHOcnIg4lte/+A52lwh/yE6QqoMBIN4As8OTmFu
   z52mK7OeXBAlnt4AlLD4nLvEP/X6xJtNT+1piXRGGnQdjMCHN88jNrjwb
   Q62KV7sogvtrTxBdiK4YQJnF07jbM4Cz/ESm12xLrtp6a6Pq5FOkuRynC
   7jzcWWDo06/XAN7Gob7453r8chpuDTBWsR28Ws6ltaBWEbL/9dN+qTFad
   8SsC7KY5WaLlt9bs8SwyCdXQivFLDYy/GiKNJXQxSeJs/ybnC1NkE6esN
   w==;
X-CSE-ConnectionGUID: +PTEAhnzTyGtHXK5yD2zew==
X-CSE-MsgGUID: 4RYpfeuWQDWQjrRgF2p17w==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58448261"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="58448261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 19:13:08 -0700
X-CSE-ConnectionGUID: z6UEXLfuTaeH8lrODqW+EQ==
X-CSE-MsgGUID: 3V87l6rRSrWsN4epxPhWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132365923"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 19:13:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 19:13:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 19:13:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 19:13:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiVQNd4VMqhVIuiAAhiVH+IIt/NPxhK9UFSswyX5szv6H6n3CBDvO8xUrnZv1ikFV1LWg3EnpEVz7a+KA+BSXJWWE8fAlCeDpKs7dPRl9sOICfkriHifK40sMq4qO+e6t57+ccl9tbUK1F8H+v96ZKBadNMfcsiExIcK889jmg7J0ng9IaL/S9reh8EMpqkWGD4ON+DdhYi1A9C5wtztZgNUXbmGdWw37MrpC2KYlkDsJTehyctGcDX8rb+jftJ+VuCd378QxAoxr+U+5QclHkp4ZbUTKnuyLvh5/ddzRhrB7I2/kkTP/jcqgw4NYfGRGMWr/x1srtysZ+8mXatMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jxdu1KlWeei9LeKDUmBaZ8O4hte5S7xm0C5immpofU=;
 b=Af0OLzY4xWHVKp401LFwFoEZk2WH1QI2TmhisSd5Gsu0d6VQdrsHK1qLeVSGUOeaDVDiNQh+zS3i24LKiLDJQC4J1iNUAInVnNWEzOzKH2YhJdprQNrROIgSTEBTl4Tlya8Drdn1EH+aoecFtK2hbz8lVfvG3SIIE+1vAwyKsn+K+SpSj/G7aafn56uO8nPKNBXrr4xRHraiwl+znuIn/buJXkScbwcVGDHmt75jAOaxay/vQpTXLz1MV+3/JIXxHm/CcTxh/zTonMBXWxxdHiOOVUopzf7XTJYpr1QrlQorHJQkti5m1XTXNWky1btGShkt+JQstdsEgl2iaSNzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Thu, 24 Apr
 2025 02:13:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 02:13:03 +0000
Date: Thu, 24 Apr 2025 10:12:54 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: <oe-lkp@lists.linux.dev>, kernel test robot <lkp@intel.com>,
	<linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, <oliver.sang@intel.com>
Subject: Re: [linus:master] [x86/cpu]  f388f60ca9:
 BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
Message-ID: <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
References: <202504211553.3ba9400-lkp@intel.com>
 <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf0e7d2-b806-4dd4-1a15-08dd82d58b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oxu0+gpBp1DboL/NachZqdkML4cUcEI3wYnUMV7xdoDHcs7aqlcSVLOq71Jk?=
 =?us-ascii?Q?BtQFQXhANLrf9cCAHOeAI97Bv1C4DOuNRPzMsnI+fwL+9BRXFGQRyIPuYH6w?=
 =?us-ascii?Q?5wXgTpc8MYZGEoHFs7l1+wdYOW3yGpZ+VsrIpQw1nmY8pBUZeGSxzGG8zO80?=
 =?us-ascii?Q?sxFT9ZCrLjdbgfPt7dM6vwAiZlfU5mZ3+oYtfHiGh/CHJbQgX8sFYVjEG+Sy?=
 =?us-ascii?Q?9+bKVV+zHkEQHZs0SEqeVfLpZKACxRV7yJhn178E8Zzijar4jXE70wdbnGuA?=
 =?us-ascii?Q?CpxQYpAQYwvTcMoIQ9GIT3IWttHNz4UYN4mtgA9odlvyTKGNH8DOJwluIHxk?=
 =?us-ascii?Q?cF9SacEOdAnIIVtodmMdZZGMssAjhIL1IoW3W51AqGNfJK+ID9ydy7OIQQd9?=
 =?us-ascii?Q?5hWYSnzngqFC+TNQz8iCcHr7IiOKAB81End9vRn4HGLXx7Jq0SyH/ALld6J7?=
 =?us-ascii?Q?kPeg5f3ecXoulSdCwr2zR3W2GlTrSg9MzwGTJMNxDkNC0f9+IDaZE5trcdqs?=
 =?us-ascii?Q?B+yp44KC9B2G0PeOIs7ntnGdLxog5hy7V7+mBI/R+AY6geIDx4CgHCQ1L/PC?=
 =?us-ascii?Q?+KjavN5AJ+86DpG2Hxa19n8Zazsf5XvZ4oIOtw68tugL2qYdBHy9RO8SJf+H?=
 =?us-ascii?Q?hVvLayNE0N23fRBKXZ8QovIyIrUHHDvVPIgC8Ce/HhGgGQ9JzCiTmuHxnk+P?=
 =?us-ascii?Q?bjKjGeY3CbjGtFyzyrbG18jEi+utNRo0yE6ycZXQhPGY5IJX03qEJCWHd6Yk?=
 =?us-ascii?Q?Jl8h/nYLgOcrTH4QflLZ0GKe63T0N4Tqf7JfPLWQA+FR+obwLMGAmofLxXrT?=
 =?us-ascii?Q?8AWcMj7jae3Q+TTvfbBTGLOAdTWam9Yu1Gx5+mVizmlB4uGRilLzpjfPT+CN?=
 =?us-ascii?Q?eQON86OcJWuaeupKhzOKpys+bZD7TKnZswTnayISUpmpQdKb0DjBTMGKhPUx?=
 =?us-ascii?Q?KQKJuhWvEoZOCTs7H5CMz4CCWvlkidCcISMxgD0k6kKdJ8ab8+pAC8q5CLkH?=
 =?us-ascii?Q?jG9AZfS5lwenns3U+knheVnFvKfulAaVzmmmRGg3dwiuif0v6Hhlw9TPADln?=
 =?us-ascii?Q?z1oWiG5xGAgQyk1qumiEtbPVgFtjrnVcXCzRRp5Ej2iGyTN49jNd7uINJc/O?=
 =?us-ascii?Q?0vKaovLhqbRG0zL8ehxETTbNy5XYeKupM3gp2XgRx9fKMIThWNssKMVa/Y28?=
 =?us-ascii?Q?1HjRK6Q+krZsyE+9mTNbC6prFGPqIZeOdIUKub2arJliJJ584y00/Ei77/g+?=
 =?us-ascii?Q?zLVoRtHfOetZDwIe1mtcXt9iATwPViNrtdmkLDveWF7IotgPLWvSl3IyIQIl?=
 =?us-ascii?Q?5aUVww3OWWgipnS9M3axqQdPBpl+RDlDojYJyPyVFGF41sNkT7AUMK4kmwFd?=
 =?us-ascii?Q?CaaSZwriyrIc2KZQlpkli2yyYKlcafZHm52oFYcLS9NSc8ikHGEoiLr8ydf3?=
 =?us-ascii?Q?bFu1kcFHjw4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ex3ooTu8cnlZp19jAbxcuDKnO9D7tZsE0J6cOgPxEUZ0yzzNZKsebAMYzHlr?=
 =?us-ascii?Q?X1T9CdQ3X+jR+tflHJQP0B5jA4hrbuZajF4tmYhz7bl2zSnrnRghaefWyTw6?=
 =?us-ascii?Q?GQa9vj4MHrZ7//NNX69X9J8D8CpS6smo7siUBal9cOlPpgkTGWC1L81ojHe7?=
 =?us-ascii?Q?diRgh1iSdXFUoA0O7G/tHdem8zmljUE4ltfGv9zxhpEwk7VFiyDR0p56O5bz?=
 =?us-ascii?Q?Y2ZnoP3iHgdtnnyJJmna0GaHzw7/XPJfZ8q1/ap+HiRFHNj5nUej4QGSjrwU?=
 =?us-ascii?Q?ag0bf+cfS1FatzWvjySXm1HQHl/Iu5/4k9zPTYFw37FkJHNLXxE4k8hCJwX/?=
 =?us-ascii?Q?1Cj5iO0JA7Q6ZTf6cTw9MWN5ukPsr1q1jyFSo4dY+rjtwISJwf1DBObGPQkQ?=
 =?us-ascii?Q?f4TdvFHzMS1+Iq4bk3V5+sNQiqiYVByvJb2lvlJXn7T5anak1ShiDxFVraRn?=
 =?us-ascii?Q?p5pckF0oieTfcaDLkS/0Cnbkafpf3sMdcl+f8q+i80P+FhgT3zNpcNEemK2d?=
 =?us-ascii?Q?bYhvo0NS+ubvUuEIwOfzpRzI7XQg8haUfl1aQMUT47a2vuBTAg+eQ9KzOMSZ?=
 =?us-ascii?Q?HoF92o+354KrThkCpjCm7115aMR6za1FaEmToJZsPEmMCBo1l4qmNb3XGO74?=
 =?us-ascii?Q?/mqZV7kwgdKutjuN+icX02YGXFDV6IXdsmh0jmKUvdVqYaIpRgeSkcljbTIA?=
 =?us-ascii?Q?pAW4o9BILOE4ntYV2b87qaLtMtydB4bR0lZJplExURZNU6e0kwFfrpvEZO9V?=
 =?us-ascii?Q?jIFWx4mKZgaFlAcc2nhrHn53I+TokJZfDK0eosw6M5nqJCZb8PJzMdLsLrGE?=
 =?us-ascii?Q?G/xlctLX/S/oVXW+CDqGLiQHebCttOQQHdIznniE8jxfZ0qZZDE+4Xi8To42?=
 =?us-ascii?Q?WpFtrC2vDNJejFWxHRz0iVWJrKlRP72q8v4msQEanjGZQcg/GaDeliTjyclW?=
 =?us-ascii?Q?XAQ5K+3bD8Ssjo9+w0XKtv/OD6b5Dy4ew7TuRubEQVeFJqu37G3esWKytMGj?=
 =?us-ascii?Q?oDw4FT/Ss2sSAV/WYA6a16pafTqvaNJmG3QmAL8E6MpFk0vw+gO/3wpfwHqa?=
 =?us-ascii?Q?0FBrUEJJgf3NgYxsDQc27APffS8jXO/ciimPXEfoCEoZ9nrNu0UyyvHydfhx?=
 =?us-ascii?Q?s8G8VQQigXh4zfkYv9q/HvALddbdhlub/5PPF2WqrwyHOWsVOx00j1IEyT/A?=
 =?us-ascii?Q?6jjTPzNTE4S5QtbS4dTjhE1TEUe3m8ExbrGv9reTJukAX2BbOIf8f0IwlsE5?=
 =?us-ascii?Q?bNfl4vOwwZOZnOJZ2Saf6kvCMJCQWLawdA0ahe12H3xnWAGnU9oLgNqGVGos?=
 =?us-ascii?Q?7fYVanrUSli4wOdJ2Js9GxTaXPrd9CKopV3rhY5/LPSdn401uBWWnMlUH9JS?=
 =?us-ascii?Q?H6Y2Za4oNnvNX3cbBmSla8MVZO/3T6Qvo2+GBwdWi11WPhUE211tkgKzFysN?=
 =?us-ascii?Q?tiMZ86yfS+68Pi5o0t+gZycUyxq8tRmO/HFv/Hr6sy5c+ulFVwLlCgEmTLgU?=
 =?us-ascii?Q?w55it/h+sjQrGC4CTHIRueqS56jr9u6V5DE9qFju2iW3C7+a8XZwtjs22ZKk?=
 =?us-ascii?Q?00cD4HWhGBxbceolAx9LQ1V0xspxlUUV0K2+VCxUgs0SjDAqGZqFCIPW8Fd0?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf0e7d2-b806-4dd4-1a15-08dd82d58b1d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 02:13:03.1392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6lb1wo2Rxe2/EBB6sufcPR98dguBhI2RKhV1ExbEgPG/QqAQPEKvrgNB+3MJR/lx97BsDFYD3+BHpP3bq2MzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-OriginatorOrg: intel.com

hi, Arnd,

On Tue, Apr 22, 2025 at 12:16:33PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 21, 2025, at 10:12, kernel test robot wrote:
> > Hello,
> >
> > by this commit, we notice big config diff [1]
> >
> > then in this rcutorture tests, parent runs quite clean, f388f60ca9 shows
> > various random issues.
> 
> Thanks for the report!
> 
> From my initial reading, my patch most likely caught a preexisting bug,
> but my patch itself is correct. It's worth investigating regardless,
> at the minimum we should perhaps prevent an invalid configuration from
> building or from booting.
> 
> > config: i386-randconfig-r071-20250410
> 
> Generally, I would not expect 'randconfig' kernels to pass all tests,
> and what happened here is that removing the CONFIG_MK8 option made it
> pick some completely different CPU
> 
> > compiler: gcc-12
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> The most relevant options here are
> 
>  -# CONFIG_M486SX is not set
>  +CONFIG_M486SX=y
>   # CONFIG_SMP is not set
>   CONFIG_X86_GENERIC=y
> 
> In theory, setting X86_GENERIC should make a kernel built for an
> older CPU work on any newer one. In practice, I'm not surprised
> that this fails: While AMD K8 is ten years older than Intel Sandy
> Bridge, they are architecturally still very similar. The i486SX
> is another decade older, but its design is as far removed from
> both K8 and Sandy Bridge as it gets.
> 
> It would be nice to not have to support 486sx any more.
> We have discussed removing support for older CPUs without
> TSC, FPU and CX8 in the past, but so far always kept them
> around.
> 
> > [ 721.016779][ C0] hardirqs last disabled at (159506): 
> > sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049) 
> > [ 721.016779][ C0] softirqs last enabled at (159174): handle_softirqs 
> > (kernel/softirq.c:408 kernel/softirq.c:589) 
> > [ 721.016779][ C0] softirqs last disabled at (159159): __do_softirq 
> > (kernel/softirq.c:596) 
> > [  721.016779][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 
> > 6.14.0-rc3-00037-gf388f60ca904 #1
> > [  721.016779][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 
> > 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [ 721.016779][ C0] EIP: timekeeping_notify 
> > (kernel/time/timekeeping.c:1522) 
> 
> Timekeeping code could be related, I see that CONFIG_X86_TSC
> is disabled for i486SX configurations, so even if a TSC is present
> in the emulated machine, it is not being used to measure time
> accurately.
> 
> > -CONFIG_X86_CMPXCHG64=y
> 
> This could be another issue, if there is code that relies on
> the cx8/cmpxchg8b feature to be used. Since this is a non-SMP
> kernel, this is less likely to be the cause of the problem.

thanks a lot for all these details!

> 
> Can you try what happens when you enable the two options, either
> by changing CONFIG_M486SX to CONFIG_M586TSC, or with a patch
> like the one below? Note that CONFIG_X86_CMPXCHG64 recently
> got renamed to CONFIG_X86_CX8, but they are the exact same thing.

I applied your patch directly upon f388f60ca9 (change for X86_CMPXCHG64
instead of X86_CX8 as you metnioned), commit id is
c1f7ef63239411313163a7b1bff654236f48351c

after building, the config has below diff to f388f60ca9

--- f388f60ca9041a95c9b3f157d316ed7c8f297e44/.config    2025-04-15 15:41:17.009901645 +0800
+++ c1f7ef63239411313163a7b1bff654236f48351c/.config    2025-04-23 09:36:43.718421931 +0800
@@ -351,7 +351,9 @@ CONFIG_X86_F00F_BUG=y
 CONFIG_X86_INVD_BUG=y
 CONFIG_X86_ALIGNMENT_16=y
 CONFIG_X86_INTEL_USERCOPY=y
-CONFIG_X86_MINIMUM_CPU_FAMILY=4
+CONFIG_X86_TSC=y
+CONFIG_X86_CMPXCHG64=y
+CONFIG_X86_MINIMUM_CPU_FAMILY=5
 CONFIG_IA32_FEAT_CTL=y
 CONFIG_X86_VMX_FEATURE_NAMES=y
 CONFIG_CPU_SUP_INTEL=y
@@ -5745,6 +5747,7 @@ CONFIG_GENERIC_NET_UTILS=y
 # CONFIG_PRIME_NUMBERS is not set
 CONFIG_RATIONAL=y
 CONFIG_GENERIC_IOMAP=y
+CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
 CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
 CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

by running same tests, now it backs to the clean status like
fc2d5cbe541032e7 (parent of f388f60ca9)

(the statistics data for fc2d5cbe541032e7 and f388f60ca9 has some difference to
the data we shared last time due to some auto cleanup logic in our service which
removes some results which are suspiciously caused by our env problem)


fc2d5cbe541032e7 f388f60ca9041a95c9b3f157d31 c1f7ef63239411313163a7b1bff
---------------- --------------------------- ---------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |
           :496         29%         145:494          0%            :500   last_state.booting
           :496          7%          35:494          0%            :500   dmesg.BUG:kernel_hang_in_boot_stage
           :496          9%          45:494          0%            :500   dmesg.BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
           :496          0%           1:494          0%            :500   dmesg.EIP:__timer_delete_sync
           :496          1%           5:494          0%            :500   dmesg.EIP:_raw_spin_unlock_irq
           :496          0%           2:494          0%            :500   dmesg.EIP:_raw_spin_unlock_irqrestore
           :496          0%           1:494          0%            :500   dmesg.EIP:console_emit_next_record
           :496          0%           1:494          0%            :500   dmesg.EIP:handle_softirqs
           :496          1%           3:494          0%            :500   dmesg.EIP:lock_acquire
           :496          0%           2:494          0%            :500   dmesg.EIP:lock_release
           :496          0%           1:494          0%            :500   dmesg.EIP:queue_delayed_work_on
           :496          9%          45:494          0%            :500   dmesg.EIP:timekeeping_notify
           :496          3%          14:494          0%            :500   dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
           :496          6%          32:494          0%            :500   dmesg.INFO:task_blocked_for_more_than#seconds
           :496          9%          45:494          0%            :500   dmesg.Kernel_panic-not_syncing:softlockup:hung_tasks

> 
> diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
> index f928cf6e3252..ac6cc69060f1 100644
> --- a/arch/x86/Kconfig.cpu
> +++ b/arch/x86/Kconfig.cpu
> @@ -317,7 +317,6 @@ config X86_USE_PPRO_CHECKSUM
>  
>  config X86_TSC
>         def_bool y
> -       depends on (MWINCHIP3D || MCRUSOE || MEFFICEON || MCYRIXIII || MK7 || MK6 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || MVIAC3_2 || MVIAC7 || MGEODEGX1 || MGEODE_LX || MATOM) || X86_64
>  
>  config X86_HAVE_PAE
>         def_bool y
> @@ -325,7 +324,6 @@ config X86_HAVE_PAE
>  
>  config X86_CX8
>         def_bool y
> -       depends on X86_HAVE_PAE || M586TSC || M586MMX || MK6 || MK7 || MGEODEGX1 || MGEODE_LX
>  
>  # this should be set for all -march=.. options where the compiler
>  # generates cmov.
> 
>       Arnd

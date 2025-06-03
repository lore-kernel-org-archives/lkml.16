Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093061D63DD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974748; cv=fail; b=a9Z3Zrb16LO5Cn3PEguEglyhTmDG8xDRgFJ7NFTwe6jwrcaYE6mkDhS3vGrzcDBKUIRA8ZuBW8Oyt8/iDkXYc7+M8LLguPjgkUegNK7uRXqDOU/e0gwlfzQswG8Dnl6WUKVljP8Ynp0LNRSBlpmHmO9rz8zGLFml2dQ9nQvXRFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974748; c=relaxed/simple;
	bh=t0W9IhmwptJV5Zg4ShlXsFRSZzdQV09LF7VSCkYOIUU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pKsLVTnESOk0Fv5wU13wP9IM9nVZIwT09c/togMb/Pz2pi8uOiY70YuJOFxRfNASS6825ktHJpQ1QOXtu/EGXmIN0q6mg2EkxJaxuYc5XAMsNMbYmkqIR9wsTHTdYoYSp56reE7gPkfmfxpBAmjOjmzdfSHue7YTRdyGijCtQtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALanNZed; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALanNZed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748974747; x=1780510747;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=t0W9IhmwptJV5Zg4ShlXsFRSZzdQV09LF7VSCkYOIUU=;
  b=ALanNZedCOZ3V/gqYr0CLYSABYnddv8AayIY9jYkPbkl29vxqZt2UrNC
   DPX0Y83CXtCSi9vZq17VY4a/tVyEZ3tzdHF6b8ntBfRJXzZ/LCq0LToqS
   qSd2QpGuY05Vgkr3nj0GjsDJYNb6pT07Ci7RI5AYjQoAMpz9odwfWUUUp
   CAMOEiLJkKv9wdk8h/qMAF6geNt2+cn6GFWegW2kLkZWPUC8FnDpI2D6E
   xYNUzKxJXOheQp9D797hXJcmjugt2QUFvTcqc3NEwVQXzvkjNk6aFvcLX
   Ccf+WlYTJBsrgecSy3u52304m0Z/pXnS7K7nDrhDpjV94fPD+N6ydJ06O
   A==;
X-CSE-ConnectionGUID: rVmfBnHVRemecEkmyjoj8Q==
X-CSE-MsgGUID: yHF03QwbRqOgsAKCEaIEOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62086686"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="62086686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 11:19:06 -0700
X-CSE-ConnectionGUID: V1IzCCiBTHGS6BRRl8+JLw==
X-CSE-MsgGUID: yJija9j8Rv6E+b1LKwf7IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="149829175"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 11:19:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:19:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 11:19:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:19:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lplgh8U98XBaEnBJoibAtjRblBH31nNVP1gfaMNiNIBkMy5KniJqfIMHj+MIZ50huoKv8dVj9nzfLPkcYCWvElFkwR24nFyjZ6a/RKnJI/FthhT5Kw+a5q/fdM99T7ktD+HFiCbTzfVSm79Ie1nO+OHaoyDou7vW7ICsH+hN9elZCGuFrFMiEVemDVUuCX6C7WwCMhbNZuSw62tDXt87Kj9Ma1omquVg9RPDIZBB1zhCQr+50QQ2b6Y7DeIdmZ6t9IL2TGnN/FvekApgA93zP6VQQ1+0zHdP6ikiJN9NXpNxC28dZaq0rx1rJ1+/AfVs6X00GjOFdMxMHQDBnm+d4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwUOvHz/ddy5dsb+09nRUoGxZRizmrv+6kqV3dumxs0=;
 b=sv7n3M6mInfRWtTO5AwRVuqPtSHuG2iBxqK3Ebh3SL9jfIxixjj9FZsOFYb2ZaAD99GjZeVrkKwI/V2Xc9zHH382KoetuDMIcOyluCzmsHkmiEZzdZS8amCRDQuZ1BQPfrQVfOhDRACsOBA9F4zbAaze+/awKX1YAC2otm4S7DaJrMDAxyk+VPWA5eGQK/0D3iYzLF1anspYQOFprX7rSTJ/iFe3xaZiW/b4DZDqmb0pFD0mL2cwDEzJWMWkcMFIgY/jWz3KAoELJKXHMXOXJJnFBlPBR4MnPQ4IGXilrCIZq5fgzhEU2lOVcVp4hSvTubtoqf0T5iP1taU+zT5BWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB8563.namprd11.prod.outlook.com (2603:10b6:610:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 18:19:00 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Tue, 3 Jun 2025
 18:19:00 +0000
Date: Tue, 3 Jun 2025 11:18:57 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Dan Williams <dan.j.williams@intel.com>,
	Arnd Bergmann <arnd@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
CC: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Nikolay Borisov <nik.borisov@suse.com>,
	<linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>, "Naveen N Rao
 (AMD)" <naveen@kernel.org>
Subject: Re: [PATCH 3/3] [RFC] x86/devmem: remove low 1MB hack for x86-64
Message-ID: <683f3c91c033f_1626e10021@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250520152030.1499670-1-arnd@kernel.org>
 <20250520152030.1499670-3-arnd@kernel.org>
 <682e5029e88e0_1626e1008e@dwillia2-xfh.jf.intel.com.notmuch>
 <73120bb4-7eae-49e7-be50-1fac67d351c2@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <73120bb4-7eae-49e7-be50-1fac67d351c2@app.fastmail.com>
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: cd677061-901d-4b6f-dcfe-08dda2cb1cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ql8Fd/Z66Gb2aV+e48iQxM1Lhwdb07X1V/792cNnbgLMl7Eos8wfG+SOW21/?=
 =?us-ascii?Q?p/kwcY9010fC+2uLTrs9yFpW1B7hpTBqxA8Ei4jBZeTYFMGpYeaBy9t9eriL?=
 =?us-ascii?Q?BPqV2opR6C15uPffCNIBod9lCy4a1qUFotkJXTY5GMR0vwe4wOOspFvvshFr?=
 =?us-ascii?Q?RAKv4Q5ZHc36FVobpBXmZmD7JzkqzdX2XORgFx6aJvlazF6O1JqEOYyVkCyj?=
 =?us-ascii?Q?brg1g9MWDc9orh/jm0hpdplxM+K7zyjBO18GPY8NX+WNcR9CahPakOXOFVFZ?=
 =?us-ascii?Q?0+r1uaVkVD842T7uz+54MRSDWaJT3ac9YljxsCKocaGYLkM7a5B/u3ppW2Jv?=
 =?us-ascii?Q?qUhkNzZ1yvIdwQkyCW9Hp86cgfqphNxOLXIJNBhMq6zdUtaaNeOXzD8rzmRB?=
 =?us-ascii?Q?O4Ve/gqgpPcGu/ZvQTqcGUkKY7tRj2jYuw6nTPtgWjwWl+mu17Ll0LBZ0f/H?=
 =?us-ascii?Q?1O5YCZ+XdfanSIAUkshDn/kikAckaSMQ2Vh31T0EOiSaVX2E14CCV5ELEZIc?=
 =?us-ascii?Q?gzn271yRerL4SqF+D3X6RAaqVsNk1xJlultVtO7AnBb43JihCYfRb/ZqhUYN?=
 =?us-ascii?Q?tmDejqTeB51SP6PG3x9c2ZtkWuY17xaYTR0ubMGp3yqsSAvUthzvy72R56fN?=
 =?us-ascii?Q?Mcs2gg+WWbsA8jFhsBfKBd1f7LmvKdjaaz4l1OzNNFbpDdfMnG5aCQ5FMpmC?=
 =?us-ascii?Q?JkyHY9V4z8jSyyqlG10LpyQGexh3IsfUan8RSg6HvnVfBRuR2am4qmJOCKRA?=
 =?us-ascii?Q?Hg0w9sjPAP/sZ1KgsCgaZfWuYnQdDhtz8jzMcMMGtvDNSmvmCVWyJXk2miPu?=
 =?us-ascii?Q?GP3CVTjeKA3AmTTfZwIu22cFf2+fUAIRKdKePR23EWMZhIrEEQ9IMQdJaCZD?=
 =?us-ascii?Q?tGhQX5RGtQ6/SD8GymYWjuANC8ipBVjCDS62bj0VhY83yePwvyqLI90ddO16?=
 =?us-ascii?Q?YdQwfXHwQWEKpf3SbElJu1jAdSnq5MOEqUVrY+glut9Cf9sNm+eo1SM9gMAV?=
 =?us-ascii?Q?Y5yzIXFCriXi3DMWSrfvICP3Kq1Zcl637pzBDdYsXVjhxJ5xWb8Dryb9VYrT?=
 =?us-ascii?Q?Fd+1sDRBoDEctSxYX/RTFXEtK/FSFVJP+dogJ9RZ1pyvA/EWR7iMFDMlKNwZ?=
 =?us-ascii?Q?PQgTDTdwv1cLd7Ud++SyFtW/hwPqpiWXs8jHasqSYkBrayqafevheP0/JEaz?=
 =?us-ascii?Q?Y04IYL/eqeoeRrcnXdnb+rHIr8eSCjQ1+hjiZq8VarCQxKEjF3Ua2M9ML2nr?=
 =?us-ascii?Q?IoTk/tJXB64yRh2zG2EKlFQo34bwM6cC6TOp3IwGWs7P3kZQFaZeorLcEWF2?=
 =?us-ascii?Q?afveM/AESoMY7xAHnT9QZbWfJiGyvXsPZ+ckuBdDJ6pCzcaLVAp620S9Nq/M?=
 =?us-ascii?Q?P3x3pKwmu2zdUu8A4sYXKQVzQZ00?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U6OctX6GjpEu51rAh1QpgYZLupoHao7Zfqa8ZfjNUDN1iGbFbype3hRL9tKQ?=
 =?us-ascii?Q?cMjOZqjZhBPwQFfnxCxuoZXRy50aSPEmNzU8FNKdRA/BtHEsky/0UnBTwxqo?=
 =?us-ascii?Q?qomuxsCAv8hej5zJBN+2mhn0nkYu4FQ3RIHt9G4QSKcMdj4CFvNpJx7glAJV?=
 =?us-ascii?Q?SOCToKfVjH1xHAo8vlFxtjWfB1Keu2EwtTS38g9t8NoFSSuB7UuQJZ5qFlR0?=
 =?us-ascii?Q?D0VEsRySiJiuNWBWnHU2Nnvy4s7XYV348CvjExCU8Pn+V35apLSNohtyP0HF?=
 =?us-ascii?Q?cnHcKr2Kzr4Yfc32cQ2IGRTrpK6g8BjT+V7zHqAjD3F/35bCsNOWDE5T3zmE?=
 =?us-ascii?Q?q95DKxEC8jHDoFa/EDMCIQDd9N1nUIitRCQh+8dGvPhzrnRqPzscwgqoM4Z2?=
 =?us-ascii?Q?GRulVxFCSOzYbijeQp3a1byhRUgGkVLs3oJP6ekT5v5nRvzO/DPYjpfFH4C/?=
 =?us-ascii?Q?uVQdW0n06hWPhJEq4T06cfbwjbQJoLlKuULVS1MUIFsKNqXJuNahp2bvXcv6?=
 =?us-ascii?Q?0kbQBqEAa4m5h6mWHM1mnNkoz56F48kktM/T6jgE+3TvOjybSGRfGs/uReh+?=
 =?us-ascii?Q?IGgQuUmbuQNI26hPZcGtWd2MktIZIS0UxZ/K/SfbewDNAnN0qUmvRtWZx60m?=
 =?us-ascii?Q?CqieC244Wy+I1psE5n3Dl72ruBls0tZMcv/41NRKQN19WL1dU36ztWAU2xev?=
 =?us-ascii?Q?F7uO77YP0+A5s093/strRBHdlNUKDEok3Zc0dmphkbn7g73QsaJ1h8nTzpWM?=
 =?us-ascii?Q?1VUBEl3o7IfcxSPemzwgKuq9o4aXNv3NYXd493L5NjOtJZXD6khTFByqEtHN?=
 =?us-ascii?Q?wi8rj9BFaH4cpKVjnPqHxu/dJE3MaYNGiBY7DNbbwGNTYLXqr01sAsXOiwoR?=
 =?us-ascii?Q?/4TO0XpNCal1m78My5zQnKRgdHi1HWO4QCvlJXucgaOMlBqxcOGObnCffjUD?=
 =?us-ascii?Q?jINdgpOcZevi1WLTTG9n9RH86SzmkhXnjkyL609EPNDYHadvUlni4CfHmiWp?=
 =?us-ascii?Q?dkIiCdGM49u4euiHEmoTXQXeJdJ0xLD02DWfLcD3lDkuJDvLQh4Hq0hOk+ZH?=
 =?us-ascii?Q?XvuzYrwpJQ74peIa7dEAddu3qEZHcYWGc5CYYChI1Krf8Tl+8SSdkxslv+Qo?=
 =?us-ascii?Q?+8+1bMSqsFDBHYY1KzyvVlCsSUflwaSUh8DxxJKyi7XNY8WUvAn+nNbh/KG+?=
 =?us-ascii?Q?UWQ5YPJKzOLf+awJQ1wyqV7TjWbLaUZC4AyTR5R/eHMNhHxIFI/SzOwroyxy?=
 =?us-ascii?Q?cV3LZoVtdBgu7zmHzzh9sqflvxrp6/IpQz302B5wzZTpryKg34q4ObQm2afa?=
 =?us-ascii?Q?VT+QRKqEAlaCtwpDgoSg52ts7tDz6E6hjXnbqf8iSUHo4dYJWyq+zdv+nYvt?=
 =?us-ascii?Q?PufXWEAJgdSxKe/bRIntgwfn/17EyT88eL5R8U6D8FgMOYOB2jqa3Ug0lCmG?=
 =?us-ascii?Q?fsmcEmPkkQcpAHj9zNd68ZUj0aXaLfTqZiNTJaDtpyM2eeGEBU9v3rznNDvw?=
 =?us-ascii?Q?bZhkfofOhgEDB3kNQ7uWJNgGGWZsb1udLPszsKKcDn7B2SRRxPgoUajpip1Y?=
 =?us-ascii?Q?W3HM0/4NRU/fRnrbD6nN075/RiJVOW4qEXkDBpvjaXnKuQ44K29sijxCVe0o?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd677061-901d-4b6f-dcfe-08dda2cb1cfa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 18:19:00.7366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDe+25ugDV+iyz278yDM1iFkZAW2MrskeDWot+tN3lEtmutMmxm/vDqGmcTVlBa1PgRp60Hx21JBbfj8XJMtgwaU0Jvvxhxe1sgf1i2RC1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8563
X-OriginatorOrg: intel.com

[add Naveen]

Arnd Bergmann wrote:
> On Thu, May 22, 2025, at 00:14, Dan Williams wrote:
> > Arnd Bergmann wrote:
> >>
> >> Unlike the other two patches in this series, this one is expected to
> >> change the behavior on x86-64 kernels, which has the risk of
> >> regressions, but seems worthwhile to me.
> >> 
> >> Are there any reasons left for keeping these hacks?
> >
> > Kees did this search which seems to suggest that there is still code out
> > there that may not be prepared for a behavior change here:
> >
> > http://lore.kernel.org/202504101926.0F8FB73@keescook
> >
> > Maybe those paths fallback to dmi sysfs or other mechanisms for digging through
> > BIOS data, but I do not think we can know for sure that this removal is
> > regression free ahead of time.
> 
> I looked at those three and from what I can tell, two attempt
> to access PCI BAR areas, which should not change with my patch:
> if they are busy or exclusive, they are already disallowed, otherwise
> they can still be mapped.
> 
> The third one maps the BIOS area at 0xf0000, and as far as I can tell
> the hack explicitly allowed mapping that even though it is marked
> busy on x86-64 since 5d94e81f69d4 ("x86: Introduce pci_map_biosrom()").
> 
> Is there any downside to marking this one non-busy and still allowing
> the ROM to be mapped? Would that bring back the issue of conflicting
> mapping flags between kernel and userspace?

For the confidential VM case I expect the answer is "yes" per this patch
attempt:

http://lore.kernel.org/20250403120228.2344377-1-naveen@kernel.org

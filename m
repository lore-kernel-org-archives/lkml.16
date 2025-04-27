Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461F22A4EA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745732954; cv=fail; b=Q6hCkdLfrSh2TWQO6HGyDRershBppTZnpylCzGzPBme9kIQrU7TFNL4gxWxBr03jguNEQD7yAdgrrmroqwWlZt6/XSiIZ8eIb1rWTbCHVu5H5/hY7XBxs2SysVMfA16EJHsPxhbRWERgEUd3n59UbPCeMZqf4Zj3JWqp1IXW3u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745732954; c=relaxed/simple;
	bh=XlYL0diz185mNsrQwSgTqLgl09slqsDr/pBROOLhDhw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RS2xyB/n7mKjE7Lizy4cF0rXAoAtA8eBxWqkLpyCK6h+k2lTCgTx8eOV2CNiLoj+WTHr/B+umQesCnob10RlyRpCisPpXx7h51VI1GMOIL6Xqiadt4T9bs1vy18lbZ36zYgzNziOZxoGzaaUQvN9w3+M+l/8kXhhaBQHFJKY7eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdawwN6H; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdawwN6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745732952; x=1777268952;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=XlYL0diz185mNsrQwSgTqLgl09slqsDr/pBROOLhDhw=;
  b=gdawwN6HjVJOXYxKmwz6sD35YANQtLMfmQb+b11ziN2kZU9Woh8a5cAa
   D66WEUrsSrxmm0ylEM8od9I6DlmKp/ifr4rSVnauE8GAZybl4/DkrQLCQ
   EO+QGEfEkcaXgNl0ecN6Vvf0RRqeR+KCTIH41ib30ecOWfTba/1uGWcWo
   Y1/A1gkrwJSU9fyHMEG6NXpZZw6UA3O0tgoRKAMsvvFKOoETg19s2VJJQ
   xMJb7wcIf12bMaLnxSr3phz9bFtldEYfEWeGO8MThs+w73b88HuTHM+2d
   pV2efYTw0bogUSoswDlxXSg+l/l0aIfSzOX8bK7KcGm7/AVY2LYgF7Qt3
   A==;
X-CSE-ConnectionGUID: waZYVx6CT1mxS+2qfkuVPg==
X-CSE-MsgGUID: niEk0QVqQ1GSzxxqn5iUSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="49994216"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="49994216"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 22:49:11 -0700
X-CSE-ConnectionGUID: lF9M23ouSDaKuuhrNAnzxA==
X-CSE-MsgGUID: PVksJImPS/+0e+hRmXg7Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="156465158"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 22:49:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 26 Apr 2025 22:49:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 26 Apr 2025 22:49:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 26 Apr 2025 22:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZ0YmgXoFcJrcAqpEDjVb4vZ5O3T9Thkz1lohM10jygb/AzxgXzD0nXsolnemQYZrpIqWVKMTpV+lTCvDl4qsFkHlarJnCe8VbAhKemJoCF8IemNOTJTKoRnnN99iLd2xW1km4nqPStf18XT05l5miGSh7dXZJQs+9DxKhhHEeVDjRmyau6UXe9uh99UuhJispyAGWtPdjAhqbkzk9WrZvzqmntwkay4+8mkAPIzrqC0Jp/iY2BGOSUa1dIfklGwRKYdnTVsmmPDY0pCiudi7W4mUXi+yFpVybpE3iAz4cttUp/RZu/d/1r/uD1FgHIhSwWxY9OUgY6idxuwEkQ7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52WEVZa9eGrJZbwhU4dsNBEED/eAxbN2TTbS3Fx0CQg=;
 b=k2SLvSja5q/TCLrS8N+H0lSV9MOAwz1goi7qAC0mQWXQstUEm4U00ojwR8QRA7brY8dQMiCP79zOVRbQ8H7zhFH8JO944bbU/+YYUaeAhMEmdpJsE/YC6iS5mLXmRDhU02VMTU1GWYb9qHrpm6AnexLd9pxHZKzpXJs1R0SbNzy2VLUNDcK7MlAfNRoINjsC3nmnKNYHZmdr1zxktJNPbcunjBh9KYanrHgPMtRd9emGMECGB/S1Toq+aJMJzfaYbqRYlr+9gtyXf2ydjHNRkFV7xoEvTNXqaa03U5WamuRJJgJl4hSV0YhNtvUkf+z3sTlEZiWtrp9Hijpv8x7TmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB8297.namprd11.prod.outlook.com (2603:10b6:a03:539::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sun, 27 Apr
 2025 05:48:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 05:48:46 +0000
Date: Sun, 27 Apr 2025 13:48:31 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: <oe-lkp@lists.linux.dev>, kernel test robot <lkp@intel.com>,
	<linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, <oliver.sang@intel.com>
Subject: Re: [linus:master] [x86/cpu]  f388f60ca9:
 BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
Message-ID: <aA3FL6e1HVAw1J+w@xsang-OptiPlex-9020>
References: <202504211553.3ba9400-lkp@intel.com>
 <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
 <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
X-ClientProxiedBy: KU2P306CA0067.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::11) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef352ae-2d0b-4c16-f0c2-08dd854f2a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bxIwy/Ry6/fJpold0ymnRVMwz1CWk7aSg0daQOCJ12DmMmY8EANKSlr/qcx8?=
 =?us-ascii?Q?zgQXvhkK4CNo8B760fRQxxCL5ZQW1Gl14K4fuGvxsjlxTld6qxFXleI0zAp5?=
 =?us-ascii?Q?LgCEOBg1RyYow/B6ucBNBjJAwYQ6zAN0arHLwvVvMMRiy3F/m1AYsnHqgLdC?=
 =?us-ascii?Q?HlKo3FsJDpZv8FjIEexSZQtlDwNiDh9SycFf2Li19E4UxmAj/Pp5gmamCk8g?=
 =?us-ascii?Q?B5ZAr7Yh8b9oZcfT4nWsiCWLJ+qX3eaT2ou06DiKl1QcqHmkouW+MMCzjD6k?=
 =?us-ascii?Q?7im31ucDSYs71VFeCC4CqjHvyuqJMcN9evbBAGhXJtHdv6JtMgaPZxfXbaZi?=
 =?us-ascii?Q?TwSxn4hOIRY2Qwxl/lbJSk5zqCpgvhTWUwGtLdR94qL3q9JDSeMIbcdW/xUK?=
 =?us-ascii?Q?8TB/PvIJFxsqpJX1weATzLrdQXL7Tc4bvSjtN7xD5/BVXeBH373PEX9MjesT?=
 =?us-ascii?Q?Uxa0DlFXiaMITyCNRkun9jh8GKKW0F6cSlMYiAKDR0zEnGYmpn0BK7iwdT/8?=
 =?us-ascii?Q?1CeQ9nzV6waipFOqPUhoYIF8mTf4N2ylwLnqUvN5f8e8zCJ5ZssxTtvijfP/?=
 =?us-ascii?Q?jiMA1KxRP35FPohj83O5Cvkmm3W0kyFttce/INCXqRHw2ZAsb7t7tIjwTRif?=
 =?us-ascii?Q?oXgJJsLK610cfDpoI8InluumfQvSl4XFLjVMT08eAhX/YZpLLwDNvQyY29Su?=
 =?us-ascii?Q?1wroL6JMQuVT3ZhEkoB7dOlYbFQbMtYPKciwDXHgv/QPl3RjMG8QdJfl3j/j?=
 =?us-ascii?Q?qX5YV64Je52rITwAXhbmq+rTqPMWLmzpO5rmvkNdHX2YSZCEpYJoR7zq6Lwc?=
 =?us-ascii?Q?odJ2R6uwm0VBqDpLCL7414snQxJ8uen4xSymkyVFcWM/E0LctVobnHfHcy7U?=
 =?us-ascii?Q?GfcHFJ9igtap6B2Txh0R5uGXiSU4DgE7akHaY6fAGDDpK53DY5Ckzn5KS9Re?=
 =?us-ascii?Q?LmAMuuX3JMweK6Z5+Z8PPQ9LFvgknzNf7UN2C6Ql/5AjbizEyYKvkGE1WKX1?=
 =?us-ascii?Q?K1NR/n/0QcinmOJkSA6ZDM+IlAMevg2w7Kl3YqDduDuQUIWIG1KAR8nGgqj/?=
 =?us-ascii?Q?tTfu61vfME2BDKXqbD0MkvW9vviBcVu8f3UEx8g7m81CbuxI61ojIgqZchEh?=
 =?us-ascii?Q?Gvnz59XiHKV2QFgzJ9Tx3za512Nbh3mkjB2VlrW+5X76ndsAzZ/6Xh8lEONA?=
 =?us-ascii?Q?n+c8WHrTw4AY6YQ5QDDTrqWUuzgTbXPRTqoslMCVSXjDZwM9jNCNW9CB0Kiu?=
 =?us-ascii?Q?beJYa67UP34avYxKvL7Abzltwz0dD6L3uvao+K54l18gGFgKKEXGSBr/ZYeZ?=
 =?us-ascii?Q?AJkAPblRiyOY5Z0fBKs2vbdaBOsH4ymj54fqND4+Pe5WUOvECNpjkIEp5pz2?=
 =?us-ascii?Q?znSBwCXB2yBeB7VbIW/FMA3JZgJ6mmjg7tN2aEdtJF5vYOjAcXhEpHW4Tsfr?=
 =?us-ascii?Q?ymJtCBU/Sik=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8MaPSaLEwo1ExtEz17uhSZDiteEQibRjP3vKpkXnV18GLanFItVysCmbDtrs?=
 =?us-ascii?Q?1YIsStNS8yuBoUyq0Ao/d5ozqGTVaq4MGvehax5qPzc7YzUUzKQsG4JxOjs+?=
 =?us-ascii?Q?BBaVH91f4DZcoblOgifHUNvCGS1x0+BtfkzMQiE85SXtZUm3t/WDvqpnOn62?=
 =?us-ascii?Q?wN9NNLDX/qGDJPbMiSdAy/ix5FwyogCzsiXXLdFprGQGyqpKvFfxZdtZtghY?=
 =?us-ascii?Q?2H4C4mzYkRB7GHmJpv7aEEF8kB2GG85jxos9i9P1EJQviWIGO1ktl6Sh8ipy?=
 =?us-ascii?Q?ruOY2QJiky5gGjllPvipfq744gEL8H4oWPemkrSHwwuKYNQ7OW3ZrM0mw8On?=
 =?us-ascii?Q?R4ejJATSHCYcPXvw9SnTmi/lm2rZlpFetT4VLtK66FEMczBAXj0qcHnFL5K0?=
 =?us-ascii?Q?M/QdO0YiorXKpAvLxm/S5vHcKgYgPRHAtGvTprr0Vvd9Bxrk4xiCBy5qHC1n?=
 =?us-ascii?Q?tHmqdRzronBAMSMEor9iNLGO7bVALBfvHl33yoUFOOeYNDm+RAk38K6nKNDW?=
 =?us-ascii?Q?/NkTxQkafTfZgseikLSujzk8eb76+onlmE4mz/e8udLzht/jYyzYinnPAYTq?=
 =?us-ascii?Q?xns/HaBZoQmKPnxnLByF/xl91Bg6K/NdgcHUTxZdOYOcQyUj5GUGXrgfEYz8?=
 =?us-ascii?Q?hsyP1ZhM7++V91MHXw/dyvQYn7uLPnQ2eBmz6AnxyM8mVHy8w98VBE0Hxnm/?=
 =?us-ascii?Q?U+j2qXXHJ1XNoEysEFYZP1iyEPaBAqB5jNEOq72roA6biO65pGu988LvVYij?=
 =?us-ascii?Q?6gs+LYtvd5JqT2TgxEAbSDM8q+QtC0PfQW/BzXcAgDUG5IiIPeltF9AXoFga?=
 =?us-ascii?Q?MYD3C04eSND1P2GDe3XOlUygDSpArDq/tSiMJJqpuOBijJBigvfgg8FuvmZF?=
 =?us-ascii?Q?TeqjgnaPi0dxgUJeOxd3EVJ75IBzuFtaQFkBJDzcz068Vb8g/ZP+XOOP/da6?=
 =?us-ascii?Q?8HfRwmjasXfhpG3+v49Wq3kz1DZ8CJnMekw5EyfpCEiPVAT49SfG4KsijHWz?=
 =?us-ascii?Q?ay1xHCP30brEbB9185NXQHvNmmxpWFLNsmZrDHGxNfUhx2YDtUa/6h9wJNkH?=
 =?us-ascii?Q?0r6gm8B0jynITfNhk5iB+ylnp2iPh+flQRqHZB52Ghjga3JiZez1me7B4GAb?=
 =?us-ascii?Q?gFcwcFqE5XE0+9+oUfiKUrN2GunUL+JNTOxSYqQyWk5SzJdxOzG/mv1KQK/G?=
 =?us-ascii?Q?h5ajtlctSBj/Gqu0EUFlC0KcZ1vEXxN8kqxs1WIIC1IBFyxTrGZ+E9zBrEEL?=
 =?us-ascii?Q?8YZaNETgAHmU7woGK/wcoJGLvDm43rjX/HyFsnKA47B/vldro685uySgpZFI?=
 =?us-ascii?Q?0dTKsQJtsW1xWaFXnXfHZmDTt4OBZWLHJjvOmb76v8avmxXtgd3ySbLK5QeK?=
 =?us-ascii?Q?C+JNKDsD33JdKrJLNib2bct5HoaP/sVTT0nigUCRmiMJSY/OIpM9uQG7Daoy?=
 =?us-ascii?Q?xTG36WRdC2HmXsitYsg+/sfGLR5Lwjh82gybh71XjdrN+As7penH415pkx16?=
 =?us-ascii?Q?N1IZVS0uz7s60wE8ufXdtincWqiamkq1pu6qHhWBXD5ODtNDoQZUbdti2FQi?=
 =?us-ascii?Q?I4tOXKWwsTe4ENInlnh2ZThJtRpQlV7Z9gYN7bmowkPfRlr2d6CRFS1lPTWa?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef352ae-2d0b-4c16-f0c2-08dd854f2a0b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 05:48:45.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ljw7NMXMgVzpKXVGT9u+/vpWZmdpXbQgjSTF4YyX34QorqKIHi+yZjqZ9y2wfEHH3GX4FkgZ6hZ/OGcnR5Cbaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8297
X-OriginatorOrg: intel.com

hi, Arnd,

On Thu, Apr 24, 2025 at 09:59:38AM +0200, Arnd Bergmann wrote:
> On Thu, Apr 24, 2025, at 04:12, Oliver Sang wrote:
> > On Tue, Apr 22, 2025 at 12:16:33PM +0200, Arnd Bergmann wrote:
> 
> Cc:  x86 and timekeeping maintainers, see
> https://lore.kernel.org/lkml/202504211553.3ba9400-lkp@intel.com/
> for the thread so far.
> 
> >> > [ 721.016779][ C0] hardirqs last disabled at (159506): 
> >> > sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049) 
> >> > [ 721.016779][ C0] softirqs last enabled at (159174): handle_softirqs 
> >> > (kernel/softirq.c:408 kernel/softirq.c:589) 
> >> > [ 721.016779][ C0] softirqs last disabled at (159159): __do_softirq 
> >> > (kernel/softirq.c:596) 
> >> > [  721.016779][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 
> >> > 6.14.0-rc3-00037-gf388f60ca904 #1
> >> > [  721.016779][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 
> >> > 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> >> > [ 721.016779][ C0] EIP: timekeeping_notify 
> >> > (kernel/time/timekeeping.c:1522) 
> >> 
> >> Timekeeping code could be related, I see that CONFIG_X86_TSC
> >> is disabled for i486SX configurations, so even if a TSC is present
> >> in the emulated machine, it is not being used to measure time
> >> accurately.
> >> 
> >> > -CONFIG_X86_CMPXCHG64=y
> >> 
> >> This could be another issue, if there is code that relies on
> >> the cx8/cmpxchg8b feature to be used. Since this is a non-SMP
> >> kernel, this is less likely to be the cause of the problem.
> >
> > thanks a lot for all these details!
> >
> >> 
> >> Can you try what happens when you enable the two options, either
> >> by changing CONFIG_M486SX to CONFIG_M586TSC, or with a patch
> >> like the one below? Note that CONFIG_X86_CMPXCHG64 recently
> >> got renamed to CONFIG_X86_CX8, but they are the exact same thing.
> >
> > I applied your patch directly upon f388f60ca9 (change for X86_CMPXCHG64
> > instead of X86_CX8 as you metnioned), commit id is
> > c1f7ef63239411313163a7b1bff654236f48351c
> >
> ...
> > by running same tests, now it backs to the clean status like
> > fc2d5cbe541032e7 (parent of f388f60ca9)
> 
> Thanks for confirming. So a 486-targeted kernel still passes
> your tests on modern hardware if we force TSC and CX8 to
> be enabled, but the boot fails if the options are turned
> off in Kconfig (though available in emulated hardware).
> 
> To be completely sure, you could re-run the same test with
> just one of these enabled, but I'm rather sure that the TSC
> is the root cause.

just FYI. we rerun the tests. if only enable X86_TSC, the config diff is

--- /pkg/linux/i386-randconfig-r071-20250410/gcc-12/f388f60ca9041a95c9b3f157d316ed7c8f297e44/.config    2025-04-15 15:41:17.009901645 +0800
+++ /pkg/linux/i386-randconfig-r071-20250410/gcc-12/801597ddaae3bdc15546df3d0eba6e9e4e157b8d/.config    2025-04-25 14:24:49.488257697 +0800
@@ -351,6 +351,7 @@ CONFIG_X86_F00F_BUG=y
 CONFIG_X86_INVD_BUG=y
 CONFIG_X86_ALIGNMENT_16=y
 CONFIG_X86_INTEL_USERCOPY=y
+CONFIG_X86_TSC=y
 CONFIG_X86_MINIMUM_CPU_FAMILY=4
 CONFIG_IA32_FEAT_CTL=y
 CONFIG_X86_VMX_FEATURE_NAMES=y

the various issues still exists:
fc2d5cbe541032e7 f388f60ca9041a95c9b3f157d31 801597ddaae3bdc15546df3d0eb
---------------- --------------------------- ---------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |
           :496         29%         145:494         31%         153:500   last_state.booting
           :496          7%          35:494         14%          71:500   dmesg.BUG:kernel_hang_in_boot_stage
           :496          0%            :494          0%           1:500   dmesg.BUG:soft_lockup-CPU##stuck_for#s![kworker##:#]
           :496          9%          45:494          5%          25:500   dmesg.BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
           :496          0%           1:494          0%            :500   dmesg.EIP:__timer_delete_sync
           :496          1%           5:494          1%           3:500   dmesg.EIP:_raw_spin_unlock_irq
           :496          0%           2:494          0%           1:500   dmesg.EIP:_raw_spin_unlock_irqrestore
           :496          0%           1:494          0%            :500   dmesg.EIP:console_emit_next_record
           :496          0%            :494          0%           1:500   dmesg.EIP:finish_task_switch
           :496          0%           1:494          1%           4:500   dmesg.EIP:handle_softirqs
           :496          1%           3:494          1%           4:500   dmesg.EIP:lock_acquire
           :496          0%           2:494          0%           2:500   dmesg.EIP:lock_release
           :496          0%            :494          0%           1:500   dmesg.EIP:preempt_schedule_thunk
           :496          0%           1:494          0%            :500   dmesg.EIP:queue_delayed_work_on
           :496          0%            :494          0%           1:500   dmesg.EIP:rmqueue_pcplist
           :496          9%          45:494          5%          25:500   dmesg.EIP:timekeeping_notify
           :496          3%          14:494          2%           8:500   dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
           :496          0%            :494          0%           1:500   dmesg.INFO:rcu_preempt_self-detected_stall_on_CPU
           :496          6%          32:494          9%          46:500   dmesg.INFO:task_blocked_for_more_than#seconds
           :496          9%          45:494          5%          26:500   dmesg.Kernel_panic-not_syncing:softlockup:hung_tasks


if only enable X86_CMPXCHG64:

--- /pkg/linux/i386-randconfig-r071-20250410/gcc-12/f388f60ca9041a95c9b3f157d316ed7c8f297e44/.config    2025-04-15 15:41:17.009901645 +0800
+++ /pkg/linux/i386-randconfig-r071-20250410/gcc-12/dce28f73d4220df77c7fd6c41e854f1ef0af1d02/.config    2025-04-25 14:30:26.838037407 +0800
@@ -351,7 +351,8 @@ CONFIG_X86_F00F_BUG=y
 CONFIG_X86_INVD_BUG=y
 CONFIG_X86_ALIGNMENT_16=y
 CONFIG_X86_INTEL_USERCOPY=y
-CONFIG_X86_MINIMUM_CPU_FAMILY=4
+CONFIG_X86_CMPXCHG64=y
+CONFIG_X86_MINIMUM_CPU_FAMILY=5
 CONFIG_IA32_FEAT_CTL=y
 CONFIG_X86_VMX_FEATURE_NAMES=y
 CONFIG_CPU_SUP_INTEL=y
@@ -5745,6 +5746,7 @@ CONFIG_GENERIC_NET_UTILS=y
 # CONFIG_PRIME_NUMBERS is not set
 CONFIG_RATIONAL=y
 CONFIG_GENERIC_IOMAP=y
+CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
 CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
 CONFIG_ARCH_USE_SYM_ANNOTATIONS=y


various issues gone:

fc2d5cbe541032e7 f388f60ca9041a95c9b3f157d31 dce28f73d4220df77c7fd6c41e8
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


> I tried reproducing the problem locally
> with your .config on a qemu/tcg emulation running on an
> arm64 host, but this seems to run fine, including the
> rcutorture tests.
> 
> Comparing my results with your log file, I see that your
> crash happens while changing the clocksource:
> 
> Your dmesg:
> [   92.548514][    T1] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
> [  721.016745][    C0] watchdog: BUG: soft lockup - CPU#0 stuck for 626s! [swapper:1]
> 
> My dmesg:
> [    1.154511][    T1] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
> [    1.157896][    T1] clocksource: Switched to clocksource tsc-early
> 
> There are also clearly some differences between TCG and KVM in
> the handling of TSC, e.g. I get this warning from qemu itself
> for the SandyBridge CPU:
> 
> qemu-system-i386: warning: TCG doesn't support requested feature: CPUID.01H:ECX.tsc-deadline [bit 24]
> 
> I tried a few other variations, including KVM on an x86 laptop
> (using kvmclock or tsc-early clocksource), but none of them failed
> the way yours did.
> 
>       Arnd
> 

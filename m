Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D0A1A23AD
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747160093; cv=fail; b=ntFEshhiA5WdeArVoOs3/0IuI4B2FeRVAgA7DeI+x11fEyaehvZjJzkaVzewNpyoJ3rTnzf2iSS9RKSgEgQkPqnfXdTCmjvAMIrAK2c6yh7LAUHlAR/vNEwSRScQA99koXwB/IVm8KmuxmsblVdNMZSRTN2LEIa64xVUsBH+kPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747160093; c=relaxed/simple;
	bh=rwYJq8A+vXYv4KoRHOzKiZVSRJsFHHNQzJ1VT9NfBAY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s9e+oftr3isdQBUUmNl9O6dNWDL9pgxUVzauHJbqcN11MA7QYfu4C8VlywiWiWgeHoEgi0ND72kvY5H0bzIr2R2pXdeW35DuaAC1GAaKy/XEHlTZ5m0Og0ZLNpKqsWjj5/IWNZ06Y3opUBG660PKpNneOHtVhWcyU+rePxrOV8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGz0cLBu; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGz0cLBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747160091; x=1778696091;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rwYJq8A+vXYv4KoRHOzKiZVSRJsFHHNQzJ1VT9NfBAY=;
  b=JGz0cLBuDzcGT6mvzXfTI4TE69+dcGNs4GR+PqoOuifDiMM9IMgbV0/Z
   nIkuLKEkZrktD3HY+7VkeWrugl5AfWs78VsYXTIRLBwl26eHgQqr5ZwQI
   bzwzmeO1zQ5+WOgOg98977vE33nQR4Y7HTd09meHdScz7GirFPCkjahHJ
   if/pcS37NG09e8D558R0vxN07I8vu2H1dHFKAg2lnRPYw1H53KaGbZftL
   YPxUNeSUzGVmyXmsoGPFu/i2UeCJiR2ueTtYM+ZcodKOJA1+8m2q1Kz1n
   kzWuDY7/pCu2M5MZC5i/vwfJHBcaa6PrEX7up78DqBi8VZ+3VMweTAW8m
   w==;
X-CSE-ConnectionGUID: vxgcxiraRfy1dYexSV/32w==
X-CSE-MsgGUID: nsUFTeAoRAa+9Eyzp8lgUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66436685"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="66436685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:14:51 -0700
X-CSE-ConnectionGUID: wrubR1fFSMmqrTWfWaREsA==
X-CSE-MsgGUID: 5GXoWvXlTqaEhGgFNlPVAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="138714595"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:14:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 11:14:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 11:14:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 11:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wi4E4I16+oGo9xatjYlRqzi7o3J84CNvlJUNLt4XYg/fIdOiDPwqg3SJzJQV0NHrLVj65mZi06Su5H26Gq7AzJIkzZGPE3YnzyZhjuQYeHL17d11i7nT+edrlII/zHdlk4z+9ST0jr0Zp9TX1LkwoDd3mjgYqFkJqaNClveCYnrVBxRIjP5ZsxMAiHTdFFKI71xqibnATZAmEeXsihiQGzQD9bXGdrEU+SFevRJpvR2O6afGmfK39Vyth87VNl0sxXHgl5DcoGwbg7aonVYQX2xUWR72/z45TTQotQ6LfGfl+bfdPVMaj5Vcl2DULPo+kD91BAZ7xmiVV0kskqW7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2b52/i8bkvpiN47bdAFDy7IbZ12dXaWRkizpodfBWQ=;
 b=OTPTebyVCU24/ZR1vkpwAJYaxMaqnA5S3dbsJqrBbI6is8esi5EBhxpihlYKic31J5eOlZ07RtX70mzYT0RePfEMC54Gnlck1sPj0eaC8vrZfeHg+sIO3F9D42RvLMoeZeOMyTyd9p4zsm2Z1p2HJ+P0pRmVDVdJ0pjhQ21hcbeVIWkK/oB/SBQpf5hT5Bm150UVgXMTVW3hcOvi19S/96mEErPWSosp+oD+w0yTfUSIZWG7OD4B5UiCU8x13fDj5iKyYIX1fiL2Jrb31w108xJHusb/pcLSqjcMgLU7+vNXUGbwkB9Tlzdfsu/3OeP2EQGAdjuL94mBAZ+2Nsmb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7173.namprd11.prod.outlook.com (2603:10b6:208:41b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 18:14:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Tue, 13 May 2025
 18:14:45 +0000
Date: Tue, 13 May 2025 11:16:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@redhat.com>, Zi Yan <ziy@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
	<rakie.kim@sk.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <aCOMa0epFh0mOWbA@lstrano-desk.jf.intel.com>
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: MW4PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:303:6b::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f213ee-4376-4f1a-5b80-08dd924a0a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2EXk6w2FRkT4pO67yHTzVKzOdrAqZkMGXjjRdONtdkwaPCE3o+7CAl4EkOwJ?=
 =?us-ascii?Q?fq04FX+6MV36dQOuFo6Z7hv2Rboz3sBriCMH9BzdPrp6My4ugG8NDTNtPbsY?=
 =?us-ascii?Q?mq/Yy3lK+8jotVhoFVlbYBQ/i2/xGo3wmgbtppQvLZfDQVSJXzrPXWk7xW9p?=
 =?us-ascii?Q?ChPW/LpFKqd8f6CnOC47uWqfBufzbh1jtHTFcck8hbzeqkxvv9t4BYo7GXLx?=
 =?us-ascii?Q?BibJXYLVXenDWtOdBUkT2ucdrYL7+Caf9bE758XQP4KO4nj4os82FCvUEfjo?=
 =?us-ascii?Q?0C4U8O+ZcfG8QcppVr+Ky5E/mUwzfLYGVU0czmxIK+3on2FbdhGbXyQ3X7v+?=
 =?us-ascii?Q?lMxXLA0xamRxWhMPuuhEEut9eI09CMWugIm8rDM/1exAXtnIPE9z8O6tgKXR?=
 =?us-ascii?Q?6xgsK2IOjY8RJKeogZnGnE/0JJ2dgHzn8bf3Zq+tPh0uSar5+vuL32FV6Q2r?=
 =?us-ascii?Q?8rEWXU+eqLQaydmEPgGuZ6DcaM4jm5wFmU/fVeSlkwwx2l4kRyvJ5V58bClr?=
 =?us-ascii?Q?GRm/PEyl23YnBgcMamNTibnf3BSOpb4Df4qTf2zElVByMnaK4cme/YuaSEWB?=
 =?us-ascii?Q?/Ft1/SC1pYoZJAzWxE8J7YEBj2IiYFA9DAHTWa3R+A0/iKEAewUnX+kC2fpe?=
 =?us-ascii?Q?TwNTSbh8kRUFGXzHibQpCVOkGQ0dt0WjhT/TMWTpFA/pygi7m3txT0RI5ZMD?=
 =?us-ascii?Q?DNBTkcHlTp0EkF51k4Ac615ZXJjPo0jdufMRCGz9DLdBPtXuLY3UcXyESySW?=
 =?us-ascii?Q?uRBy8q59HQsdBCkVOc+DjHSHgBvj+z1Y7eDH0fU2iytCNo/Tf45VaOnZ8mVT?=
 =?us-ascii?Q?jSCwNusNzhXXEzSO4pGGDv9GgpL2Zk9PCYQJA99r3ptQyWivD0ciQEp3/XS7?=
 =?us-ascii?Q?rT8lN+KHtbSwYi1sKANahMYSgSPeCKIEWaIbG8QCaDNNlrz1YHERH5yOnyFE?=
 =?us-ascii?Q?hI1tCxOixikRNedmPdhlq7pUOpMKX+oqDKeclSYabcsZD2fPqGIPF2QNy81h?=
 =?us-ascii?Q?JV1tBfBGfas1Kxe5FYsoz5D6a6gGCxe3+5QdJpR8nQM2+c3fuNS6dxvA9aYl?=
 =?us-ascii?Q?m00ttmHB6SfUlzVUMHQj/dGErI922M+QOl8YikcYwjA/l4oZn2Y08fQK/TaP?=
 =?us-ascii?Q?uCIQJzSXNbJL9sIU4alWagq8SAx40o0Iq3ufROjg0FkkkSy7dzsTboi6i8Wt?=
 =?us-ascii?Q?WIKaQeIZpttVnKkXKY1vzE2qzfS8f18eqywLZHpQvFzB/be+PrsZOikkm2Dy?=
 =?us-ascii?Q?E74JSglz05s3w7jLP19i9Wr7UyU9AiRCIwK5Kdm3k99tyzUB/CsYpX0fDnuy?=
 =?us-ascii?Q?MB+W+I/QvBYHslKjRzX1DFRnPd6xyNC0Ed5Yf0skKen+TksfCxfiAy488oR7?=
 =?us-ascii?Q?QM9nX4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YCEfEy3UczZm3P4lBcaqcAYK57VzVVzdTp4TEpU2towayvPFxmwPNl7aZT/q?=
 =?us-ascii?Q?JHB57jfj/4NpnKu2WzAEtPgEc269jPOHslOwEpj/4qNRjFnia3M+Lw6GUeLF?=
 =?us-ascii?Q?PJToik1a0BbYv3aKRkjTxhTEsAPwc3Q9F/Q7XYSexwSYMXi8vnmY3+nEl+as?=
 =?us-ascii?Q?yBRivd+homZ9VeKeOR5EPSVJFcnzfmOTnYpzVGLhhkLYxJAmqtneYqJUYxpE?=
 =?us-ascii?Q?/ykmz+UrQ9ot6KRQKwZCvphABHMX4Vof8lQSL1HXEb2cVjcHaeMI2GzVeXIL?=
 =?us-ascii?Q?O10Sf58tyrx0LaXn8JW8uq3MreNP3FbO03Q1Kw+8Nr5Bo6bguv68EL95KXkL?=
 =?us-ascii?Q?4hstlDpngvZFk/V5LsBh00/UdZ+9Ee/zOpVprsKp4PfqZGryYoeuVX76IBH0?=
 =?us-ascii?Q?oBwy0sanBPkda+q/grxu7niIE+UhEOnMQ8P1R45pWOdtHk8BisY2N7zRqTIB?=
 =?us-ascii?Q?2TaEGfZ3QzO0l40U0VVDUBwOdzkchY00GErwEVpJVandTapA/8FAJp3oofxY?=
 =?us-ascii?Q?ESmDTj85zfO1HXTlDey+pCcvxA080Aj7dBztPHeyd+n+x7HfGRGWAKBPw3Nm?=
 =?us-ascii?Q?ktRxpccfWzWWtSoF26msVBXvfkB6UgkFw2wNTHyzNipJr3gIBFoVdmbiHuPI?=
 =?us-ascii?Q?0zY+c+qyNRpz/MBWKYDOSOLuLfQET2wGlofkZBRprBT4DiA0LpkYAZuNa54u?=
 =?us-ascii?Q?NjK9QLJggaZBKOAvKnp3OZJes6fiKy4Se0OQZWbTjNq9w22n1o8m7CmnulIn?=
 =?us-ascii?Q?RtvT62wjyXxKdaPHn3vwAbKdGXyaG/M26W/RnH9QnIPzC8l8/ddPAP7R2FNh?=
 =?us-ascii?Q?XmSey4Ld76R5TyS6zxZPFok3gQ6kPEOSqEk8snECZeyOY1NeQxc65WlpK7wY?=
 =?us-ascii?Q?TGI4SYuSd3VvyXHzNfKPNXOc2fiM0So+UbLet1cfecso+UCksdgrND7ZjUDd?=
 =?us-ascii?Q?2TLC+XWv40bBWUBtQtZekHEAtJ46yz7B8lifYL6gCdR8eoWxzOPGpCcuR1VJ?=
 =?us-ascii?Q?aG2s/ikKqNH2D6RX0O7Xjem/Yp9qM4GrB6D6k8sVU/BGSA+eWh72vQv/1yzG?=
 =?us-ascii?Q?2MabQEfcvyaRImm28ulnCuCcoUQ4JrQc81rDB60kgFMHQfU/zweaN56WZc5m?=
 =?us-ascii?Q?mGxRQav3EpIbyxuMUo8++YypkGl4noy6AvPRBl3+8vLr3yK50rB8YEHt3L0J?=
 =?us-ascii?Q?ZnvG0OQmXrM7nZG/yGtZh1GtB2EghmNtagY5OJLlQKVS6j04u8d+pMDF5zhQ?=
 =?us-ascii?Q?3YYyYkGjvSrKyFGeLpAUJ/nuk85FKucPU6ChksGMxE/FfwJxfjrNw1YtckCK?=
 =?us-ascii?Q?ipquVJhabYYJkYwGPBQWjlaXBICHYYxcDuOKV6S09MH73FQaS9Qa1fqlslQg?=
 =?us-ascii?Q?dhgYeQ1aByJLcq5BLnNSEltd5p0egJe6KQxr26LCRsJiMv6xv8FJ+ksvNEQM?=
 =?us-ascii?Q?RkAjN/ebyjNpiD6i43hZ+lH37+icEfSEzgQhNqKt1c+ydIcQLSxkvhj3sU2W?=
 =?us-ascii?Q?3ielAqKf82Io1KjoZRbkDNUyf2ONh9sPHcQqrdWZ6MuMMAelNiQff6mkYoqv?=
 =?us-ascii?Q?j+yv0B64/JcgdHj/ONJbaMMvP4BZBGNQo/s4SpBNT7s2synr/t643B0ldpSO?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f213ee-4376-4f1a-5b80-08dd924a0a10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 18:14:45.2221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgkXcDqjHUeJ1EiSwyUXCCj4Cyu2iqA/P+NaTF9ck2zrmBzbugNxGhyDo8znli4ufi1Rj/3Va4zahzJP0xn9mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7173
X-OriginatorOrg: intel.com

On Tue, May 13, 2025 at 05:00:07PM +0100, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> 
> REVIEWERS NOTES:
> 
> I took a look through git blame, past commits, etc. and came up with what
> seems to be a reasonable list of people here, if you don't feel you ought
> to be here, or if you feel anybody is missing (including yourself!) let me
> know :)
> 
> David has kindly already agreed to be co-maintainer for this section.
> 
>  MAINTAINERS | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 80aa09f2e735..29d73593038c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
> 
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Alistair Popple <apopple@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/mempolicy.h
> +F:	include/linux/migrate.h
> +F:	mm/mempolicy.c
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
> +
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0

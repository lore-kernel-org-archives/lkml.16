Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67068186A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748582190; cv=fail; b=WixOV7yxSn3znQqNmJwviEU2Sz0WFWtYYDYGSN3e+CtH5k2xRBvVQIKz99VqlyUII3fkMVSqCG5oRZBMR37QIyZZRMwqmIYUcfQZgHSQrfTDAoqHgIvaxdd0uTEMsDXZGavZVakG+2gvdcp06/dw4Z5ISzE75U0ZVIk0imWlYsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748582190; c=relaxed/simple;
	bh=HsG07lGfjgljNXpz18sD7x0Ov+/EYWBnsNXFq0RvsIk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SR978ReY9uUvYJPgJimFzE7doJl2b5KjwV9mieA4kxy3ZLUITEFPXx1qCj3Vw4DnSzWV66cIcIFUnkdIkTmkRdOP90qECaGPBZ6hukgUjf8Z1PBAK9XDiDWUd+MbUdK9BRHQMXOyo1qLz8DpglQZI4dN8IEPKTXvTA8jHhIG638=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRBqL3W/; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRBqL3W/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748582188; x=1780118188;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HsG07lGfjgljNXpz18sD7x0Ov+/EYWBnsNXFq0RvsIk=;
  b=jRBqL3W/39pRgYicGOMPq5a40putiIH7f54dkXvWf71BzHvie+wYTjQh
   ZyukY+7NTDOBVjTBieL2p/mu/AkGpTIoKeGdTcPKEXi5Kkq3TDqUfn9Mc
   MqemCbHaEsztUx3NGGWL6TnjfGh6U8gEeJlStPLiaiDu6bGHA6dS+5RXl
   EFb1YhQgtvvZmCeWvf2GH5c5g2TFAsCrRTsHTcMljrbbtQJW11zZeNn3R
   DfLf60+/epEngQTJggCtGs+GntdkVcqysf7ZcsFYSlqB6rz/DWcJbBFoy
   QC7ZkGZKszPEVflYEj9yDZhM2/pebauLlh5xDosdB41/hgZdBgnQ9DImv
   w==;
X-CSE-ConnectionGUID: 7AveEh8xSPS/Ub4M2mzV2w==
X-CSE-MsgGUID: fph4pRQoSZmYYVV0ShOZjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="60925520"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="60925520"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 22:16:27 -0700
X-CSE-ConnectionGUID: r1iwzg7JQsWOLP32T37cew==
X-CSE-MsgGUID: vFWuCAkDR66OG44vmLdrgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="143741884"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 22:16:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 22:16:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 22:16:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.84)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 22:16:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNIgbb9paBpFTzj5S5ByD/u83i4wtOB//QS+YmkcPjbVBhEWnszXGZIPhQFxOaD4ZU8QEqj2joy5DBhBQMF+vaRD++5AhIJaSYbU3hM59Q4ORn43KfkAcMiBcY/XjSiHQCaSRgPJGYFZdTFxVTIypFRJZLRpGYSYBsm6fHIbWBUk/EgJ3fEV/agmgeUQ27VmSwtgq+SavNza7U3YyO2xy8ut8vPnOHd7aHF3tOjCBF5hki+mVL6qwNCx3nPI6kTKvHOX+F0abflqQHsHtqWWIUvL1bbhT5jma8l1jsEdHw85+wIvkpvg74HcBHTbV9urDUCaxTzkiwjlL7T167G6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tulmXgdkVst3g61Lciqcf5WRjE0SQswxGtLoLs5Ta1Q=;
 b=cY1KKxZbnhZ7H2QTg1PaAc9n7KAScLL1HtUv1mym+uL1rWUISVfcDpV7O7r6jUYcFw/i32RuxT8LKeXhY69tRsIqGzILX/WKgydgVFTnreVJB15ssPGU98+2NJEfuK8IUkFyN+yEKNrqeyXFeq5gzKEHXmHqA1zKd06g/oKPDyoHvm1lam/NcDioumioPJSGUaJob7V6+dIPdbIUaxBELFmJGeE2QVasOCuNChXsb3elA3rB7ZDL0mHVmTVesjpljo6/j0I83R+l85RKgiYWP9Re3Znz5CdF2JJ3t8uHgT/QcQpNKxM6e5eNzVj4WxLHdCOtK3auEa7r6aihmwAUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4520.namprd11.prod.outlook.com (2603:10b6:208:265::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 05:15:43 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 05:15:43 +0000
Date: Fri, 30 May 2025 13:15:32 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Pedro Falcato <pfalcato@suse.de>
CC: <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
	<vbabka@suse.cz>, Jann Horn <jannh@google.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <philip.li@intel.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH] tools/testing/vma: add missing function stub
Message-ID: <aDk+9IlV+gHc5jRL@xsang-OptiPlex-9020>
References: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
 <upfmiz7u2t4tzd6oogqm52mmgecepv7ecojgysmosgcu6ggov4@hgqlp3x27754>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <upfmiz7u2t4tzd6oogqm52mmgecepv7ecojgysmosgcu6ggov4@hgqlp3x27754>
X-ClientProxiedBy: SY5P282CA0047.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:20a::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4520:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf7b71d-bd9c-4645-34f8-08dd9f3906d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lcKshQbSMmYwRGslGu60IN615q5kOnCbhJH7ZXB6PLQNnvY+8zrID/zJzR+A?=
 =?us-ascii?Q?/pHj+C0HY5eNYuETZ2RezMwV7tQttpwXMW3X3QHuJgfiYIJT2Hu4JX79+v2Z?=
 =?us-ascii?Q?iJnG4//24mIRuKd5mdhiQKDfkYNKzM9Xebsn/4Vhvm4FgJk2BSCUY2y1vHoI?=
 =?us-ascii?Q?hZJw8aBV5oMEj7A3toF0F+BcO0auHhpU1/MBGvxhGXuhvAvQ4IVoaws9KZFd?=
 =?us-ascii?Q?WR8grkhOXaksOt4vKDKR12A9C1a1FuuBIBoqMJQie1IipLOOTfkqgqqK4vNU?=
 =?us-ascii?Q?mU9Lkv76hkZebpGyJvfgf/tOiqNmqjsNgb+zTGIcmU+r2uyQUUrnz4O7+vs8?=
 =?us-ascii?Q?M8lH63Kmwk2Oaf45lhLZKT3ENgpkg4bWE7OVj6vU6zBAxPEWtZyLHYbmDW93?=
 =?us-ascii?Q?gpPawiRnNpE/tvgCxsZPoJiMSkBWk64CPeV9zJSAWKCjmB4P+2a5ZJdwQFR9?=
 =?us-ascii?Q?knukflaFN3Kl7Y0Ygc4rhPGnucpfgQ5t+Ek8TertiZsA7xBpJl8PnP0yPsFH?=
 =?us-ascii?Q?yWeAgcrO5tfz5v3lTdb+mLoANRTma5ZpOj188q9HlpCrbVXfiVyt3unOLgsN?=
 =?us-ascii?Q?p8WeG2sJj8ApTZObkWwRNmdQ+YA7RYf+Cqpqg5AK8aqJaGxj5MWpUChpd8pp?=
 =?us-ascii?Q?egDQVXNN2DBNrBdqLMoNgSODDbQ7nJtCp5LXkorG38QDNrSAdsqStCm7F0pA?=
 =?us-ascii?Q?Ko0WCLaQkxilnbwZihIgFhZFJsAhc2s8xsAPY7kQwSNGEo3a/pHCYFMR9a0v?=
 =?us-ascii?Q?lF4LiwdI8C/6aFnIxGbd4/0zHryD0Dg5nFFLHzTdGHYiNGVIGRCNQDJs9HwS?=
 =?us-ascii?Q?GwwpesbeeW1izTHBMFz73mj/iAe5JXioWPxpmWK9Ek9N/GRl4lhijzMccdnx?=
 =?us-ascii?Q?P1RcumsAOinCaQdKmW9NTb9MD6UVYVcxC3oST4lUHMnBFg28f2t5O8VrS6++?=
 =?us-ascii?Q?OaadNGl6kdtm9w90tBHGX5i5tIdYv/1gJdMnHkARgFEAwNW09LwOhBZ84Rkj?=
 =?us-ascii?Q?8a8q8a9nMKC0FGtniJuLxfQMIcv0v4oWXmTdLdvgfz3qOphAj1NJbuPfkhZK?=
 =?us-ascii?Q?GFksXAkmbNMIcnDpyr1sEQteCZoPOnb/89KYxa4jb5ggUk2rY2084HZx9+r0?=
 =?us-ascii?Q?/+x8dU2GJc2RpIBXg+SUQZV/HpjS2112UJjNPgjHujdm4deEOVfWoPhTZTdK?=
 =?us-ascii?Q?dDkz+jhaRhEfz33xNldvRrgy2FdQNW+NA6lDNIF8NR00rYKp2IR8B3KIAHpo?=
 =?us-ascii?Q?1ovJx2QASK32HWaHWVwjbI9BvHQoFsgXc+fUdOEL72BMtlt1BGAgh4KutkU1?=
 =?us-ascii?Q?NpmEqqh7ydGfBbBkDqed/vEx3yjTEGce7g4w9ajo7GVksBvWE1qHH3OWwKQg?=
 =?us-ascii?Q?gjByE1B6jUzfVIVLYeL/dfrqHcDbkcDBy5myYWeBl7w2ORe9wnfSiA+eVjjL?=
 =?us-ascii?Q?L4/tQSRXSjA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uvbGUplG5LQ5ICR/t85OwoL6WcjQlGLKj+thQtlabhgk+VYl2IVDef2rFFRv?=
 =?us-ascii?Q?ZlcxpJMmRjBMXYXbOff9IsxFMXEc6dy1J5m8A12fLCyMa7cEkXMvf3UVHKt5?=
 =?us-ascii?Q?eSNYY0Q9QJDHwe08RrF5H1GrBPLdsZABOA33bUJgQay2TGoC98OYG24hac6M?=
 =?us-ascii?Q?jrgZGklHis/RCBQxLu13pH1OFQceBOKvZ3KM11AWOjH3gfvsqFR4zcsFRKfv?=
 =?us-ascii?Q?V4+tjzCSa3dljzTgut6H2vpaLjxkb3+Dsp5u11Ju+wOZ6q8uT5uFRl/9sMn5?=
 =?us-ascii?Q?nk0QKJeG4MM0wG49Lrndqm0CJ5TVjQ+9Gx8ySUEIOlNSLvjdEsWam1nbSOHX?=
 =?us-ascii?Q?lgl0iPWL+YOMtdYik4rhta93m46S8yvF6d+WLMjfiX9xyJP+a0bHGjbkyfDR?=
 =?us-ascii?Q?aAL0DX2sDR6OWShaTUIe5zGM6XtEwqnX8PvT/RBpIOmuJE931ubMCeUlhuRr?=
 =?us-ascii?Q?I8bNGz5HWPlZcKCF/QUCmvbHs0UPZIH85xbfPaNqR3iSNu+7JX/qSx6f5yP6?=
 =?us-ascii?Q?vX1LL3roGIyPhMvu5z0uL4NNU/Ij0QAubxjEVnIbJEsmjbExv0h248nFla6h?=
 =?us-ascii?Q?39t5o45jfjirz9EGM9yyigvPCjxSj8H12ku1Q9H7O1cXhTx3/SxurJ4pfwy3?=
 =?us-ascii?Q?qika/O3xOpWji0m5ekYFnrBqiw+T5emAkCuPDOThdmtQwHDB2tmqK+w+Ka/p?=
 =?us-ascii?Q?eX2ApnCiEK5NR6f9R4eQm1HbtgUT8Qltx4hTJZr8zRAh7mESD9o6CORPLq9x?=
 =?us-ascii?Q?5p3wC/netJMCZtN28YFam1oKm7RLsN24g1VhTdMZd0W7z5cEcPGp3AJ0L9XC?=
 =?us-ascii?Q?XgkHq8ldvpcp6fyEWY9iIoD1FnietxH7/cFIqGZuwKmmlZINIPUMx/0cEEIQ?=
 =?us-ascii?Q?20u0sMIs0cU1l4Jm74qcauNzZcbjMqPvs6ZvFGxJlJ26rnbBcEhqtbvd667P?=
 =?us-ascii?Q?NjwIZZA1AV6KEcIewL3rjq8U5CdFN1CPkFNuTh5qDozPblk3aBMTf/XOf+ai?=
 =?us-ascii?Q?kw9Ojtcz3WJVoGEgolbE+rJkG2+qQLs6LNy1f/wqsO7bq8pgcupDHLFz7Df1?=
 =?us-ascii?Q?PjaySilFWN0i//QUOEqJl/fXuLgFBtvfiJDRH4uQoWK8TIyHXZIAGlD7c8qj?=
 =?us-ascii?Q?ohv5FpqSSV8f4MVpWc0adf0FBPkRL5eZuMcTxaZhFqova1BkMsuuNoSjT/TU?=
 =?us-ascii?Q?/rScq+LIUT38EE7TKp7+v82uC4BRRbnWaKs08XcShVCQ5LmmDxT66g05VSdD?=
 =?us-ascii?Q?8mfJ8g679PZaJv0Rjt2R+zkCPAh31FUN5E6W3QaqTG5wZuDuAbJiwPaJ/Fy1?=
 =?us-ascii?Q?qJOe6QZCXzqwFP88dWZKTDf5mxeGf9mHx93hoAKFh1/0g9brm5sT/jKf+9Yd?=
 =?us-ascii?Q?5NruR6vqHfU+FtqCXZEfYkNC3UDMrz70VCB9VuZf0vNKMn0Rl85N/t8rhkJk?=
 =?us-ascii?Q?ePhOepTDsmL7ModCh/j6JCa6oAsNbJAzVC8iHhzV6mQjz4zd8edNhvNn4e4+?=
 =?us-ascii?Q?O5f4MCxt5fWFDTGqW4FpDp0k2EV3xKW/ELJ6YTIrFVMGoOWK6Iy+ObZ0pltu?=
 =?us-ascii?Q?dE8Rw1a8u2GHTo4Yx1Y3VQWCxCNmuPuCxN6s8mKW3T2+54HAdTvzcBz7n3eR?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf7b71d-bd9c-4645-34f8-08dd9f3906d8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 05:15:43.4392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHtl64/2I3BxWOM2qcyl+E9kfCt/GMW9WF9yVGBPOoFVKxEpXnnlScevPe7sdsS0fC02pTT6CUF2Rq62PjBaTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4520
X-OriginatorOrg: intel.com

hi, Pedro,

On Thu, May 29, 2025 at 09:39:11AM +0100, Pedro Falcato wrote:
> On Wed, May 28, 2025 at 03:15:39PM +0100, Lorenzo Stoakes via B4 Relay wrote:
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > 
> > The hugetlb fix introduced in commit ee40c9920ac2 ("mm: fix copy_vma()
> > error handling for hugetlb mappings") mistakenly did not provide a stub for
> > the VMA userland testing, which results in a compile error when trying to
> > build this.
> > 
> > Provide this stub to resolve the issue.
> > 
> > ---
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> 
> I wonder if we could get the test bots to also build and run the userspace tests?
> It would help finding this before getting merged, while also actively testing
> vmas, xarray, maple, etc.

enabling other test suites under tools/testing besides selftests is in our plan.
unfortunately, we are still seeking resource to do it now.

> 
> +Cc Oliver
> 
> -- 
> Pedro

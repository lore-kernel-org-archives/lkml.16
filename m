Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350F2940D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744511080; cv=fail; b=j+wGX75z+9IQyzP3Cg7QIzguUYuIILZ7C1albsqvws7tFm2qCIvdFl/zUFVuQbuXfiLmLQR6KKUWGFsEryvyrC2I6xzCJ7RnoVCJiI11yLHXTFdz6BAKgwA4DL14TSqLwM/e/i9B41WM0B5EDNCYN5+BEBFDt7PDRLntuTSbVU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744511080; c=relaxed/simple;
	bh=0KWwHoRnLT/+3NCOGSWxbLZwvWuXPIOLHh++9GebIi4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jcvNb8wQlnGh0ODakVbApM0kwwCJnrmIv1Ol9z9FaUJImg8sVUia9VpsfwRBRTyvgQWsS1P2INbdes4YVwqDG1xYvyZoKJz7uMEQt7mG3r4QVvdMhgiEDRwuajXdE4GQo7VMcHPIvcaYLflEP43Rqb0o5Ge8UpB1b9/i164QtYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6pwKUZr; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6pwKUZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744511079; x=1776047079;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0KWwHoRnLT/+3NCOGSWxbLZwvWuXPIOLHh++9GebIi4=;
  b=a6pwKUZrgNFL5UkHiEtRKbm3StgJo3N3yRd/OpgF+FtTwNE2GLqAAu+d
   oxr1WSph5M3o2bLVyCyAAyzR+dR5IrIFR5oLFPM23wtlqabhho8W0Ua/k
   DNvogoVj4xogPf8XPjLT1rXWn8S4yu3DvsAnmBkg2wXUEjZa0VhyTva5B
   +zfmqVVh8SSVmGigofjbC6ujl9twvYV8EtQBZA5yn4en/cDBg1dvUe5yb
   RXDSN30PR9WCP+4hjWRvFKX+wExb1htwEfbvIfKYotcfgxiLjyzdgMODb
   cvkQnCnyJrGnr3gwmdqbTq6ulm3vHVVvqaOS89qozOexF3Ta53eGr1Q5/
   w==;
X-CSE-ConnectionGUID: SuBk5OSDTx+TMJByShWzuw==
X-CSE-MsgGUID: kj9e5RN7TYaVWp5QHU6vmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56680379"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="56680379"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 19:24:38 -0700
X-CSE-ConnectionGUID: AzJ4DpVGSnyDUwOzeBHcFQ==
X-CSE-MsgGUID: giMk6ux8SgiVgEIPptIdeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="129850713"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 19:24:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 12 Apr 2025 19:24:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 12 Apr 2025 19:24:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 12 Apr 2025 19:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/O2IlA+SvLJDg+GDc53BJXR+P0n6K1xKPCAHaIH4X9kXmN7Y/I5TCUIsP25RIWGO1Y1RWY9chgdPGGs2l0QZvtywa/JsROkWd4MBvr9PXpCROeEuXmHbYqOz+bXpH/jUUvR2yUPJZioOFsrykFGGMABWIj0D4+TLyLonnYUo0eDvO1pLCWiSPsxPze8zLkFOqXTHk+jYdRGEJRsRDP2gG5w35r9B6UOAafp+ZXjHeVZpeJowQm7k6ksMI6oWVybiZNGXD06iCONp6GYSYPHBnYsALOuBdvW1r0L0zqbLnYzwr/bfUx2IBACSTD0GaxVT66r5GNx9x8c6uRbdiXT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OANLS7Cqkiunfp1zaoa8PW41+awzm0JMZ/8QxaxBvGI=;
 b=TGfeATmTUwfusNU/wJ68+MCzzsH3I9sOkWXMxtqIW0EBZQcma/ikN3D79+l8v+LUE0LBc35eHOJYwlCexW64aTqNBW2QCwG9gdAx4Fy5dktm4AAJe5ac4g8cSYfoAwSaGDkDVemqnLzcm9fdfqpwgsyzHSNqFA37VLSx3zjYGWD/NtpRO6Vpz568gWpo+PqfG78dYXMSs8dM16lw3x/ylrKIY3RNWTnkMKn3caABldb92w0yKPzmRzJsjZWav2/2HeMU3M3OQY0J96mQdf51iD780M5iBv3L45VjCYPkSqFmrfkYsQ4wGZocguyUfbqcnCqZZiBx0fJlQTsH+G4Y7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SJ2PR11MB7545.namprd11.prod.outlook.com (2603:10b6:a03:4cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Sun, 13 Apr
 2025 02:23:52 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8632.030; Sun, 13 Apr 2025
 02:23:51 +0000
Date: Sun, 13 Apr 2025 10:23:43 +0800
From: Philip Li <philip.li@intel.com>
To: Ingo Molnar <mingo@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: kernel/sched/syscalls.c:979:8: error: unexpected token, expected
 comma
Message-ID: <Z/sgL9Rt9c8ZGhxj@rli9-mobl>
References: <202504082254.7GLSWAbI-lkp@intel.com>
 <Z_drmjgelvOokDRl@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z_drmjgelvOokDRl@gmail.com>
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SJ2PR11MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: f44de0d6-fc35-4d49-b290-08dd7a323b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GAT3Ij00p7/ZXV45QqXbDfgzxvr8fMykIIvnbUhecgNN+JrBS0hb3ZgZobh9?=
 =?us-ascii?Q?f64gBS85JVk/8WDlYALMouen2d50O/F0P9VcSy4nJcyAoM0xTEsIRbjBsFQj?=
 =?us-ascii?Q?1XNCHwkaskqBNodAJC8vv2lGIbqmZF3GQVIBozvAf6WZVV7MxZd7eNdFOCB/?=
 =?us-ascii?Q?He7pCEFvk6H9c938y1N+DW137VfAIJ8eaL3r6NxPD1RRfIcw5UKpvrwgSI7Q?=
 =?us-ascii?Q?xfy41jOZpG5WXYWA3b1f0cEl/LDqOoKURqhC4oOcGKj44urkCwI7/Kv5BXUF?=
 =?us-ascii?Q?iuvhZp1WHoHrnMG2gFla5eLL16oRtSaWWzp+SfTiHE6criWxmZ5jYxJ6arjd?=
 =?us-ascii?Q?GE6qd51CzVQXLEWYgFzh74n2w+9MOvcWhRsMXByFQniOVXYxPvHQtjxn5rWH?=
 =?us-ascii?Q?gEMFvgFS9RQ87lO7bn0s3nyxprWUF8R5N1XuV1QEDE/l+G7OvTDxTJjXekMe?=
 =?us-ascii?Q?F8CkqLlhz+R0JTnQTIM5izlaYlbadi9f/VJnY5OkKtqRreZ4IwAt2o0Dm/3Z?=
 =?us-ascii?Q?e0unplfytv1CosD/YVFk9D3jrbBqh7OYWE3OVg7sqoXhhDlM1Tt4WX/IBxIR?=
 =?us-ascii?Q?kzfKpdv2y9FYNSsV56VnDvtJ/3YibgfU7Po25Qy3Pk4WB9wjK5gEhx7Y+Z34?=
 =?us-ascii?Q?QMYYS76wBxXzkvoQ2jKx7Te2prHN3VJoNNmAHKkLNJHAXNKanOEWWLDAw/xO?=
 =?us-ascii?Q?BIK96cxuBES8Y2wrnzcVlaJseoKYQHKYDPR/T9hpxvfDSupkYKaS6Eacb7Ir?=
 =?us-ascii?Q?L0StACPZ137ceETVYAm88FY2xLUDaG9KfvYBjtTjmdc/l28tRgm7qIm8Wcfn?=
 =?us-ascii?Q?E4doApnEpUMFB8PE0z6hV3yxrr0eNQH5Nt54NARXGmT/wg10EHxLDFnjA8D4?=
 =?us-ascii?Q?k7b8hKlgNOjugA9x2RZw1gsJFYgs0Fg4mYMXYDDEqwGerbcTCNAuuD92BKjl?=
 =?us-ascii?Q?GUB2ZumyHz8CxgGtNq7IGtuNC50TSKOZ4OtGt9JxlrjN0pXZyQbl5QNQCh5w?=
 =?us-ascii?Q?+Lye/+780pl3AJNS1ZemqJILrs0lOZIr6olsJOX7SG4nVLfWkMJcJQq8t6vg?=
 =?us-ascii?Q?d8nPzoRnpZlgUFIs5hzRMW5auHvA8Ba8bYTjOH8r5QtSgO4Rn9NvZBzrC9Si?=
 =?us-ascii?Q?IdBwwOTq5xhoZgv1sFFJ/oS3s7fNNBzihiUldXG0dlEv0nynuNoUljYfzdAR?=
 =?us-ascii?Q?sbYsabV6pSDJpu0tpM/YxBEzQEMh4qWveZTOEpQO1vAGertiRpm07BJ4xDp2?=
 =?us-ascii?Q?fUmPznVb58VkdaAAMhve8UogFDiHkP9fKmjcWSneVUbZ6Y/e/BfaV+/y+Z8k?=
 =?us-ascii?Q?sRmkeH1s6cppVYiXaYhb6KH7IdC3oBDegCj/19ncShX+wb3rdRu2/viryqcH?=
 =?us-ascii?Q?H5Twzq7UMJUbz4yAy0sTBglx+6sW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4qB4p0ZHzs+fw5ndVb/K2kQq5nk/1zors9SSnu9oCWqOwogCyOBvS3wRNKNF?=
 =?us-ascii?Q?i1/Z/02vC/7GQR3wcd8bdlAVAEJOXE3kP5Lu0HS6/f3jFYb4zbZayHiXV4c4?=
 =?us-ascii?Q?JbbTixq8o5qy37ksGTWlOf7YzNq8CTfRhDslmCH3mkM4aoZ3vOAmTCNf8UiY?=
 =?us-ascii?Q?+ljPs/3fYQLfaSaHNXGIq67/9Hm4AfF+cnj2F7wu1pisvHexzHv5Sps9HzzY?=
 =?us-ascii?Q?j3v60qaIgG7qX5lJjnQCBUUiFWSGKmUJRh842m9Z581o5J7uHFeQgE7SXUz7?=
 =?us-ascii?Q?oEKNst0KIpnazmhmo3IL3780GJi7Uwi+SYwsM6CFfaFNZCqwPaGzSGDd+9Jd?=
 =?us-ascii?Q?8Sh6rsGMBEBucnwZFM9bPtQVxrsG00yG+tjxpCM5EKK+QwFSPFDt5Dc/F9Uh?=
 =?us-ascii?Q?C3JX5i4bagFgTCPnr244PEycuFshP2BGBDUbhyAaoDP96yE2UQOO4WioeVmP?=
 =?us-ascii?Q?5I1DBZ//thAdOZFZ1MbEjJtlqlseGnugMkRJ3AE58sgp0GfjnicPJ+rUHV5/?=
 =?us-ascii?Q?cjhsrH7pMG61bOm+SyopHztixkV+nKaZpBpDANpPLqT3o3wapbxQ8LFftwBW?=
 =?us-ascii?Q?ujjfZVDgN7k1rTwpPdjhInWtHLWmyw1bS1LzvfwrlWx24zweut/+C3asmPNo?=
 =?us-ascii?Q?qLMh6h0ePUsR1NPrtqHj+pEeKo9U+0M7euWqJZPSCciuywRbzmUF4X41l8gu?=
 =?us-ascii?Q?FuvKm5+lq/R6N8GFoJ3sTFGf01VrlB2EVUh3ZUaIXampoC3yNGsaqgXvs6LV?=
 =?us-ascii?Q?aX0ZzqoHYHlM1f29F3LtVM+Y1Jtx9bhBf0bvWtTHWKhwD1E4Wc+/a85XFqQx?=
 =?us-ascii?Q?7iECkG/1Leo5/9+JCOD+OU7LqM53LuGgVzxTFWQlgof7JOh9MHmUA2c2/f0o?=
 =?us-ascii?Q?fkeqmgjj8sxhH43F72j5U7baYZq7qOr7cVKQnq5qA4twEt3UWhxDHpjkZXtT?=
 =?us-ascii?Q?V6AAgTornbdUinGLm+EtHKNir5wAsyXVyaet9HkEqhq28i5F3TukGkQL/rXw?=
 =?us-ascii?Q?qVPTlflRW2IYFxJrsldvJF5qeTGV4Uykie6riW94LiBZapJAHzZyr41ZW57s?=
 =?us-ascii?Q?RyqX4YGFT3kHezEB7j1udWebObxZvFyr+ua1AuvJnBvQ/2TMhdV5fqshg5Qs?=
 =?us-ascii?Q?sLyBOiBWZc/mUoSbxqCI4eBAM9hL2ijvASiG2Ae4kYW2oCNbqxz4A2FdI4h5?=
 =?us-ascii?Q?lsvzMO+T5RFIFt7Vcw4rkSyl47R9ysTOr+oa+hNVnj8LSzyfT3BJ2LkWEk75?=
 =?us-ascii?Q?YJTgkmIs2iGu1KOP8ux6KWsxRPTJcSdUq2uPI3/nzRq5bjrQ+lnA5AZplVoY?=
 =?us-ascii?Q?+A6e+mWdpRgm4A1cbuwYg8lDY2bG5FImg8RlY9Y6EB3ZfUeUnXjvXEvmPFE1?=
 =?us-ascii?Q?oVguhkCaAIX2zvz6SoEHcTFCqZoTjSPEzoH0MnSiHrRpCvLZsou6KVaUyNVO?=
 =?us-ascii?Q?P/d+gwEb/dbN5tAi0/IQOzLdHgQz/omtQk6vO/7Dzm7ZS6tcd2KA+mPmo6jU?=
 =?us-ascii?Q?p9rvadw9l+AiTUBqRNjv++a7FRrRvIejr6JpRjoOkNbVAXOzqiD6/ytzl/RA?=
 =?us-ascii?Q?jDfsB53xSu8/1qpw0PdoESfimUznYJ79kGiOcIlO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f44de0d6-fc35-4d49-b290-08dd7a323b14
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2025 02:23:51.7469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYrvxBXzNmxeJSyCxsDdhygFndqs7xR/dZrajAKX+3dTMy+oMLEQTT+SoOYPxrZU+3ZfW080gcBQ4tofc22VeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7545
X-OriginatorOrg: intel.com

+ llvm mailing list to consult

On Thu, Apr 10, 2025 at 08:56:26AM +0200, Ingo Molnar wrote:
> 
> * kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Ingo,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   0af2f6be1b4281385b618cb86ad946eded089ac8
> > commit: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out kernel/sched/syscalls.c from kernel/sched/core.c
> > date:   11 months ago
> > config: mips-randconfig-r064-20250408 (https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/reproduce)
> 
> I cannot reproduce this.

Hi Ingo, looks this problem is clang + mips specific, and it can be traced back to
early days like [1] [2] on different commits/files

	>> lib/usercopy_kunit.c:205:2: error: unexpected token, expected comma
	>> net/mctp/af_mctp.c:259:6: error: invalid operand for instruction

I add llvm mailing list to consult for this behavior, and it's possible the bot
environment is not correctly setup for this case.

BTW: the reproduce step should be below after saving the config (the steps in report is not correct)

$ mkdir build_dir && cp config build_dir/.config
$ COMPILER_INSTALL_PATH=~/temp/cross-compiler COMPILER=clang-20 ~/temp/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=mips olddefconfig
$ COMPILER_INSTALL_PATH=~/temp/cross-compiler COMPILER=clang-20 ~/temp/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/ fs/ kernel/

[1] https://lore.kernel.org/oe-kbuild-all/202201200842.QCcshg1P-lkp@intel.com/
[2] https://lore.kernel.org/oe-kbuild-all/202408200858.vCxqGpji-lkp@intel.com/

> 
> To test it, I did:
> 
>   $ wget 'https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/config'
>   $ /bin/cp config .config
>   $ make -j102 CROSS_COMPILE=/home/mingo/gcc/cross/bin/mips64-linux- ARCH=mips kernel/sched/
> 
>   CALL    scripts/checksyscalls.sh
>   CC      kernel/sched/core.o
>   CC      kernel/sched/fair.o
>   CC      kernel/sched/build_policy.o
>   CC      kernel/sched/build_utility.o
>   AR      kernel/sched/built-in.a
> 
> Note that the config was *very* old AFAICS, from v6.10 or so, and I 
> accepted all the default .config suggestions.
> 
> Compiler used is:
> 
>   # CONFIG_CC_VERSION_TEXT="mips64-linux-gcc (GCC) 9.3.1 20200601"
> 
> Thanks,
> 
> 	Ingo
> 

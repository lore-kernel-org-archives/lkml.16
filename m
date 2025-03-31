Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AC71D54F7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424285; cv=fail; b=bZ+PDknS791CJ4pF0p132ufGQsmNIniNZm11B9a5kyttIoBkh8bn8Y9/qioh8Jk5qI84VuayErWciaCFeeYzi8/IJUIValN69cXhpKHx+t27GFFpR7eUBlCxyPp3TtIN8OhD9PFCioAZeVjbPRL3P8qvLsaKXiJgCMB03f2mLdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424285; c=relaxed/simple;
	bh=nDwyaokSLIoSR04GMXkU2Q0+p8HL7gYVNtHqRui//MI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nlyPYrF+SCkYaESX32byLMo67srPY5qYOrgkTuWa4sxVZpEbLZTipPS+AVoNPtvuHUyHV3rxbCNZBLx+XSGng8IbO3jQXJUh8xef22y/zRSkKaeho2cDTtjGRmQfsMw1pcpas1fP+VLu3Qbjl97Yn1bZVGRVzjoSKa5AQcb+Xy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJWzy6HK; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJWzy6HK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743424284; x=1774960284;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nDwyaokSLIoSR04GMXkU2Q0+p8HL7gYVNtHqRui//MI=;
  b=ZJWzy6HK6DuO+4JAlpYWdmmqNCQX43K7AVc9pZYMlleHROn7c/JgfSxa
   2saH2WMeYefCSmnIB7Z0j6wU7JSdSmoSADj6/q15iI8Ts66Itxt+2GtFj
   qUmiQMRQstTxjlNHItJq162IawEyUViShwsiJVWw1I6aw20BsEu9C7yYW
   Ln8HabzhSMrQg9XfAm2yDbtAzXkzcGQ6CH8BR+PkZWquLeybZ/LWI9ZIl
   jfBUjp1+gcXwWxiwmTd1Wrv87naNpqiBvaJhurgOiko7f6hnfj+4qb4S5
   SlVmjtdagk9gvH3xjNRXfRE1gAC+KgKP+M7oh0o7qDbsOOn6aHV59xxEO
   w==;
X-CSE-ConnectionGUID: yAY3BbrQRGKkcS947gdGmw==
X-CSE-MsgGUID: wd2LJG/AQ8GUX89zJWhT6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44421270"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44421270"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 05:31:24 -0700
X-CSE-ConnectionGUID: 5u3tXpZwQXuLkzrM6qX2lg==
X-CSE-MsgGUID: yMUR42lOQWenDUE7PQ2dZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="131185213"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 05:31:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 05:31:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 05:31:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 05:31:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4qEWKjOaKcdC/WMk59Apibbe2k7KAh0zqUQUvz1raiMZZIHu8W3EfH84YjZGEg+Sg0EvlEjSnO4nT/LK4R6PHcaqb1WRJpvj4z/5xXZYkKu5LlIgUuzVDmfQH3mbqsbVAoajOOlsXuQfbtAV3wUuSlmKYkJJ5f/BTmE6ECjSRWwzwXVbBbBLAT+WREWAwJIrNuuDOcqvs1KWwRpZJQAuZE5GbH3vK+CS1Vu+wbccCaiYyiUraUyTOWJAdGHv0dxt3Zawae+mPXuNtqHrEA5sgf2x24ZujdXOaWTbNmsmpXVAyvWl/gZIP8xRssRmdBsxDQJC6BhjVh5OVULbT77fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JT3Ta5yA07ZhYj7k2EEMgpFkGSGz12i4erhUY9ct7zM=;
 b=XwrjOqrtF3GzivgUppshzHqgR0EHvlV+oiLyTzCNopc33TuLK10UA4J5S61Jcr2Y0LiSRbNnWHqV1o0CFiEZ+eWT5krzj+geUHoiJKbGGfBGpUTYFPrm5nmaICVBRqnRAPVPk5KGQC9OocpB6hjWbZbPfNJDrDuW6kyYBSVEHHhf84vSTem1HvSNa+mwsk9W1qRvs/WbCaSX7hIGc0UGTQR5qGn18wgGk4YdWutxyu9ghUwBZpM8YMsBw8/pQPqqLS2qj+yRdSa7pFVSeeTLpmihWndZpWWZ2yGy42s6CFDZCgFKUBF6PhHENizTR4gnJ1imk8tUV6vfwJucCGXNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 12:31:19 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 12:31:18 +0000
Date: Mon, 31 Mar 2025 20:31:08 +0800
From: Philip Li <philip.li@intel.com>
To: Ingo Molnar <mingo@kernel.org>
CC: Borislav Petkov <bp@alien8.de>, <lkp@intel.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, <linux-kernel@vger.kernel.org>, "Peter
 Zijlstra" <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <Z+qLDGvkY+TXdCjK@rli9-mobl>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <Z-qCrbNvP2cil6jJ@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z-qCrbNvP2cil6jJ@gmail.com>
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA1PR11MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: dac57250-ecd1-4e5e-3094-08dd704fefb8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SipzZQ43XUFCD0a/hwlH/ql09BeY+0xt5xY0f9laPVNplrVA2tNpxTa2+mJI?=
 =?us-ascii?Q?Qbnee3GdA+D0bu4AUfLhOAr6sLjy45L5HtLrVgmLSTs+brkjg3846hUzavOP?=
 =?us-ascii?Q?VQwI/y+6mlcPPO8JVk0Es8Eh0tuAhgJ4juzT7dVq4x5d6R+hJpbtIaJTqAKB?=
 =?us-ascii?Q?P9Uo8Xu+Z9qyIJfGLsLZW6jYvKZfjEhF2Xaok807DTpTmRbJpLluIpR4jHOi?=
 =?us-ascii?Q?Oj72sCb+X8ar7ep8j558xh4DRvQvZBBR3v15Y4S0gKdCDbctIaOUSSsvXIdG?=
 =?us-ascii?Q?nIXdmCvf3bOeHiQ5dWpycxldCRIyaAH6/ibpmu7MfTnT1fRBoVNEK1z1AuK4?=
 =?us-ascii?Q?st2BYM/tfVD5maf+pYu/1/LFFM3aw8GmSNspmRrcLeoFv66cujLpMr35jsnQ?=
 =?us-ascii?Q?coVSq5DGFMVcozpmd6QQeZorUeokR9WqASSEe2yB0wNqzGe0fJh4/Oj+/ef1?=
 =?us-ascii?Q?QNUnWji4lLkEtlRU4Cc1d7gpN16cTID8TjVzc5//OgGEvnmm+AkzD6dh2sjy?=
 =?us-ascii?Q?79IJ63ifbed+ztobqCeFyGNzGVYjoHCpOdlMSVN1S8s9e/h2faNrXPopJRM9?=
 =?us-ascii?Q?YgBbqwlT4AAmZ7/z5WtfdWIppymElI0urcoSqCckPXgFZHCz0IVTESTH41hL?=
 =?us-ascii?Q?xTH6XdEPa4YR1A6kodBrfwSngme5odbgTtFQoBiACGhHaYlZrGuWGuuahRcH?=
 =?us-ascii?Q?maOGHZEvO1noxicPhyMn8EUNcrwKCEICkWnWUBs+y4XOBMP7zhuf2BBlNwWJ?=
 =?us-ascii?Q?FM/SBwaaDqKTSwaCz9o5vj36z/67Ap3FCUyPEqqQFEzZdWyAJCAJGyD+kHwz?=
 =?us-ascii?Q?X/47gpn0BdF3Ryxre0bAz0E+yDSojRESgi7toIWE4x0F/eNSfN8Z3Kdg0pbf?=
 =?us-ascii?Q?rAeLqDUBNpk96GjcdJ28y3wiJ3S0kh7ao3z+kJYunLboanUHkmnh1ZHes6sD?=
 =?us-ascii?Q?S6zhVrlqnN36PC6nmptn6tEBsFhIMbLsLYFb1SvGjYhGsNJ9f5R+MHuSNLFj?=
 =?us-ascii?Q?AHZg1EN/BXf+dNeulPmMldRZYW4+aRn4erBBQm6KLMn8N10jiMt+5PWu6oOX?=
 =?us-ascii?Q?S3FNqizE+7JFGjQdno8X3Fggmk3q411EsrWDniaZU8EuNC7WpTX+iuTvzeJy?=
 =?us-ascii?Q?k633a5LtKGlS+4D7nJNvIMRXZa46oXe7muA7I+35SE79YuPC3VCBAz0b5suD?=
 =?us-ascii?Q?uB01zTVqgV4gjI6jcCn01eDJW28/DfKzMP3mI9IjKZUewhpeP3DwPHSZHooL?=
 =?us-ascii?Q?AWTVldHTTxw5HvU5HE+IP5Og3J/bM1dSXHJEiyA1YmilPyubgJME+OXNfrZM?=
 =?us-ascii?Q?EgEJXw7oIRwjCRUh7rkRoIN55JakulRSNOsQi3/usVd28YdOYlpBKd5ZYyXr?=
 =?us-ascii?Q?do9z6BJ/ivK/qaSR17gZmQiDEt/W1+m0AdS4abOjRTI8Og24xw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dhoMzco22pU2con9+fE8lBNIu1h34QhJk8gVP6LQk8joyQPQe6Ed87t5Qz8S?=
 =?us-ascii?Q?huXrsCKRDhTWuW5K6gBhjXiubHoHEJdqvz/JvIyQFmIzowELbQxS8JOpQ9SL?=
 =?us-ascii?Q?ur95ii0s3Ap2mNqkUDJpWUW64hzAhufnsRaBWi8ECKTKsZYtzebBpybFgH7A?=
 =?us-ascii?Q?FLg9CnBZqZYFfJnYgHDBrUGUs1YkV0dalH01XxG3kylVpaGOaT7U2JGOA9Xf?=
 =?us-ascii?Q?QmiA+MUrrtkSA1T2GPlYX0W3QPbn8w/Bnt8kxpmzVIT2rEHuEPy5H0ox9dvL?=
 =?us-ascii?Q?gwPEVaxqa5W0+0M7eieL7vQMttJzrIkobisJpgU53CmPwXmMTOmpFIM1KAYH?=
 =?us-ascii?Q?opp/P1alsvGgAep0tKoZCZXUt6bqtdXRJcp1daHKPOqcovc9qgBq1fzz0clR?=
 =?us-ascii?Q?lwW0wKhXqJM1l82LXGa02NEGFr7BIPW1ZRLySYIuT7kzGKik7SKdWl8/+SfU?=
 =?us-ascii?Q?JgauLmG28YLrX9u4/+pVrajXt3zlp5NKZK5AA31K2n227AjaiqYNNLBrsVBU?=
 =?us-ascii?Q?N2toGrlPmd1napvgGRLRDZlNeUY6Mg9QDAPUuDoK4e2j6WikzjPxNx/+DJAd?=
 =?us-ascii?Q?GEgfPEEfmzxw1V+XVcYAp6DanSPhbjA84XGP8mHQMU6a/qwWWwe7xmkYQml0?=
 =?us-ascii?Q?ZY5NzRMRhoKia/uqAiI/1hd8u3lT+W9nW7oopWke7Zz3em7XFIm4KQl+sPAi?=
 =?us-ascii?Q?qDAuTsfCSLyaI+6p2P7ct4UF1N/KsjbqyQB6q5SP2OAkfyLKA/rVzPZ+VwR7?=
 =?us-ascii?Q?DjY8yfSsL3J1AtnOljK1NIxIEnlUyMVQbfAxfirMINs2M1hfzY4zAxdmCIiC?=
 =?us-ascii?Q?uVrfrOHmTwfZFefjE3oFEuqdlD2+Q+zFbAxFu0h3OZ62Jpc3aPl+0ND7ZMd0?=
 =?us-ascii?Q?UptSxgHfAiGvLNZf5Vwjy4Z3OZofiGdRF5S52EjUWnIFWYSlwsG/lZ8MW2CA?=
 =?us-ascii?Q?qnnEMSWTGBL6Q/1MhWoi1pF7guDLQp1nd9Am5NGHaNkJUVg9Da+HJ4ccKAbL?=
 =?us-ascii?Q?1kZyPKUw+VBZ6KdlzZQsXpQ0iKvtKknr1Ho2+oW0vz1HujotEpWiCGryLTxA?=
 =?us-ascii?Q?KoyW8TGzd/QDwSx/GMg66Kwpvlh9yW8D1X+gG0fvJ4qREOeTQT2C8LhqgPs2?=
 =?us-ascii?Q?hQgz4a0WLKRu/zrNuj4W9gxgSiF2yLanULrva+YCwkcQ2SjkU+99jIE3+WxJ?=
 =?us-ascii?Q?v2pPvoK38fLU37QrgMspD2C0g+3O/Ul4odmaf6eDmvRMKV47GbPv/MB4EoEc?=
 =?us-ascii?Q?fGyNGeYQsnpaJ5Myz2QDA0E/1ZhxUrYPgRxGexKhTqoRObBHfpQb1hEhrAYC?=
 =?us-ascii?Q?B6PGQpOz5O+3agpCJea4y0Bhn9AQgmcnklN9nSaBT5Tqih6zGo7uaTIpsp5V?=
 =?us-ascii?Q?f8QmsMsnB1SMPhIApg4K+Ndu1d0LmCO1TukS/vls05nbt9SQE7wXOuYG9nDl?=
 =?us-ascii?Q?BndOXbMjLAUOSFEhAkSmGc0CuuyselrQAeOz1HxC8Az7GA5bAOGXyhWa6ovF?=
 =?us-ascii?Q?YWtoqfm6BxmrW8OzoyPfpSLd7GFDTh8w1/n/1B9Wl61csuJFjuZNOxi4c3c0?=
 =?us-ascii?Q?YTycrRFOzPzXViAGrtjI6zphuTyguJKpnDHMN0Lg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dac57250-ecd1-4e5e-3094-08dd704fefb8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 12:31:18.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xhpw8Q5xR403uEMxJJW2fqs44JqtInp09bvqom/oI4aY/WBkrDl7grGaVRnUcsbAicvi96JHNOUC17UXS/KWmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
X-OriginatorOrg: intel.com

On Mon, Mar 31, 2025 at 01:55:25PM +0200, Ingo Molnar wrote:
> 
> * Borislav Petkov <bp@alien8.de> wrote:
> 
> > On Fri, Mar 28, 2025 at 10:18:57PM +0100, Ingo Molnar wrote:
> > > Linus,
> > > 
> > > Please pull the latest objtool/urgent Git tree from:
> > > 
> > >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-03-28
> > > 
> > >    # HEAD: ae958b12940bcd4ffa32c44684e4f2878bc5e140 objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC
> > > 
> > > [ Merge note: not all driver fixes below have maintainer acks. ]
> > 
> > Btw, test bot complains:
> > 
> > https://lore.kernel.org/r/202503292202.Sge7ZEUc-lkp@intel.com
> 
> AFAICS that particular report is not a new regression, but essentially 
> a test-bot false positive due to a reporting change, because the 
> objtool warning output changed.
> 
> This can be seen in the full report:
> 
>   https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
> 
>   All warnings (new ones prefixed by >>):
> 
>      arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
>      arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
>   >> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: skipping duplicate warning(s)
> 
> Note how '>>' is the new warning - the summary line added recently that 
> suggests that there's more warnings. It appears to me the test-bot 
> considers the other warnings old regressions, but I couldn't find any 
> trace of them being reported before. Maybe they weren't Cc:-ed to lkml.
> 
> Or maybe these *are* all new warnings. I've Cc:-ed the LKP folks.

Hi Ingo and all, sorry for confusion, here only the line with >> is considered
as new warning, due to the commit 0a7fb6f07e3a you mentioned.

From the bot logic, the "stack state mismatch" are not regression (not new warnings),
which already exists in earlier commit.

> 
> To add confusion to confusion, the test bot also incorrectly attributed 
> ae958b1294 for that new warning line, and incorrectly categorized it as 
> a 'recent_error':
> 
>   recent_errors
>   `-- loongarch-randconfig-001-20250328
>       `-- arch-loongarch-kernel-traps.o:warning:objtool:show_stack:skipping-duplicate-warning(s)
> 
> While the commit that added this new reporting line is:
> 
>   0a7fb6f07e3a ("objtool: Increase per-function WARN_FUNC() rate limit")
> 
> ... which is a few weeks old and already upstream. We didn't get a 
> loongson related test-bot regression report for that commit or any 
> other commits, other than the weeks-late & self-contradictory report 
> against ae958b1294.

For 0a7fb6f07e3a, the bot only reported 2 times on x86 [1][2]. For this loongarch report,
the bisection is wrong and is a false positive, I will further check. Meanwhile, the bot
will ignore the bisection of this new objtool message as it is not really a new kernel issue.

[1] https://lore.kernel.org/oe-kbuild-all/202503191453.uFfxQy5R-lkp@intel.com/
[2] https://lore.kernel.org/oe-kbuild-all/202503181736.zkZUBv4N-lkp@intel.com/

> 
> So something's wonky with the test-bot reporting in this particular 
> case for loongson, or my parsing thereof.
> 
> Thanks,
> 
> 	Ingo
> 

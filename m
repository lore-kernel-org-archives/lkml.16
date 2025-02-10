Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E841C07ED
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198839; cv=fail; b=jOWwudA7tbmyaI/zOdBb1gurr22NwX6UJJYZxFYp/YJbYS9NdmnqOOGa5ORN8Dwn5RHMtpx3e3wopJ4+EOjdn1LVqr/GbACOaUzC5V+YLvzwL6w90ppe40oX0LIwhTQZuRcS7oT6ZEIY7HtxxMzMRlHumlA+abC4HBkvKvPjjLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198839; c=relaxed/simple;
	bh=OWk7Ug/YlHLA2JAqh/zowJ9A8FRkvsV875EqBxVXHt4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AkAfyKlkwKBeBTA8NP6EjKNB1/zybJY7KR0AMK1HmLyQJ9C5BnYE0V8oNW4TvsUrWo98dKpXj4jSeXEbGdgEOzc2hOueKBM2lDjlglksTZl8iOOBEsJ/VeNjeq33Kv4jDIM/FOfLPGCMrF7vCym7SzkinWq8eld7JOorVyKlDIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0Wl0kg5; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0Wl0kg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739198838; x=1770734838;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OWk7Ug/YlHLA2JAqh/zowJ9A8FRkvsV875EqBxVXHt4=;
  b=Q0Wl0kg5Ed+fe6Pelawf0O08QcjErYZTdFOpuLUxggLR4PAoyfELoSh8
   yYce2mh0Yyam1ZTc0rcV46uHXvCrhj7jjBtBKc7g8yCc2cWkE31I3RzoG
   6gqubEYR8EDXjz3sxa4WB7sa2uXSbIXDXYPZ43mCFpu50VGRbVNRejRpc
   uKjFAuIkJsKp2n/OdyULMiT4+/dW6HGAtlYOM2lVPTlkB0+JmGAGN/aX+
   euASLchAVc5z7XlhVdfaTNhayy+ICP7WSXonob7B6+U2j/SoDyvftpOq6
   mVsRhT/VbNOuUUf5jKmOLfiWLiDn7+ngRFSDPc0kndSTqpK6brnzkofOa
   w==;
X-CSE-ConnectionGUID: a+3FCT7IQlyM+OQgRsIh8Q==
X-CSE-MsgGUID: U7l1JZn7SNq20+Bsk9WQtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39468987"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39468987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:47:17 -0800
X-CSE-ConnectionGUID: xidyEOSiSL2zCUMSf/D61A==
X-CSE-MsgGUID: dtCQN4ARQgGKszne4iaaag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117426577"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 06:47:17 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 06:47:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 06:47:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 06:47:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mipUO4yAA1HYvAwaB0tCUDFmR6HKaHEKCB/roASv37K8n2XGNZko36aMqqlRs/QuYJZ3hEcfAOi+BnlvYjHkDpgDYNA0THdsANt0KthnJB9wH85Gb3jRA/gA5ytZD/x+EQr8PngS0dnFppSOhvJ+KFZ5NlaKAyNltBnbsZ/vtT1FeUSoR7Q7SMEoqbBdoU8jg+xuUtTMJD1PdGhCMAbtdSPmucshLkhDt/6QAd0PesgKvgdNf9UM79Ecdg7XAGINgwRU+SI3GjcCAgc6thj4q54mt1XxmPHx+qWHwokVbnJnM5VZYr8tDhj1CzVqVL42Byg2ahPdIl1sx53j7o0Rbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfGkhRwEUlUSiqPEQXEcTTpPciL6StfYM0hlOgdBFq0=;
 b=XfEl5esyX0jXl+XfcG2IcduMAjpFg/YLXu213roahu1wBFvjEP2Eh8SwkCmIBcjTdym9Z3rM0EntzbEuNZ75ydqgSc49YHyYNuCoVSvTsiaNjgEAdb6u0Ow5dHoR1d+oNHjAAFntVl+0kN4pTYNgBJLyJ/Ttkb2uvcKjFKRaMehRZiTb1Dh0PHwF9E3q43xjjF2VHi9tBeaQmGJe88x23Xzoy1DaOWuRCLKLllXjvQ7l1Ihk4/EgLsVsHY3VqHXtVeCaQV7bQhwww3qyB0U5h/aj/KvzgeiD/1syV2WPvrulFzWw8ZeTYYAcJOxWeSthvoduJI4lEGq63lqu5+zEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 14:47:12 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:47:12 +0000
Date: Mon, 10 Feb 2025 22:47:05 +0800
From: Philip Li <philip.li@intel.com>
To: Waiman Long <llong@redhat.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: net/8021q/vlan.c:241:46: warning: '%.4i' directive output may be
 truncated writing between 4 and 5 bytes into a region of size between 0 and
 15
Message-ID: <Z6oRaZBeKpIg+4nv@rli9-mobl>
References: <202502101253.TDZbCYh6-lkp@intel.com>
 <3008ca8d-e599-437b-8f1e-0dbe86202f38@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3008ca8d-e599-437b-8f1e-0dbe86202f38@redhat.com>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH8PR11MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b2dcee-3bc4-4183-9189-08dd49e1cda6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L/fe7XX8DNbIbY6NDonUfegCyTPXBb5XLlYKX9fFHF5S/h87StxsQaqPIZus?=
 =?us-ascii?Q?sU0SgAQ+tMCZf7iCJdTxj2HWxPnxfaL3Nyt+ZZjcp3TDBqEOHEvFcIUNqPQy?=
 =?us-ascii?Q?ZUXnywUV0JKbA3hAVSMMMWwK4BwmW9oUZPLUq88mkwnJV2PHkJnPM0x+TGPf?=
 =?us-ascii?Q?ZYWz2Pjvz+syA5WgYhxPQlt7cLtLPvCxltGOdN2r3ylkWAjQrFT15MPuOSqZ?=
 =?us-ascii?Q?gY27+baWKeIg3Dcdt47bO6VH3ptCeThX2k8nJJYzvy/HxNDr2NqskoLE2emn?=
 =?us-ascii?Q?YBq4nWKgSruCGfWLmL7xuP1Chggmk+bfqw2szuOuxArHOA45Ote1GXfgJc35?=
 =?us-ascii?Q?MvXFjO6YeR0tREkRk1ujDIG+N/pwIvA+lyzGY46chplUHVgNezqNHdAqYHQT?=
 =?us-ascii?Q?xSWFda1mBjtBQ+qfho9VQu5yxk3AajdaAqFvz+kZVPa5IgsmRW/5FSpCIWS9?=
 =?us-ascii?Q?/+TNhaLqmn5N2rCa+d6SE8mU4yPjYojcQ6PuIJ6OKjmCbOnn+60pMAwqjyGk?=
 =?us-ascii?Q?nLBaOQFXIcv/KLoR8pa6ImOHhFeF6Hkyc5HnubuZRthGP8o5melY8y+1f3/a?=
 =?us-ascii?Q?pFE5SdExCBQsEAcQMWXsxT8YgJguYchu6PEkto0nItnJNRPjGtoyf2yjGYBp?=
 =?us-ascii?Q?7FEv7UUPTCpVSJbAytwcTDntj8tzPz6eIL2ogY6uTG4MMCmoIha0IFEL34Eo?=
 =?us-ascii?Q?6y4b3kT9ug/d4D2VL675qeP4XS6FBA2yvRK4nDuqaXHgDLTdukrK/yFc4Qak?=
 =?us-ascii?Q?xnkwDJN3XGlSiIgoaXyF8caMW23VV2SEwHQxRVoKfZ2x3izuyTm1OFNzDpDR?=
 =?us-ascii?Q?3VylKxtz51Cj4OFNuMZONHN9PBzjyPUbMGq5W4ND2mF1CDEM2Q1kT7V61RQ+?=
 =?us-ascii?Q?UapXkkTAqphpdRWrO2UhrizAmPGpXE9VDJDFuLdO1OqsoR8GeeF5Seqfj3pY?=
 =?us-ascii?Q?OpTxtI/iS26WANHShe7OerivOucf6aj3aMpRVZ7023oSBur3YgKgETYQZVTF?=
 =?us-ascii?Q?gxl/BSVzNmoKJUl9BX51P0xXqV2Vn35iJ1nz6TfjvpZsPlJFqOo+6LNM+ghw?=
 =?us-ascii?Q?RsQON4FogLjD6CW1U8WwwVGrQ4EKOBHMbewkOnDc6k1XelFFk5EIQ9ztW85I?=
 =?us-ascii?Q?bFC/rmNdrZ/XwIHjJ1H/wXq2fShH6AIQyOPRqWEaH9xzImyQk5FArsvm/WJ8?=
 =?us-ascii?Q?c+oT5maevTSCPxa/VD0hG4klGDkML0W7uLdKHT+ynnT8kCOgvF+87JbjRIri?=
 =?us-ascii?Q?3prjI1FFNI+kLfR6rz2YmrD65sa0HTqnLfH9mLI39BHFks5kdljjKcJ1qywC?=
 =?us-ascii?Q?56JR8XLF0TuxJADzsWMRh2qRd/JRZ1rJUROgGCzVj3mxEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RSRlIZ9tVCtYxElmOTRO+Cp7oVL/ddGlNkp3jWoTOxWZIsJiBSqGleFclYA0?=
 =?us-ascii?Q?C2eyjJWlQPqRKqHG2Qyf+td3eSt/BPSTu8L+wYs0fRnU1Ff8G++ySGsD9hvN?=
 =?us-ascii?Q?CHmhJU14n4Ppfw/FZtF/tV9nc5+9Ms5qKG8mRmpTEwrym9lFRb16zbZv1Knt?=
 =?us-ascii?Q?47TNQ8VjjSOUxgQm+fhGNINkdGbNjrUv1IuJlSOxLAU+vRC6+dFM9+z3UePf?=
 =?us-ascii?Q?IDY3eVKHdg6SurH2d0tTGaI7vYShC17g1RlzE4v7l8B70svUKv6AEJAEoR7K?=
 =?us-ascii?Q?L5rUsmMaA95np6x1Vu/tZit4MXQ4CXNKBpwxBeBFyTcMulbRPK46cbdxiHhU?=
 =?us-ascii?Q?T7RzkvDdhIVTYnfj1fNZShVW7+/AS5qWknaRJp3G+LOexGdqiGbN43PNzdDy?=
 =?us-ascii?Q?6bjXPq84o9sLDPnxzGfvKd3oikesLLPZ0TDnFoBEKc/QirrtNcONkB8xa1jx?=
 =?us-ascii?Q?zejfzBlBQrudcu2S73nZmrjfmDCAzJiiLAe902qDuVsqb3EJHfskTo69R7iK?=
 =?us-ascii?Q?qn9PWeaATWtY3FXFDDWU0PRTfsA2ojCCesP5ipsEiMujUU05W3ruFXrCNX6h?=
 =?us-ascii?Q?pLRcdUw29XhXVJB1+35nfLVTvxTSLjVv7eLUjIYopXGvyqMw7rTuMfLroEun?=
 =?us-ascii?Q?B9U6FsBng1nX22bJqurc6xPSwlgSR/crtI0wZeoXJt6QBTPyhRWM30IoZ9Cq?=
 =?us-ascii?Q?nvsma37BOQo+F716AQh6oJ8rpDntdS6QPDk0cwpcNQLpT4r8TzzO/UyAjQ+H?=
 =?us-ascii?Q?iAAXdulbLQSXrrWoyilpSoii/SIiinjtWmD53zTWAX1IjlXmkdzwuqbD1mXB?=
 =?us-ascii?Q?O9Uqy54vsdUuNc26e0MT0HvC/axWWZFM2Rm7NGFi5RGqnB2jcfWjYPdxBQ5X?=
 =?us-ascii?Q?NW699wMDPwnsv8/nGrg7SyC3g9nzGHy02Z2/8elapB2+OC1YdkbuMf3V0BFx?=
 =?us-ascii?Q?0I5egGem+2SymKopC3yq7e3Ad+19qkkoZf4vLqgOrQVEuii4EB1hDlnHU3ms?=
 =?us-ascii?Q?MhQHa19gYsob9UmqHEjaNguCizdYzErEZmw+qGLv9VX7+Z25eCMe6FrI7c+v?=
 =?us-ascii?Q?FkCTY2apnt9GeS36ExPW1BDtnvPK9JAaq0Wa1krdBz/2naP7/JQRYhTT139R?=
 =?us-ascii?Q?zx1Lem2ZFvn973WSBhkCvoVha8vu2uL2JYmPeEZkxfm0/ZogyQb/2NNLeyho?=
 =?us-ascii?Q?sCFyVuydYPPx3wv9VhZv5JtglRnm1OBzQHrh2MJwqq1ptB/6e/hsYzCd+Bcu?=
 =?us-ascii?Q?sGCvBi1SMezP24M6JknsGPwdEqRDnV6KMVNc8bhjbuucBftoTF09utaTl3kq?=
 =?us-ascii?Q?DB3fdqD4dgJb8tE6MynnKgnZHafF3Vz4PK1CMYeH4bqBMNGEZKacqRgujK1p?=
 =?us-ascii?Q?arkC6FcDwwp9ihMFPuumkSed7p0bPQJzrBtUCwuz2aAcgNhZelX2TrdMTFxF?=
 =?us-ascii?Q?DnXM4bTPgQ4CeWNJvue1HlI+HBqLzCXucnjtP2k7mOQUJr1oirSMeme4+kDi?=
 =?us-ascii?Q?DNoaKUHIXO1v90VAvz7SIc17GcKIlFLiMAqiW02eK3xPcHOyR2ON2e1o3oDJ?=
 =?us-ascii?Q?anlVd24Lp+oVE/MroOa9ZKZw681FX2EQuulPQOXN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b2dcee-3bc4-4183-9189-08dd49e1cda6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 14:47:12.6372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LF72FCBSGGaXkcc5blrvyBcPU2u9MgiElgDDSa6HPMeaV1O4fftDV1Absfr7p0vJaqeudCkzbVL+WDFzzYBjdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
X-OriginatorOrg: intel.com

On Mon, Feb 10, 2025 at 09:24:58AM -0500, Waiman Long wrote:
> On 2/9/25 11:44 PM, kernel test robot wrote:
> > Hi Waiman,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   a64dcfb451e254085a7daee5fe51bf22959d52d3
> > commit: 925da92ba5cb0c82d07cdd5049a07e40f54e9c44 rcu: Avoid unneeded function call in rcu_read_unlock()
> > date:   3 years, 5 months ago
> > config: sparc-randconfig-r122-20240116 (https://download.01.org/0day-ci/archive/20250210/202502101253.TDZbCYh6-lkp@intel.com/config)
> > compiler: sparc-linux-gcc (GCC) 12.4.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101253.TDZbCYh6-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502101253.TDZbCYh6-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >     net/8021q/vlan.c: In function 'vlan_ioctl_handler':
> >     net/8021q/vlan.c:253:46: warning: '%i' directive output may be truncated writing between 1 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
> >       253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
> >           |                                              ^~
> >     In function 'register_vlan_device',
> >         inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:628:9:
> >     net/8021q/vlan.c:253:42: note: directive argument in the range [0, 65535]
> >       253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
> >           |                                          ^~~~~~~
> >     net/8021q/vlan.c:253:17: note: 'snprintf' output between 3 and 22 bytes into a destination of size 16
> >       253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
> >           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     net/8021q/vlan.c: In function 'vlan_ioctl_handler':
> > > > net/8021q/vlan.c:241:46: warning: '%.4i' directive output may be truncated writing between 4 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
> >       241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
> >           |                                              ^~~~
> >     In function 'register_vlan_device',
> >         inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:628:9:
> >     net/8021q/vlan.c:241:42: note: directive argument in the range [0, 65535]
> >       241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
> >           |                                          ^~~~~~~~~
> >     net/8021q/vlan.c:241:17: note: 'snprintf' output between 6 and 22 bytes into a destination of size 16
> >       241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
> >           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > 
> > vim +241 net/8021q/vlan.c
> 
> Why me? I have never touched net/8021q/vlan.c and I don't believe commit
> 925da92ba5cb ("rcu: Avoid unneeded function call in rcu_read_unlock()") has
> anything to do with the snprintf format warnings.

Sorry about this, this is a wrong report and we will fix the
bug in the bot side asap. Sorry for any inconvenience.

> 
> Regards,
> Longman
> 
> 

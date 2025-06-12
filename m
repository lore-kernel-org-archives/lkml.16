Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11DA18C011
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695667; cv=fail; b=EDlOYm9yO8qllp8Tx8edqomExZ9ZpWgw3LJscmbPS9bDs857sv/c0VMIwbJiSgzgUPIRRrI4iEdK8Aj3uQqDW+L1+sSjiLdgftL8VSeG7qG+OMoaclOOjTgpJR6xVMx66A2020Z3Nh0Y8m7BhHdrHWJkOrKoH9uV+Cd7YUOKdws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695667; c=relaxed/simple;
	bh=jVvL8J+t1cHYdBPgBGwmKVNdjWGzZMFFR72an3/D2QM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kZYbQPBej6opp1zSMekoJlF4RnqmKQIMsVsCEG4VadG2hS7tKU44m+NME/uME5tFFyWNdz5dZQ5YKynNuOR0KXE1t7dgy34yft77K0ym7XFhPC5C7MurhZHBcYBgmx6fk9ICb6CFG8l+wcJ5BfxtBBirM5cJsEZoK7en2Dt1Qts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDXEHJpl; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDXEHJpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749695666; x=1781231666;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jVvL8J+t1cHYdBPgBGwmKVNdjWGzZMFFR72an3/D2QM=;
  b=EDXEHJplL7pymbUQ4VeMOMtA9iV+QhtnG26sAFHsXLOUT4v/nfqjQsmD
   OpqYmerjorioEKSkgZ2MwoSzUxwUv8nj/1AXdTYiCS0+TC0zyIctWbsyb
   Uz8aCGxOHk1LyK8OtaWoEFntPzdzBP4EC7omdAx/pys9ZAHWPRO0vJoOp
   xwXzqOoInjiZ7NH1b6rHwH6U/PTQhRPFNimg49m2eGeC7c69WFHPa/J0B
   IHdnoMqfQbc+a/2KK1nzWL0qh7siurYEQS/sxhZPrHOx+/2FKngvbYOVe
   cUWNBHqn+XhDe7xRedjqx9SlCJh95uVoJpvCP7itmHR1DZP6JINLFhU+y
   Q==;
X-CSE-ConnectionGUID: OFA2R/orTbeCQFiAt6Z06A==
X-CSE-MsgGUID: 7hDUo55jTMuzzWXDv97SIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69295119"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="69295119"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 19:34:26 -0700
X-CSE-ConnectionGUID: eSrTAslTQya7TxEfA2Vzsw==
X-CSE-MsgGUID: csgiuwN7SIOEiNQ6B7+iuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="148278202"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 19:34:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 19:34:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 19:34:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 19:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKxtNTYGKVKeJEbNiBfMGPKhIv+NJCO7D1Z2ecoWceMjwk4R6/Uy5wVdHQcXQZPv1HBFnK+lYgdFYiaOG+wL+0+e+aFOEjHrNoK6emn4K1FHbJXxJQYwrHQr1xrd8JqTKz3WvuwQ2HRy3eylTAe5eB2yVokYDl0cLZ0s05Jg730zqvlaXyHNXnN3+C640HGxPSAmp2C6DLxXaI5w9qMtShwtqk80FedyLuLDUtLTWV/QKJi6nlXSXfJ4KFPLgAALUhExCkEONi1auilqYZQgLyX2NuSs/rkQhe3E/DPiHR0OCxHy8cGGprMZbdiLeOyVsGqEycRpu9ChyrzdmGmzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8MGChbdNvujck3qDVFexqmTm/TOwOhQBa+Fedq2/7Y=;
 b=tJS0CQ5p9Y3fPnLnpjLt8zY5wyTVMt2tn+mjkyhKCcu+aTK9y5HWgQFjZ26y7iIA6saP7xlmkwAKh5MOUyPqWUehz+jowjbWP76+Mg9rjgH6nbGAQ2VBxsMprkkz9cSM4qSEPSilhv6gs1TFu76/cJlW7pvNbVIa3/KGVNWiyc+ZjOSBgCCakDGs2Hg2eqMWV5F89m4gxUIjWnUYzLFjzI7Yn9KdibTGuWwyvs8aZLMdDvnJVCd8eyBiZ8+lwuQICzQJIFtmUjQy8bhBSbgAcb1jojkxSAyx96nkcYqPAl0eFLfA4u9h8LHArlELcZDSNWSWI/c6kogER+cTdPEjqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.32; Thu, 12 Jun
 2025 02:33:53 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Thu, 12 Jun 2025
 02:33:53 +0000
Date: Thu, 12 Jun 2025 10:33:46 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [paulmck-rcu:dev.2025.06.04a] [rcutorture]  9605367000:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_sync_torture_init_trivial[rcutorture]
Message-ID: <aEo8in1XPCBD+7Aj@xsang-OptiPlex-9020>
References: <202506101435.e96fc5f7-lkp@intel.com>
 <ad8d8a6d-1e81-4ce5-afe7-19cea07ef128@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ad8d8a6d-1e81-4ce5-afe7-19cea07ef128@paulmck-laptop>
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 1518f473-a832-48ec-e50b-08dda9599291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jQldjZArYHxocvnYh7pKVmSDYaONJzUn0Cd1pgOqVlnUI4p8erdPxDKEld+3?=
 =?us-ascii?Q?SsGnUy41ALLN9IBuPK4vHxotLkqCyjPPgiHX9aPH5VIBlQQc2zHbJBRHeYmd?=
 =?us-ascii?Q?qWcpJA2lKPKqLVTDOLZ+t2O0cKNM2dEB7dAJ+eNxvzP7HwwC2j6jWK8csm61?=
 =?us-ascii?Q?YRNh63lBdz9+yuCOJIyq1dmsGoNk4WD9ve1yStb7w+BzvxVifNbEad7EVSYm?=
 =?us-ascii?Q?79qig3yOL5uKZ932J0al57bMMN3pUbWkGHu0jdUj3XER/c9auGQ83bazJQ6y?=
 =?us-ascii?Q?r6Og8LDtKG4fsdMdVn02wUkLxnnQqGyZFEm2DbgmIlWqqf6bvF0T4T/038tR?=
 =?us-ascii?Q?ZU9iCr7tACv8quntSBNohHGbMksJoSJXysEP00ioZA36OXzhdRtPUFHN/sC+?=
 =?us-ascii?Q?aDYtNYkPVfmFYGtVJhbk0hZ58NuU+pkxRCo5ZHWJ/bf/S5XSS0XqqYsO5JTh?=
 =?us-ascii?Q?RpSLnLwFuY4ZGrM1+eerLlHT/ozvepQ+5pqmTsc4/GutGV0+1amQx7UGZ/MZ?=
 =?us-ascii?Q?IEiXPa/JLdij8gstRycQlnKWRHFod0cvt0guXStGFqtWVdayFwPhAL+C51Me?=
 =?us-ascii?Q?uz7PillfPlK1WyVT/c0HBF9Yl8Df9gIG5b0RlFsx/HUVCFqTa7e6u58aNEYI?=
 =?us-ascii?Q?yZMKikNg33C9YeKZDfsVgRolsIAlM6V3d34TEnMX6EOHG9x8lGGD73a/otrk?=
 =?us-ascii?Q?U4mBmYdszaKo0/HH53rL0m2eAzPSHrh20s4sEGI7NokbXqiKAUYb7CRsgjnn?=
 =?us-ascii?Q?406V06dGfetDZG1Wi3FvoWuOvOxbeh83waa+M5+cuSzCI2aB5GZcbnsY0wBi?=
 =?us-ascii?Q?TEhb7h/OMEhbbGybDsvO3sqAqq8zDDQ5Wx2JHWZJ/sjMEZ6xRNa5MRwv7lIZ?=
 =?us-ascii?Q?sXYK9fmGxMW1mfK1IW0i3dVW49mPK8ZHv5MiV3baOf8NywjliCDtOKX2rFwU?=
 =?us-ascii?Q?toRUFlu7M69ps1dzWcLymh0x7I75S6CJPA1msd9fzx3vtBPT/aWSEuOpTjjs?=
 =?us-ascii?Q?fy+NH+XFX+k23a5g6qrkyaTEZ1exyXMc1uARjWShEDwJCxreuw0o4yda/IqN?=
 =?us-ascii?Q?kJMqZqSHlB0qRn3r6bM7C+DtikH9jmjVnlOID/uY9JstQgJvM6gbxZIxsnID?=
 =?us-ascii?Q?gXM3mf2HqQmCHUuIomrGKNhbeu6pup4DRbhvzz6a3bwONvWwTGSLJxtL86/V?=
 =?us-ascii?Q?jzEN7um2eR8CiLAh0GEp+3pp+8plZtHD7aUfoCYZHgrOAd4MLSnU8sp/ndQ5?=
 =?us-ascii?Q?OMJ+fyAB4ip+bWDnDd0D1TvRh4w/A1rTst4MAA3uhyaZyZdFW66j7gUjLEeN?=
 =?us-ascii?Q?31LkI254GCx7pWrSMZTGV0iRM4XavCn+s4vB9gcxLACdKhjTsVUD+cLiHYrZ?=
 =?us-ascii?Q?Hgmo93SsjI2UqavWXkyKpoLx62m4NaUGEqaUvCAkr9Nfxxv7MxybBXaS+G4F?=
 =?us-ascii?Q?Mq62kwyLiZo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mkEDoWSbAAAY/lZnfjoFqmqPmQNCg1cEfCUv0SmnwcA8fpRoKyVpGR6tDYlu?=
 =?us-ascii?Q?oS7qRAYmGC6HQb7+xid7aenqEc1V7vv3yWID7sOPj9axjUO+MxTPEqXHV4Ph?=
 =?us-ascii?Q?MYZQZg1ksSnjrR7GWTD8TSsVea3gG5LYzT1SZDTBQBuDOjQdlpE6rRK0DpYY?=
 =?us-ascii?Q?F1zjYb33lPVi+hZJPFt0UGlcVHl6is2tkw16IPsUw3m143TgIrhvXWnieyJe?=
 =?us-ascii?Q?LBx/eruoISjRmU7kNi5g5Dxk5CuW1zmu1sz0nbA+7g/50mb1RPOtYrTCndVN?=
 =?us-ascii?Q?jgMuo+WOgeYLhABj3zOmpC7xUg+OfxZNKfnoLwKoCD8DXxjqBSEjs08PvEez?=
 =?us-ascii?Q?AW0Rw+LaKdviRm/w+iHHejgOycNB7q0w+IxzUpo0LKDnOe+b0mMZXgbRYSbt?=
 =?us-ascii?Q?S7F9D0GUhvEa8vfwBzJLZuBJXvfRsJmKr+Ok6IMeuLyCD98w9njy/M0aX1y9?=
 =?us-ascii?Q?SZYOancNLFZNS3fxu47O3akj2UbxQO+vzOnIhCQI1DRNAj74tOVRJ7j1F+/4?=
 =?us-ascii?Q?k4VaMox8rv5uyWMxxH9Kkqrq/DeN2wxfD8dWfuh1Ro8sf8rNljHLwRCBH6JX?=
 =?us-ascii?Q?Uv6bk0pePiy31Z3m9fk9B5SDZs2wkmII++C6a6sFnxHEcdB887A1fwLnck0O?=
 =?us-ascii?Q?JqVanHTSW0c+YYbMAB6hY7xn75mst543Q6ACsbREYX0YPgAy90BjYE/+NcTF?=
 =?us-ascii?Q?2GNRtIgzugPNGXLVBOfW2dKYzQ0hHWNVbJSa2GMDL6nqAPRyITBitOknWxPt?=
 =?us-ascii?Q?btOaQ6QnBw3dPCl/urDBa/U9SUQlWx19gFV3C/5ARy+GawK0tLBwt2YgTZXx?=
 =?us-ascii?Q?mDVM61i0d0W5gMZidAv3XEg61yKZWdWdV2YgDx4uWnwqWc5aQs2QIpi14K3e?=
 =?us-ascii?Q?GjD+DETlwC/FUnYUM29TYEtnUfa3KAU8/cQ4UKR2q+0Gt5DVAFHodVMTz5cX?=
 =?us-ascii?Q?b6QVO/ZS+O0+Z+D63mvY/nqyYhvb40+jCUqgotF2YEnpG/kXEQX/mJY7UP55?=
 =?us-ascii?Q?DuSInyO9FOHJXpxpq3z3QTdXAbP6m9k2B5D7pqjfoi8c8+IZaFtCRBFAQurU?=
 =?us-ascii?Q?l3FOcpf4MdArub27jWD+qr70l9noI4Xsd2M84KuwgW1oPQQcSnv7g3Bmg7Iz?=
 =?us-ascii?Q?6nJavEk69SzWxVqQulsl4sZ9bLOs463aCulfewaVpfSbDR4WVB/Gs2Zk36YD?=
 =?us-ascii?Q?DcGxp6C3ej0Nb4CKAEPVOBVXxROCeHXrEXpOeeh5ItrE+3wVrYRU+JV36AT6?=
 =?us-ascii?Q?BoFzLWGzzJBDbhGeky9jDNSlks4aD+W/2eZyHYTr2DXn4h4rS3MrgMve8GNe?=
 =?us-ascii?Q?4EWfG+APi9e9rTj6Y981CS1DyheBmcia8Dkf52sVATMbzkNQcYHmq6LYRbxM?=
 =?us-ascii?Q?KuAnrpyWX/oAPTh1vBU1DNnJ5S90p1LqV/DD/ZYQwECSxkLfLHuoWZdGRKQ9?=
 =?us-ascii?Q?PBVNrpdflXaYPENpwON+K3sPq+gRfaQUZWE78chIVYPQ7EsBKbJYHVk2CiPr?=
 =?us-ascii?Q?H6e1B6ldp9ruHnpkYDH7DQOOISMIX60GZp443IxTFx5uhtTtF82hml44Y8S0?=
 =?us-ascii?Q?hQZGH5DXd+P500+ENGqQcZsWVyYAGrdTvDKJf8sD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1518f473-a832-48ec-e50b-08dda9599291
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 02:33:53.5853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0Zb39kcdmJ+MJ2xq0cnnbmmnCIrDvkNYWbyguSc6WBgfBRkmaklZ+n5aKH2IrEoKoIJnYlj49+U/cQYihtLcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
X-OriginatorOrg: intel.com

hi, Paul,

On Tue, Jun 10, 2025 at 02:16:02AM -0700, Paul E. McKenney wrote:
> On Tue, Jun 10, 2025 at 03:16:52PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_sync_torture_init_trivial[rcutorture]" on:

[...]

> > 
> > [ 1078.542757][ T1445] rcu_sync_torture_init_trivial: Non-zero onoff_interval (0) or shuffle_interval (3) breaks trivial RCU, resetting to zero
> 
> This is expected behavior.
> 
> You are specifying shuffle_interval=3, and this is not permitted for
> trivial RCU.  So rcutorture is complaining.  ;-)
> 

[...]

> > [ 1079.633479][ T1445] trivial-torture:--- Start of test: nreaders=1 nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1 shuffle_interval=0 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 fqs_stutter=3 test_boost=1/0 test_boost_interval=7 test_boost_duration=4 test_boost_holdoff=0 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10 stall_cpu_irqsoff=0 stall_cpu_block=0 stall_cpu_repeat=0 n_barrier_cbs=0 onoff_interval=0 onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16 reader_flavor=1 nocbs_nthreads=0 nocbs_toggle=1000 test_nmis=0 preempt_duration=0 preempt_interval=1000 n_up_down=32
> 
> It then resets shuffle_interval to zero, which allows the test to proceed
> without error.
> 
> The problem is that non-zero shuffle_interval can cause a task to be
> migrated twice in a row without actually executing on the specified CPU
> between the two migrations.  This means that readers on the skipped CPU
> can extend across the entire trivial-RCU grace period, which of course
> breaks trivial RCU.
> 
> So please set shuffle_interval=0 when testing trivial RCU.

thanks a lot for these details! we updated test scripts per your education.

> 
> 							Thanx, Paul
> 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 

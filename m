Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422A0153838
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738406539; cv=fail; b=sbtWMrypWVej8H3bGOwwk4e+mp+Lf44+KLICtwWCVS63o9mVoK/GdvEzikScQ5ZHU8mD2+97izAz4iY3Ub0WZkJT9rZZR3sD/RXWqKpFFaikmwI95PzHaN4xF2jH3w9LZRXiH5Nvy68w0bC1vIOtKvqpI8y9B3b+JYIh3HgMFfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738406539; c=relaxed/simple;
	bh=1Hh6HbiHi9Ix87NJCz+1FY5LiOA1I/NXGtFynHGBvMQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fW48MQQGA1S/3sa8ZezkCWUYo7EumixTjLaQtJiRm4+oNihtkCNDMuivX0aqaxLe4yXtkbZ2biwLrYyoC+S/S8SuwN6uCF3P0Y9Qo0M9t2BH8624BFNKR+pUM6efGyQsq5kjPKqlhDb2moIaHzahCjpYi9hu83KAuDKso2dfE50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGqeVXst; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGqeVXst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738406537; x=1769942537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Hh6HbiHi9Ix87NJCz+1FY5LiOA1I/NXGtFynHGBvMQ=;
  b=KGqeVXstanCKfVq3DndZvDgK1lq1YuCPXTRw1/6QrZZHAxnsV68uoPt8
   U3qa4WsldW3QnDbEygqBeEviSRq4j94AeRhhWEmXWrPrUSvAssxiCDPqv
   38jJQI3aMGZnrGX4tUitWBWS5SMoLzPuk7OaPwE9GqwUM+u4GdRxIlsDQ
   U4pxm8MQyJCXAYKOg4CcoBC1UMsPU/y79UguefZkqOr1ws9LYQ2eUK+uX
   +URH/bCCWEtH5A39LLPz6OXbEeFe3PiiysVMfbN9XwfmNrUIZKHILiN1A
   iDWOBWl6k61xnG3yJXHCxLvcm/bIJ4KNchIcSsn2muJfE7cZ8HGO3iLmx
   A==;
X-CSE-ConnectionGUID: gI7vB3IxTWCA/CMNNU3Ofw==
X-CSE-MsgGUID: giO4m5fGRrC2sTrdWK7wag==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39104750"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="39104750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 02:42:16 -0800
X-CSE-ConnectionGUID: bwiqgoH3TS+bFRFfQ3avQA==
X-CSE-MsgGUID: flA/sqi3RQiHFgwC2XG40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="114851651"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Feb 2025 02:42:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 1 Feb 2025 02:42:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 1 Feb 2025 02:42:16 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 1 Feb 2025 02:42:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA4lu++W1y+V1VjnSX60UU7qBrh96Jny9djZCNy95C4vUiQANxlcMH8jBghL/CgM8A6SNsKNSBSgT0nuKC44UI1ZD52MjsGYcaR2lJJJIwamTVWB55OBsCRSh+mGhqdeM9v2I9cMmfPX/rkUMs2XKx8Sjg2erz5yNcxURQJ1GgtL7DU/AlJAei+aqHh3VdUs1Xlrx+nTFpUheS3C8cTP4AlWu45kE4IjxsP9Woly5lTbv+qxrLRHcTCDxz2MOV7ygITlvqQs3YkXlrPy0KI8+Vh4oS1s9RABgzVNJGzntvuUEPPXE/UE7THcz7aqjmBokJfgrHYanfKQzmgTHDaJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tqa+W/KyWeWTd7EUYjYGxyCTb0gArABPFcETY4dFyQ=;
 b=R4GM77Shop2WtMcq8zlVcYe5PeAGgjrkqINXy9muDu5FK+6kYQ9rPxBmJ0UdmfSEaHcosCN7ZzZMAXYVtG1s5dRKyZ33Q5sdWqRQDEtjM7u8CXxCDwBsOK31454yz3IInroj27FsbQUDPqXdew3NmTzNsRNhkkjMKwn0hsDOffEUziuGtPfS1XgBZxBhcNatOt8CCsSKaq4GLOu9OvUylIZ0f5L8I5TkhBlF025UjQvGcFT24ZSzf2yKlmQQ6EBfgIEr0BRYcVta5MaPITJQaWOWpeuEZvTyvV6RMmstRq77d+YYzJXqKdW3L2Y1tQ4QsLoggSqyFfKacFqHvoRCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Sat, 1 Feb
 2025 10:42:13 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8398.020; Sat, 1 Feb 2025
 10:42:12 +0000
Date: Sat, 1 Feb 2025 18:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>
Subject: WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version
 generation failed, symbol will not be versioned.
Message-ID: <Z536e89njT5aTH7u@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d553e36-bfb5-4b33-be5c-08dd42ad15f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BtqEr0Vj4+SsiVPseVnebJHT0hL9ePegjlVvaGbasR8UGygNQKUK6J/l5Wsi?=
 =?us-ascii?Q?QNNbP9roNzSZbAw4G2gBfLqNX74Bp9fOFSQZIDYXbyQHUxYzhbVxDHON+sm/?=
 =?us-ascii?Q?1HdbkSFyZftMfP7CsBCPGojBcwC0csRjIl/w9jJow5L1Z5FNApXqI48xM4Th?=
 =?us-ascii?Q?MTO5weoCWfDlzMepSYnmSh+ZKYM6IOOqCyoo6Eerifw2LCf+7YbJUbYsBYLi?=
 =?us-ascii?Q?2xbDJ0ssKKl3ShGpUgWMIHI580bBVmLv5DMIv+8z8B1o+ObtA4D12bVEZdGd?=
 =?us-ascii?Q?U8xo6wtl4o3QgbS7SvqplrUveNn6Vj6xJ2EQFJIzGJtX4zglBrui83pcMyTa?=
 =?us-ascii?Q?eQoHmWHiN81MN2Nb0BuDfVFLkUJSi3XvKlPauzu0tY3K3Uk85XX8LiurkGJD?=
 =?us-ascii?Q?Xw/lsrPFbx9gLsBfWGZhdNnTsYGeI/d8jVsw0l7XDMhDM5TmKvrIIElYOWj5?=
 =?us-ascii?Q?UaTAI0qIoBEpcvjdo+ZF+GwtpwWMumUU0CV2cZuLmHU4GTL+Fx1/Zn05/Ctc?=
 =?us-ascii?Q?NlCD/c8AFutHOdlNpCxkpfW0+UafY73d5FnwaLyJUHogLvnPIHYNTzZhqA/B?=
 =?us-ascii?Q?9NDUFVsjKHLw4rOp2xT+IwpaM0FssNtSOChi1ARjbYC4xP2rxFuarVFKTAUm?=
 =?us-ascii?Q?lpkr7sAxHtR136qhrk5Mpnp3RbwJR4HmzdXIL5zwB0HM6KoZpmHFqwqZEmLF?=
 =?us-ascii?Q?cqPVb2O3reggHj9RI3+pRhR+ocKgDIyhKASJNjssX6EKAQMOLPdNvCK9Bcy6?=
 =?us-ascii?Q?9HWe7Yq4mBTxWbK/ga1Cfxw1ptEo8AEIglxEhBvzkpQ6z/HdcK/b9Z1/7nX4?=
 =?us-ascii?Q?O4XuSL3DLDEpv0YN9NJlOpgFKilqLlZn2wY32xbAcPViJ0lJDA9bb6bGhJbr?=
 =?us-ascii?Q?/3vAvtPsgKfxBZjv4l0CPdl3T7/qcBy0h9TNZ5uLgLN/lmlqB+YCPXUUS/fE?=
 =?us-ascii?Q?d+6JIOxxndW3EQ71HUWjyTHpwL6aSHMXc5ydKqVExz1oF+g/adqpZ138IMNZ?=
 =?us-ascii?Q?kIafFiL4yKpGJgCN/+KZJ1rcCvp2NboUwyjCh6DpbimuLL+WUIWhVfTHtynX?=
 =?us-ascii?Q?ApWVsRfe/oOz2tyTUnIgi2jWmYpjn5wy7kbBoWvIzu4jKzPzax9WehVGf5IH?=
 =?us-ascii?Q?6ipf3YtxYmxpj+e5wNX5f/YHmaT2z/WGGRFeGEYXfwKWeQzx2uZNWNrl9EIx?=
 =?us-ascii?Q?7A8YlH3AW7hCbewyIkmavnYKHaHqL9lDXnxVUvrnRFRbAcPW9w5pw1oWcrsd?=
 =?us-ascii?Q?XvxDkA6MiueYBO4oP4MHQ+JsEoc48bf7KZPQMMWzbpOm8d4GmkxVH9jgMqnt?=
 =?us-ascii?Q?o6Z9VMwHP0GRWiAwTox3DgTCH74N1NLFBNOIci9+EKChlg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JJBRYkAlq96Q0xSiJHfvG2C4OFyRMRpxi/J1c9Hg7ubDE2bDp0Q7/LxUabIf?=
 =?us-ascii?Q?wK0aHlionmo5tHH4IHu/tz6Hio1kYD6gQwy4+01uSsN8DcAu6LErxVc1RyOJ?=
 =?us-ascii?Q?HDEadh+NzYsDpugx8Y88if8VKB+r1wLSFeTyXrQugJM+qVZshAStJ2oJHr/z?=
 =?us-ascii?Q?v477KSm/Dt94j23lmutvMxFZVk46WLNmQXMGzNkCKHQ1ohabttISXGrgDRHy?=
 =?us-ascii?Q?vcwXpq0/OdqG8ojymFDBHxEkf/H+orQCTnqSMka1TW5VI34ZlMj9pTwjhAC9?=
 =?us-ascii?Q?FJ8rtIpmsF/ZuApTgch/g3Uiuoy9/QYaSS7aV3SOD8FjbX1FuD/+OyhbRW8o?=
 =?us-ascii?Q?2/6+cqevtDivPwPjnDOZu3ovtXN7bmPKqDyI45IXP5AAI94Ga5XoGQLtsTB6?=
 =?us-ascii?Q?cu+8MJQf7qcfakZFZ/8K79a0SvKW1opPqhVwZJSW2X0ARmtDg6FKqnIRvWbj?=
 =?us-ascii?Q?0/PDiG0J/VTQPtUtoGcwA7GIgEimCl2uYr9/GuvATCTRkNOd5T9mRqo7g5gB?=
 =?us-ascii?Q?Ko0wh320yjH5uy8xHXuDSommPtVU/leMPrgsBe/4CAWkQU/VoDwnJFI9WNSf?=
 =?us-ascii?Q?NeNhs22z4BENEASASXnCpyXn709zQ2+TTxBTxFRAXWv4H4wjT6GqCI2TSKb6?=
 =?us-ascii?Q?UnfESQDGrxfuCGOhSsQp2yl87KVXOxJ/SaJujRqzNsKrVZj8yYyet6Su/VUH?=
 =?us-ascii?Q?5naVWoGfusYV9CIlKwdjUyWWvw6rlE5avr01hZtcsJpNOUve638MTZ4kPLLW?=
 =?us-ascii?Q?6Y76/cQIw4kw6cHxC36bGqdmAhOJEWnqryTtobgmZ5nnVSIM6fEAPSvt/Ss/?=
 =?us-ascii?Q?dIhPCGJAVQsi+FTPWktGb9gFu9AY6fuVEg1gykoxGqqUtV/WIcWtoIDziWof?=
 =?us-ascii?Q?7dEWHCRulURvioWrdFPRgyBLIgDZ37c6JwHubb1Liy6DwrYu2pWCKx0aTaGL?=
 =?us-ascii?Q?DBfwMGAyRVqn/Y7OE26/n18srXByYtJ3x1kToIPTmGBcgUo/FtyfsaLgqw2c?=
 =?us-ascii?Q?VRJYMWTck+05RqEvHN6UUasiefLogpampB+fAvf9UP9WK1W35bQQG/G/MOub?=
 =?us-ascii?Q?woT82CIWb+I83LPhkOSp/Lsf6OxX8YCkQkRnfV6RMK9BEWByJ5ZyKXY/uURy?=
 =?us-ascii?Q?hj+LJ6I1l9+je/7ltJAkYlOwyPTCPvCPDOIf2NqSleg9g05TJ/8JCRlq/Ab5?=
 =?us-ascii?Q?TES6WPVk3Q5stzVC9uAPjmyjs5nk+PGIbf5RSu3mWBBMU6GDQvmLhORRaAE7?=
 =?us-ascii?Q?JqzBSm+hAq9jUIPR9zGQkMYx8DvYXnGhk5ZGuqbWlp2gajcyJD5U2P/RqLWW?=
 =?us-ascii?Q?WUTU90Rbd0vYXtKQ55gUTBoMQxag2ns5TfztR6Npcsmj7hDON2l5TpzXUtke?=
 =?us-ascii?Q?Atv3BdxN26lIUyOB6EJnp/WcV6Kkjg7UHPBdqno8N4QWVGsJtAYzHC9PdL/k?=
 =?us-ascii?Q?tbP09MQO59ec88RMa2NazV1ZqwboJJjKkrUXo6Rx9B2+IpuUPdY4b/ag9w51?=
 =?us-ascii?Q?NXOt+l54jA2krjirG1OcJ4obq3rlJzOA8ucpWJOs8sFIWtCqBCk0i7cWAWtZ?=
 =?us-ascii?Q?jk9LrhD46AXqEgtcYXUYdTUmXfmG3XCiXACvbNbZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d553e36-bfb5-4b33-be5c-08dd42ad15f4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 10:42:12.6588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQuQahJjYCkD7ICvD/bBQUb5DeOT29J+uYbSnPCDUbyvWsAzQo300OsT/TPvI7ufvJJDchA0+qvzOoYdN1FiFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-OriginatorOrg: intel.com

Hi Randy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
commit: a730af6e3114d549555f4b130c216bad1c3aa80e um: Add 2 missing libs to fix various build errors
date:   3 years, 10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 years, 10 months ago
config: um-randconfig-r054-20230701 (https://download.01.org/0day-ci/archive/20250129/202501291109.SqyeMx4b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291109.SqyeMx4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501291109.SqyeMx4b-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
>> WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version generation failed, symbol will not be versioned.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


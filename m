Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1C0320F
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 05:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746336428; cv=fail; b=UHPIkvUm0I/DsV/pZv1LtENDm3do5A+KjVAlhhmnBLEInoKBCOUIMwq7cPK4ajiUKJ0PSf6yTd2vT65TNyK+mI1NyOir6OsdVdHe1+/1nirwYtygMgvjuRzx9J3K461oPH4vq0TeSUDUhSohm0dxVBcFib0WXfUmayKALgnvVuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746336428; c=relaxed/simple;
	bh=TscNb+ijAPus78B4lAhlJIecc7QDqeK1b4PmiiwREbc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Thk4ZWjsBLWUWNkQEWwFy3w9R1GqcuOTqIWob7nt1A2FcsCaQrRjPWjjWW7lnR7Fkafl2KZ7rtim8tDUyy+6EX0irnCnd6t5X9Ytf15JB1zLMT2I6xWxozL79mJnB/PlI0MqXjyJ8tLRXFKZZCm29JPkUCoBaP+YpPCUn8PA/Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hP9h7OZH; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hP9h7OZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746336426; x=1777872426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TscNb+ijAPus78B4lAhlJIecc7QDqeK1b4PmiiwREbc=;
  b=hP9h7OZHkEpAwt/F1kv2uO7n6mBl+st+WHLR9HZJmXLcblQNJRaSU+ll
   pGlQNkwNEXaTK2m2NNezP2iXmlpbVL8RfGCNMPL0plVL1znydd7a4QfPr
   WCiZ2mEMgmJvckS9Cn9iEZOX5vlm0vDPuH9EqWNPOJz6pTubecRNKHZnL
   4N5RHe9f/uAJy0CeDrQruqnehVv8oiql45kVR4En8hdgaddn+eOOnrZM6
   E06Alasugd/SGk/I2XZP/CSWyoSNTyRTFGWrM8PiISz+OEtLmZZz81H48
   lGr2YlfwqJPNgVIaqpvRDyG3pCm2LDseBdX/keeiRtuetVFfesnd6+PKQ
   w==;
X-CSE-ConnectionGUID: z+mAPcmnSOqnkfj8HsHM9Q==
X-CSE-MsgGUID: AJhodfdNSsS/lAA3tICyFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11422"; a="59355956"
X-IronPort-AV: E=Sophos;i="6.15,261,1739865600"; 
   d="scan'208";a="59355956"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2025 22:27:05 -0700
X-CSE-ConnectionGUID: RIhau5/+TDyqaSZri3Yz0w==
X-CSE-MsgGUID: 3bt74Wd4T1aNg9MLsMWV+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,261,1739865600"; 
   d="scan'208";a="140128319"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2025 22:27:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 3 May 2025 22:27:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 3 May 2025 22:27:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 3 May 2025 22:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ion8MH0F997ghI79aQJL2LdFhtcXxLZt4QOK2Pu143XIltNH1/dABS3D67EXNxKWf4MdStDfduJaUq8WV0zV6t3lJMwHyzG6HMozobppfatv0kSGsxFaHmgmTleJlePFsv8Y/KSauKTpGw217Y1FGXt8X5tkLywjg685LbeUwgAnmIgr8HoIwpLOspDEj9Ih8e8rU1GLg/m8bAr4Sg9fKC2yRM0zPUT3Ipn4t/DRb0wWf8c1gJI7D2Qo3Q+o6cv7tUHVKMJI5YLe/Ub3aRI1BaM495cdoeTjqV11j6bBCJmb1y+3LktoYFWkwbrfmbdK/XsDiTZgLfcuWACut82tUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJVZt6kQjzLkasoOkuTq4/Q8GiviiJJLjXmSczrXQOs=;
 b=K1LDcHMQ0Fyn50d6Cam1SDY38H8cPdPbXwAN0XY5TD0d86KHSwyATTXcaAhw4mAEi5rPiSNyn8SxWxfugyIkcilCAZpV7XVbAbtmFLIcgAo0SQYQ3i4rev+BnJgE+E/lUSIgq3oOA2A5mdtKwz8XsynEsl90p5jA5S47qjv1yhX9dXwa4IqGc0eb2vcXylhvOtQ8cXXswBMZArzN7zNIzmkxgbVxge4MqwP7a4rhUiJobkCtAE1ozbNiILBShK1h4Fo7h28JaWLaS3AXpUkOB2mueI7ycgScZ1ua+/dYYsQ9BjgOOXrvvFr5SxfJu4K08xpt8wQ5ZKv49WgckwW/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH0PR11MB5158.namprd11.prod.outlook.com (2603:10b6:510:3b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Sun, 4 May
 2025 05:27:02 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Sun, 4 May 2025
 05:27:02 +0000
Date: Sun, 4 May 2025 13:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>
Subject: [tip:timers/urgent 3/3] llvm-readelf: warning:
 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported
Message-ID: <aBb6nudVcs+cqRyZ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|PH0PR11MB5158:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dea0ea1-fb04-45ee-fc60-08dd8acc4ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tQz3ia803rU8jXXp2h0e8mziyCLkcu54FfTSi6nmajWnR82zUpb+jFAawKVg?=
 =?us-ascii?Q?ZWGWqa73fMG4Okrm2YH9xB4UH3mRZDoPksTVEn1NXNA2gIRS65XdNhydyvZs?=
 =?us-ascii?Q?Nwtk0YAR4cjGKczhWIGJePftiyDi3VqKYpsmOfwIfMfyeRhYIbohYzfgPA8+?=
 =?us-ascii?Q?JisX7H+crVT1LtWEDiQlxjmQNTqXeS/9aihZm9C0Zr3K8Yg3lQr5gpUyjG02?=
 =?us-ascii?Q?Iyc+vEKB4p2v+SOmS1hD9PJFd7PcInCYanDqKbYi0morxme1CBxlOxUZGvDB?=
 =?us-ascii?Q?zOW7aq4Uht/c17AAnVSHpY6PHxQpKcRJB9pjLxgVUGXdJjyUu8lDVKu1UBSO?=
 =?us-ascii?Q?C32Nr7cas+Xa/lnsax6A5PtQjTC8rqMuiZDmUbRPFp6OT2RQ9iPJk1VGv9vs?=
 =?us-ascii?Q?oocvkPMIBo4AisoM0WgpeCRvBVjjLQhLjIVM9nRNpSLrNs+xeQzECdWHcEiu?=
 =?us-ascii?Q?m/jzoup1fDLHSBFlXWwJtNTzQBh0iDNqk4Ptl6xMy2bpxUo2P/aJhP9vp2mK?=
 =?us-ascii?Q?M08NPoXhy0zwgoSPtM+99eEmNRsVVeL93GxxI1ULthbReqBiquMSESO8nin0?=
 =?us-ascii?Q?65d6Xr6Pkc0qts/3VVep8jEfbrIF6dXGvmRJqAHfeLTXqqx0Bn4E23vxZbf6?=
 =?us-ascii?Q?ndL/kLimSbx/TNWoSQS1Ur3bmQXewXDLkHhOUIjwzkmDPGG+Y2xlCzJQnpA1?=
 =?us-ascii?Q?ssLjuxj0BUemF7JW1uhIAAUMFgQ/GE1RHlEwdrhC3jo2A6BpFKxuIvTrOXHq?=
 =?us-ascii?Q?R5h1LIbE9xIv6D++NklyrXYiizBioGaj4ieoRd4JDOmo7merPjmlap6Xah8o?=
 =?us-ascii?Q?Yh1VGOBakkBO+zf4lZhW1rnVAZMTIT6AFpnnU1r+mDRiL1XhsS7uEIawcJ2L?=
 =?us-ascii?Q?y5SbDXwsQXhN1XhXwn3Vkt80UfehwZnjtgeY1ALQWs3ShMolP7+fmukq73/R?=
 =?us-ascii?Q?54ulDJwgAeDKsag85E+Cd44nrN/JBGLsN5DkfWLCcltpS9rAdF+uyzOA7IqW?=
 =?us-ascii?Q?ys418km8GHvea0F0VSUEXHFV/hotZy3jyQeRPYisuk5o+y6FRgEn3oZrwpGP?=
 =?us-ascii?Q?UusL9tVtb6EjSomdq1+y1sDc1np+dT0Ej4PicUyO0fYAkz9oIOXu/RiXybC7?=
 =?us-ascii?Q?hkJ7y6JJdIGrmd9IqETQ7GwCX6BqPQZtGcwDKpCAvXQznxaxOBB+VSzTzz71?=
 =?us-ascii?Q?qVZI1GIaQgtcRRw8FEQkFDViZGrXF5dOSEcJC480+gKKugzYhC1aAOyFHIYJ?=
 =?us-ascii?Q?W1W0xdjzYgw18h8qfxfOGs/9LcOA3pA2IPu8IFif6q0zr3YW0enVT6PRB9Mc?=
 =?us-ascii?Q?HNb+r+ODseKoK28ioxuG7f0FFVZ8BVu/Wl4EnR0A6hdRUVrbUDywjQKnc9G4?=
 =?us-ascii?Q?L9wekhyHjLsn+0bAPP+V4QSzRcxJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ctQYIT7x26Djd/B6aLAY9jh7kPhVZifJR1Xa6tK/iFZsf0X0RoOp7eUdlkgk?=
 =?us-ascii?Q?+s0T/sVTHBO3rxe2qQE976lUKAokyyGBNJf4fGiEIG/VPZGlXrwbysrC52f2?=
 =?us-ascii?Q?iTUKaDXv9pkPqymGOnMFAuGMfUSYPaYeU6bTYyfPxduRGBPFMen/boCKKV+N?=
 =?us-ascii?Q?BlrwlrFCxOgGFl8lZUOwRJ97/X4Lxt0/ARnOFD7GzvIwf93Z8NR1R+Pqlztq?=
 =?us-ascii?Q?s/h5Z7YCLNy7Rb7co9AI48SgM4/89YtDscGolZOzJ0GkXCFOsoEYeC7ihzSh?=
 =?us-ascii?Q?AAwryZ9g8eeWJPpinwhSOP4Zia9foZTemZlEOhlYIY/wrP3PQmRnh/YUyqRq?=
 =?us-ascii?Q?zPZ22U49JkubLSh68sA5nFsV7L9uHdWq513IpmMTl1tGYJ+Ko944ZUebz1//?=
 =?us-ascii?Q?UA0wbQfvfX0CubS9zMfh9rNT0ndszWFFeutwNwvSwF81KHu1tDxTSFUk26en?=
 =?us-ascii?Q?JDDgANmwJOAtPYogb9hqKFMr0bWNeobjLPt6rsiI8h1JdKxhYyYYnWYTMIuA?=
 =?us-ascii?Q?1TOobAyy69ARwd4zYHk0Uui/vmSsh7908gnE+t488raeE9YmNZ4uQHcGX0nT?=
 =?us-ascii?Q?rRvmJhgPniX2wlnhEriFEtj2YQYyW7bdz8yO3xfLdK4blhyIN7JMp3ymkk3i?=
 =?us-ascii?Q?3HEvHrCtktbkaLAZUP64DXEeeGTSm5qSYiDi6BCTgou6JVExLUJq5IfRc7K4?=
 =?us-ascii?Q?InuLBHvLnKWMf6Mb+4XmLed14jxG5/blzNJ4/viAiCw0bDlJMVIyFPNyc7m4?=
 =?us-ascii?Q?eHUuPu9Ujf5TVGV6XKvbNdXoLOayJjvFb8Z5DdsqEM+wA6JRaKVERS+DjyHT?=
 =?us-ascii?Q?/oDPkllDswSmiW6oixzKh82HNeSoCS5Lcf+F1ZWDqkhrWO496+mB9eS/csTz?=
 =?us-ascii?Q?vhbaQ4BMh0oOX9Qc3qaHGxpZB/fFNU2hq6rY+CGIrUw/QUMJhAOBgnGXuaBt?=
 =?us-ascii?Q?rMc9917C7rODaTBK3PhxUck+gyExIvFJt4p9EC63cafR0t68JT3JZFxOwjxp?=
 =?us-ascii?Q?o6ogM5MqBaCmPf5TiGIiHugDzjSb8y+RtjwNyTWsql+1CJFpdyEKnTfxqtzY?=
 =?us-ascii?Q?CSFPJ70e/2KwHTq0EP0pCk/wvrjnbuUdFbN0kEitLFToJDjjHoNv9++2qle0?=
 =?us-ascii?Q?crO1XHOVq5scXig8ejY2rEe8J/fwlJeaVheGuYlcdi4cI23KWlw1DfBZUT0w?=
 =?us-ascii?Q?TUeXyLVfr6Hofnn+z9ByH8vi7niLerwOy4Gmd1v6jIYLLZOotu6a27iUk22a?=
 =?us-ascii?Q?5DXenCcIUbLQbt/WaEEgDC9BxFb3n7XRE0ldxxyOtKbKCvD6Wbpjt2PtCcAC?=
 =?us-ascii?Q?Gsc5EJoqJ5tqU02MpAqz+Bb9s0lylXeZYfu8CMNuBXcgUuXwaEBR0LQ0Ifi+?=
 =?us-ascii?Q?rDLhYM6uZz5lb2H9H1ewuDj6xyR2b4m4EuQPImpQuKwzjqVu++Cghq9bPVNc?=
 =?us-ascii?Q?B4bPHVB9XukyI+dt2PoNFIl3VdsbtxdTTQAjw+y/Q6lKZi9p8jsx0L5jLzfX?=
 =?us-ascii?Q?/LDPCpoWPt1lDmWRdIezaCbfp5TCMJmMX0nw0OArnwB8iyBCyyHknzKlgXKt?=
 =?us-ascii?Q?ju4K9mfXnlRyQW8qlNIkZlWTOseTpVGN8b6GsV6b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dea0ea1-fb04-45ee-fc60-08dd8acc4ca9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2025 05:27:02.5352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4tX+YivC6ZHAypcOvboFc2bJU1I8lwb/PwCBGV9h1T7N6ckA5Q6SU4i5aNrYx9s32poMGb+ah1fEUg7Kz779A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5158
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   7aeb1538be5df3efa1d799e5428ac3a0ae802293
commit: 7aeb1538be5df3efa1d799e5428ac3a0ae802293 [3/3] vdso: Reject absolute relocations during build
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: riscv-randconfig-001-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030636.3ExDB8O2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030636.3ExDB8O2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505030636.3ExDB8O2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> llvm-readelf: warning: 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported
--
>> llvm-readelf: warning: 'arch/riscv/kernel/vdso/hwprobe.o': bitcode files are not supported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


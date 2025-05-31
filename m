Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B291F3214
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 00:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748653132; cv=fail; b=lOrY+IO/9LaKTnhngaVsOW06+keqEBLd1CiMsTyvJrCu4HPalW4pQou3gwdXNixn2qYfMGFOeboBvvM5M/zTHsxK8mMok9VVAFaN+R+1rZz4LX6WHL7UMTj4I8X5OnXCv0gTwOh2gg1eizUdbeBvDeM3rG5NwmlsmAbpnz99vuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748653132; c=relaxed/simple;
	bh=P0dzFqu9IL7qnPVoqz+UH42GXcU0p6QWXq9XD1Hw/r0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ltt0Sp8+r10vIxZon5ivot8Gtr3PJOtEHpNDYG1rNZOTxEBiQMfeUwSl+o2w2S5kaZxH2p3xTIEVDZzdL3bEY8bQNIiJx2lzvJ2KMFPlqJ35b+capyyL7lG9r3WnmNz5ziK0mHPwY+TOu1w9SicrUrRxkBYXukDkDmyXUD8RQks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngJ5o3P5; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngJ5o3P5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748653128; x=1780189128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P0dzFqu9IL7qnPVoqz+UH42GXcU0p6QWXq9XD1Hw/r0=;
  b=ngJ5o3P5opUOzisVVooJFe1toph8aNjj5o2hC5/XLrHx0VSvplEEyenV
   +4T8MfwiX3jF6lB+0tEQpntlNkYAamqkPeZJDyXGasVDp93QhoWBhpF10
   L96DLNFYGkLwYypo6Exam85zPxSsCow/GtiNxC1/6XcxsadioN873vjfo
   j0Ri/F8WKNzxnpAXtzAkFVuHaYmi//efqGYOZL75Cj56CSYTD5QL31Kyy
   9txIJmooAUhxz8gEAB3IgUoFopG0yUrc5kJFyGK62SpwSDHQD00FuHi6h
   Rs5iLTG3F1/RY2kAYZc4UNnaR61agNXbpjHIaWn3VgGMMV5xAfZjZTAm0
   g==;
X-CSE-ConnectionGUID: 98RuSzX/RyiuaMV9q/DFug==
X-CSE-MsgGUID: XUQ21YijR9urY7HjqqZGvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50903442"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50903442"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 17:58:47 -0700
X-CSE-ConnectionGUID: JfxBatmmRXCGxpO5eQi9/A==
X-CSE-MsgGUID: N0tULzxbQMOZ82FE1yMMRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144489025"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 17:58:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 17:58:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 17:58:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.44)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 17:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tG9AcF+ELcJpgadlR+pt3LHU+XgsR2DkgLdkfeyekKZZsIlJUFNznukgdVTDd8bwgW15gHQgH4EHDRErM0fqYr9BYZfia17obs+xUJwWt/7XSyy455ztTQ4zE1rQMcowFDSf0Y1Tp9PHrLZbFXEW4DMAe8JaBiv5oNAYTrM14OzNlD6I/sjVFc/ETcd7blA1xsB1grmbEF+NJpEqVpYD7+LOTbnh8wfqqnN7i/FWlVv5hMuivI5fr/gSFxoLTy3rQOzMhWMvEmzztXbGNr3TQbLLEhNULeH7xWYc9z5XhbFPGJDpLkmfSZBgBp1h+Hx6SrVogd23Ve0OVkdAQy9Z5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNphCmIk6q0nHoYAhX917Qb/aZ0upI5zhKzYsIqI6Vs=;
 b=qgkuxv4toaddL8uNGQ7aOcz8nOcm+J/W6dBadFCewqYCdFS8RUHmUrNtQu5L2yvn3JRFHRABp5Ki7JbGJBXczORpUz12+A72t6jqJzXBZIpwbWRZ0U/lwRTYCsJPrsnASNHxXxHRkWeTDpCYED45wLSa9eODktlOl51LENbd0ScTaxUs9uS39NEe1cWV+RHToOl4nBjdwDYJDAZJQHxcgVEAWXdL3ooaIqa1X/dSRHKKyxFbNQB86HL8yPWT6Gqv2i79U35YVyy8AcPJ25GhA52Brb5OXABoxkhhASbT4uos9nkuP5PPqsVUpyecD1zLD68CENwM/TuEodPmoIuYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Sat, 31 May
 2025 00:58:02 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8769.029; Sat, 31 May 2025
 00:58:02 +0000
Date: Sat, 31 May 2025 08:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Xi Ruoyao <xry111@xry111.site>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /
 (loongson,loongson64c-4core-ls7a): 'model' is a required property
Message-ID: <aDpUES1NKJgCnOrw@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|PH8PR11MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 61385d79-1772-4846-a70e-08dd9fde3128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3msBGIpCbXTy38zzOOYVwANCvEpVKTH55W5iTZPoBPA+sFvsb7tAMi3GGJ4v?=
 =?us-ascii?Q?tDwSdqxfyE4KBMHLRAl1Cph9NrtXEkjJWVpotWtX0YMl6IsrQvpE7c+OLn9G?=
 =?us-ascii?Q?wqDd3+uoTWzrA1HArFEI6GkzDZth8BTMmmMAUTtyK5NhpZTU5mhovht5jvzU?=
 =?us-ascii?Q?fARyhfwh5A06Ys0VJFuL5P87/mpPkHk6TsrXH2aylQ6qxDd+ux2EtLPIKKeP?=
 =?us-ascii?Q?ztx6NLPl3NHDfLA/gHaZXjxW+HhcmaOJPLzAh3BRtj4p5LE25IZCXPXTjdTP?=
 =?us-ascii?Q?PDmmSUjNwjZskvYs0Hejx6aFcX57FjfjJINOiOmdnKNHLRPvv8/hH6hW4Wrf?=
 =?us-ascii?Q?bn2NGacNBfffrf2u0SBdgAGGPfPHBbHr895U43FkQ0/WYsIseuPkhWnGKyH9?=
 =?us-ascii?Q?iWWEUTMfvnoP8ANcY/UHkRJSaOgB4f0UcB697EWhGMLYwMHQ2p4qd33a0Om3?=
 =?us-ascii?Q?o4XHV9lCo8Jw5CtNKhp3KihPO45U8FP/22zrY0xdsfayfFjnuRVfjcMZtCBW?=
 =?us-ascii?Q?g7htyptsmrRUQbK6JJ2Ywi/zcBOvhcuJwJobfoWgi62u5GN5QloxxAccCOLt?=
 =?us-ascii?Q?UaXwqyqGugtRSykMDLWG2KX3/391aGt1Hf70Mdny+GNd9f0QtqgSEwMdiloj?=
 =?us-ascii?Q?jSk4Cmi4x4dHRzyp6eoGHTCzB5PYKXz+kwy70UYgWWpntaVsem3lX4e/8igi?=
 =?us-ascii?Q?xOA8mefODxFxHF7im3Io8daoHkt8IZCsISeOBYlq8xzA6mCSwQAw8Px1uAfh?=
 =?us-ascii?Q?1rmelvTFIKHkknzb7tMD9aNUqsM6Njn1UQJMsamwXeYXRwGMK8qYE0AewPoM?=
 =?us-ascii?Q?rMyKvd1IrzvMKF+D+pp2CpJaRvUuy3NSdTjeN4Zv3WAeskPVKr0A0YGbl7o0?=
 =?us-ascii?Q?ArRQPM7jADqbcSluGEl3iHIKeLrmLg9TNLYMmxoukbmWhnnfiPQR4ZMBJV0X?=
 =?us-ascii?Q?aOAz89CKvVJqFrvHJ/pVH4QMGFyntw7NfNtajKvopVTfzT8fB9OqJ9nMQjeu?=
 =?us-ascii?Q?YMusF3WKv3iQAMktP2DxSYnquP9tdTAVRoGYzI2jxrRHpIxVZbpwZbR781W9?=
 =?us-ascii?Q?GedtHp+epkLYpCu2Xp2a0GHII2KDjaStwP6MyUunSPruKe0C9Wu7ZXYlmWWX?=
 =?us-ascii?Q?XwRKZ3IfiZl4z9Cnl+Xq7ll6ZxF2j9az1CH+yERZ5KJOlfnfiGvAJN7yRJs/?=
 =?us-ascii?Q?YSDsLY8UoIThjmiioYHa8nHxd1L8a+DgBWvjSxyHazUOhFwz4QAxpRY40n1L?=
 =?us-ascii?Q?yBP5uS1molmsySaVtpsgr/MLs+2uv4ZwZAEEanzXZmF49GmaY/X3BkcytX6C?=
 =?us-ascii?Q?H8HWUbZHe/Zo83drwu7BMA0YlzdLmkJ+1tiAy4+K40vjMhTAJUXK1TY+okxb?=
 =?us-ascii?Q?yBvv0kIIqPtXFSzVcWlNsEqYnLRJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VEGzU/JAr8ey+bESf7NVw5k7sI3rwhOUu5VeW8No5m1WraPfk+nxjOrwVJBe?=
 =?us-ascii?Q?H7hyibzx4SJS9AYRJMB+82niGVrHaR2adbrZ7Ckimyfre80kWyAIBMrLR4kk?=
 =?us-ascii?Q?2bTfK4uJ1/BmF9o/yYeL3SH5HcP0Np2skW3gOkXWWMPL5v77SscN17J8ESBX?=
 =?us-ascii?Q?qjYxTjkjfNoALoJT9gk9kaq6ahJjYJg0pWplOc0S4IrtnKDMVNYkIImlEff1?=
 =?us-ascii?Q?WAT1+Q4R2cfKQsGFgyJOQHNs1itoZqlhIYavBR8EBV1UPBPftTeulf8Z9xvz?=
 =?us-ascii?Q?1VaB4Znbl08AsJORDSUY1CSbvYgcysj6lD6ksyYdoXIagH6kk9oJFGJfc6d+?=
 =?us-ascii?Q?T9cboNu8NWdV4H4g1C1bwovOxt1+ICMuXMSxIlsk9YC+8baKSO6+pQA+jCZs?=
 =?us-ascii?Q?Ya3c1Q+9vve2CwvBFiTlbL9yvBU27m9ff6NX3Ap1jbKwfJmv/sWutBSQeMrZ?=
 =?us-ascii?Q?kC9YMf9EGGN7879qMgOjB8NqBPz+mJ9GCNHgoNvL62DVCoJTa70dyOIhQ/NM?=
 =?us-ascii?Q?rQ215U/Q5q4DLdO91UqWo06w2BFyn70be/w2HxGIGkloaUTy66ynB6aRxQbP?=
 =?us-ascii?Q?ObpiCgr/BIF/6gm7qms5NI5kRaMOcbMNivDZYVJjxTGIkcQ6i4Ryll51stGs?=
 =?us-ascii?Q?I7bvMr+zJqDVRJ0TmYTHA12vhjfPH1BSbI7GEENs3B/+y3KXZ4R1DDSNEDTo?=
 =?us-ascii?Q?4p7aKe+UFjryxS6suPcSCXzgQplwmwnNv4dog//tgCjiSGCXIejlLVJY7ZHN?=
 =?us-ascii?Q?s9eVLpK7ItBKJFJdCRo83ZhBIjvhL0KXVSaU3POvkIh5wzHe7vDXs4JNhKG9?=
 =?us-ascii?Q?HGRLqDWpZYlFINAz03z065KW+qh44XXpaKuvXyThKzjjV0ZKQ/Ldn1Ay5AN4?=
 =?us-ascii?Q?CBwlDHo+EqWnoPAZ2cXtj9vkmDtYAiRd3qTd/jKFKDwMZaLyFYSkN67IyJMy?=
 =?us-ascii?Q?opLNPJI497XcquM5r5luXtzuBANJOZU00e6ATLX/+R2SyfQfm1G1Ws4mBMdl?=
 =?us-ascii?Q?3OC+q320vLSEIPqACRfWcKI4MCychpnSBJPU3arDF+o/91/U9m55Xug6HjSy?=
 =?us-ascii?Q?dlPba/1bEODYGsc/1MqRt6LjI45LOwb72ZGFPFUVggrfnXTzFKEoGdyfDtlC?=
 =?us-ascii?Q?JYZYRBBDUvOqSsB+g2UNIwr3RxdvMHgi4bs8CqNJFivKfXZoi7D1SudE8TzL?=
 =?us-ascii?Q?FqFP84bPFGC1xmCfE/OvYf+XJSo6VMdpj/qoJbdesmmEHW2MngQB+RovTQwm?=
 =?us-ascii?Q?W0Eoh33arX30kP/FQH3naUTwErasbGAIiVfzAJDpRw6KJNZN9RFzJc5n3NVT?=
 =?us-ascii?Q?XZ1mwJ+l8iEvNqnSM9YcXvr/UTg6JX1+btfbqP4l/xkTt0bzac/U/NX4jFuK?=
 =?us-ascii?Q?W0GmdQkftWRXE36iwTonOeDj92tn9rX4AtBRSRvKAB3QM+3TXrf6zEZonlgl?=
 =?us-ascii?Q?rZJyLD34YPeCAbJXJPtnKURmrvPPhIQ5CulyyOublUd+nrme/e+smn/aD1fc?=
 =?us-ascii?Q?LdzfVvJWZzVFWGoaKYMtequnG72WLiEtsqhms5d8mUEBVK5Q0cI5oadadW9Y?=
 =?us-ascii?Q?dFX6jPgB2ux2NqM8E2qdeyurSN1QOHVOCpr5w8QR8Js0Lrrsmvu+JEnnJJT/?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61385d79-1772-4846-a70e-08dd9fde3128
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 00:58:02.1065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JxVFNTdLuOqCOYWlMff90QrkdLaQ+A3Nx1jyIgHXOrehS1/R9CLR283tcoqxojYzz87aKCnGybpnBnl1fMmFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8477ab143069c6b05d6da4a8184ded8b969240f5
commit: 4fbd66d8254cedfd1218393f39d83b6c07a01917 MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-051-20250531 (https://download.01.org/0day-ci/archive/20250531/202505310407.oSA0i175-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310407.oSA0i175-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505310407.oSA0i175-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#interrupt-cells' in interrupt provider
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: / (loongson,loongson64c-4core-ls7a): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'msi-parent', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: gmac@3,1 (pci0014,7a03.0): compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
--
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: / (loongson,loongson64g-4core-ls7a): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'msi-parent', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000 (loongson,ls7a-pci): pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: gmac@3,1 (pci0014,7a03.0): compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


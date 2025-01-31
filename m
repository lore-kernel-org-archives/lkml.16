Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C0B156F53
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314724; cv=fail; b=tBOwEifT27ae7Dj+LaPSrIR830zH6Ow7Jp3a7qPto6DvQMR5lnZrxLSC7kTY+PrQQ6jNitK2BGmeCSyan9y+ckh3BxuIx/LnhELbdjSie2S1fG+g8rzSZ2zit2GDbjUHNZRrp7XTEqmSLSMz+qoxIGCIEV0WZo2s6ZyJfBYlRKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314724; c=relaxed/simple;
	bh=hO5lNdra7p4UpNd+QQchQMRxhK5FEjZ1/JC422GVjWE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FHE8ZrXWRS3O+BuHoTcrekNTljOGl0QdlQ52tfZsem3RxdU3sQKzvP/bhg5f++mf2tUvcdsLSQF6ObeezqEUPhfaQvsuH1OLT+tEoMOJB99BsWYzzAsmYH/qys1SwenJGeub+dps7zjWECr/KAl2tBaeKTjUJZGYnszdaq6sa78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfFMWhIC; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfFMWhIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738314722; x=1769850722;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=hO5lNdra7p4UpNd+QQchQMRxhK5FEjZ1/JC422GVjWE=;
  b=FfFMWhICJdTlnr3ne3e5qG+ju4QT5xUWWwAg+kYBQe3C3W694/4ycDUT
   vu7O8kRmPAXdpySfpTaWMUl3cKo0b5DOndaLVLahTfJsIuYvItRXdfv6C
   inqJmiV2OP/1zQertzCQ9B37vRtDjJ69+zOHBmeC/U5tRrG5IlTZqI5RA
   3Ko0IdoftCRC1QJumSwikp5/BGLVpkJ8WT7Glh1yDLr1jaqi3Av6beYdt
   pH3OJ/mff3ZtNJLY8Slrtxsc682A4RWnqxLCxySp5Xes++w53W7wL4iNT
   J19Ns6Uoy5eoMTsfDgc6TiQEtFxGP3qJt+4msm20mcJfWqV39XhXa19E5
   g==;
X-CSE-ConnectionGUID: rE7320GqR66KvdTIuxvQiw==
X-CSE-MsgGUID: ppmohcYeTQO6dS+E30zAqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49540535"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="49540535"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 01:12:01 -0800
X-CSE-ConnectionGUID: wFM/Ni67Q3anyvLzWpyyPw==
X-CSE-MsgGUID: 6YukRDlyTfG0u0fgEYDLBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113603033"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2025 01:12:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 01:12:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 01:12:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 01:12:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MA25OMwAJmku/QeFSm761l+mi488f4PdwGnA13/xO9il0yG7/wlb9OwWf0z3H94E4EsQ1VfYfK+cHPC80OXNbH8XJg4Egq+mtnrhlM62atKk3Lc6koVUlBFsnJL+avXQygXLnRCLeXCP2rWsXnc2kzjZD4RJoFrdlCKhDQR6+gs9m4tSrcn2TI7dwN/kEvF4i/7dG34TdJJz4Lcb/TfRpaJczXMSVGfjWJTxqjEimSJi/R0QLfDwgkyhdRJ9mAdwEdyFxpE3PqXhKQv7IINT/flRdhyfQz0UzjJV7Iz1yuzI6+aFcyCGasAr2Lm+quE9qmIy6gtMIl5xMdmOTZXusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FACX/obvg3lPdii/sqbh0RCIcGgGMbRhomLHjkXaPY=;
 b=dIas2Gci6H9bA0qqJHrZgraacqOLwuAVP8Mf7zHCtCOY3Krg92yd9jNstTwZkGGc3JAt0VBgt8LVAxvx03Eunr4s2JNUlXfq23jQFyuConI7m27URQ9BdsI2F6ngHTzROkYjkCQN58D5kB1YIt1OEZa/nj302se4RGNlkWqqOhPCE+KEpWu8Cqyxjrr3Jucwb8eI7EMZvVVwQbklroHCHRBfm+xP7bMoi0ghtkvhFcBZYaRk9+JE1oZgzO6qDG528CGYUMyB+bIS9IaQ8dfUQG0WE54+VkuQHXIh9DyOXi2gc55zCvSLZI45Tly+rRQ2lzrsVJT2w1kaX/e9WiNsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB6272.namprd11.prod.outlook.com (2603:10b6:8:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 09:11:58 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.021; Fri, 31 Jan 2025
 09:11:58 +0000
Date: Fri, 31 Jan 2025 17:11:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov
	<andreyknvl@gmail.com>, Alexander Potapenko <glider@google.com>, Alex Shi
	<alexs@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Dmitry Vyukov
	<dvyukov@google.com>, Hu Haowen <2023002089@link.tyut.edu.cn>, "Jonathan
 Corbet" <corbet@lwn.net>, Marco Elver <elver@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Yanteng Si <siyanteng@loongson.cn>,
	<oliver.sang@intel.com>
Subject: [linus:master] [kasan]  ae193dd793:
 stress-ng.access.access_calls_per_sec 5.8% regression
Message-ID: <202501311634.4f80fa4f-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f6e507-6ea1-4182-a193-08dd41d750cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?EXrsjjVy/HyrxLOg74WBP4IWYA3cukjs1untsr5hVyScgu+rJLUBbKlMEm?=
 =?iso-8859-1?Q?GjA6xCMIlslJPI7r48j9+dkAAwzKs2YM+dAQNH77+snVxOXxXQ3L4RuFPx?=
 =?iso-8859-1?Q?kNauCbGbmg2yZdmgNKbbUccNVrBWh2taPzibHhJZQ1m2cnDb20WLb6XbFX?=
 =?iso-8859-1?Q?a1TX1G67/Tp3gNQ3yM1zC1xP9Zm7xRK0PLRxpXFrdMCg4QkXH1g59iGmSL?=
 =?iso-8859-1?Q?kh+w5YhW+np4FlyBAREwizvorxyjRnlnPabZMbBYfOAQz880TloMmZjNJe?=
 =?iso-8859-1?Q?aN1uFzORehXqMHWFPfUV9tEOgo8s2fd24vE0K4LX4q6wwYB1aDNNoETadU?=
 =?iso-8859-1?Q?MzabqTK0lAllrP0B6HvKJrwH+OGqqPbdWrh9reUdT+iU+zQUb6kAUwy+7u?=
 =?iso-8859-1?Q?uGzenSa7gh5Kb1CSxYAYDOfVTDLMEhEm/avbaB9JhSAK7KqXrdoAi5W6+T?=
 =?iso-8859-1?Q?ut3Gdek87CNxsSOozhWxO/RDX+05MD7PGDiZOlbGLkJTvrTjTzCFAENDol?=
 =?iso-8859-1?Q?qjKGkxrMhJprpR3HELjOBeUU4HA6HbMRJH9X6Tjx93U5aU0+Yu0/dGJPVt?=
 =?iso-8859-1?Q?mMLjhFTtQlt5DhrknScdbd6u9J2hYtntNnnMImIum6jVPUI5ypWGepixYe?=
 =?iso-8859-1?Q?qFEhcgz1BEtq7TC+3CqRansGb2gPHB2cS+zD3w+0fdcT19NTUCeQHytlzQ?=
 =?iso-8859-1?Q?9645J7hCwbRn7rzZycIQ1gtXQJIQ1VsmXd0mGLXotZT6DsrqEaFV2ROU2I?=
 =?iso-8859-1?Q?GVihO1C4OVvtggBnOruflrHysEvssE3tFsxSUAmsHwbSA2j+qdMZ72ppEz?=
 =?iso-8859-1?Q?lXeLnjBYZ0p2nfA0XSuq13RQquPNsLRSDJ0AFtK8+UHaVC2Ie/NzMmVbCe?=
 =?iso-8859-1?Q?BN/SOaMF2t4XZ/riW8GmEnZjwqW8GICuIR0rz7xJjHBon/ocXU4PBhqc3r?=
 =?iso-8859-1?Q?MK0bERzUmePcqPihGQMXjG8CwMHGy18PJqiiwuP2vF+IiHXpGwztwO88TU?=
 =?iso-8859-1?Q?kbt++J8znYNmJ8EPaU8m5t3EGCbuKggfxWVpSIAaQC57vlgn9z65SnxU+y?=
 =?iso-8859-1?Q?P3PCbvTh5dis8BAAko0te4SFXQPte0b5+cfh5UQN+v+ZWZuximYK0HJJsc?=
 =?iso-8859-1?Q?1u1G9HlildaXpD1nUFXd2kYQpW1qZKBcu0cxiLz2ZtGL1u+6so0E8Tn+1h?=
 =?iso-8859-1?Q?BLlgUAc16sCL+/UAca+lHZ+GK7+TTIw3rxKCxE97qJL4RuX+aH/gs6kc3h?=
 =?iso-8859-1?Q?yX+P2ZKCXr7QsUaL3MsES5hN5vbmxmE2NIk26bGGxaVb+mcnzJjQUy6mnP?=
 =?iso-8859-1?Q?vNyxn6AeiusB3gc28n9gQdEUkhgOn8Qi/fzaMaiEsgonsks8KZ5ZeFj3Rn?=
 =?iso-8859-1?Q?45n+uw5Vnq3M6vWV8ZlT67ElMH5KfLuIwcEwGZMfVrs4C98kPJY5JTHGJ3?=
 =?iso-8859-1?Q?UcA3BWwAwWPZAPhBWjjADPn9NEvP55/eT9BFLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sJH/kDuUCMhpuCxRgd3Vuf1ovktGlyOvWopT6R+berQo3NEcBGvyDD8CRO?=
 =?iso-8859-1?Q?ryM0SssTSLP3wXnWaqjfuTJNtBYmNi2pHMQWOhd1h2TUtXkDeO/+mkcKwu?=
 =?iso-8859-1?Q?5Bsu8LwBjVurNT1c4UxwHqKqBt364T7ose5x3wib9uFwj65o6Ojh2d5VTX?=
 =?iso-8859-1?Q?DJjG6ispjkgJYe36uHPmeUfwGA6WOeFyt/bwBShghf8wMpEvGjUVnZAVws?=
 =?iso-8859-1?Q?CYtblKlLPDzJwvkgwt3vYnyCPXTUqw5jC7l34IFb16CN8/F7lIIiTg8ARF?=
 =?iso-8859-1?Q?DCFLr0v0O5U/kwoLva3rkXMDmWfhixQPHjb07BdK3AO5rRzMltYl621a0D?=
 =?iso-8859-1?Q?hy4+7Jvo+vdvBEGO1sGzhCcV2+CG5x/l4nlAkBwvyj77KQanOVZt3SH1cc?=
 =?iso-8859-1?Q?UN7Jg8zBJO5wsKVdisL1U7I2MqJ7bycJKQV6u1dEsLSfKVWdDiGWe0oSXp?=
 =?iso-8859-1?Q?XXCbDs8WeYWfFf3fZCMmH+KN9LMaJxEHrezbet5wExIrKB370pIgNdrQtJ?=
 =?iso-8859-1?Q?Irr27yMuJM4Lwv7ZAIH8anlsU7eLT/zZg7M43jgzgsxqJCXj6Hk6gDl3FU?=
 =?iso-8859-1?Q?Jn0FNQvP3VpH80ov50THKT2fsb9GKyL1q8kKQ0Qv9j5nKqM08SY/y4QXtG?=
 =?iso-8859-1?Q?Y8uOw6AkrMngoLLcrZ54c5wnfGOUvUwjFiwaxrXiLQ6xMEuqaganoNg39y?=
 =?iso-8859-1?Q?hnccJ+UyoN1ymYJfqRrU4KXSjpiUVCjy6yzOFXPOOUaFkfEnpL7CRTJDDA?=
 =?iso-8859-1?Q?ko98+oW5kw8YGp3tACfSNcmoZNuaJZjlsnrAP9bvg6r4HkCXYhgTk/keEE?=
 =?iso-8859-1?Q?sPH4qSDaLi/02Xo4k9aDArOU1mj4jZW6Qm9G/b+D6TyfGuZGAzL/cQTy4+?=
 =?iso-8859-1?Q?576bFg1kIkmPpoDZtSKaCYdDToGK6ZWZYH3Snnb70g2cuskV7QVkHj+MFc?=
 =?iso-8859-1?Q?uUxo6CwAg4kvqM/oTwle/dqrncMuOdDIIUg1LqAD2qchq2f2/bT561aH4p?=
 =?iso-8859-1?Q?EuNDlhDhCypIm94KKfVFnvYqhcxagItVlnAdEQbyfG+bfH8kDT7zw9glTJ?=
 =?iso-8859-1?Q?fVHslbYkpX1LXWHFwXdeLK8iBxUwwdUX7um5YKydCqZbl5KnJ6Lq3JouSo?=
 =?iso-8859-1?Q?811iVInj6lPyoiYegaI754m+oU4FstjFc1uAfaFc1WSJtXVlAwkMhbM0QU?=
 =?iso-8859-1?Q?ZxprKexed8XabqHVPblaUEo5tH//rb2OoujtIPH8tEcZCmlqt6EOgXdL28?=
 =?iso-8859-1?Q?W9Gj9MWD+ZZR1RvzsZforWcad05ntU6R9WdDP2F51PPBirWmITOV2kyjH/?=
 =?iso-8859-1?Q?FsHTKJsqRqFqcG8JdfVEqm1xrwbF+Fg1NEBna+4XRijnG7K+KiTz5rqMCO?=
 =?iso-8859-1?Q?151xbMZAUJJzrY7MlV1xpYrkVHyamCQHA6aQeugwRh3oCqAZz/slkeWNRr?=
 =?iso-8859-1?Q?gHQggSlKl7t2UW80soSIdeiIOeYfO8uYXGUXW4IsjYrZHODzneuqH6AqBc?=
 =?iso-8859-1?Q?CYWbGOXXmdmfwdwIPGI6yG6g2GpB5/XS7gY3ntoFzsfj38LaLIFGoC5oM0?=
 =?iso-8859-1?Q?MmvUqCJGZGuJOpBzedym6x0dcSIJU4FUH/4gcHdfFGBTuYYOXciTswlaH0?=
 =?iso-8859-1?Q?lVJwtmE6y25CLT3ve9Ml9SNdJPIjJvhPJypXBbfKEi0BprryJiQEe0fg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f6e507-6ea1-4182-a193-08dd41d750cd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 09:11:58.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA26yIfxxzVU9F6/bvKs2iUwSPncwK3LvmkSN4SGx+JvFmWpKxgyKlm0XuYeZdUH0EfWT5JG1G92y4U5soB1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6272
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 5.8% regression of stress-ng.access.access_calls_per_sec on:


commit: ae193dd79398970ee760e0c8129ac42ef8f5c6ff ("kasan: move checks to do_strncpy_from_user")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      72deda0abee6e705ae71a93f69f55e33be5bca5c]
[test failed on linux-next/master a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154]

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	disk: 1HDD
	testtime: 60s
	fs: btrfs
	test: access
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501311634.4f80fa4f-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250131/202501311634.4f80fa4f-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/1HDD/btrfs/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp8/access/stress-ng/60s

commit: 
  aaf2914aec ("mm: add per-order mTHP swpin counters")
  ae193dd793 ("kasan: move checks to do_strncpy_from_user")

aaf2914aec0fa673 ae193dd79398970ee760e0c8129 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   3600570            -5.8%    3392014        stress-ng.access.access_calls_per_sec
      0.47            -0.0        0.46        perf-stat.i.branch-miss-rate%
      0.45            -0.0        0.43        perf-stat.overall.branch-miss-rate%
      5.75 ± 17%     -47.9%       3.00 ± 56%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
     11.49 ± 17%     -47.9%       5.99 ± 56%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      5.75 ± 17%     -47.9%       3.00 ± 56%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
     33.35 ±115%    +222.2%     107.45 ± 56%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     13.95 ± 19%     +32.5%      18.49 ± 12%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
     39.46            -1.1       38.39        perf-profile.calltrace.cycles-pp.btrfs_dirty_inode.btrfs_setattr.notify_change.chmod_common.__x64_sys_fchmod
     39.64            -1.1       38.57        perf-profile.calltrace.cycles-pp.chmod_common.__x64_sys_fchmod.do_syscall_64.entry_SYSCALL_64_after_hwframe.fchmod
     39.66            -1.1       38.59        perf-profile.calltrace.cycles-pp.__x64_sys_fchmod.do_syscall_64.entry_SYSCALL_64_after_hwframe.fchmod
     39.52            -1.1       38.46        perf-profile.calltrace.cycles-pp.btrfs_setattr.notify_change.chmod_common.__x64_sys_fchmod.do_syscall_64
     39.71            -1.1       38.64        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.fchmod
     39.58            -1.1       38.52        perf-profile.calltrace.cycles-pp.notify_change.chmod_common.__x64_sys_fchmod.do_syscall_64.entry_SYSCALL_64_after_hwframe
     39.71            -1.1       38.65        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.fchmod
     39.81            -1.1       38.75        perf-profile.calltrace.cycles-pp.fchmod
      1.24 ±  2%      +0.1        1.39 ±  4%  perf-profile.calltrace.cycles-pp.user_path_at.do_faccessat.do_syscall_64.entry_SYSCALL_64_after_hwframe.faccessat
      1.49 ±  2%      +0.1        1.64 ±  4%  perf-profile.calltrace.cycles-pp.do_faccessat.do_syscall_64.entry_SYSCALL_64_after_hwframe.faccessat
      1.61 ±  2%      +0.1        1.76 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.faccessat
      1.64 ±  2%      +0.1        1.78 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.faccessat
      2.01 ±  2%      +0.2        2.16 ±  4%  perf-profile.calltrace.cycles-pp.faccessat
      1.61 ±  2%      +0.2        1.77 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.64 ±  2%      +0.2        1.80 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
      2.08 ±  2%      +0.2        2.25 ±  4%  perf-profile.calltrace.cycles-pp.syscall
      1.45 ±  2%      +0.2        1.61 ±  4%  perf-profile.calltrace.cycles-pp.do_faccessat.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.21 ±  3%      +0.2        1.38 ±  4%  perf-profile.calltrace.cycles-pp.user_path_at.do_faccessat.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     48.31            +0.8       49.06        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.chmod
     48.30            +0.8       49.06        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.chmod
     48.25            +0.8       49.00        perf-profile.calltrace.cycles-pp.__x64_sys_chmod.do_syscall_64.entry_SYSCALL_64_after_hwframe.chmod
     48.43            +0.8       49.18        perf-profile.calltrace.cycles-pp.chmod
     39.66            -1.1       38.59        perf-profile.children.cycles-pp.__x64_sys_fchmod
     39.83            -1.1       38.77        perf-profile.children.cycles-pp.fchmod
      0.00            +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.__check_heap_object
      0.00            +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.__virt_addr_valid
      2.08 ±  2%      +0.2        2.23 ±  4%  perf-profile.children.cycles-pp.faccessat
      2.16 ±  2%      +0.2        2.33 ±  3%  perf-profile.children.cycles-pp.syscall
      0.00            +0.2        0.23 ±  5%  perf-profile.children.cycles-pp.check_heap_object
      4.40 ±  3%      +0.4        4.83 ±  4%  perf-profile.children.cycles-pp.do_faccessat
      0.44 ±  2%      +0.4        0.87 ±  4%  perf-profile.children.cycles-pp.strncpy_from_user
      0.83 ±  3%      +0.4        1.27 ±  4%  perf-profile.children.cycles-pp.getname_flags
      0.00            +0.5        0.45 ±  4%  perf-profile.children.cycles-pp.__check_object_size
      4.09 ±  3%      +0.5        4.56 ±  4%  perf-profile.children.cycles-pp.user_path_at
     48.25            +0.8       49.01        perf-profile.children.cycles-pp.__x64_sys_chmod
     48.44            +0.8       49.20        perf-profile.children.cycles-pp.chmod
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.__check_object_size
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.check_heap_object
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.__check_heap_object
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.__virt_addr_valid




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


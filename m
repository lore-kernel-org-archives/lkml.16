Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1513C0C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537237; cv=fail; b=i2Wog19OkWoyZBhaZvET4pE5X2ty5tcyuyt+GVZ43eUHie8QmReKC4z2FxR7DJxbLKGq2BsA3RUWOfnCuKMKpYySO3tYPLBR4Tye5ydHoG0ozva9Mm59yELsS2Eq+Ms4V44orx99+VALVOZlfBUp601k1Feo735PNb9mFymvd58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537237; c=relaxed/simple;
	bh=gd36qG7jMdJhBZ88bGAsQUbzCQEhMX0llQkXc7GDq28=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lgVB4A/I9iwLOOonSx/oyYFPVYHCNl0Bhi11wVwNzqT55qbpFhpIl3TfwGiUxgJBOSeQqRXV2jAoJHlP8pwJH06voMhm3OHf4rytIu69M/AsprNN5AuyQ4/WPGiIcN9Xd8WNvrNbSJ1pPYIO7z0i0Sx3WHzFzFC4xHliekPB0Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2qX/I/b; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2qX/I/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746537235; x=1778073235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gd36qG7jMdJhBZ88bGAsQUbzCQEhMX0llQkXc7GDq28=;
  b=h2qX/I/bozD77uymvcoCT1HMb0zw/+lk25D8+ddY/6k2D1jP+Sb7FIUn
   ie9Z+yb2deBzA4tgNp91jJhi3u7P5KHWT5KQLt8Pcpl4akDMeOirdJGPX
   d08V6jr+GTCuPFB5byCBIB00at7hSHlnjTTf0lDXFfl70Am4aIrDyPG3r
   xiUqdgEUS3YsegLcfM2lfJ/je+r3kSdahVyXRNDY4NZArpzIkUeX3s8GY
   lk53e0us+ASmhhuMsvi+N24PEelA0Ex8BcxGO8nxy0nyQXBJQhcUlsE2+
   BDa6qcPvrp62I/2jl21QAuryHnS3c+oZRTUTeD+e4FG51xJI3kVZ0mAM8
   Q==;
X-CSE-ConnectionGUID: jsWKgOQUStiDCu2AYELYjQ==
X-CSE-MsgGUID: LJf+6etUS3yujnj7kgJ4VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="51854016"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="51854016"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 06:13:55 -0700
X-CSE-ConnectionGUID: YW7FTUAPTDqDndaKOctuFw==
X-CSE-MsgGUID: pD/LMl7mQnarAKPFEgvBsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136612179"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 06:13:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 06:13:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 06:13:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 06:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkUOhGMdTg5JZVLE9YhO1+jQibzxgf9LiTUEAG5l2HXUXA5FV0L6nBu5xt43uRmcGCN7ylq/6/morpWm6vAbztB7AT8T95QmKRAF8riEzcTcd2fxBX0RRTXrfuv3w2UJyfGN1ZyM7GQwjR+monOK1mg4Hd0nGyg48RbNdIPMOp9yurJcHlBOEUhjDaPmzmzVvCjcWue94iSiJAcGRF3pP/vrvGuRqTCGBiAOMpk1qx9dIdlYP/jPKUg3qHYZ6Uhr9RW85wLBWW8AU3LI6HesG5E1N11SeBcBgeube0hvfa0l9D81Cr4B1kq3AouH5yMHkbLscfQMqdaGxGi+L3VwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jCr6qI8KNp++0w/RpaRL0dLEFHmSEnjETrO34zPAWM=;
 b=Ql3UtHlpaa0ZUSZViPoz8FcGO5JmeO13g7iN9m5gAluzY0URkDNviyYlmHQ2J6RNm/JorS26Yz/rdgg8GPYpWE1U9muSM7mRkSN8whVPZ3+TtT+zvmZ2n2E47Pf5P2gieEaBTolKrRK01/dAQyg0551vziBwlnVQ/km3wH4CivWCdOZHj8r7azWrDpgO85vFy2jzpfx9XPUYkJeQLtp8rItOo+OL6MjKPa3U7Kk4rS5m/LU0HmoCXzFLxtHebLDtt2hsEHeG+jDky5KScBGm6sOqHGsiej5gDouV03aNnFJ+/MUxwh3l/44qPJO8RA76vmP0UagnK6QrM3Pd6Bm7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 6 May
 2025 13:13:47 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Tue, 6 May 2025
 13:13:47 +0000
Date: Tue, 6 May 2025 21:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb:
 spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed
 ('interrupts' was unexpected)
Message-ID: <aBoLAywAbPsDbmGy@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: f88de2a6-3725-45e2-ae93-08dd8c9fd557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?18vIgjHPWxRCV1o5p2R6rmh5RGAzqPQ217wZIHxMeWXiqObI2Q04EFyu5Yd8?=
 =?us-ascii?Q?y3Qx3jtIUtxiXud3X7D8VhmRK9DBiHAj22ziYjNoOSFvDzdh8jDIU9XOifoa?=
 =?us-ascii?Q?1Y59v0agPbJ+39pUqNpqHIz9THAQ9nUqUywB3dV8E6CfUnktetCBLxaejYbA?=
 =?us-ascii?Q?57Olxv3itjjwpmGofHcEU/926rMIsWO02lWeZKhClQNrpOvwVdVCjp0SuKJj?=
 =?us-ascii?Q?lF4Li8w+Z+kbPJ/TpDJskMqNADF8yNMXgFSEoSNZGxaykdddf8F026nD0hap?=
 =?us-ascii?Q?Nt9j6DmJwdqilCglBByh9yXPMrvjMP2BqIflpvELVtgL5QajZMQTq0LqfoZR?=
 =?us-ascii?Q?+kfPFdHNyieOiM+r2Wt3SLRaibg8V/1SghMbuoz4hX/ikCKzKs0L5f0kEL/R?=
 =?us-ascii?Q?tWLphy3nbDCmOupqKiHVYZ/aOwgo7O378wGnIOHpJukIOJ60fjusSO3XCaMN?=
 =?us-ascii?Q?cP8EC8L05Q3/HtvkhdhNuX1GRxV9eEZlwcNmsXFNAoAe9webFyb6tT/BukUD?=
 =?us-ascii?Q?ZmV95u2StinseEM7JvrfrlQZIytY7+oN3g7ph77gJyXU9gST6M0+VWmVPGTQ?=
 =?us-ascii?Q?hXg82B64/NjvbCKiZI/67VjdEQhqWKkIMo5m48xQBa500U7yng65F2meePCh?=
 =?us-ascii?Q?Bcb7k6c3IbEXqFSyNF2keeTKxrvJrOfgIbF9JebinGu7dweLjEtoqlQemuPF?=
 =?us-ascii?Q?zp/BaaUJ+QNJ3ERxRvVznjg7M+CgbMjhk9HvWqPmazkmVGyjn9BmJdZ8RNDJ?=
 =?us-ascii?Q?h4tMx0FZm3oodJM6hDbP0aZXU0tVerCzQ6cNu0Gii8Nw5et7t6UJ/1i9tagQ?=
 =?us-ascii?Q?TUtP9MNL9mgYqrsNeNytaiXwWLg557GRVOewOplepf7cfz+eHAmacd4ooPoZ?=
 =?us-ascii?Q?46tnc2IaqJJ4/6lNkZWjIBUOXEUJnD1BBkPRnj40HIvIfStrzteoOT3dFjwQ?=
 =?us-ascii?Q?yeV4i5dP6onlJ6Jhe3NJn9Z8VMjkopGBJ0kkkirtR7+ZWxxa7FtUCEEl6OiC?=
 =?us-ascii?Q?A2yvk/vQiyO6UZq7a9MBknrfgD1W92eGsNO++kYB1WwMRqGFiEdORWkX59aG?=
 =?us-ascii?Q?ax2s/FZFWe7oFe9m+QcILGszu3VyhekJwjwVvDe1yJPJ5jQKgY8Qw3oD+HS6?=
 =?us-ascii?Q?o5zplV9R0T6XhsSiZCaSCEycEkox2BXp0B0519mFbl6w+DXEeBIe2udLed2A?=
 =?us-ascii?Q?0+xvUeAAWjoqmMP61f9PMvet8ih3fa5lW1HzRK8fawP19uOcVA5QXqhXbd7Q?=
 =?us-ascii?Q?VSd8nsaESJOsRQuEe/1diRZjidf3riAu37M9+sNqDwT/jX8GSTla9tpYgDIH?=
 =?us-ascii?Q?gJX45LINRv4DmxlPQeyC+112EJKAFrrW8CAIugQpdj0juz4DB9+AMUq9BeBI?=
 =?us-ascii?Q?BvdP202HPx8kGSEyqkxcyaQy4AqcLqBoALPbPSlCf3rcN92F6wIfkGUv5tdJ?=
 =?us-ascii?Q?EwjUwMgtrGs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ijRXOriysXZXUd9Cla3nfs5x/kR0nLAYL90sQbB26Y7CFNQoNhLLDHMbuvum?=
 =?us-ascii?Q?lYz6xyQYoPnr7Q4ArLs9wJI+qpkvI0sHMqBNHnuPpiUaCVXFe+94/ccb7MvP?=
 =?us-ascii?Q?sdkCMF3wDuPPW58eX/OzZ8rlVWhjFtbqmjdpAYUGXByz0MyG3DkpL89u9t24?=
 =?us-ascii?Q?0ebNEFjTR+qXcO3GB3G40vYGsUq6HRGMTYXxOI+lIPOn+tHFPEXjRG6gzV5e?=
 =?us-ascii?Q?iom6rO/A5AWxccmzADzbo4OpHxTejX5CcQKWNwKL1OnYeGLpPTfDcobaHbDM?=
 =?us-ascii?Q?Ca7XcfLnwWv5QsM9JEG9gIGd7WI2YNnYOKZ/5Xc30HUtOo2leogjazM2DrBz?=
 =?us-ascii?Q?A3i+iCb+Cyfh6SSUr9kxrnV3rP4p2ADHsjstvj9j0ETM40zwvnbHBCaLLTQ1?=
 =?us-ascii?Q?Zch6kOzq1aUp0ud0pSUtotfcbZf9Wm3KEIQHD8qSRRQ9zhGzgD0hAS2SgC8Y?=
 =?us-ascii?Q?F8Hz4LVd5/CU7sB8zm3zoW/gqAs5yiCilqnzZiMSgjxQIE1YaLAZVgA0VRwn?=
 =?us-ascii?Q?SE3531y4AoQM1lCQhWxl/0J4l7fTXAXWVZCyEeOJeqLwghwl2pRQfHWTZDBS?=
 =?us-ascii?Q?lJM9gS/dUbPJRXpV+rVFTQ30iJNV9Vd+aZVVFiTDK/SZoH5USp8D/H04MFtd?=
 =?us-ascii?Q?FVB3x0mziXAJ3EeVYDBwOdVqeDei7fY+SY3W996xLA+Ac1pHbghKLQ75tmnO?=
 =?us-ascii?Q?4ThNIcaapKXDn5c8A9ArOeuLjNgVunX6V6laBh3ngMKDE0z2XP2dWZ6950ob?=
 =?us-ascii?Q?TCRqDlorF5K293+UbLgrrd5v/z6Wih7JrZFEI38/kZIwtsfhrf9ML7P0Gnqq?=
 =?us-ascii?Q?tarrxlx6gAnPLEFSeP4ytRAPRdomDWqyVy6bZPiLRUE8L9nRgoZGZWfmabet?=
 =?us-ascii?Q?5SvG+Cumg+AivUDrrd3bha2eOV7d/nucHwvLZvo7lzvYk4mS2d3qHsJpBjcI?=
 =?us-ascii?Q?4SMvFoV2aO+6VOnURD4RcM7UdjK9f9ZruW51k+hC1TnLsvEmRWfuAVS0CAqC?=
 =?us-ascii?Q?UGr+NAneJjMOKqdqk25vn6KoH/vfGzbx3O3+zgIUoy/xmJVBeLHTML2cn5+C?=
 =?us-ascii?Q?YC0SABfX+c2BBi341Gbfnkf8tw9qs55YoSlx4XQC+iEbJ4mrhkLRfAGI4VKg?=
 =?us-ascii?Q?JLwxmN3GZSEz5Q+1XlT9HG9FjmfOmutIYVma84jf8+5VMwcome4gLPiSKcQQ?=
 =?us-ascii?Q?idJ4nQe4CfHkgwBoS29EbhDMqV448G6CjSrWUhu0vAsAF7zRC8dhzQwMIS1+?=
 =?us-ascii?Q?gw4eu8p9MMwS7GsIbKT4usVaSHAiIn9fML2SI62nfh1fGOHzd24twfSUPKzr?=
 =?us-ascii?Q?r9ZzQtzs4kIMPkwh1c2Irqt6erzDIH1zO0Ipe06zqp7O+Kn9a+lGp90AFdH8?=
 =?us-ascii?Q?ARFgZEHNfQCsFfef5SHB+5MRoV6bX434z4UAwt1asjpzdBPvSvO3w2shQKnJ?=
 =?us-ascii?Q?BfW2arJyOdv9CsuzPWYfu9hXuAuslyNIdVM4JVLySucNhC3rnwqLslNXV3/r?=
 =?us-ascii?Q?UU+VQgL8S+3Rx0WSrRWkbGevzr8feH7wkbW19ava4Ze845fwRy9VgW3GvXQF?=
 =?us-ascii?Q?BEn/K2AKZBgM+G+/BHQRIuUI4z9d+KalNKQyKWV4kQX2b+xqAmpL1iSjNEFK?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f88de2a6-3725-45e2-ae93-08dd8c9fd557
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:13:46.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jJHwPM9veFJFXm8/MP6Z5PNvTQhQHsG/AK5N6K7pfkDmPtQ0KNuIm99T3O8rUUj60XcS+R/Rl3owBPywV7J8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   01f95500a162fca88cefab9ed64ceded5afabc12
commit: 321ad586e6073e33dd576ec33ae1803db3b1e717 arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2051-20250429 (https://download.01.org/0day-ci/archive/20250506/202505062001.h4c2eK7p-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505062001.h4c2eK7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505062001.h4c2eK7p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: pmic@6 (mediatek,mt6319-regulator): compatible:0: 'mediatek,mt6315-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: pmic@6 (mediatek,mt6319-regulator): compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator'] is too long
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/spmi@10015000/pmic@6: failed to match any schema with compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: dp-bridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: pmic@6 (mediatek,mt6319-regulator): compatible:0: 'mediatek,mt6315-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: pmic@6 (mediatek,mt6319-regulator): compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator'] is too long
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/spmi@10015000/pmic@6: failed to match any schema with compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: dp-bridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


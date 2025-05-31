Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461AD517
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 00:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748653134; cv=fail; b=ZlVr1CmjnxqxQd5W+6waXLWhqrGtHl3A1ujF8JgIE0QU5xw/SP30LGsDVlkm6piTIQ5ybwTm9+kwCjSNMErsC2NPc9akFf7CffY+y//DcJYZlTWmOEobvkGosWQnpY8j73DflogvglWE08mba4dW6LLDrUAphoygGDymEcXNLXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748653134; c=relaxed/simple;
	bh=uf0HwgKS86g5wSuZR29QQINdnAPhbhvZqcptuSgx+4k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Sxgsk4uEDUPqEL8q4T2mx1+gyHqPTZKB3czDs4dnR0TBJVCpmKxrG1EwewDGwSr7PsGdAUFW8c5mw91NKep1ZkWE49VgMRR3OzH1rnRPt5jA9iCQQEccormL7Tt/I+OvWn2qeYzBnECYwFBQcSeO756uWuJfkNdVIY/S74OTAAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZXM+gE2; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZXM+gE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748653132; x=1780189132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uf0HwgKS86g5wSuZR29QQINdnAPhbhvZqcptuSgx+4k=;
  b=CZXM+gE27P3x/xzdq1ZQ7h+p5MvmwsXwcnXFq9vi9kbHoh3QF0BNAN6j
   iNAnRBZRL2ONmMsapPc7pTih1vAey9l5Jss+MNzwHzcrE+yNWqhvUHQmE
   M/wDcWiTVN1JTL14NyT4wVL9I7uUg3CoJdHO4BxhHf/hTuqzYtP5jRcRt
   Njb6rdgPf4/c92Yop5mBtllAccY2FN7spYjO0Q/X+E1A+pYlH0SJD1BFz
   nPInHLvejr3qB3DURXnpqEGV8iLASb5QTOC+29d63UGOs4B7f8jWPvShB
   X2bQI0A7T7BZ6fy9aTC30Xj9/3icGs/BIipG/BIJW58AdjjYoUUB8K2/D
   g==;
X-CSE-ConnectionGUID: gAGk4w9KQB6uUFDPu23ZXg==
X-CSE-MsgGUID: V+JTfVPERdqV5PrPqrg9cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50903450"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50903450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 17:58:48 -0700
X-CSE-ConnectionGUID: gSfgAcNbQzq7O8APOu6dhw==
X-CSE-MsgGUID: 7PasqngVQZqS7e9/z04lRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144489034"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 17:58:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 17:58:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 17:58:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.44)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 17:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w88OCrDX7Ym1lTSBUDxskeeuWJquJmOp3tGyiC2vaFaZbJhGoe9snLgbYFH3sy7Hyn9oepgYLUeZk40unlfAYpShh+YdpQFd2QpuvSjpiWKnN7kYU4ShzQwbmZKX8YzKzm+2i2x5AlWhfxVeXdtykG8N1qIyZUU+mJVpIqRk1iG8TjjE5SkusAotKHb4PUKs6/VKi68S0LUAp053Ff3C6VVEyqrjT2SR+SS753yW3Hbs9BMgJOGEMyruBwFulaVeK9u2uCZRHr8ZF1OMDPdwBzMVYO7xgw31VYwTN+EYQot6ORXXKEQBBSKHZF8eXGjlWyJl30ZJQY/MQT4Lgns1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8hAJX/koCPoPbpjdL1DaLvE08z8yowSVK++hYIpa4Q=;
 b=wVzgoffPKNB4gj+7DXfle7BO3Wz8gs2jNE20/2B16l7ohn1O1WX9z0ZPoThhMPNCwz+MVNQxh6nRzQideuKLTw84d7z+Mudj2weG6+MK1QhwB5c6cN55qcZXeNKtB/f9nufCPQPR5YJUusP2E5VgzhTQ8wI9+P4BrU/YqdhW10B1o0Y7DuY8WcGYyUtwzS1waiWz15CSc2vg+iGDY6e2YupNJFmJHooAbf5mfblQcfdz4SX/PBCN4vGu8kcxFxsw7RFfPzQwCFNe5Lq9Bnc9qlFLbhpZRqbMHO5p7oBOa41fdsZtCtYBpyikg/QW2MYEO0qzJCf5bwhsEfOwtbHRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Sat, 31 May
 2025 00:58:23 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8769.029; Sat, 31 May 2025
 00:58:23 +0000
Date: Sat, 31 May 2025 08:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /
 (loongson,loongson64-2core-2k1000): 'model' is a required property
Message-ID: <aDpUJm4clvdF5+9b@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
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
X-MS-Office365-Filtering-Correlation-Id: 2e4c6930-7701-4984-132d-08dd9fde3e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PyeA8TwpHItTijv1pEhweuBrNnN+MT1arRKOZ7SrbeZOCMs5Qdl6fz9US7s+?=
 =?us-ascii?Q?kZMRiUVp9mOdGcMC3tPxAsDIN1yoZiolDtLZOO7xSCgox4uelOC30LOJ8NwR?=
 =?us-ascii?Q?m9qCoDYZwAXRHOCb2mvZOAen9a2ek776KVsYn17r3x8iscfKwLh1ospGKzid?=
 =?us-ascii?Q?Apjklc93GbXvjAc1kKmp10AYXVvUjvyu6SNJgzOIQVxl+klwKz6XrB/29dyw?=
 =?us-ascii?Q?ya9WNJVqS7VCZJ54Gwsj8QscBPMyGHrpXn3kgXk5/IwM1cIPEFSXeGuc1HfD?=
 =?us-ascii?Q?tEEczk7qOIw9BwpVHovV25vntQn2Mn9qaXcOinQfjGdxSnieqI3WYfy/fKgY?=
 =?us-ascii?Q?WXkqUswr9keWB+Oy+0uoFOkGmwr9Cx0Uu4RHTsQPyzVecFlPujPVWo714YqC?=
 =?us-ascii?Q?qd/yc00snai4NmxkJtLdUZ8PHWAwNKgykC6Viwvv9a34ZYKWsc5fSYBqqDr7?=
 =?us-ascii?Q?ZFG4nv8a7ANL+ifGq2JVAWA/J8zQfzCeAAEvv8FTc70skJCdTt4ne7SUznVc?=
 =?us-ascii?Q?exrlKuLWzG7PiTU4q6K0K9kNwEpytDR7uuvlVq0H83Cn1KnlVBKz8s9JAbBv?=
 =?us-ascii?Q?hPkW78hqCDQwVE8u5KvTxQJRATcyX/+5fOCzToqonF13TQBQq8UrssvxhjLg?=
 =?us-ascii?Q?CaBdqvuQibcbmOkhjTKHkEUR4DTDdFQ7wQkBEaRevMJ7ratCzyg/tb0oRME4?=
 =?us-ascii?Q?Peyzb4Ska4dEaDitdafFL/mdEfLUS3xjFabdloLuB0quqkYxHZgpFSwHbbm+?=
 =?us-ascii?Q?x3cN2fLkDByEfY4uW2zWR+cV9uEpzgvwfsNeQgDf7uX4/T5D0Po4qP5oGAhl?=
 =?us-ascii?Q?itrlkCT+MM+4kQcJMmjAjMBZEos6jjymogo3RFLQJPDZWVQq09npZk/WNS1c?=
 =?us-ascii?Q?xe5pZKYlxA8d37Nu3mY8QjpqfdKwOM+OapOOJqdUdS2itWpLIREmdTokFrsR?=
 =?us-ascii?Q?x5FOkjgp7FvECu0TdAfCRLDqsMB1TwepzKVakuIzHwT1bQBCimbWyNhZLAQI?=
 =?us-ascii?Q?SRP9FJoFBjNhSEsH3uZ7FcvkrcUxVX4rlaM6zuunOlDCQQ4uO20C0tSMbIq0?=
 =?us-ascii?Q?URQTBvwi4cFxTqKExTY8OsNAxWIvtOd2urKMeoOGXYD9ksB+cQWJSsZylY+O?=
 =?us-ascii?Q?zyIVx0400cZyZ4rH7b0TRDLICC9MqRbrSbOmH+VmWhET9jMNnY533vPjb2S4?=
 =?us-ascii?Q?LQcD1nlUoWMLVgB63m5hagOtmKwji4ZjfpK0I0dpyOQ7GzIkDlsXstStBHuv?=
 =?us-ascii?Q?Tu+TdKAqcjlSb+hjD/k0DmeQzUbAyh06cP8AOnQE/DsebXt0U/vtpvp6AfEd?=
 =?us-ascii?Q?oxF+5LtoCLGeA6kCiDN8U2sbJMfopQjU+/TnVR/+FihJU4bUCbTG1a7Ft25a?=
 =?us-ascii?Q?Wb7RLFffqjV+uCd7gZ5Mmp0MhnKf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RBKYVh7sZg0MdrCKaPDf44TvsPaA4qg1jWIdXUioTdrh3iCjhtpA+Lpjbw61?=
 =?us-ascii?Q?qHIOwtXFnm+K+bzJcWegpLgFDwflSUbWqQBiF757WCXODjv9Xd26VXEszQje?=
 =?us-ascii?Q?W6CjaOqiAHlFL6fO2D+Hk0CvhIM9qYDlqZ+8vDnqUZd2Vy7q41tc9u++7qzI?=
 =?us-ascii?Q?K3hSNPsVOeWCcNdqoUkj8q+PqFV/U8/B230Zib3GTlBfzdUgR3YbqKZxGKkQ?=
 =?us-ascii?Q?rIi217fu6WVd+yB8DCUHl3t0be38Y64ocRJXpSRx6Zjnmz2z6mT1Pu4UG7R9?=
 =?us-ascii?Q?XJIFqQdjewfJJwm3BMHB1bBBVBNz/gZguVt023wMvS6hFtjmT7WB3LnaxlMk?=
 =?us-ascii?Q?cNStKdLLvftF8GYPx3JNO6KbLNQu5NVfJ3qolUvUa7uH4vqgPZU5dTmp5ro3?=
 =?us-ascii?Q?K6YAsJB7a2OtIcFsSjXdO3Pgu/aR/QsZ8gfm++0uDlkJ9IkWR2bVHtOgIfaK?=
 =?us-ascii?Q?lw6dWJjoGWQISjqV+f62d7/0J51zWImiPzRoeogyTfJoVVPDVqInTThss/Wg?=
 =?us-ascii?Q?0Wv+jpExaqhAXisafW3OVeTpREgjNhd60XJqSATvEdRWzjTEzcN2CR5o+gJ/?=
 =?us-ascii?Q?KHUQh89d3rzp9rLMLzf6zCQhi+1FV2RO8oUBguMMKL1M6mmv8Jai9Z3y/NOO?=
 =?us-ascii?Q?kwf12mOTSlM10ezw7lE1/1iNt9tCQrC//G7qf2g908qtOGSiPx6UNTNSWn3y?=
 =?us-ascii?Q?iMNRe4CKRmif+EOf53GVHxOYrQ8LYALwMlH+SSxp4iwXlFgAZmqnZI+U182q?=
 =?us-ascii?Q?H+fnFw9DR/xvjKu362BOluAg4c9Pbx4Yxb9bKk8bgkjGXQ2DCRlzWDC+EazA?=
 =?us-ascii?Q?i3/8d6oCl3EagcM1i4FNYZ8DCyiwO7kLQ0CGwTH2Bzn/WcOlm/wf4Upu0Bwj?=
 =?us-ascii?Q?/3EUxXo0pARfVmtpBo2xoIwbDzi9k9uIYMniHh7R5qw9iNGqFVP8eYiSxQRA?=
 =?us-ascii?Q?tVBJGd07CHbEiYFisOnC9V/b5LZD+bMWmdRHfj+7DIqF0yu5tndwnf9j6X0d?=
 =?us-ascii?Q?lkXk3NTrNNWVKXdVr62NGoerIczlZRuqd+yxd50Huk0pH4xJYkucI1goYqFc?=
 =?us-ascii?Q?nD4sTj5CSyXeqOqtMMVY5foqHaBFpX7NRp4NLwshA8ypYDA0Uxr3zSG8tnsr?=
 =?us-ascii?Q?geKni9pJJhOTGEFb1AieLJeqMpDEoXgHQ4dMZBzeiZ2kShxgnRIMsYDhWs9u?=
 =?us-ascii?Q?+iydc672sUZDXFFkAIZi+q5r7HccTFw3NHWTBURgD6CsGzEs9izER+EGSUWG?=
 =?us-ascii?Q?baiU55/goUuQEKG0PsieKMGPOPBHyRyfUXBLxwLR+2IK0+miVlbPRc5Y/LLD?=
 =?us-ascii?Q?F26UpY1UpMdoJYJI/aJ7FKXujbE21w29ovwlmxmUuAMMgExs3iXKIf+W1NUB?=
 =?us-ascii?Q?0P5C/kNNRP+m35Ng+JL5WvEsvReeM6J1rnm6OkEFBKzfr3Re2A6ZZ7k+nHp1?=
 =?us-ascii?Q?vLoVz1WlnwxjmNqsTHqbNJ38JgCwCKCZ5i9bN665kuAS8MA8x1QC8sLcpOw1?=
 =?us-ascii?Q?KsoiY56Cp9w02bVhAp9OKOYRaWHLH5Um0ALjNwiYMg3oDGrlRIrZYMcHbtN1?=
 =?us-ascii?Q?4pKDJcGNIe2UbvF65yhLqEKcseLXbVdwI0far4THlcYmqKT63RapC4Qy1kYA?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4c6930-7701-4984-132d-08dd9fde3e1e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 00:58:23.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2D/wBBWFPeestZSTwkhoGtLrFzCSbykEj29nWTIQco+4OuFiHB9pJqmklcJznJCe7MdszCoqU0xrsrrXWSE1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8477ab143069c6b05d6da4a8184ded8b969240f5
commit: d89a415ff8d5e0aad4963f2d8ebb0f9e8110b7fa MIPS: Loongson64: DTS: Fix PCIe port nodes for ls7a
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-051-20250531 (https://download.01.org/0day-ci/archive/20250531/202505310340.TVrRceKk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310340.TVrRceKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505310340.TVrRceKk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /: failed to match any schema with compatible: ['loongson,loongson64-2core-2k1000']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: / (loongson,loongson64-2core-2k1000): memory@200000: 'compatible' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: / (loongson,loongson64-2core-2k1000): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: cpu@0 (loongson,gs264): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /memory@200000: failed to match any schema with compatible: ['memory']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0: [12, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts: [[12, 8], [13, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0: [14, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts: [[14, 8], [15, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0: [18, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0:0: 0 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0: [0, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@a,0:interrupts:0: [1, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@b,0:interrupts:0: [2, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@c,0:interrupts:0: [3, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@d,0:interrupts:0: [4, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0:0: 5 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0: [5, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'device_type', 'ehci@4,1', 'gmac@3,0', 'gmac@3,1', 'ohci@4,2', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'sata@8,0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0: [12, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts: [[12, 8], [13, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0: [14, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts: [[14, 8], [15, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ehci@4,1:interrupts:0: [18, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): ohci@4,2:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0:0: 19 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): sata@8,0:interrupts:0: [19, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0:0: 0 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@9,0:interrupts:0: [0, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@a,0:interrupts:0: [1, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@b,0:interrupts:0: [2, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@c,0:interrupts:0: [3, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@d,0:interrupts:0: [4, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0:0: 5 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): pcie@e,0:interrupts:0: [5, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass0c0320', 'pciclass0c03', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: gmac@3,1 (pci0014,7a03.0): compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/ohci@4,2: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


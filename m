Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251C025A649
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743232; cv=fail; b=N7Ti5blFFMtbo8L8H9qLHF2aHMfcbzQheq3jC+iZZTF8y8TET2ARDkCoJHd9Ghe9HX5rFkT0oIFOQwbd/x45oeaa5B1Akltuksfthg/oZrXvYZ+9RFDsx3bQtzkgIrK/lG0Qq9/zVFh4uP6srlTkdAip/Fcl1YJzsJEjQVdwedk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743232; c=relaxed/simple;
	bh=89ODV22OV/veQQ7lJvTZ/T/xBH4/+geDXWczzr6wA7A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ms5p041yDZMTQJNlPe/sJ7nGIT1h7LLsIB09TwVUeaGHcs7krC+10swkG8mqG9RxoV43IlvVgRetkZ1p8uUYlvUQ6lKKd10cPNxgmTagG93VMzvAelIpbtmbWzVeaEfBStifU4DzZJd1aNPeF3go9Qlp7bzevwqroBSy+k1fcAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMfj00Mu; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMfj00Mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738743230; x=1770279230;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=89ODV22OV/veQQ7lJvTZ/T/xBH4/+geDXWczzr6wA7A=;
  b=MMfj00Mu4BHoG+KbVHBfN1PhRudrtc945ejIgAt5JO+Kza35JSO0dnLu
   MIrlJt8uN0zbe92lOhnhmOHJqqCfdUOYPYxlhIT24SJ3ve4kSSNON+xJ4
   K3kL0OCoRC1tDKDV6f8kbKP09ESsF3Xu9JbQhVlMS5yloUV1pPf1GoORk
   EfgAz7CqJBqm2VxMuS9RtfX15Ai+37y5Pcd3+wGqquIDbsN3e3NyJYS/j
   n4noddOe6eUvPcO6T/yeC7T/foU/ou/jDTmJpl/Bvf0A3zC5FnSprqUVM
   6rFXdQbLSmYCDgFi1uDeDXtLAAQSP4tCxR+NdqkiSq7+GVnjL0eJ8jFGW
   Q==;
X-CSE-ConnectionGUID: zzGAyI5TTa2TlYcZP/k5QA==
X-CSE-MsgGUID: dPcmIAuAR9S75XHF9WFz+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26901463"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="26901463"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:13:30 -0800
X-CSE-ConnectionGUID: 7ZQRCep3SSmwNDOnTwTNIA==
X-CSE-MsgGUID: hRibgeRkTIeKOK/Q/ntcNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="110720446"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 00:13:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 00:13:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 00:13:28 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 00:13:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD1Bi9HZfI0O3HcOS9sIRw8F2/1M3BrNKguXiuzOpkarJ30YQizWfLTdI8Mffc2VKmj6hZ1XUsARKf83jo8yoOdBE6doDk9SMAys5ahWNuW61Bv6vuo+qzuC1akLB8BNoCe5TIPW5L8t/xZoADBmVE4P8/fFO1Wk6JucMUPjgIsIrRDhep4r1Pep92A0VQUeTSYjo2/nDiqINlHy9P4dIMPkXrZAipjvhAxMIm1X0Bm/J+fAbHy4F5E8G7AXjrpcJ6yAnW3pITZTnAuAn8y6E4rnUWYzUC2SPUMGg8lVyrDaoxvTGdXyKYliwV/5trwuNCee1BMOAG2BznRNrqic2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttRoPpmqFFSqUbd1tCJ/nKG2khN9/YOG+AwrsuYDMFQ=;
 b=kkCyzKBWjBXRgv03UdYTj7frFFWt/JrcEbJy3saTVqnvPWaUarrUitsg508s2iUp046ZZvFKA/Z/A6GK2XChgE8Ov7mSvyGYYGaY92daFYA8r3ueenKuc9S4W5NyX2IxLPIFiQ/jqu1dhwdCzWza6CptV90+inOzsOMBHXI+opjw0/LoHFrjbK5oWqy5WH4eRwZ8TPyLic1gOAQCEAJtNTmkfOg3ErvUra3qfpbcViBMRXq2qPa870skW83sx24ltru7UgR+OCAEw5melqfW+HaHwlaw+y+RLc0H1AgbovruRLiONpl3910iaYnDXdXpWWJFlVDrCuIGJwuMXB7uYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 08:13:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 08:13:26 +0000
Date: Wed, 5 Feb 2025 16:13:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<loongarch@lists.linux.dev>, Charlie Jenkins <charlie@rivosinc.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH v4 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <202502051555.85ae6844-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-riscv_optimize_entry-v4-4-868cf7702dc9@rivosinc.com>
X-ClientProxiedBy: KL1PR01CA0103.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2bcbd5-a54c-46b1-d686-08dd45bcf71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rxiYwEfQGrQuzTiAIGeYU/2MpurRo1i4npd6OksKgjTJixXaEgURwzUmPT?=
 =?iso-8859-1?Q?Myg7CWmwXO7aMgzc7ASLolLPYKfwkoIyTLmTMuN8tDim4X9V8jTqS+eLz8?=
 =?iso-8859-1?Q?JBIWSrNm+qQrJGZdel1DRl5k971PD+H4DXkFw7aX4AcieYbqOi4ZUsbkcW?=
 =?iso-8859-1?Q?QgkhnjT93oH8JMr9/v7J3Mg2wPYuRIBQvjW695WS2Cwxh2PWM6vmskC1dQ?=
 =?iso-8859-1?Q?fxDTHzXilkYkFhfZzxbZPB4e8QJDv5strTZdeYQIFFQpheQeMZy15hf1dO?=
 =?iso-8859-1?Q?sSQW5A2WaPTXm38aGJGz/68aXk8gPmYMER5JqMQOdZtrY4B9hsMHDKOf3b?=
 =?iso-8859-1?Q?631e+lRsA8jZqMJ6hSV/GUUHyzl4sZVliyV4QJGOAnS8KtAC+BflZoX8lr?=
 =?iso-8859-1?Q?kc2Na2i3A6XGGNg7RoTj5yoOimAwgg+FxQONikjyoe0rcxUOrOVBwl5Tl/?=
 =?iso-8859-1?Q?qFx3uFVDo9hvBc85wNIn9ZNow+zKFv6IJmzbTfnq1AdG4Ks5juAfYkPu6l?=
 =?iso-8859-1?Q?LMjucolIHb05f0K9g1gZRMtN0d4uoli1SOShuljgZqA6vOUX8u205mVpbl?=
 =?iso-8859-1?Q?hG5QxhvGShEjyQ1+nbXI3m8ZKR734XXIBnCw6UFbOFn0tpdFqEtMfRbvHq?=
 =?iso-8859-1?Q?Xrs/ZElbrc7lH0VxqYPl1nT6kCTzlmzobzTfUCkSdEGut0o406RpL86tbl?=
 =?iso-8859-1?Q?yPmuQM6MHOrXDTiou/2oAeVcDgMHEa7lBeESQ/6x/tTkr5qsM1Aqs2TEG8?=
 =?iso-8859-1?Q?bpYYWau8Cg4d0X/ckl7M8J3zzzye8TExp0FzrPVZGWPfVHn56W6DKOY/Uz?=
 =?iso-8859-1?Q?HSiGXrHaP9U3CksFhGFfnEZsGqoGYCiliRbSR+N13uKlCM2OScX7ffeDs0?=
 =?iso-8859-1?Q?xcGpaGSeFV/4zfNDuvciqqyPUgHgFKjvrXuZ08UnbsBC/2OlFtf8+Exfil?=
 =?iso-8859-1?Q?JU+rQiKcZU0VaEYEtPr9Tw7Fhw7PHDorBjdUHGi/0vyxM3Wshcdg/A8yhm?=
 =?iso-8859-1?Q?q7h1curWamqcd7T/5Hw4y3kEQgfmQ49ugT7qjPO9+y4qDnnmzOAK31Bxww?=
 =?iso-8859-1?Q?U/6q0kPhgYNo6O6cHprpeEon8jQ8zm0o/Y5gnVyMUYu0tPuFtMRB9LOSJQ?=
 =?iso-8859-1?Q?lgDMliZyED68NBJJ9LjMqnSKA+5nBdomUalW5j07nRMQ0KG+7fpb5stAT/?=
 =?iso-8859-1?Q?wnw2+8tvCuxEFSciXiqfM25lRpQAXHnqjUID9p5Fmi9FSjW/2mki+LVvrZ?=
 =?iso-8859-1?Q?4FMG4YmJ4EZpGojOBPkilNaYm0rK1tbngwvSHisVYv7CFknSQbLlqrZPJH?=
 =?iso-8859-1?Q?wS3Qm7Rrihc6i4KyEGblG4RkrxKM4oH/vbzGTJ2MNqTr1uiHAB7Ea9ePwT?=
 =?iso-8859-1?Q?YJVyYpKgI3iQOfpK9R+zf16kAYYhJADA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NChf5jj4h7U9eMOwjq0y3tcYELyKVIfXi4ZJrI3vx4fDdSBfJvS+TFbKXK?=
 =?iso-8859-1?Q?OVsz3rRLA45ogbtwAZg5GNkD0Lfr34MeB2QeCh3XITZJ+fjUKNlk4X8XIW?=
 =?iso-8859-1?Q?vE2DEHXEKo0xiLIYCC7MURYphBV02Xbxz5DoVLsozIUUjgArxZ2Na3OPes?=
 =?iso-8859-1?Q?GGuwr3nbiSF4t7JMNcDNQP2M+RYldbAfPVR1yZNSX9BJFvA4O64jkz/BHM?=
 =?iso-8859-1?Q?5EZ+PpZvNqiVOazJoJCkTf2nMARNsv7Iowf1lKRa6JGI58hp7eWEhwK1Wk?=
 =?iso-8859-1?Q?s7ADu17/rjUeYq6lC+IpGG8uwj3Kk0uadME29dShQ4pdGSZWr4y7o2Iam6?=
 =?iso-8859-1?Q?KGanoiLxkIgEcPn+yISILV3E7jCoaXgQU7fSFS/lnjrHKHDfIGxpCKbxUN?=
 =?iso-8859-1?Q?5Vpzjl1FpOuLtRIGuq0DOwqjCFJRRC93+Z5Y0gFmDa1Fl6tI3W8FW7wN+C?=
 =?iso-8859-1?Q?0hLXj3BkPrv/VcP+SPi+LvZo0Q+CpuyiP+PTwgs7H4olZQVTKMRD46GI0p?=
 =?iso-8859-1?Q?mH89Tirk9DDeqFpK5Z8iITPJw6sAydaymBTIoL9pSHZM/HlFgg1lucCIM4?=
 =?iso-8859-1?Q?aQ9hgBlV03yjb2h+QugySUxN6bLrtA0OpI5fjZluoTmTdTpLzBbPv1VSTR?=
 =?iso-8859-1?Q?dGG94us9F/hN0MNK71tzzed7UTiOfBQnimT37Ew3eOE15oVcKdU27Xy/ml?=
 =?iso-8859-1?Q?aic8FwjjGbpgRW4eepIr0Xa1yhLRi71SnKAXwBeHAysFEKirJAc4xsygaJ?=
 =?iso-8859-1?Q?djJ8a7nxQztpWWfe9/wLR8ir46hncRQuL8LynHnuRr0SOAAplDSQ6WB4eS?=
 =?iso-8859-1?Q?OU1ood0vvetJin/9ZjXbdABXRlhGC46fJ2CXhKkA8rfsxWiNyLt8/E908b?=
 =?iso-8859-1?Q?ZJDN4fgzYGefuBxx0Bw8Wq9sPA2R0pNlAnkFxSDSRVNtiaDS2ux0xUBs0G?=
 =?iso-8859-1?Q?6zib5dZLZBjxl4ZuNbv1J7BdE3Tdx3T2oc2Ce22mB5Qdt2yHpykfimcfl5?=
 =?iso-8859-1?Q?IjCuVIfN4o2xDQiZoK6P2kC7gmyY5PDPVEMCD9y7yku0a85OORtcMlOIUF?=
 =?iso-8859-1?Q?7ajK2nvb9uzVdu2PvSQGNKfrM1Yhyrrdgp3YjMJLLBVnn38mDdTu7yZnDL?=
 =?iso-8859-1?Q?sdd37lv98U3Q+XvU6BxecBgg3yCWx//yoMFAkkyVhbEPiGE/N5L1aSTKyq?=
 =?iso-8859-1?Q?EPvI5ZOJDuC4xeRiv7ottO5hT/SBgAQuyZf9UivQjTFQljmYsjKh2fMP0n?=
 =?iso-8859-1?Q?WuRzHQsZleB53E2DkigPSMrXlj+yOEFV8qJf3d3x4UaEX2Ph5d3psHU4eC?=
 =?iso-8859-1?Q?5wg3lM1DSFcnRemIChBs+ojp9gENcRCpHbgmwjjznHCiHfXCXCeBq2Oo90?=
 =?iso-8859-1?Q?PPNoLw8MzDMsof+SFRHx0RDWuZ+p19UceZsRKyyYjMZou+ZAezbnPMWjfx?=
 =?iso-8859-1?Q?U1ETWWDbCWjFl5+6FkJ66v37YkBDryMh3v8+FKTmoI/9HRyVenrXGfXLkd?=
 =?iso-8859-1?Q?2aRMMNB6fJ4sZ3bbOjhla4ebdmjF4Z+eOIlQRXtCZufCjMr7hRAjwKgjsi?=
 =?iso-8859-1?Q?iaB67HnIdpZQFJOzmIUG0rQx4rVFz3kTvR89ZGYF5YZhssoqPmkokpzqUZ?=
 =?iso-8859-1?Q?XqRFsK5xvT5FLVnxVInlY0gSD0iDIKVHvniFXgFIdlIakxRdS5/2llOA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2bcbd5-a54c-46b1-d686-08dd45bcf71f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 08:13:26.0020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WKd14mMNjK+EH+ecd/cN0mZkv4INsPO7m4DoqzZZU3PLNWHbMl/83Myv+w5noTarSVEaC9wHheT94d6SS8AuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 1.9% improvement of stress-ng.seek.ops_per_sec on:


commit: c1bc35dd5bf6c7fa86a936a4fbe3b8d92fbf8641 ("[PATCH v4 4/4] entry: Inline syscall_exit_to_user_mode()")
url: https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-entry-Convert-ret_from_fork-to-C/20250128-133636
patch link: https://lore.kernel.org/all/20250127-riscv_optimize_entry-v4-4-868cf7702dc9@rivosinc.com/
patch subject: [PATCH v4 4/4] entry: Inline syscall_exit_to_user_mode()

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: seek
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+--------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.context.swapcontext_calls_per_sec 1.9% improvement        |
| test machine     | 384 threads 2 sockets Intel(R) Xeon(R) 6972P (Granite Rapids) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                   |
|                  | nr_threads=100%                                                                |
|                  | test=context                                                                   |
|                  | testtime=60s                                                                   |
+------------------+--------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250205/202502051555.85ae6844-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp8/seek/stress-ng/60s

commit: 
  37c1871b51 ("LoongArch: entry: Migrate ret_from_fork() to C")
  c1bc35dd5b ("entry: Inline syscall_exit_to_user_mode()")

37c1871b51766a66 c1bc35dd5bf6c7fa86a936a4fbe 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    104886 ± 19%     +19.3%     125157 ± 17%  numa-meminfo.node1.Slab
      2583 ± 39%     +75.4%       4531 ± 40%  proc-vmstat.numa_hint_faults_local
    179842            +0.6%     180945        vmstat.system.in
    177.18            -2.6%     172.49        stress-ng.seek.nanosecs_per_seek
 1.223e+09            +1.9%  1.246e+09        stress-ng.seek.ops
  20376380            +1.9%   20771261        stress-ng.seek.ops_per_sec
      1.05 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     13.11 ± 28%    -100.0%       0.00        perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3.12 ± 21%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2785 ± 14%    -100.0%       0.00        perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    836.20 ± 43%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.07 ± 27%    -100.0%       0.00        perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    834.79 ± 44%    -100.0%       0.00        perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.04            +3.4%       2.11        perf-stat.i.MPKI
 3.682e+08            +2.0%  3.754e+08        perf-stat.i.cache-misses
 4.637e+08            +1.8%  4.721e+08        perf-stat.i.cache-references
      1.23            +1.5%       1.25        perf-stat.i.cpi
    603.02            -1.9%     591.60        perf-stat.i.cycles-between-cache-misses
 1.798e+11            -1.4%  1.772e+11        perf-stat.i.instructions
      0.82            -1.4%       0.80        perf-stat.i.ipc
      3902            +1.8%       3972 ±  2%  perf-stat.i.minor-faults
      3902            +1.8%       3972 ±  2%  perf-stat.i.page-faults
      2.05            +3.4%       2.12        perf-stat.overall.MPKI
      1.23            +1.5%       1.25        perf-stat.overall.cpi
    602.25            -1.9%     590.74        perf-stat.overall.cycles-between-cache-misses
      0.81            -1.4%       0.80        perf-stat.overall.ipc
 3.623e+08            +1.9%  3.693e+08        perf-stat.ps.cache-misses
 4.562e+08            +1.8%  4.645e+08        perf-stat.ps.cache-references
 1.769e+11            -1.4%  1.743e+11        perf-stat.ps.instructions
      3826            +1.8%       3893 ±  2%  perf-stat.ps.minor-faults
      3826            +1.8%       3893 ±  2%  perf-stat.ps.page-faults
 1.085e+13            -2.0%  1.063e+13        perf-stat.total.instructions
     10.62 ±  2%      -0.6       10.02 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.llseek.stress_run
      9.46 ±  2%      -0.5        8.94 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.llseek.stress_run
      0.63            +0.0        0.66 ±  3%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.llseek
      1.61            +0.0        1.64        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      2.78            +0.1        2.85        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
      2.94            +0.1        3.02        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      8.58            +0.2        8.77        perf-profile.calltrace.cycles-pp.copy_page_to_iter.filemap_read.vfs_read.ksys_read.do_syscall_64
      8.37            +0.2        8.56        perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.filemap_read.vfs_read.ksys_read
      8.96            +0.2        9.17        perf-profile.calltrace.cycles-pp.folio_unlock.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      9.53            +0.2        9.75        perf-profile.calltrace.cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     12.86            +0.3       13.15        perf-profile.calltrace.cycles-pp.filemap_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.08            +0.3       14.42        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     15.98            +0.3       16.32        perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
     19.18            +0.4       19.55        perf-profile.calltrace.cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.30            +0.4       20.67        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      7.39            -7.4        0.00        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     54.31            -0.7       53.60        perf-profile.children.cycles-pp.llseek
     56.77            -0.3       56.42        perf-profile.children.cycles-pp.do_syscall_64
     59.25            -0.3       58.95        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.12 ±  3%      +0.0        0.15 ± 13%  perf-profile.children.cycles-pp.generic_file_read_iter
      1.73            +0.0        1.77        perf-profile.children.cycles-pp.x64_sys_call
      1.97            +0.1        2.02        perf-profile.children.cycles-pp.filemap_get_entry
      2.84            +0.1        2.92        perf-profile.children.cycles-pp.__filemap_get_folio
      2.97            +0.1        3.05        perf-profile.children.cycles-pp.simple_write_begin
      6.98            +0.1        7.09        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.96            +0.1        2.08 ±  5%  perf-profile.children.cycles-pp.stress_shim_lseek
      8.92            +0.1        9.06        perf-profile.children.cycles-pp.entry_SYSCALL_64
      8.40            +0.2        8.58        perf-profile.children.cycles-pp._copy_to_iter
      8.61            +0.2        8.80        perf-profile.children.cycles-pp.copy_page_to_iter
      8.97            +0.2        9.19        perf-profile.children.cycles-pp.folio_unlock
      9.57            +0.2        9.80        perf-profile.children.cycles-pp.simple_write_end
     19.10            +0.3       19.38        perf-profile.children.cycles-pp.read
     12.94            +0.3       13.24        perf-profile.children.cycles-pp.filemap_read
     25.30            +0.3       25.62        perf-profile.children.cycles-pp.write
     14.14            +0.3       14.48        perf-profile.children.cycles-pp.vfs_read
     16.12            +0.3       16.47        perf-profile.children.cycles-pp.generic_perform_write
     14.72            +0.4       15.08        perf-profile.children.cycles-pp.ksys_read
     19.25            +0.4       19.62        perf-profile.children.cycles-pp.generic_file_write_iter
     20.95            +0.4       21.33        perf-profile.children.cycles-pp.ksys_write
     20.40            +0.4       20.78        perf-profile.children.cycles-pp.vfs_write
      6.38            -6.4        0.00        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.63            +0.0        0.65        perf-profile.self.cycles-pp.__filemap_get_folio
      2.20            +0.0        2.23        perf-profile.self.cycles-pp.entry_SYSCALL_64
      2.45            +0.0        2.48        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.97            +0.0        1.00        perf-profile.self.cycles-pp.filemap_read
      1.51            +0.0        1.56        perf-profile.self.cycles-pp.x64_sys_call
      1.54            +0.0        1.59        perf-profile.self.cycles-pp.filemap_get_read_batch
      6.54            +0.1        6.64        perf-profile.self.cycles-pp.llseek
      6.74            +0.1        6.85        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      8.35            +0.2        8.54        perf-profile.self.cycles-pp._copy_to_iter
      8.93            +0.2        9.14        perf-profile.self.cycles-pp.folio_unlock
      3.91            +6.1        9.96        perf-profile.self.cycles-pp.do_syscall_64


***************************************************************************************************
lkp-gnr-2ap2: 384 threads 2 sockets Intel(R) Xeon(R) 6972P (Granite Rapids) with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-2ap2/context/stress-ng/60s

commit: 
  37c1871b51 ("LoongArch: entry: Migrate ret_from_fork() to C")
  c1bc35dd5b ("entry: Inline syscall_exit_to_user_mode()")

37c1871b51766a66 c1bc35dd5bf6c7fa86a936a4fbe 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    933000 ± 10%     +30.5%    1217543 ± 18%  proc-vmstat.pgfree
     40.25 ± 37%     +70.8%      68.75 ± 37%  sched_debug.cpu.nr_uninterruptible.max
 1.063e+08            +1.9%  1.083e+08        stress-ng.context.ops
   1771139            +1.9%    1805148        stress-ng.context.ops_per_sec
   4608060            +1.9%    4696809        stress-ng.context.swapcontext_calls_per_sec
      0.06 ± 24%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4.53 ± 59%    -100.0%       0.00        perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    217.64 ± 10%     -17.8%     178.86 ± 17%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.67 ± 83%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3262 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    505.60 ± 97%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    217.59 ± 10%     -18.1%     178.22 ± 17%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.61 ± 91%    -100.0%       0.00        perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    502.72 ± 98%    -100.0%       0.00        perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
 1.197e+11            -4.4%  1.145e+11        perf-stat.i.branch-instructions
      1.48            +0.1        1.57        perf-stat.i.branch-miss-rate%
 1.761e+09            +1.5%  1.788e+09        perf-stat.i.branch-misses
      2.06            +4.1%       2.15        perf-stat.i.cpi
 6.404e+11            -4.3%  6.129e+11        perf-stat.i.instructions
      0.49            -3.9%       0.47        perf-stat.i.ipc
      1.47            +0.1        1.56        perf-stat.overall.branch-miss-rate%
      2.06            +4.1%       2.15        perf-stat.overall.cpi
      0.48            -3.9%       0.47        perf-stat.overall.ipc
 1.178e+11            -4.4%  1.126e+11        perf-stat.ps.branch-instructions
 1.732e+09            +1.5%  1.758e+09        perf-stat.ps.branch-misses
   6.3e+11            -4.3%  6.029e+11        perf-stat.ps.instructions
 3.849e+13            -3.5%  3.716e+13        perf-stat.total.instructions
      6.12            -6.1        0.00        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.swapcontext
     33.80            -0.7       33.14        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.swapcontext
     31.62            -0.5       31.12        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.swapcontext
     90.78            -0.3       90.49        perf-profile.calltrace.cycles-pp.swapcontext
      1.40            -0.1        1.30        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.swapcontext
      1.44            -0.0        1.40        perf-profile.calltrace.cycles-pp.sigprocmask.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.swapcontext
      0.57            +0.0        0.61        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.swapcontext
      0.72            +0.0        0.77        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.swapcontext
      2.21            +0.1        2.28        perf-profile.calltrace.cycles-pp.stress_thread2
      2.20            +0.1        2.28        perf-profile.calltrace.cycles-pp.stress_thread3
      2.15            +0.1        2.24        perf-profile.calltrace.cycles-pp.stress_thread1
      7.38            +0.1        7.48        perf-profile.calltrace.cycles-pp._copy_to_user.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.swapcontext
      8.90            +0.1        9.00        perf-profile.calltrace.cycles-pp._copy_from_user.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.swapcontext
      1.26            +0.1        1.37        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.swapcontext
     21.14            +0.3       21.49        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigprocmask.do_syscall_64.entry_SYSCALL_64_after_hwframe.swapcontext
     22.96            +0.5       23.48        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.swapcontext
      6.45            -6.4        0.00        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     32.36            -0.7       31.64        perf-profile.children.cycles-pp.do_syscall_64
     34.18            -0.7       33.52        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     96.11            -0.1       96.00        perf-profile.children.cycles-pp.swapcontext
      1.59            -0.1        1.50        perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.54            -0.0        1.51        perf-profile.children.cycles-pp.sigprocmask
      0.74            +0.1        0.79        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      1.72            +0.1        1.78        perf-profile.children.cycles-pp.stress_thread3
      1.70            +0.1        1.75        perf-profile.children.cycles-pp.stress_thread1
      1.72            +0.1        1.78        perf-profile.children.cycles-pp.stress_thread2
      7.64            +0.1        7.76        perf-profile.children.cycles-pp._copy_to_user
      1.44            +0.1        1.58        perf-profile.children.cycles-pp.x64_sys_call
      9.59            +0.2        9.74        perf-profile.children.cycles-pp._copy_from_user
      7.18            +0.2        7.35        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
     12.65            +0.3       12.92        perf-profile.children.cycles-pp.entry_SYSCALL_64
     21.19            +0.3       21.50        perf-profile.children.cycles-pp.__x64_sys_rt_sigprocmask
      5.45            -5.5        0.00        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.59            -0.1        1.50        perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.39            -0.0        1.36        perf-profile.self.cycles-pp.sigprocmask
      2.32            +0.0        2.35        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.17            +0.0        1.20        perf-profile.self.cycles-pp.stress_thread3
      1.18            +0.0        1.21        perf-profile.self.cycles-pp.stress_thread2
      1.17            +0.0        1.20        perf-profile.self.cycles-pp.stress_thread1
      2.83            +0.0        2.87        perf-profile.self.cycles-pp.__x64_sys_rt_sigprocmask
      2.00            +0.1        2.05        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.73            +0.1        0.79        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      7.50            +0.1        7.62        perf-profile.self.cycles-pp._copy_to_user
      9.20            +0.1        9.34        perf-profile.self.cycles-pp._copy_from_user
      1.22            +0.1        1.37        perf-profile.self.cycles-pp.x64_sys_call
      6.99            +0.2        7.15        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
     49.94            +0.4       50.34        perf-profile.self.cycles-pp.swapcontext
      3.36            +5.2        8.51        perf-profile.self.cycles-pp.do_syscall_64





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


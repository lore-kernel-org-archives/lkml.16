Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A709086359
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748979399; cv=fail; b=SCuW/ygyfZCl/qj2f6v8Vb7bwCKE7HNNOZJoGFlUbxJzBGNU6XTiZmn2tfU+KXDnA7BrAeTGAQl/W72y/pMEZfUh1DkNxz3l5coHuny/NfCFPALxKO1l/lIjwGaq05siBlOaWYk1qaSfrSyP9+0g4ePchaZZ7Lj6PWGU4EnKvtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748979399; c=relaxed/simple;
	bh=muC2tuUZm+oo4u3JhdiHhkffIVqGZfg+pfSaYpkxiJg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I6BO142S8fvuJFcgxK468mmDDYfTDkDYQBCNBcz8IWnNCoPzO9+Wq6p3gyeXy0B6ao6tf1y7HZiH5pNiqlAP133bYfHyUFci44I+jQJuP4mXnZe7vCzEGd++ygGML5ZSWgKbsFcJohSGTgvmeuxwBhH1ja37buGYRI0sao+FARM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuLyPVtq; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuLyPVtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748979398; x=1780515398;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=muC2tuUZm+oo4u3JhdiHhkffIVqGZfg+pfSaYpkxiJg=;
  b=kuLyPVtq2ET9Tx9pz/zAqa0bB+mJzwaCmDfC06lhMWqA1ov90aqaVhG/
   gWN8dOrnE+ZkUbtYv4exqLilVGU5x8PsFVkB2NbFLxQxfH0xd5M0zejAx
   N68kegGQDSR4weDJInLzNMdVoCxX5nb7WiD2ATLzoOrwaMcIDe/do8aAJ
   zqbDx9TJTq//c29BqTVYicGYzrNQePE/QGGgTXjY6tMvHmPL7vq8fYsKi
   0z8/HJbKt92aJLA4sUK6ElWQSG0pCLn6jzFEOo7zhDsoQ6cdt3dSFFp5l
   Blb6rMlQRPPYjw7XB0IHKH+lIZ7BGIa94vS07zqSmGmgKpm9sDNu6DTsN
   g==;
X-CSE-ConnectionGUID: PMTYzl2+THO94XI9cYJMIg==
X-CSE-MsgGUID: AlGyt/v5Si2M+sFp7gJRxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50275926"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="50275926"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 12:36:37 -0700
X-CSE-ConnectionGUID: D2hsXz1LRb6jasELq1MxjQ==
X-CSE-MsgGUID: PICEvNBpRBiuROZs5/VZ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="175899305"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 12:36:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:36:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 12:36:36 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.58) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 12:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNt94/kMMjattn3y3lAP3lxXrrpOV0AWJ3VnhJKz6EbxzvJPpQIxfHrVLNEuXutCDi+Xa+mAEcFH1vF9nCMx4TxvZe5HiC2QuzFHxQgI03aCyqkNDYLTHiMmDBUS6UEe2hSFoPnZxM2gRZm6wK+ck+LftKqaVQZW392ejfLda+VTHWygg7v+J9MMk8gHqEr0W983hThd58ffP1YDu7iHoMl3OXGgB/ejhq3VV+/3Lgq8svVpiWxrhe6FMsX8w7tPQBrIkXo1+jJYi3wT8CFknfoQN5avvHXE741vqk72hk4b32Mit7nmDG7J3OUxRuH0KwhaIuueXZU0TaZ3hg/ARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfB4nu65XDV3MPMmnHNk/oQpcG9jVYKiO5rEpoT+v2Q=;
 b=SLAQfWsY/Pp4rQlQubCgPMgMSfMfUHrJttGcV71NLnjjhIi6vPNEjgJ8/tMf2eeeiBllzjbs9NYVcdLvIq4Kp8m+jVvaU6Rbxsz3v9Rf6ykaN7NvKqkV9gl00igsVjwsIrCpgAgmUkt99VGmsEok5pV1oA+f/Ibotf2tUADVNVAAhaWlVmfv+XtetKY5jdAOfgF7cAwxbZ0MftGAINiXZv+M2M95WXu3PT3h5zXi5pRGW10RVviWIqHCFYXyYM2Q6pamDYmwazpPssiLiVdlSAos/OzLN1NyFpSIgb+KjVMjhlN07uv1/IqFfOPiuKqhJXadilfwm8noUZpIjsLR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA3PR11MB8001.namprd11.prod.outlook.com (2603:10b6:806:2f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Tue, 3 Jun
 2025 19:36:26 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Tue, 3 Jun 2025
 19:36:26 +0000
Date: Tue, 3 Jun 2025 12:36:24 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Dan Williams <dan.j.williams@intel.com>,
	Arnd Bergmann <arnd@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
CC: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Nikolay Borisov <nik.borisov@suse.com>,
	<linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>, Naveen N Rao
	<naveen@kernel.org>
Subject: Re: [PATCH 3/3] [RFC] x86/devmem: remove low 1MB hack for x86-64
Message-ID: <683f4eb8248cf_3e7010086@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250520152030.1499670-1-arnd@kernel.org>
 <20250520152030.1499670-3-arnd@kernel.org>
 <682e5029e88e0_1626e1008e@dwillia2-xfh.jf.intel.com.notmuch>
 <73120bb4-7eae-49e7-be50-1fac67d351c2@app.fastmail.com>
 <683f3c91c033f_1626e10021@dwillia2-xfh.jf.intel.com.notmuch>
 <0dbb52fb-9e37-4b3e-a247-5946f08b846f@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0dbb52fb-9e37-4b3e-a247-5946f08b846f@app.fastmail.com>
X-ClientProxiedBy: BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::15) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA3PR11MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: ab47fdcc-af30-420d-9c34-08dda2d5ee5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pau4Khci177VirHJPqcywaVJFy8rBlcEYzsEAsY4YC4IM6WFB3vFEjPLlBFD?=
 =?us-ascii?Q?aDY4HVZMzniomdhBLALY4CPpXRft2HG5bQ5q+5sVg3suxobxbaxJRClucYYG?=
 =?us-ascii?Q?ktT1T4s4qLgspdqjS6lTnjvu14WLmzXdzWBI1T+9IzdHbz1mnhtsA6pP8JQ7?=
 =?us-ascii?Q?v+4jW0ZcHFBH/IqeFaF6c0p5li9ZTXQ6FZwtkJnRdDal9M1DC4759ZjSYqru?=
 =?us-ascii?Q?/NF5UYyk8Oxj/DIFayojQ1tKQpYweTtkRZa3xRPvp13TuKdNG42MXiusw4Cd?=
 =?us-ascii?Q?/Z4IKi1d1H3dnOZyeM6Xdi9e8ymWzRzzWBIUTN60tPmZBlMdsu6GJhzhSGa8?=
 =?us-ascii?Q?wg6S/VH48B18aOj+Vm9U4m3nTJ4h5muMdHuCE0vsv7TN+9zSojUD1D2dWer4?=
 =?us-ascii?Q?mhWmajYpI7vRUovQ34jFM3HBc1LIzeX7aasBNhFq8IRgiYA7H7JS07actmt+?=
 =?us-ascii?Q?Xbw16fBqqcI149NX7GqICWa4Jcv6KkXgk2yYajgfjYov/oVeYf6jBLXBOL16?=
 =?us-ascii?Q?/nzsisb7eWKDECANKVGu2kIGjSzWCfq9y69y9TJh+MfFmsknTVzQ1KuyoRCT?=
 =?us-ascii?Q?gsXuAjzDge+GTjfdVJIeATtNvvaIBAdHlJWpkGDEKdmtAhysBY+++g6gYUVf?=
 =?us-ascii?Q?qdkX+FtlhGCBUk/mVB9dsQIf21zAq8rjC9/HQ552T1DXbiQoJArvjmyhyGaH?=
 =?us-ascii?Q?klG1AcpDbQaUIav6xzx+CMhT2//qU8y+e2za6ry3oJIKfii6MPv10ZGivKyu?=
 =?us-ascii?Q?JqQqguHsRnByMD6xVVeJDjAHlOdchYNWS22EwtetlbO5Agk31opfkgvcwmPg?=
 =?us-ascii?Q?Vxw1dUSf+LOihtOA+tJUZTsHISSnSCkS6Dzs2VGsWogzMCWpz/ERnCXz9U4q?=
 =?us-ascii?Q?P29isfFGxFmITJtRdthAAwuHjdUJcmyCejsYQDQqAhrNF9Od5sVpp2pNJUL7?=
 =?us-ascii?Q?RhNb9XAuNdvEJbwFrKsIu57+Of1uGaocdHsDTwOAM9sm6twHnUhaPwnoGnZi?=
 =?us-ascii?Q?VLyzj8WMHsKsCBbQS1NhNYMgQT1EboYt7BZRb26UrR1MdIe7mY7XWTqJoOYy?=
 =?us-ascii?Q?MXXRAjdkLNsgyQ2bQMTUnSgYaXEoprlephnxlEWgKq8S7JUqpcnTkC1viIy+?=
 =?us-ascii?Q?+AEtYhTOknTVUnsVQYVRQ9OttvS9ai+Q2HsoMn8sQySLzRF/XjGys/gpmZBB?=
 =?us-ascii?Q?OHdjOcE8Qhp+OsS9dHZ/gICCo8eHpKvGdgdgKWFVAL9ZkWPc/Xhci6I2kZKk?=
 =?us-ascii?Q?8bPhejjfm8yHHDHOIub2QmAFi5c3Uc7uGVZbkQrQF3OG4WWTEiyIPcLcS1Kc?=
 =?us-ascii?Q?5XhdfDfQ9YkfoGD/0Uo3uzrIN29z4rwZHEhlRvSZIWdIrb/X3X2qNYscsvl2?=
 =?us-ascii?Q?vGM6Wr4EBsIo9rBHJwI50PK/IAbIv9nC4IQDQ5qE8pzHXBbalyuflMj0JgUJ?=
 =?us-ascii?Q?SSE5CydtIG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D6pY+JPLGAfpgKlRCj9vp0Z6BqzYrgAyd0yijPTl/VOzEyiPZC/n+mmNk+iK?=
 =?us-ascii?Q?Dblbc5dYppZgPqLBvo7Ddu+x9TbfW6+PtZ2FCEHbCvcBdsiG0Bl68U4owND9?=
 =?us-ascii?Q?vRO/rH+VACUXC4NyB2tzweGrvl3VS4dxpmEXH+9810xZnLF0xZtR4WNjIBb+?=
 =?us-ascii?Q?1uedxa/xDMZZpCua5hUWVBmxGSHyc8k0xYhYbi5PHMkHYvZd1ViNZ0yf1WZS?=
 =?us-ascii?Q?HF+d507Nh5fiKQCZ4Xlat8oBZIC5CkUigLV9aqBHFUkCDNonhk/2qpFZ7L1i?=
 =?us-ascii?Q?3uegA0Yk6231LO/QRbD5iaWrGhW6ZpaR+ot9OmUYP1/hJqKoDmQr4aUNfFVx?=
 =?us-ascii?Q?O5UTxEil7rUFAz0n76M/M8LxU8FbPFSZBF2W/53f2Xr1gq0KsDkKNvuzTQZh?=
 =?us-ascii?Q?4sxqPQ2YKoR6jiwDIPTECw6si2rT5quKepJ+jsHvQCCcTT3IA7ela5LAItpL?=
 =?us-ascii?Q?mcop49EKas/K5v6EexTrSTMQsEmBubUIhT7xGBdPR5Iv9/lXJ5/IRaf6eKX1?=
 =?us-ascii?Q?88otq9wO3vjfDcqxD0rCPy2p2JyLm22JSJdUqOMyY8bqHHvwFR0csHcILKeh?=
 =?us-ascii?Q?vD6qiTDZeSc1sxjB9BCGyTM9DGIWuHnXJ+xJ19kTXKIG50Muu5NFt0n9axd9?=
 =?us-ascii?Q?ZQv8+hefoPPaGGmqJykVbki4+V9CrqkIkBWr8DfeupPRPThvjpYH/kKZuhOP?=
 =?us-ascii?Q?MRqMza63uTnn3WtXSMG1f/5i6bRy3RVkJOXGx0B+44R7tX9MZi7YYo4/MPY3?=
 =?us-ascii?Q?0tPXkOwsf/krSD3HJC/0eYRDYFgmNtAzJv1U+eJZ42trN/uxob2LU3FaMTeo?=
 =?us-ascii?Q?2kk9xe53kmnHjXQruyNB5+wdzCaFiCmSVAUSiE5N9otX2Ff0smTwImVzPlXG?=
 =?us-ascii?Q?WhDMW8ViOIEvcOT/7ysY6s5mB8FPFFEj1V7AEkZ6WunwXVfn0604I3BEldkr?=
 =?us-ascii?Q?kmchT8He83FFPmjQZCHjgVkLDuymPsKq8s42fZNkVwuJFFCplBvvCh7rdW7F?=
 =?us-ascii?Q?Za+yV+eJeMa6ECkfONos+JNSoYloC/l13LWKAPR9uaoL1RgC/fXz6B95EBwg?=
 =?us-ascii?Q?AHjiKvo3fVnCQurMJN7rn/DbhmKd4IVoRGAhyiwrdUhqXYNHu+1iiuBg6Axo?=
 =?us-ascii?Q?7H09NzFeb7jePyBn++eti7rphUrmAGt/D0ltQ2V1yDjpyGZDMMa/34jb09lf?=
 =?us-ascii?Q?Wfy5HP4vbbgesLlu4YxTlVdBILfh8mmt+3XCDzxXZVq1Ir0Z/9GGCUHixQUF?=
 =?us-ascii?Q?WZtXcD2Db6n1Z6CjzvE23LUl99y2a5UFvBSao2mGKhbxOwG+HXOROj/aPsZa?=
 =?us-ascii?Q?1T9mTfT4ETcL80WFNOTnexFPa/WkiAEvBE2o8uN8a/kAfGah6cWhHxC6Y0Mc?=
 =?us-ascii?Q?YyyWlh9lpI5av20ownFxNNNW5Wwd3AX+czzt6d+6xe4ckiRS8Lj/+vgLYzOd?=
 =?us-ascii?Q?ymmP2kO8vBXm1HhgDt8VGiY5XsVpixnCMxK5e8VbFb16pRhZFngeKj4ffa+8?=
 =?us-ascii?Q?bpBs4j2y44bFU10Q/2U4NrMkpDj1toJVZbcAHIb9p2J9RcHhDnWOIIP1JjdZ?=
 =?us-ascii?Q?HM4BVjq7laYtVdVTHrgrkHpWA5Un+9S1ox3SrXrIlB6PnTGRNke+ZmSqK6Xe?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab47fdcc-af30-420d-9c34-08dda2d5ee5d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:36:26.8408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEjqpG5TohgU4X4PAQ66kWbIqGEGUcuT5fB/YsrEu3mOgsgKjgfzXJe+soqC2Fqtc8AWOvtM4ewFheqpGFmxHCU//vXWY9aM7pPLFmz7Y54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8001
X-OriginatorOrg: intel.com

Arnd Bergmann wrote:
> On Tue, Jun 3, 2025, at 20:18, Dan Williams wrote:
> > [add Naveen]
> >
> > Arnd Bergmann wrote:
> >> On Thu, May 22, 2025, at 00:14, Dan Williams wrote:
> >> > Arnd Bergmann wrote:
> >>
> >> The third one maps the BIOS area at 0xf0000, and as far as I can tell
> >> the hack explicitly allowed mapping that even though it is marked
> >> busy on x86-64 since 5d94e81f69d4 ("x86: Introduce pci_map_biosrom()").
> >> 
> >> Is there any downside to marking this one non-busy and still allowing
> >> the ROM to be mapped? Would that bring back the issue of conflicting
> >> mapping flags between kernel and userspace?
> >
> > For the confidential VM case I expect the answer is "yes" per this patch
> > attempt:
> >
> > http://lore.kernel.org/20250403120228.2344377-1-naveen@kernel.org
> 
> I thought the problem here was the read() on /dev/mem, not
> the mmap(), are you sure it's both?
> 
> With this patch [3/3], the memremap() hack for mem_read() goes away on
> 64-bit, so there should be no way it gets mapped again using that,
> and the generic devmem_is_allowed() just forbids it as well.
> 
> The mmap() access in turn goes through this function
> 
> pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
>                                 unsigned long size, pgprot_t vma_prot)
> {
>         if (!phys_mem_access_encrypted(pfn << PAGE_SHIFT, size))
>                 vma_prot = pgprot_decrypted(vma_prot);
> 
>         return vma_prot;
> }
> 
> which I would expect to return the correct vma_prot value already.

My understanding is that while that gets the correct vma_prot and solves
the TDX problem it leaves the SEV-SNP problem that the range may not be
"accepted" ('pvalidate' invoked for the range) at the time the mapping
is established. So rather than try to make sure ROMs are accepted early
the proposal is just block altogether.

Naveen, did I get that right?

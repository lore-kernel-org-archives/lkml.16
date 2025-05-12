Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFEE2561BF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031168; cv=fail; b=KymAUqGfg4hFWH+ccHVQ97MZEr9E6tS0OvchZ7JCURyZGmvWxzkd6jYwKSMhjdlCIqAd5YvN0uO5ZCW4jjLp+5rcSxGg2d+jumGi+YkvnJ1I4ukQ+v9/5w1737i8ZUpqvifW6z+XGYz11aO5DbmjZCt/QqKoxIQ7+bSEbMgsJ9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031168; c=relaxed/simple;
	bh=9CAfXT30UXfMcdXIscq8KETmZL1XwMwYJ2b7uz6UA8M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uAXlaHJ0OHt/5MB3s2o2Q+xNi3boGxrEW+jgNgok1mFfO/lEmim6mUiJKayCQ0sqomkS+AlGy1aNIekZZ7qwgwdKOoZ5EIi2Njov+0tSAub/JB54IfaqCWVa1lcMRAKMYEVjhxfwBkqCImsS0VlEp08ISJV7v8oaDW2oPdjq31w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/OWyCwV; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/OWyCwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747031167; x=1778567167;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=9CAfXT30UXfMcdXIscq8KETmZL1XwMwYJ2b7uz6UA8M=;
  b=F/OWyCwVPYjwjJgUSNJaUzj28uQOqpbQ7Gq7ZeoauC+1ozvIjoPxOHvi
   dO1CvALo/TdC0SoyHpeuvidwNUI1f5t5JyPsuFbRBJigsqG5D3cVkH3gU
   CiASWpk3PPiExCAMWOiulDZaGcWLErWHpRoM7O6F1re46LxGrg3xqe0Ax
   DEF3oq02GXms63rTkrShIqd7ZqACDwWLMaW9iTXPsj2yz+zWxiR6TyGRh
   sAoYVIbQ1kob+l5aDVSX+UcelsK7FW+h2/GnxJLEunr0F0HPpko8tK7je
   Uf+Ok7uvmiWzQkCr1xLkqcVBExLOAPHWviq8Xpcu8nMrj+cWyXwIryYTZ
   A==;
X-CSE-ConnectionGUID: anlzGov9QyazOVvnnH9Xuw==
X-CSE-MsgGUID: XzV3+Y/uQta8JbzXA5DIAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="51467217"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="51467217"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:26:06 -0700
X-CSE-ConnectionGUID: 4x6vMYdrQDWWFMjZ9rZ1UQ==
X-CSE-MsgGUID: vxQgUbwmRKuqAkpxbFEc8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="168209962"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:26:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 23:26:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 11 May 2025 23:26:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 11 May 2025 23:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mya5562iBiWGYPOunVqiV5HAW2YPMVVrt6QNQ3njBqMeSVW3KGgHkygnGKsVINmjjEIB9rVPFFxjPBu4NM1T+vUkU7pA84l/4udOyRU4Dt4u6BVHsSey/6YJDMJRXO+4qj+0BVSmLtuV5ha2a2VV53NfmLDqR05p1hJS8tDxlLh1696rbn3HqnNzRK3Aw+knOqW0ifLmgEMkejdVyLKD7j90/tCVEhw+WFsrqmuTTYrtBI6i0kjC62H+CPEyZnnaooTWUDgBz/taBVP/8xLaJgQYkoRpUvogBxotOAFQAT0WMuA4i9BrB8vY2TeDMVM6NbJWMriq0abMAE58bUDRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nF0LCFnMoPEUSoZQrOZYdp217tev9/2qe63FAGRgmpA=;
 b=Kr4LW06wgAznoEv9LKye0KZYDVWE2XQnxEvdJ4+CXYXJAkbhFPtAFU/IGPzTXzCk6PumZ1GHXVpf5VjVSaK0IT8KSv8bB3W0alp2SW5V4vURZjIbIKCdt1Tlkkpj0q3j/Bl6KcNiRx89sGnYSqgywDT8FGgaXOMGthe6MlcZw2TX6DRwcPFGU0Xv7FGYVaqVASeJ1GVTm5WdDn8dhEl66vQWZbvQ+dtpyLBECMzIWMYhfoHfdu3fb7CG76AH3j/KGHSbQ1bzv8AFufttGVJQ/7YjbQwQwWHP3LafCDDAFOCTyPM1CkxnYm0oLtDmLbo99q+le1uH1REgGhwJbNyvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 06:25:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 06:25:36 +0000
Date: Mon, 12 May 2025 14:25:22 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Zi Yan <ziy@nvidia.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>, "David
 Hildenbrand" <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
	"Johannes Weiner" <hannes@cmpxchg.org>, Andrew Morton
	<akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, "Kirill A . Shutemov"
	<kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
	<linux-kernel@vger.kernel.org>, Zi Yan <ziy@nvidia.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH v4 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Message-ID: <202505121332.74fc97c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250509200111.3372279-3-ziy@nvidia.com>
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1de177-f9f5-4109-2411-08dd911dce68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5uejgnaC9JjISpJz0ZY/j/xbEi4rXwS3a+5Z/03pB2fEvbcuBQhzgE/9GhAp?=
 =?us-ascii?Q?5y5TgyJNzBfG2p7o8egmkvGPrJz+iyJcoSMm3aafYGWdvpIWqelU235FU6QS?=
 =?us-ascii?Q?AJ6B02oVsoco1FLQfGfahiPtFN3MjjzwEUt59C/Ap1ACUTVlym+ArKuzcUGp?=
 =?us-ascii?Q?gjcZkBod4Ziqum0mQqkK6DoAQalfiH5NmW1+47f3yGLVIpIn/qiVBj8na8jk?=
 =?us-ascii?Q?rjw+UNjmef6lc1S6mehg26ipW4u/KYX6AoRIOJXlFZtXqs51eyOGhrCqa8Mi?=
 =?us-ascii?Q?qOU3o7lLQzli19jkPCTw1D1I5RY+HyyakYb0RJ/V/a6QD20eBDzBhiHitSNo?=
 =?us-ascii?Q?/P0avaahFsU6eOVxBDcgPVl2C581T2S0p4w2yvIygpJpNDl3wYLczqArbSpB?=
 =?us-ascii?Q?sjiId6RD5D7VWc//LxVlyOSSBkdCG/5CAIBuZzap7GV3+hrqt9sAoNjZcHy9?=
 =?us-ascii?Q?TINws6nzEjewsY28Ss7m0QyVMxB5yLx+Zlpuck5q3VOcU1mmUFw6D0SaXDQb?=
 =?us-ascii?Q?p2//qpi0KJ1nx75cTz7FDwwTawNAj9Fvzwj7WPp1885B0WweYg1qTwZ44PCC?=
 =?us-ascii?Q?he1PH0qZeZbxpnyHZGG6VKMEo/TrGVGrVotTvdDX0voJBhRvua0WT3VgVuap?=
 =?us-ascii?Q?z9aOM2+gskALaJyZ00lv7FG+1SRE+fhXafN+WWZ16hlxglO4/Ue123LI4ZTM?=
 =?us-ascii?Q?hWg9UZiLvEKpgEvuXIpv0xu9m4LNj+nqksFjqymUVKitvMUTGdYHtLBB4JLo?=
 =?us-ascii?Q?rIMPfF3StUF/GM+FsTM/c4Go7Phmzdwa8lFivP0qzhTFd/U5u3TXjPQutvTd?=
 =?us-ascii?Q?yy5xxb3HpRX2T9BgPtYWtJ8p+u0u1143JmYHNBlQuZPZTrUmQAwGmpRxAiXO?=
 =?us-ascii?Q?8AXNVjf88dV4zWogQtBToGc/oQFlop60dUlCIrSdEYNQB/U2wghfrWQAA1KL?=
 =?us-ascii?Q?a82iucdpVw0WES7wl0EKw6/Fa5tjrj7uiKKFiNEJpD26xgE1DK7GdFp91VF0?=
 =?us-ascii?Q?Bd33q9an3FJuE1xQFbnLkBNdbkePfxOK2pR5AgyDXJaWoPrOdCY5D9DVSnOM?=
 =?us-ascii?Q?nK0krtMUhCkvufgvDiiuQd87eAFFR8A2jqChISc5biK3dJWRRubQzA5VLDkf?=
 =?us-ascii?Q?IAr/LIowFSzfrDLP69ajyUkKKyM9lIY39VAAFb8MgEWOmtKCVkoDI1wfosSP?=
 =?us-ascii?Q?5TNdoIto8MAkWOAu5o8WrEpM8Kz9CEC20rgJSbPhCZhGnpfRXy/6sUm1yyRn?=
 =?us-ascii?Q?hFF/zV1xfv15KaskMO21epfSr/omcqgrVHDS3pPKqVtLTjcLPkMFU+R1rDaF?=
 =?us-ascii?Q?ZBuK+oQXvuyzjK/6yAeO+Ogwow3/sCm5f7fPLDgwOlwMlgRhL2VxjqZpOKag?=
 =?us-ascii?Q?esy9OGWs+i2/d/BAP2oDiVp5cB46?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nhYa8flyuUBGIp37Q/wb4Xqn7NSVFlGGW3Ze9OQAO8VvDb6Kc9JNaaibr+21?=
 =?us-ascii?Q?US4HGfZk7fm7wRKdaOqpjxj5nWCrTi6BytJZXkrqG/68tfwYD9q4hi0ennUk?=
 =?us-ascii?Q?nHBJsLNSaJs2jN1yX4qHLt3lO45bdh/bJ4Zgmrsl1gpIR9CAK8GgKY7u2Msy?=
 =?us-ascii?Q?drMSdvRikTazxcmZ/843XzN3f+QCBSPmgQOFrswo0asPRtN5KLPR2XlfiW4n?=
 =?us-ascii?Q?F6ONvEiyfrGY+ru8LvxOh5JCyIGQZPKTqp2yjpfpcH53lMtnAVgClcBhyBqK?=
 =?us-ascii?Q?qkIRliHB1V0qeyogNAO3QtjTVIKIyZ96a9Bj/PSKoePMDbRUxj3zMHjYMlZe?=
 =?us-ascii?Q?4CPl6UfGPdSRvM7otwxiryE7qZsibEp0h2KFI0gYIwCzTp9UpAdHMPE7QtmO?=
 =?us-ascii?Q?jy50fdDQYYquhLRNRWMOGp/Iyc9Q7x4uClFXQSPieZWLJp1Mr+jLA/px/s00?=
 =?us-ascii?Q?2/Req4ju657TK9DH9oQvQKH5ho52gJXiAHUcDE0jODVs/Ad0bTyoBR1B18hH?=
 =?us-ascii?Q?Q03E/qukKUBHBN/NgJ8QC7YK40wSah7Km4lvi3TR623pJ7T9pVXYqF+ePVq2?=
 =?us-ascii?Q?qCCauidrqEKzFPxq3uLl+5xAa7uN+1OaDNHKsLGtIRgSBNIj6pz/jk7SPvq1?=
 =?us-ascii?Q?lhIqpBPVGCw2R3FDp5hkCqMb6uH2kbaD5Ym9zeMDV4N7pdsw70z0xXrDcu6w?=
 =?us-ascii?Q?hxFz9vZ6HEG8J/f3QVx/wIVa/uULqNr8yEbgR9rLYetS6j3b7hWXyLoCO+50?=
 =?us-ascii?Q?KWuSlaP0jiFdfPFQSmsdbjqIRZ8rfnQYw4c7NGlLAnVNux3fpQgcvBw0fEfe?=
 =?us-ascii?Q?5GG9h8gTpO11Pg45IQ6dXIDGThFpmZZnIxCOCe9KlgpJPUblzRAwsYRwHOo0?=
 =?us-ascii?Q?wWpqUmzEDXjNQphimLB64/C0V5Hf8GRWc0q4vUGB0wPcapEL+Hh9M6DJEAK+?=
 =?us-ascii?Q?QO2as0j6P+GMBXobjqbsTTtaVz9bCw//yKng6X4fuT1LH3Ge83ZxcqLgOo+H?=
 =?us-ascii?Q?hJckikynkBZntIRA33QM7r3ckhdimWI2ECYy5k3uB95L+6hoqZqfLVjaUt7F?=
 =?us-ascii?Q?7xwUDXouXU7QbiuB1BNQdQ2GLmtQmQRGFD7P6cSJPSB2z8XLgB4eTjhBxRfK?=
 =?us-ascii?Q?zuKPidgs8kJiHWLzsIyhGKWV9IeVLLW5k4ZU+ndTHHiox/WaR5JUWpmLjNjX?=
 =?us-ascii?Q?9+j2lLTN417olplU98DLjXehJRrg9wucIZYI27spmD332QXwdVK5iPHB5GUI?=
 =?us-ascii?Q?enqxxw1A79uo+9RR8K0SDKJ7/IJS7CwX0hX98ORQI+rqEOddGUNyHSAO7QBo?=
 =?us-ascii?Q?izMIrO010kExtcJU/3I8WKZgxWl2NTidnPoFG2VRgEkFR6xacNW5UsP0dWPy?=
 =?us-ascii?Q?Npu4hLe1HxoaeeFL55W5MfpZ4zkSJv3nBd5T426gNbF2Y3PXhiZNbGq7w9WV?=
 =?us-ascii?Q?XFJ5rQ4MZeTYtfETOM8b0D0h0TKAgviXnIUyHJPcDIbQSSjAiNG39edXPGeb?=
 =?us-ascii?Q?A89BxcHrAbnXfWpTvjlUN0cP45ZWGs+vVqh/CAcc/KiqoXqKHWEG4GfmDJJ+?=
 =?us-ascii?Q?n2VtdnHPa/A8l6fqcs5qnpXjpcw42Fn3SLZ6Uf+45YnST679YuqtFkee0+80?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1de177-f9f5-4109-2411-08dd911dce68
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 06:25:36.1118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5ypUvvccFr2wkyYt/lk/YO69bNoP9UjkYeT8lEuK8qRldYOFm0SGRkjgsIdbCHqsmXni4aW0AN++04jiu9l3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_mm/page_alloc.c:#__add_to_free_list" on:

commit: c095828c286182c38cfc8837ca4fec8bc4bdb81d ("[PATCH v4 2/4] mm/page_isolation: remove migratetype from move_freepages_block_isolate()")
url: https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-page_isolation-make-page-isolation-a-standalone-bit/20250510-040418
patch link: https://lore.kernel.org/all/20250509200111.3372279-3-ziy@nvidia.com/
patch subject: [PATCH v4 2/4] mm/page_isolation: remove migratetype from move_freepages_block_isolate()

in testcase: boot

config: x86_64-kexec
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------+------------+------------+
|                                                       | 8e72f4e133 | c095828c28 |
+-------------------------------------------------------+------------+------------+
| WARNING:at_mm/page_alloc.c:#__add_to_free_list        | 0          | 24         |
| RIP:__add_to_free_list                                | 0          | 24         |
| WARNING:at_mm/page_alloc.c:#__del_page_from_free_list | 0          | 24         |
| RIP:__del_page_from_free_list                         | 0          | 24         |
+-------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505121332.74fc97c-lkp@intel.com


[    0.337813][    T0] ------------[ cut here ]------------
[    0.338214][    T0] page type is 0, passed migratetype is 2 (nr=512)
[ 0.338706][ T0] WARNING: CPU: 0 PID: 0 at mm/page_alloc.c:703 __add_to_free_list (kbuild/obj/consumer/x86_64-kexec/mm/page_alloc.c:701) 
[    0.339381][    T0] Modules linked in:
[    0.339666][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc5-next-20250509-00002-gc095828c2861 #1 PREEMPT(voluntary)
[    0.340589][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.341361][ T0] RIP: 0010:__add_to_free_list (kbuild/obj/consumer/x86_64-kexec/mm/page_alloc.c:701) 
[ 0.341789][ T0] Code: 48 c1 fe 06 ba 87 00 00 00 e8 53 5f ff ff 84 c0 be 05 00 00 00 48 0f 49 f0 48 c7 c7 b3 9b 7b 82 89 ea 44 89 f1 e8 b7 71 cd ff <0f> 0b e9 35 ff ff ff 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	48 c1 fe 06          	sar    $0x6,%rsi
   4:	ba 87 00 00 00       	mov    $0x87,%edx
   9:	e8 53 5f ff ff       	call   0xffffffffffff5f61
   e:	84 c0                	test   %al,%al
  10:	be 05 00 00 00       	mov    $0x5,%esi
  15:	48 0f 49 f0          	cmovns %rax,%rsi
  19:	48 c7 c7 b3 9b 7b 82 	mov    $0xffffffff827b9bb3,%rdi
  20:	89 ea                	mov    %ebp,%edx
  22:	44 89 f1             	mov    %r14d,%ecx
  25:	e8 b7 71 cd ff       	call   0xffffffffffcd71e1
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 35 ff ff ff       	jmp    0xffffffffffffff66
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e9 35 ff ff ff       	jmp    0xffffffffffffff3c
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
[    0.343261][    T0] RSP: 0000:ffffffff82a038c8 EFLAGS: 00010046
[    0.343707][    T0] RAX: 0000000000000000 RBX: ffff88843fff1528 RCX: 0000000000000001
[    0.344296][    T0] RDX: ffffffff82a036b8 RSI: 00000000ffff7fff RDI: 0000000000000001
[    0.344885][    T0] RBP: 0000000000000002 R08: 0000000000000000 R09: ffffffff82a036b0
[    0.345473][    T0] R10: 00000000ffff7fff R11: 0000000000000001 R12: ffffea0004328000
[    0.346062][    T0] R13: 0000000000000002 R14: 0000000000000200 R15: 0000000000000009
[    0.346650][    T0] FS:  0000000000000000(0000) GS:ffff8884ac41b000(0000) knlGS:0000000000000000
[    0.347330][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.347813][    T0] CR2: ffff88843ffff000 CR3: 0000000002a30000 CR4: 00000000000000b0
[    0.348625][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    0.349523][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    0.350424][    T0] Call Trace:
[    0.350791][    T0]  <TASK>
[ 0.351122][ T0] try_to_claim_block (kbuild/obj/consumer/x86_64-kexec/mm/page_alloc.c:616) 
[ 0.351662][ T0] __rmqueue_pcplist (kbuild/obj/consumer/x86_64-kexec/mm/page_alloc.c:2280) 
[ 0.352211][ T0] ? string (kbuild/obj/consumer/x86_64-kexec/lib/vsprintf.c:718) 
[ 0.352641][ T0] ? string (kbuild/obj/consumer/x86_64-kexec/lib/vsprintf.c:718) 
[ 0.353067][ T0] ? move_right (kbuild/obj/consumer/x86_64-kexec/lib/vsprintf.c:?) 
[ 0.353553][ T0] get_page_from_freelist (kbuild/obj/consumer/x86_64-kexec/mm/page_alloc.c:3178) 
[ 0.354182][ T0] ? sprintf (kbuild/obj/consumer/x86_64-kexec/lib/vsprintf.c:3039) 
[ 0.354632][ T0] ? prb_first_seq (kbuild/obj/consumer/x86_64-kexec/kernel/printk/printk_ringbuffer.c:1963) 
[ 0.355163][ T0] __alloc_frozen_pages_noprof (kbuild/obj/consumer/x86_64-kexec/mm/page_alloc.c:5028) 
[ 0.355786][ T0] alloc_pages_mpol (kbuild/obj/consumer/x86_64-kexec/mm/mempolicy.c:2411) 
[ 0.356329][ T0] new_slab (kbuild/obj/consumer/x86_64-kexec/mm/slub.c:2454) 
[ 0.356780][ T0] ___slab_alloc (kbuild/obj/consumer/x86_64-kexec/arch/x86/include/asm/preempt.h:80 kbuild/obj/consumer/x86_64-kexec/mm/slub.c:3859) 
[ 0.357310][ T0] ? pcpu_block_refresh_hint (kbuild/obj/consumer/x86_64-kexec/include/linux/find.h:69) 
[ 0.357916][ T0] ? radix_tree_node_alloc (kbuild/obj/consumer/x86_64-kexec/include/linux/radix-tree.h:57 kbuild/obj/consumer/x86_64-kexec/lib/radix-tree.c:278) 
[ 0.358495][ T0] __slab_alloc (kbuild/obj/consumer/x86_64-kexec/arch/x86/include/asm/preempt.h:95 kbuild/obj/consumer/x86_64-kexec/mm/slub.c:3950) 
[ 0.358983][ T0] kmem_cache_alloc_noprof (kbuild/obj/consumer/x86_64-kexec/mm/slub.c:4023) 
[ 0.359609][ T0] ? radix_tree_node_alloc (kbuild/obj/consumer/x86_64-kexec/include/linux/radix-tree.h:57 kbuild/obj/consumer/x86_64-kexec/lib/radix-tree.c:278) 
[ 0.360207][ T0] radix_tree_node_alloc (kbuild/obj/consumer/x86_64-kexec/include/linux/radix-tree.h:57 kbuild/obj/consumer/x86_64-kexec/lib/radix-tree.c:278) 
[ 0.360783][ T0] idr_get_free (kbuild/obj/consumer/x86_64-kexec/lib/radix-tree.c:1508) 
[ 0.361266][ T0] idr_alloc_u32 (kbuild/obj/consumer/x86_64-kexec/include/linux/err.h:70 kbuild/obj/consumer/x86_64-kexec/lib/idr.c:47) 
[ 0.361765][ T0] idr_alloc (kbuild/obj/consumer/x86_64-kexec/lib/idr.c:88) 
[ 0.362220][ T0] init_cpu_worker_pool (kbuild/obj/consumer/x86_64-kexec/kernel/workqueue.c:714 kbuild/obj/consumer/x86_64-kexec/kernel/workqueue.c:7733) 
[ 0.362798][ T0] workqueue_init_early (kbuild/obj/consumer/x86_64-kexec/kernel/workqueue.c:7803) 
[ 0.363372][ T0] start_kernel (kbuild/obj/consumer/x86_64-kexec/init/main.c:991) 
[ 0.363882][ T0] x86_64_start_reservations (??:?) 
[ 0.364494][ T0] x86_64_start_kernel (kbuild/obj/consumer/x86_64-kexec/arch/x86/kernel/head64.c:238) 
[ 0.365039][ T0] common_startup_64 (kbuild/obj/consumer/x86_64-kexec/arch/x86/kernel/head_64.S:419) 
[    0.365589][    T0]  </TASK>
[    0.365919][    T0] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250512/202505121332.74fc97c-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


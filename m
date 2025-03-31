Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05304213E65
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430263; cv=fail; b=KxZObQN+WgAAZ4AfZoeThpUhxpqkRYcyOIwOSa6SN4PO6qSmnZ+/ASXAXOqiQW3mVbrcTSBgrsjkCRthk/uFwvtjNJaLSwpziYRa6ARt7hCTlHn5i31JbVzrGGTZ3M2eVvMIsoORCWtXLcRr+TzlzblNsQ+BRDM+4vWGHKBU1Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430263; c=relaxed/simple;
	bh=gehdCoFo7WvSacGd6h2om2tOLQYfp/nEUZahnNBAhdg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ShxgUzFSdBj1ME8edRsTDVidU80iPKavGne7DcMxajvd0Vm3wiucfi6BRwTLaRRupv2tpz68is/QnY4eB/AaTzl9wmOlfgGElVmusZDMRDH9tbUQOHX+IOUlJgZweE7QaLGNhaOyBns7OZ2Byww0pkKgJsMqjp90shh/PO0dLXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chapcrOU; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chapcrOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743430261; x=1774966261;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gehdCoFo7WvSacGd6h2om2tOLQYfp/nEUZahnNBAhdg=;
  b=chapcrOUMaKcDFfzFVOy4z5rvlX04LkxmuvHNPxHnfznFwtnILclkkjj
   x+o9o6AgyQeCGL/Hitmb+oJU0MeoDdIh21bBe/O9gHBiO9uJ/5tkrQvK1
   0BEb6NWnKXhhUJaRQMdM1ngjl0eNn0Nth+kQ/ug18fKF3Uh0jo284FPXX
   u2CdRb7KxKWjF6a7HCv2pK2sJiw/qHXNk1P5WGa0bFlFIkdkNpJgDNwZL
   oj8bFNMlRS62BlWjEALj1pCDpX7/7dXVULCXXYMU36Znn4rLlVnaLBd/o
   cKoJfGuGdlPNk6Ns4PX/xJciWI6cmFT3GyXEcJfH/P+f5NjCBDinYVwQJ
   Q==;
X-CSE-ConnectionGUID: 0UJ8TgW3Tu2i9EbFvpDc/g==
X-CSE-MsgGUID: yCS9vd4sQFiRf90JoKUOVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44628469"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44628469"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 07:10:55 -0700
X-CSE-ConnectionGUID: RdILkl43QQKj1e3PSODb+g==
X-CSE-MsgGUID: TOp8OU7cRwKRZzQlgUSnCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="130210054"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 07:10:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 07:10:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 07:10:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 07:10:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOEWj+hs3tS2nzj54sK8pSzNLQ/QWsB1vKayBA2y/4z6q7BntFX5PVcjwNRBsGh3D9SthUSa9oC7Fb5i5MXy+J/vZNI9d+QIb9ulc+LJM02E48GBN/p9pRwfgYiRGzi+YuRGMzeluonHJxjn6Iq8cSqVpDV5Tg03/uAjNwAFemiFkf3CKo0ke6L+CDXOGjPxEnUo2KpTKTK0L/muFqwqxLzYEQpqPE1dzUsFsXQNnLCjvxhVXghtsSSkmmQ/JdfUxwlxiWnzTl4PcsLbYOZyXSMCg8NHjxqqxz3ev9YdjcyHA1lJnIDgqq+tBVS4KmSxpjYYqnC6v7IkG1TZTaG+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jzn4jCwyDqNBcwikO2xM8EMT2rNnNFQKbLu1EUuwUOw=;
 b=ldBK6V1pvGetB9ESyDuflSMqiBZIXW+NH33wTcAvUTEkj+G3dfsNiIfLJNtKR1c2v1uUZX/hQKxzpjsJ8F7lhxuX/sKU35AfKe9FJcZG8E06tEDIcEMZODsik6V+PPOJ8I6vEQGafuehvSr6YlMCj6IA5O43a9Au49ufcbopJeztd5GS316B2i4NMHm9d1MClZT719AGGlpRXuvle0s8UVeUFFw61auJX09SI5hPB1wUeyuwX+M1tFG1cH+0pTeMBoSlunCx2XZvJcyex/Ddxqs9Gqhhxm6giJI/qCAQkYkrc+xOUjGNCCbw15TNuDcJ5ppMGP4hGzgwI3KD4Eycig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Mon, 31 Mar
 2025 14:10:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 14:10:23 +0000
Date: Mon, 31 Mar 2025 22:10:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Nikhil Dhama <nikhil.dhama@amd.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Ying Huang <huang.ying.caritas@gmail.com>,
	Bharata B Rao <bharata@amd.com>, Raghavendra
	<raghavendra.kodsarathimmappa@amd.com>, <linux-mm@kvack.org>,
	<ying.huang@linux.alibaba.com>, Nikhil Dhama <nikhil.dhama@amd.com>,
	<linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH] mm: pcp: scale batch to reduce number of high order pcp
 flushes on deallocation
Message-ID: <202503312148.c74b0351-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250325171915.14384-1-nikhil.dhama@amd.com>
X-ClientProxiedBy: KL1PR01CA0158.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b1656c-da3d-4806-0a29-08dd705dc755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RtGgGgL33J0Tu8Vmv8Mx9FwNZzKZr6WV1BGDRck9uakkq5pCF78ntTF12q?=
 =?iso-8859-1?Q?UrHr62pWejJuaDuyKqHabzYEUu5THFRiXZRcuc1A7XoOCU9TcArlqOpABc?=
 =?iso-8859-1?Q?UDa7FebdNDTeP+IqZq6gc/BGg6muj0SQcwEHh/hI9DCYtbvkEpj8KaCKJW?=
 =?iso-8859-1?Q?5SIwa31hegjchzUo4iF+HLEkuR/jER6N82LRN+bHByfQnoL1jCXDyCrjiz?=
 =?iso-8859-1?Q?TXYlBxyY66g6T3qSq7CcKZh3AUSLg8jAb5p1tF7uaabjaf6cMKfMw9dJvG?=
 =?iso-8859-1?Q?IzRuwiH/2VnpOdJm2kvWl7XZQzyJFUoJumK7/x0oBm4oJ7+UUaIFJyvvJT?=
 =?iso-8859-1?Q?PoqY7JHKnUvwbctt4nNQ9O5RT3Q57+pxqjzeHcBA0d6Bb1IduSVUJ81+HY?=
 =?iso-8859-1?Q?jy2IfPBqj3cCUKs/3QFtk2U54q7mqVJCKiQAkfCuzHTcRgmxWzaV0V3IL1?=
 =?iso-8859-1?Q?+/A33cMqQilVGLJ3o3D2Yr2GCaEpPvAFS5g3O+dmXGPvahFY7ERh1TY0bl?=
 =?iso-8859-1?Q?yE2csK5CMId1JM3ahE7K26jId27W+Th4kmKaedsI4dumdFFR70pC1yl+JL?=
 =?iso-8859-1?Q?ieqHjTni7vc2+mgv15w/lsVEZd7jBtEd0CqpTMeaPvHolhA3wDZK6yKj42?=
 =?iso-8859-1?Q?MwAhobasKsRuo0BULtf7Imcg1q6LONGCl54+Xid/iR3Q5095kqyFpmRPfQ?=
 =?iso-8859-1?Q?GAmhWwpBMyXGZgjgkSIf3l/EF+d0HlyYatrV8d0c6DY9oQf8WNRBBJ2WyD?=
 =?iso-8859-1?Q?nJdiEv1GInWC5MFDMaRUh7Y3lcaPk0KUcKyxM5hvs/5ukh8g0oX3FUIEgS?=
 =?iso-8859-1?Q?jxqTNCYDL1VtsZwDHVLo15cjuBm/YxRDkXIyaXILDPiFcykBFjTq9s5iLi?=
 =?iso-8859-1?Q?R2pZoc4UEqweLU32smpXfV09LpBlbMBvFTAFiCFtg8C/lklLd1IrVW+R4K?=
 =?iso-8859-1?Q?smlZG7hUXivLzExi7XVKdecBDHc8aZq4/t6G/QMqXGR8u079v4OvUdiTvh?=
 =?iso-8859-1?Q?7iBoLa+qA/XD9BVxjBNaXFP5PvR3hArxZToP6YgzDE0XtYq6qpA5Oi+DFK?=
 =?iso-8859-1?Q?x0fobAcU2gdQTB3XwJBSovF8xm2eIBEfY+QAl6F2R5KSTa/0EB1a0kn/5G?=
 =?iso-8859-1?Q?L4GSlUXyLAA2PqG30Lijc0XD9B0lsz/hLke/f5LswB17vCkjlEDO+8SXFK?=
 =?iso-8859-1?Q?Qr1IjZ11Dt+nT24IWtT/09Sl1YpnZ3bULhF8DCuwJDcJXPslZ3svzLBe7z?=
 =?iso-8859-1?Q?xrRVdT2lcLhd2W55J6RNDzhysguL1AWzj0+PbF4/92rvftIivJd8OTXgk+?=
 =?iso-8859-1?Q?hd+hSG1ZHhsg7V8ULzCl6OYvPsWdAvN9GbcR+DFJ1E14TzKJXsVv6KTo6u?=
 =?iso-8859-1?Q?8M5JrmLPp841SsL+MYN2ZGWVA2LxhVzUgKDqjikjBOpTf4STdpkMY1IWRI?=
 =?iso-8859-1?Q?mKQwXFh9RlJNDzdi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?z3X3PWTrDeKq9X02IwLPzq2FzUkDduXgKgg7ktYesWVhBLWuK9J8cOd4Lp?=
 =?iso-8859-1?Q?b4Vxjn0PRCuj6S9Rz5qBWb2/UlRq/3H1ro6uR+WkWFHycfIAlb/AdgmUlK?=
 =?iso-8859-1?Q?1MvHRuh4/2A0foGj4heacw9rR+ohsZdOIAhorQbz05Ev2m4hkAi1EzwBHH?=
 =?iso-8859-1?Q?uNoRsfYqpTV8OGh9FrV9/jm/cbyoo2doBGpUumEvuxdFYeypM+z3nFmGSE?=
 =?iso-8859-1?Q?v5CqFxDYENVXU+zFfjyweZqp+75EfB2qp2NK4A0AsclqUm0ryMgxeKAetw?=
 =?iso-8859-1?Q?kifJyDaK2ayumuwKWxDrqCUR5OgOY5jeEZ6eGSWTBIneNT2p/MDUrExISv?=
 =?iso-8859-1?Q?EIj/ZU9OAgKE687jXQjK76XECIYKgt31TPKwG9/AcPQJeM8MAHmcsNMxBz?=
 =?iso-8859-1?Q?LNl2dpx7nzdZQgkNOI4fSL0VYzKToK01zIhPtUCKppb2J57m5EQqIrX20g?=
 =?iso-8859-1?Q?6TSc+t0fQX9JWwul6GJOFq+rHscSaVuYCOftQt6iKUQQN1OtUpwBhTodFg?=
 =?iso-8859-1?Q?H/obY1fGq07rwaEqaGvLbIC6siaGr/IkxGo7X0uJKICdDxCvpULLNMpmRR?=
 =?iso-8859-1?Q?j8cmgVax5ZSHQWBN+DK0AUv2kJeuUOxu1W0cqh1fT4WZ40R7c196anCFYp?=
 =?iso-8859-1?Q?h3Df/OQIK7hqjT8upW4hEdXxBzXwytTxiEQ9ZFWwBRb9+ijO2JZVjCWnxJ?=
 =?iso-8859-1?Q?1figiZOgeKhef/xF/AFgxDv3cjZLTtNImXIUrC10KLwCEwKqjPKJASdzll?=
 =?iso-8859-1?Q?+axGiCpUszflTssQQoxBNsuZQ74yUWkbRTagqyuFblTZEs0/fhiuZfMULO?=
 =?iso-8859-1?Q?VD9n8Moya5sZQnJdurHqRY7om4m99glVz4f/JKndsaHRqVa6uxmMZtILu1?=
 =?iso-8859-1?Q?YWTK7aMdj9fhg0BUnNlEv7q6oa8JBu2LJJewsh1RIeML0jDS90jUoPrkZL?=
 =?iso-8859-1?Q?iKF/lD8y3oIiphfWN2s+rfS7NYBDC1vs2QEmuMDHRfUpGqUstVdqghKRMS?=
 =?iso-8859-1?Q?5aL3bkDGDME8FsEEeXa3PVFxJd+8V0Lm1Lb4HyGUXMTChfdg4aJ8ieM2uS?=
 =?iso-8859-1?Q?s+5zBg/aKmIySo/I04tk01kkntoPSyJTH6U3n7alcUtDF+8gNhHkasJa+y?=
 =?iso-8859-1?Q?G6SUY6N8qHdx7lUObamWmRJoDDK2spM15KzanBVAU7ieZ+W3Xj2PU567P7?=
 =?iso-8859-1?Q?2eRSMiGVY0dTLiUkHEFgfWsbhIjnlEOoUaZsx7rWXwaDxrGNaBBDIsWANT?=
 =?iso-8859-1?Q?e8KkBKK3jCr1XPGvya2tI4gvS3zaxak4WQw2BCVxO5prXwPSO2X36SGVJy?=
 =?iso-8859-1?Q?PKisEdr5Hn+yc+xP8DMirAzvhK36in1bRbAQMb5IjTdTfhdDY9DP9lcr4h?=
 =?iso-8859-1?Q?JC12zyQABvbEDzNntH61WoxhDufuRK+d5BhuhCsc69DY63vWmCQ5kZD+VL?=
 =?iso-8859-1?Q?Vc5ugkBTCxVt3sr+pvcVP2EGdY1hF98GYb4rmPB7Cw5PVjreKW1ee95GcD?=
 =?iso-8859-1?Q?Ibah6hyQIHEQaPKmOes05PJX7UCruDRo9PmqKPPp7bVGjp05qGZQ1ix7Ff?=
 =?iso-8859-1?Q?QBA/HrsYITamuJACuOkZP6L/rFtGr8aqqUSeSEBiLTjMZLQjoUcNddI6iu?=
 =?iso-8859-1?Q?9vVjo3Nzo/WqSPDhIhC96e7l8b7n0rqbV1KHsDOmbYO7EC2GWPOtH3Xw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b1656c-da3d-4806-0a29-08dd705dc755
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:10:23.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmilIl6pvNiYIlMYoNdu+sLwBeCe1Uolx8Mefu2EPffnAPV+fWebdBDkHZcRrBUWyPLr0EUFUHoEv5opairb1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
X-OriginatorOrg: intel.com


Hello,

kernel test robot noticed a 32.2% improvement of lmbench3.TCP.socket.bandwidth.10MB.MB/sec on:


commit: 6570c41610d1d2d3b143c253010b38ce9cbc0012 ("[PATCH] mm: pcp: scale batch to reduce number of high order pcp flushes on deallocation")
url: https://github.com/intel-lab-lkp/linux/commits/Nikhil-Dhama/mm-pcp-scale-batch-to-reduce-number-of-high-order-pcp-flushes-on-deallocation/20250326-012247
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/all/20250325171915.14384-1-nikhil.dhama@amd.com/
patch subject: [PATCH] mm: pcp: scale batch to reduce number of high order pcp flushes on deallocation

testcase: lmbench3
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

	test_memory_size: 50%
	nr_threads: 100%
	mode: development
	test: TCP
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250331/202503312148.c74b0351-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_threads/rootfs/tbox_group/test/test_memory_size/testcase:
  gcc-12/performance/x86_64-rhel-9.4/development/100%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/TCP/50%/lmbench3

commit: 
  7514d3cb91 ("foo")
  6570c41610 ("mm: pcp: scale batch to reduce number of high order pcp flushes on deallocation")

7514d3cb916f9344 6570c41610d1d2d3b143c253010 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    143.28 ± 38%     +49.0%     213.49 ± 20%  numa-vmstat.node1.nr_anon_transparent_hugepages
    118.00 ± 21%     +50.3%     177.33 ± 17%  perf-c2c.DRAM.local
    182485           +32.2%     241267        lmbench3.TCP.socket.bandwidth.10MB.MB/sec
  40582104 ±  6%    +114.4%   87026622 ±  2%  lmbench3.time.involuntary_context_switches
      0.46 ±  2%      +0.1        0.52 ±  3%  mpstat.cpu.all.irq%
      4.57 ± 11%      +1.4        5.96 ±  6%  mpstat.cpu.all.soft%
    291657 ± 38%     +49.6%     436355 ± 20%  numa-meminfo.node1.AnonHugePages
   4728254 ± 36%     +32.0%    6241931 ± 26%  numa-meminfo.node1.MemUsed
      0.40           -24.4%       0.30 ± 12%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.88 ±  3%     -78.2%       3.03 ±157%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.50 ±  4%    +670.3%      11.58 ± 38%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
 1.209e+09 ±  3%      +6.5%  1.288e+09        proc-vmstat.numa_hit
 1.209e+09 ±  3%      +6.5%  1.287e+09        proc-vmstat.numa_local
 9.644e+09 ±  3%      +6.6%  1.028e+10        proc-vmstat.pgalloc_normal
 9.644e+09 ±  3%      +6.6%  1.028e+10        proc-vmstat.pgfree
  92870937 ± 14%     -17.9%   76271910 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.avg
      2343 ± 10%     -17.3%       1938 ± 17%  sched_debug.cfs_rq:/.load.min
  92870938 ± 14%     -17.9%   76271910 ±  8%  sched_debug.cfs_rq:/.min_vruntime.avg
     13803 ± 10%     -22.2%      10740 ± 14%  sched_debug.cpu.curr->pid.min
      2.87 ±  9%     +69.1%       4.85 ±  4%  perf-stat.i.MPKI
      0.31 ±  6%      +0.0        0.34 ±  3%  perf-stat.i.branch-miss-rate%
     13.92            +1.1       15.06        perf-stat.i.cache-miss-rate%
 2.719e+08 ±  9%     +27.6%  3.469e+08 ±  4%  perf-stat.i.cache-misses
 5.658e+11            -2.5%  5.516e+11        perf-stat.i.cpu-cycles
 3.618e+11 ±  7%     +10.5%  3.996e+11 ±  4%  perf-stat.i.instructions
      1.64 ±  9%     -42.0%       0.95 ± 70%  perf-stat.overall.cpi
      2233 ± 11%     -50.7%       1100 ± 71%  perf-stat.overall.cycles-between-cache-misses
 5.691e+11           -35.0%  3.702e+11 ± 70%  perf-stat.ps.cpu-cycles




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


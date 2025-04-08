Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156AEAE7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744156555; cv=fail; b=bmXDNnXQEGfyjXvF6J51qc3I/KQBcYb/T+pBQaiEMdEiaYCGn+vZgE1FuJNzgs86E3o8eYHT+hRCM7INfoZvIdvLnM7B1JvRLdAXmTrelPAtQJSx5G/f5Mu7ARx5BFWzVz/nhVZxPf6DZklXrHt4rncEBS4H3z+D+nx23h3uUcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744156555; c=relaxed/simple;
	bh=jxrZVWNjKrD3TmMJ+XdFJHCr6MI+BImLcseu8P0pB5w=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UaQ4oXIa5PH/KRyRn9ru8RG6+TgdAanoCCQI80JAvFLc+r0ZcjiZrZs7MLMmW4M5khr8KIi7kvobVyMp0zP+anqfLfqsKYGZ3/Sl+aGtArjZktkH3ibTr5Ksepit/xXIhnj+IHiTD5UWm/n89ZvMv/+SLWS4Y3oue6i1CVG7aW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZQcACXB; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZQcACXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744156553; x=1775692553;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jxrZVWNjKrD3TmMJ+XdFJHCr6MI+BImLcseu8P0pB5w=;
  b=bZQcACXBkTTsk/B9xhmZf1S33KvDDBpwD4lymfBL0fW992mg6mdkBBbi
   8NzQdFsZhfAM+h2d279YtWsMAg8oPywd9CBY72L3Eu/Jp3VLWXeDHj2bg
   wfWB7rccqBXM6nLnOsRf+EfLs787x1bcYMopA5sL3lAD0+qvw4BKGttdD
   nHzpv1mCs6Y5oLWgH3/c423r2I8e3e3Z1T5tmCoasBI31h4ikxrlOWxAk
   ZavAyJXhI9453SZnt+ZxUQ0j4X2/1R0HuZgDrYhelBU13vAkev+n5uEYQ
   DAxz+0qV4nu3thp/Txn/blx+L9I+yElIdJjaSlFTD8svIKDSiy9EjDNMo
   g==;
X-CSE-ConnectionGUID: DQ2xy6G3Rqi3ol0edPmO9w==
X-CSE-MsgGUID: sDBZ0hghQNKYfbd1PEkIaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33218234"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="33218234"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 16:55:52 -0700
X-CSE-ConnectionGUID: 77bsu8LMTqyQjBvptR7/Cg==
X-CSE-MsgGUID: zw75VyWXQbqmXTSIWn7XqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="129371989"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 16:55:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 16:55:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 16:55:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 16:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiJg4/2pZDpQ3uU15vhqr7WUxPI8NHl+H6ZTaJ6P1U4kVUR7Tej7ETLRrDlq8TX067fjtLR+I2KO2R02v+Xbzl9vTSJLmML4fazCoByaRpvCdsirLyHPOOM7oOlqPrb5pA7lcD1Jglmz8euO0Q47MdmMqusiEohAsEVMN0RRtjYxsFVOfUVMBiKwzGEj/YrcJ1BWXu4tckg334fclfEVTmFIVQo4Nf7Wf8bzIacKWOIfEXk/17Zo48cZQ2WVzGlr1UwjP6lwPd8yaNiu4+wLo2Ud21ckWAf228iQN/aEU4BDVNwLKamBw9HpBlZSkqyNVJ0eUe7yX8OnndYTEsHlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukO128DxCEvWgaMq60DVbxAbyDxRaycobdiUuwWbOM8=;
 b=Z/9YX7LOVUu+StHWD88a8gs+xM+7dOvSaemZFUZgpQQHv1bw5SDYicjOeBnd8S8XI8x4aWreajXNe1Xr7ZzCiS0w0Ol36ZINJVsR6/tMTlpl+btgpbt/hXo8Vvy+L5uxmY9Y5bf3yo8K+JkLXnUWbmR/fkfrvgM7hXOyUcb2vHoFdu3Ygr9cVv1fFZssDyIldLZC4OlDdtZKX28UlugM/bP6K8sLVxFTGZL9meVLg0O4+m9QIJDFUw6zvl9a+qGmLFXRFCgSsxTcLWZPCoIcknuxoX2Ze3isdgRwjJ9kbWBVq155Z1L+xDYmdoqofcUQB63Ph6t9+1prdjRMcU2UZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CY8PR11MB7875.namprd11.prod.outlook.com (2603:10b6:930:6c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 23:55:12 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 23:55:12 +0000
Date: Tue, 8 Apr 2025 16:55:08 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dave Hansen <dave.hansen@intel.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Naveen N Rao <naveen@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<linux-coco@lists.linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, Kevin Loughlin <kevinloughlin@google.com>
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region
 for SEV-SNP guests
Message-ID: <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
X-ClientProxiedBy: MW4PR03CA0302.namprd03.prod.outlook.com
 (2603:10b6:303:dd::7) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CY8PR11MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a98f70c-a8a1-48e2-9b37-08dd76f8ccfb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bWAC9WGjZIiP7mTiillpVRKLxz/UEWLSGKMsvLh++omoeMyLjFSNbh5TCtlE?=
 =?us-ascii?Q?6O8gaYoOGh5jubAst8R0h2E+l0/UPm6Fb4+/a6zPfnR5yL1C5AamEcbO/nDi?=
 =?us-ascii?Q?VOrLLIRcWMMurR7MjSAwSwOibTYqZc2CihAu3uOPk7pp1RsLJrRkXTI/9l7r?=
 =?us-ascii?Q?1AjxMS6/RBYsWVR1s9s2LuvEx+xrw8L2KK5giiEaOiN9XjWy/9onC0ZWtW5H?=
 =?us-ascii?Q?GtY+EWByjLo+8FO+pK4SC8P7FltyuF5pPVunaKc0v1DqsjItpS30/cFuWjDU?=
 =?us-ascii?Q?pDA0rlVfxD9Zxce0Pmi8L1rVr4qOfapHvOuhl09aSm45N39m7En6uFCm3pfz?=
 =?us-ascii?Q?sSmfiBsPRGKR5SgEEtZymRYJFNB07zXL0hZ4CSTy/VGePTj6ZnESMoOfk0Eq?=
 =?us-ascii?Q?5tmj5QEpYO34ZBUg1VpDxxeUvjby+EECtQnYlX2X2vgZHeuJ+jGK6SFJNLic?=
 =?us-ascii?Q?4Ez44dapx+wyCcGhMKoC9I8SFhHc2dgpUlb7sM6bT/s9sKfjEBQfRTgEAUwr?=
 =?us-ascii?Q?9zBGnNpshpFQpPDa5uIyNa7WnfRAatWFauJJZyO9VYbPDy60KNUPJ+Imx28H?=
 =?us-ascii?Q?fFbxQpplN9bGy5p9yIT6FrB9lsPtHRf4zulWOchCk2rH2A/TitSWSIBX+Rge?=
 =?us-ascii?Q?ZQXNCjZy/kUgW9nCNkM6qSoHknHibsWuF3h2xdnO1Vr/noE2y40rCIFfAjC1?=
 =?us-ascii?Q?KGqKFiYewOZKJXkIZN2frVZtVl9sf0RGTZ5edE9uzjDlKFopDeWWK2GOmzWq?=
 =?us-ascii?Q?QmCYDnzEffc2VPLh8eHRjBEJTc1qnaW6NGAcPJRElK4QFIpEWj944McvobWz?=
 =?us-ascii?Q?WGkoe7MqJw1zzQQaB5UqMb20e5QCcOW/n7t1yZLJdYSgok8cz5ipNCd3uMMA?=
 =?us-ascii?Q?H1PBtx4U3VJhokFdJGAoxn1bHzfz1FCHQ4UY+cVf94OLW1cm3+2r9Bx2Tuox?=
 =?us-ascii?Q?b1SdmnjO7opEn+V0pHnPc/E6O9jqzabhwaiaynKv9qtMyE/qR0VFPabvTUjF?=
 =?us-ascii?Q?f2Le8A+X0oA1+IcTI6sg0cuTALQiJOVa99W4Qoc8pPm8exhwZS/CW+mwzu/u?=
 =?us-ascii?Q?Fsy4E3x1rntsNlr+EHPohU+RvUgvPNyAqdpFLej0dPm1m6CTRZQcIIkORwHg?=
 =?us-ascii?Q?HZ5cHRfgeguCwZAJdb2wdZI9FznOJx5gOdF2YWl0mOoMBjYbCKLXazIsiPah?=
 =?us-ascii?Q?v2bcNbySmf4MqnJRu+S4xiodRMTQCnMTgctX+2+l53kK1OTgLWfNJ3QOH6vJ?=
 =?us-ascii?Q?A2Gwdp40Ew5rfqWBIXTRLfqwQ9EmcuuZc2+AZOA28ToRo+yqgqZYSC1dIg8j?=
 =?us-ascii?Q?/0Sd33IDEXRNYGeL5a10fCn9moPgJdqGHL2sfJYX2zscWUkYcK1CtZ0+V8kc?=
 =?us-ascii?Q?9MEAH2n1C9/UNvFKy0e3P/XOlwhs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3zPGbwC+iEgI1ly8l6R4JAggzwNuZ75NKarGZuVrjPmRd4SNE0gGNQvVlVG2?=
 =?us-ascii?Q?7Ep/meSF98Y6A5vJBkvmCwOU3TLe5zT0LyEpyjVIJwH85jJYY9FlhELguAXq?=
 =?us-ascii?Q?TJ0TYfWscYqnpu50sfToatPR/QXTYv4lmapQKXt3Zr/Lj/ajiIG05b/RYASj?=
 =?us-ascii?Q?jtJigkuoIwmC5SrAZ4ZpA6LeYEUA3r0ApS78d6bT5C1rb+RMWR9goAuWvrQV?=
 =?us-ascii?Q?pEYqbgP2zOfdICIxXW+2Kb79o7zDreQ8VosK5cGX8zYZYnWWCqMYAYFmGB7m?=
 =?us-ascii?Q?er/mb+BtvFVQt1CfZjRsM7BjC27fXoxufb9xixO4bYcwiMO0cDA7grEVJ323?=
 =?us-ascii?Q?l9e9ThCA6VEaaCWfjtGmHY6QPYaaKYIXTLzaq5j8NhkwHBw9va8Bjynu+paw?=
 =?us-ascii?Q?hckeYCuFpdnwfmXs+DMEIICnl6nzvWG24PlJ1NDKRoG/W0CLuF2zhkew1o6I?=
 =?us-ascii?Q?hn1cqgTXAaqviSSsCYBErcLb5IBBUCEQYnRXF90GPrbFrOFseQBOfgzhYB7u?=
 =?us-ascii?Q?mbIgkd9tVa8oKQ12w475wh9kdpXh/lPjJSn56HJGMD4is6ylFqZnG2PwzZxD?=
 =?us-ascii?Q?b1KPIQ5yEUqM8k9potiq5gEW3ayO88VpS8mO3VnSHhU+f0EaXrJ6nv5EdRcE?=
 =?us-ascii?Q?4ICGGVoOGfgjPtuLtHtClijM1SEOzteJ9Ouze8ykDnN3KiEf/7KuVqkIDMQL?=
 =?us-ascii?Q?InOpg6SnjuluU4Y0Wf/eRZXMV8a4Jz76AagD2c9i2ZwtRuyfvW8OQvNDK+WX?=
 =?us-ascii?Q?FcaAhTV+3wK5yVbLmwxXCv39enZA9QlvwPjzLFUgPPILmxAM4IBoQYISw2oy?=
 =?us-ascii?Q?rsWFOxC1hluGIReJib+JFXEQ4WSKWKmnhhxqX7KP3KuWFAqmuzdyjzb+SJyo?=
 =?us-ascii?Q?aDMy6WPdLBbewE6lUsoOfZHGtVrozYMN6XNfU+oPjSrdrW0b3ZXXGSNDxMwZ?=
 =?us-ascii?Q?py0BtjrzmfAaG9BFbK6p25brClm8rOFzP4qLTbfBnVuGGA+1pM8yGCMUS9SO?=
 =?us-ascii?Q?sIR5vGZQCZfiL6+qCYUMo6ST0pkOpv9Zuc46k/MUY3z8/FCwcMpRh+k4rQMu?=
 =?us-ascii?Q?rNZdASMHFWn4XLhwqqMNEY0UhWwERYkUyWRtSC8Mt8JDu7Z7JO236MNcvpi1?=
 =?us-ascii?Q?CNN9bmyRA7oNlMZ+o3KqIPTlSBsH5XK1+4mSke6DTa7GZpDp4Cd5oV/tAK/g?=
 =?us-ascii?Q?HsXQdScX8JeQqgEwY+eKPC2qUNKvPEztm16YeeeVoo0PrNvp7f+iWMJTozgu?=
 =?us-ascii?Q?vac2nJmx2zh/8fCrRF62KINXsWUbnz0gbSY+AVQQ9WIhaQn5e64QQtD+vhdM?=
 =?us-ascii?Q?6vZFKPPj5VginBYz/Cn12KREC4+aLnKx+IyBxctbsB6w11pFSvpeXkVvITmj?=
 =?us-ascii?Q?FT9DK2Y62uSZmboboJUUTN+aDo++e3bANtQscWsgQdjiVZQ6BmLAGDP5lgOh?=
 =?us-ascii?Q?4X+4ll82DCbLDnH3LZJfrxvvwBGOurLAEUelIagjktZDjEhgPQ51y310FIrH?=
 =?us-ascii?Q?P/LtbsM+C0TR+6JDYCKiOrBhArSodnmjE3lCfpmVxXzcIktUlwL7bRHM3wIt?=
 =?us-ascii?Q?Aqu6/VRhrKR1YnwIYAsolj7XdnRrhHMqdd8STFI/4EEGkVU34GK0+e0VeJRK?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a98f70c-a8a1-48e2-9b37-08dd76f8ccfb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 23:55:12.1498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Q2k5b5B5qggJsx/DA8dg3fH9nUifC2DPhuj1VrQ+PRl3bE9iJ7QspNO5wM++dAZ0yzlkg0ARzzOCJ/IOnH7lTgHBeNlopxYnEUe7bOU0wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7875
X-OriginatorOrg: intel.com

Dave Hansen wrote:
> On 4/8/25 06:43, Tom Lendacky wrote:
> >> Tom/Boris, do you see a problem blocking access to /dev/mem for SEV 
> >> guests?
> > Not sure why we would suddenly not allow that.
> 
> Both TDX and SEV-SNP have issues with allowing access to /dev/mem.
> Disallowing access to the individually troublesome regions can fix
> _part_ of the problem. But suddenly blocking access is guaranteed to fix
> *ALL* the problems forever.

...or at least solicits practical use cases for why the kernel needs to
poke holes in the policy.

> Or, maybe we just start returning 0's for all reads and throw away all
> writes. That is probably less likely to break userspace that doesn't
> know what it's doing in the first place.

Yes, and a bulk of the regression risk has already been pipe-cleaned by
KERNEL_LOCKDOWN that shuts down /dev/mem and PCI resource file mmap in
many scenarios.

Here is an updated patch that includes some consideration for mapping
zeros for known legacy compatibility use cases.

-- 8< --
From: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH] x86: Restrict /dev/mem access for potentially unaccepted
 memory by default

Nikolay reports [1] that accessing BIOS data (first 1MB of the physical
address space) via /dev/mem results in an SEPT violation.

The cause is ioremap() (via xlate_dev_mem_ptr()) establishes an
unencrypted mapping where the kernel had established an encrypted
mapping previously.

An initial attempt to fix this revealed that TDX and SEV-SNP have
different expectations about which and when address ranges can be mapped
via /dev/mem.

Rather than develop a precise set of allowed /dev/mem capable TVM
address ranges, lean on the observation that KERNEL_LOCKDOWN is already
blocking /dev/mem access in many cases to do the same by default for x86
TVMs. This can still be later relaxed as specific needs arise, but in
the meantime close off this source of mismatched IORES_MAP_ENCRYPTED
expectations.

Note that this is careful to map zeroes rather than reject mappings of
the BIOS data space.

Cc: <x86@kernel.org>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Kirill Shutemov <kirill.shutemov@linux.intel.com>
Reported-by: Nikolay Borisov <nik.borisov@suse.com>
Closes: http://lore.kernel.org/20250318113604.297726-1-nik.borisov@suse.com [1]
Fixes: 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()")
Cc: <stable@vger.kernel.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/Kconfig                |  2 ++
 arch/x86/include/asm/x86_init.h |  2 ++
 arch/x86/kernel/x86_init.c      |  6 ++++++
 arch/x86/mm/init.c              | 14 +++++++++++---
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15f346f02af0..6d4f94a79314 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -888,6 +888,7 @@ config INTEL_TDX_GUEST
 	depends on X86_64 && CPU_SUP_INTEL
 	depends on X86_X2APIC
 	depends on EFI_STUB
+	depends on STRICT_DEVMEM
 	select ARCH_HAS_CC_PLATFORM
 	select X86_MEM_ENCRYPT
 	select X86_MCE
@@ -1507,6 +1508,7 @@ config AMD_MEM_ENCRYPT
 	bool "AMD Secure Memory Encryption (SME) support"
 	depends on X86_64 && CPU_SUP_AMD
 	depends on EFI_STUB
+	depends on STRICT_DEVMEM
 	select DMA_COHERENT_POOL
 	select ARCH_USE_MEMREMAP_PROT
 	select INSTRUCTION_DECODER
diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 213cf5379a5a..0ae436b34b88 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -305,6 +305,7 @@ struct x86_hyper_runtime {
  * 				semantics.
  * @realmode_reserve:		reserve memory for realmode trampoline
  * @realmode_init:		initialize realmode trampoline
+ * @devmem_is_allowed		restrict /dev/mem and PCI sysfs resource access
  * @hyper:			x86 hypervisor specific runtime callbacks
  */
 struct x86_platform_ops {
@@ -323,6 +324,7 @@ struct x86_platform_ops {
 	void (*set_legacy_features)(void);
 	void (*realmode_reserve)(void);
 	void (*realmode_init)(void);
+	bool (*devmem_is_allowed)(unsigned long pfn);
 	struct x86_hyper_runtime hyper;
 	struct x86_guest guest;
 };
diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index 0a2bbd674a6d..346301375bd4 100644
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -143,6 +143,11 @@ static void enc_kexec_begin_noop(void) {}
 static void enc_kexec_finish_noop(void) {}
 static bool is_private_mmio_noop(u64 addr) {return false; }
 
+static bool platform_devmem_is_allowed(unsigned long pfn)
+{
+	return !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+}
+
 struct x86_platform_ops x86_platform __ro_after_init = {
 	.calibrate_cpu			= native_calibrate_cpu_early,
 	.calibrate_tsc			= native_calibrate_tsc,
@@ -156,6 +161,7 @@ struct x86_platform_ops x86_platform __ro_after_init = {
 	.restore_sched_clock_state	= tsc_restore_sched_clock_state,
 	.realmode_reserve		= reserve_real_mode,
 	.realmode_init			= init_real_mode,
+	.devmem_is_allowed		= platform_devmem_is_allowed,
 	.hyper.pin_vcpu			= x86_op_int_noop,
 	.hyper.is_private_mmio		= is_private_mmio_noop,
 
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index bfa444a7dbb0..c8679ae1bc8b 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -867,6 +867,8 @@ void __init poking_init(void)
  */
 int devmem_is_allowed(unsigned long pagenr)
 {
+	bool platform_allowed = x86_platform.devmem_is_allowed(pagenr);
+
 	if (region_intersects(PFN_PHYS(pagenr), PAGE_SIZE,
 				IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE)
 			!= REGION_DISJOINT) {
@@ -885,14 +887,20 @@ int devmem_is_allowed(unsigned long pagenr)
 	 * restricted resource under CONFIG_STRICT_DEVMEM.
 	 */
 	if (iomem_is_exclusive(pagenr << PAGE_SHIFT)) {
-		/* Low 1MB bypasses iomem restrictions. */
-		if (pagenr < 256)
+		/*
+		 * Low 1MB bypasses iomem restrictions unless the
+		 * platform says "no", in which case map zeroes
+		 */
+		if (pagenr < 256) {
+			if (!platform_allowed)
+				return 2;
 			return 1;
+		}
 
 		return 0;
 	}
 
-	return 1;
+	return platform_allowed;
 }
 
 void free_init_pages(const char *what, unsigned long begin, unsigned long end)
-- 
2.49.0

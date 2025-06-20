Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D698E1754B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438840; cv=fail; b=lwO4H2jy7V7i3jnJR6dFthZvPrPMPtkTtsV86TKFaZxjXYAOuxr2DTu0TtAOHc+nnAxzqzKVaM7s3fQfZ+u+019gz/YAq/duAE9JMLAfRf7CQPiEBAJt15p34rE28RBKUA1ZRgFUaGOUroIOlhgF0jlXIbnBG8Nrsdur668/7pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438840; c=relaxed/simple;
	bh=GioqnQFN5yvvDoHBRmLOwIZhdVxd3s5U5Y8ilvjnjbY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cDRYthXhPwAIJs69ilds4znGeV4c+kktd+zzknDLalf5swYwZ97l/4U2/+AkDDraM8wzadg5VubiyGbY5Cs1ctN6zgVxjpzXF0H8f96QAPM8nV8khNlt5dluCVvX1SNcgWJwK9YrGiargAmpOq2ZaGN76MMAVDEgIqzIdeU0lq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahs50Z8l; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahs50Z8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750438839; x=1781974839;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GioqnQFN5yvvDoHBRmLOwIZhdVxd3s5U5Y8ilvjnjbY=;
  b=ahs50Z8ldRsnpwa+u1zM5+y3jk1BtOA9VLTTXVfVPODJud4+/nr5c74t
   5g17c3rKzWN+XuxHS0OTgTlzOdDgN2xg3mHfPg8k/c2lazhgKnxtRH2WN
   QUvIHD7pvmCNAqc4ywmXZX3vnLjgl5AWzOV8kfZriUrOk8dei1Bo7Wrbx
   abQFK7EHKG57NRzovgmnD6gGoY3+h3Vp6g04y6y4APQy0SSkxFK58NWmy
   SdVbJiGLniBltu+OBFuoe2icyW6wjkuO+Fb8Mjokh34RvgvQ17TFaqeds
   0Z4MlO6iTEc042jKGjvaGjEnsiqcKt10ThN04eGdb+m07GVVE8Ao+3kp8
   A==;
X-CSE-ConnectionGUID: 2wDrcPK/TSuJ2A12ZuR9ag==
X-CSE-MsgGUID: pqCxHqAmTPSRTd/bPpREvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="78117241"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="78117241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 10:00:26 -0700
X-CSE-ConnectionGUID: xfalYs8cS7GxN+mcLRMiew==
X-CSE-MsgGUID: 1olNdLS6SDCeHLxysW4miw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="181844146"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 10:00:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 10:00:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 10:00:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 10:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz1loGI8DrTFj9otqZT4J+1sDFEMs/yMEOPLxxWI1FMZqTwT0zb0lo0Y3/UWi3pnS1SO9ErSGnI490AUrf+6G/9/w8NY4gTiejEOspLS51nNl1r/Kv42KEyVRcp05sEq0J8DIahrQWXM6d7G4c3bmD5950Bnjn0dwzDMLl8VgAMho2iyw1a478Sw3nsLbhjctKo/HHBguodvebfXPJUOe6adwZKd9cz9eMa14ODFeHaa2DQsruWDWnqWOsAVIqvaTu3acEbsV7zh1ev7XEw0WZ84zg6GgAynkJSjUac3JFE00DBHJAFCo4c5ywhpS9Oo/WDHKO+iCbMl2fQVaZmogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph/GGnDq9WLrorgjijhcgSRwrQ0UKiCnO0HxbYg2fLA=;
 b=AEUXxtDPmR7T/Rt7y29Ts5FxYJawm3f3pbVJ4/dzqdNtuSkssVmr2E80OTVjrdX98HcIqUjKhRJPDOqV7J4f4CyZtX2VNmooH4dpm1Pmd7h/yQUNTN+Xfh5neHSoIYWh9ZhhzK2GeGHYMEE7zM1pjGos4bOzicg8fzN9tK8R6kLgXOU3xOQqPZwURNpYQhkMUUeQAUIPYlByVKuSwnECAgNMZJq3usp800Ag0G8ArmGedban8QantQeylR55jRijUf3Q0ax6VerMxTRNSiZb+1y71QwICc7Ch0bVLQYM3dd7bWuskVH5PwfPV23lXHGaqi6oTPlJHI/8uDUyh9ydSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MN0PR11MB6158.namprd11.prod.outlook.com (2603:10b6:208:3ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 17:00:08 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 17:00:08 +0000
Date: Fri, 20 Jun 2025 10:00:04 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Hillf Danton <hdanton@sina.com>, Dan Williams <dan.j.williams@intel.com>
CC: Byungchul Park <byungchul@sk.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <conduct@kernel.org>
Subject: Re: [RFC PATCH v12 00/26] LUF(Lazy Unmap Flush) reducing tlb numbers
 over 90%
Message-ID: <685593945988c_1f9e1003b@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250220052027.58847-1-byungchul@sk.com>
 <20250220103223.2360-1-hdanton@sina.com>
 <20250220114920.2383-1-hdanton@sina.com>
 <20250619134922.1219-1-hdanton@sina.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250619134922.1219-1-hdanton@sina.com>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MN0PR11MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e40e22-58f8-49d1-7f1e-08ddb01be90e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F9U+6ue18EIUQk/u/El/7yuqcDvxSbaLkKmdfLCuvOnSflUeq5Ezta4c1fWj?=
 =?us-ascii?Q?vUi34nelU2T4F8QtWZrtrnGSpz+80u8YxzCicxcxAY+i4BZ+1HXuC0b9/Kow?=
 =?us-ascii?Q?VSgrbrBkRRS1tDg5aWdUA9ee92tPh9vSFQ8D/nYu3x3g9nf0+idOkTdBArg/?=
 =?us-ascii?Q?ssL6MzahkTfD2SsH40topK3VrKHkVFN6mp8SJDtAkn0dPq2xJ1AfBxX2cV/P?=
 =?us-ascii?Q?F/he9/NgtZU32WgbmybGGrrjMJL+TEquFR07lhF9tStV2NnUNQpkhrQwFhLZ?=
 =?us-ascii?Q?33mGZ54/Cj+hIXN6UxYt1MwZSK7yDfXic60CYZotOuCBZ0OJII0/nUUCh3UP?=
 =?us-ascii?Q?lEIdS3L0Up+f83aNg7aNzEpC4N63CrD7I0JlhFDX8HDfVhrYRJdD1GF3nQK9?=
 =?us-ascii?Q?pX3rVLzICJxDemwcYg0s5vJGBYwfUVFJUJtFeMOYXjF0EK/T9CtNGA74KFmh?=
 =?us-ascii?Q?Odp8/itfRDJiD44UTFZB4XtAnIgzZCd/uSySG+t1nWNZ6l6NORDBUwtI0x65?=
 =?us-ascii?Q?0jIuxdUC0dNSyXd2Kzmrm8vvQHSCQjb4TsS80Wri7DKwPUjzY1T2OfIMWDgW?=
 =?us-ascii?Q?1Q0fpJnqFi+U66dG4ip4thVAyEtLVUncl8bewL3P2QMItxp4SBg8FPdQjovk?=
 =?us-ascii?Q?O4tVMUVzHFm9921mAY9a1pir+aTZ//e0U0ArGQvt8DkRYSiGkk49LAa33DQd?=
 =?us-ascii?Q?9FOsV9PnJqyuCBzKbg9Y52l0PzAPVwnD1Xmp2r2XHN6Y98XRoqWmwnWrw6Qu?=
 =?us-ascii?Q?NUmMR4RonSifmh5CH+5SuVqk1CDMWWUSRWvoAbQXzas+N1ze2m9w58afVNY1?=
 =?us-ascii?Q?a5jxmOzRKO7mA4Sok7ulXCKz6CT9+BAvRP5Uo9PFaLI4ao3r0H7pKtp8bFeu?=
 =?us-ascii?Q?OoyKGwcRonm+tNGRTB+Cxdlgf91hhb7vklDol/XLE+nSdUEf8nVNxu4/7elk?=
 =?us-ascii?Q?HSOwzF1f21pj+6wagZ4DTuc3/Ipc2fEwuXAIiSCKPLCyIyqkEldDusKx1xKd?=
 =?us-ascii?Q?YoBAaJuuAS6A21NJdC0X3atBnKEhIM6SxDH9TShMZOYeK9xBG/8k87DpcCAD?=
 =?us-ascii?Q?i47RDxnbpp1piTE2gpNbUuv5v72ZwUdlBIAdwzaBmqi1PQ+bkwMY5XE2uBvX?=
 =?us-ascii?Q?v4UYhlCtr/DKfPCAjipnZ7fldQVE3UEMUjQm7x8BoubPW+3ni1N1WA8UlCdZ?=
 =?us-ascii?Q?17cty/OcgqXBpLRv2l/G+QOIiuQKnuZv6FAVAsh10G57vJeX+/24FgwgEndm?=
 =?us-ascii?Q?HBDuSFYexwPsQ/g0H3jrNt4nZ7mp+Vt/0TADmiEW+mnH1RjzoWmPVDLDzfgA?=
 =?us-ascii?Q?oOg6W+vScnKJxLosWdmly9TmVx+I5AMZgkvb2aIfX4K8r0HGnqo0NETEoHGr?=
 =?us-ascii?Q?Tt4NtWzEmF2l32PsnW+0BPYeVPQAC3i9HbdFbPkqAehchus84kOQ8Rpp1F0o?=
 =?us-ascii?Q?Et8xxX5A3Pw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rzGm9SHxQQj8cumwQ3N+iHFHKfzZEP6jQjdX53fUPzLqJbDKfLb7uwzGXAki?=
 =?us-ascii?Q?9Rwk4yBuBnsa6PSc/m8Z/y3QLq1kAZXLyKqlQTVe1dr+qNW7+gRWs916nmX4?=
 =?us-ascii?Q?0ItRNVyS2Q65K1v113i27mDUfUdqZXDgwqRtFAty2Ib7WWOId5VOIGWd9wsx?=
 =?us-ascii?Q?6EgOtvEHXchiYwpR/0ArbyXqEmZURXqZ7ldkRw+OzeSY05FhUkwiVwSX0jho?=
 =?us-ascii?Q?DAKXWsjcy8OqO30O4PO/sdLTRG+6w13DfPbHrsAL+auzdYQQ1rwRzahSzhnb?=
 =?us-ascii?Q?VEfWsr9YSrHv+4OlH6KXH6bP6MODJ+3a42rTH8jf095HyVVMjLiDfyXV4Toc?=
 =?us-ascii?Q?iufJWQaVqGJHk2LPJa7oBmmXqqhEtWxczTr0yOIDjaUUQ7nyBTk+ISbQu+hf?=
 =?us-ascii?Q?IF2fmsZpLTgr9jezU5qXH9d7JM6se4psSw5sG7atnoUhuGQOfTx9MFPg5efe?=
 =?us-ascii?Q?28bHfm/3x93o7NGP8YXcUMzBit+oHBqym2T0QFREzy6j2R3H/QBDMLhZVFMY?=
 =?us-ascii?Q?2LCvkv7vnPX1gL6YUid4RJ8wRPRROohHftdUTxfu5NNxU3oeCXtyG8Q3X9XE?=
 =?us-ascii?Q?tlSuBiKSYQ8zUDzUl3SNhuVK4KrurAJQidhOY5xf1cmDqUCT6btQwQjOufCg?=
 =?us-ascii?Q?mmobK54N7DD/8MTIUlEZ9MNsvMNsXIqoFQaG1fHRm+OXnK+FrELvwip/GEmk?=
 =?us-ascii?Q?XN6pkXVrTBhQCOSIkRZPlzUb8qghVhuBX3RyOnsfSDV/VVtyg2cNP4xIccxd?=
 =?us-ascii?Q?LQEgDSAlR91gb7swFdPpHuR3Y5sHW9WLsWU5BU6Hd2tH2sEq3//RPU5tOcOS?=
 =?us-ascii?Q?YjNdKvce20bT0rRvOt6L4z3nOs4Alfm1GBXMChRG3vfaXsU/02sM2cz+IN0Z?=
 =?us-ascii?Q?mSNcRT5z430voP8zJt4I1DLV5pRe56GQ7bMiWdD4kkmBTPbjpFGXSpsr678N?=
 =?us-ascii?Q?+i73/e6QapcwaAOpRxnnfYyrj55iDZlRUMyxWQZH7ugr5AycoY5Dd3WTD0tl?=
 =?us-ascii?Q?IHAC/Yu/s5VCXtlu8GjUDMqwAXGP0OlsfDwgFpKHA2oMNDJm7aBRwAHOGBHg?=
 =?us-ascii?Q?IbOw73rprcXbBTcT4t3hYH7nqsxv2DmfqG1Q3acOXkYXxyHncNiDrOT2IOmz?=
 =?us-ascii?Q?dZQ6t0lkjFGl5xuYj5BEgFclco398vdyewGKzB/wIckSo4kzQHY/SU1cevwg?=
 =?us-ascii?Q?k5pOnZRmFP1/BzSJTHCU0r6wUebCphcf0LUzGYcvipZXuhKOnuC4G4M5aRNG?=
 =?us-ascii?Q?Av16ChgY1/pdlDyQzwFH6v7r8co+p+WoRTAIAphkVvOqJ4w9cC4Ukvd/yOo/?=
 =?us-ascii?Q?yy3hr26UrEEpyQXmGQDC1Y3JRLemS4Y/QtuR8jTXk8B/FBaZxf2Dk/AOlOYl?=
 =?us-ascii?Q?rnuRaj1zubm9FgSTsorzF/DzqKt/PtwAjAevYzOaIABsBEM4qJXENPtDCy+v?=
 =?us-ascii?Q?9QIQHGcNZ7C5Ug3VuPEHP8aztCOEYP8PjRSu2wS5RtlwdtH46iyBHK/ZJ4NX?=
 =?us-ascii?Q?wFGKDrhom3ZprKsE65/NklQhCoUq6N7Q9luVvb2v0DhHBd1iZ7ct9fAeRHyv?=
 =?us-ascii?Q?+5Loulm9LZg4uLMTLF1JbbNQC78DEJA/TVSUZLzYNUNhzGrQ61+IMLt/SGFo?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e40e22-58f8-49d1-7f1e-08ddb01be90e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 17:00:08.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUBvuIm0bvBpuOYox1hbS1PSPGPXLTLWWebN3GaF3/AKi7jTl72z8rIBYsq5au2bFmDJicGclAug3YsupUf9c9Mk+9k2Y32/HqHwccfmgOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6158
X-OriginatorOrg: intel.com

Hillf Danton wrote:
> > Date: Mon, 10 Mar 2025 16:24:09 -0700 Dan Williams wrote:
> > 
> > Following the Code of Conduct Interpretation process the TAB has
> > approved the following recommendation:
> > 
> > -- Restrict Hillf Danton's participation in the kernel development
> >    process for 3 months.
> > 
> >        - Scope: Ban Hillf Danton from Linux kernel mailing lists for a
> >          period of 3 months.
> > 
> Dan, the ban expires.

Acknowledged, lifted.

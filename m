Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DCC20E715
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748586260; cv=fail; b=CXdDCosGFynUx7BPbMmPuQmF3bQaWuyBUegmLGB03gjNhQiZ43RRVHsgKBiQ1+LWAS1mWB7VYUKZ679lTpiaLV4XebVee5wwUid1bdPn3S2IJ+4lzwB0IunzorGbkBahCFUF9Hktoqs07w+t+c7rACFwZUfuk6KNAg6qlHWk0/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748586260; c=relaxed/simple;
	bh=f9IqtBYsnJMTVYpIEH3NBR88MP2mqo9+m1ddenMsLJo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=echzf5xfXh1uxqe6+km+3B/nsioB3SmsypDKaX1/uG/IstOnS8uLs5IMkykYwWKsNbTZtUGF3G6vx5KdCD+rF4M7EEZ98wuaTWQC5th0HkIjZNYkoP2TOF0EwhovdFYhinMdco+x11xtoeujPKvHC4ToYUul8TWnZcTPGowbKT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIVNBaSD; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIVNBaSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748586259; x=1780122259;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=f9IqtBYsnJMTVYpIEH3NBR88MP2mqo9+m1ddenMsLJo=;
  b=MIVNBaSDGsNBGQSdjNsaFnGxMdOzbLIh0Ee1Dp2D1x7b93kCnSyVvTjg
   u91URmKFz5NDpmNCkeWO8L5v2Cw+qperxReTDVV139DlqhNqLOUKRbDlw
   XpX7B+n6KBsajfkfp0ePCBHTh7GspEGlHyzXo0b3jbTgUNib9L+ECnq/q
   kVqtYEeS5hooSm+EMccAsXPxA+xh3Rkdyy3eOsLL37N7CLHPye5VmtjPh
   KwWLZazv5G5x12csOyBVfm/KqV4asqFupDteBEzDeygZv0xejbGmG54IN
   idAW5t5Oed4rceDBLEJCHWiCSoSjNMLcHVzBRZviCeHmI1tRrlgtnbu1d
   g==;
X-CSE-ConnectionGUID: CPi7JtuDT8ikxfMZzybpdw==
X-CSE-MsgGUID: V4JkaJIkTVSQU443IOp/ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73203352"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="73203352"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 23:24:18 -0700
X-CSE-ConnectionGUID: AbvIHfBNTEC4M78C7BaVLA==
X-CSE-MsgGUID: p/F/suRuQfOiJki+1kli8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="180999272"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 23:24:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 23:24:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 23:24:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.44)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 23:24:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dd39XB4lWtObgW+1SJINrHHFqomiU7AGufWzKjQuiG9rfLpKxTvmBC7aWdt9Ge8gLP9/tjHNnd3LxeBELSoxLYM9jF8fD+I0qzBN/O9yvHMlK9jUEAmVK+Bh7kUSwvsNJNv7OBn7WvdTnFOjmWHS+zD4BCPfn/2r6N4ZbYDHWiBWxE6yoGyHcp9tp7z+IUHjxACDekIGRKtCkopFHSNG2cvlMMAlWaAzCynqfyRNVznwy5ecGcNZL5XafwynN1p0KfG9UCGHkH2Fuy0v3AOtdsDoIT8L5fGCMZUolDZkLVLDtUaH1aXS66z0xJHoKpptw0FujaEpKYCbiUXHPFpjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxNt+BhVhWyTaJN5LDkmHcIY+lTvl8+lQQ87Go0WhU4=;
 b=CxQy09Zaf5EReUHHG+HzTMU1MWxKr8Hq9Lb81dNHOsLV5AfOtnnWRrRIghYvOqDVRwKp18OGTjshBIGvUF/8/Q9Ve/1v17ksaECeD2a+5qopYz7wjY+dbvC5d8DQWmsWZF27zq1pruwzUfmDiwm82S+m3+2NywUoOywexdxIIZnnSAwKgtwNeeR6WwVb2BB2+ssp6VCp0S7zFzQ3Qxq3yA9W93yga0sQChGDHNA7+5DaMZ/wehdoFV0zg7YJRJh1vMyXJGv1XJZb3q1Eab7esXTXDdujXey7lF2/82IDCuTrJV5zfSZV/NzzaYnEOduDIvJW5AgwkxrO+Hxvb8Ipbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 06:23:56 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::c4e2:f07:bdaa:21ec]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::c4e2:f07:bdaa:21ec%3]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 06:23:56 +0000
Date: Thu, 29 May 2025 23:23:53 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, <dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Trusted Security Manager (TSM) updates for 6.16
Message-ID: <68394ef8f2b36_3e701007d@dwillia2-xfh.jf.intel.com.notmuch>
References: <683902e2e98df_218f10017@dwillia2-mobl4.notmuch>
 <CAHk-=whjvmBiZ=oMnR-R9rqzEPnGCaU7dNLkY1RHXwjRCAR5YQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHk-=whjvmBiZ=oMnR-R9rqzEPnGCaU7dNLkY1RHXwjRCAR5YQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To SA3PR11MB8118.namprd11.prod.outlook.com
 (2603:10b6:806:2f1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8118:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: f24f4fc7-5838-45cb-5128-08dd9f428e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xvg4CNEjhTkOAhq3BDw/+7NIO/GB6sJkyMM4znjgd+9cxDM/MwW90tRtSeAc?=
 =?us-ascii?Q?4dYsCK1eOwyQMlkyhtbDQg5vZKs9qXZT45wXHIoSMhClwj+u/1XKDQZCvFBF?=
 =?us-ascii?Q?vw0pAizjeR04VSSZnwFDiaf5VM9ZWqd4pLKkLtL4axdYpr7QZmV0wJDMyNaj?=
 =?us-ascii?Q?rUfCPNG+1Bttblh1rt2wg/ZR5QjnYPKpSAznQJvn9zWeY49QPeLfciWFvfaZ?=
 =?us-ascii?Q?dvzZbsGALqBRrZyNCvm3hrlYu+idODj6ukLQxdWNe8HP1N9CktKg0D8DAfoh?=
 =?us-ascii?Q?05Lrvi3RiNgYq/+c09dHUzPTqcYKtmfZVadENnd7h+5CIreFoM861hfHWQY8?=
 =?us-ascii?Q?tTE+bLSQ/wsXuvm1z+YvJmnv+KYnWw3XUoBT2Az8gw+0MeiCTH/6J5ZyjAFY?=
 =?us-ascii?Q?VsRJK2nLbd8ccyyhJ+c09d4G4a0imyxn1Bhhb6Mnwp3HtIMRNRW9r/uHgpEt?=
 =?us-ascii?Q?I3Fhaywwb/HcCTLqab0USVY64vw+SVtOJnGPByn18usOABQiQrMn80X9DAkG?=
 =?us-ascii?Q?TB4+IQPiNtxhHcUYRUudnc7Xg6pipTKoK2q9azg+ER/mPs3STG43+afwhpxH?=
 =?us-ascii?Q?Psn3oNNrDoIIyLcg3WDqWILBSk7WGsD7FyDHaTgEuTQpiimSTQqw+8U7kUee?=
 =?us-ascii?Q?Ol7Oc2bj2NktsRSiyDdoFKeUjs3/fkNeqxkjXZ+mXVJS+FoQgpRRR4T6WMTA?=
 =?us-ascii?Q?Vaks+naI1m2VgPqbgvEVCTjXkQn2vjG8a+3Y4anmDjIl5zt/luRG+8wY1M55?=
 =?us-ascii?Q?/NAoY2oMwnS2qjgv+JNX8tEtbdU59A+HmTkUKkVHxIf5BT3sLp9LO1KxvYK8?=
 =?us-ascii?Q?gSP03vbmwDBKDOWly1N8bnzYIYrnnkmZD8U0dMBosZgEiyXuk05qujXUjlW/?=
 =?us-ascii?Q?Rf+sllKBSX3xYOgOdTLHhtTuEvLPrtp2XL7VkuCwY0m2cNfaP3FWtVk5ewWt?=
 =?us-ascii?Q?53Kw557mJanLFMxx965WbwKMk4oBsMBDCg+OCob9C+GLcVpoD5tOGZc0JIqZ?=
 =?us-ascii?Q?lQAgeq1bvSx9Gpws2Lg4wI9otuTidaG/9LxWtD3J72b+98vV6PrFwsroRHbo?=
 =?us-ascii?Q?Bf5FbbhJV0FaLjEkJI40v4lAKAFOlbr3vTsnahKv3BqGB7xoDOzjaVc6OHL1?=
 =?us-ascii?Q?m3L+DM2/j4ekEsTQPyOGoUrrkdh2k09B7KMaQifJ7QkdrrS40/nsCMR6yCBu?=
 =?us-ascii?Q?tiYzBiGc0oX4ZufBK6SETM6kDVZA2Qx/8CwsHX1ECCTq2gdBFDonvJbNaVGi?=
 =?us-ascii?Q?GaC/FJ9T9AYUqTE0Zw9bNOEw5RXRzCIRs/qgxYPcjsczdLlNnzrSWFgAYwEc?=
 =?us-ascii?Q?lRNsvqg9J7x6kCg9v2N2/MTqwZF4PudG4JUi37fzXwVGqgEJtF5mT7QPWaRA?=
 =?us-ascii?Q?H8UK2Aean90ezBPEydd1MF9EEk6PxLOeJYfObx7D817+qtBlDSKSgGPcyg4O?=
 =?us-ascii?Q?qh8IO5WkL1g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8118.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/uY7SWXD2ritR/3O5fFm/d/GdZNmjrYffSmmYsQyB8MhMNy6Xa4MAjUsjzzj?=
 =?us-ascii?Q?zAW4EPEsYOVxFWDDzH7FDutOc/psHOUEgr/2NeINBBz5A2+RDeppv47AG1OL?=
 =?us-ascii?Q?f2EiTp144ztUvIwzvfNCFbwxtQKsWtPfpOCFqNumjvg7nhOJWrWpIfX+MBlf?=
 =?us-ascii?Q?BZLMt8BOUI9dakyT5F39JtXcm65CLQnFHLUFzs+RihIQVFxI42HE9720g9my?=
 =?us-ascii?Q?UOG9vdLBIcYSciWAqFbeYOZ40mOe6CG423GRCdD+/ZyuAN59fEhMZNKGO+sn?=
 =?us-ascii?Q?JS/MWh9N9a40MTaRCJc3HpvxlqXzxTQXOmZ2FPPD0Ebmxrd/ETq3Z+12cMXY?=
 =?us-ascii?Q?zumAliS2yCe++EP5IU14vUSG52PZOF3yD2yXh2pqd2PCpNBDaPCOWB03WX1V?=
 =?us-ascii?Q?dke9ar8T1RTTmpJCai7tG0Oqr9yrRV6/20SuZ5dLZpgplKJ1m7qHQOoljI9D?=
 =?us-ascii?Q?jMpObLdnQluGdS4I1CgdsFkQVzZ8QoapGHj2IhkyERNX2n4dt9YtwMoRU8U6?=
 =?us-ascii?Q?pR/TnsIi+dmtH5I4zWYHGTQaIyaSKGNLAYqw03OweHa4hP61lVT4nNHl6R1B?=
 =?us-ascii?Q?1hhV82uTdfrEPKjcA5IDpBf5zLlTRDEZjCWRauBZE8+hUlnbbEKs5phl9d+E?=
 =?us-ascii?Q?vu0rPG4MJK4ocgznCP7qa7kNLwFjvt+qWaHz28QoFert2WMq09jJ8pbqfHTn?=
 =?us-ascii?Q?wQjX/FxYBPLoiH6eaWPTelP1IB4eIagHVEx+hkpxZj3vwso5gQ6PkgfLCYXR?=
 =?us-ascii?Q?hIF4LYUvY6BsrDiTifthBowHxcY4maes241rPvwDHQBhhirL63E5JXGlg3Dd?=
 =?us-ascii?Q?CUffnNMlyfjfRwJFc7VChq3nwohI9S3VRA6Zf8gYTAWVjpznOZpkVNKLbnkV?=
 =?us-ascii?Q?oDxrJSe4nYrpCHNNTVJ4Wo4qC6yQD4Pj2+S94R+/vshrsy/haD7CzYGXvYHW?=
 =?us-ascii?Q?RQ8ovz/qE/6g8ttQ3mPslx3hThA6JI4j5xlqXu0nUSMQ0Mfz68zV9B0mkZa4?=
 =?us-ascii?Q?5eEbUDCYegwPlsYMNzW4mXNYofOwia8LvBadZUGNA3V0UHS+CtqzSCHW8a3l?=
 =?us-ascii?Q?xHIv/CpC89epwbt2Ca7NbXH0Nb+McfxoYfLa4yqC+zBiErVqAWVjXMlBHszu?=
 =?us-ascii?Q?cRKNk9YluwrWv/mmOoK3twIoK9hpOtxKeGKjNvHBdjh6npsxIodDJ4doWGNP?=
 =?us-ascii?Q?6LKO/ZXY7k/QGTzZBW8aARWptmJ7mDFcgqrADKR4nkxWBz19TmgKK+B+IlPb?=
 =?us-ascii?Q?dEnDV73h+IDexizc9tCsIXv/7Al7VU14DFJmJvlourcD0pFniRa4abkMhEeH?=
 =?us-ascii?Q?pQrvjpLYoWjA5yyb/jdXSs2YndroX2MGDtxiqwSVGSUnk7zM+VLkBHQ/XY6a?=
 =?us-ascii?Q?+eoGNMn8NH1b52nONSMyRLmsX1JF0gUH2gKrolZcv5Eq5BpQaCElA8Ds4BsH?=
 =?us-ascii?Q?MH3GdobsDH+F5sLgomDVgCG7XS555twi2X2msT51+DZeWsQ1GV0rh0k9a2/3?=
 =?us-ascii?Q?wjJ1nEztLgRBUXXPrU1sHkIAxrZwu8RENBOBZtBz8iYpsHduNsDjgRUG/FMp?=
 =?us-ascii?Q?G91kVaEHlbA5oVoMMILQ9gya+URLGYcPFEynD7GEOjXzNOE3AE5ucvD+Nl4F?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f24f4fc7-5838-45cb-5128-08dd9f428e49
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 06:23:56.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPW/mJ+Zf/XIdaEEW8yNxv4ZbcphYgEk7cuzktPxj6pFbAm8HkXabfbhpZiCD2T3eoUZtOepZVbuHu4pRd3d7FQFdmQ7JBNbpaw+jdhO79U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
X-OriginatorOrg: intel.com

Linus Torvalds wrote:
> On Thu, 29 May 2025 at 17:59, <dan.j.williams@intel.com> wrote:
> >
> > ...to receive shared infrastructure updates for confidential computing.
> 
> Do we have a sane name for this? The pull request calls it "TSM" and
> writes it out as "trusted security manager", your intro calls it
> "shared infrastructure updates for confidential computing", and the
> MAINTAINER entry calls it "trusted security module" (note the
> different word for the 'M').
> 
> Making things even worse, Intel also uses "TSM", but in Intel docs,
> the "T" stands not for "Trusted", but for "TEE", which in turn is a
> recursive TLA meaning "Trusted Execution Environment".
> 
> Yes, I've complained about odd TLA's before, but TSM really takes the
> odd to a new level.
> 
> I've pulled this, and I've used "TSM" in the pull message, but I
> really think this TLA disease needs to end.
> 
> Let's have a rule that TLA's are ok _only_ for things that
> 
>  (a) go back at least four decades
> 
>  (b) have a basically unambiguous meaning in the industry (let's
> ignore IBM that made up their own naming)
> 
>  (c) when you google them, they give relevant results
> 
> So, for example, talking about a "TLB" entry is ok by all three rules,
> and a TTY is similarly not a bad word.
> 
> "TSM" fulfills _none_ of these.
> 
> Please? I know you work for Intel and you probably signed some
> paperwork saying that a certain percentage of words you use have to be
> TLA's, but please ... We can do better.

Intel TLA disease is real.

Also, it is funny, in a sad way, because some of these patches
originated in a series where I spend some paragraphs explaining the
absolute silliness of the acronym soup in this space [1], but then here
failed to respect that "TSM" continues to be close to useless as search
engines fail to find it.

I note that "TSM" is used in the new "security protocol" sections of the
PCIe specification. However, that specification being a members-only
accessible document does not help at all with the discoverability
problem.

Suffice to say "TSM" is the term the PCIe specifications ascribes to all
of the various architecture specific firmware/firmware-ish modules
(Intel TDX, AMD SEV, RISC-V COVE, ARM CCA...) that can touch the "secure
world" of the platform. I.e. setup confidential memory MMU or IOMMU
ptes, and talk the PCIe protocols to setup link encryption between host
bridges and Endpoints.

...but unless and until that becomes wider knowledge I agree that it
should be spelled out with references to where the heck it comes from
and quick reminder of what it is [2].

[1]: https://lore.kernel.org/all/173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com/

[2]: PCIe r6.2 Section 11:
     "The TEE Security Manager (TSM) is a logical entity in a host that
      is in the Trusted Computing Base (TCB) for a Trusted Execution
      Environment Virtual Machine (TVM) and enforces security policies
      on the host."

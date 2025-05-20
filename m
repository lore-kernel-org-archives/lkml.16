Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9CA25B1D8;
	Tue, 20 May 2025 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747765429; cv=fail; b=S+77qS735T8WLmNbOaLWeVXl/NbYhqAW7OqG4RbLuqpfI9y8jU5Ppkj634niqnKVAzHRULJbKt0fX0lznG0JgpBvLyCAfUXjEDWanHh5Hvbs9DWm8B9STnU4pTQhYEZyobi4FkQ+PHkhEh5lEALd5fHRTCxXz5Ruoc/vCFKGc+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747765429; c=relaxed/simple;
	bh=RXlx0bV/DE2zjVxX5Z4+Axe57AkNfzh+1rUt5Cgz+DU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R4UKoGvC0StKKvTceOUll3IM6YFkmvlaLx66srat+NrPhuSCciqT3wZ8IP2mxllQb9Q2M6Xv8Qi2ouhks4+OTmmgC4CDSAp5VN8NY7g8Zl29byrrREHAdrbDs9D54ujsZS3ghrDycnhMy2fgEpArZHxpmK78sV8xjrIv1ozu+28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GX2IMpin; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GX2IMpin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747765428; x=1779301428;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RXlx0bV/DE2zjVxX5Z4+Axe57AkNfzh+1rUt5Cgz+DU=;
  b=GX2IMpinGyBMZsR5pnWCnRX0S7gRLwaYQ93u9sEfsc8QuDXTierE5wmJ
   2K95KSNLCgRrwlmpJBPrs3rmulCW/9Ky/KIWvuV5OnkJVjjBtz49l93tO
   9VJQgwTYSbrNPhHbeTzFTykido46iPUkODonFaEp07rG5wxFnxrXsajCA
   fe75iwhHaHhAEbPvuwZogufCkqCh8IKQgBplpLeqPjhLI9j3h1OPCEsTs
   jZWj8H1U/cv/DEm/Wc+dFMSqjB4ARRZ6mszS/n4qxMM43N5ZLSbmfU6T8
   6q1j8UmrIfjeOpsIqRRSdiKCaSx+U0KCB1xzokFNX+70QMQodXdgFxv1p
   w==;
X-CSE-ConnectionGUID: nsgcxZc3T5aQRILUn70V3Q==
X-CSE-MsgGUID: IPEn7tRdQRunOpKOmWfbtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67126990"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67126990"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 11:23:41 -0700
X-CSE-ConnectionGUID: Fkg9y1t9SWi3aJuOp9J7lQ==
X-CSE-MsgGUID: fWfbwXsDQZebI6ag8l2YQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139619232"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 11:23:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 11:23:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 11:23:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 11:23:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlW3W0rent+B+WA0WgiWqvozN76M1qcFGeUhUpZrrkIijI3+wVO2V//E6dsA1njugLcYg1KUCfsfplrkXsLbSGUFBx2jaekNeEvS+gNKxcjAW/Mj/9mXNQoB4TyJrGIljALqITGT3uZE0TcbqZtht3/TrgjBRDgeZ+5d4wdlvq/D1OP4v9o9LSmtTVcw1uomTB459u2Lf4pbAP2x72KxifTrDX2xHyOXj23xy7oRxBF9tn50oy2K8gDHRreMrFWmuoU8kFVqb0QLZpu/21efO8TPkpNuMRPndxSuhRYH3QLW4YDWApbNyPV8PklG47OKcwGZaFYoVn6gqgzO2MYWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEAwO0LxqTvieGSCMKOZKFSIvDwRmAdUpnTCp12o9WQ=;
 b=HIaJ7AH4OkNyw1QYBJ+he4iL0YtichD5hmujTVYFiIiQFctdkgemisCay6QaCEj6e1Wk2xL7xZzwLcbWqQrLjc6eTwZu+fy8pBKmO9U4b3iBRXkDGqr18IDxYhvxuAlAJTyW4NxXjvnRu9D6AniNapG7RrRkzniFNkt6RoLk8Kmq6B8wRF5QJd40Ecf0iVOdM37So/4L+gcDhupCrnTZARWjCkhDKYJ84ekJ6OVs2gjLasIk3riSTXWZDcZg1k5EmxP+kFLjU1PWArFLaIVJ1ykxMOTFYOOzRt/Nc4GziIK2gfdl+wg+sF5QQFj2+uuG8odheZljjF7k7ZSa7wgO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB7024.namprd11.prod.outlook.com (2603:10b6:510:220::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 20 May
 2025 18:23:34 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 18:23:34 +0000
Message-ID: <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
Date: Tue, 20 May 2025 11:23:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: <babu.moger@amd.com>, Peter Newman <peternewman@google.com>
CC: <corbet@lwn.net>, <tony.luck@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: a443bb2c-213c-4e0a-92c9-08dd97cb6dfc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXhacHN0MEFJRUJvekR1ZHE0ek9xMU1IWHRJZThLUUExblVQNVRBL1R2Z3BY?=
 =?utf-8?B?dEZuY1RjVDRPams5ejFLNjloOW5TcCtldXhTY1FlWkJXdkZMdit4bmlBNFJP?=
 =?utf-8?B?Wjc0bDArTjFyTEpvWnFjUGpoUk00QkNlQmhuTkJKREQxYTA5RWJIZzhTL0Y0?=
 =?utf-8?B?SGsvVWtucmJ4TXExZG02SUllY0NkVjV6eUw0NmdYTkVsREwxT2VHWVlCOGI1?=
 =?utf-8?B?RGdMUHRaOVVWcFo5RmpxMFZBMS85ZnlpRFBUK0dpNGRLSkJNNU1ka3RmTEtF?=
 =?utf-8?B?Z3ZNOCs3aVRBYy9Ib2JHa2QxTDlURXI1akNSclNobnZJb0MyMDRvNitUY2pw?=
 =?utf-8?B?dzVRZy9hQm1mb2NJT1IyUWRGZHhHSS9BS3dESFUzejE5R0ZhR0l5d1VqZGRY?=
 =?utf-8?B?bzFFVnFkQzlrb0tydXl5cUlFVkpNRi80WDYwMkg3aTNvQkJxaVNOSzBEd09Y?=
 =?utf-8?B?YmYwdE4yaDgwd2drSjN6ZmxXYjFUTEpUMjcrS1greEVyMndVQnF1U2FQcmhL?=
 =?utf-8?B?ellzaUVmbHZia0YxWGxCdlZaTU5NYmgzaXhCaEszMDZrR3JJNk5tWHk0andv?=
 =?utf-8?B?VmRBUTNTcjBpaUdoNHBBYVZIUmM1K3dXWFVEQlNEQlViN2dCZHpxNGJZV055?=
 =?utf-8?B?R1pPK1V4cXN3VDdlSzlXUjl4KzRXczQ1Y3RnaXp3ODh4RXdqNEpha1V3VXJU?=
 =?utf-8?B?UmViR1Y2eXd3QnF1UUNCSjN4cUZEYVBOMEU0UEM4Qm9kMVJJT05Fc3AwSkFO?=
 =?utf-8?B?dkpkdk0xS0gxeE4yNFlGbGM2RUdORnlqUjhVTU0wS1p0QjVTRVoyb1AzUVFW?=
 =?utf-8?B?U2U1SzVkZkJTVHlHWDhGeVF1elhoQ0d2eW5BZU41VEliMlNycGJEdnJsWEdi?=
 =?utf-8?B?L2xzNEVpUlRha3Rja2hYWlB6bWMwL3pvYndldStNREJwSTlieWx0NCtXY3Zy?=
 =?utf-8?B?V1p2ejllK0w1QUlUb01EdW5yK0s4TFAyYTlVUFR0ZG9GV1d3UEZkenViWVdN?=
 =?utf-8?B?Z21oTlBEZ3JGZUI0MHBsMkM3dFZtRXE0QURudmlqbmJCdlFPb3hpWXJVK0sw?=
 =?utf-8?B?VVY2b2NQS3VPK2h2TDl1blJqM0ZGSU4wbU8rV0FjbGNGQ1BNSFVaQTNlMHZJ?=
 =?utf-8?B?RmRhNUk5bnpIQVp4aEo4TmIwM1B0UHhBOXRTSllRSUxWS3lvazUyaDQ4ZTJ0?=
 =?utf-8?B?b29RNnFWcnZTaUNUS1FXTzBqVjFlOVVzazQyOXl2anJYbGNjY1hCTHNzZm5v?=
 =?utf-8?B?SktKc0dUdnlEc3gwWkYvRnk4RS9rZ3RJV1VUODVKSTlSYk9mMHFwU2EzR2Rh?=
 =?utf-8?B?UGZHQkFjQmdhMC9XN0hJVlZEU2tIKzF2T0krTEZYSjEzUlBReCs0VWsrTFJN?=
 =?utf-8?B?REFDbnZ6Sk5CdTBTN09yY0x3V0REZTRpMDNGMTNLL0IrZ2xJU3FDeTM5b2tE?=
 =?utf-8?B?ekpaWlFJT0FKWWZwM2tEVlBiME9tblgxK0NBbDM0b3VGYUZEdkVCRmlwNE1D?=
 =?utf-8?B?cUwzck5vdzcxZWZwc0kxYVMwbHJ0ek90dTVaK1BTcjlQaitVYkgvL2drNU5Y?=
 =?utf-8?B?SHFCckVKRmNEMk5vOGF4VHNIUVVDam1qNEF5M2l5T0prM3U1elNWWHp2ZUlh?=
 =?utf-8?B?SXhtRHZ1Z3J3YTVLYUc4KytBblZ5MFlaLzc3OUJvN3hwR3NXWUdQejFXb2Vw?=
 =?utf-8?B?NSt2allCQkhwSXEwZ3l3Vk5wMHZzK1ViSk9YcSthMFNHMWhRWWRBUEN6ckhx?=
 =?utf-8?B?bzIzY2MrN3lxNVkyc3J0MlhpSkVwdkQ2MmI1ek0zNzFZcU0rWVZUSWtYKzd4?=
 =?utf-8?B?WE0vNGR4SmlJUFlheW1WN2FqSTY0bnhXdWZ0TkpKTW9UL0NiTndVNndBSG9N?=
 =?utf-8?Q?UoIxXocTIr9Bx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bi9ITTdod0RhajhLTExnNTY2Qmk3MU50WVAxcmlqSFNhU1UvdlpJNHNNQldp?=
 =?utf-8?B?bTNsVnlpbHk4allOY05PeTNLRWpHOFkwVHpRWHRKa24zS2pHSmRyVDRIRjRV?=
 =?utf-8?B?YndtblVRc3ovT3FvdUNlMThQTitIZUxNQWZRaWdVcnh3MVh2T3VsSDI3Qk4x?=
 =?utf-8?B?ZmZvMGtkWXh6TGc2UzJsbkVyYVJpS01ET3p0N2ZwODdLaExoQkl5RHd4Wksy?=
 =?utf-8?B?L0RQYlVaOTZxNFNiYWhDTnJ2cFRhK1pQZ3NGM2t3SWlZL2R5V0ZIOGhQMTRG?=
 =?utf-8?B?UFoyS1crMXlJT1gwaFdxM3NNQ1EzL3RzeG56WWNpcjlHTDcyZkx6VUNjMFpO?=
 =?utf-8?B?TmQrSE9ScGVTNWozN2taNlROa3BqZFlWUitmTlBDRGZEWkNIQVdtMEpCUnJV?=
 =?utf-8?B?RzRWZGpNWTlJS3cyNkdCRmdZeEFjOXRCNCtFaUZFNW1aT0toMnNMSUlNNi81?=
 =?utf-8?B?cXVFM1R2ZVhtUkpNVUwzYk8ybGJVTElzYnpjclREU01NUnRFMHBCTjU2cDlX?=
 =?utf-8?B?SDJjWE0xWmJtcmNUV2ZyOFR4RFp4bHJ4NzJaV3RnK0wxcmIyYlN0ZE9IUS9u?=
 =?utf-8?B?V21lS3o1OE1vZ0R2Z2hMZWcxK2JPMjFPbE16MlhTQWN6UE80aU1KUGlQa3lG?=
 =?utf-8?B?UnBlYUp3SGFtWjgrKzYycVN3QU11TzFYOVRBMEk1ejFsUGFLMHBMZHFJc3M3?=
 =?utf-8?B?MjA5aEg0MWtJb0RQcGFZNUdoMkZRQmphb2JFS1M2OENCb0RZNEluNHNXaSs0?=
 =?utf-8?B?dTd4NlJUdTJmQVNTRU9IZzJleTBtU0loeFdFV2J3eE92U3dVTDRrR3czdll5?=
 =?utf-8?B?eVc1dGdocFo2RzdhV3JVU1Q4Ri9JRzg2NCt3Yk1Yd0d0UlU3a1lrQU82bHNj?=
 =?utf-8?B?dDZOc1VacGFxNGZSOUV2c1Iva2F0L2huTWQrcGxwSzA0M1dRa3VkRitVVUhp?=
 =?utf-8?B?OGN5LzU1WGVnNFQ1YWR4am5ZOGtWOTZKYzFkTDN3NnlTaHVoT3lVMGc2NlV2?=
 =?utf-8?B?ZTc1V3VkbHByditTNVlwS21ranU0ck9CMjQwUjE3T204VGwzUUZFZzQ0N2lJ?=
 =?utf-8?B?ZTlrNHdUWXZBOEhSbzhmd1JobVZwNjFXODNFK1FVVVZtNzFTYjZYdjUxMjg2?=
 =?utf-8?B?Ym84cW1ZYTNPV0RvUWdkZVRIQ3l1RWNkTTdIV2lsWTF6MWtzSWtJL1NXcEhJ?=
 =?utf-8?B?VXlOaW1FKzY4OE1YK0FVU2cxLzdBTmwzaUI0eHlwTE5XOTRDT0RIeXdZV2Zj?=
 =?utf-8?B?N2NIem0xc1FGd1NwL1dxOVEyWnlDSzM0RDg1ZmpnbmVCeTg2VGtHS1pxTEN1?=
 =?utf-8?B?dVQ4Rzk3WUJSRWNnRlFQWFpmSzVseWZGanozT1hMMU93bktLczlPVCt3MFJB?=
 =?utf-8?B?cHNuakMrMXNCVVdZVEIxMEdiTXZlT1IyZitrMmMySXdZZi92QU9VYW1EbXpJ?=
 =?utf-8?B?RmhTZk5JTlRrczJNN2NUWlJlQjMyTUd0Y0tWVkk2ZTZFQlRSWGFja3RIeFVr?=
 =?utf-8?B?UzJOVXR6L04vMEFBVDZUSHZNSWREQlUxNzNJZUtyM3c0UkVmL2pRbFhmOG8v?=
 =?utf-8?B?WDFoVGhFMHVQT0pFSngxQXprV2xiUVp3OWFlUG9UU3dRa2QwVmlmSjRKVklL?=
 =?utf-8?B?ejRNSkhZWHRjQ1Jyd0ZSek1ncitQQTJVMEFkWkRqOFRXblNzd24vcURhbEZJ?=
 =?utf-8?B?TGhjeURQekJFd2N6N3ZpL3E4TEJiTXRDRlREaU5zdlJ4N1ZYMjFpTktUTVps?=
 =?utf-8?B?Ri9TK21UalNESjFiVWw4aDVOenQzL1FZZ2tEM3FoK3JWR2pIZmp1c05nZWFm?=
 =?utf-8?B?aFh3VkdpcXphUHZWWHdFOXA1M0h1QUVnOHpMNVlJZUNuLzhHMWo5WTJjSGJC?=
 =?utf-8?B?Nlk5Qko3dUdnRjJ2SFdjT0I2SDFtNUpnMHJvdmRVSENaRU9EQXkwOHBXN21F?=
 =?utf-8?B?QjM4VGxZbHA0N1RHR3QxK1JsSDhyWWNUWUU1M1NkNElnV2NGOXF6SXhQd1VP?=
 =?utf-8?B?dFRsd0ZBL2hBRVhBa2VXRlNWd1dMallyT1dtMVZLOW5TNlhONmhEeEJZSWtL?=
 =?utf-8?B?QzJtTE1mMUM3cStYYkFTQk04eS9sUlphSTRCU0NmU09Xa0xYQVV4bTQ2UzNq?=
 =?utf-8?B?WEN3bU9RWXJKVGVXN2g1UStCUTVhcDVFOXBQZ3dHdnRvL3hhdVFiQXhTOE5R?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a443bb2c-213c-4e0a-92c9-08dd97cb6dfc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 18:23:33.8628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyiVxK2bJvKdxQ55102IoEk8TgFxsgVMj6lX6x4pfnCJZEWntRZ3gj+rdktEoit900AczLdi8FkAz8OezWsKojSulwYNO55hbXshoa0lfOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7024
X-OriginatorOrg: intel.com

Hi Babu,

On 5/20/25 10:51 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 5/20/25 11:06, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 5/20/25 8:28 AM, Moger, Babu wrote:
>>> On 5/19/25 10:59, Peter Newman wrote:
>>>> On Fri, May 16, 2025 at 12:52 AM Babu Moger <babu.moger@amd.com> wrote:
>>
>> ...
>>
>>>>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
>>>>> counters available for assignment.
>>>>
>>>> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
>>>> represent in a "soft-ABMC" implementation where assignment is
>>>> implemented by assigning an RMID, which would result in all events
>>>> being assigned at once.
>>>>
>>>> My main concern is how many "counters" you can assign by assigning
>>>> RMIDs. I recall Reinette proposed reporting the number of groups which
>>>> can be assigned separately from counters which can be assigned.
>>>
>>> More context may be needed here. Currently, num_mbm_cntrs indicates the
>>> number of counters available per domain, which is 32.
>>>
>>> At the moment, we can assign 2 counters to each group, meaning each RMID
>>> can be associated with 2 hardware counters. In theory, it's possible to
>>> assign all 32 hardware counters to a group—allowing one RMID to be linked
>>> with up to 32 counters. However, we currently lack the interface to
>>> support that level of assignment.
>>>
>>> For now, the plan is to support basic assignment and expand functionality
>>> later once we have the necessary data structure and requirements.
>>
>> Looks like some requirements did not make it into this implementation.
>> Do you recall the discussion that resulted in you writing [2]? Looks like
>> there is a question to Peter in there on how to determine how many "counters"
>> are available in soft-ABMC. I interpreted [3] at that time to mean that this
>> information would be available in a future AMD publication.
> 
> We already have a method to determine the number of counters in soft-ABMC
> mode, which Peter has addressed [4].
> 
> [4]
> https://lore.kernel.org/lkml/20250203132642.2746754-1-peternewman@google.com/
> 
> This appears to be more of a workaround, and I doubt it will be included
> in any official AMD documentation. Additionally, the long-term direction
> is moving towards ABMC.
> 
> I don’t believe this workaround needs to be part of the current series. It
> can be added later when soft-ABMC is implemented.

Agreed. What about the plans described in [2]? (Thanks to Peter for
catching this!).

It is important to keep track of requirements while working on a feature to
ensure that the implementation supports the planned use cases. Re-reading that
thread it is not clear to me how soft-ABMC's per-group assignment would look.
Could you please share how you see it progress from this implementation?
This includes the single event vs. multiple event assignment. I would like to
highlight that this is not a request for this to be supported in this implementation
but there needs to be a plan for how this can be supported on top of interfaces
established by this work.

Reinette

> 
>>
>> Reinette
>>
>> [2] https://lore.kernel.org/lkml/afb99efe-0de2-f7ad-d0b8-f2a0ea998efd@amd.com/ 
>> [3] https://lore.kernel.org/lkml/CALPaoCg3KpF94g2MEmfP_Ro2mQZYFA8sKVkmb+7isotKNgdY9A@mail.gmail.com/
> 


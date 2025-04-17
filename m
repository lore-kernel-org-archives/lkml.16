Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0970F252295;
	Thu, 17 Apr 2025 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902556; cv=fail; b=UNDx5DrkaT0czi0gq4kf0byzr+X9dj9FXxBoRqjxNgcRXSQqEaRRimI+s5Z8SaqVvY4gSAkU2jMk7USN3Ht5YTH4vxGkBDVZxA9tQWpG82DwGMK6q/MUzSOFaJiTrv22or1XJI/eDJud4pUoVdFdLAzh5OlOykDmyHyp4xOuGQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902556; c=relaxed/simple;
	bh=5+dmQ81Vozjdq6FNoJyaTxPmA+y7dFKDi8IBcFGT/lY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tme8Ylk+vbp+pJhYOGcgS03vn/HV4xRcohtqlAxZxREAc1sZpsKG+SZxTOeVkegmnPhvdte89hgL/VP6eMoxiRwNjQVMjqlgwUnPx3Jwadcm5PbZfBURrKgZNXUEuYwN4hkXUiTUwzOK47SzOkCl2jMMDDTPkTolfbgqUEJQRQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVzSU5S/; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVzSU5S/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744902555; x=1776438555;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5+dmQ81Vozjdq6FNoJyaTxPmA+y7dFKDi8IBcFGT/lY=;
  b=MVzSU5S/OdW8v31HHOTuFmgFRXJo+vhNgfWRuYL4jVDI9AGlZ6x6beVt
   l/R4DxikgPsG1phe0QXWq2ugeYL1zSo5YXcCKkrrze9gj0A6OkND4Z5SM
   lYk/CE077REe1QMLjDODioZz0JhmXzSwTPfph+Z4TWUGDsuSFN51nqvDv
   22A9tAbxhnufW/QGPuPbimNyH4eesO+bYXD0/KpFm8y42FUBG9R68pMhG
   rWwZ+uDU2HRVXSWJhrCx/LUhoVDEWNBmFAogJLz5GD8OKr/l6+DwNBcqH
   EIPPhEw2Yv6rBig8a6Oxgfp4iF+OOnjmQ36yB1mIcKbG4cZf4TxXlB/wK
   g==;
X-CSE-ConnectionGUID: mSsb6pfnQ8OPb0CM2L8a1g==
X-CSE-MsgGUID: Ewy4Ovp5QV+7+f62w2GMrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="34110250"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="34110250"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:09:14 -0700
X-CSE-ConnectionGUID: NnJEsx7eRamWmPl/FC9YbQ==
X-CSE-MsgGUID: kOgJeajBTj+DQAGlpXc8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130794556"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:09:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 08:09:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 08:09:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 08:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRBc5Z4Sm3iFpJwYH20/ipqFINTMzaHdviYtj6rUSJb5MwGHJL1/zryB1NSzIxyGlDtt+HiQzCIeGVYQuU1hkaTMdFzbiTnuqULEnNOHWkbM8E32fFNwOUlG7rSbiUr4ysMIlgk76owLU3A6jp4hVWkkrs2gAVMKKVGIgqwIeiUmfkRbjOKaW1B+Nh8B7xO9f0+f6FiZXGWLiYaLY8CBXqfFHNAQGMJfUA1pUD0Y6Wcc8qTh5S2jA+Hitv55DOUbY40IIZPkBT4qIrTMtYmiW73EDgH3egROPIAPiFZ00Ui8+KgogR8bzHWjgur1scjT1Nqd2kpTcHfa53KIrP/e5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Xg2x3sq6KQU9vpBP+avTX1tIqikHJbZZREn2rm/220=;
 b=voLxt/ZYRckC/e92qP/nllGiZlZncmnTAHe8whe00GQqRqggTRwPdKpEzy/kIphIt8qw2O0GfrTk8lxj14sLnODqj0KYiADFE8AR2e5NSce2eBave9iV+1ZpKHp0VGelDjJD3KbRzOzgMRiPjjMjXuyoozaJtL5TE0d1x4Yp1q+IuQMQ+uNd7CG2R7mYD4J91rgWjtS41+WK9ZcTJFKJO5sP2p5+ztujsTjW4TkyatWyZX315z0OG2Q82jkntz1vrBCxp1CtRPfFqDeaM1CtJKqAlPIt8FlCD/GMBObStHlTN0ncn8eKDt6ApcEEWr9iRi81cJcIAnxyEx7eCGPbkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA3PR11MB9109.namprd11.prod.outlook.com (2603:10b6:208:572::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 15:09:09 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 15:09:09 +0000
Message-ID: <2aff0d11-91c1-4a3e-92e0-0ae49c804549@intel.com>
Date: Thu, 17 Apr 2025 08:09:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 20/26] x86/resctrl: Provide interface to update the
 event configurations
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <d18beb9ca31eb013405677792377542e609ea693.1743725907.git.babu.moger@amd.com>
 <7be35258-f913-4111-b5da-c4173615cf18@intel.com>
 <7423145d-7de7-4414-85be-b7325c01b437@amd.com>
 <fda6c46d-c01c-494f-a2ba-efbcb1f331b4@intel.com>
 <c3c54172-087e-4a53-bd66-7849402f4a55@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <c3c54172-087e-4a53-bd66-7849402f4a55@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:303:8e::13) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA3PR11MB9109:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf109ab-af1a-443b-b137-08dd7dc1cd94
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVQzMmgrY2F2SUhIaE1NMXFoU0tEOXFEVHEybUdBd25zSmgrOHJ4QzYyNVVx?=
 =?utf-8?B?eUlDb3doYXliK0VaZVFvSUJzQ3JzSndFcm1tbk45QVNReWt2Sit0bFRqTGl2?=
 =?utf-8?B?ckduaFI1VVdHVkc1b0dsNVlzQ2tTemREeVoza3BjeitJSkhNSWg1aSsrL1pH?=
 =?utf-8?B?UEUwWDNnSEV1UDZCOEVGdDBBT2VuaHJqYnNocGxaUXJ5TUh0WG00Sm13dnFy?=
 =?utf-8?B?U3l6cnYvSWJsTVgvamVaTmtYejcvWTlqOXF1RW9BcC9aUVZkTmZYT1dxaENZ?=
 =?utf-8?B?ZEZ0d1lQSDBZcHF5eGhnalV1K01QaFE1Ykplak51WVh3UlF3a1lPYUtZTE45?=
 =?utf-8?B?VXk4NjByeTJSVUtLWldSdGR2REljeEJlN1E2eU82OFEwRS9TajJzdFZ0Ykhk?=
 =?utf-8?B?dVFHblF2cXFVbGxuYmZsbGh6VFRwbGNnYXdDRmpZOVBIM2M5bWpuUW1HQ3pM?=
 =?utf-8?B?bTRPM1JwQWtLZWk5YnFZUzFPSmZFaXowc2pFZnJoemdPUGIzTWh5R0U1T2tY?=
 =?utf-8?B?U0RIdm1aL0Y4L0VRejcyUFRzdjVhdG1kWTdUOU1nKzBXTXlaYlpYV081aHpq?=
 =?utf-8?B?NklvSDF4MGxJYjZMSGhKYVRCZWZOZ0wxN05HdWJidXhPZmhTZXJGVFVpWW0r?=
 =?utf-8?B?N0xaUWdxTE5LYnJEREU2K3pteCthd0VCS25iR3dYbDhxODhNL0t3NzhZZklq?=
 =?utf-8?B?OSt0L29xeEkvMVJRbnQvNjFSd01ycVNRTENiV2JadE1zaVRZMFJFUVZTSXJN?=
 =?utf-8?B?czdnNDZmUVVab25oMlZTR1RCc1RwU2ZHTkNlT1VTamVWUDVjTGh1U1hNZFJt?=
 =?utf-8?B?dzgyS0R3RXJwR1B4YW9ld3B0bFkrZmo5RTloMi94Y0xCdi9zYkh6aUdFZjY1?=
 =?utf-8?B?V0dmRFQwUnFlc1ZmZ2Q0YWE5aXpJYldnMG53YmY0WmVsTmUrdkZlNkpaMjJv?=
 =?utf-8?B?SGJUaUJKeUt4bk03c0dUWExvWGV2MFUxc0orRkRjamRQTlhLSzB5STMzd2h1?=
 =?utf-8?B?U1hVRTJRZlByNXJaRWFrMU15R0loK09ZK21WbDFwNk5rdXhSOSt6SGx2LzhG?=
 =?utf-8?B?MkxGWWhkaUMwenZlc08veHJaYS9XN1BqbTk5QkNDZmtqZGVyM1ZuWHBTQTVM?=
 =?utf-8?B?dXpkK2h1akdLelhyWFV1R3lUeHhTcXdIVE1DNGlnLzBuVjRHRTQ4T3VYQTUz?=
 =?utf-8?B?UDcyNDlLTVZrNVhBbU1keWJSQytIeVlycnNHdUdmUTB4K2l3NWc4U09oSC9y?=
 =?utf-8?B?WmhaYU1pcHVDSFlwRlNMaXJzZ1lzd2RxS2pqQTVyL3ZudHgvc1NLVVJxdlNw?=
 =?utf-8?B?d1RCYjlDNDlyTWpHcVF2bW5pQmlmR2RpV3dMYitLTHBrM2M1bWRKWG1tVnhT?=
 =?utf-8?B?SzRJUkhJS0FhVnJ6L3drdDlaQ01qaGJtTEZ5Y1FHNXRheDkwMkE1MWtBSy9F?=
 =?utf-8?B?VTIwUURCVGhYV01aaDEzSUpVN3l5eXFaQjB0Ykw1cXBQTlBnak9CWEkyd2lh?=
 =?utf-8?B?WUVXbk9jaTZuV3RQU0hGU1dHSE8xaCt6Z2VKVWRSM0UzRXZYbUFzMnlNR3I4?=
 =?utf-8?B?b3g1YWdNRE9PMnRBbXZFazBsRDE2YlZyRUNiY2tyaUhpTEtPbmtzK3dEYlFY?=
 =?utf-8?B?RnNVVXJQdDcwNHhXdURTT2xZU1YwVUl1S1l6SWFTTDdKMnVmS1dDajloZUhR?=
 =?utf-8?B?Y0NHVmpFWnpRUDRtcmtpcWhOT1RybWJJaG0rL3E0SGo4NUpFM1p2dnRXemti?=
 =?utf-8?B?dmNCb2MvR241eVRMQ2RsbXVYVkkwdDN6NE1DS0VkdmM0c2Rqc2NMMUgxNUdK?=
 =?utf-8?B?MEx4OStFQzBmWllRRlUwQVY3VTJMWis2MURsYlp2MFJmSVNaaVlLRFpJeHJ2?=
 =?utf-8?B?QVVYTUlWZXR3T0IwKzUyVzd1UFJhNW1LTkozU3FLM2NIRVJOV3U2Y1pMV0Na?=
 =?utf-8?Q?CswRBwy/uIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2RiblJtUVV3Q0RZZjlpZDVTemFEUkFkb2pERTlleGptTDIwbGMzQTVoNjBD?=
 =?utf-8?B?a0xCSEpudkN4ZFdTdjgvT2Q0a01CWVBnMDIzMURpQkxCaUVKTjZPV0dNNVUy?=
 =?utf-8?B?N003T3JCdWYrNE9ZWDYwbmtSNjRielhuMEZMQWgwSEZKL215T0hqL1grRERh?=
 =?utf-8?B?azE2TWM5NFhKdGxxRlpRbXk1ZnRWYjFteFlHZStLVGxVOWVyaTdYWXYzWkZQ?=
 =?utf-8?B?UkhiZHVYVXdHYzJQcEZsNW9uYk5BN3JRTFhoU2oxT2JzZ1hla1BEVGovU2RX?=
 =?utf-8?B?UUw5YWFZV2ROWVZsSS9yZElXRkZlZkthVDdLTXZqL2x2d2p1OGtIc0F3RFgy?=
 =?utf-8?B?NHZyWXJNdWNJbmd5NExGUkh6TmlkR2Z6ZlB6TVhYby9vSHpFWE4yOUZUU2dK?=
 =?utf-8?B?OXdySVBmK0JZbnRrcDZPSm1qSTN0cExRbkhGd0ZzbVAxQ01OczM3Vll3WTNa?=
 =?utf-8?B?UExCVWRmdmFmeWg4US9malV5SFcyOHEwbVA4L3A4WHdvMDJkTGNuK2RkUDZs?=
 =?utf-8?B?UmxHam9xRzFYdTZoZE9QVmJYWUtQOWhJTkc1TXdSUHNNbkdzZkM2NTg3WkhW?=
 =?utf-8?B?Zlp1Sk44dWhOczVZd05leVdBRFpwNStieWhPOHdqWmlZTlhxbzlsUCs5OFRy?=
 =?utf-8?B?NkprdW4xUnY0RDlzMnpMMGJuM3FYNG1RcnZNdTMyOGVsWXJhNjZXYnBCVXg5?=
 =?utf-8?B?WGNTZWhyTlMxTjJFODJjQktRRTRUcm9qT0ZaVkltS21uWEJjU1BDa3FlWnI5?=
 =?utf-8?B?UDUrT0FrRVYwS2hNMlhXV3NINmpscE1mSHdMeWRaVk0vNkU0NUkxMjVvcnRw?=
 =?utf-8?B?SDZNZlBVNGNGeldNYXUrcnZOWk9MTGZOOUxaUk1ST2IvZDdzd0Rvcnpad1VX?=
 =?utf-8?B?ZlBkMm8wQUl5d1Rwdy85SEswSGdqbmlFbzFDanRBN09FK3hUMlRVN2tGaEcx?=
 =?utf-8?B?K0lzU1JBRHZBTjFPbU9zM3VVZ2k2TFFNRVZ5NERRMXdTdGhSYzI0bldINENS?=
 =?utf-8?B?dXVxTFhtZUZCRVVEcFNncHJvamhEcE5ZUk9US21GWWFlOGthTVdOc3gwY1Fo?=
 =?utf-8?B?bWdJTHZyQ2ZTSlFsSnJWV1RPOFNCcjJQMjROSGEyZ0hwaWZwblRCTUpJbkJB?=
 =?utf-8?B?NUJnUTh4YmRWNEZXaStzbmZWeFRCZUg0bGlwRktaMkZOK2V0QWhZOCt6RVVj?=
 =?utf-8?B?ak9Db01JNWtVL05rZHdFTWRQYTVURnFiejFiNCtGOGFPN0JWZXJSZkJNMkJp?=
 =?utf-8?B?NUljaUZEMEp6SlYrL0Nzam8zL2h0Mi9JOUtKSjlxZGZ1eTVEQ21ZYnBkaVVH?=
 =?utf-8?B?ajNoVnVLRm9YTGJlNytod2NLRHBORDUrY0s0N0Z4NzRFOFJPcHFiOSt4OGNJ?=
 =?utf-8?B?aXVIMThtQ2M1S1VUTklDd1B4R3VxWWxaTW5URE5PWWlDS0FmOTZYT3ltc01V?=
 =?utf-8?B?VnJ6dEl2MkNFRTdsZmMvMEJrSTE4WVNVMHJvMnl5V0FNRWxzWndCVnNEN2dB?=
 =?utf-8?B?bU5PWkJvNGQxRmU2UGhhTjFjUnBKbzE2b1FpaVVLa3Rldlo3RHNzdWhlZmwr?=
 =?utf-8?B?ZUpsZjBET0hWN2FOdnljbjBlNzdpNWNpcmFpNWhvQmtDTm95U3NyODVqd1Bh?=
 =?utf-8?B?eHFkaTNFM255OEg1WWdmYmlMWG1lS0p0bXNTM04rcGpVK2g1QiswbEgwamU1?=
 =?utf-8?B?SHJrQi9rb082TFFmSU0wbnFuZHFOaStwb1N1TXJ2Zm9QeGxzOGJTYXdlRERl?=
 =?utf-8?B?cytVd2NDckVTN3ZYZVBZZjRoQWEyQnJOZ0dGL0pRRDF3RkNVVERDb3J4OG1x?=
 =?utf-8?B?Z3hQQ1JlZEhEQXZMQnlIb2V6bFV1Ny8xUWxjSkdnbXRrbURxVFlNMThLYVVo?=
 =?utf-8?B?TzRRUUdZZmpHY1BqZHkrU05GWHZ6cXlWemY0NlByYW5JbUxZdENPZDRac0Yz?=
 =?utf-8?B?amtDcmk5R0lTK2dIekE2d2JPbEJaUVMzOTNZOWp4ZGtXUnBjT09LaTY3Znpk?=
 =?utf-8?B?bzAvYVpKd0Y5em5hdXFFRCtzL2kxMTV0ZWtSNnpjWkI2Z3JIbXJ1Z2NZT2xP?=
 =?utf-8?B?V3lwSGhoV2xlaU9wNUxSM3dJSlUxKzVwQ01mdklDVG1XakM2bkNxTERIbUNP?=
 =?utf-8?B?V0FzakpjWERnRmZTbk5kN3NMdUd6bUNaVlhTUmdlTkdLZWRSTnVUVjYzNUdj?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf109ab-af1a-443b-b137-08dd7dc1cd94
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:09:09.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFhr47DehLuGDot0XJFCJt91dugeSTBKUSjC/Wv7N1ztxAbpofOOJP3wZWAiUqIT0gXjArvKv+PVkDpYgF9AqhW6cNDgcsHDGNrJSjw59kE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9109
X-OriginatorOrg: intel.com

Hi Babu,

On 4/17/25 7:34 AM, Moger, Babu wrote:
> On 4/16/25 13:52, Reinette Chatre wrote:
>>
>> Below is a start of trying to address this but I think more refinement is needed (other
>> possible terms for "transactions" could perhaps be "data sources"? ... what do you think?):
>>
>> 	"The read/write event_filter file contains the configuration of the event
>> 	 that reflects which transactions(?) are being counted by it."
>>
> 
> How about?
> 
> "The read/write event_filter file contains the configuration of the event
> that reflects which memory transactions are being counted by it."
> 

Looks good to me. Perhaps "being" can be dropped? Thank you.

Reinette
 


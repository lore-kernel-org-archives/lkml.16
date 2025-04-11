Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9564328137D;
	Fri, 11 Apr 2025 21:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406540; cv=fail; b=SL93uNoBK4cfTxEDXEeI5eigJBGA6Cht87Rj9kpZzcOG+vFopfXm56nZspOZHlZIuTMIod/LHOG2W5SZUjhnE3cBXrdJbyCfTuLWUNyS6I3DD8p+eXMLc5xM1A8Mb9VYQZnEdGmIuJ6foWlWECVApSaHT1vvdgxSyQnpwNe9FTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406540; c=relaxed/simple;
	bh=YATn6RjYNjjUpBiYdoSCe0eDR7JSfwlpJNx1dCkWU7U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M6cR67ZqhYhQHMfzjeGiM1Nc9GAy07QHRdDwO7Z62NxWW1nrCcRTG8rlpqRXuvKi/a71MgQwJYqfp/ks3YGnz+zBgjZmFgCwIy/vLTbT6wNp11n0Fqr03yLKxnzfFRnSrIAc8nsQEKYIGuOUkPfdFvq+7SVRCOej/Bs5WY6lSvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fm5b+Xcq; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fm5b+Xcq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744406537; x=1775942537;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YATn6RjYNjjUpBiYdoSCe0eDR7JSfwlpJNx1dCkWU7U=;
  b=Fm5b+Xcq6eTz2guVmXVadP5YDjRIYF1/ABBKHd96D7hYtj+2AA19dYM/
   M1M7AQ34jAisLkNS3JvuvzMyyHGXqdkJd0LceUbL9c2Y1hd8sETJJt6Rr
   f2xsyeC8jTRsggF0T31ilFfZPtL/i4Wu31xPhmN59O/uhKTelTVKo7+mJ
   59X4IrkGPeZqeVONNEyxKc9azz3YvC16At+alX53dJz9xG6a9vokl3U2V
   PqWvyDMaNmafdYxx8D01sCy+0iNrgGe4VVLSDTakxad36GzFTgaPC8e3k
   DjueWiZ00V4ZNrVwd905ZA1fwoFokLYFmgiv+/6aXRMvp2oA7vFRKT1rU
   g==;
X-CSE-ConnectionGUID: nKrt1yRRQ9KonVbrre4Tdg==
X-CSE-MsgGUID: Y15PTxMFSdWDVFCQVApyiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49771007"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="49771007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:22:16 -0700
X-CSE-ConnectionGUID: 1i0MeZCFT9ql76XUK2DpTA==
X-CSE-MsgGUID: NOKpi2kvQq+QOHsEI0B+3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="160273366"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:22:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:22:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:22:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:22:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSXlsHXRyMsKpmwLYT+uC7T3r7Tpghbh8+jULqnsKD4DQGR2K14RO1HyHicDOp2RhFFn5ubmXJkXDTZJbLHB6FR9lags3aNlpeUbRcgod9btUlePkq2Ijly/IW+k3bL8dMj16vb59+tOWOMCZiQ9hkmuA51d/KlrggzS+OXWKv9gNss7GGoZYZiyLwy1faPn0ekPI+BMa45bLNQvYu81YHsSHmcCsrpJf1pqzZdrwoBTRtm77frZTbbxdVnYnwWOG5kYsCjobhc9DK71doh5NpuYP8GZbp4/dwIU+YixReNdbqAOvNYAc9V9tMWBsLf7Wx9TDKS40ZiVXkqNKPx5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NA2AcNEh6YMGF2nLHwK6fpnSo+xHAB860L9i8htPMOo=;
 b=i5RjxfLj+JUzWvunKzTSIErTTkt2SDLVIKSrBkwLvtv+nENDpGl4D8HfOP04FGpVI6bcGdtcJegwixaj53AGpH4xwxw+/pVEA87g2KW6tC52oXb4H3ldceKUNkx+rCD6r8xPFCiAfGxzFwct6tcqbzZKCWE1HJzhaBdD9xKQCyGOSNzdBrhohdciRsU5eww+MYgvC0R+T9myBVOiDDxPu18nIjzLsJNVVpDPv8jpDmH0vCjTxxoWbEial7G6CaJBd2vX5UKC49A6al3jwpNLf822ipUDyk6hTa8i920kkxpkhDq8Jffh4bUpoOOb3Wyb3DEy5ZBTmAces0qgPw9+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Fri, 11 Apr
 2025 21:21:25 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 21:21:25 +0000
Message-ID: <99e8d014-35c4-4bad-b1f7-a6f8eaee57a2@intel.com>
Date: Fri, 11 Apr 2025 14:21:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 17/26] x86/resctrl: Add the support for reading ABMC
 counters
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
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
 <0389f4beff82ded90aad4bd670210c56cf1f799e.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <0389f4beff82ded90aad4bd670210c56cf1f799e.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0013.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::18) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|SA3PR11MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: f94c6f90-76bd-458e-442b-08dd793ed086
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHF5SEJIcUp0S2pxY3MzeG9RYmdKL1Q4cVFNa1BSd0JXM1hQRHE4Vkp3TlpN?=
 =?utf-8?B?aUpuVmpsMVg5UGY3eE16ek9GMFhTdHREaXpjYitYaUlPYU5BeUJON3FnbWJz?=
 =?utf-8?B?WndxZGJBSDltWWlFSDlLWlNVMXFlWXV6TlJmQ3BiMEoyc0cyYyt0SlBGRGhn?=
 =?utf-8?B?RndZRit3d25STnh3TkRoOW1WaUhCdWNqOGhMZHVMYjBUMlcyZlNUVS9CODhW?=
 =?utf-8?B?a0dScUp2bGVDTy9Gd0VNSEJOSmRFdXI4blpLMldVVjVjMHZnZDAxamx0UDVU?=
 =?utf-8?B?TDhodW93QWVsMVdmRTlTV3NpTWZoeUwra08yaE53b1BSRWh4RFRRcHlEQWpR?=
 =?utf-8?B?MitLaWVlQ09vV0xrTmF5RlNnZDlUbDhkM0JKamxRc1g0MzN2dGoyVGRZczla?=
 =?utf-8?B?bytuVytuYjBuVG5DWVZlZzY2U0phQ2tPZ042QWIzOVdTeXRBanNUR1hPWExI?=
 =?utf-8?B?UlBBeDVwdnZYcTF0Z2NZSHN1cUN4c0VodTdHZHZxYXQyMENQNUZ6bmN0dnFZ?=
 =?utf-8?B?c3JpbzczeUtFUWI2enlDNWhEK255d0NqZDMvbDJGUVlydmxsOGU0N0NKMDVt?=
 =?utf-8?B?aVhhMkpKTFJhK2puajQ5UGJxTHVoQkZIL1N3V2ttK0MrTEJUMExWc0NxVXNE?=
 =?utf-8?B?VlhOYUU1MUxiaHV2K2pPRmM1eTBLRERzaWRlVHNyNTRFR0Z3OUkzK2JqS1FP?=
 =?utf-8?B?MU9xNGc1aEgxUWRnZHdkeis3QytkeHQ0RjIwNHRGWlZBU0tqcEN4a0hoUmVS?=
 =?utf-8?B?ZnpWaWk1NWlRbUxZblhvdEV4Q09oSjRwZTJFT3dBQU44amZFYVFvSldRSUt1?=
 =?utf-8?B?aG50bVF1Yy9rbjhKamJoSUpBM2t3Ny9WMzVIcW9QcURRejZEd2ZlLzN3VzBv?=
 =?utf-8?B?Wi84cXVKWThtZ2tOVUYyV2hOWS9VQ0FlWGo4SVVCcmczRkQ3K29NYmw0L0kz?=
 =?utf-8?B?VXV3MEtjM0poV1l2SU5CMlk4MU5OVlZZeVRtcUZ0NHk0K1hXODhCT3BMUk9r?=
 =?utf-8?B?YzRNL2ZvRk5xbnl4S1Q4LytzRWNmOTQyM1hWbWc3V3pnTzJNamx3Z0pzN2p1?=
 =?utf-8?B?eWtsOG5pVDhaNjhPT2JIK2UzMC85emtiOUpDT2prZ3FYa1BldGNnSEhNUDV4?=
 =?utf-8?B?NWZhY21zQTlGeExubnJTbDFRN1plMCtqVUY1ZjdkMDhLdjU3RG1qbXJZYXBQ?=
 =?utf-8?B?S2dpaG9KTG9nRHlKMFQ4L0VxWTZkTkFqZkNyVkpLMlR0RUNJemxTeHlWcEFk?=
 =?utf-8?B?RnlYMlFBVEk4MWZTY1J4MC95WkkrL0VtWnFITFNOSVIwNHkzNEhWMVN4WWZy?=
 =?utf-8?B?NXVwTE5UaVBDMHQxUXl0MkJxUUxKMy9pUzZxSnpZdTdiaHZ1clZwK0ZHcW4w?=
 =?utf-8?B?a0Zqd0R4emtxUU9oS3doN0wwZlNLWnBwQnRZVTBEL2Irbzc4QkJGSjV3eGk4?=
 =?utf-8?B?a3BnY2pWc0FDdVVpdUMyVTBzUUdGV2JqZFI2MnFjRTU4TGtXbkFVbmZwbEFl?=
 =?utf-8?B?dHV2VkkzUjA1MjR2VHUxZmx3eElzRkpkcytUMklEbW1nWTZNM01FRlBNWmla?=
 =?utf-8?B?SG9COXk0RkVnQzhxQ2VCYVIwcHpxUnZxNkhmQmYwNFBRRHBuZm4xUURoUENW?=
 =?utf-8?B?RXhDNHh2QTQ0THI3QmIyT2lFM2dpamtGMnBIRC83OGpMSUxUWVRweVVYSkZ4?=
 =?utf-8?B?Tm01Y3VKdWphU3ZKcHQ0aXd2YkhGL2drK3NYUlIydFlKRlpGMldkeGxBb0k4?=
 =?utf-8?B?STIxa1pidVJlSXFUMXdGQ1lnNS9HTTBvY0cyclpyQk5FZVhFc3Fac00zVXVC?=
 =?utf-8?B?aU1mYUx6YTV4NU13Y0VmSUErS1BudGg2MCtZdXR0Y3VaV0hnSUZPVlZqaU4y?=
 =?utf-8?B?bGdkOXRYZkZyZHZRNGcvRWVBYXdqdHBpa2NwVG5adWczT1pyY2lpdUdiS2Rx?=
 =?utf-8?Q?0UXzU1DzKZo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJFeDNwdVlFZkhNeEIxV0dGZ3VjRW1BYi8reEJmQVh1aHFVOHhaQkU2eHRp?=
 =?utf-8?B?MU52RWVkc2NlL1c2Z0Fwd2NpWjNvNmFGK1huL3pyaTdERkkzSjJqT3I2TjFn?=
 =?utf-8?B?MW1hN3plNEVHRC9UTkdCZGpEMnhyWUZWMFFCNEpsczZqeEJZOEdYd3JWS1hU?=
 =?utf-8?B?Q0hyR2RnR2FtSE95a0p3bzlzVTdVQVpqWDlibktCR2R2SWpGRDlBWmc5Ky9j?=
 =?utf-8?B?Q1MrcDVqc01zaDAyYzE4U0ZpTzFOTXhGM2tFa0NlK3JSUGpMWCsxNEh4ZDZq?=
 =?utf-8?B?NVBSZ1hBdGZNUDErVFVTdWYrT3RDUUZoYkNpY1J1M2JTWDVwMzdRZjI2M0Zk?=
 =?utf-8?B?dTU2SzdqLzNOWmFaS2poeUcyUW1jL1grUmpVNmszeDQ5Y1FubTAvd28wSVQ5?=
 =?utf-8?B?MllDT3RNcDNtRmFNZWpCc210Rnh1WlRsWTU4VUc2RFhRbzRieXpsbEd1cld5?=
 =?utf-8?B?S1pyTC9RYmNtM0N5Z20wWHAvbmw2ZzRkdExvRUlpYmdLRUMxOTNxcCswRkRB?=
 =?utf-8?B?WlFJUEYyTE1YdmVMSjVvcWNqSVljT0N1YzZYTzRlMVBJVUt0WmV5eVlPQW5z?=
 =?utf-8?B?Z3YrNVIvOSt0Zk5oUVlFWklpS3lLOTlNNGhXT2NqY3hpeVNGdklKWEJjOGhs?=
 =?utf-8?B?bmRyVkJPY2tTTlZrTStKL1VkZ3dDa1VZbnY5WjVPN0ZvMjZaSWVseS9YM0N1?=
 =?utf-8?B?aVAzLzVvTDRYS1V6clRybkh4WDl5VUtrWE9KOFYrRnZiSE9YdzJrT3VSSU92?=
 =?utf-8?B?cS9kOTdwSlVOWXdObzZvSHVuTktlYWZXWEhrNFFNa0FDLy91UmhSMklUUlJq?=
 =?utf-8?B?WGpkTjJiamRqN1NXNnBCYjFSNmpjS3ZNTTNWN0NxZ2c4cXRGWUVBWDdOTTE4?=
 =?utf-8?B?TXFBaUttK0pzTXpsSnNINXJ1VUlOejZweFZjR1VXVDVYRFRydjFQMVEwczN2?=
 =?utf-8?B?WDlic2FoNFM4WExmdytPT0xTREFkWU5HSUsrN0U5UHhPNFY3dW1aekQ0MlFt?=
 =?utf-8?B?Q3E4WGFzeUFkWnZjQ1lueW1FdFVYcGswV1cyY1Q5MHAxWkZmL2JzL1U1MGNu?=
 =?utf-8?B?cHlFd3JhRWxQWmNDQlIzUkhOaEY3UkRGQzN5SC9uLzVkV2Q4MFgyS2c3NDJi?=
 =?utf-8?B?RlNCZzhRMUxlUmJWcWxNdzRSZUNTc1N5SlB1bnRCQk5hQkNzSUJldWNmZ2NB?=
 =?utf-8?B?TEVkWWt2R3N1WVdrU2RJeE5VYng4TFdTclA0VWNobHRhSGs1UklCdndtL056?=
 =?utf-8?B?Wm05WllzbVpCRVlTRDd2eVVyYkZvdWpxTDlYcXlmRU51Uks1VHNhNjJ1RGFS?=
 =?utf-8?B?cUpLRTEwNktUL08rbHdLalBaZElnWFMwRnU1UU5CUjdQZHhjS2R4RGlWVkRq?=
 =?utf-8?B?TDY0c0hsYjBvUFpXNUNsZlBkL2hFUEp5MVZmTVc5QVhUVXFuNFVYUXh3YlRR?=
 =?utf-8?B?T0VWaDdFUU5UTC9lYnhxZ0FPRVV0c041QzFYN3l0UU1YU05zTC9Oa3lmejBo?=
 =?utf-8?B?aFZNRGdkdEJ0N1BudGtGN2xhTHZSem5KWjdkd1pwNVlLUjEzTVlzamUvTFpo?=
 =?utf-8?B?VURuUGR3NUowSDgyQ21TT2FNNVdaY1dGbVJzQmRuOVcyY2FRQ08vNW50Uldu?=
 =?utf-8?B?cGMyUHpPRTd5WC9DS3FWMDlJREhGMU5GK0hTclVITDVQUWdLWFpDZHVEcHhl?=
 =?utf-8?B?SUVNVGRuRngyM3hIOUduaGVPZlg5cjlaSHRDQ2RiN0plWExvM0tZejB5VGtP?=
 =?utf-8?B?NUhUUlQ5cmFtTnRJcHBmUmxuMyticUNEUFF0WDFPREhxY3ZwUVJ2SHpHQzhY?=
 =?utf-8?B?K2gra0tydmVtWk55UWc5UFQ0MzZvZGtEY3ozc3o0NDNERnlOcVNoWW81VEww?=
 =?utf-8?B?MFVFL3YzOHZ2VEFtNStrMlZneGhhM0FNdUsxVmZYeXRuckV5OXhja3B2MEcw?=
 =?utf-8?B?V3VDRWVNWlhZUEw5a0ZIYVUrTkxsQnlOb0thZzlYYi9mdzRsZG9lQVovZVhJ?=
 =?utf-8?B?NmpERHl1QnZ1OTgrUjZyZitwY3ZSWlVVdXJnMVVGaXo0ak9oMFJWNzNMUWFx?=
 =?utf-8?B?MnFlWVQ0SklJRGJaSE51QWIzbjZYWWp5azRVUG1GVmJJMkN4cStPU0MrZTA2?=
 =?utf-8?B?RTFnbUJKUGRZMHYrVkZIQkJsN1hyRllrMUdFa0s0TFdWZDkyUk5SeFVUTmIx?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f94c6f90-76bd-458e-442b-08dd793ed086
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:21:25.1439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ly9K35ZGL2MnG0WmzbvZGcBfDuaF9RtMuBjkftBQDC1EYaWtuc8jRo0/iHJptWO/rmr9lZZL23kGSnCpHXXOV6ZvQU3MF/iNwrVYLebzriI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> Software can read the assignable counters using the QM_EVTSEL and QM_CTR
> register pair.
> 
> QM_EVTSEL Register definition:
> =======================================================
> Bits	Mnemonic	Description
> =======================================================
> 63:44	--		Reserved
> 43:32   RMID		Resource Monitoring Identifier
> 31	ExtEvtID	Extended Event Identifier
> 30:8	--		Reserved
> 7:0	EvtID		Event Identifier
> =======================================================
> 
> The contents of a specific counter can be read by setting the following
> fields in QM_EVTSEL.ExtendedEvtID = 1, QM_EVTSEL.EvtID = L3CacheABMC (=1)
> and setting [RMID] to the desired counter ID. Reading QM_CTR will then
> return the contents of the specified counter. The E bit will be set if the
> counter configuration was invalid, or if an invalid counter ID was set

Would an invalid counter configuration be possible at this point? I expect
that an invalid counter configuration would not allow the counter to be
configured in the first place.

> in the QM_EVTSEL[RMID] field.
> 
> Link: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/40332.pdf
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v12: New patch to support extended event mode when ABMC is enabled.
> ---
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  4 +-
>  arch/x86/kernel/cpu/resctrl/internal.h    |  7 +++
>  arch/x86/kernel/cpu/resctrl/monitor.c     | 69 ++++++++++++++++-------
>  include/linux/resctrl.h                   |  9 +--
>  4 files changed, 63 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index 2225c40b8888..da78389c6ac7 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -636,6 +636,7 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
>  	rr->r = r;
>  	rr->d = d;
>  	rr->first = first;
> +	rr->cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>  	rr->arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, evtid);
>  	if (IS_ERR(rr->arch_mon_ctx)) {
>  		rr->err = -EINVAL;
> @@ -661,13 +662,14 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
>  int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>  {
>  	struct kernfs_open_file *of = m->private;
> +	enum resctrl_event_id evtid;
>  	struct rdt_domain_hdr *hdr;
>  	struct rmid_read rr = {0};
>  	struct rdt_mon_domain *d;
> -	u32 resid, evtid, domid;
>  	struct rdtgroup *rdtgrp;
>  	struct rdt_resource *r;
>  	union mon_data_bits md;
> +	u32 resid, domid;
>  	int ret = 0;
>  

Why make this change?

>  	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index fbb045aec7e5..b7d1a59f09f8 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -38,6 +38,12 @@
>  /* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
>  #define ABMC_ENABLE_BIT			0
>  
> +/*
> + * ABMC Qos Event Identifiers.
> + */
> +#define ABMC_EXTENDED_EVT_ID		BIT(31)
> +#define ABMC_EVT_ID			1
> +
>  /**
>   * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
>   *			        aren't marked nohz_full
> @@ -156,6 +162,7 @@ struct rmid_read {
>  	struct rdt_mon_domain	*d;
>  	enum resctrl_event_id	evtid;
>  	bool			first;
> +	int			cntr_id;
>  	struct cacheinfo	*ci;
>  	int			err;
>  	u64			val;

This does not look necessary (more below)

> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 5e7970fd0a97..58476c065921 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -269,8 +269,8 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
>  }
>  
>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
> -			     u32 unused, u32 rmid,
> -			     enum resctrl_event_id eventid)
> +			     u32 unused, u32 rmid, enum resctrl_event_id eventid,
> +			     int cntr_id)
>  {
>  	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>  	int cpu = cpumask_any(&d->hdr.cpu_mask);
> @@ -281,7 +281,15 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>  	if (am) {
>  		memset(am, 0, sizeof(*am));
>  
> -		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
> +		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
> +		    resctrl_is_mbm_event(eventid)) {
> +			if (cntr_id < 0)
> +				return;
> +			prmid = cntr_id;
> +			eventid = ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID;

hmmm ... this is not a valid enum resctrl_event_id.

(before venturing into alternatives we need to study Tony's new RMID series
because he made some changes to the enum that may support this work)


> +		} else {
> +			prmid = logical_rmid_to_physical_rmid(cpu, rmid);
> +		}
>  		/* Record any initial, non-zero count value. */
>  		__rmid_read_phys(prmid, eventid, &am->prev_msr);
>  	}
> @@ -313,12 +321,13 @@ static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
>  }
>  
>  int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
> -			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
> -			   u64 *val, void *ignored)
> +			   u32 unused, u32 rmid, int cntr_id,
> +			   enum resctrl_event_id eventid, u64 *val, void *ignored)
>  {
>  	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>  	int cpu = cpumask_any(&d->hdr.cpu_mask);
> +	enum resctrl_event_id peventid;
>  	struct arch_mbm_state *am;
>  	u64 msr_val, chunks;
>  	u32 prmid;
> @@ -326,8 +335,19 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
>  
>  	resctrl_arch_rmid_read_context_check();
>  
> -	prmid = logical_rmid_to_physical_rmid(cpu, rmid);
> -	ret = __rmid_read_phys(prmid, eventid, &msr_val);
> +	if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
> +	    resctrl_is_mbm_event(eventid)) {
> +		if (cntr_id < 0)
> +			return cntr_id;
> +
> +		prmid = cntr_id;
> +		peventid = ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID;

same

> +	} else {
> +		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
> +		peventid = eventid;
> +	}
> +
> +	ret = __rmid_read_phys(prmid, peventid, &msr_val);
>  	if (ret)
>  		return ret;
>  
> @@ -392,7 +412,7 @@ void __check_limbo(struct rdt_mon_domain *d, bool force_free)
>  			break;
>  
>  		entry = __rmid_entry(idx);
> -		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid,
> +		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid, -1,
>  					   QOS_L3_OCCUP_EVENT_ID, &val,
>  					   arch_mon_ctx)) {
>  			rmid_dirty = true;
> @@ -599,7 +619,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>  	u64 tval = 0;
>  
>  	if (rr->first) {
> -		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid);
> +		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid, rr->cntr_id);
>  		m = get_mbm_state(rr->d, closid, rmid, rr->evtid);
>  		if (m)
>  			memset(m, 0, sizeof(struct mbm_state));
> @@ -610,7 +630,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>  		/* Reading a single domain, must be on a CPU in that domain. */
>  		if (!cpumask_test_cpu(cpu, &rr->d->hdr.cpu_mask))
>  			return -EINVAL;
> -		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid,
> +		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid, rr->cntr_id,
>  						 rr->evtid, &tval, rr->arch_mon_ctx);
>  		if (rr->err)
>  			return rr->err;
> @@ -635,7 +655,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>  	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
>  		if (d->ci->id != rr->ci->id)
>  			continue;
> -		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
> +		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid, rr->cntr_id,
>  					     rr->evtid, &tval, rr->arch_mon_ctx);
>  		if (!err) {
>  			rr->val += tval;
> @@ -703,8 +723,8 @@ void mon_event_count(void *info)
>  
>  	if (rdtgrp->type == RDTCTRL_GROUP) {
>  		list_for_each_entry(entry, head, mon.crdtgrp_list) {
> -			if (__mon_event_count(entry->closid, entry->mon.rmid,
> -					      rr) == 0)
> +			rr->cntr_id = mbm_cntr_get(rr->r, rr->d, entry, rr->evtid);
> +			if (__mon_event_count(entry->closid, entry->mon.rmid, rr) == 0)
>  				ret = 0;
>  		}
>  	}
> @@ -835,13 +855,15 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_mon_domain *dom_mbm)
>  }
>  
>  static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> -				 u32 closid, u32 rmid, enum resctrl_event_id evtid)
> +				 u32 closid, u32 rmid, int cntr_id,
> +				 enum resctrl_event_id evtid)

Would it not be simpler to provide resource group as argument (remove closid, rmid, and
cntr_id) and determine cntr_id from known data to provide cntr_id as argument to
__mon_event_count(), removing the need for a new member in struct rmid_read?

>  {
>  	struct rmid_read rr = {0};
>  
>  	rr.r = r;
>  	rr.d = d;
>  	rr.evtid = evtid;
> +	rr.cntr_id = cntr_id;
>  	rr.arch_mon_ctx = resctrl_arch_mon_ctx_alloc(rr.r, rr.evtid);
>  	if (IS_ERR(rr.arch_mon_ctx)) {
>  		pr_warn_ratelimited("Failed to allocate monitor context: %ld",
> @@ -862,17 +884,22 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *
>  }
>  
>  static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain *d,
> -		       u32 closid, u32 rmid)
> +		       struct rdtgroup *rdtgrp, u32 closid, u32 rmid)

This looks redundant to provide both the resource group and two of its members as parameters.
Looks like this can just be resource group and then remove closid and rmid?

>  {
> +	int cntr_id;
>  	/*
>  	 * This is protected from concurrent reads from user as both
>  	 * the user and overflow handler hold the global mutex.
>  	 */
> -	if (resctrl_arch_is_mbm_total_enabled())
> -		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_TOTAL_EVENT_ID);
> +	if (resctrl_arch_is_mbm_total_enabled()) {
> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
> +		mbm_update_one_event(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);

With similar change to mbm_update_one_event() where it takes resource group as parameter
it is not needed to compute counter ID here.

This patch could be split. One patch can replace the closid/rmid in mbm_update()
and mbm_update_one_event() with the resource group. Following patches can build on that.

> +	}
>  
> -	if (resctrl_arch_is_mbm_local_enabled())
> -		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_LOCAL_EVENT_ID);
> +	if (resctrl_arch_is_mbm_local_enabled()) {
> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
> +		mbm_update_one_event(r, d, closid, rmid, cntr_id, QOS_L3_MBM_LOCAL_EVENT_ID);
> +	}
>  }
>  
>  /*
> @@ -945,11 +972,11 @@ void mbm_handle_overflow(struct work_struct *work)
>  	d = container_of(work, struct rdt_mon_domain, mbm_over.work);
>  
>  	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
> -		mbm_update(r, d, prgrp->closid, prgrp->mon.rmid);
> +		mbm_update(r, d, prgrp, prgrp->closid, prgrp->mon.rmid);

providing both the resource group and two of its members really looks
redundant.

>  
>  		head = &prgrp->mon.crdtgrp_list;
>  		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
> -			mbm_update(r, d, crgrp->closid, crgrp->mon.rmid);
> +			mbm_update(r, d, crgrp, crgrp->closid, crgrp->mon.rmid);

same

>  
>  		if (is_mba_sc(NULL))
>  			update_mba_bw(prgrp, d);
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 60270606f1b8..107cb14a0db2 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -466,8 +466,9 @@ void resctrl_offline_cpu(unsigned int cpu);
>   * 0 on success, or -EIO, -EINVAL etc on error.
>   */
>  int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
> -			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
> -			   u64 *val, void *arch_mon_ctx);
> +			   u32 closid, u32 rmid, int cntr_id,
> +			   enum resctrl_event_id eventid, u64 *val,
> +			   void *arch_mon_ctx);
>  
>  /**
>   * resctrl_arch_rmid_read_context_check()  - warn about invalid contexts
> @@ -513,8 +514,8 @@ struct rdt_domain_hdr *resctrl_find_domain(struct list_head *h, int id,
>   * This can be called from any CPU.
>   */
>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
> -			     u32 closid, u32 rmid,
> -			     enum resctrl_event_id eventid);
> +			     u32 closid, u32 rmid, enum resctrl_event_id eventid,
> +			     int cntr_id);
>  
>  /**
>   * resctrl_arch_reset_rmid_all() - Reset all private state associated with

When changing the interface the associated kernel doc should also be updated.

Reinette


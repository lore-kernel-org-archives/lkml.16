Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801025179A;
	Thu, 22 May 2025 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931622; cv=fail; b=UmcSHoMuZ+WgP9UD8EgGovx9zuPEHiwJtr5s27VYR8rJGGX1aaQ4rnoSIUwNKg29w4P4I/sgb2bb3tZvcQcFbxJ58RzZ35wTMU6tbr1tpEJgoDf0UviIRLMtH8lGJhwDT79H4aRJJ2R3S5QZH1+c4nt68I94z4102pkCk7rmQsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931622; c=relaxed/simple;
	bh=cOvCTCwE0kMZlOukf8hgVeC26iI/b+JJPppXIHDk/yc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g62dAjjoBhLXMcUuaqQuHPdpk4N1FU7QLluQu7zswnvfr5NRUPTizDs6rC9w7Rahsn0nUcuFqFNcOxtXXtyQMLQQioigoCVKQjuN6yzDzZZendWxwl5+1cwuPTYZVWkGvrNLYORnNhZxz0TOsjA3Z1H8BO9rxZf20LLkufxPoEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ7H1rlf; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ7H1rlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747931621; x=1779467621;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cOvCTCwE0kMZlOukf8hgVeC26iI/b+JJPppXIHDk/yc=;
  b=cZ7H1rlfcS63sPaCu/GLGJqcoyqLVTmLqRnoEEewqkMEl0fx6U3+w3nM
   HJFuH2a7Wh4SIfR3lnQb8evzcxXAWEWSCViBod8pmd7Uekkm3npVCSDTR
   5voPFqDB3m3Dys8eYDVvrMkPLnh/o0gt7ZHAsR+jgZZpHiF7pb1NmHkVS
   YbOd7MoAfxOHU/NVVK8S4lnayP9kPJrMy2g/7DIfx0w43qyEVXxsKd76a
   cKsccz5DdTpnb92UpP4HxbEwYXyWs1WOgkhBOo9++jH8QKuyNhMO/HQo2
   fNRA6DTFc4N19FZWeo8+nZBFPnAA1lUv7Vg0NvXjgVy8QblYkBYTO16d0
   g==;
X-CSE-ConnectionGUID: Z2r9PJU4QWa0a02trqgTLg==
X-CSE-MsgGUID: mbEdKfdeQkGRRHfEKsI5Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49220955"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49220955"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 09:33:39 -0700
X-CSE-ConnectionGUID: bGkmN2FASVuwv720mksDSA==
X-CSE-MsgGUID: L6ATTiH4Siup0iQVIEL45A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="141612024"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 09:33:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 09:33:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 09:33:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.80)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 09:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9ccSoz8J/k7Y02DKkdnIxxkVd9xvkavnZ3rWjtHjP2I7qsoJIvtgKlfHImLfYFUD0lUP6HoT2piXHuUHX1dpi8//YQnBEhDI0HOz+w8O/P8oRsrnFspwTUIpDb/Il3SHgaK30c2WPX2lpgSzZH88bNgDurzJjSjF2PpiABpdm2j10NbjYoivsFifsupF9somTeFY19rnzCQL2U3OMur5uLiPzspxHhSOAxhqDiPAyI0yqOho1kyD7oluSPgkohy5s+yMuunVv6CbfulCEDJ/WslG/2nH1sRswhVEOoF2NPE2xvGyzAy8rSN3ERzujSc3d3iKZG6YEkgAHyuizIpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tswdIRKv4Wd7DOtF3CnSz1K4K41oQbaoAjlWFZtRhPQ=;
 b=ETeObhpAS8INuYw2j1ZQy+ng7NqP9Xte5gL/QYoDuE0KzWYmMlCiSBICjiiOfUQjOCI4InpJpE3RH1GI7pdg0ouZ2NsoAfelWpDC5jFMEGqtBhYrpwhXSCpA/iU52OrGJxMW932yZ32ir44KOJ+M7NNM5fnR9ahkTAjt9pgXyCYs2oaf3UDCuetR+jyEx1ladN4v0B75inCQr8HeexTPiuE8E3Kk4Gwln+tHf6vbfkERTV5Fza7BvMXgcK6Dv8sWjJ7nhCnLQegxdxQhXgXoJaBXOew7suowhQ5wK01HfERpe9+OFDYLQSYluIhEFW3tRqrcbo9jAGVpmkeIByYDFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.33; Thu, 22 May
 2025 16:33:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 16:33:35 +0000
Message-ID: <877642a9-cef0-4b80-9053-3ecace9326ed@intel.com>
Date: Thu, 22 May 2025 09:33:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: <babu.moger@amd.com>, Peter Newman <peternewman@google.com>
CC: "Moger, Babu" <bmoger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <james.morse@arm.com>, <dave.martin@arm.com>,
	<fenghuay@nvidia.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
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
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
 <7628cec8-5914-4895-8289-027e7821777e@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <7628cec8-5914-4895-8289-027e7821777e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e674b2a-20fe-4adb-4441-08dd994e6606
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUF0WkJsVWNMU3lrUXJtUEN4LzRVemxETURQZlpZNjlEUDRnKzk4U09pSWpO?=
 =?utf-8?B?WkR0WUJ0NHBmVDJhbEpsc0R4Z24wdXFBazNSRnlVYTdFOEpzNkxiNnM3Yi9W?=
 =?utf-8?B?Z2pJV1pOWmVKWng4Q3p3aGM4WlZCVWk0V1JscXZZRC9MMk9DclEwTUtNTktB?=
 =?utf-8?B?NmNxeWQ3Rm5nZUgrNWl1WnA0aFl3akpJN3dJT2VJa3RYc2ZhTzFOOVpuUStP?=
 =?utf-8?B?VUxITTh6SXhKUkJ6aXVEYmh6cWJWMkRXVFovYTM5MzkyZ090U1ZTWGNxZVoy?=
 =?utf-8?B?MjdYZU1CL0Nsa0RId2VSbXpMQjJ4RHZIZURTS1gxb3hZMXhaN2twZVloUU9F?=
 =?utf-8?B?cTh1cCtPQVBjVTc4RlVHcktvclFoOGVvZ0g4dXRGSWhtVHlUcGV6cEVFb0RL?=
 =?utf-8?B?OWNBQ2JLZEVOU2VXKzJyb0lPVzBEdjdScUxJTW5ydS93R0ErQkYzYTJFU25D?=
 =?utf-8?B?dGRYUnRxSjM2NnRMaDRTSnFCZW1tSlh5L1FZYmhkc1dBSC9uSjBPSVdRbkpN?=
 =?utf-8?B?OGRBcEsyOUZZcDFoQmpaYWVkWldrQmo4THFFcEVIVzB3SnB0TnFObGx2TG1m?=
 =?utf-8?B?RjNGZXYvdnpSTUMvK2N5cUJiT1pxWlp1Qzl2K3EwTXpYOUFPZUdlc2lqMGlp?=
 =?utf-8?B?ZWx6S0swY1R2emZmMHRld1pReUoyakwzVkNNb2dSZDQ5ZzJvRHo3dy90UHBF?=
 =?utf-8?B?VTJNMUZxdjZBTDVqSUpOTWhMQ2tOK3MwcmUvS2JXZEZCRHA4NnM1UytwekJ0?=
 =?utf-8?B?MkxnRGh2WXpocFl6bjBkU3VyUUFmZU14U1ZUMEVRMUkwK1BtcGttdWwrclIw?=
 =?utf-8?B?RVBnYXBmc0JpZTExOFU4T1Y5b0ptM29CUkdGSWFFc0VRQW5mWHhTTHpIeTM0?=
 =?utf-8?B?bityNXlSSE92SjdBVWNaZE1HZWVGSnUwQjVXTkN0NVBVUllpZmpUN3hqZ1RW?=
 =?utf-8?B?cHY3OHFERExoR2pwQXlYUmRBZHRWR3VuWUNRRTl5N0xYY21TWXdYM3lOZTR1?=
 =?utf-8?B?eXpRMVFNVHE5b0lMclRPYzEwNWZ0YVB4Ny9COXFGVUVnTTQ3QVlySEl0Rllt?=
 =?utf-8?B?VmdsUmJoMVlueXpmMHlPWFB4Znpzd0M3em5XUDg4UmEyUVVQeFNxTkNPeHA5?=
 =?utf-8?B?a2tRby9Gc21hbmRUWjl0cUZ4R0hKZXVkWVowNFIvZ1hrTlBrdmY3ODhkZk5F?=
 =?utf-8?B?dHpUTnJ2VGhpUE0yT0lDS000WU1LdHUrOW5TcHNRbUU1WDB4ak14WU5qTC9Y?=
 =?utf-8?B?YW1lWlgvRGtXYWd1c3VWaGl2aHB3WjVrMVpmdzF1K2wxNG1WTWdkek14SXRo?=
 =?utf-8?B?U295emdvMFpmaDJSRGVPN0svYjFneFdFRzJtKzJoM1NFaStxR21zdlpLeEdQ?=
 =?utf-8?B?UkFaa3UvMkxhMzlyb3pqaDN1a1lTZ1p6MXpZT0grTmpBSXN4VmllZ2hyQTVj?=
 =?utf-8?B?OXJkWW5QRnBRTEpqQVh0QmVJWC9IVXRzdWNiZTQzblRsdkhsT01MaHQyVjF1?=
 =?utf-8?B?dFluUXU3N0h4NTl6UkxHcWpubVJyWDRhZHZ3Uy8rdCtzY1lJaUNmQUJJZXRq?=
 =?utf-8?B?cldtQkZMNEllWE1mM2xWd3NOTDlNMVN0M3VRY1RycjFpWVBxbExsaGdmN0pX?=
 =?utf-8?B?UVpyaHZxbzJyQ1lGdDUvOTIyM2s0dDdTV1ZTajBsczVwRmdEODZYSnVsZTFC?=
 =?utf-8?B?SkhNUkVuZ3ZHL2lyVGtkN09KSVdQeU9pbkRSQnNTb28wZFIwN2NIRDNicyti?=
 =?utf-8?B?UXE1UFYybWh2R1R2UnFJQXFOYjVTcnl5c3JvMDFvLzc5Y3NxajBETGR2Rkc3?=
 =?utf-8?B?VE9YbDJPeWpwWXJpT0JCS0FJVnBQNFBDTGt2Uy85ZGxGZGpIdkxRbWNXRWdO?=
 =?utf-8?Q?MJ6WCb8x0yHoS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEZJSUdtUmFvWTQxZk9pdHAvMHQ5SDlFTXRST1owdzZJSVpldG40SXM5eFAz?=
 =?utf-8?B?N1htek9seWMvYUtUblF3ZmJONC9HNGZxWjJWbGJ4bWV0RDJhQW9uaTh0M0Jh?=
 =?utf-8?B?MTlSQ3V2bDJNR2pQTkdEMWprSTRFaHkzVTl4UHBOb1lNUm9kdTFtMlJPckhx?=
 =?utf-8?B?SXdwUlgwUDR4T2M4VlhBcXZFYW1RSnFWQklKdmNiVFc0eU12ek1vSTNwMlBG?=
 =?utf-8?B?T1F6eDZlRXh1Tk9FSTBnUFU5TnU4U1RDa1FoRnZTTmgxL2lFczMzQ2paL05T?=
 =?utf-8?B?RGEvdW9LTmNGeHIxR2ZNbk93UHdXUkdaMVRqcllkc1NNRDlJSXNJajRuMDR6?=
 =?utf-8?B?QktvS3dKNkM4bVZYWGQ4OWppdCt4QWlrdWxJR08xZk5nU1hwbkplelR0NGpM?=
 =?utf-8?B?UE5XS1MrdkNvQ3E4QTV0UFJZb3g3bmhUSmczQVhoRUFwaEZYeHcvenZ5Z1Vj?=
 =?utf-8?B?alkySmpRb29nRS9NNEZja3JzQmg5bElrUlJxQkNuay9Ed1ZxR05NM2oyVkZD?=
 =?utf-8?B?bVA1S1oxcTh5UStZVnpOQzM2L1dEL1ZXeVU2eEtqRGZZWjhBUkZIaUFLdUsz?=
 =?utf-8?B?ZmQ2dm5GV1lNNUVISEhTRC9UVkY3dlg3THdFejgvNXd1d2hnZWRkOFJDdEdr?=
 =?utf-8?B?ckl1U1Q4bGlpZmhoRUhPSDNoRUFFM2l0anRVMzRmSysreFdRbDhNUUxBNEM4?=
 =?utf-8?B?WitBTmovdzEyaVZiWEEwZjF5NThUTkV0Uy8yMkVPSHFSSXBNTEtXYjF5U25r?=
 =?utf-8?B?bzdSOGJvV25PUnB6OWd5UmdrZlhOeVlTR0tLSTR6T3NtQi9zV0VnYm9xUVdH?=
 =?utf-8?B?Vk13RUFRZ1dxV2MvM1F0OFZOelBNcUxQWGxPd2piZ0pKSFEwTWk0WEhtZXBJ?=
 =?utf-8?B?UElZRWZZMUF2MXpuTTlCMExTM3VIUTYwN0VqdVU3c0dhaUx6eDhYN0RZU3Mv?=
 =?utf-8?B?c3V6Y2tJUVFrcFBia0V1am91Mmc2UTVhMlpZNGtzVi9rdkhQVWkxWmxrV2NY?=
 =?utf-8?B?WXJZek40YW1TQmtMc0R0TmNDMC9nY1FwVkJXeVJuaW5ISDJOTGp4VkJmU09w?=
 =?utf-8?B?UHlhOG5mTFRCTi9OMC9SVXB3YW5kbStuUjBEUzBFYU5HYXRhRkY3dXN6OGsr?=
 =?utf-8?B?TjZiZXR6Q2NSS1BQVmdSU1QvUVAreVV4VStoQmVBc1JSTzMybFpNWVlGbkxC?=
 =?utf-8?B?OHorWWhxT3BpbzVreHBPWmpYMjFlWUZyUmN5Ym5QVS9hTDRReU5tR0V0dmUz?=
 =?utf-8?B?QmlHNm9DRlBseUYyUDl1ajQxelRTSDRRTXQ0Nm5CWWlXYWpDU0dEb0NldnQv?=
 =?utf-8?B?QU1vSm12cTJJMHZFaU0wWGg4SVhXZWxweGxmaStpNnFRaFRZZlN2MGxmb2J4?=
 =?utf-8?B?Vm9nV2t4alpkcFJkMDZ2cXI1aXJPVnBFL1VQeTZSbEp0cEcrNTdVQ2RYOGxa?=
 =?utf-8?B?U0tvR1VyV29KVFIrMVpQWjMwYVBEb3pYYWl0UDdEZCs3WHFxK2NVUUtDTHla?=
 =?utf-8?B?WW0vQW52SEZpUklhRFE4RTZ5bzR4TExmQkhqZldMNldJeHZIWDVyWXB6THFn?=
 =?utf-8?B?SFRrZjh4TUNNUmZQVFNrWGR6MUhRSHA4U2dKVXFCRHRRQXd1M1RLNjZrY1pI?=
 =?utf-8?B?dmM1Q0VYaE15akY2ak4zc2RPVFlXanBOa0xhVEo2clFhcnMzcmhMdlhrNitX?=
 =?utf-8?B?QWZWSXMrVFNxZWxEWWV0amNXYkVpUHBLVys3SHNjTDl1ZFJtSUVKVCtUcWl3?=
 =?utf-8?B?aXI2N3l1eUtlNjhwblhqRmZGSGdEcGpuOWxxR2tUZjZPYkxZYUdCRHhqV0V1?=
 =?utf-8?B?TVNMTHJUSlhyRmRHT25rWmE4ZG1lUGNTb3NqYUJXWmlyWVI2OVQ0MFZhMTEz?=
 =?utf-8?B?RE9qdmk0M0NmTTZQUlZPY0E4MmJ0MmhtMkdGQVlKOCtQS0k5TkZjWEZHUlE1?=
 =?utf-8?B?RVRwS1o5QWswSmZlbXNuL21IRDh0M2ZYRDVmOG01VGxvODhyY05QdDh4ZHVl?=
 =?utf-8?B?QzZ1SHJ0YWtIT01XWVVXRlFkQVZzY2xMdVc0OC80ajNnVmFxVktXdUNGQWRZ?=
 =?utf-8?B?bDEwVkRZVlhxTllNU29TcDNPaVhDNWJpbjVTenBQMm1oeVgzeVkwV1FWZW9s?=
 =?utf-8?B?RXV3TEV5TFFVSVJuU0VVbVpMQXJtVXFCNWlOYXZ0WERSZ2k5UnRZRENXc3Fm?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e674b2a-20fe-4adb-4441-08dd994e6606
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 16:33:35.6042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxiwsoNPFahZ2TkRCZC8zHz0+HLg6mMrg7KiKv+w+xLdzWCcTWVqL+G81OcwFlU3pAlcrRis8FILnUUe9CT93hNMWUiDcFiYF67yRJr7wkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
X-OriginatorOrg: intel.com

Hi Babu,

On 5/22/25 8:44 AM, Moger, Babu wrote:
> On 5/21/25 18:03, Reinette Chatre wrote:

...

>> This is why I proposed in [3] that the name of the mode reflects how user can interact
>> with the system. Instead of one "mbm_cntr_assign" mode there can be "mbm_cntr_event_assign"
>> that is used for ABMC and "mbm_cntr_group_assign" that is used for soft-ABMC. The mode should
>> make it clear what the system is capable of wrt counter assignments.
> 
> Yes, that makes sense. Perhaps we can also simplify it further:
> 
> # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode:
> [mbm_cntr_evt_assign] <- for ABMC
>  mbm_cntr_grp_assign  <- for soft-ABMC

Looks good to me. Thank you.

>> Considering this the interface should be clear:
>> num_mbm_cntrs: reflects the number of counters in each domain that can be assigned. In
>> "mbm_cntr_event_assign" this will be the number of counters that can be assigned to 
>> each event within a monitoring group, in "mbm_cntr_group_assign" this will be the number
>> of counters that can be assigned to entire monitoring groups impacting all MBM events.
>>
>> mbm_L3_assignments: manages the counter assignment in each group. When user knows the mode
>> is "mbm_cntr_event_assign"/"mbm_cntr_group_assign" then it should be clear to user space how the
>> interface behaves wrt assignment, no surprises of multiple events impacted when
>> assigning/unassigning single event.
>>
>> For soft-ABMC I thus find it most intuitive for num_mbm_cntrs to be the exact number
>> of "active" RMIDs that the system can support *and* changing the name of the modes
>> to help user interpret num_mbm_cntrs.
> 
> Sure. The option A: fits well here then.
> 
>  Option A (counters are RMIDs):
>  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>  0=31;1=31

Thank you for considering.

Please add the requirements from this discussion to your running list. Also please keep in mind
how soft-ABMC intends to use the interfaces created by this work so that the documentation that
accompanies the ABMC support in this series leaves enough "wiggle room" for soft-ABMC to be built on top.

>>> [1] https://lore.kernel.org/lkml/CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com/
>>
>> Reinette
>>
>> [2] https://lore.kernel.org/lkml/b9e48e8f-3035-4a7e-a983-ce829bd9215a@intel.com/
>> [3] https://lore.kernel.org/lkml/b3babdac-da08-4dfd-9544-47db31d574f5@intel.com/
>>
> 

Reinette

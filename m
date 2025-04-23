Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AB224466A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443798; cv=fail; b=EYq87GYlc+s+Cci61/z8mhXpcXzs6kPToLNoUuhs+0khdQkTLYZkSmZYZGoFqVumsw5PzkPrlwpk1hVJcCB8MSRkQOzWEC1b/1lLZIhO2Ol5y09MByIVvkUdZt0ld2D+hLMCyU0DUbGik1cccaSVZF4hAi/rlGyqfgJ2D1y5cFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443798; c=relaxed/simple;
	bh=U3vb6+Mp7aEVW8viEMRnQDNg7mdy6AE8gJnoveJenv8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hdEzNNGaKBHElEb49DJl1PDhASTf6zjziFkSeEAt7V6OlkfqXGrQv4FVC+etE5Dq6cw6zJh4Dv1kKHY6Kpjt2ujjpbSy5q6hGX97eJSKlXEpqXpOTs+qbpGLDwdC04pOlENcw2IiTKdbkstFAAqk67as8ThmEUNrQs+0fbh+OXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rh0f/W1i; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rh0f/W1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745443796; x=1776979796;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=U3vb6+Mp7aEVW8viEMRnQDNg7mdy6AE8gJnoveJenv8=;
  b=Rh0f/W1iPGBwxwWSEmPSqb8EraScNQ1jdIKCUKYtVAGjguSO4Lu/VveG
   TeXoM4CW9a6ASv5HNfje9Sei+af/llh2L5P4pMlsDVOXAbqG59uVSoP9f
   CDdkSDPZgcCcOJIobdMuz1aZtwwK14m9gPeRJEcLV86ZeH5PCbFN7lrie
   zfG3yAhvGMvaw6LlTlZmkr67cdncIF0zd4PihxqMjKTD8mqtZJumxezhA
   6Tir/on1R4s9S9u7Pq7dxGQvybc9Oa0n1v3p0p4CdEkIs0/srGtpYkO1v
   99YIp6xBE11ckO5Ms9lWYaquQzCthnMVyq6yfB8Vev+rNlrEiKDVmnwF6
   Q==;
X-CSE-ConnectionGUID: XtbR/msaRnuzF5LfeXhKBQ==
X-CSE-MsgGUID: KWWfC6H8Th2hwM3nNxQ/5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58416843"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="58416843"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:29:56 -0700
X-CSE-ConnectionGUID: WXoDf6NISS6aELQdzGeXog==
X-CSE-MsgGUID: BZhiqxoQQ12q2/V/QrxXHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="155650868"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:29:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 14:29:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 14:29:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 14:29:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfalZhOO68C3ec8T8sZrnIG1ZKforEyjz3P9UXWK7imaTNcfVmfJf4TlhseV11JNng2raK17xdCj79Y1Ge1aP4iEO7BWpgHhlgvimiFce293SHVLV1erFCzHVKbxw4IywSBEoOXSclY7Dnipp3fnwxN7zSDCe7JtPSosd0r+Oj7XSovY6PrW7iIy73t+zVbVsADRMLjQU8tNOB+p1Gy//X8lawc8IaCbbNCtO02rYIG1k8cuXuf9cOS6nsVpiewHPNTlxU+2gxNwCoHWurdFZI8yhuKP1vNO/07LnJW72wLhw5LygKGC3uoE6euo4hnvsBGokCBbRmp6OVd2NgUyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pR/tNo0uBTtPCXF/yVf9wqCS1yrZ/YpB7hCzxxXS0N0=;
 b=G9pdont3G9T+FLjpZq760hN1qzRgNMOdfTNbXWnoEEiPNP2HS6FHWdCPla8UkIwpoixvgLhdd6Jm4CVLb7YmtDKLSK0szPqSjqgxoDrxkxvzbLWhClW2Q1Aj18dfv2pWhJ10vVzpGoqvYjTg5AZwrpXbCj/PVR3pQOvr34qcgKvww/QHJrmuneXliUF7uY5tmlhS1ts7n2ias1Aj4xTlHCpqRGwrraXlIEjmnK07zjnbzBfivHAs6OdsEh+4JSrrqw+XFLd76qOMSb7IiEI1OyowhIoeHZG9/PSmaRLhHwqmJZDPvd7UIUM2Zz+iMu+yGEw5zrwoGDv6JzoodTuJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 21:29:50 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8655.024; Wed, 23 Apr 2025
 21:29:50 +0000
Message-ID: <de0758c8-76d5-4ead-84f2-40db45ff4ed8@intel.com>
Date: Wed, 23 Apr 2025 14:29:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/resctrl: optimize cpumask_any_housekeeping()
To: Yury Norov <yury.norov@gmail.com>, Tony Luck <tony.luck@intel.com>,
	"Thomas Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <20250407153856.133093-5-yury.norov@gmail.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250407153856.133093-5-yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0364.namprd04.prod.outlook.com
 (2603:10b6:303:81::9) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f64b6f-adfe-4362-8f32-08dd82adfab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlIwUWNwMmtucncxZlBJZ2ZITEFPd1Z0VWtBWU5Pd0MwMTFyMElIZlJoY2lZ?=
 =?utf-8?B?WlRHYmVzbE1qY2Z1WWNBYk9Rc0p4K2lMUXhaYW55eUpEcVU5RU1aUmZHc2tK?=
 =?utf-8?B?VGo2TFEzOGFxL1UzenBKWlFaVHIxRXdFY2Z5VTNmV1VYL1JQUEk5bGU4OStu?=
 =?utf-8?B?aUM3KzN0K0syTlI1UEo1TzB6N0dQQzNNc2Z0TmNZMW10d2ZPWXk0TjUwaDFW?=
 =?utf-8?B?M0NrQlRmeURWb0FReUd1Y1pOcGN2UFFYWGxFNG5xQjJRQ2U1UlltMjhWQ2Zq?=
 =?utf-8?B?MVNRNjFwdzlqd0xRYUZBUGFrS1ZuWlBUeWYyMjJFdCsreWNxc2QrMEFUd1Nx?=
 =?utf-8?B?NzBISS8rK2RpdTQ0NWQrT3ZLdlVhKytQcnllTEdDWCswSzZXTHRPM2h3dUV6?=
 =?utf-8?B?QWU5MVNKc1VueVVFLzJsdExHNDBISjJ0N2J6K2J6TmtHM3FVUXpkKzlBb3RD?=
 =?utf-8?B?TUx1K2xLYldVZTRTMU5MRTRDbDVodWQyZUpGWnIwZW01d2V0YkEvaDYxOCt3?=
 =?utf-8?B?UURkRFZZejdNZ3lsbFYrZE5RaVJmM2tUQk8xSkkyaTBGTDVmZ090T3N5Z1hn?=
 =?utf-8?B?UGZweWJtOGdSWEpmQk9ORE5pbkFVWjZFcFRuU2tZMmxDZ0JaUW9sajltd04z?=
 =?utf-8?B?UXlWN3VXSVZvai8xMHJWWU1SMnptb2VFdFZ6TmxDYlBkaStvNXdjelV4Vnpw?=
 =?utf-8?B?OEhleXA2VFFoOTJVMUlXUEdtRjB5L3JCdFZPMEw2N01Tcm4wbFN2VkhYdkVY?=
 =?utf-8?B?M1BMWDB0RVhLMUN2bzNCZVI1dUdUWXBMZ3pITnRsOUZmT2hpNlhFdVJ5eU5w?=
 =?utf-8?B?V3ZhRW1hRkp6RlVIby9aNkVKMTAwVTkwM1dKcGdDc0lLU0tDK3FqaDJKTzho?=
 =?utf-8?B?d0dwMHZDdkYwMHEvYUl0aDNWc3A2Zk9oMFB2eVNibUNHS1IyeGdlU0FmUXZN?=
 =?utf-8?B?eEZNOGoxb3BLTkJUNjRvYlRIb3MwRGNrbVVxTDEzRnorSy9nSzhZM0Y1NkxU?=
 =?utf-8?B?SUhSR3o1eVplV0liWWxjblJmbi8rNDB1S2YzYzRhMFh1OW5TNWQrV05IWTZ6?=
 =?utf-8?B?NlJOdFBFZ1RVdnhpbFgxVGxCdTdNK28wMm1EVUgrZ0FHRXZ0Zm1XVUZQSXdu?=
 =?utf-8?B?aHJ5Wk8ybmpEREhQdjlLK0I0WExkL0xONW9zSWxPbWsvdkxnSWFOWkN6Y2Fm?=
 =?utf-8?B?SjdYREVRM0lHZDMzWWFPV21YSjhsZTBZalNSYlJ2V1ptQ2pJYjlCcnFHaGVN?=
 =?utf-8?B?dTNWTlVTMmlGeU8zVk1EdGltc1JqS0krNDZiNVZwUjJHeVdJL3RBcXhCbEE0?=
 =?utf-8?B?dURzaElzNnErc0oyempPaEZUTGJYSjVNektOL05LZ1lYR0NHbEVmZ0VLclFE?=
 =?utf-8?B?cTBRTGxncVY3SmEwVy8waHA0WHRVM1A5SXBzemdGbGZHMG9qWTdibUUxY3JI?=
 =?utf-8?B?Szl1RHpVM2p5Y2Q1eWlSOUwxY1FmNWFHUzRDYlllM3VGYTRZWWNTM0xjSEE1?=
 =?utf-8?B?WEdoUGx2eXRWWkpnemZ5dGhZWlhvME1pRm9GRHB6SUxwY0JjTG1ZSlhYejZq?=
 =?utf-8?B?am5DSGt3aU41RDRHVFV3MllVWFEwZFNGY0hCWHR4UDNLWWpqVGhiVUdzTkRW?=
 =?utf-8?B?a2xpU2RsZm1oTDNxWmN3MWd1RE1tc2tsMzd2VzNQVCtlaG9hVkswMjFYN3Zj?=
 =?utf-8?B?c09VQU1WMmRETWl4dER6YzRFR2JkOFJoV3lkSTBac2syY1dDU2Z4bXlSZElW?=
 =?utf-8?B?UTJKQ25PY2hJcUZaWW11TmFoNG8vc04zTXpobCtubVB6UVBIQ003SnBrSmRK?=
 =?utf-8?B?K0VnMEthN1UrcThzQ3UzSHZreFdpeDI4eUFCUHU0RUxDNERrWjdPTEQzNG0z?=
 =?utf-8?B?ZUJtTGxOUXdneXliejBRd3J1azV2SmFocnNQKzRsZTY4Vm1xU0NJcUdyYjFV?=
 =?utf-8?B?SklTUnRHVG05ZWtkYW1MOXVWeVpMekozMkRoVTROVDlqTTNVb3Y0RUNoUzd3?=
 =?utf-8?B?RVpJMk9wenBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEw3OXZkOEhST3c4U2J4RTRCeE95dVlVQjNOTVB0YXRuN2w0alMvTzhEMXRr?=
 =?utf-8?B?N2RpNW41UGxldlNLbnBlMURoL1VmYW5EUUswVEY2OVlMYXZrOFhSVEg3MzYx?=
 =?utf-8?B?Y0ZzeVZsWWh5SVRBUW5VK2FIOGZ4ZFh4blJOdzFPR1hpNlFSYWR6M2pvanZ0?=
 =?utf-8?B?ZUhTSmZLZDNYdnlhMWt1TnNhenJLVnExdUFLeHVqalNXeS82cjJBZGRiUkkz?=
 =?utf-8?B?NTQ3bGtYdGsyRkhpYUJMdGN0Njd3STNXaFM1ZEtzWXBTa1ZKYzZiUlBsUDhD?=
 =?utf-8?B?M3JFSXVYVjNKWnNPM3d4eDJXVzRkQmRIZUc5VmdXaFdSdHhrZnQvS0tEZmR1?=
 =?utf-8?B?YlArMXFTL0pSZkFzZlI4RVpTZWhWRFVWUmVldDlBZkxDbXdDdFhvVXRseFdN?=
 =?utf-8?B?S0lJTjRnalFsK1JWMjVoNi8veGxkVmZFeWk2VVg3SFdjbyt6Lys3eFpSSElz?=
 =?utf-8?B?V3kzYXc3Q2I5NXdaQjFhRU84NmY0NWtHSG5pYmFYWWFjSDBrWUNsdnRNYjVa?=
 =?utf-8?B?TFVobFp6UmNMQkRyVXZnUUl0dVdneEF3TXhEdE5LMlFtdUhoTHhyQkxnSVRz?=
 =?utf-8?B?R0xIVjBpalYvWVRrQVJQVk94ZkpkdjBsRDczbGgyMUR5YWZ4V1JydVdOZzRK?=
 =?utf-8?B?RnQ0OXZFQVpzby9abmltaVZvZWtUcmpLNm81VXN5cm5tUXpRT2xnZHZRVUFV?=
 =?utf-8?B?WlkrakhZVE04QmFhRE5qRjNnaWo2REVGVUppeS81YWlYS0pGdHF5Yk1CcUgx?=
 =?utf-8?B?aFpZZ2FFL2RiOGFwd0RWVG40WC9Cc3crUjBDWmNLRHFzd2JHNHdtOXZYM0VW?=
 =?utf-8?B?R1AzOXNzOWdweUVoZ0tHWXpuWjBqbnlYVStENlJCaXVQQXAwK2huM2NjMnJh?=
 =?utf-8?B?eFZoVWplak81YjFnWG9Fbm56S0NQdDZBaEpGNmhNOWdtUUZza1hSdzhWL0JT?=
 =?utf-8?B?YXo5UG85bktFYUlxb2hQRmpmdExQSlN6bXlFQi9SM1gwdkJQTXhRTEhLYy9C?=
 =?utf-8?B?UnoxVVhmb2laM2hMOTlHSDk2dWg4VUMxZmU0NzN0VlB1bXdqd1k2ZTY3VUVG?=
 =?utf-8?B?M3AvdFRhN0Y3S3paYmhCOU5sZHhOWUR0emhwckVaWVBSQmRzMWk1NXc0dTIr?=
 =?utf-8?B?RVJLdnFJK25PTTBPNGx0ZmR2RlVadStPWUkvVXFYMTNyUnJVNDhIUDFvak5q?=
 =?utf-8?B?WW5Cc0JtQkVHM1FiUU1aR1BqdExwNjlXMlBlbGYrMlNPNEtMSWdld09hZTcy?=
 =?utf-8?B?ZkxUTnpMWFRUQ3I1R1NFYThSU0tQbGo0SENlQnQ0RkR5bEhvQ2JZa0VYUkwz?=
 =?utf-8?B?MkgycnYvcWcwdDVEeXpVckNRV3FxeWtFbm1ubStBcHhobEpINmp0MjJ1MGx2?=
 =?utf-8?B?UHZiK0NuUlRqeTNjYkRvVncwb0pPS0l5S0NQVkpNWmhxRFZwRmtpWGVpOEk2?=
 =?utf-8?B?YlN4TjM2eEMxdXN4NkxQOVVkR2QwaHE3L21nZWxpZXZZR3VFbzJLSUt2bEdO?=
 =?utf-8?B?blRGZ0NrS2U2Y2JvMUNZZDhxMkovNVdhNE14cUNVcENHY1EyUE5UVmFmNEQr?=
 =?utf-8?B?Uk55OGExSzRPZjBVd1BGVlNxL3dxTEF5bW12Y29QcjdzeWkvTGZITTBCblhW?=
 =?utf-8?B?SUhzZ2FXTUFEUHQ1MzlIcG5OaW1iV1ZvT0IwMU1icmM3Y2hrdVU5ajlWSWx5?=
 =?utf-8?B?dG5CUEVtdTFmd3N0Q0hTbWFzK2VWTEhsWmZ2Y0xMV1RvQk4xamVSRUFVRzZX?=
 =?utf-8?B?VktTOU5nVStUS1BDVTZmQXIxUXpnSE5HakMraFBKT0VWTThzZzV4N05SdUpQ?=
 =?utf-8?B?WEt6dnREYmNMRVFpODY5eTAwSDhSTmpXODVPOGdVc1lOaVhnR2gvTGFod2ZX?=
 =?utf-8?B?dHhzbThTYWlQc1FVbFdESU40NGEyaHptU2FYdnViWDFMQWRBaGRCL3VFK3Vn?=
 =?utf-8?B?RnArZVVtOTY5K3VUNzFSSUxBZCtzZ0ZHSmRBZE90OWhVNjVqUDUxZkdobmRY?=
 =?utf-8?B?L240NWhEOHEwNy94WnFwK1I2QmxwSUhSYklQRlBRZEZVVHppWHIxQnZ6TTZl?=
 =?utf-8?B?WHZjbWFocGdsYmNBK0E3aHBlOU9jK0ZqTkhjdFpManlEWVhEUldZaXIvdHNx?=
 =?utf-8?B?YlpIeGJhbXE2TzV0T0xGQ2lveUhJTm9ZU3lYYnd0eTFRR1FrOElScXBjenFV?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f64b6f-adfe-4362-8f32-08dd82adfab2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:29:50.4477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhTFPzxuUnE6i3KLEeZHredQGmGxaIhj6kMbAZDUvnNXP7WfZcupoFEa/p2M4u9+xI8nR6nEPf67tyYWEzjSdQg0hINWNkxg2IyaWnfEFAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
X-OriginatorOrg: intel.com

Hi Yury,

On 4/7/25 8:38 AM, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> With the lack of cpumask_andnot_any_but(), users have to abuse
> cpumask_nth() functions which are O(N*log(N)), comparing to O(N)
> for cpumask_any().
> 
> This series adds missing cpumask_andnot_any_but() and makes
> cpumask_any_but() understanding the RESCTRL_PICK_ANY_CPU hint.
> This simplifies cpumask_any_housekeeping() significantly.

The "This series ..." language is more appropriate for the cover
letter. 

This changelog could be something like:

	With the lack of cpumask_andnot_any_but(), cpumask_any_housekeeping()
	abused cpumask_nth() functions which are O(N*log(N)), compared to O(N)                
	for cpumask_any().                                                              
                                                                                
	Update cpumask_any_housekeeping() to use the new cpumask_any_but() and          
	cpumask_andnot_any_but(). These two functions understand RESCTRL_PICK_ANY_CPU   
	and simplifies cpumask_any_housekeeping() significantly.                        


Also, could you please have the subject of this patch start with an
upper case: "x86/resctrl: Optimize cpumask_any_housekeeping()"?

> 
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  arch/x86/kernel/cpu/resctrl/internal.h | 28 +++++++-------------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 20c898f09b7e..1db02bab9743 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -71,30 +71,16 @@
>  static inline unsigned int
>  cpumask_any_housekeeping(const struct cpumask *mask, int exclude_cpu)
>  {
> -	unsigned int cpu, hk_cpu;
> -
> -	if (exclude_cpu == RESCTRL_PICK_ANY_CPU)
> -		cpu = cpumask_any(mask);
> -	else
> -		cpu = cpumask_any_but(mask, exclude_cpu);
> -
> -	/* Only continue if tick_nohz_full_mask has been initialized. */
> -	if (!tick_nohz_full_enabled())
> -		return cpu;
> -
> -	/* If the CPU picked isn't marked nohz_full nothing more needs doing. */
> -	if (cpu < nr_cpu_ids && !tick_nohz_full_cpu(cpu))
> -		return cpu;
> +	unsigned int cpu;
>  
>  	/* Try to find a CPU that isn't nohz_full to use in preference */
> -	hk_cpu = cpumask_nth_andnot(0, mask, tick_nohz_full_mask);
> -	if (hk_cpu == exclude_cpu)
> -		hk_cpu = cpumask_nth_andnot(1, mask, tick_nohz_full_mask);
> -
> -	if (hk_cpu < nr_cpu_ids)
> -		cpu = hk_cpu;
> +	if (tick_nohz_full_enabled()) {
> +		cpu = cpumask_andnot_any_but(mask, tick_nohz_full_mask, exclude_cpu);
> +		if (cpu < nr_cpu_ids)
> +			return cpu;
> +	}
>  
> -	return cpu;
> +	return cpumask_any_but(mask, exclude_cpu);
>  }
>  
>  struct rdt_fs_context {

This looks good to me. Thank you very much for doing this.

Reinette

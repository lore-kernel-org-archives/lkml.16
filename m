Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2E1EB1B4
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746121935; cv=fail; b=Plej0u9dbI8dOIsV+a1GI0CQccuMZvuP7ylc17jSOubfopZ5/odQgoyJ9HsGJUbN9FmJXWV1IeSRRqfHJg3fdZ8wWP7fWiLQjFhSxSFBSUXs17yEMRPRfvdlUNFqWWgW8FfQXZmS5fIMCAPZ2WUUx9iN3suRIl7x8AaJD3OCwAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746121935; c=relaxed/simple;
	bh=nAa15laOXWpcjruLx6/oFAnguP6KGHHQzwKfdOmM3N8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qZBlECbhy+SxRwNyjD5o5mqV6uzUw6MPNdumae9veHyYPSqEv7H4aRHPvQ8F5xD6J4F9e5KA6wlBZFkIBIgMXl6MttMot3cmJEGuV8XRzXG5MJAXlsMdLHV/putmwVKY318Txw0FxCypCvS3UflqRQ9MskN7/o1a0k3QZaujoGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kP+aHC3d; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kP+aHC3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746121934; x=1777657934;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nAa15laOXWpcjruLx6/oFAnguP6KGHHQzwKfdOmM3N8=;
  b=kP+aHC3d6RcXXazIqrEDa4pnk3TLsVx5OfJ0eqwNxvoruHhIqmLXyyDp
   55CIlWGose+zb5mqQsGmeP09esPULui4VzUeq/LQ0wzPasEUBlUKUhtCi
   qGOOkCj8w+aDEOrvE1YjJceyOe4G63X29Ce9VO2EwNTDjQl4C7VB0fXDt
   ENUnP/eaW3SI+iAE+mCI0XvgqxDjz8waumOlOc/Au7h/z6NHhS0gqqKTF
   48saqsRx+TMaAvtrsEwegqDFA//2D68bPT4wV4MsGvlI6h/JeUsYEnGl3
   XnjHeUJ+ikBbOnzbHBSlorAd+tKOrLHYDVgBBdzeZJNBwOTKVgiAG8Sla
   Q==;
X-CSE-ConnectionGUID: BQVgdrkjQd6PV8PY7jIPBw==
X-CSE-MsgGUID: MI/XRdTtRuuVcMmIWAw+oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51612531"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="51612531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:52:01 -0700
X-CSE-ConnectionGUID: rJrc7jzRTly5mrHSpC4Ekw==
X-CSE-MsgGUID: AUUDWZoQSgag0PCRut6ucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134180434"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:52:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:51:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:51:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:51:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nebDPxNpdLPo6BgWnOVDsN2OtSQzqJAE52QtJZCWrMU/g87TwQbSqRHpUv+aHsb3ovxRVw5LpEVICv382GwxaIMyY8a0NchBeMy+NrRziWwQYg9CpBvqANGdVbC/jvCpKuwx1KpfOJ/4Vdk11HsRzwnbHIFT1yprThm7YmDEgeDcmNXmj9Nhyho/+CF3T95HvWU6wQtiFR24cGSYwoQgXjpoh6cWJAlE4dgrVVeCph4qRAaS6TqfZWfNg6iBJnO5rhPJBwfy2Sc6PXZVsr6U6Wd6Bo5PRDA5bSde1/T0snIljCiEcGQRam92QV/JCteU7qZM/IedPIDbdUyAm+G/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaisYswYsmO28a4eyUSzJu6qnVCaLlMooJTKKEThYnw=;
 b=Z3L85M4DOCBhoYTGX6f6OP4sah0FfXZJNpBIygZHmD1doMish4kxFfXnoztEMPZLNZ43vKlqzg06zW4V0Apn0UHi6H3h3b6e1FcsGfs7D2D7VGiYMvfHu7hWNBG0hU5qQsyIuk0+qx2dZfFZD8xVrdD8JSkWKxC5CyWv+fwVpLUg+Ga26MEpxgm7JGi99o4qD/c8EseQq8QpLqsUtO1YMEYgFwSTWIOsMNIaFYHgM/zQbHS9i3lNFeq+vdM6aIdMsDOX5aMm+NgHtdHC1gKj9NQIKwIcJgZJuW++hyO2+/QC/VoQ6PKAv9MYqDFn9dFOZ6+Tc2jhqzl+f7wvlM2NCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA3PR11MB7656.namprd11.prod.outlook.com (2603:10b6:806:320::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 17:51:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:51:26 +0000
Message-ID: <dd2b3b2b-84bc-490e-a2f4-2096cb08c84c@intel.com>
Date: Thu, 1 May 2025 10:51:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-1-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:303:b9::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA3PR11MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f31890-3e01-4a98-71f0-08dd88d8cb9f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzdkcU5vUStrRU5yNThaeUF5a2k1V2J4b3FhbUtqRDAzUjZCT0tLSEVxcWFo?=
 =?utf-8?B?ZnExU0YwRjBDNWFRUnYvUHVsOWNQSVFLcHFmc3BGcXl4NCszNld2SERDbWhB?=
 =?utf-8?B?YjVGcHE4UmpySE9jQkF2QU5LWWU3eHgwekpNeU4yeWVDWm5TbUNxZGl1eGt2?=
 =?utf-8?B?Yjc4aE9ONGo1Ujd4a1N3R0JhcGpveGFsclhYZXpLVHB3NzVxaTgzY2FMVXJj?=
 =?utf-8?B?SXRzY2lnZzUzSFZEUkxxb0VlbmtscEVCMG1vWGtiRmxuTjdYUmcwVkdZZnha?=
 =?utf-8?B?bFVQcVV3Vlo1dDhXL29ZMjU2T0p2aXdQVjJlNFJ2T0JIT1JpazgwbjR3NHVP?=
 =?utf-8?B?MnhaZkRwcVV4MFhJM0k1aHJBZXEvSktBNjBDYTd4aUZEaG1KZkNTRTU0bXFI?=
 =?utf-8?B?QUtESFBRTDNGKzhqTnMwUE9WT2RndkZwV3JTWDRFYTM2OVpsYnNEVVFRU1lY?=
 =?utf-8?B?Qm9tcjhHVDhyeW5qOEZRekttekxYMHgxSEpuQnpMY1ZUWDJHNUkrVmUxbEVI?=
 =?utf-8?B?cjk0M0FGU0U3bVpRRytUUzBCWS8wbUljd1RvK3hiYi9EcnNBeU9TSWlqZHBD?=
 =?utf-8?B?Z2dXL3VRaGdneDZ1b2hLUitQdFVRUzJ2c0p3Skk1KzNuTWpnOExyVE5iVnkv?=
 =?utf-8?B?T0FMeGZvWEdISVgwT2xRZUxyKzI0aXRNNHU2RE5WblVaSi9uRjFIS0pJUm1Z?=
 =?utf-8?B?VmlzTDhFbDFlZkFCenVzT1Q1eEFmRnVpa0NJQUsxaFkybWxsOTZ4WDUrd0Ja?=
 =?utf-8?B?UXNMMVp3TXIzNnRkYTU2UjBPWTMrS1QzbWFFclVwSVdqcTZ1MEViSDBlQ3BN?=
 =?utf-8?B?S2huV0hwWk5NdG1Zb2lMeXlyTmMxb0Y3L1FZOFhibWdpZ0xmK0NGSjNYYTBr?=
 =?utf-8?B?YWQyRHRKcm9UeGljOW0rbENydENmdXhrcENlUXArczFBQWlXUk1ZRlhXRmYv?=
 =?utf-8?B?YmJ0ZGlhUGxPQ2F4c1cxRFpqaUsvRTdsLy9lL2QyMG5VT1BsMElQQ0drV0Ex?=
 =?utf-8?B?S0pJU2xjYXFJSUl3cnNSdS8wRVAzdHEyZnQ4Z3g2c0swT09zOE9NdWtneTYy?=
 =?utf-8?B?b2hkLzZXdkVBRXN4czhuQ3FnWTlNM3BGdmlOeUwva1VnWUpTdkZ2ZDhNMEtW?=
 =?utf-8?B?OUI2bTdwR1dvaDcrUGwwaHpOVEVCTVNYa2Ftd0pkNFlJTDBhM2F3QW1Sd1ls?=
 =?utf-8?B?d2F5bHFwQlkzRVFDY1ZYNkFFOFdIejZPMWpSY1JVQlY5dStrd0NGdU9SRDF1?=
 =?utf-8?B?aFFQYjlRSTY3ZXJVV3dId0lWWmsrR0ZYOTMrQUZnN3BJa1YwMVJXbHIzNW5O?=
 =?utf-8?B?Rm0wc0R6enUwY05iMHFUVHFkWUoxRjVtQTNSYlF6NEhoSjFVRndYOWlyaUsr?=
 =?utf-8?B?M1gzdndjNVVUME5xUVRsbUgrR1ExM2o0cUdLVVd3YmlwZklEbXJOZ1dZQW5T?=
 =?utf-8?B?eGdKV1pPbVlMRkJxSHBrYzFOVFNIVmNUbTBoR0Y3bjZZVWpNTTZrWmVYZ2Yy?=
 =?utf-8?B?RXAzZURPSWxNeTF5Nk1xZ3hSWHRUUVZBNDFVRTNpNnczY09WRVBkSHdWQUIz?=
 =?utf-8?B?dDFvdGpNTS9OcDhhODRPblVqL3BXcm5Pd3VLc014QkJhYXlvUFNueWxLTG5n?=
 =?utf-8?B?NHlrTmRPZkk0ZXMrQXpJdGdtb1FKZWxrQWYwRnJIaStjNjc0VnZaWlZtTTRM?=
 =?utf-8?B?RXpLb1FPV2JHTHJmRkZKbnUxRFNWQ2FMUkpGYjQrL1ZKTGNUbzZqdGpBSXlK?=
 =?utf-8?B?dUdlRGhnNEV5RWc3aWN5V0c2NXFadkNLRkxQRmFBc2xYRnpOeEZleFlyWFl5?=
 =?utf-8?B?WkE2SXlqOEtWSmpPcDZIMG1TMEoyT0hBME1yR3hQMnplV0hYRjdMcnRobk8v?=
 =?utf-8?B?UlBRL0hlTWF1NVpJelVIN1RtbHFyYk5KVGlaZDlxSldTK3ptdm9aa21LT2Mx?=
 =?utf-8?Q?+CxCodJlxkc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHdEK2xqbDRMKy9DeG1BY2hneWVqZlRubzZMWlYrdUt6MUl4d3kyNG9XSUMx?=
 =?utf-8?B?NGdMNDlkMXJTaWJ0TU93MVVVaGhkQ083MnpId3p5WGpMU2lQN1JiTHc0MDVE?=
 =?utf-8?B?ZmswcncvQTJJUUVUemxqRUluWkZ1L2xTNmpEN3VxSnF5enExeXI2RmFPVHJt?=
 =?utf-8?B?RHRJZTd6QXc2SlVlR1J0SGJXMUpCSXF6b2FtN3NvTUVUZlhMaGJpa3g2U200?=
 =?utf-8?B?MmNoVzhpNmRUeVhNdzNJRmh4MEMxazEvNDFkWDBKZHhSNVlUd1loVDVrazk1?=
 =?utf-8?B?TzNKeENkVVlTLzAwS1hmbmg0ZnZ3am50NS96ZWhZTldOV2JsY1JvRm5NcXVI?=
 =?utf-8?B?c1RLbmIrMEVaUmRFVm9yTkZURlNMK1Rjdi9CTW11WDhRVUpQODVDeVk5QVRL?=
 =?utf-8?B?NGxMWVBqbFowK05nZlZ4MG9QTjczNlRJcHRJc3ZoN1BUdExqWlEybUJjYlEr?=
 =?utf-8?B?M0pSNG5zejlaL3RDNW9ZZFBzTzhBbkZxc01DcUt0bVVLamxoV1hUS200OC81?=
 =?utf-8?B?RWcxQk1vZnpLVExaTVlnMkV3ckhOMWNDZTZJVWIydDlDLzFVYzdRZzdtamRT?=
 =?utf-8?B?UDRKZFZxVVl6MVpEQ0w3MUMrYTE4aHExZFp6cThRUmRlOGFaYjBPRnRLejVx?=
 =?utf-8?B?Zmhaci9PVGZWSnh2MXZJTmFmSzNOWnpHQmpCcDBLMzAzSWtLT0FjdWhXS095?=
 =?utf-8?B?UDdiWDRNbVRLSjQzbENOZldHM3BUMFZTdFM1dFozRFRZV1NrQlljT3JROUFm?=
 =?utf-8?B?cXlEcVVTcXVBRitadmFvRmF2enl4bXkwZ1BGdFpBd2Q5WU1jUURteUVxZTFF?=
 =?utf-8?B?K3NLeVZMaHhjL2gwVmNQUURabXh3ZHN2R3Z5ZDdKWXl1c0Zva0YyNWJ0MU5u?=
 =?utf-8?B?VUw3Yk9lMlRYYWtCSURyT2U2NERpbkcvazl4U1J6dnpIR293WDVCRUM1aTRs?=
 =?utf-8?B?eWdIWlNNRXlFc3Z5cHVMZmJOemJwMWZBNGFxanczSE9GRE9oZnNuVEdPRlVx?=
 =?utf-8?B?amRMZ0pGTzcwZkxVK3NjY0tEWnJ5NzhMK3BOejc0TVYvWUM5aURVNDhTcHNR?=
 =?utf-8?B?SFpHVkJVTVpTVFZJcFNpOWM4d0EwbWk1M2psdHFBQ3N0SXhFQmtZMXR4V3dN?=
 =?utf-8?B?SDYxdzJ3QkFHd0JTNWxMMnp6NTJpdm9xVzFQcGR6ZkEvTHZ2bE8xcmtLTk9n?=
 =?utf-8?B?UnlER3QvQUFTcndvS1lDdCttU0piOGpUc1dlaXRwOVhsakJ6MnJhWjFablor?=
 =?utf-8?B?ZlNOdGVnR1A3YWlDQWt6MjhESzB5WFArbkcxYW1JQldPVlV3RENlZmYzMFI3?=
 =?utf-8?B?SjNBREdoZnlKaEZzWmZmRDNwbzY4cFNYeTRSYm80U1A0Uks1SU1wRWJTdWZ1?=
 =?utf-8?B?TWNVaVJ6ZnJlbXVQRjJEbldHRG1mTEVwcWJGNzg0aGtVUXZvQkxiRWkxRGVy?=
 =?utf-8?B?d1JzcUxNOXZmZlZBaG1vdEtzVVU5T3BYdi8vWUc3eFBMaWF1UGxoeGVJVGF4?=
 =?utf-8?B?U0xjYmZsOGNOUWx2MUIzSEZ1QS9Ic1J2ZGxOa3B3YVpRRFZrTDJ3cHVwc003?=
 =?utf-8?B?VEI3alk4K295QVAvcVhLRVFpOHp3ZGs2QnE1ODdpaWpvSFcxdmord3B0SDI5?=
 =?utf-8?B?bWZXek5uVDlBQmdDQmthSFV5bDY5Rk5NWllCWndxY29GYVVnVjVoQmdYT2t6?=
 =?utf-8?B?bzVtdDIvUitFa2lreEs0Mm9uaGUzaVRrUk5MS1RpdTRGQVZ1bzA5Y1ZQVmVy?=
 =?utf-8?B?RjF1cUFFYTcydGgzRGVZYnFIMDZNTXN1V2JuRWdBcncydldxVFl0L3NIaXNB?=
 =?utf-8?B?QjRYbHJXcDNJU1ZTWjRGdCtoOTNFYXhsNk5tMnpaUUd0eHhGdS9ySlhkVXox?=
 =?utf-8?B?dVFBZTZlQUtnb1QrVnBYajVQb201aU9NRE5MaHpBa2U1T09sallEWGc1enQ1?=
 =?utf-8?B?aTFBOHlGYURvd2lrczQwNWFvZXMraytpaGN4TDF3SWJ3R3M4MXFNaDF0eERE?=
 =?utf-8?B?VVRHRkhsMVNNeTBWcC9uZis3cDRQd2lMUjUzRysxMEZzb3BxMytuUFV2Tzlo?=
 =?utf-8?B?NTFDVFFKalBmd0FXVHp4N3FJK1VzYit6MkM0TW1pUXMxaFJsTk04SzRZQmdh?=
 =?utf-8?B?Kzg3YVo5ekJZRk5LbUVJcHhxVUtpZjNBc052bHFkQkRJNG9zUGd2S1EwQnFJ?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f31890-3e01-4a98-71f0-08dd88d8cb9f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:51:26.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHCqGntgD/amZa7YFPzuHOWSQt7KcdDSdf1a+/AILXtzJemHdGe43mLEChq/qyGX0376xnE8zpJCUT4y050nbI6Q/FCO9V6XLbe7Ijhx3vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7656
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:37 AM, James Morse wrote:
> Changes since v8:
>  * Added check for closid_init() on monitor only platforms.
>  * Moved end-marker into array and added default cases.
>  * Additional patches to move prototpyes between header files.
>  
> Changes otherwise noted on each patch.
> 
> ---
> 
> Patches 20-26 should be squashed together when merged, taking the commit message

To make things as simple as possible this needs to be as detailed as possible. For
example, drop patch 21, *then* squash patches 20, 22 - 26. Having your repo as
reference is a great help.  

> of patch 21. They are posted like this to allow folk to re-generate patch 21, then

"patch 21" -> "patch 22"

> review the differences on top. Not squashing them together would expose a ftrace
> build warning during bisect. (but who does that!)
> That would look like this:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v9_final
> 
> This series is based on rc3, and can be retrieved from:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v9
> 
> This series renames functions and moves code around. With the

This series evolved to do more than this ;)

Reinette

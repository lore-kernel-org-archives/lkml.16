Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E9A26B948
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443762; cv=fail; b=O6m8uOwFSPwEhjqhp/yulFZEiLk09Nixtr+XnjNRrCvSw2IX1PTXXoOQQXenKOc3ObUy2dOYWzkXzDkJlBU7JOk43Ql+U3tc6n2ntLGN7WLMyti8LWjddXovng3GJVonfRsU9OrPH/FJ2yGVr9j1WTBFjVIffN9Vr4UAL0OwpkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443762; c=relaxed/simple;
	bh=cXgDgCFzx1Bcqat84nuO1H1tTEkWUWzJQ8LfGNbyy6s=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qqm5POI31Stc1ImMUxa8ex4g4u1bf3mAdqiujw1WaRn5Bkzy4H2wp6JToVP2hy26beUK6V9/+m2KYBlxdRnnUgTfMNqirSeW7fiJzxRytXSDsd9IXlYl/+XGuyqxJrhHZiJVkHPddW6YobGTulGK9eu7G1WbVQndqjiVm+Fp7f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jt4tMPhf; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jt4tMPhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745443761; x=1776979761;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cXgDgCFzx1Bcqat84nuO1H1tTEkWUWzJQ8LfGNbyy6s=;
  b=Jt4tMPhfkSec8J0kARtPPVu0AYnS8aQOt0v2W+WBwMFE+3CNcxEpS8PO
   1eA+xB+AQlhc5hMhrThqvkE9Qg1YSPGYfX1G1eNRMHRwlj3duEhsvDEN+
   gPoeXb9conVes0vr5C4yqbdGnDGy2Nrx4WB2Ly39yvufB9o3VOadu5tIu
   z/fbH39lzGozH/t7E/Hllw8yoPWMW+nYPSBPyUIDXTbZ3GAYS9x0rbbCb
   I3QukvZwPXlHxF7ni8tjJ570arwedbF2fULSZ6NmZNthDUN72v4qXmJi2
   +O+yBy3bPGwwFLIG9QwYzw3UYMADlGfPWd7+QmEn/8wrtSEbh6NjM1gJx
   g==;
X-CSE-ConnectionGUID: DDNYex7LQqWWy5ui8eHzeg==
X-CSE-MsgGUID: o5WviTJTSlSxKtITLDZLhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46175161"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46175161"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:29:20 -0700
X-CSE-ConnectionGUID: Uw4ku1y4TIKoVConuJoP1Q==
X-CSE-MsgGUID: 3h98R0z4Q1i3IlmJexG8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137603254"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:29:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 14:29:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 14:29:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 14:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jynCtqdwsnlBFIbxBYFS+EJwfcdv6oIuOc1Xl49a2FR+Dx7/Oiu5AH7vFkQFIudGIOy8UeN1pYcqguUnlsTOdKcrUauMcd5bNPkeOtyG43rW+h9gzWD/EaLsTimFKlFmp6aZV9ndwJAk/lzpSfveKAuPKGkCfNxqhfVMVnQf1Af7oQbawmG5OqY9/76nJVGg2vcoUp2AemsR9B8N9n4qq/FcHOEJMyCcDtOVULDkL/PxCKY5FyKxdjj1wY+Ljbzu0CAKoHlVxOOWmM2/uXynbCXEGChIgismSe6BZxqZgHkTEGCFyKYmdRjRhT4yUU+jGEW0/ngRJoQ7KG2ckuv9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cc9bX2BGDy33iFf70yvh0bYPHLJ4FYE0yN1TOvO7o8g=;
 b=eJ5qkypRIs3UGwJBulG9wgVfUHdFutxKU74dmFaYdjhSMj4SxDz7r8zFjx9Iu8EhGO+wQAPO4oOqHg1DGSvPnAZKh8RC56o5kSGaE9rSacZT+q/Ktgr64tOq791aeY7xn/CkCeDFiyxhOneMAcfndZ8xyqynv0BfxwkH00lkmZ1NZpD36NIbZJB8gxviEJ9HRONwl0Sl5ICfm+5fhnyuznARXzOXRVWnrWBu3tJ5n+V4+JaR6+QJQVAy6roz3CW97cG3JRvkpE4Xt3pzvFYeURF96WApY4NYlTpFHeg3yKkldWhK4HvA/6CckxtYYfkbfQ31wTvVMbQLZU45XGNIJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 21:28:40 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8655.024; Wed, 23 Apr 2025
 21:28:40 +0000
Message-ID: <c96bade5-200a-4812-8df6-d6dcf2984a01@intel.com>
Date: Wed, 23 Apr 2025 14:28:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] cpumask: add cpumask_{first,next}_andnot() API
To: Yury Norov <yury.norov@gmail.com>, Tony Luck <tony.luck@intel.com>,
	"Thomas Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <20250407153856.133093-4-yury.norov@gmail.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250407153856.133093-4-yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0309.namprd03.prod.outlook.com
 (2603:10b6:303:dd::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a97e67-e793-44d9-8b66-08dd82add0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmFHcWJOZXQvUlpqZUZFaTdwbGZjbnd4NG12Zmc5MlFPOG5lenE2VXpnK0lF?=
 =?utf-8?B?MHg3NEZIQ1N1NEtUQzV5MlJ1ODN3Ym56K0gwNXMyVGpBd0lrWVZTNUxsMG5W?=
 =?utf-8?B?V3kzK2dxWjQvZDBCR1FFMERjdlVmeUNZSWUwbTZvOW5MUTRMZ2ZVTFNLTFUz?=
 =?utf-8?B?NUw2dWtBNDZQOVdFekF1SmZMUFFNMmUvalA3TWdrTDhJYVR3ZkxZNjNXWVlM?=
 =?utf-8?B?ZXE5Y2ZaTmlDK29ENFlwSVpwQ2Y2d0JEb3o3UVlyWHMvU2dSVnhJWis1WmU5?=
 =?utf-8?B?djJIR2ErTStmVFBBc25nRlYzQkpaL1JvR2tzMDk3dWwzTTFkd0FVV2ltbkNj?=
 =?utf-8?B?enZYdDRFaWhvTW14RHNQVmNjOVZFR296N3JBRFRtbE43c3JITEhBUnErNTJy?=
 =?utf-8?B?L1l3aFAwWUEwNlZNcS9KSXhTdi9qN0JRc1dWRU9SNll4NHR1Nm5ucmFFNHN2?=
 =?utf-8?B?OGNYWlpURnRENmFTQTZHVHkzTlJMbytYc2VaTmxJVEhadER2UFVsckQ2TlZU?=
 =?utf-8?B?RW1rNHdrSzVIckFRTnFiQzNoVFhOQU5CcjAra3RiajRmVzZTVE1nRVlmTmtC?=
 =?utf-8?B?Qm41Nm80ZC85c1pxRlhTRnkzRUhzbHA5OU1zdHp2bnBuVHVNZmdlWEcyOUk2?=
 =?utf-8?B?WHkxYlpOWEd0VllXbGorOXFXWUs4MUh2cmc3Q0xvTEhzZHczbXlNYXlPZnNw?=
 =?utf-8?B?QkdFQ2R4THIxc25vNTg0N3JLZW85bW4rNkdQbWxZOEVpVmMzdnhnNmozQllB?=
 =?utf-8?B?UnVuWUxjL2RaaWM4Rlg0a2xaM2tiNDJHdXBqQVo5N3pBb0hGRS9nQUNnWGo2?=
 =?utf-8?B?WUFWSEx0MUx2a2xQZDBDa2JHTGRIZVdWaktGYXYvN0l2c1ZJaFNYU0UyOU9K?=
 =?utf-8?B?RFVnTy9HVVR6VGNlS2tGU0N4S1N2OElMK3BlTGg3Nk5tQjZKRG54RnJkaEJB?=
 =?utf-8?B?d3V2VzY0MW14M1F0a0dVVTIrYjRRWEhsbGNRcFRkSDd5OEdFQnRjR2dwVjRW?=
 =?utf-8?B?VG11Wkg2RkdITE1sZ2s3akFiSWR6NDhaTXZaYkgvYVpzNXBOT2NTaE9FSU1D?=
 =?utf-8?B?UG9oRnY0VEpsend1TjBqUHRFZnN1ZmxScUFYOTk5aXhjUWllT0Q5L0xyMUZK?=
 =?utf-8?B?MENsOFVXSklhb2RmcWNIVXdxeitNa1AxbkdOUGJwMXdDRHhCVjVoRXJkRDNt?=
 =?utf-8?B?aVlteTJtVUowaldPYzk4Q1hBbThHSG41UE81Vzh4TldtVmRsTE8wVFBQRlpC?=
 =?utf-8?B?Q0R5MTVCZytjeDFKZWN4TlBxb0syL09nUVNTOGVNZkg1d3kzT3RleEQ4aWNw?=
 =?utf-8?B?bG92NGVMVXZBRU9MQUVzajRuRTBTcWRvLzY5ZHJHM3VsNzNiWFZ2ZmJDU0lt?=
 =?utf-8?B?eUNpbVJoREhlbWF5bmJISk93TGNVaHpjcU1EOW14QWJqbFBORG4yV0p5VFJZ?=
 =?utf-8?B?Y29QbDBRa1NhNTd2eW9VTjJNRFlyUVVGcktSTVhyTkFsRzlYYTZJVGdIdEt2?=
 =?utf-8?B?WjhSdzFGQ3pTU0JEb2dDekpMTklrYU4zY1IxNkFMSHdGUWkzQmF4OGt5YkVu?=
 =?utf-8?B?d0xvUndiNjZSYm1nMzMrNFp6Z3MrV1R3dFlnUlFLRzNUWlRoajdwMmc1TlRC?=
 =?utf-8?B?cUU5UTVzOFNUSktiRU1CWXBtRzFQZzYzMTlCd2pNcTMxT0I1dnZydStoVHNp?=
 =?utf-8?B?Nkw5cC9uaE1GQjdmQktOU2VnWjRCeVdjc01yNXBBUmJPOFAzQTFacUhLek12?=
 =?utf-8?B?V2FKSWtkS1pGbXFadUxXU0JyL2VmWUpPVk1KRWYzK3dYWFRnQVhqUUVRUzFk?=
 =?utf-8?B?eGhMcHRVTFR2UVZyRGJDcDJablFmRWZaajQrR2Y4ZjRFUStJa25zRmdhWlE0?=
 =?utf-8?B?dHFZL1J3bzlKRHlMVmVLMzZhMnh3Y0dHR2ZwdjRGRTRJSDVBc05BWmFrTjRq?=
 =?utf-8?B?RU9ud3pmUERVNmtkY3p2SEExWFNoL1o3SlZGNEpkeDhTZ1ArSVBPZGZMN0pE?=
 =?utf-8?B?Znh3bSs0UnV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUR1dkJYOTZFaXUwZWlrQXJieTYxM1JkTENOM1IyZHlvdHdVekRqOUxNc1NN?=
 =?utf-8?B?SCt4dE5XZEd1UWZzbG45dXhQTGx4c1N4Wk85UVNMUlJjcUxIQkhjT2FNVWdh?=
 =?utf-8?B?VWhXSEhBamNxd3MzWU0wQ2RTWnRoT0RWQ1JVS0djVmtiK1V5TzcvYUJKVVpQ?=
 =?utf-8?B?L3cvYU5DL0FJdDBrNTlJZDh3M0lLRjl6NE9UdFU0Vk1GZVJNSkpsYW9GYnN6?=
 =?utf-8?B?NmcwR21ETzNUNHBDeUJHZ1ZhY28yZW5VOCs2bkRWZTloc1dRV0RMSkhlODdC?=
 =?utf-8?B?SUo2Wi9OUk1tZTlUYkRjOXpLdUsramMzWWpob1BoT1pDRnV3d20xU3ZpYUdn?=
 =?utf-8?B?ZC9YYTFtOExmQnhXTFo3a3hycTNTdXpTejRlS2Exd1Brb245SDl1TC9vN1Rn?=
 =?utf-8?B?aEs4YmQzSTl5czk4cEY0L2k4Z1lCc3p0bzdOSXBoaXZTTnJOSi9TMm9mY3d4?=
 =?utf-8?B?cHhrUEhjSklydmxTblBEVDhRWUtEcTZUSTdzZ0hPeGNQZGhYNTNmNC9hM1lX?=
 =?utf-8?B?NXpaTE9EbkFmMjkyNXlmaFRuSnRLdVQzbHlMaE1nNW56TGd3Z0FGb1RRdVg1?=
 =?utf-8?B?U2NDVERSeVZpaDlRQkNicGFWUk9Jb3RaMXpiYmxpZlBSMytQd0cxNTlLdS9m?=
 =?utf-8?B?c3ZsRDgra0hjZk50ZStrVzI4QkZrSXhnc1BCcG1iOG5vSG1pNnJxekYxOUhu?=
 =?utf-8?B?bEV1MUJmNWJ3WEE1N1pVN3pnR0Z1MDl0Ri9WRHY3UWMzM29PM3R1TmJBQkRV?=
 =?utf-8?B?NlFCRWgvUURHd2JtN2dyMFVOOXpUcG1LRktpWHlQcHRFQy9ndkp6M2RmeEtZ?=
 =?utf-8?B?bzZucHoxc2pIbUJzbHJkZW9MZWJYVTZPZlY2M1NqSVRPVWl5RVYvR1hmMmtT?=
 =?utf-8?B?czErZ2VRTEhVelM1Z3lzSTVhancrU1Rqb1UyT3JXV0RlNUFCc1lveDhWeVpR?=
 =?utf-8?B?c1dhYkhrcEdrTFBwallNcDVsYm9CdmlNR2VJYW1wVHVoKy91dVVPbHl3N1Rl?=
 =?utf-8?B?SzBGRkhVZUtZWFZNQmVqU3gyRlhFYytZZExubkczVW5HdnFBZ2l6RmhGZlZJ?=
 =?utf-8?B?REhhVUVBTzB2cWE0aDdqbGlXazVleng3Qm1zeWdweFRwOE5yN0pXU0FmVnFE?=
 =?utf-8?B?ejF1WWVVcHpsVEdWNG1QcnVKMDQ0bWNoNE5PVFg3alBCczBiVVlNbXN1dUtP?=
 =?utf-8?B?MmN4bnhlSDhHazNMQXY2UjdXcm9vaHA5M0pZUlNlekZsTFd4N21YYnVqN2Ur?=
 =?utf-8?B?dXp4cXdCU1k5M2hmRU1qYjVjQ0swbUgvaUsrLzZ0dWtURmJUMWRCM2xVUjNz?=
 =?utf-8?B?ZzRnT2Exdm9sdW5neUxGTlh5TTUzcWVJS0ZEVHRocVE0MGpHOC9QanFjbG5z?=
 =?utf-8?B?d093Z0lvVk1tc0syeGhDUm5WQXlLSWdINW11a2h1NTlSOU1SSkJxT2lJNnhS?=
 =?utf-8?B?THRvTC9OTHNVeGg4T0lyUnlUVk93REs0akhGZTM2VnZGU1NpWVZscXpETG56?=
 =?utf-8?B?RTFQU2FUTWZUenJCUzRFenRsckc3SnBxcWFWSE9PbGhOV05mL2x4YmVkS1gv?=
 =?utf-8?B?d2VGMTFhL1lLUHRKZ21WUGFMNHVFWnF4RTAxVzJXaXZZU2djbENxdjhLb1ps?=
 =?utf-8?B?UnlmZU5qOEd2NlNNR3FMSkV6MnAxaXV6eStNYTc3dzJITVRPejgweGEyZndI?=
 =?utf-8?B?TnlNOWZCM2tUSGpDazd0ejhBUFBLUHBrWVl3MUtsQ0ZuQmN0NEVqOUJHR21O?=
 =?utf-8?B?WkNoeHVtTi9ENzRVQmpPR1ZsOFhJMnBaVFdTMlFSQzBQUS8xVlFzb1pCa1R5?=
 =?utf-8?B?OWxkdVY5bVdmZ2xVUm01bzV1WXJGeWlnV01WZHVHVW1HWUtyRmQwS001TG9J?=
 =?utf-8?B?elZ4b1ZIcnJHM29XdU9LdEx3T2dzdHI4TFB2UUQ5MnlueHFEayt3ZW04UThP?=
 =?utf-8?B?SnYydGFCdTA0UC9kb1VrWnRIdUlkbE9XNy9HbzIwT0tRYXlyMjNsRzl5MFBP?=
 =?utf-8?B?TnErRk5SYzE5TFY3YzBVRThGMVhtKzhNdFhDNkJRck8rY3VUVkg2ZnpxSWt4?=
 =?utf-8?B?OC9INnpWYnJka2xKU0Z6ZWg4dUlkdGJsaDdRYW4zTmgwcURpUnd0VjE4RzUy?=
 =?utf-8?B?Y2pJcldzVmYza0hqVDViN3puQkowaWxsOWZDR2N6R2VncFdZV3poRTlZa2NE?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a97e67-e793-44d9-8b66-08dd82add0e0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:28:40.3202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlNV2+PahhQryyZiERPR8kUY+ZRo5TawKk/H1R0HkiQtY7L4a6F6dXWOoi/Zg7hnDB/KQUzxFPM83phNLko0Q0IwhmtZNonG48LFibL9MF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
X-OriginatorOrg: intel.com

Hi Yury,

On 4/7/25 8:38 AM, Yury Norov wrote:

...

> @@ -284,6 +297,25 @@ unsigned int cpumask_next_and(int n, const struct cpumask *src1p,
>  		small_cpumask_bits, n + 1);
>  }
>  
> +/**
> + * cpumask_next_andnot - get the next cpu in *src1p & ~*src2p
> + * @n: the cpu prior to the place to search (i.e. return will be > @n)
> + * @src1p: the first cpumask pointer
> + * @src2p: the second cpumask pointer
> + *
> + * Return: >= nr_cpu_ids if no further cpus set in both.
> + */
> +static __always_inline
> +unsigned int cpumask_next_andnot(int n, const struct cpumask *src1p,
> +				 const struct cpumask *src2p)

Looks like the custom followed here is to name parameter that can have
-1 as value "n" and let it have type "int". Should this also apply to
cpumask_andnot_any_but(), cpumask_any_but(), and cpumask_any_and_but()
modified/introduced in this series?

> +{
> +	/* -1 is a legal arg here. */
> +	if (n != -1)
> +		cpumask_check(n);
> +	return find_next_andnot_bit(cpumask_bits(src1p), cpumask_bits(src2p),
> +		small_cpumask_bits, n + 1);
> +}
> +
>  /**
>   * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
>   *			   @n+1. If nothing found, wrap around and start from
> @@ -458,6 +490,33 @@ unsigned int cpumask_any_and_but(const struct cpumask *mask1,
>  	return cpumask_next_and(cpu, mask1, mask2);
>  }
>  
> +/**
> + * cpumask_andnot_any_but - pick an arbitrary cpu from *mask1 & ~*mask2, but not this one.
> + * @mask1: the first input cpumask
> + * @mask2: the second input cpumask
> + * @cpu: the cpu to ignore
> + *
> + * If @cpu == -1, the function returns the first matching cpu.
> + * Returns >= nr_cpu_ids if no cpus set.
> + */
> +static __always_inline
> +unsigned int cpumask_andnot_any_but(const struct cpumask *mask1,
> +				    const struct cpumask *mask2,
> +				    unsigned int cpu)

Since -1 is legal argument I expect "cpu" to be int.

> +{
> +	unsigned int i;
> +
> +	/* -1 is a legal arg here. */
> +	if (cpu != -1)
> +		cpumask_check(cpu);
> +
> +	i = cpumask_first_andnot(mask1, mask2);
> +	if (i != cpu)
> +		return i;
> +
> +	return cpumask_next_andnot(cpu, mask1, mask2);
> +}
> +
>  /**
>   * cpumask_nth - get the Nth cpu in a cpumask
>   * @srcp: the cpumask pointer

Reinette

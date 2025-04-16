Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19352139B5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822597; cv=fail; b=Ok1kxRmZ1Irw+m4bLCnGJusFYbOYvW9/pCkyYI4fuQt2i3CQMXJvffEg9jExM8+3Iovq+8Lp4BK2RpAaMe8IfJZYnpIOlWIbIViNBMhCzvgsEu4qQ5WIJ4W2I1glSIU5qGaBDTfDuUrUNKrNSntEiMnJ7EOZFMXzFdMZQrVi268=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822597; c=relaxed/simple;
	bh=X/StlWuJbYf4h5AgS5/cL6EEdNn53rE+OEP/LUB6Zj4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qfx/t6LM1YGUQLI7pHSWl7r1ppiSwk9vBC14VvuSIuf8+qT/oq5Ghvo+c/feZb+pg/cznZLVEO+zjJSTt8xgFcTHbvcxLUfg0HLa/1iW+y44SJSteE25tsYK+JITVixbg/rfLZJD1JXix5+ZGgxMwIeEYow8zsEConRtIvzKN9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1q2UT3U; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1q2UT3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744822595; x=1776358595;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X/StlWuJbYf4h5AgS5/cL6EEdNn53rE+OEP/LUB6Zj4=;
  b=M1q2UT3UgwzTl646FqxRx35RXvJ/PmaQ+ZdwGsm4z62yeOaiky/XPqk2
   oN8cIx1UaRUf6pNoLB1Sj3tZmeiafaLN73F3U8wrWhpEehhVe3WDg8dGN
   faPfjRWpmrRJhskyI1TjpMGtnE+Tkl1zgY871tHsmfSUt2+WXlDVOcU89
   kIc2Jhx+3ltXHUBtyPT9pRis37wTUb994fjX0phxSXfo346rGhzqRal9z
   Z39HbL/ZJ7KiyCTmAxLR0EC0wTU6aKbHe5OB8SsGQgOH9HRSgrMugq5Ov
   q0sbUYAGQrPw3chsqNdY+Ae3mfh9kdtAGWWhJo6tsbhXL7jJ5d05g8gDG
   A==;
X-CSE-ConnectionGUID: POEpYvOJQU2e3WMZKU5fVg==
X-CSE-MsgGUID: XaMj03hLSWW8teFeqzcU0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63791392"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="63791392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:56:35 -0700
X-CSE-ConnectionGUID: bvMwJf3yQG2ockNtmlHZpQ==
X-CSE-MsgGUID: PPZFNH2QSdKEBPZIQOq4Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="131518674"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:56:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 09:56:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 09:56:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 09:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ianKPERKgIvdaT5xKWj1Jrf0hlzKul9E2fSk87Zl3dtvBq8kTobDLdAFZUcBsWJI692ds7zeZ7PhdiN9PV0RG4VoIUTgQRJCGQHrU6xji9/cAniziiLrD/lqVCgbHQNZF8M9G5gRm7FmB4aZQTUQXUbDWH0jjc1i2X4nTPPqtCY1m+ac5I0heY+DmBxMrOEOPRUsyvYfhxT1ecU11WQedTe3uNxtG0P1d/HTZudsuSnmZPYqNBUgbcqp3FaRzYMQOQS/h4Nee9/5g4pw1t/cWJRXzkCUBfIlOi5gDigk4dRYBCDjcUk8uFogVZc2rxMguzzrJwYQpkQhEgUs1pMA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgxxyzMyqgUaMGKs61c1cRo0luk0WPQJqJtEzMs/dR4=;
 b=tV5GmgJi8nz6YQPC3jnTfpS0gPTa/O2VsM3j/hC9T6QsDLSHQpEO40/C7LiK7ncoIjJGk7FNKkk60KPN7swlE2lbmyQdMR4Koons/cjwRMqiJNqlU+Gt8wFwgtWLqKNg52ypnbAD6HD8v2USJatTZpTMOJdLz9g1tdme7Qi0dtGPQC7ISSsqsrgH+Zk4hsjifiyFk9/J20ysv/nffifdPcyFSp26d3+Dpa9jsxzZ5dLZ+xtTAhS/pnoZHRZcqCF5x2+J+03RaVR3rTOaGIveXZ8FYh3DwQz7HgY28dGRVVTLg8O0H9G1K3yqODLhaRhq/rG4hUKDIx5nv7urlvHkow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.35; Wed, 16 Apr 2025 16:56:02 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 16:56:02 +0000
Message-ID: <b68cf16c-6dfc-4da0-9143-ed47be1faad7@intel.com>
Date: Wed, 16 Apr 2025 09:56:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] x86/fpu: APX enablement and assorted FPU code
 improvements
To: Ingo Molnar <mingo@kernel.org>
CC: <mingo@redhat.com>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<tglx@linutronix.de>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
 <Z_9lNentUMOy5vZW@gmail.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <Z_9lNentUMOy5vZW@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e78f29-f672-4f4a-fb6d-08dd7d0791be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUdhZ3ZadnpjVHE5VExlVE9iQVdXcWlDS1NsK29RUFFIaTVSM0VzdG9FM2Mw?=
 =?utf-8?B?ODJTZTJ3VSszdXh1NWhsdXJJdmVVdWR1alM3VlRGUnRqdlpGMXZsdGZUZ1lm?=
 =?utf-8?B?SkVuWlp5KzIwalpBMFk2WnI3bjVGSkc0Uk8rSkFrYmRndFE4ejN4UFliV2dT?=
 =?utf-8?B?K0Iwdjg5eVhZdHRISmJhbU5aeTVuZ3RiRDFySEtvYTVZUGp6cGVlcUpNVkdN?=
 =?utf-8?B?cUp0RVV3ODNxNXNiME5Ya2p2REdOUVN4aDRYVTI1YlY2aVIyMVc0OHpZS3B5?=
 =?utf-8?B?QnpzK3ZJRHVRdDFLbW50eEpObnFxZUw2NFFyZXgxckFSUGJEVk9ta1hvQTlx?=
 =?utf-8?B?OHJVUk43Wk9HTVovOVh2MDdlc0pIVmFLemRMQy9LNkhTb0N5VSt5USt3THk0?=
 =?utf-8?B?ZU9ETEpMcXZyTDJ0TWlvZ1o3SUxLMGJ1YWVsVndCY3hQTUlXMGhMeThEU3VN?=
 =?utf-8?B?eEZaQ2Q0UmJnUmhJWmc1QkFmVXRzOGh1TW5yOC93ZCtZekxFVVluQ3kzUzdl?=
 =?utf-8?B?OTNDVEZwVXlOdk9XeWx6WXFHRUlJRmd2SmpBUHVHZGtDaW9QVWZOUERZZG1j?=
 =?utf-8?B?Wi90OFlRV2k1dkhyYmNIVDErSDVBVElITTBOR3c2eHE4VjM2NXhWSnE0Z0gx?=
 =?utf-8?B?R1VPWW95V1BCaHE4d2EyUE5BNlNRMVA1TitEMFBxcDlOSG9nQVpPVnlJOE5u?=
 =?utf-8?B?RU1YNm81R2FnVFlhM2p2Tm1Tb2dCNWN6d1R1cjBTdVhzQjBNaWZxVGVENENL?=
 =?utf-8?B?RjRyM083eWw3cUxNRjBnZXlDRXQza1AvNzJ3U0s3VFp6ekFub09kVWo2QU9r?=
 =?utf-8?B?cnFpMjY0QVlrZkh2anJFcHpqYVkycWpxbUR5aG1kYzRreEJwck1MVGJiZXZ4?=
 =?utf-8?B?K1pTaTRnWmlKdzU3WXJZaEVROXhMekxSc3lYNDlhb2pabzA1aFo5b29XbXJS?=
 =?utf-8?B?UWYwK0R5azhSN0RVZzdROWxaTU5pLzJ1NVpNWkFNdjlIK1Rjb3ZJL3NlZUFY?=
 =?utf-8?B?ekROMTFhTnFkazNjaDAwNE1pU2tER2lSNFU5M0Fqakw0d3NKQUhTU3cvOWV6?=
 =?utf-8?B?dk1adzdKWnFWTUh0WU9vMFhNUkh5T254cjZYNkJGOTByekt2VHNYR0ZJZXZw?=
 =?utf-8?B?eDhIMzV2QjZWZ2wwR3JVV1FLeWxERjFMN2JDM3VmV1dJdEJaUXVjaHhUQ3lB?=
 =?utf-8?B?Nkcvcm9rSlQySHpTMms2dktoY1BkTU9jRnRaWHpvK25WTnVCVk8wTkU3QzIy?=
 =?utf-8?B?bW53R1g1bVhLMnBzUExQYUd1Mng0MDlTYWt4TkxzcnI0MkxianNrcUdEU1Ns?=
 =?utf-8?B?a2NWbzNhMjM0NDFUb1ZhSnR3UGVnbGxFbWF4bzRBMG9DZ0dFTE0zTWx0NEtO?=
 =?utf-8?B?YWRxRWFMSkx1Qk5VWG93NGtVVzAxN1hyUGowdUpZek9sZ1hhOFpLbEx5d3dv?=
 =?utf-8?B?ZExpaWRLUURvTlBqZVBzUU5wdUZqcGw0eTNZdzNRbk5IUDBxTTZpWkV1cWl1?=
 =?utf-8?B?YjRiZnhpT1dwUFlNRk1hRTk3a2taZ2FZRE0rNGlzVDF1endJNkw5U1dVdllP?=
 =?utf-8?B?a2VCQTMxeUtJM29sWTNJdm1ESDJMRWRBYUN3UGw3ejJIOE51RmZuZU9SZUpR?=
 =?utf-8?B?cTZxV0hIUGJzUFlzZ1VjWEhuNkk2WXpvaHFnVUpVdXh0WnRuRGMzdExMODB1?=
 =?utf-8?B?amlRSFZsRVZJSVhlTzFLQnBEeENHV1d3VFFyUTNnb1ZLdWlGWjUyZjY4QTZR?=
 =?utf-8?B?RFdJSHo2MkNvWVZlSGNNUms2a01FdXZqTDlIcnRHOFVHRGMySmxqcUwyd245?=
 =?utf-8?B?dURuaVVmd0d0dFBxaXpuYVBzYWdKTFkxZDRqcGdJWHhOa1JPbWZvNFNUQnlF?=
 =?utf-8?B?aHRSOUNlQzl3NzRER1FNWFZUb3lPRS94Ylo3QWtaL2J4SWlxRVFzRXBVVC9a?=
 =?utf-8?Q?UDXp7vEDjjo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0dyNmJuNW0xTzN6cithMjYwVzd5eDhLR1ppYU9mOHcwamFtQnRhT290S3Fw?=
 =?utf-8?B?R0R3Mm1hWFpmMkJPcHE3SnZvT1V4bmVFTXRkdjIvYzlidk9mTXdQMHRaMDgv?=
 =?utf-8?B?QzlBRFZRT09QMkY5VXdGejFRdDlXQjEyYldrVG92QWFGZS9YQ2E4cGJBUExG?=
 =?utf-8?B?QXE3cm5NVWY3YWdraTdFWFN0RktWQ0dpV0U3bi9kY0pBa1owQ2EyU21RSXh1?=
 =?utf-8?B?aU1XQ25iZFdLUXhHWmNSKzNOMENlVHIxME4yNkdZZ3BNZjllYVlmd2dtQ053?=
 =?utf-8?B?ODk5aHVqd0QrVXNYVng4Y3hhTVBaZkV3V0oxb0I2dWxiMHNwQmRVNjBpMkcz?=
 =?utf-8?B?TWhrSXphbXFMU3dOTnVsOU1vSGpDOTFRd0ZUdU5TdVhVWlBPTk5DWFZSWTdy?=
 =?utf-8?B?ZXhydGgxVFNjZDdEK0Fvc0pwazljWklCTUZnMW4veW94UjVvYmVaZmlBQmht?=
 =?utf-8?B?Z2tCazZOYzFIWHBFaWErQkxQeVk4OXVGNGEyY04zWFNmQUVFMWlNaUdqV1d5?=
 =?utf-8?B?MVVjRC9JOU14Q1BGVWQ4WFUzMWxBZHBFR0FVQmFzREtLclhWMDY2RGlZK2Jp?=
 =?utf-8?B?bDFUMXJSK29seUhBdDJUK2N3bjN2eDhCblo4SVRwczQrR25PVkNXQThFbDlV?=
 =?utf-8?B?eE5SSGxtU2x4RU9VUXhjM24xcFRYQjJMcXI0aDNCSHpCNmwvUGtldnZOY281?=
 =?utf-8?B?QUhjd3MwNi9EUVZ0akJ2STVTYmF4UlBCZmp3L3hycThKdUNQWVF3SXpNS05U?=
 =?utf-8?B?SjZYT0M4WWd5Ulh5dGQvQWNpa3NpbUxtRGVZajhoUWJqNDR5OWNCVEVldlg1?=
 =?utf-8?B?T3JqdWxXeGVZR3VUeGJGL2RrUmpnQVZuT2hmdlFCUUxHSVRjODlncWRMdFpK?=
 =?utf-8?B?RkdBaS95bGI3cmRVdmpMejFKRXN1Q21yT0w4QlVxTDlyaEZ0Zk5RRkZaci9X?=
 =?utf-8?B?MkZacWUyQzE2Y0h2aTlHeFJwMkM2VGRSVHhuYVRMTG1jSXBPUzdjb2FjQkYx?=
 =?utf-8?B?ZktnTFNtZmZEWk9sdUNodFZHOEVVeGNEVnQ2ZkxxeUdvdStkZG5lV2ZhSFI4?=
 =?utf-8?B?YWxlMUZUYmtwbTdLZnNrUDVrUDJJbGQzQ1hLNmJibEJjVUJWZkVuOGx3N2lY?=
 =?utf-8?B?TGFzakFVN2ZsNlBHVk83WTJqbHVxU2NnbWJMN3EwaGRDWXRGeVV5b3FOTVhx?=
 =?utf-8?B?Vlhkd0RZbWxJNkVHNmplTExIVFVoMGN6cEhrRldnb1hvVkFOWDFQZHlISGpK?=
 =?utf-8?B?MU8ya2IzdkhoS050NU1VbUxKVnIyaHY0TjR3MUlQV1F4dmpYRnVjREZnRDV3?=
 =?utf-8?B?SVhuamVTUlh5ZEJyNUVWeVJNZkk0YVRoNkFFTmhDNGJTODdKT0RmaDdGZjNY?=
 =?utf-8?B?QThWc3VKS0hBMi9ySGo1OWF3dFNzSU5GUEY4MXIwSlFnRDdyUjFLY2I5cTNO?=
 =?utf-8?B?cGozUkxkdGFpTTc3ZGhSeVR6K0RhVmNUaHAwdVdSV1FYdTcraHdGVEhnb1Bm?=
 =?utf-8?B?cVRFaGR3THpmNHlONnRhQ3NWNkJXTVNIYlAybHdiK3YwYmVydEd3LzRYRHNl?=
 =?utf-8?B?OHJwam9YZnQvZElrTWtLNnI4MjJvZmZDNWo1aVA4UFdxVm1TaEZraXVOQ1BV?=
 =?utf-8?B?YitnL0RnbWZUcXhDVkI3U3VWVkVidVc1T25tK0VzbElvK1E3THZvcURLU3N4?=
 =?utf-8?B?d09SM2FoVEdqdnByZUdRZkJ3UjJySUhxVXBpNnNpV0M0Uk1rRFRIUlVEcnJK?=
 =?utf-8?B?QitrdHQxaVZ4KzU2WWpjRTdQT2R4aTR1RVNVOWRXaWFZenhuMWR0cldTQVZ5?=
 =?utf-8?B?ekFyYzcwMlluYzh4SFRvR1BTVm9LZkhNc3lBV1pVcjZmNmI1MG1rOWt6QzdD?=
 =?utf-8?B?WE5iTXRwWGZnY0VEbWtNL3NaZEhoNDJiQUUyQTBMaUZCQVdQcE5VNDFraU9q?=
 =?utf-8?B?VGhHNlExMXlQblNaQnFOZWZNaS96eS9SeDg0emJYTk9NQ2dpeForcWZkSGxl?=
 =?utf-8?B?WTlRcDFLWFBqYlVjTGZPWHE0Z0FMRmMxOVJldWZIR0R6WU8wSzRwQS9USDM0?=
 =?utf-8?B?OEVPdHk1QVRKNkxKaHZOeldMYzB2MHh3YVdJODFpb2dxYkRaYzdQZDlaZ0lX?=
 =?utf-8?B?S05ZYVhiRG12VmtaYmY1ZStzZjZab2lydzhqOURrWDJSQmh6RzJjOXpta205?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e78f29-f672-4f4a-fb6d-08dd7d0791be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:56:02.2288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHR5CPwND+WTvJtEWvgr7F6+ljsQ/7sl/itqqyJE5hAuFvTiI0ONL3VbLtkIA5uAkPJZM4fRuJokLq+qXWJv93Qd3Whq3BeTMA63LXfxRL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
X-OriginatorOrg: intel.com

On 4/16/2025 1:07 AM, Ingo Molnar wrote:
> 
>>   14 files changed, 69 insertions(+), 26 deletions(-)
> 
> Applied to tip:x86/fpu, thanks!
> 
> Note that I've merged the currently pending tip:x86/cpu bits into
> tip:x86/fpu before applying these patches, to resolve a conflict with
> <asm/cpufeatures.h>, and re-formatted the new X86_FEATURE_APX line to
> have the canonical format.

Appreciate!

Chang

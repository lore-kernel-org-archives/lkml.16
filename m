Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA49D4A04;
	Tue, 27 May 2025 23:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748389375; cv=fail; b=XqU8ejwLC9+NNvSuU+ukdWEwlTH6iR+D2+8w86M9JsxbZIVOS2Uoxfa1jYInToymXIje5gQXafn5FnT6/Lu5gSX1D+TnMo4U7urYT72S4GtQIZgCXDnXLeh/dIqlAxCyPwiEb4rHKrhyQimQPEy3tdV4K44Y74AjwUiOQB5ppv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748389375; c=relaxed/simple;
	bh=1lYiW56wrJebv07Se2rkG+fAR6pgTLkVDAtiJzzuYSo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gj+b7q03/r2GPmERgJG76cTsKnaodimSD4xEOWJ32nVLRO7fTaS5xT70RCf6DSQu8Yw4W5useHrJRK3RbPs8w3Ax8AvowuuOt81E6ymjir10pMZx396H2uyXs5FizJ3HSaJ9LQxvV9atJJDogb6bn6VO/lK5b51OsPGHw/mJl6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/i/3Z7V; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/i/3Z7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748389374; x=1779925374;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1lYiW56wrJebv07Se2rkG+fAR6pgTLkVDAtiJzzuYSo=;
  b=b/i/3Z7V6MzNM15uJhdXRwZv40FSOwzOzIORQilyGVu4Ttg0wPIQGx3I
   np3hTv8c7Z901ryZEatSufs0oWkkJGKCQ1fQSmZ07qWYoMGqmpCzPQkuL
   IV/GBF57JVWZa8sHnH+c1XGqlubUIX3Byn5ApG+7YSjUmcausv6JaL+zL
   EXxMhENqel7q93qWrOPLHgMdifIyxMYOxUwTGTHjZP/oiwcapuevOO6Im
   OopoaNEJmCRx5Us/zHez0b40ObXD0ROXF0mo/tjXBCg8f/bAppN1r/C3n
   U2zNYiFjSiTHs2GEeN+aPGdwk4SGTRMv9OdzK9KB5pg4aePSKXFzcouD9
   Q==;
X-CSE-ConnectionGUID: 11juu56dQXCvRoBuycn9kw==
X-CSE-MsgGUID: 3EAR7iS1QlibIaWqHXkqRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50284344"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50284344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 16:42:54 -0700
X-CSE-ConnectionGUID: /Dz1+zC7QyWILGALpb/yoQ==
X-CSE-MsgGUID: w5KYxDjGR52XVU9yeQVkEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="180241724"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 16:42:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 16:42:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 16:42:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.49)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 16:42:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gniGL0XPM6aUgkQydTCVtbXxOsL+qKSS0lmZCd4a+7rJ7PMzwOqy4Ya/wI/QKrCUlr34VHxvzQmXJat+x9WriOuBKOc+r3YmRbR/U31VKbONYmUh8ihAr9gl64LjZv/fh1+4XdBSBjMPfxq6XXiGXTsPfVX4hR2wvdNYDnXtaZhtchZAC760vzh/dpRLHdnU8YXhPbi5Vnf4q/ON3OvT9/vJFrUQvm9tuo3On8G6pl5wLajR0MQ7pdqQAlUffUPNibwi6YO/+Iiqk3ZDZIIILJPtw8uUlhDCRDg7h3Tu9Qb1Bc6ZbkekFYP2h8NMLo0XEzgAylqr97NEyoE3b09kDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqnv9Ukxz7Cpd7LZeOAMCvcJWHG0TItGct+Pj0BtEjE=;
 b=VFkAGWrJ1+Uwm/s/QjTtdh2073Gby3PRitanNWBGXX95BGINVokOwE/NdaJ2jbvIjkSHJqCXRM1oyyW7YpBoKt6gHJilTLP9/cecLAaK3o4tQQtOjbnUZbD9zE74nHs40mG3A66NKrzmnwBxvkPgxEteNuc+3WfKD2cyB3JZ+im/9gFW/hDJNa5qU3PPKYsKvSY0moxDMyB5P/5IYIE3+daknSjl+mF9qxh1dttILEl2GMWcpzXzxN2dZZjllOnJJJswhDiv1r7oVhMZWikSquA8uohyfveevcuDa1KUtEAiYV1BXxbrovN/OUcv2lYbY/I/o9T11hi4L6ilO5fPaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB8115.namprd11.prod.outlook.com (2603:10b6:8:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 27 May
 2025 23:42:48 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 23:42:48 +0000
Message-ID: <8e22044c-f36e-41d0-bf1b-311ac8758da3@intel.com>
Date: Tue, 27 May 2025 16:42:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/27] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
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
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <aef9947e5ed68feb0d33a2c882c140e2e472276f.1747349530.git.babu.moger@amd.com>
 <505f530c-810a-41a4-b3cf-7eb326bb6990@intel.com>
 <6cd9873c-1add-4d19-8d08-a7c3a514bfea@amd.com>
 <5f8b21c6-5166-46a6-be14-0c7c9bfb7cde@intel.com>
 <3c22ea8f-7467-4a25-b1b7-4f7f47177211@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <3c22ea8f-7467-4a25-b1b7-4f7f47177211@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: a4380a38-2b14-4e31-d465-08dd9d782fdc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm5IUE9MMTFpQXFBVjgrSC9DWHFLc1hhQWVFMUpnVmZFM2hMN0FWL0EwZkNT?=
 =?utf-8?B?VEZUTXAxdGZnc1BSek11V1c2L1VpQVV4Vm1BdDN5b0tDMzc5WTRXNllxNnZn?=
 =?utf-8?B?Z3R3WERxQzlZKzNhVWFLaHUxd25BLytxQ1B6WkJLZ1dyVzFFc2I0Z0RWaFB1?=
 =?utf-8?B?clZSWEtnZ2R4YnZpVUFmWjFZblhZRUl0dkJ1U09BdVBZSVo5VkV1ekxpVTBT?=
 =?utf-8?B?aGRoWCtmS3RsdEpqaFpmaHV3YlpUbmlydDRNTnFEa2VFNDN0WG9vZFR5NjRi?=
 =?utf-8?B?WG1TcjFEemJUaTVlVTZGWjJoT2xjT2g5M3dZNGQyK0w4ZWF6RlBDaXBOZW9z?=
 =?utf-8?B?R0xFNXkxV05oRzQrZ24zZW05ZmhTTEc5VnVCLy82K0xTZkd2d1BiQ0hFUGE0?=
 =?utf-8?B?NDVYMERzbC8vUFRBbUhZN0FrelQvb1YrZDUxRzJ6YmhjZWlhTTFoQjZBcjEy?=
 =?utf-8?B?eWJRVW8zbDZlK0Y5YjF4NlZLSDZLKzd4aHExNURZNXc1eUpndFZTdDloRjlm?=
 =?utf-8?B?WUtTWEZYSVZzMXVITG03T0VMalRMYWRnRnRGMTQ3b0FObjRRdjV4eU0wZzJT?=
 =?utf-8?B?SlRzS2hRRkVsU0dFM3h0VFlmRFZLUjRHY3J6QnByaWVSWS8yREhvT3JveUl3?=
 =?utf-8?B?KzJROFBjcGFwOHpQdlBMYlVBQW9MNERwVmJlZFdHay9hOER3VUlrdmZNdXlF?=
 =?utf-8?B?OHJ2UUpFUVlqR0xrNFk4cXBUSTJ0Z2Zkdnlwb3JnOTdqMUV6MW9xY3VXaFpX?=
 =?utf-8?B?bFBCeDA3MkNUZysxUmtRNndRVFFmUXF1L3liNXA3d1krTmphSGJzK0FDRXVI?=
 =?utf-8?B?Yi9qa2RBTWdhb0NJclBwb1RlUjlkSWIvd0puTGkzQ3dqRS9MaElMNWZqNlZh?=
 =?utf-8?B?UnJxNk51ODJEemdoK1V1UHYydFVqZkowYmpkdVZ3NThDd0p1QzdjVGd5b1JX?=
 =?utf-8?B?bUlkeHAzOWNqM0p1bElGTE5CZHd2UTFkSU5qM3pEZjd0VnNjL1NmcmRzeElj?=
 =?utf-8?B?WkwxMEhnbUs1c29DNlBTamp3V1FlS0craGZndUI4SjloZytFMGxlZ29pNkNI?=
 =?utf-8?B?eTRiZDE0Qm5yMmVLMkFibG9FRk5YVWl6MG9Cdnk3aTlKQk9OV3IvT2NqdHNU?=
 =?utf-8?B?Q0xwKzNNOUY4UVVsK2NDc1RnNHBPWTRVWHQzSmR5dEdab2prWHRSOGtMdmY3?=
 =?utf-8?B?QTB1T1V3SFdySXM4dHVvaGhad1JiclNvaVplU29XZFp4MU5UWkpqOXYwSVZS?=
 =?utf-8?B?ZEZhNHNHWncrQVFuVUFDeGtibzlJdk0rc01pNTNwWlhwTWlHYzlmaVQ2eHdp?=
 =?utf-8?B?VVVPTUtKaFpLbEY1OFVQVWdoUDJKOEhtNmJBWU00dWczeHh1SWxrSHRYYWp2?=
 =?utf-8?B?bUhsa2Fpd2E2MWpSbkRIcncySW9zMlpKUjB4Y3lzUmhVbUYvdzluSjV0clNh?=
 =?utf-8?B?VFoyWXU5MmFzQlFtY1d4b0kyaVd0SWJGR09ZT2tYdURFZTVYWHArNEJuSW93?=
 =?utf-8?B?NHBCTFdTcW0vQ0ZxRlB0VS9Ic0w2M1J0ZXB4SmpKelgzdkUyVGwrTEk0aXpa?=
 =?utf-8?B?Sldua1lpSDJTNjdEbGxxZWEvdnJJTkdVQm1RLy9xUWlFNVFlMW4xc3FpUTdG?=
 =?utf-8?B?Z3YvdlF3dUZxYTFkU3lDRHRIRlk3RFJGbU1PWmlUWFg0WStrNjBYcy9HZXVZ?=
 =?utf-8?B?dStZYWg2NXJueXFLMGlKa3Jtd1ExcDR4QzJIQmNYRDJPZUg1czE5dCtQbzVm?=
 =?utf-8?B?SVE1amtnalU3UUxjZ1lzbUJ5ZlRrcEhHL3lVTEdnWDJGaEQweTJ3YVhZZEtj?=
 =?utf-8?B?bnpKaDAvcVZsZW9EcmRtUE83cEs2UEZ4SjhWN2NmUzlkaGNmSk1RbWlidGlN?=
 =?utf-8?B?SVF6SkN5UjlIUW5LTVdRWTVnZzBCSC9QTTdFRGNXSGhVZ0U1L3dnVUtGTmxV?=
 =?utf-8?Q?aWi9t5IpFgU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RmaTNiVlZ6SFl4K1VzNGJaZ0ZZTHVWZG03b2VUVzEvQUxYWDIxK3FxSVR2?=
 =?utf-8?B?TktYOTRUa0hoeEM3L3RXR3l6OTV6K1JtSzFnZW1Bd2JLYlJ6VDVReng5Y1ZI?=
 =?utf-8?B?QjRnSlNSaGVFd2luTzQrZE1tYklHTEFoSlhwTnNPbnJTYkNmSEk3dkJzUWNR?=
 =?utf-8?B?K0p4OGFpOXlmQWM4endaUDNzWE4wUCszSy8xMkM4aGtLSWNGdkNka1BrU3RV?=
 =?utf-8?B?YTFyR3B4d2JRa0tMYitPeWFIbWN1UGNXbTRVbUNNbzlTMHUwM01wWWpQQ004?=
 =?utf-8?B?NTRXbk4xVjF3em5NU3BCTzFXd0tmcDdlbzNtQ1c1bStUNzVLVnhVdFpHTld1?=
 =?utf-8?B?RFBYcDhoVEYzdjRJaGswTCtic0o1QTVmNEJQVitLdC9GOXBmV0ROejJtM05k?=
 =?utf-8?B?ckdZanNXRjlqNjcwT1dlQmI4NWcwMDEwOU5nb0ZNciszSXlsNXhnRnExalg2?=
 =?utf-8?B?TmpUdXd3SzkwelBTMy83cVllczdBc3I3TDJ6VmZuSVQySGNkdEJlTE5vU2VZ?=
 =?utf-8?B?bjBwOFA4MEwxYzA4T1RzazdSbk84MU93VW1wSFQyQUQzdWduQ3J6cmV6VE5t?=
 =?utf-8?B?MU5XRUJmV09pWUFxaUJlTDI5OWg1QUI3ZmFaMDFoLzB6UHNuaTRNVUlsbWJ2?=
 =?utf-8?B?YmNheVp6SDBleFlpU081SlB6Z3crTEZUOWM1M2dUZFVXTXA5Rm8yK0pNdGtO?=
 =?utf-8?B?T1pyME4xWlA3YVB6VkJRa0xudGx2dFNIZ1RHM1BvOWpvQmxOZjF4bzg5Rkkx?=
 =?utf-8?B?SFdMQ3kzTkQ4OEFKQlBzOE9TK2hob2VLT2xZMUxoMldjUGlqTHRvMDNKMm1t?=
 =?utf-8?B?MHBrRkowUUNyYUs0U3F1M1JNbkhwT1lIclhmUUdPNWtHVWl3VjVlbndrZXRp?=
 =?utf-8?B?emVVNGM2eDZSWWZMc1lPTU5qVXUvMG9WdS9IZ2VJNmJUcEZ5MXZFcm5YcGlO?=
 =?utf-8?B?eHNRNGxzbHVDdUhzdjhXaEFUSk5rV0YwaDhFWmJ6dmpCMW1ZTlZHc3R2R1Iz?=
 =?utf-8?B?YzB4L1RvL3g5NTRsV0dpKzhWb1pBY2tNTUhjT1QxSlREbmlNczI5MkY0cjB5?=
 =?utf-8?B?dzF2WUk1cW55RVUyb3NGUzRVaTloNTArd0RXM09oMkQ1cHZhQWs1R3poYlQ0?=
 =?utf-8?B?MHNhNGNGdGZFVU5tL0RMYW9LR0NWcU4rZHZOQkN3V0hzQ1BaSm5RdFRqVTVQ?=
 =?utf-8?B?WUpmMlJNZUhSYWdvWVkvYzBRWEtpUFkyaFlLZ2hFbWxwZzcwWlMrS1gyMWdZ?=
 =?utf-8?B?TncrYlpiaW9zMUdveXA0amg5TEowN1liWElycWZsMWgwYVR5SVd6bHpQNXNp?=
 =?utf-8?B?b2wyb25HaU5UandvTTZ4cXVBL1RuY3FKeTVmdWkyYjZLTUtnUzZPN2QwbkZ1?=
 =?utf-8?B?UjQvWHpiaFI1L2FHcE5HZENsWExBUllzVXdvMnY5T00yNm9WYUdsNjJRRDhO?=
 =?utf-8?B?NWI2eHZRMHZOWG1FQzFtaTZaTDF4M0kzMXMxU0M1WGhUbmdjamZmeDFLWGV4?=
 =?utf-8?B?WXdSRXg2UEFBNDdiMWJpNUpDYTdXUWpRR2NndHUxZ3BBSE1xUHB0OUg2ZTJE?=
 =?utf-8?B?YUQ5VUxsTFZxZ0d3MkdaNjlTdjgrNlZnd21rUkFDT2NFaUdNTHVQNHdqYm5o?=
 =?utf-8?B?aVRHb3l2RkhPWGJlQi9lV0NOM1V3TE1NOEVKZFNacUpYb2dlaDNLczZza1VI?=
 =?utf-8?B?UDA2aWhRcG5FRS9CMGFQZXBhbW5YcXZ4Zy9UVll5SVZNSnpySitzMkhwZDFH?=
 =?utf-8?B?SFNHeDJIamhoTEIycnhaOXFMK3NHZVBNdDRheVB6eDJkNkFiejFWNjNQbG82?=
 =?utf-8?B?RHJVbE83V2M0dzNmUS9JamhuRVpFTVhrRm5qQmNBaC8zMEdaK1pTT29VRjhI?=
 =?utf-8?B?emRMZTRlbWRJZ1U1L3dkV1hDR2R3cUlWbUpMb3lGRG1aUlhaK1NzRlFKRng4?=
 =?utf-8?B?b0F0V1hHakFka1ZCallGbWgrQ3VmRTZVWXVZYkV3UTlpdlRBa3NOTCtwS3lM?=
 =?utf-8?B?TUYzQm9vVmRiaVNKZFV2ZWtsYmw3MHhSZkVnaWt1QWtQcDRQOVlaMlNzeElF?=
 =?utf-8?B?Zk5FU3dBanJnYmdoSXc1TnN6TlNUaUtyN09kR1FSb25nTEFmRTNUM3hXVTdu?=
 =?utf-8?B?WGJRRVBNY1ozbFFlZ3YrS2tRbis3N3JmZUc2Q2tjRGx1Kzk5K0hEeldCcnph?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4380a38-2b14-4e31-d465-08dd9d782fdc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 23:42:48.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfw1ntoX/BPaa8W13G2AXsWxGXMv3QWbmh2vqc1BUMjdmhMFf3gI1nsmr6NAUsj9zIA4ZuM8zMALpwxjsn82NAVl2S+8rlZuwi8CpfMAoik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8115
X-OriginatorOrg: intel.com

Hi Babu,

On 5/27/25 11:40 AM, Moger, Babu wrote:
> On 5/27/25 12:54, Reinette Chatre wrote:
>> On 5/27/25 10:23 AM, Moger, Babu wrote:
>>> On 5/22/25 15:51, Reinette Chatre wrote:
>>>> On 5/15/25 3:51 PM, Babu Moger wrote:
>>
>>>>> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
>>>>> index a2fbea0be535..2f54831e04e5 100644
>>>>> --- a/arch/x86/kernel/cpu/cpuid-deps.c
>>>>> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
>>>>> @@ -71,6 +71,8 @@ static const struct cpuid_dep cpuid_deps[] = {
>>>>>  	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
>>>>>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
>>>>>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
>>>>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_TOTAL   },
>>>>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_LOCAL   },
>>>>
>>>> Is this dependency still accurate now that the implementation switched to the 
>>>> "extended event ID" variant of ABMC that no longer uses the event IDs associated
>>>> with X86_FEATURE_CQM_MBM_TOTAL and X86_FEATURE_CQM_MBM_LOCAL?
>>>
>>> That's a good question. Unfortunately, we may need to retain this
>>> dependency for now, as a significant portion of the code relies on
>>> functions like resctrl_is_mbm_event(), resctrl_is_mbm_enabled(),
>>> resctrl_arch_is_mbm_total_enabled(), and others.
>>>
>>
>> Avoiding needing to change code is not a valid reason. 
>>
>> I think that without this dependency the code will
>> still rely on "functions like resctrl_is_mbm_event(),
>> resctrl_is_mbm_enabled(), resctrl_arch_is_mbm_total_enabled(),
>> and others." though.
>>
>> The core shift is to stop thinking about QOS_L3_MBM_TOTAL_EVENT_ID
>> to mean the same as X86_FEATURE_CQM_MBM_TOTAL, similarly to stop
>> thinking about QOS_L3_MBM_LOCAL_EVENT_ID to mean the same as
>> X86_FEATURE_CQM_MBM_LOCAL.
> 
> oh. ok.
> 
>>
>> I expected that for backwards compatibility ABMC will start by
>> enabling QOS_L3_MBM_TOTAL_EVENT_ID and QOS_L3_MBM_LOCAL_EVENT_ID 
>> as part of its initialization, configuring them with the current
>> defaults for which memory transactions are expected to be monitored
>> by each. With these events enabled the existing flows using, for
>> example, resctrl_is_mbm_event(), will continue to work as expected, no?
> 
> Yes. It will work as it uses event id.
>>
>> This would require more familiarity with L3 monitoring enumeration
>> on AMD since it will still be required to determine the number of
>> RMIDs etc. but if ABMC does not actually depend on these CQM features
>> then the current enumeration would need to be re-worked anyway.
> 
> Are you suggesting to remove the dependency and rework ABMC enumeration in
> get_rdt_mon_resources()?
> 

If you have an alternative proposal that would accurately reflect the ABMC
and existing L3 MON features then we can surely consider it.

Reinette

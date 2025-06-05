Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B097420ADE6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129199; cv=fail; b=jjH91v4L19ACmFaBsda1m+NazzlALn41NACSnWjN54FQM0HdR9sdgWnTJQAxTT37BHMYAe/g1tzF8YwtE2cIofgU4GlV/duPzGx/ftT9xE1U+B+mc7S9Rx0cqI6Y5kxg/dUm8g2n5Cmk5G8QbidCe1REVHuaq5D8G571QhS+7Zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129199; c=relaxed/simple;
	bh=USvP5tIDkZ846cl68nqPaBoB9yMZWwxN9kxWgz0/9Rw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iN3sO55u+pcuPspGZ4vTvSXekTLYM4VLi9baZrLnVXQ3m3zvHu91Xn6n2Khz0amA2d2JkjDMajBhFc2C7vrKeCZ54D4VjFnGa+NBCKCWBNu8Fii+B2mTiq/a5m8j/YTppd+fk0i6vb96u/DzZ9yz09uC8DThpSxZCWAYZ7D9Pgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1aBa8+J; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1aBa8+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749129198; x=1780665198;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=USvP5tIDkZ846cl68nqPaBoB9yMZWwxN9kxWgz0/9Rw=;
  b=i1aBa8+JHq1+9tSav7uwKrD59QkySFArdX+ohiqaE7f/4e0nc2EQfP8J
   YJxV3r++oKpVNG85vKTdXD7jitjIHxkL93un2TAszx2fPQX/k8DidDi8D
   zSuJtX5znaxfgG0bGrKk3VM2JqmACD0zBomHmIbYIlMUHOn2ixFyUbhHU
   8LgwV8xn8tlRuZPpTUU0kawbePsUm+GzYXg8hb93q05eNcJXEBA2JGre9
   XDtbJtscE6larMESG380+7YLYvE81IGDNFkxnapH2CXGk71Lc3ohXjX/+
   A8kurvv98gMdfaMON/ScVLqEVAGxa2VEumuKceR2hGC8njxBR1PF9k3hS
   A==;
X-CSE-ConnectionGUID: Rsrnbs+ySFGlc3LP70jHxA==
X-CSE-MsgGUID: xIUChtkhR1Ocpk9/OSmGSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68801647"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="68801647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 06:13:13 -0700
X-CSE-ConnectionGUID: 5DFIJ14JRjuFMGPjRuQLog==
X-CSE-MsgGUID: AqURCbWfTxi/IDl69lt70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="145464115"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 06:13:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 06:13:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 06:13:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.58)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 06:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgL6rb2kAdlzdk4QhGrNCE+K4JElaiAfi0Z998JYWsGc+p8eEgalMl4H7Sf5PjutgD5hc2JR+MIRSgE16uuQODvofjhUcHfIyheqT/5gXDwXjCMhAkxb8ULnIXZB/3f9Cm+nQUBEI3CUkCgzjSYPMxZDaM4mwQ1k6dFMKb+VTCaU3BwsVOTUMpPwwfDsuj3sUk+7gXa2LiYX82oi2VrlItl+/aIlXp5/gONHLLtIiQCLphuF5eu+mu+xwahop/FZ1oZekH6boAddr4tnZcTqClztZPo23v6oJbFOyqJ/sjY89YcBwiJ2j+yGyGMEu44O4C1u+UV2OCDGf7sy1XK4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USvP5tIDkZ846cl68nqPaBoB9yMZWwxN9kxWgz0/9Rw=;
 b=T3GNqeaxtEfVRxW1a4vTw/hMgKdHJ3VWh05bqS8NOeZRN7UxnziaWKhn6qkwdYI11JceBZxOb1KFhNrSsEeHl1x8w7I7whdtmDRv1mGkgRX5lN+9J9aehv1CzF3kqP1+m9zbLbiugUL9UkVvwN3FHhoo7BxjDpwh36smdm7mWWI3T9ZyB2XwqD9iHoa91JNP5fHbz+ZZM3jpcIolaXmAcRcx64tPplnPMKiIKlWywBTD4GfB4BLiyYqfLMcVMNezBsRqGQVjPoEmmSYZalUPbVwL9qfUI17B/JxInDjI1n041B1J2WiTW0CUfEUR8Dz6mqMnPwn4X5JcNPuF314nFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MN0PR11MB6058.namprd11.prod.outlook.com (2603:10b6:208:376::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 13:12:39 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 13:12:39 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"hpa@zytor.com" <hpa@zytor.com>
CC: "samitolvanen@google.com" <samitolvanen@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Thread-Topic: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Thread-Index: AQHb1OklVaYPTytbT0efy84CnI49T7PzaN0AgAEkUoA=
Date: Thu, 5 Jun 2025 13:12:39 +0000
Message-ID: <e9e6e0c1e99c00022c96d2832c7c4e6342dd39c2.camel@intel.com>
References: <20250604003848.13154-1-kai.huang@intel.com>
	 <55e5b3f8-3e17-4962-af2f-75c98ccd414f@intel.com>
In-Reply-To: <55e5b3f8-3e17-4962-af2f-75c98ccd414f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MN0PR11MB6058:EE_
x-ms-office365-filtering-correlation-id: 3d93ae2e-5a8b-48f7-8f88-08dda432a5f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S3RHTkcrYTd2SWozME1zQzF6bHRhd3BudmJNaDFuYzhhdVhHS0pKMG5NQUhB?=
 =?utf-8?B?ZUVsQUdsd0Z1cGN6dGlUU2tvVlRaalRZWmtPZWZvT3hUTnRFZnJEbTRmcG4w?=
 =?utf-8?B?NXQ5MEc0Vnk0RDcrQ2NSaTJQQnhTdS84TVkwRXNlREU0STV5ZFJrYVVVUDhU?=
 =?utf-8?B?SVk5SmxRS1NBb0RsR3FGYTRDdlZFREZjVUFIWjZLRHBkeEd6Q2RrSi9Cdnk1?=
 =?utf-8?B?ME10djhPR3g0RmxZaVpPbEEvdjYrbjM3L1VZRW42NEpMVjY4TDRtVWNhTkd5?=
 =?utf-8?B?eWx2YmlrNldsMjBMcjk3N0hONE1hTmF1Q2tNaURlcDBybUZDM3pxTnJTVHhw?=
 =?utf-8?B?cDJVblBCck9yanFVT0p5eGhTZ0tEbTlBczVVK2RDa25VL0lQRFhJTG9TT20w?=
 =?utf-8?B?Z1lGQkVXWXhiK1FJRnpEVk1UZVg4ckphUTl0Sm1vNkxrcy9iWW9EVHFka2h3?=
 =?utf-8?B?YW45N1cvWDZwc2ljRUsxNU1XUjI3V3Z2WGg1T1gzVkc4OHUvQ1NCbHJodkVB?=
 =?utf-8?B?VWJhMW52VUhuWmFZTnRCVUdyU1poR1FOVFYrUmE1YmNmdzVabkJBc2I4Y0VO?=
 =?utf-8?B?STVPWFRjTEtUd1ozMnpQNGVJcTZtd3NuZU9ZZmJIaHpMSlU5RjR6cGE1dGFm?=
 =?utf-8?B?S0ZRVlpCMUJDdGNEMGV4TU15SkhTSzJwMGpnZWkxNTcvdjZ2UzVkZTJ3eW1J?=
 =?utf-8?B?UmtlbGoxdU1BUkRkT0tacGVZd2ppR3NCeVRMZVM1dVk4L1NkM0pJZndWOC9q?=
 =?utf-8?B?a0U3aTJtT3RiZHEvM1hYYURydFZMUjQwWlAwWVFkRnFPRUJxQWVpUkpNSVBw?=
 =?utf-8?B?WHhRUWp1V0dBcndJS1F6OHZ1SWZuRXczK1Qvb1JWTTI5OHJWWVZ4M1F6WUoy?=
 =?utf-8?B?TzM3bndSY1Q2aGVTZ1FPclZpUFZldGhBVm11Ull4VWFXSFcvbnhycnc4MFRL?=
 =?utf-8?B?RFVMT0UwUzBuR2NZNVpqbXYvVEtTNGZ0T1grZUxPYWxTMFFJOFFtQkpLeFhs?=
 =?utf-8?B?WEF3ZkhSeWJLdlRhLzBWeGh3VUFzSnhmd1lwaG9BUDM3MWQ1TFRwMWQyTU1P?=
 =?utf-8?B?S3g2TnNYbTd0N2FKTGZmWG5za2xURFhNaHN1MWtYRXZsOGtNZlFmRTZYbGZl?=
 =?utf-8?B?OE5UNjUremJvNWMrak4zLzZyNk5mNk1ta3J4ZHphQnd1U25MQ0xLQmNVTjJm?=
 =?utf-8?B?MG44MWVTdGlVZVBodnQyTFM1OHNoYnlVd045dittMUZhV09WWUxZUzhleGdZ?=
 =?utf-8?B?NVBEdWZKaExTZUUxSVRRenBpWW1McE5hVjNSTjhseWlCTHdoSHJDVTZTa2g0?=
 =?utf-8?B?ZmQ4UUdRcC94dXdVK1lyRTMvUGFjazhIS0tGMkV3QkNzWkdWT0NmRUlFdnc3?=
 =?utf-8?B?cjB4WHJrSnBoSUVtaXJtQjg2aU1WYWRCNEpjSWtINThDVS9yUERBanZBUUZj?=
 =?utf-8?B?Z09QOWVIQTZWaEFBUW9wVEJLYkY2dHpCZ1lWNkUwdE5qMTBPbU03M041dEhx?=
 =?utf-8?B?Ym5McGVxaitXSnoxRUpWZ2V2UktVY21TbjFOVW84TG9MVUZPU2R5THFkb2V2?=
 =?utf-8?B?Z1V3Y3JBNkMvVlh1dGtueW96Y0haVmhrcko1U1pOdVlEbjNTSGJhbzQ4RkVn?=
 =?utf-8?B?USszMGQ2VkdPejFIZFhMczVMRmdoNjFIczhLMlY5c1NyTW5reDRRMDBYOWlX?=
 =?utf-8?B?ZUtlUEdaaHV5QVpYci9VdENjZzFFVmwrYWVBOUV0T0I4TTdWWXJKQ09tbWVO?=
 =?utf-8?B?eERwTlVLQWl2UmI2R0N0L05GdGlhMTlUdHRLZW5YOWZPRWF4T2d6elJzWFB3?=
 =?utf-8?B?TFlOVjNYTXUzU0UvOFhwcGg3cGFoNElIMXBKNmJPeEgxSzVDMWQxdElVTHZS?=
 =?utf-8?B?UUJmSFFQYllSejJSOU1NK2NsL05oQmR6YW8rdFlOOGdwdjhOZVJ6K0wzUmJ5?=
 =?utf-8?B?SDlBSTVFYVdQVm15TFMrdFpmL0RCOFV5aWhJdzZIaC9TVG1kSis2c0hLNXlY?=
 =?utf-8?Q?KX6bx4w0r9UE4S1EQQCMoUJe1EJcGA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y21PbGFCbnovOG1OOC9NTTRTVWNLMmkrc1ZvQU5TbnZiODJ2YU9XazAyVmxh?=
 =?utf-8?B?U1ZJNXNYa1ZnZ2ZNaEltSndSUllOVHVwYzFCaTd1STdtMVBOVXl5TVZvQTlZ?=
 =?utf-8?B?bEJ4Y3g1ZlpiR3VRQ0t5c2tiZnQwQXJobFhEWlc0SnkwVUxNSFF4S055aElw?=
 =?utf-8?B?eUpzRThMTms5SHNnR1ZHSERONjRZVGVJcEFmWDQxUFJtZjVBZGQycWFoekts?=
 =?utf-8?B?WW0yblhrNzVaVk9ObFljanBab2V4TXp3R1pVS0tnUHlVeWIzd2R6WlBPU2cw?=
 =?utf-8?B?bGtFODhmRDdYMnJhYmM1d3VDOFNjVW5yTERUNGVCMS9xYXA0c0p2R3p2QVlZ?=
 =?utf-8?B?UStJaFlhZGxQUnk0VlBwV3NrSStKU2VjSi94K3l3VVNIOWdoOWJBMTVtK21C?=
 =?utf-8?B?MEhBVnhsZ2lOc2xQTWFOcUh2OGNrWXhjNE16U3dBL1JJdHRUVUFobWV6dExr?=
 =?utf-8?B?alJLdExmdkdVNWhXNXpQcGtvd3MwMVNzRFI3ZGxaMkNMMlRGUGhUaGxMTWx2?=
 =?utf-8?B?aW1GOGdaTFBOZkI0SVI0UEN6SlJXeHZDM2RVOWFwVlIyWTJ2TElHdjZjaU5h?=
 =?utf-8?B?SkJUUXVqM0NvSkIwOTQrdUJoV0pLdCtmSDRxS05Ob1JrUEMyOFVHVHBNcklt?=
 =?utf-8?B?RW5Nc1JXZ2cwQVdTRjdMd1RxSHhFcEZ1M2djWitiN1AwaHQ1Ky80cnkxTnNz?=
 =?utf-8?B?TzlhVzNXV0QrbjJHbUhPZFRFaFNpK0V1VlloUStNeEpXOEE2SWhNTXAvN25T?=
 =?utf-8?B?cS9WVVpKVWgxWStHR21mUU9RRW5hU0dmV3ZORFVCZmh0RzBMTTAweEZGZEw2?=
 =?utf-8?B?NnVoYzE3N2kxM2t2MWsyeXg4azVlbjRXQlMyUDJpQ2VmYmlsY2Jxd09qS3l2?=
 =?utf-8?B?ZXhrdzVPMVhvMTFCZkxJbkZKN25CQk40ZTlqM2pqMWt1YnRBWTNaVmZMQVVm?=
 =?utf-8?B?cDQ3SEFmQjBZend4TkdJMnU5a2FkNVVFRWZ1eG9GOVlYek9mWFdQV0QrcEh5?=
 =?utf-8?B?U1M3R0I0K3ZHT2xoUEtENSt6MldPQXcwWFZYZGd0UUo4TUVxdUlpcTFCMmZy?=
 =?utf-8?B?MzN6d3lJNHh1eE10OG9tbUR0ZE9Tell0NEdJR1lxbWpjNTRXUDVRZ09FYXdt?=
 =?utf-8?B?aDJya1BvOFhUSXpyd09wMXFXV0pJU0RzTU1mMTNEeUdTOEZLRGdxQnhBVUxl?=
 =?utf-8?B?UUNLUDdTWlh6R3pTRFc2ekRDTGVkQy8zUkZRVk00clBpMnBXbklIUWpXMEt6?=
 =?utf-8?B?NXRhZ2xNdlEyRFUySW5FZUZ1Z1Y2TGsxamxyS1AzWG1RVWpLKzE2bmFLZXh3?=
 =?utf-8?B?aUNJcGhyQmtWZzRzNG5aMDZDQ3VORjJWMmpRa1JHYUEwUTBPa0UrQTBkM09D?=
 =?utf-8?B?Y3Q2TUF2Z3lnTGJqOGVEK3oxczdHeGY0VlZNQ0cwY2Fjd25HTDdSRVhKZUNC?=
 =?utf-8?B?TU9vVStORDFEYWZoNm16VEt0N2lRM3R3M1hBbGhOM2hwRGduL1VyNUdLV2Zv?=
 =?utf-8?B?YU9aQ1A4azU4VnExWUNPWVV1OVJQOGh4UHIxcDJlelVwTTFpYkZ5S2s4WWdM?=
 =?utf-8?B?b01LRFA0cW0vbFhmVnpFWTVrOUZBUEV6d1FUeElEVVV3SzRkbHZTUEtFSEdV?=
 =?utf-8?B?Y1BWNmFITXMwckI5Ni92VUFIL2lySDZsV0YxMWhSY201LysxT0VmTmY2NVl6?=
 =?utf-8?B?UkxFUFFZZmhQeXQrM2d3ZGl1WE9qYmNVT0lLQzZJTlN1Zy9ZSUhSdDRvS2ZW?=
 =?utf-8?B?TzlxTWdCOE9iR2svNWZxdkh6Z0dCUVA1Vi8rRXlvY0JsK0ZNeVJWUEpCMTY0?=
 =?utf-8?B?d3k5NG85aXVXM2hUc29Pd1dBUUM2OHhHYlA0RmhXVzFhQWhzYUFScEN0czZJ?=
 =?utf-8?B?UFA4OU1JWW5FdEFCNzBCWUk3aDhnZlMrb0Y3SWhEcFZ4OEhGcUtublJIWkNp?=
 =?utf-8?B?ZjFoQURjMWZ5V0c3VllOV3Rnc0UrNy9ZbzA3NnN4WjM2a3ZWbS9NQWV5Mi9z?=
 =?utf-8?B?aDlkS3ExUWZrSnp5L2lCRjJVblN0ZXRWQ1lvcXdmSG1TTVBjS1VjTjB1cVZw?=
 =?utf-8?B?aDlEZ2w5NlNyNzEvUGw4UUc3aklLN3krdE1zeFova1VsbWlsWVkrV1U0Q0NF?=
 =?utf-8?Q?yEGUUJ5i7Y6LFl/5/Ba1B8/q3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84F8792437615545AC4FA9587EF447AB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d93ae2e-5a8b-48f7-8f88-08dda432a5f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 13:12:39.6060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAY0IuEd727hMq4egCiLkWsgfKjeXkzw70a9UIC7Uk1cGOrKxPHkIdG+alcDfWwUobQzyXvsePxq7hS3SXGD0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6058
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDEyOjQ2IC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
Q2lyY2xpbmcgYmFjayBhcm91bmQgbm93IHRoYXQgSSd2ZSBkaXZpbmVkIG91dCB3aGF0IGlzIGhh
cHBlbmluZyBoZXJlLi4uDQo+IElzIHRoaXMgZXZlbiByZWFsbHkgYWJvdXQgRU5EQlIgYXQgYWxs
PyBJIHRob3VnaHQgdGhhdCBjbGFuZyBoYXMgc29tZQ0KPiBDRkkgY2hlY2tpbmcgdGhhdCdzIGNv
bXBsZXRlbHkgaW5kZXBlbmRlbnQgZnJvbSBDRVQvSUJUIGFuZCB0aHVzIEVOREJSLg0KPiBXb3Vs
ZG4ndCB0aGlzIGFsc28gYnJlYWsgd2l0aCB0aGF0Pw0KDQpIaSBEYXZlLA0KDQpXaXRoIHlvdXIg
cmVtaW5kZXIgb24gY2xhbmcgYW5kIENGSSwgSSBkaWQgbW9yZSB0ZXN0IG9uIHRoaXMgcGF0Y2gs
IGFuZA0KdW5mb3J0dW5hdGVseSBJIGZvdW5kIGJ1aWxkaW5nIHdpdGggY2xhbmcgYW5kIENPTkZJ
R19DRklfQ0xBTkc9eSBnZW5lcmF0ZXMNCmJlbG93IGJ1aWxkIGVycm9yOg0KDQogIGxkLmxsZDog
ZXJyb3I6IHVuZGVmaW5lZCBzeW1ib2w6IF9fa2NmaV90eXBlaWRfX19zZWFtY2FsbF9zYXZlZF9y
ZXQNCiAgPj4+IHJlZmVyZW5jZWQgYnkgdXNlcmNvcHlfNjQuYw0KICA+Pj4gICAgICAgICAgICAg
ICB2bWxpbnV4Lm86KF9fY2ZpX19fc2VhbWNhbGxfc2F2ZWRfcmV0KQ0KDQpJdCBpcyBiZWNhdXNl
IGN1cnJlbnRseSBfX3NlYWFtY2FsbF9zYXZlZF9yZXQoKSBpcyBvbmx5IGNhbGxlZCBhbmQgaXMN
CmRpcmVjdGx5IGNhbGxlZCBieSB0ZGhfdnBfZW50ZXIoKSwgYnV0IG5vdCB2aWEgc2NfcmV0cnko
KS4NCg0KTWFraW5nIHRkaF92cF9lbnRlcigpIGNhbGwgX19zZWFtY2FsbF9zYXZlZF9yZXQoKSB2
aWEgc2NfcmV0cnkoKSBmaXhlcw0KdGhlIGVycm9yLCBidXQgSSBhbSBub3Qgc3VyZSBpdCdzIGEg
Z29vZCBpZGVhIHNpbmNlIHRkaF92cF9lbnRlcigpIGlzIGluDQpwZXJmb3JtYW5jZSBjcml0aWNh
bCBwYXRoIChhbHRob3VnaCB0aGUgYWRkaXRpb25hbCBjb3N0IG9mIHNjX3JldHJ5KCkgaXMNCm1p
bm9yIGNvbXBhcmluZyB0byB0aGUgU0VBTUNBTEwgaXRzZWxmKS4NCg0KSSB0aGluayB3ZSBjYW4g
a2VlcCB1c2luZyBTWU1fRlVOQ19TVEFSVCBmb3IgX19zZWFtY2FsbF9zYXZlZF9yZXQoKSBidXQg
b25seQ0KY2hhbmdlIHRvIHVzaW5nIFNZTV9UWVBFRF9GVU5DX1NUQVJUIGZvciB0aGUgb3RoZXIg
dHdvLg0KDQpJJ3ZlIHNlbnQgb3V0IHYyIGJhc2VkIG9uIGFib3ZlIGJ5IHJlcGx5aW5nIHRvIHRo
aXMgdjEgcGF0Y2guICBBcHByZWNpYXRlIGlmDQp5b3UgY2FuIHJldmlldy4gIFRoYW5rcyBmb3Ig
eW91ciB0aW1lLg0K

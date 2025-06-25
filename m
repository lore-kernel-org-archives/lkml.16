Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905711F8755;
	Wed, 25 Jun 2025 23:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750894838; cv=fail; b=aiWLrDISzjOY8PCOUoXQWYhRdTskOPkmKfklPPiqcMNTArtXCFHzoCJGuFVo9x1OE40SThaO/wVGqSMEhfk6HJWzvr50pYr/BXMMEK/ASdBlwqnynkZsQdF4D2LJSQXEiWz4KLoTNyu4iPojfzH6pFx4GbVrzT8YJLr3r+Btg+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750894838; c=relaxed/simple;
	bh=3O3pwK60G1CB3pnW+LnCrN1jwJnsR98enc2GP5g/ue4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QK0W7gcTDoNx9Ws87OVkMyQDDDQClNs/viRoQ2ooJ49bPZmil6axA2cHU9CiW6srzKzIg8CGXDYqOnah1WRDu+U7VjLMqySQ4OgMaK15fZs02E+TOTSzpakYkGufHt4afEhxZB4tMVKkSSzF1r91DmaxOM1RS1umwIiQ1taeZR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oD2oeJvu; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oD2oeJvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750894837; x=1782430837;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3O3pwK60G1CB3pnW+LnCrN1jwJnsR98enc2GP5g/ue4=;
  b=oD2oeJvu3lKarzOkwMUd9u5T9CLamNtn07AgA1SnFp4NYXHU6D1eqFTP
   fEeoEZFnwtyKMt3VVDYc6eQPou97ucR52xeDdC0B0x9W5aCywSk+zX8Gw
   iHt+3j/PBH/6enFjV2Mul7pPJGAfZ++xDWy9riq0MjfXuoojTLXsvyHki
   QUJMCa0kymtYLGSspNBvAACfSyScsHOowvsyQFN8m+F9DooN5Pianet3y
   FhxXfMVV3WvE/ltgwJmrE8UrpIrecU6pqSrShhNMWR0E/KouhyDhXegg0
   naJcqi9WcoEjf5VTK8L0vHNLy4rV7fH3Se7CdFaUaIUVlvtTLqYk1JpAQ
   A==;
X-CSE-ConnectionGUID: 2v4cT55eTSKcX67sVaYtvw==
X-CSE-MsgGUID: UjXSdyj7R5GHBvhYy+ntZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52407547"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="52407547"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:40:36 -0700
X-CSE-ConnectionGUID: codQ5O4LQI+3WH2n28Nn5A==
X-CSE-MsgGUID: V5Zzt2cpQAWsDSn0BHb3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152655719"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:40:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:40:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:40:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:40:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WH6BKFVnwb3iga3Qo5JxF4jM7q8Qt7au0o6LdS+wQLpfRtnkxN4L7UDyQRXWrPb8ZOdpWHkizL8Msqq+ttMjXdWtF5McBmo1GiMXI1fbZ8AIT7Wa6SsBnMWVLodoY/S/NUhhH5+6a0PyDzksjSxZtobXI2V3qVzK1d4ZOI15mUWwKQu/sHHzvnydZoah5xKZhJjORrtleSW2z+bCSbWc5IHbr9OXOxKleJPLdINce4lHJkBg2J/v71w32QjTVC5L3667b6KRbcyUqMhtY6UxxrUrATVV/3J5ejmrKxYcdSotPeWSzggP2L2FipD2qBzlqzCOAAYujiSouIyJuwdL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHPu3DLYtX9gY9nSMj1J0x1HWnk1NyVtSaDtuFy7h1A=;
 b=cEzXxjduyoTYUuja9cZqYUa9ocBtkkJzNzM6GH4RvXAQTnXIOLtinqMMdsCD/FlrrMQM9RMu+4ZSUmDIC+Ol0EuvO8S9W/BfYfj19Elzu5pc6GU0QcnLY2XvmdSYS3j1QXRwyeqPhuG6xuo1tP439ei/KT8shN3mQPC0fkpq3hqrvRz6qtP8RvsxGodRxU72B5NU1Zz8H5wG3j9YJkBCNJKB6ESX6HqLH9XhA0A/W/i2I9w6G5AjhCYPNTv4BoZ0ZlXzKR8HmJJ6ozTa4ovUHb75rryABWiySMsmS+iFnJqAFIw6d7mLByDOB5Bc6NAf4a3llQOYm6IrfS36Efm0CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV3PR11MB8744.namprd11.prod.outlook.com (2603:10b6:408:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Wed, 25 Jun
 2025 23:40:17 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 23:40:17 +0000
Message-ID: <0f10bc24-b10d-4834-9643-5e44a2b83f74@intel.com>
Date: Wed, 25 Jun 2025 16:40:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 31/32] fs/resctrl: Introduce the interface to switch
 between monitor modes
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <dada02bec2f7ea2fa316f892560c07e0bc45df41.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <dada02bec2f7ea2fa316f892560c07e0bc45df41.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0179.namprd04.prod.outlook.com
 (2603:10b6:303:85::34) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV3PR11MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 4221e0a3-a35e-4185-4fc5-08ddb441a3d1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHAwZlpMb0N0OXQxcXltdjd6aUZiYm5iSFBGU0dZRFhwUTBvY2ZNKy8wa3Zm?=
 =?utf-8?B?cDFIWFJ6ejlKSmtEZVdjUFdJV0hKMHRTcERUQm9nY0tBRDdiWFptdHlaMEhK?=
 =?utf-8?B?R2M3SEdva3l2alhpNW5lQW1kSlZvTTBxQ0dlaDVqZlhEdUhUSEVPdkx2ZG81?=
 =?utf-8?B?YUNPaEV4K3RLTHBiNnJqMUhsT1BsK2t1eUpYQmkvRnB1cjRsdzN5Vzk1bVk1?=
 =?utf-8?B?bHNFMzJuT2UxYzJ2UERRTDNHbHIzZFB5SDJHcnNEbE9wUXlXckNkMnpVRmpB?=
 =?utf-8?B?RXp5c3VTNFlucGxKSmlGUURRbWs1Zy85UmJrL2wva3Nia0w1alFHaGZRbkYy?=
 =?utf-8?B?anI0bGExZlg4UFVGSHdSSm0xK09IbG9CRUJnR3d5b2N3aVNDSm9weWQ4SW1C?=
 =?utf-8?B?ZlJQTnkzSXdocEpjcFJYQTQvaUNESjJMdWprZTNycmNWQjVmTy9lNjl3ZDVt?=
 =?utf-8?B?c3RyWEk1UEdhaXZmekFmVXRsZURoRFFUcmx2NkpQemUwcUxydWZIYldkMi9S?=
 =?utf-8?B?YUJVaUpGMDVPeXRBRjdUaWxxNVN4UllqZS9uZmxsZUliL0YzbldQamdoUGg3?=
 =?utf-8?B?N1lDTUE5Y1BjdmVoWStlSnlCd1RNclBqZkRjYWN3aS9ZRXdJTWVXYXhwODBw?=
 =?utf-8?B?SDdFVGtEYVBRVWNyNjJHRlBGVThjNnNIdWd6eWtEQXRIWlE1eGE4anRSOFho?=
 =?utf-8?B?bGs0Y0x0MzdpYXR3KzRQeDIrbXZnNC9mbmJlczErUmpnUGZRZTZpdk8yZUNI?=
 =?utf-8?B?MklRTHp4dFhmS3RISHkxUmw2Y09wZGhtVFhXaGdFZWlIbHI1MjgwdFgyRllD?=
 =?utf-8?B?N1FFR3hPYXlRTWttUE1pRW8xR1p4NEpIb29GZTk2a3dnbmhYM2hVNWVhbzdO?=
 =?utf-8?B?OVR4L1NjODBTcy8zMVY1SXBSZHl0Sjk5TFRPWnBoNXd5bzlmUFpLZCtScEcx?=
 =?utf-8?B?bFpubXFJQUxPQlN2eXJVbGxldzJJb29MYVhGcHZiLzEwSTU4MjQydVc4RU5P?=
 =?utf-8?B?SjllaVVUbGEyNy90RnpVek1vZmMxWFUrWGtnQ0lLVUNhOFRIM202RHF6T1Bx?=
 =?utf-8?B?SktaNkVmOWdCTWZ2L1pETDkzUzltVnBoNmNzUmdLOWUzcDh6aTF3NlNWUHpM?=
 =?utf-8?B?eU94RUluckcwajFIRG5tOG1EaGpFWFpDaG5uZXF3c3N4YnZGdUNQMUg0QkZ1?=
 =?utf-8?B?RXhjSzVsalBUSWRYNStzQXpVN21PMG9qT1BSbjdLNEV2NFpZUHpDUnUrRHla?=
 =?utf-8?B?RnJ1R0R4Qk9MbmNyVVRhUVp5R2hLcFlCeThkZHFxRSt6N0NVelBxcjJ0UmFY?=
 =?utf-8?B?akJlWEFKd1NjTzAybXk5VjBCazNFMjRZeDRyUytrc29lSEhPeHhXQjMzYW40?=
 =?utf-8?B?N0Q2cFFpTmd6SGR5U3h0R2tiZWI3amlvakprR0RINzFyTGhsTDlTcHZCRFU0?=
 =?utf-8?B?S2dyRkZpMk5lMDQ5UXNhMUtrdm5JZ2pqK3g4aWMzUk1nLzZxcjZuaElVTG4x?=
 =?utf-8?B?VTM5VlJXZkpSdUtmWHhOdUtRcHREUzZjbHdXR3E5RUhHTk5Ed20xMmkrODgz?=
 =?utf-8?B?RVR2dmRRY3lSTFRVQlROZGFnR1l3U0dMbngzYml3OG1QbFNHQ2xZcHRlMkNF?=
 =?utf-8?B?VnZVVVM5aS9sVzNCYjBuMFdnY3RpTVZDaFRrT1R3NjVLU0d5VHpFTHNIV0xy?=
 =?utf-8?B?QjZ4M2lIZ0h4NGEyellRamNRUzlJaWcrN3dEZE9oamx4THltWTBRMmVOeVBp?=
 =?utf-8?B?QnF3VjNqY1FSTjhzekFkNnZSMCttSjArbWYyeHdFMXFNcnFnL1M3VUloWDN4?=
 =?utf-8?B?RFZuOHhsMlJjR0JkQVhDR1A5aEQrMHF2K0F2MXdKZTBWSHRZWExCZUVoTTdO?=
 =?utf-8?B?QWhTa2U1ZC80Z3NXVHhTZGdVdkZnRDAzTXE1RWZTcFYzQllyQVhoZ1NVZVBO?=
 =?utf-8?Q?eI5sBDToXIs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNPZ250Q0VadlpkcTkwK1Z2ejJsSGZFZEFsMzZJOThuNWJuTUZMcWFmMjJI?=
 =?utf-8?B?YVdEMlhFN21KV0w5aS9Kc0hyWC9RemFLaitLNXdDYjV0bnVNUVlCc3ZQQWtq?=
 =?utf-8?B?Yzl6eUR4TTh6MVU4THY3TWtkb3lLbmpIN1JRU1dhaVZiQTA2dFlTN0NIeE5l?=
 =?utf-8?B?Z2o2KzNDQzFjZWlLS2VhYlI5OG1yY01EQmI3aEsrQUpmZXAzZ3FuK0h0REdj?=
 =?utf-8?B?Q3hTTFY1ZCtzdGtab25yUmRaQ0tib1RjeHY0WC9SdmZxa3FTYU41YVMyVlpz?=
 =?utf-8?B?VmwrRUJYdmxVN0RtRDIzZGVlQXdmUjVNK1J3bTRwaGRnMWhxRXFOOUd6K241?=
 =?utf-8?B?TEZVb1c0T2I4R1g4MkhKNkVnenJnazVoSWRUZGtNVjRucktFQlM4ZXExTy9n?=
 =?utf-8?B?S3RySEh6QnBqUVZGT3JJcEtmYUR2akNEVE43V2hyeG5OVzdNL1JkYlBPekdV?=
 =?utf-8?B?Tjc4UVNjdHprWTh3RHBuWm5nenlMc1BzbVBwdVZ6emlTclkxOFo3Q3l4S3do?=
 =?utf-8?B?c2lYMDlNckFVK0g2NVdBaXk1SnowdFNic2VPSG1QKzVTcE9Ibm1WbmthSjkv?=
 =?utf-8?B?QlBEVU1wSlAyLytKSithRWlNTTVVbTNQbUxpMHJxMG5IYm5ETXlsQlE1MFRa?=
 =?utf-8?B?bFNMWkRMQzR1dXdQRkc1VUN0NTgzZDB6VEJvc2VVU1JqVFZ2TzByT2RaTys5?=
 =?utf-8?B?ME80eERoK0tPb0N3Q1FpcjB6cnpUbVErb0RJNGtqWHFxRVpyYmFobnlZdzdk?=
 =?utf-8?B?WVRub0EvSks0M0xlQ2ZDL0Z6Q1BRM1dMN29pczE3RXdCTzN3ZGpXZ3NoOFlm?=
 =?utf-8?B?ZE9UTmxnQ0t2YXFFbXZyQ01idktrcFYyOE5LNFlZbTFCb01ka2VLRmtTbEhR?=
 =?utf-8?B?UTdBL0F6bUJhV2NPVHJVWlRLSnVKdG1Sd21yeGJPd28zYkhvektha1Biam9k?=
 =?utf-8?B?ZmJzN0JxUWgzVmt1TFVWNzR0anZoRnArWWs4cm1mc0NpU1liMUYzbkw0RUtx?=
 =?utf-8?B?aDFXMzNQT2U0b1lLbFpzbmh3TWNJMXNqb3orRHlTR3BoODFrZ1ptb01uSWU5?=
 =?utf-8?B?N24yOWJPK3JXQXlaTmRtdHh3ZEVFK2FmanptdEVtYThNa0dwTVdSSDBodVB5?=
 =?utf-8?B?NURnSzYzK1lyaVJ3WDBTTENjWThFaTUzWXdhV244Zk1qWURQV2xhT0ZEajBV?=
 =?utf-8?B?Q1lScXZrbFQyWS9UMC8rcGNMR2hraUU2YXhCdTRxWTg4eEZJYTg2OWpZbGdj?=
 =?utf-8?B?eDhKRnBKQ01UNWtQOXUrOUlYM0VaNUIyZEthaXNvZnRYd1pJK3FaeHZTUjZz?=
 =?utf-8?B?MitoOVByK2dwRCtPaWg1dXFBK3N4Y2hnalJrUkUreDdKZitFOHc3a01yT3dB?=
 =?utf-8?B?NmJrSURVOUQ0SUV3R29wZWUySlNGSm52VWZxVlpsOFNjSExiVE9UY3d2T2JN?=
 =?utf-8?B?RXFaU05pWVRyd2dnZmE4VFhrdVlDejN3ajJHTnorMlVTUE9KYTg0MlJZS2lG?=
 =?utf-8?B?T25YbTkwMXZvZEY2RnhYWmtCZHFScFJyeSswc1g4MmErVjUrMmpoeXJqN3lm?=
 =?utf-8?B?ejBVRENqa29haWFacHZ2SHlCai85aUcrc2l6c051NlA1dCtjdUg5QUVJcEF2?=
 =?utf-8?B?dXNpd2RmZVdFYzQxL2NLU2QxT014S25oaG15Z2FIVXhmckxiUzliN1VPM1gz?=
 =?utf-8?B?L1VPUkY3TEN0eVoxemRGdEpIWG1LM0hSY1B6dlFIa2N1Zjh2NWJNNkRtRXhG?=
 =?utf-8?B?UVZGTTZncW1WRXgvaTdsL3RFbVhRWGxKek1HMTJ2emI2TW9VNkZvVnkvRE9k?=
 =?utf-8?B?cG0zOGplTUxRV1hVWWtrN0g5QXFtRS9DOERjT3YwRm9LckFLdWIyc3FoOVNM?=
 =?utf-8?B?RmE3UlhUYTBTQThLWE1xdHFmUUF1a0srbldQUUhTMnhvWDRFcnJNK01qcUEv?=
 =?utf-8?B?L3lhZUVhZWpFTWpXakx5VmpDOXMzODdEa2lCZXQ0VWc2dmtFWlJPdklqbG9h?=
 =?utf-8?B?dUJRQ0xkZU9yZk9rK0lTUnN4RVdiRTNpREV6TytuVm1JK2o0M1o2MXRXYUpQ?=
 =?utf-8?B?bzNJemZWbUNCNGUxUDB2aEV6WTNQMUhCYmowcHJVeWdFN25MQ0FqTTM4RzFs?=
 =?utf-8?B?d25Sd1RBblZDT2M4MUFCdTI2MUZOR1VPMUJGRWR3ajJGYzZlVEVPSTFXblFh?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4221e0a3-a35e-4185-4fc5-08ddb441a3d1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:40:17.1600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0G1G+63ykXvzM4O9edDk3TDNnzHUBG9M9InXswPIU6kHwT3zgHfugC9N/ZBdpfgiwuhx2pIfhbsOW2948cnRe0/n0LKIsWJSfDMzjUoxAQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8744
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> Resctrl subsystem can support two monitoring modes, "mbm_event" or
> "default". In mbm_event mode, monitoring event can only accumulate data
> while it is backed by a hardware counter. In "default" mode, resctrl
> assumes there is a hardware counter for each event within every CTRL_MON
> and MON group.
> 
> Introduce interface to switch between mbm_event and default modes.

"Introduce interface" -> "Introduce mbm_assign_mode resctrl file"

> 
> Example:
> To list the MBM monitor modes supported:
> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> [mbm_event]
> default
> 
> To enable the "mbm_event" monitoring mode:
> $ echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 
> To enable the "default" monitoring mode:
> $ echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 
> MBM event counters are automatically reset as part of changing the mode.
> Clear both architectural and non-architectural event states to prevent
> overflow conditions during the next event read. Also clear assignable
> counter configuration on all the domains.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst | 23 +++++++-
>  fs/resctrl/internal.h                 |  2 +
>  fs/resctrl/monitor.c                  | 27 ++++++++++
>  fs/resctrl/rdtgroup.c                 | 78 +++++++++++++++++++++++++--
>  4 files changed, 126 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index cd82c2966ed7..7e62c7fdcefa 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -259,7 +259,9 @@ with the following files:
>  
>  "mbm_assign_mode":
>  	The supported monitoring modes. The enclosed brackets indicate which mode
> -	is enabled.
> +	is enabled. The MBM events (mbm_total_bytes and/or mbm_local_bytes) associated

Since there may be more events in future I think the "(mbm_total_bytes and/or
mbm_local_bytes)" can be dropped.

> +	with counters may reset when "mbm_assign_mode" is changed.
> +
>  	::
>  
>  	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> @@ -279,6 +281,15 @@ with the following files:
>  	of counters available is described in the "num_mbm_cntrs" file. Changing the
>  	mode may cause all counters on the resource to reset.
>  
> +	Moving to mbm_event mode require users to assign the counters to the events.

"Moving to mbm_event mode require" -> "mbm_event counter assignment mode requires"

> +	Otherwise, the MBM event counters will return 'Unassigned' when read.
> +
> +	The mode is beneficial for AMD platforms that support more CTRL_MON
> +	and MON groups than available hardware counters. By default, this
> +	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
> +	Monitoring Counters) capability, ensuring counters remain assigned even
> +	when the corresponding RMID is not actively used by any processor.
> +
>  	"default":
>  
>  	In default mode, resctrl assumes there is a hardware counter for each
> @@ -288,6 +299,16 @@ with the following files:
>  	result in misleading values or display "Unavailable" if no counter is assigned
>  	to the event.
>  
> +	* To enable "mbm_event" monitoring mode:
> +	  ::
> +
> +	    # echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +
> +	* To enable "default" monitoring mode:
> +	  ::
> +
> +	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +
>  "num_mbm_cntrs":
>  	The maximum number of counter IDs (total of available and assigned counters)
>  	in each domain when the system supports mbm_event mode.
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 14d99c723ea5..adc9ff3efdfd 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -414,6 +414,8 @@ void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *
>  				 struct rdtgroup *rdtgrp, struct mon_evt *mevt);
>  int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>  		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
> +void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
> +void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d);
>  
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 618c94cd1ad8..504b869570e6 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -1045,6 +1045,33 @@ static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
>  	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
>  }
>  
> +/**
> + * mbm_cntr_free_all() - Clear all the counter ID configuration details in the
> + *			 domain @d. Called when mbm_assign_mode is changed.
> + */
> +void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d)
> +{
> +	memset(d->cntr_cfg, 0, sizeof(*d->cntr_cfg) * r->mon.num_mbm_cntrs);
> +}
> +
> +/**
> + * resctrl_reset_rmid_all() - Reset all non-architecture states for all the
> + *			      supported RMIDs.
> + */
> +void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d)

struct rdt_resource *r is unused? At this time it seems unnecessary to check if
an MBM event belongs to particular resource since at this point I expect only L3
is possible. Even so, to be consistent and robust I think it would make flows
easier to understand by always ensureing that mon_evt::rid matches
expected resource.

> +{
> +	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
> +	enum resctrl_event_id evt;
> +	int idx;
> +
> +	for_each_mbm_event_id(evt) {
> +		if (!resctrl_is_mon_event_enabled(evt))
> +			continue;
> +		idx = MBM_STATE_IDX(evt);
> +		memset(d->mbm_states[idx], 0, sizeof(struct mbm_state) * idx_limit);

sizeof(*d->mbm_states[0])?

> +	}
> +}
> +
>  /**
>   * resctrl_alloc_config_cntr() - Allocate a counter ID and configure it for the
>   * event pointed to by @mevt and the resctrl group @rdtgrp within the domain @d.
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 8c67e0897f25..6bb61fcf8673 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1876,6 +1876,77 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +static ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of,
> +					     char *buf, size_t nbytes, loff_t off)
> +{
> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
> +	struct rdt_mon_domain *d;
> +	int ret = 0;
> +	bool enable;
> +
> +	/* Valid input requires a trailing newline */
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;
> +
> +	buf[nbytes - 1] = '\0';
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	if (!strcmp(buf, "default")) {
> +		enable = 0;
> +	} else if (!strcmp(buf, "mbm_event")) {
> +		if (r->mon.mbm_cntr_assignable) {
> +			enable = 1;
> +		} else {
> +			ret = -EINVAL;
> +			rdt_last_cmd_puts("mbm_event mode is not supported\n");
> +			goto write_exit;

write_exit -> out_unlock

> +		}
> +	} else {
> +		ret = -EINVAL;
> +		rdt_last_cmd_puts("Unsupported assign mode\n");
> +		goto write_exit;
> +	}
> +
> +	if (enable != resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		ret = resctrl_arch_mbm_cntr_assign_set(r, enable);
> +		if (ret)
> +			goto write_exit;
> +
> +		/* Update the visibility of BMEC related files */
> +		resctrl_bmec_files_show(r, !enable);
> +
> +		/*
> +		 * Initialize the default memory transaction values for
> +		 * total and local events.
> +		 */
> +		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> +			resctrl_set_mon_evt_cfg(QOS_L3_MBM_TOTAL_EVENT_ID,
> +						MAX_EVT_CONFIG_BITS);
> +		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
> +			resctrl_set_mon_evt_cfg(QOS_L3_MBM_LOCAL_EVENT_ID,
> +						READS_TO_LOCAL_MEM |
> +						READS_TO_LOCAL_S_MEM |
> +						NON_TEMP_WRITE_TO_LOCAL_MEM);

Nice, yes, this belongs in resctrl fs.

> +		/*
> +		 * Reset all the non-achitectural RMID state and assignable counters.
> +		 */
> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +			mbm_cntr_free_all(r, d);
> +			resctrl_reset_rmid_all(r, d);
> +		}
> +	}
> +
> +write_exit:
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret ?: nbytes;
> +}
> +
>  static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
>  				      struct seq_file *s, void *v)
>  {
> @@ -2203,8 +2274,8 @@ static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgr
>  	struct mon_evt *mevt;
>  	int assign_state;
>  	char domain[10];
> +	int ret = 0;
>  	bool found;
> -	int ret;
>  
>  	mevt = mbm_get_mon_event_by_name(r, event);
>  	if (!mevt) {
> @@ -2249,7 +2320,7 @@ static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgr
>  
>  	switch (assign_state) {
>  	case ASSIGN_NONE:
> -		ret = resctrl_unassign_cntr_event(r, d, rdtgrp, mevt);
> +		resctrl_unassign_cntr_event(r, d, rdtgrp, mevt);
>  		break;
>  	case ASSIGN_EXCLUSIVE:
>  		ret = resctrl_assign_cntr_event(r, d, rdtgrp, mevt);

Two stray hunks?

> @@ -2463,9 +2534,10 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "mbm_assign_mode",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= resctrl_mbm_assign_mode_show,
> +		.write		= resctrl_mbm_assign_mode_write,
>  		.fflags		= RFTYPE_MON_INFO | RFTYPE_RES_CACHE,
>  	},
>  	{

Reinette

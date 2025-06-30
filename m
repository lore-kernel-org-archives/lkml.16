Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB941FBE83;
	Mon, 30 Jun 2025 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320775; cv=fail; b=uv1OcHH4YYnQwBBY79TqbSCr3J5QD0LH5wNCM1aYeS5BdK6f7330T6qZnb7Ovzlu+cd3PcculfvdJhQrrcSCbFHUQ+Mgf/245yDuw8rfgAds1K09T4za+TTfhuovHqIrn2eoGRqE/gJh7dPU1z/zwr3QWX/KrGx5UDqIXW6Chwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320775; c=relaxed/simple;
	bh=sr3JfBYPUJeKHLKtvZNjp70z2JGSsJ0Xdz9EKHtgxtI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=owXTDlkGmPFqtAdwA8OTM2Gcb07X8jJS9GyYI7PzH39Na3kuyUh+BRiuV7mXD8WPucFHxJGttJXwH66DlUl4rdzO839xHtUAdpVBGirS6dCPysl/6hxtpNTB/7KCeb3HL9spRkh3Lz87dvlDoxtEuwBPkHqPlOyR3SLgzWwqMmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0CiKfoV; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0CiKfoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751320774; x=1782856774;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sr3JfBYPUJeKHLKtvZNjp70z2JGSsJ0Xdz9EKHtgxtI=;
  b=j0CiKfoVGMFqeemLB0Hfh+pcCN7EcBCV0GJWlOmVUU2uPDMLQcaouXhT
   B1fkp48tIFaJNNE6w5eNwX0dWF2AIFlshE0clfDyXZhIkxEUVuOp8HqEB
   rsWs1lGJT9IKnnfMLbx5nA8A9rQb7zSCyN9zUg5XSLSnrMlUqMpXODhWU
   HzXctHWl9fcsWhNWmVVe2uXLxuK9KllJDn0eJ8RjDQx0luIBYaBuwEbhb
   O3cdxG5OkwGLMsZdSXfThSKJP8Suy4d/XW0ySVrgbLIH/AxPTfBcSeuo0
   Ar+DE0jx1Apbi9ZjJKV26Sv/zcgP8swMOr4UxX5Mtw4YOnOFowgKldmRr
   Q==;
X-CSE-ConnectionGUID: 0g0nAWAvTRmNPSzsnonEJQ==
X-CSE-MsgGUID: kKl80gTfSVaqbfLPgUIQYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64257112"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="64257112"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 14:59:33 -0700
X-CSE-ConnectionGUID: GPdlCYpERb2spui94zdGxA==
X-CSE-MsgGUID: tzkIe9qUS5qEuxnqXAOtzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="190748745"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 14:59:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 14:59:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 14:59:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.69)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 14:59:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXKBarWMK9tr36v+eb1A4LZ2dO01LPk/LZFpQyVvRdzrfpyjnUsNJISnepFOYAvONIN616nN2BoX6lUo5jx0Q31n6be60Rq51lgS+TMZ8lcu/mP8J+Lbk95HzBKXcQLyC1cXMtzJAPEhGNo/EMRCBtqacrWFPUkZo4i1w9FEMf47c2oVFADBgkTBe4Rq6q6B7RTOz7XAN9aFl7oQDsVNp+NkE3D4IgvguT0O7hGdurRPMpMirpRllEAc0eTvNaPSbi8sUwoWxpkiGG+TW9u58sAuQvIgRWvUenxAeihAnG28FCEl9AXK4o/OwZFjnY0qcNVAq6wgLRIAhCx0jlo94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1JNQI2oC7Sw3Uc8ZDBwHkt7zyJQDKHDKEdTLgQbyz0=;
 b=wcK71L2d6zIDfCGTjLjf+sB9ilZPtyZOqJnZD/owkzMf6nNQLQ5qopvEVLtR9G5CzVp/M+0vAEOORX9Y5D8d8e9B8w+jXgLQM/sjEOammXRF8U441EBhm1RazdFGF26PDoD96XT8vLuYT9HXt3cNeJ2OaAFmHFa/eTaqKfeq23GdurgekHSPl51SZtx4ODs9cw6PwpVRstF4DCKiayyzahUidfBByi1VMsynufOkk1hCYsnavUqgzsMmwEASTbeLP8canb4aJJCa4icQ398OMW3tAHiGyN92Jxk3Z2AN1e/2qnQKSjci0lVFzdrjgmW8hr9uWFwxbeg8IIOE8KNBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 30 Jun
 2025 21:59:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Mon, 30 Jun 2025
 21:59:27 +0000
Message-ID: <9def123d-d92c-4e79-a5fb-f8761b15200c@intel.com>
Date: Mon, 30 Jun 2025 14:59:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 21/32] fs/resctrl: Pass entire struct rdtgroup rather
 than passing individual members
To: <babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"tony.luck@intel.com" <tony.luck@intel.com>, "Dave.Martin@arm.com"
	<Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "paulmck@kernel.org"
	<paulmck@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"ardb@kernel.org" <ardb@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "seanjc@google.com" <seanjc@google.com>,
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
	"Shukla, Manali" <Manali.Shukla@amd.com>, "Yuan, Perry" <Perry.Yuan@amd.com>,
	"kai.huang@intel.com" <kai.huang@intel.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "xiaoyao.li@intel.com" <xiaoyao.li@intel.com>,
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, "Limonciello, Mario"
	<Mario.Limonciello@amd.com>, "xin3.li@intel.com" <xin3.li@intel.com>,
	"Shenoy, Gautham Ranjal" <gautham.shenoy@amd.com>, "xin@zytor.com"
	<xin@zytor.com>, "chang.seok.bae@intel.com" <chang.seok.bae@intel.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "peternewman@google.com"
	<peternewman@google.com>, "maciej.wieczor-retman@intel.com"
	<maciej.wieczor-retman@intel.com>, "eranian@google.com" <eranian@google.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <84e5cffb2b3f8088f77781babe89b0cab513ed79.1749848715.git.babu.moger@amd.com>
 <918e2679-9778-44ea-9755-270658578f76@intel.com>
 <ac378dff-3eb1-498c-8b01-b7c5146c96bd@amd.com>
 <f8e15067-401c-4644-89a3-fd00cd59d58d@intel.com>
 <f80f254c-af8b-4d7a-96cc-e8aa569b6d45@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f80f254c-af8b-4d7a-96cc-e8aa569b6d45@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:303:b6::25) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0eb986-b02f-4bb0-2a13-08ddb82161fb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWFLTWpER3ByVjJFSzBBZ0hlb3hwdXhYMVB0cVd0RWp3TklObWVjeW5ic0JZ?=
 =?utf-8?B?OUpISEFyc0k1Tit3TjdrVWNXdGh5ZVhnS1RzQmlRN1hqSVJ3RUlIZFl6NnZ0?=
 =?utf-8?B?V3VsdWpFU2tQbEE4Y2RiNjNxMTBaYnJEbDFnMis5ajhIdnFOcVVReWxiVUc5?=
 =?utf-8?B?YStNeVN2TzhJS1hUN1krZGx6cXM4dytyNUJ2NU11bTcwS1ptd1RscHFBU2Mz?=
 =?utf-8?B?U2hjOFRCMDFvZE44MmxIQXFBMEZGTGhtN1NkcVdsSGwyVEpCcGtQeHFjeTZX?=
 =?utf-8?B?OUtrVUYyTlpwVmh4aEFQbXBYNUdwdS92M1dXNDNWZitsbXF6YytHRU5aQ09M?=
 =?utf-8?B?SGV2blVNR3ljZis0NitYYlNRL3cwY1VHaE02Yjk0Q25FL2NTV0dUZHdaSzVT?=
 =?utf-8?B?cUwyRVFFZ1pENWlWSGh6ZW13cDJXMktKNDRjM0N6OFhNcFJNUStjN21zSGdm?=
 =?utf-8?B?YmN1MHBzamgxbnp5d0dBOE9LbFo3RmU4NVJmMGhPd1phM2tqSXh6NjIzVUlt?=
 =?utf-8?B?UFJ4YzMvSjhvc0lEdnF1NDkzandaUERYaExXRHdEUUVMSUY0ZU1ROG9xUjVl?=
 =?utf-8?B?dXRwSDEvNHRPS3p4UHhBbk5EUjh6cVJZMTJTNXFVeU9tdE9CL3VQMXZ2NDlC?=
 =?utf-8?B?MDJWNStBODdJTDljeW5sankxeEdHellEOEo5U0tRbUJYS1RxZVNTRXM1SHlp?=
 =?utf-8?B?Y2NJWG9HdCsrNXZwUU5KZy91Z3kvUnV3M3c1ZE0rUkJPcHNvTnRqdjloc3pk?=
 =?utf-8?B?NnB1VnhJaGhOREpsbDZzdHNiQmtGVUdQV3ZtQ1NEc2JrdmwwcGw0VTlRa09r?=
 =?utf-8?B?R3ZFbVdwZW5ZZVpVRlFnbDZrRGM3b0ViSXU3U1VLQWI1OXN5ek1YWWFBMzJy?=
 =?utf-8?B?MWtxdlNCYkVXWHpBb1NHWGoxYjFYTU5kMk9nczlweGxEd3R2ajZydlNnY0ZV?=
 =?utf-8?B?clBEbDZiYnd3WnloVG1KZ3BZZGNiOGJ0Y240RDRPTGJxS0lFaFpBRjV0aEor?=
 =?utf-8?B?ME14OGRQT2tNakVrSGlGOElmczUvS0ZMdVBZL0psQ2dsUjlrbUxKejRySEFG?=
 =?utf-8?B?Qy82TGRIejB0WnFPKzBXS01icVFlRllaekRyQzB2MWo5QS9ZWUVxK3dwWkN0?=
 =?utf-8?B?amV6M25PaWlodG0xdytmcVNsenMwVEVER0hyVFlxVjN0VnNKTnRuNzVNYmR4?=
 =?utf-8?B?clFicFRocjVrL3p5S0UrcE1iakpDdGpoWlFKQk5jYU9uTTZIdmZrUEJpckto?=
 =?utf-8?B?NCtnb1I5M04reDNqcVgwS21Ub1BCdW9HUkRmQWVXV1NwRUZ1UDNjbHc5ZnZR?=
 =?utf-8?B?NnNOMXBHaE1LU1ovRUYzNzhCeVBNbjVUdmFWa1NZYVo4S055SFA1SzFnd1Nt?=
 =?utf-8?B?aU5wNjNhbEl6d1Z4dmRtZ1MwbEFUenNIUjVIN3VYYmVjQldjY0JvN1BRbEg3?=
 =?utf-8?B?VEhNN0F5eGhWL3pTK25OSWQ3aGt1amM4cnlnZ09ibEdFUkFGYjFSTWQrZkYz?=
 =?utf-8?B?b1JQZkl3SG5tbU5aRE9TVy9wNVhYZGE3bVExaTkzb1FjWjcxQjlOZGsvSVBK?=
 =?utf-8?B?eTdaU3ZqeTR1cDJuSlNBbC95akZXVlZ4SDMzY3hPcWdMbWs2QjBwd0hoZ2xu?=
 =?utf-8?B?ckpSa1RzU2R2bXNqZXZmZTRrZnozd05rcnRwM25FNkh3M1VlWTNYMDM1UE5l?=
 =?utf-8?B?cm8zRUdtbGhWaE9GSGFVN08yRW1OTXlNUFNSWUJqb2JjWElFbUwvVnJHT08z?=
 =?utf-8?B?UVIxT29STWJoYnFSVHBGT0JYNll6cEhSaEY5YklQUXp0bTVvcjU3c3kzVGpZ?=
 =?utf-8?B?aHJJbFMrTCtha05SRFhTZUtvNlB1QU0wb29FQVJYbTQzNzgvb213S0dXR0dJ?=
 =?utf-8?B?ak45RGtDNnVmTFhQZndhVlBTeDVyZDZOdkNVTEx1SzlKVWpKL2JRYXZ6cURC?=
 =?utf-8?Q?TJTypgldTNY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym94bmJzM3lCekZtaG1ldytlaHg1THpySi9qYkJzdUZOeGVZSWdnbm0zN3E1?=
 =?utf-8?B?TmlXVmlVTjM2RFJwZnFMN0d3RHhTTGIrVDY0NGpSV1owanJBckpIanB2ZkpP?=
 =?utf-8?B?YjVaYlVxTmxicHU0bTVsMHZZSEx5a1JYSWprWXM3SkRxeXB6Mnc3OXJqamNm?=
 =?utf-8?B?TnlrOGZ0ZDdJRGZSMGtSWFY3RG11bVRrOTRMR1pTL2ZnSDIxTkFLRzlVVXpp?=
 =?utf-8?B?TTlkM3RObWRlNlVkYldzV3dXQjk1YjJUOU5kZnp1N1ZraGswbkRwUlg0OVlF?=
 =?utf-8?B?N2gyL3ZJbnRnSWQ5NU5YU2IyanFyZUNSWnhsOVFubGYrYnhudSthOXA0Y04z?=
 =?utf-8?B?cWtSN0oxSi9RZ28rMmV2UmtwdDB6N1NUOXJBcWFta21tMjNuREwyNnJmRU9F?=
 =?utf-8?B?R3hxL2JHUmNqaWxZQml5SVlRUU1YVWdPa0hXN0J6azFMdkU2dFBGblRVTEpE?=
 =?utf-8?B?RGI3S1ZWZWtJVUpzZmtxYlVjZWJVakNmOWNmbUoyYUh4ekxRcUowa21DNGlh?=
 =?utf-8?B?Rk5SM3plejNmR3NKaWNPTjk3TXB3ZzdBRU00K2R6VDQ5d0wzTmxKb2FoWlFo?=
 =?utf-8?B?TGhReHJubXlEcE1sZlU2N08yZHA3dVFDeHhuYnRrVkJwblVaRkFmaE9wWFRu?=
 =?utf-8?B?RWwvZ3lyZjF3ZDdWMW9EL1FtMVhFbEdWTnAzUjhkZXBJRHc1RXZzakVzZGRM?=
 =?utf-8?B?eU90Njh3OWx6VHNKR25sWUI3bEY0VTJyVG9iQjd0RTlKajJsWnptbm52OHFa?=
 =?utf-8?B?aDhkNTBxVS9haXhwZXZvRUxIVC9KKzJiSThOaGQ1OU1neWQ2RDlQN0tJTTgv?=
 =?utf-8?B?aTVxMDhZV2VZa0hXS29EN3pEaFNjeXNiZjduTlM3WkhQSktId2hoSmtyUlVa?=
 =?utf-8?B?NVhkVitybHJRcUpDOFByQ3dUL25HRTAvSnpWMTdpZ3IxaGlKSnpFNDkrQXA4?=
 =?utf-8?B?TTFjdnZXTTErVmlmQnJqMjVOZlAvRko2OUpDbXpJUUlzdWlSSUZXbU16OXdy?=
 =?utf-8?B?TmM3NlFkSFhXNnBjR2xQNzVPWHJkR2lQZUx1ZlArSjREUmtKY0NrMjdiZm1r?=
 =?utf-8?B?WkE0UmFNZlBUeDIzcjNxS25oOEFaMjVUSjRSUlBqZHZnY3RrVkNYMk5VYkwz?=
 =?utf-8?B?VFgyb2RIazJqMEdvcWNlTGl6NDdqOUlFWU5lVjJNTzExUkh1N3lYNmZ5RjRq?=
 =?utf-8?B?Ri81Ujh6OFUyb3R0ZEhHaXpOd05NOUd4bzZ2VWpxRkhieDRxNGhwWllUN3lX?=
 =?utf-8?B?cGx4RE9kajZIcGVqTFQ2STJEcjUyTTBxeTl5cmR6eEIwVTB5cFY4OFQ0eXRZ?=
 =?utf-8?B?TWpybzRrWlZFU25QY0Qwclc1MGJZQjdsd2xKblJBbVJvMDVXT0xtR0xwVkFR?=
 =?utf-8?B?S2tXeU4vZHcvbnNZVEZwcFFPdzJuYVRDa2tXdkZ3aWpxOWNiaDROVzltN1hF?=
 =?utf-8?B?UjQ1Si9WOFEydk9tWmV3d2xkNUJUREt2UXBUN2hvYURYUVRaQnhnS3VnLzUw?=
 =?utf-8?B?Mi9RSXIyenlnRUNhUDk1Ti9VSk5vQXdQcnBPczZFRVVBNFhUMTFaUWVqd0xt?=
 =?utf-8?B?ZktHaE1qNlVTdXdJRkVxa3FwYUxLbHVaeU1YKytwZXVkMW5ZSTNnVytLc0JV?=
 =?utf-8?B?OXJldjNVZHBHaXVJYnovWE1lcnJ4dXdzR1ljNk5TeGdNZng5Y0ZTODFDcXI2?=
 =?utf-8?B?clBJeWlObFhKN3dBUkNocmsrTDBSVDc4WVpaS1FGdGNGbEJDbGRVbmN5T2tl?=
 =?utf-8?B?S0pqajBCM3ZaQ2o1cUpWMDV5Nmx6YmdhWE03QitMaVRaOFk5L0tSajF3MG94?=
 =?utf-8?B?dkE2S3NlRjBCQVdnMGdwME91bkJqUWVmMGJFS3VOYys5QjN4bHJ0M3hDekw1?=
 =?utf-8?B?MzNIVmp4UXdhR1ljYys1bVZCL2srbkpUcU00TVdBWEFXYmlvclN5ajgzdWZN?=
 =?utf-8?B?RFZ3anVlRS9xOG9STk5wM1FRQTlWOFZaaGZwUUVDMUxreVRFZ0d6T1lHOGs2?=
 =?utf-8?B?bWlPd3dTZ0g5TUpqdnZlcmp1V1hkUlJjdHUwSUJJaWJtbDBsYmlpQ0RPbFMv?=
 =?utf-8?B?NGl3SFVMc09XU1d2TmZ2ZytHSGM1azF0S0lvUWIvZTIzOHNrS1VqWExUUnlp?=
 =?utf-8?B?QWNhTkdrWEYxQmgwemdONWoycDFycGlwcms3Z0szek9JaklBZ3VtbmNKdVRy?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0eb986-b02f-4bb0-2a13-08ddb82161fb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 21:59:27.6276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5171hFvMH98bWhMIBbOciliipYFXQioKVspnXsh3/xtrzkL9N52l8G9Z5zaSHPbPjI4s9bcz5FH5CEsUoAjNfZA8/O0K9kZV+5mGLw/KJh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
X-OriginatorOrg: intel.com

Hi Babu,

On 6/30/25 1:58 PM, Moger, Babu wrote:
> 
> How does this look?
> 
> "fs/resctrl: Pass struct rdtgroup instead of individual members
> 
> Reading monitoring data for a resctrl group requires both the RMID and
> CLOSID. These parameters are passed to functions like __mon_event_count(),
> mbm_bw_count(), mbm_update_one_event(), and mbm_update(), where they are
> ultimately used to retrieve event data.
> 
> When "mbm_event" counter assignment mode is enabled, a counter ID is
> required to read the event. The counter ID is obtained through
> mbm_cntr_get(), which expects a struct rdtgroup pointer.
> 
> Passing the pointer to the full rdtgroup structure simplifies access to
> these parameters. Refactor the code to pass a pointer to struct rdtgroup
> instead of individual members in preparation for this requirement."

This looks good. I made a few adjustments that result in below. What do you think?

  Reading monitoring data for a monitoring group requires both the RMID and
  CLOSID. The RMID and CLOSID are members of struct rdtgroup but passed
  separately to several functions involved in retrieving event data.

  When "mbm_event" counter assignment mode is enabled, a counter ID is
  required to read event data. The counter ID is obtained through
  mbm_cntr_get(), which expects a struct rdtgroup pointer.

  Provide a pointer to the struct rdtgroup as parameter to functions
  involved in retrieving event data to simplify access to RMID, CLOSID,
  and counter ID.
 
Reinette


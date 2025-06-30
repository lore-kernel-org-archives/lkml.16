Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F333290BCC;
	Mon, 30 Jun 2025 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298308; cv=fail; b=aFMhlp1+nLvVZj0hP+kkq8mUSj0ANwv3IaYKeYTr/Q5RM56QNItlI3hl65Y9WOoDnW7NzBCnmjXMMOxayHiEFkidGNWnFBoU6vtg/vuFR1sYTXuyA4dvy3MdEVrTRes3GlhMdbun1n+bZgXvup3crTbC2O5Yyh6R9J2ld/0JPZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298308; c=relaxed/simple;
	bh=Ma34+g+lKVq/iCoStpfl2m4jMtSkoKXSH/4JfkO2l80=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bx2CePUmjIAFm0Wm1+4Hsa4+O/EakcVkZhcJxy1/WoAP6lFUAyYPhptusNys7CXG+EOhbE+Lf3tgax5S7bOr6yiH6FRhRQj7l8mMpLzwDxr21O/7T/EwQt04LxXlxiVzpqJvQBSd8GYitpiQOkFCdJxNus9AxBZWlEL2mjL5H4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czvQvOyH; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czvQvOyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751298306; x=1782834306;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ma34+g+lKVq/iCoStpfl2m4jMtSkoKXSH/4JfkO2l80=;
  b=czvQvOyHnba35U4LUlprP3wYCr4EbyOdg3Aa0li6KztHXmD80r5BjK0E
   0v52W2Km/6H1zM2V2YAx/ciGtrmxt31JLSFTmWtYev2+8edboEJXDsqje
   EG17wWEYC/1xpNPjWGLAP3PGL8N1Nh4sLCoVan10T+y9t0kid2wC2ns20
   6U/InqMH16PTMaeHKV1t6ASbLoMslv1py7jXGQsYQ6tPRgFab/bwTzFV2
   9EF+bqka4NjszrlCC4c6TfGviaQfvDRq5+Sp5XvWZVopjN4d7nTugpgfT
   Ht5n40Zvg6LvAMlwg2SaDRzAC7swAMccPWPegQlxU23ukIl5LmLuoZa90
   Q==;
X-CSE-ConnectionGUID: 1f0+GtziTk+ARDA7RfWQ2Q==
X-CSE-MsgGUID: 9r5PfWVdTvmUNM/JgEE3SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64976914"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="64976914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 08:45:05 -0700
X-CSE-ConnectionGUID: nRjftAa/ScuScA/TcoOk1Q==
X-CSE-MsgGUID: 3iXIVy6STQi2Kv5Jeg13+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="158044180"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 08:45:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 08:45:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 08:45:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 08:45:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apBCluiUVWXBI/zA+vtCCyf3submPVS5ymgUxpr6pQSIuyDlA2tmJVRUPG3yXbbKJpC5Cjjzwb8LV5OLecPgcfPzhrG3o0fHX6TyfPk9oM2Z7qdH0yvt4q/ZB2AZPUhhCHPBai7M7qbdKJJFF36yPhsfNV7SoGGDUcM2DiiRvOgRV5tnbbglvYxDe02K4GocNcN0Di2qHlE4Mh97Va/6du8sBek3ov39JANqUnUnA5q/BZUcNHWkzr3LtvzqABlJk0BpkjehtJg5NdbyDyR1HYEB6rvEZJ++LPVRbrlK1wbUaJfeU54jjb8Q4C/B6Q4RzLKrGjO1VKXODwhEbH8fpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IOTn8XLgfriM7rUNNtuOhwDAHP4q9Xq78Gkaybq+CY=;
 b=FpKfGGw7fv87MmCCgAb20C9PpYDP6axDlaAoGICWB3B2Wged8EKC2OZ2RLlpGjj0o/if696g9GWXJtZf5Tfe1Bkf+voGGmUOUBdSdl3AQBnO7dSV3kNyk6XXkKWKDRn5pLYiJoWd0bq/8GpgRgepw0dleFLdgScHDOTXjwEP3z4Im94ZQ5ArTwEHyt4C2KXw8tEfUxnna2XLPt6G+Zc4LhYB8KjhyCqLqu36QiSYstpeDSqe8Kz/g9MTRFOkasdgld/ncuw+7n/amlpi0MtWODWKocqujeADcO1F+doRdDbvTNHU+wxOd1oKdBbm/69Q0XjMkUNoqaU+y8Rc9ncWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 15:45:01 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Mon, 30 Jun 2025
 15:45:01 +0000
Message-ID: <f8e15067-401c-4644-89a3-fd00cd59d58d@intel.com>
Date: Mon, 30 Jun 2025 08:44:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 21/32] fs/resctrl: Pass entire struct rdtgroup rather
 than passing individual members
To: "Moger, Babu" <babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
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
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ac378dff-3eb1-498c-8b01-b7c5146c96bd@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fa64eb-4f75-4c30-75c1-08ddb7ed1324
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHpvazdhWDJKMUVKU1BNNEVpUnRSQzhSdFpxSkZKbFBXdmlzVGRmbW1TOUIz?=
 =?utf-8?B?elNUTUZvMjJEZ2JRU0xDUFBzM0xZWjJkT1dmNHZLcnA4cUNtUTJJT2tnWWUy?=
 =?utf-8?B?Tmw4dVJwOUVIM3B1RGtRSzNDOW9nVUhrbXIxZ0EzcE5GQkpXeFh6L0VPbGNs?=
 =?utf-8?B?N3FPVFdCem5EU1FBUjBscENoTlVtbTRIRTFUbVBLck9DZlkzNi9ZVWhaTEtn?=
 =?utf-8?B?dGwrZXdRUlVBZXY0OGZFZnJVc0pHeVBTS1JobU1FTElmK0hqRzdtTHBQQzVU?=
 =?utf-8?B?cTg4UVdtcXJFZGgrUVhpZzQvbENhSTFtRTE3R0w1ZXNTK2JLU3JXZlpvSUJj?=
 =?utf-8?B?ZkFMYktMd1ViRFNCYVhUbnQyclZXSnozSEFHWXFwRldvOUFySzk3SThNQW1S?=
 =?utf-8?B?K29jd01OTEY4QlVMUDNVdi9oVXpZUkxYT0M5U0tZQ3ZVRDl5emw4YjFteUV1?=
 =?utf-8?B?eFFwWGk3N0JYY1phbWcyUVVxVnJXandFc2JBcjB6UTdsZzVQdkpJQ1NFTE1u?=
 =?utf-8?B?NU55dHQyZWNpOEVwS3pwZGlCOGxDRFVrUlhhckJlNE1JbzdWRHlNdDNPcDhT?=
 =?utf-8?B?YUVYZWlLV0NiQk9VZXYyamJnUGs3MlhMRnhPRWQ5QTl6Y2dZVXFoTytKNHhD?=
 =?utf-8?B?ZXNyeFVuZURvRXlpNTl0NitzbVlVWHg5MHRqTC92NW5OQTg4QlhLczRvQzJY?=
 =?utf-8?B?TzZxWWkxbDg0YjBqSUhPNy8zODdMaVhkZW8zdE9GaEg3UnRyamdTbk1zbnF1?=
 =?utf-8?B?bE9ndDlqT3doL2J3SWsxb3pIMkloRmxzODI0WjVyNDVjd3I3L2pGRWNzU3or?=
 =?utf-8?B?YVJSYnE1NUliQWdQUUVtSitjbzNyaHlIWXc1K1F5MUpaSVpHK1JMa1oyb2Z6?=
 =?utf-8?B?VXlzNHZZOFR5Rm4zYTBCWFlBRW9LMXhnbVlsc1IvdUM4Q09VUXlTc1V2Tnp3?=
 =?utf-8?B?b0YyZHZiQ1J2RkZqUmlkaXhubllDY2tFQ0dQUGhzNWVWeWx6dXhPWitpMHBv?=
 =?utf-8?B?Z0NLNGFoOVZPVHQyQXNUQVRaRmxWM0xxYVNqNy96ejZpUzRQY2k3UklJNlhX?=
 =?utf-8?B?cUJxR3JXT2k0RWxVR2NvTVorcmtvT0NpRmJVVFhxNnJ4QXJBb1RBbjMyak90?=
 =?utf-8?B?Z3dOd1NwVjlaRWtRbHQrbFZ5Z29kUnlWUjU2cVZnWi9nVEljN09WQWY2clRS?=
 =?utf-8?B?dDNVdzVIK01INTF3SHg1T3FnNXFESitxbFg2a1VBMEdIbk02aTBOT1k2L3Yv?=
 =?utf-8?B?cTNyUlB4MVRiSitnU1NIb2ZzeEVsSVo3TU1ocEZselJQSWI4dXBzeVQ3WFBx?=
 =?utf-8?B?Qy84VnRSUUhpRkNrVmY5dVdpZWxvZWFhTEVzVU0yR09wdnBWQWJXR3AxNENy?=
 =?utf-8?B?QlU3N1owNXZOdGx5RW1PVjRVR1hiVUFSeFhhUE80N0tLQzU4M1E1WktBU08r?=
 =?utf-8?B?M1JLejhpS2FlWjVoY0xaMGNkUEJBb0xGUE01dERFVzlRTUJObFovNUkwb2U1?=
 =?utf-8?B?N3ZvZGlZMkNlYkRNbVlmVnBXQ2M1MTlQZkRrMVBUYTFHVkpLdmlTSkh2Sit3?=
 =?utf-8?B?Ni9iU3ovM0hHV29OQ0d0MlFJbjd3dEZLcUE3RkdLVWFKYmtxcGJFU2k0QlRR?=
 =?utf-8?B?VFhTMWdTUEdzczBsZC90aTlFU3FWNGoyYlRDVE83cjdySktMdHY0TnZnTHA4?=
 =?utf-8?B?MXlXd1RUcU5keGdFbDFEcitmeTE3eVRZTlUrUDFDQXJiWWlZYXg1M0ZTM0VO?=
 =?utf-8?B?OVlUejlFTmhxVTJ4MENWRlNDU0pJbE4raEVGZWRyYzF5djdZVldYVXBPQ1Uy?=
 =?utf-8?B?SXlpT0VSY1loWjJFbTkraXAvYXlrMytUdjhuWmhMYXRwTXA0NzNXQ2xhT0Iz?=
 =?utf-8?B?MUxQSG5QKy9WMEsvTjR0N0dXdE9HaXg5STlFbnFiWnM3Z1FRRXJWQk1rVVht?=
 =?utf-8?B?SGNSajlObEFFbWJiSXc1UEdZYkhJSnp3REJIZ3VxUkNyTzJ2dFpmVVpZVmlX?=
 =?utf-8?B?VUxxajN3eDlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVVRc2ZaZElmZVdEcDJKcHNQTFJtNHlJMm13QUhHQ3ROMVZWcEZEdEpNcXYw?=
 =?utf-8?B?VFZzODQ4UTVVaWRxRUJWMUplVlhEd0ZSY0wxWFhDUlpqcVB3cFNmUXE0VllS?=
 =?utf-8?B?WTBQSUk3Z2Q1a3BrTlFJY0pzZ3U5QlBIbnZDMW1BbkdNMEh6N2tCd281SFVn?=
 =?utf-8?B?VHZ3TzFoakpSZ2dpeW9pYzdWUVhEOTBkUXVzaElKY2dBT2lDQzNmempPOXJx?=
 =?utf-8?B?OEJickdtQ2lZZjdVT2hSdHk0QW4zc1pKMUhaMHhlR042Q0FNVWFYaGd0Znhm?=
 =?utf-8?B?S3Erdm5FZlBjRDhtbkptK2JMaURpbE43ZWlUMWw2em9ubmllbW51MWtWNDhG?=
 =?utf-8?B?NHFCWGxiZTZqSDNTV3daSGh0UGo5OTYzeW5yR0tGbW5qU0dTaVFmNHpYdm1G?=
 =?utf-8?B?cjlZYUFBVkZwRlE3OXVXSGtlRFBWazJzVTJBT0pELzh5M3k3dmFnQ3BJRHR0?=
 =?utf-8?B?SndMZXpxZThISFVUSlp0cVdscklyQTV5VkFZK2RxY3hlWXgzYVJsV0d3cWRm?=
 =?utf-8?B?RERJSUdQSjcxR2MxUDZHdlB1OGRob1lubDZQdHAyWmpxdGxMMkhEc1dwU3pw?=
 =?utf-8?B?SGZpVGR1K1ZMa04yQlREQjhQT2lEYlFKS2hDWUNxTUM4QStXejE5V1h4VUl0?=
 =?utf-8?B?Ui9vTXI2YTJOb2xZMjFpK1JMY0NWYlJhN0FDdWF6VENWckNxL2hQU3VQK2tB?=
 =?utf-8?B?bVJuWk9wblUyZnMvcytxeUxtcFRmUlJZWkVhTWdGQzBMamtibHNYZHQxUi85?=
 =?utf-8?B?TWJuZ1dMckFCT3Q1LzRudUNkbVhjbDlKSnRXZFNzcS8wSUJrc0tyejJxdUdy?=
 =?utf-8?B?ZExaQTRNYjNVM3U5TW1HWjhNTTFtbUM3NHdlMkNmSGpGQjJuQmo3c0N4ZFZI?=
 =?utf-8?B?dzBVTjF3WTNvQWQrTEp1a3BlWjdrQ0JHT2NyaXNxMVpLMzhkSWtUdFFPRjZW?=
 =?utf-8?B?SHpiT2svbW9lYWF2VTk1N0VuR2NkeUw5ZlpvT1JiNWdZSGsrdGp1LzlMSzgw?=
 =?utf-8?B?SXpNQUZYNEc4bVNXa0U2VHY1UDh1QU1NSmJ6ZDBEbjRWckowY2FobzMwM0dn?=
 =?utf-8?B?LzZwR2pFMlg2dmJ4VWVSVUcrbjdmS2JZMnYvQW1XM1NCbExDOWVSUmdKN2pu?=
 =?utf-8?B?eTJFcEZLb2U1dDFVU1RZTm1ONU1zNTVlb25rYnhlMVRkbXBDd24wVnBOaGRy?=
 =?utf-8?B?K0pPK0p6OXkwWmNtR1pySVRHMGM5WGRzc1ovVGl1RUROdFNyL0ZNTEFXN1Ew?=
 =?utf-8?B?dVFhL0lGUjJhaHVRd1FVeHlja2RBWWhGOWVYNnVZeERqM25zS1lrNkNhS0JE?=
 =?utf-8?B?ck5FMHAxeXNlWHpsL1huZzJsTENFR0JoYkRBb2Qxclk5M2h3OUwxNkZtYWlm?=
 =?utf-8?B?Y0ZkdEJod2pMT1l3M0xCdXY4SlkxVDRKTk9KSzNGRHNpM3p5OW82SlNUbHk3?=
 =?utf-8?B?ZGVNd3UwUEMySXFNR2FVZmJSNnZ0SDdWSG9ndXI3c2pyME5VMTFKTkJWMnA1?=
 =?utf-8?B?NWVjR0pHY0FLd0Y3NGRvYW1VQTQwNFdmcmxCdnN6VCtzYzFhV2JvNUtHMDZQ?=
 =?utf-8?B?RWltTGJwS2FCN1FabkpkVjhyazV1d3QyNGtnNk9uNFlBcCtCNUN6dXM4NXNi?=
 =?utf-8?B?UEd4Z1Y0NGE5S3pVcGlhTm1hM2g3UC9CWUNLMi9ZRjh0R1A5SXRCS0E0dytY?=
 =?utf-8?B?Q1l5a3luQm9TUkROREtnVS95Mm04bnREaDBlR3ZldnFSRzNNRy9vYk81dUVE?=
 =?utf-8?B?VGtQbVFCTE1ncHd3K3pJUlVrdlBnQ0ZHSTErREhiR3h1eWZ5eFk0eGJWWXJS?=
 =?utf-8?B?SzBzYUpiRVRJZUxEcjk0TmprdHBtTzd6RW96RnpJZDViZmNXWFBRVGlkckhR?=
 =?utf-8?B?SGJXNmtLTWs3NUg3Y0lFcFZSOStMTlBodU5PNFp3cG51RHRneXlwMFBmTDdE?=
 =?utf-8?B?VHZtc1R1MktTcHJLcGJpNVRuY1VWaEtNdFEzL0QwYXhJeVBNN3ZlSDJBbE1n?=
 =?utf-8?B?bVFjclhMQlBUZC90WTYxRXVQY1dBTzJXdU12OVRWRlNJSE9TMEVieHUxaHRL?=
 =?utf-8?B?RUt6MHhIVWpOZ3V0aXR2VEdCNWl4NTh1N1RESXh0Wlpmcm9nclVuc1hVM2la?=
 =?utf-8?B?KzNPdCtsRWcvNlZZcFd1MFZNMXM2Sy9HTm45QTVHeHVqRDJiR251TVQ2c0dH?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fa64eb-4f75-4c30-75c1-08ddb7ed1324
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 15:45:01.5155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecu00SPY89KL9eHJ3wg/0l9J2DAGksLZWJhPqySrYKoGC3qcGDDyfwm9MBeda/rE5YroCcs1sjCtsMZw/kFLqepZDOGXkWse98GkuMA/Ujc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
X-OriginatorOrg: intel.com

Hi Babu,

On 6/30/25 6:57 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 6/24/2025 11:18 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 6/13/25 2:05 PM, Babu Moger wrote:
>>> Reading the monitoring data requires RMID, CLOSID, and event ID, among
>>> other parameters. These are passed individually, resulting in architecture
>>
>> It is not clear how "event ID" and "other parameters" are relevant to this
>> change since (in this context) it is only RMID and CLOSID that can be
>> found in rdtgroup.
>>
>>> specific function calls.
>>
>> Could you please elaborate what you meant with: "These are passed individually,
>> resulting in architecture specific function calls."?
> 
> Rephrased the whole changelog.
> 
> "fs/resctrl: Pass the full rdtgroup structure instead of individual RMID
> and CLOSID

nit, can be simplified to:
	fs/resctrl: Pass struct rdtgroup instead of individual members

> 
> The functions resctrl_arch_reset_rmid() and resctrl_arch_rmid_read()

(No need to say "function" when using ().)

But wait ... this now changes to different functions from what the original
patch touched and even more so it changes _arch_ functions that should not
have access to struct rdtgroup. This new changelog does not seem to document
the original patch but something new that has not yet been posted.

> require several parameters, including RMID and CLOSID. Currently, RMID and
> CLOSID are passed individually, even though they are available within the
> rdtgroup structure.
> 
> Refactor the code to pass a pointer to struct rdtgroup instead of
> individual members in preparation for this requirement.

"this requirement" .. what requirement are you referring to?
There is no requirement that individual members of a struct cannot be passed
as separate parameters and there is no problem doing so.

From "Changelog" in Documentation/process/maintainer-tip.rst:
"A good structure is to explain the context, the problem and the solution in
 separate paragraphs and this order."

This new changelog has structure of "context, solution, problem".

> 
> Additionally, when "mbm_event" counter assignment mode is enabled, a

This seems to be primary motivation since passing struct rdtgroup will
simplify the code (when I consider the original patch, not what this new
changelog implies) ... but if this change is indeed to the arch API as the
context suggest then passing the individual members is the right thing to
do because arch code should not access struct rdtgroup.

> counter ID is required to read the event. The counter ID is obtained
> through mbm_cntr_get(), which expects a struct rdtgroup pointer."

This is even stranger. mbm_cntr_get() is private to resctrl fs while
the new changelog describes how the arch functions resctrl_arch_reset_rmid()
and resctrl_arch_rmid_read() need struct rdtgroup to call mbm_cntr_get()?

Reinette


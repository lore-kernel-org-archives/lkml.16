Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5367F239563;
	Thu,  6 Feb 2025 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867406; cv=fail; b=crev/5wSDqKM5Z2xxRyGyY4GwQoTOVshEdbEaR1tPlPnkmSbFPAqWMkzNW7z9TtIW0Q3z6GHdpxojvLH0MJM+lr5ceEZP2C8UWoOH7o1LwVh/6wYKDXfIxF2eNedQGWxWLWnJ+4eRf8yiUYvwgIDr5/isQRqm9p+CfSPfOTajxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867406; c=relaxed/simple;
	bh=0pRIDrdVNSG4K9rsMo98uEIVkL0H1wo2QJnSZK6R4Oc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EOov8UR3LXesUcktdGYQY1+RSOsHJcYFgytbmQgJi/7k2PtlX4ITqL/6aQuBQ8XANG13EUBqw2GkiwQ6xJXKJOnl/hPKGu5Tqkle8lYtPjps1e4GsbLM5DOFg3xS7irJjAKtnO/sWZLPV/6Z92NyYJn8Zq2ChIcOsrVWSB9ofi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhzKhkqG; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhzKhkqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738867404; x=1770403404;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0pRIDrdVNSG4K9rsMo98uEIVkL0H1wo2QJnSZK6R4Oc=;
  b=RhzKhkqGBlLoHS9g5o+ltr8Bbzyf4JVPc5q4ppOi9jF6jYP3iwEXUd0e
   sujBYkFg0sm7bnkYg/hrN1aKwT9JpX6V2uLlVIJxRiWjFtv1YtSTuhHOw
   jeaP22BmxyQXf11IZYTzsBFooVEu+kQ5VDjQWpn0maV+YNV306OV33ZsV
   3LAg6dSSjVe0PxeG8rQMazZFtjiXP4IG/fsWa9KL4gl9VQ+6JE7Ms5MZA
   xT05vAEnQgJrc68pcHaa/JnWbOZSMMredF7ULdsITzicc/a+dYm97P2qd
   /z84xNbyh6dzndnYkd98NtFrecwI5SU3u17+aXzpRnayhhaFkvpKfD9gV
   g==;
X-CSE-ConnectionGUID: 0Jwk3qVKSv2jm6QLbkSx7g==
X-CSE-MsgGUID: SZHpovNXSiq6IEYatA010g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39603578"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39603578"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:43:24 -0800
X-CSE-ConnectionGUID: hQC4XrhKS/Sbes8rwdog3A==
X-CSE-MsgGUID: wZGvIj1qQ3eSXumsKoXOkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111068918"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 10:43:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 10:43:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 10:43:22 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 10:43:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOccwjiTn2j/IeiaoIE+PoEQf2WAmeS7BKIhHKXBvSAHrQErmFNjLuOQ3+RE5rr8UbO0mBjaghdPloGE/E5QjwuoyN7IXoFHiJfC4U1RKQEqUWPix4qErEQs8qzyMMkLceKFpMgf4E2wF1do0XucQdbygxFdbAztd+2b54qGyYbqJAcsoQi1eRkWiIWbaGHEBQri23bZ3SfncBRdz+aJvhC6LTm7TJmzO6U3A8khL2xW+awV4aJSY+ZhhquvNREJpIw8nz9INhxHXkAeAdYZlgEbReI8dlQONMKr5NNWUY+lOExH0ikn25iGuJOxX1cq9B3gONBHJ1K77QUxZ/3Vqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIV0BPYr8sdtYR8r3ZCuuCzZEvTBHghTA0a7GiLmAyI=;
 b=LfCWnEKYxeH0IZNxXSMgWj5asRhrCBNeJsKnUt+TejvBvUqtiDB28yCtyVnOLKOnht7JedYm9c3p/k899ubEgrzW0MGdJrLmed4Huf8Fo81DbkjpGdEuWITqCCrwd5DA6mt5jgfY3bktwoxHPjZRgTea6Ex27UsQDoXb8+Tj/hexQsCriob92efXuX+10EeVaQHDOwLOOSqeDf/TNsuzMNZ9IFSBjFsqBtEgAsdQZrs1TV1cI66jxCyxbJd42tBjY9Dcfb9bwxJw336ywpP+3p6oXrf+uc7iCEobFhv2LunH+E7WNIB3P4y8/jM3+h6CboDLwjj7POm0TGkQ/Gehlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 18:42:47 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 18:42:47 +0000
Message-ID: <9bd6b7d1-957b-47ef-8edb-88f9749fcb09@intel.com>
Date: Thu, 6 Feb 2025 10:42:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/23] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <920cafec1920358ad0c8af2e78a8f8bbd8c0b77d.1737577229.git.babu.moger@amd.com>
 <8a6fe2e3-8853-4371-b73e-6ff689ccb695@intel.com>
 <ce173fa9-dad6-4bd4-8165-d6286c661340@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ce173fa9-dad6-4bd4-8165-d6286c661340@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0304.namprd04.prod.outlook.com
 (2603:10b6:303:82::9) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: a40205c9-9950-431d-e6d5-08dd46de0cfa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE1qd0NYaWw0ZS9VemJ6L0k5Y0c4Q0lJV3NwcU1rZENhalZReTl5dUhDeWhw?=
 =?utf-8?B?YUh0TTFwaGd2c3huZ1N3NlRERm8zWVk3ZjQ1SEdxRGNmNm5HOWtGNGFTRlFN?=
 =?utf-8?B?eWIrRmtCN2R1M093RHkzWkZxL1NzMDhkdUltN2F2SWhVd2NCdDJqaVlucUgx?=
 =?utf-8?B?OFg0RVpyQ09za05QdWV0TDNwSXZXeW9oUTF6ejAxR09neHFPdWYrVUdXeTZE?=
 =?utf-8?B?YXRYTFFxcDNCYlJSMFV2YmYyTEk4Q3RvbHlHQm1vQmw3bEhNVVRyZ3BTaE5z?=
 =?utf-8?B?WWVDYkY5TzZVRGMyaXk3eGQ4eVVGSVZjdnhQQ09IaGEyOHMwdUFNZUhRR2tJ?=
 =?utf-8?B?bXFFR3Qra3FCNGF3Y001VE1UN1A0SUgxUlhiay9PQlZib3N0WkNyb25OeWNq?=
 =?utf-8?B?T28wek04N0FwUlBOR0NRTzBHaDNRL0FEMktoYi9kNXpYU2kva2haVlQ1ZGlR?=
 =?utf-8?B?R0p0TU1WbDhUOGxDV0Z1LzIyZEVWV3RCYTFBL1hXMUxpSW5QWEhxVDVNbkJJ?=
 =?utf-8?B?amlVaGVmcStuS3NVZEFydk4ySk1oSHdOVkpqeWZnOW1uU0dtdWVrWnhGS3Nw?=
 =?utf-8?B?SyszVUtYZEIzdHB0VE9MQWpOdzFCTE5lODBRVFc0d05Oa29nUXFzRmRjeVFR?=
 =?utf-8?B?aDROdmN0MU9hUVVuUUtYV2puY2xjR0hTbFVpYld4aDYreWlSdjlmOUlmdVU3?=
 =?utf-8?B?WW9BM1dXZ3RENU9iZFpYUkc5eW56bXY0cE1XL0Z6ek4yOXVQRkZVRzZsbkRJ?=
 =?utf-8?B?MnN0YXoxaUY0REx4S09kOXlSMndZa1ZobVJRenM3eDdycUhHL1lSbDBwZWZM?=
 =?utf-8?B?cGREQ3BLb2JJcGFXL1JUVTJKNUN4U2llV29VRjhpNjU0YUVmU3pOS3dqTEZC?=
 =?utf-8?B?Y2FRSW9Wd0F0aWJ6dEtZOHUzSFVldkQyc1YxUWFsN3pXdzNpakxWUHZOSDg3?=
 =?utf-8?B?ZWM0OFM1cjR0UjFCWnBxU2dldGl3S2F4czkzeDJVVVJCUUNKQ3NzMGxaQVlO?=
 =?utf-8?B?Z2dRYVVmb2NuVURFejVRdzYwdHBnUVpuejNkb1d6bXFJZVB1YjNEVk1vajZN?=
 =?utf-8?B?bVVKOGd2ZDU1L0MyQ0pYb0IyMXNMbVJ0SmpSTzBUMFFGaStJM1VzZjlselFO?=
 =?utf-8?B?L29MQTBMcGxTWTRPZXpPTk5ENFFXaWRpemRSNHhZVjVaOU1RM0tROVpZeUc4?=
 =?utf-8?B?Rjh3TjNTY0Ezd2VDc1oyRE5DcHhobmlPZHJRSnhpb2Vxc0lqREt2dWpFcHBP?=
 =?utf-8?B?VTFrZFlSRkZhbjZybVdDRVB0L0lsSHFUQTcxY3pGY2dNNG1vdUpLOVloWWpy?=
 =?utf-8?B?MnhlUXBKT2hhQVI5K3M2NTlTSEZaZ1lzVmlDekw3MWovQS85RTNkdlhxT1pv?=
 =?utf-8?B?QkV5akFNQnE4bnFjd3dxaWt2dVc4WDVKNGpZQ3hTeXpiQ2hTK2s0ZzhTQ3B6?=
 =?utf-8?B?QzFaN3VhYnRXaFl0Z0doY1NOR2E1dC85WWFva3lNdmUzd0gzY21wRVRMMDBh?=
 =?utf-8?B?aXVuRCsyeXp5NVF0Uk1YckMvZGp0SXI0ZkpmVkpNY3dmcVJzYVp5RFhkODlJ?=
 =?utf-8?B?WHZoRERpcGdxUTRKT3lNZGZ3ZHJsTWFJRTU1OUtCZmRSZ3dvais1cmpER1Mz?=
 =?utf-8?B?RlZ1TjNBVk45V09qZnZ6cVBRWDVIK015UTIrallIZkhFYTlJVVlGajlpZE1u?=
 =?utf-8?B?R1NTQnZtZGdwaDRBcGdlckFxRUc0ekpsanZ6akFXenM2Z0MwdklUa2RSR0c2?=
 =?utf-8?B?TXZIS1pQaGsrRUtlRS9FVC9vWjZSYWRIS2ZzYzBtV0NxV0k1bnBad2dsUkVR?=
 =?utf-8?B?RUVRclRkNnA0S0VlY09YUnhtQUI5UHNEbjlydE5ZRWVCQTdNUW96Z1BDT3NH?=
 =?utf-8?Q?0/LPJu/VYHz/Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWlqdWdLMnJtVS9wYlpoaWFmRFRRdExvV1laNUtSMUc5bUFHVFduS0hrS0hZ?=
 =?utf-8?B?NFJ4dmlmaDJaZDVDcHkwOWErUlZGSCtmMjV5MHd2bVR5bkJVbkZnNUFhRFRZ?=
 =?utf-8?B?ZVpRRmducEFueHhuT2NKRVdmaEF5Wm5TZXpETk0xNWl4bEhoS0pJY0lMQWd3?=
 =?utf-8?B?RzNaOWFwOXU4T3p5cEg2WEdHbmxVZE9GYmVtdkNlQmJzVVYzZEl0NnQrZkdN?=
 =?utf-8?B?OVJMa0dSK3drdFA2UldDUjVlSXVOaUMrYU5FbEszOEVzRFFGTjAxZktDdnZL?=
 =?utf-8?B?aHIzZThKRWxjUGE2RVZ0Q3kvV1FQU1UyNE84UC9vZkduRkFqWUJJVUttWWlj?=
 =?utf-8?B?WlN4SGw3b2Q2M0JJT3BESU1XMHdma2ExY2dVQUo1M1NZckpRNCttMlB2aE9F?=
 =?utf-8?B?ZEIyTmcxMlRteHF1a2pmZnBDSlluYnE0Vkp6bHBKUS9XZkdhOUxJcyttYis5?=
 =?utf-8?B?UUlTZnZ0ZWt3WkI4TU5ISUk2SFRPbWlOdlBXZ3RvUUZRYm9jdkl4bUx2aFNa?=
 =?utf-8?B?aEg4VGd4NFFCRDBrc3VsbUdYMUhqNmtpNmRxZXVOWUlUUWdvZSt0aittemI4?=
 =?utf-8?B?dy96WUxIWTdtNjVpZ2Z6RUdOejZGNk9LMGdwY215Z3FIeFVZNG15bWNmdFd3?=
 =?utf-8?B?SGN6SFJjaTlvZjhLc2NIQ2F5WHJ5VTFRTDc5MUliM0Iza29sVUpNa2huR0xw?=
 =?utf-8?B?azU0OVZnakZvVDc1ZmVRZ3FKenh1a3kwTHFlTFNjbXhObWhDd1ZwNzQvaStn?=
 =?utf-8?B?Y2JzVUw2ZDNzUFlIV1hteVhSMmZQS1ZienFwZXVRWUhVL3FJc2pQK2VCUmhy?=
 =?utf-8?B?WDhMUENOYTBRWkJNOVQwaGpvVEFLUzQwMnRjOGp4b1FQcHdmU2dWZFZ5QTFX?=
 =?utf-8?B?TUQxWUVXQ3ZxSUs5RGZwV1NKVDdYQ0VBMHA4TVVZRlQ5WFBuU1Z0bWJvUGpi?=
 =?utf-8?B?Q3RBcmFUbUxqalBmMmFsUzVTUE1kajgra1k5RE91dXFwUnFSbklxODlxYUJN?=
 =?utf-8?B?QUU0L3h2aHJCQkk1SlNhUW9Mc1diNmlFTkcrclN3dlRMb1p4MWNmT2FhcG5N?=
 =?utf-8?B?Y3RIekNsZVVMVGg2ZTV6SFJ0Z0lLanZtQk5ZYllLMG1zaUFwTmkwdzJtTm5z?=
 =?utf-8?B?VnBPN1JQaHdvOUtEdFBza2NBU1BpMDRVV3JacXV5bmVmQ0lhUTlVZkVGc3NX?=
 =?utf-8?B?YXhySkJWM3VuRDAyOTdQdHNhRXBQb3poRFMxQkNnOUh0bXA3bFJQWGdkdzFX?=
 =?utf-8?B?VERpZU1Ib09KNVcwOS9DYi9TWXVNRHZQYityMGdZT2l3NGtVUk54aERwY0Rq?=
 =?utf-8?B?cEZTd201RS9nSmlKK3dBSnFyTHQrc043UFNsRG9VVDI2QkJoSW1zWTAwekU1?=
 =?utf-8?B?Skp3SFo4NEtiTHlEazIyT1BDWDMrWXVMUEVPYWpQSFQ1enBOUmtXVDlnNi83?=
 =?utf-8?B?aXRhWFk3cUZ5OTNSMldwVzB5cWY1aE9sYzVSR1NZRGs5SHVYMEhRV1VLVGJL?=
 =?utf-8?B?TjRLVUN0QXQ2c3dxZ01wOTROcXJyL2Q1TTg0cmU4M1FJTXZ3dWpZMXE5clUv?=
 =?utf-8?B?NEpScEZKTUtJZlRQbVRjdW5aZmxFOHdMN1RRY1hOY204ekw0K0FuaHl2eTZu?=
 =?utf-8?B?Qy83Q2Zwckc3ZTkrb1c3Q2oyUlNUSVVhYXBLYU53MTNJUTdoZS9ZTnRlSUh5?=
 =?utf-8?B?VWJ1ZkorQUdvNHN3dEpiSlVrTlo3QTNpV1doc0FXeUgrR3RQK1pYOHhUWFNo?=
 =?utf-8?B?a2taNjUzRC9aejNzaXUzR0tROGtpWGh4T2ZKOWF3T1d1cWdQd3dXQzFNbG8z?=
 =?utf-8?B?UGJsYW90UnEvWE93eGxkbVBaUHBjb001ZWpMTnpwWVZFT1lLOU55cklOTC95?=
 =?utf-8?B?MmtKNmJTYkh3NVJ5OVVHeklFbXJnbXhicUJpbVFmMUIrbmNQRUNGV1JNUTdk?=
 =?utf-8?B?Tzh3Z3Z3LzJQVUhLbWQyeVhjblFGTzFvV3dJdWJ6ODlnK3J1RUlRSjRmQUUz?=
 =?utf-8?B?dCtjSHFPVFdDWjZhTkxyUXdKcXlWL1d5VDgrN1JVNzYydi9KOEpDeDJCQTVK?=
 =?utf-8?B?TWw2Z0kzeTV6ZUZNZWlkcjBNZDF6dGFxVzZTd3JDalJLTm9RK2UraHk3RTNH?=
 =?utf-8?B?NXpDOFd1YzNEV0RDRU1ROVJZTFE4YTdaSUxmMEgvYVRmNFFCR2VMaTljTWFV?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a40205c9-9950-431d-e6d5-08dd46de0cfa
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 18:42:47.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63YHjhzrxQGsAxsg7ISFhRaFYk1C6fCwvC+bqT9EQ9fyg0lReMyxrfGJ76FixH2UEtJxWqoPs5iqnEb5WhZo8MxROF9rVdoItGIx2t+RLBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
X-OriginatorOrg: intel.com

Hi Babu,

On 2/6/25 8:15 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 2/5/2025 4:49 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 1/22/25 12:20 PM, Babu Moger wrote:
>>> Add the functionality to enable/disable AMD ABMC feature.
>>>
>>> AMD ABMC feature is enabled by setting enabled bit(0) in MSR
>>> L3_QOS_EXT_CFG. When the state of ABMC is changed, the MSR needs
>>> to be updated on all the logical processors in the QOS Domain.
>>>
>>> Hardware counters will reset when ABMC state is changed.
>>
>> I find that the state management in this series is organized better
>> and easier to understand. I do think that it can be simplified more
>> and a hint to this is that it is mentioned here but not done in the
>> code introduced here but instead required from the caller. It seems
>> simpler to me that the architectural state can just be reset at the
>> same time as enable/disable of ABMC?
> 
> Right now, it is done from mbm_cntr_reset(). It does both arch and non-arch state reset for all the RMIDs in all the domains. It is called in two places.
> 
> 1 rdtgroup.c resctrl_mbm_assign_mode_write -> mbm_cntr_reset();
Please see my response to this usage in the related patch:
https://lore.kernel.org/lkml/b60b4f72-6245-46db-a126-428fb13b6310@intel.com/
In summary, I find mbm_cntr_reset() ended up being a catch-all for random
cleanup and creates confusion with the other mbm_cntr_*() calls.

> 2 rdtgroup.c rdt_kill_sb()-> mbm_cntr_reset();
Please see my response to this usage in the related patch:
https://lore.kernel.org/lkml/8d04f824-d1cc-461c-9c57-0f26c6aa96e0@intel.com/
In summary, it does not solve the problem it originally set out to solve
and it can be eliminated.

> 
> I will have to introduce another function to reset RMIDs in all the domains. Also, make sure it is called from both these places.
> 
> list_for_each_entry(dom, &r->mon_domains, hdr.list)
>             resctrl_arch_reset_rmid_all(r, dom);

I do not see need for new functions, except the one I mention in 
https://lore.kernel.org/lkml/b60b4f72-6245-46db-a126-428fb13b6310@intel.com/
that suggests a new helper for reset of architectural state that does not
exist and ends up being open coded in two places in this series.

With only one place (resctrl_mbm_assign_mode_write()) remaining that needs
all state reset I think it will be easier to understand if the state reset
is open coded within it, replacing mbm_cntr_reset() with:

	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
		mbm_cntr_free_all()
		resctrl_reset_rmid_all() // Just for architectural state
	}

I would not insist on reset of architectural state within the
architectural helper. I find that it is best for architecture to
maintain its state but I also see there are many precedent for
resctrl explicitly managing the state.

> I feel current code is much more cleaner.  What do you think?

It is better that previous versions, yes.

> 
>>
>>>
>>> The ABMC feature details are documented in APM listed below [1].
>>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>>> Monitoring (ABMC).
>>>
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>> ---
>>
>> ...
>>

...

>>> + */
>>> +static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
>>> +{
>>> +    struct rdt_mon_domain *d;
>>> +
>>> +    list_for_each_entry(d, &r->mon_domains, hdr.list)
>>> +        on_each_cpu_mask(&d->hdr.cpu_mask,
>>> +                 resctrl_abmc_set_one_amd, &enable, 1);
>>> +}
>>> +
>>> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>>> +{
>>> +    struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>>> +
>>> +    if (r->mon.mbm_cntr_assignable &&
>>> +        hw_res->mbm_cntr_assign_enabled != enable) {
>>> +        _resctrl_abmc_enable(r, enable);
>>> +        hw_res->mbm_cntr_assign_enabled = enable;
>>
>> Added benefit of resetting architectural state within this if statement
>> (perhaps simpler to be done within _resctrl_abmc_enable()) is that it will
>> not be done unnecessarily if ABMC is already in requested state.
> 
> It will be
>       list_for_each_entry(dom, &r->mon_domains, hdr.list)
>             resctrl_arch_reset_rmid_all(r, dom);

I am not sure if you are actually planning a new loop here ... as
I suggested above this can be added to _resctrl_abmc_enable() where
there is already a loop over all monitor domains and all that is
needed is to add a call to resctrl_arch_reset_rmid_all(r, dom). 
Even so, as I mentioned above, if after fixing automatic counter
unassignment you still find that resetting architectural and
non-architectural state together then we can go with that to match
the other flows (eg. mbm_config_write_domain()).

Reinette


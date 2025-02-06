Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FE23770E;
	Thu,  6 Feb 2025 23:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738884507; cv=fail; b=iyZ3PiQZCKByS7POPtIjq4qWCF1A7kfmyuEKQxOke7+UG686GCYhaD8ua+7rqZJwcbCcFvtbQpP8xPbFIkfrU0WVlHF0KXsI2QAkn3Pw+g4P9gGi2eRz4bRYOA/goaGHj+dyVUhhBA7sfuGPw6D9kdbpQ4ZaSAWICk9OOBvOZd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738884507; c=relaxed/simple;
	bh=xPK4uGDsODGrP5oxgvndKAITBteNUAOl9thi7th78DM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kYDCg6XreRRZWVWkLz06eCXnCD2Y1kr3E99le85ibZ0jqj13QhNtcgbdu+NAI/DzkRRfNImhXzDHlykEp6KrOkOuxEmBqZ0Jv3dUW44otmPYkSJ+P264G12kaotWd1VuM2vdJYqVrvZEixRw5V8+1kHp5saHMSBlUO6gONgJqxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWJRqV2e; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWJRqV2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738884505; x=1770420505;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xPK4uGDsODGrP5oxgvndKAITBteNUAOl9thi7th78DM=;
  b=UWJRqV2eXDMet6rmOYMZlrbaApGggBeqFppt5ZFcDeOTJsxE0aWbRPYj
   FZAqkCdK/wMEfs5AsXliZ6EzIN5Y+g0+MX/Nf3TtZALjd4rBxtSh3CFvC
   n6EcWb5fcFU9dfi3tHtDCIrvxHOc1vgcKHrxa93z3QKDkoQWKEKM6cGtq
   JM820jwDm8umJ9rixziEAVk4Jyv3xLpxS1U7WCdHxQEJNn1ZFp28IVObX
   auXWvhVapxAwdC3/TwX4SeliNMC5N18UPwcE+9k9kJzfaxJdAn5Ompx6U
   gOKUHdGe0r96RsYD7a/XRFo5F/sB9Q1PjjgIVJBmMHIh/sEkmTHX1EIsX
   A==;
X-CSE-ConnectionGUID: 0hOjS585RTiaFnqp0e3CiA==
X-CSE-MsgGUID: cSOLqyXhSPmYzf8t6BT3FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50947520"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50947520"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 15:28:24 -0800
X-CSE-ConnectionGUID: sTEdvmTjQJKdj5eh+T6nxg==
X-CSE-MsgGUID: gvjkqL5qRTWu6/8W5QXtPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111135431"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 15:28:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 15:28:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 15:28:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 15:28:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsyrOym/0sDCGxgVabnQFLsvkNXH4QCqIUTr5kezOwSlSQ2a8clAG5XbCqNwjJrLBGi+vS7S1gTXFJP0yBFqIxisggdu/M6ZhEBlsJOqepSaxuP4Rn0oS7xKci++40X9mo3OBgJwmIamGObiruJ5pr9PC91gwEHLBG+04aOnh0bu4NHDI6h9gIfJKfrTG99nEz97T3YZOIfpsjDtINt0cYt6ZYO4UwFCHRhR1wUTNyPK7WWf5tccQoQiWPtpZeHMuAQ9M9x9Bi67u4CAIfiQYtvHX9wDQnEaJNVuWsyjXRBMvwDogbdDeDzK5+JJqtJVbIFpxZEw/BTgNGivT5uFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q25x1mN4R/++XWQUdBz0KNkSLyDddo0p2tkOOuVvNkI=;
 b=hVs48/F3IwztgK7ntTyVqIIjozyXL+rrbNtEgp+n+xAwhvGhhBe40gnaMABCIkFuCw5jdNJD6IAJ6Dy+pAb52wjdga+IQfHswLCxsO6cG/7sOrOUhAc9lEAmUmCm+fSphIYHQubFBZ/WQ6Fau3HlGiK7Lpngy0kOVuViF5srAd3IqBy+ZtR07U5DR4sEozyPElWMNtXCACzQHvJXm3Q3baBTKZL985jLNBL61kH6CvHFj43q0lNODVk9R5u1UFD+11cM8t0SxiMSAw1y/W/I5uJU+cSOyyQXnf+lK2wI10aZ5HmJm757Dx9eAaVw7FcsDjktpQfQTwuHYwTGUoJctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 23:28:13 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 23:28:13 +0000
Message-ID: <e7642794-a01b-4ceb-ab43-a37f4e9f04c3@intel.com>
Date: Thu, 6 Feb 2025 15:28:10 -0800
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
 <9bd6b7d1-957b-47ef-8edb-88f9749fcb09@intel.com>
 <c117f176-cc91-4f1d-84ef-cf19d07a1b7a@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <c117f176-cc91-4f1d-84ef-cf19d07a1b7a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0126.namprd04.prod.outlook.com
 (2603:10b6:303:84::11) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e02961-b943-4500-4fe7-08dd4705ed00
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkRyNmUyWjVUTlpsKzArTlZORFUycW9HTTNYeXlGYW1rWWRteVp0TGJ5MHhR?=
 =?utf-8?B?TWxUQTB5S0x2THZ4ZldzT3hrNnp4bDhmZnpGa3hFazYzdVorNG5RVVhRQk9p?=
 =?utf-8?B?dkJPKzMvUnFwY2ZuM1FCVFZFRkxxOUQyWkhGVi83cmxsU3BzQi9vWTNiRU9x?=
 =?utf-8?B?TGRiS0RwVk4yWUFYRVBRTkc4Z3NrUU5uSGd5SzEzbXM1dFQxSmFaNnp1UU5o?=
 =?utf-8?B?VEVyMFBJeFZRQmZWZmRHYnNjb2NoYkNDcW0ycWh2N0RHbFBvQWl4S1ZkMjd0?=
 =?utf-8?B?cnBXWDNFUjJXdzNCSW1LdThYaGxsVmx0bHZSUndQTnFmQURJcVNweGNVSVVZ?=
 =?utf-8?B?VU03aHZNUERDT29lSGRZamRFRzduc3VEdmNNWks4d0FGYlhTYXQ3OFJrTGxk?=
 =?utf-8?B?dEttSEZoaVRHK2U4ZWRFUGRTQTA3cTlHZ0dzMzFtWWZCZjUwaEJDU1F5ZmNu?=
 =?utf-8?B?WVI0RG5uRWpjMUJUOUhRSjZxR0xwQXYxdnpPMDMzbVAyVGwyZnNyQm96RDFh?=
 =?utf-8?B?dTdNN0Q2VGZKcy9welpMdkpPUWUyeUFXcmNJbzVnSjZaZERxcTdKdWljVVk2?=
 =?utf-8?B?aitjbjlwREFXWjA4cmliaDVISEVBUXlXbURSZDBYTXBkMnM3eW5ReGwxNHNi?=
 =?utf-8?B?WVNLWThLbmtyc3ZYNm5yQ016RDV0VjQxb1JObFh6OWtmRjczVzltVjdjbHpM?=
 =?utf-8?B?YjkzejBoeEY3MmI3VEp5TjgxTkpxQlY4Z3BVYUZ3eEhpVGFUUUNpdjRXL0Jv?=
 =?utf-8?B?aUpGWnI3Y1NvdlBCcVZHT2tBVFhIU3J5b0liN3hrVWZLREN4S2xNeFlYNFBa?=
 =?utf-8?B?alo1TG9JeVdWWlYweFpLdTdUdFN3SDU4b00wREtCVXlEcllhYXNNZUYwSk5R?=
 =?utf-8?B?K1pGWHBWWjUzUFdSMW9kSm9IQ0ZsYmgwNlN4WDFGcjBmODdZaUxUMTRiOEIr?=
 =?utf-8?B?SGtGSmxwQWlWaFFwME1uUThDSWtNcHdOVCtselk5VXBnWnUxdHdnZW5lREZ6?=
 =?utf-8?B?M2RneW9xK3l6QXlycGUrdHVpTjlycmhjRHd2ZGZPY0w5RHRzK1FaNGhFVzNZ?=
 =?utf-8?B?eEUyQmdQY3V2YXhJRm15dk1Yb0VJRm5TVmxScnBzVjA1TzByVk1yYWNHbTFL?=
 =?utf-8?B?eUtOSzJqVEd6M0lUZk1hMDY5T1VObmlDRW0wYUN0UjBhcEtxa1dqaVFDYVRm?=
 =?utf-8?B?dHZXUldPZ1BVSEFBZTcrbi9lVzJmazVCcFBqVmtQRnBZTFFYdkhXWEFPWU5h?=
 =?utf-8?B?aXo5eVkrdDh4RzZyTmJPUUt5bThsTDZEVStjUDczcllZcDZQaGJrTGZmdGJ3?=
 =?utf-8?B?b1A2Z0YyT3FFUXB3OElpVGtPSy9GK1lOazMycU1XSnJJeVRkUFpyeEU5TXBV?=
 =?utf-8?B?c1ZXL0tMRzh2S3p3eGo1VFY5ckttQWhOZnNQVUdxRjJpdEJiZFVFVGsrVHlo?=
 =?utf-8?B?KytKYVpVWTFVZmdPZFlVUzRxRHc4WGwvdTV0M1ZBYWYrbHFCUDd3UHRwckNi?=
 =?utf-8?B?dWZPLytCV0M4cXZGTTVDMlA4ZEdmMlN1Wmlubm1KLzQ1OUxwdXk2MUVPU3dE?=
 =?utf-8?B?Y2NKdUFaaFoxTVUyOEdvZndtUFp4MTdTSzZsa0pFRmFsY1VsUk9CUks2UHJG?=
 =?utf-8?B?aWdyUmtQZGxnUGpzVS95cFdpUWp4SDREdjNrdkJXUFNFL2RLcmh2TUl6Z25p?=
 =?utf-8?B?cU13OXFFMEdENkQ5elhkaFVDNkJCQVJQU1NzQU94dW1tWmh0NkhQRVZWTFdV?=
 =?utf-8?B?ZUNHTVliODJ6Ym53UmZJbk5odHNLSXNFZFRBMzZDSTNqV3JzV29EcmNCcy9D?=
 =?utf-8?B?eG1ZV1FGS01KOXlZVFhoQmVxclNJanhMMUxmQTZzdHl4UThHTU56ZkdWNjVG?=
 =?utf-8?B?UXk5MkFnUElIQ05mZDgyWEhJSmRYTlRHMlJGT0t0MVM5ek5NaDFSWjlWUEFz?=
 =?utf-8?Q?vuRDdx85cGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnpOeXd6NXZhbFluVkUyWXJEemhja0JZa21hSXJyMnZSUFIxVmExd05LdmFE?=
 =?utf-8?B?WnpxM1A3MmNpVXdNZ3JOcWw2ejdCYU1PYWVpNU16VnFGRDZJV0F5aytCKzR6?=
 =?utf-8?B?T2Z2ZjhSMUs0aVowRDRrL3VMa0k4bTBqd3VFSWN3TU5WTENxSXNPeDlNWWpP?=
 =?utf-8?B?RmJvTnJteEhmTmZzWU96MFdwTkpOVnZxaG5MdTlpZkFKVHJxVW1mdFVubkti?=
 =?utf-8?B?cHFzN2pRTG45bitqcDM5NktDY2h6VnBvbWVZb3Z2T0J0cVkwVi82KzNIRWdn?=
 =?utf-8?B?eXpPT203YkhsSHZYT2RGMThFTlBldDJUbi9oVUh0NEcyU2FoR2lDdkhRS1dP?=
 =?utf-8?B?QS9JRzFDOE9sc05yVzBORFNqK2ZxaXRHT1V4UXFXQngzdklGSWpsUERDZnc0?=
 =?utf-8?B?REJrdVkvVHpUWXZYNzlmbFJSdkRDNWEvUTBwNm9UT09LSHcrR0FUYlEwNHI4?=
 =?utf-8?B?cDZzUktRRUl1R1A4SERLK0NlSmpHazQ0TU1RZ2ZkRmYvVktkNEZUSi9zQ29H?=
 =?utf-8?B?aDM1UHZrK0prNGRybEwwOGFFeFlqR2FxVWJQVkRUS2c1dGxVZVBqTjdOQ0dX?=
 =?utf-8?B?REdRUkJ3L2lIcUNHelJPSW5XL2pGNC9tbHpSdDVnRW5vR1dHcUtXaDloeEd1?=
 =?utf-8?B?QXpjK2hSMk1kWkpnS1BjaXdLbFZPWGx6VDZEVmdBdHp5d1FKYTNNZDJ6ZTBa?=
 =?utf-8?B?anZOa00wOGNLZFpQaGI3YjcvM1FVUFB2Z25qc1lLTzBnNUVIUDl1QkZxK2FH?=
 =?utf-8?B?ZGhnQ29BMC9BTHZTR2lpNlBjQUhZR09CTENkNWRBa1BiUmlFR1A3TUNGcVZs?=
 =?utf-8?B?aEUvdS8zcXZOMDNzeC91UkFxU2psNUNFR2FFZENCbUI2TXg1MzBxSG4vNnBj?=
 =?utf-8?B?VU0yaEZ6ZnZyL2pYMzVEQzhGY3F0c0dWTk4vT1pnSVZyeGh3aGdDZFFaTnc5?=
 =?utf-8?B?NHJZczlROVRiRW0yYndBdmFUL0twZDZZZjZjUlpzODF3RndXMHJwcDdCWXhN?=
 =?utf-8?B?cVdZS01iSHAzNGhMZmdUd243ZmlvWmE0YVNQSDB5aHBBbE5PMHBFd0kwdS9B?=
 =?utf-8?B?b1I2a1lzQ0xSc3BQOFdod0Y1UUV1ejlFWjZCMWErLzVIQ2RWcTFMWjRpNnNO?=
 =?utf-8?B?OWl4dU1BUWxNWWdqbVYxTC9hRU9CNzFWd2NUOFNUZ0ZRbklTcFkrRGZQOUN5?=
 =?utf-8?B?eWZtQlFRSXFMZG9zdlFxalM4SWx3R1ZFQm92YjR3azdMWUk2bCtHUFhuaVBp?=
 =?utf-8?B?bDBPM1R4L0gvV2M0cXAxRU0vQXBvV21qSUdRY0RwMk0welRTYzlxQUlCenE1?=
 =?utf-8?B?eC9pWG1IeUNWTnJQd0NTSXhOS1BzcjNmMUZrZUMvc0RxaVNxbUovaWZjNmpn?=
 =?utf-8?B?OXRhdDdXTkUwZkp5WjJ5dENEdGFjcmgxcVA1alZsNkdaQmh0VExoSFVabksz?=
 =?utf-8?B?MzJXMFJwcVk4VzhDNVZaZXdRSFlMYkU0MkNycVNpVk9POEUvbVZVakF5WXBp?=
 =?utf-8?B?T0xLcVZHTDhUYWNJYXc4b0VtckVFZ3JhaStKUlpnbWRMSUxGZXU2U3FZQWlS?=
 =?utf-8?B?RnREV1dFVlBjbEdrdHhKZlZyVHVyK3RWWHd6dkRzendpUUFBOGV4cW9oaFk5?=
 =?utf-8?B?Mi9ncTBOUW53UEF4T2tudHl5ZkI3d2lGWDRyNUJuQWRnUWpVbWlieFFFVnFO?=
 =?utf-8?B?U0syT2xBZCtLOCtzVmd3aEFMaUkwQ2o4ZmtWOHIxTjg0ZWZrbGoyeThQRUhF?=
 =?utf-8?B?U1JpZXNiUzBTMkowRWsrdlYrWXFUTkt0eE9NcHNBQkdaWjcvOU1icXpDdVdr?=
 =?utf-8?B?Mm1wYVJRTHlKOGp5djIrdWRHaisxUHFaUnRVbDdvZzJFTzVGRnFnem9pcXNC?=
 =?utf-8?B?SUtOQllsRnNZQ2dpMWUzc04wNEs1ZUNRUERHMnZzNkFVSmhtNFVTREFyY012?=
 =?utf-8?B?MEdEZ0F6bFp1ZmhPK01UcC9zUE1MZ0s3RnJnQlAyU3JNcnpZZkl6L1BQc2Yz?=
 =?utf-8?B?anpHZHkxSndQS0VhbFRPcyt6bG8zN09pTW1rbSswVStJYUJXMGFmVWRUOGp4?=
 =?utf-8?B?VUZ2ODJPdmx4STBLbVJNL3FvNE4xWlJkdm5LVGUwd2ZTRzB1ak4xTkNxcmt1?=
 =?utf-8?B?elJXYXRrRmswTFMxNWc4Z3FKUnhMY3kxdFFmWnJXOG5hUlc3SVBiUDEyNmRO?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e02961-b943-4500-4fe7-08dd4705ed00
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 23:28:13.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuUZdHobjWUavIs1zjynTOn/5ZQtoyc6HtOH/7gomgtKys5vTm3BR26ZxbX9mFLXzK+9XB0nxRScPKCKUISTpyoJ+C4MgL2dzgRm65D3XSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
X-OriginatorOrg: intel.com

Hi Babu,

On 2/6/25 2:57 PM, Moger, Babu wrote:
> On 2/6/2025 12:42 PM, Reinette Chatre wrote:
>> On 2/6/25 8:15 AM, Moger, Babu wrote:
>>> On 2/5/2025 4:49 PM, Reinette Chatre wrote:
>>>> On 1/22/25 12:20 PM, Babu Moger wrote:


>>>
>>> I will have to introduce another function to reset RMIDs in all the domains. Also, make sure it is called from both these places.
>>>
>>> list_for_each_entry(dom, &r->mon_domains, hdr.list)
>>>              resctrl_arch_reset_rmid_all(r, dom);
>>
>> I do not see need for new functions, except the one I mention in
>> https://lore.kernel.org/lkml/b60b4f72-6245-46db-a126-428fb13b6310@intel.com/
>> that suggests a new helper for reset of architectural state that does not
>> exist and ends up being open coded in two places in this series.
>>
>> With only one place (resctrl_mbm_assign_mode_write()) remaining that needs
>> all state reset I think it will be easier to understand if the state reset
>> is open coded within it, replacing mbm_cntr_reset() with:
>>
>>     list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>>         mbm_cntr_free_all()
>>         resctrl_reset_rmid_all() // Just for architectural state
>>     }
> 
> You meant "Just for non-architectural state" ?

Yes, thank you, what a confusion causing typo.

Reinette

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298AEEC3;
	Mon,  5 May 2025 17:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746466819; cv=fail; b=hQvleZxVTczQ0QIesQfMI6nBYI0+69XfiQW912yMK8dnG6Li8SLpzb6ClVH+W8xEsO2TMQI6g6akRhEvOGYECtXFGG8M2QUjve4uJNQeeM4IlqZBY89BgU48gP7B+6kPjvf06c/HOaLAmjF30UVqrlRs8/nFlcDU5JEN0KWiy0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746466819; c=relaxed/simple;
	bh=o2EVxsDFTJL9dAqv5eKxf4CSy6l/biFa6vwmwnSAneg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U3j4CPlFyH69Rq/0XDfzmT4p1LOyFeEJ46PZ9fp9UqZMSnAxTKPYmZcyO5xsJABtfNsKJ7SxzcL0CzUpJwpl4aLUXeo8nLRZVJJL5WGF0EdRo9oqkWL/PqjZjV1A/5eHxoTxlwQ545GFJvIbJqDQHKaRNLMnOD+81WgloVpO2Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfOV7z9P; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfOV7z9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746466818; x=1778002818;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o2EVxsDFTJL9dAqv5eKxf4CSy6l/biFa6vwmwnSAneg=;
  b=OfOV7z9PJzO1mhu6d97D2tTY2ovQ+nyDNJnx7baz+VDpWH4tKjEhksJN
   fNPYEzy7PcAW5iXx9GGja1I60jMW4PVrIayUjC+gdm3L16kvee82DaTrU
   my0bOVLvj7fZTDDDdOJZOP0F/mQK/KpG0wqbnNGfaCCQmKKpN28DeUAa7
   cdpX+G8yau4igdp86e6SJVseL9do7EsBHM9+JtiiJNg4ut8A6q9t46SqN
   1CDeBNcDEHMqXG1D8qgAlywcd2PKp1DVkyBFJqr+9JlEcaIRHJ9PyI7e5
   a8J/xi5ZHW8y0+uarYO9EmkZsOi+hAd9gn7RMGzIgBiEBt2pNFymQhtUn
   w==;
X-CSE-ConnectionGUID: Szm9qxD4SZeqqXowO4XI1w==
X-CSE-MsgGUID: tXE5o8pJQDuHqyAXA/2KjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="70592966"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="70592966"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:40:16 -0700
X-CSE-ConnectionGUID: vIefFU7PQ7ejnq/VZYQCpw==
X-CSE-MsgGUID: Hfv+M30sSDyg+pocES3JIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="166373898"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:40:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 10:40:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 10:40:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 10:40:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJfMe29Tl0LOm9NmiIIlPLNcw56yKI5RShtrEUv6LfmZdSstqb9hW7Z6Erssx/ICJ1vnAIgr+9ZuKcmqAHRg4dZ8bJF+68CtsWrcPevUoM8Z2aOJt6Hux9JqeNrNFH3JUtsv43Ni4OnqHYcQ8QEE+l53DKsisTNXbiEb1g0qej0ifs3itrLWY3gEGxHv5DRjKcnEW8A7N/usnLTyvb8QAr5Na4HlGWkzdNeF/lpzxDXK0YCaPL1mmEeRhPuMXd2/3gJim4TGIGlRMst+dGNpHYm6wIt7i84RbqKMHwasesJMJFY6XBlgmtRJUcwtMv1oGkg3GfvHLUcDPE/bpEXd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dq5E5EcKZ+KzQCBBRKu4wm+zW/iE3IzZpgBb6ti6Ck=;
 b=lR3VO5JIvr/BPSTHwdKhgcZpg5s131E5qck6FCBPLVacLF2LQpxJqX9K6b+XchSugzftOdCZ456J29cqdDGWW43bLOmRuu3gr+U1Dqqwfuzh3nIbL+Am3DxuR2uduOhRrICMJChjI9MjSJ5CLzwfqdfcr+7crLJ+eP2NPOHNiddWFxApckA6XptsQScxsz1U/RtNCA4hens48PqmQsTjWjQSO7uJgWPKDowPa+sB5Vmtzb9Rf2Frxjo99Fr8yhPEY/Slpq2CRkZaLak2QmdbkR0IHueuVxaz8Tc7LN7iorslsH4CuUzA7qe8DWEdVou/N2sIWxeUXYMPdCClxw2c/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 17:39:56 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 17:39:56 +0000
Message-ID: <e0e72b1c-40bd-4079-be89-3eb2339d893d@intel.com>
Date: Mon, 5 May 2025 10:39:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: "Luck, Tony" <tony.luck@intel.com>, "Moger, Babu" <bmoger@amd.com>, "Babu
 Moger" <babu.moger@amd.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "thuth@redhat.com"
	<thuth@redhat.com>, "ardb@kernel.org" <ardb@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"mario.limonciello@amd.com" <mario.limonciello@amd.com>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "seanjc@google.com" <seanjc@google.com>, "Huang, Kai"
	<kai.huang@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, "riel@surriel.com"
	<riel@surriel.com>, "Li, Xin3" <xin3.li@intel.com>, "xin@zytor.com"
	<xin@zytor.com>, "Mehta, Sohil" <sohil.mehta@intel.com>, "ak@linux.intel.com"
	<ak@linux.intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"gautham.shenoy@amd.com" <gautham.shenoy@amd.com>, "Xiaojian.Du@amd.com"
	<Xiaojian.Du@amd.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "james.morse@arm.com" <james.morse@arm.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "peternewman@google.com"
	<peternewman@google.com>
References: <cover.1745275431.git.babu.moger@amd.com>
 <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
 <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
 <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
 <SJ1PR11MB6083919B4628C4957D099667FC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <d84d7299-d0d3-4027-b256-f1e24d8423c9@intel.com>
 <SJ1PR11MB60838694300279E4A0E4506EFC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <SJ1PR11MB60838694300279E4A0E4506EFC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0031.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::44) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ef27c5-d3a9-4afc-897c-08dd8bfbd978
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTJOdUdMNjVNNGxTNlpwT3NYZ1RSK1VQTkp6U3laSlIrenhMdkJ6d2dzOUY2?=
 =?utf-8?B?T0pNYTFQaGswUzhiM2JVckhIbkpLNE1mRktPbTQxaUdLeDllTjRmRHFpcjBk?=
 =?utf-8?B?R1d6aUIyRUtYRjZ0NGJHRVE3N20rMXFFNVhxZEhWUGJ3cWpNY2NsZmd1eTN5?=
 =?utf-8?B?WUUvSW1pU2N2M1pmZ3BoaW5acjlpTmpmQ2ZxanczSmxWUzVpK2lwbTZVaEUx?=
 =?utf-8?B?NURaODFiWFFmOUZkOW41U0tKYTg2TzJOTktLTUlqeGEzRjh1WmxCdDVibWFN?=
 =?utf-8?B?YjlaS0Qyc1pJY0l5Z0NxWVZMZGwzRUpCay94OW0wOTFBTUxDZzVXdWtSV3hB?=
 =?utf-8?B?WXNkNk1odXFLb2NDK2g2MnY1SitPS0ZuUUR5bTl4cGpQT3JKem43MEtyTTlj?=
 =?utf-8?B?a0tRdFFObU5vZ3doUktsZ2xzU0NSelNVVG9jUFdEdEJTOVBLU2k5RlpHa295?=
 =?utf-8?B?YkdPYlV4Y2NCNEJjV0hFTi91QStibnJvMk03WVUzUFgwTDRKVkc0cDZBRWJa?=
 =?utf-8?B?czFtT2FNS1dMeTFydjdIMWc0YjZhMG9FNnVUcGhaZFlXc2szRVl1YUxpWWZn?=
 =?utf-8?B?bjIyYWZqUWM4S3U0MUl0WFovRGNOSnQ3ZDM5c2FORlppZUUrU2tjc3NPN0tp?=
 =?utf-8?B?RUVnUTYwc2ZrSFVIR0d0ZnM3RmUrNkJSNDJFSlNUeHl4THJhUmMvdFB3MFd1?=
 =?utf-8?B?Q1ZkRVBEWXRveUd1dXdvUG01cHRmcnJ0b3lKLzByTEd2Ky9tQmlPWmFRdGRu?=
 =?utf-8?B?MjhrZDY0QkhJZExmOWVkamJvVUx0VVV6QzlCR0xGNDNjNFVaRnhnMnExT2ow?=
 =?utf-8?B?SjVCWXYwSFd2UzJzUXJpR0xFYXB0TWxITGI2T1RiWkpGOHpOVUhOMC9vVTQw?=
 =?utf-8?B?WmF5dTc1cmUxRWRGcTNQNG9WbVFadXVuUUF0RllxNWQ5WHhFQk00elpFYW92?=
 =?utf-8?B?R0RLMmdlRTBwZkVIR2VFaDJyZFM0U05iY2gvWWtTMlBpeUY1UStmbVEwNHBo?=
 =?utf-8?B?QXNIekVVRm5reEJ5cjNCNlZJa2lNYTd4LzNhU2p4bkIvQ2RhdXpHTUJuWEFw?=
 =?utf-8?B?YlhqOTh5ZkUvcndXSDZxVkVlWW5rbnVSdkNRZDF4OEdIOXFkTEY3UXk2Z0pk?=
 =?utf-8?B?MkhFZ0RSd3JOOFp5Q0lDVmV5QjVlN1c2L0RwcXBDb3JoRVRkOXgwRlo1anlN?=
 =?utf-8?B?dVZzSlJFb1VjY2pOTkk4U0ZnM2dXQStzWkQ0R2I2ZHJiVlpWaVFjUk51U2Ji?=
 =?utf-8?B?QUhXOUFDNG1mY1pKOGRmZ0lnUFU4UzBSRmdkZXh1U0Z5TVp2V01mblZlZXZp?=
 =?utf-8?B?cnNYZXdoQWdNNlF4L3Q2aVNjUFdLRWZ2SlJBSDFxK2NNVGFFeWVadXMvQXp0?=
 =?utf-8?B?cnRxZXhvK3N3bytFbWN4cE54QmFhTDBXcmRIV1lvUG1iZm9lc1FBelRPTEZl?=
 =?utf-8?B?aWlBcXFwNUtiNlZqRFZSc1V6dWk1bTRJVmo5N05YTWR0VXc3QzZLaFE0ajFp?=
 =?utf-8?B?TTFrWDdOZUIxTktPYjdtcmNtNCsxVzFLcFFRSnBDNEpGMkZYUEtDbUMwdVl1?=
 =?utf-8?B?L2hUSUhyZFRGUGxvRFI5SEk0T1I3VGFxV3MwTUhUL3RsN2wwRnlXYnlxNWFP?=
 =?utf-8?B?K1JYYnY0bFZERXl6VjRjc29mUkhYTU9LUjl3UUtXYnZUR3N5eE5ubFRZMTkx?=
 =?utf-8?B?RnZIdXRvT3ptQ25jQkNncTlldCtobUtBaTFaTUpZTUdFQnpRWkpOdW1QUUZ5?=
 =?utf-8?B?VkpuS0FpK1E4MmJBUDJUcndaSEtDODNxWXVxUnB6Wm5vNjRzaWI0WTZiL1VV?=
 =?utf-8?B?WHQvN21qdWkyclFReWl0TFQyMjQyVUFjazFsWGVneTZZMm5wVWphRUpveDJ6?=
 =?utf-8?B?V1BNMURMM1F5K3Nna09iZlpmeWl1Nk9iT0xZb2cvUWIzNjdKTUsrTWZYQkZH?=
 =?utf-8?Q?QGrp8D4r414=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MThDREttUDNJbHN2a1NwRjF0Y0JRKys0SW1UQ1RrdWxpcVlxOVFTd1NmYlVo?=
 =?utf-8?B?RFg3UlVLUStwQ1dQM21YbGJBcURkNEt5aWRaVG0zT29sL0dMazgzc0ovRko1?=
 =?utf-8?B?S1BuR0J3NDlrY0k2THBWOC91NXRFRlZKbkxreXNlQ3lEUmVnOU9tY09pRDlV?=
 =?utf-8?B?UU5GNE8vc3pmeUtrbjB1Z0dHaFViZWVSbGhkMXdtMHJDODJvWUdnck1EQ2tH?=
 =?utf-8?B?UU14b0k0TTVKTGZGYUR0dGlTRnNBWDBZQnJZdWJYU3Y3TEFWVUVhNkptNFY2?=
 =?utf-8?B?ZVpVSVkxQTJVemNORVl6TFlUcUs2Zkl1S29lU2ZSdGZsZEowQkRpa2tPbDhW?=
 =?utf-8?B?dmRMU2MydFhTRjRlVW81QXV0d2M2US8vcmZpTWRmQmhCZ1hoc1Vqb1NQT2Jx?=
 =?utf-8?B?KzEvY1Q5TE42UnZicTBseXg1V2M0UzVXdTJhdjNNVGNEUFc2VTUrOVcreHNY?=
 =?utf-8?B?akQ5Vlc5SjN1SWRCb3RDTFIrdFhQK0E5cjJpaGNHTWZicC9SZFErUDlWRUVM?=
 =?utf-8?B?cFFIdElGRGYwMHdKVXQrcVZxNVh5QjV5aXRFVVJFVFgrRitxR0pEb2hGZlA0?=
 =?utf-8?B?d0FOV21TOGtUd3FpbWZYbU9OaFZZdFZlai9NRksyM3dhcnVEV1hYbHF6WEFR?=
 =?utf-8?B?V0hoSW43c2pkdE1kOGxmckh3eEZERGdqbzlHODl6VHpqaVVxRjNvSnhSeWpU?=
 =?utf-8?B?R1R4bnAzeXM4NUZjcFFpYUZaVnlxMU43MzE3MnNxM204b2oyY3RmNFNuVEFs?=
 =?utf-8?B?bVArOXR2dzVrNmtVMHZiOTZUcWR3VkIzcS9JOG1KWkRBcmM4aEZGV0lrSzN4?=
 =?utf-8?B?UzZ4bWJZVlhhYmgwMU1sN3FyRXo5L0JMVlhCNCtrRXVuZmpRaWRzQzhsZG13?=
 =?utf-8?B?OG9vaHplb3hoTkNwVEc5a0FlN0xmNUxPWFdCQ1Zlb0FWbXZ6QmNXWjNKSmRL?=
 =?utf-8?B?cGdiQ2c4U2pOYStWcWJCVWJ1a1YxMHhlYUlrdGR2eUhUZXhrMmFFazl1ZGh0?=
 =?utf-8?B?aElnVXEwRmhETE9RMmJVNEtkcW5EN3NKTkFGZDN1QnhwVGpSbWxLVnNUUFc1?=
 =?utf-8?B?R3lzc2N1VW9Rc1oxbERZSVRnbGdpR1BDUU1CdVIrNldXN1ZHSjBsNUxzMmVB?=
 =?utf-8?B?YldYRHdNcDRuTkZQK1lsRW8xNUJMWjAybTNmQkJjSGxvNWFBSzFtaUxvbE1J?=
 =?utf-8?B?RzZEZ0Z5VG5SUGJtdEFjS3ViblhyaTZ4bFVtRVM5QzN6U0x3WThBL2pMVzAx?=
 =?utf-8?B?WnRodUwxUWlUSVJRb1hmUWJYU2JxQXcwanhvL0tmMllJbVJsbk03N3AvdWdy?=
 =?utf-8?B?UjdQYW1TVTArL3Y4VHl3bWJRRlh3U0FRcngvekI1d2tTc1R0QTRha1ZtS0Vj?=
 =?utf-8?B?VG1lY0FrUmJJbFI3c2Q3REJNQzd0Tmx6MkJKQnVIT0VDdlp5T0ZLR0w3T0pr?=
 =?utf-8?B?ZDZkVVRmOCtJd0dOOVBuNDRaWDVaUzZ2U29CZjhGQTM0UnE1SnlWeHdjeXlj?=
 =?utf-8?B?MkdHdW5tSmkrRVZtUlJjK2lqZ3RPSUw5V0RaNzNHeFhUWE53RmVIcEFxN3h3?=
 =?utf-8?B?ai84NldYZU56bmVwTDYwSDluNHhvTFM4UkJObm9RRHYwVndkNGQ1UkZPcDB2?=
 =?utf-8?B?MWd4T3lySWJlOHA4OURtdU9SdTZRalpSN3VKaGMrbnVLb29JZzlacE1aNVhR?=
 =?utf-8?B?Zkh3OWNzOXdUa1JiQktCQ25icGNidnEzeWZGUi8rWThDYThYVjJCemFyUkRW?=
 =?utf-8?B?WkNJTm1lemtTVE9WLzJTZkI1S0w0eFVmdHFFeG55TFd5RWpUNEVMNWMya1Yx?=
 =?utf-8?B?R0YwYXp6Y1BubXAxK0dqeEhtOTE3d0hRMlhHVkNFeDk4YXkybEdwdVoyWVNH?=
 =?utf-8?B?RFF0Q0tQRE5TcGdXUnp3QnR0ZFR1NXZmSXoyYUFhNFlybzQ5TllYQ0pXKzdW?=
 =?utf-8?B?UzlmT0x0VHlwUi9lNnQ5amdQSjFveDJ1L3B3Y0M4b3laVWpHRllOSlNDNyt5?=
 =?utf-8?B?NE1FUzBpNVlzenhWVk45V3JCandQbGliM3B3OTNXTk5qdHZsRjZkN0ZqT2Fs?=
 =?utf-8?B?M0NSbFhjTjMxRkZlUmo4QkJkcHVHeFhLaW9yQjd2N0VBNzVSNGRLSVBlT3hZ?=
 =?utf-8?B?bnFoc0VkWjJOYXUvaGNBYXg4eFhMaU5WaGh6VVdNUjJVRDZ1Z0lVUFd5alAx?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ef27c5-d3a9-4afc-897c-08dd8bfbd978
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 17:39:56.0114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMCA3bb4exdNiqYLFgLdE4XnYlW8PLKWZ978hwkGZoE6NCNDKfyDWC8miZJGXnok2q34wlcXoPt7vHLC2xluYeu3E4u+HE/fNmOSUgND+68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
X-OriginatorOrg: intel.com

Hi Tony,

On 5/5/25 10:27 AM, Luck, Tony wrote:
>>> " Non-CPU agent RDT uses the RMID and CLOS tags in the same way that they are used for CPU agents."
>>
>> As I understand AMD uses a single specific (the highest CLOSid supported by L3)
>> CLOS that is then reserved for IO allocation. While both Intel and AMD technically
>> "uses CLOSid", it is done differently, no?
>>
>> Specifically, is this documentation introduced in patch #5 accurate for Intel?
>> +             The feature routes the I/O traffic via specific CLOSID reserved
>> +             for io_alloc feature. By configuring the CBM (Capacity Bit Mask)
>> +             for the CLOSID, users can control the L3 portions available for
>> +             I/0 traffic. The reserved CLOSID will be excluded for group creation.
> 
> No. Intel doesn't reserve a single CLOS. It allows to assign RMIDs and CLOSids
> for I/O monitoring and control. Different IDs can be assigned to different groups
> of devices (the "grouping" is dependent on h/w routing to devices, not
> assignable by the OS).

How does this work with CDP on Intel? Can CDP be enabled for CPU agents while the
"code" and "data" CLOSids be used for I/O control?

Reinette

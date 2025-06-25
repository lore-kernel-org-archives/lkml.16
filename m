Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F928724B;
	Wed, 25 Jun 2025 23:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893872; cv=fail; b=cOtI3QKggMdxZ9BkdmjRhLyXf50LSBwFUVEW5l6wkaJCtGRw6pv1ijQagB0nQX2p7q7AD64QFcUAOJQmZUrKHJdwcagCRBIN86HKe4RDTqYxQbuMxhoe5k1Dck2TDBVsUkAhWNp+O3e6UpFhTTDDYMcPCVUxRBJ+iWpxNneaIRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893872; c=relaxed/simple;
	bh=o+IxcNx2v2HhXXJsPwiIcRfIfR4CNw0kaLFS08Vmz1I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WbjrHbrJc0qephDrXq/6H7ZVWzzInWu1OhTUK+Vo2+5piw/RKt4n0ACwj8aDoAO2wkQ2aKky+m8f7iKeXU/Fv0YQm7mgnJr25FmZZQC37pfSnI1Eysyqf1kQpprmeuOEkAs4LZSihSq+UV6lXpzctarU6bIF7FmuAUdOnl4H1Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNyB/Yyw; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNyB/Yyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750893871; x=1782429871;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o+IxcNx2v2HhXXJsPwiIcRfIfR4CNw0kaLFS08Vmz1I=;
  b=NNyB/Yywg3KaEzW2vNvkqGIhYeQybRloIoRFisYbLHXkaPajcgJpoXYJ
   GmFXl1TtEdnsEstujScFTk6dzYrUX1wSCUoFx3WVhMGDf0LFCtm4gLgdR
   OyPRw8f5nqL821epbsRQ/EceXV6WwbDaT2v4TNOYB1Q55h4qTEYVnzhSr
   tFwnV9xAIHpVaK8vjTbt4T3EsbqowujXT07iht3GyGR8tpHBMzzDvqs1X
   s/NamJXyW7dL+gYnA5L0+5R+NaievYdcxE3wfJA8uUUZCJS37Z/jko5JK
   XTkFeV1GEVlxuUQ0/GK5ZPEeXZRIWL10rUvDqwEliFj8n8W0rVPxZ6yYq
   Q==;
X-CSE-ConnectionGUID: C+Y1Tf4aQGaptBP7OIY5Xw==
X-CSE-MsgGUID: 23KgTbdSSqOKOAHKDjieCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="55806046"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="55806046"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:24:27 -0700
X-CSE-ConnectionGUID: P9k9e0ckS+OiUavpNHfWKA==
X-CSE-MsgGUID: 92tEqfo0R6ShdEvvf3eJAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="157850292"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:24:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:24:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:24:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:24:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOgU2Ja/erVZAFn4CSG3kH971itzyFk3Iq4z++46fwfxFFFZfxAPwxWA/2cbsp6BupCRQT4GGQ7k10Nl7BM5ipilVjoh6+rY4ZQz3EgtyS/oi3Zsk4zKnoh4AwMhOkY1WADRUFe8tlsPoBMakUUHKC+UMH6AH2pIfL6RLXVlMWWCzzOMEuXNRm1VCxniazIa17vEvKl/78ZtCZ3XGFfMQTbyquLuKwLu0GI6sWLsb2ZAW48AaiD9xIjFmCIWT6dbdoydWwL7qqc1mz+m64tgOVIbTUtIfeEHN/sY2IfOKqPfOndEBuwF9y4jaDknTfLG10TuBbq5RpC9D5nU0yp9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCYA39dfzHbb7KVfsC7J6QNg/17+Q60wdK8dX27kWQU=;
 b=VtOMpZPDAkNU322vH4jAF2z5eK9eIdAl9R43WCB3zRI8iHaaRDdHrHLV45bk5/uqzsFuKu02Dho8LdWpzTTngxqx+pxIE5GkTho0o9C5FFPoWKZrFHXNcXsolGX6OVZaTtIvymJg/ymGB3QCEnibCnHJEWrIVpNCXer+qNidcKynQoV3pWGam4+enB7DsnmEftO9MqeFXkGdHl3jb6qGWdfwRchYKCVKsUAr2d1/9B2RulrVDRiMf257EfRrgjanKSqKUfEptgr8FksREyQ5L4VffFxjMFo8FTZ1FIrTV8nMiKfr/9LNCl16BD9WLSNjKY32IOaCF4XxeVvfUEhMSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM6PR11MB4529.namprd11.prod.outlook.com (2603:10b6:5:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 23:24:22 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 23:24:21 +0000
Message-ID: <dd4a1021-b996-438e-941c-69dfcea5f22a@intel.com>
Date: Wed, 25 Jun 2025 16:24:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 26/32] fs/resctrl: Introduce mbm_assign_on_mkdir to
 enable assignments on mkdir
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
 <a44e9063c26c2c33701816d09f488cec522f2530.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <a44e9063c26c2c33701816d09f488cec522f2530.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0027.namprd21.prod.outlook.com
 (2603:10b6:302:1::40) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM6PR11MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: e51e3bf5-9cc1-437f-8db9-08ddb43f6a69
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eC83cnY5OFVoUnhNRUhML0gyOEFtL1NuOW9ocG5rZXVjUkgzbHVCZ0QydGw4?=
 =?utf-8?B?NjBqdm8rK1VpNmVoQnZsS1hqWG1QMXBsN2puQzNuRStoNkJRRDJKQ2FUbXRS?=
 =?utf-8?B?THdoQ3Job3ozM29yU3M0V3RVVjYvZ09GRmJIcGFzSmFKSTRGQTRUcU95emJq?=
 =?utf-8?B?a1JnRG90QTBwWjZKdnhCZUUrNVVQL2tlTVRpWFdRYnN6cldHUGVwU0JyQjlL?=
 =?utf-8?B?OGdhYTFyQXZ0aUtDUDdyTEFRYkxYYkNjZEdzY0VQUnlpNTM0RnJvSHVVNExH?=
 =?utf-8?B?Z3lyWmtzbnRWM3BpejhVSVlWOEpXZm5qcyt4MXk1bWl6bWtYZ3p6WXo0SVEz?=
 =?utf-8?B?cmxDLzJnMDhMby9uaFhVeUVIYWNGVktodjNUZnowc1lOZ21sWDVSVnVDR3lD?=
 =?utf-8?B?SW5oUVB5TlQvQXZRanRDd0FDU21aY2JDOWFkOHRYa0s1V3VCN2c4VjdrckxB?=
 =?utf-8?B?dFN1SEJpaU1ZbzFaRi8vMUlES0dURGpWMXFKTDNVY2xRaUdiaE00T2V6emJv?=
 =?utf-8?B?L2VZYW5XUnFEQkRuNkZMbXNyWFhtWFp4RlZ4VEFqdnBBT3lmRHhYUWhJcHdi?=
 =?utf-8?B?cUl3ODluUTkyNHNMMTZyOTlXSzNBQU5CdkxGdlAzVEJuMzVVVFB2c0xPUXU4?=
 =?utf-8?B?WmZKdGNleEhNc3RCb291Z09udkh4dUwzbUdpNDFpeDhKd3pXanMyc2IxM3Q1?=
 =?utf-8?B?MGF1dEtmSStDVmtxUVI3b2hMZnFCQktJZHNpbE1lL2MrN082Z3Z3RE9PQzhw?=
 =?utf-8?B?TGE0bWdHREJvaWpTVjZIdnhSTUZ5Ny96Y0tia0xCS2dWMlZRYVVURjQ1QTJt?=
 =?utf-8?B?WU41WWxGOTJpZm5ETC8ydW1PanVEZnVzemlSUEhKalJCV1o1ZmxSUStvZEpi?=
 =?utf-8?B?UldTbkF6bzkxbmUrc1lvdTZQc2R3bzl0MkVFVFBrTGw2bDY2ajl5bGhVYjJl?=
 =?utf-8?B?cGxBTHNEdjNCMGduZ2lTekpFYkg3YkdQV2FZQ0hvcW91dC9XZE54NGJGME9V?=
 =?utf-8?B?bmhQQlVXb21zVzFXRkRQVkFXWGtuMDRBRVdzQThtckJ2WkUwOFRsT3VzV3FB?=
 =?utf-8?B?c0ZXSTYzM3VsYlU3RWZFUk1tbUdmTzQ0L1RRcnowNXlOaUdlckFFUkRKSVpu?=
 =?utf-8?B?bXBaWGowSnQyMjlYOFdMTFY2dUJyUkNTSEtYelExZ0NjY2VvUmFLRWE1ZEVi?=
 =?utf-8?B?UHQzOGtvRjB4UWlDUVRYMWlyQWkzWktqY1B0S1FhdCtqaEVVYTY0QVFCaW8x?=
 =?utf-8?B?VE5jaHk4U2FST3BUN3h6QTBRRHlnMW9ycEJOejFyOG4yczloYW0welYzdUl0?=
 =?utf-8?B?d2JXeVlEdjNjMkpDQmdXQ3ZjNTZvcURxWTJpYkF5c3lqSlBvdHpyRUpCYlBt?=
 =?utf-8?B?U1p5b3NCY0hVU05qVzdZaXlFUWs4ZThXOFc0UUU4Vm1PRGJCczJBYWNKVEFO?=
 =?utf-8?B?bG1UanhuOFpTKy8rL0U5R3UrYzFlemRhcVJQZVVqRVU0dnBJa3NsM1I3UGhS?=
 =?utf-8?B?a2R3ZzlWa3h5UzhRd01SQXEvc3hhSXhmWXJQWmtieldHVGN5UDVJZlBDdU5j?=
 =?utf-8?B?QUkwUU1sOWhvY0MrSzBDNWhuaER5cjNxR1FpaTBxRjRJYW5GOTdmMnFFV1Qw?=
 =?utf-8?B?NnJqbEtmQjg5UlA1ZGpEZDVUWVlMU1kvVFBpWVlNc0I4TjNObXFrdFI4cG94?=
 =?utf-8?B?cVd4WE9DKzVub0JnRGxzWHRWL2Nna09lZmUxa1JLV0dSRVZIUzBKQ1h3Nksv?=
 =?utf-8?B?NFNJSEErZHlpbThCTk8rbUhUWThWa2lVeEk0bnl5RVlHY3BLQjJZWnJaa1RS?=
 =?utf-8?B?alZicDI0Z21sUWpzLzNGZ2ltNWVBKzFwaHd3NW0zRkJPNGJ0NUxVYkdIWWNz?=
 =?utf-8?B?dVp0cG5rZU44OW1Kb05kVXozV0N2RkwvK3N3SDhESHdxS2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K082cHlGLzRVOVdBV1RHZzNLeVFQQWxyUmkrZ2owYVpudFptUGNlTjhyWm1K?=
 =?utf-8?B?cFl2M0s4OUxwTWsxZUtsRHpmSnNoeDVEemVHMFNmQ0N4QVZZVEVPWHRGdnRx?=
 =?utf-8?B?SXRkY1lrK2sya1VYSzZ3N1dHZ3I2L1hNMkdmbFdyTHNZQW5UMW41VmlUbER5?=
 =?utf-8?B?UjJYK0FFNVMyV2VxOTlYbkhQbi8xdTd4M1QrY2lnZmdycTd6eEo2TXdyVXp0?=
 =?utf-8?B?UHpKZDMwUUJFTGwvVHREMTBodlpJMUN5bVlOb3EvTjB0NTgzcy82T2R4LzBG?=
 =?utf-8?B?TTZKY3BRSmR6YXRiTUVsVUN6NTF2QWlZb2I2a2dBYTczQW9yenpmWmxBL3VB?=
 =?utf-8?B?bXAxUnRDT2RWeHIrR08weHhzZVYxY2Q2KzFTN1Y4Zy8zMDVUQWU1cjJkY2tY?=
 =?utf-8?B?ZVFZMks3aWFYY1hzZnJkZjZoUW5CYXZvbHM1c3p5ZHkvbi9QaGR2dXZ6QVRB?=
 =?utf-8?B?REVxK2t4VDVWS2lGQ0RDTVB4U3pMNC8vWUlTMmU4emZnWnZsbzBaRDV2bWRT?=
 =?utf-8?B?dnJYR0lHR01RYUo3TTdWS1hPTC9tbzNmc0N3OUZWdVpVMlJacEtQMERaMVhx?=
 =?utf-8?B?c25jRVpidENxTDBZVDVueWNyYjJWMSt0cWhBSy9pVkhRaE85SFA4ZndUWElw?=
 =?utf-8?B?Y1FaczNhZHEvVVd0d0lYWlpvZStVYk1jaUphRVJRSmtWTUFnZ2dBTm1ES3Rz?=
 =?utf-8?B?cFI5Z1dkZkNiWFRSdEdDOVRueTZOZ3VPRmRnaVExM3Z2aWJhT3dQNWVDS0Ju?=
 =?utf-8?B?MXpQL1F1Rld0aTRvdlBvSUluTkI1ZE5aSmowZmlDZFNJUmoyS3RTT3paQXFS?=
 =?utf-8?B?d2hlbi9vOHBudjVjMDlxalYxR0hrdjlLb09lbkUvZFNTMXUvWndWUlZkcTFP?=
 =?utf-8?B?YlZzNE5hVWZDRDN4cVJHRURqazVaeW5rQTBDN056dUtXR2F0K2RCaGxXVlJY?=
 =?utf-8?B?YzVTWmRjUGJMWitHNVU2Vk5sUWJiNjZoZEpoUkljQVdDR1cwUS95SllYaExu?=
 =?utf-8?B?SXcrRW1MUFE4bGRScEdiS0VkVXRLRENjY0tGcXFtY0s3VGZXWXZlVFZ3MUtz?=
 =?utf-8?B?ZjJaQXVPZURYV2F4NW40THpUWnlJNzAzRWNVQ0NCSjVLS0lFYm4rV2VCNDVO?=
 =?utf-8?B?eW0yRnA4ZDAwdTM0NW9QV3BVc2M4ZnZLVUhNM1hma2dJSDZ0OFdSTE1oRjRw?=
 =?utf-8?B?VzZGdFd0RTlEbUN5Szg2bXUxRS9PVTJEc0JiU2E5cVdEYW56Ym00Q014bVBH?=
 =?utf-8?B?MzhKWi9pbjlNREY2eVNxRmIyWGVZdkxzRGJLNjY4WEFtaDlZekpTK2VVeHpL?=
 =?utf-8?B?SnVPWVBxSHlsNGtGbXdqZUxoNkYweHczdEJ6Y1I3UmhXcjhxejlvSldKUHNU?=
 =?utf-8?B?WDRUWFN0TjZRWDBTY0h6TWk2RXpjVFUyRkNUTDZzUC9rd0ZBL3g1VEowdDFa?=
 =?utf-8?B?ekJJUUJEZC9pN0xFUCt0Q1kxVElScWV4WVpQMEh1KzZjNVQ1M0hadzBsK0VX?=
 =?utf-8?B?MUJpT0lqVElxTk1nU2RZRi84Z1JmWXVuZlhFZnZMTlRBOWdBeUpRWHBYSzNF?=
 =?utf-8?B?ZGtZUmxzd2hZSnBsR2pMMEgxZDZBTDV3NDNmK2J6aEJsMnNDb1A3Y1FuM21s?=
 =?utf-8?B?bzhPK2dwN1ZMY2ZpNzd4RmdwOXpIbVl4NEdwWk9iNDFvaERrVkJtQ1BMQWZh?=
 =?utf-8?B?RDQzWG1qL0ltS21kSmhQVlhqZHRSWU40UlhlNlQ3SDh2aG40NlhiTnZQZWpm?=
 =?utf-8?B?cW9YZUhPcEhlRWtHMHJvNmtjd042WkRsK3BrZlk5TUpwQzFSYXAxK3k1NnQx?=
 =?utf-8?B?d2RPRHNsVXkwWW4zaDJkTk5FOTNVdzRicWtCTjNWMHBFYnpvNzkwSFhhU3lp?=
 =?utf-8?B?ZktWcytRVE9sTkhFdVlpL2VQbGM5anBiYTJLVVJqVDhUdjc3TS9teFRYVVR4?=
 =?utf-8?B?STdEdEhDS2EyQnJsMTBVUi9mVUVKWHg5bW1XYmlkN0ZWK3dPbzR1T3ovb3Ru?=
 =?utf-8?B?NmRYb0pxWUQyYm1hREVDdEtUelM2cXNQTzNoK293MHVxV3dkSjIvRWZoZGxk?=
 =?utf-8?B?T2xKY0RYQmduQW90dDR4a05yeDdFOFRtbkoxMWgyZ1hsdWx5eG40RTRaWTdq?=
 =?utf-8?B?dnN1N25qQW1nc2QyY1BwNjN0bFR5bVFyaGZNWEYyejJEUHhMNVhwZXlQT3Q1?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e51e3bf5-9cc1-437f-8db9-08ddb43f6a69
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:24:21.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CnHHkhAaovQApiC64o+ldSfTZfDGvSGcXZAqOhcPQlzgVN6aVWEc9TNlYkeMbl6LuW3Dwm49RmjrwQoTvLSF54f96IDZ8tWT9+LgRBEs2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4529
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> +static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
> +						 char *buf, size_t nbytes, loff_t off)
> +{
> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
> +	bool value;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &value);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&rdtgroup_mutex);
> +	rdt_last_cmd_clear();
> +
> +	r->mon.mbm_assign_on_mkdir = value;
> +
> +	mutex_unlock(&rdtgroup_mutex);
> +
> +	return ret ?: nbytes;

The static checker I tried complained here that ret can only be zero here.

Reinette

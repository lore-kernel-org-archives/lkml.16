Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6C218BBB9;
	Wed, 18 Jun 2025 04:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219218; cv=fail; b=VUPV1CNzuY9TeUWEoBB1Q34HUrDaDjft0F0ezhPv9R8dWMSKZQUyR6sddUp438qmFy4+VNVH0WX9Ex/M2UZeLML68XoGbD3gnxs0J7bh8i4ExViJsVSXf7tm3uDiYOPlV8ICJ93zThzRF/VCOX62JGVgE2NTYcVRun8zhavA8pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219218; c=relaxed/simple;
	bh=oUTS7X5gJm/8g+G09I21JygA08oJ9PWKxjGkn07VD3Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cr177wAM1DW7q4LsoGTqHEwFqzT5Vgj7KqbZx5Lz/ThXG31eiuCEHZ8c3TPppouMBHE594+uyt3NEHnQswSt1LHtcqjxqi0cm/sRyyItC+IC03VcQ20uq/1KQYnVjE0JwL0tQC3Rc/dOyZ8kvpJ682sfMZ9fNqN/ObgbOCz84xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxrivKI3; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxrivKI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750219216; x=1781755216;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oUTS7X5gJm/8g+G09I21JygA08oJ9PWKxjGkn07VD3Q=;
  b=QxrivKI3Ntqdx9MiBkN1bLQlJYYjzTJj7nIdzCuMyDYbzNrNQ8BKjHNW
   bR+Tw81BHDXHY5lspJx7wCLqzDgII7dMTnePgo5HDlryeRVMdsja3plxk
   Kx194Q6SXSAhmWF9zolFCw8N6/7mC7DuexLkGtCgqmWHY5j+Nz8nUFpLA
   pS8BpNuF8PFJWc0QA2o/Dsl7LY+jUkp8grXzZnkcAckOcE6BRTRvFrUGu
   EV4ZJ93on6i0oYsVFNOEAjiJSH9SLQqvjqioADwHTZ/HCKQQLUUQsy3tz
   VN/BihnokD1XSwsOG1jimcb7Cv4vxpajyWvauakKMqIAqsmSBMilt1pol
   w==;
X-CSE-ConnectionGUID: hA7cIbZRSV+luAlSeO7wTw==
X-CSE-MsgGUID: Y/K0a0wLQYWjggdheldl4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63077664"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="63077664"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:00:15 -0700
X-CSE-ConnectionGUID: q4SfNhZ5R3agFThSeX6oiQ==
X-CSE-MsgGUID: bHXwV0tlTCqGhaPBrRaPyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149735497"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:00:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 21:00:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 21:00:13 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 21:00:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlVf2HzXybHyiTg+Ze4vmvEdfotJph5v+iRJYtQ7ZnO3ME0Sm+WPG0k+ZYkOWZV8zk0bzUkSumJls1MYlcMDnfWTkGr6vDv7evbv02Ca3WxxhQ57xRuXkpKte8OUoW+ZEJaI04d7Bmgfcbh/VT+XTRCKE/7f6YI1aeuxdodx6ieruSnGNkgqF1xhFiQF65/QT9EcY4y1g/di8Rad9BkvEncDgUOBEOiycfbCioY15a4AeSmsW2d1+nq8M4yZ99GH2ChGMLQpv6v7hRlUiGyYs0OWFYZTcs77kTUtgswNMubMjoluEouLXjq5QcBUFBHWyp2Ea4PIoq6iU5soCOTCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsVGpCUQvFiIk+gg7PVz+xEAv5e3e1LpFJ8k3cgQOjw=;
 b=bt1LO+eXYavu2fDTI8FY6N1r961EyHqPD668Kd6Fd/r3CBkMEo3YDMlx2Cx2TxKGrNW356QN6j4gzY5gaRFQoX7xlbkMlGNO6z1ibTtGV+kzRmeNlGuldHAlEBDZWnPWhplPw4fodD48T9t8ww4g9Zqei5fHYHgfS1JuCtMJqlxKQd/BH4TIqBH0oogPv/OkD+LLtOWHZHB7j76MijuXOdaN8KTv2ZID7AmbfZasrwcM0JSwQf7YpxzwWIP4hnILS9jg3N6TQ6VGfDbExyc2zvpEVnp+kS0pbbz1tkRheSvuQXbESKULF5qj9D7UiPgUPQv61SbAoMcB33FxRVfK4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 03:59:57 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 18 Jun 2025
 03:59:57 +0000
Message-ID: <3bec3844-7fda-452b-988f-42b0de9d63ba@intel.com>
Date: Tue, 17 Jun 2025 20:59:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable
 io_alloc feature
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1749677012.git.babu.moger@amd.com>
 <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d71792-c676-40b3-eee2-08ddae1c970a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVFkQzlZTkRxbE9aYXIxRHJTT0V2ZDNnbUVTYXUwaENNb29NQXlDTzE4L1Qr?=
 =?utf-8?B?eU9Ja1dwbm9IOVAxcXBBY0tTcFREM2krM1MzOGltcy95QkFXTC8xTk1Hbis1?=
 =?utf-8?B?L3luVVpUMU5IbTFJWWdDS090RXJWTy92di9PTVg0cGhaVkZhVVpFZTFGV0FM?=
 =?utf-8?B?cHBmTkRLS3ZwSTBFak52RjlSWGZPS2UrRE16cFIvRGJBamZ2VUxtZ0NCRkNW?=
 =?utf-8?B?UWFIcFZSdEJzWWdwQlc2b0pBS1ZwNFBhYUZnSzk1M2xaVTZRNFVrTVRQZ3VL?=
 =?utf-8?B?azVqelhQMk90UEFtWkNHS05Md3htY0dSbkpxQjZLRU5EYnU4Z2lRZm43cHI4?=
 =?utf-8?B?bnErVWhjRngwKzlFTDZqNFFXVVJkM2pNN0FnL0NwWnpGM05QUTJZakVadGxL?=
 =?utf-8?B?eWJKNDNkcjlUNyt5SlBjYVdUcUkyL1doTmlwQ2ErazhiV1hYakdkZ0xiQUhk?=
 =?utf-8?B?UkNTZ1pQT0lCellyNUFCN0d4dlZNY1RyN0d3MlgzN08vSTlzemVEd0o1eURm?=
 =?utf-8?B?MEZZdDJJSyt3YkZ6Q05JWHU0bTNZeXhqRlRobGExbUJMWWIyR1VEclhPRnEy?=
 =?utf-8?B?TldYNkV2Wk1MMVFGdnNZT0o2OExMTVRmTFdWZ1d0N1duNExRWWdzMi95MWQ1?=
 =?utf-8?B?YkdJcFJVUkEvUUZ3enN0M3lyblFjeGRZT2JxaFhkQ1lOaEI2NHFoYTZ4dWZX?=
 =?utf-8?B?S2gzbXFReWVQZWlYaTJTL2w5Q0FiWVhtUU1wL3VldldhZUZFdGVpNVQ0dG1a?=
 =?utf-8?B?akpPcmdCd0JMM1FjVGxleEduTjJ2RnJMTHhVS1JnZmc4OFZqK1ZvRnZMTFlK?=
 =?utf-8?B?ZGlmK1NaNk5kV3pLM21hSTUzYXhPRk9rSktkdXdJR2dPdXNjWU5xSmoxVjlS?=
 =?utf-8?B?VldMckluU1NCQ2lUSytzT1dIaHRLbEJkUWc3dXB1QXlETFpnRjJRUDdlYXB2?=
 =?utf-8?B?dGlpallRdG1XK0RETVdINVIzLzZrb3E3VmtvSnlCMzhHUkpSeTdlbUtjSGUw?=
 =?utf-8?B?ODFNVlZSNFJnMHZZeXYzQnpMbTNYRnArcTROUTc3YU1WYkpic3hkaU1qS0JF?=
 =?utf-8?B?c0hWZ0UyYm91VWdkWDRFNG9WTkxnM0pEaEsxREU5UmJjWk5YcGVQY0dRWlkv?=
 =?utf-8?B?eW93ZjIvRnRSZ1c4dFQ4LytObm5OMnNSRDhjT2hoN1pCV3F3VFZXeWxYNGUw?=
 =?utf-8?B?dVE0M09XNEZ0bVJYb0h4MGJTVytmWHlhcW1heklNS2c2N3dOaVZoSHRmSUk0?=
 =?utf-8?B?MXVob3ovMm9hVHRSRVVsSTAwS3cwOVpWR1VLdmRmQXJzZkZpWm9iOW4vRjZh?=
 =?utf-8?B?b21BU1dJR25lRVRCbVpKVk0wU0x2Y3hwQloyTnAyU01LOG9mVlAwd1ZwcVo3?=
 =?utf-8?B?b0RqVVE5T0RkV2kza0pkUCsvYXdqVmVQc1Y2a2c3YnZaZCtoZnA2REFZZlg4?=
 =?utf-8?B?ZlZ5a3RTY0N2eXhSZ2xKQnMrR05CMGhHZ0VLdjNnZFZsemcxWTJWTlEzUnNP?=
 =?utf-8?B?TWtub2xJemY2LzkvRW9QS29NY09LaWxhTWxoV2Q3clJoNnJ4bHpmWG00anVm?=
 =?utf-8?B?dFE1L1V4aUpQN0NvQkpJZEE3K1RoSm1MWnhaRk9pclZwOGpsMHJFQlFidkVZ?=
 =?utf-8?B?YS8zekFMald6Q0ZYWHBEdElTRjVadUJOYmdQZ3ppb0M0ZHAvUmxEdGx6WVpT?=
 =?utf-8?B?RUI5NFVoclkzeG13KzhDTTdYY0ZzSm5Iald1UWdPUjNCRkJoNmtVTVlFTHN5?=
 =?utf-8?B?U2JLZnd2bGFhcXA1Y2JhQzdFVGZvdzBHOVZDLy9xVXlKNG9NWlZiczI4SnZB?=
 =?utf-8?B?NERPVmdmYXlNMlA0cTVqbmFHMHF0RHNESDJ0TnJnWXZmV2tzV1JBaTBtRXFl?=
 =?utf-8?B?TEg4VXNiVlg5dXNZV2VMN2dydEdabklxV0VoSnlkZ04yTGN4RWdXbFh4QXN3?=
 =?utf-8?Q?XaAj9O/iiFI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3ZacHU5ank1SGFxQnlBUUhwWG8xQUZ1QUQvNTMyU1RPNUpKZGVVNWNQZ25S?=
 =?utf-8?B?eG5FRWV2WVRhaG1DWmZadFNzTE91ODc1bWtFejdTZzJZeUNHUG1SQUpoT1RE?=
 =?utf-8?B?YWZ6ZllyWTlpdjZKbGRJbUZRZENOVnc4eFAyN1ErcDQ5ZEsrVUxPU3RkMklR?=
 =?utf-8?B?Si9BRUpITDJSa01qZlNVSEFXYnNhVi9hdHlRUXFqR0VENUZ1Z1NLZjUzcXVw?=
 =?utf-8?B?VTRidWl6U29aMS9vU2IvMG5qbUJkTk5ZLy92QXZhVzY5SmF3UDBKT1RXOTho?=
 =?utf-8?B?dnB5T1lPUFRXVFFmakxZTTFKam9hSzFMUHRqbEluUFZrcUx0T1EzQ1d0ekdT?=
 =?utf-8?B?dU4vM0Mya1RMd3V0ZGtlbzhFbkRVL3BUd1pkN1VkZDF1YkFkUnBXZmhQVnpL?=
 =?utf-8?B?K3RSRUVHQ29DUlg4TWNGcmNYcWYveXZtSEZxaTJxcDZDbWRGTWphTDJOMENV?=
 =?utf-8?B?ZjZBRkhkcHkxVmlhTlVZZkNlOXJZZUhRMnJKakptWkZTNkg0Q3pTZit5RUhk?=
 =?utf-8?B?QlNCMEkrSWE1SDhqWjBZaUg0SGYxRFR6eGE0VUgzV1FKQk5jWXVQYTdCYmRI?=
 =?utf-8?B?aFg1cDJPYm5sbC81bHRJNlhhOHFhZ3c1d3ZSc2VZQmFxUUlRSG5hS01ETEVo?=
 =?utf-8?B?elBjQmJyQXJXNW1CZWVCb0toaXFzKzNUQXRpQ0Y5UnFyZVA3c05ka1BDWG9q?=
 =?utf-8?B?c0xsN0NIZjJaWmR3N291NmVTbGJzNnBOQkVSV2FSWVMzMTgvenZyVlJveDJM?=
 =?utf-8?B?aVJXWnZNY1dUSXlQL1FoOUVXdnBualg2NWxWaXp6SjdJZm9mc1JaSVd6Qk9x?=
 =?utf-8?B?ODNSR0VtT3U3NDl3eUFEMWdvTHNONkgrMG9XNWFlRDJNbTJLdWZ3bVJYV3RL?=
 =?utf-8?B?WDllc0xYUWxIWXR3Sm1UY1ZOSGhaZG0xbXdmTHNaTEFZQklkVWQ0cHJPQWJ0?=
 =?utf-8?B?S2pJU2t6WmRRa3NrT3RzdTUxZVYycVZzVVZQblVQcTNLTmNJT0l2NGthY3JS?=
 =?utf-8?B?VGxXU291WW1BRmVvWG8zZVFyUGVzM2FYMjM2WVE2SXlkYXJ2RVZacThKK0Iv?=
 =?utf-8?B?K295SE1yYnNsdFc1RHdzMkdaZ2NNNkVzZDIyRHNSMFV5MXUvTy8vM0M4NnV5?=
 =?utf-8?B?U0tIY0pjcDRMZnAvN0hNU0crZnE3UEtKZ0hOd1dVM1l1bUQ0UGZXZlBPb2hO?=
 =?utf-8?B?OE5ybmVvRitMdXFnRHNRSTI4bDNrYTRabnhuZmxPcWxaZm9XUzZiWDZXR0Jj?=
 =?utf-8?B?cm1OWUQ2VHkyVWw3MnlRT1U2ZE9jR3Z4aW1xZHBKM0ZldmZ0OG1SNzluR1A2?=
 =?utf-8?B?YW5lTmMra0RsM0RoTHNRUnlvakcwUmVHbXlMaWc4dVZBdEJGZlpCTTQwRW5P?=
 =?utf-8?B?ajYwRzBYSTk0UGJUOTBaV1lwWG03amhyVTR6dTJ5Uk1tZHlLMG81WFd0VTFG?=
 =?utf-8?B?SDVnMXBySm5nQXNsdGJaUjloZVVQMWVzNFZEMWxRWXAxMmF2VlRhRDBYWWhX?=
 =?utf-8?B?ckJHUUU5RmY5azVFR05yS1kzVFpJd0xhd0lzMDJyRkFKd3h3RHVnRE5HV1dT?=
 =?utf-8?B?S0hta1h1MW9NallybXd3VUZiVXgvSVBzcVBXWHFtMGdIWmZOM3FzdjVqSko4?=
 =?utf-8?B?cTJFaGNNemVIakpqRWxXM1hsejBaaTZOcDcrOXQ5RnRXZlppOGRWbXp3ZENz?=
 =?utf-8?B?ODdyQ0I4N2RjZnZaVitGRHlyOExQZDIvTkowbzlzU3FWaXkyL3BBb1I3UGtW?=
 =?utf-8?B?bXQzczh1RTgvU0hnUVdYQmtDYzZpNCtMYVo3Sk0zL3VjVmFDYzBMdmZBSkl5?=
 =?utf-8?B?MVlPZ3RMTDhNbDlTbkZBZml1cXdYKzdoc01kMDhnS0lPdHVhbU5XMER4YWY0?=
 =?utf-8?B?UHFPNzFpRGxVNHR3UVR0Sm93ay9XaXhXWVhTSDJVbS93cG1oeVhmT2pZQmEz?=
 =?utf-8?B?NHNFRzBWcVdMNVJ0V3YzQWlGY3cra0oxazNvQytnNDI1YlgwZFN0bktjK3E0?=
 =?utf-8?B?b2E1OU5qUnorZ0pXWnJLLzBzVGZYMGVTYThiQzBPNTlObGpJRHFYZjV2MjJj?=
 =?utf-8?B?bUlMcUpjZFRYcmRvRFNSWkI2Q3l6a0tSYUN6dUc4cWQ2b3dWdTV4dGJPeDZ3?=
 =?utf-8?B?SFdwUkFHMG1VYWw5R3RuY1RuQjVBOVpmS3lQYXBZVDdxem9WN2tldFVxdS9p?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d71792-c676-40b3-eee2-08ddae1c970a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 03:59:57.4546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqUlguWsvYVQnjM5Vok9YZ7AgSlb0Z1y7aFAV7QSnqBmBJRlTxcSndr05pDF0KkflSIFDaO0AtqbTwmFDuA84K0j2FrQmEDVTDGpRy36Cz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
X-OriginatorOrg: intel.com

Hi Babu,

On 6/11/25 2:23 PM, Babu Moger wrote:
> The io_alloc feature in resctrl is a mechanism that enables direct

"The ... feature ... is a mechanism"? What does it mean when a feature
is a mechanism? How about just "The io_alloc feature in resctrl enables ..."?

> insertion of data from I/O devices into the L3 cache.

Drop "L3"?

> 
> On AMD systems, io_alloc feature is backed by SDCIAE (L3 Smart Data Cache
> Injection Allocation Enforcement). When enabled, SDCIAE forces all SDCI
> lines to be placed into the L3 cache partitions identified by the
> highest-supported L3_MASK_n register as reported by CPUID
> Fn0000_0010_EDX_x1.MAX_COS. For example, if MAX_COS=15, SDCI lines will
> be allocated into the L3 cache partitions determined by the bitmask in
> the L3_MASK_15 register.

This is a resctrl fs patch but most of changelog so far is about AMD's implementation
details. I do think it is relevant, but all the register details can
probably be dropped since it is too low level to support the goal. I believe the
goal here is to motivate resctrl fs's implementation that needs to pick highest
CLOSID. So, essentially the changelog needs to hightlight that AMD's implementation
requires highest CLOSID and without any other reference that is what resctrl fs's
implementation supports. I think it is important to highlight that the
user interface is not tied to this implementation decision to avoid future issues
if another architecture support "io_alloc" "differently". Internals of
resctrl fs can then be changed.

> 
> When CDP is enabled, io_alloc routes I/O traffic using the highest CLOSID
> allocated for the instruction cache (L3CODE).

Again, this is a resctrl fs patch and above is an AMD implementation detail. resctrl
fs should not be limited by how AMD implements the feature but can use it as first
reference.

> 
> Introduce user interface to enable/disable "io_alloc" feature.

This patch does more than this.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
...

> ---
>  Documentation/filesystems/resctrl.rst |  34 ++++
>  fs/resctrl/rdtgroup.c                 | 216 +++++++++++++++++++++++++-

This patch contains several logical changes that are not adequately described
in changelog.
I think the following can be separate patches:
- rdt_bit_usage_show() change
- io_alloc_init() definition and usage
- show() and write() helpers
- possibly the io_alloc_closid helpers (more later)

>  2 files changed, 248 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index c7949dd44f2f..03c829b2c276 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -95,6 +95,11 @@ related to allocation:
>  		some platforms support devices that have their
>  		own settings for cache use which can over-ride
>  		these bits.
> +
> +		When the "io_alloc" feature is enabled, a portion of the cache
> +		is reserved for shared use between hardware and software. Refer

"reserved" and "shared" sounds like a contradiction. How about "is reserved" ->
"can be configured"?

> +		to "bit_usage" to see which portion is allocated for this purpose.

This is the "shareable_bits" section and the reason why user is pointed to
"bit_usage" is because "shareable_bits" is a global CBM that applies to all
cache domains/instances while "bit_usage" is per cache domain/instance. I think
it will be helpful to point this out to the user.
Perhaps second sentence can be replaced with something like:
""bit_usage" should be used to see which portions of each cache instance
 is configured for hardware use via the "io_alloc" feature because every cache
 instance can have its "io_alloc" bitmask configured independently".

Please do improve this.

To complete this the first part of the "shareable_bits" doc can be amended:
"Bitmask of shareable resource" -> "Bitmask (applicable to all instances of this resource) of shareable resource"
What do you think?

> +
>  "bit_usage":
>  		Annotated capacity bitmasks showing how all
>  		instances of the resource are used. The legend is:
> @@ -135,6 +140,35 @@ related to allocation:
>  			"1":
>  			      Non-contiguous 1s value in CBM is supported.
>  
> +"io_alloc":
> +		The "io_alloc" enables system software to configure the portion

"The "io_alloc" enables"? Maybe just ""io_alloc" enables"?

> +		of the L3 cache allocated for I/O traffic.

Drop "L3"?

Can append, for example, "File may only exist if the system supports this feature on some of its cache
resources".

> +
> +		The feature routes the I/O traffic via specific CLOSID reserved
> +		for io_alloc feature. By configuring the CBM (Capacity Bit Mask)
> +		for the CLOSID, users can control the L3 portions available for
> +		I/0 traffic. The reserved CLOSID will be excluded for group creation.

Looking back I've commented *four* times already about how resctrl fs user interface
should not be made specific to AMD's implementation.
This paragraph just be dropped?


The rest can be something like:

		"disabled": Portions of cache used for allocation of I/O traffic cannot be configured.
		"enabled": Portions of cache used for allocation of I/O traffic can be configured using "io_alloc_cbm"
		"not supported": ...

		The underlying implementation may reduce resources available to
		general (CPU) cache allocation. See architecture specific notes below.
		Depending on usage requirements the feature can be enabled or disabled:

		To enable:
			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc

		To disable:
			# echo 0 > /sys/fs/resctrl/info/L3/io_alloc

> +
> +		The interface provides a means to query the status of the feature.
> +
> +		Example::
> +
> +			# cat /sys/fs/resctrl/info/L3/io_alloc
> +			disabled
> +
> +		Feature can be enabled/disabled by writing to the interface.
> +		Example::
> +
> +			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
> +			# cat /sys/fs/resctrl/info/L3/io_alloc
> +			enabled
> +
> +		On AMD systems, the io_alloc feature is supported by the L3 Smart
> +		Data Cache Injection Allocation Enforcement (SDCIAE). The CLOSID for
> +		io_alloc is determined by the highest CLOSID supported by the resource.
> +		When CDP is enabled, io_alloc routes I/O traffic using the highest
> +		CLOSID allocated for the instruction cache (L3CODE).
> +
>  Memory bandwidth(MB) subdirectory contains the following files
>  with respect to allocation:
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 1beb124e25f6..bbc032b4d0e9 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -70,6 +70,7 @@ static struct seq_buf last_cmd_status;
>  static char last_cmd_status_buf[512];
>  
>  static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
> +static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid);
>  
>  static void rdtgroup_destroy_root(void);
>  
> @@ -232,6 +233,19 @@ bool closid_allocated(unsigned int closid)
>  	return !test_bit(closid, closid_free_map);
>  }
>  
> +static int resctrl_io_alloc_closid_alloc(u32 io_alloc_closid)
> +{
> +	if (__test_and_clear_bit(io_alloc_closid, closid_free_map))
> +		return io_alloc_closid;
> +	else
> +		return -ENOSPC;
> +}
> +
> +static void resctrl_io_alloc_closid_free(u32 io_alloc_closid)
> +{
> +	closid_free(io_alloc_closid);
> +}
> +
>  /**
>   * rdtgroup_mode_by_closid - Return mode of resource group with closid
>   * @closid: closid if the resource group
> @@ -1030,6 +1044,29 @@ static int rdt_shareable_bits_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +/*
> + * resctrl_io_alloc_closid_get - io_alloc feature uses max CLOSID to route
> + * the IO traffic. Get the max CLOSID and verify if the CLOSID is available.

The function name should be followed by a *brief* description.

> + *
> + * The total number of CLOSIDs is determined in closid_init(),  based on the
> + * minimum supported across all resources. If CDP (Code Data Prioritization)
> + * is enabled, the number of CLOSIDs is halved. The final value is returned
> + * by closids_supported(). Make sure this value aligns with the maximum
> + * CLOSID supported by the respective resource.

All but the last sentence is unrelated to this function and the last sentence
is very vague. What is "this value" that it refers to?

> + */
> +static int resctrl_io_alloc_closid_get(struct rdt_resource *r)
> +{
> +	int num_closids = closids_supported();
> +
> +	if (resctrl_arch_get_cdp_enabled(r->rid))
> +		num_closids *= 2;
> +
> +	if (num_closids != resctrl_arch_get_num_closid(r))
> +		return -ENOSPC;
> +
> +	return closids_supported() - 1;
> +}

resctrl_io_alloc_closid_get() seems to be trying to do two things: 
- determine what the io_alloc_closid is
- make sure the io_alloc_closid is supported

I think this should be split into two functions. Once the
io_alloc_closid is determined to be supported and io_alloc
enabled then there is no reason to keep checking if it is
supported whenever the io_alloc_closid is queried.

How about simplifying this to:

/*
 * note how this returns u32 that will eliminate
 * unnecessary error checking in usages where io_alloc_closid
 * needs to be determined after an resctrl_arch_get_io_alloc_enabled(r)
 * already confirmed io_alloc is enabled
 * function comment could note that this returns the CLOSID
 * required by io_alloc but not whether the CLOSID can
 * be supported, for this resctrl_io_alloc_closid_supported() should
 * be used.
 * Can also note that returned value will always be valid if
 * resctrl_arch_get_io_alloc_enabled(r) is true.
 */
u32 resctrl_io_alloc_closid(struct rdt_resource *r) {
	if (resctrl_arch_get_cdp_enabled(r->rid))
		return resctrl_arch_get_num_closid(r)/2  - 1
	else
		return resctrl_arch_get_num_closid(r) -1
}

/*
 * note how below already makes resctrl's io_alloc implementation
 * more generic
 */
resctrl_io_alloc_closid_supported(u32 io_alloc_closid) {
	return io_alloc_closid <  closids_supported()
}



> +
>  /*
>   * rdt_bit_usage_show - Display current usage of resources
>   *
> @@ -1058,20 +1095,23 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
>  	struct rdt_ctrl_domain *dom;
>  	int i, hwb, swb, excl, psl;
>  	enum rdtgrp_mode mode;
> +	int io_alloc_closid;
>  	bool sep = false;
>  	u32 ctrl_val;
>  
>  	cpus_read_lock();
>  	mutex_lock(&rdtgroup_mutex);
> -	hw_shareable = r->cache.shareable_bits;
>  	list_for_each_entry(dom, &r->ctrl_domains, hdr.list) {
>  		if (sep)
>  			seq_putc(seq, ';');
> +		hw_shareable = r->cache.shareable_bits;
>  		sw_shareable = 0;
>  		exclusive = 0;
>  		seq_printf(seq, "%d=", dom->hdr.id);
>  		for (i = 0; i < closids_supported(); i++) {
> -			if (!closid_allocated(i))
> +			if (!closid_allocated(i) ||
> +			    (resctrl_arch_get_io_alloc_enabled(r) &&
> +			     i == resctrl_io_alloc_closid_get(r)))
>  				continue;
>  			ctrl_val = resctrl_arch_get_config(r, dom, i,
>  							   s->conf_type);
> @@ -1099,6 +1139,24 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
>  				break;
>  			}
>  		}
> +
> +		/*
> +		 * When the "io_alloc" feature is enabled, a portion of the
> +		 * cache is reserved for shared use between hardware and software.
> +		 */
> +		if (resctrl_arch_get_io_alloc_enabled(r)) {
> +			io_alloc_closid = resctrl_io_alloc_closid_get(r);

In this implementation io_alloc_closid can be negative and the static
checker I used complained about the subsequent usage in 
resctrl_arch_get_config() that must be unsigned.
Since resctrl_arch_get_io_alloc_enabled(r) already passed this is one
example where resctrl_io_alloc_closid() can be used.

> +			if (resctrl_arch_get_cdp_enabled(r->rid))
> +				ctrl_val = resctrl_arch_get_config(r, dom,
> +								   io_alloc_closid,
> +								   CDP_CODE);
> +			else
> +				ctrl_val = resctrl_arch_get_config(r, dom,
> +								   io_alloc_closid,
> +								   CDP_NONE);
> +			hw_shareable |= ctrl_val;
> +		}
> +
>  		for (i = r->cache.cbm_len - 1; i >= 0; i--) {
>  			pseudo_locked = dom->plr ? dom->plr->cbm : 0;
>  			hwb = test_bit(i, &hw_shareable);
> @@ -1803,6 +1861,142 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>  	return ret ?: nbytes;
>  }
>  
> +static int resctrl_io_alloc_show(struct kernfs_open_file *of,
> +				 struct seq_file *seq, void *v)
> +{
> +	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
> +	struct rdt_resource *r = s->res;
> +

Needs rdtgroup_mutex

> +	if (r->cache.io_alloc_capable) {
> +		if (resctrl_arch_get_io_alloc_enabled(r))
> +			seq_puts(seq, "enabled\n");
> +		else
> +			seq_puts(seq, "disabled\n");
> +	} else {
> +		seq_puts(seq, "not supported\n");
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Initialize io_alloc CLOSID cache resource with default CBM values.

It is unclear what "default" means.
Could be "Initialize io_alloc CLOSID cache resource CBM with all usable (shared and unused) cache portions".

> + */
> +static int resctrl_io_alloc_init_cat(struct rdt_resource *r,
> +				     struct resctrl_schema *s, u32 closid)
> +{
> +	int ret;
> +
> +	rdt_staged_configs_clear();
> +
> +	ret = rdtgroup_init_cat(s, closid);
> +	if (ret < 0)
> +		goto out_init_cat;

The "out" label should reflect what is done at target, not the source.
Consider all the usages of "out_unlock" in resctrl.
Since this is the only label it can just be "out".

> +
> +	ret = resctrl_arch_update_domains(r, closid);
> +
> +out_init_cat:
> +	rdt_staged_configs_clear();
> +	return ret;
> +}
> +
> +static const char *rdtgroup_name_by_closid(int closid)
> +{
> +	struct rdtgroup *rdtgrp;
> +
> +	list_for_each_entry(rdtgrp, &rdt_all_groups, rdtgroup_list) {
> +		if (rdtgrp->closid == closid)
> +			return rdt_kn_name(rdtgrp->kn);
> +	}
> +
> +	return NULL;
> +}
> +
> +/*
> + * When CDP is enabled, io_alloc directs traffic using the highest CLOSID
> + * linked to an L3CODE resource. Although CBMs can be accessed through
> + * either L3CODE or L3DATA resources, any updates to the schemata must
> + * always be performed on L3CODE.
> + */

I think that updates to the schemata needs to be made on *both* L3DATA and L3CODE.
Consider how __init_one_rdt_domain() works when a new resource group is created ...
the algorithm looks through all allocated CLOSID and the associated schemata impact
the CBM of the new group. If an allocated CLOSID is associated with L3CODE
then its "peer" L3DATA is also taken into account, similar for L3DATA.
If only L3CODE is updated for the io_alloc_closid then it looks to me that
whatever the original L3DATA schema was will keep impacting new resource
groups. To avoid that and ensure only accurate CBMs are used it looks to me
as though the L3DATA and L3CODE schema needs to be kept in sync.

> +static struct resctrl_schema *resctrl_schema_io_alloc(struct resctrl_schema *s)
> +{
> +	struct resctrl_schema *schema;
> +
> +	if (s->conf_type == CDP_DATA) {
> +		list_for_each_entry(schema, &resctrl_schema_all, list) {
> +			if (schema->conf_type == CDP_CODE)
> +				return schema;
> +		}
> +	}
> +
> +	return s;
> +}
> +
> +static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
> +				      size_t nbytes, loff_t off)
> +{
> +	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
> +	struct rdt_resource *r = s->res;
> +	char const *grp_name;
> +	u32 io_alloc_closid;
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	if (!r->cache.io_alloc_capable) {
> +		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");

This could be more useful with a small change:
"io_alloc is not supported on %s\n", s->name

> +		ret = -ENODEV;
> +		goto out_io_alloc;

out_io_alloc -> out_unlock

> +	}
> +
> +	io_alloc_closid = resctrl_io_alloc_closid_get(r);
> +	if (io_alloc_closid < 0) {
> +		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");

This could be more useful to help debug by printing the value of io_alloc_closid
that user can compare against output of num_closids files. Here the terms become
a bit complicated since ideally we want to use ctrl_hw_id but that does not match
"num_closids", so perhaps use both terms, for example "CLOSID (ctrl_hw_id)"?
I am not sure here.

> +		ret = -EINVAL;
> +		goto out_io_alloc;
> +	}
> +
> +	if (resctrl_arch_get_io_alloc_enabled(r) != enable) {
> +		if (enable) {
> +			ret = resctrl_io_alloc_closid_alloc(io_alloc_closid);
> +			if (ret < 0) {
> +				grp_name = rdtgroup_name_by_closid(io_alloc_closid);

Below handles !grp_name but that would be a kernel bug, no? Maybe WARN_ON_ONCE()?

> +				rdt_last_cmd_printf("CLOSID for io_alloc is used by %s group\n",
> +						    grp_name ? grp_name : "another");


CLOSID -> ctrl_hw_id

> +				ret = -EINVAL;
> +				goto out_io_alloc;
> +			}
> +
> +			ret = resctrl_io_alloc_init_cat(r, resctrl_schema_io_alloc(s),
> +							io_alloc_closid);
> +			if (ret) {
> +				rdt_last_cmd_puts("Failed to initialize io_alloc allocations\n");
> +				resctrl_io_alloc_closid_free(io_alloc_closid);
> +				goto out_io_alloc;
> +			}
> +
> +		} else {
> +			resctrl_io_alloc_closid_free(io_alloc_closid);
> +		}
> +
> +		ret = resctrl_arch_io_alloc_enable(r, enable);
> +	}
> +
> +out_io_alloc:

out_unlock ... to match the other places in resctrl.

> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret ?: nbytes;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -1955,6 +2149,13 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= rdtgroup_schemata_show,
>  		.fflags		= RFTYPE_CTRL_BASE,
>  	},
> +	{
> +		.name           = "io_alloc",
> +		.mode           = 0644,
> +		.kf_ops         = &rdtgroup_kf_single_ops,
> +		.seq_show       = resctrl_io_alloc_show,
> +		.write          = resctrl_io_alloc_write,
> +	},

Please match existing code wrt tab usage.

>  	{
>  		.name		= "mba_MBps_event",
>  		.mode		= 0644,
> @@ -2062,6 +2263,15 @@ static void thread_throttle_mode_init(void)
>  				 RFTYPE_CTRL_INFO | RFTYPE_RES_MB);
>  }
>  
> +static void io_alloc_init(void)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +
> +	if (r->cache.io_alloc_capable)
> +		resctrl_file_fflags_init("io_alloc",
> +					 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
> +}

Note that even if it only checks the L3 cache resource, this will make the
file visible to all cache resource, also L2. This is why it is important to
ensure documentation and implementation also accommodates resources that
do not support io_alloc.

> +
>  void resctrl_file_fflags_init(const char *config, unsigned long fflags)
>  {
>  	struct rftype *rft;
> @@ -4249,6 +4459,8 @@ int resctrl_init(void)
>  
>  	thread_throttle_mode_init();
>  
> +	io_alloc_init();
> +
>  	ret = resctrl_mon_resource_init();
>  	if (ret)
>  		return ret;

Reinette

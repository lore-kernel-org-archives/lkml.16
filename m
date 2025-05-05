Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10506190692;
	Mon,  5 May 2025 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746465318; cv=fail; b=P1jz9ulNmrFCakeolQS97mJQx7I8vogkcWyO2VL+PEZoV6ipt4YzmfryXfavbOp0ahBtFvckfOcb8U+1HOOEitZNuIXN/Aj//cwtqObY40sOp+GsJi48ZmXhuj/LqvrUoJzaiH8MT/FW2H5TR4zpAijGsQysT9aLjwoB0ZhmPy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746465318; c=relaxed/simple;
	bh=610XL47kCg3r46RnjXE3VGn2mxqCG+7jwYj4oVuIHkI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vz7pcWAjSeMgHdW3he+g7zd/T3GDdZkbuaqxdBRsqA5u3HjEnGAHVtCaS9iQjGaqLoqg6+ET8iql5So1NEVwqJl2nOGflEGc1Kk/I36YPlRU5ZG6rrbzYke6HFudEwgLRtGim6G2n4pyImfoyVPDfY9htsSLKB1tOfbJm7b12kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByZu8Jeo; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByZu8Jeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746465317; x=1778001317;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=610XL47kCg3r46RnjXE3VGn2mxqCG+7jwYj4oVuIHkI=;
  b=ByZu8JeoHtY5VG6tX7YUI24jgHwmPasMFWlUywO1YJu7UvyN+XKy+rAV
   VILtjSyKhc+nWQJ/qTYgqUnqPqOoY5jqgV19I5nwzPboMrf2BuMAhst0J
   7QGA9elhHa4ACm6ldEpG9lh3DuuQu9FLl/wAg7fQBSSVXcKETVle/KfoA
   25TdV1xiZB2YlmYlca/8CcT00XaHf0OI1OB/72/3vdP2CaZcy8h3GaKE6
   zd5tTAw7VB4l1FR6U9u0gypMUzBium+3zB9aw36C6YzxCYALmUP64G0h+
   +lUoV7VeGckM66o2GaCvdWb1LBrXFl6h0Q5ScGmctd96WBVyCwliTDRGC
   A==;
X-CSE-ConnectionGUID: h28BFRriSU6CrtjRChZjXg==
X-CSE-MsgGUID: LCAa3B2SSMuScAyrff46dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="70590061"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="70590061"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:15:14 -0700
X-CSE-ConnectionGUID: FDQadP/cSoWUhGN1TE9hEA==
X-CSE-MsgGUID: nYhz9pGrS2SwEXlIAwMozA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="166368426"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:15:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 10:15:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 10:15:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 10:15:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnBtxY8xYnwmcN+/pOf7OBYJkiWozI57bf8W6Q/q6KdMV0rBeP+DAmLG4hg55UPR94vsJi/atKxbgf3Gy8leUomo8QuA9mDn6OZulfAu7H+5/vW1asSoeP2c+j+ekyssMViSuh9u2BGTCA7HYaR1iHv1Z8WHqUqTcQwD4+Gj5lxOPpufTnKLicZyXINLUwFmvf6gqPyyJT/9FxjiyPTsk1quX1XXeLE4eKWbAYt4RAe6J7HVhpnKkyFMS0k0Wq8yXoiUvlEvJXOXbzt2GgjHYwjjOU0RHxtIZ2R3ng5BYPB6UcKMDZ6UXKZJtbo7vstmkQpbMZnjFEeQdhGo4lEihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atb7OmabgsEXcuuwIZGbomBfffO+UcdPrqkZMo8+kP4=;
 b=KtVYUwW+E9yicDP8OxE3oA8xnbkLu5Uduieq2IBejmV0Hi8JSJEDQZ0KWn1nlQ9eezW8O/00KXnfGsvzfVGKNRk4el/BjYbeWbxEOV315FztEbE8RbkrCESA+lbhJipmt0XOAR8OvCyEycGzmYW0Fd/9vkWzzO1asNDkUpCWtN2OSHBQGWp9tz//dsRKgBrt5H7Wf2VM6Y7MbeuFLE3GyYZK5I1052kls+0noQ+S2ZxzeStrli+mioUk769an94y5fvJG50kv68NIMaOyKtprK3nJgoy31y0v3Ag3NBVGohM65DA0Fg40cJXrM3sNl/oEWd8UnLxBCDGVl1sLPK9/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA3PR11MB9087.namprd11.prod.outlook.com (2603:10b6:208:57f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 17:14:51 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 17:14:51 +0000
Message-ID: <d84d7299-d0d3-4027-b256-f1e24d8423c9@intel.com>
Date: Mon, 5 May 2025 10:14:48 -0700
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
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <SJ1PR11MB6083919B4628C4957D099667FC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA3PR11MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b1117b-987c-4970-1067-08dd8bf85895
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnFtTFZudWVlVUJBNVZYMUFCMEN2Z1I5RnEyOExkbk1wLzB6Zk9KSmg4QWo1?=
 =?utf-8?B?TXhEc0UwVFUzOGM1UWxJQ3RuWGpBVk5NNDFxOGdpWHpxNVVTcFF5QVNEUFZE?=
 =?utf-8?B?Z3QyMUc2TXRYTWp6SDdzQkF6TWh2S3M4Z09tODg2Z0V6N1lvczFCVXRHemtl?=
 =?utf-8?B?dkUrQnJUSGUwQUNvc2xNaEhkQjkvMlg0M3dWZEJtd0Y1VFZVZzY3WFp2M1pu?=
 =?utf-8?B?VUJaYXNUWGhWYkk2SWJHWEI2eC93M2t1YmtMVGJsaWJZdzJKSllwbW1rSGsz?=
 =?utf-8?B?bVM0T2FibDRhN2hUaXdzaVhueTVaQW9YRGxKWlZrQXI4SDRpTHFHREZFNWdu?=
 =?utf-8?B?WlNRell4VDRmMDNoRnZxZTZmKzVEajdKcG9tZUVjam9ueWliYjVUcGE1aGh4?=
 =?utf-8?B?NXN2Z0NzV00wcUNmaHVLVG83SEhWMFNRT1dZb0hEWkxFdzhIWnFIUFhLVS9O?=
 =?utf-8?B?ZS9KeHBKOXlhM1RQLzdERko4aUdkSm9HMElPZmVOcVZEQ0dVWG4xT0VmNmZG?=
 =?utf-8?B?NzE0YXQ0Wkd2a3phUUNkYmtwOGVEKzFOenNsRmg0bEdpbWQyUGJyNnhZMjlD?=
 =?utf-8?B?RC80N3QrbG9nZjVWUktKMFZ2RHU2TU95aUxHL1FMb2J5RkdqaVBCQXFmZHBB?=
 =?utf-8?B?eXNGVDRsSUh2Ujc5ckNndEtWejFRNlFVb3ZHYVV5T0RBbGpkYjlKYkRSZHFS?=
 =?utf-8?B?dW5rVXpwOHNrVjBGU2RZV0hocExFZkpZcWovN1RSeTNBSjhScXRXSGhEaWJ1?=
 =?utf-8?B?UjZLSVUvZDlTamtYY05DRTBoSUZVVWxDVlQ4a3A5R3dIRzRZZzFYU2RaNHpk?=
 =?utf-8?B?aHRkdTIrSytUOWUrYmh3Y3hJa0pRWGJtT0VSWXdnZ0FicVNBSUdOalo2Nk85?=
 =?utf-8?B?L0lFVy9mQlNWWWt5S2M1VXdrK3prdlNOYVdOeHZpcE02L2ZqTDdEdjNjcHRE?=
 =?utf-8?B?UW04TkxzcFFBNUJ4RzI3WWI3L3BpUERGZXoxRzl4R0YyRndEWU5haEpjK3Ri?=
 =?utf-8?B?MGZJMys4ViszL0FQd2RZbWtmZFg3QkhwTHc0YzJuZXFtR2dlQVJBVTdSZmN6?=
 =?utf-8?B?VjF6NVAxWk8rdjdQWEMvUFJaTXZ0K3lCYnZhWFJtUEN2T0tuNHl2ck9ZOGZv?=
 =?utf-8?B?M2tQclNJd0pONUQxRFIyOThTVHluTDJGdzFYajZFeVExV3lXU0NGSUlhcXlV?=
 =?utf-8?B?SjlBUGJHNkNXRzczWVBnV3FHZmFlVzc0SHpiend0YUt4WHZwY3JlSGFWbEg1?=
 =?utf-8?B?UGdXbGpQbFB6cGRFNzBQZVkxOWkzUjRPUWFXWEFJY2l5RmwvQWtnL0V2cHho?=
 =?utf-8?B?eEpidUQ2azk4UCtuWjBTdTFwMktVWnlrcWVMS1JmdVZZZWZpZGdBSEN4Qmky?=
 =?utf-8?B?bFdVV0V4T2s2RGpvTyt4VTBRYW5wdUJLTFJDaWxIMktRNHAvYVBvRWovR0Zj?=
 =?utf-8?B?VnJ0VHM2M1FNc2xkZmdrWEc5YjV5dU5HK2dRcUg1alZwTFVLUlhkbVlySjhU?=
 =?utf-8?B?aFI3eTNoQjlrUFI3RXhoTjI2UDJkM3JDNlNzVXR4U0h3TVp0R2RjRE9xTE10?=
 =?utf-8?B?UzhKU1BEUThaZ1J3MWJGMHpNTnBSR3crMWpTeW53K2lnL1Q5QnlXR0FjN0Q4?=
 =?utf-8?B?Vnk2anpoRW9hOHFlUE5SRitWcDcyVmZuYUluaVVYQTk4Z296M3FRcXBzUjNx?=
 =?utf-8?B?VHZrWVJ5QkY1ZVlmKzI3VU1BbDNHWHN4M2F5UjhGWG1Ib0oyMWVaaDluZU9P?=
 =?utf-8?B?cEw3MXFwbUNDTURwUjBUdEhSaWVmM0haWFpSS1VhWEFxeTVwcFczc3dqOHJR?=
 =?utf-8?B?VFJCV3BzemwxVWRPMzlObytZckZiRnVMbzhPd3N2QUR3c0hpZkxHTlBTcmd2?=
 =?utf-8?B?MXFGZ29SZG50M0g4WWdCaW5qVU1lbml6TDJPVTZreHBjQ2lJRm4zSzE3cXBE?=
 =?utf-8?Q?KblL/ISGyP4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0hOZzJqN1cycHY1SS9XSVJqZVdSQ3lnd0RXQVB2VkZWMnZIM3NtZUxmcnA5?=
 =?utf-8?B?V0tEZmM5NDJITmF2U3A0NWtuODNzTTlFWGM3MnI4T1hYRW9nTXQvaEFQUzBa?=
 =?utf-8?B?L1hmeEZ2NlNPOFVaa1daZHF1bHo1S0RYY3JadXlTeE5NcXlVTzNpY3lUZXVw?=
 =?utf-8?B?KzFMdG0vaHE2VlB2N09HWFgxVEhQMmllejJiWFhuaStHRXU0NXlmRkNIbE15?=
 =?utf-8?B?ZXFONXdERGZJOFArL0QxRDNmZFBZbnNwbXM1aXhEZkF0RStTVW5nTEJkRVhO?=
 =?utf-8?B?aktwZkRqSnpaMXlOMVBSMm9OMngyVWt0N2xBVVJ2R1FiMUZCN0owZy9IVVhI?=
 =?utf-8?B?YVcyVXBWTzJENXJrY01CSjlBWUFWcEJrQlh6dlJvYUZZaStXV3hUczVtV2Rj?=
 =?utf-8?B?VDAxdzdWdXFsZ3dBRUxwcmhlUXBxWG85V0NUc1lYd09TY0Y3SUYyTDZYL25F?=
 =?utf-8?B?cGw2RUpYdTdEaGppWWNWTUt6TjJUOG5kUHVQN25WMzJoUVVKMmN2V2xDc1ZD?=
 =?utf-8?B?N1Z1M25xUW04V3pZajFIekNnSVN5MnpVdWFmbWFzLzYxSTRZd214VjBmK0ow?=
 =?utf-8?B?QXJZZTZiMGFneXMvbHFqNkJIR0VwU212dU9JcjFsd203dTZ1MDFHWkoyL1JX?=
 =?utf-8?B?Nm5kSmt2NEJobG5jQkJKdkZWd3BzbEZnTTNlQ0JyTEt0QXZyZEtQcjNwZno1?=
 =?utf-8?B?Ukd5SDNZUVFMTEhPQ2ZNeE5lQThPNFMvMzZZS3dWK0wyZGdpR016VG9Va2RX?=
 =?utf-8?B?dkxucGowSDUwbzBxY1FFdTM2ZUNTR0YwbnlIZlZzN2c5Kys5Y2sxcWR6MHNM?=
 =?utf-8?B?ZXV2NkRmOUhJbXJPQk1jalZReUo0N0w5MVE0RVBubERZMHdhb1BuTVNmdEFx?=
 =?utf-8?B?YzV5ZVBGUnMxMUZUbjZ0Y2taaFRlVjIzZnk3RDN1bGZkWHBUa2p2cUg1aFFT?=
 =?utf-8?B?VlNrMWhldmlXeU45bVQrU24xeWdRaXVQVVF5R0ZiTUJ2Wm85cDA5TlpBcitv?=
 =?utf-8?B?WnBIS1dyS213Mk5pWWp4cnhGMWdIeDhsZHlRNFZuci80cGJjYmRwY1o0UlRo?=
 =?utf-8?B?SDkvenYwa1p2SGM4LzNZcVhqQi8zQ1UyN3JpVVFKTTE3aG4zc0RYd2FPMUtr?=
 =?utf-8?B?K3h1SlgvSE9haTAxMklXdlBjNHFDTmFCMjFndG5MZVg5bWd4QTM4L1ZqK0l0?=
 =?utf-8?B?ZUhNRGlScWtEcGZ1czRPOU1NYkNKRUl0eEl4U3A5Q00vQklVRXV5YXVVaG1W?=
 =?utf-8?B?Um1GS2NIdTU1VHpPZ2ZvSTl2U2wwcGNzK2VkV3hZZ2wrUXNMQWM3eDA2ZmJY?=
 =?utf-8?B?cW1JTzdzK2tvdHI5RXhjTTk0NmRXc0JEYlIvMzdnWjAxMUFFVHRoaEZTUFox?=
 =?utf-8?B?ZEpja1Q3dmk2U1Bpd0UreXByUVpJbTZwWFRCT1lGbEl6bWNsb1dQTm9PbVdD?=
 =?utf-8?B?bkMzT3ZHUHhDQjczMnV4QmtjM2daU2JTdlgzMFVHcW9DRWhod2ZINFFGMzN5?=
 =?utf-8?B?cDdyOXlNRVBiZ3NBWU1HcHM2QUJEdkZEMHJWQlkyOFpPQThRK3A2NytvSGhN?=
 =?utf-8?B?MHRCSksvTlJ5Tzk4YzJsY1dmTFg2cWZQV1k2V3R1ZFEyYXg3UXF5ZUZBOXg2?=
 =?utf-8?B?ZXRFaGR4bFIyeUZNOVEycEZodzdXVVRudVk2cmppUGp4YmlLeG12WG41aFEr?=
 =?utf-8?B?VEgxTzY3MXZ6Q3lMbmpqczZKMVdNOFBMZzh3dGovbTZmbzdFcGR4ZGxvZVJp?=
 =?utf-8?B?QXoxZ05nOUQ1L0huaEQyL3FHTnNESzI5M0FOVUYzY3ZpMCtpdmZzNGFwangx?=
 =?utf-8?B?bFRCOS93RWlBWEtKSVFBbW1NUkhvNGQwRndONmJEZGRLcjBHWXVnaG1nQ2pl?=
 =?utf-8?B?MndSTkV6eFV4TUFONHB2TzJ1VzhsM1JhcjU1dktnZkdFSVlDb2dNK2lOcll3?=
 =?utf-8?B?czVPbFZoQXdZR2VhYjkwUkJqWnR3SXg5MmROUDdpODNaZ2ZRZW9kdnk5ejFj?=
 =?utf-8?B?ajZNRkpGUGtTZHF4WG8vTmNSdHo4NDFMcjNnTTFoT2FqTDRJd0tQb09vd0wy?=
 =?utf-8?B?RTBpdk52ejJELzdZYy8vQkpTWkVDcnBkeXRjQWhmbTJ4ZzZyME1KWllWZ1hn?=
 =?utf-8?B?RUkzbUtzZU5Lb2JqVnVkaWg3WWk0QU1mOFZYbWswY1RLL0kyRTVJTGllYnpt?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b1117b-987c-4970-1067-08dd8bf85895
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 17:14:51.2605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pc+R+pHuEwFpCSWNNEb2SEKdSnP4QCN/m7CVGkHPejwhFIr8kwbzbwI43HGgmwT3njbnb4rS47flNcrp4igblItKjLCC9Ee7J849Z0PkGHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9087
X-OriginatorOrg: intel.com

Hi Tony,

On 5/5/25 10:01 AM, Luck, Tony wrote:
>> The only aspect of "closids" that has been exposed to user space thus far
>> is the "num_closids" and in user documentation a CLOSid has been linked to the
>> number of control groups. That is the only constraint we need to think about
>> here. I have repeatedly asked for IO alloc connection with CLOSIDs to not be exposed
>> to user space (yet user documentation and messages to user space keeps doing so
>> in this series). Support for IO alloc in this way is unique to AMD. We do not want
>> resctrl to be constrained like this if another architecture needs to support
>> some form of IO alloc and does so in a different way.
> 
> This isn't unique to AMD. Intel also ties CLOSid to control features associated with
> I/O (likewise with RMIDs for monitoring).
> 
> See the Intel RDT architecture specification[1] chapter 4.4:
> 
> " Non-CPU agent RDT uses the RMID and CLOS tags in the same way that they are used for CPU agents."

As I understand AMD uses a single specific (the highest CLOSid supported by L3)
CLOS that is then reserved for IO allocation. While both Intel and AMD technically
"uses CLOSid", it is done differently, no? 

Specifically, is this documentation introduced in patch #5 accurate for Intel?
+		The feature routes the I/O traffic via specific CLOSID reserved
+		for io_alloc feature. By configuring the CBM (Capacity Bit Mask)
+		for the CLOSID, users can control the L3 portions available for
+		I/0 traffic. The reserved CLOSID will be excluded for group creation.

Reinette

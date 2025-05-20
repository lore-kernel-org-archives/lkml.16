Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CCE241696;
	Tue, 20 May 2025 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757211; cv=fail; b=LkUrQAkFAnBXmeo64gkgmzq61bUvUfkIztqT3e19TCezS9YWRlzjYU4GWOZ5UNTUksxe8iOjojt3FPEWWTNmZravGg64j8zobF/fBcYuc3OMwLqk1C8czkOlfHTqH0SnydGnl06tHkKYAtsjT5W1eKXq0Um9kpBrQ3TBIXQaYkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757211; c=relaxed/simple;
	bh=Mw4/Fx+weuneIEG17/Be/ktyCixTbDvhbU1g3XuqWIQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RsCUautgssUooEpYsXdiNcG44NUY2+1c3Za925Ga27LXthnXhaxgWiVW02rU4ti0JVSo+tCSlC5AD5Ro1NAi/NkodlKzlN7eKAbAz25ZRNRbnawrMXlduLXPG0aMMKDJJlQz/FwiUXXPTa2clfHKrs94A4Hh9UuqcEmpWtON474=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhgB+y31; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhgB+y31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747757210; x=1779293210;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Mw4/Fx+weuneIEG17/Be/ktyCixTbDvhbU1g3XuqWIQ=;
  b=OhgB+y319lVb80aXR1ajeJi+4H2lmKyqWv09elxo3V2ir7LfvfWU+ZMb
   jEbEL4rq4/TcgyOK4xb1Ah2YMTrGtcXVNhhgrYHqcED77YAFVzdREC+G1
   lvqapAJ2n5iIxOtqmnSlAoMVVuq4Nu7nLDVyaeX8RIkn1Uwk6wlfC7Wj5
   P5V/ad5Wt8SBxVLu0WJ9GB9zkIpOPAmRE9gvIyjj34O5D63WBvIaHUcI5
   TCxBUtWDlop/JS4l7WaKrVNTF6+ckYyHNiJ9nWZRIEftknqsYDmSV0PA4
   iX8LEhFJNVr2ez7K7/UtObnv4gHDKRSEd2aQkFSSOYpnC5JS4WB9VZTkZ
   Q==;
X-CSE-ConnectionGUID: Rx4kbVbdShaETLkgIU5DBA==
X-CSE-MsgGUID: 4K68egZGQyeFOYJFsRmAgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60357467"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60357467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:06:49 -0700
X-CSE-ConnectionGUID: SWU+ouZvTn6UIwaQNIrfVQ==
X-CSE-MsgGUID: A0JaF1JURR+TKYGlJejbLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139586448"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:06:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 09:06:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 09:06:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 09:06:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojkGrucKvb5iQUQh4ooz6prYM2asxqwLqFzQZ+K2EzJWLwgQcOgyRz54fBOpNfuL6WF3OoXOsfbGY2faK6w1w5pDW/zf34M4X9rxR2rUJSt63qGpGF8htaR/bCx70O7kH58QJXCxvjGcEYjreeP3GtSdSyTs08bsuxT10nfcRUi2j00uVIrq92cyV0Cg/DNZQzXd6mcRdmEqRpIWJpYpQfw0sjJzb33bgHciX0Ow8p12MTo8F0SMrYRsG9lQhpkruYVOWNCrucRIlS7k11GgIJQQpzr0R1Tn6O4K6Dep3DwaV2OfeOaTIu0UyiPa3om4akuaNMuVf3ti1ieiXh7Xhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGe21YaqBTgy0DUORJpFOloVUmKLkw3H0XJnaqDE0yM=;
 b=iepw7JeR7zPtthBSFVeiXDpB8JAyi+/2TnYiZGL8F3mlA8aO0+UcFOzTNe1cSoT5nVwQjjBgbIgzn2ndbbtwE6TsY/0dWB8qCnP7EuL6++H6kTnV/euBrjRxgn8I01QCudhb/Hc8h0fcUONNNl3+xqfkNYqCCknit7ooDkQ6yiK74tHJdFLG3j5G1zlus4iSEq/GWAQFpySEr2qLBEtfVjjF5dmLr2/yWRhW3BS9DEMQzDZkEs0cFUIIFz1J6fGEfTHZmK2SS9dmdgngYWYqcONuvlafkFUO0FFhdEbvYMkGp87vHyjuFeNToaooiMOGpstIMF1Fn2v6WfjoIak/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 16:06:39 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 16:06:39 +0000
Message-ID: <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
Date: Tue, 20 May 2025 09:06:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: <babu.moger@amd.com>, Peter Newman <peternewman@google.com>
CC: <corbet@lwn.net>, <tony.luck@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM4PR11MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 16abe764-c233-4b83-ee68-08dd97b84dc1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEsya2loVlg1Z2JoL2YyeHljRXN4S1duMHRRQ3loSWIwTk12QUFDU1dpRE9M?=
 =?utf-8?B?MWtRbG5RM0FGUHRJdC9FZU5aRHIxcEZ1ei8yWjBkeFlqa0RSWGlmZVBRUUE2?=
 =?utf-8?B?dW1xU0dPR2tmY1kzekpvSTdqV0UzNUluamxSZUk3YWFSVm9WeVFJRlFFVGlK?=
 =?utf-8?B?blpOV2l2QWRpOUZ6bUVaN0xOZWd0VzJwb1JwMmo4SG1qYjZLUE9FTmhRSS8z?=
 =?utf-8?B?dUQxYi81b2g0WVg1dU50QkRkUm1EOVlIWVpDNmwxditCZWw3NVA2UHQrbFh2?=
 =?utf-8?B?UUxJRjdXVm92TEZZUGY0S0FKODNSWTk5Q0RCNlhjVGtEZVNHRkpoWmhlMXJN?=
 =?utf-8?B?TzRXdzU4ajNSWUV3RVNqU252cm42SDdmWDlwWXl1cXlrL0ZCZ0svYlhyWGdn?=
 =?utf-8?B?alBtUkJpRmFWalU1Z1kxN3JwRjZZdXI0c3VtLzBlZnA5MEVSWmw1NUJsWGdp?=
 =?utf-8?B?Q09tM25kbU41bHBrSmxEanhTWUFkVFJRSHRJRlZtNGFTV2VoWFpvUFgxaGl2?=
 =?utf-8?B?UytrakZDd2NXa0NKUlhKY2dvTHNpUGk1N1gvc2tiZEhlWkdncEVDeTFtaTIw?=
 =?utf-8?B?M3I4UHpZaTVnditva3lrVGlEOG5Ta00xRlZsVzVWUlU0eGt5ZkdGU2xZOEIw?=
 =?utf-8?B?NDN2aE1kZUZmYm1NZkpZWjN2eTJZRmNvRVV1OXFjRFlSaFBRVktMU1VtTlc4?=
 =?utf-8?B?dHBDTzRRNjZQbE1ZQk5XczRqRWJXV3ErMUg1Y2VtWjl2QUpIUzdHNy9WZi9E?=
 =?utf-8?B?YncyQ0cxNzVjWC80TFBuWWhrcXo5T2hFTDNxS1pYWWxhZmN1b1NHS2NrWWdT?=
 =?utf-8?B?bDhRSmJtZHZEY0FCTzZOVXl1RFozWEZXS0FCdVg1bmxlZ1FFNnY1ck5nZmNw?=
 =?utf-8?B?UHQ5TGVzbjlKeW5OTDF2MmNRMGUvY0hUNkM3YUNCcnRvQy9qcWM4aVZMbERC?=
 =?utf-8?B?Z3NUbTNiVFRUK0tQb0Jya3czV3p3TUcrRnBKdjFaK09ERVBTQmRYY2E2U0Jk?=
 =?utf-8?B?d1JRQnVyODgzRDJESzUxTzJMek1jY3JtdjBNYWJuOVpERmMyWWhWaHdXYlB6?=
 =?utf-8?B?a2ZiUzNPME5OYSthRm83djd3b0lTL3lWcmdTZUV5U2JsUy9aa05pb3I5YU9a?=
 =?utf-8?B?cFZIWDV1ZllKMnlpT2ZKRk8rS284cUp2Vm9hcUFITERDWmtnOXhsU1VRSXFJ?=
 =?utf-8?B?YmVUWWtSOUNVMjYzMmpVTExqcFJDVDZmV3B0ekJLMHlTaHk0aHFoZjFXUlpG?=
 =?utf-8?B?bmJtVjczUGtZR2lkVUJNSnhVMm5XSzZQTGYvb2RtN24zWXU4alRKWkUwUW1X?=
 =?utf-8?B?eGd4Q1RFOU9LTW5DdjF2R24wQU81aWpXUTlZWCtNRU5RSjlzRlBQeEVmZkRU?=
 =?utf-8?B?aDZtZzNmYktLMnJ2aWpoV0FEVG82bzNIbnBTVzYzZ0dEQ1hmQlcrQStyZ2ts?=
 =?utf-8?B?M29vc3I3T0czTzFFNDNHT1htTjNTRTBiZ1U5UmJxejJsOHVhWWdkNW5Bcklh?=
 =?utf-8?B?WUN6ZWtJdDNrQlpuWFVWakhkcmVUZTBITXRyS05TNTV6b2piZlpMbitxaCto?=
 =?utf-8?B?THFYZ3U1NVZ1TnZuUHJIaEJ4MFlLYm03VEx2M3RTYmlFRnJyVGhEV1dFRHVp?=
 =?utf-8?B?bm1ucnc0RVFwTCtkMW9leXdSeUhySGVEQWdDMG5UN1k0ZUZjRVVFTythMWhR?=
 =?utf-8?B?ckZFUDRzUjVZbm9DWTVaVFphK0o2dG5ZUkNjZlQ3M1ZXcndoYzNRZzYwTUIx?=
 =?utf-8?B?eTd4c0FwWGUyZ0w3aEYyd0hXdHdkWEhidW9uOUxNZ2lGV2JiZmdBQmtOTVpP?=
 =?utf-8?B?NWFyU1JJMzhJbVZOdENuY1BMeEIxQ1hrd1JqSk95T3hiaXZPSmZvOGdFNE5E?=
 =?utf-8?Q?TGZCwWeIt/Kqs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymk4cWlyaUFkQXVwRzR5anhrRHhtNHNzOFRGRjh5blFJYWJENkRyRzgyYjlQ?=
 =?utf-8?B?cCtBaldTODUwUFBueU9EQnphZWdGSWZvOFVZM2N0QThBdGhaYm5lcHBiUGF4?=
 =?utf-8?B?NitxZVdaOE1wTzg4K0k4bUh0MElURmU2dUxYb0FQK2hPaWJhYTZNZk04TW12?=
 =?utf-8?B?U0JiWWtidnFqalpVM2NCdW9RNlNBSElUWW9qdVEwb2RzM2l5YWdkSHNHQ0tI?=
 =?utf-8?B?SGRDTHNFamlCQXYwMElKMVF5RmZTd1JjMndtUkR5YjQyeHpKbWNWSG9LR20r?=
 =?utf-8?B?a0x0RXJoeVZmaTdGVHQrR0k3d2RoS1UyWk14NG1sZGphZnVVdmZkZkJ1UWlh?=
 =?utf-8?B?V1l4SDUrVE5MZlhsa0UxenBJZm5MUHp1eUd5TmtzY0VVWlNiZEhnRnZGUnZh?=
 =?utf-8?B?ZDl0SkVFRElCYmxKNEtJWFN3eFJwS2FaRGcydUY0aTRiakowb2M1Kzhldk1G?=
 =?utf-8?B?Q0o4TkVxL2x3amtEWUlMUVd2S1cxTk9HSXdHaGJXZVgwYVJwbXFyTGtjWnJH?=
 =?utf-8?B?YzhnaUxaZE1pL0R4cGQ4bmJheHl6ZGh5SWZXVklLOHVPbFArcHNQOGdIdENh?=
 =?utf-8?B?TUFSNllWaG5lNzlJdFFKVytrbjFnYkR6K0lrTVlYbTdidCtOVFpyTTF0ZW44?=
 =?utf-8?B?am9yMHpZd2RqaDVGbVZIeVVCUG1VK0ZxTHNrdFh5V2ZrSGJyUUo4MU55cDZV?=
 =?utf-8?B?d21FcU5hcmQ4d0wzN2R5aWVNcUJWS2NpcmI2SXlpTWhqME9GbjhXd05sY2Rr?=
 =?utf-8?B?bXkrcXVSTVZJYkh3c3BZa1NlQ2JZbXFnUDdzWExVMlJySVJCeUQraTZDWERJ?=
 =?utf-8?B?V3RnYUtvT001QnQrSHNZY3dENDY5VDRDWEhDQWtLTXR5S1NrM2ZPY2NqYWx4?=
 =?utf-8?B?RllGTkZDUmpYZS95Qk16N2dXK0V3Ny9PUkg0UjVSWjhRL2lnNlVKT3pUalpp?=
 =?utf-8?B?RXJqbXZ1MTFZdXd3dDR0c2xtNTRwRW03Z0ZWdGNjNW9SUGxqVDFsM2ZKNHlw?=
 =?utf-8?B?V1lsenVCc3k2bjF2QUwwZWwyOFIrTERqUFVOaDdMYkV1aitHSFpYK1ZGTzVr?=
 =?utf-8?B?ZTFBdlhyM3QwUDduZXdaM3Y0WnpqNzRkUlpOM1FCci9zeEYwSktWbGh2aTh3?=
 =?utf-8?B?bVRvcDhCNDZFWk9kSHlWbG9wa281VlhBLzVldU9NNHRPdUpPamx0aDZKYkQr?=
 =?utf-8?B?ajRYVk9TVk9iOHB5a2FjaTRnaWtTd2IvVzA3NXJxem16aUdxMVFEZnJLRG1X?=
 =?utf-8?B?VXVNQTlVbjVJcndmZ3V4SG11N29nTEl0SGVVbXdROXl1Y3UzNHd6UThGdkt0?=
 =?utf-8?B?V283TjU1R2dmZ0xBQ1RFVXNlSGR0aHUzdXVnVGxNZ2NSTFBBSk9PQnRiZnBQ?=
 =?utf-8?B?WWNOdWREZ2tiL3BPbG5vTzZvdEFuV1RLbGNGeUw0Y2xYMURJaWpZSjV6Z09I?=
 =?utf-8?B?YS9kaTZRUC9NUjUzN2dQc21IWFJlMk9QVTlLOHpLeVQ4aXAyTVRvQkNDUm1M?=
 =?utf-8?B?UmsxQlU2MVIxVkpST0VEdTVsYm13L015NzBGYklnejkxNUxLSnZCTXVROE9E?=
 =?utf-8?B?NXpqblNqa3RhU0VaUjUxRW1KQzUrWXpEbGg5REFKZ2NlVytkczRVRVJSSUc3?=
 =?utf-8?B?NGwyVlNxcmpwd0JTSFpKd2Q0MDcyNmlpd0xMc1ovWDhNNzZZZjdIMnc2bWx5?=
 =?utf-8?B?cURqM3piMVZsWm1OZmtPZUxKVkV0dlVZcERvekppMUFtMGd6bm9kWDNVZVFE?=
 =?utf-8?B?V0IyMDQvWEJtR2F2RDhRRVcrajJoeGR3QnRPdFhzSWI3TmtRWjB5T0FTSDhl?=
 =?utf-8?B?WEVQV2xWd1RlUHozWEdzQ00xNDdXK3crWkthYUJMU1ZlSHRSMGx4TytycnlG?=
 =?utf-8?B?aHo2cWFTb0tQeTBSMnhrdEZaWTRNa0xrRzJOci9pU3BNVTArbEVqMVUrdUMy?=
 =?utf-8?B?ai9hdmlVakJlQzRRMG1LWCs0Z2pkOTlPNFJMbEJXNUphOXF4WE9PSmFLMTdj?=
 =?utf-8?B?Y3pWQ0tTNGtRZVk3bUhqZ2wzeXdadGtMSm12a1FMb0JPOVFaNEhvdWw0cHM1?=
 =?utf-8?B?b2hmMSsrRXNFQ2VtSE1CUlliSHp6aFRaMUlTZ3AvckdVemFnZjZBM1BDc09z?=
 =?utf-8?B?cFlNM256a0VJK3F5aHlNRjJiTjZrRlhJUm9UczNiK1FBUVRsMlpaNzllanBz?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16abe764-c233-4b83-ee68-08dd97b84dc1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 16:06:39.2271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbPPUwX/LLbM8xvrAe6Hn9QyYtCxvrsnKTVTQ+Rt8MV6ftnhQC/l9jPpQCIBxLAjvz2OaGeDtSKlI04hJ2D109JJ5wNUwCV6qgH9qVgkIIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
X-OriginatorOrg: intel.com

Hi Babu,

On 5/20/25 8:28 AM, Moger, Babu wrote:
> On 5/19/25 10:59, Peter Newman wrote:
>> On Fri, May 16, 2025 at 12:52 AM Babu Moger <babu.moger@amd.com> wrote:

...

>>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
>>> counters available for assignment.
>>
>> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
>> represent in a "soft-ABMC" implementation where assignment is
>> implemented by assigning an RMID, which would result in all events
>> being assigned at once.
>>
>> My main concern is how many "counters" you can assign by assigning
>> RMIDs. I recall Reinette proposed reporting the number of groups which
>> can be assigned separately from counters which can be assigned.
> 
> More context may be needed here. Currently, num_mbm_cntrs indicates the
> number of counters available per domain, which is 32.
> 
> At the moment, we can assign 2 counters to each group, meaning each RMID
> can be associated with 2 hardware counters. In theory, it's possible to
> assign all 32 hardware counters to a group—allowing one RMID to be linked
> with up to 32 counters. However, we currently lack the interface to
> support that level of assignment.
> 
> For now, the plan is to support basic assignment and expand functionality
> later once we have the necessary data structure and requirements.

Looks like some requirements did not make it into this implementation.
Do you recall the discussion that resulted in you writing [2]? Looks like
there is a question to Peter in there on how to determine how many "counters"
are available in soft-ABMC. I interpreted [3] at that time to mean that this
information would be available in a future AMD publication.

Reinette

[2] https://lore.kernel.org/lkml/afb99efe-0de2-f7ad-d0b8-f2a0ea998efd@amd.com/ 
[3] https://lore.kernel.org/lkml/CALPaoCg3KpF94g2MEmfP_Ro2mQZYFA8sKVkmb+7isotKNgdY9A@mail.gmail.com/

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612742512EC;
	Thu, 22 May 2025 16:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931606; cv=fail; b=UmAZbEguBh9AFHQuvdW96cy58d2e2qBSEVtOd4nePejjwfqR16yhRIh427G/oAz9+PNn24duq/p2bkSvOcNRlzeFAgM0cWBEW+S/ztgyOrupxVHgyRIKI57Z860DF+hqY9ZNaSlQ9neyZ2zYPiyvfUGBcOaoGRNeFhnQtbuuWZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931606; c=relaxed/simple;
	bh=oGRgAyg2opl/SC89BETBFq2CnxbGj5RFcyprZl9azRk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uGriOVnWdsU6mhyQbwObh7j0VQZ/rluK0ikZOB2sqAz33c3skKvefTI8vph5MTUU3vMAPELcASrubDhoXQINRQV69qeBESn5OSIZmugp9uEQhAMTzAuq+rsQbIbrO7chvmTBA/ddvSK62vqrR1KedbeOMdPjftyRqRud7BeZbOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7RF0so9; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7RF0so9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747931604; x=1779467604;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oGRgAyg2opl/SC89BETBFq2CnxbGj5RFcyprZl9azRk=;
  b=b7RF0so9lYKiuVC1N01qmiVH4H2AfAcFbRRsSe0OsiJuvw+/VbBtXRx3
   rls1zasABMq04VxBM9H4rKRCPHTDD9WWimMP56AF1j+MCbPk1BXzWSph6
   l3q87Q2x0JkjnSmzUf4Hk6Mv2wELyAiyZalL/3VJFSlM84q32+9jP8myQ
   28OoI8o/iLSfEpGuPaBVZ11sg33TSzWxKosD0sm/aHQg1hLUKKBI4noI7
   a/VCAApj+Rml6IL1Mpl0eSr6dPg49xqYT/3+X+eDwY9+iH1v1Pu9x4fS6
   le4xQ3ojSLZi89nHg/MtvsG+r5qGAh6OmD3UN7a+x197ee3YtAtSlF3bT
   g==;
X-CSE-ConnectionGUID: h/Z0lTBgTM6rIDNfnNfjvg==
X-CSE-MsgGUID: G4ebxOcAR4GVEJAcpsB4Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50079591"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="50079591"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 09:33:23 -0700
X-CSE-ConnectionGUID: OR81i7Q0R5OjmILFdgVT7A==
X-CSE-MsgGUID: RJxEg71NRYyrx1LfdlGFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="163940629"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 09:33:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 09:33:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 09:33:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.67)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 09:33:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+0PG6dTWQEocRNi7qGX9MSP5pyBls278BYBJ6oYsTZMubMswOe+ITbowDmh4EgTFbF9x0UWE8x7m+Dvm49Afb0AOuUhjifLwnIoVXrj71bBhzwPY0kl8qVUL1JxnAdmzhdh/+497EUzwnsKzr5u4I5f3nmUo/QWCQIWrIGIA6mu6vOUZixcwrV+uTPimxNu44Z/usfeYxePXZ2Hp0oqKnwl0MNutpGccpjUBCQ6dGWRkoNB8uPuCFlNL+rNTylueUk4avl9qwW7OhC8lQTbKSbyXhfkOlaDQAfBc/1+V2ZvOLKrzNrntlQNrdwLuXMRobCZMrh4d6Ac1hLy2tL5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UC/WR6ov8XH3u5ob+N6cmKJogctZSDlfZMBRk/Mlhck=;
 b=RLlZRmzUq66uPuWhL0y494n4R60OwfVuLHWDquM3XtsSQAr69vFVT1LPbIMpa5bFff45rXBtBjmF8OYQZKrhWUgWhLu0xc245rZEHtPSSWQ/dEmamTDa46WOdSTsDParWomLTDY5xJq+fai9EOZJ9T22YCIvFqJU3th7aj2+oEL/MxK798wpx8V4aHEV4DBj7NyyfSvkEX8BprpRO70yCSq3Aovu07jBH5aDy8Evmv638UargAmDr1r04e0Ni0Ib5W5SgPTEkISbqm8tjl5symFO7lZViTZtmsryE0IAJ8n3vhjBi4ZKBiroi1IqeCQiFLQRLBlZl4lnJRae3TlT7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.33; Thu, 22 May
 2025 16:33:18 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 16:33:16 +0000
Message-ID: <f00bf71d-3fbb-4ef7-8071-c0fb14111d8b@intel.com>
Date: Thu, 22 May 2025 09:33:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Peter Newman <peternewman@google.com>
CC: "Moger, Babu" <bmoger@amd.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<tony.luck@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <james.morse@arm.com>,
	<dave.martin@arm.com>, <fenghuay@nvidia.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCgtcz6tZnmeH8v4r2=HRVh7qEDZgraLU+Euhq3qLkRZhA@mail.gmail.com>
 <31aec24f-b3df-4a8a-910d-6df175962e84@intel.com>
 <CALPaoCj438UfH3QA_VnGo-pj2a_48sJufUWjBKT3MQatcMJ_Uw@mail.gmail.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <CALPaoCj438UfH3QA_VnGo-pj2a_48sJufUWjBKT3MQatcMJ_Uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d76558-905f-4ef2-e260-08dd994e5ab4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emhVZUxGSHo5N2ZZZ0MxRGxWMGpBT1NTdXZGS0ZOeW1CcXNnR2g2K29kU01C?=
 =?utf-8?B?VndkYWptaXd0ZzFQMVp2TmVlNTFsVnFsL2pwdTFEZDZaRExwVDExUElTNEZk?=
 =?utf-8?B?SFh3TGhSc1prb0lMQTdEVTVMTlE1bW1jZ3JkajVqN0RNMlhZNUpJMkYrSmNX?=
 =?utf-8?B?bVpaZWsxOUhOV0RLMllPS25lTFJUN1gvVENWMG1VOVZ1eit4WXU2UzB0STFj?=
 =?utf-8?B?MFIzcUtHdUpLdDBFZmxhcHpkK2JXTmk3QzJ6RS92aGdZQUJJYkVma3ZKZTdR?=
 =?utf-8?B?d1A3d3J0a0dVSGtlL2R2OEN2MU4yd3hVYWZQaEs4SnYxU09QN3M1QlVIMXdH?=
 =?utf-8?B?ZVhnaXFIQXE5WmYzZGtVQkFJaGRQZlVDRFFZMmUrVjRrKzYwM0JJN3FIVUhT?=
 =?utf-8?B?ZGlqNU1MNUFYeXp4OXlxd0Y5SHFTWUhVV2ZWdHJLVlhiR0RuR2EzYVJUd21l?=
 =?utf-8?B?SGkvME5rV2k3WDF0eFhLUVVaemZRbC8za0hseUxJS3NhbFViWDFBdkhPaVpo?=
 =?utf-8?B?Vmp5ZlFtSnFwb2dGaGNPVjA1aFJjVjlEZnQrTlRGTDdKZExjalZLczgvV0Fa?=
 =?utf-8?B?MWJIaU4rK3BtbFpWZk5tOHF5NnBmUVNzdmVBUzZMdExGVjQ2dk0xa0NLaDh0?=
 =?utf-8?B?eGZEaW9XOGdrbzJxTHNhUHJjRWwvUlloMHVrR3RhdzMyNHFyeElqYWhQMEor?=
 =?utf-8?B?K0tMVDJOVGQrR3dKTGI1T2ZBdS9VeHVJdWt4VzdFSE5BcmhtSnVsb2kxMEsv?=
 =?utf-8?B?cUxZVjFMblNyYUVhS0wvVWNtaG1LLzVQYS9BMDN0cEJIS2hGaWFmUnBVZUls?=
 =?utf-8?B?em5pcHpNcHR5THh0NDJuNnJxc3JzelE2Q2VoY2xEWUlLY2ttb1l3OHZTRDkv?=
 =?utf-8?B?YzR2YlNCSlRZL1lLbGVLb1RONjBLVUM0L0QyZU5EVGRrcHhlVGRoQmFmbnpH?=
 =?utf-8?B?TDhJK0dRcVhoYk5LV1M2U2E1WFlDRUI1YnpOUkV2K3dnOVdLbUJ5cDQ0TUoz?=
 =?utf-8?B?SDljamQ1RHdhVUo0SU5BUXFka0F5NTd3NFVzRW4rc1BLTk15enUwZXp6WlRi?=
 =?utf-8?B?eGJUTlZ2SjN0WEVEL0V3NHBFQ3NUelFQWktXVjl0TWpwM0xVUVQzQmp6WWtt?=
 =?utf-8?B?N0p4RzgrVFdsQ0dDS0lTek8vcEtPSyt4SGF0bW03YjlkdUVqc3VVNWx3VGJz?=
 =?utf-8?B?SEljN1VGNlNKZEtKYXBOUnBSYkZXL0FJSVZJQk11cElwT21VS2NGL0Y1Qk9q?=
 =?utf-8?B?SlA0U1N1Tk1qUHlhNFV0NllHRjhGbG41SzBmK0pobnR6U3plcEFyQlhVK2Zi?=
 =?utf-8?B?KytLRy9Nd000cWtiUWVSS082VU0xaEoxZlhBS0RzK3p4QU50Uk0xcnRMeUZi?=
 =?utf-8?B?TXVLWjF4amhuVDVMTTNGM2hRR3ZVVUpDMjZ1RnAwc2srVDB1L0dOTU56UXZh?=
 =?utf-8?B?T3FwZm8wSkFKd1RVSjBXczBDR0Z6aHBYUmh2VXp5N1NHZUJJQVhKOE45M08r?=
 =?utf-8?B?L0FCRzVwOTQxQTRsc3I1TTlFbDJTTk1icDhkbnpMOVhvM0YxT1lKTHpsWGNL?=
 =?utf-8?B?M0c5cnRQOWJmRTY0TUUydnRHcUY1WnNQdExNajlqTGJ1dHg2TTN1a2Z4TEJV?=
 =?utf-8?B?YVVCdUtseXdHS0lOMUhGeFFzdDZwVU9sbVpLWkgrdzJuUjFNQ0VlR01zRXpG?=
 =?utf-8?B?U0o4RllBQktoTWFuWmEvM2VYYllIdDM3N1RFaHY4R0ZJRFNGU3N6bFc2RjRX?=
 =?utf-8?B?bjRmczFoUDF6dGFab0FXQnJHNGZ1YmJjWDRPQU1DWEo5WjNKTDFBN0xGZFQr?=
 =?utf-8?B?MURIV1pEZFVLQzNrdjVtWlNUUm9JNWRteTlpcFROU25qaWxRd0dIdHZyR0ZX?=
 =?utf-8?Q?3vam/NBQkzBH0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzVFcTNTejZjYzFDN0VvZGZnQk15SUF3KytNTWcrdzRxY3d1QWUyeGo3TTA2?=
 =?utf-8?B?NVBXTnpzcWZZU3FZZUE3K2twVk1tYVpCU3hXT3ZJa0s3aHVEVmdYNTgwZUVa?=
 =?utf-8?B?eFFwRHBDVmZocXBweDBhRG5vZ3ZOOW8yaXNUcmhvUlRHU1o0Nm5zTm1va3lO?=
 =?utf-8?B?NlRwcEY3ZFZQcm04YU5rZ25kRGI5Y1hkaE5IbGplc05iWmFYRFJUUmRscUpL?=
 =?utf-8?B?MEJVTDB3VnF5dzhuRGtibWVvOE85NmZENVFINGVBa2dBTHhaVVcxYU9keG9S?=
 =?utf-8?B?NVFyUlpSRFVxUThyQTdTS1N2MXhYTHFqSkRHYy91OFpCSENSRWs0Wk5BUkNV?=
 =?utf-8?B?SmF3Zzk2WU9vamY4cmJvOEpEbmNDZi9iSVBNNlpwS0xGNTJmS01jcVlTWGxr?=
 =?utf-8?B?eEk1cHJER043QzhnZ1lqOWNJSnhXR0xDT0oxZ0FkOXhjVlFqMnMyOEluTjNr?=
 =?utf-8?B?UHptWGtnUmFHVndoOUpSODlOU1lSTllZeWVXSG5JVkhITStBeWM4eGNPTXMr?=
 =?utf-8?B?QlZzakNFK0dXU1FxclpoSDlod1I0UUhiTW8wVzRXcWwvemsrN3p3VVRvQlpS?=
 =?utf-8?B?MDViUHdNN3dSZk1aNGlIcFJXZ1k5MTBxNW9PaFhHK0NkSkw1SVp3T1NMdmJB?=
 =?utf-8?B?SVVmcmJBd1JremVRVmZuZWR6T0E0RXQxTGEvdGRHTVV0OUNjemRaWmUxcm1V?=
 =?utf-8?B?Mi9yOXRSZExFQVZOdDdxUFVRN1c5NjlTb3gzQm5SNEFpWEo2QUxJWEFsR1l6?=
 =?utf-8?B?SGFEMjllbWFqR3VLd2UzbVU5Mi91Y2pGYUJtc3labHdzNVBlWHFNVEowbmJK?=
 =?utf-8?B?cEpOYU8wMC80aTFyNEVUczljeFBEa0dQeTV2Q1lBSzErbHAwY2k5ZXlCMXhj?=
 =?utf-8?B?UEhPZC9EWHA2aGNnZGZBSXRIS0NqcXYzYW5JSWZDS2ZKYyt0QncrUGNaajZT?=
 =?utf-8?B?TTAwYmlYalJhZFZTWkZoSHM0UHRpWlpoZnJqUE8xTzI1MW03d3h3VkJzSm9w?=
 =?utf-8?B?MHNLNWlEL08vMklKREo3cmdhZkpyNWJjRUxxUGxVdHJyYVdVekNNdDJqUU1v?=
 =?utf-8?B?cVZTL0gxM2E2T0pzb1hYU3F3K3JxamlCVGtYa3NJTzdBTVZNczNBY3F0NlBP?=
 =?utf-8?B?ZmMrZlhyWStuNi9zOEVqZVJlWkRuSTRHUENIdjJFMlhsL3B1cnlnOG9CeDlO?=
 =?utf-8?B?ZjNtdC82dnEzSEh1ZnV5dzdYczBtMnRpUmFGOHdkeGw0U1RtWExmcFVYSm5X?=
 =?utf-8?B?d2xodklQVzZUUis2RWUzR1dWdXFtY1RYRENUSTMyQ09qT1gvaWVyWjU4ZjhZ?=
 =?utf-8?B?Rjhmakl0eHh1T2pIT0Fma1lZQ05QN2NFZ0JpQXdOVThpRWRxOSt4RFN1b2VC?=
 =?utf-8?B?MVFlV2N2bEkzVGl6aGcwYzhSZE5zWGhrWXMydzVIczBJYkIzTTF1Y2RyOUls?=
 =?utf-8?B?akxiZE5rVmlVdk05WXZiQVZoRFNMMHliaVFXMEVYM0pMUlovZDdvZmozbjlj?=
 =?utf-8?B?TXU4NE5FNkRwbjBYUTM1NjlHdmQxdHlhQmJvUTczVk14WTBqNTUxdUhNZTZG?=
 =?utf-8?B?RTR5bDJQK1VtY1Q4Y25CM29FYXhzSzVFcUZZNytHSW5xZW8zbkZkRk1LeTdP?=
 =?utf-8?B?amVnRTFzbElBeUNVQ3JSSUdBRGtGNDNiazh2SGpCUjRxN3NlZm5ucTVBYTF4?=
 =?utf-8?B?aGRrL1J3ZEdTZ1RDVFNtUUdBdlIraFZCMFNDeVFBSkhVWW1DUWRWa2VHMlJR?=
 =?utf-8?B?ODdBVFZpQ1VNS2NKRWR2Q2RjalVodFFZS2x5WmZaQzZ0LzdmL1M4V2QvOTlq?=
 =?utf-8?B?RExBdjAwNVFlREY5ZGJVNG5YQ01GQjZWYmg0NTJsd1FPeXM4RTQydS8wQ0xp?=
 =?utf-8?B?ZWZFa1VOK0hkbUVnV0dLa0dOb2NOa3VBTm5NMXVGUnI1eFVDSWwvNWg3QnMv?=
 =?utf-8?B?TzlQWkpkM1NTMWRGQUZKYjBKMnp5M2hTZzFtNE1pUWxCYmVtK0MxZWs2TnMz?=
 =?utf-8?B?c1YyZXNYT2Yzd0FNQ2Zkb1ZHeVdqWDRsczRYU09rWnZIR2JsUUhWN1hHNDAx?=
 =?utf-8?B?NFcxUTZvZGxRdnFjdWJnMGFTZXBhMGxOTENkVzhObXFTc1FSbVREd1dqRlhH?=
 =?utf-8?B?bml2N0lyNHZWN0VHaitmNjRrSnFTd0xxVlovamtNVDV1Umd3TEtaMUx2RFpG?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d76558-905f-4ef2-e260-08dd994e5ab4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 16:33:16.6164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VC4YMnJcVtO1sFMVXlASkEeT2Pe0X6F/ydXynJomtcQnZrOqgC3TbNNh5jPVE2h+WLqLENm6Jw/9cPDZzdp4FFoVC/CyFjMbTTzV5F2cuRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
X-OriginatorOrg: intel.com

Hi Peter,

On 5/22/25 2:14 AM, Peter Newman wrote:
> On Thu, May 22, 2025 at 1:05 AM Reinette Chatre
> <reinette.chatre@intel.com> wrote:
>> On 5/21/25 7:27 AM, Peter Newman wrote:

...

>>> At the interface level, I think mbm_L3_assignments on a non-ABMC
>>> system would only need to contain a single line:
>>>
>>> 0=s;1=s;...;31=s
>>
>> It should be obvious to user space how to interpret the fields. When there is
>> thus a single "mbm_cntr_assign" mode used for ABMC and soft-ABMC a single
>> line like this would be difficult to parse since that would imply/require
>> that user space knows whether it is running on ABMC or soft-ABMC system,
>> which we should avoid.
>>
>> If there are different modes, for example "mbm_cntr_event_assign" and
>> "mbm_cntr_group_assign" then this could be used by user space to distinguish
>> how to interact with mbm_L3_assignments making something like this possible.
> 
> I meant to say I was proposing the format of this file when in the
> group assignment mode. I didn't mean to imply that a separate mode
> wasn't needed.

Thanks for confirming.

>>> But maybe for consistency we would synthesize a single, unmodifiable
>>> counter configuration to reflect that allocating an RMID in a domain
>>> results in assignment to all events and deallocating the RMID
>>> unassigns all events. We could call it "group" to say it's assigning
>>> at the group level, or perhaps just '*':
>>>
>>> *:0=s;1=s;...;31=s
>>>
>>> I'm not sure about allowing a '*' on ABMC hardware, because it could
>>> be interpreted as allocating a lot of counters when a large number of
>>> event configurations exist.
>>>
>>> *:0=s;1=s;...;31=s
>>>
>>
>> Either could work also. Whether it is "group" or "*" ABMC systems could
>> respond with "not supported". Will think about this more but would
>> like to hear your opinion about the flexibility that distinguishing between
>> a "mbm_cntr_event_assign" and "mbm_cntr_group_assign" mode provides.
> 
> I agree it's clearer when they are separate modes. Between "*" and
> "group", I prefer "group" because it seems the least ambiguous.

Sounds good to me. resctrl will need extra guards to prevent user
from creating an event named "group" but this matches what resctrl already
needs to do for other parts (eg. user cannot create a monitor group named
"mon_groups").

> 
> I just want to make sure we'd never want both modes at the same time,
> such as an implementation with both a small number of monitoring IDs

hmmm ... my assumption was that a system could only support one of these
modes ("mbm_cntr_event_assign" or "mbm_cntr_group_assign") but it could
be possible to have both possible on a system. But beyond that to have
both active at the *same* time? That will take a lot of wrangling
during runtime.

> and a small number of MBM counters. I support one MPAM implementation
> that has a small number of PARTIDs and only one MBWU counter per
> domain. Fingers crossed that the number of PARTIDs it supports isn't
> small compared to the number of jobs we would run on it. Otherwise
> maybe it will work out to just pick the more limited of the two
> (monitor IDs or counters) and make allocation of one drive the other.

Could a scenario like this be addressed by "mbm_cntr_event_assign" mode
gaining support for "shared assignment"?


> (In case you read this before my earlier reply[1], see the note about
> rdtgroup pointers in the task_struct, as this is a prerequisite for
> overcommitting HW monitor IDs.)
> 

Reinette

> [1] https://lore.kernel.org/lkml/CALPaoCjh_NXQLtNBqei=7a6Jsr17fEnPO+kqMaNq4xNu2UPDJA@mail.gmail.com/

...

>>>>>>>> [2] https://lore.kernel.org/lkml/afb99efe-0de2-f7ad-d0b8-f2a0ea998efd@amd.com/
>>>>>>>> [3] https://lore.kernel.org/lkml/CALPaoCg3KpF94g2MEmfP_Ro2mQZYFA8sKVkmb+7isotKNgdY9A@mail.gmail.com/



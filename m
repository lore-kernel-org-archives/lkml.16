Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D024E4A8;
	Thu, 22 May 2025 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947148; cv=fail; b=emYMMOlIaQeovfsY9uQ8hHSk/otTetGijzESthoPyUl8dg3+DLY1kbXRBabCdPbzSlHRFM0UAHtIIbK0qpNvyj0zAgW3iYklrHMtg27l70pEMsRNKz0JkjPPKtKDUTwrrfe5jlUfy3BusKHahCRUZ82OFtPu1wIIsiuFoJ0PEzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947148; c=relaxed/simple;
	bh=gjNZdPxamPNFg6fG7ykM/LL8sTwQMlhTQF9uHkL0onM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pzVFa/6KmyKUrBDsL3/juzelY1ak09CN2tF2GpaReyoVJqMgP27EjCiAecfkXqdZTPx9X65idKiu7mFjafGGAhhsudcrl/iRMg2UvhFpq6TCabYbZ5s2ik5RoOVB7zBS6w9qbsTmFZwEE6mm5sE/Pa8Cf9xgm0JWXui/yipWBuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8PlSSkx; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8PlSSkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747947147; x=1779483147;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gjNZdPxamPNFg6fG7ykM/LL8sTwQMlhTQF9uHkL0onM=;
  b=T8PlSSkxLX2cL26YZ7PrrX4LTRPSrN8NF+3tzzTH4TB6TMiBn3Wjjs6s
   ji4JySjIlI8puTstUsYZvKXN5eOFVGDWhnDEPCKBqpNCEoJxGWBQwbUij
   BtvxOIHI0eME/urkNujX5pn5GXcEsar1P+53Puqy9IbIHUhCsGCa8bC/R
   z+Gq1XMcyTcrMthHOX9qGDRoMCWoVayvtqlkF38qp0xGH+lVTeDE1saQ+
   negzvY6EFVwQXGGDXnfCW+rik9mJpoZwCYp/dF6wiTRK2JqsYDyFYNJjY
   5VCyLEbcf3vgBndJYR7Lb6ZJZxPSd7EFrYFRvSzt1LINXda65PAmRK/ia
   Q==;
X-CSE-ConnectionGUID: Hhf9haWARaGarvCBNdKYig==
X-CSE-MsgGUID: uURuaQ4XSKalN7sSTmoBmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75392482"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75392482"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:52:26 -0700
X-CSE-ConnectionGUID: qJWRj+szQ6KZke+ycM2L3w==
X-CSE-MsgGUID: iG/Z3o9lTMW/A0dDXpDHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="171654670"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:52:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 13:52:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 13:52:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.88)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 13:52:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDkK8e6KZKKZKavjXeHYuOA9pCHnZK0Dr61uTwXElSF1pcl6oNaRfTdNY0mb4h0GnLU+oDXURRlNh00JSHAs7DFUZguXkyHwJOucabzxDTqiRUYwjAXW267MTkYUoeC0UjUnrHVyE4h8LAdStg7PfyMYk1LtoFl9MrrymKlM8slS/jJtpRoQ+nS15qU4emHEGLlSFae91L1/mkZfBdknOqPKTq8SBaTIBZttPtWM1FXN2u7dY6g3/SrFNMVVPohocXDn/EpRZVle4/G5CHlyyOh8+tEUs7FCjL70ktVfOkjk07mnFwZgdDK55zKti+YyMu+boG8vfqgE+z8MW/L+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhie54xaWpIckdAOizOhD3ITRRoK0hhNYlYlMQkN3Qk=;
 b=CziyF91i58Ymgd4yx/KvHaQPQh4PH1YYPGlRmEISAlzlgF5XZpXIqS6Y6bGC9Z1X+Gt0vu1vEQs8z7FlLvDfaLjYnCpj0pZI1q1G2aryKZYKFw3QMRh+mY1mfSbFhfFQoyTdK3hLTSAoCKsbkaAtR0j2VMZgDB5OXTBEZrXhfEf/aG2Bld0C9d1NtTSVN+gx0rMzr30uzJ20bzw/kHdZJIniQv4UJy7r3gdvrSTvFfvfXOGa6LpWnvyms+fnMwlDJYOi4SQFSZ54ApR1RlkUuz8AfNhAMNADVrKC4Ns005jjuRpkJ/Qaz/tbIuUpchwU8m6kPdFHdMpIdwjn0XH46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CY8PR11MB7396.namprd11.prod.outlook.com (2603:10b6:930:87::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.33; Thu, 22 May
 2025 20:52:22 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 20:52:22 +0000
Message-ID: <1fc88c6f-65e6-46fd-b1b0-1efbdb6c5b05@intel.com>
Date: Thu, 22 May 2025 13:52:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 03/27] x86/resctrl: Consolidate monitoring related
 data from rdt_resource
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
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
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <cb8425c73f57280b0b4f22e089b2912eede42f7a.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <cb8425c73f57280b0b4f22e089b2912eede42f7a.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CY8PR11MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a4e765-d0f2-4ecf-946f-08dd99728c7b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzRhcGdEdEc2MHhSQlljUGlVek5kdDVUR1Fad293b29IZWIxbXhwaUFTM2kv?=
 =?utf-8?B?c05tM1I5Ymd3UjRrS29oMU15U3Nkem5wZFl3SFArbTd3NW91UW1mazAxTDR1?=
 =?utf-8?B?MkZpUFU5UmlBR3RXbFRhSlBKbERRWTFRWEVBUDZ0WTg4MzJWcTRVTVJtcmVY?=
 =?utf-8?B?S3pMTUhyem83SDBNaWxCeVN6THRCSS81STVlUnBEUk5mUTlmckxPVFVvZGhp?=
 =?utf-8?B?aTJmcUFiV0ZMbmZkbGd1RTBUdk9uS05aYmpvWTkyN1dJaHl3aHI1YzRHVXlQ?=
 =?utf-8?B?NnozWExUeTJQY3gxL1IxNEVOYnVvRGp4ZEQ4OVNKTy96aExuNXZDTC9QMnIx?=
 =?utf-8?B?RnVqeS9nb0xvQnIzNFBlaDllRVJid0dKeStLL2pEak52N1NhcXRQd0RwZ1Q2?=
 =?utf-8?B?eWEvZmRXb2xCc21sdmIrN0I5NDV3cXVMYjlDRmpBZGxPa3hVTUFFcTBQNmJS?=
 =?utf-8?B?Z2hudTZ1QXFkbzBieFlvWm9qempmeGVmQzU0dVVJeGFEUms3c3pmN1FPVi9t?=
 =?utf-8?B?UjkzbmcvZlF3N25sSGU2eUJXaUEyaTdWSlpNT1VlTnorbmFEbG4xbm9TMEwv?=
 =?utf-8?B?RXZGWllDaEkvc1dQMGMvcCtiakUwRW8wVHVrbWlIR3c5cWsxcmNlSFlUSXY2?=
 =?utf-8?B?VzAxakQ4c3N2QVBLTE5uOWN3L0o5bit0KzNPbG02T2hMNTdaQnlwTExQVUQ4?=
 =?utf-8?B?aHlTL2RkRXcrMkxhN3BXWDhhSk41TC9zQzZweGtGakRFNTV2RG1kL1Z0emV6?=
 =?utf-8?B?eVZPVlU4a1FMTDhrTDQ0NzB6N2RFWGFUS3Z5UlFrTnY0OStvdC9tUS9hVEpV?=
 =?utf-8?B?Sy9IQlBVdVJDdlBMazNjYlVlV01mZVh6aVBxeTZFd29uSHU2OGNVdyt1ZC9R?=
 =?utf-8?B?WEx2aE5xc1plNUtpZkZNdlRHdGI5UGZiVHpLNXdVWjY0SXRBTG5Tc3gwck43?=
 =?utf-8?B?RzhoWmVaR1BNNEpxdmJWK09DQ2U0bjNPaGpSQnlOU0FSRXFrdG1vSUVoUGgy?=
 =?utf-8?B?NTVVRjFHaGtHdHZFd3dHZUNTREF3clVvQ2w0aUIySjZuSmZxd2pJc29ma0R6?=
 =?utf-8?B?K1M3aWxZemxZb1BBNUZCV3o2bDZhcTBoWUNBd1VLdjg4N1hRSXNrL1IvdlF2?=
 =?utf-8?B?eWZBY0R1TzM0QkxMbDRRaUJ5M2ZXQU9iZGVvdVNQSkd5OWZmVTNoSEFoSm9t?=
 =?utf-8?B?b3I0eUNrK1Z2M3c5TDRTVFJJbFRkMVA2MWcxWHdTTEJQZFlaNUtrMEJ5THZq?=
 =?utf-8?B?S3RCdVk5MGVVa3ZFaEpaaWVIRk84akJLTHFZSkQvQ1FmSEYwKzY3eWpEWnJ3?=
 =?utf-8?B?RkhTeVZpZDZtbDBOUUcvWEViZ0w1RVlCMEdIZHdQSUNlbWtuczJhRE93cGZJ?=
 =?utf-8?B?RHdBYnRoOHNiTzJJNkV2di8zeG4vTGNROHZVbVdobDhmYi9xazBhSVdMZHRs?=
 =?utf-8?B?bzNtSkxJNndSczlTVFdUNlNzVzFmVnNNSFVOcGVNNEJ4VUR3Wk5xaVdSS1B5?=
 =?utf-8?B?czhFbEpBWElpZklJbDFreXFFN0RXNTJTeFoyWmhHYUF4ay9mVFB3d2ljWjR0?=
 =?utf-8?B?N3lmQUlJMlFpYTY3bksrWWpGYzQ0QS9HK0V5VHErVEFYVmFaN0w2M3FTMjVi?=
 =?utf-8?B?d1RhckpKSmhudGdFWU1pR3FHamNDWHg0TFZmcnF0OVJHb01nZ2ZEbEdWQWRU?=
 =?utf-8?B?YXdQZU53OXdMbWVtVFZSUmdwYTAxTzN5OE5GMHRWWitqNE5pQmtJVXNjNlgv?=
 =?utf-8?B?K3ZnTllFdHlaTjdNcUU2V2lSZEFZV1FidjF4S01uYzJkZjlDRnJFQTZvZjJU?=
 =?utf-8?B?UWo2dHdreEpvcTZ3MjFWbEpvUXZrRTI0SXIrdktxY2taYzNNZy8wbUFMOWp0?=
 =?utf-8?B?Z0ljdU5QQUNQRDFsS0loMUlZWC93dHhjZE5hQlZQdlZZUXVZSzVISHIwTEVj?=
 =?utf-8?Q?z+kXp7PbFno=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YThaUElFanRKQ1ZKVTlwc3J3dXZTVnUxcW56YzZMYy8yMXJaeUI0K3lHVGNQ?=
 =?utf-8?B?Z2RPd1o5cGsxSjJkNUJJaXplSDE5Q2pDOU0rSW5lblhjZEFzSC9XMGFQdlpK?=
 =?utf-8?B?amJNU2dFQllMcjBRdVh3QisrdG12VXE5MGo4Sm1XTWN3N0lhSGNzOVMwdDhv?=
 =?utf-8?B?QWtVS1kvc2M4SURvcmhVK0RjZEdKdTBuM0FBckx3SXIzNVZWVHFDZjdJWERG?=
 =?utf-8?B?WlhDeTZoVVVZSXQyUTc0VDRZUnEvYUZuc0lDcVRwNS9uck55V3lQaklTeGdI?=
 =?utf-8?B?bTFnRHNEenVzMW0wRlowbitkVXBleHltZS9ROFRVbCt6aXRvSUFCTnhWbVA3?=
 =?utf-8?B?YlhJZklRYkRVN3B4S1lKOVU0SHJzNlVBSmpzd2JGNmtHWkJ5ZmJYOEpLTUY2?=
 =?utf-8?B?T0kvSnM0eWFsTGI0N3NnWXUvOUpkV3o5MHYvWTFMeVMybUlBYkViVnQwN082?=
 =?utf-8?B?WGczT080amVGYTNuNXZ6eE9aeFA5QkhIaU5EQy91YVlYenQ4VjlpczduZG93?=
 =?utf-8?B?WnRPdWdUeCtJS1FZdjdnblQxVUN2YVFGL2VBbmV5bWphM3R0UHhvTHdLOXQ4?=
 =?utf-8?B?R3B3UGhWRUxCVDJSeU44eVVFK3VpMWdKWTVhcUxTQzVhRjBBZit4ZWR3bE5q?=
 =?utf-8?B?OE1wYjRhd3FZaFM4ejZvakN3VkJ1TGhKMDFRTmVQdVpzRVh5Vy9pTE9VMVR6?=
 =?utf-8?B?aTFzQnNZZ1YyRXlNYXdBbXo0ekc0Sm9rRnhZTGg1TFlJcDhIL0NuM210T3Bz?=
 =?utf-8?B?b3JsZm9hU3NtSVUvVloxd0h4NU0xYS9tMVdtakFQMHVoanZKYnpTbUpjN0Mv?=
 =?utf-8?B?N1RtZys5QStJcW1LZU1wdUxOUWhOTVl0dkFxSzcyQU9CZjZpR3ZVdUpNNUdO?=
 =?utf-8?B?MzlabFl2S2hEMnErM0dEQWdqdDl2dWdKa2w1Mnd0dlhTUmwwWWNkakY0Syt6?=
 =?utf-8?B?SnkzK2VWZjVNeUVZR3UybVYyd1BCQjkzOStrVFhCamVhbWp3RzBVV3hKVXZV?=
 =?utf-8?B?SDI1TmhnWFJRaUdSSTVnRmJ3eUVnOEZEVmhUTk1aa1YyM3kzcCtvOTZXVTcr?=
 =?utf-8?B?SFkyc21mV1Z6cVVWWUl4ZW9Pb2JybUpmN0I4OGV3WTBBTWJvTzhLVGlONXMv?=
 =?utf-8?B?ek1YYVh2QThYOEdSa05mQ01IckJPYUxwM3g4ZTRyZDVEaVJ4K3o1bnFNcVo1?=
 =?utf-8?B?eWVydy83QUJueUdQVmFxbnEzMVJGa1RiWWZ0R1VxVGZNUFg4ZGNOd3FoZW5S?=
 =?utf-8?B?Q3FDWGRHbzg1TlV5aGJ4TmVIbFdYRXZHSUhKMVh6NEVHYTJDYnBIVUE2K2R1?=
 =?utf-8?B?SGpuNUE5WVVwSDZSZC9HdVVHdUtNNEtDVmlqZURUbnV2Z3J6ODFjOHptTm1R?=
 =?utf-8?B?OE5qWnRNRWNnVnc5SDRlZnE0M2NUbmpwR1BweHVVU3ZsK0tJMEpRSnlraW95?=
 =?utf-8?B?R3A5T0I2WXZLcHluTmlod1p2MXp4T1JybGlObXhrSngzTVpaazVZRld3Vms4?=
 =?utf-8?B?TzZiYmEvWjhmMyt4dndaT0lGUjVVdUFGc0QycEg2eW5KUjBjOERDWHdwRW8y?=
 =?utf-8?B?RFFvdytxaDdvZS84TU9ock1NQjRuclhqbTBZajVTUjJ1TnBmQno5MmQwSjNr?=
 =?utf-8?B?VDlkWTIxVW00TExvUjg2ZERZNVpSRldIbWxiZ3RaQmY1SEZDV0ZiYVBpT1dv?=
 =?utf-8?B?QXBUbFVFd2JYYWI4T2dDZ0grSUM2SGMvUkNzU0VNWExJZzd0Slkva2NOQ1B1?=
 =?utf-8?B?SHc1RWJDZVBHcnNXYy81Z1lQY1JuSHZjSDRtQjA4aTFLd2hOVHNHN0V4N2RV?=
 =?utf-8?B?L1ZHcWVBOGo0djRoekszUTI0dmhuS00xYkRCTHUvZUpsQ0wwb09rMzRWU1Vr?=
 =?utf-8?B?Tys0eVhsWUV4R1E2aWpia3NQcTJCdngyS0ROb2ZiYTcvVkxNWCtrL1VtS3dX?=
 =?utf-8?B?eUpqenRSZjJ3K0pWNS9IZnFHQzRNYU0ybExoL3VON3czMFVhWmg2UmNVaG9U?=
 =?utf-8?B?R1pEMXpweHo5ZFd6ZUVwWUFYWlZGQ3M3cGo0SG5SQnV2cGZpWERieGsxWS9J?=
 =?utf-8?B?emdSaUJoRjlzbk1GZjdDZDN4ZTgyZGM0Q1pKVEMrRExFZlFadzFEenpTZCsy?=
 =?utf-8?B?MklWcVJ0RHQ5ejJyNW90eFhhRFVDSVdIZlV3dWZMd3JEU3hIdjRUWWhJNTBR?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a4e765-d0f2-4ecf-946f-08dd99728c7b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:52:22.0700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waJQ83DyARDfYvMTpBd4RC3HDNXXYQrSqSOCMMcZxM7hN4fJrujkMQxuKBir2uCR+f3pd5alo8xBY9/C0uVsELbX24z9HK5LhM+vngCOCPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7396
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:

> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 9ba771f2ddea..2a8fa454d3e6 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -255,40 +255,48 @@ enum resctrl_schema_fmt {
>  	RESCTRL_SCHEMA_RANGE,
>  };
>  
> +/**
> + * struct resctrl_mon - Monitoring related data of a resctrl resource
> + * @num_rmid:		Number of RMIDs available
> + * @mbm_cfg_mask:	Bandwidth sources that can be tracked when bandwidth
> + *			monitoring events can be configured.
> + * @evt_list:		List of monitoring events
> + */

Nit: this new comment portion can start with a clean slate by all sentences
having good structure by starting with upper case and ending with period.

Reinette

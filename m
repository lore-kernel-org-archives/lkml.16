Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3F125FA26;
	Thu, 22 May 2025 22:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747951536; cv=fail; b=aKrkk0F+s2kO7a5wyAADwS1/J3P83721kEVFMSMjew5dcPBLyjDOi1NEQ3oaxko8qDCAruEWMQQOrCco8+lA8jshB3I/MjSfm/z4LN2ydcWps6X6bvoEjlw2ATvt+JUOBD5j/BYxFysaC35wRkhwPKSgSMS8DWawXfOaDlpsiFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747951536; c=relaxed/simple;
	bh=EEuXMbVnZitolgrTcXWvnPu+Mf8c7Jp7H3/MXMbc1eE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V7S1wxMGiFmam6P77+TehgvJPYE7N/FUMxIySB+Uo574a0fv+/Rl3rcKidPVWigAZBdp6Hl8mmDZmZ4yXXa2fq6g1JlqCSTlHk/b6Jr0NiDHQVVcyAtH92hK79rZ9gdbqnL8OOF75gtVelATEpQ0lS6T2h/THDLrCJjCTSQtpeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vf73REZG; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vf73REZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747951534; x=1779487534;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EEuXMbVnZitolgrTcXWvnPu+Mf8c7Jp7H3/MXMbc1eE=;
  b=Vf73REZGDa2U5CS1a3DwirsGHjnooDHBQIohVpmhf4QHzSBzO1bwb5Qb
   kvP62oLjGMPtj005st5pVZs98uYGC1WNcFnnvkQ1AXqvFAGaHhjU3W6QC
   c5gh/JMArWAzBl9tj2vGzE69/5EayXCHY0KUdq6DnLgeasjuPk0LQJ8ii
   bJaivi2KxUGJ8hhNGqNvAdZBC6mcxKqwZgIf1eoF4owLVS77/SF0GYy0R
   oBjk1w9sL1TSM0tOMZtwaSySxiJyvtpAm4D/BN09FgOmoISNnv0zHYgdH
   jbIuhpKmP6QitOCsm0MaVUe2nWtqaWtqG0h7IJ5WiQoemOlYcjTn0IC5h
   g==;
X-CSE-ConnectionGUID: T10IDxMYS/eRVD7bQ4WYXA==
X-CSE-MsgGUID: w2YsuyP5S+2/IUtHUArfvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67412297"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="67412297"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 15:05:33 -0700
X-CSE-ConnectionGUID: qLOEUIXRRpicZzcSgVCpKg==
X-CSE-MsgGUID: XEtWn8pSQteUblCRCVPtIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="145656999"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 15:05:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 15:05:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 15:05:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 15:05:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJ0B+tdko/2ixNge94MIDOVbW9+Una4VKhYIbZxRXX9j2Mh5NiXLS+1CDf8JFKXYwBUYA3e2MuT7N/4NpuwTRKhkA5Xw4EmhmsmbKLlCzAQjudIOXle0ITAKAL26EzLN/TI4NouRggsBAS8EpU4Y5K91ubymcWWe979Pi4ucwJobbeersrWrra7zckmnptFY0LlKloAvTxoGtzt+xTV47rC8XDr65GZfP16DgE2EgAsHqE4sUgpP9a2b7wYXV+iTiXQwcT8PPbBLA4J08NbqgaIhH0TKw3N/0xOLLZOXOlWvLXRhGFY67gJv7dneZ0Gs0gIFoCDSJO1PJuRhPPx86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hnQVUN8lLAsdWwDeBA8V8C4E8xe2Hk/aU8Tga4zgEc=;
 b=NxIAzO+wv2azobp/JBgjYRSH/JBAjRxGQpHSTqvRB45XD/zym7wIhgnkqLqt05eJSUK8egZEjMYyxH/qHREtiJk7340nYJVgTVRdHbIJygQYk0fx5Ezy4wFY/IkIFXrI/4GI1cBQvkU7ZOkhwZnPpZ2KkVV/wM0+FGdQ24htVWbrkWa6Lk8r59t5U4Y0ehb6u9qiAasZ6uoyme1srM3nvKw+ebo1TohZChZy+OLBTBnqNDk7b5iIC8e2+pd2ZSyaah3zjZY3DJCFa2I6WhBMRRhm1ZO5e4cZDgCu0oUUOu+7TJUCHB/ytN4ifDy5B0pO9oQVpoXK0IAFEknclt6nRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 22 May
 2025 22:05:29 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 22:05:28 +0000
Message-ID: <3c25896f-72bf-4462-980b-0835aa445078@intel.com>
Date: Thu, 22 May 2025 15:05:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 12/27] x86/resctrl: Introduce event configuration
 modes
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
 <95b7f4e9d72773e8fda327fc80b429646efc3a8a.1747349530.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <95b7f4e9d72773e8fda327fc80b429646efc3a8a.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::22) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA3PR11MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c0a377-16de-4b6e-b68f-08dd997cc316
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXlnM1plL1RHSUY2K3R3UTJYSE9zeHJMMEJ2U2xtdERsT3RYOVVhSzFSVThN?=
 =?utf-8?B?TlRsd2RIajd4OGI0ZHd0dnR1bGZmejZtaWI5R3R5QlV3UENqakNMTHBjSzlw?=
 =?utf-8?B?dGxieVZzWVRSQ1NNM2FrdjRCSkQ5aVNoczFYTW50WlZwcDhxb2pxdTByTC9U?=
 =?utf-8?B?cEpCVGFmNWFQemtYRGZndzZLMXJLOHVuQzNUZjFFTThCNDJuQThnYWNIcktE?=
 =?utf-8?B?WFNlczQzM0l1a2hEMGZJYjdTQ1QxdGRyMUhxWTJEMklNYTRaMEVpeEg3OXp0?=
 =?utf-8?B?YXM3cWsrZmVacFllYjFRNkdvRzg3UzR0KzZQQTQvR0NUSENCMFJGNktoQkgy?=
 =?utf-8?B?VWFGcEJaS25zS2szNE9rdm13eGZINXRTd2pNVTlxaFR3SUt4dUMvZHhIR040?=
 =?utf-8?B?eEZsZ29FbUc4ak1BcTBpL3hiMkNnQ1kwTTcvOHZnK2F4TDdkRitWdjVpRmFG?=
 =?utf-8?B?YnVKSC9ZWkpXZjJjaHRDZmhIbjZtVnVoRnZxUURzdHZpQ3g2MGxxZDJvRU5v?=
 =?utf-8?B?TE5RbnJ0bXYzaFNuN2hRQWt5b0tOTUNSa1hiRW5EK1pBWXFORzN5YW9DYkVj?=
 =?utf-8?B?Wlo1V0tWekoxbTNRaXRJMisxb3dHZEh1aFpHenZrMzMrSi92SmRsc1ZFaFBl?=
 =?utf-8?B?Q0lpWjFpVkFydTNZaTZzUXkyVUlFMTRGY2FVWWxwdnZyQzlUZnpiaW9TdjZr?=
 =?utf-8?B?MGxtcU5kWE9OeU0zdVpYZFFtMzVvSGsraWljKzdqdTZrN2FWd3lVQSt1K25h?=
 =?utf-8?B?dGYzZlNNUm1wM2p2c085VWZFamdsUEIvdzNCZTQ3V0tTSkswZW1TSTRUd1p2?=
 =?utf-8?B?MjFLSGtNS0s2Vmg1S2poM0RiTHVuMy9qS1QxdWxMT28xdDh0V2lua2MyRHhT?=
 =?utf-8?B?dU9lSDVBNmJFRUFMYWdwT3dMQWZOai9IcWxGc3QyR1lKYWdDS2N5WE1Mejlq?=
 =?utf-8?B?a0xmN2lKWE12eVdUcTd5aGdkOUpMaktTNktHRGJxNE1QQ1oraGp3NjJZd3ZI?=
 =?utf-8?B?d29IUnowQzBZWDFuZzZ5ZWttMGJBckdnVXB4K2NQRjBNVnlCVUhKZll5QVk1?=
 =?utf-8?B?WjM1cSsrdy9VT0RCQW5EeS9ZNnUyZDBhT2VwZ1BYL3BtdGlpVUFOSFdlZ2RK?=
 =?utf-8?B?dWduWkNFcDhnUzFZSEhPK2MxMHIzQVl2MG9UZDhjZ09qTStPY0M3LzliblZ2?=
 =?utf-8?B?d0Y0elRPdGtjRTFXK0I4b3UwVXRmSmUzc2FZR0Y0K2pYdnR4L0M2WjBjc2JG?=
 =?utf-8?B?SGV0eGMzMXpOVkl1WFRjaW15M2RFbXoreENOT0twQ00rdHJIQXRXditOZEtK?=
 =?utf-8?B?MkYrVlpjMXlLM1BuQkRVVVpVZjVKV05kMVExamE2UG9taDVzYjdOZWhSNG9M?=
 =?utf-8?B?clBPOGlMbVl0MFduSEpNRWZCay9sN0FseGZoZm5DRmM0YklBZjdBSVhRL0dP?=
 =?utf-8?B?UXkvOHl2eTU0ajcrRTJUQlpwTGhlVW5jSXhxc0gxcE1SZzlHSjBiWGVsZU9w?=
 =?utf-8?B?dDBHeU01U2w1TGdsOGtlM0dxd3R6citXVElzNHl5bDdXTjVSN2lxTDlDTWtF?=
 =?utf-8?B?SG92aVBxTGVuR3dlc2FaWWhXSFdpVkgralduNGdDNEt1eGIydVZDUjFxRDlm?=
 =?utf-8?B?QXZQcXJXUXFEVTF5cnJRKzFPckNFWGJiK2RuaTJZU1k1KzNNUmY0WmdkVUVK?=
 =?utf-8?B?TzhyTTdKc3Q0MTA1TmY4eGU5eUtZREF4NDQvYmJPSDZsYXg1ZzRDaHcyM2Nq?=
 =?utf-8?B?ZTArcTQvQzN0K0tFd2QxdVkyWWFCQitDRTdLSFdQZXcrMWtnbS9vaDJ5Tjkw?=
 =?utf-8?Q?XftB1YZOR1B+/xQPdX6C1EcbP5xnczq2G/JU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ylp6d1AwSVdJM085RlRRWnVjYlFEZ0QvOE45U2xaOFduY2tYOGk3V05LanVO?=
 =?utf-8?B?RjZDS0NDdExhVm9yK3dqeWRYNDRQVkhVMURNVk15TjFSR0d0S2hRbXJNVE5J?=
 =?utf-8?B?aDhZV2NESUtZTGhJcEVyQ2hNWHJKNGJXRkVHWktRS25LeGNKam5hN3FYNFZD?=
 =?utf-8?B?Y2QyTU1YQUVDRHNvVm9VOXExa1RkemkwMzZKM0lCdERkdmdUeWovTWEybHFL?=
 =?utf-8?B?cGU4NzcxZjRzSi9uNDMwcFJodmZXVmNkamdNazdqU1lzb2dVa0ZSOXRMU2ta?=
 =?utf-8?B?VUlkMlZ4VzZmNGpIMlZRaWdBMmhqSTVjZENsb2RSUTdpRDNSZmh0ejczZWpI?=
 =?utf-8?B?RTJrenBPeDQyL2dyWFAwVm5WZTc3QVY1ZjRrRzJFRkJpeUhsOE9FMDhiSUE5?=
 =?utf-8?B?bUhHc0RzcFF3cEN0dE9UL2laaHNxbjNFZi9VSkJTQlpPMStKUlBKM3pibjYv?=
 =?utf-8?B?R0ZWaTc0TDlqNUdScTBrZUlTRU9DelBYRGNyS2wrMkJTWTk4Zld1N0ljcCth?=
 =?utf-8?B?eHNSRk9kMmxBL1lsQnZUTU9laDBabGVCK2l2WVVWczcyOFM4ckpzejhjRy95?=
 =?utf-8?B?Q252dk1YeDNMVlgzU0VNYTlsUGRyQmV2RUk5VlBpSHZWSUI4VUh1TUdoZ3V0?=
 =?utf-8?B?dmJPWlEyTnN4cGRIZUVuall1K1dHY2wrNEpmalByNEZsOC9ZL2c5Ni8xVTdY?=
 =?utf-8?B?dTJ2akN1VVpybzl0RlB5OUl0UjRQeFpJVHR0ZWdXb1Z4ZDRDZStVa3B3Nm44?=
 =?utf-8?B?QmJTMExDOElJSkdTVndwL202SVJFZFNmaVdCd1ZYQ3V6Vis3cmFuS3p5cFFD?=
 =?utf-8?B?N2kvZ2srVWN2NFNTN2JCYndqWUNXRm1iclB3ODBHbWFmaFIyVFJnZS9BVmNx?=
 =?utf-8?B?WW5qY3I2eDhWUDlXRW91cStpSDNUMVhUNkpVYzFJOEcxYkt5cG83bkJFamxN?=
 =?utf-8?B?eVZZaE85OWFJTE1KNmljTkp6dWRVUTlHQXFCUjVDd1pjQ0IxY0hvSStuNTdw?=
 =?utf-8?B?ZTlmd1B4MVhEL3FlelBienlhVHpYZHRvUVpoZWRESk5jSStLbXB4d0lvc3JN?=
 =?utf-8?B?WlBGL05wZDVDTTdwRy9TdStFOHZxWUduT1NPcTM2d1lnaHVqQlFxc3ZZS2o4?=
 =?utf-8?B?WVNXTGQ4RTdMMFhzWUh1MFVNUkpRcWhraUpUUHYxOGtDUFJmNldXdDJDODRt?=
 =?utf-8?B?RERUWVNRSGh6Y0FIbklzN2hqVGxXdkFnQXVyeTNvSDlyOFZqR0l1RFVpU3Fx?=
 =?utf-8?B?dzVsaFFWMlpNdTRTSmNqT1lDZmZBNUVLVS84Z0VtU2I5eGYxYVRlM29YdytG?=
 =?utf-8?B?ZnhkTEZiRFNWSTE0cE1iTWZmTWFXME5lZHVnZnlNdXVORHN1WjVXeWhqaGcy?=
 =?utf-8?B?OFZDTys0cndjWWI2NEgxWEkyN3l3a0VoU0RxWm9jam1GRjlIdzdNd29qK2dQ?=
 =?utf-8?B?STBRTFRUV0Vic2oxcXlSWWN5b1N1T2xHby9hU2prSDg4RnZjNldVV0wyZGhD?=
 =?utf-8?B?RlNEYXloanVsQm9mT0xvQmNGa3dkMG9TRmxEZzdLdkw0SzNVaGk5dkNmVDM3?=
 =?utf-8?B?b28yUXBBcVArdHlWUHJTRGUrM2pyRnpyWlJyRkxSUHBXZURpS0FzVU9NUUJK?=
 =?utf-8?B?SUIxaGJSY2hFK01iWG9mNDdFWGNSclhGVjV3blZCK3ZtaTBXQ0M1TTl6azgv?=
 =?utf-8?B?RDZ0R1p6SWlOeVZVbVpoUE5HWkg5OWo5RnVoSktYMytDNDhyUXBJVjVBdllI?=
 =?utf-8?B?NUxSRUNGSWM4VEl2eVhFNWl6K3RVYjN4L2NnWHJZVkFYOHlIbzErdTEwYVR6?=
 =?utf-8?B?c043M0lqSDBjeUhtVlVvaUJLUldSNmpoTjZUWHdObUk5WVdBRFFZVWV4Tysz?=
 =?utf-8?B?SFFhem1GeDFYeHBxdi9BdThCSEhqbmlwZnVFNzRINGNkVTlVbFYwa2dRTmlr?=
 =?utf-8?B?QTdOc3JmWE85TUJVU0FuT3RiYnRCMkZBVDEwRnlnaHNkL05UV0dGV1Y0M282?=
 =?utf-8?B?c3NYeUxqT1ROWVNnZ3NmUW00SUloWW9ZT0dFc2NxUlZ4MWQrdXlueE91SHhz?=
 =?utf-8?B?YU40U3ZKZnVnL25BV0E2NU55a042dGkvZlJoUnlHOXZsSFVWcWQ1eXFmTFVI?=
 =?utf-8?B?YmsrVHpKK0wzdm5yazJwZDRuQTZJQ2FDbnl1bFM0K2JIYzg4cGJOaFhaWnRq?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c0a377-16de-4b6e-b68f-08dd997cc316
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 22:05:28.8198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +s4lW3Il/qB2Bph/hSVHfoFEHj9XaTJ4nt19CTIK/JNIOoqvYGTNfq68cVuS8ufEjFXHsFefyclUPGx6tWmRzMrvpekrDv5dfklMYF+qa6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:
> MBM events can be configured using either BMEC (Bandwidth Monitoring Event
> Configuration) or the mbm_cntr_assign mode.
> 
> Introduce a data structure to represent the various event configuration
> modes and their corresponding values.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>

I cannot recall suggesting this.

(/me digs)

Are you perhaps referring to https://lore.kernel.org/lkml/d2966a26-4483-4808-a538-bb20973dd2a1@intel.com/

This is not referring to new modes but the existing mbm_cntr_assign modes.
resctrl knows which "mbm_cntr_assign" mode is active and it can use that
to determine whether BMEC can be exposed to user space or not. There is
already enough information in resctrl to know whether BMEC files should be
exposed or not.

I think this work self makes clear that these modes are useless since
patch #25 that determines whether to hide BMEC files doesn't even
use it.


> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v13: New patch to handle different event configuration types with
>      mbm_cntr_assign mode.
> ---
>  fs/resctrl/internal.h         |  6 ++++--
>  fs/resctrl/monitor.c          |  4 ++--
>  fs/resctrl/rdtgroup.c         |  2 +-
>  include/linux/resctrl_types.h | 11 +++++++++++
>  4 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 9a8cf6f11151..0fae374559ba 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -55,13 +55,15 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
>   * struct mon_evt - Entry in the event list of a resource
>   * @evtid:		event id
>   * @name:		name of the event
> - * @configurable:	true if the event is configurable
> + * @mbm_mode:		monitoring mode (BMEC or mbm_cntr_assign)
> + * @evt_cfg:		event configuration value decoding reads, writes.
>   * @list:		entry in &rdt_resource->evt_list
>   */
>  struct mon_evt {
>  	enum resctrl_event_id	evtid;
>  	char			*name;
> -	bool			configurable;
> +	enum resctrl_mbm_mode	mbm_mode;
> +	u32			evt_cfg;

This very important yet totally unrelated member sneaked in without
any mention.

>  	struct list_head	list;
>  };
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 2548aee0151c..8e403587a02f 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -903,12 +903,12 @@ int resctrl_mon_resource_init(void)
>  	l3_mon_evt_init(r);
>  
>  	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
> -		mbm_total_event.configurable = true;
> +		mbm_total_event.mbm_mode = MBM_MODE_BMEC;
>  		resctrl_file_fflags_init("mbm_total_bytes_config",
>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>  	}
>  	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
> -		mbm_local_event.configurable = true;
> +		mbm_local_event.mbm_mode = MBM_MODE_BMEC;
>  		resctrl_file_fflags_init("mbm_local_bytes_config",
>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>  	}
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 752750e3e443..f192b2736a77 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1152,7 +1152,7 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
>  
>  	list_for_each_entry(mevt, &r->mon.evt_list, list) {
>  		seq_printf(seq, "%s\n", mevt->name);
> -		if (mevt->configurable)
> +		if (mevt->mbm_mode == MBM_MODE_BMEC)

This can instead be a call to a utility that returns whether BMEC should be
visible based on resctrl_mon::mbm_cntr_assignable and rdt_hw_resource::mbm_cntr_assign_enabled
(via resctrl_arch_mbm_cntr_assign_enabled() of course).

>  			seq_printf(seq, "%s_config\n", mevt->name);
>  	}
>  
> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
> index a25fb9c4070d..26cd1fec72db 100644
> --- a/include/linux/resctrl_types.h
> +++ b/include/linux/resctrl_types.h
> @@ -47,4 +47,15 @@ enum resctrl_event_id {
>  	QOS_NUM_EVENTS,
>  };
>  
> +/*
> + * Event configuration mode.
> + * Events can be configured either in BMEC (Bandwidth Monitoring Event
> + * Configuration) mode or mbm_cntr_assign mode.
> + */
> +enum resctrl_mbm_mode {
> +	MBM_MODE_NONE,
> +	MBM_MODE_BMEC,
> +	MBM_MODE_ASSIGN,
> +};
> +
>  #endif /* __LINUX_RESCTRL_TYPES_H */

Reinette

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEE929AAEC;
	Wed, 25 Jun 2025 23:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750894733; cv=fail; b=uAaTq32L+v5LrwG9y1fDVizGBADOnq+RddcQnVT80G+Y3S+c6dD1zQBe0wOqI96jIWBDmd9KAmW4oYRF0DpNAL3Rp/EEWH1mURPHIdNjLnkliF1U2gMTtsr8Cf0fEJorCOD9ZU5QZcKFeZB1J5K/qIQRMa3syOGpjrHG8TtltYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750894733; c=relaxed/simple;
	bh=8lwXYm3DikQO+v+1CpOYqPNxPHsbzthY7Q8AGJv+qQA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zh516VIx4P+mIpZK1xWUiN/8F+0qL8wtC2fdkJyBw/eIo3HcO+04n3QN8RxMN+VM62IqHmFtG3brD6Pw0phQzHqm2omiCkNG9ULUuNhhVnNGowSpN/FosjBDjhHuQySF3FvXpyJH7F6omM2dF6GiQczbBNs7QvWdo53nHVBXchc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7CkpFCI; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7CkpFCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750894731; x=1782430731;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8lwXYm3DikQO+v+1CpOYqPNxPHsbzthY7Q8AGJv+qQA=;
  b=h7CkpFCIG4jhaqHwFfGcIRs+exE6qozivdj0qVtlXgq6Gc4SSeSSg2c+
   CajZhMPPwqy5vrwjPSi/Jtlcv8XwCKDzSk+kE4cOaciKXXikiw0zwRtqf
   60vTWuoyZPdFNP9Q22e5pGbs9jOLMY25C5tmhfQdaPsdSvqHPH2oGp3ZQ
   do3YrPhkFcwweE+Pe/ECNJfJboh8VaF7yQ2bwAPVMqLGLF4S47MWrJrjD
   Kae1gyx1iAoWsOa3xoSuqkB9IqKklRUFWzpK0oJRlAeCvY/AXusHm9DMU
   htO1MO9HBIGzxiwtn1KRKYkmS2A0ZlLFCzOT6R69P8I8O4O2Pg0Zk1G4g
   Q==;
X-CSE-ConnectionGUID: lcyv53+KTayt06oXEsRn0Q==
X-CSE-MsgGUID: +vKInvhZQWi4SC3sqlyxqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53277510"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="53277510"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:38:50 -0700
X-CSE-ConnectionGUID: +xtWXw3uTKKTgT7qf6Se3g==
X-CSE-MsgGUID: ZMzUSdYrTBSkH25kKRMIjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="183245205"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:38:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:38:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:38:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:38:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NleCiMh7wZf3cSt1nsfGx1uano1prvfiYIGkoXPrwNIBiJzbTRZI8KbKKrI99o6CXl9phBH3Es4/owLmvPEsW/QWlgQG4yO3gVbDd/JooGnJFA9wRGK9r5V2vUABvpPmhb7u3iSA16nXzhw9fn1GhH9fHtgmN8YpxyhXYnPwwrOmKEckkQUqVshD30dFqm8RledEwurUPrkbuVtBFHcRjGA5HQC0ygHlh63+SwJxK18gi56KfCQrYigoMEMhYXjiConlIMSoMaFCpDfg1kWKl83cxawADytAqQrHbk2yX1qBZS2PE/sflwEqy60QX9cXRILN7Sext33y0g4o9ticyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlSzxR32h38+AYXGU/v4aKxY4XiLidsDcr2lwYMtSeM=;
 b=Hv/M8DoV0oeBenQWbIjE6RA0EJKXIiCfD4+cN0JT0Z2A9n0GGpzo0NghV17jmM5czucS3YAr8wQxeoBEq52GFiK9XlAZAEd5movFOuOVRh8opxZPgLA6NnP7duyLrBo3e7xzCZYDsHBseIjaCBE0PZopHIx/uMQcdePyK8zs13NyZPBP9isneo7HqD9A1gF75tknAXZOFDRikLlhEgkMuq1ALW4VneVhAvJkoSi5taLvpl/cYPpGlomJcRl2QHhrXdoBWX7YVkFWL0mJkelWBqr8BTqfP6KJkIN4IEYNwWj7PDABza5f/VmewJNwnjZqOGqHTlhpptisEapHZX8Rrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB6523.namprd11.prod.outlook.com (2603:10b6:510:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 23:38:44 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 23:38:44 +0000
Message-ID: <7d149e94-ab9d-4db7-abb6-83aaec1e6735@intel.com>
Date: Wed, 25 Jun 2025 16:38:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/32] fs/resctrl: Introduce the interface to modify
 assignments in a group
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
 <1fa5ee1e36bb599ae33d772e7a3c40fd3a4abe82.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <1fa5ee1e36bb599ae33d772e7a3c40fd3a4abe82.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:303:85::18) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: e49de659-7b59-4812-a326-08ddb4416c94
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkQxZTdDMHpvU1gvbWZraEhROENtSjZFS3B4ekRHNkxjVUQ3Ris2eEVxNURx?=
 =?utf-8?B?LzllMXEyOUNubHJhNUZXZWFONlBUdVQ1U1U1dDRJL3g3RVVDOWVjWXUycVdp?=
 =?utf-8?B?czNCWkhKL2FScElzZHZDc0dIZkpGWkZCR1I1VUdmS1loVnRMdXVnMk9xZ3dx?=
 =?utf-8?B?UEUzRDA0cGcwdEp3bDZjRVdMVFJsYk9xVWNvTHBOZXorVkJaUGVpT3dJUU5k?=
 =?utf-8?B?Q0ZFcFhacjVXbitNNDE3ZDQvZmp4M0x4dktmazZtMU9JRUhoR0M3Vkxhbmxz?=
 =?utf-8?B?Q2xYOXNWd1RZSy9MY0owblcySW0xNEZ6aXFXemdPVmNLY0JuZ21GeDV6R2pl?=
 =?utf-8?B?OEFFU3hUU3UzdnFvMzhKNkc5WW8va3F0ZWhHMUp2N1BtS2hRd2c5bHhsN3V3?=
 =?utf-8?B?R2JQTXE0dENKU21zUjQwS1FKektvY2pxcTVyTHlEdmZ5eHo2RTlGTVd2RmNs?=
 =?utf-8?B?TGd2WER2aXlGQzlLYXpNUml5QUQwdXEyTVlMZHdQa2ltMEFNT043YUpJNjRG?=
 =?utf-8?B?K0JkbitRZ3BxTUpWZXlEYnVvQVcvWUV4bzlvQ2JlZW5jaTJNcllCMXdzSFF1?=
 =?utf-8?B?ZE84bG5lVFN6UjVFdWsvV253WlF4anFBdVdoTjFFWEQ3REJLK3lweVE2OE50?=
 =?utf-8?B?ck9GZGJjRFFuZG8ySVZJNDJ3aUh3MmtEeXdhYmd1eTR6KzVsVmZhUXJPQmdE?=
 =?utf-8?B?TjkzMU9XYzJMaG5tbkNSVTBTQXhYc3c2eDZPeGYyczZKUG9vaU43RE5pdG1j?=
 =?utf-8?B?OFhDUk51QWxHN2V6b3hYR29TVmNJOEx3TDM1WW80aSthdDVRQzVYWldSaDhs?=
 =?utf-8?B?VTd0UEpTS3RzTVNKVU8zczZUU2FQSlBHeFFKWWo2SmFWb0EwcSswaUxXNG5I?=
 =?utf-8?B?QTQ0TktkOVhOL2pla2xoYndaa0s1V010R2lFZDF4M1BJZzUrZkVWME5Jb3ph?=
 =?utf-8?B?cTBnOVNKNHVaaGl0MTNVT0VoSmVjT0hvY3d3eTNUaTVmckxyejJQV1BINERB?=
 =?utf-8?B?SzB1S0duT0ExYnppZU0xVXlNTnBCOWEvblVpM0k5NnJCU0RxT3c2NERlU0RT?=
 =?utf-8?B?ME1lR1RpV2tCT3FDTng2YWRKMXBFU1pPTEpmT0NrdVBLSDNjTjArNWZ5Vkc2?=
 =?utf-8?B?NjFmQTBLcG94ejlweFNWcURFZWxVdlpNR1ZVNmpZY3pBbTYzcktISUNwY0Fz?=
 =?utf-8?B?b2RDUUM1N2lJbzFCSGttYVY0dkIvUU9lUVZLa0g0eXZJd2FxOG0wVzRVL1Vi?=
 =?utf-8?B?SThVdzA1ZEVNdUpuQndhbjhGdzdIMHVwTjJGblJCUVhCL1ZRWnU3NzE5K2RU?=
 =?utf-8?B?Z1lDSFVnYjJMd0VTWkYxeEJ6R21XRTUzWnVrUTVYYjJMNCt4YVJJQXk5aER3?=
 =?utf-8?B?VWF4TVkrdlNSL2Q5eW9jVkNRb2VGdXpTLzZFZWRpdVMrTTFWUWhnNXg5Y0lM?=
 =?utf-8?B?OG42UkhJZk1oak5UbkVWbkR3RjhYZngwVEpmWFpVT3lLaFY4L2NkdmlwWlRP?=
 =?utf-8?B?MHk4QmhGWnVES3QzOFdjY3o4ZENOZHF0UkRMZGdZckFSSWY2N2grQlpjeERx?=
 =?utf-8?B?NHlmQ3d5WnEzMjltMkw5RVpaaCtxVUJrQnVEcGJzdmxSOFFVbGNKZURMZU8w?=
 =?utf-8?B?U3RiTld2Y0svZGpMM1hzREZkbXFQZlZoVzBNNmpqVC92TFJ6V0FvMktUUnJ6?=
 =?utf-8?B?eUpHbkFJMmVtYkNqZ1NIVytuZWhlc1F5VzR4Z3VkQWxmWXU0T0VTUmFxOUk4?=
 =?utf-8?B?K21WYmxiQ1ZKY0dpTVA0Rk9zaUZONWsxMEV1czJvWDF0dW9QMXJuci8wdlEx?=
 =?utf-8?B?Mm5pVmcwOTVGUWRGZEhYSVZCMmswREdaVWxMTjc4clpVZ0ZiaHplQUZXNk16?=
 =?utf-8?B?bTdLSVVPZ0ZpcE8rdTZyRWUwT1RwUHQ1bU9qMU84YlMvRWVRbU1tcXFVMU04?=
 =?utf-8?Q?DTeCwPl6Guk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UENzdldkajR5eTY4ZDltRVQrSUJpSkhUVWdiV3JlTC8yMThLQUFwRFY5dC8y?=
 =?utf-8?B?OXJRR2lLK2pTdWx1R2pxZVY5bVdLQTdYN1pFVWFTQ2pKUHBDaFl5Q29neGVP?=
 =?utf-8?B?T0NiRmJyTUVEa0NZWndGd2g0Yk9ZNE1weEdSTURQQkM2V0ZEeUlaOFJ4SHpB?=
 =?utf-8?B?UWl2bFNQNFNiZjgxeGsydnFIRlgrdExIUU10VHdkcitoMzl2M0RBUVFPQXdk?=
 =?utf-8?B?MkdEVmdYeFk0ZVpsV0E0K0NVVmxtR2RKZVU0RnFwVGt1QnlYNkZmU0lNOWFU?=
 =?utf-8?B?eXdjbGg3QmxBMlJrTW1aMUR1TTJhWTNaOGIxREtUN1YvYVpMcEtGc0wyN1dL?=
 =?utf-8?B?QS9WQi9YQzBqazlvY0svTnNSTFB5UXBuOTk0aEJTbmxSODM3LzBuMGw1M0NN?=
 =?utf-8?B?VlhjS29SUE16NW13K24vUDBsZzZYSXNlRVNYNmswdG83UVVUQ2ppdjZYTC9s?=
 =?utf-8?B?aDZpU3hiR0NMUDIrS1dXUFVaWWYrK0MxTnhvYWJDNE14cldjWkN2T3hvRE1q?=
 =?utf-8?B?SUVqU0o5QytIN1VpcWtxUzA2WndMRmdyUzdWeVJOZVhUZk1wdWFReXAyckxt?=
 =?utf-8?B?c1FaOGhFWklRaksvL1FuY09FcTVoOXB0L0NRY20ra1JCV3pVY3BwNFNwWnNQ?=
 =?utf-8?B?UnlYZXRyZFpTR3pSMDdWUXlEaEYwYkNLd29sazU2Q0JQL0JDcEYrNm9sMU1H?=
 =?utf-8?B?YjhvcXdyc0ZESWkwUFcxS0tVNENVSUc3aDArSTFEdmlTTUNZR1A3WDNiM0FY?=
 =?utf-8?B?QWgvekxuRlU4R2ZlRXVOcTV4VjRwYlNUenhyeUJuU0hvMnJhWWhacmdPMUJr?=
 =?utf-8?B?bHR3UHp2dmxhcEovWEdaMXZjS2ZWUkVoVDkxelozQXpvV000T01EQjZIR0No?=
 =?utf-8?B?UWNRcHZXVUtuMU9pNmNGLzVFZEF2aXZLUW1IaTJmWkkwdFdSTm9IUUFneHRm?=
 =?utf-8?B?SGpFNkNnS2ZOa2VBdmw3RjNuSDhiOUgwL0R2bDd2Ym9KWXRmZit6aDBJaENL?=
 =?utf-8?B?VHVIM1pidythMU1DT21QTHVaek1hdVhoUUd3U3R1Y2ZvSThTeThlVENBcHNl?=
 =?utf-8?B?c0FRRzBoZjd3Zk8rTkx3S00zaXZ0aXpYRXQ2Q1NVZkkxcjlRZ3krSEk1dXF1?=
 =?utf-8?B?cUM2RnpjcHhlK1hYWVM3SHlVZm55NUVZN3RlY3BPR3NYcllUdkQ5TGVveG1I?=
 =?utf-8?B?ZmdsSnpxOUtNajlUNHkvRnIxZVZYS3pKQ0U3WEZ5Z2Z3aWtVZmtVd0tHRFl4?=
 =?utf-8?B?MWkyeFdxNlo1dHVpcDhtMjRkdmc2cjllZ1FnYVhXNTZtZk5VdThVck1pbCtC?=
 =?utf-8?B?U2tFWlRBU2F1aU5uTmxaQ3hRbFBGN2xmUXFHRmRpWEoyOEhBYmxWT2k1UGtX?=
 =?utf-8?B?dkdKRUllckVheUpOOWFENDJxS0dpWHA2RFpmTExKazRCOTJ4dUJUWm9vamhU?=
 =?utf-8?B?eDJ0aVM3UXBoVk45Z3V2a2NObVppdmxFRVdqbUF5bU1YNHdGZjlEY3E5ZnRN?=
 =?utf-8?B?OHhOQ3h2ZzZlcDA4RGw2ek45L3VsU0YzODdTZUc1bXc2WGFlenVSZERYZUsw?=
 =?utf-8?B?ZUNXWDJVbjRaNXhMbUVKUGdUalVZNTA2bFhnaUlRMjd4dnN4Z2p2cmxzZS9W?=
 =?utf-8?B?dDF4Q2E2eVd1Z1RGbDNSVkhTQW12ZEhkN2loMmlucm9uSnpLTVdwWW9lc1Nr?=
 =?utf-8?B?NDJ6TDV2WUgxdHFmeTFMTkZORzltTWlWdFJoU1U1VVNRampucTRRSTEyTEVp?=
 =?utf-8?B?R01yN0ZreFJVUk9TcTVMZ0htWUtvRW5wYm5icFpLZW1lMy9sRlNqdEg4Y1hE?=
 =?utf-8?B?Ti9leHdLVkNQZVVUazBQUXFrdjhvZUJXQWJxVmpwTFowQlNFVDMzSTVXYkh4?=
 =?utf-8?B?QjM1RWo3SEhIbXNueUs0blZINHlvaUZWUy9OMmRlQzBrZ2U2aHZVT3kydkoz?=
 =?utf-8?B?dEk1VytNSnQzVC9PNTZ1R3UzMEt1RmtUT1ZyNkhDSGdjbDJpc3A0UTRuSnk1?=
 =?utf-8?B?Q2lQYVNvVUdSY1BkWmVSS3U3MkRuRzRNb1Y4MFdEZmthOWRDWDFRVWgwTzI1?=
 =?utf-8?B?UDc2YUhEa252NkhGUHptYkQ5U1E5MnpKRkhSSTZHWDEvMlZsVExTUlJ2dE9F?=
 =?utf-8?B?UHBHaWtqaDU2Y0xKVTM4di9mREdLZTM0L0xrdmVkWXJ6QjBEWEVCdG1yZnBk?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e49de659-7b59-4812-a326-08ddb4416c94
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:38:44.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2mAWXnoj4Wz5hWLav1QH/IYgWscAKSU1daPknzw4eMV2QcSyGk8k3NAyTrJVFHynOL99AkKLGUGWS9hZpdO+EIjmnCIb7ji+DmeyOR12mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6523
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> Introduce the interface to modify assignments within a group when

nit: This cannot be an introduction since the "interface" (resctrl file)
already exists at this point so this patch enables it to support modifications.
Perhaps:
"Enable the mbm_l3_assignments resctrl file to be used to modify counter
assignments of CTRL_MON and MON groups when the "mbm_event" counter
assignment mode is enabled." (Please feel free to improve)


> "mbm_event" mode is enabled.



> 
> The assignment modifications are done in the following format:
> <Event>:<Domain id>=<Assignment state>
> 
> Event: A valid MBM event in the
>        /sys/fs/resctrl/info/L3_MON/event_configs directory.
> 
> Domain ID: A valid domain ID. When writing, '*' applies the changes
> 	   to all domains.
> 
> Assignment states:
> 
>     _ : Unassign the counter.
> 
>     e : Assign the counter exclusively.
> 
> Examples:
> 
> $ cd /sys/fs/resctrl
> $ cat /sys/fs/resctrl/mbm_L3_assignments
>   mbm_total_bytes:0=e;1=e
>   mbm_local_bytes:0=e;1=e
> 
> To unassign the counter associated with the mbm_total_bytes event on
> domain 0:
> 
> $ echo "mbm_total_bytes:0=_" > mbm_L3_assignments
> $ cat /sys/fs/resctrl/mbm_L3_assignments
>   mbm_total_bytes:0=_;1=e
>   mbm_local_bytes:0=e;1=e
> 
> To unassign the counter associated with the mbm_total_bytes event on
> all the domains:
> 
> $ echo "mbm_total_bytes:*=_" > mbm_L3_assignments
> $ cat /sys/fs/resctrl/mbm_L3_assignments
>   mbm_total_bytes:0=_;1=_
>   mbm_local_bytes:0=e;1=e
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst | 146 +++++++++++++++++++++++-
>  fs/resctrl/internal.h                 |   9 ++
>  fs/resctrl/rdtgroup.c                 | 157 +++++++++++++++++++++++++-
>  3 files changed, 310 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index a232a0b1356c..cd82c2966ed7 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -527,7 +527,8 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
>  	Event: A valid MBM event in the
>  	       /sys/fs/resctrl/info/L3_MON/event_configs directory.
>  
> -	Domain ID: A valid domain ID.
> +	Domain ID: A valid domain ID. When writing, '*' applies the changes
> +		   to all domains.
>  
>  	Assignment states:
>  
> @@ -544,6 +545,34 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
>  	   mbm_total_bytes:0=e;1=e
>  	   mbm_local_bytes:0=e;1=e
>  
> +	Assignments can be modified by writing to the interface.
> +
> +	Example:
> +	To unassign the counter associated with the mbm_total_bytes event on domain 0:
> +	::
> +
> +	 # echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
> +	 # cat /sys/fs/resctrl/mbm_L3_assignments
> +	   mbm_total_bytes:0=_;1=e
> +	   mbm_local_bytes:0=e;1=e
> +
> +	To unassign the counter associated with the mbm_total_bytes event on all the domains:
> +	::
> +
> +	 # echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
> +	 # cat /sys/fs/resctrl/mbm_L3_assignments
> +	   mbm_total_bytes:0=_;1=_
> +	   mbm_local_bytes:0=e;1=e
> +
> +	To assign the counter associated with the mbm_total_bytes event on all domains in
> +	exclusive mode:
> +	::
> +
> +	 # echo "mbm_total_bytes:*=e" > /sys/fs/resctrl/mbm_L3_assignments
> +	 # cat /sys/fs/resctrl/mbm_L3_assignments
> +	   mbm_total_bytes:0=e;1=e
> +	   mbm_local_bytes:0=e;1=e
> +
>  Resource allocation rules
>  -------------------------
>  
> @@ -1579,6 +1608,121 @@ View the llc occupancy snapshot::
>    # cat /sys/fs/resctrl/p1/mon_data/mon_L3_00/llc_occupancy
>    11234000
>  
> +
> +Examples on working with mbm_assign_mode
> +========================================
> +
> +a. Check if MBM assign support is available

"MBM assign support"? I do not think this term has been used so far.

> +::
> +
> +  #mount -t resctrl resctrl /sys/fs/resctrl/
> +
> +  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +  [mbm_event]
> +  default
> +
> +mbm_event feature is detected and it is enabled.
> +
> +b. Check how many assignable counters are supported.
> +::
> +
> +  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> +  0=32;1=32
> +
> +c. Check how many assignable counters are available for assignment in each domain.
> +::
> +
> +  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
> +  0=30;1=30
> +
> +d. To list the default group's assign states:
> +::
> +
> +  # cat /sys/fs/resctrl/mbm_L3_assignments
> +  mbm_total_bytes:0=e;1=e
> +  mbm_local_bytes:0=e;1=e
> +
> +e.  To unassign the counter associated with the mbm_total_bytes event on domain 0:
> +::
> +
> +  # echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
> +  # cat /sys/fs/resctrl/mbm_L3_assignments
> +  mbm_total_bytes:0=_;1=e
> +  mbm_local_bytes:0=e;1=e
> +
> +f. To unassign the counter associated with the mbm_total_bytes event on all domains:
> +::
> +
> +  # echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
> +  # cat /sys/fs/resctrl/mbm_L3_assignment
> +  mbm_total_bytes:0=_;1=_
> +  mbm_local_bytes:0=e;1=e
> +
> +g. To assign a counter associated with the mbm_total_bytes event on all domains i
> +nexclusive mode:

"in exclusive"

> +::
> +
> +  # echo "mbm_total_bytes:*=e" > /sys/fs/resctrl/mbm_L3_assignments
> +  # cat /sys/fs/resctrl/mbm_L3_assignments
> +  mbm_total_bytes:0=e;1=e
> +  mbm_local_bytes:0=e;1=e
> +
> +h. Read the events mbm_total_bytes and mbm_local_bytes of the default group. There is
> +no change in reading the events with the assignment.  If the event is unassigned when
> +reading, then the read will come back as "Unassigned".
> +::
> +
> +  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
> +  779247936
> +  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
> +  765207488
> +
> +i. Check the default event configurations.
> +::
> +
> +  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
> +  local_reads,remote_reads,local_non_temporal_writes,remote_non_temporal_writes,
> +  local_reads_slow_memory,remote_reads_slow_memory,dirty_victim_writes_all
> +
> +  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
> +  local_reads,local_non_temporal_writes,local_reads_slow_memory
> +
> +j. Change the event configuration for mbm_local_bytes.
> +::
> +
> +  # echo "local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads" >
> +  /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
> +
> +  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
> +  local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads

Please let output match code wrt spacing.

> +
> +This will update all (across all domains of all monitor groups) counter assignments
> +associated with the mbm_local_bytes event.
> +
> +k. Now read the local event again. The first read may come back with "Unavailable"
> +status. The subsequent read of mbm_local_bytes will display only the read events.

(note comment about "read events" on duplicate text)

> +::
> +
> +  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
> +  Unavailable
> +  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
> +  314101
> +
> +l. Users have the option to go back to 'default' mbm_assign_mode if required. This can be
> +done using the following command. Note that switching the mbm_assign_mode will reset all
> +the MBM counters (and thus all MBM events) of all the resctrl groups.

hmmm ... earlier documentation about mbm_assign_mode changes was careful to use
"may reset", and here is it switched to "will reset". I am still cautious to make any
strong commitments about resctrl behavior in user documentation.

> +::
> +
> +  # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +  mbm_event
> +  [default]
> +
> +m. Unmount the resctrl
> +::
> +
> +  #umount /sys/fs/resctrl/
> +
>  Intel RDT Errata
>  ================
>  
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index ed0e3b695ad5..14d99c723ea5 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -51,6 +51,15 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
>  	return container_of(kfc, struct rdt_fs_context, kfc);
>  }
>  
> +/*
> + * Assignment types for the monitor modes
> + */
> +enum {
> +	ASSIGN_NONE		= 0,
> +	ASSIGN_EXCLUSIVE,
> +	ASSIGN_INVALID,
> +};

I do not think this is necessary (more below)

> +
>  /**
>   * struct mon_evt - Description of a monitor event
>   * @evtid:		event id
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 18ec65801dbb..92bb8f3adfae 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2129,6 +2129,160 @@ static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file
>  	return ret;
>  }
>  
> +/**
> + * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
> + * event name.
> + */
> +static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r,

struct rdt_resource parameter seems to be unused ... but should be used to match
with mon_evt::rid?

> +						 char *name)
> +{
> +	struct mon_evt *mevt;
> +
> +	for (mevt = &mon_event_all[0]; mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++) {

(use macro)

> +		if (mevt->enabled && !strcmp(mevt->name, name))
> +			return mevt;
> +	}
> +
> +	return NULL;
> +}

This looks to be a utility that should be close to the data structure in
fs/resctrl/monitor.c. Please check if you can move monitoring code
to fs/resctrl/monitor.c.

> +
> +static unsigned int resctrl_get_assign_state(char *assign)
> +{
> +	if (!assign || strlen(assign) != 1)
> +		return ASSIGN_INVALID;
> +
> +	switch (*assign) {
> +	case 'e':
> +		return ASSIGN_EXCLUSIVE;

I think this can be simplified by calling resctrl_assign_cntr_event()
(rdtgroup_assign_cntr_event()) directly.

> +	case '_':
> +		return ASSIGN_NONE;

Here resctrl_unassign_cntr_event() (rdtgroup_unassign_cntr_event())
can be called directly.

> +	default:
> +		return ASSIGN_INVALID;
> +	}

With assign/unassign done the function can return proper error

> +}
> +
> +static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
> +				  char *event, char *tok)
> +{
> +	struct rdt_mon_domain *d;
> +	unsigned long dom_id = 0;
> +	char *dom_str, *id_str;
> +	struct mon_evt *mevt;
> +	int assign_state;
> +	char domain[10];
> +	bool found;
> +	int ret;
> +
> +	mevt = mbm_get_mon_event_by_name(r, event);
> +	if (!mevt) {
> +		rdt_last_cmd_printf("Invalid event %s\n", event);
> +		return  -ENOENT;
> +	}
> +
> +next:
> +	if (!tok || tok[0] == '\0')
> +		return 0;
> +
> +	/* Start processing the strings for each domain */
> +	dom_str = strim(strsep(&tok, ";"));
> +
> +	id_str = strsep(&dom_str, "=");
> +
> +	/* Check for domain id '*' which means all domains */
> +	if (id_str && *id_str == '*') {
> +		d = NULL;
> +		goto check_state;

Instead of "goto check_state" resctrl_get_assign_state() (with
more appropriate name after changes) can be called directly, its
return handled, possibly printing to last_cmd_status without needing
any sprintf() tricks, and exit from resctrl_process_assign().

Apart from simplifying the code an additional benefit is to avoid
(ab)use case where user/bot may write:
   # echo "mbm_total_bytes:*=_;*=e;*=_" > /sys/fs/resctrl/mbm_L3_assignments

> +	} else if (!id_str || kstrtoul(id_str, 10, &dom_id)) {
> +		rdt_last_cmd_puts("Missing domain id\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Verify if the dom_id is valid */
> +	found = false;
> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +		if (d->hdr.id == dom_id) {

Similarly, resctrl_get_assign_state() (new name TBD) can be
called directly and "found" can be dropped.

> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		rdt_last_cmd_printf("Invalid domain id %ld\n", dom_id);
> +		return -EINVAL;
> +	}
> +
> +check_state:
> +	assign_state = resctrl_get_assign_state(dom_str);
> +
> +	switch (assign_state) {
> +	case ASSIGN_NONE:
> +		ret = resctrl_unassign_cntr_event(r, d, rdtgrp, mevt);
> +		break;
> +	case ASSIGN_EXCLUSIVE:
> +		ret = resctrl_assign_cntr_event(r, d, rdtgrp, mevt);
> +		break;
> +	case ASSIGN_INVALID:
> +		ret = -EINVAL;
> +	}
> +
> +	if (ret)
> +		goto out_fail;
> +
> +	goto next;
> +
> +out_fail:
> +	sprintf(domain, d ? "%ld" : "*", dom_id);
> +
> +	rdt_last_cmd_printf("Assign operation '%s:%s=%s' failed\n", event, domain, dom_str);
> +
> +	return ret;
> +}
> +
> +static ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
> +					size_t nbytes, loff_t off)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +	struct rdtgroup *rdtgrp;
> +	char *token, *event;
> +	int ret = 0;
> +
> +	/* Valid input requires a trailing newline */
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;
> +
> +	buf[nbytes - 1] = '\0';
> +
> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> +	if (!rdtgrp) {
> +		rdtgroup_kn_unlock(of->kn);
> +		return -ENOENT;
> +	}
> +	rdt_last_cmd_clear();
> +
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		rdt_last_cmd_puts("mbm_event mode is not enabled\n");
> +		rdtgroup_kn_unlock(of->kn);
> +		return -EINVAL;
> +	}
> +
> +	while ((token = strsep(&buf, "\n")) != NULL) {
> +		/*
> +		 * The write command follows the following format:
> +		 * “<Event>:<Domain ID>=<Assignment state>”
> +		 * Extract the event name first.
> +		 */
> +		event = strsep(&token, ":");
> +
> +		ret = resctrl_process_assign(r, rdtgrp, event, token);
> +		if (ret)
> +			break;
> +	}
> +
> +	rdtgroup_kn_unlock(of->kn);
> +
> +	return ret ?: nbytes;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2269,9 +2423,10 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "mbm_L3_assignments",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= mbm_L3_assignments_show,
> +		.write		= mbm_L3_assignments_write,
>  	},
>  	{
>  		.name		= "mbm_assign_mode",

Reinette

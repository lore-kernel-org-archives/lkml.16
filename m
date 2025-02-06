Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCE732C85;
	Thu,  6 Feb 2025 01:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738806144; cv=fail; b=adyupHI3yNTg2cnpiEuJwn7+NamG8wzf+DlkqLhO5x49TaMBhR3Y5GjSOtXJUHWeaiZU9R6hHICxJEiuD0Wp/EF8YuFn4IS/UizVLzeYke9nF2ovs6mBC+BPcCNyDapooGuJdFaLwlh3lvcLOgDC4qXm/nu44S1ecVd/T7k0FIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738806144; c=relaxed/simple;
	bh=DMUX4T4lJwbWEOQmp1LVrVO2OBoflxLr562QCkDNWbo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ODMBs5/gv19cFwKsj60WyDE3Q5gcUrfDtB7Q3IxJ8oV/wk69HY3ah2iMpcpYBA5sA5Ff9JqNpCyZBkfHFm74qhXUXXVvawRoEbbhLLExpJ/bBLib9uI7+VNXMiHJ5Nafnm+D02qsRP2kzvK/J7l2p1rp1UQNzwudffGMGwtb05g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TE3mM2jo; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TE3mM2jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738806142; x=1770342142;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DMUX4T4lJwbWEOQmp1LVrVO2OBoflxLr562QCkDNWbo=;
  b=TE3mM2joRDl8jiEdYHsf6+BT0hCy+Ts0bQZEvcpdcAm2hI5cyw6j4bu+
   cJgoskYten+YBmylH05giC6NhAuDnn59Vssfv4VMCOc+sj/vbvktjGZjl
   L7WW+cxpepmdBPe+rk3lmijwy2YxYloR2WjazqNsYEVnD4RKvHrAw4FZq
   BbtBbiyHNQVEALY+OydMti6UEHSrDAsfT7IYRwJ+S6r1kvRrmMto/KY/u
   uIM76UKu+BsJFyrIT9ZXWEdlGp8mypEJ18z6c87U1tvM2xnH1eWR9EnmC
   yT3zIlyFXoh12CxSJeF+xhgzl3Tx1vmTdozon9rgpADsTBmw/HroO1CT9
   A==;
X-CSE-ConnectionGUID: BVZDJdC3Rh2KNqfMGZS6lw==
X-CSE-MsgGUID: A8CqWTBGR7y4Yr4KmYs9Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61871921"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="61871921"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 17:42:21 -0800
X-CSE-ConnectionGUID: SSokIUAfS2aYj36+rnxALQ==
X-CSE-MsgGUID: a4b8uf4CTq2bJoHGK45l8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111510517"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 17:42:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 17:42:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 17:42:20 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 17:42:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQBClhoXjWzC++m1Go6PnSCJs5adVxjM1iNvYh28ZzWaarPQstCvY1xTBaeqiQnQBtP3xZG0CfhILKAeuT5uZHRftU2ZQF49H3GVFsHmAhjX9YHY4pfthq2F0jxYX0NgwxYuOPP0DLWYwoSHItH2G+MMwH98dkrZ4jasIEhlh6Lo/jIzjKsvSzlUoqNAXNYe9r9fKPUnjG7wAX2UXAPJSXMie05vS8f0883VxkAiGHht7zyyoP+8TpD+SJUToMFtzy4ctc9+q9bVWiHtHCt5H5B6nNpcY+jhJ/PEP96tDbBS2j0hpJuVL+6PtWD4rnXeLTM42krFHfw3zfn77IaHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeI/4OeoeTEBa+zS7JQ3exqI3oyNZXs1ryvzJvR+vZw=;
 b=Dg6Hq3c1C9HXew54/QcI0rtvn0KanMJDkxE/OXAO7bXOfNgAcYVV3Dmiy//z+4YfL1iTzQjaWF0d1bwvzKJPnssosr5Dp6HTxaDixM3u6JwiY8qZGNG4cs4xy4GfVin4FlQSM6oMAsUG4Qup3beV6ivMp5Bt79usjPTrZnrhN76gysfTGxZJfAin1EV6U9zUFHuwdl8vmljcCYKB/TGl8HDnV5zvjo2Kcp3wRMk2k2qgnH3m3qK4pYSbij0knD089pOkTylkritxEBWX1VMG/RGghN8p8tUo8p2U7wcJ16jwPn1JA4iM1JadZIpQyHq3N9X2fPYJDvNyhyuq4KtDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by BY1PR11MB8125.namprd11.prod.outlook.com (2603:10b6:a03:528::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 01:41:55 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 01:41:55 +0000
Message-ID: <2a78f9a1-e03a-4e82-836b-26d3175d3f2b@intel.com>
Date: Wed, 5 Feb 2025 17:41:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event
 configuration value
To: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peternewman@google.com" <peternewman@google.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "xiongwei.song@windriver.com"
	<xiongwei.song@windriver.com>, "pawan.kumar.gupta@linux.intel.com"
	<pawan.kumar.gupta@linux.intel.com>, "daniel.sneddon@linux.intel.com"
	<daniel.sneddon@linux.intel.com>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "perry.yuan@amd.com" <perry.yuan@amd.com>,
	"sandipan.das@amd.com" <sandipan.das@amd.com>, "Huang, Kai"
	<kai.huang@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"seanjc@google.com" <seanjc@google.com>, "Li, Xin3" <xin3.li@intel.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>, "Eranian,
 Stephane" <eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
 <53e104c0-64ee-4191-bddf-3ddb56dca1d5@intel.com>
 <SJ1PR11MB6083C234656AF934E41A7BA8FCF62@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <SJ1PR11MB6083C234656AF934E41A7BA8FCF62@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:303:87::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|BY1PR11MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: dc721213-157d-4caf-9748-08dd464f7045
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVBzREhYNFJmejhYQ3FaRnlSN1djR0lpcHc3bUJiM2JWWkNPclc2VTdYZ0ZW?=
 =?utf-8?B?eHFzdXBmQjZUemtzaXpLUm5rczNtbFN5YWplUzJ3TWtISyt0Rzk4V282ditz?=
 =?utf-8?B?cERBdU1uN2Znd3pEMFBLSXhmOXhlUGdJaUtPVmljOWRDMlY4TU04TFR0MEVo?=
 =?utf-8?B?YksxeE0xb09Dczdnb2RUUHFia1ZISDlwcy9PaFNTNTQyUGVqZHRzOHlLMnZO?=
 =?utf-8?B?VXJhZjhCaFlxQitpTGFLM3BFUmpaWWI3NVJ2ajdZbkJlZWdzM2M0TVQxT1FL?=
 =?utf-8?B?WG4xM3cxcXhPZG1wUURNZ09TZ20zQXRqSTdueEYxd3lWbmRHWW1Wa2FRNG5U?=
 =?utf-8?B?cTVWc09MM2tnaXZ2cE1TaE80VkFLUHJSZWtJZ1RTN3E2d0tudGZLUDRJY0tF?=
 =?utf-8?B?RkZVcG5GSnZGS1BHL0hDMzdCVFB6VzltTjMrcXpUMDhzQ3ZqdmFlTERHLzRM?=
 =?utf-8?B?U3JtV0c3NjRGQ2xTb2JyTWp1OVdFOGFYU2RvK2FjNVFLRWllY2FSV0FhZlAz?=
 =?utf-8?B?QllBZC9HcEZVa1ZKQTh3WkVhaUZPVTIvTVErNFk1VFhlZU9CNjBpOWJEK3RW?=
 =?utf-8?B?ZzdkWHlQTXQzMnpLZ3dTS011aWRKM1gxaDM5VjM4WVBvWlpwd3JoSjdGb3N1?=
 =?utf-8?B?NzJ0VHp2ZUNDenYvWm1Na3hSWnBvYzMrWDZzTDY0Zk5tUHVaL0RiencyV0VU?=
 =?utf-8?B?WXVUZkRkYTk3dVlpUEUrS0E1R3pKMmgvaTlvOXhkRk1xWGNoc2kzMHp1M3Z6?=
 =?utf-8?B?M0hOWGJOeVZwUlpEUDJZL05RcXdOZjBaMnRrdVFJY1N6emRSTkVSUEowcWxY?=
 =?utf-8?B?Q3Jqb3RPVm5KcnhQN3B5MGs2S1lJdk1Tb0RUUFZzU3BJV0RPWGN5eFlCU3Fr?=
 =?utf-8?B?dGZETWgvNWs4Qm8xMG9ZZEMwNkVCQ0dhaWx6NXVNeE1xbndjTGtrRy80Tjdh?=
 =?utf-8?B?WjBJQ2hPdVRzU0hHSjRYT2tmWklGRzNSMEhEeGhaYjk5Q05sMm1IckhJRGJm?=
 =?utf-8?B?d3N4TlhPZ3lYV0ppTzlNZk9nM3Y2WjFFSGNmSXhwYkdpSVowTDhkN0NTMXJs?=
 =?utf-8?B?cjZ4Wis3ZUxlMWtNbHRnVUtQOVpyVnd6azFvUkZucVRXanBHVnJaM002MEh4?=
 =?utf-8?B?VVcxeHJ1YktmaWU1M0JMOW1udzMrNmxNa0crRG9wRTZxdk1XWjN2S3pHZ3lR?=
 =?utf-8?B?UDRxbUhZQk4xTm9uQ0FvQ3NtQ0UvcnloaUMzc3RZV0Q1UU9TMXE2WXUvVEdI?=
 =?utf-8?B?WXZYbXpxalFic2t4ckNPcHdjRzdCQklaTjQ1aHA0SExEM3J5OXpKYm5mUy9W?=
 =?utf-8?B?Z1IrQm14NEE0aHdZQVowa3NBWHk4VXd1WWp1ODgzeWVDREtnVVBGalBuY2s2?=
 =?utf-8?B?VTd3TGRHVm1IYUJyNmlYWWNRaEMxTGc3VkFreGdjQmVDLytTSDkzSTB3aDd3?=
 =?utf-8?B?a0JzQ2R5QVp0OVI0M25zSmZjSzNNWFRNeU1hWFF0aU9iMG81dkRsUUZoNm02?=
 =?utf-8?B?cHhyWllFK2crcmxRR0pMT3VzeUJnWmlQejdCelRHcnpoNm1KSlZadWpyTi9X?=
 =?utf-8?B?OCtjaGUzVlI0NlpSVHVaWTlESWxqWXdId056dzlUM2RFOHBCOEVramp6T1hz?=
 =?utf-8?B?YXQ5M2QwVllGM1IrM29QRnVkQU55cUFheTdIeGFkRXV2YXlWUWp1SU9uM0Rl?=
 =?utf-8?B?dkJBYWEzQVI1OUVPZkhqTGdRUy9aNkoxMytWa3NBZFIyVGZjcHQ3NnhDZVp4?=
 =?utf-8?B?YWJqQ1c3R2phUi80b0N5SEVkNHJud0NBY3oyREE3MUlqSmpNd3pLR0RGZXB6?=
 =?utf-8?B?aUp1L0JKalptbk1yU3hOZUY5SlhBMEpQTitvSzlxQmRXNFpFQkZKcUkyZXJz?=
 =?utf-8?Q?4luT8E8OpfO2N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUJlcTUxMEo0alZIcUwyR3doMmg3RXMxaFJFQ1RjcUFrckJtUUZwcUd5S0Uz?=
 =?utf-8?B?N000KzNUem51TUx0Tmk3dnNPOFRRVUZuaWRBQi8wMkV6TmY5SkNGc1N3eFFw?=
 =?utf-8?B?VTVnOE9uRFUyajk5QU5KdW9JZ0Vsc2tXTlN4K2ozUW5menNGcGxrSEFIOHhp?=
 =?utf-8?B?ZFEzWExacEl5WC9NVEFIVmU1bTNZQy9aYlB4OXJTRWNsS09zYnRDN1NpRTBE?=
 =?utf-8?B?RFpTQURrVldWRmJ2T0g1SHpDL1N1L1lzbVB5QmlUNllQYU9ITjd2WHNFN0M4?=
 =?utf-8?B?eU9VZkg0eWR6Y2V2blBEb25RTTRSNVpGVzl3aTg3TU1vSmgyZFd6cGswbkpy?=
 =?utf-8?B?TDdTZlU0aWw2Ump3Ykg1dEI2S3V1bkFCSzNKcDQxVTRUSkg4SE5sYnhvZlpU?=
 =?utf-8?B?L0JZY0F6enYxU3Njamp1aDVMUkRGTG9MMW9rM1NlNjROTmxuWEhOVmVtay82?=
 =?utf-8?B?dXBDUFBPempyeXFUVjdqdnZhSjB1RzcvUE9Ha3FEajUyYWdPcnpBc01vWC9z?=
 =?utf-8?B?RU40ZVRiZWNrN3M1NVF0UDZ2alhzSm9odEsvT1p3eVI2WlNBaUZBTzlKanZ5?=
 =?utf-8?B?RlRsZTNLbmp3ZFptYW9sUTdZTDE1Z2wxMkNsYlFUN1dzT2l3enR6blMvSGdT?=
 =?utf-8?B?T2ZjNmpjSWF0RFdwMzVFWEFrT3oyRzlMa1N2bnhYMDZPTkNuVVkzbnRHOWgy?=
 =?utf-8?B?S3hWS2NGUkxxSmYwUENSbEFyTFAzUDdtOFNjUnFnM1JhVUVmSGJENU1CVzdq?=
 =?utf-8?B?Rlh5VEVEMDNYU1pqQis2b0tmMG50MGgwT2tWeUpiZWZGRHlyVVhyb2hjOHpk?=
 =?utf-8?B?a000N0w5VDVrMXJBNzdsQWJSYXg1eGdhVTRycllKN0NLSDZnYXdyTWNyK0c5?=
 =?utf-8?B?a1BmVXRsWVZOTFViaG9BUExBU3FlZ0dNaFFTNDY2RGQrTkVNakl6T2tJR0VN?=
 =?utf-8?B?V3RDZUttZnFkUEI0SDQycS9wSkx2WEJSU1A3OUJmbFdoWExSMS9HVXVHMDNj?=
 =?utf-8?B?UzNxbTc4aHhpM3ZNM0taUkpNSTNCM1JxZjVSQ1M3SHRXYjVVMHhqUW9ZaXZY?=
 =?utf-8?B?OUJCMXlUMUVJMnI1S2p1ZnhicTltSkxzRTdIUHpiUWlWbVBGRTZRbG9LbzhG?=
 =?utf-8?B?eHhMdjlLcTNEMUdpaVMrZW1JRnQ0emtTRmhFamErYUthaTNiU2lRRC9SYlEx?=
 =?utf-8?B?d3FjcmxNTUFIMG00aG9TOCtuVXFtd2F1MWlxNTZENjRSZEg3STl1Uk1VRE9p?=
 =?utf-8?B?a1ZJejU5VDZpRC81MDNSbEpvTHFDK1h3SWN3dktuQ09lOE15RFZuVGlOb3Jt?=
 =?utf-8?B?NEk3SENWbEpUM3hzNWJxa1V0ck9CVWFNRG96NDZ6ZE0rLzFsZ3AxczJFbVRC?=
 =?utf-8?B?TFlmN3E5WkZLclBrOGoxaUxYYzd4dS9Nd3VCZHVVTDJBN294cFgvemFsTW5h?=
 =?utf-8?B?cjdtNXpJS2huUFZkdUJ0Y3o2b0s2SzVkbGZJb3Z6RnRoR0RHb0RPUDF1WURY?=
 =?utf-8?B?Z3UrWkExd2F4STJFU3l4VlA1N1RYWFI0VmU2Vzh1MHh1ZWNja0hkOWZLTlFo?=
 =?utf-8?B?UVNqOWszeUxiTmNDaE93dkc1NTdBdkhqUk5ISllEZ0VyTDVaZU5aVUdZVUE5?=
 =?utf-8?B?STVJMUcxS3FURFF5RGc4WkhSalpCWE5FRXJCcVRXMGNNVzlydHRJZ3BFV0Zp?=
 =?utf-8?B?MjY1REt6blpnSXBpRXRGeGhKOHNuQkNkN045NktrVDJhRUN5N2xCTFZnakFz?=
 =?utf-8?B?blNzbUlkaUZiaFVVSy9aQUFvdVlmQlBNRzhocFdzQXFXLzg3ZHZoU1VXZmlh?=
 =?utf-8?B?TkdGbDh3MjlrczhHQ0ZMR2xTQmhCbXRRdGhHNm9QSTZ4bTQySlphbkZQSjhi?=
 =?utf-8?B?OU11dUpFWDRuZU5vQVpiOVU2MXAwWXV0RTBVa21zQlFHbzh5bVpzM01pWUUy?=
 =?utf-8?B?YmNuY0tQd1Rlakt6Q3pUVkVaVG9vU09wY3BvSVhyelBHWW52TENobEU1UTlG?=
 =?utf-8?B?M2QrS3VkOUZlcjRNTDhZV0ErNVhrSUpCM0RCMlM1MnRNK0o2Y0doZmFsWmtL?=
 =?utf-8?B?M3lqSjFCd1p0QXZ6QTNCS2p1R3ovbWxrUCtXQlZXamcwUGZEUjZCdS9xR2hk?=
 =?utf-8?B?WkQzdS9LajcvRjF6OHJmL2lDVi9QWmoxL25vTHoyeGVjeEQ5R0svV20xWWhl?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc721213-157d-4caf-9748-08dd464f7045
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:41:55.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og3Omn74Gv7nAQq0+xIbRvlQqtBQ1m+5tWyo2slv1SaHZ3HW02hdm1voU1Wiy98ja/yZlMHu9jSkhuuxf4CHrdQQkBV4WDj+zsl7Ng4ReN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8125
X-OriginatorOrg: intel.com

Hi Tony,

On 2/5/25 4:51 PM, Luck, Tony wrote:
>> This new arch API has sharp corners because of asymmetry of where resctrl
>> runs the arch function. I do not think it is required to change this since we
>> can only speculate about how this may be used in the future but I do think
>> it will be helpful to add comments that highlight:
>>
>> resctrl_arch_mon_event_config_get() ->  May run on CPU that does not belong to domain.
>> resctrl_arch_mon_event_config_set() ->  Runs on CPU that belongs to domain.
> 
> Here's a vague data point about the future to help with speculation.
> 
> I have something coming along the pipeline that also can run on any CPU.
> 
> I am contemplating a flag in the rdt_resource structure (in appropriate substructure
> resctrl_cache/resctrl_membw) to indicate "domain" vs. "any" for operations.
> 
> Would something like that be useful here?

hmm ... I cannot envision how this may look. Could you please elaborate?

You mention "a" (singular) flag in rdt_resource while this scenario involves
different ops having different scope. This makes me think that this flag may
have to be per operation that in turn would need additional infrastructure to
manage and track operations.

These "arch" functions are evolving as the work to support MPAM is done and
so far I think it has been quite ad-hoc to just refactor arch specific code
into "arch" helpers instead of keeping track of which scope they are running in.
This currently requires any arch implementing an "arch" helper to be well aware 
of how resctrl will call it.

Reinette

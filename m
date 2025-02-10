Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D194A24F5A0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208271; cv=fail; b=OkmWmmx1Gc5Cps5bq8lgKjPgraeGRnXRGFoZxk2lxLxbAkAqFbJ2Tdxx0aQUlvKwwtxk7K2V6nY+8F9lcoSgCmkJGZW4tgv/Z4sOwQcuvtlu13SLLfDPsCZLSHutEONj1qkrCXHDXTlf7O9Mi6nR2jO3IJdH5CYVjrESlUMhicA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208271; c=relaxed/simple;
	bh=ND6SyVNV07RJXhRVyB1Cdjjg/bD5EIv4gwciiqZQj/c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mRanVOO7SJPjXvAhVDzuxAD91Ar42oTnXhipcs5c2xJGkVh50wNJgxzLhPF+v+ZiVvZ3pmNoHTclSwP67f8OdL8PPUYnJk3WhYxUHHJ6qHta2MMykEKks2VAZzYeV3dmxH7RB9P5e0XvdMMZHZ8KmNZ4/ONwa9+61rYZy2upkGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIY8dst1; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIY8dst1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739208270; x=1770744270;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ND6SyVNV07RJXhRVyB1Cdjjg/bD5EIv4gwciiqZQj/c=;
  b=BIY8dst18VZhuCJDJ2A4P+0TYDO/XvIPxFzJCGQjfH+PhzbHLxp9uB1T
   PvifJ1JB+E2M5j3spL0PY67nPJUIttANtRdBEGUQwf93oFiBbqR76Lgy8
   Igy1DAvM6PVHA3m8ULsQ1ZnbGLWIxwhImXlg/8yaVGcP3WYx02xE6rZDd
   ke0qH/RWQCpj3BYsWLRLmbsHTP+b0su6eNAuq0TUBXaVr/CbbxPaumW4R
   0s76PPp3owaFOgoTB2pY7hJGNErd8Lpmn8bjXlNBUqFQvyc0bwXipehIj
   /W+cDt80BQSo1W++nAxbQWAIUlwFx8tfs4deAZzNL95Y4OHPw8XZqSj/3
   w==;
X-CSE-ConnectionGUID: BG2Nkk41QPG/+C/NCfXoUQ==
X-CSE-MsgGUID: OQcpeehbQ7CpT0mOWMgatA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39039702"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39039702"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:24:29 -0800
X-CSE-ConnectionGUID: NmqNIpGCQMeY0ccjvSmYlg==
X-CSE-MsgGUID: 4uhz1P8IQGizju2RP0zIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117176770"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 09:24:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 09:24:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 09:24:28 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 09:24:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sx1de/6Se2QG/kmPlzGx6eEYDqt5lvZybHxtYxeMd21x0udBWqixchF4xeZfFx9UVU0diOpWKoaUUXjaZyq8huYu2us2gyXA0MAIlo0RFVft74X14h1Vu7fV2MVjwRuymwdRh2zCdmV+3QwppL+sbpkdWZQdUljUzUW1s7VfxDcECwvrTSutQMTSkRl4KOS/QskDjPb7oJFKPXzxfn/q0XPsE5tViAaEVzzcWWtBM++wcfu1TAo4MFavLa9EdJfD3rh4YuMd9b72JVdJu8Ify09T35ROVnYpQkcoGo/L9KWrJg7JILcegInU/6a9HZn/vhUj8JN8SpSD7bn5NW2YhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W85CP9kltb9jVrgKVyHfetxh1EUKmK4AJPGh4N1G/H8=;
 b=ja3A5IXa1B3bEsOpfKdiD3nuye0AzscQVUei1vSs44A+TVfUjf5wymdDt79dYQ+86Qzdr8vd5POafcfHnKu3vbxqTr4STmZqZGlBxDBIv48OvZ7YlWRMJIPSyhOcLYQBMw9LPGPYNKq3vzy0tAuM+Z5FvCtoeH3ruPIevH5QL62SYUGTtoqYjLIBYKSa/9EyIu3vdmO+e9YMyWhGl8QatSxNMhZzhpLSatxBKgdwGynlv+K0QPic1S1PEiFDZi0X0kXcNSzQFcSSn9U9bykvvLeM1f2eAFkyDvT3PpxuF/sae3OvfQGVl49DzcuQyLto3JM9msEL94rOp3H0UB7l2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:24:23 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:24:23 +0000
Message-ID: <f600712d-d089-4285-8d04-e12f53a61572@intel.com>
Date: Mon, 10 Feb 2025 09:24:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/42] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>
References: <20250207181823.6378-1-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250207181823.6378-1-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::22) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: afd16147-1e80-434f-1e59-08dd49f7c299
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2VOVW9DYXV5cnFTZ21BK21rTW9Jc2pyZHZFb0pUUjRIMi9IRStnOWJqK1VX?=
 =?utf-8?B?WE5EdW1iYlRaejd1MXNwa1Q4T2NUSEtUcVl4ZnlGcjJOOHo2UTRCUUVjZmNF?=
 =?utf-8?B?V25oNkJkOE5WaTZUeS9keUZCem91cEl1Q0tQUW1yZFpvd3NhNnUrZDJGT0VB?=
 =?utf-8?B?eDkreUI5aDc4dWZqb0pjM2hIbTFwQkMrR25kZHhKc2h0V0N4NmJCZFA3MFVa?=
 =?utf-8?B?UnIzS0lPczRJSjdCUno1QXNTOGdpMkJpQjQzcmdrRHFnYm85TmlvR0tCSERy?=
 =?utf-8?B?L1R0eStZSWl1ZElmRVU3SnM4bWlYUHVYWUhRNWE3UldxckFnbFY5S1BHNkta?=
 =?utf-8?B?WStjRkhVMVJLeWpWRmtkMGlIZUl0WkV5citjQVozdWZUZDdIbWxJZ3ppU1RP?=
 =?utf-8?B?L2lXTHJ6MVlMU3dGbWs2ZXJHQ0V3Y2dZbEpUOUZmalNtY3JMSm83eXJIVjlS?=
 =?utf-8?B?MXF1RFAxNjcxdVdUNWN6WHRGWkt2NDk4aEpQTHI4RmpFc25meFQ5SW01MXJu?=
 =?utf-8?B?azRvN2lwVW51bTdVMUcydUtDZGUzcjNJNjVKMWlvbWZTUVpGOGV6QVdnWFpv?=
 =?utf-8?B?NGNtMlVuNjhKc0c5dUVGblU1ZklHR1FrUWo3a3VDQVJyeWdXRXFhRTFzKzRG?=
 =?utf-8?B?ZVExVmxLNFRwUTZjdGZEczFVbG1rM2lHenc3c2cxWkh2a2tha2VyMGxibC9n?=
 =?utf-8?B?ZnVoZDhiaWc5WmFWNEtDT3lldHBQZWZvMU9Lem5wWFNubVZJUnM5Q3FXMUlj?=
 =?utf-8?B?NVBKd0F4bjQvZlVPbzlBY0wwTjRobXNRSE5ScXE2V2d0U1pBT0E4WUtvZ005?=
 =?utf-8?B?M01MNzl0TStGSnV1N1VTY3RRY1RkcHNhR1FlNVlncTRlL096RjJMQWdOemNS?=
 =?utf-8?B?bk5EYWJRYkJYN2V0bTFyUFk0QytmYS9KK0dDbDlCS1NBdXVlaWFxby9uRnlY?=
 =?utf-8?B?TDlwd1daTGIyVk1Mb2FEd2ZHeWZVUHFYOHpEbmRrN2dKRHZQNTZId01STnYv?=
 =?utf-8?B?ZVNMaTlKUytjZ0EydzlLMXNhZXRyNk8rSEVaOTVtVTdjMkQ1Tkc0ejR0VnZj?=
 =?utf-8?B?aFhBd0xXMldDZmJZZWEzOU9aeTdmUHplM3FnbWQzbXAvZGJ3dm9RQVUvYzJK?=
 =?utf-8?B?WlhVZUhldnZJQlVhdURMVUxxZ0hJYXMxaXRUNWd1eWZZQ21TTFZ5anNOMVND?=
 =?utf-8?B?b00xeHNzRjA4aHNxcVBDMDdkNFgrSTBIZHBXWVA1LzFMRFRMdzU5ZkM4QjF3?=
 =?utf-8?B?cEhwaFdWOExieWlBb290L1BjQzJNY3hrRmNFNlMrRitiVkUwTk9kMUt5WkVB?=
 =?utf-8?B?VUt6M3dQMzZ0bzJvT2d6Uzk1RzJmODQvTHY2UWxRUUd4cS9WMW9OZldLaHVy?=
 =?utf-8?B?ZUlYRER2cmkwUTlteC9lbW0rYUxISk1rZTc2bWNBZ0RyQUF5TXdpd0NrZTV6?=
 =?utf-8?B?VGpLc0NMT2orOHgrT01NTUxWWE1jRzdGdFJRc05CL0U3YlJzT1VOY2RBOW42?=
 =?utf-8?B?d085OUVkbzU4MWdYeWlrY3B3NWVCazcxbUFlZitpbFAvUHVRMUQwWXQ2WSt3?=
 =?utf-8?B?NGl3RHNxZlNsWGFlSkZjVmNMUEhqNUhWZ1YwTGR5RVp0blFRNVpGd3FmUm5k?=
 =?utf-8?B?UjNkTmtNWWdCOTFlZS96dEJzZG5VL0JPS3FGVXY4dzZPM0tXK3dYVkw2YXIx?=
 =?utf-8?B?LzRUT1plMURaR21iTWlOMFRiaXZKbTJFSi9GUEtRdmxQQ2VhY3JSUjZqSE4y?=
 =?utf-8?B?L09vT0J1aUJvNmVGTi9XRWgxL010cXorczdQcUdEZU5PdTFaNUpZTWtUQytw?=
 =?utf-8?B?Zm5RbTRvdkNnSDNidVRpbkFCM1NTQW9rSGxVZXNxZERFVWlJM0lGdlhDdkkx?=
 =?utf-8?B?bFZJSU01aU1DcmJMcHBFOHFRNHE4Tnc3M01uMWR6MmVnSmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUNVbVZCK2FQNTBSQVVUSTZuQURSSUFjNVR3ZnFCVytwbGdUd2cvWWFkYTg0?=
 =?utf-8?B?Y3pVZHFXZUxBVE5WSXIwSytOajRVc2Zidm9yZEtXYzMwZXRTK0p3ck9XM2FG?=
 =?utf-8?B?Q3Y3aTJGdDlYS0sxZ0I0K21JYmF4VFFWVVpFajl0RzdxVHZkVW02aHZMV3Ex?=
 =?utf-8?B?bEhlam8ybWJjdHVDUVJHZWRxcTk1Nkk4VGFCSUpOTVBjRXQ5RVFoMVNvWi9o?=
 =?utf-8?B?R3NVWTAwZ2R1Z1hXSmQ1L0RSRVhLT2FtOC91Y2lJdWRra29RVzNnS2VKb0NM?=
 =?utf-8?B?UXVGQ08zdXROUTlEbGVJL1FDL3NtWS8rZFZ1dVA1a0YvSVBYZ0owK0VxTzR5?=
 =?utf-8?B?SnkraXFyN29wa2xJVktIMU9aN2poVHNsTzlRM1VoYWhjb25EWVRZQ0dSN2Jk?=
 =?utf-8?B?QUdGSGNGSHFaTEE0U0pJSlR2Yk15UmxWWU44RlBTVVRXazNTU2NWa3U3eTZY?=
 =?utf-8?B?L3NQcHBKWHBaREVUVG8xeDdUZXBHeWgvM1Q3TkZtRUQyTVpiMlduZWJSb3RG?=
 =?utf-8?B?Q2NUbWVzbnRHZ2FwWEVzMGF0MkRpSXNOZ1JIaEtVcmVvWEIrbmkzWWl6bzNp?=
 =?utf-8?B?Mktha3BOODgyc3dJU1V5dGtNS0ZORVplWmlldUJ6c3NOY1h0Z3diZU5vT3FO?=
 =?utf-8?B?b1RNbm1xVHp1Z21vYVFqeTI1RUYzaGpJTlRXRSs5R1d2YTZ1RWtaVTNKUUhH?=
 =?utf-8?B?UU03ZzZNczdGWlFhNVZkazZESkM1dGcrSUF2T0FGVUhSdW0yTGIxdTR4UHV4?=
 =?utf-8?B?blBWejV1aUhJZHdqcXowVFRXUk1IMHB1THA1dExDZXp2NDhscDdraHE4N0Rv?=
 =?utf-8?B?bncvbWJCQWgvL2ROZTA2OWJ2eUdGQ1hoeE9xS1ltMi90N1ZLQmRmVWg3RkJn?=
 =?utf-8?B?WXY0alpJMU1wcE1mT3NmdVpiNTVOK0kwUy81UTcrNkRGUVowOFZBeUh3Z2NK?=
 =?utf-8?B?YjdCRE5sWWhyUE1vd3BlQWZ4T21JdDZBODg4NFdLU0F0Yk4yTEJhY0NCRytD?=
 =?utf-8?B?RDdMZ1VUZ0x3ckk5RkhqOG5ObUY5UWtleWd1cmZjdnZMeXd4aUdjODl5OGg0?=
 =?utf-8?B?QVFPZnZ3TW5xakYrbGhPKzFSdDUwZmlrTXBvbGx5Q0QrakhDUzAwU1pYRzFU?=
 =?utf-8?B?TTlZaDM0SXZrV01kVW9mMjBXYnh4UDdUUk9tZzNoOE9YNnhDQzJQd3dzWDgw?=
 =?utf-8?B?V1dZQlpJd1MrRkNEWjlFMTFwQ0xIUzAzTEZXeTlFWUpaTDRpU0g5THR3YkZU?=
 =?utf-8?B?ZUtJQUFsTERrZFoxQk9VUjdyY3pTSnNhS0RPVTZzeS9wdnJGVnF1a284WGpj?=
 =?utf-8?B?bUJ5b2ZSclgwU0U1RWkxYU9wcHV6aFV4QTk0Nnprd3R3dVhUcDlHR0lPcWlJ?=
 =?utf-8?B?d3RFWjRlYXFFU1c4cnFMc3dBVVREcSsyTll1LzBVODZ0TDk1OWVmZjZsdjYx?=
 =?utf-8?B?aUw2NDFnb2hxYS9XeWxONzE3bnlZMjRYaFF4bTMrUXF3ZnlnTDYyeWJ1Rkpl?=
 =?utf-8?B?clUxOGpaWjFERHcwdEVWZ0trdGxlMnpPWmJxSWlJYjFXMjBTa01Ra2RCenN6?=
 =?utf-8?B?c282WTlkSXVoaC8xa0dxOE1vUXlhVUZHWTg5UkxwRUlieWdacXkrdUpTQmZT?=
 =?utf-8?B?empEbjh4TlppUmtNQXBvMW9tK3plUThuaTQwbDZ2RURoZkpEeGVoa0UyUE5E?=
 =?utf-8?B?N3o2SHo2cUF4WE9mazgyeU15eG9nZ2hrQ1ZCWkJXMU9taVpubVlNOFp0Z21i?=
 =?utf-8?B?UGZ5aE1PZTlmNDVJM1lFTzZtY3dRMUZDOXF3K2Jtd3dYa0g4U3NJTkl1ZjRM?=
 =?utf-8?B?UEhsK0RRZGJLYk5yM2ttR29PQlhhWkZuamdsekFRWUh3RzhCVXhuWXREYUlC?=
 =?utf-8?B?RlJFd3FnazFtTTU1MnpPQ3p4bmNIUGk3MTRxWkNtTFV2cDZ0dTNjYllKSEFG?=
 =?utf-8?B?RkpxRzBzQ0FZclpEbW05WkFQUmZMZlVuUXFRd21ZODIwdi9WUjc1aUJqWHIy?=
 =?utf-8?B?WUltQ0dDVEtLbWU1MkpaR01RK0crOVBUZ1k5MERpUWdpRXRJNDc0NUdTVVpx?=
 =?utf-8?B?aG5jSVI1S0UwWFkxaXkzb1JiVDMwMnkvSkVxdjFXNjBsdzNMR1I4WFdWT1Mz?=
 =?utf-8?B?MlI4S3lGMFVrdWtKcDcyalJDdWFaam1wZU0wbzRwSGZJQ1EwVENMU3NJTW5u?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afd16147-1e80-434f-1e59-08dd49f7c299
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:24:22.8491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTNL4cIzNb5SI8AsYFrUjjLgmSEQW2Zx2NPcXPj4MKmsXZl1n3dGgeW75NrUi1MSnpuZrQCPvKqI4N5/TlNhuivL6YIwrQAc1u8YN2eB8ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
X-OriginatorOrg: intel.com

Hi James,

I'd like to check in on what you said in [1]. It sounded as though you were
planning to look at the assignable counter work from an Arm/MPAM
perspective but that work has since progressed (now at V11 [2]) without 
input from Arm/MPAM perspective. As I understand assignable counters may benefit
MPAM and looking close to settled but it is difficult to gain confidence
in an interface that may (may not?) be used for MPAM without any feedback
from Arm/MPAM. I am trying to prevent future issues when/if MPAM needs to use
this new interface and find it confusing that there does not seem to be
any input from MPAM side. What am I missing?

Reinette

[1] https://lore.kernel.org/lkml/9479c799-86fc-4d9e-addb-66011ecae9c7@arm.com/
[2] https://lore.kernel.org/lkml/cover.1737577229.git.babu.moger@amd.com/


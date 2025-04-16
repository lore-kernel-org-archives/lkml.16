Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091DD215055;
	Wed, 16 Apr 2025 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819780; cv=fail; b=giYSi1ExCrm8rlZdeNu+IJnHKo7r11J1BbXtvKo1xn210g4XEWpju/MtMTQnKwzDwmK3eML1v9JjQGdZak8Z9LSGcy3PpnKHdjzNWiQtNineh/pOBqRMx8OM/xw4AIJk5GkKH8fHjdV5jrxT/I5WejMTFdL4ZC+lMfIAU1oj7CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819780; c=relaxed/simple;
	bh=0dLjvvUIblKd0TQjnHvnsgu8ifEV1FWEWqqz2BUDI5w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FHmMB5cQzHQ51iluzPd5RAqxyZD99+R+WhN1XTTxC2a+EndGQ/B3HTYpVt61dFT10S/AqhHFMLece1Slh19dKWBtyQ6asbvyvNhA6BSstO4A0PMFnUbnDo/HJ7TK652zNLnMy/r0YiS/7R6lb5jxCYYBZtmwFJkK+axAx7PeZZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxIlcUGp; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxIlcUGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744819778; x=1776355778;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0dLjvvUIblKd0TQjnHvnsgu8ifEV1FWEWqqz2BUDI5w=;
  b=nxIlcUGp1XF41lG9u3nGMtJIzfdro9/xHM3llDw+sOkMO2OrIPZSzulI
   Le8evzmyTo0YiM5fZTtgVa1/I0OQp0XV2kFQlgMXgvD8XioOS05+U74J3
   rrpEe9dWlallkudl+XQGM2E9G+07Xtny5K+slEyxMp4PNIJbpBTm5C5Pj
   Z9izqHiFn0r/Wh0SNDEvJnfBJMrIO+o9hWyaX5qjkmi88XayyX+B+TaTW
   2sQ7uDLRsySkgdCg55Jfk9Oi3OaZ0D/ER+dKMS7U40xHLoH3+sxLc+0ee
   IUcszLsZ+MC+RRJailCMb+ZgWlzMMpSivUQuHlPgiH3Ufjmes+GZT0Ax1
   A==;
X-CSE-ConnectionGUID: 7pBBf/6DTomCujbqAdVG3g==
X-CSE-MsgGUID: NXIPnypMRkexCv/yTQgq5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46259917"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46259917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:08:32 -0700
X-CSE-ConnectionGUID: NFKcTF2tSW6w6Yy7i4c1HA==
X-CSE-MsgGUID: P8WEYjr0S8uFZQCUTV3syw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135598563"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:08:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 09:08:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 09:08:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 09:08:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9e8aSiLDXClT+1xIg8Anrek0BjejBG/fblhRZLGKifXd6xoi07/CVfUck0xxJt1VL4mDQz8cjaHvAekeHqa/FnwQe0JaVB9XW6IfLm7VwivqywRL1KKuo3jics/rc1OWyEWiKEsrtsabtHWsu0ru1bTqaiVM+HbTCd5QG5kC9PArzXWqDRDwrRKcLinxEJLoPxUqBqbBlHuK4qJ74WPeVwvpQrdnu2dePlViGQ1nuCf4xx6iLlSKbwcHYDW21SFHudaSBX7t7EtqYaUM1gLpxpjJ6UFPOkxJcz4tpNQ54tN3rmlRprspIyfpLeREtn7bfJbz1+UG0NLrgmLALJbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGmw1Tpc5/NpvFDnW4IMA7O5TaaMu0a49etxv6A+fcs=;
 b=q29MrETUcF6cr1zWFgVJBppLbPewD0MxBuZBYZIaEZ8wZhZ+ZwQm3XK70W/V614NK9k6qwXBTdocO0S+9LISpvtMR33Qta74wJIYkzsVzm8Zn+pCfqpImsWAxP0h++L36k6BWikQd3y6uAEpJ9wJpb4Ha0+Ju4N0u1Uffy5I5kPu1BO1d+ZaHT/10J7/muDt1LhCsyt3dPE4nwOmo37M5CeiNTl48Sr9vVpvLu8yRzJldZoOz2SY4LAzZ6Vu7hBKWz/RN28+tjyBv+eJPXc4d8Oh4CHYmsh5or6bc8wQIHnNgbyuOwwaF9wYpRRFWAc/fDnLZkR96OkvyvI7OiICqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 16:08:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 16:08:27 +0000
Message-ID: <d2966a26-4483-4808-a538-bb20973dd2a1@intel.com>
Date: Wed, 16 Apr 2025 09:08:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/26] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
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
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <135e452ba38426487e143bc4661883e4939d502c.1743725907.git.babu.moger@amd.com>
 <74255838-47dd-4e18-b458-f9488b38b9e2@intel.com>
 <44c82df0-30e7-44d1-8759-c8f3df68e538@amd.com>
 <dc736f74-ea47-455c-b27e-254277aa4022@intel.com>
 <600224e2-2c0a-410f-9812-80dd1da9d7c1@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <600224e2-2c0a-410f-9812-80dd1da9d7c1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:303:2b::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d141da0-7242-443d-35bf-08dd7d00ebf4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2dhRXZ1aW9kUVo4S3B0cHdRRVYweFRvU0JjcktFRlc0MXNuTVNmOC84RFZM?=
 =?utf-8?B?K0EwT2x2M0hxWkgweHByeFNVZjBleUI0eWxyb2pZVHdOWE9aRUNISVVVejI1?=
 =?utf-8?B?b2o0bE5OcCtTVFRUcHpBTk83dmpCL1NDM3BlMElDUFhycW5PenlHZEdqKzU2?=
 =?utf-8?B?THloSTNFUTYvbHRHL3BuM2t0allBS3cyclROUXFmdG9tVmkzK2hSQ2d2a1V0?=
 =?utf-8?B?THBpcmlicDZ3VWt2c2o1bGNmUEIyNmFJTVVvd1hNT2NsMHYrUlc1N3hFODhz?=
 =?utf-8?B?L3RiRDEyalFEa0ZGeEVpcWFLcFp1YU55a1ArOG9obmNwTFNLUkpqWEpLNVl1?=
 =?utf-8?B?ZkZzRXdlTHJVTlJLZ28vbHg0SklVOXdmdmlpU1pmU1htNnFzVldZNWoyYkNo?=
 =?utf-8?B?dmtwQ2Q2VXdLK0RoSjFZUDUzNlhKT3ZzUWtsU3dyc2pNdHJFT0ZhN1lITEhP?=
 =?utf-8?B?Z0MvUUU1WUFLY051QnFYK3p6NXFzdjdsZVdBYXlLR3Q2ZEZlcVlLNE9CQmNu?=
 =?utf-8?B?Y0hKTHN1M0FYQVVVWDlXeDZDZi96NzBmNE1zMkpEMHJZaVVDUlN5ZlpHOTly?=
 =?utf-8?B?R1pzMVlhSWgwaVFkdlU0U3NCV2hlMk51azBNcUhwY1JHTVdKblNrd214bGdG?=
 =?utf-8?B?RGFUd29qSHhSQ2RmVVF5cW8rMitGTTZMYU44em8xWFFSWjNBaGVDUDl2MStE?=
 =?utf-8?B?N1ZlWW11NEgzOW9nNlN4NjJyODNYZS8xMm9xME9jT3ZCK01HYW8rV1RnVEdh?=
 =?utf-8?B?aDJpZ2YxVWlwRTlmeDd1Z09PTDhPZjl6L3F6YTIva3NlNmxmRDFPeEVWeUo3?=
 =?utf-8?B?amxxKzBuTkVFd1B3QUc0M1psZkhteXlmcUptTzZuMVFzdG5DYzRwdFhhb1FO?=
 =?utf-8?B?RytrRlNpRG95TFVhYmZWYzdmN3hYTWQxY05aMGNEMDdIWlpqMlZSeHNYZGx3?=
 =?utf-8?B?akhZTmF4aGh0a3FhM0t0TElCQXJOVWJWUU9OU00rdnRCWERrM0hFS1VRbmlR?=
 =?utf-8?B?UEowREhuUWh0TmFXSHhqWVJ1Z09DRXg4dURrN0ZpLzFKc0VZYlI3ODRRNXAz?=
 =?utf-8?B?eXV1ZGdtOCtiRlM2a25kMVNqaUU3NEhIZWx5TXhQN3VPNy9qWlRDa2ZibXdx?=
 =?utf-8?B?WEQ5S0FFeFArQUhiRDZnUmsyaTlsRllFNWYwaFQ2WjlTOHBONGszeEV0UlBE?=
 =?utf-8?B?bUlaRzVpaHB2T2xLTWovM1E4Ky83WkhMQTZhSjhjSlRqKzdta2Qvc0hSbGpn?=
 =?utf-8?B?ZGFCREJrWUpjd3NQRFV1K3YxeXlCOFI2UkZSNmNtalVHbEJXVVhmNlYvTVly?=
 =?utf-8?B?MXE1SitSa0hxNVlGTG0wRXRrTlcyZjllL2hmWlRGR0o4WW5OaGNlVml2ZkJh?=
 =?utf-8?B?SnNRbHgvZ2NiQldKNVpINkZEbDdwT0lpWXUvVDExYlFSa1ZOZHgrd01qZEhI?=
 =?utf-8?B?WFo0eU1pbUxST2FwSzBNNm5vUHRsS3BkVGU0azdsZHovUnU0czR2QjZYenY5?=
 =?utf-8?B?bk9rUDhXdTc1WncrL2RWV1lYWVc2SW03TjRmeU8zakNoTll6YU8zVGs1d0hy?=
 =?utf-8?B?ajdHTXhTNS9rSXdBV3ZEWlVJNEI1Qm9CSDBmZW9jVTVnUSs3c0poVWVXemVy?=
 =?utf-8?B?Y3drdy9lQW5WZEkvQm95Q29zUzBTdDQwa3g2UXpqQnZMSWJKTE43c0NUcVBO?=
 =?utf-8?B?ekoxVEF0YVo3dXhId2duRy9zSUNvTlUwQmQxM0JPRlFjOGpnSVNRNzJOQjB4?=
 =?utf-8?B?ZE0ya0dNSXNZV0VsbHhuYkdwRytycUpwdmRidGhuZE5aTlkrVXpydFhpTXBa?=
 =?utf-8?B?Rk5kS3FTSjdhZStBWGYzMVRDeE5JaUVkVk5Xb1FhdFZXZVloMy81eWhnRHor?=
 =?utf-8?B?VDE5MEJsRVB6Szg3V2tsa2VBUXNVckpQSHUrVUJHbVkyMEt2VmpnQnZuZFJv?=
 =?utf-8?Q?sJ1uPf5twlw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVlBd1p5R1o2K0xQc2F4ZHBDeHFtYkNXSkpnV3IwVXNsMHN5dHBHOWZMOHpx?=
 =?utf-8?B?NW5aUndRaktyenAyOGtNSkNKYVNtWEVzM09STE9XdWZycTJ0dXF2QVl5Tm5Y?=
 =?utf-8?B?Rk9YSEpsR1ZKYkNHQklqK0NBNkxrOGZtc1VoL1J5SzViQmlnSjRxOElJRnVI?=
 =?utf-8?B?cWh5VHR0eHhMaCtlKzFWN0hCUys5WEdLdW1Zc1hYY0xlQk9UV3Y5NVFaaGpn?=
 =?utf-8?B?TmFsZmkrNCt6OUZBc3l4Y3o1L0hLNEpwYjBtSnpDNi9OUWRTTnllZm1wR0Yr?=
 =?utf-8?B?QVhMMmkxcEU0NkkwZzRMNmppbE50dHRuMVZ5S1V0TVRsQkVhZ2kxQU8xZHZJ?=
 =?utf-8?B?NEREeGtzNFZTUyttZFhuTklVSkh5MCtTVG9IcXpoeFYzZWNObDZ5Y293S3lw?=
 =?utf-8?B?eHA4S2VRY2dGOUhPRFZkaHk1ZWVGaU4wRjBTc3pjZm8yZ25nTmxSSmo2RHNm?=
 =?utf-8?B?RWVQOXMxeXFrVW1YN0dWc1E5VkZFemU4a1RpQUIyTUhYZ05rTjg4WCt3OVhC?=
 =?utf-8?B?bC96RjJTc09ZT1RCUmhnY0E0bEh2VGpENkpxbmY5MzU4aEZobExCT1Nma3k0?=
 =?utf-8?B?bVREWEJnREUwcHlLNFBDL091TVVjN1lIQmVJbThqZldNOHFhSi9LR0ZsUDVN?=
 =?utf-8?B?bmxPd0YyZ2I1VkYvaEhMNXp5VGZoc3dRdjAvZ1dWejZzOUkrZWhHcWkxcys0?=
 =?utf-8?B?dmxnd2E2ZzMxVWxhbWo1QWdlL0x2dU1MRWxaL1YzcDJMbFNROTBqK21VVzlh?=
 =?utf-8?B?QkROSG13S2pPR0dMZGtsakxud3RqTUwwU3EzWjhqRGIxQkw3MXBiVVFhTk1n?=
 =?utf-8?B?YW5hT3BCekt6VTdKMmJHU3pMZ3BiK3krZzliOEk0VEpIRkhBU1RaZjlXUUJE?=
 =?utf-8?B?Um5pTm15YUZwT294dW9tZzhmdStsclNqUlZlN0V6d1U4a29ZcEF3VTd0dXFC?=
 =?utf-8?B?SVJ4em1uU3RkQlJXWmRGb1VsaENOL0R1RVc0SElGZkJMU3h6am1NRWhGV3BH?=
 =?utf-8?B?eFY4Uk5YTzlld0poeW9GMlN6SWZNaGZwT2dSNW5ITkRQV004dHdONjFNL3Q4?=
 =?utf-8?B?ZE9sWWt4K0V0eVcraHRMN1FIMUN1eWV2d0JORzFDLzYyOUE1bUZybjRiMXYy?=
 =?utf-8?B?RGt4VDk2YnZuRlRMUGEwR2VCVWNjVlFFU3JMVm5BcXhCd0g2MUJET2RaL1BX?=
 =?utf-8?B?bTBGYmIrWFRWUm9sZUJZTVEyMTBtZjNLOVRyNk9OSWp5eEo0am1iMloyNVJi?=
 =?utf-8?B?SDRSSjM2VHhaZldybUs4bW50eHNlSTh1OXZneHR5ZWw2L05xTVJwK3d2MElF?=
 =?utf-8?B?L0FpcHpnQWRCTlBDckduWVczV0I0d1d4MlhOclV1aHE0ZktjM09MWndHSW1t?=
 =?utf-8?B?SitxNE5BOHZSMWc3U3BRMjBNY3Z4dnAzTm82clJqUFVnMHI2OVZZZnFJQ1Vy?=
 =?utf-8?B?R1JGTEorajE4dk9GUU4wa1N6TmRUYzhMckZvZkxrLysyeWRwQkkvd2ZNdVFV?=
 =?utf-8?B?a2dpNWgzWHRSd2ptN2djMUNHS0wrVzJaZ09helNsVDZDSVR4bjlheVNVVFZO?=
 =?utf-8?B?RVp4VXIrY0EyeEpJaE42NUhmM3JsbzR3WVdPdWhxNGU2VmdpRGtIdGNCVXN5?=
 =?utf-8?B?VTVFbFdGNUowNnhYUUVybHZudkJsNi9lblRxWm1HSmEvVzBlL0VWaVBWOVUw?=
 =?utf-8?B?MU8wVGFmaHBPYUJXL05FMnY1WlN5eUNROVR3MENKU0lGdVNabG1idndBZExu?=
 =?utf-8?B?d3BpQmFTQ1puYzFnajNzWFgwems5ZVZsdy9rVURjK1lCVFpBSDBGbzdOYTVs?=
 =?utf-8?B?K2hLdjFtalh0cjdYaHhBbzl0NTl5SC9uY2RJSkxjREJlSmpaVEpDMFdwbWIw?=
 =?utf-8?B?RlhoMUpGODlxT3c3V2ZFNU5zZEx1WHBsalkybDIyamozL2dZaWh4T2xZcEJJ?=
 =?utf-8?B?a3VlVzlKUUVxNlFjbjRXOURuQnVldEhKY0RPY2VWcC92QmYrUkkzUTQzRUx5?=
 =?utf-8?B?Yk5JS0NoMjJhNUF3c2d3WWFVS0M3c1BNbUJzZkhoaE5qYkxOZ2hFdUhIQ1Nn?=
 =?utf-8?B?dUZ1YjlmUVBnQnpZT3hadG9EU2tBa0hyQ3c4MklwN1JMRmhWMG90UDV0ZzRD?=
 =?utf-8?B?Tmdwb3RIZlZIbGpidGZKK0xNTjdTWGpMU25pTjZiVWgxczlIQzlBYU1wRUpO?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d141da0-7242-443d-35bf-08dd7d00ebf4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:08:27.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUjUigx8FBJl9goFLZkhybQkpepZR5IkT3u6paK+dJK1j1kVXW1j0KOVn02boBsLJvxqDTGM8braWcJPmZzUz4DiOmtaycJkOYEHgfbjqQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
X-OriginatorOrg: intel.com

Hi Babu,

On 4/15/25 12:43 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/15/25 11:09, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/14/25 10:48 AM, Moger, Babu wrote:
>>
>>> Here is my proposal to handle this case. This can be separate patch.
>>>
>>>
>>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> index d10cf1e5b914..772f2f77faee 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> @@ -1370,7 +1370,7 @@ static int rdt_mon_features_show(struct
>>> kernfs_open_file *of,
>>>
>>>         list_for_each_entry(mevt, &r->mon.evt_list, list) {
>>>                 seq_printf(seq, "%s\n", mevt->name);
>>> -               if (mevt->configurable)
>>> +               if (mevt->configurable &&
>>> !resctrl_arch_mbm_cntr_assign_enabled(r))
>>>                         seq_printf(seq, "%s_config\n", mevt->name);
>>>         }
>>>
>>> @@ -1846,6 +1846,11 @@ static int mbm_config_show(struct seq_file *s,
>>> struct rdt_resource *r, u32 evtid
>>>         cpus_read_lock();
>>>         mutex_lock(&rdtgroup_mutex);
>>>
>>> +       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
>>> +               rdt_last_cmd_puts("Event configuration(BMEC) not supported
>>> with mbm_cntr_assign mode\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>>         list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>>>                 if (sep)
>>>                         seq_puts(s, ";");
>>> @@ -1865,21 +1870,24 @@ static int mbm_config_show(struct seq_file *s,
>>> struct rdt_resource *r, u32 evtid
>>>  static int mbm_total_bytes_config_show(struct kernfs_open_file *of,
>>>                                        struct seq_file *seq, void *v)
>>>  {
>>> +       int ret;
>>>         struct rdt_resource *r = of->kn->parent->priv;
>>>
>>> -       mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
>>> +       ret = mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
>>>
>>> -       return 0;
>>> +       return ret;
>>>  }
>>>
>>>  static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>>>                                        struct seq_file *seq, void *v)
>>>  {
>>> +       int ret;
>>> +
>>>         struct rdt_resource *r = of->kn->parent->priv;
>>>
>>> -       mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
>>> +       ret = mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
>>>
>>> -       return 0;
>>> +       return ret;
>>>  }
>>>
>>>  static void mbm_config_write_domain(struct rdt_resource *r,
>>> @@ -1932,6 +1940,11 @@ static int mon_config_write(struct rdt_resource *r,
>>> char *tok, u32 evtid)
>>>         /* Walking r->domains, ensure it can't race with cpuhp */
>>>         lockdep_assert_cpus_held();
>>>
>>> +       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
>>> +               rdt_last_cmd_puts("Event configuration(BMEC) not supported
>>> with mbm_cntr_assign mode\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>>  next:
>>>         if (!tok || tok[0] == '\0')
>>>                 return 0;
>>>
>>
>> Instead of chasing every call that may involve BMEC I think it will be simpler to
>> disable BMEC support during initialization when ABMC is detected. Specifically,
>> on systems that support both BMEC and ABMC rdt_cpu_has(X86_FEATURE_BMEC) returns
>> false. 
> 
> There is one problem with this approach. Users have the option to switch
> between the assignment modes. System will boot with ABMC by default if
> supported. But, users can switch to 'default' mode after the boot. By
> disabling the BMEC completely, it will not be possible to do that.

Good point. Thank you. Another option is to hide (see kernfs_show()) mbm_total_bytes_config
and mbm_local_bytes_config when ABMC is enabled. To me this seems like a clear
interface to user space, when user interface changes the mode the interface changes
to reflect new mode.

> 
>>
>> I would also like to consider enhancing mevt->configurable to handle all different
>> ways in which events can be configured. For example, making mevt->configurable an
>> enum that captures how event can be configured instead of keeping mevt->configurable
>> a boolean for BMEC support and handling ABMC completely separately. I hope this
>> may become clearer when using struct mon_evt for ABMC also.
> 
> Sure. I can try that.

Thank you.

Reinette


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4E22036F3
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119003; cv=fail; b=TE1bbk1+G15IIZaptG+XvLB2ajw0baWVkoRrlyhALutpWo/A63l0g/gCe64NLifdGohquUC9v4MerEJCTNT2h0//fQ6pReF9Al6M8fsHallrd/2nCbs4NiweDSDlIUgZ8nQaZh00fE78x39TEte5uuPkdlzXxDXelTVaRGxNgAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119003; c=relaxed/simple;
	bh=aI/zCAVmF+GtK1YHfZxBmmShmNj1i8W7K/9hrR1uoqg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VJKgA8zOAFXSgON0F20nPQ1+yeOGnJwEtaxhq1ITcGUrKE4tW34i7pBqnjs/2TRQPiboFv85k0YGQONYFUFsH1nZZhYyJiNWnJVextWJiWdjSK4iAmj7N6wzK6GnHXHH5opLlGcMlhtT8aLPbGwtH7eb/rX8PxfHOmiNSySZJDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoz2tvZ1; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoz2tvZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746119002; x=1777655002;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aI/zCAVmF+GtK1YHfZxBmmShmNj1i8W7K/9hrR1uoqg=;
  b=hoz2tvZ1Wa1rc+ZB2gXPe+5QXQ3V4Qay8vNxYbfF+qIaTuLNKcPOCRAA
   OrrzEtmjR7659F7OGZQgJ2QbPg0sE1YUO8bGB4wHxXL6ufbDjo6cFzt9L
   2eaVnVrAi1JA4JVP9PP5mkbreY5bWWwuaIN/lzltBGyNHnzI/4kfMzqiT
   tsfJ6AEizhZ74CGjLoa6At/Wdc1PLWUk1ypfCQLUQben1apWI3smT5O8o
   trohsZVgCGeCmBux2Nj70HR7I+Gyj+xNDg/MX+cRujGEECQNN5OuS+E4z
   cpRWgtPD8x8ZB72Rdap19IxLcf37rQI0ElcEPjRRfetK2qW481x+WS/aE
   w==;
X-CSE-ConnectionGUID: 1rn9cglUQG+kY40OelOz9Q==
X-CSE-MsgGUID: 1inVmYWGTCWa/pYPo9DuXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59166822"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="59166822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:03:21 -0700
X-CSE-ConnectionGUID: L814TuQTSTe8QYNkzph9rw==
X-CSE-MsgGUID: V+NvHAZFTzuXFoARFDnruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165356873"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:03:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:03:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:03:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:03:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMzhcx8IXkTNIL8Ltru7cZbmWqXesHWAH1YavqZKcZl+yzmVXV5eAjcb44zPyq8etT7IrjiUiiXHl7LMsCKYZAjLpns+bD9msOdgBarIjThw18vA/6O/poaBJejUV0/n2Cyz0eoDPjEazbInv62zaSJVyXME5CNjxKQF0Hbl0oYmFbetd+GmqIHwkYIBgDwoZp5DVIfHb2G0TJSmV7CCLfte5KINoewioLWH11Qfi4lWInOscUR1fcuhqdjZl/Ce3+MeT5Cv+nTWRZoSowRASqzTvfNrZE2coZIeK+VNcddHi9KaY9PvqVoA/7NsnBPk9deQ4rXJrfRbjuhZD4f7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GteP7DwpJrYgeqY8632N6QGWO5Qnu73hjBnRrtVui+c=;
 b=VMRvsZA8vZPdgKlbIdmeIbV/Ir8NRvgq4ddsh1RZYRKx4SpbIJ3TSiXCpRx1i45poide0tGx/E88HbrqQuU6bzqH5AUlIETZVJMpHjBt98xVWzJrAhxrzbbF4TOCPLN3cvgO4Nwxnfctc4N59VWQLk5TOVU9dg3kk760h6yCM0mDUG37TtSP5jrln1OpfdLMBnyN5yDbdLL32NCnUrsouND8X8UVuNKbDZQ3ttV03k5Y7W72zdrgOGhieDTsCAGzyaUFrxKUOMyMw2czSjKDbHeBrwsDQDrUbABuUVvKk+O2WjrV7BQtP6dq5p/CEPXxwEaFFdmE5nu5s5b0rbQ3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH3PPF7A88A980A.namprd11.prod.outlook.com (2603:10b6:518:1::d32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 17:02:46 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:02:46 +0000
Message-ID: <91c31b70-3d41-40cb-b00b-aa39cbd07bc9@intel.com>
Date: Thu, 1 May 2025 10:02:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/27] x86/resctrl: Check all domains are offline in
 resctrl_exit()
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-4-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-4-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0029.namprd06.prod.outlook.com
 (2603:10b6:303:2a::34) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH3PPF7A88A980A:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b3601a-dfc0-495e-728f-08dd88d1feb9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blIxbWxldFNMMUEzYnJpbC9QaE1SVHFPSE13Mm1UREdhOVRYZkp2TjgvRGhS?=
 =?utf-8?B?dll1UDhuNExDT2ZZMjJjQ21CY243Q1VROVc1YjZUMFVyTXpOcVZVNTJPMWlP?=
 =?utf-8?B?eFc1YXovWlA0TU0vT2hvY2M5NXVSd25vaHkxenljRXoyOVhUNGx1WXNZTEhH?=
 =?utf-8?B?WUZDa1FNcjQ2ZW1Na0Q3aE9EcHFHRVhtc3FlTnlIZmw2dWpuZFZBV3pPT3F1?=
 =?utf-8?B?SjRoY3ZXd3Ercy8yVDFhRklrS1hlRUVZdUpwKzlISWZIeXk1MlRleFBTV0tT?=
 =?utf-8?B?U1l3dkQxdGdpd2RYU3FZcm9xT1RLMkFxVWhkMXR5WndYL01ITDhCdDJRNWFK?=
 =?utf-8?B?VTdmNk5SL2RqVWh5UVZ4NmtqeGFwRk9vc0NVdzFIcGoyVlZJOGZSNmVPWXZa?=
 =?utf-8?B?STFCZ3J0MHJzaENTdlJFU3NZOG1UYzFLN3crK3NpTXJTczBoOUtoZzdzNGJp?=
 =?utf-8?B?QVBqWGMyengyeDR1Z0pqNkF5ZlNOWHNweS96bTFDVVRvblUvVlppWndNSGZL?=
 =?utf-8?B?VGcwVzlRWVhLT0w1WWJTRzVqenc4bnRhZ1FNMEhqMmVrdmNPV21BekZFcXVL?=
 =?utf-8?B?MDBrdS9IOVVoT3VCUHJtUEJ3WFUvdkZsQ2JGem04WkE2WWZJVU9kUUNpN0dX?=
 =?utf-8?B?clJ5RWhpaFZrOU9Ja01qN2ROelFtWFpzUlMzWXBUbEN0R2ptTjNnQ3VLbDI1?=
 =?utf-8?B?UVl5SlNLQ3VsRytBOGllUEVmdVVERnJhT0hPTHEzYmNoZ2UvOFNlYmVPbitU?=
 =?utf-8?B?RUUvVElIM083U0hZVmVBc1NUeWkvTmxNS05qYjhsOVlQTDE3b0xlekZVclNC?=
 =?utf-8?B?TWdwL2EzbVF3Mk5oUjN3cXA4Q0xDdUtQRXlKYkltYVAwbFN2bWNwVXFsbU03?=
 =?utf-8?B?SjUyYWtHYis4enQwU2FPRGdIQ3RMUytNUVk1OUNSY2FDTmhacEtBNGlJRmo4?=
 =?utf-8?B?ZVdUQkgwNUY1a1ZzS0NITEJ4RDIwbzcxOUVPcUV0clEyUU9MdFl1OHlCWjhu?=
 =?utf-8?B?emdmbTRwWkRDSVNYc2gveWdHTzUwN2lTN05SN3Jpazc4eVBTMDV5NFZtbERo?=
 =?utf-8?B?bWlWVWtOQVVqTXRxK05uNFNJbVBlUWNmOTAwbUxJaTlJM3VwUW1SKzQ0TG9k?=
 =?utf-8?B?NW9HUCtsVkxoak5LNkhtQVdIbkwremF2M21tSkFGSlpjTlA4cW1QUmVOVngw?=
 =?utf-8?B?a210R1d4dmJ0RWJyZEFFVld3STd1Y2k3aThpN3FMWjlNemtMRHlERHJEZzBX?=
 =?utf-8?B?WFluN1BFa280SlhUSkZ0MHM2dFJFQjM4WmdaYWtnSjlRa0RocEpIZ0lFYUJk?=
 =?utf-8?B?SjVUdTYxdU9jMENCT3lub0MzNWkrUk9HTmR3UDdkWXQ0WGtvMEpWRkhZYTRD?=
 =?utf-8?B?a0ZEdlVEZFRrRnN0NExUVGM4M1hmVmk1cDZqTGU1ZWVVSG5MVUpGZGJ1dmlH?=
 =?utf-8?B?aVZUUzQ3NXdmMzBkSytsbGxCcGxBSHc0M3ZwU2dCMzlNNE5KOHJmTXIzOHRX?=
 =?utf-8?B?Slk1bXdNcysxdjZXY3lHNVFNcHBPWk4wb0tOTHpvVWx6YW5FRjUxbVVFeDBM?=
 =?utf-8?B?TUo1dmRYV0M0aG1qUWZpSnd3eHIwTDNWbml3T0RraHZBaG1hVE9lYThtN09P?=
 =?utf-8?B?RXZYUWN2bVlmQVN6Y2FQWjFSUlJUR0NWVXljMytZaUV4eCs0TXRVUllsS0VH?=
 =?utf-8?B?RStNQWFyRUNLUHlUT2FSYVBiQXo1bjJmRjlFV04xeWRxVHRNdmhRUVVOTFkx?=
 =?utf-8?B?R0RYVlR3RkVtMmN1SEUwMDFYRS9oRWdnZ1J5eldmR2tDcUpycHY3UVV0OS93?=
 =?utf-8?B?SlFtVFBhNmJlMFJiR0NpZ0R3ekRJTEVOTG5HeGhxZHpLV3JYUWg1emZMS3ZZ?=
 =?utf-8?B?Wk9MbFVUK09Ka1EvdURpaE5XVTMvRkRoNWdaWU03MC8wK01UTjdxYXBxVFMx?=
 =?utf-8?Q?qzMbe5LERHE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3Evdlhsa3pTd0xuTmpkMFpQOUtwdHdOY2R5WGpPOEtNUGVZY0tRdTVrazNN?=
 =?utf-8?B?YTVwRjV0MjV3RDVuUlRRdmw0MW5zdjdRcnRDRkZEWHFXTXc0czdpZmNONnRx?=
 =?utf-8?B?aEFJenhadERPK2I4eVpnbXpZa2l2dmJwdk9aWHAraWh3bXdyMFZFTG9DY0xR?=
 =?utf-8?B?MjdTcWVPTmg4OXo4a1VHaDB2R1dLWEFWVUkvT2NiM3hHREpBcDBGbmU0M0pT?=
 =?utf-8?B?RVZlM1RxNHBFbklJdzZUYUE4MEZKWHd1VGFBeHJlckw4NTNpZGdZblJFZ1JZ?=
 =?utf-8?B?cWZzRDNkaUJCYWIxU3F0aEFSTWtNc2hJNk84VG1nWUJwSDdYTUFMa2QvNG5t?=
 =?utf-8?B?MnNFVFMweDB0OVZqcGovZXRQKzl5YWJPRnVCRTBDZ0lFV0dVSjEwMU1FN2dP?=
 =?utf-8?B?b3l6M1h1aU5aR2Q4eExwa3d1T0dTNEJ5KzcvTkh4RVl1K1NTdzdRbldrRnpT?=
 =?utf-8?B?RkZZOFJNdFVmWVVlUFpIcnZCbVU4S2hJdi9aM0pvTTIzdEkreXRjN2plS3ll?=
 =?utf-8?B?UEYxTUFpV0l4aW9wL0hxMEVQQWVvUGpwWmJSbjJPeEpnRWNGcGx0RkpYUzh4?=
 =?utf-8?B?bHQxRzZieU1QV3VrUnhtV0VJUml2ZGtjclpOcTlIcUJheUprWS9tMWdkM3pn?=
 =?utf-8?B?WGVyelZLa1Vsa3kxZm9RbUplQ1lRMTlMdm9uOGlwdFBYZElPVENId3M0OUYx?=
 =?utf-8?B?RU5qMU9mVzEvWVJjZm5BajlYZmI2Um9hbys2V0FWRklwM0NIcXlLNW55MTNr?=
 =?utf-8?B?SHcxa3ZLNmViYVFFYTFXeUFZR1h6dm5ubXJuVHFSb1A5V21sRkRrSHRBMXJt?=
 =?utf-8?B?TGYwSnhhOTlJR2ZtYzR4aXBxTVJmVGs1L2lCMzNhQ1JUZjgvaTNqVk4zeDVD?=
 =?utf-8?B?ZUlqNzFSUGZvZmQyb0JacFBGM01XeHFHUzdsc3FWV1FMblMvYVBTVG5wVm5Z?=
 =?utf-8?B?dXRQRGoxcU8vM1dqL1hVczF0c0E5dFF0NnB2akpXUURMc3VzTi9XZ2JWYk9x?=
 =?utf-8?B?NUVORVN4eU1hdHk5Mmtwa0NTbko0dFJlRkhpeFhpWk9EQVhHRVdxSXBnZWNI?=
 =?utf-8?B?QnhzYW5wS2IvR0ptRVhOTFB5VGRRUnFDZ2lRSDJPOWVVSnAvYW8veGorNEpQ?=
 =?utf-8?B?QzJJTEdKM3Vub01UWTRraFhmMGFLd2JKdmkvR2R2U1YzRnNhcXVZSlNZYVBn?=
 =?utf-8?B?ek0ya3lqYUloMDZaalZUck13TGJWZytEMEFScHFGNG5PcTBUakMyMTNJMnhG?=
 =?utf-8?B?Ylh4a21SMkhMOGIwT1ZVVVM5dlNPQU1tL0R5RXVOUHhaayt0YVA4WWtCUXFn?=
 =?utf-8?B?YWN5MjU1Z1ZTUE4rS0FXZjhKSDcwZmxCdFQ2c0hjMWdVOXdtdks2UUJwem81?=
 =?utf-8?B?TVE2UkJJZDJHSVhBM2VudER0WmlvaTFuUTZXVGZidHlDd3EwUWhKOE4vZ3Ur?=
 =?utf-8?B?Y1RIUjVzb2NzbGRFMVFGNWhMWGpmSFlTNk4zTC9EWThmSC8rQmM1N0tLS29L?=
 =?utf-8?B?dEV2UTh1eWNvMVlGK0pwZVE3L05yWnJFb2xzN3J3QjJIaWxKTVY1eDlXb2Q0?=
 =?utf-8?B?QXFmUjladzlzOHF6UGoxN09tK3liOWZmbDJrZVZGeDArWUtzdUJEa2MxeXFt?=
 =?utf-8?B?SjBqb1NaVGdGU1hPcUhuZDRCOE4yOGEyQnUzclFnNmRCRWY0Y0F5VFNzUGQ4?=
 =?utf-8?B?aE92YVVtbkk4MEpqZTlYT2NDQ2locVpKdjI3OEp4K3o4dUNoSlhaWE9WM2t6?=
 =?utf-8?B?RzBUR3lQUGJxYzNJQkJRZkJHV3RCeFZZcnR4ZVlyNDZKMlpvL2FsVmVlUnc5?=
 =?utf-8?B?WG9pV0lyS2xLcjFGRzhTSUIvVSs1aDl3Mlh0ZE82WjVPMjFTSmxNVStHQU45?=
 =?utf-8?B?a3JkbG1wVXpBMlZJVkIxOElYK09KK0wreEIvaFV1dFMwQUZ2WTFaNTBzOHBp?=
 =?utf-8?B?c0xpTmFiRk04V2dTS3Fmd2tqRjNqcjZrR28xdUM4YzFidUVjSTIxRXdCM0t0?=
 =?utf-8?B?QUZkVDBmeVNITUp4ODZkdlBFZ1MvbkxFRkFrUnltdHdONHFOdW5CZHNpcmty?=
 =?utf-8?B?MDNYZTYvbFlOV083NU1NUzJoSFE0azhQc0YwUnk5ZzhhWXFFMlF2ZkdraVlt?=
 =?utf-8?B?cGtialk3cXhWd2lLRjU3Q3doQ1VkVENmT2MxZ1pNNkE0VWV6bXkxbExTSGhY?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b3601a-dfc0-495e-728f-08dd88d1feb9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:02:46.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnvN7ev5ygVNWc3Gk9HcE8QE4DHWz+WrGUD5sokXEVLdwNe3d2DcWCaD4asTLqjiYz8UgSUYxx6Lr9ZcpS56Zv9L++fKzydk7KL2uyK7rgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7A88A980A
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:37 AM, James Morse wrote:
> resctrl_exit() removes things like the resctrl mount point directory
> and unregisters the filesystem prior to freeing data structures that
> were allocated during resctrl_init().
> 
> This assumes that there are no online domains when resctrl_exit() is
> called. If any domain were online, the limbo or overflow handler could
> be scheduled to run.
> 
> Add a check for any online control or monitor domains, and document that
> the architecture code is required to do this.

nit: It may not be obvious at this point what "this" means. Above could be:

	Add a check for any online control or monitor domains, and document that
	the architecture code is required to offline all monitor and control
	domains before calling resctrl_exit().

> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v8:
>  * This patch is new.

Thank you for adding this.

> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 88197afbbb8a..f617ac97758b 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -4420,8 +4420,32 @@ int __init resctrl_init(void)
>  	return ret;
>  }
>  
> +static bool __exit resctrl_online_domains_exist(void)
> +{
> +	struct rdt_resource *r;
> +
> +	for_each_rdt_resource(r) {
> +		if (!list_empty(&r->ctrl_domains) || !list_empty(&r->mon_domains))

A list needs to be initialized for list_empty() to behave as intended. A list within
an uninitialized or "kzalloc()'ed" struct will not be considered empty. 
resctrl_arch_get_resource() as used by for_each_rdt_resource() already establishes
that if an architecture does not support a particular resource then it can (should?)
return a "dummy/not-capable" resource. I do not think resctrl should require
anything additionally like initializing the lists of a dummy/not-capable resource
to support things like this loop. 

Considering this, could this be made more specific? For example,

	for_each_alloc_capable_rdt_resource(r) {
		if (!list_empty(&r->ctrl_domains))
			return true;
	}

	for_each_mon_capable_rdt_resource(r) {
		if (!list_empty(&r->mon_domains))
			return true;
	}
		
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/*
> + * resctrl_exit() - Remove the resctrl filesystem and free resources.
> + *
> + * When called by the architecture code, all CPUs and resctrl domains must be
> + * offline. This ensures the limbo and overflow handlers are not scheduled to
> + * run, meaning the data structures they access can be freed by
> + * resctrl_mon_resource_exit().
> + */
>  void __exit resctrl_exit(void)
>  {
> +	cpus_read_lock();
> +	WARN_ON_ONCE(resctrl_online_domains_exist());
> +	cpus_read_unlock();
> +
>  	debugfs_remove_recursive(debugfs_resctrl);
>  	unregister_filesystem(&rdt_fs_type);
>  	sysfs_remove_mount_point(fs_kobj, "resctrl");

Thank you.

Reinette


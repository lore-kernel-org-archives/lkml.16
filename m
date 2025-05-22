Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2D130A54;
	Thu, 22 May 2025 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947132; cv=fail; b=e1AvXvTfJtpdzzSP4Ag4L70xAiNE3w1hNO2Ks85t8bm1N8rCTvRFkiI6QZJlNJN7g58hwHhl6HDhs+YeYBihEE67YxnkXf1Boej7L/p3bRmKWyS0DNDc4IF03ke5TEC9Vr8domA6o17P6xIpfqzygHHpzyETAmZ5oO7cTiYnGQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947132; c=relaxed/simple;
	bh=o0L9ec3s486iCwhhcjX9ZxTLAjQC6YITDOkVORx1KSo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hji5vtyCcVwQBl+HnfIFiifUsIYLclT3WNtvTR3MLRDyRzBXMYrsohYTMAHfoMmOVYe3lhE2Qc4Ne2d6LoU7f3Kgc2YXJTxTmowPsfH3RM8ayeyULY1ocjPewLM9I3sJrj/Z1fQTS/Bv3PEQag2ldLeWn5e4NtXNPOWe6/JaaYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLraqP3z; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLraqP3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747947131; x=1779483131;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o0L9ec3s486iCwhhcjX9ZxTLAjQC6YITDOkVORx1KSo=;
  b=YLraqP3zPIYSNNLL1AxLGR9QyR6qJH1b5V9J71o/vSZBq8/yuVN/o/T6
   YWx8o23bfMMmMrvWCeTZ6fujDhSCyplY1vCZRhvkAgLCGIO2lZdCbiYEB
   iwGdEyhBsS6+ud9BhPCSqF5fFWJMS2IqMw9orKG6go8PV9Eh0kPyDGXLY
   MSNt3J1UZkuwa7aMuKPWFigGlkcZ90PWR75Z42aletvfMJ++EfvjVRKT4
   zzikzV3P15z53eh9DvyZIgGtVvOIejmRMaFdNRHfeS/ns7n8O7iuYPxYu
   YM0fA/oy8e4JONf7knFjRdU1BZVaAJxbDRGqLXeGMonC8yZPXzw4pk0aS
   A==;
X-CSE-ConnectionGUID: CGE0AYgcTW2CF9wtbQsGLQ==
X-CSE-MsgGUID: NXTR+7vQTMWbhn6yVMdDkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75392439"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75392439"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:52:09 -0700
X-CSE-ConnectionGUID: 7aOqTateRX6cdXMjbP437w==
X-CSE-MsgGUID: haYLZZi2RbefqTZxNqkxtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="171654638"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:52:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 13:52:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 13:52:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 13:52:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MghnXVX+Ru7oXax7T4VetjxoWyW7fp1PYwQ26ePkoCiLKRmjEvZcMyCCKQbSb88yfz88l+6196hgnz6Xmaa01gP65TrsymPLVtl8dB6B5cU29OQL88mtC6SMIijrMcKJ0DwQyuEXFBDuYbbsX6G/elcKngMKNTKyt20wpqh+PkN+NQ3YMHF0mNb5HxdgMYc9mz5iOyq/bHS9/ITJflMo6Wso3t4oQYm1IhZhJphUmrL1t4Ug46abPgzSA34PFt8XewtLCV8e7piti2XXGv8JXlQH3ZqFvGHNSDNrCL3/eULjOOpyOlrtO+nTZXc08GkZldgrPCdkJ1VT7g+6AHfn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G/Dgmy2X5IjRd+JOQBVy+DmJXOlYS/lhdisEsUInXU=;
 b=Ujdj+1hYWw5K3Cs/hSXPbCjSNbBiWucM7Ir67mJUhFZ6/a1RFTxTitXBJqmE2JpjtC3kBzYgcnerw8yR3YW2kB0I6qyM0kxNEZF40GsSW4HaTQ8BLpvkO6Apa0WFFvQkfOSWfvmQ0j5fGcOHf+iGwA/OFf/kwjHPTJy3EvT8kGSvcZ7C6xArRLwnMkZUYvUIyuEN8GfkPkcUT7vIOna0rfIFUK9/TbGg24kxqqRX8WOjQcGMrQlKrLfNrxBlaC8eZqwqxbqlXSE9G+ngPb2iNfAiP+Rt5uLYNX0af3hLUYYL/04XASeGe1II/DCWC+ZRelQKhuo1w5nn3cVJjVOXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CY8PR11MB7396.namprd11.prod.outlook.com (2603:10b6:930:87::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.33; Thu, 22 May
 2025 20:51:32 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 20:51:31 +0000
Message-ID: <505f530c-810a-41a4-b3cf-7eb326bb6990@intel.com>
Date: Thu, 22 May 2025 13:51:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/27] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
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
 <aef9947e5ed68feb0d33a2c882c140e2e472276f.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <aef9947e5ed68feb0d33a2c882c140e2e472276f.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CY8PR11MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7311de-cdeb-47e9-495b-08dd99726e95
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkV6aitRWkJ5UUROejdNUnN3d1pkc0huZ2FVZkRNT1cwQlhla0ZwL25HOHdy?=
 =?utf-8?B?dmxuOTFaK2hOZTg1Zmw5V2kzRXdBV3lKUzhsTGtaNUZQMHRKVytmT09mRzk1?=
 =?utf-8?B?RWhTUGdqNUMxeGROOWJDenh4Y1NwdXNHQzBGY0lQTk8zM1VGYVBTdnFBTGtn?=
 =?utf-8?B?WkhYRm9XZW9hVTBrM05jQUFIY01TaFhBYWtDbzJkTlV5NUMycTVvdVlSZkdl?=
 =?utf-8?B?ZGdxaEVFU2JMNEF5Ykd0dlJUaGNPeTM2dFg5Z3h4ZGpNbEV2NnBvMG1qK0tV?=
 =?utf-8?B?ODlKRWhMUnB2SmZoTzE5azZXczJhTEhhMFFHTTNsWVpWY2o2dzg5MUJFeXA5?=
 =?utf-8?B?YkhPK2xUMEQzalFJZ2U3RnR5eVhYRTQzejl6NFAzajJFajQ5bENHWGpiQ0Jy?=
 =?utf-8?B?TGlmUXJMakcxRTlNeUhYYWRWZXhacDY1SFFRUXR1dzFRVzBhcms4cE9jNU1m?=
 =?utf-8?B?WkJSTjRhQUo3b2RvK3hUQVY0d01PYXVIcDlSQ0tYbHdraU5uMGp1RUprWkt4?=
 =?utf-8?B?dTZhZEwraXN3SE9FMW5idHVTSjdFNSt3TkZUWnF0UUIzcG96aDJJb3hQbjBw?=
 =?utf-8?B?K1dxMXNsL082c012TTJkTk95Wnk0YzhHQ1hmZExjOHNBQTJpaUhRSU9EY3Fh?=
 =?utf-8?B?Z0svSCtjMDJpaXFCcmdOSS9oUi9NaXhuM1hMNEQzT09zMjJTaFRZaTZaanJU?=
 =?utf-8?B?dnFSb0tFY1dMRzBXZUJTaUtGWEx0dGRXaVZUb2Vad2tnT0hRdHpGQ2Vua0Mv?=
 =?utf-8?B?SlFtVzBTUXZ2aVc3YitvSUVJSjdwckIxekcxTGpmRVBWbU1VaktWNEpMcG1z?=
 =?utf-8?B?aDR0VzRYS0liZmU2OWJqYmJsMFpTM3ZhS05iSW9hdS9iQVk2R0lkQUNrRi9S?=
 =?utf-8?B?Zzg0UnRrU3MyQWtLQ21EdjdzMDRNTkltOVhLakFEMzM4b21TNjA0UkZ1Smhs?=
 =?utf-8?B?SFJtY05TaWxGS3ZQN04wOVpyKy9ySXlHOTVURThWMW1KK1dJK2pOVTRUbzBq?=
 =?utf-8?B?NnVrRWhQTmF2UUsxOVY4MHJMOHY1N2l4VlVFcjFKcVlrb3VuNnY3eFQ2MlZV?=
 =?utf-8?B?akxUb0N4YXRiZFN6VGJ5STVlN3V3Nkh4MEd0ZXJpNjlpMTJoS2F1bi9kV2Z0?=
 =?utf-8?B?T1ZLb2QrQnVhRk1SVDFmc1NVUjFpTmxRdjBxeWNUUXk5MXNCamFQYTdYcUlm?=
 =?utf-8?B?YnJjem14empjRVEyaWZBYnEyVXhIK05OZkV3ak8yZjRTdWV4aU9hLy9RWXFM?=
 =?utf-8?B?TVM1SkY4OWtmRXlId1FkbXVuRmhIM0RxSW9vMUlJZTBieUp1bXBQanBodnpl?=
 =?utf-8?B?M2xLUFZWY0toVWg1SXdlOTlEVUwvOGxwVHRMWjAxZGNwa2l1bW9xbTIrZzMr?=
 =?utf-8?B?SkJTUVc5NlZEZTVWV0gzT2pHL3dEMTdJbHY3MFp3UVNxUWJScFg0NU9OOS9S?=
 =?utf-8?B?MmhHdUpMNmFGRm1PNWZ4MGQybXEzbWpidzlnSjlubnF1TEp2aS9SNExueU8x?=
 =?utf-8?B?Mzk2TjhnRmF0cVpvN1hmSHZuVGhZR0dQOGk3dkx5U2JsU0ZhWkgrTHBwQnZp?=
 =?utf-8?B?Rm5rcFJ6ZmtzMVB5T0tlSS9DK1czUXFtUUV6R0NTU2o1b3VGa2JZcjRVc3ZO?=
 =?utf-8?B?cHJrZkJtcURPZFBkSjh1TVJ0cXRUMjNzeC9nYlFxd2hiZGRiWGdEaTNRQUQ5?=
 =?utf-8?B?bWo4OExZSVZ2bURqK3IxOG5GV0F0bUtQR0JRTWwyeWJNUkg1VlNnWXQvRTRz?=
 =?utf-8?B?NjYzWEJoS0NmZksxSmcrMmszWkVEQm50Wi9qT0FZRU5vMkQ5OVVzcXgvdTFK?=
 =?utf-8?Q?+gi96ktnvqyvcW7G6vpTQO2enl6fpjUcuXKPk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDkyL2VyZ0w1VTcvZFdpdzVpMDY0eStXNWVJUTNXRGRudVRqV0xSNjR2UEI4?=
 =?utf-8?B?bE9LTkViVWlGSEtISDhyR1hQcXhZR3ljV2JDa2pVOG9mbkt5VllKRFpHZFZp?=
 =?utf-8?B?TmwwZWM3aWs5clEzNnNtamVtK2VvRGJpR0w3cElxTXlBUWNndzhhb1Y1Y25D?=
 =?utf-8?B?eklYclRQNGZ0TFJtaldQN0pXd1dSODBLSlRrZ2diQTZLcDl2U3l4blhxalZC?=
 =?utf-8?B?Mkl3VnR0UEs0N1lMRktLS0tSY0tEN3A4c240UlVQeXg1NlNiUFV5UFA5YmxY?=
 =?utf-8?B?TTFjTkV4OG5OQnpxRU42Nk1BaEw3ZC9rcE9lRU52TkxnWmpBYTZFU3lMWHM4?=
 =?utf-8?B?TjdKamJRZWowN0xxcjBWeW1DdFVwQnp6MXFZLzJMZDBjbTl4eFE5bFI1S0pr?=
 =?utf-8?B?YWJPZ2E1MEZLYWpJSGZ3Y1oxeW9NUkc3dmhGTkN3QTBxbFZOL3AyNzJteE1O?=
 =?utf-8?B?UzQ5VjlEcXd6YUkzRXFMTmdwSktTSHhsdGxDendveEhuR2FERTlDSnMzRUow?=
 =?utf-8?B?VFpybGJEclVHbzhRc3FSYmlaSTVnM2NmU0dlaGp3K3drUG1Tdy8vRHJ2blM5?=
 =?utf-8?B?anZGc2g2dC93ZVdYaUVGWU9vOEJHcjZjWUhVN0lRS0Jwa3oxZEJnb3VubkFk?=
 =?utf-8?B?YXlMODQwVWRrSjNPejhUL0xpdFVRbDVLekR3V2lJR2VWV3RMSHJaVEJhb1lv?=
 =?utf-8?B?WUJ0N3hWeDBoWjRwenJQOWJOdXRSYit3M1BkK1Y4YlY0VVdRdlBJOWFLeFB3?=
 =?utf-8?B?dHA3d3p2YkJESWpZSTRudWwrZGNHR0hXaWk5VHRGKzJiaXp6cE5MMlBDUGR2?=
 =?utf-8?B?b1FkLzNnUzdHbEtSOWQvL2VRT000UklDM0lYck9xejgwcXRncmoxVXVCdmJD?=
 =?utf-8?B?VTJyZTFMZ1BCQ2lJWFpmV1pLZkhPd20zdmFNT3FiZFhndkFWT1h3bzFRSnFV?=
 =?utf-8?B?alRWcnVVWGp2ZlpTQklTQ2lyK05CVFVRYmVuK2VpV244TlI1NmUxcU84YVVG?=
 =?utf-8?B?dE5LR2NQODh2VDVIKys4TzA2WjM0Njc2WUZjVlJSUzR5dnhUcUlGRHRhakhM?=
 =?utf-8?B?M2F2eTdKZ0JjYXNUQUJuMEhSZ21BZUhZTVRwWTNTNnNlSDRkeGFkem1xMmx3?=
 =?utf-8?B?R2xsM05vUVpSSjR1T0dDencvSlhKVnNIbDJ4cDdEODBKb2haQlF4czhlYk94?=
 =?utf-8?B?cVh0Qk9zdzBoVHFHOHd4b2dNUFVWa2NZRHBOQVJhbUN3ZUVxZGdwbGJWaG5Y?=
 =?utf-8?B?SEpWeGh4dng2SUdsMUFQZkh6S1hIdTNuOTVycHdUVXJkTEpKeUFDYnBhSy9C?=
 =?utf-8?B?cC94Q1JDZFZqZllKcUllRDFPckZtdlNWSFExQnRycEtFMURHL215QmNxRWxu?=
 =?utf-8?B?Nm1DbjRrNGs4UnFZQkRrOW0rL3JOYlRTNnhQdnNGRnpOZU9iNEpRb2JoUWVP?=
 =?utf-8?B?ZzhoN3RFQmNXQ0JkNGs5K09jcnJNcnRhZ3hMMVAzWVQ5c0pnUGNwajhsYUFH?=
 =?utf-8?B?ZUZ0bWFWTU9kUUI4MnJOK2YrQU1DTFhTWXIrTEZiTlNNaXRQanZTU3NYZHR3?=
 =?utf-8?B?SVVHMjhkaU9XSFNXb3ZicC94U2Irci94ODlac0lPUGZMeVV0b3MzeWdMaXFQ?=
 =?utf-8?B?WGhxZkdMa0l5eVo3VUNVWFRxeDF4UkZ3ejdCbkU2dEE3QlduTzFTbEZaeUlI?=
 =?utf-8?B?YkNwcWU1OFJjck5vVlJET25FRmJTUDRpWjlzM1BiOCtVbUp1VUJ5RExqZ0xu?=
 =?utf-8?B?NnAyZ3FkcVBpSTVlNTgyQll5VHJQT2Y1N3NKNjlBbk1YUjZUYzdFQmVZK0VL?=
 =?utf-8?B?aEdWSnM5cGRVTTNTZVErNDNKdEZvZFRzalhBQ2pTdlNRckVMeGg1eVlLRFY1?=
 =?utf-8?B?U0p3Sm8yTzI3T05mWWx6QnRERHNPaUlSd1BPaGF3K1FObXlFUlZ3R0tFV1lZ?=
 =?utf-8?B?VkFUTXNyc1V1cHZJbFo0VzVDS3dNdkRvZ2Nla3lrTm9zMkhTLzFQdFZVOGZR?=
 =?utf-8?B?RytIZGVGNlU0dGhNakZZQ0RjMFpkVWVzNUJoZ05ZSjdUVDFDeU9vQ1kzczFq?=
 =?utf-8?B?SU54Z3psSUU2R2ZyaWh3S0krWURLZjRPV3dnWTE1ek5NN1dXUDVBcEhuazRF?=
 =?utf-8?B?eDV3VGZ3RjAxaHR4ZkZ6V2Q2YldMRmd2WXdWeXY3M2xiNjB0bjNUbmx3U1J6?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7311de-cdeb-47e9-495b-08dd99726e95
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:51:31.8601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dpf2jVypYvSTPEt6lVGrDtjI1eoLvW92bUNLFCTxPezekuSdTvIS1smV41RZZx/r6tnCmdGIbQdh8wgZEJ6/VqYUabgXdgzPHNBUXdIjF6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7396
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:
> Users can create as many monitor groups as RMIDs supported by the hardware.
> However, bandwidth monitoring feature on AMD system only guarantees that
> RMIDs currently assigned to a processor will be tracked by hardware. The
> counters of any other RMIDs which are no longer being tracked will be reset
> to zero. The MBM event counters return "Unavailable" for the RMIDs that are
> not tracked by hardware. So, there can be only limited number of groups
> that can give guaranteed monitoring numbers. With ever changing
> configurations there is no way to definitely know which of these groups are
> being tracked for certain point of time. Users do not have the option to
> monitor a group or set of groups for certain period of time without
> worrying about RMID being reset in between.
> 
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it is
> assigned. The assigned RMID will be tracked by the hardware until the user
> unassigns it manually. There is no need to worry about counters being reset
> during this period. Additionally, the user can specify a bitmask
> identifying the specific bandwidth types from the given source to track
> with the counter.
> 
> Without ABMC enabled, monitoring will work in current mode without
> assignment option.
> 
> The Linux resctrl subsystem provides an interface that allows monitoring of
> up to two memory bandwidth events per group, selected from a combination of
> available total and local events. When ABMC is enabled, two events will be
> assigned to each group by default, in line with the current interface
> design. Users will also have the option to configure which types of memory
> transactions are counted by these events.
> 
> Due to the limited number of available counters (32), users may quickly
> exhaust the available counters. If the system runs out of assignable ABMC
> counters, the kernel will report an error. In such cases, users will nee
> dto unassign one or more active counters to free up countes for new

"nee dto" -> "need to"
"countes" -> "counters"


> assignments. The interface will provide options to assign or unassign

"The interface will" -> "resctrl will"?

> events through the group-specific interface file.
> 
> The feature can be detected via CPUID_Fn80000020_EBX_x00 bit 5.

"The feature can be detected" -> "The feature is detected"

> Bits Description
> 5    ABMC (Assignable Bandwidth Monitoring Counters)
> 
> The feature details are documented in APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...
>  arch/x86/include/asm/cpufeatures.h | 1 +
>  arch/x86/kernel/cpu/cpuid-deps.c   | 2 ++
>  arch/x86/kernel/cpu/scattered.c    | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index 6c2c152d8a67..d5c14dc678df 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -481,6 +481,7 @@
>  #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
>  #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
>  #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
> +#define X86_FEATURE_ABMC		(21*32 + 9) /* Assignable Bandwidth Monitoring Counters */
>  
>  /*
>   * BUG word(s)
> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
> index a2fbea0be535..2f54831e04e5 100644
> --- a/arch/x86/kernel/cpu/cpuid-deps.c
> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
> @@ -71,6 +71,8 @@ static const struct cpuid_dep cpuid_deps[] = {
>  	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
>  	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_TOTAL   },
> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_LOCAL   },

Is this dependency still accurate now that the implementation switched to the 
"extended event ID" variant of ABMC that no longer uses the event IDs associated
with X86_FEATURE_CQM_MBM_TOTAL and X86_FEATURE_CQM_MBM_LOCAL?

>  	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
>  	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
>  	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
> diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
> index 16f3ca30626a..3b72b72270f1 100644
> --- a/arch/x86/kernel/cpu/scattered.c
> +++ b/arch/x86/kernel/cpu/scattered.c
> @@ -49,6 +49,7 @@ static const struct cpuid_bit cpuid_bits[] = {
>  	{ X86_FEATURE_MBA,			CPUID_EBX,  6, 0x80000008, 0 },
>  	{ X86_FEATURE_SMBA,			CPUID_EBX,  2, 0x80000020, 0 },
>  	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
> +	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
>  	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
>  	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
>  	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },

Reinette

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B567CA52;
	Thu, 22 May 2025 23:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954891; cv=fail; b=X9MHD36yWPko73GTN3KHkIC6yD0wvxvfua4Ku+EHera+Fwji7tYV9UwBJapLpDIyt+POv6UcNeUPc5WxBfL5gYqwAXs0aMvEelRF7Gtny+SM76Zg2GVKN0NoWhpJTypXSE6x63ofI18JbOJc/n+OrKsD+NGvFX6dGHtz9rnOL88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954891; c=relaxed/simple;
	bh=rqkHibIYl2cXHn12riLmCr0ekIPlpAdeKy7BEKTVGRU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Uezvlq95Z1EMBnWiorAasr38xuSw5iAhlc1SWud5oZqxag9l5ulWHNBJrn7xSJcDxtlGqqs60z0CJnvF3nI6dRp+nRup3kVBxalevI4rTnhyw97yU7Kn0cGvFES58Xa8Z6wdFx9QIhw0dYzjbHozmuERayYn3Krg0TKpgvi+fWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wp0NBTx7; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wp0NBTx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747954889; x=1779490889;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rqkHibIYl2cXHn12riLmCr0ekIPlpAdeKy7BEKTVGRU=;
  b=Wp0NBTx7m+yd6AKLSSLQMiR5w6cMKw28GIBDIYvr5RfbS736mpTlzm+M
   6W0WkUJsYxqTdeZiKODkwQ7u1IrZ02oB6XbFQPMdWHN+b07sDt17jI6s4
   62wqBvhAdm/qOdnTGmibucChoZDk2tE/yaH3Yb5cHcJWHWqcc97mXFaqf
   M7vLpv1lXEwJ/bfsTSDyjfW961+KEBtnadwk5keoo2pCLgGypBugPDKYZ
   VdhSSK1CjkHyuL/KQWn0/MUnMB0WXsPf0xvxWOdXLcqm7invbVoDlqA0i
   0n5d7UPLj4H5+GdTJWMe1B0qSbCks+nXTC+07c8leMY9AotiE4DHEOSt2
   g==;
X-CSE-ConnectionGUID: yWif6K1USjW+K8KsVRcuEw==
X-CSE-MsgGUID: k7eADumRQ5SaMuolkYgU+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="52631719"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="52631719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:01:28 -0700
X-CSE-ConnectionGUID: 5Aeu9jnBTc6/wO3EeBoiqw==
X-CSE-MsgGUID: KjM/9X9ATwGQ7/BqQp6L8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="171793294"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:01:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 16:01:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 16:01:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.63)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 16:01:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAOHjva/kTW4pH6awF0B9t2Y82yJJdEfLy1pudi52liYHULUP71Mi9fWtWxcCKl0BgBorKp6HVM9Ey3VLXw5Z3pJpWerXO3RDezOhmEO9/2cg2mLEq2CJk68a/mg8u7T+Jni87TdSoacxEaqQooKf2FGlLiZuU2Vjelut/hAcHNDZwcivA3GuQQFRgLjBIrGGXkChG4OnIfeIoD5+f9g3HMje+xyWxv14L4rvqxJRVdxPn9QfxPNCCargxvaJnGxU/BrLY/oPfyw5FhbSQdMO2S7jPkQ1GpCqcJwvluPPzqvXpAt5/Nd4+tNGGGuo4hfg6rAjuo8kCK29tv6zs4pFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djR+ZnBf4XHnmXsWUx01LHLF9UtM3FFvoRYKVfivkpU=;
 b=mPiEUZsxatC1PJ4QFWDQbVXtg7w4EStR01jXXbGdrPd/2LzTMm0vmKm1Utor85HN4tCZ7RmFut7MFk8t+Vhi4DGtSZbvnXYaQeR6ZU9JVXj5Mds4qfFGlqENCqT+nNgrTSD4NVCnJwxNigMOiHCnmRoQQTGnqeyXfhhPyfs8Boah/PLM7dtuFaO2FDBRajj/M6hxEgXW9rJEMWONc/te8gCrBtJJLbcmQT2G8TPj38FBNstHgZRvFpdyRGK7tdELOE0BlBxen2OmzyNaKOpK37NFwFqM/TOPe05ACcn+wdtanKQrB9aFhL2C09b5yj2p23DGhXqCIqGrso06dOToKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 22 May
 2025 23:01:22 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 23:01:21 +0000
Message-ID: <a2c09a35-6d47-43cc-b014-a834277de591@intel.com>
Date: Thu, 22 May 2025 16:01:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 15/27] x86/resctrl: Report 'Unassigned' for MBM events
 in mbm_cntr_assign mode
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
 <df408cca8a500713b8a7e49ed5a95d9ccc54c48e.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <df408cca8a500713b8a7e49ed5a95d9ccc54c48e.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 273fdcfe-46f4-4091-95cd-08dd9984914e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1dXUnpONDlEYWh4NlgxcFlxWTZIWUI2T3NZNUI1YWVpR0cwS2ZGbWVHeWlW?=
 =?utf-8?B?TENlOHA4UXJkNkwxK2luSzh1UUNybExMVnJQSDg1NGxOYXJianJlMUtzMkYz?=
 =?utf-8?B?cENDL0dtdWRBc3k3V0phZnZHcjdVRU5zeWYwMnlYQjNrQlZ3LzRldUhEekVF?=
 =?utf-8?B?SzgzOW9rOWIrVjh5czJ2ZHNRSTNUSWNTR3duRHdDTEFzMkVwYmVaTXZuUC94?=
 =?utf-8?B?VGoycWRDMlF2YVFNUFlENi83QmxkRjFyem1Bcmx6TllnMXF5K3hlNzQwZzJP?=
 =?utf-8?B?dU8xSnRPSGpzTnBzaFVWWEVBZCthSGV0cGFPblRkeEpYcjdlSzAxeWlTM0s5?=
 =?utf-8?B?SnhYOUMrNktGNXhSVXE5Q2ZUWW9zd28rT0UyTkIzKzJlajNrVkVMcHZMejQy?=
 =?utf-8?B?OFRsOHVvbyszWTNhRDVNWnBLWkJNbnBYalJRWUFibnRYNVN3RkxBbzNpNFZY?=
 =?utf-8?B?cEIrM29Zc3owNjFqRWJmanhJTW82UEU1dk5oU0pYL3MrS29rM05CbHJpbVF3?=
 =?utf-8?B?Tm5WTEkwdVhJRzRyd2dIV0ZyOUFGWVlvYmpPdnlBTjdVOFhIRkJyRWlBL1o3?=
 =?utf-8?B?V0JxUHB6cVR5a3ZkVUF4NGJ1MzJuaTVUM1BHM0VHNllLR2JINmxYM3UrOFhs?=
 =?utf-8?B?N2E4eEJjTEsvWG0yWTZOWitrK0Mwb21MZ0dJYktGZ2E0VGhYdjNnOHpMYUsv?=
 =?utf-8?B?NDBMK2J5VVdML0hKLzY0TTM0UEpTcHYrKzVsc05aZSswNWF5UVdwVEpLcXVk?=
 =?utf-8?B?MjRQeTE4VDhxNEIzejg5UWZLRDVNMWRwejhteU1MMWRsaU5vRUJENE9IY0E5?=
 =?utf-8?B?MkVucXBtRUhyYTBLUnVodTNHSGpVS0g2YXFxUXR5TzVQZnZQd0hwTEExTHJh?=
 =?utf-8?B?TU1KOHUyd0x1MkdZWjkySXNUaEEycHl0Tk1qd2NNT1BSWVd5WGJSODJudHRG?=
 =?utf-8?B?UlJpbnNCbm0xU2JwK3poRUc0WXlmeGdBUGoxK1phRVdCTDVUTWxmRjhaRkZi?=
 =?utf-8?B?UWpJRm92a1BNem5xLzRZQjc3aytxZ2FIcXozUGtmbTlEZVBDck54d0ZQcjRo?=
 =?utf-8?B?S3NVemROOFkyN2kycDFla0VtVzdScjhCTUNvSkcyUjhWUTRnQTJlVkc5cDdM?=
 =?utf-8?B?V3BxUXk2N3I2YitPMEt0ZjZUakkrb09BdkRKcUtiT3YxdGRkd2l1Wmg3dSs2?=
 =?utf-8?B?eHhnY3FKYlNSTDNScU4wSW5IKzZKYTgyT3UzRWEzR1p0ZitKMHpzRVJzNXUy?=
 =?utf-8?B?UWRocEdCcXRmMSt4SzlOZ25QYXdudCthQ1N5alVzdlRhRTlZYTltNnFvUVBF?=
 =?utf-8?B?RFVwSzJKUzAzUmE2WFNLTEpxRlEzZTNHS3docWRld3p3dTJkUGNpUzdjNnR5?=
 =?utf-8?B?ckNLRVVmKzB0c0xTK2RvRUdrSTBxT1pRaDZCYUtTeUNNTU5UQjY1Tzlzc1FW?=
 =?utf-8?B?VFQ0TEM0N3E1Uk1XZjdaT0xwMmdkcndBVmx2QndWNXNJVnhaYnRxdThnRmQr?=
 =?utf-8?B?ekVreXNVQUpWS2xXcUlHNnhnVTZuR1JObnNTV0dMZDFtcE5wVUxDK1AwMXJo?=
 =?utf-8?B?QmRQZmlxdnUrbkNvRXVSRlRucm43bXRDR2RheGpTUVlhNGhkSm81R21peGQy?=
 =?utf-8?B?czJWR2JxdTBaREhQZk9zVklzMHhwYXRaUkFhanRqT3B0WE1jelhSY09Ca2pt?=
 =?utf-8?B?RFVzZjlxR1FaaktxQjM0ZXRMOGYrUFY0UGJFTE9ZMHFMcDVqK3Rob3hmNVBG?=
 =?utf-8?B?YmVYRGd3dGgvUnU5VHpsbXAycVZxbWF0ZlBHa1g5R2FZVGRKYWROcVZyUlFY?=
 =?utf-8?Q?vin4Q3GslPoGqTYZB8IhF+Vebv8/nzZoB/dPk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGp2RStqb0g5TytYa0hWMVUyL1d1Wms0Z0Q4a1d5cW1uSFRQclJHZ00zeU9D?=
 =?utf-8?B?TTFwNGpwdzZJTldoVi9NOFFHMElweUhnZ0xpR09vOEJEdGVSOGhiYWNvVyty?=
 =?utf-8?B?MHc5ZkxDSmtNSHpsU1d6TEtVTTdHMmhvRGdPL2kyV0YyalZlUUNhdDNqMzJL?=
 =?utf-8?B?TEMzZ0oyWVB4Sng1b0dGSXZFdGRUOHR5a0RObjRZRjhBRWVSZERsWjdsL1Br?=
 =?utf-8?B?czhTZlIrMk5vdEpRaG5TU0d0ODJUZU5HSXZscFlJYnRzSis4bUt6UjNHTFNM?=
 =?utf-8?B?dWt6UzNxL1oyMjdOSWVJenhHOFFManJQTHdPVWFvOFY2K05ET016NlVhWDRz?=
 =?utf-8?B?bTVrT0U2a1h2dDNkR0dQUWN5UUlzNmtzckFZQ0lFMnp2elhySGJaMzNmQ0lK?=
 =?utf-8?B?ZFA5eWNJQjRDTnp1cUZuNXlMUFlRd2tzdWJWZFFGMlNnNlBoQXAvN2VEb0FQ?=
 =?utf-8?B?YVJUc0NPS0F4Q2NzdGF2ckxmMlBOY0JTM09nQnBaQzd4dGdRcGttVHZQOXRC?=
 =?utf-8?B?cVdaSE1RNWxoR2xIR1RnZ0RPaVZCUDU5bll2VXoraHZwSTlERjBtaDBCcnZP?=
 =?utf-8?B?ZGtvY3YxcUpTL3h4cFRvdVJtSU5UbFhpT2E0YStNQ3FWNW0wTktyL0tOYy9S?=
 =?utf-8?B?RFR3YlFzcmZ1TGNrNHZUQXgyaXduVTU3Q0dmbWhoejQ3VkhYM2RDc3hsYi9S?=
 =?utf-8?B?ekNWOVRkRkJqejdPYXowYkdzVWM2MDJjQTh4Rk55Rk9LS1NxRmVMS3JXUUYy?=
 =?utf-8?B?SDFaOWRGdGNQRnkzREhmRUFNMlFWVmpaQ0RWbjFaZjZOdlVPdExVM0FUZUE1?=
 =?utf-8?B?ZGJ5MUY1aXorRnZoM3kvRnJUWGxoY25nVTAzS3oyTUZISDVSdXk3UFowWlFw?=
 =?utf-8?B?NnV2NkVqN2UvTWcwSitBRDBndG1ZSjAvT3BLTGw4VzlMWDhNSFlVLzBpWWdB?=
 =?utf-8?B?RHpGN3hUY05iOGhMaVJWN2Jzc1M5UnFoRkQ5c3o4RFgvc2tYWlRRMHkxUmU2?=
 =?utf-8?B?RG1CL1BzdG0yNUFzL0FoYVFGeTc2UkJCYm9IOGFDOEgzbEN4Nm9mcTVDZVpR?=
 =?utf-8?B?Njh5U1VDT2lMVmVTTzJNZHdTUEExUENEK3hycEhLa1JDT0ZQV2MzNXYwRU0v?=
 =?utf-8?B?WTNqK0pwd2FNZWhOdytneHluT0RlSTBkTWo3ZTZ0OUpEbHVKb2UzVkpacVZj?=
 =?utf-8?B?QTMvZXBVc0Rud0dlelV1Y3lJZkkwUGdjSlJMV0d3VUNBd2ZUaUIrUkpPQjJt?=
 =?utf-8?B?MWNuTk9wTFFKU2NFNUk4TDgrUGpVdTgzWXRWRVJhbTd6T3lkNllyR0pNRHRZ?=
 =?utf-8?B?S010VVRJTkkyc0MrMHBqZ0tIRUVueWxTb3oxam1RNTBhN0ZCdWlIZXlwbmpk?=
 =?utf-8?B?UmNBazdrMXdJallXblFzaWlFQ3FGSmVJZ1gwSTZxc3BXZWtGMUZiYm5Nd2M2?=
 =?utf-8?B?YzE5NG15OVFiUXBja3gwMHhJQ2VRVDJyQ3VXbEhZRmpsQnZmc2dCL1VrYnJj?=
 =?utf-8?B?Y2g4WTNKMEI1ekpPVUNVVG5kMGtzd2YzbjJEOVR4aVJ2Wk5uQkFJZVNxYkp1?=
 =?utf-8?B?RlZLRENOY2E0OTBtU3U0Z0dZbUV6N0NPTjZrQzFpd3ZTYmVReHhIdUN3cjhU?=
 =?utf-8?B?cGhmckRQWmRPaVcrbnJlQS8ySWx6U0hFS2txbWRDQlJ5TDlBUys2NjVTNmNj?=
 =?utf-8?B?NDgzNnA1SXRQRS9iMnpJQ0xldUlPTEd6V21BUWxneGxHN2hqVVVlNVJpaU9Z?=
 =?utf-8?B?ZXVtNEZ6NGlSNFN5QlVXa2NJS2ZmdmY5VWliS1ZkaFhLU1BvU1RSUlJVMStF?=
 =?utf-8?B?WENsMXcvM1R2S0NLTk43UHF6RDNsWTVxVVYzN1pNVVFlREhkeWZHSWJuTm1y?=
 =?utf-8?B?WVpZZ1pLMVRoQVp3QUJJeUFXaEZpdnJndnZQSDRZQ0w0VVMvcitpVThVK0dG?=
 =?utf-8?B?K3dHSm1UZ3RmbStHWEZLV0EwNjd1bDZMaTBESEhESEhPSllZZzFqVXR1OEJF?=
 =?utf-8?B?U3k0SGoyc09LZUdzcStxd2NPaGI0V2tWSGFzU016SEdubW1kQStobXh0ZHBG?=
 =?utf-8?B?QXZnemNWNEZBTnBPQ0NiT3AxQlEyL053Umc2MGFVa3dkYUxmMXhsQ0Y4bzVJ?=
 =?utf-8?B?Q3lwb2dDUUhmS1dPWW5oRmxXWDRJWmpLVmlBTmxoajNOQ2p6MHpsNWU0eldk?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 273fdcfe-46f4-4091-95cd-08dd9984914e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 23:01:21.1325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taNsnhty10Rge4h53StDo5adeGXsO3RG1l0iutBZZl8UGRVR4es/Z8H3coqa+CqipBaSModODU0TrU0h3Jtay1JRNq2PcMs1f/1syDPG0YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:52 PM, Babu Moger wrote:
> In mbm_cntr_assign mode, the hardware counter should be assigned to read
> the MBM events.
> 
> Report 'Unassigned' in case the user attempts to read the event without
> assigning a hardware counter.
> 
> Export resctrl_is_mbm_event() and mbm_cntr_get() to allow usage from other
> functions within fs/resctrl.

Please clarify that these two functions are exposed differently, resctrl_is_mbm_event()
is added to include/linux/resctrl.h (also note similar change in 
https://lore.kernel.org/lkml/20250429003359.375508-3-tony.luck@intel.com/)
so not just exposed to fs/resctrl but instead to resctrl fs as well as
arch code
while mbm_cntr_get() remains internal to resctrl fs by being added to
fs/resctrl/internal.h.


> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---


> ---
>  Documentation/filesystems/resctrl.rst |  8 ++++++++
>  fs/resctrl/ctrlmondata.c              | 14 ++++++++++++++
>  fs/resctrl/internal.h                 |  2 ++
>  fs/resctrl/monitor.c                  |  4 ++--
>  fs/resctrl/rdtgroup.c                 |  2 +-
>  include/linux/resctrl.h               |  1 +
>  6 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 2bfad43aac9c..5cf2d742f04c 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -430,6 +430,14 @@ When monitoring is enabled all MON groups will also contain:
>  	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>  	where "YY" is the node number.
>  
> +	The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters
> +	and allows users to assign a counter to mon_hw_id, event pair enabling
> +	bandwidth monitoring for as long as the counter remains assigned.
> +	The hardware will continue tracking the assigned mon_hw_id until
> +	the user manually unassigns it, ensuring that counters are not reset
> +	during this period. An MBM event returns 'Unassigned' when the event
> +	does not have a hardware counter assigned.

(please rework based on "event" vs "group" assignment ... not intending
that "group" assignment be documented but the "event" assignment needs
to be accurate for "group" assignment to be a simple extension)

> +
>  "mon_hw_id":
>  	Available only with debug option. The identifier used by hardware
>  	for the monitor group. On x86 this is the RMID.
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 6ed2dfd4dbbd..f6b8ad24b0b5 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -643,6 +643,18 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>  			goto out;
>  		}
>  		d = container_of(hdr, struct rdt_mon_domain, hdr);
> +
> +		/*
> +		 * Report 'Unassigned' if mbm_cntr_assign mode is enabled and
> +		 * counter is unassigned.
> +		 */
> +		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
> +		    resctrl_is_mbm_event(evtid) &&
> +		    (mbm_cntr_get(r, d, rdtgrp, evtid) < 0)) {
> +			rr.err = -ENOENT;
> +			goto checkresult;
> +		}
> +
>  		mon_event_read(&rr, r, d, rdtgrp, &d->hdr.cpu_mask, evtid, false);
>  	}
>  
> @@ -652,6 +664,8 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>  		seq_puts(m, "Error\n");
>  	else if (rr.err == -EINVAL)
>  		seq_puts(m, "Unavailable\n");
> +	else if (rr.err == -ENOENT)
> +		seq_puts(m, "Unassigned\n");
>  	else
>  		seq_printf(m, "%llu\n", rr.val);
>  

It may be unexpected that this is treated as "-ENOENT" but the function returns
success. This can be addressed with a comment when comparing the return codes to
other hardware return codes.

> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 64ddc107fcab..0dfd2efe68fc 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -381,6 +381,8 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>  			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>  int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>  				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
> +int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
> +		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>  
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index fbc938bd3b23..c98a61bde179 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -956,8 +956,8 @@ static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d
>   * mbm_cntr_get() - Return the cntr_id for the matching evtid and rdtgrp in
>   *		    cntr_cfg array.
>   */
> -static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
> -			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
> +		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>  {
>  	int cntr_id;
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index f192b2736a77..72317a5adee2 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -127,7 +127,7 @@ static bool resctrl_is_mbm_enabled(void)
>  		resctrl_arch_is_mbm_local_enabled());
>  }
>  
> -static bool resctrl_is_mbm_event(int e)
> +bool resctrl_is_mbm_event(int e)
>  {
>  	return (e >= QOS_L3_MBM_TOTAL_EVENT_ID &&
>  		e <= QOS_L3_MBM_LOCAL_EVENT_ID);
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 59a4fe60ab46..f78b6064230c 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -441,6 +441,7 @@ static inline u32 resctrl_get_config_index(u32 closid,
>  	}
>  }
>  
> +bool resctrl_is_mbm_event(int e);
>  bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l);
>  int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
>  

Reinette


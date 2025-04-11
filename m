Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D0293B4E;
	Fri, 11 Apr 2025 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744409333; cv=fail; b=GwxHDSHosZ/UvsOV85K7amsYbVwENqsRQAnIOd6o907feAY2aOgfnL9wFVi0IwI9lEeMQtTjx9rei5KwBX385FSIawS4b5oPUiGphUO+UQFP2m+r/GKrBf6KYXCGADcjrXMgGxUiQ7NnbL8OnBl0YsD7aQ9k7urfZMSxcn4yFWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744409333; c=relaxed/simple;
	bh=2esaMa6dF/3wdMtE1+iM13mYEzzX39s6h9D216zjc08=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eOGPEmfSngZ2p6a0nRSrcNcq06KWNZxpr8/uw/dQINNHVPiB3bD7Ot+1oEMQy5gq2/ERyKzsW3sgxPc5vGXAXciec0O4R977qbrwaXmoQkQyogeyjTkoKtKQDR0klxPI+rjs+biXuJR4OguGhKKx0o3YL9rTzwzIHPscEZvxzqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKMQsQ58; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKMQsQ58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744409331; x=1775945331;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2esaMa6dF/3wdMtE1+iM13mYEzzX39s6h9D216zjc08=;
  b=PKMQsQ58pBgkR2a6COgkYI2F1uUCYTI2KykUEsrrEhXGYX/Hb2wb8hod
   g9U9ftrToJCVmJw6NoxEv5co1+6pz8KEOBvk1wE/sF98CMoEFoUxkKRid
   9PfaeIxACfwkukBJFdjR4YMrf3Z4M1nVAlZi0rzX0wLr7GZV6yhxDNHlL
   SopsAFuE/vRY9UjcJkKVnJOCz3E1nr3tlaXl6YSdrYSZl8t5lvmk9OYSP
   HsFpzRdJLmpsYsGNkuxn3/wT9IXgO3b2uJi7wMASI67IC3cdeYrYf3TvZ
   5xURkdoovfO8oNAzJ2tzXpRnXzo5JSQrbo8XhTl/E1sPrCc+QqvLEVBt0
   Q==;
X-CSE-ConnectionGUID: KKGlSai0QNSm+Uyf5O/8CQ==
X-CSE-MsgGUID: S4JWmTngQoWMqof/xJPw7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46060972"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="46060972"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 15:08:51 -0700
X-CSE-ConnectionGUID: 8pTRPD1USw+C01usSrakfw==
X-CSE-MsgGUID: ylS5iMCuRmmq5ESErOhV4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="134288560"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 15:08:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 15:08:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 15:08:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 15:08:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skg4oBZQu6JXCb+fkxWTcWrFnNBGqDbKK+qlvtgSqUIvHYoY3oJJFTOHeRlpo0Qf1KOm3bSFNuAMKWQfNsWjiGKnLNCfC8lCSgZ0N11+Po01mef0vu0t4Chab1ORWLY92pczlE67CkFcIgki7ZPLutAieZVlDY1jm69+D5K5AXLNv9ljc3Pkbfv9qxCbvDVGfKol+ErLILYOQz0ICGHoUZbgDcdsmTi0sktbrAPzJU+gcOwXMdhMhHDs50U2y9KVZBVQwVFC87K/okPBE6cfyO7EbL5qolxfwUDNPQ69YY54pxtrdZt6xy2lyQRzOwKAHByun+qiv+JAZXCfAE85oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QMBw7J0wPJyRyd6SFNs9vSkewq9a574lHwDaQNJZuU=;
 b=AmsYDZxb3iCtTsg1DoUyatBytxR2sNta1UrjF4EfwjLzvMB5eKuNSEMtoAvlDlW9KtedMuwgQBt4Sl4JXxJt44rrSa8s43TV1snRTq8FeN3aFxoDncKkSBqYizhFnQoF2xKvzZPg71t9hA9s1KhiCV+2YRde0MBTYqIT7asZnjQzIGfOtnt20TDLE7K0tdQtlQCkkuDNU/Ak03muhoFc1zNqbt9QyHVaEXGaP1HR5e1GUXGvvuutd3M+fJyz8fg/+XWMihfQxb52hQruA45degvtkDKRbO7+287hIDmG6FY05IQTdq/IjeRzaZgfi1irlm8Ff8Y7FweIOjVrVlXnWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 22:08:47 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 22:08:47 +0000
Message-ID: <18b3d120-ae00-4ad4-aeb8-694a072195ca@intel.com>
Date: Fri, 11 Apr 2025 15:08:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 21/26] x86/resctrl: Introduce mbm_assign_on_mkdir to
 configure assignments
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
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
 <96edc86bf65a7c261a4d4eb1467220d7f7d1cd62.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <96edc86bf65a7c261a4d4eb1467220d7f7d1cd62.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:303:dc::12) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: ade4fb15-97e0-4d12-daa2-08dd79456e99
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3hlKzM4N0Nlb2orMW45NlpHY0tuNXFUMlBjb2RJdHROd1pHb3UyRU5mN0hv?=
 =?utf-8?B?elJDV1RwT1J5bnJmZjMwZnk2SW1hU1VxMlhFQVZQODRaMisvRjI5dUNuL1Ra?=
 =?utf-8?B?VCsvT3ZUQWRSQXczaG11cnE4SHhxd29NZXB2c3VLTm1xSHZUUUFpalBsbWxt?=
 =?utf-8?B?cDRUNk5OaXdXQTAwSkkyTndJbWNjYkw4aG9HdHN6VmVhTDlQdUpjM2F0QXFE?=
 =?utf-8?B?RkFQR2VlbU1kZlF1REoycTBJQTFmNVR6bHBQMmh2MEl5VXF4UjQ2NFo5M01X?=
 =?utf-8?B?a04zS2JrSjR1R0FNeDhrREtWSFlra09LMVJTcWdENWVDSjFIL3lGTWM4T0hH?=
 =?utf-8?B?ajAwUHB6bWZ3NHI5NTQyOFFWL2VKbFBjcHQ1aDBzaFYrQXEzQVUrZjlVdHFa?=
 =?utf-8?B?MDZuRFd0RkE2eWg0OXQ4OWczYXY1NUlockljNWUrRFUyTVFSdWV1Q1crOEhy?=
 =?utf-8?B?aDRyUFhiM21HU1I4T2hEZlN4SWFGVVdRMCt0blBkSFdPZVFwb3J4ZnArQlhF?=
 =?utf-8?B?ellGVlMzQnpKY0kySWxBY2tjWkpvMVFuZTdEcHZON21McWo5L3RQVCtCaHFj?=
 =?utf-8?B?Q3J0Qk9zMUx5QWdtcmJ2M3VDWnlxenlGOHcrWXU5VjlnQ25WdktUUkJDdEV4?=
 =?utf-8?B?aHBld29mUndZL1krVERkVGtEczhaYkk1SmhCM2E0S1J5MHR4Q2hIT1k1ZkpG?=
 =?utf-8?B?b2ZNRTZZbkFxNHhhS0ozWU5EU2NyMXVGcDd1NGJ6ajZaSE82Sk83VHg5L2FL?=
 =?utf-8?B?d2NHMVRraytiKytQS0svZ293Tk1zemhlYjdlMkIwTldrQzB1YlNFQllBalB6?=
 =?utf-8?B?SE9MY25STWF3U3NhckxEQzBXeTAwMDY5L1JCT09zS2xOTEs2L2h4aHpBNWNF?=
 =?utf-8?B?ZHkzOXF6MXRzbDlwbUxZUC9WQnJHVWk3TUZwQlo0SmhaY3pVWkIyWWhmOHR2?=
 =?utf-8?B?MFJOODAxckt5RG4wQXpuWmo5aVVYVnFRVkVqWDFtaEVYY2NZWnpzUitEZ0tT?=
 =?utf-8?B?NHFmWG10anBQbXhxYmZYZGg5bGVZZ2ZUTHhHZk5kT0d1WmJENGsyS0hISStu?=
 =?utf-8?B?U2lUQkxZdzFtKzhuM3VUVmZkeDA0QmNWY0R4U3NNZVZxTVpZRk1ML3ZMOEw5?=
 =?utf-8?B?UTh6SFBlUzM2R1J4SUh2S0hnOUF4MEtJeXJZbWhxbW5KSm85dUJiZzg1QU12?=
 =?utf-8?B?R2ZYbWRHazBYZ2ZNUmUyanVGNjZlL2Y0bWtYcFFNd3BDQ2YvTFkzU0JzTUxw?=
 =?utf-8?B?dVZMNVQrbDJEQVFTUlgyZkZyWjBUeGJYRFFMMTdVQ2N1NHU2dGQ2eHRGZVda?=
 =?utf-8?B?SmsrQW1MdlBnbHVOODNUamFBNjZ2d2pxS3VNV0NsNzN3cXYxdTlUNkdpL0Nz?=
 =?utf-8?B?QjRlSk4zNmJqR1VmandWVEFtWkwvRnZieVJpR3NjdGZiYnV0a1lFVHdidGJ0?=
 =?utf-8?B?VlBJWi91ZmVOTnhtaWVMLzA5VkE5ZjRSaURFamg2UUxPZ2NCM3JieXo5dGFZ?=
 =?utf-8?B?bXlMaHQ3bUVINEVZWmhwU1k0Y0c4Z3o0eldLVHkzMVZqWlFzcDJBaDg3WUpw?=
 =?utf-8?B?enFDVXlmd0pMSkxXV0hPNXlNWWpJMUFzclNuUzgyS00za0RmOXZKS2p0S3dQ?=
 =?utf-8?B?d3ZZc3FpUVd5SFJHZ3pLWTVCb1Y1dEV0OUVZR2M4NFF2YnFCd2xsL3NBSmtl?=
 =?utf-8?B?MkV1WnZwNWsvbW15aWQ5eDhSbGppRERFcmpTa2dmYzZNSmVjK201bGNWOEZs?=
 =?utf-8?B?N2NkZnNsNUVXc0JBWG4vOVc3Ty9XVmFqUnNvb3M1ODFRYUltN2k5OHQrbFJq?=
 =?utf-8?B?cDVsSXFsVGVBeitCY1h0RHFBVS9NRCtmQ3NCOFcwelI1M09CcXlYbis1cUJS?=
 =?utf-8?B?U3UvdldreTBQS2xaMlgrS1lRUVpUUFNWL0JMUjBpTlBVY2w5SGZEdHBkT3Zp?=
 =?utf-8?Q?IpsUBUO6i94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVBxLzhTRC9QTjJmSlcwbGFnQ3JxaDR1czFXTlpEbmpMeWJPWm5HUUhidFpD?=
 =?utf-8?B?aVArN2NVRW5HZTJrSTJOdGVyaUViYk8veGZKMFpWUWpPWUh6bzFGdzdrcHN5?=
 =?utf-8?B?aGJKd0FpSFJTbVJhU3hBbTlRcjlPQmxpTGo2dk51M2xTOTRPb2QzU3JRelow?=
 =?utf-8?B?Ky83YmM1OW9iTzg4UXFuVG5zK2ZKeXV3cWo5em4rVEowSXpFcFhhUk92d0tJ?=
 =?utf-8?B?a09uK1VMSGpPblhpL2FNQXlZN1NRZ3pZVkgvRWJyT01FQTRvekpDWXh5RDlU?=
 =?utf-8?B?KzZpa2E0K2ljK1ZMVEU4citLVTZRSFBya0dvRS9kT0FXdWpFeTBXNVJtM0lC?=
 =?utf-8?B?a1dFOElTYnZ5SWNBSERtVVZ0N0tEM29MdjhYNStGNzVGYzkzUVlkZHRRMzZq?=
 =?utf-8?B?KytHNWptV01jdFBwQVM0b3N0cEtWUmxvZTQ2ZjI3cFY0aENsQ09VVU9Manhm?=
 =?utf-8?B?cHZEaFlCM0IwYnV5SjhYTkJIWVQ1VndPdFZiVEVaODgreHF4TUZWNUswNGk3?=
 =?utf-8?B?WTZ4eU5uU0J3cXF4RHhsamdIYzRidVkzQ0d2OXZSbU9VbzQ1RnhvSHhzMjR1?=
 =?utf-8?B?YmdHR1JGa1VNZmJhM3B0aFdXK3VHWE9aZkdrSDAyTEtpLy9LVlBWSG9zSldF?=
 =?utf-8?B?Rm1OOVdLQ2ZBWjZHRWxOL0xZbDhhVG9WbW5oWTJic1NFamNKcUgrZ3QrdjFP?=
 =?utf-8?B?UmdkOGgyMU1aM2lhQ0MrZlBOWUJmNjk4M3JrNWFaTDNTVUVhYVl5M3dlR0pV?=
 =?utf-8?B?eGNRd3pFaEFtOE1iVDRRSXhKWk1DZnhITUNYdDlDbFhTcFdacW9neTQxK0VM?=
 =?utf-8?B?WGNhRFVjZTYwTUV2OVg2NGM4TUg2bVN2ZXhUK1NldjR4aTg5bEU2ZmppaDk2?=
 =?utf-8?B?eHIzNzEwekFpYVBlR01KdXZVcW90dEQrTVU3amJ0SCtzRGFPUGJ4RDBvcGgr?=
 =?utf-8?B?UnJMNERjb05hb2FsSmZURUlRaTlGMkhLdTJ6MW1KQ1UycXlxb09JNkxBS0ZW?=
 =?utf-8?B?alh5TUJVQm1kTXlaMnBCYytkRGpxTUhhdG9FMUZlSlVkRTN1a1gxUlBtb3E4?=
 =?utf-8?B?dllOa3lDOW1KaFRCY1lQRmI0Vlowc2dUMGRITUt2MnFVYjF2TTUzR2ZXbmM1?=
 =?utf-8?B?TmdmMEljbXVLVVFJRkJQSzhhU1dxd3g4TFVUS2IyRTRWVk9XalpkMjhjMVBX?=
 =?utf-8?B?NGpneUh0QmdLdEcxR3pNbGJrYngzVThjTXhGbjJZR0NSWmRnNGg1YndoMXI5?=
 =?utf-8?B?c2hNM1JkcEdyaGxmTE0zNnZuSmlteTdBYjNOa09PMWl1MDVQbDhnOVplWXpB?=
 =?utf-8?B?WUE2Yi9LNTlHdkJxT1RNWGNRcExpN2FaeWxjZDRBQ0R5L0NKa242YU9IdmMz?=
 =?utf-8?B?RzZYVGJPeTFwRURJN3lSRnZjWVNCSlIvQXRZVkpLazBVblNLMkhISm9MS2Ez?=
 =?utf-8?B?VUYwMS9xT0hqTnVMd1M3WXlaVjVmUjQyU2VuUFN3N0VaN3RPVUhxVUdBVlRh?=
 =?utf-8?B?K05qc2w5NHN3S2hXbDBnODBXN21qVWpabCttMEZ5SElPb2NlRi9LRDd5YzVE?=
 =?utf-8?B?QU1xa25yTUdhTG9rcFg5SElwSTBtSENrcmtJbjMyNVBKdXdsM0NQSTZFTkJC?=
 =?utf-8?B?OHI3bGNnd2N6bTFmczlJbFllbU5Nd3piSVAwRXdtTW53SjYyYjdER2tqOUlU?=
 =?utf-8?B?aGtHVGk3UTZVYmpLZ2dwcXpPTUtLM0cvcEJkZFJyVjcreWpMdUJpRHZ4b21J?=
 =?utf-8?B?Umo4eHlMT051TFA1eU8reDdTdjR2UGRNWm1yajRzM09WMmROc2lCVzJyMkJo?=
 =?utf-8?B?U0N5TjUwdnZuL3dXZmU0d0ZQZVBPWGtDWDhiUURlUHN1UWFGc0RRbW1NSnBS?=
 =?utf-8?B?eWpPTUhSSGJBbCtQbkhWd1MzOUp1QjJROEZnUlZpenJQQnlHRU9YMHBxR0Fv?=
 =?utf-8?B?NnpINENjUkNXWjlYSWkvSkJsTjl0WFM3N0Z5d2h2RXNab3NPWHBnbkN2akF5?=
 =?utf-8?B?TUxqS01YOVErajNLZGRsS0xScWxLeVI0U0lXTlFkU1JST2FsaHpMQitHeTBG?=
 =?utf-8?B?UUg1RE1kRURPVEtnT1NrQmhUOGpHV2l5djdKb01RZU9VVDZVVktXU0l2REFD?=
 =?utf-8?B?M1J1b1pjenBycG9YNTd4bmFwbG5PU0RNZmMrUHNnV25aNmYrU3N2eEQvZGZk?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ade4fb15-97e0-4d12-daa2-08dd79456e99
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 22:08:47.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v07VZTCTr0tUsmH1qKPniXjOQDFsseGppa2TpRhUKB8Hkdnwk0QQJRtEESQXnhWj2BMk1/LBI/vILCfgZqZzA4dD3YeBCeXcQ0Ph4dQH2ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> The mbm_cntr_assign mode provides an option to the user to assign a
> counter to an RMID, event pair and monitor the bandwidth as long as
> the counter is assigned.
> 
> Introduce a configuration option to automatically assign counter IDs
> when a resctrl group is created, provided the counters are available.
> By default, this option is enabled at boot.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v12: New patch. Added after the discussion on the list.
>      https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com/

Seems like this needs a Suggested-by for Peter.

Reinette


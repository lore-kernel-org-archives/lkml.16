Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A28AD24;
	Fri, 11 Apr 2025 20:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404724; cv=fail; b=FaqfC6e8P4aJx+2M0el0IM5mGGEBuIxHmfbT6m5MD9QjZy1U3nVDbvDMEdhvs6sm1N/xHGGv0Lfe3onydhc2l0lQofI1R+cVOU6bvaoyLtX3blreScr7Yu59i6Om5SbWUWifZpgNS0rWHSafUXhnZN/Sb1ny770SB4hLy/quLJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404724; c=relaxed/simple;
	bh=rlxfFwcUgKgwCM2PtXDg1RGj3/eqMH/5wP21WbGBtYg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YV6d75PBwSNnpILFbrTOdpOflZp1q05p6N7YorfkKTGA7G/etzWbBO9FcOX2ZvgRFvXH3AUZ2LilXAapF5BYFpTkSPGu1oZCdrc/9tsppu8JfcdNGgReX8p3/SBFgGbNRGZIFZziJimhEZ+x0SOYdx32aLhbQGH5TQpvAILFWs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuleCfQG; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuleCfQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744404723; x=1775940723;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rlxfFwcUgKgwCM2PtXDg1RGj3/eqMH/5wP21WbGBtYg=;
  b=QuleCfQGAZ+WxPUZTMQQRg9ZjQCbhZ7g1k5NFgxzZrhbUBvTrZfSU0dR
   PNu+kqVsGmmoHnAFOZghdCFKfCtO6mGRTEk1N9HRvtoq/RZ+GTL1uTXG9
   x/o9NVrT6E99bVUzMmbk8dij9+4FrqWq3+uK1N/rqtRvhozoA44vjfZPo
   PNOxipxnAaV2xslFIpA+cauiUToTXDq8gXu6qbGMRPns/H2kRjGJGfk/q
   qq/Q1mwKo0hKvxyGl1SUkSs0+SlG+fDThbXIEpxgcK90+BtRwSoEpQIbs
   7ZWdslWtfdcX6G8it4dlxDF0YOwbEJgEu9eRRluLXlluohQio+T3Fm8uC
   A==;
X-CSE-ConnectionGUID: ItGrDrrtQ7iDldUgJ73BkQ==
X-CSE-MsgGUID: 6cxP9RtvR86MShvwBUEWKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="48672117"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="48672117"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:51:52 -0700
X-CSE-ConnectionGUID: /ubUc/QNQtKqmT8rEKdNYQ==
X-CSE-MsgGUID: ZJL88/rVQpyCLVFRX0gClw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="130277137"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:51:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 13:51:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 13:51:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 13:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxRuHjA4uJGKbMjLIj10XHFO2TA1ryqFwQqw/qWIe1IG6qq870bOM6eysAzntXkTD53+Bibf/blYVP6jtl2TGHFqlAi5d4FfaOh1E88dBpNAKpmOvvyaQ4+tnCYTQjopwBO6rpKuB2k3YtXD6m1awhlseCTzW7w3sim9WXpfiegT3Lqpooy0Z/ZgDtqeKgB/XOxuwZNndXqCAqgF7dhHEk0dc8/bivtgWvYzDO2eJ+PrTtY+r9r1UI+Gnenftz1/ZWONj+MBpT04X0ECEI2Yy3BcWs+eyw1kalbKlR/g+xzu/FNoRMoZXiasV72qd/H1gQV66M1A8lqhgCwcJqtj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUms4+GZxCCiN7dvU2AmFfSD/Wu8AYraPB0mYuIrttc=;
 b=Z0awMs+6Ey6B7rqX82gJHhIIc7Gt1mgpDRfzEPq4fxlFmPFz2qc++XaK0HICawA/oPzhCAsiJx/9eBs+thSRJ3sm4azef5DgqeFO5ln/UWT6ertNtmj+G3sMmZcctaskETZjIo/Z3EaDl4K//2CBSLYMUXs9xCvFL3ok0/JQ2CziW1bydAhyY7hYYLBAgCW/ph2mRCQeWC8fDgFv8C3vZdWh9LRw+2jnufkYIAQ10STQKRV4N5mPe/cEMrwqdpLXZ8DE6o4u3Lr7Y+7VaB6s1hswFKz1a5fHCBQIvF3LlJHz5BrBLGJ8Le/3G8vEX4FH1pLwbqga84jmz8L1TWxCDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 20:50:51 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 20:50:51 +0000
Message-ID: <6be16f07-c066-4076-8ad8-3eefc45c48f7@intel.com>
Date: Fri, 11 Apr 2025 13:50:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/26] x86/resctrl: Remove MSR reading of event
 configuration value
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
 <4f1551b39f669be01ea3e5938f165d207e2f7c6a.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <4f1551b39f669be01ea3e5938f165d207e2f7c6a.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c41b321-4ddf-4928-0c60-08dd793a8b87
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S044UEtJUmNIMmxkNUkwNkRyQTBSSHRFWGVoMUh4WFJqVHpSUHFOVlBKNm5t?=
 =?utf-8?B?VGdwT3NVTUxrQ2cxMnlMRjg3ZFVQVFZQYUhKWENqbWVuQ09oUTcxWmE4RldS?=
 =?utf-8?B?RHdhVm81Wit0RTEvYjlId3JQNTVhSU05MFNkTmJrSjBTdTYwbldidEd5VjVG?=
 =?utf-8?B?RHZNOWYzRVYwK2hINHNoa01Ya1ZVWEorS1F0Z2kxWkQ0cmRrTU5tRldvcGxB?=
 =?utf-8?B?ZHhtSGloK055dWJFT1JKT1lmc3ZzdkZ0UXdGZ0t0V240a3VyeENlSzVwQlp2?=
 =?utf-8?B?SnZEN3lUQ3QzWWhwdDhTd0Nha0VFT09wd2t2L1VZK2UvVGtrOXVIYWdUa3hr?=
 =?utf-8?B?eFZVbFNPZWpWcFp6b1grOTMwL0pNYlNhc3k2djBwdElEOWVpbFNaK2VOOUlF?=
 =?utf-8?B?VDFiNkZCbFRocVJxL29CNnV5NVpVSE1MRkovb2dNUnJ3ZHd1WGNtS0ZUeldr?=
 =?utf-8?B?SDkvVDlldXBleXUzVzFXZ1pXY3V4cmY0WGlIczhhL1dJVmY5RC8vTC91cHBo?=
 =?utf-8?B?YllMMlE3V0hUcVRpeURQdy9KY2FyMmVNZVpNbTZPV0FLTnF1azlnM213R2Z3?=
 =?utf-8?B?d2laR0k1ajJrci81RmVhRkhIM1VwZk5GbGNvTlQxdkp5YVpGVXZMNmhRYWVu?=
 =?utf-8?B?amJLd2c4Tnlpa3k4aXFIRmVuMFJMbEdDSENwdjlETy9nUW5xcDBwWFJ2SU5B?=
 =?utf-8?B?aEMxVTA3ZGtWS0hxVlhHcElvQmxmQm8yeEt5a1QzMDNoRU1QVm9WVVlJYUpQ?=
 =?utf-8?B?ekhMRkNZVDNvMzhoQUo2eUlGdm5Fdkp4Vk90RThXVmxsVWluNk5zZlJpY2tu?=
 =?utf-8?B?NXRRcExJY1FrTUtYRm9SMXYzUmlhNG9aTmlzc2ZDUjhSbnFIN3dCUEs5Z1d1?=
 =?utf-8?B?Qnp1cGRObWRJcTZWbmlGdC9odGVBUW9USlBRNEc5U1Erb3lRbStKUXZOQzhP?=
 =?utf-8?B?U3pvYXBKc2N2MXNDVTdDNmhlRUpiaDZCUTRMUDB5L2NyenAvL3Z5ZlFRVHJI?=
 =?utf-8?B?TjhHam1FL3NiL3FqaGdONXVLTVVmVjJDemZhOHFrcndwK1ViN2ZrYWR3cTF3?=
 =?utf-8?B?anlHa25wYjNIZlgxVDNYVUFkQ3Q0VmkzY0pBNWJYM3pIaHZjU3N1MXliUXBH?=
 =?utf-8?B?RTdrY29nUUNRaFlWNnkyZFhzbkhIUUt5RWR0eXdyK1FvSENhcmxHc2IxdmV0?=
 =?utf-8?B?Sk9VVVdXUEptSEJxL1A5VjZWb21wdFlpcHhWSE9vN2JNNG5NSnVzdy9BRnFl?=
 =?utf-8?B?eGdiVVZmM2NpLytYVUd6U0ZtekdDOVN1TDNZTmN5UURuWXpTS0xpRnI2SFVQ?=
 =?utf-8?B?bjlyMGtiZkZBR1FJcTB0dVJlY2oxSWpDcmVLWjE4ZnhqV1lUeTFjd3JLaXND?=
 =?utf-8?B?S1gzUWxOVFBNc2ZXYkh0eFU5Y3hOWUdMSXZoQS93bkRHR2t4R0FoSXJZZmQx?=
 =?utf-8?B?ZUZNbjJHc1dJa3VyYzBtWVdnc1gzYTVGK3E0eWFPc0tjZEpVUFFlQjNlUjh5?=
 =?utf-8?B?OGxna1RzampLdWZQR3ZZR2s0TmY4d3krL3FubHQra01GN2ZGeUY2Wi91Z1BQ?=
 =?utf-8?B?cTFJa3BxZnBnR0ZVYmczSWc1T1RpVWgxOGRGNDZ5VTVnQ2IwQzRwMWw1QzJU?=
 =?utf-8?B?WEN3WEVxbHJuMDAweXZySTNJQlExVFFMTDhNTkVaUENqSG1VYk5FV0VmS1dZ?=
 =?utf-8?B?dTJhM1h1QkdNUmZjZ1d6elR2RlZpcjhNQ3JJMEJ4K2hPRDY4a3A5aFVEV1VS?=
 =?utf-8?B?VWVyNnRjdi9JZ2ZtTlY4UHc5WWxGZlUvb01OYXFuMnJBSkUzS3BialR5T1lQ?=
 =?utf-8?B?YWJMMWJnMUcwN1ZDclBVQWxpZzZ2Vm5qQzBGVGJNTzN5S0xzZndZZm5nUDND?=
 =?utf-8?B?YlBlNFRNcmVxOXo4ZHd5TndwMUwybkNlaldIa0RvYUZqNGRVVUZibkpYTFVG?=
 =?utf-8?Q?pKVAPHj09hA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3ZmL2RSNFNOOHROYVVYQlpqcWpjYndaNm42OHB1Z2hOUkZLdStZVzh4aUFQ?=
 =?utf-8?B?SDNzcm45VklNUGs0clhCb0ZOMVg5eWpmYzFyMzlpcEdGM0Yrd3lScFc3dTBi?=
 =?utf-8?B?NVE2OXN4MHFURGV4bW4rNEJGOEhJUHFpSWhEb2xqZ0htMmk0dEJWU3l5SVFF?=
 =?utf-8?B?cTI0NWFVeU0rNW5Cdit3U2owZFpLbFNTZUVmOXI4WDl4cEdnZUk5Yk04QlhK?=
 =?utf-8?B?bXdCWFMra0MwQkpYbkcxWTZ6TnNZZUhzTnY3YzA4Q0NNNDBnTTg3dmZDWDBj?=
 =?utf-8?B?LzVQVG5YcCt4b3dpVVdoRExKdjJKaUNvUENPVGhjZ05MN1pGeHllcDNZc1VO?=
 =?utf-8?B?a2dCcFd0dXRiYk5FTEQrZUdjQnZPUUo0RXBZV0p4cUFXSG9qU2EycFdYZksw?=
 =?utf-8?B?elIxWXpCSUVWczcxaDI0RmhKNUkwTjRQWDNYNjVRdFB0WnE3SlliTmlTbVh6?=
 =?utf-8?B?RGlyMTZUOXd5ZGhkOGdrUUdtUTJFNFRJR0hQdWhlNytEVzR5dFpUZ0dnVXBx?=
 =?utf-8?B?NXZCQTJXa3BwdzRUL1dob1pCSTAxMmk4RGVzVEpDSkRJODBQVkthcXJoT1Jk?=
 =?utf-8?B?Rk52RWRpMDh6MnRwYXdXcWx4RVUrQmZuV2tMRUc2WjhZRHpCWDBrN0ZyY2dn?=
 =?utf-8?B?UnI1RUFoVVk0TEdMNDJWTWJIT2dWbjRMcTJhamNVbC9vUGJoWkhWd3JLZE5n?=
 =?utf-8?B?MjRSbEdRd25zcEY0RGRKRmdhcmg2bWNEVVhJWnRveUdDc2dhdkZhZkNwSVlC?=
 =?utf-8?B?RmpyQzZoaTdUTFNpcjBJSDVQSmpocUNnc1MzazBrZmtXYXEyenRrb1hOMFR5?=
 =?utf-8?B?ZnBZNWFSQXVTTWRMRjdBZzhsV25JdmJIZ1ZLNmFxNDZNa0tBbm1FNk4rZU8y?=
 =?utf-8?B?ckNQeFJzd1VaVHc0ZVV6T1RSZFBYNFdkVnFYZW5CZ013MitxbWRNY2hEdHE0?=
 =?utf-8?B?WmREZFFHU3ZwbGFQVlFBa0p6R1lleW5ndXlXaVlKMmx0SHB6dVBrOXJyTWdM?=
 =?utf-8?B?UUZMSlVhQURGcG45R2hYNzJ6Ym14N2w0OEZNRWdaQW1NU2EzWEtVbzFWc1hw?=
 =?utf-8?B?TVFkLzFTdlBvRVk2elg2ZnpSNDl1YmhVZGFWL0xxN2ZmZ3JqUnBkNHZlYnph?=
 =?utf-8?B?ekVZUkFCeXllSjk0NDlZUGFRY1A3Q3dONzNFSHU2VW5nYUR4a2xrK2VyM093?=
 =?utf-8?B?ZHJHVU9jUUhibWlEZVNnaG00V0ZKUHpkcGt4OGwwc3VPZ2k4R25QWTdrMnlH?=
 =?utf-8?B?UVFrZ0tRU3VUTnB2VDl6VVp5dzhXL0RWdXZQRjdTT3JRVXhMc1gvQzN5M1ll?=
 =?utf-8?B?Q2E2d3ZzSmhHQ0xhQ0lzcXFtY3d1OGxJRVBHYjlRTWNkd1RtRGxoa3FFTWt4?=
 =?utf-8?B?THNCRWtsR1FVWEZsOTQ1Um9JTjE0d1Q2YVhtWGhKeHRkbXdMV1NmUDlUV3Nw?=
 =?utf-8?B?cS9qczdrenRtaWVBNEZXdW5hMUNLMzlHK2FQN0txVW9DRWptM3R5R2trWUVw?=
 =?utf-8?B?NUJSUEZ3MmJrZjgrNGo4eG00VzZhd3h2NHNFckthVmNaaVEzVTY0d3QycGhq?=
 =?utf-8?B?aHh2aUxwUm9ML0pSdHRzcUIrYmN3bnVnbUUyNG10dldGNktrVHkycWJWVUxy?=
 =?utf-8?B?ZGdZZGQ4VnJMNEovVDFJWTBGVXhPS1hGMmdBT2g1Z0xsSFdkMnptRFZOM2JN?=
 =?utf-8?B?clFESkdZN2VZdGxYM3BPcXJsaStEUm53Tk9zZERnejloSThLYTBLSDlXeGRU?=
 =?utf-8?B?dFBNMlVJMU8yekpBY0pqSVovWDVINXFTN3VpcEdlLzZpeWdwbHBBK0thUWV4?=
 =?utf-8?B?SEpnaWVORTEwY2RRL3ZIbS9EMUlXeW4zMVRtejdxWGk0Yk9YaC9ZT3c3SUNZ?=
 =?utf-8?B?TFVwMFlDV2xBOWU5aWtoSndVMTUwK0NjYjF4ODRaVjBGM0ZTZWpxV0pMdURQ?=
 =?utf-8?B?djVkeElibWw2Ukl4UE80SHhzQkcyUXI2S1NaTDFXNTJxYnBXcHFtSzFGSnJI?=
 =?utf-8?B?SkJxN3RFZkxLbEtZd1Z3QzlleHRwR1BGenhKQjdLTk9yS0pwSXV5ZUF4V2M4?=
 =?utf-8?B?dGs3dHcxSkJzVEZJNDlDbm9lclZzRlNmOEhYay9Cb0VKZEhXRmdnRWsvU1dL?=
 =?utf-8?B?RTFjaG0zc29FVnZweFlDd0RnUmptU1Zjb3ZSRVVESlovVFFwenJYWkw2QmRj?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c41b321-4ddf-4928-0c60-08dd793a8b87
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 20:50:51.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/wrLOYGgAOwdyXsMYS2tPWUgD745km7Z7+yuph9XuQ2mQ/TeCJ9NoMRZKSTIhjMp2/Km1DIGjpiSi8cdyBORGp1Gb2HzuNMKqZDxJlKVeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> The event configuration is domain specific and initialized during domain
> initialization. The values are stored in struct rdt_hw_mon_domain.
> 
> It is not required to read the configuration register every time user asks
> for it. Use the value stored in struct rdt_hw_mon_domain instead.

Storing and maintaining the event configuration creates confusion with
the new event configurations introduced in the rest of this series. I
think that it will be simpler to keep BMEC support as-is.

Reinette


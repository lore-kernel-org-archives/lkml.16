Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304880B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743486424; cv=fail; b=nPG00dokT2roCXFumhEUG33KNZPS1e8p5xtrVuGEqm2EUh0Z2CnxUiOTflGPXqd29LMl8Kvpz5au+BooqDpZoGR3ARyp3xK2fIfIGjeSlzDEc/bMQSEpzkjPW53JTjTbu40cWi+xXjdh+0l98W7UoMT7Z2JI0kGCoTptRe8B3G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743486424; c=relaxed/simple;
	bh=xXH4dIHjtEm6/bFhgpZIGq9McIPfq/KWq8ZtMTr2ACQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mqFGDRVh4a/TBgFeorCB+BMWaO6tmxm8zesNESeQ35zYE/OM8CKLTHAy7x3Mpa70iUfKTO8IjXgvymowW4sM9BiuUyDfuPkdRvQwlzVBMrNPyihLtJ4/1mVCzk8UPkFwcHltYx6XOwhuhGw3Nr8IrgQyZi+aF1AqilcYsr+MTw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLZZvizd; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLZZvizd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743486422; x=1775022422;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xXH4dIHjtEm6/bFhgpZIGq9McIPfq/KWq8ZtMTr2ACQ=;
  b=XLZZvizd+hT9y2gijp2C/7qD4eV8M/H6898NoRsVcInqKHcHlG2EoD2x
   RZVXJLUmLixItTBxiXWTPzvtsbiy8GvHywVDtt5W2CLi3B1VgLKqG7ZKC
   VoxVf71iBd6+hdPO6U3G1/35nnLoTA02r0K4uWURFrkmLzcASD0VvMW4b
   XzwB4KcqwTCj72zE1dL7559c+uuWyM0kESK7KuJqEyEeeFRAwfk1ffu8b
   XEaeIFytP2oG8O/+AcXMgr4GrOlbNOCMp2zRipXGzARGMbu5yBywHjEDT
   o85566nLErXEv0vkspi74Zk+WUe1FkOP3XsJR5MdJO6zdoYd7xW59AJ3w
   A==;
X-CSE-ConnectionGUID: maHa17/CQYuoVs84R94EFA==
X-CSE-MsgGUID: zxlDFmADQeaBkO3hdCAemQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="70152566"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="70152566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 22:47:01 -0700
X-CSE-ConnectionGUID: ROAHs1dUScuQIr7bE5qymQ==
X-CSE-MsgGUID: yPZim0zwRb6vn1B8Ye8zjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="127089152"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 22:47:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 22:47:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:47:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:47:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnr6Z3MhD8YG8/t/yMpQ+ANqr7/eTuT5xJImfVvvb1/VTctyRvPmJ5gourhUju+ELtsGwkatgBsyg78Yd04rGmSRfxc0FgOszrDG3lVOXJAqgyAlXS/IAfTcSG/IzFj0KIPbCTBHap8IyHt+7nrP0m57z9FojO+5XclHKLoDBWNyiiLfeq/XLeYEMGvhBpHdipBOkeq6/KmzOArDjPQXsnT2eYcB2/x82R1IKlsauOvAwvNhv1PWFHFen5t9L5b/xVNOFBC9j7aD7ovIT3zf7egtqpIyxi16Buv9cl0PaJPCNnVeSjMToQ/F56JXVCWp0JNVcBVBtjLASnN6ipUvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INciTJeHawY8X285NRtNcet6jhDVxZYqXqG/3nmcP94=;
 b=p8gvnmKRwsW0v3sh+5PkafKVNBRermV+kB8QQEC1o/tZbrFdZW0IhfqdmeB8f5v6A1RGUaGSyZmxJh1ylzapmjmkauDQZOeTG7DXFfP6BUedhtLGNwG1c3GmO9LzyeeZ/tF96UpKvhIDCTRhtBtpGRwqO78ogshpuSTYz5ytlBH7lfaM+zspqb9Z3HPSMgOGZIuoFniwWkvemKf0kKKXcZwz5ltLKJFZCJwF4XTILlbF7Kq6//UyqolMuMISJs7XUv2499xX+l77T41dLRhYq9aIttHNZXBg8vE6KyO/rzIBoZE58vM1lj2VSeYoM5nz/cNLpluoz+/RV6T/s3IiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 05:46:57 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 05:46:57 +0000
Message-ID: <6e9bf509-ebf5-4703-bab6-fb9770f975d1@intel.com>
Date: Mon, 31 Mar 2025 22:46:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Content-Language: en-US
To: "Huang, Kai" <kai.huang@intel.com>, "mingo@redhat.com" <mingo@redhat.com>
CC: "x86@kernel.org" <x86@kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com"
	<xin@zytor.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "Luck, Tony"
	<tony.luck@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-3-sohil.mehta@intel.com>
 <5a9949a785e25dd3fa5a258917fabe3a610f4110.camel@intel.com>
 <57f5abc9-9e3f-4053-8c5d-2d6366d669af@intel.com>
 <5e7d99d019c8c6c8c137018bec6ae59b512b9dfb.camel@intel.com>
 <d6f148e4-085d-4bd6-b0a8-394149d8aeef@intel.com>
 <dcd22645ee5e5fcbbdb03ead0c6c68e4c09923df.camel@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <dcd22645ee5e5fcbbdb03ead0c6c68e4c09923df.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0366.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::11) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|MW5PR11MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e42b3f-49e8-4dbc-a350-08dd70e09d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmlITVhYSnZSUUZHcHQvZGRYVDNBZm5IWG9wRFVZNExYeUwvMEhVd1FobkdI?=
 =?utf-8?B?Vzh3U2g4cFZjTkI3c1F5UDB6RWsvYW02SGkvQzRlb0lGY0NrRU53RzN2S3E2?=
 =?utf-8?B?cHNzMnZmWnhPR0NoZ1FzUFM3aFYrRHZCZHdEeCtINEhxbHZQbHhsMDh0R2tZ?=
 =?utf-8?B?bDlaQW5HbUkxc05uSWlsTmZZNWRpK1JiSGJKNWRYc3ZiekdrNVBsbFZYN0hC?=
 =?utf-8?B?VDlzNnNSOHBPSmszK2s1eG5Ib2x1eDRjOVRsL1dtL0t6U01LZVNDSG50c25o?=
 =?utf-8?B?WU13UDlzSXNpVS9TN0pDdXdObWxEUTEwaVlqenA1QXRzeFZ2QUxHTFNrNzIr?=
 =?utf-8?B?Slh2ODVGbVltbGZhc1JuejhlaW1ic1hxNWFTVFpBQzJ0dm4vV1NtWXlQTjVy?=
 =?utf-8?B?Q1RVdWNDbmRkVVRQd3c5d0tpRmZML3ZabzBsamR1a2xocUF2Qm5LNWRIWldE?=
 =?utf-8?B?MGZTdkZ4UWxPK0VWQTNZUmtmQi9DUnk3cjFFN1FYVTR2bWFuVEQ2amk4bHEv?=
 =?utf-8?B?N3R6MlAwcFNydDNaaUVyYzR0T1FXa2pORGppVUkzbDJUOTZRZFhrbDFLSnEy?=
 =?utf-8?B?Q2Z2ZkdNMThzT0tpUXFDSTBYYzlyR3IyYUxaVk9Jb0VoRGlRNWhxTHBHa1ZE?=
 =?utf-8?B?YTk0RzRmTG4zc1lQQk9yYnlYRHNyMnRUdnp6UWh0QTF2NUxjWkpDOHhBZXZR?=
 =?utf-8?B?WjJtbnBPVWJkRnpncUJTWXJCOEpFRlR0b2svR2g0VjJtNUxrMXIyV3QwU1ow?=
 =?utf-8?B?Tk14cnkrOThKelhrd0Nvd2Vyd3I0Sis3VG1oWE5JRDVlaSsvZ09YdDdtbUp4?=
 =?utf-8?B?KzhuYUYvM1BEcWRMWDdPZVVxU2k2V1lJMkJBd0t2YmdhRndydGIwbHQrUDRL?=
 =?utf-8?B?MW5kR2EvaFRZU1dEeUc0dWhncklkbE5pb2YyeWx3Q2x1dmZMNzRzUzNZQUxr?=
 =?utf-8?B?VDJEdkV0cU9KZzFXL3NubFJRR0NHM0l3dUwxaW9jdjlPWHFwQXZob0pKL2ps?=
 =?utf-8?B?VENscXN0NExlSG90cWpPSEtyejJrL2I0NkMzM05vaXRtQ2tYL3VlRXNlS0Vz?=
 =?utf-8?B?UGJZenZwNHl4TURlTG5yQnYxOWVZeWdnYXBLSFVpeHV3YklpVFMxenVwUFI2?=
 =?utf-8?B?Slg5SWd2OE5IZ1ZZM2lPRFhQQTlWUUFvaUIvbTdteXJSWTBOVHp1c1NjM0M5?=
 =?utf-8?B?MzJ6Mkk5c012VGlabFdQSys5WnlhRitrYlBSenJ2R2FWaVJieGFGVHU0VnBi?=
 =?utf-8?B?MnFrUG82ZGpWd0xNME5ibW14Y0YrbUZsMXhVT1pBdE1YY0daYlg2VGNjdVA1?=
 =?utf-8?B?VkFscG82WUE0SVdOZ2FGMUpUV21NRFU1M2plMVVaSE93d0tEbE9rUWlKQmdF?=
 =?utf-8?B?NlRibmVOSm0yak1nQnRTOEJ6Z1RHM0FuZm9KaUREdjYwQmt3YVk4Tk9oTzE3?=
 =?utf-8?B?ZjlxT1BKQ1FycG03cnpQdFQzTzB4WlpSMTNjNXQwNGhKMVB1aXFLMFRzbjVn?=
 =?utf-8?B?RmFFUEM3dnZFcm9GTVNhSzZLZU1OYXdiNW85WWN0WVpQekpkbFVGakhwU3Nw?=
 =?utf-8?B?UEUvZGIrRC9WZmdOWGxrQWNrU1FoT0NGWnhmOHJhSHM2QmFobXlmUXJZYWcw?=
 =?utf-8?B?M3ZhNEFnd2hVZy84dklML2czSXBDZmd2TG1wMSsyM3RVL2p6Q0VtaVR5UzRp?=
 =?utf-8?B?b2QxY1hYUjVnOVI1eGkzUEFzVUQzWXpiQjV0ZTRGenFWdkxDNWpnWFJObnRP?=
 =?utf-8?B?eXRnTUhxVHRtc3padktPVGkyZVE2UkZ1eVJ5aG9XQ1NPNGx1V0RIZzlqTlh0?=
 =?utf-8?B?cUUwa0psNkJmZHZsSWhhMTB2cjBzZ1ZpdHZ0OWNaT1cxczQrcTJsS2x4REpt?=
 =?utf-8?B?R0tBUDFqaHVqOTh1bFhaYkFxbmtpckF1eHJEVXdYK0lVT3VQbHUzSVJGaWNI?=
 =?utf-8?Q?f5seU5Ikdvc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnVoVVQ3T1hjbFlLRG1wQUFzUjlNcnN4czlpTTkyOFNJbXBEVTZxZnNiWmMy?=
 =?utf-8?B?VEY0WE1zUjNjWi83enNKQmpKWGxmWUk4elRWc1F1NmlvWXQ5TXp2Z01aVnBQ?=
 =?utf-8?B?REt4YWxBMnZPdkszVmRPU2NnbVIyU0t2VWpwd2VENGFQd3Q3MWMxNlpjZjJ4?=
 =?utf-8?B?RGRraDc0TzAvRDV6UEREb2VXT1ZTOGw1V2xlWUViRURteC9Hc2JSd2J1UFJp?=
 =?utf-8?B?QnRIaE1vM2ZlcDZTaHZZOUNGcEovam5iVHdpelNCbTR1Z3hGUUFPT21tblE5?=
 =?utf-8?B?RXNGN0JSTytlRXlsc1lpSW5QV0RTT0IzL2VKRmlBSXcvMFJjRVp3Y3ovSUtU?=
 =?utf-8?B?cGZZRUl3eWlwditEdy84alpJV0NYNHVCUnUxT1l3ODlXZSs3MlhBZGx3bVd3?=
 =?utf-8?B?aUk2ZzJFd1VId01Yam5ORGlEV3ZTbHdNaXl3L3ZWcGE4VUZaVXYyR3VpYkNN?=
 =?utf-8?B?Z3NQSXpXZ2d6Zmw1V3lMRG50NnZ1dytxbnE1dW9RNU9nS3gvTXhiQms2Ky9X?=
 =?utf-8?B?SUw0RWcreVlBUi9keHRaYjkrU28xZFBMK0wwV1RvY1dlUXNkVVZyOVZKa3Yr?=
 =?utf-8?B?TmdXQk9OMlV1US91QzFUWmp6MjRvakE4cWRNWEEvWkFFNUhJQUFlcmNsWlpz?=
 =?utf-8?B?S1hwU3Y3dXo5L0pVcmF4NkhrSXQzam1OR1FCd2tqcXJHYmh6T0Z2Ny9nNGor?=
 =?utf-8?B?VmdrVWtuQlRzYTdsb3JYTVVETXJYSloxbEU3UGVzUjkrTTlsUEo2NW1uUVIx?=
 =?utf-8?B?VlNWRkxXODNxdkdlZlRtbWpnczRmYjJXT1R3eHNxODIvTlpCQVBja1VYTjNu?=
 =?utf-8?B?dGZlOTczOEpxZC9DWmVEV3BJRktjcENpWWhucEJXdU95R0RuN2RLRXRBNWJh?=
 =?utf-8?B?N0tUbk1mWmJ0c05pT016OTExWmdGZWhLZE14WVE1U3pjb1pRN0FvV0wvWHBk?=
 =?utf-8?B?a1laRG5LSkdIMUFzNlE4UWNYNHdwWU9hQTFWM1Z3dmNpb3NVbUV6bDdGam5t?=
 =?utf-8?B?bTFRZFpQSG56VU9ZOVV3eXhFbThCVzhrZlhtVitaUnFvYXhwVU4rNjBTSjkx?=
 =?utf-8?B?VCtNYW1McVcvZDZNaHlNTk12OEtodXhDK2oxTVRTQkJ5S0xOUkcwMFhqeUpk?=
 =?utf-8?B?VE8wNklwQVV3Z1FPMEo3aU1jdEZwaUhuOXgyS1pqSXc5MFNieXVodUxPZzNq?=
 =?utf-8?B?bkJNY0ZYNm81K1JnUm8vVjhBQ3F1MzRJWG9aeU1qbFgxTHh5RmdFVkJ5c3Vx?=
 =?utf-8?B?VjBTTiswZDlVbEw2cGVKR3lUSDFlVzZlcmVoRFlmbkhhVTYzTUNqamNuYjJa?=
 =?utf-8?B?RGV1MDUrTnJObkcxWm8ydFpEN1JjaVo5QlhoZ1NNbXFsS2hCaW1HQXJQUis5?=
 =?utf-8?B?Tm1WT3ZHVFNXL3R0THN2dGd2bWdjSGlUYTRqRWdrWVNwaTJQZVcrWUJqNUZj?=
 =?utf-8?B?MG56TVpGcytIVTRvK0lYQjdINkI4dFpPMjVxSXpXcWxkU05lVWNJLzRZRUta?=
 =?utf-8?B?MEsvZThDWkRLQUcvdy8vdXJhM1JuL3VzbHVvMHkyQnZYTGdSVUlVeUpuSTJh?=
 =?utf-8?B?TWg0Z3JINGs2UUVMSWEzOWNJV3hENFRjSDRURFNTU0trNTZ4STZjaGV2OVRs?=
 =?utf-8?B?SmxYYjBYajZxQ21zN2YxbXQvSTJ4QTBmNmc3L3RQTUNrbVZJWXF1ZEtmdW9M?=
 =?utf-8?B?TUZHWEJGb1FSbUtucldyUDNhaVdBQ1U1L2RLWTZzQXZSM1N4UVBMVGlTb1RY?=
 =?utf-8?B?QStpbnZhOURqTzhlZzdMMXlISmxJbndRNGtUSkxFeDVCSWNrRDlOaWs1VExo?=
 =?utf-8?B?MjB2dzduaGt4enIxZVNOQmM0anAvdjY4OVNoeExUczVtaVVBTkZiN2tSZytT?=
 =?utf-8?B?NUMwOC9MeHJQNGM3cWc0azBZK2J6RjRLWjh6ZlR1V25Da0RxOTUvaC92dCtU?=
 =?utf-8?B?aXNZMlJRNE9JL1YvMjFVdGVCME9ETWhuWmtqZWVMa0VrZGV0NXNJYVVkRHBx?=
 =?utf-8?B?ejMzR2h0dmFJZ21JamtqcWE1aDJUS2s1TksxTGVrSXpvSzBNUVpVSVdJNXFM?=
 =?utf-8?B?aEcxOWxvM3ZFQWw1R2hIdy9UWmRoZ2trMzFZanp1TGdmNjQxN01qSGExNDIz?=
 =?utf-8?Q?SszDGCUC9JrpTdz8wLOnsWpGC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e42b3f-49e8-4dbc-a350-08dd70e09d3c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:46:57.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ii+BLP/IhMNsM1XOH7D0FJGAp77omraVnFaK1Bs8afNajcSDCt36tbf5o/C8rsZ70/Gx0hhL6fkVRTNLLTRVDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
X-OriginatorOrg: intel.com

On 3/31/2025 6:06 PM, Huang, Kai wrote:

>>> Ah I didn't know this series was merged.  I think I'll stop looking at it.  :-)
>>
>> Your review comments have been useful. Please continue reviewing if you
>> can. You found an issue in patch 1 that both of us missed.
>>
> 
> I just did.  I didn't find anything apart from one thing that I _think_ it might
> be helpful to mention another commit in the changelog of patch 5 "x86/nmi: Fix
> comment in unknown NMI handling".
> 

Kai, I feel the additional commit is indirectly implied. I am inclined
to leave the changelog as-is unless you feel strongly about it.

Thank you for the reviews. Really appreciate it!

Ingo, there are 2 main changes from the patches in tip:x86/nmi.

1) As pointed out by Kai, there is a minor oversight in patch 1 on my
part. The header files aren't strictly ordered. There needs to be a
single line change to keep them alphabetically ordered.

2) As discussed in patch 7, the title for split-off patch is incorrect.

If you prefer, I can generate a new series based on the patches you have
in tip to save you the extra effort again. Or I can generate a single
additional patch on top if you want.

OTOH, feel free to make the changes yourself and include my signoffs.





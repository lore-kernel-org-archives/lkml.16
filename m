Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40C22257E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738877743; cv=fail; b=tCeeXOyBCS/NfVDj9ikJC53R+8Q67dsBdyLsdJHF9qZZeXyxzEsxhE/RLYRiJtLmlWwC3qnUk56VMw20Gk9lCriesY7uB8pi0VlN1DJDK0jr6CNe8Elen1ifev3pynaDE6FCSy5QYFRM8kK9FkG78lRYG44Hq8eVoWZ76jSxjuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738877743; c=relaxed/simple;
	bh=/H14utSIyYRNTd8n7ez61Hftqqp3oYwgd1cjr9OmMeA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SD+2xRpX1jE8URxaP7KUOxOe1IubKxjL7+aPjMUgxtg9dlRKYh0Rlf9xjf7RNwJBPo/wt136WC0JSe8jVTwCzlcJUqJATeb07frmQxNQQlUkqwm1gaJ3TX2PDftogqGq61BMQWWLHuETNsq9HGf5p6wfmv5lfeASXvjNiaahMko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mA2H+HkS; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mA2H+HkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738877742; x=1770413742;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/H14utSIyYRNTd8n7ez61Hftqqp3oYwgd1cjr9OmMeA=;
  b=mA2H+HkSROop26ygON53NxmiwpaaGf8ryxjA1Gg9Y8VgUAP3S3E/ctAN
   9d2zEJWdZ0E5lh1SeeJ5u4mKGRf00e6Ibs5D9XBFuRol8s1D9Fqnvbxtx
   SfBFNGbZ9Z6jEwxpQnhn1IMqkAjZXP6I+XebT0HUrQKHW6vVvDrhX6cPt
   fLuz/gvhoOeUkFoHpfBtKsRdKLhFPlPBPmdtJ5PKdcf+s24PudjH21L3I
   nOQ9DIYYZoRNfGNHewS5k4rgTU0pvJaFW4EFsEUtbnrLWnmAgggIZIk5v
   wgZIPM1QHCSN7zNCD1cq0wRo+rcmsQOKYl32Ne8SyzpJ7gCGj9qRa/BKy
   A==;
X-CSE-ConnectionGUID: 4MYB9DhJS4a13B/DUfL+Dg==
X-CSE-MsgGUID: bA5/m4bTTJC0OIUT+BsMsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50129254"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="50129254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 13:35:41 -0800
X-CSE-ConnectionGUID: lOh0UmsvSPWpkfAZb0zdAg==
X-CSE-MsgGUID: 6EZTqw0SQcWfvunvToznoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115425629"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 13:35:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 13:35:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 13:35:39 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 13:35:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wz8D5ktM49Dev5NJB1mkJO2VnSW2uJ3QEpxavo7xbikVjhePTRznJ/dviJLRWHsXuTs/smn4NRE8BWKZ0HWg7Fs+npRzPhVDROXbIHfYdx6ScLzGFjRe0zgYsbI49bdYS0tacFkjqjrS9rGMrtbIfYMf5UncyzxfoOQhkscbdIljReBXb6/+BrK3LeMGKLMBvb83MNzROSW/TIrk1D6lZjBCIoyJcXEopBTYxybgZ32b8lKzOZYjNNu2UWdPNPBSOZ++fnmI8JyG7ANgkoitPYywzfZefogCHpdm860lgx+gNuuqiVpR9ISZ9Jn/gFsHRfzL0gTypilmV+hhxVJS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqPhVd+Gu1RyTwyMOAfznWQhL+Ft8JlE7O7K1tNNPpE=;
 b=TsvHzpBwPLMfgLw2cCqWvVb4OYM8w8uecXXyea5ienlXE+b0ctKi8rPztUeiQXH8nhOLKNzwAwo+MLuKHFTXDjF/LjycqNkgZKgx/RWXKmVAQZWVbiLQbkYqNuG+fgrjYEpg0OpJf69LQzE3isz0iDxXaFhxDQWokpBH/iJIeeZsPu4tE98vWmBD9dcO1SOp6GG6WQ/g2jotlZ5ka/zETRHMyEO03lmGxR3LimS1DRH8r82F5bosKZYqzADajd3RHdqMecHJcydH/43+o+7BjpedH1RSjA4kGtjB2ibEBs1b5uGOrJj3t3lsHxe8Yu+7G1tgN0noDYAcnTZ5yHDx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 21:35:22 +0000
Received: from BL3PR11MB6435.namprd11.prod.outlook.com
 ([fe80::23a7:1661:19d4:c1ab]) by BL3PR11MB6435.namprd11.prod.outlook.com
 ([fe80::23a7:1661:19d4:c1ab%7]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 21:35:22 +0000
Message-ID: <61e3cc7a-af79-48e4-acb6-8ac7c8d2552c@intel.com>
Date: Thu, 6 Feb 2025 13:35:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/33] ice: Fix a locking bug in an error path
To: Bart Van Assche <bvanassche@acm.org>, Peter Zijlstra
	<peterz@infradead.org>, "Dave.Ertman@intel.com" <Dave.Ertman@intel.com>
CC: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor
	<nathan@kernel.org>, Kees Cook <kees@kernel.org>, Jann Horn
	<jannh@google.com>, <linux-kernel@vger.kernel.org>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-16-bvanassche@acm.org>
Content-Language: en-US
From: Tony Nguyen <anthony.l.nguyen@intel.com>
In-Reply-To: <20250206175114.1974171-16-bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0040.namprd17.prod.outlook.com
 (2603:10b6:a03:167::17) To BL3PR11MB6435.namprd11.prod.outlook.com
 (2603:10b6:208:3bb::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6435:EE_|SJ0PR11MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ab882b-e05a-4427-fdd1-08dd46f62942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXR3eVdzSEkxZXdYdWJ6ZFFCZGttL1hZZzRualFIUXc1TitGc2xxWEFLVmpI?=
 =?utf-8?B?enA1SlQzVEhCTEIzdTNueXlHME4rYlhDalJZRS9BWEwwMTQzbXRBSnR3b3k5?=
 =?utf-8?B?T0ZuUFV4WkxVbHQxVWdGYi9EVGFqQlBlQnY1V1ptcFNXNndJVE45elAyaTBL?=
 =?utf-8?B?V2NYWFkwYXRmZTltbkZaUW4xNlFhSWVmM2JGMFBNQzhsVHg0UzZGU3Q5dko1?=
 =?utf-8?B?MHd3ZmNiaDNuVTY5R0F3NkVVVFpsZm13WmR5d1o2eWY1Qk4rblVVOVJES1Bi?=
 =?utf-8?B?NkxxYmlkcEJUM1BNK1kwaUxjWEoxU09LRkdvNXZnLzBwaHUyUmdHQjJjdWVX?=
 =?utf-8?B?RFJ1YTM2WWZqU3BjVW4xZmZVM2ZlSlYyVnliTldydGpzM1dYZWFHTk1kN1lm?=
 =?utf-8?B?OTgvanMyOXVIaFpIWkMraTFWcVZiZkIzaGRXTE16TUtlc3MrTHFvNW1OYlFD?=
 =?utf-8?B?VTB2b0JnTlEvY1dlRmluOE53WEQ2Rkdkd2E0ZFZQdTVEdFFZREtiSnd3Q0l4?=
 =?utf-8?B?OFMrZ3RWbGlSNW9XZDRUaFJhT2x0NHhqWk41MHBEQW40ZjVSaW9NWERwblhj?=
 =?utf-8?B?R3o3NjBBVXMydHVlRmd6ZFRlOEFOajUxaWcrME1wUnBQZWRGdWtHYUg0eWlS?=
 =?utf-8?B?MTNKRVhEbFlTL252MnhkT1VkYjZRdzBwdXV5SGFsOHZBVmplMVJKaEovOGY4?=
 =?utf-8?B?TjJIbWQvc2M4MCsrMnlQeHhsUlVqcm5hSkJXMCtUOGFha25lREQ3TG5PUS9C?=
 =?utf-8?B?amxpdEFBZDJjampMeVhBQTc1NDQ1cC96djhSbWZKRTlJNFNHVGR6bCt3YWkr?=
 =?utf-8?B?OWM5c1g4TkcrVnlNUEpCOHlpTDVvcWdaTVVCdlNkT3dWdloyMFpIWmlWTmtN?=
 =?utf-8?B?UU5sdE1sSXFRSG5PQmV0QUhQdGwxcWFTTU1HYjVaamh3ckNvc0d2RThqenBk?=
 =?utf-8?B?V1BMeVZiTFhtKzFsMzVaamMyWjZ3MllzbXcydzhDbjRvVDZKWnZraUhpcDAx?=
 =?utf-8?B?bEJIN29KL1NiWlJET0E0Q1ZhOTl2Z2RhV05xRUZKZm9xZ1ZUTENDVnJUQjlQ?=
 =?utf-8?B?U3dvVE05clA5SmNJVWlOUTdEWk9XUFZuY0JTWEJZS3J5RWtQTUZ5NUF0TzUy?=
 =?utf-8?B?VHV5VWFXZEZwTUw2dnRrV211dlQyaWNHRnY3OFJYTUNRWDZpam5CczNoR1ZI?=
 =?utf-8?B?L0EzMFhHZU50VFJNYncxVE9XbHlFaS8vSUwvMmQzWDNTMzFXNjdhZllXZFFI?=
 =?utf-8?B?WjRDTzBiT1E3RTJlUWVOSEFtZVJYVUhoek8yODNvUG9jNzgvdllKRExZVEdQ?=
 =?utf-8?B?eXdEMi9FQzFycjdLQkp2VXdEc1FWRVlJN3I5dm5aV1JzdnYvZzlLVmpNVFFP?=
 =?utf-8?B?K1hXbmhlWHZZZUl3MWxxNWJxWjBIMUxmelVIakpGSFZXaGJFM2hSa0NpcmZw?=
 =?utf-8?B?WTh2SjVDQmZaOTd5cWE2VnN2OEZqeURBcEtsUVNtRms3akh3a05JMTZmUzJG?=
 =?utf-8?B?SEswZzZHb2tqS3QzNndYclh5dzZZckhYbE5vaGNqS1dwWXB3VTdLUEtneHd5?=
 =?utf-8?B?WVJocWFQbElsbGxhOGxFd2NTYmZzUmk5N3JtaHo1U1FUck9GYmVDTjVRYW54?=
 =?utf-8?B?a3VvUFBGL2JlbmpxSGxnZkxnYm5jVUl6YTFyLzNBb2QxUUdnd3JHOUJQSnUw?=
 =?utf-8?B?RHlZQVQyNHNtczZuRGwwTkZhcWkwTDhLZzJ6RUJjMHhGbUtubUN3M0hqSE9l?=
 =?utf-8?B?Y1VOZ3kweU5zRjRJRlMzQ0ZUKzI2Sk1GaGlLTkFpWTNRUTZqYS9aeS9Tb1hW?=
 =?utf-8?B?Znl6NTMrbzRUTTJTYzBFU3dpejZYcWE1NVl6VWdUUlBrRGpWMlF1Y0hLOEVT?=
 =?utf-8?Q?N3l9gc/EEe64S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6435.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0ZhbUxwelp1KzkvRkxablFSZTZwM2V0YzdlRWhIZi9YWDVKRHEvMm5Pa3M1?=
 =?utf-8?B?YTRvTDYwVWtLR1VpNVE3RTVuVnE2eHphRElZdWVLRG1IZTEzVjh2bWV3b2M4?=
 =?utf-8?B?RXVtSEg5QUtrdjVUWDhOaUdQd3JBdUx4ZWJlaGMxMjlFY2dPeUdYV2hCZ1JM?=
 =?utf-8?B?WURDU2RBTUVBSDVXVVkrMzVtVmFYclo0RmsrNjZkOTRvb2JwUncyN3hMU3Zp?=
 =?utf-8?B?eFZyLzZ2cHZhOUYydE96Q3FEdFp1YXdYUDRlT3lDVm5xUldwLzU5L2ZlN0ln?=
 =?utf-8?B?enVhdHhDNUxncUlHaytraTM1Qzk5WWlxMnZFcXU0YnUzY2tSSzB3ZkFEYVVJ?=
 =?utf-8?B?VXBvU3JIN0VndWFZOEhEY3Jud1lRYUJQRnhTOFhMNXdRanJXZXYrOUMzZDRT?=
 =?utf-8?B?R3BFaEY4NHV4WStLMGlSbDRRQ250ZldvQjZSTUVMSlZLVFBUZ0kxekpuSU1E?=
 =?utf-8?B?Q2dJTjFZQUhiM1dLT1hFb1dyRk1kaGN1QmoxNDRQd21maUFJQVphM1RBMTBU?=
 =?utf-8?B?UG9hb2VubG1Dc2JTb3B6c3hqYnRTUFJ2cXJWYjczVUszbU0rVitIV3J4VFdy?=
 =?utf-8?B?UlNoalVHRmxqM1JXenE5dndUZWhRSUlRUU5PU2V0U0ZtVmJwWE1lQzFDZmlQ?=
 =?utf-8?B?ZnRhNjN4bUg1aEY5UjNvWGx6akJhTnZGa2VHZ0NLVml2ZEo4SFhXZmpUeFhr?=
 =?utf-8?B?TnQxRDkreXBKdTFSbHFRUkFzR0gxYWM3M3h3aGJLOEhabWx0T1MweFVlY1RI?=
 =?utf-8?B?S1hoT0xTMUtFaHZLMVM2VEdsQjBCNWxQS1dBbTVobE1jaDg1eGt3b2YzN2xJ?=
 =?utf-8?B?TDNQZDZydnlQZHlTbXREdVpHbnd2R0Y0d3duY2Y2ZTBLVkRic2pXQm96NTVx?=
 =?utf-8?B?R3I0Rm9PU3dBa3hMMnlrR3BpbUc0SDNkK0M2dW84bGtFUmgxamRxQ05Lek1R?=
 =?utf-8?B?UUdzOHJsRjcrVFZCdWZLY0hUbElOSlZkQnNHMHBhRm9NUkNZcS9ORXhZRDFu?=
 =?utf-8?B?dDJzczVERVI4YWdSZW9oakQwbEVwODU3ZUVzMkhqNmlEYzBPeWFJSjBTZ2hx?=
 =?utf-8?B?SCtVOC93R0dEb3pqT2NwbU9MZkM3dUd6dGc3anE0Z0QzVkpDaS91d2RDSlRS?=
 =?utf-8?B?blU3ZXRUSU51Unl1Q2owTzZJNSsvS1Z1MU5TWTlFT0tpNDJVTE9KT2lBaWdm?=
 =?utf-8?B?Rm9rTm05YXRRMFVXV3BHZ0w1dHdOazN5SzlsdlFLMWFicDBtenNGMDE3blNz?=
 =?utf-8?B?NjU3UDZhaTVvTjYzMnRDQXR1bENnK1MyTzZaTjRQOENuZDJjRWVkVjdyVnZZ?=
 =?utf-8?B?YlZ6WlRtWWdFZzJsK2toK2RaNHdmUys2TjhrelUyVEpNOU9uWWlnb3lTZnIv?=
 =?utf-8?B?NEJEYS9ZeFFOOTRJYjFRbExWMzVmZVJGRDFBK1VoWlBpUVhoSjRWWjFUaU5q?=
 =?utf-8?B?SEVkSjlqSVZ3VDVOd0MwQ0VPeWdwYXRRVUVXdmQyYzFOcGtqc0FUQWdRdm1o?=
 =?utf-8?B?SWZWNmNjN0RKaUFMb3U2VE1XYUs2Nlk5THA1WmdPODhjWkJoc01kemsxckNO?=
 =?utf-8?B?eUNvd1h3RzU4aFptemdudWF4ODVPaDhONXg5c2dYMkJTblJ0WnQycTZHb2xN?=
 =?utf-8?B?NmU3UWE1MmtTdFBSM2NCclc1ZmtYM0ViQlAyYVdEdVJhOHFpZEV3cExWOUJo?=
 =?utf-8?B?R3VETXc0K1R5RlBFalBNMk1qVkJLRUo3eGszQVBWbFZtclNJcldsM3pzRE5l?=
 =?utf-8?B?d3ZnTHVsbjA0YXE4aHZZZGlPdzJmNlFzS0xPcmlyRUhMK0dveDQzTFdVN0Jn?=
 =?utf-8?B?dnlyK1kzLzRCN0FwQWUrUmF3bEFkU292cmRrdUh4WDVDSVkwaEh5VTFhN2Qz?=
 =?utf-8?B?anM1WXdFNFd2TUFPMnFXV3Y3Ym5ER21GcXRIWjlROTNkK1o0WDU5RTRGUlNU?=
 =?utf-8?B?aXFGdWlQc0RDQXpCNzd3akFMcERDMG1JRnZJR2ZUbVkremVMZUxrN0JuNVBw?=
 =?utf-8?B?cElvNFVJRytWWVpLQ0NGSWhBdkFZTjV4MjVTczlXMGdnQkN1VS9MVGJsQWRU?=
 =?utf-8?B?RnlNUUpGcUpxSzZuOTVMSWtST0FtUVJWM0E5b1crSU5NU3dYMVhzZDI3RFR3?=
 =?utf-8?B?YUsya0pNY3I4aWdSODRoWi9xSy9rWG5WeGp0QVcrZE93VmZlN3YrZ0d1RURU?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ab882b-e05a-4427-fdd1-08dd46f62942
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 21:35:22.6582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePen2Y2Shfqv/YJfvuiM5VmiMOi5sxq39U4OELbXAAlNad2d7qaqj0+bCpPNns/dLCPsF4CSXbxtlXSLwL+1ZgVc/eoB4SqSqMS6YA2v92g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
X-OriginatorOrg: intel.com



On 2/6/2025 9:50 AM, Bart Van Assche wrote:
> Do not unlock pf->tc_mutex if it has not been locked. Jumping to
> 'dcb_error' causes pf->tc_mutex to be unlocked. This bug has been detected
> by the Clang thread-safety analyzer.

Thanks for catching this Bart. I think it would be better to move the 
tc_mutex up to cover this call. Though unlikely, the DCB settings could 
change after this call so it would be better to protect this under the 
mutex. Also, as the error path is changing configuration, that should be 
done under this mutex as well.

Thanks,
Tony

> Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
> Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Fixes: 242b5e068b25 ("ice: Fix DCB rebuild after reset")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   drivers/net/ethernet/intel/ice/ice_dcb_lib.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
> index 69a4b84f935f..65545613e1e8 100644
> --- a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
> @@ -563,7 +563,8 @@ void ice_dcb_rebuild(struct ice_pf *pf)
>   	ret = ice_query_port_ets(pf->hw.port_info, &buf, sizeof(buf), NULL);
>   	if (ret) {
>   		dev_err(dev, "Query Port ETS failed\n");
> -		goto dcb_error;
> +		disable_dcb(pf);
> +		return;
>   	}
>   
>   	mutex_lock(&pf->tc_mutex);


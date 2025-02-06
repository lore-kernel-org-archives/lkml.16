Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13F23C366
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879355; cv=fail; b=HJ/fT3QyKAu8ZQnYq1pVSN5BtfWJ+jWEPgVdnlYPq3Fg5YmVStIEdvc//isFrK36wcUxX7A5493xZEgmkd27TPvmlNRSDOj83WnJIa8IotkyT9Jw3g4fmjVSp6nKE6b4+J2nVhevKsDjposM8teFH+QX1YSrO3Ev1oQWmoIiTYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879355; c=relaxed/simple;
	bh=vAaEHCNGKaUuFwiiZKAIUBEsdwDVTxmUDBPHSD9CQbI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TCpvhI1wtSjhoMgyEjU/RHHP/K9Qjk5ztwIcHNbeLpWdkjmgWNZS3G8gHAf5uingLc+uygMlrjG5c7OdHUBtlpbbyP3Q0dUJSv146n0OWAeJw4qaIdIE5Dx19luAc9NPTvkTDMoxjeVaVulQWWEcZpE3boAFMJofx6y70LK9Gt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYIB5XTL; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYIB5XTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738879354; x=1770415354;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vAaEHCNGKaUuFwiiZKAIUBEsdwDVTxmUDBPHSD9CQbI=;
  b=gYIB5XTLhC3ir+kh8kxqJaE3AIQfO24AigBR2mupk9F8eScjUH5hcPwT
   gHqZk8H5WeKmEEfSaV778um2je3eP/kL4cNkNtXQzSBB4BeWx/ziofUBe
   vQZWaLbHwfh5q6fz+ThJhQZ/Tgu1AjZQZ6O7/+dD0AfIxnBG5/CVOx/I1
   sM/9Gk/BMxY/pyZNqC+qZVg3UrDT6SqTZw600svjqT8LoXq57p7j6YvNa
   vUZtbJBxHqbI3d7O7MyU1t2z/58zQ+dAMwsttuOjBeK6HfzBmLL6hR6nA
   iDrIn4PCvAQal0JoDBFiwSTKczd408dqGQewTHQWvAWvVQeq7rRUMpj5/
   Q==;
X-CSE-ConnectionGUID: bN9Z3qGyRqen2aHUJZPcYQ==
X-CSE-MsgGUID: kzVYCp3VTzCjs8WCKJsI1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38707056"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="38707056"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 14:02:33 -0800
X-CSE-ConnectionGUID: 0dmWLxMNT5KuFjhDzLA2bQ==
X-CSE-MsgGUID: 6OihVZABT/mYAoHAOBeiFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111173382"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 14:02:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 14:02:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 14:02:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 14:01:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWvuoOeOEl+E6LNOyznq3/zlj4MagG/eqP1WzNnz1KW6Wy+tcTPTbm2zgaVeURQQS3ENNo6WgOOFf/TH/GYn+xSNwLpO4SEV+LMNHyT+Y4qPE44h9aQzXKabFgUIAq2flBWl1cIGgBrv1Sp9LMZrtmRjhjWT4smMRUwLAORdzVULato6sPIu7s/PYSQCGIy/nnBjf6iuw11bSXA9k+aq1OhFinoj8cBUXwK/XeajhMqI+wlXoDBgBR76PaSUXTDvOG7UYr7IO82FfbzFaNSoh56+EvKgXYtKacmCnLm9yHFxASffXXucf8idwwRkCh+cVvIgh7dpMVKtd+pCKWvEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EJh/HlDSkl58ES3D9cMHuM3tBNYQvE7ZJ7qhHgebKk=;
 b=NZmTB/TFq9fAlxiNbJDzbEZIZaSZUvp/6biLXbj6pBDRqY6UBKNOsR5K+otCuqM7k9bZr641VzaCFL+ikBeXGHrikW8H/5ugPdXv+LgCxGDVgbop2bOXuxFko3VYd/dOW18a1GZaWM/HzEEjoT4Gu96/vX0yC6xJ+qAQZIqz/BIZi0Zmq3zF8FfmG1gcu0mHdoEmMYoYuaKJ28Z+YKzoQctCmFZa1WTrayuPn/Dp0brMaJSL5iKOa/S27d5kLXBw7MutlLhVNSvRNFlIQvXQB97fGPg353nNqjz3tyJVg2p8K+9T7Mlo6nKkMMkujXokFWEKTvRPijuzjVzThZrfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 22:01:17 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%6]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 22:01:17 +0000
Message-ID: <46f0b4c5-5245-4774-bc3c-a73c86df7599@intel.com>
Date: Thu, 6 Feb 2025 23:01:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 14/33] ice: Split ice_dcb_rebuild()
To: Bart Van Assche <bvanassche@acm.org>
CC: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Marco Elver <elver@google.com>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Nathan Chancellor
	<nathan@kernel.org>, Kees Cook <kees@kernel.org>, Jann Horn
	<jannh@google.com>, <linux-kernel@vger.kernel.org>, Tony Nguyen
	<anthony.l.nguyen@intel.com>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-15-bvanassche@acm.org>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20250206175114.1974171-15-bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0179.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::19) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c09ef5-6024-45c8-8d5f-08dd46f9c7be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S05PZ1hTZlc2K3FXMTk2NlJiODd3MWRHbDhGOTd2MlI5NnRxdUlQRFQ5ZjA5?=
 =?utf-8?B?ZGdLeVVRREEyVDJ2REtjU0RwaFE5VXNvcndvUVU2TmFWUlNNSHF6UWRBemdp?=
 =?utf-8?B?YS8vQ3NyOVlLdGdmakljcTdYSm5zZUh3cVZNRW16NnNFSko2bkhoVHRBcmF0?=
 =?utf-8?B?SlhJMXI5VUNtbHVLb1g2ejQ3RS9HZGxhT2NBbUpYaVVqbTl4MUFycVJkczdr?=
 =?utf-8?B?MXpiQnNuNkt3bWpCUHlhdnJ1NGFrb2prQkdrZ3NFdTAzemN5RVA4bURiTHht?=
 =?utf-8?B?d0Nzd0hrdGJIUEtJZVYxL3hSNUJsWkVXblJqZFVDaFVaWll3NkpiRkNlei9j?=
 =?utf-8?B?OGxod3Y2aFVRSXllSW1TRldBNUZUVHpYakNNNnlJdTNxSDh1dTY3b1RMWmVx?=
 =?utf-8?B?VUFSaTBjZ0pKa1pZNDAyUTN6ZnQxMmZKVW16Qzk4SzlxYjc3Rm4xaGhyeFBr?=
 =?utf-8?B?UVFRR1V4QTNxdzE1VGpkM3dzR05rSElCTGp2YW52dGxQM3J5UERuZVJpd25U?=
 =?utf-8?B?MHM4SHNMa2VlUnVUak92cW9rVlRsRDNWNElhWTFYSkcwR2lNVlhYMDg0WnBj?=
 =?utf-8?B?eXphWDFzcDk5QUhMOW1xSjQ3TjRYYzVkVGlzaEtqemZvVlp2ZHA3QlUyUFlP?=
 =?utf-8?B?OG9JWnNUZDF4SStGNmJHT0wraFhFRUdHeStRV2VoY0xxak1vMWVLWGUrQTg3?=
 =?utf-8?B?NHZxMVE5Y3VPYXBLSW9ZeXNFV1FrdVc4ZWdDTE5mMXA2b2tnOXE3cDRFV0Z2?=
 =?utf-8?B?aFovTGxvK2NzTTRUK0NqVWRDSEszQVRUNzl5Q1VIRlI5SHEzZnFVQ1ltY0NW?=
 =?utf-8?B?aXJSVWV4VU82bUpvMWxuNUQxS3E2M1hSOHpSaHMrR3NJcmpUcXA0QVhuTVlq?=
 =?utf-8?B?dVFkdXNvY2NabjR1N3FzTWc1VnZlMHJMbnMvMUphZUdBeHZZcFYvT1ZrTlJo?=
 =?utf-8?B?bk13Y21ibFdjd2xtSE1VMC9ndnFyUE9TYmJMZWpYU3d0UFBBMGVKWER2VXRX?=
 =?utf-8?B?OE5ZZitoQytwbUlabXVPeDRmbzJGRHU2WGxQMFZreGRJRkd1MjZubUp2UWR6?=
 =?utf-8?B?dnVrd2w3VnViZlVDQmNjbHl5MkxIK0UrNE5Yd1ZhaXRFTVNrdzVhK243N1Uv?=
 =?utf-8?B?b3prcFZUYXhYTzd0b1I0cU5ENm1qVHB6VFdldTZYU0t2ejBXUWtFS0k1QTlY?=
 =?utf-8?B?aEdRcXVzQ2wrUXgzWVFWMEM4L09UZUo2cUVsQm54eDJYdUtwZlBMbWdwbFR6?=
 =?utf-8?B?Mjg1dnFKV3NyY09ZKzlNTDM3NldrSWl1SUFYc25sT2V0NlJWaW1sdkI0U0RU?=
 =?utf-8?B?OVlmKzZMbG4xUzhhcXY2aUE3T1FEY3FuQlVoVTMvZDZVSUJ6WG0wRG1LWXdN?=
 =?utf-8?B?NHRVZ0dBTm1pbnkwMWYwV3pPMlh3clNQZ3RiQlZ5eGlIQnI0Y05mL253cTVv?=
 =?utf-8?B?OTRUVk5ja3MxVFZCdHR3cis0Z2ptTDZkK05iRUV1YU43SG1VS2lBYi8xU0Vy?=
 =?utf-8?B?NHBKSW9CeDhYQktOd0VJbDRjSXdQTnFQODk1ZGhEbmphaWlRODlXRjNxZ2xZ?=
 =?utf-8?B?bWNJRlJ5aTE3Y1p5RHdaWUJwVGgvQ0o4eURoYnJHbFo5WHFpblFQeFZwUlR0?=
 =?utf-8?B?MEFSWStweUhac1BxZVBmS3pxd2VHbHg2UDhtcU9kaFJXM2g3Z2REbUlWN055?=
 =?utf-8?B?M2ZuZWxWMEErWHptZ1ZRSXhua2twSEVEL3RuY2dybFhXcno4RHJLcWt3ZVBH?=
 =?utf-8?B?RnhkaXFoMGo2SmVFUGFQWXN4N1lJWDFVdFYzVFVyYUVvTlo3YkI5bHR3Y0Zi?=
 =?utf-8?B?MzQrZzZ6M05QRDY4elpvWXFXNnF6WU9seFZwYzVqeiswNm1ibXR1K3ZsRDVx?=
 =?utf-8?Q?3e1YD+Ka2zx0a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR11MB8102.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZoN0VvbGhDQUhXUGNBQWxjYnhGeFVBckY1eVlKOWM0VEVxc1hOUG9zWVJR?=
 =?utf-8?B?eklKamJ1N0t1YmVDWTk3NmlQQ0tIa3FkNDZPU2RIcjdPSnRiOFk4ZmFQMCtY?=
 =?utf-8?B?a3djaE9kUlM3Qm9kemZScHdpcFJRTXpyeWs5bmEwbnYwa2NuRVdIRldtaWpF?=
 =?utf-8?B?VURLMURrN2pLeDRJdXI3WjJHY1ZsS3ova0VRV21TTmd4VGxIaFpCdzRxeHdj?=
 =?utf-8?B?WTQveHZlRjY2S3lmUmRVU0pydWROUStFd25vTWlieUh2ckZHK3R3djNuVG9P?=
 =?utf-8?B?UFVUL044MEFoMHl5UlowUGdzUnJXTEFpR2IrZCtTaDNWVko5WktvU1FrU2g5?=
 =?utf-8?B?aGF4QUx5YnI1OXNjNzUzZnVuYjNmZi85ektpdDY4Y1JsRFJ5WldPN2g4cWZT?=
 =?utf-8?B?T0M5cC9OMkxCOUNYVnNhQThlcTRudTRIV3hHSU9Pd0JhZlBvN1JsS3pFNFlE?=
 =?utf-8?B?ekZON0FXd2JZdmprazRmLzJuaDE4TU0rOVJwUUU5TkNyRWlBbHBDdVNFVzVl?=
 =?utf-8?B?MEZsRW9YVW5ydDRiMXU4blR5c3dxNGZ3MFRNQlViV3pLL3BzRENTMlp4R0VI?=
 =?utf-8?B?dUlacHh2VXo4b1FhSlJIQ09NOEsvdU9OSXlBc2ZrQUplUE1UU1dkcVp4VGJY?=
 =?utf-8?B?cWFncnhtaXdmV2NxNDhyYk9DS3ptUzZhY0t5aFd3MnZTeVlucEZXc1ZXSU55?=
 =?utf-8?B?ZUN1QjNwNlU2NTRidHRWNXVRdVRqV2xmdnZaeXo5eU5GQ1dSNWZFeTRxTjFD?=
 =?utf-8?B?amtvMmx2a285ekdSTEZXODlyUFR5Z1BnTFpsUXhRemQ1dHBTbk9KK1dsMHlH?=
 =?utf-8?B?SkU3VTZYL0NTWjdhVDRvcmNFR2FtRTQ1ZDlPNHFQc2RVTmt4cjR6NFl0Mzh2?=
 =?utf-8?B?dzhCYUhXOENHZ2d2aVk1Q1dMUkJRUGlLVElXOE5qNVF0UmVPZmxtZTZkdURG?=
 =?utf-8?B?bldBZEtuSDg0R01RYU1ObVdyaG1hQkphQ3BteXpNUHZ2YmZzTWxlZUVrK1NI?=
 =?utf-8?B?VngxcE16TWxWVkh2eTRRZ1RLZXRJdGRyK1hvQjRvRS9jbEVYSFduNkNjcDJV?=
 =?utf-8?B?T1BtMUsyWHFvN1pMa0l6VVNQQlZsZDhieHQ5NE5VczJMODJXQUtIL0JuQVBS?=
 =?utf-8?B?MVE0LzZGNFUyZ1Q1a1UwK1YyVDdVTHhpcGJNQy9LbGFyWkUzZlJDN3V2RmRs?=
 =?utf-8?B?dGdZZWwydWJISnJPTHJyWTJnY2pVVW04aFpsUWdBcDV6VVlKRVdCU0ZIY3Zx?=
 =?utf-8?B?U3AvTGpqUlA0ckViRE1SYXF3UVA0YjJqaTByMDJ4VzJXUVQrWnBabHQvM1ZO?=
 =?utf-8?B?cHJBazZEUlRGRElUNTcwRVdyQkVSRG5TVGxMWmdscVFXUzBJcmZKOXZ5NEJk?=
 =?utf-8?B?L0tDd01FaFFsR2ROVTJSL05VZnNMWVlJOWhGMTVNYjF6MzIvQ3loRlV6VXky?=
 =?utf-8?B?ekZaOWk0OXNwdmlRNDJsTDlJbDQ4Mjd4NXhRZWkyS0hITmtySXdhTThucXpT?=
 =?utf-8?B?MlA0QTllK25TWktEaUw0MUxheWNlaVh4WkpKZTMyaGtlbkdZSmt0RlRDV1Nw?=
 =?utf-8?B?Rko1dnJjKzg4QVdsZ0FkUVUxVFNybTZ1Y3pzakkvRkczb21jSDQrZVpZZnRO?=
 =?utf-8?B?TUtYdkk5cVM0cTZmb1FNelJMaG5UckxtVTNhVWJ0SG9WV1EwT3Qzb0VpNFBM?=
 =?utf-8?B?WXBOVzNKNjJxYytmUk9PWTZpcDZlc2R2Q2xSV1lKc3JvYkUwcSttV2VwaFQz?=
 =?utf-8?B?QUNYYnVVY3pnTzZ6bDFNd3picjFPSGQ3Uzh1N3BzcmpsZDFhMmhabzRZTGNz?=
 =?utf-8?B?RkxtVHoxMFhQR2NGWFhlRFlpbjNSaTQrSDlWVFNwMXpnYVZuUWtSYkdlb2sr?=
 =?utf-8?B?YlVQVEFtSHByNTVNK0pYU0YyTDVFeGM0RTFYdy80M1UwbXEyaW5kZjR4RERq?=
 =?utf-8?B?blRwaERDNGhLeEZBQ0Q5R0ZuQkRSZEhKbVlHNHZPbnJkQUd5anF1cHdLSjBz?=
 =?utf-8?B?R1ByZnY5cU5mVXFBWmhmeHIzQkJsaThIOWhZaEZiaXB5cHBJYUg1czJlZzRv?=
 =?utf-8?B?YTdhU1JlM0xHN2JZOFB3QXdaN213OUdoZ0d4T2F5dkRzWDlIUjNpQTdzb2Vj?=
 =?utf-8?B?YzlTbU0yZk9Ta3JNcmlkMGtIRVVYbHFGOEdWQ2VaQzRjbXVKUFlJY2FFd1Jy?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c09ef5-6024-45c8-8d5f-08dd46f9c7be
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 22:01:17.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+aijlZclqS7qkQCb3rQp7Na0CtjdfeD1LIBpq6FWaSaAMfkJTZNWAcDyy8BEqnMkP001jN/zRnYyldYKticDyQJTehrnWF1nnmfGfLxj8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
X-OriginatorOrg: intel.com

On 2/6/25 18:50, Bart Van Assche wrote:
> Prepare for adding a second caller. No functionality has been changed.
> 
> Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
> Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Thank you for fixes for our driver!
Just minor issues from me below.

> ---
>   drivers/net/ethernet/intel/ice/ice_dcb_lib.c | 46 +++++++++++---------
>   1 file changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
> index a7c510832824..69a4b84f935f 100644
> --- a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
> @@ -526,6 +526,30 @@ ice_dcb_need_recfg(struct ice_pf *pf, struct ice_dcbx_cfg *old_cfg,
>   	return need_reconfig;
>   }
>   
> +static void disable_dcb(struct ice_pf *pf)

you have to prefix it with ice_

> +{
> +	struct ice_dcbx_cfg *err_cfg;
> +	struct device *dev = ice_pf_to_dev(pf);

Networking code mandates to sort declaration lines by their length,
longest to shortest. We call that "reverse xmass tree rule".

> +
> +	dev_err(dev, "Disabling DCB until new settings occur\n");

even for copy-pasted code, it hurts to have this as error here

> +	err_cfg = kzalloc(sizeof(*err_cfg), GFP_KERNEL);
> +	if (!err_cfg)
> +		return;
> +
> +	err_cfg->etscfg.willing = true;
> +	err_cfg->etscfg.tcbwtable[0] = ICE_TC_MAX_BW;
> +	err_cfg->etscfg.tsatable[0] = ICE_IEEE_TSA_ETS;
> +	memcpy(&err_cfg->etsrec, &err_cfg->etscfg, sizeof(err_cfg->etsrec));
> +	/* Coverity warns the return code of ice_pf_dcb_cfg() is not checked
> +	 * here as is done for other calls to that function. That check is
> +	 * not necessary since this is in this function's error cleanup path.
> +	 * Suppress the Coverity warning with the following comment...
> +	 */
> +	/* coverity[check_return] */

the comment was silly in the first place, but makes even less sense when
extracted to helper function

> +	ice_pf_dcb_cfg(pf, err_cfg, false);
> +	kfree(err_cfg);
> +}
> +
>   /**
>    * ice_dcb_rebuild - rebuild DCB post reset
>    * @pf: physical function instance
> @@ -534,7 +558,6 @@ void ice_dcb_rebuild(struct ice_pf *pf)
>   {
>   	struct ice_aqc_port_ets_elem buf = { 0 };
>   	struct device *dev = ice_pf_to_dev(pf);
> -	struct ice_dcbx_cfg *err_cfg;
>   	int ret;
>   
>   	ret = ice_query_port_ets(pf->hw.port_info, &buf, sizeof(buf), NULL);
> @@ -574,26 +597,7 @@ void ice_dcb_rebuild(struct ice_pf *pf)
>   	return;
>   
>   dcb_error:
> -	dev_err(dev, "Disabling DCB until new settings occur\n");
> -	err_cfg = kzalloc(sizeof(*err_cfg), GFP_KERNEL);
> -	if (!err_cfg) {
> -		mutex_unlock(&pf->tc_mutex);
> -		return;
> -	}
> -
> -	err_cfg->etscfg.willing = true;
> -	err_cfg->etscfg.tcbwtable[0] = ICE_TC_MAX_BW;
> -	err_cfg->etscfg.tsatable[0] = ICE_IEEE_TSA_ETS;
> -	memcpy(&err_cfg->etsrec, &err_cfg->etscfg, sizeof(err_cfg->etsrec));
> -	/* Coverity warns the return code of ice_pf_dcb_cfg() is not checked
> -	 * here as is done for other calls to that function. That check is
> -	 * not necessary since this is in this function's error cleanup path.
> -	 * Suppress the Coverity warning with the following comment...
> -	 */
> -	/* coverity[check_return] */
> -	ice_pf_dcb_cfg(pf, err_cfg, false);
> -	kfree(err_cfg);
> -
> +	disable_dcb(pf);
>   	mutex_unlock(&pf->tc_mutex);
>   }
>   


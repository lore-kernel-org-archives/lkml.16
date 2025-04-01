Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E5020C480
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522904; cv=fail; b=E5pU5a0zEcKTV/4PsHSwpv7ReQ9mNS3hXOok2kFPSMJrsL2chuF+gUrtQk7S35VMi0cUd8ENw9wP+iu13ulH7qbK4MrCNik8gshOiYFPTjoo3I7hpUYNlOmfHpHSYKvYMta14AQ7dQ/88oMPcAWUe4xYfjOF8mCMkYtRUlwjGfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522904; c=relaxed/simple;
	bh=iK6d7YN2nyXz0+gj5GsyRr0HJwrscyCbL53IpKGhN6Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TWAkC4e3Bq2NP1ljVq3RCXFUkSklqCq2BZPogTMMXjJ7rc+SA1YQStXwhLfB5/PFQkGmu9f/DKD/i2Yh9GhGL+jCDGCf5rg5Nr4ia6GGuqVyUWwlDWT4VnoRMqQr4Gytzqgq1G0BjpZDUqZjfDNH/QapV446G2SENOPrfGzpl7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtesIqLD; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtesIqLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743522902; x=1775058902;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iK6d7YN2nyXz0+gj5GsyRr0HJwrscyCbL53IpKGhN6Y=;
  b=CtesIqLDdghbjVRRF8Q0ZsVJlGDXGViXpnClCp3DILdRMoEMUHFI2GJV
   MnO6N7iMjEBUEHxDtHHONXPLgx97wTC9GAuN39Lp8xYdiGlaiLvn1qT+Y
   1onMM01v8YuUgdRbLHnyHgXQCVv7dNUIu1KmGv/d+xVvLwPJvZq4njLeA
   gazQ4wtPERTCJ+g2f73YXZZMED3tQDgpA7pQQJcsrlNHzWkiSmM27gMze
   YxE5ImxC37zvxwrG6qRoMlwqnAePoJmxpyNxZtMyL0zzR3x8kEZK2DDwl
   2cs65cX/RTJQ4cYsVzD8Ja5HQmhG+FdpYSW1IlIFuOWmknx/XK+KeIcVF
   Q==;
X-CSE-ConnectionGUID: izMo70emQ7etjQZVIQ0f7Q==
X-CSE-MsgGUID: mZ77PNPxRV+a8CqgQpLoiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62254977"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="62254977"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 08:55:01 -0700
X-CSE-ConnectionGUID: 9WbY4q48SZadN0qhfeFQgQ==
X-CSE-MsgGUID: amYKhh+JQU6YYKQNxjXwzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126328286"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Apr 2025 08:55:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 08:55:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 08:55:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 08:55:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbq2tHvKfgtuEdsUsP7WXsciE8f0zAReu0iJSSdgm5199hJuaXwil63TMyDyZr43Hj4lV2ITqadlfMxwMYothDSRgn68PvXk5BhBEyWWPZW5LzFx7FYzAoMMEVjPtiZQ24akTwuKKaL6Nd6e8nl8zdze3381YxVTtxTofiBxp3Rs4T5kO/1kXOdS01JXKllNRkx2UcfzWExDXcEW8y07elJFzsTpeLscmVKfDFuLa6ANEL4qI4KYVgMNHeeGrBUiubzCkZPB0qgMhDDFS/ffQC8zGD7bbT6RxaZOThYsq0JmySdTkwfiY8oABlEB/OvW2arChLlQSIfURcgfuOs63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEQTqH1hNxYdRzPUFlAiVLIjRF5XT7ML90PMY+MO11k=;
 b=j6N15MlWmXnw03acrjBmlYwLqw9EyJoUlXhbjdHGdbAewtTsmEcp3a2g7/qgjTVLPRupgv9rv7lnrp3s6MNHowDX7c6ve4D8Q8k3ZBizWgcanhd46dUyWNxKootslFAor+Xw8NcMa1WSGowjVyEOfzUQ1uEFEXDzPGMCuNmascWm95ie8Fbn+6gBeBwnlmPgkbh1RZpYXZ6sbJgdwCLWrhiVwxswW6417gQ5gGOZpqh+wMSj+Csh2w3VKXv0512DwFGU5T2dZT44UhSbdeN6VHbN3d4UhXb5FLOfehI/2YiYO/rQtVW9MEBUhTUp7MFkrYbRgSn47pqF8VW7o0fknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by DS7PR11MB5965.namprd11.prod.outlook.com (2603:10b6:8:70::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 15:54:57 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:54:57 +0000
Message-ID: <88198f82-5a45-4a3d-af94-8ac1a4745b86@intel.com>
Date: Tue, 1 Apr 2025 08:54:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] x86/nmi: Simplify unknown NMI panic handling
Content-Language: en-US
To: Nikolay Borisov <nik.borisov@suse.com>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, "Kirill A . Shutemov"
	<kirill.shutemov@linux.intel.com>, Kai Huang <kai.huang@intel.com>,
	"Sebastian Andrzej Siewior" <bigeasy@linutronix.de>, Mike Rapoport
	<rppt@kernel.org>, Petr Mladek <pmladek@suse.com>, Jani Nikula
	<jani.nikula@intel.com>, "Tony Luck" <tony.luck@intel.com>, Xin Li
	<xin@zytor.com>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-2-sohil.mehta@intel.com>
 <5d4b2b95-bb11-4d1f-8cba-0bcd8e864711@suse.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <5d4b2b95-bb11-4d1f-8cba-0bcd8e864711@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|DS7PR11MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: c281da91-906d-42e4-2942-08dd71358d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3BXMGN0UzNkc1dwWTVrNXo2Vm1iWjJYS2R2VkpBK1UrTndERW5LRHdZM2Jk?=
 =?utf-8?B?UitaYTNXNVpubXgySEE3dHNLL1NWWkp5d2Q5SkNWVEdjUGtaWTN4eW1XUEd5?=
 =?utf-8?B?N2xoOS92eEZ0NWk0dGNXNU1PRFJheDZ1UENFZ1NpdmRKZU1wVFhzV2NpT3Fu?=
 =?utf-8?B?M0s0U2hGalFPNGExWEVXenRoSkVDZG5RMy9SSE1BUmpHTDFUSk9xWkIxcEd2?=
 =?utf-8?B?WFRoVUpIVWdPejJHTEZtamJwQWVDQk8xbkNxUmpUVUJ1RFRWY3E2WWY1blBm?=
 =?utf-8?B?QVFoQmV2SkxZRGc1QW5mNHcwUWRhY1JNOS9oOGRRbHVPalAyMEszVHhlaHRX?=
 =?utf-8?B?RU5zSWZuVWJma3Z1aFVtMm12YzZQZyt0dXVPcXYyaUVDOHM5am9aZmw5ckFG?=
 =?utf-8?B?N1Z4QVVDbkVoaG9QcllPcFlNaExaQ3FPYVh5ZnZrd2QxbEdOZmxZR2tyckxL?=
 =?utf-8?B?K0hIQUgwUVlIOUQrbFlRazZUT0o2YlVuamcxQkVRaFRoUGtobjVqVGxza2t4?=
 =?utf-8?B?bXVTNElMUDJVbnphZUlKSlZiWmZrYWhqYnhlczhtZkdkY2ZZdFNnSjdzdlNN?=
 =?utf-8?B?dTlQaldkclRXWW9LcVRLNm9GQWF2UUpZaVNXUm9aM2UzUDhmcEpYWmNMY3Vx?=
 =?utf-8?B?ZVdCRDNNbjlGcnUzdXExUm1RQWRsUEZsWC8zcUprdHgzRUVQUjZVZlliTDBO?=
 =?utf-8?B?emU3TndTV0s5ekFVSkU1UEplUTFYcUpzc0ZkT1hleC9odnEyNmQ5NEl4bldV?=
 =?utf-8?B?UEJNdEdaN0VRbmxaU2dGTzU0N1JndFFwTWVacU9oMEt3VE03bWVnaWxmSVdr?=
 =?utf-8?B?cjkvdlFtQ3BXNktVZVVESWx6YnRtS1ZZZ0VIWFRxd0MrSnl6SU5TLzQzTGtG?=
 =?utf-8?B?UG1GWk0zdmNjQ2d5aWNHOWpqV2dGMUYreXNrQW1JcnluYktjbmd4UmNPdWdX?=
 =?utf-8?B?cEtXYUdEbkY5RVhKYTEvYzI4Z1NMc1VRcVZTMWFMRVFtdEtoOTNQenJtVnFE?=
 =?utf-8?B?L0c1Zkp4ZmJrMU5QZG9Sbmh5YW45YXpXY1FpZ0VsNTE0L09aSUpGdkpEekRs?=
 =?utf-8?B?eTV1VEtFbm1RVzU5eEJhQ2RJV3JPcy9nakJRbnVJSHl2RzN0c25iUElyVXJl?=
 =?utf-8?B?TEtLUDVHS0ZjVXVHTGN4cXN5SnZlWWJMR3ViMW1kcnFoNWJrY05lMWZoaW5t?=
 =?utf-8?B?N1NndVRLNEc1c1BqYzNXTGd0TTg2bXNlOGZlRHppK3FxMXI0T0l3WTRtSVJN?=
 =?utf-8?B?cUNJQWF5akN3YTc3dTJFZjFzZXRyR3dFeHVyQXZ0YkkzS2U3MmFQSGZNZlRR?=
 =?utf-8?B?Q3RscVR2SERPeEhIRTY4MFlkQWN5b1kweG5Ua0tXbUY5TVBXckZhNFVrcFA1?=
 =?utf-8?B?RGpmeWpGS2k1YXovbkd0Nk42TlY2UXFkWmh3WEpvaGRpbWs3NnIwQkl2MWxZ?=
 =?utf-8?B?VGNRdEJjWW5nY0hScENidVJEclN6eWlEMXpTWTdudGpnZENSdGtjSmgrTjRt?=
 =?utf-8?B?U3Uwaks3L0VrY1YwYTJrNm13WkxqZmtiaVJxUUkwU3VyZlovL2ZBMXhGbUZx?=
 =?utf-8?B?ZEpyV1U2ZEh3K2o3ZHF6OEQ3WkYydm4vMXU1SEZhRmpzTlJDUEM2bGFxaVJ6?=
 =?utf-8?B?amlDWXkzMlpwRGl2WERSSGVIaHZNM0FhRk1zbFZlek5uWXJtWERFZmZ6ekwx?=
 =?utf-8?B?NU1OdzRkTEVjZnJzZHBtc1Q3bGFVeVBuYnlmUlh3QjN1QURtUkw1L2NoUDNM?=
 =?utf-8?B?RlV2aVdBbW95dDduenBFMUx5eStvNHdFeVBLZVFyZTF5YlYwUndpTnBDeGFv?=
 =?utf-8?B?RGM0cFFETEp1YktrZ0NJbElwTWpVU0tJdFZKa0E1VUVVdlUrbGtyT1VvRHh0?=
 =?utf-8?Q?Unca1iK69sARV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTJmSDFNblZMdW14WXd3WC9Pb0dKczFBeTNJZWt2VktxZ2R0R2lncTNBcmJY?=
 =?utf-8?B?WlZBaGRBeHVEWXVjeCtxVkQ0RFZwV1dLemd3L29Qd0N3NHRTdWxpVFdudkpw?=
 =?utf-8?B?MjZYc2NXQW5UdnF6UFF6Q1FLL084aEIrekpadjJZUTZRbm9qdnNmcWpRbmps?=
 =?utf-8?B?MDRSVndrUGhtZ0gvcHg0cmo4ZUdIdUdOQ0Q1UDNzU0VZZW1RYTh6S2M0WEsy?=
 =?utf-8?B?MUZFNkgxNWdEVzBIckZkTVY3Y2NPQkE1bTRUSkszQ0NwUys2QkdjVGd4WEZl?=
 =?utf-8?B?Q2hNeUZ4WWxlZDhENHlLR245ekZvWmNkaHhRYzVuYXoxbUJLQmtQWDJSeWNM?=
 =?utf-8?B?Y2g2ZjZSZ3VZMFczRUdVWUViY0QyL1RMVzdGZW11M1NmM3lTRVNXaWwwRWpU?=
 =?utf-8?B?OHFUNnVUV2RMRVNyQmtmTmdOdUdTU2xMYmdvTGpHSXE0bEErTHlqTU4rWXNR?=
 =?utf-8?B?QVNQcFdIOU02ZmtjUG10VW1NZkpxSDVCL1BMK053cGNFYnBUNGRhek10WGxR?=
 =?utf-8?B?cTVhWEk4blVFeWNzYWo5bVJCVjN5eDVwdmZvR2FmbktZdEVuQUplakF2R1JH?=
 =?utf-8?B?QUlvTzhPZ3dVbDdzZGM1UkNZS1A3eC9qaG01RUxBaXBvNVhIemk2VytsbDVx?=
 =?utf-8?B?T0VnckE4aVBlUGwrZk1RQm9HN1FUMHBabHpHTDBWM04rSXBTYk5RalhoWkZ1?=
 =?utf-8?B?dVhqUmdaRlFVUE5jSnhIUU1sdG1Fc0FIZjFDdkVpQ2FXRVhOTm1tdWk5Uk1R?=
 =?utf-8?B?NE96QzZFd2gxejlYNDYyMGFobTZlUnR1NCtKOGdjOW5YbHZzVXVQaWt1NGZy?=
 =?utf-8?B?azdGakhGUWRhWktNOGczYW5jMW9BZkFDbm9IZHdPRTRTdE9RYVBLRkxXVGpz?=
 =?utf-8?B?YzUwbnNZWjRmMXlIRlRNVldMM3NWY3YxT1BtbjdvUm9vNUIvdHpaNnFNVnIw?=
 =?utf-8?B?aHI2ZXM2SjZ3UnNXcy9ma0g0elFNWmJkVzZHSDZJa3BWN0MvNXZpay9KbHBM?=
 =?utf-8?B?Yk1kV0M5TFJxVXEyM1pBdW12ZFVOWUVISWY3dW9IVk5XL0N4eFowMkZtN0xj?=
 =?utf-8?B?SVYvRi8vVDE1Y2tRUmIrL0hMK0pJZE5OdTBnZll2MHZTZ2d2UEpJL2NHT3BX?=
 =?utf-8?B?KzRiR0lIUWE2b0hZcVducUVLM3N2K3FpVytLelVKamFYOS96QzM5cElPdklu?=
 =?utf-8?B?SmVRS3Bpc1JZdkRHaUlxZHQ0NEVsSlB1c1BGdVBTWjloUE5aTi93d01qNkZU?=
 =?utf-8?B?T1RabTd0QlBFNThRQXlwRVQ1b3JvZGpFWEdteU84blQ3QUlkSHIzTkpTL0Z4?=
 =?utf-8?B?TElvcFhHZXQzVmx2QWo2UXllbWp2cUF2V1hrM2l5VlpqVzFzQ3lnZzNoVk1I?=
 =?utf-8?B?RE1zUmRIRzFTMkQ1NGUvWHI2WlppbDAzdGtXb01LdGQxS3FFdUJ4YzRJN0hE?=
 =?utf-8?B?MG83T2I0a0REZUJ4ajVscHU1Q0EzSG5hVGQ0bkhwY2p3dUVFZFFNdmFwZ3JN?=
 =?utf-8?B?QlhRdkpwOGh5b3JnOEdCYlN2U2dBNnJlZ1A4aU4vQW42bWxBYW9nQUdxUVpm?=
 =?utf-8?B?YW1uU2FNQUxKS2loTUVXTmpObUZNbWVRV2NEdDZBaFJqMlViclIydXpueHpI?=
 =?utf-8?B?Qi9QNnh6enB2b0ZCR3FXMTRpbC9TNSs0VEljQW9KdWlVbUplendvallvWjlH?=
 =?utf-8?B?bXROekh3bmdod0w1SGpWdDhVaUVVQVlTOWhMU3cycTlhanExNHRxMEZUMG1J?=
 =?utf-8?B?Unh0eUU3YXg4T2pwT21veFAvRlFSalBFU3h3OEFXODFmNFNmWU5ORlhQeVNQ?=
 =?utf-8?B?RGpEMUk5VEVpdmpjcXRIOVhzTTBPSHJialFzQWJVUWgzZ1ZvdTMxaEpHTG8x?=
 =?utf-8?B?QThaeHQyeVZBQ3R4NEhNZnVHRW1lL1k0MEFIeUd3eitRUFNrRjZxaHM1cXpC?=
 =?utf-8?B?WW1SbGthczErbnkvVEh1N21NZzlsRGJhNDl1VFRuVHNsNjRERnlzRVJWVHVT?=
 =?utf-8?B?TElJTElhMVliOFVNUkNFc0VFT3VNMGZUSm5reElRcjYvaUdSRktVRmJSR25U?=
 =?utf-8?B?SnlvYkdsVDFiRldGMGh6V1lpcTUyczFBRU1GUzBxV2Q1V2FYelp0bzhWbFFG?=
 =?utf-8?Q?GOxMaY9mOz6ek/9zcyiTEk/jh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c281da91-906d-42e4-2942-08dd71358d1b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:54:57.2702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JR3WymiWfHj9P23V77eQFVV+S/VRPVaGsicQbE28ZUhCOH8HOx4fNLt7O2gq8j8EXETlP5M6X82AWUyR4NMVvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5965
X-OriginatorOrg: intel.com

On 4/1/2025 8:00 AM, Nikolay Borisov wrote:

>> +#include <asm/realmode.h>
>>   #include <asm/thermal.h>
>>   #include <asm/unwind.h>
>>   #include <asm/vsyscall.h>
>> -#include <linux/vmalloc.h>
>> -#if defined(CONFIG_X86_LOCAL_APIC)
>> -#include <asm/nmi.h>
>> -#endif
> 
> As far as headers are concerned only this change falls under the 
> "simplify nmi handling code" the others while nice cleanups should 
> ideally be in a separate patch.
> 

You are right. The simplification is only for the #ifdef. I could have
just removed the CONFIG check and left the rest of the headers as-is.

But the <linux/vmalloc.h> include there was completely out of place and
needed to be moved. This eventually led to the reshuffle.

I feel header reordering by itself may not be considered worthwhile as a
patch. Since this series is focussed on cleanups, I tried to keep
cleanups in the same vicinity together. It's mainly to avoid bloating
the patch count but still keep the reviewing of these changes manageable.


>>   
>>   /*
>>    * max_low_pfn_mapped: highest directly mapped pfn < 4 GB
>> @@ -150,6 +147,13 @@ static size_t ima_kexec_buffer_size;
>>   int bootloader_type, bootloader_version;
>>   
>>   static const struct ctl_table x86_sysctl_table[] = {
>> +	{
>> +		.procname       = "unknown_nmi_panic",
>> +		.data           = &unknown_nmi_panic,
>> +		.maxlen         = sizeof(int),
>> +		.mode           = 0644,
>> +		.proc_handler   = proc_dointvec,
>> +	},
>>   	{
>>   		.procname	= "panic_on_unrecovered_nmi",
>>   		.data		= &panic_on_unrecovered_nmi,
>> @@ -185,15 +189,6 @@ static const struct ctl_table x86_sysctl_table[] = {
>>   		.mode		= 0644,
>>   		.proc_handler	= proc_dointvec,
>>   	},
>> -#if defined(CONFIG_X86_LOCAL_APIC)
>> -	{
>> -		.procname       = "unknown_nmi_panic",
>> -		.data           = &unknown_nmi_panic,
>> -		.maxlen         = sizeof(int),
>> -		.mode           = 0644,
>> -		.proc_handler   = proc_dointvec,
>> -	},
>> -#endif
> 
> Why move the definition and not just delete the #ifdef ?
> 

Mainly for consistency. This keeps all the NMI panic options together in
x86_sysctl_table[].

>>   #if defined(CONFIG_ACPI_SLEEP)
>>   	{
>>   		.procname	= "acpi_video_flags",
> 


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6CB1A2622
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747196385; cv=fail; b=X0eJZC9cIGpDTTIWhcQq1ifia0yvypd3eV8KmqZr7juWtw7lj82QvcJan/gly6APOsvh4C6UUBOEM+cEFS8PdKiburrljX06r3g3I8kXSHCF0NrvJeKoeHKr1DojEisWIkplwcM/xPl1I1iqykVhkGOxyLoielSVDCK5wCCi+7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747196385; c=relaxed/simple;
	bh=+8eEMEn98i57eMW4eYeF1rHxUll68/GQKLFqNHtAv48=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Exd7BevgastQsBwWUvI8XokDdw6kjy8VrBM286ydNNvHLZXafpUjaNeWt6hj5fl08eq6glPuS/9Lh9TcvlAQZiHQWsJ66Tedvvs6XWjw8Zele7C0mVePPxck8P3PPyRu43jJHzjpUx1+2jeCfeJGKs4Kh2qcRzpJfXnWuBxUJDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gq8GEHIa; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gq8GEHIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747196382; x=1778732382;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+8eEMEn98i57eMW4eYeF1rHxUll68/GQKLFqNHtAv48=;
  b=gq8GEHIa6zm1qTCJcOFOAo9Gf87YVwC6dyRbnD4+byYm59XxdOQmx82L
   WZk6FSCbM4izUYqLO7eqUp0xuMXFy4VVHgt8xatggsES6u6y2oMXaFyDm
   NpdbPbkYBuYDqAvghCbaHs/5fDgx4Spa6A6jEfNCyAVkMQatuxbouZt4/
   w2zcqeJA2/Pcn9j12L8ewCMuYIGTWUqrMHEModsuV6CzkfcSH063xBjty
   5J+dmfLkF+xDbkaMZxwkGYyIsFGw8KBN9YxoDwsVLuwmTj6XUClbgZwuS
   zAhKZJ2LnBY05ZKljjWRtcVu+yNLd99X5P6LpbqlaxIKv8E4jm4OhiBLd
   Q==;
X-CSE-ConnectionGUID: Y9jBZolgQDexVV0uBHO7WA==
X-CSE-MsgGUID: F1agu5ULQACaRBFEvyUwiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="51718178"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="51718178"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 21:19:41 -0700
X-CSE-ConnectionGUID: nJibprRoSMe+Qh10V8RyYw==
X-CSE-MsgGUID: PzEbgUHcTCishk94i5KMaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="137782741"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 21:19:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 21:19:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 21:19:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 21:19:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwpQu6ZckDTpTtwBat/n6O+vA2FcKK2BOFUojMImS3rmInP5Qx74vHNV9i2gXLHWA6vze7hjcwHk1oVtei94Rg4KQ2/o2NrTI4CKTb5pg/HTY4Zl1t+bxrj5g6iI/a52qPNnyDFx22lZK3jnnmO4zcH15/xKH+c2Rino6YWXhqf7z0MjVXX08/22Kdd/92FaaLKv23RrKKetx71BsA2kEPhOYZcuyZNc7Sf2vW35fxys6tNMSX2g3WxFZnmLP9DOdMfOzDXW00WaR6WUQfZAXD8PcORZeOUKsUTK0ax7sqmOJ4mL1rT56j7io0EZGEX7nr1VhDayN1XcqyxAfqmQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vKLgFZlOEAZ13tVZM9c1F8FUWX5N3/HOpFF4mDoCC0=;
 b=zOyFTHfLf5l5CGkaNlWwul/+PUzzsh/D6EO8bLtHxyKgj6b4LzJgJOWIoiZ662soiIfdr6WgTSCg2ATpv75UBOIitpBE9G4jKvjs4kXrsA9Q4/SzWJT1KpZkKEs+bJkusrRo7iH1Gm3ozsV2bCZMiFcA+piC8YRC7GLrYekbJ5+dJ3ul3m53OaVuFedgv1rXhnHNf/xofGLykUEd6CQY01y6KfGAztjwA2hrhedcMEoIfFmgyNWUPDFqZGTlzpqzsBUvYWkFIIRf/N9Y4/7jcbh2POe1e8eC89ybac2rUVYwW+8eO3I6EK7Ph6uRu3YUnkn1gvVtspR+9lVIyAUfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by SJ2PR11MB8369.namprd11.prod.outlook.com (2603:10b6:a03:53d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 04:18:52 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 04:18:52 +0000
Message-ID: <c86a3750-7b5c-4ba9-b1fd-1d8dc41c7d72@intel.com>
Date: Tue, 13 May 2025 21:18:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/26] x86/cpuid: Introduce centralized CPUID data
Content-Language: en-US
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, John Ogness
	<john.ogness@linutronix.de>, <x86@kernel.org>, <x86-cpuid@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-5-darwi@linutronix.de>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250506050437.10264-5-darwi@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:74::24) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|SJ2PR11MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: ac929513-8d9f-4e53-c153-08dd929e6edd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDVsSHVacXRuREZHbWxuakFzNHc0bFliWGZOT0ZMZ1EyZkprU1doOVZsUlJP?=
 =?utf-8?B?M05CQTJQa1BSWWdLZWswV1NLaHl2QldwNkRlMnluQzJSaW5mV3dIT0lUZFNn?=
 =?utf-8?B?aEVxR004N1NJUjFGdjhDTEF6eXY3Z2RUdTZ5b0lvNGlZSW5BUlJLdWRmSGVV?=
 =?utf-8?B?SWFVYVZtNUF1cElSQ3p5SHNhUWRBU1ZCS2hiSUMyN3l6b2kzS1pWY1ZIYXIv?=
 =?utf-8?B?U0hyWjNxdDZNMzNPSUZqOHRuUVZwWTN0ejd0Miswd1I2UWR5VlNlOGY4UmVp?=
 =?utf-8?B?YWVSYVIyQmhvbzNMZFlDYXNQN3VTZEZ1WFM2aXhYL1l3WU1mSjQxb2xoSTB2?=
 =?utf-8?B?dGJ6eks1UnNnOHZ4YUx4UWlDaGYyYzFUQU9QUzFwTGJ6NUFmQXhTaE82Y0RN?=
 =?utf-8?B?N3ZGOXpmNXlScWg4TkVMcXZGR0FGMy82R3dHS2FzUjUwMkRBMkFJRDZjOU44?=
 =?utf-8?B?RVhDZEJuMkRYcElVK0F4ZW9TS2tjdUI5UmtmUnpBbGhxZ0xpOUo3bTBtRjl1?=
 =?utf-8?B?T3lmbTJlNjg5ei9HdHNMY0RYYXBFVVdCb1F4dWRyMzB2ZjlMbFpBT21jMlRx?=
 =?utf-8?B?T3JIUXg3YjlxZWtkMG9MRzA4eitDV0JlQnYwSS9hUnczVDNnbElBbjQxRmt1?=
 =?utf-8?B?eWJTSTMwcGtvOXVycy9QSDBaU1gyTGhuWWRZc2JJaThsK2NuZFF6MkN3VlNY?=
 =?utf-8?B?clNDbGt5Q2k5RDVwYWlBbnhwV0tOeUNKT3NXQjBwMEE1czREcnpLZVRPUCsy?=
 =?utf-8?B?K3h5aitqWWxKYmdkRjRQWTZsQmRYam5QZTk2NmN6TGdiT2ZIVmlzN09DOHM2?=
 =?utf-8?B?dCtzZXAya3l6Mnp3dlpuNFpOSDBRNDkvM1lycFArRVFKVElsNWhVcmJpRXEy?=
 =?utf-8?B?STRMRlQ5d1R4L3lOMW9QZ0U1eGk1cHhmUUhVZHBHYy8vcTVSdzZVOGVhNWdw?=
 =?utf-8?B?WjRmNy9FQjQ0SDE3U1ZoaVhmR1Y3NHc5SDdFdDBzSGdTN3MzdXpKalRjMFdl?=
 =?utf-8?B?dy9EeVNYOW05Wkt5YWMyRzNBcGp6VjltM2FPWDRhNUo2SlRUVTZjbTJ5NytR?=
 =?utf-8?B?WVErMjk5QmFrSVgzZVFldTNlZlNFeDlsTTdKUmcrd0pqcUp2YjVnUEJmS3V2?=
 =?utf-8?B?L0NoRzA3U3d5S1daTmNZUldNclVic1FtWmhlS0l6NlYrby9iTmVpL096NzBN?=
 =?utf-8?B?cXU2Z2VhQVJ6RmtsN3dFcVh2Rkt1YUhGRFRuU3pnSWlEN0NEck8zWC8yYVJS?=
 =?utf-8?B?bFRsMzFINGRKYi8xb1lHSDdTQWZQb0tvNGswQ003WDRPdk9EY0YxWlNFOGU3?=
 =?utf-8?B?eUpTWkVYTHExSEFXZXNzQXR5eUpYVXpnalEya1FWTXZRVk9mU21HWmtRYWNj?=
 =?utf-8?B?QWo0TUh1WVJ4UkdVbHMwbW9vNFZ6VlF1TGp5eXplbEZUQWI4VnVKQU5DZ0pz?=
 =?utf-8?B?ay83aC9YdVpEMEhrRmJGa0tqUFdkUTBjY0FvZmFtbFBoYzd3SVlEODlqcnF0?=
 =?utf-8?B?cFJiVkNHVG14U0JHK0p3MHJCSkt4K1lYZzVXSmJNV0JGNmFQQ0xwVjMwc3Vn?=
 =?utf-8?B?UjhhYndMVnRONXB3a1BPb1JYelVRVFVKYy9OeXBST3FwaGVJNk53TTE1OGI1?=
 =?utf-8?B?NkhjcC9FYzBZaHpyUUVoWnNVN25zMnN1blhyQS9CL3BNZ3JLREs2THZTUzlk?=
 =?utf-8?B?SVNFY0ltQ2N3cjk3TG9LYjB6Sks4Tzh0Rm1sSExxMVd4NFcxRHVWUGM5Q0VB?=
 =?utf-8?B?LzIxaUxNYnpsWlc4MWxJRDdraWczcUlhVmE3a1dTMFkzN2FuRXZwQ2JYUXB1?=
 =?utf-8?B?QVdaY042d2xaU0h6OGErT1JTcHBVaDZhWm4yUXRJWWV5VUp5U2Q2WjlvUlRJ?=
 =?utf-8?B?ZGkvaG5lS1Vjd1gvaFdBdG9uTllsUnp6SzQ3MEFCMjV3RGR0TGZDNmhhc3Nn?=
 =?utf-8?Q?EczPko9tXJg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THNKVUh2WXRidG56RzRPQndJRkFyOXA5M1hKSFlRSHZHZzF0dGlxNkJKR2Ra?=
 =?utf-8?B?UVBhWWxGQ2FGbjc2WFhGclo2M0p0dWtRZDZ6UjNabmxRLy9MK3NRVXRqV2F1?=
 =?utf-8?B?bzBnTkZEbHYraGM5WW9EZ2ZjaW1EQlp4eTBIRTRMdWE2WWdtVTBFYVAwVmd3?=
 =?utf-8?B?Y282Q1hlOXU3WTVzNnpuOHA3NW1NRU15L1gyaHhENFRWaC8xN1JWMHZJd254?=
 =?utf-8?B?VktnRGRYZm5JUThqblVjd2s5WGw4ODNJTHlZQWVTbWRiRjdNejVrUWpRYVZv?=
 =?utf-8?B?OUZSYWpKVjZiaSt1VU5iL2NLS1BOanZUazFSNkF1b2RjMDVXWkxpd2JMVG56?=
 =?utf-8?B?Zk9NSGdiNUoxTVFhZDBQalBqeGltTm5pTDh3SkJONXhYd0VzRVpQZVZYalBM?=
 =?utf-8?B?V0crdUxPQ3EzQXZTWm1nTThNOEcwaHhldHZRLzdQZm93a2k1amhDMUVhVjFY?=
 =?utf-8?B?ZmdXd0NFQjRiRHZMTDRqRkZha0xna2ZJbS9ieU5xVkc0UWttcHVkSjgvNGVi?=
 =?utf-8?B?OEFrTURlOU0vZEJIREdYYVl4bGlkWlJNOGVGdndVaUx0TXEyZXZMT0RHbnRw?=
 =?utf-8?B?K0NaL0VzTDI4ZzV0ai9NSVNYSjVyYnM5UnJTc05rM0pUd0huUVRhb3UrWU9h?=
 =?utf-8?B?d1N0NFVwY1M2dFNpM3IrcUhJVXZvOHBDUStKeE4yYlpkdTdWaCszR05naUda?=
 =?utf-8?B?QlZCMzNhN1pGZzZTN0pDU2thMmJmb1dYQmVQTlhMUUt1WEIyaHNHYU1KdW5Q?=
 =?utf-8?B?TzVVZWJaeUpmdDFob3Q3WGhzb1F2OHZsbWxRdjFxQUcyaVhNcE1xenR5Umtj?=
 =?utf-8?B?bkw3cDU0ZTg1bkRoak9kZUVMQ2thT1ovVko1NGtuSSswREZVRDZzb0tlRk1P?=
 =?utf-8?B?WDFvK1Arbm9tTFNjRUticTFza21nb3cvMmFKK1Z4ZWZaVEhWTUp1OUFnUHZJ?=
 =?utf-8?B?c3lhNnJvOVdXZmZXOGJkdEU4QnpPNDc0MzlOWUJzZ2tSZFgrYjQyaEdDUzdB?=
 =?utf-8?B?SGhtMTVvdlVocGphaDBzQ28yNVBURmc3dHU5WDh6cFNkR3AxOHVScjRNaXhH?=
 =?utf-8?B?OHdjdHh5cjVyTVNtWU9EOVc1U25NSVZXdEI0YWR2bjhsbThBWXhNc3diYk9Q?=
 =?utf-8?B?a0lsckxLT3NqYmkzUXRqNExpdzZEYlRVcjQ2VXJ2bmNuc05Dc3d5SXdXdTdq?=
 =?utf-8?B?SzZjV01ZTmdLKzBXWk1keGR2RldIc3hNbTJYWXdjWnd4Y012aDBNbzFpdGZz?=
 =?utf-8?B?VitSWnlwTE1adndNS2xiUXRibFRGNXg5b29QM2lSdkxTNFVPYmk1Rjhsb2Ft?=
 =?utf-8?B?d0lmWDFmMVpSdDlRNXhtZnZwUlI0cG5JVlI0QWJvSWtLbGVMV0pnUWlxeFpV?=
 =?utf-8?B?SHVUb2lHQXZ2RHdIUWZOa0NpQ3kreERYS2prcDBPVzBoVEpiWU01TGI4dkVY?=
 =?utf-8?B?SGdZT0FCOU1kS3h1eE5nVEVleVovNWNjQmQwYmZ1MjIxSGphajFZUFZoK2dJ?=
 =?utf-8?B?TmpkT09ZR0hxSWFZa1lWbE1Yc3RxTUUrTmZsMzdlY2w0QlVCbjBteCtPck5I?=
 =?utf-8?B?R0NFakR5a0dWbGdrQWM0cnVYbkZQeXUyVHdWUFlJei9tVmpQYVFaRzRIaHFZ?=
 =?utf-8?B?ZmFvOFk2Q2dHQ1ZUWXl2dWxOSXRLei9YVVp4dll4UGlxRE1KZ2kxL1VybGtJ?=
 =?utf-8?B?cHQ2QjQ4Z3drWWZWK2lHcFVXQ1NUSWFFRm1ndGVld3JhMGFDYkJrQ25kb3BI?=
 =?utf-8?B?RFNuMFlvdXVJQWZSUUJFYTZBbVJTbTRMc1RDR0pjdEptazhkdlJ6T0ZOelpa?=
 =?utf-8?B?QjJGZGtwczJvazRHUGZGQko3cG5JYnFpVHUwMHNvL3lQS0Z0R21ZVGMyQTZl?=
 =?utf-8?B?bnVyRzROU0ExN21nM2ZIQmlhSVBQUWRrOHZEbGxzaGFrVzQ2Vkw4M1NhRGFN?=
 =?utf-8?B?OGtsM29qbExrQ0p0bS9Gei8wMGpLMFZBYWdtZHAzbFZVYVhJTmdZZVhUQXpl?=
 =?utf-8?B?WW5RSDBYaXNoTDNZaGtYN0RGVHBOVGtvckVjOU44UWRFRzk2U2JYMERGaHp6?=
 =?utf-8?B?NkNWSmNyd2JaaThQZDBiK3dKN0lsN21zbC9tcUpudDhBWEY1Z1pETVd4WFVC?=
 =?utf-8?Q?0ojLWwGk7n4etoRcI5M+wHFMs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac929513-8d9f-4e53-c153-08dd929e6edd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 04:18:52.0560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwRFrlTEiapuHrBfBVmVkAamKISBkDkP/J0XVw++l0x49+cN/WKZ0V0Ix4Rls7vDtDDBLS1hDd/HVWGtyhJx9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8369
X-OriginatorOrg: intel.com

On 5/5/2025 10:04 PM, Ahmed S. Darwish wrote:
> Define the CPUID_LEAF() macro for building up centralized CPUID data.
> It automates defining a CPUID data repository in the form:
> 
>     struct cpuid_leaves {
> 	struct leaf_0x0_0	leaf_0x0_0[1];
> 	struct leaf_query_info	leaf_0x0_0_info;
> 	struct leaf_0x1_0	leaf_0x1_0[1];
> 	struct leaf_query_info	leaf_0x0_0_info;
> 
> 	struct leaf_0x4_0	leaf_0x4_0[8];
> 	struct leaf_query_info	leaf_0x4_0_info;
> 	...
>     };
> 
> where for each 'struct leaf_0xN_M', N is the leaf number and M is the
> subleaf.
> 

I am finding the structure names a bit confusing. Can we make it
slightly more descriptive since they are directly used in common code?

How about struct leaf_0xN_sl_M or struct leaf_0xN_subl_M?

The actual struct names would be:
leaf_0x1_sl_0 or leaf_0x1_subl_0
leaf_0x4_sl_0 or leaf_0x4_subl_0

The variable names can obviously be simpler based on usage and context.

> The complete C99 bitfield listings of the 'leaf_0xN_M' structures is auto
> generated by the x86-cpuid-db project and is merged in parent commits at
> <asm/cpuid/leaves.h>.  This avoids using ugly bitwise operations on CPUID
> register output.
> 
> Let the CPUID_LEAF() macro generate an array of output storage entries
> for each leaf/subleaf combination.  An array is used to accommodate
> leaves which produce the same output format for a large subleaf range,
> which is typical for CPUID leaves enumerating hierarchical objects;
> e.g. leaf 0x4 cache topology enumeration, leaf 0xd XSAVE enumeration, and
> leaf 0x12 SGX Enclave Page Cache enumeration.  In the CPUID table snippet
> above, leaf 0x4 has 8 storage entries.
> 
> For each of the leaf/subleaf entries in the CPUID table, attach a
> 'leaf_query_info' leaf_0xN_M_info structure.  It is to be filled by the
> generic scanning logic filling the CPUID table.  For now, that info
> structure has one element: the number of filled slots in the leaf/subleaf
> storage array.
> 
> Define 'struct cpuid_table' for representing the actual CPUID table, and
> embed in it a 'struct cpuid_leaves' instance.  This way, global table
> data can be later added.
> 
> Embed an instance of that 'struct cpuid_table' in the CPU capability
> structure 'struct cpuinfo_x86'.  This way, centralized CPUID data can be
> accessed on early boot (through boot_cpu_data) and later on a per-CPU
> basis through the 'cpu_info' per-CPU capability structures.  Since
> multiple code paths dealing with 'struct cpuinfo_x86' assume that it has
> no embedded pointers, embedding the cpuid_table instance avoids creating
> special cases for no apparent benefit.
> 
> Define entries for leaf 0x0 and leaf 0x1 in the CPUID table.  Next
> commits will add generic scanning logic for filling the CPUID data.
> 

Avoid using "next commits". How about:

Generic scanning logic for filling the CPUID data will be added later.

> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>

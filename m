Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4DA1F1538
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749710062; cv=fail; b=mdRK83+KucSBy/mlhYlZ2//2KJisCB3CwBONiDsFAczkFNsr+UR/rkuTUhG/HxFMVeMUi3Cv/dKu9YaOzRQG2gRqPio2/uwyxjA+W8kA7BpzqArLwbwaFskvN0p88cTzjpB42vUocVJL/kJv5mVrMNfAQbw7hz8NnMVthoQjT+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749710062; c=relaxed/simple;
	bh=MBj7K8mt3Rrwz/j2HogYHCZeIL1aHJ7SypcIW/JEXT4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lhYeMz25mbtgGzFeld7W8/HCsVCvb0LN24NhmvplqhqM33rpJtBzi82c09nBE2m0nLBTONjKkH90L9QpYHxmJb5GVItSBTK1I0YlviidYvtQDV4U8VTiqk4CbGodZ+ucXjTP/55+k3x2VSV2P/vaUrbQx7RECkZsnnjtNw3dq4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiPzGjKp; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiPzGjKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749710060; x=1781246060;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MBj7K8mt3Rrwz/j2HogYHCZeIL1aHJ7SypcIW/JEXT4=;
  b=EiPzGjKpmAw4Upkh18FIAXLC5ewFHvKtwCr8I3pP1Lu1V6DmuijMNv5A
   ixiGFoxNmYmxnGttBCPucd1r2DULG07e3FO8I3DeuPTS8aPBu6ke3h21C
   NJsrBpm5+ZFE3zA1OMlJJ/Lm+Aev/YWzr2mhlX3Wozt8FYtvTPxbrJNFC
   OUaai4LAH9/X3+L9GitAUxI/LALX6LH8H7nD6xe0RhXYzRzeKoRK150/E
   0r/4hid09KQx8SmzvtPZdtDJD1YIRuLUPBic1iIWUaP0/+jdPcTu+HH14
   hdHcbpJdpJlvPgOi2tZrFiA4EP4rWFf0/itnjCdvlXPfnCwSLX0A27bz1
   w==;
X-CSE-ConnectionGUID: ksFWcOE5QiusD04GFeWh8Q==
X-CSE-MsgGUID: rwxwD9rGSnaJoSOXqeSOlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62526865"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="62526865"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:34:14 -0700
X-CSE-ConnectionGUID: SM7cVGRhS6qQfWBZtmY9Ng==
X-CSE-MsgGUID: qZuogb8uT/m0HGfM1LfCOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="147413830"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:34:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 23:34:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 23:34:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 23:34:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnSaFfTs7z78vk/IIecAMooRPCaHs7GIy0iE0dEY7AeZjW1pXliLykQ2aSfupqAiaB8wM3baYWtQemNJwyXWrunBW5fv6eLAYKrQCor+4xzwEo1DC4sNJd0kxCYdFOehXFl5wORvcFXtC56PViluM3DnFdjTaf6DQRuLFiPCM5Vo6RzkigEAzm8xCct5kgvc+M+I/Wkbvr9JtPdJK0xGXb4Qus0ESMSlsCa+lFBFsU4H1+IrqHOzVFjbueU23w1YyvH+h7OhXzAup829dESJz+//HKwNSL45FS/bxiMsx81cDCoApQBZRQkGHWumMco3gYrmWrMWK+tAWE4dhoPsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARASDd+ijlVUfI1iQIbCV/uzFPsGYFxtlJwLcpN6qE4=;
 b=qt3Q0thjioqPnD9/jtK80fzk1sJj+GbCjwqMVQPGGl06vJxgcVEJiVeLY6bnT1xRBVqgAZZhIv6BwwPA1qPqsIHICQQoOj4Lts+IDNx3ebiXw6ddDkWd5tBjA0L50rlS83doqj5l7PzeJakChpl8r6WcMmevjN6nbCs7NHmdl25b5vvbjCTPqqOl71hTpeIQ/dX807hdlL6mTAiz53aDdgZ2vobKAM+DkqD2pA2k3F8akdDJbUk5r0tnl6G9U3xJIkMtw1YB+dBkO7JuQQENSSIbQSqI/y2JCd5ZZpldAA1dyJqilA3DQM4kp7/bvjoATwQ/d2JTWIOautm8dObPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 12 Jun
 2025 06:34:07 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 06:34:06 +0000
Message-ID: <112c84e8-4116-448d-9c6c-89b0312cfc01@intel.com>
Date: Wed, 11 Jun 2025 23:34:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/its: Warn when microcode is old
Content-Language: en-US
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
References: <20250611-its-warn-v1-1-02eb9a75ce9c@linux.intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250611-its-warn-v1-1-02eb9a75ce9c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|SA3PR11MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 25594b32-2e06-4721-255a-08dda97b211f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkt0SW4xb3R4SGdtRHJGNnRsQjVCR1BzeFhwNnlaa3MrSCtPUTQyNUhvUmhu?=
 =?utf-8?B?eVlLTVFWZ3EyMG13RkdHUU1Gb3l1cWd2Q3JyeUlGRVVEdzlOU0FmTXhKaFdD?=
 =?utf-8?B?U3pndzBNMjlmalRRZ0RrRVk0eVRBL0oxazFTTk8vdm81VDZJcSsrc0lYUHJw?=
 =?utf-8?B?SHQyTjR3SFpIMjNoTlR1RnVZbmVPNCszZFp4RDk3bCs4Z3VpMk5UOVdXdkFx?=
 =?utf-8?B?bkwreG9ETlhkMXdnUnJFMkQ3K0RwbU1abVBrM3d3RTVscU9pQ0pmbERFRVk3?=
 =?utf-8?B?dVRqV3lvb3hQeXFpWjlxdnZHZkJ3ckFkN0FDN1lYWmp2TGc5bFFZaDhzOU9L?=
 =?utf-8?B?THJpWTlxcHNONWpIQ3NnbVBjQkplcEdLSjhZemJuMlBkdGdjb3lkQnoxd2lp?=
 =?utf-8?B?RytsMzVkUFNadVgvSURycnNCRE5kRW9ueTlxemZBQzA4bHhwVkVkREVUWXVT?=
 =?utf-8?B?KzFsd0lTMXJicmxON3pGSHE3VnN5cGprRkxmMzRYMXV6VkRiWE9rZWRYdk9x?=
 =?utf-8?B?ZVNnVjdXWU9sYmVrOHJCUGJhTVNrU2lJOG5GakJOSFdkVE9yQnBEMGNLYks0?=
 =?utf-8?B?NVdLR3dSQ3I5TEp1MDJESldSbVFNQkk2ZlNyNzdGREhUdHVtSE5uWGE1TjJT?=
 =?utf-8?B?RnBXMFVkSXZIM1JlM3BuT3pxQk5wd3RvZnFNRnRhWUYrWCtUNmNoNWMrWDg2?=
 =?utf-8?B?K2NWUElBQ2c5UW8wNFRacVV3WTlISm9ob3loaEdSYnpWSlZVd2t3RXlMdzlk?=
 =?utf-8?B?WDlEUHRUaU16TTVWWGZ4UjJmYVN2RGlmZGdYOGYxMkxFcUVEVTZrYm5TMG9B?=
 =?utf-8?B?ak02ai9NRTR5c1o1WmZkUVZnTTRzdFI1WnFiVjBxVmRsYTdPSCs1WWFGaUli?=
 =?utf-8?B?WlNocWpweTZDaVRzUTI4Tit0dUV0TlY3bmo4ZWVSa3V2WDBmd0VJVkV2bGZT?=
 =?utf-8?B?WHZJU2VvWGZsZ3NDK2tMcmp0VXRqL1FWdEthdi80ZUVwZm1pb1NxNkcxUTRU?=
 =?utf-8?B?dkNaNWx3V2g4NDRkeHhPK2ZwK0RPTEI2RzlIamlySkZoSUp0b3EvOTVFdXlL?=
 =?utf-8?B?cUtDMWhvbEV6U0hoQVhPN3ZxUE56aUNSSE5renV6SjB2bzhsNitEckdHV3ZI?=
 =?utf-8?B?WERtZ3p6dG1vNUFzTlZ3eDY5YWp0ZlhZbEtBdXJnbFdSalR3WXU2d2JWM0pM?=
 =?utf-8?B?d004NTdLc1A4ZkZTcjE4Sml2S0M3UmVJVzRjUEF4UFcrZGlEbkliZFdYZ0RX?=
 =?utf-8?B?dUhPT2pOVm5hbExwMmxtT3NXOVZuWjlzNXdoVlpWN3A2T2N4M1JVZWV5eFNS?=
 =?utf-8?B?RVE3czBtditYOTJPR2tzZkxnZlFiTEsxYkJXZTdkajJPMUQwd2QrZmZEVVdH?=
 =?utf-8?B?Tk55eFdxeDlhUCsxN1dVcDR3Q05Ha3JtNEt5cGFVZ1V6VVRLRGpmZzkrUDVE?=
 =?utf-8?B?bGlTQnAvbGhEUjdkTjJpcDVneTJad094L3B6end3UDlhUnpETENtSFJuOS9G?=
 =?utf-8?B?R3FCaVRPT3VKb090OUhFQkg5czZVOUdSMExaejdvTGxycEdtQXBpWkhEd2wx?=
 =?utf-8?B?dXRIcVBLUk1mZUViN2l4ZlVxd21OWTJaU2JYbVplNTg5TEJ4ZWY2aTBpY3V0?=
 =?utf-8?B?ZkFmL1dvVnA5S29nZ09QR2E4Zk11alBhUTl0UUdaRnl4RnFheUNyeENLRTR1?=
 =?utf-8?B?ZlAzTnpaSDRjeHZ0TFgxdWpXV0w4ZzMyeVJLSFFxTjVROTBvWm81d0NvK0ly?=
 =?utf-8?B?OFRsUVlGYmlMWjg1c2NHRG9kWUhTcWFwbDR0bm9pL3Z2a0lVMk5hc051aGpa?=
 =?utf-8?B?NzJ5aGcxYVlxV25FQXcwT3o0R1hCc2JSQWNzK2NTQ3ZlNTRDZGlKay92MXZi?=
 =?utf-8?B?QnNGSGxwWmlCaDJQQ1d5eU1jd2NrZ0NIVlZ2WEVpTVh5S2xDMFNTWm9tdnM2?=
 =?utf-8?Q?NYYCZRraT6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU5oQlZiN01MTWx5VUhCcGtucHhDNXpkbEtRRFlwRERLMUdqTnJXYkhSOHpJ?=
 =?utf-8?B?YUdLMlhFdDBYRndnQ2tleWlHV2FESUk1SUhWUXlpUVJ0Mk16TzV0ck9pY0Jj?=
 =?utf-8?B?TUdXZXhqSjAxWUFqZGNBYjY3SU5hYU1CdlNoRytsTG9hM3dvSVlHaG1RS1Jz?=
 =?utf-8?B?TStaL29tYmlTY2pMRFZxQkdGY1VnNnJUeFE2dmhNelNWY01XOUl6VzB5R3Vl?=
 =?utf-8?B?Tk45SHhzNUFNRldSSndDRlRLakhORlk1UzVuUHFKcU9hZHpxaWxGWXFWMkIv?=
 =?utf-8?B?bWZFWlNoSnFiSDA1MUx0VU5NbGVncjRCQmwzNHl6WmQ4MUFvOUM1YVcxN0Jm?=
 =?utf-8?B?Szg1N1FjOEg0a082WDRuelBEdGRxcDFYeEZSN0NNbERiODJ6TVlmcmNmd3M0?=
 =?utf-8?B?RmtFajFOMFBPeVZ5MzcrNmkraFJiQWMyK2NoQkxPcVU0Q2Z2VFNvbUpyRmJR?=
 =?utf-8?B?SVVlemVIY2VYTWhRMW1yWlFzKytYYUQ5L0dId3BtNWZoSzg1eDRhZlAvR3Zu?=
 =?utf-8?B?c2YzVmcxbUx6elJaUU4wZmszZGNObUhDenRqQlk3V285YVR1bmJkMEFNaTJl?=
 =?utf-8?B?K0ZZOGF0L05iZitHWFRwYVlSVVY1T2tBOUpIZlpJSTllUXUwVUdqbW0zaDFJ?=
 =?utf-8?B?cnhKUCt2ZHdNMXlFWnZqOXZpTDBuYllMRm96Y2Q0OUw2a0xEeSsvaHJsSzdw?=
 =?utf-8?B?Yjh4T1ZWQ0FNd1RvWWQvaFJKeWRnMVF2SkJXZ3JyL0xQMGR4UklINDJKbGZ1?=
 =?utf-8?B?UjZSTkhtVXZKYktLZnFyYjZkZGVZRGpWVGVIOG9Yd0dHWmRDWHo1dE9PNFJi?=
 =?utf-8?B?RGpIbjNkZGtJVEdDTFBGSTk1VzMzZGMvMXlmNDZrV2xPQnBoTHExUUduUlha?=
 =?utf-8?B?RE9adzFqT082aFRQTDFrdWE1NHY3bkpsbHlweUZNQis1UkZpVDlEQzF4VXJB?=
 =?utf-8?B?Nk1XWldQdDJHNlUxMTdGMWU5SFhJVVR3anZwUmNsdC9uaDRmRFZkZTdTcWpC?=
 =?utf-8?B?RjFBQ1FZcmE2SFJ1cVB1NWJndVVQRFhDMW1ORk5aSVF6WE5MODJtRGhUWk9J?=
 =?utf-8?B?OWc5WXVnYjNVeG8xMndQTytSV242YkREWGtRU3o1cTIrMzArUWxjbXdSWVIx?=
 =?utf-8?B?VThQaXJmSnFINlpKNFIySnZUeUpmelBXWnU1Qys1b0dRVVFYTFFYWmxHdktl?=
 =?utf-8?B?dXJ2QUsvbkJhQUZjQkVPQnBEVllMNlZpbW9CQ3BySjQxZG0yZkxMZmI3NUo3?=
 =?utf-8?B?UWFTdDFkOWxjVWZ2VHZiKzFIbUZiWXRROERaUzVEUmlSMTlKMjNyOENTZFZ6?=
 =?utf-8?B?OS80eVBGekdBL3NUL0t5cVdrNzdPTDdBQ0tmMVJVd1RzOG9ub1pGSjhUV1Vh?=
 =?utf-8?B?SGxJWEUyeUlaSmpxTGxtUXMwQVQ4SVo0UnN5dUYzMWRFYldRQVZLV3F5N2lC?=
 =?utf-8?B?YmliUTRReUxUbFRaOTBpSTB4TkNOL2VDN2QyMStOSWp4czdmQjJ5WFZUM2JN?=
 =?utf-8?B?a2lDVlcrcmZ5NUdEc0xqWHNIOExvempxajZoTDkwTGcrak94Wjl6SEJkUlFk?=
 =?utf-8?B?dWV6Y2QxYlNMVlBSUTZic0dpa1gzVys3dC8zaTdUT3hPR3JydTZwWmF0UmRU?=
 =?utf-8?B?VzR5a2g2MWhvYUdMYU1YZGcrbFA3bTB6ODQxWXN6YkJ5ZC9PQTlnNGVVZElR?=
 =?utf-8?B?MWVCbTlMMzZ2Y0crMDk4RkVPbkJSTXZnemEvdHZ4SG45MXNlRytrZnpUcHJ6?=
 =?utf-8?B?SEV4Qlk0Z2RlallkTHpZajg2U0ZRaGY2cHpySGpEY01yaUp3U2RoY1RucTNq?=
 =?utf-8?B?RDhmblRObWExQnRVSzgxd29UV1ZmMWo0eDd6Q1FhOU1BOW1FdjVVeWUrRmJW?=
 =?utf-8?B?K3lVZGJia0RsZlVrTk9IaUZTR0ZybDNqRkhBQ0svc2NoTVJvbXFVMlBPRjVy?=
 =?utf-8?B?Q1lycWtSSC9iWi9XRDlUTjhSbGZESzdQU1FQbm95NnVXMFBualVEcSt3Qk1t?=
 =?utf-8?B?S2tIYm9HWTk0Vk5MQmVMR2tTWnZKRDZ0N1FDbGdWNkJkUzVDU1diU1pWdjRP?=
 =?utf-8?B?MGU5NXIrUEtKQUJzeEcvS1JIRDFiMlFKVEducGdiOEpWbURQcGpML3UycnB6?=
 =?utf-8?Q?vesETwSzHLmaLxVo911hArJ/x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25594b32-2e06-4721-255a-08dda97b211f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 06:34:06.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQ0PV3WcgC2sW5kYGslTexakCtOpBs5lNOzyMkTcbH9I1us9USV80F1sLECY2o8BIapxJMNdzRUyZHtmK/Vkiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
X-OriginatorOrg: intel.com

On 6/11/2025 5:08 PM, Pawan Gupta wrote:
> A microcode update is required for IBPB to be effective against ITS. On
> Intel, X86_BUG_OLD_MICROCODE is set already when old microcode is detected.
> In such a case system is tainted and a warning is issued.
> 
> Also warn that userspace could be vulnerable to ITS.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 7f94e6a5497d9a2d312a76095e48d6b364565777..7aa3ae00e6b4daa5e42217b66c50cd46d6bcc115 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -1427,6 +1427,10 @@ static void __init its_select_mitigation(void)
>  		return;
>  	}
>  
> +	/* For IBPB to be effective against ITS */
> +	if (boot_cpu_has_bug(X86_BUG_OLD_MICROCODE))
> +		pr_warn("Old microcode, userspace may be vulnerable to ITS\n");
> +

Maybe I am missing something, but isn't "old" supposed to be an evolving
thing? I am not sure how old microcode can reliably (always) translate
to not effective against ITS.

Can you please provide more context? I feel the warning could be
misleading for userspace.



>  	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
>  	    !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)) {
>  		pr_err("RSB stuff mitigation not supported, using default\n");
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250611-its-warn-b292b10896e3
> 


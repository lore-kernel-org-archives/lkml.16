Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5213F219A71
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049298; cv=fail; b=uhc3cm03B8KkG0OwKjJckNgXo/2sG0V1rgSjLygsEQ/SO4piuvECwWEDGDFcbmQL80YpOIK9egcC6Z/vX9nMUAk/Lvyr1NCHXl0MEaj+peb+Lnms8PhuH5x+Xs6C9z0xap8l6n1sOIfgWbbUSnGP8ynwVCzMDcT98WIbIzTpNdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049298; c=relaxed/simple;
	bh=KYo7JIL5xk60J/bVRIzCKl4oucSUmtk0yYDVluEq8zM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p2cFPNDif3lWrba22BVpZzyTtzdYX+2w8cpLwWnnnuPdyFaUVcBvjgx9w+iGuUZmsRwk4lZLwMFgWl6pEOAyhnyFu3tGq4fIvhUq5YF9OCjdnkcf+RG1YyEei9NmnXv/Ntb3T6e0mc4NEe9WcPvpy0VT0vOpqiRVwh4z13A2KOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkPJ/9qS; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkPJ/9qS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744049296; x=1775585296;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KYo7JIL5xk60J/bVRIzCKl4oucSUmtk0yYDVluEq8zM=;
  b=HkPJ/9qSMNPQcFuCC8uC6lIlThW8urmfAK2yH4np3GozGTnVNiujwoQ7
   U7L0rkE5p6srHUpFDqMrtEg03OAtXPFc4RDvgdm2yQl6y1nXGZac72Nmh
   SzxXlwilibK0iHs4VXRHcKJP1kdC5sAFIi0S0GGgqsPA8QIk00UyW0HQR
   zCFUaf7weZJHSNVi9ZzNCwAU5xB66+8FEib1a2bSN7wjwdMSMXvSs0cNO
   CzL5x6EZo0xE/TB6lCK82w/qlVmtzGnzZ8Bl7HxZiv61fkKRfaN5asgD2
   /VEg0SpocZA/60SRZ3mfA6rZIEhR7fklO7nZ474S1bCFDiAEn5MLKInt9
   g==;
X-CSE-ConnectionGUID: MMdPiVb1S4aMZB1n7rFweg==
X-CSE-MsgGUID: PC5l10WuQXuKt0JL+v/FfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62852259"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62852259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:08:15 -0700
X-CSE-ConnectionGUID: sE8Q0I7TRPekp/vJLkNr/Q==
X-CSE-MsgGUID: 0XRuXUBGTt6Gt5NFtCkWTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128561751"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Apr 2025 11:08:16 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 7 Apr 2025 11:08:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 7 Apr 2025 11:08:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 11:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz+n+0UogAkDrU8fyLfkbTplQGkzPtfGkwwuL0l/8MifxTHPsQLY2d9/RcNus5IAJ472nhYvBfSGdIUYo5tpcveKBVwgrbmyNiRT28GjHd4nVMKvnoPA6QrGdC/CftDgxIsPR5gJ2G/29v0ljIyVzVNOzki2NP0BC7n5d3KtwpTGc6VpujcL0Nf3dShokBO/weIrEtvS3hSqS7jjypqlcuu8etqnT0FrPER7q16lqyqEe9WY61UILNPLFG8vEUwTELYDbp58h1fljkILHA4dxy755dyqLS6b3uwCEZrel0sGKqBKV0QGxOyjzNDLqfF92pqTEldjmR1vTWDDFdqnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qna+DjGkWwPP60Q/b9mjkx2BGmV9ejr6uWvTGYExpII=;
 b=ukazpx7IlrayPevXO+HyaE6RWciyxGxeuTnSxzYlzrwjoAkPjBXHhIB8APx6mz2N7HOT+z/7xK9QnC18a5ma6l+UHxMFN79Ew9RetPFslBcvCbcrPDiusKO4FRVdJtrF8I9qwNt/qVIVgbcAuQLRTnFYGEe2Gt3iLSsUjsv97H0gPCBYfhPQDvnSHz6W8hQlzrEDKa/XpwQlNFTrerdiaofj3A/rq9HKkcB/rQrmLLqecwsmxglKPb81LgMCjZHfQ4G3wRQOiuXGmlApkQETN55J2A/IYgnYuYxHq2sC2OFfJkem1NlchCSSGqYVA7Obe7im+HyjKkco43O1St2P2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 18:08:10 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 18:08:10 +0000
Message-ID: <0b9b1239-8514-4a8d-b991-73f371a6aebf@intel.com>
Date: Mon, 7 Apr 2025 11:08:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of
 kernfs_node::name
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <babu.moger@amd.com>, "Sebastian Andrzej
 Siewior" <bigeasy@linutronix.de>
References: <20250213145023.2820193-7-bigeasy@linutronix.de>
 <20250407124637.2433230-1-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250407124637.2433230-1-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0221.namprd04.prod.outlook.com
 (2603:10b6:303:87::16) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW4PR11MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a6915d-2464-4b90-26c6-08dd75ff2792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alB6K1hBOFZsRlNCNlB0Zzk0VzJDOEJjYWxzWUNOWGhVSlJMbHZHc0dGN0Ev?=
 =?utf-8?B?WVBQdTc3akJLYVk5M29MdHpDVnZ4M054aHo4aUFzNHFIQVlyRkFWT2ZpTmE5?=
 =?utf-8?B?aFdjMWJ1NXdGN1N6Qk1HdDdkRmNBMDlyOXlRV3dkS3hrVStGTmRUSlVaZTJ1?=
 =?utf-8?B?MDNGZjVudHh0NnZPbTFtbWdnYTdiVXRLckZRUVBBYU1PWVRiaEg1NlN0WDYr?=
 =?utf-8?B?SDk3ajg2cWNSSkpGV29HWUFKaHpaODVIK1htOHdFWWdwUnlOamF6K3NuZWpL?=
 =?utf-8?B?cmNqR2ZYU3Y5NDhBRnY5R0ZVVzhQZXZuZS8yYm9nRlQraUZrT0JvVGpqMllL?=
 =?utf-8?B?TjdPd0F2MUc3ZVcxVElDaXpna1Y3cE9XZ09iZ3Y4MzlYQXgrcGdTZFl3ZGFv?=
 =?utf-8?B?andOL2ZBYW5XNFd2WlRYTWZ4RmRZbElxZ2Y4R2E1RXFielVBbXozTUNnZ25s?=
 =?utf-8?B?dVhDWXVMWkhDNWhBOEpRQU5QRkVpdlVkRSsxZTVLMTFZSnlMdHVWRzQ3UFND?=
 =?utf-8?B?Mngxb00wa1N0L3VWYVd3RnRnaGdtVHd5d1psTGtPck02dW9zUnpUdWxFNjdI?=
 =?utf-8?B?aTFVVlZBWVY2WUt5aTQzaUdhdERlYTZRUldQRUlmUzJVV3lvVlNzaG16UFhF?=
 =?utf-8?B?cHVZVkRmeWU1Mys4N3RKSDc3UWphczFRUE5HeHFSbDlsU04vY2dmZm5qRnVo?=
 =?utf-8?B?WE56MVFaL0g3ZGRYKzM1ckNuWE9uVEdpVGIrVjNDYmY5bTIrWmdOUGVuMGpB?=
 =?utf-8?B?RFlBVzVtMDBka1c0WjF1d0h0N3Z4SGhCZ3lsUHdndEFQMlBKT09qVG01QnJL?=
 =?utf-8?B?NXVwMUhlcGtKU3FlaE1MRGtjV1VZcXNuN0p6N3VVU0hUNlFlOVpkWnNwMEpt?=
 =?utf-8?B?Qkt1K0IwQ1VVUy9YTHNPVm5jVnlSWitkcFdqMm9yZjIvTnBMemE1VG1OOXdi?=
 =?utf-8?B?K3BXNnpRWDQ3emVtaXVVTG1zdVI2bmZaRVNRRVdKTHhjM3pZQnhIdkRNeGhY?=
 =?utf-8?B?SWFPOVdRYW11N3lkdnpPY1Uyb0pjdHBDbEFkL3MrUk8yQm9ZZHU1WENqRi91?=
 =?utf-8?B?NmZNenJCZWJjdUhlMlBrRTY1Ym9aTkdBVDlDaHB0djBoRDJReW14Sm1PUG9K?=
 =?utf-8?B?TURXN1BIN1FHSGZCeTJSU0Y1aXNpcVpRcFZ2MmhYRVEycFJEa2hNZG5MT3RP?=
 =?utf-8?B?eVNyM1hHdFFCQU1raHRVNHUvRUVLT2JvMEdKN3dmOXFWM2o0c0xWTjV3V2k0?=
 =?utf-8?B?VWsvRk5OdHArNXMyb1JEbUFDR0lveXNaTkZ1UllZb29OK0FUdDFSNGNiTnE4?=
 =?utf-8?B?VE9FVkVvek5MSmlqeUU2bHZwa0JKVTRCK0VsaG1YTG9la2d0US9vVGZiQ2Yv?=
 =?utf-8?B?MlV3S0pCSFBKbzJYa002ZjBmQkNYQmk2aDhPaFo0RFVqUkpxY0hZMFhWOW8v?=
 =?utf-8?B?bGY0RjVaYlZmVzVUNGlaV01COVFBbGJ6Ukx1cXM1ZTBCcFFxQmIwc3BjOUVs?=
 =?utf-8?B?cHBBRm9BOE9rRFRjVklIVmdsQ1FQaGhiY3Y3UjliMlc3azNZNHBQa2hJTmJO?=
 =?utf-8?B?VG9SbjNwRmJTU2JoWWhFaVRtTkd3VEQ0ZWVIbVZ1TEtQOHNYUTdvZHFoR2Fp?=
 =?utf-8?B?TURXTTg0TW5mTGprbS8yc3NtUFNBMnlGS2R0WTQ5MldWYW9XWUlQY0txQ2Rx?=
 =?utf-8?B?TnhmNTlYTlpuMGMxUXpsbGxnRlYwTTl1UkROU1Q1NjhPeTJDMUZGai83UG5R?=
 =?utf-8?B?NHRFOW1TVEgrUTFKMldWMTl4M2FIRjRBSFJ6ZjUxWTRrdkZuaVV4aCtnZGdD?=
 =?utf-8?B?dXg1b3U0NGFOVDd6aXRXeDlsTE1jTko0SWZUdkt0WFB2c1N6c08yMW1HNjZF?=
 =?utf-8?Q?/MDccERzG2XWu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVVSWkhucUNpQnVYazJ2UFN3QkxhNmh1Nkp0dk40SHhic2pnRmlpazFDNm5G?=
 =?utf-8?B?MXhkYnZOY3VudWdDak5icmlhekp6YUJreWk2YWovUFBUVllYTnA4YnRpU1hF?=
 =?utf-8?B?TUdwbXMrUHNDUGx0eU9xTkUrSWs1bEZOdVhYQlhvcVpZVlEveVQvUCtUcXlH?=
 =?utf-8?B?TlkxQUVYZ0lLQktvQ0loR3p1RWJ0Y0NLNUlzajIxYmV1cTFvenBDOUZhdkxr?=
 =?utf-8?B?YVlIV0R5L2dKc2x6d3FkV1d5MG1XRTRjRU41YlIrTUw0cEQzZzFtU2kvNzFs?=
 =?utf-8?B?d0FkVytMamEzakNUVG90RjdqazBEREdlc0NBQXFZRTNIQmtsU1hTT1pZbmdq?=
 =?utf-8?B?QXRqeWVnaGcxOGpReEtnalNzT2lKSzVwZUVHK3UzMkdnK1JEbGRhTVJqZ0Ra?=
 =?utf-8?B?YURrUElmeUlZQm45SkNkREhGclJWQUNyVzFlRVpwQlNIVzJmcXMvMCt1RkhH?=
 =?utf-8?B?dW42MlMrTldjRFVua3RuTWJIVEprcGNiUHJaSnNxV1ZyRlBGVFR1NGRXSFFH?=
 =?utf-8?B?eitTdnYvV2pXemM1SEVKRmg4a1BYOG0ydE1EQjdUcXZIUGlLWThxWTVnT2JF?=
 =?utf-8?B?Sk9neE01ck93VUtDdExRVDJFb2ljeEZtaGowTk1hZ082RGdzWkpGSE9wUGZL?=
 =?utf-8?B?Wjlxb2IrM2R1VXRtT2VpYkpHRUEvTGF1N2hoMVQzZ3hsNHZ4TWpkbSs2Nld0?=
 =?utf-8?B?aUZsVnY4VVhkbEJqdU9CR05LM2xaYklVeUl1ZkRlOFAxL0NEeWVyY3h2Q2lo?=
 =?utf-8?B?MmpyNzRIZVJicytFS2liQWpxdHdDZXNVeWpwWWVueGVOa24wY2FtekVlcTBM?=
 =?utf-8?B?YjFNWTAwNENMMmtxWHdRSDdZNFhpdTVrSmZVMGVHclduVmQxd2hrQ1FEYjND?=
 =?utf-8?B?VGtKNHNvQWk5SWk1TFkxQW5rczVvS2tjMkV3TFQ2bWFMbE9helk3d2paWm9l?=
 =?utf-8?B?VmVjWHRHa1hhZ0k5TldYTFJodUQ5ZURRMStqd2ZkN3J2ak9HZXZhdnFjYUNX?=
 =?utf-8?B?UVk0Z0V1UVVMTFhUaGtzc3lSdmdpak5LejFhNlkxcThXS2hLUWgzRG5OeGZ4?=
 =?utf-8?B?R3dzU0UzQkd1N09RekluVGk1eGFEN1hiazd6bUkvVDBNOE5MOVU0b1dDUG82?=
 =?utf-8?B?WVJEM25vTU1IK21TVXdzNXBJTHNGQWx3a09xbEFFeEFMbmxXTllFRnEvbVBI?=
 =?utf-8?B?UlpVS3BEYUlDeFV6MUVjNnhsZ2RNVzJPYmozdFlsV1oxbklGTUM1RUhUbU9n?=
 =?utf-8?B?QjJ6YlExLzNYbzQzamcvajdxSWh3R1dtbXNRT080TzJReVpiWEFKb1RScUV0?=
 =?utf-8?B?NWthV3Y3OFFwWkdrWjBSYnB1NGtIY0EwOENrSFhoWFNuZ0ZjanhCSW4rZFZx?=
 =?utf-8?B?VHZoSWErc0ZIUVA3Sm13aXhWV29TVTJHMHR4SXB1N3ZTVzBIem9tSW01UzEw?=
 =?utf-8?B?QUdDS0dySlpXcDZHSEk1ZGhsaHFFK3dkVEtYN080VkVmaER1QWlBQWdPVmN0?=
 =?utf-8?B?YUZ4ejh3UEswSHhHZERTa003bG92azFzQ2dZSExlSElMV3V6WDJERTlvYzRR?=
 =?utf-8?B?MW1oUTFPUzQxMXdEcEFyWDNnZjA2bVk0SGFvaEgzTlVXcXloYWoyT2VBeDlJ?=
 =?utf-8?B?c1NCU0J6eS9YQkxvaldKK2dQSGc1WGJqRVlNQWN1ZStGMlJnN3ZXVHJrNzh0?=
 =?utf-8?B?a05FOWp6ek1aRTJGR0thQ2FPVnczb1B6cnBrYWUzVm5TUlJ2eVFVSGtHbzV0?=
 =?utf-8?B?NHNFb3lRR2xOVEJTM3NvLzJhUGdPcTBIWVhCVEF1SG5VUDBVeEJVRWcyVzlx?=
 =?utf-8?B?eDNvQWZxcGRGdko0b283cjFsWVZCUzhjMVRJNWN6UGVaZWgxNjJjeEJzTW93?=
 =?utf-8?B?ODl6UFlWempoa0lrMDVzMkZDaXkrWng0YW1wem5LOE1xaGVPNkw5M2h6VENs?=
 =?utf-8?B?dzFOMWI3aTFaWjRjZUtaWlpRU3NmRkxkVmxGcTA2cDUreWFBS3ROYW1jSnF1?=
 =?utf-8?B?VDE5SzBySFh4SG9kcitFemtoaU9UckdZUjg4Zm56NWF1Q0piUGZObUh0cm8x?=
 =?utf-8?B?dlpBeExMTHZoSHhEbjNnUlVxZENuWGVpbDJoNXI3Y1pIQTJhZ3lqdlg5cGZm?=
 =?utf-8?B?RmxpQUZrZkQwN0VuVUE5OTd2L1ZCdHppTUpVK0NxT2hFRllvSVp4SWFuamlE?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a6915d-2464-4b90-26c6-08dd75ff2792
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:08:10.1048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFgfUip0JvJR+K/XiWIyYVH2F2/uU3NMUg3OAs6SVwn5AbiXJ3L2WMFFbTuTNnyQDfyRwDDCoVoKVVp/DocniGMnKYN4jxqdAgOek/4pa68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
X-OriginatorOrg: intel.com

Hi James,

On 4/7/25 5:46 AM, James Morse wrote:
> Since commit 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name."),
> a helper rdt_kn_name() that checks that rdtgroup_mutex is held has been
> used for all accesses to the kernfs node name.
> 
> rdtgroup_mkdir() uses the name to determine if a valid monitor group is
> being created by checking the parent name is "mon_groups". This is done
> without holding rdtgroup_mutex, and now triggers the following warning:
> | WARNING: suspicious RCU usage
> | 6.15.0-rc1 #4465 Tainted: G            E
> | -----------------------------
> | arch/x86/kernel/cpu/resctrl/internal.h:408 suspicious rcu_dereference_check() usage!
> [...]
> | Call Trace:
> |  <TASK>
> |  dump_stack_lvl+0x6c/0xa0
> |  lockdep_rcu_suspicious.cold+0x4e/0x96
> |  is_mon_groups+0xba/0xd0
> |  rdtgroup_mkdir+0x118/0x1970
> |  kernfs_iop_mkdir+0xfa/0x1a0
> |  vfs_mkdir+0x456/0x760
> |  do_mkdirat+0x257/0x310
> |  __x64_sys_mkdir+0xd4/0x120
> |  do_syscall_64+0x6d/0x150
> |  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Creating a control or monitor group calls mkdir_rdt_prepare(), which uses
> rdtgroup_kn_lock_live() to take the rdtgroup_mutex.
> 
> To avoid taking and dropping the lock, move the check for the monitor group
> name and position into mkdir_rdt_prepare() so that it occurs under
> rdtgroup_mutex. Hoist is_mon_groups() earlier in the file.
> 
> CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
> Signed-off-by: James Morse <james.morse@arm.com>
> ---

Thank you very much.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette


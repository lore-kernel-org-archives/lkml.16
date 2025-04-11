Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6726FA4E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744334573; cv=fail; b=eMBgoHzJudhvvA7Kh0++8wMMYvZZS/y6toLifgGPO553eMZj8dgOI/BoRSE42NQVTF56IJNUkvRybQi//sIjHwnHTsD0dL2NwZpF60Ubr2cZ+K4PrOaUHL24+RYo0s5TfZSlvuYZyfLOdFkasiugtu+hnm8pj+PQPC+lcq0U7hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744334573; c=relaxed/simple;
	bh=H6do9tXLosm7TMpx2eyOGFesHNpK4wZoeOU+oa8AP0k=;
	h=Subject:From:To:CC:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NJvBuK1p042deMJECB31BlsfQCV/QQH81xXmv72ilCFq5ocRfZ8TQgAZyLCdWWQWMPZFTkHUiquh4WCpXsn+0ANkZFzzbVfU0xnKA1j5/wZsBUUHY9is9OptPO9fXQYJF+wcR00ZJbcFfKkOYJdmRaC+ffgyLcdG/GMjl5o+aMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9Sdwnxv; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9Sdwnxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744334571; x=1775870571;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=H6do9tXLosm7TMpx2eyOGFesHNpK4wZoeOU+oa8AP0k=;
  b=K9Sdwnxvx5D6Ioa/+pxI/gMUB7kihrHKyCs3bWHgX6tB6cusomeztVNG
   oMxxNZSHEELr7HhYKL69rpAZfzfEdhBxenC7i9Mk4Z1cKzHjKID/enhUa
   Vo2lg1S2tTq+q+LMCV7TjbTkoHVEWjY5uJNFNNP4Vj1pCQKVfb5dSKbfj
   5humfie2/0b9KAYdRm5Y+rRbhX2/ZHqB9T6j5WGFq9JsdmtHn/VBkcY7Z
   NlMFTSc0ZB8fW1uAgQNVe/wM85EPDfqafD652kCd96rH1N+ZW9kdJt+bY
   J/9U2LpwqfHTMlnwYKfxwrqTq0aZwClK2VWtHaN0T6DBWfRKC2q5YYbER
   w==;
X-CSE-ConnectionGUID: QO1IZTORQ6KsjhZ/bqrfSA==
X-CSE-MsgGUID: HdUXBuRJR5Guhna0IsYdSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45969847"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45969847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 18:22:51 -0700
X-CSE-ConnectionGUID: rHtQavnvSIOslcYoUYJISg==
X-CSE-MsgGUID: 1Xr/rRPuRoa+tCA4jY9LEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="133920557"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 18:22:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 18:22:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 18:22:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 18:22:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOlnvzVvlyEmIuQW9gYAUD6drSoLr3DegnjK5LrhdYIG0Z2NbUZ9f9QgSzbZKzANs3NkrYRiq47las0T8GkaP1gN6g86w1YPfh173ogSh57JF+JhQvAnXY3BeRZ1R5dEm+b8HJy9zS40SNjhTdHDkeCA74wLtzn0Bn2JBG0Mt4e3Zi2cM8RL9jb87ojKTXb8mbyjiU1fhSSCTUsFF/t17R3vGMGxJHixSn8Iio1c7WEcJfVqXTiwA/rm91QfilfSrdn3TcRLPuIx4LbMtAUWvlIu1yH2xhcijBrR1xQLpk17eFev6gJLQBM8Mnj0nBt/txD2f0JRX+e/JrFm0+2d6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eRl7Wz9do+ZFTzFOX+6Wv8a7tsKnNpYiAYOfGwEmPk=;
 b=Hp0IlGk13ICfGjePYU6X41lK2E1nmCILeM4FA2xVH6VmEwr4QsjCgtVdySF+gJjjIZwcMVh4hvABgyHKcsd1eeax8BPMnI+JQ7nxJZ7ZiEaehA8cIrJaFLU+ZFiKCIqm5RYxQGwy11dbEovSfpCmz/hSSTAp8Qnb1l7SDvevmHdKUCUAH/Ax1aO8GgsfvJo/XIsh2fTqiSb+KFFyoMUp9ANujyfqa0bgDngZJM40SLimxvhxrZdtxo50siYNRU2pkKHA6Ad7pT+8NurPRiSXFrj6q0jkHXV8o08R/JBO/kmquv3gjt46DLXYGfIpwSLx4LFgKTGkQy9OTkXM1G8KwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Fri, 11 Apr
 2025 01:22:25 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 01:22:25 +0000
Subject: [PATCH v2 1/3] x86/devmem: Remove duplicate range_is_allowed()
 definition
From: Dan Williams <dan.j.williams@intel.com>
To: <dave.hansen@linux.intel.com>
CC: Ingo Molnar <mingo@kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 10 Apr 2025 18:22:23 -0700
Message-ID: <174433454327.924142.13014632539194148381.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f59163-d44b-4952-b030-08dd78975144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFJWL0t3WlZjcEdrZ3c4V1VRdEZsVHdQUnZKcC9tRzJmbmtOeEpNOVpOQ1pr?=
 =?utf-8?B?ejBUNVFFNWNLVHFiZ2xUdGI2Z3E0SHRPZnpUcnNNc0xwTDhyMHZBNFBFVndF?=
 =?utf-8?B?NWJNRURWKy9Iamx5UFg4NnA3TGFCVEFNREh0NUsvQ2Jta2QreWtQOUN6YXp5?=
 =?utf-8?B?dFhhZkltUnFHVEtqWGJ1VHJiSytGZXVSYnNDNEh4K01BaDVhYlJVenlKT1J0?=
 =?utf-8?B?TFlUYVNFRFMxZnA2bWNnUXQzOGlzS01BSkcySkpTWW53cnc4WXd0YXMvb0RX?=
 =?utf-8?B?RWZEbkJLZ0h0Skc5VEhQdGZKUkxQdU4wT1lSZWhzN0l5c2NEaFAzQkxQakdy?=
 =?utf-8?B?Z3NhMkZuaUQyM1VwcHh2SE1KeE1lYzZrcXd5WXJXd0F4TGhnWEg1dXFMUGli?=
 =?utf-8?B?eUpaejFPSjR6YzFPNjBhMTZnVXA4ZlZUR0p1eXB4R1k3dGxLaFgySUsvQ0lU?=
 =?utf-8?B?aU1neFZsU3BhcjV3Q09BUHE5WWdvL0pib1dHemYxYW9HT3AvWERGalJQNjVo?=
 =?utf-8?B?ZlZDS0hHZHA5dGszYS93T1NPZ21SRWdWRFl4aWxnZWgrUDBXb3BsWTc0c2Ja?=
 =?utf-8?B?TG9IM1Z2emR5RjREbU5uSEZ0cU9mUmlTQTlzNFowU2o3ejFjK2hwMFp3RWF3?=
 =?utf-8?B?N0tSZXN4NEpDT3c4dGkyclZyRUJQTThJWE45NkRnT2V2U3lnOS9CUmRQcXdw?=
 =?utf-8?B?U2gxTGVxejRkRXErNlExT2ZmS05tN2lCTFo3R2pjZkxNUHl1UGtDd25KOWZt?=
 =?utf-8?B?bWNTbnkwcCtHM1dCSGF1aDZoYUhsQUdiMkkzeWVJYWRSc1MxOThrVG9ZcGVp?=
 =?utf-8?B?a2VhanBFaVFUR0VISkFXRXBnRGx1V0xtU09zWkJBZjlyVE5taG1taEJlR3Ay?=
 =?utf-8?B?eW5iZXc1Myt1ZHlEcmN5YXkyMERFUStxVUFvRW05Mm1IN0gwdGdaMm1TMWUz?=
 =?utf-8?B?UE93OTkrRmhWcmVia2JxbnYwS3phYndVem40aDdyaVpMcTREVy9jSEtBRFl3?=
 =?utf-8?B?OUJhd1Z6ZGhGVVFVN0xUNC9Id2VzTzFqQTdkQlV0UWk2R0wxU1A2TDlQOXFE?=
 =?utf-8?B?Ti9iU1ZIZGxnTk5PaVVSZlg3U3U2bm5MeFYxNnJRNkVSZDduQ0luWUtqYXFi?=
 =?utf-8?B?ZHNiZ2g5SS9MTXFzWlRIQ201THFHUS9ybktqb2w2alRHWFNKVGFYQ3l6Zkk3?=
 =?utf-8?B?clRpeGJFMlpyQ0F4UWI2dUw3QlBNendnZHR6SVp4RHBoVGh0WjBvcmlJTjNU?=
 =?utf-8?B?TVdyVHR6RTFIK0FYaFpWeGlRUWtkZ3I1OW5EVUoxU1pkbUxuZ1ZZM1Bvb2Q5?=
 =?utf-8?B?YW9ld0lNMExhTW5sbFdMclduV0xDYWhZMGZkTkV1OEVyRnkzMnZXK0hENkp3?=
 =?utf-8?B?RDhjaDhqVGgrM2Y1NjR0YTNTMGhJL3BVMDFUeTV5RXFzWEdIcDIvdUliNVVI?=
 =?utf-8?B?L2RTUVQybmVVOFFyYTB4VmNiZmlpK3grcmFpazF6VUpwS21keVhQelB6NXhy?=
 =?utf-8?B?WHpqRnpidzFaOXVmUGM3TjNULzBZNnVzMkpuNHlSS3dwZW1KSS9MUDFFWXNu?=
 =?utf-8?B?Rzd6QXp3bnhhSmVRWXBQKzNNbzA4dkZXRHdJS2JOd1oySE53NFE0eTFqdFBM?=
 =?utf-8?B?bWFJSnh0VS95QTR5TldEb2pLN3J2bS8wRGxCSW13Q205V3pXWlN6Y0VpZTJZ?=
 =?utf-8?B?YVFTNXptQXMvL2t0VmVVK2dhRUE3MTNJWTZRN2JoS3p4YnFWUFNkMW5xbG1k?=
 =?utf-8?B?NTVhcGxia3NxV20welhVbnRXUGVEQmFJR2NJSDl2M2FtQW9QU0ROaWJxemhK?=
 =?utf-8?B?Smx3T05TR29EcG9Reml5MUFjVkJTaGEyQnVxUnhGcy9nem1TcmFyZi81ck56?=
 =?utf-8?B?QjkydFVQMXNsaTdEYXFLaDFzbnYvclZEV09XSEhQK0RhZy85dEFXTmUvc2NK?=
 =?utf-8?Q?ioxBhDSByOc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGpvVUhqbDU0c2lLR0cwdnV2b2NSWFhQa3FUR3F2R0l0K202NEVacloxdEo2?=
 =?utf-8?B?MVV1UXRid1U3WDZLWmoxOFIvdndzSGhlQmVYM2kxQ0RpZmhIcUhOVjlYYzFP?=
 =?utf-8?B?M2ZkSHN1V0R6a2xmcklHMWQ3Slk3WHJVMXpuSHZtaExqdkFMakt6Q2xqVlBy?=
 =?utf-8?B?K05heTlNdzlHRDFsU2xmUi9zLzM5WVhYQzQxK0E0eDJvRHNISVlrNSs3N3Jy?=
 =?utf-8?B?d3FIT2oxUHVQQjRlRmZ3NGQ2NzRTRVBNditzemQ2QmhiQUZDWDRZLzhHUGdu?=
 =?utf-8?B?UGNBM2JkWVdJVTFmMEtuZ3ZKRU9DNWpXc2hhNDVZUElwd1A1K1lFeGxkVkp3?=
 =?utf-8?B?M3M5T0F0ak5PelYza3pid01weU42MG1ndnpBKzBJRVZYallvbmhGeUFnRXpp?=
 =?utf-8?B?TW9MZnRIWUljMXAvbE5QRjJQNXpwa1ArV3FnZE1MT1J4NkFZRDNKVGswazEz?=
 =?utf-8?B?dEVmcWc0MUZxVkdhM1J3djY5ZWtFTTdSY2ZtRWVsZXlMSytKRy83VmpMeFR2?=
 =?utf-8?B?azRhRU94bGo2UVFqMi9vRFpUdUoyZEQ3czFDeU43QW1ta1FaSVdXMG5HTGR6?=
 =?utf-8?B?TVdHWFhsTzVSeEVEMVRjZXV3NFprUmhlNnptMmhNeXNtU1VqQTVEU09laVF1?=
 =?utf-8?B?UzFQVHFNem4zK21ZdE04R1Q3Mit1c1VWRnNsMkNMYzdkcGRGZXdiTjlFR0Vo?=
 =?utf-8?B?Vm45bkprb0xKM2IrL2pZVXFvY2VrbUExUy8wWHZMbFk5MzNPQ1BRdk01SEhW?=
 =?utf-8?B?L0NGb3EzWkJ3Q2RCUmhwUDhZRldEM3FUbzM4eXAxSTZqa3l5Z2xtMngrQnNI?=
 =?utf-8?B?STgzY2U2MDhqU3JYeEZWR0J1ekVFdXVFMENuRE5FZXlIY3UwUzgyWXo1anNi?=
 =?utf-8?B?alNhTi8zdnU1cjU4c2dINmkyTjRuVGNEV2JBSUNldlkyb012U2VEaEdqdTd0?=
 =?utf-8?B?aUtZeUNxSDJ4M1RzeU94Q2gzZGZWdmtlYmJtMXhlU2Q0TFlKRjhabUVHcjNH?=
 =?utf-8?B?M1dXUWdyODlLMUFuK3FrQUQxVFE1UWxJdVExTG5Gd1BLS1hoUVFwSVM2OW8y?=
 =?utf-8?B?NDRYZ0MyeklvS3FqUHRJdjJXMlVucmd1T25kc0ZGZXFWb200VXpIOENpWmFh?=
 =?utf-8?B?VVROVGlUYnpQeURvdWIyNzlxYUM1amZLeVdVZGp6MnVjTElBN2hmTGVkVEtR?=
 =?utf-8?B?OGdpWm5NQ0NoWHFDVk1ZMlVxUHpPRlNObVMxQjlmVDN6TGVpSHQ3a0NNS0du?=
 =?utf-8?B?R0llclc5U05IQ3BJSDgyQ25MeTltZUd6enZDMzZWaUgwY3YyN0RRb290clkr?=
 =?utf-8?B?eXlmeXBDVFU5RU5ZemxKL3JxNUhweno0dW0xdkw5RDdFR2ZYZk51emx1bXd5?=
 =?utf-8?B?ZndlU1g0WldWMjVsWjEybklhMU0vWlRwVXQrUldGZVQ3WnFndDgyTjhXakFJ?=
 =?utf-8?B?bnVlOHoxbUpuWStIRy96blovOUV1UWxuTGxVekNNdDhYK1ZveXpSak4zUVNm?=
 =?utf-8?B?QTBOR0kwRWNjV3lkVDJlYXNGTy9tc3ZLczU3UWtuam95SzlUbmtqdzJtdzQ0?=
 =?utf-8?B?STBRL2FWN25iK1ZadU5pOGtYTm5rNU9Hck1BeDRROUtNdFJJVmY5bXpYRlFh?=
 =?utf-8?B?UlJtandDUG8zNmVCTnkxMkZ2N1lkVEtvQkFuVXFwa1RGTzBmeHp4SHp4Y0F5?=
 =?utf-8?B?TWR1ZE5QT0RacHhiZkVBWWdoc3FwaGxOOG85YmVtbHFnUTBhQit1a2J2cWhw?=
 =?utf-8?B?dE9qZnZjckNkeGJ0dHpFeFlwbGgzc1BneXluSkg0dnFLNTh6VHR2TTk3UitG?=
 =?utf-8?B?SStwVENJdzY4Rnk2WVVRQzJJdXlheVdCNnJtcEpWMHE2bUtvTTBncjZJSWIr?=
 =?utf-8?B?YTFaUWVmcjRwMGpEZEpSTjB5WHFoUW1qakM0eFMvUkdmQTR4dkVxZy9XbjQ1?=
 =?utf-8?B?ejdLQU5qRkhqd2o4akt1YnNYTU9OLzlWV1RnZER5YlpZYkxMTVpWN0dPK3BC?=
 =?utf-8?B?dEJESWlVQ1d4ZDQ1eXF5VEdmQ2thWWxyb1pFb3ZSaUVDdXM0bTY5cW1SUWRM?=
 =?utf-8?B?dHdoUHRabmJXL2I0aThiZVdQZiszZDFseDRveStWUGRqV2pyeHlQeU5hMSty?=
 =?utf-8?B?NjFUYXpwSHg3MGtUWUgyc3B0RmtJdW0vbEcyaEFySFhIYWxKMHA1VHVRM25s?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f59163-d44b-4952-b030-08dd78975144
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 01:22:25.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kDy7M4tKypIa5iD8/q65lAAy+t6HjVuo4jr2NmdSMBZtAQi9INr2YKKQ0Z9Q180elC7gHPNXtu4PlR4Ec4HTRpZ3TCCWnCb2nnADB/zK94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
X-OriginatorOrg: intel.com

It looks like x86 has a local re-implementation of range_is_allowed()
just to add a pat_enabled() check for the strong symbol override of
phys_mem_access_prot_allowed() from drivers/char/mem.c.

In preparation for updating range_is_allowed() logic, arrange for there
to be only one shared instance of "range_is_allowed()" in the kernel by
moving a common helper to include/linux/io.h.

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/mm/pat/memtype.c |   31 ++++---------------------------
 drivers/char/mem.c        |   18 ------------------
 include/linux/io.h        |   21 +++++++++++++++++++++
 3 files changed, 25 insertions(+), 45 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 72d8cbc61158..c97b6598f187 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -38,6 +38,7 @@
 #include <linux/kernel.h>
 #include <linux/pfn_t.h>
 #include <linux/slab.h>
+#include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/highmem.h>
 #include <linux/fs.h>
@@ -773,38 +774,14 @@ pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 	return vma_prot;
 }
 
-#ifdef CONFIG_STRICT_DEVMEM
-/* This check is done in drivers/char/mem.c in case of STRICT_DEVMEM */
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	return 1;
-}
-#else
-/* This check is needed to avoid cache aliasing when PAT is enabled */
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	u64 from = ((u64)pfn) << PAGE_SHIFT;
-	u64 to = from + size;
-	u64 cursor = from;
-
-	if (!pat_enabled())
-		return 1;
-
-	while (cursor < to) {
-		if (!devmem_is_allowed(pfn))
-			return 0;
-		cursor += PAGE_SIZE;
-		pfn++;
-	}
-	return 1;
-}
-#endif /* CONFIG_STRICT_DEVMEM */
-
 int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
 				unsigned long size, pgprot_t *vma_prot)
 {
 	enum page_cache_mode pcm = _PAGE_CACHE_MODE_WB;
 
+	if (!pat_enabled())
+		return 1;
+
 	if (!range_is_allowed(pfn, size))
 		return 0;
 
diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 169eed162a7f..48839958b0b1 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -61,29 +61,11 @@ static inline int page_is_allowed(unsigned long pfn)
 {
 	return devmem_is_allowed(pfn);
 }
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	u64 from = ((u64)pfn) << PAGE_SHIFT;
-	u64 to = from + size;
-	u64 cursor = from;
-
-	while (cursor < to) {
-		if (!devmem_is_allowed(pfn))
-			return 0;
-		cursor += PAGE_SIZE;
-		pfn++;
-	}
-	return 1;
-}
 #else
 static inline int page_is_allowed(unsigned long pfn)
 {
 	return 1;
 }
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	return 1;
-}
 #endif
 
 static inline bool should_stop_iteration(void)
diff --git a/include/linux/io.h b/include/linux/io.h
index 6a6bc4d46d0a..0642c7ee41db 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -183,4 +183,25 @@ static inline void arch_io_free_memtype_wc(resource_size_t base,
 int devm_arch_io_reserve_memtype_wc(struct device *dev, resource_size_t start,
 				    resource_size_t size);
 
+#ifdef CONFIG_STRICT_DEVMEM
+static inline int range_is_allowed(unsigned long pfn, unsigned long size)
+{
+	u64 from = ((u64)pfn) << PAGE_SHIFT;
+	u64 to = from + size;
+	u64 cursor = from;
+
+	while (cursor < to) {
+		if (!devmem_is_allowed(pfn))
+			return 0;
+		cursor += PAGE_SIZE;
+		pfn++;
+	}
+	return 1;
+}
+#else
+static inline int range_is_allowed(unsigned long pfn, unsigned long size)
+{
+	return 1;
+}
+#endif
 #endif /* _LINUX_IO_H */


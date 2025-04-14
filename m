Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9D13FC2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646589; cv=fail; b=rxEpw3d2E1+xWkVTDZcbMa1OmooX25uTWXbitQM+zssO7dR8SJPwJJKqlMZK1uihC45W08659xSTelHI2DyfljwvajmuK5fGIn0SJn+vlqBlPes8MWVhuC9FfPoK2L0vGs+bVHyupX69SWHEkNKcqIsBlgjtS+is/1+0ijd2rHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646589; c=relaxed/simple;
	bh=q3SxBNQ4LhpI/1hOI0roeR1IsvSrRNvwhU+bILMfAos=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iuhyAHBsPdH+K9Blvce414iPEQg32GpyE3nQACVeqB8Va74WoSd3OqTXkR/eTVlRLUvXhk31onEcKVo0Wjvd9T1RLPaCtbbdqybGS4juyfuxuJh6nAW9qIHYkJHFAMshK9SGHSLuMwHIpLMRFUoG0Ygvbgg7yjjDNiAfM1z0KHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVQ1oLBh; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVQ1oLBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744646587; x=1776182587;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q3SxBNQ4LhpI/1hOI0roeR1IsvSrRNvwhU+bILMfAos=;
  b=JVQ1oLBhcVT/mwTpCXTiVzoLfFy8+G6UbZhFkCDp1onn539JIYycyd8R
   grYd5//fWF1KZKj09J8u6qMFejCmhIDSr/59W6yBBZz6Vt63HsT2TnZFM
   HORPOUlG39dHM9uhrNbz2Erw0OhQRAPGkUr7lznC4Y+WodJX1ieXn2/AZ
   V21sVLNma3oWMmK/SfMkjyvcjLz7bWBwwVr4oU5Ug1znLyvzj3PFMdRPe
   hLNwLThHxe7pioxzPAzgZ4GF8ogvfULXcBPKt3p+j2j8dup8ugjy62t/g
   YrrUn8xfkJPbHvtFeT47hcHyflg4N2UndxMV9hOzf+3SlkbkKlsKIAU7a
   w==;
X-CSE-ConnectionGUID: 6zZQQhrDRoyjCeW7ICx1pw==
X-CSE-MsgGUID: 7KzpuJ8gToKIwC6EOWnD1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49780474"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49780474"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:02:38 -0700
X-CSE-ConnectionGUID: tw11HbMSQB+wBlwy0dFmPw==
X-CSE-MsgGUID: 9vjviIEWRRiK1vSPh+D2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130834606"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:02:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 09:02:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 09:02:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 09:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8Lt2W1ONQyyapFI2QaIjDe1DedMNJ/1SvG4H0zdd5XyrSkkeozDH2pHf9k0MsGvRdzItzcf+Bf2t2nML3cbTZbWRvBeezimVYtN/azvj/B3BQx18fRhhj5j6dqdLFH/zMh7uGbK2O1vP9M8VcV7L9qN+sQXbBV5M7ZZmOL+czx0KU5i0XmrDhvCLvywGmcJuSh5dEO5qa9CxOkOql0c71CMJWr6g4SwEaaprONvh/X+5dLuscpwLvRgwOIZoD4r0AkFwwJSXGRNn9UcwmnWqX8MNpFwb8q/BHTtN24sCfc61hEEDMtjRApYdIsa835klsGG7wjgMjmyq4KN43sGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnlfm2BG1CmXSf77Z1Ni06rs99eVz8kcYTXKym+w6G0=;
 b=ilzu9hdAOWgtUd52OYoQDAyCf0GjOpCfMgCLJOcFfoiaM69wuCd0x0KueYqYixyp8pd/1AU5KrUei93IbUX0oHOA0i7s6ZRtBKwgw3EtWvaVcNrcWStM2ORceN4WXIApOLuQCdj5WwiX6BEm9JTVQnoD42R+2Gj/qYCRNE/wejODV8TorA+kOTa1kr8zLoznF/qSTJz4d9LgPkRNAKOsRIpuV+X6jztWBDKdlb82XkKeg/T8fbxNPAoLXhmNUeEfuEiIPhpGrXD2DqTxBN9xH3r2b3vU4BZSJp3uCBU2OOF1cjJo2wFZvkDAkTHyCg3oPwTopcCxTqMscF508OBfbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 16:02:16 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%7]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 16:02:16 +0000
Message-ID: <005c633c-aabe-4e60-9cb5-31cde7d30df7@intel.com>
Date: Mon, 14 Apr 2025 09:02:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 9/9] selftests/x86/apx: Add APX test
Content-Language: en-US
To: "Chang S. Bae" <chang.seok.bae@intel.com>
CC: <x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, LKML Mailing List
	<linux-kernel@vger.kernel.org>
References: <20250227184502.10288-1-chang.seok.bae@intel.com>
 <20250320234301.8342-1-chang.seok.bae@intel.com>
 <20250320234301.8342-10-chang.seok.bae@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250320234301.8342-10-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|DM6PR11MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce89a7f-b41f-4bc0-6d42-08dd7b6dba03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1FBWmFiZlFMTG1QRVNZbW9MTDd3dERvS3JiRWZGczBFbzdZVFJyTzBOYWlv?=
 =?utf-8?B?TmZNM0p0NnI4ZGhTditGRkcxTnBpcWUrem1iakkwRlUxVzVFZlF6VUZSM0tV?=
 =?utf-8?B?eDlJUThJTVNOVFAwUzdVWW1GbEt3bFZWTzNTbHpZNnROdExubnArWWMxNjdB?=
 =?utf-8?B?a1pKVlhveCtraitvcTEwL0RZL0tJWjVpck95MEFvQVJxZXRlM3FPd3BUU2Zp?=
 =?utf-8?B?Mkc3TWNpZks3ZFZvVUNLdUdzcmZCRG9HMllMSDc0YVhiVHZpSzhXM3VUbWNh?=
 =?utf-8?B?T3JNc2l4bDBiU2hzTURPeDNCMEVrSy9ybmtvdHJmK1VFTzdrRXlvVExQWjA4?=
 =?utf-8?B?WUlQN0I0UWVWZlNHUzFYLytwdXBYK252YXhzZEtkNUwrVG1ROExHZ2M2V0h5?=
 =?utf-8?B?S241UWZlcUt0azBpVGVvLzYyMTNVVzJIalRTbmZaVmRMTjFrY3hxeHJicSt4?=
 =?utf-8?B?RW9RZkUzZlNCK0hRZFQySlVZRDJ4Si9UbEQxVzJHUE81Y0VLTVFPUTVraXVz?=
 =?utf-8?B?dkExUHorQjRtNHdqblluQWtsZU5ZNUhJTmF3TG05RDQ2ODFlUWYyYWlFSkNB?=
 =?utf-8?B?RXZ2R0hMTnpLOW0ydDBUL1l6SC9UazNHOW5QWG5iQWZuMEIwN0l3NFQvWWxQ?=
 =?utf-8?B?dHBHYWRuK2o5Vjc3NXpFS3J1dFdRajdJcy9keENacHdXNXhMRy91ZDN2VDZX?=
 =?utf-8?B?Nk4wdFZFa2RvQXA0RkszeHl0MXJhZXQ2d3JWUlk1M0xyRitTQkZVYlk1ck5J?=
 =?utf-8?B?Wjd5azlVMXA2aHErNUUrWHlmdkNMOGxmV1lGSW0rY0x0akFUc2Y1OW9RbE8z?=
 =?utf-8?B?Y0tQdXVQckhrNW9HdVh5OWNLczNQejZvdzdFQTdHbjIveHY3ckNwUFhXaE9x?=
 =?utf-8?B?TmdzSE5XTzdkZkZjRk5yN2dILysxcm5hTG9La3RuaVFES1I2QXpoYXZiKzJj?=
 =?utf-8?B?UjF3Vk5BT0xiY0FIZXNNRVBJRkE0ejBwaGNGb0c3YWFxOHNFNjJ1MWRMUEJz?=
 =?utf-8?B?OG9CMnZVNWppT1dWU2R5QTAwRkVCK1V2OUs0ZXJDQm9yRVlFZ2hRdHVaLzVG?=
 =?utf-8?B?V3J2ZTZVQTZGTjV5SjJwem8xd0tPNHhtajlUVjhNTTJ2ZEdBRkU5QjRuNTlK?=
 =?utf-8?B?UXVGMmFhdlJJUGFRQmdmS0VjRzNnZGRSTUx3NDZkdVBUbmF1N005RXIwTTRz?=
 =?utf-8?B?OG4wSEtYTTc3SFdRaXVTYVhvOEZOc3BZUi9wamZYa0gvN0gzcnhiVDV5YUhX?=
 =?utf-8?B?U3p1RElxZTZhNm9raWdCS21kNkFoUWJiSVBiaVpuem9yaFVXSjBVd2ttTTYv?=
 =?utf-8?B?cUZRUEE5aFNZU0RycE1yMFB4MnoydEZ3YVBhMUVMR1V1dUpjRWhxU2JNNUdO?=
 =?utf-8?B?NzZqbElyR2lEYjRjcUZ5UjRUZWxmRmJ3SVlmMlR2ZEpyWUQrRnpZd3B4NXB0?=
 =?utf-8?B?NmhqWFFWUzR1WUhMeTd3dG8rZ3pudW01akNaOE5HRWE4REN5VXlhdWd6UDJa?=
 =?utf-8?B?Y1MxVnJLdWRiYVAyQ2grKzBRdHVJMzhTSGkwL0o3SUZPY3JlWFZOMVhjekha?=
 =?utf-8?B?OG1UNjZmdHNiMHV3dkNmcEZacmtxWmI1OTNtWTVSVWx2TGV4RjBJSlZ3Z0VE?=
 =?utf-8?B?d3h0Z08xZmJFa3Naakt4eHlFanVQY214MENMREdxd2ZabjllZkY4WVFYeVhj?=
 =?utf-8?B?Z3JQY2xYL3NlRnVEaEFYa2pwSXQzTjg0Nmt5b0hyVkpHU1o1SndMRkEyM1VN?=
 =?utf-8?B?Ny9OT0hvMmwzTkQxZW5ZQVFPMDk1bXdZU3o4cWZqYU0xWVZCVERrUEZpdjZu?=
 =?utf-8?B?V1FOWTFjOWZHaHNoc3Y1dUcwbDVFenRiem1iNDNJT1VjQnBSSUJUdTBqYzdS?=
 =?utf-8?B?MWVMQVdhRzFxNjhxMkd5cnVRZFpKeHVVQ1p4cTF1TlJoWHFjeDJSbFM0TUs5?=
 =?utf-8?Q?ntwiS01lxcI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXlwdk9wd1BPQWJhZXdhY3Y5RVh0QStKa0RhMytDcGVsQ203K1FiRHJZWXlv?=
 =?utf-8?B?ZDlxZDhkd1NvVWtmUjBKVVBrLzNGNkQ5TDNmR2tNVFhGRDZ3bWNpVlJVZUlz?=
 =?utf-8?B?YVQxMzkyN1FKTVJ3NzhaUWo5SW8wTVBiL2poNmVHYVVyejBPcUtSaTl5SkI1?=
 =?utf-8?B?aCtkY2JDbGIra2xJUjZqcENUUmg1QlRXRG1iTzVlT3ZqWmVDdmlRamtEOEdq?=
 =?utf-8?B?RHE3cDl6aU4ra3ZXWDRDV00vYURXaTVSMmZYOUZXVlVtZGJvS1BYeUljeFhh?=
 =?utf-8?B?MjBsQWQxakZhR294RnMwU2hxVFRtemtNTTdjVkJ1cDFGaUdibTVKRkFKMkRV?=
 =?utf-8?B?dDFHSWE3bk5JMkVQRHZhQmdjQjNqWmdsL2JsZWFEaDNLZVhqUm1QV3ZvY1li?=
 =?utf-8?B?aEh3YWYzdTU2ZGtob1MrS3h6VTJmbm1sY0c1WmZSQU1EdEFERjA0MEp4YVJx?=
 =?utf-8?B?a2p4eGxDWkZWRGNGT1VvZVlvYjJUZGczMytXajVnMWlkVnArS3VLNUZlTFNm?=
 =?utf-8?B?STZBVzQydElUdXhmOFNNVVlkU04vODNadkY2elNDdVhFbmVUL29wR3JuTUxM?=
 =?utf-8?B?QkcxaXVIS01vSDBUZEc2bzJoYnAwYko3SWg3Y01ZTndoVkxXOFpMaDVZR1d2?=
 =?utf-8?B?RlRXQWVzcVRZa3lRTmc0QzlwZkxXSjltTjFYZVZBa3BucU9qYU1kU3VCdGN3?=
 =?utf-8?B?cWdMMHZiWXNadFZqMXZGdUtBRlZiR2xOR0NMM1BtZjJwK2RkaHRRR2NjMHdz?=
 =?utf-8?B?MFYybHNmL25uVDFOcG4yUU8waWhRcTdGN045b01ORml2SEhDNXREdFUxdDY5?=
 =?utf-8?B?Z3lPRFdoMVZYRzlNenFvVFZjR3pDWmV5YTFEUExtMHVYbnJnTHYycHp2ajFX?=
 =?utf-8?B?cEFTKzd6Y0tmd0l2TlRSbCsrYnMwM3ljeXZQZXBNakdDT0hYUWcxUXgweHpY?=
 =?utf-8?B?T3ZwUjJ1U256M0VTajBzRXBWR0g0UEljMmdaQVpvbmZsd3p5RzZ1amlZQWJS?=
 =?utf-8?B?THdVRkVva2RKTjd2TEJSbWkzNWZiVndId2p6VlVsZEI2MTN2azUxank5Q2RZ?=
 =?utf-8?B?MWRTQkJVa2l1dVpYdUM3L2JKc3ptUUJmN1pwVW5SNmVuNmRLOXB5dlNNNlFJ?=
 =?utf-8?B?VVhkVW0xNUgweGdTMk9rWi9NTmNwdUU0U3lOcjZrNmlWTHc2cGFzNStqU0lX?=
 =?utf-8?B?TzZxTklmNlFmOEhvR1lsMmFwK2w3TUlqQldHZmhCUGNMT1crWHhMYWVqN0JB?=
 =?utf-8?B?Y3JIeW1pZlExMThTOHVGa0o0ZzlHVERNODZQaGVpUmloWFBxaENtTzZUdUli?=
 =?utf-8?B?bVNMc3k1b296Y25ZcGVNR3F5WXhHenkyOEdBUHdSb1lyeWg0MFhwNUMvU2dz?=
 =?utf-8?B?K3R3c0F3QlFzbW5uYU9tN25NRlI3QktlNXhSc3htSkF6NWZ2WVdJcjZDZmpJ?=
 =?utf-8?B?aytqQXZ0OVdOY3JML0FtbWRkdFpPT1BzcEw0L04rNDJaekRJOXNXTE1SSCtr?=
 =?utf-8?B?QllNWUhjZ05pZFNrd0FCUmE0Y2p5SUxrNlNsYmRWc1ZpWGRzbGlwbFY1UHZr?=
 =?utf-8?B?OXpBUW9nSDZjSGV5TXBRR3VRSTgwN3VwZ3JHVlh4U045UU9CS1BKcGo4a0hs?=
 =?utf-8?B?cGlaZmpaR2g5WURDcG9ZRG5LbjA3dFRQRUtCUlhoZlpaZUpSbWtDeDhhc1Za?=
 =?utf-8?B?UTBtQWJpOU1PVmlPSDk3VUdjS0dFVCtwa0hndXNSZzFxN2MvNFVSVVdSVVlU?=
 =?utf-8?B?SXRFSWtQbDhMSUROWW52SnNjTHczTEZYVXVybktWR0VESjdCd0tQSFBxWGxY?=
 =?utf-8?B?UUFlalA0ejViMzRzNm1Nbkx3NmFXWi9pM09uMWYrRFNjMlJvWjkvaWFPZEky?=
 =?utf-8?B?TW9MQ1lxbVNnRGo2b3h6WlNJU0ViQkpNeDFOMnZLNUhMOHdSOFIxODVIV2d4?=
 =?utf-8?B?cGtZZ0RrbVZwenRiNm9JemdyeWdZTGlFZXVVVmhTQXlSaytPUHdjZ0k4SkxH?=
 =?utf-8?B?bjFCN2IzeVdYZFB4SVVZRlVjYkwyQjRzaUtmeDUzdnJKS2NuaGhLVnlpazNn?=
 =?utf-8?B?dUdoTjNReDZybC9xcmhNcE4vSUF1Q0g0Y2c4MXZyaHkyNGpZRXF0RVhiODBI?=
 =?utf-8?Q?HD7Us/1bYp0ldEcfHnW75pVDd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce89a7f-b41f-4bc0-6d42-08dd7b6dba03
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:02:16.0158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojjSiNhZk1aA4rXyxjP/dVQXWGfVO5cu4LLh+/xa6XNinc3FOcywoWVK7VmHhRTFw3z2XGqwRi97NA/7tT+x2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
X-OriginatorOrg: intel.com

On 3/20/2025 4:43 PM, Chang S. Bae wrote:
> The extended general-purpose registers for APX may contain random data,
> which is currently assumed by the xstate testing framework. This allows
> the testing of the new userspace feature using the common test code.
> 
> Invoke the test entry function from apx.c after enumerating the
> state component and adding it to the support list
> 
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

AVX and APX have very similar single line testcases. If we end up adding
more, it might be useful to consider merging them into a common file.


> diff --git a/tools/testing/selftests/x86/apx.c b/tools/testing/selftests/x86/apx.c
> new file mode 100644
> index 000000000000..d9c8d41b8c5a
> --- /dev/null
> +++ b/tools/testing/selftests/x86/apx.c
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#define _GNU_SOURCE
> +
> +#include "xstate.h"
> +
> +int main(void)
> +{
> +	test_xstate(XFEATURE_APX);
> +}




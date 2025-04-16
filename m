Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15881B424F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826700; cv=fail; b=rS7yoJRYPWuW9NxpqijoBGac2t5K1650TnwvetZygrJylcrUX1UdmGzY7f+o3aNquJ7MbVffyvRB7+r6A6467no+GFg8cQ7Ivg+t7W21vFyqvu/4rvHVRmVhBcE19/FbKg7scabmGxQezWiMgPsAY6m6u0f7WXLQNdHNOGMF0aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826700; c=relaxed/simple;
	bh=2kVp5KXdo61xQR8sD1jlbauPRzjqAccXcuH0q74Axvw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hU5w9FGttNXSt4fQLVLe+Ld+zzE5u6IwW3IWwa1Ld6ElYHT4zfyleMCbwhmRBX8nC7GTDLCkowymlHTdE9TW+m2f82uDWilr9B86odBczH+V0gOMbzDBn2EnOn3a/8CSvvOfvRhUC6bfjGkk861xqO6rm/K2KcKh1RTCMG0bs0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IA8LyyQ7; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IA8LyyQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744826699; x=1776362699;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2kVp5KXdo61xQR8sD1jlbauPRzjqAccXcuH0q74Axvw=;
  b=IA8LyyQ77Zv8Hhgbu4yZK4SLs+bdhWfEbJ4F7KNSLmGpYCcJWr5ITbTn
   BGqCkPD/FVcRb1PZknY/2WuhAxaemXWLvQFN+RbyAdQg+ZvGY0T/4Ckub
   SxHgYTYln3qWXqedXsagVClhnyQH+TlMK0BmLhjcRoI4VZhfZNQ0QaXaH
   R8Chf+b0cgSnHGQIr43nzUn75N6kbe9EiPouC8seSwdsZXvxH+wxv+QeJ
   GKfyfmd8mds3fxOstezwsYdlm67jGT0tmkWtWKmba5Uz9kadl8sbpJgG4
   L+ftXLs/KdEe30pQJssZlPoO0GwjF1aNS87jY/++lTyYZS/xb3JuIWfeR
   w==;
X-CSE-ConnectionGUID: u6SY+fpJQyuKqrARK2NKbw==
X-CSE-MsgGUID: 3NxyRGCrRfeI0e6S7wneVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71781751"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="71781751"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:04:58 -0700
X-CSE-ConnectionGUID: 0whUx41+SruBb3vD9eHSYQ==
X-CSE-MsgGUID: +xpLiE7URX+8c5sk59aflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="131090722"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:04:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 11:04:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 11:04:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 11:04:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfPx6iZyIbqYuRDmaVaix3Hd9tCdphTgvYjdKPnUn6GtN4wORj3nFxs8pAezhar403DpQj9DvkjQgy+BZ8i/DD1ghs47Vhg1Ya4BJRAAvRsbHchoXkjEErGT217yJX/BOVpTE4GiRCdtIDo9KUGpzRq81i+ydW4ENukvCV2ibRGI+GzUT8pRCVXgYDiv5KShrmGZsA6Ul74wHXBZkXA7rPZAlZSqkQ1NW3zoVG3tKq/zAZbBPCZTdZIbqgmX5pWnVbgR9T3PBXQRVgp0104KwR2ClqUvmfgnlzYfmu2NzRl1wWafr13npWGw+u7uk6uBITssuEkFd8NxN+mI3Q2ygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+jSvW9/3KuMgss4AzFzGY/Xy2RGxmORyDqXhfsDTzY=;
 b=x/ttk69/WPYLltZrNjwDpzmNqDIk5TlljJB0SlzN5bREwZ83j2hxIXFIB3mWskR22QuB/gxw6hov4KuwrMlkvCO/tLz9J8CNrNJejXe1PLCw7eHC89Ih9QDI9XlwaaLX8mBCE6DYx9DK4jTRfWKYcXntoLJoujbv9pga11mhwHaP3rZpkMiQTtEjPuzXq2vVRr5uxgA14vNBX+2IRdfP9iGMPb8lARNzSR4tcUcyMdJQMFGCniWzchSGXTV1mmc9kY3azqr5jo7DTsMSHQiKj1LP66xXaMFpZqJk8WCrJzaufT6eO0+h8cw91EHk3I3aGLV2itjdJB6o4kBFa9X9rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3322.namprd11.prod.outlook.com (2603:10b6:5:55::19) by
 SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Wed, 16 Apr
 2025 18:04:42 +0000
Received: from DM6PR11MB3322.namprd11.prod.outlook.com
 ([fe80::fca4:6188:1cda:9c1e]) by DM6PR11MB3322.namprd11.prod.outlook.com
 ([fe80::fca4:6188:1cda:9c1e%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 18:04:42 +0000
Message-ID: <25e75c99-fe52-45e8-8ecd-0492a82fa404@intel.com>
Date: Wed, 16 Apr 2025 11:04:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] x86/fpu: Log XSAVE disablement consistently
Content-Language: en-US
To: "Chang S. Bae" <chang.seok.bae@intel.com>, <mingo@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
 <20250416021720.12305-7-chang.seok.bae@intel.com>
 <d67648a0-925c-433a-a33d-1cdba02cacef@intel.com>
 <80368392-505a-486e-93ca-73737dd8eb6d@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <80368392-505a-486e-93ca-73737dd8eb6d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To DM6PR11MB3322.namprd11.prod.outlook.com
 (2603:10b6:5:55::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3322:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d73d9c8-e2a4-47f3-64be-08dd7d112969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3hJdGxUZlowbjY3dGc4UFdRV1dHUmlFQm16alZHNnJ0V2lUUEtwaHpDVWgy?=
 =?utf-8?B?WHJzUWh0TjlFY0Z0bGdhZkJlcGo1MU1UaSsvQThydkp1OGQ0Qzc0MmJjN2Rm?=
 =?utf-8?B?QUNNUFV5cG15ZmxQc0dRY1BtaVdwaFV2VTlwUDBWR3FwNGFGcjQzQWE4QzAz?=
 =?utf-8?B?Z2U5ZEFRb2FncW1JUjgyeUZHT0Z0T0p3MEk3aTlXT0RmQXAzRzl5RG5ibzlD?=
 =?utf-8?B?dEZmd29vNldEeGt6d1BMNis1RGJ2ZkFwbys5Q291MWwxSzlJdUNTU3Q5SFVv?=
 =?utf-8?B?U0N3bU00eS9XY2hSVmxnSVdQRmU5ZENLRkpxQUo3dFhMSjEzU2lRT0FBYlpM?=
 =?utf-8?B?RXVrd2Q1OHR5ditqVWc0OUo0blAxWXhTV0hlaXRucjdzSTRaZCsxY015dk1k?=
 =?utf-8?B?RkdYWnF6VUV3TXRJNVlFU2puUVhWNGJ4NkpwWVdoTkVZdm9udlJUd1RYWlJE?=
 =?utf-8?B?MDJ2UnVXZ2prdUlKNCtoWEJucjlpWWtTYld0SU9XRktMSHQyUEtpRzRpb05P?=
 =?utf-8?B?U0FPUXZmcy8yb1R0K1AwbkJXcm1oaFNDTU1yZzZrQ2VJZ1BHYmptQkpzdkRV?=
 =?utf-8?B?NnZ1Z2RyM3RFcE5XM2ZkT2k4bHFvRWFMYlVLbWh6SUFNbEtuOXgxTzlqd2NY?=
 =?utf-8?B?RndLbDZpQmN2Z3dXcnI4Zkx5dDRRS0V0bCtWOHczVkNHbnJaNjJLNzZoL0NZ?=
 =?utf-8?B?ZlJybkprMUEwQ2dyTWVrR3pnUEl6dXN5K1FlSFhoS1lZRGJ1RWY1MlVSZ0pS?=
 =?utf-8?B?T1FxY1lsZG9SSUZDVzJZNERQbytVUzdRMHFWcU80dWZUeGJhSkw4dXJmMnUz?=
 =?utf-8?B?anZyNHlJckVBdVlPMjNqd01qL3JxTUJtaGhIMkphN3dCeVhYTkVoWlhyek84?=
 =?utf-8?B?T25CK3RGdXZyTHUxWDhFYThwcTB1TWVZK3N3dEY2MnVyYnhnSUtBb2ZWUDFP?=
 =?utf-8?B?ZHQrNmc2R3FVdDdMQnVxWitiRzFiMWZ6cFd5aE9IMkh3S3Vsd205ZHdPSGsz?=
 =?utf-8?B?b2wwRVFTeEU4ZHFlTFNkL3JnUWwzdGN1WHFiQ1hISHhINUtTYUxLZWFBVGhP?=
 =?utf-8?B?TThkdjZGWVVDWklseFgxWjBJa2xEbjdaMjFzMHFYTElGcVhjRTJwZDZCTDY5?=
 =?utf-8?B?bkhxN3ptMCtoWFUrSHZ6Q0c5b2ZYejhrYW95ckMzQU5vM0dhM2lYRmMveTIz?=
 =?utf-8?B?TDB6UkdnbXFTYTk3VmlrMFE4V1RqMVZTRFo4bDRCcjF3VG1PR29LdTdwMVlD?=
 =?utf-8?B?R0hqS080eHVtYmg2NlRMK1FkeDBpc1dMak1BaG9JYUIzMHBleTJHRGlhditV?=
 =?utf-8?B?TWpQRy9yWFpURWxWZVZiM3dhbWYreXUvK0I3eENIdksvV09ERmhSZmJvOFhj?=
 =?utf-8?B?VjhRcW01bitJME0wS2VPd0xralZ4TlNOcEJsVTdQZjdPY0tIWFhJTVowVFF4?=
 =?utf-8?B?UU9icmE2ZUlGOXVGZGZqUW9mNmxnMDZVMFQrMllKQ0VvUnozRGFtNy9XSE1S?=
 =?utf-8?B?VHJzc2t3TCsyL2NFdFRkd1JKeHNBa053T0pwZmFoTHpsSnVDbjdlT00vSytM?=
 =?utf-8?B?MmhKS1owTk1VM1JESFlQNzdEYUdDM0VLc1FvbmtjK2xlSjBSbk9tSUtobkxS?=
 =?utf-8?B?V2JwTlRNS0tubXRxWmpSaWVmZXhBdmFSeWZUVmhmYW1RbnZkMUlPbXZFYzV3?=
 =?utf-8?B?QWdLTzVOclI1NDlsOXEwZm5VWVgzL1FmY29naytsaFpaQ0g1UzRWNE02cUQy?=
 =?utf-8?B?SCtCUHVnNXUwaGFIMkdyK1hwZi9wQnBRM0VscGl5dnJtSFgxc3NUWlBwNk13?=
 =?utf-8?B?NjFhSGhLZ2dMck1ocjUwUlptYVJxbDRPK2V5N0o1Wk1pdFBQUjNJU3FXUFFk?=
 =?utf-8?B?eThyWXhCZ0JvYmpmUGEzZUFsMXBOUGhYUENlMFVIMThEbU5RWW13Mmhsa1JK?=
 =?utf-8?Q?ccmI4G3qpaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3322.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlV4SEowVHQ4UldKVjlWN25QeWpWaGRSWFU5VUxCTVZ4QktNbkxydDN4VVh6?=
 =?utf-8?B?SVZTSEIvL09sODl0VW5MWEkvNUlCZWRpUDlKUDJFUFltRGlpN2h5RkliUUZF?=
 =?utf-8?B?K2tqUjZseFVLNXBBN3pQeGdsRXdGbFhyRFVuQjJzQ0pLMFNDYVhnMmt6WFMv?=
 =?utf-8?B?MWdFUWhqUzEzVHVkMW5meWNqWnFqWkhEUkhMSVQ2WFp4NDNPUGxQeERvbXpW?=
 =?utf-8?B?WGh1b283cjlKM3lISEV2MkhMSEMwUUJWejBPTE1rUXgxd2ZiQkpqdC9GcTY0?=
 =?utf-8?B?cFYzYkdlVUljQW9wa28rYXNaaVpkaDYwZG0xRjJJVTJGamtsMitrUGNJTkdK?=
 =?utf-8?B?S0MrQjluZXVTclRzdXJOeUE0aTA0dnMrZS8vZm5uUGExTVppMHQvNXUrTzVJ?=
 =?utf-8?B?ZU4vaGVILzZuK1h6Wld4NFpReTAvZFd6U2x4OC8xZXBBa2VmaEdSQXlCdEdt?=
 =?utf-8?B?TWZtTHBaY1FNa0JqeXErblZYdXdySFBQQnVMSWs3dTBkWDJLNStxbXRkVlhI?=
 =?utf-8?B?TEM0dWhEbGFHZ2YyNFA1b1VvenZpbmxXMmdOU29IZHN5cUZjVGh3ek5SN0lC?=
 =?utf-8?B?bTJXU01haUNGV0VWeHZRUzBidHdhUk1XK2Jzem5TWlVDWEV0Mm85NVVYcGE1?=
 =?utf-8?B?RnV4aTBHSmZkT1Q4VldjVmNkV0ErSWQ5azAzaXJhQ2VqWTJvSlNjMVR1amlN?=
 =?utf-8?B?QmJpKzJ4NnR0N0I0SnRVZmQ5bW9XbXpNVDlOMXNsQTJDVUxuRTRaR0Uxazd6?=
 =?utf-8?B?ZlFyWHltK3F4NWcxazNoSU9tb1ZZMnJmcjhVeUZKNzRqdWNIZ2tTZWlSazJQ?=
 =?utf-8?B?ZlMvVFAvMzJHK3E2bWVYUXBhSmliQldleDdQL0QyeWQ4M0VFL0RycVZWSUpn?=
 =?utf-8?B?emY1RlRLMGp6ZXhIWHI4ZnU3K1ppcms4U3hleXNmSVpvenE4bDMwUFhub0NK?=
 =?utf-8?B?Z1p5VUliVmdzTHE3eGFoMlE4S3hSdzNSUlRhNkkzenZzdVgrM3N0SlN6Mld0?=
 =?utf-8?B?MHM3V1Y2S2pqKzQ2bGI2b2dlSDRqOUIvQzhjd3dQcytZTklGT1Urbldjd2E3?=
 =?utf-8?B?emlaTG9ldzhZV3o3OHJIRW03bEFyRlY2bUlORXh1UEFjUkdCT1I2a1psY3Jp?=
 =?utf-8?B?RVlSUko2SHAyUlVZOVVpb3dDYXMvbmxSYVZ2TWZlYmNXUnFyRUpGT3hwR25H?=
 =?utf-8?B?QXRhQkpBaGZXSDZWRWxjTkF1SDFQRUZLS1F2bzRYVml1ai8vN29PT0xMbksw?=
 =?utf-8?B?ZVJuRkt6RUJGM1lOYTZiVUhWM0xMVTUzVHRVWm5vNUVvR2k2TjhxbWcrSDA3?=
 =?utf-8?B?aFQxN25SbWtvQlY4cDNQM1AxTWowcTNiRXdvMHhpODJZSDZ4bUNOaFlHTWpn?=
 =?utf-8?B?RXUrMHd0WFA2NTE0UW8wZVhXNEpFOC83WmlseDU4NUQzUDNjT3BnVXMzWHkz?=
 =?utf-8?B?d2MvaS9YZjJ4QXA1YzUyS3lYQU5ycXBCNzhzL1lYa3gwV3hLUDkvTnQ1OC9Y?=
 =?utf-8?B?TmxsaFk1Yi9LUi84WGdiU1ZwSlh0U0t6dDlrbW0zUXNkeHVUbXljaFBSN1JZ?=
 =?utf-8?B?dGM5ZzlhalN1ZS95djlBZUpueXdGU2tiSEF4Z3BPZEpNSlYvbTFuRENoeFRO?=
 =?utf-8?B?SzRtQnpTLzdEZFY0dWsyenVRa3BNTk9zVmFsaG8yUEd6OWVMQjlSdmNQZ1Rw?=
 =?utf-8?B?VENVcHJPZ3F4cW5FQXpIWkZrNWtWelE1WHJ4SmdTK2dOMjM2ZXNDY25SUG1P?=
 =?utf-8?B?WHEwQWNSVGRPaitOdnRiRy9aY2Vab0xDdGdWWWc2S0N3aXhTMWRMQzl0ZGEw?=
 =?utf-8?B?VzBTa2FqVDRDQ085Umh2RjhEVS9TcnhlUDUyMzZpcEs4T3pqK3J6UjlPUWdl?=
 =?utf-8?B?L0NEekFCT1kxK0pzYStnTktpaWVpRlpwL215UWNNMWZWQVM1SU5pU3ZNVXRB?=
 =?utf-8?B?MGMvYnZZVFVtbThVV2dDL1BKdXZwcDloMkFhOXR6MUNXU3RYN0llV1A4NGhC?=
 =?utf-8?B?L2hMUW1LUCttRy9OaWNmK3owSGZ1cGFneEFlMm9ERlhaUlpVRmN5Mm91M3hW?=
 =?utf-8?B?Y1hFNHBPY0dvQnp6c2xkYnZGcmFvblJrdXFua1BvVE81TGVhZmltTWVhdkFR?=
 =?utf-8?Q?WkynKMW5LFWMPquULP+0stO7d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d73d9c8-e2a4-47f3-64be-08dd7d112969
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3322.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 18:04:42.1335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCWAcY9aauIzpl2fWOApc6EGDX+2xnJA0Ot/Q2ZCoaFyAkDMhAeB4e3G104AGDG1sF7ckcc4//StAF++2XgQyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
X-OriginatorOrg: intel.com

On 4/16/2025 10:03 AM, Chang S. Bae wrote:

> If you strongly feel that pr_warn() is more appropriate, then it would 
> make sense to update all related messages consistently. But honestly, I 
> don’t think it’s a big deal either way.

I don't have a strong preference.

But, for someone who is using log levels to reduce the kernel log
details, the below fpu-specific messages probably don't seem to be in
priority order.

pr_info("x86/fpu: XSAVE disabled\n");

pr_warn("x86/fpu: init_fpstate buffer too small (%zu < %d)\n",

pr_err("x86/fpu: Both APX/MPX present in the CPU's xstate features:
0x%llx.\n",

pr_err("x86/fpu: xfeatures modified from 0x%016llx to 0x%016llx during
init\n",

pr_err("x86/fpu: FP/SSE not present amongst the CPU's xstate features:
0x%llx.\n",


"XSAVE disabled" seems most important, with the rest just being internal
details. Maybe it's just me... Feel free to ignore unless someone else
chimes in.

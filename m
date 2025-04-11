Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E3270EDA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744334577; cv=fail; b=Re2Lrfg//UFucNT9C9haZ6TEEYh2p+uk37zpzx8MoBaUdJWs2ICqjENggu4mNg69utl6n7dvPR+3ip9YB+YpP6KjCsyYhABI6BKd+dqOSXjzR4kTqLIR6MnKNFPK9JyQzFcEp9NBo/AAif/znq2AcWzcm/anpVdACCjYhi9JA4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744334577; c=relaxed/simple;
	bh=lzxPYF9I0kdICzZF+2txdRuiGyh3DNwbWRfVfVSEu7g=;
	h=Subject:From:To:CC:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WdG6HALV6DrZsnhAhZi4A/VaOQYgPyfg+/r0xvmXBduPp/UqeeXp0FAsPnkSLcoySKaNeTKvvmoYAIqqANw2I+pJ/lLJhST54ffxhaLwuzEzGGBVThZau9w18FSCWczOymOVM2NKbTCtsfSbXVh3h1nwMJnpk5aJQhwS8R75tII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eq4lgw7y; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eq4lgw7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744334576; x=1775870576;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lzxPYF9I0kdICzZF+2txdRuiGyh3DNwbWRfVfVSEu7g=;
  b=Eq4lgw7ywKDVmob+YNBlp/2W7kwMyvX8pcFwsd0mvQGfmiSfYCZ1mEY7
   YFhx2kMxPPjqyM6ZTs66QoGVxyvIoYIGXpD4rqtPRhmlDBS1S1gjm3Z65
   xWpAECKX/kIAAxj5o28MCQ3knlzEtU4g4/tG68x9TDW2pMey8e74Qn0bH
   tDV20LrhgSfqdtlC4hvYsn6icVbRWMwasm/s9MIs20QaHdjTFr+lK9ha+
   yKkPeQL68Gz4kHYANc5Q2T/MdoGNvyFkrN0GmrSEVpjS/zh4A7N22w4PI
   UbOzF50jVaW6OolB4lLmES4zlcesE1MWpyWgOPLkxoC2JjFqi6zty1Nq6
   Q==;
X-CSE-ConnectionGUID: 95cdAUq0Q/WNeIOwnQD3eA==
X-CSE-MsgGUID: H6uG2MvXQJyYSeE7f5AO4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="63276812"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="63276812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 18:22:53 -0700
X-CSE-ConnectionGUID: fDdeI36gTg2TWLSRCLOJOw==
X-CSE-MsgGUID: 2LgPw2ReRS6uQF7b1dkFsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="160031739"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 18:22:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 18:22:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 18:22:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 18:22:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIuBISw1eaPbORSKBsZs5poVujNPsVJIe1ZLJfouR/C0ltd5emg6pjrT55BPKq0b1eqeu8+0aYhpPd0mllrrLoH1F3R3GEYUv58YBsId0BmBrNIY14agj+ASTkt9+N0xvNbvSVNkpG4NkfcDfZPWLg2xhgqRNOAZkP8Jr38C4U7zFbu/2GmjZD8ARwiaFo4Nsyn9S+qaqPuiLGQnDnYm5kCXfi/nBOA82c6P/8ALnO+7RxuhGiFAtaWH05PbpsFsKWa326aUz+//SKv3d4B9CSkqsUg6DQGUsA0EMeWNCqCwlTJePypdPIE98av/dPYwTZulmyemaSc80HN8ceDuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cyisw+vcjc93lg96eqU+W+XiNugVwll0gY71BPJiBl8=;
 b=tC67lpCDpqGNokDkHoPUTR3YQPDD14HUkyE/5kGGd43UPdcaR7AW8pfF6VuOpcdKeSkmKkDtZaZcWHJAagaLa6bLjMQwna25rMe/kAcb3difrjWP+x7T7x4T7jRsOaXTPL5ZJFJkG9e1sen567hsKMwnFoYnALbPNhJOTCvH94uM+0rZ/MGipHPal4yubKalFbQcPWLSgj8GMCUwZ8aKWFjhkvQ6jkIySwv32iHUxzhHJHsBUzMBN1tEwGvWPIk/tpQ80ssYoPP0vWK17zJWw6rGPxj3IJAuKviQYdKlr9WsY4xTB9zjD2vYS+m7aLrufzwpb04i3hBAJ/fJ3hfeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Fri, 11 Apr
 2025 01:22:33 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 01:22:33 +0000
Subject: [PATCH v2 2/3] devmem: Block mmap access when read/write access is
 restricted
From: Dan Williams <dan.j.williams@intel.com>
To: <dave.hansen@linux.intel.com>
CC: Nikolay Borisov <nik.borisov@suse.com>, Kees Cook <keescook@chromium.org>,
	<linux-kernel@vger.kernel.org>
Date: Thu, 10 Apr 2025 18:22:30 -0700
Message-ID: <174433455090.924142.10859114556652046264.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:303:b7::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd4030a-a24f-4591-deba-08dd789755ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vkp6UTNDcUZaQ3JPNVZYYlNzaG5udytJcEJCaVRvaDF1TklXV0JiOUlqTWtr?=
 =?utf-8?B?d1JYMnF3d1FvUkFkeDB4RTdZZGhHZjBINkZKQXUyZXIvRmJ5MUxvckkvNWc0?=
 =?utf-8?B?Sm90QkxtVGoxQTV0cXRGZFpwZEIvR0NlNmsvNEY3b2JHVEU1OGlyWkd5aU1C?=
 =?utf-8?B?Y2wzRjd1V01pUUduUlFqc0JPY3dHZDRwZFpiYUdJdlFLYWcvUnQyQzBFYTZp?=
 =?utf-8?B?QVVCK3Rjdit4UnRnQ2lPMFlMK3ZJSGRwS2xkbncrM3ZaaVI1eEpVRUE0cG1C?=
 =?utf-8?B?dXExZWdsYzd4MjMyTDdQR25GaGlKSEtiTmVyZ3VzMmN4c2dwYzlNTC95NDU0?=
 =?utf-8?B?QzIwKzlKWkJ4ZVIzNGd6Y1V3c3N4SkhnSWVUa1RvbEU0VkhOSDhKU1lvaU5k?=
 =?utf-8?B?TkhYRlgySk9uMnNjdDl1bUx0Y2s2THlETDljY0Z5MGJZcEU2UEd2YjFVbDYx?=
 =?utf-8?B?QWxCdzA0WW5MUmd0YVM3VXM2UlhOQzQvOWZ4bUJKSU84bXNidzFoMXk0dTJw?=
 =?utf-8?B?QnlkTHlVT3VPNW9wd3diSHV1WXZQeU5hdmtzSXJLNnB4ZHVoT3FGYy9MMXBS?=
 =?utf-8?B?WUQ3a08yL0pxK1UvN3FwdmxHNzBSNVJmdFczNktORVRCMk1yN1lXL1REUEpZ?=
 =?utf-8?B?emVIOFFkZElpTUZ0TU1PU3lqNHB3MzF4OGdHRmh2cSthOGU1L3ZHNjMyVzhC?=
 =?utf-8?B?OWt2eTN0cHBYWXZuYk1wR1Z6NHNPTDZ1L01xRXMwV1YwbGI4ekVybncvQUc2?=
 =?utf-8?B?NzYrRmFYUFNldUUyanNsQXl2KzE3OEREZDlJQ2FrTHk2RTg1TXNQSE15Qk9R?=
 =?utf-8?B?SHVKTjVhWWpGeE10NDVjY0tUdVBqTWxxUUVIQ1dtS1I4KzdVaWFzWFhtL1RG?=
 =?utf-8?B?V0Y1THB4bnRUNXNZSXJxemtWZHIyVDVUTU1lS0FleTAxNTU3dURnQ0xkTEZr?=
 =?utf-8?B?NENOYllSWjRVQkpaZEo3QnBYd1pvd2hiZmIwbUxzbVd2N1NPYURqMFlWb3NS?=
 =?utf-8?B?R2tTRnpMWXN5bVRSRUdFdVZJdVVTWUZNL0YxYWJqSWVEcG5nN2Mycjh2OEVS?=
 =?utf-8?B?cVFFdUYyeUFUOGFBdnNuMUE5YmJpNkpib2dSa0lBV3h6NE1uVVpzRkx5d0lv?=
 =?utf-8?B?ckxacXZtbm5reGhGMk1CT3JiUjUvbHVCYUNsSEM1TWNveldSeEM4Z3creVdQ?=
 =?utf-8?B?OSs3Y0lxd2pNRmphZis5Q3lpQnIyb2hjMmZyZU1OT2dNRzZ2amwyMUIveDNj?=
 =?utf-8?B?L2RRM2YzR3kzYVJObGpuVnVmRm9jRU9yUTdPbU1Mb1ZXU0NnOHg0RFZBWndv?=
 =?utf-8?B?anh6b3pyRzE1RDNPNVRLdjR0M1h2WGVSUEZKbTl2MVBBM28xUXh3VURha29s?=
 =?utf-8?B?UUNQM1JwdXNvK2xoQ0hHM0xHQjVUVnZTTWxpeGpvVHUyblMzWTZYWW5KbmU4?=
 =?utf-8?B?TlEzOXByb3p5VUxGNDlDaTVIbENTNHp4amhtLy9CQm1EQ3NlSjRsUFZnR3N1?=
 =?utf-8?B?ZXVxaWlDbkRBeGxDTDg1UVc0VnFJK0hWOEtRSjFCS2hlcDZCdnVCdVF0WnZ5?=
 =?utf-8?B?d2NPb0szZWVWSFRxaDdNU25LaElHamsrSE10ZFB6TDlDT0V2dUp1aGgyYkFH?=
 =?utf-8?B?RWNlL2lDRDJqYkVYbXhUdis0SVpTN3ZtYzJGcXI0M1Y4R1JxdFBnUFZHN1hI?=
 =?utf-8?B?ZmVhSjFIQjZJOGV3SXBFWndwbDVFV0p4aE1QQ211S2M0ZnNuRG4vZW5LVEpI?=
 =?utf-8?B?RlpXU2RMS1pJVWRtaDVYcDJxWEREbnhndWRnUTFQWGpxMnd4dWRBeXRlc2pR?=
 =?utf-8?B?M1lzUUVJR2ZRVkRqL0dwM3lKRW5aVUIvRUZ2NWpXVXU0V3ZtT1FMRGdKQWQy?=
 =?utf-8?B?RTJnQU5jU2RRamhXZEx0amwvblBOL1pjYjhPMUJwc0ZVd2c0eWt6UFJzVVJz?=
 =?utf-8?Q?0T23s00yLtM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmJaQjdFKzlOUStmMWhYemsraHd0cjU2Wkx0Y3FkUWsxcG0zdm5mQTk3aHJI?=
 =?utf-8?B?cEZZRG00NnFQWmREQjNJMWE1VXQvb2R4cFFhQUNIUHNnNTdZS1ZmWFBmVnp0?=
 =?utf-8?B?b0M0aUk4Q1ZJeCtxQTRQN2c3cWJjWnc4dFdLZ3BrbzdGQWM0WFhqNmZJUmN0?=
 =?utf-8?B?NXU2bzUxYnc0c0xSUmxrRFBOMW9HOENRdlRvSWV4dElkdDdvaHpxM3l1cnRM?=
 =?utf-8?B?QmpmQ3FkdStFS2RER2Y4RHBuWERhaE5Lb0xxQTlDcU5reDdCN0JxRS9YN2lY?=
 =?utf-8?B?bG5Nd1dYRE5yVTk3WGJLQ3p0WC8yRW1USm9qQWtlUUhKT21XaXQvSzE0Z05F?=
 =?utf-8?B?U2Q1RDF2ajlxWU5zWWJCK3hsNElvZG1QcTBUNmFjUldVTGxIWGg2UUtDc3Vm?=
 =?utf-8?B?OUIvbGxTRDZ0aGplWEdqTWMrZ1I1STVVYis0VDV2V2JnblcyRzZqSktLK29J?=
 =?utf-8?B?ODFudVUvUnZBczRKSjBrUDZYcEo5bjlja2NlTXRRa3FCa21JTThVZTYxMDNp?=
 =?utf-8?B?WWNnK1YxQ05LZkd2WHZhMFZuNW5pMngvSUVsUEt6TmJNOWZpU0R5MDB4MUJs?=
 =?utf-8?B?Z0ltSmN6RHdBRWUvVU1jNWhDK3k0THZBOXMyNFBnTW05UE5kNG05MU5Ec0xj?=
 =?utf-8?B?OGZzY2pDbnM1T3djZTdvejBuSDE4ZzhTT3JzbHU0dDdNa1BxYkdzY3FkVyta?=
 =?utf-8?B?M253cGtKVDFMVUp2cUxKVHNqRVBka3RSYVdGMjNJZytQa0hDNVBxazk4WGhB?=
 =?utf-8?B?cXUxRUdKYnEvZ3hSTU1Mc0Q4Vkx1MUtoZ3lOS2gvOVJ6MTlnSXp3M21hdTRH?=
 =?utf-8?B?ek95TmNlT1hGcUVkeVkvUDI0bFhIY2ZoYy9TbXRJdThqQm04dTJNV3VJVWJh?=
 =?utf-8?B?N0VNc3ZWdjZhYXdISzJnaEtuUUROTjlGU3ZXTFUrTHVoZWI1ZmhiekFXeU10?=
 =?utf-8?B?WWV5Z3ZVbTRRVjRoRHNadHB2Q1VISXpRVVNtRDVSbWZxMm5hQ2Yrb0phMFN1?=
 =?utf-8?B?M1BNSEJ1SUpJWGQvdDNqQmJEUTRiM1BnbnhuY2J6V3BnOWtsQXc5S2syYmJL?=
 =?utf-8?B?WXpPc3Ric2FlSDVGS3pZMnNjb0R1UzlXaXhzVlRZUW1wWnhEa29KclUvSm9u?=
 =?utf-8?B?MWVXTUdHbXZhRjJ2bHNjSFQrYnBhTE9SS3luWmlhaE45aW5MVHAvMGtxOUxj?=
 =?utf-8?B?UDBjZEZKeW4wTnJjZlBOaXZUQ3VHYnVEUlEraFEvMkdZQjA3R0dXSEVETnlP?=
 =?utf-8?B?am5rdFp3QnhkSlM3dkhNaUhMZ0ZLcGNEYzB1NWdhRFlTNERoL1pKQXRjRFB6?=
 =?utf-8?B?Y2Z6VHpIK1hydTJvOHlVNm9keUtuSW9KYnZRUmx2Q21EUXVDdUtFd0d0by93?=
 =?utf-8?B?ek1SRjhaQWNxckllSm5UcEdUaUNpT2hlUTZIekRKTTJzc1BFem16M1ZKdVI5?=
 =?utf-8?B?S3dSSFRnVFhTZW5MWks0S1Rmc3U0Ni91QnEwUGQvaWJlZStsS1QvcGlXb3R4?=
 =?utf-8?B?QjZwQVJMODQ1b0lUTGFCMlhrcXNWaW5ldm9JUFFkSkwxTTJhOEJxalc5R1h2?=
 =?utf-8?B?dlBOWXV1VmRlZzFuRitjSFNTd2ZBdzFQcDFaVmFobVlMeVZHd0hPZllyU3Qv?=
 =?utf-8?B?NjI0K1dKUmJlYmlhN0xQYlhOWDEyaG16b2ROT1ZTL0NSM1YwYlIzNnFGb3hr?=
 =?utf-8?B?Q3JoNnozS0dweHNIdU1aRXVWaCsvQ0hidm9jaEJlQU00QjdvNkNZcWo2RTVu?=
 =?utf-8?B?aE5iYkdWS29xVGtwK0FjSGJVVzMvcStaVTVkRW5LLzhRYitKYjlQY2ZqLzMx?=
 =?utf-8?B?b0grMDB3Y1UvaDhqYi9YWWpLK3dXcUwzWUkyek8wZzBrcmx5SDVzelJ4TXhS?=
 =?utf-8?B?Zmt5Zy81K21RZms1UUc4U3RZeFA4NXA1TnVIVkMyUWdsYjBDU2daR0c4TVlP?=
 =?utf-8?B?dVRZNTQrTU9sVld1TlJKRWF5VCttQ2lTY3VjckwxT1VBUUdBTVdLYWNqdzF5?=
 =?utf-8?B?Q01jZHhkK1FTVHJ4bXJ4VlBqNkdlUG1jWDRwYUZ0QUhLbmN6Y2VEYVVOQ0V1?=
 =?utf-8?B?UlI1L25xZGluZHJxS0s0SjdReWFuZHEwSGZtS1BjZ092RSt3a25jLzZpYWpO?=
 =?utf-8?B?U2tHTkpQZmxXalhMWEF4SkhERENHWk80TGlZbVJqUHZwS3dlUTZFVHdOU2Rw?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd4030a-a24f-4591-deba-08dd789755ea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 01:22:33.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogcbacv0mR0ZHx0vUk1qYhZz3Ui0TfKGJJcSGvXU3f/LjndPADjpN6RH4ePFPoL4xNkQwYXd1xbGJbTvbw4PhwJJ03fSC7XNGevzxy2Nz/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
X-OriginatorOrg: intel.com

Back in 2022 Kees noted that he is able to mmap System RAM below 1MB
even with CONFIG_STRICT_DEVMEM=y [1]. That is allowed for x86 legacy
compatibility reasons for userspace that wants to read BIOS data
resident at that address. However, the expectation is that when
devmem_is_allowed() returns 2 that the access is redirected to return
zeroes.

That happens for the read()/write() case, but by code inspection for
mmap(), there is no restriction.

Now, the confidential x86 VM (CVM) use case wants to depend on
"devmem_is_allowed() == 2" guaranteeing that no mapping to potentially
encrypted memory is established [2]. The options to enable that are
teach mmap_mem() to meet the "zeroed buffer" implication of
devmem_is_allowed() returning "2", or return -EPERM for that case.

Return -EPERM on the hope that userspace does not actually depend on the
legacy behavior of being able to reliably map the first 1MB of memory on
x86. I.e. that all legacy cases are using read()/write() to safely read
zeroes. If that turns out not to be true then either a "map zeroes"
scheme can be added, or the CVM case can return 3 from
devmem_is_allowed() to hide the CVM restriction from legacy
environments.

Link: http://lore.kernel.org/CAPcyv4iVt=peUAk1qx_EfKn7aGJM=XwRUpJftBhkUgQEti2bJA@mail.gmail.com [1]
Link: http://lore.kernel.org/fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com [2]
Suggested-by: Nikolay Borisov <nik.borisov@suse.com>
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/io.h |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/io.h b/include/linux/io.h
index 0642c7ee41db..564934f7e70d 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -191,7 +191,12 @@ static inline int range_is_allowed(unsigned long pfn, unsigned long size)
 	u64 cursor = from;
 
 	while (cursor < to) {
-		if (!devmem_is_allowed(pfn))
+		/*
+		 * Any restricted access is treated as "no access", i.e.
+		 * handle devmem_is_allowed() returning "2" to indicate
+		 * restricted access.
+		 */
+		if (devmem_is_allowed(pfn) != 1)
 			return 0;
 		cursor += PAGE_SIZE;
 		pfn++;


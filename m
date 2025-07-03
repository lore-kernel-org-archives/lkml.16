Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C753D2D63F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534684; cv=fail; b=lYmN5XEpsPNTXTvspR7DRrTAYttItyU/co3/PaUynylnaRwKyHKNLZQ+92OqtQoQrPys8n1pEbMJgFuuL3vDBJvXhjUO2AScpVYfY1QsBsQtTdstGBoby+Y5HkPyJLuHFP4HtdRTdYOtnAiZiKvYXmPaM4mTaFkFEXcmRJKT3JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534684; c=relaxed/simple;
	bh=Xkur/A4vaHmm1hdRtQVYbHz5HXMnI18Am4xs32TW2QE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TppMMfHDWESClRapMIceYYVy2pHZj64BLgKvTi+GoNfBEjuX5CFzIM2luUf7Xd7iJ168m/rWbggshGhNoVMzcCFuJMwcWbQfnCMN36dGWkjSNDn8OC3W8lzB5gctxfhkDMpNJOy2hpcSeAnU/NpY5JzJL4fkFB+JINXAPbf2ahw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R72Tr1Ff; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R72Tr1Ff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751534682; x=1783070682;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xkur/A4vaHmm1hdRtQVYbHz5HXMnI18Am4xs32TW2QE=;
  b=R72Tr1FfkOBSDod2wdiVpKLMuBXlps7ICzlanBYkrJwWIAunez6tc7jt
   mCxk6uMh5S1NATvXUqNL8v3/REdkGW9OJBTP4Bly+QKBPp982vK5/wWsH
   Q6Y+++bCiw1MeaXuPro8piQG6P3vuEI9g/FsYyvJQpKzeX5mDARf6g7AN
   /lJrgS+di1pobhNwL826uA3GH93bXHjFzfABeVvPH+4+8Tf1fAxKmR7Eq
   a4X83UStaRIhIHTOWbHmi1r+RO4mfC7f2P+qlj5kxG+ew4eQC9D+SI8TB
   EQs68vkuvZ7X7cLyuLT9k9UnjSrlec0M8uh4lknxZc/QSfGldHsDQ4Xzh
   g==;
X-CSE-ConnectionGUID: XeUl31XETwSyLaYwAG3/mg==
X-CSE-MsgGUID: gYG6Uh6bQiio9rgYlsX9yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71288182"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="71288182"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 02:24:40 -0700
X-CSE-ConnectionGUID: t91I7PrbSmCs/TPpLPhE0Q==
X-CSE-MsgGUID: YE+tJlmOTH+cn/xVU5E61w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154812060"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 02:24:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 02:24:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 02:24:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 02:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVcAPyEHW35Oaj8OCDlVM+gJCu0eMpmVqWpI5jU8ZcoO4uOBL05JTecOp8GfIn7USUSBDJZoGYeenCWwQfxiScp6CC/mLjmYGY4UB22AdHXrNQ/la/Z6kjF5QKXuWxU7bio8mYQq7L4y235avPM1INwH2PuYj2/B2HBsJvr29WPSWZpcfp4uJqGVHRI1NwGGWkFDkoir4maGo0Zjtzb5ysEIGOKpPtXVEAKXgwcmoORYW6o1YieQGWErKWOcOdx2zrXkezIyAqzY6M0W3si3F6Ft0mmd4aovn6Z6lopMkYudqME3R9qqHGPdV9PjGgu85gg15lxTxD9L6zyD/Lzlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XUfsV0cVm8iy/K9DhiK4eR3QmFe8uHv6SR0c5D6GPw=;
 b=BoKJ6D434wMLdGDbOLEswT4ZHyDbbdRhKdInsR4Fxr5nPl7M0yrT5DlkA4v0ClgpEVFe8mTUAkBj9SGvzVHXJnr95C2Xanqj2Qsk5eqLJzTSkUjSym7viVNo7pNR2hQ0xK9v0gy2sPwdzsxejCxWSHspOHoYrnzgKCTEUzm0/OWNPUYsrj+xHvR5DHWd7xOGIHRWVByEmgqw0BcFR8wDO/4NZfGm/VkKnNMEqXmTyjLnw7qu9ahzQFz3LSHDZ+v8kE0UMCkeM4/r394nC/FKFWsDtiyjF9NZZSGImj3yX0NwzqtslpXKvjRbl2Z3rpMhdMB+yJUmAAzIiukr7TzjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 09:24:21 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 09:24:21 +0000
Message-ID: <50309e8c-c046-4052-b112-8521d6141736@intel.com>
Date: Thu, 3 Jul 2025 17:24:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
To: Andrew Morton <akpm@linux-foundation.org>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Tim Chen
	<tim.c.chen@intel.com>, <linux-kernel@vger.kernel.org>, Jirka Hladky
	<jhladky@redhat.com>, Srikanth Aithal <Srikanth.Aithal@amd.com>, Suneeth D
	<Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250702140816.cea1c371bdcc92ec55a59434@linux-foundation.org>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20250702140816.cea1c371bdcc92ec55a59434@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0095.apcprd03.prod.outlook.com
 (2603:1096:4:7c::23) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: fff1b01f-b2fb-4e82-eef6-08ddba136479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWlaUEhBOFVpR1k2dWhKZTRhZ0lQOFJBWFZ5MGlqMjZnS2wzcE1RdkpOY0hx?=
 =?utf-8?B?dkFVRlM5Mk5yYm5KdmpHNDFtOExudHVvWG81S2I4aEdiNVJZeDRMT3pqSUxo?=
 =?utf-8?B?U2htNlBGbzNzKzhkMW5xTjc1STFnUjV3bHgxVHZLTU5GcUZaRVZQYkgyZVJ0?=
 =?utf-8?B?SlZYWE4rVHZWaThhcDl1YWxkL3ZwSjBVT1hrQUVoTlpHRGNmUWhNejBHaklz?=
 =?utf-8?B?bGVTamljNmk3M083dE0wQjNHaHZjOHU0VmZhMGJNMWlFbU0rcFd5bk5zYlc4?=
 =?utf-8?B?YllEWHhOYitaWDJqcE0wQXFQYklpMGg1b3I2Sy9VQmRMOEQ5QUw3Z040NEtR?=
 =?utf-8?B?WGdUVTIvazdNRjA2cjlGY09pV2ZXa1htOHNYUFEvQktKNEprRkZnb3F1eTBU?=
 =?utf-8?B?Y1c4dm50N3hKNW4yd0xqd1JyQjdkUG9lZDZvODNYUWtzSWFvbkcwU056TWcv?=
 =?utf-8?B?a2VIeVU2b1NlbGNPZllXaFZOOUR3N0R3bTlvbEZkMUkydlpPVm1xRXB0ek1Y?=
 =?utf-8?B?cWsySWgyNkJ3YnMyWWJnRWxidldCeEFIRVFXTjhmY3h3U2wrQ3A2Tzljd0Fn?=
 =?utf-8?B?ektsQm5Kdy93YWMwc2phWmhGU29MUUtRMTY0N2kwdkZJMUVrdnFTZUlkLzQ5?=
 =?utf-8?B?RE5DSlFGTW95ci9NWklTQlF4N2lHdkp0bEgvWE9QVWFjWFZDYWJSeTl0UThp?=
 =?utf-8?B?OGxVSGpJdXFKdkw1cmdHcG9JRjhuWElwRDh1MU9lY0FIMnJYSXZQcVZrRzNR?=
 =?utf-8?B?Vlh1YktSd3pjNFE4aW9tSHBSMURSV1VwOEVhMTdGSjkvOFdrSWtEYVBabDhq?=
 =?utf-8?B?ZmhyRGxkc3d5cjNTTkN6czVPaDdUQU1pZEUvRUJGZXhlUzdpaUIxUEtGTnZp?=
 =?utf-8?B?TXlIYnZnNzhpNHJ5YWIxN0YrZnZhT3l2RWRGSGt0dWkxWjVyMTZUMStwMDli?=
 =?utf-8?B?R2VGSktqVmRHblBIaG1HWUFZY2RzOUE2R2NsR1NLOVdCTWpabUZkUGprOGN6?=
 =?utf-8?B?STFGK2YzVXpxTHhIZ1AvSGVFeUk3U1BTWUZGeXZwQ1ViRTM1Z2R5UnU3SWRv?=
 =?utf-8?B?elFFcFhRR2dUT1JJUmo3ZzR5ZmN0bUdEVWNEZzgxdUhpejBWdEY1Y0M1Uzd5?=
 =?utf-8?B?UjAxK08za0tRQko3QXVweGc5dEZqUXZoRnByaUxiN3BGd2NmRmt3YzhvQVR5?=
 =?utf-8?B?MkN2Sm9YZWpvdFVlYkc1eVNjdTBBOWhmMkpnNmE1NkZmNVR3cDNVbnkxcnBs?=
 =?utf-8?B?WUhkT21JM0VjS3loalprL0tHUGJ3N2M2eTBiZDdKbXJHZzVTcE5RSTdGVzBh?=
 =?utf-8?B?bllDT29TY3ZxTDdoZEwyZ0l2ZmwrVHRwWldOMEhpbTAxZlFXaytrVlkwL2pl?=
 =?utf-8?B?ckNGakdralliWjcxV0treUVXeHpML25OUThyMXFPWHpVWTFUbXhZejNUcGly?=
 =?utf-8?B?SnlwRFNnQkZkcmJZeXUwT2o5aTV3T1ZGVDlxVGppVWJlM1czc0d3N25vZ25Z?=
 =?utf-8?B?MkxzSDBWNzl4b05hQzFNc1g3WU9uMHdrVTZHdHFwNU5pUHEvQzZuRW5RdTVP?=
 =?utf-8?B?K0M5cnlZSDEySnJEalcydWxVSzlFUEEvZE5UM25lQmJYK1RMcEpvNnVFRnBo?=
 =?utf-8?B?YzNSL1JrZXVnMGhBTWVMeHdRcTE5Ly83WURtQ3RXUURld3RLMmpVVjFWM3NQ?=
 =?utf-8?B?U3BrWGJ6NUJhQXZpSkNvVlVteHE4OXFaUnpqVkwvdlFweHZLaldQa25pVDFj?=
 =?utf-8?B?ZHJCdFBCVVlJTlEvUDI2VVFoR200MHZyTnRmdVlZTkVva0VwN3JFVTdhV3Nw?=
 =?utf-8?B?RUNiM1dPdlFjVldLbUo0OHN0TjdYT2Z0cmlTaC83UHh5dnBDZE16MHFKV2ZU?=
 =?utf-8?B?dE1oeXpiNkxMWTVRbC82aHZhS3lxTWRnelVGcFpyMmlPQVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW92M0lXRDVQbUIvZVFqZSs5WkJoWi85bExJaXBVZXVXREpJSUtBVUx5dzFZ?=
 =?utf-8?B?Qkx4Nm5WOXZZMXhzL1pxUWQ2c24yWW9yWmFpR1o3bG9mQ3ROOC80Q3QxYVpG?=
 =?utf-8?B?ZjNRQkU4Tk9EMDhuVlVsbWR5UHpoV0VFZURSWUZRT3ZPbUo2U253amJRU0cx?=
 =?utf-8?B?K0MybDRYckliRk9Kb3JIY3VYSGxobUswdWc4bnlwRUpoSmFqYVVxSmI3SVdJ?=
 =?utf-8?B?RHFGNVpsYUtwTFljUzNUYjZIaXc1V0k1cDFTRGMxckdhNEFRdDdRTUM2a0M2?=
 =?utf-8?B?eHVUdWN2cnp6clRDWU1SR3RjQy82cTRQNWNrZk4wZzZkRWZJMVc4TXZ5ZkNS?=
 =?utf-8?B?d3d0UzZSZUpOeTFKQ0doQUlFZ0Z1czNaZWw0bFo3Q3pPcmRHNlcvTzBxM1hV?=
 =?utf-8?B?WGZGaExRS1h3YUFVWUpFZXpJdzh3c3cvUU1NQlBBblNtYkdGc1pLZ3VCYlpn?=
 =?utf-8?B?cEl3QTQ4Szl4V2ZVMHBldmphUWNvNTRnbXZ2WXB2V0piVEtGVEZ0cEN5Uzl4?=
 =?utf-8?B?U2QvejRITFFvU2JDdE53b21vOXZzUktHV3J4eE1HRTNzbS9pMXFXTTNPU1RM?=
 =?utf-8?B?eWFIWVQ1SEE3a1NhdEpLaUFuUjhIUTYyb3NpckM1bk9CbkNjYTArc2xWcnlM?=
 =?utf-8?B?cDNYSmJSWlBTOS8vazVJK20xK2ppUU82OFZ0VGJ2cXpMWE1nSTE0VFNZd09X?=
 =?utf-8?B?Sk12N0J1bGI2Z0ZWRnJuZXlFOTZnSit3bkFhaGhXQ0crNzNUVjNoTDNCWnEr?=
 =?utf-8?B?VjNvS3ZCM1g2V3ZFTjZ6V1oyWFpyd1JlekxjSlg3azVLZjIyMUNCWXBaUmo5?=
 =?utf-8?B?Zk0xUTl5a0RmSmthZGJueldaYitTTWd5a1VzdVR5Tlg3N280YWZEbUxobUw2?=
 =?utf-8?B?aTYvR3hKYkN1ZXFxTmJpbWtnbzh5UFA5VGFyaWZNcldMMjRneXZTdGhEQXlx?=
 =?utf-8?B?YUxxZ1EvODZ3ejBrWkdxUEZLVk9sZlo3NUVHKzh5b3lqdmNSNERKY0pVVEdC?=
 =?utf-8?B?NGkzU09lRm9GT2pPWkh4L2xIc1BuM2JpRVd0VCtWUHlINFdiUWVubWpLeFZB?=
 =?utf-8?B?bFc1TnQ5QVBzdG5GaW8vamVmd0JzSWM0T3hBaVpiSHkxdmUyL2dmQStBTFBE?=
 =?utf-8?B?amhrQ2RlYkpkbXhiWlhMcFVEU2pqUEJydXZPUnpqczZWbmtZMEpFaFp4ak16?=
 =?utf-8?B?MEM5YjVpOUgzanlESnl4dG80SFNNMmtYSVBrMitCb0d0ekw5Wm4xdkxROXN1?=
 =?utf-8?B?QnVDcHEyMHQ2MFIxZFgyN0JzMENFdUNoS3Nsa0x0Z0JSUithMEN0aVlTOW1u?=
 =?utf-8?B?U0VaaitlTHVCUlI5Y0dwMHQ1Z3pPR1NUa1hNN0FNOWVDM01tZjRhWHBHQ2to?=
 =?utf-8?B?UVJnd2RJZXZOdXorcUxpVmU2SkxlbzlhV0JEMEJPQ0FHcHdHamRtTEhnS3Fp?=
 =?utf-8?B?WTU3ajF4T2NPUko2Q0NUOHJuM29QYk5zMUtSa3pudFVKREFvNENGQTNxdEJE?=
 =?utf-8?B?V1NIMXhZNFdTVkZldWxJNWJUODMwR1R1WVJTaStFdEhpbWN2ZDdid2MvVkVr?=
 =?utf-8?B?ei95MlZ4blk4N0tlaEZPNG1yNldIVUo5ekcvb0llSFdBOTZFemt4TDdEc3Rp?=
 =?utf-8?B?SHVNOVQyeUdlRTN2Qk9DaysxY2l3UkcvRUs2aUJQUFgrcUJVNkJHUFU2RnZL?=
 =?utf-8?B?YXl4MjQxY2xqZXBzRUcxNGk4WDZVNjZ6ZXcwY0wyTzA5MEwxR0JqNXd3TWxq?=
 =?utf-8?B?NW1hT25FUjRxSm1yQmhwREpvL0hyMG5ZbW11UWxmV2tYMXBhWjc4SmxwNmxN?=
 =?utf-8?B?bG9GRVpHMWhhdlFyVmdGQWlpdjVFWUM4V0tCakt6RjRlbnJ4NDREWnFFaDZI?=
 =?utf-8?B?Slh1aUV0Nkw1cVZpWnc5N3dhbUd6bnE1Q1JhN2ZpV3VQYTdMYTAwQlBPSDFD?=
 =?utf-8?B?c3BwMC96KzA0WGEzMk05TkduTGZFbExlUitIUWFtZG9hMU1aSGtXVVkyK3Qv?=
 =?utf-8?B?VmxiaU5TNFdCRGRIVG1kL1YrL3BPdkxuWXRyUmtZcWFrZ29XT0hMT1ZoU0hL?=
 =?utf-8?B?M0xHemZybFExSGdHdUVJRUM2UTdFcWc0bFdvVXVxMVg1dlBsZ2R1QXczUkFz?=
 =?utf-8?Q?tYK8zwSw1YNitG3exNv9eznIQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fff1b01f-b2fb-4e82-eef6-08ddba136479
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:24:21.2802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01ZxX7leuNmDL3E08Nen9g4JgvUH5+d+0PqUB8evH6MUpD0ZE+hvITK4S0izZQYcaDFa4dT8nYXitDI8viNBKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
X-OriginatorOrg: intel.com

Hi Andrew,

On 7/3/2025 5:08 AM, Andrew Morton wrote:
> On Thu,  3 Jul 2025 00:32:47 +0800 Chen Yu <yu.c.chen@intel.com> wrote:
> 
>> It was reported that after Commit ad6b26b6a0a7
>> ("sched/numa: add statistics of numa balance task"),
>> a NULL pointer exception[1] occurs when accessing
>> p->mm. The following race condition was found to
>> trigger this bug: After a swap task candidate is
>> chosen during NUMA balancing, its mm_struct is
>> released due to task exit. Later, when the task
>> swapping is performed, p->mm is NULL, which causes
>> the problem:
>>
>> CPU0                                   CPU1
>> :
>> ...
>> task_numa_migrate
>>     task_numa_find_cpu
>>      task_numa_compare
>>        # a normal task p is chosen
>>        env->best_task = p
>>
>>                                          # p exit:
>>                                          exit_signals(p);
>>                                             p->flags |= PF_EXITING
>>                                          exit_mm
>>                                             p->mm = NULL;
>>
>>      migrate_swap_stop
>>        __migrate_swap_task((arg->src_task, arg->dst_cpu)
>>         count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>>
>> Fix this issue by checking if the task has the PF_EXITING
>> flag set in migrate_swap_stop(). If it does, skip updating
>> the memcg events. Additionally, log a warning if p->mm is
>> NULL to facilitate future debugging.
>>
>> ...
>>
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -3364,7 +3364,14 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
>>   {
>>   	__schedstat_inc(p->stats.numa_task_swapped);
>>   	count_vm_numa_event(NUMA_TASK_SWAP);
>> -	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>> +	/* exiting task has NULL mm */
>> +	if (!(p->flags & PF_EXITING)) {
>> +		WARN_ONCE(!p->mm, "swap task %d %s %x has no mm\n",
>> +			  p->pid, p->comm, p->flags);
>> +
>> +		if (p->mm)
>> +			count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>> +	}
> 
> I don't think we should warn on a condition which is known to occur and
> which we successfully handle.  What action can anyone take upon that
> warning?
> 
> Which means the change might as well become
> 
> +	/* comment goes here */
> +	if (p->mm)
> +		count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> 
> But is that a real fix?  Can the other thread call exit(), set
> PF_EXITING and null its p->mm right between the above two lines?  After
> the p->mm test and before the count_memcg_event_mm() call?
> 

Thank you for the scenario description. Right, there is still a race
condition although the p->pi_lock is hold when reaching here, the
p->alloc_lock should be hold to access p->mm.

> IOW, there needs to be some locking in place to stabilize p->mm
> throughout the p->mm test and the count_memcg_event_mm() call?

Yes, Michal and Peter have given some feedback on how to do this.

thanks,
Chenyu


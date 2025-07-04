Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0791D1EB9FA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 05:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608711; cv=fail; b=H7MHoy5WWe7NiKQu0J42NAkaUvyF8x/MKYWXnx3qMQNoXVg8s8HOJb2xrl6iRu6MiRC3/eVyRIHttEfhDm/8AT0dbday0GI3E9RU84XIfQkC25P2zbsObGVOYJT2Ki4shsgtY/JI/ab8bd9V32yXknHTOBiY22sotQFN7eE9xA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608711; c=relaxed/simple;
	bh=vLog4zoEQOnxxMQsqOivctuFv0Qu1y+/+Y0CbPBDrYU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O6nl3ElIqVF5yFo8hit/Bq2Utcknu5NEY4Cv5045FT4IK+5kXlYKuQISYZHVmAbayzsQuUpS7w7ODWk4k+sBTyT05xTyZGRogXtM85hEjn+HrmlHgzOACBo1CuZMpxoiYI44iJae+ob+5olGBLBZ53H7UHK2xLzfww5i1cHD04c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fX7OTDh2; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fX7OTDh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751608710; x=1783144710;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vLog4zoEQOnxxMQsqOivctuFv0Qu1y+/+Y0CbPBDrYU=;
  b=fX7OTDh2OzdqkOqqxEg3qutdTj8DNdeWth+6qoVG+fKM9gru3SeeqgQe
   IufSQBiQJ1zjox94PvF/PsZUONNoaj48YfGt3bdOhrGJPcFIHitNkptv/
   66RISZvT4ZAL/SorEF5wfJCC8KTMjy1GILAJEPjVfqLiBfyPYfjc6EDmM
   sEAlRqlChkxOB+Up166dKFSghL8R/psJF5q3i7hf8HxXKoWwat+j5b4KQ
   XZsxOtXmOXFj0fLXGSuA7ze/wGEmgnJUe/Jj0d/635xyGJa0g7mwwNwyF
   geSSum/DiUB8AwGJaL/1gEc9LYoYqqLNFH95f/8yyqGHQxScdlZa6moFX
   g==;
X-CSE-ConnectionGUID: +utP0pKPRL6PW01CoH9nIg==
X-CSE-MsgGUID: D5jnKCCJQNOXzHrHGC2Ihg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53865129"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53865129"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 22:58:29 -0700
X-CSE-ConnectionGUID: AYEOGUXGS7W/rMJaE2Xa0w==
X-CSE-MsgGUID: Y1PvqULiT7yH0fnuoWJGlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154930011"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 22:58:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 22:58:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 22:58:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.60)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 22:58:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7DmZNc1HpS0swkatvvUQDGy/OU0XNUlLvCrCZ9j4HxhdZokwgDYgfk6U7fRlf8sn/VGhi26GcZp5WDOrhuH7+9pJk0NeS19GHV0NmRmF2rWJ1T8Ss4ZUAaPBg6dGNYFk6xUHkvurXwTiKkmQsQ7AO+Tzolwzx0tdbjk/7rcYmmNMAhjhCmsRaQRWkUgtKfx+UoH9DwgNhNUkmcjRn2b4CiRmQwVvqaJ3XupUg26qS5df/1fUddOQevTfC4R73CYhHAPRQo47gMvZ6qEIjzCwGCZKjvOnCzwysA0iydsHPftdEwmycI8H1vYfcSNBXI5rwzn7dboi9ckrsvWaLCfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xd6rrUxlzj4uLIRrO98ViCdSnM4PIJdWW1B0rDxc39E=;
 b=DlWnn0kF0huXguF8UMqn8iEfw/HuGXVY5ln+WPLfJmxCCeV8RFhf3XrQ4N1weP0NsNlu7KuNfI20y2Qvyg7a5xFabiz1vfVMmWdRiqR0dGlk3Mzfq4lCNdY+dxqmMjjXgdrRYEessmF8ZJzMNXnXrmKp3GNrNjCKO1I4pZhwS6md9BmyXPg+mBip5iQpaYpoi1Mf54/mj0/FLhMSx0kMC/+CGwjrpWNBPkrWPvBFjxrihdftuKa4RnyB75M7uq+Onxya38gM6mGCOg3+dYEb2MbrrgggfxdC5OItFF3uXvswTb53hFe5IrolMYqEJV5VVjKq+F+BvbxlVpw7ZLLDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN6PR11MB8169.namprd11.prod.outlook.com (2603:10b6:208:47d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Fri, 4 Jul
 2025 05:57:53 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 05:57:53 +0000
Message-ID: <f4a86d24-6577-49af-98e5-f855c81dfb40@intel.com>
Date: Fri, 4 Jul 2025 13:57:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
To: Peter Zijlstra <peterz@infradead.org>
CC: Michal Hocko <mhocko@suse.com>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Andrew Morton
	<akpm@linux-foundation.org>, Tim Chen <tim.c.chen@intel.com>,
	<linux-kernel@vger.kernel.org>, Jirka Hladky <jhladky@redhat.com>, "Srikanth
 Aithal" <Srikanth.Aithal@amd.com>, Suneeth D <Suneeth.D@amd.com>, Libo Chen
	<libo.chen@oracle.com>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka> <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
 <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>
 <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
 <b96a326c-7ca7-4cfe-96e2-28c1dad5c9dc@intel.com>
 <20250703140109.GW1613376@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20250703140109.GW1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) To
 DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN6PR11MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8167ea-139c-49fa-d200-08ddbabfb73c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vjk1N3pGeDlxSzF6cElIVVVCeU00U0N5UU1LZGtLckdCWXJTckJ6UFJIOHd4?=
 =?utf-8?B?dkpIOHNTUlBjSWw0WmlBdjRSTG0yd28rTU5SdWowd2FCNzB3TjJzRTR5TnhJ?=
 =?utf-8?B?aG8zZ2UxRWxnSVM5MkxzQmRPZ21rclZFbVZicGc3SEprK0EwNkMvRDI1ZG1T?=
 =?utf-8?B?Q3hORWtUQm5lbWEzbzh0YnFLSGVxQ3BudnUvTE9MeExDamlWMmplN3VVb2NK?=
 =?utf-8?B?QnN6ZkUrckpvbkVVZXRDZW5kSTR2Z1hhR3UvWUhCSU5Odk1URTUrRWtEbDJz?=
 =?utf-8?B?aGE4a1ZaRlhDZFBFY0VRQUJFZ3lKTE5NSTZ0Tlk2SEtPNTBxYVh0R1dYTXdi?=
 =?utf-8?B?TXIwaEh4VWZVWHFVS2tEaC9DeHpTQUlDOENNNXRxdzI1U2JYeDBPTGZpTVZQ?=
 =?utf-8?B?UWs4NHVxODhBNkhHUzJYbGZ6NktMaStoeTJmYmNnZzl3QTMrczNVbHZMTUdv?=
 =?utf-8?B?T1pGa3Z3dENONzR6T0VlM1gySktjN2Y3MzdKOWRBUHArVmpuQXBlbjk3czRS?=
 =?utf-8?B?OWlVZU5ZUC9aekxhUElXVkNENUZCUWExdktmNE43UTZJZHAxWGRuUDRJbHRG?=
 =?utf-8?B?OFFZUlN5L2NUQW1XaFd5eVhXaEh5b1R4YWpkZG5XTWFvckZmV3AzaUdnclRm?=
 =?utf-8?B?NXdCRkJKQTd1L3gxR09uSkcySEpPazdGVnpPejZqRXBYbmxzYXY5cWNsdDdU?=
 =?utf-8?B?dkJFemdmNWNkbEFPMUY3aW9oSUxIdmZ6TWJscjVXT3BqdEZkbmllVUpMY01N?=
 =?utf-8?B?bXNQM0F5cmNCUVYrNE5JZ0ZLV2NuamhaRDNSYWhSTWVVblRvWC9aTXlHWENl?=
 =?utf-8?B?VHVkQ0ZQcVRYWm5vM2xONjFVelQ3S2dpTXhLVFNjYXBLVjdhNHZvKy9xUVRn?=
 =?utf-8?B?V2U1b2RaSXNUQTZwa053TXoxTHdDd05NRnN6NmxibTZqa244Umlhczl4Tjc2?=
 =?utf-8?B?TTVuWFhoMm1RUGRiS0RwNm83RjlLdEZKWFNJcEFqNTNwaHZCWFFaN29kSXI0?=
 =?utf-8?B?Mm9sSjhxMk5sc09PV2pDMTZWZmd2bjhXczlqaTRPcGtBeVRrcGtLOGVhcm9I?=
 =?utf-8?B?ekl5emtEL3pEUXRMbXYwQlBGTVdKZy9rampVa2V5NE14OXMwaGVsQnVPSlli?=
 =?utf-8?B?cUNtRjVLSHFJSWtOWTZsTkZZblZYdHk4UmRVbGE5MlRQMlhtK0R2QythNnpW?=
 =?utf-8?B?dFFhVHZ3dVBWQlZJMWcrc0pwTzl3am8xUmlPZXNnYXZTUG9LcDdTbGtCL1c3?=
 =?utf-8?B?YWFTUVJVZFBRclo3dFk3UHJUT0hpUGZPVktyYm5LOXI5SFNubXZaLzFXWEtw?=
 =?utf-8?B?MDBmaHJxN0p4ZHN5LzFQMUVDZDNBeHdVa3NzM0JlRCtSdWozUlNHYVhhZkNY?=
 =?utf-8?B?MFNaWW11b2ZURlBJbFFaY2RTZnJLVFdXZW92VnpxZU9yWGthbThrOGJ3N1Za?=
 =?utf-8?B?SnY5OC9WOVY4Q0czeDFPWklPYzArSW0vZ1VkZFJpR1FwTVVpVzNTZTRvNEVZ?=
 =?utf-8?B?WThEcERqTzhtY3lQOE5qMC9XcTFWUmN1RHAxQ2VwUzB1TVkvMUFsWnpQbjZ3?=
 =?utf-8?B?TFpGVndISTlvOE5lR3NzTGZ3SzhDa0tHclZZTXJvczVmMEJVc09QQnI3Nk5X?=
 =?utf-8?B?OHFpTEFsUEdMV1Fqb2puUUhZeVdhUEwwVXFKbkowNXJtVk84YUR1R3VXR0h4?=
 =?utf-8?B?ZGIwOTdnVkpRbUVWOUZyN0NkMm00WnpyZHpXZHAvTmgwekM3WTBENEFNVXNV?=
 =?utf-8?B?UEdmWjNkc2NoWTVrb3VKM3U1RENOaStaOFo1Qm93R3N4OG81MkJtMWhCampn?=
 =?utf-8?B?VkxJemlvYkJxZ2pLQUNqaWxSbHhTaDBBeklpUHcrTU9TV0xQa3NIcmZrQUdY?=
 =?utf-8?B?cVRlRlZmYTk4ZHBmSVdFVENpcmJrQUl4d3hnNk1QRW1nRXduMGZoUU5RNkMv?=
 =?utf-8?Q?vCMyvx7vGuY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWtSRUpLZTdzb2RZdmMxTEZCK1RGQUFQSTJ0Z3lGQU5HOFMrNC9INDVNRDdq?=
 =?utf-8?B?K3ZDOUtqZDNnNjNpQ255bmJoRmw4Nyt1ZjRaSFZCS0krM0xrbVlkK0dEOW5H?=
 =?utf-8?B?dWZyMXZqU3FPUGVQRXFJTTIrbFVQSnZSRWVZR0pySTFyQ1daUDlubVZyTDha?=
 =?utf-8?B?OVg3cnh0YkJYTzNFSVBtdnFTeHRWLzF4MERiQVd4dllrbi9pcm9BREZ6M0oy?=
 =?utf-8?B?aTY3T1lSYlRDcTFLRXlKNFFYZ25OZmRDYU5IMVpGTUZWUmlHK3VnczBraTlz?=
 =?utf-8?B?a2toK0lVeFd1UnozeEhVMmdMYmJmd0xXbmZFM1MxSDVhcC9OOUx1aWMzYm80?=
 =?utf-8?B?ZGNMVERCV2FBMnRlWGVQM295TG4rVTJLcmdMRkFHTWNYc3FSWGZnQ2VyWEs4?=
 =?utf-8?B?cFphcnZJVjhnbWsxYk5LYW82LzZpaElrZm5mRndaTlRqakFlbS9KSG9XWjV6?=
 =?utf-8?B?djYrZWVYdnhiaU1UYS9DNWFxRStCU2NTQ1FvUTRDdkM3MnpwQVZHVm5CTXBG?=
 =?utf-8?B?aENpTnp1RlpkUW0wUmU1MEVwNUptMEg2R09jcDNFK2dkOVBmNUQ3RnFUTXM1?=
 =?utf-8?B?ZzNvaUFIOHplejg0MXhGdGd4Y2lNS0Noc2lOOFUrK3ByaVhqd3pUM0NPZjRD?=
 =?utf-8?B?MEJFK3BRL2lkV3VLTzdKd21MTHc0MHplZEs0c2NxUG1ldmxZTm5pdm1DcEw0?=
 =?utf-8?B?aVBxZUVQNTNVayt3L3BPSDBmbTNGbmtONkFxNzdIeWs5M3ZSVXhwOWJrdFhF?=
 =?utf-8?B?TGs1TWVNOFBrUXB6MWx1TnhyeEFmRS9IQnR0ekJYcHlXenEraWIvSVNOclV2?=
 =?utf-8?B?TWVXSlpKaml3SUN4UFVmUFhpQ1hMWk42K3lnWUxGNG1ZUlQybDNwZFFDakpB?=
 =?utf-8?B?V1BYQThKVWcxQUh5bEptbHJXS1UyTmZyanh3eE1OR1hHNXVuamVBU1lSR0tY?=
 =?utf-8?B?ZUlLWmxldUF1L2ZtS1JRbE5JUURRbStUM25WelFQdWg3THZ0Uk9LaWsyS3Ji?=
 =?utf-8?B?aXBJQTJSSzBzOC85SHFHU3ZsbFUrUWxPSi96ck1HemwxUndnaXFpemRXTHFE?=
 =?utf-8?B?SElTRFNKVEhrN21nK0xkYXA1QjdybWdQeUtQZm5zbjNvM1I0OURqbXZIdnJC?=
 =?utf-8?B?Mm43WVdmYzZoSHhRT29ZQ3F2MG5JSktMOXd0TE9mTlZsVU1YQ1R4bUt1U2xQ?=
 =?utf-8?B?WkE5d0tOUTJTK2x1VXJYaWRxdWF1dXdtdFA3RzVubmN2ci9GOVZFNFMwSXFh?=
 =?utf-8?B?Nm9YeHBNaUpvbG8waURPQlJoVmZoS1FjMTRLRXJia3MwcExQVzMwcy8vK0ti?=
 =?utf-8?B?enFWaTUyTEg0VER6VVdNaTVaSGt2Z2pMZXBkdHF1SS9paStDNlNqSllPY1d1?=
 =?utf-8?B?cThZbXU4WDBVZG0vSGltalRhK2FWb3Q5N2tmVHlHSDVtbWtZZUcyYXBHNUNs?=
 =?utf-8?B?c2pQV3JFSGp0SGw3ZEx2ZlFSZnYwQXI3TDc5SndFTmI3ZTRjeWhlYmxmWDM2?=
 =?utf-8?B?Q00rRWpHLzErallyM1JNRTY4U0FPQkN2d2hLNkN2MUpYYTFwc1ROK1hQUmtw?=
 =?utf-8?B?TjJwOElZdGFhSEpOYldPR3U2NEV3RkxMeU9IRlc5V2cyamhTVGVzRDkva1pT?=
 =?utf-8?B?NUJ2YzBIZUFJQkY1c2JMYy9CdXRWd0t1bmx3TXpyZmduVFU1TElPSVJxNnZN?=
 =?utf-8?B?aFlQTGo1Qklsb3d5alBwN0U2RkVmTW42bktYQjdKQXZhZm5Na0tJMTNWUi9X?=
 =?utf-8?B?RG0yMWd1UGRRdXNoSDEvTGZ3bm5QTE9CaTZEbkpxRVJSZnprTTJJMHFabVZs?=
 =?utf-8?B?N203ZjRIUERoa2N4UFBicVVrSStFOUwrdzRTSHAvM2lWNHVaTHM5WmUvUi8z?=
 =?utf-8?B?cnRiZmFBc3ZRbGlKVkp3TWdKSlU5MGNYdk0vdFhEbWROTFQ3OUtFcXR2Zjh5?=
 =?utf-8?B?Rkt0WTBVNFR1dmFwTmR1ZkxtN1d1ZkZ6NitvZ1lTT0ZYTzhCZ2MvZXRxaUpH?=
 =?utf-8?B?eGszTUxIRkl6cEFDZHl3b3BrOFFIMllwcTc0OUxOY3NlQjlKdEpLUHo4N0VW?=
 =?utf-8?B?dUVMK0U2dkpmRnl0UThmc1JYV1ROV2pnK3k2WFo0UG5qVGxIQ3VqZFI3STRw?=
 =?utf-8?Q?TSgowOB2IZYZSw8FkGM12EAUO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8167ea-139c-49fa-d200-08ddbabfb73c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 05:57:53.6238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZG84XpE00y/u/IbKc/rY6cXfT5WpTmq2fNPK6z8RraQkQIJ8T8PyI/2h9ScQjfditOLKNT10j+P7sLzub8+Gxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8169
X-OriginatorOrg: intel.com

On 7/3/2025 10:01 PM, Peter Zijlstra wrote:
> On Thu, Jul 03, 2025 at 09:38:08PM +0800, Chen, Yu C wrote:
>> Hi Peter,
>>
>> On 7/3/2025 8:36 PM, Peter Zijlstra wrote:
>>> On Thu, Jul 03, 2025 at 05:20:47AM -0700, Libo Chen wrote:
>>>
>>>> I agree. The other parts, schedstat and vmstat, are still quite helpful.
>>>> Also tracepoints are more expensive than counters once enabled, I think
>>>> that's too much for just counting numbers.
>>>
>>> I'm not generally a fan of eBPF, but supposedly it is really good for
>>> stuff like this.
>>>
>>> Attaching to a tracepoint and distributing into cgroup buckets seems
>>> like it should be a trivial script.
>>
>> Yes, it is feasible to use eBPF. On the other hand, if some
>> existing monitoring programs rely on /proc/{pid}/sched to observe
>> the NUMA balancing metrics of processes, it might be helpful to
>> include the NUMA migration/swap information in /proc/{pid}/sched.
>> This approach can minimize the modifications needed for these
>> monitoring programs, eliminating the need to add a new BPF script
>> to obtain NUMA balancing statistics from different sources IMHO.
> 
> Maybe...
> 
> The thing is, most of the time the effort spend on collecting all these
> numbers is wasted energy since nobody ever looks at them.
>

As for per-task NUMA balancing activity itself, we found it useful for
debugging when trying to ensure that cache-aware load balancing coexists
properly with NUMA balancing.
> Sometimes we're stuck with ABI, like the proc files you mentioned. We
> can't readily remove them, stuff would break. But does that mean we
> should endlessly add to them just because convenient?
> 
 > Ideally I would strip out all the statistics and accounting crap and> 
make sure we have tracepoints (not trace-events) covering all the needed
> spots, and then maybe just maybe have a few kernel modules that hook
> into those tracepoints to provide the legacy interfaces.
> 
> That way, only the people that care get to pay the overhead of actually
> collecting the numbers.
> 
> One can dream I suppose... :-)

I see.

If I understand correctly, it's generally not recommended to add
new items under /proc. Users are recommended to use tracepoints/events
when trying to collect the statistics, and something like schedstat_inc()
should be avoided. Is the per-task data an exception? We recently exposed
task's slice via /proc/pid/sched : D
thanks,
Chenyu

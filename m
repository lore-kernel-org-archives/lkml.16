Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185A29AAE7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767412; cv=fail; b=TGT/jLSPf3IxotsxtDgMyLu8ESWb6myBKgWoM9dDwis51khilLFPyFh/t8UxbC1ycfkHNZiW3DIbpEQsx/czfNnchIiHUPWzjsOaZpfEfA5hDMaG81qGXrS0nX+QssjKi8d/Z9PjhilZgnkxo+G1N3PDbTjRo4Zwe9TZHb74MiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767412; c=relaxed/simple;
	bh=1oLYkatx3S1k9KkYcTp4NaF+ja/70+ZiAyFO4Zv6ofQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XQSCSyWCD6BgWOPz23BWHhU5Qts6QJXELUnOWnD8E7Qq8Gn8bpfrfoK5LpceKi91qJ4fzohDBbn/+so+O7xh68QDi81dMXdMGa4H+ziOTHg0WFmYWUkN4bhhpmBksKfn7z2UET/VKvsej2Fix8d8Cd3XK+SNYpAfWV8AV6Y+VEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4LxAM59; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4LxAM59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750767410; x=1782303410;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1oLYkatx3S1k9KkYcTp4NaF+ja/70+ZiAyFO4Zv6ofQ=;
  b=X4LxAM59bFqyOaCsc5R0/5O6DUwfsb49SvLoLvNcbVpu1cW1dakP9aPD
   f7mBHyWVzhOhATxamTHa/l1JlLNLY0GsV+Aw0850Sy94Vsw+Uho2Dtllo
   9z7tnoxMgiftd6oX9z2jp36WfvWw2J1achkTpz3GYF0zh9jr39xiqgrcj
   yUnOE6fMqHClu4wJj3QRk9h/aT0uqGPdpw2vyDRc/fP3ttt8kaTsqfD2E
   UJ/xkBJ1msG8nYHcNW6dn3mqt6r/fsWtLY92s3Rfl4PY4nuSI6lB3fG+j
   Dv7X0n4+VRf6opAoe9t7kHPk0oKUoASOc7ZB+4eaot0hjdlFHhzObWsf7
   w==;
X-CSE-ConnectionGUID: FiDwoApvTkqmulxZW8etig==
X-CSE-MsgGUID: fYZS79SRSbSbNia3wsLANQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="78423577"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="78423577"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 05:16:48 -0700
X-CSE-ConnectionGUID: W/kQeF9ESZCfl/sNxhXa1A==
X-CSE-MsgGUID: 1tbjr98xQrG60Oe0hNcyfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="157672584"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 05:16:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 05:16:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 05:16:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 05:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3LrLfq9TYRhnajtwAbG6IcDIFUJUtneWdMaz2UejdEbVhN7I3AB1nl6svz0jIVLzVx/IWZJf2BWigUsXoJn34vqJYSv/pyxQo9QH1hVvPn92dEU/fAxXY+Hoofgy9Gkup2StuwMWkm5qz5DkaYYfpIRkgYDrbd9jXjkVwQxTaul9aRVgHVfdxIO0v7jDaZSooWRwPHaJ6AhrE4FjVR0c6Yqh5gm2GKgGTQDoYNNFOvIZipapw50enJkcLPDGUiSzXlMkBqN3GfFP0ybjgKe+WaA8uFnjz/ZDNSf96ElUf0ffsPgGXZtMwYcH41+Z/XmRoPkrwMYnx28tSnNElkZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JO8KMg7Q/ZKdV0EwWgxTeWslvCw+XDDe63avNE8LXog=;
 b=HUBiqdjFFo93BI2/Ox/2PS2+AnV6EBLessWPQpPdBiLuIKgHHxdHuT7kHiD5JmTlUY/x7tWgHpJEfkfkjp6Hh2DO4u6m5AoJ7fyZHox0h2xthyvr8zkXSFatlbMY1oKOJ9EbEuJzexKE7zU8nLQH2rAA8kcL3mSwSY/4uVUhtGa2xsfPH4gy9g9UfMbVZSL1qfnOj+LUP1RZTjP19TTAar42y45SqZmlDZdxM1nD9dZUTc63JoR0AsHiEB2QEruMs+urdjPgKDv6wAI6bvD3vx5YVaCuaBNJuSFz29zL7Dr0orvaqTbcll/R4PLL56s47z4oZxAuOXTSLrWGLMBXDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Tue, 24 Jun 2025 12:16:14 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 12:16:14 +0000
Message-ID: <1dd0ea0b-4515-4507-9b50-75de87fee377@intel.com>
Date: Tue, 24 Jun 2025 20:16:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
	<linux-kernel@vger.kernel.org>, Tim Chen <tim.c.chen@linux.intel.com>, "Peter
 Zijlstra" <peterz@infradead.org>, "Gautham R . Shenoy"
	<gautham.shenoy@amd.com>, Ingo Molnar <mingo@redhat.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SJ0PR11MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 6129c8aa-b44b-4e0b-c41d-08ddb318e9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGVtSkZlZHVQRE11T1JOc3E2L0JmVU1mTyttaWVyVjZjUWdjVmdzeFBUMmkz?=
 =?utf-8?B?cHpldFlrMitwUXlWUWZKUXdoT2Jmall6djVHMDl5SzRrRWZWL2ljbWUybW1l?=
 =?utf-8?B?YXRyQlgxM1J3SzFKb1Y4dUgyZkE1TE90M0NyaVh5L05zb2NtQWpuc2ZCdXNz?=
 =?utf-8?B?dk8raGlRSzFEK1NvSFM0NUZWZnNROEczYWlyS0lTSUFGUFdDNmxJNllVbnp0?=
 =?utf-8?B?cG9sZHFFQ1hSVnRaU2hnZThiYVdEaHg0RTlubUJGVUp1Rlh2M0ZKL21MYjRs?=
 =?utf-8?B?d1M5T3N0emlYMHB3RkxSNDYzSllLOUVPMFlFSjFBdlhCVExmSngydkJBQXNw?=
 =?utf-8?B?WEZLS0YzWkRrZTl5WDcyczlaSE9kcVdjeG9OTkx6ekdtRkhkUHdTT3VqdjJM?=
 =?utf-8?B?akVkUlVaTTVZaXMwOFBlS2VUSXRvTzZRQkRtTUpYWVBEbXE0MDBlMlZ4dmFk?=
 =?utf-8?B?YzR1emVaSHBrYklYT1R0UnAwb1dpVEJCYlBqRWt4VHNjaXJUVEZYeGI2M0p5?=
 =?utf-8?B?bjJrcXoycHJ4WnFwWnlLRW1wUmt4ZG9ySGZWN2Y1ZWxiMWJ3MkpUUVZPcnp5?=
 =?utf-8?B?ckg5RlJhMm9WOThXVitJV1BMZ0Q0S05jOTZBdXB5bTRSR0gvZ0gxV2pyM2Y1?=
 =?utf-8?B?S3FRYjBOQXExbUdUUUxVckJEVmdzcGgrMnoxTSt6eE1YU2F1Rmc0ZTd4L2kw?=
 =?utf-8?B?cCt5ck1sNnMwMmNkOCsvdGRZdDNUbGxmNHdIbVpuc3lSZUw5OTgwVmxuY2Zs?=
 =?utf-8?B?NUEvVFFDd3QzRUJaa1pSaWx2YmNvUXlBbjN0OVRQNjRGUndGdmoyZGo3QkRT?=
 =?utf-8?B?MXZmSFdQWGpPUncxRmp5cjc1RUhrc3ppNnc2TW43VEVUYzN2YnJlVGZIeVpN?=
 =?utf-8?B?NlpVSGtGZzVvSE5OV21SV0ROSytTVGFJbHZOZUs0NWJXeUFGeFNYcmkzbTZG?=
 =?utf-8?B?ek1vR1VlNjNYbkp2VVA5RTN4MTlrNko0d1V0bDJXMUVsSHpHdDM3aUlnR0RM?=
 =?utf-8?B?clVqRDFpeFFWNzB1ZXd3SXk4c3diTzh5SFVkQThuTktnREF5SVVxdktCMHRH?=
 =?utf-8?B?YVZvTVZkOXFRdE0vMVRnY0JoRDNOdFd5dXVrZlN1YWRkU0sxcGZUNVROTjU1?=
 =?utf-8?B?YTg2Z29DUG1PblNxVjYxcWhMaW54ZnpGV3hodW11UW5wUkRwbUhiN2plYkk1?=
 =?utf-8?B?ZStpVXprSytOS1ZlWkFmUjdma1NxM1NVbDRvRkhadXJKcU9XdWJjenZJclpP?=
 =?utf-8?B?c2xGQzhmbFBpWE5VQTBnUTdoUERmWEdOcW0zMm1seGVkUEw4YlpVREIrdXNh?=
 =?utf-8?B?QStGcjVCVjJ2Y2pZbys5TTZlVmRuRklYUGxvNmpwNmFlK0UyVHIrUExOMUFX?=
 =?utf-8?B?MUlaZ1MrQ3dlemtiVnU2U3FDV3JNYnhJbzcwbDk0NUllOG1ibW12cjQyU3Ir?=
 =?utf-8?B?bm1NVEpCSGwvWGlQVVhkNUpGdlluK2JRNkJFNVQ3akd3TjZwaURpdUNTN3Fx?=
 =?utf-8?B?cERqbGRYVjEwckpVWnFWV2lsL0haeHlDNThmMjlicjcwTzNmbmw3YnRaZ2I1?=
 =?utf-8?B?d1lRYmRWWVUvNzBmRXZCa1A2dEo2R054YlMyb0xITDVSWjVHWDFpeThVODVD?=
 =?utf-8?B?WUl1OGlCa1AvSnRHcGM2M085SldVeDMwZ2k4OTFsSzl0OGFoRllsbXFPbTVF?=
 =?utf-8?B?QXlFZTA0Vm0zN1F3TGc2Y3ZWeEhVOCtpcEdXYm1HcitLQ1M4U2E1b3FUUmho?=
 =?utf-8?B?V200YUlaYThKMTM5RTBLQ3pleUtFVm1qTlZ2TEtQZVc1eFplVURkY2pxWmpF?=
 =?utf-8?B?RWNCRW1TWGFWVjFhdXlaK2JIU2J1dG11TjJ2bkQ3ay9WYytWelJKaHhoSkZF?=
 =?utf-8?B?OUhrbjg5dHRwK0FpMUZCSWgvN3ptMHltUjl2NlRNRGdzdjZTWlUwSnM3bXpl?=
 =?utf-8?Q?jzF/a+h0uhg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk1HaWZScFZtWGhaSG8vQjhkM2NYTWRjMXFFdHkvTzJURDZ2MndjZXNPYTZj?=
 =?utf-8?B?RDdBQzQwWFRPZWg4d1ZSVUxWS3VHakt2SVE2SlIwVkdpQ3M0UFZIN3pDTDJW?=
 =?utf-8?B?czRqVzZ5Mjl4QXZGeUs1N0NhMXQzRTFJU3JGdUloUFBmYnVMazJuUFgzeFZZ?=
 =?utf-8?B?SkVVZ3hVcTFBNDlxZ2VrcEFpdWpSa1h0M2xYUE5zRjVoYnkzQ1RZWFNFdzJP?=
 =?utf-8?B?R3h6OXhpRzFCamdENjRXenpINzlSM2xMT3UvWE4xSVdVK0RKS0lQRm5WZEhp?=
 =?utf-8?B?NCtMZUw0WmpUeVhWdFpiR3o0eHhWeEUzUVd3eU5rRUJZdXNDWGlPTmN6eHll?=
 =?utf-8?B?d0ZpM0k3dEExUzY2bXVWTUVGMDBIeUViZ3NWWTBXQWxDeEd4aVg1UnZtVGRa?=
 =?utf-8?B?OUJsOEVENnFkK1F4TUFzVVRlckpDbDMyNHNaWmFwS3dPNUUwMk5OT1VzTjho?=
 =?utf-8?B?Vmp1cGdHaC9lMHh0bU1qckwzaG9OcklLajNhMlczc0RTMVdJOUtreGdGcGpM?=
 =?utf-8?B?WERPZlc3d1NxblpNVlp1bFZuMHFhc3pLUkxIM0lkbUVxVHJhWlBZWTJFSjBs?=
 =?utf-8?B?ajEwWGpBbXpOQVZJYVBBTzY2dVVpRlU0OC8wQmZiZFVWd1NWditkN1dGSTUv?=
 =?utf-8?B?RzFjN09mTjZ4N2FzR3Q0NWwwTmk5WWNMQWVsdWtDOHFzMUo5TTA5U2lXc01P?=
 =?utf-8?B?S2dYK1lUWmZnTWpSVFYvSVFBbFY1bzhUM0dvU0lNT0QvaDI0WGUrTGFhbUxy?=
 =?utf-8?B?OTZCOHBVNlJ6NWpSOU9mOS81S0RsRTROdUxwQnJIOXhDTTZqNE0wVCtuMzV5?=
 =?utf-8?B?SVBoVGpRdzhZOGcwMlgycWxqWUN2ZFhSVVBqTTROYTU2WVQ4dkhpbHY5cmM1?=
 =?utf-8?B?a1RuaVlrSS9jajNSR296Y3cxRjhXTGxtK3RuOW9nQmFMcG1JN1Z0N1BjN3pu?=
 =?utf-8?B?dFNwNDZ2VWo1cUpoamlJYzl0aXNVbFRYUDh2ODRXMXNxenBiSkFCNEVDUG44?=
 =?utf-8?B?MkxnMkZwTVJpdkRNSXFRa29kVFJnNGRhMVh5WkZtZW5OK0RHM0pER3VTY0Vv?=
 =?utf-8?B?TUd4aXo5UUR2eGdhMnBkVEcxZ2RpWjYxaHFvU1d1TEo4ck1tOFFRVE4wQkpz?=
 =?utf-8?B?WnNqajdTSm9KL2tDSk9vaDM1UkN1RGNnK0tsUkMyRFVKQjEwNG12L3hnY21D?=
 =?utf-8?B?L1NxVnErYWNxQy93WmhXQXFMVGVIWXJzdFc2TDJCWUQrbVJJeUNmVXZjWDJQ?=
 =?utf-8?B?U1RsYkthRHdGNld6bHhnZk1UUW13VDR5dGF1amovaHNEakFqZGgxMGFiK3Fs?=
 =?utf-8?B?Q3NwN3FQblMxdmVySDRtNng2VnBVcjNiM0ZoYWhZaWRkOWFheWljY3I3RmJH?=
 =?utf-8?B?cG9uSHc5SkZYY1ZCUkxsYVN5U1JDUFFqWnBXSHRXRHNyUFIzdHZwSnVhZGhx?=
 =?utf-8?B?cEM2T0xwL0xpZTJrWDRmc3poWkZWaXZuaVBaVjMyMEJmMGlxVHhWY1hnZm1Z?=
 =?utf-8?B?N3V5MjA2Z0oxZnhxeTRzWU0xbHhNc3hiM1VEZUdTZkllTU5JeHBRalIzRW44?=
 =?utf-8?B?Tk5XL3J2cURBbGdoRExGaHhpYlBROWZGNHA3c2VtYWV6MEwxZDh6NDJDTDdW?=
 =?utf-8?B?MDVobkp1QkI3bFNwOXpLUGRVdEVXTjA0SW5WY25ROW1QUWlMRjNtYzlEaVE3?=
 =?utf-8?B?QTM3VEZVS2tyY3ljQnV1M3BDUkJoR1pndm5panNkM3E5ZGdFQzRLQnRKM28w?=
 =?utf-8?B?WTVqbXZidC9oYTNpdms1WVVaZWdpZkRwZGpxejZVbFFvUW5rTUp0dHBSTWZF?=
 =?utf-8?B?YUpjYTY3Wlh3bmdhdzRlQzVzZVNEbGlLSGpCaE1uMVFwUktzaUdsalZJTDRw?=
 =?utf-8?B?anNwWXpuSEJNRm4zQnhZaXFWb2JjenQyQlVPWlNkRmpLQm1YNjFxUmJUU3NZ?=
 =?utf-8?B?bU5HWlJNTzR0b3QyYUxLK3BSSDZjbkRxcFhwK1hacjNyRm1BUUc2Nll1Ull4?=
 =?utf-8?B?a2tXSzdxTit4WWU0NmdOcGdKY3RkekpmTEV4YXd2Ynd3clNkM1JYYjdiL3Ju?=
 =?utf-8?B?OFBra0lIZXdBckw3ZWt5NVdIbGpJcEZxMmorR0hWbkFoL0ZnVzl2SXdZSnFk?=
 =?utf-8?Q?dtLNCTZzx9T2DD5G2UrZBGoqn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6129c8aa-b44b-4e0b-c41d-08ddb318e9f7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:16:14.5248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnsonGAOVbs+7fQSaU3grg3dU4j+gs5jzt8EhPQOw13YzDtI7mTa+nsRr+Tq1yr4Lw5HEmE9+2633rkKbf7iAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
X-OriginatorOrg: intel.com


On 6/24/2025 1:00 PM, K Prateek Nayak wrote:
> Hello Tim,
> 
> On 6/18/2025 11:57 PM, Tim Chen wrote:
>> AMD Milan is also tested. There are 4 Nodes and 32 CPUs per node.
>> Each node has 4 CCX(shared LLC) and each CCX has 8 CPUs. Hackbench
>> with 1 group test scenario benefits from cache aware load balance
>> too:
>>
>> hackbench(1 group and fd ranges in [1,6]:
>> case                    load            baseline(std%)  compare%( std%)
>> threads-pipe-1          1-groups         1.00 (  1.22)   +2.84 (  0.51)
>> threads-pipe-2          1-groups         1.00 (  5.82)  +42.82 ( 43.61)
>> threads-pipe-3          1-groups         1.00 (  3.49)  +17.33 ( 18.68)
>> threads-pipe-4          1-groups         1.00 (  2.49)  +12.49 (  5.89)
>> threads-pipe-5          1-groups         1.00 (  1.46)   +8.62 (  4.43)
>> threads-pipe-6          1-groups         1.00 (  2.83)  +12.73 (  8.94)
>> threads-sockets-1       1-groups         1.00 (  1.31)  +28.68 (  2.25)
>> threads-sockets-2       1-groups         1.00 (  5.17)  +34.84 ( 36.90)
>> threads-sockets-3       1-groups         1.00 (  1.57)   +9.15 (  5.52)
>> threads-sockets-4       1-groups         1.00 (  1.99)  +16.51 (  6.04)
>> threads-sockets-5       1-groups         1.00 (  2.39)  +10.88 (  2.17)
>> threads-sockets-6       1-groups         1.00 (  1.62)   +7.22 (  2.00)
>>
>> Besides a single instance of hackbench, four instances of hackbench are
>> also tested on Milan. The test results show that different instances of
>> hackbench are aggregated to dedicated LLCs, and performance improvement
>> is observed.
>>
>> schbench mmtests(unstable)
>>                                    baseline              nowake_lb
>> Lat 50.0th-qrtle-1         9.00 (   0.00%)        8.00 (  11.11%)
>> Lat 90.0th-qrtle-1        12.00 (   0.00%)       10.00 (  16.67%)
>> Lat 99.0th-qrtle-1        16.00 (   0.00%)       14.00 (  12.50%)
>> Lat 99.9th-qrtle-1        22.00 (   0.00%)       21.00 (   4.55%)
>> Lat 20.0th-qrtle-1       759.00 (   0.00%)      759.00 (   0.00%)
>> Lat 50.0th-qrtle-2         9.00 (   0.00%)        7.00 (  22.22%)
>> Lat 90.0th-qrtle-2        12.00 (   0.00%)       12.00 (   0.00%)
>> Lat 99.0th-qrtle-2        16.00 (   0.00%)       15.00 (   6.25%)
>> Lat 99.9th-qrtle-2        22.00 (   0.00%)       21.00 (   4.55%)
>> Lat 20.0th-qrtle-2      1534.00 (   0.00%)     1510.00 (   1.56%)
>> Lat 50.0th-qrtle-4         8.00 (   0.00%)        9.00 ( -12.50%)
>> Lat 90.0th-qrtle-4        12.00 (   0.00%)       12.00 (   0.00%)
>> Lat 99.0th-qrtle-4        15.00 (   0.00%)       16.00 (  -6.67%)
>> Lat 99.9th-qrtle-4        21.00 (   0.00%)       23.00 (  -9.52%)
>> Lat 20.0th-qrtle-4      3076.00 (   0.00%)     2860.00 (   7.02%)
>> Lat 50.0th-qrtle-8        10.00 (   0.00%)        9.00 (  10.00%)
>> Lat 90.0th-qrtle-8        12.00 (   0.00%)       13.00 (  -8.33%)
>> Lat 99.0th-qrtle-8        17.00 (   0.00%)       17.00 (   0.00%)
>> Lat 99.9th-qrtle-8        22.00 (   0.00%)       24.00 (  -9.09%)
>> Lat 20.0th-qrtle-8      6232.00 (   0.00%)     5896.00 (   5.39%)
>> Lat 50.0th-qrtle-16        9.00 (   0.00%)        9.00 (   0.00%)
>> Lat 90.0th-qrtle-16       13.00 (   0.00%)       13.00 (   0.00%)
>> Lat 99.0th-qrtle-16       17.00 (   0.00%)       18.00 (  -5.88%)
>> Lat 99.9th-qrtle-16       23.00 (   0.00%)       26.00 ( -13.04%)
>> Lat 20.0th-qrtle-16    10096.00 (   0.00%)    10352.00 (  -2.54%)
>> Lat 50.0th-qrtle-32       15.00 (   0.00%)       15.00 (   0.00%)
>> Lat 90.0th-qrtle-32       25.00 (   0.00%)       26.00 (  -4.00%)
>> Lat 99.0th-qrtle-32       49.00 (   0.00%)       50.00 (  -2.04%)
>> Lat 99.9th-qrtle-32      945.00 (   0.00%)     1005.00 (  -6.35%)
>> Lat 20.0th-qrtle-32    11600.00 (   0.00%)    11632.00 (  -0.28%)
>>
>> Netperf/Tbench have not been tested yet. As they are single-process
>> benchmarks that are not the target of this cache-aware scheduling.
>> Additionally, client and server components should be tested on
>> different machines or bound to different nodes. Otherwise,
>> cache-aware scheduling might harm their performance: placing client
>> and server in the same LLC could yield higher throughput due to
>> improved cache locality in the TCP/IP stack, whereas cache-aware
>> scheduling aims to place them in dedicated LLCs.
> 
> I have similar observation from my testing.
> 

Prateek, thanks for your test.

> tl;dr
> 
> o Benchmark that prefer co-location and run in threaded mode see
>    a benefit including hackbench at high utilization and schbench
>    at low utilization.
> 

Previously, we tested hackbench with one group using different
fd pairs. The number of fds (1–6) was lower than the number
of CPUs (8) within one CCX. If I understand correctly, the
default number of fd pairs in hackbench is 20. We might need
to handle cases where the number of threads (nr_thread)
exceeds the number of CPUs per LLC—perhaps by
skipping task aggregation in such scenarios.

> o schbench (both new and old but particularly the old) regresses
>    quite a bit on the tial latency metric when #workers cross the
>    LLC size.
> 

As mentioned above, maybe re-consider the nr_thread vs nr_cpus_per_llc
could mitigate the issue. Besides, maybe introduce a rate limit
for cache aware aggregation would help.

> o client-server benchmarks where client and servers are threads
>    from different processes (netserver-netperf, tbench_srv-tbench,
>    services of DeathStarBench) seem to noticeably regress due to
>    lack of co-location between the communicating client and server.
> 
>    Not sure if WF_SYNC can be an indicator to temporarily ignore
>    the preferred LLC hint.

WF_SYNC is used in wakeup path, the current v3 version does the
task aggregation in the load balance path. We'll look into this
C/S scenario.

> 
> o stream regresses in some runs where the occupancy metrics trip
>    and assign a preferred LLC for all the stream threads bringing
>    down performance in !50% of the runs.
> 

May I know if you tested the stream with mmtests under OMP mode,
and what do stream-10 and stream-100 mean? Stream is an example
where all threads have their private memory buffers—no
interaction with each other. For this benchmark, spreading
them across different Nodes gets higher memory bandwidth because
stream allocates the buffer to be at least 4X the L3 cache size.
We lack a metric that can indicate when threads share a lot of
data (e.g., both Thread 1 and Thread 2 read from the same
buffer). In such cases, we should aggregate the threads;
otherwise, do not aggregate them (as in the stream case).
On the other hand, stream-omp seems like an unrealistic
scenario—if threads do not share buffer, why create them
in the same process?


> Full data from my testing is as follows:
> 
> o Machine details
> 
> - 3rd Generation EPYC System
> - 2 sockets each with 64C/128T
> - NPS1 (Each socket is a NUMA node)
> - C2 Disabled (POLL and C1(MWAIT) remained enabled)
> 
> o Kernel details
> 
> tip:      tip:sched/core at commit 914873bc7df9 ("Merge tag
>             'x86-build-2025-05-25' of
>             git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> 
> llc-aware-lb-v3: tip + this series as is
> 
> o Benchmark results
> 
>      ==================================================================
>      Test          : hackbench
>      Units         : Normalized time in seconds
>      Interpretation: Lower is better
>      Statistic     : AMean
>      ==================================================================
>      Case:           tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
>       1-groups     1.00 [ -0.00](13.74)     1.03 [ -2.77](12.01)
>       2-groups     1.00 [ -0.00]( 9.58)     1.02 [ -1.78]( 6.12)
>       4-groups     1.00 [ -0.00]( 2.10)     1.01 [ -0.87]( 0.91)
>       8-groups     1.00 [ -0.00]( 1.51)     1.03 [ -3.31]( 2.06)
>      16-groups     1.00 [ -0.00]( 1.10)     0.95 [  5.36]( 1.67)
> 
> 
>      ==================================================================
>      Test          : tbench
>      Units         : Normalized throughput
>      Interpretation: Higher is better
>      Statistic     : AMean
>      ==================================================================
>      Clients:    tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
>          1     1.00 [  0.00]( 0.82)     0.96 [ -3.68]( 1.23)
>          2     1.00 [  0.00]( 1.13)     0.98 [ -2.30]( 0.51)
>          4     1.00 [  0.00]( 1.12)     0.96 [ -4.14]( 0.22)
>          8     1.00 [  0.00]( 0.93)     0.96 [ -3.61]( 0.46)
>         16     1.00 [  0.00]( 0.38)     0.95 [ -4.98]( 1.26)
>         32     1.00 [  0.00]( 0.66)     0.93 [ -7.12]( 2.22)
>         64     1.00 [  0.00]( 1.18)     0.95 [ -5.44]( 0.37)
>        128     1.00 [  0.00]( 1.12)     0.93 [ -6.78]( 0.64)
>        256     1.00 [  0.00]( 0.42)     0.94 [ -6.45]( 0.47)
>        512     1.00 [  0.00]( 0.14)     0.93 [ -7.26]( 0.27)
>       1024     1.00 [  0.00]( 0.26)     0.92 [ -7.57]( 0.31)
> 
> 
>      ==================================================================
>      Test          : stream-10
>      Units         : Normalized Bandwidth, MB/s
>      Interpretation: Higher is better
>      Statistic     : HMean
>      ==================================================================
>      Test:       tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
>       Copy     1.00 [  0.00]( 8.37)     0.39 [-61.05](44.88)
>      Scale     1.00 [  0.00]( 2.85)     0.43 [-57.26](40.60)
>        Add     1.00 [  0.00]( 3.39)     0.40 [-59.88](42.02)
>      Triad     1.00 [  0.00]( 6.39)     0.41 [-58.93](42.98)
> 
> 
>      ==================================================================
>      Test          : stream-100
>      Units         : Normalized Bandwidth, MB/s
>      Interpretation: Higher is better
>      Statistic     : HMean
>      ==================================================================
>      Test:       tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
>       Copy     1.00 [  0.00]( 3.91)     0.36 [-63.95](51.04)
>      Scale     1.00 [  0.00]( 4.34)     0.40 [-60.31](43.12)
>        Add     1.00 [  0.00]( 4.14)     0.38 [-62.46](43.40)
>      Triad     1.00 [  0.00]( 1.00)     0.36 [-64.38](43.12)
> 
> 
>      ==================================================================
>      Test          : netperf
>      Units         : Normalized Througput
>      Interpretation: Higher is better
>      Statistic     : AMean
>      ==================================================================
>      Clients:         tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
>       1-clients     1.00 [  0.00]( 0.41)     0.97 [ -3.26]( 1.30)
>       2-clients     1.00 [  0.00]( 0.58)     0.96 [ -4.24]( 0.71)
>       4-clients     1.00 [  0.00]( 0.35)     0.96 [ -4.19]( 0.67)
>       8-clients     1.00 [  0.00]( 0.48)     0.95 [ -5.41]( 1.36)
>      16-clients     1.00 [  0.00]( 0.66)     0.95 [ -5.31]( 0.93)
>      32-clients     1.00 [  0.00]( 1.15)     0.94 [ -6.43]( 1.44)
>      64-clients     1.00 [  0.00]( 1.38)     0.93 [ -7.14]( 1.63)
>      128-clients    1.00 [  0.00]( 0.87)     0.89 [-10.62]( 0.78)
>      256-clients    1.00 [  0.00]( 5.36)     0.92 [ -8.04]( 2.64)
>      512-clients    1.00 [  0.00](54.39)     0.88 [-12.12](48.87)
> 
> 
>      ==================================================================
>      Test          : schbench
>      Units         : Normalized 99th percentile latency in us
>      Interpretation: Lower is better
>      Statistic     : Median
>      ==================================================================
>      #workers: tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
>        1     1.00 [ -0.00]( 8.54)     0.54 [ 45.65](28.79)
>        2     1.00 [ -0.00]( 1.15)     0.56 [ 44.00]( 2.09)
>        4     1.00 [ -0.00](13.46)     0.67 [ 33.33](35.68)
>        8     1.00 [ -0.00]( 7.14)     0.63 [ 36.84]( 4.28)
>       16     1.00 [ -0.00]( 3.49)     1.05 [ -5.08]( 9.13)
>       32     1.00 [ -0.00]( 1.06)    32.04 [-3104.26](81.31)
>       64     1.00 [ -0.00]( 5.48)    24.51 [-2351.16](81.18)
>      128     1.00 [ -0.00](10.45)    14.56 [-1356.07]( 5.35)
>      256     1.00 [ -0.00](31.14)     0.95 [  4.80](20.88)
>      512     1.00 [ -0.00]( 1.52)     1.00 [ -0.25]( 1.26)
> 
> 
>      ==================================================================
>      Test          : new-schbench-requests-per-second
>      Units         : Normalized Requests per second
>      Interpretation: Higher is better
>      Statistic     : Median
>      ==================================================================
>      #workers: tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
>        1     1.00 [  0.00]( 1.07)     0.97 [ -3.24]( 0.98)
>        2     1.00 [  0.00]( 0.00)     0.99 [ -1.17]( 0.15)
>        4     1.00 [  0.00]( 0.00)     0.96 [ -3.50]( 0.56)
>        8     1.00 [  0.00]( 0.15)     0.98 [ -1.76]( 0.31)
>       16     1.00 [  0.00]( 0.00)     0.94 [ -6.13]( 1.93)
>       32     1.00 [  0.00]( 3.41)     0.97 [ -3.18]( 2.10)
>       64     1.00 [  0.00]( 1.05)     0.82 [-18.14](18.41)
>      128     1.00 [  0.00]( 0.00)     0.98 [ -2.27]( 0.20)
>      256     1.00 [  0.00]( 0.72)     1.01 [  1.23]( 0.31)
>      512     1.00 [  0.00]( 0.57)     1.00 [  0.00]( 0.12)
> 
> 
>      ==================================================================
>      Test          : new-schbench-wakeup-latency
>      Units         : Normalized 99th percentile latency in us
>      Interpretation: Lower is better
>      Statistic     : Median
>      ==================================================================
>      #workers: tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
>        1     1.00 [ -0.00]( 9.11)     0.88 [ 12.50](11.92)
>        2     1.00 [ -0.00]( 0.00)     0.86 [ 14.29](11.92)
>        4     1.00 [ -0.00]( 3.78)     0.93 [  7.14]( 4.08)
>        8     1.00 [ -0.00]( 0.00)     0.83 [ 16.67]( 5.34)
>       16     1.00 [ -0.00]( 7.56)     0.85 [ 15.38]( 0.00)
>       32     1.00 [ -0.00](15.11)     0.80 [ 20.00]( 4.19)
>       64     1.00 [ -0.00]( 9.63)     1.05 [ -5.00](24.47)
>      128     1.00 [ -0.00]( 4.86)     1.57 [-56.78](68.52)
>      256     1.00 [ -0.00]( 2.34)     1.00 [ -0.00]( 0.57)
>      512     1.00 [ -0.00]( 0.40)     1.00 [ -0.00]( 0.34)
> 
> 
>      ==================================================================
>      Test          : new-schbench-request-latency
>      Units         : Normalized 99th percentile latency in us
>      Interpretation: Lower is better
>      Statistic     : Median
>      ==================================================================
>      #workers: tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
>        1     1.00 [ -0.00]( 2.73)     1.06 [ -5.71]( 0.25)
>        2     1.00 [ -0.00]( 0.87)     1.08 [ -8.37]( 0.78)
>        4     1.00 [ -0.00]( 1.21)     1.09 [ -9.15]( 0.79)
>        8     1.00 [ -0.00]( 0.27)     1.06 [ -6.31]( 0.51)
>       16     1.00 [ -0.00]( 4.04)     1.85 [-84.55]( 5.11)
>       32     1.00 [ -0.00]( 7.35)     1.52 [-52.16]( 0.83)
>       64     1.00 [ -0.00]( 3.54)     1.06 [ -5.77]( 2.62)
>      128     1.00 [ -0.00]( 0.37)     1.09 [ -9.18](28.47)
>      256     1.00 [ -0.00]( 9.57)     0.99 [  0.60]( 0.48)
>      512     1.00 [ -0.00]( 1.82)     1.03 [ -2.80]( 1.16)
> 
> 
>      ==================================================================
>      Test          : Various longer running benchmarks
>      Units         : %diff in throughput reported
>      Interpretation: Higher is better
>      Statistic     : Median
>      ==================================================================
>      Benchmarks:                  %diff
>      ycsb-cassandra              -0.99%
>      ycsb-mongodb                -0.96%
>      deathstarbench-1x           -2.09%
>      deathstarbench-2x           -0.26%
>      deathstarbench-3x           -3.34%
>      deathstarbench-6x           -3.03%
>      hammerdb+mysql 16VU         -2.15%
>      hammerdb+mysql 64VU         -3.77%
> 
>>
>> This patch set is applied on v6.15 kernel.
>> There are some further work needed for future versions in this
>> patch set.  We will need to align NUMA balancing with LLC aggregations
>> such that LLC aggregation will align with the preferred NUMA node.
>>
>> Comments and tests are much appreciated.
> 
> I'll rerun the test once with the SCHED_FEAT() disabled just to make
> sure I'm not regressing because of some other factors. For the major
> regressions, I'll get the "perf sched stats" data to see if anything
> stands out.

It seems that task migration and task bouncing between its preferred
LLC and non-preferred LLC is one symptom that caused regression.

thanks,
Chenyu

> 
> I'm also planning on getting the data from a Zen5c system with larger
> LLC to see if there is any difference in the trend (I'll start with the
> microbenchmarks since setting the larger ones will take some time)
> 
> Sorry for the lack of engagement on previous versions but I plan on
> taking a better look at the series this time around. If you need any
> specific data from my setup, please do let me know.
> 


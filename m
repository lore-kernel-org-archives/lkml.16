Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A820FA86
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784971; cv=fail; b=ukx2vsQwsIeFUqGNZs/Sgh/jAj4GseRvjp328zXVAYJQ82oxx9z/wXpanwMPD/C70LZe1uXAKcmm4KDJCylEQtnQ06Go4lzpTFrB282Vk4Lpw61E5Tp07AkPl/lpTJYRuEowNWPvOYeijOxPK2e9T9EmR9OfNJbPeD3g2Accv1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784971; c=relaxed/simple;
	bh=QQryRB4EJqQ004lnGfu0Ca/SeLyn/Vd4i/lfLmOZPRA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H6U06TG6FLeNVB7yiJlv3DM9oszTSYLSBCRuVXtm44ckGeUTa0cdGFbexPqyWJd/6OBpyw8GMIN3tdOjb9RJhcLM+0PJku3XZKpwMapeq9yRz50mBM0qrUTKrTBsmxm8lNEeKuFOr6AqLf1RyQ8JbaKks+jzgOL788v+TtUV8a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cA4REQ/w; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cA4REQ/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744784970; x=1776320970;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QQryRB4EJqQ004lnGfu0Ca/SeLyn/Vd4i/lfLmOZPRA=;
  b=cA4REQ/wroLvXXxpz8jpSMdqlAv+Jm5GiELJNnQMP5DJLYNiT/wBaSWy
   ADYK1E4SboEQpOGBo+r3pG0yk0fZZQiBLJ8GKceNHtHw9Z0bgjdF5rU4b
   1+3UOsic6w/B9VLBDY/2Vf5ZV1z+N0A6xAJLyG6N9vfpLosz735Ck756c
   fvYLTWC+UGsFr2IOg18S+ezuim8Wa48xPjh4aZAvUNcKYYKs7EBr6qD3L
   UR78qJkr9OV4K6Hy65Se+Hgx82A+9N46OqSQpoee9jHXvpNjD43mg46pJ
   +q2sASuG4kAxKZjeZLsQoGt/6OfLaD3r86ro6/gVRC9fYmn4ucxexUAL1
   A==;
X-CSE-ConnectionGUID: E+OBmWOMTq+3j0p3/eqggQ==
X-CSE-MsgGUID: 3LjnbA+SQE+D0HbJcfFplg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46333065"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46333065"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:29:29 -0700
X-CSE-ConnectionGUID: UPIToG+wTvaZI0JeZhRq8Q==
X-CSE-MsgGUID: d5T+3F05Sh6avh8qgpAIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130873938"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:29:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 23:29:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 23:29:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 23:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVVFM4ZqohuXoQHoU8jWyQZ8yjPZ2JdznjaB+I/7j3xCOqULmhSy9fpmpXSA+OGYXE0e3xPnm6eZ6BMxVq7AvNcyZQ/+O+pDMs8ueHBDQk3OG6jyr7DRgMYhxCHAbwJslGIsICM7w+QAl97s3IZqVyH05ECSiH5u5j5UCA4tQ6H3Ir4fM0EVfzPxqg1JJi2KRG3lgqZ0LV+i90XeBnpew5aDlOtuklhwMR1WCOzweypQ1w5dJeS2bcoYfURMRQGEq7qtAW77emFI3U6cNzFWgmVcXqaekG5ENSE3jwuEULo6Oofu32HZ1IlGXHplvWPOxJcWJTV3KapYB9NjxoLoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4DcdDiZoZ6Q0VrM96eeL9dPvrBfTt3BAL8pr6wQs/Q=;
 b=eWsfsk+ocZHPJfWGeUOdDwVRdbvpzGmbAaRkMPt/QnTtRf9FQDqRe4l9SYIFgJxjdt5ZQ34b+HqLFGP2oywyHbYCHRUTqKonmhrlBGYVDyom0TsyUC5R9qKiqUcXWSk9c0RiyrSlevPuhJpjCKI6Z95tfCy1Ag9yeygfMsX7oYCKisP2/5268bSjRtN/JIK6tw11G5XdVEcfQ2FO0NmBMyK8aaQyk52o7FSO8wAPkmqMkiVx1Aln2ErFT1LocBXZa8Mv3PHJXXhlR/Do+95kIQUzyWywQZlo0KDEY05/GhY9nIurGgXTSjwVbgY0CE2pJQyobRuGeSsXGrVR5oIZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.34; Wed, 16 Apr 2025 06:29:04 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%7]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 06:29:04 +0000
Message-ID: <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
Date: Wed, 16 Apr 2025 14:28:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Shrikanth Hegde <sshegde@linux.ibm.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>, Doug Nelson
	<doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>,
	<linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@kernel.org>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0110.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::14) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA2PR11MB4826:EE_
X-MS-Office365-Filtering-Correlation-Id: 7843aaec-e179-412f-9d23-08dd7caffbb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3dMNktwbTRlUkpQQWk3TE9hTlNPbkZpaVJsdkF6V2hhbGxvVzJoYXFsYWZI?=
 =?utf-8?B?U2ZYdWMrVi9rS3JieVQyRnRkNlBqS29telQreG81WmplYVhHMUhKWGxGZjRD?=
 =?utf-8?B?eWRvRHBCSzJLL3phVloxV2NaZ3BwS1BONDZjdUhHNkVoRmozdENrT2lOUHNK?=
 =?utf-8?B?OWxtZEU3OUF4VFN5K0JNbFg2NUg1RmJKNjgzVjlxRHB5WmFzSXBkUEMwM1Jm?=
 =?utf-8?B?OXFEVXQ2S0VqUVY3V2xhWUhpTVFTMnlybHhvc0MwVFF5eTFpK0FUcHoyVlla?=
 =?utf-8?B?bUd2Y1RXSUhrWHVDUmFOWjZydUk2RWtRb05NZlVSK2lVb1YzVFBYQnhQcWZD?=
 =?utf-8?B?U3o2bWMyOFJqUG00b1E2ZWtLVGpNcWh1TUNxU1lSc050M0xuRXVVd05LYXVj?=
 =?utf-8?B?QVlrUHk1bkR1SnlkTzkwYzVsbUVUaGwzQXAzd0huL09jVlpaNnIycW9qNkc4?=
 =?utf-8?B?dUNScVNjNVpJS3dreUtKRFh6ZnNHNEZzb1ZHM2dOYVJuU0YrQ2YrcDZOUUY4?=
 =?utf-8?B?VDg5eW9RaFdMc3B4YmJpU3BFcWZGV3k0WE16TmtKN2VFYjNFT0QxTzJyei9L?=
 =?utf-8?B?Q3BUQ1phUlZNVFMyMjhUM1E5d0cwaWYvdXhGQlpIME9SbXlFTCtHODl0UkJE?=
 =?utf-8?B?UklPVVhzWkF2Sm9xQ3pHMDRHVE9VMUI4WEExRnlFYllmalpveXAyNGswOGU1?=
 =?utf-8?B?RE0xcHFwdG1tSEZHT215dnFWVEVWaHYyNitWWnJTb05QNnJTQlNIaGVNV3RU?=
 =?utf-8?B?OVpDRzE4K0ZIOC9yazRwM0FxRUN2Y2hwZDBTL3dlVFhPOTJtblZiZWdYRDNP?=
 =?utf-8?B?cUx6OG5KNHRyeXpYVm5pbXdrd25BS1NaM0V0NW1SVk5VbW1LWmxKdzYxZG5p?=
 =?utf-8?B?Z3ROYkV1azJ2cmRJYkd6Q2c4VjNhaklZMThtZnJFTlJqU1NyR1VMLzRkd3Mv?=
 =?utf-8?B?cmtkZ2o2YS80TXRJMkw5Y2h1bVFnaHJnRGJMOTJXZWpUT0VOSmpvRVkzeU01?=
 =?utf-8?B?cXg5dTdYVEdJclBSNk5IZnU1SWZBSmFCaVhQSEttRDI2Zy9nbTMzaUtvZFpv?=
 =?utf-8?B?ZzlDSjJWWER0bXhGTDhhNzRTRVVMSThRRTUzdWsvREtDeFVRYllnSlNraVRB?=
 =?utf-8?B?ODhiZjcwbmFkbUFYNVFHcFhKRDJ5VjJiVExBTVdaa3h4eXpBQjJsNzJIZEFy?=
 =?utf-8?B?cHRSUE12NVF4RE9BSldac3dNWmVFQ2ZlZHg5NlVaU0w4bDA0NkZBelNFUnc5?=
 =?utf-8?B?eXJROFVwdWJKblpBVUpDaGdTTnBCVFdvelVKNlpHalo5Zzd2U0VYK0FyR09P?=
 =?utf-8?B?R2pack13SXlsbjlRdnpOS1o3b1g2bU45UWRwTFlBMktYdmg5RkVqMGU2Wnpy?=
 =?utf-8?B?Y2h4UWdBd3VxRmRkaDFMOGVONTdnYXp3RDdjcFRUNkVoVDlQYVMyQldISUxM?=
 =?utf-8?B?blFrMG15d1FKckpibkk5ZVh3aVhwdHNXbnNMeHJGVFlFNWZla3FCenM5MmY2?=
 =?utf-8?B?WmpWQWd5eHlaK2JqcnFwcExQL2c1bVZibWxPWC8wUzNHdXU2dE5sTElMY3Ax?=
 =?utf-8?B?TDhjaUxnUElKNVZaTk5MUkJOWFRpbm5hZXdMbmF5NTZJdXRTQ1liMDJGb3Nj?=
 =?utf-8?B?YmdUQUN1Rkc2YzlFaW54TWYrb0k5L3FlTUp6ak0wY3JrdDh4cDVZcTQzeCtM?=
 =?utf-8?B?VDlUQXdPWWN0bkJPV3JqN2FaYW5rZ2kvVnl2bERRK2Y1Z1FqMHVoYzNaYVN6?=
 =?utf-8?B?Q2crbm04K3R4d0Mra0lPSXk4YjFydjdTZTJKMkVway9OQ2Ricks4M3V3UHFP?=
 =?utf-8?B?bkE4N2swMEtiU0plbzBLSW1IKytPT3N5SGdLK1I1c0pDeGRTWElHanpKSUxP?=
 =?utf-8?B?bHNEWmZ2QWhVdm1lNUwyZlE5L1ZGaVBzRHJUdGZpOU5SM3NOYWhQajlrS0xC?=
 =?utf-8?Q?xsjcVLEicdM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGNSZ2R3ZHlBdXhJeHVObjVCcmM3UjNURmN0UDlTSzU4NHpadlNFYXZ5eWYx?=
 =?utf-8?B?ZlZXb3Y3SUhabzBwNXhnWm5qTXpwdjI5aldNZi9yTGJZdEovSnoydSt5VFli?=
 =?utf-8?B?dSttMDJRbWVZblNQa0FIUzdyc0dJTGNSOFhqTUZxeEJ6TnpWdHE4dVp0QlhL?=
 =?utf-8?B?enMzNkMxYWgzR1BwZytGWXpSeFpwV3EvZUZUY2Fxa1hCLy93SDBUSXFZU2lm?=
 =?utf-8?B?cTVKWnZVYTg3SGRWaFkyekVDNTJiRm9UMy9MMlpESUN3YUV5bWsxQ1dXdE1l?=
 =?utf-8?B?ckc0ejNNSm55cFlpWGJxcTZway9UaTRlcThGREppeFJBMWEwYkE4ck9raGZL?=
 =?utf-8?B?TlNEQ2ErUVVDSXBSOVgzcGFGaUIxMUd5aVZsQ005Y3ZwdCtTOVBqUDFwUHhI?=
 =?utf-8?B?bTlYcUxteS9wZU1MYXluaXFwTm1JYTIyWHpCWWUzRXZLM3ZuYU0xVDMwbnBo?=
 =?utf-8?B?R25tMjFzTjdIZnZKUnlXRndtQUIxRGNVVE0zNzY1anp6SlEzNUsxbFdITEpv?=
 =?utf-8?B?dDZVb3FWcGJKaDNZcC9iVzBQT1JIT3lZYTFPcXd0aDBiaUJYeVhHQk15MUVO?=
 =?utf-8?B?ZkF3YWF5UFAxb0NhSUZxMmhMMHJrdjl6UDg0Q1A0Y3ZKVWpWVjJuNFdvUFYz?=
 =?utf-8?B?Q1d4WG1YbjU4TmFrSnVuNlJsQ0ZvU2RpUkdXbWVRVkc4V3BmSHdKaUpqQjZU?=
 =?utf-8?B?aUFYSFhESkpxUDZOYUd3K24wbEhQQk55dm95dmYxbjlhQU9lV2RWRmxuVlVC?=
 =?utf-8?B?L2V3RHdhMFUrODNqZ1hvU0pCN2dGZlJvc3dmWGVCUUJaUmNzVTdhSHIrMHgz?=
 =?utf-8?B?UUNQYTVRbXdWVFFJQzcvc3Mxb3c4VjQ1TGVhTjlaRHBWdkE1emtMd1dqdUE0?=
 =?utf-8?B?akdaNE5YWVFvRjh2b2VvZ0pGSG9FVFIzd2xsVk52NnVTdmpjdnlJUGhVMWJS?=
 =?utf-8?B?N045K0ZQQXBNVzhKN3pCVG1pQ3BCSW9Fa3NJZVhPYVBKMVBIRENXU0NXbUV6?=
 =?utf-8?B?SHVuanJ0QzMzUm1Bc2MrQ2hlNnBvbmVYWFN5RHFlaVpnVDB5RGJ4WjB5WXNR?=
 =?utf-8?B?TEdjd014VHhJUzlUeWtRRTB5TGxiNlpTMDBmU1h1UkhTTFFVRWJ1QjNIZWFt?=
 =?utf-8?B?TzlTSzBNTFNJN3FseEZIZ2U2M1pwTnFJTEU0MmtrS0hrdzBIaFlaZEtNQ1Ft?=
 =?utf-8?B?ZGxOS0JLaG1HSk9tWkQ0a3k5L0V1Sk95RGg2TUg2aUx6RitFSklRdytXek9m?=
 =?utf-8?B?Ump3dXI3TnRLZ29VZ29hWWp6ZHM4eEtKblFIeFRUTGNBYlEzQ2FYZWdxMHd6?=
 =?utf-8?B?bnpJSHM2c1ByemFvanJpYk1tVlkzY1F5ZDlENC9TTXFtVTc0U09DQXVncytN?=
 =?utf-8?B?Skpld1IzdSs2b2FSOEVlUVkvUUttckdpdUJ1SHBnS3FLUExtdGxaaGcxOHpX?=
 =?utf-8?B?TmFjSGlHWXlEMEw1T25tNytyRUdsN3FERjFsR2pvSkdFdWhoRGxIVjVVeENt?=
 =?utf-8?B?OTFYT053bXBnaElib2s0a3BxaGNwUFJpSzBhZ2pNVkJOMGdMbFd5L1F0Y3BE?=
 =?utf-8?B?N2t3d29QZ1BRbXYxTWZLb0xOQXZPbkxRSG11Q0xtTXcvbjV1cXdzaEpqcmpH?=
 =?utf-8?B?QVhScVFXS0hvbWtleHhQUUprK0FSd3dOK0tGcnNCL0dwczgyVElBaFZCOU9P?=
 =?utf-8?B?VFdvandiaXl5dHVnQ1dDb3UrVVBlQUJpUWs3WkEvTDlCNVd2ZFNiajc1UXli?=
 =?utf-8?B?bjV3QkFPdTBJakl2ZmtUKzZpRVJGL1grMER1dGR5YnlxaVh4VTJhMk05dk12?=
 =?utf-8?B?ZVk1OFdHSTI1aGtoQXZNcTdqVzd2YVRHY0Mva1dySUZHOW40R2tteEJMeU4z?=
 =?utf-8?B?ZVdRQy9WK3VHdUg4cVhTa1RjOU5PWklCV21ZRndrQ212TVRyNUpxSUI5OXdY?=
 =?utf-8?B?Vjdsb3pDWVN4SkY0UkJYNHBLSVFSY2dmM2VNUkZNRU5oWEZhTHIwakNqbGQy?=
 =?utf-8?B?MCt4a0Q3ekpaQnlPUVRDRlB3eDkzV1lYZlhObGdUSG44MXo4Z1JPaTVQTUVJ?=
 =?utf-8?B?M0tmTHBHcXoxRUg0K05kaVhHaG9xZUFUTkNlcjArTWhsV0NWdlQ5UlBHeGVV?=
 =?utf-8?Q?MT1Uywj5DPTrn9/WFlO8tnIjx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7843aaec-e179-412f-9d23-08dd7caffbb7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 06:29:04.4011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ii4XJ9sHnTnir1in/rwxOMj20OXSwJlLXYruzPxEcKAB0yuS/l8oDR4GDdkuf0HkEKuzSZy9RaQzhxgDO0YCyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
X-OriginatorOrg: intel.com

Hi Shrikanth,

On 4/16/2025 1:30 PM, Shrikanth Hegde wrote:
> 
> 
> On 4/16/25 09:28, Tim Chen wrote:
>> At load balance time, balance of last level cache domains and
>> above needs to be serialized. The scheduler checks the atomic var
>> sched_balance_running first and then see if time is due for a load
>> balance. This is an expensive operation as multiple CPUs can attempt
>> sched_balance_running acquisition at the same time.
>>
>> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
>> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
>> sched_balance_running.  Most of the time, a balance attempt is aborted
>> immediately after acquiring sched_balance_running as load balance time
>> is not due.
>>
>> Instead, check balance due time first before acquiring
>> sched_balance_running. This skips many useless acquisitions
>> of sched_balance_running and knocks the 7.6% CPU overhead on
>> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
>> improved by 11%.
>>
> 
> Hi Tim.
> 
> Time check makes sense specially on large systems mainly due to NEWIDLE 
> balance.
> 

Could you elaborate a little on this statement? There is no timeout 
mechanism like periodic load balancer for the NEWLY_IDLE, right?


> One more point to add, A lot of time, the CPU which acquired 
> sched_balance_running,
> need not end up doing the load balance, since it not the CPU meant to do 
> the load balance.
> 
> This thread.
> https://lore.kernel.org/all/1e43e783-55e7-417f- 
> a1a7-503229eb163a@linux.ibm.com/
> 
> 
> Best thing probably is to acquire it if this CPU has passed the time 
> check and as well it is
> actually going to do load balance.
> 
> 

This is a good point, and we might only want to deal with periodic load
balancer rather than NEWLY_IDLE balance. Because the latter is too 
frequent and contention on the sched_balance_running might introduce
high cache contention.

thanks,
Chenyu

>> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
>> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
>> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
>> ---
>>   kernel/sched/fair.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index e43993a4e580..5e5f7a770b2f 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct rq 
>> *rq, enum cpu_idle_type idle)
>>           interval = get_sd_balance_interval(sd, busy);
>> -        need_serialize = sd->flags & SD_SERIALIZE;
>> -        if (need_serialize) {
>> -            if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
>> -                goto out;
>> -        }
>> -
>>           if (time_after_eq(jiffies, sd->last_balance + interval)) {
>> +            need_serialize = sd->flags & SD_SERIALIZE;
>> +            if (need_serialize) {
>> +                if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 
>> 1))
>> +                    goto out;
>> +            }
>> +
>>               if (sched_balance_rq(cpu, rq, sd, idle, 
>> &continue_balancing)) {
>>                   /*
>>                    * The LBF_DST_PINNED logic could have changed
>> @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq 
>> *rq, enum cpu_idle_type idle)
>>               }
>>               sd->last_balance = jiffies;
>>               interval = get_sd_balance_interval(sd, busy);
>> +            if (need_serialize)
>> +                atomic_set_release(&sched_balance_running, 0);
>>           }
>> -        if (need_serialize)
>> -            atomic_set_release(&sched_balance_running, 0);
>>   out:
>>           if (time_after(next_balance, sd->last_balance + interval)) {
>>               next_balance = sd->last_balance + interval;
> 

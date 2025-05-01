Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E85F14AD2D
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746137248; cv=fail; b=pak8y7K9nhXda0sgvUYgiks/dJOxEuMlLhcQpPDe2C48jkO2pyVAelpdCAXgHHvAp7ZrXdVdu/Ncv2ZFFKJ6ZfZbpPfd6XYeW3z2iJ0Wgk75XVsjrrL0sjblE2ckW13LYtdQa8oUS8JMqmP/r7L+dJsrdv4sQrDiidSezQdw4wA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746137248; c=relaxed/simple;
	bh=8jvJ01/Rpb/FL2X654qB5CmlcS/IiBAmdCnpVGUy72w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Au11t/S7V1sQOJkB5Lv1+BfL1l98MS+/NJGJ835HTEuT2iE8oe+0hpD+NVe6mpCW+FBPeONFjNoW0jmr8/1fWQEgZ+Z0oVN2w7oBwRsNbSOZSC8TtbiEnICH4NAewC8HLbuzClRLvxp5wohE9MuJFTSJwse+Qm+zphBYxhBSZq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dho0WhL3; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dho0WhL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746137247; x=1777673247;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8jvJ01/Rpb/FL2X654qB5CmlcS/IiBAmdCnpVGUy72w=;
  b=dho0WhL3KNeG+2Wq4B3VhUSnjSVA4MFsKeEMM2C8Vy4YCw9SsdxUA9sA
   56VT99RkBOBfjp4lJ/Z2MDa3CQHLdPcY9PftqwcEcorV52Y7LMnIv2HGT
   8NR15F5P5Xl+OTs/QoXDNkL5q/rtNW9DTe7sCeYn3dOHQ+2LSr7Q+rBQV
   LbBGAgtaoBKqXfEmBkgQ0MZm8RfX/tosU+CeqexiFw/jTzYHwT32npqVg
   K9mEAYc9rBScZGnvtvwJB1uNPoKhFr5OBwrggvrx8G1G+xC19mUTs0aER
   VaNby34xsAhrXqc0CEdxavqrutk8whLPzQaoWpVpnY5tWV+6WzPKlLPM6
   w==;
X-CSE-ConnectionGUID: Enndr4ArShyFm8DSa4UCYQ==
X-CSE-MsgGUID: urzVSY5kRdOSm8UCRlWDUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58484998"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58484998"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:07:26 -0700
X-CSE-ConnectionGUID: pkylR0R/RZ6Tnv4H56lRDA==
X-CSE-MsgGUID: EAto4r18S9K5VK8UQVIoLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165420881"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:07:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 15:07:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 15:07:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 15:07:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3/GwPQEezTaYGRsnT7OeNGk4muu/GrwVh+E24FYw/e/53OHe4OwX7DCPQ1YQgC8QTLvaOo8z5hA+MxisSmY/5LajZ+kwZll+oZKIp/Be7m0CPJBzja6jVF2ISW+YTCfd9pp1IRFkRMKUQWxFIDIMy7WrkK74R86nx06CHOUEdlD+7zE4rpxHp9vNlZLPI/x6FLYETRnh/Yr0Qx2YdloomHLW4cv2kQaCZdwyBE0zwYHalwnx0KoBgVVFH7HZrEgXYnaBc4RVtsDeaGEEhNzoKyg4wpz7bH0KML5kpzl5wb0NSOnFstPQTNxSZia1/mI3o+/POX6pyzZG7dv1CYc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v68s/NoNcPc5rrK605RP3rk1bwIaJFNq2tT3Hr6r8pA=;
 b=Zzn2ZGWthKi2D9y4/Ez95U4eruZyvycmsrzv3KFc8WxcxIFm4gQGVreMjFrrCdQTbZ6gIAD5EgPcs/QTLg8yf5bJ7xFYwpvZFnsXcTt/1sJeCYwy67RyFLT7QyHLOj0ht5ihHaDDqGIOkhTxslrME7GkPfHPT87QT2ZrcSkIUjxEkZZOaKPfRlptjOnwnW1AphLNTwC2RCxu5et2MmPlhs4hjsD7eSAMvFAKV/1chIKGLJPKgerMgUR0+wV/aevKIa3LLYGyZZGbfNlsYkV8bwMmA+E2hWJnaHxFrGZF3V0WiGcKAqjhDF2ppczXOvrP08c6sBxsYLSnbaQaRv7fOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV3PR11MB8481.namprd11.prod.outlook.com (2603:10b6:408:1b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 1 May
 2025 22:06:20 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 22:06:20 +0000
Message-ID: <2e033056-c2a0-4a91-8b4b-c5e53bdfb171@intel.com>
Date: Thu, 1 May 2025 15:06:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] cpumask: add missing API and simplify
 cpumask_any_housekeeping()
To: Yury Norov <yury.norov@gmail.com>, James Morse <james.morse@arm.com>
CC: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rasmus
 Villemoes" <linux@rasmusvillemoes.dk>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20250427185242.221974-1-yury.norov@gmail.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250427185242.221974-1-yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0367.namprd04.prod.outlook.com
 (2603:10b6:303:81::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV3PR11MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: aa15a72e-77e3-4268-f00b-08dd88fc6743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U011cDVsRkl3Z211THE4SHhoRUZ2VEJJdEZ0K1RTYnowcXMrbGNRTkZpeEJa?=
 =?utf-8?B?Q1diTkdBRXU2WHVMdWp0dmZqY3lMZzFKNTdWczFPY2ppM1JzYkVHMmZlbHg4?=
 =?utf-8?B?dkczRkRXSFVibVNhYTNvQkNONTVJM1k4WnFFWUkxT2tQREJHa1JXRkNFREtL?=
 =?utf-8?B?UXBxZFR5ZGlKbHp5M1pMeUpibDd6VjAvLzhnODdxS0hPUHJQUWF1eUxZazdH?=
 =?utf-8?B?cGMyTG0xM2J0Nkd1N2F6RE9YU1V2dzNkeCtnbXhPSEEyd0lXTHRMQWlaWEZJ?=
 =?utf-8?B?alFkOEljM0xWVlVjVFMwK1BESkkzbUIrZmlxemRwdkQ3TlB5cnZ4L3lzNUZW?=
 =?utf-8?B?MnQ3M0dBc3B1eGVTVzE5b3AxaWlLRVdHNkJVcTFJU2ExL0YwS1Bvekg0YnZY?=
 =?utf-8?B?Q1RmeVlkZmpoTDNmWW5rc0dNcEphUWNHajlSVU4xa0FqRDY4RXIyOStVbVlT?=
 =?utf-8?B?WWwvWjM0Z1hVdnVRc0xOcElvSE1pRTJKTkJjN0hhS1hmaUd1T2EyOHE5blk2?=
 =?utf-8?B?R1YvbkxXMnZLOVEzY1VoWllIaldQNllmUTNoWGVWNFZJWFJBTHJoMEFLOEQ1?=
 =?utf-8?B?SDQ5WThNSHhtMUZmTzN4ZmpTVDdmMXJpUTFUdkViOUlJK0NUWEVnZjFCT25J?=
 =?utf-8?B?dVZxd2Z4SGtiVThSNng0cDVlOXhYdlVEbWJLNXd3MkdXNXJmcWpva0lQTVFn?=
 =?utf-8?B?empRbExUVGNCd1FCSHF4VG9hdThHVDBXcTRENkV3RU5pS1RqbkFPNk9uVlRn?=
 =?utf-8?B?Ty9mVkFZQ3FETWlsRyt4dzFldkZrU1E5RGhkY3B1U0QxUlFxUjFRSFJTM29M?=
 =?utf-8?B?cFlJcStNZFd4RHBSNU5YeDM0KzdsWDdYOTJGcGh1dXM5MDdZNFQyYjVzenFn?=
 =?utf-8?B?QXkvaEhkRWVuL1JBZGNmREVlMEhHd2FtMk9UOE5PcmVmUzQycWszWnNPb0Ja?=
 =?utf-8?B?S2k5U2FEbDcrVmpVeDZlZEVUanI5bGoxTTBkVmgramNqSDBNa2M0SFh2akdu?=
 =?utf-8?B?ZFpMb3JRN0Q0cEpybjhNRzJncDRySEpRdDV6K0lJNTZac2x2emJFdE1VcTcx?=
 =?utf-8?B?eHN0MWZTSHVCcEdUWHFvVnEra2ZLS041Q2o3elpDL0pobnJzeThBZWJsZFBs?=
 =?utf-8?B?dGF6OG83ZkxZaFZnWG1jeE5zMldwaTdvRyt5MGZ6a0NOeXdIdWZwaGI5WFE1?=
 =?utf-8?B?ZkpWM3o3SXoxRFc4TTJQcGlDVW1pM05wR0JJNk5DV3pRNkN4RXlaMFdzY2xs?=
 =?utf-8?B?d0JwUVEydlA0aFRJdElCalFWMTAvbkRnekk5TEJFRWtmT3ppdE1IQ3NMZDF2?=
 =?utf-8?B?dFNaZU81aEJ2N0t3WjBEVWJwYUgvSm9TbXU5eGNna0R0M2w0NmtSVU4yM0pP?=
 =?utf-8?B?V0pidHdtdy9Pam5ZdlRNdVJBQWdsMWpzQkdqdGUwdURNelZiWmp0QUFjbFJH?=
 =?utf-8?B?Qks1T3NPOC9XQjBGMTBQMWlia2NoSTVLWElodTM1Vll1cXUyOW01WTNiZHVr?=
 =?utf-8?B?Z3BIVGJoRE1zckZGOERxb2VvcTl2SFRueW5NQVFVenBLUGVIekQ1MjR3L3RO?=
 =?utf-8?B?ZGx5ZCsvYmxGODFjVEhCcDRmc0oxMlRSUkhQd3VGTVlzV1pGNU5DangwQ0dF?=
 =?utf-8?B?dVh6R2R2VHBrRFMwL2hjYkI1bktydmZpWWNFYVJWaGdJcmh4eDJ6MVNLdWta?=
 =?utf-8?B?SklucFMrNWxaQlZ5NURNZmZqTmFhbU1Ba1h6NVFHZHFDaFQ2YkVVL3BvbkE4?=
 =?utf-8?B?VUJlcFpBU2tpZTRGdEJPVTVYTzJsQU0wTU1TSFV3c2JxVE9vSk9SbnBOTVB2?=
 =?utf-8?B?aERxKzdFSENTYTdndGswTmlXeE1IZ210RDczZ1d5QmxkU2UwSmFyZ2ZrRVph?=
 =?utf-8?B?S3BxUmg0ZGl6Zk9IZTlKUE1WYmhiMGN0aG4rakRpV3dnaG9yK3FadFpUMmVO?=
 =?utf-8?Q?gKYitHB5lWo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmd6YXF5Mmp5RDdxTE9iSU9VUHR2UmxFK3ZwSnZPSE14eWQ4MzBNVHJzZ1JF?=
 =?utf-8?B?UkdCOVJ5MnBUcTh1UHFYZ0xYa3FhZHlKR0tYNHNNUXJHZTlPbDc4eEIyN1VI?=
 =?utf-8?B?c0FQVmhrSG12UzVrYWVOYjM3eE84NkpwNGU4aFpQazZDY0hDdGdYOEM2eE8r?=
 =?utf-8?B?WXZCYzVCU2JxWFF3RTJtekZxSU13UURnYUZrZlMzQXhOVUE4M3J5ZHZJMkpK?=
 =?utf-8?B?UGRxOXdWSkI5T0NSYmxSUFFCaHVqOC9lZ1JBZmdlRkRJbm1QTEppd1NrTEF5?=
 =?utf-8?B?dDRGVCtLeWNzQWRZSDBsOXNOQXBpRjNsOXd2R04zOUJYUE5hcUdYaFdGK0tP?=
 =?utf-8?B?Y0VIZmFyQzhCSmlwamJJNnZORUlmM1hUUnlkekpiU0lZV05XTTJmL2RtY0Rt?=
 =?utf-8?B?WWlocXJIcW02L1lKQy9adGp4NER6MnJyQlE1OEJ4aUVqb0pGR0hwNlhVbGZF?=
 =?utf-8?B?RzZmS0gvaVVCcW5GY09zVWhsU0NFWW95NFc0SEUwNjZ1a0RCQW9UUzFKcmc0?=
 =?utf-8?B?VVVvVkpwSlMya0FDSVNSUG53V3JpQlRDUXR5UFB0bllDNjgwaEhOZnJkdkhJ?=
 =?utf-8?B?aWdRYXhGcTRnNlNIN2w5bFpobG9nOXZRQlFNWUlwMm56MTdaWE03bitROEdK?=
 =?utf-8?B?UCtwbnFIbkxhOTFBdDhnS1RzaFpvZTJEenFTb1FodlptbU5iYVh2a1VBWDc3?=
 =?utf-8?B?N1RNaGdjRmx5WEFtbVhWWkQ4bnB0SldRdXFIcUprUkhMaVdFanVWTXNrcTFl?=
 =?utf-8?B?NVRSOFJYTy9TUCtNN3ZIUTlrTGlDZjFoRzZ3V241SE9IcTBjY05jK01Gbkxt?=
 =?utf-8?B?TlBmeStQZ2hMWVlyaUk4WHBSa1N1SVRFbjdybkZHZS9YeG1DU2pncC9zZmZP?=
 =?utf-8?B?Znl4ZHNpaGNHREx1NHdiV0xxVDJKUVREcEk5bzBZVm9SRkFOa2kxRkpPVWpJ?=
 =?utf-8?B?SXZDRnNVSFpnMC9qTUo1S2ZzVmsrQW9sd3UrTkdMZlJjUjdCL1R3bm9QUk1V?=
 =?utf-8?B?WUx3bEMrNVR5N2xtWCtIVk9qOFBXcmVkRFV3MFdOZHpQSjZBSXFTTWRQa0I5?=
 =?utf-8?B?Nk9oMnFmOVdVY1RCdWVQUHg2VzExaTZtc2UzL0VzUk82NzdoaWEwVlQydW9F?=
 =?utf-8?B?Mzlqd0NOdmpIcExzd0xTdklrK0Z6TEZuZnVJdUFIa0MvUEVXWnZBdFB3c3A4?=
 =?utf-8?B?emFaWHU4RzFZWjIydlVEV01acHgrSWtTd1BqcFIvMUs4bjdYaUJhbmFKck56?=
 =?utf-8?B?eGF3NHNuQ1BoOWRBMlBteDVGd28xWjJDYllJbUx1ZThleHQ5djdaSGZHSzdr?=
 =?utf-8?B?S0V4S2U1WFRSaUJ3ZTlVdGlaZ21iS0hWKzV2S3hQSWw4QUkwbldGVWNkTGtj?=
 =?utf-8?B?TjJHMmFNWFZwb2h3cGlWbEg4Q3dhSmo4NVdoeGQ2QkRHNFluamZJNEgwa1ZO?=
 =?utf-8?B?ZFhpR3V0aGdnRXZKUVEzeVA4eWpwRXIycEcyeWl1Z3RFL0YrMFRhdW11cUtM?=
 =?utf-8?B?QlM4ZnBnR3hMSkF0c3Foa1ppcmFjdnBsUEhFWlplYzZlb3ZmeG9tQ0wzTTdK?=
 =?utf-8?B?TFcrMm5yUWxxdjBpWC9ueDR3RUtBTkYvRmVVZU9vRGhkaEpXNDZYSThsTjVX?=
 =?utf-8?B?ekJFZUs5LzAzc3dxTG9vRUlrZnBRTVM2aTJaQm5zVHQxMmU5L0YwWFhaTVRG?=
 =?utf-8?B?L24vYWVkdDJ0cGRmaUx6dVdBN0UwbG5VYjhRYjI5bGwzeDJWVGhaZ1lUOGRW?=
 =?utf-8?B?KzdySTR4Wjd2MGZuN2h1anduVThtL05INjNldUJWM1M1dm1kazd6SjJtWUJr?=
 =?utf-8?B?ajMra0UwbXR3ZzdoMUdoVElCWGZjb20wYmpOY1NlVXpjSFMxMzlkaDJ1Uzd0?=
 =?utf-8?B?MzYwSVlsWnNwQy9iZkM5WkRlaFJQY0djTlFiQ2p3emM3VFZKZE4ySU5KWDdj?=
 =?utf-8?B?dEM4MjN5d3ZnejMzeHY5elRaRVJ1blJrZU1GdUl3RW5zV2xaVTNhSGdydENo?=
 =?utf-8?B?cVVaaDY1Yy96TnJmRTlEVTMrRFpmaklkWXUrbXJlSDNMUERWZnQyRDR2MFhi?=
 =?utf-8?B?NytScmYzTjdiaW5PWDVCZ1ExQzNSMGR2bUVEaFpqdkpzSTY3dWFEeW9Fd1hz?=
 =?utf-8?B?TTRiQUdYc09BbkUrYWV5ajN3aU5veTlQcFhFeXJGZitueXB6a0JrbFZQWWRy?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa15a72e-77e3-4268-f00b-08dd88fc6743
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 22:06:20.4257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VS0J7X9njE1MgTZFw49vYJoeKAM4k+Q4J8CYv+c4wM50fjJELkd1Wxsj82IQMskLK3bn0FAGLinOn/D0plUik6eHnCJ14lY2FrotatA6kTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8481
X-OriginatorOrg: intel.com

Hi Yury,

On 4/27/25 11:52 AM, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> cpumask library missed some flavors of cpumask_any_but(), which makes
> users to workaround it by using less efficient cpumask_nth() functions
> 
> This series adds missing cpumask_any_andnot_but() and makes
> cpumask_any_but() understanding the RESCTRL_PICK_ANY_CPU hint.
> This simplifies cpumask_any_housekeeping() significantly.
> 
> v1: https://lore.kernel.org/all/20250407153856.133093-1-yury.norov@gmail.com/
> v2:
>  - switch cpumask_any_but() functions to signed type for CPU (Reinette);
>  - change name for the new function to cpumask_any_andnot_but() (James);
>  - drop O(n*log(n)) comment. cpumask_nth() is slower, but still linear.
> 
> Yury Norov [NVIDIA] (4):
>   cpumask: relax cpumask_any_but()
>   find: add find_first_andnot_bit()
>   cpumask: add cpumask_{first,next}_andnot() API
>   x86/resctrl: optimize cpumask_any_housekeeping()

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Does anything in your "bitmap-for-next" branch depend on this
series? If not, would you be ok if this series goes upstream
via tip (pending confirmation from tip maintainers) to make
for smoother upstream of resctrl patches that touch the same area?

Thank you very much for doing this work. 

Reinette



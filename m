Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102F1A2643
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748494307; cv=fail; b=jrQsMSTyB7DwSwndcrKO0dUe20zU1mxPjGyc4uTPCtUDhZii6CnCIpRuobVwaS4BNVQdCwX/omOQEY07SSBrm7UtqnTu5kUjCPDqjZzgI8W8G/vRUi45UJgEuynr1iqu6uRXs37lFYD4OXTT17gZq2lfVOXxNsMVwjzfhf+ieU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748494307; c=relaxed/simple;
	bh=Nf0MRoOsGElgLaUz1WEAnZ4yPQJ9pEfU8cxkUuyZQgU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=r62Ud5xCVk/zzgY9zPZ7Nih5mtjKCJFApUFWvaHPMwiJkrsE3exhc8J00zdBdrZqYZmdfnSU6Pw666X9O6YZyK6lKBaY60dc1ixrPpCXqKz9eoPm73RCWvNZ+WBIe32HVtglEgIDpoMGfNUKxCRvVtJvJl4bxS1uKL6G9dvQoPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtPcvzI7; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtPcvzI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748494303; x=1780030303;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=Nf0MRoOsGElgLaUz1WEAnZ4yPQJ9pEfU8cxkUuyZQgU=;
  b=QtPcvzI7PU7ycINCOqLIKNFvW/c5Y82iHRLD6G4O/pQOgW3rH1sWIqe5
   B0kYxFn1GTq490A0dmroyuGTNyA5KDDiS87jZ6pF8JyeJ2SXFReKvNny3
   HECbxE8iNTTUVgpEtJ16HTJh9LiDYXLjEMCnAkVS4bGvuzctJQSBXZG69
   z0rlM51wzi77ekUiPSPHrZ8bd8e3Kfjyyr5gsWfmaFw9O1pVONCiJIMkv
   izGjksMZMV+GbA4KRs2M/NTD3qjtOS4O2+mzYvMaeGd1wWyZ95EVmEJ98
   2iwxhTZGIfc96cxIDR5rf1LlSlBAz3tqFSTkH2nOMNoRsz7GYlqTgF1CS
   A==;
X-CSE-ConnectionGUID: Z2gLZPwCQX2xqiyvW9BZCQ==
X-CSE-MsgGUID: qbAi4oBURW+/pSeNsesaqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="38165778"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="38165778"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 21:51:42 -0700
X-CSE-ConnectionGUID: XFyDRwdnRGSzHBXYUZmzxw==
X-CSE-MsgGUID: wiJvTxVvSxOx6i72JwsBnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="148588398"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 21:51:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 21:51:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 21:51:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 21:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoAtLRm47pWzzcfaBBES5O2Ey0gRh55bHWTud/YKybkHtzyr1aMUkgSHrbnN6Ljti0wKXaCnnzBCx0GLhOLVVqLW2Lo3qut8buNQVnC5lAecnI9KcgT7Jd4yPTBNONo5fI6dACqwwZUclLWvx0odiDk3EbmdMCjCmJkByHZxroL6fR0rGq+DlT3mQvSAcq4Gzf4EIYO7fb+NDKATAsWHWnBF8821KFIx0IEnZ995f4fvvLGKv3H5mhSiPNUSExjEJ5m38o+csW2ue9tF2VDDmJCYxOfpsIl8BPm7S1QRgYsDexh+uMwm8LPAvxHebYlmQUXLMXQU8mshadWUZHoGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4La3vUCnt+UZfFTAnu60UtmXAIN7/D9lPqOF++5r8FM=;
 b=YhkHWOkNxwuZXIhwNPMzCC4jj6c9miGSJzjIQGcdlheb8GIZmJfAC4fvtIAKHjHAF3BOg91k7ct+ONWWuTqlsW0RzS1bVEaJmstyiNA8Vgon3yx4Alfyplkw4brZeQbmIrj2RYaV4zIUgYVOBsM+fFxQESRSUOHi05xjfdO6t/m1LCb7F2NzRe1ZptwTAYg2H4qGehhDbRdbPBFpcw+X2R4ESvAau+hUSvFBgfk/QBGVW8iD7m9PoP0iHQ4i4y4QGKT1gXKXkQUmm6PBLUSTAqvK5csJs4lCMNKRXOeLjRU0X9B2ZmQCEzoS22rF7HOjBwqPJWW6e/PuxuJes71NxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB8229.namprd11.prod.outlook.com (2603:10b6:8:15e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 04:50:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Thu, 29 May 2025
 04:50:52 +0000
Date: Thu, 29 May 2025 12:50:44 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, <oliver.sang@intel.com>
Subject: [linus:master] [futex]  7c4f75a21f:  will-it-scale.per_thread_ops
 98.3% regression
Message-ID: <202505291011.9fe37568-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef8bf65-48cc-4bce-e82b-08dd9e6c63ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3zgZMqkYeQGlZZ0GDmz3xS+xNPf/tBwPmOr2TbtRGg5JXX2YEfUxl+nQHf?=
 =?iso-8859-1?Q?ZN6iOYZ8hItZc38ft4Z+PW7b1rVmo4pqNk9+ePBIgk3NpDOGMi3A8Fl4JF?=
 =?iso-8859-1?Q?HaQ4OLAacAbZpY5BL3+nSYzcWA93G2NV0zHlv5kv9FCGrteuomA9pCa0gx?=
 =?iso-8859-1?Q?5hEDrP8pHcv+Xmitq7UUzbiiwRc135AI5L/h+PQiMAqiopgXLhK1tNnNDK?=
 =?iso-8859-1?Q?xP8Nm+OlfrqlO7hJPTxHIo58w2lE12amEkrPpFrMhTzocGIi+2lKElS1Xz?=
 =?iso-8859-1?Q?CGbK5xYY6L7AW/8CUnjpJdseEw2sgxuCMN/Pshkp0xAZtZrCoGr0CQJZfy?=
 =?iso-8859-1?Q?FTFq1HKSJrznfW/QQtsrfaVrix9hv/BW+ycFf7Uohi77+kvUqekS74Lxhs?=
 =?iso-8859-1?Q?oQMRjME/YmAEmbspwqZD9mGU/Vw6vSyzISwywxWmjXL2xTQNm3Aq4Sv/88?=
 =?iso-8859-1?Q?WrTEhqVvSEOu0YRkupfC0NRQ38IhvOR+oHlIlPyTV0RsOWtevBGe0Scjvj?=
 =?iso-8859-1?Q?Ml7h1qicRV1/OT3KufuFWr7grayV2RosQ+xw2Z6d1+3NJMjFo/b9+rhMFA?=
 =?iso-8859-1?Q?Z9kxFUfqeYRtfWHPzLWB34dbPv400fHtPGJryX3IbAgr/0I3qQY/M6Evfk?=
 =?iso-8859-1?Q?aS9XAjQRifs9STf+FM/FM3xyRgRQR/bMPj28A/Ql1REx8yWVE2x/hIRu75?=
 =?iso-8859-1?Q?e1BurszlZAjxxZRBXt/0jYBVqapaQnHCKeBnQX4yxiuZkNHplPcEG+GklD?=
 =?iso-8859-1?Q?EI8XxOpi8MXCxONmSR41PcSxWvXo/IqmKE3r4m8JokIHuqj1s+ujC1LksS?=
 =?iso-8859-1?Q?oCMrqpKZyuGVnOv6ce+GoxfJLdYFHCCeSE5L7q21hU8PvXGHjneO02F2O6?=
 =?iso-8859-1?Q?sp0DN1xR6euhibKyQUxsGINxaiDudxCE17negxShN3hfnruPYioknQtGP7?=
 =?iso-8859-1?Q?EwqIX+tKxJmr8/ScJwjr6n8m6IzvA8xjfu7rvHukQsc1KbeqysIULBdKzS?=
 =?iso-8859-1?Q?jXX/eISZTISlCTQUAgasuy6hPC0n0jtmh+zb6IoVED8DHarTSitH+7yG3+?=
 =?iso-8859-1?Q?w+IlM0ne3YAR8pIPzh2b+tZcmQ5WLk1k/oUEhBAJO1sO6eygMjnQQLvFz8?=
 =?iso-8859-1?Q?Q4QnmK4CTIdDo5fz776i4sVVnYgGQzzGCDZNFFNj4sQ0UH9wkvI4Bh/Hdk?=
 =?iso-8859-1?Q?2WC3/6JcTMjRYWIn5ctNKbAyr5lcAbghVI2au+0WFaxS9xjE8IT8u+4Cwp?=
 =?iso-8859-1?Q?lWiEnJL84vSHNC96KPAEHkKEZQgn1RBeZSM5SbCfYFZOBm3qgkhwYGL6+S?=
 =?iso-8859-1?Q?qFNr2yxYf+pWu3VaZls7qhKG7B469SPHFyQDzsQ6oF1fuJH37GDteaAxVU?=
 =?iso-8859-1?Q?EvajJlV0jsxsXXvaXPp/miyj8TnxPQifqhaDGLi3sPcvvtaKk5lYQyuUgD?=
 =?iso-8859-1?Q?QdpMN6ZWLV1XELLv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?T5+YKiv+v28VOmdVv0+t2/GJFiNfT4qBaH6OIx2nux/qk2uJW7v62zJo9M?=
 =?iso-8859-1?Q?K422SUloeH2i7qCHNYBHYIAqh6OfuhRKk1Fs13rmqVr1j+FdZ52BoXQGKK?=
 =?iso-8859-1?Q?1etP/WQbVf4Mwk7Ate6edGqh8Icti4cqPz74Brb934ZBoFjBMP9Zwa5xyV?=
 =?iso-8859-1?Q?mO2qDwNgT99keIqHrxI2EsNh8iKF9sIqrB+qSl41mXJI2W+JEcGgkZ7eEd?=
 =?iso-8859-1?Q?HfMGDsJzDQ3sLRHpj0ShJJRIso930ZlLTRcyUXnZp88Cncuk3uEXpb2ya+?=
 =?iso-8859-1?Q?RZBUb5beED7I9fgVdhBepNbjdJytF1OB6r8fwcr5yjfwHhvtvaPmJlvqmA?=
 =?iso-8859-1?Q?yyG0Yi9zyfL1vMmv9QNVHD9Q5kTwbasugUi6mhlbnvCTsImH2AF0Fsamkw?=
 =?iso-8859-1?Q?Rx+gyYRUyWlHnPCfeyuj414WOiiXEYtz/InHioP/2Sv/5a+C5AA8O5qbtH?=
 =?iso-8859-1?Q?p6VcLX941LeX7S3ZXi1eXMWZkvjvkSLLqfDXfwUUY9o5utzcmr0nTSwYqX?=
 =?iso-8859-1?Q?X3nKlB5D1t4rzPlu4FHtLBRwr6hUFaHrl7nJdnsHW8tc4xx7hk7DQ5SiQK?=
 =?iso-8859-1?Q?HpNVv6v85rAAV2DWmQYk9DthuMK2eL3LYbabzR/xXi91OCucqJ8dC6aYsN?=
 =?iso-8859-1?Q?fzcNxpLix54SdlDXXE6T4jkAb7dzkzsx3SPkG22dgTzTAIHM1Q9kn5Cept?=
 =?iso-8859-1?Q?eoGd0qWC8X4Ppdwc/ntYba/JjmHpLW7AR680CNF0B8BthaUblIaCIuivF+?=
 =?iso-8859-1?Q?YEmJdp+LrZ/h/wPnu0tAANoxR3/IdMaSaJMIBg/3jmfP09244Yj2KEE4SF?=
 =?iso-8859-1?Q?rsbWS+RyccHyMKLthChLGmJIcUIe/C+68ujUQfjs608prdvQP113WUDPyI?=
 =?iso-8859-1?Q?UDlaYoxi4T11ZKjwfumPOMgmMYfNoIRx5lx+1RV0heDxHug/IW7o/STg9n?=
 =?iso-8859-1?Q?3lxTXUqTggD2+1pMnwXKjldnE/NhNfwQbs+/D0U1BO6vnF9UDLr+yg9jLe?=
 =?iso-8859-1?Q?24ebxLO55iprxH8GJwOYK6oGes3S7L2mrdDt0mHlLwWRHq2dSZ3ddOlnoy?=
 =?iso-8859-1?Q?nwpa+OhYPXNVQ320r3iWI9dc8JndV8qgdIz2aRXVqamI6QepL1SN+6BaOl?=
 =?iso-8859-1?Q?8VfOOh2sZBlHj5J0X+aAbipHiD9pxXEx7aqrnmq/T1h/+DO1A1HPGw6HnT?=
 =?iso-8859-1?Q?QMNKvsbi/R3aqP1/W++IR7upfdzqSwbglJ0EveH0dmpxEhT2MZ2uk7t++u?=
 =?iso-8859-1?Q?nDwrCvRt8lkCI9Q5qrE+k7f50RbJ/UgGnyOgqz7yidOYPQ/H98OKzHGIY0?=
 =?iso-8859-1?Q?c0/41ld48cst5zPaIjDmOssg2WlDTwmW1Vnv+me1DCVaAkdyPHx0P8nbsF?=
 =?iso-8859-1?Q?I8aJTGm9WNp3uOLreYwu7dbTtc3ygg91E+slrLvy53VdWYt12nQ5+jAB/s?=
 =?iso-8859-1?Q?Oq3M7wOD5tV3Ny08E+rwfccJnCWITeIP4KcdMF7wnLk3nQhCtJnrAdO7uk?=
 =?iso-8859-1?Q?osQagdupA9HtMjso2VEDR3WmJrOEWWv/YL4dYR365P09SF6KkCba1eyXrr?=
 =?iso-8859-1?Q?0Ec7ByxjNvcAj6UHQnsRi8EggaeWfPgm68BcErBITAaRxKFGn+sD5lkUh7?=
 =?iso-8859-1?Q?wcazYf1Wz8X66zvgQ2u/5NcRw8bV2MSnR0v0hxvPsaMGI/BSrHG64vuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef8bf65-48cc-4bce-e82b-08dd9e6c63ba
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 04:50:52.7004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZOefCHVLlOYpvWsFBlm3m8kiQOozUReB+uZfGnHgWwNAoIuvAV38Rg818/KyvfuM9NkQ3mdQqYravws1hJp5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8229
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 98.3% regression of will-it-scale.per_thread_ops on:


commit: 7c4f75a21f636486d2969d9b6680403ea8483539 ("futex: Allow automatic allocation of process wide futex hash")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      feacb1774bd5eac6382990d0f6d1378dc01dd78f]
[still regression on linux-next/master 64d12554715ce825d553caea123b7cb89e56237a]

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	nr_task: 100%
	mode: thread
	test: futex4
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | perf-bench-futex: perf-bench-futex.ops/s  94.6% regression                                     |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory    |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | nr_task=100%                                                                                   |
|                  | runtime=300s                                                                                   |
|                  | test=hash                                                                                      |
+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | phoronix-test-suite: phoronix-test-suite.speedb.SequentialFill.op_s  11.7% regression          |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | option_a=Sequential Fill                                                                       |
|                  | test=speedb-1.0.1                                                                              |
+------------------+------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505291011.9fe37568-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250529/202505291011.9fe37568-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-cpl-4sp2/futex4/will-it-scale

commit: 
  80367ad01d ("futex: Add basic infrastructure for local task local hash")
  7c4f75a21f ("futex: Allow automatic allocation of process wide futex hash")

80367ad01d93ac78 7c4f75a21f636486d2969d9b668 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    910593           +15.8%    1054733        meminfo.Shmem
     16.07           -98.9%       0.17 ± 11%  vmstat.cpu.us
      2757           -11.8%       2430        vmstat.system.cs
     23.55 ±  2%     -15.3%      19.94 ±  2%  sched_debug.cpu.clock.stddev
    836.03 ±  2%     -11.5%     740.19        sched_debug.cpu.nr_switches.min
      4174 ±  7%     -23.1%       3208 ±  9%  sched_debug.cpu.nr_switches.stddev
  8.23e+08           -98.3%   14313329        will-it-scale.224.threads
   3673940           -98.3%      63898        will-it-scale.per_thread_ops
  8.23e+08           -98.3%   14313329        will-it-scale.workload
      0.55 ±  3%      -0.1        0.45 ±  3%  mpstat.cpu.all.irq%
      0.00 ±  4%      -0.0        0.00 ±  3%  mpstat.cpu.all.soft%
     82.56           +16.0       98.60        mpstat.cpu.all.sys%
     16.28           -16.0        0.30        mpstat.cpu.all.usr%
      9.50 ± 41%   +9208.8%     884.33 ±  4%  perf-c2c.DRAM.local
    549.00 ± 48%  +22892.9%     126231        perf-c2c.DRAM.remote
    537.17 ± 16%  +10624.6%      57608        perf-c2c.HITM.local
    521.00 ± 51%  +14508.3%      76109        perf-c2c.HITM.remote
      1058 ± 22%  +12536.8%     133718        perf-c2c.HITM.total
    421424            +8.9%     458761        proc-vmstat.nr_active_anon
    194593            +0.7%     196003        proc-vmstat.nr_anon_pages
   1109547            +3.2%    1145260        proc-vmstat.nr_file_pages
     26083            +8.1%      28187        proc-vmstat.nr_mapped
      2411            +2.4%       2469        proc-vmstat.nr_page_table_pages
    227754           +15.8%     263666        proc-vmstat.nr_shmem
    421424            +8.9%     458761        proc-vmstat.nr_zone_active_anon
   1637120            +3.4%    1692600        proc-vmstat.numa_hit
   1289218            +4.3%    1344829        proc-vmstat.numa_local
    103162 ± 40%     -47.8%      53801 ± 45%  proc-vmstat.numa_pte_updates
   1765284            +4.4%    1842858        proc-vmstat.pgalloc_normal
      0.01 ± 80%  +83905.7%      11.27        perf-stat.i.MPKI
 1.382e+11           -95.2%  6.573e+09        perf-stat.i.branch-instructions
      0.01 ±  3%      +0.5        0.53        perf-stat.i.branch-miss-rate%
  14002328 ±  2%    +150.5%   35080788        perf-stat.i.branch-misses
   7228215 ± 89%   +4142.7%  3.067e+08 ±  2%  perf-stat.i.cache-misses
  19769349 ± 33%   +2364.5%  4.872e+08 ±  2%  perf-stat.i.cache-references
      2694           -11.9%       2373        perf-stat.i.context-switches
      1.26         +2375.2%      31.10        perf-stat.i.cpi
  7.62e+11           +11.1%  8.464e+11        perf-stat.i.cpu-cycles
    297.49            -5.9%     279.83        perf-stat.i.cpu-migrations
    457686 ± 86%     -99.4%       2758 ±  2%  perf-stat.i.cycles-between-cache-misses
 6.063e+11           -95.5%  2.726e+10        perf-stat.i.instructions
      0.80           -95.8%       0.03        perf-stat.i.ipc
      0.01 ± 31%     -71.3%       0.00 ±141%  perf-stat.i.major-faults
      0.01 ± 89%  +93952.9%      11.25        perf-stat.overall.MPKI
      0.01 ±  2%      +0.5        0.53        perf-stat.overall.branch-miss-rate%
      1.26         +2370.7%      31.05        perf-stat.overall.cpi
    298631 ± 78%     -99.1%       2761 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.80           -96.0%       0.03        perf-stat.overall.ipc
    222155          +158.4%     574069        perf-stat.overall.path-length
 1.377e+11           -95.2%  6.551e+09        perf-stat.ps.branch-instructions
  13951225 ±  2%    +150.5%   34950752        perf-stat.ps.branch-misses
   7204865 ± 89%   +4142.3%  3.057e+08 ±  2%  perf-stat.ps.cache-misses
  19741274 ± 33%   +2360.2%  4.857e+08 ±  2%  perf-stat.ps.cache-references
      2684           -11.9%       2364        perf-stat.ps.context-switches
 7.595e+11           +11.1%  8.436e+11        perf-stat.ps.cpu-cycles
    296.47            -6.0%     278.82        perf-stat.ps.cpu-migrations
 6.043e+11           -95.5%  2.717e+10        perf-stat.ps.instructions
      0.01 ± 31%     -71.4%       0.00 ±141%  perf-stat.ps.major-faults
 1.828e+14           -95.5%  8.216e+12        perf-stat.total.instructions
      0.04 ±  2%     +31.9%       0.05 ± 24%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.02 ± 15%    +115.4%       0.04 ± 20%  perf-sched.sch_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.02 ± 21%     -60.9%       0.01 ± 24%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.01 ± 10%     +90.2%       0.01 ± 19%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 12%   +1083.0%       0.10 ±138%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ±  8%    +100.0%       0.01 ±  8%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00          +175.0%       0.01 ± 14%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ± 14%    +178.0%       0.02 ± 36%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.90 ±108%     -98.4%       0.01 ± 39%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.01 ±  7%    +125.5%       0.02 ± 32%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ± 33%  +19261.3%       3.84 ±140%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     98.63 ±  2%     +11.2%     109.65 ±  2%  perf-sched.total_wait_and_delay.average.ms
      3382 ± 15%     +22.9%       4155 ± 11%  perf-sched.total_wait_and_delay.max.ms
     98.21 ±  2%     +11.2%     109.24 ±  2%  perf-sched.total_wait_time.average.ms
      3382 ± 15%     +22.9%       4155 ± 11%  perf-sched.total_wait_time.max.ms
      4.83 ±  5%     -28.2%       3.47 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     84.86 ±  3%     +29.2%     109.64 ± 17%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     19.33 ±  6%    +103.7%      39.36 ± 15%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      2.58 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.04 ± 22%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      1.88 ± 16%     -44.7%       1.04 ± 13%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      5.95 ±  2%     -21.0%       4.70        perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1461 ±  6%     -49.8%     733.83 ± 17%  perf-sched.wait_and_delay.count.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
    583.67 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    347.33 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
    808.83 ±  2%     +31.0%       1059        perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2390 ± 16%     -54.4%       1090 ± 18%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     21.69 ±101%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      2.44 ± 87%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
     34.72 ± 81%     -68.8%      10.84 ±107%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    215.67 ± 10%     -40.0%     129.34 ± 27%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      4.79 ±  6%     -28.6%       3.42 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     84.85 ±  3%     +29.2%     109.62 ± 17%  perf-sched.wait_time.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     19.31 ±  6%    +103.7%      39.32 ± 15%  perf-sched.wait_time.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.02 ± 29%     -65.4%       0.01 ± 24%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      2.79 ± 10%     -21.2%       2.20 ±  9%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1.83 ± 16%     -45.1%       1.01 ± 13%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      5.95 ±  2%     -21.1%       4.69        perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2389 ± 16%     -54.4%       1090 ± 18%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.60 ±102%     -99.1%       0.01 ± 39%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      4.99           -36.8%       3.16 ± 38%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     34.41 ± 81%     -68.8%      10.74 ±106%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    215.66 ± 10%     -40.0%     129.32 ± 27%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     17.37           -17.4        0.00        perf-profile.calltrace.cycles-pp.clear_bhb_loop.syscall
     14.97           -15.0        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
      5.13            -5.1        0.00        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      4.92            -3.3        1.61 ±  7%  perf-profile.calltrace.cycles-pp.futex_hash.futex_wait_setup.__futex_wait.futex_wait.do_futex
     99.06            +0.8       99.86        perf-profile.calltrace.cycles-pp.syscall
      3.14 ±  7%      +0.9        4.00        perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      2.78 ±  2%      +2.0        4.73        perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     57.80           +41.6       99.43        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     55.37           +44.0       99.36        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     44.28           +54.9       99.20        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     40.78           +58.4       99.16        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     38.15           +61.0       99.14        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     35.04           +64.1       99.10        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     25.08           +73.9       99.00        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      2.96 ±  5%     +85.6       88.52        perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      0.00           +87.8       87.81        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_wait_setup.__futex_wait.futex_wait
     17.49           -17.3        0.20 ±  2%  perf-profile.children.cycles-pp.clear_bhb_loop
     10.98           -10.8        0.14        perf-profile.children.cycles-pp.entry_SYSCALL_64
      5.66            -5.6        0.08 ±  4%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      5.26            -5.2        0.09 ±  5%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      4.93            -3.3        1.61 ±  8%  perf-profile.children.cycles-pp.futex_hash
      2.88            -2.8        0.07        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.51 ±  2%      -0.1        0.40 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.48 ±  2%      -0.1        0.38 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.47 ±  2%      -0.1        0.37 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.47 ±  2%      -0.1        0.37 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.37 ±  3%      -0.1        0.29 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.30 ±  2%      -0.1        0.24 ±  3%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.25 ±  2%      -0.1        0.20 ±  2%  perf-profile.children.cycles-pp.update_process_times
      0.10            -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.get_jiffies_update
      0.10            -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.08 ±  5%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.11            -0.0        0.10 ±  3%  perf-profile.children.cycles-pp.sched_tick
     99.26            +0.7       99.93        perf-profile.children.cycles-pp.syscall
      3.26 ±  6%      +0.7        4.00        perf-profile.children.cycles-pp.futex_q_lock
      2.78 ±  2%      +2.0        4.73        perf-profile.children.cycles-pp.futex_q_unlock
     58.20           +41.3       99.46        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     55.71           +43.7       99.39        perf-profile.children.cycles-pp.do_syscall_64
     44.58           +54.6       99.21        perf-profile.children.cycles-pp.__x64_sys_futex
     41.04           +58.1       99.17        perf-profile.children.cycles-pp.do_futex
     38.42           +60.7       99.14        perf-profile.children.cycles-pp.futex_wait
     35.33           +63.8       99.11        perf-profile.children.cycles-pp.__futex_wait
     25.71           +73.3       99.01        perf-profile.children.cycles-pp.futex_wait_setup
      3.08 ±  5%     +85.5       88.53        perf-profile.children.cycles-pp._raw_spin_lock
      0.02 ±142%     +87.8       87.82        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     17.38           -17.2        0.20 ±  2%  perf-profile.self.cycles-pp.clear_bhb_loop
      9.55            -9.5        0.10 ±  4%  perf-profile.self.cycles-pp.__futex_wait
      8.72            -8.6        0.12 ±  3%  perf-profile.self.cycles-pp.futex_wait_setup
      8.70            -8.6        0.12 ±  3%  perf-profile.self.cycles-pp.syscall
      5.61            -5.5        0.07        perf-profile.self.cycles-pp.entry_SYSCALL_64
      5.43            -5.4        0.07        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      4.54            -4.5        0.07        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      3.72            -3.7        0.04 ± 44%  perf-profile.self.cycles-pp.do_syscall_64
      4.76            -3.2        1.60 ±  8%  perf-profile.self.cycles-pp.futex_hash
      2.54            -2.5        0.03 ± 70%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.92 ±  4%      -2.2        0.71        perf-profile.self.cycles-pp._raw_spin_lock
      1.50            -1.4        0.05        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.10            -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.get_jiffies_update
      0.08 ±  5%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      3.19 ±  6%      +0.8        3.98        perf-profile.self.cycles-pp.futex_q_lock
      2.60 ±  2%      +2.1        4.72        perf-profile.self.cycles-pp.futex_q_unlock
      0.02 ±142%     +87.5       87.48        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath


***************************************************************************************************
lkp-srf-2sp2: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/300s/lkp-srf-2sp2/hash/perf-bench-futex

commit: 
  80367ad01d ("futex: Add basic infrastructure for local task local hash")
  7c4f75a21f ("futex: Allow automatic allocation of process wide futex hash")

80367ad01d93ac78 7c4f75a21f636486d2969d9b668 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     79777 ±  9%     +29.6%     103404 ± 14%  sched_debug.cpu.avg_idle.stddev
     13.14           -92.4%       0.99        vmstat.cpu.us
     85.94           +12.6       98.54        mpstat.cpu.all.sys%
     13.40           -12.6        0.76        mpstat.cpu.all.usr%
    253330            +1.4%     256755        proc-vmstat.nr_active_anon
      2296            +2.2%       2346        proc-vmstat.nr_page_table_pages
     77274            +4.5%      80782        proc-vmstat.nr_shmem
    253330            +1.4%     256755        proc-vmstat.nr_zone_active_anon
   2667058           -94.6%     144593        perf-bench-futex.ops/s
      0.06 ± 13%      +0.2        0.21 ± 14%  perf-bench-futex.stddev%
    229015            -3.4%     221126        perf-bench-futex.time.involuntary_context_switches
     49696           +14.7%      57010        perf-bench-futex.time.system_time
      7728           -94.6%     416.35        perf-bench-futex.time.user_time
      0.74           +90.7%       1.40        perf-stat.i.MPKI
 5.333e+10           -82.2%   9.48e+09        perf-stat.i.branch-instructions
      0.02 ± 44%      +0.4        0.41        perf-stat.i.branch-miss-rate%
   9538223 ± 47%    +310.1%   39118125        perf-stat.i.branch-misses
     50.17           -14.2       35.98        perf-stat.i.cache-miss-rate%
 2.424e+08           -74.7%   61296533        perf-stat.i.cache-misses
 4.833e+08           -64.7%  1.706e+08        perf-stat.i.cache-references
      1.86          +653.3%      13.99        perf-stat.i.cpi
    249.82            -4.0%     239.71        perf-stat.i.cpu-migrations
      2522          +295.4%       9974        perf-stat.i.cycles-between-cache-misses
 3.295e+11           -86.7%  4.369e+10        perf-stat.i.instructions
      0.54           -86.7%       0.07        perf-stat.i.ipc
      0.74           +90.7%       1.40        perf-stat.overall.MPKI
      0.02 ± 47%      +0.4        0.41        perf-stat.overall.branch-miss-rate%
     50.15           -14.2       35.93        perf-stat.overall.cache-miss-rate%
      1.86          +654.2%      14.00        perf-stat.overall.cpi
      2522          +295.6%       9979        perf-stat.overall.cycles-between-cache-misses
      0.54           -86.7%       0.07        perf-stat.overall.ipc
 5.316e+10           -82.2%  9.448e+09        perf-stat.ps.branch-instructions
   9509524 ± 47%    +310.0%   38990460        perf-stat.ps.branch-misses
 2.416e+08           -74.7%   61091933        perf-stat.ps.cache-misses
 4.817e+08           -64.7%    1.7e+08        perf-stat.ps.cache-references
    249.00            -4.0%     238.92        perf-stat.ps.cpu-migrations
 3.284e+11           -86.7%  4.354e+10        perf-stat.ps.instructions
  9.88e+13           -86.7%   1.31e+13        perf-stat.total.instructions
      0.02           +52.8%       0.04 ±  9%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01           +80.0%       0.01 ±  9%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ± 13%     +31.1%       0.03 ± 18%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.01 ±  7%    +122.5%       0.01 ± 47%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±142%    +566.7%       0.01 ± 39%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.00          +204.2%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ± 22%    +147.9%       0.02 ± 25%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 12%    +298.1%       0.04 ± 29%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.36 ± 50%     -70.5%       0.11 ± 64%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.01 ±  5%    +145.6%       0.02 ± 64%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±142%    +566.7%       0.01 ± 39%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.02 ± 58%    +318.7%       0.07 ± 27%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    125.67 ±  2%     -11.1%     111.69 ±  2%  perf-sched.total_wait_and_delay.average.ms
    125.61 ±  2%     -11.1%     111.63 ±  2%  perf-sched.total_wait_time.average.ms
     37.18 ± 15%     +36.8%      50.87 ± 10%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.24 ± 23%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.05 ± 26%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      7.31 ±  5%     -29.9%       5.12 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    547.19           -12.1%     480.98        perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    771.00 ± 14%     -27.7%     557.50 ± 10%  perf-sched.wait_and_delay.count.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
    247.83 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    145.17 ± 31%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
    632.33 ±  5%     +53.9%     973.00 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3727           +11.5%       4155 ±  2%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      8.43 ± 63%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.72 ± 50%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
    530.84 ±  4%     -44.9%     292.50 ± 10%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     37.16 ± 14%     +36.8%      50.84 ± 10%  perf-sched.wait_time.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      3.12 ± 12%     -31.8%       2.13 ± 13%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      7.30 ±  5%     -30.0%       5.11 ±  3%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    547.19           -12.1%     480.97        perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.36 ± 50%     -70.5%       0.11 ± 64%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      4.83 ±  7%     -37.9%       3.00 ± 37%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    530.83 ±  4%     -44.9%     292.49 ± 10%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread



***************************************************************************************************
lkp-icl-2sp5: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/Sequential Fill/debian-12-x86_64-phoronix/lkp-icl-2sp5/speedb-1.0.1/phoronix-test-suite

commit: 
  80367ad01d ("futex: Add basic infrastructure for local task local hash")
  7c4f75a21f ("futex: Allow automatic allocation of process wide futex hash")

80367ad01d93ac78 7c4f75a21f636486d2969d9b668 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 6.085e+10           +14.7%  6.979e+10        cpuidle..time
    832.35           +11.0%     923.95        uptime.boot
     75739           +11.9%      84762        uptime.idle
    745.32           -11.5%     659.62        vmstat.io.bi
   1256218            -5.3%    1190033        vmstat.system.cs
   1512066            -4.4%    1445260        proc-vmstat.nr_active_anon
   1758143            -3.9%    1688770        proc-vmstat.nr_file_pages
     48547            -5.9%      45679        proc-vmstat.nr_mapped
   1147755            -6.1%    1078202        proc-vmstat.nr_shmem
   1512066            -4.4%    1445260        proc-vmstat.nr_zone_active_anon
   1252996 ±  7%     +49.6%    1875006 ± 14%  proc-vmstat.numa_pte_updates
      0.56           +10.4%       0.62        perf-sched.total_wait_and_delay.average.ms
   3397230            -9.6%    3070064        perf-sched.total_wait_and_delay.count.ms
      0.56           +10.5%       0.62        perf-sched.total_wait_time.average.ms
      0.18           +10.9%       0.20        perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
   3388022            -9.6%    3061182        perf-sched.wait_and_delay.count.futex_do_wait.__futex_wait.futex_wait.do_futex
      1238           +11.3%       1378        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.18           +11.2%       0.20        perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1238           +11.3%       1378        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    554832           -11.7%     490186        phoronix-test-suite.speedb.SequentialFill.op_s
    713.28           +12.8%     804.49        phoronix-test-suite.time.elapsed_time
    713.28           +12.8%     804.49        phoronix-test-suite.time.elapsed_time.max
    258734 ±  3%     -14.9%     220243 ±  7%  phoronix-test-suite.time.involuntary_context_switches
      4069            -3.4%       3931        phoronix-test-suite.time.percent_of_cpu_this_job_got
     18615           +12.0%      20857        phoronix-test-suite.time.system_time
     10416            +3.5%      10776        phoronix-test-suite.time.user_time
 4.488e+08            +6.8%  4.792e+08        phoronix-test-suite.time.voluntary_context_switches
      0.36            +8.0%       0.39        perf-stat.i.MPKI
  27161568            -2.5%   26475937        perf-stat.i.branch-misses
     28.74            +1.8       30.50        perf-stat.i.cache-miss-rate%
  53609412            +7.0%   57337744        perf-stat.i.cache-misses
   1262748            -5.3%    1195372        perf-stat.i.context-switches
      0.98            -3.1%       0.95        perf-stat.i.cpi
  1.46e+11            -3.5%  1.408e+11        perf-stat.i.cpu-cycles
      2826            -9.6%       2556        perf-stat.i.cycles-between-cache-misses
      0.03            -0.0        0.03 ±  4%  perf-stat.i.dTLB-load-miss-rate%
   4282480 ±  2%      -7.6%    3958135        perf-stat.i.dTLB-load-misses
      0.01 ±  2%      -0.0        0.01 ±  4%  perf-stat.i.dTLB-store-miss-rate%
    636770 ±  4%     -24.1%     483093 ±  2%  perf-stat.i.dTLB-store-misses
      1.06            +3.2%       1.10        perf-stat.i.ipc
      0.28           -12.2%       0.24 ±  7%  perf-stat.i.major-faults
      1.14            -3.5%       1.10        perf-stat.i.metric.GHz
    257.79            +7.6%     277.26        perf-stat.i.metric.K/sec
      7866 ±  2%      -7.8%       7256        perf-stat.i.minor-faults
  16753987            +4.7%   17536138        perf-stat.i.node-load-misses
   6529414 ±  2%     +16.2%    7589233        perf-stat.i.node-store-misses
   4718305 ±  2%     +20.1%    5666449        perf-stat.i.node-stores
      7866 ±  2%      -7.8%       7256        perf-stat.i.page-faults
      0.34            +7.3%       0.37        perf-stat.overall.MPKI
      0.07            -0.0        0.07        perf-stat.overall.branch-miss-rate%
     28.91            +1.8       30.67        perf-stat.overall.cache-miss-rate%
      0.93            -3.1%       0.90        perf-stat.overall.cpi
      2722            -9.8%       2457        perf-stat.overall.cycles-between-cache-misses
      0.01            -0.0        0.01        perf-stat.overall.dTLB-load-miss-rate%
      0.00 ±  4%      -0.0        0.00 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
      1.08            +3.3%       1.11        perf-stat.overall.ipc
  27129347            -2.5%   26448313        perf-stat.ps.branch-misses
  53525176            +7.0%   57254557        perf-stat.ps.cache-misses
   1260670            -5.3%    1193642        perf-stat.ps.context-switches
 1.457e+11            -3.5%  1.406e+11        perf-stat.ps.cpu-cycles
   4278010 ±  2%      -7.6%    3953474        perf-stat.ps.dTLB-load-misses
    635974 ±  4%     -24.1%     482580 ±  2%  perf-stat.ps.dTLB-store-misses
      0.28           -12.1%       0.25 ±  7%  perf-stat.ps.major-faults
      7861 ±  2%      -7.8%       7251        perf-stat.ps.minor-faults
  16727387            +4.7%   17510697        perf-stat.ps.node-load-misses
   6518975 ±  2%     +16.2%    7578033        perf-stat.ps.node-store-misses
   4711090 ±  2%     +20.1%    5658530        perf-stat.ps.node-stores
      7861 ±  2%      -7.8%       7251        perf-stat.ps.page-faults
 1.122e+14           +12.4%  1.261e+14        perf-stat.total.instructions
      2.18 ± 12%     -29.6%       1.54 ± 15%  sched_debug.cfs_rq:/.load_avg.min
     64.68 ± 20%     -41.6%      37.77 ± 16%  sched_debug.cfs_rq:/.runnable_avg.min
     64.69 ± 20%     -41.6%      37.76 ± 16%  sched_debug.cfs_rq:/.util_avg.min
   4792810            +9.9%    5265167        sched_debug.cfs_rq:/system.slice.avg_vruntime.min
      9.18 ±  9%     -11.1%       8.16 ±  3%  sched_debug.cfs_rq:/system.slice.load_avg.avg
      2.31 ± 16%     -25.1%       1.73 ± 19%  sched_debug.cfs_rq:/system.slice.load_avg.min
   4792810            +9.9%    5265167        sched_debug.cfs_rq:/system.slice.min_vruntime.min
     64.62 ± 20%     -41.6%      37.73 ± 15%  sched_debug.cfs_rq:/system.slice.runnable_avg.min
      1.43 ± 18%     -45.1%       0.79 ± 20%  sched_debug.cfs_rq:/system.slice.se->avg.load_avg.min
     64.58 ± 20%     -41.6%      37.70 ± 16%  sched_debug.cfs_rq:/system.slice.se->avg.runnable_avg.min
     64.61 ± 20%     -41.6%      37.70 ± 16%  sched_debug.cfs_rq:/system.slice.se->avg.util_avg.min
    445227           +13.5%     505275        sched_debug.cfs_rq:/system.slice.se->exec_start.avg
    445590           +13.5%     505640        sched_debug.cfs_rq:/system.slice.se->exec_start.max
    437889           +13.7%     497827        sched_debug.cfs_rq:/system.slice.se->exec_start.min
    103036           +14.2%     117717        sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.avg
    113992 ±  3%     +11.4%     127019        sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.max
    101120           +14.3%     115617        sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.min
      2.28 ± 12%     -23.2%       1.75 ± 16%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.min
     64.65 ± 20%     -41.6%      37.73 ± 16%  sched_debug.cfs_rq:/system.slice.util_avg.min
    445111           +13.5%     505165        sched_debug.cfs_rq:/system.slice/containerd.service.se->exec_start.avg
    445426           +13.5%     505520        sched_debug.cfs_rq:/system.slice/containerd.service.se->exec_start.max
    442897           +13.5%     502644        sched_debug.cfs_rq:/system.slice/containerd.service.se->exec_start.min
   4860094            +9.9%    5339463        sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.avg
   4805849           +10.0%    5287162        sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.min
    102970           +14.2%     117638        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.avg_vruntime.avg
    113941 ±  3%     +11.3%     126851        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.avg_vruntime.max
    101055           +14.3%     115547        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.avg_vruntime.min
     69.43 ± 13%     -43.9%      38.94 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.load_avg.min
    102970           +14.2%     117638        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.min_vruntime.avg
    113941 ±  3%     +11.3%     126851        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.min_vruntime.max
    101055           +14.3%     115547        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.min_vruntime.min
     69.17 ± 14%     -44.2%      38.61 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.runnable_avg.min
      1.22 ± 19%     -49.4%       0.62 ± 17%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.load_avg.min
     67.61 ± 14%     -44.7%      37.38 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.runnable_avg.min
     67.64 ± 14%     -44.7%      37.38 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.util_avg.min
    445226           +13.5%     505279        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->exec_start.avg
    445589           +13.5%     505640        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->exec_start.max
    437889           +13.7%     497980        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->exec_start.min
    102976           +14.2%     117644        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->sum_exec_runtime.avg
    113947 ±  3%     +11.3%     126858        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->sum_exec_runtime.max
    101061           +14.3%     115553        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->sum_exec_runtime.min
   4792828            +9.9%    5266259        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->vruntime.min
     71.67 ± 20%     -47.8%      37.38 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg_contrib.min
     69.17 ± 14%     -44.2%      38.60 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.util_avg.min
      0.12 ± 33%     -42.9%       0.07 ± 57%  sched_debug.cfs_rq:/system.slice/redis-server.service.load_avg.max
    445113           +13.5%     505199        sched_debug.cfs_rq:/system.slice/redis-server.service.se->exec_start.avg
    445251           +13.5%     505317        sched_debug.cfs_rq:/system.slice/redis-server.service.se->exec_start.max
    444977           +13.5%     505056        sched_debug.cfs_rq:/system.slice/redis-server.service.se->exec_start.min
   4855865            +9.8%    5333093        sched_debug.cfs_rq:/system.slice/redis-server.service.se->vruntime.avg
   4871037            +9.8%    5349946        sched_debug.cfs_rq:/system.slice/redis-server.service.se->vruntime.max
   4840982            +9.8%    5317191        sched_debug.cfs_rq:/system.slice/redis-server.service.se->vruntime.min
      0.14 ± 28%     -48.6%       0.07 ± 57%  sched_debug.cfs_rq:/system.slice/redis-server.service.tg_load_avg.max
      0.12 ± 33%     -42.9%       0.07 ± 57%  sched_debug.cfs_rq:/system.slice/redis-server.service.tg_load_avg_contrib.max
    447837           +13.5%     508303        sched_debug.cpu.clock.avg
    447843           +13.5%     508310        sched_debug.cpu.clock.max
    447830           +13.5%     508297        sched_debug.cpu.clock.min
    445243           +13.5%     505290        sched_debug.cpu.clock_task.avg
    445599           +13.5%     505645        sched_debug.cpu.clock_task.max
    437708           +13.7%     497758        sched_debug.cpu.clock_task.min
      3266 ±  3%     +10.9%       3623 ±  5%  sched_debug.cpu.curr->pid.avg
     13788           +11.1%      15317        sched_debug.cpu.curr->pid.max
      4619           +14.6%       5292 ±  3%  sched_debug.cpu.curr->pid.stddev
   3215856           +12.5%    3616881        sched_debug.cpu.nr_switches.avg
   3332744           +11.7%    3724017        sched_debug.cpu.nr_switches.max
   3037135           +14.3%    3470789        sched_debug.cpu.nr_switches.min
      0.01 ± 10%     -18.9%       0.01 ± 19%  sched_debug.cpu.nr_uninterruptible.avg
    447830           +13.5%     508297        sched_debug.cpu_clk
    447123           +13.5%     507589        sched_debug.ktime
    448701           +13.5%     509200        sched_debug.sched_clk
     85.47            -4.0       81.46 ±  6%  perf-profile.calltrace.cycles-pp.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite.rocksdb::Benchmark::ThreadBody
     85.62            -4.0       81.62 ±  6%  perf-profile.calltrace.cycles-pp.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite.rocksdb::Benchmark::ThreadBody
     85.87            -4.0       81.88 ±  5%  perf-profile.calltrace.cycles-pp.rocksdb::Benchmark::ThreadBody
     85.85            -4.0       81.86 ±  5%  perf-profile.calltrace.cycles-pp.rocksdb::Benchmark::DoWrite.rocksdb::Benchmark::ThreadBody
      2.27 ± 15%      -0.8        1.46 ±  8%  perf-profile.calltrace.cycles-pp.rocksdb::WriteThread::JoinBatchGroup.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite.rocksdb::Benchmark::ThreadBody
      2.27 ± 15%      -0.8        1.46 ±  8%  perf-profile.calltrace.cycles-pp.rocksdb::WriteThread::LinkOne.rocksdb::WriteThread::JoinBatchGroup.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite
      7.95            -0.7        7.23 ± 10%  perf-profile.calltrace.cycles-pp.clear_bhb_loop.__sched_yield.rocksdb::WriteThread::CompleteParallelMemTableWriter.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write
      3.48            -0.3        3.14 ± 10%  perf-profile.calltrace.cycles-pp.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.63 ±  2%      -0.2        0.39 ± 70%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__sched_yield.rocksdb::WriteThread::CompleteParallelMemTableWriter.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write
      1.24            +0.7        1.98 ± 32%  perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_cond_signal
      0.00            +0.7        0.74 ± 27%  perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      1.25            +0.7        2.00 ± 31%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_cond_signal
      1.29            +0.8        2.04 ± 31%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_cond_signal
      1.30            +0.8        2.05 ± 31%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.pthread_cond_signal
      0.00            +0.8        0.76 ± 23%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.rocksdb::WriteThread::AwaitState.rocksdb::DBImpl::WriteImpl
      1.47            +0.8        2.26 ± 31%  perf-profile.calltrace.cycles-pp.pthread_cond_signal
      0.00            +0.8        0.80 ± 22%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rocksdb::WriteThread::AwaitState.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write
      2.02            +0.8        2.83 ± 26%  perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
      0.00            +0.8        0.80 ± 23%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rocksdb::WriteThread::AwaitState.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite
      2.05            +0.8        2.87 ± 26%  perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.06            +0.8        2.88 ± 26%  perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.07            +0.8        2.92 ± 26%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.0        0.95 ± 48%  perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.rocksdb::WriteThread::AwaitState
      2.33            +1.0        3.38 ± 26%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.32            +1.0        3.37 ± 26%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.23            +1.7        2.92 ± 37%  perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     85.49            -4.0       81.48 ±  6%  perf-profile.children.cycles-pp.rocksdb::DBImpl::WriteImpl
     85.62            -4.0       81.63 ±  6%  perf-profile.children.cycles-pp.rocksdb::DBImpl::Write
     85.87            -4.0       81.88 ±  5%  perf-profile.children.cycles-pp.rocksdb::Benchmark::ThreadBody
     85.86            -4.0       81.87 ±  5%  perf-profile.children.cycles-pp.rocksdb::Benchmark::DoWrite
      2.34 ± 15%      -0.8        1.52 ±  8%  perf-profile.children.cycles-pp.rocksdb::WriteThread::LinkOne
      2.28 ± 15%      -0.8        1.46 ±  8%  perf-profile.children.cycles-pp.rocksdb::WriteThread::JoinBatchGroup
      8.24            -0.7        7.56 ±  9%  perf-profile.children.cycles-pp.clear_bhb_loop
      3.85            -0.4        3.47 ± 10%  perf-profile.children.cycles-pp.do_sched_yield
      0.80            -0.1        0.71 ±  9%  perf-profile.children.cycles-pp.raw_spin_rq_unlock
      0.26 ± 10%      -0.1        0.20 ± 15%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.46 ±  2%      -0.1        0.40 ± 11%  perf-profile.children.cycles-pp.yield_task_fair
      0.31            -0.1        0.26 ±  3%  perf-profile.children.cycles-pp.pthread_cond_destroy
      0.16 ± 12%      -0.0        0.11 ± 20%  perf-profile.children.cycles-pp.pthread_rwlock_rdlock
      0.10 ±  6%      +0.0        0.14 ± 25%  perf-profile.children.cycles-pp.start_dl_timer
      0.06 ±  7%      +0.0        0.10 ± 25%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.10            +0.0        0.14 ± 27%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.03 ± 70%      +0.0        0.08 ± 28%  perf-profile.children.cycles-pp.switch_hrtimer_base
      0.20 ±  2%      +0.1        0.27 ± 28%  perf-profile.children.cycles-pp.enqueue_dl_entity
      0.00            +0.1        0.09 ± 29%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.1        0.09 ± 34%  perf-profile.children.cycles-pp.wake_q_add_safe
      0.14 ±  7%      +0.1        0.24 ± 34%  perf-profile.children.cycles-pp.futex_q_lock
      0.00            +0.2        0.18 ± 28%  perf-profile.children.cycles-pp.plist_add
      0.00            +0.2        0.20 ± 28%  perf-profile.children.cycles-pp.__futex_queue
      0.00            +0.2        0.25 ± 31%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.16 ±  2%      +0.3        0.51 ± 33%  perf-profile.children.cycles-pp.futex_wake_mark
      0.00            +0.4        0.40 ± 35%  perf-profile.children.cycles-pp.__futex_unqueue
      0.29            +0.5        0.75 ± 27%  perf-profile.children.cycles-pp.futex_wait_setup
      3.70            +0.5        4.22        perf-profile.children.cycles-pp._raw_spin_lock
      1.51            +0.8        2.31 ± 31%  perf-profile.children.cycles-pp.pthread_cond_signal
      2.04            +0.8        2.83 ± 26%  perf-profile.children.cycles-pp.__futex_wait
      2.05            +0.8        2.87 ± 26%  perf-profile.children.cycles-pp.futex_wait
      1.36            +1.7        3.06 ± 32%  perf-profile.children.cycles-pp.futex_wake
      3.44            +2.5        5.96 ± 29%  perf-profile.children.cycles-pp.do_futex
      3.47            +2.5        6.01 ± 29%  perf-profile.children.cycles-pp.__x64_sys_futex
      2.33 ± 15%      -0.8        1.51 ±  8%  perf-profile.self.cycles-pp.rocksdb::WriteThread::LinkOne
      8.14            -0.7        7.46 ±  9%  perf-profile.self.cycles-pp.clear_bhb_loop
      5.63            -0.3        5.31 ±  6%  perf-profile.self.cycles-pp.__schedule
      1.24            -0.2        1.08 ± 10%  perf-profile.self.cycles-pp.do_sched_yield
      0.54            -0.1        0.48 ± 10%  perf-profile.self.cycles-pp.raw_spin_rq_unlock
      0.30 ±  2%      -0.1        0.25 ±  5%  perf-profile.self.cycles-pp.pthread_cond_destroy
      0.16 ± 12%      -0.0        0.11 ± 20%  perf-profile.self.cycles-pp.pthread_rwlock_rdlock
      0.06            -0.0        0.03 ± 70%  perf-profile.self.cycles-pp.rocksdb::WriteThread::SetState
      0.08 ±  4%      +0.0        0.12 ± 35%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.1        0.08 ± 29%  perf-profile.self.cycles-pp.switch_fpu_return
      0.00            +0.1        0.09 ± 34%  perf-profile.self.cycles-pp.wake_q_add_safe
      0.14 ±  9%      +0.1        0.24 ± 34%  perf-profile.self.cycles-pp.futex_q_lock
      0.08 ±  8%      +0.1        0.20 ± 75%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.2        0.18 ± 29%  perf-profile.self.cycles-pp.plist_add
      0.00            +0.2        0.25 ± 31%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      3.46            +0.3        3.78 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.4        0.37 ± 36%  perf-profile.self.cycles-pp.__futex_unqueue
      0.32 ±  3%      +0.8        1.10 ± 34%  perf-profile.self.cycles-pp.futex_wake





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


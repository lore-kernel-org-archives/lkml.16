Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B86291C25
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806365; cv=fail; b=UcT+33O+8/3JCuTZW6DkG84bZgB5tW2f4rfUyZRnq1i4X+bacyTm9yZ4pmfyM3vvWTrnFfSVFmG4MMcLdZt6R6MZ5vtFPAGvzuAhlUzIinp8uLEqAenwa62HK8KrrdorplIyjDAfVbLdI0ssGsWS6Rsf+3M4NZzkWskxfNtpyi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806365; c=relaxed/simple;
	bh=ZE5FZNfrf36sH7o9sOnzHlbh0i4LtSzK8iPJN0Y9mlQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=npHK4ZL9UP6HSuw4jvnXBsWewezCqcSZoxGC5jbKN9dGcjKXL1SH+HD0f0T0xzG9sKiRc3N9l/k75txTsic4cJ3EbX7x9yXrdvh0JRJhYX1x2oCAu8j6rxCfpsa0wchnJpJSwU120ogQyCqZcpF8W/s6K4aaX8tdd3/3HVNuAVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNgrTdIz; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNgrTdIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749806363; x=1781342363;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=ZE5FZNfrf36sH7o9sOnzHlbh0i4LtSzK8iPJN0Y9mlQ=;
  b=nNgrTdIzsV2WZCkdszlYuYN09ZVugFIzlRSulnMWBj5BtovgqeHPCERQ
   j6Rj3OVhmmyJHz7s8hPXu7nE7MdZpJJpTjJPQPzHzhiawcBYjQ2CNE7Ro
   Cyt0UECkd1uT6/f7595C4u0LuIhN7nqAQi1Cm8Do4gbMAsT4NnGx5G4d7
   JDdlDx+FtNsxLASbRw6fIExefVipBkUB5+iNNToLCzw4EnPUVEs2Eptx+
   BQT2qwyuSQid4rRHZW27QV+1JyEuAQS+/z1l0J/VzHMkHh1riUPy/dHpF
   p8A4mjnaIuLGK27pBLqr9twS4Khex2YKTuYs1A4zC/M8tcLMu/FhUlMy+
   A==;
X-CSE-ConnectionGUID: 1qKsvn4gQKW/dUHUsR4YIA==
X-CSE-MsgGUID: 2TiV77UXShqQVlKo6cuzIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51241619"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="51241619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 02:19:23 -0700
X-CSE-ConnectionGUID: dMVXVBWyS3COYUbPGM4bDw==
X-CSE-MsgGUID: FhyEXhZQQ0SbXSiYy+L6Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148254277"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 02:19:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 02:19:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 02:19:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.80) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 02:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaNIceGXQQrkyWntwyNu+3J7PgrbXP9N8EMCwXpp83Mem8IYn4KFPlzwSFVUvVsQ/KHdHVU53uM3s9NsvPLfQ17MNG2RSgNfkPGV5ABhlG8sChMbZgnlY50d1lq7mh6rw+drfLpxG0f1RErxwyj6Pq3l2weZcc0wTe+0k6KIYX5Eo44/76QXJK+d/dX2y+Qd8f5Xdi/eqiRtcjd8y96ZcQmFL7SlOtNNgXPr5S+KYcWo74yXRhGU9LQ7rKnZug2whlp+p4V298b/pCjLg8UER0JSUR7ySotkXcpg5bAZoCgQj3wXA0mq7TJ524g1npzEpUYABKGTLWunj6qZE6YxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykezqsMRSFVnuW7Wsti0SVrPDKyflUh0Fd+MKs/StUI=;
 b=hfswHoDa7NlAbm+FfQTv7RFz+xU72D+sZg/xuzSL7s/vjNlBuZLU6SwNzz0jp3DNuqks1lSEBjoK6qm8qwYpbTW6YfRjpMwyXGcvqT5DDykR1pqspVXbCgqiMaD0ZwoagqK9jGorIWZFA1gAw/ISZuDphvxoxtXOxh9mmm3p02JUBScPIAZLjdGqyaBM47KhNXu0wkfnscaKS8w02YVUTiWBJMbnTOCAAy5y1ESVAVZyi986LU9unbmZ1BeWiDVNShqVriGs0X7nrmVr9M8Xmb4txK6jvU6YAJ/jNQVjNmE+XAb4UlJBgFjEYUuEw0r0aKCRIhoAN++7DHCzxh9yvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 13 Jun
 2025 09:19:19 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 09:19:19 +0000
Date: Fri, 13 Jun 2025 17:19:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, <oliver.sang@intel.com>
Subject: [linus:master] [futex]  b04b8f3032:  perf-bench-futex.ops/s 4.1%
 regression
Message-ID: <202506131635.f3240923-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU1PR03CA0025.apcprd03.prod.outlook.com
 (2603:1096:802:19::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 801e0955-11c0-488d-6375-08ddaa5b604e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?t+T778k46sjducahj4KEK7eMPyBSQT1SWSAuAaPL8AQjQTM1S9w2TPdG1D?=
 =?iso-8859-1?Q?QikWCC0KWI48LhfKLR7F+C+kpOqqde/LDnWELq2T13lE1DfQu3Rlgndtrf?=
 =?iso-8859-1?Q?p9JthJvEdEuwm1GPIYBqIAOoVqlZeOvvHx/ApTLCxCK09H3HGjd2lrQyxJ?=
 =?iso-8859-1?Q?F/L+r7sxgKpEmxhTWRLOjfDDHwOAxOezRRPem6lOmrZH0t7qNDl5wCdScw?=
 =?iso-8859-1?Q?+E9HVwjPJZUlXUCSkmzGg1cKULg8dCYHruaDqjL92pGAohRCNFy/NxJTVo?=
 =?iso-8859-1?Q?Bra8N/9eTGBuqCYJVTCogwqDG4dD7EgfacNmWhzcLm0wZAAqfFmHebYUI4?=
 =?iso-8859-1?Q?BiwO6+tsv1TnLSKz+LzFWvEVsJF68vc4dKrFCeGZ+1QxRQWwnezTjRROCs?=
 =?iso-8859-1?Q?qtxd0gGrySumJLj9RABrQPAcUsqyoGYuDV3oIPTBDAdckjtdOspLXRQFau?=
 =?iso-8859-1?Q?kvkRmaYXaoCYEGYjmpVI0E4FKAw8rP+rCLy9A4NT5hOFA/kfdZSo7USYZd?=
 =?iso-8859-1?Q?+uqL8yb8d7kyTB64/Rwdf8nFKSZn1l5FiwfHt/4KEw0x4jBWjkRjVB46qV?=
 =?iso-8859-1?Q?GaTKvoZRc7YJYahsO5yNG9B+ZVNOj2xG4ZZFsu8O1LtxBFX/3H5gbCvAMz?=
 =?iso-8859-1?Q?Ybi2C11/ctTmGkbdaj782EuZND00XoW4RlTFoMRuPwvXB8oTAsr6+0s53J?=
 =?iso-8859-1?Q?wnrxnixubB039WqqvOvln/ER4pjcq37TKanIQd/FtXoXrm4DhTLsK/S2vY?=
 =?iso-8859-1?Q?SLmWVwioTPyHKcLHbVvkSes3yd4R1ILhj1UsSw67c7q5Rq3eRbGPLqI20z?=
 =?iso-8859-1?Q?vnDlAlfr0zdwRx0nmHkB5eKECgVssSGNVDKQqDvS8Em4wHnDRdmMC6mLWr?=
 =?iso-8859-1?Q?KkZTIxLWtE5Bf3CMgH9BauOPvwOQiOxc+0nbJkGVaMK4KwKMWfEJZZcXxw?=
 =?iso-8859-1?Q?mVFIz+knf9KpmGSD/nW7uzrrWTA0/UFwGRCWBnS4DV9gpKTqxpLa84mJSX?=
 =?iso-8859-1?Q?eh13/VIQAE/Z1+daCkD7Gf41H4+kBmGp/tCUoFR/JI1uKd7LvyXKk+HUK+?=
 =?iso-8859-1?Q?6EJ5hoiHSfApvhp+jceQoisU/CW+JQHNp/9qr8iWDXjf6KFlp1nQS2yk7y?=
 =?iso-8859-1?Q?c5ucPnwB8NmTv6pMq4hPxZgdv6gLbKw4fpaVYpzNkU0aF/CYup2zoiSn4P?=
 =?iso-8859-1?Q?w3DeiLaogDCQDT3sM0ONgbQ+OfbX53wE8lcAjpgwZeeZYTUaVhRzvsJjfi?=
 =?iso-8859-1?Q?+L8Jzm6g5QL6OOHfnIBGpGsmw6hSBSoBZYMf21YE7W8r3sUZ2eAadbpOgu?=
 =?iso-8859-1?Q?+DUMZzJrGvh1TMWtrj7mXWSW1P807kFNVMRQFzSD1PGMKFOMwsGP3UwX46?=
 =?iso-8859-1?Q?bjZQXYFRQIm8svKs2kHRxbf822uycpfgR/SeUngI+ruu/9+vPA/lkTGG9S?=
 =?iso-8859-1?Q?qBUZq3OKwpq5N7ok?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b3P0g8OA4v72CkShEcjXzZXURX+uN7DjhtP2/KyDQWG4wnuQc/gH6/00jH?=
 =?iso-8859-1?Q?23zozoiSXpQ6y7nT3ulfP4K11IFWIEfdDNpk82r6XBV2/o1U6CNEqMPpyZ?=
 =?iso-8859-1?Q?/5MKDF12jZhDPMcqZraPrImkpuI/+FKHnBBRaWxi+Hk85mUVbwQV4v2lbz?=
 =?iso-8859-1?Q?xdVVkM5OpIDcCczEiGMRc/cSY+tmNFDKglPhHlls98FAI0kwt3KpyvbPoa?=
 =?iso-8859-1?Q?myYuBialAXl1npTZ09oZeNmQj6p17j+vCgimUapupufQ1s+uml9JaHcp3X?=
 =?iso-8859-1?Q?1UyKJ/UxVePxBbGeGc/Lpagd1R6o2yitmLUo0o+nkXLLjHBCHy9oitUm4N?=
 =?iso-8859-1?Q?P/lJNt5FEjsbgGGGsnvyIIVekqs7e9BVihsSsVQt3Sj/XYGL5MwHSqT7P1?=
 =?iso-8859-1?Q?/K+dx0PuAeZjCu9evf2+CXwr42XTVsX+vuQzadoxFFb7r7tJ7rsLeYod9K?=
 =?iso-8859-1?Q?d8E9yTfljrAWNTolmg91AzkFh/qXnKZUdB20QxyJHKlDS/ksKCCjUocj+S?=
 =?iso-8859-1?Q?Y7CLuq3ey/gYwCNUEbEh7jlE0nWKJkpMaOdJu84dTwtT0nkz1lJ6lmOrew?=
 =?iso-8859-1?Q?47FUFsj21c58G5fbo2NbSBUPyK00Uzom2WKNLN+o6ihrLE/8CPYbl/KeBZ?=
 =?iso-8859-1?Q?3FJbSnjXvhq6nTjqXHkkepycAPohLbgQb9AlDlbRPmZbmjYBa5qljXwfJx?=
 =?iso-8859-1?Q?DvmFRBWyK5JzRnKk72NbgsBUjdwMMH/FqBKnKBWUN2cAzF9tsXuPVQSOQs?=
 =?iso-8859-1?Q?Y0IdPrbPluaPF7ettiROciwGG4tr8hYP0EpjseSZjO8JYHC85MXuzpW4GP?=
 =?iso-8859-1?Q?gZSOenal9InPoAH1cFsvUh3726mG8ALHM4CweL9UbdYPKjjcEUMgOMR2dj?=
 =?iso-8859-1?Q?rhTDdtvGROxcbszYve2k9PQyHd/GsDWKoaUw5X2vRgM6Yf5Tc6k1sKzg0J?=
 =?iso-8859-1?Q?0p67YnfEkDGcYcIcLlrbBuU1mVjM+/WCAkmKsSzhQ4/DRF+HRWecvUEjK7?=
 =?iso-8859-1?Q?snABEGyfv8KWTrgUM37vfsebH3UR1xzpmgZLfL1zDGtQmrvg9owrmx/Bnq?=
 =?iso-8859-1?Q?PAdos240tg19S0HnqomoXwYmsZE8GBZ+DjvcSmWio0xmdqOtSYaGVYaTt9?=
 =?iso-8859-1?Q?s5H6HICRP0fiIvcgf+gvXzn1P+ZGiob+d1mWsaIl1OybjHGea+C9LLPYYj?=
 =?iso-8859-1?Q?daL/GsdS+GAs87aKx+zxAJpGRbLWQDLvXD9b0T/WqSrH+ykSfp7Wd+tsHu?=
 =?iso-8859-1?Q?EmZTaNBuamZ1Zpz0t14Oif+pSCZxp/hM8WP5+E2+KhUCwoWBqRA4TGgK4n?=
 =?iso-8859-1?Q?FiabChtdEv1pX4iDyUBgocM3yBtlCRoBevE8eSOdcYQKRxZeDS835dnd6p?=
 =?iso-8859-1?Q?ckkiyWkHiNYxUWrB2a1jTQNoYsZAX9AW0Eje1fZHgw7IBAi9LYDzwuuAFh?=
 =?iso-8859-1?Q?oWIKLEaHRDh4KRuSJbKPz0mlDgptxRedXLK8Nv2C7+ecWFRF2BoI2aTG0m?=
 =?iso-8859-1?Q?f45W1THkj96DvsnATdoOvhHD2rJGhNdqu0+BDsZ61EB9bmjn2kdOrcPuxL?=
 =?iso-8859-1?Q?7WLDiUnV0t9iMDJZ/9y2BrsaGQqz9Xnbbe1lcCmjyWk2Agu5vbvsCvw58A?=
 =?iso-8859-1?Q?OQ+FY2yx7wV3rKffvQ0jdb5qpF1JB5sT/kdXdMLVD7VwzKnrQQAPdRjg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 801e0955-11c0-488d-6375-08ddaa5b604e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 09:19:19.1845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGsLJaXAp1098e4s+VDXidVKH33nKUiPR7oyg/wvV5vA7/H/hhWItlS9O3RR56XvERSG8C3BHuPE/PvLYelarg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
X-OriginatorOrg: intel.com


Hello,

we reported
"[tip:locking/futex] [futex]  b04b8f3032:  perf-bench-futex.ops/s 3.9% regression"
in
https://lore.kernel.org/all/202505191048.c1220460-lkp@intel.com/

now the commit is in mainline. we rebuild the kernels and rerun the tests, still
see the similar regression. report again FYI.


kernel test robot noticed a 4.1% regression of perf-bench-futex.ops/s on:


commit: b04b8f3032aae6121303bfa324c768faba032242 ("futex: Introduce futex_q_lockptr_lock()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      f09079bd04a924c72d555cd97942d5f8d7eca98c]
[still regression on linux-next/master b27cc623e01be9de1580eaa913508b237a7a9673]

testcase: perf-bench-futex
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	runtime: 300s
	nr_task: 100%
	test: hash
	shared: shared
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506131635.f3240923-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250613/202506131635.f3240923-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/shared/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/300s/shared/lkp-srf-2sp2/hash/perf-bench-futex

commit: 
  fe00e88d21 ("futex: Decrease the waiter count before the unlock operation")
  b04b8f3032 ("futex: Introduce futex_q_lockptr_lock()")

fe00e88d217a7bf7 b04b8f3032aae6121303bfa324c 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   2390532            -4.1%    2293415        perf-bench-futex.ops/s
      6999            -4.7%       6669        perf-bench-futex.time.user_time
     18413 ±  4%     -19.3%      14855 ±  2%  perf-c2c.DRAM.remote
    102464 ±  3%     -15.0%      87089 ±  4%  perf-c2c.HITM.local
     18212 ±  4%     -19.4%      14683 ±  2%  perf-c2c.HITM.remote
    120676 ±  3%     -15.7%     101772 ±  4%  perf-c2c.HITM.total
      0.39            +1.9%       0.39        perf-stat.i.MPKI
  9.27e+10            -4.0%  8.894e+10        perf-stat.i.branch-instructions
 2.175e+08            -4.1%  2.086e+08        perf-stat.i.cache-misses
  5.28e+08            -4.2%   5.06e+08        perf-stat.i.cache-references
      1.09            +6.3%       1.16        perf-stat.i.cpi
      2810            +4.3%       2931        perf-stat.i.cycles-between-cache-misses
 5.633e+11            -5.9%  5.299e+11        perf-stat.i.instructions
      0.92            -5.9%       0.87        perf-stat.i.ipc
      0.39            +1.9%       0.39        perf-stat.overall.MPKI
      1.09            +6.3%       1.15        perf-stat.overall.cpi
      2811            +4.3%       2932        perf-stat.overall.cycles-between-cache-misses
      0.92            -5.9%       0.87        perf-stat.overall.ipc
 9.239e+10            -4.0%  8.865e+10        perf-stat.ps.branch-instructions
 2.168e+08            -4.1%  2.079e+08        perf-stat.ps.cache-misses
 5.263e+08            -4.2%  5.043e+08        perf-stat.ps.cache-references
 5.614e+11            -5.9%  5.282e+11        perf-stat.ps.instructions
  1.69e+14            -6.0%  1.589e+14        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418F92F1FE2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751250861; cv=fail; b=jE6bewsH6YAhHGhDdvvRZvE/xd61zC8sNS/hrBiLHnng52U4+et8ShrfGgNypYq1QHZnprAhSl3Gdhles8IuOy6wm3DZenWliSnb13exGKfXaAysMLk32qVqwxkH6nkhksCRBBbjMI+Sd2ku3ZvUzQtKS1goy4IMhqHPSqo9BzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751250861; c=relaxed/simple;
	bh=cQZ8zN1Q7YTjpmr+as7nI0WYVW/DEenb1pjozfou4pk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FTETf8730n6SQEKda6nq0yg92QfDPxb8JxvGo2yJlyWKihXp0ohLhhpf9nG8PnLrFosH+/t1iAlB8MGZtOLm+b9l5Os5h8nqFyd1ky8fP9VX5SURRxTN3gb6G2IUgYlxxaNxmDprq6NddUtwMidvNuIDW0ZFZ1Nz05aFsBLTtI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJ6s7yIL; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJ6s7yIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751250859; x=1782786859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQZ8zN1Q7YTjpmr+as7nI0WYVW/DEenb1pjozfou4pk=;
  b=FJ6s7yILWOTPq9MpWjLRYxFs3w34QXqvdNomcCecALmFVmL7qYD6Cstn
   M7JK9jdv9cn8b0cC9WwrwG7dN6z3qZ3Suv9qMikcKRgw99Iso9AhhDjLA
   9GdlTyOHbgiaGKLAY5XCbsU8tu9xO7onRInhbx2hhht/M+WBZ4Qio+47X
   TAhrwbnJs7zPN3p7CjAwR769tLgaqRoXbTeYvPvg6lBntSQBtlKXnpq0E
   519e2ISMS3vk0xMW+jSFosjm/SP5yWVIRbiKNKQZ1iApj/HY09FrjzWvr
   4VvZwuhu9w3Cw3hC9VLSd8QIVvyEj6MwGOt+/8prfk7A4PFVXOP6uLUIs
   Q==;
X-CSE-ConnectionGUID: WeOF7x/LS3yd7UROekGj6g==
X-CSE-MsgGUID: L6I0Nh5aQ9ueCdpIIurfdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64916323"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="64916323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 19:34:18 -0700
X-CSE-ConnectionGUID: 1fTipF/QSReB/PWuvX1NCg==
X-CSE-MsgGUID: JStYVUR+Rwq8te8010gm4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153631958"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 19:34:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 19:34:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 29 Jun 2025 19:34:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 19:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+dydjadAX8tWBxaLuWVQyFLraMi3OOYaFMF7YoJQIKHckpd466L0A+URK7Sk39IpV+3xFc8SBpBFFAYZhtwtjunAM9T2sHEsUMeBEedMMT+OivWoY4+Sc4bQJ1UxGom/IVbhwtCuKW4vVbxYG6spsdpBpZNwImxx1EmQ2Nr+UTT4htkzC85QYAvdg1QK4Ey2xkcXh25qHharmaIKd4/rpTT9wNujkDu20wLl6yQ/Gg2HfelR/UtCpNu1Xb5j4O1zA8lh/y5+wMx5JN86bbu13boWFjyMXMGXS50K2lgIE0lQlew1dQgQ9+2mrblVNSeOKmh6qrS2z0VdSh5gd2s+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj8BgU/Jwds+ojBXhhc+RGfk7ieJ+S/iYZTu1Vzbhhk=;
 b=gZkMQYrhwPIw0xaMj5l7hsZ37a853fLhpy7m5P1FjOTxAJJdEJ+pO2HZO3gC2lDhVvzwXFMOsHLrRa066YMRfz8SdbyI9zvdMSR+bUwFKFPeoA7v111oBVg5jiPgarBHovAm+6b0XSbzXMRLMsjZ4YZqdFelJyzGwu+gbHgID/vTesN0Yc1I9gIH7SygI/i2c6AJToGJ0eyvMZrp94Zgk+yXbVlAzcn59uJG0EQjB1XlxL0AjjvrK6IyXCW80QARYbphQpR3GDiKNnjyNkXDqmCzWO6cfa0hEf66g811lUgIFU1s8D/LSaW1GnNJ+IXAGast9qi274zPvHAb5Y0tVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Mon, 30 Jun
 2025 02:34:15 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 02:34:15 +0000
Date: Mon, 30 Jun 2025 10:34:05 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Waiman Long <longman@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Marco Elver <elver@google.com>, Boqun Feng
	<boqun.feng@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	<oliver.sang@intel.com>
Subject: [linus:master] [locking/lockdep]  de4b59d652:
 BUG:KASAN:slab-use-after-free_in_raw_spin_lock_irq
Message-ID: <202506300447.102c9e45-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0209.apcprd04.prod.outlook.com
 (2603:1096:4:187::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CYYPR11MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: fb874369-19a7-472a-7cf6-08ddb77e9ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YfQqRFv0sKj5faF3merLXitqiFPb+2E+jp+xG3orJmtMJDnFipyKSulxqj1z?=
 =?us-ascii?Q?ttHW3GyGYT4hF8Ngb4dahSwbAVBuAJ+8+JEYoxl2ypc1ddBcTE9H5bYZmw0U?=
 =?us-ascii?Q?gt7owhAmkpSXtvElzxjyb079NburjDPMwMa4oGeWob7lVsDraQVoZOLIbW2W?=
 =?us-ascii?Q?dNrfUhnLLEQUMBkoxA5mbUTi4wQO4K2g9igb306tOZTvDQzsJt0ZeAmAi8I5?=
 =?us-ascii?Q?v5a+3csTfsHD1UB3i21fomFaVkIKDuaplEYh3W8VWYWL30yDXkXB0O2j/e1C?=
 =?us-ascii?Q?Y5qFdyH21EtRISMKSz4ntDPsI4FdtKhGxAo0xVOcbNWKpMDUvH/10NL6DB0e?=
 =?us-ascii?Q?1fwGZ+Ht1HI2Cw5L+SEjXocxihmfggC/wuyHixH8nlCnoLTgrY96KXxewJ+H?=
 =?us-ascii?Q?EOLf7RL5yXSJTSWExntqXU6mIkongte6xKyHt+mJm3lZLHlNQUZMR+HK/RJs?=
 =?us-ascii?Q?7Ip1PDq2VNieqmyVfL6HgNabSJRjD9ILD/11Il6w9nrcJXRYzPAzpZwQBYrl?=
 =?us-ascii?Q?misEamrkgCE9KPQA+WvEANN27CB/Vwq7ew7Nr6+XOAHBnUuko2NBUWQRhiZ2?=
 =?us-ascii?Q?6sjAPU1tMyJGw52NUg/uMOfo9INIDjIctGq/lp+r3fhzB83iWZRNMemQq22p?=
 =?us-ascii?Q?9tlg8UhC+7dg50eG6eeYJCpuXCm9bmoe9S0+loSIR6znbTkqepYNjnJFTYq9?=
 =?us-ascii?Q?oMdC02aYOr6qP2q0nPHZwlRsWjTMenocHjdw3xorbvvRDCAQs+MLy/G/uu8o?=
 =?us-ascii?Q?eizFMOSRbAG8TGs+wL1WlQZ8qAwg3rlpQxjgmHXZHm9KpXbA4XerCJND+7rb?=
 =?us-ascii?Q?GOGurloRDzZ0l1uH5+5qyaz4D0/fVvIb7LFu4SGKv7KJ6MO2mDwIthZaVk/u?=
 =?us-ascii?Q?9jHGcTGpnC/1IauJAi60E+jx03a1YLfLCIrp/9F6xcN457D9AADK6ZeORMkF?=
 =?us-ascii?Q?uTw+x/UJKSZmbXQkxaCjA6LHEZTvvjuQJ5G567+vWPhhGy9QOapV+hl8XlZ8?=
 =?us-ascii?Q?Y9KRm1t38DTVeVhfNXNCambhQNF3Dj12qsqx+Tg7HJ9ny1O4b3BuJc1s8hq9?=
 =?us-ascii?Q?ccRRmhSX1Sv8x95bi0Ui7derV0SzAdOHqZuKYGQVk7AAN+2tpQrn6M1RCJFt?=
 =?us-ascii?Q?nrIbtZKEtvmnTh48HYs+DwZj65cWXwmo8HGYeuiLLaA4nfMMT735gepfNH4d?=
 =?us-ascii?Q?69HFUhQMDwUflKQOYM9ns97lhKBWh7HuYYcy/PwOeC6yWy6aQ400mwKKZ4Ea?=
 =?us-ascii?Q?we1sdY2qx2r6t0XLYFd5jV196Ens4unrbRfkjvtiLfWBxd0ZNJAWQiB71Lmr?=
 =?us-ascii?Q?WGtlUZ0kz/jiAUsn5SfC6X0bCi9RYmAc0r0eLA8bBktYooRm5GpvY7mcPD8W?=
 =?us-ascii?Q?LaesXn7zrYp3gNd8TGDJ/nC/Jo/P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KC00py80HlUsKGvicZTcsRQU6h1KC6h9yhrDdgXiL9EM2YrrQK/T+v++wTmL?=
 =?us-ascii?Q?wfKE2e5Gb5tIBarQsniSH3JOFOVfEXVobnrWv5Hw6n3mkrR4NYRFtURghwJ9?=
 =?us-ascii?Q?fOG7TQy/hkeHOT3GQt9LQzhWtuvbS+5WWczj60SgRH+LHsdRUtE7GJS5PP4o?=
 =?us-ascii?Q?6XCdBFGCfGNm3JMiBksgVuLhEraVWNFnULLcK4wr8m3rlsq2y3n8uXaiy3fo?=
 =?us-ascii?Q?Dj1y49U+WHcaE3IyxfFelgKAjrt8RA6eB+pXvqAz7xs0y+X1sKEGipZ6ubZB?=
 =?us-ascii?Q?sp81afgihjc96BRG4gds4g8SPtWY2YxbHcsL71Sxyxy0TovgbvUU+TSB9C4t?=
 =?us-ascii?Q?bWYEPAavuiPCN1qEk8V/OgqYkRC6Joi5n3nPt1Iumw6p3L+2HeWjKlX+pQVd?=
 =?us-ascii?Q?Dg99H+uwV5hzzyHbOzV259hCiZvG3EVZonRHvAoGfQ94fOvBUaOiftvgzgAI?=
 =?us-ascii?Q?LAhnCplhEHYDI13tmRvQ9kABnyEJQW0KQXQw7V+0CWVNPjyBtCXSk/TKUwWl?=
 =?us-ascii?Q?d64oJW9SEfNWe0fFyiyuAke+2UfYv84wpouqf24ssqqMOTrV5y9laapTw72R?=
 =?us-ascii?Q?DX+whrkbad48y6zDkLzvotb9UwbdXHwZihlslsUt+7J4mmELYItdMN7KTMD+?=
 =?us-ascii?Q?nS3xYBiUX3tWFQ9HRCaaloBVR0OXkFyitZdb1s+B3OyPKnGuJ7klGK0X6ZuX?=
 =?us-ascii?Q?f0mFM3zEmJsVW/jc+Hbbj4p7bTmV0nkcrRI0Bw75j4WklrdioOqR6z4uh1Cp?=
 =?us-ascii?Q?K/vDlTmhkWo9d47Hh+UHGlJ6VEu93akXP3f9vAhTybdF0nsbkPqnJEhCUGye?=
 =?us-ascii?Q?8zA3SCXsASYIM+W/ZffwV6Yig2IcgrBQCZx8DaF+sOP13Y39fNrbie7cCIvj?=
 =?us-ascii?Q?/3A67RkmHTC5zXPuHlrEVrXV4Pb19wjcUdK7UfqYHwbyTnIm1LzkORugz5Y0?=
 =?us-ascii?Q?uUDmucsaw6yWLUSmbTjgwvuJDU5Dsyg1H7047NK2jvITNnGKtM+q0WngV4K8?=
 =?us-ascii?Q?nFpf6AMPhk8c7K/KGin/p4f411S3rnvkoGBZGtlCqmZDwfnGPIF/eWqHG3Qx?=
 =?us-ascii?Q?nTawvFSLh4K26DoDLHuOhOMxIOFpDKixpYRwzqe3G3qgpb9gUC2NZ/kDAL7s?=
 =?us-ascii?Q?kQx9CsUSvxYY1CYuiDTtF8xiCnPJZnJMXMB+qKd90OR39tezxQ3JDeumeCKr?=
 =?us-ascii?Q?McYx8BzXJw+7/jqZcuVUK97UH9MC79eMLywbOkTipHoM8cqcfzCw/XfobxMr?=
 =?us-ascii?Q?9owLuTIWsS8DppfYEHBmJC12wvaBEako4f12hHGz9aWnPP6iXwBEjYEI138n?=
 =?us-ascii?Q?QuUr3X2QEdas6GDZIJq5rhpHEFYkft8dIzQQIZwN/Fk3PkJP39d4U8OOG1zk?=
 =?us-ascii?Q?2ICQK41LHOxA5hS6icqwkrvl6abq2VNgx5XzgD7fClK3ww1WccAaPAQL1UPZ?=
 =?us-ascii?Q?rxhRl0XSpVg9OdCd/8CpjDa29zUmNBI+8LLvGWfmkBNCBBq6SIv7ix6EYm7/?=
 =?us-ascii?Q?LP0s5ISD1Z/WDlvMeJ7iRYatN6jnkoDkr+xquIG/TyOhkYSghz+fXCFGUmSI?=
 =?us-ascii?Q?0e8DTf+1Q3U1wd9/FnP8UZjbiuk3uB4tWvTNs/G5LMdd2GbKKaXNVpDLchuY?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb874369-19a7-472a-7cf6-08ddb77e9ad2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 02:34:15.5958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMGsRqmA0wPX/YJOTyjg0E8KuSF5xUdaQg4QaF+8vaS2rLKznrv58IJnOHG3IB1tRUFuUoeRggafHvza+hCsQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:slab-use-after-free_in_raw_spin_lock_irq" on:

commit: de4b59d652646cf00cf632174348ca2266099edc ("locking/lockdep: Add kasan_check_byte() check in lock_acquire()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      afa9a6f4f5744d907954f5b708d76c9bffa43234]
[test failed on linux-next/master 2aeda9592360c200085898a258c4754bfe879921]

in testcase: trinity
version: 
with following parameters:

	runtime: 600s


config: x86_64-randconfig-104-20250415
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


the issue does not always happen. 23 times out of 142 runs as below.
parent keeps clean.


ee57ab5a32129f59 de4b59d652646cf00cf63217434
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :142         16%          23:142   dmesg.BUG:KASAN:slab-use-after-free_in_raw_spin_lock_irq


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506300447.102c9e45-lkp@intel.com


[ 154.326222][ T1658] BUG: KASAN: slab-use-after-free in _raw_spin_lock_irq (include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170) 
[  154.327485][ T1658] Read of size 1 at addr ffff888101655868 by task trinity-c3/1658
[  154.328688][ T1658]
[  154.329089][ T1658] CPU: 0 UID: 536870912 PID: 1658 Comm: trinity-c3 Tainted: G                T  6.14.0-rc5-00228-gde4b59d65264 #1
[  154.330915][ T1658] Tainted: [T]=RANDSTRUCT
[  154.331547][ T1658] Call Trace:
[  154.332090][ T1658]  <TASK>
[ 154.332553][ T1658] dump_stack_lvl (lib/dump_stack.c:123) 
[ 154.333291][ T1658] print_address_description+0x8a/0x34b 
[ 154.334384][ T1658] print_report (mm/kasan/report.c:522) 
[ 154.335159][ T1658] ? __virt_addr_valid (arch/x86/mm/physaddr.c:66) 
[ 154.335979][ T1658] ? _raw_spin_lock_irq (include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170) 
[ 154.336775][ T1658] kasan_report (mm/kasan/report.c:636) 
[ 154.337475][ T1658] ? _raw_spin_lock_irq (include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170) 
[ 154.338283][ T1658] ? _raw_spin_lock_irq (include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170) 
[ 154.339112][ T1658] ? __wait_for_common (kernel/sched/completion.c:84 kernel/sched/completion.c:116) 
[ 154.339920][ T1658] __kasan_check_byte (mm/kasan/common.c:561) 
[ 154.340707][ T1658] lock_acquire (include/trace/events/lock.h:24 include/trace/events/lock.h:24 kernel/locking/lockdep.c:5829) 
[ 154.341554][ T1658] ? pci_mmcfg_reserved (kernel/sched/core.c:6646) 
[ 154.342337][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217) 
[ 154.343252][ T1658] ? irq_trace (kernel/trace/trace_irqsoff.c:59 (discriminator 6)) 
[ 154.343968][ T1658] ? write_comp_data (kernel/kcov.c:246) 
[ 154.344741][ T1658] ? usleep_range_state (kernel/time/sleep_timeout.c:62) 
[ 154.345597][ T1658] _raw_spin_lock_irq (include/linux/spinlock_api_smp.h:120 kernel/locking/spinlock.c:170) 
[ 154.346429][ T1658] ? __wait_for_common (kernel/sched/completion.c:84 kernel/sched/completion.c:116) 
[ 154.347266][ T1658] __wait_for_common (kernel/sched/completion.c:84 kernel/sched/completion.c:116) 
[ 154.348111][ T1658] ? _printk (kernel/printk/printk.c:2452) 
[ 154.348825][ T1658] ? out_of_line_wait_on_bit_lock (kernel/sched/completion.c:110) 
[ 154.349775][ T1658] wait_for_completion_state (kernel/sched/completion.c:268) 
[ 154.350731][ T1658] kmod_dup_request_exists_wait (kernel/module/dups.c:210) 
[ 154.351725][ T1658] ? inet_create (net/ipv4/af_inet.c:1382) 
[ 154.352749][ T1658] __request_module (kernel/module/kmod.c:167) 
[ 154.353587][ T1658] ? free_modprobe_argv (kernel/module/kmod.c:132) 
[ 154.354406][ T1658] ? mark_lock (kernel/locking/lockdep.c:4726 (discriminator 3)) 
[ 154.355134][ T1658] ? __lock_acquire (kernel/locking/lockdep.c:5235) 
[ 154.355920][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880) 
[ 154.356711][ T1658] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 154.357535][ T1658] ? local_clock_noinstr (kernel/sched/clock.c:301) 
[ 154.358370][ T1658] ? __lock_release+0xc0/0x16f 
[ 154.358993][ T1658] ? inet_create (net/ipv4/af_inet.c:1382) 
[ 154.359749][ T1658] inet_create (net/ipv4/af_inet.c:1382) 
[ 154.360375][ T1658] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 154.360824][ T1658] inet_create (net/ipv4/af_inet.c:266) 
[ 154.361197][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:878) 
[ 154.361659][ T1658] __sock_create (net/socket.c:1549) 
[ 154.362058][ T1658] __sys_socket_create (net/socket.c:1644) 
[ 154.362599][ T1658] ? sock_create (net/socket.c:1629) 
[ 154.363222][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880) 
[ 154.363796][ T1658] __sys_socket (net/socket.c:1692) 
[ 154.364376][ T1658] __x64_sys_socket (net/socket.c:1702) 
[ 154.364848][ T1658] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
[ 154.365258][ T1658] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4663) 
[ 154.366074][ T1658] ? syscall_exit_to_user_mode (include/linux/entry-common.h:362 kernel/entry/common.c:220) 
[ 154.366845][ T1658] ? do_syscall_64 (arch/x86/entry/common.c:102) 
[ 154.367412][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880) 
[ 154.367834][ T1658] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 154.368274][ T1658] ? local_clock_noinstr (kernel/sched/clock.c:301) 
[ 154.368702][ T1658] ? local_clock (arch/x86/include/asm/preempt.h:84 kernel/sched/clock.c:316) 
[ 154.369074][ T1658] ? __lock_release+0xc0/0x16f 
[ 154.369792][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217) 
[ 154.370652][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217) 
[ 154.371504][ T1658] ? irq_trace (kernel/trace/trace_irqsoff.c:59 (discriminator 6)) 
[ 154.372218][ T1658] ? write_comp_data (kernel/kcov.c:246) 
[ 154.372976][ T1658] ? tracer_hardirqs_on (kernel/trace/trace_irqsoff.c:630) 
[ 154.373837][ T1658] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4663) 
[ 154.374908][ T1658] ? syscall_exit_to_user_mode (include/linux/entry-common.h:362 kernel/entry/common.c:220) 
[ 154.375824][ T1658] ? do_syscall_64 (arch/x86/entry/common.c:102) 
[ 154.376619][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217) 
[ 154.377531][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217) 
[ 154.378445][ T1658] ? irq_trace (kernel/trace/trace_irqsoff.c:59 (discriminator 6)) 
[ 154.379157][ T1658] ? write_comp_data (kernel/kcov.c:246) 
[ 154.379923][ T1658] ? tracer_hardirqs_on (kernel/trace/trace_irqsoff.c:630) 
[ 154.380723][ T1658] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4663) 
[ 154.381723][ T1658] ? syscall_exit_to_user_mode (include/linux/entry-common.h:362 kernel/entry/common.c:220) 
[ 154.382608][ T1658] ? do_syscall_64 (arch/x86/entry/common.c:102) 
[ 154.383220][ T1658] ? rcu_read_unlock (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880) 
[ 154.383811][ T1658] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 154.384524][ T1658] ? local_clock_noinstr (kernel/sched/clock.c:301) 
[ 154.385261][ T1658] ? local_clock (arch/x86/include/asm/preempt.h:84 kernel/sched/clock.c:316) 
[ 154.385979][ T1658] ? __lock_release+0xc0/0x16f 
[ 154.386876][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217) 
[ 154.387784][ T1658] ? __sanitizer_cov_trace_pc (kernel/kcov.c:217) 
[ 154.388666][ T1658] ? irq_trace (kernel/trace/trace_irqsoff.c:59 (discriminator 6)) 
[ 154.389383][ T1658] ? write_comp_data (kernel/kcov.c:246) 
[ 154.390168][ T1658] ? tracer_hardirqs_on (kernel/trace/trace_irqsoff.c:630) 
[ 154.390997][ T1658] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4663) 
[ 154.392108][ T1658] ? syscall_exit_to_user_mode (include/linux/entry-common.h:362 kernel/entry/common.c:220) 
[ 154.393047][ T1658] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538) 
[ 154.393829][ T1658] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538) 
[ 154.394600][ T1658] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538) 
[ 154.395191][ T1658] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538) 
[ 154.395845][ T1658] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[  154.396678][ T1658] RIP: 0033:0x463519
[ 154.397279][ T1658] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db 59 00 00 c3 66 2e 0f 1f 84 00 00 00 00
All code
========
   0:	00 f3                	add    %dh,%bl
   2:	c3                   	ret
   3:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   a:	00 00 00 
   d:	0f 1f 40 00          	nopl   0x0(%rax)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	0f 83 db 59 00 00    	jae    0x5a11
  36:	c3                   	ret
  37:	66                   	data16
  38:	2e                   	cs
  39:	0f                   	.byte 0xf
  3a:	1f                   	(bad)
  3b:	84 00                	test   %al,(%rax)
  3d:	00 00                	add    %al,(%rax)
	...

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	0f 83 db 59 00 00    	jae    0x59e7
   c:	c3                   	ret
   d:	66                   	data16
   e:	2e                   	cs
   f:	0f                   	.byte 0xf
  10:	1f                   	(bad)
  11:	84 00                	test   %al,(%rax)
  13:	00 00                	add    %al,(%rax)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250630/202506300447.102c9e45-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


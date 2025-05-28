Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0B01C8604
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748407849; cv=fail; b=Mf5OzUykKbBJmg83iICfAFhq0OQr6EvU8gP29vVhXgk54T0FpNDTKelA71m/bigggJ+FGcSIx6oC5403vOUdCXDW/elO8aWS5hMKpXwmFcUyCU5dT7SiDzQkpcfU957XdLyqxL75WLejnPI0miQeXCPcWiRYMu/HotwSvKkHw3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748407849; c=relaxed/simple;
	bh=A4jZSMk3r4e5Fv+3DD3aJh1WqS1rFgiqnKs1mZP8vwI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pH1WtvDGGHe8/hORAYjW0L6pAa+7LK9a3EXFKLk0F1leFA96Wi0d6Dk9QQ4YtDUCMZKsYvjNIbyIbeP7+fQuApSpHuU2/Xr3us1jO7C/i7vXXcN8/tMDMn4fOSuMNWvV++u7u3+jBoQmFtN2c20Xgct6bpwFR60UbcvxxJ6YgPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ir64KU9I; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ir64KU9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748407846; x=1779943846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A4jZSMk3r4e5Fv+3DD3aJh1WqS1rFgiqnKs1mZP8vwI=;
  b=ir64KU9Ir7y42bix0UzSbNq+UZRUkAryZsN1HMMUd341wSVz7b+O/pGF
   ZwRXjS5+E7v+w6OjXioamFhi2JeXYC0F66n1DZFuAn9TOz6DZjs8Rrbig
   YP2Do13y92wD6S6JGeeNJG0WXxQ7J6HR3n0YjaQKc1m+Xs/OZIE5KcvpV
   wGdD0DdIy1P5twS4pSDyrEuehg5MTMWdeqhk08k5WG+jupWmVvFVmmtnz
   otC4e3DCgna7CYAS2l2XwrT28b0coMJpCHl22l+aFn7dqiYfAtNOv3bUy
   iSthPAKBluCElE9Lqogrhy48s12XBKSmUL7BlZJzE50Gtp1625LfeWBIm
   w==;
X-CSE-ConnectionGUID: cOZiqS0yTleTMUy8ir0i7A==
X-CSE-MsgGUID: SH+oFL3SQtibFiLgJ5058Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61471865"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61471865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 21:50:46 -0700
X-CSE-ConnectionGUID: RoCzhxsIQmCnz4ajc5gumg==
X-CSE-MsgGUID: 8pezxE/NSgiKpXvh+Pw+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="148399315"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 21:50:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 21:50:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 21:50:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.59)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 21:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVRXvTDUVt29DWVyysyuQxWnDeNMeD6rWZr1KlKHwYIhQvEce/YBKnfrctT4Yxu50xdSmezb2CFO0IPnB0gWLB6sq8aLaTb+8BygOA8GDBDaAlGok3YmtkJ+WhOTmimFKbDEtx7wt8Bc9vYaCEiO4cZ/pbzjMbcRmxOSuGzLJjV6TEaDXpyCEMDkcaKfk9Uu8wxNfCdQUoTCedpfRanCkIHQJbS0A8KhS3tO8V+DXes+H9NhvrUukzxHRoSruJ2xQm+z+mwxLs41rVaMxGP/fNUIMtPmQkQf+h1xyT1Wd0pyi9IIfMJ3RdQSNBYh3N2DWqXCM+k653FlAlXHPF/HWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfAjmPpewRbhguZw0z4e/qGHzN7GFJOTtQLpmqPv+OQ=;
 b=BK3MVPEBZIGDjJTUnacscICYJ5umfFyhXGkWHACGoolRZhUIXmGwGN4LHoBWloyIb4SVnaa7aHIafxmiPXSLptc8QquB4dTSMPAAOLHG/PxGyUcWb+1igQyMYMvrQTneC52jdAQUoP/ILogku2723yK9WyGJc0vrmTFzL3N7TFhDcLOA7IApXNPyY8PdlSfjB2KcJXaIfVYIK0ApRuWubYZxE/avsmUvkAoxFusOPXL+TQf8374kVLXjOQLVY4zOQanv72LcGmwpu8nzXgb8Bezu/9m43eaBoi027kEKSJU1RuMebBCqM7hWmOOdiLJhYaO2szjvDDKXbI+ruzGsgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7186.namprd11.prod.outlook.com (2603:10b6:208:442::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 04:50:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 04:50:37 +0000
Date: Wed, 28 May 2025 12:50:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, <oliver.sang@intel.com>
Subject: [linus:master] [entry]  e43b8bb56e:
 WARNING:at_arch/x86/mm/fault.c:#do_user_addr_fault
Message-ID: <202505281032.80741674-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU2P306CA0060.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 21cd72ef-aec9-4fbd-cdc1-08dd9da33033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UtCllmwQ58ERKCzSvOGdIc+imp6MKqOune2ZhjuxGkE6JIkzt8SZHbVBKSKf?=
 =?us-ascii?Q?iaulRM2Pjn1216BO2J/CC74TiYPqjnwaEiixqIn2ayMijSo0V7MAtZYx2cBe?=
 =?us-ascii?Q?x+F8je7FIish3CJnLOsIaDjucemXHGbytmo9U2yUt7uAaMz0h9QWVye1G3go?=
 =?us-ascii?Q?476Hm8PaW4TFSy1/6bMsjPpW1fwznPgvjjC9AS4GxqCq+CbmWBY6lHXFppsa?=
 =?us-ascii?Q?juGry4qDc7d/D43buiUjImEt9CXKYKWdYbkng6X8V9XuW4wLjMiPMBTWRYBv?=
 =?us-ascii?Q?hash5b8zAhWZSaFhM6tUAjEUNUNKtwC/anSTVWNrkU0PhRmHkiTd51WHqOKK?=
 =?us-ascii?Q?tnZDVvn61cWzJSiqbFY6jM6fqFKde2hqXp7VNorBMlW0hGzkYNLb9EavAP+X?=
 =?us-ascii?Q?wMtX3lqnE5q/UNu3LPwng9v+5On08QvGWviKk/eVhz7XDe1V020AwYp3Mq2W?=
 =?us-ascii?Q?4/G3u3EWR0w8hQwFEWm8CnDaCoN0pzCesBnIMaEfmzXXpVr8j9WHvRkCMhb7?=
 =?us-ascii?Q?pfQm6OdL0Nsc7o9iIObP/nSBZQ5ZqyU/mtob1jj25j1bWjJx3tM/hGIEO7JM?=
 =?us-ascii?Q?1zILxjUQ/b9i+V41c8qiEgcYteCtqouQU2XLDmLfRv7yy/2d9Sc584m8HEOz?=
 =?us-ascii?Q?58Cm0gE5DYYkxMYEp86fPsGPf5AnE7LbzjIz6slZK+rbEZg3OdTTTFjbK4Uc?=
 =?us-ascii?Q?zz89uGOq5O+xgxaaPLeHCn42/sNpQbaZwtLu1lumRCjIjKgwTzZoW6/FDBhC?=
 =?us-ascii?Q?yJLi+89eBGXa95cRLivn61kAVpQRziNtc5slLszwmVonNfVt7S3nTevUvn9t?=
 =?us-ascii?Q?dOVC7ANVq3qZv0qJfBtmIINQ4cKXP4qncSzZ/mORZ+38Q/+Svi7tBwFFWFHV?=
 =?us-ascii?Q?M+02GN/wxg71XJuIFiq4aNqiolTuRTr279YJi5rqhaBfNY82GSyw3m1fl/gB?=
 =?us-ascii?Q?OXPVAa2WME0y4pqvwTfQdnGrF2MryDXf+fnnuT5BnoMryMnepSN/WY2mIYmh?=
 =?us-ascii?Q?8V8p6DB8VpFG5RXsD7NNiyn44xg/K2dHUTPTVBvEXLVOKyWgtqy4Ip6Ga3wA?=
 =?us-ascii?Q?cXs4tMeJ4dkd7wc3dEbymJq2c+IK98bm3PFaYt6wJQkzoqugjxEnC98c6tyN?=
 =?us-ascii?Q?ugqgnzTCdv9QqjP+wRFZmtAtr7CLbijijt2wRbgkHiRy2uov4vgO+1VXmvwG?=
 =?us-ascii?Q?vsjbHe0mgPfMKR2QzZZBHqFeYhPx4+i9Tmhfhy+PdOQjE/QbCkUxY2Pnwlc0?=
 =?us-ascii?Q?3TX7tJgiESinReGt9y558vYWERJgf6mHvilweh9dY18WVOu12/SySejD+1/y?=
 =?us-ascii?Q?d1Fy135wCfh+2VPW6lsMT0dl6GwX7p0RT9sYevC/zXmtzNNOp75tF2DE/9eV?=
 =?us-ascii?Q?xtNkI3ZdB2qSyYt1Xl5thhgTBYoe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9o9XxfVgssYSOZSC50PFUoZvFqhFSGhnWBVE6Z27UKtrknbgVz/6XxWXBUQS?=
 =?us-ascii?Q?VJ9dvqFH0B9D4vEmD3Nwb+FgZbEST3C7ZnGXVlvkSEmPFrjEvQsTBCzSOdT5?=
 =?us-ascii?Q?XKmxV1TMC10kld//DV5xGhC0baRK3ovDCJMs0kGiQQEE8YL4th6Gc8T7f+OD?=
 =?us-ascii?Q?kuGJ46PDRoxGB945MwCwXlkKH9qa60LDSbMxXBY84HI5sO2cBsNjX4gL81KI?=
 =?us-ascii?Q?/khdIwHMyZAtNqR7sszaclFwDnKQqIxuVSVont8cDwg5n6VcoF1pq8tChEs2?=
 =?us-ascii?Q?mqOh4NkpEZx1T7dA5itBWHKlZPAbD+NvAoKc89F1S4OXwDD2+agTyTWXNleC?=
 =?us-ascii?Q?8vb3Cv5sz93PFY6kzxcTMX8bk8B69y6nUQi2egNWtEh6FQi9SLNuBPszcGeN?=
 =?us-ascii?Q?IzrObrzFh5uWRt38Se81p/wgHKgZbvicrZhLiTsRC8z2NgqomfJFZNjdCa8r?=
 =?us-ascii?Q?FN7rCrEOXaTbUW7IZiJ21zKDpaAkI6aUUxGlwD7yHbQWFT1dyb4P5J204CYU?=
 =?us-ascii?Q?5CJFNFmiiDD4p1vxym4lVeghS5CUEMLNqRLldGYj4AythjCxojX5kBRvEq9M?=
 =?us-ascii?Q?ZIdm0aePwXXz1bQR+feL167miN1tNZFsnLe8c4S2ehkhvhozwAiSyivBXkiZ?=
 =?us-ascii?Q?y79MSCWd3QgJBocR/Gyzr2nJ8Yl79hBYXajb7gsRRg+qrPXG40dWmvN5ZlBG?=
 =?us-ascii?Q?7XhDqPQ0ZLNrGYJOGWG90Nfr8SwsO3J0VOAv3snhxhgEV5Ilo80AEYdPcpML?=
 =?us-ascii?Q?a7StZ3Vw1HVi08VysXQvULttah1Iy9GiP1uAy7w4GKoDk+OFPXLZ0BJYz7/F?=
 =?us-ascii?Q?5G9VRKNw/swvClUGFF1XC9vBBJW/znSxmJqV7yetjaE7qtcTfr7qocNTpB9L?=
 =?us-ascii?Q?zT+L3lQw3X+dFT49BeSJ+vElcfzg9QmlIQtgtwKVs6msEDYxrq7H6AOzo2A4?=
 =?us-ascii?Q?ZGfbXZKpK4Ryw4eHjhM4i2lOK+2GDmT9Cb68NXUNCyL4m+b374TkaX5xapQN?=
 =?us-ascii?Q?A2LcI2EQ50dYz8RjYwTfpwv8kQQo/sAKepTQYzUsChNPKP3WAYG+czPjGjOz?=
 =?us-ascii?Q?FZgvmx7oAyQKSgBYxL+xCAROfbNHTaEcA/IGX3Exxp0NtixQfrGwYlsr8ARM?=
 =?us-ascii?Q?t7HBFUEpENWaEN7z2pJi6cfTjoYXz+eiq7DKua8V6y5I7YtiXK9OIC65+Dis?=
 =?us-ascii?Q?6UU4yEEKejc4yMM3fsYxRHelZUvl9uwa/b3VIbMG2JMhrQwyABtODgo0rJ05?=
 =?us-ascii?Q?lDtMyVXfUcNOMv/Yzo9a6Pi5+JmK5NB98Ck6USC5XPpiHW1VLphkzkZgYixq?=
 =?us-ascii?Q?M0i/EoVOGkKqfyYd0KAuE+twzHfRWKkXVxJwZRlL0GgoLsFEVUT2RR1uNzYT?=
 =?us-ascii?Q?U9019TgAC3cB8YtOcIuhaMo4YoR9uS4P8XF2PnTp8FF7ZWy7ZFj85v9j15g2?=
 =?us-ascii?Q?3RDMFPiHK/LEqbTU1h/VgNe1G/QkrBIDcsPd0EvxZfyikAfVibxWeWogPMF/?=
 =?us-ascii?Q?kCET1HxQXnSM8SaROkOUXTppt9/WZAEVypDbwpwMPXp7faDmDIqKoql2gDoO?=
 =?us-ascii?Q?+5l9SFOMINtxQNy+tVE1QiDaMBfEAuCesOOYXkZ3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cd72ef-aec9-4fbd-cdc1-08dd9da33033
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 04:50:37.2413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uD1t0OIrhUuo0jxVASnFXWmKBnYrgEB4BW9v2CFB14qZZy76LPbm5/jG4uyLipbrIkqBLyHOcgC///s0yCCSDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7186
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_arch/x86/mm/fault.c:#do_user_addr_fault" on:

commit: e43b8bb56e537bfc8d9076793091e7679020fc9c ("entry: Inline syscall_exit_to_user_mode()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linux-next/master 176e917e010cb7dcc605f11d2bc33f304292482b]

in testcase: boot

config: i386-randconfig-013-20250522
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------------------------+------------+------------+
|                                                                  | 7ace1602ab | e43b8bb56e |
+------------------------------------------------------------------+------------+------------+
| WARNING:at_arch/x86/mm/fault.c:#do_user_addr_fault               | 0          | 12         |
| EIP:do_user_addr_fault                                           | 0          | 12         |
| EIP:do_int80_syscall_32                                          | 0          | 12         |
| BUG:unable_to_handle_page_fault_for_address                      | 0          | 6          |
| Oops                                                             | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception                         | 0          | 12         |
| BUG:kernel_NULL_pointer_dereference,address                      | 0          | 6          |
+------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505281032.80741674-lkp@intel.com


[   10.101039][   T94] ------------[ cut here ]------------
[ 10.101532][ T94] WARNING: CPU: 1 PID: 94 at arch/x86/mm/fault.c:1277 do_user_addr_fault (kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/mm/fault.c:1277) 
[   10.102357][   T94] Modules linked in:
[   10.102759][   T94] CPU: 1 UID: 0 PID: 94 Comm: (sd-executor) Tainted: G                T   6.15.0-rc4-00004-ge43b8bb56e53 #1 PREEMPT  cb8ad9d0051fab6c2c2b90122348bdb04995c14e
[   10.104048][   T94] Tainted: [T]=RANDSTRUCT
[   10.104443][   T94] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 10.105320][ T94] EIP: do_user_addr_fault (kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/mm/fault.c:1277) 
[ 10.105791][ T94] Code: ff ff 89 f9 89 da ff 75 f0 e8 fa 00 00 00 83 c4 04 e9 03 fe ff ff 89 f9 89 da ff 75 f0 e8 96 c3 f6 ff 83 c4 04 e9 f7 fc ff ff <0f> 0b 89 f9 89 da ff 75 f0 e8 c0 03 00 00 83 c4 04 e9 d9 fd ff ff
All code
========
   0:	ff                   	(bad)
   1:	ff 89 f9 89 da ff    	decl   -0x257607(%rcx)
   7:	75 f0                	jne    0xfffffffffffffff9
   9:	e8 fa 00 00 00       	call   0x108
   e:	83 c4 04             	add    $0x4,%esp
  11:	e9 03 fe ff ff       	jmp    0xfffffffffffffe19
  16:	89 f9                	mov    %edi,%ecx
  18:	89 da                	mov    %ebx,%edx
  1a:	ff 75 f0             	push   -0x10(%rbp)
  1d:	e8 96 c3 f6 ff       	call   0xfffffffffff6c3b8
  22:	83 c4 04             	add    $0x4,%esp
  25:	e9 f7 fc ff ff       	jmp    0xfffffffffffffd21
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	89 f9                	mov    %edi,%ecx
  2e:	89 da                	mov    %ebx,%edx
  30:	ff 75 f0             	push   -0x10(%rbp)
  33:	e8 c0 03 00 00       	call   0x3f8
  38:	83 c4 04             	add    $0x4,%esp
  3b:	e9 d9 fd ff ff       	jmp    0xfffffffffffffe19

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	89 f9                	mov    %edi,%ecx
   4:	89 da                	mov    %ebx,%edx
   6:	ff 75 f0             	push   -0x10(%rbp)
   9:	e8 c0 03 00 00       	call   0x3ce
   e:	83 c4 04             	add    $0x4,%esp
  11:	e9 d9 fd ff ff       	jmp    0xfffffffffffffdef
[   10.106105][   T95] systemd-bless-b (95) used greatest stack depth: 4736 bytes left
[   10.106834][   T94] EAX: 80000000 EBX: 00000000 ECX: 82813c79 EDX: 827cb1c6
[   10.106837][   T94] ESI: 85e2a800 EDI: 85b95b34 EBP: 85b95b10 ESP: 85b95ae8
[   10.106839][   T94] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210046
[   10.106841][   T94] CR0: 80050033 CR2: 0000006a CR3: 05b96000 CR4: 000406b0
[   10.106845][   T94] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   10.111108][   T94] DR6: fffe0ff0 DR7: 00000400
[   10.111532][   T94] Call Trace:
[ 10.111863][ T94] exc_page_fault (kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/include/asm/irqflags.h:19 kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/include/asm/irqflags.h:109 kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/include/asm/irqflags.h:151 kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/mm/fault.c:1488 kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/mm/fault.c:1538) 
[ 10.112275][ T94] ? pvclock_clocksource_read_nowd (kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/mm/fault.c:1493) 
[ 10.112801][ T94] handle_exception (??:?) 
[ 10.113237][ T94] EIP: do_int80_syscall_32 (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/trace/trace_preemptirq.c:73 kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/entry-common.h:218 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/entry/common.c:99 kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/entry-common.h:330 kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/entry-common.h:414 kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/entry-common.h:449 kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/entry/syscall_32.c:262) 
[ 10.113707][ T94] Code: 85 c0 0f 85 a2 01 00 00 e8 a1 bc c1 fe 8b 06 8b 18 f7 c3 1e 30 02 00 0f 84 fa 00 00 00 64 a1 bc 78 22 83 85 c0 74 19 8b 45 00 <8b> 50 04 8b 4e 04 e8 29 0f e1 fe 64 c7 05 bc 78 22 83 00 00 00 00
All code
========
   0:	85 c0                	test   %eax,%eax
   2:	0f 85 a2 01 00 00    	jne    0x1aa
   8:	e8 a1 bc c1 fe       	call   0xfffffffffec1bcae
   d:	8b 06                	mov    (%rsi),%eax
   f:	8b 18                	mov    (%rax),%ebx
  11:	f7 c3 1e 30 02 00    	test   $0x2301e,%ebx
  17:	0f 84 fa 00 00 00    	je     0x117
  1d:	64 a1 bc 78 22 83 85 	movabs %fs:0x1974c085832278bc,%eax
  24:	c0 74 19 
  27:	8b 45 00             	mov    0x0(%rbp),%eax
  2a:*	8b 50 04             	mov    0x4(%rax),%edx		<-- trapping instruction
  2d:	8b 4e 04             	mov    0x4(%rsi),%ecx
  30:	e8 29 0f e1 fe       	call   0xfffffffffee10f5e
  35:	64 c7 05 bc 78 22 83 	movl   $0x0,%fs:-0x7cdd8744(%rip)        # 0xffffffff832278fc
  3c:	00 00 00 00 

Code starting with the faulting instruction
===========================================
   0:	8b 50 04             	mov    0x4(%rax),%edx
   3:	8b 4e 04             	mov    0x4(%rsi),%ecx
   6:	e8 29 0f e1 fe       	call   0xfffffffffee10f34
   b:	64 c7 05 bc 78 22 83 	movl   $0x0,%fs:-0x7cdd8744(%rip)        # 0xffffffff832278d2
  12:	00 00 00 00 
[   10.117058][   T94] EAX: 00000066 EBX: 00000004 ECX: 828d2222 EDX: 82a8d026
[   10.117653][   T94] ESI: 85b95f70 EDI: 85b95fac EBP: 85b95fa4 ESP: 85b95b90
[   10.118267][   T94] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210002
[ 10.118942][ T94] ? inat_get_escape_attribute (kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/lib/inat.c:38) 
[ 10.119431][ T94] ? pvclock_clocksource_read_nowd (kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/mm/fault.c:1493) 
[ 10.119957][ T94] ? pvclock_clocksource_read_nowd (kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/mm/fault.c:1493) 
[ 10.120484][ T94] ? do_int80_syscall_32 (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/trace/trace_preemptirq.c:73 kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/entry-common.h:218 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/entry/common.c:99 kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/entry-common.h:330 kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/entry-common.h:414 kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/entry-common.h:449 kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/entry/syscall_32.c:262) 
[ 10.120954][ T94] ? __lock_acquire (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:4675 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:5189) 
[ 10.121402][ T94] ? __lock_acquire (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:4675 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:5189) 
[ 10.121842][ T94] ? rcu_read_lock_any_held (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/rcu/update.c:388) 
[ 10.122330][ T94] ? find_stack (kbuild/obj/consumer/i386-randconfig-013-20250522/lib/stackdepot.c:552) 
[ 10.122752][ T94] ? __this_cpu_preempt_check (kbuild/obj/consumer/i386-randconfig-013-20250522/lib/smp_processor_id.c:67) 
[ 10.123234][ T94] ? rcu_read_lock_any_held (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/rcu/update.c:386) 
[ 10.123709][ T94] ? __lock_acquire (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:3802 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:3822 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:3877 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:5235) 
[ 10.124153][ T94] ? rcu_read_lock_any_held (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/rcu/update.c:386) 
[ 10.124628][ T94] ? __lock_acquire (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:3802 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:3822 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:3877 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:5235) 
[ 10.125070][ T94] ? rcu_read_lock_any_held (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/rcu/update.c:386) 
[ 10.125548][ T94] ? __lock_acquire (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:3802 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:3822 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:3877 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:5235) 
[ 10.126004][ T94] ? lock_acquire (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:5866) 
[ 10.126424][ T94] ? __this_cpu_preempt_check (kbuild/obj/consumer/i386-randconfig-013-20250522/lib/smp_processor_id.c:67) 
[ 10.126901][ T94] ? local_lock_release.15463 (kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/local_lock_internal.h:54) 
[ 10.127389][ T94] ? __this_cpu_preempt_check (kbuild/obj/consumer/i386-randconfig-013-20250522/lib/smp_processor_id.c:67) 
[ 10.127868][ T94] ? add_mm_rss_vec (kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/rcupdate.h:340) 
[ 10.128295][ T94] ? rcu_lock_release.17856 (kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/rcupdate.h:342) 
[   10.128441][  T101] systemd-hiberna (101) used greatest stack depth: 4608 bytes left
[ 10.128586][ T94] ? do_wp_page (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/rcu/tree_plugin.h:? kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/rcupdate.h:873 kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/pgtable.h:136 kbuild/obj/consumer/i386-randconfig-013-20250522/mm/memory.c:3579 kbuild/obj/consumer/i386-randconfig-013-20250522/mm/memory.c:3939) 
[ 10.129896][ T94] ? lock_acquire (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:5866) 
[ 10.130327][ T94] ? _raw_spin_lock (kbuild/obj/consumer/i386-randconfig-013-20250522/include/linux/spinlock_api_smp.h:133 kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/spinlock.c:154) 
[ 10.130754][ T94] ? handle_mm_fault (kbuild/obj/consumer/i386-randconfig-013-20250522/mm/memory.c:6013 kbuild/obj/consumer/i386-randconfig-013-20250522/mm/memory.c:6140 kbuild/obj/consumer/i386-randconfig-013-20250522/mm/memory.c:6309) 
[ 10.131213][ T94] ? __this_cpu_preempt_check (kbuild/obj/consumer/i386-randconfig-013-20250522/lib/smp_processor_id.c:67) 
[ 10.131693][ T94] ? irqentry_exit (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/entry/common.c:320) 
[ 10.132109][ T94] ? __this_cpu_preempt_check (kbuild/obj/consumer/i386-randconfig-013-20250522/lib/smp_processor_id.c:67) 
[ 10.132583][ T94] ? lockdep_hardirqs_on (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/locking/lockdep.c:4473) 
[ 10.133046][ T94] ? irqentry_exit_to_user_mode (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/entry/common.c:187) 
[ 10.133542][ T94] ? entry_INT80_32 (??:?) 
[ 10.133986][ T94] ? irqentry_exit (kbuild/obj/consumer/i386-randconfig-013-20250522/kernel/entry/common.c:320) 
[ 10.134408][ T94] ? exc_page_fault (kbuild/obj/consumer/i386-randconfig-013-20250522/arch/x86/mm/fault.c:1542) 
[ 10.134835][ T94] entry_INT80_32 (??:?) 
[   10.135261][   T94] EIP: 0x77fcf092
[ 10.135614][ T94] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250528/202505281032.80741674-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


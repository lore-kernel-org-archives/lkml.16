Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240EA26AF6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891041; cv=fail; b=oqMOdGRDvHsyULJDw7QJ5rO2/alHpaN78ZZN+nKg1ofnx3FhGy/2G3NZpSJdcuI9kSS4Jh8GwMuGme0eEKxLE7VJLfNsUSgC2Z8lZbPw0i8Kg2qBvSniMVRrn/f2vQ9FoWAmxkbX1rQZdW8XucS/vCNMkQ7JkiHdh1DmT2DEwag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891041; c=relaxed/simple;
	bh=jBk92mXfCatgeRCqjFkBr9cY+yeMp2X7kmKTsVuPgzk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nOKz1q+wsUTWIp5mxq97yHuT/PcRydJTssNlfBWnFxjy/IoHRl+7cWwsGYGlTvQo73YvwAjPtGUv2SgtFXTpns9UOV7XYpCniIXglahGWTX/4V+h6cBDxnB7pVMxsh8UY0+x5QO1x/JYOGNwV0RfJbF1tG2bA30x6zXbIvfvLeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cI6KXDBe; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cI6KXDBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745891039; x=1777427039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBk92mXfCatgeRCqjFkBr9cY+yeMp2X7kmKTsVuPgzk=;
  b=cI6KXDBey5j562y9tX6oghpmXwwM8YCmx/ANl6IhbLq83ZOoBNaanN0m
   +27TXUJMyIXM7SOVysxypO0SkOZ3GuvaKpCJ7e+kjSuf8Se10jHx6Cvri
   zZ240YWALT4FFMb6kccXQq69n5yGtds8QQO0c3VSc4B7iyVmqQO21kSGG
   +Fx225Y5uLsEUG7dJn/vxfRSP7rponSe09Ah94Y+tIhtBvsdtrDLjaJIZ
   SACIk3GMHlMdKgIY3pVTGbI+7nC5358iiwUsGBR5m8mtsVv5cS4FXxLBM
   dFXJ/21eiCMyeUE7pOUMQznQ7mImNntavcMRH9GQOl5oJhLfTRzL/fs0/
   A==;
X-CSE-ConnectionGUID: XtYa5dq2SQqeidhKt0Q60Q==
X-CSE-MsgGUID: PzDUy/KgSqaQ+OqvA9YU/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47592150"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="47592150"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:43:59 -0700
X-CSE-ConnectionGUID: Z9DbEBIDTwOSeJxdEgGMqA==
X-CSE-MsgGUID: JE0wFRx/SvGm/UNzPKpAag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="134001376"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:43:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 18:43:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 18:43:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 18:43:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sE+TS4xW/zBWc6waJEF6y/cnsIoCC8sv75bVQdd218jYfkjt1LkURIDbfJKpU0o2EOARcz1+ado5qo+dDlQ1wNN/Gq1/Y53a4E07T6BvegMVA4V+e9eHOeWxyD5Agw2OjK86FCcwhaVWPcxpMGrUHZt9ZceZKeMbs8/l7pSMrfblGQgazmNjbBg3NjGDstiC85icZHE+iccui4U7WF8fgWU3uo8LCq9wkZC022V7JvsCLBx2J1OGyNg0iHg+BED0m2cOQqrGbYySd9mPveLvTirBvJIgMtc9OsrkKP+Uufh5g15gjn362dAj4tksFC8NrriaS9ZhnYPa5KDBU+oSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBBnsGpqhUxJJHjk7OmlABFcUjNbEdpquY42jVa+5C4=;
 b=RuYKfj55dsWRVw6yzCUfbzbt7JEwaZ7np+CC2FSNwmxWWZ2Z1pYwXtu5DfGCvDL1hgNUepjGh+J3K0g9LeMggwBduYGlsbks066zHoAgnm8owUgdSFxZP1XDntgOc3GMacLrJ5cALCGiGQk/rY5GJThupQDTD928LOGyKLbZ8XQtXAHaB3J5WGs7kc993aTUEwLDaOFzLs0ZMu/mmvar1KygOdku4wkZbNf6hi+TW/OPYYsQbZDVgdw0zysBnYkLT/SED1A5KrdrYUPCoOIxAlxhE6mI/EEJ/5XWoh6g/YhepS2p5ttcBaNW7N3o7V7mJ4fjxUfW9i8lrk3QeFqWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by IA4PR11MB9082.namprd11.prod.outlook.com (2603:10b6:208:56a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 01:43:49 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 01:43:49 +0000
Date: Tue, 29 Apr 2025 09:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Aryabhatta Dey <aryabhattadey35@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Rob
 Herring (Arm)" <robh@kernel.org>
Subject: arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct):
 '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <aBAuzecrsz+nV3Jc@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|IA4PR11MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: 65bd72b4-058f-4fbf-7be3-08dd86bf49a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ptSDtlC+TwRy6pgO8NCMVDzFIljPHPzR+C/I4IIg6msTRORUazJf2v1Ca/NG?=
 =?us-ascii?Q?Qwymz2CFY0VIkDkMpv1iu1KmwMFUov9gSaxh1QF6mD0bTSZ7llUAuVpha8za?=
 =?us-ascii?Q?CbObwjIlR1DuEfsxM0A+rjflTpCFokSxT4Civmhlik6EKmKHn99TAS4yvs/W?=
 =?us-ascii?Q?ZIfkD1wOawG4V4TEpfJrU3+cAZwElaAjsa+VEwWwXxxTVOHHaSGH/cB5jyjb?=
 =?us-ascii?Q?ovwnT0lP0KqbExZ7bKkwBbEr1kMtSJuf5Au2L5XiQ026AdkxVQ90zMTOXoD7?=
 =?us-ascii?Q?GDXAlAl5BzJSaRO2h9KHEpP7HMgM2uV9uf6Za8uerrxLm1vRY8I6z6Buh69/?=
 =?us-ascii?Q?nK3WvBqImW6tUrymlKeQ/+chwYw6MsCw3bOw8z3BvKHamjWnLhc88QvcBSZd?=
 =?us-ascii?Q?URP1MhAPxvfhPo/9xcRJKS5GSCn1ff8SJzWEtrs2eXtzXpsCB/yK53JMWEWr?=
 =?us-ascii?Q?mnrs8dCjIfty1bo9y+ph2DSpVIY0cI5w2JxZdUw9+o6KPUGbQcmM1pXOc8IV?=
 =?us-ascii?Q?x+dLwiOiGDatvcjNS1M9zcP/hHhfoapQmRQVfG+g3IhjwDUwyJOmtkwteO+n?=
 =?us-ascii?Q?C1EUZa99UjO/J9UQAuAVZhJbU20dG92bYhMSSwBrfUmVcCo9qeFSm2zpJ2fg?=
 =?us-ascii?Q?kvdC3cexlqrnGhVtpDODlyk6cnHKzo0XxXcD+MBhH0JTx8g9VoY4mwLvYzlq?=
 =?us-ascii?Q?wMbKtDc+t3WIp25cyE/zPxxDbT69iMy7SJbozaK3o+DIFIbcjCbmxuVslh9H?=
 =?us-ascii?Q?Vu+AAR6WhSf/zpF5coCadzVkPoKMa9mhlnxkmGNSuPM7dOvvxwjCWmUIMaNr?=
 =?us-ascii?Q?GK6bUNb+Gm3OaCdi5dNRPVe+Ig+aYfQzCK1OSrf9sZIMNQWi0Xy/QRZvIhPp?=
 =?us-ascii?Q?rv5Ap4NGs+m3Zvw6VsHOLd1ONa6MXonnFpftqEMxSP85OCdqZkheuapvjRzC?=
 =?us-ascii?Q?LFCiT5W2nMlPYWd/00WwoDLn/v7QskhKafy+T6PJ/VTE7CFh1aSxvHfmcWXH?=
 =?us-ascii?Q?Lfh9wRCC+DMYetjhaMRYNG7p3IUuJg3LQqthmK+BrWdr20fQ90xQ6hrctgsf?=
 =?us-ascii?Q?f2GiCnLGG/BwJtlCK0YBmqbPcWwR3H/uHUctfFHdupRa4eIjBnXslmax06Ty?=
 =?us-ascii?Q?Uob0nKwQvtI9UY7PN27EJsJAIiVS88dY92Sq6M9GruR7sj/L84Hr6+soTDY6?=
 =?us-ascii?Q?gtP5IYpvJJiP2O016n9umAN9ANLNIrBaayCdk8eQgBRJbBsZz8EgSqhuvuxn?=
 =?us-ascii?Q?h/2zSe6fVtBnWbI7q7OsyrosseLvhe07B0Lu70dq/rEQjP3VDPfIyGd93iG7?=
 =?us-ascii?Q?WKnpqz12xAcAqgWtdUHZMf8fD3jBRicufJHyX/oxW3Ft4AKgsstPF55IyOMa?=
 =?us-ascii?Q?b2e+tByHOQd3619KJmCTL+zhelAp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uhOhEeQgmxSk5qDCgKUPnmD0vb4OqcLD4AopbzyW7M82fRVE/ECCbbGVZCvP?=
 =?us-ascii?Q?KvYc8tRMm3nPeN9ZPnx/R2/nRS/Nyd9j6pgAL8hY2Q3v2Rg2OCn3L+6JHUeY?=
 =?us-ascii?Q?51EBll+OOhyuHQZgGp8qp9CGkWRtRBfpz0hxgh6T8jNNzuxSR8gOr+CXXIPn?=
 =?us-ascii?Q?pWgxBe9iHBDKgAsQtmRaIMeyjx3r5unP52thqsl/YsPBlElIZ0JwUvvQ1QG0?=
 =?us-ascii?Q?FJqrzaF4pQPcH5z/2amrM0I2o4URE11/Tw1ESuVfoo6U0/b1r6KCCsSwIs0W?=
 =?us-ascii?Q?AgPiHABXklh0OB7/aE5hwx3DY6VdoR34QHuw2pOLUF+aWN9XoeVhx5yoGYdR?=
 =?us-ascii?Q?12Gfn7bvTXsEzCskGK4dU8LRLfizmSiWLokzhipkcHhLiQILtVgkKEoqqDDd?=
 =?us-ascii?Q?b3C+rZRQHBvW+rsmv4R5uXqKFTz8SoFnGIzeyqzlnistFn6Mbbzf4k6jTjCL?=
 =?us-ascii?Q?wVRVejlQyXoumU1QXJvthiDGs6hemB61Azm41di7IUUY9PgoTikkB/3upNRr?=
 =?us-ascii?Q?kQvIxpJASYG21D+IHs7X6Swm8vdp3VC02WItlVelaifLp+GP5lfP6dRjLYlu?=
 =?us-ascii?Q?lTa5LHHOtgRPqoinPS76WnuKwkmhYPKJ1KUEwWVsqtuhb1OoO+GDSQ0L1FBV?=
 =?us-ascii?Q?rBKbEMUAs9rnVRz4nCZ9DX48AzFFQeFwYznTLBZVcegrFRCEvB6LWlFqeO4B?=
 =?us-ascii?Q?56biZAIeGzwKy9MDT/SUbz591VSQO2IdT9gdtIwc6zDmohsj5zjwGO0z2dcz?=
 =?us-ascii?Q?QveGx8vPY0A1l10AIZ3n4rcmmRS5R9XUcvIkBV0Unc5IbQboRlDS4NB3EStG?=
 =?us-ascii?Q?Y320//11UHjeIZaP27gyGtxFFTCoX3X/35U1my6278re3GRr41IF7Q2m1+ew?=
 =?us-ascii?Q?WJ03RwkYdzciSoKhvw49OqmAl+gnGvqUcgORVt3uQXnJ+Wn3clueBUCOdEUM?=
 =?us-ascii?Q?0Z5muL9QX+L/B3RDguz3kpEpL7CTOqicMDXFw7KW8OpL5oI6tp3TIZ9vRqMg?=
 =?us-ascii?Q?nWJ4dUJH/im38CXt+UGf2VbSnGvwmhrTrgnEOzZue5aG6+rMH/FJSOfpdmZY?=
 =?us-ascii?Q?S7Dmt6H9rMgScLx7WpweR9TrWmFhjrkQQ8N4dIAom1VFkYwNJ9HSH/yoedkq?=
 =?us-ascii?Q?M9xK/Wh2GMVj74IFVG0bQtIPygpWi2SSbuM7DFlHH+hRurrMDM83usyq2cT8?=
 =?us-ascii?Q?KwwnaawUR5R0IWMdMewXNl9Oe5+CNuLbKALRYYs8NRJeP6ws9tDos8pUWVgE?=
 =?us-ascii?Q?S4J+Q4FuLOQcw4SYf5XvGs3cmMD70jGA7dReAyAyAQrucba30wYMnG9E9lE+?=
 =?us-ascii?Q?w7+M0b1Zb3AWLwIi/YHa9TQa1VqkVs4skx8/SRc5b1MVZKN3WoWn8xw3nTQq?=
 =?us-ascii?Q?98J0/MrL6i0KZh15nxyR5qYvOZ+NvHvpgFvzEZonc6E6Xa05+eL1giLbFVnu?=
 =?us-ascii?Q?Da04heSp4+xyOBVwxKfgWCYQIUsZMP/974MZmpcnICxgn5KXGw4AGlmpBlui?=
 =?us-ascii?Q?7qwcO3V1lrN4shlrieiGY8eOEb0hYFnyOd7qUFcsxKkIpneiv5xFs8N2pbVQ?=
 =?us-ascii?Q?gUvhKXAD1hIo3WcuMdHI2o1vmtPvqMoP1UVM6mEjuHLIls0PTA3qC5rIQuv+?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65bd72b4-058f-4fbf-7be3-08dd86bf49a6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 01:43:49.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEJEnvF2KuSSPUdYSlT6j8+uvpyDsZX0rxsAklNItrhorIxYxUSfX+Ulsv6ufkE4SQXYvfckte5cRWe8D06ieA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9082
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f15d97df5afae16f40ecef942031235d1c6ba14f
commit: 4b989e6e1a4fd726271fac589782ac1f4cb6bf55 dt-bindings: arc: convert archs-pct.txt to yaml
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: arc-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290418.Kr0nDiQx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290418.Kr0nDiQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504290418.Kr0nDiQx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
   arch/arc/boot/dts/axs103.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/axs103.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: usb@40000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: usb@40000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/haps_hs_idu.dtb: /fpga/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   arch/arc/boot/dts/hsdk.dts:201.34-205.5: Warning (simple_bus_reg): /soc/dmac-gpu-cfg-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dtb: /: failed to match any schema with compatible: ['snps,hsdk']
   arch/arc/boot/dts/hsdk.dtb: / (snps,hsdk): memory@80000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/hsdk.dtb: /idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
>> arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/hsdk.dtb: /timer: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/hsdk.dtb: /gfrc: failed to match any schema with compatible: ['snps,archs-timer-gfrc']
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gpu-cfg-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): dmac-core-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): mmcclk-biu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gmacclk: 'ranges' is a required property
--
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/core-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/core-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


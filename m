Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61841C8609
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891066; cv=fail; b=nl+KZtNtC7VvPKbTJPnSZJJI0yF8H5N3XY/fnOxioNgJPGFovrbww2JIIoBQN97HGjva99wuH3+zeCv6zN+LAp+lQn04AJ+xbG4kbOY7bWWxvDPj3ujVZSsvrSMtoprbikSFEgQCLRFukT4s5wQFx8eg/NzKIsbW3dwi//QKA+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891066; c=relaxed/simple;
	bh=Pa3ftsvkIIXGIleCopVLG1HHl44MsYZaCt6vmkp2+rs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=l96G82w8O89OUEWNvHIkb0iLkhHDu542bC2Goio4A0OAQQS2gar1sYxPROLih5k2ec0VhyembWO6xq8hk2Hj/gwOWrTEHBdRKoNt70bWrzOUESQFk/PG7Ftn/fbgzEbzwN7RSPC8CEMeO7dGaFXX0wp2luFwLr09JlUKmZrh32Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8soURTC; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8soURTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745891065; x=1777427065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pa3ftsvkIIXGIleCopVLG1HHl44MsYZaCt6vmkp2+rs=;
  b=k8soURTCOK46ARQEvqk5V1RWzidaqjPU+uh0VBZCK0435gBIYG+uohXy
   R7X5jHsAzNqXygDWgrCbqsemehxuqRYZQonYq3LZZmIfN7ZjQaUX2o+Sq
   IzCVwCagEeYWFGm9BfXmC+btEbcobWN34StjuDAGzmhxmJgpS1zDxOVtk
   4+fjaM35tlB0AQ7JLFBhpw/r2uzzbUUZXmmbcjoi2yw5nsLAb3hAq/EV1
   sURTb+j2EUqJbACWdQ0RDuC9MQYNvECoEvZUCsN3o0FDNI6DeXT7dQ5wZ
   ZRcpwh/WZqT09Cf7zgDepdsYCmSuTf+HnF1t80LL+uC2b5IXc25IkMJ7z
   g==;
X-CSE-ConnectionGUID: R8WgpiP5TxCyhrJlz1eQ3Q==
X-CSE-MsgGUID: qq8Axuk6R9WIACjOcJWijw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47592208"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="47592208"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:44:24 -0700
X-CSE-ConnectionGUID: x+35hq9QQYeZwJ+7IuZDfg==
X-CSE-MsgGUID: A7MlSPOrTu+tF7+4Y3GCxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="134001532"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:44:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 18:44:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 18:44:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 18:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asT783XfAbjKqkQI9796Fj8OjDsqe/QgkGQN1Jz3Tjb5Brrvw/wA1NE109ALZ8X4q1JwCu6clneAq6wTV3MfoIP+dzQLXojriV4nl2dwQSYN4O8FykTCKJ2ujih8epbYWydSW+dgLwtt96HXp5Z6aIllDp0Qe719/D1NBu2QaKOLEmfpPz5gWuJifarXaGOr0S3zypd5Kv8obM9NtjWQG46PMmNOPjRWKzRUK9MF/d3f+cAjd/MxXCyjT5d9iJg79HH8QkdnBEyd5d4/E+CsMJuHX2bJxtcD/uk+cDkTzeL1D0sgcVu0mswnZFQVWSm7D4c2AD1u+6dbpMqMA05CRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/bKhGZdpVSBFm/R0f0n3Bh7Xd7HJxaresf1HK7jFlI=;
 b=qfHfXBFbGNHkns/Ma+pHF5uX3JSeNlmjsj5EcO3FCS6OJ7qtq6ym9tAdPHJk8n/D5KO7MAmg1PNqNhlB49DOIUqlKFgjDPAHMaEHaQ2Ot5hhOZunTQpvhCB/opeKpWzfc96Th6lBvss9C0RjrhK3JMePsn3wVI/bWL8v493WzJSv1siDFQXP87Z+6TOQx3UqlvsOc9dI4xjwyGlWJSDFcePPf32oQpK7hJWc15KN4RDFW3KtYgKpxFyV9RXS3ADH5luIX445Fai5soAcnP/GhcaLGHfMGqOXFVctFgpNCF+sKO2qS1BWT+o1UtBFP4SzR7YSddsK+RBoWWYaV2beMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 01:44:21 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 01:44:21 +0000
Date: Tue, 29 Apr 2025 09:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>
Subject: arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000
 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests'
 was unexpected)
Message-ID: <aBAu7S1hNikzS4as@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: 6baf963d-3611-4c0d-cb64-08dd86bf5cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b6tfFk8tmCjpoA0n6MvIGMXtoIM4J0Ls8i6cq/A/u30WprBA6FGZm77Ln8vb?=
 =?us-ascii?Q?lo6/9/rCsNLHPGisgD36rQfKkYfmlFIc8elJaKDIvBcInCaXVQVtJxHbe07i?=
 =?us-ascii?Q?Ot0w/q4ETBdNaFNlrNHOENmQlXaHvNLLETC7TR3qhaP9sUitX5IJNtezEZ8P?=
 =?us-ascii?Q?h3ajKR3kyMremm+VgXZpuzdwsewIgU/9HRnMUuWjvvXjjSF1QU8QatMRznAj?=
 =?us-ascii?Q?K4mUjCDIy6RQ6vRWKwJ7GEdv9YcwLLk7n6yegc1DIhY1DP1c3QAkMd6mnBL2?=
 =?us-ascii?Q?NOwbHyFCvWgHblugk8z+HIzgFU3SVXUbcDh/NpyTQaIjSvFck0YxrnSEmT5I?=
 =?us-ascii?Q?xlvhRp1SnVKBUVpMTF+Yj5JNYVGUQZtnoB9gNsTeJp53O+cOWWGJoS+oPzaj?=
 =?us-ascii?Q?Ks9OxIsKEht3QT3LCgAsKp3Pvadx72FG2ggugXXjY9jLmn9C20LZ61aSWaUr?=
 =?us-ascii?Q?it6oHTgfd1dsrTN6K3pBUWEGMjcJHFRUsPYmrWUCdfxkSOxe8XBuy+SaZh+M?=
 =?us-ascii?Q?sHX39R8P0YdTrccwYrMy8Wzl74+WI3uRo8teAD9x/N9W+bzrVhozgS6ovtQ2?=
 =?us-ascii?Q?sWoocXP9QMdvKQtlM96HRCwxHGQYmFtD2+KpGp1oMQ0NZVJ3sd46wGGNlU41?=
 =?us-ascii?Q?o6Z11XD3wdwWOwUt0jBh6AX80sSuBlSpKLQihNOYju0/4xZTuDlRMrHu4Tg5?=
 =?us-ascii?Q?HIidsrIZbBFY5tdTQGBZAmgeNL5JrfHkDFHNTmRRTokI2EjwkwTbY25EwgUO?=
 =?us-ascii?Q?bY8wGTm9rWfa88vUZAjLIPw/2QE6cxfWyyFxk/6YYak9adQoECM0BLoNErly?=
 =?us-ascii?Q?N+WyIQuF7N3ZVO8/fhKpejUOdudwSxpy082lpxsF3MuM8VcSHmVGdKgCCW9D?=
 =?us-ascii?Q?pgzLFcJJskKW28EoZSZx76XhElzznDlMfYUr5FaWY/wKDba3E/sSj1tzc2lf?=
 =?us-ascii?Q?5cBENW1NSPVWqrWjPWbaLR5lMThixeWeL5d85ZbHdOPtkSZl/ELraymio+GG?=
 =?us-ascii?Q?+ZyghLyEL2rE8v4AYLSoYvuL1taLL5EoyKZxA3d62dFbCxFP1Ir7+jq3L75Z?=
 =?us-ascii?Q?HiqyGIvUImHddNOGQGQ8kInMlTTNwDnYzGMu2TAX07PuwcyzYpA73r706XXt?=
 =?us-ascii?Q?CEmtdxHw8btu2nHQFpy+zlBOyt2CNN27DVUhRkJ0pV2AOXrBuIH05IJWz2bB?=
 =?us-ascii?Q?/X15L+DPI9zdfdTNs0qMSi08Y9mdWt3JBbhFNL0z4GY+wyl8XFzlyVw1WAPv?=
 =?us-ascii?Q?+DzFm+2KHG+ZQt023HfKD75bVuhOFYfGQaoNFlg1eT032mkYdJaI9EutW85a?=
 =?us-ascii?Q?mNIFvoz0EklFhAvdX7rYTVJEzCBhrrUIv9ojuXHQQVbqaneag5Oa1W3w9UL8?=
 =?us-ascii?Q?YxZC/J9OA4CGswitDJW7WLryz/aDukjFKogqX/pYWHnhaPWaLk8BIEfYYraP?=
 =?us-ascii?Q?a2xZVDI9oZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?spVGtazC92kULmn45lbnBr0ZU0gn69qjwNJWZtvemB33Uz2J5nxZ8ewfdA1y?=
 =?us-ascii?Q?djPxztcvHbjyy8nsykna5Kfd18rocXegp7QntMEQ2qt3MaO2cZZq2FYldOzZ?=
 =?us-ascii?Q?P480w9xIQsjk4/OarCKpOQPZsGQsnXtp9irTfImHaC7J7l4n6pnz0bSe6jnG?=
 =?us-ascii?Q?prDMf/OxXlSWbT7ZgLfi6w9Dh9+2/kIEIxRT35sTBr0ZlWO39xDDClDaJEWW?=
 =?us-ascii?Q?OXtwi31jLhpR6PYuCYAiZ9mBGE81MSmi4JXFNgphCgxtiuxPiXybgtNJtcIr?=
 =?us-ascii?Q?ZDmKvFZasr6N/NSuE8mlzYjvYnyz7MurxoLhXspv/ntDL2rCec4NMbsHArCC?=
 =?us-ascii?Q?/vthJQ156ridVpfBAktC4YZzAvaXqs9T3haOrUdWllMu8bt0cCy1NnYgn1BG?=
 =?us-ascii?Q?zwnClBkz7kIYT5lJIcUVYciQFydgDEx69AUNRBDdEY35UbYBbJHlHOj8Ehte?=
 =?us-ascii?Q?uKtI6t/3Rq2XQwWIpjVUIpnJzx8n8a1dxyHbkiCCpbTaZAB8ysVYCgjS36GP?=
 =?us-ascii?Q?mOLs2C/+Y71W8Spx4dtH6LWxc+gyF/OFmY4CGmc9gCl1eJAgXWDP2Otf92qv?=
 =?us-ascii?Q?/Wl/pD0y+YJ5GnlvqHTRbEGmzyp23RAoFOH76SvX9A+Ov6gXKMGgLi2GMIfS?=
 =?us-ascii?Q?e6L5fCzDXoTiNFYkUmjbdOAeIxUHyyg8u+nS34R0UG7QSHw53TBocrXoo8iF?=
 =?us-ascii?Q?OHRMhWMcofY5OqK5+Ip/jIbFLm3/4dZW90UN3qbTi/HdjXufNNPWiuCpj+CQ?=
 =?us-ascii?Q?qn9eIczmkz0nJNbhfrhduPZr9dfFzP5VZcaxWgUbEK84aR+ZhyLuyJ6uSVam?=
 =?us-ascii?Q?YyKA8fMY6wMSb5oGm4XaLZOhlYSbeRhP6d0pRMeaIC6qtpIad0hFpr9MTLST?=
 =?us-ascii?Q?YG3rILvWdPMagW7G0CO92TARSrzlVRr6BJ3p44D8U3F1kMXgb1P7KhXi0J6n?=
 =?us-ascii?Q?ygj/+OdtTV0IQ6vTehUXrYtIoEyRMxln59BauJED+oPNbJe46a0hJifXon7O?=
 =?us-ascii?Q?7vW4IKqTk+eLuNQU5wenq7+eu5mlQKSvADSl3EUcTpvC6ZZnUcdcXaRUkaSk?=
 =?us-ascii?Q?gpLGYenjg3ybrN+JNjYCLmilkxxfb0IMgAQ0I2v8J6ySkKQCdE7qokn9B5dM?=
 =?us-ascii?Q?x68Jy7zciQrcKgRXBBwdEP7aS/CGTzZXpdN8r2XV/pKoLi+2zm19aT4FuXJ5?=
 =?us-ascii?Q?NndCxrxW8Nc6OOl+iyXhipZqDbmX+hWlc6/T/X2LUpVvSJV0B4pBZopRBqfw?=
 =?us-ascii?Q?7PyIS3KKBmi/cM8x03c2SgfbI3W7HGgWf7725GfJqa3tGUK4ENxxI6kS5UCO?=
 =?us-ascii?Q?Nnd0BcK1tDXOW3CnlQQy2Cdeq5uP0i/TTF7a/tNs2FjOzbFBtj4ueu85FDeU?=
 =?us-ascii?Q?E5D6y35QsHhlOSO1XVclZGbzhJZabDoYdj0WqAHUjKib2MMgSwBNKHrvvPAh?=
 =?us-ascii?Q?Pd5yedZeOUViw45edEjDEhKMqqd2NHl5RY2zApoMSPR3bN7sQB/8b4HNQ0ni?=
 =?us-ascii?Q?c/lhtVGurLhNkEDDFd3he9ke8PeONRxohmuGiSFLnkneIWCoFR1Hen55emlf?=
 =?us-ascii?Q?RFWnXDg8SBOhxMsf1eenv5Wn8fDATlAmXD7dZReKc3kt9FU5eNbDHij2i26G?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baf963d-3611-4c0d-cb64-08dd86bf5cbd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 01:44:21.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38TzeKpOVVK0rz4ICQFurnVb93P+2Fg3+xEwBsH9TJBLipenJIdlb7gFU3GXw60OCJYWgwXg5Di35jYjb9U4Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4432656b36e5cc1d50a1f2dc15357543add530e
commit: 7eccb5a5b224be42431c8087c9c9e016636ff3b5 dt-bindings: dma: snps,dma-spear1340: Fix data{-,_}width schema
date:   1 year, 1 month ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 1 month ago
config: arc-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290257.inzVvTju-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290257.inzVvTju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504290257.inzVvTju-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/interrupt-controller: failed to match any schema with compatible: ['snps,arc700-intc']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/pic@fe002000: failed to match any schema with compatible: ['abilis,tb10x-ictl']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-stream-proc: failed to match any schema with compatible: ['abilis,tb100-streamproc']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff300000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff307000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff30e000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff312000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-wfb@ff319000: failed to match any schema with compatible: ['abilis,tb100-wfb']
--
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/interrupt-controller: failed to match any schema with compatible: ['snps,arc700-intc']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/pic@fe002000: failed to match any schema with compatible: ['abilis,tb10x-ictl']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-stream-proc: failed to match any schema with compatible: ['abilis,tb100-streamproc']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff300000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff307000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff30e000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff312000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-wfb@ff319000: failed to match any schema with compatible: ['abilis,tb100-wfb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


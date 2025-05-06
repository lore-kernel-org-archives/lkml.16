Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0BB30793A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 03:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746502492; cv=fail; b=MGM1VWCWbEC5nSr1FhRqBqK0RcIWYYJlvs9KGzAqG12JV7B+AlQpcH3f21fZVqMrTzNW0nUKgQXwGC3leQAfgGvLdi8MQkKN35TE6pS5DKjWTIY6uEozclo3PIWRoW8dsZxosFo6gxZevGrseIL8xdp4AGBEWpvzusQKIQ+3Igo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746502492; c=relaxed/simple;
	bh=4JdCXual+ktddROF6pxaYoDX0PKmY2t7FjRXVoNUyP8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=I/ZT5eRRbqSUKAiG05CkhVlbgyhhgkkN83herX3a1YCia3ET2gptcybqmAAAccTTYfQSF8P58UOrCoBFo8ViI/3cQkYvLoBcLTbYwHB0GuFGfMpHZ+sxvsyvIb4y4BE60y5PCGBKmrSgC+CB/xfrPRyYTlvigQe4bslGhc9I0rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g57DvnCA; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g57DvnCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746502490; x=1778038490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4JdCXual+ktddROF6pxaYoDX0PKmY2t7FjRXVoNUyP8=;
  b=g57DvnCAlfwYwSvkvgkUru11FZOdGzUevxplZXOGem5jGFs+siUmuHbq
   cBxazULxoDEZX59eLKDF2kxT6OdYL5hV0undawuWcSHjfDxwuylVY92U0
   YREt6ROvjaj60BHKK/oEhZmBGi5ZlNjq7z4MnkqWgrs1Kj4CrJO8cDcQI
   24U5mxPIMGUhF7FmB0aC+MTsi0aE4OC4wEL1I7fyW5Q+DiF/LFVbG90gB
   D8JXMDVBVn71MxwctPO48BtlgROxiwA/+b6fBokR22NHWTiSLR3f7/rkL
   Aruw9PeoNwwwPqQkM4HI/X7xw51a2K0jeNpvm6y9NWWs6vzxB+w+vtKR4
   A==;
X-CSE-ConnectionGUID: I4rXKhz7QZe5jYJlLSdkgg==
X-CSE-MsgGUID: nsw5HtKfTOO2SDY5cAqU6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="51963385"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="51963385"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:34:48 -0700
X-CSE-ConnectionGUID: lveOtD2ySRiWibTPFkzsUQ==
X-CSE-MsgGUID: ZgFk7yP2TAaFu31Dvtvo2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="140604554"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:34:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 20:34:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 20:34:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 20:34:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNy1cbh8+NLclTqXUqlLIZfvi0S6nFtDor61Ykcq2Iq6kQdRSVuFngKWrxoo0fgZAenZI4nwFQUcCSOfoeQkSHBgkOSWTNa/t5G0iuGBe8Wx5JaPc9LKD7eKKs0YOyhBX12Ry4uHCoXcz5FdVSyDgr8HVhxQvemrBxAQrtdrSnIOIa407duHWHQGO9nzln7h6u/LnKCbivTWSRNT4tAtNsnl4NkYtbloTBpYuFzNEAXnk3KtzrfDOHbNMnLrw9qYS+kyNasLUUr0gv1Y2joYRJRJRDvVo5XUrIVRx2u78ffZafygKuiYxOcTAXGjkwHYiYu7puX9ZcsKuVR3rK/ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvkA0l6YDFmXJQDPnReDOrijDNwNdtDxv75aWyxVFy8=;
 b=fzjSYr/K0YKYKeSwAisWIDU349iANVdztR1bcmrYLnySsf/y/Z5HLk4wVPRFcPnMDl8c5HIKkfJv1jKdKUp/a3z7QED5u65XyorceFjx4W9L6DkNEDevHobOzD9hM0gZGGcKCD2FqY3lMu05kiQAhL31o9j3XDrJQR984DAgWQ/vx1WIJKivR+H1rX4m7E2XwqS5wkLbJnhO+m3so+5DyM4l4Y074esCBv0d2EGH9NE783d+VgrpU2vja9AxITWoWZ51vwD4+8UN/tnGaYlYbCNjGmOIaer1f9Yqr4yoLBe+NuuAvDKqIdVHt8HCeojBp9FDrnxxB+wYwJGGC/x1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 03:34:40 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Tue, 6 May 2025
 03:34:40 +0000
Date: Tue, 6 May 2025 11:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000
 (mediatek,mt8188-gce): 'clock-names' is a required property
Message-ID: <aBmDSNx3EB/PJSaU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 087de1c2-18f7-4183-208f-08dd8c4eeec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mJVh6aLTAO30u46f43fMrcIQHFq09+BXJxqUuLEvXuoP7LM6t5iKxKrQdW5K?=
 =?us-ascii?Q?gaNghBK+ueRgArN/AwMdeVN9GsaxmMQhpSJ4PHG/ORvDc5CgMfwgF7tXg1Kn?=
 =?us-ascii?Q?CzXN9Dcm2NOUNKOD6DoR6fz3Q1coJe9uyU36M7+UnipjjUhQH19pMVkC9+Rm?=
 =?us-ascii?Q?cIBXkcArPyw3GCFAxFxnJS9y4tGomX9K5/EqG2AA2DCu/Sp3Wem6dPzsYNvP?=
 =?us-ascii?Q?tNQ+UIeet4eSlPCNbyCAlCMjae3LmlF/dj6f3c4GrRJXD6c3mlXCioFIAuog?=
 =?us-ascii?Q?VhT2qgEBgzKB/x2NfrxwFWPqNrXdyzUaluKhwf1Z/NP/YnByuiVUnRsEepXn?=
 =?us-ascii?Q?CdPWKY19q2ze7fAnWPCphDzZx/12uUviQdfSr9jGDJDOgIWZhhKbNutyW4uA?=
 =?us-ascii?Q?yMOebPaCmtQ98YAQESUqcTPeFyvWmHausr8SCKiosNM0qo3j5jZpnZkqQGeW?=
 =?us-ascii?Q?PEBQEdro8l1lHmhhaFk9OI0yv1OFfbbFvPQ6hGYOhmwqjLNFaoPGQn18aNaJ?=
 =?us-ascii?Q?CHbxXBNI5mEu0o1+LHrQPFTUUx1U8RBlOrNHlB/H+yzZnDF9SDQ4U5CuxuIw?=
 =?us-ascii?Q?hSqQT73bW2VGfApgnC4ew0rNsVcmIaMIGzdX7yXfZ/Am6PsY0c1OHatqG7gU?=
 =?us-ascii?Q?VAd3ivFfKx9B5IBCcaLGeDTPNuiQEB/sQO7hw4Hqh3T4XuH6bHL3rnO5l2jw?=
 =?us-ascii?Q?XRk7yMiI4aNXFskZK3GClKiBYnV2kwX4RlsOd3iQ1sHU693vgpsOa/Rp7yfC?=
 =?us-ascii?Q?3ZW6BLNZI6gTM8optSYYhTzaVlgAH3MNGrWlRI+Bxf/n0R/cfWMwDIbRqGtW?=
 =?us-ascii?Q?XwJzU36LibLC9A3yl0dvmrqjGbbCQu0oHnUBeTcbcqB2/55wASyL6dkKo2xV?=
 =?us-ascii?Q?HRKHKUPQjAR+Ap1yKPp9/JD+VhUWuku7A9TsJzGBKGNGtj5IeRptzitlGDI4?=
 =?us-ascii?Q?4vAMxiYGg1ABpLHSH0LHG/g+ZarV6h5c+mtA7TfifMBA35XQJLI+u5Q6373S?=
 =?us-ascii?Q?0bm+zinGQvXSz8HNqVhk/MBS4Qcph4FBOrXUUufqmjDFaWmz8JRVLC5K/hsI?=
 =?us-ascii?Q?kefyRIeFo+6oFr23iJ4gQptTiWYBT5O/GAVymfKszoudDbtGQs9o459Lh5Gz?=
 =?us-ascii?Q?y/JQRTBQt1z2uAzfaDOsr4I4wWvmcDJ9mm12uvVilkmBNxG5dcPJ9UsKlE6t?=
 =?us-ascii?Q?GpvrliY/kGX0b/xZGJYAbrRNRDloKiBfldYDqnMeLQhlHc49DB88iWRGId9D?=
 =?us-ascii?Q?5cuy7LUmZDbj6CZJ9et5pPnVtRa2xCvz55qqewEy7leVD/ocBiZYA7/NvS3K?=
 =?us-ascii?Q?zXPpvzE9Akg4DHdlPhXNEjlW0RxMy+A7ACEkujcbnaaFzm/Vt13AGcUCXSWS?=
 =?us-ascii?Q?9X8PdJaZj52kqeX8YWI9DEzIvIdwy9+pRmkOX1ELzQC/e5MnhYWNdCGe8MdN?=
 =?us-ascii?Q?keMplNAJD0I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x5FwgyylU8ESBJQUecu3sVaVul6g9lXFT5QW0bvl+VAcVcOgci0rLyMPLv+/?=
 =?us-ascii?Q?BlXbDzgYhLDHC3fKl1WBW7K5mdjNnpOj5G5vThXkE90QNQR+d1B1xgpBbBs2?=
 =?us-ascii?Q?ILZwyMzmpd9WohdeThwN6t3EI6zde6vwqnbMrFVvwSSUW4L7jTGrrFXAiUXk?=
 =?us-ascii?Q?h7tewfdOsputQfJHUYxlRTfr/vkdmY7ZZoA31+7ow2aCAMoL5Pbdk+xhbHMQ?=
 =?us-ascii?Q?uJzSCFTnTqSFpe60SOrSM51cgl4GNC2dhZb2b67VDMVZAIYL6/l/QsV6pp6m?=
 =?us-ascii?Q?UBVDYAlMSkb4mKsWWOXZSfpjRo5hmvaoDEZTyfWY/0mIdRw4CfkCxDPMAcLL?=
 =?us-ascii?Q?2tGPCZsPE19GR1HH16cvRIJ3b24TzvBgADUFFHR3fVKk2SWKHgW9VQsb9vW5?=
 =?us-ascii?Q?xFYwTZziCbGuWSDxMZvNCoubeT4heg7smeBnHXmBaXIvFtOu4LoehSSK06Iv?=
 =?us-ascii?Q?kIqBISRlr9XffGH4Rs5LY2MytZxwdFXbE1jlKomCYtsyFcy706vopUePNTa9?=
 =?us-ascii?Q?8LJLohviAiYe4FFMavCnFjDp9LIry+J4ggDHVmh+5+jBHfr8pYjxsVnE7zgI?=
 =?us-ascii?Q?BiquBYaJ876x1yR3TuauYnHHXA+OWHwyahK+3/aWcnN+FG5Bt1OzXhYJcLYU?=
 =?us-ascii?Q?ap7S96Wr+utHNPleZkjyeElASEypVeGlg+kmh2itoo0ICG1aoRe/cJE+L+uv?=
 =?us-ascii?Q?oUtCO7l9wxqdahqNSjqVYyMpiCmX++8WI7bqNR+zWQUdq/AuNlNIyyq6l+WO?=
 =?us-ascii?Q?7WsQ781UQiDLa2T7mCihm8Wg4y2BoIPMC/VOdDFb3wbTYyslHY6C6enRghJN?=
 =?us-ascii?Q?ileEaqy8HsZAQaI5WW7H7PP8+9XLxUagNgjkrZs2Wo/5HUccajGJnOAMJJea?=
 =?us-ascii?Q?VX6kuQjk8XrYbUSWhajNW1002mptYwhGe2e+GEGCcPf6XmNZML9SGoHiImQj?=
 =?us-ascii?Q?ZHamRiblNZow96ZohJEOTjxHNUpbuiTXNC5US3eN7/ryv9DJ8TUCMSaFYkbH?=
 =?us-ascii?Q?VgLxyFvHpW2pN4Z3GDBi20s6vagvjTdZoTChIMMnJqJTLb40ZJK0NJmWzS7v?=
 =?us-ascii?Q?4oaDfYhdMlBkRd5n97aAHKxeekR2sbew+8wP9QgVlyW7xXa5MSd6jH7jNh/5?=
 =?us-ascii?Q?R9yWWpaifya6BJ+iN83VbwxDSiBmyzQpVtHamDmWPR7ngzVkajCehLkCAfbi?=
 =?us-ascii?Q?5EyOfIe2lyPepadyGGG/bXoSD9XWoGXlk8OGHJzGJa3oNfL2jwWW6kgap87E?=
 =?us-ascii?Q?2Vm2+f/k0AvrXL57zoX+/SJi6crecz/Plqvol5SocnlWBmLaoNK0QWsvIyO/?=
 =?us-ascii?Q?sOEcqXNPlsFW+V5lti3U/d0EpSR2xknKJ+3Lub1mTBI5Yl4ifwIepbnwyoE9?=
 =?us-ascii?Q?TjoGcWQyjf4V6hf0B46bmI7i+ZV4jj59EGjV7Xy/vN/l2K8C64v50kxGfjCY?=
 =?us-ascii?Q?0OeYbcX4/8BybmMhguc6fFU8i6PLaFKm51Z7WZfDPjnF+EwDnODVnK1NOwR/?=
 =?us-ascii?Q?PwJHVgannzYUqBPvEEpnGaNVdQVkFQYyV3jOSn+6TC3vFwDHFgTBStUYv2xY?=
 =?us-ascii?Q?S47uanw+Snpyk7/5vi9jV43sreHv7EuJ8Lo+bEKScTRDTTt1boAaLO+WZvJs?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 087de1c2-18f7-4183-208f-08dd8c4eeec7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 03:34:40.1237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbWF8ylmmNX8FR7Uy+svyAyDLcmKdAJ11P1G8D8IvU8HN8d1DYB+s52Px8Rm+Q+LeDsEDe8gPAU9wIeE6prWRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   01f95500a162fca88cefab9ed64ceded5afabc12
commit: 45682a4fffdd9abd6e2df9c5c534d22f2eda94f9 arm64: dts: mediatek: mt8188: Add Global Command Engine mailboxes
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2051-20250429 (https://download.01.org/0day-ci/archive/20250506/202505061054.AL5OvX40-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061054.AL5OvX40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505061054.AL5OvX40-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000 (mediatek,mt8188-vppsys0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


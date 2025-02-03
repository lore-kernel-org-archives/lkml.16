Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128E205503
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591140; cv=fail; b=niED6AqeXQcCggn+B7K83p248kz86wQl+bJ275Tq4RxX4vhAFhSvL4ITMhNcukCWfo47gNestEvBL2rHQaE8g1pa2ZDPlALkkI2FNvZP5WKC51VrtACmZY+yXeK5mNoz/yphh91ycL4E+Qut8wU7xUNHydEbSgXTKqjFDa075Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591140; c=relaxed/simple;
	bh=bBlnFEUaf25RLbjMXMZsY3KhmK7BdLTznOwtA55cMBk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hfgAJKXyA83CDwxOF0rhn0diOUAzSvJiFTsEAe/NLIoZgMOVJmT5U9K2GmZH/XR3SDxgukh5DBxKE76DRI+pvyYhHX5jJnJUICSLLLhZF09d5+2KiI6CpTO3gTTc+dXh0txyEyO4zvmwJx0HwXFmFpczfsgbLrYEqtoQpl1OAfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGUSo08u; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGUSo08u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591139; x=1770127139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bBlnFEUaf25RLbjMXMZsY3KhmK7BdLTznOwtA55cMBk=;
  b=gGUSo08u0j2JyE6d2OuZ2L0f87zO9EVfHuQi51xg7vw2+l9lJaLHiRms
   S0uBkjybbRf57algnEcdHKhj1DA1WZum33qYZMhi/66mKhJRwtXafpbRk
   aYdryCoSXkuOt795QXc9ZKxb+Fw5B3//dF754TvuRfbSyFKx+fGrSg1BL
   858ZNhk1QyQ1tC6iK+TG8RvDa+tbOqJmiTbzAkmgqFtPpxNS0a0qx2ueX
   YwYpwxV4Mp1PZObC3s1b286ixSqDv7Th7KZ2v1T3ssBarDFyjuB8N+yGn
   MKvLnkvf7lZkP/5NC+MSq8HbtlzI1jUjEu5+rTggRQ7gm6ynP2Z6I23Jd
   g==;
X-CSE-ConnectionGUID: m9QwDQ8JSP+4HtVAD+zYug==
X-CSE-MsgGUID: zcVNYXQ9S12eFDhJpS4EKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50471814"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="50471814"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:58:58 -0800
X-CSE-ConnectionGUID: SHFjFThPRoCVX/PqosutTg==
X-CSE-MsgGUID: ZHguwYgeSziUEPBnNBnX1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133540768"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Feb 2025 05:58:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 05:58:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 05:58:57 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 05:58:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rre54j4NnRsy6W4KkJI1iCz5Ca4GUb3z/hTwDxSBCRZfuDo1T+poy+QaKUVUuwegNO2VQME56peVcoXpxlaiGmn117cnx/0AsYJSviYz/sB/d1OoZRRSPRYA3M+2Zg5Gg1sBnMyTx3mz/QsxDtF7rSYhwA9+QpdafYm28E4coyYcMA2bvW8vEthfgA883Ax6qOIuaMoNAziv1y0VUdJ4vZi12Llhsyl8O47z5Sevulcsu9ANZvfAxUups5toqjBs9YsaxQj21GYEJhuYFMhrzCC/L1ntE58wFq+dIqnaWyk3Or7owW8m9bTiwvSMMWRIwOxsrVkICdt36WBEIGGYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6awvaGB/oAyFltYkB5KiadIul5vcFDfLJx7c1tBzNHU=;
 b=TOL+cJNZwOX4yuLgGc/QBLSG6Su6rWFU0Q0/HID8I6VZvySvnpJGFpBjZkc0xJv5VHuJWuvdldjZ9EOl7hl1EmqVhI8/f8Hz/7DUwXqDTdkhpQpHVpLn2Iu0ZWc8F2h9TiwpfG6pLa01LsVHVY/iKxFuMIFKfXxTPeK+j1qX2HVnfCncoZU2CjwIywZ0nmkTKhgDAdcbhXQyZ9oYVB/cSE5sFXhwDmAxvYbpK3vzl5riZiDmg690FWcQurEbBoRq+M+gL0hZWiygUEOxN5te6xDtU/rKFGlQQ1yaRxaliYdeG9RMp7nqgNUTifhAMknboVM59Pi2MBfY9eVTmaAhTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 13:58:54 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 13:58:54 +0000
Date: Mon, 3 Feb 2025 21:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, "Sudeep
 Holla" <sudeep.holla@arm.com>
Subject: arch/arm/boot/dts/arm/integratorap-im-pd1.dts:57.28-64.4: Warning
 (simple_bus_reg): /bus@c0000000/bus@c0000000/clock-uart: missing or empty
 reg/ranges property
Message-ID: <Z6DLlXXwnj6jJsBo@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS0PR11MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f0110b-5a27-4271-4734-08dd445ae548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HWZ60lIs1SuXB+eTcP+goNv+bDx25sZko4w/P6QYTUmsuXNlUzmzl9p7ulg6?=
 =?us-ascii?Q?qzLmolVVhi8ycNDJyBNGWXGgn3wrMYgz0rtpJ4rWk5IZ54HjC//8Jez0KVdS?=
 =?us-ascii?Q?4kXOmTPpfICwCDXG4pAdvIHYkXSzknuvaaFuVLS21od0wI7LMfQhNXzx6pH6?=
 =?us-ascii?Q?cfnRiSHiBMERzifpJiydsOvUdtUJb6FuKtfBLlfWTTJXZ99u4Xx2vJlQyHzH?=
 =?us-ascii?Q?g5NXCD4b3MjVvD12QFdg+O8+7aEU/nv4scfT4eV8GKfue/OdZbrrMj49OyOr?=
 =?us-ascii?Q?vMdXmTR9WMxDouFMF+vuamUBvPs68r5sLSMTd6i+G4MP9NX7xm+JpRCUgSE4?=
 =?us-ascii?Q?gVXZhe1pZlyaTdvHsDmdpzTRffaWPH9RVVAAoFTiSVKhZFzhyQBrjZwGIvL5?=
 =?us-ascii?Q?BmfTseMaEpwCXg1a1uk4e/MmpcVLGyugKMZZ5W5Hek6ffw71qLC8RevPyssH?=
 =?us-ascii?Q?iSsaFWnUyf/yBFayLpmX8B7q+vOgWgzilcqDQ6cZGhTcIR4MNgzGADNp2FX+?=
 =?us-ascii?Q?86uHA5C0hYKvnx34b/y3x2EBy7wI7lkUb3WUfcUdOqhqYRtZfc+NqFc/oPy7?=
 =?us-ascii?Q?AfpLHdT4di90529rbI+UPIlaDbV1wAF3BF6DjFLQq/OiDz3ySY0emE2IyKAy?=
 =?us-ascii?Q?5OAkCDUVGjfq+iztMhpWW8DFl+qOPgHK+sfds3fSySJbNjuehSqfeP8qABRC?=
 =?us-ascii?Q?sGk0Ivkeoc7NyPqeRThRoocDWeCl/9fnHw0cmhNol1mbHi6EOZMANsKuEQ/a?=
 =?us-ascii?Q?y/zxuqjd2tTDR8mE/O0g4lgF+HYoG1FhRuT8dPtuMViZKM8Zd4fcG+4MpMcH?=
 =?us-ascii?Q?p9fHN/yXDLEK/jn8lumRy8WWMCNvKQmYGX/9hGsf1TJKOb6QcwzMX2Jmxuos?=
 =?us-ascii?Q?/fuzLLoHZR+eRuK438RTPLtWA4SnrxSHh7INA+KVZCDAZhoRrgmJuoqzhAZf?=
 =?us-ascii?Q?lmN62LtQbNZpox5ZQbJKUB95q63nDx45kc3IlnDb0DAVc/c2kXw5J76GE1N6?=
 =?us-ascii?Q?i6WhAj0wtXbpzv+m0GvbWH6BKdt0QuRrikEtzbrrMUURplzVB9Y/3M6YT6UQ?=
 =?us-ascii?Q?v7NNQwaqroaGscOyfx7TRzr8QpIQsKOLnQG1oTHx/H+NijzLP2M0+twyuQcy?=
 =?us-ascii?Q?wl34owaD+QShkuMt81LPlhdrNtIrhxHeh82QtBQIFobeV8yX8m5NTXL7TLiD?=
 =?us-ascii?Q?zUVOnsGeKwzzOgLACDL1TLzoE0SEhBv3eq9QpJB6E94G0WCu2tkNQO19UrIw?=
 =?us-ascii?Q?Erp2uZ9d+1nmv87bdL73fXVC1WZw4AcVfRKjIx11/vcr8anwLUoz+eZIMT1L?=
 =?us-ascii?Q?Ql+o1GuktKE2sjUSoSYg4JdhIdKTfQtRhm+MohgWiHWnjHAzqGPs+KjikZ6t?=
 =?us-ascii?Q?8geoX8usy3EmN7pCqgXVvdC5Xvg1xPE8LJ0XhRbsMH3oNRZNbg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4+CXSlwp7+dSyvAhQB7Ph+CXjca4YIZN8TXuG83GR+4kaSrvfeUFFJE0+RPI?=
 =?us-ascii?Q?oztX6AogoWXvcYCQKqLC0H5O6IiOP/Ou+G+F6cidVaVigCWlmMeLivsbA3+h?=
 =?us-ascii?Q?Inx2B+IvXIKZTq38BMNYGsanHKm902mOCrly+XU8xICg++ka2eRpfARJ4ku7?=
 =?us-ascii?Q?0Hyl2KTxfNKkUNRirvCVWGfNMyeFfKPJEuEoQt9l7TdEI7tr79vmKFpKlwiS?=
 =?us-ascii?Q?IYb5c+8wPTnimmY49tOplMKw9S4GuhLCKuKF2XQ6HO5Y9UXZ8nd8WXcS8qSA?=
 =?us-ascii?Q?gYzwtD0vgE3yQZvaBBXydPRHgbtbllVDvhTUqYUCAfOcHQ2Q5kKAvZTXdzzl?=
 =?us-ascii?Q?S3D86MNlpgV323WROQHR314bLHeY7s5OVqjwTcTc/0B0KelhpIeFjM4YI4Wl?=
 =?us-ascii?Q?oGf3MoHeKlLNSgUWb3RKi6B7UyDxQAWS78MCoBnDiTnYINmH4AOKGl85ZFC7?=
 =?us-ascii?Q?K6iVuP8ZDUj0YbN+/tuD91Uh8raqzulRZDhvwqjR3F7T1w5Lr6bdmB7zJXOQ?=
 =?us-ascii?Q?7400V7LxIdcpzNmnERmhT5zUb/D8P3NuRPSeSBDo0XAWanpKvMb9qPHgrQnX?=
 =?us-ascii?Q?QifG4zVItIT4Nrubf3tUAhJXd2xADNvecCdrcaqjEj4ATaW7siCirAnibkPK?=
 =?us-ascii?Q?6Ik7ZImBDsuKS88rTk6GtJ/HiSQWcHMqAAbThGqUQqACwpS0ZtFoizl32bXb?=
 =?us-ascii?Q?8kPI4cRGRFLx6bfNYXmXW4QocZeUF0FB4I9PRJ5XsK3Hwc/hDQP1ahTIz9+J?=
 =?us-ascii?Q?r+MPrGEiYRKemO7KeDklTfmY/b3uyTjgf5UI5WIalnUtAwCK+OIHLb0rq9b0?=
 =?us-ascii?Q?A4Ew/dOCHiJ5rZHJrhmAF0eMoibo0EbxtHDzNcxdvL4DG9ItDSHFfTAo1ooY?=
 =?us-ascii?Q?Ug1UhDJZUILAtep2Tor9zrHoQA/QYOi0+I5fxmmWcUaW3Cs1PcDIiwRl+Xhq?=
 =?us-ascii?Q?ap6gbpQr1NEqK8fHpt1ejXTRvu6WR55IjdQw1qxvrp8d/v4EQ9Wmm2ZutyrL?=
 =?us-ascii?Q?YhExLx8UUNtYE202BFyavX0sR68nt1zazQFH+bTCZIDUPZ1L/ceIyhs2R+N2?=
 =?us-ascii?Q?3cCLG0W2d3ocWb2e3O/WHdEGOVmCV7XuVVibcvBat5VvPAoX91mvF0BrRqVO?=
 =?us-ascii?Q?M2ryaiFKZ8MtpskcTgReum0JcRydFasipOHI+CwTmi1hLB+oYWUGThfgnhWz?=
 =?us-ascii?Q?gz9bS7dQ8a62A/yiV7yqqfFmF95obKEfLP9iXMxqa5LsuAID8bhPpeFwXD4u?=
 =?us-ascii?Q?YVVp238owB7dBXXf51kElnkv2HjR0x1GOstQa9/FiqfpibCz9WsjB8DmYr4O?=
 =?us-ascii?Q?se60xUdxqi+TMkAeUtHwmDOG64eudz1oLYRQnM6MFaBgfhxaUfjTjATL3ipo?=
 =?us-ascii?Q?j29BItVErpgHrXu09k5HTGyAMo6wUCdk+SwrtA6gf716A/Oz1Hl7dgCns/k8?=
 =?us-ascii?Q?sDXbbVZ84NpC5sNLCfUYBqZjskR+qwOOoeZ+eeZc+rbpmLBesLDEKXAOgJqc?=
 =?us-ascii?Q?3v6XETs/9/G2Zauc09vLRUrhJJcsnhtuccyMwKIIgpcxRZJ4Yw5oPjTSbFu0?=
 =?us-ascii?Q?18+qfDLrblvGALLdSYhnAPUpO3+ySiX3M6w92gdx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f0110b-5a27-4271-4734-08dd445ae548
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 13:58:54.6513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9HdJEPLlwo0/y+LcZbNi3ek4M8lI+6CBmQ/ZvbccvW/ABkAO8vZLY+XXoPPiXehC6mse74Vjn6tijVVSWDYEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
X-OriginatorOrg: intel.com

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2014c95afecee3e76ca4a56956a936e23283f05b
commit: 04f08ef291d4b8d76f8d198bf2929ad43b96eecf arm/arm64: dts: arm: Use generic clock and regulator nodenames
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-r011-20220722 (https://download.01.org/0day-ci/archive/20250203/202502031726.8dwUpBHQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031726.8dwUpBHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502031726.8dwUpBHQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:251.3-14: Warning (dma_ranges_format): /bus@c0000000/bus@c0000000/display@1000000:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /bus@c0000000/bus@c0000000 (1)
   arch/arm/boot/dts/arm/integrator.dtsi:10.9-13.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/integratorap.dts:103.9-132.4: Warning (unit_address_vs_reg): /syscon: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:91.12-96.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:97.12-102.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@1: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:103.12-108.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@2: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:109.12-114.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@3: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:115.12-120.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@4: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:121.12-126.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@5: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:253.10-262.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/display@1000000/port@0: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dts:57.28-64.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/clock-uart: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dts:67.26-74.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/clock-ssp: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:77.23-83.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/regulator: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:86.12-127.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/gpio_keys: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:130.9-151.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/bridge: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:153.6-162.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/vga: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:86.12-127.4: Warning (avoid_unnecessary_addr_size): /bus@c0000000/bus@c0000000/gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:253.10-262.5: Warning (graph_child_address): /bus@c0000000/bus@c0000000/display@1000000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +57 arch/arm/boot/dts/arm/integratorap-im-pd1.dts

d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  26  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  27  &lm0 {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  28  	syscon@0 {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  29  		compatible = "arm,im-pd1-syscon", "syscon";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  30  		reg = <0x00000000 0x1000>;
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  31  		ranges;
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  32  		#address-cells = <1>;
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  33  		#size-cells = <1>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  34  
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  35  		vco1: clock-controller@0 {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  36  			compatible = "arm,impd1-vco1";
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  37  			reg = <0x00 0x04>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  38  			#clock-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  39  			lock-offset = <0x08>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  40  			vco-offset = <0x00>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  41  			clocks = <&sysclk>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  42  			clock-output-names = "IM-PD1-VCO1";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  43  		};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  44  
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  45  		vco2: clock-controller@4 {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  46  			compatible = "arm,impd1-vco2";
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  47  			reg = <0x04 0x04>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  48  			#clock-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  49  			lock-offset = <0x08>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  50  			vco-offset = <0x04>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  51  			clocks = <&sysclk>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  52  			clock-output-names = "IM-PD1-VCO2";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  53  		};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  54  	};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  55  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  56  	/* Also used for the Smart Card Interface SCI */
04f08ef291d4b8d arch/arm/boot/dts/arm/integratorap-im-pd1.dts Rob Herring (Arm  2024-06-30 @57) 	impd1_uartclk: clock-uart {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  58  		compatible = "fixed-factor-clock";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  59  		#clock-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  60  		clock-div = <4>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  61  		clock-mult = <1>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  62  		clocks = <&vco2>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  63  		clock-output-names = "VCO2_DIV4";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  64  	};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  65  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  66  	/* For the SSP the clock is divided by 64 */
04f08ef291d4b8d arch/arm/boot/dts/arm/integratorap-im-pd1.dts Rob Herring (Arm  2024-06-30 @67) 	impd1_sspclk: clock-ssp {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  68  		compatible = "fixed-factor-clock";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  69  		#clock-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  70  		clock-div = <64>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  71  		clock-mult = <1>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  72  		clocks = <&vco2>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  73  		clock-output-names = "VCO2_DIV64";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  74  	};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  75  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  76  	/* Fixed regulator for the MMC */
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  77  	impd1_3v3: regulator {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  78  		compatible = "regulator-fixed";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  79  		regulator-name = "3V3";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  80  		regulator-min-microvolt = <3300000>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  81  		regulator-max-microvolt = <3300000>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  82  		regulator-always-on;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  83  	};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  84  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  85  	/* Push buttons on the IM-PD1 */
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  86  	gpio_keys {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  87  		compatible = "gpio-keys";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  88  		#address-cells = <1>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  89  		#size-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  90  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13 @91  		button@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


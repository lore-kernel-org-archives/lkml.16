Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E981D88A6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747865696; cv=fail; b=Puxn9vAxYmZiddPEBNpu/i5lJgITofdIk2mU7KDUg50QCSvhiCujAxXXyJ3yi4KhecsSsaG66jP+xmM1WMQ+QrqdIRtj+I1gzUPVLT8U16KYSHQqmDLV7yuCOvZfW8PtnpMw928PJ4velN2vex64dgkuBiS+ONfhwJrgMaE6yoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747865696; c=relaxed/simple;
	bh=1I7R50Vexar75exO4Z+B8r0wFvdm8aQ2i6ErEW4vKlA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dPF6ijRE5rgSBWZx+ijywBOKhIOnR0GYK1sWufbqMt57qnz7RsoHsoF5DOdj2/hhVRsK2J6MVqLhW+eDXs7On6ptUS+EQ9kKzi7TwzwzNm+0J8FvBpjPC3VAWdww4M1F1miqwwejBE6hoKVpKzhXUMTiDrjYEkqaQix6l3XErgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Anl6YN+6; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Anl6YN+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747865695; x=1779401695;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1I7R50Vexar75exO4Z+B8r0wFvdm8aQ2i6ErEW4vKlA=;
  b=Anl6YN+65ME9TGqeLei1Kw4cO0IsyglkF3uvVqWYyomAeePvhEAeZusA
   /gLECR3kjpAFLyugWpcFoIWCL5mcaRFm29RFMUNQGiasqHqpNmFVr/q+z
   JcjJ2YL5rSVl5tuvyIukkguBixbthED5sU1N10vdiUq2cB+ycThQ0XiKJ
   l0VGtJ0otgrBM+GpzJ62uT/vddrgNNERgfUNtG5uti2AiiM/qAglX8I31
   YDrh6QRYvZVGxx6g85948gdG6TRFb0K03QakW1W2ZkYX5VBOUhtyKDm01
   aoprWPQSZFuqUBVXrq/QfHDYX4wUy4/g7exkbQouSi/N6+shUPprwUGrJ
   Q==;
X-CSE-ConnectionGUID: m9OHBJcVSlGVq/S8Yi0HhQ==
X-CSE-MsgGUID: ADJkVRSvT1GnfzPrhJqbVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60527997"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60527997"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:14:54 -0700
X-CSE-ConnectionGUID: pV91Kwf0R0OQNBZXY/Jw1A==
X-CSE-MsgGUID: /K94a35PRICef81w/ql5FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="171273329"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:14:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 15:14:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 15:14:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 15:14:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCkz1IUqV64ixcY+KIY1zD5Kzeb4UAtlQIB697LUiJMBNnoVuSHV/rM37cT9TbfwavXLffMCNBZVUun5HLt0h07ELqbVm8XIIJOZBu2LZyfURjPGsu0K+sJtDcC3DXEkoRcRc9WWVEXmPGt8iB72YRL6G+T/FDgsagVXf3oAE0NGPnTjfsFG+hS/DPK01dEW/nO51CH0ynq1QlpAREyggSUVONcSkurMoN+4/7U8rBy7FfvzDC5NEL/oizrmO++jPGVL4BXCjvMtm64dqMbyUT9yOScIRK1f99bMPbqHPjnEzl5J1Og4MeEHvJonakgHyfsSqJhwWPeqqiEQ1Lzf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjn5TNSHFgecBsJErdiAnnxujeKRTwKwD711j6pSIlk=;
 b=Lq1NiUXxkDSI81SHXAFi4ir8MbiJ1jb34+BoQDineCOd3M6SYN2debCWStCZeDnqsbXcyYhHRlMiT6wNsFQNhZearUw+camcJ6DjqiV1eY2k5sR/iv2OHCtCQLiBmF/rx02p9DfVyvXwC9vjo/kzzjH7cTevSRxhamfkUvDi8ethKr4wFVZUoMJkx1/7QX4bzc5vCrNoZSPOMu15eVXFtIyn73dD7uUBa6fHx97JksIZMNEv0arQAvLujRGJzW20BmXcmS/3UHj6LS+52rx7/mVJc0sHmKn9Wfao9fQpzsKA6fP7+2l2seVSGijWej0qM8BVPk3rvQRzy6WnO2YYtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 22:14:04 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 22:14:04 +0000
Date: Wed, 21 May 2025 15:14:01 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>
CC: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Nikolay Borisov <nik.borisov@suse.com>,
	<linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook
	<kees@kernel.org>
Subject: Re: [PATCH 3/3] [RFC] x86/devmem: remove low 1MB hack for x86-64
Message-ID: <682e5029e88e0_1626e1008e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250520152030.1499670-1-arnd@kernel.org>
 <20250520152030.1499670-3-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250520152030.1499670-3-arnd@kernel.org>
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 7870ea4b-04e5-4062-4d87-08dd98b4cc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7B0EMsXlWIkojRN7yT9xajDbBPy48Gbl3BPRKNQUXq8XxHQQGZKIBiLi+/zn?=
 =?us-ascii?Q?8iQbg8RsHRvJxFVJbaxcyQ9bXFiYMWu8XbcrtbwvtJUETZsQ0V+2tKqHRyae?=
 =?us-ascii?Q?wbdz21e8c63sB/auoRzwmyzQEJ5Fdz6SajKmlgEB3uoRMLXw+zMo6PfHW+k9?=
 =?us-ascii?Q?Z/+4gYKDHSi56Gv5T5nQBE+7Jjb+3BHnSlFCZ+Cm6ih3J3JaypFNaLq7itUK?=
 =?us-ascii?Q?mdpy529lkoNVtXHP4qb60j1GqR4c1etDrrOKzMYX9GlY+7sOnBCU8cu61iGL?=
 =?us-ascii?Q?MmsKJbAAIYi/gbwfks96yS/+Vsvh5tqM8xrVQkzKJXmE8KBx8q5u1LJxpeS8?=
 =?us-ascii?Q?8nwy0enVukwItdcQlTp5dKyachPIKwkikyMT8sczEC6lp/kE51wQLSMWeEkS?=
 =?us-ascii?Q?MIdto0xHV70Mm2QQuKTLVVk+xFUx2ao54FrT/487hvKjSSJGIrr1pxu05Eq+?=
 =?us-ascii?Q?eC4R9XjGUYRq46tAla3yHaM01xmUYFXA/aCuFiA+stxJmejkha6bZ0/fJUUC?=
 =?us-ascii?Q?iQn9ZFCBEbBSr7SdeUQuvY+sZN8vluYFcwg+zUqpOdHfENflbA7VBa+ShZ14?=
 =?us-ascii?Q?8K+z4zwPHFMKYuu8P3IkmjUnYyINHjrw99mDPFdZnic32gGrjluwWn4peeps?=
 =?us-ascii?Q?m4ihiIfO1RovgSNRQrVhDvVigzr1pK9TJ6LE4PSr9QZo5Iub2alYavOQOaer?=
 =?us-ascii?Q?c+cAhg+AY3zWOmbOi7phWgJ5pqqZnshaLKv+bzX54mJJLr/X4mjcUfE00E/m?=
 =?us-ascii?Q?LZROMVfS/cpNHGLgKe1pZzq4WZm2hTZyIHo0YUf/OzG/cIkv015nvIVlAQBc?=
 =?us-ascii?Q?I8fOn/khlIYyPl5yM1O4BO16LeAlnj37Vy0Eh8DwGEbNeWSN5TsLu+zanwJd?=
 =?us-ascii?Q?l2MR+6DAOemTs31E6bpAeF7v0GMXkY6KZubsOJeyCZ1+5SUHRbDmT2aAD5zs?=
 =?us-ascii?Q?oN5kaYUyeStGEVrqdYDQmAAmojwPcVPH//EvvyUa2JmMtvQPZFJtdxmrlsA7?=
 =?us-ascii?Q?gs4lvuyrPxjuMYsSuchiMMiHYGOCNyz7wxFnQAQc7MyuIcv01bxenMILE36W?=
 =?us-ascii?Q?yxA4BJg8nEXiNpCXhjJxqAi9Ycm6NiNTkAkriYSHYHeC9s/C/EiOQGBqScvB?=
 =?us-ascii?Q?sr0oP+4kd5XX+XEzlYsMAM7WBI204rxbi5UCPR5LO7xFgwC6WVFi3meQUvkk?=
 =?us-ascii?Q?n0YHlCzOgQDsGtfrMWdQQIlj09WQx1fLY1rZPul831TfCQGpIFq3Wiw0JzSU?=
 =?us-ascii?Q?/3u3f0X4MhocmlhJxJChts1Wufc7IjFsPgcni8UHr61lYqAQiKpZSG/h2Yg9?=
 =?us-ascii?Q?OpZabmTKPsaDccBldmoJl0DDpMqkIOBMWbYtkJD6urzka5MSGK/ZvQ3JUYAL?=
 =?us-ascii?Q?S7OjFjk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4b8oeC730ZKkFA87hgxn1YcYSPgNeenNt8j4Sp5x2jIhh922HS3x3p+s2DdD?=
 =?us-ascii?Q?4v3QmqLetg5ns1sPMqZoQe361txL3QbmItBz+7kG1PCR9dJBXU496ntWd0xg?=
 =?us-ascii?Q?mAEXo67YdPX9oo1RuVwuGiXN6VJTiMS2SWvYd8mHbfIq8huINfXbyllNCM2U?=
 =?us-ascii?Q?ncnuJYZEND8foG5/KwTNhsm3XAEbNtcmwsZk+U/VvMmZT1SKoDA1yYwZyHyw?=
 =?us-ascii?Q?5T/Jiy+1tI5hj2tkDW3xecYuwFX8/Q6wzIyoWdwp+LUbkCxQIxpa/+Urv086?=
 =?us-ascii?Q?4atvzoRQXO0QMUSKuIUwhdbAAj0gHxfVxdGBvjRmxE8/Mzl8yYlObCsflAiP?=
 =?us-ascii?Q?bHuZKCeUvjb6yEaIuInHcX6+frSuh6ugEfNhogKqcQZrw4jQhtGWCDwrwa6w?=
 =?us-ascii?Q?FH9h7sVoE/xpaeffX1eWW1SKd+BjUZisCKOz0ukd7O0toKE+5m1hTXbfqkeV?=
 =?us-ascii?Q?nZLAAfST6rSEDUQtz/m+DMXGmp/G4DMNopzSJOVDQV59htMONkqgjs1eCi1u?=
 =?us-ascii?Q?v71IU4j0Asy2t+2erykDX+QOM6oDKQOh41T6IHt8winV0m4YG7R/KJzb0+rU?=
 =?us-ascii?Q?fCFzdeQi3UHAkSuCfvlvGB0v173je+8zaRewjdRk0g0NUlnNpnAX0LAepOpd?=
 =?us-ascii?Q?laZ7IoHlnhIpd8Ik7SXE3Lmb1f9RrD8KxhhnFrupb6aageBU/12mOxCz1xEc?=
 =?us-ascii?Q?EJ5hcd66DCbciA9dgZZrqGSJfOIoREGtQX9Aa4kONW30F9aBF4Gf5Mz706tk?=
 =?us-ascii?Q?66XPt8sFWWZkblSB2dgy2tUoeOWBVcZkxDmnHpR6CKk3i+G1e3Cno+lB2LSO?=
 =?us-ascii?Q?ih2oq5L5aGOHmTF1otN0AEwhK4VdXarpeiMSJLAnTkQAn52wm3T/FPXvDtwB?=
 =?us-ascii?Q?TOpXTqMFW95rQ5H439DXmypV0beD/98CZU3mGG7RzZDB0iruNtHShkcgP1iz?=
 =?us-ascii?Q?rt2n43GQ17QtPPgVzbPohw3faGkVDBzOHFhiOQj/tBdDUk2xqBj7IeDrmFDE?=
 =?us-ascii?Q?dijLAHdRLOYtpOcu7MKlbOMH0wKgeBP0Y7y/plQG+fSPZLDCuDX69jF59PnL?=
 =?us-ascii?Q?l/Dw31vUlVg3/zqfozjOdY0mLwyp3FX+1kL5wgiTWtCAYev3k7+XDu9WwEuc?=
 =?us-ascii?Q?7tOMx4f2Y8/t0+Inkw1t8BO3jFUmWmHeOZqBiutUWxU/Uc5OwRGrcLinleo0?=
 =?us-ascii?Q?xsdBUMGeiRWblzleiOH8qTrOCgpxu1jhowWQfAs9PqJ2THwyPNjr6U7Otl/L?=
 =?us-ascii?Q?AApROBneHMBPXzQv9DwnogS6SmiHi4xUtptguKIPXP2v2jRcRPhyCptEn5wo?=
 =?us-ascii?Q?JetolHAHwyCD29U8JseqiV5jqHmf2vm+KG/p5MPg9eSdwqcXXyPA+sjxEaVb?=
 =?us-ascii?Q?MDwpEG++wYjveHnWmuz+/ndXvh8HVZ9eOvhVVQGzKCPoHzKKoOc3YT9gdsdW?=
 =?us-ascii?Q?hFarHX+oTlgEGwZf/MCtYYZJ0Yd9527xnGBYIe9hlpB3qJSyk0cmhsk1hugl?=
 =?us-ascii?Q?y/NY96ptkU/K/zx7hIEqmy5zW6r6i3A5Wzy0pUCjU+27WRWpU6aRWhyJUngL?=
 =?us-ascii?Q?1+FeJkJg+4xDtKBIEKgb7OXzA8rrmF6DorWZMdONZ/niBadJ1C/55ML+ovoI?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7870ea4b-04e5-4062-4d87-08dd98b4cc11
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 22:14:04.2887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBl7wtEAWccXFbsYUnR1buok52I9LB64HuISKm+t1uxKeU53L+eyEVgJBqE/LKjPTrP2maeoC4n/FdKqM9c5UjUrrer+kJuyiS3pPQxjzQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
X-OriginatorOrg: intel.com

[add Kees]

Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Traditionally, both reading and mapping anything in the low 1MB area is
> allowed on x86, through a series of ugly hacks.  In combination with
> features such as memory encryption, this keeps causing trouble and
> requires building additional hacks on top.
> 
> Chances are that this is only really used for 32-bit machines, as the
> usual users of this were dosemu, svgalib or ancient XFree86 versions,
> none of which should be used on 64-bit kernels any more.
> 
> Remove both the custom devmem_is_allowed() and the custom
> xlate_dev_mem_ptr() on 64-bit kernels, and use the normal implementation
> based on phys_to_virt() instead for read/write access on the linear
> map.
> 
> As a result, this makes x86-64 behave more like the other architecture
> on /dev/mem, allowing read/write access only on actual system RAM and
> only when CONFIG_STRICT_DEVMEM is disabled, while mmap() can be use
> on MMIO pages with the normal restrictions.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Unlike the other two patches in this series, this one is expected to
> change the behavior on x86-64 kernels, which has the risk of
> regressions, but seems worthwhile to me.
> 
> Are there any reasons left for keeping these hacks?

Kees did this search which seems to suggest that there is still code out
there that may not be prepared for a behavior change here:

http://lore.kernel.org/202504101926.0F8FB73@keescook

Maybe those paths fallback to dmi sysfs or other mechanisms for digging through
BIOS data, but I do not think we can know for sure that this removal is
regression free ahead of time.

I would be interested to see though, so:

Acked-by: Dan Williams <dan.j.williams@intel.com>

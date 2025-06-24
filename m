Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4238225BF03
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753813; cv=fail; b=YtCqosbV3bP11MFgy+RtDic2GMqn29dDYNvpd3mreRGQzCQiiGoWFZLYG8uvqWszF02NZe+F2L7LFjAi7S5GP0OQxDxsFPORzyNSFpklHLkFiwxvptr4mGOF3iP0LgrRlvD+VTiFY40hFRRhkUmzE7rP5d6c6UIW8ojrzlpXIlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753813; c=relaxed/simple;
	bh=IeJ+MExwLwbeFpFsRWHw9nrOD1I+aWBE868mbjhbj6g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hxm0VEJd33JviURTi1HcsqZ9TDcX7Ps6ZPFpN/vYhfHm8hmjzroxns2gyh4Wrm3mOgg4wY5VJvWIwkng3g9h9CU3z7LUwhU8dGviMbX8MI4V6SQCABDGpwyTv69LcMBUQYoC2qxpecvux/wazjO+6WvGLJbGeDj5Mez2pUKSimM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXeEFa0o; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXeEFa0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750753812; x=1782289812;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=IeJ+MExwLwbeFpFsRWHw9nrOD1I+aWBE868mbjhbj6g=;
  b=JXeEFa0oYgIMByQfxjWJ++IxWv02OJfWth8SVjgckdQme0LHm8pBCr0t
   LEDuMzoZAEMJnbJtqodkN8yq1NpkOcN6ECkFhqwAdoMPHUiYE72a+qD8Z
   QRWA+0Y55nZSYKCrLeh8+DmOfhvMxcYGtxrRkqUyl1XXxdFNavMXV31+a
   PZNAg3fFemyYfVh8pjXykK1S/2CoJ70NEf0DTdyaEIbzEhDtXzRe7Z5lf
   YGZIQAJ6FQfyZ6ILvYz2k5GGSrReqyZBlD/bokA1Yf3w3kxuFQYTI8xOs
   CrtQvvoVsgo6c3Rq5WLAd/yERQLH2w4DwfQkeZmLtrLeOSTAvshtGOKAh
   A==;
X-CSE-ConnectionGUID: B6tTRQ0wR7aXgb2s9S1xSg==
X-CSE-MsgGUID: xttW2oH7QQWnyR7tViwPiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56765982"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="xz'341?scan'341,208,341";a="56765982"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP; 24 Jun 2025 01:30:11 -0700
X-CSE-ConnectionGUID: U+1HJfaWSo67C39oMceiXw==
X-CSE-MsgGUID: +QkinzucS/CprFPvmwqihA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="xz'341?scan'341,208,341";a="151438091"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 01:30:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 01:30:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 01:30:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.76) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 01:28:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAXpF1oKvzmHZoYXz+mNZjZeMizT4mpXgFh1choDAfwZjD63HqwXF6X8cBWeRQj1U1nDZo0XB8DF5NCVD6EcslqBWFiseh2VhM3M5lF9I/vWMunYD0sDIpOWjAjg+6aNBui9GpDsi+rVVAgI6xrL76aWWzyYyaqxxkeQM3ayNCgw98M9EQq3oGsK+E8izUax/v+Ydvc1M9JjxTTX7RHIZvORtjnyRG1zr6D7G0wNz8zThOoOaC4vANaN3fFNfoQpnpjMjmC+EIWxsGfjXbuIsRmRHTdCMFFvvXb8o7STmJe9IytxT56aqYPEp7KiSRJz0pScnGcE9+k4fCKpke9VwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+64xKy9daq5a83j9rY9fuNS0JzQkXUGVozbj+m45BnY=;
 b=cgCe4h1VczfF5b/sQXRygCkbzqJm23XJU+J8dilUVeKnQiO7/gp34F/2Fs3mONnmrDDEVETmdwrb1PoOn2ScPIcxkmhSI/bCJR3mgT16COAPqvkjaik37Y9qcx1rWz0bQof5FX3JDLi/0WosnDDorc4K6K/mlJbdOaXmSlU2zxxtmQM4ugbPkLhB4pTN7dS9vTytleyElTzaszHJ6iGiOs+pphv5PErvzA7WuYPiBf1CbK+taihxsW9fvtRXlBZFkOx6SJf5gwbLZEEfaU2FS7oeaLUiCOL0bPPd3EnIhpsa+2pr75WO7h18z59HlMlXaEW21cdAJYO+NEXJYIXI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB6016.namprd11.prod.outlook.com (2603:10b6:8:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 08:28:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8857.025; Tue, 24 Jun 2025
 08:28:26 +0000
Date: Tue, 24 Jun 2025 16:28:16 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Waiman Long <longman@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton
	<akpm@linux-foundation.org>, Waiman Long <longman@redhat.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH v3 2/2] debugobjects: Allow object pool refill mostly in
 non-atomic context
Message-ID: <202506201449.f3047c4-lkp@intel.com>
Content-Type: multipart/mixed; boundary="XbAbhgiagXheegF5"
Content-Disposition: inline
In-Reply-To: <20250617053527.1223411-3-longman@redhat.com>
X-ClientProxiedBy: SI1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 3448b528-f370-4d4b-6460-08ddb2f9172d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|4013099003|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uVgwH3FX4uFV2XC4Kg9/4KGEVSZfqMRGYQbb2g47+Q7+X7ywXk0Xp4NzDV0M?=
 =?us-ascii?Q?LryMET6kYrH5yC1zjjXmNr3PZiqOYk9Zg+Pzx/NF37Nm4PI3KfNO7xr7NqGE?=
 =?us-ascii?Q?46nozFeomDdv9ddqjWXSskBnalVQFZ/LZ4VyFPa0j8NY1ZUDVJu8CEp3m6Td?=
 =?us-ascii?Q?rCIO/taslaqPAvDBpbs1svOvdXbYVBNEPgwapgfDfs47Skg4BjhrKycaw1zq?=
 =?us-ascii?Q?xHibVj/t64hK8dKGJj66jVQz4oUTwEDmrym0NT7WOvaStEhAka9lwQMm92rK?=
 =?us-ascii?Q?T/KSbgqS7aUUJ09UAnhZMyBVPb5mEF9wXXyj8HzGqNWseuY27IIWdw6fHgjG?=
 =?us-ascii?Q?FjOhWsfl8ZMgpPW7CWHFyf+NDh6XfRPbRPuzuUdFAidS01xaWFc96YVXjwqb?=
 =?us-ascii?Q?INXBa9q4fLxlNuXhM3iq4OV3yirisOK9mdP8pQUgpMv3lInhsEmwy50yVnNT?=
 =?us-ascii?Q?LB0QSMuiMB6apztcpCaSoWEsXFZJZzyO2P3CVAft7+vyy6f9uScJ38p6y0Jw?=
 =?us-ascii?Q?HQes5N/5PTIpc0WAxXhGA4vjkIcy6XPd55BXuJ+8piBRnMmGierPhPb1+iI2?=
 =?us-ascii?Q?ZgRH+e0Dqx3/rsifgkOcuyIvIT58DT1qyAbY+NfZ5DqrS/l+FfsOgpnBBkcS?=
 =?us-ascii?Q?KZF7dYdfAYdgcAw9N+faL/eNDQ4AxsCbg8Gro7w36gA9cZTaNOEqBG89Rmie?=
 =?us-ascii?Q?RcoPzA9TtDSHkaOyw+cl+7bTZFypAHIjpZXn/nkWiW+oqyumDwI4X1M9eSWe?=
 =?us-ascii?Q?yd9KnPtmZKnRkdm/UeDN/Emm6Mg92FZIJUgj5ohaF2KsJaFA2VYpolnpZRrQ?=
 =?us-ascii?Q?qP8ctGs6Ux7pNaSnQJlJ0XNo9fZ2KmgGNyPSXc5k5gwXKWawERmp67WTAtJt?=
 =?us-ascii?Q?DM1qjuQ/R0EcPxilCcWzuBjlp6inKrbLbD1FylGT4uuxNGGcUR6LxNgTHbm4?=
 =?us-ascii?Q?6eu+i8pGGcG+41xEA8PmWWgpmdfKt+HCzhDYD7CcJ1yIUszKxQFXGZCfLGSU?=
 =?us-ascii?Q?TEJoKYlRapP6oNpYHzoGYJdEzgNXOIfE9lBtw/gYwmhy9GLvfxztphJ347zS?=
 =?us-ascii?Q?4bRKHkMjY7wInBtirTO1WAxTsl/sjSgT5blFVwMRmXlTG5LsVix7TMcBu822?=
 =?us-ascii?Q?Ixx5rG68qcf4ybbZfj4dzgTh7y646wXunouTTdrfEs1cDC7rpbYFqTNoquLo?=
 =?us-ascii?Q?oQLjprj6fHMrrSStTO3rfkkaJ0VxJefuRSTMcBeLzaM+HIL45S2VKS91LRUx?=
 =?us-ascii?Q?SAErqKsOZRntyGe9RVPisowwYdUGiATfqmaPx9U4jKjlwr+5Yfj3KWNTbeie?=
 =?us-ascii?Q?j0pvAI+alspJ3lUVOwct+fxmUch+zTLrRafGGkHEya+m8CNNW+XXoD1hoMkf?=
 =?us-ascii?Q?PpHBVoBlqD7BEqwOqggPuEk8A1oN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(4013099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A0a5mekGqdxZU7nc1rzbzulyvx4H9VkIemUEWI0GM75V5gujLAjfeDlnQao/?=
 =?us-ascii?Q?Z/Sl2csuP4cNJEXe+LkuOzOIkaAvoVaJV1gaCs7V8aXzawIuiBJR+H/TzCjn?=
 =?us-ascii?Q?UVM0hj7MwDPEVhcN9myE2lQuj1SjaNN2SVRlkuXOVVu895ViMkGUmSeejJPF?=
 =?us-ascii?Q?z4+T3St3B8ApRazo8rmZQHXHMGioMwn8OaSte1Zx7DccEdNI9jdWwqoi2CTN?=
 =?us-ascii?Q?qMRPdSngzIlMltyDYZGD2TqUStUFqAFv/ilHBDLwq4yQE/UZLOF727+LbsR3?=
 =?us-ascii?Q?AIM5UZEkJYe71R53V5qTxtJ187IOY7mtbMW01necSonzbxl8GcKIEDWHevWH?=
 =?us-ascii?Q?RYYt6goLZbqS3OcP+G8eGLBtY+FGT0rufxzgg0FnKNbP4wzzFv43DDoHtMYP?=
 =?us-ascii?Q?zz8tGKWb3oRUkv10h0c5Ol4jlF4l5JqGpia9wsvpgTHXX6j5G2rMgKC0YH4I?=
 =?us-ascii?Q?ubk+c0j22c7Gj1LDP/3UK2b863fkKCwT5ztRm2kC6SfDxUN/Du5IZGZlNxu3?=
 =?us-ascii?Q?7TjA0hEgVmPkDVi7BLqbLgoCPiNW1jgNpan4vNSq4qP/xMlGDVC8leBpKAAz?=
 =?us-ascii?Q?u6IImR+rxWuEUXgnkRVZTmE/YG1riZ8tyJdrWP96PrhVHyyGfB/cj9WPp4yb?=
 =?us-ascii?Q?siwaI4ny97sU+ERKUuSXQ6YzipZs2amsZCkEUQxw2CePN3+dLUzvZLInY7qr?=
 =?us-ascii?Q?w2FhJnLBvG4SDI8yoDywBlaYNz201N+blBqHOWRLT616Z+aIDWcf4vkJU7u1?=
 =?us-ascii?Q?rEQEjTpnXmlBpantk8O+QwlUCOEyuux3POas2t8hWLWxhZzp2FI9nG0ToLzc?=
 =?us-ascii?Q?QPlbVPWKqvtz+0kwfb9F6U56R+BmFWgmMZEp9meSuHnB9/V0qWb6ajzaOFZO?=
 =?us-ascii?Q?4mlGQfPCQ2HWAArLUIScce6gGQI6LBqQ3rcjWZvui/VEOEtIaoKMunCbXxRp?=
 =?us-ascii?Q?po3SHgglsexPAhNhn10iJ+hjWQjrgVv8lZK12CifL1yg1rk7N5ykB4aa7B7o?=
 =?us-ascii?Q?oTQYrwA4+iNr4Vb7t8oqZZmfeMTk8ZSPeIx1CDMcY7Pp/kb4YBvFEr4ZVZ74?=
 =?us-ascii?Q?B8Wy5snPld5zppmu6zKjzJH906mPT69rTj5BNbQFFdXlS0EeOskQ5d2TKBIx?=
 =?us-ascii?Q?dt2jfdRNF2W6gNbkHLYl3OMANRW3F/7dvsLZfaxks+GzhPeWosdK2Y4TaGSQ?=
 =?us-ascii?Q?PXuHB9aOZP5nNXzjk0QYE2aknFhkglxB/CZPMq8fz3Z5C+HuEpECRZ3hdqJV?=
 =?us-ascii?Q?rkkRgfX9DHUfp0wLAZ1lOXR70+zbT/Q9Gr3nWFaHy0PAms+bMmzq8Mx78mVL?=
 =?us-ascii?Q?+PEl0zH+7f5RVLxCRqpKPzYcD9T3+rpcQTECogutXVLUla81avcBaTBsorl3?=
 =?us-ascii?Q?wNpTc3RST0ofIkLFzeOfolHTL+LUedbC0o72xZYg18U0UemiSOnLji0m9xRE?=
 =?us-ascii?Q?5rooCz1fdt++3ynXmFZwdi+XjvuBFQB1aLl+sNChsEWLB/azHzLftWA20xuh?=
 =?us-ascii?Q?ionBr1MUUE/xnpV6dlSenpvL0kPcjqX8+ssutUtRyqKKvmgBjupPa6CLRN92?=
 =?us-ascii?Q?uKbHQZrZH0jqk26vniV0SmO5NyJwOsOAYOoS+8qXzr6Va3HBwSPDmAgK+I0O?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3448b528-f370-4d4b-6460-08ddb2f9172d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:28:26.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxAOrXNJNDAAQE0hxhsIzoWgqMsIoCuRsU7vt763bhvpVXR8z1GaXxMChPiBw3wOb0jGejG0JPtzOsjZt5ADSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6016
X-OriginatorOrg: intel.com

--XbAbhgiagXheegF5
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Hello,

we don't have enough knowledge to understand why this patch causes seemingly
auto-reboot in this trinity tests. but the issue is quite persistent.

94d15b49922495cd 81c49454d188c6eb34bb736f432
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :50         100%          50:50    last_state.is_incomplete_run
           :50          98%          50:50    last_state.running

we don't see hint from dmesg uploaded to [1], so we also attached one dmesg
from parent FYI in case we miss anything.


kernel test robot noticed "last_state.running" on:

commit: 81c49454d188c6eb34bb736f432e4b1ef623d70f ("[PATCH v3 2/2] debugobjects: Allow object pool refill mostly in non-atomic context")
url: https://github.com/intel-lab-lkp/linux/commits/Waiman-Long/debugobjects-Show-the-state-of-debug_objects_enabled/20250617-133635
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link: https://lore.kernel.org/all/20250617053527.1223411-3-longman@redhat.com/
patch subject: [PATCH v3 2/2] debugobjects: Allow object pool refill mostly in non-atomic context

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-01
	nr_groups: 5



config: i386-randconfig-004-20250618
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506201449.f3047c4-lkp@intel.com


LKP: ttyS0: 246: Kernel tests: Boot OK!
LKP: ttyS0: 246: HOSTNAME vm-snb, MAC 52:54:00:12:34:56, kernel 6.16.0-rc2-00044-g81c49454d188 1

Poky (Yocto Project Reference Distro) 2.7+snapshot vm-snb /dev/ttyS0

vm-snb login: LKP: ttyS0: 246:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/vm-meta-243/trinity-group-01-5-300s-yocto-i386-minimal-20190520.cgz-i386-randconfig-004-20250618-81c49454d188-20250619-2383740-f5ihl3-14.yaml
[   13.087284][  T290] mkdir: can't create directory '/sys/kernel/debug': Operation not permitted
[   13.087284][  T290] mount: mounting debug on /sys/kernel/debug failed: No such file or directory
[   34.877921][ T3450] UDPLite: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list
[   34.879165][ T3450] trinity-main uses obsolete (PF_INET,SOCK_PACKET)
[   34.931165][ T3450] UDPLite6: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list
[   35.302518][ T3582] VFS: Warning: trinity-c0 using old stat() call. Recompile your binary.
[   35.303816][ T3582] VFS: Warning: trinity-c0 using old stat() call. Recompile your binary.
[   35.307560][ T3585] VFS: Warning: trinity-c3 using old stat() call. Recompile your binary.
[   35.308370][ T3585] VFS: Warning: trinity-c3 using old stat() call. Recompile your binary.
[   35.314526][ T3582] VFS: Warning: trinity-c0 using old stat() call. Recompile your binary.



[1]
The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250620/202506201449.f3047c4-lkp@intel.com


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


--XbAbhgiagXheegF5
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg-94d15b4992.xz"
Content-Transfer-Encoding: base64

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

--XbAbhgiagXheegF5--

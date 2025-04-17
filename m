Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2AE1D6AA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 19:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744917128; cv=fail; b=ukugvSvq6Qg61xFGhULyem7x6edXhGGb7OqmSWeHvBabViaWmw9KlSRCy4wWjIaAZhezsnuX1cpyprkrtwm71dmmzbbUhqXPnCUCnijJlHAe5lrtMvwA6/Aj4NtaK+qlixP4BOewK+bKM334EJTRVcnL+1es0SMh/29XzmzfAps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744917128; c=relaxed/simple;
	bh=od6pVlnVX1gajVqVdpXIePfMKyhvlL759jujUVleOpM=;
	h=Subject:From:To:CC:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ALF/VxJbhpM4RopQr4Jtsl6uRTPiw+YyIRph3PSXqc0yHU5P/SaFs64fUxiGfn617D6L+HtrrvPjmvDIqu3DN5y9fAak5MBuu7mivXfVVV3tHM0Xh2s8YMyXY8cwzlpWbqE/6EAvYTbW8NlfvwPPuwwAa6QcBG5xMVGz+G1hkP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPy+DAe+; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPy+DAe+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744917126; x=1776453126;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=od6pVlnVX1gajVqVdpXIePfMKyhvlL759jujUVleOpM=;
  b=KPy+DAe+EA1eWABLA2Bn/OUa4P7ylvEpOR/TGOHubiKr3rZHk9oy6mmg
   dQ+DnPhccAuYJ2DacuXb8fIx6UGLPePA0+/+tmRTiVGC7Gf9trxJ352Yu
   4jTSdFf4g5JVOUviNsGvOIxN0/bXcaWmIeGiUMjiEQNY5yE13GmRG1BJB
   qieWaDmgOctRKLnxgQnObsy22XhzPxWKoJiRA5oxfj6Ks2f+N4u2SjPIL
   xh2EBiA+hRNLtI52Z7+utfg9gbEB5kyPgFwrK5fM3knqKplTG9GZGYbXP
   h0Hd8x2wRWuXVoggqbrtZMeQAULBEjr9Z1YYSzJJT9am3ZJ2I1GZrlpw7
   A==;
X-CSE-ConnectionGUID: iPORJLNjShm3R0D+sMzXBg==
X-CSE-MsgGUID: ujxz+0jdS3ilOICcHjD6Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46420291"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46420291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 12:12:06 -0700
X-CSE-ConnectionGUID: dbUzMMQ7Ry63bWXOCTfIFw==
X-CSE-MsgGUID: fYuueQdATz2h+4ObODCQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131884478"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 12:12:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 12:12:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 12:12:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 12:12:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJDwNZRNRJv2PJmKjvUFtM4X+CDfeyJC42u3RtJ7XCWp0ckKDrmC98hyHA8JTjg2kepaJH2zx3d6RaQAwTOD1N+EYjH4sIOvlZRv3J8lTD9ZJtr2z93Pn3u+ytuLZ364hBdoQXLluU3hddylx9RBqoZ6iRyLo7PmeLxO6gPmOYOpiObIRXDHWaiuuptdpq+Y+lOdkQqYJcmkXZApO0BJyRoQlpknohbBdaoR8n/a+Eg5nwnK2relGJl43NFruzOgwlWOoPUOEZ9SkedM3C+RN5czRYibEOEVAGEXt6yGv02IYp8H91xIRshm9lwEQaafZXvHoAh0G1oSmVnRMKtg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNYLgp7Lgdn7JXp+jx169YNO4VPLbCEyVBFHvGSgdhA=;
 b=JySGBSI9+anVgSTTxhqGGNHjDE4iVcrS49BJXxcaa6ZUr+YBh1wUhAIoKdPTm209y38Jx9C8goMQALpUYVa4KEbg0FL5u8J7Smgm6xdWfYAhG4aFNNkhev9bKTyi07qHmPrNdQDIGM/g4crmQse8JP/nwiRlCGlcIS4915XPkGCE7rapxFQTbebxBHwNKlpcjHM/c/HCr8T7yiwXzNHDmNpqM77YtMqbNZcIbjdAZoqgYbMUjqN2hTGdfB5nq5ITC258dTpP3+OvpIoAE3XnCjGmhfv2wdkFwfuYNE/33WKDL2jH2Uw7i0lxOHihwp03JEVHgXCHYqtTPbIfdvPGPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 19:12:03 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 19:12:03 +0000
Subject: [PATCH v3 1/2] x86/devmem: Remove duplicate range_is_allowed()
 definition
From: Dan Williams <dan.j.williams@intel.com>
To: <dave.hansen@linux.intel.com>
CC: Ingo Molnar <mingo@kernel.org>, Naveen N Rao <naveen@kernel.org>, "Nikolay
 Borisov" <nik.borisov@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-coco@lists.linux.dev>
Date: Thu, 17 Apr 2025 12:12:00 -0700
Message-ID: <174491712068.1395340.11679806523938235782.stgit@dwillia2-xfh.jf.intel.com>
In-Reply-To: <174491711228.1395340.3647010925173796093.stgit@dwillia2-xfh.jf.intel.com>
References: <174491711228.1395340.3647010925173796093.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:303:2a::16) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: cc60f0f4-1104-41a0-46e5-08dd7de3bc83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SER1Z1BXQXZoczlOVzBXSzRmMWllVDkrcDQ2NkpYSGxkOHRWNHNpU0lmd3dR?=
 =?utf-8?B?TzduUks1Z2JrZnBqWmhBckc4OUhRTlJWbjljN3MvR0gxQzh4QlBxM0ZiSk1E?=
 =?utf-8?B?K3p5cVBENWl5Q2U3ZFlxb2tYSUNJTXU5Yyt5dXZTZktyWTlHU2ErRkJuMXJ2?=
 =?utf-8?B?RzZwZ3NLUVlzL3JDczZ6VkloZ29hS1JNcmFuYU9HU1VFRU84TGNpRndtb29Y?=
 =?utf-8?B?Yzd5K1BjZnF6UDNVRkExN251YlY3MFJqMU9ZSnlDdEVYVHBJNXA0cEl0bWV5?=
 =?utf-8?B?RVdsS295MVg3YlhOSGVyMnI3akROa2pEcEtacjhNQU4wUmQ1SDhVV3NpSEg3?=
 =?utf-8?B?eXRXQlRKQ21OcThmSDBBWnV5TENEZWQweEdHQnlhYytPY3hIVndHVHNQVkVL?=
 =?utf-8?B?Uk5pbGRMdUUybFhacWZLdUlUWmd0ZmdsOEVnT0JkbkZLc09LUkMvN0dCRGZh?=
 =?utf-8?B?V0lxYmxrS2xoMGRRMHZWZFRwK0V2TEw2cDJzZWxUazNuRG4xd2RpWDIwbFJ6?=
 =?utf-8?B?WXJjZzlQd3BKSU90SnVhOXFvTHoxanNYWjdWVVczckFqTzFENU14dzZNYkJ5?=
 =?utf-8?B?bEF0YzAvSVJkWnVIMWN0eVJlQTYwbERQc1JvQWNNa2g5Rm1IQXJQNkt1TVU1?=
 =?utf-8?B?Wi9NWS9LNXVJN2pBUkErM0pjVWpkdWI1bURCYnk2Y2xlYnkzRlRpR29tSjlT?=
 =?utf-8?B?VExkSk5nbEpUaFMyM3E4cm1OaGt1SGdBSjY3S3loWEpkd09RdnBhUTIxWVJz?=
 =?utf-8?B?blZOQ0lFZ2JEUmxVdUxIdC9xdHlPMlp2czlRSEIrOFRjdWhnNUp0Q1ZvRU5R?=
 =?utf-8?B?QkRFclZyKzlGQkszRnZjc293SXZqTGY0Q01PSE1rWkJzZlMyUEk2R3AzdDZI?=
 =?utf-8?B?MW8zWXh2dktkWHVsblcrM2h6d202dWc0RXFsY1FBMVpLNVd0TVd0YTM1KzRr?=
 =?utf-8?B?Y2J5eXVwWTN6QWtEMnMrd0dIVjIrMWJTNXZnTU9NV1Q5WmNudVE1RDVJWlpO?=
 =?utf-8?B?cjhSQWtDMTlQM2xkb3BFWDdVZkpQQVlhTGx6c3RYS2tpTWlMYkxHWkVMZHFD?=
 =?utf-8?B?b0pPN0k5V1dmdWpUZkp4VThOMEJzYjFkbzZpWTMzVUJua0xqYlM2d0lYSEJH?=
 =?utf-8?B?Tk9ZeUxOdWVoY3ZHMXdiTEN3czVsdnVucThDTzM1L3VscjFTdy8veG94bjRq?=
 =?utf-8?B?TXZqamx3a0RhUHFvaThSS1hOTzQ5VjVHbGJTVVVHL0tjZVZuR2tJWFJJUmgv?=
 =?utf-8?B?UmFrRWFyQlBtQnd1S0JDSFVydzVVRHdaNUFpQjQrM3JvQVVnUHBKY1lkbFNa?=
 =?utf-8?B?YTBMbEI0d0JRZ3B6Z05TTXVjcmUyVHY4NFA0bmI3S0xCRSt5K1hpNUVIN0xU?=
 =?utf-8?B?TXFuNWF5TXZRVkJCN1hwOU1ja05wcmF2WDU1RE9TNG92VTdyTjZIanFmOFRP?=
 =?utf-8?B?eGlZT0ZndHNNQVlHd2s0UXFWMDRDNnZVeTdjMThWNFBoZWRXWFY1WFBCV1Jl?=
 =?utf-8?B?bzJWU2ozaXBTZ0I3QUQweStlV0ZqOVgrRmUxM1lhNEwyQytkZXFPdHUwa2dS?=
 =?utf-8?B?RDl4K092ZnZEMVZ4TVVrYVZyZXV2c3Z2S2grekZudzZyT202NjdKS0RqcEI0?=
 =?utf-8?B?OXJVRzBSL0ZVNVppK1A5SjBYQjg0eU1leWh3bGhPRi8zRWpTNmQzdmI5Z3dr?=
 =?utf-8?B?ODBPZDJWd0pUSitKUXpFZ2N0d3pyNlFSK3lTdXNWOHBBM0dnRnBnYzduVytO?=
 =?utf-8?B?MmVnMTBXSWxnaW8zd3JSSnY2bzF0cmFkcWVHY3QxTHFSSmMzcGR6U2NNUEZt?=
 =?utf-8?B?SVRveGJMUS8vSjRLM1AraitzdytBbG5HM3VDc1dSSUF0NEpmZEtadDFaM1JU?=
 =?utf-8?B?T1ZrNWFBYjVzY2ZmZGlVTWlsdWxtR1dtYURMVUM0akZqaVliVnE3WHRvT1dz?=
 =?utf-8?Q?h7MfHD2Iw9E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXJ1d05wUFhnWFNiUm5KV21UMjVndlBzY2QzaU9EL3l2eEhJSitCM2E3RGFl?=
 =?utf-8?B?QnVtOWdlYjR2YjBsbUV0TG9SbTNIcmNkeE9lOHlnWGFxRlozTjNHZW1wRm5Y?=
 =?utf-8?B?WmVReWw3QnBFZnNyUFUySDd5Mm01ZmR2Yll0OU1PeUk5NUpWV2NPREloa3ZY?=
 =?utf-8?B?M0l0cDkyWm5KRUdWendWdDhJcDZpZnJob0xOUUd0N2N4REJCbHk3UHB5N0FZ?=
 =?utf-8?B?OS9vTXdzbTR0V2tUS3NuUElSamNSWW1pa0R2REZreUN3NzF2UDFac0IrNXpv?=
 =?utf-8?B?UHVYWTE5MU5RTWFsaHRzN1BSSlJLdXZwaTJqWUhybGJZc01QNmRsZHRIWkpB?=
 =?utf-8?B?N3VqalAzRDllVVpTaEVDcndKSTNRc3I4c2p0bEtiVGxnaHdDWUdjRHhubzhU?=
 =?utf-8?B?NGNXVGpGZ0lLMDNCRVFxcGdOWFNDZ2Z0N25GcDVaVnNqWG41dWZCRVhMaDFH?=
 =?utf-8?B?cm9abEk3M2RWYi9FSWZvaHl4LzBnb1lEZlFsWjl3MDc5T0I5cjZndU1qTVNH?=
 =?utf-8?B?RUU5Y2I3a1BNYVA3bER3dUZNQTQxbEdIbEczZ1dYbjIrM3JiRStiSVpzRHRJ?=
 =?utf-8?B?YTdXRm5hT0pwOUdkYmkyYlBGQ1NPK1diOTVDamxjNlR6T1RZWlN4bTJkK09E?=
 =?utf-8?B?UU5HWGFPM3ZjdzNwRk1CU21LcXB3RHZORldvWHJMOTZWRnJ5dXFvdmFpODlz?=
 =?utf-8?B?S0tsVjJaRlpXclNIR1JFZDVMSUsvZE14NjN4bHhvcE5lZzREQ2lmL2dSYnpG?=
 =?utf-8?B?Z3FjbTJVZHBsa2RGWE5NSmdjUjNnWVNtNlBYeXdQQTNnb3czRmJ3U1RrUEJi?=
 =?utf-8?B?ZTV4dGFDWHNGZUxwUlVrRGxybjlmZ1RQKzVTTWdPMTJGalduWk42WURXa2F2?=
 =?utf-8?B?bGhDNDZvUkVkN1RWUUJOeFZ5b05xOUJxK0xvdjJ3dnpkellXUi83eE1kTDh6?=
 =?utf-8?B?UTRiYWtheG1KRjVRSWJXWE1OTlU0bldFcys3S0NNeFJob04vTVlzcURBckdW?=
 =?utf-8?B?M1FqZFAwNXNYeE5DRVAvS0p1VmI4WDA5NjJ0Q2E1VmpKQnFMSWczSXZSemkx?=
 =?utf-8?B?QTZoMnNnRmZZU3ZWRUszbVBoUWhNMkxINVJmaGwwUko1WE1ONlVyakxFSk5X?=
 =?utf-8?B?OEJhZ2lsRVlGY1RIU0FnZVNhb2hxZnFnQTJHZzgwSTBCb2ZYS3FScjBENGN3?=
 =?utf-8?B?aWdFWXhDcVdlSWRKU1lqbnBLdTUrQXVxMXdvNHg5eDVVcDYrRnRsVzJCMmU3?=
 =?utf-8?B?bWx4YUxPTGNnaXY3aVU4RWxLK0EycHhxRTdjUlFEcnVaNmg0VVBKQWJrYjJR?=
 =?utf-8?B?cUF2WkV4Tk9EenNQMFNrM2M2Z2RIdEUrMjNGYkpmYTlKcVI5MWNxT05JMUl6?=
 =?utf-8?B?MFVnRVNTOThwVW9YMVVLL1NmQ0pLQmlUM1ZWNTU1UTk0bDArdnpjWVdMZFVY?=
 =?utf-8?B?STlJcmRNSXpDaVVSRHFxdVBtV1Q2SkZwRjBHRmdQRkJYWXdFTGRiMUtEWDJO?=
 =?utf-8?B?S0hNbUtvWjlNREIwdDIyZmVZbDVEQkxLVHdNUVhLcE83c1F3RUc4d3paME54?=
 =?utf-8?B?Qk85WW1MUng0aWZrUlVZZWhkOFNJUzBhK3k2YWVZeXhyNUtiWVNPZE5kUTVQ?=
 =?utf-8?B?MmUxQ2tXdGpNMGcreGhTc25KTmNTU25XTFNkWmpSeGo3SituTFdyelNzelhm?=
 =?utf-8?B?YUx2VFFDYW5OUFdTeWdvMWQyamp5S0JmT1ZNYXEzWGFPYlNRVU1rSmF2ZjBO?=
 =?utf-8?B?WEZ0dytsalFLSERlUlBtcHZLR2Q4RGtKOVA5VEIwNEdrN1NMK3h6bjZGMVpq?=
 =?utf-8?B?MVNOTTBKWGcyTVhoOHRaZndEL1pIRm9JUjdCcGdoY1RZckZsbDkyQkZ2cFh6?=
 =?utf-8?B?eSttN0RPdTFLZnpQbTVWeEJsYjF0QTd4OWkxbFpJc3JlQWxFNTV1NVYzWUU1?=
 =?utf-8?B?Y0orM3dmNFVkUkk1VDhlYU1LY2RoYVJGRGI3Y2lMNFRVenpwcnQyeVJpa1FY?=
 =?utf-8?B?cngzdXV6d2VhcFB2OG9abml5Rk5iYzNZZ0lmZEhaQnJML09hMnh2endRNGFx?=
 =?utf-8?B?SEo1aGlJaXhhSnV3WHhKMlFZNER0Zlltdm5DcGlKOVpWOGZoZzN0cnJDU2hG?=
 =?utf-8?B?VEQ2QVpmTnpheFlPa1Bud1hQRmZxRjJZYzNlRmV1OHJ0QTludE5BMG1UT1dM?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc60f0f4-1104-41a0-46e5-08dd7de3bc83
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 19:12:03.1410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qubiJKUNI9fWNaleo/Khe0Tr6mCkfOfiB/+UTzx+pijyjnSslECj81Ic0mTOihhP7+TllEg35KC8TE5r4f9bUPtCg+4dbhqwPXMUhBpBnOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
X-OriginatorOrg: intel.com

17 years ago, Venki suggested [1] "A future improvement would be to
avoid the range_is_allowed duplication".

The only thing preventing a common implementation is that
phys_mem_access_prot_allowed() expects the range check to exit
immediately when PAT is disabled [2]. I.e. there is no cache conflict to
manage in that case. This cleanup was noticed on the path to
considering changing range_is_allowed() policy to blanket deny /dev/mem
for private (confidential computing) memory.

Note, however that phys_mem_access_prot_allowed() has long since stopped
being relevant for managing cache-type validation due to [3], and [4].

Commit 0124cecfc85a ("x86, PAT: disable /dev/mem mmap RAM with PAT") [1]
Commit 9e41bff2708e ("x86: fix /dev/mem mmap breakage when PAT is disabled") [2]
Commit 1886297ce0c8 ("x86/mm/pat: Fix BUG_ON() in mmap_mem() on QEMU/i386") [3]
Commit 0c3c8a18361a ("x86, PAT: Remove duplicate memtype reserve in devmem mmap") [4]

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: "Naveen N Rao" <naveen@kernel.org>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/mm/pat/memtype.c |   31 ++++---------------------------
 drivers/char/mem.c        |   18 ------------------
 include/linux/io.h        |   21 +++++++++++++++++++++
 3 files changed, 25 insertions(+), 45 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 72d8cbc61158..c97b6598f187 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -38,6 +38,7 @@
 #include <linux/kernel.h>
 #include <linux/pfn_t.h>
 #include <linux/slab.h>
+#include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/highmem.h>
 #include <linux/fs.h>
@@ -773,38 +774,14 @@ pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 	return vma_prot;
 }
 
-#ifdef CONFIG_STRICT_DEVMEM
-/* This check is done in drivers/char/mem.c in case of STRICT_DEVMEM */
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	return 1;
-}
-#else
-/* This check is needed to avoid cache aliasing when PAT is enabled */
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	u64 from = ((u64)pfn) << PAGE_SHIFT;
-	u64 to = from + size;
-	u64 cursor = from;
-
-	if (!pat_enabled())
-		return 1;
-
-	while (cursor < to) {
-		if (!devmem_is_allowed(pfn))
-			return 0;
-		cursor += PAGE_SIZE;
-		pfn++;
-	}
-	return 1;
-}
-#endif /* CONFIG_STRICT_DEVMEM */
-
 int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
 				unsigned long size, pgprot_t *vma_prot)
 {
 	enum page_cache_mode pcm = _PAGE_CACHE_MODE_WB;
 
+	if (!pat_enabled())
+		return 1;
+
 	if (!range_is_allowed(pfn, size))
 		return 0;
 
diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 169eed162a7f..48839958b0b1 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -61,29 +61,11 @@ static inline int page_is_allowed(unsigned long pfn)
 {
 	return devmem_is_allowed(pfn);
 }
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	u64 from = ((u64)pfn) << PAGE_SHIFT;
-	u64 to = from + size;
-	u64 cursor = from;
-
-	while (cursor < to) {
-		if (!devmem_is_allowed(pfn))
-			return 0;
-		cursor += PAGE_SIZE;
-		pfn++;
-	}
-	return 1;
-}
 #else
 static inline int page_is_allowed(unsigned long pfn)
 {
 	return 1;
 }
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	return 1;
-}
 #endif
 
 static inline bool should_stop_iteration(void)
diff --git a/include/linux/io.h b/include/linux/io.h
index 6a6bc4d46d0a..0642c7ee41db 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -183,4 +183,25 @@ static inline void arch_io_free_memtype_wc(resource_size_t base,
 int devm_arch_io_reserve_memtype_wc(struct device *dev, resource_size_t start,
 				    resource_size_t size);
 
+#ifdef CONFIG_STRICT_DEVMEM
+static inline int range_is_allowed(unsigned long pfn, unsigned long size)
+{
+	u64 from = ((u64)pfn) << PAGE_SHIFT;
+	u64 to = from + size;
+	u64 cursor = from;
+
+	while (cursor < to) {
+		if (!devmem_is_allowed(pfn))
+			return 0;
+		cursor += PAGE_SIZE;
+		pfn++;
+	}
+	return 1;
+}
+#else
+static inline int range_is_allowed(unsigned long pfn, unsigned long size)
+{
+	return 1;
+}
+#endif
 #endif /* _LINUX_IO_H */


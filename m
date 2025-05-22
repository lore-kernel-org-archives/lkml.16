Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67F2528E6;
	Thu, 22 May 2025 21:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747948240; cv=fail; b=khp/PE2Nnt/Mc5pan8cMgqd7kWuY4vdFHnqWHev3R2diIo1uZEZ5+JOHPnFw5VrUz8ckDbLAU9XOrbxbGEzEd5gqDgmBXfM9woGwNg64vuOq3TSrv/yMKu5/YObCAlyuAvVip1QbYWh/LzKWRXG1biyPjCf4Sa9iWiuXFS9Df04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747948240; c=relaxed/simple;
	bh=8u7Hkiwujun+mddoRGTvv9jCzbuUhoJW5A6TaGQ97CI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k9AQlljfGQomdSsQkS4DqqF9hk7DJx/KF3t8FmkUWd9qNkW5vQ5EdY7MK5BmdYgyyJqdCWFXwkZnI4/rJff4aVk18e3xRvoh3X5wYz1Vt5D2cCqkqY/TpyEYi+U+l4aPE4Y8vRq2szOovFTZEzkVixJKC80VSaejsKTlRevuFaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lncx1HL8; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lncx1HL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747948239; x=1779484239;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8u7Hkiwujun+mddoRGTvv9jCzbuUhoJW5A6TaGQ97CI=;
  b=lncx1HL8uWem9SftYHaqfGZ5OJGuwsTvyqBYf3oE36VvVsRASq0E04Rt
   09yfeYDsc1OGjd9nkOlFSGiXvn8gqErnl5o3GkpcrIK5QubNWguPDaa3X
   Y0LNcBtFDpmruB16QcCSKj4uXMLcvgWyUa6EfMVn4XJtG3MKTOubdjLJc
   N5OAdEoH+rxNrwcwzvaHKVmjxwl9pLHXbWoIseugvgxw6rac9spNjgWpk
   UmJHQgGY8EllGyah4PzzAsc2DJzHMcjaehVWYaRJYK0Kp2WG2d++i37WO
   LMfMk9t6J6qv4nDxEl/ROg0IpaRT6ZcErOD+5CJXLDBPCBw+17AKgoSfn
   g==;
X-CSE-ConnectionGUID: ouK0AMUxQ1+pD40PjXh41A==
X-CSE-MsgGUID: +3Ej402bQEyOP7BQCEfdcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50107122"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="50107122"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 14:10:37 -0700
X-CSE-ConnectionGUID: mGYNL/7oQtaovQzI5tUjzA==
X-CSE-MsgGUID: rd0lgIkFTk2tQlAf+CVtnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145732017"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 14:10:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 14:10:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 14:10:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.79)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 14:10:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jELF77oqX5URy91maOsviUraVa5QochhM5uHHpDbBNdQsvask+s7D9nltGTCQAw9S1k6enqp/Di8v9n+ZqcwODOKEJ3EP9XaSUhZu61p82kwvZSWwopHMdcuLau7C/Cu9DJ3Uumt0hwM3FoX13U9ZTeGjD2MLKkM/MvLiDMpY+qIJkYTzgxV0MxtzbgSZsyH/XKW3jmqIJNsJslzYlw9RvYg/umGEWrGhm7zaYOyxpEnKaFK8jJJT2aLubp3TND8HuEtMUyKHnyyjT8Cud4VTIe604oVIixTzWJk1JA54QDlKhVhqkuojQ3EmVy5uItA8NsiZYSLP5AH1Qt+chJsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VAeXVXWF7/zJkhBqzFrVQ3FCh2nGrvcsUEt5WQ2XyE=;
 b=VJwXzEHHVMYpxl2o6Yqkqful7ADgfAsKUFFwxbkp7Uc4Z4pQHqO4PR4XCrU1bLLYjkImmaj9zerbCKAorVem81OWySCe7WxpV/nOGDOooBaow68mXKljsrTmWW0kaMG2WIlEL9t5AKO0vJBWzsdit+yqosrvSFcm1BKQrVnrRQVYAa4qaD7bulBb4OoIXqgZ5dbXjoYLSP2gp41gzmVRFu/2Nq4kvfxIHDhZdx3xv+C+RFplZFtb8DH3w3i6NRaosVkY9IR1rMRUxG4uZFPChKS/bd/Tk9AdEqstpf3c4l+A5Pz8ep8vlXwoHYuNB3Cf3YIqH+k7r9aF4m0+kgWAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Thu, 22 May
 2025 21:10:14 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 21:10:14 +0000
Message-ID: <63e37e50-10f6-4408-a89d-a5f4e8cd749c@intel.com>
Date: Thu, 22 May 2025 14:10:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 10/27] x86/resctrl: Add data structures and
 definitions for ABMC assignment
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <5fa043432aa1a697b11b0bd5fbd25a778014fb43.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <5fa043432aa1a697b11b0bd5fbd25a778014fb43.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA2PR11MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: 6108165d-e411-4461-d5e7-08dd99750bd8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUUzVXFWSHpsbUlHS0tmQy9mbkU0WlpPeHk1cllTck9uM0ZQdkh3YlhtNXRn?=
 =?utf-8?B?NjRSOW9UeXBOcldBa0pOTnovN0VtbjdnWlJYY2x2bzBpOVlBWVlmTFRQZU9R?=
 =?utf-8?B?eFFUcDBIZHFvZm9NdStHZ0g5MVVDblhwWFlYTHdwd2lZeXBVS1ZxUEFNT2Z1?=
 =?utf-8?B?YmlodEl4VHVHblYxNk5CUG5maEIrL0VNTm1CaXdBNUNsV1RuSnpNdUZaSVdJ?=
 =?utf-8?B?cDN3VTVVZ3RRY0pWNi9vYTdheDJOaGdaaWk2ckxEem8wdXkrNkIrZXVYZU43?=
 =?utf-8?B?endQakNSTG1kL2dmRE83aEZlR0dNalZkWHNzZnNPYzlLb09BdEdGcU1vMm9r?=
 =?utf-8?B?SU1FcVBWUGhSU0NSaUFOVEc2RG8rTmx2ZU9hZmtTSU1rdFlsVU82WTM5LzZI?=
 =?utf-8?B?Skczak10enZYSDVMNTlhNDNwQWsxbzBxVWxMaC9ab0ltRFIwbEo3YmVEVXI2?=
 =?utf-8?B?MThybGlUd1IrZms3bGwveGpDMkw1Rk5USk5zRk1aWnRibHRhWmVNNCs0UDBa?=
 =?utf-8?B?YkVEUkRIVkI5eDZ1bFlCNDg2cWphYWQ4T1Y5WmQzQnF1OUhBd3A2MmQwbk9r?=
 =?utf-8?B?MkFJSzZOM3BGeFlwdzFKQlJ2K1lScnJtTngxczNIUFk0eW5pYUc3VWlFQjh4?=
 =?utf-8?B?WGtPM0F1amFZWTU2MnMyUlJkL0x2OXorczhoNE05NWZWak5tZkZNak9LYnZl?=
 =?utf-8?B?SjJxNkhJR2psTENGb3Y5MTRMMDdNRnBtRGRjQkRpL1ZrbEJYbVdTMmxKWEZj?=
 =?utf-8?B?SitFVE1nUTZEc1FpZUd4WVFvdGlPY0xzUjVaK0o4R2R2SGpCRjVzb0Q3a29x?=
 =?utf-8?B?dnN4RFBlSnc0QkpDMzNCa1ZmVElmR1RHRHcyVmJQWmk4bnVWVjFkUW5wVVVN?=
 =?utf-8?B?OXNsWnRzNEdHNmpwL0k3M2t6c0xTLzdub2tNN0lmR0NvN29tdmdsaExRcitz?=
 =?utf-8?B?TGNKRkQwYjNTeVRsblhOWE8yeC9UUENFd0l2YjhCTzdDVDdhbHVZNDVmQ0Rq?=
 =?utf-8?B?TnhFOXhkSE5yL2hUNTNJWHFmQXFRaXEreldmYStXWFRQazNPTUFKbjF3ODFM?=
 =?utf-8?B?cEoyQzMxZmN1dU0yR3c2YmVYMkdoQW82Y1pHRTlaZ3Z1WlRWQ0ZuaWpnYktH?=
 =?utf-8?B?MEk1VDRsVFdQK0hvcXlvZmhDWHZzWXVmaHY3aGpNZTV1MWdRbjNBcEx2YUxU?=
 =?utf-8?B?ZXBQK2hpNjNZbW9xZmFlc2cwRDhqNmIzUHBsczJ1OVNTZ0V6Q0ZPQklUZ0Fh?=
 =?utf-8?B?UCtHb3Jqc1RGMERzdE53N1VmTVZnbFBCYlVZOWRaTFFnSGlSeU5vaGFxMC8w?=
 =?utf-8?B?ZnpiZk5WNHdyZHVTYythVnI1TFl6S05HM2dmZ1BlQVVJRDJIK1NvVjFGOFQ1?=
 =?utf-8?B?a2o3NkhHVTc5ZXBOSGJySDdnbmlnbGpZbG56TmxoMUpHZXJsUWJxU2RoUUdy?=
 =?utf-8?B?ZE5CVFNhWnZJUGJBZjhWbkpIUk50VDVVS2U0QjY4WDJxTVU0WS9mUFByRXhs?=
 =?utf-8?B?YzFGbHJWa1MxSk11aE9acTdOT3duSzh3Zm5kd3VTZlJqVXRLSnJJdXZSWnBy?=
 =?utf-8?B?MXBLdHBCbnpXdnhGUi9RMWhhSGV1R3FhSjh3ZjZFUVV0NURUTm9wTk9wYndX?=
 =?utf-8?B?dCtiWXg5dFZFblRiemlZMW1mYWdpRVFVSGcxNHVzSVFFdDhHVXVtei9PUms1?=
 =?utf-8?B?RjUySlFPdHZhMkN4UVlQbSsxcWlTMzM0bUM5cXU3ckg4WXVaWE9XM2cwR3Y2?=
 =?utf-8?B?bjVCVktMczM2NWV2aXFBOWgvYWl5Ni9wcHRlSkp0a2ZKVXMxTXVXKzVKb0lZ?=
 =?utf-8?Q?0sIXhZZv07nAyxy7tCYSnObfpYGRNSm/K6AzQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDJyQkRDVGNJeUloM2Uvc1NOSkRZbkk5M0UyUE5mTG5aUzNIOTJtZkdvZk1p?=
 =?utf-8?B?TDVRWEpCL1Y5cW9kQ29yMkRDVHBscDZnSzBtdGU5blduT2lmMVM1d0F0QTZt?=
 =?utf-8?B?Z2ZOL0JJcmZvaGNmSGJ4SkR1OFZ0ZW1mcEFYeTlsM05TRWlCRFJmOFBUZFV0?=
 =?utf-8?B?QmJ5SG56dWRTN2twbUZSYzNsYzNtTVp2cFBLY2k1d3BwWDNjdVV5cW5VWm5m?=
 =?utf-8?B?MnQ3Rit1RVJHejBpbzh0Y1BjV01OUE5yU2RvdytkdDB3T2RMWFFiZHdWUkhV?=
 =?utf-8?B?cUtWOThEMVltcDc1L0lYQnhzNHhYVERoS3dvRUZTQmpydThvVWZyVGpDbU5v?=
 =?utf-8?B?dVV0RDNwUzFOd3hMTDF0dTFrWGdSQkpldU5vVFdkbU9FMHA0MXVOZlN2L0dY?=
 =?utf-8?B?L0J3V1Rxd0FYdHQ5L1BPNnZCaldPWFJtYWd4azhWeWJLdGVxQzd3b1FyRkxL?=
 =?utf-8?B?K3BobG5IY1dmRFhKSy84Q0QrMElFR2RKSzhMK0hKUzVIWU82NXFvSnhyLzFz?=
 =?utf-8?B?dWJWVm16blFJcWF5aXloSDY2R09sYThwS1NLbmRibzVUdXBVT0pDS3d0OGdr?=
 =?utf-8?B?T08zczRCNmtJWlBKdEdZeGhYdVlVc0tCZDZUT2hMelczYlFPQ2tUS2dkMGFk?=
 =?utf-8?B?eEs2YkJhMTQwdmZlMS9WVkd2aExOZmFaVGU1SnQ5TTMvK3MyYUF6SmtBd1RO?=
 =?utf-8?B?TFZibWlkT0pwK2FVeEFmMGJFOExCRTdBZ1JnQUEwbWhKN2U3UjhSdXUzaVJw?=
 =?utf-8?B?djg3S3RoS0tCSmphQWFPeGFiYWQwek1nZkQ3Ym0vTGdXazZ6b0NDLy84N0k3?=
 =?utf-8?B?SzJIUXplcTlsQWNSS21UL0M4NjRIOFkwaHgxcUhBaFBMVm4rdnBYZ0duZE56?=
 =?utf-8?B?OFY4WFhYUTR6V0ZYajVtOE1PelNqYjlRZUNvUTNoNmI0cTkyOE9CdUQza0dl?=
 =?utf-8?B?U2l3ckt2cXJQMmV6SXdTaHovVCt5citvVlNJeW1tV3cwSnVscXR2NDZlams5?=
 =?utf-8?B?bkRPUUcxUXVYeDAvcVZDS3daQXIrUDJWUUlUcXpoUzF4Vjl5b2tZNy8rNmUw?=
 =?utf-8?B?bFU1eWlSaGpSZnVQUUNCR09ySnhMUHV3c01hWjBiZU1mTlE0YU9Td256NEhj?=
 =?utf-8?B?dDV6ZXZQak5Yb2FIeVBmeDQ0R28zT3NqZFNQTzdyV0s1UWVBdzJrZlpLSHNv?=
 =?utf-8?B?elMzWDE2QWNlcTlVOXJUTlpDQ2RmMG9yRGhzMFFuTHVRV2JQbStPTDBhdW51?=
 =?utf-8?B?ZVpOYUFGMU5ld2xtQ2QvVS9CeDI1YkZiYTcwQ1Rpcm1YOE0vMS9KeExNajNj?=
 =?utf-8?B?OFBONlJ0WmwyTTlTd09WWTRpT0dvMEp4NzkvVHliYW9PdUhHQ2d5K0tBWEVW?=
 =?utf-8?B?NUhYdUMwc3gzNnVjUzJpUElUcHU2dmJSU1IxRUhHN1krcG9RWndWcEZMKzZl?=
 =?utf-8?B?UEFaNGJYSkxaTVBTUlRvNlFzTlNvem9WcjFMZVFxU3kwZnBQaU1GOTl4Zi9W?=
 =?utf-8?B?Ym9sb1RuRzBTUmd4OHJ3MXNvdS9sYytSMGpuRVdsOGd1QkZDeFg4Q29pcHVj?=
 =?utf-8?B?a3BUajRBVDJ0bmpZcjA4a0pBNFN6eFFuQ3RMVzhTa1FWMGVoajhxL1NQR2hp?=
 =?utf-8?B?TnloMnNOSFUwZ3RISTlMUmlveDM4eGYxSk9oNitiaWN0czYzaXZkQVpoNVZT?=
 =?utf-8?B?NjRsb0dab0daZmhBci9FUlA3ZEtJSWhUM0E3R3VtcFlraDFwaWprRm16OG9Z?=
 =?utf-8?B?SVg2eVBrNnRGcjBGZ0tiZWlHUHluV3Q2bVlDZkptandVV2ZHWEVhaUg2akVm?=
 =?utf-8?B?S05Lc1ZtNXo0Y2JVeVF2eGFXbU1yeUI0Uzh0dXA0eThwUThHNmxkVnQvNk56?=
 =?utf-8?B?alNYRWxvM0xURUJrdW05Y3dUZ1VtWVJpSGVLb3RyR2NlQkhuMHlvL2M2a1RY?=
 =?utf-8?B?dXhxUmY0ZTRLcnFSMzRBZ1BlYms5WlJqNWY0ZW1maXlGNW9NVHJCbzRpaTN3?=
 =?utf-8?B?a0pmQ0ZRZENkNXc5R3ZDZ0tZMUdpdXlsSFlOVFZqdkZDV0UxcVpLbytmWUFV?=
 =?utf-8?B?NU1LVUE2OFM5aHVIeG12YVI5WHpUMS9zdy9ST1VnNjVCTWEzZGVHTkRiaHhX?=
 =?utf-8?B?allVakl5T1I1ZDNoUFU5ZkZWcGpzQmhJVmFsUEYzOTVweGtOS1RvM0ZhZE5i?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6108165d-e411-4461-d5e7-08dd99750bd8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 21:10:14.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xekw42g58fr1txaCj+o3nEhWV0+VPFvBzCKeVs04NNPMySdVwFN29RbkNlD3GiVYSBoejCgoPiLdg14dcFocNPymsVvtr/9UeLQxt7VtI/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as the
> counter is assigned. The bandwidth events will be tracked by the hardware
> until the user changes the configuration. Each resctrl group can configure
> maximum two counters, one for total event and one for local event.

(please update, above describes previous design)

> 
> The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
> ABMC counter assignment is done by setting the counter id, bandwidth
> source (RMID) and bandwidth configuration. Users will have the option to
> change the bandwidth configuration using resctrl interface which will be
> introduced later in the series.

"will be introduced later in the series" is similar to "in a subsequent patch"
and should not be used in a changelog. Just describe what this patch does.

> 
> Attempts to read or write the MSR when ABMC is not enabled will result
> in a #GP(0) exception.
> 
> Introduce the data structures and definitions for MSR L3_QOS_ABMC_CFG
> (0xC000_03FDh):
> =========================================================================
> Bits 	Mnemonic	Description			Access Reset
> 							Type   Value
> =========================================================================
> 63 	CfgEn 		Configuration Enable 		R/W 	0
> 
> 62 	CtrEn 		Enable/disable counting		R/W 	0
> 
> 61:53 	– 		Reserved 			MBZ 	0
> 
> 52:48 	CtrID 		Counter Identifier		R/W	0
> 
> 47 	IsCOS		BwSrc field is a CLOSID		R/W	0
> 			(not an RMID)
> 
> 46:44 	–		Reserved			MBZ	0
> 
> 43:32	BwSrc		Bandwidth Source		R/W	0
> 			(RMID or CLOSID)
> 
> 31:0	BwType		Bandwidth configuration		R/W	0
> 			to track for this counter
> ==========================================================================
> 
> The feature details are documented in the APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v13: Removed the Reviewed-by tag as there is commit log change to remove
>      BMEC reference.
> 
> v12: No changes.
> 
> v11: No changes.
> 
> v10: No changes.
> 
> v9: Removed the references of L3_QOS_ABMC_DSC.
>     Text changes about configuration in kernel doc.
> 
> v8: Update the configuration notes in kernel_doc.
>     Few commit message update.
> 
> v7: Removed the reference of L3_QOS_ABMC_DSC as it is not used anymore.
>     Moved the configuration notes to kernel_doc.
>     Adjusted the tabs for l3_qos_abmc_cfg and checkpatch seems happy.
> 
> v6: Removed all the fs related changes.
>     Added note on CfgEn,CtrEn.
>     Removed the definitions which are not used.
>     Removed cntr_id initialization.
> 
> v5: Moved assignment flags here (path 10/19 of v4).
>     Added MON_CNTR_UNSET definition to initialize cntr_id's.
>     More details in commit log.
>     Renamed few fields in l3_qos_abmc_cfg for readability.
> 
> v4: Added more descriptions.
>     Changed the name abmc_ctr_id to ctr_id.
>     Added L3_QOS_ABMC_DSC. Used for reading the configuration.
> 
> v3: No changes.
> 
> v2: No changes.
> ---
>  arch/x86/include/asm/msr-index.h       |  1 +
>  arch/x86/kernel/cpu/resctrl/internal.h | 35 ++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index 3970e0b16e47..b5b5ebead24f 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1203,6 +1203,7 @@
>  /* - AMD: */
>  #define MSR_IA32_MBA_BW_BASE		0xc0000200
>  #define MSR_IA32_SMBA_BW_BASE		0xc0000280
> +#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
>  #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>  #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>  
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index fcc9d23686a1..db6b0c28ee6b 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -164,6 +164,41 @@ union cpuid_0x10_x_edx {
>  	unsigned int full;
>  };
>  
> +/*
> + * ABMC counters are configured by writing to L3_QOS_ABMC_CFG.
> + * @bw_type		: Bandwidth configuration (supported by BMEC)
> + *			  tracked by the @cntr_id.

The "supported by BMEC" is unexpected with the new design that separated
the two features.

> + * @bw_src		: Bandwidth source (RMID or CLOSID).
> + * @reserved1		: Reserved.
> + * @is_clos		: @bw_src field is a CLOSID (not an RMID).
> + * @cntr_id		: Counter identifier.
> + * @reserved		: Reserved.
> + * @cntr_en		: Counting enable bit.
> + * @cfg_en		: Configuration enable bit.
> + *
> + * Configuration and counting:
> + * Counter can be configured across multiple writes to MSR. Configuration
> + * is applied only when @cfg_en = 1. Counter @cntr_id is reset when the
> + * configuration is applied.
> + * @cfg_en = 1, @cntr_en = 0 : Apply @cntr_id configuration but do not
> + *                             count events.
> + * @cfg_en = 1, @cntr_en = 1 : Apply @cntr_id configuration and start
> + *                             counting events.
> + */
> +union l3_qos_abmc_cfg {
> +	struct {
> +		unsigned long bw_type  :32,
> +			      bw_src   :12,
> +			      reserved1: 3,
> +			      is_clos  : 1,
> +			      cntr_id  : 5,
> +			      reserved : 9,
> +			      cntr_en  : 1,
> +			      cfg_en   : 1;
> +	} split;
> +	unsigned long full;
> +};
> +
>  void rdt_ctrl_update(void *arg);
>  
>  int rdt_get_mon_l3_config(struct rdt_resource *r);

Reinette

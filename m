Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EDB2C9A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748407763; cv=fail; b=SEigf5ZVgvAzayMnk5T4ubFDtlb8K18CellVVbKkrkCvVFcOnhXQn1eVJTk94CHdIVtoJnPfDH/Qr+4uWGmgqJeVH0Yw4pVBcVNhmjVTGns+AYAS4t3BVciUzHFqc0A3ukCx6uzSkLkAQO+xfQhwHf+Qr/CtHkBRneaPpQArlwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748407763; c=relaxed/simple;
	bh=oyt2kj2hWG9kPf3DLLAmq+bie3Z9P/2v2dD9hO3gF7E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cgzjbKQevWtbGf8S4mUoaIZ/GDhRUxeMGgq/J8+DRpquUGFLfC222yUa2NVGsLTHeJgoGLBGeJd8LVT0AkKNSrRyJOibQlg6w5K4xHiCYUItu1JnxxsIegQSGoHChmJIz1PWN8kUZJ0geWjTYGZrv+zX1mSjimwhgJRelWAWGw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSOH829T; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSOH829T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748407761; x=1779943761;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oyt2kj2hWG9kPf3DLLAmq+bie3Z9P/2v2dD9hO3gF7E=;
  b=GSOH829TUtUcf3+Of4OdRVSURAbCvdzJ4SnGeU/TREbWnoeFqrF08jLq
   s4WMlUyjxJquKOw0H8Sixi8ylJTnx+gV5XUsy9uEHMc8JDAxw6KjxgkMf
   LEEwRm8pmdHC9Y36PFFRkF7Xr3RB3WGBLy8CO9aKKJIYREp0nI/6Tjj+d
   hdT8DeWzVwtuOmTm4vb7sBC8nMV829VFtbeMXauGOaaXFWDCHHb52hdcv
   SVboc9XSmfQ7qzcUnAddsYuqIh/N2MinXuEPRtw9zmP+XT7YAAVU/sAPH
   8TykqbbNnN4dYCpVQOh287RWZaL/q08CSCA3gBwrK/KIaB25qN0tITjqz
   Q==;
X-CSE-ConnectionGUID: 0qMgqrZiQemQ6Ge2I0Gjng==
X-CSE-MsgGUID: C8qE6T8JSeuMicwD0+r1Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="67961934"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="67961934"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 21:49:20 -0700
X-CSE-ConnectionGUID: CnjaW4ScTIeSCZYNWMVsjQ==
X-CSE-MsgGUID: Uy/7jof8RPWdkE4avuyhRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="180342441"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 21:49:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 21:49:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 21:49:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.69)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 21:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGNp0E4wHlEyV/Zyt3dfjsrIZqq5721VEDj3+baSrLfg2frsLvEySM8yEb6ukyIYQuTZmRjjtrqWXsdTgFL5W83J4j3WVAchiqUOuDSIIv9CBC0Zqc9/90rf5AQkbjtf4tUpn/Z1yaaroLrEONmt3cRsEcrR626JMHtC9OxAT7pzjWVBM+pwwI58L3ULgTK5ri5Gqw///oY6UaBcsnVNyuX5h5FsrBRsODqrCHMx1urwa9FEmo2z+bdZfz814aWhBLhAo4BuceeHNPD47XEXRW/ivHghM5V20xVQ82NXd78GR5AbdLOEJ72MQt8C9ybmJcMXYvMOIOeSk1uwUnqtsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmDJmvr8Dn9Fq9x+UK8sr2B2o4HQsIj6Ya8CpqZgHMw=;
 b=S+crI6jSwP7/SQRnlfISeazga9fihizA8xIR3l4hWR8hSxbtWOh4S+/JX6vhG13DmkaqreJtuQH9DMhUDIi/c4y0CFpskahRV5EyJjz/ccet/nfUtum4T/LWlopntcxPjMVZFBXhZHKI2hAzsYiwqAOl6m82+go9z4Ejf4NgHlJofwdj+DpHWXwwObAqi+EXLQTpa0hfundj1pujmwa4dZszwVng2XTvc5ZytjhwHzG5uKUnwhPPy1tSzKV+gGOc3wcZdr5lom3rSE6/+LS4XPcmsbH2WjNwk2s5dCAjepFxxM7cHHhSOfSV3KvBPehO3cSDQCE3GhZPN6Pue6e3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 04:49:11 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 04:49:11 +0000
Message-ID: <5b446254-a2c8-4f01-93bf-3a348d474820@intel.com>
Date: Tue, 27 May 2025 21:49:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/resctrl: Remove unnecessary references to cacheinfo
 in the resctrl subsystem.
To: qinyuntan <qinyuntan@linux.alibaba.com>, Tony Luck <tony.luck@intel.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
References: <20250526073744.62520-1-qinyuntan@linux.alibaba.com>
 <c4382156-a51e-4d07-9ccb-e6db2ca9d719@intel.com>
 <b67949b8-7eac-47b4-a667-6343837226f7@linux.alibaba.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <b67949b8-7eac-47b4-a667-6343837226f7@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe59531-7ccf-41dd-a942-08dd9da2fd03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVBYRE1EY2FHQllucXRBZjdlaGkwTW1rU1g0K2VaUHFmbWtOREdWdkNWZy9h?=
 =?utf-8?B?MkpyZEE3NDlNM0dRd3h4YzJTaXl3L3U4dy9MRTRaQmMwSlI4akhLN1pseERK?=
 =?utf-8?B?MTQ2b0Z6SDlmRHl6eFBTeVY4cUxwVUNCUCtyUmtqZ2dlbExoRmpPMGlYNVNw?=
 =?utf-8?B?TzA0UjhhaEtMKzNMKzBjK2xmb3Nic3pvU3BURkhkNk82cW9MdXZKRFJQNm5L?=
 =?utf-8?B?Z3pQQ3ZpcGk5bWJDSWhlUFRnK2FDM3RvaHpHZXh6VkxEalgxc25seXczZEg3?=
 =?utf-8?B?ZXM5UkNpelp5SWtVbFZFazk5WDltOHY5bGJnU0FLTnVXdUFoYkIwNTJXZ3VJ?=
 =?utf-8?B?SllyWmZKK1FtWjJaYjJmQ09KSlk0ZC9GM1hKa3o4aFNMemNsRUZQWnBTcTZp?=
 =?utf-8?B?aGxwZFBmeVpZNTJnM3JJdzh1TkIrMVVEV29TMWtDNWZqYXNkRDF3WCt0bkUv?=
 =?utf-8?B?cGhYZDdqazlta04weVpWeGJtZGdPeENtdXIrNDlXU05Qc1ZQRmRiVUxyMmxp?=
 =?utf-8?B?WEJPdGxFRXhZd3ZrTU9tNWYvN25wWHFZOEt2RkpQYW5raUlPWTVINVR0cVNP?=
 =?utf-8?B?L3RiMW1ncnZCeW0wM29jWHd5K2tvdmxqVWNGQ3kxY040MFdFWGkzTTZLbDc3?=
 =?utf-8?B?STB0VjlLS1B4Sm95VEx2RWQ0dnlvdU1MZVBBbkxDend1VU5pdHh2RzdUZUtk?=
 =?utf-8?B?UDFPTjRIMk1qR2tMTmJSMmtaNmU2a1NFU2t6K2xlK1VwWUtrRGV4VFNWNlMy?=
 =?utf-8?B?Ynp6aG9IYVlDNEQ5OGh1MlhZV1I5VlJxem1DVWQrR2tuUDhKdFRPd2lzSUE5?=
 =?utf-8?B?cUFTNGhYekovUFhONEtjRERKU28vMVd4MzFRMkhEQ0ZVSjNKWjJiQ240VXhx?=
 =?utf-8?B?cElsdFIyS1ZqeGFEbnpNdkM2NXZyYUk3dG8wZzBXeTZWblJsUVA5UVNRbmZL?=
 =?utf-8?B?Qy9sYUJ3RVcyQktRbFV2K3E4dk41MUw3cW1uMWVuYXBpc1Vtc2kyRGxyTThw?=
 =?utf-8?B?bzhBNU9GNE5FQmlGcnp6NkFhRmtDZlJXSWl2dHU2d1VQNHczb3RPNjlLMmlv?=
 =?utf-8?B?V3hEVlVnWXpqMkM5N2xGbncyZmdmaXpqQWMzMzRpMGhnTnRnZnpoSmVkKzJz?=
 =?utf-8?B?SGNiL3FHbWxhOWg1QzBaRko1MmpXMFh3U05nVEtxbk9nUFc1TXhsUFpaK2hP?=
 =?utf-8?B?eHZtMVordFRTZkxKc1JDcW9scnZBOTQzV01URGRQdUhrVTBxZXFFY0xEUzNX?=
 =?utf-8?B?bG9FNjVOS2RweGNwTGtHMDJ3YVc4dDJjRExWUjZTaVZZaUpYdDB2QWJsQVFz?=
 =?utf-8?B?S2xWTzBPZWRCelI0TkJGcTJDMS83MFhTZ0I1eGczY0RxR2ZsTDNlRkNISEtN?=
 =?utf-8?B?WlFZOWZYcTZUVUwvbWN4NDg0cTc3VEhiZHVyTEpkNlF3SzNGUkxNSmNtRjUr?=
 =?utf-8?B?OWNFbDJDL1FUR3dPZWNkT0w0bzhJTzV1TjlGU0ZQQnJzb2kxdDh0dVk3RHQ4?=
 =?utf-8?B?dWhyTHFQUWxsWVJoanhYOWx2VmdkYUFTdjhrOStMVmhxeEUrNzhzYVIxak9i?=
 =?utf-8?B?YmVrNXhWcW1tRG83Nk0zSzkrZFBNYVgyclZkcWkyZHZMa05OL1M4K1VteHk1?=
 =?utf-8?B?c0ZsNUUwcXJ5TVBNRVRsRWh6YW5Lc2JjSHFmdFZaOGpFNXd6OFNLWjJXMU9L?=
 =?utf-8?B?OWVPVUVKRVNNZ3dRZmJ4c0d4NlBvQWJsaXE1RUZGd0lZL3dZekVCczRjd1pL?=
 =?utf-8?B?ZklkWTJyOGZDZlZNV05naGVxMEZFSUliRU5Obm5jVlk0dkVHZktveXhPS1Ju?=
 =?utf-8?B?azk1TFRucHFqVkZ4YXlJQVNMSTV2OEd4UVYxT2haZDRhMzJCZTBsLzVCMTIz?=
 =?utf-8?B?aHZvci9mcUJ2VHlQOGVacXNqTFpmRW91ZW1CSXpXeXYvYlV1RSt4WDJROC9T?=
 =?utf-8?Q?Ue7ovLmbXNU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmIxcTJNL29qRjAxaUQ5TEpPMlVBR1dnM2VDNkRTTUREMitvTXRqYjBJR2Vx?=
 =?utf-8?B?cVBFcEpxTE5ia01TUDFETG14Vk1LM1RXUDFGdC9BUzFOdjE4Q2Y5R1JleUp1?=
 =?utf-8?B?eHlWTkM3N2RBbkVmeDVnZ2NkaWJWSmRySHltSGcwT2RDSTFZcVVYeVBXNHlB?=
 =?utf-8?B?ZjY4a1g4a3dUVm9UcXk2WTlHZWp1NGllS1J2WWFoMHhBV2QxYlAxdFluY1RI?=
 =?utf-8?B?YytCVFRrWW9wRHl5Z21Ddk5xcUw1RHpKcjFCRkhuSndRdVJ3S09hLzk2aDBI?=
 =?utf-8?B?V3BRTG8wQjFHS2xOTVcrY2gxQ0NXcDBYelVHOXU5aFN1OGsycDdOWmVlV3VG?=
 =?utf-8?B?QXU0cmF1cU9nbmVVblRJSTdhNnhYUUVtNEh0TTF2WFdha3J3cDQ1R2lOWU1t?=
 =?utf-8?B?eDJvSGJXeStrekh0TjFaNkJvYjY1N3Y0VkoyaW5IaHRjUXFyTHhBaXZ0ZXlW?=
 =?utf-8?B?N0FVTjJPMFFDYmFtSlo0RnpOaXV1MFM5UURjTjJFaHArYXdhSHBDMVNSR0tu?=
 =?utf-8?B?bktpVnhvbTFxWVJCNVdvemU5TGdNcmtESnNFRitIRGJnOXJPQVJDUEdSYWNC?=
 =?utf-8?B?SDNDY1VsNFFOWXNaS2pZeTA0ODBTaWt1ZnI3M0RTb2pLNVdQWFExOTVmaTBP?=
 =?utf-8?B?dUc2NDU2M3RydFlRWHBrUFZoWnNVN09OZDhleGQrV3Uyakc2TWV6YldoUVE4?=
 =?utf-8?B?MlQ0OWk1ZldpS1FYODAwWFFDQU5vRTdDYVhzb0NJa0NvOHBSNmtSaHNHY21m?=
 =?utf-8?B?UEZFQUFGM2NYaDBhaTkzQjJrcklmN29wVWVGek52UU1ramRxMjIxZDVzMmxa?=
 =?utf-8?B?WTQ4SndyaHlBM1o2ejBnZ2NUeEQyd3VtU1NBeU84Wm8rNjkxblZGNmhnWDRy?=
 =?utf-8?B?dkF5dElzOUFQcTRIYTlEMUtQVmgweTBzQU1XdUxVTldnbHBhb2dBUHpkVmhF?=
 =?utf-8?B?b2NLemJNNENxNTZLbE5jTUZockFka1VjOWliSVFPUDAyZkI0Zkh2bEVXNGtq?=
 =?utf-8?B?TWthVk5vYi9qeXZoNkNuM2s1YjhkNHJhdldkYktkZm1SWU93VFhKZ2RhUk9P?=
 =?utf-8?B?cDFCWmFIRFZsYjJhWG5Jd1NMZFBKYm93K0ZqRG5mMnZ4ZEw2cndraFI1a1h1?=
 =?utf-8?B?c29tQTNKRkxxSzJJc3AyRG4wMk1MTWtkblF2ZUJUYmZBS05ubGFQbFduWVk5?=
 =?utf-8?B?MmlxUUs1WWxOTXpwZTBzZFo5OVNEZmZHVkU0a2F6eStXeGxrUHBmS2FUUkcy?=
 =?utf-8?B?UTVnc21vOVp4bENQUkVldTRUeFI1UUxXbXNzRVpxdW5wWlI1UHJLbmtrY3h3?=
 =?utf-8?B?cVl1UTJpN3dsSUZQNXJ0VGJPMlJpNjNOWWdVT0wzLyt2SEtjQ01JLzR4cHNW?=
 =?utf-8?B?a1MwUFhXc0dwT2NsR1VrSXJLN0oyem1PUU9jSDN2MFh4TUh0UGlib3piOUFO?=
 =?utf-8?B?VWloY1lVeGF1Z2JXRDh4blQ4WTFSZ25kVFlqKzByeEdGQTBXY1YxcDcxZ1Zl?=
 =?utf-8?B?a0V3OEpGTlZHVkVrcXp1TWUveW9Bd0JVMWFQTW9YcW5ZcGJQNEw3bDByd3JD?=
 =?utf-8?B?cW1hKzIyekhWVlBKVWVjbzEyOWdtOXl3blV4enpFbGhvVmZmRE1ZWEhMZ3R4?=
 =?utf-8?B?TElKeDN4aTNvUEVaOFRVeHpOZFZiU1RLWS9HcjdUNU1COEdBSUVsMjIxZ3cr?=
 =?utf-8?B?Z0ZWdkdnUml2S1ZkZnNuNVljakltaDJJd3gxNjFLNWt1c2tua3B2OERsM01q?=
 =?utf-8?B?Ry9GQ3l6M0hhcjBBWFA1WXlwd0JHa2plS1VSbWYxQlJMWDhoYTRoeWZjeXE5?=
 =?utf-8?B?bVBvdUlQdUgvWjZEcDA1NHp0dzg3MHRiMjRLbXZWY3owT3JaSHYzZXdDVVBD?=
 =?utf-8?B?SDdVOTBpVjJNajEySXA2a2R2VXhLb3p6L2oyUUpTa0w3Qkdjc0tMOXdVZEZv?=
 =?utf-8?B?eVUvK3RoRGJzaUkwTGNvcEMzdk1DaFlDZ1pySGlBaWhDNDVzQW01ZHBuUUxN?=
 =?utf-8?B?eFA0VktnRjJaU09La2o5cFZWYlIrQ2gzSVJORE44MGF3OWxkTnU4ODlqTlFx?=
 =?utf-8?B?bnhqWVhKRUlmR09IYndXN3Q1VU5RaFQyVGdyWFhPdlVQUWZRZDczc3VxYXJl?=
 =?utf-8?B?bFhud2NpZlpUeEp0OEJVZlRiOGxEdzRTWnhva3EyR3htYUxlYVJqbmdYYzhG?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe59531-7ccf-41dd-a942-08dd9da2fd03
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 04:49:11.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAlxTixjuko2xcp9vPH8Dh77XbUHJNIbbN6RzFFFPwejVd7v9uP9pJTHaU/9SWL+CiODaf4RVBmXgx/lE+qcOyfsVPXEXLnf3FZEnXtUFvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
X-OriginatorOrg: intel.com

Hi Qinyun Tan,

On 5/27/25 8:32 PM, qinyuntan wrote:
> On 5/28/25 7:36 AM, Reinette Chatre wrote:
>> On 5/26/25 12:37 AM, Qinyun Tan wrote:


>>> first online CPU of a NUMA node. If this CPU later goes offline, the
>>> shared_cpu_map (managed by the cache subsystem) is cleared, leading to
>>
>> "is cleared" sounds like the shared_cpu_map is empty. Looking at
>> cache_shared_cpu_map_remove() it seems that the worst case is when the
>> CPU goes offline the shared_cpu_map only contains the offline CPU itself.
>> If there remains a reference to that shared_cpu_map then it will thus be
>> to a cpumask with an offline CPU. Are you seeing other scenarios?
>>
> Yes, you are right. Once this CPU goes offline, its shared_cpu_map
> will only include itself. If we then try to call this offline CPU
> using smp_call_on_cpu, it will result in a failure.

Thank you for confirming. Could you please update this changelog to reflect
this detail? Doing so will remove confusion and make the change easier to
consume by making it obvious to reader what the problem is.
 
>>> incorrect or undefined behavior when accessed via rdt_mon_domain.
>>
>> Could you please elaborate what "incorrect and undefined behavior" you
>> encountered?
>> It looks like reading the top level event would not be able to read
>> an event from one (or more?) of the online domains since the shared_cpu_map
>> will contain an offline CPU causing smp_call_on_cpu() to return with a failure
>> that is not caught ... the symptom may this be that there are no errors but
>> data is wrong?
> 
> Yes, there won't be any errors here, but when reading the top-level events, it may not retrieve any values.
> 
> For example, in the SNC-3 mode, suppose cpus 0, 40, and 80 are the
> firtst online cpus on node0, node1, and node2 respectively. If cpus
> 0, 40, and 80 are all offline, At this point, reading "the top level
> event" will result in a zero.

This is SNC-3 mode with a single socket example where CPU 0 cannot
go offline. I thus do not see this happening for the reason you provide below.

I *can* see how this happens on a second socket when the first online CPU
of the first node of that (the second) socket goes offline.
 
> Why hasn’t this issue been discovered earlier? The reason is that CPU0 is always the first online CPU on node0. The cacheinfo stored in the first rdt_mon_domain corresponds to CPU0. When rdtgroup_mondata_show reads the top-level event, it iterates through all rdt_mon_domain entries, using if (d->ci->id == domid) to find the first rdt_mon_domain that shares the resource. It then selects a CPU from the corresponding cacheinfo to perform the monitoring group data read operation. In a single-socket environment, all CPUs typically share the L3 Cache, which means this traversal action will usually lead directly to CPU0's cacheinfo. Additionally, since the mainline kernel no longer supports taking CPU0 offline, that cacheinfo remains valid indefinitely.
> 
>>
>>>
>>> 2. Lifecycle dependency: The cacheinfo structure's lifecycle is managed
>>> by the cache subsystem, making it unsafe for resctrl to hold
>>> long-term references.
>>
>> This is not obvious to me. Could you please elaborate how resctrl could
>> have a reference to a removed structure?
> As mentioned above, although the cacheinfo of each CPU is not freed
> in the latest mainline, the shared_cpu_map within the cacheinfo will
> be modified as CPUs go online or offline. Each rdt_mon_domain
> directly references the cacheinfo of the first online CPU in the
> node, and the shared_cpu_map is used in various processes. This
> situation is bound to lead to some problems.

Claiming that it is unsafe for resctrl to hold a reference implies that
resctrl uses an invalid pointer. This is not the case here. The pointer
is valid, but the data pointed to by it does not support resctrl's usage. I
thus do not believe that this "lifecycle dependency" point is a valid
motivation for this change.
 
>>
>>>
>>> To resolve these issues and align with design principles:
>>>
>>> 1. Replace direct cacheinfo references in struct rdt_mon_domain and struct
>>> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
>>>
>>> 2. Use hdr.cpu_mask (already maintained by resctrl) to replace
>>> shared_cpu_map logic for determining valid CPUs for RMID counter reads
>>> via the MSR interface.
>>
>> I think it will help to explain why it is ok now to use hdr.cpu_mask instead
>> of the shared_cpu_map. In support of this you could mention that the original
>> solution aimed to read the counters on any CPU associated with the L3 cache
>> that the sub-numa domain forms part of, but this solution uses the
>> cpumask of one of the sub-numa domains that is known to be associated with
>> the L3 cache. This is a reduced set of CPUs from previously intended but
>> known to be accurate. Alternative may be to build a local cpumask from the
>> all the sub-numa domains but it is not clear to me how much this will
>> improve things.
>>
>> Considering this I do not think the references are "unnecessary" as the
>> subject claims since the solution does not replace the original cpumask with
>> an identical one.
> 
> Thanks a lot, you are correct. hdr.cpu_mask is a subset of
> shared_cpu_map, and we can almost use hdr.cpu_mask to replace the
> functionality of shared_cpu_map.
> 
> In fact, in resctrl, the only purpose of using cpu_mask is to select
> a CPU that shares the cache resource for performing monitoring group
> data reads. Therefore, I think there is no need to build a local
> cpumask from all the sub-NUMA domains in this context.

One issue I can think of here is when there is a usage where the user does 
task isolation on the numa node boundary. Let's consider the SNC-3 example
again with node3, node4, and node5 on the second socket, "L3 cache ID 1".
If all CPUs on node3 are in tick_nohz_full_mask while none of the node4 and
node5 CPUs are in tick_nohz_full_mask then one of node3's CPUs will get
an unnecessary IPI.

> 
> I will provide a more detailed description in my commit log moving
> forward.

Thank you very much.

Reinette


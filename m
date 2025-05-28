Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1037328C033
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748453923; cv=fail; b=qIc7fg9VSxh4OB+VgGQWpC0vz0q5jmWmZWYBWzFz/+YXiQLl2QF5WoJFp7OrcP25fqpgK6Z0Lue2lE8qe00zAPhAExk5GoH/FZD0W1Io6/FGdOIomG41tv+08wkOctUsw8aVEXPU094nsuIOtH3ASWAQ0itr0GW3jjD7GPk5krg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748453923; c=relaxed/simple;
	bh=3+XEqTvUmXZn+qFLAZnT8Hb4GU5Xmz+bH9CIRz+aJZE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r/K3RdlP81cdD8ATC1FzxGQa83phIjvnta2ii5nX5guHvogmsvl7eUi1tK0ny2HpSWQzMt1ETc1kW4auQk41ScV8FBhSXfqjsNlX5HZnjqOdnvFBzYKiXTJauz+sUKubThgwMsDu2zJmxbqwy1Dp8k+V9aQWUrcwBxzOpcYyJY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ0jPdAo; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ0jPdAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748453921; x=1779989921;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3+XEqTvUmXZn+qFLAZnT8Hb4GU5Xmz+bH9CIRz+aJZE=;
  b=kQ0jPdAouvFA8bfAkIn7oWknDz49/OfKFjCEXu+EzHF7bPKjLaUrwJgy
   nBWtXgqyPX49ewryLmyiZHZFqPxmX3HIs+CQEYApVavo0cSZNHKBsQ5DF
   cKbQRNtVQuydJ8sQOIfgmG2H9mGogPTjkiey33y5pf2PP2xtP4vwKyj3A
   BHyCDiVftZ2tkK6aaHv+3MpunjIUJUHLL/IUCntAOfr5FusYyrDjBnqcS
   mQDOtutBikfSzw9xq3e2dxqIJrS8r24V4ibkXpyC0VIGDl1CT+NYKu8Se
   RSipOwFOMe0xj/42wgHeZ7Z5CPatzBSvWDL3fp+lkrz+Ws8VZ5cwYWfHn
   Q==;
X-CSE-ConnectionGUID: jWI15y/OT6Kn+MIeJqGhjg==
X-CSE-MsgGUID: AhF7+41dR4um7i8LCnuslg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="49606442"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="49606442"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 10:38:40 -0700
X-CSE-ConnectionGUID: LNLfzEQ8QZytcv1yNQAdKg==
X-CSE-MsgGUID: PV+8myp3TziCDrnT2FA8cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148082203"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 10:38:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 10:38:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 10:38:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.71)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 10:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nofxCiuKqhQfSfyhw+Ap9YArKu6TLzK6WMBk59s6YnI9Oe2Bl3sNunmEE5atSHwkIg6oUxeWUr00BOXsfDfWVcdXwkUD+swz+SZBIsIjNKGlusueVMvThHjoxRu3VhoKOTsRYOEVCKWglz+VN2JxIm2m4yhb5MjAfNSHYvrf+7SbNfKX0U3dzD0q6PEtOqtrxJHGK8iT0dyNphJKkpEBNwQBLgaMIKHUrPFbypmqSp57UUGNBP5PxbWbxJOTjlxvy8Nxf87a/OV0qQgKRC4YxuctomQJMTAlPojbidDOy5aM0aduv3CkN23ejgg1iYPYuLH0zjQuIaCVJapvnm1Y2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awwmmfdtNEyO2nbwx1xEWpPj38yOD3/4FgUw2riX60c=;
 b=aZU7galb7pWTg5q+QIKxj4TpYbSUdElC20KExn3Ux+sOOOwV6Nifwz7o4VWa7ybSRshrVpyzvafhmSd4JZyI9BmWPfspOCMXu+K/hw3TyqOF7LOI9qP8yc+14iGdXBNLzEiebDjYqPd2GX7NmTVHuzZt/NU/Xd/D3I+Z3chbMVXX7xHxE1V3NO+6a8vvKHTuj31BaMoiDatuSOV1qDGnG/a7dKRrhi3X3vGRVmVD1Z/HMMbu18HwYjv+alLn7It3PTnaTphLaXi0miXsoOx7Qc8aa4r/Si5k5hCGiG4bWiKTw8BmbTz8kCjR3iimtzwGqDZm4Rq7ias64BWaPP+7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 17:38:22 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 17:38:22 +0000
Message-ID: <60f5d0cc-afcf-4ca3-ba55-dc4298d95477@intel.com>
Date: Wed, 28 May 2025 10:38:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/resctrl: Remove unnecessary references to cacheinfo
 in the resctrl subsystem.
To: qinyuntan <qinyuntan@linux.alibaba.com>, Tony Luck <tony.luck@intel.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
References: <20250526073744.62520-1-qinyuntan@linux.alibaba.com>
 <c4382156-a51e-4d07-9ccb-e6db2ca9d719@intel.com>
 <b67949b8-7eac-47b4-a667-6343837226f7@linux.alibaba.com>
 <5b446254-a2c8-4f01-93bf-3a348d474820@intel.com>
 <37f6345f-7536-45a3-8c85-6b2bfdba2fe6@linux.alibaba.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <37f6345f-7536-45a3-8c85-6b2bfdba2fe6@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|BL1PR11MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 48dff166-eef2-4ed0-a46c-08dd9e0e7135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2ZOT05odHI1azRwN3hzTHFGNWNCTCtoUzMzTDJmaFJCNnVhNG1QNVhtWnZi?=
 =?utf-8?B?cHR4c2U1VW93QmtBalJieGVxSWYzUUUyb2pOdHJlYlkwUzBrcWdIbFdieXNy?=
 =?utf-8?B?UlNBV1lZcDVGRWg4NFZuMFVjSDNYTlB4dkhJUmpKcFlHeXk5VDhOL0UzZ2x5?=
 =?utf-8?B?NW13MGc2Y25BbC8zZUZwRVpUVDhpTmNoaFAyYk1EVzlsMXpGV0xqVElKWmxn?=
 =?utf-8?B?SGVEeGVSbHQ1L2tVVmJTa20wQnBMTWJEV1FZa2JYQytYRHVuSFN3ZjMyNi83?=
 =?utf-8?B?a0NRck1VdEhXR1RPdUd4MWNDZnpKeHdLNHBGUS9RV0VPUDhqQStuejk1S1lz?=
 =?utf-8?B?bzNoRUl2Wk9hZHJNcHRzbERjVm1ueUVqWE5GbjR1c21GcTVLeEtZL2VlTkNV?=
 =?utf-8?B?R0xTT21KNDdhVjZuSitsMjBudytacC9aT1V5ZjA1WVE4dU5vbk5SZ1NmaXN4?=
 =?utf-8?B?Y1RDQnVmcjQveGpZbkdBVDlwRzBWZ1RDWmt1b1YwWVlEd1luZXVmdktHVStm?=
 =?utf-8?B?ZFpyRmFQVzRhbkxLNE8rbTJaMjVhQWZSMkw5cXU5OW1XemdqaXZGaUpVUDVH?=
 =?utf-8?B?dVUxVUhaeWc5MGpqZTU0UmdMd1k3cXdLWnBNZysyeU9JdTM5NTlwOVRuNkpl?=
 =?utf-8?B?L2VGS0xDUDRQbnRPRE0rc3ZQVmU0ME9qeWJPNkxKZ3BHMUMzcWg2NExrZi8w?=
 =?utf-8?B?YVpPUy9lYUVjZHVQODN4TFlnbzZNdUNWQ3FDR2tCQlM5cEZhSFZMdy8rS29K?=
 =?utf-8?B?VTVsRkU3eUtmR3FDdEZKeDUvM2Uwei9sb09FTXhJT1JDK1FralpwMjJKYkwv?=
 =?utf-8?B?cUdZL3NlTStQbkN3ckorZkx4L2hzenJ6S1B3S21mUVBBRmdjK0F5disvbzRM?=
 =?utf-8?B?djd3d3F4SVRKQjczd2t5TktsNzNqZ0ZnZzRnY3hHQXk3cDNLR2V2VmNxQ3BS?=
 =?utf-8?B?SkRUSnR1Ny9XZk5XbmwxMDhNY0gxQlpEdUVEbDFJZkV5WnN0NjBBZDhrOCtl?=
 =?utf-8?B?K3N0dUw2VVFUTVRpT0NEM0s3U3ZuME52cGRmQ0FOeHplYjg5ZmhuR25mSnc0?=
 =?utf-8?B?WUJHQ01vd2c1N0NrVmlGTXpndmhwY0hRUEdVenpFZTRHalAyanVCUUxJb29u?=
 =?utf-8?B?YWwzTno2bXJXSlBZWndBQnZURWMyT1FhcnRTbzFRV043T25ZaFgzVXhxK3FQ?=
 =?utf-8?B?Z3lPenlRM1paRVpRbHVKZDZlN2VWU0NxRjR6UFNib3FNUkJoYWx1Um5keFJR?=
 =?utf-8?B?OE03akdaTjVUaHNGd2ZQaFdITkRkS3l6MlJpY3AzYTBLZUYzUWx2RlN0RlV0?=
 =?utf-8?B?SlFUM3d0aGp0TU9VaW4vMGd3c3lzMytWeVFBaEI4RVIrNWpqK0x4MmMrWVAz?=
 =?utf-8?B?cHdkeWxmb1pwUElydzIrUmZWOWJuSnBrMXkxT3MxMWROMWVORmtQOE4xcDZv?=
 =?utf-8?B?T0VRMnd0SHUramdCVFdWUlhMR0F1UG84RzcyNnhxWWhEVWVxY1YxUkFQc2xK?=
 =?utf-8?B?U3U5cjVlQloyYkMxY0lMb2ZYdjJ4N0xkU1lWT2xSVnVrR255bmZBR3YwczJu?=
 =?utf-8?B?aG5pQnNZd0Mra0M1dWRqOUJ6NzBINkpIQ09EdnpYSmplYVFTbzBUTlNsenVU?=
 =?utf-8?B?OEZucEt6U21ydWRYaU5zYkUrcWxQVk9kcVoyRXEyWTRvQmY0dkVNc2NqRzU0?=
 =?utf-8?B?dWFXTlpZRVF3cXhNZXR5NGlKWFVQZGlSS05aR1NzWkpFVC9qeHBZQ1NKc29r?=
 =?utf-8?B?UWJ1UnhLTlZ5SFNVcDc2K0pqM3Z4ZTRKY3I5T3BBT3Z1bk9rVWRuQndiWnF1?=
 =?utf-8?B?UzkwLzZtT0hwZHNOcVZVMW8vQXZ4cEMxMU9IcG1yRTFVTEhlU2piMGZsMk5J?=
 =?utf-8?B?ZDZuSzUzZ3NoQ0hQakp6cm9LdUpsTFZJb2tKOGRkK1pmVkthb2ZVcU1VUGlz?=
 =?utf-8?Q?5YSNH2HTsjk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1p4alQrUlhmSlFndVJLWE1CdHJYWFRYU2tncERwZkZ6cU1zeGx2MURWRXVV?=
 =?utf-8?B?M01YUHhlUmJGUnY1aVErejlsQS90ck9ielFhckhlWmxiZ1F0aW1pd0wyeVhL?=
 =?utf-8?B?eTRaKzJtRjVWM0FVeVdXNUx4ODVVZjZkTXdSVDlDbjBPTFNVWHlwa1VtREh6?=
 =?utf-8?B?SVE5QnhpTGk4cjcwWVE3S2ZnOC9aWGZNSE9TRjB0Uk5sUlF6TkxGeHZRWDRR?=
 =?utf-8?B?VTFwTkVuT2FMUjNLN2JnbnU5S0ZseEJTdERLSkZhQnFDZjZCYmtsOTc4MHhi?=
 =?utf-8?B?dDExUXJ4YmRFc3JMN3RIc2phUHAzT2RRbWtSSEZoeVZVektDNzNWVXA2NERx?=
 =?utf-8?B?K1pRMDhRbHlVVXZBSWVqNHl6T2dKZnRRMUJzeU9qdVNpQzV1eFRkUDFrZVFO?=
 =?utf-8?B?STM3Y2VyaFNTTFBlVDBhbVlQZTREVEF3aUdNVUhQcWN1UCsvbkE4QU9Fb0hm?=
 =?utf-8?B?OGtkejNicHhGeHduc1JQMzNKY0RDcWROb0xrUC9ySEErSk5IdldqU2o3bDk2?=
 =?utf-8?B?UjltMnh1QUhNUjhlTFFvRG1wRW02d0VjVTh6UVpjQTBUdmZSTU5aUlBnM2ZE?=
 =?utf-8?B?eUl1M1FiemkrSG9VaklIcHBMd2hsQm9UMSsvVkU3c2tDdytaU0JsTlNHK3lT?=
 =?utf-8?B?M0ZkMWlHM0RIcDRKSXF5VnJDaG1ZRndUODNXQlgwcVNtZDhMdTdSSmU3a09S?=
 =?utf-8?B?MDQ2NkZQMnJyc29TdG9FNmxMNzhYRFM0U01UaHdqMzNqc25kMG04aFE1VUE0?=
 =?utf-8?B?WFFLOUxlam4zNEgraVZJeGJ3dlIrSE11U3E1STNXQ0JzWUhUa3I3bHBsM2xy?=
 =?utf-8?B?MlorMzNpcExLUHYxQmVwd3pTZGRlWUs5QWFoVXlqejBvNkhUMDJ0d3N2NDZW?=
 =?utf-8?B?a0g0QWlIV2ZtdXo3bWRSck9vbndtTTE1c1lqZDdyZ2tSZ3ByTFdtaVd5QVAz?=
 =?utf-8?B?dlFRaWZaNkFkMVlsVXFRWGZ3WHBSbUMzL1FFMDFXUTAxbDFOVmlFemNGaHp3?=
 =?utf-8?B?NGQ3d2twM0NnWXRTTUZQTjhiM2pURDhUeEVHVEx4akc2aXozUk0vVGVzL2wv?=
 =?utf-8?B?U1lEVmtTZ1BHY01ySkpkQ2tRc1pkUjRqSDEwcHVhTmN0L0ZtWWFQRjIxQ1pY?=
 =?utf-8?B?aG5JTis1aXA1SWJTSDFwRlV5UmZlaVkrdnovWHVRUzRrYksvZjZ0TmJFbSs4?=
 =?utf-8?B?cTF2NlpTa1lKK2VkT3hNM2lXVDNkTGMxZEgrbloyUk1HL3c4VWt1aDRXQU1M?=
 =?utf-8?B?WmNuODdZd2lXTEVCU3gySHdXSUIwUk80bmZXSVBuUU92aWoxcG1aZWYrb1hw?=
 =?utf-8?B?SkZCZnhWdTdRcFN0Qnd5L2V4TnkwcytQK0FQSHlSTEpsSHFTYVhnYjJvL0V2?=
 =?utf-8?B?VjluZEI1VUxiMlZPeiszZjN2b1pnYW1QcVIwZzluYy9DTmwrMno2dldFWnNs?=
 =?utf-8?B?MUZMMng0NmF0YkNmNEIyNENtNlA1MG4xcFNCNmY2ejd1dTc5eURvSWplYjZs?=
 =?utf-8?B?RlEwOVIvYkRwMjNFbG1rZ0JUMldZV3RwZmtWb0xYdzJGSHMyakF4R0FjRUUy?=
 =?utf-8?B?WWdRSHFJcnBpSU9XdzYrZ1BaMUVUOVVwSWtuaUhCTERwdmhqTnc1ZklwZzc2?=
 =?utf-8?B?Q21ZN3RRSGExUG1EUFR3THQ2K1ZKZXZKZkljSVVQWlI2ZUl6UE1oM3ZESEFK?=
 =?utf-8?B?UmIxNmF4VFlpQ0pHdU5DMGUwLysxQ0xBZlJhZElkMVZ6SVd2c3FUNnJsbktU?=
 =?utf-8?B?K0hYdHh5SGNqOGVKSVpXYkp4VmZiRHBORi8yc3lTSGpZMGhndUJRTnNQYi9W?=
 =?utf-8?B?eHNMaXpvSHphQ0VyejVmZmE4QzFleDZ2QlNXeEFUWUtTYTJKcUtLMk13Mi9t?=
 =?utf-8?B?TEo2UnJtQW0vZ2w0djgxZXZvR0dyTkNCRGhXRDJyZU1RS0xnSVVZV25SZXBO?=
 =?utf-8?B?N0pZc1AxcU43WVZqcVF4MVdLS2hmZnJZYjdKOE8wVnFZR1FNamxzNVFIZDBy?=
 =?utf-8?B?b3JqTHNrTVNoTUNnL1IrYVBOY1BFRjYxQmtLd2ZUYktvVzZsUkFhdmJqN0x6?=
 =?utf-8?B?Y0U4U3dPNWlpeWxsZTFjWDRGODh5ekJnZGJwWCs4Snc1Q2xSZmxTamFBV0gx?=
 =?utf-8?B?Mml3eEpRZHQza3RQNmMwbE9pTTFSaDF5T2FVeW9TdGQ5Z0QxT3djS3hVdGhu?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dff166-eef2-4ed0-a46c-08dd9e0e7135
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 17:38:22.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3aEhUWj/PX6XhI+9JhfU9+VYQyVD3LzX+7xUQJsN+0kFxD6y4ny6TuQZgAo+NUXI/0is+p3y+A0NHV5ElDkMExv//VIcea0alX0bOwAcjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
X-OriginatorOrg: intel.com

Hi Qinyun Tan,

On 5/27/25 11:37 PM, qinyuntan wrote:
> On 5/28/25 12:49 PM, Reinette Chatre wrote:

...

>> One issue I can think of here is when there is a usage where the user does
>> task isolation on the numa node boundary. Let's consider the SNC-3 example
>> again with node3, node4, and node5 on the second socket, "L3 cache ID 1".
>> If all CPUs on node3 are in tick_nohz_full_mask while none of the node4 and
>> node5 CPUs are in tick_nohz_full_mask then one of node3's CPUs will get
>> an unnecessary IPI.
>>
> You are right, how about this? First, obtain any cpu in hdr.cpu_mask, and then use the cacheinfo shared_cpu_map of this cpu:
> 
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 9337787461d2d..d43f438465ad0 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -596,7 +596,8 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>         struct rdtgroup *rdtgrp;
>         struct rdt_resource *r;
>         struct mon_data *md;
> -       int domid, ret = 0;
> +       struct cacheinfo *ci;
> +       int domid, cpu, ret = 0;
> 
>         rdtgrp = rdtgroup_kn_lock_live(of->kn);
>         if (!rdtgrp) {
> @@ -625,8 +626,12 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>                 list_for_each_entry(d, &r->mon_domains, hdr.list) {
>                         if (d->ci_id == domid) {
>                                 rr.ci_id = d->ci_id;
> +                               cpu = cpumask_any(&d->hdr.cpu_mask)
> +                               ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
> +                               if (!ci)
> +                                       continue;
>                                 mon_event_read(&rr, r, NULL, rdtgrp,
> -                                              &d->hdr.cpu_mask, evtid, false);
> +                                              &ci->shared_cpu_map, evtid, false);
>                                 goto checkresult;
>                         }
>                 }
> 

This looks good to me. Much better than what I was thinking about.

Apart from the items already mentioned I would like to add a couple of style comments:
- Please order variable declarations at beginning of function in reverse fir tree order.
  For example, above snippet would look like:

        struct rdtgroup *rdtgrp;
        int domid, cpu, ret = 0;
        struct rdt_resource *r;
        struct cacheinfo *ci;
        struct mon_data *md;

- Please align struct member names in tabular format (re. the struct rmid_read changes).
- Please ensure struct descriptions are aligned with the text surrounding it. (re.
  the struct rmid_read and struct rdt_mon_domain changes).

Thank you very much.

Reinette

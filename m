Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A6A1CD1E1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488527; cv=fail; b=DITUQaoL9CzlOZ01+ebBcc5xUQFt/C9xkKfTA0Of7ivkWFE+nB67ckgnZTUQ5Qa74bmiHeEDqvE8uNik+YTMkGeE9ySYBXj01hqJkL6G0iP9JqYinQmUQVcsSLeIvauagJOH5ygPvsOhTwM40/2CmQucWg5je0zEZ9lGaOq6agY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488527; c=relaxed/simple;
	bh=9DwYu+MoT7WgBMr2VlFpA07PW3IV0ahELaZm1DLbbIU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o3CFwkJfu87//c1Rr7iL+6H1KZCqJ9DYOAq89pRNEIML1hVRJZTFJz747XL/JQRU8ez89eVBR3IFKRo0dKvI24QEMrkhq3Cc3/tYNIptCUCu7M6HX4VHnJdoMnfzkYQbpIh4LyheEQpidRpPyGhWQeEk+Uvu0Go0MRx8BMZraeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMewyMSJ; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMewyMSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749488526; x=1781024526;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9DwYu+MoT7WgBMr2VlFpA07PW3IV0ahELaZm1DLbbIU=;
  b=QMewyMSJv73Ln0QVWfs8wnPlqOZwKdnwX/PL/qFjvgFz6qAqUD6+7qxH
   sEGLSZjIbCZZTqiw55a0vfHAQWArmiGGZzpqEdWSSn9rZhj1+VepzAaXm
   Bj0qf6eLNwTzGfhxr1q2ebEfLwa4mxX4i1iisYjIkDXXdrjlAKN9/D+7v
   UjHEiNte5XNVkWhmzcUd+te328Et8AUgoawYQDKX2T/cfdZyVi7gc5XrK
   RgVAX4m2X87NYV0e9g3on6lGdrvJPCu2hxny4O+EGlXFe7gIhOMS2rVH8
   ywGLK/Hnhg4Bh/puEE4UMCubOrcwYe2QqUymoWMbWpfSk/D32jO0C+CfY
   g==;
X-CSE-ConnectionGUID: j8WczhCLSK2iWZLtvwviDA==
X-CSE-MsgGUID: Qg5wyKBSTki5cGh35T1Dsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55365652"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="55365652"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 10:01:25 -0700
X-CSE-ConnectionGUID: v0TdIqYuQjyun/CQZx6wYQ==
X-CSE-MsgGUID: khphb/j2QzmsGGF1pP/05w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="150409530"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 10:01:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 10:01:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 10:01:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.49)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 10:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yN81zoty/XiCp2XzlTJWWHvEKIDD1DymIB0Pyx5q43tTa0gpW0YbRAPI+nMb9yaMuvDuEX/6ehhDX7FCoqwY3BcJqdC6s4ck9FMkBrFZkRIcTTta2UFuYAzfpOrAfdPhtmJs01wUFcnLkMfgX8lz+/5VwXVuPbDXKOFWen5ByMHlKEYFxm2Kp/8pbiJbwKvr5RciNp5PvDc8qvhVEEZtOwywogG92KMyGjKiibCX4/4MRUojbA+dQh+KsknTe5N/7Lq3Nz4otsV2RXNE3r1HzRjt7aOGjv4kzRZt7/Mq6INEWAqftYXItrM5/yxnZ72qUZHXlPfWrivO3aNWz0Cl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOraVE2u6sY6KnyIh8/POSUKbSBznSCe/MXpLosdcFo=;
 b=GuCt1MqzF6nbBW0FDp/nkGPWmihzd99bxAMT3/FfP9DUaHSlbsWJ82X/8Wa9W9NnDhkITwb9VoPS8qZGSOIyz12x+3WOxKeU4Yk4yeFlrWsyHCaSHyDv3JziXp+0sI11IDIL22+cMQ757yCEEudBdUVdZ7sOjL3QOwvFAfUTl5mFmZ2+Aak2UI+H6vhvGVRFS03ATyjEmkMjyiTHY1k2l6J5ZMIK6g6NftR8UQvtlKfm78jmafrIWdW4NmuKuzrmLg3y9ZnleVplvOPtaUM251bMVYhwJ45omU2iDcGO9fXSEBCNcNXK0N3btUkMHPVwbPXCfeHo3LQK4y7PQEg+1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 9 Jun
 2025 17:01:22 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Mon, 9 Jun 2025
 17:01:21 +0000
Message-ID: <ef1f0ad1-11ec-4f60-9803-81c9939f3df2@intel.com>
Date: Mon, 9 Jun 2025 10:01:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 0/1] x86,fs/resctrl: Remove unappropriate references to
 cacheinfo in the resctrl subsystem.
To: Qinyun Tan <qinyuntan@linux.alibaba.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>
CC: "H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>
References: <20250530182053.37502-1-qinyuntan@linux.alibaba.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250530182053.37502-1-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW3PR11MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7e27af-ffff-40d6-3897-08dda7774290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0ZRUDcxRFcrWXpNK0ZMQnJQeWszYkFJMExrL3A4WkF3NUVQZGJZZXZyUVc4?=
 =?utf-8?B?WUIyY2pUd3FrUWE3enkxL3cyWmx2ME5FTUdvcnlrbVdXNjlaZm0vVEJ3MVNY?=
 =?utf-8?B?Skg4engyNG5ONjNTNnJFb1JUdkhTSC95dW12OHVlVkNJaEo0ZVk3eCtLOUI3?=
 =?utf-8?B?VUIyTzRLS3hHL1ozbkJqaitDYUVhYVhQSGJwSGlUVTNlSk1XVHVodmNaRVl5?=
 =?utf-8?B?RlZOVGRiM01QNGt2YUU4QlRHRXVtejBLVTdiVHBWT1hsWWc1emRjdjVwbmlR?=
 =?utf-8?B?QnZ1OXVmMjhoQk5kVjZMWW1RR1FMU1JOYXZoNS94eis1WEloVWpIcTNrUzJP?=
 =?utf-8?B?VHE3ZHd0M1NVSDlZS3hpL3NQamxINW5SUUQ2cTVESWswekVsY2hudjQvbnQ5?=
 =?utf-8?B?VFdzV3VQWkFFbnU0aHZTMFZ1c3lUeVAwTjdtdVVkSjdvZFdCYnR0clA4Q0Vl?=
 =?utf-8?B?MlphYkVwZTAyeXZRN2U5dGsrTFdmZm1pS0FWMk1WaXVVbG8zVU41QjdXOXhv?=
 =?utf-8?B?cUFtZzYvVmJoaE45bUIyRE5ndm9pRDJJTk9GVEw0Z3R2bllSQ05GU3hLZ3pr?=
 =?utf-8?B?N3ljVnRMMnlidEI5dENxQ2NNbVlWdVRqN2FSZG1KMDcwT2owcHc1Y2FSM201?=
 =?utf-8?B?MkVHTzZ6M0JBRC9VejdFQUdvOXZRamliK3lmRjQ2ZG9qR1V5VnRvZklDNXVF?=
 =?utf-8?B?WXR0L3VsU3MvZnpuaGNiQVlhYjE5SThTR2R2V0tZNU9kQVVmSHE0LzA4OWFQ?=
 =?utf-8?B?bVliRHhmZDUzK3REZVlGWGxRdUZhWitocGF1OUFzdjZmUkdiRWlHN1hqVVdK?=
 =?utf-8?B?RnR5WFhwSGxwaXlKOWFBTWtoRTJ0SjBnQU1Rb21Ud2czMU5wRW10UGd1a0Vt?=
 =?utf-8?B?SHJWUjh6QklKZUxraTZ1REF4UVVpNXJKRGhUUVBSbFNhMGF3MmwzSXBhNW0y?=
 =?utf-8?B?SGM0S1JoN3AwY3QvcGplQ2xOcGZic0dzbUZNcW9YTTgwdEQ3eTdRWExmUHZx?=
 =?utf-8?B?UGQ3MlRFWWJlWVFVelIvUmNJSEc4a29rNzhmRHdEVENROEgrcWJRNkxzd2FM?=
 =?utf-8?B?TkhpNm1tVWF1Y3JhQnRCU1hiSFpheVNvTFNoUS9LZks5YkpzRUhOblVCbjlk?=
 =?utf-8?B?Z0RoOUNuTzBock1NZjB6NncwSXdzelJteEw0bkpYQzVlZW9uMzZXU0FLZEZQ?=
 =?utf-8?B?WnZBckw3SDdQa2JHT2ZuSDd0Q3ZLU09OeG91K2QzMWZ3MGdudXJlTkZGL1Jm?=
 =?utf-8?B?Zlo5WDVwR1MrNTRYZ2JJWWp4WVM0WHA5NEgwZU9SSjExMDJwU3ROdy9NZ2lD?=
 =?utf-8?B?Tm1iSTlQaEUzU1FteDFwZDF4dFFzUUVxZ2gxRkQzYWg4Q0tuQXh3UlhqMEQ3?=
 =?utf-8?B?cis1S0Q3SGJKTFB6c2RaY3R3aXFMMXlZV3F6TzNocFB0L3dLMkpuYVRySUY1?=
 =?utf-8?B?QjAzbFBQZXFocHI1SlJkaisvVnZBQ3pvT0hRdDVYTy9GQkJSck45eTgrUEk1?=
 =?utf-8?B?RTFvb1JGdVcxTlppYkFEL0M0VFAxaGFhSGk2dnJNa3FWbmRMbFpEQmxsZ290?=
 =?utf-8?B?U2g4ZnVPWUJ6dGdZSmZFdUtzaC9RamF3MnpZejNubW1MRzJQbUxQc1ZuZWls?=
 =?utf-8?B?MTNaYm1UTUIrbVhVUUdJZ3MzRDZibVdSK2tUNDRLQ3I1Vi83dkNKR0pUNENi?=
 =?utf-8?B?aElQbUNYK0dqZHJXaThZcFpKYy9WNmxteHJkeVZIZGFIZ01ieDNkbGdWcnRP?=
 =?utf-8?B?ZnA4Rmc5VVBLQ2N6MEc2N0JTSHlCOGhmVG1vWnpPMzNHRmlDMFdtdnRleGxh?=
 =?utf-8?B?YnZieTVwUnE1L3dLQXFuMmlHWUYvUHlzVk81VVg4NlVZQjJOU1hCekZpeTFH?=
 =?utf-8?B?Mks0dnZwUm9hSDliTG8wc2l0TGFubnNmeUtzRW80ZjQxMU0xamlHRFppOFU3?=
 =?utf-8?Q?1ga840LmEi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU9IVXZqWHlQV2QxeHRLTkdKdzgrUmI1Q0xUWGtLQzNwVzNRMFJOWjFxdWlH?=
 =?utf-8?B?bGZmSExNQkxjTDlPWGNSKzl2UElJVUZFOFZRQi9EU1MvYmJGSElvM1FpdEFm?=
 =?utf-8?B?ZHB4Rm5VaGtaVUF2QjdLeG1BUmF3QVlCYnhCVENyS1hMcHNGRDdWc3QwVjB3?=
 =?utf-8?B?a2hGN1M2Z2NLVUtHRElZbzFHNHkzdUlHeEkzKzB4UkZpTzFRV1ltTlFrOVRV?=
 =?utf-8?B?WHF4TEhsUEpFOU44dmZiamcrUEl1aHFFTE9yeEFaUWtjNEFjVUlIRDVGSUI2?=
 =?utf-8?B?dWlaQkkxOVhlZmZQR05ENGlQZmw2Z3M5aHVpR3FJb2ljMmVWdktvNFkvNEk0?=
 =?utf-8?B?bGhzeDBGTTc1OE4yR0RhSnNKSitVMHM3WlFTM2hOWVQrc3hUUHVkVStJbmVJ?=
 =?utf-8?B?djc0SGMxaWdkR1J4ejNWaC9LaDdobUR4TCtrcjBDdHE1L2NOZG9zT29pV2hk?=
 =?utf-8?B?c3NYbDFvcml4WTM3bi9FcWJQQUhiRkJGRmNOVlUvcWg5YUR2eTdDdHVPOEFl?=
 =?utf-8?B?RnFNd3EzMWZVRWIxeDY2SW5PYzdmcnNZb1dPZ2o4SXRYU3VJaklUeEtFYmxZ?=
 =?utf-8?B?ZUJJMW5tRkRpcGU1bkxYcis1cndPUnZ5UWpoVW9RMGNsYmZwK2RsOXYzOFU3?=
 =?utf-8?B?Z2kvc3YrM0R2bjBEOWl6d2RqQVRQbnM1T1lMMXExZC95eWNNOUpzVmZneXVB?=
 =?utf-8?B?dS9Mek9SclNVZFlpV2d6TWJLM3BRbWJOWTBIdVRPVXdONDdxUGtGWk1EYTJL?=
 =?utf-8?B?NitTTmhWRGRHYmdiSHZNRCs5dkpQNDZWTDlhb2tLTStFQisvb1JkRlBYd1Fw?=
 =?utf-8?B?RDJ1WDE1VVdJelhBWitleCtwTHBHM21CbjNYbVRRN2FQMmxEM1VFVWdSV1I3?=
 =?utf-8?B?L0VPc291Z2FqdmFsVG8yMWpuMVFPUk5yaVR1YThYV1doQ29wQ2l0SVFSS21L?=
 =?utf-8?B?VEg0ZndaMmZ5N2lHVkFKc1dxYWxhRk16NW9WZnB5NExJMThOWGE0dlN6MWJB?=
 =?utf-8?B?NFI2bkhEQ0RjRmVCeEFSbVp1VFFJNmlMeE56QmVwS1VRVEF1QnJHMlNRbkhn?=
 =?utf-8?B?OHRCL1ozTUgxdmxzY1QxYk5oNS9IRnBDbElwYXltTmdBMWpJd3MwVmNrSUxT?=
 =?utf-8?B?bXhPTXdlOXNxcE1KN3lUUWcvWEpxK2IwN2hJSmRodkxwSlZWbHo1bk91RjE0?=
 =?utf-8?B?UGdrTmlpRTFRYzViSm5rRFNZanRkdVpXdHFIUFNQN09PbXZvL1A1NE1hUVZn?=
 =?utf-8?B?ZExiRmd2d0dBZklRWWRkTncwMjA1ZGJ1dDJudXdiTlpTT29Jc1liWHpmQmtR?=
 =?utf-8?B?UU9LMTYxUWpad3htbEFtcEhMSzB4ZVZtRTZrM1FGZmxYeXMxSmltT2hFZVVZ?=
 =?utf-8?B?U2FNSGgwcUJlZUlWdFYwU2VuR0EvR3NzV2FHL1R1czFaN01HWnNHVzgwVGpI?=
 =?utf-8?B?K1BrMmZMaUgzYUs3TVQ1M3lYMFp6Q2FLQ01vSGhDR2VjSDJzckdxenlJSnVS?=
 =?utf-8?B?cXZXVkk1UldUVmI0VkdTV0lmZU5jZEdKWlZVbmk3YktFcDVJeTNObnBOUkNs?=
 =?utf-8?B?U1RpeTlybkl5Tkx2YTV2dldQZ2pUOG8xWnkwR1hGdU9seGsxbXVqRkdkVVpj?=
 =?utf-8?B?NmNzbDJ3MmRUQzJIMFNJZTJTU25lRkpkN0tMVXYwckNSMkxIZDVJVjJxWmZp?=
 =?utf-8?B?eGg1eUo0THRwRjVkZHhMTkZlTlAvSFlueVBNcXZBTVI4VGMxK0Vseit1bDcv?=
 =?utf-8?B?aXpwcXhiM1FTN1BzOXVSVGM5OUx0aWhVSm1WMjgzL2ZKVVFWYVl4enJPUXl4?=
 =?utf-8?B?dGVxSk0zbWhTV2xxQjZYTXlQRVB6Z2dEdU1INk5aUEdVVDBHNmloeEcrNFZt?=
 =?utf-8?B?czhEUCs3Mi80ekxhY3VmTStvUTQwMWpiZlZ3TTdxRlBXanh4dkFQL0Rwcmpi?=
 =?utf-8?B?dGNIL05ib0FJMTBqdHZmWWRteGhCL0pEbzdJdlVrSCtPQXBxam5QeXN4YlBv?=
 =?utf-8?B?VDhRb1A1U3oya05sTStHWXlrTjROYXpSWFl6a2tHYkZId1JoSkdiL0Z4Rkl5?=
 =?utf-8?B?cjFjNjR2UldBSkN2K0QrNC9wMXFVazZjVFQxVFZyVWtGdWJUMVJEZitpamJB?=
 =?utf-8?B?Uy8zK0lJZkY2Q29rc2czV3R2eTJFemdWVDFkeGRLQkVSWE1SU1dMTmk5WWZH?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7e27af-ffff-40d6-3897-08dda7774290
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 17:01:21.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+GrloiwKEBebtTqtWV4eOOD+KFnj5zH0xAd1RqHbeDZ0V/+cuWMbLIw5sBjpuGzSIuqoIm7R6p/PUVUVLL7GSLC8jFGwizLZ7XBIupNEts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
X-OriginatorOrg: intel.com

Dear x86 Maintainers,

Could you please consider this resctrl fix for inclusion?

Thank you very much.

Reinette

On 5/30/25 11:20 AM, Qinyun Tan wrote:
> V6:
> - Modify subject tag "x86/resctrl:" -> "x86,fs/resctrl:"
> 
> V5:
> - Modify the commit log format again. I am truly grateful to Reinette
>   for her thoughtful guidance :).
> 
> V4:
> - Add the tested by and reviewed by tags.
> - Modify the commit log format.
> 
> V3:
> - According to Reinette suggestion, modify the commit log description to
>  make it easier for readers to understand
> 
> V2:
> - Keep sanity checks in the __mon_event_count to ensure execution occurs
>   exclusively on CPUs sharing the same L3 cache cluster
> - When reading the top level event, obtain a CPU within hdr.cpu_mask.
>   Then use the cacheinfo shared_cpu_map of this CPU instead of using
>   hdr.cpu_mask directly
> - Adjust code formatting and commit log descriptions.
> 
> In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
> structure representing a NUMA node relies on the cacheinfo interface
> (rdt_mon_domain::ci) to store L3 cache information (e.g., shared_cpu_map)
> for monitoring. The L3 cache information of a SNC NUMA node determines
> which domains are summed for the "top level" L3-scoped events.
> 
> rdt_mon_domain::ci is initialized using the first online CPU of a NUMA
> node. When this CPU goes offline, its shared_cpu_map is cleared to contain
> only the offline CPU itself. Subsequently, attempting to read counters
> via smp_call_on_cpu(offline_cpu) fails (and error ignored), returning
> zero values for "top-level events" without any error indication.
> 
> Replace the cacheinfo references in struct rdt_mon_domain and struct
> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
> 
> rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
> domain. When reading "top-level events", select a CPU from
> rdt_domain_hdr::cpu_mask and utilize its L3 shared_cpu_map to determine
> valid CPUs for reading RMID counter via the MSR interface.
> 
> Considering all CPUs associated with the L3 cache improves the chances
> of picking a housekeeping CPU on which the counter reading work can be
> queued, avoiding an unnecessary IPI.
> 
> Qinyun Tan (1):
>   x86/resctrl: Remove unappropriate references to cacheinfo in the
>     resctrl subsystem.
> 
>  arch/x86/kernel/cpu/resctrl/core.c |  6 ++++--
>  fs/resctrl/ctrlmondata.c           | 13 +++++++++----
>  fs/resctrl/internal.h              |  4 ++--
>  fs/resctrl/monitor.c               |  6 ++++--
>  fs/resctrl/rdtgroup.c              |  6 +++---
>  include/linux/resctrl.h            |  4 ++--
>  6 files changed, 24 insertions(+), 15 deletions(-)
> 


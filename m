Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108AD25A646
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332300; cv=fail; b=PVp69aPeFBBpFX4uLh2p6i4RCPxcQN2vC5otobvP16X6njgHa+3EGInCBUnCHUsg0Cjrcl9+U6pylhA6VFtCYAR2FaSzU4ilmg/JXtMUvj1gLk7vd4hG84vh68aRYWFjWMcG5toFgS9BY6Dw3h0vvJpb/4o4mI6+mEYUpWz1/7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332300; c=relaxed/simple;
	bh=oRvvbtDTxlBHP4DzT894TZd/Az7BGsj4MvQs6FHRrsE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XF+avL958Sv7oPQFXqdzgBmMnXu8KLSp3xzkmuCxR7DXbyU0JOEbXbWLNSnsuG58CbaDfOEMxGuWZ/XLaEI+hhmr0l7CqvIX2DNY81Ld/CDYjEoZmmPacZH41FjExHNSsiZPrM2kC8y3KrJn8UBAsqtBbArw/qs2K0GTtW2g/VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ii/nZ2IZ; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ii/nZ2IZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747332299; x=1778868299;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oRvvbtDTxlBHP4DzT894TZd/Az7BGsj4MvQs6FHRrsE=;
  b=ii/nZ2IZurdIr2X0550VzRU6R8cuEViIN9FRrMBqkpJfFYYFsT7EEHLk
   EMs0DIH+kOpR3xz/09qzWpkrYU3POrNkBydonHwTasI+9iwhJ3dO6sGGO
   +VAO/ZsiqiOPykcqJTgrjNxzJMvk2/MEKgGZYwsZhox06xqa89rahDrwo
   xEZcG9WDB7T7ncC4GieOLNiN218xjrCdLMMc+ns1U91tO8CrIx9GQzzcY
   1OG/eTxkOqwj0TFSjCcuZzaCibdvC9pdYcN4e6q8j50+7NAP3o6lwRKqS
   Wjp4eFkjLOvZ+RakE0cl3TKNh34H/Rg3co6C9fq5nE9SI9dXhK4qUL0S1
   Q==;
X-CSE-ConnectionGUID: A7H4j8qaTs6v4Q5qQBaKNg==
X-CSE-MsgGUID: 03073NNkTrOa6SY4C1YBwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49424370"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="49424370"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 11:04:57 -0700
X-CSE-ConnectionGUID: RCbSJtyaRkq7vtfvmkM/zg==
X-CSE-MsgGUID: z4fGBjdzTq60Pkbamd9x1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143675894"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 11:04:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 11:04:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 11:04:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 11:04:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3NRlJJC3vyELTs184kWFuyUXdAGqDksjafiPdWkOXgBIodomj0F1oWdZYlcQXGLOOhw8XQd5Fgi0kfidEsD1jRVaX+FaXe7ZiVI7zbKEITSicN7IKjEpnUSweyQ053eKdLdxXhKsS7ki2Cp5yZz9/rqcZqiEk+T1s7D0xTnPpkyJmQJj9Ir14T6+IRzDh/p989VtzjmUMEoz0a/J54UmWkTl9E7c5jhF7u1D7JzWhGq9xuTWpvsj7BQTcJhWtrzGeRdytRZhdFzwlLP5YelE9BOVbCSd21AuKx9LjqvvaTTgqegelbqBsPY+IyVxX6IZGyh2JmIZZrmMsz/OO5XsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pI/ids+gH9UZcGSj2vuzdt8MkpudU55mtHXoeDILEJg=;
 b=TVu22BiFfwP9wOP+GPBSf9sJIyyDSFtIRqLmi6CCZbn9ndcps1SdB/WJkIrX9IH4Cen54UNUkb+xhafoiKyxauXxXfXC1sfTzFURljFzPNgauZbofpELihTRW7y1BVnBp10oQwv4x9Kk9sJ3GDn6ifGCfGt+v2Inf+QUK9ZGnc9bd1rMouusMH0Mn+U5nxVa9nNy+w5hV5wFFxSWvq/TODGwu5HKH0FQdNCWNev3lD5gWUdMnRVhf4UU1TcZqLCKlv9pk+BZGSL2+uboEC/crtBVOjUz6Z9I7gnujoZie+oxaVTTE7a6NeyIWs0GqCcRMlge+Rc4dxElyvkmAvPaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM3PPFE9989E69E.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 18:04:54 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 18:04:54 +0000
Message-ID: <cd9a0659-8d58-4b12-bb8c-b566c587c630@intel.com>
Date: Thu, 15 May 2025 11:04:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/25] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H
 Peter Anvin" <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250515165855.31452-1-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250515165855.31452-1-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::18) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM3PPFE9989E69E:EE_
X-MS-Office365-Filtering-Correlation-Id: da06c573-5780-4d76-abf9-08dd93dafe8f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWhVMUJRa3BJN09tZWJ6V2RNanFrbXN4TDBBQVFRSER5SWRoME13SFFvMEJP?=
 =?utf-8?B?OEM0RjJxY2FCS1NSbEc4Z0lyeHlTZXF0V3ZPZlVBZXMvK2tSbTBPUklkS1VF?=
 =?utf-8?B?ak5wckNzdmJZeU1WN01zV3F2WVdBL3BMdElXOEQvRkZLdXFIREpFajBXd1lY?=
 =?utf-8?B?Yzd4c2phQXo2dXlEblZ2K00vOU94RUpVNlQ5NWNFRlZlTnl2MmExNllzbTRL?=
 =?utf-8?B?WFBaVlNyYkNLR3hBUVB5TEY1OS9lWFBsQzJZTWVCNDBrZTdVVkdpYlRKdlhy?=
 =?utf-8?B?dzJtN0NWSmVkZDF4Sis1eGpaLytTcFNLWVA4VmZIR1lucmRGTDdZU2NmeE1v?=
 =?utf-8?B?WEFpeEdTbk1KRyt5N0hPR3BZUjNISUZvL24wUWRPelptZDdJdm1ZaWdjUTlT?=
 =?utf-8?B?S3YyaGZ2Rk50ZFN2VXVpSk1IQlBlVjROa04zRkFjdkRGMWZzTEpEaUcvZnZP?=
 =?utf-8?B?VGRqSVRRTkdDL1FSMUhiSDFJVC8vak5XSi85TlNwYUF5WTRQQlI3L2EwWVBD?=
 =?utf-8?B?L0NvWlIxYnkzMHJLKzBibjBnWXZ4Z2tQT2swaTN3aENETVNUSThVSGkxc3Zr?=
 =?utf-8?B?RlJjY293MnNqS05rNUhjSGt0N1c0OER0ZVBaTWU1MXlFMThpaUJXZFdwdVB4?=
 =?utf-8?B?UFprV3ZnckF1K1VDRzVoREtWamZGeENhbVZEVGtPY3YwSjQwbXZ5V3FhS21J?=
 =?utf-8?B?UmFhOTJObHBYamtuUmJVM203QTlhdXVCR093MkMzVWtZNDIvNC9ieXNRSlp1?=
 =?utf-8?B?RTQwSUVaSU1QdGcxeFBsOW9LeDlEdmJUZWtjRzh3ZVV3V0NWYWZ6Zk5MVFRI?=
 =?utf-8?B?cUdXTDU0R1oxQmhqMnplYkRWdGo2aUUrZFFHbHJhaWx2NkxjcDNRRS93RXov?=
 =?utf-8?B?dFdiZjFGSXA5eEwzM1AwcHEvKzBCNDJod3FaM2ZaWVZDVzM5Zm1BYTEweFhY?=
 =?utf-8?B?NEdmai8xWVNCRVlHT05VWDBXbUdtYldDRnVDZEIvZUhRSGFLeGljMzNwckYz?=
 =?utf-8?B?WVNrcjlibGxlUDE3eDRqZFNyaHlpTm4zamhmSjBBT3VMbUE0N0RqRTJEQWFS?=
 =?utf-8?B?SFVHRFY4VlpYTlpvbENSSDNYMUJpMi9adVhpaWhKTlNHaDNNNVltRENJblJo?=
 =?utf-8?B?aU4yM05qSWNUM3pSLzh0dEZOZEhzQ245Tm1xRGxianRpWVo1VldTQkFENy9O?=
 =?utf-8?B?dVhjQU5IbFpFNmFwY00ycHFYT2w3WHJmRTYzSE9JWHNVVHFYUG5NTmphT2tt?=
 =?utf-8?B?dkh2dlY4TVRNRnNoZzUrWW9QQ0w3QzMveVFuY3FwOVpFc0J0Y0pYaUsrb1V4?=
 =?utf-8?B?K2h3RU9TYzdBWkVqZ1d1Nk5JOUx4RVpwQ3pxTU45cUUzOU9NQnZkMGYwTVBm?=
 =?utf-8?B?djlBZVdLaUZHMnZ2ajdmakl1YVUyWGtuQm12S0U3Mis5UUlaN3d2KzZGMkJp?=
 =?utf-8?B?UWlEVmhrb08xUUtXcmd3dy8vVzVzR3R0M0k4NW1MTUpPL242OXgySnd0UDJm?=
 =?utf-8?B?blNIdVdCWmdxY045bUhKNkFHRnBZNGtBMFljYWhJaWt6YVlVT2ZlZ1pEWStG?=
 =?utf-8?B?NkFka013RDBWd21mdkJQRksrMFBPUDdTOVMwVVpiVmtDN2FQODZNSnVwcktV?=
 =?utf-8?B?RUVpVjRLdHNpVFN3em50ZnJrWDEzaUtvZmdWazhCWmdidjA5VWRFYkpUTER3?=
 =?utf-8?B?YlFYKzZyM2x2eXBVMjRXRlFJS2RHbEN6Q2d5RURMcDRPRzFBR09ZYmsySWJ5?=
 =?utf-8?B?b2RXNEs0Ymh2MzhRVjVWZlN0ZjZzSGROM1NpUEIxYkU4UlY0VHVVanl0Zzlo?=
 =?utf-8?B?RFN1RGJOV1NGcDhmY25sa2xVa2lYYm1nNWZ3UEVSS3VLdGkzQVpTVTlmNVNY?=
 =?utf-8?B?SkU4OHNHVkRKU3hCazNva2xlK2Q5am5neURYMWNuMWt0ejQxb1M3elRSelU5?=
 =?utf-8?Q?kaWMmQbEJHs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFV3WkJCV0k1M1dTWk1vWFZqN0hPVnlsYjZVWHlsbityeWsxdEhSNWRKcnBw?=
 =?utf-8?B?RzJ1VHllZ09HSUtST3dqS2l5M1JwZzhTTlNQNTMwVkhEelQzQU5Qa1hMUWkw?=
 =?utf-8?B?ZzFyWG1NVldjNjZJRVBidEhKc3FmVXhKK3I4bWhQRmY0S3FpLzZzcDZyME9I?=
 =?utf-8?B?VXEvS3ZTam1uWnNlbkJ1Uk9Va0hFbUgvbWhkN0M5ZTlCMEpQZFlHSGJRVk93?=
 =?utf-8?B?dXhQdTh2NUNYWHpZMm5ucTNOMWhOOUdYRVFaQmEzUVFTbjQ3SUNpa3NRakNV?=
 =?utf-8?B?MXhxVGNTVkt5eURpZ1R4Z1VvaW80cmNKc1Q3VDFKeWh6bVA4SUtHSHltYXhy?=
 =?utf-8?B?S3RYTkQvQjk0eXBqeEIxbm9HQStZTTYwaUQrNDM5SERwZk5qNnJmWENPdGhJ?=
 =?utf-8?B?c2JmUjFJL3hYTStEZlZoM2hMVEJwUzRNQzFMSkFLM2s2SEpycFN1c0FGcHA0?=
 =?utf-8?B?SXBrMnlCTVYvdytIa3NnZjJxbFJVUXdFOUo1OGMxNmlBeFA0RkJJUHNjL1Zx?=
 =?utf-8?B?Q0kvZnhVZW5RUHNqbDV0VWJ3bXpwVGlseS9KalQxNTRJN3QwS09YcTk5dkxm?=
 =?utf-8?B?TnpkQUwzNm9mSTRMSStSSzJZRmJhZThDY0xodWhabVBaU3dPTEpBeStMK0xR?=
 =?utf-8?B?ME5pM3B2K3B3K3F5R08wVEx2QjRDdkNRcncweHhleE0veUUxeUFhR0JNZzNP?=
 =?utf-8?B?TmIyZW1vTDc1TDhYSDFHWFVpUDAwcXhVYW4rRkRMbnJ1SXJyQ2hMY3RzUVZO?=
 =?utf-8?B?Q21ZbFFxbWRURHZrMzdicVBXWWJaZTRaZFVGcE1TWitnNms1Q1dNeVVGV0Nx?=
 =?utf-8?B?TGI5NktJVEs5RS92TjF6bjliVDRrYVgzOFJSQ3JCOStvZTV4dzd4cWhWelM0?=
 =?utf-8?B?SEtZeGJPcGhsT3Bja1hQeGx4NFJjdlVrNU1aNEp2T3dDcUJ3ajArN2NHc1E2?=
 =?utf-8?B?L05WWlpoVmdLR05RZHZBQXFsWVRBR0J5N1kvK2M1U0ViVElaTmxiVDBSajN5?=
 =?utf-8?B?MkRTREdZUk81eE1uU1plOFN3V3JwR2NZK2hDS21oZ0NIZ3QxbGx5M0xJM1Vn?=
 =?utf-8?B?a3NIVllIN1VzMGVSaUFxdTFNOGJvQ2I0eGxHS0dIWllhcVJiLzhVai9IRXVY?=
 =?utf-8?B?VEsvQ2UvN1kzM1FmY1p4a0lXM0ZHRHRrQm1NelV1TCs0TVprVkhvTzFlbVhr?=
 =?utf-8?B?QXhGRVFMM1ZHRE1RdzRoNHVRdThESmZtcmw5MVR2bklVOXpxUXlrZnNnMWJ4?=
 =?utf-8?B?cUd1TEVKbzdxMWg2cDRHL2ZjeEViUUthUjBXUUw0eDJPVW5EeitEZm5yMGRu?=
 =?utf-8?B?K3JtdTdmenMyNzA2MkNSTWlnM0RHOEpXTlZIZm5KdWVyclcvQk9wNmxub1BG?=
 =?utf-8?B?ZmVTaHRraURDWXBMTTl6Zm9qZ2JOSWl1VGc0ajI2clJlUUxTQTVFNTFSeldi?=
 =?utf-8?B?c1cvTEtSMFJVbzBxNk1TOXZ6UVVxeGFrdU0rS29zSllJMzZLVExvanpxdk14?=
 =?utf-8?B?bHFtaTlRUmpxQmh6aXZ2WVU1ZUtzYlFHUmJxcWl1SnRJY3BSUzB6YWZUZVBI?=
 =?utf-8?B?LzlqRnprRUNwaGxicmQ1RFUyT0Jsc3UyRFFiSUNzVE5oZU1QeHdNd3ptWWdo?=
 =?utf-8?B?bVlkSE1zK0xENDYxUDJtSmFhOHhFd1pXRDNyMmJGRHNiTFd4SDZLTHlvTzR1?=
 =?utf-8?B?L0xraEZtUGNDd1ZxWTc1K0tOS2cvNlVEcVBOa09EYk1Sd0VRaW1BUlY0TXQ2?=
 =?utf-8?B?UVBQTk42MDJXZkpmVjYvQUxKZHFiUnAzc1NoeGU0QW5Eb1hOL3ZZVkUyamE4?=
 =?utf-8?B?azFsVGFGc2xweXZQZTVoWkV5clhNY280b1kyaGpicVdoRTJCTEVtcE8zczlW?=
 =?utf-8?B?SU9qeXNHM2VWNUt5eEtTOUZGVVArQ1hsanlaWWJRQkxNSGhkQ3kxNnRRWTg2?=
 =?utf-8?B?ZzhtaWg5YndITW9ucmZMOXBmczNhNGJVZFh6b2hsemljNTE1U2NwNDBOQUFz?=
 =?utf-8?B?VnZDbzBNOFFNRjBOclAvTWhDYTRMT1plTHpXNlZiUEovcU1yclg3cUhiZ2xS?=
 =?utf-8?B?NnZaTSsvQ3M2QzR6aTVaTmJLTUFZN1ZsdCtHVmdVWWQrRmI0dVNFZ25NUW95?=
 =?utf-8?B?cXBuTzZkZ1NMZno1OGJ4ZWNIeEkzOElYOEpqdkVHNEp3cWc2d0ltT1hVNDVQ?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da06c573-5780-4d76-abf9-08dd93dafe8f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:04:54.0600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAqLFRc2/iAnuqADL4rGCm5E+uR2Bv7o+2fijpxoQhma+JFlV5CFzuiW8AD/kK373yO24rFTE5SVfv1U4KANU+Tzv16VZVwhSP4+WiZC8Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9989E69E
X-OriginatorOrg: intel.com

Hi Boris and x86 Maintainers,

On 5/15/25 9:58 AM, James Morse wrote:
> Hello!
> 
> No code changes since v11 - this is the 'final' form of the series
> with patches v11:24-29 squashed together. See [v11] for the breakdown.
> 
> The first four patches are a series from Yury which I've rebased onto.
> 
> This series is based on rc5, and can be retrieved from:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v12

(mpam/move_to_fs/v12 -> mpam/move_to_fs/v12_final)

> 
> With the exception of invalid configurations for the configurable-events, there
> should be no changes in behaviour caused by this series. It is now possible for
> throttle_mode to report 'undefined', but no known platform will do this.
> resctrl_exit() is now something that can be called, but x86 doesn't do this.
> 
> The driving pattern is to make things like struct rdtgroup private to resctrl.
> Features like pseudo-lock aren't going to work on arm64, the ability to disable
> it at compile time is added.
> 
> After this, I can start posting the MPAM driver to make use of resctrl on arm64.
> (What's MPAM? See the cover letter of the first series. [1])
> 
> Bugs are still welcome!
> Thanks,
> 
> James
> 

Could you please consider this work for inclusion?

Thank you very much.

Reinette



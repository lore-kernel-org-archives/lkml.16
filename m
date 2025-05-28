Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C263F1FB3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748401197; cv=fail; b=iwJbcpIAtNky8BQVo3uU5GjpmJJ6JVUSqyEikQL0LTrj6jap6+IlUHuq5Faakmk0VyPT5OQEUQXjKCUuEZ59vJ+B++exNkLqzVtlxV+i5p25QU6y7cI8qGOvyB/Dy4KUnpgC3MqGBGeeUmTivuJUBYPKFCSbgV351H2jE6k2eOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748401197; c=relaxed/simple;
	bh=YqtqWRZTWOeWyeV4XKBICUP0UOeuBBHDTXmKbIqkwdw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DJ5XnZMR8gpkItAzSnedpviuQzCuCi33+vM4rM19Yj4JFs2Tb+X+3tJ1G6Eui0aqTjdac25YU9Brtee1mhJHpvgKJiP/X7xvd03d7wNVxMJ1m3S10DbUlnDIdSNIk+7c541eTscA3oTAHouCiPjwl9SnshCZF2llEmDQtIeloyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0MaCqvT; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0MaCqvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748401196; x=1779937196;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YqtqWRZTWOeWyeV4XKBICUP0UOeuBBHDTXmKbIqkwdw=;
  b=k0MaCqvT5idSvSCZ2jYCnqpiF9Aav/Uv1yAgrjFUfSim4FvRwMxzv6fO
   s33WInDCYuHJYlgF0shpOZGsfUcYgl8H/Aa/kXQyeCplI5ZmPJ3SUVUw6
   o2QEzeQPNKZeXqcEtglJf9kyFAuUyymXDX9mIg8JVt5MQsLTQeCQ05XGm
   W2x+yiCGqKgYoiMhNk0wtRHiIR5xi7eF19kuWZewkZhuyJGrj2q7VNAMd
   Qv6J2upLcc/hke8yPlDdKDaQJEeLML1H6LdeT6kWYayJ8r2oHsBHCpRFa
   mW9b2qo0xhMRxWAIigkKedmXCtkqewEgzzzmHk+y8wECnsifG9URojOKQ
   w==;
X-CSE-ConnectionGUID: fBgqTYhZRqCG6k7VoNenMA==
X-CSE-MsgGUID: nCN4DKXPT2qEtvh8rXfxWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50570145"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50570145"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 19:59:55 -0700
X-CSE-ConnectionGUID: pXy9oh0FRDGqwaAIiaLuKg==
X-CSE-MsgGUID: XVF896Z+TVqENu7yDlCAqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="174066990"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 19:59:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 19:59:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 19:59:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.69) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 19:59:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2wPfoOz/fSJxxW3riJKJDZn8NViU+xjrEfltj+HBGOo9ens6ipgVQzLk7M6RcyRXIbKlbFy74EPn2aYTX2bW4qiaoavS+5o+chD1xhN3ifp3Dtb6chM1b2e8khPVrhaWyhOuReYKlStQuOvig2UDQbK43mqhVl79D0zOQrLwnBUNH2M3NP7XZleMKvK9mtK9SP8WL+pBgFf9Z3F7QzWFC9e2cZPFvcg6pnS7OpzXa8dmcBKfyXWWMSn6bw1yPGlal+lYTd+a8UIJjOb6mwvnucdt2GaRFnKQKu4lHXUN3upsu5On2nPDRtF+2SuBeq+vcEkL+XDvRef2zsVFyUFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTkJGzqtOjdtD16xcRdIxvOm7X8dHp6cwjxQUTWQvNc=;
 b=tQvQ4ULNIEwTyKxQYPgnVAg3c/tin5Lu/3WAnh9n67RulY8SEDfjH2/ALra/K6Ub38yifRxIygoBhP0LOAAKRQ0aAUTPqW8v+GehtrqQcxcMJPmgKEsDYG4+N31TppbrAWKBvZQiZR5VKh0Tpy8G/SNp6bPa5Hgf1af02Q0B/l45auSUIpVBNPOr4Xb982iNOLGPHS8fU1qMHMcc1X0629iYSrPYAAYOc+6BfTeYVEQRczSEVWRTz1E9ThW8s5t9mA05Bfovujf7f72hO6tbV7+jEaQxgklj6Lt2lZlJCSefmQo3zYYnYiT0Inb12g8LEQ92ulcsL6Jhth9F7voMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8564.namprd11.prod.outlook.com (2603:10b6:610:1b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 02:59:52 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 02:59:52 +0000
Message-ID: <45091ad1-e366-4c56-be94-e15c693da520@intel.com>
Date: Tue, 27 May 2025 19:59:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/resctrl: Remove unnecessary references to cacheinfo
 in the resctrl subsystem.
To: "Luck, Tony" <tony.luck@intel.com>, Qinyun Tan
	<qinyuntan@linux.alibaba.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
References: <20250526073744.62520-1-qinyuntan@linux.alibaba.com>
 <c4382156-a51e-4d07-9ccb-e6db2ca9d719@intel.com>
 <SJ1PR11MB60838CB8BB51EA5B7B9261D6FC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <SJ1PR11MB60838CB8BB51EA5B7B9261D6FC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0076.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::17) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: a71651fb-7206-4274-fe5a-08dd9d93b7aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzZvbWRHWiswTk05OTI1YTJJUENYb05FbEdGUC80Nnkwc01CQ1J3RjBXd2xt?=
 =?utf-8?B?Nk5sSDg1a0h0U0lEaFJ2TEwzRExrTmRnbE5TWGxUc01rMkplSTdLSGNNMXhE?=
 =?utf-8?B?U292MmpFZmZnS21WODhIYVdrdlRoMk9LT0Z4VktJZjN6RzM3aVQyZ0JEc1U5?=
 =?utf-8?B?Ykduc3hXazl1ck5GTENVR1FPRFhtR295OFc2aGFYUDYvaUlYeGFUekZ3WTBn?=
 =?utf-8?B?TEtpWDFUdk1qTy9yeGpXSGdoeHc3cEdNaEZVVkRWSnpsOXprUnRVVXBsUk1U?=
 =?utf-8?B?ZFNEZWVibGdkRERvUlV1bXFzWTFoRnR1bXpJUi93L2dvRHNXSmtyR0xIS251?=
 =?utf-8?B?MXFRWTFvSTM5dTl5bWNQQmdjSlpXdXV6MFpmSldoSE05QVNLUFFMcThDZmYv?=
 =?utf-8?B?OTBmS3ArdWRkQlhlNVNIUGRiUUxqV1kwcU1wVkFuZ2EvUDdvVVRBcnRQU0ZO?=
 =?utf-8?B?QlNXVnJBSG1XVjRVc3p0aXJkTDZTMTdxMHc5STBVbkZsekRYNmFjU040TE1k?=
 =?utf-8?B?aWdGU2NTVlNIT2Z2Vm5ocDJDTnBxMFFER09BS2orRDBTNVMxL3NxRm5Vdm8z?=
 =?utf-8?B?ek5vOXE4Tzczb2plL3g3WC91TUwzRENuZ1dOUFArN2tIVmQ2VHdCR2h4TUpT?=
 =?utf-8?B?UHZkdmtWcGZjTTZRMFFLQ0tDalRISnNxN3BJNnc0MjJ2NUlaZTNtRGhyV2xG?=
 =?utf-8?B?Vmk5WWtWUUFhQi9sYzJRaWJJOGFGbWdGenowNGVsdGdqcDJmVDhUVnVONjhv?=
 =?utf-8?B?NEM1a0E1UnF6YmYwa2ZxVWczYnFtb3FJUDVFWFUrRUlhSndGZW11WUNQcTNk?=
 =?utf-8?B?dkpjUmVLQ0tDeHliaWg1MFRkY3BBdFVQZWMrYmtWeGxEN2NJZkM4NHY5R05T?=
 =?utf-8?B?TWVGbWxrUzNsdXkwYWwvMW1NbWNtQ25oUjJYVGVjajZ0L05zSGdvTnFpL3Bl?=
 =?utf-8?B?dFp0b2dDa2lqYkZUVkUrUlZmWm9zU0x1YW5xUUhDL1pobHBBdzdDY3VMbmFP?=
 =?utf-8?B?SXpwZVBpUmt5a0kwSzV1cjRwTE1ob2RoY0FOYm5INVhvWUtmL21aTVNMODlJ?=
 =?utf-8?B?dXA5S3R4aVlZK1NGRVJNemtVMTNXejRFalNSNEZCRmpWWEQ2ZitmTGE5UE1U?=
 =?utf-8?B?NVE5OE1yaUtJQVVsR0VPQ3FJRW5EQ05sYUFicFNXUURZWXdLUDJCU3E3cW5n?=
 =?utf-8?B?SCtYWCtzZjVBTkpwZjM4NTEwei9QYVNKNnNCU0FWNTh3ZHVVTWdTdDg1VzFv?=
 =?utf-8?B?YlFqSEhaT251QXJnbjBDNUhjenN2Q2tiRUhuc2NhbUZQZ3pETW1jSnFSN0hO?=
 =?utf-8?B?NjkvTm84cG1STTM2QXVoVVkxSjZrc0RCL3VsUGw5VEhTTHlSa0hKVk9RTUZH?=
 =?utf-8?B?Yll3aDR3UEsyWVFvQmFYNHNVUnRhNXNIV013VGFZOW16bVpUMmU4aFh4MmVG?=
 =?utf-8?B?dGptVFFmMW85R2VmLytQWjV4dkNkVnhKeWUxZHlzUGxOeWJtZG5xNkRXZ2tO?=
 =?utf-8?B?YnJOMDJmQkw5US9KdTNERFR4VU42UDF0R3IwcnJkTHJRMmtIWk1RNlZSaXlo?=
 =?utf-8?B?K2dRY1BlSmhpTS94NzR4U2hrTHlMckxwOXB0d2plYlQ3Z1c5dnNmOHlaMGds?=
 =?utf-8?B?endOdUxaSXYxSHd5ekVGLzRZZjdkZkY2cU5kb2drUzVSY0dQWVVKV3Bpbm5I?=
 =?utf-8?B?ZHAwbkZpdnRVb1huMlpTY2FYWEJDOU9ySmF2amI3WUVNV2FyRzYzMk1uVFFp?=
 =?utf-8?B?TjV4U0RrS2FUYVhCdTYvRFBVRGZNZHBRK1ZIRHhUZkl0OGgzQ3lZcWFDcTlJ?=
 =?utf-8?B?ZHlsUXQ4MGxDV0Z3bFNEY1JTMnVmd1UyVlZGK3ZpT2VZaDF4bXZuUTltRCt6?=
 =?utf-8?B?L3lYajhBYXJHNGlKRnIvZUcrODU3L1ZhVEFSL3VleWhYY2V0WW1McHlSVjhL?=
 =?utf-8?Q?lE+s3PG+Dv0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alNONi95ZGZUQ0RpR2NETG9HL1pnVTFUT3lUUUlUOU8zSGt1OGd6cUJIL3No?=
 =?utf-8?B?cTVNV1VISCtBdnNoSjFWZzh6RVNqQkJsVXM0UWtVMk5WNzVRYVZmQWdOSzR5?=
 =?utf-8?B?Y1FHcjZmV0R4TnprSHh5OWhkdkFLRkNMUlhZR0lHVHdzV0VOL3hWRUlvUzFi?=
 =?utf-8?B?OUtQWEY3TFo4UG50QTRMei96aHltWnM3WjR0NXQzRVpuajVqOTJVclpBOE5F?=
 =?utf-8?B?MndQTnNvT2ZTanJJQUI1Z2kzTHVlbUcrM25qSDhha3psQXl5ajNjYjhkbEdz?=
 =?utf-8?B?bE8wMFQvTEFiN3J6ZHJBM3ZaVk5hamtoRDZFREpoVHBVZ3pycnNrNGtkaElX?=
 =?utf-8?B?Vld6c2xLajE3L0g1ZUIwckNMUHdXbnVxV3ZSRmJiM28yUTNEVVY2M3dmcFgw?=
 =?utf-8?B?MFoxTDFCTkhwWmw4N1YwQUI3Q1NkTS92V2hZanlPZ1ErQnc3eTlSc2FKYy9u?=
 =?utf-8?B?VDV6d1JVblpZOC9jeWVKWk9nbjFqUmZkV1NUVDNmOHNhTFplalNJaTdGbnIx?=
 =?utf-8?B?QS9JSDdlRk56ZnZINnRZb3haVXNMcm50c3FlZHJOUkJpRTJWVnRRS2JDd01h?=
 =?utf-8?B?Zi9OVE02WUJ4K3lnTTFKQTFCVURFclk3RUhoc1h3b0JVeS9GblpoNHJseFFl?=
 =?utf-8?B?cmpZZmV3TzJ1ZkdJejF1aHJzSzIxek1aeVdNU2piTkVzSENOcjgwOE1mck44?=
 =?utf-8?B?ajg3bHpzQmk2blJYTWtnQ1J0R3lBaG1wV29RS3Y2aTdFc1hvRWQ1T011bFhk?=
 =?utf-8?B?dG5rWjc4dU5MNHpNdHpjY2d4aEhNRnpnTW00TG5jdFBPWnhEOW9LblhZZS9r?=
 =?utf-8?B?TnBZRndQaXdrNWdpdHBncHVHejlhRzR1a09SV1Y2bGNxaFd1ZnZWakNnUmRz?=
 =?utf-8?B?VXBMZWZpY1k1cjBUdVdxcUQ2ZytpY0dlUGZKdVNGZmU2Mjk1S0xVemxGNXpm?=
 =?utf-8?B?QUNxMXB3cXBSMGV5MU9ZSnc0QXFDcTRzeURiQitUUXpwa0NQTnZTSjRNeDdN?=
 =?utf-8?B?QkxRKzc1QURwNHZkK1MwYW9yNVlYMDVBaXR3OGNNQlRhRXVHS3dmbjRldC8v?=
 =?utf-8?B?VHUrRVNEdU91VW5IajAweVI3cElWakhPcHZaWWdrOVo0K2N6ZnVGTkFacWxt?=
 =?utf-8?B?Mis3akVQRXZMYVpwb3RUOTZNekJPTWMrV3U2ZGtKRE9ZaUM5cFJBQ0xGNThx?=
 =?utf-8?B?ZXp2UVZxUkg3d2tsR05vcU44d3NaSVRiUnFYMGgvOWFVb1Z2SWYzYnVMWUEr?=
 =?utf-8?B?VTRYZ0t3VUs3OW9pVXU5NTFoaEZBaVdidlBOMi9NTHRDdkZDMWkvUmZwWXlp?=
 =?utf-8?B?Umh5dXlIN1d6ZnQzdHYzU3lhbEJEcnFudWUyRmlUWDA2b1ZpVWNwQ3BoTWlQ?=
 =?utf-8?B?TUZxZitHc2NSMlBHT0N1bDJJOUd1UlB5dTdrSHNmVkY4bHNJbkp2S3lMSFFY?=
 =?utf-8?B?N0JyK3VGWHhIZFdUYnUxMy95aFFDVDRMMGJWemVwVStZdGRycnhZU0k5UzJu?=
 =?utf-8?B?OTM5UDZmdWhJSGJVUUU3VGFzc21NU3IwTWlONjdvTTNGOGcxOWdmZW5TM3BF?=
 =?utf-8?B?RGwyQlNuUEVRN0c2eWNmc1VLdk5VOFQvU2VtY3pkVk9DTHVQK0FYMVdTdVpZ?=
 =?utf-8?B?eEVjOHRuZFF0cWZSUVlrVksrdk9JMjExK1lGcElQTUxxL0xzWGNtSjd2dWVS?=
 =?utf-8?B?UXIzdXVtazlzc3RTYVRzWUI0dlJYK2UyT1Y2by9CWmFnQjJTaE1iTzM0Skpr?=
 =?utf-8?B?ZlVuYTZhUmlvVHdkOUM0Uzh2TUFHUTZVTGozM2E0NG1pNWQwWjVrUWd1c2JU?=
 =?utf-8?B?YjQvczJUdC9Xbm5DcDhoSkhuUHV6V3VrZEUzOVZTNlIyY0RnWkVsN2h1OGNa?=
 =?utf-8?B?aUt3MmNBTytKZmZFR3VQZEx4NTVKMWhERE8yUTM0ZEtHSUx1MHJkWUR6SFlH?=
 =?utf-8?B?SWdjMHprRE80UXZNeklaOW9od0UrMC9UZGJzQ0xBc0tacktNNm9yeSs1ZWJj?=
 =?utf-8?B?UjRpRkZFWG9HaXJlT3Z3czMxNnFJSWhKWFM0c21uekgyUHRUWVo2MXRIeWpE?=
 =?utf-8?B?ZDdITHMwY2E0WjFiai93QnNkTXFQVlZWd3dSRGJROVJGMk5qckkvQ1Q4ZXRs?=
 =?utf-8?B?RUUyU2U3czZOdk9KcFA5RzgzcDRsUjBaVWt3a01FS1pQUVRaTGtWQUxkSmtv?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a71651fb-7206-4274-fe5a-08dd9d93b7aa
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:59:52.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29Ob851XvCqsz3uB+GYS1oR46wHOYBhenw2MJXiG+spamZra5sDie6GlU4I7pVAQ7+objeRYtLvaPKUzRytVwOMhQ7KkNZg/UJO6CFUKiw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8564
X-OriginatorOrg: intel.com

Hi Tony,

On 5/27/25 5:14 PM, Luck, Tony wrote:
>>> 2. Lifecycle dependency: The cacheinfo structure's lifecycle is managed
>>> by the cache subsystem, making it unsafe for resctrl to hold
>>> long-term references.
>>
>> This is not obvious to me. Could you please elaborate how resctrl could
>> have a reference to a removed structure?
> 
> get_cpu_cacheinfo_level() returns a pointer to a per-cpu structure.
> 
> While it appears that those don't get freed and re-used when a CPU is
> taken offline, it does seem highly dubious to keep using one for an
> offline CPU (which is what happens if the first CPU that comes online
> in a domain is taken offline).

I do not understand what your goal is with this response. You seem to
both defend and refute this "lifecycle dependency" motivation/claim. 

I am not disagreeing with this fix but I would like to ensure that I
understand all motivations for it.

Reinette

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3453219259D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953460; cv=fail; b=ACMGJvmTzMIraFQ8GLf1qftOYA2d2t1ju+WzpcMfVat1E+wPaKxZhaPKty5ZXBflUTluM4jKwpQbfmAKHcpKcSYh9bs07Z/7j9DimglAy4EoCBbRdU1ID8Xt2zgDbIYs4JNIeRISiqAFJrDHBUGOxvuW/qOPzKLjra5Wfbzt86w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953460; c=relaxed/simple;
	bh=n1nQP+18Bk4nuCuI/FW7GsGACnI+wTu87WyGE9zwQuY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c3qbUBjKQ5r7EwxJ3zNM3yjaj7h+EMPbLYhQhV+eMKY5SDOgQVVnIuRRIdqxjrNK/YMQLM34QrYZFz08gs0X8WCn6EIfaQ82Tuy8rsUYQ7fzPa7uT+iZxAcAgbDSXGkiOw+vc7cK5V3kucpl0wdyy01pLK9KWhisByxHtSEO7YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKZHluP8; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKZHluP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738953458; x=1770489458;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=n1nQP+18Bk4nuCuI/FW7GsGACnI+wTu87WyGE9zwQuY=;
  b=KKZHluP8HTOBF/P3+HZcI9KLPIXEVWr0qxOZNrAT9fWJCiGXx7Wv6Gj0
   mWYhFxlJVG8RAzdDsT6tQ2yo+xNJE9Q4R0CSUWog2959YMPW4LDZm6xJM
   6KYLUo1vLFx4b9xQgyIJyPDu+/Rq2pqrNVjDmX6+ALwqbZWd9RNJ+lVmt
   MG5vy7SDiRYDMz4lGdiSGeZHI6ckNMBvHyNEHqY8kd6NCp2H1Dt0HR5to
   SXECig+RnIaQYvn1P86Itc8aAPheCH0rI7j0hibk8x3/gW1+L45tsIjht
   yZZmwXlEWqdbovruq22ZFuAqCbjB2InhTvc0cLovoDz+6Vw0XFPG93Pkp
   Q==;
X-CSE-ConnectionGUID: WdatMbVcQG2MyH0H3ccuDA==
X-CSE-MsgGUID: JcHd2SwkTsGustMV7VvCLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38802670"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="38802670"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 10:37:36 -0800
X-CSE-ConnectionGUID: zpqfB+CYSJWF0scWGCEWnQ==
X-CSE-MsgGUID: AIN2cNccRu6HDM8NA0sDNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116804110"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Feb 2025 10:37:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 10:37:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 10:37:34 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 10:37:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpWkqJ+gyQw4jrrZg0YUrfc6gkCDEtv1qZV6uV48QirJH7QOb10APT6vn3BhfdVJuvEWhen2zU4rRn5crfMp5pnsf02lROfmPoAcnctsBXWmcnvijfEffFOzvr3b8GhWgRrmzFRB8P5xY0TXr7a0ZPxv63iSCiNzXmGcAwALvdfsAAk4AkmMziV2D3w4fEWf4tlYMY5JYAoEL/8mx75nOU2d/BmxITnJ5X6Waxo7vdXyhcSY/ueSKAVKv/WX0drmCie3v97jAlAvhOHdIvOA18E+uAz4ZTt7AHfogu5cKrJInllJjcUOVcaW1c/5IiK6WeSytltsIHFv5l3+hZZFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1Bs0oXnvFiTTSukVw34aqDIiXdanPle+jQHc/4NVAs=;
 b=OhmGAeuh/giTHNJr3AKhHM2V8MfEfs9jiU7Knn5V0k/E5pP7Eyd3yG0RmtSdAqajQlq4qOo/DrBLcmjzr8yW+bMRQrAAUa8orjufEb29n37aLR0juqXYg7JQLSY/fN4bnIJWLDzD91IpIGuDy6/Trw43P/WjpdPKfulxmy/4ldQJCoIanNP7h6aavzZC8w6IjHCc4yb1DfeZnXfqdF1MBDycJaQ15LlFvUF66Jw1+Gqq2nn/4kU/gpbCqDhM7tvWCgWjJuhBvQ3G73+e/+QemntdYDGCcyQ6vFc17UjpSWt6vNyEQ2oHnfAyRJllFFaoZRayjkhZDcSPAggOXT0XAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 IA0PR11MB8355.namprd11.prod.outlook.com (2603:10b6:208:480::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 18:37:04 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%5]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 18:37:03 +0000
Message-ID: <b0cf3395-ed21-4f48-ab49-81c67f6a032a@intel.com>
Date: Fri, 7 Feb 2025 10:37:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] x86/microcode: Support for Intel Staging Feature
To: <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20241001161042.465584-1-chang.seok.bae@intel.com>
 <20241211014213.3671-1-chang.seok.bae@intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20241211014213.3671-1-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|IA0PR11MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 64259cfa-bf6e-430d-bcc7-08dd47a66a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0lBUThDSlNTU3ZQVC96V0FCUWdEVVFJNDRlS0hxZnRSVVJKWFNvMjUwQVlX?=
 =?utf-8?B?S0JYZldSYk5TcmZpa3VXU21ZTnRsTXlpYWJZQmFTRnlUSCtXcVRNMDkvNWVq?=
 =?utf-8?B?eTF6T3g3eHcvWFo2TjlJY3I3b0ZpSTI2dFJ4dkxoV1Z0ai9PemY0elBDQk40?=
 =?utf-8?B?dkpQZnhOYTQrQ1EvWThSZ3gwR3JrYzdhWjdicGlkekZFbm4zbDU1SlFENjNu?=
 =?utf-8?B?TTBWOXVzRnRad1hSSGFldUpyTnhRZURWR1lNM0hJZ1I0eEZmM1ZNdVFDaTZL?=
 =?utf-8?B?ZjlHYkZyNkNidnVtK0hkVGV4NmtmM1l0WHFoRk5hTkJrSU56Q21DWWFzZDR2?=
 =?utf-8?B?aHh2a3pIVkVDZGgvQm9YaUthRHcvYmZ4SmJPaVpuL3Z4bWJ1WkphUGlLbkxC?=
 =?utf-8?B?VXBSQjUzYnJiY1MzN2tLQnU5UWNvM1lHYVRzamYvSEVZOCtjbEhFZFhOSmVa?=
 =?utf-8?B?aXpleTZQM3dQT0tqU09xNlRxVUZZbW01Nys1amVYSVNYMmlVRUFWQUkveVVq?=
 =?utf-8?B?S1NCbFFOTkFxTndmTkhHdGNNL1dRODBvcDR1eld3ZkRiYzRTOVJ6YkY2UmR2?=
 =?utf-8?B?Rk1nc3F2dWN3VE5YcmxNbFFrT2Nwb0wrQVlDdmN5MFd1bUlDY01rQkJjS0Fs?=
 =?utf-8?B?dlY3ZjNIdi81TWR3RUF4VlFUZmd5RmhVV3FaS1pReFY5VWZ2Qjl1NklyTTg1?=
 =?utf-8?B?VXVXM21tNHpXRFlpVUkrNlA2aWtCZ0I2NHNBTlBlVnVWNVRKdDYyUmh1cTdk?=
 =?utf-8?B?bTYxM2piajRIVk9vTWpLL2J6cXQ0V0d5bWJTaTkwbWpJNWxTRUs1VmdCMEkz?=
 =?utf-8?B?ZVFHMzdoeisySGl1dXlZUHpzYWlvaFVwRTJDdEhFOVFkSHgxTDhDUVE0Yitz?=
 =?utf-8?B?YzBxNnhqU1FsaGI5cFEwL0M5RkFXR0FURnhObXRUb1FUTnRXdGhQUFgvTlBD?=
 =?utf-8?B?UGJYdzljVURSanUweER0LzYxS2dKZDBzS0RmNUlrSEJUbXZpemUrckV6Y0dy?=
 =?utf-8?B?T1pYT2tpUkc2c0czV1pqYVN2UzFKNTlHa0hBd1h6NDNUMmZWa1pIZ2lxeUp3?=
 =?utf-8?B?bloydjNYMVVxeU1sci9Qeml5bUtmUnNzVDdncy9sZU9DQlpmR1NpcGpycldO?=
 =?utf-8?B?SGV2Sk5VdzYyUERwWHliSDZQZXljc3JkdkxJaWE2bHN6WjEyNlFMZzVWR1h6?=
 =?utf-8?B?K3pSa2VkL0Y1R2crbC9pNjhwbDdQL050cDNSOEphR0NCelBaK2k2SVhNRDly?=
 =?utf-8?B?MjFpSTBRYmpTYjMvMnJIblQ5OVQvMkNkRGNJTm9aNXVBMkZHQXlQWDVwRm9y?=
 =?utf-8?B?OWVmTnhHQXNQandMOUJaYlpTcG45a0ozU0REWHFMM0s2VWlsN0lobGVCelZu?=
 =?utf-8?B?eVJmUnljVUVDV3BiRjhZZEpWK21SUTN6QWgyUmlvVUgwSTZtWjlsMUdIQ0VS?=
 =?utf-8?B?VUpNaWpzS0tvRlByQXZvL01PSUdWOHVKSXVjREpKMTRHZUNKa0haRUtGQzZM?=
 =?utf-8?B?WWNOcGdYQjRncm11VjE3bzJaTjlXQkcxcUJ4OTFVa0JjQXpUdDZYM2Vxb3pJ?=
 =?utf-8?B?dkpSRlZFMzhsTzVFM2ZxWk4rQ1FXOEQ4UnJzdWRWNy8yK1k1NGRETTZXM2Na?=
 =?utf-8?B?bUx6SEkrTkN6OWNqZ3pVVDRYNVEzdXVzNlMxQ3l1NVE4UU9SUVFoWXc3d2JL?=
 =?utf-8?B?ekxQNmFJQ1BBM004QmtkU0Y3NkJuV2l3OStmMVIzWjhKRXpvQTFLL3hyTUVs?=
 =?utf-8?B?c1ZIZDdyaDVEVDJ2Zmt0eWphQjZlOERHbzV2ckY2bDZuQ0JxUzVmMVR3RGN4?=
 =?utf-8?B?NjROZUwvcjJ3SFdmWUt2bHZhNUdvZG1OMHdsbWwxTHMraGdPd0luZ1RKNzN2?=
 =?utf-8?Q?jSxDzPYamQ9sF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXJTckdWYUJKU3hKN05lSjNXUEdHaWJLbnNhdU9LS01IYlUrYmRIZldGQ3dz?=
 =?utf-8?B?WVozZ05yeEhkUHNJaTF2eEdGUHF1dGVxNTAvcWN3UkluZmEyQmVmRHJjdkRq?=
 =?utf-8?B?T09kZ0JDcDREN3BVTXNPcS82bkNlL1BFeG5SQWJ1WnBZSVdLWi91SU1MVnJ5?=
 =?utf-8?B?MDY3aGZEc2t1QlFnMWZyOWNEQ1FJL2dmS2RvZWJ5MXRRYjNRVHpjTWp6YTFG?=
 =?utf-8?B?N1NnaWc0Mk5RL21qa29TaGs2TTF6Nyt3M3FKQThrMUU1Y1pQMzZuNWYxSXZR?=
 =?utf-8?B?YnlXdFRnNjdSVk85UzdWTmllYWhYWlFxWHlVR3ZUNGozUUo3SVJRUnZ5ZEt0?=
 =?utf-8?B?TVZZV080ak9YcUQ0WC9IbG1ReUlmRHhwMEQ1UVBmT0pvcmRUNDVpTTN4b09W?=
 =?utf-8?B?eTdnRkdvMnc0TGFYQk01bjgvYVpJR1I2ckNVR0h5Q1loUVU1K0MzVEFOeUxX?=
 =?utf-8?B?TEgzT2I5SW1rM0drUTNDYnd4UzJ1T1NDODdjK2VhTXVvWXVoM01EejNsUEFL?=
 =?utf-8?B?K3FVQ2xGNTNtL1hRUE5WZUlXd3RVTzBRWnNSNjhoMm9haUs5L2FwWDMwU05M?=
 =?utf-8?B?eXlGV3A4cFpvaDBac1ByNkVucFRxVFdWUzhXOVhncGZWaWt4WVdwa1c3ay8w?=
 =?utf-8?B?ZVRtTXVoRGpWOVUxdjJzMTFsNHdJL2dqdFplUXczMGlnMFAveWlaSTVLN0Zp?=
 =?utf-8?B?eEp4cXRnbnQ1YlJCd0pxV1lVaStzZUNmc0tRWDB1eWJmZ3VRU2p4a1c1UUJ0?=
 =?utf-8?B?dHpPcjUzMUxWaHRKWGlIKy9PMld6UU5ZVlZKc296UkRyMHNqUUhjK1dodllK?=
 =?utf-8?B?dytQVDE1cVNxemdVM1BkRk5NTGZiWGx6aVkyT0pKdXk5RDQ5QXp3UFRSdlZL?=
 =?utf-8?B?MnRURS9ZRUlxVkE0cVAzMk9pczBNS1F6Zm5LOEQxSGtKQ0hUNXRaVWZYY01L?=
 =?utf-8?B?TXlMdHUwaFdEamFna3JUUmhYbzdYNlJ1dFoyT2dTKzZWN0dONXVNbDlBbFZ3?=
 =?utf-8?B?RU9ERHlTYm4ydzRWcU9jcVRwU2RSYi9UQTRQclltNGtrUko2Wkc5QUtkUzNl?=
 =?utf-8?B?Q3N2Tm1MQjJ2d2pWRjVOQVo0M1M1NERaZ0FyT1RHZ2VVbjc0Yjk1amo1ZlJs?=
 =?utf-8?B?YVlaZFJzL2xzc1JIV1FXUWdrdUEyeEQrcmZQZXdlaVZtWGtYdTBqTkVBTnF3?=
 =?utf-8?B?U0hQWldwVGJ1N0pQdjFjWFYwTFhSRjdFZE1keTFtVTIrd0ppMDdLNG1XRXg2?=
 =?utf-8?B?ck5aNU92TFpFazFDVjRjQi9xVkFadi9YcEdaQW1LVFZKTnRHeVhLdzFLMyto?=
 =?utf-8?B?L250T0lvUWpZa2IrK0haRU1rWXF0UzJCTGszY2FpVWRHVlVhK1piTm5SNDdQ?=
 =?utf-8?B?TmlOWklPSU9pMGszVkhReGoxZmRrbGY1SzFtQSszUlJXd2d3c2ZuUDIyTGZ0?=
 =?utf-8?B?R3o2Zmw4VER2bi9YNG8welIvMFUyT1NxejREZHpVK3d2Z0ZkQ1hwMU9UYmt0?=
 =?utf-8?B?NkNrV0dUMmpZSzc3ZHRBM01ScWpWNENWcTN0bGJveDJFUk42R2I2K2RlUk43?=
 =?utf-8?B?RzNpYkFkVXRKZjk1NUh5MXZ2TWFxYjFZem1vSmFIay9aZ1RsZXhQdUo2TXR4?=
 =?utf-8?B?Sm01VUhURmJldkpWelRaNUttcmxUbEcwcS9VZXhKVjlOVkNZT241dFh3Rlcr?=
 =?utf-8?B?TS96TDFScy9WNE5uUDdQRVk3cisyMFZiemRSTHJWLytOY3BYOWR6a3BLU0Fy?=
 =?utf-8?B?MGhjUmlieG8vZTUvT2k0OVpmRktZc1BSaUs1M2N4b0U5L2Y3dVM5QXR0ZVpC?=
 =?utf-8?B?anVBZ1VFTWl5V29EazdKN0NKYTRPeXo3Y1U4T0dQeWdGM2dHZm9pck5pay9U?=
 =?utf-8?B?c3o0cjAyVmZiZm5xSnFzWTFCSTY3TllmYU1mSXQ1aFhqUVRuL2Q2SDBFalNx?=
 =?utf-8?B?NEF3K0RQWFJhK0gxbnY4TjZQWk55QmpnK3ZnM0NObXI5Wmt4bU13SWlpZEtw?=
 =?utf-8?B?UlduZlNWSjNoT2RKVnRmajlwdE9jRzVDT0gzaGFEZ2lTR3ZJSjhuVzBCNWs4?=
 =?utf-8?B?MTB1NkJkNk80VGtBbDNYc2Q1dWxCK1RCZEkyY0h3Q3FKWVVvM1dyNThGbUdB?=
 =?utf-8?B?QlZMVlQvM01jc2NlRmRnaWRwM0FSNmxMNWZ0K3N5dmg1NTJFbWdmUUxDNTc2?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64259cfa-bf6e-430d-bcc7-08dd47a66a8e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 18:37:03.8644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfyzDNSxUdkhEP6L08mQWpcd9SQPIa6QKJ5TxQTPrNCCqy/vq3ndup5OIMDh1Cw87mQUtZKwPN+cTNVBQOXIvKxL78o+JcRG00tu3oLp1ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8355
X-OriginatorOrg: intel.com

On 12/10/2024 5:42 PM, Chang S. Bae wrote:
> 
> This series is based on 6.13-rc2. You can also find it from this repo:
>      git://github.com/intel-staging/microcode.git staging_v1

I've rebased on 6.14-rc1 and found no conflict, pushing to the repo:
     git://github.com/intel-staging/microcode.git staging_v1-for-6.14-rc1

>    3. Staging Policy (TODO):
> 
>       While staging is always attempted, the system will fall back to the
>       legacy update method if staging fails. There is an open question
>       regarding staging policy: should it be mandatory, without fallback,
>       in certain usage scenarios? This could lead further refinements in
>       the flow depending on feedback and use cases.

While I noted this as "TODO", the policy part may require a separate 
follow-up.

At the moment, I’d like to assess its current state and ensure the 
review process covers details up to the mailbox handling logic, while 
fully respecting the maintainers' schedule.

Also, feedback from those considering this feature is highly appreciated 
here. If the series looks good, I hope to collect ack or review tags to 
help move it forward.

Thanks,
Chang

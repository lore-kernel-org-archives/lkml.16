Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A3F2376EB;
	Wed,  2 Apr 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602391; cv=fail; b=NTj2E7/Y/iVlkBCzA6oFXdJhslxNrAfRCFEOVFybEBa6zCYK90MbtTUIuWv+DwckhYxOhM3sKfGSULcul+rXgoA3X3c3gvA5EEGzrKkYPULJ4pfK/0kBFG6po5jUGCICDWICL80Ihw+z7B+39GfGlmvTFSNsWkgSvSO+GIUuAKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602391; c=relaxed/simple;
	bh=XaktJBz1OaWQgUiUFLDmC405qGiyzlcd4Ti2aTi9PmA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jG/RnI9YpcFCtfA+aCMSdxvZ15qTFafqeYW2cmCnTtE9Hk2JmTB+ngcEcGEj/4vMKFUXJeES5L4fjC/FG2IFtcetCIeS2OJe2ekXJpiCkJcWeqxMHzQFy+TQ3QcPjgwDtv1wslHQjSm6LcntBmXmLH47TvUvCikL58HtXNR/cjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcvkEfqv; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcvkEfqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743602390; x=1775138390;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XaktJBz1OaWQgUiUFLDmC405qGiyzlcd4Ti2aTi9PmA=;
  b=AcvkEfqv/gZp4A6gyxFIRnnoqxl/CIBjl9bUYnHIXd+LwZ8FmFO76Xd0
   b986/27byu/fpEeQjRFhRMmrnlhyCxK5N/jqtTqhkda8btVHwBO3HMDF5
   lpTtCYmcwpRMj8nKSbE1Yaw751XDvVP1IUH0YjFf0kjuE52A/V+F4wbUX
   GIfpekY1A+Br58s7oKx2nMR3WOrHosaAyd+PwgTS6lqaX82OFj5LfrXLo
   SWXlVVrzVs7wBv+hR7uaMUf8cqdizjPJf5Q+vdQovP/wgD89Jua5UwXxy
   sYmZWa8XMtrkaXtdqDPy8I1iFMBYTw+Y7IIc6Vi+o3TAWk+GRWhps59uf
   w==;
X-CSE-ConnectionGUID: O2d4LNZDRyKEhSnX0kDyRA==
X-CSE-MsgGUID: NVgYbbcVRsyeJDM/Zk/tEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44978478"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="44978478"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 06:59:49 -0700
X-CSE-ConnectionGUID: WVEUyUlmTR6q4kKRvK3mVQ==
X-CSE-MsgGUID: wSvyEjAeQdaL46Vns2uOUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="131902481"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Apr 2025 06:59:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 06:59:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 06:59:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 06:59:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxtjAHDxjOgPg1L0U48pQ8y8aDZKxRzezpF+72NqjcLAOgjBkp4nIMmo1jRz9/6vYKcPFZQoIydXL9DCDqYULd62J+ywQGCoDAXYB8dCdHE5x8iqrnAbtNc/KolTHbYao0yrj5GPdOPImy9fgXMAn9xh6fXsE5N4lNQtIujpwbFeYbzfC47LEynu/pHQWxXIuA7fTPhKVBXbAqy1W3uYhNCNQKPCn+7LA6rAjQRJktgtxatExgNTZZJ+Aq87p9/xPySN77r2ntNSpuXXt2h+tNV9Rxg6MDvXtHCwSMi7DA21xXEoUnHfA44NZEeucB7W7bx5cqKGSp/LeKhixhYSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QP5clmQrlijXN1uaLTGAePqnL8u55xc/iPYJ5gD4Rtg=;
 b=Zee/UrkuvSGoXXdZ7uZvO+t3Jn/xkOHdbuTM2yqR5Kq4yOobdG7Pmwdi1Ey0LLFO74P3TISEkSzymzV0kSCGkX5KpiECdGlcnGumnV/kHxcC+C3dOct1UA2bHK72QMiMlQM1N5jg9+raRkuWbMR3BxRMnRbBkPsa6QufiF7hYJV1TlBQVNiUvLn5voQof0JdaWOc+2p2Yc/PxkrE0tzTFxz2AjxSY8V8Lo/v3Jq9iAMZFD+2YPWFOP+fdy3oL2d7g6joFtoHKjDA08M3i6FDMtFWcOp5dJ9yFxIc6H4ltdCXi31vvcM6f6oc3266gOX99H67fE0uqryIckPdPbAVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CYYPR11MB8305.namprd11.prod.outlook.com (2603:10b6:930:c1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 2 Apr 2025 13:59:47 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 13:59:47 +0000
Message-ID: <95c39d93-f35f-4017-843e-e5d836f1b091@intel.com>
Date: Wed, 2 Apr 2025 15:59:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: Intel: avs: Add NULL check in
 avs_component_probe()
To: Henry Martin <bsdhenrymartin@gmail.com>
CC: <amadeuszx.slawinski@linux.intel.com>, <ethan@ethancedwards.com>,
	<jbrunet@baylibre.com>, <krzysztof.kozlowski@linaro.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
References: <20250401143222.30344-1-bsdhenrymartin@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250401143222.30344-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CYYPR11MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 535d4dbf-0d20-415d-a5e2-08dd71eea099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWVkNGxMUDYwblA3UTJwUnFXUXpaRnJMZWV4Q2tONEN6NFNlcXFpTU1QN0NT?=
 =?utf-8?B?cnYzZVVPV21nUUphaEdyTHI0NEp5aEFkT2Z2eFhNaTJHOUdpa083Q0NWT0xR?=
 =?utf-8?B?V1Z5ZTFESnFPSEtxT0gxSEdpRG9Zem5kMlNqeklXemZkYjkxT25iVGFOMFVu?=
 =?utf-8?B?Q24wcEpoS0s2TEJuVWxZT1Z3RzdiVHRnWEtMVklxWEVDL0V3OXJBWm80bHpa?=
 =?utf-8?B?TmZSc1RYRVNuSDBJL1YvU3hnb0ZzTG5TV3FwcTd5eFd1TGtaSU04NEUzM0tH?=
 =?utf-8?B?L0FtR3VQSjE2bFY2MXFnSWt1RUVYRExXNUhoWmsvSHJBRk95QkFCNitWTDMy?=
 =?utf-8?B?aVlSS1hWRjlFeExmSDNMUEFJVU9Fb0ROVHBGS2svblhrOFlmTmpJMTFNSy96?=
 =?utf-8?B?MjFjZ01GcTVHNCtqZEZ2eW9FSStGTzliaHN1YmcwaHpVVGNDTjBBL2Y3VGgv?=
 =?utf-8?B?OG5HbDRXY043dk51alhKZURmM0JuK2NkNURkV2Y3eEV5MFlNZzQzMmQzSjhm?=
 =?utf-8?B?elIvdDJWYm1wZVZIcXZjbis3VE8xRTNSME1yVHdwWnllVjR1VFljN09zQnJw?=
 =?utf-8?B?L241WlNKTmYwY05LT0Y4L0hsQmVRWlgrdWFoaDA1YkwzVFBMRmRTQlhMbTMv?=
 =?utf-8?B?SjFTeFg0US9xdmV6SFJQblBQQUtIMnRjY3BHcGgvcnVJV1VhbmpZZW94SThW?=
 =?utf-8?B?NmxidXZLWFhSdkdCZUlpazRTYzJuNFhMZ0dMK2ZVbWRaN0FhRUhZWEhBWFIv?=
 =?utf-8?B?Zy9JcXRwOUt5K21PUFlTSi9WZFdFenR2S3NMeTRJcGVzUmxiQUUyS25pODUr?=
 =?utf-8?B?OC9mV0h0dVQwd001NzEyNTkyYzN5ZDZCR1VUS25laWdtRXRQbDh6M2tHNDJC?=
 =?utf-8?B?NGI5VDJKSWFpVkJsMnN2bTNqdStBcjkrYkFlRnZyckdWVi9WVzhLdFNBeUNM?=
 =?utf-8?B?STU2Q05maVVvVzdQRmhNaStvWWJoZUFtQ2Q5bnhxTlc4Sjg0WHJwL1cxdTIv?=
 =?utf-8?B?dzRxSE1ydDdOY3hTL0t0MWNxaGFKTXR6bzBvK3BUL2cyaVAxQVZrNW5RYUZW?=
 =?utf-8?B?UnVlRzkwcFNNTC9lei9xekVWWEMzUWQzZk8wazJ0RXp0UldkaHkzRlcxMi95?=
 =?utf-8?B?ZjQ3K2VhVUFXY2l5amg0S3dvVHdoeXNoSXpCb3QzRS9DZ2t1dTZ0Q3dpOElQ?=
 =?utf-8?B?M1dUbEdXMlpwK1dETk13cUFvbENPSXVtTlpGSmtmZ1QwT2FRbHE1eGNxZ0tG?=
 =?utf-8?B?NHphSGFpY2hMMThhRWdjem5VK1pKbzVQdXVNRTlaTEw5TEsrNkRjOE9TdzN6?=
 =?utf-8?B?b2tFN2NpTGtvaGJ4QTNSbEFkc1NRVC9jSHJnRE5iMlgzN1ZJV2lkbUVRVkFV?=
 =?utf-8?B?czVJRHBIQ0FKRUVia3o5N2lTT1B5ME82WTY1ZGxYMGZJQlhVTGxrM3QyWFMv?=
 =?utf-8?B?YmNKVTVvNWsrb2V4ODd3TXhuMGkxQzZBUUZ4V0o0U3UvWFpZRkNmbmtVclVW?=
 =?utf-8?B?ZHVkYWhucVhFSGsxVFk2dzFQVGpJU0RpQ1FGS1VCdnFUTzJ5ZjBGL2ZqNk1a?=
 =?utf-8?B?Y2ZHVm9TazhBNm4xQ3hZTlFoT3BRdWVXWE8yQURzNmVONTU2RmttUmVPcVRB?=
 =?utf-8?B?NjE4YzJFRWtNN2tTcDJWbVYzTi9FNXdsQmtwTVJ6MTJjT1RNY0JYNjFzamZ2?=
 =?utf-8?B?Z0YyZmtpWjU2ZUpIclh2M3hMR0E5elUxRVZ6dDgxQjdzb01POEtyRDM0WnB5?=
 =?utf-8?B?YzBGclBsWFNwM2wyb3NacDUzQ1RQS214RkdSRmpRSnpGdnNTdDhGbGZkRWN1?=
 =?utf-8?B?MGJDOHYvUWIvcyswVEFGcEpsUHVIdEVkYk13OVVZcWJEbVVPYXJYcmMybW9x?=
 =?utf-8?Q?fbaFdSdG/vT3Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEUzcDBuNFRacldMeVhjWFhVSGNaRkdmRWI4RXk3MGVEdXhBZmI3L1RNdG9m?=
 =?utf-8?B?YlRHNmVFNXFWMGROSXF0K3ZHc1g0T2hxdzgwQjFTbHpmbEV0cDVYeGY0NEYv?=
 =?utf-8?B?bDREZVlEbUFJMlhPNXowLy9xaHhpM042ZUN1UTdoZmVkdldScnVvc2xxVWw0?=
 =?utf-8?B?eDluaUZRZXdMblFFNStydmQzQUkyQXhyV2N2aS9ZQ0ZaR29USU5EWnZ5cm9v?=
 =?utf-8?B?Mlg3dmViYTg0SHhYYW9FbzR3ak45ek9OUktPRHBqUE1BN2R0VzhZa2xLbkVD?=
 =?utf-8?B?czJZWUpUeU8weEVYRi8wcWZ4Qll2UWVmc2U1SmpxTi9pZUw2d0piZU1LNVdX?=
 =?utf-8?B?YldkWFlvRURBa1BDNTBKZEcxb0hOb2ZKZEVnYzY1OWswV2t2UTFhMVgwdXhR?=
 =?utf-8?B?YmFocmJmSDU4d2FuYjFHdU1WZ0Y5NnlTcjd2S0hqbkxrNWQ4bXVEK2JuenVz?=
 =?utf-8?B?R2k3ZXJEcHhVOVFmOXBCdFZCb1AvQUNKTURBenhjR1RGeEUwWGNucHdtbGF3?=
 =?utf-8?B?NTNUKzJQSlpFVlNKN0Z0N1FHc05saUQ2Z2g4VDZMVGZqUzRXeDhGUm9EcW9P?=
 =?utf-8?B?SEZkQXQ1TXV5TFdzUWdKUzhiRzBwam5sbHRDc0lHWktIcU1RRXdWcmk5Sm5S?=
 =?utf-8?B?KzNUdm1wOUVDMk9ZRlVDeC9hVzZ6NGh5UHZKZnBleEh1SGFGK1MxWXh3ODY0?=
 =?utf-8?B?OWhRQ3ZFMWk1Z3BRelh4K0FWcTI4RzlmMmZ1QmJBTUQzOWZMREhDcDdzQVpR?=
 =?utf-8?B?Nm1xc3JTb1BwaENZZVE1TlpIMmNkOE0vZzdvNWh2bW5lQjloMTYrakhNK3VY?=
 =?utf-8?B?UlFKVmZsOWRZQTJwV2J0QisrQmRWQkszREdjcmR1aU5ETkpFNHNySmlOSzFF?=
 =?utf-8?B?bDU5a1pyUDl5dk12VDJRVldKRlEyNUt6c1MxY2RKU01NWE4vQXRhWTBEeXJq?=
 =?utf-8?B?WStDcGxsbzhEallOYzhQSTdjTEpjVU1QbGY1d2d0dm5EL2I0cXhWdTlLdVM5?=
 =?utf-8?B?bnpIdGFOZ0MxT2xlZ0NFUVBvbkxGYlVGZDdFQkJSL1ZucFVDSnJja0Q2REVt?=
 =?utf-8?B?MFU4dy9vZk0vUjNtbDZkaHErNGNBMlNKTW1URFA3dDIxU3cxclA1cGgzWTBv?=
 =?utf-8?B?bnpQWWtra3lkOUZpc1BKRXliUm5CaC85b2U0cWdtQjM3SURIMkIveXpUay9l?=
 =?utf-8?B?eUhzYUgwYzYyeTVLNDdiQkxYdTMyOWw4bFMwMmpDZEZVb29hWUhnNUZ6S2lC?=
 =?utf-8?B?cVhyZUFQMVk0R2txbEVxZW9yNitadzg4dWNQRDRZeFpSWXExSm9TRFVVVjNy?=
 =?utf-8?B?SG1sTkowWWNkRHNjbVlSaEcxaUQ4MVJBaWVvSTRTNmx0c0hvNFJ0VmpMWFNo?=
 =?utf-8?B?eVBPVVlxZ0FGbTdnWHhJL3VUeVpBL1JhemVWREVhOFF6MFVzZVpBTlUxTGIy?=
 =?utf-8?B?dzB2YldyOE9aZmJ6TW9GZkZORHVoTGo0R3U2aE9OQXVUU2xDOE5uZFVOam8w?=
 =?utf-8?B?NnNBRUNJMXhheU1iTmdiU1lrYjVuaFhTd0t6MHVyNkVERERMZGpKMnlybklo?=
 =?utf-8?B?YmxlQnJTYjUyRnQ0UHhxNklGUmNRNnN2T1JsQ255Y2hqbVo3c1NuaGlPQW1l?=
 =?utf-8?B?bW1UL3hTWk5Kem10TmZIUXJ6aDg5V2g4SkpobmdIQVpkaERib2pSa2hqbmRM?=
 =?utf-8?B?bDBkSmpqQXlvcTFWbDR3SE9LVnhEYlZtQ290TzBtOEJ3UHRxeVBacVg5YVMr?=
 =?utf-8?B?ZVptWTMwcC9qQ1RXN2xjVUlWTmxjdDZNbitFaUpIV1Y5enlsb3NPb1lqY3ln?=
 =?utf-8?B?bS92cWtGN2M5NHpGT214S1MyaFE3UHREVCtlRktjMHdpcm9OQjRPV0cyMFdw?=
 =?utf-8?B?bVZwNDhRU29PUDhvWExRTHFPWDRCK3hFUlVXbUlKNHNwbWZ4SzBialEyamJE?=
 =?utf-8?B?REhjZWJ0cUlRQ25OZVY4aDhRQ1daeHBDNE1KZkk2YURkNHBnNEFJVUtnbjdN?=
 =?utf-8?B?a2crNG1IbEt6SFdPZlNJYkxBdkxTM1RwWktUcENyMkt2Wk9pOFhlYkRuaUpP?=
 =?utf-8?B?QlFJRExBUUc2aFhmTUwySncyL3l2Q1R4YmpuQ0orT1hmc3pkdDd0bjlhVU9w?=
 =?utf-8?B?ZlJubUE2aVdSWUpXTlFiMXh2NUNxL1BwTTF6SVJGL3VXUm5HU3NtT0Nnck1P?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 535d4dbf-0d20-415d-a5e2-08dd71eea099
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 13:59:46.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNyAQzdTDy4TZ3AeOKAUAyPt5FNWlWzM8nbL19LTyf77m6pevcEnJVihLBe0Tz6Z+uYlHalsKo8D2Payg55/YL9SgdGZYOaUWO9bKurxC0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8305
X-OriginatorOrg: intel.com

On 2025-04-01 4:32 PM, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> avs_component_probe() does not check for this case, which results in a
> NULL pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.

This basically repeats the title, I'd suggest to drop this very line. In 
regard to the title, I believe:

	ASoC: Intel: avs: Fix null-ptr-deref in avs_component_probe()

is more straightforward. That's what you're doing here afterall, fixing 
stuff.

> 
> Fixes: 739c031110da ("ASoC: Intel: avs: Provide support for fallback topology")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Good catch, thanks for sending the fix, Martin. I'm rather strict when 
it comes to wording title/message but nothing more than a nitpick in 
this case.

Whether you would be willing to provide v2 or not, feel free to add my tag:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> ---
>   sound/soc/intel/avs/pcm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
> index dac463390da1..7072bcf4e56f 100644
> --- a/sound/soc/intel/avs/pcm.c
> +++ b/sound/soc/intel/avs/pcm.c
> @@ -927,7 +927,8 @@ static int avs_component_probe(struct snd_soc_component *component)
>   		else
>   			mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
>   							     "hda-generic-tplg.bin");
> -
> +		if (!mach->tplg_filename)
> +			return -ENOMEM;
>   		filename = kasprintf(GFP_KERNEL, "%s/%s", component->driver->topology_name_prefix,
>   				     mach->tplg_filename);
>   		if (!filename)


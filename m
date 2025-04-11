Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E8822069E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744393074; cv=fail; b=tX+FTV99/a6+y//U9jCL6F2PJoEd/9e5YLmfDOz0EDfXN1DRjecG5o5Nf3wZgCigaUDnZz38NelN/S2Rh6V7osBtU2tTvgclCwLj4SO2Dc2yeniEQE7bJe4XWqyDF2GlVoK0u8gqLAUqpCOLGZZzXW3rdKMMjEdjquoVG+inrGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744393074; c=relaxed/simple;
	bh=Uca2GQR0IhtyRZp1UBX1U8rG48jrZsCCOARCOgJCb8Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iCghEDEbachky/+GfUfBwM4CXO7sO+hiSVRgkF560CbuAkaTdnJdLOXa9Rr4IbWjv6fHOM86v8DMhuwCzJ0S2IRrWAyD5VJhcEDglnE0XEA77+wggizwJ4pDi5HGIAF4Ao7fML8o+Y9J7BMwkbLBzimmM1ykiqi33p3eii3PFN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5k71+FK; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5k71+FK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744393073; x=1775929073;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Uca2GQR0IhtyRZp1UBX1U8rG48jrZsCCOARCOgJCb8Q=;
  b=e5k71+FKfdvI07OjOiZ9SRql5Tm8OrHbNvSi+sCIE2smvwpUqmXdvlQe
   eusFcp+RNFrEeWPXyQX1pVzDrbaux+IsBR0XtuBXpZGz5fWZ1f/v6r7f7
   DeuJGkaCxURCW/5NydPTjMqNAw7ZvbBuX6Ns7mzvCTnZn0asNjuEPTC2W
   NBED/1NyHb9RYYr9eIWFEMUZRT7p4Yn9WJmbeP/RIIjsZnefFCg7zs/jm
   cl0whKPuZQW+zrC/3atUY9uvRzfN2giRa1ckxc+5qyw2UtDkgh6+lXZRI
   zCMeY0wXcwu6YD+1v2ZVsByIfwUXWGIXXazG66uOuc7oLa7bWWUIYfWgU
   g==;
X-CSE-ConnectionGUID: uW8uFZ0GQ364tMzjDMlLMA==
X-CSE-MsgGUID: eKo9OXHYTUGtry6eviH33g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56935962"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="56935962"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 10:37:52 -0700
X-CSE-ConnectionGUID: z2/qPnD5SGqMVvNr3Ap/4A==
X-CSE-MsgGUID: jDoU68nKTZOUQhbmlTnD7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="130087116"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 10:37:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 10:37:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 10:37:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 10:37:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKjB5kVWqw9Hpl3tnS3yFr1ah2OR3jV1wj2nfr/PEvf2EsLA7B9oxOaaf7BZg48XgGaMNt8wQp3KMLt0NXTSlR0hhGcVMK/M99Jvy313ULsteHTZnH2XyNatLEPC4oxLn+sf105HUEs/6kkwdkQe7tf858S/im2AknesX6IEvvoknkqsqwV+rHl9ijxO2dNDXBgZn8C4c8/U4XAI5flJPv4VsZzBJcsYClRIk3b3CQAWNq0dr1ioJSPL/pqyTI6N+BslHxN4QTKkTy06KRluCWakqAICoLFAzoS1AgjP3qbeBBJ39kROoViCIkkbyIIHvyUyEMDo2toAf9oCitztUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dlz/kEiFdi7Ma/CFHwrBURysNyq+/IyTMLHXQzV7Nwo=;
 b=dLBdVsvQZcDp3rWyoRhIhpEvEpcc4kQ1bfRXdrGPl7V5GYMpahkN4oRGlYdVnJeYC/UKG+wco4R4nPHcBlIj5x5eLUyyYU4ls3DXTBSpt0lQ8q2gUbm7vfEtNXh75qgb3ROQat2vsWWikVXgmr+B+NPk+iKAYIizwnvtAA+YfWovDtKROCvnx0HB30laqEXzc1tAed+MEGKllvbdqN+3gzA/n0UNrzYCfOiYK9twVxelfGgOzimxSi9GimiYqsxHrCQjXvE8lSaeFgpj15Bz4eD84GK/exMxFUPFs0EQMqqxkTYQd1CD5Ntoy0MKNj7lZOEkhY+h3zqmQ18rZ58NRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6269.namprd11.prod.outlook.com (2603:10b6:8:97::14) by
 LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 17:37:41 +0000
Received: from DS7PR11MB6269.namprd11.prod.outlook.com
 ([fe80::af1f:dcc:49bf:1a26]) by DS7PR11MB6269.namprd11.prod.outlook.com
 ([fe80::af1f:dcc:49bf:1a26%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 17:37:41 +0000
Message-ID: <7d1330e3-a0f0-4a4c-a487-46304822e0fd@intel.com>
Date: Fri, 11 Apr 2025 12:37:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] x86/tdx: tdx_mcall_get_report0: Return -EBUSY on
 TDCALL_OPERAND_BUSY error
To: Dan Williams <dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
 <20250407-tdx-rtmr-v3-4-54f17bc65228@intel.com>
 <67f601e35845f_720529475@dwillia2-xfh.jf.intel.com.notmuch>
Content-Language: en-US
From: "Xing, Cedric" <cedric.xing@intel.com>
In-Reply-To: <67f601e35845f_720529475@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::27) To DS7PR11MB6269.namprd11.prod.outlook.com
 (2603:10b6:8:97::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6269:EE_|LV2PR11MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 028410b9-0577-4033-b3e4-08dd791f8f1c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHpYYkRsM1o4bGV1MmpDY0RMSk9YZ254aHoxUCt3RXo2RWNtaElOSlJCRlpX?=
 =?utf-8?B?S0tUNjNUc0plUzh3cm5lWGUxYlVjdVBMT1NOUnpWQkRyK2pJV3pVd2JqcTlP?=
 =?utf-8?B?NitoelpSTmZ5RnVON0ttY24xendmNVZqVEdxQlJoRG5yOWNkQ0YxR2xoNCtt?=
 =?utf-8?B?QWE0bHhMT0IxaSsyS3ZkcmorSnFYSVpYbi9wWUhDbW56UHozak1oWE1WeHVZ?=
 =?utf-8?B?MGI0Yk5ZQlJVVm1XMHJ4bGFOakNXS1JEekFnMldYM01DeFVBNzkwTVpGSzdN?=
 =?utf-8?B?VnIvY1N5SlNINXQzM3BNN3ZUUyt6WEhhSkJPdTdRby9sQUNTTmpxQnU0NzBa?=
 =?utf-8?B?eEdyaEhTZ0M0MGlLMmJLNkZicU9VUEt2dUtaZ1I1MnlMZjQ5OHhuUm92dExG?=
 =?utf-8?B?NUtPVENHL2QvYXh4VHVRMDQvWkF5Tzl4cWV5NnprVnJHQ2lXSHNnTnI4aThE?=
 =?utf-8?B?K3dJNVdTZnNMQ3pxSmtnV0w3WWxSRFdNRDVZREw4U2ljVjFFMGErSkpiV0hZ?=
 =?utf-8?B?eXlSbWxYSjBZbnJPc2h5cnZsRzJkVnh4VnUxQWJKREg3bm95OEJQa0d2c0FU?=
 =?utf-8?B?YklIOWJhdEVIdHoyeFZyOGxhUFNaNGZTTXJTYk15a0s3NmswcXNjRzJGcUtT?=
 =?utf-8?B?UnEyWUZ2bzhmZSsxVkt5RVBrNGltWXl6c2hKdWVKb2xnL0lpdGZjdFhPVGRk?=
 =?utf-8?B?NE1ERmVsVi9kcTJwNHM0ODBnbTN4WlZKSWx0WHhpVFVDR2gwNnhnYnlqNkpU?=
 =?utf-8?B?N1daM25tQzJxSHpMNFRrUEM0bTNhQndsWW13cHI0YXFta2F1eTFrL0xrWDQz?=
 =?utf-8?B?UUwxczJRU0MwQnpheXozdStWaHNGWnliSHEzTDBkQm5SK0VLVjB6QTlSQVl1?=
 =?utf-8?B?N05IVS9LRGNJL0wzWS9wWlErMm1QYnl3b0dHSFpnRXRBbGxrVGVhMi9lbFlB?=
 =?utf-8?B?VjUzeTRubXlHVTZxWG9wa25SRkRKeEhXMG0rTi9MQkFYN3k4a3o2WSs1R2ow?=
 =?utf-8?B?ZXFvNkhTUUxrazdUM2NKL1VCb3daT0srcmhaeWR2L01Sd1cwMGdWaXdxcTNN?=
 =?utf-8?B?OVlSaVlMMVhDOXhwMzVTV1pEUDZYT3Z6QlNIVy9qTC9CSGtRNWhqN3g0NGZ2?=
 =?utf-8?B?ellhTFg3UnJSQlJHS1pPR0xNeTd4anpJdHA1bThBM3hGWjFOWkxjdWVIV1p4?=
 =?utf-8?B?bW4xODA1NXZsYVJDTE5od3dLZjROTHNWSk1qbGRMQmVINTBIVWRveUV6VW5T?=
 =?utf-8?B?YW9RSHhWWTNsU0EzdUllcXZuUERlYmJDNDl5U2JVMFdleC9oVmVySjVnNWlp?=
 =?utf-8?B?NGtJdFNVNFVHMzZmZkNUc1JqbHBIbUM4U2J4am1ETG5Ta1pVSnpULy8veEdn?=
 =?utf-8?B?TkJ3QmVNK0RpS3FlNjBkRy94Y3EvVmNOTTk0V29ZcUMybmFyTktqVDVuZDhy?=
 =?utf-8?B?SW1TY2ltdjdRYzZ2TVEyY1YwOHNqM2dKYittcnBPSnVWU2ZMaXgyVWZoV3ZK?=
 =?utf-8?B?S2tIWnR5ckVEV1lWLzM3QWhoWmxCQzE3WkFFRlk2Zk9OQVZMT0ozRGlYM0Ez?=
 =?utf-8?B?akVuOTNpcms0TGdYazVuT1Z0Vy9yanZHLzRud3Jib2NDdldPQm9lTkJFanlJ?=
 =?utf-8?B?TmQyNUpHRFlic3k4SkxHTk5YYXZLYjBoRzZkR3hoY1l3cDVQMlEveU83NDMz?=
 =?utf-8?B?dnBUZUQxajB5TFVlT1QyZ1BzOXhwa1FoNlo4eTlWWmtESHB5LytjRW9xMnl3?=
 =?utf-8?B?OHVqK2xDU0FEaWpBaXFpVjYrME1mUkluK3NvZlNJZXM5ekpXV3luTTd2V2pk?=
 =?utf-8?B?SkVDNVJkR2IxSHB3UjQySnhmMGxaNjVCQUFiOGk0czJ6RVJ5U2Z3L3lpdmVJ?=
 =?utf-8?B?SGZ1NFVSZGlZVU9EZ2piSXhqSU5YeGRYeWNtNHVRQVJvRU4rQjR2MGx3emxs?=
 =?utf-8?Q?Jm2hwFZgj8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6269.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1duWEkxbGZ5VnJxd0tBdWNjMGg0MXJZR2hob0lXbVAxTG9xTHZGZDA2b3BS?=
 =?utf-8?B?TWIrYkZPcjY2MGZTWnZlQ0g5WUxnYStyV1NsZk02cnB0YlhUQmNZRFBnT29q?=
 =?utf-8?B?Y1JwYkhLanJGbWpDOCtRVy9vRG1kd045dTNaV1B5RjZOd2FMdXl0cVFIZHdL?=
 =?utf-8?B?OVI2ZWZ4QkxVaDZiSzhZTVpkbWRzM1BZc1BRalNEZU1iYlordk5FY2s3Zllk?=
 =?utf-8?B?UzZzZ1hPRnp1aEZSTFI2azVLT2ZFZ0QycTZDeWN0RGRRNlRFVHdwRFI3ejV0?=
 =?utf-8?B?SDA2MmVXaGdsci9LSitodlYxbEhSMk1ac0xENUwwT1F5T1c3SEpRSDlicjky?=
 =?utf-8?B?K2FrWXB3VUtNUnE4Nk82SjI4cGZJZDNObXpZa1BoNE83Ym4rTE5OMnpIOXRX?=
 =?utf-8?B?TnpZdTcvbm4xOS9TNjRuL0phL2hTM0FnMk5QN0kyQ2VETFRtemc2dldNd0py?=
 =?utf-8?B?WkpZMmgyVUxkZkJsNjErQThaTjBDb1R5K0hIMWdEc0dRajE0USt6NGtQdWZ5?=
 =?utf-8?B?TVg1aVJ5VGZNRFEyZUY5ckdraXp4RVVWdHNReWZFemhGYldUU0JSazdqa0Mz?=
 =?utf-8?B?N3k5UG1keE5yVm1KY2lzT3Q2cWxwUDBTdUF0MkRhYnc0Uk1FUXR4T25ZOWxs?=
 =?utf-8?B?ODZuR1IvZXdGWnQvejVHQXRIcjhZOFlIMmJnL1d3T05oM0tmYUtscjhWRFMz?=
 =?utf-8?B?UGJ6ZmFHeDBvSW1QSktPQW9WdTMxdWIwZVBNY0FJZHRtaCt4N0lRLzVQNHRY?=
 =?utf-8?B?cjdhUS81OVJNMDliNHNTeEFkYjZ4a3lFcVZYY1M0SnVjL3plditGY1JDQzBr?=
 =?utf-8?B?dmNoL0ZiTzZ3dENqTEt0ZGFQdWFzSllENUUyRkJEMGVTcHRpU0Y4UUNuOHZK?=
 =?utf-8?B?OE9Cc09EZWlFdTJsMENlTzNnTHBJNlNqTmRpWG54S0RqT2VaaU5PRkZFTmw4?=
 =?utf-8?B?Zm5HS3Jtc1BOMVR3N2xPSVhwNUdScXE0R25xZ0RXTDZja2xVZ2F0YUgvMWdw?=
 =?utf-8?B?WTZKTW4wNkpOd21vb05jYnZ2aEtkbGl3bUtFZEQ0VnVjNWVlU2oyYlc0WkZo?=
 =?utf-8?B?bngrelQ1MDhNTUxMaDdtenNJMHY1cXlHOVVkajc5dTJ2RVhxRDZhYml2dXVJ?=
 =?utf-8?B?N3FXWWlHTnVDSWFaSm9PakFjMm5MR2Z5dlNUbk9BZjEzbGh0S3JueHBYZzFS?=
 =?utf-8?B?MTBFSmxzVDdMZVhJRFpnUWJuVnN0MitYL3ZnWTBuUWpQL3FzejgvL0dCMlkv?=
 =?utf-8?B?WnBud3ZMeGgycDc5cUJWNUZCMzczd281cjlHVVBLZ3RIdUxPci9BNjdyMkFX?=
 =?utf-8?B?L24veHBRSzUrTjhOWnVtOXM2V3pZVnNlczBIMnBqcCtMM3JjVlhUTCthQVdY?=
 =?utf-8?B?Tkd5c1VRcGxhcTIybDJsNWpIaDdXSHRhbFI5QjRmeEh2YndHdE1BTTVNZzJM?=
 =?utf-8?B?ZUNnSEoxbjhtMVI2N2tiblp5bE5mYWxjZDZZa0R5NVlCQVhUQnQ0TlJVWFFs?=
 =?utf-8?B?ZjZrbDFkUEs2a1V6eXBQaEp4RlNpeFdvUU9Sam94WnhKSFZ4c2JvVzRTRWlE?=
 =?utf-8?B?Q1JTUkZKV0JDOGZRajlad2w5UHJoSEdKMlVCZG5nMXljM1ZKZUtId2gzN0RN?=
 =?utf-8?B?VTkwZlJ4bEs2c3dWNkI0b0tSc0UrSU1UcStmZE9SSlVweU5jT1V4K2tjdGFS?=
 =?utf-8?B?QXkvbUhjNjJUOXlTS2NTcHl3M0NlOU5GUnpiZEg2b1MyM1pvdjhRNjdydm9i?=
 =?utf-8?B?bzVvdnFjZ1h4OXBuYURjaS9Lb3BVZ1hoR3p5N0EvVkFBUm1rNS9ra1NaLzgx?=
 =?utf-8?B?QW5KU2R3N0FZT1RCUktLYkJ1c21xcmh5TzJxQnU3b1FKWTFZZFRCckRCTzgv?=
 =?utf-8?B?YkRwT3pZSEtSTElIajdNRC80UXA4TTJ2OWcrOStBUDFkK1cyNit2ZUZjbFdX?=
 =?utf-8?B?dFdCdktJNjBWaVdKcHJrSXFsaTFuSGNyMUJFOUgrRmpyc1hMTzdlME1mOFFK?=
 =?utf-8?B?UTRteVBFRE1POERaZCtjNHVwSnQreHF0enhRdGNDaHg1RUY0bnJUcVc1ZGU3?=
 =?utf-8?B?aTBLRWU5TlVBeG9Mbzl6bFpiK1BoN2tJRGpmQmxNOFJQQ0pNaTNjZ3NlTWth?=
 =?utf-8?Q?J+Do1Zw95BXU9O2g2XFt3yP/a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 028410b9-0577-4033-b3e4-08dd791f8f1c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6269.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:37:41.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgFmr7TNxQzOov7W/r8d80mFN6lxDS/Oxq7BEBvRQ/zn5MpFsiOtKIgRZM/tlhjRjQBP4PUYGartlU+hD1dbLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
X-OriginatorOrg: intel.com

On 4/9/2025 12:13 AM, Dan Williams wrote:
> Cedric Xing wrote:
>> Return `-EBUSY` from tdx_mcall_get_report0() when `TDG.MR.REPORT` returns
>> `TDCALL_OPERAND_BUSY`. This enables the caller to retry obtaining a
>> TDREPORT later if another VCPU is extending an RTMR concurrently.
> 
> Can this not be prevented by proper locking? Otherwise this type of
> collision sounds like a kernel bug, not something that should escape to
> userspace.
> 
Yes, -EBUSY should never happen with proper locking, which however is 
implemented in the upper layer.

Similarly, -EINVAL will also indicate a kernel bug but is left for the 
upper layer to handle.

> I.e. userspace can not reasonably know when it is safe to retry, so take
> locks to ensure forward progress.
tdx-guest does WARN() on errors. There are no other users of this 
function currently. Returning an error, however, will allow different 
error handling in the future (e.g., retry instead of WARN on -EBUSY).

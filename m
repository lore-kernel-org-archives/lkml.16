Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BCF139B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751415520; cv=fail; b=smTWjXdOSYgEW4uzUXDG4fZZEUXJBlUduCpUQJJtHCF3/MFY2VEjn6BW16kffQ/14D1FJwa9ENM2+XwWCm9rK8WbQ2OHb5UUgjb7eL2VwFIgHXv0RMbS2uEF0TsvpsTdl1knyP1v1wciupTGnbsYMQAqacfiJZK5L+DAP20ppTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751415520; c=relaxed/simple;
	bh=1CT+Bdrl05ZNoYxfPtNPv9XC/4cx4aqwz+LrdrLT9SI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QHoE6RLPbvFBOLRbRkuQHkSoA8GgSDb0hsIeKmeMllkZdzmvNqbvYmN/oKo+KqKaR+SZK13N+rPXnEaaobbB/LMV3LbsonriBoNWyjAGjCvzn5VHgRLlJb91OWXphUEiD0WeMmHt3mkzphzhOLNEBaDPlkAJciV0BYgWhOIgO3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIO0zqGc; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIO0zqGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751415519; x=1782951519;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1CT+Bdrl05ZNoYxfPtNPv9XC/4cx4aqwz+LrdrLT9SI=;
  b=nIO0zqGcg2of3b8jvLaNZm8/POhk1xcCK0SqS++561v0GmnVIGymvuIm
   bH6dKu13sUTSz0lW1KNhPi2w2DMuk37TpZ4p/sNVR/aFLresPsX1bPZYE
   MBGOZZicEMVtm5lnO4Fs0aakQwB/9RYEr9okW9sct/2OY/IkGNsClRgYs
   EFgQN2Jk5jdyR1WRjLaaElC4JjfAiEuuO+5sRHmMMdmCRDsFeyXUmNCbQ
   YkkjcnJAyDDiKn5IaRTDC3s2ud/A0Y6UQEafH8VvYVB14CF1mI3upMjS2
   dutg73aOl3TvksqBYYUgosjQQbycRNWUrxqH5t599TePq602L3kmbhGQj
   g==;
X-CSE-ConnectionGUID: jwWZ44JeQ7iUjkCMf9Slxg==
X-CSE-MsgGUID: lXS5bsFUTd69mAcCIs6SvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64393259"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="64393259"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 17:18:09 -0700
X-CSE-ConnectionGUID: Fp6yryUQSkaSzTr1WYM+cA==
X-CSE-MsgGUID: Fo+E49r9Q++6YQTR5sf7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="159432266"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 17:18:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 17:18:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 17:18:08 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 17:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puWusk8tSzE3IT7IlPggs/V4zapMW+lmHMbPSVFhYgTDRBMSjThYebM0x363aJueB4EjSJkOUwpxSGcLlv3f2WBCVYN9Mha8D69rLXDopOdWfQaTO3VgSpuvFOkprgyJJ/IziEoNiaDmoj1krcY48kSBJQw0bFaDN8zTzZdWY4nZDn1Mv5g6LGUxCwQCuogq7KKGqBJz/sYFIhhn9Xot218BuE4QxyfkaCa+UKFJJ8MY65VXNR2oLqMTA+VGn3LuvlHmGutKxjulDKa3q+yNOIUVUN6tikLHVAE7WaWXOKEdpGWGnKKZh/2zNL6e8iwbHvPXxaBdOSJ7wk73jfjNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcNkkEoseJeIftrx0srhGuEAzMZGX9bHytpI5rYum2Q=;
 b=Rk3whPgs9f1Up+nq3dfDlg9WTJ8Us6VoafwTaRiwXuum9K+uBdA6Z7txKvm6J7Z1XeeHJDpNiQZD1ZugYc+wPGYS0l60HtWENo/ecOEuLv3z70YrI6zDWmuAw7e1SQRx3d4E0Pc/v65llOYakgGQ7wUsqXQ3jsHBzeNeTdKJJs7+xk3t55MsJua72UIP7bEFhlcG3f6o3I5gNDnUitnPvRAOE7xo35fYDp+sQbT6jgbxYJDPDtDLcMK7ONmcmmxqV8UHQcxCc7yYObbNh7kpUHpa6RPGLMSvZmkqtuYXXxV75TtlkTnAoyjGltxPnn7aZvfW9c97Mx45I1VR64dBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 PH3PPF3ECB6A513.namprd11.prod.outlook.com (2603:10b6:518:1::d19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 2 Jul
 2025 00:18:04 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%6]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 00:18:04 +0000
Message-ID: <3e95a8f7-88aa-4732-b38b-ccef74634819@intel.com>
Date: Tue, 1 Jul 2025 17:18:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V2 03/13] x86/fpu/xstate: Add xsaves_nmi
To: <kan.liang@linux.intel.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <tglx@linutronix.de>, <dave.hansen@linux.intel.com>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <jolsa@kernel.org>,
	<alexander.shishkin@linux.intel.com>, <linux-kernel@vger.kernel.org>,
	<dapeng1.mi@linux.intel.com>, <ak@linux.intel.com>, <zide.chen@intel.com>,
	<mark.rutland@arm.com>, <broonie@kernel.org>, <ravi.bangoria@amd.com>
References: <20250626195610.405379-1-kan.liang@linux.intel.com>
 <20250626195610.405379-4-kan.liang@linux.intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20250626195610.405379-4-kan.liang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|PH3PPF3ECB6A513:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8ebb37-90ee-4af0-1422-08ddb8fde971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnRJNHBBTFl2eStqMVBGMEsrQ2RKdXhkbUhJVjVYMDZjLzFKRXlKbDk5YWRt?=
 =?utf-8?B?OUpZSDVyNzdSNmxxZzdYalBxTVhRMjNHUGZPcm5rVVlqNFJMRUhlbGl3aC9x?=
 =?utf-8?B?M2lqVU9aTy8zbnYwRzlkS0J2dDBSeTdKRm0zM2M4YjB2bFArTnhaakRqeGVm?=
 =?utf-8?B?Y0NlblZMUElQcFVmeHJLa1Z0YUY3aVNmb3N3QlN4aW5zYzVSYUM3eWsxeG5J?=
 =?utf-8?B?dnBQNVI2Tno5TXUwdEtXdEFQakdLTnkvdnVvekZSc2NLeGw2dWNWNnFwZmZG?=
 =?utf-8?B?ekpzaFJ0RVNBTjYyK0l0aDM3Vi9GZXVGR1FaYkYxZjBZNUhMMHJ0SG5MYllY?=
 =?utf-8?B?bXlsclNTNE9kaEVkT2k4eUZFQzBha1k2NlE2Y0w2aDBPam5lZytxVnMwTzdZ?=
 =?utf-8?B?cndja01GUExMWm9TTTVJQUNyOUZLaStZakQweENCak8vRUI3NGRFTk95ZWMw?=
 =?utf-8?B?RnVBUmt5d0JOK2ZzNGhBR0lJVGh2eFBoTW5vaGxCZ3RJSzNzMFd2WkxwdmZy?=
 =?utf-8?B?UVNrK2xwT0ZQMExBY2VXeGVOUzN1MStNUDEraDFOM0dIUjF5anVWR0d2bWtl?=
 =?utf-8?B?TkdhVmdEQXhhdCtIeTlhUlRYQmV4UmFiMGwxMGpHVGRXRk1jRjQwKzlqRS9n?=
 =?utf-8?B?Q3FYdFVrRlZQdmsza1BKYjNoMHlDVFRvekVDdEVlcUEwNzZsVi8rSUFyaWdh?=
 =?utf-8?B?SjNjMkE2TFRNLzhGU0FlZGFMNVdtQmNlRTU3Yy80ZlVkRWE1U2MvQ1FqYzJ1?=
 =?utf-8?B?MjN5N0lyTEpBa25kQWpOc3hOSlErcXMvbFRkZk5lRmRDMVpJYk1BT3FmaHlt?=
 =?utf-8?B?R3lVUm9IRlNFOE1kZFBKRkVLVTQ2VXo2d1l3TmdBQWpnVmVzSTZXR2RDR0Zh?=
 =?utf-8?B?QWk1eVkrVmh6cm5DRy9YT3o3SFVnSEE4ZHdsZ0hwbDRVMzZvMEpzWGxabUVy?=
 =?utf-8?B?cnFzenIvODM5UXh4ZGhyNjBUUUYzcTJaalloZ281ZFBPWWlRMVFLT1kzL2hk?=
 =?utf-8?B?Z2FtY1JNVHJKemd6am5kRnhGR0N5am10T2pZallIU2x3SFduaWk3QkRCeTh3?=
 =?utf-8?B?ZXdkSzZJR1lpeCtxK0xOVG5iTkQvOG5GNDR0Q3BnNldWVm1TUnpkOUlTYzFu?=
 =?utf-8?B?VGlKcnZ3Qk9yUVF2Q01ETVF6TklFa3VNMWRHTnRlOVpsenZUR3MwRGtDT1VM?=
 =?utf-8?B?M2gzcTAzY3VpQTV5WjdTRmVYa3JTeUR0RFlUVi9yVHFIc1l3TWJ5YXpTM2NX?=
 =?utf-8?B?ZEpoYlAyVUVnR2h4ZVp6K0toR3lJNkpxU1dldDZTSndMdzc1TlU5OWMyYzlJ?=
 =?utf-8?B?RjVyOU1oY2QzZFhXYlBtbjI1UDRxMzZ6TG9CYSsxallrY29ZYXYrSlB3RzZS?=
 =?utf-8?B?SjNGT0lWbHNMM3ZQc0JsRkhTNTJrdXFUQ1Y2WEVGRG9oUytnd0pwdWRYZ3p4?=
 =?utf-8?B?cUR1MFVDK3JNcWF4K2kySnNZTmtZeUI1K0ZIUHJmaExwdXJUdlhMUEFkTjlU?=
 =?utf-8?B?V2VVQ1JnZFlXM3I5WUsrR1kvckE1VTQxUG9UOGdlZ3RvTXBQQ0FrR0ROMzdY?=
 =?utf-8?B?aUZvU2NLeGpWamxFV2IvRGdlSTdpdS8xbjg3RGJIT1lKRUNkNE9HcWhqblR6?=
 =?utf-8?B?WXBEbzk3TVNMdUFZbm13bUlNUVlFNWs1ZGhEYlJxdnZCZm56SHo3SFhrSHBF?=
 =?utf-8?B?S080NitGTlVIUER5OTNVM2x2Sk1lelZsd1RQOHZGcWQzaUJZS1JSYTBVK3R0?=
 =?utf-8?B?Qkp4NGpLdE8rUUpvcmVycGR0VERrWjZQVlM4L3JBbVdwUWI4M0RyaHNDWlY2?=
 =?utf-8?B?TEtjMFgreDNmdWdUNFhJdy9rbkYvbXppbHZpNzBxUld4SE1DOHhkRjJpS3Bn?=
 =?utf-8?B?MTQ1QkFaanZ0cStwNUMrY2QrWHhrZVFwTFFiMGJqbG5zbEZXRGIyR3E5V3Zx?=
 =?utf-8?Q?gYFdBsCLniE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akMwWWFIdldDRzBtS1phNHl1OExkMzJ5Umt4dm1KL01FUURGZVc2UGRZUGsr?=
 =?utf-8?B?S1pIQzNrNEkrbHlCOGg1QUlVQ05jRzRpeEZnMkJDbGU4V3hYNEdhbk5qM1ZE?=
 =?utf-8?B?V2YyT0R4MU1ZU3NYY1lpRXcvdXNmK3VGODFWNHFqVHBJcTNXT2daOUlrZDJE?=
 =?utf-8?B?Y3V1QXNZcDlDQmlmYmZPU2IyeXhRazNPUTduck05bFQvOGFucHVKRGNEQ2lZ?=
 =?utf-8?B?TkwrNFRLUU1WcSt3anM3NWY0NHJCRTlDa1Jyd2tpQXJGN1BtYUZod2dYRVZo?=
 =?utf-8?B?YmtBSEQ5eHdjQTBxQjI0Mk93d3hiOEtYVVg1S2lLUWFGenRESlM2WjBlbEpo?=
 =?utf-8?B?WUhyVmoyUXI2clpOUTBwYUgraEF5b0l6RHZXd0pqcmZDaWRReGlyR0t0ZHp3?=
 =?utf-8?B?M0grZGIwWnkvaFJlV0c4L1RHS3dxOGR4L0dydDVzZmZqVkZUVUVzVTB3eDRo?=
 =?utf-8?B?QS95UFRHNXFiem03b2RkRXRBd0dUTmZSd1lqTXhWdzJ6akhaNUZUWmRkVUN6?=
 =?utf-8?B?ckpCekk5UHFxOVBuUUU4Lzg2TWlxcmJPYmI2S0RwdTdYSWs5RW1uYzdWWHNJ?=
 =?utf-8?B?Nk9XOWI1am41eUFiWHVMYTJSM2NrcWdFa2d4aHFxaXFHbTVnbmYzbVc5MjlN?=
 =?utf-8?B?N3ZJQndWaWdub3V1Y2RXYlJhSXJzMzByQWNKaTNHQ051VGRERGNiYnJZYldN?=
 =?utf-8?B?b1dsRERhZU5kZ2V2ZFNyMVk1VndaTjFoSzBzZTB4RktLVFZDRGNSdDRPLzlG?=
 =?utf-8?B?VkdpaURYR2hialdpK0RNY1hmRWplT0pwUGJYV1BuK2tUQ1I5L1lpZEtEUmhj?=
 =?utf-8?B?aFJPc21vYlRVTGlyRDZSTWNVSmkwcGVjMlRnWGhXeEFYQ1RYTVhoR014L1I4?=
 =?utf-8?B?UFYzTXNVd1Nhc2pCZEk3N1NHRkluV3FqY2dkclhINERYK1gwMzBGMyttWnBx?=
 =?utf-8?B?bWxML3pGakFNVGpFMkhZOUMxK2F4eWMvd0RHTXE2bUFCZnBGREZBM3JFRU9S?=
 =?utf-8?B?VlQxV3JOM29NZ2NST3dGSVR4eHVzN2FEYWp1MVdZRVV1K1pGb0dlMmJJZ1Aw?=
 =?utf-8?B?cUZQM3dqYUVEaGR5Y05LZE1xemQrbUxnVVAzYSt6SGxTTFVId3h3b0MvYm9Z?=
 =?utf-8?B?Ly9oTXN6dEpDN3ZPVHdSaHVtL3Bnd21BUzk4U1VYN0xxTGR1akhvbGNoSy9v?=
 =?utf-8?B?VmRqdjF5MWkwUmZnTkZVNHJCckJlUUhBT2RXU0tNZmVDRkpITGtuNFFTMnVT?=
 =?utf-8?B?bWN4YUdkK0xGazdmR1VFYzR6bmVGZTJla1c5OForL3dlTzE2N1U4eWJybk1k?=
 =?utf-8?B?QzhwQWcyTTJSUEE5MExrc0dScmNqMWxPcWZSR0ozSERCSExhUGxVM1lNR013?=
 =?utf-8?B?R282dkFEOFZwOTVLVHRVS1ZYTkNpZkRGZ0ZjYmpraGUyY2VkNlR3NTJjN0do?=
 =?utf-8?B?bjJSMmw2WjdNbzlHM1ZyRXNtVWtGTDY0NnIyZzFETHBUUEM3VFg0RExiTDZJ?=
 =?utf-8?B?QitLTFNFblNYUjVrbkdTUWhUV2phblJYdzg0L3pGM29XamdXZUE4V1VCcytY?=
 =?utf-8?B?UUlLMWNuOTgvOWQ4V0VXcmk0WnR2aTJaR243Yyt0eG1WV2w1eGNTNWtkMXVo?=
 =?utf-8?B?Z1MyM0RVTHk2SUQ5enBTOThtQm5HUUxUOVd6QzMvUFJ2d3BUbFliMitFR2ow?=
 =?utf-8?B?M291WXJKL3FUbGlLSDNhNnhaaC9TdHNURkJBMFBRV0FvamdkbWt0cHJwQUZU?=
 =?utf-8?B?WFZCSWRyQUc2ckR6MEorbFlwSWxUbC9VQmtxSDQwcm1xMXRURUw3eVFiTmpN?=
 =?utf-8?B?WjJ0TkwrZFM2aWU1dWowRkpUZ3pSRlptbndsQzYzd1ZwOWVoaTUxMzZKcStF?=
 =?utf-8?B?MGNPdnYxa2RaMmhNQTBqQmpXK05tRXVIOGE2SjhtbE8rQlVRZEoyNDFwMGdh?=
 =?utf-8?B?OEYyNllNRWNLdEd3TDVuY21sRmFxVmxCUWxQUVFWOUE4N0NLeG9zVC8xUjkw?=
 =?utf-8?B?bU1DbEwvM2g4cHZVZ1Vxd01CTk1uT1ZaSU9PeFNWaEltUHp0YWJXa1FPcFd3?=
 =?utf-8?B?MFFpZXpTaCtKNkg0UTI5amY3WXRXUEJBb0JCSW1QbU5wYkhpVnNwMXVsdzE4?=
 =?utf-8?B?Q3ZmeU5neDhnS2RDUHhOZWFaYjhuZFlhSkVQT0Z2SnJmeVJjR3JYVXR4cnpW?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8ebb37-90ee-4af0-1422-08ddb8fde971
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 00:18:04.0974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y65Hf6t0MjH1MwRDf1mhaKygcOgbhFTiVQwZaWwCSIChLT9m45+XPI8DoFiDcDY/4wuZMvvsjL+ehDyPo1TAXI1HaYdqWKxGt1K4Zo4jfv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF3ECB6A513
X-OriginatorOrg: intel.com

On 6/26/2025 12:56 PM, kan.liang@linux.intel.com wrote:
<snip>> Add an interface to retrieve the actual register contents when 
the NMI
> hit. The interface is different from the other interfaces of FPU. The
> other mechanisms that deal with xstate try to get something coherent.
> But this interface is *in*coherent. There's no telling what was in the
> registers when a NMI hits. It writes whatever was in the registers when
> the NMI hit. It's the invoker's responsibility to make sure the contents
> are properly filtered before exposing them to the end user.

<snip>

>   
> +/**
> + * xsaves_nmi - Save selected components to a kernel xstate buffer in NMI
> + * @xstate:	Pointer to the buffer
> + * @mask:	Feature mask to select the components to save
> + *
> + * The @xstate buffer must be 64 byte aligned.
> + *
> + * Caution: The interface is different from the other interfaces of FPU.
> + * The other mechanisms that deal with xstate try to get something coherent.
> + * But this interface is *in*coherent. There's no telling what was in the
> + * registers when a NMI hits. It writes whatever was in the registers when
> + * the NMI hit.
> + * The only user for the interface is perf_event. There is already a
> + * hardware feature (See Intel PEBS XMMs group), which can handle XSAVE
> + * "snapshots" from random code running. This just provides another XSAVE
> + * data source at a random time.
> + * This function can only be invoked in an NMI. It returns the *ACTUAL*
> + * register contents when the NMI hit.
> + */
> +void xsaves_nmi(struct xregs_state *xstate, u64 mask)
> +{
> +	int err;
> +
> +	if (!in_nmi())
> +		return;
> +
> +	XSTATE_OP(XSAVES, xstate, (u32)mask, (u32)(mask >> 32), err);
> +	WARN_ON_ONCE(err);
> +}
> +
There are xsaves()/xrstors() functions, already narrowed to the 
"independent" feature set only. So, adding a new xsaves_yyy() variant 
for a different use case -- without renaming the existing helpers to 
something like xsaves_xxx() -- would make the naming scheme appear 
inconsistent at a glance.

But looking back at history:

1. These helpers were established with "independent" in the name (though
    they were initially described as for “dynamic” features):
    copy_kernel_to_independent_supervisor()/
    copy_independent_supervisor_to_kernel()

2. Later, Thomas reworked them, renaming and simplifying them to
    xsaves()/xrstors(), and adding a refactored validator:
    validate_xsaves_xrstors() [1]. At that point, their usage was
    *relaxed* and not strictly limited to independent features.

3. Subsequently, in preparation for dynamic feature support, the helpers
    were restricted again to independent features only [2]. This involved
    renaming and enforcing stricter validation via
    validate_independent_components().

Given that, rather than introducing a new wrapper for every additional 
use case, another option could be to retain xsaves() naming but modestly 
expand its scope. That would mean to add another allowance: features in 
tightly constrained contexts (e.g., NMI). Perhaps, this approach can 
keep the API simple while still expanding usage.

[1] a75c52896b6d ("x86/fpu/xstate: Sanitize handling of independent 
features")
[2] f5daf836f292 ("x86/fpu: Restrict xsaves()/xrstors() to independent 
states")


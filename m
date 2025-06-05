Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230D2D530
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 23:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749165670; cv=fail; b=H5vEb9mzSV9iZz4bzU5/biDLH1apC0zty5dySBCxR9nVxV0lY3OSOWiJVN15VU7BzNslVT2MpC1+3EBSfhoId3aK3c+TWAVxdXVSyzCS52OpzoWjkOK5oQxuPsDczm3NxH1dVzgGrP/xcbboABG4DkIAKj2Sv7nzkUinimLv4fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749165670; c=relaxed/simple;
	bh=ju7X+LAwkXyDlcrf3Z2bM74J3eq142JsXZflI/OJwxs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DUoE/rQIgB3GyBuQoQyjEFKvGPQ+JJ747I2CSBtuZJ8V99zgvuaHZ9l/cjLuZB29HvAn6nsffUZR2rA2WD9ICBtV74fWMLXsh8q9eXvbH0rhga6QMtjLkot+eW2yrrGMFs/75E7X1HVL66EeGTed2GYrX1V+8AD9lgLsCFgXrLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoETPyO8; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoETPyO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749165668; x=1780701668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ju7X+LAwkXyDlcrf3Z2bM74J3eq142JsXZflI/OJwxs=;
  b=BoETPyO8dGrSR9GY9Y+1mQw6DdBd0w3DhMDQFJ3M6nqnbVieKh59ihEw
   bHOc/BId7nRqLOjWrx/1XH4SgNBOWG7K5/8fuupPbP4KlJ5wl792M7/7y
   NR9OgUVb+5DAgFvPXAkcxaUhzsMXUqrBiMqghyK3Or9kwGl9deIduk2Et
   uTRLLPUW76YmyS84KMTGEFXvf3EL2/Al7RcEtR2X9l9v1SRiM/lS9YAlk
   ADs46nsGUJpNRx9xW7MGshSflmooKlwH42JAKND8qcOCixf2BATobDIO/
   PLZMVWHGz+lLc5K1s1GpmuHA0XvbL95k2q0dU8ZZGMcr4LcSqJESiBoUL
   A==;
X-CSE-ConnectionGUID: 4DCFfEG2QuWIyQw5W00r1g==
X-CSE-MsgGUID: 9Y0kj3IuSiq2FoMTlqeVOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68744172"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="68744172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 16:21:07 -0700
X-CSE-ConnectionGUID: d1NjZb5YRdCQuNyTp4AP+w==
X-CSE-MsgGUID: XfneKPbjS12RQY8w2ctkWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="182839082"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 16:21:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 16:21:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 16:21:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 16:21:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb5ec87nQW2m39p8h7TNe/L5w7dMl5GSoONWVX6NgM80K01mdTJtAZ8DiJr+vggEIK8N7du48T3kH3W+dpHGGsMjWpsqM4GPFeNW+iz3BqbbXMYkty9MTse6dwzO4V+wk8OyJPUthRgixoL2eQLZaqa8P2NVGBdCZZB0xzP7C1+G0wJ22EKmwA1KyKr8cDpGUsG5gsBIFiTXVOkxWJXtS8/DR6oAn9MQt1AfAK0rj4NwBcbyJAd2AULSxI2b4ejw67Oih/eG00v15GHHqRo5wJOch8uHGv68eu6+XrU470tNQPIVRCx450itxBaEgXS9wKR/UqfhYHNOahUIJUAtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ju7X+LAwkXyDlcrf3Z2bM74J3eq142JsXZflI/OJwxs=;
 b=YFFDnAEDH1uP7Kol1ZpBiYcldRn6CCTdNIlolVgpl13kZp28lzl/92+hb+GnBvGxsPJ7tKzvheoXwuIlaP12JmE+y4jr9aZeTsks+6PyVbMf+p5jf2/z0T+71EZWFukQ0REp4LZVIZY2HsJe+xPlDGer368LxBoqW98d1bW2UhCK7iTM5S35DyfTo6rd12xeMA7Ml1h1WcMXzSIK+k3nRMBDL4m0r0pvQlMdo+ReTrPU5BioibCpLdkjRhIFMHQF2atWNGqNDEu7a/f1M6qFeOHZBV3dpBHsqFDI4pA48bMDgc4xeHudFSSTgQTgldDYEnOvdbesODeu4pqTuHY3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DS7PR11MB7908.namprd11.prod.outlook.com (2603:10b6:8:ea::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.35; Thu, 5 Jun 2025 23:20:59 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 23:20:59 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "peterz@infradead.org" <peterz@infradead.org>, "Hansen, Dave"
	<dave.hansen@intel.com>
CC: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"samitolvanen@google.com" <samitolvanen@google.com>, "bp@alien8.de"
	<bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Thread-Topic: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Thread-Index: AQHb1OklVaYPTytbT0efy84CnI49T7P0nJGAgAAD2ACAAAlVAIAAAT0AgACMKgA=
Date: Thu, 5 Jun 2025 23:20:59 +0000
Message-ID: <54b6e468c5c359e0e5062eabb6601062d9d0bbc7.camel@intel.com>
References: <20250604003848.13154-1-kai.huang@intel.com>
	 <20250605140739.GS39944@noisy.programming.kicks-ass.net>
	 <20250605142124.GT39944@noisy.programming.kicks-ass.net>
	 <ae0adccd-25d2-4dd3-b1b9-f7ba0c13367c@intel.com>
	 <20250605145914.GW39944@noisy.programming.kicks-ass.net>
In-Reply-To: <20250605145914.GW39944@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DS7PR11MB7908:EE_
x-ms-office365-filtering-correlation-id: 993c9abe-786b-4cb7-9b94-08dda487a19b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K0pSMHZxYThZOGpTOG1DN1o2OTZzM1N1ekxLdFNyeFRVclpMaEZhY2hiMEx1?=
 =?utf-8?B?WjQxbityNVJhQUdnK0tPT0lnOWZYTHhKdC91d3RPMlNyM21YZlVwQStPMTB3?=
 =?utf-8?B?Qko5b0lnWmNja1FDc3JNRmlwajZubnVWZXZMRHIrM0REWDVMYVYxV0NqNmE2?=
 =?utf-8?B?UnBqNHh3bE1vWlh1MHVZcUhra2pQRHJGQVFSdHZoZU54RkZvUE1IOE9VYkFD?=
 =?utf-8?B?QUpXbEVLRXlSNElhdFhrWUg3YXFyMFhlRS9NQXMvT0V5aHVKWURTbEY1MlpS?=
 =?utf-8?B?c212cEpOM2pHODZQdlU2WndUM3BRZ0NwUE01UGpSSFI2WGN3YkdCL2d4aGl2?=
 =?utf-8?B?UXJyVi80OWU1THc5QnRQVUM5RE85Q3Y2ZFlTMXpueVp1aFRYVmFqRG13NVcv?=
 =?utf-8?B?T21Ta0FmbDJIbWRWZ3FSNjIrMERRS0E2OHJrNGhyYkcyNVI1TFJzVUN3NHdm?=
 =?utf-8?B?alVFYy9JcVBHcG9JdmNyRDIyOEdCTHJCOFJwMC9ZMFUyNHMxQ1V3UTNSNjVj?=
 =?utf-8?B?RnpRWnhYMWtROXZHbm13ZzdtS1Y0WUJEajVBd2ZQQjNiT3RIeFdHWSthdVl3?=
 =?utf-8?B?dDJVQThHaTBnRlJtVDB2Z3VNNVZLOW1QdGpvQXFrTzYyR3pZbEVhWnAvd25W?=
 =?utf-8?B?YkNlUUd3YWhIQTBEdXhscWlHMy8xMTJNbDMxbjlrL1ZOU1hNREpFc0R4UDZ5?=
 =?utf-8?B?Qkc3SWdxZ3NKWVNRSmMxQjZWdU5qMkw4S0s1Uks0SzRPWGxvMEh5RFZUc3l3?=
 =?utf-8?B?WSt6Z3BUWEQrTHczVnlIQjJ6K0NoS0tKTTFxYlBJcitvM09pNWc0cm81QXdU?=
 =?utf-8?B?eWNuWDFGb21hRGVVNUIzL0RodTJFOFFtZzJpS3NlYnlzbnJpWng2TDZMVjZi?=
 =?utf-8?B?SEYzNUxjcHIzY0hxL3BGWThNWVdhdW9QS1V6MzR4NmQwZEtFZGRIeGZFeCt5?=
 =?utf-8?B?dERwYldJTzN3UVhETGZ4NGt1TE9vOEl6NUFKWFF6Y1JvS3UrUzE2QnYxK2FM?=
 =?utf-8?B?QUdpVGRGbDNHQzA3dEhPeW1aVUkvekM5Q3R3Smg4ZHR4ZE9JNldXV2tmY2Vy?=
 =?utf-8?B?Z2RBeGVISTBDOTFFVEFGWXQvL2RobEthWEVqTkpBaUZ0N0pRRzZJcVVsZGdk?=
 =?utf-8?B?NThiRzNsdWtEcWVFMHY3YzZGUHRmbis2TDNqYTY2V1E0cjJmbDl0MHkyN2xM?=
 =?utf-8?B?Z3JuZ3VUczdqS1dIbmt1cGtBT0Fua1IxbWN6TGZ2VmM3bHpOOU1rVzFITzJL?=
 =?utf-8?B?SGs5UGRSZlJmYUVNY3Y4dWtId1JjZjA2ejVBM0laQ3FnZitHcGNwV1QrcnRP?=
 =?utf-8?B?Q0JVdEF6OEZWWFp4T0ozejFWaFBwZjRqY0RTb0phS0hCekhFQldFU2RpZ0dM?=
 =?utf-8?B?STRBK3hIUWNsY0F1ZkJ4azk0VDZGMkdOVWY4aUNObFFFTjVvZ2xDU3I0N1Vs?=
 =?utf-8?B?NUJjUnRrNFdvSXV1SWp4RkVDeFFuaml4TGZETEtqcnFBKzVibUlmcWFIUitJ?=
 =?utf-8?B?UGJQNDNQQmluMXJ4TW9wRkdiZ1pBdUF5OE1sc1hpVWlUYTZXN0MvTTVTU2Qz?=
 =?utf-8?B?V3Y3b29jUVZmUkpzWWlJSDBGWEZ6WHN2RWZJVmpRT0ZHZDhPbGFnakxGNWho?=
 =?utf-8?B?VSt5cVNyY2l4b0pyLy9SMEp4M1FuTGhta28zbHJKWlRucnNiZXBuNThQYlFN?=
 =?utf-8?B?eDArcldWMHZHYVJobHYwU0hMU2VFY3dNdy9sSW5ZRE11ZHJieUdFamxkQzZE?=
 =?utf-8?B?ZlJraTdzeEpHeTNSYmpDWGRVMUMrbnpHMkQ5eWM5dzg4M1RUclJOY0pFQTU5?=
 =?utf-8?B?cm1IQkdKNkdIUStIL1J3WUVxSVpOOTM3RGFPMG1PSnFCZkJtUzJKbEJjUmhH?=
 =?utf-8?B?TWZ2a3BHV2ZodisxcXJXY2p1SHN5VjdKMjNOQ2Z0d0JGWXJIK2s2RG5kUldx?=
 =?utf-8?B?VDA4MkhTQ0dzL1cyY2dobFJkMkJwOGZvZ1JDeDk1OEJaUXRTWDFDeVlpSWRP?=
 =?utf-8?B?ak50VFR1QW1BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWlMSTArWXI4c2RCNUp4OEdOcnFqYmxIWm1md1ZZdVpFNmxPdnViQXE3cm1Q?=
 =?utf-8?B?Ykx3REN4THNlUW9lUHUrandZMUVvcmVmU0ZvREwwdEVLbXYweE9BTFAzNnNJ?=
 =?utf-8?B?c05POE9MR01BOU9MNTFHRktsd09Ja1E5UHpOek92Y0w5NnBIZ28vMmJ1S0p1?=
 =?utf-8?B?blhkb1VkazgrNlJ4QTVUN3FlMWtON2RySXhJbE1BeFA0aXB1VnR6SG0zZytJ?=
 =?utf-8?B?UkVvLzFrb1QzQ0toV0xXYkRuVmRTbzRaYk5XTk0vWm12YzZKUTBNTUdIdjJQ?=
 =?utf-8?B?c3htdlhqVDNGS0VLQXdNdjRYdnplUEtHRkxXb3VuQVk2aDZLVzZOdm94VUZi?=
 =?utf-8?B?MHNsUnlDd3piV2lNOFpydGpBdmlYbE9PaTNYM1k4UHlmM0JiRWt1aGhON00w?=
 =?utf-8?B?RHFRR3FrSjNKU3g0OHJSU0FXbHp4Wi9IOENVS1UvUDFWWWk1RFUydExNTEp0?=
 =?utf-8?B?MERpQXFtSWNjQWp6d0g3bm42VWZ2VGE0dWE3U2lqa0ZWdmdhRmxGR3lMQUZy?=
 =?utf-8?B?Z3BxNjFuQVdsbTl6U3NwTDg3TjR5aVdiSi9WdmFaSVVLbFVpdUVhMGtTMFZ6?=
 =?utf-8?B?RXM3aUFaTFpmaGJOZGxuaHdLdmdxeHhtNWZLdzkxb00rSTMwWk44WVlNemlZ?=
 =?utf-8?B?d1NmR0liRnNuTldPQllGMElkeDhvSU4vWEJiY1RKQjVVK20zM1JTbUtGYjhW?=
 =?utf-8?B?Tm1FUWFjQXJ1RGdQSitSeWhPYVNrOVZVL25mTS9uanlXZjVkNnArTFFOSEpX?=
 =?utf-8?B?d0JtWWltSFdBK2I0NFBwZVNOZ202UFUvQzhNQTVMRHE0L0pFd2lyeWRmbVJD?=
 =?utf-8?B?ckE0MW9KQlV3ZkJhMFlpa0cvNzN1VEJBY3E5REQxeFFJdlBrb1RrbW1nMmow?=
 =?utf-8?B?WVVtSVFDVnZQSXFZcFpwbjhHWmFPYzJxTWhMcXdyUENXZXQxMzZ5NFBLVmRL?=
 =?utf-8?B?bHBJVEZhYWE4NUdCNlRlbVhmTm9tUXh4ZklxMUx6VkxvQjF1YU56L2U2WkQv?=
 =?utf-8?B?V3MwQk5WenFsT3Y1WGVaV0dJWmNlVXAvNktxaW9RMnZKVjJIY2J0REc2dzd6?=
 =?utf-8?B?aXBwKzVUSWJtMWlJR05jL2dNZG1aYkd0eW0wUU1BT0ZlcGpPaUE5QUY4RGVL?=
 =?utf-8?B?S2IrTVlxQnZ4ejVpaXE2L1pXTzFCOE41NFpYOWt1ZGpOSXNmdlFtYTcyZ25n?=
 =?utf-8?B?ZWdtc3ZUU0JPc0NZeXAwcExSazNoTkl5VWFBRmFJQWpLS2EwWG1Yc0xYV1dU?=
 =?utf-8?B?M2FUbkExbStkbDVTdGtOOXJQK2ZhaFJvMk90WnM1ZThqaXVuK0pTY1BkY1Nn?=
 =?utf-8?B?VXFmVENXeTU2OXUxdjBuSmxBa2lqdVh4N1hKSFFZN1lmNWQrTGNKVFkzUDh5?=
 =?utf-8?B?VEFiRWRzU1dXbUZmbC95Q1hOeXhPMkw4ZUowdERINEV5TkpMcm5LTXZjZWxh?=
 =?utf-8?B?SU8zNWpoKzZpN2UrQkhaclJjVDduWHRCd1Y1c1hMWFYxODdXRWRDVUpua2Y1?=
 =?utf-8?B?QmdXYmRHNlNScFZSZHE1aC90MEFJZ3EzbTY3a3JGbkFJc0FQckZ5aE15Qkxq?=
 =?utf-8?B?ZEVqUzlMVUxwNzhZUlB1YUZ6WkxncnZQSnBFdSsrNDYxamFuS0VuRHk1akdD?=
 =?utf-8?B?b1lIUEtwNlJTS3pKS3l5d2tma2RlSmFNQjhUZzNrNzBGVmtJZWtiQlhvOVo4?=
 =?utf-8?B?S0FWOHkxd1RIRnZtc2ZyQjFmck9teDdzbG5FdCtLUFMwbkdzUzhrMW05b3ox?=
 =?utf-8?B?YmV4T0YxTzlSaUVobkZVa3h4UkFTRlVGWVlmWm1Bc2JwTmhzWXVXaWg0L2hD?=
 =?utf-8?B?b3BwUDBCYWI3TVdvNkJDV29vek1TbG5RYUEvQVVkUEw5dGNXTUtBRFVNMG5q?=
 =?utf-8?B?Uis4SXZBNXR5NHkveVYxSnZZL0xhUUF6bmhPbzhtMFNBamYwS3ZVUmFnWnRD?=
 =?utf-8?B?QzNYeXRnNHd4S3dhRGJ4eW1ubkU3Z0p1Q0FDcEhWeEZOaDVuYU1FU3pBd2gv?=
 =?utf-8?B?bTFBcnBpalFlcjQxTi8xaGhCRFFzU1dvWEJOMWJBc2w2YnVRci9zVm5ra2JH?=
 =?utf-8?B?WkxyRThqUGoyc3dleE5lUHB0b3V5aml2RGJiVlZFV1l6T0c4anUyWnlKQjhB?=
 =?utf-8?Q?fR16kWfqGyaSlrSEYq1QBquWB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C77ED3B19B66804DAE85D08D41C49C71@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993c9abe-786b-4cb7-9b94-08dda487a19b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 23:20:59.5052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdeRe/xPjmcXSYJkxKnJ1YqNBwPIVF+k29oK51GCvO+pwDr6YMr0e3vpWKxxL7ROM2ciU4bqplOK3VlNovKPSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7908
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTA2LTA1IGF0IDE2OjU5ICswMjAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToN
Cj4gT24gVGh1LCBKdW4gMDUsIDIwMjUgYXQgMDc6NTQ6NDhBTSAtMDcwMCwgRGF2ZSBIYW5zZW4g
d3JvdGU6DQo+ID4gT24gNi81LzI1IDA3OjIxLCBQZXRlciBaaWpsc3RyYSB3cm90ZToNCj4gPiA+
IC1zdGF0aWMgaW5saW5lIHU2NCBzY19yZXRyeShzY19mdW5jX3QgZnVuYywgdTY0IGZuLA0KPiA+
ID4gLQkJCSAgIHN0cnVjdCB0ZHhfbW9kdWxlX2FyZ3MgKmFyZ3MpDQo+ID4gPiArc3RhdGljIF9f
YWx3YXlzX2lubGluZSB1NjQgc2NfcmV0cnkoY29uc3Qgc2NfZnVuY190IGZ1bmMsIHU2NCBmbiwN
Cj4gPiA+ICsJCQkJICAgIHN0cnVjdCB0ZHhfbW9kdWxlX2FyZ3MgKmFyZ3MpDQo+ID4gPiAgew0K
PiA+ID4gIAlpbnQgcmV0cnkgPSBSRFJBTkRfUkVUUllfTE9PUFM7DQo+ID4gDQo+ID4gUHJhY3Rp
Y2FsbHksIEkgY2FuIHNlZSBob3cgdGhpcyB3b3Jrcy4gSWYgdGhlIGNvbXBpbGVyIGRvZXNuJ3Qg
aW5saW5lDQo+ID4gc2NfcmV0cnkoKSwgaXQgc3RvcHMgYmVpbmcgYWJsZSB0byBndWFyYW50ZWUg
dGhhdCB0aGUgZnVuY3Rpb24gcG9pbnRlcg0KPiA+IHZhbHVlIGlzIGtub3duLg0KPiA+IA0KPiA+
IE15IG9ubHkgd29ycnkgaXMgdGhhdCB0aGUgY29tcGlsZXIgZGVjaWRlcyB0byBiZSBzdHVwaWQg
Zm9yIHNvbWUgb3RoZXINCj4gPiByZWFzb24sIGl0IGNvdWxkIHN0YXJ0IGdlbmVyYXRpbmcgaW5k
aXJlY3QgY2FsbHMgYWdhaW4uDQo+ID4gDQo+ID4gQXJlIHdlIGNvbmZpZGVudCB0aGF0IF9fYWx3
YXlzX2lubGluZSB3aWxsIGtlZXAgdGhlIGNvbXBpbGVyIGZyb20NCj4gPiBnZW5lcmF0aW5nIGlu
ZGlyZWN0IGNhbGxzPw0KPiANCj4gRmFpcmx5IHN1cmUuIEkndmUgdXNlZCB0aGlzIGVsc2V3aGVy
ZSB0b28uDQo+IA0KPiBBbHNvLCBpZiBpdCBldmVyIGRlY2lkZXMgdG8gYmUgdGhhdCBzdHVwaWQs
IEknbSBnb2luZyB0byBsb2cgYSBidWcgYW5kDQo+IGNhbGwgaXQgYnJva2VuLg0KDQpUaGFua3Mg
UGV0ZXIgZm9yIGhlbHBpbmcuDQoNCkkgdmVyaWZpZWQgUGV0ZXIncyBjaGFuZ2UsIGFuZCBJIGNv
bmZpcm0gdGhhdCBmaXhlcyB0aG9zZSB3YXJuaW5ncy4gIEJvdGgNCmdjYyBhbmQgY2xhbmcgKHdp
dGggQ0ZJKSBidWlsZCBzdWNjZXNzZnVsbHkgdy9vIHRob3NlIHdhcm5pbmdzLg0KDQpIaSBEYXZl
LA0KDQpKdXN0IHdvbmRlcmluZyBhcmUgeW91IGhhcHB5IHdpdGggUGV0ZXIncyBjaGFuZ2U/DQo=

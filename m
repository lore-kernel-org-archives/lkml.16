Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF4D14D2A0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.247
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668948; cv=fail; b=Lk0KegLQcn3ZvduEwJHEejHkqcE9e+ruCt7b52nZkgZjn0mnUXco1ZMj3FBuEcOFuqcfFE6S8nYO0q1S7a1GgAWQmMUUfyMlcmksu3/R2l9t/lCYML7vKlgwVPIfy2IYSMXz3lluZb/+kMlOuV1nHMsAkhecNLc80AIEoclmZXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668948; c=relaxed/simple;
	bh=WOkh7bGfA9I4PonTrepUKOusdLeh2Kn2xVSibCSZsE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E9rT6PzYdVFxP5xFQaq9Zp1xEOga7TprbJcJPbGpPnlyAlPWrliSY3K41eFEG8fBDuUSkX+iy32H4qQKe6WMrn8CZut8dBFMTfUlc9eK5X6w8x0LczIP1SzpNE91tRP7Js89OpHAii8jHE11yJO0lUourlp2jWOWTBmZbakJjmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=KyhBiv73; arc=fail smtp.client-ip=68.232.159.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="KyhBiv73"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1750668945; x=1782204945;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WOkh7bGfA9I4PonTrepUKOusdLeh2Kn2xVSibCSZsE4=;
  b=KyhBiv73tGscxu1WYnbmMCBev3LEg/PjuvQJ5FmDNnxjRmNiHr4XDpE0
   8Czf8QXN8fqTaq6h9gfyVGGWIj4XBPBQSYXQbMOFsIfFKKB7Ml9R7v1v5
   YDVE04nvNqD4CH4sWo0h6tPgHIaGR3BKcghrqFoLTADHx6+X3Bvp60OKB
   hmGpgurI/2apizV1v9NeZVyx5WEcqKDe5Ysa5e3br/JN82DGd4IyY9kpM
   wg/b3vhOiS5hOFZ05g79qCwXVyN6J2WCq83k02fAGI2pZZUTITs3nxhxA
   63gjSsRGJTEVB48gbZxVru3Du5ajIGwep6usoN0ZWtgMBHesRSc41c51v
   g==;
X-CSE-ConnectionGUID: xfKdrG9UTmSdiqFVZmmy7Q==
X-CSE-MsgGUID: PM5lfNuzTvqvdSmFQFJaqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="159487100"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="159487100"
Received: from mail-japanwestazon11010034.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([52.101.228.34])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 17:54:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8onjohgmh+mrxAs2t+9JTrTN3iOoKwSrKMBO/A7AVX5Kmoxj2JJBNaU9LTnYIhr+XZuHkMvnoJk/g0l5BjOi+O2vg5Gc+8K8nzBAfacI6Ej+mu8VPk5ydAXYLve4TydV5r4m/IevKHYpNMtlWu7CFtrsc5I/pIxivZgfrbay00o4A6cjYA4YwMm5nwKvORhpd3LdejP6WxP+nJXKe2iNdO0gOzMqb1ZpeO7+z081s0Yl9WGoZ3Z9/mZOCVjWt37FtFJwmwVcMfhaShmYi1VWW5H5akt431hlw0tuYrIGDk63AVYoXjF5ZOg+hDxZbKIpdScQXMtAUAkcpmrhuwDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOkh7bGfA9I4PonTrepUKOusdLeh2Kn2xVSibCSZsE4=;
 b=lehYZ8KP48Atan2i7E3s+gD+IWCs1SBA2Qrdk2ovXR+qCwpEBarBnP8joMGWpQNLkZL/O9eA4uM8zbwvNK+z1RYgRdiI3aZL89eYcOPWagcD5rJKiEYuu6QZB+lzbM5JjJrMdED4t0dFhY0yvBq+TJtabp0cQy+YZhKiVV4zgmZLjgjdz+mi95wd9kpAZEPTSpD1vxDNvsZYshf4wOC1vBTUkX/PgT941EHO995ZOVel/fHI4NRYmnXLiyI8oGrf1a+U3PjUMJe4gOdDpB9vCYlpT5NSHBmbKa6C5s+nFYCTEDqVa/4OuSGWWb6Ez7qYfibiaBzIWosa//GDEs1+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSCPR01MB14468.jpnprd01.prod.outlook.com (2603:1096:604:3a3::6)
 by TY4PR01MB13397.jpnprd01.prod.outlook.com (2603:1096:405:1d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 08:54:29 +0000
Received: from OSCPR01MB14468.jpnprd01.prod.outlook.com
 ([fe80::5078:96dc:305b:80e0]) by OSCPR01MB14468.jpnprd01.prod.outlook.com
 ([fe80::5078:96dc:305b:80e0%6]) with mapi id 15.20.8857.025; Mon, 23 Jun 2025
 08:54:29 +0000
From: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Yasunori Gotou (Fujitsu)"
	<y-goto@fujitsu.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH RFC] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE
 accounting
Thread-Topic: [PATCH RFC] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE
 accounting
Thread-Index: AQHb4O8+3JAmQi4CJkOTrFR9Vb84LrQLl3I+gATfiIA=
Date: Mon, 23 Jun 2025 08:54:28 +0000
Message-ID: <47f42c60-9752-4bc6-9079-627b6e0b9cfc@fujitsu.com>
References: <20250619075245.3272384-1-lizhijian@fujitsu.com>
 <87ldpn2afw.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <87ldpn2afw.fsf@DESKTOP-5N7EMDA>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14468:EE_|TY4PR01MB13397:EE_
x-ms-office365-filtering-correlation-id: 7ee2e435-e62d-4a28-e503-08ddb233905b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2d1ZEZrOVFhY0J5Z1gyUHZwTGMyM3VXMUJuL3Z5a0FvZ2xOWnZNWU44TmEv?=
 =?utf-8?B?eGMycHl1endwdkoxckFic1ZOR0c2OHRnQ0tuYzcwNk4wUS9ZLzJudjRMVzZL?=
 =?utf-8?B?RlNob04yL3FCVzV6dHNEamRmOVhGb3V1eVdxSkYvTXFDNm9ic0V3VmdjY2x2?=
 =?utf-8?B?dWNoTlIxNUQ4K0ttZzF5ME5aRmU1Mk5CWnF4OTFQcWpCeW1meU1Tdk84cEJN?=
 =?utf-8?B?M0pDWnRiaHNMNFZ0QVhXZXBpdEdEeS9TQmIyaWVqMCtEQkVRbUE5NUluazNT?=
 =?utf-8?B?eGwzS0craUtXQjdMOFYvSXVVS1FqekVhV3htOWFUMGY1Y1d4NFU3Z3BpSitU?=
 =?utf-8?B?UVM5VnN3bElxMGh4ZFd4UTg4bTNicGsweTl4ZFFrYU9tSlpvUEhMdGhvOTd4?=
 =?utf-8?B?cWZMSFFSQUxYL3pnL3lNVC9menNBa2xZS0dzT3VNR0pvcFY2cTlxQWw4SHM0?=
 =?utf-8?B?em1ZNldPRWNTSWtjSUVta1ZPOE9xYTJBUnhCa3hma1VvdnRPYlVCQXJsU3pN?=
 =?utf-8?B?UkRrUFpyYkJXQ25lcS9UTVlINmxZbytZVS9keFZmanhLMkxMNnFvZ2FOOVZC?=
 =?utf-8?B?MzBPNHpYQWJvZlFaZ1RUS05ieXBYWnlza1FuN3ZBNTBCeFErT0lLbDluK2pS?=
 =?utf-8?B?ZG9CaWp2UElTYzdZRk9rQWRXMnM5dklJRVRuWFNUakZ4anJ3eWlZZkxQK202?=
 =?utf-8?B?OGxpem9wT1h3UnZGYzYveU1ISitXWUFwUXRGeW96LzA2Nk9xdGYzU0wzOTdP?=
 =?utf-8?B?VWo0SU9rTmhFd2FQWHY4UzJLSG1tUyt4QUs1RWFnMVVtN05tTDVpOEN3alZU?=
 =?utf-8?B?bFJLOXhPREJiY1k1dG5GVXEvdHd0Y0x6UldCa3hTUERrYngxUmhUdzlpakEz?=
 =?utf-8?B?NDAzSzlDeVZNTGJDUDhOWitrc1dJcWNuUFhRM2VVdDI0VnF5dXVpL2praElP?=
 =?utf-8?B?c2pCakM1TWE1ei9hQk1PT3FoTlpZWkJXbGJGVVVRYWNoUFNQSTJFbEl3V01i?=
 =?utf-8?B?bHd5bTBjakxTWUJzWi81aWhLVCtJS3FWdXNGNlVvRHdCNnZGcnl6a3BNUUlu?=
 =?utf-8?B?TU84OTJsYXJiNmJSYVh1cDFWUGNzbUZDZnNuZXJKWW9FTU90aDlkMStvTmU4?=
 =?utf-8?B?TUNKTExncjRzaC9DZU9yRXRvSVJWb3ZxZGE1SGtxd2FCaHRCVTlOQlVNY080?=
 =?utf-8?B?eGhHa2VkVmRTSHV5VFJBVUVRNE1nK0VOSndZYnJWcjVwM0FXcEZHTFFleEVP?=
 =?utf-8?B?WGJ2Mi9waVVrU2NGNHpjVmhYUjR3S2VvTnJWTENxWVVkZXh6Y09iV01MQnN1?=
 =?utf-8?B?eDZPRC94SlhlUWhVVklhNFdIaEtTTUkyNGJVMnJ0VEVXaUVjcUxFZjEvQ3JF?=
 =?utf-8?B?Y010dC9pQjNDOU1kN0FwQ1BxU09zMTAwRm5FRVdUeUV1cm5JWE5oWlBiMVpJ?=
 =?utf-8?B?RzQzMUJCUktJQittcFFockVhTGhIbldrcDFDRjM3VjAzcmRhVDF3MGF4ay93?=
 =?utf-8?B?Ny8veEJzWXRmRW4vc2pyZGQ3K2NsMHo1MjdwamsyMFo5YzVBM0JSTjFZMFh4?=
 =?utf-8?B?NTVLWk13NTdSQ2pGVUFMS3FrditIcUJpaFVyTjV2LzZhb0s3eHlhNnNTZkkz?=
 =?utf-8?B?Z1FwdEh2eFpucVBVZjBlNkpSajFOOTRqQUpsNXJrRG1hdFMyTk05OHE3dWtB?=
 =?utf-8?B?a1NIQlYzQWJSYWNjSHU3WkxpMGJrWlhIU0JaTTlacDNlOXJyeW5PenpWTUZG?=
 =?utf-8?B?eEtJcFYxQWNkNXpNWFlEVzRsVXpOcFpCelFhTFJKOFpJUkpHWUhYNmxzblBO?=
 =?utf-8?B?MnQ5eEIzbmFubjhFN0dLOW9FZ0d3T2J0SWFCa24ydzhKN21LQmlYdjZXOHhL?=
 =?utf-8?B?ZXAwMFVhZXd5MDVKVTR5dDNDMmIySlNtYU0wWjExVC9HNzF2WThWWXNiTVhi?=
 =?utf-8?B?YWF5Ukc3Z0FpY0ROcHgrTmRWREhuSlRQZm9GSWhWdEd3UlpXcjFTbkVaaTFO?=
 =?utf-8?B?cVRSeVNqQUplajFJOStOYWpWTjJGTEhJR0YxeGJRaWh3aG83TWhQM0dMczhV?=
 =?utf-8?Q?mRz9Ka?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14468.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHVLclRxMmIzTC9YcTRhK3RHdmRvVGhScnVZbnBYQ1RwUDhGM3ppbWVmU0p3?=
 =?utf-8?B?VTN4cEdsaDhyeGhlNnVHR2crajdBU0w0K0YvdXFBVi9ybzRQMC90aVpEZU9E?=
 =?utf-8?B?bStyQ2NJVDRiTks4aXNlZC9PVjZDQ2lhVThRRTJTVlFLL1cyUmNpWTZZalY3?=
 =?utf-8?B?bDU1TzJIMnVFRGpNbytKa09wb1MrN0NUaWNpRnU5K3c3YXRLcTQvNThFWUJi?=
 =?utf-8?B?dHVjZlNLbXE0dUN2Z0FqalRLMExtOWFDNDhaSVZxcGR4TVZzS2pSc3djUWg3?=
 =?utf-8?B?blZtcFlyVkJEYW1sOHNkMXRyTnZFSjFLVGg0empCcURVdDVEY0ErQkVhajg3?=
 =?utf-8?B?czc2bFEyM3hlbUxCVWtMcTh0alcwVVRHNmVhZDdvTlFTMHFVRVRlYjhrekJM?=
 =?utf-8?B?SFZCNDZFdDBNd3diOUZKS3pucENNdk15dmhuSDBGQVZxZUJjZFozTHVqd21N?=
 =?utf-8?B?bHBNVTBKWnlrcjlrMG5LQjcxS25YZDAvWnBjS2ZaMnN0YlJGWnhRWmN2eHJi?=
 =?utf-8?B?Vk9NUGlqNWtwRTlXbC9YRCtlSUYrTndHVUlwL21mcXBzbEpsRjZ4STJYWGdu?=
 =?utf-8?B?TnNUam00aHdrZ25kdk9VTFZRWnRialpwTEVPck5GbGRwYU5zcE95NlM0TXY2?=
 =?utf-8?B?emFxbldsSmNUbkpJQWx1WE5zcW05Z2dySW5jd1ZuWS84ckF1d3FyYWVQOHM4?=
 =?utf-8?B?ZFpHTXp3aU1DU25sNHFLd29oV0hQVVFVQ2EvSi9jSFRudjRBYnd5THhHWW81?=
 =?utf-8?B?YW8vdmMyLzJtaGFwUnhPVG5ESThoZzNzcHdDbGdOQmtyOVJrV2JIa01WdW1Z?=
 =?utf-8?B?eFNBMDlhZmwzbEZaYys2bUwvTTg3dG5GbHBjZ3dNaEVBUWJPQ1J0SEp5UUM3?=
 =?utf-8?B?KzNjQTFyMjY0VEFtcEoxV1kwMHNPbGZJbXZMbkg0ekhvMlplTEgxczlVdFcx?=
 =?utf-8?B?bThKMVYvck5neXRhYmJKSnFadnNmWFViRUlXQ081SVA3aDFUTlU2YTYyNVJn?=
 =?utf-8?B?S3lXZDM2VzQ2L052KzRvVG10R2Vid01GK2pMMHRVTUIyY3liejh1MVJmVm9N?=
 =?utf-8?B?SWJPanB1NkJFMW5oL2FrRlc1L2dtTnFpMXg3Nnh4MzBacE9XMGpIdkVFRklK?=
 =?utf-8?B?alo0UGpxU3J1R216cXpUcHZMSDVFY1NodzBMMlorUHdIVXVGdUZkSDNkUkcr?=
 =?utf-8?B?em1MeHNlb1RFWm1HSEY0R0swWkpzMUE5Q29PZ0JvcG5kZW9XZThwZXBDRFNh?=
 =?utf-8?B?Q3ljWjJ6bmNCRlJlRitTNGNyTDJnWVYzQUx2WmZka1ZxQU9obGxKUlpOOGp5?=
 =?utf-8?B?b2lIL1RRV3pmMHFhZVk0QXptQmplblY5YjdOa3l4SmdGVVhXOTdwS1lGMUVj?=
 =?utf-8?B?TWRWUVVpVmxpTTByaVdRTlIzYXdTU0taajZHSjBVaHZ6ZFVaSnY1RWs0NDZy?=
 =?utf-8?B?N05tODM4Y0ZMOTlndzVIeVZWdTl1cEhFcXBMM2FNMjlSWnRaTUUwUjU5dktK?=
 =?utf-8?B?SGx1aFY2S2FJblpJT0ZYcWpFNjE2dloySXpwMjVwSGQzNTN5Y0hXK2Q1UENL?=
 =?utf-8?B?d1lMbGZoQWp4dW41MzJPaDlnWUVUWXdqYko0alNEanFjeHZtQkFRSlYvb1Yx?=
 =?utf-8?B?VEtDNGdEQ3QxQWFkYlJDT2h2LzUrcFhucU9PTktKblJvODVNRFBFM1k4a1or?=
 =?utf-8?B?bzlkM3lBMERmRjZibm1ycHRZT0tZRThoVVU3Ymp2NVU5SURtWjBBMjg3MTlH?=
 =?utf-8?B?SUpYZnpBRkJLUVN0dXZvN3B2azNNRHlON0oycklEbWpxNDl2Qnd0Z0lzZ1pS?=
 =?utf-8?B?UjJuTVpQdDdWUCtuT2dqNXlTblg0UG82U2ZKTTEzaFNydmQ5U1dTSk04dTlK?=
 =?utf-8?B?NDB4VXg2YUJBY21xdW9PZ3gyODF4bTVSUDJDUkVMRVpaWnZaOFN5MTFnZlFG?=
 =?utf-8?B?aERYUDk0emtLcXhyOFdab0Q2QnFFbFJrSnNOZlpMM1dVekgwUEhkblo3SGVp?=
 =?utf-8?B?UXM4ODI0b0N0TDMyYjhsaGU4Sm1JbGNoSC91ZjBVQXdIbXpKNUJTVmxYbG9K?=
 =?utf-8?B?Nlk1RGVCVnNGYWV0dDZkTmRtdkd2bEw2UzBlTU5vTTR2M1JsdEluMVNSVloy?=
 =?utf-8?B?djY4cDdCejNjWlhlWlVSSmxjS3hsdW42T1VGbElLS1NwSUYzK09aZ0tLSUNN?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B36694B6886A842B7C431B00D874C4D@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bMuTQN6ov4XOcOY3fxd8s9OhDyVPDcfvfNTJxpFF5mI0uR4onk4JVMUc/H5WBPKgxYBrBUerOcWsFlyIQS8o7xVb6/eBpUElvyzitguPOJNvyAz1G+jBpZ7vS8gz4jEok9K5n48fnaXBrM3OJc+XEmbbGT38f5REP3HrQPGxBZhPiOalJwGCRqTeDnHqYMsrtWWqj/TEC9sE7xoRw4Q4/kUMZ2thNDPz23QK3a693kperu1urFr9mUL4gYJeWGJRdgmS07yolIX2DtZH7JpIBEswKWVSkwGivaLTdCUOR0XvvVM42aqGvhcI15XgZYLTpwHnhSfEX9nLYXiOeuPlQhxRO3SukhZ9M9BMRbTNQAoVxIVE5mcKlFK1GiFkd6UBLWuC6H9QFQvgdSmv1frhRYuVDQtq/bxihtMWoLSZRIUSQMw/ZvxKz9QCpIT594xBobo9eJJgaPnBUVHQkg1J2N64DFVaBNFrNP+qA6VTO0uLfH57BEANKgNADyDMO+0fzw13g7v1HqMwas+dttRpVFxdkpTeKMnG5LQkiHbuWmGjmmfgGtCl4dgusCdNcm72QsVxPGUGuAETFNR9wDSdHgZjrEMAzUkQmaKxkRwD/5m8wXBIzv432OsxpCrvK+TO
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14468.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee2e435-e62d-4a28-e503-08ddb233905b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 08:54:29.1266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oV40j6XpnZi3XUYzux965hP1spuQe9SiiA6gD4PJn7rnuWQJ/XxppARP/H8jBNIIyswWKkvAPW97H7SRIGRTOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13397

DQoNCk9uIDIwLzA2LzIwMjUgMTQ6MjgsIEh1YW5nLCBZaW5nIHdyb3RlOg0KPiBMaSBaaGlqaWFu
IDxsaXpoaWppYW5AZnVqaXRzdS5jb20+IHdyaXRlczoNCj4gDQo+PiBHb3RvLXNhbiByZXBvcnRl
ZCBjb25mdXNpbmcgcGdwcm9tb3RlIHN0YXRpc3RpY3Mgd2hlcmUNCj4+IHRoZSBwZ3Byb21vdGVf
c3VjY2VzcyBjb3VudCBzaWduaWZpY2FudGx5IGV4Y2VlZGVkIHBncHJvbW90ZV9jYW5kaWRhdGUu
DQo+PiBUaGUgaXNzdWUgbWFuaWZlc3RzIHVuZGVyIHNwZWNpZmljIG1lbW9yeSBwcmVzc3VyZSBj
b25kaXRpb25zOg0KPj4gd2hlbiB0b3AtdGllciBtZW1vcnkgKERSQU0pIGlzIGV4aGF1c3RlZCBi
eSBtZW1ob2cgYW5kIGFsbG9jYXRpb24gYmVnaW5zDQo+PiBpbiBsb3dlci10aWVyIG1lbW9yeSAo
Q1hMKS4gQWZ0ZXIgdGVybWluYXRpbmcgbWVtaG9nLCB0aGUgc3RhdHMgc2hvdzoNCj4gDQo+IFRo
ZSBhYm92ZSBkZXNjcmlwdGlvbiBpcyBjb25mdXNpbmcuICBUaGUgcGFnZSBwcm9tb3Rpb24gb2Nj
dXJzIHdoZW4gdGhlDQo+IHNpemUgb2YgdGhlIHRvcC10aWVyIGZyZWUgc3BhY2UgaXMgbGFyZ2Ug
ZW5vdWdoIChhZnRlciBraWxsaW5nIHRoZQ0KPiBtZW1ob2cgYWJvdmUpLiAgVGhlIGFjY2Vzc2Vk
IGxvd2VyLXRpZXIgbWVtb3J5IHdpbGwgYmUgcHJvbW90ZWQgdXBvbg0KPiBhY2Nlc3NpbmcgdG8g
dGFrZSBmdWxsIGFkdmFudGFnZSBvZiB0aGUgbW9yZSBleHBlbnNpdmUgdG9wLXRpZXIgbWVtb3J5
Lg0KDQpZZWFoLCB0aGF0J3Mgd2hhdCB0aGUgcHJvbW90aW9uIGRvZXMuDQoNCkxldCdzIGNsYXJp
ZnkgdGhlIHJlcHJvZHVjZXIgc3RlcHMgc3BlY2lmaWNhbGx5KHRoYW5rcyBHb3RvLXNhbiBmb3Ig
dGhlIHJlcHJvZHVjZXIpOg0KT24gYSBzeXN0ZW0gd2l0aCB0aHJlZSBub2RlcyAobm9kZXMgMC0x
OiBEUkFNIDRHQiwgbm9kZSAyOiBOVkRJTU0gNEdCKToNCg0KIyBFbmFibGUgZGVtb3Rpb24gb25s
eQ0KZWNobyAxID4gL3N5cy9rZXJuZWwvbW0vbnVtYS9kZW1vdGlvbl9lbmFibGVkDQpudW1hY3Rs
IC1tIDAtMSBtZW1ob2cgLXIyMDAgMzUwME0gPi9kZXYvbnVsbCAmDQpwaWQ9JCENCnNsZWVwIDIN
Cm51bWFjdGwgbWVtaG9nIC1yMTAwIDI1MDBNID4vZGV2L251bGwgJg0Kc2xlZXAgMTANCmtpbGwg
LTkgJHBpZA0KIyBFbmFibGUgcHJvbW90aW9uDQplY2hvIDIgPiAvcHJvYy9zeXMva2VybmVsL251
bWFfYmFsYW5jaW5nDQoNCiMgQWZ0ZXIgYSBmZXcgc2Vjb25kcywgd2Ugb2JzZXJ2ZSBgcGdwcm9t
b3RlX2NhbmRpZGF0ZSA8IHBncHJvbW90ZV9zdWNjZXNzYA0KDQpJbiB0aGlzIHNjZW5hcmlvLCBh
ZnRlciB0ZXJtaW5hdGluZyB0aGUgZmlyc3QgbWVtaG9nLCB0aGUgY29uZGl0aW9ucyBmb3IgcGdk
YXRfZnJlZV9zcGFjZV9lbm91Z2goKSBhcmUgcXVpY2tseSBtZXQsIHRyaWdnZXJpbmcgcHJvbW90
aW9uLg0KSG93ZXZlciwgdGhlc2UgbWlncmF0ZWQgcGFnZXMgYXJlIG9ubHkgYWNjb3VudGVkIGZv
ciBpbiBQR1BST01PVEVfU1VDQ0VTUywgbm90IGluIFBHUFJPTU9URV9DQU5ESURBVEUuDQoNCg0K
PiANCj4+ICQgZ3JlcCAtZSBwZ3Byb21vdGUgL3Byb2Mvdm1zdGF0DQo+PiBwZ3Byb21vdGVfc3Vj
Y2VzcyAyNTc5DQo+PiBwZ3Byb21vdGVfY2FuZGlkYXRlIDENCj4+DQo+PiBUaGlzIHVwZGF0ZSBp
bmNyZW1lbnRzIFBHUFJPTU9URV9DQU5ESURBVEUgd2l0aGluIHRoZSBmcmVlIHNwYWNlIGJyYW5j
aA0KPj4gd2hlbiBhIHByb21vdGlvbiBkZWNpc2lvbiBpcyBtYWRlLCB3aGljaCBtYXkgYWx0ZXIg
dGhlIG1lY2hhbmlzbSBvZiB0aGUNCj4+IHJhdGUgbGltaXQuIENvbnNlcXVlbnRseSwgaXQgYmVj
b21lcyBlYXNpZXIgdG8gcmVhY2ggdGhlIHJhdGUgbGltaXQgdGhhbg0KPj4gaXQgd2FzIHByZXZp
b3VzbHkuDQo+Pg0KPj4gRm9yIGV4YW1wbGU6DQo+PiBSYXRlIExpbWl0ID0gMTAwIHBhZ2VzL3Nl
Yw0KPj4gU2NlbmFyaW86DQo+PiAgICBUMDogOTAgZnJlZS1zcGFjZSBtaWdyYXRpb25zDQo+PiAg
ICBUMCsxMDBtczogMjAtcGFnZSBtaWdyYXRpb24gcmVxdWVzdA0KPj4NCj4+IEJlZm9yZToNCj4+
ICAgIFJhdGUgbGltaXQgaXMgKm5vdCogcmVhY2hlZDogMCArIDIwID0gMjAgPCAxMDANCj4+ICAg
IFBHUFJPTU9URV9DQU5ESURBVEU6IDIwDQo+PiBBZnRlcjoNCj4+ICAgIFJhdGUgbGltaXQgaXMg
cmVhY2hlZDogOTAgKyAyMCA9IDExMCA+IDEwMA0KPj4gICAgUEdQUk9NT1RFX0NBTkRJREFURTog
MTEwDQo+IA0KPiBZZXMuICBUaGUgcmF0ZSBsaW1pdCB3aWxsIGJlIGluZmx1ZW5jZWQgYnkgdGhl
IGNoYW5nZS4gIFNvLCBtb3JlIHRlc3RzDQo+IG1heSBiZSBuZWVkZWQgdG8gdmVyaWZ5IGl0IHdp
bGwgbm90IGluY3VycyByZWdyZXNzaW9ucy4NCg0KDQpUZXN0aW5nIHRoaXMgbWlnaHQgYmUgY2hh
bGxlbmdpbmcgZHVlIHRvIHdvcmtsb2FkIGRlcGVuZGVuY2llcy4gRG8geW91IGhhdmUgYW55IHJl
Y29tbWVuZGVkIHdvcmtsb2FkcyBmb3IgZXZhbHVhdGlvbj8NCkFsdGVybmF0aXZlbHksIGNvdWxk
IHdlIGNvdWxkIHJlbHkgb24gdGhlIExLUCBwcm9qZWN0IGZvciBpbXBhY3QgYXNzZXNzbWVudChD
dXJyZW50IHBhdGNoIGhhcyBub3QgcmVhbGx5IHRlc3RlZA0KYnkgTEtQIGR1ZSB0byBhIGNvbXBp
bGluZyBlcnJvciwgSSB3aWxsIHBvc3QgYSBWMiBzb29uKS4NCg0KSG93ZXZlciwgcmVnYXJkaW5n
IHRoZSByYXRlIGxpbWl0IGNoYW5nZSBpdHNlbGYsIEkgY29uc2lkZXIgdGhpcyBwYXRjaCBsb2dp
Y2FsbHkgY29ycmVjdC4gQXMgc3RhdGVkIGluIHRoZSBudW1hX3Byb21vdGlvbl9yYXRlX2xpbWl0
KCkgY29tbWVudDoNCj4gIkZvciBtZW1vcnkgdGllcmluZyBtb2RlLCB0b28gaGlnaCBwcm9tb3Rp
b24vZGVtb3Rpb24gdGhyb3VnaHB1dCBtYXkgaHVydCBhcHBsaWNhdGlvbiBsYXRlbmN5LiINCkl0
IHNlZW1zIHRoZXJlIGlzIG5vIGp1c3RpZmljYXRpb24gZm9yIGV4Y2x1ZGluZyBwZ2RhdF9mcmVl
X3NwYWNlX2Vub3VnaCgpIHRyaWdnZXJlZCBwcm9tb3Rpb25zIGZyb20gdGhlIHJhdGUgbGltaXRp
bmcgbWVjaGFuaXNtLg0KDQoNCg0KPiANCj4+DQo+PiBSZXBvcnRlZC1ieTogWWFzdW5vcmkgR290
b3UgKEZ1aml0c3UpIDx5LWdvdG9AZnVqaXRzdS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMaSBa
aGlqaWFuIDxsaXpoaWppYW5AZnVqaXRzdS5jb20+DQo+PiAtLS0NCj4+DQo+PiBUaGlzIGlzIG1h
cmtlcyBhcyBSRkMgYmVjYXVzZSBJIGFtIHVuY2VydGFpbiB3aGV0aGVyIHdlIG9yaWdpbmFsbHkN
Cj4+IGludGVuZGVkIGZvciB0aGlzIG9yIGlmIGl0IHdhcyBvdmVybG9va2VkLg0KPj4NCj4+IEhv
d2V2ZXIsIHRoZSBjdXJyZW50IHNpdHVhdGlvbiB3aGVyZSBwZ3Byb21vdGVfY2FuZGlkYXRlIDwg
cGdwcm9tb3RlX3N1Y2Nlc3MNCj4+IGlzIGluZGVlZCBjb25mdXNpbmcgd2hlbiBpbnRlcnByZXRl
ZCBsaXRlcmFsbHkuDQo+Pg0KPj4gQ2M6IEh1YW5nIFlpbmcgPHlpbmcuaHVhbmdAbGludXguYWxp
YmFiYS5jb20+DQo+PiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+DQo+PiBDYzog
UGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPg0KPj4gQ2M6IEp1cmkgTGVsbGkg
PGp1cmkubGVsbGlAcmVkaGF0LmNvbT4NCj4+IENjOiBWaW5jZW50IEd1aXR0b3QgPHZpbmNlbnQu
Z3VpdHRvdEBsaW5hcm8ub3JnPg0KPj4gQ2M6IERpZXRtYXIgRWdnZW1hbm4gPGRpZXRtYXIuZWdn
ZW1hbm5AYXJtLmNvbT4NCj4+IENjOiBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9y
Zz4NCj4+IENjOiBCZW4gU2VnYWxsIDxic2VnYWxsQGdvb2dsZS5jb20+DQo+PiBDYzogTWVsIEdv
cm1hbiA8bWdvcm1hbkBzdXNlLmRlPg0KPj4gQ2M6IFZhbGVudGluIFNjaG5laWRlciA8dnNjaG5l
aWRAcmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4gICBrZXJuZWwvc2NoZWQvZmFpci5jIHwgNSArKyst
LQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvc2NoZWQvZmFpci5jIGIva2VybmVsL3NjaGVkL2Zh
aXIuYw0KPj4gaW5kZXggN2ExNGRhNTM5NmZiLi40NzE1Y2Q0ZmEyNDggMTAwNjQ0DQo+PiAtLS0g
YS9rZXJuZWwvc2NoZWQvZmFpci5jDQo+PiArKysgYi9rZXJuZWwvc2NoZWQvZmFpci5jDQo+PiBA
QCAtMTk0MCwxMSArMTk0MCwxMyBAQCBib29sIHNob3VsZF9udW1hX21pZ3JhdGVfbWVtb3J5KHN0
cnVjdCB0YXNrX3N0cnVjdCAqcCwgc3RydWN0IGZvbGlvICpmb2xpbywNCj4+ICAgCQlzdHJ1Y3Qg
cGdsaXN0X2RhdGEgKnBnZGF0Ow0KPj4gICAJCXVuc2lnbmVkIGxvbmcgcmF0ZV9saW1pdDsNCj4+
ICAgCQl1bnNpZ25lZCBpbnQgbGF0ZW5jeSwgdGgsIGRlZl90aDsNCj4+ICsJCWxvbmcgbnIgPSBm
b2xpb19ucl9wYWdlcyhmb2xpbykNCg0KDQpDYyBMS1ANCg0KVGhlcmUgaXMgYSBjb21waWxhdGlv
biBlcnJvciB3aGljaCBJIG92ZXJsb29rZWQgYXQgdGhlIHRpbWUgZHVlIHRvIHNldmVyYWwgb25n
b2luZyByZWZhY3RvcnMgaW4NCm15IGxvY2FsIGNvZGUuIEkgYXBwcmVjaWF0ZSBMS1AgZm9yIGRl
dGVjdGluZyB0aGlzIGlzc3VlLg0KDQoNClRoYW5rcw0KWmhpamlhbg0KDQoNCj4+ICAgDQo+PiAg
IAkJcGdkYXQgPSBOT0RFX0RBVEEoZHN0X25pZCk7DQo+PiAgIAkJaWYgKHBnZGF0X2ZyZWVfc3Bh
Y2VfZW5vdWdoKHBnZGF0KSkgew0KPj4gICAJCQkvKiB3b3JrbG9hZCBjaGFuZ2VkLCByZXNldCBo
b3QgdGhyZXNob2xkICovDQo+PiAgIAkJCXBnZGF0LT5uYnBfdGhyZXNob2xkID0gMDsNCj4+ICsJ
CQltb2Rfbm9kZV9wYWdlX3N0YXRlKHBnZGF0LCBQR1BST01PVEVfQ0FORElEQVRFLCBucik7DQo+
PiAgIAkJCXJldHVybiB0cnVlOw0KPj4gICAJCX0NCj4+ICAgDQo+PiBAQCAtMTk1OCw4ICsxOTYw
LDcgQEAgYm9vbCBzaG91bGRfbnVtYV9taWdyYXRlX21lbW9yeShzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnAsIHN0cnVjdCBmb2xpbyAqZm9saW8sDQo+PiAgIAkJaWYgKGxhdGVuY3kgPj0gdGgpDQo+PiAg
IAkJCXJldHVybiBmYWxzZTsNCj4+ICAgDQo+PiAtCQlyZXR1cm4gIW51bWFfcHJvbW90aW9uX3Jh
dGVfbGltaXQocGdkYXQsIHJhdGVfbGltaXQsDQo+PiAtCQkJCQkJICBmb2xpb19ucl9wYWdlcyhm
b2xpbykpOw0KPj4gKwkJcmV0dXJuICFudW1hX3Byb21vdGlvbl9yYXRlX2xpbWl0KHBnZGF0LCBy
YXRlX2xpbWl0LCBucik7DQo+PiAgIAl9DQo+PiAgIA0KPj4gICAJdGhpc19jcHVwaWQgPSBjcHVf
cGlkX3RvX2NwdXBpZChkc3RfY3B1LCBjdXJyZW50LT5waWQpOw0KPiANCj4gLS0tDQo+IEJlc3Qg
UmVnYXJkcywNCj4gSHVhbmcsIFlpbmc=

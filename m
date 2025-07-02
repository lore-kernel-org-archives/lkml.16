Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90932E499E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480699; cv=fail; b=geWYgiLi8rycovqwdJjiezuXxpNk7Ry433mRs7oGdUr0FAONSwBGOHLPcnX1KL82em9OuMpNsi14R52wFqD0tybwpkTdhtjC/q7HsQXR5PdFy8WYrSeLpZMpdz2uwUsh5Qq3FsjNRcx9c4QFrV0h4ksU980F8YoS0gE8hIGA4jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480699; c=relaxed/simple;
	bh=tiHXYCEFxGfOu2uIfEqmtHCz5m3Xi8mX7KEH3Bxag4c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rr63l7O6p6stewctSNgq5RnEZAifD4TdKSk94ka27AwvPzIeYavgCyDAyM38kqBjl42e90j1HAo2NT4bA+u9l5Tv9kM9wZHwAzM/MtHMsatyIhPxDi2ilLEhUy2WUDqfD2I4BdcE2Zs31ZTIos+q/WQZ+X8WQRd5if02oytfU2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rr03ERDb; arc=fail smtp.client-ip=40.107.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rr03ERDb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfqeV9AGkOknkNX0rS3zFSnVNIpIFuwW8NnLBP+fPbSWmptZ8Ny7RYyoBEd/o44AdySkO5u2QXSrR+8IA+ZB1dCVXo7m/Ldg4hcyHpYWqYuI5RGhYqOIljDlCb+64SYAEsw5X0DL9+35Se+34fYrXtmsNOSEYqrK5/h5XLl3nD3k1Qcfi3wd1v2rYmM9TbXQmxYd4NoNgbWWimvAlGkxW2KByPBv3wOC9E2rUnnM/xWXIRn7SGeWqFbF1BQhJi+9J/HymSxMHUz3wJSWBu1QjdMyOmavYIOQon/BP5F7mkOEb80hOtfx5OpEhx7AAhFZJGS/0a/smJhqIUsP44B2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiHXYCEFxGfOu2uIfEqmtHCz5m3Xi8mX7KEH3Bxag4c=;
 b=ux/9ruw0LhEf5tcIhpk/xVpH7hTZS3rafQQ0Hlai52OiGIO4hgIJ2EAnX3UCugljYTzApK6xD57jDLZWD98471QDhwpzIKHj8Ht/F3vdS2jKuOC9nyknmeJ1JNaTQ53KFZd3g/3IOJC1SPGSRjKN+D5FK93BN9+Lva9EvH6v+Jtmc7Pd4RymNszcvZyeAtlFrYtm2XWnA5M6UfNHvM5xZgfNRWiCOEoiHdldI+L5z0R3xqM8SGg9o5+leoHrZNzC5to7FJ7Uqra9ggEgcMa5Oc1Z44xqBX9e8n4LE+OcL87I0RFn5IEGgYwJGCkvLZB97rz9vAX8iWpf7wJQGFhuOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiHXYCEFxGfOu2uIfEqmtHCz5m3Xi8mX7KEH3Bxag4c=;
 b=rr03ERDb8xv3Pj0ndrbOwwm0Tq4TkTaXo7TeKzm42swc86vteWvuOlvBa62K54gsGDK9TQapW+j8qOuIc3XHBJS2+HT7TstIIYb7fa/KH9I4WucjQKzqfcbfEdlGpbUndbgadkmZBX5urel5n6mSME34aGvPtBxlqjZK+qq+zuw=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 18:24:31 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::2202:1a7e:2dd:ad1d]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::2202:1a7e:2dd:ad1d%6]) with mapi id 15.20.8880.030; Wed, 2 Jul 2025
 18:24:31 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 14/20] x86/bugs: Add attack vector controls for BHI
Thread-Topic: [PATCH v5 14/20] x86/bugs: Add attack vector controls for BHI
Thread-Index: AQHb6bxCGIYRDXsOiUKWzLhNR03kULQcmkAAgACNmoCAAf+vsA==
Date: Wed, 2 Jul 2025 18:24:31 +0000
Message-ID:
 <LV3PR12MB9265FD7451212DFA64F8B4009440A@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
 <20250509162839.3057217-15-david.kaplan@amd.com>
 <20250630124038.GFaGKFxtAiYEBUAFRy@fat_crate.local>
 <LV3PR12MB926540104F695798EDD4240C9441A@LV3PR12MB9265.namprd12.prod.outlook.com>
 <20250701114537.GAaGPKYTbiLl4ABJ0l@fat_crate.local>
In-Reply-To: <20250701114537.GAaGPKYTbiLl4ABJ0l@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-02T18:17:00.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|BY5PR12MB4211:EE_
x-ms-office365-filtering-correlation-id: 2615f840-4487-496d-aedf-08ddb995b010
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YlZjaUxxYkVDeG93VndCcHFKM24xc3JpN1hiSlNWWnpjS3dORXV6SWJFQ09w?=
 =?utf-8?B?TzNjQm02ZEhVQVlUR2haS3grK01MQXhEUzIwcWFQVGovNlpQekVUMU9QaEFn?=
 =?utf-8?B?RCtlT3RqOWxOWUIxdmVJN3hzSk5DUEZ4WHUvRkpuV05ZZXVRcDVVbG5wVkJM?=
 =?utf-8?B?S215bzNRaW42TnUxWkZOMzNJMWlENnROeXVwb2p6WENON1FTdml1c09iMkpN?=
 =?utf-8?B?a3lzYmRLaDk2aTFKZlY0aHo0S0VIZHRXZXJCditjSGdxQUVxQ1hnRktPSklF?=
 =?utf-8?B?Nk1OVnVDY1llYWNJYmFNUjdTMUFaOU1NRTRjcjA0NThNVkJ5VVN0YWg5Yk9L?=
 =?utf-8?B?MENKaEVBcVpWdmFNVjcrNjZaM0dnbU9mVzlncXhpL1JSSVdTcVRrS3FrZ1Vs?=
 =?utf-8?B?UXJHRXVIMjBSNDY5Y25WWTZzK05tT1FieVpYTitXM2x0dFV2emxaSFFQTURQ?=
 =?utf-8?B?KzBjbXIyeGo1NGlLR016a0EyWWdwam1ybGFpZEU1bXlVK1hGUk8xUzhZVUhT?=
 =?utf-8?B?NkpONjVUdUFaWGtLU0tWb2U2c1pSRkdOUi8zOXJvY2hOR2hETythb0c4aVpH?=
 =?utf-8?B?ZjNNQjIxbnBua2xoeDloaEQrVHAzTVZodW1hUEZWUmtGaXA0UDJkQU9zQ3NP?=
 =?utf-8?B?ckJzWGYzL1ZrZlR6dnZwK3YrckhFNFlNR2N3R3RNNTlGeVlIbnFBSzQwV2g3?=
 =?utf-8?B?YlNQZGljZm9mMzM2dkR5elRVek0xRFZzdXJiWWFha2hVUVcvWWwyeGs3cjNF?=
 =?utf-8?B?YTROc2pHclAyRlMwdUJXK2lhK1BhK2JzcDUrZXdoUE02cFV4RVZLTWhmZCti?=
 =?utf-8?B?TmV4N3lSMVNpVFdreE5YWGZUR2dUM1FUTVNwRFBBeFFDMm1sQ3pLS0Z3cFY5?=
 =?utf-8?B?N25RemlRRVVUcjZ1MnBkTzNDNktGK2M1SzNkdmt0dk43czNESjRXNlFhNXNq?=
 =?utf-8?B?YUFKMnozWCthcTZJWUovcTgxejRrZEYzc3FhUnNCTjJyeWVWbHJoalJmRi9Y?=
 =?utf-8?B?YkNFaHN5dnFHNER3a0NVU25rOHNzUnQ5ZUlmVWZLL3FaQnZoREh1Q2JjVDRm?=
 =?utf-8?B?dGF2Y29rRWo2WVRjRGJJMFltbHMrQ3d4QUYzODdyUDJTZmZrd1pQYjFqTkh2?=
 =?utf-8?B?ZnhnV0p4WW9tcmdKbGJYb1R4SUpMRGZGck1IWGQ5Slo0TzZnM3RDaVBVNjZt?=
 =?utf-8?B?N0FVb1ZJS0NHQ1RGeFJWeFFOMnZaUWxoamZkY2grNk5QbStNWXB2R1grd3Zt?=
 =?utf-8?B?WnVsQzVGOFJnYkJNNlF3MjE3dkFFakFhbDdjRGM0VTFKcURoLzFOM0MreEw5?=
 =?utf-8?B?R21xWVVna3NyMm9CcmUzdGVuWisvMTJKR3M4bzB5WFZOamlaWElMTlFrdXhF?=
 =?utf-8?B?YkJuRGhYNStmRkgrZ1dBYjE3R05LOVVTb0ZKQ1FVN0g5aFpHL3dQUzQ2VkJk?=
 =?utf-8?B?R09YTkdMVlV6b1ZYTVpudjdCVnRYZ2JRdWUwRVNiSithaVUwSmpRaGZGTW9y?=
 =?utf-8?B?Z2Irdk1KSjl6RzFVQkRFNDIrWnpEUE5lYWpXbFZoSTQzeEFjeXoxaVRuc0Ix?=
 =?utf-8?B?RkNES0JGUUM4TzNaOWR0ZzR5OVlRQXNlQ3JYVXBUN1N4L2V6K2ZwYk8vWVBn?=
 =?utf-8?B?cXBGRWdLR2V6VndPU2JEVjkwRjE4c1V6b3UreHN5K2ZSVE40RzREWVB0dUZp?=
 =?utf-8?B?b0JrcmhnZlFDcjZIdFJwWTQyS2lBYTlPdFQvR0NBVVZ6TVRUaDZGQlE1YXZy?=
 =?utf-8?B?NUQ3NTE4bzJLVVkrRWdtWWpxcTFTaExReDUrVjNnS0NHNEZuNEVxbG5Qandw?=
 =?utf-8?B?MVZjVDFUeHhOMVFwZGFCMEwxdWpKMnlTdVdOZ2dBbWJ4blFEMnltd1REOHNm?=
 =?utf-8?B?MGVVb0o3a1d1Vnl5a3EzTEl6K0hPcllBNXN6MzlYRWN0clFyM2huNFlubGla?=
 =?utf-8?B?YS9oNVJsSzhvdVFZZUI0dWpzYnVoSG1mV2xsNW1NdllmVmZBaHBoeFFVRDN1?=
 =?utf-8?Q?N+p5TdwGFBkm99/F2hyh2M3Bj2SKRA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzJPdUIwKzlMQ05xVlFZYyt0a1pzNVk5V2l1NVpYcW9lck1FMzcxYVpYTU9i?=
 =?utf-8?B?dllNNGJzOG9kWHFZVGxYeUlkam5HV2JtNVkyYzE5M1BQeWtyYk1wVjlwSDJJ?=
 =?utf-8?B?MmprekVkOEV2dzVlNU9pNFp2U3VWRnYweXJIdzdRTWxoWklwaHlFOU4ycUpI?=
 =?utf-8?B?NXllNGNNeU9wZ2FJVG5JMHhaQlhrSzZEVFZJRm9zSCtSTERvaCthU2xDWDlr?=
 =?utf-8?B?V09lTzFKYmlyR1FINXppNWhzUTJ5QzlmejgyTWNCQzVMMXRhY0dhYm1XUXM0?=
 =?utf-8?B?OVI2cW9rVXFGMGVOQUUzZUtoQlcrV3huRFlQSHdiUUJrUXRlb2JwMjJteUxQ?=
 =?utf-8?B?UTlJMnlER0VLOVpVY2RTYk42QmR0TUhRT1VCNGx3dUxDTnpiUEZSR2JON0RT?=
 =?utf-8?B?WnFIVlBYaHQ1Ny85YWRBblNXblFjRU95Q0c1ZFBvbG1Ma210aXJOM003Ulkx?=
 =?utf-8?B?dnl6Z1RQZ2EzeGRDek81Nk1vaElBQUo2emZ1OXFZVzlTY3g2eWNyUXN3cDBm?=
 =?utf-8?B?Q0NxUVNBZWNLV080S2Jlb0M3TEREbjNGQWJmNHYwWkdSeFM2UGNHRmJiYVNX?=
 =?utf-8?B?c2RJVXJld3Y2SzI0M1ZmUkRpU2tKMlRRZFdTa3BJRXpNTUdmaDlxeWZtek5C?=
 =?utf-8?B?LzcrVEE5WDFFTDVES0wyNHpVYm5BdzNjbEE5REVrN1Y2Yk1vVmFpR2NGcElj?=
 =?utf-8?B?MWU1dlhJcVZ2aEJwUzZ0RFdyY1Ayb3BhUGF1ZGwxdXc4VjhXQmMrSnFYMEho?=
 =?utf-8?B?TXIzbUV2TFIxdE9SOER4MithWWZ2SGZMM29EY0ZOaEFnT0pnM2FOd0xITjJl?=
 =?utf-8?B?SkxJNTlrYTUzRjhIc3VrVm9kY1p4WkY3a2FEZ1JtOXA1Ylo2RVYxaDkvZVZ1?=
 =?utf-8?B?QXJma2RYL2NaUU1MbHljb2dQTE5IVHE1UytSdUdINi9LLzNOTnpOdWlXTGR2?=
 =?utf-8?B?WGVDMXRlaFhXaUdvbEZjWVdyeUs1dXAvL2ttNFNLSjQ4bkhEREhTUHVOWHNx?=
 =?utf-8?B?SmlKZ0YybW9mWk1CUUVtN2hWcFlzTWFlVGFIWkZTOFVhS00rY2hhMnNuTFh0?=
 =?utf-8?B?QWdEMFZkell2MnVzUEVBdk9hRVhJQ0pGNS9acWxpUm9tZDd3Y0NCLzlTMmVC?=
 =?utf-8?B?RkZvYWdIWkRZZ09rU0gxcjJjcUVYcE1uT0s0UTJ5WDV0ZEJ5R1VMK2tZM1Q5?=
 =?utf-8?B?cHdzOEhyWlFXV0hvSlhIVWpQNFBHZTJOSGg1dzBVcjE5QlY0VjFpQkZ5RjRJ?=
 =?utf-8?B?NGJ0ZTk3WDN3dzZCS3kxWDJ3d0p5VE5IOE03WEo0M1hCZUJHelZ4REFFYWVu?=
 =?utf-8?B?U05SQmg4MmQzWU9wUWZDWTJhL2dSS1Z5cE93OC9QMkh1WTM2OTFrcCtCVmI5?=
 =?utf-8?B?NytSMGxpV1RRaHJHWkJWOGJzYzllSTJ2UFVEbi9vOVpRQmZtcnVLTS93SlBn?=
 =?utf-8?B?U0ZzT3hXSUhML2wyZ2hxMEtVeXY4cXNsNkw2dHNqTjlwT2tQMk5FQ29zc1lX?=
 =?utf-8?B?MStwQVZ3N1AvcEtQU1F4bFlKc1kyNUxRVk9pTlgyQU5Ha1lGN2t6WnVMemJM?=
 =?utf-8?B?T2N1S0F0WUJhTEZKMUlpRVFCdStqTWxPZ1M4SVY1M1Z5VExsenpyNHRBbnZy?=
 =?utf-8?B?bUs2SjRVc2RtdmJBR09zczZJNVloYlJhaTJUUzN5bTlXa3o4UGxLUmJDTllY?=
 =?utf-8?B?ZTlmR3ovVmlQcGVLRkFqeXhQaW9QYUNxS0lWNlNaZEtTYmxBdDJFcTNadjBl?=
 =?utf-8?B?M2ppWmZ2K2ROOUY0WFJ2azA3YjExMEovdWM4TCtGVXJBenZZUHN6Wlh1VDdJ?=
 =?utf-8?B?U2FVVlVIZlMyS2h1Y2VGYVZGT2pYcFFZTmM4NnpnQ3YwT2toby9Ob1Q4YUdh?=
 =?utf-8?B?YndCMGRpTzdHWWhkWmMrUDIydUZuZzBFbjg0SCtaTWZGOU9JZ25RMTg5M0Zt?=
 =?utf-8?B?WnlyREU2bnZMN2thWjViZ2loRWpkVU85dHdVWWxNclMxWE1lbk00RUFpMFVB?=
 =?utf-8?B?TUhaZWdzM0NqNVVzWmVVNkxjYTFBVWx0YW9nQ21pczVZNTJ4Z0Y3SXhKMnFy?=
 =?utf-8?B?Wk12R2t3TTJ2bjNJV21VeW9UeXlzcWVHdm91SzVacnhXOUtWN2wwT0drNHlp?=
 =?utf-8?Q?sSXY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2615f840-4487-496d-aedf-08ddb995b010
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 18:24:31.0899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRHAvpYu37a1qilCqDQjQdladaPOgYNF6l68YTzlGa7z436bp2JF57/NiItWxhBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogVHVlc2RheSwgSnVseSAxLCAyMDI1IDY6NDYgQU0NCj4g
VG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBDYzogVGhvbWFzIEds
ZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJh
ZGVhZC5vcmc+Ow0KPiBKb3NoIFBvaW1ib2V1ZiA8anBvaW1ib2VAa2VybmVsLm9yZz47IFBhd2Fu
IEd1cHRhDQo+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdvIE1vbG5h
ciA8bWluZ29AcmVkaGF0LmNvbT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5p
bnRlbC5jb20+OyB4ODZAa2VybmVsLm9yZzsgSCAuIFBldGVyIEFudmluDQo+IDxocGFAenl0b3Iu
Y29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY1IDE0LzIwXSB4ODYvYnVnczogQWRkIGF0dGFjayB2ZWN0b3IgY29udHJvbHMgZm9yIEJISQ0K
Pg0KPiBDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNv
dXJjZS4gVXNlIHByb3BlciBjYXV0aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xp
Y2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+DQo+DQo+IE9uIFR1ZSwgSnVsIDAxLCAyMDI1
IGF0IDAzOjI3OjAwQU0gKzAwMDAsIEthcGxhbiwgRGF2aWQgd3JvdGU6DQo+ID4gRWgsIEknbSBu
b3QgYSBiaWcgZmFuIG9mIHRoYXQuICBJdCdzIGJhc2ljYWxseSBvdmVybG9hZGluZyBhbiBleGlz
dGluZw0KPiA+IG1pdGlnYXRpb24gc2V0dGluZyB3aXRoIGEgbmV3IG1lYW5pbmcgZGVwZW5kaW5n
IHNvbWV0aGluZyBlbHNlLiAgVGhhdCdzDQo+ID4gdW5uZWNlc3NhcmlseSBjb21wbGV4IGltbywg
YW5kIGluIHRoaXMgY2FzZSBpcyBhY3R1YWxseSBpbmNvcnJlY3QuICBUaGUNCj4gPiBhdHRhY2sg
dmVjdG9ycyBhcmUgc3VwcG9zZWQgdG8gYmUgbG93ZXIgcHJpb3JpdHkgdGhhbiBidWctc3BlY2lm
aWMgY29tbWFuZA0KPiA+IGxpbmUgb3B0aW9ucyAoYXMgYXR0YWNrIHZlY3RvcnMgYXJlIGdlbmVy
aWMpLiAgU28gaWYgeW91IHBhc3MgaW4NCj4gPiAic3BlY3RyZV9iaGk9dm1leGl0IiBmb3IgaW5z
dGFuY2UsIHRoYXQgc2hvdWxkIG9ubHkgbWl0aWdhdGUgYmhpIGZvciB2bWV4aXQsDQo+ID4gZXZl
biBpZiB5b3UgaGF2ZSBnZW5lcmFsIHVzZXItPmtlcm5lbCBwcm90ZWN0aW9ucyBlbmFibGVkLiAg
VGhlIGNvZGUgYmVsb3cNCj4gPiBhcHBlYXJzIHRvIG5vdCBvYnNlcnZlIHRoYXQgY29ycmVjdGx5
Lg0KPiA+DQo+ID4gVGhhdCBpc3N1ZSBhc2lkZSwgdGhlIGVudW1zIEkgYmVsaWV2ZSBzaG91bGQg
aWRlYWxseSBtYXAgdG8gc3BlY2lmaWMNCj4gPiBtaXRpZ2F0aW9uIGRlY2lzaW9ucy4gIFRoZXJl
IGFyZSB0d28gcG90ZW50aWFsIG1pdGlnYXRpb25zIGZvciBCSEksIHNvIGl0DQo+ID4gbWFrZXMg
c2Vuc2UgdG8gaGF2ZSBtaXRpZ2F0aW9uIGNob2ljZXMgZm9yIGFsbCA0IHBvdGVudGlhbCBvdXRj
b21lcy4NCj4NCj4gQnV0IHRoZW4gaGF2aW5nIGEgX0ZVTEwgZW51bSBmb3IgYm90aCB3aGlsZSAq
YWxzbyogaGF2aW5nIFVTRVJfS0VSTkVMIGFuZA0KPiBHVUVTVF9IT1NUIHdoaWNoIGJvdGggbWVh
biBfRlVMTCBpcyBraW5kYSBjb25mdXNpbmcsIG5vPw0KDQpJIGd1ZXNzIEkgZG9uJ3Qgc2VlIHRo
YXQuICBUaG9zZSBvdGhlcnMgZG9uJ3QgbWVhbiBmdWxsLCB0aGV5IG9ubHkgcHJvdGVjdCB0aGUg
cmVsZXZhbnQgYXR0YWNrIHZlY3Rvci4gIEZVTEwgcHJvdGVjdHMgYWxsIGF0dGFjayB2ZWN0b3Jz
Lg0KDQo+DQo+IEFuZCB3aGVuIHlvdSBsb29rIGF0IHRoZSBmaW5hbCBjb2RlLCB0aGF0J3Mga2lu
ZGEgbm90IHJlYWxseSBlYXN5IHRvIGdyb2sgZm9yDQo+IHNvbWV0aGluZyB3aGljaCBpcyBhY3R1
YWxseSBzaW1wbGUuDQo+DQo+IFNvIEknbSBub3Qgc3VyZSB0aGUgcmVuYW1pbmcgYW5kIGFkZGlu
ZyBvZiBhbm90aGVyIG1pdGlnYXRpb24gb3B0aW9uIGlzIHJlYWxseQ0KPiBuZWVkZWQuIElmIHlv
dSB3YW50IHRvIHNldCBtaXRpZ2F0aW9ucyBiYXNlZCBvbiB0aGUgdmVjdG9ycywgeW91IGNhbiBz
aW1wbHkNCj4gZG86DQo+DQo+ICAgICAgICAgaWYgKGNwdV9hdHRhY2tfdmVjdG9yX21pdGlnYXRl
ZChDUFVfTUlUSUdBVEVfR1VFU1RfSE9TVCkpIHsNCj4gICAgICAgICAgICAgICAgIGlmIChjcHVf
YXR0YWNrX3ZlY3Rvcl9taXRpZ2F0ZWQoQ1BVX01JVElHQVRFX1VTRVJfS0VSTkVMKSkgew0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBiaGlfbWl0aWdhdGlvbiA9IEJISV9NSVRJR0FUSU9OX09O
Ow0KPiAgICAgICAgICAgICAgICAgZWxzZQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICBiaGlf
bWl0aWdhdGlvbiA9IEJISV9NSVRJR0FUSU9OX1ZNRVhJVF9PTkxZOw0KPiAgICAgICAgICAgICAg
ICAgfQ0KPiAgICAgICAgIH0NCj4NCj4gbm8/DQo+DQo+IFVzaW5nIHRoZSBleGlzdGluZyBzd2l0
Y2hlcy4NCj4NCj4gQmVjYXVzZSB5b3UgaGF2ZSBWTUVYSVRfT05MWSBhbHJlYWR5LCBzbyB5b3Ug
Y2hlY2sgdGhhdCBmaXJzdCBhbmQgb25seSBpZg0KPiBVU0VSX0tFUk5FTCBpcyBhbHNvIG1pdGln
YXRlZCwgeW91IHNlbGVjdCBfT04uDQo+DQo+IEFuZCB0aGVuIHlvdSBkb24ndCBuZWVkIHRvIHRv
dWNoIGJoaV9hcHBseV9taXRpZ2F0aW9uKCkgYXQgYWxsLg0KPg0KPiBPciBhbSBJIG1pc3Npbmcg
YSBjb3JuZXIgY2FzZT8NCj4NCg0KWWVhaCwgSSB0aGluayBteSBjb2RlIHdhcyBkb2luZyB0d28g
dGhpbmdzLi4uaXQgd2FzIGFkZGluZyB0aGUgYXR0YWNrIHZlY3RvciBjb250cm9scyBmb3IgdGhl
IGV4aXN0aW5nIG1pdGlnYXRpb25zLCBhbmQgdGhlbiBhbHNvIGFkZGluZyBhIG5ldyB1c2VyLT5r
ZXJuZWwgb25seSBtaXRpZ2F0aW9uLg0KDQpTbyBwcm9iYWJseSB0aGUgcmlnaHQgYW5zd2VyIGhl
cmUgaXMgdG8gc3BsaXQgdGhpcyB1cC4gIEknbGwgY2hhbmdlIHRoZSBwYXRjaCB0byBqdXN0IHVz
ZSB0aGUgZXhpc3RpbmcgbWl0aWdhdGlvbnMgYW5kIHN0cnVjdHVyZSBpdCBsaWtlIHlvdXIgc25p
cHBldCBhYm92ZS4gIElmIHNvbWVvbmUgd2FudHMgdG8gYWRkIGEgbmV3IHVzZXItPmtlcm5lbCBv
bmx5IG9wdGlvbiBmb3IgQkhJLCB0aGF0IGNhbiBiZSBkb25lIGluIGEgc2VwYXJhdGUgcGF0Y2gg
bGF0ZXIuICBUaGVyZSdzIGFjdHVhbGx5IHByb2JhYmx5IHNldmVyYWwgb3RoZXIgbWl0aWdhdGlv
bnMgdGhhdCBjb3VsZCBzaW1pbGFybHkgYmUgc3BsaXQgdXAgYmFzZWQgb24gYXR0YWNrIHZlY3Rv
ciAoZS5nLiBoYXZlIHNlcGFyYXRlIGNvbnRyb2xzIGZvciBWRVJXIGluIHZhcmlvdXMgcGxhY2Vz
KSwgaWYgd2Ugd2FudGVkIHRvIGhhdmUgbW9yZSBtaXRpZ2F0aW9uIG9wdGlvbnMgYmFzZWQgb24g
YXR0YWNrIHZlY3RvcnMgKGluc3RlYWQgb2YganVzdCBhIHNpbXBsZSBvbi9vZmYpLg0KDQotLURh
dmlkIEthcGxhbg0K

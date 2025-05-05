Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2093.outbound.protection.outlook.com [40.107.22.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C611F5434;
	Mon,  5 May 2025 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437393; cv=fail; b=eC65h5RxWP0dwyapl+rphOa6FhX+6j52UnbEvrB6pe11vYv7obRi2rkeHA7gnXgWhQOZCwsvE+SRvecsNvlDc/LhxiNO9I/9znsWj5XHjLZXNkK48f2uJHO1mwaDBJm24oU0sUUSnDZZaLD8IepBlNHxj41RHrVHzKLWuow7nnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437393; c=relaxed/simple;
	bh=boUyAh9jMw1K4Be4xCnAnbkc5kBWkUS7tfZBVVUiTFQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=grjr5PyXVnCNDvdWwog588hHb425YTQJOM4xaJdxb6bozoqftVHeus6LpMwFCaMUnm+DYRvH3OvUy/A1U6ztIACY+lvH4OPTb7ZlIaXXkCErOtADchdsUb8Hf4QZqx6STQgyl8/wUau48rSsuB8BS+kriMWDxF0MASl2ThpyLgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Of3lXRyC; arc=fail smtp.client-ip=40.107.22.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Of3lXRyC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yo4Pp+rAMK4KePZbvrfvh589z28z6PuoW7OPbMJkwZEmMOZMSFppwLWDXScNIAEuAV6AI8HN0TGLJXWGw7YS3+JvHyj+A+r3NCGqmxRPDhX9fbBnBR+UpsrFR1j9fkKLwPIXssoBW1DAgaxJXNq3JUlqdQyScVw/p+VvFVYC00ebFHQggC/mxJxqhxAVH312j9VZKJR2BAlzz7g0h+OcDlDUKFv6oKClNSmpB2W+DLm59j6lSNbuIOkNZJaIEltyihd1dV4NH6ms2C8NaxD1ege9DF+MXx6Ulyawd1NbKtJzCzMEK7EW5HbnpVnJcOVnNzlHIh2rMJFFkjwmeGoE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2jRoJuMlWq/P8FbRXCr7eqvEm8qdBeP3Kz43cJ3Ii4=;
 b=bPW7C0EEn0xqkYI2UVDW8Wl+PwIo78ljzMFI1wX4s6K9LJMG5PdOcLc5ne9j5GnSEK4t55JvpSEzvztcp95C15Ymju1BkXCgkrvJG3HCKqmPyybx/Bimhuy+KOywREEHAdfB3YiCB+3042qiHaDxHFMNWv9IOwoPbL1f8utfoDSbNddFllxcAN8h53W9gR9ZtgE9PRIFsVnImT//MD91lAM4ApJvCn+D/tExRZMUcP/d57Ei1dh/2JvMDGorV/8eLC6fsyOpWNIwm1hoIR/YwH20VgBY+JbpVqS4h32cNEboaJfwqk7ZzV34HZMU1uzWsdEfRy38qcacjcG64jkEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2jRoJuMlWq/P8FbRXCr7eqvEm8qdBeP3Kz43cJ3Ii4=;
 b=Of3lXRyCmspApUSPt9wqoOv8V7UDkOMT6rW2LQ0p7WvsVMzFJE4R2R9WMGBA5Ho0R6MjUE2SXGC4KCZO+HmwM9PuAJ5/1qexVfVFLwlAPC/K9HAnFFWHoIP6SMdAQUHO+G1c3INkPRHyvNJPTcNFk6EbUtHtRIeC1yeNmHTTLX/8KxKif13yF9+kDEXdpVVg8mIbFU8t1xRAqpEhQt5LyUF+jgOs2vyKRD15PnlENopC0c40Y0VTD0bdg8N1eMgaIfoejX1Xh534dDzZAAmaqeQYvZRbe0VgMEgmOGIzcno9zkxK/s27IypyNRJiHUM5FylKS0yoD3Z6yzMg0/sJSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by PA2P195MB2494.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 09:29:48 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 09:29:48 +0000
Message-ID: <f73a5375-d9cd-4891-a496-e7f4add2b301@phytec.de>
Date: Mon, 5 May 2025 11:29:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/11] arm64: dts: ti: k3-am62a-main: Add C7xv device
 node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Andrew Davis <afd@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502220325.3230653-1-jm@ti.com>
 <20250502220325.3230653-6-jm@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250502220325.3230653-6-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0122.namprd04.prod.outlook.com
 (2603:10b6:303:84::7) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|PA2P195MB2494:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f53573-a293-46a2-edbf-08dd8bb7612b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aklaSFZVeVRpS3lwUGlDdkhZdkNULythbkpPZG9QelY1amVNTHRocVVnTWJz?=
 =?utf-8?B?RGtqNm94UUJVRWNyZFM1Yk9lNEMwQlNva0JkQ0Jhc25QMzljc2R1STlGSlRH?=
 =?utf-8?B?RFk0UEVraTRMcnBFL1kwc1A0d1VHRERDOEVNWkkvT3BvNWIraWZtKzk4eHJX?=
 =?utf-8?B?RW04S0JseFIwUkgvVndLc1RVREI2WEx0YWtlOGhBdTdKTVRHNDRqaEduN2V1?=
 =?utf-8?B?cXZac3RhZWJVWWttaVFvTGNEa1BQcFJpcUxnajdRMmZtYzJOQnNab21aN3Vu?=
 =?utf-8?B?QkJLcWZlM1BlaXdzTHcyOHh3VHZkRHVZcWZHa1dEUkQ3RTZwRmZVQWhObSt2?=
 =?utf-8?B?Nkw5aTJ6WkowK1EzQWJKdlNlV09tNlpXMDlpYjVpQlRwUjlVNVRMRkNwQVRh?=
 =?utf-8?B?UUw3WStMSGRXVUNTZWFXUzE3cDMzd2NiUFF0SGxabWo5STBPNjNvNTZqUEIv?=
 =?utf-8?B?dGxTakZtek5BZTdUK3lUK242dDQwMFA3a0I4dXFVK0Zyd3NJa2l3NHVPU09N?=
 =?utf-8?B?MHNEMUhNbGNnQmFlZEJ3d2Zac2NXbnN1S2JIUFNIQzV5WjY3UlJGZ1F0LzJp?=
 =?utf-8?B?amp4SlR2YSt5dXVDelJIQ2IvWDRET01Qd1pjeW9TWVJ2Wk5rcXJneGpnSkd1?=
 =?utf-8?B?Rm85eUtqWGNpbk9Ja3l1MEZxU2s0akRRK1J0VmZaalBGS2JMdTdpUEJ2Y01M?=
 =?utf-8?B?R1YxMzg4TE5HZVNvb3dDTkIrajV2ZWp6WjJwTzl5NUJkMFRTb0FQcTdmbkhE?=
 =?utf-8?B?YkdiNEVsZWlPVHdUU3plU0UyQlk2NnlxSi9VVnp3WFhNZ2xMOS9NNldFSkNu?=
 =?utf-8?B?bVl4ZE8rb2RqV0tJZzZ1RjVGb2pzZ3VCWGpEeGczcEF4dG1OSlZTZmJXWEw4?=
 =?utf-8?B?ei9aeU9MN2NPaURjTmd2RFpTQ3VUU2swZWZvRUhsQXJNOC9Mc0pFNGNmREFD?=
 =?utf-8?B?cDVqU24zeUtPaDJ5L0dDUENNS1pldUo5eE5oV0N5QStWUkxXUURQUWFlUzVm?=
 =?utf-8?B?bHVHQnUvN3pDRUt2L28wMW4rSE5WUlN2QjE2SVJ0azRTbEtxTnlCcUF5cnRX?=
 =?utf-8?B?Z3I2QjdCYlV4cGRrU2hCMEFjd2p0ZzB6enBOZTFkOWdiNjYwTXZ5dkNMVVFk?=
 =?utf-8?B?T2pCT1JTNE1taWN4dUUwaHdVNC9IenduUTNJV1RLMXJ0Z01Nc2prcml4Y28y?=
 =?utf-8?B?YmhyUngwLzE1ZUFjUkptdTlXaWdkcWJjUkRhTm9GN010VGRyRldNUkxzQUZP?=
 =?utf-8?B?Y2FySC85QjdHazcvU09aQSt1SC9FMnRoa2RGWjRLdE9tSTdGdWU5cFpVb2py?=
 =?utf-8?B?NFdFVU1ReFRMT2d4YTFzS2xYQll3S245UEYwTEhCT2FUQSswbjR5b1VYWDlT?=
 =?utf-8?B?MVdXeTdRNzZHKzFyK2tYR3RkK3ZmSFUrUlJPd3Qxbkp0UFl6ZHl3NUUxRFJn?=
 =?utf-8?B?cGQvM2l4elF1TERSbnYyL2FVVjVtU2tTeXRHdHhLc3BzOGRKcTBxZ3FWRTNF?=
 =?utf-8?B?blFlVEZMYk9CYUxSLzVBRndCRDViMkhET0VJS1dIY3NTVHN1MGFvLzFrL2NN?=
 =?utf-8?B?cEM2TUU5R1c4RURodndJdmRZR0ViMG5sQVhFbWZpZTErTEFydndrbUdUc0oz?=
 =?utf-8?B?emNlUWhJMllKd0o4c1o3SlhGSGpuaDkreVc4NFQ1bW0rRnVlQm9ycGpuWG85?=
 =?utf-8?B?ZVVxQkpuZTBmdDQ3N3dDd0YwM1pXU0tEeVlVdkpyVWxQVURlcXdRK2RWQkg3?=
 =?utf-8?B?S09RTWhRVmU0eHFPcEJrbW5qb2NMMDNJSWlFckZYTjg5YSsxZjlTMFZxVkJn?=
 =?utf-8?B?QUlKN2xtb2Vlc3FKL29ObWRhNjRtNzBPQXNvbXc2UWtvNVYrd3pGbzJUdmxV?=
 =?utf-8?B?NmxtM3VSY0dVTXBzTXhOOUZCVlFlY1BpOTRyajQwTjQwc1daQjBoOU9tdlQ2?=
 =?utf-8?Q?miI85Dt8CWk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elNiaTk5emNGUXhKTkZXbmpLMk5zeVFxY0puMEJRdWd0OGVDamNUc1F5VURX?=
 =?utf-8?B?Ly9FUVRORmJkWGhoVG1KUjh4dUc3d1lHY1huT2VNVWdYQmtRTjdxOUtHS0o1?=
 =?utf-8?B?dnlXYWtBMUtPRjVaU01sZWNHL1UvM3JUL0NrNXQrVVhDUVgyeDRmenlxVTlv?=
 =?utf-8?B?eTd5VFFvMnAvckthOUVrSXF0TFdnTXI5YVZGMmlhd3BwWGpEcm5CSENLK05n?=
 =?utf-8?B?M1dMWEJLaU9BeVZZelVHMHIzTW5UVlVsUUN1ems3OGYzd2dyYTZzbjcwdnJa?=
 =?utf-8?B?YjF2M2NTYXEwR3NQVnA3eDhXVGhxbFQrbHh0VXJaQzlKRkwxN055VGFrMDV5?=
 =?utf-8?B?ekl2NS9oM0U0UTdvblB5bHhxaDNtMWdjNXhUc25Dd0ZaQWpsVC80OW1Yc3pz?=
 =?utf-8?B?RTgrVGlTRTVBVkcwckVGRnkrTHpVVWR5a1VuT3RjNDlIY0tDbHhOU0tMbUsw?=
 =?utf-8?B?TXAvNFZ3WmxQeEtTSHVYYzlBdVVzK1BNMkJHaW5aclFTSGF6TG16MkJrVlNT?=
 =?utf-8?B?QURBZWRCdXhUdlpmS2ZyMkVLcVhTOUJSZmcxbG56OTR0a2xnMHlRWC8wOExM?=
 =?utf-8?B?TVRyYVdqQng0bDFGY2ZFdVpGYmNpME1hY3V4UFNrKzRFTGcvZGtUd3JtNk5E?=
 =?utf-8?B?aFhaWFR6N0xoSisrZHZablNuKy9kWEVCbEZScWl0eHZFWC9GVmdyajZtUFJk?=
 =?utf-8?B?UFVtdjR1UTdyeTRiKzdhQ2FmT1A0SnhOem9pS2hBM1J5Y1l3VlhJamVuNmNk?=
 =?utf-8?B?d3FGU01DeVUvbmpBSkpaUVYxZ3VRZDdQNkwzckpWTlRsMTFwTy9oak14em9X?=
 =?utf-8?B?UUFKL2dndjY4SE9SeGpmYkkvQ2NCYUVoT05nNE9Felc2R1lPQ3VOUjRnWHBQ?=
 =?utf-8?B?NzBZc3poQnI3OHlRRFRhL1M0cFdPWERoRmNnUlowNU53U2NLTFlnanNQOEEv?=
 =?utf-8?B?ZU1WS0lncUFLMmpvaXp5cjlkZGJVOFR4TkxtQnR6amprYUNKN0wyOVN2dWFk?=
 =?utf-8?B?dVRCNGd0TE80Y2xmK1RmeG5tVjVNVGd2ZWxqaVFabDk0L1BvRVE1VWpZaGMw?=
 =?utf-8?B?eXZJZnNjaUVmVERLVWtaU3NWaW9UNGtjV0tSaFpLWm1IeGNWcDh3OU9uMDNF?=
 =?utf-8?B?QVplRllwZnJpNnpmMGQrS3k2NHQwM0ZWcUJUYytOeENJSmdsNzlNSmdvazVQ?=
 =?utf-8?B?R2lyaXNQazZTQjhYcGljLzQxOWJBdC85N0pFWWxuS2w1NzE2U3JEQi8raFl2?=
 =?utf-8?B?TlFEUHhaTm9nelJXNU5nRXZNbmNFTS9NQm5FMEhVbnB0UFBkQ2VuUlFncktJ?=
 =?utf-8?B?Q3loWk1hQWI5d2t0QlVYWEJjSVJlVW1UTGFhNEc2TDZYbXRjOS9FUFN6YTd0?=
 =?utf-8?B?WGFrZGtjYmd5bzg5L2lHUVR0a0dJZTlwcjlvZHI5d0hNWmtSQ3F4SjBqME8r?=
 =?utf-8?B?a0ExYitBRTZqbkRtNjZTU1d2TzN6UHJZZWY4a3AzeFkxaU5qbjF4Qm93TUVI?=
 =?utf-8?B?UFlCQWhSbGt2M2JYbjd0dDRzWi9mSnNFd0JGNXU0Z2dlYzErY2tiVDMvRGNT?=
 =?utf-8?B?b21LLzNsWjBncnFMb3V3eGRGR0JWL2VCQ0kyaVo2U1lLQ0RVM3Aza0JHMjFz?=
 =?utf-8?B?a0htaStTVjY4QTcvUWh6SlVBTWxuYlI1c0ZGZlBMQzl3TlIxaWhHc3JUeVV6?=
 =?utf-8?B?QVZwZ3pEMDFUQ05uZzF3MXVzcHFrcU9LZGtnazRFaFloZitBSnIvcXhucTlp?=
 =?utf-8?B?R2tqTmlXZEc1SlpNN2Q0cWJHYUxDclNmbXFQTFlsSWszSitiakMzR0szQnRm?=
 =?utf-8?B?VTVUOHZkUWdSLzJ1cDN2SmZMWlp3NjhqQ1N2WW1FRjl2MDlDZzdMUGZobGpZ?=
 =?utf-8?B?amZkcTZzMHduS0l6cnhBR2JIY3V0RUNuRlZCVWs2NTREWEFLbjd5MWZNN0Fx?=
 =?utf-8?B?NzYwOWppd2sxT254MXlkdVl2ZmxJRU53dXF3ZlFCcGN0djZYVlBBOFVtVUZy?=
 =?utf-8?B?ci9BVkJQcnY2V25LMUV1dTgyMVBDM2pkVWgwNnZhZTVINGgxYU9nTzExRkVC?=
 =?utf-8?B?ZlYxU0ZmbnQ2Wk5ZdUtzUVpTVVVBRnpqTlBjcnFjd2diVWJFdEZia2RKT0x3?=
 =?utf-8?B?TGJacjRuN2t6TEw2OTA5UWdGbkJUSTRtRjdjWm52V0ZnL0ZXRU5QdzF2K1lS?=
 =?utf-8?Q?rEgm3NJNabaVVwVd3IExgAo/uMacZFaTUu1hYJOBPRN4?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f53573-a293-46a2-edbf-08dd8bb7612b
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:29:48.5551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FvvSPOIsubWJA9R1/DJjquRrNKoyJszco3a2mhBXVj2VJfHOCad+AlJz7P/TnH/j6VVsxoCIUph8UVi4Bra4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2494


On 5/3/25 00:03, Judith Mendez wrote:
> From: Jai Luthra <j-luthra@ti.com>
>
> AM62A SoCs have a C7xv DSP subsystem with Analytics engine capability.
> This subsystem is intended for deep learning purposes. Define the
> device node for C7xv DSP.
>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> Acked-by: Andrew Davis <afd@ti.com>
Tested-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index a1daba7b1fad..d296e9e17973 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -1123,6 +1123,18 @@ vpu: video-codec@30210000 {
>   		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
>   	};
>   
> +	c7x_0: dsp@7e000000 {
> +		compatible = "ti,am62a-c7xv-dsp";
> +		reg = <0x00 0x7e000000 0x00 0x00100000>;
> +		reg-names = "l2sram";
> +		resets = <&k3_reset 208 1>;
> +		firmware-name = "am62a-c71_0-fw";
> +		ti,sci = <&dmsc>;
> +		ti,sci-dev-id = <208>;
> +		ti,sci-proc-ids = <0x04 0xff>;
> +		status = "disabled";
> +	};
> +
>   	e5010: jpeg-encoder@fd20000 {
>   		compatible = "ti,am62a-jpeg-enc", "img,e5010-jpeg-enc";
>   		reg = <0x00 0xfd20000 0x00 0x100>,

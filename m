Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2127.outbound.protection.outlook.com [40.107.117.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF829AAF5;
	Mon, 14 Apr 2025 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631798; cv=fail; b=VdPR39kuIJnHyrEp6N99URxSh2G36V/R9zQxzswuQojWrLKn0I3qsaC61duoVDBFFbtPLys59cNSFI34XMgpqMYyiL96kcoKIFWbjdU/jdyrEVPy1c3RsyPTv5vwEfbUqJq0NIZkrf6vAU392PHawJ4iGdHlaIGLevLq4CymEvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631798; c=relaxed/simple;
	bh=fZJsofTFUDQBEr1M85fh0yFqwq7VObvpixE7oTfQjNI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qpjUfDQootyqrpYg0XV45P1AhNZkhrlwNdsj3wEVenXam+uF62dMsrcUrnVUljF9CNt2FdyuPwGqWhoLXQ+oZG3nL2Yce4dYLBKf7vOUAw37dCFqLdLnfRl+MtcnO7ksZ+J5B2gTLCQwZ0SP1R3kYl1wSpViHOUyJYin8GW2tJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=vagsgWOq; arc=fail smtp.client-ip=40.107.117.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="vagsgWOq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp5N1LkAX2h9NWYqDnea7/pX5NnAm/SFbGMPfzgfRHui61TZuDojg2iydZq65VIqC6IvVG1ly8jqkDLA5P7vJnlQNuYNTM3GVdyvsXbJakEzVZBd0bQ65QV+JDpVocXnfAxEvO7fKWU60yVfRj0y7TtY/JxgmDQLt0uFAwFOjPHeE1aPRBZhcxM/0a+aKB/2AFBAH2PMG1fy+l9p+7p1z44oAEJjz1ikvjekuz23IJeUOJsEILNvUgK53/W4tb0nYfICb3Tx4ILvqSsQ3lZJQfgMfIkzCkHF2s61vN9Olk8T+XcbrqL8rIBCpFuSQ/WjRl6iSPfkSOH0kSPU1c2DLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehbx52dxDcw5FyMJrp80Rep6PQn6O8ZNUlzHmfRmy8M=;
 b=XeeVrLui5BU7T3cZqFzG92SefEqSdiXj1F4NSUXENu6OiBL2O8uAhPshV3k5f/uHVD8/OqSKwDzL17U2q5PEGyz/Amqy1qvlssSqHYrtYaThYDammfMHfduQIY/f0QO5czqM3z5pWZyWIy70Pyz0ILum5Ts/39uGojkl+XET8j6NTsiHaVxCxWBwRiFjDQZRr0z6Vv/SDeumXWXsoqXlG4ZyE4Ll/DGGd3Yf8RIHhGpFkPMbQI3/3ubTqA5C40suUv/KCQo2mo3Jby9wKgLPb1WII+4letVTcR8B8HlsQ3NghzgoBt2Ku3T1l4KF4uI+kOqQzONQb9cuMwRbQjcrAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehbx52dxDcw5FyMJrp80Rep6PQn6O8ZNUlzHmfRmy8M=;
 b=vagsgWOq745VdbGntJBioG6AyOxTf7J2z3bqs3DnT3CM0MuaVtqyT440Y2F+GqJ+aqPT8SBQ/7p6n8XCGwW8KTVm9P6jwo3QlopeaoC5PuPTQ00x7MF4uwOA1heNFEG/0lNzX+EiPlegHaedn+eeS0l/sASxV/Nl614mfja3f/FZQGlmNYGrlh4l4BpwAKyAI2N79oCA2tVBgfkmFFvaJUD+PNPd0VNsNMxchJ3KsatSaLpuSG/lAAvZmg1CM6LCl/SyKUqXUohNTCoxMYRJ5jqPVdds3rWQNYJ7kDcnnaGmCdBBwinqh7/Ql8OXNPJkcVPa9Oa81bXjNkgdy79gjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8156.apcprd03.prod.outlook.com (2603:1096:101:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Mon, 14 Apr
 2025 11:56:32 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:56:32 +0000
Message-ID: <e0cd90f4-9e23-408a-93e7-dac430887abe@amlogic.com>
Date: Mon, 14 Apr 2025 19:56:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] soc: amlogic: clk-measure: Define MSR_CLK's
 register offset separately
To: neil.armstrong@linaro.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-1-65077690053a@amlogic.com>
 <608488e4-a744-4aef-af17-2bf19ea5b788@linaro.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <608488e4-a744-4aef-af17-2bf19ea5b788@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0192.apcprd04.prod.outlook.com
 (2603:1096:4:14::30) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3573ac-0831-4528-9818-08dd7b4b6645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWJsYXVOVjZSb3FZUFlTeDcwN3RoL21taE9jais3UHBZODJ0clk2RFpKQyti?=
 =?utf-8?B?OGtXSnJOQUFSL2owZmpsWkxUaklBRDUzYzlVTDVETncxOXpudXFSdEZiWDF6?=
 =?utf-8?B?NVpTbTREVU5xMElHdVUwbkNGeTV4SVZkWktVZXlCemM3SmZuWmhUVGt3Vm9j?=
 =?utf-8?B?Z1hOQlBMSDlQeVFuQ3IyTFl2QmZaeFh4cHZtOXdaeE9ucEdPc1gzdVNFNE9M?=
 =?utf-8?B?ekpoRHNxSk5pMEJhMDRmZEs5U2svbGRrNVEvYnpBelprZnFHaE1pWU4zMis2?=
 =?utf-8?B?enN0MUFCcTdKSG1VN2dqb292d1psSEhKZkdQL0dDV0tCZGZaM05OSFpyVGlY?=
 =?utf-8?B?aVhyVFQ0eWR6cFJNcHMxSkJOT3dIQ1FYNVF1RXd1NXhjOFJSZHJGRUoxV3hM?=
 =?utf-8?B?cVVLNkZmNkRvaTVSU0RjOTVHQnNTaFBoUVRzRDZJc0FKaHlWa0VBcmNldTg1?=
 =?utf-8?B?R1hrUFhleUYvbzVnbkNNVmJ0RXh0UUR2dUJmajNPdDdHeUVKekdNMkNJUTI4?=
 =?utf-8?B?Qi96MkdMbENZY2JkQjRmL3FRdy9ZQW5xd0NwNi9DM2dUbXN2bHoweXdjL25v?=
 =?utf-8?B?Ujl6MXFUTTFHSUZ0WTR1S2xFVWF4cHE1TmFwSkNwdlQyTFpYOEQ3MmRQYzAy?=
 =?utf-8?B?T0w5K2lRc1V1elE3Rm9pRk5zTnVMaTdXNElWV2hiYzlJM1Vwell5dG9wcHBK?=
 =?utf-8?B?Rm1qTXh2YmplVHVlaS9TVWJ1TlpDK2VraE5WZmhmbStYQUhoRDhBZkp6dVZo?=
 =?utf-8?B?UGtwaFNmTzJHdnkxMVV0M2FvcHdrU0ZSSVo0VzdSenFaOWtMWGt3ZUQ1MnB4?=
 =?utf-8?B?VC90TE0wb3lTZS9rRGovU3BsN24rZUdvQ1Fzenh6VVAvdUQ4SHo0K3ZKZUVG?=
 =?utf-8?B?OVJSaEJtbFpWcXBobjk3QUwxVHJ3ZXdVSHgvS0EyVEVPdVNZRkIyTmIyZzN6?=
 =?utf-8?B?UkdFTElhRGsyWTBVcDVyeE5MUVFYcUFwbEV4ZzJsM0YrcERkZVdKdU1aMDJy?=
 =?utf-8?B?TWc5ODJhUW1aZTdPQkh6ODE1cElvdHNjeG9BS2lmakVRRUx0ck9ScUIxbm41?=
 =?utf-8?B?T2RLTkxuYmc5RWl4YUhESFVGNWJNNTI1NmlZTDdoNEFkazBxZE94L3hOWU1z?=
 =?utf-8?B?YTVDUlBHVEdKQmgyVE1ZaGY0UW9BWTVQN01ZaURPQVUzN0NuVUI3LzZTMnZK?=
 =?utf-8?B?aE9kZG9JTFZjaFN4Z2k2bUd6emxBZDNpY2sxa0FTNU43aVhGUzFidlZrek1C?=
 =?utf-8?B?SU41SlVLVjMrVmxwbmtDRVpZOEFMSDBqc1hnNnpEdVBVbmgrd1FEdzI0T3A5?=
 =?utf-8?B?NVZuK2FsKzJxcHl5Z1lHRk14cmZMOTBUU0Ira3FQN3VIRWRCU3pSdWFmZGkw?=
 =?utf-8?B?TGg2WjBwcUkxbHhZcUFxd2VLVktSMk9EeEE3elVvZXRjdGc1WnkzVHhiOXJT?=
 =?utf-8?B?Tm5iVTlmSEhHOTRydzBNbzZoZkxlK1ZVdUtnclRvWGZOWEVTeW5uV0QwMUNv?=
 =?utf-8?B?Rm9BSG5keDZJYjJsb2RyZ1orOVZYWTRqMy84V0VuR0tBZkhuamhsUS9xbVEr?=
 =?utf-8?B?cWlEWXdZZnNRemUrZkFZUFFobElnRnhPU3gyK0hQVWJCbmJ4a2tkUUc1V0lI?=
 =?utf-8?B?Q2xEeVh4dkR0L0N5dnB3UjI1WERaYTRpUGJkblJ5Z2ZPYnBkU0g0eXA5ZVdS?=
 =?utf-8?B?cVRSWnlvSURUYzlpaEdMN2o4eHlDN0t4T1RveXVDb3RhQ1p6RWZ4dVBudEgx?=
 =?utf-8?B?ZnEvNWlVMTBBUHJ4T2h2SHBYN2xTUDFZVzZRdmJENlVmenFrUTdZcEs3THpH?=
 =?utf-8?B?bVVVTnRXNDR0bTg2K0ZWWXBrSTl4L3U1T2dMNzh0UHU4OTJ2d2MrNEQycW01?=
 =?utf-8?B?UHhmQWRteFRGR1Z5UWVoVzRxZGF4TlBTZEpoS2hqaFQycUxnQU1tNzA0YVl3?=
 =?utf-8?Q?96SbU8WRLsU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0N4Q3R0eVFPMEMzdXJKWVlTeUd3UEpFSjFaUllYSVJvN0tEclNXdnAwd1Bs?=
 =?utf-8?B?MUtES3hyMTJ6enhlaUY4YW1JVDNqNHhLQmZiaWZXWC9LeTBTWGE5SjBKelVq?=
 =?utf-8?B?bEI1K2ZsQ0NOd01ycEgrZkN5RjZuL0FvY1gvWC9jQ0FqdHZXQ3RqdVhDbHBi?=
 =?utf-8?B?cyt6OEdUdmVTYjl5YXI2OEplWHpqU1F6STBhd1UySjF2OC9jNkJtY1hWdFFN?=
 =?utf-8?B?Ym81UU5CTHplbGc2R3piZUFMbFNzMEl5dllrNmNDZjI3eXNLTmpRUE8xczQ2?=
 =?utf-8?B?MFFFanlsbXhQNEJRbDFXd2l6bDFUSFZWWGppT2FxTFNRMk5MeWQwVFB0MUFH?=
 =?utf-8?B?MlJ0ZmlzR2ppbGJjWmZBWEJXbVhNOVJCUUNJOTZXQWR3ZHJOZjJSeXNxcUw4?=
 =?utf-8?B?eFg1czJGUmYreU1JY3NJY0JmVWh0dHVwWkg2VEdBUC83dDFTV3ZzdGNoTEx1?=
 =?utf-8?B?K0EwT05QS0VlZ0pXanVQV09VMzJIS1FuYkZIZ2hKOGUzS0RabXdnTXRtS2Rv?=
 =?utf-8?B?S1JZR00rNnNPaUZYZE1McmVGQlloTnl3VkMrcURXdTlwek5XZURsRXhHcFho?=
 =?utf-8?B?a1J5Q3VpTGozUTVOS3ZSWDdpajBVT3RzL29tdWx4bnphOWNOcFdFczlpUEdr?=
 =?utf-8?B?T3pKQTR5RmE0c2MwQm1XS3hYRUpzeU84d1lJVFFaM09PRU5EYWF5emIyNFF5?=
 =?utf-8?B?bmw2Z1JFRWhOdWo5NzFlUE1Pc3BQQXRpWmhBTFA4andsbThRSTI3eCt3bGlX?=
 =?utf-8?B?SkZqTkVpVWFJYkhJN3VVVkxOY01jOTdEcmZqbmFIN21rTnliUlM0eHFleDVx?=
 =?utf-8?B?VitKZmVvQnFkcjRjYmEzNWFPbG8wbWQxaU53TVRTdmRRd0dqSU5VSHBCZ2ti?=
 =?utf-8?B?MGh5dGdpNkcrOC9mQjRDMUJVTGU5QnV6eWtLQVIzVWR0ejhpaHFIb2dEZ0Nn?=
 =?utf-8?B?V0ZXWDhLQmJKOXY4NzgwUWlCS20zektEb3FHcjJwd1BZOUl6RjEyVTFtVlNv?=
 =?utf-8?B?dU1reHdXNkpJMkIrM2tYQzFZbG8zNDhrM3N0Z2tvamNIeDMxOHlEb1JnWmZw?=
 =?utf-8?B?M2VkNFczUDduYTNkNWhtaGwyZ29GdTE4d2ZTaHRQaEhZY1BjTlhFem81T2F1?=
 =?utf-8?B?Z2YwVlJteEpKL3lmQXpYN0Z0NDBzcDBKd3p1RHZ5OW1tZWpUT0pUekdTRzdG?=
 =?utf-8?B?OGJMMGV3ZHNsY2kwL0puVEprUC8xVG8zU2dDMlQ3aW9OZStoT29CTDFVb3Na?=
 =?utf-8?B?Qkd0RjVrM1pyVitUQ2xlczFINmViZWFjd2p6RnhyTG9ZeHY1OWJkVlUwZ1Zo?=
 =?utf-8?B?Zy96bkkwUVJ3RU5sZkkveVRqemFhMTB1UnlVTFIycGdvKzBGRi9EeFFhT1FX?=
 =?utf-8?B?ZTg0ZGZTQXFBKzZiVkdGR1J1OGM1bnFtQVJaU0RMaE0wRlMxVDk3clB0NEFl?=
 =?utf-8?B?eU5BcCtZRWhLUGRjaVFINGJ1U1NWekUrMGhTMjlmZ2lDeEpQcU5MK1FIc285?=
 =?utf-8?B?NzRjY0JOY1h6RFBaL1V6WG9uM1JETTNNTDQyNWFJYkQralQ4cFJiSHFOYU9K?=
 =?utf-8?B?WXBlUHlSK3ZvUitJdFFBRTN5WG50VmVFcmxLU1V0OXV4WWJKUVFicThhcXo2?=
 =?utf-8?B?Zy90UlBVY21UNlU3RjM3RVFuNmxNNDVLRittcWdBcGdobWNjWTJpME85TWNT?=
 =?utf-8?B?RlB2MXF4Z3dBeno3ZE5XWitnRFh3Y2h5ZERiWUxFNWtsVmE1cVpWbFpZNE03?=
 =?utf-8?B?THRNRk1zR1hOMzJleG0vUDd0cnhHVXpGNkJuVmdLSUx4YnRFZlVQOHk4dHFm?=
 =?utf-8?B?cGExc215TzF4RVMyWUV6NU1UN0VkVmsrS2EvcDF5Z0g2RDJGa0ljaUI5UHA4?=
 =?utf-8?B?NTc1a2tYN3lTY1kxZzNBU0cwRGFDdlJnbFJlRVlPd05vbEcyVTYzcUFoMlhu?=
 =?utf-8?B?K1JrZDVLcWNLbnJocXdId0tvSmc4ZDZVNk1Yei9LNFJtSzdxb2ZkS3VvWGRt?=
 =?utf-8?B?MzBxY044WFBqM0l0Z1IrMDRHNGhXRU1BVXhFbEVVcENlSDRRamhOSmxlUE9h?=
 =?utf-8?B?cnVJYVVud2g2MUJlZEpLQ3AzNHJwUU01TTBqUnlNNzZNRm1xUTJ6QkhmdkFa?=
 =?utf-8?Q?FE8YEyNiHvVFvxxhVFscS0MGd?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3573ac-0831-4528-9818-08dd7b4b6645
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:56:32.6333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyBsjvHxc7v4cwDjcW+OqF4R2Xm/f+AIIVcC/f/9e7Cztt/kcCRDKWMukBcRqh+xhImrppkJoIui219KWeIaNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8156

Hi Neil,


On 4/14/2025 6:21 PM, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
>
> On 14/04/2025 12:12, Chuan Liu via B4 Relay wrote:
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Since the MSR_CLK register offset differs between chip variants, we
>> replace the macro-based definition with chip-specific assignments.
>>
>> Change the max_register in regmap_config to be retrieved from DTS.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>>   drivers/soc/amlogic/meson-clk-measure.c | 54 
>> ++++++++++++++++++++++++---------
>>   1 file changed, 39 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c 
>> b/drivers/soc/amlogic/meson-clk-measure.c
>> index 39638d6a593c..82c008ade894 100644
>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>> @@ -14,11 +14,6 @@
>>
>>   static DEFINE_MUTEX(measure_lock);
>>
>> -#define MSR_CLK_DUTY         0x0
>> -#define MSR_CLK_REG0         0x4
>> -#define MSR_CLK_REG1         0x8
>> -#define MSR_CLK_REG2         0xc
>> -
>>   #define MSR_DURATION                GENMASK(15, 0)
>>   #define MSR_ENABLE          BIT(16)
>>   #define MSR_CONT            BIT(17) /* continuous measurement */
>> @@ -39,9 +34,17 @@ struct meson_msr_id {
>>       const char *name;
>>   };
>>
>> +struct msr_reg_offset {
>> +     unsigned int duty_val;
>> +     unsigned int freq_ctrl;
>> +     unsigned int duty_ctrl;
>> +     unsigned int freq_val;
>> +};
>> +
>>   struct meson_msr_data {
>>       struct meson_msr_id *msr_table;
>>       unsigned int msr_count;
>> +     struct msr_reg_offset *reg;
>
> const truct msr_reg_offset *reg;
>
>>   };
>>
>>   struct meson_msr {
>> @@ -495,6 +498,7 @@ static int meson_measure_id(struct meson_msr_id 
>> *clk_msr_id,
>>                           unsigned int duration)
>>   {
>>       struct meson_msr *priv = clk_msr_id->priv;
>> +     struct msr_reg_offset *reg = priv->data.reg;
>>       unsigned int val;
>>       int ret;
>>
>> @@ -502,22 +506,22 @@ static int meson_measure_id(struct meson_msr_id 
>> *clk_msr_id,
>>       if (ret)
>>               return ret;
>>
>> -     regmap_write(priv->regmap, MSR_CLK_REG0, 0);
>> +     regmap_write(priv->regmap, reg->freq_ctrl, 0);
>>
>>       /* Set measurement duration */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
>> +     regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_DURATION,
>>                          FIELD_PREP(MSR_DURATION, duration - 1));
>>
>>       /* Set ID */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
>> +     regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_CLK_SRC,
>>                          FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
>>
>>       /* Enable & Start */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0,
>> +     regmap_update_bits(priv->regmap, reg->freq_ctrl,
>>                          MSR_RUN | MSR_ENABLE,
>>                          MSR_RUN | MSR_ENABLE);
>>
>> -     ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
>> +     ret = regmap_read_poll_timeout(priv->regmap, reg->freq_ctrl,
>>                                      val, !(val & MSR_BUSY), 10, 10000);
>>       if (ret) {
>>               mutex_unlock(&measure_lock);
>> @@ -525,10 +529,10 @@ static int meson_measure_id(struct meson_msr_id 
>> *clk_msr_id,
>>       }
>>
>>       /* Disable */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
>> +     regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_ENABLE, 0);
>>
>>       /* Get the value in multiple of gate time counts */
>> -     regmap_read(priv->regmap, MSR_CLK_REG2, &val);
>> +     regmap_read(priv->regmap, reg->freq_val, &val);
>>
>>       mutex_unlock(&measure_lock);
>>
>> @@ -599,11 +603,10 @@ static int clk_msr_summary_show(struct seq_file 
>> *s, void *data)
>>   }
>>   DEFINE_SHOW_ATTRIBUTE(clk_msr_summary);
>>
>> -static const struct regmap_config meson_clk_msr_regmap_config = {
>> +static struct regmap_config meson_clk_msr_regmap_config = {
>>       .reg_bits = 32,
>>       .val_bits = 32,
>>       .reg_stride = 4,
>> -     .max_register = MSR_CLK_REG2,
>>   };
>>
>>   static int meson_msr_probe(struct platform_device *pdev)
>> @@ -611,6 +614,7 @@ static int meson_msr_probe(struct platform_device 
>> *pdev)
>>       const struct meson_msr_data *match_data;
>>       struct meson_msr *priv;
>>       struct dentry *root, *clks;
>> +     struct resource *res;
>>       void __iomem *base;
>>       int i;
>>
>> @@ -636,15 +640,23 @@ static int meson_msr_probe(struct 
>> platform_device *pdev)
>>              match_data->msr_count * sizeof(struct meson_msr_id));
>>       priv->data.msr_count = match_data->msr_count;
>>
>> -     base = devm_platform_ioremap_resource(pdev, 0);
>> +     base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>       if (IS_ERR(base))
>>               return PTR_ERR(base);
>>
>> +     meson_clk_msr_regmap_config.max_register = resource_size(res) - 4;
>>       priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>> &meson_clk_msr_regmap_config);
>>       if (IS_ERR(priv->regmap))
>>               return PTR_ERR(priv->regmap);
>>
>> +     priv->data.reg = devm_kzalloc(&pdev->dev, sizeof(struct 
>> msr_reg_offset),
>> +                                   GFP_KERNEL);
>> +     if (!priv->data.reg)
>> +             return -ENOMEM;
>> +
>> +     memcpy(priv->data.reg, match_data->reg, sizeof(struct 
>> msr_reg_offset));


If define struct msr_reg_offset as const, it causes a compilation error
here. What's the better way to handle this?
1) Forced type conversion:
     memcpy((void*)priv->data.reg, match_data->reg,
                    sizeof(struct msr_reg_offset));
2) Directly assign the already-defined meson_msr_data->reg (Remove
dynamic memory allocation for 'priv->data.reg'"):
     priv->data.reg = match_data->reg;


>> +
>>       root = debugfs_create_dir("meson-clk-msr", NULL);
>>       clks = debugfs_create_dir("clks", root);
>>
>> @@ -664,29 +676,41 @@ static int meson_msr_probe(struct 
>> platform_device *pdev)
>>       return 0;
>>   }
>>
>> +struct msr_reg_offset msr_reg_offset = {
>> +     .duty_val = 0x0,
>> +     .freq_ctrl = 0x4,
>> +     .duty_ctrl = 0x8,
>> +     .freq_val = 0xc,
>> +};
>
> This should be static const
>
>> +
>>   static const struct meson_msr_data clk_msr_gx_data = {
>>       .msr_table = (void *)clk_msr_gx,
>>       .msr_count = ARRAY_SIZE(clk_msr_gx),
>> +     .reg = &msr_reg_offset,
>>   };
>>
>>   static const struct meson_msr_data clk_msr_m8_data = {
>>       .msr_table = (void *)clk_msr_m8,
>>       .msr_count = ARRAY_SIZE(clk_msr_m8),
>> +     .reg = &msr_reg_offset,
>>   };
>>
>>   static const struct meson_msr_data clk_msr_axg_data = {
>>       .msr_table = (void *)clk_msr_axg,
>>       .msr_count = ARRAY_SIZE(clk_msr_axg),
>> +     .reg = &msr_reg_offset,
>>   };
>>
>>   static const struct meson_msr_data clk_msr_g12a_data = {
>>       .msr_table = (void *)clk_msr_g12a,
>>       .msr_count = ARRAY_SIZE(clk_msr_g12a),
>> +     .reg = &msr_reg_offset,
>>   };
>>
>>   static const struct meson_msr_data clk_msr_sm1_data = {
>>       .msr_table = (void *)clk_msr_sm1,
>>       .msr_count = ARRAY_SIZE(clk_msr_sm1),
>> +     .reg = &msr_reg_offset,
>>   };
>>
>>   static const struct of_device_id meson_msr_match_table[] = {
>>
>
> With this fixed:
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> Thanks,
> Neil

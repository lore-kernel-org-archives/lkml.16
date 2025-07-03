Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022121.outbound.protection.outlook.com [40.107.75.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B08128D831;
	Thu,  3 Jul 2025 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529642; cv=fail; b=UKcuoIu+6qEY0ZHP0FWOJCcQNBdlCNbRVbZ+oKat/y+B1M2BLzPKQcHgLy07vNUiKnGKMSIhLQmlxpGh4bn23oqNd5gh8OovhlIOxCtM+RcW0bNYiTcsSDzsnYuS/NFpZ6bASq+TgKVIjQQfzQYbyoUo+9WvvY016mFsaotjDUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529642; c=relaxed/simple;
	bh=r/3oC8we5UrW3L3EpB5BhAq18tCXc6/n2sRJFmyw0Kk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nO484pgGK4cim7ffajLZ5DYixuIZxSA2jio6peH6pVIZtA4IZMUmX2MRarJ6ft64MNPuaRbjcr3GtvoGLATCpu2spVWrgSIfGCmg68Kqa+BvutvycW635DusfdN0mhXeQNb3ZWWpEAQGV8PmLNh7UlU8+8x5fjDU75j7LZ2TL48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=TAq7MZni; arc=fail smtp.client-ip=40.107.75.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="TAq7MZni"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMnEICBY7e1RPIcSxgVuHAvSFAFHRkumsrFNiRc/53rPi2opTnvA7pv4QgvrjzDa66UojbPJVv/Yc2Sau+8dcrs7pJupl6iiux9Bs3Iv4c+JGuEYQKvB4GRM47LjX6PlOQO4rjAEiQMZ/1ey/V+KqEwe3FwtifUtHoVl52mcULVSH53MOUP7VXmT0RSSpj1FsY7D9To182BMN58lsvyCgL2cCRkb0paeHo18n0TxfCKp3sA2uHWZKc4Tferbua7wZCWJaCQew8f+spC0cZsV7xF+lDKqPiZJr+hYWSFE69xI05Sqsa+LsLInqIl5ScSsva/HAWLQ0Hm+gPtZPBd/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/3Z2VVpjYxnZecOWPqvFbgpDb/bl8iuMCwj9r0FpIQ=;
 b=Ohcw0xUjIESwQy60UJY6aVhg8QwMKf9aW4jFydYHAbCkT+77eC1jakYpyC99NlyCtlcQnsEHj7g17lAiYuZeuCroNkyoIbmETZnl3c4Ns1DyyJULkUQBNdxT46IFAhpKdnJsfRmzPMfg8TBtvTVNQL2BQ9t05dH755t/WdKwyCQfyoZiV0ZVn1azr9QdkJeC++hsc+d5NDuTlXF2WfHADTEuk6hhKDG/uUP/CuHiQDgGu9KO7cdScLFN9cVVQspv/24w5FI9XUwlaq63O8G/VjA5F6rZKSwAdPWmVPB76NssXjxKqy0mWOXDWN9YfB5AWCdngOzoCwudUOdUPJPD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/3Z2VVpjYxnZecOWPqvFbgpDb/bl8iuMCwj9r0FpIQ=;
 b=TAq7MZnimH2Onl4elVEIn2CjkX52/Hje7JewaOnzUI28DzHPaqunFRLS0CfhLtSq1ihDJFjcUOhuT7POKh9fUnnBbFC/4vp3OWEIG9rnF2K1e2fpXcb41+Shl010AKorXjPfGzZBDGaBVmzJAMwuQiYAccDC3mMY/JQCWOeTjn8pRdcOqnm5N66cTwJQ3p/gMuyRmgtclRY+1QsZFhRXow130EaYJ82pvilpdajp6CMYGzgz18Rl+jNycxsrV6NGttyLr7XUjp8FuIpWGehY/6Il5TJieW9xZkkwIBs7A0FUTCaNTUIH5I4adGf5ceAxrSY9FmAw7xnpjkmuZW4wGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYUPR03MB7232.apcprd03.prod.outlook.com (2603:1096:400:354::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 08:00:36 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 08:00:35 +0000
Message-ID: <0b566a2b-c189-4dc0-a661-019e9c68d009@amlogic.com>
Date: Thu, 3 Jul 2025 16:00:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/26] clk: amlogic: s4-peripherals: naming consistency
 alignment
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-12-e163c9a1fc21@baylibre.com>
 <a7738c67-25fc-4919-bee8-69a72abb4871@amlogic.com>
 <1jsejdd805.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jsejdd805.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYUPR03MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7ce975-5af2-426b-2a87-08ddba07b132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHFkZHdvT3dGL2FUMVF5andzeHI5bDFWM2hVV2gzL0NkYVFTVWV6YjB1WnVs?=
 =?utf-8?B?bVFMNkthanplbmRyTzNYTVhTZWtyNFhWQ3d5bTR1NVRKSUJuRXdMcjhKelRp?=
 =?utf-8?B?eDFib2prMEVsdFBRN2p0UTJWaHVXenI3cE8wQkU4aXFRTjZuOEY0WGgrenNw?=
 =?utf-8?B?SGRJdXhza01XOTRxV3FLSHUvL1lER1k1Z1hjNVZZSjNTbWJIbnRkWkt4dm5R?=
 =?utf-8?B?c1VSaTR0NnpMTE5YckZjYllEclBXV0VBQjJWMld5ejhlQ1pHVlVjenU5enZ3?=
 =?utf-8?B?QmRTbDZ1cjRxOW1DVWtVSGswNmZNWnVEYWZYa2MyQnc2RGxjSUJOU1h1cWYz?=
 =?utf-8?B?VTV2OXpXdTlmL0dSbTBtdU5waElwbXlvN2gyVHdkUGl1Nll0UWMvRktMb0Rz?=
 =?utf-8?B?c0NYa2wvTEZGWHhLckNCTGxsYm03dGM2MkRMNUhEcjIrRzlRalRWMCtGbUxQ?=
 =?utf-8?B?VmsyOVNVZzRxREczVkpCRThGWk9zdmt6VmZtU3prNFpBMExSRG5LQVR2N3d1?=
 =?utf-8?B?K296ellTU1VjZDBnZjF4OU1kT0owMVI4NWlhNDZzdVNOTlJVdzVCblc2bFh3?=
 =?utf-8?B?cGpjYnh0eHFWSjVNL0YxTVVVdXVPM3BmUlgzMzdHaGFnb1RPbnpJSHEzcUdB?=
 =?utf-8?B?dDhrcGsrd2dXOXdDTm5yeGJ4ZmcwMHY4dCt6WVFsalI2Y05FbnRsRHRxSUJW?=
 =?utf-8?B?ajVzc1dwd2NsMDhGQ09FUVd4STl5eW0yVFRpZTVobDdUcUVQemk3MVpxWjlO?=
 =?utf-8?B?Z2Fzc1B0NEptQ3I1aXZGTFBtYkRrQTh4Nld5b3hRM1RMQ0l4OU5ZeEV4eXBP?=
 =?utf-8?B?djBkMVF1N2dwS3NJS08xeFFSK3JVck1pL0g3NEZNUExKVjBBbTF1b3FvZENt?=
 =?utf-8?B?Wm54T0wxbk1PMmpmWE1hZ2RHdnROU1JzZ0U1ZWlsYjRRYWpmMGVXQlFmMTQ5?=
 =?utf-8?B?dVhNd0VSNXFwVEdsd3poM2RRNEJDMTdycGdCbXBHNHlWd1NQazZISTBMakdl?=
 =?utf-8?B?ZGFmNmFtS2txY2VLK2huby9sWjl3cElVdW1YT1phZFFLQnBvczg4OW5vS2lJ?=
 =?utf-8?B?SXVNNWtzekhEMVpHeVVCeExjRytFQVZyK1dXd3dOeS95TTZuZWRzbVgvb1dE?=
 =?utf-8?B?Y1BheUxTejR5Z1dseVVQNSs4Zmw1T2RIZGt2MVpZcUxRMzdtRzJBMkdyRW44?=
 =?utf-8?B?dFZVZnJZcHNadVlTNi9vMDhPb2JGSDFJYU9XWTRFZ0FOd2pnWWVsQWVUUzFM?=
 =?utf-8?B?YlRXRUZkQWIvanowdUpaN1FRMjFNL29RcFZ6dVNEYndWeGhaWmVmSUY0NDIx?=
 =?utf-8?B?UU5FcVQzM0ozWklpRURSajIvYU41UEQ1NUtDbVprMThnRTVKaDVINkNEdWdJ?=
 =?utf-8?B?T09VUUorWFFyallZYlYzYjRrdC9qRmY5dE9SaDdUNjB4bGI1M0FrSitKRjZa?=
 =?utf-8?B?MlR4RTd3aHBrZlBhNk1nMXR0Um9acHBzRzNvZFd3aHFjSUt2clg3YndEOVYr?=
 =?utf-8?B?RlFvSEZoaDZkOTh3bDRFNUxhaERZYUZnMTVVdmxuVHFpVFNyZkYrOGo2MENN?=
 =?utf-8?B?eGV0S0pNZDBrTWhqUkg3WW1mWW50eWlGQU1KeWY1QUdOY2NGV1RmR0RjUFQr?=
 =?utf-8?B?K1RCNEdFaGVzdXpZYkJjdHJPYklmN3FyMFRZUFFGa2p4bnQ5M3lTdU42ajBQ?=
 =?utf-8?B?SHJtMGRieWx0TnlOSkRWK1M5M0xjb3dVdm5oTDNWN3R3Vk5hc0tER2FWSTg5?=
 =?utf-8?B?TXlSUXkwTUs0dFFSQmtTMXI5d3djTGlRdksyUWp0dE4rNEk0S1pJZ1NxS0Iw?=
 =?utf-8?B?RFZMc1cra1VQZ1kxYjQxa2lBY09oSzlSd0pZSDRqWERsT1dGb0U4SXVxbCsz?=
 =?utf-8?B?S0taRi8xejFNcTlWem5KVkFjNHlhd2pNeGZ6b0ZSTjlGVnpYUFU3QlVTbjdk?=
 =?utf-8?Q?amP+9vcSzNU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?US9rc2U1eG1VOTA3Yk9Jd0JHTDVHbm5VMWtaVEcxSUhPOFQzMnYvaTlaZk5J?=
 =?utf-8?B?Lzg1eFA4MDVGWlRSanBWeXVIZDA3cURpTGZ2clRZRG5SMDBPeHFkblY3d0xP?=
 =?utf-8?B?eVRMK3VEdk5GTnNKL2FLakpIaGZFNEJHOU1ZNUxweXJHWEozdUt4V3hZUGxu?=
 =?utf-8?B?ZE9PVkhUaHA5SEZqTGt2VzJ0d21wdlFldmZUWlNlNnM4U3NheFJRaHNVMEo0?=
 =?utf-8?B?M0VlcjFGTFBSNzJLYWVsVnM1Q1MyNi9PUDFOM0tXU1Q2eEp0ZEVOVm91dFpa?=
 =?utf-8?B?Rm1iakFvZlJvWkdxTkdvS2VyWDJ5a1B3b1FKQ2x5QlFzUXN4ckI3cTF1Z2dh?=
 =?utf-8?B?U3FnNW9tblh6a3I0NkRqUkZpVTlEcUlkTUltbUJHangxRUNVc2NrcEZxRWEx?=
 =?utf-8?B?RU8wQ1VyNkNPWksvbVluNUhIVHpRUUZMOFhqTml1MjdIVmNlaGRycVBwWENk?=
 =?utf-8?B?SGdDMXdlSUFpUEgvSlk0eGZpYlBKa21jYlE4ZmNwVWxiUWVuM21PYThZUnJR?=
 =?utf-8?B?TndjNWRabGhIMy82VC9wOWVFelhkVlRNbkF3WEtUOFhhUGVRRE9MUTA1QzlX?=
 =?utf-8?B?dWlBQ2NWUC9jOTFqZythUFdkeHZseUsrcHZ0MUEvNnFSZ083VXlWVXBKMXda?=
 =?utf-8?B?Z05oV2F3VFRhbTRScUNIS2N2Kzh5KzJJU0NEcE9xUVJaNDlrdFVUMkxoZzdW?=
 =?utf-8?B?UGw4aG1GUk0xNW5HMlJka2xMcUFCOVViRGI1eVZxM3NHVU5mdHpnVkhCeVJK?=
 =?utf-8?B?ZEFXdXlieVV5aElLTnZsTytqTTJlUUFlMGk3TWdiaHFwc1VkT0tLSGhGMDRH?=
 =?utf-8?B?QWtoNllxRm1xMjAxeCtwVmJSbU1RajJnOUhXVXNJVkF3VXg4Unc3NnY5U29u?=
 =?utf-8?B?UFVOTWo3eitHUGF1c0c3bVdHWloxcEFPNG4wTnVkTFZZQTZTRjMvaG1laUE0?=
 =?utf-8?B?YjIyR1JUdERLY0ZOdHl0L0JRMlZXYnd4MC8vLzZwcFVmRkt0enZ3SXEwdzNU?=
 =?utf-8?B?Y1lhSlpGT2cxNXFodFpIeWZ0U3lkb3JSRlZiZERuZ1JzUE5EUVJPWTRaWmpI?=
 =?utf-8?B?UVJVdGZwbHlRQzVVc1ZYeGJmbnRCYUNoVDNwdnFUcksxWk5seE9rcDltNVFB?=
 =?utf-8?B?bjc5MWdwWVRZc2NmWEE4LzNqb05INFFsVW1VOEFrVjhXNlRTUnJLbnhDemZz?=
 =?utf-8?B?M3FvaisvNzdWVWtReTUzc29ZS2FtK05waDkzWWlIOUx6Q0lDdWdFK0ZTczVo?=
 =?utf-8?B?aHZUNEsxQUpibGxXV3ZxdWNJQmUvc1p5dlYvb0RxQmFnUVRxNlZCSURaVzIr?=
 =?utf-8?B?cWhiRDRQakV2QkpYd0owVnJiNjRlUzBvOGMwMU5XOU1HeVRJcXhaQ1BvZXg4?=
 =?utf-8?B?U0lSMTIxMjBwb0ViR1ZHWC8xUDBLaGtCVmxob084Q25pVE9xRGlUQUZNSjM0?=
 =?utf-8?B?d2k0d2MvWUp5QUlWQ1FBQzhHMTR6bFVINVViTnR1ZTBlR3ZjRUF0QnNRWWNW?=
 =?utf-8?B?amdJRDNFQ2haK2NJTGpyLzBBcGNIMklPVG5yeEJ2bkhjaXFlR1pkMFJLdlV1?=
 =?utf-8?B?b29jUHFPdE1QRGJYdXpyY0VUZGUvSlVaSjlUVHU2VU1tL01VSDZQQ0pscnd6?=
 =?utf-8?B?QkhkRTAxY2tQdmRlRDJibitHQjZrdHlFOTZibDVnNGlocWVvU1ErUTB0WFlX?=
 =?utf-8?B?aG9mTlF3ckE0Z1VnUHlnQ2dQS1h1U2xWNml4dll3Y3VlcEdSN2ZkTlNBalND?=
 =?utf-8?B?N2hTajdYV3lTNmVrQnVGaGxqcHpmM21sdFVCelRzVGZ4K0dycXRHc0RVY0FB?=
 =?utf-8?B?R0llRlEwdEJMWjlXZzNVZDFCT2JHN3NnazRFQi9GR1g5bWVCS1REd2tMWklK?=
 =?utf-8?B?VnRlc1pVcmh2bDVOaE9rdU5qTFRJOTJSWmpyOGcyb3EzYUJSMDdLTCt6U2Vz?=
 =?utf-8?B?MnNMZVhzRjFPcTY4c2Rkc1JiUFhTMWNlSDlQSW9aNG5LZzNjaDlQZE4zdkFr?=
 =?utf-8?B?dVhvc0RpMGY5U1FJNXRyNlJ5TDZYNll0YlUwZWZIVXI0Uk5OclFQZXJvQmds?=
 =?utf-8?B?RDhXb0NqbTdPbk5ITUp6akhjUm1KNUYwVHlFZ0wySjlRVHU5ekhCbk5nclFS?=
 =?utf-8?Q?wq9fVETUDyzVlGGRVgmpHzYE9?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7ce975-5af2-426b-2a87-08ddba07b132
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 08:00:35.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VeDxgvDp9UPMNZTmWnpnY/1RjWwEFnLfkFKiCHHhF0qWnf2whPizqeyXaOPsxFyU0Muuhi6BBz02jKDpVExfBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7232


On 7/3/2025 3:54 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu 03 Jul 2025 at 11:18, Chuan Liu <chuan.liu@amlogic.com> wrote:
>
>> Hi Jerome:
>>
>>
>> On 7/2/2025 11:26 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> Amlogic clock controller drivers are all doing the same thing, more or
>>> less. Yet, over the years, tiny (and often pointless) differences have
>>> emerged.
>>>
>>> This makes reviews more difficult, allows some errors to slip through and
>>> make it more difficult to exploit SoC commonalities, leading to code
>>> duplication.
>>>
>>> This change enforce, wherever possible, a consistent and predictable scheme
>>> when it comes to code organisation and naming, The scheme chosen is what
>>> was used the most already, to try and minimise the size of the ugly
>>> resulting diff. Here are some of the rules applied:
>>> - Aligning clock names, variable names and IDs.
>>>     - ID cannot change (used in DT)
>>>     - Variable names w/ SoC name prefixes
>>>     - Clock names w/o SoC name prefixes, except pclks for historic reasons
>>> - Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
>>> - Parent table systematically named with the same name as the clock and
>>>     a '_parents' suffix
>>> - Group various tables next to the related clock
>>> - etc ...
>>>
>>> Doing so removes what would otherwise show up as unrelated diff in
>>> following changes. It will allow to introduce common definitions for
>>> peripheral clocks, probe helpers, composite clocks, etc ... making further
>>> review and maintenance easier.
>>>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>    drivers/clk/meson/s4-peripherals.c | 746 ++++++++++++++++++-------------------
>>>    1 file changed, 370 insertions(+), 376 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
>>> index c9400cf54c84c3dc7c63d0636933951b0cac230c..9bcd35f12836de5e318fd1ad9c9ae15a2bfc3dd7 100644
>>> --- a/drivers/clk/meson/s4-peripherals.c
>>> +++ b/drivers/clk/meson/s4-peripherals.c
>>
>> [...]
>>
>>
>>> @@ -1320,7 +1320,7 @@ static struct clk_regmap s4_ts_clk_gate = {
>>>     * mux because it does top-to-bottom updates the each clock tree and
>>>     * switches to the "inactive" one when CLK_SET_RATE_GATE is set.
>>>     */
>>> -static const struct clk_parent_data s4_mali_0_1_parent_data[] = {
>>> +static const struct clk_parent_data s4_mali_parents[] = {
>>>           { .fw_name = "xtal", },
>>>           { .fw_name = "gp0_pll", },
>>>           { .fw_name = "hifi_pll", },
>>> @@ -1340,8 +1340,8 @@ static struct clk_regmap s4_mali_0_sel = {
>>>           .hw.init = &(struct clk_init_data){
>>>                   .name = "mali_0_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_mali_0_1_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
>>> +               .parent_data = s4_mali_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_mali_parents),
>>>                   /*
>>>                    * Don't request the parent to change the rate because
>>>                    * all GPU frequencies can be derived from the fclk_*
>>> @@ -1394,8 +1394,8 @@ static struct clk_regmap s4_mali_1_sel = {
>>>           .hw.init = &(struct clk_init_data){
>>>                   .name = "mali_1_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_mali_0_1_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
>>> +               .parent_data = s4_mali_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_mali_parents),
>>>                   .flags = 0,
>>>           },
>>>    };
>>> @@ -1433,28 +1433,26 @@ static struct clk_regmap s4_mali_1 = {
>>>           },
>>>    };
>>>
>>> -static const struct clk_hw *s4_mali_parent_hws[] = {
>>> -       &s4_mali_0.hw,
>>> -       &s4_mali_1.hw
>>> -};
>>> -
>>> -static struct clk_regmap s4_mali_mux = {
>>> +static struct clk_regmap s4_mali_sel = {
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_MALI_CLK_CTRL,
>>>                   .mask = 1,
>>>                   .shift = 31,
>>>           },
>>>           .hw.init = &(struct clk_init_data){
>>> -               .name = "mali",
>>> +               .name = "mali_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_hws = s4_mali_parent_hws,
>>> +               .parent_hws = (const struct clk_hw *[]) {
>>> +                       &s4_mali_0.hw,
>>> +                       &s4_mali_1.hw,
>>> +               },
>>>                   .num_parents = 2,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>>           },
>>>    };
>>>
>>>    /* VDEC clocks */
>>> -static const struct clk_parent_data s4_dec_parent_data[] = {
>>> +static const struct clk_parent_data s4_dec_parents[] = {
>>>           { .fw_name = "fclk_div2p5", },
>>>           { .fw_name = "fclk_div3", },
>>>           { .fw_name = "fclk_div4", },
>>> @@ -1465,7 +1463,7 @@ static const struct clk_parent_data s4_dec_parent_data[] = {
>>>           { .fw_name = "xtal", }
>>>    };
>>>
>>> -static struct clk_regmap s4_vdec_p0_mux = {
>>> +static struct clk_regmap s4_vdec_p0_sel = {
>>
>> Since both vdec_clk and mali_clk are 'no glitch clock', should we also unify
>> the naming from 's4_vdec_p0'/'s4_vdec_p1' to 's4_vdec_0'/'s4_vdec_1'?
> Please have another look at the description.
>
> As much as possible, I want the ID, clock name, and variable names
> aligned. ID do not change and has that 'p' ... so no, the 'p' stays.


Okay, understand


Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>


>>
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VDEC_CLK_CTRL,
>>>                   .mask = 0x7,
>>> @@ -1473,10 +1471,10 @@ static struct clk_regmap s4_vdec_p0_mux = {
>>>                   .flags = CLK_MUX_ROUND_CLOSEST,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "vdec_p0_mux",
>>> +               .name = "vdec_p0_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_dec_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>>> +               .parent_data = s4_dec_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>>                   .flags = 0,
>>>           },
>>>    };
>>> @@ -1492,7 +1490,7 @@ static struct clk_regmap s4_vdec_p0_div = {
>>>                   .name = "vdec_p0_div",
>>>                   .ops = &clk_regmap_divider_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>> -                       &s4_vdec_p0_mux.hw
>>> +                       &s4_vdec_p0_sel.hw
>>>                   },
>>>                   .num_parents = 1,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>> @@ -1515,7 +1513,7 @@ static struct clk_regmap s4_vdec_p0 = {
>>>           },
>>>    };
>>>
>>> -static struct clk_regmap s4_vdec_p1_mux = {
>>> +static struct clk_regmap s4_vdec_p1_sel = {
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VDEC3_CLK_CTRL,
>>>                   .mask = 0x7,
>>> @@ -1523,10 +1521,10 @@ static struct clk_regmap s4_vdec_p1_mux = {
>>>                   .flags = CLK_MUX_ROUND_CLOSEST,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "vdec_p1_mux",
>>> +               .name = "vdec_p1_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_dec_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>>> +               .parent_data = s4_dec_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>>                   .flags = 0,
>>>           },
>>>    };
>>> @@ -1542,7 +1540,7 @@ static struct clk_regmap s4_vdec_p1_div = {
>>>                   .name = "vdec_p1_div",
>>>                   .ops = &clk_regmap_divider_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>> -                       &s4_vdec_p1_mux.hw
>>> +                       &s4_vdec_p1_sel.hw
>>>                   },
>>>                   .num_parents = 1,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>> @@ -1565,27 +1563,25 @@ static struct clk_regmap s4_vdec_p1 = {
>>>           },
>>>    };
>>>
>>> -static const struct clk_hw *s4_vdec_mux_parent_hws[] = {
>>> -       &s4_vdec_p0.hw,
>>> -       &s4_vdec_p1.hw
>>> -};
>>> -
>>> -static struct clk_regmap s4_vdec_mux = {
>>> +static struct clk_regmap s4_vdec_sel = {
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VDEC3_CLK_CTRL,
>>>                   .mask = 0x1,
>>>                   .shift = 15,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "vdec_mux",
>>> +               .name = "vdec_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_hws = s4_vdec_mux_parent_hws,
>>> -               .num_parents = ARRAY_SIZE(s4_vdec_mux_parent_hws),
>>> +               .parent_hws = (const struct clk_hw *[]) {
>>> +                       &s4_vdec_p0.hw,
>>> +                       &s4_vdec_p1.hw,
>>> +               },
>>> +               .num_parents = 2,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>>           },
>>>    };
>>>
>>> -static struct clk_regmap s4_hevcf_p0_mux = {
>>> +static struct clk_regmap s4_hevcf_p0_sel = {
>>
>> +static struct clk_regmap s4_hevcf_0_sel
>> +static struct clk_regmap s4_hevcf_0_div
>> .
>> .
>> .
>>
>>
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VDEC2_CLK_CTRL,
>>>                   .mask = 0x7,
>>> @@ -1593,10 +1589,10 @@ static struct clk_regmap s4_hevcf_p0_mux = {
>>>                   .flags = CLK_MUX_ROUND_CLOSEST,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "hevcf_p0_mux",
>>> +               .name = "hevcf_p0_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_dec_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>>> +               .parent_data = s4_dec_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>>                   .flags = 0,
>>>           },
>>>    };
>>> @@ -1612,7 +1608,7 @@ static struct clk_regmap s4_hevcf_p0_div = {
>>>                   .name = "hevcf_p0_div",
>>>                   .ops = &clk_regmap_divider_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>> -                       &s4_hevcf_p0_mux.hw
>>> +                       &s4_hevcf_p0_sel.hw
>>>                   },
>>>                   .num_parents = 1,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>> @@ -1625,7 +1621,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>>>                   .bit_idx = 8,
>>>           },
>>>           .hw.init = &(struct clk_init_data){
>>> -               .name = "hevcf_p0_gate",
>>> +               .name = "hevcf_p0",
>>>                   .ops = &clk_regmap_gate_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>>                           &s4_hevcf_p0_div.hw
>>> @@ -1635,7 +1631,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>>>           },
>>>    };
>>>
>>> -static struct clk_regmap s4_hevcf_p1_mux = {
>>> +static struct clk_regmap s4_hevcf_p1_sel = {
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VDEC4_CLK_CTRL,
>>>                   .mask = 0x7,
>>> @@ -1643,10 +1639,10 @@ static struct clk_regmap s4_hevcf_p1_mux = {
>>>                   .flags = CLK_MUX_ROUND_CLOSEST,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "hevcf_p1_mux",
>>> +               .name = "hevcf_p1_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_dec_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
>>> +               .parent_data = s4_dec_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>>>                   .flags = 0,
>>>           },
>>>    };
>>> @@ -1662,7 +1658,7 @@ static struct clk_regmap s4_hevcf_p1_div = {
>>>                   .name = "hevcf_p1_div",
>>>                   .ops = &clk_regmap_divider_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>> -                       &s4_hevcf_p1_mux.hw
>>> +                       &s4_hevcf_p1_sel.hw
>>>                   },
>>>                   .num_parents = 1,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>> @@ -1685,28 +1681,26 @@ static struct clk_regmap s4_hevcf_p1 = {
>>>           },
>>>    };
>>>
>>> -static const struct clk_hw *s4_hevcf_mux_parent_hws[] = {
>>> -       &s4_hevcf_p0.hw,
>>> -       &s4_hevcf_p1.hw
>>> -};
>>> -
>>> -static struct clk_regmap s4_hevcf_mux = {
>>> +static struct clk_regmap s4_hevcf_sel = {
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VDEC4_CLK_CTRL,
>>>                   .mask = 0x1,
>>>                   .shift = 15,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "hevcf",
>>> +               .name = "hevcf_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_hws = s4_hevcf_mux_parent_hws,
>>> -               .num_parents = ARRAY_SIZE(s4_hevcf_mux_parent_hws),
>>> +               .parent_hws = (const struct clk_hw *[]) {
>>> +                       &s4_hevcf_p0.hw,
>>> +                       &s4_hevcf_p1.hw,
>>> +               },
>>> +               .num_parents = 2,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>>           },
>>>    };
>>>
>>>    /* VPU Clock */
>>> -static const struct clk_parent_data s4_vpu_parent_data[] = {
>>> +static const struct clk_parent_data s4_vpu_parents[] = {
>>>           { .fw_name = "fclk_div3", },
>>>           { .fw_name = "fclk_div4", },
>>>           { .fw_name = "fclk_div5", },
>>> @@ -1726,8 +1720,8 @@ static struct clk_regmap s4_vpu_0_sel = {
>>>           .hw.init = &(struct clk_init_data){
>>>                   .name = "vpu_0_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_vpu_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_vpu_parent_data),
>>> +               .parent_data = s4_vpu_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_vpu_parents),
>>>                   .flags = 0,
>>>           },
>>>    };
>>> @@ -1770,8 +1764,8 @@ static struct clk_regmap s4_vpu_1_sel = {
>>>           .hw.init = &(struct clk_init_data){
>>>                   .name = "vpu_1_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_vpu_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_vpu_parent_data),
>>> +               .parent_data = s4_vpu_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_vpu_parents),
>>>                   .flags = 0,
>>>           },
>>>    };
>>> @@ -1823,24 +1817,24 @@ static struct clk_regmap s4_vpu = {
>>>           },
>>>    };
>>>
>>> -static const struct clk_parent_data vpu_clkb_tmp_parent_data[] = {
>>> +static const struct clk_parent_data vpu_clkb_tmp_parents[] = {
>>>           { .hw = &s4_vpu.hw },
>>>           { .fw_name = "fclk_div4", },
>>>           { .fw_name = "fclk_div5", },
>>>           { .fw_name = "fclk_div7", }
>>>    };
>>>
>>> -static struct clk_regmap s4_vpu_clkb_tmp_mux = {
>>> +static struct clk_regmap s4_vpu_clkb_tmp_sel = {
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VPU_CLKB_CTRL,
>>>                   .mask = 0x3,
>>>                   .shift = 20,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "vpu_clkb_tmp_mux",
>>> +               .name = "vpu_clkb_tmp_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = vpu_clkb_tmp_parent_data,
>>> -               .num_parents = ARRAY_SIZE(vpu_clkb_tmp_parent_data),
>>> +               .parent_data = vpu_clkb_tmp_parents,
>>> +               .num_parents = ARRAY_SIZE(vpu_clkb_tmp_parents),
>>>                   .flags = CLK_SET_RATE_PARENT,
>>>           },
>>>    };
>>> @@ -1855,7 +1849,7 @@ static struct clk_regmap s4_vpu_clkb_tmp_div = {
>>>                   .name = "vpu_clkb_tmp_div",
>>>                   .ops = &clk_regmap_divider_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>> -                       &s4_vpu_clkb_tmp_mux.hw
>>> +                       &s4_vpu_clkb_tmp_sel.hw
>>>                   },
>>>                   .num_parents = 1,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>> @@ -1911,7 +1905,7 @@ static struct clk_regmap s4_vpu_clkb = {
>>>           },
>>>    };
>>>
>>> -static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
>>> +static const struct clk_parent_data s4_vpu_clkc_parents[] = {
>>>           { .fw_name = "fclk_div4", },
>>>           { .fw_name = "fclk_div3", },
>>>           { .fw_name = "fclk_div5", },
>>> @@ -1922,17 +1916,17 @@ static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
>>>           { .fw_name = "gp0_pll", },
>>>    };
>>>
>>> -static struct clk_regmap s4_vpu_clkc_p0_mux  = {
>>> +static struct clk_regmap s4_vpu_clkc_p0_sel  = {
>>
>> +static struct clk_regmap s4_vpu_clkc_0_sel
>> +static struct clk_regmap s4_vpu_clkc_0_div
>> .
>> .
>> .
>>
>>
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VPU_CLKC_CTRL,
>>>                   .mask = 0x7,
>>>                   .shift = 9,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "vpu_clkc_p0_mux",
>>> +               .name = "vpu_clkc_p0_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_vpu_clkc_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
>>> +               .parent_data = s4_vpu_clkc_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
>>>                   .flags = 0,
>>>           },
>>>    };
>>> @@ -1947,7 +1941,7 @@ static struct clk_regmap s4_vpu_clkc_p0_div = {
>>>                   .name = "vpu_clkc_p0_div",
>>>                   .ops = &clk_regmap_divider_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>> -                       &s4_vpu_clkc_p0_mux.hw
>>> +                       &s4_vpu_clkc_p0_sel.hw
>>>                   },
>>>                   .num_parents = 1,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>> @@ -1970,17 +1964,17 @@ static struct clk_regmap s4_vpu_clkc_p0 = {
>>>           },
>>>    };
>>>
>>> -static struct clk_regmap s4_vpu_clkc_p1_mux = {
>>> +static struct clk_regmap s4_vpu_clkc_p1_sel = {
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VPU_CLKC_CTRL,
>>>                   .mask = 0x7,
>>>                   .shift = 25,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "vpu_clkc_p1_mux",
>>> +               .name = "vpu_clkc_p1_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = s4_vpu_clkc_parent_data,
>>> -               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
>>> +               .parent_data = s4_vpu_clkc_parents,
>>> +               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
>>>                   .flags = 0,
>>>           },
>>>    };
>>> @@ -1995,7 +1989,7 @@ static struct clk_regmap s4_vpu_clkc_p1_div = {
>>>                   .name = "vpu_clkc_p1_div",
>>>                   .ops = &clk_regmap_divider_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>> -                       &s4_vpu_clkc_p1_mux.hw
>>> +                       &s4_vpu_clkc_p1_sel.hw
>>>                   },
>>>                   .num_parents = 1,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>> @@ -2018,28 +2012,26 @@ static struct clk_regmap s4_vpu_clkc_p1 = {
>>>           },
>>>    };
>>>
>>> -static const struct clk_hw *s4_vpu_mux_parent_hws[] = {
>>> -       &s4_vpu_clkc_p0.hw,
>>> -       &s4_vpu_clkc_p1.hw
>>> -};
>>> -
>>> -static struct clk_regmap s4_vpu_clkc_mux = {
>>> +static struct clk_regmap s4_vpu_clkc_sel = {
>>>           .data = &(struct clk_regmap_mux_data){
>>>                   .offset = CLKCTRL_VPU_CLKC_CTRL,
>>>                   .mask = 0x1,
>>>                   .shift = 31,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "vpu_clkc_mux",
>>> +               .name = "vpu_clkc_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_hws = s4_vpu_mux_parent_hws,
>>> -               .num_parents = ARRAY_SIZE(s4_vpu_mux_parent_hws),
>>> +               .parent_hws = (const struct clk_hw *[]) {
>>> +                       &s4_vpu_clkc_p0.hw,
>>> +                       &s4_vpu_clkc_p1.hw,
>>> +               },
>>> +               .num_parents = 2,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>>           },
>>>    };
>>
>> [...]
>>
>>
>>>    MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
>>>    MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
>>>
>>> --
>>> 2.47.2
>>>
>>>
>>> _______________________________________________
>>> linux-amlogic mailing list
>>> linux-amlogic@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> --
> Jerome

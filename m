Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021133.outbound.protection.outlook.com [52.101.129.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB5B1F9F7A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583831; cv=fail; b=MbcBJGbGLemeEFMnbtvMlvphv3cPzycROHqPdwkRugYl3nOMt3ww45M3hZj5MbPCEo1YSsFaxQtoISilt8gD1M3oVDD0CWryiKW/7mRP76BMRt2ESYHwgi+SNt1HTXX9G5nDkIVPNqViuI+iaBnGerzDwIYSKQS4QzrU3f0sx+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583831; c=relaxed/simple;
	bh=+4oklEGorPJXSjh28IsUrbZA+pnjOIoAs25tYBMvUGc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BW1eEEJbzduEDXcYhbcpk2wJtbwNr0BZr1UK4ciin7ova8/Wc799iLGAusw3aL63oj8YdVTdQThrKKHwMxToLsSEB2Oqng9uZs3221A0aqPeN0DfdLjbDwfX49swzNNSTWOMvaQTBaOnzN2wgq3mMqPL21PH5feUhnUrqeJh2MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=q6fMSK1n; arc=fail smtp.client-ip=52.101.129.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="q6fMSK1n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bipVs2RPOQaaabYZ9UrP4xk8wEOork2c/1mz7W1UozzZa1mCI7VgAY5WV+ZyaHFxmJlq9yBrk6XVhu2CueswAuuoVhD5ckdm9SOBQ7yXeUO9H8E+PSFmmSYfeGYvaNzJoCIdSnvCodHdP0I6jeZVyI72L/3Q4c3DBWrXpXjvpWYtnWcGJs5XneagGo45nTVWi7f9TsHPSo6hZwmP7X/F7DyLigtYWKSLVDq9chFwIjEEvD3PUIvHgYFixen91oNmCBa1rfCqpPQusaOL1DWOipfYrWYkfQrVoZQrAMK1oDpsRN162bkXKE9cv+DaQoSW0QxfrN7p7Qc9kEVuXFtbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcBw+gCiHAnlJ7vVSeJgkcJfW4DHZBrY0Ky1DCS5BI4=;
 b=Gwf2BYQUW2OYuWN5EzDh5TMf4cBV0KjtEpUCKLk2efTpcSWsTu8yFNr6XF/8dfhDqN41TBtihk8pAAOfJVDDMk+9O11SGGud5dggx+T7cwB7k/QynFmvxjxs6bJcdfcQkL/lx5M48TT5j4ipKw0JevCZUOhs90PSi5ysrAcrgr0gG0Twj4Oiw6oOQmV9KfB22JiJzBSRWTt++fWA9xORGY6wGvRL5F3NEt4eioRCZ9/rRWuZhnZzf3kMpjoxrza/IAFI/8dc7Jr7F9lRDWKDBzYBXclF2hg4hYUXnvqvYO2Y8LPEboaWFJG+CXJACXrsdX7tQMZ0lxAXhnBLknavLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcBw+gCiHAnlJ7vVSeJgkcJfW4DHZBrY0Ky1DCS5BI4=;
 b=q6fMSK1n0kEhRx/qSXMTlCMg24/ZILURu2tA8tUdt8mJxT8JuOLYFjCxReZM5PUl1OVzpBM+dakrDNlargheAQOW6RWtqjrT6GcxgZzONYPI7E5Qbr8r5tC7/2cEeiELan5k5z+IbIeCR0Mwle3/D3UeQLoAlHMiTCyZNFDS5RNE3rBwvlIiOWidk3tagzOAZwZSkjmK22KtFjm2CL18tjlm+sXZbM/SBLFBOeffF2tpw2vVMqqgOtg0hPiNy+8Q2JHl7y7C7FiYDR6U4r3JWheyzCpp/6vKcX3JVB7ghbOGjznsSim4sfknyClFeq1oeuHMmOzQVl11+iQk88+ZDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB7628.apcprd03.prod.outlook.com (2603:1096:101:13d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Wed, 2 Apr
 2025 08:50:20 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%5]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 08:50:19 +0000
Message-ID: <57355917-8191-451e-b297-d5a9c50749d9@amlogic.com>
Date: Wed, 2 Apr 2025 16:50:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize the memory size of
 clk-measure
To: neil.armstrong@linaro.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
 <774d1a84-cc35-418d-9a84-867888b843da@linaro.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <774d1a84-cc35-418d-9a84-867888b843da@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: e46c4f48-55e1-4fe5-ab50-08dd71c365c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDZtY0t1QVA3MFYvY3l3Z29nNSsxZm05K25kUmxtVlA5WENQb29ZR2Vkb24x?=
 =?utf-8?B?Ty92T2lDdWxSaUc3aFc1S1ZUWFlsbTZVdk9Gb2xZUVNWWVhFMjl1MkJTUXo0?=
 =?utf-8?B?Z0hPTEs4YStUdUE0N0JmeC9DV3JxaWx5OGNhL2pMSkdwTXVjUnZSbTRQcXBt?=
 =?utf-8?B?V1BkRU1vUi9SSk13ZWp1Y1g4NTVMNHlNbmJtM3dqcjhldWo3Tyt6VUNTQ1JT?=
 =?utf-8?B?eUxxOE9YVnE3cm5vRDR2bkdJYWg4MEtmUDMyMmg1a2IyVHBicTYwMzBGWC9G?=
 =?utf-8?B?YlVlZXhoL1hTa1o2UjFSNGY1N0dKZTcrMElRTnlHcEYrc0Fpcy9KeHcrY2NC?=
 =?utf-8?B?VEdWVTRNVlJtaDBhZkpjOHJvdm5TZ2lIVlhuTTByUkt0N0dNQ1ROR2pDSjRk?=
 =?utf-8?B?TWF6NGYwK1pHVDhISXcxQldBN0tnTFF1aEJlSEkvS2h4SDBZVlZUSHNrYWpB?=
 =?utf-8?B?Vng4NG1FT3UwcVowdFRmZkJoeGliWC9zWFpJWUpvdlJZZEY1OXZiMWxGTFVP?=
 =?utf-8?B?Nnlqc3J1OFdkKys5VEhlSngwenQxVXZHeWM1bldrVStmY2s0MkF4NkljVDZ1?=
 =?utf-8?B?ZUoyRnVUUnAwSHJqMWkrTEFhY0JwNHZ3KzZuOTVWNElQcmdwWkdiWHk5OVda?=
 =?utf-8?B?MG5MalZqcDZqWlpTRWtENUM0V2VnSmhrSGVwRVVHZDQvS0dwV1RERGI5ZnVO?=
 =?utf-8?B?VlNWeHNnU1g4Z2MycExZTzBqbGtyYTlyMmxLY1VmZzBEeXl1VVQwMUtrMTRU?=
 =?utf-8?B?V1g3YWluYlJsckVGaW1CZXNLMDd2eVhIS3pzaEJMZG1jNzVWaHp2S3Q4UWx4?=
 =?utf-8?B?MlBpV3NROCttbEovYTZEa3FSV1Eyc3ZiZThNeURvZFgyeElWRWFKdlR6QWQy?=
 =?utf-8?B?a0t4WERDbktHZUcxVHN0dmJuQlpRL01PbWxoemlZRnhtRSt0eEdIWW91Rnkv?=
 =?utf-8?B?bGg2ZGhYdEpaaFJtUk5rbWFzQ0dnQzdKT25FM08vcU43eHpPTkdRNkh1ZUp1?=
 =?utf-8?B?U1ZSZmJQLzBmVVFwOW8vMWdFZE9zQmdqVHgvZmtBb3hBNVlUakZjL0lmdEJn?=
 =?utf-8?B?OUJGYTFQeEtqYjdKY3hXWUpiUk5lenZ0QWJ5Zk5QdXE4R3lEeGlhWnZob1E3?=
 =?utf-8?B?KytaNHBIWWdtV1g2TTVVSXIxMUZDRW8zdldNUDl4MjQ4SlUzaVpYWjhBKzJy?=
 =?utf-8?B?d05LekVZclRPa0pHUExDLzMvTmlZL083b3VYTEdObWVwalM5MFkweDNwbnIv?=
 =?utf-8?B?TG1TVEV0dmZtdlB5MWxVb1I5N2M4eHI1czJ0REZrTURJMGZqV0JicDZTOVEw?=
 =?utf-8?B?Vjd6YWNTeEtXNDc5b29YL3VpbG8ybkN3R1VyUUVTRWtmVDBoMThDcDN0aDhZ?=
 =?utf-8?B?K05BbmRabllFaTlHUjg3cnU1d01OVzFRS0s3SkJ5Sis5a1plcnNUQ25ZM3dM?=
 =?utf-8?B?V2tnMWYyaUxXUGhhWHlIM0p0N1VUVFBrbTFEQmYrcllLbEtFbkNtdXptMG5k?=
 =?utf-8?B?djNoZzZRN3UwZmpRa3ZFOXh0MDUyeTVoUTVpY0dBcnFDVkZGOW9VV3R5K0Fp?=
 =?utf-8?B?bnRaOXZ6VVRxYlYyb1JDb3hsVTZiRjdZRWVtbmpKeUdGZ1pPbGh1aWdNOWQz?=
 =?utf-8?B?R1Nqb0hLUDRrbVJPSEZpR2JINWs3Q2FlTWlJcUpleC9nNXdKb2JjK1hmVzNC?=
 =?utf-8?B?VDhyaXN6S0ZkcU1GODdBT2VHSWdCUnZFT0NkbWxOWHlQY2xHRDN3SmwzOUh3?=
 =?utf-8?B?bTkvakt5ODZGRmowb0s5TGhIY3FYUVNjWUVmRW16L3VaVlh0MUpFc2ZtQ0Jx?=
 =?utf-8?B?Q080OVZWWGx1UFBwRXBTMFZtNy9kbTQ3U3g5SkorcDlnTTc4YVVYQTBzTUdW?=
 =?utf-8?B?NFVkbnc3ZkdrTStISmJscitQQmVTbFo3bUpUbXMzS080N1o0bU9SZTdZakkz?=
 =?utf-8?Q?2u8h9Q2x260=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d29kL0FlbGtaKzNRZWhHUXBKUnpyTktmays3MmJTKzg0ZkZpelNhdUZtUEdn?=
 =?utf-8?B?MUkyQTNGbFVJNG1xZlZ2Q3NEMEhnTzJUL3JPUW13am44bkpYV3FUZGxNazVz?=
 =?utf-8?B?STRaR2VYbnJ3aFV4OFcxb1BOOGx4ZG5SMlhyR0UzdTlmNUkwd1cweHZTTzFB?=
 =?utf-8?B?OFJIeDhQRWxjTlFpbjBZVTVlTzYyWVl2V3d3aEdpQTlsWVU0MXlVM0RJbnZM?=
 =?utf-8?B?OVA3Z28zUHJkV0ovR2hxUkZ5bGVPZWpkdjlNUXhORytuUkVvcFRwQ2R0Skp5?=
 =?utf-8?B?RDBvTmxvODZMV0xLZXgreUxRWW9Gci9ZcHI0NzRhb3dGMWR6YWZPbzFsaHVq?=
 =?utf-8?B?M3NOQ0xMUlh2YXAxTDZrdnZZUGExb1RBM2NWK1lXclRackxkZitUaEpNRG0z?=
 =?utf-8?B?UXd1MXBMcFNIdElKR0xlMnV1bVgza3E3b09xdE5JdTduYStZYUwrVkVwRG1s?=
 =?utf-8?B?NEUvNHI5U240Z0RZSllzaXBVRWlobWxTamlnTXk2TTFQQ0tYTkFXZnVLRDdo?=
 =?utf-8?B?dFg1QjhObnRlVVpwNldncitOdXlPRkhYQzhBcXhMaXpVYzN2cFpNbzcvelpo?=
 =?utf-8?B?N0ZPMU9NTXh4ci94OGdRTm1oU3dDNGozQ1dKZWJGV2picmozTXJPSFV0ZEts?=
 =?utf-8?B?VGVNS1Nkcjc2S3ZwTkU1YnVYSXAvWGNQSmdoY3hsSzdLRUhiNkJ5em1oNmxW?=
 =?utf-8?B?emNMMHMwd3k5aDd0SmRaYTcxOUxyLzNtaVc4cHVtczVnV1k4Q25rOTZIaXNa?=
 =?utf-8?B?WHF6TDFwbWxBa093TnF3dmFCWTR3S09EekpoRGlNY3F4dktpaVlJUm0xYmRw?=
 =?utf-8?B?MGlmd2RyOEgwYklRZDlqZVgxRnVpWFZpMnh3cStWc1lvOXNWa01UUGEvTnVk?=
 =?utf-8?B?djJrRlpIMUhMcFRrbWpaOUdReEVxTkdySlpRUURneEtmOWtiZ0Z6aUFTdExh?=
 =?utf-8?B?ekRUTnJ2OEg3VkpqMlRYUkh1ZzdlMUx2RWxtUWpBNWxJMk1yM0FSVWM2eVZU?=
 =?utf-8?B?QU41TzZkUFhnYjhJZ1EwOEJ5T09TYWJKdVI3WTB1YlA1QkJWelJBY2owVG43?=
 =?utf-8?B?ZEx4MEFKWjhnOU5lNy92Y0s5M0k0bWhQeVJhTWw0THp4WXZGdW81QUo1bnl5?=
 =?utf-8?B?SFhubXdQc1ZwWkZZUTkrcm8vcjQzdmlQUDlUaWFyUzd0ODUrcmxxT1h6L1Zo?=
 =?utf-8?B?ZUlDU2M0aWJ3ZFl4d09jQkxJRlhxVUJ1NU1SRFhIc2dvZ2VPTytPcEdTVWNq?=
 =?utf-8?B?U0dVelFUZlpnZ0lVWUFuM2JjQ0pyM2RWRW5XVzgrSEwzSVpva2tJNC8wQkpF?=
 =?utf-8?B?dVFkVUFXcEt5MXZDanEzMm9kUit6TExpKzlQb01KdWliblV6c29pbGE2aWp0?=
 =?utf-8?B?d25nVkYxMDgybTVFV285MGJpc0dIZHMzaTZEUUd6RG5TUTNLT2t4S0NWQmtl?=
 =?utf-8?B?K2ZiQklrbTVJd05XTkZuNFhGTEZtcjhPd3dpbXIwNkpnMmtPd0cySGduVXEy?=
 =?utf-8?B?WVdUYTlmdk9GOGhHYlJkSjRqQkxqaVhZcmd5T0V1am8wVFI1NklTbHh6MURZ?=
 =?utf-8?B?anVKN1NUSHg4bUZ5VDhuTzBrRW11dnZKQjAzRlgzSVhjMmhTb2xibmhOU2s0?=
 =?utf-8?B?M1BYSUJneitEclFuWkJteEdSWGJQQWN5YTJEVkFjRDFBVHNmYkdXdTdXczZV?=
 =?utf-8?B?WjY0c1ZuMjJoSnFNYkxjL2NiaG9XeGpRVk9wRjM5anl2VTFvTHQ4NTRnNWlQ?=
 =?utf-8?B?NTlxU0wwMnk4U1VVRlA3UWdwK1N0MXdJTXIzTnFLc0t4eXQzR3prcm4rMThz?=
 =?utf-8?B?UTJWQU8rTU90cGkwdzJVR3p0ZWZZTTUyS0czRkRSZkhHSkJhZHdDUjcyYzYv?=
 =?utf-8?B?OFZ6aWEyRlVCSmpGTXBBNnVWSkNGb3BPbmhOa1owQzdBaTFxcUdGOHZUU2Mv?=
 =?utf-8?B?TlBEd3dwazNmS1hjWEVQSjVlRlhnRWUvTG9EUElxOS9JelNRQlEwQ3cyc2Uy?=
 =?utf-8?B?dkVEeGJiMGFtU3haM2laNHJvRlJCWE41MWNPSUZObTdxcmdGUWtrdjF2VFYz?=
 =?utf-8?B?Y2NtZ3VnejBMZzQ0UE4zZE9udTk2MzBuR1NnQ2dqNzZsc0RkZmRCNjFETmpG?=
 =?utf-8?Q?+0SXk3OjDLOYK8QdIb/6puR7f?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e46c4f48-55e1-4fe5-ab50-08dd71c365c3
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 08:50:19.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwzQWp0KFR1aDeKEY4LKP3UaVTq2OawYqBJJKFrDSMbUGI6uuiTBEIEYhhP6cojVDL+p6yVZpktuNGqmTdA7Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7628

hi Neil:

Friendly ping: This patch has been approved in review but hasn't been 
applied yet. Has it been overlooked?😉


On 2/10/2025 5:50 PM, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
>
> On 05/02/2025 08:58, Chuan Liu via B4 Relay wrote:
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Drop "CLK_MSR_MAX" and replace it with adding a member "msr_count" in
>> the structure to specify the count of msr_id.
>>
>> Mark the table of msr_id as const.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>> The number of msr_ids for each chip is inconsistent. Defining a
>> fixed-size array for each chip to store msr_ids would waste memory.
>> ---
>> Changes in v2:
>> - Discard the global variable and restore the "priv" member in the
>> "struct meson_msr_id".
>> - Mark msr_id_table as const.
>> - Link to v1: 
>> https://lore.kernel.org/r/20250123-optimize_memory_size_of_clk_measure-v1-1-06aa6a01ff37@amlogic.com
>> ---
>>   drivers/soc/amlogic/meson-clk-measure.c | 86 
>> ++++++++++++++++++++++++---------
>>   1 file changed, 62 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c 
>> b/drivers/soc/amlogic/meson-clk-measure.c
>> index a6453ffeb753..39638d6a593c 100644
>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>> @@ -33,23 +33,26 @@ static DEFINE_MUTEX(measure_lock);
>>   #define DIV_STEP            32
>>   #define DIV_MAX                     640
>>
>> -#define CLK_MSR_MAX          128
>> -
>>   struct meson_msr_id {
>>       struct meson_msr *priv;
>>       unsigned int id;
>>       const char *name;
>>   };
>>
>> +struct meson_msr_data {
>> +     struct meson_msr_id *msr_table;
>> +     unsigned int msr_count;
>> +};
>> +
>>   struct meson_msr {
>>       struct regmap *regmap;
>> -     struct meson_msr_id msr_table[CLK_MSR_MAX];
>> +     struct meson_msr_data data;
>>   };
>>
>>   #define CLK_MSR_ID(__id, __name) \
>>       [__id] = {.id = __id, .name = __name,}
>>
>> -static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
>> +static const struct meson_msr_id clk_msr_m8[] = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee2"),
>> @@ -98,7 +101,7 @@ static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] 
>> = {
>>       CLK_MSR_ID(63, "mipi_csi_cfg"),
>>   };
>>
>> -static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
>> +static const struct meson_msr_id clk_msr_gx[] = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>> @@ -168,7 +171,7 @@ static struct meson_msr_id 
>> clk_msr_gx[CLK_MSR_MAX] = {
>>       CLK_MSR_ID(82, "ge2d"),
>>   };
>>
>> -static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
>> +static const struct meson_msr_id clk_msr_axg[] = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>> @@ -242,7 +245,7 @@ static struct meson_msr_id 
>> clk_msr_axg[CLK_MSR_MAX] = {
>>       CLK_MSR_ID(109, "audio_locker_in"),
>>   };
>>
>> -static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
>> +static const struct meson_msr_id clk_msr_g12a[] = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>> @@ -358,7 +361,7 @@ static struct meson_msr_id 
>> clk_msr_g12a[CLK_MSR_MAX] = {
>>       CLK_MSR_ID(122, "audio_pdm_dclk"),
>>   };
>>
>> -static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
>> +static const struct meson_msr_id clk_msr_sm1[] = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>> @@ -489,7 +492,7 @@ static struct meson_msr_id 
>> clk_msr_sm1[CLK_MSR_MAX] = {
>>   };
>>
>>   static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>> -                            unsigned int duration)
>> +                         unsigned int duration)
>>   {
>>       struct meson_msr *priv = clk_msr_id->priv;
>>       unsigned int val;
>> @@ -573,13 +576,14 @@ DEFINE_SHOW_ATTRIBUTE(clk_msr);
>>   static int clk_msr_summary_show(struct seq_file *s, void *data)
>>   {
>>       struct meson_msr_id *msr_table = s->private;
>> +     unsigned int msr_count = msr_table->priv->data.msr_count;
>>       unsigned int precision = 0;
>>       int val, i;
>>
>>       seq_puts(s, "  clock                     rate precision\n");
>>       seq_puts(s, "---------------------------------------------\n");
>>
>> -     for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
>> +     for (i = 0 ; i < msr_count ; ++i) {
>>               if (!msr_table[i].name)
>>                       continue;
>>
>> @@ -604,7 +608,7 @@ static const struct regmap_config 
>> meson_clk_msr_regmap_config = {
>>
>>   static int meson_msr_probe(struct platform_device *pdev)
>>   {
>> -     const struct meson_msr_id *match_data;
>> +     const struct meson_msr_data *match_data;
>>       struct meson_msr *priv;
>>       struct dentry *root, *clks;
>>       void __iomem *base;
>> @@ -621,7 +625,16 @@ static int meson_msr_probe(struct 
>> platform_device *pdev)
>>               return -ENODEV;
>>       }
>>
>> -     memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
>> +     priv->data.msr_table = devm_kcalloc(&pdev->dev,
>> + match_data->msr_count,
>> +                                         sizeof(struct meson_msr_id),
>> +                                         GFP_KERNEL);
>> +     if (!priv->data.msr_table)
>> +             return -ENOMEM;
>> +
>> +     memcpy(priv->data.msr_table, match_data->msr_table,
>> +            match_data->msr_count * sizeof(struct meson_msr_id));
>> +     priv->data.msr_count = match_data->msr_count;
>>
>>       base = devm_platform_ioremap_resource(pdev, 0);
>>       if (IS_ERR(base))
>> @@ -636,45 +649,70 @@ static int meson_msr_probe(struct 
>> platform_device *pdev)
>>       clks = debugfs_create_dir("clks", root);
>>
>>       debugfs_create_file("measure_summary", 0444, root,
>> -                         priv->msr_table, &clk_msr_summary_fops);
>> +                         priv->data.msr_table, &clk_msr_summary_fops);
>>
>> -     for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
>> -             if (!priv->msr_table[i].name)
>> +     for (i = 0 ; i < priv->data.msr_count ; ++i) {
>> +             if (!priv->data.msr_table[i].name)
>>                       continue;
>>
>> -             priv->msr_table[i].priv = priv;
>> +             priv->data.msr_table[i].priv = priv;
>>
>> -             debugfs_create_file(priv->msr_table[i].name, 0444, clks,
>> -                                 &priv->msr_table[i], &clk_msr_fops);
>> + debugfs_create_file(priv->data.msr_table[i].name, 0444, clks,
>> + &priv->data.msr_table[i], &clk_msr_fops);
>>       }
>>
>>       return 0;
>>   }
>>
>> +static const struct meson_msr_data clk_msr_gx_data = {
>> +     .msr_table = (void *)clk_msr_gx,
>> +     .msr_count = ARRAY_SIZE(clk_msr_gx),
>> +};
>> +
>> +static const struct meson_msr_data clk_msr_m8_data = {
>> +     .msr_table = (void *)clk_msr_m8,
>> +     .msr_count = ARRAY_SIZE(clk_msr_m8),
>> +};
>> +
>> +static const struct meson_msr_data clk_msr_axg_data = {
>> +     .msr_table = (void *)clk_msr_axg,
>> +     .msr_count = ARRAY_SIZE(clk_msr_axg),
>> +};
>> +
>> +static const struct meson_msr_data clk_msr_g12a_data = {
>> +     .msr_table = (void *)clk_msr_g12a,
>> +     .msr_count = ARRAY_SIZE(clk_msr_g12a),
>> +};
>> +
>> +static const struct meson_msr_data clk_msr_sm1_data = {
>> +     .msr_table = (void *)clk_msr_sm1,
>> +     .msr_count = ARRAY_SIZE(clk_msr_sm1),
>> +};
>> +
>>   static const struct of_device_id meson_msr_match_table[] = {
>>       {
>>               .compatible = "amlogic,meson-gx-clk-measure",
>> -             .data = (void *)clk_msr_gx,
>> +             .data = &clk_msr_gx_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson8-clk-measure",
>> -             .data = (void *)clk_msr_m8,
>> +             .data = &clk_msr_m8_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson8b-clk-measure",
>> -             .data = (void *)clk_msr_m8,
>> +             .data = &clk_msr_m8_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson-axg-clk-measure",
>> -             .data = (void *)clk_msr_axg,
>> +             .data = &clk_msr_axg_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson-g12a-clk-measure",
>> -             .data = (void *)clk_msr_g12a,
>> +             .data = &clk_msr_g12a_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson-sm1-clk-measure",
>> -             .data = (void *)clk_msr_sm1,
>> +             .data = &clk_msr_sm1_data,
>>       },
>>       { /* sentinel */ }
>>   };
>>
>> ---
>> base-commit: 1e1fd26ed4ca05cc1f0e5857918da4dd54967f7d
>> change-id: 20250123-optimize_memory_size_of_clk_measure-f9c40e815794
>>
>> Best regards,
>
> Looks fine, thanks !!!
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

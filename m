Received: from CY4PR02CU008.outbound.protection.outlook.com (mail-westcentralusazon11011023.outbound.protection.outlook.com [40.93.199.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E11F1AF0C9;
	Thu, 22 May 2025 10:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.199.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910018; cv=fail; b=RfJ+9vWy9s49earIHFOHTlOU/3F6i7tEgwXPpPmF56oa16E2Dtkmili0/bWzgswBy7edgH9/mafoVVNg4V5om4xzwJ0hNSxANpuFjzL+q9eq5G9YHG1Hk/ClxgkftkqfeG3BI1QvHHKYVmovjjXUL40Fe/oTPPtBfk8L0sf1Poo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910018; c=relaxed/simple;
	bh=uaUuedB7ikl40h9vnHkc8qRCd64cM6TS+lVByok4WQQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DvvArnjI3UN3jyJoMS3jLkCA0A45zVdoTeQcP+JIHrT9guhtYUC9L0qdoX0KlbSIylE08FDrViQ0sDmGxYAXgBam2POVQBJWZHlz7rI3nsaElynHc9BwYT3CPH7XFTWnxV1YMTIGysdhweKIR+9ArNumbPc12goXC4mfKB/KT44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=oEfjD3/m; arc=fail smtp.client-ip=40.93.199.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="oEfjD3/m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIsrYM9EtPXDFTCMOmg1sD5j19b/0ylrJaBznCy2/NqxEZSFMvCDUThyNYaL8Wn5BVEJIYcnpczDHV9c/dsuViExj38cSucRdu7vGRdCXBly31AUKpms0f46aNr7mrS64trR3VpYJO6Z3PRDfbovOCnk+emRZP0IoVlRYqCIllkJXVRhIbwJZJQOp9tqZVwR3mIbZqbTzDa5V88lVcedxYviqxq454BkDYXv9Q/QlcsDFoAsKhTSxi61fap8KiBuvx2GerSZCn3MOwk5xTRKOqMw88m23w9+sDdcEuAuuqS0EVoSM9uJN+O9koU4uh7fR7UgHq5uhYbtUmUS4rMq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5eW8S9eno3RE1aCNgV9sFcOgARpGhCgI73Fr3dmyvk=;
 b=vMVCum0PPBe6rBQfZFQfc8vb+mNeK+bz4ssxHlfUzeb/a2DnaipQ5qY4+G3BHBg4o2A1fRxboeh/9014dEkjNT4EyRNm9X4sz4i3FYJh2vvng/V9pot3UOJBFSAL2bmTwV8kJYGFzjkOuhtNx9OUtOhZYrpbLweubYz30hDu2YGxIt9uaRwY/fRdYWkssmV3KC9R0YscOVAxm96WulAArI3Rxam4JTO/tmJHlXTARjpyrtmI0afsJ4IgO8TfsvvkFmg/doK1c0cEfkBbEdWbvYR8oKSaPJR+hF0Hj6lm+XvLfCNhYrvhRlySPd1r+zWBjGFWevJO0r0eRnWzryOrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5eW8S9eno3RE1aCNgV9sFcOgARpGhCgI73Fr3dmyvk=;
 b=oEfjD3/mt5GGyV6VXNioMgGTCS/RL/nOoB5Uuxn+8K6Xl2aVsK7a28EZXK54+DOqEDK3qHjHJQHeN7c7Xe5yAPluT/2d5B8VultcBO50eIjSZ6qEDTLoy6kDuDjosyMsa/JlGB+zfjMMsW0ej6p8m+kM1ktd/G/qZXOLEnd/sevmVSSeuq3eRb3WLoGz+r2xGuIiQSGkje+oQzU0gna70eVy90RpUtsMMtQ4cjIHrENVOTFEhjmoFwXSmiC2IzxyZVWwULW9yGDA5i3TPyZkaelKxMI4dS11aIz1poTJMOsPcU8lEYT6aZV3i5RttNKtytljx3OnhdW+6AQ1KQ1fwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by MW4PR03MB6457.namprd03.prod.outlook.com (2603:10b6:303:120::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 10:33:32 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 10:33:30 +0000
Message-ID: <ea381d6e-3554-429b-87ae-74451c72d4a2@altera.com>
Date: Thu, 22 May 2025 16:03:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix 10 service channel
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
 <20250512-sip_svc_upstream-v2-3-fae5c45c059d@altera.com>
 <b92f2ad2-7cca-455d-af45-cfd418bf54bc@kernel.org>
 <0eab3179-645c-41e8-8d21-111b11ba5c6d@altera.com>
 <40b939d6-9339-444f-a2e4-3e4cd4bcb317@kernel.org>
Content-Language: en-US
From: Mahesh Rao <mahesh.rao@altera.com>
In-Reply-To: <40b939d6-9339-444f-a2e4-3e4cd4bcb317@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To BN9PR03MB6201.namprd03.prod.outlook.com
 (2603:10b6:408:11e::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_|MW4PR03MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b13bc83-3e13-4ae2-b44d-08dd991c185f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjhzNGFORnRFZXhCbEwrVHVFTXNyUU9xeHd4a1V3UjFVT1k1K3hSUXNMVGtw?=
 =?utf-8?B?djNGdHVDSXRoaExWVERxVkptNGUxaWRpTThLWnFHdmd0b3pmK3BnTW8vUFhn?=
 =?utf-8?B?TCsyVU05UlN6alpjVWFpbExZZDl5US92SUlHNkhjbGxqeUpvRjNEcWxTVDdU?=
 =?utf-8?B?WUU2ekhPYk5pNDZod280WkRZV1Z6Y1BXdmgzVlF0ZTlyMEwzaUFSWTdneUIz?=
 =?utf-8?B?aVdIYkNKbDZoUHdQU2liakhOMEVnTDlZdEZDNHpoRExrV0lVV3EvRENnbW5s?=
 =?utf-8?B?bFpMRnF1RzgvU2tEamNrck5UcmxiMVBGT3FrNjZWSWt3dTF3Uzh0WFFmVWla?=
 =?utf-8?B?OWVvaS9HZ2JxTGJTQ25Na0g5NG5PKzl6NHptMzdWOXNiWFBtcHlNSm1vbmlp?=
 =?utf-8?B?WXNHU0ZWRENmV0RBWGlZcGhjVFM1bjgrTHJDWHJpMVFNSWYwT292SFdONDhZ?=
 =?utf-8?B?Ti9MeHhHZGxhN1RoaER0cEFZL1FTY2FYdDVFbWUxdDlXeUlRdjZHNzFZV2Fh?=
 =?utf-8?B?eEdsdGVNTTdlelRWRHNzM2o3dWFGd1FwOW1lQWp4TVVLdUVpeFp2dEZxMDJN?=
 =?utf-8?B?Tnd4ankrcU8vd3ZQZEg5ekptaFNCd3ZWRzlscElTdWU5OFpxeWRSZ003Y1NS?=
 =?utf-8?B?UUpIMHpDYTRpVnlwSFdQZkdqRkUraThrUWtmREpYdWFJZG9IRHRkSTZkeU91?=
 =?utf-8?B?SCtYTC9OQ0F3dUpYbUtoaXVaeUNpZHgyZ1BVSUhaRUhaVFRBK2E3V1prOEdF?=
 =?utf-8?B?OU94WXFlcGFTYm9Pck81cTlxTnJiakNsVFNacHhGZ2lIMEtSQ1MzbU42cVk4?=
 =?utf-8?B?dlMrR2dGS2dnTFZnZXFhQ2ZIUWY4S1JDVnB5N0QyU3Q0amlVOEkyVHNMLzht?=
 =?utf-8?B?ajZybkJEN0FJOXJ6MUFHN1dLYzRLUitpZGNJd1FPdU5VOU9rR3BjWnN0S3lw?=
 =?utf-8?B?Z3FjNUpORGU0dzJEaDZFTlZhalVxNGtUbjRneVgyeXh6NWdtVTZMNC82Q21F?=
 =?utf-8?B?NFlUTGJOUStadDZadmtVdGpTQnVqM2kyaS95c21zQ0htYUJlVjdQT0ZZK3Fa?=
 =?utf-8?B?WlVDVng0aG16aHhhRmhqMkNKbERCZld1azVTTHhudzhPYnFpa2NKZzBHVWVM?=
 =?utf-8?B?V1J1L3ZXbGt4a3ZFMVBWTHVMZ1JZRk9Fb1BJdkVyZFA4SXQ2dGRlZWptWHNn?=
 =?utf-8?B?YUVrOHVBbm1IYm5BYTh4d0JjK3hZUVJWbDZ0RWJlczBFU2ZJdHAvZFp2VkNr?=
 =?utf-8?B?WnVJU21aNnBTMlRHMmgyaUxDVUJEM0tHQkt1c0VCMnU0L0d1NnlYM0RHU3NN?=
 =?utf-8?B?M2tYMUdNWjV2QjFiYklkUUY1b2lGK1UyaHdPd2I3eS9VcUxJenNLd2RpZzh5?=
 =?utf-8?B?Wk1yODZ6WHhqY1Nmdnh6bzBOZFFVaTFjcDVSYlk0WGUycWRoSm1kYmZWZUlF?=
 =?utf-8?B?VVY4c0VBeW1pTkh0cGVsL25UMnBMMHBDQzd5azZyRjlkaWtaVTVNL0ZCMHBT?=
 =?utf-8?B?MmNmRittTW12SmZBZHFJM0JEZ0E4U2d5azRyL2NQR1RuZU9nT3ZzQUxlUzgz?=
 =?utf-8?B?UC9mNWdtb1QvSG1uWjBzTFN6enVleFR1SDF5alZVdGRXOGM4QVlicEIvdVY1?=
 =?utf-8?B?Qloyd3g5bGNvVGZvejB4N3FwN0tpQzBERW5uZEs4dUdNcVJWbkJFUWJ6TE9s?=
 =?utf-8?B?SWFXa2ZBTFNVdWFUOTVKRDVrL2lycldNNWFvbWw0VWl3UmE0Q3pXOS9FRjlw?=
 =?utf-8?B?SWdRcGM5UTNpZGVEMUNtejFpZ1JkT3RLQVRrcHVDQUttUm5OTkxidFNka1ls?=
 =?utf-8?B?YlNLckpmQ05DU1U3Vmg5STFoQ3hvNXg2M2hyb2duRVA5NE5HY2NIQVJyMW9P?=
 =?utf-8?B?cDRRWERkREFCeXYrOFJKdUg4WmJzVXoyM2hUa2FWdUZwN05qL3FtcWxabTgy?=
 =?utf-8?Q?V5NuI/m0c4M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFRXZ3JyVHAyQVhOaGxvRkFIQTFYR2dyZTMzSGs1bmFtYWV2T2Z1Y1g2eHpN?=
 =?utf-8?B?YzJaYmVVcDUwSjhDSmU1Y3JyZ3NFa2w3d0x6bjY2VllnSFRLNk9vQUdMUFFI?=
 =?utf-8?B?RzFVNkpzTCt1RlhXelpVK3psVFQ3NWRXaEpiOHE0K2RGR2ZoMm9HZlBqYlJh?=
 =?utf-8?B?ZXo2U3I3OHdOV0p3b2VDb2tRZ0N6QXlSaE9KbkFHQ3UzRzh0K212KzJvL0ZH?=
 =?utf-8?B?dkJ6c3VlSm1vU3Y3SnRubkd5ajFxZnlnNnZRbHBSSm1mL2NWYjlSRFBzTW5J?=
 =?utf-8?B?enViTDFzejE1SXV3U0JVeTdnZmhkMElWaG16UTd4OEwyQVlMUHNzZ0NQNWVL?=
 =?utf-8?B?UG1qMi9kcTV6V0ttZWRaZXJLb2FtS2dmSnRtNDN2blpsTjljSDR3RFdZN0Fk?=
 =?utf-8?B?V0hHYWVUMVV0TEdaZ1NPNmV4bE9PTiszNDlrem82cW8rY3lYMnNFWDI4SkR2?=
 =?utf-8?B?eENPZmNaSTRWZ0pKSjRSL0Z4L2VCemozY2ZZSzg0Z3RtblRsa2NpYSt6QXBw?=
 =?utf-8?B?eC83UmZZQjd5eG1qZEpQUjRPR01SQit4UFZWdWI2OEIvSVhLWUNzTnBVaXpC?=
 =?utf-8?B?ZUEyZjdRMlhDUWZvU0VMVzlOb1VyRGE3d0NxZnpRV0RBTnE4YUpaVVd0d1Bt?=
 =?utf-8?B?SGF0ZEJNOWNXTWJSY0JJcFc3aW1kNmxyZTFsSVd3bXlnVmpqbkh5RVBiRHZw?=
 =?utf-8?B?UWtoOVVValArOU40WTJrN3dPT3R0ZnBySUZYYkViYlk0RWhqM1RRYjVML2ti?=
 =?utf-8?B?VnNraG5DeG9sK3BlL3dyZVU1VXp1aS9PUHIzVm0wM1FOZTlBMTQyS0xwK3RY?=
 =?utf-8?B?MEJaRTdITnp4MEZQRGlKenJROVBoSTJNVmFZY05jdlpNVVNpV0V5VkRKTjNq?=
 =?utf-8?B?cHRwT0ptZGd3QnBsV3lOZVU2eTRsYmhnTktDZHF1c3BnUnNUNGxaZm5TM3pI?=
 =?utf-8?B?VkR5emMzR2huS1NkY09WYisyZFpaOTV2ZVlxM0FvZTE5ZDFwV3h6SU01VnVQ?=
 =?utf-8?B?UFZkSENFRjRySlBsZWEwMnJNaDk1VVB2Qy9oRGRwazJQU0R5U3FOaTZVbFZJ?=
 =?utf-8?B?WGVCR2FzVjM3Q096K2N3T3ZPcm0wQ3lHUFl3ZVUrQ2hWYllEeStFa1ZzY3lt?=
 =?utf-8?B?YUlIcEtqZ0ZzdE5LbEtZcUpVVjJBcXg4ZmdOOWFXTjcrY1FFTkpsb2t4Q1Uz?=
 =?utf-8?B?cWtoNU9hbmY1WGs2TVpuTGx4aU1TZnVvc3BMQzJYOU9iWE01VVFaVk1VcEJy?=
 =?utf-8?B?bTNhT0ZQMDFsRkhWeWFPaHp6M0lBTUFCd0JBQjBKUlRUaDc5SzlSRDlHazdT?=
 =?utf-8?B?ZUVpWkp0S0krWUQ1U0Ixek51ckd3UUFWY0Y4MWc2RnArVVpyMGJPYVhCejhn?=
 =?utf-8?B?U2dEVE5FZFI0Sml5dkpUNThVWVNjQjU3YjZmaXhNMnJ0ckFVRWxIdFhQTjB3?=
 =?utf-8?B?eGorSXF3dVJudUR4Q05meWcxOWpJbDVrWWJoZThYZTVLbFIreUI0RHJDOTYz?=
 =?utf-8?B?eXJRV0VzUmhiZ0xRVU82V1RXejVIYWR4WTJvNjhlSCtWNE9OUERqUDYxWUtV?=
 =?utf-8?B?ZWRwQ2w5Rm9JL0hGNGNoSVVQZWFnR2NlOVl2am9EQlRrWGU4cWxCL1FVVFdh?=
 =?utf-8?B?Q0gxRHpraS9lV0lZbVJIQnhwTXMrcEIzbncvT3VkU2VTYzZQUzBERE5yM0lo?=
 =?utf-8?B?MHlpUzlUaUxJUTdoaEpRMndTUmV2blJNNTYraXFpVlBGQ0QyMWZ6WjFFQ1BY?=
 =?utf-8?B?NCtjcFdwR2pGVVRwVjhna2c2ZGhOQjhBNmszNW9TYlBleDdFRmEzTFh5cU13?=
 =?utf-8?B?T1FWK3dGc2FydEhBci9OdnJqcnc3TFZGbXNpdm8wYUxLa29WaUozdWkzSnha?=
 =?utf-8?B?YjgyeDB3VkdJQmgxdVl3Y3lhaHA2cE9qc1BmcjB4UXB1NFFlU09kSnhBdk84?=
 =?utf-8?B?cWdyNVc1Z0VscVlYYUd2WkxKQVRHODhlMmk1SDc5M0lXVTJ2Z2RGVXA3b1NN?=
 =?utf-8?B?b3F1dHFVQzczMVFDWUtXMG40M2llMGlkaHQyNHdHMzZPZ1JtYmNJbXVISW85?=
 =?utf-8?B?OXhXaHlxNVM3OWNHWHRmYjlhSm1Fbzg3ekpZTDRYa1RTWGFyU0Y2UWJPOCt6?=
 =?utf-8?B?RFExOUtnYTAyT0pmWjdvQkhuT2FMTklVdFRyc096YzZDNUxYRWwxRWNQd1V5?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b13bc83-3e13-4ae2-b44d-08dd991c185f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:33:30.7305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gg0FBnTBUbUnz0tgoI+jWDoEJnGsyV+G72mw/ZFrOdAoSD7UMPJBPnXG+3q/1BMwXKcROpLyNP3l5tvVd8Pzhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6457



On 22-05-2025 01:48 am, Dinh Nguyen wrote:
> On 5/21/25 03:42, Mahesh Rao wrote:
>>
>>
>> On 19-05-2025 05:28 pm, Dinh Nguyen wrote:
>>> On 5/12/25 06:39, Mahesh Rao via B4 Relay wrote:
>>>> From: Mahesh Rao <mahesh.rao@altera.com>
>>>>
> 
> <snip>
> 
>>>> +
>>>> +/**
>>>> + * stratix10_svc_async_prepare_response - Prepare the response data 
>>>> for an asynchronous transaction.
>>>> + * @chan: Pointer to the service channel structure.
>>>> + * @handle: Pointer to the asynchronous handler structure.
>>>> + * @data: Pointer to the callback data structure.
>>>> + *
>>>> + * This function prepares the response data for an asynchronous 
>>>> transaction. It
>>>> + * extracts the response data from the SMC response structure and 
>>>> stores it in
>>>> + * the callback data structure. The function also logs the 
>>>> completion of the
>>>> + * asynchronous transaction.
>>>> + *
>>>> + * Return: 0 on success, -ENOENT if the command is invalid
>>>> + */
>>>> +static int stratix10_svc_async_prepare_response(struct 
>>>> stratix10_svc_chan *chan,
>>>> +                        struct stratix10_svc_async_handler *handle,
>>>> +                        struct stratix10_svc_cb_data *data)
>>>> +{
>>>> +    struct stratix10_svc_client_msg *p_msg =
>>>> +        (struct stratix10_svc_client_msg *)handle->msg;
>>>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>>>> +
>>>> +    data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
>>>> +
>>>> +    switch (p_msg->command) {
>>>> +    default:
>>>> +        dev_alert(ctrl->dev, "Invalid command\n ,%d", p_msg->command);
>>>> +        return -ENOENT;
>>>> +    }
>>>
>>> What is the above code doing?
>>
>> This function prepares the response  for clients after retriving the 
>> response from the Arm Trusted Firmware using the polling call. 
>> Currently only the negative scenario is shown for incvalid command, 
>> the last patch in series adds command for hwmon for the positive 
>> scenario.
>>
> 
> Okay, but this is confusing. Please just add this to the last patch then.
> 

Shall I combine the last patch for adding hwmon commands here so that 
the framework has some command usage?.





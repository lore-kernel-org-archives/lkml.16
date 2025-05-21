Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6276236A7C;
	Wed, 21 May 2025 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816943; cv=fail; b=UmriBmZEjVinUB5q+Mc9+kzvgSa9shhzi4gnUpdZj29Api40FdtstpL4rVuvyX9hkq3L5Jtdwdj1H1PKUjYJRkWq7BhggLcNo79DI3uH/L/S/8iRM/M385Td0X9DgAdshLk7MfNrlxaeUtUppVfsaHM/A9Ip5rng6JsIeZtsCrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816943; c=relaxed/simple;
	bh=9FZvHNe980jglruC1QcoFZB+Vu0Vv3xw+mikrmsgdNo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lvYdZmEpl9argxLHr4mNVdBzF5/pIyEMWITxxN5+gljMejjfXlEnJhdWY36Vw/ZLEOJFiOYfO6/+CTmrJjv8tZLm069tr/OUdCMXAtsxavgFTuUSuEDOEzCdz8wYOCyMZqjx1l+TjIpVXx5hCXLRWCgnwIrkpTEBVNphgKIdOy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=iqdPfulC; arc=fail smtp.client-ip=52.101.85.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="iqdPfulC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NilM6sMY/DlJTRpLD3H7we2/wk2gvBVlC3SzWmNHinpRfwDMEH1Mfa5edvFvmdJPPzeZW0sHzFn2NCIXpECJsyUlPBSq/lzDycCXl2jTsY0k6DGKNThd9jC5tfzUYmwyKcwFD/ON8AfCn8KSZQCNyoUrWVsTVhEwba9VepVTRxJqQf73e2Qp+9lQeWfxcc5/rnXMmasUpHmrZQdMYQyTxI305Yokeg39xGaqIGzCGlvgmQc5qh054ANePxJW8hLk3DukqE+g+FYV06h7WBM7o9e2bSoIbEQ9XMm74iaHiBmCZ3dyLDux/2DhSVOoxfu+qEuAZaxzGmzcbY4jqCo0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xqjh3RfRuTUBb/y1U7wWXoeaw80l4a15Sx0URz5CP4=;
 b=n0M2BPsbFq5oY7qjV1+B2Cxw71QaEMl1TqfgtBCx3I9VHRl/Vl4sLDGAC7BUFPCOWV2hLyMl3OYPFax5STOFa5sM/YpWoHDIvYysCi37oTujv9k4XhDpcjbA2wE2K4/6klV8JTHuVLvgnEFQGtZIu+AZmSVSFbc9+/gYtUPmW4RjvL5CLHl3A5Px6Yq8oxqBRJFSH7gnxaaGWI+0933G+aK/sCcGpaQvfiQoPXEoY+MmHAMC1ZXepJxz9F6ev+tSM4JsIBtc/GkPsdUq1ZI/h+7CmHAb6Omkhxoyc/LNupL7zaNzjgom60svKG4M/p8+DF+i9jb9Zawc0h95Q+Fh/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xqjh3RfRuTUBb/y1U7wWXoeaw80l4a15Sx0URz5CP4=;
 b=iqdPfulCFFnX+rXXR/VAKo1grBivyQUqK0iTXadpTQmTqgIyCtfVEHNgpmcjQxNbP0aOqkKlKvR2neojoGJiAnKnC68FT5o0gAiUQvhHQ/OpQOgVbZIqEg6bVzDuEg3Xv4WjRb47LI9qM6br76PO1347WXHOs/Dazn8Fo6SF79iOPEO+W5tZzZmQcbW3COQNUFhgymADJvXvKNH9HZNr9O0nPbG7MY+sA+Wbfuy+uCAJZhgJ7b9wKNbb/yXtEUjldqqG28a3uN20S7xtZtOewXGJnRe3E1GIZeVYMH1rmJq9UxFmexzocWmXMkCkLOET+rAQQtcXluCT+hl546F5ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 08:42:18 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 08:42:18 +0000
Message-ID: <0eab3179-645c-41e8-8d21-111b11ba5c6d@altera.com>
Date: Wed, 21 May 2025 14:12:10 +0530
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
Content-Language: en-US
From: Mahesh Rao <mahesh.rao@altera.com>
In-Reply-To: <b92f2ad2-7cca-455d-af45-cfd418bf54bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To BN9PR03MB6201.namprd03.prod.outlook.com
 (2603:10b6:408:11e::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 810f8823-3281-478c-736d-08dd984364bb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEl4NE55M0xxUHhqTnFHKzh2ZUQ1QVIvQUtrTVlYZHFCU3g0dThpaEk0dTIw?=
 =?utf-8?B?eXlCd2loYlFibjY2Y3U1UHBlenlzbXRyU0NVaVJEdFY4ZURNdmlHaVE4Qm9q?=
 =?utf-8?B?YmRYUlhmUlZUai9HSlllUjNWaklkRk5nYTkzMWNaZzBDbW1kM1NVcEtncmRN?=
 =?utf-8?B?eTdORS9sanZEMmlTRnFvTEdIRWxRSHdYa0NIWWU2Q09QSndwODVNelhyKzBZ?=
 =?utf-8?B?aXM5ZncyclBtRW9DeFp2TUUrNjlabzV0QytONll4VlRtbytPYlJ2ZHVVeHE2?=
 =?utf-8?B?ejVFTHloVmNwYUc3amVtL2wzOFBTaXYzR2FrTnFUWENac3lWNTdsQVk2b2Rw?=
 =?utf-8?B?N3hGNjUxZlJZbVEwb2pqdWt6TS8vR1VYL01DaHpxTUErUVVmT3RMUldIWnR2?=
 =?utf-8?B?Um1qLzF6dUNsbkgrYWI4MEp6WUxwNWdOcEczMjFnRWM3bWpQbFhzdEZBczNt?=
 =?utf-8?B?ZkhyaW91TXhndHpjMEl2cUdXYTZsWmZIa2tnSU5Vcll1TUZja3BTQWVQVUlo?=
 =?utf-8?B?RzhGTlM0UnNhNWhQRjY5M2pJa1FSczRsS1g0Z3RMd293OG9JTnRaSE9hdk0z?=
 =?utf-8?B?eGJkWWJwK3Z2N1dMbDZtejhyS1JGL1FTZVhLUHdDd1RQdkJjSEFjODRyM0sv?=
 =?utf-8?B?Y2J5WG00Q1NTUDlLVXJYMnVrZVk4Ui9KR0JSUzY1d2dZUnVpNWVBbi83OC9Y?=
 =?utf-8?B?SlhuaFdGSTcyNmRMRjZpQkZTdG1CQWNPODVnaVZudytQTkFuNHJnZzFEWk5O?=
 =?utf-8?B?V1FkZittejE1N25mVWNWMkZCMjZ0Q1FMUVNKWHhOMjBVSW1YVUxHb1RlamlZ?=
 =?utf-8?B?WXMxenRaNkI1a05Vd2RvZm5iOUQ5RHEzM2h5WUk1QzVtYTJER3VCdkZIMEVE?=
 =?utf-8?B?ZTNSVjB5ODVwN2h0eUtFWkJnWXlpNGt5RUl2RXplUUhvZ1lSSlY1aSt0b3Yv?=
 =?utf-8?B?VWN4UzNTMVRhSjkvbjc0WUVlcFRxSGhkYkphTW9UdmtiTURBZnVxNXhYdzRt?=
 =?utf-8?B?Sk1kR2lIVXhYYVh4Q3VWWnVoSXNyMStYa01rRUFPSDNRZmJYQnYzVWNRRnpP?=
 =?utf-8?B?dTh5dExKU1pHL3pLOFkva0E2UEJvMGg1NWUwNElucHhxdCtzUENyaG5TcUd2?=
 =?utf-8?B?dzVSYlMwS01kQXYvVlVTTnhZb2lma09FUGtDUnZmRThGQ2JXcTVXOExmaEZU?=
 =?utf-8?B?MXQ4SkhKaE1LemJmajlzbWdHZlkyS3lqWndscStXQ09jYndZSXJNeFNHWllN?=
 =?utf-8?B?NHlXRlc4eEVhVWJRRHR5Z3FUUFZHUGY2STIzSVhZSU83cmxTM1M5SExvblRC?=
 =?utf-8?B?YzlsdVY5cnhLZnU3QW1SWHNKcUx6VjdsRXpzbzZCYzc1QmFEOVZNaXZRNnVx?=
 =?utf-8?B?bUJOU0l6N3pVa2pSL3VDWGl4UlBtWXNHQ0dKTTczSWZMR25IUGFOYzZNSzZG?=
 =?utf-8?B?aWxDaExJaWY1TUtEN1gwcTQwSUsxZ3BwWERHUVJNdXpQTHBweU44ZXlXWVZi?=
 =?utf-8?B?aVRCbmpZd3FXVVlDSmFtcnZBVzhSTTZxVlBMV0IrL2ZVdHowQVlYT1o2VTVr?=
 =?utf-8?B?WjhNZWtYVnZXZmwvM3RSaG9UNWxmdUpoaXlKNWNxd3pyV25TbTZHUy9uSlRZ?=
 =?utf-8?B?UzFGWnVqK2NGclNOa1JSOUVVd0Jsa05UNy9aWFk3Q2RzaFJuMEd1U2d1U0xK?=
 =?utf-8?B?MmppL0xNRWtnQlN4QXk2L3phcU1zZnU1SHRwSEozSWl5b09GSkdPemdSa1R4?=
 =?utf-8?B?S3E2R1J2b1FPTDRnL2EyelZMUmNpb1B2MlM3clY3ZFJoYm40MFFGL1FJLzFa?=
 =?utf-8?B?QndQSEkxMTlqc1MrelJBbGp6L0p0a3NGM0FvQTZEMVIzTmdjRHo1NW1RbEVC?=
 =?utf-8?B?R01ZTkZlaWM2SVBYeEZiT0EzWktjTzRFNkFxVzUzbVNWblA3dHhXSk5vbmpR?=
 =?utf-8?Q?VdVWFyfD6L0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anBsdDkvd2VsSmV4OHdQUDV2ZGJZRTNVN3ZnUkRML0kyZ3NwNUNMSzFOazY1?=
 =?utf-8?B?MmdYN1lrVG41cU1Ubi9mNnpEQXI2N2w4SVFLa1pXc0hKSkUvUGVoSnhnekpa?=
 =?utf-8?B?RnNsanV1TUhUYlljMWg1UXdTQ09JREJlNGZwb2NHZ0xUMVZtVTF1bFROVFB4?=
 =?utf-8?B?ckpOakpFQWl1TFJWbWlrM1VEb3dZdmU4RTFydUF5RGZVZmRxcVpWQzdqZStz?=
 =?utf-8?B?SGErdWRZdE15d3A5d0lmekl5dUdLenB2VkNFRm5JVjRGWmcxZ3hrSGJKZWZN?=
 =?utf-8?B?REhNekZDWDlrRDgwYzBnaklKVWlJcnZxNjJ5N0NsM3VVSCt1SEQzRDM5RlV4?=
 =?utf-8?B?eXBlZmtsQnlyVXJFaER2MmRBdU85R1J6cE9tbk1QZFJCWGZ3M2IzNE9VT1c3?=
 =?utf-8?B?c2VSZjJSd3VveHd4TGw4aTB2Zmg1dHM2ZDlyRDJVZ3ZLTWVoSTl3dmJJbE5n?=
 =?utf-8?B?aEFrSkQ0MWtUR21ZNndPUVFrU2VPczN3RzdZa1V5UnlDOGhRUHlhMEFleUV3?=
 =?utf-8?B?YkRpK0VPNUhPOStweFFpOW5EQ1NUMzhuMGc2VW5LOU8vQ3ZSL1Q1ZEhDb0hL?=
 =?utf-8?B?c296cjcvRFZPdjNBa3pvWk5UY3IzUW94ME5wUVY4c1pvY1hIblNrYUFjYVQ2?=
 =?utf-8?B?VlZXc0hwZzJGeEUvMGJpTUlsSnRxL0tvbzQ1eWwrSUJRRC84U2g4MGJxTVpw?=
 =?utf-8?B?MS93QzlpQng4UUMvVDlmK2w0dktiMVpOdWtMRUd5S0NhSGVsNlhMaTd0Qjcx?=
 =?utf-8?B?L0RSNUhxNC9NaFFTb2VNNkMxd2o5eURHaU1FbXlRdGdGTVJ5dTF1eFV2ZVRq?=
 =?utf-8?B?VFRvUGZFSnZpVC81ZGNDSW9lVG1PZytyeGx0dmlJVlhYRm5ZUE53RlhaMlQ5?=
 =?utf-8?B?eTl1OGZodnJmVW9ubkF5dzFaUkxsRTJONWxqakl5aXRhRmV1eExMUTJZQWN0?=
 =?utf-8?B?ZW1IOVFYQVpBRGIzWlB4S1ZwN2RkR0xEZlBiUkZQTFozWnVVN01POGp6aW5t?=
 =?utf-8?B?S2szQkY2MzlJYnhPcG5MSTJnbE1sckhnenVBMmVmb1lvblJvT1NyZUw5L1JT?=
 =?utf-8?B?R3FFeGg2N0swUjBGVndjZGF1R1RUTm9oTFVtdktWQm1rN3J2Z09LVnpFVlQ3?=
 =?utf-8?B?Rk5YRytnNVVjTW91WHRDMkd4SHpzOTAvZUR5T2JkK3NoeFpJd1Q4SE1SWEFN?=
 =?utf-8?B?ODJtQ2tFSzJkWG9PcXU2bmJpL0IxcUpjNnRUcThEOE9KMlRxcmVuTXhZRDdQ?=
 =?utf-8?B?WU5BazMzZjNvVzJYakM3MDVBN05YR0dWK3ZPL2p2SDVmVDd5YTV0dUwycW5t?=
 =?utf-8?B?RjE5UVZRYWVHOER1UFA5ckg5SGMvSFFROUJ4S09Qa0hCM0pqQVVEOHBKU2F2?=
 =?utf-8?B?RUZsYVUzUGs2TkErbi9vOFZEYVlwOFNtU2pwcEl6N1Bqc3FFTU1pUjdCYVZN?=
 =?utf-8?B?ejBsRlVhUXVUNHdzREFNWlRMcUZaSHRya2cvR0NBYWI2LzQzL05SMVFUL0pq?=
 =?utf-8?B?R3AyRnVOSHZPTGltb1ZRWVRheXpqbWswdVFXK0dkemxNenpuaGNhcHFvZXNa?=
 =?utf-8?B?aTNKaXZkQ3BLMm9PRVhMOEVSL1ZMdWtOMWZVaC9qUFIrVHhDS3JrTW15RTJs?=
 =?utf-8?B?Z0ZIM0pQTWZxOG5iY3JVUEF5OGpNM2lmd1hsTzdhQjBGQkZNaUdQUFFRYU40?=
 =?utf-8?B?RGdtQURkbkJ2TkVqQ041K3RYV0R0Z1RFdXRoNzJnTUN0bFpaejYrSUxNaUN0?=
 =?utf-8?B?dm9JTDFxbmtVdkdCLy9CU2RTWWxJR0FnOVBmWXV0Qm56WDFnN1IwZ0ttOVFn?=
 =?utf-8?B?Z052UFZoWlZIQ2RPMEpndzE1ZjFjWHlqaGRFbEhtZk9tZDR3RmVWbEEwVFUx?=
 =?utf-8?B?K1ZWTENqRWdMcmljWDk3dkdNQ2lZYi9mYzBURlovZEhsVmtnWkRCQnJQTGNH?=
 =?utf-8?B?WEVVMDA3WFhVUFk3ZnNxdVh1YzQxQ3RHeUFYZms1czgxYkxES2FpTXNiYW1u?=
 =?utf-8?B?NExzb0pBRWZDRnk3aFBySzBEWDZ0QzlybGl0MTVYaWFnanVrOHZlMmFLS1lU?=
 =?utf-8?B?UEJpYXdNN0t6RkMzWGVXQUlGbXpTcy82cjBrYllwdWNUYjErcXR0TkdDd1dJ?=
 =?utf-8?Q?TuuH1YdbgXykGJCuJgEJwJNnc?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810f8823-3281-478c-736d-08dd984364bb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:42:18.1122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQqJwfAaUiYMUqW4g/PB4YtvV01e9NrbwZh5jBzqhmGD5dDrriFUcDCrl0lRD/xNn3I4XHv0LFoFDJm9PsEWPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6201



On 19-05-2025 05:28 pm, Dinh Nguyen wrote:
> On 5/12/25 06:39, Mahesh Rao via B4 Relay wrote:
>> From: Mahesh Rao <mahesh.rao@altera.com>
>>
>> This commit adds support for asynchronous communication
>> with the Stratix 10 service channel. It introduces
>> new definitions to enable asynchronous messaging to
>> the Secure Device Manager (SDM). The changes include
>> the adding/removing of asynchronous support to existing
>> channels, initializing/exit-cleanup of the new asynchronous
>> framework and sending/polling of messages to SDM.
>>
>> The new public functions added are:
>> - stratix10_svc_add_async_client: Adds an client
>>          to the service channel.
>> - stratix10_svc_remove_async_client: Removes an
>>          asynchronous client from the service channel.
>> - stratix10_svc_async_send: Sends an asynchronous
>>          message to the SDM mailbox in EL3 secure firmware.
>> - stratix10_svc_async_poll: Polls the status of an
>>          asynchronous service request in EL3 secure firmware.
>> - stratix10_svc_async_done: Marks an asynchronous
>>          transaction as complete and free's up the
>>          resources.
>>
>> These changes enhance the functionality of the
>> Stratix 10 service channel by allowing for more
> 
> Be consistent, it should be Stratix10!
>

Will make the change.

>> efficient and flexible communication with the firmware. >
>> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
>> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
>> ---
>>   drivers/firmware/stratix10-svc.c                   | 646 +++++++++++ 
>> +++++++++-
>>   include/linux/firmware/intel/stratix10-smc.h       |  24 +
>>   .../linux/firmware/intel/stratix10-svc-client.h    |  88 +++
>>   3 files changed, 755 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/ 
>> stratix10-svc.c
>> index 
>> f487b6a7ef7b7cf7fdb4b4132d7a92b601803d8a..e25493db074930dcc16964fbb427be7168a841e6 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
>> @@ -4,9 +4,11 @@
>>    * Copyright (C) 2025, Altera Corporation
>>    */
>> +#include <linux/atomic.h>
>>   #include <linux/completion.h>
>>   #include <linux/delay.h>
>>   #include <linux/genalloc.h>
>> +#include <linux/hashtable.h>
>>   #include <linux/io.h>
>>   #include <linux/kfifo.h>
>>   #include <linux/kthread.h>
>> @@ -44,6 +46,35 @@
>>   #define STRATIX10_RSU                "stratix10-rsu"
>>   #define INTEL_FCS                "intel-fcs"
>> +/*Maximum number of SDM client IDs.*/
>> +#define MAX_SDM_CLIENT_IDS 16
>> +/*Client ID for SIP Service Version 1.*/
>> +#define SIP_SVC_V1_CLIENT_ID 0x1
>> +/*Maximum number of SDM job IDs.*/
>> +#define MAX_SDM_JOB_IDS 16
>> +/*Number of bits used for asynchronous transaction hashing.*/
>> +#define ASYNC_TRX_HASH_BITS 3
>> +/*Total number of transactions-id's which is a combination of client 
>> id and job id.*/
>> +#define TOTAL_TRANSACTION_IDS (MAX_SDM_CLIENT_IDS * MAX_SDM_JOB_IDS)
>> +
>> +/*Minimum major version of the ATF for Asynchronous transactions.*/
>> +#define ASYNC_ATF_MINIMUM_MAJOR_VERSION 0x3
>> +/*Minimum minor version of the ATF for Asynchronous transactions.*/
>> +#define ASYNC_ATF_MINIMUM_MINOR_VERSION 0x0
>> +
>> +/*Macro to extract the job ID from a transaction ID.*/
>> +#define STRATIX10_GET_JOBID(transaction_id) ((transaction_id) & 0xf)
>> +/*Macro to set a transaction ID using a client ID and a transaction 
>> ID.*/
>> +#define STRATIX10_SET_TRANSACTIONID(clientid, transaction_id) \
>> +    ((((clientid) & 0xf) << 4) | ((transaction_id) & 0xf))
>> +
>> +/* Macro to set a transaction ID for SIP SMC using the lower 8 bits 
>> of the transaction ID.*/
>> +#define STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(transaction_id) \
>> +    ((transaction_id) & 0xff)
>> +
>> +/* Macro to get the SDM mailbox error status */
>> +#define STRATIX10_GET_SDM_STATUS_CODE(status) ((status) & 0x3ff)
>> +
>>   typedef void (svc_invoke_fn)(unsigned long, unsigned long, unsigned 
>> long,
>>                    unsigned long, unsigned long, unsigned long,
>>                    unsigned long, unsigned long,
>> @@ -64,7 +95,7 @@ struct stratix10_svc {
>>    * @sync_complete: state for a completion
>>    * @addr: physical address of shared memory block
>>    * @size: size of shared memory block
>> - * @invoke_fn: function to issue secure monitor or hypervisor call
>> + * @invoke_fn: service clients to handle secure monitor or hypervisor 
>> calls
>>    *
>>    * This struct is used to save physical address and size of shared 
>> memory
>>    * block. The shared memory blocked is allocated by secure monitor 
>> software
>> @@ -122,6 +153,64 @@ struct stratix10_svc_data {
>>       u64 arg[3];
>>   };
>> +/**
>> + * struct stratix10_svc_async_handler - Asynchronous handler for 
>> Stratix 10 service layer
>> + * @transaction_id: Unique identifier for the transaction
>> + * @achan: Pointer to the asynchronous channel structure
>> + * @cb_arg: Argument to be passed to the callback function
>> + * @cb: Callback function to be called upon completion
>> + * @msg: Pointer to the client message structure
>> + * @next: Node in the hash list
>> + *
>> + * This structure is used to handle asynchronous transactions in the
>> + * Stratix 10 service layer. It maintains the necessary information
>> + * for processing and completing asynchronous requests.
>> + */
>> +
>> +struct stratix10_svc_async_handler {
>> +    u8 transaction_id;
>> +    struct stratix10_async_chan *achan;
>> +    void *cb_arg;
>> +    async_callback_t cb;
>> +    struct stratix10_svc_client_msg *msg;
>> +    struct hlist_node next;
>> +    struct arm_smccc_1_2_regs res;
>> +};
>> +
>> +/**
>> + * struct stratix10_async_chan - Structure representing an 
>> asynchronous channel
>> + * @async_client_id: Unique client identifier for the asynchronous 
>> operation
>> + * @job_id_pool: Pointer to the job ID pool associated with this channel
>> + */
>> +
>> +struct stratix10_async_chan {
>> +    unsigned long async_client_id;
>> +    struct stratix10_sip_id_pool *job_id_pool;
>> +};
>> +
>> +/**
>> + * struct stratix10_async_ctrl - Control structure for Stratix 10 
>> asynchronous operations
> 
> s/Stratix 10/Stratix10

will make the change.

> 
>> + * @initialized: Flag indicating whether the control structure has 
>> been initialized
>> + * @invoke_fn: Function pointer for invoking Stratix 10 service calls 
>> to EL3 secure firmware
>> + * @async_id_pool: Pointer to the ID pool used for asynchronous 
>> operations
>> + * @common_achan_refcount: Atomic reference count for the common 
>> asynchronous channel usage
>> + * @common_async_chan: Pointer to the common asynchronous channel 
>> structure
>> + * @trx_list_wr_lock: Spinlock for protecting the transaction list 
>> write operations
>> + * @trx_list: Hash table for managing asynchronous transactions
>> + */
>> +
>> +struct stratix10_async_ctrl {
>> +    bool initialized;
>> +    void (*invoke_fn)(struct stratix10_async_ctrl *actrl,
>> +              const struct arm_smccc_1_2_regs *args, struct 
>> arm_smccc_1_2_regs *res);
>> +    struct stratix10_sip_id_pool *async_id_pool;
>> +    atomic_t common_achan_refcount;
>> +    struct stratix10_async_chan *common_async_chan;
>> +    /* spinlock to protect the writes to trx_list hash table */
>> +    spinlock_t trx_list_wr_lock;
>> +    DECLARE_HASHTABLE(trx_list, ASYNC_TRX_HASH_BITS);
>> +};
>> +
>>   /**
>>    * struct stratix10_svc_controller - service controller
>>    * @dev: device
>> @@ -135,6 +224,7 @@ struct stratix10_svc_data {
>>    * @complete_status: state for completion
>>    * @svc_fifo_lock: protect access to service message data queue
>>    * @invoke_fn: function to issue secure monitor call or hypervisor call
>> + * @actrl: async control structure
>>    *
>>    * This struct is used to create communication channels for service 
>> clients, to
>>    * handle secure monitor or hypervisor call.
>> @@ -151,6 +241,7 @@ struct stratix10_svc_controller {
>>       struct completion complete_status;
>>       spinlock_t svc_fifo_lock;
>>       svc_invoke_fn *invoke_fn;
>> +    struct stratix10_async_ctrl actrl;
>>   };
>>   /**
>> @@ -159,15 +250,17 @@ struct stratix10_svc_controller {
>>    * @scl: pointer to service client which owns the channel
>>    * @name: service client name associated with the channel
>>    * @lock: protect access to the channel
>> + * @async_chan: reference to asynchronous channel object for this 
>> channel
>>    *
>> - * This struct is used by service client to communicate with service 
>> layer, each
>> - * service client has its own channel created by service controller.
>> + * This struct is used by service client to communicate with service 
>> layer.
>> + * Each service client has its own channel created by service 
>> controller.
>>    */
>>   struct stratix10_svc_chan {
>>       struct stratix10_svc_controller *ctrl;
>>       struct stratix10_svc_client *scl;
>>       char *name;
>>       spinlock_t lock;
>> +    struct stratix10_async_chan *async_chan;
>>   };
>>   /**
>> @@ -1118,6 +1211,546 @@ struct stratix10_svc_chan 
>> *stratix10_svc_request_channel_byname(
>>   }
>>   EXPORT_SYMBOL_GPL(stratix10_svc_request_channel_byname);
>> +/**
>> + * stratix10_svc_add_async_client - Add an asynchronous client to the 
>> Stratix10 service channel.
>> + * @chan: Pointer to the Stratix10 service channel structure.
>> + * @use_unique_clientid: Boolean flag indicating whether to use a 
>> unique client ID.
>> + *
>> + * This function adds an asynchronous client to the specified 
>> Stratix10 service channel.
>> + * If the `use_unique_clientid` flag is set to true, a unique client 
>> ID is allocated for
>> + * the asynchronous channel. Otherwise, a common asynchronous channel 
>> is used > + *
>> + * Return: 0 on success, or a negative error code on failure:
>> + *         -EINVAL if the channel is NULL or the async controller is 
>> not initialized.
>> + *         -EALREADY if the async channel is already allocated.
>> + *         -ENOMEM if memory allocation fails.
>> + *         Other negative values if ID allocation fails.
>> + */
>> +int stratix10_svc_add_async_client(struct stratix10_svc_chan *chan,
>> +                   bool use_unique_clientid)
>> +{
>> +    int ret = 0;
>> +    struct stratix10_async_chan *achan;
>> +
>> +    if (!chan)
>> +        return -EINVAL;
>> +
>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>> +    struct stratix10_async_ctrl *actrl = &ctrl->actrl;
>> +
>> +    if (!actrl->initialized) {
>> +        dev_err(ctrl->dev, "Async controller not initialized\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (chan->async_chan) {
>> +        dev_err(ctrl->dev, "async channel already allocated\n");
>> +        return -EALREADY;
>> +    }
>> +
>> +    if (use_unique_clientid) {
>> +        achan = kzalloc(sizeof(*achan), GFP_KERNEL);
>> +        if (!achan)
>> +            return -ENOMEM;
>> +
>> +        achan->job_id_pool = stratix10_id_pool_create(MAX_SDM_JOB_IDS);
>> +        if (!achan->job_id_pool) {
>> +            dev_err(ctrl->dev, "Failed to create job id pool\n");
>> +            kfree(achan);
>> +            return -ENOMEM;
>> +        }
>> +
>> +        ret = stratix10_allocate_id(actrl->async_id_pool);
>> +        if (ret < 0) {
>> +            dev_err(ctrl->dev,
>> +                "Failed to allocate async client id\n");
>> +            stratix10_id_pool_destroy(achan->job_id_pool);
>> +            kfree(achan);
>> +            return ret;
>> +        }
>> +        achan->async_client_id = ret;
>> +        chan->async_chan = achan;
>> +    } else {
> 
> What's the purpose of a unique client ID again? It looks like the if/ 
> else are doing very similar things. You can probably simplify it bit 
> better.
> 

Certain clients like fpga_manager and fcs might require unique client id
for transacting with Secure Device Manager(SDM), but others like RSU and
hwmon might not require this. so I am using use_unique_clientid to 
distwinguish between them during async channel creation. This is also a 
way to conserve client id usage in the system.

I will simplify the function and merge common code.

> 
>> +        if (atomic_read(&actrl->common_achan_refcount) == 0) {
>> +            achan = kzalloc(sizeof(*achan), GFP_KERNEL);
>> +            if (!achan)
>> +                return -ENOMEM;
>> +
>> +            achan->job_id_pool =
>> +                stratix10_id_pool_create(MAX_SDM_JOB_IDS);
>> +            if (!achan->job_id_pool) {
>> +                dev_err(ctrl->dev,
>> +                    "Failed to create job id pool\n");
>> +                kfree(achan);
>> +                return -ENOMEM;
>> +            }
>> +
>> +            ret = stratix10_allocate_id(actrl->async_id_pool);
>> +            if (ret < 0) {
>> +                dev_err(ctrl->dev,
>> +                    "Failed to allocate async client id\n");
>> +                stratix10_id_pool_destroy(achan->job_id_pool);
>> +                kfree(achan);
>> +                return ret;
>> +            }
>> +            achan->async_client_id = ret;
>> +            actrl->common_async_chan = achan;
>> +            dev_info(ctrl->dev,
>> +                 "Common async channel allocated with id %ld\n",
>> +                 achan->async_client_id);
>> +        }
>> +        chan->async_chan = actrl->common_async_chan;
>> +        atomic_inc(&actrl->common_achan_refcount);
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(stratix10_svc_add_async_client);
>> +
>> +/**
>> + * stratix10_svc_remove_async_client - Remove an asynchronous client 
>> from
>> + *                                     the Stratix10 service channel.
>> + * @chan: Pointer to the Stratix10 service channel structure.
>> + *
>> + * This function removes an asynchronous client associated with the 
>> given service channel.
>> + * It checks if the channel and the asynchronous channel are valid, 
>> and then proceeds to
>> + * decrement the reference count for the common asynchronous channel 
>> if applicable. If the
>> + * reference count reaches zero, it destroys the job ID pool and 
>> deallocates the asynchronous
>> + * client ID. For non-common asynchronous channels, it directly 
>> destroys the job ID pool,
>> + * deallocates the asynchronous client ID, and frees the memory 
>> allocated for the asynchronous
>> + * channel.
>> + *
>> + * Return: 0 on success, -EINVAL if the channel or asynchronous 
>> channel is invalid.
>> + */
>> +int stratix10_svc_remove_async_client(struct stratix10_svc_chan *chan)
>> +{
>> +    if (!chan)
>> +        return -EINVAL;
>> +
>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>> +    struct stratix10_async_ctrl *actrl = &ctrl->actrl;
>> +    struct stratix10_async_chan *achan = chan->async_chan;
>> +
>> +    if (!achan) {
>> +        dev_err(ctrl->dev, "async channel not allocated\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (achan == actrl->common_async_chan) {
>> +        atomic_dec(&actrl->common_achan_refcount);
>> +        if (atomic_read(&actrl->common_achan_refcount) == 0) {
>> +            stratix10_id_pool_destroy(achan->job_id_pool);
>> +            stratix10_deallocate_id(actrl->async_id_pool, achan- 
>> >async_client_id);
>> +        }
>> +    } else {
>> +        stratix10_id_pool_destroy(achan->job_id_pool);
>> +        stratix10_deallocate_id(actrl->async_id_pool, achan- 
>> >async_client_id);
>> +        kfree(achan);
>> +    }
>> +    chan->async_chan = NULL;
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(stratix10_svc_remove_async_client);
>> +
>> +/**
>> + * stratix10_svc_async_send - Send an asynchronous message to the 
>> Stratix10 service
>> + * @chan: Pointer to the service channel structure
>> + * @msg: Pointer to the message to be sent
>> + * @handler: Pointer to the handler for the asynchronous message used 
>> by caller for later reference.
>> + * @cb: Callback function to be called upon completion
>> + * @cb_arg: Argument to be passed to the callback function
>> + *
>> + * This function sends an asynchronous message to the SDM mailbox in 
>> EL3 secure
>> + * firmware. It performs various checks and setups, including 
>> allocating a job ID,
>> + * setting up the transaction ID and packaging it to El3 firmware.
>> + * The function handles different commands by setting up the appropriate
>> + * arguments for the SMC call. If the SMC call is successful, the 
>> handler
>> + * is set up and the function returns 0. If the SMC call fails, 
>> appropriate
>> + * error handling is performed along with cleanup of resources.
>> + *
>> + * Return: 0 on success,-EINVAL for invalid argument,-ENOMEM if 
>> memory is not available,
>> + *         -EAGAIN if EL3 firmware is busy, -EBADF if the message is 
>> rejected
>> + *         by EL3 firmware and -EIO on ther errors from EL3 firmware.
>> + */
>> +int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void 
>> *msg, void **handler,
>> +                 async_callback_t cb, void *cb_arg)
>> +{
>> +    struct stratix10_svc_client_msg *p_msg = (struct 
>> stratix10_svc_client_msg *)msg;
>> +    struct arm_smccc_1_2_regs args = { 0 }, res = { 0 };
>> +    struct stratix10_svc_async_handler *handle = NULL;
>> +    int ret = 0;
>> +
>> +    if (!chan || !msg || !handler)
>> +        return -EINVAL;
>> +
>> +    struct stratix10_async_chan *achan = chan->async_chan;
>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>> +    struct stratix10_async_ctrl *actrl = &ctrl->actrl;
>> +
>> +    if (!actrl->initialized) {
>> +        dev_err(ctrl->dev, "Async controller not initialized\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (!achan) {
>> +        dev_err(ctrl->dev, "Async channel not allocated\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    handle =
>> +        kzalloc(sizeof(struct stratix10_svc_async_handler), GFP_KERNEL);
>> +    if (!handle)
>> +        return -ENOMEM;
>> +
>> +    ret = stratix10_allocate_id(achan->job_id_pool);
>> +    if (ret < 0) {
>> +        dev_err(ctrl->dev, "Failed to allocate job id\n");
>> +        kfree(handle);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    handle->transaction_id =
>> +        STRATIX10_SET_TRANSACTIONID(achan->async_client_id, ret);
>> +    handle->cb = cb;
>> +    handle->msg = p_msg;
>> +    handle->cb_arg = cb_arg;
>> +    handle->achan = achan;
>> +
>> +    /*set the transaction jobid in args.a1*/
>> +    args.a1 =
>> +        STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
>> +
>> +    switch (p_msg->command) {
>> +    default:
>> +        dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
> 
> Won't you get this message printed all the time?

This patch contains the initial framework without any commands added.
The default case is for the negative scenario when a command is added 
incorrectly. the last patch in the series adds command for hwmon which 
shows the correct usage.

> 
>> +        ret = -EINVAL;
>> +        goto deallocate_id;
>> +    }
>> +
>> +    /**
>> +     * There is a chance that during the execution of async_send() in 
>> one core,
>> +     * an interrupt might be received in another core; to mitigate 
>> this we are
>> +     * adding the handle to the DB and then send the smc call. If the 
>> smc call
>> +     * is rejected or busy then we will deallocate the handle for the 
>> client
>> +     * to retry again.
>> +     */
>> +    spin_lock(&actrl->trx_list_wr_lock);
>> +    hash_add_rcu(actrl->trx_list, &handle->next, handle- 
>> >transaction_id);
>> +    spin_unlock(&actrl->trx_list_wr_lock);
>> +    synchronize_rcu();
>> +
>> +    actrl->invoke_fn(actrl, &args, &res);
>> +
>> +    switch (res.a0) {
>> +    case INTEL_SIP_SMC_STATUS_OK:
>> +        dev_dbg(ctrl->dev,
>> +            "Async message sent with transaction_id 0x%02x\n",
>> +            handle->transaction_id);
>> +            *handler = handle;
>> +        return 0;
>> +    case INTEL_SIP_SMC_STATUS_BUSY:
>> +        dev_warn(ctrl->dev, "Mailbox is busy, try after some time\n");
>> +        ret = -EAGAIN;
>> +        break;
>> +    case INTEL_SIP_SMC_STATUS_REJECTED:
>> +        dev_err(ctrl->dev, "Async message rejected\n");
>> +        ret = -EBADF;
>> +        break;
>> +    default:
>> +        dev_err(ctrl->dev,
>> +            "Failed to send async message ,got status as %ld\n",
>> +            res.a0);
>> +        ret = -EIO;
>> +    }
>> +
>> +    spin_lock(&actrl->trx_list_wr_lock);
>> +    hash_del_rcu(&handle->next);
>> +    spin_unlock(&actrl->trx_list_wr_lock);
>> +    synchronize_rcu();
>> +
>> +deallocate_id:
>> +    stratix10_deallocate_id(achan->job_id_pool,
>> +                STRATIX10_GET_JOBID(handle->transaction_id));
>> +    kfree(handle);
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(stratix10_svc_async_send);
>> +
>> +/**
>> + * stratix10_svc_async_prepare_response - Prepare the response data 
>> for an asynchronous transaction.
>> + * @chan: Pointer to the service channel structure.
>> + * @handle: Pointer to the asynchronous handler structure.
>> + * @data: Pointer to the callback data structure.
>> + *
>> + * This function prepares the response data for an asynchronous 
>> transaction. It
>> + * extracts the response data from the SMC response structure and 
>> stores it in
>> + * the callback data structure. The function also logs the completion 
>> of the
>> + * asynchronous transaction.
>> + *
>> + * Return: 0 on success, -ENOENT if the command is invalid
>> + */
>> +static int stratix10_svc_async_prepare_response(struct 
>> stratix10_svc_chan *chan,
>> +                        struct stratix10_svc_async_handler *handle,
>> +                        struct stratix10_svc_cb_data *data)
>> +{
>> +    struct stratix10_svc_client_msg *p_msg =
>> +        (struct stratix10_svc_client_msg *)handle->msg;
>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>> +
>> +    data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
>> +
>> +    switch (p_msg->command) {
>> +    default:
>> +        dev_alert(ctrl->dev, "Invalid command\n ,%d", p_msg->command);
>> +        return -ENOENT;
>> +    }
> 
> What is the above code doing?

This function prepares the response  for clients after retriving the 
response from the Arm Trusted Firmware using the polling call. Currently 
only the negative scenario is shown for incvalid command, the last patch 
in series adds command for hwmon for the positive scenario.

> 
>> +    dev_dbg(ctrl->dev, "Async message completed transaction_id 
>> 0x%02x\n",
>> +        handle->transaction_id);
>> +    return 0;
>> +}
>> +
>> +/**
>> + * stratix10_svc_async_poll - Polls the status of an asynchronous 
>> transaction.
>> + * @chan: Pointer to the service channel structure.
>> + * @tx_handle: Handle to the transaction being polled.
>> + * @data: Pointer to the callback data structure.
>> + *
>> + * This function polls the status of an asynchronous transaction 
>> identified by the
>> + * given transaction handle. It ensures that the necessary structures 
>> are initialized
>> + * and valid before proceeding with the poll operation. The function 
>> sets up the
>> + * necessary arguments for the SMC call, invokes the call, and 
>> prepares the response
>> + * data if the call is successful. If the call fails, the function 
>> returns
>> + * the error mapped the SVC status error.
>> + *
>> + * Return: 0 on success, -EINVAL if any input parameter is invalid, - 
>> EAGAIN if the
>> + *         transaction is still in progress,-EPERM if the command is 
>> invalid.
>> + *         or other negative error codes on failure.
>> + */
>> +int stratix10_svc_async_poll(struct stratix10_svc_chan *chan, void 
>> *tx_handle,
>> +                 struct stratix10_svc_cb_data *data)
>> +{
>> +    int ret;
>> +    struct arm_smccc_1_2_regs args = { 0 };
>> +
>> +    if (!chan || !tx_handle || !data)
>> +        return -EINVAL;
>> +
>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>> +    struct stratix10_async_ctrl *actrl = &ctrl->actrl;
>> +    struct stratix10_async_chan *achan = chan->async_chan;
>> +
>> +    if (!achan) {
>> +        dev_err(ctrl->dev, "Async channel not allocated\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    struct stratix10_svc_async_handler *handle =
>> +        (struct stratix10_svc_async_handler *)tx_handle;
>> +    if (!hash_hashed(&handle->next)) {
>> +        dev_err(ctrl->dev, "Invalid transaction handler\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    args.a0 = INTEL_SIP_SMC_ASYNC_POLL;
>> +    args.a1 =
>> +        STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
>> +
>> +    actrl->invoke_fn(actrl, &args, &handle->res);
>> +
>> +    data->status = 0;
>> +    if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
>> +        ret = stratix10_svc_async_prepare_response(chan, handle, data);
>> +        if (ret) {
>> +            dev_err(ctrl->dev, "Error in preparation of response, 
>> %d\n", ret);
>> +            WARN_ON_ONCE(1);
>> +        }
>> +        return 0;
>> +    } else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
>> +        dev_dbg(ctrl->dev, "async message is still in progress\n");
>> +        return -EAGAIN;
>> +    }
>> +
>> +    dev_err(ctrl->dev,
>> +        "Failed to poll async message ,got status as %ld\n",
>> +        handle->res.a0);
>> +    return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(stratix10_svc_async_poll);
>> +
>> +/**
>> + * stratix10_svc_async_done - Completes an asynchronous transaction.
>> + * @chan: Pointer to the service channel structure.
>> + * @tx_handle: Handle to the transaction being completed.
>> + *
>> + * This function completes an asynchronous transaction identified by 
>> the given
>> + * transaction handle. It ensures that the necessary structures are 
>> initialized
>> + * and valid before proceeding with the completion operation. The 
>> function
>> + * deallocates the transaction ID, frees the memory allocated for the 
>> handler,
>> + * and removes the handler from the transaction list.
>> + *
>> + * Return: 0 on success, -EINVAL if any input parameter is invalid, 
>> or other
>> + *         negative error codes on failure.
>> + */
>> +int stratix10_svc_async_done(struct stratix10_svc_chan *chan, void 
>> *tx_handle)
>> +{
>> +    if (!chan || !tx_handle)
>> +        return -EINVAL;
>> +
>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>> +    struct stratix10_async_chan *achan = chan->async_chan;
>> +
>> +    if (!achan) {
>> +        dev_err(ctrl->dev, "async channel not allocated\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    struct stratix10_svc_async_handler *handle =
>> +        (struct stratix10_svc_async_handler *)tx_handle;
>> +    if (!hash_hashed(&handle->next)) {
>> +        dev_err(ctrl->dev, "Invalid transaction handle\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    struct stratix10_async_ctrl *actrl = &ctrl->actrl;
>> +
>> +    spin_lock(&actrl->trx_list_wr_lock);
>> +    hash_del_rcu(&handle->next);
>> +    spin_unlock(&actrl->trx_list_wr_lock);
>> +    synchronize_rcu();
>> +    stratix10_deallocate_id(achan->job_id_pool,
>> +                STRATIX10_GET_JOBID(handle->transaction_id));
>> +    kfree(handle);
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(stratix10_svc_async_done);
>> +
>> +static inline void stratix10_smc_1_2(struct stratix10_async_ctrl *actrl,
>> +                     const struct arm_smccc_1_2_regs *args,
>> +                     struct arm_smccc_1_2_regs *res)
>> +{
>> +    arm_smccc_1_2_smc(args, res);
>> +}
>> +
>> +/**
>> + * stratix10_svc_async_init - Initialize the Stratix 10 service 
>> controller
>> + *                            for asynchronous operations.
>> + * @controller: Pointer to the Stratix 10 service controller structure.
>> + *
>> + * This function initializes the asynchronous service controller by 
>> setting up
>> + * the necessary data structures, initializing the transaction list, and
>> + *
>> + * Return: 0 on success, -EINVAL if the controller is NULL or already 
>> initialized,
>> + *         -ENOMEM if memory allocation fails, -EADDRINUSE if the 
>> client ID is already
>> + *         reserved, or other negative error codes on failure.
>> + */
>> +static int stratix10_svc_async_init(struct stratix10_svc_controller 
>> *controller)
>> +{
>> +    int ret;
>> +    struct arm_smccc_res res;
>> +
>> +    if (!controller)
>> +        return -EINVAL;
>> +
>> +    struct stratix10_async_ctrl *actrl = &controller->actrl;
>> +
>> +    if (actrl->initialized)
>> +        return -EINVAL;
>> +
>> +    struct device *dev = controller->dev;
>> +
>> +    controller->invoke_fn(INTEL_SIP_SMC_SVC_VERSION, 0, 0, 0, 0, 0, 
>> 0, 0, &res);
>> +    if (res.a0 != INTEL_SIP_SMC_STATUS_OK &&
>> +        !(res.a1 > ASYNC_ATF_MINIMUM_MAJOR_VERSION ||
>> +          (res.a1 == ASYNC_ATF_MINIMUM_MAJOR_VERSION &&
>> +           res.a2 >= ASYNC_ATF_MINIMUM_MINOR_VERSION))) {
>> +        dev_err(dev,
>> +            "Intel Service Layer Driver: ATF version is not 
>> compatible for async operation\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    actrl->invoke_fn = stratix10_smc_1_2;
>> +
>> +    actrl->async_id_pool = stratix10_id_pool_create(MAX_SDM_CLIENT_IDS);
>> +    if (!actrl->async_id_pool)
>> +        return -ENOMEM;
>> +
>> +    /**
>> +     * SIP_SVC_V1_CLIENT_ID is used by V1 clients/stratix10_svc_send()
>> +     * for communicating with SDM synchronously. We need to restrict 
>> this
>> +     * in V3 usage to distinguish the V1 and V3 messages in El3 
>> firmware.
>> +     */
>> +    ret = stratix10_reserve_id(actrl->async_id_pool, 
>> SIP_SVC_V1_CLIENT_ID);
>> +    if (ret < 0) {
>> +        dev_err(dev,
>> +            "Intel Service Layer Driver: Error on reserving 
>> SIP_SVC_V1_CLIENT_ID\n");
>> +        stratix10_id_pool_destroy(actrl->async_id_pool);
> 
> You should also set async_id_pool to NULL.
> 
> 

will make the change.



Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2134.outbound.protection.outlook.com [40.107.101.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F22E1D6DB4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750388467; cv=fail; b=t71LrPuXaEpi/aDLbZbECC+shvvjF6UvbV1sSGPC6KiQ8O3EYkrrO9wTpOKL7629Cg1JC6Vi1SN9u9svzWzJPIwP0hbtiasf/ur7w1h4Zvw0hfQpJl54LkSE3gs1qbaXLOcscOlXxWRdH3Bsy925S3PY6xHxkDqIwxEFEjZEOFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750388467; c=relaxed/simple;
	bh=mYeBqAu82YOjA7zyOsQKRltsqEoQ81PPTbVZhHKGKus=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pp4iLGWSrHf3BWnI7FRVhc2yYoNe8o3irWOIcFxUjT+HAR12A8kMkx3ko+8AaI2mkotb+OCauYiDqE9KpXFw+7B3QRkottnygE+e/x+yjPyZb2HXbDkX5+2IcwLOFxKGuKCTV5lIaSsYoDguSv9DCWxlxu7RxT8pzD5dTwIVejg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=FJTrcGD6 reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.101.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="FJTrcGD6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPL3Rae4zRSbs0WufCggqinmGaUAoYMS2tBME5QRnNof+d23T4kTSjZBIZuGtUVdvg8KZvTIs8emuNoSXTxLfWeeZWtN5nwjx4OnuBHDgL5QJixlOgmtarCd8oKATVfJDqhnij6oDLIZo54Z/zmoyMscgGCwKtR605b6Nr8R2RBiDc401XMcQ2M9RZeV84gBEZVY4+BXzzJM3D+/gFia1nuVU9p7/GedomUhFLUUTWJLnTh6pnE+1YAprKFmYafpgXcPToB3CsHhJDRZ877ttrCD5sH3Iek0hu1xQzJsBtjyRXHXzSBjdjLtrtnftTRWyF27eQ3F86BDPyY88oV4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH79cQgeSEnmldumrRHdpYvZ5RbF8f3C+ELVmC6vIcc=;
 b=QUBDjk7kGOtc5nPwkf2cYf3Wks9Ozyw1Ee9AWPhPwAjIS5y9VlDZ0TPuJwPySAf13FYlMvVMlAkXXkZ97KLDoNzB/45j/d/JcPNdoC/KCRntxfQUKp8c3CI9+6iJZKKMTkA6IV/ldR5cjUefkrEcfodjn1dCu/UfR8J7z9OjHRSvYtJZCg4FrWgZT6H4t+nkfgO4H/3z9NHCOyXjfxTnjfm0I/XGSU6dSZAoHJ/L5xPgIvCpRV2Oruf1LC09c0nKlmF5o+l4g6y1oCjtT64VIwRRsTEA40YDVXw5uDwpcq6yRpn9yOR/aPeaS9DcIhij6DRPwZ6m2o+rn0o9R8iJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH79cQgeSEnmldumrRHdpYvZ5RbF8f3C+ELVmC6vIcc=;
 b=FJTrcGD64EgfHMOM2q07pJF8hmo/5JAfGujL4xVyddciuZRix1qygM7OLxZyTaBVfuFcAvafVA4W5GKraDHUpRi02jLk/8v8e8K4OyvRCcwoJPzp+lYLVaCi5teCWz9qd1eN879z6h76Kul1W421hVZ4E6Mz/jT9fDW+M90qEos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 DS7PR01MB7543.prod.exchangelabs.com (2603:10b6:8:72::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Fri, 20 Jun 2025 03:01:02 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8813.020; Fri, 20 Jun 2025
 03:01:02 +0000
Message-ID: <cf675887-49e0-45a9-9008-33c0c6f1edf1@amperemail.onmicrosoft.com>
Date: Fri, 20 Jun 2025 11:00:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: set the se->vlag strictly following the paper
To: Vincent Guittot <vincent.guittot@linaro.org>,
 Huang Shijie <shijie@os.amperecomputing.com>
Cc: mingo@redhat.com, peterz@infradead.org, patches@amperecomputing.com,
 cl@linux.com, yang@os.amperecomputing.com, juri.lelli@redhat.com,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250619031942.25474-1-shijie@os.amperecomputing.com>
 <CAKfTPtBUJa4A2V3XR8EwYVPxiY=ENZr1=Jg5R3E75r5XnrnRPg@mail.gmail.com>
Content-Language: en-GB
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <CAKfTPtBUJa4A2V3XR8EwYVPxiY=ENZr1=Jg5R3E75r5XnrnRPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|DS7PR01MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: cec607e7-7d47-4610-012b-08ddafa6b0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWVnU0dyeGZWRVpEdytDZDlpaGQzWitXcS9JWldMdGtTTmJCQVhwUnFOSFVF?=
 =?utf-8?B?T1VTYkFSZUgrSWpwcC9FUlFEMkwwcGw1VWJhQXpjZVFieDdUWU42VTFJYldw?=
 =?utf-8?B?azZQT1d4WXQvNFV2bnRpcWtMSzFEZjdiNjV3anR2SGI2OHN0TXlLa3RFZzcy?=
 =?utf-8?B?WVVIUzRNQVdjVTRHWlhoOE1CMWhkNFpXSHBQU1UwZUZyTXpPVVBaRHNkd01M?=
 =?utf-8?B?RHdNWDlWeVduOG9PQS90ZjhzQUJ1a2JOclk5ck9adjhaK1E1VDZhcE9tT0ZN?=
 =?utf-8?B?M0ZNeSt5VVlkVXJmdzZvSnlYY3ZXYUVOcWFoS05QUUc5b0YvL3dKZW54R29p?=
 =?utf-8?B?U0w5bFJndkZPTWtFdjZmaC95NEVFQkhOMFpRcU45QkZwZ0lRZUc0NEdCU2Z2?=
 =?utf-8?B?Qm8zT2F4bjd3SHRKK1RCTGFZa1pkN3hkeGkrR2dBbStjYzlUTXhpR0RkemVC?=
 =?utf-8?B?eGpwTUZXK3ZDVWNIUmtVVTJRa0MybkJ0WU9EQjE3NGJFa2JJVGgxRVU4cGJY?=
 =?utf-8?B?YmtyZGRVRHpiTkFodGVQRDdCZTBERDlIQlk4Tk8wMkFOcHEwRGVjMC95eGRR?=
 =?utf-8?B?Z3c4R1RSZG5RVGFCT1RjSHd6Z0gycnpWL041WmE2NTNEM0Zvcm1LYWNZRGFY?=
 =?utf-8?B?TzJVbXF3b1ZIQ2hxbVM1dkdFLytPWjR2R2kwZGIzSEZYOTBnUURvUE9maFll?=
 =?utf-8?B?ZkFoZzdCbHY1QTgxcXFjVENNekdEVlNsbUV5Yzd0b1UvUjZjQmdyN1Z4N08v?=
 =?utf-8?B?N1RCWFVZaERyYi9xNEt1eCtGQXN1V3RwU0k5eSswa0ZDWmpOV1dybFc5MG1Q?=
 =?utf-8?B?eGtWZy9ua3RJSjJWbHA3UHE1VUtYbHJ6OXRXT2wwSkZWQUhvT3JLT1hkN29h?=
 =?utf-8?B?N1BicHFEbDJIN2xpN0JDS3RiUkQrUzBiRlh0SXhhRDRKcHlJSEhySmRmOGVm?=
 =?utf-8?B?YzlzRmpnVldRVjJvd1ErSzdsNnpXMWgxWEdWQmJLRkFLcVNDa3Y1ckJnZUVI?=
 =?utf-8?B?bld2NC9kU2phM1YxRFV5aEJFT3kxUXRvdXl3WEl2QjdHalZhcDhmZ0xsaHlG?=
 =?utf-8?B?R1lMQndlN1JhVG5DMVpxTW1mU3dUWG9ZK1JyRTFhMzdaU2k4RzEzbGNkRWRB?=
 =?utf-8?B?cVhpOHIrN1FuNWZQZGlPV05pSHZKQ1NkNTlxZlRJUFphamZhdmR2dVVVdWgz?=
 =?utf-8?B?ZStlZkZiT3lWKzlaTWowVTIzenUwQ0cveWR1bGlMYXpMaEF0SGd5eDN1dUZX?=
 =?utf-8?B?UHphWlZYOXpFK2w0MEc1bGl4QXp5S29SVVF1TEJyZVBzTjJRbUxWbE1LOW54?=
 =?utf-8?B?NHFjTHhPR1lCeFU1aVRVZzF4THl4MUx0OThabDFHU3hka3piOHZFN2NsdVdq?=
 =?utf-8?B?QmJJbkl2TTJEOCtTUjRKSjZ3akRDMEdQY3pKS25lOTNtRjM1Nlc1QmNoU1lW?=
 =?utf-8?B?V1JkZXRjZ2oxTUpDMExIY3FPdkVtT3Q3ZkhGdExIenUvZjRlUGRLcjY3ZXJv?=
 =?utf-8?B?bEZGZnN2aVUrNEViaWpHUXQrNFRVWEFHYWVabmtSb0ttS2V2S1l1Y1V0MFQy?=
 =?utf-8?B?MDhNUFg2R2o2VjJWbXZ4UU9SemZ4cy9jalEvK2RUa3VoZEp2VjlPQmVmZS8r?=
 =?utf-8?B?RHlCRUlrK20xdk9RZGpsY2NtTTFDRXhacjFwMGdVb0NBbFhaZUZXMTNrS21Z?=
 =?utf-8?B?NEhObC9CaDhJYWpGeS9udnR3elAxbkJOL2NYNzBITDBKeEhlU0hGaUk3SnVm?=
 =?utf-8?B?bGJFOGVzcSsvNG5HYko1SkdnRGhJMEFuMGxoOUxoOWFXVDBVMHNadGdpT29o?=
 =?utf-8?B?ckIxeU5hMHlLczd1aEZTdUl1ekw0ZE1sZU1HNjVxUFYxbmtobDVERW42Wk1C?=
 =?utf-8?B?bmpaTGxNZllmcUprUmdIeEp5Q2JIWEdKbDFMd29lYTN5Rmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHN5TTJidzZ2a2l2Z3RqRkVEL1orK0FKNHkvbUhONHBxTzgxcFU0SWZZNkht?=
 =?utf-8?B?a0VrcXMrNldpcVJKZjB0ZDE0c2RvOWdPT293bU9PL0dlNS93VEFBYzgzc29X?=
 =?utf-8?B?anZ3RFRta0tqSEYva2lXUWFRUXBYTHJHUlc0clBsOG9mUDQzVEpicnh5RzRa?=
 =?utf-8?B?WmNwOFpmb1ZtRDAwYXh4eDlKblNPU0J5eGN3czA0TUxEMHdIOEVqYnVtVUJ4?=
 =?utf-8?B?VWRrM3hSOGx5VGFLb1ZyRXpsSy85QWh1V2ZJK2dHYjNzcXFVZ1ZYbDU0c2NR?=
 =?utf-8?B?NFlxemFCZlFTQXU1aHdCVEh4WW1iZEJ5czVPNnIxWS9idFBONGNVaSt1RTE1?=
 =?utf-8?B?cGdZZzhML1UzQjNGTTFERFZHSlRYY1E1emc0dnNTMkdKZy8vY2NOR3h0RDRT?=
 =?utf-8?B?bjVOSkFqN3FNVUN4cnJKSjBJdHVQYWw5a0RBRXNxOTR4WktMbzFNQnRseGly?=
 =?utf-8?B?YzlacjBIcFFJTDMyK3RjeCtUUGJxMkdhVDZuNW9vNWlyMWp1d2tJUGVxOG1B?=
 =?utf-8?B?R3pFL0EyTWc5M1NTdjJXeGV6MGlkdWVGY3NiUnJ2T1A3VUJacEc1YUNUQmJx?=
 =?utf-8?B?OEJ0T2Y5SElvL0o3TklCdVI0NTZFU2diZ01ITzcybUJJeGZLb0FUTzN5QThF?=
 =?utf-8?B?WHBkdmZYMVh4enlDRENYNHNicXg1a0xoTzZTSkRwUy9VVGVpQWdJR2NBVytE?=
 =?utf-8?B?TzRHTkM2MDVUVHZFdDEwSWdUck9sUlBxam5pODVhUjFxMUJMSGJFaGZnbitZ?=
 =?utf-8?B?OGJmMVdOWmtyL0RpVFpJdGJybFhOdGt6ODZ4ZHBkcC95bkdqK3FFUE1zQ1M1?=
 =?utf-8?B?RVd4SnZQMlRnSjJMQnZEZ0NiQ1lBSlFDN09HNXliUEU2V1B6dnJGOE4wUFVU?=
 =?utf-8?B?ZGhqa2pVT1BwRlJVUHJRU0FSOGk0YmpqcE4rSHJvL0JkSjVqQ3g0YnVsd2ZU?=
 =?utf-8?B?N0huMTRETjlXYWZTYzdNd2VjcG1wSW5mZjFPSTFNTXJiSGRrRTNMdDRubzND?=
 =?utf-8?B?aTBuRms1QTh0dnpjVzNJd2xIcTgwOXVNQXBNbUs3ZjFGVy9ONkYvdzRtMXB5?=
 =?utf-8?B?TnBkUjhBVGVpY204SDgvOHN5Z2loYkcwMjNuYW5JaVlWbEJnY1J4L2xkbnJp?=
 =?utf-8?B?ZDZ2U0RSTkNQNW1JWDVtUEVMYjVsWDB0SjhtSU9ZMitTODRYZGFYeTBBRTY4?=
 =?utf-8?B?L2RGb2VHSnppYThDRDlRTGxqYVpmUVRmUTRkUmF1RHRPdXA4ZGpXRUdBZXRn?=
 =?utf-8?B?OHFDTTlmMThDSzF6R1NXYmk4Tis2Uk1ka2ZPYm0rbWdmb1NVU1RqTDVqZXhG?=
 =?utf-8?B?bHY3L3FVRWNpUlRObm9JQ21pdjRFdXJCb1RCaWN5MHZTZEcxSXkvQmY5Q3dG?=
 =?utf-8?B?SGtmV3dFWlNUWWFtbHQzV1IyQkNkSTBrc1JqM0V2WDdySUVNLzRNZ2dGQnV0?=
 =?utf-8?B?eE51WnBpRWVjZVZmb1p0eXQ4dUN2YjdYck9DQmlqQ29FRVhPclUxeXZIVk9o?=
 =?utf-8?B?K3RSVnJIUWsyUWJ2RXhBT0p4c1ErZnlGa3N5eXc2L1ZjVS9iSU9MTGxOandR?=
 =?utf-8?B?RWxGMnlSMG1paE9BdFF4N1FncUp3OFFISysrVmZ6QnpYUDRIVkdwUU1XQ1h1?=
 =?utf-8?B?RzhHZ0cvcXk0K09HSU8xSnZuNkwxZmRxZDE2RW5oTG5LbHNjVnZNbXU0dEZz?=
 =?utf-8?B?M2pvZjFMYmdYZmxHc2krSDA2UGl2UWllRXBkdlpoQ2Y4dExMWGx5YjJPcHJW?=
 =?utf-8?B?MVBxZHR3SUtCRlkyYXh5WTRvY0hjODVMQzlIQXhhSjkwb1RmUEl0OVc3TnNt?=
 =?utf-8?B?dm9kaG9BaU9UOERJejVJdGcyNExxcytQYkxzdzE0MnIwTWdaVmFFbElRZXUy?=
 =?utf-8?B?Njg2UU5QcVpneWs1T0JxRk9YR0VTa3VtbGhYbVVmVXF2cXNKcy96YTh5ZlJU?=
 =?utf-8?B?QzV2K2J4bTYzeStNWWdsZUdWYXkzSWZySzBnUFZWWHphd3phMTFLMDEybzZH?=
 =?utf-8?B?Mmc0K0tMWlRQWGFPT1BXYmRSMXB6RmROQzBFUjFYNVNIV1A5aDBabU1wMU82?=
 =?utf-8?B?bGFOWXZvSzduTjM4VVZVSEV2TGZ2MTRhM0t1cHp5MlNBSEpydWxDYm8xdkh0?=
 =?utf-8?B?MktRVk1RbGxzcjRmNTNKOThlVFZWbTFEcEhEdkg3RWdTUkh2WXh3a3pzbzNa?=
 =?utf-8?Q?P679ihRrpsYZPG5veogj6rI=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec607e7-7d47-4610-012b-08ddafa6b0ac
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 03:01:02.4560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRCtUEbnBWqIjz03Q5zYLZq56w7RyubulKhDSQISY5gvenf+QJrshBocu0bwsoAImxSBA1C525Gu0V6ER+nnU2tk6a66eyL7MsKWMLaKTtjBtsCRVFBaHRkWLjATlDqb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7543


On 2025/6/19 21:53, Vincent Guittot wrote:
> On Thu, 19 Jun 2025 at 05:20, Huang Shijie
> <shijie@os.amperecomputing.com> wrote:
>>  From the paper, the lag should follow the limit:
>>       -r_max < lag < max(r_max, q)
>>
>> But current code makes the lag follow the limit:
>>       -max(r_max, q) < lag < max(r_max, q)
>>
>> This patch introduces limit_hi/limit_lo/r_max, and
>> make the lag follow the paper strictly.
> We don't strictly follow the paper. Typically, paper assumes that a
> task will not run more than its slice r before deciding which task is
> the next to run. But this is not our case as we must wait for a sched
> event like the tick before picking next  task which can be longer than
> the slice r
>
> Side note, we don't have a fix definition of the quantum q which is
> something between 0 and a tick (and even more currently with run to
> parity) as we wait for the next the tick to pick another task
>
> This means that a task can run a full tick period even if its slice is
> shorter than the tick period

Thanks for the explanations.

But if we enable the HRTICK, the task will run to match its slice.


Thanks

Huang Shijie


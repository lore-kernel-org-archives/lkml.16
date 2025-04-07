Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485A222A7E4;
	Mon,  7 Apr 2025 11:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025489; cv=fail; b=Igt3xPPE67BD0LWEJTEPSHrfG66h/QkbxFI7J8ERu47yQG86MsyakMwaWn3u5GlIR3jQfiNQS1MQ3kVrsYqwnWLHeX0DODF9zbIadAEfHluDmGmVaTaV3u3lkkt3ZxR0tAXAKAR4iyQnBwwXyewkD7lCt2TTHFA2yCQ8treVtYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025489; c=relaxed/simple;
	bh=LjrHn7xCRGHMjwpd98cyevnjxam0oEMP/+91Va5uPog=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=obpfuL2ADmykkN4MXfRU0T4dK8tfBImHKUsk5L16KtfS4kgJVTG8KnXaXAItCfICFJNpSw7zZOLg729T+Y6b3v0vaUcrJU68Xdmpw9YzDIiI2O3c/0JID5FkXuDcZSIx1pPfMDk7SupP4+rHX61aZBN97GkXk/YLa3dQuw7ayXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0n110p9B; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0n110p9B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yux7Gw/8sPiPfEu5hP9d9KsNUA6+kMJ6e9OGmuzmP4T5dkWFEtgdQo2bXQ2zM7/RTfDSZWvNDwy2ObA/+1NPUwYG/6UtTI+EKoh4wu1sWxg9FUdr0WGqhszznKILZxZrCOA3I/tXncbEPy5UtDgW1vvb+fn9NiDKw4mNJeFqnpCjERyy8zxN2G9+a7Eu2C1ZTMN8Oqa2RWIZLFKcRV706xlSyuxLi/afYaw6z9eHMfIwy5N7AkSjU8yGf10Iq5sesIdt2ZhO8KWG/dw3SJzq5itoqrsnmQ7CebC8IrXbwVLb/5cOu2WrQ/ZCVtzJZ+nNpCLI3EpwqhzQWdRlKPaDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srRwPK8C/xdg457YyzWfP73j3jZ52yjTDFQG7YF+ja4=;
 b=GoVimvFWJ2ecY/5lHTn87Vh2+fMKu934/Nob+RxgflTKtp5oo2EuJpYyWeS+v6ey96er52pZ+DJNTqmkTwBxXqFd1A2f3yrCeAcoyQpxKpv4OlHRtyyeX3CSBAzZeiA/l8eYhYXAtbv2v6TRA10cmJIXSfCkUP6FrPlCiCa4DIjn2xq3dIzi4LUB1l/L8dJ53fZ3iJ713AOGMwBzigighg+l/L7AyPGxtpGLCXFDtBN4lCJqmHzvTeN4yZh3+3g8wkjj8kdVUciEfP++UGRbydH2oweWSfplCLiex7ZK+Ldj3Yi315tKG4Ne8riW45bKq7ilYjD68QK6PYgirV4S2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srRwPK8C/xdg457YyzWfP73j3jZ52yjTDFQG7YF+ja4=;
 b=0n110p9B2dwf97knN+lrdOfxvAguy66sczL2JVGtz4qDvf5ZF2dipbU+tdsMVlcN0XfAXEtF2gQqT8rXG/GZfsH3Y5gsGqFQxxs267MhTy+A26APCZkeLmfDtSoA9YbIMAXN6YfWNEUBa9kibEKLa6ZmCn25CHBkuupwh6Gbqj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 11:31:24 +0000
Received: from CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753]) by CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 11:31:23 +0000
Message-ID: <cdd4c767-1981-49ec-82ff-2fd685f387c5@amd.com>
Date: Mon, 7 Apr 2025 17:01:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] misc: amd-sbi: Move hwmon device sensor as
 separate entity
To: Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, shyam-sundar.s-k@amd.com,
 gautham.shenoy@amd.com, Mario Limonciello <mario.limonciello@amd.com>,
 naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com
References: <20250402055840.1346384-1-akshay.gupta@amd.com>
 <20250402055840.1346384-4-akshay.gupta@amd.com>
 <af416dbf-240c-4c21-954f-d69420f6bd3d@app.fastmail.com>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <af416dbf-240c-4c21-954f-d69420f6bd3d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0125.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::7) To CH3PR12MB8909.namprd12.prod.outlook.com
 (2603:10b6:610:179::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8909:EE_|SA0PR12MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d30f8e7-2076-4a80-314c-08dd75c7b9e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1RTV0dQV3BBM0tpbnBLa0lvRm91ZjRkZUVKQUJOZklaTk5EeWM5ekM5NUtC?=
 =?utf-8?B?anFNRmc2VmJvRyt1SmlHLzVxaHlkOFlxbEp6NEE5RVBVaXVtNlZpUFVyc3ZZ?=
 =?utf-8?B?NUoxTTYxMkd6R05JZFhjVS9YOU5teFZ0dDR3cG9iaGdkL2Z0cXB1N09nRGdD?=
 =?utf-8?B?MUliYmJVZHdrZXUxYUtQSEx5RUNQY2gzRkw5MmtmQk1zODJ5cHJrd2ZkSkFJ?=
 =?utf-8?B?RlBxd1BUbFhoclRiZW5QR0FDOVlueStQS3d6WW9aY21PSTBFekRDSjhMZmNG?=
 =?utf-8?B?Ky9zRnJuL0phK2o3LzZSWEZCY05IWUp2OXRTYVUwME9iclJhOWZjS1NDR1lZ?=
 =?utf-8?B?T01kNHViVkFVMzdwbDdDbGd1ZFk3L3ljWjVXMFBLemRXSlpkVjA1ZGRsSEJr?=
 =?utf-8?B?ck81a2lTeTZiVEdPMVhwYmR0aTMrTjBQM2IzTE05UFpSbTFPa3pPQmVGV2ZL?=
 =?utf-8?B?U0FhcUNlZmVGUlpQaU1EZHJUdm1RWS8wTVBUSVdDbmhySnZ0bDhaenhjd0xH?=
 =?utf-8?B?cnQ5Qm1tdEQ4R1IyYkhJRHgya0RMbW56ODdmc3J2MW1YS1Y2d1RGQlZ4N1ZZ?=
 =?utf-8?B?QlBuY3l1WkgxL3pjMWFWRHMyWFRWbWpLVkdtTWZYakl0OERvcTVHdE00b3JT?=
 =?utf-8?B?bTh1TXMvWVdtRmJ6ei91TC9yUUhoSTZCd3Zyb3pVMGVsTTh5TE1NMEFiNDNP?=
 =?utf-8?B?ZXg5OVBzYjc5TkFDVzJvUWVTL1dRcUEzcndkQmxFR2VNamdqTEdrNzBTV2ta?=
 =?utf-8?B?QXZ2YkxaQkIvSE4vQkNIVFU2V1hMd3B5dHVneWpBSk9wZmlLV1V0RkN4WGtP?=
 =?utf-8?B?TWdxdDZ5TmVabDR1MDBKUXJUMzlhL1kxbFRMNDhlQzFYMXh5THlXU29ObzlE?=
 =?utf-8?B?VVE2UWh1aE94WW1kNnZiS3dHeUpjSWZKT2xrSThzMHM3V3lsQ1pGTEZzdHN3?=
 =?utf-8?B?bHd6U3FobmdSYkxyby83US9xWVl5TmNCSXhzMjQyRkVPeFVJTFpyQVJ1dHhy?=
 =?utf-8?B?MnlvaGFQd1FVUVNWV2RGM1E4ZWE4M3M1d01kWEtZZXFza1RkSTN1cE95MUVm?=
 =?utf-8?B?ZjVNUmpYMk0rNmowRXR4STZ4UGlTNVBCSXZsZDV6TEdpNFhMNmR6aG9sOFdM?=
 =?utf-8?B?cy9lejRUMXZZRytES2s5VWdLakVPckF6bVgyUko5anFreU9OM2pjVE43Smp3?=
 =?utf-8?B?NjVyRWFYZFBxSExyOEo0MUl2YU5tK3hiR01QODJGQkprbDVGb0NDZHlublh5?=
 =?utf-8?B?Tld2OTJweTlpMDAxdStLL0QrSWl1QWovSjQrRnRTZGwxVHRCeVJCOUlmV2JL?=
 =?utf-8?B?UVpLMFN6OU5ERDFZOFRoUXU1SFRWWkl5ajVXQjNmbHZoWUhqbU44YzFRRW82?=
 =?utf-8?B?dnBHT3piamRTVWlTeDJDckdyWGpMd2gzV2pkblZndlJvZm5WNnlydEdqV1c1?=
 =?utf-8?B?d3ZkckNLM2UzT0ZjeS81dXp6dGRZQ3czYTZTQlVTQUdHeDJCV1JBOGRmV0hJ?=
 =?utf-8?B?T21VZnhwQ1NrbUNZM2VCYmF5dnk2SkxFclAxYy9qamxVYk1ib2FaWU5ScTkr?=
 =?utf-8?B?c2pibXRZYktDakpVRGVXS0NZMFJMOE45TlBLaHc2cURJcEQ0a3NpNFRMOWN0?=
 =?utf-8?B?QXhMVVBiVzBsNGsvVVhOT0hDY0RRd2g4ai9iTGdoMW1TOFhhV3FIT2RnM0JU?=
 =?utf-8?B?bXExTisyVm9odWVSSzdIRVFvZ2N1UWpKeVV2aFRxQ0RtZmo0Q2lURjdUQkZw?=
 =?utf-8?B?YW11QlJ3S0lwOW9RV3BZeit0azVnYnVVaWhkSzl4WGpETDhrY2llVHZpOWwr?=
 =?utf-8?B?by9ZYnZrQ3ovaklsTEFGV20rV3cyRGdQY3hkbU9XZ3BFTk9UdTZuNDlRMnZW?=
 =?utf-8?Q?dbu+N0jHC0SyM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8909.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDFhckw2eGlwR2xoOVBvV2NJWlNZZWZiSXhqUmo3eTFFSVZIdFUrQVpvTjJi?=
 =?utf-8?B?cWxjSU5qNkd5ejRnZHhKeVlsKzhGWlFtbTdFbG0vSUR5Z1ZENUR5Qjd5a1lC?=
 =?utf-8?B?a0E3OHJ2WWE2TlZlS0hoM2d6MC9YMDZaMllIdUhQMVErRFdYSmhNSFRBT2pB?=
 =?utf-8?B?R3liLzhwTXMzVm85QVVzRUtTMDVuZmlaVWhPSEl4d2pJSFoxejRuWWNhWjVn?=
 =?utf-8?B?dDdNaS9GTmFsdG9WbmhyQ1A1V0ZyWWpPL1B6bnl3TjRiN0Exa3pkZ1BPSC9N?=
 =?utf-8?B?Q0ZCRU1GeHViYklaemROM2I5U3hzV20wdm1aY3BkN3lrak03Um9EZ2ZxRTNl?=
 =?utf-8?B?OTVPQzlIUGJ0SkhMNXN6eHJhZ25sazNvdUxFUFNHYkV2MWFacGszeFVhMThW?=
 =?utf-8?B?c0pmbkxkMk4xNFNIOEw5Sk1PUnQ2ci9QUC9UdUpBQW5Pa0svbHJubXJKa2Er?=
 =?utf-8?B?Mm9jS1lvR0J6YUlSL2N4enhHZDhNMmQ1dDk0V2FVZnFDQWhYREZjLzlaaGMw?=
 =?utf-8?B?bGpacWNSY3g1RURFaFRrbjU3M3NONlhraklzRGtjbnRHdk02Nmd1bG1mOUdm?=
 =?utf-8?B?OHNwNGZIcFJzM3JOWlRrWDhub3A5Y2xnVmh1WFd2bStCOVk5ZnVJbVpZQnQx?=
 =?utf-8?B?aVdnZHc5ZHdDSmx3ckdzcnM4TkhEb3hTMHBybEl4S0RtZ1I5aXowQlBrMzk5?=
 =?utf-8?B?ajNhNTJUQ2lneTNsNWhzYUU4MzhjbnZHTWtXNG0zVktYbWxOSStaVkpkaVRN?=
 =?utf-8?B?STlIZTVKZ1NveVZHOFFacFk2WS8wcXAxWTBlS0NOWi9tTnV4YW5kZG9ReCtu?=
 =?utf-8?B?VUhtNUJVMHpzSEhmOXJxditnRWlrL0V3RW1Mc2FTamNjWStPQXdVWUY5T1N2?=
 =?utf-8?B?UlJNNjhMcnp0eFhTcTRqL0RYQWQ1dE5UbEFRMDJQbXJ3TCtEeWUzOGVxWG1n?=
 =?utf-8?B?bnFOZEk4L0NWMTVrK3I1TTZpeXFlY3NHYzBIZTZjbzQ4NUQySGdQT1QrbmNG?=
 =?utf-8?B?QmExL0I3cVJlSVRVMi92c0ppUFlQYzBuSGRDc0dNd3lhWWlrakI0NXVrZUlU?=
 =?utf-8?B?eGpBSldROXBzRkN5MkhHUkxnM05oS2swUzBUWTBtVHFoVGxvRzNEQjgxaTFP?=
 =?utf-8?B?TzkrbURGakszOTlaOXFXUHU5TFVTRzRtaTVWZko5L1JpMGlHN29IN0l0OXRT?=
 =?utf-8?B?ZDRzTjJHYllhU1RVOVc1eXBIS2ZwNXZtc3gvTnhJWVZjSWhzNVZoNUtCTWpm?=
 =?utf-8?B?SW9WZGlCMjVTTW50SzdRRmE5VVVKVy9la3lScjh5aStDUjVSQmZQY1pndFAy?=
 =?utf-8?B?NjV2R3VVZnQ5R2l2Vm5LOFk1bDQ4Y1hWaUNmN1BobXpXSnVpYnIwOGhxd3Qz?=
 =?utf-8?B?ZXJyQWlLVThZZVdKK0Q3Zm9LVnExMmxYdHV2VXFBbUREZjlrSHhmN29jN1BJ?=
 =?utf-8?B?by9KcTRqVkIwckNaaHAyWHl2ZkYrQ2s2YzFkekZ3Q1pZZ2xvSm85ZktGUGxR?=
 =?utf-8?B?QTRHZTFmd0J0dVdUdjdFOVdPREhTNnYwSlE2ZlU1WlpodDkxeGpVUEEvTlhK?=
 =?utf-8?B?MzhRUm5xNGttdmQvaXRHMzFtTDg0SHpHclc0TFJnMWxJRFFSM0xGaDYvaEJ4?=
 =?utf-8?B?NENpOGVEM01DeUhkL25ZQy85S0FPZ00yaDZwdkIzOHRRNmREemVDaEpreHUw?=
 =?utf-8?B?RzFNbURVcTR4YmVtdzhmVys1a0tGU3dYcDRXL0R3am03RWtqcS91Y0pqVVI3?=
 =?utf-8?B?MHVBQktuYWN0aHExVUJWdk81Nk81OGVtNHh1bkxINWRsQS9FYnBvb2lReGtp?=
 =?utf-8?B?WXd1WEkya3MwYVJlL0h6M3hUOC9HOUpuSTRCRXdwWGh3UHFDa0EzZVQyMWVn?=
 =?utf-8?B?dHJweWs3YXhCR2FiMEJpV0trc3kxckJOZmdHdDh0ejg2ZlpsaThPTUpIeW8x?=
 =?utf-8?B?WnppNWF5UnNWWlR1a3U4RUFrSy9NWHd1bWhzb3VjK2lGQnUvMC80ZVd3RjVm?=
 =?utf-8?B?V0c5cWRtQlV1a3EvaklLWFBLNzFGVjR2REEvLzBwcmtmekRFMmZKaUhOVVlh?=
 =?utf-8?B?RmVTVFYrWWdQNXk5ZENOUnQ0aVUzQWVuVkJFRXRFY1U1SUsxWkRhMDcyUVYz?=
 =?utf-8?Q?X/Zg45/S1DzCk0eq4TZdh357F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d30f8e7-2076-4a80-314c-08dd75c7b9e4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8909.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 11:31:23.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuDEZwkrMra8aON6RMz0tJxFReGQnvlmhY2Tg6gUO9UCuB1piCrfGSaLaXXb9MsOaifpfLdtdmI7Vx8ShhiOKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493


On 4/2/2025 4:33 PM, Arnd Bergmann wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Wed, Apr 2, 2025, at 07:58, Akshay Gupta wrote:
>
>> +
>> +int create_hwmon_sensor_device(struct device *dev, struct sbrmi_data *data)
>> +{
>> +     if (IS_REACHABLE(CONFIG_HWMON)) {
>> +             struct device *hwmon_dev;
>> +
>> +             hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbrmi", data,
>> +                                                              &sbrmi_chip_info, NULL);
>> +             return PTR_ERR_OR_ZERO(hwmon_dev);
>> +     }
>> +     return 0;
> I just one more problems with this bit. This was already in the
> existing code, but should still be addressed:
>
> Using IS_REACHABLE() is usually a sign that the Kconfig dependencies
> are wrong. Fix the dependencies instead so the hwmon driver can
> only be enabled if the subsystem is enabled. You can either add a
> separate Kconfig symbol or make the driver 'depends on HWMON || !HWMON'
> to express this.
>
>         Arnd

Thanks Arnd,

I will create a new Kconfig symbol for HWMON changes to enable only when 
subsystem is enabled.


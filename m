Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111D245022
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361353; cv=fail; b=mezEp0hrjpkzowV04qGMKpJNgtaYXiXau29ZgIQu65K1esBbQaCRHiRxclxMfGWVyCsA++zGSzy2Y3RKOk05ZnEU4bLdCjnb/O9KhuNYNB0jJenSn6tbteFPcxRWyd45H0+4dl5Ppjcz+1HfvHxa+1bHt2LtXzxed89DjnyYAb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361353; c=relaxed/simple;
	bh=yzvAnH7KKs6N1FYnYPmIjzvjZMEvgIwoGxl5XCL1w4g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B/Jphwy7f/npZQ3lZQTDTMAAf+4YzaIIimVoET2gJYtEmv6ZJDuUT30Ls/wuzU2bBrhpuk81Q82JU0A8DqV6T9qhi+l2W/o09t3GLn7p91WilW1V2pwI5LKSbWqky6f9ZVx/DxDlhekKqb6XlenxlXBTah8gVBWfEgxthFlhof4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=htlenZ5Z; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="htlenZ5Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIFYMf1z0pqmAIVI/ATegVCas+PrZMwN9DUs8tqajq32YgW+nNq1sS8/ZuLMDpIDTyAMj7FkSsVQqxaWcZkqOE2dnN/Zc+oWXCvbn40E45vzE6Cf9dm4BaROJGkb5hb/K2XzxJQ9ePpw4iVIfqBr/uFLeKHmCr2VokmrGnlj5bmqNr1P5mIt8n3t3BbsfeEgid6oMy8h2fljxBoYMgs96VEJdl4EkhUj+zHyJimSNooY7ETieMDneuItreka9fmgTD6h1O01MAc8kD3s0dkAYWR3hdHjtN2D0razsn0J/hwzoDGS2va/ETDMicX5cshRzZLdO6+fMZUCvMNaVJ2uRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jm6qiUES29Gwl6HplJ8Q1GSMogvsXx7bOkiyrRDoKKw=;
 b=r9Kb+bCytzoz6XNSBBGtzrrucEHeCQgGcXO64YPQOjpxBSauWvAzNvuZKKFhuQDLNu1lJPEIU+VHrVnwIPdjLEqTkMPatPVmMIq7VyAEYoPaUK1P4GIa1HrIBOc646iClSlhcbDDDCFilVD93D/FzN9+LVFx2ZoshgRIkmgji4JNOFtGORgVQ0Hp4ytqM631A6PAKxDR7ScibfZNg9TtjfAmkDMuTeKL+RheczzAbKj3ZuDDlFMwU3DfhJ12Yop03CjaSZo/iigYY92IwOiB08woSlwwVRVmtuYMfkiGJuILyRrSH2UebcxAfxQJr3FiBoIzmczJb1BmzSuCYyUjkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jm6qiUES29Gwl6HplJ8Q1GSMogvsXx7bOkiyrRDoKKw=;
 b=htlenZ5ZjcVcnBLp5WuWrzzpF4DP6HL2+Gsq48qlqjTDS8QXR4pV/bbFBSmGpGVeFcRPLcCPEO78ELvlll0QJVmFMwN7ydaE+JPs7GDLiB+oc5hf/D2KQVCZNDmuy/zPY6VTtSb72vyQn5vdKa7C9FDmR5aVOK5SUpWzG+I7Gr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 by CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 09:15:48 +0000
Received: from CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753]) by CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753%6]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 09:15:48 +0000
Message-ID: <ca4fe6d8-4a93-4b44-95d3-3e208f875f87@amd.com>
Date: Tue, 1 Jul 2025 14:45:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] misc: amd-sbi: Address potential integer overflow
 issue reported in smatch
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, shyam-sundar.s-k@amd.com,
 gautham.shenoy@amd.com, mario.limonciello@amd.com,
 naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250701054041.373358-1-akshay.gupta@amd.com>
 <2025070125-ice-outbreak-3e02@gregkh>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <2025070125-ice-outbreak-3e02@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0033.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::11) To CH3PR12MB8909.namprd12.prod.outlook.com
 (2603:10b6:610:179::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8909:EE_|CY5PR12MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f03180-3312-4d5a-8b89-08ddb87fdda9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkYyMXVEM3ZIU3I0RFIzWmpPN2pBMkZoeXRJK1MrUitMbmxyR1FxZ2liVnNB?=
 =?utf-8?B?cDRUNHR4alNPblVsSy9qcTN5amljVEpjaHNmYjU4R3pxYlFuYlBxUStuSnhT?=
 =?utf-8?B?bS9VNE5LUDFocklPMDFLOFFpSENrTnM2VEp6L2dMSm4vQWdUTk80VW0reEpE?=
 =?utf-8?B?WW1pSlpjaWlZY0ZQZ003by9uNDBUdG5zS21GMzFuc012WlhWaGZkQWRTWlFX?=
 =?utf-8?B?d25yQ1hBL2tqb1JNWWEvOEM1Y3FKeDVGWWVVUk9pamlzbDE1OFJMU2hCOXoy?=
 =?utf-8?B?N2xybjUyZkJjcHI2ajZlRmRMOXNKbThZMWhzQzlqUXVST2tKeUJlUi9aZlZD?=
 =?utf-8?B?SXlCNXljZ3BjOWFBeFpDcm4zbUNjZlRST2JnbW96YVdLeGN1empYYjBtazhL?=
 =?utf-8?B?RVE0dU82OTV4cVEzQkROTFBtYkJQeCtZTkJjdFVrUlZ5QlNtdjVTY1FSdFhY?=
 =?utf-8?B?U2VtUGxQZllUVlMwL2drU2NSWHN2Smxnb2xRWC9FTDQ2TUFXbFdjUmJQV1ha?=
 =?utf-8?B?cFJEbGNzNSt5ZVU1V2V1RHN6QmdoWHZYNlAzOTRCWnRxaVU0bkUyekNqSDZV?=
 =?utf-8?B?MHlpTGswWEtGNHF3NHV5NTQ0SnRWaXR0dlhITE5rZVQxL3E1QW8yV3l1Ym5a?=
 =?utf-8?B?QkFMY2dQSkROQkU2RjVyd0RweTN4LzlEamxySXhHOEpPMzZlVkxtdTI2L3BF?=
 =?utf-8?B?cFJpRWVHeHRxbklkSWlVdi8renlZWG4vT1lUWUxpaTBvcDNlREplY3J3VVRW?=
 =?utf-8?B?aGR4NjJkRHdDRHhVY1FRaWs1QVhQM1ZVbmU4VnBzdEV1MzdxUDlLUFErcmk2?=
 =?utf-8?B?V3lML0tkamNIUjJOamZFZENQVWVaTlEzN1FXZ1ZnaTRlYVc3cURtSFpWbHJy?=
 =?utf-8?B?Y0Rlb0JpS2YzSjh5ZmZ1OWpnSlZSU2hSV2t3eG03RDJPNmFBc09BY08zRTRU?=
 =?utf-8?B?dGR6ak5ESXFycXdVZXM2M0Nlc0MyajJuajR0SGJOZHRKVTFOQ0czU0tSdmRy?=
 =?utf-8?B?SzlOa0NSbGhYNWJQakF5NlhFUlN1S3B2OElJK2Z3OUZIMFB6emVoaEtUTHhn?=
 =?utf-8?B?ditVaXlpN3V2L3ZHWm9WUjR1eVJ5V2JmQmdTSU4xaG90V0ZmekkyZHJiMm5M?=
 =?utf-8?B?NlU3OUluOTRVRFhoQTg2M0xNZmczcGZHZE90aUM4NjlZTXQycUF3TEtrK3Ro?=
 =?utf-8?B?REMxN2tDMHo2S2JqWWs4MlByblFaRmV5SWJSNzNZMDRhcGw5eEtDYXc1NkRC?=
 =?utf-8?B?Mms0aHI1NlN2N2V2bGo4eWVRRlNXdzMvekc4WXY4U0NuejNhazhKeVJGMlFw?=
 =?utf-8?B?Sm1kTG04QmU0dlBtRUpUT1VLaEVibFlhY1BDSXdkSDIyTWFvMCs1T3hqYkkr?=
 =?utf-8?B?VHJGVk9mUUFUMlcyb0VNaEZ2bkZLczZyN1MrMmptZlpCM3VMbmhQbkNRa2NY?=
 =?utf-8?B?RGFUcEtvUERnM2dBNmlrZFNrMmR2ckI4T1VQRndzM1NUMHg3Ym4rQXU3THoz?=
 =?utf-8?B?VC9CVlV6M2JaMWpuY2dCblFnRktHcVVFQ1hKdXVXLzB3U0pNbDlaTmVsMko0?=
 =?utf-8?B?cFJaQWVFZHJvK0xFZ1JCOVNhaHdXelNEd0xYR0E5ODZvZWdjTktxUEVhZFps?=
 =?utf-8?B?Tm8yT1FmcmdVejdtQ2VVRkhCTVc1U0xmQ0prTzlRWU5oZ2dEdFRhUHRPSVJF?=
 =?utf-8?B?YjJWZUhobEo3d0dSNnZ6RUdBUFFUQXVvbEVzQ0NTNjVkYjRIcVFhQzNOREYx?=
 =?utf-8?B?aTFjaHNPWFZEVXJCSUZkbFhVeEFIREhWdUY2Zk5NU0dvRE8vNFRiNHErWE1k?=
 =?utf-8?Q?x50ljuYh0nkiAwCOXzoP7nki2JyWZPNk5nPZU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8909.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWJKWkh3Ny9FS1dvWlErVzdzdTJWczhHengvUlhBdWZGSW9qVWJSQ3JtU3o2?=
 =?utf-8?B?TUpZd0xvVTMyN0trL2F3Y1VjZWtsOUZieTNDSXQwUnhtTm9xL2VHbnptYVZi?=
 =?utf-8?B?K2Jla1VobWhscGN6MGFXMXBWQmxhQWc0YVc1Um9mY3lRT1RYelRoR1VTUXB0?=
 =?utf-8?B?WE9URE5JRExPSzVVYno0YlhXYnRwaUVNQk5UZEMxUnZBZ25MV2h3NktsM1Bu?=
 =?utf-8?B?VUtVc3pZQWtWMTRYRzNQV1dRRGFXSXpOVlRURGF5MG8wM0I4MnJQalJTYXRZ?=
 =?utf-8?B?UFg2NStGaHcrUzNtYnBTNWNkT1RNYndJcktlSnZrNlhyWjQ2VDllc2ZSUXNB?=
 =?utf-8?B?VWVGRWw0N3JMZDJBYXpWaUI5MnFoeDlhWFpLZWxFM1hJNStISkhIVnFmN0xT?=
 =?utf-8?B?ZWRabDV2RVA2VkFGV2hVNURKY0hBMDJwcWppeHRZQmJkWXppTVBMK0FBMTJi?=
 =?utf-8?B?ZHEvcXNsYmorRWJrSC9LQTFsdXJWVmR0N21QenBsdUlNbm1HWUY2OXFBUFRP?=
 =?utf-8?B?YjdONGZ1dzMzL2Y2cXlQK3lRVnZzSHpBcnNWaWN6OFpiWi9ScUg0ZzFLM2I1?=
 =?utf-8?B?djlOUmZBSURXbjFUMGw5NjBDSGtGcUFaQnliNkRsQlhxOWFGVmJLNlZlcWZt?=
 =?utf-8?B?c0ZDMDBWUWVaZkNSMS95SndydXcvcy9EOEZZVlBYSUpJMmdDSWlBME1tZ3FH?=
 =?utf-8?B?OTI0WTZaNXZvZFBwSVRSUElJZTByRVpoMnZqTzkvcVkrVWplK1U4WkNnTTgy?=
 =?utf-8?B?dGR4elU5U2Jya2thRUY0dFpoM0JuNzlKak5hdHltbEFZS3ZDODYzaGRPU3k5?=
 =?utf-8?B?eFpodExmRUgwOFB0T1dKcVBHbWszTTRLaFNnVmVvNHNGemtkTHhHeHExNlZ3?=
 =?utf-8?B?Y2ZJTng3S0Z1dXBEZXVKa0pRTmZQMlZtU3FnRVVlcWU4bHdZR0hKMjhFQUYz?=
 =?utf-8?B?b2JOdUxmbUxwdDNiaU5WQlJMK1c4aWh1NHZha1VqVmIrVm5pelFJZUJubm1h?=
 =?utf-8?B?ZWMvYXFNbEpKdm1OZDRGbVBQS0FtTmVrbUhMbjVpdmZaUzhwNmE2UUlGdVRz?=
 =?utf-8?B?QzVFWXNmTnVsS3lUS3ZoNUJtS24xYXowRHBLQ0RCY0wrK2k0d3lBbmkweFZn?=
 =?utf-8?B?VEFNeGpUeWNEcHBnY1haKzkreFR0c0grRnVaeTl6Rnp1VnVOVDJEL0UyWDFI?=
 =?utf-8?B?RkNXcEp6YkY2ZGl0RWJJbmQvN3FxdFljaGEvdjV4S3lsM2JqQW9kcUZGeXlS?=
 =?utf-8?B?OEk3QUZ1czZIOXdJbVA2cmpUSWUxREVpc3hacURlaVhMc3hiQ2RrdEFCbU9C?=
 =?utf-8?B?Y1hVcjFpdkx2MlFsdjhscTREODNGaTkySUNnSmhzQ1NOOU5RQWI5VFljeFlQ?=
 =?utf-8?B?NTdDUHQzVHcyVlYwa0JkdlR3c2VUN1lwd0pCRnpXVDA2a2dmeW1MbG9XOEs4?=
 =?utf-8?B?Z0tmbVR0ZWd6VzZpWnpQTDM2TGpiRjNOUTVSaFFkVTBPaFVzWFpXQjRvNXhi?=
 =?utf-8?B?SHJEZjVlNzNMN2VNNFJrY0pyMTl1bkZPMjFIN3RJNXR0Z2pSUmpEWGxKQkJJ?=
 =?utf-8?B?SmFVRzZIOTJ4OHJmSkUwbWZMZWNZZ3dCc0hUUUcrbjBLaXVEd0MvKzd1NXBW?=
 =?utf-8?B?ZFRCL2d6VDRZNHFzUERLR2ExUE92eWs3bW1ZM21zQUNGTDczVjNiK3RiNmM0?=
 =?utf-8?B?c1RUejBCcEdaaWhhcHYvWTlNSWcrR25pTzFpZk5KME9uUVlDTElxTld6VXhC?=
 =?utf-8?B?Z3ZpVEtlZ3lMQlBvSHhzcVBLenk2V1k4VlM2d24zcUxQQytReUtSanFOTjdj?=
 =?utf-8?B?WHd6Q0NZR1lqcVorUE5BdDhqSW1Eb2ovMFBCdEZmZk1XeGRQSkpWdWFhUlRD?=
 =?utf-8?B?RjkraHp2V21CMDMyOFNKSkkydUhLbVlET3Q4VE9BcVBkdno5VEtlTVRKeEdU?=
 =?utf-8?B?R2ZrZlpUTWgybEhtQjlqUFc4UWlYanR4bmRobk8wYlk5dUI4cDM3MG1zcFR4?=
 =?utf-8?B?Rm0yR1FWOTZlZGVOVVNFbjdrNE5nVS9UbTJ2UkNZRURIYnN6eDB5MzVNc2dh?=
 =?utf-8?B?RVdxdFlQZFY3MHdPNm5KOHkvRUtIQURUTzZUeG8rUU1Kak41YlJZRG5nM2F3?=
 =?utf-8?Q?0Nzik0EZevPfsD7HeBaPNPLlD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f03180-3312-4d5a-8b89-08ddb87fdda9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8909.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 09:15:48.0297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssgr7JpEofsGRVgp3tn9qGEDC0Z35XuQ1yM2zGQfPUwoNnZqG4ku7jVgtBQTkU4imfdH/fGRhAOy5X6Z6HgYUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6478


On 7/1/2025 11:19 AM, Greg KH wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, Jul 01, 2025 at 05:40:40AM +0000, Akshay Gupta wrote:
>> Smatch warnings are reported for below commit,
>>
>> Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
>> from Apr 28, 2025 (linux-next), leads to the following Smatch static
>> checker warning:
>>
>> drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
>> drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: potential integer overflow from user 'msg->cpu_in_out << 32'
>> drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
>> drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: potential integer overflow from user 'msg->mcamsr_in_out << 32'
>>
>> CPUID thread data from input is available at byte 4 & 5, this
>> patch fixes to copy the user data correctly in the argument.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
>> ---
>> Changes from v1:
>>   - Split patch as per Greg's suggestion
>>
>>   drivers/misc/amd-sbi/rmi-core.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
>> index b653a21a909e..3570f3b269a9 100644
>> --- a/drivers/misc/amd-sbi/rmi-core.c
>> +++ b/drivers/misc/amd-sbi/rmi-core.c
>> @@ -42,7 +42,6 @@
>>   #define RD_MCA_CMD   0x86
>>
>>   /* CPUID MCAMSR mask & index */
>> -#define CPUID_MCA_THRD_MASK  GENMASK(15, 0)
>>   #define CPUID_MCA_THRD_INDEX 32
>>   #define CPUID_MCA_FUNC_MASK  GENMASK(31, 0)
>>   #define CPUID_EXT_FUNC_INDEX 56
>> @@ -129,7 +128,7 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
>>                goto exit_unlock;
>>        }
>>
>> -     thread = msg->cpu_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
>> +     thread = msg->cpu_in_out >> CPUID_MCA_THRD_INDEX;
> So this takes a u64 and just moves it over 32 bits and then does what?
> I guess it makes sense but how did the original code ever work at all?

CPUID register data(leaf and sub-leaf) is provided to user for the input 
thread.

Previously data is return only for thread 0 and not for other threads.

>>        /* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
>>        if (thread > 127) {
>> @@ -210,7 +209,7 @@ static int rmi_mca_msr_read(struct sbrmi_data *data,
>>                goto exit_unlock;
>>        }
>>
>> -     thread = msg->mcamsr_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
>> +     thread = msg->mcamsr_in_out >> CPUID_MCA_THRD_INDEX;
> Same here, was the original code just wrong?
>
> And if this wrong, should this get a fixes: line?
I will update the commit message to include the commit ID and the line.
>
> thanks,
>
> greg k-h

Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BD622ACCA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303787; cv=fail; b=b3fYCqgvhhPw50PprNfgK6QLjgt7/eb8BdeBRPqGhuPu1g8DDuZGD5+HF2HP17RBMYxXFb/btWaVSAYv+k5RfKbC3wqV6TwBji77oaAz16DdgfefNsahwq0VYRykcAzsLEJjsGhxGr08Pgc2QJnkshCqYYM466q2SjjPCpMV/kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303787; c=relaxed/simple;
	bh=AnM3qXJFt+IUEeuVwa4X17ahDfJjxheaVqMiZ2Z0UQM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cMSeLA2cjvw6fGBeqzHCf+0mWtGAB/2CQ8y6VVqDX62vEjEqVzEBC7etrnBAu0k6mOzNkms4XAbqgHMwHdHXGadyDTMJJcpsFrDGs/5olcrGaCKJbgRWdO3MD6pI4GBLXPUnsyo4HJLRjNEyv/6M7+9A1SMQF07fM1qMd8H2oL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ACquhBlT; arc=fail smtp.client-ip=40.107.100.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ACquhBlT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMWLtamRR/lhAUNZzILyYUJrAAzMTSz6WBYz1QdHWPzOsAZw2+FxWzOUQYH2hbZarZlpk77tD6MQU/qXDkCvZrV8i35Y2c6rCfJU7VI9BRvYZovwoKNQDJrir8axg33DZW6t+R/QSO8IId/HFcvdr0WVBsdzFK4qwF/nKMwnqPnccNH3ykHOsyd3lRPnU/6Qzbf+8O1T2CzmRfq0o1l2EwwXWbJIwslm1VHenk6UuaUGbdwqrlgQI87X46Qxutg1xGR4sOmanfDt0Avo/9+x7Tk8uMEB0gvIwDktdA10nN6NYEnq6lXlktIvdaGp0pFLhuwfMxmwYG8jW2mWYQysZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RF3zZ4k5GRA9zuEfxqvUknE4zGaRxdLPDnhS/O6G2w=;
 b=DtG5RHMvXvEmBJG5tg7nmtqMU0f8IrlA7KbjIeasxaNsGRv7bJkOllztvuirSFFq8SPmZa0WJsBrebgTAgIp/pt0k3AAB7zQ9FWODMFeqtYyIxHN6HW5HhZeizqgX2yrLg1ggvLFs0M84SSJXhlDmX83/B8okKKULEQEUDJAluNlgyEcjNxeaFfwI8KDrQNy7wGp/C6mDciMU6aIFxdSMEtKX0X8H/Fly9TgtRp6BlxYg5gmjckiAS3gFN3pc/sWVTpbn9A2QbNyhY+rtWM9W94Z+MvelvpwtaFtV4AYJRoRluFBPKBJXnuV/CooNQD+sXZwXi261DPOglaW6yL3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RF3zZ4k5GRA9zuEfxqvUknE4zGaRxdLPDnhS/O6G2w=;
 b=ACquhBlTPExYK4xc4FQ3JD3G2LcNu0FaeO2kzxj4/QaRU49muZg2DYP6c4Hb/jbRqn6kpddmx6oYkCx+bPWjeuY5Puu8g7yJi0hDHIR27IqVnCTnrlL0qsnrmq/mWipyNSzCaClM6M2Uy6BMwAzhI9LACwBOrOgE6NkRV8rdxHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by CY5PR12MB6060.namprd12.prod.outlook.com (2603:10b6:930:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 06:36:21 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8655.025; Tue, 22 Apr 2025
 06:36:21 +0000
Message-ID: <2c74c021-f985-4cfc-8369-57fc525a8070@amd.com>
Date: Tue, 22 Apr 2025 12:06:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
To: Ingo Molnar <mingo@kernel.org>, Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
 luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
 rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
 jon.grimm@amd.com, bharata@amd.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com>
 <Z_yzshvBmYiPrxU0@gmail.com>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <Z_yzshvBmYiPrxU0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::18) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|CY5PR12MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: b1566dae-b22d-45b8-c000-08dd8167fede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHBrZGZ3YjR1TU03NzlpYmNDbmFkYUZncFh1TDBJNEtlS09hYXJHVFVNOHdm?=
 =?utf-8?B?cU5SbVM1NHZiU2xETzlHa1J2TjlKRjJKaGp5amdNK3VtSVlDVXBpdHJ4allm?=
 =?utf-8?B?VjBlZGdSbFlHRlJiK2FDVENDMmJiVUFCVE5NL0ZmT2RKdkM1TTJwN3JZdFdz?=
 =?utf-8?B?YkxPR1REZE96b01zTy9aaG1wa0d3YmFYcHB4MVlReExEUWNRUk1WK0t0ZzdD?=
 =?utf-8?B?aFV3S0VVRDU3MW9TY2d4aW1jcFd0VmxuZHgvY0d5ZHFnKytXWUtBeVRwUG5r?=
 =?utf-8?B?bmtocURtV0tLdWlRekpLN2FwcVd6clFlSUtRSDVjSEdVaUhKcndmQ05PMDB5?=
 =?utf-8?B?R2Z1L1p3VVpLWkNoVDRFc2N3T3VPQ1lzMnZuZklGTkkxd3pJa3BmVmVzK0F0?=
 =?utf-8?B?bmxIVTdsYU1xbWJLK09sdm0wMXJmdlNqT0IvNTV6L1dZK09PZjJ2NmNBbXha?=
 =?utf-8?B?dndnemx4RFFPRk5PZVJRUGNiUlBqWllkT3ZGN3FiTXdrSXNtbGFmNWMzeGRQ?=
 =?utf-8?B?S2sxTlQ1cE9RV3licW1hbjVnMVhjbHhiaW9vbm5ramxRTit5Y0phWVRTb1Zs?=
 =?utf-8?B?SmpyY2JDWlM1ZElWVnp3TnpJLzg1WFVvbTBwc055cDFCQ2RnNnNZb1BPcWoy?=
 =?utf-8?B?U1lsM1JtMUNFZm9JZ1lXWjl5cVorMXRVaHN5YXRSRGVFMFZXbTRUY2lCZkgx?=
 =?utf-8?B?aVlZaExHd0ZLUkgyUkJOb3NhWDM4Szl0ZVJWdk9ac3RDVk5abFo4S0srMTJL?=
 =?utf-8?B?YUpPeUZjMm5ZcVJrWE5mbndzY1JHdFR6cmtEV245TDFUSHp2Ym5pTVg1TkVu?=
 =?utf-8?B?a3RWK2pWRDhwMXA4SnVnRlJZNmtFV0pKU3NFcWtZTXY5Y0haWEp2ZGlUeEhB?=
 =?utf-8?B?VnZNa0U5Q0x2VWRPR0QwaXhKYnBldWllWVFlTzlxTlF6TFRERmdlUUZ5V2RD?=
 =?utf-8?B?K2E5b2NwWm1HMlRxaDBaaHBER2NnNWE2UnVHdEZSTEFDMnNiVklYdVF4aWtj?=
 =?utf-8?B?SnVsZTVEWnBoMG1QL3JNZmtDNVpDNjlMb1lJZWwwMEpJd2h5ZXhFNDlXY3VX?=
 =?utf-8?B?dVU4VzMwT2RQamVuWTd4ZGpGbHZRRzljZ1R6S3YzVGI2RTZOdUtxN203SkVU?=
 =?utf-8?B?dzYwMnZKRVFUbkRWNTFHOElGYjlkRWNFTW5CWG1ZOXJsaDRVUWR6YVhCYlRo?=
 =?utf-8?B?ZlpURGxCRjBnRWFrVDlWdEdHS2JqMHBLaHZ3UVNobkZXQkVoZ09HNmo2aERE?=
 =?utf-8?B?TEVZcGlwTkJ4TitsOUZHMXhKa1pGRjNOK0tEOEZxUXpKcUhOUkNhYXJoYnl6?=
 =?utf-8?B?bEhCVThsZFJPTW9QTXdTQXdHTFlBYnlvNzBpL0FEb2t0RUwrUFN3Y2dvTXNx?=
 =?utf-8?B?amhVaUtJRzNhVWxUYUtVc05kb3J4RlQraFh0aEV3b3h4bVljTTcya0ltM1I1?=
 =?utf-8?B?SEdCN2ZhTUpHaW1XTWc1dlh6MXZTNUJ5NTJjRk94VUVNNDJrdFhkbHdIcDVF?=
 =?utf-8?B?VHRDbldQODhONzBUUWpOUmJZTCtFaHJud0lKTDBkVDAycmhRVXRqSEVEbW9v?=
 =?utf-8?B?Q2R5Y2FuQkhPOTRvOXVpUWF4b3JVdDJQQk1OVDUwRU5jMEhielgwOHpTQnlQ?=
 =?utf-8?B?NW1ndFhodFhqS3MrNExPVzVBeEMzeHhldXFadDBZTkRSVDl5QlBieExJVmpz?=
 =?utf-8?B?djh6alpFanlKYU9iazA1SG1RQlY3WVYvdGtSNS9nREhEcFpKSHdjWXRveGpE?=
 =?utf-8?B?Q1VLNHQ3RUF3NDlQUE5adHM4Mm1xVjJzY0JJL2o2akdnZFF6a2JHZ2thc0M4?=
 =?utf-8?B?TTZDeEVBTnBWOU9QQmkzRlNlU2ZEU1h4NTU4UUFkc3BvRjdHNEFWVGhKaGZZ?=
 =?utf-8?B?Y3UrNzh4clJrL1MvSGRqRnJCellxSE9ZSzFVTUNkMUxIM3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmNyWFlvTnhCRGlyNFdpa3BuWkt0aTdyMFhmNDVpTkhZaHE2Rmltd1o1M05Q?=
 =?utf-8?B?TXljV01OdS9HZThaUXB1bk91T211T2VmQmtzM3crRldWTmdvT1VNTHpXNVNh?=
 =?utf-8?B?VHFpU1hKNkZqeDBxTm5RUjJlbzJ1ejdCT01MRXlFMDhkR2lCUks1V3QydVVy?=
 =?utf-8?B?T3c1UHpaZVFRNy8wSTJ6cGwweVY1Qy93WSs2SzNNb2FOS1FjWk5XUEJXK3lr?=
 =?utf-8?B?MGxHeWFPRmdqZmIzOGIycjNmcmY0NlAvTFBKZWNjTXdOVkVvSktwdTFtMDYw?=
 =?utf-8?B?RWhPdFBRc3pCVDIrbHFMM1g4R2JERU5pMENFR1VGbHd2YXVzMUtTenpyaDRV?=
 =?utf-8?B?RGwxdXU4bjNIYTQxcUVOTzVNd3NHbHdnMWRHSHp2NXpMSXBVdFh3ZmpSRXM0?=
 =?utf-8?B?OVhzZ0tlT0RLQ0ZrRm15MVQyalJzd3JRazVGenAwYjgvaW0xYzV2MEVqOWFw?=
 =?utf-8?B?ZXRUSXpuV1VOOGhLT1lEQWIyZjJMak9EcWFFdGxsd0hEV1B6YVFsc2cxQnlV?=
 =?utf-8?B?WnVsMU9UTk5pWlN2Zkd1RzBNMlZnV2JVY3o1NnIwelQ5SU5TUXVSRlFhU3Qw?=
 =?utf-8?B?MCttNWRQVlg0R3V0cko5TEFnZlZ4RzJFNlV4VGhEM244bE5meG9JY2gvNmFO?=
 =?utf-8?B?VmRobWg5NFBIUXYzUWhlcGxKYU1PK2gxUktYWGQyd2ZZQkZmOHNRVUZ4OFQ1?=
 =?utf-8?B?R2QzS045YzFvMmxXWGlHckg2VUNMMXBTUStCaVF0eWw5aWwzTlluZmdxSUI0?=
 =?utf-8?B?QWNCZCtrTExiT29FUEhOaUtvRjhkUTAvS0tuMkZtdU1QY01STUU4bEVzM3ls?=
 =?utf-8?B?a2RYbnlhelJhU2wzbEdpUkZCY3cxcHJXUUZNbHR0UzE2WVRIOFhGajZ6NGV2?=
 =?utf-8?B?Q0o5MGxFYW9OUGJLbWZrU0NjYjhITjM4cjlOSExKalJKZmVsNXNNeHZBSGI3?=
 =?utf-8?B?eDhydE4xQWl6Vk1qbUtDb1FjTWZjY3REcmVDVk94S01Jc1BMdEZLN0xkVExW?=
 =?utf-8?B?aFNOTzRPc2JuWmRwQkVFUFpRZTEzRExremNvVWQwUW9GNzFMOXdHdGdFNFM5?=
 =?utf-8?B?T3FxSmJTUEhBT21aSFYxNG9XTVpNQVVOWmFDam1IcjBZNGpMWGN5YlMzM3F2?=
 =?utf-8?B?ZWdNdGxiWE5mcFNibEcrSXBsTERucnN0N2JUalA3MHduV0NWdkZzTDBweVh5?=
 =?utf-8?B?Qzg3K0pnRXlkTGpSOW5OQUJERCs0YmFaWHRJaUFpMDV5WURhOW1PMDlWc1dw?=
 =?utf-8?B?Y3lNbEVoTGo4b2RkWE9CdjIzekhhdVhoSjdVMlcydDlDR2RmbzNRZkc1dU1W?=
 =?utf-8?B?TW9paUpTUGJTc3hVUUFzS3RkMGw4aGdzYWtFTEh2R3lHWGxKUktVTHpvVkJv?=
 =?utf-8?B?RDJHcEQwaGxvZTI5Nm1oeUs3Y044UGNWV2p2UVI5QU1iVjIzVkcrRVJmbGZV?=
 =?utf-8?B?MWE5Y3VBSUlxSnZCOFpkeDdiNXl6emFkMHFRSDA1OUNDazNSbGZqTkV0SVla?=
 =?utf-8?B?ZmhXcUJQbmdiREJrWHRPVVd5a1RxelVQNm9KMDY1Tm1LZXR4MFU5OFBrY0to?=
 =?utf-8?B?NUtuYXBqV001dXQ4ZUZuRytUeXN2U3p5M0JsbENJUmlJcWdqNHBCU2lFU0xT?=
 =?utf-8?B?a0JQUElkd3E3VTYzem5UeUlDcTlpcncyaVZ4SitzajB0ZE1BVkVpUXo4elVp?=
 =?utf-8?B?bHYxV25FY1pRWjhrNlg4SDk1dHJLRCtUVi9Dd0libjV3L0hGVkFpdVUxUHNQ?=
 =?utf-8?B?aVUxYTh0RmFwN3h4UkxUVm5wL0tBWHpjcnhoa1NrK2VjR05zS2dWMERSY0ZU?=
 =?utf-8?B?NTdUY24rRGw1U3Fic0x3VXlNTDdUT013NCtDYnB2Zm5Bd1JGTkFzSDQwTHZF?=
 =?utf-8?B?cWVXaFllWm90Z0w3SFZtUVJVaFZZVWNlaTVKU3BXR0xCZXlKMS9xSnhKMi84?=
 =?utf-8?B?dy9jSVJsQ2h6NkxKNk0wMmxBMmpaWE5mVzMvSFptazI1eUIyYS9OM0NhOWJm?=
 =?utf-8?B?Yk1XT09OTFl6UFRMNzJNT0FMQk9sSW9oWU9DeGYxa2U3SER1dzBjT25qcjZU?=
 =?utf-8?B?WEFxSzJLemcxc1hEQXdZck5Db3RJODVlMXc5dkNmZmlQQXphZkRQOU8xcGo4?=
 =?utf-8?Q?JFiB0qEsBchh3RLivtRnO1oBB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1566dae-b22d-45b8-c000-08dd8167fede
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:36:21.7484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6RLWAjOKA52SPvf3PNIeGH0jUZd5lT788Vz/HOc+FyC8VARPRQpwb84HTwOqAnmIhq7apltlbGTvuUSmxxO6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060



On 4/14/2025 12:35 PM, Ingo Molnar wrote:
> 
> * Ankur Arora <ankur.a.arora@oracle.com> wrote:

[...]

>> Performance for preempt=none|voluntary remains unchanged.
> 
> CONFIG_PREEMPT_VOLUNTARY=y is the default on a number of major
> distributions, such as Ubuntu, and a lot of enterprise distro kernels -
> and this patch does nothing for them, for no good reason.
> 
> So could you please provide a sensible size granularity cutoff of 16MB
> or so on non-preemptive kernels, instead of this weird build-time
> all-or-nothing binary cutoff based on preemption modes?
> 

Agree with Ingo here. We are too harsh on none and voluntary with this
limit. At least 512KB size?

I will try to see if I can get numbers for different sizes that does not 
interfere much with other workloads' perf. (in none/voluntary mode).

- Raghu


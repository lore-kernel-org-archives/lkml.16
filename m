Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794751D63F0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444861; cv=fail; b=Xz3LM61c/ULH8BdJMNWzQI/0A9Cr48ZjNXDs2KhzB1MlgTqM7O4i9RSsUfS9DGBFuKdNsBAmFOFg+oCxqDNTuOPGPmEf2yWD2T4fRhXLTZ9OiNhaSS1alOqqa8FM5lo6mGaOgX4yXQubYu0exF9PnvPC08sWfVr4/PKpnvGudDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444861; c=relaxed/simple;
	bh=jNcQ6mwJ/Nt032LaIRGXSO9sP/Q35UXzkYPVrnJgQxo=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AggE4vRTKo+bommR2IbAY3WD2BCIiafyXebpOEJsQw3vkrGuoquQ4zdjSWqNzeWcFq9UfGGXFoij5/4pCGPuTDDLc54mSUTI/xZIcSTwvbG1ITPVU5jSvKbvC30+Z5jpRVdQbf1WsZvLjHfvzPvvRzZNqSnzu93tSS/aIkXEExY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R9gaEt9T; arc=fail smtp.client-ip=40.107.92.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R9gaEt9T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMiXO9Tj7GPlj0/UkyWUDiz3ZA63SjaXi60kSlrLXe4B8K27PjmE0RL2JPVSXo4+i0VT6lP7OMUfTPBrNXhNjputB86HqAZ+0adpTIERp5E9AyBRkRL2QlR/8SzPiZcg3CKpkFl4ii35hYVJL3Wul3iCmKOUB2VmTn6rMPp3jcpMp2p4c/NVpuTRgmQPV6or3aNjKSh0A32nszO+S1QjkxDH5XXob7Y2ttKP7COMUUQcA67YJyoC7jjPinpxzIZ2l9XtfwzLxvx9JnkS5G7pAzJfaqwDtQhdf/dclPQ2rCVbjq2p14XEWY3J6g9tjsrCodPnSXO7pHCyhTn9UOHTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIIiHh1u0TNxlkkyrLqIJ4sezj53uJOgx3r+/T/Cm58=;
 b=YpKXxFfU9DvFB9NpTHQOyY86NfWT42VIjib1HJyxp0YB+w/dMJ2/1pRQ9a+wgecBInfK01/Dtky6auJZ8CZv8bUHknLBnTT/xwWYCa/TUYHd1+RZOG0TfJmo3p+9s+PTKHv/Bn0ZXP6OTmsAxTCCr/g638iYjReEVpOlKhdOix4ha1gkKk9Kdbq60wL926Dktc2JwO1Yrd0kjTd9sD2iaLfXj3UFdvIpOvPGo4bsPGpGsQRX5zqjRxE+8eiIkG+xaql3mTYo7bNhzXVEFk4FfmTMGQWUpuE55DUqAq3OwnwJv1Fn6UV+uSFcrZASrs8u1g9+26fg5ZfD9U4Ye4llaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIIiHh1u0TNxlkkyrLqIJ4sezj53uJOgx3r+/T/Cm58=;
 b=R9gaEt9TjCZupX+xC3rUx//ROItCul8tZl+hUCYa3EwAw1eY0I3MEoYTfro+BD3qq5f5+Qt0ar9i687B0UjwB7BYiRI0s026i8FCLFE9WFKCGeissvf8O7vBsSnGIsxh1qCvRwNSN/Uu+SKpus6wrRcf1Yb9ggIE2RFYeqNiKBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 08:27:34 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 08:27:34 +0000
Message-ID: <5141027e-45c2-487c-b69a-8b918eb2f682@amd.com>
Date: Wed, 2 Jul 2025 13:57:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] x86/cpu/topology: Work around the nuances of
 virtualization on AMD/Hygon
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, Naveen rao <naveen.rao@amd.com>,
 Sairaj Kodilkar <sarunkod@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Babu Moger
 <babu.moger@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20250612072921.15107-1-kprateek.nayak@amd.com>
 <38072ab3-379d-4e7d-85c8-de1d4f4960b4@amd.com>
Content-Language: en-US
In-Reply-To: <38072ab3-379d-4e7d-85c8-de1d4f4960b4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::11) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|SJ0PR12MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: ace74c94-ecf8-40bd-9eda-08ddb9424b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0xXK2p3UUI5anRVNVJOcVAxSjhuekcwRWhwek82WmVtanhoaVA3alhCOThp?=
 =?utf-8?B?VXc1M0lUYjhkdldHV1J0V1ZLODVQSjF1NmxBNTB2cEMza21vSklUYUtNaUd6?=
 =?utf-8?B?YjVjYXllK3B3V1NiZDlzNDZSUU1wejE1WHdIcS9UYnRvY2crUG1mdDc3RlEy?=
 =?utf-8?B?SVlVVDZyNmF3bUhWVjNuRGdFQmF4Uk5vNTZoeW5WZStrQXhyQXJZbi9SNDJ0?=
 =?utf-8?B?VmVXZk55aHA4UWhBU0lHSmhMc3UvMG1qemEvQzYzN1Y1ZWRMbmhhQThSUThj?=
 =?utf-8?B?VmEremZrS0VUaWozZ1RkQmpicnpsL0pjWHJUWkpXOXdjUzdDMnh0R3MzMUN0?=
 =?utf-8?B?NzBsZTlCRUZ1cm10V2FzOWdTVWtOUHhLOFZ1cFFUQkVHT3ViL3NGTUovTnJt?=
 =?utf-8?B?ZnNvYkUyemcwQzJxSWFucmRvNmRURi9FWTFxM3k5K1labkU4d2o0U3JPUldN?=
 =?utf-8?B?OHVKN1FNajhEQ0N1RlRTcXRYbmJBSWk1THJHK3V6VncrLzQrKzAyMTNJVVVs?=
 =?utf-8?B?OU45OWRsUksvYjJaQ0JqeW1MckFUb0ZWU0hQY294aXVQblBXYnRqeWUxR0dn?=
 =?utf-8?B?R1orMjBweWpMSithVklKZWtTV2k5RjJKMWhhN0FCZGhXaTg4aUkvZjJ1MUto?=
 =?utf-8?B?WDEzM3p2VHY0T3lGenFPZGRPd3JBR2dpNjRiVkFZUTlBZWZmaTdwaFhqQ0dV?=
 =?utf-8?B?ckx1dDVrY2w3eFJiYkdvVWl3K1VTL0k2SFNtNzM1MHpma0V0Uk9aWDZ0R0Rj?=
 =?utf-8?B?bGlRYWtNWWhTZGlBd1Q4YWg3TkowY3VQbng1OU5sa1pkRVV1cFpEVFJhanVT?=
 =?utf-8?B?K0plRzI3YUpqaDM1bHpURHJETDFIVGVINGVxblFxQ3NhQit6ak8yeDhndXly?=
 =?utf-8?B?WHFYMm1hancxc1Fack0xV1hyd01FaitER1RzRWQ0RmxWbGtSeklhNVBnTEpB?=
 =?utf-8?B?emNWQWdScWw1OVRzWnR5dGpXV3ZudVFHRDVXakxZTHlDQ3JGWWxOOFE3dmsz?=
 =?utf-8?B?a0RpYXc1TGtxOWhyU3RmUXpDQ2lRaVltUkN3WEphWDhRMXdtMEU1cVNyazRm?=
 =?utf-8?B?aVRiQTFTQno5MTdMNERDWEpLeHlmZGg0NVlxWDJENExwNlI3ekFIZmJySnZS?=
 =?utf-8?B?YXl5dy9odXVzVU5STmsyckVacTgxaWlQRWtySmVqWWo5N3h4Mmh2dnNZRnhy?=
 =?utf-8?B?QkdwbUQwL05QeW1WOEpqdTI2SW1vVytITE1uTUFsZDgzM2hRR0t0TTMvSWp1?=
 =?utf-8?B?ZTI0bHdKV0FrcDJyMCtWWXUxMjRiZFBld1NYeE10Vk1FZFh0OTJBTFJFTkZM?=
 =?utf-8?B?YmprMVBVUDlOR2UwckFDY201RkF3R2xZVG9zek9jOXJmdXNNRWtDc0R0Zzh1?=
 =?utf-8?B?bk96QXpRUWMwbkN6UEVvMHVMYVZQM2JzS1NkZzlJWHlLWjMrNzF5MUMyNW9q?=
 =?utf-8?B?MHhYeWJVUERheHI3TW13VVFGcEhURkFvV0NKNGJscENRRFdGTEhCN3BKalEr?=
 =?utf-8?B?ZUhUTkpZVUhTR2ZzM29mc29pSE1PNThyelRhb0tCaWFUMzZZMGNFT2lrODRn?=
 =?utf-8?B?K3krYzFzdlJ0bThmVTA0YTE3MHA3YXBIZmY4azNHMHBJNHE2TVl4VTlvd1pp?=
 =?utf-8?B?N3gxYldmbzhJMmR1MjJES29tMDlUNy9EWDdqRWlXRzFPTXdKU3JPSlFDVTBF?=
 =?utf-8?B?T1RMNDVGSnV3WUtudVV1WEU4SU5sd05MbHJ2cE5yUEUxNTFrQjFWWW9XRkFL?=
 =?utf-8?B?V2lDb0EwZ2pHREJiNFB2RG12VmgzT1ZEWElMNWsyYk1lTi8wYm1QOHdtdHZi?=
 =?utf-8?B?QlRiYUhGdWRKdHNRRnZPZEVuajhsV2Q0dTE3ekpCektZaGYwaW5nZXI1Q21u?=
 =?utf-8?B?cmFlS2srb2pvK3ZSYU4wcVNTbmJURFArcUVlZy9LdzdncTdpbVhXbmhFK0hh?=
 =?utf-8?Q?V7lmSAxgHOY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjQ4QUdUMEZ2NkdKRWEyUjJKRERwamd0YzQvaDEyRjhYRmZCQXpIMWFTRGRs?=
 =?utf-8?B?R0ROc3pZN2NKWkRhY1Q0Vjl3TXR1ZndjUEppSnYvNGRXZFRveEd1Y05xZnYz?=
 =?utf-8?B?eFAzajBYbjRZcEJWVmNDdzFIYTBPd1pqQ1RmT1JmOG9wYWJlODRTUGVydExX?=
 =?utf-8?B?cWNRNi85T3Z0OHQ1eXZEdUtQazBSVXlQNUJBWHRDdkE3cllZcHFaZ3NWa0xV?=
 =?utf-8?B?T0JkMUttSGtLVVZaekkvdVl6VFYyTE8yS0x6TW43bEppV0pUc0oxTTNkZnlO?=
 =?utf-8?B?U1RPRE9kbjVCblRneXd6WFFlOU53VFhpa0U3alNHSlBBNDNvd0ZMUXhyekw2?=
 =?utf-8?B?cHgxNTF6VG9LOWFnTzdsbjRxR1J5Q3FOeXFGWDVUSEs5RTk3T0lHNG1jTEFq?=
 =?utf-8?B?bzFjVGZwWlhjT3BsTWNMSnBtTlVaWERtbDd6MXJVbnpLS216ZVlmb2oxTE9W?=
 =?utf-8?B?UWtmc2tqNVYzZTExRVBPNjVEVXdjOEFXV05IeitXSW5wa0tTT3RKV3JhV1R0?=
 =?utf-8?B?c2M5VXNGRjNTM2MrL3Bkakp4UU9ZSmx0ZjVmYWU4VEU0b2o1RFBqQ05sV2ty?=
 =?utf-8?B?R2NtalV4VDJvUlA5OTVzallsUEgzTExFZGsrdkpVUWxJSGlRS1E0THZZdEVT?=
 =?utf-8?B?QmRmT05ub1RmUVdWY1RBeVdDZjZpY1IwcUtPT3FPczJXMjl2QmVzaDZJbXM1?=
 =?utf-8?B?UXF6TU5jbEJHMmxDTzl5cWJqanE0ZTc4TTJKSHVzY2dUZkxqVXZab051a1pp?=
 =?utf-8?B?WW9HVXNtbUpTMmIrWDltSFdIcnd5VU9Uek5VSEJHTW5aMmlDSExaTjVNUW1z?=
 =?utf-8?B?QUl6S0N4V3Zyd3FZNkthd21MS0JqUVI5VklUbHF6Mm0wTExwZ3lqaG92bXJ2?=
 =?utf-8?B?eUptUmZ1VGJ3d3NDNEwyblIyakQvTElXSXU0bVk3c3FHZVlhVnNBeXp0Kzcz?=
 =?utf-8?B?OFQyTjBWeEUzUmlzSG9Wa3ZWZUg3b1RNZEFKcVZTSEkyWVc0RlpWVng2bjNj?=
 =?utf-8?B?MEhGUU1rUllKaGphaGZ5K1JKV1M1OWNyNG1oZHR1Mm82THJJNGpBTENuV0VY?=
 =?utf-8?B?Y3FCQ2hDMG1GV3NXYktRT2JXYldIUWIyTHhlQWx2T05uY1VQaE9QNUN2cU52?=
 =?utf-8?B?anZMNlVZM3JRVWhCVXdtTXI1QnpuMnFXVzBQU1ExSER4aEw4eUhtQnM2eWhy?=
 =?utf-8?B?UElLdENmaGV5VFczR0hER2pNY211Rzc4ZGdTQzcvK1dZc1k2c0x0TW9QSUY4?=
 =?utf-8?B?SGczNWF1bXR4VEtOVVRjUVNDZngxUlExYTArVzZNbXMvWXhqRlFFRWFNclhr?=
 =?utf-8?B?d3poc3pPa3ljOHdZQ0dLL2JXMWpkb3dpUExVazZkRHVkYldWc2h0RHdHSmcv?=
 =?utf-8?B?aE5saFJxcW5IcHNiKzkwbTE5MG04dDJEeWZtL3NIQlBSVEFxMVpoa3pSaTBS?=
 =?utf-8?B?ZlpqSzNINHUvMjd0T2pEYTlhamFhVUFVV1d2dkdhSTBGZkpQVnhBS2xQNlJx?=
 =?utf-8?B?OFdWeGlNd1M2c1JqVkt0K0VUT1c0cDd1ekd2Q0lNOVU2RkR4RXRqd01ucHVY?=
 =?utf-8?B?aWFHS3ltbE5FV0RTZko1Mld0UEVXTzFhK0ZBcXY2OVhJMzFPTHRTRUcraGM1?=
 =?utf-8?B?N0dSdy9sN1VFckZUQXZWUHpETElsVHRNZmROaG1NbUpIK1pHMGR6d1RYRGtS?=
 =?utf-8?B?V3Fabll6NjdVWjQyVVZoMU9RcWE1bytKeTh3VVJHWmRjbXJwWUZVc28yanpq?=
 =?utf-8?B?aWp5VjNkZ0EwWVhGaDZTMDNEMzdmNUp5aTZySEx5RVlVL0RZQlZCSmIvRUlq?=
 =?utf-8?B?Smx3bmVaSmRobGtzV0phcFczaG1Ec0lycDhWWnp5bXByOUw5MzMwY3JZWnBI?=
 =?utf-8?B?OVdFajFPbGI2RWROanp2ZXZEeVBUSWQzcmtNbFR3OGQ5cG1zZjRpaHZaeFo3?=
 =?utf-8?B?VFZ3dFZTQWlUenBIT0JJTnd0VWRlcXp5UU4veHFZM0NSN0dsV1htOGxsa2Uw?=
 =?utf-8?B?aDRRUlZ4ZDhSZTE3Nm9EN2xBWHFzWkR6ZkxrbzJ4T0dZb1JYcnk5cDJXK2cz?=
 =?utf-8?B?Z05ybHFJUHdhdEpCS09qODJlc28xVU9NQW9ZL1d4andSdFUyS0prUktWN1FQ?=
 =?utf-8?Q?KNUmChAoEdEgZ832GYEhSaMrG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace74c94-ecf8-40bd-9eda-08ddb9424b1b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:27:34.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FEu+dCLhIToowQKkP6QOfZk4gQdtRAL2SS7hb+z8LfRdGRP1Z8B27rrRWxxmM9c92n6sQ5nXBoLRseidJijkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7007

On 6/25/2025 11:58 AM, K Prateek Nayak wrote:
> On 6/12/2025 12:59 PM, K Prateek Nayak wrote:
>> When running an AMD guest on QEMU with > 255 cores, the following FW_BUG
>> was noticed with recent kernels:
>>
>>      [Firmware Bug]: CPU 512: APIC ID mismatch. CPUID: 0x0000 APIC: 0x0200
>>
>> Naveen, Sairaj debugged the cause to commit c749ce393b8f ("x86/cpu: Use
>> common topology code for AMD") where, after the rework, the initial
>> APICID was set using the CPUID leaf 0x8000001e EAX[31:0] as opposed to
>> the value from CPUID leaf 0xb EDX[31:0] previously.
>>
>> This led us down a rabbit hole of XTOPOEXT vs TOPOEXT support, preferred
>> order of their parsing, and QEMU nuances like [1] where QEMU 0's out the
>> CPUID leaf 0x8000001e on CPUs where Core ID crosses 255 fearing a
>> Core ID collision in the 8 bit field which leads to the reported FW_BUG.
>>
>> Following were major observations during the debug which the two
>> patches address respectively:
>>
>> 1. The support for CPUID leaf 0xb is independent of the TOPOEXT feature
>>     and is rather linked to the x2APIC enablement. On baremetal, this has
>>     not been a problem since TOPOEXT support (Fam 0x15 and above)
>>     predates the support for CPUID leaf 0xb (Fam 0x17[Zen2] and above)
>>     however, in virtualized environment, the support for x2APIC can be
>>     enabled independent of topoext where QEMU expects the guest to parse
>>     the topology and the APICID from CPUID leaf 0xb.
>>
>> 2. Since CPUID leaf 0x8000001e cannot represent Core ID without
>>     collision for guests with > 255 cores, and QEMU 0's out the entire
>>     leaf when Core ID crosses 255. Prefer initial APIC read from the
>>     XTOPOEXT leaf before falling back to the APICID from 0x8000001e
>>     which is still better than 8-bit APICID from leaf 0x1 EBX[31:24].
>>
>> More details are enclosed in the commit logs.
>>
>> Ideally, these changes should not affect baremetal AMD/Hygon platforms
>> as they have supported TOPOEXT long before the support for CPUID leaf
>> 0xb and the extended CPUID leaf 0x80000026 (famous last words).
>>
>> This series has been tested on baremetal Zen1 (contains topoext but not
>> 0xb leaf), Zen3 (contains both topoext and 0xb leaf), and Zen4 (contains
>> topoext, 0xb leaf, and 0x80000026 leaf) servers with no changes
>> observed in "/sys/kernel/debug/x86/topo/" directory.
>>
>> The series was also tested on 255 and 512 vCPU (each vCPU is an
>> individual core from QEMU topology being passed) EPYC-Genoa guest with
>> and without x2apic and topoext enabled and this series solves the FW_BUG
>> seen on guest with > 255 VCPUs. No changes observed in
>> "/sys/kernel/debug/x86/topo/" for all other cases without warning.
>> 0xb leaf is provided unconditionally on these guests (with or without
>> topoext, even with x2apic disabled on guests with <= 255 vCPU).
>>
>> Relevant bits of QEMU cmdline used during testing are as follows:
>>
>>      qemu-system-x86_64 \
>>      -enable-kvm -m 32G -smp cpus=255,cores=255 \
>>      -cpu EPYC-Genoa,x2apic=on,kvm-msi-ext-dest-id=on,+kvm-pv-unhalt,kvm-pv-tlb-flush,kvm-pv-ipi,kvm-pv-sched-yield,[-topoext]  \
>>      -machine q35,kernel_irqchip=split \
>>      -global kvm-pit.lost_tick_policy=discard
>>      ...
>>
>> References:
>>
>> [1] https://github.com/qemu/qemu/commit/35ac5dfbcaa4b
>>
>> Series is based on tip:x86/cpu at tag v6.15-rc6.
>>
>> ---
>> K Prateek Nayak (2):
>>    x86/cpu/topology: Always try cpu_parse_topology_ext() on AMD/Hygon
>>    x86/cpu/topology: Use initial APICID from XTOPOEXT on AMD/HYGON
>>
>>   arch/x86/kernel/cpu/topology_amd.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>>
>> base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
> 
> Gentle ping!

Gentle ping! But a wee bit less gentle compared to last time :)

-- 
Thanks and Regards,
Prateek


Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E962727F6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 05:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751866788; cv=fail; b=PEZwnhUbONwhS0h6TCdJBhnGJUaCrGMFppeNRnB4M5iu9A4x++sTBoParP7KKMVtgIOCI3FuKnEZJ5qW4QCXn+u2lIj/CgX82rH1enoTdgq3nE5WAluWUdjVlU4QY3ok6rQtNojaQ2z+VEhtQdN8lU0MEKz65wAPRdzy5NKZq7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751866788; c=relaxed/simple;
	bh=p6vL7Ow804DetOdSUO18gpm+3YLiLKZatSOQTdD55t4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kG1eOAv9TysSoptWe4yDHzMG16CMfQtHxMFIPLPniFoMBJkRvD2ofXeYE3+700gMTttzAdZ/OLEWmVarn8oyUT+Bf+8VaC1li3S4eyYpnGjnWrRIDjawDSXR5rCFuHUfC1kj68Znof2+Gh+ubov6OaSqvo2JX1e6b4l9ikpLLqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z3Qhe8OZ; arc=fail smtp.client-ip=40.107.92.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z3Qhe8OZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXv7zBUeYlhcRaNHbS6MVA+prx2a8uSSc5O2hock9yJGzICXc1UzPj4c4jyZoEwRVawLfVT8HiJ/Ni5xGZrF9TZ8/ceR+H7zmeVtSslw/QAbns/vl95VmBcbwu1HygTvWlZSFulD/i14Nvr6h2Q++JWY2zj8LydYdYVTKTB0O4RR5OeyGoVaOQUyCIuh1n2n2wVCDUy9byZNO0ZY6cMNkM+dnpx7dIoAB1kucDcnnELy+WSnTWPRSTOhW/9MdQnkph8UKxPRAxcaYa+UgT1wIhhw8A7xw/RwIwZhg9G6NN2UqxYiw0UhW3t/CmNksW5yXjbl+nqePR0n9cJsJs2c3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bZrhM4FRun28HoQjT/5ZRdRkNA4Nl/bdoUXM5D2bqY=;
 b=vhasb2Zkto5pWo10u5Fji8wOuBzSdbF+j+ExwNmdkY56kLQpbQWSwkWMGgftWMl9ajGOz2Qlmf+/PBekwurFd1HYxMImREtQ6nNbpmrhx1Ua9Nk8qazXvWsKd69dsQaP53jlS5Rage+6bBaVVeKwKkG1MCIBOYVzCWapAlP/3bmJt/nEgtvwwWkKM1nnbftF7e+dgNJe2GYd1oT5rAEV8/mNc6Pt8CU99p72SO2/faTFI/mUHLg1/1IZ8RF25hg4e6A32Hvqk9uIe1eOJVqJYqSRUsO20BYk3lGmjhHtP3hjBdKb5GRgqSVhSIwm2eKNCme1l5TZ1WUd3sO3/txErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bZrhM4FRun28HoQjT/5ZRdRkNA4Nl/bdoUXM5D2bqY=;
 b=Z3Qhe8OZ1vkX38+7o/JVBUfBFUP11kpsZtQCP32yET4c07ovoXJcAM762oD4TLFkMtkj5gmUV224xJjzEBimkqsLSak/H3HAJGV5jsfpZU5utcVAokdYSQZQBBWFZen2Am+8gdeKGCzPv8ZmZ22CERuGw0QDKsGguOplAW6fSh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 05:39:43 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 05:39:43 +0000
Message-ID: <7e7f686b-1f5a-46dc-8b16-c6d491160d1c@amd.com>
Date: Mon, 7 Jul 2025 11:09:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] x86/smpboot: avoid SMT domain attach/destroy if
 SMT is not enabled
To: Li Chen <me@linux.beauty>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>,
 Brian Gerst <brgerst@gmail.com>,
 Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
 linux-kernel@vger.kernel.org, Li Chen <chenl311@chinatelecom.cn>
References: <20250706030636.397197-1-me@linux.beauty>
 <20250706030636.397197-5-me@linux.beauty>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250706030636.397197-5-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::20) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: e568ad84-f777-4103-2e0d-08ddbd18ac7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2JPMm1iUjgyekFmNHJUbXdCdmVlZ29naDVqOUFJQ2YwUm00d3k2KzRHeXZ4?=
 =?utf-8?B?NWJlSlp2c1ZKSHJwNjJ5UkgvYUN3eWhLazJCN1ZxaVdpVWVWQmo1QU5QWUZI?=
 =?utf-8?B?elJpVnh4R2VhL2hXQXhaK2lpWG9zU3FwVlJOWlJwN3I2TGJBUEdhUVUyRnNv?=
 =?utf-8?B?VzV3SW51alU2Zndia090TzlYNWFJOVRmdkM4S3BCR1p3bXpNZGtsWXBtWStC?=
 =?utf-8?B?OXZDaCtUQzYrRDQrckw4bVRoMW9TcytvSVFoV1l3bjNpZnJmeDFlSDMzR1la?=
 =?utf-8?B?TTlHTWFKR1JkNUZXL3JTK2oyUUhCbmtjSmZ1K2hDWHE2NG5BajdsR09BMEFO?=
 =?utf-8?B?Nnh5ZHcxYlV1UGNWeVZReTY4UFhpMVhTYUFRNVpCMHJTMkdmVXVuUlRhTUFJ?=
 =?utf-8?B?N0xwVFlncUpvdmdZaEVITTE0ZXEwRTdaTnFuZmJaR1RReFBVWlJNb1diejcz?=
 =?utf-8?B?YkNRVFFqOVdXZ0VWeDQ1aGh4dHZqNjdsUmdPVDFyaHZNMmVjY21LM2lpa0lv?=
 =?utf-8?B?VUJ5TGhWM01HQ0VadEtMTWE3N0tMM1ZZWGdPSzRGdENnT2ZKM2VYNWpGeTNs?=
 =?utf-8?B?cW1SUXRHL3RQeWdWQkw3UkZXeU5Ob3JrZHIxdVBZb2JlU3JKaFNwdW1xdWpO?=
 =?utf-8?B?ajdreE9xMW5CUW0rODM1Tm5kbWM4OGZUcFlXOFUwYW0rTjhKcFcwcEpwU3pw?=
 =?utf-8?B?SVhYcXBSZkRZMHN4MUVGOG1NNDRNOXBub3pNWFNJazBQQTZTWjRvQUY2VTZz?=
 =?utf-8?B?dCtKYVpxcDB4bnVMTVE4NUtzUjFmUC9XWWphT293WDBNNEk5ME41OXptMFJQ?=
 =?utf-8?B?VVQ3aytjUWlRUlJjc2MrNkRVYVI5bEQwdFZoNlBsRFdkWnUvcnJwMzV0U216?=
 =?utf-8?B?cm5HNVVkZkVUaC9kTis0L3MxOW5teWJUNkR4RVd2TCtWcnRnQWEvb3JRd3Jt?=
 =?utf-8?B?Sm9od3U1V0ZaTHNzQXR6Z3cxTXZqV0ZzaWpGNlVxUGM5MHB0R1kwLzE1OGVE?=
 =?utf-8?B?dEYzOHViTTlMM05ralZMRFJIQ1o5Z2d5dDRlRHRkdXBueG1RVDEvOWV3SkFN?=
 =?utf-8?B?ZmdHY3MzRFFpSWdyb29jOHpGR3hDRXlLY1JlMEVrY3BJMi9qQjM4T1BMYk5V?=
 =?utf-8?B?Z0c4eVRuNG5sOGFCT2lFSkFESHdONk0vbkJWM0puMWhqZXFsZkJoUzcyRmZB?=
 =?utf-8?B?TFl2TGdISjgxMFphMGVaOGNYYlZnNG5rKzh6MGc1ZXI5Unh3MXgyaDgzelJI?=
 =?utf-8?B?Z1l2d013bC9yVmZSaDNCR1BiQTV4eHFDKzlGRThIaUgwbXV5YXVDbFBBUmRZ?=
 =?utf-8?B?MnZDTVdKaUFOTjBYMUV5YysxejFnRmcvZTR3QmtYaTZ0M1hONXgwODRCRzFi?=
 =?utf-8?B?Qkt2UG1KZzk2YVRNK05ZM3crRmJjeUNXTldhZGxRa3lBQkxGK3g4eUtNTkhX?=
 =?utf-8?B?R0hZdDFPUVhzRDZHQmhYQndIOWdqbnV1cnVmd2dJNXB0RExGWUZsRldmOVB4?=
 =?utf-8?B?dUZXS0lmT0wybkdvcDRoaDc0SHp3TzY1eUZrcUVQZzE0WGM5R2ZZRUViMTR2?=
 =?utf-8?B?ZjYzUnpHME1mUzhwdzJmRDlrZ1BvYlk0UnV6L0srUHZYcWY0ZDhWNCtWVGYy?=
 =?utf-8?B?c1NuZE9lcXM4NldWUVBXNlF6MG5NTU54bDJaZXZmL1k2N2VGazcxZnNFblp0?=
 =?utf-8?B?bWtoOFpaWVk1WmxMS3ppek53TkJudnJLRjlnakIxSXFlSGcvSzdkUEoxaW1F?=
 =?utf-8?B?ZDVyUUp5eS9BQzNYc1d6UUdGa3E1NlNDKzZFMDNtNm90czBlamhxNnpxNDRZ?=
 =?utf-8?B?WXRWVGtrbm91eGRsbVBBTFR4anlQclczUFFvRlJuNjBVd3p3YVA3WDEwb09V?=
 =?utf-8?B?MHRWMU93U3ZzQlRnZXAyUmdtdmlJNUpjVldmQUhhbWZHYmE1U0hsb0EwYnFT?=
 =?utf-8?B?Mm9CWUxNSldVNEV2VE9kakFIbjZOSTRDcFNjak84YXd5WE9Hbjloc1JpN1Jw?=
 =?utf-8?B?K1VTTXFNL1pRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXB0MXI0WUR5M2VTS2dhMTVhRFJjL05mWXF2dVlPV1d0RDg0T3BaZFJFbjRB?=
 =?utf-8?B?ZWwzVjM4b1owMEk5aWZjMUhTOXEweUw4Q09tTmdvMlBIMHVKYUJZUk5nOG9z?=
 =?utf-8?B?ZkI0WGt2TDVEalRQTDVObnQ0Wk56YnpJT0d2dnFPK0YyUHF5aVhJSzI5NTZj?=
 =?utf-8?B?L0h6UGh1RlBoTWVkTWtYYzh1YXZLS2trTTNpZU5CQ01QdHhEdVUxc0FXdUlC?=
 =?utf-8?B?S2lKSGYzUVJBZnQ2V0VISzhJM2czVm1LckxIeXdkUEdXL0hUZFVtZnB5aU5W?=
 =?utf-8?B?UEQ3cEoxdjU4L0lnSVI1SWJkTk9hN29oVnJoNUYrRnFaQVMrMXNSeVBMaFNW?=
 =?utf-8?B?b3M5RHdLN1pJcWdXR2t1VjR1MlNHd0JkbHNObTd0S3UxWkJGbDY1bVN1MHJ6?=
 =?utf-8?B?MlBmTmdudW8xM1ZBb2lZelN0VW5JM3RQOCtXV0JTazJBQ3I4OEFINHYvdDhl?=
 =?utf-8?B?Z3NFdGUxOFlvUG5Fakx3a0NUbWFzUUk1YUkzalV6SDlkYUJVMWlBTkIwaVpJ?=
 =?utf-8?B?dE5BQ2gwOXIxcnFCR1N0UVUwdVB5VERLWnZuS3krZzJlN2I0VHhjMXN2ak9U?=
 =?utf-8?B?bTVIdEFna21GK2Evdi9iQTh2cmhrQ0puOHdJY2dESHBLMFFFa055aTZsUFRD?=
 =?utf-8?B?UU5EOHd2dFBBUGtJcmJPZW42RmRTR1hGSHZGcWI1cHFiUGdLN05lNXp6bWMy?=
 =?utf-8?B?R1pKOGR5OXB0b21PMUhNVDJCMThLVmhiOW9RTFBuYmhJK20zR0hxNUdHdG8v?=
 =?utf-8?B?M0hzODJaU2w0YVFibEN0T3QyYkc3UVhhY0RTY3VkNjgxeEs2UGFHYXVtcyt5?=
 =?utf-8?B?eWh2cFg5bUdieFRKcFQ0WSswNEdhK1RIZWVEY1QwaEYySExUVnhvdlJPcnFS?=
 =?utf-8?B?Q0kxSVVhK25tbDIrOGhYSjFSV1VCVlhiN2J1M0NLNnlqc0xjMlBLYXhvTDRB?=
 =?utf-8?B?TmJkbHVCbFptK0QyQ1NVS1dLVml0OWhMaDJxV09ZZjUrUjlYWDVFRGR5N040?=
 =?utf-8?B?YzhDMDI5S09zRVF3ZTdTejR0b25RZi9PcU82MXd4SUVvcTdzb2lnMlE4K3Vv?=
 =?utf-8?B?V2NUU2kwUHBXaENLVUFYQ2JjeWE4K2podkRaY2dvaDlCYW81Ym9ha2wrTzZq?=
 =?utf-8?B?RnI0bXFUaVB0UC9ublByWjZxZWJ2Z1JrMEhzUThYbEc5eFdTYTVUMU9xd0tS?=
 =?utf-8?B?bkI1ZTBpQVBDblk0azFldm1sRFJVVmwvMFNIaHFNTDI3TnkrenkwRHkxL3dl?=
 =?utf-8?B?WllSZTN6ZkZLa1dMaUJKK3F0ZWxWR01ma0tmanJvQXBmeEpPY1BTSUh3ZTNo?=
 =?utf-8?B?Nm5jTGx1cENhZVlnUmFQdEtkV1BrK1F5UHl2Vm1MOStYNCtJellrK1FQWFBn?=
 =?utf-8?B?dGpyeEwzZG02bnJGb1psd3dzeEZPNXJhN2hqZzVFMTA0b3hWYTRTVjZaZjR1?=
 =?utf-8?B?VEVTcW96ZVg5VmsrWENmWnkzUmdydlU1ZEpwL0pVU1BmbGtQRXJMUWk3SzA3?=
 =?utf-8?B?RFh4Z2FCYUNta0d6REF5Yzg1dVBjcVdiQkFPcFJtUjhIb3hIYlhsRmh5VWc0?=
 =?utf-8?B?VkZXbWFwOTBmU1VSNXFLVzBpSWIvcVp4ZnNDOStzWGp6THl3WkM2Um54V2Vx?=
 =?utf-8?B?MGRRUmFMOE9Yd1ZMQVQvZ3lGTGwvYWwvU1pXTndicVhNTWFKQXR2TDF4TW9T?=
 =?utf-8?B?MWtZcWZobERpWitwNGNkZDg0M0pMMm5Sa09ROEJrRUNIN2NBOW1HNjdpMzRw?=
 =?utf-8?B?emM0V0FibWU2ZGxNNFFFZDZKMU5NT2ZXU2lLYjl0eHh3Z2cwUG5RYmxrU2hW?=
 =?utf-8?B?U2Q0NmExcS9rcjc0b2FnMDBXeklaUVZtc0N3NDZ5dm5SSDZ5U3FNcUhBQkRh?=
 =?utf-8?B?QkF3WExiUlExcXJiMHBTcjczRDBBcnM5b1I3aTV3Tm5YOGllRkhPdVAwclY3?=
 =?utf-8?B?SU9nUjVibU1XNFJrUkZtdmJpYW9ORlBxandLTUg1dklxS3pFaG44WllJMVZx?=
 =?utf-8?B?TFIvS0Z3UjdCUXhvNEtLRHJTTDNsa0FTNDJoYVEyN01HWmhGREJKTSt2VHRE?=
 =?utf-8?B?c2JERTRpYUNoQWhTOHNUelM3UE1sNWExUHZ0K3UyWXZJdm1kWHFXeDZKZ2JV?=
 =?utf-8?Q?quLwbjSFjAk7wRW+K9+UlJos1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e568ad84-f777-4103-2e0d-08ddbd18ac7c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 05:39:43.1397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSDgdIzcmI+/eoKTC2QCEhTkLD+zMhJ+H5lVCbUqT9fnZhiAteGifAItogtio47QYuhVw74jEBi4PuM+j3wvmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

Hello Li,

On 7/6/2025 8:36 AM, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> Currently, the SMT domain is added into sched_domain_topology by default.
> 
> If cpu_attach_domain() finds that the CPU SMT domain’s cpumask_weight
> is just 1, it will destroy it.
> 
> On a large machine, such as one with 512 cores, this results in
> 512 redundant domain attach/destroy operations.
> 
> Avoid these unnecessary operations by simply checking
> cpu_smt_num_threads and skip SMT domain if the SMT domain is not
> enabled.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

"Suggested-by:" should be fine :)

> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
>  arch/x86/kernel/smpboot.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index cd70e5322462a..8c1960a455bfb 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -492,6 +492,8 @@ static struct sched_domain_topology_level x86_topology[] = {
>  
>  static void __init build_sched_topology(void)
>  {
> +	struct sched_domain_topology_level *topology = x86_topology;
> +
>  	/*
>  	 * When there is NUMA topology inside the package invalidate the
>  	 * PKG domain since the NUMA domains will auto-magically create the
> @@ -502,7 +504,15 @@ static void __init build_sched_topology(void)
>  
>  		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
>  	}
> -	set_sched_topology(x86_topology);
> +
> +    /*
> +     * Drop the SMT domains if there is only one thread per-core
> +     * since it'll get degenerated by the scheduler anyways.
> +     */

The comment above has spaces instead of tab before it.

> +	if (cpu_smt_num_threads <= 1)
> +		++topology;> +
> +	set_sched_topology(topology);
>  }
>  
>  void set_cpu_sibling_map(int cpu)

-- 
Thanks and Regards,
Prateek


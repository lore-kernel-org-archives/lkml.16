Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B323C8C5;
	Mon,  7 Apr 2025 11:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025494; cv=fail; b=QJLpaaticXh+Kc9YwAtreKKc6Q2JrokiBMkKb4cVRV7SMSYKR9FYhaK/6hXjlMAE1M5RQMl7CHeywzsCweKJhQnjGoJLMOojBXvWKSUlly/CWDNLPfiOGCdhTX/b6tY+7gp3s9CpwSvssip+cVCqVSvzD+Ht9pC0s6NNZU9Qv4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025494; c=relaxed/simple;
	bh=6NhnY4/wqtK4Ibkrb0iB0MDTumiqpZKqfaBzMZ//vLI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p/Xcay4aTnZfU0sJRnTxa5ypd570Z8mpgEonut+kMsg1Wbxrwj1Q+WUV62UOhgz1e1HbyDX3EbERPPTOmyUio8ETHPeHdhcNejaWWLjlS7CSiSoyOPNoMUdriKdjeFFDmFry2V7wjiPhEXjnnG9THxVl216/KCoco9jX99kbv+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wk8Ca4R6; arc=fail smtp.client-ip=40.107.236.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wk8Ca4R6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVdjpVt+Lj1xTzHLUfvWcnNaBDAruNfCflImq1BTgnn2KPVoxd40dVyQ6gUnkAkK35iylfA9lKcbKAuP6xmpAZXSRwA81T63sAXgnXPjCkZtmhpQ88QxmjdeHdB1xzzJvApv91iDHyJBM6dH+MjXNYTr9pYwrfxf3MYHx48T840Y36GBshhmkTgPpXq7WPaV5Vx8ql+kZZ64V0Tkj6+i/9Tup2rhVxxsC+jCdoyJXXBx2owY8InI5YQCZDY3HtS+b8l38XhpwYHSkWxJjCSJZTYmBayC6oOaM9KqRfRbpSGVUnQqhWd9XoJdMo56Tdsb6lAuLKf3vGjKRnuegyMLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plURYuN4ysf5oLlpMhWVZ133GQ+QFErG5t1EV3QbsR8=;
 b=UwvT7dCs5pPXjjRmK032ZIsmaa1FiDC3/i3o+SNd97Ir8wAYHAJmSGDrNSwS/yUtdGArOaqJgBkPcnxrGDvm7/pfbMr2LMLeTl6yensn2mUIvtT8pEpLeQRn+MY+TWHkZbhcpHuApR9L+bwx6YdWvdWncnudJ0EmcYUjQ9EPQNdYSAaxnKxhHO6SlOqlpYUaZw0d9E+3mpChi/XdwjU3Ta9euodgLgS1kFUzbLZM6JokWTYvJyM0Y49TY2Fja+WlvGV33gzwfhto/bZ9fcXPvAqJh8PP7YZ/y0TB0NvjvPNYURhFBfVWZT8NCc8LGyQv5meM3YYB1vueFtC27UZm8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plURYuN4ysf5oLlpMhWVZ133GQ+QFErG5t1EV3QbsR8=;
 b=wk8Ca4R6sD9Pc2oZnhJJ6CgbGXguxRmi8hu/8Q9UR5EBZLSfKAgHjDpt2vDylWJF3GgAJNwbAOHs8iUjwwV/pZ5EeyHkJbmCRIlpFxTVG2X8cMc32yVV4S/nwdPQiw9JzYiqhEJOPk29sh/aouOyhEC8H7Po7xK0Uxd5mvWALEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 11:31:29 +0000
Received: from CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753]) by CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 11:31:29 +0000
Message-ID: <17283434-d730-4798-8d41-106eff8c98ab@amd.com>
Date: Mon, 7 Apr 2025 17:01:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] misc: amd-sbi: Add support for CPUID protocol
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, shyam-sundar.s-k@amd.com,
 gautham.shenoy@amd.com, Mario Limonciello <mario.limonciello@amd.com>,
 naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com
References: <20250402055840.1346384-1-akshay.gupta@amd.com>
 <20250402055840.1346384-8-akshay.gupta@amd.com>
 <c7efb154-9e44-402f-b0fb-c9bce54645b2@app.fastmail.com>
 <2025040258-snap-aerospace-6e43@gregkh>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <2025040258-snap-aerospace-6e43@gregkh>
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
X-MS-Office365-Filtering-Correlation-Id: 5a6673a6-7074-48be-531f-08dd75c7bd24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0pVWmNVY0k3T3NuWDJUbGFwQkpQVEczNHhIbE9RTEdRMnZIZWNFS0ZGZkFG?=
 =?utf-8?B?Wko4UzBRYnhiNzYycmdHMXVrZC8vdjQ0cUM4VzdpODQ1bHozT0tHMzNvb2c1?=
 =?utf-8?B?QzdkVWYzKys5eEQ1KzI1SkR3VzMxVjVCZkp2aEhGZGY1L01JSFdHVW40WjMx?=
 =?utf-8?B?eUtGSGpNODdmcXc1clBhRTcySVcxSXlNdXJTQjBuRU0xTE9VaGVVVDBBeG1D?=
 =?utf-8?B?L0w4aHhYZlpJV2R6a1hUZkgzcjF5Zm1GR1RXWXVKcVhma0ZzSkJvMFh4clRs?=
 =?utf-8?B?Rm9WMXg5NlgyNWpHYmFUcWJxOWVmME5vd0NNZDBCbFl6RE9kY0t0YzZ4cDhz?=
 =?utf-8?B?S2RlbWxXbDh3QlB6UklraW9DdnN3SFJlWVJMd0NHSysyRVBsbSswdElRa1Fj?=
 =?utf-8?B?YXBpWEtLaGhZVnY2Vmk1TjUvUEIxOFVXZzA0OUNJUmkyeWN6QmpoNlJDRHp4?=
 =?utf-8?B?RmwvM0dwcklkUHpZa2N0OEZZRHNzYzQ3NWdRUzNteEY3YXlmZGhVSTdVQkgv?=
 =?utf-8?B?VWdxSGsvU3NZVnRTTXcyWm1PVWVXRXJ6Wm9LSWZaMlVWMGZUSW5MQnBxM1hP?=
 =?utf-8?B?SFZuclQ3bGxCYTBCMTBjTXAxL2NUcXd5cjVnR0NaUUZSZXFoS0lOZzM5azFV?=
 =?utf-8?B?K25HdmN3NDBTUHlkNDBQa2ZJUDh1Zm1NOEl0QjVUdXRUVUVlUHdndXVCS1Rs?=
 =?utf-8?B?ZDA4Zk1xeGw3TUtmR3ZLSWJTZlFXRk5FUm1IMmYvUUhwQldWdndQTWpTSUxh?=
 =?utf-8?B?djg1NmNwVnllTytrOWxwKzZtK3RYZndmREJDRGwwMnhWbWQ3V2R0cVR4d2pW?=
 =?utf-8?B?ZkdOYVVJOFZ3cHZyZllOZXhQOGpGbmNVYXpENFZYeGZvTnNiOEp1SVplSCtU?=
 =?utf-8?B?SUZkNFB5RnlxSVQybDdCTnNuM0g2NG44bXNQNzNXQ2JQL1R1ZlB5eFlUaUsx?=
 =?utf-8?B?N2N6cEU4QnkrZ2F3aFEzdnJJcVFqTlNtRVJYNWYyQVlNTDZLcmxGSlNuZ3JR?=
 =?utf-8?B?S0NlQTZwcHluazRHbXJYNTlzS25naVk0NnBZdXhwenYzeUZQR3oyK09kVVNI?=
 =?utf-8?B?ak1iNFp1VkEyL3M3aUpKRzBGSE0wWkF3cm9LZXFxdXRTTmdJQThxMU5hekxz?=
 =?utf-8?B?aGtJeWNFZ1BPbGFxOTMwWTcyeDJYYXlFMG9IRUI4dkJ2ZU1ORGtQMW1xcEVN?=
 =?utf-8?B?NldKTFFiUDV5dkJadjB4bHpoUnRwRDZ1dlBBWWMvYzRZWlBBSzhaSjVKdWF6?=
 =?utf-8?B?NXdJWURvNFRSTmwrcUlaR2RRNXhMMllKSEsvRVV0aGh0andMTUVHQXlEZzVG?=
 =?utf-8?B?aWx3UzlIc1JTdXVoZUZUWnFOVC9CSUhZNHJsS3lTNGxwT3Z5T0lmZkZmdkR0?=
 =?utf-8?B?NlNGSVVPTmdZNlYwRGk1alY0Y2IrUlA5R1V5RTdpaHBMZTZvVitRNEc1VEZ4?=
 =?utf-8?B?R2Z2NHBYTFRibmFwTEQ0VUl2Rmd5cXFtbWU4bklYSjhZWWRjQWhoSVBvUjAw?=
 =?utf-8?B?Smpva0h6ak41bkdPYzJuV1NSZ29UU2RPQlc0dS9uRk82UVJ5eHczY0E1VlVI?=
 =?utf-8?B?QzdJOEJVdTBaRUJSZmJXaTlEbmhBQVBTNHA0aU1zNEk1QkFRdXZlUnZpaUlD?=
 =?utf-8?B?cEpkWXF6bDNPbW9XOHRMM1hFQStvNDFUMk11bnptYmVsWmZKWWRlOXltMFJz?=
 =?utf-8?B?R3YyRVNER1dHdWN3RDh3TzZzUXZHdFZ1UTl4bmZCeWEwd2h0V0FTRmhRQ2xF?=
 =?utf-8?B?U3kyK3FJdWpaNzJKM2pZK3ZpYWhQdWZBS2lnQUJwUnhGV0ZFNnFaSFF0MEhm?=
 =?utf-8?B?RkxoWDV0Ymw1dnZTenVsRzBkbVBPcTZuWXlvT1gwK2hIY1M3ZlBxZW44OS94?=
 =?utf-8?Q?dtlEJ8h5XPkjU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8909.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3cxc3hXa1pGUTZ2UytrS0JyTXprTHU5eU04M0hJUk5xL2hQRDFRdEY3NWk3?=
 =?utf-8?B?Z3JDU2dXUTFkbkFzYVNGRWR6ckt6ZHJ3cTVTdUI4aU52bktuNk9kekV6VmRO?=
 =?utf-8?B?Y25nZThUdXJCY2ZsRnFWUnY1dE5ITzNiVWRVR2Q5YWRkd1VmZ29sUElZdXRC?=
 =?utf-8?B?anpBK281N0ttcmFDdjNxeDVabzRETVVBTWJkYmVYcVN1Zml2UisrTXFZN1J2?=
 =?utf-8?B?dW1EZ0FDbHpyM0cralpER2FYa2gxWm1aUHFOLzZ5L2xrVllJaEcwM2dwMjFq?=
 =?utf-8?B?M3BuODNMOHQrK2RLTkdXSDN1SThmUm9VZTg4UDZuVnA4YW9yVXpBTStHQTIx?=
 =?utf-8?B?QXhlQW9qQmFMRlJSOWgra3hQcWw0TDcwcVpGempBdmE3bjl1dDJyUVRnYWc2?=
 =?utf-8?B?SENEa1o0aEpYVlZUemYveGU5RlVXNmp5dlk5N3dxOG9HSGovTVpoQzM3VUY5?=
 =?utf-8?B?cEtwYnFkYVJMWHNyTmZqNkZhK3o4V3dlQVJwSjJzbDJrbjY5QldXRG9iVGpN?=
 =?utf-8?B?dS9BYzNsV1JkN21mOVYyK0I2UGYzdzFXaXM1S3VZK2t4YkZTak1DVWdRVW9U?=
 =?utf-8?B?ZTlZeEVBTlB2WFpHVGUzK1VQNTRxNTY0SGkwdzkrVlRzR2lRYksrbjdGT2dx?=
 =?utf-8?B?S051K1Bid1hVdjlCRW1LV0t1V0JMSysveWxpejZSZXNvU2p0bFpmUjgrSXJB?=
 =?utf-8?B?VjN0SjgvNDRoelJKYWJwS296alhJRWtUMDM2Mk9qMnV5dkVaU0Mwc2tGSmFZ?=
 =?utf-8?B?RWFKaVZmdVNRS0RvdnRrZnh2SnJPS1JXc1VqWnJDdHdLcVB2Y29CRktYck9n?=
 =?utf-8?B?Sy9MNkpCZUcxU3NORDFvSWZPcG1iVG0wb0pna3NJLzQxb1BuUjJmbU9PcXVX?=
 =?utf-8?B?R0xHZ2lhTHE2aU1Oc0JhbVhuVFdjaFg5LzlEWWdXV084elhGRExSNUZLODdi?=
 =?utf-8?B?Zk9iNjZQV2hVcXh6b1YxODJxQXpRRlNRMjRHSHJoalloNUtLeXdaS2Z5VnFo?=
 =?utf-8?B?aXBaTlU0UGZqNlViVEg2REFuaFByc2x1bnl6ZDkvR3VrM2JZc1FNb2pyaVF4?=
 =?utf-8?B?N1FkaVJwVnZnRVErQUplWEFCWTg1SHVTeTQ1WWxwSmRTYU9qeVRQL29BWHJ1?=
 =?utf-8?B?RUdFMndqSVVtWWpWWWFCbUY2Q2VDaGYzY1dYd2docFF6Qjk4RDArWXdTT2RT?=
 =?utf-8?B?QnZhQWZDT1k4clBuekY1VWNtVG5NQy9NYlRTbmQzeng5OTJQazh1QncrUzJI?=
 =?utf-8?B?eVcyTE1zQml2WXJqalRDaHkrZmc4WlYzNlZNMzdmTStPL1VUbDNDRU4wZ2RY?=
 =?utf-8?B?Z0VOMitzQjNWaVhWbUJDTWVRZktOaW9sS3lGSjFtdWV3bHRqa3YvMW5NdGhW?=
 =?utf-8?B?dEtONGY0dXVlemtWRnFUNGVNTnIwOXFIYVBYb3RyeGt2dlF0azh6eTREcm54?=
 =?utf-8?B?SHBGb3ZpSnZKZGJGNmlwT3hod0t0cTVxYTVBS2hweU1HcjBONElnNzUxN0ZH?=
 =?utf-8?B?aEViSWMway81RzdWTkJqSTYzWDRpQUVkSG9qUDNiWWpiRkd2cXprb1NidkhS?=
 =?utf-8?B?MUIwdHlxQThDQnU5TzZnVEVBVnJSdTdod1B6L0lkVElUcmx0eXZrMDhOSWFq?=
 =?utf-8?B?WnZDWWVkK3JRZ2dsdy9ha3pML1FZTlhQczZiNy9YOHdGTmNuMW85QVVMS2VO?=
 =?utf-8?B?cWh3UVcvTVJ5aThlTHJkWk9TNW5ZTmY1bWhPdys1MVdIQzErLy9sMXdMajFv?=
 =?utf-8?B?L0w4S0FzUm5IWnZWRkE3dFZLc3YwbzRqakEyeFNSZzNLYnVVOUtXNmhyQzEy?=
 =?utf-8?B?SFpGN2s1UStJMXRQWDI3WkVrWktnTUFOZ3hxczYwUjdIbXN0eGhpZjRCUSs4?=
 =?utf-8?B?WG5TSEs1NVV6Zlo5aDJvREV4SVdSTC8ybmMxaDl2Vkh3QVo4QTI4amo5ZXI1?=
 =?utf-8?B?Ri9ubDF6d0gvSk1oeFA4TTBRYk5iK25ORHptbnlvdzQwaDN1T0p4REsvckVt?=
 =?utf-8?B?bW84cFpESWtyQld3YTI0Tk9jK1NYbU5jUmlpUzBlY0tZQTg2Y0FjU3Jyczd3?=
 =?utf-8?B?dWhkc2NHN0ZXQ1NOd1ZYUmY3bGZ5MUFtQ21rdzc5cmJQOE1QWnh1WW4velA0?=
 =?utf-8?Q?6bWFZ8vsX5TXrjvezyPhaN5UV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6673a6-7074-48be-531f-08dd75c7bd24
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8909.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 11:31:29.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDpEJOr2VmDxvCZMCMLNW5SWrXaPsCbxSo/0ZodYt5O/W8zao3/b4vmA5RRr8w2uSGwjU9d5qe+9Y8WXKR1axw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493


On 4/2/2025 5:46 PM, Greg Kroah-Hartman wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Wed, Apr 02, 2025 at 02:13:22PM +0200, Arnd Bergmann wrote:
>> On Wed, Apr 2, 2025, at 07:58, Akshay Gupta wrote:
>>> - AMD provides custom protocol to read Processor feature
>>>    capabilities and configuration information through side band.
>>>    The information is accessed by providing CPUID Function,
>>>    extended function and thread ID to the protocol.
>>>    Undefined function returns 0.
>>>
>>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>>> Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
>>> ---
>>> Changes since v6:
>>> - Address Arnd comment
>>>    - Add padding to the uapi structure
>>> - Rebased patch, previously patch 8
>> This changes the UAPI again. since you change the common structure
>> layout.
>>
>>> @@ -134,6 +279,9 @@ static long sbrmi_ioctl(struct file *fp, unsigned
>>> int cmd, unsigned long arg)
>>>              /* Mailbox protocol */
>>>              ret = rmi_mailbox_xfer(data, &msg);
>>>              break;
>>> +   case APML_CPUID:
>>> +           ret = rmi_cpuid_read(data, &msg);
>>> +           break;
>>>      default:
>>>              return -EINVAL;
>> As I previously commented, I would prefer to have a highl-level
>> interface per specific mailbox item you transfer, but I think that
>> is something we can debate, in particular if Greg or the x86
>> maintainers think it's ok, I'm not going to object.
>>
>> However, having a combined ioctl command and data structure
>> for rmi_mailbox_xfer(), rmi_cpuid_read() and the commands
>> you add later seems to cause a lot of the extra complexity,
>> and I think this really has to be done differently, using
>> distinct ioctl command numbers for each of them, with an
>> appropriate structure to go along with it.
>>
>> This does mean the existing userspace tool will be incompatible
>> with the upstream driver, but it can be easily updated to
>> support both kernel interfaces (trying the new one first,
>> and falling back to the old on after -ENOTTY).
> Different structures per ioctl is the way to go.  It's more
> self-describing and easier to audit for reviewing that the code is
> working properly both in userspace and in the kernel (i.e. tools like
> strace work better.)
>
> So I agree with you here.
>
> thanks,
>
> greg k-h


Thank you Greg and Arnd,

As suggested, I will create different structures and IOCTLs for each 
protocol (Mailbox, CPUID, MCA MSR and others).

Thank you.


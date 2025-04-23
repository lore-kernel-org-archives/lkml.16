Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D4928FFED;
	Wed, 23 Apr 2025 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436452; cv=fail; b=e4c0bbX3UBuFpDZ+TENnH6tqFTTX1W8yqH1kvMjYg1iNha9KwGgH1+hH7XGRHJ3wkNjA2JaPu7peotY8tIEDr2Qy+APHko78slfTfeY8ydAF26exZqcTmjSMe/Tk4Rou6e/1XQNr3byvE9TUxhcm6/ZKyYMBvBBs8ya/D5+0bNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436452; c=relaxed/simple;
	bh=Ryk6DrYSfKp8rQB/PPq/5OsvLP5eJgoZjwO66DrnhHg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VS92WmGW3gUXkBx36w4crDTj9BEM6EW4yPriZqSqfgLumlvRvEM2acvk1rY67vyIm08mzPeQXgbSdwiAt/l9Xjo4taxjCrD3fbmaIfYOMwax5ciB3jd7O9K6z9llavXHCjHkz7N8aejxU/Ganb+SSarHSgkAujudL4DHSqJwmlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cyOf7u8V; arc=fail smtp.client-ip=40.107.223.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cyOf7u8V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky32dwlbWsrNLUEOAtI3rCgdGaCZcNCIgYgp9aR1KC6w5AhAH6XWR4Y4AoABDVydC3OeBYIEaM+FjPJ2DG3hSxiiH/maGLJ01Io4b68g0OUPWdy4yKetCCQ7TokoGIF9ptn0iLOU1Dsjcb6AmV2FTm/XmQxG9qBCM3q4BQsMYm8d1Qs0lGBaq9k20K2h2fmZFMzhzuW+Vd00YTc2D0xVXv8IAjsiIfXm1y6LDbtKOsruiFR/92etI/65EgsWohHZy3dE3/X6GRw30eaoxyw/ycZC20N2umn6Wp6itE7D8REd4dM/3+8aX/OZnW3HWMqJRakeh/ZXXvleySLqM6Z59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2SAR/b7h3e2h70YaGOUB9HPZAmtGB7DavvTFLErWlc=;
 b=UpT9LeZHHXMz5ob55F/PuFXjAO/GYVRIyrzZZMEDcvzz8JwDLdwTDGyYGKpEm/JlgIgauZWsSFQ8M1gCVCFfi6sACTJ4++AeicbXd6RfNuiAaG33ZNfm584fVBKRwl/QE0w8bcSQqyqjS4E9WReoMSRCl9UhrKIM5Q9KC46TWtC07S2GGNNPAuUuCrA3l44JDMs85fcRgktSIstL3rYGtUEvXdj+Tz+QRjwRp1yh276T9xeVNGPSaDGidZHJbqhBRAG8r8SKr6kF8CHY9HY3fnz8XQbLa8jDTm6azktYqq4rpw2XdtPRnByhO167c0tEtEMZ0NLpjO8qAlwr0Gd2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2SAR/b7h3e2h70YaGOUB9HPZAmtGB7DavvTFLErWlc=;
 b=cyOf7u8Vmso7stYdHovYSpr2AZisyq5RYdSZ75YCYC6bJvxIshMWYfbodMFpLfSLIQ0gC+KxTc18jvjQvNbRwL0LeuJi7GNU/u083+6x1YstvXY72s9/+/tdoKlf9do2MwqnmrV50IClnj0IHf7/1dyKiXkEwu+YwliUS2zoT9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6740.namprd12.prod.outlook.com (2603:10b6:510:1ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Wed, 23 Apr
 2025 19:27:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 19:27:28 +0000
Message-ID: <691c35de-f054-40a1-98bb-2b602e256011@amd.com>
Date: Wed, 23 Apr 2025 14:27:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Resume from suspend broken in 6.15-rc due to ACP
 changes.
From: Mario Limonciello <mario.limonciello@amd.com>
To: Mark Brown <broonie@kernel.org>, Jacek Luczak <difrost.kernel@gmail.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org,
 venkataprasad.potturu@amd.com, LKML <linux-kernel@vger.kernel.org>
References: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
 <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
 <c0c9205d-d1e3-4952-a13e-6d23656880e3@amd.com>
 <1b850037-8361-4c18-a32d-3ca50b69866e@amd.com>
Content-Language: en-US
In-Reply-To: <1b850037-8361-4c18-a32d-3ca50b69866e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0151.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 1312d1e6-20c7-4600-8017-08dd829ce227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ak5SWHA2UUE2YUJwQ0dPU0diK05yMExsL0xCeXVlWUhoSnYwM0xYM3M2L0FM?=
 =?utf-8?B?ODJzZVhENnZSYmVXaWxFbEwxaXA0ZElDRmVDWkFscWllNSt3dUNxaUk3bGxZ?=
 =?utf-8?B?YXk1WmlvQlcyaVlqNHN5MEtQcWlmeU94MUdjVmJTRzNUUmljME5xbW1SOXVp?=
 =?utf-8?B?OHkwNmwrZ0o1WW5nYUlXMGhWa1F0NWt2YnRRZ0oyQlQ1SmMxWDFOTVBhOHB5?=
 =?utf-8?B?cGUwL05wcU1MQ3pVcHEwb1FVQTJ4Q2lQUUhTa3VJUlQxWUNVK1N6Y0F2TGx5?=
 =?utf-8?B?Znowa1B1MWxaMnNhOEh6em9ydlBGUWhpUlJKbURzNmE5RU9vcnBJQ0xZc3lQ?=
 =?utf-8?B?b2hhM1dBNWxmM0w3a1ZLeFRZRkdYcXdwNnVQa2pNd2hxc3FSM1FFQ3lXSC81?=
 =?utf-8?B?K0prWFQzR1RrZnVwalpyWDZlL0Y4WFhnMDRFemV0WjZiOUVya1IyZ2NPeG9I?=
 =?utf-8?B?K2tHbjl2bHpESlJEV2JQVWdFWkpvU2d5dEJTNEJIa2xDS0dHbzJ6S1NzOFM4?=
 =?utf-8?B?WWRUVlF5UWZETTZ3alM1UTc0MXVyamtuak0rL0dCMEdTYkhrUm1PUTBxUXJ3?=
 =?utf-8?B?eVBPSUtjNmlUOHkvektyWnFIeXd0QkQrK2w4UFJQNlNlUmpKS094eUJGbzNZ?=
 =?utf-8?B?RTFtQ09FNTJVYlI3SzVadmN5TkQydmNMa0lUdmNUR2FYNTRJYVd0eGxmdXNu?=
 =?utf-8?B?MDdkZVZPSkFqQkFxVXY4RDVUckRYWThWREE0eUhUckRhdldNdGRUeisxRGdC?=
 =?utf-8?B?S2I2SEdqLy9pM2JzRUlNSnpZMzIvSzhkaW1pRnZYenN1M1gzTVhyaHlnQkV4?=
 =?utf-8?B?WUlkWHZrelFYaVRLYjkwTitaSWVNSGV0S0ZJSVZ0SjA0bTB6Wmlwd2VHNXpx?=
 =?utf-8?B?R29hUUdWM3RmbDJrY1BFS0V0L08yeUhpYkxGZXEzMUZFSXREdmNWdDd0VHgw?=
 =?utf-8?B?cUV1US9zVjh2WEFZcUlqK0I4Q3lGYnVMKzU1OWN4aEk2ekdGRVVtVmRZK3Bm?=
 =?utf-8?B?Y05ObGdBdXg5RUd3MGJKTVVLL1F1Vkt0bkE5UXVFRFVnblVUdEcrQmh2SHhC?=
 =?utf-8?B?T1ArZ2dnSzR6QmdoVjMxYUg4QTB6UVcvMWJSUWhDOGl2UjNwQndiRWJTcC8v?=
 =?utf-8?B?bngzckRIdEhwcTFpRjFJU0JjUEhSeTFneEExbURWVTZ4Sm1rV1ZQSnZqSlpN?=
 =?utf-8?B?NHZXcElTYlFHUGdjNkRVeGg0eGcvVnRlTXk0Vm9neHM3RFRXZDFZeDBmWXV0?=
 =?utf-8?B?SlR3d2R1c1FGN3RQVE9Ham5LeFBzMHUraFdrNDgydXJJU3hzdmNoZ2YyY0xG?=
 =?utf-8?B?QjdJa2QxR0dsRWRuV2lydkFsSWJ0Q2luYjlyYnU1WUdBb3o1NFQ2UHM4cE1Z?=
 =?utf-8?B?WDJodzBzNTdWWHpvOEJ6bXBmSG9hQXgyVXhZZzJxRFo3NzZGY2VhTHRZcXVK?=
 =?utf-8?B?WWgyRUJkQjM1L1FqTmR4RktnTDd1K0EzTDN0bnVPSFpoYUNuN0FTd3I4c1N1?=
 =?utf-8?B?L1ZDcFlNOHU3c0U5VWZuQ2w5ZUVKY1ZOLzVmRlNHZ1BMRnkzNlhqUkdMMlJT?=
 =?utf-8?B?bGg5TDdvdjRvUWFkQ1ZnbldZdVpZUGRzYldMNE1FS3dZcGFFNzJOanJLODdC?=
 =?utf-8?B?Mks2SmhnY1gwREpsMU15S0VXTllCaXJpTlhiTFFKbjlCZ0lpcEx0VXRpMU41?=
 =?utf-8?B?b1RLNW41SHpIbk1SUFI5TG9HaEdrRzEvL2I0WS9MUm44MitGdGtBMFE2bWhR?=
 =?utf-8?B?L1pIYXlmVC81UlU4dlhuSnNWWkZ5U25meWludVB4ckUzaEI5WXBsZTR2K0Y3?=
 =?utf-8?Q?JlqgstFtTzl08CpJTkLkxnZNpLEM/dYKhcg2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2N6NlVmUHpzMlFid1BzeStyZFJCazNua2tFNjkvQ1dFRFR1dDc4anJDcVU2?=
 =?utf-8?B?T3YwdmNoekFFWDhVNUJEQVQxcHV2dGhDbUVPWisyOVRKMmRaUzZESjhyTDh5?=
 =?utf-8?B?eTBhb0tBMVF2WE1CTEdBOWZXVEFQeml0S3kxVnRFZ3F2NllkTGJTQXcrNHRX?=
 =?utf-8?B?TThQcmtXTEt4Ynk0Y04yTkhRRkhmc0Voa3c2QzFRZTFqMHlhZzRDZGY4QXpG?=
 =?utf-8?B?eUl3emo4QkJPQ1RaVXBZYlR1YUUzcTVnODUzdnFxQTdpdFlmY0tIL2p6ZXZa?=
 =?utf-8?B?d1ZoK0MrWTU1WnFVTHFYOTZxblEvZTdwYjUwNkJlZXZUK1BhcVJqLzFhQ1Mr?=
 =?utf-8?B?NVV1QjRWRUpITHhvV3RSSWxSSUxiZ2k5NnZrNVFVQTBoSVR4SmFqSWZhb2dw?=
 =?utf-8?B?a21FS1VjWWlUMXhVL0hDYUw3ZWgwYmRlVDBhNjVSeDFIZDJHSVdYekRVa1lR?=
 =?utf-8?B?Q2R0azcvZW44Vlg3bTNhVWM1ZjZVYUVUR0poQU1VQzVGMVpyK0NoS0ZrWitY?=
 =?utf-8?B?VC9GOGZDZ3IzTzhtNmVmUHFIb29jSnBBUVpud01rYVEySTRzL2kzQ0t2TTZN?=
 =?utf-8?B?M2pQeDExV1V3UjF6K1BnSW4yU1U2eEJlZ3hNMVhLNWVQNm9FOTRQaVFXVHQ1?=
 =?utf-8?B?NDNYWnJKeGZpdFRLV09LUkE4TEpNQWl6MVdGQXd4T0NvL0NGeFpvck1BN2xR?=
 =?utf-8?B?RnlFWmh1STh1VFc0aG5NTXhJRFdodkxlMUR6MWlESGcvSVU0eWZoUm1XK2M4?=
 =?utf-8?B?N1J0MEhqNHRPYjFlNGk0NHQ5aWE3NFV1UmpnU2xvVS8xK1kzaGpZRXdFMzIv?=
 =?utf-8?B?bUdySG55THJ3cTZISVl0bm1oQWMvdG01MWFYdEYwMlR5dXNkV0s0RENpWTFP?=
 =?utf-8?B?YVpOQ1Q2M2xxTlcxV3FYTjcvNTEyTC9pUFBtZ2ZtVnhIdjdESHpUKzJWT3ZP?=
 =?utf-8?B?UU5xb09VR0p3NlY5STBuUUVNQUM3TUdIOUVsR2dTdCtrL3VNK1hFcjhVV0F0?=
 =?utf-8?B?Q1dPVk1STFFIbE5HcmdJVWxWV2lVak9XTlU5MUFBUkk1VnpEaXVGS1RIUDFL?=
 =?utf-8?B?bmZRZkkwckFSSEtxZXBvcVRsY2YwMHM2eGUzaTkrUHhNQlBlQkZiaXR3QzF1?=
 =?utf-8?B?YmE5YkwyelVrTXozMjIzL0xLbnJHMmUyQXRXOVJEemRwbktIQTFJNGFNczhO?=
 =?utf-8?B?V2d5c2tKSUxaN1Iwb2tNWkJkUXdkemNSN2RFR25UWmlpYWFlOUxSV3BValJU?=
 =?utf-8?B?blk2ZVYvVzB3UkZkcVpHUUJGTmI1NjlReW90a3JhVHBHU21ZT3hUN2VndU9T?=
 =?utf-8?B?V2lQc0tSWTVFWEpGMWQvNEhtdHRKaFNINGdWWlhHaGd2Z2pFS2hSc1JmWE4v?=
 =?utf-8?B?NnJyVEJQQXVJNHV0WEFyQWplcmhkZk9PdHM4QWZNT1gwa09BL2Q4Tm13QnZG?=
 =?utf-8?B?di9XUXRVaFhzTjI2U3g5RDVJR1JOWmdSQXV6SkkwRUxiZGFscU1mVXRraGRl?=
 =?utf-8?B?VnBVM2FwWGR3ck9oWHhKTzV6NGlQd2lpaXJYaWRsdTQzV3dkZVRHay9hM3Yr?=
 =?utf-8?B?UkxIQ2VWbXFGWDFxT1JOanlIUVVDN0VJQmh1RXNteVRvMVN5alJSY09kdWFw?=
 =?utf-8?B?MWNYY0VMYzNzSVZzZWoybTR0cC9tREZOUXk1eGxwT3JBc2JLWUJ2dGVBemVZ?=
 =?utf-8?B?SkNoOHJmOGd6SkMrQUlURFFmd0d3NlVMaWMrbHBNRTBmMlpwYnlEWng3STVh?=
 =?utf-8?B?VXV2YkwyQzFTWEhsc0pURkNzcHgzWnpXMERsaHo0bG1xeGxkQUUwWi95MXJU?=
 =?utf-8?B?alpXV0ZHcXM0ajgzK0ZURDBwSTRQWlZFZ3FrUUFSeHU3S1J3SElCUVlkcVFC?=
 =?utf-8?B?WnZUTUgyVmpCcHBzV2VQdENCelZRUWNUVFpOZFdOVXJydkVPNVpNc0RJRklM?=
 =?utf-8?B?WS9tb3phWjNYNE1Od1JsYmM5TGp4ZmR0RXYrNk1LMmNVWFh0cDQ4dU5MZ3hJ?=
 =?utf-8?B?M3hSRkZ0UjdEK3dXcFVET2pvMmJvbGVxZG9YTSt1MTRzTXZlZVBkQU93eVFF?=
 =?utf-8?B?WmpyeUhRUUxyQ0NkVVBmVnJDdmV4dXZDLzZEcjVSTUFlamN1YUt0RnZLQTU1?=
 =?utf-8?Q?griVE98YqnS0IxTRIbUKAe8+s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1312d1e6-20c7-4600-8017-08dd829ce227
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 19:27:27.8993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QY1OJGW4zHpjnC33w5NlpnjVNICiD3XDFWQj34SG3+YYWOFW0M7uyv+8Qgjx1kB5tXdMT+1vGvAnaC/Yyv5Sbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6740

On 4/23/2025 2:12 PM, Mario Limonciello wrote:
> On 4/23/2025 10:18 AM, Mario Limonciello wrote:
>> On 4/23/2025 10:06 AM, Mark Brown wrote:
>>> On Wed, Apr 16, 2025 at 01:20:33PM +0200, Jacek Luczak wrote:
>>>> Hi,
>>>>
>>>> On my ASUS Vivobook S16 (and on similar ASUS HW - see [1]) on resume
>>>> from suspend system dies (no logs available) soon after GPU completes
>>>> resume - I can see the login screen, only power cycle left.
>>>
>>> Are there any updates on this from the AMD side?  As things stand my
>>> inclination is to revert the bulk of the changes to the driver from the
>>> past merge window, I don't really know anything about this hardware
>>> specifically and "dies without logs" is obviously giving few hints.
>>> None of the skipped commits looks immediately suspect, there's doubtless
>>> some unintended change in there.
>>
>> This is the first I'm hearing of it; I expect we can dig in and find a 
>> solution so we don't need to revert that whole series.
>>
>> Let me add Vijendar to check if this jumps out to him what went wrong.
>>
>> * Can we please see the full dmesg up to the failure?
>> * journalctl -k -b-1 can fetch everything from the last boot up until 
>> the freeze.
>> * Any crash in /var/lib/systemd/pstore by chance?
>>
>>>
>>> Adding Mario and leaving the context for his benefit.
>>
>> To double check - can you blacklist the ACP driver and suspend/resume 
>> and everything is OK?
>>
>> If possible can you please capture a report with https:// 
>> web.git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug- 
>> tools.git/ tree/amd_s2idle.py both in the case of ACP driver 
>> blacklisted and not blacklisted?  I would like to compare.
>>
>> Also; can you put all these artifacts I'm asking for into somewhere 
>> non ephemeral like a kernel bugzilla?  You can loop me and Vijendar 
>> into it.
> 
> FYI - We managed to track an S16 down and can reproduce the issue.
> It's a NULL pointer deref happening on the resume path.
> 
> <1>[   74.046372] BUG: kernel NULL pointer dereference, address: 
> 0000000000000010
> <1>[   74.046375] #PF: supervisor read access in kernel mode
> <1>[   74.046377] #PF: error_code(0x0000) - not-present page
> <6>[   74.046380] PGD 0 P4D 0
> <4>[   74.046384] Oops: Oops: 0000 [#1] SMP NOPTI
> <4>[   74.046389] CPU: 4 UID: 0 PID: 2563 Comm: rtcwake Not tainted 
> 6.15.0-061500rc3-generic #202504202138 PREEMPT(voluntary)
> Oops#1 Part4
> <4>[   74.046394] Hardware name: ASUSTeK COMPUTER INC. ASUS Vivobook S 
> 16 M5606KA_M5606KA/M5606KA, BIOS M5606KA.304 01/24/2025
> <4>[   74.046396] RIP: 0010:acp70_pcm_resume+0x4f/0xe0 [snd_acp70]
> <4>[   74.046405] Code: 48 89 45 d0 e8 c2 da 98 fc 49 8b 5d 50 49 39 de 
> 75 18 eb 7b 48 89 da 4c 89 ee 4c 89 ff e8 29 cc f6 ff 48 8b 1b 4c 39 f3 
> 74 65 <4c> 8b 7b 10 4d 85 ff 74 ef 49 8b 97 c0 00 00 00 48 85 d2 74 e3 8b
> <4>[   74.046407] RSP: 0018:ffffd12644d13880 EFLAGS: 00010286
> <4>[   74.046410] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
> 0000000000000000
> <4>[   74.046412] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> 0000000000000000
> <4>[   74.046413] RBP: ffffd12644d138b0 R08: 0000000000000000 R09: 
> 0000000000000000
> <4>[   74.046415] R10: 0000000000000000 R11: 0000000000000000 R12: 
> ffffffffbd774fd0
> <4>[   74.046416] R13: ffff8a9f13051e00 R14: ffff8a9f13051e50 R15: 
> 0000000000000010
> <4>[   74.046418] FS:  0000799af9db9740(0000) GS:ffff8aa486e9d000(0000) 
> knlGS:0000000000000000
> <4>[   74.046420] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[   74.046421] CR2: 0000000000000010 CR3: 000000016dfaa000 CR4: 
> 0000000000f50ef0
> <4>[   74.046423] PKRU: 55555554
> <4>[   74.046425] Call Trace:
> <4>[   74.046427]  <TASK>
> <4>[   74.046432]  ? __pfx_platform_pm_resume+0x10/0x10
> <4>[   74.046439]  platform_pm_resume+0x28/0x60
> <4>[   74.046443]  dpm_run_callback+0x63/0x160
> <4>[   74.046447]  device_resume+0x15c/0x260
> <4>[   74.046450]  dpm_resume+0x15d/0x230
> <4>[   74.046453]  dpm_resume_end+0x11/0x30
> <4>[   74.046456]  suspend_devices_and_enter+0x1ea/0x2c0
> <4>[   74.046460]  enter_state+0x223/0x560
> Oops#1 Part3
> <4>[   74.046463]  pm_suspend+0x4e/0x80
> 
> We'll need some more time to dig into it, but I wanted to share the 
> trace in case it makes it jump out to anyone what's going on.
> 
> Just looking at git blame from that function is this perhaps 
> 8fd0e127d8da856e34391399df40b33af2b307e0?

Reverting a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90 seems to help the 
issue on S16 here.

Jacek - can you reproduce with that reverted?

> 
>>
>>>
>>>> I've managed to bisect this as close as possible to following commits:
>>>> - [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refactor
>>>> acp70 platform resource structure
>>>> - [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove 
>>>> white line
>>>> - [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move
>>>> spin_lock and list initialization to acp-pci driver
>>>> - [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove
>>>> redundant acp_dev_data structure
>>>> - [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new
>>>> interrupt handle callbacks in acp_common_hw_ops
>>>>
>>>> Attached lspci and bisection log.
>>>>
>>>> Regards,
>>>> -jacek
>>>>
>>>> [1] https://bbs.archlinux.org/viewtopic.php?id=304816
>>>
>>>> git bisect start
>>>> # status: waiting for both good and bad commits
>>>> # good: [ed92bc5264c4357d4fca292c769ea9967cd3d3b6] ASoC: codecs: 
>>>> wm0010: Fix error handling path in wm0010_spi_probe()
>>>> git bisect good ed92bc5264c4357d4fca292c769ea9967cd3d3b6
>>>> # status: waiting for bad commit, 1 good commit known
>>>> # bad: [47c4f9b1722fd883c9745d7877cb212e41dd2715] Tidy up ASoC 
>>>> control get and put handlers
>>>> git bisect bad 47c4f9b1722fd883c9745d7877cb212e41dd2715
>>>> # good: [74da545ec6a8b41de96b4c350bb59dfe45c0d822] ASoC: codec: 
>>>> madera: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
>>>> git bisect good 74da545ec6a8b41de96b4c350bb59dfe45c0d822
>>>> # bad: [a935b3f981809272d2649ad9c27a751685137846] ASoC: SOF: ipc4- 
>>>> topology: Allocate ref_params on stack
>>>> git bisect bad a935b3f981809272d2649ad9c27a751685137846
>>>> # good: [24056de9976dfc33801d2574c1672d91f840277a] ASoC: codecs: 
>>>> Update device_id tables for Realtek
>>>> git bisect good 24056de9976dfc33801d2574c1672d91f840277a
>>>> # good: [a1462fb8b5dd1018e3477a6861822d75c6a59449] ASoC: Intel: 
>>>> boards: updates for 6.15
>>>> git bisect good a1462fb8b5dd1018e3477a6861822d75c6a59449
>>>> # skip: [8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0] ASoC: SOF: Intel: 
>>>> Add support for ACE3+ mic privacy
>>>> git bisect skip 8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0
>>>> # skip: [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: 
>>>> Add new interrupt handle callbacks in acp_common_hw_ops
>>>> git bisect skip aaf7a668bb3814f084f9f6f673567f6aa316632f
>>>> # good: [c6141ba0110f98266106699aca071fed025c3d64] ASoC: Merge up fixes
>>>> git bisect good c6141ba0110f98266106699aca071fed025c3d64
>>>> # skip: [ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8] ASoC: cs35l41: 
>>>> check the return value from spi_setup()
>>>> git bisect skip ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8
>>>> # good: [269b844239149a9bbaba66518db99ebb06554a15] ASoC: dapm: Fix 
>>>> changes to DECLARE_ADAU17X1_DSP_MUX_CTRL
>>>> git bisect good 269b844239149a9bbaba66518db99ebb06554a15
>>>> # skip: [89be3c15a58b2ccf31e969223c8ac93ca8932d81] ASoC: qcom: 
>>>> sm8250: explicitly set format in sm8250_be_hw_params_fixup()
>>>> git bisect skip 89be3c15a58b2ccf31e969223c8ac93ca8932d81
>>>> # bad: [02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3] ASoC: amd: acp: 
>>>> Fix for enabling DMIC on acp platforms via _DSD entry
>>>> git bisect bad 02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3
>>>> # good: [7a2ff0510c51462c0a979f5006d375a2b23d46e9] ASoC: soc-pcm: 
>>>> reuse dpcm_state_string()
>>>> git bisect good 7a2ff0510c51462c0a979f5006d375a2b23d46e9
>>>> # good: [a8fed0bddf8fa239fc71dc5c035d2e078c597369] ASoC: dt- 
>>>> bindings: add regulator support to dmic codec
>>>> git bisect good a8fed0bddf8fa239fc71dc5c035d2e078c597369
>>>> # bad: [ee7ab0fd540877fceb3d51f87016e6531d86406f] ASoC: amd: acp: 
>>>> Refactor rembrant platform resource structure
>>>> git bisect bad ee7ab0fd540877fceb3d51f87016e6531d86406f
>>>> # good: [0d2d276f53ea3ba1686619cde503d9748f58a834] ASoC: SOF: Intel: 
>>>> lnl/ptl: Only set dsp_ops which differs from MTL
>>>> git bisect good 0d2d276f53ea3ba1686619cde503d9748f58a834
>>>> # good: [8aeb7d2c3fc315e629d252cd601598a5af74bbb0] ASoC: SOF: Intel: 
>>>> Create ptl.c as placeholder for Panther Lake features
>>>> git bisect good 8aeb7d2c3fc315e629d252cd601598a5af74bbb0
>>>> # skip: [ac5b4a24f16f2f56b5cc5092969930b867274edc] ASoC: Intel: soc- 
>>>> acpi-intel-ptl-match: Add cs42l43 support
>>>> git bisect skip ac5b4a24f16f2f56b5cc5092969930b867274edc
>>>> # skip: [8ae746fe51041484e52eba99bed15a444c7d4372] ASoC: amd: acp: 
>>>> Implement acp_common_hw_ops support for acp platforms
>>>> git bisect skip 8ae746fe51041484e52eba99bed15a444c7d4372
>>>> # good: [0978e8207b61ac6d51280e5d28ccfff75d653363] ASoC: SOF: Intel: 
>>>> hda-mlink: Add support for mic privacy in VS SHIM registers
>>>> git bisect good 0978e8207b61ac6d51280e5d28ccfff75d653363
>>>> # good: [4a43c3241ec3465a501825ecaf051e5a1d85a60b] ASoC: SOF: Intel: 
>>>> ptl: Add support for mic privacy
>>>> git bisect good 4a43c3241ec3465a501825ecaf051e5a1d85a60b
>>>> # skip: [1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609] ASoC: dmic: add 
>>>> regulator support
>>>> git bisect skip 1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609
>>>> # good: [e2cda461765692757cd5c3b1fc80bd260ffe1394] ASoC: amd: acp: 
>>>> Refactor dmic-codec platform device creation
>>>> git bisect good e2cda461765692757cd5c3b1fc80bd260ffe1394
>>>> # skip: [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: 
>>>> Move spin_lock and list initialization to acp-pci driver
>>>> git bisect skip a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90
>>>> # bad: [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: 
>>>> Refactor acp70 platform resource structure
>>>> git bisect bad f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0
>>>> # good: [6e60db74b69c29b528c8d10d86108f78f2995dcb] ASoC: amd: acp: 
>>>> Refactor acp machine select
>>>> git bisect good 6e60db74b69c29b528c8d10d86108f78f2995dcb
>>>> # skip: [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: 
>>>> Remove redundant acp_dev_data structure
>>>> git bisect skip e3933683b25e2cc94485da4909e3338e1a177b39
>>>> # skip: [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: 
>>>> Remove white line
>>>> git bisect skip c8b5f251f0e53edab220ac4edf444120815fed3c
>>>> # only skipped commits left to test
>>>> # possible first bad commit: 
>>>> [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refactor 
>>>> acp70 platform resource structure
>>>> # possible first bad commit: 
>>>> [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove 
>>>> white line
>>>> # possible first bad commit: 
>>>> [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move 
>>>> spin_lock and list initialization to acp-pci driver
>>>> # possible first bad commit: 
>>>> [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove 
>>>> redundant acp_dev_data structure
>>>> # possible first bad commit: 
>>>> [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new 
>>>> interrupt handle callbacks in acp_common_hw_ops
>>>
>>>> 00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>> Strix/ Strix Halo Root Complex [1022:1507]
>>>> 00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Strix/Strix 
>>>> Halo IOMMU [1022:1508]
>>>> 00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>> Strix/ Strix Halo Dummy Host Bridge [1022:1509]
>>>> 00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>>> Strix Halo PCIe USB4 Bridge [1022:150a]
>>>> 00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>> Strix/ Strix Halo Dummy Host Bridge [1022:1509]
>>>> 00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>>> Strix Halo GPP Bridge [1022:150b]
>>>> 00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>>> Strix Halo GPP Bridge [1022:150b]
>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>> Strix/ Strix Halo Dummy Host Bridge [1022:1509]
>>>> 00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>> Strix/ Strix Halo Dummy Host Bridge [1022:1509]
>>>> 00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>>> Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>>>> 00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>>> Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>>>> 00:08.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>>> Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>>>> 00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus 
>>>> Controller [1022:790b] (rev 71)
>>>> 00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH 
>>>> LPC Bridge [1022:790e] (rev 51)
>>>> 00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>>> Data Fabric; Function 0 [1022:16f8]
>>>> 00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>>> Data Fabric; Function 1 [1022:16f9]
>>>> 00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>>> Data Fabric; Function 2 [1022:16fa]
>>>> 00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>>> Data Fabric; Function 3 [1022:16fb]
>>>> 00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>>> Data Fabric; Function 4 [1022:16fc]
>>>> 00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>>> Data Fabric; Function 5 [1022:16fd]
>>>> 00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>>> Data Fabric; Function 6 [1022:16fe]
>>>> 00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>>> Data Fabric; Function 7 [1022:16ff]
>>>> 61:00.0 Non-Volatile memory controller [0108]: Micron Technology Inc 
>>>> 2400 NVMe SSD (DRAM-less) [1344:5413] (rev 03)
>>>> 62:00.0 Network controller [0280]: MEDIATEK Corp. MT7922 802.11ax 
>>>> PCI Express Wireless Network Adapter [14c3:0616]
>>>> 63:00.0 Display controller [0380]: Advanced Micro Devices, Inc. 
>>>> [AMD/ ATI] Strix [Radeon 880M / 890M] [1002:150e] (rev c1)
>>>> 63:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] 
>>>> Rembrandt Radeon High Definition Audio Controller [1002:1640]
>>>> 63:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. 
>>>> [AMD] Strix/Krackan/Strix Halo CCP/ASP [1022:17e0]
>>>> 63:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>> Device [1022:151e]
>>>> 63:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. 
>>>> [AMD] ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 70)
>>>> 63:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] 
>>>> Family 17h/19h/1ah HD Audio Controller [1022:15e3]
>>>> 64:00.0 Non-Essential Instrumentation [1300]: Advanced Micro 
>>>> Devices, Inc. [AMD] Strix/Strix Halo PCIe Dummy Function [1022:150d]
>>>> 64:00.1 Signal processing controller [1180]: Advanced Micro Devices, 
>>>> Inc. [AMD] Strix/Krackan/Strix Halo Neural Processing Unit 
>>>> [1022:17f0] (rev 10)
>>>> 65:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>> Device [1022:151f]
>>>> 65:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>> Device [1022:151a]
>>>> 65:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>> Device [1022:151b]
>>>> 65:00.5 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>> Device [1022:151c]
>>
> 


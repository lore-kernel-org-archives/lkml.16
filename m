Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2637296168;
	Wed, 23 Apr 2025 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421494; cv=fail; b=ZKAeyRmwt218feAXkiXvvt3pv2Q5TvVy/Rc/RWqZOwc98n7VuWe17uNgHYEoPt2KobV0smzzG9Eq+w3P5v0XR0ocPX5gwaC3VeG4ocE5/482xVKj/zLT8HR8Y1CCfVQC/yTAXsOKTjbZpfdiYX1xo+VO9thRzvR3umSX10MDAwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421494; c=relaxed/simple;
	bh=2tctOSSkOrqXYnrcTIZjsnOMTzRvmwVaa1CR/9wKoEg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CP9tuY6Cz9PYko9PV+T30ko9n3pHIKdxMeV5A/+fT8AkWGx9mVt8L9G+U1AWwLYsySOgUWdG9LYuYZ2Nj6EqA92O5bIdwXVz9uJHkwLH28YoB96nViVdqBealgL7/VTGaV+jUi23yAM5aQwCdwu9LcMWf9bIEwS4x8xEBiyKZEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0tBSz8t+; arc=fail smtp.client-ip=40.107.243.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0tBSz8t+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XINvBW0ccoAtWUWvWYxQUsnvD7Llty5bQr2g3/ARj2gdvhkMDjcwgom9bQa/kKu2E7Lqi9VpfhgwnwRLLESkR0Dq1VHLS0QmZJwPUtw3mikkodPQlBkY3sOGqWqlp+CwpHcA2P0AXpkQPMEwCQyD0JooDWqV6QKa2Yp6Ct4g9sychCMLEb86zo456Tpmi4sV1C0EXTagMZpEABXwOQbxYEkPQsVMBDu8I5P5wdACAWGvqIJ9h0EELv7VzcYaPK7MkdI1VWHDDom6qWoRPCKcwwwdx61Vu5JzM+Lgd10GM5V4i5IABOMqk8PLcWU22bs6Pkp0lniefq8j40rgkyIf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjr0bwnB696C7vBgNrpHu+nGopAs4NNxPLSdZXO/WHw=;
 b=lpcYlLRY3msMZGvn7K2xqJbcJNhPr6UnrLniYuUayxToJkLbqHfYdgeYgVu92UNLWAenOsa/HaCNMt6M7G1XXf8ake/5z/UZWUI/68bLqROlw+zznNSvJXesZHHcipN7Ope/5bJ9R0sGQfIzZCGqpOUDeNJTc6YNktDeAkoJXCw1v/0LjwLoy33Y9o0B0jYMlZ6xjIQeBhXjC2AiQ7Nh6XlBlfIqCGQ8v+/JUZvBj8jmr6/j6ZID9Vmvn9Okmg80FwHkY6o8ulKNF8ILNTNLVY3IlDz2BIO4rMEpANIN/e5wU2PCA00AyiUw0xsqu2FnqxUEBTcefDmG/5N7FDFsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjr0bwnB696C7vBgNrpHu+nGopAs4NNxPLSdZXO/WHw=;
 b=0tBSz8t+kGzQXTQbiRG6Vg4aDO5+BJ9biEpToCsmIBMEuGlz1I9Kk/aKHf3Kk8w6BD29dU9uqQ0MDxEUrZHX08tPfQJDM75a7JlrlkYSNY6C7v0RrXRLsX7cTnBszYNEgRir5BwYrmQpXQuBcHDA4mY7ZWkWBs+w+dtL+BD5zMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 15:18:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 15:18:09 +0000
Message-ID: <c0c9205d-d1e3-4952-a13e-6d23656880e3@amd.com>
Date: Wed, 23 Apr 2025 10:18:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Resume from suspend broken in 6.15-rc due to ACP
 changes.
To: Mark Brown <broonie@kernel.org>, Jacek Luczak <difrost.kernel@gmail.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org,
 venkataprasad.potturu@amd.com, LKML <linux-kernel@vger.kernel.org>
References: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
 <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0041.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e5ae5c-7e90-4d97-9e55-08dd827a0e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzFXRWFUWFdFQkpWSnI2VXVQVk9HOWFGNDc2b0N0RUR6eG5ETXJZOHR3VXVR?=
 =?utf-8?B?NFkxUHA5NnZOK3U1NjV1Q2xJaG5RUHladjdwbEV2bFgzRDYzS0FLYWQyOGM5?=
 =?utf-8?B?eFpuTFVGT0dlRXhqbXk2ZzZSRzlEc28yclRGMjBXb29VNlB1U2hkRGRjMHlG?=
 =?utf-8?B?anBld2loNEwzQmJkZDI1U1pENTVmTFBzUlYwZ0tRY3o0eExvWDRoV1RyYWFU?=
 =?utf-8?B?MUZIb2JKQldxRG9tbVkrUk1hV3JkZVdNMlI3K3VrYWpRQ1NXWlBrVFJRWmtt?=
 =?utf-8?B?UW9LcEtmSkRCcVovSFBZN2NOUldadk5TVDlYRHV0KzhQQ2pPWVlPNXdKMVkx?=
 =?utf-8?B?KytUQ3hRSXM0RWtMcXp0clF5TnJiWmVCekhKMGhMUlBTV2JqMFgwdmlUNk1M?=
 =?utf-8?B?bkhZeGdDRk05WFpNUWd4MmxzVHlTOThLWGVHRTkyeHpQbzFvVW9HbVNlZkN5?=
 =?utf-8?B?bklrSlo0WitabkU3ZSs2akI5NzF3TDdoeUh5b1pyZGhzWUJEcno1WjhycHFP?=
 =?utf-8?B?WUtONFhFbDlqUXRhMHZ2ZTZmdEhFUnNvcENqK05Tb01NajZaWHlOQW5KOUNR?=
 =?utf-8?B?UTVZcmk0NWMyQ2JLTWJYS1BSZHZKSjV5ektmeVNheHhyWTBjK3ZWOWdVTVQr?=
 =?utf-8?B?UXBxaW5tMTNYNURNMnI1UUZ3TmdEOVowVEg5T2RFN0xCSEhPajQ4elpUa09Z?=
 =?utf-8?B?WkNCdEEvMGRCSFN0NjVRUGgxZjdtb1A3R1h1a09TT3p6K2hRTTdOMEZWTWRZ?=
 =?utf-8?B?UmRpKzg0RHJPUk1ZSzhCMEFjQ2RVOUpXZnBjOWNQbTZZY1ZxUUVRcFRQd0xj?=
 =?utf-8?B?RTJncm5vWkdHa1JyWUhxMHNNdXd2bDdPL3dJRHE3QXhZR0V2MXVKSmtQUkJQ?=
 =?utf-8?B?Wm5saHJ2TWJ0QkpScTFxMVlJbkdWZG9WcjlFMXFEbXFOUW1Ca09TRDlxeTM0?=
 =?utf-8?B?c09TcXg3ajJtQk83OFNUdVBMS2psNUpPK1BQbi8yelhOY3FiKzNEaW94bGQ2?=
 =?utf-8?B?MDg3c3VTTHdzVFRicU1adWZ0WW1kQ0I4dGlQUmwzWWV1YXFlZmhMUFlBaWlw?=
 =?utf-8?B?SHpPWTJXNTJ3akFuTldRZmdpcDl2bHJxT2M3Y0hVeWN1ZkpFVUtpZEwwek1m?=
 =?utf-8?B?WnUrakNJSFRBTnltQkg3dVNMbStvZ0Zmc3g1Mm9uS1dja3RCQ1cram9KYitV?=
 =?utf-8?B?VE5XTTBvcUxWZnlNeFlXYW8vTFJnSCtWSHFZdSt3NlBYcFgzczd0ZWl5WjlV?=
 =?utf-8?B?U3FLaHNMT21hMEtsN0t3NjFSSE5xdDZ2TlZ1b1ZzSElEb0h1Z2FHKzRTOVNu?=
 =?utf-8?B?TVkwcXZnNGlXcUFQRXlrZ242MTIwY0luMkJNN0VFdVFhM2NYczZDa3JBeXN5?=
 =?utf-8?B?U0pmVUFuY1VNQ25oeGlSSVVubDFVM2RtU3ptbllaVnBZUm5JZ0hxZmplK0wy?=
 =?utf-8?B?Z0FONzJOMFU5cUhRQ3poNkpqZlE0ckhSRUNjTlUxUzhUb2cyUEZiN05pMWF1?=
 =?utf-8?B?RTM3SWJoNWhob2M3VFVuN3lMZXdNSklNMWxybVh1WE9JVmZ2U2I2RzI1NEJR?=
 =?utf-8?B?U1pPTGVpZFA1eDNNNU5YWTNQdFU3V00zbS9JVHFReU8yYjk4SGFDUEwwS2RB?=
 =?utf-8?B?NENlRE1pVEJlSzBZZ1lJVFliTlp4OThDU3JsYlFXTFc3dGl6MDFiZE01L2tr?=
 =?utf-8?B?dG1QaDcwUjFBWFY4Z2VyV0xiVmhqOU5QTWVJYUtqOW5CcFRKWEEyZWNVVkFK?=
 =?utf-8?B?aWJOTFl5MTA0MVBJZG5BUWFPSnRUekFWcnlDTnFOaDM0N1FOcVJ2bkNBeEdB?=
 =?utf-8?Q?UGxgVFhVI0d/kBOBWEXbbmYcDIA13RGUHM+B0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blhaNkJRZVU2RTFLb1NRaHRkRitadUpFdlNLdEs3Zi9jQzBjUXg0ZGtEc0t3?=
 =?utf-8?B?TDB0eUxlV2IzK1dEM1lwSm5saTJVcms0ZTRUNDN4ekMza2czMDNMNWNud3Uy?=
 =?utf-8?B?K05DdVNZOU96L2RwUEZIamxGNU5DMnBNTlBTek01STFHMEIzUEF4cDVGOEti?=
 =?utf-8?B?NS9HcnByTi9nK0dpd0ExKytlSkZwZXNXVk9RWFB1a0hVTUdPNjJBOVhCNUV1?=
 =?utf-8?B?Rk9pTm52cmpnZFhyVi9pamc0NzF5RHRtNFlHZWNLS0JISFEzNWpVV2xFemJa?=
 =?utf-8?B?REZkYkV3UUpENHhxaE5ZcGc1cG5ydFZKUERxMlgycldxemhZaHd4aEpYcVZN?=
 =?utf-8?B?NU5YMTdmWVFJWjVWZlgwM1puSlZhY0hqRklsZ2RDMjBkRnNaK0ttOUpOMXF6?=
 =?utf-8?B?VEYvRkI4MGVHcEVhMTl1KzJ0N09hWi9UQWloZHY4MU9rTWdKZVdLRmhIQUM3?=
 =?utf-8?B?WTR0bGwraEc0VURXeXJSQUlVUWEzUktlb29WRFVkYmxwQnZHN2IzTnBGZlVP?=
 =?utf-8?B?ajU4R1VYMFhKVHVWQm9FdWFUTW9vc2NqK2VjY3A1L0RJVFM1VXljNGNwZTVu?=
 =?utf-8?B?djlYSHJXdmV5WGVlNHZjN09xZVBUUGMrMXZ0YUVJOFlDMlJLVVdMSVVnMS81?=
 =?utf-8?B?eXk0MFA0dmdwU3BtWS8xU3MzdzErVStZZU42NlBuZ0VILzdQRFZzek1nVjJy?=
 =?utf-8?B?b3hDN1YwNHQ1ajFGMXUyc3ZsRlBwZ2pZdnhzcXU5VWFzQk02MnZSOUR4Z0Zz?=
 =?utf-8?B?blh3RkxhZEpuNU5WNGJNVDEvZDRDMmd0aWh1ejk3cm5PK2dIVzBVVkpreXpR?=
 =?utf-8?B?b0MxbXlqbVhDY1FGZWkrNHNVU3lzY2g5bGtJQlIxZlVMY0s3ckZsRjIzcDQw?=
 =?utf-8?B?Q2pYem1QOXVkeVF2VC9HMmRQLzZQd0c3Q3JuUkZlalQydVJOdUFMNTRhOS8r?=
 =?utf-8?B?djhKcFNnVGJpTFFuRGRMcEQxVmhKUTZ0UGxlVjZIWU1yYVRBdmhGWElFblR4?=
 =?utf-8?B?d1k1eGw1SlB5M0hGSUVGbUFNNEFCQlBHMTBGQnhBMWw3NDczZXVvalpNaXZs?=
 =?utf-8?B?YVkxS09EQjhDUTZnSmQ1eExicHRpSWtGTXlHMFNCZE5sV01YKzBHdmliWFdT?=
 =?utf-8?B?UkEydWdkUnNJd08yT25zZ2xjanVsTTNoWUtMbnA0WU1SMWFBSDhPM3ErQ3ll?=
 =?utf-8?B?bXNJbkVuNTB0eVdGZEQvL1lCd2RDRW1kN3daOVJLMFQ5OGtWcitHdk1Dd3o4?=
 =?utf-8?B?WkVNQUlSZ0M2NmxFM3kzZzBCVGpUZ0JnWTNZQlBtTDhkS1NpcERnTjdQMXVV?=
 =?utf-8?B?YmdUdWdEU3ovVzg0cEl2QWVYdWpWdGhKSTExOU5GOG1xK0NaL011amJtTnpx?=
 =?utf-8?B?WFlvcmFrOVBYTy9KN3l5cjRwK3g4Z3hReTJSZXNjNUlOOW5LbUxtNUo4YUcx?=
 =?utf-8?B?blN4SDlreHNIcitUdmt1THBNQi9PSGIyTWZRQzB3cUFzSFdUeExhc0pQRDJu?=
 =?utf-8?B?bnh4ckVRRnRmWlp0SVlwNnFld0hya2FSeTNUV3ZUd2VMUFVjbGpYTGtCaGVn?=
 =?utf-8?B?dEdiekgzMXRGOEZRVEoxZEtRcmZENWdBUUh0M0VGK1pITFQ0aFdWTGFrYzVk?=
 =?utf-8?B?ejU2TjdkbW1JSy9qaFFwQVFGZTVvSkFoUDJGN3NQVzMzSkRVUUNxaVBDMCtX?=
 =?utf-8?B?N2xWL0NLTmtMRDZ2OFRwbDgxdlRSNnJpYW56MDdzWlRvN0pOamw0KzZMOWNK?=
 =?utf-8?B?MzhtRW03bm1jM3NERzU4SnhtRlQxcVhKdEhNL3cvalhrMm02S2xQeTJTWSs5?=
 =?utf-8?B?TGd3TEZtVjRiSGhmUXRwQkJxTFNtZDFOcFIzb09wRmp2Y3VraHl6a2FIY3BY?=
 =?utf-8?B?NElTd3IxL3VUY2pBbW1jRThWWnhoQ2QwMUI0ZGp3UlYrV2d0Vjl3QTRYTktu?=
 =?utf-8?B?ZmFrOUVxaFNhSG5DZ0lGRENqWHgrZXVXaDkrWjE3ZzR6a2hrR3ZZZ2lCa29u?=
 =?utf-8?B?MmFhZ20zTmlWdVg0UjUvMVA4aWhnYitRMHMzQk51c2lrY3ZSQytSaG9GL01r?=
 =?utf-8?B?bDU5Nm9hbFJrRzB1RTcrYlJ0NkdWK3RSRGpjS3lPVWF4K2JWeEtscXl2UWd4?=
 =?utf-8?Q?pNTNab4drYsiZG+jyRhO6oICZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e5ae5c-7e90-4d97-9e55-08dd827a0e24
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 15:18:09.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7E2p23km30G0lSod8RDkD1JDztNE3ReetZGiOPFVvXGd7rARghrgd9eQTtcP420l4e9kokOGkrKsdJ1u46lrTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726

On 4/23/2025 10:06 AM, Mark Brown wrote:
> On Wed, Apr 16, 2025 at 01:20:33PM +0200, Jacek Luczak wrote:
>> Hi,
>>
>> On my ASUS Vivobook S16 (and on similar ASUS HW - see [1]) on resume
>> from suspend system dies (no logs available) soon after GPU completes
>> resume - I can see the login screen, only power cycle left.
> 
> Are there any updates on this from the AMD side?  As things stand my
> inclination is to revert the bulk of the changes to the driver from the
> past merge window, I don't really know anything about this hardware
> specifically and "dies without logs" is obviously giving few hints.
> None of the skipped commits looks immediately suspect, there's doubtless
> some unintended change in there.

This is the first I'm hearing of it; I expect we can dig in and find a 
solution so we don't need to revert that whole series.

Let me add Vijendar to check if this jumps out to him what went wrong.

* Can we please see the full dmesg up to the failure?
* journalctl -k -b-1 can fetch everything from the last boot up until 
the freeze.
* Any crash in /var/lib/systemd/pstore by chance?

> 
> Adding Mario and leaving the context for his benefit.

To double check - can you blacklist the ACP driver and suspend/resume 
and everything is OK?

If possible can you please capture a report with 
https://web.git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git/tree/amd_s2idle.py 
both in the case of ACP driver blacklisted and not blacklisted?  I would 
like to compare.

Also; can you put all these artifacts I'm asking for into somewhere non 
ephemeral like a kernel bugzilla?  You can loop me and Vijendar into it.

> 
>> I've managed to bisect this as close as possible to following commits:
>> - [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refactor
>> acp70 platform resource structure
>> - [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove white line
>> - [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move
>> spin_lock and list initialization to acp-pci driver
>> - [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove
>> redundant acp_dev_data structure
>> - [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new
>> interrupt handle callbacks in acp_common_hw_ops
>>
>> Attached lspci and bisection log.
>>
>> Regards,
>> -jacek
>>
>> [1] https://bbs.archlinux.org/viewtopic.php?id=304816
> 
>> git bisect start
>> # status: waiting for both good and bad commits
>> # good: [ed92bc5264c4357d4fca292c769ea9967cd3d3b6] ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe()
>> git bisect good ed92bc5264c4357d4fca292c769ea9967cd3d3b6
>> # status: waiting for bad commit, 1 good commit known
>> # bad: [47c4f9b1722fd883c9745d7877cb212e41dd2715] Tidy up ASoC control get and put handlers
>> git bisect bad 47c4f9b1722fd883c9745d7877cb212e41dd2715
>> # good: [74da545ec6a8b41de96b4c350bb59dfe45c0d822] ASoC: codec: madera: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
>> git bisect good 74da545ec6a8b41de96b4c350bb59dfe45c0d822
>> # bad: [a935b3f981809272d2649ad9c27a751685137846] ASoC: SOF: ipc4-topology: Allocate ref_params on stack
>> git bisect bad a935b3f981809272d2649ad9c27a751685137846
>> # good: [24056de9976dfc33801d2574c1672d91f840277a] ASoC: codecs: Update device_id tables for Realtek
>> git bisect good 24056de9976dfc33801d2574c1672d91f840277a
>> # good: [a1462fb8b5dd1018e3477a6861822d75c6a59449] ASoC: Intel: boards: updates for 6.15
>> git bisect good a1462fb8b5dd1018e3477a6861822d75c6a59449
>> # skip: [8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0] ASoC: SOF: Intel: Add support for ACE3+ mic privacy
>> git bisect skip 8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0
>> # skip: [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new interrupt handle callbacks in acp_common_hw_ops
>> git bisect skip aaf7a668bb3814f084f9f6f673567f6aa316632f
>> # good: [c6141ba0110f98266106699aca071fed025c3d64] ASoC: Merge up fixes
>> git bisect good c6141ba0110f98266106699aca071fed025c3d64
>> # skip: [ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8] ASoC: cs35l41: check the return value from spi_setup()
>> git bisect skip ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8
>> # good: [269b844239149a9bbaba66518db99ebb06554a15] ASoC: dapm: Fix changes to DECLARE_ADAU17X1_DSP_MUX_CTRL
>> git bisect good 269b844239149a9bbaba66518db99ebb06554a15
>> # skip: [89be3c15a58b2ccf31e969223c8ac93ca8932d81] ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
>> git bisect skip 89be3c15a58b2ccf31e969223c8ac93ca8932d81
>> # bad: [02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3] ASoC: amd: acp: Fix for enabling DMIC on acp platforms via _DSD entry
>> git bisect bad 02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3
>> # good: [7a2ff0510c51462c0a979f5006d375a2b23d46e9] ASoC: soc-pcm: reuse dpcm_state_string()
>> git bisect good 7a2ff0510c51462c0a979f5006d375a2b23d46e9
>> # good: [a8fed0bddf8fa239fc71dc5c035d2e078c597369] ASoC: dt-bindings: add regulator support to dmic codec
>> git bisect good a8fed0bddf8fa239fc71dc5c035d2e078c597369
>> # bad: [ee7ab0fd540877fceb3d51f87016e6531d86406f] ASoC: amd: acp: Refactor rembrant platform resource structure
>> git bisect bad ee7ab0fd540877fceb3d51f87016e6531d86406f
>> # good: [0d2d276f53ea3ba1686619cde503d9748f58a834] ASoC: SOF: Intel: lnl/ptl: Only set dsp_ops which differs from MTL
>> git bisect good 0d2d276f53ea3ba1686619cde503d9748f58a834
>> # good: [8aeb7d2c3fc315e629d252cd601598a5af74bbb0] ASoC: SOF: Intel: Create ptl.c as placeholder for Panther Lake features
>> git bisect good 8aeb7d2c3fc315e629d252cd601598a5af74bbb0
>> # skip: [ac5b4a24f16f2f56b5cc5092969930b867274edc] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43 support
>> git bisect skip ac5b4a24f16f2f56b5cc5092969930b867274edc
>> # skip: [8ae746fe51041484e52eba99bed15a444c7d4372] ASoC: amd: acp: Implement acp_common_hw_ops support for acp platforms
>> git bisect skip 8ae746fe51041484e52eba99bed15a444c7d4372
>> # good: [0978e8207b61ac6d51280e5d28ccfff75d653363] ASoC: SOF: Intel: hda-mlink: Add support for mic privacy in VS SHIM registers
>> git bisect good 0978e8207b61ac6d51280e5d28ccfff75d653363
>> # good: [4a43c3241ec3465a501825ecaf051e5a1d85a60b] ASoC: SOF: Intel: ptl: Add support for mic privacy
>> git bisect good 4a43c3241ec3465a501825ecaf051e5a1d85a60b
>> # skip: [1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609] ASoC: dmic: add regulator support
>> git bisect skip 1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609
>> # good: [e2cda461765692757cd5c3b1fc80bd260ffe1394] ASoC: amd: acp: Refactor dmic-codec platform device creation
>> git bisect good e2cda461765692757cd5c3b1fc80bd260ffe1394
>> # skip: [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move spin_lock and list initialization to acp-pci driver
>> git bisect skip a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90
>> # bad: [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refactor acp70 platform resource structure
>> git bisect bad f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0
>> # good: [6e60db74b69c29b528c8d10d86108f78f2995dcb] ASoC: amd: acp: Refactor acp machine select
>> git bisect good 6e60db74b69c29b528c8d10d86108f78f2995dcb
>> # skip: [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove redundant acp_dev_data structure
>> git bisect skip e3933683b25e2cc94485da4909e3338e1a177b39
>> # skip: [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove white line
>> git bisect skip c8b5f251f0e53edab220ac4edf444120815fed3c
>> # only skipped commits left to test
>> # possible first bad commit: [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refactor acp70 platform resource structure
>> # possible first bad commit: [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove white line
>> # possible first bad commit: [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move spin_lock and list initialization to acp-pci driver
>> # possible first bad commit: [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove redundant acp_dev_data structure
>> # possible first bad commit: [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new interrupt handle callbacks in acp_common_hw_ops
> 
>> 00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo Root Complex [1022:1507]
>> 00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo IOMMU [1022:1508]
>> 00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo Dummy Host Bridge [1022:1509]
>> 00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo PCIe USB4 Bridge [1022:150a]
>> 00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo Dummy Host Bridge [1022:1509]
>> 00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo GPP Bridge [1022:150b]
>> 00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo GPP Bridge [1022:150b]
>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo Dummy Host Bridge [1022:1509]
>> 00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo Dummy Host Bridge [1022:1509]
>> 00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>> 00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>> 00:08.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>> 00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller [1022:790b] (rev 71)
>> 00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge [1022:790e] (rev 51)
>> 00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data Fabric; Function 0 [1022:16f8]
>> 00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data Fabric; Function 1 [1022:16f9]
>> 00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data Fabric; Function 2 [1022:16fa]
>> 00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data Fabric; Function 3 [1022:16fb]
>> 00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data Fabric; Function 4 [1022:16fc]
>> 00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data Fabric; Function 5 [1022:16fd]
>> 00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data Fabric; Function 6 [1022:16fe]
>> 00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix Data Fabric; Function 7 [1022:16ff]
>> 61:00.0 Non-Volatile memory controller [0108]: Micron Technology Inc 2400 NVMe SSD (DRAM-less) [1344:5413] (rev 03)
>> 62:00.0 Network controller [0280]: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter [14c3:0616]
>> 63:00.0 Display controller [0380]: Advanced Micro Devices, Inc. [AMD/ATI] Strix [Radeon 880M / 890M] [1002:150e] (rev c1)
>> 63:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Rembrandt Radeon High Definition Audio Controller [1002:1640]
>> 63:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Strix/Krackan/Strix Halo CCP/ASP [1022:17e0]
>> 63:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:151e]
>> 63:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 70)
>> 63:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 17h/19h/1ah HD Audio Controller [1022:15e3]
>> 64:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc. [AMD] Strix/Strix Halo PCIe Dummy Function [1022:150d]
>> 64:00.1 Signal processing controller [1180]: Advanced Micro Devices, Inc. [AMD] Strix/Krackan/Strix Halo Neural Processing Unit [1022:17f0] (rev 10)
>> 65:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:151f]
>> 65:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:151a]
>> 65:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:151b]
>> 65:00.5 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:151c]


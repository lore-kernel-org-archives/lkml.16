Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2131.outbound.protection.outlook.com [40.107.20.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0B935975;
	Mon,  5 May 2025 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746452226; cv=fail; b=gA8xGXeS09G7rv1Uwo5noqGJPZg+zx64VXU/2WleJ+/RUhwjefjkq1/ECdBCLj5WzfCvmcjzl6Bl9QBbvirA3eInTzt1ykdkya9hswq6rUnz+uzCK5ejGx/US+lgllY0djJZxRpHvHfKJruPT+6q0pWYcIkXUjok8bTKMnkfP6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746452226; c=relaxed/simple;
	bh=b+WaQbw4y8CHmJN1t2jIKdI+/HrNCIivhzd+NYZ8vS8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rln7tfU8YSRSe8KAWyQJAp1fRV0ZF1XqQ+yo9TgwAde9Sn1NKD6HAw9d77jBG1kVvRZOFaifZ6gx3WZGeYkTTJBsGm2Pm+yjTorloB84/Hr625uB30r3qwCNj3M2xZp5r43fspXAdBsukc/RETRY53DIJxobJm1Iz6Q2PyNgFXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=TW1yxDFO; arc=fail smtp.client-ip=40.107.20.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="TW1yxDFO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGxUuJnxrRenw6FTqSXXBMh3P4dD/uLo0z7CJ3pSg4jp9HOZIRlivgROPs8emXiE46fTTqA3n9Dtv6QficN1R82MOJAyzBSpKyP0QdeAaFDD5BhYMg+FNz9/J71Zv0iw7xzeQ1I0oOPb1zxPT3DIzWPCCM6CFShZGJpWmcg+HfMBw3/sH+ipvroaXn6n2bS1q4ckEqsfokrtI3emlw3j1N20n2aZVwaA+feGhD0Rad1TRZR2VYeNAiws18F6wYkVmUHb5GTYu9w4DnkBfeCKC26F5Sxmhg2E69HLzTrYth2D/0rOmuwSHWXyq2zukdEYY5PO3ttFGQvjl6BoVBTyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NxM+LyJKqBAPIaPlavfprGbQW3rIQysvbDXHZ8MTPw=;
 b=OiiGsiY0BXSNTP/LnS4jCSjHrOMeA65uy+q/J+eAQSEKetPIW9bcY0eBo/enAZ8GhP0l8cQlN8JDY0LNVwAgaxWEyW8jcRTxYp0PANC+4IXq/HWP/yoaLS8u5N9CfXAObkrDg6vsRsqRm16bNlubZDgmd2mI7bGMFI8bhI59PWDC3iTV4MwZHaaZE8paz3OaBPv+WxZ9LAF+g1taKBJbdKejpyTnfvbGACXKrRR92Go1yQ2xmPdonE7InMM9NMafN6PWBRLHzhwGuvVQrmUEg7Vl7GNfW2awbLQjM65y/Z49bpzyJ1tyUe6Hh7N+WFodKj1NFgn39TwSWhF53i/Wyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NxM+LyJKqBAPIaPlavfprGbQW3rIQysvbDXHZ8MTPw=;
 b=TW1yxDFOIPd/ARLmqbB1wnAPWyHZ3185YyjyqNFOuHsCI/uAN0M00NBy7gXjOcHnl/9HkVkIfBzfjti+gZxb9pXtlfesylBIczpFd7HHLNYhvxWG40Zkt/IPFtP6/9ZY6XmJXGdxGL3ym/C2HRB7E5wqEeQKuuEfTmZ4XK6mgcc0mh9ZIZlO1PuYw8qBlslZCSx4Hx4r1IHmk7nSb3Oj7cHwdwAIZNLR0C+K4n3UehLl1zONLyp/iiCdyelG+iK0iMbUIWL+r12CjcfqEI+XSbbz809hwpOFTC4QoZQKfYyegy78zPougiFHF6wvVVyhrTWvyfeys3rojinO/MfqXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by GV2P195MB1940.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 13:36:58 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 13:36:57 +0000
Message-ID: <5d1e8620-7bb5-42fc-8061-9a7c65eaa23b@phytec.de>
Date: Mon, 5 May 2025 15:36:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62a: Set Critical Temp. to 105C
To: Nishanth Menon <nm@ti.com>
Cc: vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20250502142606.2840508-1-d.schultz@phytec.de>
 <20250502142606.2840508-2-d.schultz@phytec.de>
 <20250502144934.t6hjiwp2f64ovb34@deeply>
 <9964aeaa-0169-4596-a33d-c56bdb6edae3@phytec.de>
 <20250505131230.3ydwgftnqbbmrt5u@opulently>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250505131230.3ydwgftnqbbmrt5u@opulently>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:303:85::16) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|GV2P195MB1940:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c171797-8c9d-4bf6-c58e-08dd8bd9e82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVBvM0tSWHF2MDUzbmNRenlya2ZSWWRsM0NuTjQwWFkxWHFWQTlqUk81K1FS?=
 =?utf-8?B?UllMZGEzbEZYblJCVEs4YklTdU5mdE1iVzVUSWtHcGxPd0NIajVaS0FtZ2FR?=
 =?utf-8?B?U3FZdUdyRk9lZEJzaW92Tm1GK3YrTzlJVElyWFVCUzRiWHJmRTNObUxwcHE4?=
 =?utf-8?B?TGw0Mk5DM0dkQVBoWU9pT3JJQlg1a3lDQzFBSUdva3dMWTl3YnVpUTB5T1Jj?=
 =?utf-8?B?RG1TcWpqNXZvMUI3akxJWEFQS0YyV25MWmZ6QnZyZ0tNNGNsMzEva08rQUNp?=
 =?utf-8?B?ZzNOc1BJSTB0dzBiZ2h6TU5hMVc3MzZtd3FPbGRGV0ZFbEhnQUd5UUdIMzlQ?=
 =?utf-8?B?RjZqMUJwSkMzcC82OVpSZyt0ZVVqN0dyakpKUWw0OHZFK09kT2pQRHlmclp0?=
 =?utf-8?B?cklrK3JwUWhnOGZTWldyUFgxMktjN2s1elFrL01XZmpWN29XYk5ENVZ4NWcz?=
 =?utf-8?B?ZlFkMjlQTnNXRDVOR1BMK3VNMHNlbmNOT0drQ2RjcGxqWFBMTVpvdlAvMDRM?=
 =?utf-8?B?T0dnOVlHRmFscm9NaTU3WkhPbGVJWlFTNER1YnduMTdzQkliWU5zaGRTRkNh?=
 =?utf-8?B?QjdXL2RIZzd5cWVubWtnU2ZQUlRNRzdwM1ZKd2JKSjVDYUcwUEFDQkZPN1M2?=
 =?utf-8?B?ZFpXN0VKR2ZzZ0FKQjRHclF4Yks4Tm5BWVk1ZWJhSW5xM0JpOHpITHFkOU1V?=
 =?utf-8?B?QXRKNWVEeG5JUGxoWEh1VUs2MTkvdWFia0p2eU9Xc0lOVkRORmJJaUhTSGtt?=
 =?utf-8?B?UHUxSGlWL2I5N0pEbWtMVnYwcDhOeGhnRVlMUlcvOVdvY1M0UjhDRjQvdWt5?=
 =?utf-8?B?aEhha1N2V0hoK3RYS2ovcG9YanNDUVpuRjFLWVRRYUJoeU9XOFgzN0x0UW0z?=
 =?utf-8?B?eEJRWTdFenlXRk9UMTNzVGk0NlJXNVZuck1zdjJValN4VnR5N2Y5SDFCdG9L?=
 =?utf-8?B?clBiN2dtMWExREF1OENqOUlqMVRNQ01RUTNaZEJ0YmxZb0NoVmE5Ry9JYjdW?=
 =?utf-8?B?MFRYbGV5QlhUR3hSTDVOWnk0WFN2UW14RTVWSGc2RXBUWnFSSXZCdTFSRUVk?=
 =?utf-8?B?aVEwLzVNMDRkRlVLNkQ4KzRZbW9xcFJUV0grV25TRmtQOHU2d21xTXBVR0xN?=
 =?utf-8?B?R1g4ek40Qzl2QXA2OS9ESmplQTB4NFNnbVdkbEp1SS8zSWJHT0p1K0hmQ0hs?=
 =?utf-8?B?N2Q2eHhpTERPaUpjRndjRC81OG83SElSMUFUeGpGWkNMT3JhSUNFYm9pQUd3?=
 =?utf-8?B?UVN5VUpsdDJTQlJKbHFpZ3d4dXBjOXFkREZ5K3FhN1o0Q2l4NEFoNkI3bWZF?=
 =?utf-8?B?MWFlVXhXNXFaRytOWGxqODhFVDA0VkZCQVFMWkZGM1VBU1VCNHI3NUZrcUsz?=
 =?utf-8?B?MmxzS0VLWDFCWWVuZTg3T3YwbG5lVWtiR2FTd1ZZTjRYV3R4UDZHRng1OWRO?=
 =?utf-8?B?Qzh6WUVnclp3ZUt5NWZoY0Z0WG5ZZU1aU2JDT0pRejZhTWlNWXBOUnM2bDc0?=
 =?utf-8?B?QS9SSFNxdUVob09LVSt5VmhFMmVyT0Y4RysxOGQzZWZIMUNZZ1NyeGZDenZJ?=
 =?utf-8?B?TXU3ME56cEk1ZzJtYy8vbzlVV21YcVZqRWt2VXltQmd0VkZiZnlMU2pBVHNt?=
 =?utf-8?B?K082bzRXWHp1RDliblVHQTg0QjJhd3FVZm1nMUtrSUFkRHV4ZmVjbS9Sblo0?=
 =?utf-8?B?QXF2WDFZOXM0VXhBTHhrcjlIRDVSa1FlREZRbGN1cUt1czR6UGd5Nlc5Y2F4?=
 =?utf-8?B?MVdXbHlGRVdPYzgxcy92RGZjM1Q3SnpBSGVNdzNJQXNHNzlueFZWLzFOdFBw?=
 =?utf-8?B?UjNZZktXcWp4eGpWbmdnK2hsajVUQU1GTmdQT3pEdlZBejlzNHFUcW5qRzZh?=
 =?utf-8?B?TjA0VEpMdGNsdktZa3NRT24vNVpZbEdWM0t0Q0YzOEN5dm5KK3NTcXpSNlRR?=
 =?utf-8?Q?KZxwxn6skJA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWdWYnBGaHRoVGlrUmJhN09XYzZybkRUSXZtZFJFYWRoaWtibWxVTG43cUg2?=
 =?utf-8?B?V3JGbWYyTTV1R1lRNTJuK1pycU8vMzVMa0VRc3VubUJ1UUd1ZHVRZXg5Ly9B?=
 =?utf-8?B?dHN6YndQWFp5b1U1TGVaTTFSWEZLZjRoSStkRnEyaWFFMHhzZ25sTjR3a3Rl?=
 =?utf-8?B?VnQ1Ulg5WkVpbUtzR2cxTCtQTC9kV0Jad0pEdHY2NkV5ZWcwRklXZ2ZwNktF?=
 =?utf-8?B?TWl1ZjF3bk1SQzh5N1RIUmIzeEdoNjBQWTE1NVhaeTMwa1JySVZxNDUyTmRy?=
 =?utf-8?B?c0x4SGpyVzNZNDFDZmxQamU0UFR4L1N0bnkxaUp0UkNRK1ZDNkpwWnhPc3hG?=
 =?utf-8?B?bkxIaUJ1MUV4bitpdmRlTnY0RUQ1Lzg4SDY2RzZTZkNlWEZvK2dhTkt1bTdP?=
 =?utf-8?B?K25kYkoxVTJ2ZGpyY3pRNzV1eUtzUTlSWG5QN3lnTkNxanF2Q2xYeFFuajVM?=
 =?utf-8?B?NjNtQy9XcjJyQ1NPWExEdGI2d1pkNXloZzMrYU0wSW1xK0lPb1dvQ0pUdGI0?=
 =?utf-8?B?U1dpSlhEcDVJaTNnRGRWUHF5cEl6N0dZaXQwcmdwN1BXTnViL1QrVk1RS0hN?=
 =?utf-8?B?eE5JUmJoZVkyNG1YMTZvZFdvNERFR3hRRGVPL1NsK28xbE5xS21wRG1Leldt?=
 =?utf-8?B?Z2RtRFE5dXJtQVNJNW01dVozM3d6NDZQZW44MmVaaXlHbkhZWnVJclIxWmNG?=
 =?utf-8?B?aHNRVmxSNEdhZmZmUlg3WEM0NUx3d0NNaUZ3aHozTTllbnNHa2hHYVB0QlBH?=
 =?utf-8?B?ZFlLSmJUMWRUbXQ0SHdBZU53TW1CV01ZMXJzczAxUHlDcWJDMjNNWm1vVWJi?=
 =?utf-8?B?NUxXZU5qbW56bjJWZ0djRkZETm9BTUhaTTdqMU1wUHpiR3FaRW84ZTRVekZo?=
 =?utf-8?B?UkVHdmpoSGVqb1FnMzVjWHRTS3F2clA2bm91REVBYWpleEM3WHFLY1Q3amF5?=
 =?utf-8?B?aFlFZGFtNW1kTmRsQ0kvQXRVN3l6WU4zTlZ4RElKYVY5N0VZVTljcXkrUUJs?=
 =?utf-8?B?TkNIaHZQVU0xZStGSUluSGVRT2Jya1R3K00xOHJqTXViWS94eURNekV3OUhw?=
 =?utf-8?B?ODFOREw1UWlYc2NuTlVKR29IM2t5ck5YVFhSZlBiSG1aQk4xL1RCMXkrcExh?=
 =?utf-8?B?NHVDZkpZNnhCaWw5NFp3TDB2K2ZMU013N3BQZW9uZlgwSEdtN1pLeFc0S1B5?=
 =?utf-8?B?UjdqTUh2MXIzN2grcXNpZzJoVjU0Nk9pMnZGakdlUTlidm1YNWlnZXJJNFBy?=
 =?utf-8?B?OGFrdS8rWUZ6eHJ6TFAvcVREV09UdHRrQk9PMGYvZGtDYzB3ZkdBVGU4ZFV4?=
 =?utf-8?B?TElyMjJJaFRuRjE2cE1YYS9oSlQ5WXlXUFd0dnIzYmNKUHlRSVhsNHZpNHYz?=
 =?utf-8?B?bkRPQUNCbWxyWFRFMTJUS2dmY2ZXVUJ2REQvYTdSZU45NXU0VlJCSndBaFJH?=
 =?utf-8?B?TGs0VEFGUEhXTFY0ZGFFazhBTTIrRklvK3FyUnljaDQ0RDhTTExCR3lkYXBH?=
 =?utf-8?B?ZGNEaXFmazZiM2g2b1JrcU1GbHowRVE5WjBhWjRVK3RyZUwzd0I1YkRhM2V4?=
 =?utf-8?B?ckY3RXdlclZJdkNPdkpveExMcVpOQ2xGOVRMZVUxWGlvUVZEbUYwNUxmeURm?=
 =?utf-8?B?WE44VjR0aHgzTE5vd0xzUFpvV2JCT0VVclZ1VW1tTTVZdGR5c2VPbWR4Wkpw?=
 =?utf-8?B?VkVkQnoyYkl0MlhYbm83Z2VCcE9WSmFUcHh1aFUyUUVaWXJ4SHR6cU5UaDUw?=
 =?utf-8?B?YWpKWlZqU0FnT2w0TmZYNTRrSGtIbmdnaGoxYTVtbUZZMHNQcEdUN1ZFUHNJ?=
 =?utf-8?B?bVFHRE5nb0RiSjlLTVNHQXQ4M0UxYjVabWxWRUlJQnMxMFR2alZKdzJ6WkZo?=
 =?utf-8?B?ZTdvdHN5QklaRS9jSnBLWnBZR1pVbVBEWlVsY3gwelFRUjNpcGhmREhUK09J?=
 =?utf-8?B?b3dIV1NRMkFNUmkrSk01RUlCRG54dXZPRmJybEwyTDhaS1ZYS09PdXdlQity?=
 =?utf-8?B?V0JMbWZZVHlmOWkrNjgvWVlBS0xEb3YxRmVEUnp5V2RTYzFVQzY1UkZURnBD?=
 =?utf-8?B?bSt1MDU4WlFNYURVT3FIV0JwWlpQRkFVTXJlVGxVNkRwdmpvN2FWSkhhZVVk?=
 =?utf-8?B?c2o5Q1o2K0pKamZReXNjc0dDTlRZZG5LTXEzMzJtdEptbGFPcEpKdmJZcWYy?=
 =?utf-8?Q?+Nd6aQK3xZXF+stJsi5LcgQ2jccIgNjp6AecNQIfHQzC?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c171797-8c9d-4bf6-c58e-08dd8bd9e82e
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 13:36:57.8392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyrPEwDKJzbRbJHBsDCI6GX0YbdxOqHwnHH0szSTY+PzY8qPpdYn9xzAVhWLtSSkeGoRkhN1MWtX285bUKpsyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB1940


On 5/5/25 15:12, Nishanth Menon wrote:
> On 21:11-20250502, Daniel Schultz wrote:
>> On 5/2/25 16:49, Nishanth Menon wrote:
>>> On 07:26-20250502, Daniel Schultz wrote:
>>>> The AM62Ax SoC supports two temperature ranges:
>>>> * A: -40 to 105C - Extended Industrial
>>>> * I: -40 to 125C - Automotive
>>>>
>>>> By default, use the lower limit (105 °C) so that any AM62A running
>>>> in Extended Industrial mode will shut down safely before overheating.
>>>>
>>>> If the bootloader detects an Automotive-grade device, it should
>>>> override this and raise the critical trip point to 125 °C.
>>>>
>>>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>>>> ---
>>>>    arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
>>>> index 39ff9118b6c4..40dcb9bab965 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
>>> Why not create a separate header for industrial grade and rename this as
>>> automotive grade and let the board file pick the right grade used on the
>>> board?
>> Mostly because I copied this from 10e7bfd8114c207ac and with the most recent
>> temperature fixups in U-Boot, we also have the missing bootloader logic.
>>
>> I would also prefer an out-of-the-box solution for that.
> Personally, I am not in favor of depending on U-boot (there are other
> bootloaders as well in the ecosystem) monkeying with dt nodes.
>
> I suggest renaming the dtsi and introducing a industrial dtsi. And
> depending on the samples used by the board, use the correct dtsi.

Can you just drop this patch and continue with 1/3 and 3/3 or should I 
re-send? I will update the am62x and am62ax both in a separate series 
afterwards. I probably have to update quite a lot board and that might 
take longer to get an ack by everyone.

- Daniel


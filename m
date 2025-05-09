Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF0E23237B;
	Fri,  9 May 2025 15:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806344; cv=fail; b=F5WPZDIpw4BW58+GmJoxPGsQp6HxjpelB/qxdoqUCbmM/UxyY/3jtVNv2PVml+mULPSojLyKPtRSAk9f8tbDHgNS0tFg8EugjZSGBHHaOe2o19gesbxidzeJ3MH7o+p5A1ZfVfxLiBDwjkq3eL7YSPWW48IGdmhYi/WTxXINpAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806344; c=relaxed/simple;
	bh=4WJfcLjNboXZy30E6cZfr7WbIjmXNsuQTP4YUc+KNFo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=txf/MaOIyW3HXUnbV078ujAw/H/bx1n8gE+YXca1g6tzhW/MlmMV97cz3pIY3s4lVLClE3vR0Q9Esybh4YYpwZjm1fOC7vTUpPNUksVbpZJlrJOVQTZ/g1qFYrSU5O7w7ecpCZxerZoSdaIxFNsEbGNkE7HDl5qLHUjKHkwFGSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T9hBHyTq; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T9hBHyTq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t94BaDUZIioe/d9TjM6BSoCg3pM5fmDn5XyojEtfp2XWuz1wDQQK6d/vCLr6CKpZqwpT33pGle/HuT37+LOEUHIlqRsI4WE/4Y5v5L+Yc7lDRM8FGzgFkMBDu3uW7pBtLpb5GK708qq6NFAh4r2IrLjZLW3trhGtPA7BF1a8zALs43/yOnIBN80VAE9D17PKeBPoRBBLhpAveELkwSXb4NyBeMbxfQ+V+QEx6FPponUUKw5YmWhTbkyCAphKFWqapW/gKEHJ175XnnZhAoz81v0xbV4WfQNUG8Lq3w3tOeSQj3K8kjyAcGyOBTwvQyT+Sm0x4qwdZW7jrHFuzcavlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eft4yt8x22cWK3sIPYs27A9kSA/Jm4dgFau3uOQ4jbk=;
 b=d2gXp8Kct9dNkg098CUnceloI0Pfv6wqd1YAH48/P497NCFRQ/VpCKgkpuqjShT2uvQVMuVwDc9g98R+6J55/JXWGlhJAVMZuQx5fk8dhHYv0zJrTSZ8wOwvlkA3nORmraI2efdMNa1DXx4xdxsauTeCxwYxH08KFG5pO3JKGbmIYxxbg5Yz67Cp8uzDC7XrXUctszjGatqbDAJUEDt0A8iRC9ANv4d26Tf0imUywH24R1Aw2gAsYo7zsxwu+fnhUSW8SZ6lynVuoD9Co+0zXq9a6nbxNNu3enn2dHlPxH5ITQkpR8IY4522ohk0tWvTd05tCL8JKG88A6KwuwlJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eft4yt8x22cWK3sIPYs27A9kSA/Jm4dgFau3uOQ4jbk=;
 b=T9hBHyTq5RSnNOZ73FmkdpSr0EHK8djaUyyueZa0vSOlOqwavRnAzp6ncPZbJ21IXLOjqkKEgDQhLP1dNdRx2wAgzQmd9dIeGfzO9puQd+5BVgkfLKvgOnHJdlu79bGGDH/r3E2EJtQpS/eAfBRupak2sKsbRTPKGucreeWRiwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB8810.namprd12.prod.outlook.com (2603:10b6:806:31f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 15:58:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:58:58 +0000
Message-ID: <7cbfac66-e7fc-4035-b8ff-b40fe9592085@amd.com>
Date: Fri, 9 May 2025 10:58:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/5] platform/x86: firmware_attributes_class: Add a
 high level API
To: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Joshua Grisham <josh@joshuagrisham.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
 <20250509-fw-attrs-api-v1-2-258afed65bfa@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250509-fw-attrs-api-v1-2-258afed65bfa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM5PR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:4:ad::39) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccf8b70-228d-4f52-c7da-08dd8f126844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1d5VjdsMlQ4d1ROVVhMdEx4VExVUzZIOXpwY3h6VUxSSmN4QllYQ1hlbnN4?=
 =?utf-8?B?dTJLVS9QWE1hc2RTRFRaMTJuYjBzdzE3dFVtL1VOVG82clRwUGkxaHppTFFV?=
 =?utf-8?B?eGVnSklxYTR3ZHhaT21vVkVhR0FuS05WODB1c3FhN0RwNlZQRjdzMTlscXFN?=
 =?utf-8?B?TFk2MHVQNlo1ZE5iazc3L1lBRDB0Y285b3p3TytpbFA4d3ZJQURGQ1dyNEtu?=
 =?utf-8?B?NGY3UlYwMm9oejErQktOV2Q5TkxhUUxuem1RZHRNM1pQU3FIOUw0cWp0UDdG?=
 =?utf-8?B?NDdQRnFZVHhFaWVIZlVYalVXMWdoOGtQT3ZKMWZmN0gyUTFrWmtmd2hEN2hq?=
 =?utf-8?B?WG9PVXQyYmEvS3FMYlhIcTdwbEhFWVphcXJxOTRCbUhrQTh6UUtEQjFXU3Av?=
 =?utf-8?B?QjlTaFowM0ovV1VrMjJNVWl1Y21SNnIxNE91ODl4S28zK3FsTThJaHdWRVZn?=
 =?utf-8?B?VXZ3NHhka1VIQ0RyQlRQQVN5SDBRbENUTmxZRnZsS0paMmRUNmt3bUtSUGNh?=
 =?utf-8?B?bC9oaHNhbVBRSTVWWmxKRFFhTjJvRG0xbnRIMEhBb3hFOGdWMVEvcGtScjBB?=
 =?utf-8?B?M1ovSk1BUE5BNlc3bWoyb2RrTFhraUlsVk81Z3FjUDdWZXo1QS83WGJKWUNa?=
 =?utf-8?B?UDRVeTFFSkV5U2N6SzVPWHZSMWxwaTVWcHU4ODRkUzdnTWdTVXFZZlBnUDFQ?=
 =?utf-8?B?ZHJYVW9pRUQ5SW45UXVKSTNabmdMRnBETjI3Q0Z2SWF1Nys3U05iSFFzcmVN?=
 =?utf-8?B?YWQ4aHh0MzdHQkNtMEsvby9SOWhZZndDcWJBbVNLWkVFdWRzK0FuMDF1enpj?=
 =?utf-8?B?N0RZVUFTTm92UFlhcXJ3MExLNVZsdjBQNkpqRWtCVXcrTDF4TTY4WEl0M2RL?=
 =?utf-8?B?Wi9TeFkya1haNmllVGxzTFkveGlsb2xRM3RwL0NBTHJ0OXVUdFgzcTJLOStE?=
 =?utf-8?B?TFcyUDhPR1NJK2FXSEI2alJQOTV2TFlpYXpQWS9Da01IQ1picmFjZm01TzNz?=
 =?utf-8?B?RzZoeTlxY2F3c2YwcFEzY05nWEJ6K2xrOTNIWnRTSHJoSTRucWhSS0FFOHlq?=
 =?utf-8?B?Mk1ndkkyNDRveW13ZWdMOGpjTGVxTC9pR1hUZGZscVpUSFVTb2YxZXVjS1JH?=
 =?utf-8?B?aTF0TnMzVlVMZElCQ21TSTdJa1k1SDQ0dDBRK1hFV2NrbnJ5TVdkQmYzZVJS?=
 =?utf-8?B?dWZjaU9PRjdhaWRBS1RDbE53aW1mNFNJT2pWMmpCakNZSktvRTloeENqOVFt?=
 =?utf-8?B?THFOVGwwa1JkMTBSZnJXUlVUL0JueCtKZkJ2NjJYWmN5L2VHRjFSajN2UkNt?=
 =?utf-8?B?UXhYNXdMRjBxT1ppbHJuNitzaDdzR0Uyc2tCZGpGQis1Z1lzQjZhN2xGZjYw?=
 =?utf-8?B?YVVvbWp0aUxOV3F6MFN3Q0dxK1lKZ0pHc1ZUbmI4YlFrb1RsT3oyTVJJNis0?=
 =?utf-8?B?cDRrc0I1NjFlR1hJeTNwWGNzeHZkRFUvK1pFenJCcnlOaW50R1lweHVXdG00?=
 =?utf-8?B?U1puejEwWDBBbUJwSHd5YnJOa2kyaTkrS1BHMFBvT3BuYlFHUmhhWHZkVmx2?=
 =?utf-8?B?a1FPcHA3U0ZLeEU0cVMyaWtkOER5ODJOK3MxYmV3Zk5tRE95dW9jTEF2b0Nr?=
 =?utf-8?B?dXZPWWpIT2pzQnRPUVNlb0I4Z0hFUDNXQTNzcENxbm1FVW9saDZOb0UvOXAy?=
 =?utf-8?B?Z2FrM3dXbzBpSWxJWkFkeFh0UkxhOXhUWkhtWVBNS2tkWWUySmlUY2pkYVMz?=
 =?utf-8?B?dCtPWW52SitTY0ZGSGNjN3J2emo4elRDaHNVNitXM3B1STB6VmR6aS9hMVB3?=
 =?utf-8?B?MGVxbk1nemtBaVcwZXVzMnFmUW5pZXdxVk9lN2o5K1EzZTZLZUhoWVYzK3lt?=
 =?utf-8?B?OWZmbkRzcktvS3hCUGtEdTVldDI3cEcwcDRGbkdkckNHUnFaMkI2ZjU2QjJz?=
 =?utf-8?Q?h93Y1o/lcew=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUtMc2FuU3FPQzU5K0Z1bm5ZTXNuMHo0eFY0QUZKSE94cldVelJpT2Z1Q3R4?=
 =?utf-8?B?MkpaT3FqMjBJTFl5NThCdnM4WWVyb2xxWXJqM2JtQ2ozL3RIZGdhMFd3OTYy?=
 =?utf-8?B?MDJVZUhMQnBzZFNFdENBSWxPa0JXa0VKRjBQNFJsK3pZaTczcjNTVDAraGpr?=
 =?utf-8?B?Z1FPaDRmMk00VWhFOW1YdFBmcEpEcDFQMDN6RHJobDdjSWZlSE5FWUJFRGdL?=
 =?utf-8?B?NWxPVFBTUWd3OFNRWjdTYytubnorUHVENVZNanRKbUZxbDcrVS9QbUM0NUU4?=
 =?utf-8?B?S2dFV3E3ZjFVVzF6VVJwWU1lM2lGNUtGbW1VaEIrZDZscmtPaERaMEcveWZM?=
 =?utf-8?B?bWZidlNQdHVhOWZSdlVqbG1yQmI5SDNrWCt4S25FeTA2MUhwalQ5NDlxYnVZ?=
 =?utf-8?B?V3lQYmlYQWRPRG1SeW5oVEE0aDRpYWRiVWovaGt1VEZwcVJCWHhPWmwwWjlF?=
 =?utf-8?B?NWFuMVZlVDZZMzhjeWtLNTl3RFBhY3BjejN4QjFhZTMrUmVBSkdONTUvSmpL?=
 =?utf-8?B?QmE2V0hjQUhtME1mYWw2V29Ca1gvRnRmRHVRNW1PRHpYVjZSRDRiTTF6VWVF?=
 =?utf-8?B?Q1FqQndKTVRiLzJJdzg1U0swOGVrcWpUdEZwMU04MXE1V2l3NnFMSktpdmNN?=
 =?utf-8?B?UDloV0VFSFZJdTgvSWJRUDRoeFpCTGxhcnZmQnArNFFSVUwwWWxsb1FIS2RI?=
 =?utf-8?B?V05yeWxNTGNOdlJya0UyYnZUaGRvT3ZsOXcxQmVIS1lXdzV2NE95TXRVa2o3?=
 =?utf-8?B?MHl1NkgrRyt5eFFXQzJ3T2FvS3VkcEJNM0NGYzcxcTRWR1lhL21xakNGV000?=
 =?utf-8?B?Z01rc3hoL0crMGtrdm1GWFd0Z254aWNrZXpQQW5hNmkxU2xIUGRUSjZhZUlt?=
 =?utf-8?B?YWt1Z0VacEwwOXE3YUczclB6bWxJazdLVGNsMG1KRXdSUWpLTEFzeEE1dDhC?=
 =?utf-8?B?RlZmUDY1NlBPaEFnM3Z6QTFuTVRJUmFWaFRlOEc2ZFJVK240SXUwUTc0Y0RL?=
 =?utf-8?B?NHpxQy94VjN5MmR4UzlPbTlYQVlwOTlNTCsyNmN5SkN3TS9KdmY0SEY3WHhL?=
 =?utf-8?B?SWNVZDc3VHdRR1M4UUptelUzYXFrRkhXSGorS2NLNUNnZkZQWlJVa2JUMVFB?=
 =?utf-8?B?a1FMbXpOYm9iRGhlUzZwcVJXempsUEpmb3FmS2VvWjZicHViVnhZUXdjMjZr?=
 =?utf-8?B?aDFFakJLTmtmODJZUUtuNjFNREFlbllSUVBlNDFSblJvL1dNaGJOOHlsdVYw?=
 =?utf-8?B?bEJsd0VVT2VXTjlMbXJUMnlTQjZDUDhpU2w2VDd0MXZKbzdwL3NyUldLZ3o0?=
 =?utf-8?B?a0RDVnpreEluc1haZE9tdG5EOGFxY1FRRjd3THRrYjlQcnVhaE1LVFpFYUxq?=
 =?utf-8?B?WFZDOHRHTUVqZ0xZalZLS0hGM3FaTVJBbEQwTHVYdHNvQ1djVjBTUlZodnVv?=
 =?utf-8?B?U0w3cUx4UEpEbWVQbzdhd244MllPaHMrcXM1TlFBWGVMLzdNaS9kaWpNR2xB?=
 =?utf-8?B?cE1nb1kzNEdZZE1pU0VMUEp2bkFmYWtKY2ZpUlVNaTB6RGRVanZMSG8rNk43?=
 =?utf-8?B?OU16dXA1K3QzTUZmeW12cElrYnRyQ1VoQktqMzRqd0VUbjV6OGNKdGRzRjBK?=
 =?utf-8?B?ZTg0aGRaVnFSWGRCZSs1eVZiZ1ErOEpxU1ZFRjBOcVFCekNodWdaY3ppYWZi?=
 =?utf-8?B?em5FS1l1TTdsK2NIVGxIM3lBTWpQUTI2UFVZQmFBeGY3SlRTTEZ1bzJrb2lh?=
 =?utf-8?B?ZzVhMFpXVHRrL1BUQWdWOHY0UHY0YnFRL0VRQ3hRTXRRS0VCQjRvNTZTZm1u?=
 =?utf-8?B?NVVTTHU2OWZPUXBtMm9yU2V6SUJLZlBLVWhuT3NqTTRFMVZwQzlzYThsSHpF?=
 =?utf-8?B?OCsvMHVvNUloTldkNkYvYW82RjIwM1BYMEI2aWxsbVZHRFoxbDduR2NMVUdl?=
 =?utf-8?B?L1QwVXA0ZTVrUG14bHBudVFIOUtML0swbE9jNXZrQW1wV2puS2EySkdJZFNN?=
 =?utf-8?B?WSsva05iZWFWT0hiakJWSGprTTR6bnd3ZkN3dHdBbS9mUU9pZjNLSDZEZ2xG?=
 =?utf-8?B?bE0ydE5QVGFKMTZ6aDlHcDQzS3ZHQ1FOcXVTVFRzclRNTGNBbm5oVGNLb0oy?=
 =?utf-8?Q?SRI9vsL8Y0rcVjt6JfKnVMOA+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccf8b70-228d-4f52-c7da-08dd8f126844
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:58:58.0418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkImkiceJbyFJ/UnRxr8sHB5WyRtxFCHdKrSSC6/jpguOBky/vdWUaqlvXYfvcO3q4Tcsg+/c9iKbcZbNnhkog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8810

On 5/9/2025 2:48 AM, Kurt Borja wrote:
> Add an attribute configuration mechanism through the newly introduced
> `struct fwat_dev_config`, which makes use of other documented structs
> and callbacks.
> 
> This API aims to be simple, yet flexible. In order to accomplish this,
> the following features were taken into account:
> 
> * Ability to statically define attributes
> * Custom read/write callbacks for each attribute type
> * Ability to map attributes to numbers in order to differentiate them in
>    callbacks (`aux` number)
> * Ability to reuse read/write callbacks in different attributes
> * Ability to reuse property selection in different attributes
> * Optional visibility callback for dynamic attribute visibility
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/firmware_attributes_class.c | 249 ++++++++++++++++++++++-
>   drivers/platform/x86/firmware_attributes_class.h | 228 +++++++++++++++++++++
>   2 files changed, 474 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> index 58ab1495ba3bd449cfe17de2827a57a0c5937788..7cfb0f49f235728c7450a82a7e9d00b8963d3dea 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -7,14 +7,233 @@
>   #include <linux/kobject.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
> +#include <linux/sysfs.h>
>   #include <linux/types.h>
>   #include "firmware_attributes_class.h"
>   
> +#define to_fwat_attribute_ext(_a) container_of_const(_a, struct fwat_attribute_ext, attr)
> +
> +struct fwat_attribute_ext {
> +	struct fwat_attribute attr;
> +	enum fwat_property prop;
> +	const struct fwat_attr_config *config;
> +};
> +
>   const struct class firmware_attributes_class = {
>   	.name = "firmware-attributes",
>   };
>   EXPORT_SYMBOL_GPL(firmware_attributes_class);
>   
> +static const char * const fwat_type_labels[] = {
> +	[fwat_type_integer]		= "integer",
> +	[fwat_type_string]		= "string",
> +	[fwat_type_enumeration]		= "enumeration",
> +};
> +
> +static const char * const fwat_prop_labels[] = {
> +	[FWAT_PROP_DISPLAY_NAME]		= "display_name",
> +	[FWAT_PROP_LANGUAGE_CODE]		= "display_name_language_code",
> +	[FWAT_PROP_DEFAULT]			= "default",
> +
> +	[FWAT_INT_PROP_MIN]			= "min_value",
> +	[FWAT_INT_PROP_MAX]			= "max_value",
> +	[FWAT_INT_PROP_INCREMENT]		= "scalar_increment",
> +
> +	[FWAT_STR_PROP_MIN]			= "min_length",
> +	[FWAT_STR_PROP_MAX]			= "max_length",
> +
> +	[FWAT_ENUM_PROP_POSSIBLE_VALUES]	= "possible_values",
> +};
> +
> +static ssize_t
> +fwat_type_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
> +{
> +	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
> +	const struct fwat_attr_config *config = ext->config;
> +
> +	return sysfs_emit(buf, "%s\n", fwat_type_labels[config->type]);
> +}
> +
> +static ssize_t
> +fwat_property_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
> +{
> +	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
> +	const struct fwat_attr_config *config = ext->config;
> +
> +	if (!config->ops->prop_read)
> +		return -EOPNOTSUPP;
> +
> +	return config->ops->prop_read(dev, config->aux, ext->prop, buf);
> +}
> +
> +static ssize_t
> +fwat_current_value_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
> +{
> +	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
> +	const struct fwat_attr_config *config = ext->config;
> +	const char *str;
> +	long int_val;
> +	int ret;
> +
> +	switch (config->type) {
> +	case fwat_type_integer:
> +		ret = config->ops->integer_read(dev, config->aux, &int_val);
> +		if (ret)
> +			return ret;
> +
> +		return sysfs_emit(buf, "%ld\n", int_val);
> +	case fwat_type_string:
> +		ret = config->ops->string_read(dev, config->aux, &str);
> +		if (ret)
> +			return ret;
> +
> +		return sysfs_emit(buf, "%s\n", str);
> +	case fwat_type_enumeration:
> +		ret = config->ops->enumeration_read(dev, config->aux, &str);
> +		if (ret)
> +			return ret;
> +
> +		return sysfs_emit(buf, "%s\n", str);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static ssize_t
> +fwat_current_value_store(struct device *dev, const struct fwat_attribute *attr,
> +			 const char *buf, size_t count)
> +{
> +	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
> +	const struct fwat_attr_config *config = ext->config;
> +	long int_val;
> +	int ret;
> +
> +	switch (config->type) {
> +	case fwat_type_integer:
> +		ret = kstrtol(buf, 0, &int_val);
> +		if (ret)
> +			return ret;
> +
> +		ret = config->ops->integer_write(dev, config->aux, int_val);
> +		break;
> +	case fwat_type_string:
> +		ret = config->ops->string_write(dev, config->aux, buf);
> +		break;
> +	case fwat_type_enumeration:
> +		ret = config->ops->enumeration_write(dev, config->aux, buf);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return ret ? ret : count;
> +}
> +
> +static struct attribute *
> +fwat_alloc_attr(struct device *dev, const struct fwat_attr_config *config,
> +		const char *attr_name, umode_t mode, enum fwat_property prop,
> +		ssize_t (*show)(struct device *dev, const struct fwat_attribute *attr,
> +				char *buf),
> +		ssize_t (*store)(struct device *dev, const struct fwat_attribute *attr,
> +				 const char *buf, size_t count))
> +{
> +	struct fwat_attribute_ext *fattr;
> +
> +	fattr = devm_kzalloc(dev, sizeof(*fattr), GFP_KERNEL);
> +	if (!fattr)
> +		return NULL;
> +
> +	fattr->attr.attr.name = attr_name;
> +	fattr->attr.attr.mode = mode;
> +	fattr->attr.show = show;
> +	fattr->attr.store = store;
> +	fattr->prop = prop;
> +	fattr->config = config;
> +	sysfs_attr_init(&fattr->attr.attr);
> +
> +	return &fattr->attr.attr;
> +}
> +
> +static struct attribute **
> +fwat_create_attrs(struct device *dev, const struct fwat_attr_config *config)
> +{
> +	struct attribute **attrs;
> +	enum fwat_property prop;
> +	unsigned int index = 0;
> +
> +	attrs = devm_kcalloc(dev, config->num_props + 3, sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs)
> +		return NULL;
> +
> +	/*
> +	 * Create optional attributes
> +	 */
Just a nit here; this probably doesn't need to be a multiline comment. 
a single line like this is fine:

/* optional attributes */

> +	for (; index < config->num_props; index++) {
> +		prop = config->props[index];
> +		attrs[index] = fwat_alloc_attr(dev, config, fwat_prop_labels[prop],
> +					       0444, prop, fwat_property_show, NULL);
> +	}
> +
> +	/*
> +	 * Create mandatory attributes
> +	 */

Same as above

> +	attrs[index++] = fwat_alloc_attr(dev, config, "type", 0444, 0, fwat_type_show, NULL);
> +	attrs[index++] = fwat_alloc_attr(dev, config, "current_value", 0644, 0,

Is this permission right?  Some attributes could be considered more 
sensitive can't they?

> +					 fwat_current_value_show, fwat_current_value_store);
> +
> +	return attrs;
> +}
> +
> +static const struct attribute_group *
> +fwat_create_group(struct device *dev, const struct fwat_attr_config *config)
> +{
> +	struct attribute_group *group;
> +	struct attribute **attrs;
> +
> +	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
> +	if (!group)
> +		return NULL;
> +
> +	attrs = fwat_create_attrs(dev, config);
> +	if (!attrs)
> +		return NULL;
> +
> +	group->name = config->name;
> +	group->attrs = attrs;
> +
> +	return group;
> +}
> +
> +static const struct attribute_group **
> +fwat_create_auto_groups(struct device *dev, const struct fwat_dev_config *config)
> +{
> +	const struct attribute_group **groups;
> +	const struct attribute_group *grp;
> +	unsigned int index = 0;
> +	size_t ngroups = 0;
> +
> +	while (config->attrs_config[ngroups])
> +		ngroups++;
> +
> +	groups = devm_kcalloc(dev, ngroups + 1, sizeof(*groups), GFP_KERNEL);
> +	if (!groups)
> +		return NULL;
> +
> +	for (unsigned int i = 0; i < ngroups; i++) {
> +		if (config->is_visible &&
> +		    !config->is_visible(dev, config->attrs_config[i]))
> +			continue;
> +
> +		grp = fwat_create_group(dev, config->attrs_config[i]);
> +		if (!grp)
> +			return NULL;
> +
> +		groups[index++] = grp;
> +	}
> +
> +	return groups;
> +}
> +
>   static ssize_t fwat_attrs_kobj_show(struct kobject *kobj, struct attribute *attr,
>   				    char *buf)
>   {
> @@ -61,6 +280,7 @@ static const struct kobj_type fwat_attrs_ktype = {
>    *			  device
>    * @parent: Parent device
>    * @name: Name of the class device
> + * @config: Device configuration
>    * @data: Drvdata of the class device
>    * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
>    *
> @@ -72,8 +292,10 @@ static const struct kobj_type fwat_attrs_ktype = {
>    */
>   struct fwat_device *
>   fwat_device_register(struct device *parent, const char *name, void *data,
> +		     const struct fwat_dev_config *config,
>   		     const struct attribute_group **groups)
>   {
> +	const struct attribute_group **auto_groups;
>   	struct fwat_device *fadev;
>   	struct device *dev;
>   	int ret;
> @@ -97,19 +319,36 @@ fwat_device_register(struct device *parent, const char *name, void *data,
>   	if (ret)
>   		goto out_kobj_put;
>   
> -	if (groups) {
> -		ret = sysfs_create_groups(&fadev->attrs_kobj, groups);
> +	if (config) {
> +		auto_groups = fwat_create_auto_groups(dev, config);
> +		if (!auto_groups) {
> +			ret = -ENOMEM;
> +			goto out_kobj_unregister;
> +		}
> +
> +		ret = sysfs_create_groups(&fadev->attrs_kobj, auto_groups);
>   		if (ret)
>   			goto out_kobj_unregister;
>   	}
>   
> +	if (groups) {
> +		ret = sysfs_create_groups(&fadev->attrs_kobj, groups);
> +		if (ret)
> +			goto out_remove_auto_groups;
> +	}
> +
>   	fadev->dev = dev;
>   	fadev->groups = groups;
> +	fadev->auto_groups = groups;
>   
>   	kobject_uevent(&fadev->attrs_kobj, KOBJ_ADD);
>   
>   	return fadev;
>   
> +out_remove_auto_groups:
> +	if (config)
> +		sysfs_remove_groups(&fadev->attrs_kobj, auto_groups);
> +
>   out_kobj_unregister:
>   	kobject_del(&fadev->attrs_kobj);
>   
> @@ -125,6 +364,8 @@ void fwat_device_unregister(struct fwat_device *fwadev)
>   {
>   	if (fwadev->groups)
>   		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->groups);
> +	if (fwadev->auto_groups)
> +		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->auto_groups);
>   	kobject_del(&fwadev->attrs_kobj);
>   	kobject_put(&fwadev->attrs_kobj);
>   	device_unregister(fwadev->dev);
> @@ -143,6 +384,7 @@ static void devm_fwat_device_release(void *data)
>    *			       device
>    * @parent: Parent device
>    * @name: Name of the class device
> + * @config: Device configuration
>    * @data: Drvdata of the class device
>    * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
>    *
> @@ -156,12 +398,13 @@ static void devm_fwat_device_release(void *data)
>    */
>   struct fwat_device *
>   devm_fwat_device_register(struct device *parent, const char *name, void *data,
> +			  const struct fwat_dev_config *config,
>   			  const struct attribute_group **groups)
>   {
>   	struct fwat_device *fadev;
>   	int ret;
>   
> -	fadev = fwat_device_register(parent, name, data, groups);
> +	fadev = fwat_device_register(parent, name, data, config, groups);
>   	if (IS_ERR(fadev))
>   		return fadev;
>   
> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
> index ad94bf91e5af30a2b8feb9abf224ee6f0d17600a..f250875d785c3439682c43c693f98e1c20e9ff54 100644
> --- a/drivers/platform/x86/firmware_attributes_class.h
> +++ b/drivers/platform/x86/firmware_attributes_class.h
> @@ -18,11 +18,14 @@ extern const struct class firmware_attributes_class;
>    * @dev: The class device.
>    * @attrs_kobj: The "attributes" root kobject.
>    * @groups: Sysfs groups attached to the @attrs_kobj.
> + * @auto_groups: Sysgs groups generated from &struct fwat_attr_config attached.
> + * to the @attrs_kobj
>    */
>   struct fwat_device {
>   	struct device *dev;
>   	struct kobject attrs_kobj;
>   	const struct attribute_group **groups;
> +	const struct attribute_group **auto_groups;
>   };
>   
>   #define to_fwat_device(_k)	container_of_const(_k, struct fwat_device, attrs_kobj)
> @@ -30,6 +33,7 @@ struct fwat_device {
>   /**
>    * struct fwat_attribute - The firmware-attributes's custom attribute
>    * @attr: Embedded struct attribute.
> + * @aux: Auxiliary number defined by the user.
>    * @show: Show method called by the "attributes" kobject's ktype.
>    * @store: Store method called by the "attributes" kobject's ktype.
>    */
> @@ -43,14 +47,238 @@ struct fwat_attribute {
>   
>   #define to_fwat_attribute(_a) container_of_const(_a, struct fwat_attribute, attr)
>   
> +enum fwat_attr_type {
> +	fwat_type_integer,
> +	fwat_type_string,
> +	fwat_type_enumeration,
> +};
> +
> +enum fwat_property {
> +	FWAT_PROP_DISPLAY_NAME,
> +	FWAT_PROP_LANGUAGE_CODE,
> +	FWAT_PROP_DEFAULT,
> +
> +	FWAT_INT_PROP_MIN,
> +	FWAT_INT_PROP_MAX,
> +	FWAT_INT_PROP_INCREMENT,
> +
> +	FWAT_STR_PROP_MIN,
> +	FWAT_STR_PROP_MAX,
> +
> +	FWAT_ENUM_PROP_POSSIBLE_VALUES,
> +};
> +
> +struct fwat_attr_config;
> +
> +/**
> + * struct fwat_attr_ops - Operations for a firmware *attribute*
> + * @prop_read: Callback for retrieving each configured property of an attribute.
> + * @integer_read: Callback for reading the current_value of an attribute of
> + *                type *integer*.
> + * @integer_write: Callback for writing the current_value of an attribute of
> + *                 type *integer*.
> + * @string_read: Callback for reading the current_value of an attribute of type
> + *               *string*.
> + * @string_write: Callback for writing the current_value of an attribute of type
> + *                *string*.
> + * @enumeration_read: Callback for reading the current_value of an attribute of
> + *                    type *enumeration*.
> + * @enumeration_write: Callback for writing the current_value of an attribute
> + *                     of type *enumeration*.
> + */
> +struct fwat_attr_ops {
> +	ssize_t (*prop_read)(struct device *dev, long aux,
> +			     enum fwat_property prop, const char *buf);
> +	union {
> +		struct {
> +			int (*integer_read)(struct device *dev, long aux,
> +					    long *val);
> +			int (*integer_write)(struct device *dev, long aux,
> +					     long val);
> +		};
> +		struct {
> +			int (*string_read)(struct device *dev, long aux,
> +					   const char **str);
> +			int (*string_write)(struct device *dev, long aux,
> +					    const char *str);
> +		};
> +		struct {
> +			int (*enumeration_read)(struct device *dev, long aux,
> +						const char **str);
> +			int (*enumeration_write)(struct device *dev, long aux,
> +						 const char *str);
> +		};
> +	};
> +};
> +
> +/**
> + * struct fwat_attr_config - Configuration for a single firmware *attribute*
> + * @name: Name of the sysfs group associated with this *attribute*.
> + * @type: Type of this *attribute*.
> + * @aux: Auxiliary number defined by the user, which will be passed to
> + *       read/write callbacks.
> + * @ops: Operations for this *attribute*.
> + * @props: Array of properties of this *attribute*.
> + * @num_props: Size of the props array.
> + */
> +struct fwat_attr_config {
> +	const char *name;
> +	enum fwat_attr_type type;
> +	long aux;
> +	const struct fwat_attr_ops *ops;
> +	const enum fwat_property *props;
> +	size_t num_props;
> +};
> +
> +/**
> + * DEFINE_SIMPLE_FWAT_OPS() - Define static &struct fwat_attr_ops for a simple
> + *                            *attribute* with no properties, i.e. No
> + *                            &fwat_attr_ops.read_prop callback
> + * @_name: Prefix of the `read` and `write` callbacks.
> + * @_type: Firmware *attribute* type.
> + *
> + * Example:
> + *
> + * static int example_read(...) {...}
> + * static int example_write(...) {...}
> + *
> + * DEFINE_SIMPLE_FWAT_OPS(example, ...);
> + */
> +#define DEFINE_SIMPLE_FWAT_OPS(_name, _type)		\
> +	static const struct fwat_attr_ops _name##_ops = { \
> +		._type##_read = _name##_read,		\
> +		._type##_write = _name##_write,		\
> +	}
> +
> +/**
> + * DEFINE_FWAT_OPS() - Define static &struct fwat_attr_ops with all callbacks.
> + * @_name: Prefix of the `read` and `write` callbacks.
> + * @_type: Firmware *attribute* type.
> + *
> + * Example:
> + *
> + * static int example_read(...) {...}
> + * static int example_write(...) {...}
> + * static int example_prop_read(...) {...}
> + *
> + * DEFINE_FWAT_OPS(example, ...);
> + */
> +#define DEFINE_FWAT_OPS(_name, _type)			\
> +	static const struct fwat_attr_ops _name##_ops = { \
> +		.prop_read = _name##_prop_read,		\
> +		._type##_read = _name##_read,		\
> +		._type##_write = _name##_write,		\
> +	}
> +
> +/**
> + * FWAT_CONFIG() - Configuration pointer for a single firmware *attribute*.
> + * @_name: String name of this *attribute*.
> + * @_type: Firmware *attribute* type.
> + * @_ops: Pointer to &struct fwat_attr_ops.
> + * @_props: Pointer to a enum fwat_property array.
> + * @_num_props: Size of the @_props array.
> + *
> + * This is a convenience macro to quickly construct a &struct fwat_attr_config
> + * array, which will be passed to &struct fwat_dev_config.
> + *
> + * Example:
> + *
> + * static int example_read(...) {...}
> + * static int example_write(...) {...}
> + * static int example_prop_read(...) {...}
> + *
> + * DEFINE_FWAT_OPS(example, ...);
> + *
> + * static const enum fwat_property props[] = {...};
> + *
> + * static const struct fwat_attr_config * const attrs_config[] = {
> + *	FWAT_CONFIG(example, ..., &example_fwat_ops, props,
> + *		    ARRAY_SIZE(props)),
> + *	...
> + *	NULL
> + * };
> + *
> + * static const struct fwat_dev_config fdev_config = {
> + *	.attrs_config = attrs_config,
> + *	...
> + * }
> + */
> +#define FWAT_CONFIG(_name, _type, _ops, _props, _num_props) \
> +	(&(const struct fwat_attr_config) {	\
> +		.name = _name,				\
> +		.type = fwat_type_##_type,		\
> +		.ops = _ops,				\
> +		.num_props = _num_props,		\
> +		.props = _props,			\
> +	})
> +
> +/**
> + * FWAT_CONFIG_AUX() - Configuration pointer for a single firmware *attribute*
> + *                     with an auxiliary number defined by the user
> + * @_name: String name of this *attribute*.
> + * @_type: Firmware *attribute* type.
> + * @_aux: Auxiliary number defined by the user.
> + * @_ops: Pointer to &struct fwat_attr_ops.
> + * @_props: Pointer to a enum fwat_property array.
> + * @_num_props: Size of the @_props array.
> + *
> + * This is a convenience macro to quickly construct a &struct fwat_attr_config
> + * array, which will be passed to &struct fwat_dev_config.
> + *
> + * Example:
> + *
> + * static int example_read(...) {...}
> + * static int example_write(...) {...}
> + * static int example_prop_read(...) {...}
> + *
> + * DEFINE_FWAT_OPS(example, ...);
> + *
> + * static const enum fwat_property props[] = {...};
> + *
> + * static const struct fwat_attr_config * const config[] = {
> + *	FWAT_CONFIG_AUX(example, ..., n, &example_fwat_ops, props,
> + *			ARRAY_SIZE(props)),
> + *	...
> + *	NULL
> + * };
> + *
> + * static const struct fwat_dev_config fdev_config = {
> + *	.attrs_config = attrs_config,
> + *	...
> + * }
> + */
> +#define FWAT_CONFIG_AUX(_name, _type, _aux, _ops, _props, _num_props) \
> +	(&(const struct fwat_attr_config) {		\
> +		.name = _name,				\
> +		.type = fwat_type_##_type,		\
> +		.aux = _aux,				\
> +		.ops = _ops,				\
> +		.num_props = _num_props,		\
> +		.props = _props,			\
> +	})
> +
> +/**
> + * struct fwat_dev_config - Configuration for this devices's
> + *                          &fwat_device.auto_groups
> + * @attrs_config: NULL terminated &struct fwat_attr_config array.
> + * @is_visible: Optional visibility callback to determine the visibility
> + *              of each auto_group.
> + */
> +struct fwat_dev_config {
> +	const struct fwat_attr_config *const *attrs_config;
> +	bool (*is_visible)(struct device *dev, const struct fwat_attr_config *config);
> +};
> +
>   struct fwat_device * __must_check
>   fwat_device_register(struct device *parent, const char *name, void *data,
> +		     const struct fwat_dev_config *config,
>   		     const struct attribute_group **groups);
>   
>   void fwat_device_unregister(struct fwat_device *fwadev);
>   
>   struct fwat_device * __must_check
>   devm_fwat_device_register(struct device *parent, const char *name, void *data,
> +			  const struct fwat_dev_config *config,
>   			  const struct attribute_group **groups);
>   
>   #endif /* FW_ATTR_CLASS_H */
> 


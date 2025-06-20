Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D78101EE;
	Fri, 20 Jun 2025 03:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750388780; cv=fail; b=P8ryeVz5734gCGf9Fa8kwI/gteWBDuuF8WVXApRV5p/ma036QuegSjX2WRDwFWP8JxnaVKWC+Sh0zdA9A1Jh5iGbq1AHbEQkwtZGUfpDtWoISIsEZly6HMuVXJOFaA+8mY8bsXrakF5Z9sb6+rMOkJQ6OO4cCjbLhHKtEFvKmSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750388780; c=relaxed/simple;
	bh=Cue0nV2Wt8dI4TI/TfufbPAAM6k5TRTLDlQP0LLfY5I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tm14YkaEpX04FhejhNVIR/7AtPGdeZdrQGh3CFTu6ekrDACwjlb+JBOaz9LN0SesB3YmugZjwCCbT/+62B2x/x2m0ZAbS3eq3BhAwmCYg0SJcY/NmgmWSbYKuaYfQvkCF09rhd257JYnDwJfSeryIfBKwPQcN/Oxpgmm8qUXvKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LnipFjls; arc=fail smtp.client-ip=40.107.244.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LnipFjls"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZuA1tPmIKb2QiqDvNQLWIMn2Zsg31fl9gDoF84GrKIPWWyUTpjGeMa3l/6gZxcQze6kZYpi5KzMcb6pdIvJhsR9DeSr/8ZUx+0ZFTeQT0jP70qGsthXCt64SR1V5Onb7NcX+1w8m441ashAPkigOAnt4/vdwcCoNqGNXPjaw3kPA7mzSEv6pHZ/XELW19woG/xaJq9yKgO0m5qqM2wvsx6MWA9tAb0piwWoj2l6xv/04sms9PV8yxCEQRbOXzu8ba3fRTayqahYKr7VVdWb3aFHS8aDARiGOJ8Y3UzguFbHWg+CXTmLfKObZEWBAE9KWxyBl3vIC9BaA61a+hjzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6flxEDSoL2QgYGVW6xRK4F+yTSO6S86Nom+qxbnrGE=;
 b=wvUHtMdC3EKAtdKseSTRr0eOn5dGi1gpmdL9wuavH0mKf5WQ3bONtUYdXEX9+pFHvf5NcwHaH3rTiEHU+35MMpsiFeWFtQadE+2YnB/SF4II+1vXaVCxK8yvhqPVHRxSEbviPQLKo79OdwP2BDjKB+oVJ9Y+/IL4CMaH0bKjsn04qNA/YrI00Ou0mh3Cl/N6I1sVAfOQNTUQ2vgVUFoJDmM29yvW9HrAoxizbBnDT2yFo2ma5vx+i/A0q2c9hRZ9vvq0sqJIV5sdK88PprgEyubbrZ1W9ofuBUeCoY6S1Qe7c6WD3h6gSt65mrt/8AWhOsKfeqjezMXkaIz7Q5+Cng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6flxEDSoL2QgYGVW6xRK4F+yTSO6S86Nom+qxbnrGE=;
 b=LnipFjlsgDkHaSn4Xa2W5p1jIwzDqsf7cMfGMMnzmXBduEI6rX+yy+KT3xezOW20C4beKOpgklWvX2aI69AzPyTlLxCWUVe0ASNf9r2aT/lxscTU2IeWDPRza02ht0WkQp2WEmuE5MGCiEjd5aw80uTap719O6gXC9fxiy9FvZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 03:06:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 03:06:14 +0000
Message-ID: <4efba85a-332f-4134-9a1e-50101c80aa73@amd.com>
Date: Thu, 19 Jun 2025 22:06:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Update swnode graph for amd isp4
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, Dominic.Antony@amd.com, Phil.Jawich@amd.com
References: <20250618202958.3934822-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250618202958.3934822-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0147.namprd11.prod.outlook.com
 (2603:10b6:806:131::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b61b113-49f3-4b97-4a0b-08ddafa769dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVZWelNJelI5Q2lVWGpkV0N1c1lrUUgwQjJyMUdsSUpTSUxBbXpFTldDWkIv?=
 =?utf-8?B?UFlxc0RqQ3pESTVDeGtKRStweEdVbXNWZFo5OVZURElqSUFKajlJcHZ4bVRO?=
 =?utf-8?B?SjUxdnYyQkppTVBsaWYrZmh0Uzcwcmwxa0VLRmZrSTZXTDBrZmZIMFVlaWtH?=
 =?utf-8?B?aWt3UG8rZW5WUmIycDZIUW8wNjZKOFFkUi9ldFpkbWI1ZGxjakpuN2o1YURC?=
 =?utf-8?B?eVpORlVEUDBuZy9TMFpMcEVPNHdrSnZ6cHIzOWhIQTMyb2NhME45RW5JQWtE?=
 =?utf-8?B?N1hZTzlva2lqTnlZUVBpWk50cytybnlCWnppNmdvTDZqVmZ0ZVRhTjkxaU5j?=
 =?utf-8?B?bDdBdzBYQXF4WmpMUjZhQUx0VGxLVW41aTBNM1EvZldxOWRaYnBwSVpwM05n?=
 =?utf-8?B?WVl0SmV0RFBaZU5ScmFjSE9RcGFoSDFxdE8rb0FPajZWS1Z0ckJScGhhY1M3?=
 =?utf-8?B?TiszbVoxUFloZGsrNnFPajVoY3JsMFBJbHkrcUV0aFNSV2NWZEFOWWZWZkwz?=
 =?utf-8?B?VW1BSnppajlqbStjVzNqcnJ4TUFnUWJ4Zm9FeUZJbkJWNHRPb3BzSnNWWG1E?=
 =?utf-8?B?MVBtQTdYNHRKallMRlBDWkIvQVNzZ2ZPRTJrTFowRG9WOWMxcjlsOFo2TXFQ?=
 =?utf-8?B?REQ3b2o5aUJGanJOeS8zbXg4RWRqSmlCNEhTdGRHZWhJUWozbWZ6YXRUQWtK?=
 =?utf-8?B?dHlEdFNGQysyeUhYNzdWYzNpYkszYVY4S1kzQkp4NXpBRDIvUHQ3ekc1TWd1?=
 =?utf-8?B?SnhkdWhvVjVLMkdpZlV6dSt3TGtJUUhtZXJQRnkrNHV1VUxESTNHVlc1ZWx4?=
 =?utf-8?B?WldxSndEdEppZktzRXNZQ3hxZFhvYml2MjBUbHNJQzZlalpybGZoU09PUFYw?=
 =?utf-8?B?b0grMEMwU0UrRzB6YlJ3eWIwTXhpYUp2RWM5SFN2NisvM0ZHR2ZNMnU5WlRB?=
 =?utf-8?B?UGVLKzRYUVh1WWNCdFlEVWxpaEFEZDNqc1d2OUxQdUNPT3dONkZ3cFBGOUg5?=
 =?utf-8?B?YWZRMmcycXJYaGFxbmtxV2IrY2g4UGpId1pZWUM1TzRmOWNUYk1EWVBrbUZi?=
 =?utf-8?B?MGVIb1FQb2dLTEQ5UU9FWldjV2liVkx0bGVXNWdvMHFZNmFIWFNLSkRSY0Yw?=
 =?utf-8?B?WjVJZVdNMW13RkV2Ui9NWGVZSlNhQnFyd0FIYlVPRWVJVHlVR2lpT1JQNHV0?=
 =?utf-8?B?Q1VsUU9xYkF1MGY3Zmc5c0s2RWRFTkNVSWxEVDRBeS9VSS9iczBiaEdqZkNN?=
 =?utf-8?B?N3FnMnFuV3A0UjE2dGkxT3kzeHZ5dEZYcWZETEhxbUNRVmpsc25YL3JCR3hq?=
 =?utf-8?B?WklucitnQmRBeW9HWFI4MksreFk5MnUwMUxpSmt1K2V5RjRncDZTWTBwQTM3?=
 =?utf-8?B?dnlCNXh4Ky9hSVNNdWxRM1NTS1FwWkQrTWJxclZCemtlQ29Vb3JjOUxUazVl?=
 =?utf-8?B?ZzhpcXBmcEptbHEzd0lBOEpjOVlYbDZzYlNtMVl5WXpNN09MMzJ5WFAxcUpK?=
 =?utf-8?B?VXpvQmtJaitNUmVmNlQzaDVPOTJ2OUlWNFhhaWdyUEx5eE5vOUlvRkFoUkNS?=
 =?utf-8?B?ajRJSERrbUxyYldTUzlTRnVNSFp3SDQxY1hKZGZqd21BelJPZ2o5UUFrOWJO?=
 =?utf-8?B?RkxLTEpVdXppWE0zL0NoSjZnLzhucFd1Y2FvVFRENEtNZ2wvM3hBYmtpQ2RH?=
 =?utf-8?B?ZFcrQVNpNFJTQmY5Vk45UU9EeG9jRGdoQkZaR0dKS2U4NzEzUFJ0M0FldHhO?=
 =?utf-8?B?TlRHL0hlVEhTZDNjcTZCSWgySWhXV3BDZ29DZHg1WVN2TFFuaWY4enVQSTFn?=
 =?utf-8?B?VmREZm1YZHZrajdUekR0R0krTktWc3JlcU5LQkVadDZJNm9VbnIzL3lIZVlz?=
 =?utf-8?B?d0hsNUtLd1hlc1lNUytkSW1vVHEreDhnOENabmU4YnBmeVVPZ0o3aUwwMFZV?=
 =?utf-8?Q?umD0lCF+VQ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azRncHJQcWthMUN0WVN4UHNDKzRXOStmMzNub2tteGIrV1lwTGN3c0ljMEdI?=
 =?utf-8?B?Q2tTeU5OaTFTL2RLdUFvNkJERjVxRjduYjdNLzl1b1dnNGUzSWI4dzNjSm4r?=
 =?utf-8?B?eDEvYlhJZmNKK1N6MHVwSFJQTTRYMy9lR0tZVTJ2OHBDU0pJUm5CYUJQakVI?=
 =?utf-8?B?WHR6M3lwVzYxMldGMFlWQ2VZR0hxbWlQRStjenJVcVA5Y3B4NHAxV1QvVE54?=
 =?utf-8?B?SmdJdUtYb2JPbGlDNlFFazUwRFVzb1hGWDJTL3VEWnpEZU1IRHVtb3VUTUk0?=
 =?utf-8?B?SmdINzJEcWFOSHFmTU9QTmRNMzNQdWQxMGliZ2FMUFN4QnFJdk4xbUl0Z2Ju?=
 =?utf-8?B?R1I4Tm5EN0c2bXgvQ2RVUEx3NnJxUXZwZUtOSjRuM2QxdmFyaXlZeVI2Um5U?=
 =?utf-8?B?by9iWHQxZXdINjYvL0lQeDk3NXBWbFlLdmt2OGpWdWlPZ0xxWVY0MU4weHE2?=
 =?utf-8?B?T2I1Uzg2L21CeTNuMzZFMGdqcUt1RElXb0Exd2NUWEhDY2VVVU83SGYyOGlL?=
 =?utf-8?B?UDdOazVnc0Z6dmZwdkI5Vnd6TzJ5aTkzYWRVbzFYK2pkU2s1WUNJMW1LamRs?=
 =?utf-8?B?bW85ZEZSRnNKbXFaUzlNQ3dwSjJOQlIveTYvR1NlZHdjZlgvQ2VSZW5tMG1h?=
 =?utf-8?B?ajVoekdKQ2FvWmgzbjhIYWF0N1RWSVpQeDgwNllYcWZ0ZW5HMUUzSDQ0ZkdD?=
 =?utf-8?B?ZnJ5R2xodmRKMmZITUh3NlVzbTE1QWw4KzRIWEtzQW5GU1BKWjJnbUdaMklG?=
 =?utf-8?B?Tm1ZcG5HazdMV2U2N2VJMHR5Vkl1RG1tdjFUKzNoTXAxT0lvc2VxakdGL1py?=
 =?utf-8?B?aWtQT010K0NkRndyN2t2TWtNajZyOWFhNEVhZ01NcUsrZm5McUVLRWRUa1Mr?=
 =?utf-8?B?RDlHdllhU1NNa0FzSTU2T1QvTEo2SWJDNjYzam5uZGwrUitNTlN3c0FreEhX?=
 =?utf-8?B?OHNWMlNwVk45aVFKNjdRMGV6VlE4NnFUTG5QU1lOV1REbEJCSy9IQ2dYN3hn?=
 =?utf-8?B?cmVJamdRNlhUUExVRnMzRFo1Kzhmb2RRK3BVWXZrNTNWd0lqcEM1bGxCbkhu?=
 =?utf-8?B?b3E2ZEt3L2EvWm55L0hjRlh2STRhRWNYN2gyWHIyTTV2RFZjUG0rdHIzQ0FB?=
 =?utf-8?B?U3kvcGVNd3BSVVYvbkI0dTBjTWV5K2RwQUNuQlc0SWxwTDZvd2tBb2JOYmVW?=
 =?utf-8?B?TndId25qS2NTNzdKMnpuUTJKMUo3a2Fkd3JOY1BVbVAvbERlOUlkNEluM05E?=
 =?utf-8?B?SGgyTDI0T3oyNlBaekhVeXRLNENzcmVJWVBWRVZuTzQ0UGxEd25rSS9CRmJH?=
 =?utf-8?B?ck80bkZRbTBCbjJ0aE9xdGdKYnBMMFZ5SFVPZUNBcGJyUGN1d21hYjVobi92?=
 =?utf-8?B?MGpSaXhkTmlrQVlWK2lBcU1wdmJiamRHRkVxazZ4U01nL0x1S05qRW16d1M0?=
 =?utf-8?B?bUI4OHpzYUd0ZEV3WHFMU3RaUlRQSndzc1FWVTJ2aURiak1rcUtYYmRlUGIx?=
 =?utf-8?B?Z0pabVdleDhtOE0rMHFlbWh4N0tEcGpQSnl5Z2Jlc1FmaWNrWFViVFczMVBq?=
 =?utf-8?B?aDIyTTg5RlpsQURaNkwzZFBkZkNMR2l4bkNhRjJ2N0F5STJCSjVscnhBZVFI?=
 =?utf-8?B?RzVNa1NXaDlmSzhEOHd6ZHo0MWNNU2RkTmFML21QYitoMXVzUm1PUEpmYkF6?=
 =?utf-8?B?VGZudmpMRTJnVXFFdWpBbkdpRStLK3QveHhvejNxUkwyNmR4OEN4VEFvVDVu?=
 =?utf-8?B?UXlROE8zUmhTckh2dy8yZnY0N2krSDNOTDh4eDJsS2V4aGV6VFpwUkZES2hs?=
 =?utf-8?B?SlNOczgyemw1Z3VGWVdJRU45NGlFWmFHeFE0aWJmQk1aVGc3T0YvV0xxbnlN?=
 =?utf-8?B?Z29qL3VreEloYklQN05BVGVkMThFODkvaktWNmtaVDVHNjdGN2t6SHo3ZmxW?=
 =?utf-8?B?cUZDQURQUEl4UXpGYTFTZGtmbWVtT29QOGwyNjZQeE1KS0pZU1FyWXFJUm50?=
 =?utf-8?B?R2xMWHVnVmtTRU1CTmlpTHNVSnNJdER2RTJxK2lUWk9EU3pndHNZcGp0V2U5?=
 =?utf-8?B?a3lkQWpVNExtdmsvNVYvcmpBcEw1QjRkc1UrNE5wKytUR3Y4ckhZZWZVbW1Q?=
 =?utf-8?Q?nZ2tssC3J7AKX5HL176413Ai1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b61b113-49f3-4b97-4a0b-08ddafa769dd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 03:06:13.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mwrPTxsY03zEvhQfp7dFr8d+qhnAksiKEkkoXxyulF91TwzvvZ4wFepJl3z7dEw49ustxeOcG6lAdRUMOv9bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400

On 6/18/2025 3:29 PM, Pratap Nirujogi wrote:
> Existing swnode graph format is specific to sensor device
> and is causing conflicts when accessing standard property
> variables outside the sensor driver.
> 
> To address this issue, enhanced swnode graph format with
> dedicated nodes for i2c and isp devices, with sensor node
> added as child to i2c node. This approach allows to have
> standard property variables (ex: 'clock-frequency') with
> values applicable for each of the devices (sensor, i2c and
> isp).
> 
> ACPI device driver_data handle is also initialized with root
> camera swnode to access the property variables in the graph
> in isp and i2c drivers.
> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/amd_isp4.c | 181 ++++++++++++++++++++++------
>   1 file changed, 144 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
> index 0cc01441bcbb..c440a7dfed27 100644
> --- a/drivers/platform/x86/amd/amd_isp4.c
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -20,6 +20,9 @@
>   #define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
>   #define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
>   
> +static const struct software_node isp4_mipi1_endpoint_node;
> +static const struct software_node ov05c10_endpoint_node;
> +
>   /*
>    * AMD ISP platform info definition to initialize sensor
>    * specific platform configuration to prepare the amdisp
> @@ -42,55 +45,116 @@ struct amdisp_platform {
>   	struct mutex lock;	/* protects i2c client creation */
>   };
>   
> -/* Top-level OV05C10 camera node property table */
> +/* Root AMD CAMERA SWNODE */
> +
> +/* Root amd camera node definition */
> +static const struct software_node amd_camera_node = {
> +	.name = "amd_camera",
> +};
> +
> +/* ISP4 SWNODE */
> +
> +/* ISP4 OV05C10 camera node definition */
> +static const struct software_node isp4_node = {
> +	.name = "isp4",
> +	.parent = &amd_camera_node,
> +};
> +
> +/*
> + * ISP4 Ports node definition. No properties defined for
> + * ports node.
> + */
> +static const struct software_node isp4_ports = {
> +	.name = "ports",
> +	.parent = &isp4_node,
> +};
> +
> +/*
> + * ISP4 Port node definition. No properties defined for
> + * port node.
> + */
> +static const struct software_node isp4_port_node = {
> +	.name = "port@0",
> +	.parent = &isp4_ports,
> +};
> +
> +/*
> + * ISP4 MIPI1 remote endpoint points to OV05C10 endpoint
> + * node.
> + */
> +static const struct software_node_ref_args isp4_refs[] = {
> +	SOFTWARE_NODE_REFERENCE(&ov05c10_endpoint_node),
> +};
> +
> +/* ISP4 MIPI1 endpoint node properties table */
> +static const struct property_entry isp4_mipi1_endpoint_props[] = {
> +	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", isp4_refs),
> +	{ }
> +};
> +
> +/* ISP4 MIPI1 endpoint node definition */
> +static const struct software_node isp4_mipi1_endpoint_node = {
> +	.name = "endpoint",
> +	.parent = &isp4_port_node,
> +	.properties = isp4_mipi1_endpoint_props,
> +};
> +
> +/* I2C1 SWNODE */
> +
> +/* I2C1 camera node property table */
> +static const struct property_entry i2c1_camera_props[] = {
> +	PROPERTY_ENTRY_U32("clock-frequency", 1 * HZ_PER_MHZ),
> +	{ }
> +};
> +
> +/* I2C1 camera node definition */
> +static const struct software_node i2c1_node = {
> +	.name = "i2c1",
> +	.parent = &amd_camera_node,
> +	.properties = i2c1_camera_props,
> +};
> +
> +/* I2C1 camera node property table */
>   static const struct property_entry ov05c10_camera_props[] = {
>   	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>   	{ }
>   };
>   
> -/* Root AMD ISP OV05C10 camera node definition */
> -static const struct software_node camera_node = {
> +/* OV05C10 camera node definition */
> +static const struct software_node ov05c10_camera_node = {
>   	.name = AMDISP_OV05C10_HID,
> +	.parent = &i2c1_node,
>   	.properties = ov05c10_camera_props,
>   };
>   
>   /*
> - * AMD ISP OV05C10 Ports node definition. No properties defined for
> + * OV05C10 Ports node definition. No properties defined for
>    * ports node for OV05C10.
>    */
> -static const struct software_node ports = {
> +static const struct software_node ov05c10_ports = {
>   	.name = "ports",
> -	.parent = &camera_node,
> -};
> -
> -/*
> - * AMD ISP OV05C10 Port node definition. No properties defined for
> - * port node for OV05C10.
> - */
> -static const struct software_node port_node = {
> -	.name = "port@",
> -	.parent = &ports,
> +	.parent = &ov05c10_camera_node,
>   };
>   
>   /*
> - * Remote endpoint AMD ISP node definition. No properties defined for
> - * remote endpoint node for OV05C10.
> + * OV05C10 Port node definition.
>    */
> -static const struct software_node remote_ep_isp_node = {
> -	.name = AMDISP_OV05C10_REMOTE_EP_NAME,
> +static const struct software_node ov05c10_port_node = {
> +	.name = "port@0",
> +	.parent = &ov05c10_ports,
>   };
>   
>   /*
> - * Remote endpoint reference for isp node included in the
> - * OV05C10 endpoint.
> + * OV05C10 remote endpoint points to ISP4 MIPI1 endpoint
> + * node.
>    */
>   static const struct software_node_ref_args ov05c10_refs[] = {
> -	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
> +	SOFTWARE_NODE_REFERENCE(&isp4_mipi1_endpoint_node),
>   };
>   
>   /* OV05C10 supports one single link frequency */
>   static const u64 ov05c10_link_freqs[] = {
> -	925 * HZ_PER_MHZ,
> +	900 * HZ_PER_MHZ,
>   };
>   
>   /* OV05C10 supports only 2-lane configuration */
> @@ -110,27 +174,64 @@ static const struct property_entry ov05c10_endpoint_props[] = {
>   	{ }
>   };
>   
> -/* AMD ISP endpoint node definition */
> -static const struct software_node endpoint_node = {
> +/* OV05C10 endpoint node definition */
> +static const struct software_node ov05c10_endpoint_node = {
>   	.name = "endpoint",
> -	.parent = &port_node,
> +	.parent = &ov05c10_port_node,
>   	.properties = ov05c10_endpoint_props,
>   };
>   
>   /*
> - * AMD ISP swnode graph uses 5 nodes and also its relationship is
> - * fixed to align with the structure that v4l2 expects for successful
> - * endpoint fwnode parsing.
> + * AMD Camera swnode graph uses 10 nodes and also its relationship is
> + * fixed to align with the structure that v4l2 and i2c frameworks expects
> + * for successful parsing of fwnodes and its properties with standard names.
>    *
>    * It is only the node property_entries that will vary for each platform
>    * supporting different sensor modules.
> + *
> + * AMD ISP4 SWNODE GRAPH Structure
> + *
> + * amd_camera {
> + *  isp4 {
> + *	  ports {
> + *		  port@0 {
> + *			  isp4_mipi1_ep: endpoint {
> + *					  remote-endpoint = &OMNI5C10_ep;
> + *			  };
> + *		  };
> + *	  };
> + *  };
> + *
> + *  i2c1 {
> + *	  clock-frequency = 1 MHz;
> + *	  OMNI5C10 {
> + *		  clock-frequency = 24MHz;
> + *		  ports {
> + *			  port@0 {
> + *				  OMNI5C10_ep: endpoint {
> + *					  bus-type = 4;
> + *					  data-lanes = <1 2>;
> + *					  link-frequencies = 900MHz;
> + *					  remote-endpoint = &isp4_mipi1;
> + *				  };
> + *			  };
> + *		  };
> + *	  };
> + *	};
> + * };
> + *
>    */
> -static const struct software_node *ov05c10_nodes[] = {
> -	&camera_node,
> -	&ports,
> -	&port_node,
> -	&endpoint_node,
> -	&remote_ep_isp_node,
> +static const struct software_node *amd_isp4_nodes[] = {
> +	&amd_camera_node,
> +	&isp4_node,
> +	&isp4_ports,
> +	&isp4_port_node,
> +	&isp4_mipi1_endpoint_node,
> +	&i2c1_node,
> +	&ov05c10_camera_node,
> +	&ov05c10_ports,
> +	&ov05c10_port_node,
> +	&ov05c10_endpoint_node,
>   	NULL
>   };
>   
> @@ -140,7 +241,7 @@ static const struct amdisp_platform_info ov05c10_platform_config = {
>   		.dev_name = "ov05c10",
>   		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>   	},
> -	.swnodes = ov05c10_nodes,
> +	.swnodes = amd_isp4_nodes,
>   };
>   
>   static const struct acpi_device_id amdisp_sensor_ids[] = {
> @@ -232,7 +333,8 @@ static struct amdisp_platform *prepare_amdisp_platform(struct device *dev,
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> -	isp4_platform->board_info.swnode = src->swnodes[0];
> +	/* initialize ov05c10_camera_node */
> +	isp4_platform->board_info.swnode = src->swnodes[6];
>   
>   	return isp4_platform;
>   }
> @@ -257,6 +359,7 @@ static int amd_isp_probe(struct platform_device *pdev)
>   {
>   	const struct amdisp_platform_info *pinfo;
>   	struct amdisp_platform *isp4_platform;
> +	struct acpi_device *adev;
>   	int ret;
>   
>   	pinfo = device_get_match_data(&pdev->dev);
> @@ -274,6 +377,10 @@ static int amd_isp_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto error_unregister_sw_node;
>   
> +	adev = ACPI_COMPANION(&pdev->dev);
> +	/* initialize root amd_camera_node */
> +	adev->driver_data = (void *)pinfo->swnodes[0];
> +
>   	/* check if adapter is already registered and create i2c client instance */
>   	i2c_for_each_dev(isp4_platform, try_to_instantiate_i2c_client);
>   


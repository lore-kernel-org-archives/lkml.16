Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65A1EE02E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499514; cv=fail; b=OZKA48uVgmCeuRvYpy9utAyrBcT9uprbmtvwoeLRW2sbhvjQLDjzodc4w7VA6ytfIOwErN5qf3DznYQazEnK/uz3ITA1Hs7Vmoan2+V6iIOxn+I6+GbEovOLZXHdbOfIA6Jkw+U/ZU3rHxv/r3p7qZ/zERJo09j8VZkUi1i24CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499514; c=relaxed/simple;
	bh=vs3n4KZlnIGk43BsJ09WlODwPrW6zHt3fHwjRRBMCGI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JzwTlHhqNKDOGiQBEhfBXoiJb5IPv3Z+1vGtjmGEa4/bvbFIRfJc8mkHE7MYvbhdAOmcOyGrA9NV1Awsw1vutZY+r1RfbfW6eFxgwf0PrQ8mTbkh/CzoTSmAcazP6/45WsU3FoHmRwo01YlJZTn9orbuu2Nfz3cEmfiNNXbN9/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uGEs0cW+; arc=fail smtp.client-ip=40.107.92.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uGEs0cW+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsp8/eJWmOhCpB2atk8En4uaPvyFhXmxAYGIGm4Jro0sCwNElW8AnJieHOW4p3fizJOvnu5OYLk64gdnbiB3d3KDf3GkPEjkYugEyTYAkQBBfY58p3KWdye051NhbSUATl6rDnR8p+6PbeKdqzPc4UbZ8FYRGyi37bVxlwZCDhiirAjR7quUfLmAyIH250NWW3UNECeFL2vjHt4/Ejjmh/ETkO+BqISICQzvDHfSmdiv8G070qvp3MW3haJbhhpuybvE7l3jyqjTaGXOX6BfldEhqWLvEh5yk+8ZhjJ03+TKHUsabx4ewc0BUiNek9ZJ/I5bpOhWZFeKLPY39Gn2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiEq6J34MFEC31q2UDbw8HdRRsBxu5m3ISeps4iHHgY=;
 b=q+aZJ4fAC+HzGEreqYrBiGcZ0fR2fsyHxkdB88mks208880NFAhFrRmlZYtAMSnE8w/Tcmb/s6DUtmGGz0Hlan10dmanwpArjNnLkCa9iiCQYVYXvZkqq8yZEval8V+E64BNTV8IzaqrdVHixfYteiuqfoioJyPiczapbiM+7JcVjwxmmny+/l5B53/Xa845h7YBmdUNZ3FTKS4GJMhcOTUoO/BhbI4v3dVNlWbH8nEDGE1CXcMlpklwxxreXbbaB6m3w4aPLzz0SVLz9hhyQg4HgYbCP5QBy9tvvRloMDH85uX6Gel/uJnVFoPUyRihpl1jFaSR9V+2rrnPV10RXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiEq6J34MFEC31q2UDbw8HdRRsBxu5m3ISeps4iHHgY=;
 b=uGEs0cW+2uNEf+iSWr6O7o7yqmjcwPXXLiK5iWZiX3lKY+ACZdXsVLO2y3NVoWl7FVHvUNyYAI4ipPFArvxsc9fbkVXdE53hOiCeCWVGNL1VfWWNdFqx7MeRrWt+ya9zM0mLIyPKtW8B3HroKbYcgOf3/w8/nnoVswzD8p9rLlawevBCunCf+SvR8tt8x0AkqTzX3QAEs9KC2QwwxTYYRWrQ+VXbCK2qQDxd353gYlsXvjwnrhxGNxxKJM+c5649IXK+t+brvRxr0go7Zqh4cJ5av5+hoROco7xR8AP+Jw3llUJkA+15lGLFO0s/JNz9ufsue404e4XLZZNaYs0kfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by PH7PR12MB7115.namprd12.prod.outlook.com (2603:10b6:510:1ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 09:25:04 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 09:25:04 +0000
Message-ID: <1ff3ab3e-f631-4b4b-90a6-fb18bb6ef468@nvidia.com>
Date: Tue, 1 Apr 2025 20:24:58 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch/x86: memory_hotplug, do not bump up max_pfn for
 device private pages
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Bert Karwatzki <spasswolf@web.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20250401000752.249348-1-balbirs@nvidia.com>
 <Z-uqcSYvRD6ZPPQs@gmail.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <Z-uqcSYvRD6ZPPQs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|PH7PR12MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be829a6-611a-4bb5-8666-08dd70ff1633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkJIdGxvQUpvRnhTZTlmSHRSSlowQTk2NUY5ZWtjYys0Zk9hVzAzUW1sWGpj?=
 =?utf-8?B?U0ltQ0txNWVsblZmMlIzSGVWZ1IzbjMyRm5HN0FUWGIzTXl1aThrQUFVaVhz?=
 =?utf-8?B?TWtrdXdBcmFtQ0pVdHBtcG1HTjRGc1Vma0FDckZyeGJGNEVmMjlHRkFaQ2JS?=
 =?utf-8?B?RFQ3amhNUWp1am8wanFhQVRRSzRCSEp6RWxiM1JPY2NjK0dTd0FEZDhML1Fs?=
 =?utf-8?B?S0ZKMVdVdm9IU01kNkhrUi90Zkx3RmJKMHgzUXdUSDF4SnBYcHFwdTRCK2w1?=
 =?utf-8?B?eloxcUZzM1RLMVN0VDNIOHFOYXF2TFJsS3lmTGplS2NhSlNpVVBYeHZYcngw?=
 =?utf-8?B?bXg3WmlNaHZWd3MxQlQ4b1RJZzRXVzhTUUxub2ZvUlBDU2Z5dVlrUzB4M2Mr?=
 =?utf-8?B?Um4weFdDbEptSER4cFpzV1BXSUdjV0NRNVlYdEZjWDVFMVNoV1EyTUdYdFJz?=
 =?utf-8?B?OWNjU3l3VWwwamVRWmVsWXkvVUpzRkE2ci9JUDl1bjArUERoMnVkdllFMUV5?=
 =?utf-8?B?SWFkV2p1eDBCTThmTmVYZEFzR1BzRDVsWnJpV0hlOGNhNDlGaWRLSXdwVXVB?=
 =?utf-8?B?YTJQdDluQkdSRW5yQ0NyTUVIdFRsRGt2d2hscHZ5QTlWRWtSQ3dvMkw1QVZm?=
 =?utf-8?B?NFovYjI4Uk1seFNkblZWMnB4cHllS3RKZ3ZGT1pxQSsxVjdsdUg0cDZpYzl6?=
 =?utf-8?B?Qmx6T3lkOFZSQ0NSeDRJZ2k4cThETjgveUJWVWQ4bEZ2YjNUV3JmOHBWR045?=
 =?utf-8?B?WEhKeDMwUXJNeUZHYXR2cm9EUm1RZ3JaTDdRQmJGRW8rU3lhcTFCWUFzUTFR?=
 =?utf-8?B?UzdSZUZTRWRTREtsZmJ5QlJkSTFXTDladC9VSnRqdStuWjlta3Ntc3ZWbGFr?=
 =?utf-8?B?eE1ST2pGdEVVdmRYVDVMZy9zUlhmMk5mWE93bXhGYnVRRUZZOFl6c2dYVy9U?=
 =?utf-8?B?Y1pZZTNNbndDTWRsTmEvd0JibWJub0RxdVNhK0phVVFhOWJDeElEekFFc0lW?=
 =?utf-8?B?TGJGS0ZrK1h0TzhIYzNyaTB2M01iN1pnMnoyQ2dLT1pMWHVaTFpxc2t3UW1H?=
 =?utf-8?B?OGFHemttOEw2SHQyVGdoYVNMRmNBeDYrM3VucC9MZEZLUkFZeGZqT0lmN0px?=
 =?utf-8?B?U0w2NXpyMGo3d0V1TS9OOElKbklyR09zWlo2dGVaMXI3RnlVU2Qzcmt0OGpm?=
 =?utf-8?B?RkhZWHJJZFo3M1N4YnpuNkZNbTB3bEVKUVJzMmUvc0hrbi9WOWY1MVUwRytY?=
 =?utf-8?B?TGVDdk11Q3k3NHRDTGJwWitHbFBxWGxxZFNZMytEaUg4U2lTVkZiYy95RUF5?=
 =?utf-8?B?N3F1eklISlN6WFd6N3FHTndPTG9tdVc3Vzl1bkNUeCtERnRMR2ZGY1J5YVlp?=
 =?utf-8?B?TE5jVkIvNkgvZENuWjdvT0NWM0ZMVUgrUHlnZVh6eTVRdzU2SWhiMndvVWxV?=
 =?utf-8?B?cUQxTjRHSFpZMVpMdDI3cm93UHYwNEtNUzN3dTROaHJVT1JaV250VE1PeFA1?=
 =?utf-8?B?Njl5dTJqSzhqY1I1M0QxSEZ4VTUxVldSU2VCQkJwQzZISXVEZ0MrcUEwY3Yy?=
 =?utf-8?B?RTdndStCemswOHMvdWIxcUdYNGw4aW5nL0RGaXozRHFYeWEvZDF2NmF2Z0NY?=
 =?utf-8?B?VGRuQUE1cXlvTmNUUE1SNmFUcGVNd1djY0Z5TEx6UDR6NWlBNTV1eS9DSElx?=
 =?utf-8?B?b1R6c3JJaDhlOEg5ZHdEOGRXOUlhaFMyYzRuZEptT1Rqd3BDSjF6dzlyOGhJ?=
 =?utf-8?B?UStZRkdlRzVwa2oxNkl4RjdUUzZmclF0aXhpRFRHbitTNkljOEFrOXlUaGE1?=
 =?utf-8?B?NFB3YitPaDRtOVNYNzlaRDh1MGh4WWpwaXU0U3BQcFhZUkFTWVJxMlk0TEdN?=
 =?utf-8?Q?JcZjVO8cpujuU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7272.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djYrcnBWQ0ExbFpLS215VDFDQk9sdlhhSzFTMFpOZW81bUJRMjFOVnd4eFZx?=
 =?utf-8?B?YUl0Mlp5RjZ4djl0Z0o4bk5PbDI5dWRaenhVMHhkakhybHVRZndRdkV3QXdj?=
 =?utf-8?B?TTE0bGdLakhJOVUycmZtajhKdXQzUE1xOVZZK3BwWVYxS05sNktIdEVXUDRx?=
 =?utf-8?B?NlBkMHJvUFFNV2kvc3JyRGhjbDg2VEhtQVJCek5KdmcrbVU1clh4SnpDOWhx?=
 =?utf-8?B?cUtSYS9Va000djF4QWd2RTRSS2xhNEdIVGFORXBtb2NmN2pHUGVFSGNuaHRF?=
 =?utf-8?B?RmlrZkZhUnIyR1JtNlI3SnpMc0JIbGppTHBONzJvMG1WZEVuYUd3eVlmdm00?=
 =?utf-8?B?V3ArUWgwNkplemFKamMvVHNYQkJuTWRXVzFFRVRMZjlqVCt4bnErbVpmS1Iz?=
 =?utf-8?B?VGpEWkhXRG9YTUY2SW9aTjlUdFFBS1o2QlJ6SEZZRkhWeTN1VXhNYkxOcnZv?=
 =?utf-8?B?WEF6R1hPOW40aGV0WGJUS2xWdHkySTkvbGlRbVErejhDR2kwSUluWmVKQjlp?=
 =?utf-8?B?ZXgxczFaVjFRNGRpRGJESEo0cFV4c0dXVkJwNXBwdzJmT2x5MGhGa1hDeXh6?=
 =?utf-8?B?TTRQMUdvRFVkbzQ3cy9DL3FUR3dKQ0VpRE5wZjh4RGU4cG5INncyUDFQaXJO?=
 =?utf-8?B?bStIQkVVWERHYTJWSmU5N0NwcmRFVE9UZXBWajJvMUZReU1NRlFQdFdIL1Zv?=
 =?utf-8?B?YmFJdEFwZ1VpV2xPUXgwcTBpWWE1Yng0ZzRYL3BKVk01K2ZQbkNFRHJERDh5?=
 =?utf-8?B?bmNrL1pmZysxTk45czd5VXV4M0p6QVI4cjlNb2x5bjlhM1JhZm1NRjk3VFRW?=
 =?utf-8?B?V2tDd1I1MVgvcHJTS3VIRGQ0VFl0ajVSWFhuRzNMWWUyeU5DcWdPR01DLy9q?=
 =?utf-8?B?S1NReDgrNTNxVnAwVVpEcmk4N05Uc29qYjhJMmMzNmNUblp0NnpMaTRrTHhX?=
 =?utf-8?B?TW9QNjgweU8zN0dPOVRkemcwbWpmYkxDUG5HMFBEYjhjUTMrdU5WeTRvK2hF?=
 =?utf-8?B?RytWNUMxS25nMG1zQjV6OHlMQWJ5bWw0cXhRNm1kTVZKMDkxd0ZyVkViUlpQ?=
 =?utf-8?B?QmQ5M05HM2N3YzA2aDlEZVovdFEvaHJiZ1JNaHZxNitmSFRUMnhpQ2ZLNmli?=
 =?utf-8?B?bkRHQjE1elg5c25TeW9BdjNQdGZOZ0NGYlBWN3ZqN25obnBaTElteTFzRGdP?=
 =?utf-8?B?WjZjVTA3dHZGQlhraE9YZDlKMTRoS3M4dUpFd3hkbi80MUpnZ0NIZkdhN0lS?=
 =?utf-8?B?eVc0dTNxdHdIcUdxL25nZjR6RnROL29aNWdaSkMzMXBSSXdlTXF1NGlXZXZI?=
 =?utf-8?B?eDIxci85VG5FYWl2V0dRREd1WFZGMVBOcXQ2SmV6c0FPd2djcGZPVEtiQW5T?=
 =?utf-8?B?Q2twbVNwYWhGMkZoSXgzeHMrMlp3RkdsYW96SU84R2I5MGlnTVdMbGpFbFdk?=
 =?utf-8?B?dnVUVGpSakpOd1lLOGFmdUZPYzFuZ2lyQzJvWlJMMVVrSW9VMGplSUlKMHRM?=
 =?utf-8?B?ZlJqaXE1dnlKN01sbitiYUorTkhXenMvYVNBZXFEeGZtUFZQODZMQjRpVEhD?=
 =?utf-8?B?OXZGejJQV2E2MEV3ZGM1T25Wa0hjajljVTJGQW1MOHdRVGFmUE9qUGZNNFB6?=
 =?utf-8?B?cUVlMlpzUUtNL2FQRXVaSGRlVTkyQksyeVJHd3ZIeDNQTXRCaFdQR1QxaDVW?=
 =?utf-8?B?YjVPaUFZZWZwWW5IVkJtM1NRSjE4QjdZZUFJNGpLbTJZTzFnTG84UUF3d1d6?=
 =?utf-8?B?ZVZETFVGdFpDaWpFalNGQTZCQXpQa1Q1R295SHJ4MFJFazczWTB5dDVSZXR2?=
 =?utf-8?B?dlY1Wk1tTmU3Nk1Eb2xZUzQ0WTVEc042cG9iaFFHZFg3SFY1NEd6OVErQTkr?=
 =?utf-8?B?S3RxWnNCOTlWaTR6eTdXeHV2N0tlb3VhYjBvYnBwWU5GLzZ1bFpsb0k1L3M4?=
 =?utf-8?B?aVNDR054elM4Zngyd3I0RDFrVUl0RWVVUWk0RjMwU1plY1ljS2thQXRHby85?=
 =?utf-8?B?eWNQVzdrcW5VQitlczZLUFMrV0NOalZ5RWJwSzJwWFRQT3dSUXFrWEVPY0gy?=
 =?utf-8?B?ckFxSU9Yb21TL0RzcG4zSFgydDZyclJhaCtwUzRSOSswbU9rMGhDMGVjTFFQ?=
 =?utf-8?Q?PfU6yaMBanwpDynHUWT/1ZKZy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be829a6-611a-4bb5-8666-08dd70ff1633
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 09:25:04.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYpgLF24wnJatQICw1ad0yhAzUbYnrNns1WDwxgcbAkjhDqk1av5hy0qEIpzBmsRh5RbGxuHRR83pxpgRKIuiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7115

On 4/1/25 19:57, Ingo Molnar wrote:
> 
> * Balbir Singh <balbirs@nvidia.com> wrote:
> 
>>  arch/x86/mm/init_64.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
>> index dce60767124f..cc60b57473a4 100644
>> --- a/arch/x86/mm/init_64.c
>> +++ b/arch/x86/mm/init_64.c
>> @@ -970,9 +970,18 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>>  	ret = __add_pages(nid, start_pfn, nr_pages, params);
>>  	WARN_ON_ONCE(ret);
>>  
>> -	/* update max_pfn, max_low_pfn and high_memory */
>> -	update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
>> -				  nr_pages << PAGE_SHIFT);
>> +	/*
>> +	 * add_pages() is called by memremap_pages() for adding device private
>> +	 * pages. Do not bump up max_pfn in the device private path. max_pfn
>> +	 * changes affect dma_addressing_limited. dma_addressing_limited
>> +	 * returning true when max_pfn is the device's addressable memory,
>> +	 * can force device drivers to use bounce buffers and impact their
>> +	 * performance
>> +	 */
>> +	if (!params->pgmap)
>> +		/* update max_pfn, max_low_pfn and high_memory */
>> +		update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
>> +					  nr_pages << PAGE_SHIFT);
> 
> So given that device private pages are not supposed to be mapped 
> directly, not including these PFNs in max_pfn absolutely sounds like 
> the correct fix to me.
> 
> But wouldn't the abnormally high max_pfn also cause us to create a too 
> large direct mapping to cover it, or does something save us there? Such 
> an overly large mapping would increase kernel page table size rather 
> substantially on non-gbpages systems, AFAICS.
> 
> Say we create a 16TB mapping on a 16GB system - 1024x larger: to map 16 
> TB with largepages requires 8,388,608 largepage mappings (!), which 
> with 8-byte page table entries takes up ~64MB of unswappable RAM. (!!)
> 
> Is my math off, or am I misunderstanding something here?
> 

That is a valid point, but that is only if we cover all of the max_pfn
with direct mapping (I can't seem to remember if we do so with sparsemem)

> Anyway, I've applied your fix to tip:x86/urgent with a few edits to the 
> comments and the changelog, but I've also expanded the Cc: list of the 
> commit liberally, in hope of getting more reviews for this fix. :-)
> 


Thanks and I'd like to get broader testing as well. I am also inclined to
send an RFC to add a WARN_ON_ONCE() if dma_addressing_limited returns
true for 64 bit systems, not sure if the DMA folks would be inclined and
how often it really happens on existing systems.

Balbir Singh



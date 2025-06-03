Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F51F235041
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957923; cv=fail; b=Lz1lg/45ZO03bxinTiMH6zXTIDwOCyfWAjtIdWvlzlLCd0Rqm2YFnwbCaRU17M5B3VDAGidOABl3vcTZqdGDeIrNa5K6Svp38/qbeCSKS+cq6tDVxrlNCPQS4ib6CmmHryseDMZL7d2Wm2iY81eq1dx1Paw0wnWhtp1/Qa+nGMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957923; c=relaxed/simple;
	bh=j82EuV+nkEF+ojfogsqKF/ZF9BpQn3/CmN64PolvRLM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bn8+D+ASyQgf97DsDKZtGw1yIBc85Spxkg4r/QVV0xlrH272W/mXqotvxtRO2yHuolMmLyObGL8oPU3hKqDi6xg0BruEjXIRcHgj2d/4Gg8ob1bf4ig4eLk9Q7VUjw8pMznQJLq6W3nyMllkOirrkIkEP1rHotQG5GAqbl94m+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SFBb9cC4; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SFBb9cC4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwcG456PwuLf+Ed04fzxDCsBmH+MvxKhaLOuBYOjExFFn9fHxFsJNRqnNxLH/LgwbrO8TWCn4LiVBYCokeJwNUvQkkudLg4FaKaWStQz6f8zPsJuNP7gDihgZhLuQ+AVRfAejSxJb7rW1x9riMQfpSiRIwQ7ukZzhsemMY18+AnuxZxec4vMHJOqFJmp9GjEku0tbZkStXlxyuQbuIJU4hdaPGxVOScUxn6ytZoUmNCIERPeGSRK3hWqZB5bVEmofMjI5Rn45WGRKO/uflotf9aQ2C10AL7r1JFDtpv2yuGaIaknYaDGP3NhGlGquiTxSn2mR40/knbXf0hx1CJDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQXLRpL7hkJbIxLiywQ6dVBy22ySZm4IYMQfQVvkwuQ=;
 b=cmFQRgeQq34fUHZWI1Be8YIyvjCVda3rnBPGI/PaidkRORwH8YgpvO+XTt6+P7S3eY90c8VLirE30dS2QiWOlH5/e4qIP9hr9CbJdp2BubPFIk5/gxbH+KxPpiQahYuPGyYSoD4XAosfmsUTNdPrBzN6U2V+acwKUoW0eMdixuufqLaez9cgSKaQzR6/saTzTsM6Re/CPmkBk4jeWzGWW9mC2wO5e3oRjBpPbR5GC4RDOGK4AynuFo3SezxAn14viT5mGKp+sluI255MF90cKRdj02ZqumHEvTC5DmH1X2XFlmlxkvTDWHEgVZ4QrXw7QwYhlsk1NH/Ntce9FhbOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQXLRpL7hkJbIxLiywQ6dVBy22ySZm4IYMQfQVvkwuQ=;
 b=SFBb9cC45SLDN0VEaveOvls9whqBr7XIxfi0zF+/WrhLOpUNc2xYwupYQ5z1lo5PaJ14JSt8NrK4VjemUO1IPLogqFoI/oKjODyPy4pFz98PzH03B42a1v+dghgEgwwBnAiytqRCIROsNYm54N6WHfyN6xemdvKNX4GmPhtDBaMhVyAUriVP6Ao9jZAnCrLgab2Ytx0b7DdvLp9EtOW8FP2VnAsVBQALgTz1zOAQjw2kNIGN5UqDCIqnbnrY7KnqZ069PwmUgr+baD6g2R7GkAjy2N9hwr1BVEc2SB/NNeTcsY1CGvNtGgLOGkX9ZZW6M1wxk8RBek5yFVetZyjgSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB8082.namprd12.prod.outlook.com (2603:10b6:8:e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 13:38:38 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 13:38:38 +0000
Message-ID: <63fed4b9-1c04-49ac-b4c9-f1e5359d8550@nvidia.com>
Date: Tue, 3 Jun 2025 09:38:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] sched: Add support to pick functions to take rf
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-2-joelagnelf@nvidia.com>
 <aD48Zq2FdYlBJAk2@slm.duckdns.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aD48Zq2FdYlBJAk2@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR02CA0037.namprd02.prod.outlook.com
 (2603:10b6:408:e5::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c5621b-269c-41be-5da6-08dda2a3f203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjBXS0tFSGo0NXR5UmFFVUNEa3hQNE9TTE9SWUpidHFGNXl0Vm84WFd5VTBQ?=
 =?utf-8?B?aDRkdUM1bmtHZGF2Y01vMmliQVoxbkQvMGk3WkRpUUFxdHNLaVhFK0ppYzRr?=
 =?utf-8?B?RDBjZTVSUVI5MFJkZVl6TnBrNXhJeVJmWUI3cmFCbWM1cUpreG1NbXAxUEdS?=
 =?utf-8?B?MHJiK2ZHMW5DaElSOVNKUTA1MEZ6Mks4bURobHlBMTJJTDA4OTZYaXFEQUtU?=
 =?utf-8?B?dzMrSVB3SUs2ZFVuRnNuaStHZm1HVGprYnVuVWNSMGozcElyUWtYTHlDczY1?=
 =?utf-8?B?aCsrS2h0SXNUcTV4eE5Gc0xOaytOOEdsNG5PUkpxZnJJaXpHUDJ6K05VMTVx?=
 =?utf-8?B?aFNEQnAwQ3ZjWkw1TFo4NUp5RW43dXh0OEJHT1FFbzN6TlFUbGRxbkNiT0dH?=
 =?utf-8?B?eW10SytlcncrWmRRWEMyeitIMjlrQk43Z0dSdjRjRWMzT2pTdkhWMjErT1VL?=
 =?utf-8?B?bWJVV3R0NkdCN3RCTU1MRWZKWWlKUUNFUnUzTnRzUmhuRkprY3RaQkpscksz?=
 =?utf-8?B?czFsemxDVk5hVjcrZy9RdHNsNkk4Z3NKSnFnUFRHai8vcFJxV3gvbTBrS3ZY?=
 =?utf-8?B?MGIrYm9mTzh1aitUbHpuN1NNMXVubFB3dHdyTzhjNkhBUDJaQ0JySXpmN3Ey?=
 =?utf-8?B?MlFwNGJXcERqYy9CYS93TXJ2d1FoZnV5Q2RaM0tCWkloODR0NHRHaFBBaEtn?=
 =?utf-8?B?OEdmR3FsYmJwVzVKZWxPOTQyT3R0bC9rUzVQbGp1d3M1TTduTytOWVNYSXln?=
 =?utf-8?B?QUUwTS90dVJnNFRxK0NRN0V4Zy9PQTgvWDNPTndsZThyZG9VeU1WemVaNm93?=
 =?utf-8?B?dVZQcHZacTJkMTBJb3gwR3RRYVBKVDhJZHArci9CajRTRC9qZWJTNytkeXNk?=
 =?utf-8?B?R3JKR2I1cUhia2RQYnEwRFB0cWJLNkZyOE1IK1hGVkZ3d1JNdUFCakVTUmlT?=
 =?utf-8?B?UHZodGdOaGpRMkV4a3VKbE8wbnFUZncwVG9XT0drRGpIQ1hJVk9BTVA2bEFy?=
 =?utf-8?B?R0RSMTR6T0lnMi9wNmNxbWQ2czBSUHhyZ2FHWmJVRkQ2eGtDMDdJcHlIeGMx?=
 =?utf-8?B?S2o4cFNNbTV6V2hOUG5qWnBoMzM4T2JSaXRCMVpoR1NZWkhWMDQ3cEhYK05k?=
 =?utf-8?B?VkZBNlFydDZHNFZiSEh1OXdKSnl0aHhiN1pWakkxd3Z2ZXZleHdvUTR3VVho?=
 =?utf-8?B?aGhUWkR0UUJianp2cGh5TWpUS3U2VTU2L2ljTEx0dk5Wd1VFSTA5OGpKQjYy?=
 =?utf-8?B?TnBuN0ljcnpWUDlKZjlJNnUweUMzWWFYcHhYRUhlRzR2ZkN0YnY2eWd5VHdB?=
 =?utf-8?B?K1J5RnY5WWtCQm9zV3FTVElodnlic0dzOE02MkxJQWYwbWxqTmM1RHJReFlW?=
 =?utf-8?B?aGFCUE12blFlNS9EVnNTVEJLOVVpK2Rkd2N6WFlsU1NHbGNuYmtDUWRpRmtq?=
 =?utf-8?B?bjBCZjNtVDEyMEZhWTM4ZFBSVk1weUx0NXo2d3JLU0J6Q2JKVTJIaG9FdS8v?=
 =?utf-8?B?Ny8zNkhVQW52eXBIS3lVR2NjQnZOMEkvN3Y3aGIrWXRUWGhINEtrRFQ2OW5p?=
 =?utf-8?B?WFJPcFRqazU1S1dzR1J0cE5XL0t6T0d0ZFJKS3lCK3NyN0xhdnExdVViZi9T?=
 =?utf-8?B?K2JrLzAwbmY2RjkxMXI5bWkwU21YaXdXOCtOSEdFZ2RsZDJTSGk3UnptWmNo?=
 =?utf-8?B?b3E4MVRqZGRieE1GdTZ3L1lDN3M2U3BOMHNrK1VCeTZ6b1A3ckducTVUR1E0?=
 =?utf-8?B?WFdUZmp3b3gzMnNBT3JxaVd2MmtQRTc4d3ZjdUZ4cU1SUU0zaCtQOTA1eGRr?=
 =?utf-8?B?YnhPNW5jbDcra3Z5TGg2NVRVVGdrU1pSakNmcm1KM1hBRDlyN0doUVduWmdm?=
 =?utf-8?B?K2J2Y2JGa1d5VEMvZnhkVjQ3RkxybzVUN2x6V3VvMGZ5NUFxalBrbGJ4VFlv?=
 =?utf-8?Q?/RqosBjV/2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmFTM0VQWTdCT1I3QWE2cE1ySjd3RW5EbDZVMWFtaDF4RWtTU2ZNeXRZRmJS?=
 =?utf-8?B?T0tPSERDaklVQWcycG5oYy9pdW1uYTlER2QrN3JnMzdGVmFidmxHaVJLYTBk?=
 =?utf-8?B?R2Y1aGlLa0JGVXB6SnhyUHpwdm9XSThYczVqNm9vaXlDRmZCVklQOEpaKy9L?=
 =?utf-8?B?SitpMitaUDVFTEZQRlJiNitKVVVPSVJDK3B4azJmT1dnS1B1MnJOUEQ2VFQ3?=
 =?utf-8?B?NDFKUFNtaHpvOFk0YkV5U1J2bVZSczZQYWJhNzU1YWRBZ05PUnRQSGxTSTls?=
 =?utf-8?B?d2IzRzlSbnZRUzVoWVZhTEh6U2hOTWpCQVJLZU50T2hLT2ozQlZOcGlWZVoz?=
 =?utf-8?B?cy8wOFJLSitJU0MrMG1RSk8zb09nOVV5RExsckpFK2FidUFzbGk2UXVtSWMy?=
 =?utf-8?B?QThGV0dKT1NwQm94aE4yQ2FOOENUV2JhRkovMFVMa1F6UGN3TmpHMmVJUVJz?=
 =?utf-8?B?cTdqbnFoMnJLbE5TV3Z3YnE2U2ZCQ3daTUtycm16U3FyaC9mZllSaFRCMjVZ?=
 =?utf-8?B?eVpTV2NuRVU1UysyU2tVUDdmQytKc2pqelRVWlZIUXk5TWJrYkNLZGFwaFdB?=
 =?utf-8?B?bGNod2VxS1RhaDNtcFVYL1hacTRaUkhoV2VnalNEVzBoVElBTExLWUtXUFI2?=
 =?utf-8?B?U0VyKzZLQ3BibjJEcCtOT2F1MW03b3IwTEJvVXpEdkxEREx6WVcvbi9iRUhM?=
 =?utf-8?B?MEtKUTZnTHJWd211bVpEVjI4d0lKaHVmQk5PcVU4SFJWSHFSakcvTDhKVi93?=
 =?utf-8?B?K1F0Um1OZG1EeWNjTXpjSWZwNnNpVWRXYWN2VXRSWFNoWkowMklYQlpyUVlq?=
 =?utf-8?B?OHJuQTFLYzVDRE1DektqV08wS2NpeWVCcnZUYjZtNWpvRGttOTBrQ0tZNWhR?=
 =?utf-8?B?RGNBaFZMbmIwam1HTklxWFArci9aTEJBUGpOL201d0l1NzJjaDZJVjJPWXhQ?=
 =?utf-8?B?d2dsS2lVZXhIdERRNzA4Z0VjT2Y0Zi9EV3I3ZXZZQXhGU1gzL0h2b2V3M04w?=
 =?utf-8?B?RWVMZGo0b0k3WjVVVXhTUkdhdDZqRThUMStFWk5BNHdEN3lFVWlpUU9zYkY0?=
 =?utf-8?B?bCtWTi82Y1FkMVYzK1I3WitDTTYwc21QRVVFTkhmMGc1dVcvcXA1NWNXSXYv?=
 =?utf-8?B?SDBSTnVlU0xPaXZ3SW1obFJ3R3Q5SzNISDVEdjRYOHJlZHVoTDErcHhjWXp2?=
 =?utf-8?B?RWJhbFQvNlJQOEdFU1ltajRONFhJUmN3N2NqYjFEZ2cxcFVobE5SZGRPeWNJ?=
 =?utf-8?B?K3BCK3pLRm9EUDMzUHZzU2RvQ2ZCeGFFWjhJelQrZlN2clVidDI3aFd2T3lk?=
 =?utf-8?B?aUt3QzVYa0FqTDN0dkJURWFnekFrSHNKbE9LL3hFb05ZRkNBbmZZSzg2SUZq?=
 =?utf-8?B?eS9JWXRmQkFhc25CRlUwdmJpeXc2eGRMTmF0ZUxlamRBSnFLUVNYOXhHaVM0?=
 =?utf-8?B?SDhJR2t0R2NpN3ZGSlE5M1JSeHkxQWx3YzdoZXdBZUZKeUlXT21uWkZRd0lk?=
 =?utf-8?B?U0NPdVRzUVJMdnE0YUtZSllHYmhJMEVBREJXOTVrdHVvaUlrZ2VYMjJCQVMr?=
 =?utf-8?B?Z0NwNjBGQWVROGJHZlh2NThHOFh5cXk2MS9hT2ttR2Z2by9QMHM2YnpnK2lv?=
 =?utf-8?B?SkhwdkV4WGNNSHprbHFHWmUxc3I1Z2pCT2ZuU2w1M1dZWmcwMEtzSjFsa05L?=
 =?utf-8?B?NVlPV281cHVYT3NacmJ6VmgxeTFlcE05Y0liVWlrN0ZKRGRXR2RQMm5HQUk1?=
 =?utf-8?B?aXFERWZrSUlNZGdPZzlZU0lNREo2ampMNkVvMUl5RUtpVjBuYjRjcFdyNngr?=
 =?utf-8?B?WVMyNlJ5K21VSmVxOVBxWktKVS9WTVFLaVJpeWd0dUtYbHAySFE4ZWljcHht?=
 =?utf-8?B?R1RRYytDeDZCWThkREJITUtvN1pzNy81aWZWUGJyTmVuRVhyR2xPamJ5VEFR?=
 =?utf-8?B?R2FWWUoyNjdLMjZncVRUZU8rcWEzSVQ5bEl0Z2k0KzlvQW54T2hBVUVzMEhm?=
 =?utf-8?B?dUVuQUpEcTErNGNHc2EwRkZ5a0RpRlZCRmpOV1laTmJZNVQvMGFBRVJTUExy?=
 =?utf-8?B?cVZQOXBaUitqblFNOVM4WFJNc2pDY051TGxqS0JodGRyL3V2djhndFdmRTd3?=
 =?utf-8?Q?w3yPlcMtX9YoFvQ1nf0km2aEf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c5621b-269c-41be-5da6-08dda2a3f203
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 13:38:38.2022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKZejr5kvl3aTOidlsQr/1iLI05DVsIqh+yXPx6B0GE/WBa8rko4wk00uQwXadMqJovEDSxOzCiZCNm1ibcL9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8082

On 6/2/2025 8:05 PM, Tejun Heo wrote:
> Hello,
> 
> On Mon, Jun 02, 2025 at 02:00:57PM -0400, Joel Fernandes wrote:
>> Some pick functions like the internal pick_next_task_fair() already take
>> rf but some others dont. We need this for scx's server pick function.
>> Prepare for this by having pick functions accept it.
> 
> Hmm.. after the whole patch series is applied, pick_task_scx() still doesn't
> seem to use @rf. What am I missing?
I need it for scx *server*'s pick_task, i.e. ext_server_pick_task().

Sure we're not using it in pick_task_scx(), but I added it there for consistency
since pick_task_dl() needs it, due to ext_server_pick_task() needing it.

Thanks.


Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEDF215772;
	Thu,  8 May 2025 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745235; cv=fail; b=foyjT5kmkU32+Pa09EeugE24mnc1KHcgoyVtp+GEKDbgM3fQw9hifmLr6amVmSOu99roVvjeGVHnkB8aA291t8e42PEqIlPR5b71In57Lj3637JEfohKfQhUjNzrA8vrnDKAxDVXM6C05XSeTK6TH79Bxb2yMFeSUWtP8pb3AFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745235; c=relaxed/simple;
	bh=sGDk2A7cIZGjsfZBZGH6HEVDkwhMakeJhqkOlvjI5Rw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Khffb0wEmgjr/hYwjE3rM7NXgOpdU+lpGrzAu6FvdzDi1FzKeiX73r0488WmJdoiqHhmHeP/IKolL7S6cttnn0KaOUekn5pW9iKal/X5pbquIk4VjgZkDZlZnYZ5Fj/YZEovl1O2lqIiRUYew2JD16IVHypXnpgAMjyzBj8204Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pzSiBcAL; arc=fail smtp.client-ip=40.107.220.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pzSiBcAL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYhxLVlRyh8tQmFbNwYqvdWBE365ZTFtY1Mpa5pIgxhMHqCNFkR2Uhi6GtnQfxCO/c4iVZomOkW3pubb0dRrs7ONqlrSSlcDRQW2s7IVvqO6xTznr9QQBXvWoBSIiHtYjakITg0xnfxdtoDC0bRo6qF6LvKKX9md42tcaoXuYj+ucQaMESvGEADWq60HrmVKa2vLo8c8vAQYpGOpnCt+mUToYrVmk5cweofpapI7L7aprQvzf83a/7pl7cQj70DaJ2fes0WtB4J/TuwZeAnUjPQ5vCnYHtahTSB8kM89K8lAgFCweMnD2ShM7TG3o4n/5DKGz9W0SHwFdJZoXhCKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/4uJ//RXeI1VXlj3vH2+hyRvmshYiHldX+gnmaEkWI=;
 b=y/QSYatitWxXlxr5oML1nhFSYLLS/lTL1D9sPhlIT9oo7dFs7zAVRTrLBk357kZex5sicECDn318q8E8BV7KN+HG2ZVNOkYEhMMRglkL4R6tfMWTikvb14UYo268CmO0A2iwPkbQ/2xPP0ijjbjbQdHXmYqjKlNGJ0W6CNdcixefWJwPo8ADZ3TmtrP+RivIglof7avfYiiWsssZAL6zv3jQG+GfY3Y+UsSs4oMJMgxULtFI3xdzGOJM8thckoQB8uaNZ7yXpn6ju5/uqB8bYn9e1TQuJsRvw7YXeVW7wiS9npmh5vdHs/1WGz3eQTAh1hZTthjpB79wdLyj5LTgzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/4uJ//RXeI1VXlj3vH2+hyRvmshYiHldX+gnmaEkWI=;
 b=pzSiBcALQnoq4+Xv2yDafibwqWctXvHy9bfeiQTD9s08sEqOozp/qRfo6sRU9k+c7RsSuCzeDU2lUbSZcMkve3UFEoo3VWtjr8fbZII2339TLmBB35FRc8CIkwgbL9Zbx1sGK/CmExid2CsatKqHt9jUUsrSNVTYb/PtlOarhPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.21; Thu, 8 May 2025 23:00:27 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8678.028; Thu, 8 May 2025
 23:00:26 +0000
Message-ID: <07898a21-2e8f-4413-90a1-076460cd55b8@amd.com>
Date: Thu, 8 May 2025 19:00:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ilya K <me@0upti.me>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <9061d5a7-c1f6-47ad-b60a-226e48021d62@0upti.me>
 <21c9d764-4945-4837-93dc-ab58f22f8668@linux.intel.com>
 <019c9a4d-f8e5-4345-95df-255a04e5c34e@amd.com>
 <c98e9dd5-69e1-0a20-dcc7-f9f7fa40762a@linux.intel.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <c98e9dd5-69e1-0a20-dcc7-f9f7fa40762a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0311.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::14) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: 9860ee63-df2d-4778-626d-08dd8e841f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZG4yU2VWR0hEMUJnejFZa1FmVytFMU1hNUtBUjNzajU1aHp3WmowbGk2VHZK?=
 =?utf-8?B?SUFnamtpTGloR2ErTnhicXRTTHJUMVpEb1ZKNDFTMEFCNE9VQXdtNDFJdnVM?=
 =?utf-8?B?bzQzcm5WZXR6NFJUQ3dGRTkvMm9xenF0amFZRkpCWG9pK3hRekFWZ2VuaHNt?=
 =?utf-8?B?U3ZyK2YvOGtlZkovM2ZxR3RKU3hRTzdxOXVNQTQ2OEVzY1JGeVlBZFBURlZD?=
 =?utf-8?B?UEt5V3NLekg4VjFMOVB1aStzY1hTSk9PcXVuNkpYak53YndiT05YQTBCdmtQ?=
 =?utf-8?B?NzloczQ4NDlNK21jOWRDUko5Uld4eXN2cVI3SGEvd0tIRWVVejBDWnFkckZW?=
 =?utf-8?B?OUxmNjEyNEc5R1Z6a3R0SktvcTFOMzZvQU9qUjJBd3ZjL1FnVzB0Nkh0TTNH?=
 =?utf-8?B?K0xPQjlkMkYwZmFCQjB3Ty91MThTUk5XbUZtV2FLWjVnV25KUUlFWXhoblpR?=
 =?utf-8?B?eDBtWENyTVZCOEpvR1l2VjlCOXhKQW44MzZWVGxKRTZFVkFCNS9rMUdNUWJZ?=
 =?utf-8?B?Q3ZxZ0tqQlFtNWl1NmsyMFV5QmFhMVFLdlRlQzBzcDBiOWF5MEExRUZ0Yzhw?=
 =?utf-8?B?L3B4M0R2K1IrR29ndVZncGRZM1FvaFlIbVVhUFBPU0ZOeFl5NDd4TkRIamhp?=
 =?utf-8?B?NE1zVlViSm5KTm92WGFRbFRqQ3pvQVhvWDBXSDRkLzNjN0o5M010Z1NLR0lm?=
 =?utf-8?B?RHQ5Q3c5SFVEeTl3SUxzMXg2MjhmVnJjN01tcTlaMmNtZytpb2kxSFBsdVlw?=
 =?utf-8?B?V0FCZGlqTURQQ1M0SGZtamJldkJkMzdBZVJYbGV0MmR5MmRza21qdnhXUHVH?=
 =?utf-8?B?ZFZtUUhURnZ6QVh4aFlSVWZldXpjTFRTbFZ2UExXbW00TG9TWExGVWtTMUtR?=
 =?utf-8?B?U1BpajZyWUZxNmhxVStxVkVLY1BGMk5rUGFkT3BYekVadTdMOWczU1JoenNs?=
 =?utf-8?B?SU15azdQd2JvcEVjYmRGMlFkK3J3Qi9ReFZGVjVYNGIvS3BxOENFMDZIUzhn?=
 =?utf-8?B?bTYzVXh4QW5aTEhrZzhPSktoTWN3d3IrMFFnckYwTWVFYjJncVdiWjlmYnhj?=
 =?utf-8?B?R1Y1eUwvOGRMSkdFblRuSm9nQmNCQStvNmt5c0Q5cWpiYW5Ba3M4Zm9NdUQ4?=
 =?utf-8?B?N0orTVlZaXRnVTRQMUoyRW1Bb1h6ZWhhU0kwcGsvakNJUUVCZzE0UHJYNzFC?=
 =?utf-8?B?TEhTbkYrNGVXTEhoTXNOZ2Q4clRYUlZFTXlYSmpGeW5TcWxLbHA5Q0x3VVVS?=
 =?utf-8?B?MkZkdENIaGMzQ0l1SFBiSmhpcTA4bE1yTmxIVkg3RjYybWZCTWZSTk45dW9K?=
 =?utf-8?B?NTR2MUtJOXFJeHhCa3EycFlTMkc4dzhaOGtaazlWQzRzY0I5ME5zaVA0T0pl?=
 =?utf-8?B?NnV2UWJaZjBSb0dPdXY0SmU3a1RydXROalMxMmFSa1RyYkloQm1PS0FWSlpD?=
 =?utf-8?B?UmVja3ZPVitFeFhmbXhFNWdhbDRTNkxEOVB1SnFlSmpyQmpBVUZxMXdzRVJJ?=
 =?utf-8?B?M0d0ZGZuWGxZMGFkNllxWkVuZUErM0RiaTE1YmZqTXFOcnJSSit1TGlFU2JO?=
 =?utf-8?B?MUlrNTdnQ0JRd0RHMG1xcS9PbnRlUjJVNEd6NzhzREdHLzRQSzdDbmdaMjFM?=
 =?utf-8?B?OHduYk40dWs4eXhnbncvSC85cUVQdjF2VU9UbXpMMlpDV29LRGNDdGJYM281?=
 =?utf-8?B?cTQ1a21wcE03UlN6WldvdUJqWGswaGVRbll1TDA5ZFIyVEk5dm9zUkdPQ2Zi?=
 =?utf-8?B?Z3VQbTdadnZQdEQzK1NYM2NhOGV2bFFTZUxRYytvMnRDK3U3NFI5cHgyeXd4?=
 =?utf-8?B?K08yOWZoczVHM0tRbW5HTGRFVHlTc3U2NzNjU2oxTUtvTUtwQ3FvSlk1OVRT?=
 =?utf-8?B?Q1NCdVBhaFJiZnpheGF5RnJaYzVIaE14RmY5UFdzd0hQN2lBOUJMQkRMdlJk?=
 =?utf-8?Q?RjNQuvi0U8U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmthWGJaWTRZVFZmWW5PWEs3QThnaEFnL05hVGoyU1lRdm93L0p5U3JTQXAr?=
 =?utf-8?B?aWx6N2JrWlpQRkFGa2wwQk0rc1d1Z1Y4WlIxV3NXbHp5TDdYZUwzblNEa0sy?=
 =?utf-8?B?ekFFVGZmVzRsQ3JwajM1eUxrZStqNWErdHRxcFlnTFVvRFFRTFBKMTdNMnR6?=
 =?utf-8?B?TStaWFR5dUJ2MW01eTB5VzNUUGZWN1RwNmkyVFVJT0g0anM1UG1SdDBmZDFj?=
 =?utf-8?B?eXdJRkoyN2xsK3BsRVdqV0pPblBTYTNtemkxdXRZUnpjS2d4MWNRUWoyV1ZU?=
 =?utf-8?B?Tnc1UkNuMldTemdaUGEyektiYzNJMTNaUDh6aHlKYjFpaVJzWW56Yk4xbW5B?=
 =?utf-8?B?eUYwVEZjWkZBOGx4L241UUs4eTZPY1JoSWVVOC9GQ0pmTjFvNmF1UjZsNGdT?=
 =?utf-8?B?eis4bXdWemJxTzhWUlVJbnNQY25pbi9nQk9oOFBkUmlNbmQ1bDEzelVmam96?=
 =?utf-8?B?N2REWE5WSmNwUFphdmYzb3pIVFBUeGFldlJXK3JCSjNQanR4by9OLy8wN1dz?=
 =?utf-8?B?aDIwS253aExJNk5JMTNwRUpzQ2dkdDZDVWV4cHY0MmhwQlZBZ0RBTFNmWnlG?=
 =?utf-8?B?c2VMeThaOVdIYm9OVWlyZ1Uvem1PdXR0cEcxZHI4ZDB1dEdvc0FOVndZVjAx?=
 =?utf-8?B?TnJkaE9FZGlKT1dFWGRRTFFSTnpCSG5RQVBBLzkzYWZ6a09aLzE2NkthV3c2?=
 =?utf-8?B?cFhJWVEwU0duUktNRnkvRlZpQjVPNndKZ2NxNHZ3ejRYMmNONVdxeTVTQjZU?=
 =?utf-8?B?U0Y3T3ZQSDVKMVRNNThmVllDWTRzWmxERmpqT2lGUi9PWVp4MkUzM1ZvTkwv?=
 =?utf-8?B?L1c0ZFJrK0U3UHdtZVhhQlNYMlh0a0JyTlJNTnByZXd2RjJ6MnFxQUZXeTdz?=
 =?utf-8?B?M0kybk9kbG1Oa2gwNEtHanpYZWZHOWVWS3NVckwvaTdkZGtKVmhRSXlvWUF5?=
 =?utf-8?B?cG41blBFRnZFTVlJN0JMUmtoOCtkSXYzTXBmaWFpYS9qc1R2dDJLYVVKN2NT?=
 =?utf-8?B?SkU4SnRDbVJaOWdmQ21ld0FNaSs5RFpEMXZMa1NRMFQyMXJ2c1dpU1pkQmFn?=
 =?utf-8?B?cWQ3YWYzQTZVNExGaHBZWGpFRjg0b2Y2TndkcU8xakFjR2t5UGtiMXMySUlJ?=
 =?utf-8?B?TVE4TXpWQlVKR1k2dk1jY0pvU09TZWVINnhXZ0lkbzhWSzFERCtxOExtRXZj?=
 =?utf-8?B?cU56c2pXR1Z5ZGh5TC9aRWQvL1lSQUtzZ1hrelZlRjVHWVFOQXFpbUUyQ1J5?=
 =?utf-8?B?cVJ4Zm1YZFBvNW9oY0tjdDlpTTZrd3BnUk5iYW1nSzJlQ3kxWHBKTEtaVDJp?=
 =?utf-8?B?RG9ZVk1EbjQzWVdDUzNuVXMwQTZJUHppdVhYWUlWNHlMTm5RWXV5K1ZrMGJs?=
 =?utf-8?B?dWxNa3hzSEpkOVpOMGwzOEZSYlYyQ0t6WUh0dWtGR1N6Tis1ZXhzcFBTTVAx?=
 =?utf-8?B?UW9nRjAvU2pSek1tMG9BQlhUS0Y0R2NtNTYxSy9vZnNoLy9SZ2dpTnU2ZW4z?=
 =?utf-8?B?RjVVMHJWcHpWVjB1R3F1bUcxdWxhTkhxZmNRVDFrSW1tc014a1ZrVXdkNTRq?=
 =?utf-8?B?QWpES0I5UkwvTGtJWVM0WTZNZmZ1RmdadkpsUjhNM3lXUFpqdXlYMUs2cEJw?=
 =?utf-8?B?a0FTM3ZJTDFKSTZkenlYdmd6clpNbUo1OUdyZnQwSDRvOXhySmJZUElHWXd1?=
 =?utf-8?B?bmRtaFREZGc0K0MwS2NyWCtTUWh0ejcrbmIxdk5PY01uU3dLRExUQS9TMWhv?=
 =?utf-8?B?MVJUSU5vMjErTGV6MXZIQmU5ejBncjBvRVlRNk8wNmVYWXd0VWFnUEJsbXkx?=
 =?utf-8?B?WCszWE9pb1NtTjRKdVZzeDJjRXpNWklNcWthanFaYS9EOVl5a09MaUwvZDlm?=
 =?utf-8?B?YkRET0JzZ1YxWjZGUDlYR1p0Y0NsVVdjQTZNdXBua0oxaXkwS0ZaekNIbGVJ?=
 =?utf-8?B?akJqUjlKTENSZlZjNlJiZlRKS210QU9NZ3ZlMU03MzFlMmlCc1VLRy9lNVdF?=
 =?utf-8?B?OFFGYXdRbEE2b2lyemJ3N2lPa2xINzh0SVZIeTExalBYUTUyZS9VQ2ZuRDUx?=
 =?utf-8?B?VmUrWEFuSnR0T2RKOHFkNWZ0RmxsV0dBUWx2QzhQdDBNRFFqLzJKLzNiNDkv?=
 =?utf-8?Q?Xn/y/CHImeoiSVTyRgCx67cpB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9860ee63-df2d-4778-626d-08dd8e841f1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 23:00:26.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGZfyvImH1DHKmTnGQr2NAC2gTgEN1UkYYF1OKICm71pVh/9/0WjIhIXlhZrOPIZWvGLWoPgieZedGgbTkesAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330

Hi Ilpo,

On 5/8/2025 4:52 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, 7 May 2025, Nirujogi, Pratap wrote:
>> On 5/6/2025 8:53 AM, Ilpo Järvinen wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Tue, 6 May 2025, Ilya K wrote:
>>>
>>>>> +#define AMDISP_OV05C10_I2C_ADDR            0x10
>>>>> +#define AMDISP_OV05C10_PLAT_NAME   "amdisp_ov05c10_platform"
>>>>> +#define AMDISP_OV05C10_HID         "OMNI5C10"
>>>>> +#define AMDISP_OV05C10_REMOTE_EP_NAME      "ov05c10_isp_4_1_1"
>>>>> +#define AMD_ISP_PLAT_DRV_NAME              "amd-isp4"
>>>>
>>>> Hey folks, I know v12 might be a bit too late for this one, but I've got
>>>> another device here (Asus GZ302EA tablet) with a very similar camera
>>>> setup, but a different sensor (OV13B10), and it looks like this driver
>>>> just assumes a certain hardcoded configuration... I wonder if it makes
>>>> sense to reorganize the code so that more sensor configurations can be
>>>> added without making a separate module? I'd be happy to help with
>>>> refactoring/testing/etc, if people are interested.
>>>
>>> v12 is not too late, and besides, v9..v12 has happened within 5 days
>>> which is rather short time (hint to the submitter that there's no need
>>> to burn patch series version numbers at that speed :-)).
>>>
>>> I'll give folks some time to sort this out if you need to add e.g., some
>>> driver_data instead.
>>>
>>> --
>>>    i.
>>>
>> Hi Ilya, Ilpo,
>>
>> I agree with the suggestion, but how about taking-up the refactoring part in a
>> separate patch. Yes this patch focussed on supporting OV05C10 and even the
>> code review proceeded with this understanding. Refactoring now for generic
>> support would require changes that would undo some of the recent review
>> feedback (especially related to global variables usage). Please let us know
>> what do you think.
> 
> Hi,
> 
> If you refer to comments given to v7 that resulted in removal of swnodes
> field from struct amdisp_platform (and some other fields along with it), I
> don't think the comment was given to mean that you could not have
> platform info structure (const struct amdisp_platform_info that never was
> been there) but that it should be separate struct from the runtime one
> (struct amdisp_platform). The runtime struct can have a pointer to the
> info struct if it's content is needed after probe.
> 
> When the platform info struct exists, pointer to it can be put into
> driver_data in amdisp_sensor_ids. I don't expect you to necessarily add
> the other sensor there but I'd like to see this adapted such that it can
> be relatively easily added which likely requires having that separate
> struct for platform info.
> 
> So in a sense, it undoes some of the changes done after v7 but looking
> into history of this patch, it looks the post v7 patches went slightly
> into wrong direction which makes adding next device harder than it needs
> to be (I'm sorry I didn't realize this sooner). TBH, I don't think adding
> the info struct is that much extra effort for you given what you had in
> v7, the info just needs another struct separate from struct
> amdisp_platform but the ingrediments kind of where there already.
> 
Thanks for clarifying and providing direction. I agree adding the new 
amdisp_platform_info structure should be straightforward. I will 
implement the changes and submit the new patch v13.

Thanks,
Pratap

> --
>   i.


Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A001F0994
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750880311; cv=fail; b=It7DU/5h/1gJJlXaqvy1lgrAYOKkzx8f8zXUPjY8ofXKSkCSIDtEgZ0qfuPzyc0AK+iiybubZWr7JBsRpV0LnRLdN5B3u6+AhEQwDtlIUyRV15TqgBB2NgMgFhC4Ojw9BF/VDgGYhBwz1Da0w8iezhUYC7fUo84Ao0LXKEaxcuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750880311; c=relaxed/simple;
	bh=84bKfeIVUmv/NszMr4e5kzJn5MubqPP/kHR3KS3HFEM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EhwirDry0nxv5tGyBZ1X6rnxP65VNGYZIHufQZ6N4s+TNlmdoPbi3qWwP/dlYko7TjXOrYz7mLJt7WzwV1jJa0dkKQq5u+o2qLcK32QQdY3GY1v70FxH8nKzlRS/JoqNG/oRGqcVOwpiVip/zbiYvrV1bpVooDYIcSRuJKyDZd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=KSK/vYsI; arc=fail smtp.client-ip=40.107.130.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="KSK/vYsI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvJVQ3gwlPtUGnjmyr2k2vCd2SwLBQvmmHmpJPlmpjr1EY+DpoOa10RwyCHtMAEUljCCCyKwmD3sXM2BXuKH17pNmHlEeiFwnf1Bx3f2VMOyrKDUdqJpwscYcQ87iD8rWiVFX2J0T8JxIDnmi3tDX4kQV0WdGDjJUqnD51AVaUZpMbQnUP+dvOw3AjhEq2aC4EeEuBd/H2UDWhkRJOstMXdGqKz8NWpKsE+1daSjaiHprggGNXq3JhpDfROvvTBRNrn2EHDL1Q0YjTXw1dvOdQryas/pL+a7odW+lncVxk/PIf5ecQUmhMKg1xnaoN0MWWacUpzaUz6opjy6+dFc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWJouRjAYEJzgTGjLHrkLW0yVXVQK+xTKDgi9nMLF9o=;
 b=B1Ni9iLfyt4KbqNfS4qO/60zM0cyWMPx8yLJ2Yra8KvcsmRZuP9OkFXnHk45jYt+DVA1/rZHw++ZZmuuXmvwhsmKBkCO/GPy+snOXtPMJ5oao/q8bU2dp4jhpunCeBaFi+Js145wcROQzb5Y2qoL/ePIPB/9MC91mCNgxe46+thQ0qujtV9ZPRnkA0klrszx7p9INODaxITM6YSEkjCbu4HO+6qmQWvnFxWLyL0x+70WuLP0A/uKKlZl92TGiDrq3Vs0+CgzMKNTnveQ4zxrOPI67GlhRTmgRtpn7l+ysmQ91SQ7DLS5IWD8xCsm+bQhrVmgWg8igwF9AX2Tmk0o5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWJouRjAYEJzgTGjLHrkLW0yVXVQK+xTKDgi9nMLF9o=;
 b=KSK/vYsIKeTWKDRhIMRw/JY00cZ+bZiih81YQBGTA6vTtI/SKN7xfCRaCs9sRXP1Uo7GDM7hNgvltViWBCX4EFqRTp4J2XcuoN8vby1V+uOKPP6Kz2W1D/HjgqF413NE+PekjEewBWSLQ9UoDEqNsmpngP2Ob6/LfaRFS9NTF0APDeM1JqHB/EnhnA1yYYInEsdVHLLz/sbkkLNAvOnf4SMchuGW/V99Zlx/C4b/0l/NH3BRXGU/ZLi50xHs+4B4T/kPUoevO0VLDg32O9UhawzSdYUjbPjotNMutsFSlCZr84K7wt08XI87xki5Niw4WSw1htGKevfZAV/vGiFNYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by GVXPR10MB8703.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 19:38:25 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 19:38:24 +0000
Message-ID: <f9ac32eb-f052-417b-859d-1c8ede2d8daf@siemens.com>
Date: Wed, 25 Jun 2025 21:38:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Associate GDB scripts with their subsystems
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, kbingham@kernel.org
References: <20250625175239.1099848-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Jan Kiszka <jan.kiszka@siemens.com>
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <20250625175239.1099848-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0366.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::13) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|GVXPR10MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a882a07-5255-4784-515f-08ddb41fd989
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1FqcExBL3NXMUpIN3RiL241a3E4MmtIcVU1M3FGc3RySmhacGZnR1dhRGJu?=
 =?utf-8?B?ckoxZFNsTCs0d3JaN29nUnQ5VDBoUGEzZ2NuV1pLVUxCKzdYSCtoQVFWVU9I?=
 =?utf-8?B?WldUeVdXcE1jTlVLcUp5UDA3M1pnTTBHaTI0SDFneHFvTWZ6c1U5Y0c2TzFY?=
 =?utf-8?B?U0tWVzk1TzRRTUZJQUVIeTNhVUhEYmRBQ1ZtWjY2anhDV2w2bVRCQWhMaWlB?=
 =?utf-8?B?ZHY0OUQyVVhaamJPNVFleEszcHVGS25obHRHaDVPUTkzN2dsRXQzSm1CU3VZ?=
 =?utf-8?B?TS8zd3NaanRIYnlTWmdTZDg5NmpBcnh6OHNWYmIrZC9ETU9wQ3Q3aGQzMFZI?=
 =?utf-8?B?VVhRcko4eFR6dG12NU5ROExtQWtjczEyN0RySDZ0RE80RkpQM0ZlZlVlM3dO?=
 =?utf-8?B?WGd0LzgxUlFYM1AyUkRVZFEwU245VnExcGtYZVFDWFUyQTN0WlFWV3NnZ2wr?=
 =?utf-8?B?UE9zdDVrNk1BeDgvd3hWVVRybnhBSEFwcEJXVmpxWk5RZlJVRm1qbEtuR2F5?=
 =?utf-8?B?SWNJd1pzYWdrSFMvKzJIeW5ydXVOWlllNC9nY1FHcjJ4NkJSc2FBdTJHc3BU?=
 =?utf-8?B?akFRZjEwWlA4a215K0pPRi9JRHljeTVGWVcrTlhiR1NEK2dGTXBxL1ErTTBV?=
 =?utf-8?B?TGlQcGFiSDV6T1JhM3VxMjcrOWZQdVY3aUJFZGVCTVNLSC9PZXVQeXc2VFRm?=
 =?utf-8?B?MlJ1SWQ3MVBBYnNkR1Rka211clNSN0FBTkNEbVRsZ1d6K0JLSTVDSmdld3Nk?=
 =?utf-8?B?WWRkQ3dkSCtiaU4vdW1yZC9vTTVSTklVbFFHUS96aE1EN2h1eittMm9NOWs1?=
 =?utf-8?B?cnRKd1VzYnN2azAxNXdvWmovUktSd3pKaHRWV3B6bjdKcmc4eHprN005Q0hC?=
 =?utf-8?B?T09nWkZtTzJxaVQ1UlBLZmN3OUxaV00weUNmZU9lSE5sOGRmMmVBY2J1NWxm?=
 =?utf-8?B?dnBjMlAzUXJ3R2plQ282RmpoUXZOZk1yNzk1NDZHNk55Mm5TTXJwd2lxMUJo?=
 =?utf-8?B?TGkybGRrbTJqWklHMmRNeEtPaUd4cEF2UWNhTEJ0YlFTQ0x1YmFGa3pnOGNO?=
 =?utf-8?B?UTFiSzRnRFdnbFV3aExHaS9IVGtuSnl0R0ROWWFKbWRDcWd2QUdpeUIyRWtz?=
 =?utf-8?B?Wk5CWUdRZEd6WmcvSGVTRDJCcjA0SlFmSFNaYzRYWCtiRm1HMUk3WU00RzVv?=
 =?utf-8?B?NEc2VDdXdDlnOVhSMXorNGRSQTNqU3BQanFSWGVDcitObHErbXRRa01tNzRU?=
 =?utf-8?B?eW5kMHB3ek1oMVNvdUpZNFQrdVNJOXRLaWx0dG1na3NwWUFkTElNZEZ1QUkz?=
 =?utf-8?B?dURpZjNObk5oaHBrM0pUS1k1bmdoV0ozMXJMN0ZjTTJGUHNmTUtYQUFhUzN2?=
 =?utf-8?B?Q1JMUGpQRWNGQU1xdVp2NDRpL0lZMkg2Zk9zc1Q0YzNLVjN5dmd3VHF3UHk5?=
 =?utf-8?B?N05HZVhBREp2OWdTeURXNzNtOWlpa1d0c09HYnV2NXJMeDF4em9IbzBRM0hS?=
 =?utf-8?B?UnpqbHpLaFJJcnZ2LzRvY3hlWGRlYUg5VFZoek1ucC9DdU9yQ0RuQjh1UGJH?=
 =?utf-8?B?cUgrQk55WTY3WUNXWnhaZ21ENjVCTmhKMFNJWmpWYU9TZW5rZ3RDcDdyUTM1?=
 =?utf-8?B?OWdaaklwT0xhdkZMNGZ6Qy9YTlBkbU9nRkdHS2NneWl3ekwzNkgzaHppcWJL?=
 =?utf-8?B?NjZPYVhDbUkvQmdGV3MyOVZ6YmVLSWMwdGwxWFIvZVBGZ0pxUENsNzFKR0hx?=
 =?utf-8?B?QklBRCtFNkp6aEQyNVdDSDRmdnZ6TkF1b1dMS0JUR3NSVTBpdFVZY0JWSUo4?=
 =?utf-8?B?WTFEMTZyeWlCSno0WktxNk5XVXhzTzYxSE1QeU5BVWtiSFpUVU4weGdiZmhS?=
 =?utf-8?B?WUFXeHZQUVVtVEFWNWZiakl1S3lLY2F6MjFkL1FPZmRUaVh1SlJ6c1lmdks0?=
 =?utf-8?Q?OZg7VxPNSt4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVBidVMvdXRSVXd4cUJQSFdsd2hrbHpKVFppTDkvcWhkeHdkby9lSFhKdnFn?=
 =?utf-8?B?dlRoWnk2OXZWTG5TSTBLSkl3RFN0cWlzZWY1ZHBIVWVxblNTWmNkRWxNR2Jw?=
 =?utf-8?B?UlNuTWI2SWJrRkJQSmk1aGU1SHc3cnBNb2dBYXVxeHA5ZVlCVG95WEMraTVv?=
 =?utf-8?B?M29VT3dPVGFLYjM4T3hFbU5UZXBIT0RiTjNkNzQxU0FEejd1N1R1UHdjR2t4?=
 =?utf-8?B?MFF5Q21iQjN6cjJBdTlDN2Z5ei9ETG5abm1JbnBtZlRPN29vZ0xMMFVOTmx6?=
 =?utf-8?B?NGFORkJPanVaSklDZXFCQk40SldvajBwTjJMVjlZYWtzU2NzYm5GbG01dzBR?=
 =?utf-8?B?QnZySitIcE9SYk5XUVV5alZPcW1WYWxGcUtMSS9ramIrRUV6OUxKWm1NanB5?=
 =?utf-8?B?Wm5GbjZ2YWpIREtvdUFNOG1CNWZTcGpveEVrdkZSblBGT2w0Wkk2bVZmUVhk?=
 =?utf-8?B?T0svdHcvR1Y3SVJTbU01R21HTXl2NjZNbkw2amxrOUJ3SzBhSU80VGlxdjVT?=
 =?utf-8?B?blNzZUZCWkdZaVVWajk1QUh3NE92NzRBODV5YjJWWU5ZNzViN25sMklPTytk?=
 =?utf-8?B?OUl6QmhjLzY4VFVqanFCMzI1VzhXcmh5OWRRVUZISzQvV0xUcENBcnF5UmJT?=
 =?utf-8?B?aE9rbnlEOWVzTXZ6d21jeWRpMmVKclljeHlZTkxjMUxzalg1RzVucG16amRr?=
 =?utf-8?B?Q3ViYjhqdzAveXQ0M2RseWZ5RmpyWG5QVmVZeHpFd2RuNzJRMXJPaDVuZUly?=
 =?utf-8?B?UHF0cUFwbEhLajFpWjgwRHFSRzlWVHZwOHVYNVFWN2pCYWZFSHQ4YWJRYU5o?=
 =?utf-8?B?cjZ3cjFNazNmOU9lSksyWVF4NTRaOFU3dzUySEJicGhUekJkNWJySG5zS0dE?=
 =?utf-8?B?ZGJvemluM1dRYVQwLy8yZERpNE5PSFdHa2F5bTBqWnhOSFRYSU1uYWkrcEZL?=
 =?utf-8?B?REo5NVlrVmVyeW9mRDlzSFo0cFBiQkZwZ3hFMEQxemxNZDUwaG9jOEFyMlRE?=
 =?utf-8?B?czYxNlprdW5FUjhJaVpFdkh4Mk1hVGY2TlJuVGp6Q3pSUUlUUENPaDhtWnBv?=
 =?utf-8?B?WFUxVzQzRHVUV2VHOEtaWUpIbWNja3hhbVorTS9CVWNNY1BxblUvb0pDdUpt?=
 =?utf-8?B?WXlWRWk0a2YzOEdTZXlXZHVQbjJKb1YvMENzT2o1MzEyK21sc0dzQ1hycENh?=
 =?utf-8?B?N3JXS3V6R3cxM2VxaDQvdzAzVDJXQ25TeXM4ZEZkSjB1U1NGYVRyZXBnMVVX?=
 =?utf-8?B?OU53M2RrNlR6Z3Zrbi93dUNEeUQwZjZPTWRORFovRk15c0daMmI3VHNuZzdM?=
 =?utf-8?B?MEJhbHRmMG8wUTV5NWVqd1NnUkJST3ZYL2VTRkdpTCtub2c2cGVzYzZvSzJv?=
 =?utf-8?B?UUI5dDlGOU53VklMalpadi8zN1k0SDdDcE1VQkF3dnMxWE1LSzk3bnR1V3VC?=
 =?utf-8?B?b3ptcUpWeDZ5Nll1dGw4NUZ6STZ1M2xuNUlYam0zeWYzajl1Vmt5OERHcFhC?=
 =?utf-8?B?K0FMa0pPTy9IeW1VSWJ3VFR5MXhUMXROMTBUVU9EcUhKZ3NrQWtwM2Fuc2Fx?=
 =?utf-8?B?KzQyUndmTXkreWlUWG1WejNsak5MTlJxNyt4cVNmOWNIV2VJL215YXRWa2FD?=
 =?utf-8?B?T2hIdGpBVjNMSkpWMnh1Q0VVNEJjZ0FXMWhzY0QyRXRVcXFQaG9Va1JZWWhJ?=
 =?utf-8?B?cnBoQXpXNkV5TVN3eW9NUkZsYm1xZHpjK2JtN0Y3Sm1FaTMyWmplTG1oZEV6?=
 =?utf-8?B?bTdJcWxmekVsYU5pQ0ZmNTlOMnViQXpTZ2M5cnppYWJtcHdTMUdpMTUzem1x?=
 =?utf-8?B?M2ttVjFKRWFMV2FPbXhVUVIzTkw4dGdTTU9ZbHdXVjgxUEREOFZscEV0V0Zq?=
 =?utf-8?B?UmozM1pLaHBLQ2xtcFVaR3NVYk92aGI3SHdrWU02YmM5TGdVMm5ZQWE3SWVV?=
 =?utf-8?B?NndWeVhYdlBkajE3Vms2SEcwQ0ZsdDNBSUovWlVCMytpaGNyZk5ZcVQyMGZx?=
 =?utf-8?B?bmNHcHRLZ2JTUXRJcWhwUEZZZ3FaejNMMEFzZUNyOFlweXNiUWtQamVBUXRV?=
 =?utf-8?B?MmVvNGUzbHM1bzI3aGtJVmJnZmVYTndCT3Q1MjhMTEt5NXpxamo1MzZXbXZ1?=
 =?utf-8?Q?bjvhAbbcrlNZlmYodBi+cv9Hs?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a882a07-5255-4784-515f-08ddb41fd989
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:38:24.8669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY6HpUys33uE3Ys1xuL6AZkEBHqEb82R/FAyZ4tYKaAgVlEkZuOgZT75QHEdddWuFXZiMlFR59YrNhk3b8Xcyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8703

On 25.06.25 19:52, Florian Fainelli wrote:
> The GDB scripts under scripts/gdb/linux are very useful for inspecting
> kernel data structures however they depend upon the internal APIs and
> data structures which are updated without much consideration for those
> scripts. This results in a near constant catching up with fixing the
> scripts so they continue to work.
> 
> Associate the GDB scripts with their subsystems in the hope that they
> get more love and attention.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  MAINTAINERS | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efb51ee92683..ffd08e63cd20 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5979,6 +5979,7 @@ F:	include/dt-bindings/clock/
>  F:	include/linux/clk-pr*
>  F:	include/linux/clk/
>  F:	include/linux/of_clk.h
> +F:	scripts/gdb/linux/clk.py
>  F:	rust/helpers/clk.c
>  F:	rust/kernel/clk.rs
>  X:	drivers/clk/clkdev.c
> @@ -7374,6 +7375,7 @@ F:	rust/kernel/faux.rs
>  F:	rust/kernel/platform.rs
>  F:	samples/rust/rust_driver_platform.rs
>  F:	samples/rust/rust_driver_faux.rs
> +F:	scripts/gdb/linux/device.py
>  
>  DRIVERS FOR OMAP ADAPTIVE VOLTAGE SCALING (AVS)
>  M:	Nishanth Menon <nm@ti.com>
> @@ -10119,6 +10121,7 @@ F:	Documentation/devicetree/bindings/power/power?domain*
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
>  F:	drivers/pmdomain/
>  F:	include/linux/pm_domain.h
> +F:	scripts/gdb/linux/genpd.py
>  
>  GENERIC RADIX TREE
>  M:	Kent Overstreet <kent.overstreet@linux.dev>
> @@ -10126,6 +10129,7 @@ S:	Supported
>  C:	irc://irc.oftc.net/bcache
>  F:	include/linux/generic-radix-tree.h
>  F:	lib/generic-radix-tree.c
> +F:	scripts/gdb/linux/radixtree.py
>  
>  GENERIC RESISTIVE TOUCHSCREEN ADC DRIVER
>  M:	Eugen Hristev <eugen.hristev@microchip.com>
> @@ -12750,6 +12754,7 @@ F:	include/linux/irqnr.h
>  F:	include/linux/irqreturn.h
>  F:	kernel/irq/
>  F:	lib/group_cpus.c
> +F:	scripts/gdb/linux/interrupts.py
>  
>  IRQCHIP DRIVERS
>  M:	Thomas Gleixner <tglx@linutronix.de>
> @@ -12985,6 +12990,7 @@ F:	include/linux/kasan*.h
>  F:	lib/Kconfig.kasan
>  F:	mm/kasan/
>  F:	scripts/Makefile.kasan
> +F:	scripts/gdb/linux/kasan.py
>  
>  KCONFIG
>  M:	Masahiro Yamada <masahiroy@kernel.org>
> @@ -14464,6 +14470,7 @@ F:	include/linux/maple_tree.h
>  F:	include/trace/events/maple_tree.h
>  F:	lib/maple_tree.c
>  F:	lib/test_maple_tree.c
> +F:	scripts/gdb/linux/mapletree.py
>  F:	tools/testing/radix-tree/maple.c
>  F:	tools/testing/shared/linux/maple_tree.h
>  
> @@ -15748,6 +15755,10 @@ F:	include/linux/mmu_notifier.h
>  F:	include/linux/pagewalk.h
>  F:	include/trace/events/ksm.h
>  F:	mm/
> +F:	scripts/gdb/linux/mm.py
> +F:	scripts/gdb/linux/page_owner.py
> +F:	scripts/gdb/linux/pgtable.py
> +F:	scripts/gdb/linux/slab.py
>  F:	tools/mm/
>  F:	tools/testing/selftests/mm/
>  N:	include/linux/page[-_]*
> @@ -16809,6 +16820,7 @@ F:	include/linux/module*.h
>  F:	kernel/module/
>  F:	lib/test_kmod.c
>  F:	lib/tests/module/
> +F:	scripts/gdb/linux/modules.py
>  F:	scripts/module*
>  F:	tools/testing/selftests/kmod/
>  F:	tools/testing/selftests/module/
> @@ -19430,6 +19442,7 @@ F:	arch/*/include/asm/percpu.h
>  F:	include/linux/percpu*.h
>  F:	lib/percpu*.c
>  F:	mm/percpu*.c
> +F:	scripts/gdb/linux/cpus.py
>  
>  PER-TASK DELAY ACCOUNTING
>  M:	Balbir Singh <bsingharora@gmail.com>
> @@ -19771,6 +19784,7 @@ F:	include/trace/events/timer*
>  F:	kernel/time/itimer.c
>  F:	kernel/time/posix-*
>  F:	kernel/time/namespace.c
> +F:	scripts/gdb/linux/timerlist.py
>  
>  POWER MANAGEMENT CORE
>  M:	"Rafael J. Wysocki" <rafael@kernel.org>
> @@ -19886,6 +19900,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
>  F:	include/linux/printk.h
>  F:	kernel/printk/
> +F:	scripts/gdb/linux/dmesg.py
>  
>  PRINTK INDEXING
>  R:	Chris Down <chris@chrisdown.name>
> @@ -19901,6 +19916,7 @@ S:	Maintained
>  F:	Documentation/filesystems/proc.rst
>  F:	fs/proc/
>  F:	include/linux/proc_fs.h
> +F:	scripts/gdb/linux/proc.py
>  F:	tools/testing/selftests/proc/
>  
>  PROC SYSCTL
> @@ -26440,6 +26456,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	include/linux/vmalloc.h
>  F:	mm/vmalloc.c
>  F:	lib/test_vmalloc.c
> +F:	scripts/gdb/linux/vmalloc.py
>  
>  VME SUBSYSTEM
>  L:	linux-kernel@vger.kernel.org
> @@ -26949,6 +26966,7 @@ F:	include/linux/xarray.h
>  F:	lib/idr.c
>  F:	lib/test_xarray.c
>  F:	lib/xarray.c
> +F:	scripts/gdb/linux/xarray.py
>  F:	tools/testing/radix-tree
>  
>  XARRAY API [RUST]

I will surely support any proposal that helps connecting the scripts
with subsystems they address. However, you should likely break up this
one here into per-subsystem patches and address each affected
maintainer. They should have a chance to accept or reject this potential
extension of their responsibility.

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center

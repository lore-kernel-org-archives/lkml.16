Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38D929A5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749473190; cv=fail; b=ImwdOqNDgMXg73/mOVK7vvA3WEWJn2UrIznPxAHf1ldKVKr4zEk1SnUM7ovCO2M7+FbOX40XZNdqDTUgvnIvHJhmE+UdqUEHYjMdXYs9ExzBQ8oWCldh8deuop/qtZZce63vQnroHwNfJ6akxEindrb6tPCuNedAUKI3j/spKuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749473190; c=relaxed/simple;
	bh=9Jijlql5aZteh8RqUhEhxf5XS1uavzyJPefiAx39X9s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eVN8UG/dES6STMbXTO/FZJdp+czDpsjsNgr1VBlDE1Pi0fifbEriH76gaUlfmPqdnDExBootZrSL6Rm5JACY3qVddpejA6Q+nWhr0zOC0Jlw3WJGoy7E3ulCULYCYNO1lvt/vDs2juYcprEttetrK7gt4Sqnh3PS6Gf7P/Wq5hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fjUlgmSn; arc=fail smtp.client-ip=40.107.243.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fjUlgmSn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSt9po6fJmA0axWenv0bmYQgkxNh4tLGQmh3z9/k5vnTwvEI9SI5OYrCYdtyPZL+u6KRxCNiDLBbFuOKa/Ct6GYdd9hZna5DRKvP5svSOJs6LGozM0S7pOEjl1ITzoEtECm6Yf2ilcQGxkntD9KjfqdIIq6JyJoQGg1mNDFRU9nqbLIuOehVIcJuDTTFjq3ofzxpwJRmXiZdTTVT5FRsxoadWGSkpvITgnHzwhym+ikwdBjHudfckngquw8XggiYNqclzdHhT1QK0cJiQUGnbpuseqDVbO64kpD5QJ0Gb4jCFITJkDNeh4ts/Tr0bPTnyrnY1VN3RXuq5nbKg2s+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyyUXKhTrDrikUb/MKvKhOWnFCwlezDFsVfXpeASBaA=;
 b=bBoNAXZYa78C9ix23eWr82fioGW0AQz+jMd6xksC69Kvx+t1sZ/NkROwhQxkJefSSvbjlRiOf37t6th5bMr6xx9dKL9C7ovjKN6yv4T4o9rUOjNUXx1oyPGH+ChntKGUYCD+bgQQcT5Yk+cNlY4hPl8xzSXxZu0p4rdZeR0SFSRFl/ko67xhhsONxShTO4XJFmvFBT7qBFITNJgHaCF3NG1SycjzSEDGIZAloozRC0EbRr5omzj+EGkxw8GjSwQbsDkvMqS5XXm7fSuyPwUW6csyjMcJqLR02hm1pB4VlX0F8ncEL7gbc/GHlK2fveLvOQ/9q1XRfvddoK2NyV2JsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyyUXKhTrDrikUb/MKvKhOWnFCwlezDFsVfXpeASBaA=;
 b=fjUlgmSnZV9GpzgsIkAd35jfDZkHcmJFYv7+dKVb6XWwmCnxRvxDMtJy1WVUNTb6g77YMBVCUAo+e0Z7L1NX9FNfT//unxgLyDv9OocXX4h9MnbR4EArMaaNrW8IJnO20kmXceeZk2SSVdhgudAiN4sEbYITh0SUQyVeFceKnaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB8468.namprd12.prod.outlook.com (2603:10b6:208:445::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 12:46:26 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8792.036; Mon, 9 Jun 2025
 12:46:26 +0000
Message-ID: <560baf50-1bc5-473c-9889-59f7d625ddd9@amd.com>
Date: Mon, 9 Jun 2025 08:46:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: register HMM dev memory to DMA-able range
 first
To: francisco_flynn <francisco_flynn@foxmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <tencent_03FB073FD3015AE02485DD6839D6571EBC06@qq.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <tencent_03FB073FD3015AE02485DD6839D6571EBC06@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: f8cd4e70-768b-4685-645f-08dda753a57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1E1elBJU0kxMmRtUHN6bDE5TDNha1o3a3ZPV21xWDB1Y1pUWE5jb0orYVJB?=
 =?utf-8?B?UlUyT0orME83emp6cHhobk9KUktTd25mTlhnY0ZKWEtDakpTcWlEOTFaU1Br?=
 =?utf-8?B?Wi94cHZUT1NFZHdyU2lBMy9VQ0FhVnpRc2J4dkl2YS9zRzZWL3F4czAwNGZD?=
 =?utf-8?B?RUpVMWVPRXNVN2FYaUM1T0ViL1BiRFhCbzVaQVRNQkZJMFB0WEdla2krczFY?=
 =?utf-8?B?aEZQekVXcmFEZlYxWDdBTjVCNmNrVk01QlQrMis3dkZsaCt0dEJXUVVpTDJr?=
 =?utf-8?B?SjBVV2tSMnZDVzRTRVU0WVZ1R1RKclVZMGt6bjd6UGNiaUNhYmNJNXhINGh5?=
 =?utf-8?B?alIzYlJhNExRc3FvdXFhZTRXMVlteUR6VjVxRVV4WTZyaHhMVTZoeVVObEIz?=
 =?utf-8?B?ZHZUMlRxdUVlR0hTbExLNzd2MzlnZzFjTkJMZHBqWUNseFFkQ1Vvc09ZNlBz?=
 =?utf-8?B?WW4vZVdCU3ZNeU1ScytWN1ZqZXVZKzdrSTFCZUE2NzNuWDY1MUR2ckVyUzdJ?=
 =?utf-8?B?WSttc2sxM0ZvbEFNeWc2dkZFT3I0LzZDbFdGSEpnNG16YThYbTVPOVRZRDFL?=
 =?utf-8?B?TERZWEtwaTU4Q1o4UFFERnpadlZlaGw4ZEJnYysyK2JnTGZFd24vU09Odysx?=
 =?utf-8?B?djJJVkFIMXN5TlFKcndPei9CYkNOMml5ZTNOaVFBUXZnSkRGU0hZNmFFYy9W?=
 =?utf-8?B?NitBTk9DQzJwYnhNbm1CaW5YQy8vYUpSZkRFdEI2TmdtOUFvV3lWZGpRcGlV?=
 =?utf-8?B?WmJvV3pHSjZoOEpCdE1TOFBib3VnakFHNEMvbTBNWFl0MUxaOG9tOTJuNTla?=
 =?utf-8?B?b3NsdUZDV2gxa1JORG5ITy9mYUZGelJoeDI4Tm4yVExxdE5SMUxaVmZaTyt4?=
 =?utf-8?B?ZlBleVN0TUtPeWV1ZHdqQlNud20yaXc2aEY3SHZRWWR2Z1dRb1JiTlB5ZUVV?=
 =?utf-8?B?Rzc1d1MrQ3pmVXE3RWYxOG5yTVdQZkZ5bXVNQkExTThXVER5NmJVYzFWT09J?=
 =?utf-8?B?YUZGeFh2VkVOa1JLaEpxWUZpV1dJbG92VktMaUh1anpNM25CU2xobG1VTG1U?=
 =?utf-8?B?bTg5MFYzdU1SRHdRbFNBVk9uUnp1Y0Eya1RZS2UybkZ0SElWY2RDNXNyMUMr?=
 =?utf-8?B?M1Z6anU3dUhWb3BIc0NGdldJU1dvd09vVlM1VXpQNDQzbHJYZVhzaHJuMHJR?=
 =?utf-8?B?dXQ2VUdJWmJpbytKYzlXUzV4eVZlZjVKZUMrUUxKcTNFTmIvdllvczJDVE9v?=
 =?utf-8?B?MHR4QlRrcW1QRjdmK1VlLzNnZmowQTNSamtWZFI1ZmV6enRTN3h3VlJVUTZn?=
 =?utf-8?B?TjBzNEdQKy9TeExwR095VGs4M2pEK3FSUmR2eVZkMDBYWGNDUXl6MTFuVVZr?=
 =?utf-8?B?VmhxQWYyeGtIVlgvUjRINExZelVSbTdLZkFxcFVEUGZvUTVzdjVlSFpXQThn?=
 =?utf-8?B?UlZqM0JzQzRzWER3TUZDS3JoZjJqV0FBT2UyMGMxQ2RTbVpWUEQrNDlnYUZK?=
 =?utf-8?B?SVZ5MW5uelJGdWxpaWlXdlZWbFBWcmQyUk1nd3EvU21aNlBMancxQUJ3TEN0?=
 =?utf-8?B?MXJSd05pQWVVQ1E3UU1WdVkvY1hNcm5MNTFINC9JN21VY1Z0ell1WDlGZ3pE?=
 =?utf-8?B?UVZGTEdFTnNOMVRNeUU5ZWRVRGMvL1BFbDJZejRxMURlS1E3TkUzdS92aGR0?=
 =?utf-8?B?d0tiSm52ei9ZSmlzdVZGOGR0YVdwbzFpUWZ6UERneHIvbXExb1V0bzE4N3FE?=
 =?utf-8?B?dXBXL0lBRE9LdDJSemdxd1lDYm1uUmcwaEZ5dVVUaWRwRndLVTVOTWpWZG9B?=
 =?utf-8?B?clM2bU5mOW54MGk1czZXY0JDMEV3SXpTVnNmM3JLRlcvS0NpWjhveVh4S2du?=
 =?utf-8?B?cFl6Tnd1RVRGb1BJWTBwNm9WM2tTcTlJRnVPZC8rSnJ5Qml6VFFyeTErbUJo?=
 =?utf-8?Q?hh9C6jp70rk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUZSbjQ3cEQ2b0ZyRSt1T2JVV1RQaEhNTzFjU3o4Z2l6bWk2TG1JWUtoM1ZI?=
 =?utf-8?B?QzlzanU2U2JzemZELzR6UnhORmlPRTBTNjRtTTRlcnAySlRwU0U1c1hzTlQx?=
 =?utf-8?B?K3JjYy9VNlZLZmcvSXpFNmxNdFc3NU5Gb3ErbldUa0pBRFBCQ2FoMDJ1SEpU?=
 =?utf-8?B?Z0hXK3hzZDFEbEpJcmRvMWdCQi9ZVWFBYTNoeDBHU0dNUzNpdW9WZTBPTTNP?=
 =?utf-8?B?Z0ZxUUlmaUQyb1dpWTZhMCtvQXdVV2tmUEh4UmFkNzZlZEUvLzR1SVErd0xt?=
 =?utf-8?B?amt1aGpwZlRvZGlCOGMzN2ZSTnY4K25xekFKWUFjV0FaQ0EzdFJ6OHZWRnNR?=
 =?utf-8?B?RGg0YS9DN1FRWTZ5bEd5NnBLajNqbnNOOFFmZFFMMER3WkllbVBqSEtxY3Rk?=
 =?utf-8?B?N1V6dWwrS0pKQ0FzSktOTEZCUDhjNWx5ZHRsVklWajVyVjVhWE8rZlVFSDRP?=
 =?utf-8?B?RjkyQWJGZkVEMmxNTHMvdnRqd0pkTUNmSWh5cTFXTHhrY2dYcFoxbUdNdHlQ?=
 =?utf-8?B?c1RNZ3lNcXY0OHk4QnZyVWRDaElJUzQxcHlHb292ZEV2aG5qUGNha1ROOEpn?=
 =?utf-8?B?Nm90UXhqNjVDZVh4em9weFkzWUR5Tk91TXBtRVZzUzRXRmxWRGE0c3dzSEZu?=
 =?utf-8?B?aXZwMkdsb1NZdlRvL3hkNzhEYkhSNDJQMG9CMFZtL0FKODlZa2ZFcWtDNTgr?=
 =?utf-8?B?dy9jdHhpWUwrNjYxTXZlT2ZRbkZEbG1RTlVyYjlqaVFnWWlEdVQyRW4wSFJU?=
 =?utf-8?B?dlhoKzFDcDNYSllUOUNiVEJxaWMzdGVJSktITFpRNG83MkU0MFhUbWNwSWdv?=
 =?utf-8?B?UkxIemR4cGRXdzFaTzZmTS9YWXZPYVVKc1hUMXRnVGFsRlkvYVlxMkxOWXFJ?=
 =?utf-8?B?dk5wdFRjOFV1MFlTV0wvTWs3SHE4ZkFqZEYzcHZEK0xDKzJDLzFOZDIzbWxx?=
 =?utf-8?B?UmxFVkdWRGFWTS9MMHRPNVJucG9PNGVIR1NOcjlIWStlbmdBL2k3TGc3ejEw?=
 =?utf-8?B?RE5heG5rL2IxTjVnN1d4aTF0RVB0K2kzWDJjM0pMdFpUUUl1Lys4MmRRa1BD?=
 =?utf-8?B?N0x2cDVUaVZlQ0FHd2ZWVG5mWGJKU3pkTGVvdkdSOTkxMFgyOFJXRmN1TU1n?=
 =?utf-8?B?TXBRZmZENjkxZlZERjhvWnE5WmFjdTRaZ3hVT0VkNXBPSjc3eFBia3hRazdD?=
 =?utf-8?B?Y3h5VHZGd3NGS1hORjVzSm9nSFJOc0JkQytnWk5CcmxWSTRndFBpSGdIbFVW?=
 =?utf-8?B?MUYyZk9Sc1BmcEtlejkzZ2pyYUkrd2Nmekl4ODJxUGVZRERxVlBaZEhVUFgr?=
 =?utf-8?B?Qlg2UURNN3hML2NoYWxyK21NYUNhbzljOFErUWZnU0ozUUMzVXJjMHBTWXV3?=
 =?utf-8?B?N2E5bkRFNlhLV1JGMEd1eHBBRVVxMU92WWN4TEdLWGJ3bDRENWdpODBFUXh0?=
 =?utf-8?B?ZnVKenZESkYrMlBWYlJqcU4vcmprTkFzN0hFRkFxSXZBRFh1OXpCTnJvZXZn?=
 =?utf-8?B?Q1JuZG14ZzlhYnQ1RUEyOTh5YlNtOGhKWWFYNS8vNWF5OTd1N1VGbStNSlJP?=
 =?utf-8?B?cmZwMUJJUVREejlqMHRmK0xYRVBsTmxLNU5mS01KaUhDamo2VVlWSzdUYmQ2?=
 =?utf-8?B?MkNJTk9VL21JRWJuRTh4WGgxYWV2aUZrVWwxN2pGdyswd2pqblNzSS9sTWRY?=
 =?utf-8?B?YmdQaE9jZ04vNitNNC9FUWlnMVlpaFE4MlpheEZhSFN0cEF1U0luN25hbHpZ?=
 =?utf-8?B?ZXoxMnRiUlpRSmVvK2g1SzFxdmo4di9YWlZLWkJJaVFqRG14Vm1vbFpEQUx5?=
 =?utf-8?B?UGlVM2t0Y0FnZmh2YTJvaWFRMDhtY2ZoRG95Sm1pdUlTYmE2SldzaC9IeGY0?=
 =?utf-8?B?ZzBvYTFSZVZQMEMvOFgxVWtvbHV5Nk1RZWxuNWRFVmFnOWxEQkVuZ2dDYkV2?=
 =?utf-8?B?c0Zvb25xZFB1Mllhem03V3JtTW5KaTBLaWpDZmUycC9aUzRNUDU2NTNMTzlF?=
 =?utf-8?B?V3VCdzRKYnFJcktBTk91V2FtelIyS2ZSVVR2Q3RSMUw4Uy95Zk52QlFMUzlk?=
 =?utf-8?B?R2RXTXFGUGpvNFNnZlhXZElremI3WGlLN3V4WTFXMXMvSVU2VkdmWVBuNkFL?=
 =?utf-8?Q?VUHrv48MUE1uVWcgHKyJYr5Wh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8cd4e70-768b-4685-645f-08dda753a57c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:46:25.9586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5eK1J89kuZnXJNDx6D4vqi5gYoBX8zugC8VPT+UfpnUUACdA6fdDNjZVRn4GOiEiWebfj+gKSawn1I3KaVbEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8468


On 2025-06-09 5:36, francisco_flynn wrote:
> HMM device memory is allocated at the top of
> iomem_resource, when iomem_resource is larger than
> GPU device's dma mask, after devm_memremap_pages,
> max_pfn will also be update and exceed device's
> dma mask, when there are multiple card on system
> need to be init, ttm_device_init would be called
> with use_dma32=true, and this is not necessary at
> all. let's request dev memory region at DMA-able
> range first.

That doesn't make sense to me. The addresses allocated here are not DMA addresses. They cannot be accessed by the GPU via DMA. They are purely fictional addresses for the purposes of creating struct pages for device-private memory. There should be no need to limit them by the GPU's DMA mask.

Regards,
  Felix


>
> Signed-off-by: francisco_flynn <francisco_flynn@foxmail.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 79251f22b702..3856b9fd2a70 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -1020,6 +1020,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>  	struct amdgpu_kfd_dev *kfddev = &adev->kfd;
>  	struct dev_pagemap *pgmap;
>  	struct resource *res = NULL;
> +	struct resource temp_res = iomem_resource;
>  	unsigned long size;
>  	void *r;
>  
> @@ -1042,7 +1043,10 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>  		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
>  		pgmap->type = MEMORY_DEVICE_COHERENT;
>  	} else {
> -		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
> +		temp_res.end = dma_get_mask(adev->dev);
> +		res = devm_request_free_mem_region(adev->dev, &temp_res, size);
> +		if (IS_ERR(res))
> +			res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>  		if (IS_ERR(res))
>  			return PTR_ERR(res);
>  		pgmap->range.start = res->start;

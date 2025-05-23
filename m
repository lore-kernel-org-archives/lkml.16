Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF1F2DCBF0;
	Fri, 23 May 2025 04:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747973543; cv=fail; b=H3zYyd+pt8iF02n7swB4T3Gau53qbuS6QfTFjie9rgME6Wz+XPTmK8fWL+v4z+TreRfxCpkJvRNBwdeVfQO3tg9DcMx77K3TkIuzLBE35ahlAtA1ZpswY27c/Ehx5+0S5Kw1Gxiy9TZS1Vix3+P4jzvmDghbcOqrgKjBM0BaSDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747973543; c=relaxed/simple;
	bh=LtDYOYwXJalEc+RX0FTSRGf1u1i9T4qaEkCItgT4TEM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cuv5o3L0ECTDirPKytH9yYiCDezPuPPyR8QUVo0no5u1F06lSZJu2/Pv78aYOi7Os2jHhxXUDQYD8IQxRxNnqOwIdZIDXeJdDeDRYNTvAzliEFvU8kTEC7t24Bsyp7+owSrfpc7dL8kGzR5se+0FF5HmqJ/2Nim7ipIUjrSz/FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4c7BJs6R; arc=fail smtp.client-ip=40.107.212.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4c7BJs6R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmZx5Ne1zWSyy1GEwfCijDcNP55DZfPe+BZ2I9+mUaLUQgfBTyd1GFyiYus3HI7x9yyjfgiiLB5f1hgemW6E9NwGE0h3yOWibJKulUEMNl5irqgnXrh6Y173njWbSLo37h8wm7WhC3daG6wskS19rGQAewgB+FQgx6TQm9qC6QlP+UVVDathQOOiP31aQ/U8rUmsGzfTJAK8cG7gCZl++keKl3Q5ixFVJUjbqpkJqg5o1Bpiz0IMhmU2V7NJIyl1qtReTxNZBSMSWVBNSVHQ5zddds/u4hOuqwJmqXqob1V51wav4dMqpsZc3izDNtAGWV0g/qjog2aqxXek2KFpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBt5bZXAT8bniLNJaAIOpr7jWw9vWAdU0oP8SyA2Cd8=;
 b=PiW9JTD8f7Ua+9Z2+TDoqLINq0ZRt7h/PX4Vw0BvE5Yu255LVLZdRfbXsblTJvmWFVjbI4QcP2BoWGA3VlcKtfZSGdjXw3jASMq6NrDR4uaqix8BbXxT4iWdHy/uyWi9lsbUy57ZhtLUr8vHU+nnl+zh5bh2aG5ddNKOJa7OJwM2kqr1ABTvazg+s8JEHxn6gBhaLHf04PFAFY4lzcQcbtceN9m9N71EG5ixMBjdNzJuMqeeOfuD1OngCdwqiVLyl/AjsJtwFX/Jby8KX6L1BvOhlsYbAGbYihLRgA20pgMkEQs9CWhPOg+sj/EH/E8aVwtn81Axo1hG8rXkjw7eww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBt5bZXAT8bniLNJaAIOpr7jWw9vWAdU0oP8SyA2Cd8=;
 b=4c7BJs6Rmf+RAn1Qk0WOlXCrpEk+JlN73r20tC//pCXjUdBqyHgR8/m5q+Oy4RAJITmxFGnlWTxJFmqj2ju32oj0gXWD8KBKKyFMm3MyjzLaMpnWv2pZxsre/ZZHjwjN1bhzXap87wrq97d+81vw5AGoi7/d5vQXTujfTQ7iodw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) by
 CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.22; Fri, 23 May 2025 04:12:16 +0000
Received: from DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a]) by DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a%3]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 04:12:15 +0000
Message-ID: <35537263-47cf-4cc3-9808-7a93361d3ba8@amd.com>
Date: Fri, 23 May 2025 09:42:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: fix building with CONFIG_HWMON=m
To: Arnd Bergmann <arnd@kernel.org>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>, "Borislav Petkov (AMD)"
 <bp@alien8.de>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250522144422.2824083-1-arnd@kernel.org>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <20250522144422.2824083-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::8) To DM4PR12MB5962.namprd12.prod.outlook.com
 (2603:10b6:8:69::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5962:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: deb5d2c4-2fc6-4234-9f00-08dd99b00039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aE9JUUQxTWJ6MmxmOXRSaW84MXRXOXhuSVpoN1FyazNac0pYMGJveXlJQm5N?=
 =?utf-8?B?NUhRRmJmWVhubHh5TmwwMzVkek11QTJ5Q3RCVmdBWE1Ndlp0L2UvRDQxR3d6?=
 =?utf-8?B?Vkdmd0l5cW5Vb3lCakNQNWw5MGlaN29RNk9YOVJVbEVoZU5OV2hkbStjazNP?=
 =?utf-8?B?TE9SZ0o3MysxcUZKaUI2QVE5Q1REVi9oWkJjQlNyZkN1Um52ek1wVHpDaWl3?=
 =?utf-8?B?ckMrano0Z09OcVJsV2VLeExDeUwvbDBOVjNqWU5xditOanl6WEVVWWxWK0tL?=
 =?utf-8?B?SHkwMHl4d1VyOVpDOVhNcXI3VnlRSllreVIycTdwbURScFN4QmlubmxHVkZF?=
 =?utf-8?B?S05NUDVIeDNUTmJ3WTQvMUxSOEVjbkNITWI1RExZcS84alA4Ti9QSmgwYmhM?=
 =?utf-8?B?a21DQmh3NU4zdHk1UnVrd1pPbXJXZFp6UDl3SVZoRmtlTStiV3IvWVJpYk1D?=
 =?utf-8?B?T0g3bG5sd1ZWZ3owVFpUL0lFNmFwaGRZUGVxb1puNDJ5MnNpcDVuTmRSMWRT?=
 =?utf-8?B?SkZZRzk1d3ZRTllQRkZuaUd4YkNpYUNiZGxxMlRzeVFnN1JCQVpQVXBiZmVi?=
 =?utf-8?B?cVhWTVVEWkE4cEVKWXh0TFpPV0N6cVg4Vy9YQjJZclQyMWVFTHpxOVFiOVNl?=
 =?utf-8?B?dDlMNTRXcEgrQ21kT0FXL2ZKUkgwRktpWTdDL1pwd1c4bytVeGM3WjhoRzhl?=
 =?utf-8?B?L2xZS0hrMjlzRFoxUEkzaEU0T3BQT05ZYzBZUm9jVTJEZkVjU01hVm5oS3Rm?=
 =?utf-8?B?OW9DUHJSL0o5Nk82QWgvR2UzaG1xYk1EN2d0TVZjZUw2UkZEblZ5bzkrZUpR?=
 =?utf-8?B?RTNGU3owS3dEeW0vN3RYUHZZYVhoTktrSXRjUGFwN3dodmJmbUh0RCtDcU1Y?=
 =?utf-8?B?dXMyK3FXWXpvL05jdXJUWjNtdlJId3BzS3IvQ2t5TWJncE5YeGJsTlRsWE5h?=
 =?utf-8?B?aEVJR0tFdnh6NzlaTUd0Tld3cFVrNk5aY3J5UlJKbkR0RkdrSGUwTU5zaStC?=
 =?utf-8?B?LzhDMUZHei9SZmpWbFhQeWljRURnK3RhWlkweHQ4UExDckMyNkphcjlYWTNF?=
 =?utf-8?B?L2lmcG5mZ3k4R21rNTI5YWd5ZGZEd1ZBaUN2WmxTUmpLbVB4R3dMNnRBM0tm?=
 =?utf-8?B?Zjc2WWZIRjhHT3hqeXFYZ3lEWE5LQTRWUGFrZEZsdXpOdUMwditseWZvUDBE?=
 =?utf-8?B?d1AvYWY1SVo1UFVCQ0hVaVNrcVh5MjVmUUEzbnl4TnBIbXNvTjgzWkxaQnlh?=
 =?utf-8?B?VnRVcVFUcHdzUTBUTU42b1ZuT3BMaXc0dVJPZ29sdG9kc0pNaysrL1o3MHhq?=
 =?utf-8?B?ZjlmaVVYLzhNQUhRWnpUaDZaUDdTWElJL1Z0OWFRUlFvWW9iNlNhU3YwM0Qz?=
 =?utf-8?B?MG5CS2RndFBhVllMK0RHSHpNRW0renZrWEIvaEtHZHM2WGMxZEtuV2pjRFMz?=
 =?utf-8?B?RkduOU5xVVFTSGM2U1UwczBvNUpBM2tzWWgvZXJNaGVSVEpUWEdaZzlLeVR5?=
 =?utf-8?B?c3l4Vmt3cktQd0ZEQ2JMUElSVXpsWWZlQzZsTkhXM2xVRWF2WTBJNGVTWUNv?=
 =?utf-8?B?dUt4R2cyZG5WUTVpaEgyS2lNd0h1ckFmMGFhRkgvUG1DL21HY01GVm9QNWdm?=
 =?utf-8?B?MExkalRWWWRJbWVMRFJwRkJSZWpOdkVIMi9UNmQ4VHhvQkpvcHRDZ25JRU93?=
 =?utf-8?B?VjlLcHQzWWkveG1reVo2QnBOdklsWjVNQ1F5cTZ5WTErMmtUeGhBeUVNSGpK?=
 =?utf-8?B?WFJqUnZ1Si8yeWUwMElTbE9SWFJYMHZpS0U3U3RUb2NENTNQdXJtRW9USDhw?=
 =?utf-8?B?dnVsVzdKcll2MEJEMnFMajVDbEw4KzB4Z3kwTG1BWDhNWm00Ynl0c0pON1Fw?=
 =?utf-8?B?TUF3Z2dVOTlSS2dIMVAwRTdUSjlBNURXSkRuWG1BK2NWS3p0N1VHNFJxaGtR?=
 =?utf-8?Q?HKaXzeFXtns=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3hjeW95a1ZFZk1ZSlVkYWs1RHgvSDZLb0VidWh5RFE3bG0vajFaYmV1NkZF?=
 =?utf-8?B?eFJieG52QUlFR3J4Z3haeFVWUlNYV3pmSnFvSVBSWmREcldrSmJzbTluelhW?=
 =?utf-8?B?ZXRTZmFQL29lTFJqYzhYQ1puU0VoY2F0T1hHbHlwWGU0dFI0VmhSQlRvU1Fs?=
 =?utf-8?B?a2xNZmExRXpLcDFyNTZJNzJlSUN1akE5NDJOR0pRRi96ZnpRam5nTmFJY1dn?=
 =?utf-8?B?V3dOanpob1Jid2ROSUExWGNYSFhoNVQ1ODJSUTlUeW9JaWpnUStHbEFCcmc2?=
 =?utf-8?B?emRoRzVzWk4zMDFFT1A5bzcvOUJJUUIwNXNJNFVBVkVWaURGZTZFeWIzTkEx?=
 =?utf-8?B?RlJ4VEZZcHFJSGx3YkNzOEFNMVpzbkk2dmx5UENYbGxtTVpqOW9RVVY3NjEx?=
 =?utf-8?B?NXNRWE1lQ3MwVnlJcFRVRFJDd1RYbEJJWTRsdmVHdWs0VW5admp1c2V2blI2?=
 =?utf-8?B?RUlxeFU4SUlqQWwxNWFzU1N1Z24ydHVQcmhEaGt5U29Qc0tkNmhPcUk3VGQw?=
 =?utf-8?B?U2cvWU5pT0dCVmQ5MEhkM01qNEl4b0NJaTV2MmxCcVhIY1V2elNIU3FiWGQ3?=
 =?utf-8?B?bS9ueGE0Q0hBTmloRllMRnZmeWVobHZXZmdwc01mVnZqdEM3eVdCWDloK3U3?=
 =?utf-8?B?TzdUUEs5cFIwVFNLbEE2Ykg5V2QxdS9ZaHVuNXNZN1BNc0dlZ001NjFPMWdm?=
 =?utf-8?B?cm5pQ21zUURSU3RwZUJjM1hzODNlMkVZckEwRnZzSUkwTGs5dnBmUXNWNHU5?=
 =?utf-8?B?SElhR2NlTmVUM1pWQWNUbFhjUm1PRWFUOGlnd0NtTVNyVWlhaU9vak93bWhC?=
 =?utf-8?B?ZzEyRXhpTGF1bzJRQzF1UEwyc29hdTB5RkZJeWI3NVQwZmV3QlRROWZ5UHo2?=
 =?utf-8?B?Mk0rTVFTd0NmZ01DK0o0ZnEyamRaR0kvVHdVams4MCt4RStnU2UrdEVEbi9I?=
 =?utf-8?B?R0dGdHIxVERJdWN5bmZGbmVUVVBXZThsTHVpdUlsR3pXZk15ZWFMMFlmazJN?=
 =?utf-8?B?d3V6ZGlaclQ5c2JiSjY1WUZWN2dlR2hvdVR3VHBFNStMRzFUVExxQjVISWhy?=
 =?utf-8?B?UHJ5S292QkVkNGQ0WkNNdXU4QzN0NE51SzRVNkFlai9yc0lUb3VScFI1cUtK?=
 =?utf-8?B?aHFQcFl5elh5Qjk4dWYxM1hKemVVRHFuYk9YR3g2VjZ2Vk1sMnVlWGN0RnZN?=
 =?utf-8?B?QnU2S3hPRmtLVGR4MU5KUVQ1Q2FVTDJ3YjE3NllTb2xzZFBPY2h3RzZZa3I3?=
 =?utf-8?B?c0h3d1ZybGE3cGR0Ni95WDZJZCtXbFhtM201SVlteUZKcmh6cjIvbldDYWN1?=
 =?utf-8?B?QkdxUjdUbnQ4OG9PYzVPcHNwVlNpdXZBVDVtSzhMOWZHdmNCZG1lNzBNQkIz?=
 =?utf-8?B?QzdBZ2J4TitZTkU1NGQ1L2o2dEtzamNZRGNGd3FjbnBzOWNsTmNVMWU4azVO?=
 =?utf-8?B?dUxOYTJOUE1vVE9QWURtaDN5R09RWFJGYWZlREFwdGVJK1NKc2trVXF5NGQ1?=
 =?utf-8?B?cmNrb0tlK3pGRHFIdTloMGtOQW4vdWR1K3BoR3daVmsxM29vaGVvUFpLMEd2?=
 =?utf-8?B?T1NLWTNZU1N2U3dROTN5Q3ZUU0FZLzhtUFBYU3p6Y2ZteThvU3ZVTjJvL0d6?=
 =?utf-8?B?STMxdUN5Q01XcGNyUmJtMGRIVm1RWk4rMHU0eldXM20wQU9KZ0VZYzI1all3?=
 =?utf-8?B?dXZTb0w5TUVRNEVnWUx1S3pvdmd5aGJwUlk3U2VQc3RTcjV6ZGFwQzE1TVQ1?=
 =?utf-8?B?NmxOWHVuUUI0ODAyU1FNQkptTnB1ajZBdUVVeVhBZ2NFWkQ3Z2JLZWI4UEh4?=
 =?utf-8?B?VnN1aVNqYnMrRyt6VEFsa1Jua0wxZDdpbzFVbkw5OHQ4dXpGQXdwRTIxQS94?=
 =?utf-8?B?RDNOWGtRbEhDYzNZbW8xSnVMWk9sc0JnYjNUSUplMDdLUmpwSEhJcVRqalY1?=
 =?utf-8?B?UVVZZTd3cjBmV0JXM0JtZGc5MnB0SGo2c2lscXBjT0xnSnJBajNXVGJhK2hm?=
 =?utf-8?B?NXQ0ai9ZNVhPQ3diYUJDNkN4WCtVNWhXY1JlRm9lNUMwKzFra0ZlZHJNWEt5?=
 =?utf-8?B?d0NZQjdoN0JyUm85SjlFT0ZLUTVudVpuMENjWndxMzRGM1BmL0szdE5xQUdY?=
 =?utf-8?Q?jRPoqlcm3A1OZ4BxzKRit6slN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb5d2c4-2fc6-4234-9f00-08dd99b00039
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 04:12:15.7092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkTVGREYMgGq29H8oQDJ+otLN4crqfVXPEi9MLg+ssBD9t2GtHQCB8+41LEg0JkkZXTePoniQU4YNOJewvaJyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079

Hi Arnd,


On 5/22/2025 8:08 PM, Arnd Bergmann wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_HWMON is built as a loadable module, the HSMP drivers
> cannot be built-in:
>
> ERROR: modpost: "hsmp_create_sensor" [drivers/platform/x86/amd/hsmp/amd_hsmp.ko] undefined!
> ERROR: modpost: "hsmp_create_sensor" [drivers/platform/x86/amd/hsmp/hsmp_acpi.ko] undefined!
>
> Enforce that through the usual Kconfig dependnecy trick.
>
> Fixes: 92c025db52bb ("platform/x86/amd/hsmp: Report power via hwmon sensors")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/platform/x86/amd/hsmp/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index d6f7a62d55b5..2911120792e8 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -12,6 +12,7 @@ menu "AMD HSMP Driver"
>   config AMD_HSMP_ACPI
>          tristate "AMD HSMP ACPI device driver"
>          depends on ACPI
> +       depends on HWMON || !HWMON


Thanks for sending this fix.  I verified it.

Along with this  fix, I will change IS_REACHABLE() to IS_ENABLED() in 
hsmp.h as its not necessary and send v2 of this patch.

-#if IS_REACHABLE(CONFIG_HWMON)
+#if IS_ENABLED(CONFIG_HWMON)
  int hsmp_create_sensor(struct device *dev, u16 sock_ind);
  #else
static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { 
return 0; }
#endif

>          select AMD_HSMP
>          help
>            Host System Management Port (HSMP) interface is a mailbox interface
> @@ -29,6 +30,7 @@ config AMD_HSMP_ACPI
>
>   config AMD_HSMP_PLAT
>          tristate "AMD HSMP platform device driver"
> +       depends on HWMON || !HWMON
>          select AMD_HSMP
>          help
>            Host System Management Port (HSMP) interface is a mailbox interface
> --
> 2.39.5


Thanks and Regards,

Suma


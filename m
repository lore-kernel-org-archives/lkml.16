Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC32028373;
	Thu,  8 May 2025 23:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745562; cv=fail; b=O2YPlml19No3j3XIAcfDv/Z6ZFtwDG3QODnghDdVz8/TkRByKOFD0PLShE0RjblQ1T6rkQ2YjSrwj3+jkqgmiVq6BJLSLAR6ENxM7qsLBxAiBhiAqmB6r9pDKpIaaJS1JT4TzBpZUw26KrteT9TswhWQomtm5Vinvl4rLPjcogo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745562; c=relaxed/simple;
	bh=NICxbyxxbawW/Uo4jNuyQnw8xbs7R0CEAZcVZ5RLpNU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UL7e4RWX+1QefwC4bmzwPzXEUeEO8revkR4ku0SQsi36wYzMQg7JcqIKRjf74yNZE7PDlMZTxdmiZqRfRGmlWch9LD8GM9t7PzIZTpCySQP9n/ZuPlMSW1PtgxDiSqqPuy2O2SWVJEH2nLOvDHyMMNKDWdPg/3SxKhGPyzPOJHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oiAgq5c0; arc=fail smtp.client-ip=40.107.92.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oiAgq5c0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tz1vibaPtMiE1V4Is6udwqsRO3qn/6kiULmAepO8rbhzlawfos61l7l9hICl6hrERRSURLk6ZK1LTZEFIuvzCkRC8mmSpMM/sTNLKUfR1ypHPJ3YkgqAN19RSVUlX9VPXGLRPjxq++61KMCORoHPbgc81rnvj/fkNwbcL8Ki4eo42EwGD5UrWiXKCYeb1hWjZOI5Z/Pfu0Y8NAPyJoqswLE3YId8M+wqOM8gg0cUajd/f+7ns1Mo/OnLPb3pXVYWju2P2zfQ4PDw/zAWiFDiNX/I54XCyva5kkpN7K5sd+h5EyShwR64Q3ebTPyZhyASN2Cq9QJiN6UaS0EWtXrAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6cYkAMOgYj+7HOty4P3zrLSgHCveaa6RKBUFcPC4Lw=;
 b=st3QlF5z4miCO8UJt5fnXQusCgn/098pX0M81wXk+h53neY2Y/6+WeZ5vsx6DBDW8YWSH6nUTiADz4PMffffjj29MJuzD4yZYnNDnyshiWdqF+WUldjte5J8+fDwlYQMDvNqNGHG/+dZfMyyZR9yoRBkkxj1ZCX4F1mFTfLLFcEHvf3+Yys5kzMzODgdE4Y7mEfVcgUkWq5jLaZ0PrFglT6RQVadGE+kL8PgOdQTOQxlPAxdvQhHs8Eb6n1SDHIHRO5dvkylk/1XkJy5U4y/GngYHnsjn9mp9A6tLBL6oNDCwWVPfRJsfsCJTA+tjweug1kf3eXoUdsnjdXxClin2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6cYkAMOgYj+7HOty4P3zrLSgHCveaa6RKBUFcPC4Lw=;
 b=oiAgq5c0P6Rked+ezKQmI3LMjShpdRSshCC8yXd/dNfSq6Ni5r0fvPMuR22ND6l3oX7KncjtGV87qFTfBt47/M4iC/5IyFB2pE3mNDNdlirsvn6G2XEV7TWsjshb/jFpKh1hs2HuvZxiHYcv/L+ljdDHCxyxfmDEt1a3A5gnLms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.21; Thu, 8 May 2025 23:05:54 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8678.028; Thu, 8 May 2025
 23:05:54 +0000
Message-ID: <8d892845-e134-4553-a6af-55d785c1ae98@amd.com>
Date: Thu, 8 May 2025 19:05:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
 <9c99a76d-8fe4-4793-8036-67d2923a1e51@amd.com>
 <aBxEzgtNs8JD3TEt@valkosipuli.retiisi.eu>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <aBxEzgtNs8JD3TEt@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::23) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e5cf0a-1c34-450e-13a6-08dd8e84e256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWRJRmlFRlFTOU1idWd2cjBMKzc3WTlmZjNpYkU5UnRPYkUvaE1RVURlK3dO?=
 =?utf-8?B?OWdRWkhYQzk1L2tBQ0JSQ0pac3lhQm1LY1ZOQlhvOWVGRnJHUGFSYldYTkpq?=
 =?utf-8?B?MFNlMnY4clR4MExIUFZvSmFyMnczTXM2dmxXbWxqZmJqUnp3MUwreUJZcFMy?=
 =?utf-8?B?bDQ4QktIejZRRTJwZVF1b3ltMlNaVnM5NkpOTkNoMzJUUXk0ZUhEalNLS3Zt?=
 =?utf-8?B?UWRqOGx3ODVaUTJhK0ptSGtqMWh3aGlkYmhoQ3pySHhBem42M3N2VkpqM0Jh?=
 =?utf-8?B?MnZNcXV3YS9Fa21abkNCcjNxWHQzVmtPN2R4T2NjTDRINXFjc3dqL1VvdVJh?=
 =?utf-8?B?akJCMjF1bEc0YkhxRTJ2RURUSFBvWHhmV3E0TkFncHF1QU1rRThhOE1sNDRO?=
 =?utf-8?B?NkRnenVOZnB6anJ5RFlzaER4SXVPeVBOZzRNLytkUzNYVGhFem1MalI1ak5I?=
 =?utf-8?B?eEgyc2k3QzZuNUZjc04zdU9iOVlUWnJUa1l3dXlseTlXVjdSdjlORWx0QWFm?=
 =?utf-8?B?a2Z2YXcyMWNkSXJVNXVRdEd0aUNvRUZKT0MwK3RGOUcwVXlYeWN6S3FHR2t2?=
 =?utf-8?B?S0pjM1E3VG1nMUozR0NIamxBRXhVT0gzY3lsZVk5czdXYjJuTU9vYVFsSXFn?=
 =?utf-8?B?Z3cyZW9zdXVZQUdSR3JvZUJXRFBua2V4enFxMWFEUGVDMGpLREFidnJIWk5H?=
 =?utf-8?B?VUZIOFR6OGIvbG41QXVXSDU5cW1SbG81eWdGOG1nR2VUMTBMaUFEREVsSDVQ?=
 =?utf-8?B?L0puNzNlcEQxdEdremF3UTZzQjJSWHNyQnZXNjJyYkx4bHB1eXVBY1AyZVk2?=
 =?utf-8?B?ZWJxNGg2K3g1NHNockxjd3Bsa3F4c2pHMEVmbTZUT0pzT2FtRFVGeDZqWUF6?=
 =?utf-8?B?ZjhPQ2JFQ2hMQjJXcTNrWVFDYmFYdGxPSDAwMlQ1YnBoT1RkYzJjVmZERWg5?=
 =?utf-8?B?a0pZbkhGTjZtMm1sWDRjb1ZVQXlMdS9ha3Z4TllPNmFQU3NyTUdnWEtpSk5M?=
 =?utf-8?B?T2dVeFhvcFhqcThOZlpoblR2WDYwek82cTJ3NWErY0xLdURyODdUUDJ3aklY?=
 =?utf-8?B?bE1lY1RGUm44YjFoTTVmVTN5dURERjdtdk0vNmcyWnZTZEVkREsxcXBRZVFm?=
 =?utf-8?B?UldkaEZqeUJOd2tTby9oc2N3MElEeG9pa0wyOHdWdmVOODIrVWxjZG9kL2U2?=
 =?utf-8?B?dlMyOXRwT2xlZ1RXRlRSaHdxOG4yQks5UlY2VUtZOXRtQzlqVkIrUUw0RStB?=
 =?utf-8?B?MDNyaGFkbFRUTEdFRjhwZk1qQUpLWEFEY1BmSTRXbUJEMWNISEFNa2FCOHFq?=
 =?utf-8?B?NnZJN2tIaFpTZ25UNUMwNXJMaEo4QW9HL1RtVkpTZzZrNW5oYWw1cERtVGRI?=
 =?utf-8?B?aFZ3ZG5MUW9aT3RPdndBSFJnZFdtdU5GOFhjQ1NKSUM5N3NjOUlqSHdDL2lU?=
 =?utf-8?B?V202dFJQSEdtUTRjMlRMUUgrWmljT0RhdTFOM2JORURJRzkrSm5LS0JNaDFG?=
 =?utf-8?B?ZlluNElFRktkT2xJd2ZLR1hjSE02bXJVdmYvZDQ0dFBjOVNhcEo0SFphaE1Z?=
 =?utf-8?B?SU5OaFpIcDlYaTY1dTJaeC9tbkE4OUVVd2VseFFFa0hkS21WY0xENVJ4czlI?=
 =?utf-8?B?RDN5blVJZytCWVFOUWdya0o4NlVSNk1tM2NCa2M0UXVMa2dvUExSUU1HcmJ4?=
 =?utf-8?B?ZVEyejZMWHY3djFQckdHbGlUbExFSHFsOFdGU1NhanF6aGFtQWd2UWVYeGIz?=
 =?utf-8?B?R0I3U2xxWXdNcHFJdlI4NFZnRmFtSHZyL0U2TGxiSVhqZDZHZk5UOVRGMzRY?=
 =?utf-8?B?YnNPV1ZFVWZIWHZFbU1MbFhORVVQT0tCQXJhbGhLQWE1SUlvQnFBYmhLamNM?=
 =?utf-8?B?OEp1dUNUYzRHYWR3aUN6RzdnT1M2MEJaaU5xT0JpeFpycXdwM01pcHArTlVU?=
 =?utf-8?Q?kgNk211iHik=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0F0bmxqNUwzekZUeTdrUE8weG03R21nUEZxaVhtWWtOcHBGeTZxNVRXY0g2?=
 =?utf-8?B?Y29BMGpwR2I2R05vNEpmazR1YUdiVEZoQWovYWtOREs0MWFPeUxsQlVWZy9J?=
 =?utf-8?B?OVdpaVJSNm1iZFVMM3lUQ2ljNVJMSW1RV21GNXUyeXBjUm9hOEVYdG5FdnVT?=
 =?utf-8?B?R0tRVCtiSVZtYnJKS0VVMGd1dzR4TmRlUldneEpwYWpWQ1NOenBJKzRJcEcx?=
 =?utf-8?B?YysvYVI4b1V3RnZBQTNOaXhYaXVDMlNIOXdMRG8zeVpIU3hjb2JhMlF3TmZa?=
 =?utf-8?B?djlyN09HYXdYUFFmSGpqdlIrSTBxZHM2MFpTL2ZJbXREVFNpVkl3MDIwT0hx?=
 =?utf-8?B?VWZrNExlcjVhT09ZRDl2bGRUTjR5TVhNVnJQUDFpOFlTYUhVNS80SjFXdExB?=
 =?utf-8?B?WHIwRzJlVEtIZDhhUm05YlZxcmhWRHhqTE8xMndJV1VpWmNmelplUkgrSTNR?=
 =?utf-8?B?a09hTUNacWVySGgvUk9qU3IySXM3U3krYWNMVm94dUIwQ3Ava1AwS01GTHh0?=
 =?utf-8?B?dVFVUkcvTW9RS2lhdG5vUzRjb28wRGFDWDR2c3BHWFMzc09Lay9YNFVHeXpa?=
 =?utf-8?B?dzlOb3JqYndOMzNranM1UDNpN25xcVBYTEpWbXlIcHY1R1pGTFlwcVJHamVK?=
 =?utf-8?B?UVFhZnpFcXZSU3B2NHlYYlJ1S1dVcGt4WXErZk4rVDBZWGNnRmhZRzVXSk1Y?=
 =?utf-8?B?ZkR2YTBPSzh5QXVPZ1BZb2pORitrTnFyZFFMSFRCSjM3MlVzQlBlN3RqWm5j?=
 =?utf-8?B?RklaekdRbTZoMUtIRm1Nb0wxS2pjWDNIY21TM1M1RG85M3NMTTM5LzNpa2ZQ?=
 =?utf-8?B?UzRHbHVndU1VaW9GbVAvRmtUdnJ5V0ozdHFxNXdYQ3RwMFJQK09ZZ05EZ2Rq?=
 =?utf-8?B?RXIwaVVVZEpuUWdURCtwK0J2YUhmUlRzak5WTnpJV1BRakdSUjFHaS9DNFd6?=
 =?utf-8?B?YUlVR2J6a3hybTdBb2p4OWlBelFiN2NmMEJ0cnV0QjVQNnduUHZmZThPTktR?=
 =?utf-8?B?bWl4b3pwZ2ZZc0dIMHR3Mkt5SGNRSFJYV2dlZ1ZXbjQyRmRub0Q5ck1nWnI4?=
 =?utf-8?B?czBoZUdhVW5qVklndXFBZWM5ZzNZd3ZPbFVCemlvWlRIdkJOc2x4Vlg0ZHJj?=
 =?utf-8?B?TXlsYllHNHQ1WTBpL0JFMm0xd1kzR1Zob2IxeVFUMEpBeTBHUnhTTlNlVXhY?=
 =?utf-8?B?dzM3VkFsb01XaGNIVXBzWTBrOXRqeVpYeFNXSjJYT3BHMjdBdGZNSmtkMFlh?=
 =?utf-8?B?UnlzcXdBSGpzUStyOVBPazJlM3lTOFV3L1orcFZZS2RVZDZnWThORzdibjlz?=
 =?utf-8?B?NWFUdmI1aU5Ma1BGUC95akkycWxvdUppTlNiWjBtVXlBb3V4WTlueFRuMnRX?=
 =?utf-8?B?RXBWY21lamg5dnFZcnBjQ1dLZFhlS2NDeEVhSXUvdGh4eXBqaHI1L2JtdWpW?=
 =?utf-8?B?cWxuWmNGL2ZNcFUyZ21NZjl4SmZ3S0ZDenBKclVGYWRKVHVkYmYzR0ZJRXZF?=
 =?utf-8?B?TjZwYXZySGk0cFRkT05Sb3dBaWpjUFhya0k4aDR1MEpoWm5VaHJnWHovTWl5?=
 =?utf-8?B?S1RVa1Q1WnE2NjJUVWEwMEd4ckRmcGF5Uk5mK3ZUaUg5TjkzczBjQldCdnRl?=
 =?utf-8?B?b2g1dmRRMGdaOHJscTdZTHhjL0hvZmhXd082QVozb2I3L09raVdncnRxdjdG?=
 =?utf-8?B?WXJoaWo3OGxrMEl1a04zUHdzWmlqUXorWjZvTWZpcENBaWRoRzRXNG1IcFBG?=
 =?utf-8?B?dVNlbHA4SkJrNC95ZWxYaXRSUlpQR0hhNFljczNLNzB4SkJwNHczRlZMTEh3?=
 =?utf-8?B?NWVyVjI5UHIwMmV5ektjWGNwWHRyUDdVdlc0bzRHdVVMOFJFVG9SZkJCeUkw?=
 =?utf-8?B?ZHlYMDltbzNORTNtNklrYmJRRjRHMDBvTm5PbDkzekVDbTlFSFBtdVVFS1kx?=
 =?utf-8?B?a1hyREtPWkJmWCs5bklDdVNRSkxZekYyR0wvOUhiYzRyRldFemhWY0JYRUIz?=
 =?utf-8?B?aWVTL0F1MVpJRFVJQUdldEhtNHp0ZEc4SHVGako5dXVDVXMySFF1WFhCQUls?=
 =?utf-8?B?cGo5THRoK1hnMlViV0p3c0Q3WGR2L3VIV05oczcwaFJHWURkaGkvZ3lvL0JG?=
 =?utf-8?Q?WSEAYe+CQ/x7umQeTUulL5CVX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e5cf0a-1c34-450e-13a6-08dd8e84e256
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 23:05:54.2833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+SG+lFSZXryVfL7OFBmq3sorY7Htsbg7i045gjRzLhDA8p8B2hkOMahgXUQdOmbEWYy/RR2DXNfsMC3SRNNhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330

Hi Sakari,

On 5/8/2025 1:44 AM, Sakari Ailus wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> On Wed, May 07, 2025 at 04:16:04PM -0400, Nirujogi, Pratap wrote:
>>>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>>>> new file mode 100644
>>>> index 000000000000..1520ebb94507
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>>> @@ -0,0 +1,280 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * AMD ISP platform driver for sensor i2-client instantiation
>>>> + *
>>>> + * Copyright 2025 Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/property.h>
>>>> +#include <linux/units.h>
>>>> +
>>>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>>>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>>>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>>>
>>> What's the purpose of this _HID and is it present on actual firmware
>>> implementation? There's no such ACPI vendor ID as "OMNI".
>>>
>> The (_HID, "OMNI5C10") is used to check if the OV05C10 ACPI device is
>> actually present before creating the AMD ISP4 platform driver. Yes, ACPI
>> entry is present for OV05C10 sensor in _SB/CAMF.
>>
>>       Scope (_SB)
>>       {
>>           Device (CAMF)
>>           {
>>               Name (_HID, "OMNI5C10")  // _HID: Hardware ID
> 
> Please tell your BIOS folks this ACPI ID is invalid. In the future, either
> allocate one yourself with your own vendor ID or get one from the sensor
> vendor, which they would have allocated using their own ACPI vendor ID.
> 
Thanks for the feedback. I will share it with the BIOS team and make 
sure its taken into account for future models.

Thanks,
Pratap

>>               Name (_DDN, "OV05C-RGB")  // _DDN: DOS Device Name
>>               Name (_SUB, "OV05C")  // _SUB: Subsystem ID
>>
>>
>>>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>>>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>>>> +
>>>> +/*
>>>> + * AMD ISP platform definition to configure the device properties
>>>> + * missing in the ACPI table.
>>>> + */
>>>> +struct amdisp_platform {
>>>> +     struct i2c_board_info board_info;
>>>> +     struct notifier_block i2c_nb;
>>>> +     struct i2c_client *i2c_dev;
>>>> +     struct mutex lock; /* protects i2c client creation */
>>>> +};
>>>> +
>>>> +/* Top-level OV05C10 camera node property table */
>>>> +static const struct property_entry ov05c10_camera_props[] = {
>>>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>>>> +     { }
>>>> +};
>>>> +
>>>> +/* Root AMD ISP OV05C10 camera node definition */
>>>> +static const struct software_node camera_node = {
>>>> +     .name = AMDISP_OV05C10_HID,
>>>> +     .properties = ov05c10_camera_props,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>>>> + * ports node for OV05C10.
>>>> + */
>>>> +static const struct software_node ports = {
>>>> +     .name = "ports",
>>>> +     .parent = &camera_node,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>>>> + * port node for OV05C10.
>>>> + */
>>>> +static const struct software_node port_node = {
>>>> +     .name = "port@",
>>>> +     .parent = &ports,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Remote endpoint AMD ISP node definition. No properties defined for
>>>> + * remote endpoint node for OV05C10.
>>>
>>> How will this scale? Can you use other sensors with this ISP? Although if
>>> you get little from firmware, there's not much you can do. That being said,
>>> switching to DisCo for Imaging could be an easier step in this case.
>>>
>> the scope of this driver is limited to ov05c10, and it can be enhanced to
>> support other sensor modules in future.
>>
>> Sorry, I'm not familiar with the term DisCo. Could you please elaborate.
> 
> See my reply to Hans.
> 
> --
> Regards,
> 
> Sakari Ailus


Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3B91BDCF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 21:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745098066; cv=fail; b=Sx2ZHN2ZgM6+5eLmQ6Vk4JSoSjCtamQM8VEsgPb51WiRrjsEioNzCvvZh7KSA+yMI8GIrZZ2I0e8Sfdl3mkiSQZLU5V3pMbZU2UQy3+mdXncAg86ov56boTyGBMzUb5biPLKwXGqS32RZqqfSFlCUOKD7mWj+fE9tkCI/Rb6IhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745098066; c=relaxed/simple;
	bh=NksLoU4hyQw1tHYVxx5k3Xxwge+2Wy93gOppDf20ZWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VoRCA5G1qG/WpLiCZyafC0tlOFdPbJkKcOv89Zod3InSreuKFvFbz8QSOW27B7iM9FyoKdmYX1OtyxPf+NyyL5Q4zXUdONuZxRu2xt2+mSPfUEyWSsL7+5JAnlZzDbse1/PMwGfeCv3iekK4hykZc/y3EcAzFvRE50dAcndEc+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SZ6IEhQJ; arc=fail smtp.client-ip=40.107.243.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SZ6IEhQJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUEV5GUphM099nw0e2h80cOtsILzT3o0ZQ3zKxgyZ8JA0HjKvXU+p3ilg/gYTXycu8iSmoDhU0cx7PiVvRcmKbxCs37ZHdvEWh6/XwJzSEMl0qB6S7cG2Hqj5ivgDvbHruVVvgaa5rqs/qq7EmmlYEbdIp1RMoeI/l9mDK6AitOMx/oQmy1Niv4gSdguTa8lh2OAkdszyb3qnzpLiaZqEL2MPOA2iISWUG/MEVy1LODK+QVA8dwZFZrv3vYu0y+iSDiXT14E68CIdynZDMla3Rv/EBX1T+8JGv6ymK5Nyhw+X/JjxysVtNlPd36wrpBj7KFiapGkTZ2kLAsADX5KdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COPtKUE8RPKmM1OjBjXSlvCBml4N55TlSESwlcbZEsY=;
 b=BnYcQ2xliKOF0IDva1RtP25WqSXp3wo4hOe9iUx+rDANTXsvyGZpcz6CxNcmgnRcl4q1wy+MyIFQ9tHEgScLqw9OhuXoQAIGCuMYVCnWfLlxbCcIaAwW6fmngL4GeoT4uAheKPWI5Yo8h3n314dbw/1U3iUPacbnGYFZntLl7BGPyFjwKwrr2CK1vgXNJAbzTv00gyeVyLGS8kKO4Dp51eNmgsGjdWPB/74C/jGMLhcD8cYRQXbSmsGzYsAAF37QbpVpLK+GpgPVxgmHe/kh8Zj0HuxaCK5UlNcEI1v37jt1p4i/bvfyhJRgzkMFBy8LJgRjq2uk/Gm3W2Kh8qDSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COPtKUE8RPKmM1OjBjXSlvCBml4N55TlSESwlcbZEsY=;
 b=SZ6IEhQJP3R8e80uO7TwYUJYkggAp+B3hOE9/7tnRK2lFIUJJN0qt1DkGN4gIKO6oHkoTPO5RBVuCNDRmElndXZ7Idyo0NrhJobysw4mtTRsCLwNU7WAGVKkT16VO+qBdGcCgQ+oiYvAc1dVeDav8R5abmNAn6g5+ScPoRHhqdEr8Fh6pCZcgAhSuZLw2ru9R1JhKmQonkVBUMU7/A26slmjmB8I7jhWXasiv8drkhGpq+mZRMyfDjDnDfsfIrVYXlLMSrpBhYLf0yTIA1JD/SNd2slxfKP+3QSNUwv94kdtjNrRv9qx62lv7JTElgiZnCFSGHrT23SuFhY5Lzk09w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Sat, 19 Apr
 2025 21:27:42 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.022; Sat, 19 Apr 2025
 21:27:42 +0000
Date: Sat, 19 Apr 2025 23:27:34 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Track currently locked rq
Message-ID: <aAQVRhs_y-dxC4yE@gpd3>
References: <20250419123536.154469-1-arighi@nvidia.com>
 <20250419123536.154469-2-arighi@nvidia.com>
 <aAPemAFUsJaF_C2X@slm.duckdns.org>
 <aAQDIIPOUAU-nB_F@gpd3>
 <aAQH6Q9tTmLvozyv@gpd3>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAQH6Q9tTmLvozyv@gpd3>
X-ClientProxiedBy: ZR2P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::12) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|LV2PR12MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: e47eb96a-07a0-445f-fc7e-08dd7f89048e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2wvMytCbTRMaXZwbnF6VHRGVkZYZmxFTDZCaitIanZaRlErSnRWUjRUSjZt?=
 =?utf-8?B?bFByajRoTTYwUThaTk5YMGp0bjRGc3JwMys1Uk05M1U3SXJuckRHZFdWaG9P?=
 =?utf-8?B?Y3V1OGxoTFRab0hmU1IwYWdPRHFyWlk3QzlFUkkvNGJYeHVXaG1SYjU0V0RN?=
 =?utf-8?B?K3p3eXBkMHpDVHZxMm56bHJ1MTNHdTlrY3FlRXFGWFAwYnVHZ242cXpnMFVu?=
 =?utf-8?B?L2FCMkJCZDdaZjNYVEJiRmZqenc1RlFIK0pxU0hmN1Z1N3pkL3Z2SWV3THdE?=
 =?utf-8?B?RzRWMlc4YlpOQ0hkWktyUjJoWTdPS1AzOGhaVnJsWGN4T3A1dGVEdmFPbVRw?=
 =?utf-8?B?NTAyNFhwTDNOYS91UzZ3ZVFHdWtCMmxKUDQzN2xMcDZ2cmFBVVdKaVpDc0JW?=
 =?utf-8?B?Yjk3T2tweWN3ZDR3VWVkdlpMYng3WitYaFRVdHJSNEFhdjU2dGlqZlh3WU5L?=
 =?utf-8?B?SXlaUFBEbU5WTERQQUlBS3pjSk54S2xQZ0FCamxoZlFRQmFLMndBM2lPblFm?=
 =?utf-8?B?NFhyYWEvYytoUkRwczdQOWtCd0hpTFBNTGl0aHNXVHh3OHdVZ3Q5Y3BZd0F6?=
 =?utf-8?B?WmRwN1pkOXNjOGpaSFNWdVdpR1pvR2hPdXIxSmZ6ek0zVEVNSEdLWmVlMUdV?=
 =?utf-8?B?N3dxYW15T0pHTnJSa2VaQ2ZnSC9tdk9HWGNmQjEyNHF3dUZ4WUFZdENKYnZR?=
 =?utf-8?B?NFpualBERm94ZzFlL20xRWNZenlUMkY1SnNreU1jbWtWL09NdHdhdWFWdTMw?=
 =?utf-8?B?a1hvNHBSWVd3ekY1L1ovZzBaODkwMVZxRVp6MnlDU2Zua29kVExEVzJNalJx?=
 =?utf-8?B?aXJPTW96b3BjMXlvUEw5Y000R3NNZW5HN1EyZ1VUNXdLcHNsc1paMHNUK2RY?=
 =?utf-8?B?NEU1Q0FKWEk1eHB2a2V4ZUY0UVRoeFJRR0d2VHNLWEJpbEV3M2NQOWZ1Y3Y0?=
 =?utf-8?B?NHNzb0dwMVN1R0RDeXlHRG9WeTV0OE5WcUtWM1RpUE1hRnlxWTdXWTRhZDF4?=
 =?utf-8?B?OXNhclhLc3dCWjFzc2ZkSDUrMjdtZ1cwcXFGYThURGVSbjVPZW5wSGpuOWx4?=
 =?utf-8?B?VE40YnV6SVRSdFQwaVpodktjdGl6VzM5OVZQL3hxeTZUNEF5Y3d2bWg3cnRn?=
 =?utf-8?B?UDg0NEtpSTluaUN0Ny82VWFRSjBhYkttSDh6ODFCUytKRllpQ3JBem8zUHVz?=
 =?utf-8?B?dy9RK1ZUVVRCMnJDdVdDNEtySXV5TEtDeTMydTFTT3liVjdMUjhvdFpXanhi?=
 =?utf-8?B?T3JneHJqaFpMVS92ZTExZFZpOHEycjUvcGlES2hkUjNJWTRnN0tEU1Nrby9m?=
 =?utf-8?B?dFU4OVFqaXhpTnlJeER4NmRjcTkvV1RVODI5b2cveThuOGhZZWtDbmZtT0Ro?=
 =?utf-8?B?eTVUMFpsSWxwSTN0STZEOXhJYnNFbXZ2azg5cUtBUzhGWnBqc2ovdFM4a0F3?=
 =?utf-8?B?eEh2aC9UYzJRVEphN01PVEI2MEZEYjVFZ1VhQndIbzdvWVYwbThHMElBTEpr?=
 =?utf-8?B?YmlRT21pYWs1V2JLS3lOeFdRd2JkM3ZNT0pQNmVVSTJXUkJ4OEJvdk01MlFR?=
 =?utf-8?B?S0Jva3poVUQ3bHBZRitMZUVjczZOeFdyYS9EeXJ4VDJYZGRiMm9GZENtcFI3?=
 =?utf-8?B?TVFwTCttUW85Z0praGdEQnR5ZU8ranFrVFJPM0RhbWl1Z2hEZEJKanJySTA1?=
 =?utf-8?B?NDJhTVpaVDk3TDZXUTB0ZUVERXZRdkNlVVdCd0ZhcWRFdG5KUHhkN2p4cWp1?=
 =?utf-8?B?dk1tOFdETEpMdWtsYVY5Qjh3K0VFc2FyTUtoOG1zTXhaczVOL25ySFpXUUN2?=
 =?utf-8?B?alFEVWlUa2g1a3ZBUnBMYmZRR3V1OVRoSkFBNFpHWm9ha20wc2FIY2cyaDJW?=
 =?utf-8?B?b2kwcHRKV21LZVNSU2JaREpLS0RMWHA4RUp6amY3Y1owaTQvbDAvU1dGdnps?=
 =?utf-8?Q?kIDj9VdRvAo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajRVUWFSTStSbkZVYnZLT1lCWVh0MFBqV3I4MmxCS0RaR3Z2SlJyaW5QdURT?=
 =?utf-8?B?NmlqUFY2UDltMVR2aVdBKzV0RG9BZDBqSXNORy91SlZxSDAwK0t2Z0tVY1Zo?=
 =?utf-8?B?aGFJOWhlVmtlYnhPdXNSaG5VNlcrUUFCei9TR0dWVlNWbE1QRmxMZTZIemVD?=
 =?utf-8?B?OEJwM3JPaXB0UStGb3prbWVyOWp1RGFvN3gxc1pSWnNqNU9TRGlRamJObnJU?=
 =?utf-8?B?WTBKVmYzd24vTEovNnRvS2pyMjNmQjZUTTlybXM1TDJUaEhmM1BaaGt3K1px?=
 =?utf-8?B?UGVUVWxxWXdWMjR3T0o0VkpjTDVwNllpSWJOWGpjdmFOYVBGYWM4V2RiQW9L?=
 =?utf-8?B?RnVtTGxrR3R4ODFoWWpBVnEyUlBMenhTajc0VHZXVHpHVnVnR2o5bDF0VWcy?=
 =?utf-8?B?VmVwT1dSNkZpN1Uwd3RxalAvMlE5Sk5QMk96VS9UU295NHBHaGpRSUg4REgw?=
 =?utf-8?B?VEhteVc2TmFhZUV0eGE0MVEzTXpjZDVHL2QyU1R5M1h6U042L2JZdjZKQWxG?=
 =?utf-8?B?Q3drOGxPQXc5TnRLYnpURlJlMXFwQ1BwOEVpNDJzNU1YTkZEd0ZLM2s1ZUR2?=
 =?utf-8?B?WmlZRzZzbUt4YWVISkJmd3dBa0RkMng1Y25zeUVFYWdFeTlLNTV5ejZRWTFx?=
 =?utf-8?B?bHpMN1ROOW1qMDV3QnVtM0g4bG51QXZVTmxwMkJncDZuUWpzbGRIVHViclJn?=
 =?utf-8?B?b3VWdGRHcnNHNnJDU3Z6TmVBcjBESC92cWRkR2lVcFpsTWRKbXZ1cXF0S1lt?=
 =?utf-8?B?WTV0MDROU2tMNE9PNkM1dnM5RzFXNnBEMGRHa3dOUTB1Q0QwVEs3RnoxQmZs?=
 =?utf-8?B?Y0ttS3c1Q090a0JkcENIRDB6S0lUT09yOWZKNXFOUlZrYTByV3FvYngrdTlL?=
 =?utf-8?B?T1FjNm02Q0VMUDJnRlhGYldNSDRUd2V0cWFnT2pDMFRCT2R2cVMyVFBtMmdE?=
 =?utf-8?B?QU5PZkxVRjl2L2dDL2NUaENhL2FONTB6MWJCV3BhSjBjUlFhdGZlVDIzYW5a?=
 =?utf-8?B?c2I3SThWWHlZQ0l4KzIzRnB5WVdXUWc4UGgwcllVRE1Rc3VYTW1LK2g0ejJp?=
 =?utf-8?B?Um01OFFtbVNsb2JtcEQ1eGREdStWeDNOZ1oreEVYV3ZwNzhFaHN0bFZsa3NZ?=
 =?utf-8?B?V3pqRFVnaXJXcExYb1NpQm9kdnR6UVBIakZuOEUyVXBxU0ZieHFnWXJmdlhq?=
 =?utf-8?B?RlBDWEZQK3BpUWpFTW1GTVBZWENHWWxLaHpCSC9mY2hPS0NPYzA4S0Z0VVFT?=
 =?utf-8?B?Y251V29JR3pxaytncUVpWTNoR1g4Zk1neVR4eUFYM0NnWkVvT0hoN3RRVXc3?=
 =?utf-8?B?UDVxZDgvOWRuc2JDV0VISWhxOUp5cCtZdExmdWpXQTdNbWViOWdReWtKTGtY?=
 =?utf-8?B?bEFWcE0zNzdCT0dja3hnTi9hc3pZK3FLU0RtZlgrRFdoRzRYODM5SHl6ZnJH?=
 =?utf-8?B?aUorYXNBZVdGdUtiSDl1Z0RxZm5YZHg3bnF3bmViVFcvK2FoM3NySUpUd0s0?=
 =?utf-8?B?aTQrY0JNZXhKNEhZck9XblpVMUE3L2NZTXgwR1o0UGxKVEFWZGZqV1Zha0wz?=
 =?utf-8?B?WnNGZE1DaEdSYWlTeWczeHZzbXNQTDIvbjF0dGdnY0g0eFUxaS82SlpMSXE0?=
 =?utf-8?B?V1hSUDZxVmVmVXdNOGN6cG1sRnBnYndKUlNsY0RCTVdCbjBEdEtDSCswVVBI?=
 =?utf-8?B?Y3ppeVdwQmJ5eUNCTnpyUkZ3QkR2Z1hqRUJPRjJkWUljdXIvczVEMlljV3Bx?=
 =?utf-8?B?b1BSTWkwamtHR2g5VGFUS2RFWFp5K29EL2tldG8xa2djM045NzRxV2dMSm1Y?=
 =?utf-8?B?c0hLMmdzOEk5c1hncW12SFdrM0xWWDBLNXB5NEFEcUZ6cllaMmQrbzZCZUcz?=
 =?utf-8?B?NzF2MndwQnNsUXJYeXluSXROdFRiOUw5MWdGT2hkVnNoLzkyS3JXcnloaVo2?=
 =?utf-8?B?enhQS0FLdDEvdVZ1cVo4SHNocnJQVnZlaDVXTmNZandJZEVWRkRweW5iMTdK?=
 =?utf-8?B?eFdwSmRqWkxSVnJUVHZFUEx3cHpiRURKQUxVSDh0enluNUZrbWJqVUFqeXkr?=
 =?utf-8?B?NzIwVmhac1h6WDIwOTdOVnF0SG5iUWNTYXJhM0FMVHI5V0wrRmFlaHlwN3l5?=
 =?utf-8?Q?OiP99TsgtXnWsHflgym+z5hv+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e47eb96a-07a0-445f-fc7e-08dd7f89048e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 21:27:42.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTiIQt8kgfxNiZR3Cmr0hZNUtYyMbyEyzyLKxaDvswhkHrYFjNEHXRQmB5QyNCHP6xTL/Ge91cMM3TKI/N/4uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5869

On Sat, Apr 19, 2025 at 10:30:37PM +0200, Andrea Righi wrote:
> On Sat, Apr 19, 2025 at 10:10:13PM +0200, Andrea Righi wrote:
> > On Sat, Apr 19, 2025 at 07:34:16AM -1000, Tejun Heo wrote:
> > > Hello, Andrea.
> > > 
> > > On Sat, Apr 19, 2025 at 02:24:30PM +0200, Andrea Righi wrote:
> > > > @@ -149,6 +149,7 @@ struct sched_ext_entity {
> > > >  	s32			selected_cpu;
> > > >  	u32			kf_mask;	/* see scx_kf_mask above */
> > > >  	struct task_struct	*kf_tasks[2];	/* see SCX_CALL_OP_TASK() */
> > > > +	struct rq		*locked_rq;	/* currently locked rq */
> > > 
> > > Can this be a percpu variable? While rq is locked, current can't switch out
> > > anyway and that way we don't have to increase the size of task. Note that
> > > kf_tasks[] are different in that some ops may, at least theoretically,
> > > sleep.
> > 
> > Yeah, I was debating between using a percpu variable or storing it in
> > current. I went with current just to stay consistent with kf_tasks.
> > 
> > But you're right about not to increasing the size of the task, and as you
> > pointed out, we can’t switch if the rq is locked, so a percpu variable
> > should work. I’ll update that in v2.
> 
> Hm... actually thinking more about this, a problem with the percpu variable
> is that, if no rq is locked, we could move to a different CPU and end up
> reading the wrong rq_locked via scx_locked_rq(). I don't think we want to
> preempt_disable/enable all the callbacks just to fix this... Maybe storing
> in current is a safer choice?

And if we don't want to increase the size of sched_ext_entity, we could
store the cpu of the currently locked rq, right before "disallow", like:

struct sched_ext_entity {
	struct scx_dispatch_q *    dsq;                  /*     0     8 */
	struct scx_dsq_list_node   dsq_list;             /*     8    24 */
	struct rb_node             dsq_priq __attribute__((__aligned__(8))); /*    32    24 */
	u32                        dsq_seq;              /*    56     4 */
	u32                        dsq_flags;            /*    60     4 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	u32                        flags;                /*    64     4 */
	u32                        weight;               /*    68     4 */
	s32                        sticky_cpu;           /*    72     4 */
	s32                        holding_cpu;          /*    76     4 */
	s32                        selected_cpu;         /*    80     4 */
	u32                        kf_mask;              /*    84     4 */
	struct task_struct *       kf_tasks[2];          /*    88    16 */
	atomic_long_t              ops_state;            /*   104     8 */
	struct list_head           runnable_node;        /*   112    16 */
	/* --- cacheline 2 boundary (128 bytes) --- */
	long unsigned int          runnable_at;          /*   128     8 */
	u64                        core_sched_at;        /*   136     8 */
	u64                        ddsp_dsq_id;          /*   144     8 */
	u64                        ddsp_enq_flags;       /*   152     8 */
	u64                        slice;                /*   160     8 */
	u64                        dsq_vtime;            /*   168     8 */
	int                        locked_cpu;           /*   176     4 */
	bool                       disallow;             /*   180     1 */

	/* XXX 3 bytes hole, try to pack */

	struct cgroup *            cgrp_moving_from;     /*   184     8 */
	/* --- cacheline 3 boundary (192 bytes) --- */
	struct list_head           tasks_node;           /*   192    16 */

	/* size: 208, cachelines: 4, members: 24 */
	/* sum members: 205, holes: 1, sum holes: 3 */
	/* forced alignments: 1 */
	/* last cacheline: 16 bytes */
} __attribute__((__aligned__(8)));

(before the hole was 7 bytes)

Then use cpu_rq()/cpu_of() to resolve that to/from the corresponding rq.

-Andrea

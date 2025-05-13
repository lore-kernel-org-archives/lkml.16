Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71D6199252
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152397; cv=fail; b=aGKveDThZArnbAWc4snggDOvArZSC/F7H0dP64A8qt4zwskA5E1i1i1ncrN7E2qTRjJ03LlnG3ucQhsG6SPXwt4aJXtzMUwi9z45FN4+B+xKZgK3DkslE4vUlryD6x/sAxIUSk9gGHZC+UJ892xU9lIxRNFKE0sUKszz/dHZX20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152397; c=relaxed/simple;
	bh=RyFkFqUny5Stl64qxBpwziJ4EOJV4C3AvcneSBGqyfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sHtGuPS+2OWrgDOvygfMAJcS8wMOY2ZNASA8O5eJZFzr4CMfgw9i3lzB+qAyj6iW+7TzETBjxOV7IkGfoDL+Z7X3mXwfIarZWl3l1hKE4GXdeS+IsQ0+q4KyLBWkAGgpqkizsIwZMfViFuuQAVBZl6+a45mfHcXJfMpNwKBYPNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=coqcV7DG; arc=fail smtp.client-ip=40.107.212.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="coqcV7DG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBNgECAJRhqmyqt+l+Eb1fIpHLmZYcntEeLRXxC6DVPi4jJQJkVnD4JAqy/ojHXWRYPqFRG8LOineWA5dRE5er17guxjq9l9w/NDRbFZxCZxkmuTisQ/3lHuSYIqfRHaCVzHpeLoB7HnmvVehgSXB+nuzQkMa7SBW39AJLcC/Aa4tMP82NgM6xacybIqsPDXKc5IVcbt6HYfwrHAxIAusjA4pueq9p9A/TKehu9PrDeEChfPET8aBag8Fk6kIFaReFmKcicXs6+jCaRFhprgY1OnpvFd/26uMKjF7S3AW3J721WIqcmfDvaIQ0gVqsIhWY6Y7SARypIMenuzqD5HDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DD/Ti/bhRuTODI7UKl9+/MJTCAWmFYseXH7DZh2s7e0=;
 b=woLjwZTU2hqNl1aIfOU/yCyFHNpKNZwJYa2LJsw+43o07hUid9ngolCsZW+PjCt0uNjg+GOaHpY0hM/QETJIVXrMWWT7eadNcUTYxOIDiMzjEGGd2LolcLThQUXmWxmHDtJCOR9hjc1J8HPhzeLs4VaQV66bynGrJVpt0SPonYxAzrNBRFQxVteivVWQdeEYZ5nQ+DiTnShIfN+Mij8D/Y1fvb0c5gv4rWOKy/haLY2GnEdtXzAJodRQ0yTeSZddHdm0BfrF65p8BGhqi8fEq4W9q+RMshVK+k0FgXvNrasCtNI/8jK0lXT7BhmpEpi9zPIP4dO2s9utBUYzdyKe4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DD/Ti/bhRuTODI7UKl9+/MJTCAWmFYseXH7DZh2s7e0=;
 b=coqcV7DGGQ58QRhT2kCmv8cVjwHQhi7eKBYA4mV3lZxP8sr5a/69KZSxOds3tgO29RVr55kt7p4lfTCYPS+gAr81MklnGq0hZVAO5mAEbwYpbCu8hxRKMMNAmiBiwG0zi2gAi2b8yIl5x82d7kvY/umQTb6UsBD5FxD2DCNhTAJhLLqLi2xsIqk3KIIix+3SLaMAaiMdZ9P5mGHjZyaEoKQcc2wZpvjDsstfcmowBa9GSzLG0R9i7yCtMVO4DmyZmoUUDmx+aDQPCN6hnS0Rti50+nVpvzw6X5hwk6grxZWMxsJL7SwiBoPsKd+zzfPWPN4H1AYVutuwIVQ3XbRXig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB6980.namprd12.prod.outlook.com (2603:10b6:510:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.37; Tue, 13 May
 2025 16:06:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 16:06:31 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Huang, Ying" <ying.huang@linux.alibaba.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Date: Tue, 13 May 2025 12:06:28 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <F5EEDDBD-C151-42CB-8880-CCA9A841A4DC@nvidia.com>
In-Reply-To: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::31) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a41b5ff-d7e4-40ce-d540-08dd9238200d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGhUMnBtcDcreFVMOTVLNDlyM1JqblhMeG11dm10R1pZM1d5Z1F4dU9yS2FM?=
 =?utf-8?B?U1JLUjgyeEpjUXlPSW52dUxVQXRYckFqKzdXcnE2aWpWakxqazFYWmNMTnZi?=
 =?utf-8?B?blRzUXgwK1plK3A4bUNqVjJRQzJiWm5xVm5QUjdHRmdMZXM5YnRPT1ZZMmo0?=
 =?utf-8?B?WVhxNFgxTHNjdnFyeGlOSEhDNmhUL3YzNUx6VnNvN2IrenRmVUNQUFNlRzdO?=
 =?utf-8?B?YzM0UU9zdm1tUkp6aXdJVWFQNHJyOHJUcy93R3laSWZoN3FQT1Vhc3E1VnlB?=
 =?utf-8?B?UmlVaFZHTkVaZDRWVmlyRXFPalVTa0xmS3N2dDZvNkpmV0Z0dHdtZGE0UllK?=
 =?utf-8?B?Sm5nQlBRNHNZVUc1WG85Y2RjbCsyMUFCaWZGZTJCVTZYTU1wU2psYzNkUmV0?=
 =?utf-8?B?K0w0Z3RqTFo5VkgvRUtnSEsxVERSVUxmZFdaaWpWTWJhMG5nUG05OU9HUFlL?=
 =?utf-8?B?dVBNbzh5YmorTEk4bjN3am5ybnN0eVBJVGwza2lxc29UWFNITGZqeE5tTTJY?=
 =?utf-8?B?VUlwaks1NGNHWmNIK21MWFpqSVVSWEg4dGlsMm9BTzZjTVBEYjRzQTIvVjlw?=
 =?utf-8?B?ckxCbUdKTTVrazVka1hmUU5BWm1FckVGNC9tVVVFT1JyRDFPQzJIWmN5clRC?=
 =?utf-8?B?SW5NSHFIMDBnVDFHZHhyRENPUjZsV3JqdjRCMFpBQ2lHNlVKMEJ2Z2poV0FO?=
 =?utf-8?B?emh1emFSVzBMMkhmTVp5OTh3WW9LZ2F1ZGtYa2VMMGo2N1RJaS9rZUFHaUhX?=
 =?utf-8?B?aGRZNHpWZVp2NUtJR3g1Kyt1TGgyaUZ3dlBUOG1sd1VDMnpHZlBsTzhqWFlI?=
 =?utf-8?B?RENyK2pzZFBjS2RmVDNIdDNtNDkyV2t6eUxnV2VmQ290TkRFTG1aNFd3bjBt?=
 =?utf-8?B?b2ozSGR0VGxnbTNldUFFWEZkMUd6VnkxUC9WVHpFb2haMkQzT0hzNnAzem9E?=
 =?utf-8?B?UVphYUwxRUlST0xreXNpVTRucEt3Qk9OdHlkbkxYVWxUc29aZUxYQ0prYmlQ?=
 =?utf-8?B?WVFWZ1BQcm1NaUtvdklNQWREUHc3S1o0eGVDN01VZlZWb1BSNWJzRzN5NWRP?=
 =?utf-8?B?bGVVQUkzRm1ZYk91cW9UNDh5d3Y4Z1lKSGk0d3lXMzdjTTRlVjY4R0ErOUVh?=
 =?utf-8?B?VGd6amk3b1JsaCtOdVNDUXpaU09TQ08xc2NYTDlIK1hBbFc4NlN0d3dMVSs5?=
 =?utf-8?B?T1BhSVp3UDBVNEFIcFVQNzdsQzZsUkNTek9aelFVSWZOamx4Q3oxYWxQcmdO?=
 =?utf-8?B?Vmx5MUtVdmlmRm9LdXAyT2tjblk1M01FQVRCWnovMzJ0OGFFL2t2UGhXUHg2?=
 =?utf-8?B?ckNjTjZPNVQzelBKaXJVMElPcXJYeHFJTGdJSDljVkdJOWtoOFVHT2pkUmx1?=
 =?utf-8?B?RnEzU3c1cGw1WjJHekc3TWdwTzV3YlI4MGZlSnZmQXVxOTVkeFhGOW4wTXc2?=
 =?utf-8?B?ZnlhbVFhUWd0WDNmTHQxR3ZXOExKQ0VpNVQ0NWNtOFVZRVFoZzQ3UUd0UjlS?=
 =?utf-8?B?KzdqdldMdUpXTnZiMVFzY3ZSN3Z0cE9RaTA4RFlUdytuTWVCb21QTUpLRjRN?=
 =?utf-8?B?VXkwNXpWUmNqelFjUmd5ZVRsazRkdFh6VnZQQVlKWnpZMGIrRGVqODJZOGVU?=
 =?utf-8?B?VUdUM3czUEhLSy9Ba3dFVTJNVUpDZU0rN0hOOWdnNlM3T0hVNDlrZFpaSlRJ?=
 =?utf-8?B?cVE4SVRHVFkxdHk1SUlUV0tVdkhsWFdSS2pKOXZTcDRxaHAxd2toR2ZiMGps?=
 =?utf-8?B?MFQxUldOVkpYK040NjBFTUFtOVpYdlB6ZjVtc3N5VCsxZFhIdmhKb2xBdXVN?=
 =?utf-8?B?VGc5dzl3dkNqYVFsTnhBeDRmTXR0U0Y1eCtRSXBXSDFCRXZuMkNpVEVxVldU?=
 =?utf-8?B?RzJxbXRKa2NnMHd1LzkwYTJHbTN6RFEwS0dMb29tc1lFNkVrQU9KK1BOSWZP?=
 =?utf-8?Q?V7t59MzJ9cM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU50bFNJTGEyQkVPYkFqNDJlV3duLzZKdmRlTWd4SWF6L3FQSGZVdEdYRlp2?=
 =?utf-8?B?RFNrckRHaDgyRURkN3hNaHI4U0Z2em9Ic0RxTVRuSmJINkdSRnpYTDVpMkpB?=
 =?utf-8?B?cXB3d3BPalZFVWQzeHR4cy91bm4xZjNDTVR2QlBOWWxHL2FtRlUrRTVOWW91?=
 =?utf-8?B?NFE2empnSFBmSEtacWFiaHc1SWJ2OFFSK284cytDa0YvM082b1B5RVRweUor?=
 =?utf-8?B?WnQ1M2hCSnZ5aVBUeDhkUk81VzFuUWV1WlRqdWZDRG9mTkpSUU9kaU1nS2N4?=
 =?utf-8?B?blhpeG9WNGJhSXRxMk5KRzU2RHJLUGFqcnZreXFXdVZXQ3BZOThzZE1WNzMr?=
 =?utf-8?B?YStTVG1iOUtkbEJlLzVpRWRtL24vZ3JtVDR2d2lHdFl3RW5rOUZKbjI5ZkhI?=
 =?utf-8?B?UFcrMnVtZno4T0JiYmtQMHFWK0JJOCsyVDRrRmlkcCtFakpOaWpleVVGRzUr?=
 =?utf-8?B?TlpaNTZINDNPaU5ldUFpQjZSU2hnNXZwa0JXWE1neDZ1a0NsMWhITENtNmpR?=
 =?utf-8?B?Mnprb3hDYXdQd1pHN0kzWDhzVXBjZkZ0dHdhUWcxenhWZWZYWjM4dWszbzQv?=
 =?utf-8?B?SVpHU0NXOWowcXNjVjBsV2xHVDU1SEtiVFkwRGMxM05QMkJMeXZ1TGkwVGdY?=
 =?utf-8?B?clBCRGZ4MVoza3RVSHFRY3kxbEt2R0xKemFLMWVybHRkTjhxcXBoQXdkZHcx?=
 =?utf-8?B?MkxYeTZESmZ2SEdaK0YzaEp0MURTTzVRS0hJVjdNT0o2TmpqajRHMW5hRVl6?=
 =?utf-8?B?UGpmSVJCQWwrcVpadkI4YVR5WDY1c2RqOFl6bFc5SnJQbGtOcE5uSWkrU3hh?=
 =?utf-8?B?NXdwbldvOUdQQit0MEFnU0xsaWlmRjQ5d3FhcTFwMkxLSWJ3SkVjb2E2aWRx?=
 =?utf-8?B?YVBScVlQVlZvaVFnZzRUQ09CaXFWNzFLY09IOVE2K0tudWV4d25NM2RrL2FK?=
 =?utf-8?B?S1pPL2VHNE0yYTF6MlRucHlvSkR1eEF3Y21FSS91d0lzYnZhdnIxdkExQkdF?=
 =?utf-8?B?Z0lCSWNSTE13MTZJcGVLM3Z1MElXb2VIUGtyNzUwVjI2WHZGSzJvR05aR2xj?=
 =?utf-8?B?V1FIb3ZmZjJ5TUQ1a1c0M0Y4UTJRbnROUXpoQUFNemhGdHZZUkVYamFJbU9X?=
 =?utf-8?B?TFgzNlBCYkRaOVc0d2ZObHJ1VThrdHRCdllpWjhQaE9pQ3YvOVhsbmZ3bVMx?=
 =?utf-8?B?eHNBbHlmQW5iVjY3cXBGOXRzWHNSYm5WMWY2dndJaEtzcnE2V3hzeEQ4bUwr?=
 =?utf-8?B?V1dmTjZRSkNYU2dNbTVDSXoyVzJLL0YyeitBcHBXNGN2QllWdVFLanN4L29U?=
 =?utf-8?B?MERlNklCR0VNM1liT1AwMFBuQnV5UWdPZ2xORlVwQ0RKTURRemJKZTRpb2RW?=
 =?utf-8?B?VHhvUlhTUllpZDR1SGlsYUhiVlB2QVJUZng0bit5aCtXMGEzZVdsMVdvMGF2?=
 =?utf-8?B?WXFHL1JaY1prSy8wNGlvMXZaVmZMVHdUdDJkTkxMdEl2RFE1SXNYeUVJMXBw?=
 =?utf-8?B?V1FkVTBNSXh1c3k4SFpCeDUvT1E0clU1Q1htb0tMK3NycUNCdHk5NHVzcytw?=
 =?utf-8?B?TEIvdGdFZkVLRU5lcmVFVThiWkY1bWpma2sxLytXUU9MdVJSVXVkL3ZUdkFB?=
 =?utf-8?B?cHRtb2syMnlRaXR2N1lLMzJVTU1HTVhxQjNaZlduVDZDcHNXWjZoMnpFOHpG?=
 =?utf-8?B?aXhIU3liVStkb0hnUTNVQllUaUxFanA5S215RXNRNjRUcjNSLys4d2d0ajh0?=
 =?utf-8?B?WFJIc2ZkcWcxV0pNM1loejhRQlZPZDBWNDBONnNvZi9HTU1KM1BCNXF3Z3dS?=
 =?utf-8?B?ZDBTMXBvVERGUStuYTZFNm5iRW55S2p6MStsbHRrb2FRSXk4RmJKV1JVMWQ4?=
 =?utf-8?B?L2JPUWRYZDREdVRoNk9vV3l0elY3M2x4UlVybm5HTndQUHJFN0xJcGIzbm5V?=
 =?utf-8?B?TUtkRXdFczVBSW8rZjNXRWMwU2R6VDB0djhjeVVucnh3TURHUXh0Wk56Q2J4?=
 =?utf-8?B?bDBkdDh2U3lYTFhadzF0dW4xZjBselZ2YTdqS1lVKzZ5SStZVzFWS1hySVNq?=
 =?utf-8?B?ZHZuS2U0QjdRYXdmeXhRWk5PcENhdGJMd1k0ZmRhbk41T0FSMStpVUZWZzdr?=
 =?utf-8?Q?ikctcInAFi1aOd3LbLbXzQZ6j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a41b5ff-d7e4-40ce-d540-08dd9238200d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:06:31.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zw80jeUJNLV3nOcEEvwdFbtDYapXY+E0iZU4g5NCKVEE4Q2bTTfRbzgN/rfzb0Ih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6980

On 13 May 2025, at 12:00, Lorenzo Stoakes wrote:

> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>
> REVIEWERS NOTES:
>
> I took a look through git blame, past commits, etc. and came up with what
> seems to be a reasonable list of people here, if you don't feel you ought
> to be here, or if you feel anybody is missing (including yourself!) let me
> know :)

+Ying, who added batched TLB flushing to page migration code. Let’s see
if he is interested in mm/migrate.c.

>
> David has kindly already agreed to be co-maintainer for this section.
>
>  MAINTAINERS | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 80aa09f2e735..29d73593038c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
>
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>

Acked-by: Zi Yan <ziy@nvidia.com>

> +R:	Alistair Popple <apopple@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/mempolicy.h
> +F:	include/linux/migrate.h
> +F:	mm/mempolicy.c
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
> +
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0


Best Regards,
Yan, Zi

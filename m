Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A523BCFD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744000; cv=fail; b=g39tlXSU1w2Ct84F0arM2SIUnrX3l/f7Jk44lEUy5YAUJyky3ai0y21+IeRvkcqimhQo+W8d3yFgrV1w6QXwfvNPe4o3EYq6c4bobmC4GATuFDpX/Dwxn7JYtyIFUMOHlvn02+XtILqgwpKIIvZWWOfTHY1Gp4D8f+yZZ3+j5uI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744000; c=relaxed/simple;
	bh=YY+r14O5HCbVbgBXEYW2TifJRyp9Oorq/8PUaAyUJLM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tDCiC8gJOGoXCxpPR8razrsYpn5m6XtiLw81X4by/a6pegkBTV9Y/O4eGKEluylWQx9OSNNgREOdYChtKUQXu1T6wf6bfv9JJiutWYR3IErOdzkUbWdsNBzwbqDIVXqcj5PfQ9YJLX90RqN2GhaoDokfVRV6reAvjVT3A4NWAec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ymqXw+RK; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ymqXw+RK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVcgBpKHZWJY6r/kaleUSR+urZOYsjPZIRT1BqgL4Im2MPF931J822lyz0wacCpbnGmLVyQwEEwcZXn5SI/uaqdyCApG0RXc/Rpfmo3YtpjL7g5KkhQPjPf3RMyCnDAL882dHnHIDovaH0x+10mdYkMzLU6uqHV226aD5g867TnFNsruJr+Q7/mCfSnJ4nwb+GSoFB0U56+XJ3un2TqGZqrxz4UCaL4/T1KkA7d6ZP9w2z/tGoBDd39UbGbIm+N8PyOOf7R/lDm5fGeHwp3pPdgTw/MGivcpTzCHnMwaCAil52q/xrcyNAPHD7E+BgyF04zll7xaKepnAs8wGvdleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZYQ13B8s109HLWBrZBnoh7KTJ9CoroVH3DAjJZv/oE=;
 b=bTfjhv7BB5zayrVYS8NQB/yU1zTLlcj4a2fL76beLOTwzpGztTrr2g8C7fTDhxt4FewgIisaCdzCQ4pBo3h4jXFJV7wAvja7hlgwfZE0rYXZPSUOAvPKlbwy4EteRcDxBmOv3VHOEhoFIQUaeBlxyg4rjyvRzMO8E0hEIwtJTmnkXHataqbp49QYryQi53QVrcvpXC0Va4kYe/tiGGDDBivbswGUaBDgketHqbH9xjqpP9ktMeBIcOfN19IcX9MqxMHfA6EuLHXIcb8DTInK+5Rt3RW1BsYElVHqqAyvj3cj0B2I2gpMvNzYtyRjDz9uDHOex0VKcqtPzBpuoiRmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZYQ13B8s109HLWBrZBnoh7KTJ9CoroVH3DAjJZv/oE=;
 b=ymqXw+RKjP/H4ktBFQEoXefGwZX9OusYKRdBijiudqBaCbfofqPgFo4wpQF23g5ZdXc43L9Q7tOXmP3s8VAPQtW3As40AhxJJpm3lwjaYJtoNoKI1MZLUA8Mv/hmUPCZMnvhNl5uiztWYc3ra2U+CppBwhOf/UOLsn82gqt4ANY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by IA1PR12MB6282.namprd12.prod.outlook.com (2603:10b6:208:3e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 19:06:36 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 19:06:35 +0000
Message-ID: <0b945575-f6ad-4aed-a3dc-7f609f4239c1@amd.com>
Date: Wed, 16 Apr 2025 00:36:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] mm/vmalloc.c: code cleanup and improvements
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-kernel@vger.kernel.org
References: <20250415023952.27850-1-bhe@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250415023952.27850-1-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::14) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|IA1PR12MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ce3043-11ef-404f-27db-08dd7c50a45c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amRmbFZIQ0JTYWxweFlDZzJkbjBXMVVtRG9ZZjV5MEllOWdiT3U0MVBLWWRW?=
 =?utf-8?B?WlNuYlFhNFAweDBvNkQ1SzZCajk4aUVkUStLaUNMa24xMEVzSkl1d2dVdmNy?=
 =?utf-8?B?UlNQajI2bDFhUmovdjViTC9MbGpaSWJzaFJmS1NSTWdFMWl5MGt0QW9BOWM2?=
 =?utf-8?B?clloYXc1eEdTSmUzamM0NmRSYlhHSWlNYzI0bGVwRUV4VU1YYWppb2dQSERr?=
 =?utf-8?B?Y1dXRDVXK0ZDbjhZdHM0N041Tm9TT2VkK25kbm5Zd2U0S0thVlFvL0hrZnlH?=
 =?utf-8?B?M0NCMVYxYmVZdE1pbE44aG5JdXR6TjZZMUY4d3hJWlpCNnU2RExnSi85QWkw?=
 =?utf-8?B?eldVVUFUcnVNZzEzVUdOY0NpL3kyZTYzRk5HMldIWFltUU1GN01RQkFKUDFL?=
 =?utf-8?B?VFBNWFdyVmY5Rjdub3Z0TnBrQUY5TUsvUEJGLzJ6em9Tc1VMcXVZNUREZExM?=
 =?utf-8?B?blo5SkpOTHBkSFl5WnplTVphUG5ONGQxZzRWRUt1ZFB3c2MrbzVTbkxkOGRN?=
 =?utf-8?B?UnBQYXBWcmVPNThKc0gzdys2Nkwvc1VNZHlEL3E2SEVzem9IaGZWdWFTeHVp?=
 =?utf-8?B?NFJQS0RhYWtMaXVYS2NOcXowbUMvWFQ1SmwzbnBSMDVVZzdRcE5xYXBDRWpx?=
 =?utf-8?B?VTIrZzhkMFVjNFZmbWQ5Y2tiU2ZLZXhRbG14MWlJOXpkdWFJK3A5LzdyNWVv?=
 =?utf-8?B?OC9iOWJ6cnZtU2pqZXhSSWxKS2tzSEZZcHl5Szh1UENHckFpY2dSbXB3bWl3?=
 =?utf-8?B?Z1c3VXExOEphNGhmcnM1YVVxeldIV2NhdjhuVjZ4REJFYmJiSUdoa2pRUWVk?=
 =?utf-8?B?MWV5V0U0VTdPOWNHMEdLQlc5bWpOYXZXcUhBbFMxMFJaT1BoaFY4WUcvNmhK?=
 =?utf-8?B?d3JBSGt2YXpHWW8rM1UxNUh1UFUxNWVvSVBZZE4zL1FlZzNDaUYyK3laNXVF?=
 =?utf-8?B?UUMvcDN6SG5Cbk1HQXZlSXZWQkp2WWo4Yk5RVXkxaTE2ZGRtOHJnZDBzZW5T?=
 =?utf-8?B?RkRhY0Z6UytqclpSQnlWcjdTR0V4OEY2dEVGTGJhcEo5bXBrZXV6TW15WXlx?=
 =?utf-8?B?RWl0dzBJYmU5ZUVWbnJzcGEwaGx4WXRmMFJab3NhV2RNbnBGaEgzQmc1aW82?=
 =?utf-8?B?cU9kWnJ0b3hFclpPWkdwMVk2WjA5WVhpMjZWdEJnSHluUTM1K2pQVDFYR1NI?=
 =?utf-8?B?WldjWURRazUzU0NtY2paNUtudnlPQ2R1L3NZQjJCMnRDRVhUa3UvallFZjlm?=
 =?utf-8?B?dWtlamtCc2hLblFOQkcvbGl2U3FVR3hNcit5eTY5aFlOVStFZkMvN3VuUzI2?=
 =?utf-8?B?bTVMQk1EajAzWmFaZW5acEtSTGFZcTBGaWpZVUVCNWtKM0xCcXRZQWdPOEFK?=
 =?utf-8?B?ZVdkWjBTMmNaNmhJQTVWM0NML2p5TEdlOWNDTVpGTzhsa1RWdTJiODZxVUFM?=
 =?utf-8?B?V1BYRlNncmtWeG5MMjE5RC9rUGpvYklpb1BmOW5ES3JRV0NIQklzTTRxeTdH?=
 =?utf-8?B?OGQrZERmVmVpWDhtVEdXcHJUZFBpUllITzNvQ2ZVcDdoSGJGVXQ0UXVXdU03?=
 =?utf-8?B?MFVDR2l5ZEc1UkpyYU5PRXVNWndIR3dvV1UwZnB1UEx3UFpFZ09qOVZLSmVL?=
 =?utf-8?B?c25URXVRWStFM01rbEZPZXpjdmdJSHE4cVlkSVMyYU9TUTFKN0dtMStqby9O?=
 =?utf-8?B?S3ZQbmxYU0xnZDBZTFNxdnVsb1dOaTZDM21Id0xLZ0I1RnJCcUtKSzRtUEVQ?=
 =?utf-8?B?aTVFQllMQ0J0N0E5RTVZVnBjR01oRjh6dEZwaTVUbVhXNlNNVFkveHFJUXd2?=
 =?utf-8?B?Wnd0bnpOT1VoMEtEOVptaE9MN3BYZDg3ODVtdHdZNUtDT3lwMFpsSnN4alc2?=
 =?utf-8?B?czdLdFh3RjFlRGpXUFZlanUvc3dzN3lDREdPN1lyVHJiZGMxdVFhcjVyOG56?=
 =?utf-8?Q?l7LVXxzvdnw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dks0Lzk2bExkQVhiTlgwdjNrLzQwb1NDamozbDMzdm15bzQwZTRZUEtWRCtR?=
 =?utf-8?B?ZGR0V1dmaUdYV1NsUkJ3OFFJTU1HUWxUd2lXQzZUTFBjTU4yb0k4SUNSbTdp?=
 =?utf-8?B?alFSbkkwZmlOR0JjdCtWa2doMVNSeTRTdTVnSjcxZkx1MWdaQ0FwZzI3VXZk?=
 =?utf-8?B?MFhSTmpkVGI2cCtEQjJidGlTWlhkcWtDLzZNSEI2WFlocS9kcytFOEl0TVpu?=
 =?utf-8?B?dFZmWDB0a3NQbWhEeU1mVlRYaTN2RFJiVWVRbDJVMXIvUDdpYVMzSjh1MXRi?=
 =?utf-8?B?Zmh2dklpTHlrOE15clFaUjRkR3ZPUktvVEIzalZSV0lCZFRRemhCY0MwTTB5?=
 =?utf-8?B?OVRQaUhZRFRrblYxSUt4K2l1VlNESGdpRlNtL2oramhsQklzUUNWdnpxdkJ2?=
 =?utf-8?B?LzhqeStRTUd1TEsrRmdXTm5tVkNGcjkrVGJjUzJPYjFLTTZWTkJ1cS9HT1gr?=
 =?utf-8?B?Zms0YUN5THUwa0FSa0pVQWZyclNrQmdycXZZeVBwT0ZXYmpqNXB4a1JOcEZN?=
 =?utf-8?B?Q2VnYmVta3NXK2t2dlc1K1hvam5SSUNINDNNaU1nTWNqK0JFUnlQVzdiSUxw?=
 =?utf-8?B?TUI0T2FJN1BCWE1Ta1dLclZxZ0VNTU5TaWdPc21jZEtmNjkvVloyNGtNWEZI?=
 =?utf-8?B?Y0dOVXBaMGVwdE1tSU9TMjJDNTNYTW9uczlub2U2ZVphWjhlam9aSi9MTDRH?=
 =?utf-8?B?blM1aHFHNmRWMUJkUWdrcjI3WkQ1Nm54SDVsRFdCdGNXUlpENEJBdDF3cDFr?=
 =?utf-8?B?L0NOQ2pnc3JMUXgycThRMVVVQ3ZtTXY1SUhBVER0WUhhYUNudUJwU3NuTVUz?=
 =?utf-8?B?SlREajdPRkNsdFpOK0Nhcm1CM0VxcEprdlJRUitCSmxZbE80YUZiY01JVkdp?=
 =?utf-8?B?Q1Y1Rnh3NEhCQjFJNlJUZGJ6MlRhWVV0RFp1cUk3bW9vWm1JVDJBUUJCNFU4?=
 =?utf-8?B?WXpteXRKSjhKRjRUMVQ4bHphdzV5Wk44SkdEUTE2WFhiU014T3JqRjY3YWdz?=
 =?utf-8?B?T0hoeWt3bXMvbXU5M1UyQTA4dm9rTmhGWko3cU1KM2Z1QWN1N1Npa2tnbnZt?=
 =?utf-8?B?b3hlbEpQcjRLS2orSVFpNW5zM2FSbDA5VzMyYzZQT25lTWp5dEd5VktWYTdv?=
 =?utf-8?B?ZlRRTE8vZ3R4aTE4Y3BWckp6NGpJR3o2MVNPdGg2TFI5dHVUMXlQNXkxcmhL?=
 =?utf-8?B?R2VqU1NRRllPSUlUVnFSaGtaaUxhVTAzSTR5aVhFeDVvcHBIOXZqaVpMbE9Q?=
 =?utf-8?B?SEFYQXZYV1FBU2FmazJlRnU5eHFKTXBpOFlOcnhYUXZMMkJKdTVPMTZxaGhZ?=
 =?utf-8?B?QzBTVmN3WGJxeUIxc1l2REFLaGhubnQyOXVFdFIvc1VnTHVBdXJuQ21iMUla?=
 =?utf-8?B?NEhtblgxVE84ajc0WVorMG55eEV4Z3I0MXZaa1dlcnd4VU4rdnlIbERiRjRn?=
 =?utf-8?B?TlF1a25WM0pPdHFnU1A5Vk9RTTJLazFZbS9uZk55OHF4TkZNZzYzdHA1UUky?=
 =?utf-8?B?L0VZRytBdnlyV1hhOFE3TE5ha0szT1RuZkltcUxhMnc4TlNOc0lRZVJ1NjVC?=
 =?utf-8?B?L3pVYkVpNExIaWJidFpCYlhsMXpuLzVSQUMyeXlZMDNCK1lsL1NGYVlKbFpP?=
 =?utf-8?B?ZHNPUW1HQm93VlJNcVhKdk9uNjZFU05rRlU4MVVld2lFR2xBRjR0U1h2R2pO?=
 =?utf-8?B?SVhQV01rNU9QZVV6bnA1QnlTUUNpelFqOGpJQk1oQmJSR1liODdhL3QvS3lO?=
 =?utf-8?B?SS9iMFdhMEFQNzMyNDd6elE1VEVrSy9SakFRT2l3YllHT0tDK2ZQMnhaK0ZM?=
 =?utf-8?B?Q1JvVHRpVFhZcHlFRGNWZWxPdlBXZDJDVWlFNmozamxYNFRNTmk1WEtaYWlW?=
 =?utf-8?B?cUNubXc0L1ZwQ0NhQWRyczd5eEJEU2NBeFQxdVhjb280U1JoYWlBRTk0ZXZL?=
 =?utf-8?B?UnNYWFR3SmJndFRublNBeGFYM0J4S2VsK2ZsTE0vem9BWFc4UFBSMVVVV2xn?=
 =?utf-8?B?YzZZbFZudVBDSStqWmphWFh1NWRaN1JoMDJOdm9WOTB3Yy9sV0ZUaFpZREtZ?=
 =?utf-8?B?QjhXc2xHZEh6TW1MTTNBcGUvUXVtWm5VMGF2T296NldUWlJVRFpQRXRRNUg3?=
 =?utf-8?Q?IJ7Tsf6ee8gMFxqNi6FBuMW4Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ce3043-11ef-404f-27db-08dd7c50a45c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 19:06:35.7879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7kqqULyLoew+0KoYMcMljZ7PDPTJAZzk7MdtInBpb8MAQZ+A6n4Y2ujxW4b/J6Bbe0/wZeqSCDnw9ka3ltJnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6282

On 4/15/2025 8:09 AM, Baoquan He wrote:
> These were made from code inspection in mm/vmalloc.c.
> 
> Baoquan He (5):
>   mm/vmalloc.c: change purge_ndoes as local static variable
>   mm/vmalloc.c: find the vmap of vmap_nodes in reverse order
>   mm/vmalloc.c: optimize code in decay_va_pool_node() a little bit
>   mm/vmalloc: optimize function vm_unmap_aliases()
>   mm/vmalloc.c: return explicit error value in alloc_vmap_area()
> 
>  mm/vmalloc.c | 68 +++++++++++++++++++++++++---------------------------
>  1 file changed, 32 insertions(+), 36 deletions(-)
> 

I've tested this patch-series on my AMD EPYC ZEN 3 machine using

1. Using lib/test_vmalloc.c: modprobe test_vmalloc
2. stress-ng: stress-ng --class memory,vm  --seq 0

I did not find any issues.

Reviewed-by: Shivank Garg <shivankg@amd.com>
Tested-by: Shivank Garg <shivankg@amd.com>

Thanks,
Shivank


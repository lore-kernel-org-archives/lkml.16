Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B026BFCE;
	Fri, 20 Jun 2025 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444395; cv=fail; b=BOSqZ7I8RxiXsz93BaLVjRGoRUbTbUZ1YrS3ANqR/bTGzC7qH6zpspOgt0CumwddQSuK0E+t2SZsABf6bNMENV2vuaGV2nb9UJ4pic84GfZPwoUVcmeUm7etzwOO01gAhNSsmNYXT0hNvdSSlOyTAcjxMjHlY7BL686aPFvMeGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444395; c=relaxed/simple;
	bh=pPt3xoPG6O6FlAbK7xHg7Ltze0ehidRRDRvMdc2dCK4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SI+1fNdrNcTB0eUiJ6FcGKMszwpoxi0+v8TWjwo6BDhF79B9EPLM77+OhrF0x45eXwxl6KOhEjNoml78vBORdJlwSfwWDIawIG9mcbaiBOsTdmIsvuG3Rr/sV5OTvc+Du+n4AZrjM8EdDB7jgQ5prNHCpV2tksr42ZrhGktMxeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vp8eWKeP; arc=fail smtp.client-ip=40.107.102.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vp8eWKeP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1lARVWPli8x6njjAsnX0fkHnvtgArBL+10oWPjellgfnwTbu9R3aDF9ElXGpWe0vCOgVSXjdpGJGJZAXIq6RuexIrSj2iQ34OfyQ44ZYfUaMNk7M2FLEB6BnHBp8BopRAFsjTSa6B8NJyxx64aJFEpdlMAB1TO+My0keK7DnlHPQlsEbAV5RCfpeSl1F80+VMTt65DSNKo3RTMNSbOTT0mX4WN4KjYtX0vtdF24KWvNemjjLCjxd6sFOlCmaPEGJ1kiwoO2GNBTTUbvOFvooYeiYrB0v+Np/qQUcoK2OORbNGWBxJVbgdsieEqQzr3f8qD+8HGPPIJypMXP1a38Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/O7dtWRLXF7raJ6gKjhg0edj+ZpSYSDhD/to3R1A+I=;
 b=JdWk1kZmSuEJQjx+kzo5tS/OF6ZqMa1IxuRjSOLtHeP7mpDkAUInsiDdxCNsLPONRnWSA+CQFwEgrpMVXWrHuHwYncEFi88OEP4z4+OnEADhgUSWsI0FOX1QIXru0L6fBy8KVNWM3Qys1L23M+ibILyFPNznygIakY1ceGVLJutipT0Bw0EX4Es+VJ3X2esOg+yO+zE62a+3eG8TpXwctyhJ2kB9SkhowYxjjKt4Xl3iyAih7cGoePHW087QY5fW4U/MdAB3K7vH8IUkOxNO3eABNkMxbKCR9uMBz3Jc0Mgayi7RYMbaF5vRV7hWZWqVQ0Q/uH0qt+irfmqZcmA6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/O7dtWRLXF7raJ6gKjhg0edj+ZpSYSDhD/to3R1A+I=;
 b=vp8eWKePOFKnN+x7yRtJazJIHkRmpKV7mKKCo7KglnpZyWP8N5g3/8LPoi0Pcwd1hdhtZsi5Qe/q1o0P3dsTwOk26FpCCMr9qZEPuvf2FPrANMAPD7VO7qpsXdx/HLdz5qv8JShp3UjaMJUf5yl0PohWQyD3R4GKuEFrXcfDnzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 18:33:09 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 18:33:08 +0000
Message-ID: <04f5c272-4da8-48b7-b772-9caf987e0b35@amd.com>
Date: Fri, 20 Jun 2025 14:33:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Update swnode graph for amd isp4
Content-Language: en-GB
To: Mario Limonciello <mario.limonciello@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, Dominic.Antony@amd.com, Phil.Jawich@amd.com
References: <20250618202958.3934822-1-pratap.nirujogi@amd.com>
 <4efba85a-332f-4134-9a1e-50101c80aa73@amd.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <4efba85a-332f-4134-9a1e-50101c80aa73@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::25) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|DS0PR12MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe94585-3a1e-44bb-8378-08ddb028e78f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1RoVmlkUVMwVzRRcHF6ZXI4ajRzZjhLNkI4eHl4RXVwQXYxTHF2ckxwNDVQ?=
 =?utf-8?B?MFlwUGFDeGNMQ0crR3I3TTlBc1NacHJ2SkQ4ajdzWHRYUkhZNjNabmM2NGYz?=
 =?utf-8?B?RE9wb0p2OC9FdUtsNGxWZS9GWkhRdVBrVklaSGxoWWwwancwWWZHWXlUUEdL?=
 =?utf-8?B?V0xacWtYTTM0NWJucXpCNUJZVEtXd1pOMlNlT2xUYUQxZEdUdVlSV3J2eDh6?=
 =?utf-8?B?Rk9CT0JkaHdnZkNCNDBMSmN1b0pmOElxdDI4TmJFaEdJUU1zOHdpZ1hoVmpS?=
 =?utf-8?B?dURjazRDUGFlKzEyaGJNSVo5eTB4b0cvVzVYbmh6Q21ZNE0vWG1WdUxoVURt?=
 =?utf-8?B?S3M3d0Y3dkZaMGVXS05VeFBNaHJQeGlSdVIrT1ZWQ2JmZWhiRHZBQ3U3ZFkx?=
 =?utf-8?B?WUF4dExLK0pzVmFjejVOc3Z2citqZTc3ZWorQ3lIaWwxQlpLRmIyaXpYVUdo?=
 =?utf-8?B?VUFZcFVQT09hUnJmNDZUY3YrNjJEVXdabVhYbTFCbHd1OWl1a3pRbW5kc1U5?=
 =?utf-8?B?TFRhVVdyVVRwQTVXNGF5ZTVRN1I0UnQ3bWtrSU12cVRYbHN3QTNMVWJXY3BV?=
 =?utf-8?B?eUpHUU1aQW1sODlCelFtMkVOQlRQYk4wSDFlUjR4cVMxaXNielV0RkZ0L01i?=
 =?utf-8?B?b2VUeWw4TDZnVFFnbWtXWHR6cmVoNWRxcFRhUUdpR05GM3lObjFzRkJRSU50?=
 =?utf-8?B?Q1QwOGF5QkNCZkg1YWFHdVI0SGlUdExib091UG1LZE9GcnZmM3RVd2M4Qnkw?=
 =?utf-8?B?VkduckRZNHcrWDczZlR2RTRHaTlWTlpBUDVQMVpycHZqdnVLcFRBeVAwc2pw?=
 =?utf-8?B?U2xxSEJQZTZQaXgxNjF4RUptTHRBUHpvTWFYTHVRa3g5TmVpa3JDOEtROW1N?=
 =?utf-8?B?aVFrWm92WGdTMHJOS3hpYzdoNm43emoxUWVEcnVjM0JjV2RobjRSUHYxODB2?=
 =?utf-8?B?aTVFeE5oM01vL3llMmwwSjRKOTR4TElIMFdlUlMzaWxrbi9MUmYxa0xZekVG?=
 =?utf-8?B?VWdWSXdqellGYlhqV05oQlJMR2VUdUc1QjN4QjdFODBES25nSFkyNXE2OWJ2?=
 =?utf-8?B?VmFZa0xieng5ZFZVOWNiWC83cEFFRTVFbG05NUtzQ1dLVEE5dVhsYS8wMDZH?=
 =?utf-8?B?TENXYXNOWmpyVzRtY0FYWG5wR053NzN0T1djZkg3a3B3MmpvYjBsYnpHaGhU?=
 =?utf-8?B?Z2FWeWdjTzFPeWF2c0o3Tk5JTWVZbFhYTVl2YkFwZ2pYdzQxNnpZbFA2WkV2?=
 =?utf-8?B?b0dMWnF2aHN6T01maDlvdDlhdHV3Tyt6ajVSWlNzMFlZazJnUldRcTNDcDBk?=
 =?utf-8?B?NFNobjBqTUNQSnJVZm1zTkFmdmovRkt1K0o3cVZrcnB3RkJHSlp5RFc5OVRn?=
 =?utf-8?B?c3Rxa3RNcG90dnpmRmx2TmZWQUJ5eFU1VFdRNDlsVWJpOTVTaWh5Qy8yWitX?=
 =?utf-8?B?Zk5nSmVYdFdENlkwaXhLNXdwdXVzaDZITnJsZEpObk5YRjJ4a01FanEwaE5Y?=
 =?utf-8?B?bHJ5bDBhSEY4Z0RpdFZGWnp6eUxSVEVQM2lLczdjYVN1NGZ2bFEwVG5rR2Ri?=
 =?utf-8?B?akI1WnJqMlkrS0hqR1pUWDJxeHZTdkVzTUxXV2xVazRzZ082WUdMUm5HUWVF?=
 =?utf-8?B?WTFUQkdMWEJoL1lGS2pkdm0rSXd0cFVIaWh3bGx5TDlCOW1QQ05rR1ZPSzlz?=
 =?utf-8?B?a2szWDlpL2hIeU96SlZJRVc2bVBMVXdQVTJPMkFpcStqT1JTbExsMi9MSGJ2?=
 =?utf-8?B?RFkvZWNNMGk5OWo3VEk3RkdkdXdnQnRlQXQ1ZkNsOVRsWmlTQXF5UHMreW1Y?=
 =?utf-8?B?RkE0b0tiU21CaVhuWHJxS01EUW1xcm56c1R0V1JkK3hDOElWS3V3NENNSXox?=
 =?utf-8?B?WmZTN21RelJVbVJBZGphbXUvVW1neW5Xa1FybCtSSUEyRHpkbFVaZUpheG8r?=
 =?utf-8?Q?U+5LEeWsDpY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTdxV2o1VWhQbXhaSWpjb3M4SGFyMFc0QzRBOXM2MEg1Wmkza1l0NVFFTlJo?=
 =?utf-8?B?c2IwV0tsamk2NmFyRzJZVXVEMDNpQmMxa0lhazhtaG5WUzc3ZzVFU0QwSU1y?=
 =?utf-8?B?RnBLVkVTQ2I2bDliSmVHMStrbkk5NkloVUxQQVlxTDZtK3ZCMlNyOXlCaUYv?=
 =?utf-8?B?Y2NxUjdBOUhTZGxET2JnWXhrOERoZk1CMHZITXkxZ25LSklCRGpFSFlrZkJW?=
 =?utf-8?B?TEhsNnZsWlpMdk9iVXE2dVd1T1M2VGVLemVjM2JCdkVuck11NGthMlBGR2hx?=
 =?utf-8?B?dlVJSjNEMm9GZjdhUmZrWU1CNXVwRWk4ZjVwNnNHTi9WYmJMcFJrYngyU2JL?=
 =?utf-8?B?dmdXUURPdEQraUd5aTgzSEEvaXdsTWwwUWhqOHRWRWxxc3RHNW1ZUWZKMVJz?=
 =?utf-8?B?RXE1MXpZbThGZ1F0c3dJRXIzTjVwazVDanhuVndRWmFDMjZpVlhITFVvZkJU?=
 =?utf-8?B?SDJGYytTQTllZHJJZkNROFZtb0ZKWU9oaTRDSUY3Q0hTSFcvMmhUWE4rR1d5?=
 =?utf-8?B?QlhIUlRDM0FxR25nWGJHelVQQXhGbUxEZDdmdEVhMnR5U2JBNDFybk56SXhJ?=
 =?utf-8?B?VzJwS04rbHhUbDhsUWw3L0dzbnhyWGUyOEJOODEzb3ozMXJrdkRaRTdhTmlY?=
 =?utf-8?B?OTdKdzVEOWRobVRSblNYeU00STk3Q2UrMFhGVWhSQ2pYeW9KRUgxT3RBS0gy?=
 =?utf-8?B?Qmk2bkhzcEZFQTBucCthMEhGcmZrVm5BR0I2YkQrTnZySjl0d1NSRWpwQ2NK?=
 =?utf-8?B?QzJFNUdoUkpveWFjRUVwMjA1R3ZocUxvQ1FKR2tsM1RZTnlpVkt5TzgwaWlt?=
 =?utf-8?B?TElJTGxhT1V3NnkzdVFNb0QwbjgxbXJCWjdZczZ5NjdZcE1XQzVJWU9tZ29h?=
 =?utf-8?B?ekhmMFBwbGFiL2tMMmx1ZWxYbVh6YldQM050b3lDY2V0cDJVWDE2Ym8yT2o1?=
 =?utf-8?B?aVNXQ1IxeHBOSWNWcEMwK2dsMnlhazlCYUhrQ21yRE51YTcwRG5Id3lwb01y?=
 =?utf-8?B?Q0pwL2o4ejVTd3VTQTZPVm1Cck1xc3RYV0ZHNjJ6OGE3V0M2SURGc1AzUXJp?=
 =?utf-8?B?Q0lpZVMvN3lKaEZ0a28yWUhwbnFmN0poT3g0eU1tVDBhTGxiL1d6L25HVXli?=
 =?utf-8?B?YXltRHdCL2pmMVd2L1dNQnordXo4MitWZUt6VWo0MUwyRDQ4blgyU3VCMnpS?=
 =?utf-8?B?bG5yNXduSTBqbW0wajJBODJWNW5qbElqdnFUclJJNkdJZUFaWFNaRDVSbnRB?=
 =?utf-8?B?ZnBIVEE1cGhmMjlWbFNEL3F4OUpLczJVVDNwaCswVGpNc29XdC83OXlzdnZm?=
 =?utf-8?B?bFRScDlSRDh5RUtjTU55MlB5allrQjcvcFVQdTVVbTdDUEZWM01LNUorZnNC?=
 =?utf-8?B?R1dxelFEYUdjdVQwbDdrQnBsQVYxVVNoeHZUcTFLQjhXampjM3BMeEljeE1N?=
 =?utf-8?B?bkpBbS9uRmExN2h5bW9XcGRraDdZaUpRUFJJamk3aWNBWFBtN3BveitONXdl?=
 =?utf-8?B?ZU5HcUJ5bVZ4YUtNSjlESjdCSDFGbm1HYklXZkVtUzJxL3QyT1UvY281b1BK?=
 =?utf-8?B?UjBBL3A4TTVheXJueDREVDN5UTk5SmFZOXJHUzhYdDlIVkNuTG12RUlqQURJ?=
 =?utf-8?B?VTIrM2pOUCtISXVUNjNDY2ptc1ZFeVdLNzlvb3JCdDJzdDZKaHZaN3ZnUDJE?=
 =?utf-8?B?bzZXYVRwTzBaUWJTbXVtalJyU051YmxidlZlUlZzWlFyQzUybVNnelJtZXZ5?=
 =?utf-8?B?WWQxanNhNjhFbWw1SjU4VUk2TWlnK2dyVEtXbDFNczd3R2RKMVVYbElYbXRQ?=
 =?utf-8?B?QWtieTlNZlZmckR1R2ZFNFJ3eU9aREp2Mk5ISUxUVzdYRk82SkcxNUlqem9Y?=
 =?utf-8?B?dzlEMGVGZHRiSHd6ODkxT3VFVkt3ZCs3OXUwSFNmay95eC9GMy9LN3FpSmhw?=
 =?utf-8?B?ekpuWXcwMytDb0hKUnlPUHlDRExnRFhyY2k1ak8vaVI0b2xsSXNxOUVKd0Q2?=
 =?utf-8?B?Q0ExaW0rZVg1MXd1UXR5RkZGaGxUMVA4RnRWY3lhMzJUdlk3MnZFNFZOWXA3?=
 =?utf-8?B?VzBQczNjK3J6aUIwRDhpQUlvVXhmM3Y1V1BwTTVlb1pCUEVISGdPYnErT3pV?=
 =?utf-8?Q?oJEodgaHW7nwu/LSigxstifah?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe94585-3a1e-44bb-8378-08ddb028e78f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:33:08.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UB5S1ODej6e+RxrHfSaYVvKO4UYYfWqkiDZIovcTkn5Iu9b4n7FOizKx7AUUxk/ypnWZvbUDavHTEqnJ7+okA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7747

Thanks Mario!

On 6/19/2025 11:06 PM, Mario Limonciello wrote:
> On 6/18/2025 3:29 PM, Pratap Nirujogi wrote:
>> Existing swnode graph format is specific to sensor device
>> and is causing conflicts when accessing standard property
>> variables outside the sensor driver.
>>
>> To address this issue, enhanced swnode graph format with
>> dedicated nodes for i2c and isp devices, with sensor node
>> added as child to i2c node. This approach allows to have
>> standard property variables (ex: 'clock-frequency') with
>> values applicable for each of the devices (sensor, i2c and
>> isp).
>>
>> ACPI device driver_data handle is also initialized with root
>> camera swnode to access the property variables in the graph
>> in isp and i2c drivers.
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/platform/x86/amd/amd_isp4.c | 181 ++++++++++++++++++++++------
>>   1 file changed, 144 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/ 
>> x86/amd/amd_isp4.c
>> index 0cc01441bcbb..c440a7dfed27 100644
>> --- a/drivers/platform/x86/amd/amd_isp4.c
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -20,6 +20,9 @@
>>   #define AMDISP_OV05C10_REMOTE_EP_NAME    "ov05c10_isp_4_1_1"
>>   #define AMD_ISP_PLAT_DRV_NAME        "amd-isp4"
>> +static const struct software_node isp4_mipi1_endpoint_node;
>> +static const struct software_node ov05c10_endpoint_node;
>> +
>>   /*
>>    * AMD ISP platform info definition to initialize sensor
>>    * specific platform configuration to prepare the amdisp
>> @@ -42,55 +45,116 @@ struct amdisp_platform {
>>       struct mutex lock;    /* protects i2c client creation */
>>   };
>> -/* Top-level OV05C10 camera node property table */
>> +/* Root AMD CAMERA SWNODE */
>> +
>> +/* Root amd camera node definition */
>> +static const struct software_node amd_camera_node = {
>> +    .name = "amd_camera",
>> +};
>> +
>> +/* ISP4 SWNODE */
>> +
>> +/* ISP4 OV05C10 camera node definition */
>> +static const struct software_node isp4_node = {
>> +    .name = "isp4",
>> +    .parent = &amd_camera_node,
>> +};
>> +
>> +/*
>> + * ISP4 Ports node definition. No properties defined for
>> + * ports node.
>> + */
>> +static const struct software_node isp4_ports = {
>> +    .name = "ports",
>> +    .parent = &isp4_node,
>> +};
>> +
>> +/*
>> + * ISP4 Port node definition. No properties defined for
>> + * port node.
>> + */
>> +static const struct software_node isp4_port_node = {
>> +    .name = "port@0",
>> +    .parent = &isp4_ports,
>> +};
>> +
>> +/*
>> + * ISP4 MIPI1 remote endpoint points to OV05C10 endpoint
>> + * node.
>> + */
>> +static const struct software_node_ref_args isp4_refs[] = {
>> +    SOFTWARE_NODE_REFERENCE(&ov05c10_endpoint_node),
>> +};
>> +
>> +/* ISP4 MIPI1 endpoint node properties table */
>> +static const struct property_entry isp4_mipi1_endpoint_props[] = {
>> +    PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", isp4_refs),
>> +    { }
>> +};
>> +
>> +/* ISP4 MIPI1 endpoint node definition */
>> +static const struct software_node isp4_mipi1_endpoint_node = {
>> +    .name = "endpoint",
>> +    .parent = &isp4_port_node,
>> +    .properties = isp4_mipi1_endpoint_props,
>> +};
>> +
>> +/* I2C1 SWNODE */
>> +
>> +/* I2C1 camera node property table */
>> +static const struct property_entry i2c1_camera_props[] = {
>> +    PROPERTY_ENTRY_U32("clock-frequency", 1 * HZ_PER_MHZ),
>> +    { }
>> +};
>> +
>> +/* I2C1 camera node definition */
>> +static const struct software_node i2c1_node = {
>> +    .name = "i2c1",
>> +    .parent = &amd_camera_node,
>> +    .properties = i2c1_camera_props,
>> +};
>> +
>> +/* I2C1 camera node property table */
>>   static const struct property_entry ov05c10_camera_props[] = {
>>       PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>>       { }
>>   };
>> -/* Root AMD ISP OV05C10 camera node definition */
>> -static const struct software_node camera_node = {
>> +/* OV05C10 camera node definition */
>> +static const struct software_node ov05c10_camera_node = {
>>       .name = AMDISP_OV05C10_HID,
>> +    .parent = &i2c1_node,
>>       .properties = ov05c10_camera_props,
>>   };
>>   /*
>> - * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * OV05C10 Ports node definition. No properties defined for
>>    * ports node for OV05C10.
>>    */
>> -static const struct software_node ports = {
>> +static const struct software_node ov05c10_ports = {
>>       .name = "ports",
>> -    .parent = &camera_node,
>> -};
>> -
>> -/*
>> - * AMD ISP OV05C10 Port node definition. No properties defined for
>> - * port node for OV05C10.
>> - */
>> -static const struct software_node port_node = {
>> -    .name = "port@",
>> -    .parent = &ports,
>> +    .parent = &ov05c10_camera_node,
>>   };
>>   /*
>> - * Remote endpoint AMD ISP node definition. No properties defined for
>> - * remote endpoint node for OV05C10.
>> + * OV05C10 Port node definition.
>>    */
>> -static const struct software_node remote_ep_isp_node = {
>> -    .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +static const struct software_node ov05c10_port_node = {
>> +    .name = "port@0",
>> +    .parent = &ov05c10_ports,
>>   };
>>   /*
>> - * Remote endpoint reference for isp node included in the
>> - * OV05C10 endpoint.
>> + * OV05C10 remote endpoint points to ISP4 MIPI1 endpoint
>> + * node.
>>    */
>>   static const struct software_node_ref_args ov05c10_refs[] = {
>> -    SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +    SOFTWARE_NODE_REFERENCE(&isp4_mipi1_endpoint_node),
>>   };
>>   /* OV05C10 supports one single link frequency */
>>   static const u64 ov05c10_link_freqs[] = {
>> -    925 * HZ_PER_MHZ,
>> +    900 * HZ_PER_MHZ,
>>   };
>>   /* OV05C10 supports only 2-lane configuration */
>> @@ -110,27 +174,64 @@ static const struct property_entry 
>> ov05c10_endpoint_props[] = {
>>       { }
>>   };
>> -/* AMD ISP endpoint node definition */
>> -static const struct software_node endpoint_node = {
>> +/* OV05C10 endpoint node definition */
>> +static const struct software_node ov05c10_endpoint_node = {
>>       .name = "endpoint",
>> -    .parent = &port_node,
>> +    .parent = &ov05c10_port_node,
>>       .properties = ov05c10_endpoint_props,
>>   };
>>   /*
>> - * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> - * fixed to align with the structure that v4l2 expects for successful
>> - * endpoint fwnode parsing.
>> + * AMD Camera swnode graph uses 10 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 and i2c frameworks 
>> expects
>> + * for successful parsing of fwnodes and its properties with standard 
>> names.
>>    *
>>    * It is only the node property_entries that will vary for each 
>> platform
>>    * supporting different sensor modules.
>> + *
>> + * AMD ISP4 SWNODE GRAPH Structure
>> + *
>> + * amd_camera {
>> + *  isp4 {
>> + *      ports {
>> + *          port@0 {
>> + *              isp4_mipi1_ep: endpoint {
>> + *                      remote-endpoint = &OMNI5C10_ep;
>> + *              };
>> + *          };
>> + *      };
>> + *  };
>> + *
>> + *  i2c1 {
>> + *      clock-frequency = 1 MHz;
>> + *      OMNI5C10 {
>> + *          clock-frequency = 24MHz;
>> + *          ports {
>> + *              port@0 {
>> + *                  OMNI5C10_ep: endpoint {
>> + *                      bus-type = 4;
>> + *                      data-lanes = <1 2>;
>> + *                      link-frequencies = 900MHz;
>> + *                      remote-endpoint = &isp4_mipi1;
>> + *                  };
>> + *              };
>> + *          };
>> + *      };
>> + *    };
>> + * };
>> + *
>>    */
>> -static const struct software_node *ov05c10_nodes[] = {
>> -    &camera_node,
>> -    &ports,
>> -    &port_node,
>> -    &endpoint_node,
>> -    &remote_ep_isp_node,
>> +static const struct software_node *amd_isp4_nodes[] = {
>> +    &amd_camera_node,
>> +    &isp4_node,
>> +    &isp4_ports,
>> +    &isp4_port_node,
>> +    &isp4_mipi1_endpoint_node,
>> +    &i2c1_node,
>> +    &ov05c10_camera_node,
>> +    &ov05c10_ports,
>> +    &ov05c10_port_node,
>> +    &ov05c10_endpoint_node,
>>       NULL
>>   };
>> @@ -140,7 +241,7 @@ static const struct amdisp_platform_info 
>> ov05c10_platform_config = {
>>           .dev_name = "ov05c10",
>>           I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>>       },
>> -    .swnodes = ov05c10_nodes,
>> +    .swnodes = amd_isp4_nodes,
>>   };
>>   static const struct acpi_device_id amdisp_sensor_ids[] = {
>> @@ -232,7 +333,8 @@ static struct amdisp_platform 
>> *prepare_amdisp_platform(struct device *dev,
>>       if (ret)
>>           return ERR_PTR(ret);
>> -    isp4_platform->board_info.swnode = src->swnodes[0];
>> +    /* initialize ov05c10_camera_node */
>> +    isp4_platform->board_info.swnode = src->swnodes[6];
>>       return isp4_platform;
>>   }
>> @@ -257,6 +359,7 @@ static int amd_isp_probe(struct platform_device 
>> *pdev)
>>   {
>>       const struct amdisp_platform_info *pinfo;
>>       struct amdisp_platform *isp4_platform;
>> +    struct acpi_device *adev;
>>       int ret;
>>       pinfo = device_get_match_data(&pdev->dev);
>> @@ -274,6 +377,10 @@ static int amd_isp_probe(struct platform_device 
>> *pdev)
>>       if (ret)
>>           goto error_unregister_sw_node;
>> +    adev = ACPI_COMPANION(&pdev->dev);
>> +    /* initialize root amd_camera_node */
>> +    adev->driver_data = (void *)pinfo->swnodes[0];
>> +
>>       /* check if adapter is already registered and create i2c client 
>> instance */
>>       i2c_for_each_dev(isp4_platform, try_to_instantiate_i2c_client);
> 


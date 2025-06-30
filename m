Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5FB28C2B7;
	Mon, 30 Jun 2025 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297671; cv=fail; b=lq05gDiYsKcKQJMEUgtY9c8i6DVFY3NRRGnHSCIHNwt2dcTtx1mySGbVgrzDUYkAlX1/m/9+d6L5C+mlwzdUnkz11a9J5hsAOhLFy4QErUNZsen07RjvpEbqjynOGaOfFz0v36q9A211lHUtYbfxv3534LRQBlsLXzha+v3pw2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297671; c=relaxed/simple;
	bh=jo1YBd/nOet2Q78u364gtxijcoNwqULYf+yotKUi0RI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r110swyCAgmpIQ5bYCnRFpCUkGZW67hcOOphtW5N6P68PZeGrQUzYRuisibkwtjvYRgGirKx7lc9xX1U2/4wbUiq9m/70vbj01Zev81OrbyREFvdAzORz9nDX/CgxQHdWxnABlb3Mc5t4ixoGxzHgW03QTdmfzW3xnAQ9mu8zHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JS3kmhUz; arc=fail smtp.client-ip=40.107.96.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JS3kmhUz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDFiC/oL3ZZwJgtUM2sImrN24K4XNpUlmKfKpLMco9JpwQeIvTLUjA43E2wbkXGp1GHk9cS/LHguk1PQ7K4sLZdpTb5DjutTeele0FnbEJu45B8cJdTtD4hUjenA7lMeeLKSTbtFKJi5H/5pdjZv40L7U44cmBCKi/EFi2JvuLWcmxVA1zIE8JLTtJBvdYw9yiry0SmVj1yS/IbBT0C1zfFO119Etm3pqmpzJBe+z7HMuw2PJ9aEANosa/GnYcPPC3/T+W3urV2N7pj/Ds7F9NENhgmFqWOM0cX64i2gv78U1XBIvKGaE9u+GZeLSZSmAmkLbXRd4SSzWvAGUtYaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfcAadM9gu7EvbIi3W80seTVuBjevKpQdAaXkKKhrPM=;
 b=ny9dp9l1It1Dy/jnnlPTqmP5UvkXugdu+DbOOiW+TjoyW0TpXXlzVUxFbtMq/jSsO9ghlmGCWV02o1e2Wv8kmg4qhziyHOu6Qi7Etk2wwZVdvs4D7cr4xVRAI9Ne9z1oxN/cogLFXvC+kyPTR4IIFpK+VBDv6DpJntdczg7T6NrIlgkbAMzzZwwyDkjgk7KuH5JszfT46gN1lZGyKSvfRK/Who/BcmHGPO+hUrnsRBsoun2VtuerwUkBPy4SFGThCulGTr3gd4/ZeSM/XUWAkSG5XUWv9907wLpucTjW7R2mwmBFu64aTxI9SuLQeTWZ26ChFY/AJHE3Nuw9wD4kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfcAadM9gu7EvbIi3W80seTVuBjevKpQdAaXkKKhrPM=;
 b=JS3kmhUzPHl3D2YVaHN4D98aWRK3TwDEoE5AdJCxtBeOo7bKACLgu8jP5pZ7KERRaOtYhcoUmBi12p0xZ6bzVJll9rtb664CL9cmKn654wiNEpaAAeyiLlQLjChGb5Pwquz+4FWiOqb5BejW4Cm4vio6RXSatGu3eXGWMb5CQcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 15:34:26 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 15:34:26 +0000
Message-ID: <295f6b46-4820-4ab7-b560-f05dac817b01@amd.com>
Date: Mon, 30 Jun 2025 11:34:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Update swnode graph for amd isp4
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 W_Armin@gmx.de, mario.limonciello@amd.com, Hans de Goede <hansg@kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, Dominic.Antony@amd.com, Phil.Jawich@amd.com
References: <20250618202958.3934822-1-pratap.nirujogi@amd.com>
 <175127518473.2486.7831984908188662697.b4-ty@linux.intel.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <175127518473.2486.7831984908188662697.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0304.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::20) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|IA4PR12MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa34fa9-43fb-4419-9b77-08ddb7eb9879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVI4cHNQN0hTQ3lJT0Qrb05mMHJ4cFdxMnNsYytSSUNWenNITHd1Zi9FUGs0?=
 =?utf-8?B?ZnhjU0ZBdWVQdlROeTFMZ3RGSDlqUmhtdHNTUWt5TkdMb1VuYU4zL2o2QzRD?=
 =?utf-8?B?QW4zcnVwa2wyMHVGUGNHTDZzSitYVlJ5NnVpU0o0REVoOFJjekUzMVg1L1Zq?=
 =?utf-8?B?RWJqLys5ZXp4MlBjc3lzMGxoTGpxQjB0aEFmeFZDdVF4bzJTM3Vkd0IraUVM?=
 =?utf-8?B?WFdTcC84MXhrUjBkdDhxRW53RDJvN3Z2c1dLeldhOE1SNVNFcWtNYWhoZmZ3?=
 =?utf-8?B?eFhvN2liajVPZHhEY0I4OXJQWnU4R1MzN3hJcDE4Z1NiWS9PejJhWEIyQjNK?=
 =?utf-8?B?dW9GbkFiZXJpQ1VaZnBxbGRyNnRycWxDbXpaZ2tiYzhxNnRRUWlaQk1uVVlR?=
 =?utf-8?B?NGI3WTYvTXJybEFRRlk3NTYyN2trV0hObVdUVmV6cGtRWTJPYlgxZXlQTnFl?=
 =?utf-8?B?T0hpZmNqSVJqUmxrUjc5RkJDNXEwZFR5N3JkZ3RveGlaNFZjVHNRQkNGSkJo?=
 =?utf-8?B?SWVhUjl5UzRPMHJNeUhKbWN4T0JNT2p4M0txT1hzam5TYWo2TVA1b0NYbmNl?=
 =?utf-8?B?cW1RMzR6bHNKbSs1T3Rzc0dtVVFNQlhvSkN5a3NmWmpvV05ZaTQ3dnR2T2hs?=
 =?utf-8?B?R0JRQzhCS0VDb2lBSVg1bXZ4WVA5czI4TjJEQXhMR241UG9ZVHJrd1lVZnQ3?=
 =?utf-8?B?QVVPNC92N2tjZFFlaTJqNmZXOUprWFVMcjlJTS9Xcm8xdC96TWFwYlQ1RUh1?=
 =?utf-8?B?WkFtOEVkWHF3VzlwT1NNK0tDWWJpaENBY3E2L2dyckdJOFF5cldlY3lwK1ZL?=
 =?utf-8?B?U3RFbDkzNERBU1h4N1c0a2t5Y2ZCZE9TT1VJaHV6S0FQRXJDcEtvOFRzeVpl?=
 =?utf-8?B?U0ViQUNYRW0vU2N4cW9UbmRySmlFSEFlYWlnZHhDV2R4NzRzT1N0cE05WmZt?=
 =?utf-8?B?WUdSTDlXYzlOcHc0TmFOZWN0U053NVlYVG9VUEI2WGlWdWNNTW80emdzSisw?=
 =?utf-8?B?cC9CNzdzZlBzTFZkWm1DMGNxMk5VamN4bVl0NS9VM3JMSmp0VzNnbzFqSURs?=
 =?utf-8?B?WHNxRm8wZ2UwR2lJMm8ybTU2OXBqK0p4WWpBNUxaNUxkMDMyRGdlMVc1UkRL?=
 =?utf-8?B?dU5paEVzRXNHNlZ1aXNOZXNVd0thelhYWGxnL1JUTmJ4b250Q2xDOGovdXZW?=
 =?utf-8?B?ZXUvUmV3czZRWEtETGpXeVozb2hoSk94cGFmeUxMTmhMSWZnS1l3SUdzTEZk?=
 =?utf-8?B?ajFydkZaZ2h2a0FTNFZ0bHNRNVVzcE1nL243VkU0Y21UYnMyL05OdW9ITUV5?=
 =?utf-8?B?clp4ODZiTnAwSlQ5Z3dZejRpVGo1S0wyUzFmK2pJK2F4UDR2ZERwU2lLSHJ6?=
 =?utf-8?B?TjlnNDBUa08wLzd2WXdTTWVtdnNCNzdwWXh4TXJleXNReTh6dFBhMTR0UWFJ?=
 =?utf-8?B?OVlIWmVRNkxyVWUvWmFBOFFPNGNWMElqZ0pHSmRLVjlQMFNGcjlJc0xhU1ND?=
 =?utf-8?B?Q3ArbGtuR0VabDJMSUdFTXcvNE5hYVRKK3BrdlNIRHpqTm94S3R6NEZybUZC?=
 =?utf-8?B?MlpRSjM2RFpyVzJrWmovVURXeU5XalBoZ1BKdExCMHQybHFYdlo5OW1oNWpT?=
 =?utf-8?B?TEVRQ24vb2NOUHhRU1haTW9yYncvTjU3OFhodDM5Zzk0dmdpOEdESHIwSklS?=
 =?utf-8?B?cWZnamdtK1VzNEVLWlptdkZYK0J3NTJxc3lWanZaRUdVOW1oRXhjY2pZeGFz?=
 =?utf-8?B?TVBLY1JJUkl5NDJlNk5yOHd2eUpoWHFwYlpGUFh0ZjBPM2FDR01jVjl1T0k1?=
 =?utf-8?B?QlhvY3o0ZDRxc0p2OUdEdFhNV3U5ZWpoUjR3SmtENWJhdGJ4L2lhaEcyc0Yr?=
 =?utf-8?B?WlNGVStjdlM4azlQbHZzZStlbmFMWTBOTzBIdHZtbzVsUmpnbFhZQUNWYW1V?=
 =?utf-8?Q?HvPsl5e6dmw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjliVGJvRC9PeHZnd0pxKzl5NWlCWTNZN0dnZ2tPT09QeVZoNlIrTlNSZHdl?=
 =?utf-8?B?UDgvM3FKNm13S2lvK0s1VHNEanlNZEkyNk1uS28zTzdYZ0EyZHRKTzZSRk5P?=
 =?utf-8?B?cU9TSkJpc25aVHhXeHU0aU9wWVl3ZktkenpCS1lXQnZOcHJkalhacXFyTXZ6?=
 =?utf-8?B?RTgxMXZBMVJqc29BdHJJMUVkTDlaSy9CZ0k5VWhUck55VDNHODhPT0JGNCtm?=
 =?utf-8?B?OWl1YXFWbDczRVgzUjVGODNlODk4MmV6T3E4dTh4SFY2djR2M1lUYm10YnpY?=
 =?utf-8?B?MGl1cS9Md1dnM3ZxWE8xVExOU1hoQ3B5UWpvbDhpeWJCQ0NpSlRmSkdyNjRF?=
 =?utf-8?B?ZGF6RjBBSStjbEtGSmc2cTNYRi9nYWttTXkwQ1ZEcVhLR0lad2orU20wbTlH?=
 =?utf-8?B?aXhrK1FFUkdwWHE1c2pKeU0xY1M2WWg4bWo5U2JOYWlQdEFZTVpWYkZHZzZ5?=
 =?utf-8?B?ODZsUGNlQU9naEdYVkdRVEQvNVVURlNOZDZUSlpYWGJNNU1NdEpCUFNlOUpT?=
 =?utf-8?B?OU9HTXJ6MDdsYW0vUU9aekozRnU5UmVHeEZxNWdnZXorUTRXZzVocHhtL2dI?=
 =?utf-8?B?S215UCtzdXJCdHliNmh6SlNJRWttcFFkY1diS2tMMTFaM1crZkxsdmIzQmVM?=
 =?utf-8?B?T1JITDNEeEc3R3duYUxMbDJLMjNnbnNqOGtuZ25MR1Q5a2Z3NFdCUVlkdFNo?=
 =?utf-8?B?TmlkTWczL1F4b0EyNjNLYWZGUWVRWnFndmhpSG5ndHlXamxZTHE1QXlRcThP?=
 =?utf-8?B?ZGh6U0FSbG1pNTN5bEQrdHJXRk5ucWxGMlZHcGZVMVkzUnJ4VG5oTGFkRC9t?=
 =?utf-8?B?VThNVVphczR2V1g5eVJKNSs3UEYyUWRMQjJSU1BGMTNsYk1UQ1RYRVVnTjBO?=
 =?utf-8?B?SjYrL0VPRmszQjhSM0FOODVFbXltVDBnVXZkbEp1L0FGYTAzcm1xNlFlZjA0?=
 =?utf-8?B?U3FNN1FBRUo2YWM0eVJvZ05rM1Y5emdaY2ZXL01YZXhoMCtQd0l5ZW0yN2hC?=
 =?utf-8?B?QjI2dmVGdnZsb3VrOCsxOFl1cFVtMXRudjNLQTRDTWtZRnRqenA3bGg5c2FE?=
 =?utf-8?B?Ri9VaFQ1WXFKUDZTYmFuWDlyL3BEamE3L2VqUlJ6UXNHMnpNVkhwOEY5ZjdD?=
 =?utf-8?B?alF2ZWpNbHZkcjhxYmdDSDRrMGFRQUN4Qy9hd1AxUzRxT2RlQThZQVZFMm1B?=
 =?utf-8?B?dWU3bXhndFlEaFRpa281bmM2UllvanhMMkYrTmdQMVNLbGpMMkhwZm54N3FH?=
 =?utf-8?B?WUMwSjdRUHBzM1NIKzA2VGxYZjVLN3pPOUhGTjgydnJCTnpSTEMwN3pwWWt2?=
 =?utf-8?B?RWVxTkt1NjQ5aXBkQ1phTGJEMUJ1NUF3NE8wZkdtSHBEMS90cENPdi80SlpO?=
 =?utf-8?B?U21za3M3VVpIS0VWc0M1ZFZaNmRva0xUOXc4ZkNBQ2V4S2E2S2lCK24rZzhI?=
 =?utf-8?B?TVkvV3RJY0xkT1VmZG5UNnBEZDVXbUNzK2tUczByVWxEUFZHVUQ3eHdnUTBE?=
 =?utf-8?B?WllLL1c1OUdvamVQdUdQdTMwL3V4R25ER0NCYW9ZWnhCaWQ3bUZXQWk2dWVU?=
 =?utf-8?B?ZmxiblFIazQ2UzZIeVpNSUJ3a3NMNkZyN3ZXS25Vc2V1Q2Z6Um96eFNRR25u?=
 =?utf-8?B?ME9NZnNBTE52NkxnWTMxU1NKckU5LzRqQ25oamFiajhoamRSdUh4Ym5VSXpt?=
 =?utf-8?B?bU9vckhwNUxUNlh3OUd3KzUyR3ZhbXlPSStqbzBLUEw2U1BpS1BOQ25WRFZE?=
 =?utf-8?B?cXNac0VWeHpzajVaMk5meTN5bHVrMTJMNzdZOUkzZWVTNnY4eGsxSUFCdDdi?=
 =?utf-8?B?Ny9wTzVXakowaG1sZ2Uzb3k3VzE3OXpDbTRzTnBEeC9QN1d4VHJrL2dVRXhS?=
 =?utf-8?B?TW1sTzhROHl1NE8yS3JDK3U4THh2L0tpYXdzUmYxNERiMHhNc1ZQdUIwdG55?=
 =?utf-8?B?Z3NSU1lBbVk2b1ZHdGE0NUZPTm9rWGZpTTF3RFF3ak10S2o4VWkyKzNaYVI3?=
 =?utf-8?B?Qy9pdUFGY2xNcktRQjdNS1NIZFk5TlVZb205ZHNlOFNMOUFTcEQ5ZG5FZjgx?=
 =?utf-8?B?eUtLYjFsb09QR1dxS2tzQklxK0hUb202WkpncDJvMm8wK2h4bWY4U3BzNFZP?=
 =?utf-8?Q?3LS86Tb9yxBaPLJ0NAOdDm0UE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa34fa9-43fb-4419-9b77-08ddb7eb9879
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 15:34:26.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM3uuBRwoPPxDOSl6mhUjGdWi6rXenHMLJkBU05rtFE8RYVMRbrS5VRwCZgah+qNn20J8pPqEZUhvXjDOfxk6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9788

Hi Ilpo,

I'm glad its accepted, thank you very much!

Thanks,
Pratap

On 6/30/2025 5:19 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, 18 Jun 2025 16:29:48 -0400, Pratap Nirujogi wrote:
> 
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
>> [...]
> 
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo-fixes branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
> local branch there, which might take a while.
> 
> The list of commits applied:
> [1/1] platform/x86: Update swnode graph for amd isp4
>        commit: e1af6f0146d64fc4fb142504ba128a97cd171558
> 
> --
>   i.
> 


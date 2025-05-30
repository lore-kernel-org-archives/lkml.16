Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F2318CC1C
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748587954; cv=fail; b=mncO615/6SwkMDKUDnXysuRdEfkG/8+3sMZWgpkUcCz+lnOKWcM8KpDfJ0/N4J8PwLbwn/Yv5vkRFDOQzpNUPXngdTqX5Amr6YRQuiw9SG22sAvwlHawV0Iy6lLpXuhFNMIh0Zz2+j8V+Ux+cWO+yRx6L85h9JX+0JXOmEu/LIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748587954; c=relaxed/simple;
	bh=rrVpZ4C+k2j5Qh+3EfpZYqSuWwOGKQk+H4UfMzugBX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YhbamUczDxiAdCxANOit580dTIAIcirlnR9DluqnHyUV0k5bw3lOZK/su8F9M87H72k1b20L54lJa4PsPB0AqRtQjMl5Eeg4i5XIkV9oBHsbG9QzvUKkO8ED0ermc4kmXn5JUHfRyhCrBtZrZk2xSl9X6Smhr/27MQBCEDNVwuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=sojUQbKH; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="sojUQbKH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w318k0u5VttR3409EyIPBl48HOl9VTQbuyZdXbFWkpjClPl0tBSICRJ+9d6c9JCmT241PnGFc9arJldbK03DRiTs/+/kti31snbQf0CbVBTefRHeDxivcv94Oa8k5f9Tqz732XWhWNQsIh2e4Ocz32UB5e6ATno7QALDtNzwC87GmBQYm3NybehUgF87l3+qRAkqvDl2q4H+3waR0wj/Fj8UPTeCRCthBJo1WLwyBmA5768uCMJAeDoBjHQ/8LlyvALPiYYrNGYJUPYULKjDdI6dTKxadEZJbSj5Yve+UyQakxhe9i9MC9c1TUeWX8fh3ZX4IiKqrlY9geOcH4sYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXNgEGjbImgyY1wFDI6T88kTDY0r2ArApxF9+JB/vbs=;
 b=I1Aa8MsYXxN28ITimDvTK23ROfyRHZ8X6WYzgMC9YEYsYLOmqjzyUbHjiy/It/d2ibvCilJ3kTTFLCv4XguVGEwW+89h/LTI6r98yoXQ6geNTEdpySw9Kzdsd/IgA47cb3lH6yUX1uvmDwvIsgPJzUdV92PektYzYDIa08UREfsc8CjwNS5AOy57rpCeurCbbt+zNLYn3OcBmIzBT/juerWGUjm+BPSufUNSc+Rf8rv2XQ+pDZE0qUf7VG/vd5+lWaWWnfk+zdAZVWhuz+GPdjfC/6Q1T6dC3KV2jUtz0vXH6iTUzw3WMtiAMYSSjlP0tnWsdmS0uqFD5qG78TCUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXNgEGjbImgyY1wFDI6T88kTDY0r2ArApxF9+JB/vbs=;
 b=sojUQbKHnzDU5QqJcTP2YW6Y6GYD7rmDqYKm3vAhY4ZEIIOOHniU9ro7z4DlgZmpPKC5eqnfX1kJbv1KbmFyxlnH48SU6LVT7tEaK5v9E8UpYjGEP8EvoWMC3VqCfwiZlU55gLHuCBohnqjlc6Stgn60ntijzI+xu+URsKOJZuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB3822.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:447::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 06:52:28 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b8c1:9057:bf46:cc35]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b8c1:9057:bf46:cc35%7]) with mapi id 15.20.8769.031; Fri, 30 May 2025
 06:52:28 +0000
Date: Fri, 30 May 2025 15:52:26 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Yuanchu Xie <yuanchu@google.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, yuzhao@google.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: vmscan: apply proportional reclaim pressure for
 memcg when MGLRU is enabled
Message-ID: <tr7qytjgy5k7hqpd52c2r4vvdae4q3fqoux53hilj6uewidlj3@pljgaa3mzkdd>
References: <20250404141118.3895592-1-koichiro.den@canonical.com>
 <CAJj2-QGifr5RmzKUB_zL76H_qis5zxR50pOik9n-Mt6-_s_2Bw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJj2-QGifr5RmzKUB_zL76H_qis5zxR50pOik9n-Mt6-_s_2Bw@mail.gmail.com>
X-ClientProxiedBy: TYCP301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::14) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB3822:EE_
X-MS-Office365-Filtering-Correlation-Id: ac002409-cfbf-4f36-2acb-08dd9f468aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emJrWkIxTTVzTUk1eHdqMnZqdElqTkhoOE5HNktPRk9wTk9DZCtNL0QrNnFO?=
 =?utf-8?B?RXRzQ0laY3NHOFBPOGhra0xHakhndDBRc1d5Z1QyYmNMSElvbDd1N0dIMUZN?=
 =?utf-8?B?YnpWY1lyQWpsYjZLZERMckkrUVI1bTUwNG5STXc2d3VzQ1VVa0hlbVRkamNW?=
 =?utf-8?B?TjVoNDF4OHZkcTR3V0VSdDNkRVprUmtQdldVUHIzQStwYWhjK1g0SFlMbTFI?=
 =?utf-8?B?ZjhNM2dYbHhqTHZocG1nMGMzc2QxZkxQYnhtWFJORmZEbG5OZWNZWS9adU81?=
 =?utf-8?B?cjlzL3RxNVZqUG5Pd2ovWGhPT3lwdVQzMFU1QnJ3c0l6TGNtK1ljTWNDL05u?=
 =?utf-8?B?RjNzVXdtMldYSjdrclFMWVMvQ2xCUG9DY2tzV2t0WkdWUWFiQnZKcmtDUHRC?=
 =?utf-8?B?ZWZzY09qcWMyZ0RiQTZjdHFSZ1Y2SktpYXg0T3pPQWRDNGdPb1ROdnJRR2ZQ?=
 =?utf-8?B?N0J2RC9vRmNhTHAwZVIxRnVlYkk1UEdpemRncGE3NHA2S2V6OHF6VG1JYzY1?=
 =?utf-8?B?VnFlUm55cUFYcFhheEM2dCtPWVNLb0k0b0ZGVVpXTmpRL3ZucHlsbytDbGtP?=
 =?utf-8?B?eTl3ZjQ2UDNhVkdJcnhEcmUvTFNjWm1hK3N5MFZlZUltbkhxVDdUQUk0eWlE?=
 =?utf-8?B?RWdOR1BWU29QTkhDeGIyRGxNNERFcWJQbGhGZVZHOE5rSTE3NDZuZy84Yjlp?=
 =?utf-8?B?eUU1OWF2NVQ5YXFLT2RDOFdNalppdTR3OHZPbjBZSXY3bkdFNXBxdTBUc0RL?=
 =?utf-8?B?VTJyN0VEdUhHV29IZGlSMVkrZlQxUnk2VGRDdE9vMGNJRWF5RmZOOGxGYjRo?=
 =?utf-8?B?RXJTV0tvdkROczdEZzVjZnB6R1ZCOUhvTzhzTit0NUNJQ29xNWVlY1ZvQzJa?=
 =?utf-8?B?Ti9pay82bWNYVkszdzRwZW9PeTYxSWZIRVJvcE52WXQ2dHJwTG5leVVTSkcv?=
 =?utf-8?B?VWo2TXp3dkJjNDlxM3Q3c3dtbWoyRnBpQmxtZElCbjBLTUQvM1V5ZWI0ZkNG?=
 =?utf-8?B?VUMyZWhJT1JKNHc1ZXdNOTZvM2N5QnZ3RHpKMXNhLzRBT2xCOEUyWkZpbmFX?=
 =?utf-8?B?TW1LMllYUmNIZGtTWGxJSnlzVXRjY09UbWc2dStpUGZkdVJIb241U1JIbit6?=
 =?utf-8?B?VlFJMFNJNmN3MWh6ZElVL21kNzRGQXZhcEp2bmtrZHZyOGk1WXRURFJOT29L?=
 =?utf-8?B?dk91ZUVQaFBTOWtxQnNvai9OZENZZVZ3RjVPcFBtcjd4a1hyZFUzYXE1UjVK?=
 =?utf-8?B?cGk5aEEzVUhSZVRqYzZuTStqK0RJQ1NVVEwzZzV6d1RBMGVHRHd5U3RaUmor?=
 =?utf-8?B?RzFMaUVCenNXaERibWFxeUVHOEVLUys1YThoL0M2dFZuUndYYlZLc29rZXJj?=
 =?utf-8?B?Y0JIdU44ZHl1QnAwNmFscnlTQkVHcjFtdDdBdlJrdWtWTXVYVTd6QzRYRXgx?=
 =?utf-8?B?VkJ0cXNsZkVUZU5INEpPZGkreER5UWNGMTNHTlZNTUVxZ1M0M0JBR3FEd2pk?=
 =?utf-8?B?aVczUjZsay9ZNUppWllObk9nUUsvN0FldFZERzVXSXZnWDF2RkVXd3NTaWc1?=
 =?utf-8?B?LytFNy9RNjd5SkZTeVZxcS95ZnJISmUvWW1XUFA1M2w1VmtrNnhBN21kd1JB?=
 =?utf-8?B?V0pCSDFHMHIzWGJzQXgzR2VUUE5lVnU3SVlaTWZEUlNyRStydkJsalhwUi9J?=
 =?utf-8?B?cGh5S3NzYzU0WTB2WXptOTRydzlKZW0xYjErUERvZzRMUGtyMjBKMmtBZklN?=
 =?utf-8?B?NFN0US9kaTNVRG5HY0pJZWg2Z1VhUXhLV3VWMGp5VlJTdzFRdDJ1Q0U1STRQ?=
 =?utf-8?B?ci9aME14QUNwZVZhcHh6cVM0cTZ0YmtDZlZCbCtDTjFrUzB6cEtTNkVVbWFV?=
 =?utf-8?B?dFRubzI5RmkyZ0crdy9JYWhMbkJGSUlxTkEvSDYrOTJobTRsM296MEY3dTFJ?=
 =?utf-8?Q?pm+KwjintRs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0NtMHZxc2F4OVhRQTQxZ2FVU293V1lSRlM5Z2RJZTFDK1hoRFVNN1N0dWdL?=
 =?utf-8?B?d1IxeEd2Tlk1cDZMUDZCRUhjUzI4bFl2RndOMXhqZlV3TVpDeTVxd1N4SzJR?=
 =?utf-8?B?a0htYWNqU3FUMFMrbUp4NGg5NlF5N1E4T1hYbjRwZkV4aHNWMUZBZUtVWUhw?=
 =?utf-8?B?K2ljYy9tQTVSazRYV2IxbVJiVldDeDdNTUJCRW9wdHlwT2JZVytEdS9ncTVB?=
 =?utf-8?B?S0RKc1hiekM0QXYxU2MwLzNzVnBHTnlZRjgrczB4dnRPM21oWFQ1OWs1YlFn?=
 =?utf-8?B?NTBPNUxJRVBuV1RlckNlUG4zeVR0WHhiSzFJZWkwWERaejZnOVgzQUduRno0?=
 =?utf-8?B?WjZCalptTUVZTW8raWNrcDJ4aytodmJwaFJyVUFHcWx5MW9vS00rajlIcXI5?=
 =?utf-8?B?ellSS2Uxc1AyeDRhakI0ejhBZEl5Q1JKVE1mcStrY3RpV0krcWJ6VHdLZGVO?=
 =?utf-8?B?aFJiWkYvcXpGWEZOT1pRTDdyRkEwQVZTemg2a2NLN0ZuZXlxYWZrNEU0R09P?=
 =?utf-8?B?YUFiWjZvSlRrZldSemQ5S1AxaG9zT09CcGFMTHVCSlllNGVnK1Y1Vk5tOFVD?=
 =?utf-8?B?V01JVVB4NDBNRXNpT2lnU2FySnVtd2IzV3JEbzk0dE1pQTNycDB2SnFJSGIv?=
 =?utf-8?B?Ly9UWkY5L1BFYndaNmdqaWZkRlFOUjRIUnZpZVVid0dhK1FiREZOeE9LQk82?=
 =?utf-8?B?RmRxbVgvQ0FnT3RkSi9QSkUxSGp2VUZxV3pQYjBQWElVazJZa0pIOXljUUN4?=
 =?utf-8?B?N0RwTjBOY0YvVHBCRGVWTHNLNzRkQ1dZSVp0YlFDOUdhS2RIbjZXVUl1d1I2?=
 =?utf-8?B?VzBwWFJCVURGY1g2Sm44R1FDL3BsYTVBMHBYYXk1Q0g1ek5ONVZ4NzJkd3g2?=
 =?utf-8?B?TnlDTVpvOHF3bmNCelRiMGg5dDJBcUFINmhDd1R1M0dvZzBrV0FVUi9vOVda?=
 =?utf-8?B?M0RRUFBDUWF2UXlmNjFtYTFtQVFlbWxScXRqRlBlRVVFbkJpTkQxbWpjeVBB?=
 =?utf-8?B?VGVPL0IrNUhrQW5QbWlPRzhRd3NrK3Bac3YyTFVaRmxlUVpTUGVycDhWUnA2?=
 =?utf-8?B?eWd6ZlE4RUoxSmhxUWxyVmxXVzlNazI2cVJFMitoVXhqKzIvOUF3TjlaeGNG?=
 =?utf-8?B?VmwzL0VnZkhhSmFiYkpjT2daa3c2bmVGZFR5dWNLLzlCS0NMbU5JYi9DRngr?=
 =?utf-8?B?MFVwZElXWkxMNG11RDhaNHVYV29jM1B1UDhKQWo3ZThFK3hHczREbDIxNTl6?=
 =?utf-8?B?b3Fla2RoZ2Q5UFE4ZXF6Y0NoTTliRU9mcStycEI5d01iaDV3K3UweUVaekNs?=
 =?utf-8?B?NDBSNGlOd2M1T1QyYWtqd0JxdkszdGhRQThoaGwvalZJdWdkdUVlR1E5TmV4?=
 =?utf-8?B?Vkg1bFhINm85UXBaWXQ3UnpmcFh4aGJRaExSdVJ4Q0xtQXBCU3pjbjNKMUtw?=
 =?utf-8?B?YlMyTTY3Smc0aWgxK2g2Ulcrc25EakdBaklPRnh5MlpVNFUweU1Rek5XdUhY?=
 =?utf-8?B?b2dhUVdzZXJvMFFHa0pna1c4V0tRWWVNT2dJd3g2bjE3VFZLV0NGOXRBYkJB?=
 =?utf-8?B?eHByT1M0TVVGakhnQ0l5bERTWmJyaVJ5ZjUrZ1A0R0VYbDlzMzMyRUpuNFh5?=
 =?utf-8?B?WDhTVEFiVjRkOTNQTDRDQisxMG9BMElWNTJGcFhXNGZUV1d5TkFOWkEzSkkv?=
 =?utf-8?B?UmxOVVBlRWsxTXo5UUtZMllZZktXWlJJd1M4SUg0eEc2Q1d6NjN6SzVsendI?=
 =?utf-8?B?VTRNdTdLWEl0dE9FeDhoMEhkUEpaOU4zcDZsUXgwT0VwbTcybDlLVGF6WVNT?=
 =?utf-8?B?bzRFSjc1UVVOQ3g0QW1jQkFMYjZwNTdoM3UwZDREdCtUT2dXN3ZPalJaZ1pI?=
 =?utf-8?B?L3Jnam9QLzEvSDlTbUNYaXZ0My9JajBycVZLNnZ2NmNpSWVqb3oxMTdzaG5P?=
 =?utf-8?B?N1hGb25PeTVCVzVTVnVaYWxnNG5hYUF1WnhTaUNUa1NaTEgzK0JmV21TRDcz?=
 =?utf-8?B?anJmOG9xdnRiaS9iM083NkhPLzZySHVyd0daZjN6cVk2ZnJTVFk2NU83WWty?=
 =?utf-8?B?R1RsSVRYajhVa3A2V21SYndGTHBkWFRpUTlEb2lNbU52bUptVW02OGN2TWtj?=
 =?utf-8?B?QUZTeUVRYXlrNXpLWG5Jdk16L0ozMmFYLzdaRjdwVHhKRkpKazAyUFNtemNh?=
 =?utf-8?Q?cfSXQ4/Gswk79wFMCsV6LMw=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ac002409-cfbf-4f36-2acb-08dd9f468aa0
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 06:52:28.2141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Jm14XO53V4s5JNF0FhQ7U21Ldf5JaWO92W3xw6WhvBWrcQ8SBVeF2zZXHMqIMysWXRrWVCaS5nEWshYIep77Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3822

On Wed, May 28, 2025 at 01:53:19PM -0700, Yuanchu Xie wrote:
> On Fri, Apr 4, 2025 at 7:11 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > The scan implementation for MGLRU was missing proportional reclaim
> > pressure for memcg, which contradicts the description in
> > Documentation/admin-guide/cgroup-v2.rst (memory.{low,min} section).
> Nice, this is a discrepancy between the two reclaim implementations.
> Thanks for addressing this.
> 
> >
> > This issue was revealed by the LTP memcontrol03 [1] test case. The
> > following example output from a local test env with no NUMA shows
> > that prior to this patch, proportional protection was not working:
> >
> > * Without this patch (MGLRU enabled):
> >   $ sudo LTP_SINGLE_FS_TYPE=xfs ./memcontrol03
> >     ...
> >     memcontrol03.c:214: TPASS: Expect: (A/B/C memory.current=25964544) ~= 34603008
> >     memcontrol03.c:216: TPASS: Expect: (A/B/D memory.current=26038272) ~= 17825792
> >     ...
> >
> > * With this patch (MGLRU enabled):
> >   $ sudo LTP_SINGLE_FS_TYPE=xfs ./memcontrol03
> >     ...
> >     memcontrol03.c:214: TPASS: Expect: (A/B/C memory.current=29327360) ~= 34603008
> >     memcontrol03.c:216: TPASS: Expect: (A/B/D memory.current=23748608) ~= 17825792
> >     ...
> >
> > * When MGLRU is disabled:
> >   $ sudo LTP_SINGLE_FS_TYPE=xfs ./memcontrol03
> >     ...
> >     memcontrol03.c:214: TPASS: Expect: (A/B/C memory.current=28819456) ~= 34603008
> >     memcontrol03.c:216: TPASS: Expect: (A/B/D memory.current=24018944) ~= 17825792
> >     ...
> >
> > Note that the test shows TPASS for all cases here due to its lenient
> > criteria. And even with this patch, or when MGLRU is disabled, the
> > results above show slight deviation from the expected values, but this
> > is due to relatively small mem usage compared to the >> DEF_PRIORITY
> > adjustment.
> It's kind of disappointing that the LTP test doesn't fail when reclaim
> pressure scaling doesn't work. Would you be interested in fixing the
> test as well?

Thanks for your comment, it made me realize that there are two upstream commits:
f10b6e9a8e66 ("selftests: memcg: adjust expected reclaim values of protected cgroups")
d2def68ae06a ("selftests: memcg: increase error tolerance of child memory.current check in test_memcg_protection()")

The numbers I wrote are actually quite close to the simulated numbers, and
the test would've passed if it had been kselftest (even without the commit
d2def68ae06a):

  # deviation, but would've passed under upstream criteria
  abs(25964544-29M) / (25964544+29M) ~= 7%
  abs(26038272-21M) / (26038272+21M) ~= 8%

  # close to the expected numbers
  abs(29327360-29M) / (29327360+29M) ~= 1%
  abs(23748608-21M) / (23748608+21M) ~= 3%
  abs(28819456-29M) / (28819456+29M) ~= 2%
  abs(24018944-21M) / (24018944+21M) ~= 3%

So at least the git commit message should be updated. The issue is that
the LTP test is still using naive numbers and lenient criteria, which was
updated when it was ported from v5.16 kselftest.
I'm now unsure how the LTP memcontrol03 test will be maintained.

> 
> >
> > Factor out the proportioning logic to a new function and have MGLRU
> > reuse it.
> >
> > [1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/controllers/memcg/memcontrol03.c
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  mm/vmscan.c | 148 +++++++++++++++++++++++++++-------------------------
> >  1 file changed, 78 insertions(+), 70 deletions(-)
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index b620d74b0f66..c594d8264938 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -2467,6 +2467,69 @@ static inline void calculate_pressure_balance(struct scan_control *sc,
> >         *denominator = ap + fp;
> >  }
> >
> > +static unsigned long apply_proportional_protection(struct mem_cgroup *memcg,
> > +               struct scan_control *sc, unsigned long scan)
> > +{
> > +       unsigned long min, low;
> > +
> > +       mem_cgroup_protection(sc->target_mem_cgroup, memcg, &min, &low);
> > +
---(snip)---
> > @@ -5477,7 +5485,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
> >                 if (sc->nr_reclaimed >= nr_to_reclaim)
> >                         return 0;
> >
> > -               if (!evict_folios(lruvec, sc, swappiness))
> > +               if (!evict_folios(MAX_LRU_BATCH, lruvec, sc, swappiness))
> >                         return 0;
> Right now this change preserves the current behavior, but given this
> is only invoked from the debugfs interface, it would be reasonable to
> also change this to something like nr_to_reclaim - sc->nr_reclaimed so
> the run_eviction evicts closer to nr_to_reclaim number of pages.
> Closer to what it advertises, but different from the current behavior.
> I have no strong opinion here, so if you're a user of this proactive
> reclaim interface and would prefer to change it, go ahead.

You're right. I'll send v2 with this change as well.
I'll also update the git commit message as I mentioned above.

Thank you for the review.

Koichiro

> 
> >
> >                 cond_resched();
> > --
> > 2.45.2
> >
> >
> 
> Reviewed-by: Yuanchu Xie <yuanchu@google.com>

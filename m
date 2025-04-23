Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC6D2701A8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399967; cv=fail; b=KENQJY4EXqAHWY8MlnDvtpaAsnZMDK96AOlAJ9mdqyV6JVkRwO0Qb+DVNh63eU0dZkiJgGsMslt4eVo/gXczJyNzJmGS8Sv8Y/yjdMAe6BnBrTKIiOKIKKT9HI+y8Sk5DhzraIlTqO8nAtoUVP88wwI27jXK12JVH25029Tceiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399967; c=relaxed/simple;
	bh=dCtDX6mr7jXDN3z1ESe/5SDj5fWrhtk5Kp8VXpMI558=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dYD6vBZXRF4u/SfLjvo31TlCvSy33S/qhcM3PAEndcjS2L2jwSJohOfzeHdwSm95gvNHZL4sXlkrYWWJLcU51d6IrS2yUsS3vlWdWz9VXndkSh2tHfw19gQraCc/yvS5OwRom5cdV6Hq4Nc9ThjXhrAAF0rjWxs1qxP+SF0Z+fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vX3WCHP1; arc=fail smtp.client-ip=40.107.96.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vX3WCHP1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgbCEzKt5MKOkHIUyv44HiTdc7tHjS0TsuySDj0vQGJ6k7qjApaIbFrtrshXj3EvoPta9IZ+sSkopFvhIvousLrBbagB3tg3pDATU3yF3iFVixGvj/XBlPbN9gl5XGi1svEJAySkNwPZ1CV2oEZdkuiel/EbrhZhsWEO2HF6rTy80x26XDTKZgzbHvJfhzWTTURXkA4fpexGIPTmwHcQF08Q0Bqn0jj7Efxm0Bx+dWxGQutNlGj/o662zMLw2axyTLllFqjfEFuJI47Dmpt7wq9ZXNmxnCR+IIufZZMPI+Hfv92cLVV1gN7rKKEnOsUidH5jAUKLbnSU58UxrEqptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knlkq0LdJo6uQ7nE6OOv6j9Xezu8b8E7vj3M9iKwuoA=;
 b=Ifz/HR8Bxm3TPlYO7bwpqhzE8tgKVQ4HgHxQF1KG2J+fvgTBEbBQe1BLplrhGQl5WOFwIsui5KrZsKNN6L6LHBC36PXhBzn387NWMBnUsLuxKkUW7gNdkFb+87yQWE8zjWNsW0PAMx+FFjcr2wnhIzKUis2kmlaHlIi6k91Lnzap3K4QdtwMsF7It9QAjrnpy5ph9Gz8oBDr2oZoTTgt0CnZmfmo3CuCtXKugxAD7ClGXRdyrrh3IRBXzv3JYJwUWsIOcJDXsNfJ1wbDmZCnr6+m01bmQD8Rq7zEBslE7IE0fNNfy6I+u79no2q+shLWyaGSRC1bl9sFhceywdm6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knlkq0LdJo6uQ7nE6OOv6j9Xezu8b8E7vj3M9iKwuoA=;
 b=vX3WCHP1DuIFLlAun8VuQzN8ct9zMitgn1587ZF1aQbwr+40FK+i8fqUYS0pflpxoHsOI8IlS5RTTaRJOgfMraidyo2i1Z+vgNPCwjRx3+PEA2WyUP8WfH20moWlKhPuPMMWGL0PjVU+znrYFC9wY2p3B8twCTbvvciM3GhDNto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 by PH7PR12MB8106.namprd12.prod.outlook.com (2603:10b6:510:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.38; Wed, 23 Apr
 2025 09:19:23 +0000
Received: from BL1PR12MB5804.namprd12.prod.outlook.com
 ([fe80::4a0:2bbf:df47:e64c]) by BL1PR12MB5804.namprd12.prod.outlook.com
 ([fe80::4a0:2bbf:df47:e64c%5]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 09:19:22 +0000
Message-ID: <e65acb10-3f33-4f41-bf25-7fa4028dd693@amd.com>
Date: Wed, 23 Apr 2025 14:48:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
From: Raghavendra K T <raghavendra.kt@amd.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
 luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
 rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
 jon.grimm@amd.com, bharata@amd.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <0d6ba41c-0c90-4130-896a-26eabbd5bd24@amd.com> <87jz7cq9wh.fsf@oracle.com>
 <b7423090-4504-4d68-878f-7ea4cde2af45@amd.com>
Content-Language: en-US
In-Reply-To: <b7423090-4504-4d68-878f-7ea4cde2af45@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::9) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5804:EE_|PH7PR12MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 561ee854-3fd7-41b8-1ab1-08dd8247e2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFl4bnhiVHEyOFlMU21ndVZOYmwyQkZHalIrREF2b0xWODJ2cUNrVnJqMHNU?=
 =?utf-8?B?NFZtRUdSZUtST01kZHViWU93bndGNWw0TjgyQnJFSHFIdHFQNjJKV1g3dk9U?=
 =?utf-8?B?YWZtcmp5aFgyL0xaaUxpbDF0RzBBcjNaalhwSXErVVF2c1hzNG9NcUZyVzc0?=
 =?utf-8?B?RW9ZV0Jmd0ovOUY3VGtUS0g0c3IyamY1amZ2RVBNT0hBMEw5RnQvbTNIRERn?=
 =?utf-8?B?eE81bWRnNG5lQ0JRZzdjNGMxVW5KM2dOSlN0R2s2ZnJjeCtCVWNrZDFES2ZC?=
 =?utf-8?B?cXRFcnNJWU1TQmNkY01pejJhM09Gb0V4MXcwWkpwWklqd1lJZFdKYklGSW9j?=
 =?utf-8?B?L01JQ2QwN0htSWxMbExBVzIvU3JBT1ljSUdRM0lTSURwZHJua2xVcWY1UUxi?=
 =?utf-8?B?YjdRYnlZSnRLQWswZ21qVEFIVEZlRkNVYitVNnlXcE45WWVNbHhVcHczdUxP?=
 =?utf-8?B?UjJwd0kxT0wzV2FwS1VVRHZXMUZJUnhQR3FRbkovMGVqRWhZLys1SS9HWTVE?=
 =?utf-8?B?K28rQXhRWGp3ajlMam5RamhLTlVtb1V2QlNNM0hNWWhERitJRVJIZ0Z4V0VX?=
 =?utf-8?B?YVdzWGM3SWNMclVvUXhySDZKeS9oS3ROTFNKMlpXbEppL2dlSHZsZzNTWVhN?=
 =?utf-8?B?SzdxYmJXMHZ2YXhFKzZXM0NDTDVYdW14V25HUHhBQkx6cmc0ZDBCVERvVTF0?=
 =?utf-8?B?WDJFd2J0U3VZcjVwaEZuMXFia25oUkJCSUhJVS9FV1JUU2lqUTJBV042RFFv?=
 =?utf-8?B?eEhYNVowclB5Z1Q2elBTaHd2RTVzbldTNzFDcSsyUmtQL1pvTFdFQk0zRjVx?=
 =?utf-8?B?RkpqWE5zVlhUV3FiZ1hONGdoNEc1WEowdTVsQVJHSFJOTUNCL0JrREc4RGlh?=
 =?utf-8?B?TUxnS3ZqeXlIcGdNS0pkV1dCa2p3YVEwZ25nbTFQMFZOUitrZkVvUGlVNERa?=
 =?utf-8?B?NmhhVG9oOHpCVXlJTnZ1M1JkTTJtbHdaQlg2MTh6NUJaYWhpUGpiV1dkcE5o?=
 =?utf-8?B?ZFAxR2pROVFmaHBnR1g2T0RLRGRqYlp5SU4rWEZxMHdiZjg2RFNSdm9zL2s4?=
 =?utf-8?B?N1Z2QnNXdjFra0xhZld6V1V0R3ZlTlljcEtyYXpXNER1ZEllbkZNREJ5R1lR?=
 =?utf-8?B?YkhFMS92ZnN2N0pob2ZBa09QOVZlL1hiSUJPVHdOWWEvOTg0cmR2VGEzaGc3?=
 =?utf-8?B?amprTW5TY3htdWUrc05SY2twVk5qVTUrTjNkbVVxS29VQlhPUjZIWTFYbi9n?=
 =?utf-8?B?RzJhdzRHZnVReE5PeCtkSVNtRUhVa08rMUR4L29jNVlLYStRL2JnR2g4T1py?=
 =?utf-8?B?RmhKRysyY1NLczVvRENKUkJYTWFDODhwWDlKVkRNekliUkhiZFh4SWg3OG1R?=
 =?utf-8?B?ZjNpK21hcGlPbkQ3WHRTTGJwOWxJZzZIV2laY0lXK3ZTcVBCVENPQ1pQSG8x?=
 =?utf-8?B?bGFidWJ0aVF6L09MM3ZKdGZiN2xETW4vUFA2QXByWnlRYTIwZnFjZE0xZ1ls?=
 =?utf-8?B?RXBwK2cxTkE0cXVkTEo3OG5qd1pCTVlBNlhPM2JGeUlUV2tIYU5OendKc1ZK?=
 =?utf-8?B?N3ZmdTZ2WlZmTmJwQXVubDhHTldHR0dLOS9FM3hXNmo4dGFOYVR1aVhyS01W?=
 =?utf-8?B?KzFaVG9ObVJnSVdUU0RqSGs1T1p5ZjFMMVVZUnprNzk1SE4vMUhlWll5TVVL?=
 =?utf-8?B?eGRwZEVKVms0dml2M0JJT0x2N05kK1JHMTJsVTdzVU52UlNGcldhSVZkb3NZ?=
 =?utf-8?B?ZzF5VU5zZ3pJa0lNSEtTZWIrNExpdmtSTkZ2QXlCRFdSVDd4RVgwa3MvREcw?=
 =?utf-8?B?b2RIUzE3bE9sSnRQeWxZbDcrSmVwTGxtMXdSVmZCK1lycTN1Q0hvNzVqNDQv?=
 =?utf-8?B?a3JkZEROY2VuZFpuUitiVjdvTDRXdTFqVUlGa2podUlhaEoxcFBwdzU0QWow?=
 =?utf-8?Q?xaDYe+K6T1I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU9ZMEpGb0ZEUGF4eEs3a1l6Nms0Qml6cC92ZGdLMFJPZFppOE9iRS8vVE1j?=
 =?utf-8?B?aldWaE1iZURHeDNFTXdoMGlKbytTWXdMdGRMb2h5T0dNNERQSnBOVmpMZFpy?=
 =?utf-8?B?WjNNc0dHM2hDZE1zcDRKQkZtTlBnV1RYY3ZwK2hzU0xKTDRHcDNoaU4vOTRM?=
 =?utf-8?B?QW8yQm1WY0E5OTdiZWVaSWNPRE5UT1NUYVJ2SkJrZERrMG14WGEvdXcxY3BX?=
 =?utf-8?B?c3NkUk9UUG8wWXkwNDdRSkhQRVlCZmlOdVIwOU5oV2VCUWczMWptM0JQdjE5?=
 =?utf-8?B?UndrNGxuNVY1U0xnWElnNEJWMkQwY3UxMWdKVDVJYVRvWVkzZk5kTERnbjBz?=
 =?utf-8?B?OGxMcW1NUHhZbktDQzNlUmIvWnYxbmFIWFNxUGlSOTdwRy9vSDJwY2J3ZUY1?=
 =?utf-8?B?THhNaWtsdjgyMHIyclZBaWhvVnVPcE5Ib252eVZYdGlKbnZkWmJXUEExUUY1?=
 =?utf-8?B?bHUxRFRxWjVXQmRlZVd1V2YrT3FIalRFY3ZvbG0vMVhkVGtCUTl6elFlNnZ4?=
 =?utf-8?B?RUJPSG1SMktFVm5WR3BSR2o2enJkS3laVVc5Q1NsUFNHM0ZwK3RMSUNBNEdp?=
 =?utf-8?B?RDA3YXdBSk1abUFEaUIxRGJxWmRiekZIRUVWUEhOem1pNmtFbGxzM0I4ek50?=
 =?utf-8?B?YWJYMXdsU3J5VzIzRENSeHhlU0JGdjc0bTJmcmhNdTNJaHJpdHllbjROWno2?=
 =?utf-8?B?eXZDN0IrbGJGR29iKzhWbEdSbFRDWHg4U3RJYndwNXhzSkE0VFQ0YW5lN2k1?=
 =?utf-8?B?OTZjZW1rS0MyaVpoWm1mb2M0V2thaXZpVjJxMEprS2xCMVlTdXNreGxhZjJk?=
 =?utf-8?B?c2pKTFFlamxHTC9pUzZXMms2S3Z3azdIWmJEODZHaUkyQ0E4M1czT0k5MUhU?=
 =?utf-8?B?UjBYaWZlNVIxMS90aW5YK041VnhwczVjeTB3TE5ZNUtGalVidkQ0SS9ReWlm?=
 =?utf-8?B?YjB5YTExdG1wVGRoNmZvZUkzKzIxaktIRmFZSStINDY3QkZYK1hGWVNMcnc5?=
 =?utf-8?B?OCtZUVVISGk0Z29BYjJJSHdiaHgyYWc1dndVc1FJSFdna3p4Q0tXcHJwVCtS?=
 =?utf-8?B?YWxzMlBpVWNiSUE2RGo5MFMvbi8zeXBQKzUzd0V0WFlJWmgydGNhVUQyVFFI?=
 =?utf-8?B?U3Q5Y2lWdjN0YjRyVFhhakJrc3BGa1JQUGRQY090VzF0K1dyaTI3L21tYkN1?=
 =?utf-8?B?ZEh5Y29SUms4VzdTT3l6aGVXYjdRcjZuc1pWWmJFbmxjeGM4dW9IcFlPOU0r?=
 =?utf-8?B?NTl0S0pINmd4UFk0azcwcnpxK21tcU5YRmpyNWpnOUpRekFubDROWE1temxn?=
 =?utf-8?B?QzVncU5OMEsvL0Vjejl5WUNTZS9mZGhmR2RXdDdPNVlqeVdLaXNlZW5zRHEz?=
 =?utf-8?B?b3NhZXdrRjlwSGgreEtwK21DcXRDc3RUMnlGY0pPMno4RForWmpWaHRIQnBG?=
 =?utf-8?B?Wnd1ekdocGdGN0pSdGdUdCsreis3V0pJT3QxblFIR1NUSkZ4dEEydmNVNHVw?=
 =?utf-8?B?TGhDbTlnenlPd1dkbURBTm12aUVuWXBJSUdKK09MZG9Ua3NYTkdKZ2w4WjlO?=
 =?utf-8?B?L2MwNGFFUnZtRHVYS296V1RWRTJxYXlOVXJHcTFHTTdhcWVRTXpjbDJGVjZn?=
 =?utf-8?B?WldpRE12cGdlSHFtZ0VJa05odGpyeWRUQlkvM2YyNnVuWkJ2SE0wMDZSSkti?=
 =?utf-8?B?d1dvRHduVmhKL2pZWGZDaHFSSVM0WVhSay94aXk5U29GRjB2eUhwYTZ2TXMx?=
 =?utf-8?B?aUJBTTFwSXlUV2N2MEYxTkpoYnpyaXpNUmJTcEVhc2o5Y1NwS2FVV3R1dEdv?=
 =?utf-8?B?RnpyRGZXajkzNjlOaWQzV2NQNmlrQnhlT1JSUlVCVVlic095ZnNsQldLUWpB?=
 =?utf-8?B?ZmhTTldUbVhBdk96Y1NsVi9kUXJQMkc2WktjQkQweHJIVHo2b2FTb2x1enhx?=
 =?utf-8?B?eElld0o1ZjZ5RlpEdytHa0V4cmhtUXFxRGorVUpqdzJRQm1sQlROSWFBNUU5?=
 =?utf-8?B?NEt3Sm1YYjkwYXFOR25NeVh2cmlJblJUWm56c3IwT3oxUjQzMlo3bmVNSEZx?=
 =?utf-8?B?U0dCMXZQcDdqc0dQQ0ZMb2FZdkFvZ0JHVWlmcERZNmluTTRUcDFzTTdQc2Zs?=
 =?utf-8?Q?FcfQRBgdvmJ8KL9f2lDP0W4q6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561ee854-3fd7-41b8-1ab1-08dd8247e2f7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:19:22.8166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKCTERP1F15XxjLFHNQfY5HcJaF30vnHPQ84Y7pTD+iH00XM5GVoTI7smfiJBMq6XMNWId+bBJ+Jz+PKKRnVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8106

On 4/23/2025 1:42 PM, Raghavendra K T wrote:
[...]

>> Also, any idea why the huge delta in the mm/folio_zero_user 2MB, 1GB
>> cases? Both of these are doing 4k page at a time, so the huge delta
>> is a little head scratching.
>>
>> There's a gap on Milan as well but it is much smaller.
>>
> 

Sorry forgot to add perhaps even more valid/important data point

> Need to think/analyze further, but from perf stat I see
> glaring difference in:
>              2M        1G
> pagefaults        32,906        202
> iTLB-load-misses    44,490        156

dTLB-loads		1,000,169	38,134
dTLB-load-misses	402,641		33,992

- Raghu


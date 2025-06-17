Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022075.outbound.protection.outlook.com [52.101.43.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C05823B60B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193862; cv=fail; b=fkvYcd95x7KY9S4irycqaTyCFGbMrwLD/6emSnaLB0whkI36P+HtCi6jQF4FOzs5kP8JMbLBqkJOK3UQO1c2zX56tss6ycG/f/yqx5/Y3rDXncKdggQSFw0snYbudahqdEIFmeXL9DGu/hWFIDPEVX4mqZFEfK2mvuR3ov+PO80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193862; c=relaxed/simple;
	bh=VWpv5BhcJNrlMUgbOYM75Whc5Lw7abXlbh0cYPUi40E=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IUoZw+GrVFI6b489e5p1VCCng8COdQ7sa6GsCzBF8LU6zwS2weMcFcboCA3gZIk9/mROiSF0Gv6FpM8NYPKI5cdEZ3Dbg6xHSU6HDEqLxDQ0hzjAocBnVvxRSU7LH9wbr9U8SsD06rTaYzQtmUCKKx2b72POCBtPpYnd1GT6p8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=gqle6n5E; arc=fail smtp.client-ip=52.101.43.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="gqle6n5E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHtbFk2KAJLYOxuFJdZaymroTrJb34qOoYCqtiRYphjItdrNuPe4xXl+D2kLRPJAYpQDaYHWfxVT3H738Kb0ZJ5/PBfV4wMqx+T9bQtpt3+UQXZ+1uUUIrA+GIIZhsZ1m8eT2R6o75C1ZAYhaGvItnWF6SRg+dsIr6GraR7R0yTyRnqdPPrMcDMfPE5q/uDQdaXI33f5dIGFDw3tiO6x6PHby33Q2aalc6Y1FqTj++yc+O3qGPhYUrlPnhp8k+X74b6TiNY8bh5Y865qQt6j1Uc+hqtpGNpYkykpT+mYDy6vsXuQUOzPsecXheNfe32sX9qUeXjHfJyH8Ttvshk9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XkwDTjVuqhCyt4wKdxhsz8oSN6OtvjRWMKisi/vRjE=;
 b=q5jjW+OEdqBc14FjiyTetDQm/lePyo+5Cn60yjckJe5zilcv1ueTEjKQPtC+/pAEm4gNbJMFvQ91E0E/J8iv1C3N7KKEM+FXrPq2zo2O8iwWtL0EcfMBfjwEeT85bYQvKgS58o8mZgZBkp1uOcseue1bAYHAYN+AJwLA8Nk0dQOt9F6NDDLDM9kt4pitfKj/fVWBl15Iz/X/L0u8z/AQlIUxR/FAKXTBjZ8+nTchV8wGpjoTM8ZLEKYWUFRUNR/TGEy4I52h6PoTzrnjwwcoH4J+gK13fIM8in7aXwT/EKDj+HFh2SywbycInVGkJhfnOgulBFVE8pGEzqthKGKZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XkwDTjVuqhCyt4wKdxhsz8oSN6OtvjRWMKisi/vRjE=;
 b=gqle6n5EG8w5RcFa18pTA6AGa294ov0BUkdR/xr7LPB8IG4WjN51ajTpbGbsrwmbIcR8N6hvug5a7uoEQOmmc3GLta1bNcDBi7bqCwWrLVZPvjAuR1yu6l6uIFVtorC2GQtmuKc69tFUrmbJ9y2nERirE9XQRPrF09MOjse/Oyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BY3PR01MB6770.prod.exchangelabs.com (2603:10b6:a03:360::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.19; Tue, 17 Jun 2025 20:57:35 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:57:35 +0000
Message-ID: <2b816a20-a0ce-43b2-b76f-d9e175913b27@os.amperecomputing.com>
Date: Tue, 17 Jun 2025 13:57:31 -0700
User-Agent: Mozilla Thunderbird
From: Yang Shi <yang@os.amperecomputing.com>
Subject: Re: [v4 PATCH 0/4] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <47adeebf-9997-45fa-8607-67e219c2ed17@os.amperecomputing.com>
 <5491098f-5508-4665-a8dc-b91a950bbc02@arm.com>
Content-Language: en-US
In-Reply-To: <5491098f-5508-4665-a8dc-b91a950bbc02@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYZPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:930:89::26) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BY3PR01MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: cf908037-5a3c-4511-9382-08ddade19617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXhVN1AzZUV4cHdXd2F1dHN5NzY4L05Bc09qZTFPaGVkeTdaVlJxU1lFRjJR?=
 =?utf-8?B?QVE2QXI1QWd6R05ObjBURkcra0dSSHhGaFBiQlNpc3hPUkx5Wk4xUzFzbklk?=
 =?utf-8?B?RWZXWHUwaWtwSUE2S1NPVlg3UzhHMDNNLzZvVzJxMlRYdTg1ZjMwTVhnamFX?=
 =?utf-8?B?Y0lVTUZsNUtheXdwSnJLTjNGVXlyNVphN0w0MytPNUYydDd1eXhIN0xoMWJC?=
 =?utf-8?B?MkhxV2hEWGtPVU9wY2ZyL05BdUlWSEFVbXR5SEcvdjdSUGhwQ3MxL01pd2JZ?=
 =?utf-8?B?ZERjUmlTOUhMMnoyZ3F4WHViR0pteTZaR1hkeUk2VlZ4TlUrbmd0MXNXTFph?=
 =?utf-8?B?OG1TTFZVK1dsbXpoUWtQeVM3Q2N0ZDJHeWtUM0taeXRWZGlYOWJSQWhzeEVD?=
 =?utf-8?B?M0xzcEc3UWFvaVIzdEd6T0hVMHp5eCt2dHpQQWxkZXoyYnZkaThOeHFsc3J2?=
 =?utf-8?B?WGh2V21NSzVEOHFWR2hhU00zbitmSHlJVDFFU1EzZmtnYk1ydjFNMUVYb2tl?=
 =?utf-8?B?SlNKNEJCYkdHa1hBNlJrUmdTa3NoK2dLRlJXMWhseG1mZ2t3V245UEdFS2Vu?=
 =?utf-8?B?OEUyZTNZNUJWbCtWaDJYRUdGZCtZWFBXUW5QTjRmTzJJNWpUWDhIcDViTGVi?=
 =?utf-8?B?aDlLZEtDOVpIV2xxOEFpNkFCZ25rUWllVGRoQ2lCR2dqdHNrNUFnZG03VkQy?=
 =?utf-8?B?VmxkcG1KZHlrcnZBQktvQlJ5WEIyTUl4aUsrNjlOTXVEdUVjUkxLNGxIMGw0?=
 =?utf-8?B?aDB2TmRtbGkrS1h2SlR2elo5N2ZSWmNWRTN1SmZaWkEwZ1hMVkpyT2NTbkE2?=
 =?utf-8?B?VnNod0tzbnJjdWFuRWpCTXF1dXEwNEUzR05KOStGV1pGZWpiK292MWZmeWZi?=
 =?utf-8?B?Q280ODFsWFZrUzQyUDB1b3FQaWN3eUE3VXQwTDMzYk9xQW93MDRMeFhjS0k0?=
 =?utf-8?B?eTlNcVU2TFdhd1VkeFhwTDVlODV3ZW14QllscGZ1dE1YcFphc3NlcmdUVUNJ?=
 =?utf-8?B?NTg4T1FPMHlKazg2OU1DelVaUUNYUmwyQ1YvOHZTRThzdExOZURSb2thdito?=
 =?utf-8?B?L0xMZkg5UnBLL0RIeU5PQTV5S295eENCa2p4aXZ0ZWlUd05ONHRwcEl1Y2tM?=
 =?utf-8?B?dG43L2R3a1Z6ckhJVTlvZmhLK2oxK3F6bkt5emhxbWlTcm1od2NVeGx5dkNy?=
 =?utf-8?B?ckphWUJab05RT3RNcThRalg0aUkxZlRBMGtIUS9QMTRDZUsrTS8zR3Q4SWNY?=
 =?utf-8?B?UXY2Z3drOW81V0d2akRPdUVUOHlnSzRhOFRvVWpTK2JiWTJIVnpFTnV0bENR?=
 =?utf-8?B?bnpBbTl5QWs4aUtsczJXZE1QR2FQZ29iN1BOb1BMK05jRkJTSUc0dk56cEpG?=
 =?utf-8?B?c2lRTnJWQVc2R1VnbnRtRytuYzFpODZpaW5JYnVHSERjNVh0YTI2UW83aFJ4?=
 =?utf-8?B?cmpGRWlyYmI4NzJQdU9NYmtvU2NlaEY4bVBHNnFNZVJPZnExcjNSM0lNcmtD?=
 =?utf-8?B?S1pLTnAxT3dZbGFqeHEvVFFPMVNxSk9ueWxidDFmR3N1aGFHcXZaUWhWbzBr?=
 =?utf-8?B?OEhJU1VQWXN5SVJoZS9LTUtMVVorOVJybDYvMmJBS3hnNkJybndYSVZGUnRG?=
 =?utf-8?B?L05INzYrc2VKVnBUOHY2U3FsRVZHOVJjck10OXU5SHJ4THA2RXpTL1crRFVw?=
 =?utf-8?B?RDB6YmF3RUczcFlhbGhCejYvWUZtZ1ZRdFZrMWhieDcrcC9Ndk9kZWJ2Q1FV?=
 =?utf-8?B?ZWJqWlpjRVpPSFVPLzJUYm5HZE4zVmo3NWRlOURNaVN1Rk8yRytvVDBISjFQ?=
 =?utf-8?Q?e2KdjEdUttlVEvoiQxG3+J1s3gJDB8pHqQo5M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akFUT3JsOEVSUEJEYkhPRTZSQUdKVnpVRjJqL3R2U1JMb0oyYXc0WFlOSElj?=
 =?utf-8?B?cE9CaGdnOGpMUUJtTUpyaUdUNlQwdUx2S1VVUmhIalVSZnltbG1oM0w0d3N6?=
 =?utf-8?B?T1Y0WTA2bXRHZklQVm0vSFRORXFtOHdMTTFIc1R6VVM4Tkp0L1E3cEFDUkZz?=
 =?utf-8?B?QU5yNzltSEdsd2k5Y1NJUUVMcU0zTEVuQ2xvSDlUdjI1QVgxOFdYK1R5UU1t?=
 =?utf-8?B?OFdqUWM5eUhmeVN6ZVVSTExuWWFmQlMwcTJzbDI5SFFHNTZpWUtLT1owSUVW?=
 =?utf-8?B?WWQ5OVVWYTFBRXdYZTBCeFJkTnB0Mlh0bE1oNXJPajNlU3ZQbE9YOWFUbGFQ?=
 =?utf-8?B?Vm0vUi8wUmxwK0pndUNSOFM4V0VEQUlHVEp3VkkxdDhzVjQyWDlCTXVOUFVk?=
 =?utf-8?B?bUROZXh0dmUzTGJ5dGFzNEtsS040R0tQejE5cW8rQ3VWUUxjN2pwVWliSis4?=
 =?utf-8?B?Mjk1aU5aUUtBRzlUK0kxck9Cb3hicXhsd1lwTko0QWIwYW03OFd5K1JoWStN?=
 =?utf-8?B?VWZZSlZHVUc1SUVJNGcxRnNQSzk2Q2svWnZlRXRSalJ4SGU3bGFCRVlDRTNJ?=
 =?utf-8?B?dHQ0T2tQRWNuVTJGTlVLUmNRMUowbDlzOUJzRVBkb2RqYzhUS2gyNDBkcFZy?=
 =?utf-8?B?b2xkY2c2clh2SWZiOGZKV2Vyb21LOURMUFV2Q0VaaEdDaXEyR2NzNnZmNGZL?=
 =?utf-8?B?bHhFVmpDQk9pbnZoN2Vwd0xBWml6U0ZxaXkyRlRoTDAvdENRRHNiSnNaT09S?=
 =?utf-8?B?c2JJMzhyWVp1SENDN0h5WXByUU1OdEJEYmtLNUxHRVlaVDF4UjdiNzVFbE82?=
 =?utf-8?B?a3YzbGdYRHljL2tGMFJoQWM2ZXU0elpsWEorTGN1dzMxSHBmRkNPMjBDWTJN?=
 =?utf-8?B?alBLc3Arc29MdXZ0clZaN0VpMVhUdmplcVBrYVdFMnJWWEtHa0ttSDRDQnIy?=
 =?utf-8?B?MGpDdzROejM4eFRKbFpBVEUvNDBWZlovMzdaREpJdzZDY05lbngyS3k0TjBX?=
 =?utf-8?B?K3AvSTZZMktLSkxObmNyTFVrcnJOSlpIUXRmWHVmUVc3bDUvcnI0bmlUZFlZ?=
 =?utf-8?B?bWxyKzAvazZpTTRwK044VWxXaWc5QVg1T2pjRHV5VlJHVzNrMm1DQmo3Vzg4?=
 =?utf-8?B?ZGhJR3BKS1R0UzJPR3p6WmJaazlnTGZHYXBZd05BMzJBVzYwRWZLNEE2ekRY?=
 =?utf-8?B?YlFMMHA2Ym16eFV2Z25DN1NYcE9WQmxjNURJb09TWFViK1E1d29DSzdCalV3?=
 =?utf-8?B?cFlkSEsxby9rWWZMd0cza3p3TkhPSVpURC9XWmwvejdvNHg3dlVITFVxdFBh?=
 =?utf-8?B?ZHFyREpxL0FTVFJ6OWZvRWliTWhxRC9MeTlyRTI3VE1WaC9TR1VuNHNPeXJL?=
 =?utf-8?B?NWNZZGpFSllzNjFSNCtRNktBNWswaGFyT3ZQQnJGdzdIUkMybCtVOEQ4L0xk?=
 =?utf-8?B?QUc4b3lxWDZyRjhERmVrTVAzTk5vQ3k2QXNEREsvcCtCL3FRSlhydHZrbGo1?=
 =?utf-8?B?MnhVZWJpMnZXd0Y0OFk4bkZtWVBxeUM1UzZMYnpWcFYxSVJIYVNvV01Ia0xF?=
 =?utf-8?B?VDl6V2p4OXlkbWlYR1plK0ZEc1lnR1lPY0VpMmtsdUtITExMQ29OaDJZRmVw?=
 =?utf-8?B?aks0UVQ3MyszNk4wckdqRXFWcGYybTRPOUxGaWU0MWNRSEo1ZHNNZ1IycHAx?=
 =?utf-8?B?eU9oMm4xQitCM290SUh6RDJZMDgyVHlwM2lqczZWalNlREoyaWxYN2N0MHRJ?=
 =?utf-8?B?elBRN0ZuQWQwOVluRGQ2V3BUd0dVdE85aWlMUGJFalNHWnpQQWxGQ3o2NThX?=
 =?utf-8?B?UW9CTzg1V3ZnMGN4WC8wT2U4UjEwNSs2N2RjWlBFaHVjQ3M2eXJJUGczT012?=
 =?utf-8?B?YmdFUDdpN0xDdDNhQnF0Q3NZbFp4UFRCOS9wS2crcThOVGN5MFVKWmdPbjc5?=
 =?utf-8?B?bnZmK2hUSXA4VFNYQUM0SGpNUjNzc2pnN3pHZVBseVBVRERJVDV4Z1FlM3Zu?=
 =?utf-8?B?OStGNi9aNGVKUzhhcW1idUxKNVluYm04QmR5cWJjRS8vaVNiU3Z2UG9ZYXhB?=
 =?utf-8?B?Tk5FazYvSTRWZytUQkM4MnpPcmNOTU9tcHVlSkg3dWtYVHg2TkJLMGwvNzMw?=
 =?utf-8?B?TURYV2c0MXFWcTJNTUlYZ1c2WUFwTkI4SGFjVk1TeU11dkZoYjNDZ1BleVB3?=
 =?utf-8?Q?tFO5jFRpGBfDth/GgUDyjzk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf908037-5a3c-4511-9382-08ddade19617
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:57:35.5509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boOtBGJTlqsiS4YT+Al7IchY01qjPmvTv6wQBy7TJa9O3cl4fsVKKPAJfkkHS30NJU2MuP5LNvZLZlCC9g5zRkisS6kqyIEbc4HXZVfk08Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6770



On 6/16/25 2:09 AM, Ryan Roberts wrote:
> On 13/06/2025 18:21, Yang Shi wrote:
>> Hi Ryan,
>>
>> Gently ping... any comments for this version?
> Hi Yang, yes sorry for slow response - It's been in my queue. I'm going to start
> looking at it now and plan to get you some feedback in the next couple of days.
>
>> It looks Dev's series is getting stable except some nits. I went through his
>> patches and all the call sites for changing page permission. They are:
>>    1. change_memory_common(): called by set_memory_{ro|rw|x|nx}. It iterates
>> every single page mapped in the vm area then change permission on page basis. It
>> depends on whether the vm area is block mapped or not if we want to change
>>       permission on block mapping.
>>    2. set_memory_valid(): it looks it assumes the [addr, addr + size) range is
>> mapped contiguously, but it depends on the callers pass in block size (nr > 1).
>> There are two sub cases:
>>       2.a kfence and debugalloc just work for PTE mapping, so they pass in single
>> page.
>>       2.b The execmem passes in large page on x86, arm64 has not supported huge
>> execmem cache yet, so it should still pass in singe page for the time being. But
>> my series + Dev's series can handle both single page mapping and block mapping well
>>           for this case. So changing permission for block mapping can be
>> supported automatically once arm64 supports huge execmem cache.
>>    3. set_direct_map_{invalid|default}_noflush(): it looks they are page basis.
>> So Dev's series has no change to them.
>>    4. realm: if I remember correctly, realm forces PTE mapping for linear address
>> space all the time, so no impact.
> Yes for realm, we currently force PTE mapping - that's because we need page
> granularity for sharing certain portions back to the host. But with this work I
> think we will be able to do the splitting on the fly and map using big blocks
> even for realms.

OK, it is good to support more usecase.

>> So it looks like just #1 may need some extra work. But it seems simple. I should
>> just need advance the address range in (1 << vm's order) stride. So there should
>> be just some minor changes when I rebase my patches on top of Dev's, mainly
>> context changes. It has no impact to the split primitive and repainting linear
>> mapping.
> I haven't looked at your series yet, but I had assumed that the most convenient
> (and only) integration point would be to call your split primitive from dev's
> ___change_memory_common() (note 3 underscores at beginning). Something like this:
>
> ___change_memory_common(unsigned long start, unsigned long size, ...)
> {
> 	// This will need to return error for case where splitting would have
> 	// been required but system does not support BBML2_NOABORT
> 	ret = split_mapping_granularity(start, start + size)
> 	if (ret)
> 		return ret;
>
> 	...
> }

Yeah, I agree. All callsites converge to ___change_memory_common() once 
Dev's series is applied.

Thanks,
Yang

>> Thanks,
>> Yang
>>
>>
>> On 5/30/25 7:41 PM, Yang Shi wrote:
>>> Changelog
>>> =========
>>> v4:
>>>     * Rebased to v6.15-rc4.
>>>     * Based on Miko's latest BBML2 cpufeature patch (https://lore.kernel.org/
>>> linux-arm-kernel/20250428153514.55772-4-miko.lenczewski@arm.com/).
>>>     * Keep block mappings rather than splitting to PTEs if it is fully contained
>>>       per Ryan.
>>>     * Return -EINVAL if page table allocation failed instead of BUG_ON per Ryan.
>>>     * When page table allocation failed, return -1 instead of 0 per Ryan.
>>>     * Allocate page table with GFP_ATOMIC for repainting per Ryan.
>>>     * Use idmap to wait for repainting is done per Ryan.
>>>     * Some minor fixes per the discussion for v3.
>>>     * Some clean up to reduce redundant code.
>>>
>>> v3:
>>>     * Rebased to v6.14-rc4.
>>>     * Based on Miko's BBML2 cpufeature patch (https://lore.kernel.org/linux-
>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>       Also included in this series in order to have the complete patchset.
>>>     * Enhanced __create_pgd_mapping() to handle split as well per Ryan.
>>>     * Supported CONT mappings per Ryan.
>>>     * Supported asymmetric system by splitting kernel linear mapping if such
>>>       system is detected per Ryan. I don't have such system to test, so the
>>>       testing is done by hacking kernel to call linear mapping repainting
>>>       unconditionally. The linear mapping doesn't have any block and cont
>>>       mappings after booting.
>>>
>>> RFC v2:
>>>     * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
>>>       conflict gracefully per Will Deacon
>>>     * Rebased onto v6.13-rc5
>>>     *https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-
>>> yang@os.amperecomputing.com/
>>>
>>> v3:https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-1-
>>> yang@os.amperecomputing.com/
>>> RFC v2:https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-
>>> yang@os.amperecomputing.com/
>>> RFC v1:https://lore.kernel.org/lkml/20241118181711.962576-1-
>>> yang@os.amperecomputing.com/
>>>
>>> Description
>>> ===========
>>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>>> break-before-make rule.
>>>
>>> A number of performance issues arise when the kernel linear map is using
>>> PTE entries due to arm's break-before-make rule:
>>>     - performance degradation
>>>     - more TLB pressure
>>>     - memory waste for kernel page table
>>>
>>> These issues can be avoided by specifying rodata=on the kernel command
>>> line but this disables the alias checks on page table permissions and
>>> therefore compromises security somewhat.
>>>
>>> With FEAT_BBM level 2 support it is no longer necessary to invalidate the
>>> page table entry when changing page sizes.  This allows the kernel to
>>> split large mappings after boot is complete.
>>>
>>> This patch adds support for splitting large mappings when FEAT_BBM level 2
>>> is available and rodata=full is used. This functionality will be used
>>> when modifying page permissions for individual page frames.
>>>
>>> Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
>>> only.
>>>
>>> If the system is asymmetric, the kernel linear mapping may be repainted once
>>> the BBML2 capability is finalized on all CPUs.  See patch #4 for more details.
>>>
>>> We saw significant performance increases in some benchmarks with
>>> rodata=full without compromising the security features of the kernel.
>>>
>>> Testing
>>> =======
>>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
>>> 4K page size + 48 bit VA.
>>>
>>> Function test (4K/16K/64K page size)
>>>     - Kernel boot.  Kernel needs change kernel linear mapping permission at
>>>       boot stage, if the patch didn't work, kernel typically didn't boot.
>>>     - Module stress from stress-ng. Kernel module load change permission for
>>>       linear mapping.
>>>     - A test kernel module which allocates 80% of total memory via vmalloc(),
>>>       then change the vmalloc area permission to RO, this also change linear
>>>       mapping permission to RO, then change it back before vfree(). Then launch
>>>       a VM which consumes almost all physical memory.
>>>     - VM with the patchset applied in guest kernel too.
>>>     - Kernel build in VM with guest kernel which has this series applied.
>>>     - rodata=on. Make sure other rodata mode is not broken.
>>>     - Boot on the machine which doesn't support BBML2.
>>>
>>> Performance
>>> ===========
>>> Memory consumption
>>> Before:
>>> MemTotal:       258988984 kB
>>> MemFree:        254821700 kB
>>>
>>> After:
>>> MemTotal:       259505132 kB
>>> MemFree:        255410264 kB
>>>
>>> Around 500MB more memory are free to use.  The larger the machine, the
>>> more memory saved.
>>>
>>> Performance benchmarking
>>> * Memcached
>>> We saw performance degradation when running Memcached benchmark with
>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
>>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>>> latency is reduced by around 9.6%.
>>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>>> MPKI is reduced by 28.5%.
>>>
>>> The benchmark data is now on par with rodata=on too.
>>>
>>> * Disk encryption (dm-crypt) benchmark
>>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
>>> encryption (by dm-crypt with no read/write workqueue).
>>> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>>>       --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>>>       --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
>>>       --name=iops-test-job --eta-newline=1 --size 100G
>>>
>>> The IOPS is increased by 90% - 150% (the variance is high, but the worst
>>> number of good case is around 90% more than the best number of bad case).
>>> The bandwidth is increased and the avg clat is reduced proportionally.
>>>
>>> * Sequential file read
>>> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
>>> The bandwidth is increased by 150%.
>>>
>>>
>>> Yang Shi (4):
>>>         arm64: cpufeature: add AmpereOne to BBML2 allow list
>>>         arm64: mm: make __create_pgd_mapping() and helpers non-void
>>>         arm64: mm: support large block mapping when rodata=full
>>>         arm64: mm: split linear mapping if BBML2 is not supported on secondary
>>> CPUs
>>>
>>>    arch/arm64/include/asm/cpufeature.h |  26 +++++++
>>>    arch/arm64/include/asm/mmu.h        |   4 +
>>>    arch/arm64/include/asm/pgtable.h    |  12 ++-
>>>    arch/arm64/kernel/cpufeature.c      |  30 ++++++--
>>>    arch/arm64/mm/mmu.c                 | 505 ++++++++++++++++++++++++++++++++++
>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>> +---------------
>>>    arch/arm64/mm/pageattr.c            |  37 +++++++--
>>>    arch/arm64/mm/proc.S                |  41 ++++++++++
>>>    7 files changed, 585 insertions(+), 70 deletions(-)
>>>


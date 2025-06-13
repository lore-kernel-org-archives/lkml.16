Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE07B279DC2;
	Fri, 13 Jun 2025 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806047; cv=fail; b=r1Pmdggkl8Sm6ma9Uu38Qc7gfdMEcD7TQg7vg0W53IzFp6Fe27Hxg+fiSOJe3G44ydTbsW/D76TganUAaLMdxe2r296u1qNPQOeb2j8sF95c/lK21cnwy413B7HWsLEoOBZBT8MLmGBqfd0OYvBBT9GjGYoB9l4Hzz9sEVM90+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806047; c=relaxed/simple;
	bh=3lTdWLJ1xGde0ywZAfwZb4te8cGsaPh5IjJ4E2lsbbM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ufPl0izAdzCooUM+0Jc4ROvUev16YKLShLziqUBbPHBNKOXxViv9f4uwF/YoNEMeXIH286tAy/vl9eIxhjeeYpH/CsiUR14cWXhP/R9g276Ef4J3BGYVZ/34990nMip7puyq8G9s6JnLtLsGiHT3QlGJtTg1Q+hGPFcQHj1+NTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MKUIWRZ1; arc=fail smtp.client-ip=40.107.100.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MKUIWRZ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzacodntrrsbR+6L4WhGp7Wj7QAQvjz91nYul9zQsGZJJnLHAt/rS+cYYRcUdoRxbIN5vvTfNq0+qLYJD4dRETzrsA5bJAveJzmDzG9/z8f6BOafHV6fSV0qNZsGUA75ntHPW2ESEo6SNN1I9ECbrPIAzfDHVgRkN1F/RIOMPo4KxLIVLa4Omw9ajvAY+s0m5q9nuyMVoFdoKFC0JHMXxjFcytglhYYx+ApNkcKdiLP/67IEzAuISTZh+v/oDja5Y3ekJg7QXomqfhvxZGsG31/OTR9fBvX5V4JIGmI5KZf/YlLUMugXbPef2XedNv8zy6u13N5aWnz6USDKYi7YCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py5Br6tj1ArAT2x+SM+R5Z42S5bEHMMJDekiAzmRMr8=;
 b=q7uTLVDZg3PFZo8N3G/NoXVcL5U/18RGsDktqe+Aj8uZxKj3BB1kIHIyVi1A0+P7LJCk7+Cc/kqx1WruQZa3O5hxNo6UWf67b482g61rWU1bhH7W048KSWkDllvkp5jFsC2eRYq111Odo0sV7vgN+jTZ3kWhUYxrztmEqYGARoCNPJ21uP0d4EjqVwixzD+Ul4uv9bVTdTori+ppfXfuUUEWSH0exS0zdhF0VOoaE15QYJXGHk13g61S8myE8xDsi4wiqQajotyvNvTP9oixZy850+VsaUhQYkyA5qAuRA5RIsSAFOriKwYLXDFJIhCpgGuPxzv29uOS0+mC6uOqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py5Br6tj1ArAT2x+SM+R5Z42S5bEHMMJDekiAzmRMr8=;
 b=MKUIWRZ1FuLwYp0brcjD0eorqIUI9k1K8pwurx9ocGTVzrcvBZg7Dhwe8FmnWjK5rHs2Ev5guvuoRigGfkyII1j94iXPYGwurUnOHdJtv284ZvEy7+ZNA2b8NKWc+08f8PXd4YaC9/60ln3sb2fwXaPw4ZknKoGhvBEjsh2tzgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by IA0PPF52B16157D.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 09:14:01 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 09:14:01 +0000
Message-ID: <2e03b43e-5917-4581-9aed-780dec9e3ea9@amd.com>
Date: Fri, 13 Jun 2025 11:13:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: microchip,usb5744: Add support for
 configurable board reset delays
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <1749148171-1729610-1-git-send-email-radhey.shyam.pandey@amd.com>
 <f1b83b96-7cac-4014-b791-e073d2299c01@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <f1b83b96-7cac-4014-b791-e073d2299c01@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0026.eurprd05.prod.outlook.com
 (2603:10a6:803:1::39) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: a00e9f57-fa86-4749-be19-08ddaa5aa2be
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEJ3WHlnZXdET2I3bnQ2V1FJUDdaWXdxZTZTeW9Qb2lPMGJXeGcvK24ybzg4?=
 =?utf-8?B?L1ZTMDlvNFJZQmFNQmZFUEFrcGRpNUtnUlZKMGxBQ2Z6bkt2SGp2bFFpQW5I?=
 =?utf-8?B?cGRzRjkyNjhFdzhoeW9OQm5HQUlRZWQzZnBnOXQvY2RPcFE2TE5HZlFpaCsz?=
 =?utf-8?B?YVZCdi9sSWdqKzVjUWVwZFRGeHluclM0VUV1TGZ0ZXpjbXZFSlZFdkJvNDF2?=
 =?utf-8?B?dW1PKzhJc2htUmEyUlpqUlF1bk5maVFjK1FEdGlsSWxYOUVCNFdsbVhBemxr?=
 =?utf-8?B?eDhoSGdTZWpVUnFPTnFzMHUwS2FmR2tOVyt6M05HbWhVVll5UUNtemY3ZXpS?=
 =?utf-8?B?RkNvaTdYdjR1TmExYzI5RDBiYkFZV2pmMHhMZFR1M3prUzd5TkhwWW80UWdq?=
 =?utf-8?B?MVB1Z2h0aWFVOFdlZmVBcFJ5NTRNS2crMG9NdWRqSjBOeUp4T09vdDkzYkhp?=
 =?utf-8?B?ZWlBODhjNUhMU3ZuOW5LUkIyVjlYV2l3YWxZckpTVHA1T3BaUFphMXFrd1VR?=
 =?utf-8?B?U1orVlR2Z3dJWHpTR2hCcXFBQ2V0STBMTmE2WVRxck5IcUd0bmNnaHZWKy9E?=
 =?utf-8?B?TitWaElOSVJLS1g5cWpiK3l1V0J2REFxOTYxZ3lLSTQvRHRRaHJhaTN0OHdK?=
 =?utf-8?B?STA4bVM0RlRHYmtpT1hCanJ4c3pTak9KOUVsT0E2a1RYd2RmZDFBMGlBNFdF?=
 =?utf-8?B?dXMwZGVJYVZGVGdhZ0U4WWprN1Z1N3UvSE5YV1lFT21OTzBzLzJ4cm95bjlq?=
 =?utf-8?B?RjVicFAvTCtEYTRRZEVJcS93aFVHZGFmdWsrRmVnYytMajQvc2xKRDZXRzI3?=
 =?utf-8?B?NlhwMEsrdWZKWEdhR3JoWC9aV1Y1RnJzSlJtSkkwVmJ3VnVMNkFHMXNDQ0Jk?=
 =?utf-8?B?T0wzS1ZRV2M1eklrOUVFKzZsZHlBdXJiaUxhTGg4SUNEbGdrdE9HUFdYUHdL?=
 =?utf-8?B?T0N4T1I4M0FsNk1pYXMxcmF4QkpVQ2lCQjFCRUxsZ0RuNmpLKzJpZ3RtZUtU?=
 =?utf-8?B?U2RVSytZN2dGR1NFSkxNdWxXRk0xeG5UT2gyQmVCa0ZpUUNScHVPYThvKzBt?=
 =?utf-8?B?L05aRE1DTy9kNXQzTkswSGVFU3dOeFJ1V2tjYk1Gb1RzVFBGOVA4VUJ6WjBG?=
 =?utf-8?B?N0RiblhudXVONi9WUlFpR2NOWEN2eXAwNm5lTlp1ZFh5SlJFUS9qSWVZbExV?=
 =?utf-8?B?TExISEdxOGE4ZURhUjk5UWMvSndIajdNbURMbUhkbmNWNzdEVjEybmw3YXpv?=
 =?utf-8?B?UHpWWGlGT1orZnhjNmlBd09SWDN6M3ExSnVpeVlicENtdGFwTk01eVBqUGUr?=
 =?utf-8?B?aGFhZEpVZFhCa1daTmhsUTZseEIxOWs2NE9QQWw3ZnRvNFhWU1BNdyt2TE94?=
 =?utf-8?B?cDhUeCtWRHJ4N2Z1czB2NDVFb0c4ckpNeTBrR2VWME5rM0NWWE82U20vUi8r?=
 =?utf-8?B?ajUxUGxMV20zaFpjRUplMWQ4dHN0R1B3WG1ONmRTenl2RnNIemlyRjJiSWwv?=
 =?utf-8?B?VW9VM0k4VmZ3T2R5c1NITHNhSlREL016Tm1yVjdhRVQrUElzYkY2UjljLzFP?=
 =?utf-8?B?QlV2WHF4OThEY29yVi9NUk81R1YvUTJYNDBwMHNRR2hKU0MxdDJ5NlZINzVP?=
 =?utf-8?B?OVVRZ0wvOWUwcDdNdWpNNnJJU01neTVxaUgzY2tBeDF4UUdwQzNsQnZZRkls?=
 =?utf-8?B?aFJReCtLTHJpbmhKVEozUW40L25FNnRaUnI3SmFMVnIrZkNocU9ROEdZbjAx?=
 =?utf-8?B?VU9PU25tNGZ5NXhqbTBjdThwaFduYWJhMXU4K2RMOGRwWWY4aFZyWVR4ZmJ5?=
 =?utf-8?B?aDZEdHJOM3l1SFBobFRPT0VMdzN6SmJMaHdxWVFtMzhpbFcydEl5U3FnMXBr?=
 =?utf-8?B?by9rS0lyeHVsQUtQTUxZQnRaSlJMTWRpV3ZaUFFSVE9heExHT05pRjFFUlJl?=
 =?utf-8?Q?kduDkvfTz3s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmlLUXkrSFVHMnJ3R1J1ZXJHcXd6NEJSemIraFk0emVObDA1enVUa1NoRWg5?=
 =?utf-8?B?a3lUL0pnUTNzZmFwUlNBTDdqSmgwMkQ5ajhBa2RLL2RyNE95bE84eUg4RjZQ?=
 =?utf-8?B?UytmREJuKzl0UTEwdkUxemM5akNDNUhERVpRTXF5UnZlZ0hDWkpTVzcxMTlr?=
 =?utf-8?B?ZXF3bnoxM0dmUkcxS0lXekJLKzJlKzJUMTJqcjlkdHBIbFFoK2dsNllMQlhO?=
 =?utf-8?B?T24zMis1ajU0NlV0K3BrVExIaGVjVENBVG9wMWhOZmNFdzh3NStvSXQvd2lk?=
 =?utf-8?B?RVhCVGhVY1ZGd1RxVGpJbk1pZ1VObmFYRkUweUZzMVA5NGsxVGhRVUFVckJp?=
 =?utf-8?B?SzczR04zcUlyUUd0N29NdkhIQ0pYMmxGNU4wMStFRzk2cVVOU3dGQnFlaSt4?=
 =?utf-8?B?dElCSDhJd2dmeEdsZm95cDhRZEpjWC85akdEbHBRNDhyQjJlR0xVT1hPSXlB?=
 =?utf-8?B?SjNMOEQ0dno2cnlFTXkwVDhsR3BrVjYvYzhWNm01SU1GRERGYWpQb2srbFVp?=
 =?utf-8?B?WE9MM2t4a1hvSE8wVFVPaDJaUWVuY0l2VFVLWEd4UGd0ZDVNbGZQWkFlQW8r?=
 =?utf-8?B?MFFhblNpR2hyR1UrbUdhYURqaHc2VlY0WVAxRnRGYXNUVHp1UjJiSnNHTUxj?=
 =?utf-8?B?bE9ZYm8venE0LzVMbXdGbUxrZFQwWHA3b1hkOU9rM2dqeldBMTVRYm5uYkdh?=
 =?utf-8?B?anN1TWxGUFMrQzFnakRrZ1pRM0VMNWpuVm1MK3JmaTN0TlppWC9QMG45TVRj?=
 =?utf-8?B?L0NBSG1wZmd0MkZWTGhaTkZ0Y1NlTkRwbG5wU1ExZWJxWWZhREdURUJmKzBI?=
 =?utf-8?B?MG1KRTdZU3JIVFNmbzJkYit2NGV2cVlYbC9INEV6ditlS1Naak5LSGRtMmJi?=
 =?utf-8?B?SWQzRTJtcmtpb3dRSmUwR1BkcVVIZDJRcFpna1VScDlubGdTdDFuVTU2QXBr?=
 =?utf-8?B?a0EzN2VBVmRPOGZjbTlIRHVqdHFIeFF5UEFOTVJHNThMYUdGbk1aRXVrbHRz?=
 =?utf-8?B?UTBiWFEvYXJKMVY1US9Na1IxS3NTYmNQNjdNeTFVb0ZFM1JSRlZMeGdtNFhK?=
 =?utf-8?B?dm9aT3JGRlpKZE1SSmVqbXFNclA5cFdUU2xxMDlOQ1FXSFNXcVRXSFkrUkdN?=
 =?utf-8?B?L3JJbC9DYzN3ZFJMd0dJTFFGNUoxMWxoU1lqRmhROHN5OG13RzlWdmROZ1h1?=
 =?utf-8?B?dFBDbjExS2NLSzhhSHo2R0kwZmplVE1oVW11NC9XbEhBZkYwaDBSLzNVV3VD?=
 =?utf-8?B?bXpNditsUWI4L2s1dC9HSlhZRlVHWUxsVDlMQUdVUDZpdlFxODdsTUV0dE5q?=
 =?utf-8?B?bkNiZTdUQjJIL2psbmx2SFlWaUZwcjRnMThXbDZnZjVtT0k3dU5wcFMxcnRM?=
 =?utf-8?B?SmY5cTdmQXBkTVkxWkc2UitTOFB2MGpKQlJlb01BOFFwSGpnWXNqMUxzNmlX?=
 =?utf-8?B?Nm8zMjN5VWcxTnZEMFVWdnQwMWJMa3dqalZpNWJJMnVBNW1DTmhGbWNjajNC?=
 =?utf-8?B?T2VjMGQ0azM0NGg0b2pvdERtaTlZVHZjMzI2Q25OdUFva0VkdWhQVk5XMTNK?=
 =?utf-8?B?UG5PMHp4UklFeVlXRG9oVFVzTm1Dd3dBT2dROENNck00WEZkRCtEbTR5Ukts?=
 =?utf-8?B?SEtDTWxHNXZuVkF5OEFlOE1KRkhyOHZ2K3VFZFhRZzJVYW90ZTJOc01mN09P?=
 =?utf-8?B?ZllLSnlhWlBobjRGRUlJbFZBMEVJclY0N2MrSURGNW9uNEIwaDM1NzM0N2lO?=
 =?utf-8?B?d09GK0hkMVl1Zk5kYmt4eHRGUjNJdVFRM2s0M05xUERoaW5EMDZQTHBSdUIw?=
 =?utf-8?B?Z0R1TGpQTTZzbjZDRTJWL3dvbklrUENMUTF4a01tR2RXV3pleXUxMVFCMUZa?=
 =?utf-8?B?V29DMisrOXhXaUhFYkFvblNiWVRON1BxOEdFcWppa0dxOHkrcll5MnIwMUNB?=
 =?utf-8?B?VnJPWFlCTlNOVkdHaEEvSjFYa2Uza3VLT2MxQ0tiRmFSOVFXSSsvUXNlRERV?=
 =?utf-8?B?Vld2b2hyNkxtRkVITWZ5Y3JPeHlCVTJ4QTI1ZEcyQ2luVUtZejZJRjdTejdz?=
 =?utf-8?B?eSs4Q0t1SDQ3SGpNelFrMlZqNStGTWRrbW5CT2JYUWVmN3RubWhKZUZPc3Yx?=
 =?utf-8?Q?E3Jf6vvlr7btTBf9EFvtt0p5n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a00e9f57-fa86-4749-be19-08ddaa5aa2be
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 09:14:01.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlQvTcIu4VFwsbBnxtOaGGiON5v23snhrvsjTQSeWigCxaLFIbLgoVYQhPDho3tQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D



On 6/13/25 10:47, Krzysztof Kozlowski wrote:
> On 05/06/2025 20:29, Radhey Shyam Pandey wrote:
>> Introduce 'reset-delay-us' and 'power-on-delay-us' properties. Default
>> delays in datasheet are not good enough for Xilinx Kria KR260 Robotics
>> Starter Kit (and others) so there is a need to program board specific
>> reset and power on delay via DT.
>>
>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> ---
>> Taken reference from mdio.yaml[1]
>> [1]: Documentation/devicetree/bindings/net/mdio.yaml
>> ---
>>   .../devicetree/bindings/usb/microchip,usb5744.yaml   | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
>> index c68c04da3399..94a2bebd32da 100644
>> --- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
>> +++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
>> @@ -52,6 +52,16 @@ properties:
>>       description:
>>         phandle of an usb hub connected via i2c bus.
>>   
>> +  reset-delay-us:
>> +    description:
>> +      RESET pulse width in microseconds.
> 
> I don't understand - there is no user for this in USB. Why do we need an
> ABI if no one ever uses it (and commit msg should clearly explain that)?
> 
>> +
>> +  power-on-delay-us:
> 
> No user here, either. Plus I just wonder if you are mixing here RC
> delays or regulator ramp delays, because datasheet does not mention any
> delay.
> 
> Can you point me to datasheet page explaining these delays?

Here is datasheet.

https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/USB5744-Data-Sheet-DS00001855.pdf

10.6.3 chapter

minimum assert time is 5us this corresponds to reset-delay-us and then there is 
requirement for minimum 1ms for configuration strap.
On Kria platforms 5us and 1ms is used in U-Boot usb onboard driver but that 
times needs to be extended to be able to configure hub over i2c.

Linux current has hardcoded value 0us/10ms.

  33 static const struct onboard_dev_pdata microchip_usb5744_data = {
  34         .reset_us = 0,
  35         .power_on_delay_us = 10000,
  36         .num_supplies = 2,
  37         .supply_names = { "vdd", "vdd2" },
  38         .is_hub = true,
  39 };

Thanks,
Michal


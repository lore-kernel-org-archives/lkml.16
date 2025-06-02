Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996571EDA02;
	Mon,  2 Jun 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748858998; cv=fail; b=Mld7MMapfxdVynWlxHtaDtit0O2MDxkiomsIOwkbcBm9nPoCFQsX0q5yFXLgnas+aO2vv1+hVVfNnKCk8meJNGEnDPxGgeBOuGRE+r0rUPQquuzLLowPQ+x3nhb6yY+83xpIDSotB5qxd/nv0SgSInkkHXVXhxN81QpzXu9jQdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748858998; c=relaxed/simple;
	bh=CxbnVNg2VgQegZ4x5XM0u5JXa9D3qn72s5QB4KbpmjA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZHL6DrFSQv5SRJCKT3tfSydb60flCaU+r0NYijqpjGVjxU1B3Wm5UcDCZsHDwRCS1ocv9uQszeYNJAjUuKvhhJKmGNNHQzQzQGZlQJGk8Glo8BUpI+H+A+mJ9v+XloMY7gldmgPSqQqd3vi8De2fC1+KNYIKHNHB+hDp6hZuT8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=B6fl84MN; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="B6fl84MN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EU7Q8IBwzCSGjdQpQocPdrrB/cj5EZ46zyo1LsDsPy4iKgVjfl1AxwKO1cOAbeJe8ivbACnmmNnb1PYay4WQ9xI8vd5nwigCqxMP2ayGv5xTnsdOriQOKRYiDeo5rcmS2FmQE9HtzF4IkbffaWXnfYtIeexNHwCOlVgqT+8nARXJwfKP5ILzUMIznfqOL+QcGJV6O8dVjWAXY4Ma2mBjpnYGgGD+9iWW0qOjMRCPdLuGLESg8e7v6LWpcxVkScTE/eUZ2W0UgILKjbr4hATF6+GUv2FoV6Erc+23+Ok3d6dhx8uiozeHrWGKCTS9jQfFHu8MDTEuff18hPv5Vq6lNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCIALaLfrjcHmr1JojGMLfrWZVflRRxyseyEDA+cyIU=;
 b=FStCjOeH6tG8hurxzYcZr6UPnOG6qWj8H8DH8JTHih7ysUplXxGsY4zhxbakR51p2BVkc/nvlIEAXf+44/VL0fcZhqJnduoe39t3m4MirWdWTc3mVM2qJRICFw93TxacaHozfiO3DK3iw5GarEdLl22gWVDn+xN1daVtqRWK/e8Ex6jkf8wZe5IF2SjvvNvFUAm2s3wmXC/wfkTGuc5Zd+ODfrsAb2lf7mjYvU0p/gJ3RSwGASnQ32ELVRj2yfeiRClr+TCpLFmyHMEcmx6gvoKSkVm2FQSlfapLHWyySSvMehzx76xN0CRJdsf+kFIuD2DsBOH5i9RjZmuaRYyZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCIALaLfrjcHmr1JojGMLfrWZVflRRxyseyEDA+cyIU=;
 b=B6fl84MN948Hl4tivkjMXxFhbTk59z6F57NIKtNdh2aIdOnTRbt7lXeZrNUGZtKZmH9BpDMBXQvqleopFFm8Z4HoS1ho1yq7lH4sOtOQCUdq8KTIyP1mvfu32mw0T7DPcaOxDIfp4aB85fZ52SphhYNKVWLYREu4EkP9kgqVYho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Mon, 2 Jun
 2025 10:09:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 10:09:50 +0000
Message-ID: <ce936fc9-f1d8-4f6c-a188-28a90481886f@cherry.de>
Date: Mon, 2 Jun 2025 12:09:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
To: "Rob Herring (Arm)" <robh@kernel.org>, Hsun Lai <i@chainsx.cn>
Cc: heiko@sntech.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 inindev@gmail.com, sfr@canb.auug.org.au, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 nicolas.frattaroli@collabora.com, krzysztof.kozlowski@linaro.org,
 andrew@lunn.ch, jonas@kwiboo.se
References: <20250530031046.166202-1-i@chainsx.cn>
 <174860938675.1571999.8236778735226903385.robh@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <174860938675.1571999.8236778735226903385.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: CWLP123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:19e::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: b18c461e-e838-4908-b398-08dda1bd9cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzFLaFgxc09HWGwvY2xhUGxUUjNrdDUxeC82ZkRzWFE0ZUpRRThXZldDT0Rp?=
 =?utf-8?B?c1JydWJmWERMdEt2Y214eGZSVTdMeHhHdVFJUUJndEIzdU8zdDZ5TkJGelo4?=
 =?utf-8?B?YmUwMSs5a3Q5VXF0QUtuaFZ4Si91anJVUy8yTDZ3aDV4VTVIQy9SaFg2N3Bt?=
 =?utf-8?B?NXdSZVlyNEZHSlJuMjRHVGg5Ty9EMVFaYWVsTjQyaFNnYWZza3ZzL1JKL0hk?=
 =?utf-8?B?QzB6TlBVZ0ZTYmtNMWdia2NHZDc5QVd6QWQ4Sy84cldNTlFvMlJta2pma0NF?=
 =?utf-8?B?dHlaZFU1SUlxUnJNVkhSVithRi9xNmlRNUkzZklPaFdna3FyZ25SUTV1dStz?=
 =?utf-8?B?c0NJQ3dVWWFIb3ZpbW9WYzhBeGNLNWhCNW1taHJ0RUtLWE5MVHJzYmRCQmMy?=
 =?utf-8?B?dW50azJROFNJODlHdXMwejJnYUtZdTc4NG9udWJ0WnRNWHJpUVlnZ0ZFcnNZ?=
 =?utf-8?B?M05STUVkR0FHNmVrQnh6a0xWVXlHUHljSmhjZ05sK1Qzb3JSS09aQTNzUzNW?=
 =?utf-8?B?Y0lRVVZvRTl0OWVzNkRrbXAzZkx4dllCdWFxbk84eVgwRkMzS1MrZDhON2di?=
 =?utf-8?B?Nzk1SHJld1JrMUl3Vk15c0llRVR0UHY0VzQ0aXNYMnNtcVRQSm9rRzdEWHNy?=
 =?utf-8?B?a2N5SGg1UURDdjR3VVFSdlNIOERSbWx2R0tZbjZ4T3hZRWtPVWVYdHh2cENJ?=
 =?utf-8?B?cEFkNXhjSENSUGRpbUVZeWprVHI4QVdUbFlOZEZlckVpcHhxUUszbDNkeW1V?=
 =?utf-8?B?c0hJVnlXM21zdkVKajBWN3ViY3BnNFlEVWFKaHNOeFFpQnVidVFKRS9BRmov?=
 =?utf-8?B?M1ZMT3YzUTNqYUJqbjdTMmdIRytqYUYwaDZtNDhjUTd4cmJtV1VObnh2ckZT?=
 =?utf-8?B?SWdXT3ZpbEo4REtoTEdMQ2hZYmMyMEZheDNQcFM0bVVYVEVxNFErSlRDSEJa?=
 =?utf-8?B?YlN6MGt2RndEeUc2NDJIRDFONEJUYmFvODYwRm9BVExsYzQrTFFtQjNUYmlO?=
 =?utf-8?B?SGVGVTFpV2VzTG9BVmxNVjZMN0htMU5ScHEwei85d1VtaDJ4aFNZdFprdGE5?=
 =?utf-8?B?eVlkcDFaN1c0a0EzblFTbGNKeG1RSjRqMHRBN0ZJb3NVdW5mN2puVlZlS1hX?=
 =?utf-8?B?bzZNWWMyQWwxUVRDazVlTFU4cEhaOWptV1lRTjlZeWdSSHoxdDFpdnFPRjlB?=
 =?utf-8?B?TkQ1by9ETDl0ODFDRXVwdVRqb3lNY0VvczlsRU9hVU1lTVZKbFk3R0hYa3Qz?=
 =?utf-8?B?SVJyaGh6ZmxjVXVrdnJZNGcwbHhYeVhaM3ZtandQSnJ3ZVRuR0pHbjA2WS9s?=
 =?utf-8?B?enFpRDlrL1d1Z3VLMXBhT3FRVEtQanZvUjVCQU50bTRFZjRUMnJkS3VObWhG?=
 =?utf-8?B?VFBnRVpjTGErMWN5RW9hbThXbzc0UkhFNDVHQ05tVm1XbDd2Ly9hR2x6czVq?=
 =?utf-8?B?bDR5VDVLQ2Jzb3BhN1JaejdGd2xqeUFaYy9FVWhwS3FwMnErRWdqbjdycmxQ?=
 =?utf-8?B?UHZuOHNkVGFtRGhHaTFaRGhvaGlSSG9maU1yWjMyT29DRGtST25BZUpiWkVk?=
 =?utf-8?B?bHhIbWZMZnl5ZlZwVGFBaXZHcFVOcy93Wk1EaE12TWFwZHlnL1ZTQU9RYk4r?=
 =?utf-8?B?WUIveDZvbzFXUHArZ3ZvODM0akk0ZzRLNWVwaVNla0hsb1p0L1lMcVlMRUw1?=
 =?utf-8?B?dExBQWdXRjB6OGcreWN1bm1YYkZnRWFiUWxHTU0yM1BoQUZQR3o2NUM0UDd1?=
 =?utf-8?B?TUF3WXFPdlQxN0RBZkdzcXNyM29wOGpqWi9xZHRONjFPRHZRK2RxaHQ2cFdx?=
 =?utf-8?Q?Kvl8egxTMAwHBMj9rvcjAvuFvlSdUnEI1dmk8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2t6dkpGcHRYYTNxN2dDaXZWNUhsaWM4czNKdzlTa3c2VC90Y2VVa3RHMmts?=
 =?utf-8?B?MXdUaFlKQ0EvTFl0Wld6ZnozNlB0RythbnpGbGlPakVXcjdkNUM5eGZ2cS9P?=
 =?utf-8?B?RWU3ZGNKMnNJdmpuSDlKQWE0aS9vN1Blek1XSjFmczFCc2I0QlZNeUV2ZEdU?=
 =?utf-8?B?Q0ZHNlFqWUVVNlpoL2RQUVRRam0ySkM3cjFSbGxZc1pGUXdCdExCRlhHRjAx?=
 =?utf-8?B?UnBUekZZVWE0Q09aQXBmZDBVeUJwejk1d2tJY2tvbXE2QlF6b0RHdDdSZmlO?=
 =?utf-8?B?bjBOdGNTZGR4VlVYUGR0bDVUV0JnQ1BtQWlQT2xBMEM3aWFRVldTZWY3WWJ0?=
 =?utf-8?B?RjZJNGhOa1Z4MDVxdnUvMlVOWUkvUHh4V3lpdVpqM2NCcFFmZS82TmVFcW9Y?=
 =?utf-8?B?RVQ5WmpJVTFTUWtic1ZDNEkwOFFZeWZ2RVVRRVIrVVVPRTg0UCtwTkgxSGNR?=
 =?utf-8?B?TC80OTlBYzV0L3ZKZ1NrSFV4TWYwb0phVHluWmZnZ2VKWHdESklxaVpPS0tK?=
 =?utf-8?B?V3ZNak5XK1NUN2xUUE0xekE3MjEzMGEvZ21CWlloM1Z6aEJpcWI4L3U1RTlw?=
 =?utf-8?B?dFhHcEt5L1FOa1RmMnVKRHdIZy94UStjZXV1dTM0Y0ludmM0N1NiNlkrbERL?=
 =?utf-8?B?b3puTW9mejMrZVdocyt0Slo5MjRzNDNPaDE1M01nUnZtUVBQQUh3MFoxRllG?=
 =?utf-8?B?cGpmL2d2ZW0zZktncXhQWXBrTVJ3U2ZvR0JEOTRkWmdpZkkvZkdkSFl3TWFI?=
 =?utf-8?B?ZTNCSVNmQUllTlpZYSt1U3pDam1JQTZhWnFYYzUxV21oV3hheEI5N3NRRUpj?=
 =?utf-8?B?YTJXNDlLVWJGcFRIbzBkNWV2anZFYTBoSHhSWnhGNWVaaGErYUR0ekh6LzRI?=
 =?utf-8?B?WFQ2UWVPUjVCNWpxVWZGMzJ3N1lBWjY0VzBHK2pUYk56a0JzVXZITmJxSEc0?=
 =?utf-8?B?Z2wrUVE1Y04rZ2xYRytHdk83TWsxZzZuQk96RFZobjlKOTM2TnhWbmZGajVn?=
 =?utf-8?B?TEpWdHIrQWpQTUtvcW53aTh3MjhkWkFjdW5nSFpWaUdqWHFLWEVHajhQYzdP?=
 =?utf-8?B?N1lwTTZ4Yk9tYnJEcURsUFF2SGxYMWNOcFFJcis1cjQrYzNqRWZBVCs2eGJm?=
 =?utf-8?B?cE5SWTdERXFsdlZNcW95UkVGaXpWYTdic0pBVFNwb1V3cFd2b2RIOHJoc1Z6?=
 =?utf-8?B?TlFubnFLZWZwTW8wTlI5KzRhcE9NZm4rRXB3YnJBSDhiekE2Tkt5Q3BvWFZ5?=
 =?utf-8?B?Q0k2RXU3Tk50cG56ZE9aS05EbnhlRjR3TWZQRXpBTCtUdEU5alZ4a3dvS3pY?=
 =?utf-8?B?bWJuNlZRMVIrbk8wQU9FU3J5S1AyMlB5RFpTOHpncHhvSmc2M2hQM2ZkNjNi?=
 =?utf-8?B?d2U5S1dZU1FzeFdHTFZTT2NQZXpwd0Y5cDh0aWc1bUw1SWJNM2JGNGJKOS80?=
 =?utf-8?B?QXVBSEpybE1OUzNVK0tSWUF4emFOcEs4MEZGV3NOWStiMDdiRi9aWC9zc0lX?=
 =?utf-8?B?NWgrU2NOVHZNc0tPOC9uUkJXSTVUVFFWRnZCSndkcFhjOGtsb0ZaQ0FPdWZM?=
 =?utf-8?B?LzZyTXZKSDlCd0NxNjZPLzlVR0t0ckxuQk1yZVE1UGpsNUJWcGExaGRIeEs2?=
 =?utf-8?B?Y0wwcVpHcEFYTG8zRHNyeHJ0SE9Udjhja3ZkK0p2S2dEeHJJZDBSb3VqckZa?=
 =?utf-8?B?NWUyYXlIVFNuU1U2R29tb2ZWWXo5UFBicVlwRmVCaGFhSEVEZU1yWjQ0SUVs?=
 =?utf-8?B?WXp0S1ZuM0ZobVV0ZkN2TTFZcVVseWcxSTM0aDE4VHpTRUlPQkFWN3dYYnVZ?=
 =?utf-8?B?ekFpbVdtTjduSFVGZUNRWEdHQllkRlVDcjNCb1JvSjIyL1hvQitROVZlak5p?=
 =?utf-8?B?UHA0d0o4NTlmazNWRGNTd1llS1dVZHdjR1NLN2p5VFh1TFI5Vkp1S3JTSWxV?=
 =?utf-8?B?bncxMTI0RmZxTnA3RG9NeU5DWGNjZjBQbURCUzFoTUpSTHl6YlMxbDRDTnpI?=
 =?utf-8?B?cWZEL2FRZExQWm5mODk3aG9ZRkFHeGVuaTkvSEVmRkhUa0NBN1J6OE9zVFov?=
 =?utf-8?B?NkticDliSDg3YVdoRkZqNnZuS2FDR3BKWnowTUo4ZjJQcEtkRXVWV0Z5bEpr?=
 =?utf-8?B?MUhZbVlzTWdGTlV0ZWIwVTFyaWFPSkJlSHQvVlpGT1l2Q0I1cGlYOU9ZcWRZ?=
 =?utf-8?B?YkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b18c461e-e838-4908-b398-08dda1bd9cb9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 10:09:50.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AlQ8JhCRdpp75pdjG0YHYZRRSrifPPmoAbTTz7avyd7WclbDpdxbLJcJcZ5K/4EDuy0at+HcgSfv2+6nkaeiQCBK1AhyZLexQNeZTulfww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10025

Hi Rob,

On 5/30/25 2:52 PM, Rob Herring (Arm) wrote:
> 
> On Fri, 30 May 2025 11:10:44 +0800, Hsun Lai wrote:
>> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
>>
>> Info of device can be found at:
>> https://wiki.t-firefly.com/en/Station-M3/index.html
>>
>> Changes in v5:
>> - Make led-1 off by default (Chukun Pan, v4)
>> - Add color settings for led (Chukun Pan, v4)
>> - Remove vcc5v0_usbdcin
>> - Put enable/gpio before regulator (Chukun Pan, v4)
>> - Remove always-on and boot-on from vcc5v0_host (Chukun Pan, v4)
>> - Update the name of vbus_typec (Chukun Pan, v4)
>> - Remove always-on and boot-on from vbus5v0_typec (Chukun Pan, v4)
>> - Put pinctrl-names before pinctrl-0 (Chukun Pan, v4)
>> - Remove usb_con node
>> - Remove extra blank lines (Chukun Pan, v4)
>> - Add phy-supply for u2phy3_host (Chukun Pan, v4)
>>
>> Changes in v4:
>> - Update the name of the regulator
>> - Remove the i2s5_8ch node
>>
>> Changes in v3:
>> - Update the name of leds
>> - Add more cpu nodes
>> - Update mdio compatible
>> - Fix the order in the node
>> - Add the default serial port(uart2)
>> - Patch 1: Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> Changes in v2:
>> - Fix rgmii delays
>>
>> Changes in v1:
>> - Add support for Firefly ROC-RK3588S-PC
>>
>> Hsun Lai (2):
>>    dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
>>    arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
>>
>>   .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>   .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 838 ++++++++++++++++++
>>   3 files changed, 844 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
>>
>> --
>> 2.34.1
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>   Base: attempting to guess base-commit...
>   Base: remotes/arm-soc/rockchip/dt64-31-ge463625af7f9 (exact match)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250530031046.166202-1-i@chainsx.cn:
> 
> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']
> 

I tried to replicate on top of master 
(24de2b9da3e28df323c1e096538ae1e035751adf) but couldn't, so I guess we 
can simply ignore this warning?

Cheers,
Quentin

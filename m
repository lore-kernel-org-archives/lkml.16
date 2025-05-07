Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2098.outbound.protection.outlook.com [40.107.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223AF20B218;
	Wed,  7 May 2025 06:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600052; cv=fail; b=nfnHS6za3BBHN6/9m32GQgYCbhLv02tHsPhubaVwq2eXAsI/XwLc2SQ2zpokqMTL/bDWyaev66Oxkh01ZIwpEF+V5ZEzAlHCiHyREeiKxVQPNZMwN9OrxHcCBy5KTIq5j1Q2JlkqRGeIisgOv6xmflKLZ8GwisBhK2bLzWWBQ2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600052; c=relaxed/simple;
	bh=LuTvQzd+5KPwyma/WR80UakJqhzjwu3SfahZ+96zPE8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dessCluvytVpVbnMTkBoyy0OWsPKYqk0kfYdPEZ1R9S4zFXVlx1lviwKdMpYN068dG8Ai+jJjbeDlewWse/+KKvNWqgjj2RxlPd4BaLxjB1vdrHBTdQF4X5+uYIBeT/QnD5Isj9n2dq651tYKCFA2xHqhKN9CoqblQoZXc2bbvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=SSAA6PFZ; arc=fail smtp.client-ip=40.107.21.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="SSAA6PFZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eayBEsNsJV0sj0o7LtHhqA7zRVr8t8NSdtXq9OVv6mj7Rg290qgdNgGXmeoC9EyZxNvMvQLXne4JJlYPk5qxJ/hAfBVkvTboIuTPl/5DiupMDmn6+edxhXxLQ78rMU0FXjA0IqsuZfMrJCwavrGr6Idv+TpcEYpBNrPc3Hw3hdOYjHVsasxBcd0om1a8e+V4DhJGdYYklVYqP2w88KdvKvLzYwd7UK1yI+gK003V1E6kAdlaUDKt+2e+lVCFZ991/nESWiwLIL9ItaJBgn3QQm/xI16JurrWLzVaVNNfjaUBxvT/VFtkQ+WYBVdgQCNPnXCtLHjp6ZNJN3CjuiPP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTxbh3CFnaqxraYDZh3AF08L51VzwlwyDP0LsqRDink=;
 b=i85rR2oMzeXYgjNb6c6SJIVJvcL3rV5SAx37kVDKkqGA3HBvUxauOFTb+xgyx0VIQL+Nn2lLDQ3+d0KoWy2u3u6tfqwnjWRV4bWHfyizVeSCazPyb1fSoGFHZ+g5ywmI6998MOQ7o8so1wF/o1GosCP93+nX2m35N3e8185JaDFcewGgMr/PDh5JZKhZTcgG1IUPQKixOax77+dckAFENeUAjI5vkWvV00sy24ABYoMl7I4O+sgYrfho7ZDO8/sxKJPCqEKKNjlGpUnO7SYCC9ZE4kIBSxN1tWAkbEYPkCwMlhmuSlTTs9BYxrNrr9s+5aiV4XC9KaBG1mehe96JHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTxbh3CFnaqxraYDZh3AF08L51VzwlwyDP0LsqRDink=;
 b=SSAA6PFZanK9pIFMt3xS6PCn1VZZm2o8oy9BLbNprOo3B1PcRDs6JZM+EESAS1RMYIQ3Mvwp0nJuqZFmTn8nWu55zEFiQgqN58jZTJqpDesONJCCesZDBwXD4PUmNERbF2xb9Z2Y2h72GYbBxyefWMXtJciY5d92zPxtC07an/XqcqNTxeUVoWZkCCMxjmOW0rFLzjvSuW7lc8+DbPbr+hHIGjsmjXn4SKwjq0AFBHc7Zi/Lcrz0RCj9VnEgyCo5ZyesbOWG+kEp14CMpXrYjfFtLPMI1qj9Rdo9c1i7X0Drzxa4FUwsKpr9LJfm1QCiJeHHDQSRNqdlEDYwU8ib2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by DBAP195MB1066.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 06:40:44 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%6]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 06:40:44 +0000
Message-ID: <ea2a681d-bd5b-4f8f-b861-dd93424c95e3@phytec.de>
Date: Wed, 7 May 2025 08:40:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: ti: k3-am62a-phycore-som: Enable
 Co-processors
To: Andrew Davis <afd@ti.com>, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de, w.egorov@phytec.de
References: <20250506133604.294920-1-d.schultz@phytec.de>
 <20250506133604.294920-3-d.schultz@phytec.de>
 <8ffefea3-e458-4a9e-968b-89b7541d3b5e@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <8ffefea3-e458-4a9e-968b-89b7541d3b5e@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:303:86::7) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|DBAP195MB1066:EE_
X-MS-Office365-Filtering-Correlation-Id: b849f92d-e465-45e3-cd99-08dd8d32175f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2laa1I0MExVK2tkTDJDZUpIVE9NcldldVM5YUFxaUhXY2JrYStVVmNoaEVE?=
 =?utf-8?B?RmpVVmNSNVlvQVdMTzUvZlU2MjlDYUVVNG1mUnJ3eXBMQUJpWFlXWk03WTBr?=
 =?utf-8?B?UjlKS3p3dXNBc2U1dmJvQjFER1IwMzJlTlhDM0NLVkpOS0Y3MUpqUHdmZkVG?=
 =?utf-8?B?ZTZiK0I4djExVWdtbWwwWkdQY3dtTmVRSmlUeTJKSjZNRUk5WFA4aDkxZ3JB?=
 =?utf-8?B?dWRWRldGb09TVXJoWEwybFFkaGxZYXp6RjlONjQyMW1lOE9IWDZJNUlLdVgz?=
 =?utf-8?B?QjRSNHM2Mm9CV2IvVTdKUXgvQUYzV2NWNStzZHlYbE1tdDVWd1JiMlMxMkVB?=
 =?utf-8?B?WDd4V0RxSGkzbFJUdEcvOHU3WTd2TDJHUWpvQzJ6VUc3WnQ2eGREWlkyVXNF?=
 =?utf-8?B?Q29MY3pkUDBHcGtMT0xHeWdHVnNHMlA5RThtWXY4WWxrKy9IVnUvNVI5VDZw?=
 =?utf-8?B?ciswYXBtUlU1VHoyWEtmd0RQeXpudmx4L1gzc2FJRzdXL1FNellLZnp2MlBL?=
 =?utf-8?B?dnRiQ1RQbU9kbEN1OC9aanJzODhadXl0azVnTmJmdW1UemVlV3dtaW1MVkpY?=
 =?utf-8?B?cDZ5VU9oMVFQT2NUcFE0aEUvditQY242UUp4ZW4yRWVkVXZJV2JpZTltNHhC?=
 =?utf-8?B?dnBHdHFxaTgzMmJZZjlzZTZvcnlDTlo0eUVxRkkwM3JWSCtiN25hMlRPYy90?=
 =?utf-8?B?MXlvdVF5OUdQYWpJSnNQRzlFV3VEa29lT3JtZ2pBT2ZhbmlBR1I5d0JBV3lI?=
 =?utf-8?B?b0hBWUt6R212TTE5WG5ZSFpHSjJGUmxEK0pwNnI4bHA4VEkwVjNtMUg1R21r?=
 =?utf-8?B?Z0JQNUpiWWxjQkxoam1uQzkxMnNmenEwT1lzZkFJUEhyKzRNYXdrL0JzTERu?=
 =?utf-8?B?Q1FLcFl0N3l6TmpVaW5NdE5ERmloWjZ4am9VOG00QlpnWEZPSFFLUzVDeWRa?=
 =?utf-8?B?eEFDTGdCMG9YeUlNRlJoRVo1RmZ5QnNCRksxTkxxK09WNTR4T1pLOEhrUUVL?=
 =?utf-8?B?RnN2VWhoUzlVVHRZY3FVRlJlYVlhTitZRUlZOTBkZ0ZkVEJzbmRjR21kSHB0?=
 =?utf-8?B?RGFpZnFyTjhRM0w0c25CQmtuQnlOeTlpaWlJdm5rZlZRSUNZNCs1emZxemw4?=
 =?utf-8?B?eHJ5TjFxblZzRDJlSXBEVlJDWjdGb0x5dUVxTVVHLzlQNHNzNjZRZ2pLOXBk?=
 =?utf-8?B?S0lLbkRlN01BZ29Vc0NRWGRlejVuQmdKVFVySDdxcE9GRm9lUFh4TWFVTXRl?=
 =?utf-8?B?Z2pCZ04ycjl0UHVWVjRHeWRWOW5iUVl4b0QrQVVoSkZkeXBQOWsvZVlUZGgv?=
 =?utf-8?B?UFkyNzYza0NKZkF2RU41Ukd4N0ZTTVc3MG5xSUxTUVpsZXFYbWlmdjZyYWZo?=
 =?utf-8?B?d3ZIQmorTWRGbm85SHp6bU1lR0tuNHhFUHZSTVVSVTdYZDZiSURlTEhoVXc4?=
 =?utf-8?B?T2tUYnpoU0pPTy8vR1N5M25uY1ZORjc1blRkZkdFTDhaWXEzK0taNDVYYWZF?=
 =?utf-8?B?RU9IUjNOb0hrZW1QR0tqbkEzYjNXU3hwbi9yVUo1RFBMUDhIQTRVR2xsdzhv?=
 =?utf-8?B?UGVIN2J0VlkveDlzUStRcWFUNm5CN2Z0S1hOcnArZWZHbFFwTnc4TGhPdm4x?=
 =?utf-8?B?UEgxWExqWXZqZTh2eEg1TEtVQ1E3d1RPMUFCUkxnS080QUlvYVNWSzFIeGhQ?=
 =?utf-8?B?eUEyRzNRdlJ2V0I2ZEdqSXlqdjUxdSt2aTYwOHA5N2dYTUNuek5qTVJYZTF3?=
 =?utf-8?B?b3QwUk43NlZ5YytlVzhNR0dYR2xnckdBNXk5em9KOTQ2bGEyU0lWVGR5SDFX?=
 =?utf-8?B?YmdQWng2ajlzOEVibll1cElHeEZOYzdHOXFLT09xMFh3aTg4ZmhVa1FNSUo3?=
 =?utf-8?B?NXNiYlk3KzlHN2N2alpOQUtjVXZwU3NLelc0ZUZJQ2NENFFLRCtqOGVtd0ZK?=
 =?utf-8?B?MExxOFlnbDNrUHJTVzRoVkUvSmIvUjB2bmFDcDFPeXk1QlNSS09KYXRldTdJ?=
 =?utf-8?B?RThKWTRKUjFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(366016)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm9BaElxWTVZNWo2MGU4K0xmUkR5K1NtS01XSEJ0NDhYMVliajkyYVd4ckZB?=
 =?utf-8?B?MGZJaGZzUjFtaW5vTXVEM1dab0RxaU1NTTNMeFI5N3ZPTDBVdTJFWnRiQm15?=
 =?utf-8?B?cG93YWVkWXk5TUNSVWhuY08xNnFGRTh2M1NCcXFvSGhJcmh3dmE1c3BBZXFO?=
 =?utf-8?B?L2xlaEdtTXZFTTBqbW9NTll0OXlhYzVWZTVsdkIxckJhaXg0b3NlSkpob0I4?=
 =?utf-8?B?TGV6aHpMdGo5M0pjcjU5bFltL3ArVnI2d0M3QWNDYzdRQnJkSVUxRDJzMGw1?=
 =?utf-8?B?RnplUWQ2NEhCRHdEWGZKMTNVUG80eDk4TUVQc2xxd0R4UE4xUGJmSVRjSEZ5?=
 =?utf-8?B?aEplNkZieWFkaWVkNmtwSWlaaExjZDBPT2lZcXpaNStXU3hYTTBTU1M4a3VW?=
 =?utf-8?B?Z1pPd3FXN3ltbWVUdE1GMC9ROFNXdVhOTnpLODdiOTlvTnBvWnlnNTNydmNw?=
 =?utf-8?B?b012YUc3ZWltbGJBZ1Q0bU9lcjNWZmlNb3hjR05zcGhZeDhDZ2ovTnArN1JZ?=
 =?utf-8?B?ZUFZWlVqbW5UOE1VbW44MFdRb1N4eUhndW9PVmRNL2UwNThnY0dVTm5GQWsr?=
 =?utf-8?B?bFZPWnhrNUR5UktRakZyVVJJbGxteGhzTTJhMzAxZy9QdndUQVkvWFJESElp?=
 =?utf-8?B?RFF6NnBXL2l0TGlwK3FXZXlqNUVUb0pVendwMHBXcnMzdG05N1lxSlVCZ2Rr?=
 =?utf-8?B?L1c1ZXBSTDRtYkV1bnFlaGdLdHVid0hlWG1CZU9CV2MyU0plT1QxcXBWNSt6?=
 =?utf-8?B?S1pjSWlyaG1yS3pYVXZ0QkhPTVBMK2RzdDR4dGVyRlV4MndIMm1QSjFZYm5o?=
 =?utf-8?B?dGRSeUFNNE5kUW5tdkF1ZWNRUFh1L2VLemE5U3JHZGwxY0RmSTgzRHhEL2dv?=
 =?utf-8?B?YytzWXAveXg4RTc4b1FuZmltYnUvYTlyWko3M2dBK0t0b3BGQ3kxcFlaTTdw?=
 =?utf-8?B?Yi91TFRPVjVlNFRCckd3enZnSXVyaHBvT0tZRm8zdEIrZkROL3crV1ZWanJP?=
 =?utf-8?B?bS82bHZJS21jWUdmR09nRU5haHB2WStWU2U3Y0RYNHJrMldWQlN4a3lpWkFt?=
 =?utf-8?B?WGdVTERXYUxIb2RNdzkzMDBTVEU2NFRseXZZSlM2aVdTcDhsdDZuanJ5VFU4?=
 =?utf-8?B?RThKaDRKNE00VGMzRWxSVFRYV3Y4djhnVi9IVVN5RTNSS0k3TnpCd0puRDll?=
 =?utf-8?B?ZEFTalpPOHZnUzhCRGNMNTdzOGp1TjVlNE5IbkV2UG5sSnV4QWxWRi9ERVFC?=
 =?utf-8?B?blVaeFp6aHMzSnlubnVPa0Z5V09oMEh4QlZ0RUpZWlQvczgzVmkvWjQvd0g0?=
 =?utf-8?B?aWEzbWFNT1ZGcndWWmg1TVc5VW1vYldPc2lSOUhuN0pKMDFOcXBSakIxTm41?=
 =?utf-8?B?TFhHUjlpTWhNVUVHSDM4U3NSKzFlZWIxRUN0WGhabUVXbXNsR3V5ekNKblFB?=
 =?utf-8?B?ZjRZODdTSjMraWNTenc5M0tvbjA3clk2b09vMjZEZG81V3B0ZkIybW9NNENn?=
 =?utf-8?B?ZTBpa0s0NFFISUpCYXBGRmNMQmwrQk5ia0dqSytiQWRjU0ZCUFczVUtGMTFh?=
 =?utf-8?B?dWduZ2N2LzRWdWk4RHNxZEhVMmxLcXdvdzJmUks0NGlnZFo5OWdFck9rektS?=
 =?utf-8?B?bm9FaUxxVnhmbzBFQ0YwNDVDSTNxVitZRjgwZHdCQzRGb2xTYjFLSlpSQmI3?=
 =?utf-8?B?OTR0Y0VMWkk1ZVUwazFiK0xOYmViR2NLOFRVdi91bXdxUTRTMmF5ODMzZ294?=
 =?utf-8?B?MlZ4cnRJZW4vbG4wZWdDNVdpMSsrdmxiR3pMTjh2U2VUTDlla3JuK05yY01U?=
 =?utf-8?B?bHNLZERHelphaTZNcmN1U0VFc3k5b0xjSnBzQStQZFZxN3VRZUVGZjZtVmNB?=
 =?utf-8?B?dUJvNGlpaXJtU0tVLzArMzAzbkF4VUtyc1h6Um1JSkd6QnhWMzJjaDJhak9G?=
 =?utf-8?B?VkRHejNJaUVRdk05WkEzZCtGK1czQUwzd0sxN2VCaUVVU3JkMEI1WGY4Zkwz?=
 =?utf-8?B?cTdNN1Nnc3ZVYTlEYjA1d1FITy9yQ2JPU1ZtejBCSVhvMnpVSFpjVGpGcndI?=
 =?utf-8?B?L0tQa2oyaEJSL0xHd2d3TCtoUGZ2SGhyZHpaTHFYOXNZQzRsMlI5NDlOaUNN?=
 =?utf-8?B?bS9PY2g4b255T2ppY0p0SkRWWmxVTGhPSTErUjA4WGkyclF6VzJ0NGUzS1hs?=
 =?utf-8?Q?U8iLqKj5P4x1EccOYf5Zl2SZZg/k5EZhg1AdkNsi4tTn?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b849f92d-e465-45e3-cd99-08dd8d32175f
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 06:40:44.0500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YV/gOWeUTfWadQMgtJnShWbAACeR/xeDE8Ty9NxAvt11B5XvOWTh0n/vPcvBEu+nBspu/MQohaVlObWJh92FeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB1066


On 5/6/25 16:20, Andrew Davis wrote:
> On 5/6/25 8:36 AM, Daniel Schultz wrote:
>> For every remote processor, set up dedicated memory regions and
>> associate the required mailbox channels. Allocate two memory areas
>> per remote core: one 1MB region for vring shared buffers, and
>> another for external memory used by the remote processor for its
>> resource table and trace buffer.
>>
>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>> ---
>>   .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 96 +++++++++++++++++--
>>   1 file changed, 90 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
>> index 147d56b87984..049aa358e796 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
>> @@ -59,6 +59,42 @@ linux,cma {
>>               linux,cma-default;
>>           };
>>   +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x99800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        c7x_0_memory_region: c7x-memory@99900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x99900000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +
>> +        mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c900000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +
>>           secure_tfa_ddr: tfa@9e780000 {
>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>               alignment = <0x1000>;
>> @@ -70,12 +106,6 @@ secure_ddr: optee@9e800000 {
>>               alignment = <0x1000>;
>>               no-map;
>>           };
>> -
>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>> -            compatible = "shared-dma-pool";
>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>> -            no-map;
>> -        };
>>       };
>>         vcc_5v0_som: regulator-vcc-5v0-som {
>> @@ -170,6 +200,13 @@ AM62AX_IOPAD(0x1f4, PIN_INPUT, 0) /* (D16) 
>> EXTINTn */
>>       };
>>   };
>>   +&c7x_0 {
>> +    mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
>> +    memory-region = <&c7x_0_dma_memory_region>,
>> +            <&c7x_0_memory_region>;
>> +    status = "okay";
>> +};
>> +
>>   &cpsw3g {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&main_rgmii1_pins_default>;
>> @@ -200,6 +237,33 @@ &fss {
>>       status = "okay";
>>   };
>>   +&mailbox0_cluster0 {
>> +    status = "okay";
>> +
>> +    mbox_r5_0: mbox-r5-0 {
>> +        ti,mbox-rx = <0 0 0>;
>> +        ti,mbox-tx = <1 0 0>;
>> +    };
>> +};
>> +
>> +&mailbox0_cluster1 {
>> +    status = "okay";
>> +
>> +    mbox_c7x_0: mbox-c7x-0 {
>> +        ti,mbox-rx = <0 0 0>;
>> +        ti,mbox-tx = <1 0 0>;
>> +    };
>> +};
>> +
>> +&mailbox0_cluster2 {
>> +    status = "okay";
>> +
>> +    mbox_mcu_r5_0: mbox-mcu-r5-0 {
>> +        ti,mbox-rx = <0 0 0>;
>> +        ti,mbox-tx = <1 0 0>;
>> +    };
>> +};
>> +
>>   &main_i2c0 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&main_i2c0_pins_default>;
>> @@ -315,6 +379,16 @@ &main_pktdma {
>>       bootph-all;
>>   };
>>   +&mcu_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&mcu_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
>
> These mboxes items should be combined as they are both part of a single
> two-element item, not a big deal for now as the output DTB is the same,

Yes, I can do that. Heads up this is copied from the recent k3-am62a7-sk 
update. You might wanna consider updating this board too.

- Daniel

>
> Reviewed-by: Andrew Davis <afd@ti.com>
>
>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>> +            <&mcu_r5fss0_core0_memory_region>;
>> +};
>> +
>>   &ospi0 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&ospi0_pins_default>;
>> @@ -343,3 +417,13 @@ &sdhci0 {
>>       bootph-all;
>>       status = "okay";
>>   };
>> +
>> +&wkup_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&wkup_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>> +            <&wkup_r5fss0_core0_memory_region>;
>> +};

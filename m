Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011038.outbound.protection.outlook.com [52.103.68.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C54226D05;
	Tue, 27 May 2025 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341341; cv=fail; b=gyIufdTmZbvMoPs9CZZ4OwFIC+/fc1U8IJH+GnQGd/uH85C0UjGUUxmmZufvQG9h/eMDMv7qTS1WjQiv22TBVD5x7N64VYznGhLJkB885v0JeRnRB/I6PQ32E7qMi87f7ynH6Jiw3lSUuWlzNc7hdAO8jHOJZdkk586gm6hnvq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341341; c=relaxed/simple;
	bh=b06Iu/xHSD9DMLKawbFIcg0Wjy9RwLHmk28pgFU5KOo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=suQU/QoaNQUxk7ah1BhQml5D2hXS3jw0+kf3DdQ8N7TrgU102LraOHMj631EU3KstvDY2Hijam7MFUEs7+u65bEORT1T2d5xS3ZO+5OfLT88Cz9qEqnxTMEJAu1lrB/o0mXWfp3XukXrLQmIXKmEh0wHDBSbohQqAfzuClWQ/7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=fznL76bU; arc=fail smtp.client-ip=52.103.68.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="fznL76bU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wb0ws//+48dUJpaCItnMmIVZknDYGnLJGZbYDjJsML1oSwfn0vQRBFS1SyZCaRzTwiA0VVRt+2yTMA1QKt0gGAq3uuK/hDhXeXn43/+NpksW+WM4lC2hLUb12b6Sti7G0vd8O81I45gnkBmhgAz0k8RU7YLiYrttpBKFOumD6dAvSjM+3hmPcewi8G0vI4AtqXMsZrY+tAyj+eeSjdFQqbsyArmj34zq9tD9WTcoTu33KIsPlNzkBDOMa2YFffCf0wb5yig/BYQHgLInmiwOqaLUNL6Gt7E5OPyQoyzAuHLHBv1TbHSAucII91iTdd7rOpes/haYN39KVDZMuDp1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFJglfRzqgYZrhDVL60pxkygbNe0WYE9kHvFGxCMw80=;
 b=QSbl4/HZPyex70fSjhYf9VldWZRHX8fSaNBDzrpGRZeIlgvgCPuSabUCQ+ntknW3qOYHjUF8AlfSW13V/eVWKP/07j8qvqupe1oBJcmBXGd+rgLITqAF22fZqF10/Zr8LD8Hedh0WZD29pvSeA2zbYcYRkyrIolmwI9XdeOM1V9nUNFPPfoTfwZaRpe/FzQq0nxoE4XXEGFsN08RsIHZ24Yaq+ph659T5IIDUZq0OtY9/Yc8yeBUdR+Zictn27qBFCk+1BZvruLSVq4x6KLmaPqvU6Kj3GMnDpMN1NS95k4ahJNCcoQTS4aQ2HVph0kF0CO2N/4ixkXiX9A9hnK5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFJglfRzqgYZrhDVL60pxkygbNe0WYE9kHvFGxCMw80=;
 b=fznL76bUS1MlJ1n8O4Zqquwg2kIqty3n7uwV5AsY+DxR5BoZuU4Kk0Pp1YOO5bDTDBW1tF6DeyjHzpvEq8ttsG2AMYBRwQvizGqHXpOCxMCIXkmJarLdSX9KPbfvmRivW2nwGQTFFqzOGPLifoOR5DX69qxK43dip931AYD/P8JVNPAbUhjvHSIKIk7GsHpWLK797cy3lOYpjJ27Yoarr6KzJmyv398AxZRjr4iQEGlYcIOPWcwq+5R9g3v6xF4tgCbTueR+6Vaa7yfRd4bL6roJUuvbWFqY7J6iVghFD7Ei+CIb9x7YsP2NEN4RhzIC1Xy0DyFEvw/f++UIJ3RdIw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB0766.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 10:22:10 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 10:22:09 +0000
Message-ID:
 <MA0P287MB226265FFA15A808221629848FE64A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 27 May 2025 18:22:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1747235487.git.rabenda.cn@gmail.com>
 <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
 <MA0P287MB226290B908D3209E5C890BFAFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki-33DcA7xeBzzv1hm0wR_ebcVdux5fQxGVrLs45RbGM9A@mail.gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <CAAT7Ki-33DcA7xeBzzv1hm0wR_ebcVdux5fQxGVrLs45RbGM9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <da9df1fe-504a-494b-921a-68ad10c0d2e0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB0766:EE_
X-MS-Office365-Filtering-Correlation-Id: 62086dac-d78c-423c-bc49-08dd9d08568e
X-MS-Exchange-SLBlob-MailProps:
	obhAqMD0nT+76ZruCrigLPUIQMEMZUn+MbUvcOWhZOwumY4xz73a/DTBkhOT12ipqnXXFUXeibHXRQ2japG53gyJeu5pgugNKXNXO2DRHY91k0vSLKV8Lf7MEbNU3zjjmYhCK+OTiuxcf7Nu2pl8UMclTYWI5fPZnOlbfzoVnvxw0p8q/MdvVsp2EX5CQM8aZdCQ+FocH63hkFOIJ2tKtzASWVe3izMCVZl6xmZBDlf5UulhcUx44y6A82Bf7BegUPV6vX06j17e29VAH48xWmyWvZiwo+OTdRXflJo5IJt0RRkuzCtumE8l1ohjvsrRr5S4xvQh8yVBD2OXZ7bs3Mb/POz33HuAFXOP2d30QLB1/BsJ6p2oL1Xc9BEhuAA+HEf+XGt24QhAL+sgYBwHOpq4H/JCxW/+uU5qi1tHS1wysQzE+6Acipbd29M81gTBzusPe8srQd/a3OK1NXbNTtQmkobHXeZoudYtwYTd37CmKG8FkQTlZtEIeSXZyCMQrmbu6fGP7q1WZErlNYR+3JsI0+i6slXiwUjhRNoFlsBguUwPDZZOk9wsj2Nq2KA1YOZlMAEljkuR7jdUaujOzUC9TzMHGHHkYTSXXgqDkHOXTCz5g0QHgkN3vvEPXqNJ6V+/JdkhvI1lmWgaCv0O49NdPI96+Jdhql0voBVp/9ut6bCz1lTVvCXfRq1eOI6WlnU43jRePZlNETNypqXwpRsh01oWySJFOLDq0P4Wy4vYv6hx1jbxXNjCxRb/cS/fYKyRW6hUVdhKanKJBrYAcUtmMRfHSbwwh8dv65fw5pQnkJMMyF6MINUCBmdgkjvF
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|5072599009|8060799009|7092599006|6090799003|19110799006|461199028|3412199025|440099028|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXF3a3B6TExKbUNSKzJidysxMmpSaGg4SVY3TU1XTytwdXNEOEFlMDgzSGQz?=
 =?utf-8?B?WmM5RlFuMWtiQzc2c2Q5VitWOHR6SFp3Nm9tamp4VStZS05ETWlIMnh1VExh?=
 =?utf-8?B?R3R2Y1k5WkFEbFErRllDR1duQVpaRm8xcVJacVdDT0YxTXgrMUNJVGdSMjZF?=
 =?utf-8?B?WXMrVVV5UkhVVU81YXd6NWJjMDhxYktudjlPUFpxRXBEUG5jYjkvTHZKTTMr?=
 =?utf-8?B?c3VzQ1BieXVwT1JGbHNBVmVNd05KT25odS8zUTNDQjBoU3cyc0ZGaG5qbXZQ?=
 =?utf-8?B?L0x2Titxa1dJOUo0OW4zSEx3VWt5N05wcVE2OUdqaVFXcjhzY3NXZm1NY3Y2?=
 =?utf-8?B?R2JoVlFCZ0hOdU5qK2E0MitoMFI5Q3FSeUprakRmREhmaWdpQUJFUUxYVll3?=
 =?utf-8?B?UGtkaUdNcjVNajRmRjZJYlRWekZPSEpZRllQWSt3TGtjUkp5U0xYc2Z4UmtN?=
 =?utf-8?B?Q3VwV254WVFaZW1rMURxSjZ2QVNIakxNb2VVU0NxeE9oZktzZFNJcUdjdEIy?=
 =?utf-8?B?NVVMMS8rS3FqK3pKOGJpbFFEVCtEZG1YMXBaTlo0d1p2THB3YjFwMEpNNWhR?=
 =?utf-8?B?RFZjOUpxeldkUE9qcXFnNVp1aklHN1RZeTJwdWR1dFlKUkR1YjY4U1gyTVNh?=
 =?utf-8?B?RmY4L3E3d3UrYitXSExpMVBGbnM2L2tibStpOTlPdFBsQkFGODIxb0RuSWE4?=
 =?utf-8?B?VWVESU4yZ0JkV05UTzB6d3dKZTMrYi9lei9PZHppTWtJU2swZ0pET2MvV3JG?=
 =?utf-8?B?SGVmQ2kwRlI0WllyUUlKQ2VzK2g5a1l4VXJnMnYvQjI5VUdobmk2MTR6ekVG?=
 =?utf-8?B?L2VaRHNYRzlPWlNzbElJTlZRb2I3ejZYWEdVempHMFNyU2owSnFBUGxXRzBw?=
 =?utf-8?B?ekRYT1AvelIwMUIwRXlDOG5lc1lGOXNydlRyYW1ieGZZWkNrcTB4aERnK1dD?=
 =?utf-8?B?SFBmU2pGSmNQRVlBaVVqTUF1MGMxcTEycHZBRTA4NmVjT0QyZDNaNVZEYUpy?=
 =?utf-8?B?cHN5L0Fadkh0OEZTZjRRQXR3QzhyYTBkcWh3VU5zMXllQXdjTXFJMndnSzF2?=
 =?utf-8?B?KzJudW9MeVEveGd5Rzl2aUZndVdVT1VqeWZYcEN0cHkxS2NIbDF0b2hDSFA2?=
 =?utf-8?B?RGdZNWhrbjBic1ZJOFJmOVJNU1V0UlREMmw3OHVhajl1NWtEYjAwQVZocGlU?=
 =?utf-8?B?OHh0b0p6ckpoQTFndGphUW9vNW9MS1FBZkVtRkIxdWRCQ3p1SDJhcGh1RjNQ?=
 =?utf-8?B?WWZndWJ3UFRVbC9wTmN6c0M3SC9Gd0lCL3VLQTJJM2xYZnpIUy9yMS9TelBB?=
 =?utf-8?B?c0tpZFNTeG51QVBWV0pXTkw2Tmw2SFg5MzNMZXRMSGVZSWNFZlFzZWlaVGZ2?=
 =?utf-8?B?MFZqWGsvWkY3c0VVa2NYdVJHTUlNRWM4WU1OaWI2WHd1UXZTMGRYQ09RaTln?=
 =?utf-8?B?czhsZTRCU21rQWROUUFETnhxZFRuMW0rM3g4RWlsR0JEdVVkZzhWekVtS3Jm?=
 =?utf-8?B?OWpwLyt6NUNEZ29uM3U1MHFhdDBSR2hHOTRwbEViVFAxc1JWMkU4K2tNMFli?=
 =?utf-8?Q?NZkzr8dpXyqEpnlC+2jjCjGeOTyx0Dg9DfdhLEtOhGcpXu?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjcvRHBTNGVWMGtMK3p0Skg5MS94bURHV2hjdDlVaVdweEtHcFllNis4a1ZC?=
 =?utf-8?B?NTdnNkkwNWtWV2tHMXdHamZjUTRBY0hPS1FYL3pOajRJL2FsVDdFYjNrRHhp?=
 =?utf-8?B?U3pGVUhrdEVTaHZZTkQ1OG1FUEp4dGE5bDl6M3BqSFMxbVV1Q2lIWml0Q3pp?=
 =?utf-8?B?bWMyUkRDZDUwUVBuc0dFVnErendnK2hKVUJLZVpFZFFqZlVjTmhmOEwzeHJm?=
 =?utf-8?B?Z2tsT3pZVmhSR1NEbVFJUXhpSWg1TE92MG01ZW14VDU5RE1sMnRQb2tBVzA5?=
 =?utf-8?B?V2hHV3BEa2YxVWx6RHRaR0hjbFRDNjR6end3MVYwZEZXR3lBY3BOZzFacmZx?=
 =?utf-8?B?eFVSWnVHOVdQR0ZnTG5hUVBlNWphUFR4ZWtrVFFJYWYvKzI3MDRja0Z6OTZW?=
 =?utf-8?B?ZXNHbFkxZmZxZTZwWXlCUm5GTjRacThZamY4dHNPRUZSam9QdmlrZ282VmRx?=
 =?utf-8?B?THkyakxoY0JQWDBIcEFxL2NPdENuSnhlcXZNaTdDNzhrQkNJQjJxbEV0QlR1?=
 =?utf-8?B?TythTk5IeDUzcU5iVUhmVG5ycWxjWktqLzZHREFuQXJ6TXh1L2hINWdMUzVN?=
 =?utf-8?B?QjFiK0dVZXB6eEl4RFUvSlJ4d0hwblpicnVDUjFKYTlGYi9rWmh6NHM1bFBB?=
 =?utf-8?B?V1ptUjlNeUVxemtHcG8rL2RiK0hsMkxKcWdFQm9KSnZDWStJNllINDVRa1pl?=
 =?utf-8?B?anp4dDdLL2RLWnN4aVNKSU15UmRrVXdZUjc0UzFxNHR5RG10Y1IyYlVmWmpV?=
 =?utf-8?B?RGpha3JtZDdsZVpTRE8vWU9ieGxSZE5RSUFpM3lwRm5qaEZzQnBWSW9aVk53?=
 =?utf-8?B?ekRKeThMNzVMZDI3TmExWFFORy9EczV5SjdvbGxUTGZoRTVoZ3JTanFpQm12?=
 =?utf-8?B?ZVZhcGl2YW54OVRMS2JVTGdjRjFwcFJsbFJBT0swbGNXdFptNmg0WFZqOWt5?=
 =?utf-8?B?SE9GZ2VaYTg2bk5ES0dTN2lkZnp3akFsb1ZaVW5ab1NCbHVoeDJCK1pHeDBJ?=
 =?utf-8?B?Y2pFRmQ3blFQazNNazZTNk4xQ3dtQm5IdTgyQSszUVVjc2NxWnA3d3RtblBo?=
 =?utf-8?B?b0x2TTVVNDJXWG1Cb0VLbXVPNHJkNGZNR2xhaGw3b1hqVXN6U2YvNUlYU1hB?=
 =?utf-8?B?alNmcGZvakdUR2NIRTZmSXhvSThIYUV2N05QM2d0bGlDOWwzaEVyWkhJVGNS?=
 =?utf-8?B?UWlZY3NZZmZRV0ZDMlBvTU92YXBJUUJCYm5rSzZOSEN4VDJua1ZRQWNNTGFI?=
 =?utf-8?B?cXNiSGFZWTYvU2tZT0VBU1A5RzMrM2lYN1dXVDJ6V3hoWVcyUGwxV0IrSWYx?=
 =?utf-8?B?UkloRGloSEtXcUE0TGIrdXJNY2haR3FRSWVhWTdhZkE2M2JnVVJjL0taVFRn?=
 =?utf-8?B?WEhHcUIxaGVWQUxqYnU2ODVTTEhwTFg4ZFB1VnpsejN4Smp6cjI2TWt6VkxR?=
 =?utf-8?B?TUgzdjJJNU55V2pJL0VjWTRBaVliTm1NWFhrN3J6Vnl5OWZFc2psa1d6alFY?=
 =?utf-8?B?REU4U3RXTTBNNmVsSW83b2hGU3ZmVlFqbFY1c2FKZmYrNEpNMDhMVndBOXFo?=
 =?utf-8?B?UzJydk53ai9rZ3BwVDFYdVppT042dFZpQ0QzRUtsd2pJVHloM1I0TTZDNUgx?=
 =?utf-8?B?WWJGeU1QZ1FOdDdyaWwzalpCOTJVNGI2TGVyNGx2UEQzMG0rcXVBU2t2bCtW?=
 =?utf-8?B?Q1dkVTVuamJiZnArZkh1QnJvQlE5RTZobHYyRUx6M29uZHZHYTdpSmlDMGhU?=
 =?utf-8?Q?4gZV1sYTFRwsag73Z4VU19awxP59CHR+QcfzfgI?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62086dac-d78c-423c-bc49-08dd9d08568e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 10:22:09.8328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0766


On 2025/5/27 17:34, Han Gao wrote:
> On Thu, May 15, 2025 at 9:33 AM Chen Wang <unicorn_wang@outlook.com> wrote:
>>
>> On 2025/5/14 23:15, Han Gao wrote:
>>> sg2042 support Zfh ISA extension [1].
>>>
>>> Link: https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1737721869472/%E7%8E%84%E9%93%81C910%E4%B8%8EC920R1S6%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C%28xrvm%29_20250124.pdf [1]
>>>
>>> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
>>> ---
>>>    arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 256 ++++++++++----------
>>>    1 file changed, 128 insertions(+), 128 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>> index f483f62ab0c4..8dd1a3c60bc4 100644
>>> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>> @@ -256,11 +256,11 @@ core3 {
>>>                cpu0: cpu@0 {
>>>                        compatible = "thead,c920", "riscv";
>>>                        device_type = "cpu";
>>> -                     riscv,isa = "rv64imafdc";
>>> +                     riscv,isa = "rv64imafdc_zfh";
>> Need not touch this. "riscv,isa" is deprecated and replaced by
>> "riscv,isa-base" & "riscv,isa-extensions".
>>
>> And only adding zfh for this looks a bit werid.
>>
>> Actually, I plan to remove "riscv,isa" later, so please don't touch this
>> from now on.
> I think that since the linux kernel is the upstream for devicetree, it
> cannot yet remove riscv, isa needs to maintain compatibility.

OK, maybe it's not good to remove "riscv,isa".

Can this patch not modify "riscv,isa", but only add something for 
"riscv,isa-extensions"?

Chen


>> Thanks,
>>
>> Chen
>>
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "ziccrse", "zicntr", "zicsr",
>>> -                                            "zifencei", "zihpm",
>>> +                                            "zifencei", "zihpm", "zfh",
>>>                                               "xtheadvector";
>>>                        thead,vlenb = <16>;
>>>                        reg = <0>;

[......]



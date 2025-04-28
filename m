Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2119.outbound.protection.outlook.com [40.107.241.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989AD4C91;
	Mon, 28 Apr 2025 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850707; cv=fail; b=gYloOQGxenS9i5bQJyBF1ZiCaXfdbt5jz4NHqqYNUTWDwLP/c7wAGOAFxvHhOH+CVSeMi3iSQ8sYtUzfbxURM0KvzYcQKqfZPDNEe9UWB6GU8B2LupC9RephPLRVAhD7TJpUaKEr6gV86Ou2MzHhGGBVXVfKBsbkEdwY+jWRB8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850707; c=relaxed/simple;
	bh=lgxpYW7CXw/+8ZAlcOzkA559dh+xj9Lt/1zISOlK/QY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pZoiRCKf9QDtnZgliNm/rlVtwZXZs3EACHVibfdfHrAG7qnWk5hcfduxJyK8BcgHGteCS/U7yIJEJFQTBtEuFBlMAWysFFiCdoSxGfEc/8Yv4lvmTJX15Ye1Rfz7lBtRtlnXu21sx+lby9iEiQfzoP5P/SXvlqwOX6nMWcM1AU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=sU3TZvJ/; arc=fail smtp.client-ip=40.107.241.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="sU3TZvJ/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjP7S2p4uihGhR83P2KLswAjRed+584p1kAqSYFsPGQiSEqfIOvSlj6GzZPGBpF5M2tQlUxKvQQt62nZe/Q/H7gZIj3/ZXJ9vBsrBojTCedrHAC2yy2uDas3gTwN8k9P5cknWXRKsjKkTQusQcMkFM54TDlBiR5Zx2OWG1DWb8RW6aQWxSJJfk+oyM9KivKYE928MubUZjXWQReZnJLIojPahc7AYUGLu+wJraICmSQbUKg2RCRqyVh0p4lYtbS/Qd+TMsm3PaOhGSMS/DmrKi4sBqZecWaaovs/V75dGRKVBENRcYaJPZD75xWDzC1PXvUCROS9lax236eiH8dsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WreVyyvzdwyRz8aZRh6sPUrZ2JqrKXfaJTjD47RXhDY=;
 b=FyJajo6cJ4AnErZ+IOyrS4bqGFgNvy5ujjGd3fnb+TPbNkixPYOJdYwZg7ELEODpn8UgImEhgUR1jtpvu3XxH0Cih/hWS2DLQ8l+vJYPHKVimnrG8YviTuySwrbnwfxHGyFpg3cGpX8Ysk1gUpCHsTfKvEl05kpQHimK9fPjzNe2MbpfxtCbaJ7Ojb9CWACMgSHuefLxGNkY4dYf6Ma0UQIr2xQl3Qc+m6JL/wRCbXc5GH4tEo/TjvHAL4eW5mVks2+daDM1IrGcOQElbSj31lM4aQYh77RjHxp2v8+GC/AuLyDD49sEYXOWkzgMWN/N3UTI2Pm+LbIe4rDGQA1X1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WreVyyvzdwyRz8aZRh6sPUrZ2JqrKXfaJTjD47RXhDY=;
 b=sU3TZvJ//70OP2ciNRdsZvhPudyrE2PiBpywUvLTlqClCXS7DZuNEsApPH8nPj2mbYDAEGn5VgFjdoHbcw3mhX+nqDXAulad0y2pqT0lAqoX/UWC9rv4zB42B8aKz1I8kzTtrWevUxMpwKmyMUcmbEIt51X84Wz4tViz/EN0ctpXpVaAAcjQjRQUdwBa5BKIqG2fmfvdBQbZcMRgyu9WSwt/UXrgQFeMgI9uQXHuvZ0KRdhoDQ0rB2Vxfqy5MayH3DoSMcmbZw+ndHTSvdaqYc84CMgHlb1rZIY5MJ5norkI5PuCZAJX86cfuzPNAmQ/PawLZ4LjNB7ijPCT8GyAWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by AM8P195MB0897.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 14:31:37 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 14:31:37 +0000
Message-ID: <000c1117-81d1-4a74-9d36-f83a2b0fedd3@phytec.de>
Date: Mon, 28 Apr 2025 17:31:33 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH 2/2] arm64: dts: freescale: Add PHYTEC
 phyBOARD-Nash-i.MX93 support
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
References: <20250425064107.174548-1-primoz.fiser@norik.com>
 <20250425064107.174548-2-primoz.fiser@norik.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20250425064107.174548-2-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MRXP264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::30) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|AM8P195MB0897:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce80267-fd5a-4909-2e7d-08dd866161d0
X-LD-Processed: e609157c-80e2-446d-9be3-9c99c2399d29,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFF6VS8zd0ttdEhvL1NMVldyR0h5dE9XWVZWY1hjMDFvd2crTzdrNnU0Szlv?=
 =?utf-8?B?UXlZNzNaUVBCTjF2a2cvZ21LRzBPMjIyL0N3dXFSYkxUelJkelo0dUxKTjZi?=
 =?utf-8?B?WGxrSGlOY1ZDeU44MHhSamtsekZrZWVUa2lIcmpyY21NckhLWHlrS1BZaUwy?=
 =?utf-8?B?MVNqK2ZOS0Q4anZiTGZyZ3BOek9lc24wbHhHSk9UQ0xzRHFlRmllVGF6QW9S?=
 =?utf-8?B?UU9PZitVMU15aWxuTWpUU3lPaHNiOTc2akFJdUFEM2JCUkhrNjFnYWwvTTky?=
 =?utf-8?B?eXg3NTE5NVlrNSttbGNlZDZuMnptL2lwOTZoeURxaHZ4Y0xYZzVnais1NU8z?=
 =?utf-8?B?cVc0UjRBMEx6OXRYbndWOGJvbW1SbVMwbEQ0T3k5NXh5eUVLOTVCd21GSHhB?=
 =?utf-8?B?MWd1Nkc4THNhNzZOeE1xcmJnbkRrZGJQU1lmMWUrM1FKY3ZHZXBCUWVTWXJr?=
 =?utf-8?B?cXdqdlcvTUNJYVNSS0U2a3BuRmluOG5lUlFGMUdaRmFRMFpYS21TNDJSMjlJ?=
 =?utf-8?B?U05nZTBlMjV2WStJUDAxWURRUEpVd01CUm9vYWpyR2dhNHhYbXJPVWVsWVNx?=
 =?utf-8?B?WklQK0wyc1F6MGdyN0V5TnowQ0JNcEE0SUhUTityS1JjZ1hTOEVVNmk0b29H?=
 =?utf-8?B?NWFjczEzM1ArbFpJOEJrMTk2Y1JSdGpsT01CMWR2c2lXWjRibHE4TlFtckRZ?=
 =?utf-8?B?OG5tNjNkYnBienpWT0NraWRFdUxwQ1p4NEZiUnRZdzFNTjlhMHJCaFhreS8y?=
 =?utf-8?B?YnhtMi9sdmZ2VEZ2aVpiV2o0eG9zWTZ2R25QZ3FKQ2s2K3hpY3h4V0E5c1gv?=
 =?utf-8?B?V0RYbUFJU0pRVVVjY1pubzR1QklCdFdYTGQweXRoalBNZzBvYklDbEIzY0Jq?=
 =?utf-8?B?cUg3ZWxlQkdvRERRZWJHRkVZaWZhNjdrY2VMYWRidWFIMWdWMDRFdTFwakR5?=
 =?utf-8?B?UGp4d1pHREw5RnllVUthRUg2WEhFWVZ5citUZ0JybWZiTUFWZFUvWVRvME9u?=
 =?utf-8?B?ako2YkxYRTI2L1U2aFRzUU5WTUdrK2xSV0ZxRWZ3MHh2QWZ0Um10MDlndzVn?=
 =?utf-8?B?bkd5TVRGUnBPZzJCb3hack9XQkVHK1poclBiVDBZRUhYRHdObHZDdm5Wdzgw?=
 =?utf-8?B?bjZFa1pDWE50VTlpVFlIcTJXYzZqbUVnQ3BhNnA1QXA1NXN0ZUQzcVgrdUZo?=
 =?utf-8?B?RGdGdlA2YzB0M015TVFONTBEREhPVFJiaXBDNGxqOUVsaElOekZrQXM2Ry9S?=
 =?utf-8?B?L3pLUzB3ZHpUc1MvMTRMS2htVGZSOGlLaXcxOTZiM1Zka0JKejJ5eVptaEpS?=
 =?utf-8?B?WjJiNUdkZ2FZOHJaOTJXVWw0SGhJOTJ2NzhxMERyeVlpUEIvaUV4RTlGM2Vp?=
 =?utf-8?B?OU5KaU1QWVZ1cUlDUDV3VHRXcDYrbldpci9TVTJRYkJVMlhVWklPa25MVmMy?=
 =?utf-8?B?MVhnZ3piNDZoOWVwYnN4UjB1MjA4YnBQWnVtbTRLTHo2Mm5YNmFBd1BUZFhF?=
 =?utf-8?B?Nlg3OS84d1hhb0FDc2xqVnZTUm1yalB6V1ZpTDhvQWRMMWM0Y2kvUDAvdGF6?=
 =?utf-8?B?cDNuQVp0Ty9TOXcxU1c0ZVpsVGZab2JsYmI0MSsvdzhlVkExb1ErYWd1MEt0?=
 =?utf-8?B?NzdwYjY5V1BsQXVNekZMQlNENVNjdFlZNWQrVC8xQkIxa1JaQzFBSk15V2FC?=
 =?utf-8?B?TDl6cjFldEtPRFR4K1o1bGJQWlVkZGNmeEFjbGtEeTVrejRQUWlRdjRGQUQy?=
 =?utf-8?B?bFhKamE3VCt2VW9QWithdGhvZ0NpcXRGUDJnd20xUDkxcEpiSW9EMk9LTEZF?=
 =?utf-8?B?UWJQUTMvQjhMNTR4ZTI1K2N0K1FLelcyRTZFRi9IZFdJV2xrdit6ZDR6bG45?=
 =?utf-8?Q?2EvyBeLy9E5Du?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVJjN3ZGU2tQOS9PcHdudEdQSldkN1NtWWY4ai9wVklTVUNXTVh1bVVGNXV4?=
 =?utf-8?B?QWZEMlR2YmthYTdZWG56djJrL2tVRUxpaklZenI0Y0JoL2ltd0tPamovSFA1?=
 =?utf-8?B?Tmsvbk9hbkROUjJzdi9Jc2dmU2NiMnNhSDdWWmNOZ0ErSVlmVklWOTNKakth?=
 =?utf-8?B?UUo2TU4vNnhoWmhTenNZem1QTW0yU0lFMDFFSnVOWmR4bUt6b0dlVkp6OXdm?=
 =?utf-8?B?bHcyRGFrZ0dxbGVrNGk2OXlEZiswa1IxcUx2THkzNUhJUXQ5QjluZmVtakVh?=
 =?utf-8?B?QlNCRVhPK0tuNGhSMFo5RnpWOGVXTG90TzJ5dzhYbDNxNkdWV29nOHgrRUlO?=
 =?utf-8?B?VlBEL2VuQUk2c1h3RnNwRndxMGoyUW1ka2dJYzVTRFhqQ0F6WWh2Vzc2cGdi?=
 =?utf-8?B?eDVXMkFRMjZNWlpPMjFqZGx1NE1mdnY3bUZtTDdHYnY4K01ZWGZqMlgxbnh6?=
 =?utf-8?B?QWwxYWFMS3dOQVRNTnFVTzJyNmFMd3hMYnN0bkY3ODlxeG9BS1dUNzFnSjBs?=
 =?utf-8?B?WFRVdkxoellhQkEyc0R3dWJ5bGRPTGhUbUd0UnNMTC9pd2tGT2c5Tlcrd3lO?=
 =?utf-8?B?YW9uWldDWWFSSmhwZGE0K1R2R3prbWR0OTBBSmR2RWxCb2xwWHJ1UDc0VjVO?=
 =?utf-8?B?ZXE0M2twZ091VERCdEYyVEhNOUlOWTc5TkZSV2V6TUJKTEhQWnMzNTQ5LzZD?=
 =?utf-8?B?VnVONXJhR1JpcWFERkRDUFZCNDJuMnNZeWh2QUxvTlJabHFUWlc5NWlMK3Zy?=
 =?utf-8?B?NUJZenArVnYyUmZWaHdqQ0JYa2J2aHA3djF5cC8xTVJRR2g2dzNjZTVWUzB2?=
 =?utf-8?B?WkpCN3BLUXZzR3BSdGZkc3hoanJMRm0rQUdqSTRZYnlNTU1qcFVjcCt5bCtT?=
 =?utf-8?B?Rk5TQTNTQ0MzNHZLeXZObTlTNndWUTZPVWNSd2Y2TWRWZnE0N3F6TC9WRWNO?=
 =?utf-8?B?ZHpxelBmM1p3aFNhL1RMNkdvZXFKaTVmMHM2MGlVb3NnWTZ0bWtTYVlGVEUr?=
 =?utf-8?B?THVBcGFOV1oxYThOYndNVVNkTjFHNHZ3NlhVVlB6clBteU1JaXpJN2VjNFpV?=
 =?utf-8?B?MWxrM3Y5aEY5ZXNZMHRFRW9JU1R0YzI0blVXdUFJOGI4UVpCamovbU1CcWt3?=
 =?utf-8?B?a1pDT2FSNjBwZWlqL0dNK0J0eU5VT0gyKzhaS3BZSXljcE1RRUtsODNWc281?=
 =?utf-8?B?amM3dzFkZ3dYQzU4b1VPWHB1LzlWc2tHcnEwdE5TbC94ZllUSmhZU2h6Mjg2?=
 =?utf-8?B?VXlIVTVDWGxHaUx3ZWt6VzIyL21kb1ZMUXlabXBGNWl5RE9EM3BUS1FQVmZk?=
 =?utf-8?B?TEZtMmpFVThUb2pON0NxSUtCRHYrKzdqaFV2V0E2ZW1la1ZRS2xFaE0xSlVu?=
 =?utf-8?B?SHBzSUNRMlNRZFhQTnpXNld1elhqWU0vWnlVSmdaU1YyMmpOMUVNUTE3NDJ6?=
 =?utf-8?B?UXo2eWdRYWM5djlCRkNGSkVxN3B2RTg0WUdZR2o3WUlTVHBwUEtOblljRXBK?=
 =?utf-8?B?UTcvOGJ2azJBdWNvdmU5Y1NPL09iRld3L1pzSUp6OW5yVTh5cGxUdldxZnM3?=
 =?utf-8?B?OThYNkdnNmFFNm1OWnVXTHMyN256RThQMWdiSkVVU1k3K1MrOGN0WDkxSDEy?=
 =?utf-8?B?M3JGYWVjWnhsV21lRXVOZ0lzM09WOG5SQnlMQWhZSE9HUGVkVWhXTjI2SVdu?=
 =?utf-8?B?aVdaYU1zdHBFeFFwSHBMcGVzNGVKMnpyOFpSV2pTNXU4OGhaTjVQSXFDd0tF?=
 =?utf-8?B?NEVTMlVxMUUwM01leDlBL3BxZ1FlYjY1WEQrdGxMODBBT2ZZdEdVb015WlE1?=
 =?utf-8?B?aEVDNFJJVjlmbG54VHN5Nnc4b281YUdZVHdlbnM2QnBGRFJoUlhuOE1sVk1N?=
 =?utf-8?B?aE1KcmJrR0JrNDhYaUdFblIvL2plU0RFalVvaEdvL1BJd0hXN1hpd0lOZGNj?=
 =?utf-8?B?ZTQ4L21zSXp0MUNCMWdwRmNoUDgvSVY3bERtSThiL2lneENzMHBLWjRCTWNz?=
 =?utf-8?B?amk4MlNSVUFPUmI2U2RNN3JYai84OERKYTVrQi85Z1dZcDd2TTliS2pPYzEv?=
 =?utf-8?B?anR2QmFmeXB3TU94dlNrU2VCcExkY2VOSlptT1E2Z2h0Z3EydEVlRHNkWjJE?=
 =?utf-8?Q?n44SI3+edC5t+Q7E+5+BJdZvA?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce80267-fd5a-4909-2e7d-08dd866161d0
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 14:31:36.9339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVxbSrtDSoNGGK3jyruJcCqVD7ZqVjuXfJ/6peXu33NgOTCEFyocdGojHzhFcbajNQQkJ5vOZXnxP/3k6C7H4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB0897

Hi Primoz,

a few of the node references you are adding are out of alphabetical order.

Am 25.04.25 um 09:41 schrieb Primoz Fiser:
> Add initial support for PHYTEC phyBOARD-Nash-i.MX93 board [1] based on
> the PHYTEC phyCORE-i.MX93 SoM (System-on-Module) [2].
> 
> Supported board features:
>   * ADC
>   * CAN
>   * Ethernet 2x
>   * EEPROM
>   * eMMC
>   * Heartbeat LED
>   * RTC

eMMC and Hearbeat LED are not board features but SoM features.

>   * RS-232/RS-485
>   * SD-card
>   * TPM 2.0
>   * USB
> 
> For more details see the product pages for the development kit and the
> SoM:
> 
> [1] https://www.phytec.eu/en/produkte/development-kits/phyboard-nash/
> [2] https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-91-93/
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

With that changed,

Reviewed-by: Wadim Egorov <w.egorov@phytec.de>


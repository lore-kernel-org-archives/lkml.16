Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D36207669;
	Thu, 19 Jun 2025 07:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319313; cv=fail; b=gwqzHcPjBAB4CUt6HIzS7T4htzecPAHgTH3lXOHMIpp0HCyNZNaooBQ2KGWFoG/zS4wZNHy2x3rFajs8bdqgqdfMqRZGI3YC87yCpbJ3WnSSLfTV8g4fr196qu10cHyb+y/Usd2LLugCIkCXK3kC1f3YfdobscRdzWk9x4r3FSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319313; c=relaxed/simple;
	bh=mKMb4Q0h3gjYxBWi3Fyt4nndgdfJbAghZnSBwchf03I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LSV3/jmBHsbbdkFSGV6W0JqZkP1tichURU9fHEeq+2tqFGIGy6dK0VZwlPJT7EauhrposxdUNWcEXiQR4CbpL4kTceAZCWnuopDTEHyfK8tZZhke9Y/4tahjKtyVQnk/gxca4FJszCfqcCC/bqJpJChti4udzjZIrKu/pdWV1i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wOzIQUUo; arc=fail smtp.client-ip=52.101.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wOzIQUUo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8tCMsmxEkOok2JUN3XZUcfWdUpDWXdsMZhc9kDgZTnYibXNByjRi/o8l51opI8QmL5aF4CzCZ5Z17gTvaHA/d1USX7ADDjWzFaIMjy1ny2mTPjrd+MeG0Qojja4j9l4ND0huXRnC3t5tCTG9R4DFa8Z75aNOyvIv6oHty5YyDDSWIhB+n2q4NSEe/X5tvCGckd4Zf7r74anXLOdjEXSKkTm532GqQ1wG+pW/AJEalAuWptPEYlwMiIbyv+RdhU16iwdmovxjRiNfBwQ+yiO5g1T2MOgB1YgxYrt4bmNm0a+QzoX9u3pk+2vDeDXR7K5LyrzeF2x0fCrQo2R7ie+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqBhcbWs2kfb/LLU2hAQ1ooRnErZYnXp8Oln8+DlFfM=;
 b=MC5sCvpjvYHlQEdz/BZ5ujO2yAVdTROl0zokzbyLevvm2j4ch7IeIuamPEtOyMcKazAbWVAOpgzBLuWG5M8j+w5NXI2PvZIwpV3WHyE5NNYk8GEHxa7EJwN7I8qAuW9gagXfZM7Vh+JfUiFCMDcJrqBGbD5B7MDAOhCAXdllQq4a4vH+xt3OpYC/zwkXbCQuzH3QhUUQBsoION4r18xYRx0Z3zHtEDpiIWnyDLmaayJhZ6RPsFTB/iZNLrXbRkhMahUas5mIDtHqDMblfj8n2u/JVNRVSVxOOX+gY7GJwxrMjpk/P4MCr1qjNd/9Imz0Sgb4Mh/+XD+aA6jxLK2FZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqBhcbWs2kfb/LLU2hAQ1ooRnErZYnXp8Oln8+DlFfM=;
 b=wOzIQUUoZue0+NEIR456isReh/bFMx8tQUPjb9jWg/gVZyh3vFfFELb/zrd3ycbxRSTplp+a90c62ewd9ssYdfN2WoiodFFNfXngauJW7CNl+gVRRXpNEZTSIsfaXuX6OyUmCXhP0ZvtO+dMWv+GbF0pNvVyUGatcDe/4gsTpE2TbRDx3VMAa6dTeEzcMu2ksoCvDQy97RylLZlNeAPJD0e199/5SoToH4RZHDR8Pq3uHdsORqpW589xsYAPJFDY6j26W37LbjhmLNFwm1Cf1/6qPq89hMSSCRW5TuR6BYWfdqLacZGbq6qyl1if7yJ7a3NF0CF91NNKOCt7YuzD/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10625.eurprd04.prod.outlook.com (2603:10a6:102:48a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 07:48:26 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 07:48:26 +0000
Message-ID: <c76db444-a057-489d-a712-06e5553f28b6@oss.nxp.com>
Date: Thu, 19 Jun 2025 10:48:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: s32g: add RTC node
To: Matthias Brugger <mbrugger@suse.com>, Chester Lin
 <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
References: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
 <7f986e07-69b5-48fc-89f1-8ae37b998faa@suse.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <7f986e07-69b5-48fc-89f1-8ae37b998faa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB10625:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0f8a51-f134-4571-2604-08ddaf05ac93
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aW80bXQ0SVZ1eExsYkNKUEdKd0VRTXFRaUZIbGFRTzZ2ejJacGdjWE4xUDJi?=
 =?utf-8?B?WHg0RTQ2cUoxK2x6TVRwWDUxWnFLZE9aZVdBWGMxN0NobHJ6WmkvQWpXL3gx?=
 =?utf-8?B?aC9mS25zVklOT21PNWFjeE1NSC9KYzI5QlVUYUt1cEo5bHV0S3QxdWZCRDU0?=
 =?utf-8?B?N0VQTHVyVVRFNjlvZXFpelVJWlhoS1dxNjE5V0NjTUl1bzkvWm1rZGJaTzBH?=
 =?utf-8?B?M05YcVJsSzA2bm1zbGVqTkVhRU9iT3g1bGNqZnNXcE0wNFRtdlJhc3plZ0x1?=
 =?utf-8?B?cUl1QnE4Zmxid1Rud0hzMkdvT3NyOGxML1dOZXZhMFl6SHdDMjVXSWQzOXdj?=
 =?utf-8?B?d3dQVUJKbjc1QmVjTjh6TzNxSkJva25uU1NLcm1PMUdPTVNrQkRUaU5SRHpL?=
 =?utf-8?B?NnMvVlk0Und0dENrL09KNWdXREF5Y1Y4UXJXZkZna29RU1ZhWXZOOTUwZkU1?=
 =?utf-8?B?bmROclhqbGZpdGJzSzhDenB0K0FUUkJVSStsZ2FGcEl4cjBHTUU3VnZRMFpj?=
 =?utf-8?B?bTBxS2dnY2p0ZmJvL1dXQWlRY1U2a1B0Z0pvZzZKSU0yZzBoOUt5NUZHc0Z5?=
 =?utf-8?B?S05OZVpmd1Y0MkQvTDBKNlFSNngzbUlOWFVxT1BwT3B4N1JpRGxWYVlwQ3ZX?=
 =?utf-8?B?eDVKTU1mQzlpbkpJWWRiaGlkQkhqTnBwNXFtQ0F1eXZNdkRaVlB1UEt5Q3ha?=
 =?utf-8?B?REhod3BuMEJ6dWFZTkYydGZsQmNzRXBVZnIvbFhJZERzZWk2cDltNEtZRHFq?=
 =?utf-8?B?T05HNDBCZGMzc3h1ekpqenhqSjZ4eVlzOU9tU2hCVVZzbWZUQlRJRmIxbUli?=
 =?utf-8?B?Mi9VcTZxQVFNaXJnamRXdVFMRVBqd0NKL0ZQZkxyRGJER3ZKTERNUm0zSUdB?=
 =?utf-8?B?c0hSK1NqdGhSd2hWVUpjeEtCN0RSUUNUQnJYbklsVWljRG1qeFNKcmQ3S3hx?=
 =?utf-8?B?NnZUczBsZzhOZ1hTeWNVN1ZxRG5mZ0Z0aUhad1pQa0ZTVW5CNWxXZVdhNzh3?=
 =?utf-8?B?dlZZVkI2R3crQkVJSS9GV2RmUEFDUEh5SWRwNDhuRjhlNysvSkg0YTdQQ2k2?=
 =?utf-8?B?VGgwOU1DYTcydnNrWnpWbmxNaUgycXg5LzQ1cTRBQkxkLzVtY05XR2dNR0ZP?=
 =?utf-8?B?VE9pL1lEdXU0N3BWR2NjYkNPQ3FLTVk1b29Nd0hrVGdIcDJiOVo1RTdQaGt5?=
 =?utf-8?B?V2JwZjR0cTNIN1VUT3czays0eFFEYzkxTk9IUFJRWDJMc1NhalpyUEY3L3NL?=
 =?utf-8?B?NEN4dnhpRFRib0MvNmhQVHd2b0VTajZGeEhJNFh1TWlCbzJpNHlWTE1yV0pm?=
 =?utf-8?B?UVBuM1F6WmpEa2V0LzM5YU9vdWx2TDdtOTFOSy9ScDIxMDg3bHlDUFpyUjdQ?=
 =?utf-8?B?RjlmM2thT2pUUzlkYXl1UmVBVDhFQitUVEQvMzdBYVc4THNBMWhBRXF0WU01?=
 =?utf-8?B?ekZ3QU1VVWZKRUJINEFFUFd4NVoyMUhLRjdmT0dUNWRVbmt4RjI5VXJCbkNi?=
 =?utf-8?B?a1ByTEU4dFVRZzl6cDRERlM5Vld0NEZYb0FxMDZnVUtDMFlVSm9xOVpXRTR4?=
 =?utf-8?B?Q3ZDanJOZmlaUml5dTdiUHczN1VBV2JDbTNNOUtsWlhpRzNuK2JueHBoZFdz?=
 =?utf-8?B?RHhwK3d0T2Q4OCt3Sm5QdGNnOVVhWXpXNVU4RjBwT2s5SWtBY1NpSHZ4WHNJ?=
 =?utf-8?B?SGl4VUVXQ1JybWYybEVEc2NwZHlGREVpUldoNzVSbXNzK2JNZFA2ems3aVo5?=
 =?utf-8?B?cU0vYXFZNDFVM1NvbE1JOWZUemliYjNmT3FFc3d5eFQ2SzY5MnRqL0dTMkFy?=
 =?utf-8?B?RUdIZXUrOXhjQksza0NzQW8zSXNwb1VxZCt5L1NVQnRpTHRpTlhaR0RWQ2hF?=
 =?utf-8?B?SHlwU1d2c1doUU9jNUdYNnNWWkk2VFl6RkoyKzVxUUg3MzM1WDl5S3U2MjJO?=
 =?utf-8?Q?whH1uxat6HE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHphTzJmSm5zZ004MVY2aTdjOXZXRUY5SDVlZDUzaVFBY1hvdlVteUV0TWdz?=
 =?utf-8?B?NDZsdlVYT25XVktsSTJDRi9oZm5UeFRPSStpdDFzMG1LQzY0ZEFwN3NvcHRJ?=
 =?utf-8?B?dHUyMEdaa0w3SXYwUnJabjd2Q0ZySG1jamR4c2V4U2lkenBxeDNvTEIxbUdM?=
 =?utf-8?B?S1FDcnBsMHlSNUJteUFseXlPVjUvYW1KYjBlVXd2dENrcmp5RG9EbFlyTlNl?=
 =?utf-8?B?YVUra2ZicktoY3I1ZVhvUUNVU3c5QjFlTGkxRVMyWGlmQnB1WVhIV3F6WlNR?=
 =?utf-8?B?d3VlZmlDZ1lPeXpqK056dVhDeUt4Q2VaajhPUitlekxUSFJWWkI4NXRtTFRC?=
 =?utf-8?B?VXM5ZTVBQkFUTzc3eGNDVlhndzlhRTR4R3kxcWRpV1QyWVhnYTl4NXMycjB0?=
 =?utf-8?B?blZsbkMyOUlla0pIR0hEMElnTjZHZ05YYmtNZFUxSmRNUHFoZkJ6aHMvSVcr?=
 =?utf-8?B?bEM0eFJxZHVsT3dLOG9OY0ZsalZpNnpMYjUrcVp2STY4YXZ0TSt0ZGZnTHFk?=
 =?utf-8?B?ZG96WDFpVm41YXd0eDQzOXo1T2s5Nzc1eDBDTVF3bGVXa2ZadjRiT0NWd1Vl?=
 =?utf-8?B?aldaU2NuOGpRWDM4cHBEOUgvV3c5SUk0VmNSOEtyY2FqYllaREQ3TG5pM2ti?=
 =?utf-8?B?cXBqRlNHRmRTQzFReGZVWFhpZFh3TVZ3Q1R4M2pSV1NEU0lTbDJwYldNanpU?=
 =?utf-8?B?Wk9wQ3pIZWw0OXZySmdKeDRDSUtSeER2VlZqa0Q5eGp6enNoOE5LN0xsa1Nk?=
 =?utf-8?B?N2U4QjVGbmNPbXViZTdHT3NKbDRzMjhRMjYrNDJZTU96dGxwUDFreE9wYjdq?=
 =?utf-8?B?elZyaENRL2pYQkhNUmhkZVJDV3ZXaWdVaUhwcFJ1QTJKelJLdkNDUkhlTjlL?=
 =?utf-8?B?WVVnRkVvWDIvcG02UVZFeStRN1J6UWZxQmNid0dKcUgxcU4yYWJHeExYaTho?=
 =?utf-8?B?dW0vZ1NEMmxhN3Ivek9QM25BNG1ORmROTmc2c3o0Q1hNMmhXN01qNUQwTHBa?=
 =?utf-8?B?QW5aNXZ5MHpXTkFaaDRzRHVXemh5UXVPYXgyakVIRk02OUI2T3ltZFhNdVF0?=
 =?utf-8?B?cGxqU3BHV2YrQWRXSjhQM25oejJLT1ZkMmlyVVIycDhrTUorSXVJelN6VVhF?=
 =?utf-8?B?L2V3d0JUc05hang1MExpc21UeVh1WkRUOUNPS3ZJVWxKd3VhQ1ZSSmV4UVRJ?=
 =?utf-8?B?WmhudzY3NkZCWVBMb29mTzI3N0J0aGhadEt0OFhNRldEZmx4M295VWlpNVFC?=
 =?utf-8?B?c2M2bzFNOVA4YVJiSXRsTlBMU0hDZmZhVnlXcjhwOFFQakoxd080NktGRXU1?=
 =?utf-8?B?aW9YWUJDUHJCaGRJYlh3OVcrTUlKV2NIMWVwa0JydzFCM05vVXpIcmFzdGQw?=
 =?utf-8?B?YVRheGpIVGpJVUhJQlV1REdyYVZWLy9qRWNnWlN6NktsaVN1TnE4ZS8vMHo5?=
 =?utf-8?B?cnIvaDBVZnEvUHhRMmNFb0dXNlNvTDNIcElLQkJVV294SnhMcjBEcFlVYlhD?=
 =?utf-8?B?SWp0YTlRdTFiNzE0RGFwd1pKMWo2bk5tdURTaWxsMER4WnV5L3MvKzcwUE1l?=
 =?utf-8?B?aFJmWi9YN1ZYRFJLd25uRFI4Z3RiSHFWZzNEbWFJMFpVUjczOUpyZ1VXVStF?=
 =?utf-8?B?S0kwYm5qWmRCRlVkYVZyU0kxQmFOUkVGNFZMYkEzSVFyNFVQVHhSeldYTDB4?=
 =?utf-8?B?TTlGREJjZWtBTnI2TlJROG1hSUJNUWJiK0ZSVGRzb1BiTHJEYXo2T2xXNE5B?=
 =?utf-8?B?dWRwZ3BHWU9IKzAvODZiWWtkbEtkSy83cTlBQnAvQWpDT25LY3F6cWhUUlBJ?=
 =?utf-8?B?ekNRaTRoYXdXSkx3WCtyNjNXM3B3Slcza056RFhqTDFoQ3FYdXpMV05RRUFQ?=
 =?utf-8?B?Yzlqc3g1RTVralZUQTVmbTBxd2N5WU5PUExMWmZVN0pvRnBqYzJwR3U2d053?=
 =?utf-8?B?WUY1NjFKYk1aSWwyUmFSQXA4VUl2LzJVdlB5dlBNQzVEeldTRlA1dC9nQlhj?=
 =?utf-8?B?QjZmNXdIZlRiMWVpTk8rdUFkV200NnljTnIyR2xKYWNtMENndzU5TlNrWndw?=
 =?utf-8?B?ZG5NUERoRFZ1dmlqQXdWRXprY0FjTGtNcHJVN0x1R0xCM1ZHdnF5cGw0eDJJ?=
 =?utf-8?B?eHlCS2hEeTluSHR2dU9iclR3RDdOcy9ya0lESlQ0VjVsdndBY2JLZUFvQ2FP?=
 =?utf-8?Q?e+C4Wd6Zo023VDdOlefH1JY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0f8a51-f134-4571-2604-08ddaf05ac93
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:48:26.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9FWFnXBFeqHe+v5h7wPBDSP/zEqHWC3u/y9N/nl8DysFMth7RU02eMtQHlK5fhgegrkOJCWl6grbufnvZeIcQAhkJzhqgLixQ99ud3OQgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10625

On 5/26/2025 9:20 PM, Matthias Brugger wrote:
> 
> 
> On 26/05/2025 18:21, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> The RTC module on S32G2/S32G3 based SoCs is used as a wakeup source from
>> system suspend.
>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> 

Hello Shawn,

Sorry for bothering. Can you please provide feedback with respect to the 
status of this S32G2/S32G3 DTS patch ?

Regards,
Ciprian

>> ---
>>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
>>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 9 +++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/ 
>> boot/dts/freescale/s32g2.dtsi
>> index fa054bfe7d5c..39d12422e3f3 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> @@ -114,6 +114,14 @@ soc@0 {
>>           #size-cells = <1>;
>>           ranges = <0 0 0 0x80000000>;
>> +        rtc0: rtc@40060000 {
>> +            compatible = "nxp,s32g2-rtc";
>> +            reg = <0x40060000 0x1000>;
>> +            interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clks 54>, <&clks 55>;
>> +            clock-names = "ipg", "source0";
>> +        };
>> +
>>           pinctrl: pinctrl@4009c240 {
>>               compatible = "nxp,s32g2-siul2-pinctrl";
>>                   /* MSCR0-MSCR101 registers on siul2_0 */
>> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/ 
>> boot/dts/freescale/s32g3.dtsi
>> index b4226a9143c8..e71b80e048dc 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> @@ -171,6 +171,15 @@ soc@0 {
>>           #size-cells = <1>;
>>           ranges = <0 0 0 0x80000000>;
>> +        rtc0: rtc@40060000 {
>> +            compatible = "nxp,s32g3-rtc",
>> +                     "nxp,s32g2-rtc";
>> +            reg = <0x40060000 0x1000>;
>> +            interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clks 54>, <&clks 55>;
>> +            clock-names = "ipg", "source0";
>> +        };
>> +
>>           pinctrl: pinctrl@4009c240 {
>>               compatible = "nxp,s32g2-siul2-pinctrl";
>>                   /* MSCR0-MSCR101 registers on siul2_0 */


Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE732153EA;
	Tue, 17 Jun 2025 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157111; cv=fail; b=Gt3Ui5W2egNGRzXnI6JGhxUOTX2VelSZESM5sh3wj83+Nh5Lje6P4dtNCiY43SKGoGksjpCNEiDxX/QqTvk5F7QDpyhJ5Uz+oNKib7l3Phjpzb6n5+81E4+rniwB3FCSEuIsFAFcS1PclHxwHjrEVFjKXPdG6DeCwm1C6uzwboY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157111; c=relaxed/simple;
	bh=GQRg4wg+M0PIY7z1CUgJpra4RtUo9GdiHEjGckYFLJ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eiY/wkh4r/8uUPkv0Y+DUueYcvpM/N+gkog3gx0MQuXjr6dTUMRYbQFQQuc9mdMH+nieK4RjhHf+FlfdXx7ZruCAeZIZhXLkKInNFQVasna2yzqdBRGAhLKOn+jToVcRzHnw+dtQrXKJEX+Q6udIKZd1qJ/i3dhjRCU3fcTKgl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=mJe9FZLq; arc=fail smtp.client-ip=52.101.69.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="mJe9FZLq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgT4WZlY7o2MOUNSPjoGm2vga91n7YJzOZBlQ0Asmy6GbzasIj7HtWam0nl1rdxQZjrUn6RfsVDlxRQ0ANwDElzzidm0toVm6VwT0Kj2YL9afKgBvWsA29ZfV7Bo+xyEl2txGdVfMcMUsT32jc9+jjILddWF5Iv4vfcsMQ0mWReZDmU5V5Rr0ofcuSjiHwudP536vADelsJh3ZcQcOd130rZr4Sar+vHp69gO9FnMArvXbGhpdyjcdlKeUiKr62V6q1VUJh8hOoEOulmmq6w5WBDoMrQkzfhO4nLkzfdLOvTTFlw7LvMWFpvM5vARmtf7CWMJjusJYK7duHUXfusag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FvF8i9yKEknCnp1R7BpME3Jh492GiB1OufY4hWd4ng=;
 b=KYjA2GLFW2pm94As0HorUHImfSYB+0ulRQiTgFXTfdlVJJrE0YDIT9Bc49WDEaJI8ATUetgNrBZyhmGLXhElQPgfXKy08OjBuYdz1wJ+bQF5TJL+feiupqHM1y1KwMKO72h5dQ8rVsAp3gfIjGOR3GJ9V6Ce5OpMfyXFlzyhyy1gyAnxgXKMdcr49Gy5J54Ju/uorI2MZK10zCET+uUv6jogT1fZ1Y3UItsGVFL1SioknNkMf48P47aa+gXINz/RCNHh3d/MSEfjGC7XeKx5zSC9jNM9N8I8/YtjyfGWFq6py31aMTIB6TFC9QkQoake5QP30NVOPXVqn3CRAVaMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FvF8i9yKEknCnp1R7BpME3Jh492GiB1OufY4hWd4ng=;
 b=mJe9FZLqYxkIwSPl9li5PPX5Nie/9KMyr5VND02cI7uMAkMxqKl3hJVchidFPUNr443vD7bTUD954aeHzMDF4ZGLqCWqGGHnuzz6e9SBAReARU/n6whAsxEQxEFXGPJ76+AUM3sFxZwcC/MZ7KWQvN62v3ey+J8s0EeJkr9FbCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10909.eurprd04.prod.outlook.com (2603:10a6:10:587::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:45:03 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:45:02 +0000
Message-ID: <d262b45a-c0ed-4eff-86c6-e8bcfc005ddb@cherry.de>
Date: Tue, 17 Jun 2025 12:45:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
 <20250605-rk8xx-rst-fun-v2-1-143d190596dd@cherry.de>
 <20250617-small-vivacious-labrador-7f0eb0@kuoka>
 <b079fc14-8692-4521-bd81-fe2fca713f2f@cherry.de>
 <704d75df-a484-4da3-9bcb-85b480e2ecf0@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <704d75df-a484-4da3-9bcb-85b480e2ecf0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10909:EE_
X-MS-Office365-Filtering-Correlation-Id: b31171f7-9cc9-4280-c894-08ddad8c0327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUxpQ3k4aVVJTWhiRDJ3dlBBczR0bjVyZ1Q2Q0NoUWg2RlFRcnh6aWlHV0Yr?=
 =?utf-8?B?dHRDbDlKTFR6ZDBOZFh1bS96RmFxd1IwWGxGSGR6RHNTdjRsbE9Ja0F5NHNa?=
 =?utf-8?B?TjNFME1hRXdqTTZzemJNc1d5aW8rVHpIZUs2ZXN5cnhESitKY2VpcVNOZk5r?=
 =?utf-8?B?QU1sendmbzJtWWN3WHZmeVRncHMwMFlIaUZpK2YzVExJUHMrU0hHcUJOV2NN?=
 =?utf-8?B?RVpSTEkyaG5XeHhRc292Q1IwTG9jbDUvKzVLbUJGbGZEU3ZNRC9QNFFtbjRB?=
 =?utf-8?B?aEhTRTlqcnlUWU5USjZmdUdINVl2cVdXSldwR0JKanAzdy9vQVpLU1BUUUJS?=
 =?utf-8?B?bHZhMnp3Wm5HUlFnT3JjL3R1L29rdE9BWGhlcGkvQ0ovclVCSmFTM2h4UHFI?=
 =?utf-8?B?Ull6M0Z5VWlNcENtWVo3ZStYeW9UUWd2QVZFc2lKclp1OTJENXhoV1cxVEZ5?=
 =?utf-8?B?Ukk3MXM5NFlvTTBueXJRL0tJOFFnRDBWSjNka084ZlVNUzNIb2IzcEt5TDR6?=
 =?utf-8?B?NEZkQ05vL1VhZ3A3VDd1ajdmMUJBRjdrMFRnbTlSdytSKzF5VzNiVG9GWVRC?=
 =?utf-8?B?UkttcVdKOHk1V3A3cGZkdktqVm1yL0RUcHBDV21XZ3ozRmhUSk1GdHZGVHJR?=
 =?utf-8?B?Q0RSVVcrelFBdGZkbWxMOVZMK1pSMTNUTW5USGIrM0VaUXJYQ3F5OWpJUnNp?=
 =?utf-8?B?YktBaHRCU1RuK1EvN2xaYUN1Rms1UG5EbklSK1FiRWJjdnFidUlIVUFwVE1E?=
 =?utf-8?B?dVF3L2luRXlYYWY5L1JFSlhjYjhZZkN2VklsY2VjcGlJN0RhUDAwVjFYQkRK?=
 =?utf-8?B?M0VKYWJFaFUzR2J0aTh1d1BGNDBYS0JsTVkzZFFEV0tuQ2ZRU1BUVDRFRmds?=
 =?utf-8?B?S2xaT0lIcm9pdzk3eWxvbE9JQ3VST1dRRm04dkJXby80L2FwWXA5K1IwSFBL?=
 =?utf-8?B?L21sWDBpQ1VWN2pxUm1LN0NJU0I3a1JSRFpjRSsyZitZRXBLYUxGVWUvTk1T?=
 =?utf-8?B?d3ZhK1ZiTFgreVZJMzZjTExIUFVYWFNhbktaWTNHbEorOGdwK0NmYXFTbGN3?=
 =?utf-8?B?SCtjK1JkaTZZRi9udjdaZEk1MmJXdWJjSkVwZVpTV2VUdTV1TStlblJHWDZN?=
 =?utf-8?B?V2p3MjJ2cGVJUVZlZ2dTSXdEejVPWE1vRUh5dkc4QytVVnZ6MUZvN0ZDbEdF?=
 =?utf-8?B?VnFpcnpwWDc3SlcrZFZWaVpGN05wQmxrK0UwZG5Jcy9SU3FTN1hWTytZa0h2?=
 =?utf-8?B?WDNIUXNTTkdqTDNtWGpUb212UXZrYmMzM28wbW5qTU45VGNVSE9YTUdObmw4?=
 =?utf-8?B?N1Bpb1ZwYUpRdE80QTFPZ1N4VUIwd1NUMFBSRlNPMUl6QlBOZXFra2FvMzRu?=
 =?utf-8?B?bE9na0pnaUpBVTJWOWtoRkhOYWpNOHBGWjd3YmxPL0kyM0VXM2NvZGFYVG5q?=
 =?utf-8?B?WjJLdFlYUjlCZXZpTTBMWkhoc3hORHk5aVU3WU1uMDh6TmVHemFLYUFNRVQ4?=
 =?utf-8?B?MStkNmNOMG15N2VxbVZOQ2ZNa2I4LzQ2bVk2YkFQZW5FNG56LysyY09BRkZm?=
 =?utf-8?B?b293RFlyYWFBb1hYYkk4OW55azFIUFhPK3NQd0pvaFZab1J3eGxNZkg1TlVN?=
 =?utf-8?B?emdKcm9NbWE1ckRwYWhaOWp1NXhId0ZoZHVTUkV3ckM0R1ZyMHJpVFAwSjBM?=
 =?utf-8?B?ZmpvV0pDWVk5QnpSZUFYeEVhNjhEQ0l0dnEyQkhUSEUzR3lSTkRTZlBjbEFB?=
 =?utf-8?B?QXdUZ2JNcW9OelpyT2xlWUgxbWk1UzRQRUFaYitKYklzbEx2bEd6MjFnbHNt?=
 =?utf-8?B?NWRvazI5WHFhSEgzMUUyR3NmeHdWSGthYXhEYWRuekRsdUJqbi9nQU95NUZR?=
 =?utf-8?B?TVVTeFZBVWhkRytxQWdJdG1sT1Y5aTNxMjZMSi85OG5ZSzRlKzdGdWhKWDRO?=
 =?utf-8?Q?5K4OBbUjGis=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1J3RlB1Vzduc2JSMW9FWEFPYW5KdmlwRVFTZmVkbWNkbmd4SDFuVWljeUpD?=
 =?utf-8?B?ZTJkenpjZ0UzcU1nbDVGTmRzMkV6NkQrbU5iR3NONkxxKzNCOEpyRzN3TEVG?=
 =?utf-8?B?TjAxYWc3b3dhcnptZDBZa2NRUmR6QWtQR1FNUVhWWnRvWTBseFIrMGFMQ3d2?=
 =?utf-8?B?VXFvZ1lDVjlXcEM5Rm9JbC9jWDVXR0s4ck05NkhZRzZKeThrSmxBcXVTLzVH?=
 =?utf-8?B?OTNxL1U5ZFZoTFQzY1lVaXBTWCtUclJZMndsSU1nRjRiVmxxTkV1NnNEZm56?=
 =?utf-8?B?a2dTL29tSDdsQXE1eW1qdFFyelVPZXZ3MzljRVkraGNvNldMWUZIVURoSGlK?=
 =?utf-8?B?UVovM3ZhUUx5Y08yRE9iNVgyd1NycEJVVnlmaUNxV3VJOUNPUk4ycCtjN0dj?=
 =?utf-8?B?SzA1bUw3dXAwZmxrT3BINlpvN0o3K0gvMkhRbVRxMVFOU2VnZ2xkVEwrZjZI?=
 =?utf-8?B?bVRaUk1hUE9mVWVmQ2hRaXdHWHVhVXU1NmZHbVVRWmIxSkxIeXZkaXNVQ1dI?=
 =?utf-8?B?TExzbTVBR1hmd0l0K2Z4WUhEek4ybFdJeVVlTzd3U0tuR011eHdQVHlRVmNX?=
 =?utf-8?B?VzU0TEVGd3gyTU0vZjUvRTkvNGVJcytGM01sR0NlNUU4aU5tZmtvRjB6UTdo?=
 =?utf-8?B?d250bDI4QnRZTytFS1orbTE2S2p5b1VJbWhRcGZySkdGSktiNTIvSHhEWW1Z?=
 =?utf-8?B?K0JIRlUvZ3lXWldXMUJYS1A3d2xKdGdrTTdNdVFrS09uWUFtdFBmT0pUbXFW?=
 =?utf-8?B?TmVUUi9lNTljMHV6c3V6WTFYWGlGaTVPWnVoY3k1YlU3c1pLdXl6dGtsdTBo?=
 =?utf-8?B?d0Rxc1h4cStna2dianplV1FrRmpNaDhtbWExVUdPR21CUmNlZ05talo5YmIw?=
 =?utf-8?B?SHRPejE4Ry9rcW9BMmw3akhzeHFydURObzZRQmFuUmR1bW51QmdUOGxtMzNv?=
 =?utf-8?B?ZGwwbHFRUGRINEIwK2dFTHA5M3NyRmRGa0NzUUxUUXhxT1h4OUxXeFQyTGhk?=
 =?utf-8?B?ZEk5YzduMXNsN1BqSkxQcXdXdFhNSDBjNzJDbFQ0VzlXL0xSSFg4RnNDVEVT?=
 =?utf-8?B?bVlSTUVqS1ZaTGVjRWsvbGYwb0hUTFBLMVdMS2plZWdhQ3RHcUpuaTBNSHpo?=
 =?utf-8?B?YWRzcDRJd0ZQTGJuVWhoMkJmQTg0dEZreW90Uml5YVNMWVhkdmtVaUlpU0hz?=
 =?utf-8?B?UjZBQnVoTWJ3d25NQmpINERqV3Fkamw5dEFmRGxrVmZTS2FWdlVSYkpWZVdN?=
 =?utf-8?B?M0pDeHR3cnF6WkJ0OU9ldlBGRU5uRzJzQ3NzQW9XS0VwNC9IQ3E5akhyODNL?=
 =?utf-8?B?K3MrQWVwV1I2VFE4VEhYMDdEckZTamRuSVArMmRGbUpZTGlMdi8xaVpJZlpj?=
 =?utf-8?B?eUR3MVZxWnoxWHdXVzJybi9zeEM0WkJqL2laNDExTHpVNkRLb3dsbldKejM3?=
 =?utf-8?B?Rm45YkdhZnliM24zeFgzaXd0SkIwRTFYQ3lUOHNJbWhzU1lJZkxYMUt0cGdU?=
 =?utf-8?B?VGc4R1hxWXBSM2lHM3ZnUW9td08zc1BPbGs2eGFpVkVRN2oxaVhpbHQyUUxQ?=
 =?utf-8?B?MVNpTWN3ak9zc3VmdllJZWhpNXZkV0JwMVlpSEJkWDRScFYyMG82bmtzTDNV?=
 =?utf-8?B?dkswdmVKaEIzZXBkVDJvT05QKzFhb3h1b2Ezd2QzZlF5RGVRK3lGdUVOUzFL?=
 =?utf-8?B?cFA3VmZDUU5xcWpmWVZsNXFrNlVWcElBaUZJTVV4aThkUjhFWExPaWtBK0tq?=
 =?utf-8?B?Zm9DK3FFbVNYNlF1RDI0d0xmSnY5Y3NTTDFUZXk3bC9wOUswNVVFbm50U0Ry?=
 =?utf-8?B?L0h3WTgydXN1aHNvdW15UFNuc0dQMFJ4MStNOVlPV0lxcmNNNHFiL3QzTkQw?=
 =?utf-8?B?NEh0V0dzcFcyL2liWG5qaVFpMitmcG5wVmdCcTFZSEdqaE1QdXgvYnI3SWRr?=
 =?utf-8?B?eE96QlpUUkN2WEk2MThTMzdtNm1peUtyYjhPbjk3bXcrcHFUcUNOeDVSbCt0?=
 =?utf-8?B?TmQwVi93TGtaemd1N0VwMjVCT0RhTWJFUjdKc2RBUVN6MllvMXoyUXZTbk5h?=
 =?utf-8?B?WTJHclZyK2ZrVk84ZlhPbnRqNTU2YW1odUxmZHFrZ08wbnNkT2pGNjdhQndC?=
 =?utf-8?B?dGhqNzl1aEszMElEWkJ5SzVHSXd5RHhaMUt5WU50UDdZek9MdnUreG5aQzYr?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b31171f7-9cc9-4280-c894-08ddad8c0327
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:45:01.9130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoR6g4k291w8D0eez5y24AP0czpNL8newHW8fz0DwgakAWkicSd7FKzszlyRJc2CKoSOjB1u5t3A1tZDT6EfU8kqzoeFEbCf/K7Avp8YgjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10909

On 6/17/25 12:21 PM, Krzysztof Kozlowski wrote:
> On 17/06/2025 11:38, Quentin Schulz wrote:
>> Hi Krzysztof,
>>
>> On 6/17/25 10:08 AM, Krzysztof Kozlowski wrote:
>>> On Thu, Jun 05, 2025 at 05:41:06PM GMT, Quentin Schulz wrote:
>>>> +  rockchip,reset-mode:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    enum: [0, 1, 2]
>>>> +    description:
>>>> +      Mode to use when a reset of the PMIC is triggered.
>>>> +
>>>> +      The reset can be triggered either programmatically, via one of
>>>> +      the PWRCTRL pins (provided additional configuration) or
>>>> +      asserting RESETB pin low.
>>>> +
>>>> +      The following modes are supported (see also
>>>> +      include/dt-bindings/mfd/rockchip,rk8xx.h)
>>>> +
>>>> +      - 0 (RK806_RESTART) restart PMU,
>>>> +      - 1 (RK806_RESET) reset all power off reset registers and force
>>>> +        state to switch to ACTIVE mode,
>>>> +      - 2 (RK806_RESET_NOTIFY) same as RK806_RESET and also pull
>>>> +        RESETB pin down for 5ms,
>>>> +
>>>> +      For example, some hardware may require a full restart
>>>> +      (RK806_RESTART mode) in order to function properly as regulators
>>>> +      are shortly interrupted in this mode.
>>>> +
>>>
>>> This is fine, although now points to missing restart-handler schema and
>>> maybe this should be once made common property. But that's just
>>> digression, nothing needed here.
>>>
>>>>      vcc1-supply:
>>>>        description:
>>>>          The input supply for dcdc-reg1.
>>>> diff --git a/include/dt-bindings/mfd/rockchip,rk8xx.h b/include/dt-bindings/mfd/rockchip,rk8xx.h
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..f058ed1ca661185f79738a358aa2d4f04539c590
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/mfd/rockchip,rk8xx.h
>>>> @@ -0,0 +1,17 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>>> +/*
>>>> + * Device Tree defines for Rockchip RK8xx PMICs
>>>> + *
>>>> + * Copyright 2025 Cherry Embedded Solutions GmbH
>>>> + *
>>>> + * Author: Quentin Schulz <quentin.schulz@cherry.de>
>>>> + */
>>>> +
>>>> +#ifndef _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
>>>> +#define _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
>>>> +
>>>> +#define RK806_RESTART		0
>>>> +#define RK806_RESET		1
>>>> +#define RK806_RESET_NOTIFY	2
>>>
>>> I do not see how this is a binding. Where do you use this in the driver
>>> (to be a binding because otherwise you just add unused ABI)?
>>>
>>
>> Explained in the commit log of the driver patch:
>>
>> """
>> This adds the appropriate logic in the driver to parse the new
>> rockchip,reset-mode DT property to pass this information. It just
>> happens that the values in the binding match the values to write in the
>> bitfield so no mapping is necessary.
>> """
>>
>> I can add useless mapping in the driver if it's preferred. I had the
> 
> No, I comment and raise questions when you add ABI which is neither ABI
> or should not be ABI.
> 

Not sure what would make something part of the ABI or not. I would 
assume the value in the DT property to be ABI anyway so this is just 
another name for the same value no? Trying to understand this from your 
perspective.

>> impression that simply using a hardcoded value in the DT binding and
>> then writing it to the register was not desired, so the constant is now
>> here to make this less obscure from DT perspective though I'm still
>> writing the value directly in the register. If hardcoded values are ok
>> in the binding, then I can remove that header file.
> 
> If you want something user readable, make it an enum string or keep the
> header within DTS.
> 

Just to be sure I understood correctly, moving that file to e.g. 
arch/arm64/boot/dts/rockchip/rk806.h (or rk8xx.h or whatever) with the 
file content unchanged from this v2 would be fine with you? Would I be 
able to point at this file from the DT binding (I assume not)?
Of course, Heiko may have a different opinion on the location of this 
file as I don't see header files in arch/arm64/boot/dts/rockchip yet :)

> If I review it like that, it will be brought to me next time for some
> other patch saying that commit was reviewed so I can do the same. [1]

Fair :)

> Therefore since I object against unused binding headers in general
> (there is no user here technically), I need to object here as well. :(
> 

Laws do evolve too over time, same as how society view things. Something 
done decades ago could simply not be acceptable today, and vice-versa. 
It can be good, it can be bad :) Not here to judge, if there are new 
rules to contribute, there are new rules to follow :) (or discussed so 
they evolve to better work for maintainers, the community or project :) ).

It's easier to follow rules if they are made explicit somewhere. Is 
there a public documentation on those "new" rules maybe we can read 
ahead of time to make this easier on you? For example I really like 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html 
and point to it often (internally, sometimes on the ML too). Maybe 
something to add to 
https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html 
or 
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html?

Cheers,
Quentin

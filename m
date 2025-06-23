Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80909770E2;
	Mon, 23 Jun 2025 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692557; cv=fail; b=kLbBTgnKUTRYCORdj3rKa1TldnZM6y6kPbRlHh1WOfhgGCLMdvwxk0BcftrxcKkek7aL5f+nH3Zm6lCTieHnZs6Ai1/YemlPJpD/dPjZK7kop4HXK+mxX6199SK4PNwKASfQuUkTBBE07ocX2tS21YOd4lTfczFf7WQ6OfyS51k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692557; c=relaxed/simple;
	bh=A9x8D20xzy3c9+C4MR321n8VKsPpqqINT2a36tH2nzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uIAsDPEzgve3IcnOlXwefmU4pXBcZ9Ph2j5s59gDTQT3mJzGq6WbyBwD62vxtrY7n83aZnOQgzTqMx5JMaUh7JhZwSLu28+6B9Y3VmbZ32dgALxySQ8DrSzLCSNoAUQfkN3/5YVYUgAcyDS1U1IStEt12iTUm3YfseXGbNPmfQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K4DW89Oh; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K4DW89Oh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sERXJYFplD52oIJO0+RB/ZW/jujKEAswsxEsjJFrbviB03hMk5IxLNd5qxfJPXCfw4QnnyhU3PyclCIbWHq+BOIJn5NHZ+M3hECUVcl/DFhJyZBgDgqEHdnq3BHpfUP8tCYgmvf/CnBi2rlrGi35G8yEI+3JspioPZkq11YFZs1uvd9GyzZ7NvN8ooSEZ9OhQwGopDONaz9qggIgAOgsD/SwcVYjHEpnG3+SS9xq8SRq8KOV/Iqu6pjJP5L4k/Qkl4RewtCyaEpMkHebpmooL9cW2JNWH81uovuLZMGDwWsEd0xXuBV6GZPDAJakme97hHEnD2FMc5rGrUM+8OeJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9x8D20xzy3c9+C4MR321n8VKsPpqqINT2a36tH2nzE=;
 b=FOkfWV1tazAdEZN4yoOVKW9OSjSvSO4EypZLltgKZzku08AjESQNqHAQgts9wSYno62NKyq8uzh+CVOvCJBnTl2uNlTYmna55/JiugQKbs4MTwrLw4THNZV/2CpGn5KCf+ttUobplf4Nmj5c6gHXrFvbhlowjRVKeIEoLS1KcAFIYAjL8n1HCtscvoIj63qAPTrT7+5adF6XoBlOZynUP7Ljos8FKizz1zWra8WObGDhs8tHMqOprrHSJYH2gizTwZSkL4j2QhYVcTq0GkH6terJKz3mBlntwz7EsHO1dPdXmWiR/WkY+/TNUDMaSyvbDqwA2a9wPsxcAcseJDfWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9x8D20xzy3c9+C4MR321n8VKsPpqqINT2a36tH2nzE=;
 b=K4DW89OhZuFUmSHi0oplAazgEvv6Ldoj0LOz69MxT50yXs4Z0voJ0CJI5oYpHGGziZqMh0XMNq4IAuvS9DyJDugnJh38dI+Hqu/rJOOJAF52l6nKI9NTycuuXeU5Avq5XedZjaxmOn4EoL53sL2lj/G05c6FsRuq4Y9Aihewg+qN9jm6Cb0h9esbEKql8CFLOWSTead2XWwB4JL6w9tymYnKkp0ZLanJ7LbpQGEeCEwKeDGCxI17zuOdJTX0JLAFJ3FJImLOs3zb910y/5CdPVBwpvme6VUs9auLo/Brh5vOVoK924UYsEG8jl2fB3XwMX1XF1tH3iOvKHEjfjKF1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6983.eurprd04.prod.outlook.com (2603:10a6:20b:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 15:29:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 15:29:11 +0000
Date: Mon, 23 Jun 2025 11:29:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
	aford@beaconembedded.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Message-ID: <aFlyvv8GcbQiUvtO@lizhi-Precision-Tower-5810>
References: <20250621112311.68101-1-aford173@gmail.com>
 <CAOMZO5DUVVBmxfrJPjcZPCQGFg-rVNTUch6APWfSKF6LY1DWHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DUVVBmxfrJPjcZPCQGFg-rVNTUch6APWfSKF6LY1DWHQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0033.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::46) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 9079a14e-47e8-429d-1172-08ddb26ab424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vk16eDRQYk1YOGJPc0dHckU3MVJ1bmFVR2xTa1F6UDUzczlNY1FNVlpVTU1O?=
 =?utf-8?B?c3NjVDhxQjFwVU45K1d3UHplY1dyRE82WXZXS1p1KzdCVUpEeGE1ZEM1WGhS?=
 =?utf-8?B?MFhtMEhmSmhYTHlvQkttdDZsRVR1c0RiUEs4cmRrMzkrajVpVlJ5QVVFeGVM?=
 =?utf-8?B?TGh5aUFoQy9LZzR4SWEvbmM2emdyY0VtN1Fpb2ZZWnkxOW5JSkIzVWhPM3Vv?=
 =?utf-8?B?alFncFRTeDd0ZWZKeGZiK1owYXh2dWFFakJqR3NkdEtySVlUTnVzTytsL21o?=
 =?utf-8?B?VVZZWXV2Y3VtL3Jrc0FVak5wS256a0hDdFpSQjUzeUk5UzFUSGsxbktmUVBF?=
 =?utf-8?B?cmNvRFplYkVtdzdHRytUWnc3RUtreDdkbS9hSkRpbVlDMW4xOERPcjFlTHp4?=
 =?utf-8?B?djB4S0UyYXpyeWRTVzYwaHlqZkFOb0pyV0g1eTloOER5MGp6cVZicmtKSU5R?=
 =?utf-8?B?Qy95RGJXdnF0eGE1dU1Xc2dReC94VjhIZWJNak51enRKWG1jNERKMmtUQ000?=
 =?utf-8?B?MnY2dkhsN1RMdEl3VFJlYUV6djFGamg3cHQwdlI4bkl2RnFCTGN4cjhxcXoz?=
 =?utf-8?B?bGhIUEIvTkRTczM3ZGJadzgvbzlwMWFrc3N4anR0V0szOEFhWkc4WHJpazZO?=
 =?utf-8?B?bXRYL0JHQ1lYTHBKa1V4T0l4cDdTZ2ZCa0Y4Q3FEdmlxYm9aR1huZnJSN21m?=
 =?utf-8?B?NWVZVk91UWlHb1lzUzhwR0JOd29JamUyeUVQNkhPanpsQjhHL3FjQ042TTFW?=
 =?utf-8?B?bFpScjZrc1Nja1JUWFpQdWJUbWFubkFPVG9UNnczUWJ4SU5MdGR1dGNPekpU?=
 =?utf-8?B?dEpSem5jVG1IVDlqWEFyNXlzVSs2Nk8xOXJWSTA2YmVMSDdieVE3MThNcytQ?=
 =?utf-8?B?NGNtOEptM29SMHIzd1ZPUUI1MWJXT1lveDJBOVd2SFAvZ0w4N2MxMmlTOE00?=
 =?utf-8?B?bHh6ZzNxWlMrOTlmOHpRNEdMNTBwUTdOLzVPdXBqbk1ob0pwVE4ra2VxRzFE?=
 =?utf-8?B?K3NkNitaVy9hUElESVlsQm1iRTRhS1VmRjFjWEpRdTVKdGZZMFZIS3RhV3dL?=
 =?utf-8?B?VEtNWWhHUTdsaHhMVzVsWDlxanNvdmlNZHdtOWI3dERLTzVuMDYvazRuckx1?=
 =?utf-8?B?eTVNQ0YrYnNLamxXWVNmSW11ZVdwcURISTIxcW9XZ0pYeEFtUXVaaFJzQ3dB?=
 =?utf-8?B?ODFQdTVkaXlxL3d1R3FWbFgvVnMrSlo5RnNYTzhzejVUVWlGZHNLVWU0aWdE?=
 =?utf-8?B?R1JrcWJvVTRxNjJLVkhKY25xUjFKNktVck5UNjJ0SmZzMzB1SW9hTEx5ZUZY?=
 =?utf-8?B?TjBKV0htOHFUN1RoRnhwOHZ0QXZLWUZwdzdDZ2x4WUc0cXhkVDNORng1RkJu?=
 =?utf-8?B?SkNXOFAzRnp1TGoxdjVmcW9pcFNGaDdyRWd3RG1OczcrakZwYkh2Mk0yNTlp?=
 =?utf-8?B?blIxVEpSODBsRE02RnhlN2xjRmZ6SlZsQlV1cU5tTUZXbDFDNS9lK2RGQklZ?=
 =?utf-8?B?cFVFY3BZRU5GUFk4bnpUdGpFTkYxZmZidU1RTFhRVEoyNVNFT0piOTE4WUMw?=
 =?utf-8?B?cFR2UXRza29lL1MyaXpBTHpPR1hvTXNsL3pwd3Z6UStQa3pybjlwWU1mdC9I?=
 =?utf-8?B?U2NGay9XQ3F2QjI1OWxoaTJZSGh5SGdKTDlZcDhsNU94SzcrSk1qTFR6QXBs?=
 =?utf-8?B?RVVPTXoxUUVxbjB2TzFrU2JyNkN5SHdPV0cvZ3NWeStPdVhZUXVZY2hnd0Vj?=
 =?utf-8?B?a1JXdU1ib0F3TFp4ZklZV0dNNGNRZEdqWlM4akVjS3NzYithU25nQXZxc2JG?=
 =?utf-8?B?RlBTazNuWnc4dElZZFR3VFVsNzVuRW9UT0tmVFoyamF0bTl6dGZqYXlaQS84?=
 =?utf-8?B?dDZaajIyay9aNzgyZzZ4UXE2aE1RU2FwU2pnT1FwVEhPSWJvS2tZdmJ3Vklh?=
 =?utf-8?B?KzRLOS9sNnAwdjJKWjZCbVhtSGlmSXBLVnpDV1R6NVBuRnBlTXVVUkpQc3Z1?=
 =?utf-8?B?VWVzM1dYRjRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkpnSHh4a2E3OUN4dnJZQi9kOXd1Z2ZwSS9oY24wN0MrU2s5TFNWcEZXRzFQ?=
 =?utf-8?B?OGQ3dzg5VUFtOHlmWXVtSG5KRk1ZeXhxMEJlYnp3UlZuaGJWV0RLY0pNZWxS?=
 =?utf-8?B?WjVIS2pEZ1ZVMHI5bnlrKzg1NkFnZ3JKZHEvaFprU2FRaVU2THRCZ0x5bGph?=
 =?utf-8?B?UmhJZDBHWmJoaGoybC9pRlFyY1hGOEJNa1BVMkJoTFpiMS9QdW81QVVHTEZn?=
 =?utf-8?B?ODZmZlJscUlFSFlZeWR6VkxqMjEzTExkRkNGejQ0V0tlMHRrNDhnekFOclp3?=
 =?utf-8?B?WHR5WVFnSW9rczA2ZFRvRE1OMHRsbFltMTJpYTJ1YXV5S05JOU5KZXhHUjFw?=
 =?utf-8?B?UzE4eUtvZSt5ckVOUThRTGFDMXRtL0h3bW1hZXZoczBhTUVJakwrZC9JWTVS?=
 =?utf-8?B?TkxJUklSUGlGOWdaenl2eEExSGpweW5TbExIbmtQNnQyWHBFbXI1bVdDNjND?=
 =?utf-8?B?Q3JwcGhLNzhGbU1aVkk1YjFKbFkyVnpMYWE2cFRaZ2huaUNQeFN6Nk0zN1pm?=
 =?utf-8?B?anVaU1BGZVV4Szc1VkxNc2RocW83Ylg1OS9ZaGJyQWRKYk9iN0twRk9Sb2hB?=
 =?utf-8?B?MU5Bdmh6NEl4a290Rysra29tWFdFcEhVcE0xQXVKdzBsQTV6ZXNucUlGRkFS?=
 =?utf-8?B?RHJTUS9RS1dSN2tJSXJpZk9kRFZDYko4MVRVK3BVSWZoYzh1dUoyU1JONGJQ?=
 =?utf-8?B?YkYzdjloWE1xNU93T0dQa0cvUDFGUkJ2a3N6NCs0TGQvWjJJTTlsSFl6ajVT?=
 =?utf-8?B?VjEyYk1tRFFmblh4TEJPakhmV29Nb0p5RmtlMkFCeWppbUFUNk1md2doYXk2?=
 =?utf-8?B?c1djdytza2w1TEtEMUdtdmRHanBRMUI1dFgwV3dVZlFVc2M1L2EzY0hLaU1Z?=
 =?utf-8?B?enRRV1hXa1VLblVEbGFQNU1JdHFKeXkrVVFxQ1NLejRtMlVpOGhOaVQ2TnZl?=
 =?utf-8?B?d2hvcFFMYnkrcjZPSnJaT0FIcHhLV0tMSC9hbXZvSmZ5TFRabmg2NEU3Z1ZN?=
 =?utf-8?B?SEZFMDNIczlHQTVFRk1iYkE3UmJJTU1WZ1VGcWRtVUNGVGljUGp3SzBpZzlN?=
 =?utf-8?B?QnlwVllzWk5aZUMrLzVpb3hiQlRpaXZXQ3I0WVlxZU9LdHZXb0FlVENCNVV4?=
 =?utf-8?B?cythcEFleVNwb1BoUktZekp1QkplK3lxSXhDYmk5Z0FmNUtUbk1rQ254eUsy?=
 =?utf-8?B?eThXa2ZzakxtYlpHbzNpWU9uVy8xUC83TWVUcGlmRisxZy9xRDRveEpOa2Za?=
 =?utf-8?B?SjR1OTRENUZZeTRReHFUNVBkYTJhOHozODN2R3ArREVoelFDSnorQjZ5RGVK?=
 =?utf-8?B?cnZ1eGhkMWRUazZiMVFTYzNKZXNMUXg2WG1HQ1A0ZUdobHNjUlRlQ3lOOXhX?=
 =?utf-8?B?ZFRZQVZ6STdNanNrQ29rTVliVUN1RWVYdGNEVHpzV2Y5ZHY5UTBYMU9UcGJX?=
 =?utf-8?B?ZkFybmJ4NkhPZEEzQVllWmJvMTl2WVVKY1l1dFNkZWVCcW9acnl5K0wrTEtQ?=
 =?utf-8?B?bEwwUDlHbTgycTNLYlpxN3FoTnUweTZBdlFjNVVKWG45U01KdTFSbWQzeDZy?=
 =?utf-8?B?SUhxU2RudXZ0ekYrYVhSYlJMaXQrVW03RmhXRkdiRUxjcU1JSTdKMkVGUDgv?=
 =?utf-8?B?T2hOUDUwMUdsUzgrekdoOE9xdVc4SFVMVlNPVEJPbm5GQ0VaeC9mYnVybHV5?=
 =?utf-8?B?MlJOVzkwSzFEUTFsblZvRGtacnUxUHNFOHpQM0c1VG8zcTJkNnphaTdmelln?=
 =?utf-8?B?YlZub0hLMUFJSEY3YzZlYlUySC9LWUV2bUR3dXFCY1FOSDFjb1J1eXdJNFhv?=
 =?utf-8?B?NmlPMHZXbXVYNGJZVHRDclFKdFZ3dWtTR0lMckx3TzA0UzVpZ2ZtbWk2Yjdt?=
 =?utf-8?B?ZHFKeUJ0bzVPQWNndGR0bnZSUEZzcFBkUU9RZFM0WDlVd2hRakpmMXdydjBW?=
 =?utf-8?B?ZnpyUzNHWXBkdEVWeHhJWXpOTjlHUzJpWC9hR1BRMHN5VzhVMGNqelJRc3pz?=
 =?utf-8?B?amZ4VGdQV2xEVGRKU1pkbHkwaDNvaVVJWDl1ZXJpK3JhTzdyQkdKTDJ6UjUz?=
 =?utf-8?B?TUtPd1lEM0VwenZvOENORjdoNExIVm56RzFONm9oZnl0UHRrQThyaXVzU3E4?=
 =?utf-8?Q?LHxN8i5WyhdDJHcTJ4+rxfRFZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9079a14e-47e8-429d-1172-08ddb26ab424
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:29:11.7303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMDBF7nrY6A5oO/GPV/jgs23gLqq52nlikKDKhZ1e1/WMvzjhr0QXD7mw3xpdZ+n6H1FVcwcDgHoqtbjRnTR7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6983

On Sat, Jun 21, 2025 at 02:07:56PM -0300, Fabio Estevam wrote:
> On Sat, Jun 21, 2025 at 8:23 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > UART2 is often used as the console, so the DMA was likely left
> > off on purpose, since it's recomended to not use the DMA on the
>
> Typo: recommended
>
>
> > console. Beacause, the driver checks to see if the UART is used for
>
> Typo: Because
>
> > the console when determining if it should initialize DMA, it
> > should be safe to enable DMA on UART2 for all users.
>
> The same comment applies to the other patch.

Please run below command to check spell error before post patches.

./scripts/checkpatch.pl --codespell --strict

Frank

>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

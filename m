Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2105.outbound.protection.outlook.com [40.107.104.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D11ACEDA;
	Mon,  5 May 2025 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431406; cv=fail; b=O6ok4ITLz4DmN5A3HSBttoFaVhew1OkyNTpCqmIyhyU0+T7JTr2ISWsXRuelOZ8zoQaBE9y+i5CZlKQRI9RBOJpDzeSZiVODiLhemiLD5W9+2DxE9o9MhHIUB0mS54+3fzPRQR/xGYhnRO4Re7tl1+czg94UnbgNR/n1IzJog4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431406; c=relaxed/simple;
	bh=v9txWq3C812+fvNo+lTMbnhEF+CZ84I8Cks/sl4VnPE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FVTbZgc723Q8DShcRVkjypSbTznJa/0VhCC/1AxctzuGLr3tc2wTUddSg3gxEpTRRGnHK/fLpwpJHZKQNNRBxk2++dN90tXdHZELPRB3ttqYbo1Y3nzaW9KGP6fRq8B1JbLoSqgUThjoXb3SZV9Gmcyabd1MJb8pnMnODbjgk0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=jvhcQAoi; arc=fail smtp.client-ip=40.107.104.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="jvhcQAoi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydYHkRmhJcG+w6WXM4Q1Qk6KxJXK1AvAWKM/OXVOuBzpHCmVwbpIfHYy1E2HgJu6o6BBrOTziYVhdSQ/3SJ4j+7SZ3bmyTmfj+/emavTAHwdpHX87IRHv3m7ch/NIfJRfSmK5mXQbO9gInPZYZXQpKBAGt2Pvs4ok5sviQyn9FFCwRu+wMfJHkYryFfSkx1g2FaQBpinmjn9+aorUFVP0e6PSldnis8fSGtXIA0eYU0BcfscQ0JSAYlehM/Xj13j+EDTV5UIfrDk6UyhjITpCJTjKdOglIJvQGiYkdzIFJHQ7i+mOTfwh5fRQz5+Fy6Mczsv/eNUNRH2FDwGpECArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3Z6sOAd9h0QOtBqhybL2bxZ6/+E38eQ/tyN5HkD4ew=;
 b=nikREGQ8xl3CJFsuGl7/JWC2SQUSCU+zxhxatnKMMrtUdT1kS0BCzDJ/wGW938xw/J+jcYcUxYtJoIjruIStMp8J0iGjmMzsg8D0fjCw5rhTRJIJstEe29kxFor25rsS1EnxQjz0gcQnKrZEPPw0CbjiGcThlLfmY9ggVQUj8vol0Oh2wlQfZgd2Ge/oF5vvQaU1RwC5BW/hc4TducK/v/a1fuQxAzbgsPkFZsc5eHfHdVBswvbD9inO6Ihc5qBMdSXXHrGXQLXSD7sqv7b8rykwMpFU1J5EVX8SAiXs7ZZnXvUshHBbjkCOT2eP3bQ2GyQKuGdWXyHQdteLbT1krA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3Z6sOAd9h0QOtBqhybL2bxZ6/+E38eQ/tyN5HkD4ew=;
 b=jvhcQAoiVqfSM1XjrdNNlKUuuKXUW4PTrPmwOR+WD66JzF/Kt3s0H32IfplPoghQO2Hq3FyuaOjIy7xDFtkIV/yvWeN618vp4YaUM77pS97A7yEHTTqAjCQ7S8rVlBIqb0F19K8nzXaTGrGDlv10EpdPpioTE7YKMl/a1zryzeaN+5FwaDOhsA3aB+owhK0L4yIDVoOU7Bt/THTVcDNAwiV4EmgZaXp2Swxqp1Ke5a/h95oXlnEpsJ1qMAejp4Dw6uhiIOfD71PtE+yP0TBFm5TMw+5vlm4yJsfkWuwbPrSJ4UojiKvaoBfg/uJAzoY3OIyGpPflExwVBvufs3/rcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by DB4P195MB1896.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:38f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Mon, 5 May
 2025 07:49:58 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 07:49:57 +0000
Message-ID: <cf136ed6-ddcb-4daf-a1ba-cdb13c6d12fb@phytec.de>
Date: Mon, 5 May 2025 09:49:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62-main: Add PRUSS-M node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi <b-padhi@ti.com>
References: <20250430144343.972234-1-jm@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250430144343.972234-1-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:303:2b::32) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|DB4P195MB1896:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd80259-eafc-450c-906f-08dd8ba96e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1gzdGk3c3U0Q1p1T3NFVlc0UkNhaWNmNHppRlJkRzBFQ3h3SU9ka3dBK2VF?=
 =?utf-8?B?TGt6dEhQTlhGdXl0aFZUdCtCSzV5WHYwR0czbHJSQWVsckJwNWZwQStiNTRp?=
 =?utf-8?B?VnIzU004cDkyYnd6eTAvTEFoSlVRT1B3cjNJWjN3eWVyQm8xWFV0bkdJZU5V?=
 =?utf-8?B?cU5KWVA5dFJCUjhGOGlHVE14Vkluckx3RVdBN1NpN2lwVmlFQ29Zb2Q3Smtt?=
 =?utf-8?B?bHhVT3ZlOXR5QmNSakt3YnAvOGZIR09Objc4aTZlSmtGWFMxNkxEWTZOZ1lC?=
 =?utf-8?B?VnZSY3NlN3NJZldiVG1lS0l2ZmNKNzkyWVV3ZjgwVFJaUUJzLzVqeE9GakJD?=
 =?utf-8?B?eUIzN1dWYWw5WHlKQ2RLV2tiUnkvcXg4RCtOVW1JUEptT3I1ZFZHUmRiY2dF?=
 =?utf-8?B?eUJ4ejFOZlozNUFwK3NvZ3VDYmdScEZpMTlLMEh1SDRlL29FazYycW9DeDBk?=
 =?utf-8?B?VXNlQVE1MDRjbXl0dFNPWC95VDJJbS9QRHZpVHVuTTc1RDRNaVBCaGloVCtF?=
 =?utf-8?B?OVlVNU5OeVNIUy9kMEVtM01MNjcydkZkWFJkeEttMHRkMDhSQ1ArSkpQM2o2?=
 =?utf-8?B?cnFnN1VIcG91aCtxcVNlM1dWd241Q3M2SFlhM1hERmNERGdWNkpJcFFxWnRt?=
 =?utf-8?B?endacm9jRmFhVTFJSU0zYjU2cXJUYUpPNHVlRWJjdUQvUUV1cUsvcVBidFVy?=
 =?utf-8?B?L2ttQWlXZHU1SDhpb241NGtJTUlIOFB6Yi9ZTE9NWDd4dndNMyt3d2FnbXFR?=
 =?utf-8?B?bHF3eS80TGZRUGtGbVo1UmhkVEw4RmZhV2lWSVh6YmRkRHRVVjNQMXBkSE9U?=
 =?utf-8?B?eW5TR0RwYlBhSVU0MXZ3MzB3RGUyWWlQM1F2dm9DZUJ5MjJXa2ZtMGJMdHh0?=
 =?utf-8?B?a2VoaUh6dWxuM3Rhc1hlRTlNR25zVTZsUGxZWnZ1eC9NZEIzTndJb0crYWFQ?=
 =?utf-8?B?ZG9IODRYWGdFRU5qZUVhOVJSdDM2Sk1mY2ZraGlBTVZYaHJZeng3VFVYaVBz?=
 =?utf-8?B?c21LQURmc0lZbG9FeGRLalpGSnp2QndlSDdMUFM3eEkzT0ZwUkplYWN3emFn?=
 =?utf-8?B?SUsyOU9tdzN1REtOUm1vWlRQeVcvR1UzbzFUaitZRzdFNnZhTGVSVTNLbHVk?=
 =?utf-8?B?TmpNaXJOenRHQm00TERkUS9uK1FGTFRleDhJaUpqY0FUcEY3eWI3V09VbmhY?=
 =?utf-8?B?dERIMDk5TW1vd2ladG9Oc1R6RVZvNk1wZnlvSFJCeXV0Zy81SnA2SzJlNXN5?=
 =?utf-8?B?TXQ1cDFldHhxb3NBNTB3UnhUTjljVllsMXoyUVBlMVpYVjVsOTJiSkNWMUlx?=
 =?utf-8?B?R2lwTmdwb1ZyeXhuL2JPQ25sNUdtb1RNTjVoU0pPZGlUOERBUDluYkJ0WnZI?=
 =?utf-8?B?SGdVZHpZWEdlTElHanBQU1J0ODh1bEZkSEJxSTRDSjlCUWM4c0Q4RWQyOTR5?=
 =?utf-8?B?dEZGc2kzQmx0d00xT2hwS1ZSMnpDc2Q2WjdsMmFURkg0R3pMN1QvT3Jmai9r?=
 =?utf-8?B?d3hhTkUvVFMxRHFJNEQwRFc1M2gwZHN1dWt3SUF2b2JLamI5ekdlM1RQc2J2?=
 =?utf-8?B?VGNWYm1BMW5BeVZqOTkvNFdrV0h1OFFSUGNXQTRlTUh3enBEdDNVVWl6Nmk3?=
 =?utf-8?B?d3hUd0tmOHZpdUNuU3R5Y291bnlGVkswejZoNXcraGNrRkhSVnB2KzNTYnlh?=
 =?utf-8?B?V1luWWRsdXdBNEkxbGlEV1g4R3RNY0FySnJ6ZnRiQjBXRjExRnF6TGMxN2pU?=
 =?utf-8?B?V3ZtTEp3WlZLQmk5ekNVcm1RdnQ5Z1BSVWVNaWFGR1ZyazRnM2ZtNkxNbkdW?=
 =?utf-8?B?SzRTazdzU2VaNUdnb0o0SG9MRjdwSStqQVVPMmVJdHZqYTYxbmc1YUQ4UXVs?=
 =?utf-8?B?T0ZEbFpiSzZoUnI0V2owM2dXS3dvbFl3WUk2c3J2aUpNSndpVTdWbmFwWUhG?=
 =?utf-8?Q?Skp9BB38GxE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akRUM0FsMjlpU2ZGT0kxd0ZPZXZkOTBKZlI5YkdvSWZodVpWRldHZ1pCQ3BH?=
 =?utf-8?B?UVNFc2dMODJIT3BQRUZBa3JFNEtXWlVhb1JuUHR2b0xxd1NaQ0Iwem5JOWJj?=
 =?utf-8?B?UXRjZ3BWSmoxaHBCLzBocDdlYWNkZGs2Qy8yTGJQZEgrK1ZxdnNxVUNkd0I4?=
 =?utf-8?B?dnIyUjNDTUJTVWNLSW9uT0huOGtHSTBvQ3pNd2JYWG9zSGpsWFh1MjZKeWoy?=
 =?utf-8?B?SXVEU2x6aTRyb1dBTTdqQU14bHVEazducXV1VnNkVU4vdU9xQlN3OFFWUlBw?=
 =?utf-8?B?WXhhRmZiQTJ3VG9DUWZkT1BWLzBMM2RWVVdiSG5USHIzVE0rQlR2ZlRzeklN?=
 =?utf-8?B?SHpkemo0K0g0QlowL2NJMks4a09BWjR2RFdPRUtjVnRTQWJEZjU1L3FiZzFD?=
 =?utf-8?B?cWorVHpWcVhsN0ppVk41ZHRIZzVvMFFqYmtWNUlydnNDSVRHS0ZjNTdRNmlY?=
 =?utf-8?B?SFNvYk9vY3lvaXVtZFhSRkJKVVdRZDlZZy9lMHFLZWZYbEswM1krVGI5NFNw?=
 =?utf-8?B?dUoyQjBpYnpLZDB6WDZBaGtmMnZtMDJsQURJdnkzYmxIdHNqN2xQUFpMcG9H?=
 =?utf-8?B?RXV2NjR5dVFibHB1RnNrdEIzN1RJV1dyNk9yUC9MN1Q4UzFCTEcyU0Z0S3Ax?=
 =?utf-8?B?ZisrZlU0T1pyQXFZUEdSRGRVYWhoSzVoUktJalgvTWpBbVhnU0I1ZkhKelZw?=
 =?utf-8?B?c0NPdGNjeXNKSEpVeVVDc2djUVgvdkFaYkFpZ3ZneUxtenJQcGNqY0NKR0hh?=
 =?utf-8?B?dzl6SnJpVmJaK3BuWFhQWXgwUmFpLzVCV2xkU2RVYzdJY2JOWDBMZ1RyanpJ?=
 =?utf-8?B?REJIWUVQUWQzM09CRnhrYmU2U3JreXBYV3hib1JXTW9kSVVseGFJbUJPY0Ew?=
 =?utf-8?B?bWpWSFRBSS9Qckxjd3phanJzOERrcnpxNUJiUFFXWUVOQ0tZaktERjR1ZWpZ?=
 =?utf-8?B?UmVpVU51YTExMnhPeGpNZlJ6eE9HWUJRWjlPUDJxNjZIK0ZzdDZkZFlBanVn?=
 =?utf-8?B?YmgwS3pUbHZDTlM2QnluYjBOMC9EdVZyQWNBeFB5NmhQZk9QY1Bqa2E2UTRK?=
 =?utf-8?B?ck53ajZCNURxWjVURFJ3L2xQVVBSd1hvNkdkbkRRL3hJTnMxb3Z5KytkVCt1?=
 =?utf-8?B?L3FCamlueTJJNzBMejVNdVpmUTRGZDdaMy9TODF6U09CYnd2cm5wMEQ3dzB0?=
 =?utf-8?B?Q3NHdUdXWFZjRjQxSXlmNkxMTnBoUk1ZbFk5eklENFljWlpVZzhvTVk4N3NB?=
 =?utf-8?B?NUVSUWRrVk5wOFRPbGdST3l3Uk9ubjUzQ3E5WHJsUVd3WGZwUjlKVXYxcGo2?=
 =?utf-8?B?Nnd4Q2N3NWhrbytIMEN2SmgrV0Rod1hHL1FNSk9mVDlDTDdFdVM3YmVVSno0?=
 =?utf-8?B?djJmZ1RjMlp0bFNQV0tKYXJNOFJ5eWU4L1NxTXMzTVJ2aWlhTTBOdUJFMVI3?=
 =?utf-8?B?YURlV01GN3RaSEo4eHZZU2lBRUhhd3k3TlJoeHVxekQvOHkxeCtJS3J3YWta?=
 =?utf-8?B?a0dzblFZbG9HSGZRWGZjSXREUGM1WmNaSnRBS0hGVGNGeFBEMWVDazZ5bjNk?=
 =?utf-8?B?UTBHMDVBUFRGNjdoeHZvVG9rcGlvMGRPRCtXQkFROUxTTTZPMzZ1RzN5a2Jx?=
 =?utf-8?B?UVYyWjNWbmNjMHZ1NlNRMVFMamhYYnQwRlgvc3Z1TmM2ZXFkNDN5Tlg3TE02?=
 =?utf-8?B?eExXT1BlWWp5c3JtQUJmY3crRWxRdm1zRzJDa09qMytTTTNFTnlhd3JlRHdz?=
 =?utf-8?B?T2M1NExhNk5qejVLSDdXaWZ1S2kxdjIraGRycWFjVUNSZTN5cFUweHZxaDB2?=
 =?utf-8?B?bkZ4Rk0rOU4zQlFnYmlSRVkrYkpidHpCOUV0SWlhZGI5bUdyMThBcnM0R1BN?=
 =?utf-8?B?OTkxOUc3MXlaK2IvdW44RmdUdGpCTDVhRXNJNFVsK2ZLdFdsM3ZIM1QxQ1B6?=
 =?utf-8?B?Mk1uQmdnME5RbjJCZm1BK1ZWYUZQaHJ1d3JiUmhvZHlDMnlyUUgzVnNmbnIw?=
 =?utf-8?B?a3NpblNzUXdoS2dyUDljMlBBK2l6Zkd1VjREUFJwTERyTGtmKy9nam1BRXdy?=
 =?utf-8?B?aDBvK0ZmMHViZW5vak5rSzA5dWVud1VkaEF4VmhjUm1aajB2R1lLZEp0eDZ5?=
 =?utf-8?B?c0tac2xOT1BLcVliaHBlQ2lVRndxeHBPQkE5QUFBSllubjg1MTBVeXZOK3Nn?=
 =?utf-8?Q?KIjz4x+0WK9MTDeCoIg35+Mx3RjYeU5sRh/y324bpsuO?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd80259-eafc-450c-906f-08dd8ba96e03
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 07:49:57.4074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEw5P6Rk1ejw1Qv2tilHUKPQtTw/z144kdLzNXgyloIlB/g2jkbq10Cao/epXKx3VXDgrAvP3Mstplj/+/p0WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB1896


On 4/30/25 16:43, Judith Mendez wrote:
> From: Kishon Vijay Abraham I <kishon@ti.com>
>
> Add the DT node for the PRUSS-M processor subsystem that is present
> on the K3 AM62x SoCs. The K3 AM62x family of SoC has one PRUSS-M
> instance and it has two Programmable Real-Time Units (PRU0 and PRU1).
>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> [ Judith: Fix pruss_iclk id for pruss_coreclk_mux ]
> Signed-off-by: Judith Mendez <jm@ti.com>
Tested-by: Daniel Schultz <d.schultz@phytec.de>
> ---
> Changelog:
> - drop internal tags
> - rebase against ti-k3-dts-next
> - fix header
>
> Link to v1:
> https://lore.kernel.org/linux-devicetree/20250108222048.818835-1-jm@ti.com/
> ---
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 90 ++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 7d355aa73ea2..ee53e663b5bd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -1079,6 +1079,96 @@ dphy0: phy@30110000 {
>   		status = "disabled";
>   	};
>   
> +	pruss: pruss@30040000 {
> +		compatible = "ti,am625-pruss";
> +		reg = <0x00 0x30040000 0x00 0x80000>;
> +		power-domains = <&k3_pds 81 TI_SCI_PD_EXCLUSIVE>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x00 0x30040000 0x80000>;
> +
> +		pruss_mem: memories@0 {
> +			reg = <0x0 0x2000>,
> +			      <0x2000 0x2000>,
> +			      <0x10000 0x10000>;
> +			reg-names = "dram0", "dram1", "shrdram2";
> +		};
> +
> +		pruss_cfg: cfg@26000 {
> +			compatible = "ti,pruss-cfg", "syscon";
> +			reg = <0x26000 0x200>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x26000 0x2000>;
> +
> +			clocks {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				pruss_coreclk_mux: coreclk-mux@3c {
> +					reg = <0x3c>;
> +					#clock-cells = <0>;
> +					clocks = <&k3_clks 81 0>,  /* pruss_core_clk */
> +						 <&k3_clks 81 14>; /* pruss_iclk */
> +					assigned-clocks = <&pruss_coreclk_mux>;
> +					assigned-clock-parents = <&k3_clks 81 14>;
> +				};
> +
> +				pruss_iepclk_mux: iepclk-mux@30 {
> +					reg = <0x30>;
> +					#clock-cells = <0>;
> +					clocks = <&k3_clks 81 3>,	/* pruss_iep_clk */
> +						 <&pruss_coreclk_mux>;	/* pruss_coreclk_mux */
> +					assigned-clocks = <&pruss_iepclk_mux>;
> +					assigned-clock-parents = <&pruss_coreclk_mux>;
> +				};
> +			};
> +		};
> +
> +		pruss_intc: interrupt-controller@20000 {
> +			compatible = "ti,pruss-intc";
> +			reg = <0x20000 0x2000>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "host_intr0", "host_intr1",
> +					  "host_intr2", "host_intr3",
> +					  "host_intr4", "host_intr5",
> +					  "host_intr6", "host_intr7";
> +		};
> +
> +		pru0: pru@34000 {
> +			compatible = "ti,am625-pru";
> +			reg = <0x34000 0x3000>,
> +			      <0x22000 0x100>,
> +			      <0x22400 0x100>;
> +			reg-names = "iram", "control", "debug";
> +			firmware-name = "am62x-pru0-fw";
> +			interrupt-parent = <&pruss_intc>;
> +			interrupts = <16 2 2>;
> +			interrupt-names = "vring";
> +		};
> +
> +		pru1: pru@38000 {
> +			compatible = "ti,am625-pru";
> +			reg = <0x38000 0x3000>,
> +			      <0x24000 0x100>,
> +			      <0x24400 0x100>;
> +			reg-names = "iram", "control", "debug";
> +			firmware-name = "am62x-pru1-fw";
> +			interrupt-parent = <&pruss_intc>;
> +			interrupts = <18 3 3>;
> +			interrupt-names = "vring";
> +		};
> +	};
> +
>   	gpmc0: memory-controller@3b000000 {
>   		compatible = "ti,am64-gpmc";
>   		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;

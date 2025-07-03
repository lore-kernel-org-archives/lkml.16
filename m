Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022130.outbound.protection.outlook.com [40.107.75.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB8218584;
	Thu,  3 Jul 2025 02:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511456; cv=fail; b=nz/4hexS3VHV4QXc8PiZ69j3L+Rbgs2AOqYaIGTxDzJZ5OxX17CgvYQTi02IAlK88lGRF5d1lCjqZOSw8H3lA45ryQBkzqLx3eE4WHRcCXV5bA8y2UmAlw+Ra2C6EufYr+DQg6qDZw50kpNC6v45K6tcpx5ode2C9/BLX1034G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511456; c=relaxed/simple;
	bh=TNl3J61BtmYCaVBOE8DSOJVjX99ilI23Cr9jkYldfPM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k+51qmzgRiPe+A1J7XuiEri8s8Yd5sSlzALhrdpx248NAy4MND8tD+z7Ax7/VOO0w3pZhjdGw+iy+etdqsdJlf3TJ6e8W4wTts49mjPceq5OHrC+dEOMHBpPrFP1Uv7KQyldD2nQCvgDpUXwbKCcw1HNMY/NLDK+c+K7yNIzcWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=iTUAJ3kS; arc=fail smtp.client-ip=40.107.75.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="iTUAJ3kS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxrFQrGLHX9+b98/l+njXn+AVbZ1Sj3XW/OMjNmlFnrbhXfBXyRoPw1UTgz3jln5N1kLXyhD8MYeTuB++CCT19XzPh+s9J4iEpKMVxihsUW7yODxTi+zesHM1WfwB8T0SyXYFHqbZ0YPHlbd7HYdGvpbKV7io3X7XuTyjCkoNbcOh7sTfZclFX1U5AI13CVuhWgeVlvObgoiZP7I6fpEWtNgWJ/S2/WzAuc5x8SIf7Vr4XJy85oj+UEV69bgUEU6/VAkUtwRTa+R2/cAMmJwl+OTkjMQ/9IK4icQj7pc9eKJo0JAJOs/MATEtknQ7/DODjxKFU4uBcLZj9fSLjWnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtjOjw037bJPGgPn1YWy3OsHwZUutz3X1zm06M0oHww=;
 b=x5zM1/Qbi3rOQ1ED8I9H2QD8kyfJUiWmhZtbFAniZNLLxBeiUvxMhCFqLGtEY7NGuDsmVswQBFDmP8Q7SKctijhJuAvlcKCvPyAJ8pB9LTZd6NT5JTIR7gnOerlrhnTjhFnWu5gBMs19De2W3Y8gCJZkyFeYsJcjise1oB/TAfd7lSk4gjIcxMC+3PlG9dxk3HU12Rx8JvfTa68IcbHNgw2/BXW3F8mFLiXbceAAi2wHotbsBreqg323jBWqHZUosCrUUq4BD57KxbE0bkl4fzVaRLcN5Q8b9cNz/Hje/YHyjotUtvENRoGWr/ny8Kgmy2Fe1ASkkl8WmxRtPP2FoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtjOjw037bJPGgPn1YWy3OsHwZUutz3X1zm06M0oHww=;
 b=iTUAJ3kS5jf9sKfEact5yb74N9iyoio/B2gXsVurYC14GEbOLM6+RaPqJoOMdyRDQyVbVXuxgFDLc+OZCKlOsbUUCl1VQrUJzZJVSdjFRI+l824A0Jko89pnDi27Hp/dKDFUTgv8HDQUy7tGY7bkCuabIbYTmDNsCpNjj60j2J/DgRCtD62cw9Q4/uRbEi0xFGItAb/CfbtnduCPdGEzlqQ7KJSuQDR55OqJUnGi95/nc3ViAbfVwrHG1JlmmD1BknMm3ujIzXMBSO9itq/WqwG7max3pVY5Mz6gDmN8SEMXe7tBqCnP070IZOL3fDRGS/Cq7U816gbxjV/ks1seUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB9461.apcprd03.prod.outlook.com (2603:1096:101:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Thu, 3 Jul
 2025 02:57:30 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 02:57:30 +0000
Message-ID: <d8fac973-0818-4e0e-a223-ba007d63fa2f@amlogic.com>
Date: Thu, 3 Jul 2025 10:57:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] clk: amlogic: c3-pll: naming consistency alignment
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-6-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-6-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: e62a9d6c-40a2-49ff-958b-08ddb9dd5a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXBhckhyaHdvU0tCc0gzYXFGVlRVTWUyYUxaQ0RZTDl1YlJHTkJRVEJjUmpp?=
 =?utf-8?B?RnZzbHhFS0VuTHc2cDY3YVRmbmZKTllkZDZNTEh0aEt1cDQ0VEgyZytkOEhU?=
 =?utf-8?B?c0QrM2RNNlMvUDNzcnJPTXhaRkJvSXV4YXlML3FPVXl6cGpBN1NNRUx6TFZN?=
 =?utf-8?B?a0RGM000NHZnTjZZYUsxQm15a1BMVy9KSktya01YQVV5b1VsaEtCemJBZ3pK?=
 =?utf-8?B?YUdCeGRLaVhuV3hYaUFkZmdLdHRaNzJkUVVxdGZjeGNub0VmUWRiNFZYSjJr?=
 =?utf-8?B?UFlKL3M4K2Q1aWtQSHdOTHBHcEIwTlFzaVhERGQyblFpVGE2S2F1aCtUVFY0?=
 =?utf-8?B?d0xqUm5PRWl6SElMM2twcmJlOFRFT0c2WW9PUzBaMkV1N1hWSURIWTRRWFNV?=
 =?utf-8?B?cFJsZWFpQlRBNDFhWitsbDJNWnN4TzlTd1NvVEMvTllqTHloN1FYUjIxbUtU?=
 =?utf-8?B?STlkNzFpYk1ydldWY1ZsWE14TXJvTVpYOTJza29nMkdEUXQvNjhIRVg0aktk?=
 =?utf-8?B?cDdYZkJkRXgybTBUQ0JFeUkvSThiODJyUWRYRDZ0Uzl0SXFsdmN1MWE3eDJB?=
 =?utf-8?B?QXAyQ1ZYTjErNDh2NU5GeHhmNGRQbkVHUlhQVTZTUzJXaVpCaXRzaGtUUWJM?=
 =?utf-8?B?czhHek1Ya01jVG5MNHJiMXMxRFEvQS9DY3VydGlKUTdXemowR1NMbVNRcDhq?=
 =?utf-8?B?ZW8ySUxIS2NndnNoekk0K1NObC9IUVFCVTBLb3M3OGtNRzZTcUxRay9DdUdH?=
 =?utf-8?B?ZHh3TURseUVpWm5qZjl2K1lMRGd6SFdReUlWM1ZIY2VtWktDRGgweXh6UUVi?=
 =?utf-8?B?R2R4c0k0TlcvVXJPbXNERjZlSjRJY0hOanJyZ1pueFZBN1cxYm1LQk5vRWNL?=
 =?utf-8?B?K1Vob09PWDFKOEhjTDQyc25ySFh2cFJXbWdmNG0vbDc5YkF5VUk4RFpXcGNF?=
 =?utf-8?B?bUhhUXg2ZEE2LzlaWnMvUWVLWERwRTVpZWdTUHMyai9yWEhUUUtVaEpJTk1j?=
 =?utf-8?B?Z3p4ZGY4U1VHUnl4TGpTZ1dIWklrVHVidm5aY0pvNGxKTjE4S21HZU1TYkFu?=
 =?utf-8?B?Q0tGOGNCY0tpTHZhaitRUzgrTEdSMUxqeXVzV3lOR0lLRDJJeUdYanNhaFc3?=
 =?utf-8?B?VmlWS0xvcmV2R09KVU8vblZmM2FuSXNHT2QyUXcwMFk5dkdIQ2NyRHhaWk5w?=
 =?utf-8?B?RFJjZ0laRmczemFHY2hRT2duMm53SFFJQWNpcEd0eEhFTXJjK2lISHFTTXYy?=
 =?utf-8?B?dkgxZ2k1V292cFBEYUNzcm1TOHZITGF3NGFDWGFaRWVCcDhGd0kvTUFRQURm?=
 =?utf-8?B?QjNWMG03cEsrNStScXFGVHRkODZobkZMenhkb1J0UkFOb1U1S1NyOGhuWDlo?=
 =?utf-8?B?enozUEhBNXRCa0ZyNVNwV2J4ZC92cFNRS1R3NXA3c0JydXoxZVNNYWU3QmMy?=
 =?utf-8?B?U0tjSXdIODRxdnp0Ly9waGFXS0pkV3pVMmw3RHppQlMwangxc0FWb1g4QXQv?=
 =?utf-8?B?NCtkY0dERVd5L011V1BlTXIzQmpOVHNUVVVYWmloWmE0NzRGbm43N0ZUaE9w?=
 =?utf-8?B?aWJEa25EQW01OG5EVkpUVFRLM25wc2pyQ2VEdytnYWMvM3lZMFpBQWdsNnZj?=
 =?utf-8?B?dExDVzUzRW1zRVRwR0FOZE5TN2dURGFNZkJxVHJpVjV2QnorT2dSK0ZaNTFC?=
 =?utf-8?B?eEVMMmpBRXRMdm93R0N0UDJCSkRDU1M1dVQ1WDRiNm8zcGVaaldKWVl2UGp4?=
 =?utf-8?B?SVBBbzZyTGY5VWROMHZKRzM1aXhOMHFTZFo0K2tlbFVBM0xiMDZxWHQxUlVT?=
 =?utf-8?B?azRqL0oyTjNpQWM0TDkyWjI4eDI1bmNLb3hLWlVHSGpSemFyVkNmV1FYajBE?=
 =?utf-8?B?b3FiSm5BUFJ2WGZNdkFablR1L0pNVW0wTnFDcEJHWE5STFdqc3YxK0UxZ1NK?=
 =?utf-8?Q?5pCWdoTivxc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVJlUEE4TkVUbU53MU1Wc0RtWHZ2TkxhVWdWcDVBeWNxSTg4QzR6bDBYUG9o?=
 =?utf-8?B?c3U0UHdRdG9EL1hjTUZ4UUVwOURSM2pHbnhEQTJUdlRZU0RnbXpydzU4R0lN?=
 =?utf-8?B?SGlzWm55dzFoSk1VREVyRGRYNWNDN0F6b29teWY2S1UrVVJyM2l3dVpKdjQy?=
 =?utf-8?B?VkpBVUZWMEZpbjljdDl2VzFjQlhUK2VOb3o5K1N5aFNxYkpydXo1bGFEbmtT?=
 =?utf-8?B?RzNaT3J6cEpXc1N5MG1rOVFPNlZETDB1Q2QzcFhsT2swM1pkMld6RW1yUjZu?=
 =?utf-8?B?RW9LTUM1N2xrS3MyYmNaUDdNTHJXaU16cFNaUUZDd2orQW82bHhSNGM3NktD?=
 =?utf-8?B?cXhoa2pmbnFSZWEzd3hrcFlHVjREZ01iRmtkaVIyYmlCNEVEQ25FZ0kyZm9Z?=
 =?utf-8?B?YWU1QldGaGN2MzIvM2ZvVDduOUZuanNNbHMrK0JrRXcralRJUFBkMzl4dC8z?=
 =?utf-8?B?SVY3UmFreTBaSnJtaTIwNHZQS1JtbGVyN1Y1QWVITWUvZGZIbUU2WWhpNURi?=
 =?utf-8?B?aGQwckVRSVlOdWd0SjVCeWt5MUVZMzdzYUo2SDQ1WVJTWWJCc0VNZVhFWjBS?=
 =?utf-8?B?aDJzaDcwUzN5dGp1QU1JN1VhdWdRdWlLTkFSUlJhazhoaHRLWnhkR0VTc2JZ?=
 =?utf-8?B?MmZ2a3JQdS9GbHdSSHlvY0FzVlpHTytLRm1XSFh4U1VtZEdHb1VaTUZYREZt?=
 =?utf-8?B?aGhFL1VBdlp2eUx1MVErc21MdFJ1c1RMTEpueUJLbjZHb2pUWlRYOENMWlND?=
 =?utf-8?B?T01LeWRSaXpBcitSZzYzQnVqYnU4ZVBBYTRHaGlNdkZJZm9DVUw4NVBBL1R3?=
 =?utf-8?B?eVlGdXlia0UrY2U0ZVJCWkUxd1BVaGU5SnJ2YkJIY0Z6ZTViV0lkdGxpcEly?=
 =?utf-8?B?ZWU3eWM1M0RBZm1hTjZoeHdweVhvQmFiM2NPTzg4cjkrbVVFWlgvaHpkbmQv?=
 =?utf-8?B?bjdCSEhvakhLaC9rMWRuMkx3NG52WFhMdWFCdjNxSmlQblQ1MEJ2a2w4Rno2?=
 =?utf-8?B?L2M4QUJJU0dmVnFzTmkwWFR3OFRXTUhDU3R3WnJaZFdtZ0J4VFZzOGxmRjhD?=
 =?utf-8?B?Ylo5eU1qTTFSQ0Rlc2JSZlBJSk1IclhXUTdpazVlb1pCM2lWR2hISGw3a2Q0?=
 =?utf-8?B?TS90T080Ym1RVE5lVWJkOUE5dWNsRm1idzhxUU1QYVRxMmIyd2ptQTRadzg3?=
 =?utf-8?B?REZSMGQ5Qm1oWTB2QzJHcjdMZ3c0OGtnaUJMc3ArcnVudzBkaTFpWnRRMElB?=
 =?utf-8?B?MVBocWtXdUlxbG5oeDFOSGQ0UnE0YjFIeGwrUVJuSjdOMkJGUTU1Unp6UzRF?=
 =?utf-8?B?TVJtUHlyQXJGV1BwZytoc1RGWXpJUFUySjJoRW9SWWxGYjIxQWgzMWN0Nkx0?=
 =?utf-8?B?N0l1NXZHaVExbXVQVTgvOFUrZ3Z3ODkwRWk4MVc5TkZ6L2ZjRklZaWhlYUlv?=
 =?utf-8?B?VVc3ZVUvRlk2dloxNlY0V2tTSUxscDNWSkdkOURoZ2VuM0wyNlduLzNzRTE4?=
 =?utf-8?B?VEoveE1GSEsyamxMaEhUM0xyNUxVcXRLc2RLdDcxOXB3YSs0VVoyRExEdHBT?=
 =?utf-8?B?VEo2SVBPWEY5WWhyQlNFWHdJemJqb20yVDVuVE41VDFPUThUaVRETHRVandm?=
 =?utf-8?B?Z1lGTnd3cnZtMlJZazB0WUtvc1c5aUpsbzU4ZmVGNFQ0cEk0SDBaakdrZDZT?=
 =?utf-8?B?alJoNXp5RFNaSER2eUd0dHk2amhoY3ljM3dxT2tMQnc5eFhBUzc0QWJrVUxs?=
 =?utf-8?B?MGhxWVlMbXEyUXluVkkxaU90cWJNRTNmdUFQMG5HcjRTSUNqNWl6dEMxMm5V?=
 =?utf-8?B?RE5sU2k3cU9hUE5LdzF6cTFoVTJmVjFRMGlRNkJQU1lZWDNXQXpJTjJEai8r?=
 =?utf-8?B?UUk5VkpkQ1dFa3ZGVGNtd0xmRENTSG5IL1F6U3dKcDZhc1Y1SUpQbVFLallE?=
 =?utf-8?B?VUFEQUhoYUdtRU93TkpIWGtoZWVjNlZLRXlmc3ZFbGpDbU45c0Y1LzByeURD?=
 =?utf-8?B?ekFST3dTWFZtcm5BR0lCN01oZ3NsNXBjYkRSQmRyb1h4ckhaTkszOCt4OFpU?=
 =?utf-8?B?MUY2cXZ6OEwwcXhjMzJBZTZzRmN6UnZTNzh4S1p1ck1oZmd6czBYTFhiUWln?=
 =?utf-8?Q?0e03eV3gcBx+kfTojZpaRGl00?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62a9d6c-40a2-49ff-958b-08ddb9dd5a12
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 02:57:30.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leLW+ExLRTwY3G/kunAXpscmN1Bk3oHe4ZTc3i2oMAficaYu11EZJLdtU6IlE1wInWAGZAAKXS6G1O8LbhkPnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9461

Hi Jerome:

     Thanks!


Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Amlogic clock controller drivers are all doing the same thing, more or
> less. Yet, over the years, tiny (and often pointless) differences have
> emerged.
>
> This makes reviews more difficult, allows some errors to slip through and
> make it more difficult to exploit SoC commonalities, leading to code
> duplication.
>
> This change enforce, wherever possible, a consistent and predictable scheme
> when it comes to code organisation and naming, The scheme chosen is what
> was used the most already, to try and minimise the size of the ugly
> resulting diff. Here are some of the rules applied:
> - Aligning clock names, variable names and IDs.
>    - ID cannot change (used in DT)
>    - Variable names w/ SoC name prefixes
>    - Clock names w/o SoC name prefixes, except pclks for historic reasons
> - Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
> - Parent table systematically named with the same name as the clock and
>    a '_parents' suffix
> - Group various tables next to the related clock
> - etc ...
>
> Doing so removes what would otherwise show up as unrelated diff in
> following changes. It will allow to introduce common definitions for
> peripheral clocks, probe helpers, composite clocks, etc ... making further
> review and maintenance easier.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/c3-pll.c | 202 ++++++++++++++++++++++-----------------------
>   1 file changed, 101 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
> index 2c5594b8e49a24ae8067117465ee4c0e29d7420d..ccfcd4b5be8996592c27df31fa62d4871c826926 100644
> --- a/drivers/clk/meson/c3-pll.c
> +++ b/drivers/clk/meson/c3-pll.c
> @@ -34,7 +34,7 @@
>   #define ANACTRL_MPLL_CTRL3                     0x18c
>   #define ANACTRL_MPLL_CTRL4                     0x190
>
> -static struct clk_regmap fclk_50m_en = {
> +static struct clk_regmap c3_fclk_50m_en = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_FIXPLL_CTRL4,
>                  .bit_idx = 0,
> @@ -49,20 +49,20 @@ static struct clk_regmap fclk_50m_en = {
>          },
>   };
>
> -static struct clk_fixed_factor fclk_50m = {
> +static struct clk_fixed_factor c3_fclk_50m = {
>          .mult = 1,
>          .div = 40,
>          .hw.init = &(struct clk_init_data) {
>                  .name = "fclk_50m",
>                  .ops = &clk_fixed_factor_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &fclk_50m_en.hw
> +                       &c3_fclk_50m_en.hw
>                  },
>                  .num_parents = 1,
>          },
>   };
>
> -static struct clk_fixed_factor fclk_div2_div = {
> +static struct clk_fixed_factor c3_fclk_div2_div = {
>          .mult = 1,
>          .div = 2,
>          .hw.init = &(struct clk_init_data) {
> @@ -75,7 +75,7 @@ static struct clk_fixed_factor fclk_div2_div = {
>          },
>   };
>
> -static struct clk_regmap fclk_div2 = {
> +static struct clk_regmap c3_fclk_div2 = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_FIXPLL_CTRL4,
>                  .bit_idx = 24,
> @@ -84,13 +84,13 @@ static struct clk_regmap fclk_div2 = {
>                  .name = "fclk_div2",
>                  .ops = &clk_regmap_gate_ro_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &fclk_div2_div.hw
> +                       &c3_fclk_div2_div.hw
>                  },
>                  .num_parents = 1,
>          },
>   };
>
> -static struct clk_fixed_factor fclk_div2p5_div = {
> +static struct clk_fixed_factor c3_fclk_div2p5_div = {
>          .mult = 2,
>          .div = 5,
>          .hw.init = &(struct clk_init_data) {
> @@ -103,7 +103,7 @@ static struct clk_fixed_factor fclk_div2p5_div = {
>          },
>   };
>
> -static struct clk_regmap fclk_div2p5 = {
> +static struct clk_regmap c3_fclk_div2p5 = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_FIXPLL_CTRL4,
>                  .bit_idx = 4,
> @@ -112,13 +112,13 @@ static struct clk_regmap fclk_div2p5 = {
>                  .name = "fclk_div2p5",
>                  .ops = &clk_regmap_gate_ro_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &fclk_div2p5_div.hw
> +                       &c3_fclk_div2p5_div.hw
>                  },
>                  .num_parents = 1,
>          },
>   };
>
> -static struct clk_fixed_factor fclk_div3_div = {
> +static struct clk_fixed_factor c3_fclk_div3_div = {
>          .mult = 1,
>          .div = 3,
>          .hw.init = &(struct clk_init_data) {
> @@ -131,7 +131,7 @@ static struct clk_fixed_factor fclk_div3_div = {
>          },
>   };
>
> -static struct clk_regmap fclk_div3 = {
> +static struct clk_regmap c3_fclk_div3 = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_FIXPLL_CTRL4,
>                  .bit_idx = 20,
> @@ -140,13 +140,13 @@ static struct clk_regmap fclk_div3 = {
>                  .name = "fclk_div3",
>                  .ops = &clk_regmap_gate_ro_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &fclk_div3_div.hw
> +                       &c3_fclk_div3_div.hw
>                  },
>                  .num_parents = 1,
>          },
>   };
>
> -static struct clk_fixed_factor fclk_div4_div = {
> +static struct clk_fixed_factor c3_fclk_div4_div = {
>          .mult = 1,
>          .div = 4,
>          .hw.init = &(struct clk_init_data) {
> @@ -159,7 +159,7 @@ static struct clk_fixed_factor fclk_div4_div = {
>          },
>   };
>
> -static struct clk_regmap fclk_div4 = {
> +static struct clk_regmap c3_fclk_div4 = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_FIXPLL_CTRL4,
>                  .bit_idx = 21,
> @@ -168,13 +168,13 @@ static struct clk_regmap fclk_div4 = {
>                  .name = "fclk_div4",
>                  .ops = &clk_regmap_gate_ro_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &fclk_div4_div.hw
> +                       &c3_fclk_div4_div.hw
>                  },
>                  .num_parents = 1,
>          },
>   };
>
> -static struct clk_fixed_factor fclk_div5_div = {
> +static struct clk_fixed_factor c3_fclk_div5_div = {
>          .mult = 1,
>          .div = 5,
>          .hw.init = &(struct clk_init_data) {
> @@ -187,7 +187,7 @@ static struct clk_fixed_factor fclk_div5_div = {
>          },
>   };
>
> -static struct clk_regmap fclk_div5 = {
> +static struct clk_regmap c3_fclk_div5 = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_FIXPLL_CTRL4,
>                  .bit_idx = 22,
> @@ -196,13 +196,13 @@ static struct clk_regmap fclk_div5 = {
>                  .name = "fclk_div5",
>                  .ops = &clk_regmap_gate_ro_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &fclk_div5_div.hw
> +                       &c3_fclk_div5_div.hw
>                  },
>                  .num_parents = 1,
>          },
>   };
>
> -static struct clk_fixed_factor fclk_div7_div = {
> +static struct clk_fixed_factor c3_fclk_div7_div = {
>          .mult = 1,
>          .div = 7,
>          .hw.init = &(struct clk_init_data) {
> @@ -215,7 +215,7 @@ static struct clk_fixed_factor fclk_div7_div = {
>          },
>   };
>
> -static struct clk_regmap fclk_div7 = {
> +static struct clk_regmap c3_fclk_div7 = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_FIXPLL_CTRL4,
>                  .bit_idx = 23,
> @@ -224,13 +224,13 @@ static struct clk_regmap fclk_div7 = {
>                  .name = "fclk_div7",
>                  .ops = &clk_regmap_gate_ro_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &fclk_div7_div.hw
> +                       &c3_fclk_div7_div.hw
>                  },
>                  .num_parents = 1,
>          },
>   };
>
> -static const struct reg_sequence c3_gp0_init_regs[] = {
> +static const struct reg_sequence c3_gp0_pll_init_regs[] = {
>          { .reg = ANACTRL_GP0PLL_CTRL2,  .def = 0x0 },
>          { .reg = ANACTRL_GP0PLL_CTRL3,  .def = 0x48681c00 },
>          { .reg = ANACTRL_GP0PLL_CTRL4,  .def = 0x88770290 },
> @@ -243,7 +243,7 @@ static const struct pll_mult_range c3_gp0_pll_mult_range = {
>          .max = 250,
>   };
>
> -static struct clk_regmap gp0_pll_dco = {
> +static struct clk_regmap c3_gp0_pll_dco = {
>          .data = &(struct meson_clk_pll_data) {
>                  .en = {
>                          .reg_off = ANACTRL_GP0PLL_CTRL0,
> @@ -276,8 +276,8 @@ static struct clk_regmap gp0_pll_dco = {
>                          .width   = 1,
>                  },
>                  .range = &c3_gp0_pll_mult_range,
> -               .init_regs = c3_gp0_init_regs,
> -               .init_count = ARRAY_SIZE(c3_gp0_init_regs),
> +               .init_regs = c3_gp0_pll_init_regs,
> +               .init_count = ARRAY_SIZE(c3_gp0_pll_init_regs),
>          },
>          .hw.init = &(struct clk_init_data) {
>                  .name = "gp0_pll_dco",
> @@ -300,7 +300,7 @@ static const struct clk_div_table c3_gp0_pll_od_table[] = {
>          { /* sentinel */ }
>   };
>
> -static struct clk_regmap gp0_pll = {
> +static struct clk_regmap c3_gp0_pll = {
>          .data = &(struct clk_regmap_div_data) {
>                  .offset = ANACTRL_GP0PLL_CTRL0,
>                  .shift = 16,
> @@ -311,14 +311,14 @@ static struct clk_regmap gp0_pll = {
>                  .name = "gp0_pll",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &gp0_pll_dco.hw
> +                       &c3_gp0_pll_dco.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static const struct reg_sequence c3_hifi_init_regs[] = {
> +static const struct reg_sequence c3_hifi_pll_init_regs[] = {
>          { .reg = ANACTRL_HIFIPLL_CTRL2, .def = 0x0 },
>          { .reg = ANACTRL_HIFIPLL_CTRL3, .def = 0x6a285c00 },
>          { .reg = ANACTRL_HIFIPLL_CTRL4, .def = 0x65771290 },
> @@ -326,7 +326,7 @@ static const struct reg_sequence c3_hifi_init_regs[] = {
>          { .reg = ANACTRL_HIFIPLL_CTRL6, .def = 0x56540000 },
>   };
>
> -static struct clk_regmap hifi_pll_dco = {
> +static struct clk_regmap c3_hifi_pll_dco = {
>          .data = &(struct meson_clk_pll_data) {
>                  .en = {
>                          .reg_off = ANACTRL_HIFIPLL_CTRL0,
> @@ -359,8 +359,8 @@ static struct clk_regmap hifi_pll_dco = {
>                          .width   = 1,
>                  },
>                  .range = &c3_gp0_pll_mult_range,
> -               .init_regs = c3_hifi_init_regs,
> -               .init_count = ARRAY_SIZE(c3_hifi_init_regs),
> +               .init_regs = c3_hifi_pll_init_regs,
> +               .init_count = ARRAY_SIZE(c3_hifi_pll_init_regs),
>                  .frac_max = 100000,
>          },
>          .hw.init = &(struct clk_init_data) {
> @@ -373,7 +373,7 @@ static struct clk_regmap hifi_pll_dco = {
>          },
>   };
>
> -static struct clk_regmap hifi_pll = {
> +static struct clk_regmap c3_hifi_pll = {
>          .data = &(struct clk_regmap_div_data) {
>                  .offset = ANACTRL_HIFIPLL_CTRL0,
>                  .shift = 16,
> @@ -384,14 +384,14 @@ static struct clk_regmap hifi_pll = {
>                  .name = "hifi_pll",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &hifi_pll_dco.hw
> +                       &c3_hifi_pll_dco.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static const struct reg_sequence c3_mclk_init_regs[] = {
> +static const struct reg_sequence c3_mclk_pll_init_regs[] = {
>          { .reg = ANACTRL_MPLL_CTRL1,    .def = 0x1420500f },
>          { .reg = ANACTRL_MPLL_CTRL2,    .def = 0x00023041 },
>          { .reg = ANACTRL_MPLL_CTRL3,    .def = 0x18180000 },
> @@ -403,7 +403,7 @@ static const struct pll_mult_range c3_mclk_pll_mult_range = {
>          .max = 133,
>   };
>
> -static struct clk_regmap mclk_pll_dco = {
> +static struct clk_regmap c3_mclk_pll_dco = {
>          .data = &(struct meson_clk_pll_data) {
>                  .en = {
>                          .reg_off = ANACTRL_MPLL_CTRL0,
> @@ -431,8 +431,8 @@ static struct clk_regmap mclk_pll_dco = {
>                          .width   = 1,
>                  },
>                  .range = &c3_mclk_pll_mult_range,
> -               .init_regs = c3_mclk_init_regs,
> -               .init_count = ARRAY_SIZE(c3_mclk_init_regs),
> +               .init_regs = c3_mclk_pll_init_regs,
> +               .init_count = ARRAY_SIZE(c3_mclk_pll_init_regs),
>          },
>          .hw.init = &(struct clk_init_data) {
>                  .name = "mclk_pll_dco",
> @@ -444,7 +444,7 @@ static struct clk_regmap mclk_pll_dco = {
>          },
>   };
>
> -static const struct clk_div_table c3_mpll_od_table[] = {
> +static const struct clk_div_table c3_mpll_pll_od_table[] = {
>          { 0,  1 },
>          { 1,  2 },
>          { 2,  4 },
> @@ -453,25 +453,25 @@ static const struct clk_div_table c3_mpll_od_table[] = {
>          { /* sentinel */ }
>   };
>
> -static struct clk_regmap mclk_pll_od = {
> +static struct clk_regmap c3_mclk_pll_od = {
>          .data = &(struct clk_regmap_div_data) {
>                  .offset = ANACTRL_MPLL_CTRL0,
>                  .shift = 12,
>                  .width = 3,
> -               .table = c3_mpll_od_table,
> +               .table = c3_mpll_pll_od_table,
>          },
>          .hw.init = &(struct clk_init_data) {
>                  .name = "mclk_pll_od",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &mclk_pll_dco.hw },
> +                       &c3_mclk_pll_dco.hw },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
>   /* both value 0 and 1 gives divide the input rate by one */
> -static struct clk_regmap mclk_pll = {
> +static struct clk_regmap c3_mclk_pll = {
>          .data = &(struct clk_regmap_div_data) {
>                  .offset = ANACTRL_MPLL_CTRL4,
>                  .shift = 16,
> @@ -482,20 +482,20 @@ static struct clk_regmap mclk_pll = {
>                  .name = "mclk_pll",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &mclk_pll_od.hw
> +                       &c3_mclk_pll_od.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static const struct clk_parent_data mclk_parent[] = {
> -       { .hw = &mclk_pll.hw },
> +static const struct clk_parent_data c3_mclk_parents[] = {
> +       { .hw = &c3_mclk_pll.hw },
>          { .fw_name = "mclk" },
> -       { .hw = &fclk_50m.hw }
> +       { .hw = &c3_fclk_50m.hw }
>   };
>
> -static struct clk_regmap mclk0_sel = {
> +static struct clk_regmap c3_mclk0_sel = {
>          .data = &(struct clk_regmap_mux_data) {
>                  .offset = ANACTRL_MPLL_CTRL4,
>                  .mask = 0x3,
> @@ -504,12 +504,12 @@ static struct clk_regmap mclk0_sel = {
>          .hw.init = &(struct clk_init_data) {
>                  .name = "mclk0_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = mclk_parent,
> -               .num_parents = ARRAY_SIZE(mclk_parent),
> +               .parent_data = c3_mclk_parents,
> +               .num_parents = ARRAY_SIZE(c3_mclk_parents),
>          },
>   };
>
> -static struct clk_regmap mclk0_div_en = {
> +static struct clk_regmap c3_mclk0_div_en = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_MPLL_CTRL4,
>                  .bit_idx = 1,
> @@ -518,14 +518,14 @@ static struct clk_regmap mclk0_div_en = {
>                  .name = "mclk0_div_en",
>                  .ops = &clk_regmap_gate_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &mclk0_sel.hw
> +                       &c3_mclk0_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static struct clk_regmap mclk0_div = {
> +static struct clk_regmap c3_mclk0_div = {
>          .data = &(struct clk_regmap_div_data) {
>                  .offset = ANACTRL_MPLL_CTRL4,
>                  .shift = 2,
> @@ -535,14 +535,14 @@ static struct clk_regmap mclk0_div = {
>                  .name = "mclk0_div",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &mclk0_div_en.hw
> +                       &c3_mclk0_div_en.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static struct clk_regmap mclk0 = {
> +static struct clk_regmap c3_mclk0 = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_MPLL_CTRL4,
>                  .bit_idx = 0,
> @@ -551,14 +551,14 @@ static struct clk_regmap mclk0 = {
>                  .name = "mclk0",
>                  .ops = &clk_regmap_gate_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &mclk0_div.hw
> +                       &c3_mclk0_div.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static struct clk_regmap mclk1_sel = {
> +static struct clk_regmap c3_mclk1_sel = {
>          .data = &(struct clk_regmap_mux_data) {
>                  .offset = ANACTRL_MPLL_CTRL4,
>                  .mask = 0x3,
> @@ -567,12 +567,12 @@ static struct clk_regmap mclk1_sel = {
>          .hw.init = &(struct clk_init_data) {
>                  .name = "mclk1_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = mclk_parent,
> -               .num_parents = ARRAY_SIZE(mclk_parent),
> +               .parent_data = c3_mclk_parents,
> +               .num_parents = ARRAY_SIZE(c3_mclk_parents),
>          },
>   };
>
> -static struct clk_regmap mclk1_div_en = {
> +static struct clk_regmap c3_mclk1_div_en = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_MPLL_CTRL4,
>                  .bit_idx = 9,
> @@ -581,14 +581,14 @@ static struct clk_regmap mclk1_div_en = {
>                  .name = "mclk1_div_en",
>                  .ops = &clk_regmap_gate_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &mclk1_sel.hw
> +                       &c3_mclk1_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static struct clk_regmap mclk1_div = {
> +static struct clk_regmap c3_mclk1_div = {
>          .data = &(struct clk_regmap_div_data) {
>                  .offset = ANACTRL_MPLL_CTRL4,
>                  .shift = 10,
> @@ -598,14 +598,14 @@ static struct clk_regmap mclk1_div = {
>                  .name = "mclk1_div",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &mclk1_div_en.hw
> +                       &c3_mclk1_div_en.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static struct clk_regmap mclk1 = {
> +static struct clk_regmap c3_mclk1 = {
>          .data = &(struct clk_regmap_gate_data) {
>                  .offset = ANACTRL_MPLL_CTRL4,
>                  .bit_idx = 8,
> @@ -614,7 +614,7 @@ static struct clk_regmap mclk1 = {
>                  .name = "mclk1",
>                  .ops = &clk_regmap_gate_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &mclk1_div.hw
> +                       &c3_mclk1_div.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
> @@ -622,38 +622,38 @@ static struct clk_regmap mclk1 = {
>   };
>
>   static struct clk_hw *c3_pll_hw_clks[] = {
> -       [CLKID_FCLK_50M_EN]     = &fclk_50m_en.hw,
> -       [CLKID_FCLK_50M]        = &fclk_50m.hw,
> -       [CLKID_FCLK_DIV2_DIV]   = &fclk_div2_div.hw,
> -       [CLKID_FCLK_DIV2]       = &fclk_div2.hw,
> -       [CLKID_FCLK_DIV2P5_DIV] = &fclk_div2p5_div.hw,
> -       [CLKID_FCLK_DIV2P5]     = &fclk_div2p5.hw,
> -       [CLKID_FCLK_DIV3_DIV]   = &fclk_div3_div.hw,
> -       [CLKID_FCLK_DIV3]       = &fclk_div3.hw,
> -       [CLKID_FCLK_DIV4_DIV]   = &fclk_div4_div.hw,
> -       [CLKID_FCLK_DIV4]       = &fclk_div4.hw,
> -       [CLKID_FCLK_DIV5_DIV]   = &fclk_div5_div.hw,
> -       [CLKID_FCLK_DIV5]       = &fclk_div5.hw,
> -       [CLKID_FCLK_DIV7_DIV]   = &fclk_div7_div.hw,
> -       [CLKID_FCLK_DIV7]       = &fclk_div7.hw,
> -       [CLKID_GP0_PLL_DCO]     = &gp0_pll_dco.hw,
> -       [CLKID_GP0_PLL]         = &gp0_pll.hw,
> -       [CLKID_HIFI_PLL_DCO]    = &hifi_pll_dco.hw,
> -       [CLKID_HIFI_PLL]        = &hifi_pll.hw,
> -       [CLKID_MCLK_PLL_DCO]    = &mclk_pll_dco.hw,
> -       [CLKID_MCLK_PLL_OD]     = &mclk_pll_od.hw,
> -       [CLKID_MCLK_PLL]        = &mclk_pll.hw,
> -       [CLKID_MCLK0_SEL]       = &mclk0_sel.hw,
> -       [CLKID_MCLK0_SEL_EN]    = &mclk0_div_en.hw,
> -       [CLKID_MCLK0_DIV]       = &mclk0_div.hw,
> -       [CLKID_MCLK0]           = &mclk0.hw,
> -       [CLKID_MCLK1_SEL]       = &mclk1_sel.hw,
> -       [CLKID_MCLK1_SEL_EN]    = &mclk1_div_en.hw,
> -       [CLKID_MCLK1_DIV]       = &mclk1_div.hw,
> -       [CLKID_MCLK1]           = &mclk1.hw
> -};
> -
> -static const struct regmap_config clkc_regmap_config = {
> +       [CLKID_FCLK_50M_EN]     = &c3_fclk_50m_en.hw,
> +       [CLKID_FCLK_50M]        = &c3_fclk_50m.hw,
> +       [CLKID_FCLK_DIV2_DIV]   = &c3_fclk_div2_div.hw,
> +       [CLKID_FCLK_DIV2]       = &c3_fclk_div2.hw,
> +       [CLKID_FCLK_DIV2P5_DIV] = &c3_fclk_div2p5_div.hw,
> +       [CLKID_FCLK_DIV2P5]     = &c3_fclk_div2p5.hw,
> +       [CLKID_FCLK_DIV3_DIV]   = &c3_fclk_div3_div.hw,
> +       [CLKID_FCLK_DIV3]       = &c3_fclk_div3.hw,
> +       [CLKID_FCLK_DIV4_DIV]   = &c3_fclk_div4_div.hw,
> +       [CLKID_FCLK_DIV4]       = &c3_fclk_div4.hw,
> +       [CLKID_FCLK_DIV5_DIV]   = &c3_fclk_div5_div.hw,
> +       [CLKID_FCLK_DIV5]       = &c3_fclk_div5.hw,
> +       [CLKID_FCLK_DIV7_DIV]   = &c3_fclk_div7_div.hw,
> +       [CLKID_FCLK_DIV7]       = &c3_fclk_div7.hw,
> +       [CLKID_GP0_PLL_DCO]     = &c3_gp0_pll_dco.hw,
> +       [CLKID_GP0_PLL]         = &c3_gp0_pll.hw,
> +       [CLKID_HIFI_PLL_DCO]    = &c3_hifi_pll_dco.hw,
> +       [CLKID_HIFI_PLL]        = &c3_hifi_pll.hw,
> +       [CLKID_MCLK_PLL_DCO]    = &c3_mclk_pll_dco.hw,
> +       [CLKID_MCLK_PLL_OD]     = &c3_mclk_pll_od.hw,
> +       [CLKID_MCLK_PLL]        = &c3_mclk_pll.hw,
> +       [CLKID_MCLK0_SEL]       = &c3_mclk0_sel.hw,
> +       [CLKID_MCLK0_SEL_EN]    = &c3_mclk0_div_en.hw,
> +       [CLKID_MCLK0_DIV]       = &c3_mclk0_div.hw,
> +       [CLKID_MCLK0]           = &c3_mclk0.hw,
> +       [CLKID_MCLK1_SEL]       = &c3_mclk1_sel.hw,
> +       [CLKID_MCLK1_SEL_EN]    = &c3_mclk1_div_en.hw,
> +       [CLKID_MCLK1_DIV]       = &c3_mclk1_div.hw,
> +       [CLKID_MCLK1]           = &c3_mclk1.hw
> +};
> +
> +static const struct regmap_config c3_pll_regmap_cfg = {
>          .reg_bits       = 32,
>          .val_bits       = 32,
>          .reg_stride     = 4,
> @@ -665,7 +665,7 @@ static struct meson_clk_hw_data c3_pll_clks = {
>          .num = ARRAY_SIZE(c3_pll_hw_clks),
>   };
>
> -static int c3_pll_probe(struct platform_device *pdev)
> +static int c3_pll_clkc_probe(struct platform_device *pdev)
>   {
>          struct device *dev = &pdev->dev;
>          struct regmap *regmap;
> @@ -676,7 +676,7 @@ static int c3_pll_probe(struct platform_device *pdev)
>          if (IS_ERR(base))
>                  return PTR_ERR(base);
>
> -       regmap = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
> +       regmap = devm_regmap_init_mmio(dev, base, &c3_pll_regmap_cfg);
>          if (IS_ERR(regmap))
>                  return PTR_ERR(regmap);
>
> @@ -704,14 +704,14 @@ static const struct of_device_id c3_pll_clkc_match_table[] = {
>   };
>   MODULE_DEVICE_TABLE(of, c3_pll_clkc_match_table);
>
> -static struct platform_driver c3_pll_driver = {
> -       .probe          = c3_pll_probe,
> +static struct platform_driver c3_pll_clkc_driver = {
> +       .probe          = c3_pll_clkc_probe,
>          .driver         = {
>                  .name   = "c3-pll-clkc",
>                  .of_match_table = c3_pll_clkc_match_table,
>          },
>   };
> -module_platform_driver(c3_pll_driver);
> +module_platform_driver(c3_pll_clkc_driver);
>
>   MODULE_DESCRIPTION("Amlogic C3 PLL Clock Controller driver");
>   MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

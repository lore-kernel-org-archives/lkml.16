Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD0322B594;
	Mon, 12 May 2025 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075167; cv=fail; b=ZHowskn1q3nQwVZ1rGNz8/wyUmUHXjFEKsyKshJrVgWQvgbyZa0OxpBhEhg3cxhw6eigzirpl+AeDTW9+00PoM5LjATYS4nozMhoCeKoiyKRvT8VHARUG/tiEXpg/Jidj7a9yB8sTiqFuMmHemqb6oFk/KjyoSJ5tNNHWGKuQ4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075167; c=relaxed/simple;
	bh=efwucaYdkxWhxmQcTgfDBkdFudilsWYqmlKanNqw49A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IG5ExyBcYx/tD8j9hVlCdG6Xhbk+WouOgyfK1DM3bVAlMufPFVg1UArKaUBHJB5I7njfTCEw+hdLkln5HFmvg4qnCjM/wvCHJA3vus7i/ZQnOQbEDgE8JPzAFOGC1LYE6urDVTWk8BNy4MGK8c1YGsnvY5eNfECPVNuafksydTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=SYQym00r; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="SYQym00r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OieH8gcN2Squ5wxUatiUUG1X1rrrEiUdLAyZecvvWrauh01IuT0s5KKUbDNHUdJ9PUCG9Rhfkm2IBXNNvu31m8tvAW6/dljWwAgJwFSDrJMzwcymyhXKKbsTIl3dE42ScpSeej8wI8Tl3XO0t52HEs8d+KLVScz5lZupFOqs6EM0JOnlqqKNyN3qflukXlv0GfYnyI4PzJ4FOqauMqqkts9AhNxYFu7JTAfNweQNdyVlPE9LIXNCjeTcbOWiS2iShpLu0w3MWlTnx6HGq2szIGl8RN4OxDlHzcNM9scM8IL57ZYcRyaT6Of552h3CoiFcVYGnTosBJ5HHWpGFuF07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJG2tehhnd38GOinLn+2VKTZf29p208INcsv8GS/FKc=;
 b=JR3IP7mXOAKG9/vlUI+Chc6HAPjkkritf++kY0skgpsw5PSHSkHqF8IZWXBSjw5sHsRVJgvzrVKKhw2ttkS1aYgtxPMrKs4zyJjwPsAF/hkiQqeUms16CLZ2vxe2I4egHs8aDP7lTOgKTNxRT98hsOyXr5gho8CLI72YCpJmW6UxO7HSKMAJmkc4AvbUuBroD4mjw3U+AGdL2BlEzJpSQWJfARq72dXjGiuZob8LrY8rNpJ7d6NzpKAZ8EGrXUxStne5oY7V+VcClrYmgk9SacZy3xUf4NF+To9FqpiWlV9fZN0Z8Xz/Q2qqh0jmK9tzWOxuNPvBqDA0G3zWsjfbJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJG2tehhnd38GOinLn+2VKTZf29p208INcsv8GS/FKc=;
 b=SYQym00rhcSIdo/3GMpgX2Q4pwsfAIq8lNJQTpYSgwwh0gd/CfMxQ2lcvWFPliVdvWrhS46odMaR7FNg/iPwJiq6SM48Y/qM6KQQOdEI5neM1ZxqN8pP54TalJUxkgupRJn9odd0tGDEz49xKpakQEoS4JyJdJDn+eAQlQZ56R8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB6888.eurprd04.prod.outlook.com (2603:10a6:20b:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 18:39:23 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 18:39:23 +0000
Message-ID: <28165e16-ae7b-4533-ab9f-73ebe077ed92@cherry.de>
Date: Mon, 12 May 2025 20:39:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards
 from Theobroma Systems
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-4-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250508150955.1897702-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: b3400a7b-6e2e-4803-64b8-08dd91845084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGt5RnhXWHZNdHUvOHp4aTV0OE1QZUl2UDZyOFhJNTNtMmp4TkNod2hrcm5B?=
 =?utf-8?B?WWVhZytzV0xlY1F5dms2WmQ3dFdQd2tvR21aYVViNm9LM0ozbFYyNlQ3b01i?=
 =?utf-8?B?RjFKMG80QnRpUDZLOTBlZENIQlYyQjdDd3RPb3NtVVlVMzZuT21JS3h6TS9S?=
 =?utf-8?B?TUl4bDZ0ek9NYmlzcnI2Rml1cHhTemxaMzNOZlUwaGJFSUw4eU9RN2VjOGp3?=
 =?utf-8?B?MGNHWVhWTldtRnZodW1vVkdnWG1UWGtISUFMSTFGb0VSUGRsOWp2a1pjelZ2?=
 =?utf-8?B?dGZtMUU5b3RYMDJDOXdDWDJYSTlCYmlhRGI0MS9JbXk4anZsSDk5ZXdrNDlu?=
 =?utf-8?B?cjk3MFJaNmRZQy9ERzBtcXNQWHd1cFpZR0Q3UDU1YXhvemVkYkQyME9yQ1FY?=
 =?utf-8?B?VVJpMlBUbWRPL0QyNnhFUW9odEx0Y3RKQ1FvYUtiUzI0VzZYWlMwSnFENkRh?=
 =?utf-8?B?V1A4NEtZNlNVbnVjYTZIR3o2S04xQkFjL3hCVEhqc3gzWnArOVlGcnFQVUZ3?=
 =?utf-8?B?L2pWMFFTaFY5cmtDb1ljbzVtNXJISDlhOVJEYzhFQytPb1ZCVnQ5TW5Veklm?=
 =?utf-8?B?Rlg3K05vaW1Xekp2TEI2VFcxMnJ0bzNMTjFIOGZCakU2MlRDby93QjdHRGIv?=
 =?utf-8?B?UTNHcCtDY1hpazQ2SnVka1VBUnZPYy9FZUlWcXlrbnNmVDNINkYvL0VrU1NU?=
 =?utf-8?B?S2FZbENJTFBuVDloZitPWVQzOUd0ODdKc2FjV0oxaUZ3QmFJTlN3dFVLM2g4?=
 =?utf-8?B?cElGOTZxWFdPVTY5YkVTK3FvSFVjWE5DaXJ3UjJQVzN0TGs1ck84TEhyaGJu?=
 =?utf-8?B?U2syMy91Ujg5Zy8wZDBOTTBYblU0dUZaaENWL3B2VW94bGV5N3BEMFE1Mms2?=
 =?utf-8?B?eklDckFLZTlqQVZsVTg3dWNtQnZEVXRDSW4vclVXd2lyQTlib0Y1SWh3Rk1L?=
 =?utf-8?B?VGJMWk50OUVIb1Fnc1IxYVNWSk9BSk1OdnFLbzZKcUNQOU95eVdtMm1sN0tu?=
 =?utf-8?B?UlJxNWdwZitWSGJCbEtMNE5iZTRBVitIczZoNldBY0QxeWdrMGZ0UWNUeSs0?=
 =?utf-8?B?eGFEYzI0b05JemxPVjlmRkJjOGdVTG1ZVXIrSlhSSWhKTGJDcnBlMTNrT1dz?=
 =?utf-8?B?T1BNMndlU1kyT2ZldTN2bWtLd3dHWEt0YjFLWXhjZzdCOG44RWpNRHdxdmFO?=
 =?utf-8?B?a1RzekE0MkFEU1d1dXV1Q2ErSkZ4SUVsb1l3OVcyY1VEVzYwVTVUWUl1c0Vq?=
 =?utf-8?B?TmJ2RmFBQURycE9jSFNSYVR2dmk4TnRGRGhjV2xRQVFZTW1KckxHcmhtbG5l?=
 =?utf-8?B?L0RVNVBwelNFOEh3VTJBQy9wTTRjU2hPaGtWVnQ1Tk9wUUZwVGRyWG9RbGdm?=
 =?utf-8?B?aVpRTENMdWUwNUkrbmM4WGtWTVpPSjU3YW9ZVnhseDBmZTFVSTlxVkRzR1Fu?=
 =?utf-8?B?eVpFMUwrNkQ2c2VleEdpQjBZL09qV0oxY3hEd3Vnb0ZrVUhCOWlVZS9zMjY0?=
 =?utf-8?B?M0daM1pBdllPYzZnMGtGVjJrUDVOUFRnNmVONnluakZGQUpDRmhJVFRubU1j?=
 =?utf-8?B?RnJRdXhlbkVOV3NBL2REdUlEb0RHRTJKTEduYXUzeGUxMU5iQktWV0ZUcDNV?=
 =?utf-8?B?Q2YzNkMzZGZ4eTUyVkRGdVZJb0xja3IrQzVRMlc5SjFMeFI0MEtzUzQyQ001?=
 =?utf-8?B?OE85Q241SURlczB0RnVKZW9WVG1GbklxejhxYit0ZDZ3Ni9OVytkV2xtNS9J?=
 =?utf-8?B?Q3EyQjNGTVZIa1M5bWVOVmc3Mm1NMnk2Q3VqQ2UzMWtWRXByQlFoRThuck5P?=
 =?utf-8?B?b05GcTNFWmVmYm5rRW1MUTVNM1JPUHl0S3VWbjZQKzM3MzdiZGF6c3phUUhv?=
 =?utf-8?B?UFJob2F5QnMrT2V1VW02ZzluNTJoNDJuMk9PL1VBU0dnM21JR0RqVko2WFFv?=
 =?utf-8?Q?DyIk4+ctxzQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGJqRy9oYk5OMTQwVUVaa1huM2RERnBXYW9jM1hocmR5RzZVQjZWWHg4c2NF?=
 =?utf-8?B?QytwVHBibHRDZG5DREtRcERyUG5JTWNUbGtxYmw4aHRMeDRLS3NKdkhmZWVz?=
 =?utf-8?B?SHFjclhCcm9CU256Wjk3cUxNQy9aTnBFYW84L1lpZjRmVDkzN1YrRE1KaU13?=
 =?utf-8?B?N2x3MTh5aTljTThIL0VPU0hwUnZvVzI5VVJQZVBXUTZ3d2JaSHdnNEl2S0Jl?=
 =?utf-8?B?bjJtOENFVkFjUkVjOVRMbFE5S1dJTHBWT2NxV3JETmwzdHlLZ1JWYkNJbnJk?=
 =?utf-8?B?STNEQXAzdkJzN1hQN3pXSVZYS3RnUWZWM3V3eVJuRW5NTzhPN2lmMFpGRUJJ?=
 =?utf-8?B?OXExSjNZWDUxM2FSeTJFd1R6dHhZUjhORWJSZkFBQlN6ZFVMTHQwZnRxd09n?=
 =?utf-8?B?b3BPc2FtWjJqN1dmb1RhWWR5ZkxVZ3NkMTdGVUpUWTdzcmR6WVRVREdtZUxU?=
 =?utf-8?B?VGFWeGZJNXZTSlFaZEZZc1NzeDVhbWZZazFsM3VIaU9OR3MxRzgvWFB4cS9u?=
 =?utf-8?B?RFlaRDEvMi9hZlZuWkRRNUhXdytmeE53K2tvRXMrcWsxbWM5d2VEYlNWclhs?=
 =?utf-8?B?TUx0NFYxNTFPUmo1UGg5cmg3TDhLYkY5ZzBsUWJpOHZBK3lYemZMWU9XdFNM?=
 =?utf-8?B?ejVLL2JvS3JYOGhKTGRLL1BTNFpwNzJVdzR5RlBOOXRac0tNVVRpVEdoVk8y?=
 =?utf-8?B?RE15Sk9OWEhsQnVURTB0eFdzV3pUdGhWV215bVlmQUEvd0d2c1k1MHEvbU85?=
 =?utf-8?B?YlZmRlRXZWwzdUVzQTMrUEdIeS8xNy9UdmVoZjh0Z212aHNTOXdDT3NVSXNl?=
 =?utf-8?B?Qi9oYmVycXNiZE1leXNjK2tnSVBlK3JtVU41aEhUT2tVUmt2YUhLVWZ5MVl2?=
 =?utf-8?B?YnI2L2xGL3UwYXNBVjd5WFZKNDFRUm5GV1dQQnlZTGd3TjVDYnYzb2x6anRD?=
 =?utf-8?B?MWVpQmRKVHJqMG9ydU95OFlQRkFFOEk2aTMxdndwMXBwTUdOSnJsK1FMY2tP?=
 =?utf-8?B?K1M5NEx5SDUyNEtVQ1RLakNCKzh0RkhhcmczbDlqeEVRWXl4OWNTd3VrS0N0?=
 =?utf-8?B?UTVlTkZwM1pReVo2a00rT1A1eUprYWFad3AwRkdZSjJ3L1doMmp5TDgvU2Q2?=
 =?utf-8?B?U0E4STBXWVBEam10bVNxZFZiK3hUbWdhak00aWJTbkw0ekpRaFhXcHQ1TkRI?=
 =?utf-8?B?bDFscUlBU29DRFRNMnpLWW9Ya3JIWUNyQ3hBbHp0U1dTbTRpUlN2ZEVCTW9J?=
 =?utf-8?B?NnJxSlQ3NnJybml5cE01YmhMNHYvWDMyQzNYY0NOUkxzOFg5MWVucW03TGR1?=
 =?utf-8?B?dVYzNEZVSVF3eHoxZHRGSnBJT2tGMklFQVpKcjBFdEY0S1VrL1o2bHgrOUh3?=
 =?utf-8?B?U0pvUkMyZDNKSmo1WGkrWDFzN0FZSnpDQXNYd3JTVi82ZjV1enZoM25nTTNI?=
 =?utf-8?B?bWowVS94ZDY3WFpFR1dvbkJROXAramkrY0JDT3RBNk5NdE11Z2xhMEZYTXdi?=
 =?utf-8?B?VWJoejZWVG5leHRwTmljc2ppM1BndUFQN001NndYS1BaSkFpWXFyOHFHeDNs?=
 =?utf-8?B?NE5PdkEvTHNoYmlHelJ5MG1jNDBieVlIMEcvZStNV3VJWmx2VGQ4cnFHT0Fy?=
 =?utf-8?B?N21KSmhRVjY5SUdESTZEVDV2R3NFdzdSc3BBVmU1SnRCUXJMUWZJRGw4bERq?=
 =?utf-8?B?WjIzeGdzZ21Cdnluai9nanFSbFRkKzZoLzFTME82UU9LeE9URVVGY1dJbkpT?=
 =?utf-8?B?YnNPc1V4L2FSSWpWQ1doUFBldWk1eFBYcXlNeTFWcUFqcFZKbVRxRjhVdG1I?=
 =?utf-8?B?S3BjTFVCbER6OHlTSmRlSzM4bUJKN0FpTzRmTFRpMjk5akgxNWVGaDNmUFg2?=
 =?utf-8?B?NVBVT0xoclFtSEFSK0EyOGN4QWE3ZU9odCtNdTRmQW51b1NKdWhoNFFsZGRa?=
 =?utf-8?B?SFJMQmNPNncxUTE0SXNCZFNLRi9MZUlQbkR6VkZFdTFVb090ekNQUDIveXZo?=
 =?utf-8?B?K215b0NjSnpJalhHQmVUaC9hM1lFNDJOQ3dIT1dtOTRJNVF1Q2doNHJESGpT?=
 =?utf-8?B?U3gwVE85NXIzVCtsa2dHK0U1MFFPK2FtUEM5dlNQdlpvU0RRbE0zNkpGRUxJ?=
 =?utf-8?B?M3ZBb01ybXpOMWlTcXJGSjJsQXNCNmtycnFSalM5RHlKZUdzTzlWWnNpVk5s?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b3400a7b-6e2e-4803-64b8-08dd91845084
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 18:39:23.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cp0hndLB68pFFLD4Kgb5AA9Cgfh1skhCAv/h7h1zYoA9eRPGtH1uv5aAIEENNXCCZu0joaST3npEbMCJGxDabARj9oJ9i4xAHatT3t0Qqc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6888

Hi Heiko,

On 5/8/25 5:09 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Cobra are Touchscreen devices built around the PX30 SoC using
> a variety of display options.
> 
> The devices feature an EMMC, network port, usb host + OTG ports and
> a 720x1280 display with a touchscreen.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EDF254B1A;
	Mon, 12 May 2025 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037554; cv=fail; b=N7wG5IVGwC4R6lzuCcEw9fq4E8mZwXx19+/Hs9xqKnnqbHFD10K1VFddyjAolpAeAJnJa/cIqqw60Xh9iNhkVtZopnDXiZ6KMGpQKJl49eq6sjH3+9LBo9j/KmiIlYLLPUCbhyham5l4/6u6U0DrrkYtbNQ+0p8wUFRhp0EnWc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037554; c=relaxed/simple;
	bh=ZpVrTJa94gK45uFQFWVvvW8BLcNqeH2BjvMC5zFXOxk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dPoPHmV9S6DO+N1qa5fx6i60kpFiepjeb44hHZ4rGbi8jDwfL7A2j6iP6tk5UYUPUBCwCFWSDXBlEqkvuM8SnxvZGvlJvi+3HRclTHS/SxNnSg7NDvZFUCUO+XWj0+acQWs6FrtcpnyKz6+k1u7eNn0yWkH1sEpo4t23Bd5fthY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=VVHGOtQT; arc=fail smtp.client-ip=40.107.20.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="VVHGOtQT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpMJKaR+CQwsxFglXRYbALH9woBUEqPJkAjrVTwlLtJwZOkZtMb/f6hY3E/1OrPjG0f+f7H9FdwHgFeRmgTz1I1YqoF3yH+Kcf+gSI0HEmcc4ZuSQsUJQG6jQBrg1ltUDcqPtC1gbhQqKuxRc3q2E/2VwQ3rFWx+/ZdvN5z60Qw9uqbfCDPDNIvQi2YyKM50puP5XWxMnqVCs0CYQL6lPcXwa7CH3S3K0b04VV4Kg2bILPJLYeXF3hULebdkJA2BVe7RAUM/otGHkpkj3l8dLsdV87lAmtUhsAeHGOQeRstLnNG1+9KFUAQOg6QG2tnceEtC8AT1lEhaZzOAD5GUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZ/5BOSTWAMa2WJIQ77i3kZR4bfrG91Ln+fJyAPWe/I=;
 b=a6qd42ylAy7FnK2Sksv+73kZ0FlQ6ehIobyfWEWDWgL22ksz8i7Pvtznvg+JY6Dr5KBMZ7tH9uUCMe452Prrl32qJImgmKNezfC19xluSu8JLnu4Mag7AW1yL6fnVopHCPhMeFhG1W2sDgcYcEEVvIfj0BT81DLIH0b9k88QGC8E/Jh1isF3WldCyfEDDcvUQu9S6ist3QoVpunxlU3vBHwOXdS1kvzZYDTdNm66s97X7wZ7/Tj0Ad/xRdXne9x6+ap2O5wB2fkQcQcGpW8XBIITJi5rjud0TI0bA286wuN1fVFfykaqraDfIwV+lbu2mHGWG5+KezsLTfDiBbAxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZ/5BOSTWAMa2WJIQ77i3kZR4bfrG91Ln+fJyAPWe/I=;
 b=VVHGOtQT/eqg8KJUSsz8Wnqpc/wkS8e/Datzn98Am76HxP9XVL8vJ9JTRSW+/OJNrkkQdpLOu7a8k/6zSjCtEDk2yxbbVOAS4BMsuaS1VR81QTSVeygoMJdGiS0top7FQUW7IUWDd0P6H9VpmwcYbppMz4pMFC5NPxCwuC2X0dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 08:12:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:12:26 +0000
Message-ID: <e3339dfd-7d79-4d86-b522-d6b31976cd2e@cherry.de>
Date: Mon, 12 May 2025 10:12:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: vendor-prefixes: Add luckfox
 prefix
To: John Clark <inindev@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250509122637.26674-1-inindev@gmail.com>
 <20250509122637.26674-2-inindev@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250509122637.26674-2-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 965f9c39-7f4a-4773-b398-08dd912cbafc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGxRd2NUd05xVXBZYXZnTXJKNjErQURPWU4zbTdBS3RJTFpMTXZ6cVB4cXRS?=
 =?utf-8?B?MGcyV1JqQ3FndmxJMXlPWWF1RDNTYWhpZWhRUDh4VDNxYzVMTVBYT2tkV3hJ?=
 =?utf-8?B?ODBkbUJJU0dNaHpzcDhuS1dHbzRuQ21ZQzgzUlJWbkdabW9xSWZQdUdTaFUy?=
 =?utf-8?B?ZVF2bCtHVXN5dlpjeGdYSS9nNklwMjJrVHo0VzBNVXFWSldpelBlcndZUHV4?=
 =?utf-8?B?Vm1BeDF2MmhGV3VSUStTSDN1QzVPNGlJUmNIRGg4blpWMmZTa1IrS3lWbVo0?=
 =?utf-8?B?ZmZ2Tkp1Vk1wUGllbDhjd0tqZit3YmlocEZPbGc0bkd3ZlordUhJdmhrNUha?=
 =?utf-8?B?QWc5bFdCMVBTMkgwWWlGM0h3YThOZGozR1U1blg2V1B6amNmSzBoOEdiRmRZ?=
 =?utf-8?B?WVp4Mno3Ymt2VUFPdUNncFNhQkRGdjRzWnA5K2x5VmI2eHVNTWZKMUhiUEhD?=
 =?utf-8?B?Z2s0K3FYYVNQUjVzSmpReHZ2aDZicWFqVW8rUUJTd3FpVWN4VnZvV0xDeVFE?=
 =?utf-8?B?QlRXUVIvWFNVNXdZT3BFVlQ4b2F3TU5GVWJSMVRJN21sdkg2YmV5WkFveEpL?=
 =?utf-8?B?dmdXL1gzcDhWbXBoWGlqcmluSVZDYnZVRGlzWUIyMTNMR05xajgwMVJSVlBi?=
 =?utf-8?B?Tmhua2VVS21zb21jdjFSNHZkbmFhVlQwU2ZoWHpjRzMrbUZtVEtqMjMzdFVX?=
 =?utf-8?B?a0dMMm5FSUREbDMvQmFSREwxQjI3eTdlV2c0QzA2d1VPazlCZXJjOVMwY0VT?=
 =?utf-8?B?aWZPbk5HeFdVWVRPak5tOEhPcFY2Z0FmOEE0TW5GT1lKS1lBZHRkUkcxRlNV?=
 =?utf-8?B?U2U4NVp1RDk4aWk4WS9WRGdqcUVlbG1IZ3JzaVRLRDVjQ3ZScTRwNVQyTFJW?=
 =?utf-8?B?bHlackxlMzU0M0RyTWlVd2RxNmo1WDc1L0xYaWp4UFB3OWtyYVB1NklsREJT?=
 =?utf-8?B?M2twVU9RWkliZ25CT2w4cnVrdXg2WVNmL0ZLaUhkeG1EcGxsQi8zSXFVQy9i?=
 =?utf-8?B?cXJLRjF3eU9hWU5yeFVtQjI3ckwyaEwxamxFZXpJcUZocjBIQ3lHZ0tPMDdl?=
 =?utf-8?B?MWErcHFROGw0N2lnNHJ2ZTJGMVZDeFpPOG1KY1FSYUVSV05UTXEvZlF6cEVC?=
 =?utf-8?B?c1lvT2g4ZEQxTlA5SnFtSFVFV0tmMmZBMTFaQmNVK0FhZ3hqWjNNU1NIb1Va?=
 =?utf-8?B?L3ZYcXZSVUtydC91NzJSWUZ5VGZUdGhXQi92S3VCdUJlOGJjeUJ2c2kya2xO?=
 =?utf-8?B?VFIydGdmeEtVdWRtaHFkL0RacFVEeU1EMnk0QU8zR2c5WU5abE1ieTFqNTFE?=
 =?utf-8?B?eHlUSHpnejg0ODVCTnBkZGpsNW9ZdXN5OTlHOVl1N2RYSnZmak1zVThqcTlK?=
 =?utf-8?B?dkZ1cmxNWDNPRDU0KzNSeGttRmtZS0lYZCtnTzVkdE9Qam82dEtXR0hhYkFo?=
 =?utf-8?B?WmRubm5LcDcyekZKc25QT2dYbkJBenVIVml3UWt5Q09KSHdXdzUvZ3ZjeFRH?=
 =?utf-8?B?NGpkUHF6U3VJOFRTcDBST1IwNlJETERCK0g3TDNNSjRoalpDdW95d3FQWmJz?=
 =?utf-8?B?N3FtUzRid0hoL0JsWWJ0bGhvMVkrcU1ZVFlya0g4Wk0zNlZmeENJVHdhRHJD?=
 =?utf-8?B?L0lyVkkvN0dTRkxEWXBiRjlSajFtOEZLVUpaMXZwczNVcExwRGlNWHp0ZnA4?=
 =?utf-8?B?NXhTOVpNbDdZMDc0NGF6ekJnWDYrUVlIdE9yR1kwMGFxN25QVEttcHhKWWdL?=
 =?utf-8?B?R1NVaEFMN3VzWDNNWnN5bFNmaEUwM2NxMjNQWVZkbkY2K0YrL1VhbnAzbklK?=
 =?utf-8?B?TXg2QlVaOXFoM3JHK0VhNVA4RVN5NjVPWFdRelhja3ZoeGtrNGw1Wk1RL0tl?=
 =?utf-8?B?dTFkTzFyQ2RpOGVoZEJqWHF2OUpWOU4rcTVLc3FDdE9OZndIV1VmUVlhS01Q?=
 =?utf-8?Q?H6uD/GyTK44=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU1PdW53czkzbHg2ZEQ3WFVjcFBqK1pPWTVvOEhpdzFUMVZHeUNSRWRHSlgy?=
 =?utf-8?B?Zi9YK0pvdWFMUGpNTmNPNndYTE1pQjVGTlgwWWV3aVBzUUtjaDlXcTZ3QkVh?=
 =?utf-8?B?RTV5RlNFUXdGcG1peW9WYWErTTdNcUV6RHQyVnZtd2Z4MzhIS1ZSb1NHL1I5?=
 =?utf-8?B?emxUcjlObnppV0FVdG5yTVF5U1YrcVdFSHd3WDFRNmxmUEpLeWxQWVdhUm1B?=
 =?utf-8?B?REJvWEE3a2hLTzlSbWlxemk4c3ZVRFJ0VjcrbEdoYUZGZ3N6OWhmUk1KYzBk?=
 =?utf-8?B?aEx3SXdNNG0vcWZhL0xuTXF5ZGo1NENBVU9qL1EyUzhGMHE1SHR6cjhWQ29r?=
 =?utf-8?B?VUJ3NzFHMlphWmlBZUdHUzlSem5zL3p6cjhHZUNDSFdvSWlvQXBuTzdQMytT?=
 =?utf-8?B?WWtnbzY4SjZ0bFRLNGlyTmgwMllwK0pHT2NSRithV0VHL1hWYlJvR3AvT2Vo?=
 =?utf-8?B?d0VmR3RwbHlZeldzVkRqMXlESnIwK3dxUXF6MHdOWHE1dlNqVlRiREV1cFJl?=
 =?utf-8?B?NWp5SFUwc0hBTCt4RUc5TTd3d2xyR2w2cUpMdVhxQldReEE1TkNDdmducElX?=
 =?utf-8?B?MHNpS2hmd3FTVjZkaVpjUGlTbDBKMENnTHJaQW1MYkFVYjM2MnNUME1mYzhB?=
 =?utf-8?B?YUJOekVYeGp0VTExT2VudzJmbkE0YWhQejF2ck50YVJSS0Y4Zldna3pLNzRE?=
 =?utf-8?B?d0lRQjVSVkllc0twSFdkMjd6anZOZTVIcHZOc3gxK2dsWTNpbGFJaUMxbDU1?=
 =?utf-8?B?aGZ0cEk5bVNFd0lmVnA2VlNaRW9acWhnN09kckFmYUtZY0xmdGhQbThsUDZu?=
 =?utf-8?B?ZDRXQy9lQ2R5elFDbE4zRnFHZzNIU0NQc2xJNC9jR00rNjFxUlhScU4wWUV5?=
 =?utf-8?B?N3JJL3gyK0t3U0x3bW9wc1RodGtKRy9sTytoUWdhNDU1U0FHSmVwOFUrK09F?=
 =?utf-8?B?cGdhZzNkampqWU00cnhFT1M3Vy93enltOHZrelM5WWhkTTRXSmhzV1RyZUVD?=
 =?utf-8?B?TkMzRyttZ1Y4WVJjaDRvZjQ0YTVwVi90MGFZcy9BZXRwUkVtUFN6OVRFNW85?=
 =?utf-8?B?QXRkL2RpWmFoUDVaa281RDU1eU9FVjVDR2ExZVZqVjk2bHpraDZBSFhjMllI?=
 =?utf-8?B?YW9oTmRXVVhMdklqNHlIYVE2V3p6czRYdDRtaVpLdERnYm5rdDljd1Y0bUxi?=
 =?utf-8?B?V09uNyttYkZNTWk3a01yYUZYalJpc2FGdEQ5YzV6OEM0TE82WU9mZG1qekN1?=
 =?utf-8?B?bTRhTGxPVTdZZWxIbVM2d1Y4NDM1cGtSOWNYVndCR211NWVxSDFxTkd6QU9H?=
 =?utf-8?B?M2JSdW1Fa3FqaTdSaXl0Z0x1REQyRkNUK25aOE9CL1YzamZ6RTFzb0NPVTYx?=
 =?utf-8?B?NmhQYXJvYVpCZ2hwY2NZdkRCRlExQkFackk0cDVjU2VOajVVZTJlV2I5alM4?=
 =?utf-8?B?WUdxYlVOTi9ZcjFmcTZpc1pWdnN4c3Qwa0lPYk1JZU5NclEwOEhCNnBOVW1N?=
 =?utf-8?B?WTRKREZqM2kzTmwwRUNEeTVocERzUmduN0RWbmNnbDBzS2szNTU2TVVhNE9M?=
 =?utf-8?B?UDA0bFFUWWNNM1ZzbWlhNE5lRkxmVXRLOWluOVBqMGs2MzN6cFIrSXQxTUM1?=
 =?utf-8?B?akxzSkloK0s4dlZmOTRhVzVhM3QzdHpWeE1vQWErUVFmUDNKd0Y4WFlYVk4w?=
 =?utf-8?B?ZmhINDRrT0xPV2ZvcXJwcWxiNUZrZTdsU0NQVVFMQ0xza0tBeTFVRHZQanFJ?=
 =?utf-8?B?ZVN0dG5jUnN4d1VBemtyK1FDRkZMY3hrbWFhd2puNDIya2JxTVR1eGFlUW5Y?=
 =?utf-8?B?YTN1VGtDS3FhSnRqRXhMMGthQ1JtTGJWTXIrTlFId0cxNEdZYkdaZVVlWmQ4?=
 =?utf-8?B?VzBBUmx5Mkl0b0FVa2I3eHVuR014eHc0L2p3eXIzcE9GYnc3b3hsOFRzeC9Z?=
 =?utf-8?B?NDJyQjVaM1pGVnpISjhBS1c3TDBXSVJNZnZzSUEydWNLeVFIYTQ2Sy9VTlBo?=
 =?utf-8?B?Sm9qaWpWY3hCTnZGUjNxdVY1eGVMSzVLTDVpNnFLLzJoT3Z0ayt1cEwwU2Ur?=
 =?utf-8?B?OFh5WUhDUVlSSUZaTTRyQ3V5dk9XaENITzhZa2YzTFBqY2hKR3ZnQXp6VGhL?=
 =?utf-8?B?dUwwc2tWcVIwTzc5ZzNzendwYWdZWTJ5VnpLY3B4OHQyOEtHbWZSRTJjZ3Ur?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 965f9c39-7f4a-4773-b398-08dd912cbafc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:12:26.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXXtVKNFePjFjMz+VunmfkKlYfPp6YEXE+uLGoBRUjsieZczkd7jQHrzHr+mAZpqsqppj7QJ6A2MaSXuWGgUdeMRBKe445LCq0EF8n9gxFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

Hi John,

On 5/9/25 2:26 PM, John Clark wrote:
> Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
> produces development boards like the Luckfox Omni3576.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 86f6a19b28ae..9391e0c31bb8 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -892,6 +892,8 @@ patternProperties:
>       description: Liebherr-Werk Nenzing GmbH
>     "^lxa,.*":
>       description: Linux Automation GmbH
> +  "^luckfox,.*":
> +    description: Shenzhen Luckfox Technology Co., Ltd.

Looking at the file, I think we order the vendor prefixes alphanumerically?

So this would be the wrong location for this new vendor prefix and 
should rather be between lsi and lunzn?

Cheers,
Quentin

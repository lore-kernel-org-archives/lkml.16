Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E855221DB7
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897943; cv=fail; b=Q5UBDdcNHc7nrIEimLH0Dj49CFq0ahOu7z+c8XChXusxjsWFaP8ygFzhbmRiTQlwzD8ApPdpNkiQjmmN/EviROMQyfUzzbUzxd7sWF/sK08mQl4oOYqu7dO3+2HrosBum7KMVNNgu04zoHkNDaSMj/5t+MBCcjp78DrfwtrK6TI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897943; c=relaxed/simple;
	bh=gD67MiIIQelF0PB81Du6ab4ejCqIDG0URTDUPZ+B9VI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B+SJIs5gGXTV4Iy9IPE+BhAvsA6SzkuhFfCuaQV5CqqmqaPYu7wXncIZFntP0KLWJeqblfhm6e5MMl6tKpLSZF1TyHQfLbtSbisgk6RzpGv7kglFzNLIvlVqnB2y6gk4UDXvLwT15a8Pg0BVBI7+vYQLaXq4ImAwcvGXgY25PKo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eT8ldrn1; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eT8ldrn1; arc=fail smtp.client-ip=40.107.104.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eT8ldrn1";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eT8ldrn1"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Be6T94BWEuqNnSWJhY43WGgKgDLAS8G6MSYD5PtjTEY/l0zd3p6UIk/fuv0Dyr0jo/vKvNiTEJpokyeNt/7H8mp4VeDi7T6k3ZmJ3E5eyCTOUDTuNTKxn1ZAfTkz/BRWx4w18dRgibqHQuyvaXsCBSUT3gzdosVOY4xnui7SyA2cDC/BusARn9QzI0iqdxnDkRk5IRyzWlczRnk5u3f053uBtIDBicAI6HthrKt+2C+SCfNWHRdoREM/IW0UlXWbYYlihdMNjSETjEnOV65KHRGJ92oruxLMqOv5vnyBrN6c/ykz/q//7QRxR2Vw1IGAM2YS3Rutks/GNualU3SbMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1AsNE0x9k9HdmHHv+mVwQjkcmvgrAqeOrIaL7EU8uA=;
 b=Qnn2+AFwHIF4ZCXyjcWTaclz/Unn4qQG559esWmob22bqOXjTUq8tExxhXtrgjHD82WNWRGMBbOTy9fvZ2tJ89S4k0ip0SYQUAtWHNBcxIIdXZ64tvIsRkootkMUa9jOgk5XQ9UJYNwJqJie+xHS6drIcUqAkczBAYc5aXxI8Kgl1Y0VbOYNbMOGwdrNfzzrt74+7khtu2alh3HPtRK3uLEfYKalvUuFI7fvQHMN7fEJfKsVxh6Fox/4PiG+bYJUjg38tGYddqfQ+tsQCVcKpLPdkM2kRB0NZ4LsbOceFgmuErdEat7TtVf7F1VkDrd71iCPcXDG77DC+tnKihYO9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1AsNE0x9k9HdmHHv+mVwQjkcmvgrAqeOrIaL7EU8uA=;
 b=eT8ldrn12l5iUsOg7taPGz/Le32iw1Fqb4iLyRoRqRvkSGHRMp2ZsOsGNtSJwAgkDTOp9qAQYfjide/OCaw4MYgxywnS2j+RnT2z/YjQCidwfOSIdvd6cEo9jR2jPXP0Of1GTF6Wh3ComdJ04cvylY70zUPOV949lj1IwPEhZY8=
Received: from AS4P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::16)
 by VI1PR08MB10242.eurprd08.prod.outlook.com (2603:10a6:800:1be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 07:12:15 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::93) by AS4P192CA0009.outlook.office365.com
 (2603:10a6:20b:5da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Thu,
 22 May 2025 07:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 07:12:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpHj99JHnDAz+o28KbUcQ1VLmaYHlXNuEKaVEGkami/pZ54k1QXh7ZZ1xOeOVPXTU1OJgYo2UnhOf6L283lnTLiQMoqtNbTd3+y/xpPK60RdltFwpzuZPoxVCA9qiMpj3gfbYxT6XhScn2ez1l6Gy6EnzsMM9hMZteFq1qFnnGCXBkSK/Ciu4+SeYFSQxds1YWz/jqaYkFkYvEHrVim+eMg/LeopxbRDNjenlP3+Atev2t+Gf9EiCCtaYu2wrVJc9EWSVK8Sg4GJt2xnaUiofzrJLm27ttbyhCchr2w+yvQRVpLrNH7UfsCX+Au7PD8xQ6C3Y7jagttT7B/MprzlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1AsNE0x9k9HdmHHv+mVwQjkcmvgrAqeOrIaL7EU8uA=;
 b=BDFOSZ4wZoQfmKtersfFmpTT9ZVs3ebYjGSUR6+4h8own6tJlYfXt45MX4wTV7XJJa+vnZ9haTK6NnAfdQghzHhwtFw4PvI7SmwEGXUT9VG/CPbxVUgQqBvj/mr2MbJe7sWYwI/8CN0atMzO8yQTEPhs3zv1cLjiwgyRyUgT+Cw514A45Kn/bZTXMIegzn+uBF1EuTKyiIN3A/UXxqJMkzgB/2dtNoLNbUjgfwB+llgkqFdt9KiCoOniAcXgzym96uRUGsac3ox01UTQjOrQ8gJBGlId15MOvPXgwA/0zKi6iJjsX7Ju86SIph/gEVQf7v4wK7M7tXxZMfvKGLt7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1AsNE0x9k9HdmHHv+mVwQjkcmvgrAqeOrIaL7EU8uA=;
 b=eT8ldrn12l5iUsOg7taPGz/Le32iw1Fqb4iLyRoRqRvkSGHRMp2ZsOsGNtSJwAgkDTOp9qAQYfjide/OCaw4MYgxywnS2j+RnT2z/YjQCidwfOSIdvd6cEo9jR2jPXP0Of1GTF6Wh3ComdJ04cvylY70zUPOV949lj1IwPEhZY8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV2PR08MB8296.eurprd08.prod.outlook.com (2603:10a6:150:b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:11:40 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:11:39 +0000
Message-ID: <3b025410-6f4c-4473-866f-1e14e81a0d79@arm.com>
Date: Thu, 22 May 2025 12:41:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] mm: Optimize mprotect() by PTE batching
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-4-dev.jain@arm.com>
 <b3064b82-dcea-4b88-940b-9419d869a39a@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <b3064b82-dcea-4b88-940b-9419d869a39a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV2PR08MB8296:EE_|AM3PEPF00009BA0:EE_|VI1PR08MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc8c46e-d945-45bc-d683-08dd98fffaae
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dnhScU9LRlVRQ0Y5RGZEVmUrVXNobEhsUVlpallLQW1PTFhwRDYzeDB0K002?=
 =?utf-8?B?VDNYNzdBaGNuWTZNbURlSStkRDd6UDZBNlFkRkZTZ01wR2ErWCtXNmZMVDV2?=
 =?utf-8?B?dWgvSlVkV2JhOWZ0blBMc0crNWkvcFlPV01WKzc2cWdMTGt1cXBXbXFjV2pG?=
 =?utf-8?B?OFlSSlhtUFU5TjBKcTNxRm8rMW13KzdYbTFob1h1TEhMek5vTmcvejloZzds?=
 =?utf-8?B?N2tkYUtCRE11R0lQb0lpb05pUzZQQmk0SVJnREswa2xWNDFWMFJ2bEdhNDA2?=
 =?utf-8?B?MkcyRTBPRHVXYUpENlE1UUk0WWpYc09UTGxMOHYzZkllQ2lUbnBqd3FuQjBv?=
 =?utf-8?B?WDFnUVVkSEpLVmtqMFYzb2luanpPLzNxU0NtZ1pqMEdMT2R3Z0ZsbE8xUjJD?=
 =?utf-8?B?MlpENkp5MHZpenZYTTVDemV0MnJ4d2dsNktYcXB5ZTVVOUpaV3F4WmhVSjdB?=
 =?utf-8?B?WUpqWFZOQkhUZHllQUtxQ25nVkVwcWFBM3NlUlVWejZyQ1JDaWZqWWlGeHQv?=
 =?utf-8?B?NjhZVVRpejc3L0lER2VOTXZpaWlzMHZ3VG9pTlJXdW1neWxjNDh4TysxdWlu?=
 =?utf-8?B?UjdaNllGSWZXclp2QUNGaEhjZkRMK3BJb2J3SnNDTDFTL3NKWUpic1UzRkx1?=
 =?utf-8?B?S2NvTEFFc2xuN0tNeFU5OGY5Z2p4SWplUG1uU21lNUpEdkRxcGE5NThPT1My?=
 =?utf-8?B?b3JweUREZmVvS0dGL0hwNkJwaks0V2ZsSUNRcWQrb3NhYTNWeG00ZFV0NHlk?=
 =?utf-8?B?UjVtdG5zQ3YzdmYwdEsydEtWMmp2cDJDYU9FUEVTOG1NckFyOEFpczlva2Ru?=
 =?utf-8?B?ZzBrYTdWM2NBN3RZVVRNNmJReHdUeUt3OG41c09BTW4vNm8rYXZRU2Ixa0hq?=
 =?utf-8?B?TW13Q3NWZ2RuWmh5a1laOEROTVdaRnUzVkFLcnN5RzNrMVlldnA1SmNKZkJG?=
 =?utf-8?B?N2ZXTnNCMmZOR3NCRGJIV2F2ZmRsQnY1TkFDVHZuV2ZnZEZEZnhGSEJHU0tl?=
 =?utf-8?B?VDlQVkZ4cFBsMVRWMlIwY29qNlhzbHpPQVE2RjErcEx5T1BPaXN4RmMzM1cr?=
 =?utf-8?B?bE5NUXJ0NjJydGd0bkprbm96QktyaXJCRndjK2lJMDllSC9BYm1hTjN2OEV4?=
 =?utf-8?B?MkNkMXBuaFczVnFFNWt2ZDlwdXN6bHNSN1BJeE5tRDBOWWZQcFIvWjcrb0t6?=
 =?utf-8?B?eGxtd2gwSmduV1pZbzZGaWlXUC9IbXFLVlhrc0lxS29RY0dPNWNWZ0hoQkxu?=
 =?utf-8?B?NmhzQ0pZcVhhMU9RcG5IZ0xuTFRJaE1HSUZzOUdmTVdIOVlMZ3R5VCtVNURS?=
 =?utf-8?B?Y0Jya3RXMThCZkRROVd5dXdYV0hyOGlGR0hlekhPZXY4QmdHc3pmaWc2MlBk?=
 =?utf-8?B?eC8rRTJZNWFzc2Q0bnJOTSt2ak1XWm9PUlMwNm1LaFA4dWlWam5HQWlCQlRx?=
 =?utf-8?B?M0ZRMEpBMkxLVEdRaE03dnRjYlEzMHh3d1FLY1p2UUswbWNXQm1EVmYyUyth?=
 =?utf-8?B?U3JDb3RseGErTUJ4ZU03bWczZHk1VTBRT2RzNVpBMk9Sa3VjekVRcG0wcnZZ?=
 =?utf-8?B?NElyK3drQzVrNEJYV01TakZkR05OOUdXZHgxTUJLRWhrMk5TSUhHZExYRFkr?=
 =?utf-8?B?WXdDcjIyZUZOeVRLeEZlVGdWbzFvSlhiTWNjektBKzV4TTUwY3NmMUVRQTlC?=
 =?utf-8?B?MWlOcnU3LzZTQkpYQ2lhNkJFeDhsWkQ2U1NPY0VaY2Q3ZWlycVVKelhGQ1Vr?=
 =?utf-8?B?VW4rL0xQbVRaRkgvMDlZTEVWTTVud1pRZnNpWlgvMnNOTm83SllxTndjY2U3?=
 =?utf-8?B?aU1aVkVSYytoaGtSeWxsdTc4OEZSbzd4Y2RWWTRlY3FNdFY3bkljNXZGYlMv?=
 =?utf-8?B?dDRiOTBRK3lsdzlMMUFMVkxXallsdWpMQTI1QnQ2YWRmanc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8296
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	07c5b9b2-d49a-4483-6f58-08dd98ffe5ae
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|36860700013|14060799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnZESjlJNkludlN6UnpZYUN0L3RiQlEzWEFBblB6K2kxUWtoWHl5NE1ZQ29J?=
 =?utf-8?B?K0Q5U2duU3V4VHZkV01NL0tTekp6bHdQUDlBMHpxc0pGbWJ2aWViMVdGb1Zv?=
 =?utf-8?B?OXY3SEJJVERGZGxVZXY2Tk9STkFoQituK3ZRRkN4T2hoZW13aUpJQ0tVZmhz?=
 =?utf-8?B?K1JDSHhDRllIWUpOZ2ZtQUhGajJNVkp0VWZIaWFBYUI5anhpakYwNllObEJ2?=
 =?utf-8?B?c0kyMnNQeXBJZHplcEE1aFpock9IKzZxSGw1NWNuZWVmRWJDL2FNcm1oem9w?=
 =?utf-8?B?MGMyZnJQRVNnLzhCd0JCTWNjcDJjK1E1K0hzSVJRTEE4Zm5iblZWSlRpcjRI?=
 =?utf-8?B?cHNvWEQ4Wm5ta1FnWGJtSEw2bkFkTlM0a0tpUndzTm5kMlNHckwzZE01WXBD?=
 =?utf-8?B?d3hoYjRKL0RPYlVUVkdiYnowTk1NeDM3UmxSd0JkM2tTVFl0NHlMdVJJU2NN?=
 =?utf-8?B?MlVsQS9wSzN3Zy96MUlLYk5oVEZRZEUwNTRDUGcvamdaOWVVc2Y5NnJqQlhX?=
 =?utf-8?B?bXRQYjBoQUp0S0J0RWpzY2VEZ0dqU1hzcEdsRHkvb0pJanQ5SWZPYmtEYkFP?=
 =?utf-8?B?M3p4Z1J5cXRkUGNYOHF1MEFISzlBZS9yUG5Pak93TU1CK0M5UjMzeHp3VEp0?=
 =?utf-8?B?SExRaWQrQTRHRlErdUhQT1lVcHN6bnM3ZDJwTG84S2JOVzVMelQyTUhKbjVl?=
 =?utf-8?B?Tm9NcG5sOU5JeG81WEMyZUdNeWduOVVEWEhLS3pZVHBiOHRoQUduOXFJYnor?=
 =?utf-8?B?REF5NFFROFNxaitWYVR3YmtDK3ZKWURkZjRncU5mbTBoa0MxNXNNSU1zYTU1?=
 =?utf-8?B?OUdlNGtDZ0xiUFE2SWczQzFpQWJFTmU4bHhiQWlERElWZGpzRUVwNjFraWh0?=
 =?utf-8?B?dVFhSmE4emZhODFseDVJNHcvYVV4V3phWUlqZnFGUkFtSVFQTVJOSk5qVE5l?=
 =?utf-8?B?MnVDTzY0VjZ6aFMrNHJnTUZ2L0tRelozOTYrdGxhZkg0NnB5Rm9QTU42RlFB?=
 =?utf-8?B?Q29LcnAxQkNhSmp3QmtlV1hyTDQxVVJPYnFDdHNxWXNvTk1uVVRJTUtQeXVx?=
 =?utf-8?B?VytTMzJQY3JPbkN4ekw0dkVLY3R4Njg5ajFzcTVIc3VGeTJvSFE1YXRTejdO?=
 =?utf-8?B?MHIxMjhraGtsWk02b1pJbkRwc1hyRldwT2Zkb0NQcldZRWJJa0VNTlA2Nndl?=
 =?utf-8?B?a1B4M3JoaEJtVGdjVUM5b0YzaDNVZTZaaFhFdEsrUXRQckJWYlFzU21sVStr?=
 =?utf-8?B?RDZnWjB4bWxjMnhSdmNHTUladHo3TVJtMTVIbXhOZ2xoa1hMUk9MQXc1R2Js?=
 =?utf-8?B?NloybitXOGZmekQyY3VIRkl4azVMcmtEWWtXcmNxbFJWSDcrWTJRRW1UcTZo?=
 =?utf-8?B?Tk5WR25rSkUwSVV2b3F4cHFYL3c0OGIwa1RPVkUydXNORXlmeFM0ZkRJdjdx?=
 =?utf-8?B?c0txcjQ3NzlLTEo3eEduNXVxMXlTTXpDWVZIbC9KTHNMTHFEZEo2bDNQZkZy?=
 =?utf-8?B?R1VzL0JzWGtQNThLTlk2ckM3M0RjU1BPM1ljbDZSdXY5cDNXdVQ4RmtKbXVj?=
 =?utf-8?B?R3p2YjBCNjlmVnBUNlFlaTRNdXpUWWpSTnN4ZDFkcjVKWTlSS3h6dEs5OSt3?=
 =?utf-8?B?VnVwNFg2RDlFVDJtMU5CWEZRNUw1VTFEZXMwaENWbFdZaEgxMy9JN3Y2aDRa?=
 =?utf-8?B?ZUJDTmVQVUozZytFdGg3TDBqQmU1cmN1MEF2VnlqQUgrVU1VTStZQ3RKMmVa?=
 =?utf-8?B?cXplc2NGbnVVOTdIMUEybWpicDNRc3FnQjU0a0FTQ3RTYUpyWjM3RFRKaGND?=
 =?utf-8?B?TU5IRms5MTJCcVpGQlBJenBIdlNrUkdnU2xFdHV5QXh4YWpyQzJKWmwzTk1F?=
 =?utf-8?B?RDQrWWM4YkZUdEE5UVdEdlR4TWFRay9PeHhkK0FaL3dqZkU4KzE5RC8xbnc5?=
 =?utf-8?B?cW1YdTRodGRzaE4rRGlwMkV6SVpDcGc0SVRaNVRPMmdaVTRXdGd1S2V3V3pQ?=
 =?utf-8?B?blkyRDlFck0rUk1lUXZMZVVDUjZVc1ltck5zNHhLNHdtZDlnWWNwdlQvNXcx?=
 =?utf-8?Q?grPayw?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(36860700013)(14060799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:12:14.5351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc8c46e-d945-45bc-d683-08dd98fffaae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10242


On 21/05/25 6:56 pm, Ryan Roberts wrote:
> On 19/05/2025 08:48, Dev Jain wrote:
>> Use folio_pte_batch to batch process a large folio. Reuse the folio from prot_numa
>> case if possible. Since modify_prot_start_ptes() gathers access/dirty bits,
>> it lets us batch around pte_needs_flush() (for parisc, the definition includes
>> the access bit).
> parisc's pte_needs_flush() is a different (static) function, just coincidentally
> named - it takes different arguments.
>
> But powerpc and x86 both specialize it and they consider the dirty bit. Both
> implementations look to me like they will function correctly but it is a bit
> ugly. They both conclude that if there is no change or if dirty has gone from
> clear to set, then no flush is needed. (flush only needed when dirty goes from
> set to clear). Given after your change, oldpte may have dirty set when it wasn't
> really set for the pte in question that means the function could detect no
> change when really its a clear -> set change; it gives the same answer in both
> cases so it's safe. Perhaps a bit fragile though...
>
>> For all cases other than the PageAnonExclusive case, if the case holds true
>> for one pte in the batch, one can confirm that that case will hold true for
>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty and access bits
>> across the batch, therefore batching across pte_dirty(): this is correct since
>> the dirty bit on the PTE really is just an indication that the folio got written
>> to, so even if the PTE is not actually dirty (but one of the PTEs in the batch is),
>> the wp-fault optimization can be made.
>> The crux now is how to batch around the PageAnonExclusive case; we must check
>> the corresponding condition for every single page. Therefore, from the large
>> folio batch, we process sub batches of ptes mapping pages with the same PageAnonExclusive
>> condition, and process that sub batch, then determine and process the next sub batch,
>> and so on. Note that this does not cause any extra overhead; if suppose the size of
>> the folio batch is 512, then the sub batch processing in total will take 512 iterations,
>> which is the same as what we would have done before.
> This commit log could do with some reformatting; blank lines between paragraphs
> and break at whatever the usual git commit log char limit is (72 chars?).
>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/mm.h |   7 ++-
>>   mm/mprotect.c      | 126 +++++++++++++++++++++++++++++++++++----------
>>   2 files changed, 104 insertions(+), 29 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 43748c8f3454..7d5b96f005dc 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2542,8 +2542,11 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
>>   #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>>   					    MM_CP_UFFD_WP_RESOLVE)
>>   
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte);
>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t pte, int max_len, int *len);
>> +#define can_change_pte_writable(vma, addr, pte)	\
>> +	can_change_ptes_writable(vma, addr, pte, 1, NULL)
> nit: add an extra tab for readability:
>
> #define can_change_pte_writable(vma, addr, pte)	\
> 		can_change_ptes_writable(vma, addr, pte, 1, NULL)
>
>> +
>>   extern long change_protection(struct mmu_gather *tlb,
>>   			      struct vm_area_struct *vma, unsigned long start,
>>   			      unsigned long end, unsigned long cp_flags);
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 124612ce3d24..6cd8cdc168fa 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -40,25 +40,36 @@
>>   
>>   #include "internal.h"
>>   
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte)
>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t pte, int max_len, int *len)
>>   {
>>   	struct page *page;
>> +	bool temp_ret;
>> +	bool ret;
>> +	int i;
>>   
>> -	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>> -		return false;
>> +	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE))) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	/* Don't touch entries that are not even readable. */
>> -	if (pte_protnone(pte))
>> -		return false;
>> +	if (pte_protnone(pte)) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	/* Do we need write faults for softdirty tracking? */
>> -	if (pte_needs_soft_dirty_wp(vma, pte))
>> -		return false;
>> +	if (pte_needs_soft_dirty_wp(vma, pte)) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	/* Do we need write faults for uffd-wp tracking? */
>> -	if (userfaultfd_pte_wp(vma, pte))
>> -		return false;
>> +	if (userfaultfd_pte_wp(vma, pte)) {
>> +		ret = false;
>> +		goto out;
>> +	}
>>   
>>   	if (!(vma->vm_flags & VM_SHARED)) {
>>   		/*
>> @@ -68,7 +79,19 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   		 * any additional checks while holding the PT lock.
>>   		 */
>>   		page = vm_normal_page(vma, addr, pte);
>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>> +		ret = (page && PageAnon(page) && PageAnonExclusive(page));
>> +		if (!len)
>> +			return ret;
>> +
>> +		/* Check how many consecutive pages are AnonExclusive or not */
>> +		for (i = 1; i < max_len; ++i) {
>> +			++page;
>> +			temp_ret = (page && PageAnon(page) && PageAnonExclusive(page));
>> +			if (temp_ret != ret)
>> +				break;
>> +		}
>> +		*len = i;
>> +		return ret;
>>   	}
>>   
>>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>> @@ -80,21 +103,55 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	 * FS was already notified and we can simply mark the PTE writable
>>   	 * just like the write-fault handler would do.
>>   	 */
>> -	return pte_dirty(pte);
>> +	ret = pte_dirty(pte);
>> +
>> +out:
>> +	/* The entire batch is guaranteed to have the same return value */
>> +	if (len)
>> +		*len = max_len;
>> +	return ret;
>>   }
>>   
>>   static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
>> -		pte_t pte, int max_nr_ptes)
>> +		pte_t pte, int max_nr_ptes, bool ignore_soft_dirty)
> We'll almost certainly want more flags here in future. I wonder if it's cleaner
> just to pass "fpb_t extra_flags" here instead of the bool, then OR them in. You
> can pass 0 or FPB_IGNORE_SOFT_DIRTY at your 2 callsites. No strong opinion
> though.
>
>>   {
>> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +	fpb_t flags = FPB_IGNORE_DIRTY;
>>   
>> -	if (!folio_test_large(folio) || (max_nr_ptes == 1))
>> +	if (ignore_soft_dirty)
>> +		flags |= FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>>   		return 1;
>>   
>>   	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>>   			       NULL, NULL, NULL);
>>   }
>>   
>> +/**
>> + * modify_sub_batch - Identifies a sub-batch which has the same return value
>> + * of can_change_pte_writable(), from within a folio batch. max_len is the
>> + * max length of the possible sub-batch. sub_batch_idx is the offset from
>> + * the start of the original folio batch.
>> + */
>> +static int modify_sub_batch(struct vm_area_struct *vma, struct mmu_gather *tlb,
>> +		unsigned long addr, pte_t *ptep, pte_t oldpte, pte_t ptent,
>> +		int max_len, int sub_batch_idx)
>> +{
>> +	unsigned long new_addr = addr + sub_batch_idx * PAGE_SIZE;
>> +	pte_t new_oldpte = pte_advance_pfn(oldpte, sub_batch_idx);
>> +	pte_t new_ptent = pte_advance_pfn(ptent, sub_batch_idx);
>> +	pte_t *new_ptep = ptep + sub_batch_idx;
>> +	int len = 1;
>> +
>> +	if (can_change_ptes_writable(vma, new_addr, new_ptent, max_len, &len))
>> +		new_ptent = pte_mkwrite(new_ptent, vma);
>> +
>> +	modify_prot_commit_ptes(vma, new_addr, new_ptep, new_oldpte, new_ptent, len);
>> +	if (pte_needs_flush(new_oldpte, new_ptent))
>> +		tlb_flush_pte_range(tlb, new_addr, len * PAGE_SIZE);
>> +	return len;
>> +}
>> +
>>   static long change_pte_range(struct mmu_gather *tlb,
>>   		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>   		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>> @@ -106,7 +163,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> -	int nr_ptes;
>> +	int sub_batch_idx, max_len, len, nr_ptes;
>>   
>>   	tlb_change_page_size(tlb, PAGE_SIZE);
>>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -121,10 +178,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>   	do {
>> +		sub_batch_idx = 0;
>>   		nr_ptes = 1;
>>   		oldpte = ptep_get(pte);
>>   		if (pte_present(oldpte)) {
>>   			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>> +			struct folio *folio = NULL;
>>   			pte_t ptent;
>>   
>>   			/*
>> @@ -132,7 +191,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * pages. See similar comment in change_huge_pmd.
>>   			 */
>>   			if (prot_numa) {
>> -				struct folio *folio;
>>   				int nid;
>>   				bool toptier;
>>   
>> @@ -180,7 +238,8 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				    toptier) {
>>   skip_batch:
>>   					nr_ptes = mprotect_batch(folio, addr, pte,
>> -								 oldpte, max_nr_ptes);
>> +								 oldpte, max_nr_ptes,
>> +								 true);
>>   					continue;
>>   				}
>>   				if (folio_use_access_time(folio))
>> @@ -188,6 +247,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   						jiffies_to_msecs(jiffies));
>>   			}
>>   
>> +			if (!folio)
>> +				folio = vm_normal_folio(vma, addr, oldpte);
>> +
>> +			nr_ptes = mprotect_batch(folio, addr, pte, oldpte,
>> +						 max_nr_ptes, false);
>>   			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>   			ptent = pte_modify(oldpte, newprot);
>>   
>> @@ -209,15 +273,23 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * example, if a PTE is already dirty and no other
>>   			 * COW or special handling is required.
>>   			 */
>> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>> -			    !pte_write(ptent) &&
> Don't you need to keep the !pte_write(ptent) condition here? No need to sub-
> batch if write is already set.
>
>> -			    can_change_pte_writable(vma, addr, ptent))
>> -				ptent = pte_mkwrite(ptent, vma);
>> -
>> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>> -			if (pte_needs_flush(oldpte, ptent))
>> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>> -			pages++;
>> +			if (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) {
>> +				max_len = nr_ptes;
>> +				while (sub_batch_idx < nr_ptes) {
>> +
>> +					/* Get length of sub batch */
>> +					len = modify_sub_batch(vma, tlb, addr, pte,
>> +							       oldpte, ptent, max_len,
>> +							       sub_batch_idx);
>> +					sub_batch_idx += len;
>> +					max_len -= len;
>> +				}
>> +			} else {
>> +				modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>> +				if (pte_needs_flush(oldpte, ptent))
>> +					tlb_flush_pte_range(tlb, addr, nr_ptes * PAGE_SIZE);
>> +			}
> This if/else block and modify_sub_block() is all pretty ugly. I wonder if
> something like this would be neater:
>
> 			use_sub_batch = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> 					!pte_write(ptent) &&
> 					LIKE_can_change_pte_writable(vma, addr, ptent, folio);
>
> 			while (nr_ptes) {
> 				if (use_sub_batch)
> 					sub_nr_ptes = sub_batch(...);
> 				else
> 					sub_nr_ptes = nr_ptes;
>
> 				modify_prot_commit_ptes(vma, addr, pte, oldpte,
> 							ptent, sub_nr_ptes);
> 				if (pte_needs_flush(oldpte, ptent))
> 					tlb_flush_pte_range(tlb, addr,
> 						sub_nr_ptes * PAGE_SIZE);
>
> 				addr += sub_nr_ptes * PAGE_SIZE;
> 				pte += sub_nr_ptes;
> 				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
> 				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
> 				nr_ptes -= sub_nr_ptes;
> 				pages += sub_nr_ptes;
> 			}
>
> Where:
>
>   - LIKE_can_change_pte_writable() is similar to can_change_pte_writable() but
>     does everything except checking the per-page exclusive flag. Note that we
>     already have the folio so can pass that rather than calling vm_normal_page()
>     again.


Hmm...all I can say is that I can *try* to come up with something 
cleaner, but can't

promise :) I'll try modifying your approach.


>
>   - sub_batch() can be passed the folio and the index of the first page within
>     the folio and the max number of pages to check (nr_ptes). Then returns the
>     number of pages where exclusive flag is the same.
>
> Obviously they both need better names...
>
> Thanks,
> Ryan
>
>
>> +			pages += nr_ptes;
>>   		} else if (is_swap_pte(oldpte)) {
>>   			swp_entry_t entry = pte_to_swp_entry(oldpte);
>>   			pte_t newpte;

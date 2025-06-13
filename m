Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D22279DBB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823207; cv=fail; b=ujgta8QNt0i1V78PQMHpoyf3IFu+C/gNHr46/nPkNwASlD1RHSw1vr/AqNPrx3w1VROkl7L7B9PJo8wF6B+f+r6MZ+xxfOwnbUeYjOZ09VHqKdh54bp0rGMppsDJeoVDo/sV2rl2GfsIEXA1lOJ5a1DnbOGWYTMukiROcM8ti5w=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823207; c=relaxed/simple;
	bh=oILRRN6/0noXRelmffrVx6r5uBsrY+mQHbxh0gweJn0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AuWXt8qqDdbImtfmo3hoWovDHc9JjqDJP7/SpDCZKxOkXNJhvkqqtzh+deEJcdGpT9eu46vqTZxxlnXjprwxtuwz6kH7mBE2842Qsoxs+I96sJhGr3cq61zziJV6OTwNGJDoIf/reofRfqu7SC1w844gREyWUqFYSXEaFCa64B4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pND0czdR; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pND0czdR; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pND0czdR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pND0czdR"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q4gaRDmU1mo0eMbg2flY/sRL0EEK4QIbK2pCeOIMHY38pGyp1yEa2FNVzFYFsjjjox0PZWutuHQPpS0+lxDJWINL05m3bGvb/3lTdC003g8GMBFL0z6jL0tRin+xKeV1OS8bq0WtovpYBIdta7ZZX6QxH/s/Eh23wiSdwALXHJm9g1J3e8y+3ZBI/XdMNdNni6FEJa6qrrDP1CCRMtTNx34X9U+AtrlExfbzI6ydBipgSHMIC5leT5YUmgexERDtx7rEsIIrjxJXzkSa51vRTCtCn9QVa1ejPJdV/aVPm5FLkd7paoQ3iejUEvKKhbQoAZfbWgUNi10U6TqN9388RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtDpQ3v8ZVGb3Cx2bhBKmBZI+BHFExcQLEErXIf3Qmk=;
 b=TUPaCO8vF+CdCY+WX5W2Fp+nwWXXpFM4IAHh1OTfyXDpJ1MbPV1TrT/6poF6GHxCZ3VrJaLI25AiPtK8brwunwQ++CACrU0yL+IKpg852YgjjHV97J5c+DYiXJ94x3ka05N5ycmIrPJHDV5nQtQ6NK7ZvdQ8UvUqMZhCEGixpR02NszBIkdFwDVAgXjsulqIARRc7BAsJOCu9164P165LnG7sv66BtGQML3b+rF23/RqWWMue0mYPWgcHlcVQSJPZjDu1kJVHlb4KFjrl3Nyw3sfUpyesD+3bSlfSnmUGjAffdTH4nZys8Oxk9fpCz/IKDMnPNM4cdF62krWBEjbuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtDpQ3v8ZVGb3Cx2bhBKmBZI+BHFExcQLEErXIf3Qmk=;
 b=pND0czdR51nOtM9VVrkV35oUM8doQ3lrqUyZHLUw54SlCfiBmG/zSK3YOuG+1DuQrbm7/CglP7GkG0+Pg4hJ7XMysyacxPFGbW21ujhgYN/HAASrcZLF7QCAMW86cInqs2mMDOrFHXGLBcty6EUihlD0BQlBGYD3eMZxwI2BI4g=
Received: from AS8PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:310::24)
 by AM9PR08MB5921.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 14:00:01 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:310:cafe::4a) by AS8PR04CA0019.outlook.office365.com
 (2603:10a6:20b:310::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 14:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Fri, 13 Jun 2025 14:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2yJOzQJ2T4spthd+IHF06IcabpWMNIQll0IsfDUKZgVCs07oeoTFUydrmZbh5xVcwlBpVt2pUHIzEcCMymfMa0LfkxyCvXBGHWQNwTKWDpTItuXdyAdxHBuTHL/JHZPwkGFeg6SySPhgbQpg+qE9V5Rz5DubQnYouljHkEjANbCjP6BRxJG2kdo3cohMGRpPWlp7XrpNemv2kvJQMlp+Gy+jZp5I3Rh+zh5dXWpAOhWrC8qxiGvm2QzwXCFx74zh1dTXHZ+6SQl1RGfqZKdzedMLTJydg2snajWNe8JNZ5TMsXovZ2LstDhE8iHEKtrlRgJuuKMuSb3ZCSJ9Feqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtDpQ3v8ZVGb3Cx2bhBKmBZI+BHFExcQLEErXIf3Qmk=;
 b=v0yTnkeiLQj9k/yU3ictmHpzJy6RQs3vdcEaDeqr27sC48z//wGEQOYXL8hsuYFxtxnUTi21r+7QOfoBtyY06Lx5cd8hntYFgSPEzdbcCxp+w0zaDd+jZoun68lOD851FYHWlPda1Wst24wUPtB61UdazvhPMiy+CshiYUPaJHyB6Xe5b6kYq3ZemKY4/Dk/pCYjerq1okcT37IwFTQxgGX/8Hid5+6D7qs/eQ+E6s7pvjM1ixBvQaK4pYCXBKMbvNpq0z8QFeaC47+pFQNaNXvgezAetsRajB7pjgDlv2XeYozw7VZns0AnZEUzrsKvE/6zgjTgvWetyWndkOffkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtDpQ3v8ZVGb3Cx2bhBKmBZI+BHFExcQLEErXIf3Qmk=;
 b=pND0czdR51nOtM9VVrkV35oUM8doQ3lrqUyZHLUw54SlCfiBmG/zSK3YOuG+1DuQrbm7/CglP7GkG0+Pg4hJ7XMysyacxPFGbW21ujhgYN/HAASrcZLF7QCAMW86cInqs2mMDOrFHXGLBcty6EUihlD0BQlBGYD3eMZxwI2BI4g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB8468.eurprd08.prod.outlook.com (2603:10a6:20b:566::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Fri, 13 Jun
 2025 13:59:28 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8835.023; Fri, 13 Jun 2025
 13:59:28 +0000
Message-ID: <6c6f1cfa-7f1b-4133-ae2a-c6b1ef2d82e8@arm.com>
Date: Fri, 13 Jun 2025 19:29:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
 Baoquan He <bhe@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-2-urezki@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250417161216.88318-2-urezki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB8468:EE_|AMS0EPF000001A2:EE_|AM9PR08MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 305d6a2a-b33d-41c6-de56-08ddaa8296b7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Y0JvTWt6S29BbUVuak5DT3FUMkhlOTlPVTJPd0JtY0pPVkxhQllxQTBLZXBz?=
 =?utf-8?B?SWJiNGVtWk9MVExhOXN3cEo0bzBOMHhidTNYalJaK2g4OEI0TCt4Nm81SmJu?=
 =?utf-8?B?azcyNHhXa2NhMHhmQk9oc3Q0L1lRYU5IekFaMUorSmRyTVo1dXBMZGppTXEx?=
 =?utf-8?B?cEVkYlM0ZTRkRlBCeGdkN1Z5dDYrUmN4cGVPeWJ2TGEwdDRlY2FlMDJiN2pI?=
 =?utf-8?B?QVg3Q3poKzZuNmhqbFVBZHVWd1pmaUxscmwzWDRObncwWGRpbDJvUlpzTWJx?=
 =?utf-8?B?SU5XV3o5UnJDc1ZFd1g4RXVvZExjQ1JidnlQWGI5eTFSNGQ5ZlhKWEJHYTFD?=
 =?utf-8?B?Q2VCQTVuRHpLak5xSUg4UXd6WndlZHh5V2R3aWdQYzJwNkw0Ri9rRHZ1Z28x?=
 =?utf-8?B?bkpyM1R6d2VZaitGaTVXaGRwQ2lVTlJFQzIrOEV0NjBtVFdKdGl6RGd3WWZk?=
 =?utf-8?B?VXZsZVlPb2pvUjI0djd6NWJHWlJqaEZEVUNhelJiV1lsZXZOcXB5RUl5bGMy?=
 =?utf-8?B?bVloeE5iYVpkZE5DYzdOczZqM0hnVlFSNFlEWXRjV2VqSFNFV0RlU1NsOWd1?=
 =?utf-8?B?ZnRUdlBsa0swVlFzenVMYXVOL0ZNSld3UnowY0hOUUx4aEhrcWZTU1lMRlQ5?=
 =?utf-8?B?WldaNG90anhzM1dWVFVRMTJWUmYvVnpIc1EyeDk1T0JNUUxPMlh2VjZ4NzBY?=
 =?utf-8?B?c2JsMXErNGgxajJRNEJiZitIQWtXcHl4U0FJZ0ZXeUdkRThDS2ZzS3hXMnVW?=
 =?utf-8?B?aVY2aWZoclIzMDVGalZaaXVadDFxdVhadkZXb0RoWGNvRzluMEJLRkdqMXVv?=
 =?utf-8?B?SElUMmY4NHAyOHM1M281STBVREhERWlwVUVpRGdFUW5VM0d3Z0VReEFOZE1Z?=
 =?utf-8?B?d2tGQ3phdlhXd1ZpS2RCVm81RjlNZHdqWU9QYXp3VzR3dkxUUXlIclBRYmFW?=
 =?utf-8?B?VGlzMUJ2U3pabnZiRElNV1lBTXJ6YTVSZjFyRWkvQWFCY3pyRkVYamhvR2NO?=
 =?utf-8?B?SzdpeGNSbDRkYmxxcTlEOFNDRVdHTVZET2l6RSsrSm9MU1g5N0pVVWxvSnBO?=
 =?utf-8?B?clBLelpaK2JuVFh1QWR2VnJEUFIzcDExNStXdjd2QlZ0SVdQb1BINm94dXhh?=
 =?utf-8?B?U3I5dy9TWnZzVHJGYWZYbnV4MmNISVMzVnM3S1YzSmI0VmFNY3AvOWpXOFF4?=
 =?utf-8?B?Y0VpMjBZT1pwVEd4VUV2ckdoTHpJU3hISExrUm5mYVBjNTY5MVFEWmVjUTF3?=
 =?utf-8?B?R1N1bWpTSkR3aUo3dmN2Zzdyc1NDR0lZTGlzTGNJdmp5OEZvQmZaSkdOa1dX?=
 =?utf-8?B?KzdBcFRSc09QTHBoVmU5ZEdzS0xjeVdBd1d0cmpaMndKK3J6Q2lXMDloQTRw?=
 =?utf-8?B?dFFueHhRVTNOcmcxTERvUXZzeTNnRzJEZFEwVkFxZDVRM0dHN2xKRVlQQTUv?=
 =?utf-8?B?bFhTL1NHQXVmU1ZWV1ZSNVcwNXFTajZCMTBTU25Zb0xrT21xUGdUR0swNFJ1?=
 =?utf-8?B?ZVlBZmtrNTkyNVZMdlQ0c1dMa1NUK0p2ZlBOSUxBRi84eWhONll1UU1LN1Nu?=
 =?utf-8?B?TjdIZ0dMZlY3ODd4eFA2NXozUm04bFdtSG9JdGduZjd6dWVTWGZWN2xaYnZw?=
 =?utf-8?B?ZUtHYnFQQ0pDSnpJcGcwUDFkQlViNndhTWE2bW1wTjZ3ekd3M1NtNGlLeXNW?=
 =?utf-8?B?OTVRQVRlelhYYlBwTUpXdHRIdXdpMlpTYlA1azdQU3YxRXdBb0g2YU9xbm1n?=
 =?utf-8?B?SStzZSthR0Z5VnpPejg3MXZqNjgzenZJRHBjbGFLYVpGTzlrTStncFczWWNN?=
 =?utf-8?B?Y2MzWjhBOERIUUxUc2NtNGNtOUNxOURrdkdGeEU2UHpCY21DZDBwSVNKZnQw?=
 =?utf-8?B?OXIrT29ZQUw1KzV4Q29VTDNEVStOZEJTY2NoeGdtYUdJYmNycTVNMGNsK1kz?=
 =?utf-8?Q?bp7vIMD1cYs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8468
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88a0a618-e736-4912-8c8f-08ddaa82835d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlgvMDlQNXlnOEtlNFNtVXNDMU1UQlVld05naDZMYzRyOGhxWUxxN3J5SWFI?=
 =?utf-8?B?U1hHbXdjeWRBOFdyNXFpSnhOL3hzb1EvbmxVbTRyWDk3Z1IzVjBFaERraVkw?=
 =?utf-8?B?QWsyUE9aVEhOM2ExSzlqRDFqU0NtN1NuS05melhPQzlSYjBLTk9KbkR0ZUlD?=
 =?utf-8?B?RXVETUZ3RlZwYTdJS0doamVuMjE2OG45enJTYXR0WjlERXJJb3ZSZ2N0d2F0?=
 =?utf-8?B?Vi9mT2cvcFVRckVnd2NiSHdrdS9wenVmT21zNlFFV3R2YXlid2ZQU3ZadkRz?=
 =?utf-8?B?Ukg1RHhaNnBjNndNcDZuTWgwNm1uVUhGQVJyaGc0S25kN0JTNXF1eVFjVWpH?=
 =?utf-8?B?aE5qNFBnanhrblFzOUJ4RndKQXVFUTZrdG9DNlZBWjZMTHBRbkl5azNIS0NW?=
 =?utf-8?B?NnNOSWVWSHdoaUc4RHhEQWxkbnlqSmttN00zSEtiVmZnY0hVdDFKVEkyUFRn?=
 =?utf-8?B?amkyUS9uVTZrUXVadGg5V1pzZXJ0NmNzb25Ha0o0eDNZT24zQ2dSQUZveTJZ?=
 =?utf-8?B?T0h5Ymp6amViT1pJb3d4akZSN3pQOGVlVXhOQktYczZRWkxsbFlkOEJlOUEy?=
 =?utf-8?B?SlZucnRaVExRUUlKRE5adUJNSXFVRTBFVTVIZmI3ZE93cGpvVnRtMno3eGN1?=
 =?utf-8?B?NWhYbTFCV1gzWTZuTmE5MUFDY0dtOStSeTF1K3E2bEpCSnY5eFpncmIrYU1C?=
 =?utf-8?B?SVI2cGk2bngyUFlmZE42TXVtRWdOdDNMQ1hwamlpSVJhanlQZHA2M2V6SzZm?=
 =?utf-8?B?bG54Z1Z1a1I5Yk42dDI1UWp1dng5M1U3ZU04UTJpWHQvTjl6RUFMOVgvWDRo?=
 =?utf-8?B?UERpSTdjUnVFcjNkcVJkM0VEL0RRb0pUZ3d5MXIrOGpXTDdIeHdWZmsrUlU5?=
 =?utf-8?B?Ri9lWkZvZ1ljNUxKcDRZYkJ5Z2cxT3h2dWFXNS9WNG9leVg1bC9mN1cyRm9O?=
 =?utf-8?B?U0dQWS9BdTNkRDE3MmRlRjgyMlExV1BxTlIyTHNuamwvNE9Sa1BtR0xDci90?=
 =?utf-8?B?UDZsWFZ5UjNLSis3TzRRWlpPZk5FcURobkNpRGg0aDk4elBBNW14dklDeWpR?=
 =?utf-8?B?L0RxWFdNekpzRW9OZ1lWbVk0d1EvUWxMdDlObzhuM1dId1JtaFJnc1JqY05I?=
 =?utf-8?B?WVNXdTJKeEp3eXljT2RhTDdhcmhMVEhoSmdFUFBJMm15ZXlhZVB6a2thZTNy?=
 =?utf-8?B?Q0gxN1BpdG9WeWJsZ1M3NGxOSDF2dWxYT3ljSGhQQ1ZvVm9pb0NlelBFL0Nm?=
 =?utf-8?B?cEVubmgzdy9yLzhrblBtRXh6MDRuL1dPZXU4QmR6NEl0dkFPc3BTdEJpMjZz?=
 =?utf-8?B?N2QyaXcyTjVBeldueHVLVU5iTGgzMmlUaGJPZ0NTUWI2SXV5eDVwYUxRYW9H?=
 =?utf-8?B?UGd2eWhmVFVNM0EwaDJVWjJSZWQ4RHNBZ0N4SU40MHFBUGlrSmcydVhIZ0Fq?=
 =?utf-8?B?Z01qb0JtSC9LMkhTM004aVNncnQwNGV1WkQ1ZGZUcG5vWU9MWGh6WllZQU9Q?=
 =?utf-8?B?VEx4QVNSYmZzakJNNW5DcS9nQndIa1A4QVoydGZaL1FpRDA3czB3SmI5TEFV?=
 =?utf-8?B?VTRrZXBIb2R6ZC9yT3BDUHRFZWJYV0lRUVhWL3ppM3pRNzVOTzFKcG9jQmp6?=
 =?utf-8?B?WXR5U1JNVmFuL3d5ZEFQeXJZMVAzVEVVZEk2Q21aNDN6a3Y2NWZTa0JldURH?=
 =?utf-8?B?WE91WHpBcnZYSUg4ZkZoSzJtM0Vud3dXdU9wazRvLzlBWS95L0ozbzBBWm9m?=
 =?utf-8?B?alliejB5U1pNcmRSenJDcWJXS3N4R2ZONlVKMzVsZ2lFUXVjb1YydExkZFhq?=
 =?utf-8?B?cDVrWFA4em5HQnlCRS9YeXJ0bkd0RW9tNmIxVkhHVWJ2WWVXWm84UGNIa3V2?=
 =?utf-8?B?dlhqdVNROUdTWEw1RFFlNDdQdnN4TEE5ekJ6SVU3NitZN05rZTRkN1VkSjk0?=
 =?utf-8?B?Wi9GZTJvbE5QTFB3RnZGOGlZT0prR21GVTdzcmxBZGJFRjdBNU56eVR1dzVZ?=
 =?utf-8?B?ME5ZZTg4dDk3Q0Z3OXovWGNNTDNkVjFlclF0NkhpVU5YMlJNZWdyVi9jNnRq?=
 =?utf-8?Q?X4B2MA?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:00:00.6673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 305d6a2a-b33d-41c6-de56-08ddaa8296b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5921


On 17/04/25 9:42 pm, Uladzislau Rezki (Sony) wrote:
> This patch removes the dependency on module loading ("m")
> for the vmalloc test suite, enabling it to be built directly
> into the kernel, so both ("=m") and ("=y") are supported.
>
> Motivation:
> - Faster debugging/testing of vmalloc code;
> - It allows to configure the test via kernel-boot parameters.
>
> Configuration example:
>    test_vmalloc.nr_threads=64
>    test_vmalloc.run_test_mask=7
>    test_vmalloc.sequential_test_order=1
>
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>   lib/Kconfig.debug  | 3 +--
>   lib/test_vmalloc.c | 5 +++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index f9051ab610d54..166b9d830a85a 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2574,8 +2574,7 @@ config TEST_BITOPS
>   config TEST_VMALLOC
>   	tristate "Test module for stress/performance analysis of vmalloc allocator"
>   	default n
> -       depends on MMU
> -	depends on m
> +	depends on MMU
>   	help
>   	  This builds the "test_vmalloc" module that should be used for
>   	  stress and performance analysis. So, any new change for vmalloc
> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 4ab23e5e772d0..6d65ef725d42c 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -591,10 +591,11 @@ static void do_concurrent_test(void)
>   	kvfree(tdriver);
>   }
>   
> -static int vmalloc_test_init(void)
> +static int __init vmalloc_test_init(void)
>   {
>   	do_concurrent_test();
> -	return -EAGAIN; /* Fail will directly unload the module */
> +	/* Fail will directly unload the module */
> +	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
>   }
>   
>   module_init(vmalloc_test_init)

Hi Uladzislau,

Post this patch I am seeing the following problem: while booting the kernel, this test is
executed and a particular testcase triggers a warning splat from the kernel, then the boot
gets stuck for 3-4 seconds, then proceeds. I am not an expert on modules so I don't know
what happened but I am guessing that when the test fails, the delay is due to module
unloading time...do you suggest a solution? I reverted your patch and then proceeded with
my work, so apologies for not having the dmesg log, if you need it I'll replicate, although
there is some subtest which has consistently been spitting out a warning on my Apple M3 Linux
VM and I have been just ignoring it for long : )


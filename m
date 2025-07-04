Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C042D29C4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629381; cv=fail; b=a4PHPnGClyXadxr+P7OHOhTcGx6p+90g/A7jdKA7mUiKJtTPsKhLZZhGbX4yLZUZ0qg10aoJLJkFw4xwgxd0NMWKNHZDfWK+4ZAPHl6g4uhtsIpJoB+8WzGF6Kn4qG1ThAt9HkU3tcoCdjA9gZSF7RcD1jBsFzGR3I9GW72L+rM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629381; c=relaxed/simple;
	bh=rFgvcXAIswPgcxbrCdBaTwM+jBdpPr3ZL7igqPCMlVE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nwpAt1xYSq03BWaSMFDslTioU75xJJesIx+D3zFMHm0YOosDg3EUasZ9W8wGnyuUwvqvGo9fwYVbJjGflxAXeW7smZOit4YwfriakaiA7f9FuEn9Hspk9ZV7NTLHdwM1xpswSH9mzObZUItpIirAcPMwMbVuThL1BWW/QrA2Nxk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aaFJpA/F; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aaFJpA/F; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aaFJpA/F";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aaFJpA/F"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RgD5Tmw9V1Ci9NtmiFNvhgrd8ukoyhZHv+LgOBiGY6rf0NpWXqUHLctTcucLCIPAYCeaVNHmRafgW9tSQRVzpaJEICuCYixvGdBDlbNVlSYsxNVG+OJkKlTFEVLGqcZdLFFDj58VkGFpA2ngFwhQnu7jMNeTGJZ7O4TP3q2/bavddBDk9yfGgqZhKZr1xA9CZsKiHdL2wN6hQ7daZ6YAPLfvG4RZlhC2rSiM8mQmAroyBQxetUZlxsGdaqQc80rlhr3rBQpUcJjLCxRSf4Ap/BIFAYkQuhfo/jRpODjKBh5yRZNHqzn0kfAI+8/Xp/0jXlCw4Y6yG8R2RbaVmCSqJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvLoV0key556t9jrmUKrGP92NCS4XYtDX01BqeM/Xj4=;
 b=YJn9BtHNCrK5xT8XhWtytZvYS9FDjU/lNMZ4WhlPxkkREBKqS548FGJ1Crk7Iqgoim6NCWC4ZFlw8HCI/0lKUPKwXrvupeZRUYLl6xfdov29GqlRINcZwf1omT8DR4/1DKVIeenSGy52aT0NsF8K/eDmQPGz1nc4xILGgCueG9jN/QA6DtMb1OYkqfm2LkAUtYuBV2vw2L2B/n7AbtAYtAuDAwfaB8iHztSqGB6Fxt4/aofwGp+86JskRKBiXG1dGwcrwHlHahKDssQuu3htX8sx6aRJMQ3l92+H5qQlQUl1qxiS0sPUklfFPznYGUFwzR9D4KRmR/BNGrd0VISVCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvLoV0key556t9jrmUKrGP92NCS4XYtDX01BqeM/Xj4=;
 b=aaFJpA/F7Pq09zURF2j1V4b+Ucw+PJPzC8zpY2ZmyTQA5DXC1NpNfDaOOEic6KaXSiDF9oxLv39XqaiKznwDe2P0h8KFM3C2UoMxm+h/bgNkgiDB176QCS1zn1NmNmEAv4YFaYgm0Fpx7FZ7FrlTW+8IspncpEEFOBUF9iF2NzU=
Received: from AM6PR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::48) by PR3PR08MB5868.eurprd08.prod.outlook.com
 (2603:10a6:102:81::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 11:42:53 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:e0:cafe::82) by AM6PR01CA0071.outlook.office365.com
 (2603:10a6:20b:e0::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 11:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Fri, 4 Jul 2025 11:42:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcVbfeZw71wHqYPug/KvCYdpQ4CDWWvrjL6nGfox69SBq132Qwe8rVMDgpXwGQrKtYsXKf56qzGdJeBqmTj6qRkMT09P/4axtnsWjwoGd55gupPgx4jQjCNBthhi0NxRo4+qhNG5t7DstOl3Oxk2L68hXOkxYBmEOOvRIU+OUDgkZThzwSL+qXvtM98Zg4EnM4Ajg55AuvG6YMexU+MK+IdxzBkJigz9nZXBjZfEgITuxyq74IT8NY7xMvUvEisJu8GrNwoBq5xorCPR90jp+EpANek2s2TPSCvWXlTShXw2BbwdFFYkPPQMPKraA6+O4Jrr/32haYHjOQ+dg4xYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvLoV0key556t9jrmUKrGP92NCS4XYtDX01BqeM/Xj4=;
 b=VZ7dxt4y/g8NEszIIKRtqvoiF5KH/J6klhoG+RFskf1zoErZ12Ms11urE8c6JfKWaFiaEeIPFM6Io5it54u8SeeAh+kyntLQwL1jfUA/pDwWRoy2VPgKm7wtojp2zXNlLsxTstVSe+Vz02YlZpnaxx9KriUlA6V47h0E96n5hK2XBJfZJEUKCr8O27QDYjPN/m/2+E7bE3qwzuS8/RYuE3drZjf5AVhrdQrSRMCtHxUtcX+AxOBMyqcWj559EyGq5VolsJaQMDb1VUKYSaL+1fFZLCvDwU+rqG4uCeJIBzIx4i48MptxivCSA5nQydA1CBt98hjoawInCmPxkXU4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvLoV0key556t9jrmUKrGP92NCS4XYtDX01BqeM/Xj4=;
 b=aaFJpA/F7Pq09zURF2j1V4b+Ucw+PJPzC8zpY2ZmyTQA5DXC1NpNfDaOOEic6KaXSiDF9oxLv39XqaiKznwDe2P0h8KFM3C2UoMxm+h/bgNkgiDB176QCS1zn1NmNmEAv4YFaYgm0Fpx7FZ7FrlTW+8IspncpEEFOBUF9iF2NzU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU0PR08MB8116.eurprd08.prod.outlook.com (2603:10a6:10:3ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 11:42:19 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 11:42:19 +0000
Message-ID: <bc201f93-7743-4d9d-a62e-3c8ea22e2cfd@arm.com>
Date: Fri, 4 Jul 2025 17:12:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 ryan.roberts@arm.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david@redhat.com
References: <20250626052524.332-1-dev.jain@arm.com> <aGe5XjWKhgjzcw7L@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aGe5XjWKhgjzcw7L@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU0PR08MB8116:EE_|AM3PEPF0000A790:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef7e528-43da-4069-20e9-08ddbaefe958
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VVQ5aUdBMVNuNXlQRk1IbzRPTDVtN1dIMlBGVGFPZDVucFlwRnNUbW9nRDlE?=
 =?utf-8?B?d3U1QUszdHdzK1VpVitJTWJBQWdPc3VhelZtWWo1VTVrM0hzaDFIWHBGZHNK?=
 =?utf-8?B?S0QrUG90bWRzbFlDVENoSTVIblN2ZWxwVXdBVm84MFFQdDBJaUZRRmQ3YTBM?=
 =?utf-8?B?OThFYTZ2SEFTK0tVeThueERjcmVBUVdNbXNtY3d5TkJ0VTVXMjlKUWFJalhN?=
 =?utf-8?B?T0E4M1V6VUJVYkFvWmdrcGFKY1NOdXVVWWljcXNBVkx6c2NMYzdmREs2RCtY?=
 =?utf-8?B?NnJZZTlqV1BocmxaNGx5ZDhWMWgyaEhiV1c2RXpuV0phUUFkY0FFKzliZlN2?=
 =?utf-8?B?d01kSnl1VjJabDlBWm4rbHFzc3dDOXRvWW9WODBsY3NoY1h5YWdYbkhpcWtp?=
 =?utf-8?B?ZDlZSnZSREJ2TGY3ZHdENytHdi9yN3FqOGg1SE8vVEJIbjJsOHU5WUF0SG94?=
 =?utf-8?B?V3NJVUU5WWdLQ2o2RVEvOThCMmhsbk9wOGYzcWdHR0RJZm1MdzNkd0lyQlpE?=
 =?utf-8?B?Ymo5SVp5eXJqL2ZZR3A1NldxenFjeHRHOWdUWEJ1WW1yNmhQbkdvT3pjdkRr?=
 =?utf-8?B?TzB4dGkralgxZDFDNnB6T3l2RHh3MjlycGZIKzcwK1F6S2wwQmpaY0NtZmw1?=
 =?utf-8?B?cVhuWXNhOHA5RUt4dzJuZ0RNOTVpNytRVVQ3NUJoTUJVa1lRRnJWZkU5cmpO?=
 =?utf-8?B?d3p2b0ZOZ3NGWWdpT25pMDdqeVA1TDVpWDA1QUJZdVM5WEloZ0hzc2hZTnRx?=
 =?utf-8?B?M3dFTVRabHZDVWZ0dDlRSi9VUUdsa1RXUHBuZGJrU1hrT0hXUWhPdmxTa3FS?=
 =?utf-8?B?aTRudThOdkhhdzd5TlJFS0JwR3E2a1ZoV3BtNkNCR2M5QUJiekNoc3ZqWjRP?=
 =?utf-8?B?Q2NFSWU5dWFvbldFNzVaMnd3Q3dOaTkwbTdHZjQrNTBzTjdFcUFtWU9MV1A4?=
 =?utf-8?B?aWcxTWJCMy81enc2WjBQQUlaQ3R5RGZlZ2R4QlE4bFg0cFFKQTY5NHNzM29n?=
 =?utf-8?B?YjBNSUp4bGRWYVFqYzBNZTY2UGVvTFZkTzk4QkRaM1dEK2JTbWlBL0NNQ0Mz?=
 =?utf-8?B?WXdxMW5BSThHVWNtMitsaGhFUnFnWDhzOGNqekhBbFBTWnJ0WjR0aUVrZUxD?=
 =?utf-8?B?elBuOU9HSU5SRGR0ZktuVDViNHhuT3VMU0ZzeS9UZDBGUmQxdVdpVXlGKzIz?=
 =?utf-8?B?RmxaUWRNNlZzczh1OW5aWkxXelNJbDlVMGd0Vnk1Y3RJWDRMdy80NFBGaVJ5?=
 =?utf-8?B?QlZiSzdOcTV5VlFQMk10ZUJKWTJsS29vS3BFV1RzL2IrMk45WUJXY1J4d0ZC?=
 =?utf-8?B?b2Y3ZTJXNWdZNkZwUmpmbEdxZm1waHNTQStBUjY0NTNYcVpKWUJTVnJuR2No?=
 =?utf-8?B?ZENBMm13SS85WWJ0cWlKVnhyajZRSzd2SzdHeGpNU0h4d25VbzBycFRMZG03?=
 =?utf-8?B?eVJDZDN4VEZ4TW9RTDVlWVdnRnkzYk56b2VUS29PQzlsQnBBTFM4RGdYMVll?=
 =?utf-8?B?WlI2SDJaaElLbTVJaGoxVmNINTlHQXFzUFdpR0FMK3EwSjJUbHBjTFI4L2dr?=
 =?utf-8?B?ZmRjeTMwMy9ZVVBHanZkSldDUnFsdzhCU0RIQnZRVllmWkNWd0lwTlhYYk4v?=
 =?utf-8?B?TmlUYm5UWTJqaVl1TjdJUGZ3UlFBb2JZc1JBWW5kemlUVVBNQUhvRy9tdFJm?=
 =?utf-8?B?ZThveWIrTStkTS95OWswN3h1WWhCRnpFUjlNdXB5UlE4azJEYWkydXV4V015?=
 =?utf-8?B?eVNzajBaaXh4dzU5WWhEd2dXYzJZVlpyQWR3N3VFUFNjS09wTHNtYXZLT3Fn?=
 =?utf-8?Q?3b/Jgo9vpZZuYolBkgGFjAjsDjocNZ53O3V7g=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8116
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc8498d2-88c8-4583-e5a0-08ddbaefd4ea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVcwRHZPbHhRaEIxSER4ZlpFWW5WWTRBSVp2bVJXMDRyc2FjVUVvVExPQkhH?=
 =?utf-8?B?MG9OQ0ZuTHdNQmh4K2Y0RTVmSGUzWEdhZEJqUHRFNmM1dFdNN05PWFhvQUtI?=
 =?utf-8?B?VnBYYkdLNzZveW83N1h3RVdyRCt1cEI5dlBEWVRybVFDa00zQkRUTGh5L3Yr?=
 =?utf-8?B?U29Mb0lHRmZCWmc2TVdMd3luVWFUSFRkMmgzK0krb1F3MzZpZHBCSkwwTENT?=
 =?utf-8?B?K0tCNk1BUWd5MEF4cFQxSVlkVU5QQjV6cFBlc2FXejdTYUtJV1BheTlCSXRk?=
 =?utf-8?B?OXE0UnFtbXdDRlVHaDE1Zm9SdUdmZlptN0c4aVduZmR3M1p2WEViU2dDdlk5?=
 =?utf-8?B?TUs0USt5ZXJkQmt5d1FaUXlucXp4aDB1d2NOUFAzbHVKelNxK1RUL3hGTG9m?=
 =?utf-8?B?RnpxS3BUYm0wZ1hOUDZUeFM0V0orM0IzTVd2QTVGZ2dZZmI1ME01K2RRSVZ0?=
 =?utf-8?B?VTc0TjJ4UjJFUGVtdjZ5K09rbFBkVzIvQ2pJRHQ5ZTVLU2ZJclYvci93bkd6?=
 =?utf-8?B?WXErVmROUjBmVGU3RUtZYzEwWGEvTThkaDlONmszUk95bVZXQ01ZeUpSdE1K?=
 =?utf-8?B?N2MwdW9peWZXS2VmQVc1SWRkRU5LNE9uRXB1eVUrT1l2Sis5cFNDcE5Xd1Bl?=
 =?utf-8?B?RnM0VlJld296WEMydmZXMCtrSno1ZmIxVUJ0REF1WEIxZU9pdEtxUUlHNGZj?=
 =?utf-8?B?K0VRbDhaUHE2c0ZrT0wycWpPU0JRMHlWVU1oTU9SN2VkbUVONUEraTZjV1BP?=
 =?utf-8?B?TDRQcExHemJGMDZlcm5mc0VqOXVaWEMybmZqSjhkN0F3eVF4Nnl5SEtHM3c2?=
 =?utf-8?B?bTZNTG9UL2dzeXppamw4NllOeHNYc3p0SWY4VXE2ZWIrMGo1MzJkd1JISlR3?=
 =?utf-8?B?Q3d5TDRabU1MKzlYc21UWXpRUGpTeWNRSlNCNnk1WFpSUWxjcFZxejRBNzdL?=
 =?utf-8?B?czIzVWFuWml3QWhEY3ZnU1RHMVlrQWdXQVozNGwvTThLUy9ZVjB6VFhIM2hr?=
 =?utf-8?B?RWZ6c0VrbEhaTmpqU3J5U1gycHNjS1JNRldoT1liSDBCNEhxdkxBQjhVRnpL?=
 =?utf-8?B?Rk5QT3RmOE9Zb3YrcWJiMUovNHFtY2tWeThqUjVSZVZsMnpBcWQ5NkZZK3FJ?=
 =?utf-8?B?b2tWT1lRc3FVZUI2eGRkazhlOTFzRWNlQU9sejJmT0RZRkorMFNaQnhOWERT?=
 =?utf-8?B?b08wNnFrcWlWdDlvY2l4Wm5LU2R1blFYeEJoTklnRm93eDgwdnk3Rk9iQU83?=
 =?utf-8?B?RmliL0oyaEZzYnJCY21WNko4ODQ4aUFINEFXeExXRlNWY1hVVmt4aGczVU5F?=
 =?utf-8?B?VGF6T2NyajBYQ1pZTlBBajlHemIxNTNPVU15cEw4WkJ2TGtWTFdaaU9nbEJq?=
 =?utf-8?B?WDFiUTJlNkpwd0N5aVNOLzhrM2xGbExoNDdtdHZGVjNCdEpvT1BVaW1IY0lP?=
 =?utf-8?B?VStiRHYrOWd5R2hFRUpGdUZDd2ZvQjZ1WFlabkt0RUdHVFJlUkx4Ni9BWXZo?=
 =?utf-8?B?d3pweEp1QmRuNUd0TXlpZkVXZGYwUllQRWhpUHoxN0lhWnozUGx5aEt1YTdI?=
 =?utf-8?B?MnljcVVkNElTQUJUS1dIaEVVaVlndmk0ZWt5dklMNCtGL0hJMjc1LytaTVo3?=
 =?utf-8?B?b0F4YlV3Mm5FbFZPZHUwR0JUcmpXbWlDUG9XMi92b3ZweDd3bWlEdlBHdlBp?=
 =?utf-8?B?TVAvb3hXVEtzSC9JbkF6VlFVV2M3eXpJVDZ5K2JzLytYOXhOMjJuVHpTeXZJ?=
 =?utf-8?B?dW1aNlMxR1ZEZVc1UHRlT0dTUmJSV3pobi9NbDhLdkZPZnpZUURRUnYzNytS?=
 =?utf-8?B?Y2prMEVXQkhYazN1eDc1bEZrcHB5WGhCTTlFcjlHam5ENzN6QWZhaWRUL2Jv?=
 =?utf-8?B?RnZoSzhuZVhUMTdwNXdCOHVuNCs5eFhtREhNRjRVcStSRGNJdDFGUHc5aW00?=
 =?utf-8?B?Rk1vMHlld2VZTXNOdXNXTFhQYW5nWkUzL2tUWTdmejhwTVlFS2VWTWhtSXJv?=
 =?utf-8?B?dnl0enpkTllRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(1800799024)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 11:42:53.0293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef7e528-43da-4069-20e9-08ddbaefe958
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868


On 04/07/25 4:52 pm, Catalin Marinas wrote:
> On Thu, Jun 26, 2025 at 10:55:24AM +0530, Dev Jain wrote:
>> @@ -1301,16 +1314,39 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   	}
>>   
>>   	table = pmd_offset(pudp, addr);
>> +	/*
>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
>> +	 * us to avoid taking the lock in __pmd_free_pte_page().
>> +	 *
>> +	 * Static key logic:
>> +	 *
>> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
>> +	 * execute the if block, then this patches in the read lock, ptdump has
>> +	 * the write lock patched in, therefore ptdump will never read from
>> +	 * a potentially freed PMD table.
>> +	 *
>> +	 * Case 2: If the if block starts executing before ptdump's
>> +	 * static_branch_enable(), then no locking synchronization
>> +	 * will be done. However, pud_clear() + the dsb() in
>> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
> Statements like "observes" really need to be relative, not absolute.
> Like in "observes an empty PUD before/after ...".
>
>> +	 * empty PUD. Thus, it will never walk over a potentially freed
>> +	 * PMD table.
>> +	 */
>> +	pud_clear(pudp);
>> +	__flush_tlb_kernel_pgtable(addr);
>> +	if (static_branch_unlikely(&ptdump_lock_key)) {
>> +		mmap_read_lock(&init_mm);
>> +		mmap_read_unlock(&init_mm);
>> +	}
> This needs a formal model ;).
>
> static_branch_enable() is called before the mmap_write_lock(), so even
> if the above observes the new branch, it may do the read_unlock() before
> the ptdump_walk_pgd() attempted the write lock. So your case 1
> description is not entirely correct.

Thanks, I see I escaped by saying "we have read and write locks patched
in so it will all work out" this surely needs a better explanation.

>
> I don't get case 2. You want to ensure pud_clear() is observed by the
> ptdump code before the pmd_free(). The DSB in the TLB flushing code
> ensures some ordering between the pud_clear() and presumably something
> that the ptdump code can observe as well. Would that be the mmap
> semaphore? However, the read_lock would only be attempted if this code
> is seeing the static branch update, which is not guaranteed. I don't
> think it even matters since the lock may be released anyway before the
> write_lock in ptdump.
>
> For example, you do a pud_clear() above, skip the whole static branch.
> The ptdump comes along on another CPU but does not observe the
> pud_clear() since there's no synchronisation. It goes ahead and
> dereferences it while this CPU does a pmd_free().

The objective is: ptdump must not dereference a freed pagetable.
So for your example, if the static branch is not observed by
pud_free_pmd_page, this means that ptdump will take the write lock
after the execution of flush_tlb_kernel_pagetable completes (for if ptdump takes
the write lock before execution of flush_tlb_kernel_pagetable completes, we have
executed static_branch_enable(), contradiction). Since that contains a
dsb(ishst), that means that the store is observed by all observers in the inner shareable domain,
which is (I think?) all CPUs. Therefore before taking the write lock, ptdump
will observe an empty pud, so we cannot have an invalid dereference.
What is wrong with my reasoning here?

>
> And I can't get my head around memory ordering, it doesn't look sound.
> static_branch_enable() I don't think has acquire semantics, at least not
> in relation to the actual branch update. The static_branch_unlikely()
> test, again, not sure what guarantees it has (I don't think it has any
> in relation to memory loads). Maybe you have worked it all out and is
> fine but it needs a better explanation and ideally some simple formal
> model. Show it's correct with a global variable first and then we can
> optimise with static branches.

What do you suggest? As in what do you mean by showing its correct with
a global variable first...and, for the formal model thingy, do you
want mathematical rigor similar to what you explain in [1] :P, because unfortunately
(and quite embarrassingly) I didn't have formal methods in college : )

[1] https://www.youtube.com/watch?v=qeUHlXOBXmg


>

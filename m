Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E1B202F8F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276999; cv=fail; b=CUX9NBLngZvyVt+KMIYdLbkIMhmB4PBvmOsWNRRP/fD1r9A87RTgn8nXZT92GOPc09ghXwYemgR+Vpzk8fizC56EVX3I4EgjtTGZ9axd4c8VFE8Xa6BkCYPNkYh5XdJkWaWlBckCyPsmTwXIhL0Hbay6EfBdkonrpsX4UXxreao=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276999; c=relaxed/simple;
	bh=JRmMXkGP8YD96Fj0p7GABimOfNZYXqDqqom9pF6XBMw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ESyfF/DE0hRWucJZBa7JCAVFX7KM2bl/8cdY/3sMNYUEIClPJ46K4cQE98da3tnsMkW+N9IYR0nLbT/X4+LNs0XFoaSSRJ+h6ngMwRspmE0OcyT7/P7k6ljjtQy5qxzl7UQa654QTrEnYyZ3VPZuDNZGoZjtLdyw/ECj7SQMzss=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=b+9AHkls; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=b+9AHkls; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="b+9AHkls";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="b+9AHkls"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QYQPj3ppoJ5RfjvIMrzYzXoJCDxRzgqWVhrXmSf0+2LUR2RpA4SjxFdfCikiOdxZdOjxtM6eC1bB35p+OJJcSCvC8sBctn0DnhTh3RgoNnO1i8D3xuFyZyE/3bC0OpjEf9DDLwUkMNH1A0lPmEWufQelYz8FC6xQROxlNi6sKcQmotDTV34xSlGxF7P8RkeMhHww7lEDbrcYcBwdZEQwU8ZEYF0CsU9hwtYTV9C2X/UA7pdFYYAuJfrd+ftVWrBSYxWz+M74AAt1UINk4iWBpo2VTs5QATm4SZYXUIf6ulcDebqZ0lFt3HIEGpP/MSZiz6L8HD3E//KLb/D6aTEmJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOkHGSSdLP63cSqbeh/iuEHE5XVGyuaDLmvUzmH8JTo=;
 b=T5wNPrUG5aI+QNEr9LYRHrgOKkYuiHHql1r2/RkvhMPiFLIzFW8KYufxCu3/VSUt23q69zEKl6UxDyC2rpIjqh+lk5EranBboevMTBd/cWvR+SYmaJgpdCYnbPxuiAADbf9JH7BIWU5vDFjCSaKkIgjnjAkcOkTGF+fmHzUF4WkhLhqVJvS5xmybCTpjV7/GRxI1NBB0XBRdgf3NUXQqUHrJMojrgaW6ExU1G40j+LMe1p7xweeqeTyUx+oV1f+Wv9RWHzDy1f1Ryj+w5V3ZJdqionLwrqqotVkzRdisAL9lWGCBddfUPDD1q2TpuV3gTecLcOXad4kBC1BLF9NTrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOkHGSSdLP63cSqbeh/iuEHE5XVGyuaDLmvUzmH8JTo=;
 b=b+9AHklsavuVn3OYDGFuK6mz7w+lNZR8DEvIqcSKH1jNTah+X5IW7o7dm8+AyJPZ+lEkiCkyRRJ2sq9Ei/K7YAZ+OZxU9ujfK22E8N9L/vZI9biZhZ8Gd+8/lz71LSBMTgitu5DQx0IG5kCwJ6aogFQxx2BFgt++FYOab3bpx7E=
Received: from PR2P264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::28) by
 AS1PR08MB7539.eurprd08.prod.outlook.com (2603:10a6:20b:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 30 Jun
 2025 09:49:51 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:101:1:cafe::24) by PR2P264CA0040.outlook.office365.com
 (2603:10a6:101:1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Mon,
 30 Jun 2025 09:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.1 via
 Frontend Transport; Mon, 30 Jun 2025 09:49:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtoyOyWLjN4IAxd/9BWaIEi/m+vpFQysMb34+rmPA0XeBGcelQHBxPeYEweYavyAR6wvArB2azhlIcWIheLh+kzCiaImiLbDjebfE7OQLh+IxfZ5pOjShNTWkF4Ti3G2wO8ykcxE6GiEFFvBFFsRPXi8MHBNHTP+21qMjTrlgFTu3rcE9OfXtvZP2MeYRKaRksQzW7I06jEg9qSUG47xlyIa3HRuh4bSRV+psVQuPPKQfWpOq9kJhMTljq2E+8p88i+W3HQw9UpUA0FV/1cwGu2zHKxvTueII4es3ghKrGHmCP4ZumcCPU7ZM3OSn2eMrZR3MorW/6/Z4DNhNbSuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOkHGSSdLP63cSqbeh/iuEHE5XVGyuaDLmvUzmH8JTo=;
 b=MTnUUxn6arMqInRfKCwAWon4F6uKLmncQzteQWaCT8tkKOfFIP6tNAlxIeJYabz2ENaAh6Qr/B3B8cM/g7ahQzKBsyYedLv13Z2FmxZZM5pbyDq2CGyDASMMZlpmdY7cECIaief6wKF5NEL1pIXuIAgHrjuSCsHvSVnLQsowZq94HDosCurNapuWDrdHs/GcAhCdiRTfkqXWzI1X+TO5AfnhdCHtHcNfW1E8FAM6fSuYrzDrNi9ivavkyN7lZ1NjLPVZWhixAG2CyiPI+BX6j1lCStRU7CrtB/ohcZ4ZeJZp3TS6yfWDo3KfNBg4Nb3THEVO9yfmNW5DRlGhMc9L/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOkHGSSdLP63cSqbeh/iuEHE5XVGyuaDLmvUzmH8JTo=;
 b=b+9AHklsavuVn3OYDGFuK6mz7w+lNZR8DEvIqcSKH1jNTah+X5IW7o7dm8+AyJPZ+lEkiCkyRRJ2sq9Ei/K7YAZ+OZxU9ujfK22E8N9L/vZI9biZhZ8Gd+8/lz71LSBMTgitu5DQx0IG5kCwJ6aogFQxx2BFgt++FYOab3bpx7E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV1PR08MB8619.eurprd08.prod.outlook.com (2603:10a6:150:83::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.28; Mon, 30 Jun
 2025 09:49:18 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 09:49:18 +0000
Message-ID: <aa35a908-e4e0-4ea7-b626-181619fd2e1e@arm.com>
Date: Mon, 30 Jun 2025 15:19:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
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
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
 <e029c030-2b0c-412d-b203-4342250b2deb@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e029c030-2b0c-412d-b203-4342250b2deb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV1PR08MB8619:EE_|AM4PEPF00025F99:EE_|AS1PR08MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: c43d3eb0-b9aa-4e7a-de15-08ddb7bb7549
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Yk5XU2J1b09peUhiaDMwTlZ3dTBhVUJQbW5EMTh4VFVrdlRRWnFtM2EzWmtR?=
 =?utf-8?B?Vjh2TVVCeTdlSXJwZmZScWoyVWMrakdmS2gvekx2bGg1UldiZkp4WjJxbW4v?=
 =?utf-8?B?TFVNanpENmZZMWFzMm9FWHBDSExPRXBaTWs1MVhTZ2hIUG1tQWVGZkQ5UG5t?=
 =?utf-8?B?eVVYZkRuQlhrS0luRlBIeFJLc1ExcHZsZkZjSWMxQkNQQWN4ZGlZTDF5VEd1?=
 =?utf-8?B?cGVVQnFnNTNNOHhpczlvZ2lCQzIwOWI4QWhCcGFwQUttUERGR3VVc3h3Mmsy?=
 =?utf-8?B?OWJwQjROYys5bFFjZnFDOFRvUUF4N1diZGxpVnVBQ3IzdFNONjlWdjdyMml4?=
 =?utf-8?B?ZWtyV1dYVFAzUlREa1lja3NwQmZjMURhMjlRbExpbmRXSWJWZlJNUjFLU0Zn?=
 =?utf-8?B?dnYrWTZTbXNweTAvUGRVZmJydnloaWVXK21nWU9zeERpcWNRS09tRjdaK3VW?=
 =?utf-8?B?anVrblNmZzVmNUV2Q3cvTFZlZk5KWXJKNlFvK2tXWW43Z1JYeU9mOGlMNmNE?=
 =?utf-8?B?dlBVQ04vNmk0VldnRnhudEREZUk0MHVYd0VmRm1uczNwVFpQalpVUGJYZmhN?=
 =?utf-8?B?cVp4K0txZ0lFOWFneWptckZodEl1a1hIRnNWVy9ZS0tBTFBsMWNBbFRmR21s?=
 =?utf-8?B?ckc1emxEeEVaZW5FUFNCNHc4bS93STJWcWFPaVVFK0I4T0dJaENNbUd6Ny81?=
 =?utf-8?B?OXFjUW9ZNXlOUUlNUjVBdnNKdXl4VzFMNHhKRnllNVlMaFFYUm54NThiT1Zp?=
 =?utf-8?B?eWszZCtxZW5xZm9oOHk5NU93bHVjbjdZTVJYSjBESlhjd2FJSm9aa0hRK3VH?=
 =?utf-8?B?b0w1YTlRRnBGNXZ0Zko4SXB0T1VLZXJxTDVTelF6eW5vWXVkMUEzRVNaM0pI?=
 =?utf-8?B?bkZzR2xyZFVVRUJRQ1hPNlFNQ3g2Y1FnQThrRWVEWkRjdDdONUlNRVVpNHhs?=
 =?utf-8?B?dzVadUFOL1hEZy95OWVQNWwzeGpzRjU1cTc2d05qbDB3ay9mcTA2RnBzeW84?=
 =?utf-8?B?V0doRmgwZUtGM3Q2OElTdWlGc1UyNUZhV1A0akNtRUR0eFpsVCs3NXdFTCtZ?=
 =?utf-8?B?Y1RJVWRDdW5xU2d1cURqMVUwODA1TCtVajQ5TzJDOW4zRlhZNUwwb1BUMzVm?=
 =?utf-8?B?K2VxR256KzhheUJLQ2RZTzRHSHVqOE12N3pxNWZZczN5UzVDd2h0TFphN1Bh?=
 =?utf-8?B?WE9yd2VzTEtwL3dTbDd6NkNxS1JYNW15TmtoT1NBSDVBRDNJNnpMZm9GRXdL?=
 =?utf-8?B?WEtOZm4wZVpldTA2bW0xSU41Zk05TWRKdERXL1RFdXUxWEJGUHdrL3VGdGF6?=
 =?utf-8?B?aE03Z25CNG9UQ1QyMGxiVWtIODJXYS9zT2dsVzhYK1o1UklaVW80a0JZVjAz?=
 =?utf-8?B?MENvUDlaRkEyeGpwenJtVUQwaXJ0NHJrVzEzY2xSMDRtM1FvVFZrdXpndHpm?=
 =?utf-8?B?VG5xd3NydFBlelcrc0FVVFFqeFpFdWJYQThCejU5K20xblhnQ3pRREl3cGgy?=
 =?utf-8?B?SldoSmJlVTZBNEZkRVlJMWxkMllaTmxwNXF0a04ySzVIQ3N5Wmx6YVVQWWdM?=
 =?utf-8?B?R2l0bVVJVXpwQjB3UUM5alNtM2hXRDl4Q3V3UlRpN0lFU2pobnRYTVRkZE1M?=
 =?utf-8?B?eG50cEZJQ3Ayekd3S09aUDZBWHgzeTZrNWFKcDl2N0JId2d5ZTQxV0tsUU82?=
 =?utf-8?B?a1hhRUhlNndza2ZkV0JmbzN0N2dHU3lkNGpaRHcwNXVna1FHL0QrelczcG1a?=
 =?utf-8?B?MHhLd1d1TW02clhIaithMlJKUldzR0o1QlNDVFNJVi9iLzU5NU1mYmpuWDdi?=
 =?utf-8?B?Y0ZxRmxEaFVaYVpRUmFtL0dIVEdId3hpeGlPWVhMTmx6dlJMTGhxa3FsOFZP?=
 =?utf-8?B?S3drakw0SXF6bGZQMDlSQ0pNOG9veUtwdnE4dG1ZdmJ2QWc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8619
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d714b89b-6b24-4c68-1da4-08ddb7bb6190
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|14060799003|7416014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkU5MlpuYk1vaFg1TjJweFZUTzF2RWs4b2QrYWNZaDFocDdGRlVqdVg3dGd2?=
 =?utf-8?B?TUd0TkpiQUh4Z0FDalQxaDZJRWhoWTExeG9UakRaZTlkdnA2QllQaGJjbzdn?=
 =?utf-8?B?QXdwZ0VaTzBXdWx4UER0b3dJbURmNkxBN3g3Mjk0NThRQkF2aC8xR2l5SldN?=
 =?utf-8?B?MTdHYzZwUFBzd1BUWGJ6TVBLdlN3MlRUSSt3bXlDYUlwVThxMXlRMktXUy93?=
 =?utf-8?B?N3U2TlZHY1BiWSs2Mm0rOGZwM0hoUlNTMTk3RWxNcXlaUGxBTmJrTXM2TFh3?=
 =?utf-8?B?MjNJZC9ObkJWOERwZDJzMjU1QzQ5ZUhZVzR4Z3Ara2JDNGs4NnBrNUlIMzQ3?=
 =?utf-8?B?d2x0bkhKcGxvZ05TREN0MHRJRVR6dzJDYWU5ODdsNjkrcE1KR2RreUtwWHZG?=
 =?utf-8?B?NUl3Q0RGeUFVbFJFdzlrNjVDSVd0ZVZlbm1uVTBJcnpqSmczdXQ5bXIrM2Z5?=
 =?utf-8?B?YnNPZlhuTlJLWDFvS3l4MVFYSFkvNGUvQWFVWktkMGU2ZC9qRUVuSWpvYUJl?=
 =?utf-8?B?VWJ4a0JyTVJWNjFXaXpGNm1VQzNzVWNEeWk3K09BdmhFclVaeElPUjEvdXNJ?=
 =?utf-8?B?WHVRWU5WaXVQWXAvcWw5YkNqejc2cy92RHBhTVlKRlZsZUlZZGpVRjdhUGJh?=
 =?utf-8?B?QTg0c3NrN0xBSmNHWWIya1ZGYWtnalNacXc5bndSYzhFOUk2d09NNWtrandL?=
 =?utf-8?B?NEJHUSsvRERmWlBBa0M4a0x0REp0NU81WlhOSC9CdndyZzVHaVU0NENmN1d0?=
 =?utf-8?B?WnRQZTg0OGNjZy9PRlkwQ3ZNUUR5M2JYb2FxTVRXeUtGaC91N1ZBZG1GWlB5?=
 =?utf-8?B?WTJPVE9kbGYxMHJFalJwbURCeG5ERW5RK3JleEpCd0hGOXlBZ3FaWnlRN2RE?=
 =?utf-8?B?aHV4SWxQdTdaMVNmMEFYM1dKUW1RSm1ueDh1Q2JMN0RDblVTcGdXQ0JqTEpa?=
 =?utf-8?B?d093MVQ4cTZHUzllZXBKbWJNWENxSXVTZFJybi94L3ZLd0c1R08wZHYxb1Zn?=
 =?utf-8?B?anlTbWFSRVNKZkFTTzZIVkpUSmxGMWpaalpGZElSWUZZai9pY2lFTzdGWkt3?=
 =?utf-8?B?eEFBQUI4V1A2OG95VkNCc3hMNXhram9idGlxbkxUa0IwUW9yRDBoUDZScVJv?=
 =?utf-8?B?OHRBM1F0dEJQTWg4elYrb1FyNXlEUGpxa1Y1SDdnT1FNMDM4OFRJNE9NY2N4?=
 =?utf-8?B?R25lcEdJY0tPM2VySXlJdWFtd0M2MGhLUEFRZGdDa3prR3ZxVlZjQnRWVVhE?=
 =?utf-8?B?WlZnSlJrRWF1czFSUUhKNXNTM1h1dDVRcTh5YVVrd0NtWGxZdldTbi9jZ0VG?=
 =?utf-8?B?bHpuQzFhY0E2SDB0Q0Zvc0RDSXc1QlBkYU9HSXQ1RUowUXZUVDkyV3dMWThm?=
 =?utf-8?B?L1dXMUdUTENYL3VDNk1pSDYreVI1U0RwY3g3cDNyUUtNaGxsZ00zc01acDY4?=
 =?utf-8?B?aUJkcmNvWk9WY1YyNXpydTU0NXFqcVE4UGxBMnlhZWlpNmljTm94c2JSbWdG?=
 =?utf-8?B?citGcTlEWldKSFlleFhicHZNRXZ6MWhuVDBmcTFhSlpwR0JJODdTMnhwTnNP?=
 =?utf-8?B?ZmpmbXIvbDN6WGRLRmFwRjZpWFNRTENIdVBnYkc0NFRGTWZra3lzN2krd05V?=
 =?utf-8?B?SVJFTkxyTFJDNlk2L2pvbS9IcWFnWlVDbU5SSFgwbnJ1Wm96bU5NblBtTVFq?=
 =?utf-8?B?N1I2bnA2THNCYk5vZUJTN09ZWm9DRmE2bUpiandNWlhEK3lGRXdZdENNY0VD?=
 =?utf-8?B?Zjl4N2hoRWREYkd6d0hiUzF1WG16dVRmRDJZRnVuVldZaEFxa3hoUnlmZXhi?=
 =?utf-8?B?cnM2M3JCWDJLQS9wamE4U2xqTVR4N0hJVkNnc1FuWURNYit1VG9yZUtLZndj?=
 =?utf-8?B?NWtFSVBYa0swbi9oL0huTE90MXlLMHZxWnJObWp6K1pkSXd1VnY1T2dET0d1?=
 =?utf-8?B?bitZLzloeC9RZStvcTJNSzBVY3BXUE9PYnV0Uk1hYkVmN0JnK3lpczNFa013?=
 =?utf-8?B?c2RQQ056dE1RTmc2bUVvTEgzdE54UkVRbEkwN0U2STdWMGJOZWFScW1PeDNB?=
 =?utf-8?Q?v/sDAK?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(14060799003)(7416014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 09:49:50.9909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c43d3eb0-b9aa-4e7a-de15-08ddb7bb7549
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7539


On 30/06/25 3:12 pm, Ryan Roberts wrote:
> On 28/06/2025 12:34, Dev Jain wrote:
>> In case of prot_numa, there are various cases in which we can skip to the
>> next iteration. Since the skip condition is based on the folio and not
>> the PTEs, we can skip a PTE batch. Additionally refactor all of this
>> into a new function to clean up the existing code.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 134 ++++++++++++++++++++++++++++++++------------------
>>   1 file changed, 87 insertions(+), 47 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 88709c01177b..af10a7fbe6b8 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -83,6 +83,83 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	return pte_dirty(pte);
>>   }
>>   
>> +static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>> +		pte_t *ptep, pte_t pte, int max_nr_ptes)
>> +{
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
> The !folio check wasn't in the previous version. Why is it needed now?

It was there, actually. After prot_numa_skip_ptes(), if the folio is still
NULL, we get it using vm_normal_folio(). If this returns NULL, then
mprotect_folio_pte_batch() will return 1 to say that we cannot batch.

>
>> +		return 1;
>> +
>> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>> +			       NULL, NULL, NULL);
>> +}
>> +
>> +static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t oldpte, pte_t *pte, int target_node,
>> +		int max_nr_ptes)
>> +{
>> +	struct folio *folio = NULL;
>> +	int nr_ptes = 1;
>> +	bool toptier;
>> +	int nid;
>> +
>> +	/* Avoid TLB flush if possible */
>> +	if (pte_protnone(oldpte))
>> +		goto skip_batch;
>> +
>> +	folio = vm_normal_folio(vma, addr, oldpte);
>> +	if (!folio)
>> +		goto skip_batch;
>> +
>> +	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
>> +		goto skip_batch;
>> +
>> +	/* Also skip shared copy-on-write pages */
>> +	if (is_cow_mapping(vma->vm_flags) &&
>> +	    (folio_maybe_dma_pinned(folio) || folio_maybe_mapped_shared(folio)))
>> +		goto skip_batch;
>> +
>> +	/*
>> +	 * While migration can move some dirty pages,
>> +	 * it cannot move them all from MIGRATE_ASYNC
>> +	 * context.
>> +	 */
>> +	if (folio_is_file_lru(folio) && folio_test_dirty(folio))
>> +		goto skip_batch;
>> +
>> +	/*
>> +	 * Don't mess with PTEs if page is already on the node
>> +	 * a single-threaded process is running on.
>> +	 */
>> +	nid = folio_nid(folio);
>> +	if (target_node == nid)
>> +		goto skip_batch;
>> +
>> +	toptier = node_is_toptier(nid);
>> +
>> +	/*
>> +	 * Skip scanning top tier node if normal numa
>> +	 * balancing is disabled
>> +	 */
>> +	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) && toptier)
>> +		goto skip_batch;
>> +
>> +	if (folio_use_access_time(folio)) {
>> +		folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
>> +
>> +		/* Do not skip in this case */
>> +		nr_ptes = 0;
>> +		goto out;
> This doesn't smell right... perhaps I'm not understanding the logic. Why do you
> return nr_ptes = 0 if you end up in this conditional, but nr_ptes = 1 if you
> don't take this conditional? I think you want to return nr_ptes == 0 for both
> cases?...

In the existing code, we do not skip if we take this conditional. So nr_ptes == 0
is only a hint that we don't have to skip in this case.

>
>> +	}
>> +
>> +skip_batch:
>> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>> +out:
>> +	*foliop = folio;
>> +	return nr_ptes;
>> +}
>> +
>>   static long change_pte_range(struct mmu_gather *tlb,
>>   		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>   		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>> @@ -94,6 +171,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> +	int nr_ptes;
>>   
>>   	tlb_change_page_size(tlb, PAGE_SIZE);
>>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -108,8 +186,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>   	do {
>> +		nr_ptes = 1;
>>   		oldpte = ptep_get(pte);
>>   		if (pte_present(oldpte)) {
>> +			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>> +			struct folio *folio = NULL;
>>   			pte_t ptent;
>>   
>>   			/*
>> @@ -117,53 +198,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * pages. See similar comment in change_huge_pmd.
>>   			 */
>>   			if (prot_numa) {
>> -				struct folio *folio;
>> -				int nid;
>> -				bool toptier;
>> -
>> -				/* Avoid TLB flush if possible */
>> -				if (pte_protnone(oldpte))
>> -					continue;
>> -
>> -				folio = vm_normal_folio(vma, addr, oldpte);
>> -				if (!folio || folio_is_zone_device(folio) ||
>> -				    folio_test_ksm(folio))
>> -					continue;
>> -
>> -				/* Also skip shared copy-on-write pages */
>> -				if (is_cow_mapping(vma->vm_flags) &&
>> -				    (folio_maybe_dma_pinned(folio) ||
>> -				     folio_maybe_mapped_shared(folio)))
>> -					continue;
>> -
>> -				/*
>> -				 * While migration can move some dirty pages,
>> -				 * it cannot move them all from MIGRATE_ASYNC
>> -				 * context.
>> -				 */
>> -				if (folio_is_file_lru(folio) &&
>> -				    folio_test_dirty(folio))
>> -					continue;
>> -
>> -				/*
>> -				 * Don't mess with PTEs if page is already on the node
>> -				 * a single-threaded process is running on.
>> -				 */
>> -				nid = folio_nid(folio);
>> -				if (target_node == nid)
>> -					continue;
>> -				toptier = node_is_toptier(nid);
>> -
>> -				/*
>> -				 * Skip scanning top tier node if normal numa
>> -				 * balancing is disabled
>> -				 */
>> -				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
>> -				    toptier)
>> +				nr_ptes = prot_numa_skip_ptes(&folio, vma,
>> +							      addr, oldpte, pte,
>> +							      target_node,
>> +							      max_nr_ptes);
>> +				if (nr_ptes)
>>   					continue;
> ...But now here nr_ptes == 0 for the "don't skip" case, so won't you process
> that PTE twice because while (pte += nr_ptes, ...) won't advance it?
>
> Suggest forcing nr_ptes = 1 after this conditional "continue"?

nr_ptes will be forced to a non zero value through mprotect_folio_pte_batch().

>
> Thanks,
> Ryan
>
>
>> -				if (folio_use_access_time(folio))
>> -					folio_xchg_access_time(folio,
>> -						jiffies_to_msecs(jiffies));
>>   			}
>>   
>>   			oldpte = ptep_modify_prot_start(vma, addr, pte);
>> @@ -280,7 +320,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				pages++;
>>   			}
>>   		}
>> -	} while (pte++, addr += PAGE_SIZE, addr != end);
>> +	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
>>   	arch_leave_lazy_mmu_mode();
>>   	pte_unmap_unlock(pte - 1, ptl);
>>   

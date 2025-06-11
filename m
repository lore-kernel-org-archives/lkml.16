Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E090190497
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613574; cv=fail; b=mbbd5FuDNc2jHwGMBYbTH83XZAyEqGvU4KoUbo7V6OBsmVFghDg952c0+rNAHF/FBlcWudznDIpOow9XXqRMD7wGdoS8LOPyHC3f95TocFULmuj+8/qE5lYQ9o7S9joLmTOk9LDUuwnPU7LmLyCi4uul8uWU++20v7OxcUXsYv8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613574; c=relaxed/simple;
	bh=g++ETmkSg2icWb7zKnw1r1Aq/E/n5CLlYqu6igK0dPI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FgWj5wft3XveS1aPeeQ+JSvoC42mXtMQyzlV/GCJ5M8IVAai+GqoEQQfxVphKW3SDp7VTRd1oGD0MsMzCxq5xHjHayduPbQdsXnAn8Ni4Do6uGiXTN5xDb4AnqezxsDHsT0fsEMvKkYCih1s91jO/CzFQnfxReyv1ircs3Dd+TQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MoiqrlNW; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MoiqrlNW; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MoiqrlNW";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MoiqrlNW"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ioQClhsdMiBIWou+rSt9kXvL56zAUe8qBau5+qgj1HLbYuMKDF09R2kOAza3fyEiXUNQ+adZRLHOwk+y5DmL7KK4jd5Q58hqQ1zuGAtBIY7gdJROE7KD/e3MQzXjvzbxsLV9d4Pa6Hy85+Aiar2dOB+Zk93+SQoZjrGq7TzbaJwb6cKqeqRjBkHxLptVWR6n4hFiQacDQ0ocNLxPGGo6ZlB3jx1K17WfuGYG5sZQScQnkDlFPxPeXqFYyaEJJg7XsaPAGIcLowpbbEXxn4mOzkuQB4bwDkcTi0eLxEaiNqSRhf1GO77MCKAkwy8Lp26hS3YbBkFE6pb38CBuZWNx8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p38ZcAmPIXbfL9v3YljPKEyDLdyZ0bLa3mvx2PXDxE=;
 b=DA2NZaSMasmD2z8FrvqwiLkQxKksssVkO66Yp4JD9EzTplfU3I/zb5FgQMs87xcHzNK1DPv93IPbAOHKZgkrzZIggSFJoPfIn+rqFJTgeAqAejR8rdBjVpApO7sZ9DD4xp9918FdzH0A1fbfX5JhJ7tWZGdBMbOa5BJjXhpX0ertVz8w/m0ikP7toN2wbtTrwt27ZNpTgAOZSQMU6N91y2hS49QEyZwBAbfwqiqQKEtTjmU3c1B8EXizYHvNBTsT1Kd4iTD/V699DLrelajIB8rnn/9gDsjttMbVhXnr4W+LeYH3ux6HeIOxaQ066NpV12NlBTOdGKnGGyTNY4kddg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p38ZcAmPIXbfL9v3YljPKEyDLdyZ0bLa3mvx2PXDxE=;
 b=MoiqrlNWEuUQiAIhU64XMUsGMy69CTbpj+zC+66QuGWPHbcb1LJIwmUyjRpDPr8DjfbdxcaNn2ocpt34zy2265NZtPP5MIITDJCxDIFcyX8M7PIQAFQh6ErbQNxjjM/boo3wFdmVFKMjaQ4XtmMaoWhMVMUivMj9tS1zoZGgM5s=
Received: from PR1P264CA0123.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cd::8)
 by DB9PR08MB10377.eurprd08.prod.outlook.com (2603:10a6:10:3db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 03:46:08 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cd:cafe::75) by PR1P264CA0123.outlook.office365.com
 (2603:10a6:102:2cd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 03:46:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.0 via
 Frontend Transport; Wed, 11 Jun 2025 03:46:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPTHb8i8W1nN1XCtR/GAhALD/VTu9d86S92OPXUBgSPGDr81dgL1nsyYUV/ZA2g1gcNE4JaDjbWG0fIrmQW/DXkPdLrD/mVF3QhTC3g+lFZ+jBx3VnnXU9cZNHPQJDRiN8YBKwBOtqjYPkk9aR3yXRM0toSOYXusC6Dk3F6HpoG8FvTwOV/FBC3A2QuXiINSW4cOzYQxnOETX8bxokAR1TP1XQrdRQ+rhZbQgC8aLn0E7PgVybM2SHj5UNwARCsmbERst9826gayKt22Ja2p0KZiBpwzjIcyo/QigQg0zLiTyRj7mam8yx0h8n0NEHmh5nuQy8EL1dvXM6qK49bcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p38ZcAmPIXbfL9v3YljPKEyDLdyZ0bLa3mvx2PXDxE=;
 b=uAmd1phSyY8nETbWF/GXVHgIAH6ZaVM6nj0a48P3gR2N0PO7fAplvN8gmSekmuWQYO9+PUcm1wQJAIDF6qSXeFJ6wJeqDYZQ59wbsmEi7tHOmLEmsNcf7292zXzczYjMAMmkCTTOKTsDqNqLn6GTDIqWed1PWJQDaavEINZlQP0yJWMKKKtr4/57Zhgef4Sm7c/eRpDUWVayjlrKhOQgM0PerxgAk4GLGyg/Ux/H6jj0O4nCwLXEQqGfdl09SvY01YLhSfz2M/yVqllA9Vk6Pu8OXD5/Bw4A2J8TMz3IXImeKD58LgPUQhB1eboFQZ/z6oYf1dwt0jAixVY71huNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p38ZcAmPIXbfL9v3YljPKEyDLdyZ0bLa3mvx2PXDxE=;
 b=MoiqrlNWEuUQiAIhU64XMUsGMy69CTbpj+zC+66QuGWPHbcb1LJIwmUyjRpDPr8DjfbdxcaNn2ocpt34zy2265NZtPP5MIITDJCxDIFcyX8M7PIQAFQh6ErbQNxjjM/boo3wFdmVFKMjaQ4XtmMaoWhMVMUivMj9tS1zoZGgM5s=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAVPR08MB9282.eurprd08.prod.outlook.com (2603:10a6:102:305::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 03:45:34 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 03:45:34 +0000
Message-ID: <c99e60d8-57c3-4607-a0ea-b12ed6765b73@arm.com>
Date: Wed, 11 Jun 2025 09:15:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
 <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
 <359668fb-df61-4135-89ee-2675a06a5c1b@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <359668fb-df61-4135-89ee-2675a06a5c1b@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAVPR08MB9282:EE_|AM4PEPF00025F99:EE_|DB9PR08MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: 3494be12-3c31-402b-0353-08dda89a7f8a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?c01IbHFTK0FNVmdEYWJWZExjdFhNYVhLdGVCZkNON2RMQUt1dEMzNFRBZXk2?=
 =?utf-8?B?RElhbzJSVCtwSG9ya2FvM3Bna1Bhc1FsQjVnM3o4dHVQZWpkdmhLQTlFY0J4?=
 =?utf-8?B?WWFSSW1mZVdkclcrZEZYTFNmbkhJeE56T25EZ2s3TmtIR0JnNjVjSDkwV2FE?=
 =?utf-8?B?MzFmZWQ0WDVGS3VqQWxlNjV2UmtnQ2RuSWVoWktnMm5oM2d4RVlrYWlXbG1B?=
 =?utf-8?B?L2djR3d2bzN3RE9HamVQWkJudFdzMzd4WFV4aFhIRjFmU0ZVL1JhSk9ISmVD?=
 =?utf-8?B?aHJQTEhFNDJEelpkY2RmbUxJai9xbCs2ZVNwYlVRb0pLL0VVWWFKZ3N4VTcw?=
 =?utf-8?B?Mi9uNzUyQ0hyVXh6UVJSWGtSUHgzYnhPa1kwLzBXSEhNenZFVlcxaUlUK21K?=
 =?utf-8?B?Z25lMXV6clNDWlZBUlFqU3FFR1hLQjlKcmJ5bVVkbCtmZ3U1QnRsblc0T2Ni?=
 =?utf-8?B?UnpLckg3Q20rWjFrbjNUeS8wYTN6TEZVMjJ5SHpPNmx4bE8yNmV2TC9RYnBw?=
 =?utf-8?B?VWF6V2VHRHJpMm1zOWVHQnhEeE5yRXhCUTZ6TFlSNFZYaEk1aWkzQUFSSFJm?=
 =?utf-8?B?U2R1NHBwdGRyYlUwL3VUOXhpMVVNV2NHUzMyVG1FNXZEVWxYRUJ0eG1yT3RU?=
 =?utf-8?B?ZmdEUWxzdVhuTE14bXVaQXlrZXgxdDlKMkNGNkQ1WHZEcWx5a0kwNktaV3Rp?=
 =?utf-8?B?OWpyaTBDOVhla3JEb0IwSm9FSFNCNlVPY3VsNTFuV09iUUVUMC95YlYrK2RH?=
 =?utf-8?B?S0ROZjNUZWNYNUcwNER3dnM0VWo3b1FjK1hsNytDdkhEWSsrSFFjLzFZaHU0?=
 =?utf-8?B?WGxPZHBybVRaWDJscG51MUIzb1VqMmd5L2N2dnFJQTlKU1NKNVA5bGVHR2Nk?=
 =?utf-8?B?U1B0clM0ZmVSMHpIbzJ6bTJSWXBWWFQxYTVDQnQ5VmJpM0c5OU00OWprWXBs?=
 =?utf-8?B?d29hVVp0L1crSHJHdGdmYk1GRkpQS0pGOVF0ZVBCMXpwOW9ONWIwd09ScTF3?=
 =?utf-8?B?VDcrMUpyMmxQeW9zUjNPd21nbmFGdTNnTUNrVU9tNVNWQWpwL2ZPVlJsc3hP?=
 =?utf-8?B?WEwvOU9WYmFqZGlMcDlaaWdRY20yV2IyVTJGVnY0TW5MRWhxTmRPS2E2VTJC?=
 =?utf-8?B?UXE0dlAramE3a091aDJZVndLTG9GS1hOLzVWZHBRT3JBdU5PZzBYMHJqQjVW?=
 =?utf-8?B?TFhqUXRsTDZZd081NW9TOVVDaTZ4OW0rUGVlMlZ5eUdXZm1JeGdIQjdyQ0pS?=
 =?utf-8?B?MFhVYTFvVjdxbEcyWDRyS3BmWFkyV25wejkzZDZNSjhhVmZzUitrdW1rZzVp?=
 =?utf-8?B?NDR4RXFFWXNPYTdwSmVlSDMwSWc0R2t6b0ZrWkVyK1R4aE1zMGRqMmtUVnB2?=
 =?utf-8?B?QXRReFhBMnZvOSszYUhNU3JYN1N1NWdIK1phczdDUjFHWkFrQUo1dFRBM2JN?=
 =?utf-8?B?YVBRZWVrdzkzT3MxbHNOcmcrZ1dkaUhKZFFaOHRuWStENnBSTFRhbEpBalk2?=
 =?utf-8?B?ZHBsaEJXNDhsYXJuUjErY2tnK05pZmxrUkJLVjRWU2YrQ0hSOTNDenU5dnh4?=
 =?utf-8?B?UUprUWdMaktmNnFpNkt4eDV5NFFmTGNBaVJYdlZVRjNoQVVpS1ZkbmxQVzQz?=
 =?utf-8?B?dmZKZU5VMzh4dFN3cGtEbnIvYmt0d0NUaUNwa3dCWC9zOTVPdWkzblN0UTB1?=
 =?utf-8?B?a05qZmtOblZZT1I3NGNXejdYU0ZBazNPU3dEWlRCUXhqUzFOYTVIUTNVb3ps?=
 =?utf-8?B?UkVlWnBvSEpCZWVucWpYVEUxSWMwaHFJOTlLSTBROGpZYVpLZGhBbEM1aW1q?=
 =?utf-8?B?SmgvZTlka2xDVHhzM2plQUwwNzlheXJFVmtaeG4yRkFXbUhhS2xFV0pmSXVS?=
 =?utf-8?B?OXpZS0EzS3FqRmk0bFVIaEE0cG1xT1JRMXNZaUlMUm9xbEZCOExCNmk3R3VM?=
 =?utf-8?Q?F7vpwVnCNBA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9282
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a901a39-2a73-4c51-b7da-08dda89a6be2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|7416014|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mmp0WjFKSkdxVmZRN1FtZHJSQkY4ZlVoOU1CcHVUTFU0NXd0NFhJeFVxVEQ1?=
 =?utf-8?B?SGphYnFQb2twNTZjbVhsT2p1a1ZQSlpFOGFMSTA4UWNnZG15TUQydmJrSE1W?=
 =?utf-8?B?MW15bWtCUE52czE2bm05VHdYVGYrNHRUUGlQRWp5cy9Md1BlY3lFWVQrYW1Q?=
 =?utf-8?B?TGRBYzJJNkJUQTJUWXVTN2RjeXVMYjBFYzFHcThUZTE1MmxiYTA4ZXJYOGRl?=
 =?utf-8?B?U2NscFc3SE9lVStBeng4OVZOTzZBa1M2VG80MDBubThvbjQwbjRQb0hCTlhX?=
 =?utf-8?B?TVRkbWdxTS81QkRVTEJYTHhNWms1Y0hHSENYVVkzakVrSWMrUjN0a3I4OFR4?=
 =?utf-8?B?RmRFQmlKOFlTRDB6VGpDOTRaSVFtWmxyVDJOWXRMbkQxOHJsZHBYV3RaNURh?=
 =?utf-8?B?TGVtM29CVDlsQVZENW81eExrdFdtcnB4OWtkVndLa29DTG80aTI4aTR3RkJB?=
 =?utf-8?B?TnQ1eXJ6T0hzeVFvUVlENG44REtTUDd1eW5FZlREYXpjSGNRNHlzcTF1dVZK?=
 =?utf-8?B?RVVPTCtadkIwSU1BRHU1bkdQdUsvNG5OcFpOaWxobVdqOXRRbm13VDZjV281?=
 =?utf-8?B?ZFJ2SFhic2RmZ1BHZVRKMHBuLzhMV1dkMUg3a243UlVsNHU1QlZ2VUFscTF1?=
 =?utf-8?B?YWF0K3RxN0J1N055MnE3cS8yeUY3T1pzUHVmL3FZOVRFRUxQU29nRC9yT0VT?=
 =?utf-8?B?WE5ZNXpDUzdaVm9EU3VEL29lWFZsTDFhWklzbkk2SlFZZFFxMm8rV2tEWDV0?=
 =?utf-8?B?VnQ1eDB6cUFHN2hHa2pwME9kTktmbnlDRk96L1YvQjkrMm1aSTAxSjZDSndN?=
 =?utf-8?B?cURSZmxaQll2SmRtZEJPUEJvV1dtQ2FnUUpVckhMQ3N3c2gwdkJqYzJrN2cr?=
 =?utf-8?B?bThzRmh3QjRacHY2bXRmZmNkb0g1L2Z1ZzkxMEd6VTZKb2k1bkVyVnpjWEtx?=
 =?utf-8?B?WGI1dFVwSklMMlNzWCtYcnRzV0d2RmpCQ1YvOWtReGFOMjB0UFFOUFRoa1ox?=
 =?utf-8?B?Q3Q1c2NLdDM5L2x0aXNTRnNGTGRzRURFaFV5WUMrTktya1VSRnBMN3V2SzlU?=
 =?utf-8?B?bmo0c1VpOTR5Qk1VSTdnL2xYUDVLcjRGcHMyMkJzcG5WTDhJY1l6Rk1Yc2w4?=
 =?utf-8?B?V1lGcFU3U3Y5bWdmbGxTL0lEUC8wamRtM2FwcFcwZlB0bk5rcUs2OXFXNkhE?=
 =?utf-8?B?Mm1lR2htOFBKMVRzQWtGRkRvN1hJRng2QWljUU51V0xIZCsrWjZXek0xNW8x?=
 =?utf-8?B?SHB4QmVzbUNQWWdvaUZRRU9CUDMvVmtNYmVtNTFDQXR4N3BVN1pYa2hVYjdE?=
 =?utf-8?B?cTFDNWlYQ0xpdmdsbmVKNDFPQzFVSjl6VGJCVWJLYlM3cE8vZW4yeWNFcHlH?=
 =?utf-8?B?eE8xNllJYzZsaGRmTVIrbHhIdFp4RlFlTFJScDVsSmZlREZjT3luL2x6S25U?=
 =?utf-8?B?Uzk3SnhZVXpxb3hWQVlXZE9qVXdwMzNlNU1ub2Z5dlBuTjI2MHFtY2U4d1RX?=
 =?utf-8?B?YnlNM3BGTHVnU0xLc1pPRGpUTnFhREtvSGRqL3JxQXBXRVpwRVdkdnNmODlC?=
 =?utf-8?B?QStOdytncHNiUFhGdnFXdHZveUllUXlZV2FkYzVGbVlzbGduYzMvNzZzeW9a?=
 =?utf-8?B?KzVCM0FCTzRtWWtIY05DZXIyemhIblVoMW9jeGliUzUwYStEc3o2dUFBWmtX?=
 =?utf-8?B?dmw2Q3FabDRsanRTcXNqS2Fua1VJTFAvSEYxN1JVRGgreHJFMlhiNzIzeHc1?=
 =?utf-8?B?YVZON3NKNGY5OG0zTXEyZWdXQWc3cEdOSVk3d2w4UUJEdW1iRDl6cUNzcnJP?=
 =?utf-8?B?ODRYRTE5WVhYUkpLY1M1TzBaUlE2ZGVsdkNPR2hWM21lSEI4OWM4L3ZTQnF0?=
 =?utf-8?B?Mk1OTnl5VVJHeXd4NXdqbllXcU5ndW1OeTJ3d01MdEtrV05FR2ZZcHFYRXkz?=
 =?utf-8?B?eVNjdE5kK2I0OUNvV0NqVWhrNGkzTitLWHVBSkpob0J2YlhwU2F1YktaYVFG?=
 =?utf-8?B?VzhaVlgwRkVwWWNzcEticitEWEhqZXNmVzFheGtXSXRjVEtxNlF3dlZBOFRL?=
 =?utf-8?Q?AW6l4A?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(7416014)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 03:46:07.3755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3494be12-3c31-402b-0353-08dda89a7f8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB10377


On 10/06/25 6:57 pm, Lorenzo Stoakes wrote:
> On Tue, Jun 10, 2025 at 03:24:16PM +0200, David Hildenbrand wrote:
>> On 10.06.25 14:07, Lorenzo Stoakes wrote:
>>> OK so I think the best solution here is to just update check_ops_valid(), which
>>> was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
>>> enforce the install pte thing).
>>>
>>> Let's do something like:
>>>
>>> #define OPS_MAY_INSTALL_PTE	(1<<0)
>>> #define OPS_MAY_AVOID_LOCK	(1<<1)
>>>
>>> and update check_ops_valid() to take a flags or maybe 'capabilities' field.
>>>
>>> Then check based on this e.g.:
>>>
>>> if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
>>> 	return false;
>>>
>>> if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
>>> 	return false;
>>>
>> Hm. I mean, we really only want to allow this lockless check for
>> walk_kernel_page_table_range(), right?
>>
>> Having a walk_kernel_page_table_range_lockeless() might (or might not) be
>> better, to really only special-case this specific path.
> Agree completely, Dev - let's definitely do this.

Makes sense.

>
>> So, I am wondering if we should further start splitting the
>> kernel-page-table walker up from the mm walker, at least on the "entry"
>> function for now.
> How do you mean?
>
>> --
>> Cheers,
>>
>> David / dhildenb
>>

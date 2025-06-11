Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0E81624E5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613460; cv=fail; b=fkfONOb5BwX6MwDJ7CHcMO2ruX0Ip27UE9prATTYq8b3GCJGillbeSLqG9jqzgHOvJD7mDrspcocS5QlR5N11eBeCMEaLtgGJUiOHp0NIXfXLM2YYCPeOIVrgfzJoRk6nXt2HnqU0pfVwcDzrxvY+wHN4ImfXE2DPNZKIuFCPfo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613460; c=relaxed/simple;
	bh=bzKIz7r0hIYMbzXR3tqITrIDVj6Lc6nmStvXNjbJDN0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VfplkWhzKQWFuZO0f/rJpo5Mxk+XEhYuaiaMsYNr+57xo5uV7yKxpe+DEHZLqi+YgNcyF0Yqj/8gl24NFALxTNcPDubORDUgJ0le5YU6kCElu6dfTr9+2xqzkL3zsm6uxWuxc3oeaElVgXK9cVeT0qrFzCIUFXtjS/5+0p5yT2I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cTCiAoys; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cTCiAoys; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cTCiAoys";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cTCiAoys"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ndU0/6D5/yAV9NDRBT84urFE8kz5Osj0nBZ2oF1xlbfwfrcpU5bYx6H5prXqCndjMXDVhcggxylpItiJGlkEPjj8a9pfvNoIl47/CP6XvgcZQcAZRJV9JEgV8AC8gTVSHkDlDft54foWtJu3bcaux2cDMXbfiMKRoUqFkQV4fTrEuLfZ6obQjIOZKlVhGNdYrjOxqG3kH94YU2/WFWiqAz9uxnepHmYVz0JFao9LLppwJukOyTbBs32N1g3od/GmXVhcpcbcAHsPjuAoqw+BxcrFGvtJ9AXHz9F/bRgodnJ151y7K8XFtHCO81oQABRr94jJi3kZ3m8i8G3WZb48rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IZs1Ab9VlQ+6tml32XTQG/Zi42e678z4aSHjI1fNmk=;
 b=RJWX0myYkCInUyNxz0AM02Y1igBoZTe61oHHIcsD+jq/OPmpfg/5FkvNHrY3S9fk7c4sEKDMtCuiEKgCszB3HbGFWGZfuQAS3cGxWXikCV94aetuRL4Ply4c/W88KQXCnsfW/C+XPy17lVbwXFx56TBo5xswRdhExmIKkOJucHlAfWE2xO+qN77mDEy8gCJsOgvszLxIuPezXgXydXJyo3B+7rIYBwFO2Bd9p4iuroLZSuNK7Ix2Qyfg7G3OPbQILN4YJY9EKkYwH39EJVktwNlpkOVx2DmlP/Jdths6SYgMM6X2EeYlllIdUE0zxB6IAdZLqYm9iBfBO54aay9U4Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IZs1Ab9VlQ+6tml32XTQG/Zi42e678z4aSHjI1fNmk=;
 b=cTCiAoys+Y19KEbiLQ+3rPF9rjeZVnFx3FZwflMmjFMbwgftZ5dNdFaV2IQAcZUS3oY8sTiR9Tws2+l9w7kcuOWpJ71+ECuw7Pq2E4qeMWbKc+R6O4Ix7wrgD7yoJzw4fvDCyLjsBbAQr5oszMFohunkcLiZnKHUpmiBqxRrq0E=
Received: from DB7PR05CA0045.eurprd05.prod.outlook.com (2603:10a6:10:2e::22)
 by AS8PR08MB8802.eurprd08.prod.outlook.com (2603:10a6:20b:5bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 03:44:09 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::a3) by DB7PR05CA0045.outlook.office365.com
 (2603:10a6:10:2e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 03:44:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 03:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChvwIZU8NOM3qVpgDbtY9qzjGq0c5xkLgRzWgnoKeGpHJdGERX1Zd96SSfqzusQrMVkg7AuddTP586NuVmtRxiPmSRzdgVnrJYQ/nwm9YKRb4cqJI04uXAwg5JOl0ZlPg6jhDKBAu/bh9ZeTOE5+7SHVwbq2dTSkGEMmn30EwSmbPXOXsOyv6p9lze2HI2LKaB7frhpQPcugHaSra8qwro4tmAEXmmypFAAth3J1ovmewMTUwVJ3XWGqnLp6lwwHUl8qD0PCYXybGhBQeWO33eT0wRY3Iu2J9MgCO3+BYmzedmtJMx56oKKqQncWFnWGMKcHCBOQLH00W+Ut+Ymo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IZs1Ab9VlQ+6tml32XTQG/Zi42e678z4aSHjI1fNmk=;
 b=KejKTrtkhhDzViqz/r3ww/PK9AT6GUUqBYnXQxIf8+PQuHo4D6YxlqiDyWS9HnNePezYz4mEYMY9+FqIPQakRZB8i26i2YoNZtCYqbnI6ikKiMsWhmpqpoTofKIl32RyXQe06RXRV+gxd62y+JtShOkjPn2nfxGRH1Ys86IBcmEg6cHmPSYE1pHw3odW083fWg0dVPOQeIpkRzLrN2Pb6mxWZyOmlz1n7dpVNIhtOwg8YhXKrb7TZmQe4kJ7znwRAAbdwj+idgtbTKFrndn6shF+uTFMm5feA938WKuqLY4SQLqdZAl756YiOzJjikvs2OGMjaEG9JgGoXCrKx+wZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IZs1Ab9VlQ+6tml32XTQG/Zi42e678z4aSHjI1fNmk=;
 b=cTCiAoys+Y19KEbiLQ+3rPF9rjeZVnFx3FZwflMmjFMbwgftZ5dNdFaV2IQAcZUS3oY8sTiR9Tws2+l9w7kcuOWpJ71+ECuw7Pq2E4qeMWbKc+R6O4Ix7wrgD7yoJzw4fvDCyLjsBbAQr5oszMFohunkcLiZnKHUpmiBqxRrq0E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM8PR08MB5618.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Wed, 11 Jun
 2025 03:43:36 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 03:43:36 +0000
Message-ID: <b05c9ac5-ae9f-47bb-9f38-c4abb5dce5c2@arm.com>
Date: Wed, 11 Jun 2025 09:13:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
 <1e89f07c-7620-4f9b-b647-c585824ce015@arm.com>
 <4cab8fa7-2679-432f-95bd-4cb0bc636b56@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4cab8fa7-2679-432f-95bd-4cb0bc636b56@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM8PR08MB5618:EE_|DU2PEPF00028D07:EE_|AS8PR08MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b128133-9eac-4930-80d9-08dda89a38dc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TkJPUTlGN3FCOFVVb2tOcUF0SzM5UjhNR1pPMFpCWHBUZjcvL1FBR0Zkdk45?=
 =?utf-8?B?LzZ5SVV0WnpVU1E3U2NvK1Fwdk00b3l0WGs4ZFRuT2czbzJuYm4va0IzTE9s?=
 =?utf-8?B?ZUtURHlwcVlzU0pHSXh3RjE5YnlEZGNpVFhyODFGMTBrOUcyZnFJUnZYbkdr?=
 =?utf-8?B?dTdONjZrQzJFNjZZWjd2SldZY2VQMXQxNC9xK1VCMVZlUm5HTGZ6YWJ4RHpZ?=
 =?utf-8?B?QVVsY0hSVTdCNGQwM2N4N2V0S0lvWW1UdE9XYzN1NjB0VCtteVVKWnpGZmQy?=
 =?utf-8?B?VFFrVnJFZmFqYlFYNk8rM1NnM2QvWGlBS2dicXB5SnBMajZDUXAzM3BqVkhE?=
 =?utf-8?B?bEIyR2s1VE9rd0NxQ0VvSXBTK2xiRjdQV3dCbnA0S25nTm1HeStvb1A0SG1y?=
 =?utf-8?B?RmxISFc5RXhLTGtrQW9DK2NwSHJTOE9DQ3hpSHNIVWNPTXRpVGZlbHJ1YzUz?=
 =?utf-8?B?aG9oRGlyRnNBS1hxNE1seTdGWEt3ZEtIbTJNMDZuOCtlVnlKblNWYnRFb1ZM?=
 =?utf-8?B?cUFFVS8wekgxOEkyRkxYd1ZtMjJwNTl4TW9hYi8zWlJ5Mm93aS96cFEyRHd1?=
 =?utf-8?B?dSs3REl5cEdScjZoeHFFUFBUZXR6eFF1SGRxaXN0ZUExSnkwNTQvY3JKbVBY?=
 =?utf-8?B?RjZkSzRBSFB2QStmYzRmVVZaL3pvbGg0M01iZno2UVJuL0dlU21ERGwxcmN5?=
 =?utf-8?B?QzNIWDBObndIbTNVMkl2S0doM2RHSTNEbHFNQVZaVjlMWUI2TnIxNkhWQzA2?=
 =?utf-8?B?THVKK3JrQzlaTlNDektIdHFzSFFaQm5adStzN3VwNlozRzdvdGMvNmZXMTVa?=
 =?utf-8?B?YUlhZmJUSHFLdmlvc0pDVDdwQWtGczlUWklyV1NMSTlUaWRIeXlZVzNFdjVP?=
 =?utf-8?B?bmphQkdoK3E0aTBVV0lVaGpGWWlXcEJhWkNvWkRpY2RqbnNsZEVZV3pVQUxo?=
 =?utf-8?B?cmc5L0lOditucHlvSGVGRFhUb2hzdUcxNnUzVk9VMDJKRlYrakJkd2VsZmoy?=
 =?utf-8?B?K1YwWTltVXlrck55eWU0M1FXVy9DODFaZEVCUEZkK0VaLzJXdCt2V1IyeG4z?=
 =?utf-8?B?eVZITVcwUGhXcmliUmRibmxhUGg1aDh4OExqUDdaMFFCNHI3dkU1Nk0rNTlS?=
 =?utf-8?B?R1hDanQzNitJS2Y0ODhib1ovY3hGN1oxa0dKUE0wQW9mZVJOK0NFY2MxS0NN?=
 =?utf-8?B?ekNDa2tuTU13RGVkU2t6UW9Da1R1dDYxQ2lsVzk1UTV5bjZvbGxWSFFnMTJa?=
 =?utf-8?B?dVlEajFXZFlvRXc4TXdrdi8vL2thY0Z3cjlvNWUvVlhDUzhBUDNMYlg0V2Fz?=
 =?utf-8?B?Z1FEYmE5dmJUUmpnQlo4YUpHZmwxTUwxQWNCeVBiQ2VHZ2MwbGVleC8xQVZn?=
 =?utf-8?B?VHJIeGpESENoYXpOZDFLZmxmRllIQi9DOUVZNEpiZzVWMTRyb28xTk0wL3FD?=
 =?utf-8?B?K1UrOTVYUnpMY1ZiN2hJYWZrZllPakJPU2RFNHM4Um14aU5PZkw3VS9rellG?=
 =?utf-8?B?VW5GaHFmTEU5cEFLbHhvdkNJRWNoaXVYOUIrQXRjVEJFMnJEOUh1ZU5uYWhN?=
 =?utf-8?B?a0tXQjRIWjJSMHVlYkxlcUFnZ2FhR2VQbmZ6ZDJ2UzNtQm8xRTRNVEh2M2li?=
 =?utf-8?B?eStmZkVzR00vaVNvRlVFQU1MMXBiLzA2VEhnUDRHb0JGVzVRUm5IMWQrTm1k?=
 =?utf-8?B?UXRKZW81bXg3eThteVhGcTU1eEpOVkhYQkM3VXhhYWdGZnZzZW5qUHNqZkRu?=
 =?utf-8?B?NU9IRUZ6emg5U1IrMzRGVmRTVkZOeXJ0NWE5Ym1IQldZS2lCVVdvNWI1YVFB?=
 =?utf-8?B?cXNwUllOOHBLYVRjblFvNjlYZGpXYkkxMytDVFpNRlNFNG1MQWx5d0lnS2lU?=
 =?utf-8?B?NWd3TTBrRHB6eVY2amlHaGVaYUtsSHFkK1BDd2FYdFlpUmIrNU5pUUI4a01N?=
 =?utf-8?Q?xfOnFqp2k4g=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5618
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1ecbd58a-9dc4-4ff4-30aa-08dda89a251b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|376014|36860700013|1800799024|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUs0elUyMFpyYW83eEVHQkEwbkZtVk1UTTVHRGx4WUJ0THVzVmQ3WVRtQnJO?=
 =?utf-8?B?UERUcFhCYy8yQm5TVjZEcUxwb0ZLTmgxOThEdXdxQzliR2JIVVV2Q0tkMVVj?=
 =?utf-8?B?NC9CS0xwWHhZSmlNQ3VUQjR3dWdJNkcyUEVsSW5ZWW9xL29kL1Z6SW9namtq?=
 =?utf-8?B?aVgwT3VETEt5MXArOVV3UFh1V1h2Uk9HNU8raVpsYndSdkI1YU9XNEJJUEFJ?=
 =?utf-8?B?MTJoblVtUkdlN2Z6UnJyN1pLMjI2V3JnbWtCMnIyN2ErQ3MrZTBHWHBDU3FB?=
 =?utf-8?B?SzVleVNsb3F3bk4wUkpueldUV2ZkYnA0dWNTTmtHQ3J2R1lOa0M0YkNneHpu?=
 =?utf-8?B?VVlLTUcyZGtBTHkrRTlsclR1NE9lNTM2MUw2bnhHVmJQZCttQkZqQWpURlhR?=
 =?utf-8?B?MW1XK3MwR2JpVXpnaDEzL2xRbmFreFZDV2Y2TllrSXl4WStaUVpLZWpYQlB0?=
 =?utf-8?B?b29kSVJLeEFONGUrQm9BSUQ4VVpBYjhqOWhZY2RUOG9VM29uTVdMeE8xQTZI?=
 =?utf-8?B?c3pzeVZXdmtWS01HK1hsd0Z3UFVvdEhkQUVZazdEanlrVXB1c3RabHdrcndV?=
 =?utf-8?B?ajF6MXVHRWNLTmU5L2UrSlA5aEd5QUppaWFCVnlERWFLRmVoVjM0ZmErdFFC?=
 =?utf-8?B?U3FGOCt5L0hLUFJobjZuZmN4MjBuenlqUndoVkpaWlZ0eEFsRUhBNHA2NlU2?=
 =?utf-8?B?WjczR0dZelN3YmlMSmVweHBWSmRRVEczVHd3ODRhYUJqT1N3NjFIcGtpdzZS?=
 =?utf-8?B?NHRtbWxXaEtjdHRmWm8xdkI2UUMrMGtHRTh0SVNrZGVJZVduQURsbjF4ZEJ1?=
 =?utf-8?B?TXlUaGJBalJFVDhIc05aWTlMSW1SdHdkKzhJV3JBZXAzc3NDMFN6VWU5R1Q1?=
 =?utf-8?B?d3ZDZTU5S09jYmxNVVkzNG12MzZ0Z0c0TG55M3ZyMlBTSUNESHdub1p5MEh1?=
 =?utf-8?B?V2JNUzZqdkcyQi96dW0yakEyN3Z5YTJ2U04yWWUxREdrQVNQajNDY3M4SzFw?=
 =?utf-8?B?SmpNVVJrUE1DWTBxT0tjeVBOL1FvQXNsV2dhaTR2VCtLZ2lUejlCWC91b2JM?=
 =?utf-8?B?VHEzMkFTbjY2U1VJblQvTThDQ3lpc2pselM0UVNUVmNNVTZ1eEdKbUtCRldr?=
 =?utf-8?B?Y3pVZUMvU0J6eWhkaFZvUGdFRXBtaWpLLzg3d1dsS2trSHhxOFVSVHMxQ0Ez?=
 =?utf-8?B?MDVNaWVONkYzRlQvOGlrdlMvNnlxdFR1Zk9LcDVRdzIrcGJwSnFibGd5Zms3?=
 =?utf-8?B?VlUxOFUycUhweksvcnRqenZEOHY3OHJoTVk5ZmVJTVdxMmVoR1NjcHJsRzBQ?=
 =?utf-8?B?MXlzUkJDeEg3T3JpcFR2SytMUFU0RXJNTytDZ0IreFlSZ20xTUROMFNIamVh?=
 =?utf-8?B?YVRIMklPVVlvaTBFL0tFcWNkSG9JSkU4ZDRXSy96M3hEd2FRT0V2aTRST1JP?=
 =?utf-8?B?dllYVkpsQnlwbGJtbUR0SFlxZFBORXVpdUxmZElFdUdDUnJ1bUZCLzlqV3Ew?=
 =?utf-8?B?TWxyRHdETXBBdUxaY250MWhXMTNlTG9ycmJkQlkvUVBMZnRobW1YeFpqSCsz?=
 =?utf-8?B?SUVERW04UVJCdk40Qi8wN0YxVUs2TDhhaTFNYUVmRklVSFRPdTNJK3RTZVVF?=
 =?utf-8?B?T1Jsekkwa3doRm1KWmVjNHZnUy9LWUxLM2JFZVdwdjg4bEhzNE5oTXdGeEQ0?=
 =?utf-8?B?dnB0VFVueEhkcFQ4UFYrcUhLZ1dISHl2QXNJK0pvcVBpYkVoUFhpajgvbUZw?=
 =?utf-8?B?aFRDaysrTUNJZm1oL09HQjQ3alRySHdpL1ZKQ3FMUzRjcFluNXlCdTlETUgr?=
 =?utf-8?B?bXM0UmR2THhxTE1WOVl0Wkd3YVBTUUNJU0Nyb2tLOE1yMm1xNERCdUpUbWRy?=
 =?utf-8?B?OFRST3JxWSt1WFR3OUt1akxIcUxpUU83M1FLRERVbHpreHRWWHZYVmRPTXpO?=
 =?utf-8?B?U1JDOW4weUZ2MUdpMFFKMVFuRG0zY0dUNG8xQ2JqbHMzTWVsaGpGcTBJRmF1?=
 =?utf-8?B?OXpQdFBKNlpUVEszdEc4WXFmdEJvYTdZQkI2cnNZSlA1RjR3RUNGSmdKYUov?=
 =?utf-8?B?c0JCMzMwMUNqcytVOXhPY1NPY2RtdkVuYURkUT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(36860700013)(1800799024)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 03:44:08.7805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b128133-9eac-4930-80d9-08dda89a38dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8802


On 10/06/25 6:27 pm, Lorenzo Stoakes wrote:
> On Tue, Jun 10, 2025 at 06:10:03PM +0530, Dev Jain wrote:
>> On 10/06/25 5:37 pm, Lorenzo Stoakes wrote:
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
>>> return true;
>>>
>>> Then update callers, most of whom can have '0' passed for this field, with
>>> walk_page_range_mm() setting OPS_MAY_INSTALL_PTE and
>>> walk_kernel_page_table_range() setting OPS_MAY_AVOID_LOCK.
>>>
>>> That way we check it all in one place, it's consistent, we no long 'implicitly'
>>> don't check it for walk_page_range_mm() and all is neater.
>>>
>>> We do end up calling this predicate twice for walk_page_range(), so we could
>>> (should?)  also make walk_page_range_mm() into a static __walk_page_range_mm()
>>> and have a separate walk_page_range_mm() that does this check.
>>>
>>> I think this will solve the interface issues I've raised below.
>> Makes sense, thank you for your suggestions.
> Thanks :)
>
> Sorry to be a pain but I think this will fit more nicely.
>
>>> Thanks!
>>>
>>> On Tue, Jun 10, 2025 at 05:14:00PM +0530, Dev Jain wrote:
>>>> arm64 currently changes permissions on vmalloc objects locklessly, via
>>>> apply_to_page_range. Patch 2 moves away from this to use the pagewalk API,
>>>> since a limitation of the former is to deny changing permissions for block
>>>> mappings. However, the API currently enforces the init_mm.mmap_lock to be
>>>> held. To avoid the unnecessary bottleneck of the mmap_lock for our usecase,
>>>> this patch extends this generic API to be used locklessly, so as to retain
>>>> the existing behaviour for changing permissions. Apart from this reason,
>>>> it is noted at [1] that KFENCE can manipulate kernel pgtable entries during
>>>> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
>>>> This being a non-sleepable context, we cannot take the init_mm mmap lock.
>>>>
>>>> Since such extension can potentially be dangerous for other callers
>>>> consuming the pagewalk API, explicitly disallow lockless traversal for
>>>> userspace pagetables by returning EINVAL. Add comments to highlight the
>>>> conditions under which we can use the API locklessly - no underlying VMA,
>>>> and the user having exclusive control over the range, thus guaranteeing no
>>>> concurrent access.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    include/linux/pagewalk.h |  7 +++++++
>>>>    mm/pagewalk.c            | 23 ++++++++++++++++++-----
>>>>    2 files changed, 25 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
>>>> index 8ac2f6d6d2a3..5efd6541239b 100644
>>>> --- a/include/linux/pagewalk.h
>>>> +++ b/include/linux/pagewalk.h
>>>> @@ -14,6 +14,13 @@ enum page_walk_lock {
>>>>    	PGWALK_WRLOCK = 1,
>>>>    	/* vma is expected to be already write-locked during the walk */
>>>>    	PGWALK_WRLOCK_VERIFY = 2,
>>>> +	/*
>>>> +	 * Walk without any lock. Use of this is only meant for the
>>>> +	 * case where there is no underlying VMA, and the user has
>>>> +	 * exclusive control over the range, guaranteeing no concurrent
>>>> +	 * access. For example, changing permissions of vmalloc objects.
>>>> +	 */
>>>> +	PGWALK_NOLOCK = 3,
>>> Thanks for the comment! This is good.
>>>
>>>>    };
>>>>
>>>>    /**
>>>> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
>>>> index ff5299eca687..d55d933f84ec 100644
>>>> --- a/mm/pagewalk.c
>>>> +++ b/mm/pagewalk.c
>>>> @@ -417,13 +417,17 @@ static int __walk_page_range(unsigned long start, unsigned long end,
>>>>    	return err;
>>>>    }
>>>>
>>>> -static inline void process_mm_walk_lock(struct mm_struct *mm,
>>>> +static inline bool process_mm_walk_lock(struct mm_struct *mm,
>>>>    					enum page_walk_lock walk_lock)
>>> I don't like this signature at all, you don't describe what it does, and now it
>>> returns... whether it was not locked? I think this might lead to confusion :)
>>>
>>>
>>>>    {
>>>> +	if (walk_lock == PGWALK_NOLOCK)
>>>> +		return 1;
>>> It's 2025, return true please :)
>>>
>>>> +
>>>>    	if (walk_lock == PGWALK_RDLOCK)
>>>>    		mmap_assert_locked(mm);
>>>>    	else
>>>>    		mmap_assert_write_locked(mm);
>>>> +	return 0;
>>> It's 2025, return false please :)
>>>
>>>>    }
>>>>
>>>>    static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>>>> @@ -440,6 +444,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>>>>    	case PGWALK_RDLOCK:
>>>>    		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
>>>>    		break;
>>>> +	case PGWALK_NOLOCK:
>>>> +		break;
>>> Under what circumstances would we be fine with this function being invoked with
>>> no lock being specified?
>>>
>>> Isn't it the case that the one situation in which we can specify PGWALK_NOLOCK
>>> won't ever invoke this? Or did I miss a call of this function?
>>>
>>> If not, we should make this a VM_WARN_ON_ONCE(1);
>> I was made aware that there is a quest to remove BUG_ON()'s in the kernel, see [1].
>> Is there a similar problem with VM_WARN_ON_ONCE()?
> No, in fact the proposal is that we replace BUG_ON()'s with [VM_]WARN_ON_ONCE()'s.
>
> So this is all good, BUG_ON() is basically never needed unless you are _certain_
> there will be system instability that MUST BE STOPPED NOW.
>
> Which is almost never going to be the case.
>
> See
> https://lore.kernel.org/linux-mm/CAHk-=wjO1xL_ZRKUG_SJuh6sPTQ-6Lem3a3pGoo26CXEsx_w0g@mail.gmail.com/
> where I managed to somehow provoke Linus into giving some (very interesting!) input ;)
>
> But if you see the thread you can see further context on all this.

Thanks for the info.

>
>> [1]: https://lore.kernel.org/all/053ae9ec-1113-4ed8-9625-adf382070bc5@redhat.com/
>>
>>>>    	}
>>>>    #endif
>>>>    }
>>>> @@ -470,7 +476,8 @@ int walk_page_range_mm(struct mm_struct *mm, unsigned long start,
>>>>    	if (!walk.mm)
>>>>    		return -EINVAL;
>>>>
>>>> -	process_mm_walk_lock(walk.mm, ops->walk_lock);
>>>> +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
>>>> +		return -EINVAL;
>>> This is just weird, you're treating the return like it were an error value (no
>>> it's a boolean), the name of the function doesn't expliain the 'verb' of what's
>>> happening, it's just confusing.
>>>
>>> Obviously I'm belabouring the point a bit, see suggestion at top :)
>>>
>>>>    	vma = find_vma(walk.mm, start);
>>>>    	do {
>>>> @@ -626,8 +633,12 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
>>>>    	 * to prevent the intermediate kernel pages tables belonging to the
>>>>    	 * specified address range from being freed. The caller should take
>>>>    	 * other actions to prevent this race.
>>>> +	 *
>>>> +	 * If the caller can guarantee that it has exclusive access to the
>>>> +	 * specified address range, only then it can use PGWALK_NOLOCK.
>>>>    	 */
>>>> -	mmap_assert_locked(mm);
>>>> +	if (ops->walk_lock != PGWALK_NOLOCK)
>>>> +		mmap_assert_locked(mm);
>>>>
>>>>    	return walk_pgd_range(start, end, &walk);
>>>>    }
>>>> @@ -699,7 +710,8 @@ int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
>>>>    	if (!check_ops_valid(ops))
>>>>    		return -EINVAL;
>>>>
>>>> -	process_mm_walk_lock(walk.mm, ops->walk_lock);
>>>> +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
>>>> +		return -EINVAL;
>>>>    	process_vma_walk_lock(vma, ops->walk_lock);
>>>>    	return __walk_page_range(start, end, &walk);
>>>>    }
>>>> @@ -719,7 +731,8 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
>>>>    	if (!check_ops_valid(ops))
>>>>    		return -EINVAL;
>>>>
>>>> -	process_mm_walk_lock(walk.mm, ops->walk_lock);
>>>> +	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
>>>> +		return -EINVAL;
>>>>    	process_vma_walk_lock(vma, ops->walk_lock);
>>>>    	return __walk_page_range(vma->vm_start, vma->vm_end, &walk);
>>>>    }
>>>> --
>>>> 2.30.2
>>>>
>>> Thanks!

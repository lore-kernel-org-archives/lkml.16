Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012038.outbound.protection.outlook.com [52.101.71.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D467372605
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.38
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749788722; cv=fail; b=SeXxjDJx4wmXQabNxKVLjnLj3ZlvV8zG3yM80P72slcad/Dv/WdpSnw52cfNaRE672W58CATp25mNMyvkht+r1zmKscvVKtOXXd9zQLV4qNERS8ikm12/1u6Jt8ObCyzpn6JVO/ggUzb2r5TbUckUjXKMCprYbaa5Khup5UfZhk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749788722; c=relaxed/simple;
	bh=ehkgWEBstJkobIYz7lsOjjSXbMB3imxzTw2kGix1ucE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FQbwF+LN6rYXhAa7eyt2kFK5+NOgpfx/wZb1ezYRU4jL4vr+AoMLlzznR2ut8m/v1LY9eWxpmrze8X/YaZI6Bz5yyEIZga4M7eIRhvRHrs49pAgLQL1ZB3o6TDoBsSl1Ty6NS4uqd6A3zoYvsYcps13SuUhc8bmoP0NS0jZ0+oA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gE/MSC/A; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gE/MSC/A; arc=fail smtp.client-ip=52.101.71.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gE/MSC/A";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gE/MSC/A"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YgDSlnUPVDAEH67pz0gWDjnquHVe4Q/zCgZRb/RztDSCXR5MpLDcBuEP1O6EiS/UrPZGYijbHb6xzZ8riWMMKYt92LVkcU14dA2vjNiWw3NxPGhPMCc7bL48ay8zG8EBGiMg6Co/qWhaoGeIhlYhRSfNIBf44493+7rHoU1ELbfSoe7JUus1SDS+h3ZRmdzIAuSupuIsrqfLGpqy/zOh2oyFc5+JqP3nDr18XQbCCyqhHPCcDwTvFBQC/ZulhHSlmglC8yetmaJc3fb3HKm276oHh1uGCV/Cx+U9vpaYGrBp/ix20ghHwLbYpl7SUvIr4umHmgUgquJpXpHLmvgvjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaVc1irfIpNk6HI9m8cQl7Nv0o5Tf69/YqH2S1Gd7KE=;
 b=shbzF6BORQ6sz+xVaOwujv4R1j5oIjgpNMduqJRhqg+s+c3RlUckpQCWYoU+5u6kaKYCYfLa8SlocVRleZEvIQOCKQ+A5sMQuKG/ro7Nz7ksr2zQD18PkovuTX9WnEcHss6v1AAH6zMeo+xByxkvvWgUeEhbbzoDt7w1nt/3xzN0TqbIsGZnEH00uPqrG/ON9KtOf8Ym4SA9jaw/HpEOarB93/a4OW6vY4N5cYRdljSA8AdVjuf3mpWVLmD1ejMcKdydOFQYDy+noSs7TcXoH0OGtjphgYmiRm5EAFDV6ZtOnpnCnh053ECT5SsElgv0YaqqSk3ZDzcRuqWxnCMRcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaVc1irfIpNk6HI9m8cQl7Nv0o5Tf69/YqH2S1Gd7KE=;
 b=gE/MSC/ALT+eRzjIo9syvvoyVvAeU+h/GgEihqd2d+8M2aKT15X47YEW7qM0c8ydOHgY/hq9yTfeRfz0WLYmi+dnaeLUghua2VE5WOA9nlGUvlBSUjWL8uQWXv7SiuygeRSQWKPtxJHXo782TrAFH3O0zSTzVhhjsJ582/RDsoo=
Received: from AS4P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::8)
 by DU5PR08MB10466.eurprd08.prod.outlook.com (2603:10a6:10:516::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 04:25:12 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1::4) by AS4P192CA0019.outlook.office365.com
 (2603:10a6:20b:5e1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 04:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Fri, 13 Jun 2025 04:25:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlW4ecA7utRoqiF08p2nfqXViPrtRm6ukuox4T0uSfox6Vj5pKWyqPWcYIMKt4ug30ilEPCSKav4JZ8nxGOzfwUnXSEEU+JBz7WZiVwODfN6jy1d5/x57BHQGsBUbvKenAQfx8QiPU8Q86m4WQAHxU3ktH5/BKlJeC6fsXD8VTBgFZMD3T7VDu1yeVxVAT4W9KMYxag3C//n6NWWsWh9iL2Jb9R845WdT2JX2st5QhpXXujVHymmLFcNK/u4WAY+UDwN/Jv0D7udC010LRtdyfSdxz/N+myYJCKCfGiGU3isPWLB2XYmgI4I3/UQMEZg3DyjuixK0LLB43Bl31RfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaVc1irfIpNk6HI9m8cQl7Nv0o5Tf69/YqH2S1Gd7KE=;
 b=l4l58dQs3UtQRgOODJOVYM14FhvHR7kKgs/hRzia61yBC2NLZ5VtJ8fU/wu07J7qiohnMsXhSiflHNEQiKj7mcnXLRsv0t6S321RxAkbSE41HmKNG3ILjOnZiB9JWmP/5PC+ulCLlQRpG/TYEx8ay0TsNaXqWODElXu3LAZLSTda9evBzjEblZhTIdNSY9rsK/lkzAjfvigwXlL48slJ2q0gqsnsoYJzTx5ueUfzKWUA+UsAz6fvEZYeNZ2A3oEg2LRg6w8fowRc6r7Vl6Kj0yZP9ub/GIffNRz/Cil/9xPGKSKD+HMXljHiW8ymMl/HslpfsdrGOKx5x5lR9uaQaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaVc1irfIpNk6HI9m8cQl7Nv0o5Tf69/YqH2S1Gd7KE=;
 b=gE/MSC/ALT+eRzjIo9syvvoyVvAeU+h/GgEihqd2d+8M2aKT15X47YEW7qM0c8ydOHgY/hq9yTfeRfz0WLYmi+dnaeLUghua2VE5WOA9nlGUvlBSUjWL8uQWXv7SiuygeRSQWKPtxJHXo782TrAFH3O0zSTzVhhjsJ582/RDsoo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB9492.eurprd08.prod.outlook.com (2603:10a6:10:459::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 04:24:35 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8835.023; Fri, 13 Jun 2025
 04:24:35 +0000
Message-ID: <fe823cc1-e4d4-450f-889f-57339a4dd967@arm.com>
Date: Fri, 13 Jun 2025 09:54:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-3-dev.jain@arm.com>
 <43d9cb6e-1b8f-47b9-8c19-58fc7c74a71e@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <43d9cb6e-1b8f-47b9-8c19-58fc7c74a71e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB9492:EE_|AM3PEPF0000A78E:EE_|DU5PR08MB10466:EE_
X-MS-Office365-Filtering-Correlation-Id: 6edc92de-051b-4e9c-0aab-08ddaa3249f2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Vk1SQUlVckVMeHNaUjlmc1R1WStQSllwNnJ2VWo3OHU1cms1ZnpzWUZGNjd0?=
 =?utf-8?B?dGozeFpZTkdNVG01ckhuT3h5ZUN6MWlVS1l3R3I1NlFKQkFOd2RvQXRKQTkz?=
 =?utf-8?B?a3FlcDRrTWZXYm9YS1R0Mzd5c3JFV2RlS1BwVmRCMjAvUEdqd0VXTlBnY1VI?=
 =?utf-8?B?b2ErWnpsVHFGWEF3cHFXODlneU56SVdIbHZnaXZCYnREeVRyYm5PbFovL1Bx?=
 =?utf-8?B?d29lYjFUN1ErVGtKRVhZSXVHWkNKMnNtUnNhQWJXa2dITmNDZ1Z2alphKzJV?=
 =?utf-8?B?UFpaUmtQdXRwYXZpays2WFQ1OHY4dFpvb2VlV1pIWjd0em9VWlJPRnBPTUcr?=
 =?utf-8?B?VXJXc2cwUE84K0FsZTdxMjEraWpIUmt0ajhwQVFvN21MSDYwWGsrN0tkRDNZ?=
 =?utf-8?B?YVQ1NURpdWU5cTVYTXZQY1lVbDlvWU1kTk9kU0R0MzcrNTBIRXhYQVc1Z2ZU?=
 =?utf-8?B?OVAvWXVSc1F3cmFZUWdFdlA5R0FDTUNvZGFHL2twMlZ4ZDNjallFaGx6WEFl?=
 =?utf-8?B?M0hNVEpnc0xOT1hVbmNWVmJoUk9DNXRKZElWOW5CVFZWRUNJNit3OGVvdHRO?=
 =?utf-8?B?ZDloWjl4Y2tmeGdGWTlid05KRU9sOEt2Tm9QMTRZNGxoR2RGVWxjd2M1bU1V?=
 =?utf-8?B?bStlTGh0K1NiOWhwTEpYanJMVkZiN25oNFR3Um5RYkFuR0tWblc0M0V0WGJR?=
 =?utf-8?B?b3JpZmFRbnpaSWRlV3lKN3h3SGhMM2ptbTlSbzdHeGN5NlAyMWFUZFZ2dEov?=
 =?utf-8?B?Tk1pVUU2ZlBuWklaRC9TWDVJUWxONEFiUGUwbjNnUFpFbHVCZGNYNjR4TkJZ?=
 =?utf-8?B?anNwRU1LTmJ6QlNxNWduY28zRjZJcHp3U3ZRWnhNVzJpREFhTVA5cUNRczdD?=
 =?utf-8?B?cmJLWGtwNnNpaGVpVStjYm0yOFFsa0FTRFVSM1lWV2lYblhoTEp6TUhkZW9L?=
 =?utf-8?B?WXFhbmsxZEJDbEZuUWxpcElMcXRyb2E1OTU3ZnN3RWNrblpZRC9PS2d0SktI?=
 =?utf-8?B?ajUzb0hrK3VzMTRuSC9FaktaOHNON09oODlNOHdhV2pielZiMkhxTzBLYlBm?=
 =?utf-8?B?ckRBR214YTFWS3VwanBxS2xPR2x6WmtWazUrZmx6RFExTW9UYi9nRDVSVXc3?=
 =?utf-8?B?WXpmT0pockVlTE1MdXBEMDVmM2dEYnJmbFQrOERRTm5WV01sVnJSejllRjRX?=
 =?utf-8?B?OWo4UmVMMzgwMzNpOU03bTJ3M0p1OXNIdjN1dGIvMWY4VjBieUJkdWdZQjR0?=
 =?utf-8?B?aWV0QXd1TmM0cmRpUkVVUTdvOWszOS9IVWdpZlVsYWRwdWFHSUovQW1LcW1o?=
 =?utf-8?B?UFg2MkxTNzlnazNqWU5qb294S2RZTUIyNHIzQ0JxREZZK3NHZWNFRDVnYXBK?=
 =?utf-8?B?Z21RaWthcmtmdHNrL1BydTBvVGs3bVJyRCtGYXQxczRtUmlRZVQzUzdseFBk?=
 =?utf-8?B?YkVDTUZZNHFXMXFVOW0yUm9sNWJTMXRBdkdrWmdweWd5aTFaR1lPTWRCSk54?=
 =?utf-8?B?akNxcHdDWUl1ZDEwdDB1ZEZTRG9SbFFyR0hyMXQ4clRPc0Z0Q2RIV3o3OTM5?=
 =?utf-8?B?R3U2d0hTaTdOQUlteWtUcHJpcHVraEd4b3loa3ptSitOMHJpVXZkTGFkc2ww?=
 =?utf-8?B?QmhCRXgvdlNuS1MzbmRMSHk1RzVRQWgxM1Y5dFRaOXlOOUtER3dyN2kyQTdx?=
 =?utf-8?B?MkJzZzJUOW5PVk9JeDRRR1lZUHkrUjVhZzREQ01QYnNZbUFtcis5UnJLOE1v?=
 =?utf-8?B?cWNjMlpUclluTFpGUFg0eXV3MldCUG5PSU9ZcFBGVi9iSUVtaCtxbW1TbEN1?=
 =?utf-8?B?ZkxZZWVickptcWFob2tTdmVTcHl0aFg2WWtKbWlvZUNyWU92WE1pMlg3dUxD?=
 =?utf-8?B?NmNvSHVTZ2JPR2dSR2lPOFI5SXRzcjVLSFN4ZGxYWEJzUlE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9492
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d466196-6c9b-4979-bd5c-08ddaa3233bc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU81ZVlMdVpuUE5UOVNwM0lqRCtPdGp1L2JqQlpSWlVSTGZQd1NHK0RTUXV1?=
 =?utf-8?B?YUFzek1Sb0xrRVcvY2J6akQ4eWhBckp2UjZXZWs1TmcrSlpieWFUazZQNjdl?=
 =?utf-8?B?d0R2NUVyYzhuTnBjYzZGRGNETWRxSFJmYXF3VC92d0dzMFhsR2lQQzFhVGZ2?=
 =?utf-8?B?NURuamNPSGRMUUJEdHRNR25aaFV0Q0ZvMXRwQ2lCTVpwYmhtK2VJSFRnUlhE?=
 =?utf-8?B?SjRTdXFVblVkM3Z0YjEzaStVNWtzc0piMnVVMmYzdm15WUpYckZtU2dvczQ1?=
 =?utf-8?B?b1AwUDdWYUxVNG5POFZNREVJcVl6a0xHUi9vS0xXcnJzblB2bUNMdGxXOXYw?=
 =?utf-8?B?R1UrNitlbWwwVVdZeG9saldVa2xFV3hXR01XbWFSNm1LWjB3OU9vL3NqZTZD?=
 =?utf-8?B?Y2wrbDFZUUl4MStSVys4aDcvNGNPRkdHRE1xb3dzRFI4b2VRSWRGdGFSSE1z?=
 =?utf-8?B?VWxTUXZhS0xxSXVTcGYwTmZUdHRma3psdUlSVWNIOVdxN21PM3l3TU9iRkFi?=
 =?utf-8?B?bTRZN1l5eUUwQ2NGVDcxbHRmWGR3Qkt4Y3d0MGlSNEJXcG03S0dxNkMrTWJT?=
 =?utf-8?B?alU1aXY2Wm0vT3FqQUNPcVlNV3VYc2dhQXNXQ05zRW9WS1g1VXQ3OWJPZ3RQ?=
 =?utf-8?B?enoyWGUxOGNUUHFiZzhpMUo3Rm9qbDdjTGJPbHhhMHA5bzU3OGJzdFBsbk5V?=
 =?utf-8?B?VjY5d3dlM3RNcmxlTDFKdFNrRW5yZkdibWh5OUhPaHI0a0dXMFZESHkwVSs3?=
 =?utf-8?B?ZGtJekx1OUJDd1NnSFdIcDAwTlpIeTV0OERQK3FNeTR6M3NNNEdEcVpDUHcx?=
 =?utf-8?B?VnIzU0xKRTdQWVVLa1publhLcTNvNXRJVjZzTUxXS3Y1L2Rndnlvd2trc1pn?=
 =?utf-8?B?cVVDS3Jyanp0NU01eXNpYWJNMlorbUM4Rk9Mc1JzQWFvRHFmYzc1eElBNGsy?=
 =?utf-8?B?dTdiSDV6czdFLzVsb1JWUWNEVDEwOFFKMEJiakl0eFQ2SmlkWk0zRGk1YXJs?=
 =?utf-8?B?T0JibWZDcGlsYm1mUHEzRGttTVBkWElIMUh0TVlyYThWOC8vRUpCeUNteGVR?=
 =?utf-8?B?L29TNXkvS3F3ZWxCSnYwUkw2TEx4ZmZDOWhkZlNuTTE2aHhKZVBUNm1vUmU2?=
 =?utf-8?B?WkM5RlkzWEl0c3g4c2xmdTAzMXBvbDhZUm1mTEdSbFVDVk5nUEZOVUhIdWFG?=
 =?utf-8?B?YlJ5V3pFUVVhZTdaalNHeitCc1VRMDZNQW9OQkNOMzNmTFVDUlQrY0Q1dFdQ?=
 =?utf-8?B?emZwckhPSDZpcVJpMGw3YzNMWVdjVy9ET005M1VKNVl6bjY5K3Ivd0d5SmlU?=
 =?utf-8?B?bWRWTmMvZDQrQU5NMmN5VnVqNS81aFpVVkI3ZWNLM3dmdng2R1BnTzhYZyty?=
 =?utf-8?B?T2xMZGFLSVZocE5PamRtQlFIelE5TzVMbmNwY0JhR2RFNHk0ZDBHN3hSS3JI?=
 =?utf-8?B?MjJ0RU0vNmFsejRqejhPUnFJZGY5dE5mUlEra0c4am9HcUVqTEtRUXVJQVA0?=
 =?utf-8?B?RXZTUFVVM1dJZTFMVFl5ZWlsbTFsVUc2OXRnMGkrTzhLcDZBZnRpQnhoekRI?=
 =?utf-8?B?ZjAxZE9uejBTRWFNWTVkTDJWb2F2QU1yYVExZzkyaUt1RzZLbXVmZThqaGlK?=
 =?utf-8?B?SFlxOHBtQmNPa3RiWC9jUWdVMU9PdUY2WDhxbWl2eXVzYzVFcEpMaVI2ZEw0?=
 =?utf-8?B?SkNQVlJyNFhmVlNqS2R4SzhVZmlTYm5rdHVBai81VEZ4YTM1TVN0S2VaRmZP?=
 =?utf-8?B?bFM5eGVlRisrYXhDclhYZ1h3VnF3TGdJUG90aitKdFl4eHVqM3YvbkZEWlJT?=
 =?utf-8?B?ellFSHFDWGxNZy9VZzh2QnRxRFM2MTRrYlRCZkp1Zlg0KzNObEpKN0hjaXNC?=
 =?utf-8?B?Y3VpckRXNDVqWnVUREg4NkJpTHFxd0R2NHNuVW1SVTlKd0hsbW5ZV2UvZTFY?=
 =?utf-8?B?dmcvRG9wTXRMZStXT0tpQzNBVmluZ1JYQ1FjSEdsbFBJcDM3UHlzMkNkOFNz?=
 =?utf-8?B?UW9kTis5VTE1VFN5ZU5CS0JNeEl6OHJBN2Zqd1MrODljTWZFMzBYVzVjQnVB?=
 =?utf-8?Q?w32yOG?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 04:25:12.1165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edc92de-051b-4e9c-0aab-08ddaa3249f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10466


On 11/06/25 7:30 pm, David Hildenbrand wrote:
> On 10.06.25 05:50, Dev Jain wrote:
>> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
>> are painted with the contig bit, then ptep_get() will iterate through 
>> all 16
>> entries to collect a/d bits. Hence this optimization will result in a 
>> 16x
>> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
>> will eventually call contpte_try_unfold() on every contig block, thus
>> flushing the TLB for the complete large folio range. Instead, use
>> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, 
>> and only
>> do them on the starting and ending contig block.
>>
>> For split folios, there will be no pte batching; nr_ptes will be 1. For
>> pagetable splitting, the ptes will still point to the same large folio;
>> for arm64, this results in the optimization described above, and for 
>> other
>> arches (including the general case), a minor improvement is expected 
>> due to
>> a reduction in the number of function calls.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mremap.c | 39 ++++++++++++++++++++++++++++++++-------
>>   1 file changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 180b12225368..18b215521ada 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>>       return pte;
>>   }
>>   +static int mremap_folio_pte_batch(struct vm_area_struct *vma, 
>> unsigned long addr,
>> +        pte_t *ptep, pte_t pte, int max_nr)
>> +{
>> +    const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +    struct folio *folio;
>> +
>> +    if (max_nr == 1)
>> +        return 1;
>> +
>> +    folio = vm_normal_folio(vma, addr, pte);
>> +    if (!folio || !folio_test_large(folio))
>> +        return 1;
>> +
>> +    return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
>> +                   NULL, NULL);
>> +}
>> +
>>   static int move_ptes(struct pagetable_move_control *pmc,
>>           unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>>   {
>> @@ -177,7 +194,7 @@ static int move_ptes(struct 
>> pagetable_move_control *pmc,
>>       bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>       struct mm_struct *mm = vma->vm_mm;
>>       pte_t *old_ptep, *new_ptep;
>> -    pte_t pte;
>> +    pte_t old_pte, pte;
>>       pmd_t dummy_pmdval;
>>       spinlock_t *old_ptl, *new_ptl;
>>       bool force_flush = false;
>> @@ -185,6 +202,8 @@ static int move_ptes(struct 
>> pagetable_move_control *pmc,
>>       unsigned long new_addr = pmc->new_addr;
>>       unsigned long old_end = old_addr + extent;
>>       unsigned long len = old_end - old_addr;
>> +    int max_nr_ptes;
>> +    int nr_ptes;
>>       int err = 0;
>>         /*
>> @@ -236,14 +255,16 @@ static int move_ptes(struct 
>> pagetable_move_control *pmc,
>>       flush_tlb_batched_pending(vma->vm_mm);
>>       arch_enter_lazy_mmu_mode();
>>   -    for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
>> -                   new_ptep++, new_addr += PAGE_SIZE) {
>> +    for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += 
>> nr_ptes * PAGE_SIZE,
>> +        new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
>>           VM_WARN_ON_ONCE(!pte_none(*new_ptep));
>>   -        if (pte_none(ptep_get(old_ptep)))
>> +        nr_ptes = 1;
>> +        max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>> +        old_pte = ptep_get(old_ptep);
>> +        if (pte_none(old_pte))
>>               continue;
>>   -        pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>>           /*
>>            * If we are remapping a valid PTE, make sure
>>            * to flush TLB before we drop the PTL for the
>> @@ -255,8 +276,12 @@ static int move_ptes(struct 
>> pagetable_move_control *pmc,
>>            * the TLB entry for the old mapping has been
>>            * flushed.
>>            */
>> -        if (pte_present(pte))
>> +        if (pte_present(old_pte)) {
>> +            nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
>> +                             old_pte, max_nr_ptes);
>>               force_flush = true;
>> +        }
>> +        pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, 
>> nr_ptes, 0);
>>           pte = move_pte(pte, old_addr, new_addr);
>>           pte = move_soft_dirty_pte(pte);
>>   @@ -269,7 +294,7 @@ static int move_ptes(struct 
>> pagetable_move_control *pmc,
>>                   else if (is_swap_pte(pte))
>>                       pte = pte_swp_clear_uffd_wp(pte);
>>               }
>> -            set_pte_at(mm, new_addr, new_ptep, pte);
>> +            set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>
>
> What I dislike is that some paths work on a single PTE, and we 
> implicitly have to know
> that they don't apply for !pte_present.
>
> Like
>     if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
>
> Will not get batched yet. And that is hidden inside the 
> pte_marker_uffd_wp check ...
>
> Should we properly separate both paths (present vs. !present), and 
> while at it, do
> some more cleanups? I'm thinking of the following on top (only 
> compile-tested)

Good observation! Just one doubt, see below.


>
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 18b215521adae..b88abf02b34e0 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -155,21 +155,6 @@ static void drop_rmap_locks(struct vm_area_struct 
> *vma)
> i_mmap_unlock_write(vma->vm_file->f_mapping);
>  }
>
> -static pte_t move_soft_dirty_pte(pte_t pte)
> -{
> -       /*
> -        * Set soft dirty bit so we can notice
> -        * in userspace the ptes were moved.
> -        */
> -#ifdef CONFIG_MEM_SOFT_DIRTY
> -       if (pte_present(pte))
> -               pte = pte_mksoft_dirty(pte);
> -       else if (is_swap_pte(pte))
> -               pte = pte_swp_mksoft_dirty(pte);
> -#endif
> -       return pte;
> -}
> -
>  static int mremap_folio_pte_batch(struct vm_area_struct *vma, 
> unsigned long addr,
>                 pte_t *ptep, pte_t pte, int max_nr)
>  {
> @@ -260,7 +245,6 @@ static int move_ptes(struct pagetable_move_control 
> *pmc,
>                 VM_WARN_ON_ONCE(!pte_none(*new_ptep));
>
>                 nr_ptes = 1;
> -               max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>                 old_pte = ptep_get(old_ptep);
>                 if (pte_none(old_pte))
>                         continue;
> @@ -277,24 +261,34 @@ static int move_ptes(struct 
> pagetable_move_control *pmc,
>                  * flushed.
>                  */
>                 if (pte_present(old_pte)) {
> +                       max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>                         nr_ptes = mremap_folio_pte_batch(vma, 
> old_addr, old_ptep,
>                                                          old_pte, 
> max_nr_ptes);
>                         force_flush = true;
> -               }
> -               pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, 
> nr_ptes, 0);
> -               pte = move_pte(pte, old_addr, new_addr);
> -               pte = move_soft_dirty_pte(pte);
> -
> -               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> -                       pte_clear(mm, new_addr, new_ptep);
> -               else {
> -                       if (need_clear_uffd_wp) {
> -                               if (pte_present(pte))
> -                                       pte = pte_clear_uffd_wp(pte);
> -                               else if (is_swap_pte(pte))
> +
> +                       pte = get_and_clear_full_ptes(mm, old_addr, 
> old_ptep,
> +                                                     nr_ptes, 0);
> +                       /*
> +                        * Moving present PTEs requires special care 
> on some
> +                        * archs.
> +                        */
> +                       pte = move_pte(pte, old_addr, new_addr);
> +                       /* make userspace aware that this pte moved. */
> +                       pte = pte_mksoft_dirty(pte);
> +                       if (need_clear_uffd_wp)
> +                               pte = pte_clear_uffd_wp(pte);
> +                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
> +               } else if (need_clear_uffd_wp && 
> pte_marker_uffd_wp(pte)) {
> +                       pte_clear(mm, old_addr, old_ptep);
> +               } else {
> +                       pte_clear(mm, old_addr, old_ptep);

Should pte_clear be included here? It is currently being done only for 
the case

need_clear_uffd_wp && pte_marker_uffd_wp().


> + if (is_swap_pte(pte)) {
> +                               if (need_clear_uffd_wp)
>                                         pte = pte_swp_clear_uffd_wp(pte);
> +                               /* make userspace aware that this pte 
> moved. */
> +                               pte = pte_swp_mksoft_dirty(pte);
>                         }
> -                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
> +                       set_pte_at(mm, new_addr, new_ptep, pte);
>                 }
>         }
>
>
>
> Note that I don't know why we had the existing
>
> -               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> -                       pte_clear(mm, new_addr, new_ptep);
>
>
> I thought we would always expect that the destination pte is already 
> pte_none() ?
>

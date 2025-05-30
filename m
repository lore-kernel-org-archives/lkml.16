Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012004.outbound.protection.outlook.com [52.101.71.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0620B21CA0A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.4
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599124; cv=fail; b=H9FKEOgp+SVUOhQQ1WL3PCVfAbxqCjwOEMGd9lR8SR+nkCK6dUi+7SyG0/poC5fup0MdG8oq37PrP5ZzlpceRjvQxmLVp5MD5r4wpOPR6L2Mp3zmFK4F8Mz0LRJ18h4j64V977x+N+LBDz5yWhy74XYg+B691/DxiYyw8JdOVqs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599124; c=relaxed/simple;
	bh=22swnkcNvNsY3cOB5Y6fGOySwZS7lhPr1x4X/7yNepg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QfsT0DJHK003/pvCAIVMTwpTnYfAOwTZp551kqmkh0iFbnp8iPbt5Hq2Roswt2N4epszdpWHmWSlqhKdnK6I7NZ0ga8FUwiXMLufCtgMj1/Hjvxf72RhzZr2wLKjZrrp/+K4iSsnz65lfWRU15Scokc0ofJnFPPdzQFY0Iju3rw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=a252hgCf; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=a252hgCf; arc=fail smtp.client-ip=52.101.71.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="a252hgCf";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="a252hgCf"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dsL+/Dkrq8IQk83jZzSIpPdVlTuu+3/ZcybRs6gGqqz+cGFloRtnLlJ3HOyrl4+a3GM+IBInrmuKEOEhdIHx4/A088yziRCOcw0hHz3WBzjmRT06fmKt4OsJAlfcLXOJmSIq21UBFnyngqPAQcFKZDXXjL0wanCXTo9pDqWS7lISnPQNtrothupzbIucox4czGhJEjvmCQId9bBuT61DSCL7Qp2z8HT+y4ELmAfRUPY68xSq/QjfTlCih8meK8MnH6/Oy4P6WxuvpevlOlhalpaRlbfZlSmIZb/Wz10/HQusnkw1uMq/bhLvtq4J8HbkmrR17nWk6PHH3V1/F3wYMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tG6hXfmkyCXOhL0B3JDb8RjjcYHW4XudscFbXU3JPg=;
 b=Pc9zNQYYl9UFlrY9mJhy7X4DacVNr2N5VGKJz3kT93twp2s3Rgg2eJJn+n/EeVp9yMAfL5l+RXe/fgCeDZ9saAHz8UcIB8NBLA/5wTnD/u7hfa4Yu7wOfK1L0B+BKvNpnBO6EwmHoWY3JJDhExcqV+7lTuKXgDJD96xDjHn4uxkpJ9Q3nsE1qiJTvjBEWvvi49Oln4G5WbVQ/7vj79S6pvgBfQ1wjCLl3MnB7HyGOAz6NretJqA71bFf8pz8j861ZZSCyH9pIKTqe9HknREusIGR/faMdLWlh6jm8/1binRT8NP/tDXW0on6gLFnk4GG8zNaiq63lIYAULERQcvRXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tG6hXfmkyCXOhL0B3JDb8RjjcYHW4XudscFbXU3JPg=;
 b=a252hgCfuxgJ8SUqiJ/HHK0Avk0kZCT3cUokvZhiLBG3k6R+qAKUeO1IkSaY35jtfL25Z0+M43gKzEjRCZKMCgARD9+NqZb3nt48amOuwAKgGMnfgOBgxGseaPHZp7LBkH8G2gnQU7vJfkaUkFrFSeOucZ6uuH4MpHnB1hHsLwA=
Received: from BE1P281CA0019.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:15::12)
 by AS8PR08MB10071.eurprd08.prod.outlook.com (2603:10a6:20b:633::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 30 May
 2025 09:58:35 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:b10:15:cafe::97) by BE1P281CA0019.outlook.office365.com
 (2603:10a6:b10:15::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Fri,
 30 May 2025 09:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Fri, 30 May 2025 09:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2O2lBm8iMKA/fazseuZnqIRGIt85ng5EqBYdj8yno0/MVi7WOj53dvEcDUxqVP876Fu8r5eM/WfortR6YWG1TCeMubIt1OecAw0nWNGSqzk4txHRZbj2siVplHOouf71VULdaOvMxe+DD/oVEat6zn2LlBNchJJ8qJ0MKZtgSNRSrby5yCpHim8qNJB4Q/sKf7WsKFxgIwm+k7KnwbUE4Et1bk2iMdG+uFdoqGeC3rqeJSSJoivhoFRbepBeWdCyvlsK6HsN4drV/KqWsJi06PMG0YSYpGVRqWHXUSGKAKeoeHHsXy0rWwZ98wHG6b3+W3LjN6/CpIS14qTBcg4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tG6hXfmkyCXOhL0B3JDb8RjjcYHW4XudscFbXU3JPg=;
 b=YQgxPOuc5hrt669IuxtEpnHrdx5PxT2/QYMn3AZBNtxteVhdGk8vpOnZv5ccJdK7u3y07YDv7Gelq0yrk5iSod5gh4F8M9sHz6Rf/tcBrm04sJVjdH12HzebncKry5USzyFufFuoXV2E9JrcvlmNXuDP5IY17TCxmYJ7h8LdGwQQy6jCuzydKy/k8oq84q0y7MsY3AKaT+fBCiMC+jSbngUBYhqM+TWDRyzMpsPbDWb42DUM9HWh9Xl7nDyotE2wfIpwMgH9QChKU1zGHBj5BsI2QVCEMzMw2p5jA1sa/EWC5ZsEmiOQuWc8KDxl0slIb848yOwaoNpKnDUf4SJXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tG6hXfmkyCXOhL0B3JDb8RjjcYHW4XudscFbXU3JPg=;
 b=a252hgCfuxgJ8SUqiJ/HHK0Avk0kZCT3cUokvZhiLBG3k6R+qAKUeO1IkSaY35jtfL25Z0+M43gKzEjRCZKMCgARD9+NqZb3nt48amOuwAKgGMnfgOBgxGseaPHZp7LBkH8G2gnQU7vJfkaUkFrFSeOucZ6uuH4MpHnB1hHsLwA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DBAPR08MB5864.eurprd08.prod.outlook.com (2603:10a6:10:1a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 09:58:03 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 09:58:03 +0000
Message-ID: <97b215cf-7f01-48f2-88ff-3b815114b974@arm.com>
Date: Fri, 30 May 2025 15:27:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
 <6280e181-9f05-4aa0-9fe7-23d4e86000e5@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <6280e181-9f05-4aa0-9fe7-23d4e86000e5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DBAPR08MB5864:EE_|AM3PEPF00009B9E:EE_|AS8PR08MB10071:EE_
X-MS-Office365-Filtering-Correlation-Id: 941602bd-5aec-4bbe-4359-08dd9f608b12
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d3BGUll0UU5zQWhpZVp6VE1ONGlUeW50RFhSQ09DcHVXOU0rd0gzUHF0aFRx?=
 =?utf-8?B?WFZ5eW0wTWhCSXdwOVQ0QTFzVHA0d2REUWhpaFJMMExkQmJVSUlwMk1ZaElR?=
 =?utf-8?B?VHhBa2JjQTBsVlZaUG16OGlQeGQ3bWt0VU4xR2EzOE1yMlhDUW5KVjRiTjRi?=
 =?utf-8?B?Z3k3YUxqTHVYV0N2aXlYYitwd3hlcFN3Q2FSMW5JZmpJY0ZvbUpIVjd6V1U1?=
 =?utf-8?B?Z3FiZDVmUUJaK2pkL0gzQklMQ0dlOGVYMjUzY0YvVXNzb01ESUxibEJxYTB6?=
 =?utf-8?B?R2Iza2tra2VSVzhtdURFQkFadThZTjZtcmpwcmJQWjl6WWV0SzVBTEkySFNJ?=
 =?utf-8?B?ZTJJUjlUTGdZODRtM2s5c01NSVkrallvNnJ2emo3eGx2RDRIOHpDVjY5VFdv?=
 =?utf-8?B?ZE56TWhYemh1eHNOejczYUQwbGlsWGNQN0lpRjZ6VStBTngwMGMxVSthWVZ4?=
 =?utf-8?B?d1Ivd3UwSUhqcHVUR082ODVRSVBVby9KMUNVL1NPekF1L05BcU9SYVJ2N3Vr?=
 =?utf-8?B?ZkVRUTc1VnFzeUVYY2pPZUZmNy8rMzdCYXlKTDVnMlpHMDlHRldpY1BXQXQ5?=
 =?utf-8?B?QXR5dC9Tc0pIU2NZVWQ1V0RTN04rZFk4R0ZYQU85UmhaYnJTTXBqUVJYZW5E?=
 =?utf-8?B?bTBzeHhLZTlVeC8wL0RhMWpRUzZlQlhJZUhHdjRpS3oraDJRODNYUEJoZzFZ?=
 =?utf-8?B?bTFMNDNpZFh5L000OEE1dTNOeXFxNnBPbUZHSThsNnBMYTFWRUNiWi9Ba04z?=
 =?utf-8?B?VUd2UkhhcHloL1RJd3FyNlZEZnhQcU9Hc3EzQU1wNStvbE56UkhtejdSN1JZ?=
 =?utf-8?B?Z0Z3SmM4SVlac1dTUFlEUjYwREZOQmtCNS8vMkJZZXREb1NqWGdLRDJNdi9v?=
 =?utf-8?B?Vjdkb0pJYm53d2llSXVsZk9veFM5cVUrSVFKKzRlVXVVUmpZU1lYcTdsdGZU?=
 =?utf-8?B?ZzQ1Y1dld010QzZxbzg3TnhxaXgvZXFsQU9lWVFFdWxJbzRPaDFKekZOZzJm?=
 =?utf-8?B?SnlFNlYzV3NZaWFyTGR5c003bVUzTmFSK0plenNVUU9xcmNSV0lJNGlTc3NL?=
 =?utf-8?B?THhIYnJySWdTdjhzWDRUQzQ3eTFwdmw2U01KWnlSM0pXQ2VXd0VmRFJHMVlj?=
 =?utf-8?B?cC9XODhMTmF4eGFBMndneGJrRHJsZXQ4SnpXcUZtUU9lTmVwNm1LWVFaVVNo?=
 =?utf-8?B?T2xqMnMyMUJJaStqV2YycEs4WTZKYkt5VUE3bGtXSXhHcUdQQ3o0UDBOUisv?=
 =?utf-8?B?amJWbVM0aklFNWNmNWpkc0xSamNLLytsZ2xjSnh6SDAvdjBGOVhWZEFRUG1P?=
 =?utf-8?B?Sm1sV3JLRU5MR1VicXQ2eVpCNVpVQmNnazFNOVZXekVPKzdYSm1VaTdiMS82?=
 =?utf-8?B?Mjc2SXBZZ1dBOG5pcEd0VDFsNWJhdDFncm1qK2poSzN5UlRwV2FHd0U4QlJV?=
 =?utf-8?B?eWttNEx6R0UrTW1IeU5RNUdzdlo0V0VYZ3I4WkZQaEZVRWRxQkVGYm5vVzRL?=
 =?utf-8?B?SEVPb1UvbFVhY0RxUEJHZFdhK2szSk8zdjJ5REl2clp2UmtVeGFQRitGa2dx?=
 =?utf-8?B?L3ZBbGJHYXNmN0gzejFuZ0V3SklSUVdNYjl3cmk0SDBveEFNcklqbjFoSzlM?=
 =?utf-8?B?TjYwNkExRnY1QnFydnJHeVpMSkdDWWxBM2VEWFJ6akw5V0h1NnRZR0RNM1pu?=
 =?utf-8?B?R3RIK1p0bjhURnN1aDljTkJ6QXVIUFp6KzVyYWxSSnYwVEd6am8rTGxqOHpu?=
 =?utf-8?B?cTQxR3FMUUNkWFRZUFZVSUpkWXlJelZrb1NueFNwVSs4Y3QyLzh4aTVCVFF3?=
 =?utf-8?B?aUc3dXc5RjJrSDdJSXh4WVVIdi80UExENjNOY2VBMUcvTjVsWXg2OFFsYmR1?=
 =?utf-8?B?RGpEOTZwT245MkEwS3AzakhHcWlXeDE4MUxhOHZvTWNaRVE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5864
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9e59517-df4d-4675-34c3-08dd9f607786
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTZZRHR0SkxjWVQ3eXdSY3Nldm13YjVST29iSWpUUkp5dERJc0lzOEJGMlVU?=
 =?utf-8?B?Ry9SRjQ0TFkyYVVyV1lQRGwxMVcxd3h3cFRnS0taRk9WSWVlM21tM2lNeFpT?=
 =?utf-8?B?RUVEQlQ0VTBObTlkSm9CdWcxOGxNR3VPaWJJRzFVQU1YWVZpSVVIUk5sSXpl?=
 =?utf-8?B?M1ZUSUJKR1RZL3pYbWs5bC85RTVuS1QyS05DRGdvOWNlMy9mOGlGVW9Qbysw?=
 =?utf-8?B?QnoyNEFoTHowdHFiQUFVS1lxUXpCOHlQK094dW9DZHkyVEp1Q0d0Q0NPSyts?=
 =?utf-8?B?djI3cWIrODljQ3d6QStCTlNjekFFSlBpQ0NtMlBzUmQ5aFA1Tkh6a21wa1Nl?=
 =?utf-8?B?RFNvMDJ5cXBHQXlBMjRJVCtIR0tmRElMTjhXakZJV2YyZXloUkJFTEZLenN1?=
 =?utf-8?B?SXl4alFpSkl5NHl0bkV5dkJjRWU1czNhVVpscDhFenp0SEpTb2pWZURBZG9B?=
 =?utf-8?B?Yk1LdDdROEx3RklnbFY0djZKVFU0Tzl2UVM5Z3pNeTZ3VDFoTk13K2E2dkdJ?=
 =?utf-8?B?T2NiVGF2U1hLZjdkbFJHOVJ3UkQ3WE1VN0IwKzRpYlB5MzRyYnV3bGpjci9m?=
 =?utf-8?B?VVVUK2hCczJHbHdVaHdMciswTkZRUzZZbFhJWElxZkQwdzFMaDk1R0JnSG4y?=
 =?utf-8?B?TDRqY2tYMzJvRWdoZmY5V1lMNFJBZjJpNzJoa2ZGMVVBZ05VVGU0SHRQbWNT?=
 =?utf-8?B?dEdHTC93WDFrb3lrY1FhQWc3bXNqdVBCbmdvT2FIa1hyWDlZcXFwaEZaRWFw?=
 =?utf-8?B?MDhzMFdsTUhrR3NScW94Z3NGOTJPUXhHU0Z3c3dYQ0cyM250VnhZUXlKNUdU?=
 =?utf-8?B?TitIeHdBMjFuejc0WnBNUkJmK3BSWkZBY25mWHVxclQ3VElVOXAwK2lBSks2?=
 =?utf-8?B?MHpuejI0WUlPMXkwVTgrM2RHMFErUTU3WEsxRmx4Z2Y4WGp6eThVMHZpaHJX?=
 =?utf-8?B?VEp4cVRzUDY2emdyZSt3MEQrOE5Kdk00SFhaalU1ZnhkdWJhUmZRclBlZkNG?=
 =?utf-8?B?b0xWVXVSMFZ0NjhYdmFwUitIK0ZncXVvM3dvQm5GMVpkSHUzaGNJSkdxTW43?=
 =?utf-8?B?Y1RyQVlJdmZMa2krS0liSVA2cnhneGJwWWdRZ3JHeGp6UjN4UTZPWkw4NDVv?=
 =?utf-8?B?dHZ6TlhFRmp5NkN2Wkk5TEZBeStaUitjYlYvS1dyMEVVcXZTV2hSMXMzWGFC?=
 =?utf-8?B?eXpZV1Z3dzAzVjBQTXZWOEJQVElYOEhBcktsQklUdkEvQVR2cWJYcHl4TTM3?=
 =?utf-8?B?UGZzRXhxNXltKzRTNEJxbHliZllpS1FiRVJVZGc1ZTUya3JhbnlTekdBYW5K?=
 =?utf-8?B?eHB5NFJKWXZWZTdXVndmeU1PR2NRMVpDM2tnd0NVdHFHZWF2TDcrTktVRFZT?=
 =?utf-8?B?dHdoTis2dkJJVWpzbTB5ZVdRcjdjbFpZZHVDN0hydWFrMmMwSDdkYXVpcTlt?=
 =?utf-8?B?c3o3Sms2cStpOXFzRzg5S0JMQUtYYzk0MzkyODUxT2ZwcXl5QzZhcDlkbWc4?=
 =?utf-8?B?Z3Jwek9NbWtvM1pVaVFQUFc5b04zb3U4SWVGT0Q1dFdDK2YrUmFSZkFXUXZO?=
 =?utf-8?B?ekFsMmZ5T2cvYTh5NTBGdXJBLzBXNEdvTzNTR1pJOHJSbzhYMkMxeWFFNDhZ?=
 =?utf-8?B?NXFJZC9xOVM3U0hyNlAxT2M0b1FXNzgvQ2RlZzVyYjJOeERMSjAvMjlRMXZD?=
 =?utf-8?B?MTY3d0xnTm1jVkFncjFTZ3REbWZkaWI0bVZTbGdaclllQXh4TWxqcHdnSEJ3?=
 =?utf-8?B?VEg2eGhDL3Y1RTFhcFJ1T2hvdEV4NVRVZ3RHOU41UGthbFJkQ1hzN2ZrTjNy?=
 =?utf-8?B?UTZjdnQ1QlJBbEE3cVY3bHNWZHNTNmJsa3JNeVg0R3BzVzRET3BCaHdaMEhK?=
 =?utf-8?B?bjJxWkFMVUZkNXZ5eFBySGx5STdUYnJiaTh4YktKbWl2OEFzZXJDNlM4NjJZ?=
 =?utf-8?B?WVROQS9UWnBrY3Y5U1BmdXRxUjkydTlUQWVuc2tqTVg1alJoOE84cmlJYUV2?=
 =?utf-8?B?Uk1TakowS3hXMUp5c0tac1FBU2drclRtczR1Q1ZNSllwZVA2NGJZdkpvQytD?=
 =?utf-8?Q?hSHZa8?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 09:58:35.4383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 941602bd-5aec-4bbe-4359-08dd9f608b12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10071


On 30/05/25 3:17 pm, Ryan Roberts wrote:
> On 30/05/2025 10:14, Dev Jain wrote:
>> On 30/05/25 2:10 pm, Ryan Roberts wrote:
>>> On 30/05/2025 09:20, Dev Jain wrote:
>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>>> because an intermediate table may be removed, potentially causing the
>>>> ptdump code to dereference an invalid address. We want to be able to
>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>>> between two different vm_structs; two vmalloc objects running this same
>>>> code path will point to different page tables, hence there is no race.
>> My "correction" from race->no problem was incorrect after all :) There will
>> be no race too since the vm_struct object has exclusive access to whatever
>> table it is clearing.
>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    arch/arm64/include/asm/vmalloc.h | 6 ++----
>>>>    arch/arm64/mm/mmu.c              | 7 +++++++
>>>>    2 files changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>>>> index 38fafffe699f..28b7173d8693 100644
>>>> --- a/arch/arm64/include/asm/vmalloc.h
>>>> +++ b/arch/arm64/include/asm/vmalloc.h
>>>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>>>>        /*
>>>>         * SW table walks can't handle removal of intermediate entries.
>>>>         */
>>>> -    return pud_sect_supported() &&
>>>> -           !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>>> +    return pud_sect_supported();
>>>>    }
>>>>      #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>>>>    static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>>>    {
>>>> -    /* See arch_vmap_pud_supported() */
>>>> -    return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>>> +    return true;
>>>>    }
>>>>      #endif
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index ea6695d53fb9..798cebd9e147 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>>        }
>>>>          table = pte_offset_kernel(pmdp, addr);
>>>> +
>>>> +    /* Synchronize against ptdump_walk_pgd() */
>>>> +    mmap_read_lock(&init_mm);
>>>>        pmd_clear(pmdp);
>>>> +    mmap_read_unlock(&init_mm);
>>> So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
>>> exclusive with any read_lock holders) for the duration of the table walk, so it
>>> will either consistently see the pgtables before or after this removal. It will
>>> never disappear during the walk, correct?
>>>
>>> I guess there is a risk of this showing up as contention with other init_mm
>>> write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
>>> are called sufficiently rarely that the risk is very small. Let's fix any perf
>>> problem if/when we see it.
>> We can avoid all of that by my initial approach - to wrap the lock around
>> CONFIG_PTDUMP_DEBUGFS.
>> I don't have a strong opinion, just putting it out there.
>>
>>>>        __flush_tlb_kernel_pgtable(addr);
>>> And the tlbi doesn't need to be serialized because there is no security issue.
>>> The walker can be trusted to only dereference memory that it sees as it walks
>>> the pgtable (obviously).
>>>
>>>>        pte_free_kernel(NULL, table);
>>>>        return 1;
>>>> @@ -1289,7 +1293,10 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>            pmd_free_pte_page(pmdp, next);
>>>>        } while (pmdp++, next += PMD_SIZE, next != end);
>>>>    +    /* Synchronize against ptdump_walk_pgd() */
>>>> +    mmap_read_lock(&init_mm);
>>>>        pud_clear(pudp);
>>>> +    mmap_read_unlock(&init_mm);
>>> Hmm, so pud_free_pmd_page() is now going to cause us to acquire and release the
>>> (upto) lock 513 times (for a 4K kernel). I wonder if there is an argument for
>>> clearing the pud first (under the lock), then the pmds can all be cleared
>>> without a lock, since the walker won't be able to see the pmds once the pud is
>>> cleared.
>> Yes, we can isolate the PMD table in case the caller of pmd_free_pte_page is
>> pud_free_pmd_page. In this case, vm_struct_1 has exclusive access to the entire
>> pmd page, hence no race will occur. But, in case of vmap_try_huge_pmd() being the
>> caller, we cannot drop the locks around pmd_free_pte_page. So we can have something
>> like
>>
>> #ifdef CONFIG_PTDUMP_DEBUGFS
>> static inline void ptdump_synchronize_lock(bool flag)
>> {
>>      if (flag)
>>          mmap_read_lock(&init_mm);
>> }
>>
>> and pass false when the caller is pud_free_pmd_page.
> of something like this? (completely untested):
>
> ---8<---
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db..1f3a922167e4 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1267,7 +1267,7 @@ int pmd_clear_huge(pmd_t *pmdp)
>          return 1;
>   }
>
> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>   {
>          pte_t *table;
>          pmd_t pmd;
> @@ -1280,12 +1280,23 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>          }
>
>          table = pte_offset_kernel(pmdp, addr);
> +
> +       if (lock)
> +               mmap_read_lock(&init_mm);
>          pmd_clear(pmdp);
> +       if (lock)
> +               mmap_read_unlock(&init_mm);
> +
>          __flush_tlb_kernel_pgtable(addr);
>          pte_free_kernel(NULL, table);
>          return 1;
>   }
>
> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> +{
> +       return __pmd_free_pte_page(pmdp, addr, true);
> +}
> +
>   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>   {
>          pmd_t *table;
> @@ -1300,15 +1311,19 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>                  return 1;
>          }
>
> +       /* Synchronize against ptdump_walk_pgd() */
> +       mmap_read_lock(&init_mm);
> +       pud_clear(pudp);
> +       mmap_read_unlock(&init_mm);
> +
>          table = pmd_offset(pudp, addr);
>          pmdp = table;
>          next = addr;
>          end = addr + PUD_SIZE;
>          do {
> -               pmd_free_pte_page(pmdp, next);
> +               __pmd_free_pte_page(pmdp, next, false);
>          } while (pmdp++, next += PMD_SIZE, next != end);
>
> -       pud_clear(pudp);
>          __flush_tlb_kernel_pgtable(addr);
>          pmd_free(NULL, table);
>          return 1;
> ---8<---


This looks good too! Although would like to first decide on whether we want
to wrap around CONFIG_PTDUMP_DEBUGFS.


>
>
>>> Thanks,
>>> Ryan
>>>
>>>>        __flush_tlb_kernel_pgtable(addr);
>>>>        pmd_free(NULL, table);
>>>>        return 1;

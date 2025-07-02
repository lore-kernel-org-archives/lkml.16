Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D40DDBC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.65
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468667; cv=fail; b=QpoLceyZKyc+LbPhLbDZQz6CBdvk9V+kshR6L5La/yYUTd3xlzGPYY0BGcFW0uEsTyeJCYbdraP+Jdhk+zS84arHM9KVVBJ5/NXtNvRYacW2N5RmwgfZihF1hsHquTaqhPcukx8lu3VxVQyvDyz0yrNStEJXnIxgx4TDYS72hds=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468667; c=relaxed/simple;
	bh=KARAmoj/S03/baFC1gDZgZpx/LOsci9GHqXYBI8WBa8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vDefuskaD0HzWcV7n944T4cdMH7zRQbfAc8Rdx3E246DE04BiMKX5A7DWxTLwxIFH/PvyDS4VKrkBPtf+V3t8StG3md6HeWvB0FATKgLjLlIMFhMrTzNgWwYNtC5EN4NwqdtSuMwnLui5LKyI97lWK9+QVeWvHVh1nPr5WP02kQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AvIF38Hx; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AvIF38Hx; arc=fail smtp.client-ip=52.101.84.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AvIF38Hx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AvIF38Hx"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WMieiZ8hFwZAiVsPUCy6xOUpq1lAlaTY7ssWj1WfihhswbdcK//0rb5xnlkiWxl+6qME9x+4LpYrZ4RwAoEoGUAxry+kVGFNbS0wtviFHIQNPZpA+arSXEo7X5OrV/VSlSSagV1LyG/t9DvYb+beXGsUZAJKZw//CGrSX04zkBRpQHuH1ovMxKIckWHlSnkoewHZevOR0Xawf+w9uU+f8qB5Tk8FbzkyTQA162pNHamcgltjULv2GcLPbVvxesYV/SW+OPNNzGko3brQs3mC5IDdh1y1BQ+kz8Nas3ATeRAO5AgZhMtZr1LVS7Taxy2/cqbMlVYE0nH0piTfex3rYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KARAmoj/S03/baFC1gDZgZpx/LOsci9GHqXYBI8WBa8=;
 b=NV5bWasQTc5/RFDBSKK/1sTo76nldjzfheLaftWQu+f6RFI1rhhxtk+wn1ckvl+qVFXggwEVcwB8QUSDtDtLby16jdvdqvKUPBd5JA5yRmJKk4a7OMsAR/Ku4/qDSH8o4rSk1PIoNKj8Su4Ynmi/wY33UIauN1y4c33sNJF/tuR4JAcJrqJLx4vK4KjTAIAkgyKlzFhKJem1D+5DN1OuYpCLYc5d4m9z25Iwc4E9JJQEOn/VXDxNmgs5+etql6nLZPa9Tr6SNUP1tFyglcc1V9s1nL3hEBnChC0HHvta3gWZJywtIFljccRD2rZEBQwIITds/DB8QAWtmPRQNawAdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KARAmoj/S03/baFC1gDZgZpx/LOsci9GHqXYBI8WBa8=;
 b=AvIF38HxKPsZToKsZ4rSZShOmdJoeiusInBlkUK8dIdgzNmeTcZV7kVZC6/Wcp8cup5rPABWisLBWI0B02Gsp2UrBODg94nRWL4H5k3mNWwqi6DETtJpPNTr+F0fB/yFOd/oFAfRqGTOJXkOdFExLg5+qLHJem0FughmfV+HCgo=
Received: from DUZPR01CA0093.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::21) by VI1PR08MB10243.eurprd08.prod.outlook.com
 (2603:10a6:800:1bf::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Wed, 2 Jul
 2025 15:04:18 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::f3) by DUZPR01CA0093.outlook.office365.com
 (2603:10a6:10:4bb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:04:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 15:04:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdbZiiv8brtJpDIiDAHx7jee4+J9Ei5wLssARdcySbU9Bx8QvmPBBzCw11jFmzmLaWx2l76/feL/jJP096Sgb8/VHK9h8WqQVDM4CfNRzPTQ980i4eJp7kzA+qBrRfrHJazUfOLi0y8+N+o+pbh9sLsrj/vR/gocvhvByGE/pA8CMZQDgT6q8AJaX8lcca/q4IEioXkB6db2Vzwd5DZZsiLDkS0XfAUeR8HoiD3j7Na8bEzf5OuZqkJfyP2AFyGoB49p01xkNeDYhKPJOlMwhUi9CZ5NP6YlIXNaAvDMUVmuWak+h2mZ4TJcCmZGaflAKcLDxMhcihFfTxSu5imyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KARAmoj/S03/baFC1gDZgZpx/LOsci9GHqXYBI8WBa8=;
 b=ko83QLnaZ9sAJ25CbPbsB8lG0uX53QPUIYLTgZe4MdfEmL6cifxGNKNM2j9gsH3MICIChsLZvkJ/QPVMeckRFMNqc7ZEkiMkEwLtyCPNT6gVgyB+P8VJH7Y4q9nGTMFDYCKlVfUKtdiX8ONE9auSNkJvZNZ/uaWhgerf19PKoJwyjwrA1rCKQAFvmWbgiBsJ0bbgqJUM1scFBS3rAQxNWvDczKbnc5mC4jS4HZ4/vVCXc7vamTB7q3doMGnduDmu4WYkN+t0x38CVDBzK2qFUn9gBIPErcFvoyzBwufA6iuB6rg0+NUabTFdUlEWZxvwqrOlnI4zX9r4IiinX9aDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KARAmoj/S03/baFC1gDZgZpx/LOsci9GHqXYBI8WBa8=;
 b=AvIF38HxKPsZToKsZ4rSZShOmdJoeiusInBlkUK8dIdgzNmeTcZV7kVZC6/Wcp8cup5rPABWisLBWI0B02Gsp2UrBODg94nRWL4H5k3mNWwqi6DETtJpPNTr+F0fB/yFOd/oFAfRqGTOJXkOdFExLg5+qLHJem0FughmfV+HCgo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DBBPR08MB6060.eurprd08.prod.outlook.com (2603:10a6:10:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 15:03:46 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 15:03:46 +0000
Message-ID: <1d1312e8-325f-404c-9ea4-03b38ed7b1e1@arm.com>
Date: Wed, 2 Jul 2025 20:33:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Ryan Roberts <ryan.roberts@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
 <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
 <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
 <61f50191-8bd0-4f25-b3b7-86605af8c0c6@lucifer.local>
 <aed58edc-88c3-47bf-8cc3-bb8d80c4e221@arm.com>
 <d54cf100-3c74-450c-a7d1-8fedbc97bdb8@lucifer.local>
 <3ce333ae-dae2-4341-83c5-39877b6f2bd4@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <3ce333ae-dae2-4341-83c5-39877b6f2bd4@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DBBPR08MB6060:EE_|DB5PEPF00014B9B:EE_|VI1PR08MB10243:EE_
X-MS-Office365-Filtering-Correlation-Id: 1423e23c-08e0-4ee5-8bc3-08ddb979b827
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NnhoeTVodEdGS1UxQkV0Yi9GYWlheXdEVklvQitKanJRQUhLZlNrT2M3OEwy?=
 =?utf-8?B?eW9SaXBsTUs1bFFMUnE3ZU9VbEdqa0JSUXVOY0FFZlErWnRMMDMxY2JTMnZk?=
 =?utf-8?B?RHNpT1ZnZ2U2ODlsdHFzSFJEbDJoOGxrN1B5YjFzdkpYWGpONkdOcUtodUg2?=
 =?utf-8?B?TkwzTGd0YndvQ2d3K0wzN1BNaGRWZUFhMEJNVjFrbzJ0MzlzaFo5cDFvV3c0?=
 =?utf-8?B?QzRnaHBFZlltNEZDZVJaUTJsTlp2b0YvUUdCMVRsUTBqekRuNmpQclM2Sk1u?=
 =?utf-8?B?WU1ER0dRSHR2QkV0RGVKTHNhWWNrVlh6eDRsMkdkVlhMblMvU0ZQaVdiUk5C?=
 =?utf-8?B?V3prYUxPSWtKclo0ck1HNk1XYkRRSllIV3AvZWFrVDQyUzBhNzYxWDZtb1Iy?=
 =?utf-8?B?d05aUlVxZFFXSEQzd0s4Wm9jeVZaSVgreE5UeWNrQjZyZ2dHRmxTclJyRzBa?=
 =?utf-8?B?WnNTWGJ6U0dPY3VFcENzQjVMRlM5eWcxcnRIYmdsV0RwNE40TTZicnB3aVhy?=
 =?utf-8?B?SUlLZ1UzOWdpOXFSUmxuVlk1UHdaYkd2RjFEWUhPeHhEV1krUytWakw0MFBm?=
 =?utf-8?B?WFVjSmxheFlXRDdvb3MwQ1cxWW1ldWFYbFM0b09ZUjZkQzVFTGxLY3BOOUVh?=
 =?utf-8?B?a0wxeWFUekZVT0dLazBjNUpsSklPT1RJdlowZFJWZXQrZWx0dHBubTlVRU5Z?=
 =?utf-8?B?TW5nR2ZDMllMSUV2MktqdE9BaytDeHliTDBMcGwrZDAzeThYMmFlcVZkZkVF?=
 =?utf-8?B?RlRjaU5CM3Z2QlZqRlVXQS9sblgvYXVBRXFmYjFRVTQ2TTNlZDY2emlVNnFZ?=
 =?utf-8?B?R0VhYkpMV0dNSUVFdUNpZ1l4MnY2bkVCaEc4ZGoyMkRodFV6TVhpamhLR1Iz?=
 =?utf-8?B?a2xndm1nOENleHN5S3lNYmtheXljRmwybzhTdk5kNzcrY3FVZURiN0hyNEgv?=
 =?utf-8?B?Y0hQMXBtMzFlYTR6ZXUxUWJzWHFBTHBjV3hOQUdYQkovd3dvRDJuaUJsTXpr?=
 =?utf-8?B?Z0pXVlhZMitJcURPNVVUQjQyQXRwYVEyRWQrRndYNXVaamRsTE0rOG41NnZF?=
 =?utf-8?B?RURod0p5MTc0S0VhM2dNTVpUZklaaVhUUUFyeHFpTXVsNzVndG9sZ3ZpUUxQ?=
 =?utf-8?B?YUh0ZmxyN1hHTG4xOW5EVWl2WmVTaWFFYVFub0JaWmtpeG5oMldSYTRhNDVa?=
 =?utf-8?B?dmNjdXJncmZzYXVjWk5wS21DSHBNTGZWc01UY2RXam9FOW9PWHgzVGRlaWVq?=
 =?utf-8?B?dHdZVi9BbER2T0xJMWg4Rm5TWTEyaU1NU1QybVNpL1lSTmZVQW1Vb0pFSW9X?=
 =?utf-8?B?anVXdFFNcnROeDFpTjdqYWFLU3JlUTNaUWhGS1RVaGdYVko2RkwrK2Y4Ryt2?=
 =?utf-8?B?OXRMajFSTlNpM3BpdUdsSWxKRU1MTDYvdGNMZ3YwYVNMakJzN1k2M0Yxc0Jr?=
 =?utf-8?B?Y0dVY3pDbExWak4yN1RmNVJTUFllQk91VUhiaGNLS2krMUYvSVd2Q0hIUyta?=
 =?utf-8?B?TWY5Mmo1TXFKeXdUakF1MUE4QVpTRDZ6SXFNQWt6eEp1WUJWWTdXN3FRUysr?=
 =?utf-8?B?WnNyd25qL3FPWUpsV1UwOTAyZU1MN2VDcFptM09DRld3Um1iYlBVMms0cnFX?=
 =?utf-8?B?amNjcFNsdWU0a2dMYlBxUmJYRDRCc2VNYUNxMkR3UmFXVVZMZVlweDhzV29U?=
 =?utf-8?B?b1doQVcwSTlGSjdjV01qekx5K1BYYWp3L1FwQWhNWS9OZzUremdyVXpwcWJV?=
 =?utf-8?B?cXNyc25GRGxFZmJWYU0ycTBNem5vOE10ZGg0dnVYRFBMMXVqTDFoTDdtL0RV?=
 =?utf-8?B?Ly95RVN4K3NydmRNeE5xQlUyQmx3S0Z4dDZIVjdlNTJKaUtaRnorekF2aFA5?=
 =?utf-8?B?dWZEaGlVQ0JLdkVJWU9jQTNGUXlReXNXMU5kTDRyT0NJUEhaeUNXeVU2bnU0?=
 =?utf-8?Q?ykd+Xo2WD34=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6060
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	299a228f-c33b-4a6e-92b5-08ddb979a4a7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|376014|7416014|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmZERWkxQkNoOGpaQnNYSUxSTmI3WkVHVmxBSzM0NFlYU3pJVTU4VDRyRHNB?=
 =?utf-8?B?K2ZUaWIyb2JKbmVvNVNGRUpyMXlHeFVEMzFBT2tKWm9FL1BWbGNwK0RwMjcv?=
 =?utf-8?B?U1pKTG5uNUhNbC95YmVvZjRFZ3hSYUVkTDBMVHZydUxhQ3ZPZTFpcThnejFp?=
 =?utf-8?B?OHAzWDlUQ2cyL2xrWHVxd0tuUnJFNmpBWXJXM0RVWTNCQXk4Sk11R3dLZ2J5?=
 =?utf-8?B?N0EyeGwyTCtGcnFCMnBBNGh0TkNNTnZnWTZKdnRsVGNQR3BzU2F5bUFpNlo3?=
 =?utf-8?B?K1A1VVZCZ0xzcFVRaXB4MGN3YlVSSFg1S1hWWmpucDFjbnVVNC9aVS9uZ21z?=
 =?utf-8?B?UGxuSUdhK2xtb2RMemlGSGswb1JHWktlcjQ0T28vMXBqSStkTTgvdHJtdHhJ?=
 =?utf-8?B?R1BkNDIxQlhtUnp4WVdKUmRnMkRnVktoend4VnB6cnp0V1JuVytQWlRtbUZ6?=
 =?utf-8?B?Z1BoNlVnZ3lzSDNiN2wvQ3ZtN2h6bDlMeEtsdHZTcWtpV3NsNm8xSEw0bHpo?=
 =?utf-8?B?ZUtXb25wdTBRTEpjb3JHV1lhRGd5MzRwbGFQUk1hNlFhZnBHWUtCTjR3VFMv?=
 =?utf-8?B?b3laK1RKTDM1Mnd4UTNaMkNvSkd2Q2VtdmJvUXFCOVBjUEZVTXZBeWsycEx5?=
 =?utf-8?B?YlpVSTdLcjMydWozZDRBTUlsR2pYaGxYVFBQSmVMci9mSmhwK0dMbEN2ZGN4?=
 =?utf-8?B?SFNMMGlJcUhmSXJBNTlaUzJaY0dkMUJwbDgyV3JQTFlGQWdCRnNQV2J4SUxq?=
 =?utf-8?B?TkdML1ZNS0VGVVQzNlRBZm9jRURMWEZwYVA1WVBqamdMdGxjV1c4b3ZqTmR1?=
 =?utf-8?B?SVVqWWdSR3RFd095dlVJZUpxcnp3Mk93K2lUdzhVcFcrcmJ3eU1MSUg2Zkhu?=
 =?utf-8?B?bWZwRFg3ZmxUS0FVWkRERTZOaFdKd3pCQVB2RGZjOHBySDdiclRhT1I5cXVN?=
 =?utf-8?B?WktLcHhlM1BWRkhwZjlDZm1nYmd4QW0xSjMvSFZNbENXRVRKckZzUVNmN0pr?=
 =?utf-8?B?RnJTQldWR0ZsTDlycVA4ZzdYa0cweXBTZmlFYjFYMWFtcSs3b2tXSDQ0UlBD?=
 =?utf-8?B?K2lYSXcrTkZzbVVaeXY4UlUzSjllZHFtQzVzVDdHeXREME9kNnlEUThEUFdI?=
 =?utf-8?B?N0I2UVZacjRjVFNMVG5zdFVuTEdOeVJ3RUFKZHAxbXRLVVcwakRITnhLSlZx?=
 =?utf-8?B?VDRZU2ZlR0JtU3cvSEN1dUM4U2MwVVg5ZzVPTloxSXFvK1NTYm4wYWZtQWxV?=
 =?utf-8?B?aHc0SW1RQWo4M0xrWGJjMEw4anRyUGdiejdjZ3MrRk04UldoTktVajNwRFBU?=
 =?utf-8?B?b29nTnRJZjNnc1FOVVpzQ3ZnVVVKMVU3V2RvMGllSzhxS1FoNDhtczkyWWhX?=
 =?utf-8?B?TzlGTnQ3bVZtN2Q3TThMdkI5dzZEZm5oZHFNbGczK1FsdnBjYmhLSkgyQnhT?=
 =?utf-8?B?MGxrbDM3RnVjMEhTblo4NlNjNFFxSDBzaEw0SVBWdXBGVWFZOGxsS0RkTjlY?=
 =?utf-8?B?bkQyblcxbFVxRVFpZGdCczZIYnYyd21SUzNCUU9iUHVsWG50MUJWSGZnM1BD?=
 =?utf-8?B?WE5mYlpROUpibnh4dm54NUUrV1VGbDhhMGVsV2tkQjJNTzRvdFJHUWZBbEZC?=
 =?utf-8?B?K085S0tFcmVhTlVudUdweWhYT1hOeVAvSVpNdGU3YXNLUjVBaXZBMlNvbHhD?=
 =?utf-8?B?d1VmYWt4WHYrN1N2TTBrT2xMeDU3YVZhSnV5OHdJaS9vWkNBUERXNEs2cVQ1?=
 =?utf-8?B?UER5NzQ0SWdiUlRXd0tid0U1TUVIQXNDcUYzTmUzZll0NCtva3N6ZGN5cXJD?=
 =?utf-8?B?L29NMWdvUU9vaytKQXRVM2piUVRyd2hGT0hiODlhV1VVaXBFejFMZk42S1V2?=
 =?utf-8?B?SXJvenFMcGd4dzJiZjhZcVpTcnE1VGUwL0FVZVlCV2xvSzhaeWt4MkJETW5J?=
 =?utf-8?B?cTNLUGpMNlluK3RvazQ5YURQQjUwY3FxWVJNdkJtdUpsNXVBS2ZnVm1qUnND?=
 =?utf-8?B?SUs1akFVVmFaVXc1M3pQVngxNCtlcHppNkVFeXFJSTBGRjJscnl2TjdEL21j?=
 =?utf-8?Q?cSBb+s?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(7416014)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:04:18.7275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1423e23c-08e0-4ee5-8bc3-08ddb979b827
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10243


On 02/07/25 4:02 pm, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 02:40:14PM +0100, Lorenzo Stoakes wrote:
>> Let me fiddle with this code and see if I can suggest something sensible.
> OK this is _even more fiddly_ than I thought.
>
> Dev - feel free to do a respin (once David's stuff's landed in mm-new, which I
> think maybe it has now?), and we can maybe discuss a v6 with everything else in
> place if this is still problematic.
>
> Ryan mentioned an iterator solution, which actually now seems sensible here, if
> fiddly. Please do try to attack that in v5 to see if something's workable there.
>
> Why are computers so complicated...

Sure! I'll be out next week so the mm list can take a breather from my patches : )
My brain exploded trying to understand your and Ryan's implementation conversation,
will read it all and try to come up with something nice.


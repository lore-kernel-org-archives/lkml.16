Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E215B1ABED9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284466; cv=fail; b=mxDcoH46OzlXrO/Ln1Ekgi2n1jiBobps6eelT76waC1nVgW0sBfB/pPFDlcg7f+WysptFBOBuGgeC6yURvIqf3zUtdwEDPVAYYwK4l+gWu3jCTTahJtXmxVGg7xdNBQIcrzKd19Hg6lKl3+rJEBDuxIvvBZlBiz1qGY8yGkBPQI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284466; c=relaxed/simple;
	bh=VRnIWDFof5mBNKzwM/oC6oKnwm6laVoKvyqUOP4OkC4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dP0xQm6juSmLISFAb539ylNdNUEV5k/ZCkPgsrqI3Alxg9JQTPtU96JLhThevyqrPR07m1/y7pRO1E2XiXYdnFXr9TROOVaEMgzDE1nVf0VpheOqv90uR9Wn5bYFZxTEk5JllSkFx/oAmE1fMz9bU8llKDgzDADU8Vu5qi8bi8g=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OtROdiNM; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OtROdiNM; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OtROdiNM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OtROdiNM"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cBZIegnC04BH3+lpRMhrd3nvFnpK2OxxXCDTdB3Kh3tWCPvkqR8yU21qeJ0yHrMtFcM1DIjeTWma9/MxvfdP5e1M3swcxfboQTl7FICgvLYHuiKwGs1L1z3s4WmLVrrReHIqNDO8SJVWAeN5z4i1aDs3SuP+a0DPMLTkGqlNwKgtC4KfYPUqd/FUyZJxtX8ujznTOHBz6XUTkchzh48u3rjNKajAwqra0NNtYQJidmucGFNllLN84rwfpV8LGc+gYC51ndLo0Q/ckeyw1N3TuYpaKAgkZc6+3GVpGEOedICCNzNVYtENNDsgCUnHqCbRBYD97a1b9VztTPQzDXoPVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84Z832N1rdsWKtbeqAsrKjm54LvsopAzgfyQ3Z8/DXw=;
 b=leqs6+sNBDm8IlR9SA76iK+JVvNPZ7q/2hfqDbDviqcEZhHOD3JB//rTRuQqjPEXxJgDYML1UsKLAIcO9kw2jG2Cii3flUT0CYDsbOgbJm66hYTMqPPztiUB+srgD3dJo1fztb8EEXGlvchWuXZmsuYztvZGwHGXedDABb58oEbwg086WGi8YSb1Ob9oik9jSM2w/Bbq8+cx8fqvwlinKr76zXrZaZ+y1Ucshwy9MZ3+bUej+ZrqqLuSTkM4Dd9hqQ/qPJFcsMBUi2VHxGtVXzaFgbaqeTmUM4lSechkhQgHPT7BJ4saPRfJTfC4SwsAY/hFUhnAxrjcph9OJy942g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84Z832N1rdsWKtbeqAsrKjm54LvsopAzgfyQ3Z8/DXw=;
 b=OtROdiNMNpw7JzsQXCyECcCqmLTgHty5OTSn0JbpepGXW2ZKVfJA13M0w9EKn45qbKTy6YmZkMuezIGZfLhPBhgb/GaeU59PfioZtd9PjlhKiCiiE05R63n6vRuNu2jWzN0XHlWorUbf/f3CNe+nMr6pnyACB9L061RFIseNTts=
Received: from AM9P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::8)
 by DU2PR08MB10016.eurprd08.prod.outlook.com (2603:10a6:10:49e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 11:54:19 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::55) by AM9P195CA0003.outlook.office365.com
 (2603:10a6:20b:21f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Mon,
 30 Jun 2025 11:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 11:54:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/Ve/oI1MvadCv1GOBZS+0FrEy1Cd3pe6RJxRC1x//JWF5SxMHBOrHHmxZ5NSXz8MetHQTA7lkZz3Qgxyen2LwmQnvT12bBf9MV51dt1AvWtJkkTgh90BZZ6gcd+SWXIk6mJm4/TsXy88yzsRyhLRMTfGKhWEaAQoRC97vYsrblZWRM5MI2QfkdvyKNHQV0kdTOIvXBz/VIhE63rSM1VVe+4XY87gifUJabiGNxCNbxzSMlvCkRsJPfomw+ommFGZMGJ2Uu38gNfFuWFvmLwc6ejbXPDJiib5g5cMPHuLc3VTgtGP55cXuIm9aP36LQRLLro9fhVokRNZRbRsr3/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84Z832N1rdsWKtbeqAsrKjm54LvsopAzgfyQ3Z8/DXw=;
 b=dX6c54kVoN6VbCVb7Cd5kKPLbLHI3l6zRy6rp824YENdNQRBlnSIJmybjqejTa+P6t2HfUFMMJ73GgVF/LMeMSkNGDxR3NKseJT4O1tpkKwSUrxv0780uEWHsa7vDEiYRRQ4pVCACQDociRCNuu3BFsnddtIKIhCzL4/OcBGTmPM+M2gLyxaTuo90CTI/B1BpIG78s0p7hBMHXB7O8VrNu4s2h3Idlbdng/Te7aAK7kqYDLWHW5se9twBpE69CyePStmxicRTbyj5tFLxmnSkDc3xpEu/yJ2jjrU1m4nVKzKCsyT84qoGiTn4W1zCQGSrS1qg/1Umpwc37sl6uoLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84Z832N1rdsWKtbeqAsrKjm54LvsopAzgfyQ3Z8/DXw=;
 b=OtROdiNMNpw7JzsQXCyECcCqmLTgHty5OTSn0JbpepGXW2ZKVfJA13M0w9EKn45qbKTy6YmZkMuezIGZfLhPBhgb/GaeU59PfioZtd9PjlhKiCiiE05R63n6vRuNu2jWzN0XHlWorUbf/f3CNe+nMr6pnyACB9L061RFIseNTts=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU5PR08MB10851.eurprd08.prod.outlook.com (2603:10a6:10:522::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 11:53:44 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:53:44 +0000
Message-ID: <43ddbdee-0cc2-496b-8ea6-b90a04c64d68@arm.com>
Date: Mon, 30 Jun 2025 17:23:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
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
 <20250628113435.46678-4-dev.jain@arm.com>
 <41386e41-c1c4-4898-8958-2f4daa92dc7c@arm.com>
 <6ded026a-2df2-4d81-bb70-cd16a58f69e9@arm.com>
 <8220a6a2-913a-42d8-9897-7306a624d89b@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <8220a6a2-913a-42d8-9897-7306a624d89b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU5PR08MB10851:EE_|AM2PEPF0001C713:EE_|DU2PR08MB10016:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c8021f-a676-4afa-18ec-08ddb7ccd8a4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SXZ6NnhQU2FEcnltNlJQUWVmY25GVU16MXpleHpiNDVKUGtRalEvQXpmYWlE?=
 =?utf-8?B?eVlZV0tpTTh6MkMzWVFnZCtrWVVYVXhVN2k3RytJYkRJRHA2dFh4c1RNeFI2?=
 =?utf-8?B?a3VqSVdQWDNFaEhSa25iVTF5aUpQMmM2V0lyMXZMUEVaWUZnUTd4Q2hCNVVq?=
 =?utf-8?B?K1huQ09QNFBBVDRFSnlrZVNJYVlPaGFITlF2RXhwVGsvWGhsY2h1a1JUY0JL?=
 =?utf-8?B?NmNZc0ZTa0dLUW1PMlgvQVRTcFB4UGY3eDR4UFp2VkVUZmFaWHRKakdTdWNr?=
 =?utf-8?B?SG5jdWhKWEV4ZGozVDBDZVJ3YlBKMHpINDkwMGYzQ002NGFWRE5CemF2SlJQ?=
 =?utf-8?B?UEIwbllyMXVwbnlpVkNFM1hvQXdUWnRiNFZ1U1hobXBJaFBFaDVNY0toeUo5?=
 =?utf-8?B?MXNwazhHRlZZRWVjc2pvR0ZnMjJtSGlEWlBEWkMwWnZMVmJabmFqYzVQVkNw?=
 =?utf-8?B?UHNNNHhWSXZIOEVoZGpNSytBUFdHT3BVaTA2RExGSVVManFNcHVmd09Ba0FB?=
 =?utf-8?B?ZkVWN1dpYU5TS2VGSHBIZlA0dVRGaDZyanV5bE90UHZPazBlWVl3LzZqOU5V?=
 =?utf-8?B?aXBRRnRLRUZ4alZOSnEyeitrUWpwMk9GeHhsWFRjVE1CQTlLZGowalZna1No?=
 =?utf-8?B?bmY3MVliVzNJSWJHcjJVVW1LSGVVN2N6dWF6eHZXcSszUUZLUW5oZXlvNXVn?=
 =?utf-8?B?MHBVMmlxcDdPeGV3R09WbUk3RCswcldFaWVmeUJjeGFzd2FaTnRMdnFMTis5?=
 =?utf-8?B?MVV1RmFvSzMycmphTWovbHErb2I5U0lzR2VWN2FsR1M0cHNvdy80ZFVGbzRH?=
 =?utf-8?B?NDhoc2dyQmFPMkdEZTN5NDdVRXM5emxiRkY5MkkrNkRRbFVPa1llS1lmeEha?=
 =?utf-8?B?SjhaUlBOVTFzajFnYUxOOVVvYWV1a0NkazdhZFJxb3NFUk5ISHJ2NnBmUDBz?=
 =?utf-8?B?U3Zrdzk3blFzYjlkN1Z0ZmRTSk1HRVJWa25MYjQ3RkUrWDgzcGRmLzkwVGo2?=
 =?utf-8?B?a3ZqODdCVHBvZzkxYVJxWWU1bDE0a1FqSERhQUt4R0t0WjBjUThEWTM1ZGJn?=
 =?utf-8?B?cWpZcHBleWkwL3o0SGU2R3d0NlNKWThNZXBHaVlOVmVteW5DRFkrVXQzMXpa?=
 =?utf-8?B?ZkNuZDg5RzhpaFVCazE3cy90UXp6L2VtMTNaMVZXdlZVcmVIb3NFd2ZXQkdm?=
 =?utf-8?B?WU5rcXJRSXNQSzNhZ0ZqQWtJQ0l2NTdKYk9WWWJhaVFaWWpjN3hEZUdpTm9N?=
 =?utf-8?B?OEdDN0VveXU4L0VXVkE3Y3VqREZ4RHVLdUl2ZzIxNzhKYi82TWRFTldQbVN5?=
 =?utf-8?B?TFNZeHY2Y3R1SXRjRGdMWjIxOHdLdHZuRmdOa1hmdHNQT01CVzdnZCszbWZN?=
 =?utf-8?B?U09BNVM5U05FZ3M0a2xQcFJvQ2haMVdhZXhSU0NhQ2RPSzc4M29MLzRwdy9a?=
 =?utf-8?B?UzZna2h0eWRFR0U5UGh6N2VwMVNJM2Q4VEF3UGRFc0ZLNjAxZSttdUNxdlZC?=
 =?utf-8?B?TUZDNGNGbU9MRUNwS0RvakhoMVNUN2R4ano4U0duU2lNaEFhY1ZCY3ovdDk0?=
 =?utf-8?B?Sm5pQlVEU3JBWTJRTSt0TU5vRlkzYTJ6MTVjajIzd0lyZFprS3dUK3haYkx2?=
 =?utf-8?B?ZFNmZitiNE5mQTZEOU9aVE9pMCs4TkttK1RVUFhJZVhaRUgvdEYzWEpqb1lE?=
 =?utf-8?B?NVhJblBXTmFpOGc4YXBJU0pMcllIVE8yM21QQTRyVjlQeUp6V1RRM3NtOFhD?=
 =?utf-8?B?NndhVVdtb0xSUmcydW1wWUhoNmJ4aUxnUTVXN21BMkEwdmV3VEF2ZWYwaGVm?=
 =?utf-8?B?SkFsWDdZb2xISzNISmVtenVJYXRTQjdnempVSW5CbUppMEtTZWY3dTcxRmVv?=
 =?utf-8?B?dzJZdmFCVzgvdjNDblF5eUlaSjlrSDRleXlQT091bmJJQTV3L3M3QkpOTVVG?=
 =?utf-8?Q?8k2uESsWq9s=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10851
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f9c497a1-a4f5-406c-ac2b-08ddb7ccc3d3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|7416014|36860700013|14060799003|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVZncGR6U1NYeTg4NzhIeGZKQVhsV0lReFpUOUlMSmk4OWM3MWZkcXhnVUFl?=
 =?utf-8?B?dER1WSswYUFydCtRSTMvWjJBNDF1TS9Ed1Q2cHZnODJIR1l1bmxwck1MUjdZ?=
 =?utf-8?B?YmUxMlpEK0J6MkNVY2NQS2VtZ0FIckgyWGoxbk5LUFViK0ZFNVc0WGdpd0l5?=
 =?utf-8?B?SzZhVnFVU1ZUQkhkTlJ1RFZ0enBlT2swc0dEanJMbWZtY2YwUkFxYVk5RU9Y?=
 =?utf-8?B?eFRwNDcwN3FLRUNvQlJsWU9hVHpWcG9YcHpUT2JzdklvMWdnSzdwcnAydFlI?=
 =?utf-8?B?ejBvbnRrOWFvZXh1NGJ1TzQxS0NmV3JJWXdRcW05RXN3NlZjUEFGNjNLZ3gv?=
 =?utf-8?B?OXZFWTRjR3BqRzhuWFNvOFZNcWsyL082am5IUy9kZ3k4bWFtWHdTTDBiUTU4?=
 =?utf-8?B?Q1VFUFcrT0lteWI2SzZ2YU5QTnl6WTN0MC9nbGNzMHV4M05mWC9pVndYbmxm?=
 =?utf-8?B?MVZEaFRGVnZUdHJhc05Pd2xCdXN4UEd4VXYyU3M3ZkxGL2YycnlySXRIWWhR?=
 =?utf-8?B?TFhIM2YzSldWNGVMZHV5S29IOTZqNjZQRXp3OGJRVXVGUVJ6MkI1VVovRXFL?=
 =?utf-8?B?eHp4elBXTGNTZ2RGaWNIVHQ4dHF2TXdmdTJhTjJ4UERySEFUM254cWlPTnpo?=
 =?utf-8?B?aVRlVy9xS2hSR0xDcUJXQWVIeDk2dEpGaGMyVXNLRDhQL2pDMndvQUlpN0E5?=
 =?utf-8?B?SExvRHFOZmhicFJjTmhFdXRvdE5XUXgvTW5MbWI1TnZDNjNrS0RtM3VyMUI0?=
 =?utf-8?B?dUlQclRJenFUYmRscm5mQlBXQjlZNlJZMnFDYXVLdEtHYVdaeTVybmtjRlpq?=
 =?utf-8?B?M2xaVUNjaFd2cEhZREFRUkxhNkVvdldsSVlXSzVqS1J0L2w1UnpnU3ZlU1Nz?=
 =?utf-8?B?WWplWjFOcmpFZTR3WXpnZU1tcncxUlVEb3orbzVqOEFFNUt0dVIrOThpdm5a?=
 =?utf-8?B?cDdZSTlNQUhDa1hXODA0MEpWRy94QzY1aXFwTWswYTZpc2JkNDRIRGo1TTAw?=
 =?utf-8?B?VUkzVHd5NkVWQituSFZJYSs1LzU4dlFBa1VvSTdEdmo5aW84cmo0NkxHbU9Z?=
 =?utf-8?B?TVBlUGMvczRObGdVaGxtQ3RINHVOQWhrdTRtVE1vdzJoamI2MGQxT3Zkci9M?=
 =?utf-8?B?WDc2Z0h5RjNkZVgzN2pDQ3BNTnZTY2JYbnAzenhwRnZmbWdzMGtIY3NKcXdo?=
 =?utf-8?B?bW1LRm83RXNPMmV4Mmx0Z0VEZUFxT2hlcGNtUU5yZXZoV0ZJRXVja3RtODBn?=
 =?utf-8?B?aGMyZjU5N2pnMVdKQVlsVjUvVHpCSUVQZFJGNlM2TEtSSm50OUFlMFFzTjBV?=
 =?utf-8?B?bktXa1RZTWRhZE5vQ2xnVFI5TExPUUp5N1RwNGdKZTVCT3k0L2RwTFlONVZp?=
 =?utf-8?B?cHZseURGMlFSWWJCbkh3blNmekFxaEE1MTFBc296YjNkYSszSFdEQWVyalJG?=
 =?utf-8?B?VXFtVWVZSmszWkF5TVhIWkg1a2VmZXZObXVVVEF0cVgyTkNQemE5NnMzTkhW?=
 =?utf-8?B?ak9WR09qUUIwUHRlN2UwQ1FtaWY0bGRNZkh6UGVKaTBpSlMzdmNaQ0lLMkkv?=
 =?utf-8?B?SU9ZZmRZYlRYSytQb3R0dk13SHFsWVY0S083ZkRlUHR6dHIxcEg1WTV4aFox?=
 =?utf-8?B?a0g4emxuWUxKdHZpWHV3N3ZCeXFXeVNDS29HalVNR2s2VElQN29vc01QK2E4?=
 =?utf-8?B?eXFwZUlaOTBDdmRET0M3TzgyUE5XcVkvM043TzVYZ1h3NiszVTMrbkcvRmln?=
 =?utf-8?B?ZldTVHV3RjFiU293SHc5eVFzd3RNTDBya1pnVkVtQlF3MUlJaVFNMGo5VnRy?=
 =?utf-8?B?UnRyNStNK1pwQmpmNWo0b3hlWGMySUJBWmlZV01GTURYNldLREoyRzQ0M3Bs?=
 =?utf-8?B?NlphRk1zTGtEOHV1L25OR1BLcXRXTUZrZU9zaVlHdVpqaTlaSk96QVNSKzUr?=
 =?utf-8?B?WWJHN2RhaFVVdXZXYnN0Q2NWT3diUnVqY1o3R25tV1h6bjk3eDdITldoankr?=
 =?utf-8?B?a2RoUGNwV0NQOUh0NjN4Y2x3Rm1HcmE2VENIckZZZUR3R1VuaHZHaHFwdks5?=
 =?utf-8?Q?mstLUK?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(7416014)(36860700013)(14060799003)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:54:19.1316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c8021f-a676-4afa-18ec-08ddb7ccd8a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10016


On 30/06/25 5:20 pm, Ryan Roberts wrote:
> On 30/06/2025 12:21, Dev Jain wrote:
>> On 30/06/25 4:01 pm, Ryan Roberts wrote:
>>> On 28/06/2025 12:34, Dev Jain wrote:
>>>> Use folio_pte_batch to batch process a large folio. Reuse the folio from
>>>> prot_numa case if possible.
>>>>
>>>> For all cases other than the PageAnonExclusive case, if the case holds true
>>>> for one pte in the batch, one can confirm that that case will hold true for
>>>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>>>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
>>>> and access bits across the batch, therefore batching across
>>>> pte_dirty(): this is correct since the dirty bit on the PTE really is
>>>> just an indication that the folio got written to, so even if the PTE is
>>>> not actually dirty (but one of the PTEs in the batch is), the wp-fault
>>>> optimization can be made.
>>>>
>>>> The crux now is how to batch around the PageAnonExclusive case; we must
>>>> check the corresponding condition for every single page. Therefore, from
>>>> the large folio batch, we process sub batches of ptes mapping pages with
>>>> the same PageAnonExclusive condition, and process that sub batch, then
>>>> determine and process the next sub batch, and so on. Note that this does
>>>> not cause any extra overhead; if suppose the size of the folio batch
>>>> is 512, then the sub batch processing in total will take 512 iterations,
>>>> which is the same as what we would have done before.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    mm/mprotect.c | 143 +++++++++++++++++++++++++++++++++++++++++---------
>>>>    1 file changed, 117 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>>> index 627b0d67cc4a..28c7ce7728ff 100644
>>>> --- a/mm/mprotect.c
>>>> +++ b/mm/mprotect.c
>>>> @@ -40,35 +40,47 @@
>>>>      #include "internal.h"
>>>>    -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> -                 pte_t pte)
>>>> -{
>>>> -    struct page *page;
>>>> +enum tristate {
>>>> +    TRI_FALSE = 0,
>>>> +    TRI_TRUE = 1,
>>>> +    TRI_MAYBE = -1,
>>>> +};
>>>>    +/*
>>>> + * Returns enum tristate indicating whether the pte can be changed to writable.
>>>> + * If TRI_MAYBE is returned, then the folio is anonymous and the user must
>>>> + * additionally check PageAnonExclusive() for every page in the desired range.
>>>> + */
>>>> +static int maybe_change_pte_writable(struct vm_area_struct *vma,
>>>> +                     unsigned long addr, pte_t pte,
>>>> +                     struct folio *folio)
>>>> +{
>>>>        if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>>>> -        return false;
>>>> +        return TRI_FALSE;
>>>>          /* Don't touch entries that are not even readable. */
>>>>        if (pte_protnone(pte))
>>>> -        return false;
>>>> +        return TRI_FALSE;
>>>>          /* Do we need write faults for softdirty tracking? */
>>>>        if (pte_needs_soft_dirty_wp(vma, pte))
>>>> -        return false;
>>>> +        return TRI_FALSE;
>>>>          /* Do we need write faults for uffd-wp tracking? */
>>>>        if (userfaultfd_pte_wp(vma, pte))
>>>> -        return false;
>>>> +        return TRI_FALSE;
>>>>          if (!(vma->vm_flags & VM_SHARED)) {
>>>>            /*
>>>>             * Writable MAP_PRIVATE mapping: We can only special-case on
>>>>             * exclusive anonymous pages, because we know that our
>>>>             * write-fault handler similarly would map them writable without
>>>> -         * any additional checks while holding the PT lock.
>>>> +         * any additional checks while holding the PT lock. So if the
>>>> +         * folio is not anonymous, we know we cannot change pte to
>>>> +         * writable. If it is anonymous then the caller must further
>>>> +         * check that the page is AnonExclusive().
>>>>             */
>>>> -        page = vm_normal_page(vma, addr, pte);
>>>> -        return page && PageAnon(page) && PageAnonExclusive(page);
>>>> +        return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : TRI_FALSE;
>>>>        }
>>>>          VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>>>> @@ -80,15 +92,61 @@ bool can_change_pte_writable(struct vm_area_struct *vma,
>>>> unsigned long addr,
>>>>         * FS was already notified and we can simply mark the PTE writable
>>>>         * just like the write-fault handler would do.
>>>>         */
>>>> -    return pte_dirty(pte);
>>>> +    return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Returns the number of pages within the folio, starting from the page
>>>> + * indicated by pgidx and up to pgidx + max_nr, that have the same value of
>>>> + * PageAnonExclusive(). Must only be called for anonymous folios. Value of
>>>> + * PageAnonExclusive() is returned in *exclusive.
>>>> + */
>>>> +static int anon_exclusive_batch(struct folio *folio, int pgidx, int max_nr,
>>>> +                bool *exclusive)
>>>> +{
>>>> +    struct page *page;
>>>> +    int nr = 1;
>>>> +
>>>> +    if (!folio) {
>>>> +        *exclusive = false;
>>>> +        return nr;
>>>> +    }
>>>> +
>>>> +    page = folio_page(folio, pgidx++);
>>>> +    *exclusive = PageAnonExclusive(page);
>>>> +    while (nr < max_nr) {
>>>> +        page = folio_page(folio, pgidx++);
>>>> +        if ((*exclusive) != PageAnonExclusive(page))
>>> nit: brackets not required around *exclusive.
>> Thanks I'll drop it. I have a habit of putting brackets everywhere
>> because debugging operator precedence bugs is a nightmare - finally
>> the time has come to learn operator precedence!
>>
>>>> +            break;
>>>> +        nr++;
>>>> +    }
>>>> +
>>>> +    return nr;
>>>> +}
>>>> +
>>>> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> +                 pte_t pte)
>>>> +{
>>>> +    struct page *page;
>>>> +    int ret;
>>>> +
>>>> +    ret = maybe_change_pte_writable(vma, addr, pte, NULL);
>>>> +    if (ret == TRI_MAYBE) {
>>>> +        page = vm_normal_page(vma, addr, pte);
>>>> +        ret = page && PageAnon(page) && PageAnonExclusive(page);
>>>> +    }
>>>> +
>>>> +    return ret;
>>>>    }
>>>>      static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>>>> -        pte_t *ptep, pte_t pte, int max_nr_ptes)
>>>> +        pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)
>>>>    {
>>>> -    const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +    fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +
>>>> +    flags &= ~switch_off_flags;
>>> This is mega confusing when reading the caller. Because the caller passes
>>> FPB_IGNORE_SOFT_DIRTY and that actually means DON'T ignore soft dirty.
>>>
>>> Can't we just pass in the flags we want?
>> Yup that is cleaner.
>>
>>>>    -    if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>>>> +    if (!folio || !folio_test_large(folio))
>>> What's the rational for dropping the max_nr_ptes == 1 condition? If you don't
>>> need it, why did you add it in the earler patch?
>> Stupid me forgot to drop it from the earlier patch.
>>
>>>>            return 1;
>>>>          return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>>>> @@ -154,7 +212,8 @@ static int prot_numa_skip_ptes(struct folio **foliop,
>>>> struct vm_area_struct *vma
>>>>        }
>>>>      skip_batch:
>>>> -    nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>>>> +    nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>>>> +                       max_nr_ptes, 0);
>>>>    out:
>>>>        *foliop = folio;
>>>>        return nr_ptes;
>>>> @@ -191,7 +250,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>            if (pte_present(oldpte)) {
>>>>                int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>>>                struct folio *folio = NULL;
>>>> -            pte_t ptent;
>>>> +            int sub_nr_ptes, pgidx = 0;
>>>> +            pte_t ptent, newpte;
>>>> +            bool sub_set_write;
>>>> +            int set_write;
>>>>                  /*
>>>>                 * Avoid trapping faults against the zero or KSM
>>>> @@ -206,6 +268,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                        continue;
>>>>                }
>>>>    +            if (!folio)
>>>> +                folio = vm_normal_folio(vma, addr, oldpte);
>>>> +
>>>> +            nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>>>> +                               max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
>>>   From the other thread, my memory is jogged that this function ignores write
>>> permission bit. So I think that's opening up a bug when applied here? If the
>>> first pte is writable but the rest are not (COW), doesn't this now make them all
>>> writable? I don't *think* that's a problem for the prot_numa use, but I could be
>>> wrong.
>> No, we are not ignoring the write permission bit. There is no way currently to
>> do that via folio_pte_batch. So the pte batch is either entirely writable or
>> entirely not.
> How are you enforcing that then? Surely folio_pte_batch() is the only thing
> looking at the individual PTEs? It's not guaranteed that just because the PTEs
> all belong to a single VMA that the permissions are all the same; you could have
> an RW private anon VMA which has been forked so all set to COW then individual
> PTEs have faulted and broken COW (as an example).

Yup I just replied in the other mail, I missed the pte_mkwrprotect() in folio_pte_batch().

>
>
>>>>                oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>> Even if I'm wrong about ignoring write bit being a bug, I don't think the docs
>>> for this function permit write bit to be different across the batch?
>>>
>>>>                ptent = pte_modify(oldpte, newprot);
>>>>    @@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                 * example, if a PTE is already dirty and no other
>>>>                 * COW or special handling is required.
>>>>                 */
>>>> -            if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>> -                !pte_write(ptent) &&
>>>> -                can_change_pte_writable(vma, addr, ptent))
>>>> -                ptent = pte_mkwrite(ptent, vma);
>>>> -
>>>> -            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>>> -            if (pte_needs_flush(oldpte, ptent))
>>>> -                tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>>> -            pages++;
>>>> +            set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>> +                    !pte_write(ptent);
>>>> +            if (set_write)
>>>> +                set_write = maybe_change_pte_writable(vma, addr, ptent, folio);
>>> Why not just:
>>>              set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>                      !pte_write(ptent) &&
>>>                      maybe_change_pte_writable(...);
>> set_write is an int, which is supposed to span {TRI_MAYBE, TRI_FALSE, TRI_TRUE},
>> whereas the RHS of this statement will always return a boolean.
>>
>> You proposed it like this in your diff; it took hours for my eyes to catch this : )
> Ahh good spot! I don't really love the tristate thing, but couldn't think of
> anything better. So I guess it should really be:
>
> 		set_write = ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> 			    !pte_write(ptent)) ? TRI_MAYBE : TRI_FALSE;
> 		if (set_write == TRI_MAYBE)
> 			set_write = maybe_change_pte_writable(...);
>
> That would make it a bit more obvious as to what is going on for the reader?

Nice!

>
> Thanks,
> Ryan
>
>>> ?
>>>
>>>> +
>>>> +            while (nr_ptes) {
>>>> +                if (set_write == TRI_MAYBE) {
>>>> +                    sub_nr_ptes = anon_exclusive_batch(folio,
>>>> +                        pgidx, nr_ptes, &sub_set_write);
>>>> +                } else {
>>>> +                    sub_nr_ptes = nr_ptes;
>>>> +                    sub_set_write = (set_write == TRI_TRUE);
>>>> +                }
>>>> +
>>>> +                if (sub_set_write)
>>>> +                    newpte = pte_mkwrite(ptent, vma);
>>>> +                else
>>>> +                    newpte = ptent;
>>>> +
>>>> +                modify_prot_commit_ptes(vma, addr, pte, oldpte,
>>>> +                            newpte, sub_nr_ptes);
>>>> +                if (pte_needs_flush(oldpte, newpte))
>>> What did we conclude with pte_needs_flush()? I thought there was an arch where
>>> it looked dodgy calling this for just the pte at the head of the batch?
>> Powerpc flushes if access bit transitions from set to unset. x86 does that
>> for both dirty and access. Both problems are solved by modify_prot_start_ptes()
>> which collects a/d bits, both in the generic implementation and the arm64
>> implementation.
>>
>>> Thanks,
>>> Ryan
>>>
>>>> +                    tlb_flush_pte_range(tlb, addr,
>>>> +                        sub_nr_ptes * PAGE_SIZE);
>>>> +
>>>> +                addr += sub_nr_ptes * PAGE_SIZE;
>>>> +                pte += sub_nr_ptes;
>>>> +                oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
>>>> +                ptent = pte_advance_pfn(ptent, sub_nr_ptes);
>>>> +                nr_ptes -= sub_nr_ptes;
>>>> +                pages += sub_nr_ptes;
>>>> +                pgidx += sub_nr_ptes;
>>>> +            }
>>>>            } else if (is_swap_pte(oldpte)) {
>>>>                swp_entry_t entry = pte_to_swp_entry(oldpte);
>>>>                pte_t newpte;

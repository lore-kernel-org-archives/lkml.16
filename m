Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF5522332A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898082; cv=fail; b=ccOCv3VE7dJ/8kpn9SO3Daxhu6Vuv78dvaSVb7eZWhGogZcYc/pVC4qfvH5IyDtrVPT+XZfe0Jhn6CbMrhjFapcqbRl5S3HssF8SVqEwPKvV8cHl9sZE8DQ5ufviwySOPfFhZWt02AYmODG9E4b7Zeea7Wzod7j1NJKjxFuIeWc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898082; c=relaxed/simple;
	bh=uaXiNdIpEM5Wo4XFTonGkdSjyA/cccFXrdE5CPtuk40=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KGJV4NpN0lOsqMvtlfnGg3EadUET3TpFSd4184Fju1OEyTps0kqzZ9NKqIEzLQ/HICuzyD5zbj0kx/MPTWQMCZBtLIHWIEzXm6K0V40alNqXuiohfa91aju4QYEFWqg1otT542KjMkc9HP/l9lSVyAK9qYGDEvsJjmWqiSjnQjM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZlYa0h+w; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZlYa0h+w; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZlYa0h+w";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZlYa0h+w"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HWrPJDLV4HOCzSzzkSArC6GbklY8dvhXOKnNvrJKw0GkK7Vms3P0GbIQROTpcWid5n65sQB8NxfzAq8sErBp/LcKuLVHaZdc6Gd8LcWCq0ORa02qQ2P1wLVAstME94UXVCY4OEhy9rLJaBoVeeUEk4jhH0BfqCsInItRNauTpNiKmhpxc5UDUQuDhkOBhvzEOzlYrrArCn5yOuZj41X9yFgJY34y7tRMY/w6Ft8120ecb3HSyTHg3e8CVzIaRPZrLnjEDdMg2dfCB5ZIeTCglRBaEhtjDu3rnIvZSaIqNSMRVZPnnGB/ya9dg0CfvBTyrcthUfpeUJlGgeOz2/ovwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hT8Gq2KTAsh6z5qm54vEe/mKO2DMQE+dUpxZVUlu7x0=;
 b=HvlrPd2uGyv8rMRjECKkMwOqkFfPgVaGtg10eUh79uWtAwbCiMlfhOSb4lMlnBlSd8MSR3NjVG08sNdolQrbUjTVhtgLI5tVLWsi77ZO1sxBG9jWxTmj6GcN5PG/2lYsRpWwBMrfPzzfc7j8hxv37xaM93uhrIcdHeflb6L7LKObi5lAnEtU++c5xrGFuOEjI43q4Mq0C/MK3fp7K+ER9yJyGXQaPeKazILgOw7nJGOuXOm0HxSXPLtKOxzbSl6jhagjtc/0VWty3Q6AaZx4mdwcxo2UgsKRrgKMQogetPNxm/WzJYP+qSUOtAIpvs6k1duoHVUfViTqgVI1a8Z7vg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hT8Gq2KTAsh6z5qm54vEe/mKO2DMQE+dUpxZVUlu7x0=;
 b=ZlYa0h+w5eGM4pPgvma/NcdvGXIkhC8eQptZi0+AyAhkMtu9a1MZaT3RFNz8ZlGTt3+Lyf+CR1//6JEF1EqwoBm+rfN8hTR1yPZFAq2uAB4Z1rifK3DXBrMalIX18Ztv3f0dOQpabMk/IyuF+Hb9c74+f5XR3xrNJOiJtH8xKR4=
Received: from AM7PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:20b:100::17)
 by DB9PR08MB7398.eurprd08.prod.outlook.com (2603:10a6:10:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 07:14:36 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:100:cafe::43) by AM7PR02CA0007.outlook.office365.com
 (2603:10a6:20b:100::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 07:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 07:14:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZcewp+fOhmqxV/1QbHA6lSMt+7zJyqoGZFfFNJkrlMn6mTrRzZ83ZaRL0yY9o3tabEWr14JDSsjupENPXcj9n34OZJjcUD0nqvodC0AFYGKaZ7T+JenAnAgB3rUoiq14gyzgegkJAgIqttaAlPwNcOsDS2P+NlQuvYn+s9EzRX2JKEnlXz6Wwk/Qwq4mo502Uc50so1GTn3uH5Ay8M4wxJbvrYxmyaa7sNywW9wzsuHL3BDKIBp927huZ8GN2nHBt0miQMFmI/Vpjir1XkYEpBkxuOq9+HI6bmoeYls1MBXkTVXtrH9EfDGAk8D/QAjprvzkOW5k28ClsTGEDK3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hT8Gq2KTAsh6z5qm54vEe/mKO2DMQE+dUpxZVUlu7x0=;
 b=bR3PGYRMbYIBm4RsgAaaWy7NYm+DSw3cWAvjZNodL7zLMem8my4u0aSm9RL+uvISzEK/x1JMauJC8HqrynK4iOWzvYqX3bHMirR/2tj581eO2qRAsCV0q8PWyo5B4OaAqVajkIBbSptDZTEu1fBUihrFUkxbxG1MNVp6vDq8KJGjmcrsZaZmLPdiCQWCvmc2HgppLv6dXre0azVRm84mND623icVnJlBCNAshhxUHTmiPhoBls1mevrebxDxl50wIni/cKJy5WWlILCGF0MggejZrrJ4GZUJQEoHsXZF34Fw6ajRNoTlobIGLhK5wSEuZCyL09+UGVjIavdbyuzlOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hT8Gq2KTAsh6z5qm54vEe/mKO2DMQE+dUpxZVUlu7x0=;
 b=ZlYa0h+w5eGM4pPgvma/NcdvGXIkhC8eQptZi0+AyAhkMtu9a1MZaT3RFNz8ZlGTt3+Lyf+CR1//6JEF1EqwoBm+rfN8hTR1yPZFAq2uAB4Z1rifK3DXBrMalIX18Ztv3f0dOQpabMk/IyuF+Hb9c74+f5XR3xrNJOiJtH8xKR4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB8480.eurprd08.prod.outlook.com (2603:10a6:20b:55e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 07:14:02 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:14:02 +0000
Message-ID: <2af931a4-00ec-4e72-8f3e-058d71b04d84@arm.com>
Date: Thu, 22 May 2025 12:43:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: Add batched version of
 ptep_modify_prot_start
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
 <20250519074824.42909-5-dev.jain@arm.com>
 <eb57601d-abac-492a-8e62-dc1c406af572@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <eb57601d-abac-492a-8e62-dc1c406af572@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB8480:EE_|AM3PEPF00009B9D:EE_|DB9PR08MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: cde3bf58-1f84-45bb-503b-08dd99004e23
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d1FRUkF5Ry9JODBnM1VnZ0tZWFVsckJtSWtVVDF4aklZZTVTR2EwZEhLMnlM?=
 =?utf-8?B?SlJJcDg0eFZNZjZmcGtSWmR5TDY0U3lLVmtKOGNhOHpFSDE1NFg2K3NTNXdk?=
 =?utf-8?B?VFduM3dhejBHaHQwRytlZ010ZXhtangwYTVtem1rV2JXeXBoMmtVbWJiVlBB?=
 =?utf-8?B?dCtOWmlvYVUzZXVhcXovdFZIcVdyVkdVZnMvcXVDUDlNOU9RV2JONXU1ajB2?=
 =?utf-8?B?TlZOWDhtWkVHK1Mvc3dBOEFXRjFldUhDTTQ3VlRBdnpPUysyRlZkVDB3Wlc4?=
 =?utf-8?B?cTEvUmFJMEtzQkh6NFNwK1prUmc1RmlPSEFZT3JBSlRiU2ZlU2NmZk9aQkhV?=
 =?utf-8?B?MzQ2c1ZpYkd6Z2ZmdE5saGVkMHo3US9VQnQwODgwREgzd0dobVlpMHk1eVVU?=
 =?utf-8?B?V2REYytpczdUZTdGcjJ4bWxxb3RaUUJnT3pQRGFxa21leEZMeHRja0s4ak8z?=
 =?utf-8?B?QTJ4Y01qdXBreldOZEg1cnNCSG5uVWNHZkJlbUd3SFRqRjR1cWJRbkxxaEVW?=
 =?utf-8?B?d29sWlNRN2FlTWI4WGRXdmI1Qis2QlVnanJjemFmRUs1ekppenFtMjFpV001?=
 =?utf-8?B?eGJRNDlVVmJzYnFET1AzWWo2c3VhMHpXRkxoSXFxeHNIL1VzU0dmN29RM1g3?=
 =?utf-8?B?eS9uekVWZVA4QWtHeVhvVFRuSnpCRkh0c3hjK0dtZityV0xmMzh0d3pIb3Fp?=
 =?utf-8?B?MDBHY2VlYXhSRXlqV2hCYUJJWGJ5Sy8wVjJjaTU1OTJHSmEySWdiWmlPMTMz?=
 =?utf-8?B?MUI1Z1NJdEMxcUlnMXpMRzlMZjhXeXhTTE84dG9YdWRKK3RjTDk3cDZDTlhs?=
 =?utf-8?B?MHRGREdTWmpTdjk4dFNianZ3NUpBSmRUT2RncmNidE13NDE0dDN2eFFnZjli?=
 =?utf-8?B?NXdia2pMeXdLSFdGYXIxNkwzbUttYlZuRFh6dkpFOEs1dXJBamJJTDRnM3hr?=
 =?utf-8?B?bmFxQ3hJL09TWDJzMnYrUWN6SnBiQk50Wm44V1lIYmh1U0hXb2hnZUQ1eXBt?=
 =?utf-8?B?bE9kZzI0RExlL1hzeTRzV1piSjV3SEtOb2ZhWXVhNnVaRmQ2MGY5aTUzWDFr?=
 =?utf-8?B?VHZXUTFoMEtaaW9NbHEzWFVYYkNFK1lYc3dGRDdPL2wzY25wUzhVRVdLM3pQ?=
 =?utf-8?B?aXY2WGdVOHVrWUtwM3E1ZWl3cG9sMm5DVWg2K1pkS2NQdnFHODN6ZmY5OU5Z?=
 =?utf-8?B?Uzl4TmVuRU1IL1FvdVVaTldNcWc2bi9DYnlWOW81TC9WZzFrdmdzVnNieXk5?=
 =?utf-8?B?VDF6a0JBTkY5ejUxc1UyTFUzRTl2b1A5YlpZMk9Ya2RXemlGOTkrY05Bb25k?=
 =?utf-8?B?QzBpTENUZXNLYlhPdEJ3UmM3U2pXNWhjWks2TW5BUGZBTEp0YjNFS0pMelNk?=
 =?utf-8?B?RDlyT05jZXIxMSs1UGwxVE5NdGtFT1pCaGVxM1hGRzVCclNUanY0ZFUvc0ZN?=
 =?utf-8?B?TDFFbEVxbkphQjNXUkRDbHluSWJHUFZsSk9NalRSVjVnVnIzUlV5Y1pjUTla?=
 =?utf-8?B?V2Ywcjg3eWVUWjhHRG5UNXBHNW5aNzZhZS9BTXVGalJJcjVYVFhlci9qZWtx?=
 =?utf-8?B?alQvVHVWMlZkcFZ3bzEvWFlPN3FBUTk3K0xXdjcrREIxd0I3QkNmanFPM3F2?=
 =?utf-8?B?a1R2NDNSSUo0UUl3Z3EvNFdGTXlVK3VLbUQ1VHZodWttL281cmliaEc1RzAx?=
 =?utf-8?B?eDJ4S21sVjBKN2lhcU1naGZpVnF6STdmSmZac3pkcDh1dmVscXY3VVRWcWpy?=
 =?utf-8?B?OTRIcjVNbmRpOEZORTFzM1gwR0hoTlZGc3hZSHJwMFBCVGM4bkpGOEVsTHRi?=
 =?utf-8?B?RFhUU0ZlcFV5SzVuM2x2STZJL0FKOS82Ykk5c3BVVThzMGxrRlIxS0xQazZP?=
 =?utf-8?B?YTZ2NXlOS0N4Umx1VmE2bGw1V2FwMGF4R0gyM0g3akJVbmc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8480
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a451e62-f4cb-43a4-e734-08dd99003a8f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|14060799003|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXFPdWwyYmtJdGptVjhUQXFPRDBqVzVEVjV6U3N6dnhXU1liaGs0enF0WFRL?=
 =?utf-8?B?d0tYZS9vRlEwZzc5OFJoN0E2RjZYNVU3Z2FjVHZURXVCUDJPT0t0Wm1HTVN3?=
 =?utf-8?B?dWhQZTducU4rOWZUOUdqdkxwRGhZYWg0RUE1aU0vZlZIY2dCK0k4bkZVQVRs?=
 =?utf-8?B?QjVLeVhmdW8xVE1nYjVIa0NGSFZ0NDZlMEQ4MzNFdmRndWdCbGt0aENYRm5O?=
 =?utf-8?B?UmJEalp2THVHcWs4aXZONUJYYjMrZ0lnOFV4dFgrT0h1REpWUnhXd0JlcEVG?=
 =?utf-8?B?T0tqQTlZVklPeERpWHBtNnpLNGl5Vk94N05xSFpQQ0h4Vk5tS25CNWVzNFBC?=
 =?utf-8?B?alJFT1p3Qlc2RlhWcnJocEU2RHo1MjA0UzFvY1lCaFJXVUZlRkVVbUpURm1x?=
 =?utf-8?B?TldudDNOTzJ4cHcvNXgxVzRHYWxmb0pucUQ0NUQ1UHlFS3pEaEZIZ3Jsd1dw?=
 =?utf-8?B?UktDV2FOdW5abFJPQUxzMmFrUHVUNmJsaVZWakxXL2FIbWsyU3F5cGV0Qzgr?=
 =?utf-8?B?czZzd1Z2b2h2S3FUb0hMNkthRkdoU2RMbGNnVjlBKzQzYzVMMFNNb0tEaFpz?=
 =?utf-8?B?bUZxdVR2N1VoQUNXYjdNSFFXV1BoQWNTVmhORGJkS0RUUjV5cmgyTlVFVDBF?=
 =?utf-8?B?TjVDK0UxMjl3cWlUdFA1ckVzN1E1aGRXTUZ5MDNpVDlEbk9TTU5VeHNtdDN5?=
 =?utf-8?B?dUdOS2U5UURNbDdxUkRVRzJmaVEzcXlodXhnY2pzZys2RUhNY3UxTHM0MzJy?=
 =?utf-8?B?S2JsT2FuRjA2SXkwQi9LQ21OS09VNFR6ZWFqdk9KdEFpTFN1VWROY1BXUWV4?=
 =?utf-8?B?RWVCWWNaR3dQSkRMaU0reVhDak9WbWw2ZjRYaFljbmhvVU1vR242aWd2bEtv?=
 =?utf-8?B?Y3QrUWFFRG1kN2U5QWkrb0pWKy9kZkhPSncxeFZ4Z2JJK3FTRXU5Q2JCYVhV?=
 =?utf-8?B?ZHg4QndLT2JGNk5IMEx1YmNmV3VSc29PWEUxYlNSbEdyRitYVDNycHk4N2Vu?=
 =?utf-8?B?THNoeVlhSUpaRmdsZGt3NEtvYVY3NThzZVhySDllYy9jeFBqdUxTL2pNZ1J3?=
 =?utf-8?B?TFdjV3AxbG5udmh0bklWQk1UaE1iNmZFa3l3eWxqKzNCQVRvb3pnUUZndTR1?=
 =?utf-8?B?T0pIWjdMVzcvMEVEQ25oWERoclZyMUtBRjl3MG1VVUlmU3plVFkzOTRtY2Yv?=
 =?utf-8?B?UUs5bFlFMXQyUFlvNHVvWW95WmFiYkFoNXJwamgwcFJ5MHlvaGtTOXg3bDlw?=
 =?utf-8?B?L0Rncjg2MmFuNFZSaGNKSnBET3N1aXMxL2xtRVJURkd3OWFMSjE2cTRIZytq?=
 =?utf-8?B?bjF1STBiS1F1TEk4YmZ1d1BoQk5XTUpCMUJTNGpsOTlJTU5zdmFDMndQWnNu?=
 =?utf-8?B?Q0c4M3M4VDlnN0QzMEFZeWNCbjY4cCtSUjNpM2RweFU0TmloR1I2QzQ5dmd0?=
 =?utf-8?B?a3JIOExnRHNKdVI0MFZ4ZzIxaGJjeExMOVV6T1ZiTGFibVMxcURMakpqV0Zq?=
 =?utf-8?B?NGxBeHlpc0RMdlRsMUlxRkhEOGhqamI0RnNGZnRNTk5Za0RNU3BSSXlwYUpS?=
 =?utf-8?B?clZLcVRtaDR4c1pISURtbVU4N2hzclg4K2lXZzhXWkh3SzU0Q3NCS09hM1RD?=
 =?utf-8?B?R3hJSlN3THRKeFo5Z0NIZDQwS1ZxTjR0Rm1odFY4dTRHc1hOZzBJdTN6Wk4x?=
 =?utf-8?B?TjZ0L3pEbzdlWkozenhUZTJSVGIzV1cxQUhZSENiVGZUTUFsdVV2TkxKWU1v?=
 =?utf-8?B?ZnJFZ3psaDFDb1NFRWcwVFJqYytvUDJDOFdkU29VT0JiUVp6a242UmZrTkc0?=
 =?utf-8?B?TzdmakNLQVR3emtadjhrTC9jREYvYUs2R0c4a3dJRnRYVFlYYzBMZ3ZpL0Jl?=
 =?utf-8?B?RFdGTDFpa081L0F2cFNiK0xsM25ZeWx5dEVQb2hkSkFrL2k1K2puUmRLMm5n?=
 =?utf-8?B?VTNmclM0cWdxaitzZGxsMUJua0FzUlpPaVRTOGVCVUZiYnFGWmt0c0E5RGNM?=
 =?utf-8?B?bis4QVlXS2hCbzdPbkRiRUpwWVZBTnZkcWlFUWJGeWZqYXN0SGlzUUxJdVpj?=
 =?utf-8?Q?5Wv6X3?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(14060799003)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:14:34.5463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde3bf58-1f84-45bb-503b-08dd99004e23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7398


On 21/05/25 7:44 pm, Ryan Roberts wrote:
> On 19/05/2025 08:48, Dev Jain wrote:
>> Override the generic definition to use get_and_clear_full_ptes(). This helper
>> does a TLBI only for the starting and ending contpte block of the range, whereas
>> the current implementation will call ptep_get_and_clear() for every contpte block,
>> thus doing a TLBI on every contpte block. Therefore, we have a performance win.
>> The arm64 definition of pte_accessible() allows us to batch around it in clear_flush_ptes():
>> #define pte_accessible(mm, pte)	\
>> 	(mm_tlb_flush_pending(mm) ? pte_present(pte) : pte_valid(pte))
>>
>> All ptes are obviously present in the folio batch, and they are also valid.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Please squash this with the
>
>> ---
>>   arch/arm64/include/asm/pgtable.h |  5 +++++
>>   arch/arm64/mm/mmu.c              | 12 +++++++++---
>>   include/linux/pgtable.h          |  4 ++++
>>   mm/pgtable-generic.c             | 16 +++++++++++-----
>>   4 files changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 2a77f11b78d5..8872ea5f0642 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1553,6 +1553,11 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>   				    unsigned long addr, pte_t *ptep,
>>   				    pte_t old_pte, pte_t new_pte);
>>   
>> +#define modify_prot_start_ptes modify_prot_start_ptes
>> +extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +				    unsigned long addr, pte_t *ptep,
>> +				    unsigned int nr);
>> +
>>   #ifdef CONFIG_ARM64_CONTPTE
>>   
>>   /*
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8fcf59ba39db..fe60be8774f4 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1523,7 +1523,8 @@ static int __init prevent_bootmem_remove_init(void)
>>   early_initcall(prevent_bootmem_remove_init);
>>   #endif
>>   
>> -pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>> +pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t *ptep, unsigned int nr)
>>   {
>>   	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
>>   		/*
>> @@ -1532,9 +1533,14 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
>>   		 * in cases where cpu is affected with errata #2645198.
>>   		 */
>>   		if (pte_user_exec(ptep_get(ptep)))
>> -			return ptep_clear_flush(vma, addr, ptep);
>> +			return clear_flush_ptes(vma, addr, ptep, nr);
>>   	}
>> -	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
>> +	return get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
>> +}
> I think we can do this more precisely with respect to tlbis and also without
> needing to create a new clear_flush_ptes() helper:
>
>
> pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
> 			     pte_t *ptep, unsigned int nr)
> {
> 	pte_t pte = get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
>
> 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
> 		/*
> 		 * Break-before-make (BBM) is required for all user space mappings
> 		 * when the permission changes from executable to non-executable
> 		 * in cases where cpu is affected with errata #2645198.
> 		 */
> 		if (pte_accessible(vma->vm_mm, pte) && pte_user_exec(pte))
> 			__flush_tlb_range(vma, addr, nr * PAGE_SIZE,
> 					  PAGE_SIZE, true, 3);
> 	}
>
> 	return pte;
> }
>
>
>> +
>> +pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>> +{
>> +	return modify_prot_start_ptes(vma, addr, ptep, 1);
>>   }
>>   
>>   void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index e40ed57e034d..41f4a8de5c28 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -828,6 +828,10 @@ extern pte_t ptep_clear_flush(struct vm_area_struct *vma,
>>   			      pte_t *ptep);
>>   #endif
>>   
>> +extern pte_t clear_flush_ptes(struct vm_area_struct *vma,
>> +			      unsigned long address,
>> +			      pte_t *ptep, unsigned int nr);
>> +
>>   #ifndef __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
>>   extern pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma,
>>   			      unsigned long address,
>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>> index 5a882f2b10f9..e238f88c3cac 100644
>> --- a/mm/pgtable-generic.c
>> +++ b/mm/pgtable-generic.c
>> @@ -90,17 +90,23 @@ int ptep_clear_flush_young(struct vm_area_struct *vma,
>>   }
>>   #endif
>>   
>> -#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
>> -pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
>> -		       pte_t *ptep)
>> +pte_t clear_flush_ptes(struct vm_area_struct *vma, unsigned long address,
>> +		       pte_t *ptep, unsigned int nr)
>>   {
>>   	struct mm_struct *mm = (vma)->vm_mm;
>>   	pte_t pte;
>> -	pte = ptep_get_and_clear(mm, address, ptep);
>> +	pte = get_and_clear_full_ptes(mm, address, ptep, nr, 0);
>>   	if (pte_accessible(mm, pte))
>> -		flush_tlb_page(vma, address);
>> +		flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
>>   	return pte;
>>   }
> Let's not create a new generic helper if only arm64 is using it. We would
> also want to add a doc header to describe this helper. My proposal avoids
> this.


This is better, thanks!


>
> Thanks,
> Ryan
>
>> +
>> +#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
>> +pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
>> +		       pte_t *ptep)
>> +{
>> +	return clear_flush_ptes(vma, address, ptep, 1);
>> +}
>>   #endif
>>   
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>

Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8ED148832
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751395749; cv=fail; b=X5fzUypeRQ9c4/meVllHYEvtmOiIH3cuDaXLQfbpKgxaiv6tLP+juTt501dy7RZ9+HrfiMy+yRegA3PkLGQclxUcp8+8RCO2B82VE/M5nczE+sgkiKFNYHjCIuwhpEn7AFvNYRXE+UxOtuWuas3dpe1q8sq8bJDeciAWLNLKI+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751395749; c=relaxed/simple;
	bh=m5pFHVLIlvu5JwFYMFOs7h0vS5OeWP2tYAkFWTZATco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nu0a2uUgZgH+JHD4oF7Du1hi0eIabozmyWNbO7LTcuLZf2a1KQttSBxGHS9yIKyh4swcjJiv1lFFgciOK5arBxANiQz9KXSs5wfUujeQ/7rIi3Zm1U5ShMcipAF2HJBYdugbqF+mAP7Kkqm2YWtlMypTf28wddM6r85vH0BE1Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JF4SY2Jg; arc=fail smtp.client-ip=40.107.223.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JF4SY2Jg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGNbXmLJVVxuHXTykwqJzGFIf1zSM6wQ2T+HjUk0mh1RVc6D7AQxhxvJ0XvJNqXn6yjIQ/TTE1lq6fox0a2tQX/wTakDucOseQgfu0sNaSrspj7YCNiLKq7kcqW/dKuuE+47or4FLOxPGKiOR3vB3fdsRBxcmGctnlI7ujz4ZMtbyFkCXMyynlUslryeUQTqPLukMaDvEYe7ScEHNtYJfSCLgttk7lkFJrWl+hwGO2rSAdpEpB0xGKZPSXOxx+WTRZxqetpZEAiXtVsvviLygGpnxZElOUpa4IWiHoSa+LXxik8c3rgIwVwu7b9WyoRB0MuJQltNpuYunwd+zXSMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5pFHVLIlvu5JwFYMFOs7h0vS5OeWP2tYAkFWTZATco=;
 b=j6K3k/zXlxNMucM6hvnZ9aotSar5WBXcWw3d/v6Nd/+a5AlQ9P4yiM18gPBHEGHgjEswNIskqIowkkFLC5McJCISq1VcSMdiIo+2dYKX6zSvzAF2JowF80slASjI9831Iki7XuFfYqSwhHM2VZxT7pyNzXmYg4h2xhD+UEpCLnPkxAnUem0xKnP8xB4awOLE2P8dtmXvthVyHx0VzIX+I+f+HCL6tqqDSlncXGRa2hHGFVGi3Q5OnWdQL1uLr4SfiabNRI1g6fLm3XI8/6PFtNci41KQ+sjU3kNcE2XW5+eq2j5BKRdhL5iBzBY6lUQyzU7HUtbkRgLLW2iMU9cZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5pFHVLIlvu5JwFYMFOs7h0vS5OeWP2tYAkFWTZATco=;
 b=JF4SY2JgmYE0OqvMCkGNxrC6jzrjn6U+AbrWjibl2NoUtchj2a5uhf8xMYn/BEjWUONdUPSzjfEUI7/W9t09W6dKZAJ5bbJ+dYblem6oUN6qp/b0eVH+/KV9i4v+kyJQUP+43RxYcDp2hT55BnC/Gc/f2GI7ZzB30BIjVT5DowQrrRGniB4FEcgHKw3xDZaJge9BNkhQ/mV6Go+WdYaBmJ1qyW7d1yvi2ZUcsRaxdjc2X9ghfxqQSyIn1tbmllApnRlgqFuS1cI7U4Sr+m8Us0LhSn25JlwhPLTh03FgsOMeI0zwdgRiOfbP8duN/celmEjPt/vVJULOf7zmOdjAQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB7502.namprd12.prod.outlook.com (2603:10b6:8:112::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.19; Tue, 1 Jul 2025 18:49:05 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 18:49:05 +0000
From: Zi Yan <ziy@nvidia.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, siddhartha@kenip.in,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, mgorman@suse.de
Subject: Re: [PATCH] mm: limit THP alignment =?utf-8?q?=E2=80=93?= performance
 gain observed in AI inference workloads
Date: Tue, 01 Jul 2025 14:49:01 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <5D015E99-474A-4D98-8C43-488A46BEB2F5@nvidia.com>
In-Reply-To: <6eaaa2e4-9067-47bc-8dd4-d8ef56c26b3b@arm.com>
References: <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
 <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
 <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
 <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
 <5c3d307f-d303-48c3-b730-99a83d4815ec@lucifer.local>
 <6eaaa2e4-9067-47bc-8dd4-d8ef56c26b3b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL6PEPF00013E05.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:4) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 59631bd7-9bbf-4f71-d739-08ddb8cff3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1dwZktuSGhad3FzTUJBK0h3WUNTazlzM0VZYUdsbkhxNkdXL1doZmVRWHAy?=
 =?utf-8?B?eG5iV0pNUHZCb3dnREhIQUFTZkJMdXJOVzF1Si85Qk9TelNKS1BxMFl4Z092?=
 =?utf-8?B?QUh0dUovaEdTcWtLMjc3dXdpc1lBeGd3SEFQZmRMQWsycE5KVDcyRmFpcitR?=
 =?utf-8?B?bUlYYTg4V1NLUC9wSjF4S0VSYklJMWdpbzVFdW1OWnFwQ3lYbGltdG91UXJM?=
 =?utf-8?B?c0JsVTRYQ2YxN3o5TlU5blZNU0k1dnpjd2JmdTBxOENlSWplcXkweXptM3Vt?=
 =?utf-8?B?L002dkEzNFhhT3IvL05HVE13eEdZZVFCVHV6OU5NRTZGeHY5MmUvSlR3TmV0?=
 =?utf-8?B?czlCbWJjMUgremJVRkhydityK1BqNll4RzhpdEs2Z2s1L255bDFHY0pBcXRT?=
 =?utf-8?B?Q1loZVduZHdwVkNrSUE3L3VTSSt1a0dYckVybUpyeUR5Wm9JT29ieGVhSElU?=
 =?utf-8?B?aC9WY3UzY05JMkFNY2hrZzZTS255NHlxVG82aXdQb3padUlibTM3M0laSjNU?=
 =?utf-8?B?aWxvczdUTi9sY3REZDIxYnFnU1hFbFBpbkFBbENDSENzY0NBRlV0Mm45bDQr?=
 =?utf-8?B?N3lhT21FSCs1WllFSmpGR2wxeWRLWlFJM1ZubGViZzEvOFN4bnVhZ2FjdFBZ?=
 =?utf-8?B?TTJyU2VOcDFCcWpqcklMSmxnbktPeGMwYVliVzdhVUtCeVhBUWhUV3RQRk1k?=
 =?utf-8?B?aWN3NnZFVjYwYTdPMm1RRUdlMWRkTSsxN3hjd2xPVlhhSStHZWtzdDNYbk9T?=
 =?utf-8?B?bXFzUitMVVBNM3BHL0N4OEdCaC9PM2I5NldhY0hEaDJzbFh5eW1nc3NiV1dK?=
 =?utf-8?B?SS9KM2IrZUdtenhPVUE3VnE1Q0ZnVGZJSDFjUTE1Y1phTFlzOVh5dHpIWDVM?=
 =?utf-8?B?N3BCcThnUXRySmY4ZjMyY3BlY2gyK1hoVmFtT2FDdFB0TXhxK0RNUFhWay9z?=
 =?utf-8?B?b2VKaitLUll0RExZc1V1Y0YvU3FwNzJJeUNUOTJJbElqaG55dW1CUVBVOWVw?=
 =?utf-8?B?UHgyWGZZNFBGKzFzQ2hza3RqOEt5dnV0NklQRzhnczlMQVJjQ2RjKzd5c05j?=
 =?utf-8?B?b3BudVlvQjdhVUJiNk1EQU5BZWhsRHY1RlVUNGxFYXRlaUo4MFk0alFIczdt?=
 =?utf-8?B?eTRpQXc0N0txVFJkQkZ1ZXpBdlFRSyswdk01elA0SjdiZmpKQVhJSUlIT2xu?=
 =?utf-8?B?OGVtSEpmWlNLR2JuSW1IWjF5WmpLeFRrc1VpVm5DSjVTSXBRSGx0a3NNUzRL?=
 =?utf-8?B?OVljWWttRVNWendIb3lnUy9pUDBtVTdMQ1RCUk9uY254eUJPcGNMenh3Y3l1?=
 =?utf-8?B?MCtjSzg4a094enBab212dm8zRlpHWmFFdjNMTWk3MTc3YWFmNDBwU2RXMTJ2?=
 =?utf-8?B?aXRpVVBuc3hGOEpEN0ljQVhodEhLaGZTS0FkWEMwTEpSckRkaFdaamM1UEk1?=
 =?utf-8?B?dXlTS1JGUlIzbVhGbXBSZ0kyZkZWQlV3ZGR3S0o4NXNjL2p4dlVhb3R5b0l2?=
 =?utf-8?B?RTFjZmJ1YzdEWFphZEp4WVFPenc4ckh3cVN5TEZpMFFGUXBjaGsySzRsZm9V?=
 =?utf-8?B?SFZyM2haVU9RWmpVZzlabGRiRy94azIzRk45NWR5OFVaZ0k0SzhqcXNaNTRJ?=
 =?utf-8?B?RWtzQTl4QTVZbjRxY2hhL2QzWHJQS0hOeWZ6WkdPSWxGQjlyemNabnZDZXZZ?=
 =?utf-8?B?WEgwdFR6dGZ0U1JtYWh0bHFUZTJVbW8wN0NXV2VybWVPa3lWZ081cm9KTFR4?=
 =?utf-8?B?UVR0RWl5K0hUU2UwZlMrdmliZ3BpVDFZSERGVktSem0yL29qSmt2VUdCY0Ja?=
 =?utf-8?B?enlyUGJCQlU2VVc4dkVLV096OEdCZ3NHUVZHVnB6SW9qaXhrVkwvMlZzMDZR?=
 =?utf-8?B?QVR2cmdQT0hXSzREOGw4VGkrS29YSnEzWi9FV2svMHpQNmMrM2MzWjJMZHF1?=
 =?utf-8?Q?tSiZukH1li4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRocENUdkxvR0VUekUyRTZYQm1GZXRWNkxJOFB1WDFNY1FvemE4VS9LVUJP?=
 =?utf-8?B?SzhIRlIxVFNxRnFBNDdFQXNCblNFaEEwa09SWXB3RWhEaCtOZDR0dUxDcHpk?=
 =?utf-8?B?YlpHRGc1TGpsMmlyNE81OU1Wa3BGY1FVZ0VheWpwR3NnVGkvZ1ZwRnM2U0ZZ?=
 =?utf-8?B?a2pvY1NQZjV1TnZhSUhTQ0dsWkR4N2VVRnhWY05zb1NDTENWOHEwMUxJekd3?=
 =?utf-8?B?OFhsTVNieXFua09Dd0NHNDhycDd1dksrVS9PRUFIYlNiekYzc2tmSDVhZ2Fp?=
 =?utf-8?B?cGNsY09CeUR1QXhGOHZPYXNiWEhrQjNCUFZGdWFkbnZwLzU4cVJFMmhlVTMr?=
 =?utf-8?B?eUVFQ2kzclp4MXVKMGVZWjdVM2QvRzZ6NGJCOE1SREtoTW0zd3FQbERUc2cz?=
 =?utf-8?B?bU5tTlVBV3p1MkRuWGtUb2RPLzEzRXFQUWxYUXk5WWR4L0QybnZTZGpoYmFX?=
 =?utf-8?B?T1J6Mkd6TnlnUTNJWTErdExwSGZjakpRZ3c3TXFVUjhkaXNsQ2JKQzdlc2ZD?=
 =?utf-8?B?c1c3eit6ZjhnS1hCaGVSSG5VcXJmSCt5SlYvN0RxdjI1TEQrQ3dWYkp3OTJX?=
 =?utf-8?B?ODh5RTg3N05Oc2pDaW42bHhyTEszZTBBQ1ZYU1BXK0txSVBXREtHOU5vSFZZ?=
 =?utf-8?B?cFFHMTJZR25BbmQ2ZW5QVllkbEx3ZXlMMUN4SGxsZWl1c0VWRmVQeStBalFm?=
 =?utf-8?B?ekdBZDNIeHByTmVjcDAzUmxwWm9GN1BFUEROZlozYzhidnA3eWFlNUFEOVc4?=
 =?utf-8?B?djJHM1RrblBFN2Y3WGNKWmFpOExHaHoyYWJ2RlRFczU2eTV2eGlENnhLQmh6?=
 =?utf-8?B?ZTZVaFVaODZLRU5sTC9LdWRmQ2d5VzBDU0FXMWorcGphRFF6VXQyQ3I5cFJT?=
 =?utf-8?B?K0tlVG8rTUdJUW5YYjRoa3d4a3hKQUx2VnQ4MFhEZDh6WTdRQURDNDBNU1JW?=
 =?utf-8?B?VERwd3BMclhXOEJWQm5KSFV4SGVtTXhOUFhTTFhqVUZkZHplZm5UQkZsUDRl?=
 =?utf-8?B?ak02TlBraXBBV3pLUEpZUC9JVklDNHdPak4xdFJzbmhnaWtrN2FraHNNcjVi?=
 =?utf-8?B?VkZMREk3dERZZEZLN3NucCtpcXA2dkx5YTU3b01RZlRBazU4eWdWT0lQWmd2?=
 =?utf-8?B?Z21BSWRVWGhQVmtHaUdPRFFoeVhuaHJiczlPRmRDakVCZ0xWeG9vVE9BSW9o?=
 =?utf-8?B?clpZSUhEb0o2d0loaTBISVN4b1liNCtjQ0xQQUZMeWlEZ3JCbGlDVElPSkhX?=
 =?utf-8?B?K2I3NEZ1NkVHMWJFQWZlY3FoRU1veXBWM0MreVV0TlkzYUZhWGVoeTJTVlVK?=
 =?utf-8?B?andtelgvTGNqL0E1YnNJYnBBZnNqeG5kd0xRUjFXUXdtRmRQZ2ZaZG9ZYXVC?=
 =?utf-8?B?S2hJY1I3ajVuMFRhRGEwV05TTFZSK3RuMkZITVF6Q3VwMkxtbWswejVIVzJ0?=
 =?utf-8?B?L3lhQWNWNjVVdW1HY0xjbWwyM0E5b0svZHpvaGQxOTVqZURuN3U0cTNiTDFT?=
 =?utf-8?B?Q2VKSGZXT0JEQjVuQTNtMFYvZjljY1EyRzN5dlBFN1lRMUtFaVNTQU05WDhF?=
 =?utf-8?B?YWE5d0toTWczd2I3RXVHNUpXRm9zQ2htRnBzK0hBdWVHT092RHk2YXRiSmFh?=
 =?utf-8?B?R2ErKzVodnRLNUQ4K1RXNGwxU21SR0JXSStuU2lDU0hjNGExWmp3Z3JwOTUx?=
 =?utf-8?B?dUZBbEgwNGx1MWFRVVlBcVJKempxM0loWEY2NDF4bG5SZWt6ZVg2SjdwTHNa?=
 =?utf-8?B?SW5sY1pQTkg4Zms3aFR5RUNpZ2JXSnpveldiYXlEQnAzVDErUmxuc0FFdjZt?=
 =?utf-8?B?OEJvWTdjNFlRdmlVUmk5T0JDc1U0TUdLdk9oams0am9DMGxxRDVXYlBRQ1dG?=
 =?utf-8?B?Y29teFc4SzU4VlE3aG96ODVRZ2RUOTlMVVRsc0w3U2ExMHhaZ0ttZkFXakpT?=
 =?utf-8?B?cEdWWTVtRUZUN2ZGbUhjb0N6Q3Y3WTNremkyc2gwTnZHd284VyttRStzZUdq?=
 =?utf-8?B?ZVFyZ291NG1GNlZrdnRWMVFvY0w5bkEwaHBoYXVJejBZbzhwQnJwV2dJNlRG?=
 =?utf-8?B?NFpTL2ZBM2Y5allaMXkxWGNtK3lQSWh4NnJyS3N0eDZnMHNTWWR1aWRXd0xJ?=
 =?utf-8?Q?+CR7HCyBuEgZffGcnLK3Q2cC0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59631bd7-9bbf-4f71-d739-08ddb8cff3f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 18:49:05.1036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7Xw2YYBPaZEpZ2UCrfWifWDq2mlO7Tcws36g251nB4Cp6I+iqga8usztAp8oYQv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7502

On 1 Jul 2025, at 12:20, Dev Jain wrote:

> On 01/07/25 6:09 pm, Lorenzo Stoakes wrote:
>> On Tue, Jul 01, 2025 at 05:45:51PM +0530, siddhartha@kenip.in wrote:
>>> 🧩 1. Does the patch cause VMAs to be merged eventually?
>>> You're correct: VMA merging only happens at mmap() time (via
>>> __mmap_region()). What the patch affects is the behavior of
>>> thp_get_unmapped_area_vmflags() before the mmap is placed.
>> [...]
>>
>>> 📐 2. Why aren’t the VMAs mergeable before the patch?
>>> Great question. Even if the VMA flags are identical, gaps introduced by
>>> forced alignment from get_unmapped_area() break the precondition for
>>> merging:
>> [...]
>>
>>> 💡 4. Why this patch complements Rik’s rather than contradicts it:
>> I'm really perplexed as to why you felt the need to (seemingly via LLM)
>> reply with the explanation I've already provided here?...
>>
>> There's errors in things you say here too.
>>
>> With respect, please don't do this.
>>
>> (I'm the co-maintainer of pretty much all the relevant code here and wrote
>> the VMA merge logic you're referring to.)
>>
>>> 🤖 3. How does this impact AI workloads like Hugging Face Transformers?
>>> Tokenization and dynamic batching create non-deterministic memory allocation
>>> patterns:
>>>
>>> Models like BERT and T5 dynamically allocate intermediate buffers per
>>> token-length, batch size, and attention window.
>>>
>>> Hugging Face + ONNX Runtime uses multiple small-ish anonymous mmap()s, often
>>> 512KB–1.8MB.
>>>
>>> These allocations come in bursts — but due to forced alignment, the kernel
>>> was placing them with artificial gaps, defeating THP eligibility entirely.
>>>
>>> By not force-aligning non-PMD-sized mappings, we avoid injecting gaps. The
>>> result is that:
>>>
>>> a. VMAs remain adjacent → mergeable
>>>
>>> b. Physical memory is contiguous → eligible for khugepaged collapse
>>>
>>> c. THP utilization increases → fewer TLB misses → lower latency → higher
>>> throughput
>>>
>> This is very useful information and it's appreciated! Let's not drown this
>> out with restatements of stuff already covered.
>>
>>> ⚙️ 5. mTHP note
>>> Although this patch doesn’t target mTHP directly, I believe a similar logic
>>> tweak could apply there too — especially with shmem-backed workloads (common
>>> in model servers using shared tensor memory). I’d be happy to help test any
>>> changes proposed there to derive the consequent results.
>> Dev - could we hold off on any effort to do something like this until I've
>> had a chance to refactor THP somewhat? This is already a mess and I'd like
>> to avoid us piling on more complexity.
>>
>> We can revisit this at a later stage.
>
> Yes of course. I had run a small benchmark on a quick dumb patch I wrote and I
> don't see any measurable perf improvement, probably because the highest THP order
> getting chosen is always PMD size.

I think mTHP is much more complicated, since mTHP has many sizes.
Trying to adjust VMA alignments to get mTHP might not work well, since
you never know what sizes new VMAs are going to have.

IMHO, it might be better to align VMA to PMD or the largest mTHP size
(for example, on ARM64 with 64KB base page, PMD THP is 512MB, a 2MB
mTHP sounds more reasonable there) if possible and enable
VMA merging as much as possible for future huge page collapse.
mTHP can be used to fill the non faulted holes in VMAs if necessary.

>
> Out of curiosity, where do you plan to do the refactoring?


Best Regards,
Yan, Zi

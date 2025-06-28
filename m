Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430A21CC48
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.46
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751081874; cv=fail; b=tPOoxxYhUz9r9f0S3CvskwSWHTS1He7aJX3koVDiq7OuuCOnRcN2OjohwjjCNO7QoiQ/6uZj0IP+40H+nvLryZ92mb3dgAujBzOo899LgxZKYekql7l/krs5h9FCPA44COkqPveI+0Ehm+/U5s6GiyYPFuiQkDftsr+ZBehJAM4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751081874; c=relaxed/simple;
	bh=X0Bl3Ajr5dWNaUV1zs/HjYoSqkueNu5Ja4rYk1719S8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uNEA8+yT74vA0NGp7u+3RCKB+GMx8mD/NFGNVuzFtWFaApF7agpfJgfNa46D57IbMxcHcmaR/YzXfIUDQCCIJivJQ6sOmu+Yy31ZTXQh0CIfdohbb0j1GQYdDSd2CZsSRvqLCU59Kfy1ftZfImGOgmGZoz2jDHN0MdAHQHwFWSw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p4PpZDm6; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p4PpZDm6; arc=fail smtp.client-ip=40.107.159.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p4PpZDm6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p4PpZDm6"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tUeSDH99Rr/1DAivHAn2jf/6Ox0QZUuWJ8+Y4meWYAkAdklXk5jxvzLQT8y/+vQd2OVOMvMmdyGJZg2KozPK8wFcWGOCmKERhcs4ozocohO5I9bcAW5ITKMV50KLZWUspAIvBWE4PbKPKEA2QJpF281OHfExiU/nWYbGbDvD3zGN3xnQPkO3RKU47+nr2hpW27+Jt17FFHcjf3SpT5oDcsdJXu+EsQ1rMvqRA5y/68y49Q2N2FCd5q1BYu3iog4zJAkaP4SCjnzHGpwycrq6A6PUTd3DH0HYgqweJ+U9wZmUXw3sBEz0RfqRk5TJMog5q2O97UdCxTY+137NZCIrLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICA8/2texLawiWcJqw5XP1Q4dv42SdGfnHb/oyq4SUQ=;
 b=Cv96+SInBqeQLb3KCY4wEtFsKdNArkFITDcBsk5IQ1/AR3rTxNUU2eDesnZLXd71rvP5bsKDmfPceW0JkD5SkhgKdz6/hAUvkvt6oUzCJSc215Qwv992dcH3baGo6N66k1NYag+EFgoTLkUoetZCIqD4BHoLOVaZPh2BLmm95ZBhSeudLM4rvZL+NxhNadsjUNOTTDDL2txi0UldFoAM4rwiXQoYe2ZM6aG4gWtLguSE7kCgr8Vt0OZPfLIBuAHDLt78UqrMCl+g19X2h21oUSTtuMfMou404fKrpZjAAV/gshXicc2Oc7qRpOBY4if07v5EMn7JtircZ2sbGBqTwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICA8/2texLawiWcJqw5XP1Q4dv42SdGfnHb/oyq4SUQ=;
 b=p4PpZDm6MxTvirr32IyuzX0ZKoYvlRoEgvcPU9Ks3eUujXcPIr3B1SsZ2+RFUAqofAO/gDz7OnalSTCWufYgRX8QWbUdtu7UNqxZfTYXQBVBaEoJ53dFTu6DBo4jsWusSbFy6CQzLoNMI4w5l7+2qUvY41Gwkpw9Ue/jwQczcHY=
Received: from DUZPR01CA0177.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::26) by AS1PR08MB7402.eurprd08.prod.outlook.com
 (2603:10a6:20b:4c6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Sat, 28 Jun
 2025 03:37:44 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::17) by DUZPR01CA0177.outlook.office365.com
 (2603:10a6:10:4b3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.24 via Frontend Transport; Sat,
 28 Jun 2025 03:37:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Sat, 28 Jun 2025 03:37:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCTLvzSO9i0r+SZeCZ9q6uuPR17ywHIuAZ9QkLfAOoto7NZprOkKyreUiEEOjFaAhpyX0XBBrSW0YH8xKtkb7oZXTWgnY3RA13j2tpD7jPuLLu/GQx5kJ1LjUVdqWLPs/Gh5rGwPOYrC+hKqvOa7v/bTAJNgoFoubDr1Fsz5EXlKQ8Sz8RG0NMz6QkbILSsHPrJiETMUM9+aHIqeLkD+u+a5NK0R7ibO4wCBj88j3TG74GcWJ1jPKy70w8oI1bsWGd5YYVivxy3cCYzkU6bC23p6HMAVSbBiLfiP6nuk98Ctc1fjeWeiy/oE+96z7tSi9/k/COeQ9nsaSOiFL1Yi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICA8/2texLawiWcJqw5XP1Q4dv42SdGfnHb/oyq4SUQ=;
 b=GAoN+64UQNcUlMxYFH1kIV78e4YaXr4KwT2QCDxOeYZa1zbLG0uR0mxzukTQDq8VR8ZhpVYj0vPZuKULqz+KIvFiV89ZkvMKlyJrlSiFxL5u6WlRR7oOgboABq7maT3IxiCj5G4ZKkpdCiC9b6Kox1nZsjyeiYi0A5DI9SuyRqD/g4loGcGJwee10OZrfcBbo4hYrjOarzNB/a+0yRJFjI4Z5cppGQVxSDUTzdQKA0gPdSdIRMS+hVqe2BoemUNaRrs4L+XzQH3QAPkUqIpBDnJnk5/lZQ/LZWgYkt0ZjvtTSlJ8J/54BDJdXpgvKkx54+RPJCx+j2hVZQkNNNa1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICA8/2texLawiWcJqw5XP1Q4dv42SdGfnHb/oyq4SUQ=;
 b=p4PpZDm6MxTvirr32IyuzX0ZKoYvlRoEgvcPU9Ks3eUujXcPIr3B1SsZ2+RFUAqofAO/gDz7OnalSTCWufYgRX8QWbUdtu7UNqxZfTYXQBVBaEoJ53dFTu6DBo4jsWusSbFy6CQzLoNMI4w5l7+2qUvY41Gwkpw9Ue/jwQczcHY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAVPR08MB8896.eurprd08.prod.outlook.com (2603:10a6:102:324::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Sat, 28 Jun
 2025 03:37:07 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Sat, 28 Jun 2025
 03:37:07 +0000
Message-ID: <5c3428c6-25be-4a94-811a-6bb6718f6c58@arm.com>
Date: Sat, 28 Jun 2025 09:07:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250627115510.3273675-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAVPR08MB8896:EE_|DU2PEPF00028CFF:EE_|AS1PR08MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5580eb-0f9e-4bbb-6d5f-08ddb5f52428
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NXp2OWZlOStDelZPVlk1enhaUEw5aHJTUTRvY1h2dTZuc09iSFk2aVROZVNJ?=
 =?utf-8?B?dHFabGk2RDhGbHVqU0libzhLa2NoN3cyanFvQVBiUUlBVE1yMm5XZE1mVzhy?=
 =?utf-8?B?b3p6UXZnRE94QUYvVXA3VlpFc1AzbE9HZGdKbUpxUFVyWGw1czlINEFBc1VG?=
 =?utf-8?B?MlZkaG9EUEptSHV3TlFZUmVPUzBJcCtPRngvUVZ1cktUQVFEVXlvZFJySFdY?=
 =?utf-8?B?NFZ3NmlrbU1pc3Jkcm9sc0hLdXk2MFI0WHVTZ2E5K0dqdnhuTGJ5MVRsRGhM?=
 =?utf-8?B?bm11S3hpdFM3ZndOL0dLWStIVjV1TVE2WGhQMWhEMWRia1MvaDcyY0YrL29T?=
 =?utf-8?B?djdleEU4d1FZY0djYVphNzRvd0l5MmdwTThvWnhQSFRiWjM2ZTJwWXk4TmNq?=
 =?utf-8?B?U3ZWek5DZGdPbnVxMTdkWHlsTldxNmVzT0h6amMraDdvYVM4QjBLa1RidVh1?=
 =?utf-8?B?WHI1QVgxeUdZUllJTWs3bmVNMEJvbTJMVzhqbU4yVnA4M2sxd3Q0OWZVbWFP?=
 =?utf-8?B?bGhZYW12UTV2QksvV2ZNVjN0dmJheE13eEFLeUNsWUtReElPRHZ0dHgwUEVC?=
 =?utf-8?B?eEFSMmc0bEI3YllkSVRISGMzUExKWHI0VEREYjJLS3phN25kYmxlcGppbG9X?=
 =?utf-8?B?U3QxSGtoUXk1cTNJaGNyN3krRDNzeGRqNGU5Zy9vOExKNjNrMTloMCtsQ3lO?=
 =?utf-8?B?VVI4UHFYQWUrNjBLMUcrMDhyRFpXMWVsVEhXNVgxOWdEc2QrVjNndUVadElN?=
 =?utf-8?B?SEFZaEQzRFdEeUZiekVBOGVKWVlFQ25xQjFIOHZTVWJUWmE2QktuaHZuMHV2?=
 =?utf-8?B?d2hWNU1MeWMzR3Z0UFpET0NiZzNnZlF3R2dOSVV0L2RZL2xEYWJjYlJLQjRs?=
 =?utf-8?B?Y0poN3E0aHQwN3VnNE9iNlhIWDhYZFQ5RzhGZTVzTkl5Uld6WlcxNGpQL3RE?=
 =?utf-8?B?aFdheTRBc29zd1NNVStXbVRzSGgyaERnanY4Umkrc09EV0c5OXpqMmVpR2JT?=
 =?utf-8?B?T2NQWGZmYkoreWhXWDQvTjc3bUVPck9jZkhETlFmSlJjY0lmSVRXUGxGUEwr?=
 =?utf-8?B?UzQxMG1sNDJ0TEc0Q2xxbUVVbjhDdHdiOHNxTGt2WWpua2FOdURuOVZna0xx?=
 =?utf-8?B?clFFNTQwM2txcDFsZWY3bmVBemdGTUFxTTJna05jdGZEcEpwYnpsS2N2UVJB?=
 =?utf-8?B?bGRTclJOOGllVEJGdzZDY0FJUWpvU05rY0xUanN0VHppU0UvRUZ6WUlLWDVL?=
 =?utf-8?B?ZHhibFdaeDhpekRzcVJwWnMyVHZTUzFGVFVyb0VxQVMwTU43aHM0anpmd0Rx?=
 =?utf-8?B?YkExWTQ1R3l0TWxUS1Z4aFFldnAzOS95UzRTQ2IyTjJnTllzaHRUTW5RUGp5?=
 =?utf-8?B?KzJLUnpNZVhOSE9ycjFxVWFndkN0M1dkWlIyVTNRaTBHUUwrQzBFcFFGYUNP?=
 =?utf-8?B?WDFpYlp0MkVUa2xDTFd6dnE5TDVaRUxRLy9PSEhhRmdWSTZKZEFRZXA3OEhv?=
 =?utf-8?B?ZE1paGgvbWJZZEJSQUt1Tnl6blpSd2QzVUV6YVdmamhlVFBSNTlwWU1DQWht?=
 =?utf-8?B?OCtDT0t4TG1XWVV4UmdqR1BlT2hlWlFlbFVZdnZ0TjYyNDlTdFRyL05DNGpX?=
 =?utf-8?B?eGU0VUpJUENTMlgwQVQyd2YxWWlwbzQrQ3NkYW9Fd3h5a2htSFIybUhTdTZv?=
 =?utf-8?B?OHhNQ2IwWmhQZUtqeG9SOWZwOWFIc1ZPQWk5c2d0V2lDVVB3bkNvKzBlK2dO?=
 =?utf-8?B?T2VCMERaZU9aVUlrMmtCd2ZBNGh5TENGZU8rMDZ3R2hPSjRFMVdXaFdQbjlG?=
 =?utf-8?B?VSs0b0loSVAxR2ZLQzNKQWdialhJc2c2a090SFpWQ2tiL2dIWkI0ZFpUN0RG?=
 =?utf-8?B?Rityc0p2Q2tpSmRUR3RkaXJrUzJGN2cxdzRPWHUxZzdaK3hFck1TN1NDY09m?=
 =?utf-8?Q?9WUWv1V/W9c=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8896
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	610504f3-29f0-4f42-4c13-08ddb5f50e62
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|35042699022|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUdKeVJTZUZVNE9UMDZTRXNQdFQxUEFSaU5BMUVHNUtUVVhsbFNSRUdSV3Ex?=
 =?utf-8?B?Vk03azRSVUJ3dGRlWU9UV29yRldXWnVXZmNMNFFwOWo5ckprV2xlaVpoMCtQ?=
 =?utf-8?B?L21XVVQ1T0Ivbnhiazc0bUFhVk4vUzY0ZjE1bzBKbExtMTJiUlZiZ0pja3B5?=
 =?utf-8?B?dHJtbUhHc3lWOEY5Z2JsN3NLdjd4WjdFYTFXaERDbnNNT2ltUTBIRHI5STNn?=
 =?utf-8?B?b0k5N1I4ektrT245M2VCOE5PYzI2blVUVkJBNXExVlNRL1RNYkJDMlVoSTRy?=
 =?utf-8?B?NHBCOTlOcmcrN25IMWFORXcxSFhJZDlzNFB2cCtDaGF3dUNIRm5jRGlhTnhu?=
 =?utf-8?B?azNzRnVCTWJFc2pvT1kxK1FRV01VWUY1OFdIQlBtNThXRVJTRmZYdW1MNG5V?=
 =?utf-8?B?bTU1WDBUL0ExVW5FallMblRWblJaRnE3bEpwMEdpZ2JhU0JMaVVIQ3VHREFC?=
 =?utf-8?B?Zi8wekVrVjEyZ0txOVQ5MG9pYk1ERWU0SU5BaXVDOGpIa3hkOG40UGxyU0Ni?=
 =?utf-8?B?QjNLZXFMcWs0OGhQVVRvT3hKZVRqRHh5ckNHTlAzekhuNmZ4WWNCRUd5S29P?=
 =?utf-8?B?Unc1cXlocXp6YU1OTVRsNldMMEhTS2trdHM3RDF4RHB3bVFCcFBHVUt0N1NY?=
 =?utf-8?B?Wm9IZVpyOVNFVmVRaTFFcVVSVmh2RnRiampmaWQ5cmJqcW5DSHNSK2I3UFpl?=
 =?utf-8?B?Nmw3RVB5Zjc2bFFFUnhKaHpFUlRaZWIvV2lJTi9qNG1rMWZWNHdGeVZ5NHF0?=
 =?utf-8?B?Syt6YWJrNVVIN2ZlUTRnVndGYmlZVFNRaUFLOFBNY3hlbUNkZGxxWkthTzJj?=
 =?utf-8?B?RjByUGRBMWdOMkhpUVNMeXE2ZVJtVkdXQlFQY1BMSzZvVjMrZlBVOE9nZHF3?=
 =?utf-8?B?UGNWdGZpMThsaHhNa1MyUE5tODh4OVVMN0htM0V4KzJnWnRBUHVsbHhoZ2tw?=
 =?utf-8?B?clFzSE5CajZsMEVhdnNoeklqSkhQaFlTRWtiTVplZXFvY29sSXNTdFp0VkUy?=
 =?utf-8?B?WEhoZWNFK2FLU055azltWmFIYVQxL3dweEkyMzNuYy9xRUQvNkt5eFlWZUZr?=
 =?utf-8?B?QnRvclZmVHJJWmIxS2dHaUIvL2g0bjNlWk5IdUkwUm85eE5ZU2RwRUNUUkFH?=
 =?utf-8?B?Rzg5TXB2WkhqQmprNmR1dDFvZWltUXRGcFd4bjN1dWNHcXhiay9selpxdlQy?=
 =?utf-8?B?S2tlZDJkZmxvVGF6NFBDTFE4WktjUm1UcDA2ZkhvdTVtZHpsTGhzQUJvckVq?=
 =?utf-8?B?bndNcUs0SklEVjhNK1N6U0p5R1NYN1NFQkoyU3JMZXdNRURuL241U0tENWdu?=
 =?utf-8?B?aUxHQlNadlhtclNWV2VRZHAyNlpGUmVOZmttZTFzN0htdmNSaThNSjBxdUFL?=
 =?utf-8?B?eG9qNytmeDVrM202WVpxaWxMTERNSnlaL0sxcW5ITWd0a1NZcXZndXhqa3kr?=
 =?utf-8?B?eU42TEFhYWxmK043K0RlOTdja2ZaVzNMOCsyN0RyeU5PTnZ0SitWekhlaXJL?=
 =?utf-8?B?bHlzWEsxeitCZlFkV2h5aXF0WFN0VDYranhsaG02Rkg0T3o3cGUrNzFvc011?=
 =?utf-8?B?dmVQeGk0VmZhQzQrYVk2aEFibCs0dDlhakdremdJbjRFemdheE1JZ2N6ejRk?=
 =?utf-8?B?ek9BSWY4c1hUZlBNUGVWd0pWcnJjUVltcTc0d1J3MHpMM3o2TDRXTytIbFVP?=
 =?utf-8?B?TVQ3M1lvcnhOaDFEbHN1OWJTOEg0QXpHWTdhbmZQOWRYZ2h4bGVyR0lGc1Y3?=
 =?utf-8?B?U2pjZ0NuUHdDRW9Oa2hoTElxNit5eVREYllRZG1yc1hzQXNuUzEveXF3ZzVo?=
 =?utf-8?B?MG0yWmsxRUx4UlNsbnBCT3ZMYXRPb2ZoSUNaSWRCR0hDZDlmSTY1UnBRSk5S?=
 =?utf-8?B?eUd5L2pNeGtCNFVWNW05ejQ3aldtcG9pQlNVNGx5RnVnR1REbXc0VWNmbUdR?=
 =?utf-8?B?TmxSTVU2L2ExRmVTcTE1RER0SUZjajY3THVObDNFU0t2Sy9vd2N3cmY3Q0JF?=
 =?utf-8?B?bHVtbjArVlBuOWdLWHZ0RnpjTUlYS0M4TmRyazdRc05NdzZmSjlDTnhRd3JY?=
 =?utf-8?Q?tz/mSg?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(35042699022)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 03:37:43.3652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5580eb-0f9e-4bbb-6d5f-08ddb5f52428
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7402


On 27/06/25 5:25 pm, David Hildenbrand wrote:
> Honoring these PTE bits is the exception, so let's invert the meaning.
>
> With this change, most callers don't have to pass any flags.
>
> No functional change intended.

FWIW I had proposed this kind of change earlier to Ryan (CCed) and
he pointed out: "Doesn't that argument apply in reverse if you want
to ignore something new in future?

By default we are comparing all the bits in the pte when determining the batch.
The flags request to ignore certain bits. If we want to ignore extra bits in
future, we add new flags and the existing callers don't need to be updated.

With your approach, every time you want the ability to ignore extra bits, you
need to update all the callers, which is error prone."

>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/internal.h  | 16 ++++++++--------
>   mm/madvise.c   |  3 +--
>   mm/memory.c    | 11 +++++------
>   mm/mempolicy.c |  4 +---
>   mm/mlock.c     |  3 +--
>   mm/mremap.c    |  3 +--
>   mm/rmap.c      |  3 +--
>   7 files changed, 18 insertions(+), 25 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index e84217e27778d..9690c75063881 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -202,17 +202,17 @@ static inline void vma_close(struct vm_area_struct *vma)
>   /* Flags for folio_pte_batch(). */
>   typedef int __bitwise fpb_t;
>   
> -/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
> -#define FPB_IGNORE_DIRTY		((__force fpb_t)BIT(0))
> +/* Compare PTEs honoring the dirty bit. */
> +#define FPB_HONOR_DIRTY		((__force fpb_t)BIT(0))
>   
> -/* Compare PTEs after pte_clear_soft_dirty(), ignoring the soft-dirty bit. */
> -#define FPB_IGNORE_SOFT_DIRTY		((__force fpb_t)BIT(1))
> +/* Compare PTEs honoring the soft-dirty bit. */
> +#define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
>   
>   static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>   {
> -	if (flags & FPB_IGNORE_DIRTY)
> +	if (!(flags & FPB_HONOR_DIRTY))
>   		pte = pte_mkclean(pte);
> -	if (likely(flags & FPB_IGNORE_SOFT_DIRTY))
> +	if (likely(!(flags & FPB_HONOR_SOFT_DIRTY)))
>   		pte = pte_clear_soft_dirty(pte);
>   	return pte_wrprotect(pte_mkold(pte));
>   }
> @@ -236,8 +236,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>    * pages of the same large folio.
>    *
>    * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
> - * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
> - * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
> + * the accessed bit, writable bit, dirty bit (unless FPB_HONOR_DIRTY is set) and
> + * soft-dirty bit (unless FPB_HONOR_SOFT_DIRTY is set).
>    *
>    * start_ptep must map any page of the folio. max_nr must be at least one and
>    * must be limited by the caller so scanning cannot exceed a single page table.
> diff --git a/mm/madvise.c b/mm/madvise.c
> index e61e32b2cd91f..661bb743d2216 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -347,10 +347,9 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
>   					  pte_t pte, bool *any_young,
>   					  bool *any_dirty)
>   {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	int max_nr = (end - addr) / PAGE_SIZE;
>   
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
>   			       any_young, any_dirty);
>   }
>   
> diff --git a/mm/memory.c b/mm/memory.c
> index 0f9b32a20e5b7..ab2d6c1425691 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -990,10 +990,10 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>   	 * by keeping the batching logic separate.
>   	 */
>   	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
> -		if (src_vma->vm_flags & VM_SHARED)
> -			flags |= FPB_IGNORE_DIRTY;
> -		if (!vma_soft_dirty_enabled(src_vma))
> -			flags |= FPB_IGNORE_SOFT_DIRTY;
> +		if (!(src_vma->vm_flags & VM_SHARED))
> +			flags |= FPB_HONOR_DIRTY;
> +		if (vma_soft_dirty_enabled(src_vma))
> +			flags |= FPB_HONOR_SOFT_DIRTY;
>   
>   		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags,
>   				     &any_writable, NULL, NULL);
> @@ -1535,7 +1535,6 @@ static inline int zap_present_ptes(struct mmu_gather *tlb,
>   		struct zap_details *details, int *rss, bool *force_flush,
>   		bool *force_break, bool *any_skipped)
>   {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	struct mm_struct *mm = tlb->mm;
>   	struct folio *folio;
>   	struct page *page;
> @@ -1565,7 +1564,7 @@ static inline int zap_present_ptes(struct mmu_gather *tlb,
>   	 * by keeping the batching logic separate.
>   	 */
>   	if (unlikely(folio_test_large(folio) && max_nr != 1)) {
> -		nr = folio_pte_batch(folio, addr, pte, ptent, max_nr, fpb_flags,
> +		nr = folio_pte_batch(folio, addr, pte, ptent, max_nr, 0,
>   				     NULL, NULL, NULL);
>   
>   		zap_present_folio_ptes(tlb, vma, folio, page, pte, ptent, nr,
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 1ff7b2174eb77..2a25eedc3b1c0 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -675,7 +675,6 @@ static void queue_folios_pmd(pmd_t *pmd, struct mm_walk *walk)
>   static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   			unsigned long end, struct mm_walk *walk)
>   {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	struct vm_area_struct *vma = walk->vma;
>   	struct folio *folio;
>   	struct queue_pages *qp = walk->private;
> @@ -713,8 +712,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   			continue;
>   		if (folio_test_large(folio) && max_nr != 1)
>   			nr = folio_pte_batch(folio, addr, pte, ptent,
> -					     max_nr, fpb_flags,
> -					     NULL, NULL, NULL);
> +					     max_nr, 0, NULL, NULL, NULL);
>   		/*
>   		 * vm_normal_folio() filters out zero pages, but there might
>   		 * still be reserved folios to skip, perhaps in a VDSO.
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 3cb72b579ffd3..2238cdc5eb1c1 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -307,14 +307,13 @@ void munlock_folio(struct folio *folio)
>   static inline unsigned int folio_mlock_step(struct folio *folio,
>   		pte_t *pte, unsigned long addr, unsigned long end)
>   {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	unsigned int count = (end - addr) >> PAGE_SHIFT;
>   	pte_t ptent = ptep_get(pte);
>   
>   	if (!folio_test_large(folio))
>   		return 1;
>   
> -	return folio_pte_batch(folio, addr, pte, ptent, count, fpb_flags, NULL,
> +	return folio_pte_batch(folio, addr, pte, ptent, count, 0, NULL,
>   			       NULL, NULL);
>   }
>   
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 36585041c760d..d4d3ffc931502 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -173,7 +173,6 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>   static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>   		pte_t *ptep, pte_t pte, int max_nr)
>   {
> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	struct folio *folio;
>   
>   	if (max_nr == 1)
> @@ -183,7 +182,7 @@ static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr
>   	if (!folio || !folio_test_large(folio))
>   		return 1;
>   
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
>   			       NULL, NULL);
>   }
>   
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 3b74bb19c11dd..a29d7d29c7283 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1849,7 +1849,6 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>   static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>   			struct folio *folio, pte_t *ptep)
>   {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	int max_nr = folio_nr_pages(folio);
>   	pte_t pte = ptep_get(ptep);
>   
> @@ -1860,7 +1859,7 @@ static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>   	if (pte_pfn(pte) != folio_pfn(folio))
>   		return false;
>   
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
>   			       NULL, NULL) == max_nr;
>   }
>   

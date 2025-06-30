Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48D02820A4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284105; cv=fail; b=Ic/GQA7NsJ7uezSrUekRbI9r/6yvME6el4KVDC7nAWDklI7XrUPnXOCIIkr1I9H9g8/mngt5DFBJ0Fw8AGJAtdCNfmxcc2QTVkeIajllfRMXRYW8cKe22C9KnDaC4sITbq5Ja7Dxb5TNgqzPJ8KUr4TWGwaIhk3+PPtq6tj3g4w=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284105; c=relaxed/simple;
	bh=mC+eb3OyUhnerdZDMMREXGdN0mRnohWqLR9bDKAQ+f4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WXi/fS3AH2XBCkAd0ps4Loud3C0awHHACrBIvcwJ3HX0aUe/VcV/7uZoWa3yMV1I+/DFVD2urlWvC1NhjHlqUaLW6aLvs0p8cWBnYtRXua+5xkg0d1wCMbvGH0JEpA2zjCdmTaS87XDx8NHNACRUOXIEJE7sp32R25ryUSFphqM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hzGPQkld; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hzGPQkld; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hzGPQkld";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hzGPQkld"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EHBxKw3WJ1vpF9zqs81VL2+RWVJBfe/gDpJWzNCGD4/7IcqjhQ7hAcbn342UcDJdrWzj1LL+7bqERiuHs8XzsDfPwp9YdOJp8tsVSNrCYQcKsHrBw69YCbpR+o2pAakR2+dB9UgSswNR/SbJRSRjppA2bihi33rThabOkKSAaqf3wZFRINe2rHH3KAF20cLqsNQEJj+CAvUbaWknwnSfjZQ0xqYL8ljLsEslQ4GkCOPsDcoIwb+Hf1GZD2y1Iq6Svnd7NPNOoEOMEjPoPwnJlEXHe92gs6HAQdhI3sWdS/R7SxpE4gkS89nn73u4Y/WCGRQ0iWyKpr1PFuKWOio/ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHTSGrKq5Kh9vJnRQxu9tpt/w4Bi+6qDeSPIEYayJAM=;
 b=blsrD75Af8IKagfXYccZTFgGPMg4u4SwqknUw93Trqcwn3B4aTEXLJEk2inbqc5Oxv/UL7/E07Uvq90n069V+FZv/Qcqdan7XqjtMZ9teSJ/EpIfi04Ik14b1jhbUoaHC+V2lZJusOpCQ2eoCQ6glJB9OovjXwHceGxEC/MKa5yQyE4LUdAfO6OGQwlcJMRckMbkpTTK/w4XJ+oJP+lMjROwOmQ8ZOCrWpXZScjIFKy4oUyqGTCp8HyxyqURIhaX0asSyHSjqIUbvh1ePCkWGUXvALmMDNwqzsdi4cW1i5iFHQ8F8y0hRQz5L3uCNrO3atfpUHFgih2ntCx4zcgUyg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHTSGrKq5Kh9vJnRQxu9tpt/w4Bi+6qDeSPIEYayJAM=;
 b=hzGPQkldUNLq/c2QR6ktvV4wB59LDdS4Kh+pFqhRUAJ74tlDXBR7qiywIL7KC2soV3B0zD9OSY6WYfRQbf6D8kcitZYVVnRTG7s4Gbz0f4xGyDS4TTw6VhPazA5ykdDGHlF2wZywlBtNXQ0Xl1eQG+7qqtksjWJANp1JodU6CAE=
Received: from DB9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:10:1db::15)
 by DB9PR08MB8505.eurprd08.prod.outlook.com (2603:10a6:10:3d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Mon, 30 Jun
 2025 11:48:18 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::51) by DB9PR06CA0010.outlook.office365.com
 (2603:10a6:10:1db::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.26 via Frontend Transport; Mon,
 30 Jun 2025 11:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 11:48:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWMRGbvqzRLmxmtk9KCqLreQxHBG5v/BL4I2HcBcqY3HC6rhkS1RzzD+oAeO2R4F0LSFUXYujd9KJf+6V0/I77qiX8PU9i4lKjb6YblwUKjELeuwgaPrwJzKjVMwFetdy6Ifqf379ddTDUJNNGoyxf3EUgRq5kK0BcmnQ3A+RAZukaYSNmQ2wEZOAVoPMouvRsGDHPUxmV6tJOR5la3Y9GJbzIJqevBNB7TDHCVDG7sqnac25RaU0qDVztdHZeSXAPg5p525lYE6XLU4p5CIv46OqptfD5lBSwCiJ+NKDIc62B/ddIi+yTXx5Pej2aErwqz56LstjnaM4fCtNOxGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHTSGrKq5Kh9vJnRQxu9tpt/w4Bi+6qDeSPIEYayJAM=;
 b=r1S2nJGi0Ex61odhF0tROrREdcu4ZxyPvzdp1VEhmkoP46/+cAg6yQ3Y87C1xN6jyUZiEfAPD7DFvpdnO3KMdUMUOcnp+MR3FTtRQKHZJqcVOxH8anye8xXvxSazIQ8dWcTimXw1/UEoh7WVj3FHyULvnZDWYnlJ/1/5XQhLamrDQjes+Ne13Q2Rp/SUVnf2E8N0GNeMEa4sGf8ltDUXYcCJJ1BD7KhzDjidwLFhpx9aRyDs0NslMgzhVHBIyVWLpgEGx2npmJ/rXVcYONuxfJwty/ikAW6MvI+YZt4YkMeZBWxw5C5y83LrgOBu5MCDAzTVb0Szw8f7EukRNQgI8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHTSGrKq5Kh9vJnRQxu9tpt/w4Bi+6qDeSPIEYayJAM=;
 b=hzGPQkldUNLq/c2QR6ktvV4wB59LDdS4Kh+pFqhRUAJ74tlDXBR7qiywIL7KC2soV3B0zD9OSY6WYfRQbf6D8kcitZYVVnRTG7s4Gbz0f4xGyDS4TTw6VhPazA5ykdDGHlF2wZywlBtNXQ0Xl1eQG+7qqtksjWJANp1JodU6CAE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB8PR08MB5401.eurprd08.prod.outlook.com (2603:10a6:10:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 30 Jun
 2025 11:47:43 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:47:43 +0000
Message-ID: <e26dfe1e-a96c-47a8-a246-07b6bfa61fee@arm.com>
Date: Mon, 30 Jun 2025 17:17:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
From: Dev Jain <dev.jain@arm.com>
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
Content-Language: en-US
In-Reply-To: <6ded026a-2df2-4d81-bb70-cd16a58f69e9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::26) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB8PR08MB5401:EE_|DU2PEPF00028D00:EE_|DB9PR08MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 240bb753-8997-44ed-80ed-08ddb7cc0102
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z01TWFN1Z1RtQ0N2ZUpQM0lraEY1ak5kS3NsejN0UC8yMXdxNU91ajZBdGFU?=
 =?utf-8?B?V2RKTFRXYngxYWV4VktFajJrbkNDeEc1eDFTN25rV1M2RGJSWWFrQTBYU1JO?=
 =?utf-8?B?QXc3NTZiUGhXSWN4WU1MT3h4cUIvQ0dVUThwb0IxTFZrd2h6NFBBbE1lWlQ3?=
 =?utf-8?B?Q3dGc0FNczdjbUcrU0FNYTdRclFXQ0RRd2JSWTZaTWdqSjRkKzgwRXFNdUpJ?=
 =?utf-8?B?QXYvL2ZrazVxSk4xYVFJb1dqNkJaMUpFN2FTdXZJN3F2UjdvVk8xOUppSU8w?=
 =?utf-8?B?WmU0dWtjZlNJYzVQUG91NWNQUy9ZWVpuSEozQUFvNXA2b2tXQUxQM1FIRnNR?=
 =?utf-8?B?anFpMnlxNXp6M21RUTBUeFBuTVBrUUxkR1A3QTRCUVppUWhOR2JHdEI4RFlq?=
 =?utf-8?B?dDB6Skl0MlBLYWRZOGlaTnA1dTEybjVkOWRDSG1OVXBGTDU4TEtKZjBzTXN2?=
 =?utf-8?B?emd0QmQyem5uQzhlbmlBSjdQZ2JsemxFV0NoYTlHT25RUXk2VEppS1J6K2pJ?=
 =?utf-8?B?TTliUDdCcGtiQXF5Nkc0K3c4a1VuWXh0dzBRKzJNZVBsRm1OS3FLTWo0TFU3?=
 =?utf-8?B?Vk5JVkE0RS9YRVY2TUNYeUd1OFQ4MXVib3dUeSsvUzFZa1kzWHhZTjBaNEpu?=
 =?utf-8?B?L0ZOd2N1SHFSZ1pRb295RXdSZXRKK1F2RW52SE93RVlabHNpS0ZJNHkwd2hD?=
 =?utf-8?B?Y01OUjY2ZzlEcEM0NktXcmdoeTdWQVBtVzBhM3VseGtvMk1rYzVnNm5XV0RV?=
 =?utf-8?B?dS9KOHJqYkRqaDJLL01vUVJLaTZmM0I1QTdoWUh6TkxLTnZrc0J2SHlDY3Ar?=
 =?utf-8?B?MkNmK3BvU2cxRlJjbzZUYTFwMGs2SHBJOStYbXY3NzdGTkNvSUJtMURwQUNl?=
 =?utf-8?B?YllWK0pDTk56ZVdzQ01TbFNiaUJqRjczZnJPSFRUWGJlOTQ4cVVZeklJNmNL?=
 =?utf-8?B?M2VUd1dKSWI1aXNUaVJwUGlEUjNBWDMvcHdxSGJuWkYva3RxWm5jY0w4MHZx?=
 =?utf-8?B?dzl1OGRkS3RmdEM1TDlTZ1pKM01nQ2o4N2kwMTZoSUxlWmVjbGxMTHVhamZz?=
 =?utf-8?B?YXpEOHNFbnRkQWM5MS9TcFZLNEM0amlESjB5YnJnWkFwTHlWNjJFNVNQOGVt?=
 =?utf-8?B?NXdIWFVtSGhhU1lXbFhINTBKNHI3OVk2MFB3UTd6Q20vZjk0alFXTiswRnRV?=
 =?utf-8?B?cnFrK2JEYVhKdExGYzVUZkRMRUdkZXZtdUdsSUpoMDNMaXMzUHZwNHpQVnB1?=
 =?utf-8?B?bHQyTkx2bGMzQ1pXME1hTEgzWVYyMXNmTENNSi84TUhIK2JQYUloV0ZTRW5H?=
 =?utf-8?B?b0xYYVBWbzdQNGlrL2RrT2J1dkUyOTBWYmhoQWJOL0htMHlYKzExQkUwYXV6?=
 =?utf-8?B?a0ZvYnBYbDZOM25aMlhySDNhL1FtblJBeC9DL3dGK21sNlRjd1pzR1RrN1Nk?=
 =?utf-8?B?cHF4SmNkaFhvZHU5cDBtcVRqaDczTnNnZW5rdkZKMGYyNlR6eHFMbDU2dmR6?=
 =?utf-8?B?L3p1ajkwNTVCSC9NMm1oRVlOOE93Z1hLckNTYldkTnZ5cmh3VzNac1FwZjRV?=
 =?utf-8?B?RCtvRGJ4bDJjaFBJekJqR2JEcG5BcDFTWml3ajd4dXdBOUFkODBPUkYrLzd2?=
 =?utf-8?B?dHNldHRmUllFSHlzR2d0QTlpdHIyNkFaMytwRU1GaldrcEYrTDdtMS9TVEw0?=
 =?utf-8?B?WWxGYm1VZTZkbitGd1N1cHF5MkJld3hYNmU5WWNiZzVCK1BUaEdzYnpHWU5z?=
 =?utf-8?B?RkMvbGFUa1hYQkVQREVsV09Pbi9DRkJTZ1R3ZnIyZ3NDenVkTzJTUFp3RWNk?=
 =?utf-8?B?Yk01Q1hBSC9ML3lKVDdnUG1ZeHV3ZkxROThWTUhBODlxZlVtNHBic08rTUUv?=
 =?utf-8?B?ZzhZOFAxWmRSUUVrVk9XdXpGMWg2TVgwaFhxYW9Ga0NMTjhteWNyemNISWd6?=
 =?utf-8?Q?wZy9w5ejotk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5401
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70be42bb-1027-4cab-e3ed-08ddb7cbec98
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|35042699022|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnhreFpIZW9CWFI5by9lckdEdlN5cUJFTFBKT1RkU29Ub2EyaWR6MkNhdjJn?=
 =?utf-8?B?eEY5aGdRTm1wYzh6SUdObGRSVjgwakx4NENhZnVnalF3NzhOYWNCTER2eXY0?=
 =?utf-8?B?RERkTEZHNGptbjJhNmNoSzRUZDVNR0hJeFFCYlVzcnVZSWpHQldvRUZBV3ZF?=
 =?utf-8?B?TnFRUnI2TjRMZUhxdzNnUzVjSlQxa1MraVhseEhtZU52UFZ5TVk1RnFyOC85?=
 =?utf-8?B?Y3JseitlUllJRzRzNkYzbkF5K3JMVWZZblovRjRMV0dMVXNJZldYV1BINk1C?=
 =?utf-8?B?eVJ3ZFE3SnlrV2JpdFdYUGkxVzNIRWdPdDhzV0xzVE9jazBGWVZaVW11NUlT?=
 =?utf-8?B?Q21SLzIvMi95MlJwWkx4eXZoekZreHc4eVcvNmJUa3BOaHpjSGtjWnZnWjM1?=
 =?utf-8?B?cVRqUGJFdkpBVFl2NDdkNUVRTUc5MVZrRy9EV210ZzM3Znl1YTJvTC85M1JM?=
 =?utf-8?B?Z2tDbjlHTlFoM0o0WmdaQzhzdUxuclZ3RTNOTmNuKzZpb2UrL1JFR29nQ1Fr?=
 =?utf-8?B?TytNeEtCenpaT3RzT2M3ekdveXBwYllxa3VCQml5aDVMMGt1MmZ3K0pNZEJx?=
 =?utf-8?B?eWgzN1J2ZW5CWk9RL1N0NnY2R0MvZmdWbTRLT3JDQTlhaCtEdlp2OG9iVXNC?=
 =?utf-8?B?NHIvZU5tYXVLTGZNbDVzMlE1aFUyVmJwbzErQ2x1b1F2UDVoQW03eGQ5Q254?=
 =?utf-8?B?aFBBTU41Z0V2S3JRbE9GUHJDYUJRLzdTbDFPU3hiWTl2U1J3VVh3TFlRcUho?=
 =?utf-8?B?V0h5TmF0a2lDdXB1d0c0R3k2NGhVeTVPb0dvN0d6QUpWbHVPZXI3RXFVeUNK?=
 =?utf-8?B?VUVqa1FXcVlKSWhKdmlCclBMRjBRT1d5MFkxUFNvd2U4a1drSERvT1N1N254?=
 =?utf-8?B?clpmbnF0S1g2YlhYWnNheTNHeVFmMUxONWpZTnpGOW03SWpieFg4UCtiaUFX?=
 =?utf-8?B?eVRHNmFkVlY0L1hNcWYzRnEvb2ZkWTNUcFhTU1hyOUFBRlBERGk1ZW12WWor?=
 =?utf-8?B?Ym9lK2V2OGJGTFRLUkdwbWdqYTdUVXA0cU5QR3NTUDZDY25yMWZnQjhkZjNU?=
 =?utf-8?B?VDMzMXpZOVJVQlBaTExHdXJIZ2FMVkRzV3Myd0F0NEprR0ZQNjVBWk13MklF?=
 =?utf-8?B?THJqbnRGc0ZnS2VHd2ZUTHZESTNla3ZYNy9oQlNZc0VpblcyVGtCZUtoY0tk?=
 =?utf-8?B?ZXpueTEwOGppMXZ0dWdJZXVtWU1LaloxTjR2djNLVnI2NnVqRml2cDdhSTBq?=
 =?utf-8?B?NUliQXFpaGlnQXdkbitIc2liaG5SQzFuOXNjMFVsV1czcnN5WVNYS3BrU1RE?=
 =?utf-8?B?N0tCbit1K0ZSNld2MDZsMXJwVTNwQXN2VE1mMTQ1eGJKREVJaTYybXNETC9w?=
 =?utf-8?B?Mm9wc1BUVTVtdm05RkN0T0xXd2JTUHIyOGpJcHNKdS8wTE5EL1ZHUi9uM0hv?=
 =?utf-8?B?YjRLTHY4QWFaOWxzWUJoMDkwVUZEWE44S3NnRHlzcUFmSGtHbkFQcEhwMkR0?=
 =?utf-8?B?KzROeHNRREJMa1loTkd4QU0zMWJaNWgzeUdVT0R3V1QyTE50MTI2YmZoTHpX?=
 =?utf-8?B?UlZwTVllckViM3duRGJraFMvTUFka1pXaXJVeEZQWGxxN3hoeFYxVllUaDVz?=
 =?utf-8?B?MVVwUGlib1AvbThsWXRUWXJVT0hDOGFyZjlTdmFUcW1KeXc5cXl5UzA3ZnpK?=
 =?utf-8?B?WlVzUGNLL0M5SEJWL1ljc3pGQm4zNXJLTzRUYy90cXZQbDRHZWNSUVlva0Ru?=
 =?utf-8?B?dSsvSjhNZ29yUHNNWjBSa3JKbkFEbGNwMnlPQlNQbElKUkxnWG0wMFNqZXFL?=
 =?utf-8?B?TWZNazNtLzRydVJ1VTVqdUY3WWtzNmRSOHBBMzVlK3Q3UWx5akQ1cmxKaEY1?=
 =?utf-8?B?S1ZDZjlJOHZBUVVGcjBTckpRblhzTm9hL0dxUVV4OTVRclRnT0pYQm5FZENa?=
 =?utf-8?B?Q0RmdWE2K2gyZi9HQzhFdENxejhDNUZnNS9rajhJd0g1dGV1Q3VEdlV3TkNk?=
 =?utf-8?B?cTJrUXFMc2NaWWxkU3B1SkxOMDZPS0kvK0JiRjZVaUZwQlJyNjZWSFBBRkxu?=
 =?utf-8?Q?arWl29?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(35042699022)(1800799024)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:48:17.3538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 240bb753-8997-44ed-80ed-08ddb7cc0102
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8505


On 30/06/25 4:51 pm, Dev Jain wrote:
>
> On 30/06/25 4:01 pm, Ryan Roberts wrote:
>> On 28/06/2025 12:34, Dev Jain wrote:
>>> Use folio_pte_batch to batch process a large folio. Reuse the folio 
>>> from
>>> prot_numa case if possible.
>>>
>>> For all cases other than the PageAnonExclusive case, if the case 
>>> holds true
>>> for one pte in the batch, one can confirm that that case will hold 
>>> true for
>>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do 
>>> not pass
>>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
>>> and access bits across the batch, therefore batching across
>>> pte_dirty(): this is correct since the dirty bit on the PTE really is
>>> just an indication that the folio got written to, so even if the PTE is
>>> not actually dirty (but one of the PTEs in the batch is), the wp-fault
>>> optimization can be made.
>>>
>>> The crux now is how to batch around the PageAnonExclusive case; we must
>>> check the corresponding condition for every single page. Therefore, 
>>> from
>>> the large folio batch, we process sub batches of ptes mapping pages 
>>> with
>>> the same PageAnonExclusive condition, and process that sub batch, then
>>> determine and process the next sub batch, and so on. Note that this 
>>> does
>>> not cause any extra overhead; if suppose the size of the folio batch
>>> is 512, then the sub batch processing in total will take 512 
>>> iterations,
>>> which is the same as what we would have done before.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   mm/mprotect.c | 143 
>>> +++++++++++++++++++++++++++++++++++++++++---------
>>>   1 file changed, 117 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index 627b0d67cc4a..28c7ce7728ff 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -40,35 +40,47 @@
>>>     #include "internal.h"
>>>   -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> -                 pte_t pte)
>>> -{
>>> -    struct page *page;
>>> +enum tristate {
>>> +    TRI_FALSE = 0,
>>> +    TRI_TRUE = 1,
>>> +    TRI_MAYBE = -1,
>>> +};
>>>   +/*
>>> + * Returns enum tristate indicating whether the pte can be changed 
>>> to writable.
>>> + * If TRI_MAYBE is returned, then the folio is anonymous and the 
>>> user must
>>> + * additionally check PageAnonExclusive() for every page in the 
>>> desired range.
>>> + */
>>> +static int maybe_change_pte_writable(struct vm_area_struct *vma,
>>> +                     unsigned long addr, pte_t pte,
>>> +                     struct folio *folio)
>>> +{
>>>       if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>>> -        return false;
>>> +        return TRI_FALSE;
>>>         /* Don't touch entries that are not even readable. */
>>>       if (pte_protnone(pte))
>>> -        return false;
>>> +        return TRI_FALSE;
>>>         /* Do we need write faults for softdirty tracking? */
>>>       if (pte_needs_soft_dirty_wp(vma, pte))
>>> -        return false;
>>> +        return TRI_FALSE;
>>>         /* Do we need write faults for uffd-wp tracking? */
>>>       if (userfaultfd_pte_wp(vma, pte))
>>> -        return false;
>>> +        return TRI_FALSE;
>>>         if (!(vma->vm_flags & VM_SHARED)) {
>>>           /*
>>>            * Writable MAP_PRIVATE mapping: We can only special-case on
>>>            * exclusive anonymous pages, because we know that our
>>>            * write-fault handler similarly would map them writable 
>>> without
>>> -         * any additional checks while holding the PT lock.
>>> +         * any additional checks while holding the PT lock. So if the
>>> +         * folio is not anonymous, we know we cannot change pte to
>>> +         * writable. If it is anonymous then the caller must further
>>> +         * check that the page is AnonExclusive().
>>>            */
>>> -        page = vm_normal_page(vma, addr, pte);
>>> -        return page && PageAnon(page) && PageAnonExclusive(page);
>>> +        return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : 
>>> TRI_FALSE;
>>>       }
>>>         VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>>> @@ -80,15 +92,61 @@ bool can_change_pte_writable(struct 
>>> vm_area_struct *vma, unsigned long addr,
>>>        * FS was already notified and we can simply mark the PTE 
>>> writable
>>>        * just like the write-fault handler would do.
>>>        */
>>> -    return pte_dirty(pte);
>>> +    return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
>>> +}
>>> +
>>> +/*
>>> + * Returns the number of pages within the folio, starting from the 
>>> page
>>> + * indicated by pgidx and up to pgidx + max_nr, that have the same 
>>> value of
>>> + * PageAnonExclusive(). Must only be called for anonymous folios. 
>>> Value of
>>> + * PageAnonExclusive() is returned in *exclusive.
>>> + */
>>> +static int anon_exclusive_batch(struct folio *folio, int pgidx, int 
>>> max_nr,
>>> +                bool *exclusive)
>>> +{
>>> +    struct page *page;
>>> +    int nr = 1;
>>> +
>>> +    if (!folio) {
>>> +        *exclusive = false;
>>> +        return nr;
>>> +    }
>>> +
>>> +    page = folio_page(folio, pgidx++);
>>> +    *exclusive = PageAnonExclusive(page);
>>> +    while (nr < max_nr) {
>>> +        page = folio_page(folio, pgidx++);
>>> +        if ((*exclusive) != PageAnonExclusive(page))
>> nit: brackets not required around *exclusive.
>
> Thanks I'll drop it. I have a habit of putting brackets everywhere
> because debugging operator precedence bugs is a nightmare - finally
> the time has come to learn operator precedence!
>
>>
>>> +            break;
>>> +        nr++;
>>> +    }
>>> +
>>> +    return nr;
>>> +}
>>> +
>>> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> +                 pte_t pte)
>>> +{
>>> +    struct page *page;
>>> +    int ret;
>>> +
>>> +    ret = maybe_change_pte_writable(vma, addr, pte, NULL);
>>> +    if (ret == TRI_MAYBE) {
>>> +        page = vm_normal_page(vma, addr, pte);
>>> +        ret = page && PageAnon(page) && PageAnonExclusive(page);
>>> +    }
>>> +
>>> +    return ret;
>>>   }
>>>     static int mprotect_folio_pte_batch(struct folio *folio, 
>>> unsigned long addr,
>>> -        pte_t *ptep, pte_t pte, int max_nr_ptes)
>>> +        pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t 
>>> switch_off_flags)
>>>   {
>>> -    const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +    fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +
>>> +    flags &= ~switch_off_flags;
>> This is mega confusing when reading the caller. Because the caller 
>> passes
>> FPB_IGNORE_SOFT_DIRTY and that actually means DON'T ignore soft dirty.
>>
>> Can't we just pass in the flags we want?
>
> Yup that is cleaner.
>
>>
>>>   -    if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>>> +    if (!folio || !folio_test_large(folio))
>> What's the rational for dropping the max_nr_ptes == 1 condition? If 
>> you don't
>> need it, why did you add it in the earler patch?
>
> Stupid me forgot to drop it from the earlier patch.
>
>>
>>>           return 1;
>>>         return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, 
>>> flags,
>>> @@ -154,7 +212,8 @@ static int prot_numa_skip_ptes(struct folio 
>>> **foliop, struct vm_area_struct *vma
>>>       }
>>>     skip_batch:
>>> -    nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, 
>>> max_nr_ptes);
>>> +    nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>>> +                       max_nr_ptes, 0);
>>>   out:
>>>       *foliop = folio;
>>>       return nr_ptes;
>>> @@ -191,7 +250,10 @@ static long change_pte_range(struct mmu_gather 
>>> *tlb,
>>>           if (pte_present(oldpte)) {
>>>               int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>>               struct folio *folio = NULL;
>>> -            pte_t ptent;
>>> +            int sub_nr_ptes, pgidx = 0;
>>> +            pte_t ptent, newpte;
>>> +            bool sub_set_write;
>>> +            int set_write;
>>>                 /*
>>>                * Avoid trapping faults against the zero or KSM
>>> @@ -206,6 +268,11 @@ static long change_pte_range(struct mmu_gather 
>>> *tlb,
>>>                       continue;
>>>               }
>>>   +            if (!folio)
>>> +                folio = vm_normal_folio(vma, addr, oldpte);
>>> +
>>> +            nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, 
>>> oldpte,
>>> +                               max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
>>  From the other thread, my memory is jogged that this function 
>> ignores write
>> permission bit. So I think that's opening up a bug when applied here? 
>> If the
>> first pte is writable but the rest are not (COW), doesn't this now 
>> make them all
>> writable? I don't *think* that's a problem for the prot_numa use, but 
>> I could be
>> wrong.
>
> No, we are not ignoring the write permission bit. There is no way 
> currently to
> do that via folio_pte_batch. So the pte batch is either entirely 
> writable or
> entirely not.

Oh no. We do a pte_mkwrprotect() in pte_batch_clear_ignored(), I missed 
that.


>
>>
>>>               oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>> Even if I'm wrong about ignoring write bit being a bug, I don't think 
>> the docs
>> for this function permit write bit to be different across the batch?
>>
>>>               ptent = pte_modify(oldpte, newprot);
>>>   @@ -227,15 +294,39 @@ static long change_pte_range(struct 
>>> mmu_gather *tlb,
>>>                * example, if a PTE is already dirty and no other
>>>                * COW or special handling is required.
>>>                */
>>> -            if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>> -                !pte_write(ptent) &&
>>> -                can_change_pte_writable(vma, addr, ptent))
>>> -                ptent = pte_mkwrite(ptent, vma);
>>> -
>>> -            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, 
>>> nr_ptes);
>>> -            if (pte_needs_flush(oldpte, ptent))
>>> -                tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>> -            pages++;
>>> +            set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>> +                    !pte_write(ptent);
>>> +            if (set_write)
>>> +                set_write = maybe_change_pte_writable(vma, addr, 
>>> ptent, folio);
>> Why not just:
>>             set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>                     !pte_write(ptent) &&
>>                     maybe_change_pte_writable(...);
>
> set_write is an int, which is supposed to span {TRI_MAYBE, TRI_FALSE, 
> TRI_TRUE},
> whereas the RHS of this statement will always return a boolean.
>
> You proposed it like this in your diff; it took hours for my eyes to 
> catch this : )
>
>>
>> ?
>>
>>> +
>>> +            while (nr_ptes) {
>>> +                if (set_write == TRI_MAYBE) {
>>> +                    sub_nr_ptes = anon_exclusive_batch(folio,
>>> +                        pgidx, nr_ptes, &sub_set_write);
>>> +                } else {
>>> +                    sub_nr_ptes = nr_ptes;
>>> +                    sub_set_write = (set_write == TRI_TRUE);
>>> +                }
>>> +
>>> +                if (sub_set_write)
>>> +                    newpte = pte_mkwrite(ptent, vma);
>>> +                else
>>> +                    newpte = ptent;
>>> +
>>> +                modify_prot_commit_ptes(vma, addr, pte, oldpte,
>>> +                            newpte, sub_nr_ptes);
>>> +                if (pte_needs_flush(oldpte, newpte))
>> What did we conclude with pte_needs_flush()? I thought there was an 
>> arch where
>> it looked dodgy calling this for just the pte at the head of the batch?
>
> Powerpc flushes if access bit transitions from set to unset. x86 does 
> that
> for both dirty and access. Both problems are solved by 
> modify_prot_start_ptes()
> which collects a/d bits, both in the generic implementation and the arm64
> implementation.
>
>>
>> Thanks,
>> Ryan
>>
>>> + tlb_flush_pte_range(tlb, addr,
>>> +                        sub_nr_ptes * PAGE_SIZE);
>>> +
>>> +                addr += sub_nr_ptes * PAGE_SIZE;
>>> +                pte += sub_nr_ptes;
>>> +                oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
>>> +                ptent = pte_advance_pfn(ptent, sub_nr_ptes);
>>> +                nr_ptes -= sub_nr_ptes;
>>> +                pages += sub_nr_ptes;
>>> +                pgidx += sub_nr_ptes;
>>> +            }
>>>           } else if (is_swap_pte(oldpte)) {
>>>               swp_entry_t entry = pte_to_swp_entry(oldpte);
>>>               pte_t newpte;
>

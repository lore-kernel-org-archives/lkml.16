Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421641DA3D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644384; cv=fail; b=fVSHQprQIV9sBxaF5Ib5F5F7LeadxrZCFRABwJSMEgRkKGigj5965ZG0PitKQ6mmkMYmrC58RNBIdoGZ5lTCHSyg0XtqsxvQjcXy5ua7fLJCZemfVBZN5CPpSRUa33gq7Hnxu3qOvYsV+RFhFJeGio3EryIwExm7fodhnjiNL6c=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644384; c=relaxed/simple;
	bh=QmzEEJ+ubkCLxlKPPRgJ4K+P6jBCRQg55Tpk5PvtzAw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MRvlCQl5if9BatKW+6JefOcywhORSLymH1jj24eD9AQ/CkqMj2zLPJIxK8X2R/U/nSaoZiIn0i9vPiM4A6Ag+CZIeMbq6gCSr4m8G4dpdhmp7uXZRexoqTm5qE/hbnzet7sx61aAr/Lir9OozMYKI+Ls531vjuWrFifZXqPGyIo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=plAowubn; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=plAowubn; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="plAowubn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="plAowubn"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C+yeaWT500fHS/cCY3/KLgLlMpwIPN5PB5HEq4J/yCia9Hpl7RWyqgLoe6Sc/zUe8Lmn4O5sIumwoAGkKXetRdT0iXd5Fr62RwU3AHpAqi8q+SpiZSnmn8vIBRCTryRAyw0nqVmKlW6V/mRMsnsGBXarxp83pfFD9l8BiJ8sEOPt79zMedYPsbtFG9w+6KRh/7FUsAmUxuq9o+bpxWS0LHcEkud5yVSGMfJONoHIdpACE+1C9+DiJLmiR9KBZ5VyCDqpOIgTSV9HhE+YVnZODXPAENe+hdkMf5v7oTNbTl3YP7zMf0Ir+rQWv0HViOIF8l7GSIqwiHf/J+n4q48fGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmzEEJ+ubkCLxlKPPRgJ4K+P6jBCRQg55Tpk5PvtzAw=;
 b=J1Z6aN1w+wM+LrOk7MXHxO8VWh2U0171c6ZzLN+QGJKwsGCofk0zWwZxVa6hA3EGLcuIggSwJuAy9Mld15hhdx0cck5EtXyKNnRimdEJuboQ+BqVTbUFNA4raYByEbw5b24gF0gmwSjOBP4VStUrZqIKBzNyqSSMIJU0qSw0+RUloH6TmrNSLuc1GowHO4sjw+I0EFPjSC54ywCYLfqFJSlBKRkzdc5NzMD7bNfcLPbd7ju/9eIj9IOLZ2hzqKpF0IoLzXIYmFgZm1MSqpk2LWH7OFMMH/ytccUSEFzo34rkpgI92KkNpDwdiOunJ/qdCNmTXHqxCzrJrBQhOHfXag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmzEEJ+ubkCLxlKPPRgJ4K+P6jBCRQg55Tpk5PvtzAw=;
 b=plAowubnYE3uV3HB5KbtqIXXXyCELjrqJ0o0ZJCfoOEtyPiJkmsp8+rS8IQ7cEHXs0V0D3Uf5xRegq+eB0/rgunw0hBx0/CtM5/4n/xXJxceuf87ggMU6GHGOVlewIrkwAisx6OxA+PaoTpS2P9vW8/htTBtSbrwceWBi95fWVE=
Received: from DU2PR04CA0276.eurprd04.prod.outlook.com (2603:10a6:10:28c::11)
 by AM9PR08MB6242.eurprd08.prod.outlook.com (2603:10a6:20b:283::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.32; Wed, 11 Jun
 2025 12:19:39 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::a3) by DU2PR04CA0276.outlook.office365.com
 (2603:10a6:10:28c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Wed,
 11 Jun 2025 12:19:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 12:19:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQENWpPXEhVZxNdI9+7eup6zCf7+3Od59qmUswClYg7xhntWvZ/T5p3AV0jH2l8q25Nazb4FfLbsVoPXxKGcLakY9nO2bjP+82n1hY9XfZkxCZicDrHWFAAcnhq/T9Kb9t7/n9VOdIV5Dx/Z+TwIP5vSW5IE2g51Ida143B1SNmtrzuZahFGiM4RMOgC7YgAwO4phaVLvzkoLvQx+ezYDB0l2NDZLdBIFbdETeRnpLW4SUgW8tFVw+6EmH+TJbuWPeNQwABnVv5ZhtrDBqh1yRzhRQr5zd97gmZr3oPbM27o3HGuDm5Xb9CmmlDOW/T85jKLZtNpFAKvzmiwFBqB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmzEEJ+ubkCLxlKPPRgJ4K+P6jBCRQg55Tpk5PvtzAw=;
 b=gQT+35p0veN7kJRVqe5vZHehLpi56V33K5B58E4c0W9XcnbeMi8KHyfG3btsbXntTxIXs5hHFu7DYUbzzz5zZsp+zIBmAz41vLYLq37fUtnwZKGbkkhMFfL3a/xwa4ooeNgp/mn1pkCiQ61s+6Z3UBtqdYHHDhWDadK55vT8aCXzhNRnOMWiKJbOFP3U0kNcTJQEUIlshgNr0fogxMngwKe+aQXFvgH4Fep+zMcnfZ14z0qu4LiWvSS++7bTALe6J6axafVhhuFwcywM8BEMq40CXAUhahIauQEPQPvDuNYg8YStTKFJcqIeL9do2VEDIcwxsjJ6Pe4n7N9EPZsXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmzEEJ+ubkCLxlKPPRgJ4K+P6jBCRQg55Tpk5PvtzAw=;
 b=plAowubnYE3uV3HB5KbtqIXXXyCELjrqJ0o0ZJCfoOEtyPiJkmsp8+rS8IQ7cEHXs0V0D3Uf5xRegq+eB0/rgunw0hBx0/CtM5/4n/xXJxceuf87ggMU6GHGOVlewIrkwAisx6OxA+PaoTpS2P9vW8/htTBtSbrwceWBi95fWVE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU0PR08MB8231.eurprd08.prod.outlook.com (2603:10a6:10:3b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 12:19:05 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 12:19:05 +0000
Message-ID: <3878b4ac-154d-42f1-98ef-d619a455ee07@arm.com>
Date: Wed, 11 Jun 2025 17:48:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
To: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
 <4202a03d-dacd-429c-91e6-81a5d05726a4@arm.com>
 <20250530123527.GA30463@willie-the-truck>
 <b223245d-c43c-4d3e-86d4-9fbfd90cfacf@arm.com>
 <20250530133625.GA30622@willie-the-truck>
 <6cd41ae9-303d-4eda-8d64-f7dba19eb106@arm.com>
 <33dd9ce3-f6ab-4054-9245-7338f06afbfd@arm.com>
 <20250611093337.GB10885@willie-the-truck>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250611093337.GB10885@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU0PR08MB8231:EE_|DB1PEPF000509E4:EE_|AM9PR08MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d1c17e-e143-49e2-652e-08dda8e23c5b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dXhybzlJZ3FwWWpydllGOHpHZmFUMXRKU0FKcHZHeUk3ZGQ4NXV4YjFDOTNz?=
 =?utf-8?B?dDQ2Qi9CZSthR1VLRXdKTjVJUC9XRDBqVUd6YVBuUHluV2dxNEJnVjFXZmJn?=
 =?utf-8?B?aUtya2M5ZE9kanR2MTNvcUdHSVhLR3JNUTV2bXI3R0lUdWlNRTQxOU9sbEx1?=
 =?utf-8?B?ZEFwdzREL1plVDg3eXpzeVJqVXUvNTZ3THRIL0pjbGpXeTNpcDVFWGJuZm81?=
 =?utf-8?B?OVFnSWE4NmI1dmVmenhUT0krMHptUVk2cWZRZStjMGN4TXdaaWpRMEZnMXZr?=
 =?utf-8?B?TEluOEQ1T1dVSFFJblhwVHpQRHg4My9YV252dWZOc2pwQkNBNFJwYkhmK1pY?=
 =?utf-8?B?S256Z25VL1cwUTFYR0dyK3VCTU9LSzAxR0xwWVQ3MGtFYXBma1hrL3J1K0Np?=
 =?utf-8?B?SUo4c1pxN0h0TkxvMHZRNStwbThHMlV3TGtmY0NXWVVGdWlJd0IrSmttR1Mr?=
 =?utf-8?B?cHNiV2tKcS9tcVlQS1ZHazVTdUtwZUU0dDR3TUQ2OC94b2VNem1COUsrN211?=
 =?utf-8?B?TXc0d0FEendkYUdSZXJKRTU0MVh3QnVZY3VOeFdFODNLTDNodkZyUjVLaTBH?=
 =?utf-8?B?ZVFoeTNBRnRicmNzYjE5dmpMSC81YThDVXd3TUlMcHJyMS95b3MvQ0xLM1dM?=
 =?utf-8?B?WlNqU2xFRXB2aldvNHFhOGVtYnFZT21mcGZGVkc2emRGbW80OGl3Rm5nbGVM?=
 =?utf-8?B?WFNVUCtDbW8wb0NPYU15Yi9NU3A1SUNabmRNTVhYemtzTG12YkRTeGhIVlRr?=
 =?utf-8?B?WHRCM3VEWVBaQzlJdzZGSkZ3eXF1ZHpFM283OVQzNVNrSHZXWTZMNUI2SmRk?=
 =?utf-8?B?LzQweGFxRzRVMEhEaEdrNGp0cVpwZjRpN2N4cWJ0U2R6VmdiLzZlbDA0OW95?=
 =?utf-8?B?YUNGWURFWklPTXBkb1ZxVmdQWkovandBR24zSzBha1d2L040THFIeUhyNktz?=
 =?utf-8?B?USsyQWR6ZzlFU3lqK3F2K3RTL3RGaG5nUFJNMnVpLytoUzRSOGlCOHl6RG9E?=
 =?utf-8?B?aFFRSk95NXR3b2FPQ3J5OWxFcG9iUFBIdUZPVyt5R1FEK2Jzbko2WTF1aTJM?=
 =?utf-8?B?R2dyeGljckV2NlVNTjl5ejhlelRNMGZwNXJMYWR3OEphMEpweDVtenh2cmhr?=
 =?utf-8?B?ZkNpa1Bydkp6L2FKSE9NeDh6MGNvZWVySmo1c1AyZklUZjJqVVdwa1I3TE5o?=
 =?utf-8?B?ZXUyb1RNejI1eTJ2UmdPZ0JiQjArRUMxWEpRbUFub0ZsTkVqbkFwRUQxdnJh?=
 =?utf-8?B?czlaM0RCUTZVdU0xeWZxd0IrUzdvbXVMWEEyVUVuU0Vwc2wvWGl1a0lSMTdP?=
 =?utf-8?B?Y25ORHVmbnA2c09UWmJtYnlOT2cxOFY1ak9BWjNCcGZicDFyRkRxUlBJSTJx?=
 =?utf-8?B?MzVyTDlLamk1ZU9RVzVud29kc0JldjZHSVZXRlRZUDQyM0M3LzNaZGh5UERl?=
 =?utf-8?B?MDhZbExhUXdaN3ZMZDJoMnNKVGNrTmF0cjFxMkdsMFRTR1p5cnNlRXBjekFX?=
 =?utf-8?B?MXpuNmVwOTZJTG1pZzRMMERsbmRncWtNcnA3SjZrMUkzTjhkdFdJVVNpR0VQ?=
 =?utf-8?B?RlZSVGIwS2NMMTNPL3E0ckJ6WGQ5SXBUZ1FzbU5QYVRlUHZRUko0S0pRWWh4?=
 =?utf-8?B?cFh1SUhvWGVqN2pKa3lHdkRQOGtKVmhYaW5zckpsdlRReUliYms4SWYycms3?=
 =?utf-8?B?Z1RTM2Rlc3gvck8xLytMcVl4V05pRFNCNkN1WDF4MG53SUZCMkpSeERsNnY4?=
 =?utf-8?B?dnhOWWVBb0lWNGpWRnZML055cGRkRi9kcC81NFNzRi93Q3ZtTkNNem9BMGxM?=
 =?utf-8?B?RXgwNUlGWHRVeWpVQXB0SzlaRCtQdlNFbmxhMFRyb2pjbUwwMW9rZndsU3pW?=
 =?utf-8?B?eDQ2VVQ0TWF2TFNCQm9YWUorcEZPbjVvaG5aTnk1YldYRkE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8231
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75d1f7c9-c7c8-44cd-3e4a-08dda8e227b9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3R6djB3ZVIzbTF1MWIvZndJM1EwTGIwWUdCQkZNS3YxTW1HWStnQitrMmZo?=
 =?utf-8?B?STRnVXkwcGhSem44SjlJYnBDZEVmTHFUMStmTVRZV1lIYVJWWk1nclNqVVFy?=
 =?utf-8?B?Y3IvRXRRVENMK2ZaeWFXOGF3SThSRUdveFhLSHpnNENzN1lqMlNqNFVUc0hh?=
 =?utf-8?B?cDdTU3YvempOdEN5Y1FPVWJYbm1yVnF3Undmc3h0MVE1eVdnajhzYzVuTmk0?=
 =?utf-8?B?R2xCNU1vZlJRdEJHVU5VcW9JYlhaaE1kaXNxY2Y1a1FGajA0clhxZ3ZUdXkz?=
 =?utf-8?B?UDJsRm13cXN4R2VPUVJReVB1RnRNMXNFK2ptYXBNbUExQVFXeWJ3SjV0dUlY?=
 =?utf-8?B?ai9vUUQyTU1tZ282dlFCYTlLWjN1RjhkZmhwaWhjV0hzY2RjUGxTdTUyVGdJ?=
 =?utf-8?B?dExEcHR4WHdianRqVG9yY3B4VjZ2TjVjUTk3b2hEcW9Kb29TNVdWVkNEQXZj?=
 =?utf-8?B?TTJML1J6K0VuRW1LeG8wazJEaGRuZktraDROaytRM1NqeVUvYmN0bUgzMlkv?=
 =?utf-8?B?TmFTZ05lcXNUdUhhY1VLa0xjdGd5NTQyN0JCLzVCYlY2MUlGdStNd29YR1k2?=
 =?utf-8?B?Q3lDK2FaSWUyRnhORUtVQlFrR2xsMmhMUDd3YW53QWNjK3Q4NXhNV1JDN2Nw?=
 =?utf-8?B?bjdiRjc0Zm9wbXVKK0lOSmVBY0xRUmR4S3lvRzdrUkNFOTlBTEwxTzlsb0Nk?=
 =?utf-8?B?VC95eU9yOTRvUTQvU2NEbXZPemVxMWxZMlZBaWVFVFFMQlcxSTZVeUNMSFcr?=
 =?utf-8?B?UEV3QnJ5Nkl1b1BMNlgxMjJIWlBKYlJGQlFqNURrREo5WFhsK0gxdHVrZXdK?=
 =?utf-8?B?YTZtOEdldTFxM2pycG9TZkV4QTUwUDFUL2lxdzdZZ3JCMk9KUkJQdWlXYm5M?=
 =?utf-8?B?eW0xMVA1VGpYUUYycDFrVjdvckxZVVpURmtaVUIrblJOZTA3SnYxcHBOUVdp?=
 =?utf-8?B?ZnVpZUlDNUg1RGxrTEh2clBrRDZrU2IwUUhjQUtqTmZMbVkxdk5aQXF1YzAy?=
 =?utf-8?B?RWZ6dzBkdEUvYlZOcTM0RndNSFMrRGVwRmkyMTdOS0VmUWxFenhNelpxaC83?=
 =?utf-8?B?WXg4WnU0cktML0JaNU1sYU04alBJQzVJODljb1FQVHdZRzVYRXVyUkhxdnhh?=
 =?utf-8?B?T0J2cXp3K2NvaG1qNnhiYmZwOUJpL3VwL1FPdWJwSUxZOGRWVXllRDd1NTQ3?=
 =?utf-8?B?Z2xLdm8wMUV6R1JCRk1Qd0RsSHNkWVBUTUdzSTBEcXJVN3FLMUp2dDE0WGZW?=
 =?utf-8?B?ZEZqYUFlQ2pSNUxGSnRIZWVjTGhFbE5PQitWT3FrcGk4aHdsM011QWJlaGIx?=
 =?utf-8?B?RG5aTUZ5MEVjczlhVGlFd0ZTSkFQQ0w4QXNZVHF1aDk0U2lXdUFsakVCR1hV?=
 =?utf-8?B?NVVCT1hRR2pYVmRlYUh0YnV1emJ3VXBKd0FMR3hCM0taSzM3M3VxaFNTRUtE?=
 =?utf-8?B?dmpONGtsQTE5ODR2cFdJNld1cGF5aWVYN1doZVUvK3d5Y1VlZi9YZmhYcEYr?=
 =?utf-8?B?U2F2Yk91cVI0UGNzTG5WTVQ2aXF4RVYzSFlublU1L1RsT0ltUnZTRDc2enFz?=
 =?utf-8?B?YWYreTJHRUR4azdpU0hKaFArdFgvb2o4Wm83dG1Da2NIUTZsdU8yQXVJeTFV?=
 =?utf-8?B?UlBOZFVRazRPcUJsR1Z2bzd6NExoakgzMG5MUEVVdVg3dHZxZEdlRWdKUHBs?=
 =?utf-8?B?d1dsNWhPeENPdXRjUGN2QUZ2Y210S1kxWk1ZeSt2ZURSRkxuNENwWm9TVDdP?=
 =?utf-8?B?MXNjVVhXMXJWbmZPQkphWDZLK2NKdW5MRGdkRllkSWd2UkRBMnZlRkx1bTh2?=
 =?utf-8?B?aEtpK0phd2hxdEhjSW95QkNnWG9zRjZXbzNsK3V5UHU3T0ZSN0tjaDZWUlJC?=
 =?utf-8?B?MjNOZjc1R051Z29DVUJOS295MjJnVHhZY2Z3eFk4M3QrWjBpSWJIU21hNVZS?=
 =?utf-8?B?L1FCOWNJTS9iMWFoVWgwWnBGQUdpM2cvTGovYUp1dGdRa241WHZlRFh1Qytw?=
 =?utf-8?B?S1BXNThtK0NjTDgxeEFiSllHbFdSVXQwK0pXVmNYSlZ1OGdBZ25mS25wSHM0?=
 =?utf-8?Q?YRo2M9?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 12:19:38.4176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d1c17e-e143-49e2-652e-08dda8e23c5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6242


On 11/06/25 3:03 pm, Will Deacon wrote:
> On Thu, Jun 05, 2025 at 01:46:01PM +0530, Dev Jain wrote:
>> On 05/06/25 10:18 am, Dev Jain wrote:
>>> On 30/05/25 7:06 pm, Will Deacon wrote:
>>>> On Fri, May 30, 2025 at 02:11:36PM +0100, Ryan Roberts wrote:
>>>>> On 30/05/2025 13:35, Will Deacon wrote:
>>>>>> I really don't think we should be adding unconditional
>>>>>> locking overhead
>>>>>> to core mm routines purely to facilitate a rarely used debug option.
>>>>>>
>>>>>> Instead, can we either adopt something like the RCU-like walk used by
>>>>>> fast GUP or stick the locking behind a static key that's only enabled
>>>>>> when a ptdump walk is in progress (a bit like how
>>>>>> hugetlb_vmemmap_optimize_folio() manipulates
>>>>>> hugetlb_optimize_vmemmap_key)?
>>>>> My sense is that the static key will be less effort and can be
>>>>> contained fully
>>>>> in arm64. I think we would need to enable the key around the call to
>>>>> ptdump_walk_pgd() in both ptdump_walk() and ptdump_check_wx().
>>>>> Then where Dev is
>>>>> currently taking the read lock, that would be contingent on the
>>>>> key being
>>>>> enabled and the unlock would be contingent on having taken the lock.
>>>>>
>>>>> Does that sound like an acceptable approach?
>>>> Yup, and I think you'll probably need something like a synchronize_rcu()
>>>> when flipping the key to deal with any pre-existing page-table freers.
>>> IIUC, you mean to say that we need to ensure any existing readers having
>>> a reference to the isolated table in pmd_free_pte_page and friend, have
>>> exited.
>>> But the problem is that we take an mmap_write_lock() around
>>> ptdump_walk_pgd() so
>>> this is a sleepable code path.
>> The mmap_write_lock around ptdump_walk_pgd() is definitely restrictive. I
>> think that
>>
>> was put because ptdump is rarely used, I think we could have done
>> RCU-freeing of pagetables to
>>
>> synchronize between ptdump and vmalloc pagetable lazy freeing/ hotunplug
>> pagetable freeing.
> The other idea was to use a static key like the HVO code does, which
> shouldn't place any RCU requirements on the debug walk.

Thanks for your suggestion. I shall look into this.

>
> Will

Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759311B87C9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292726; cv=fail; b=MZfA18EjOv8WrAET9yh/k0edsd6LE52BFuP++/2l9lEbnMIu1C7gcj/Am/Cpy7179By87LP6GQiV5+bVCxlmZFax9jLNvhUSrzTmoZbjATunmeUVkcTY9qgigCG+lYuKhwXHHIhu1Du4EgR0hKfM26xLS9uO2sscrVqwhoW3FZ4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292726; c=relaxed/simple;
	bh=h0SqUza8OrYQg/Tp+CydV6jfuapqMR7QUF8EgYQTTKU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YxMVkC+oH7200RXJ66j3PugRxcF5UdWr/yhDXCe9I7Sd0iM7H2kkFMuhUy/YtiWmyi4fsLEvmrMC5Xc5qpExewW2u4Edk7kT6xfYF2oeOGPrjDwoYgKL7Bn6stiVP1GZL3c8YV4pDmcz7pBP48FiPFRqSeYpiQ1iMSULZ5c2MFQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=isCFKkxs; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=isCFKkxs; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="isCFKkxs";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="isCFKkxs"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mGavi3Lv/rsc2NtCHjURL07G+77oUjzmw4Ecm3JlkYja3n70BqRKUJvGcWAzEKyngaNt6V3qREY/ieRY/POgsNfubmNF+2WL3VfoqQf2iXl88JtZdco7SrSh8RWnLmoI5qTaz4oGdDkyOf+8l4Z9USgXqlQ5ODmx8frTlN3DmgWeD64rHM/A80bs48De4G5vQjeYY82B/+mgO/XNA+JH+tQcgf/rzgVM8mrxx/EhQje5UZ6tZdxSHHLi+p+VJwZjpsn+HnVPSP3S/y26b8TwPGX4GA9ggtWKme9sIuvgSfoMp102lKX+6kCXuJaYe/FUSgQoHpxINJTEbgW7xnXpxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjRnQ995OHCbtJ12McMjHnmtZNIhAsmWow4jnWG81aM=;
 b=rSewHS14oImeAWf6P+rmUjkRxviZRQVRUIJSRDiPoeuPyIb1W2Ysu70O7Gk2e/D8EvOGWBVHfYMvtc0F+eIkoiYIU/8UlIQZLoq4rF9TuiswPT0hSsoSSyZosD1lHS+rpaNHbjXLJU1fVwujch4ID44h54jAkKDXC0/qjuGGiluu+yqgE1+UzwDRUR15ZndTlgiOCs50VyXaDnExSrulHIjy0X7tbe9yx2dB4LTep9PkBe8/GGNRZZAfiya5WY/AXy5ImkAXpgGRwJ6LHp8QoF/GdsoSY6SiYPmnvZjxLnfXH3SCn6f/VNmDOOdScppql0tX6/foyC57f9g9ainm8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.dev smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjRnQ995OHCbtJ12McMjHnmtZNIhAsmWow4jnWG81aM=;
 b=isCFKkxsvsWwMk19uIazGCfBM8jCyBZ58RPRRC7yzH5+mD1NqnTcuntVSUbLEb0SiLyUJVviq2Q3Q4+vO8W3K+UBG2RSGZGJXqW644vTSEBmQbQykRaVm5+62zrx0GlNCRwz/nxVJGFCkHDW2oXpEfs4fYtsnLTszZwf/76+3PE=
Received: from AM0PR07CA0026.eurprd07.prod.outlook.com (2603:10a6:208:ac::39)
 by AS8PR08MB6455.eurprd08.prod.outlook.com (2603:10a6:20b:338::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 14:12:00 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:208:ac:cafe::2f) by AM0PR07CA0026.outlook.office365.com
 (2603:10a6:208:ac::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.17 via Frontend Transport; Mon,
 30 Jun 2025 14:11:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 14:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmBbMcGz8Qr8IWWlN/HsuF1GbMQlQ6uneaC9+qlwh3BDHeqrEVDTnZVl9JcMmU72p+5LUdEso23NSq12mF4P9ucBpVX2d37B9c8woxa5p8qry6dNMQizOcbpmKhjxEJ+WUEK+A8155t3qtSJjZeivDcHXtT5fWyRufVAD14Q6JB8DiwzeEvMfq34TvADTL48kIxD3y2zWDmsJdmKFKGTmTFvnVpxJgO4/jOeTRfpnwYnL/+zX/G4LdfRWGD0kElm3nqjRiv6p0ijvU3/ETnM4rRdj/bgfw2AAAZc0gbDCLxEne5dWeUuDb0Q05a01IgkI2vX5ZJ1PzMs7WDYCf9ncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjRnQ995OHCbtJ12McMjHnmtZNIhAsmWow4jnWG81aM=;
 b=MHgr0ZYyWVXHDjMHSG3Knzj+GKJV5QlmLjUAFjoCTx5vOchgPAOPhQ8NzG03FhLt4HXcwhJGw7h/UlmNyyEOV0GygUshRkoqxRO/VmDMh//ACDvpcoUHimPV3VVt5V8dkiu4aoQyfEkPSrJEsxL2ciKF2HzNv3Mkw1TxbxFyD7cvvB1mRUU8xNlSKA3pDHosDGHzCp5hRECCn1AWN0QJgtFlnAyIOQQel6KnyN2pTNAjoLySc8SEsRHnZrsQ9sSxJeJsvc26BmLtCRWlmAQqHejQRNoR+yn65/8xnSd17cOlKhQu1SfUbUtO9SwN01YvL/dM60YbtxVqC8WZ1l1Dvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjRnQ995OHCbtJ12McMjHnmtZNIhAsmWow4jnWG81aM=;
 b=isCFKkxsvsWwMk19uIazGCfBM8jCyBZ58RPRRC7yzH5+mD1NqnTcuntVSUbLEb0SiLyUJVviq2Q3Q4+vO8W3K+UBG2RSGZGJXqW644vTSEBmQbQykRaVm5+62zrx0GlNCRwz/nxVJGFCkHDW2oXpEfs4fYtsnLTszZwf/76+3PE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB3PR08MB9011.eurprd08.prod.outlook.com (2603:10a6:10:431::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 14:11:25 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 14:11:25 +0000
Message-ID: <73e9eab9-f95d-4367-b32a-364734d193bd@arm.com>
Date: Mon, 30 Jun 2025 19:41:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/cma: Use str_plural() in
 cma_declare_contiguous_multi()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250630132318.41339-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250630132318.41339-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB3PR08MB9011:EE_|AM3PEPF00009BA2:EE_|AS8PR08MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b52fad-878a-4ac9-bba7-08ddb7e01400
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bW5tWXNrbnNOS0VFQ1MxbE9YZVdyNHFjUklUdDNGcXdYL05QaG1XaTlTM1NW?=
 =?utf-8?B?NFdtMTYzU2I2R2NSamlUUWQ5SzNzbjZ6cWRIWUU3dFJtdkV3cEt4ajZpZ2VV?=
 =?utf-8?B?LzZvWVlwdFZvRnhCbC9RRWk2WER4TE9RUmhyTi9WZEtZcklhWGNWQXdhTllq?=
 =?utf-8?B?U0JiL04rMFZ4RTRzSXNjZmZPclRTck9CVWE0OHR5azhxYXc0K3JYMlU1Q1ZF?=
 =?utf-8?B?dVdKWDZNdVltNlgyWmtMZkowZXRRVlZnYTJLV0UxcW0wZzBKTS9VdXM3VDEv?=
 =?utf-8?B?b3E3RlhLd1E3TldZNVl3L1ZLZFBkcHpCYnlrcEVrRUtKUVV5U3Y0NU94QVdN?=
 =?utf-8?B?QUkzQzd6a05aaDNxRWErV012SXBoUjUvbDRMRmthSXhQcGxJSmZ0eTJaM0Fu?=
 =?utf-8?B?LzhNNFRTSlpZT016eHhaY2FIMmkzMFoza2xxVGczWml3dGYwVExVUUxZajNi?=
 =?utf-8?B?MWZNREtEVVB2UmpUMXhqWFNpbWhyb1VCNmVQUjNJUkk0cnhBcVBLdlFOTkFh?=
 =?utf-8?B?SzE0NlNoMzB0RDN5L1hIUjZyU1k2a0tGZTdIcWdUM3Jvd1ozRFZCOGpJNExj?=
 =?utf-8?B?cWwzMmdhekZRaU1JL2g3alJidkVHQW9oalJTcVltSmJCZkp3cnlWNkxyS0NN?=
 =?utf-8?B?R3VpL3FQYlNha1gydnJiTmwyZ2laSkhDQm01M2QzZkd6Q09kMXRoOWZXZzlE?=
 =?utf-8?B?dDUxaW43aHB5S09CWjdjVXNObEdpK1hyU0lYMkdDS3lSVHgwK055U3dXTVZu?=
 =?utf-8?B?UVNoYlU4RDlqMnpwY0lHbEhjelhkTGJkUjZkNUdFVlk4Z3hsQzVGUE52eEJH?=
 =?utf-8?B?UXlLVHpUSHJjTUlnb2ZHSTJYcE9JVWVuODlQZkpRYkNtR1ZwdjZraGhaSXhM?=
 =?utf-8?B?eFh3alUxMHJqQkhYQzRwQlIzZzBQZDQxM2pOaDdja3ozcXllLzJ0a2preVAw?=
 =?utf-8?B?QnpNRXhNT05mZ3AvNjJXaWYwZEdvQWw0eWRvMjZXYkhVZkhxYXVkZVBJK0hL?=
 =?utf-8?B?UnZrNUN5d1lMaGpiaUY3cHk3aHV5eGtaaitGWUZpUzFqSE5xZmR1R3BIR0pn?=
 =?utf-8?B?K3hNZkRtcmxwSENZQlZDdU92Yk9kdVh6VnBvV096NWNNOXVoOE01a2o1ZENF?=
 =?utf-8?B?ZmQ4RTU2RVdrMUJHdDhPWWlnRFp5ZW9MVWFRVTFWOTNJN2E4eHJlWEdWcDBi?=
 =?utf-8?B?MVhKdmVBVzJ2ZC80SDZ3M1IralhmOVRRYTZ5RFpqcWNDMnJidnJzWDNWdU44?=
 =?utf-8?B?UVlqbjAvSzRhOVRJNzUvRmlaWmcra0lmWU9zTnJKUTZZR2xRelUvZnRwMUlK?=
 =?utf-8?B?cmZiTzRSbERkeHhPNVRJdjczNGxvWTFUeGo5cjRwUjVUT1lRRlFYZjc0WW93?=
 =?utf-8?B?bVNXRFpaMzZ2MEwvTFEvUDlmNG03QWdLNGZRV0ZYeTlRYnVPUjdlN2hNTEF1?=
 =?utf-8?B?OVc4dUpSQWFSU1k2clNUOWprQkEydllHdFZCT09LekJETWNPOWhXV0lmRlBs?=
 =?utf-8?B?U210OTE5UVh2bFlxenlOOUdGRHIxbjZ0cjVzOUh3V0VGUlZFdHFKR2ZsRzF2?=
 =?utf-8?B?N3JaRThwZGNMOHYxWjQrR0F5NWNUYU90YmgwOEFVM1d2MXJiTWJRTnQrVmJh?=
 =?utf-8?B?ejFiazVTNDcrRXVIN1gyYVIwSTBIRmo1QlZ5M3pDTWpmdmd3QUFMaWRZTmMr?=
 =?utf-8?B?Ni9PYXhENkkzOXpXUDAvYmZ2SExnUmV4R1prL1JJemNoSENVS0lOSWI0Y0R1?=
 =?utf-8?B?Y21LcEU2YVAyaFY0clIrSVpJOE1KUDNZc1htbUNRUXlVMWFTdC9OS0hSMHo3?=
 =?utf-8?B?WnJrU25YRlNjSDlONHprbllQa1grUlhJMTNJSVZ5bUF0cmRmeFo1QnlqUFB4?=
 =?utf-8?B?NVFzcVZyYW9GbGdFSTFUd1FIaGY0YnIvQng1dFpLQ0dyM1diTFNGeUhMQzdt?=
 =?utf-8?Q?fxc4f9K07G4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9011
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eab87b3e-a704-4373-4931-08ddb7dfff92
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|35042699022|82310400026|14060799003|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVoyMVNLSnZrWmRScHA2WU9Od01rYm1oVlllZnh1N29WeWorUjlrTVpTaWRp?=
 =?utf-8?B?QWNRUGU2c2pscDFFSHZKU1IwNHhpOC9uZlowQmRxRGdHaTRCeG0wTC9MYWRU?=
 =?utf-8?B?MzJzRjJETlZWeU5YTnluOWdlUE5ReGt3Y1cvWS9pZUswWkhKTTdtOUp5Njh4?=
 =?utf-8?B?V1dWcGpNbEdxajhsS1F5clhWUyswNUtZRDF4b2oxeGhiQVJ4WHpTMkMwaEdL?=
 =?utf-8?B?ZG8zNXhCYStmWi81bHBXSkZoSG8reHVaNUQ2dXVZTXd6YklwaS9RN3NDcDM3?=
 =?utf-8?B?cDYzSDEzYmMrOXhTZUs1Qzg1YjBmL0tSbGFDQVBqeUNXQ3Z1SSttcFFscEJS?=
 =?utf-8?B?TW9BSUpRWUs2bzgxMWVnWlNhL2xnSTlwWW1ranErS3FqYTVWckJZM24wQUls?=
 =?utf-8?B?VFRRTUlFUmc3NjVybHlvekE4UGVrYk9LNnpiNFEwelpPSitYekRrQ00xUCtw?=
 =?utf-8?B?TnJDSmVNNWh5aTB1VHVlb0N1bTM5WmJobkxOUGJVbGg3bVJtaVByM1gzTE5U?=
 =?utf-8?B?WFZXaTFuUkNNVnNCcnlvc1Q0cEx6UDNkY1Y1b0VnMExYcE52Sk10YkdaQmNi?=
 =?utf-8?B?cWpQeCtyNXhxR3VCbnVnUERhb1N3dllwZmtwdkIyeEJTNEcyV3VZUVNaM2g2?=
 =?utf-8?B?b09HMmtmZHplWksweFdyZmRYZTJCR0Q1RGpVZFMycit1cXVIWUVNSFM3aTRx?=
 =?utf-8?B?MkRyeUlOcVBVQ20wbzN0NDBxR2hxQWNYbHc2bUV0UDdROHFMa2N2Z1BYa3V2?=
 =?utf-8?B?SENqT1hTVk5BY3NFblhReGljakx0VG5tbUZNZlFSVlU1UlBVOGRndHdlUUZj?=
 =?utf-8?B?MmRoREpPa0J3WGJ2ZlRPZTJDUlhhYzFQVUtGVXZKdXRVNnJNeVp6WnRJbFpz?=
 =?utf-8?B?cTVBMmoraC9CS284V01uSWRTNi9KZGkwQTR0c3NHZEJFWkFobFlmcExFU3Bl?=
 =?utf-8?B?N3RqQ1BPNkZabmtGdXpFK2JQVnVMTXhoekkxd3JiZlhWMnRwVUFxanlnN3FD?=
 =?utf-8?B?WnhGTXRtaDF5akhNc1FGL2JVby8vK0JaUUh5dnZBVytVZUZndEJXSFZ0T2dz?=
 =?utf-8?B?VDg2QzlxWEdlR0s3OUFsZTRoT1lKRWo0RHBkMHZZM05PdDFKVkVoTFVZVFZa?=
 =?utf-8?B?d0JWMXU3Ky9JNzZLeEhiWDFYclVZbVc1TTdEdFBkeTc0TWFaY1VzM2ttb1pQ?=
 =?utf-8?B?S01jRU45RVNyeEg1ODNNa0pyOE9yTmJYTTJDYjBSZlF6bHIya01iNTl3ZDd2?=
 =?utf-8?B?cWZweVZidXBvNHhsbzVwa3BOVHBGL3JKMVJReUtDTUp4dWJCUkM0VkRxLy9O?=
 =?utf-8?B?UGdITlptWjh2YTRJQVFDUE5HR0JZcHppejNRUG9udzhCK096YmZ3U2lDRXVV?=
 =?utf-8?B?STdTWWZEclVGTU41R0xpbjRWMDBuMzJraGUvaTBBMUczRjdiYWZ0OTRRbWVO?=
 =?utf-8?B?dHVTMGUzYThFMDdKc0xQei93RTViNGIxN2VpdnFLY1hwbFIvZ1dmanl2bEZ4?=
 =?utf-8?B?SXdmWURVY01DUVIvVE9xWkpzMVNIZXhQSG15VHA5Y05XcE5IeGVXWVVBTWhM?=
 =?utf-8?B?bzZzSHhlS1luRWtZbXFqVnhDNU1tR2NFcnZHZXRrcHBBL0VOTHRDMlVGVUF5?=
 =?utf-8?B?eUdWbVlxbllCRjhjMUVNaVJCaTFiREVvUkVoNlBDN2JZaVJ1aURSMXc3S05p?=
 =?utf-8?B?d3ZlbXlMRzdTSTVsdElYTmtBZmVsanh4Z2J5THJCQXlwWCtWVWgyUURFL0V2?=
 =?utf-8?B?WnY4aG5QRjdqUm5ZZzVwcTNqYmZxaC93SzFITm14MVQ4V0JPVzUwTDY3K0hE?=
 =?utf-8?B?SDlSbThYVEdKU2thZGhUckUyUmpsNk5LRy9rSXZvYzh3cERLbE92WWhJN1Zu?=
 =?utf-8?B?S0NIeW5zMWdkVnR4T3Z3Ymp6Mm1GUERnRDBnRGJKTmxWWnhtU0VoTjBEOGVE?=
 =?utf-8?B?UnJYTXVMaUpDS1QrR3F1SkVtN2k4cjQzUFY5VVgrd2Ywb1BEK1dJWThKQWJy?=
 =?utf-8?B?aXE0SklNM0JWa3JWbW9CMThkU0VNNElLQVhEVmx6ZDdVNUY1TlR0MUo2M1lS?=
 =?utf-8?Q?b9mTaR?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:11:59.1600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b52fad-878a-4ac9-bba7-08ddb7e01400
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6455


On 30/06/25 6:53 pm, Thorsten Blum wrote:
> Use the string choice helper function str_plural() to simplify the code
> and to fix the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
>
>    opportunity for str_plural(nr)
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   

Thanks for basing on mm-new, I have tested the patch.

Reviewed-by: Dev Jain <dev.jain@arm.com>


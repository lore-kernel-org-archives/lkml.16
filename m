Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2098.outbound.protection.outlook.com [40.107.22.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B1265CB0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411089; cv=fail; b=Q+qMVz1UYpO/MCoh6tP1QpoedYVlJDtVr5EwJqRlz4kojbmtCr8nadGzLmDlgqSbSq/O/oVrdTVEiM3ikUoekuvQV9ldI0zJCgZygfNXuGZrG/+Fp171yhw6unQKWqJGRTn5qGSGaEnS2i08UZwojufdL4velWkFPBTOx7As4wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411089; c=relaxed/simple;
	bh=DJkBDKvabJgkIUd452IXAFuOq9glxzMhO0Qfg2I7osM=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Depb8Uah5sxTaRy9W+TzAEaGpqExDknoD5PiU4DASLA4Mmz19vpLrbVAeDFs4s8gjfiHrpU+bdDrMDuO6JWI0IHlVjmXiu9K5x7rRiQUMgVi6LKaMJtiCfbS6Wz794tNxXdMm9lhcQXtC+L1ADiT7x6t+Powt8OfJsVAVdAeq94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=vQuz7VCU; arc=fail smtp.client-ip=40.107.22.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="vQuz7VCU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8+RO+OXhXp4WGItLkeqKGwj5ykJloPNnfhu3GqKpBI10faGcJfymFcUwRmtmA29Iv4Hh2GaJfEhCpXFQ/lz9IaPp+fg7Aj9S1tMJB/QEFMAsC7OOkNZkBaOe1qNDVnZdYd6AJ0iJaq7/7vcwAid209YZ+JQ/v3KWH8v7v2SqNV0iK9JL1n9t5oxB4AUhfXQfYOeDKVoavSVSXuzPuKdJbX83bmKtEjecj/l3pgTIahcL+iC83bE12unUmzFF1+8yeXu0hIgboFUMsLn6uYLBSzK9e4g8fZAAyAoBjkUrRr9vaHSES2uYFAeybdr5WnWczm3PuxyyPFPqZ/2K67cTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAtg18+qs58u5VPKyBJAtCcLHN4dOr+c6Iz3Y5yyz10=;
 b=NdJ0RuqeaauGmi8hEbegUAxIR/LXdVBLMYmYrymAn4V8r7+zNU8P8hhNHv2U8/zrsjgQ6q0jhdCTCwx9itYSEFcR7gl37v1E0PPItYjDMT3JownbZ7d3jYSVmMWi8EGk0TTQP7PVFkbbgxBzazmYqv1eOsaqMDId9FirBUKyGfy4nPz14yGZOHym+yCo6v9e6F8nkF8AwCE/eRZvNNIdjMbjNddUYc2AUGa2cUyAuON4BzuY4zU+2KiKdbs/XAEc8JOwPO1jLAv4aS7lYLhaUlqAI1u51giEZ1rknW+dT1MR6iy8t/e1vNEeSX7noTLm9/0fbBa1xss7qDf5KIRLXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAtg18+qs58u5VPKyBJAtCcLHN4dOr+c6Iz3Y5yyz10=;
 b=vQuz7VCUo1mUYeHAsiborpYD8bkYUrFB7tfbA3XBGiKEISE/Z5rld/xeZBkQTwIne01nCZZMQvqhdO7gCQ1b6ZokhsWTb4gCjQAVzSu2rqZ3ZjNtGNu/ISMe2P2F+UGvASUBUf7LbvNkG6gbsAjAtBFWYNw1M4zoNc8VbzIIcXh1jLaew6/Aa3euhDq5SW1ZKMdiyOJ8XXeBeXdQ2ZVbJiF6dHYQvoVQKivPlapf0gYJ2qS6gqY8c1mqM5dj2syOH7QWuANAaPAw2RbhU9Gk+eosBdbtgewRsY/Gzoe9e/szN48j+Yrg3BJcpsCUgv3Q5oAC2kDlbvgy182Yue5J0w==
Received: from DU6P191CA0050.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::13)
 by GVXPR04MB10875.eurprd04.prod.outlook.com (2603:10a6:150:220::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 12:24:41 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::73) by DU6P191CA0050.outlook.office365.com
 (2603:10a6:10:53e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 12:24:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 12:24:40 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (104.47.30.109) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 23 Apr 2025 12:24:40 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by DU2PR04MB8712.eurprd04.prod.outlook.com (2603:10a6:10:2df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 12:24:37 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 12:24:36 +0000
Message-ID: <8f10a435-acd9-454f-8d2b-22ce894d5fb2@topic.nl>
Date: Wed, 23 Apr 2025 14:24:35 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] phy-zynqmp: Postpone getting clock rate until actually
 needed
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: linux-phy@lists.infradead.org, Kishon Vijay Abraham I
 <kishon@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.7a5992b5-aa78-4b18-bf5c-70f893b58f48@emailsignatures365.codetwo.com>
 <20250314150431.28319-1-mike.looijmans@topic.nl>
 <20250422221802.GB32759@pendragon.ideasonboard.com>
 <f3051d1d-ecb2-4a93-ad6b-76ab7a5538af@topic.nl>
 <20250423093008.GC17813@pendragon.ideasonboard.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250423093008.GC17813@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:208:154::15) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|DU2PR04MB8712:EE_|DB5PEPF00014B91:EE_|GVXPR04MB10875:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aba79ff-e3f8-4cd6-50c0-08dd8261d27d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VndEQU4zeW4yQXZEUTdvM3p6L1NyVVFGL0h4c25JUXU4MjlTZmFkZGoxSHor?=
 =?utf-8?B?ZDlzRjBzbkNkVVJsMjhtNzh0eXV4MlA4YjVEaE9mNzh3RXJ2N0tld0ZhZW5m?=
 =?utf-8?B?QXhBdWNWS3Z1VGxPNG9BbVdHelA2cWQxUklBVjFTT3ZhNlE0eUpPM0JOUFpO?=
 =?utf-8?B?T29PSlFWQnhlZ1F5czY1RkdsMy9hN3lsdDNYUlRZVHVyRlVQd090SEtld3RI?=
 =?utf-8?B?TXBpQVAvTUpxZHp2Zi85WWU1K1F6OGJ1TGFpSlpwRFhpaEVSL1RUSVkxejl4?=
 =?utf-8?B?YmR2TlN5bG9CL3c2L09DNDRhZ25LN1RMZ1VsakY5WFBPeEFaTkU3T3o2cHBD?=
 =?utf-8?B?Q3RTZzZTdXV2SVZseGYyWHhuWnhRQkNxWmk3cGluTWgyaFVJajNIdE8xdDZx?=
 =?utf-8?B?aWxRaklTRCt0ak90ak9aUHc1cEg3QmhQd2YyL1FuV0ZsYm8wR0ppWnRaMUlm?=
 =?utf-8?B?K0RpUVU1SUxlM05TeldjOVdocXhLTW1NVVNwbVg3aG5aZE1OeksvQ0x1bXl1?=
 =?utf-8?B?TTdOSWJNRXZnbWRlTk5jamxFbXNRa1VoVDY3Nkc0YzFLRjJEd1ZkTVJmL3Nt?=
 =?utf-8?B?dXl1SUVUdXpVZG1HKy9pTTdBM0JnUTg3Q1FqREU1MG9QQ1BoSUFTUEFheXpq?=
 =?utf-8?B?MmRYVlFtS0FMWFBTY3B1NWg1Y1RFT2F4UkdnZ1kwalEyUlJaME5ZdHNmaHc2?=
 =?utf-8?B?cEY0Ky8yZHBjSDRKOEZxV3J5L3dIR2hZMHcxazJtYlEzcnRNbDB5YU5ibWI0?=
 =?utf-8?B?VXBWdFppZmFyY05lYXBNSmpGYWhzNU9zRTd5VXhLN0FWNGQrU0NuV1RBZ1l1?=
 =?utf-8?B?ZjZGTmlHL01RNWdGczNoc2FWQ21CR1BDYTVLL0ZaNG1RSDlrMTFHU0Z3TkNZ?=
 =?utf-8?B?TVlIaVg0c2hMU3BESjhyenJwQzYvamNkOGNNYTlENlNweHc1d3Nrb1FtNWsr?=
 =?utf-8?B?U2pEbTFRdGN2dlo5MDd4SDhzcWE3dU1mcHZ5eEdYTENsVDhqVk5XY3VLS1dr?=
 =?utf-8?B?b0pRWDJRU0I3aG92WjBHNTgxaFJ4b24yK1haSkxrQ3Y3WDM0Z2R0QVhhejRr?=
 =?utf-8?B?WEg3aUs4U3UxZFJseDNWUUROamtaUHkxOE1nVHFNS2xWeng2OUJRc3FxQTVZ?=
 =?utf-8?B?aGN4MHRrMEFhSzlXNjFVUjZEZUdsYVVjdUlaMTFONnBIM1Y3OXJuQjlWZllh?=
 =?utf-8?B?QlFzUzVtblNKd0J1VENLZ0czT04zbjdBcEJVNDZ5QjBDeXA4blU1SWhnM3FS?=
 =?utf-8?B?ZlRlNFFadzN3V2RUNjhMMURyTmNwWFozNDYyQmNXZU1WZ2MyeDRXQWtHNzBF?=
 =?utf-8?B?aXFUVmxZQVZrUkxZS2FoL1UwQnlrb0hIMW9lWHJ2VHlnVHV5QjNTTGJQUUhE?=
 =?utf-8?B?d1Q5NHNLNmNpZkFkbVhlUzdjei9hSE1CTjVMS3VzV1hBU0NYN0YzdmRTcVR6?=
 =?utf-8?B?ZkV1RjB2ei9MSzRXeXNqRUpvTjF2WGVXczQvR2RqRGwvN0tLWFpidXArUWh0?=
 =?utf-8?B?a0NJUTFsZWlFWVQ2YURXc3pJUWFlSUpjQmYyYW5zaDlaQitaSW80dm5sSlVT?=
 =?utf-8?B?QWM1MDlwZkgzaDhrRUtYblZlUDgrUlFCZ25ZRk01ZGZkMUszaU1NUExmUW4y?=
 =?utf-8?B?a0Z5YWY3SW9GZm5oQ1BTa2k3TzNudk5ZbVVPQUZlWkpsamwyQkpXQjl1bmRp?=
 =?utf-8?B?WUdzL25ic2hQOXhpa3pJQzA4Y2xSczNYeldpSk4zdVg4WEVQbk9NZ3J2UzMz?=
 =?utf-8?B?UGdyVTZuQlFRNzdHeWd5Z0R3V2pJRVFXdnk4ZVVWdmpQdEVQOCtuMlIveGdP?=
 =?utf-8?B?K2dvTWV0Y05iTzZIVys3bHFBem93bUkxY3dDRTQ5T2p4eVU3dHM4SXloSnRX?=
 =?utf-8?B?ZkYxVFcrNS82c2xOMy8xTzBreHNxYThxL0NRcVdoR3FVZUh5c2EzK2l4cmtj?=
 =?utf-8?Q?2mPUhYOQLtg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8712
X-CodeTwo-MessageID: 2de91399-a3a0-4cd6-b1a2-340a8264f5f5.20250423122440@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c66a4672-b613-47ab-fa1d-08dd8261cfda
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|14060799003|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFV5bHI1ME91VjZ3YWZuY09GVmdMcVFabndSa0VYRTRWK2ZGUDZXd2xWVTUy?=
 =?utf-8?B?b2FueHRPTmVLWFdlbkkxa0JjTDNsdCtuQ2xJVGx5REx1MEVkV2U2MDlPd3N4?=
 =?utf-8?B?Zm54YVc1VCtFUXNHWlFGNHF5b3hFa3dueUc4ZXN4VU9URnFRU3BWVUtpMkZV?=
 =?utf-8?B?KzVTQXVIeHVEek9pVEFTMkd4T3F4eUN0V1pWbmd4UG1pU0hXUHN5U01reE9Q?=
 =?utf-8?B?NDdBaHd6YmlablY0c1RXNXpydjFNdWp2cWVNN0V5aVZCQTdpUjJzUUZ0cmRn?=
 =?utf-8?B?dDNBRXc0WlRMMDI1VkZnTzJTZmp2ZXhBdGVTeFpETElZVXN3UWFLY1R3aS81?=
 =?utf-8?B?cVZzT24vajk0RmJIV01ENWZTS1FSVzlCcEcrQXRyUXBGeGFpWjhMMmhVMm5R?=
 =?utf-8?B?M3B4NW1UM2JVQlZQWnJIYWt4R3BUbFBaaDFqR0lOQjdpVGN1TTRxVERDTVBh?=
 =?utf-8?B?dWZtSTZPMDVlQTV6M0Z3QU5WS0VNVmdQNDdNcjErbFgrUHZ6bzlIdzBCZW0z?=
 =?utf-8?B?dnMvandjeXM1V2lyM3YvcWFWYm5WbTg2Kzg3Ymc0SzJBMitIYXY1RUpxU2k5?=
 =?utf-8?B?cmZIRFZDQjhBWEF1MkduaWtHWDlRZFZDejh2RFMvZmFaQ3RQUGU2aGdPMm9j?=
 =?utf-8?B?Zmt4N0lBc1lrOVhpSm1OeVYzakJ3cWJrWW1TZ3lRaUR4akVEMUZya3VaM2dx?=
 =?utf-8?B?eVZPODdBZGtQek5EM1RlcHZMUHM5dEV3b3NmMHBzaUtMOStBY1RJam03L1Q0?=
 =?utf-8?B?aTVEMEtVRkFqWWlORklkRUtCVW1PV3JUaGpzV2k3S1dUQ2xlUVNLK2pJSWl5?=
 =?utf-8?B?cjliZTduSnVsQkZLSzlhVDE3d1QzT2pKRGZjR1JyUEVOYzNVTXo4MGRaaWNS?=
 =?utf-8?B?bCtFdzRQV0pzTGRmTXZsZUpFMVVSSk9icXBYem1JVnhsVzhSV0tyRzdnM1V3?=
 =?utf-8?B?TGZBUWppa3U3Qis5UTNGVG5CUGJodmVpcmZHMGVYTitTRXFzSWJjMFdwRmhP?=
 =?utf-8?B?eGFOMzhDdm5FNFRsU2VWYSt1Y3Y2MmJ0ZUFxZXFXZ3drQjFrazBwMS9NVGVh?=
 =?utf-8?B?RFJ3L0RxcUVmUnVqR05IZFltQmhhU2xHbXRwNFg0VUdRZ1Roa0NiLzBYTFVz?=
 =?utf-8?B?QWE5bmQ3VjQ0dnp2cyt6b2JqS3Q1RWRZRVFOeVNGbmVYOGsyNjZRRldONEpw?=
 =?utf-8?B?bDRKZERwSGdOWEU5Z0lWUFpWSUxwN09GTldPbndyNDE4V0taOVJZTUxHdHZS?=
 =?utf-8?B?NTdORG1ESktFSEpCRFhGWk9VVzB0NWJOd2tma1N3N25sRk9EUnMzUmFoTzZt?=
 =?utf-8?B?Y3BRQk96M3ZtQ1JxSTJheElnQVFQMFkxeVFHZE9WRmNiK01FeTJsMDZNR3J3?=
 =?utf-8?B?a1o0aTN3c2RIck91a296d051QTNObmkrNVE1cFRDRGVoOWJNYThsaE9RVXZ6?=
 =?utf-8?B?blBXYnJmNVN5V2tFNWJFWUQ5MFpmSnBmeWRoQUtMTXMwSFhyYXFkeWlvWHdH?=
 =?utf-8?B?aUhENk9rNnVoUUhPVWVrTmpkbVh4Mk1NenVPNUNIS29WWmhLeEN4WG5rajFi?=
 =?utf-8?B?T0JUTjB0MVhObGFOUzE2Umw1dHd1R3l0SnhBc2VWUG9BQWZBbXhNSEtHOGlY?=
 =?utf-8?B?ZEwwS2F5OFRTc2lxMkIyTkxtWGtMTzhpWHQ4MFU0NGxoZWtWeVlCTGUrM1l6?=
 =?utf-8?B?SGptbHp3ek1NOVExQm5SREtvNjI3Z3J6a2NZNGRMR24xL0ZKS0pjOUJPNm9l?=
 =?utf-8?B?bXpYL1Vvck9Cdm10NHUvdDVVNE1GSFFKWjBYdmZ3OVJ5Rk1oRXJaVm5EaWEr?=
 =?utf-8?B?Y2ZkcnRrWTJlb2hxMi8ySzVZZXJPcmJoLzlydDFFdzFUZlVwZDl0UFRHR3Fw?=
 =?utf-8?B?b1h1Zi8rYjlJNThrdmpuK1NkSis1WmEvZGEvR3paSTJHVHVUWmRCMXoxRFNo?=
 =?utf-8?B?ai9qOVI2UitXZGowS1hqMnRiK2M2Q1F5NHVqRmdtMGthOUJBenBwSEt2TEs0?=
 =?utf-8?B?aFB2Z3lBZTlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(14060799003)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:24:40.9687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aba79ff-e3f8-4cd6-50c0-08dd8261d27d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10875

On 23-04-2025 11:30, Laurent Pinchart wrote:
> Hi Mike,
>
> On Wed, Apr 23, 2025 at 08:59:43AM +0200, Mike Looijmans wrote:
>> On 23-04-2025 00:18, Laurent Pinchart wrote:
>>> Hi Mike,
>>>
>>> Thank you for the patch.
>>>
>>> On Fri, Mar 14, 2025 at 04:04:18PM +0100, Mike Looijmans wrote:
>>>> At probe time the driver would display the following error and abort:
>>>>     xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clock 0
>>>>
>>>> This issue was that at probe time, the system has not decided yet whet=
her
>>>> the GTR is to be used for SATA (150MHz) or PCIe (100 MHz).
>>> At what point does the system decide that ? I've only used (and tested)
>>> this driver for DisplayPort.
>> In retrospect, yeah, the commit text could be a bit more elaborate on th=
at.
>>
>> This PHY driver probes before the I2C bus which contains the programmabl=
e
>> clock chip that provides the GT clocks for the PS. This isn't a problem,=
 as
>> the PHY lane won't be needed yet.
>>
>> When the SATA (or PCIe or network or displayport or ...) driver probes, =
the
>> clock gets programmed. The PHY lane won't be enabled until after that.
> Would it be possible to defer probing (as in returning -EPROBE_DEFER) of
> the PHY until the clock is available ?

Come to think of it, the DEFER already happens at probe, after=20
devm_clk_get_optional().

The issue is that the PHY doesn't know yet which function it will have=20
(SATA/PCIe/...) so it must also wait for its client.

It's also a nice code cleanup, as it removes an array of pointers=20
(refclk_sscs) from the device data struct (xpsgtr_dev).


Now that I'm looking at this again, a good next step would be that if=20
the PHY doesn't particularly like the frequency the clock is set at, it=20
should try a clk_set_rate() instead of just giving up. When the=20
connection with the client is made, the PHY knows what frequencies are=20
acceptable, so it can program the clock itself (if the clock is=20
programmable, which is the case on all Topic modules). That would get=20
rid of the assigned-clock-frequencies in the devicetree. A much more=20
logical use of the clock framework.


>
>>>> The driver
>>>> doesn't need to know the clock frequency at that point yet, so wait un=
til
>>>> the lane is actually being initialized before requesting the clock rat=
e
>>>> setting.
>>>>
>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>> ---
>>>>
>>>>    drivers/phy/xilinx/phy-zynqmp.c | 61 ++++++++++++++++--------------=
---
>>>>    1 file changed, 30 insertions(+), 31 deletions(-)
>>>>
>>>> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-=
zynqmp.c
>>>> index 05a4a59f7c40..e29e3e51d380 100644
>>>> --- a/drivers/phy/xilinx/phy-zynqmp.c
>>>> +++ b/drivers/phy/xilinx/phy-zynqmp.c
>>>> @@ -222,7 +222,6 @@ struct xpsgtr_phy {
>>>>     * @siou: siou base address
>>>>     * @gtr_mutex: mutex for locking
>>>>     * @phys: PHY lanes
>>>> - * @refclk_sscs: spread spectrum settings for the reference clocks
>>>>     * @clk: reference clocks
>>>>     * @tx_term_fix: fix for GT issue
>>>>     * @saved_icm_cfg0: stored value of ICM CFG0 register
>>>> @@ -235,7 +234,6 @@ struct xpsgtr_dev {
>>>>    	void __iomem *siou;
>>>>    	struct mutex gtr_mutex; /* mutex for locking */
>>>>    	struct xpsgtr_phy phys[NUM_LANES];
>>>> -	const struct xpsgtr_ssc *refclk_sscs[NUM_LANES];
>>>>    	struct clk *clk[NUM_LANES];
>>>>    	bool tx_term_fix;
>>>>    	unsigned int saved_icm_cfg0;
>>>> @@ -398,13 +396,40 @@ static int xpsgtr_wait_pll_lock(struct phy *phy)
>>>>    	return ret;
>>>>    }
>>>>   =20
>>>> +/* Get the spread spectrum (SSC) settings for the reference clock rat=
e */
>>>> +static const struct xpsgtr_ssc *xpsgtr_find_sscs(struct xpsgtr_phy *g=
tr_phy)
>>>> +{
>>>> +	unsigned long rate;
>>>> +	struct clk *clk;
>>>> +	unsigned int i;
>>>> +
>>>> +	clk =3D gtr_phy->dev->clk[gtr_phy->refclk];
>>>> +	rate =3D clk_get_rate(clk);
>>>> +
>>>> +	for (i =3D 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
>>>> +		/* Allow an error of 100 ppm */
>>>> +		unsigned long error =3D ssc_lookup[i].refclk_rate / 10000;
>>>> +
>>>> +		if (abs(rate - ssc_lookup[i].refclk_rate) < error)
>>>> +			return &ssc_lookup[i];
>>>> +	}
>>>> +
>>>> +	dev_err(gtr_phy->dev->dev, "Invalid rate %lu for reference clock %u\=
n",
>>>> +		rate, gtr_phy->refclk);
>>>> +
>>>> +	return NULL;
>>>> +}
>>>> +
>>>>    /* Configure PLL and spread-sprectrum clock. */
>>>>    static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
>>>>    {
>>>>    	const struct xpsgtr_ssc *ssc;
>>>>    	u32 step_size;
>>>>   =20
>>>> -	ssc =3D gtr_phy->dev->refclk_sscs[gtr_phy->refclk];
>>>> +	ssc =3D xpsgtr_find_sscs(gtr_phy);
>>>> +	if (!ssc)
>>>> +		return;
>>> Isn't it an issue that we now fail here without propagating an error
>>> back to the caller ? The function is called by xpsgtr_phy_init(), which
>>> return an int, so I think returning an error code here would make sense=
.
>> Agree, I'll make a v2
>>
>>> The rest of the patch looks good to me. I would however appreciate
>>> feedback from someone at AMD more knowledgeable than I am with the
>>> hardware. Michal, could you propose an appropriate second maintainer fo=
r
>>> this driver ?
>>>
>>>> +
>>>>    	step_size =3D ssc->step_size;
>>>>   =20
>>>>    	xpsgtr_clr_set(gtr_phy->dev, PLL_REF_SEL(gtr_phy->lane),
>>>> @@ -823,8 +848,7 @@ static struct phy *xpsgtr_xlate(struct device *dev=
,
>>>>    	}
>>>>   =20
>>>>    	refclk =3D args->args[3];
>>>> -	if (refclk >=3D ARRAY_SIZE(gtr_dev->refclk_sscs) ||
>>>> -	    !gtr_dev->refclk_sscs[refclk]) {
>>>> +	if (refclk >=3D ARRAY_SIZE(gtr_dev->clk)) {
>>>>    		dev_err(dev, "Invalid reference clock number %u\n", refclk);
>>>>    		return ERR_PTR(-EINVAL);
>>>>    	}
>>>> @@ -928,9 +952,7 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev=
 *gtr_dev)
>>>>    {
>>>>    	unsigned int refclk;
>>>>   =20
>>>> -	for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_dev->refclk_sscs); ++refc=
lk) {
>>>> -		unsigned long rate;
>>>> -		unsigned int i;
>>>> +	for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_dev->clk); ++refclk) {
>>>>    		struct clk *clk;
>>>>    		char name[8];
>>>>   =20
>>>> @@ -946,29 +968,6 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_de=
v *gtr_dev)
>>>>    			continue;
>>>>   =20
>>>>    		gtr_dev->clk[refclk] =3D clk;
>>>> -
>>>> -		/*
>>>> -		 * Get the spread spectrum (SSC) settings for the reference
>>>> -		 * clock rate.
>>>> -		 */
>>>> -		rate =3D clk_get_rate(clk);
>>>> -
>>>> -		for (i =3D 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
>>>> -			/* Allow an error of 100 ppm */
>>>> -			unsigned long error =3D ssc_lookup[i].refclk_rate / 10000;
>>>> -
>>>> -			if (abs(rate - ssc_lookup[i].refclk_rate) < error) {
>>>> -				gtr_dev->refclk_sscs[refclk] =3D &ssc_lookup[i];
>>>> -				break;
>>>> -			}
>>>> -		}
>>>> -
>>>> -		if (i =3D=3D ARRAY_SIZE(ssc_lookup)) {
>>>> -			dev_err(gtr_dev->dev,
>>>> -				"Invalid rate %lu for reference clock %u\n",
>>>> -				rate, refclk);
>>>> -			return -EINVAL;
>>>> -		}
>>>>    	}
>>>>   =20
>>>>    	return 0;


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




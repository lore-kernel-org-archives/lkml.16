Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020121.outbound.protection.outlook.com [52.101.69.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5654020B806;
	Mon,  3 Feb 2025 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.121
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602096; cv=fail; b=cFJeTKp5P2+L/xBMUofOiUENB0cUjqYE/CKM5TiY0qXGxQpI8i8r23dDh4cU7ZXYlPBlBx+0EdD+urXPckwSroKJuw1/ygLSLO3VOw9sLGHfTLVLiMBoqJa1uocLjKjRyIKwZiKkfulIJ40vXbIKysuV54gexIYfs52/KrvueTA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602096; c=relaxed/simple;
	bh=5RzPL7OPTH+Ehxb3RnAYviSkBFMvLB/jGffjEfm3OOo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MT7pxc12/CCY29ni1pXne/xPjoVxD01GpHCczTP/3xklbrlBa1fftgNiRl9H+v8zhSHo/ECV1r5aFMn2r5ogYNJX2C8T+l8nHdm7ckUSNgzUtmy0l+8n93axKNZyPey/yeTGozTHJabdgSBQMLhVHXc+flAyiYWAhilOz0SLZqk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com; spf=pass smtp.mailfrom=seco.com; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=UF1wXbpE; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=UF1wXbpE; arc=fail smtp.client-ip=52.101.69.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="UF1wXbpE";
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="UF1wXbpE"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=O79lSqiqG82NedJzKtHDrvfIizDbDsWw44xKE3TCKXM2IrungocDF5FyuOsJejutiC/iXdXkOAhEHJLasFN2VBUg5Y/8G8NI5KOoAB9dyv2AajeoJlqDm1ZHd7E6NFBLxcBoqFvNhEDyXkzoQZFSx0j+OJ5L5dFvkvD9hyemZvsH4yw85/qcXhoLEjKikRds2aoQn++Yzoj6h1BmMkX61lYqojPUeSRx32WP8CNknf8CBvSs306e4b7n080h3vXBk2Dn88/IX+Q6MmBN4w5Ny6L7Va6MJmRjXpJJWPvVTDmeLRmyCpBK7Xgu6aweWves8ZRf60kEuEAlWqBM61dIvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gDqlskp0jmbIULUqdA9NH6MoANjO/D3vefzh5qJw9A=;
 b=t0lvW08LlbTqacI2+WPF7di1uwqKPD9ulIgewFQToorWTUOISgqmDJSHWVVK4ZFjv8nfBRNVjf7E64dLiiOKKV+BpPkVSGO+nqdD6f13nIdY0EVkOl1SGwhHehRs8JNl5Mv8pYKy0uiQQnOZwOw+qoF7vYlteIdm+r5s/KQwPmNCGrBl6q/D/V1MnEYdcvIisyDcbT6+GR+em7pWbb9v3rMgi4yxVjHalFuhNGTOwiOv8zzsFrHEbGrY56POb1gPePd3IpC6G4hsNaObXTgFk4TGASZnUI/xcqDDVnvcA/2yNwzglFt5Zg/nueEcFSPqWzcJhjK9e0CsxX6D6zjgrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.87) smtp.rcpttodomain=amd.com smtp.mailfrom=seco.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=seco.com; dkim=pass
 (signature was verified) header.d=seco.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gDqlskp0jmbIULUqdA9NH6MoANjO/D3vefzh5qJw9A=;
 b=UF1wXbpEGAy3bteA9SEIRWrEPGYwDRbZCVV2vdnGmkKuUkIVreU4foy5Jk387aYFsUs06xUspJHziRDaWCuEsfXCE7rpP8dqd1CYTkuHjDxYjbzbKcrjkLe2ETD6SERsNlHKCiGLsqm/HNcr7A0OBN/HUvgocxc5p49JpcQ4/vycaMs6oy5Opr7zv7JEegG+i7VhfI10D4NoKq5lOroRQdszX6sHDCiCRF2m8Q0rJ5CLTCfRi6sYXkP+DIhrSaS4rOZbN+vzlc3k6uHuqp/owwP4kqjsArT+eHyMDdd4hHz4R/KxcfOjYLLeAyGdUvD46rDBUHbTTO2X1OKWHlgEEQ==
Received: from DU2PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:10:234::6)
 by AM7PR03MB6609.eurprd03.prod.outlook.com (2603:10a6:20b:1b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 17:01:29 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::3c) by DU2PR04CA0031.outlook.office365.com
 (2603:10a6:10:234::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Mon,
 3 Feb 2025 17:01:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.87) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 3 Feb 2025 17:01:27 +0000
Received: from outmta (unknown [192.168.82.136])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 924022008009C;
	Mon,  3 Feb 2025 17:01:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.111])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id DC0192008006E;
	Mon,  3 Feb 2025 17:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkMHIwBHTgmtvrECyTdxYg9X6yUc1oN2FkXXSo0ZJzZxahdWCXy2Kvhu1GR3jVjvgDypusFbgM33KzYSu6iHDiuOlMsSVd2/MLjRxTJvmPX4BzymTz7HTOi6BLB/KkwmpOWk8eBPa26Rg0X2UAmaojA8+BZTR2DbT+FiEjQG7yOQtXdWs4Pi5Ia26lvaiv2UrJtHH/LkSz8P8IL/z+c68upsXVa7cGS2jFNvAge2hbxwBU23G7qh0HrsA+i5XR+Q+QnKsNi+pW2o+MzemeaQcKazNHkZ4bHrvh5A30AViOeA4Fssh7yanarNV0ElPWk3+tNcz7hNMeIaL8/i5Y0EPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gDqlskp0jmbIULUqdA9NH6MoANjO/D3vefzh5qJw9A=;
 b=UQdUgHL5JNE8Ica0oSRoF7mpfjUh4uNux7OkVFNsNpS+QIGP5Z0EgD4EEUp+7KG06kjp2jBD0ISJ4p01S5TEPBHnuI39hyWbSG0710vKd2AYt/rybISPqWubiKhtdPBHEA3HWLSZr4QhyTmdZ2YUxtnEMq52ogxoBqs1g1mHBSJ1D7AY5PSMZJAgVwnZXdFtDl2q0erJXsij0CEdWMf3ZZzs8fZHPf7haTOFY9TZDUH9V32LQ8i4Gc1aYWd6hDlqoRRRiwZTXpnFojuB21mUQKUP3m1mz9PthpH7JfR84qmk8nb3VtuTuvuMpFl/6+IefY/dgrOJF22dBlijFU9TXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gDqlskp0jmbIULUqdA9NH6MoANjO/D3vefzh5qJw9A=;
 b=UF1wXbpEGAy3bteA9SEIRWrEPGYwDRbZCVV2vdnGmkKuUkIVreU4foy5Jk387aYFsUs06xUspJHziRDaWCuEsfXCE7rpP8dqd1CYTkuHjDxYjbzbKcrjkLe2ETD6SERsNlHKCiGLsqm/HNcr7A0OBN/HUvgocxc5p49JpcQ4/vycaMs6oy5Opr7zv7JEegG+i7VhfI10D4NoKq5lOroRQdszX6sHDCiCRF2m8Q0rJ5CLTCfRi6sYXkP+DIhrSaS4rOZbN+vzlc3k6uHuqp/owwP4kqjsArT+eHyMDdd4hHz4R/KxcfOjYLLeAyGdUvD46rDBUHbTTO2X1OKWHlgEEQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by PA4PR03MB8294.eurprd03.prod.outlook.com (2603:10a6:102:273::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Mon, 3 Feb
 2025 17:01:24 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 17:01:23 +0000
Message-ID: <b1c8920c-4654-472d-809f-eafd260d33ce@seco.com>
Date: Mon, 3 Feb 2025 12:01:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: xilinx: Remove uartlite from xilinx.txt
To: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <cover.1738600116.git.michal.simek@amd.com>
 <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR03MB9020:EE_|PA4PR03MB8294:EE_|DB5PEPF00014B8D:EE_|AM7PR03MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f02c1d-a1da-4485-3fc5-08dd44746657
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N0luZ0djUTQ1VVJyWFRMY21JdGkyMWk3YlNMLzZNRGF0OWNIa00ra1k1VFA4?=
 =?utf-8?B?NS9oTjdBSU5qMFlxOGJtamtpV0VYME9FYStab0RUdUUrbXJybjBoUGlMVkxB?=
 =?utf-8?B?M3AybmpHcmVzbjJWdGxrR3pJU2tOZVRFMld2bDNXVFV1T25tbE94eDFWcXJS?=
 =?utf-8?B?QkJ1b1dYdjdMNEF6VmhBcGF2VHJzNlFBR1RVNDJsK3kyKy9EWVpiTG9CNm9E?=
 =?utf-8?B?dWltWkYvSTZvR2d1WFNzOHV5OFRPbUg3bTZhdkVLR0NWLzJscTB5Tmlvdi9i?=
 =?utf-8?B?TnBFWGtPcjhGaGo3Y2dpY2d4emUzQ3FyNWRwbFppcFYybXpvNDBlU0RXbWNu?=
 =?utf-8?B?Umt6KzFPa2hqWXhFQS8yWU1CTnhMN0s5Mzc1REduZUw4MU8vaThXOG5kV2Fy?=
 =?utf-8?B?Yk1vOG5FR25aV0ZMcHFtRW9ueEVqRHhINXhxcjlLUjM1YlFaNDJiWjNFKytl?=
 =?utf-8?B?bFRIVHNpd0w2N2RXSWNJVHdyZTdQZFVtSVFpM3Z4M3ArZFlKRGp2SDJBb0V4?=
 =?utf-8?B?NU9aVEx6YVBrS2RGWlh6UmRzbmR4ak02S0lBZTIxME1DSWVvY0RUa1VMOGFD?=
 =?utf-8?B?TlJCckp4RTJ5N3ZBeDhUbW82NXdxZUlFbWc3YjZockt1akEveUpMUGhDbHlx?=
 =?utf-8?B?dkJDK0RMSFZOM2dSeWQzZ2p3OXVPaU1KWFcwNXQ0dHZLdEg3Nzk0U1ZZenNC?=
 =?utf-8?B?VTBwRjR4VXlPM2toaDB5a1ZmZ1NPbnlCR3ZOVDhFUm9SRFpYbEw2cFZWV2ZK?=
 =?utf-8?B?MWhrNFpDa3hIaGZ2MnNXUXJDODNFcW5EeS9XaXl4NTEyVXcvU3c2WDF5Zklh?=
 =?utf-8?B?Sk0wNjBWZWsraEhLOVorZFFpV3hjR3B4Z2hiUWIzd1didzlyZWNQL2JXd0JW?=
 =?utf-8?B?aFNsQTFoZHh1UldUYWE1WTVuSVVBZXhMZEpzTW4wYTRlajUzMVpmOE9rRk5n?=
 =?utf-8?B?Qm1XbTdaNW1iMUZHN0pQUmFSYmF3UXJ2cW51cEpTc3ZaQVZDc3czVDJOeHRo?=
 =?utf-8?B?UU9Qc0lZZHQ4S3o4eTZ6dFlMOEdSZUk2Y2JjV205T1pHUUZQN2lLSy91cDE2?=
 =?utf-8?B?TWpzZHBUbzF5c2Z5WW5iMXY1SVRiSXFsU05mN3VCUjZ0cWlSajFsVHMvK0ZL?=
 =?utf-8?B?bGRESngwZWZyQk80a1ZwQ1J6N05TclRTNlJ3SENaRkRQeTk2c2RsUUwzblBm?=
 =?utf-8?B?anlkYjdzcEZHK0ZvZjlnL0wyWW1hSi9OTmFRbEU3dmRpMmVJd1U3VlkxSVJ2?=
 =?utf-8?B?ZndjNHZqeEJDY1A5TWRwK203YmU5N2FBRURuNmRtR0ZrVnZCY0plZlZGbDFa?=
 =?utf-8?B?a2xYUWJ4NGwvRk1kN0QwZ3Rma2JIN2FpbGRqL1hLMjkxMlNLaXMrdFJVSFhZ?=
 =?utf-8?B?UEs2Y1JkeitONWdlby91T2hsT0VNYUo5ZE40SjU5REFFb1h0WVFLNlNzaElk?=
 =?utf-8?B?NDYxemNDWG5DQ2JZSnpmWXUvVkcxN2htRW1Xd1NndE1CYy94dWN4K1BQR290?=
 =?utf-8?B?dVcvK0dEKzRmaWxrUzdrb295NEVFQUY4Vm5YMzE4QVFhb0lrWTJNUURNMWdM?=
 =?utf-8?B?S21aWjZGa0F1ckFMM3dFR3R1bXhEcUxlZnNQbjVVNVJ5cUE2NkJSNStJcC9B?=
 =?utf-8?B?U2hWQk1DV3IrUDVJelpXcDRlVWZrWVJ5ZGRJaUpNYmduQXRXc0ljRHdkRCtV?=
 =?utf-8?B?R0pVR2o4dlNPY0lYK2xwSWltVFgxOE1YaUh1T0RYRU1NWUM1WTAzSlNjUFdx?=
 =?utf-8?B?ZG9kTmRDT0M2UDRDaW90R1phYS9LUlZxQ2VyMnlOTnFGa2tNNmtrOWlpN3U0?=
 =?utf-8?B?cUlBeHJ6QjlkTGpzNStGUWprajdZSllTTisvSFcyZ2pvbG5mM20xaHFQL3RB?=
 =?utf-8?Q?1op4bFhw4M8kq?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8294
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94331bee-1e98-446d-c034-08dd44746378
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|35042699022|376014|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjgxWFdhMTlGTHNqR1AxSURScFEwbGhqUHBtY3NFU2J2dngzdVROMXVaaXdY?=
 =?utf-8?B?YS85S0JNRU9RNEt4QnRuRE9DaW9pL2pMMnlSQml2Z3BFc3BKTndSUVJnMyt4?=
 =?utf-8?B?bGN3TURLR2ZONFBVbDZLYTdPc3Y3SEFRNm1KYmpMV2xvVzhRdWZUWVhWaGdC?=
 =?utf-8?B?VzFXMzcvSEUyblR5ajFkcUFtN2dlS1IvTXdYbXNmNm5mZmtDdFRmeDh1Y2NC?=
 =?utf-8?B?MUtpUzZmbmdyY25DaUN2bExSalMyaFRRNzN6VG0zMmNxZEdZT3FibmlsaXc1?=
 =?utf-8?B?TFZqMk50ZjZvclJQKys4QTcwU3VBck0vQ1hrQ2lHbDFJdzdVYytMMGV6eDBx?=
 =?utf-8?B?bGFJVC8rYUJsSDlZekxMN3BMdmQwUFJjQlRhNmJIZk5XUXVHZzNWYk0yUklu?=
 =?utf-8?B?NEV2Z3FKSVQ3S0dTYnlOM2U3Z3p5c09UVEE3UlB2Y2luSmM5RXFGZDhOUUlM?=
 =?utf-8?B?eU9KOFM4SEdNY0RrdE9aVnhCR0VndzBqK1ozRUJud01XK0tCNWxydmsrNGll?=
 =?utf-8?B?Zy80ekRtZk9ydnZoVURJTGhLNXplcmdkZjc5RUpyRE96ZVFMd1RWa0FDdmYr?=
 =?utf-8?B?Y0owK0hSTVhBa0E3REVFK3hUZ0NnMlBod2UzMUZrRGhBOXdaNHFoTmlrL1NK?=
 =?utf-8?B?RXpwU1lXamxNblZ4T1p0SlRBZW9QMlpVQUN5d1J6UUJrZmpVNUNDYUhiQlM2?=
 =?utf-8?B?MmdDZ1plY1pJNHFiYmFHMnpFRmxuNm9reGttdjE2YkpHL1U5OEo2bjVvSDN4?=
 =?utf-8?B?d2tTY3ZaUEhhbUl4SmdGbWMyT1MxdWJLaWxZM0xJbUN0encwSUV1Zm80SXlq?=
 =?utf-8?B?SDJzVDRpZjg0ZDdpWUZEWWdIYS9TTjBKZjZVNldEL0NKTi8vOVR4eVNIMitl?=
 =?utf-8?B?UmdYbTN6V3VyRG9aZG1hVjJ2ZlpPMkpoaDdGQjlFK3I3VmU1MTdVclJnd21X?=
 =?utf-8?B?R3ZQdW9yaTJJb1lvdm5LbzVSSlRnYURUdWdCaHc0UUE0N2UyQXV5U1ZDejZF?=
 =?utf-8?B?a0RYTCtMVUtxTTYyY1FrcUMxZVkrNnEzOGZxTlN4aW5QSGtiUEhwSEIxeXB2?=
 =?utf-8?B?a0xXOWszeDhNYjlNaEdMb1l0aEFUK2xLenBCb000QzlDYzljeVJuT2NyWmZX?=
 =?utf-8?B?Wk0vZUdkajBtZWVpV3E2LytoTHpkN2FRNDIyOXdKZnp4eWZXaHd6UGdibUlM?=
 =?utf-8?B?eXlFdytjdHU5UmNldkZReVNQeGwrdVp0ZCtjcGo3UDZ2TWtjeCtpbFl0SXFz?=
 =?utf-8?B?WFplazVWYW1HbjB4djQrTzBiUElrWnNyVit0SitGOStIdU1rVkY0cFl2ZVdY?=
 =?utf-8?B?ZUIrQnBKbEE5eUxJRXRyMDdZSHI3aWdlNGNQSVFGY2kyOERqbWdWUjUwWlND?=
 =?utf-8?B?Vmt1c1hFT3FlVWN4WE1jalNMWkg0WXYramlzQSs0R2ZtVlBpaEpmZXY5SlFS?=
 =?utf-8?B?cml5cEVranRVa090VlNXbjl2NjAvU0szQXNNZ3ZmWFo4bVhTMTl2SlBJSlRT?=
 =?utf-8?B?ckVIbHkwS2hKM29wbHFKVGxvdnRqQlZBWlN0UXlibkpQSm45YmptUk9JN1VL?=
 =?utf-8?B?SDBFNkNpaDVuNWp0K0I3SnEwRzhVYy9Ob2hDUWYrdCttNktBeGxMeEplMnlV?=
 =?utf-8?B?a2tnL3VKUWhlUFFPdjNrejZNRFZWcytSNmVpa2QyMlBNblE0Rm11dWlqSkR2?=
 =?utf-8?B?eXJCVnM0empvUHdUUE9RUGRmWFVHdytqWWMzRDY4aHBYcENFKzQyY0FEdHRU?=
 =?utf-8?B?SGJPeEdmRUlUWThGcGFIeERKa3M0MWVkUnhkaERwQklXbnpxWkROU1k5cW5N?=
 =?utf-8?B?VWhaM3FaZDZvb3htemoyYmdXUnJyVTNrZGZGdzJEM3lTUTZCajJQR2E3SGRx?=
 =?utf-8?B?TWdaeEFRU2pkUTNQZzFzblNIVTErQ0N6SEp0emtaM2NHUnBkVityR25CUWtM?=
 =?utf-8?B?V3JvdmFsamgrSXpZNmFNT2RlUndPUnJyT2VQNjBTR09Wdlo1Z1NVNHJBRFhD?=
 =?utf-8?Q?Fylz+0jaMcwQyFIREe0xTeQjXGnBbE=3D?=
X-Forefront-Antispam-Report:
	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(35042699022)(376014)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 17:01:27.9586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f02c1d-a1da-4485-3fc5-08dd44746657
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6609

On 2/3/25 11:28, Michal Simek wrote:
> current-speed description has been added to uartlite description by commit
> 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for
> synthesis-time parameters") that's why no reason to have in xilinx.txt too.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> 
> Fixes: 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for synthesis-time parameters")
> ---
> 
>  Documentation/devicetree/bindings/xilinx.txt | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
> index 28199b31fe5e..6af9b67f9252 100644
> --- a/Documentation/devicetree/bindings/xilinx.txt
> +++ b/Documentation/devicetree/bindings/xilinx.txt
> @@ -118,13 +118,6 @@
>        property, and may include other common network device properties
>        like local-mac-address.
>  
> -      iv) Xilinx Uartlite
> -
> -      Xilinx uartlite devices are simple fixed speed serial ports.
> -
> -      Required properties:
> -       - current-speed : Baud rate of uartlite
> -
>        v) Xilinx hwicap
>  
>  		Xilinx hwicap devices provide access to the configuration logic

Reviewed-by: Sean Anderson <sean.anderson@seco.com>

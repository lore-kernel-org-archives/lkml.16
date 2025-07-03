Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1692DE706
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751523339; cv=fail; b=CEKMaSu9pceZLFnrLSyMBM52V47s9AtyGhkffqEHgJWcpqJq01GEiFuF+iM7PccC/r9GEoDLRKfCfmveeyGvs2PyzkD/TqOT0czZaV3tCHhwQTUoh8dBHJqY8yP0ACz7bx/2XWVu1RjOra5aw+4HqEngnhb9kXZfaYP8zvW7sl8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751523339; c=relaxed/simple;
	bh=Y0/3UxQw6+alIfEddxj165qx/6IT9Z1WvUGkAYnRNOQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xe5YPawfIVPf82jE7zjlJhNoaHsN/fg4n1HElFFcjg0iOzCoaXcVd9EiEfj+yAE0MCPHaCin4jAjdNXmTFQt1OQ9E6Wr+PeuZSyF3VAEh9lNBS0UDjJvXl61jl+ASSvRyIofxyeSr4MuBTdbITFW+QPs7bCxifWu6bjXd289iwY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MhgUfKXQ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MhgUfKXQ; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MhgUfKXQ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MhgUfKXQ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eND7g5Io6BjigV21/NE5HeaCVMI8vgbGfRPPWJJTz15goXmOgHNr4JSASGwHIEZbzxsO1nhKdQ7m+Q2/EidTE0va/RIVTdW2C0e+q5MocsXgP9r4o3frgHWFtdwUhoCn8TsJttLBmRp5mHHby0KYJ1WGWR9ZO+MCR+wVHdBgdvfA81vkYDoUqX3x5V095ClWlnAPOSigw8KWbblKvxeRhMJ2Ufc8YmsMoxDyAAeQkC9kp6PX1hpLkZlx31QhI1d6qM2wVLH/rSlEYHO8AkHUi5wsoZXw24+eQ8cFE8IeLX6P/J5IvW3KIbTvpixzaRz41JUejayqUw8qzPOoA2rrNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyS4XXgun6jiRHvR5Z0OaxXjIr6ZVGhvjxnkE6JohFM=;
 b=x1pVsWJL2/R7aFhzqdr1mEMmBraqWohufX/qyU1aoDyv+Nhng6eQFU94E0/DmMoVygmLoeUpBaph+MRxI3diJmWVordUPl98cHZIjmsa7zK1/gtDYsNQmZiqOB9q0MA1LC19vm70XRW3k6NxB3F6BCpY34gQGHCG6/ImS2aFRNJaAFbwOopuBlyGmc9oTvJqGfuuSIp4EhqEIJoamSSSd49Kd4iRnXGLAnAH6AyVZVDm+LST3iGWDPz1+EKvAqKMFZuXknBXerYjgaEoVTyBji0q9eZgm2/aQhlROcWnouPhsm96T8EHpN9uR268O8Bw7wnK4Uol7Z7cys4oWmbeyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyS4XXgun6jiRHvR5Z0OaxXjIr6ZVGhvjxnkE6JohFM=;
 b=MhgUfKXQn1nMryO/tA9k9MpQgkXmwhjTdqV4ZMjk8to4L71yTKpSeyg0SY1xERUiu3HWt0bDnWAsFEG9kovpIdJqt4mrMAX0RVOyiri05WN+iP+jfqSbYQPPhOVKMHuPBqCOJnTWksryJuCFPLHp0qiGF1WylVuomh2bZedckdU=
Received: from DUZPR01CA0174.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::23) by AS8PR08MB6215.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 06:15:31 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::4a) by DUZPR01CA0174.outlook.office365.com
 (2603:10a6:10:4b3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 06:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 06:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU93JNe5kJci6fenGfnNru7xdM+JFRLcA9O/+yV+vIRVQEGFvnh3T3lZP3djkfvytVGNS/Rzl/f/ygU1vDR69wnoKdhjyPHZ81uI8mT85OWPNgtuF8Hnb170FxivHSOS4i46fbcVDqRKaHlgiAdMy4AWAECUD9zGCtwRvX1EQq5MKDRlF0JIPVgaYGbuMWGPOGzfPen8gnbg8oZer0cGsbfzwsbbq8q/zALOy1a7cISU1lIkqJoQmR63d/SHKDYL22/pPA88qqdR30jozj5wgltOhTqB2LA4ZNKCQodBsnAUschO1Ypvgrl5s9W8iTdZhXSucBweDDpjzM+Xv1J4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyS4XXgun6jiRHvR5Z0OaxXjIr6ZVGhvjxnkE6JohFM=;
 b=l0+8PmYgFb/kpgdryHgpf8jI84w0rApwo9onpA0WTs/+3qCdMKXgJpWH3e4iHSomWevbNIc3wKZOm+rbCUyAMx0VrnSP/KWSLPEWW+PYM5NV6VbbMRcwf+j+UaUKZghvR/VS+b9O+OLuJlDOkGVgQCY5NHYM/XmjDi0BjGrgQg3IqWXBViQSMJAUDBOnpkZtd1uo5zRtSzccxA6tWhWjfAp5XcCq+BuGSgCPyv4MOKESVZN3hr/x13ogznBG3RIoRwqWIkpQwg5v/TKfsaLVj3A9m5s1EXv0DSGZ248WVr7xFIUhoOhyDimfXFt4Xbt6/2QpzrsyrvbvTS3xBK9Cig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyS4XXgun6jiRHvR5Z0OaxXjIr6ZVGhvjxnkE6JohFM=;
 b=MhgUfKXQn1nMryO/tA9k9MpQgkXmwhjTdqV4ZMjk8to4L71yTKpSeyg0SY1xERUiu3HWt0bDnWAsFEG9kovpIdJqt4mrMAX0RVOyiri05WN+iP+jfqSbYQPPhOVKMHuPBqCOJnTWksryJuCFPLHp0qiGF1WylVuomh2bZedckdU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB9755.eurprd08.prod.outlook.com (2603:10a6:10:460::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 06:14:58 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 06:14:58 +0000
Message-ID: <62258305-d725-4626-ad01-138a0a720212@arm.com>
Date: Thu, 3 Jul 2025 11:44:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] maple tree: Add and fix some comments
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
 richard.weiyang@gmail.com, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250626171918.17261-1-dev.jain@arm.com>
 <20250626171918.17261-2-dev.jain@arm.com>
 <bxhfvhmk4iyyz7l3nitsgf4xgsydraskligg56n4ww3fe5zlvr@xqzh44dk3q5b>
 <2d55c06a-f4a5-4728-b692-60d88a5fe692@arm.com>
 <5ujw5k7z7ybboxoks5idc4cwxxmafsig32spmh7wddi6334ami@qpf7dm3sacsa>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <5ujw5k7z7ybboxoks5idc4cwxxmafsig32spmh7wddi6334ami@qpf7dm3sacsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB9755:EE_|DU2PEPF00028D07:EE_|AS8PR08MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f9cda7-ad80-4b64-0e20-08ddb9f90320
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?T2V3cW9KbjJZMm5Dd0R2OUFlMU5ldkRJTGlvSlB4MmlZVENGRmJJQ1lGWm1l?=
 =?utf-8?B?MTBwblhhYVFVOGp3Z0JsZm1vT1o1c0lGdjJxa1lUcU1XaG1FVk9XSlV1ZkdD?=
 =?utf-8?B?S1lidUI5V1pkL3cvSC85U2JSaE5tbnJNYkpGZGtGWFdQbE1VbFdKWmlhSGE2?=
 =?utf-8?B?NGM1SzRGMUFIVUwxSzcrTGtwMm10WWdZbEFGd08wak5hdGlrcTV5TWZNQVhE?=
 =?utf-8?B?RWtWMXJkZUd2b3FmNjRkb1FVRjUxTDFkTjA5MXUvUi9QcU5tSmVCRTR1MHNR?=
 =?utf-8?B?Q0lVdldzZVBUTmRNM01GTFBzQUZWaWwzUkk2U0RPSTYyWGNSTXNOOGl3S1Nx?=
 =?utf-8?B?Vk81Rk1PcXFkWDJDOGN6YUtYQ2JDSysyaHBPNENEZTVNTUV5eWU4NmJzdDZS?=
 =?utf-8?B?ZC9UVEdpZXpCVFhZbjhNZ0hrcWM0MjNJM1drRURScHh0T1hvdnRzblpmeEdx?=
 =?utf-8?B?dzNpRnE4UnZSbERNamFrR3N6dzNkdk5VZ2JzaCtqanVxZzlwZS9JZG1QbGR4?=
 =?utf-8?B?clM0cGhiYlZYOVlHMXVxVHpoMTRNV1hKaFNNekl3SXpVWE5tY2dqVC9YcFEy?=
 =?utf-8?B?Zk8vY3FaeG1XZTlGa3o4SmRJditFcnFRdlJjajFnMS81MWZGUzhoVmR1L25X?=
 =?utf-8?B?eEMwZWpGTG9IL1hKTlNsVEVIMGloZUNxUGlnQ3pHYWR0MER1Qmx0Z3lnRy9I?=
 =?utf-8?B?ZGZ0WXhWcnBncUJmZEdPTXNjdEY3Qlg3NXFYZ09QWUEvTkYwRG81SVc1Y0tO?=
 =?utf-8?B?QWRsWjFnKzRJS01CMVNobzU2ZGlMMEszL1U4RDkrN0tLdUE1Y0dpcWhnN1dw?=
 =?utf-8?B?VXl1dW5QTlpqWkRTTFUzbGYrdHFnU1dHUU1LTGNtWURkVFNYcHJDS1FsWFd4?=
 =?utf-8?B?a00zblRHbkE0aFNkeS85TFJnd2V4M0VyUDQ3WDBZZy94M09wZm5XSnBaL04v?=
 =?utf-8?B?cWcwT1I2TmYrdHNFekoxVy9CTlNMQm1vNCtwMDd1VGkrK1kzRExBL3I2UnRC?=
 =?utf-8?B?d1Y1MldkVkQ3Smd6WU8xTk1ONWxCSktiUHFyZGVjaFBZSXh6TitFQUtDWnlG?=
 =?utf-8?B?b1lNbTFKZjRGODRhd3JiTWgrVHRDejZNRGJ5NGx5MytiUXZwU2g5Y042SVoy?=
 =?utf-8?B?YTdIS0ltTnZsdGxxUThVY29vZW12SjY5citYVUZ1UjczUCs4b0crRnUzRGRl?=
 =?utf-8?B?YUdBdWdlSWVOUDMvRjZhSDJiYmtKRjJoSFdwY29BWStJandaZ05UbUdzZXFu?=
 =?utf-8?B?ZUZ4SGJsUTUxbFl5N2EvU0IzUC9MekJISFlUUUl0M2VadFRQVUFad1daTEQ2?=
 =?utf-8?B?cTJBOEJHaUdwZGczcDMzd1RzeFg2dkxlbVErNEtFb3BNb2x2ZkUrVDM5U3lz?=
 =?utf-8?B?cmNDNlR3RGN3NjQxL0RWWDJDRWxtYXZQUHdMWGtXeWh4K250WXhGdFJsazh6?=
 =?utf-8?B?TkdHZStvd05TOThHcHhkaS9HY241UmlMSnY5L2pQeFFxWWp0RFd6TmNSaVU0?=
 =?utf-8?B?UnQyRmdvemtma2djTDR1dFZZMzJnQVdZaUhRT3JYcTBqVDYvRkRvKzNlZDA3?=
 =?utf-8?B?L21rZVZ5OUtZRzFwaFdoSW16RUtHZWtDbGhPaVVTdGZNdWFSSDRORmVydEFu?=
 =?utf-8?B?TUU2RDl3SlhqNS9sN3FzYkhMRFlqY0tzL013Qk1KMHZzcmxEZXlPTmZvbzB5?=
 =?utf-8?B?R2ovSklaaTg2ZERtSmR0M1JOdWxObFlPT2RvbGNqOEJzeHFDMUZVdlQ3YmY3?=
 =?utf-8?B?ajlTbXJjNE1VOWNJT2N3cTdKa1VaS2U5MjI1K2NRR0EzZHBNeHUxVTFPcHFI?=
 =?utf-8?B?SUI4NHpqTDBWRTB1MXpEcG9zZGNLY1hCdDBlVEFVT2M0VnErTktnMU9ENGdZ?=
 =?utf-8?B?eWtPVUNRbStvMlZlOUlwTnpsd01oVXcyZFBaSis5Vyt5RS9JUldMc3NBL1NL?=
 =?utf-8?Q?iowmkN9A5gk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9755
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57e39ef0-ce5d-4c08-e3bd-08ddb9f8ef8e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|14060799003|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y28wbGEvOTBjeG80RjYrSzFrU20xNGxZOGx0ejlESmd0U3Myd1VMMjdrZWlR?=
 =?utf-8?B?dGp0TVFjMzBnUm4vTjVRcXlJdno4bUhrTGgvT09HM3BZcFpZdFR3TFlSSitN?=
 =?utf-8?B?Nm5iRVBlR2ZnU3Q1Z2Z4NDdUcW9XcmpEZWlQY21JTWp4RVYwdXRzSDNKRk5v?=
 =?utf-8?B?dmxpUUFBVzVSZm9Ga2RGbHJ2ejU0aUpVd0tSVGVlWXkxbCtGV29NVHpCUWpt?=
 =?utf-8?B?OTlLeENoOW5ybmYrYWlYaUdleHpBYjhyZ05jbE5IMnhTQ3VWY1gzTlNrcXQ5?=
 =?utf-8?B?VHlDdTZyaW5ZUlE2dnp0ZENhWTFNNWdXa0R4L29iUWExdU5BcWNUeXh5M1FZ?=
 =?utf-8?B?S2hHUUZ5cXVZai9XTkdjanI4L1JvbkxjdWtyYUk0MzZta204eC9PaEcxYnE4?=
 =?utf-8?B?VEN5dS9rSkxaajNhVFNKVFB5bVpuc3l6ZVlOUGwrK0RGVUNsQjZISTlpYXcw?=
 =?utf-8?B?RkplT21MRUVrL2ZhekNVOXFhdS9DbG4yUjBndDNPczBnM0phQzdDK0RKNnFY?=
 =?utf-8?B?Y2hhRVg3T1gyVnI2RDhMcVdpeGhFOC83dXExQkx2U0NrVGhPVG1va2ZRY3Fi?=
 =?utf-8?B?OXJ3VldIL0lsK3Q2NWdLd1NINGpEblJiR1hPeVB2UW5ZeVI0VFI1S1BSSFQ4?=
 =?utf-8?B?b0xTanFZQTRINVFYNGhEOVFpeUM5YlNYeU9SdnBJRmJkdmR4amxJaGlGMnI3?=
 =?utf-8?B?dEVtbC9hbHViWS9ra0hmRS9tWWlWbWhpdkZ2WiszaHg5amgrMy9uWjdJblRS?=
 =?utf-8?B?Z0dDcEhyZDRZV1BHZU4reXR3Mmc2QWtPYXk2VTRXR1lXZll5UnNsd1VVWXlW?=
 =?utf-8?B?a21ha3cwbGhWSWJvdVZBTFZ4R3R5Zmt0VG55SCt2S2RBYkxBSzJ4Sy9oV1VQ?=
 =?utf-8?B?bW1KNWFwaDNhTzZpTlR1NU1EZEtDWkdyeERPQ3NjUWNKSzZianRjTEQ0ZTZt?=
 =?utf-8?B?cG1mTGtJRCtSUzFraG1VVktGeFBmKzlZdW1LQ0tKdVJqMEN6VzM3M3REVGR5?=
 =?utf-8?B?L2NOak5id0c5RE04Z1FabkFNZUR2VnJTZHVnMGgrbjhhcEU0WlVSdTd1SGNU?=
 =?utf-8?B?cEdsOGJ6bDhwdHoyL1I5Y1FHMGFYNktqTCtiK3o4R0ROVzZTZlcvakQ2Yll2?=
 =?utf-8?B?aEYzTm9SUGM1WENUTFNSWGpRV0tyRGZGVGlNUmhSZk1RYVpRalE5UWkrd2M4?=
 =?utf-8?B?b1cxSStWcUZzNlgzT2M1OGluT1cxczVQYTdsZlB5aXloWHIrNkxDdm9ua1Er?=
 =?utf-8?B?NnJwc1B0VjdCbjJ1bFhVUmZUb1dxWkJXZmUwY3ZGZXlCTFVVaTF3NWQ5N0lx?=
 =?utf-8?B?d09wUlptbzVVRVJXN0pZbFZJYlZvNWs0OXVDb21WMjIwejRCTHdGeXVZT2c5?=
 =?utf-8?B?cTl2MXZuNDZhakxGaFVMU1o2OXhoOUtIcVR0L2pYaHhabno3YmZpdVViSFZ3?=
 =?utf-8?B?akhJaGlsemwxbGM3ZXJ4cnRJZ0VqWXdYN05QYTNsb0J3WUZvZGQ5V2paNThK?=
 =?utf-8?B?TWE1Z3lPOUp3VTlpek44RVFJcWswUXZjRVdNNHJObVByQlFTbjJnK2M5dDQy?=
 =?utf-8?B?VWZSbkFhNEVINkVHb0FUK3pSK0ZZUjhQMG9LNFg3cTNPQzliMzBYUDR2MFFF?=
 =?utf-8?B?Sk1nZnhZOUZTK3pOMVhSRERLQmNaUjMrRmU1ZjFHWm94UFE1TEg5VWZwVVND?=
 =?utf-8?B?VDNYODNIL205bGRxWC9ucEs3RkFJeXhCS1lHRE1UYXgrU0t6Qkc5SjhWSnJS?=
 =?utf-8?B?LytRSUlVbW9zZ3NueTU3by82QlZJVDY2QXBoRERNOURLdVZNa1ZtalRCeHVU?=
 =?utf-8?B?YUM1anIrYlNWUXdiUWt3RFIzRzNkek5sMkxQczlKNU1kNmZGd3VtK1VnTTg2?=
 =?utf-8?B?ZGU5cjBtbVpjdWhDWXdiK0tlcHZOaXhZVzVMU0ZiOTFkSTFsTDdYTTlEVW11?=
 =?utf-8?B?Q3lmS0xFVUtoMG5neWhRc1MxdGw5MjAyYWtUcTRUS1VvUXY5ZkVJdjlrR0hN?=
 =?utf-8?B?QllzY0RXUVRuNEl6YzVmL2IyYmVwVEgzU3FhTWxjT2NPQjJyMGkycHgzNFJO?=
 =?utf-8?B?WVR3N1luY20wU05JTG0zQlV4RFRLNnlpSUxOZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(14060799003)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 06:15:30.5857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f9cda7-ad80-4b64-0e20-08ddb9f90320
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6215


On 03/07/25 11:24 am, Liam R. Howlett wrote:
> * Dev Jain <dev.jain@arm.com> [250628 07:57]:
>> On 27/06/25 1:34 am, Liam R. Howlett wrote:
>>> * Dev Jain <dev.jain@arm.com> [250626 13:19]:
>>>> Add comments explaining the fields for maple_metadata, since "end" is
>>>> ambiguous and "gap" can be confused as the largest gap, whereas it
>>>> is actually the offset of the largest gap.
>>>>
>>>> MAPLE_ROOT_NODE is used for mt_mk_root() and mt_safe_root(), indicating
>>>> that it is used to mark the node as root. So fix the comment.
>>> That's not quite the entire story here.
>>>
>>> The first pointer in the tree may not be a node at all, and may be an
>>> entry.  So having that bit set tells us the root of the tree is a node,
>>> so the comment is correct but maybe you have a better way of expressing
>>> this information?
>> Hmm. Can you please correct me on my understanding - when we have an
>> empty tree, then we insert a root and can store a value there. Now when
>> we store the second entry, we allocate a node and make the root a node,
>> the root points to that node, and we store the values at offsets 0 and 1.
>>
>> I am reading more to answer my own question.
> Not quite.
>
> If we store to 0 of size 1, then we can just have a pointer without a
> node at all.  There are a few scenarios which can play out when storing
> the first entry to the tree:
>
> Nothing stored, root is NULL, representing 0 - ULONG_MAX => NULL
>
> There is a value only at zero, root is the entry, representing 0.
> 1 - ULONG_MAX => NULL.  To ensure that the root entry isn't detected as
> a node, there are restrictions on the entry value.
>
> There is a value only at zero which would be confused with a node.  A
> node is allocated and the ranges are stored in the node. 0 => entry and
> 1 - ULONG_MAX => NULL.
>
> There is a value that is not just zero (and may not include zero in the
> range), then a node is stored at root.
>
> Read mas_store_root() for details.
>
> As the tree grows and shrinks, the type of node stored in the root may
> change.  The root may return to just a pointer or NULL.
>
> Once there is a node at root, each slot either contains an entry/NULL or
> a child node.  Each pivot defines a maximum for the range while the
> previous pivot (or the minimum of that node, starting at 0) defines the
> minimum.  So the [minimum] = start of range 0, pivot[0] = end of range
> zero, pivot[0] + 1 = start of range 1, etc.
>
> Nodes do not store the minimum and may not store the maximum (if there
> isn't enough pivots the maximum is just inherited from the parent node).
>
> All ranges are represented and present at the child node.  This means
> that ever range will walk to the leaf node and have an entry or NULL.
> B-trees require everything to be at the same height.
>
> So, the entries at offsets 0 and 1 depend on the ranges stored.
>
> You can see a diagram of a node in ascii at the top of lib/maple_tree.c
> as well as terminology used.
>
> I have tried to keep the developer documentation in the .c and .h files,
> while the user documentation is in Documentation/core-api/maple_tree.rst
>
> If you read the start of the .c, it runs through a node layout.
>
> I've also posted an overview of the tree on the Oracle Blog [1] and
> given a talk about some of the way the tree worked for the Linux
> Foundation [2].  You can also find talks at OSS 2019 by willy, and lpc
> 2019 by myself as well as 2022, and lsf/mm if you search for 'maple tree
> linux' on youtube.
>
> Hopefully that helps.
>
> [1] https://blogs.oracle.com/linux/post/maple-tree-storing-ranges
> [2] https://www.linuxfoundation.org/webinars/the-maple-tree-structure-and-algorithms?hsLang=en
>
> Thanks,
> Liam

Thanks for your reply, I have already seen all of the above mentioned resources : )


Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012014.outbound.protection.outlook.com [52.101.71.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D941F9D6
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.14
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280221; cv=fail; b=bCnJsHJHZB0WhX0HDKk3v28kIyaeg8hv79Spo5MWzWVwhEeDT6Zx55HGAdGrnMMa3ZJMTH4K0vO/XVwfWx3T/QfYSFXt7gK8gWo5B6jLbvo3c7AdSbXIZZMLbhuUlpigijpDdlsdxzjFimiEDFlFqJvx6Ni9My4BrDxroTxaAFk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280221; c=relaxed/simple;
	bh=yhdbDoT8wqaKRdQprS3xvibxkk8bXLmNzqJ/7oqzoUM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QC1C5r2g/dGxi1Rf0ZPI+eLxeM3rGODkGfAprBPwAtDi+PZ9jUO8I6hhbv9nvoVaIXRlSIkKPpCeZJ4PulC/L2QtvuUCXaPdfZhHeUW0EN4oSOTVFXzeO5p3Nc6mqlTCT1xPmFTPsyCZYktW/QQ7cp2/qbzSzfTAAngUFvHb7qo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OLDX4uIN; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OLDX4uIN; arc=fail smtp.client-ip=52.101.71.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OLDX4uIN";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OLDX4uIN"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DTCZva6LohRqe3VJXpi86Tl9cjAxEdRA20622nUeKzwbOqajeGxyFyO+tqJq0LddHWocXddgZwMqEG//JncqkH2MutGpx1KM9siIq/AqXXsrL4k4JBsa14K1kwzCfUFuve7KDG3aQhslGdIuFUn1z/rPFAJYw3+hKx9Hl5GFBaTbZ5cJ3AI0DITEp82HiHMNgSd9fzIWu11W4jVFp5C7zzCVGinzfV8wcPTxKWGarlKMc0ggTjVcwVj6f6Qxp/ipInuC0EuCI9cDtMbziKAgBm0AvABW3tSNSaw+hmyHN5eZU4geIpKVZ1DKJ+U+P1TiMPClExGyJywwBCOvjRklQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AjeeaoXwpoayYq475udrwz50orrUmieH/UapP/7/jg=;
 b=Z541iUKau+FFztFTeGikwdEg5qHvL8CJc24yoGmHnSRlMe6aicqSgj3nbe18/wQrZwC7X98/r3Wfc0FyXXX7A+/q0Vx9A7O9xKejVLBxQn9dL6lHGK3Xi3tPyKexrT2yuLx09KqdVgLJKTGLNexKD6DW79ViPZAOp/Igu4bNipxhwTmNhWc6jAiT4ymCCWWlxZKnEDfhSHj9qIeOp1xKL8jW5X7THZO2w94KKhmEbdJFGBTeIKaOmvZ18UnTDLdQ09odgrTRuZqDVqoQ5q4OrOFjeOiDW/Igo4DY2alQzZuH2Utx1LomDOJu3el8dDwch8Q6dxthfmBOTGg9oJ0n6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AjeeaoXwpoayYq475udrwz50orrUmieH/UapP/7/jg=;
 b=OLDX4uINH3/x1A+jUIvPjgzuqBUcC7nGod8ALcnuZNCDNENWLllIKrOx6UhLZDZEhRrBaP/erYYNUpAxOKa+Y1nwMB9lMUTt5HpFsp+otxpbvE/VpjFipmkdZi6RO/wOdSGyLAltJoTu56W3Mq33Nt/P8+SRiQLkEXYqg/jwRSs=
Received: from DU2PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:10:234::8)
 by DB3PR08MB9087.eurprd08.prod.outlook.com (2603:10a6:10:43c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 10:43:33 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::77) by DU2PR04CA0033.outlook.office365.com
 (2603:10a6:10:234::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Mon,
 30 Jun 2025 10:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15 via
 Frontend Transport; Mon, 30 Jun 2025 10:43:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elrowq3bXlriFXrE3ePfZkhD24BqMYeBK8Dd+D6ob/2f7F0I+xDtbNyU0mBvesFRtxBuypL2E+Ua0HDsk0vKCaWJT+p4KCWwdbUWGc9K60xwfRbfXjRDM61hxZJMkeXvTpHuMiTSC2fwZaPTuuSGexiXq5OWMqj8p9GowfEm/oV50ti7ACtqYmDYdCzyXdFhK1CTh1yMnuogwiagTblXECXVanN5Uaj+fMFRzFWTXyQZm3VNAEu1N2UMMSpF6Vom8UTtaLzevzx+rustJLSpf19X9qZ4C9PUVJaS6t6ecilFuNp6CwZv+q2BEYGF7h8SiRVYKoponZMkLDv2iZ6DuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AjeeaoXwpoayYq475udrwz50orrUmieH/UapP/7/jg=;
 b=IPvILBMzVkdlr7q1Q4MtKgNZwLT67KGf95jmSAmynIXyNLIYFt4iVTUjOZ7TbZu9XcbL7iqytE7InWmq3aUm1r+PVg7n++OfKqK6KGNlP6hutslizgsSJ5QrKhf7QVSjBxn9TZtmhpz2tWgkzN1EpR9+A9PSaDw0YSAgqxHpBmgHYKx/G9WQJErmUYxf9CerGVZ78VCPDSW9I60HfWu0zM66JwaPsmG5Jebk5vj9c5fEnt4j1kWI2Np5Y8OfZQbJbou6Z/nE9RX5LQC62ZwNGi9gM6oZN2cwa8du/eOZYnoDg/1/wD+R65rMSIfCyb3I4wsBgyOCkyR+gpLQm3GtfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AjeeaoXwpoayYq475udrwz50orrUmieH/UapP/7/jg=;
 b=OLDX4uINH3/x1A+jUIvPjgzuqBUcC7nGod8ALcnuZNCDNENWLllIKrOx6UhLZDZEhRrBaP/erYYNUpAxOKa+Y1nwMB9lMUTt5HpFsp+otxpbvE/VpjFipmkdZi6RO/wOdSGyLAltJoTu56W3Mq33Nt/P8+SRiQLkEXYqg/jwRSs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by VI0PR08MB10969.eurprd08.prod.outlook.com (2603:10a6:800:250::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 10:43:00 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:43:00 +0000
Message-ID: <ba5eb5cf-537c-400f-9385-bc714776ce6b@arm.com>
Date: Mon, 30 Jun 2025 16:12:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] mm: Add batched versions of
 ptep_modify_prot_start/commit
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
 <20250628113435.46678-3-dev.jain@arm.com>
 <5f2eb53d-5fce-411f-857b-2ac16295a9f9@arm.com>
 <e1ce9e4e-03e2-4133-bbf6-9e0533dd13b1@arm.com>
 <ced934c3-a1ea-4d1c-954a-613eb20a9105@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <ced934c3-a1ea-4d1c-954a-613eb20a9105@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|VI0PR08MB10969:EE_|DU6PEPF0000A7E2:EE_|DB3PR08MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d19641-31a7-4bd7-ee06-08ddb7c2f5bd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cFN2TlYzMElrei82b3R6Z1hjTVJxOUZISEoxRXYwaFJMNEFXMVZ4RFMxb05M?=
 =?utf-8?B?QmRJdVlKcHozeWpxWmtIc0s3ZUtOZFRmUlVsaUI1cWdCZ3ZGQm5GRHNPeVJr?=
 =?utf-8?B?Yy9TMjljT29zZkFGS2x4LzBGZGtCaWNsVkpsc3BYVXZUdW9oR0JDV2xCOUxI?=
 =?utf-8?B?MzU4L2p2OE5zWUVxYlRZNmlDOVdKNTEyNlA3SzhHRWVvdUllLzg0VE92Uzlr?=
 =?utf-8?B?WnVmQTJ2NjYxKyt6VWx6bGVCeVVia3loKzdSRWNuSFllZkgxLzdnbWV2a1Uy?=
 =?utf-8?B?L2cza1V6VDhEaHUvcHhEVmpkREk5bnJsNnZhS3pIaUNucVhlMlRENGZpNzZE?=
 =?utf-8?B?blpMNVZHcEhMNEtxRFlNeUhmSFZhbGxBb1Nwc3J3cG52WkFvNXliZUZVNVg3?=
 =?utf-8?B?bUVyekxHVGh6SERYWDZXS25mV3BsdTM1WHFldUF5bGNxeEFKRmwvWXhXL3Fj?=
 =?utf-8?B?YmNpN0xkVXl4MjZiRlBNYmJBL1l4b05FMFJrYTd3RVJSOE1iRnRzTnZ3Q1py?=
 =?utf-8?B?azhkb283MndvT2c1eDE3eVkxZko4dE9yeE5ob1VreThEb243VkFMZ29VSVJo?=
 =?utf-8?B?VEdLbFBvY2J1dUFLeVNpWVVvQ0FKb2hUYXdQVGJlOFFMcnp4eCtOYmVpZU5Z?=
 =?utf-8?B?cGNNNlRLUW1rSi9qZmFPK0pTclU3Yi9BQytpMnE3N25EK3ViRWZIdE9jQWFi?=
 =?utf-8?B?MytlZ0RjQ3JaNEdwckVVYUNBcDB2N1QxQkIreS9EK2V3cTJNaXdoM3FvVkUz?=
 =?utf-8?B?dkV1TGpjU2ZZcVFmb1I5SWNXNU9xSTY0SzJsTFNPUXMxTDJVMTIrVEVlaWpO?=
 =?utf-8?B?eC8zUXFRcUpoR0QveFZ1dTh3MWJqYzJ1dW9QaVBPQS96OGpISm5NWnR3NTBL?=
 =?utf-8?B?Mjlnak9sa1F3TENVazhyaVpCRHBIU3ZxMDdkRVFKTTJTcno0YVREUjhVS0ho?=
 =?utf-8?B?RTNxZFEzOERtNjgrZWp3cXIzSnIrdWNuc3lJTFFJSGtJc2wrdDdlcnR6N0s5?=
 =?utf-8?B?QWJMK1lwRXpMM2pXY2tjN3ZSWnhGaE9vZmRhZHNYREZrMnY3TGlnc3phQUx2?=
 =?utf-8?B?bTV3M29HaCs1QXNRMCswUGh5bHlHWGtKSWhFREFEOXV6YnpGbEQ4Q1RQN2lT?=
 =?utf-8?B?bEJ6ODhtamV3R0pGYTZTWmNkbUlPUUthZExOdnRhZHIzWWpPU284cERmc0FT?=
 =?utf-8?B?V1hLSmFWNVdHa1pUeEFBenNtRk5YMDk5WWtXT2FDVGZNUEFDSlBWM3dFU3FZ?=
 =?utf-8?B?QXF4dlVwcHNEa1FpWVJFTjFYREhvVEx4cG5Tak0wWkdIOGU2V3NUZStkNjRV?=
 =?utf-8?B?L3ZaVnRnekgrTlZUUVdoSUxsU0UwNzQ5UXNLZXVWYTZIMGdOa2pHWTNvZGRN?=
 =?utf-8?B?eGlVZ3ZBaGU0Zk9PeUlLNHBFeEl5dG55VFRoTXRhL2NHRXZMOXIwNFoxdjB2?=
 =?utf-8?B?WnhveXpsZXBKMjZuTUZEZGdFb3JqcEhzRVBiZW1GSmVkR2RqUjRRSXdJK04y?=
 =?utf-8?B?Ujd3aGJRb1hQckZmQm1RYnhSU3RqZDVXbGQ4TDVDVWNJTWxFYTFDcFQwOHF2?=
 =?utf-8?B?cnpueXZWU0dRZkhZZjFudlBpei9qdjRmQzZjWXZBVEpaak5Fd24zOW5DdGJJ?=
 =?utf-8?B?RTJCVTZZM3lDWTByWk1QU1hZR291eHlRYncwU0UxRDgvREJJK25udjVyWlN0?=
 =?utf-8?B?SWVOWnM4NlFBSVdqWmxmVkwyRGxGQUFIRUt2QWJOTmt3bS9wOGovOFg1MW43?=
 =?utf-8?B?QzV4dTlmb1g1SEgwNU5rMDdKVDBzS0R5aVRRaE9Ja21Jc3F5SWhsajc0ZThv?=
 =?utf-8?B?emxYMHFHUXQ0Y2VBSTZjR0hLb28rdW4yU0UrUDJQS0dUTU1tamtUZVRWanhX?=
 =?utf-8?B?di96VFRCSjhBam93RUs0K0FtWVNxdXJlNkg0STRMajNvanc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10969
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	60151ae2-0c77-4e93-55b4-08ddb7c2e256
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|7416014|1800799024|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHo4MTM5QXdFVWxFUnYyRTZnYlYzOTBIZVV5SkZPOFVjNXJPS1I1RitYRGpM?=
 =?utf-8?B?dE9rTGZ5Q1N4MDZKYmpLMmx5SEFNTEU5ZmhKNWhuc0ZkWHhFVjkrbWNvNUdo?=
 =?utf-8?B?eTgvVWNkNDVmeHowb0RIWEJUMUNDemhLSVRPdW5Qd0ZUYit3UlR4dzJFS1pC?=
 =?utf-8?B?MDFEYjF2cmdtRGN1NmhOTkNsS0dndDhZOW9iTDJNT2twOHdhdkxXQ2xjYXRm?=
 =?utf-8?B?MHFsUkgwUHMxWHlacnpXeG45Wk53SVNLeWdEbFVHUlpiajBVYTNxRVhsVThS?=
 =?utf-8?B?M050KzdTU21qRHZrMFNraEtHcHFNbjlDeVZDRE5ER3YrNkpybm5PWEFNeW9C?=
 =?utf-8?B?aThVaUxjZWNZYy9rMDlRUHh6SllRaUNQdGM1YjNROWNWV3RBYkx3WGsvTjAz?=
 =?utf-8?B?OGEwTjZ3aXJFZGxpOGdLUU40N2ZEM2YwQk5mdDdmMmlCYVp0dHFWWjR4NkZ0?=
 =?utf-8?B?dWgwNHd5QkJvem8rQUhLaW9VTDhtUC83MDB3bXhac1cyTXpHd0pjb3RwWVBh?=
 =?utf-8?B?akJVcnBMRGJQSHBpVWN4ZVY1OEw4amg4NllIeDVKb21HKzByWkhFK1ZvSEdo?=
 =?utf-8?B?ZDFFTU1hRUhHeGxvMVFRWFpDTmUrQWpEazhwNDZ1NkVoRUNPWlJuVHFkdG5o?=
 =?utf-8?B?eFU5cFFmNVNOdFpZNTg0djFBZm5HOTJHUTZiMk1MOG1rNmJCY2tZY1l5WFRx?=
 =?utf-8?B?b2NKbXRQVzQ5RXg4TU1ab3cvSmw0TlBhanNZbUlzcy9sSkx1VXBJekhxK3VW?=
 =?utf-8?B?MW5PK0liOXhJejZKLzlSUDU4SExwVjY3bHRVZzlVSjRJOVBwQ1R5ZlVvVlBX?=
 =?utf-8?B?RldnOWRJazlBamlwRURBZjZmVEhkbTJrYm05YTM0TW9naHViUDcvYmVpSnV2?=
 =?utf-8?B?WGluWU5rZ29aZTdZMVNQSFU1ZTdsbGUwWFJONEJzcmk0SlpVVDFuWURvakVJ?=
 =?utf-8?B?MXRGcnpNZzVMMGlmQU1EcXdTTk56YjN2Zmduak8xcDJKYWdxN25rSWg1MHBP?=
 =?utf-8?B?NjVGbUs4L3Y3YkVHQ0xDTkFiSmZRMS9LZXB0bWhXdUFvbCt1aklrTGhaSms3?=
 =?utf-8?B?dzR2d240WkJGa0xqSEpOS3Z4VFoxOGQxakpjdW80bkRhdVBCUzRrNzgzOUpi?=
 =?utf-8?B?YzMyZXdOdkx1YThPbW1GaGUrOHhVRGdiQ3c0OSs1UVVxY1FHTGV1Qk5iUHVo?=
 =?utf-8?B?N0tmUko2RE5FK0ZsL2c5eVVSVjNxcG91Wkg4cUovSVNXd3FSc3JDSUZrZ3l0?=
 =?utf-8?B?ZlJsWENBSUNLWXNpUldrQ0NHbTJPQkNZcHhWdzZHWTZ3TlVhY09rdm9pOWUz?=
 =?utf-8?B?ckFZb3RkMURRZDBaUDJSMFlkSEZwR2dvMlZoVTJRRk9jR3hZeXFzMlUyVjRJ?=
 =?utf-8?B?Y1lXdjM5eHJZcXN5OGZjSTBxeTY3c0lyTjA5cGpKTm9kZUxnNXp6UzdxVHl6?=
 =?utf-8?B?N1lvNWpVN0RvYzJUMjNITjlpcGtZN1pyU2wyWWhCYjFUNDNJVVc4QWFlNm0w?=
 =?utf-8?B?d3NZcFp5RUJ2V1h5MUFUT3VacE1qMzAyK09vWWYvUWlQMlhQVlVjY05aUklX?=
 =?utf-8?B?ZkdxZGZBQjMzbWFZU1djaUhDT1BubjNvSVpHZXhycDJ4VG9zRnRJQ0o1cTJK?=
 =?utf-8?B?Rnc3VmNWOUJYRXh2YWtiU3lRbGtOd1VSZzZWd2NjZ2VheGk0OUNOclFrSDJL?=
 =?utf-8?B?Q2EyZWl6NHdJN2ExYS92anZLZkk4RnR6dkFudGFnVXEyZ095cHN4S1hLejl6?=
 =?utf-8?B?aDJEVDZ5b3pncmNIZFBuZ1J2T1VlS3ZranVMZmpqcHlpYmpZTGZjU0l2U2px?=
 =?utf-8?B?aE9aU3krdUsxRGdHUDlObTdvSFNvSzdNVnNXWEM0ZTBSOU1KM3pNVmxDelM4?=
 =?utf-8?B?Y3h2VTcrR1Vqc0ZEd0QxUElNallWTzZ2c2RYN2dLMjF2OHVOVURpVTJPNXhE?=
 =?utf-8?B?SDVpUWVvSTY5MFA0a3QzcUFrM3o4Vks3K1QyVlBHMlpheVdMRy9jSTNnK0xs?=
 =?utf-8?B?alB1VmloTXNJeGtxZHMwT1NWTUM2V1lJdCs0Zzc0aHhMZ3ZJYzZOOW15SGJV?=
 =?utf-8?Q?QKYF9l?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(7416014)(1800799024)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:43:32.9701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d19641-31a7-4bd7-ee06-08ddb7c2f5bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9087


On 30/06/25 4:05 pm, Ryan Roberts wrote:
> On 30/06/2025 11:17, Dev Jain wrote:
>> On 30/06/25 3:40 pm, Ryan Roberts wrote:
>>> On 28/06/2025 12:34, Dev Jain wrote:
>>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>>> Architecture can override these helpers; in case not, they are implemented
>>>> as a simple loop over the corresponding single pte helpers.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    include/linux/pgtable.h | 83 ++++++++++++++++++++++++++++++++++++++++-
>>>>    mm/mprotect.c           |  4 +-
>>>>    2 files changed, 84 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>> index cf1515c163e2..662f39e7475a 100644
>>>> --- a/include/linux/pgtable.h
>>>> +++ b/include/linux/pgtable.h
>>>> @@ -1331,7 +1331,8 @@ static inline pte_t ptep_modify_prot_start(struct
>>>> vm_area_struct *vma,
>>>>      /*
>>>>     * Commit an update to a pte, leaving any hardware-controlled bits in
>>>> - * the PTE unmodified.
>>>> + * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
>>>> + * to the old_pte, as in, it may have a/d bits on which were off in old_pte.
>>> I find this last sentance a bit confusing. I think what you are trying to say is
>>> somehthing like:
>>>
>>> """
>>> old_pte is the value returned from ptep_modify_prot_start() but may additionally
>>> have have young and/or dirty bits set where previously they were not.
>>> """
>> Thanks.
>>
>>> ?
>>>
>>>>     */
>>>>    static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>>>                           unsigned long addr,
>>>> @@ -1340,6 +1341,86 @@ static inline void ptep_modify_prot_commit(struct
>>>> vm_area_struct *vma,
>>>>        __ptep_modify_prot_commit(vma, addr, ptep, pte);
>>>>    }
>>>>    #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>>>> +
>>>> +/**
>>>> + * modify_prot_start_ptes - Start a pte protection read-modify-write
>>>> transaction
>>>> + * over a batch of ptes, which protects against asynchronous hardware
>>>> + * modifications to the ptes. The intention is not to prevent the hardware from
>>>> + * making pte updates, but to prevent any updates it may make from being lost.
>>>> + * Please see the comment above ptep_modify_prot_start() for full description.
>>>> + *
>>>> + * @vma: The virtual memory area the pages are mapped into.
>>>> + * @addr: Address the first page is mapped at.
>>>> + * @ptep: Page table pointer for the first entry.
>>>> + * @nr: Number of entries.
>>>> + *
>>>> + * May be overridden by the architecture; otherwise, implemented as a simple
>>>> + * loop over ptep_modify_prot_start(), collecting the a/d bits from each pte
>>>> + * in the batch.
>>>> + *
>>>> + * Note that PTE bits in the PTE batch besides the PFN can differ.
>>>> + *
>>>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>>>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>>>> + * Since the batch is determined from folio_pte_batch, the PTEs must differ
>>>> + * only in a/d bits (and the soft dirty bit; see fpb_t flags in
>>>> + * mprotect_folio_pte_batch()).
>>> This last sentence is confusing... You had previous said the PFN can differ, but
>>> here you imply on a, d and sd bits are allowed to differ.
>> Forgot to mention the PFNs, kind of took them as implied. So mentioning the PFNs
>> also will do or do you suggest a better wording?
> Perhaps:
>
> """
> Context: The caller holds the page table lock.  The PTEs map consecutive
> pages that belong to the same folio.  All other PTE bits must be identical for
> all PTEs in the batch except for young and dirty bits.  The PTEs are all in the
> same PMD.
> """
>
> You mention the soft dirty bit not needing to be the same in your current
> wording, but I don't think that is correct? soft dirty needs to be the same, right?

Oh god, confused this with the skipping case, you are right.

>
>>>> + */
>>>> +#ifndef modify_prot_start_ptes
>>>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>>>> +        unsigned long addr, pte_t *ptep, unsigned int nr)
>>>> +{
>>>> +    pte_t pte, tmp_pte;
>>>> +
>>>> +    pte = ptep_modify_prot_start(vma, addr, ptep);
>>>> +    while (--nr) {
>>>> +        ptep++;
>>>> +        addr += PAGE_SIZE;
>>>> +        tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>>>> +        if (pte_dirty(tmp_pte))
>>>> +            pte = pte_mkdirty(pte);
>>>> +        if (pte_young(tmp_pte))
>>>> +            pte = pte_mkyoung(pte);
>>>> +    }
>>>> +    return pte;
>>>> +}
>>>> +#endif
>>>> +
>>>> +/**
>>>> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
>>>> + * hardware-controlled bits in the PTE unmodified.
>>>> + *
>>>> + * @vma: The virtual memory area the pages are mapped into.
>>>> + * @addr: Address the first page is mapped at.
>>>> + * @ptep: Page table pointer for the first entry.
>>>> + * @old_pte: Old page table entry (for the first entry) which is now cleared.
>>>> + * @pte: New page table entry to be set.
>>>> + * @nr: Number of entries.
>>>> + *
>>>> + * May be overridden by the architecture; otherwise, implemented as a simple
>>>> + * loop over ptep_modify_prot_commit().
>>>> + *
>>>> + * Context: The caller holds the page table lock. The PTEs are all in the same
>>>> + * PMD. On exit, the set ptes in the batch map the same folio. The pte may have
>>>> + * been "upgraded" w.r.t a/d bits compared to the old_pte, as in, it may have
>>>> + * a/d bits on which were off in old_pte.
>>> Same comment as for ptep_modify_prot_start().
>>>
>>>> + */
>>>> +#ifndef modify_prot_commit_ptes
>>>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma,
>>>> unsigned long addr,
>>>> +        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < nr; ++i) {
>>>> +        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>>>> +        ptep++;
>>>> +        addr += PAGE_SIZE;
>>>> +        old_pte = pte_next_pfn(old_pte);
>>>> +        pte = pte_next_pfn(pte);
>>>> +    }
>>>> +}
>>>> +#endif
>>>> +
>>>>    #endif /* CONFIG_MMU */
>>>>      /*
>>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>>> index af10a7fbe6b8..627b0d67cc4a 100644
>>>> --- a/mm/mprotect.c
>>>> +++ b/mm/mprotect.c
>>>> @@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                        continue;
>>>>                }
>>>>    -            oldpte = ptep_modify_prot_start(vma, addr, pte);
>>>> +            oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>> You're calling this with nr_ptes = 0 for the prot_numa case. But the
>>> implementation expects minimum nr_ptes == 1.
>> This will get fixed when I force nr_ptes = 1 in the previous patch right?
> Yep, just pointing it out.
>
>>>>                ptent = pte_modify(oldpte, newprot);
>>>>                  if (uffd_wp)
>>>> @@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                    can_change_pte_writable(vma, addr, ptent))
>>>>                    ptent = pte_mkwrite(ptent, vma);
>>>>    -            ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
>>>> +            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>>>                if (pte_needs_flush(oldpte, ptent))
>>>>                    tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>>>                pages++;

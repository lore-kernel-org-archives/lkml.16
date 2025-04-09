Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F269D2B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.68
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211673; cv=fail; b=cVho7yrjF7ux92H3KrK+mUU9dE3fLUYbLcHvQitz23UDaGQ5OOw4/GiRl/zxl2gAnWxEUF4KCFDcTpIsAb8k6D9ICu+tWMgUN9sek+J1DxxO8EN2YvAuambaloA8Xyuk2AQBxz7bYSXto6KfiQ5sbwOuP2+fELPZtli9Lu97Y8o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211673; c=relaxed/simple;
	bh=QwmEtmQTziHAe7KPNwc0MGupXneOAnzptvLtGyC/7JU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R6tIDMRBK3LK5V5SXFfQu6RqdLMcleL+BPIkLRUIjhtBk+odYbKTw6cfbzZRsG5lrCQ/6WqNnjr1aJG2OghwBNtT5kYX0+NTX/A1AHleiunWU0OnpXxqpAEfoY0JpPjmGdwvgx+9D1Gji/5jWkSizPhJI6oZn1INGjjcGVIh/xo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o++aXP+M; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o++aXP+M; arc=fail smtp.client-ip=40.107.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o++aXP+M";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o++aXP+M"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=igwmce2pzXWe+UVcRSs5kNJFgreifcoNref6W7NE5V7zgk5JtnarAjeqJ/ViiJGNzGQEfzcDztiKrCsECi2sr4X5NZLzjBxYBGPJ9XSy2GO4nCLhz59xSaPrM27aPO9Rq9g5U6kFaHvo5u5KaRElo99olEStS3WGlZ76i29j5lttrAG31p5WYK6IAxthFt20D1K+r5Y59D8+OeRnDvy+AvuH0adU3SFkmoSeArmST6mdRltJOubuhyHh/lEEL0AAN+UfwjBwqkZMyXgU2vmBhdRpT67PpNzuUf+TCYyJlT3mvXMCuAZ00ReLZIBtQV3SWvGEX92Rhav6qqBD/EJQlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m81DNLkqtys1ien4in+snRtND3oF7ctu/vc7nvcwkQ=;
 b=QRTpXFodxsG+IusRziJAwsczGfaLUFwiKyP7qr068N96yChZq3A8ep0XJ1HZTaIsKehy4kHK/b6x03MM2dxKJxyrT1SgPUzpR6wD/BaGuY6ngbryJbSIf/ypcodZtA/ea+/jxBAJOZqdSZR+wOMXi5TgKA/OgkKs12f54KaV+rCnmfwMzfJA2UrXe8Nf3TNzsFns3E6ymIE2R794/rLH7hQN6F4Q+KQsi5bZSiM03Ja7gm4gZK1n0wTp/2K0KO29xeCKXYdqyYRFTIa+sQfI7WXX0u2aADCEEKr8k8ES0vMyNI/OyReJ7rm/NaV19Rh3OOAj8bZonQcuM24kqLc8OA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m81DNLkqtys1ien4in+snRtND3oF7ctu/vc7nvcwkQ=;
 b=o++aXP+MciW1WANloSYe1FfhrL2hNdVwQW/vk0vWHp1aCSiBh1Y/Ff2qKY6RZ5BgMYLS9GRuW7jtgZiDVBEpBqu0Kdfch3I16KiS58CO7PuqVKQUP5Bv0cbRjxZGH7LSQXi8++hik+PiiZu7GjmZaoUUKEocKQY6fTJLb9maMH8=
Received: from AM6P192CA0080.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::21)
 by DU4PR08MB11152.eurprd08.prod.outlook.com (2603:10a6:10:570::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 15:14:24 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:209:8d:cafe::12) by AM6P192CA0080.outlook.office365.com
 (2603:10a6:209:8d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Wed,
 9 Apr 2025 15:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Wed, 9 Apr 2025 15:14:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hl6c9PnpTGorBQVH2fGKBb13/lIwDxJxRwnyrEiNMjWTVnZBDWPyPccZ7Akt+T1kBQAClUrvZfHPa+D3cRh1QQWWqb9YQOppch0VDw8/vKIG/zPdXXXHw5scZg7TRJFmZa3ZmraEPgUQ6WOkNuebV+lT/ipO7Z7I1rkpzj+L6zDnK8BztN18tyc1KAx/51boNoPDeAWhuJeoKZt7usjDxCPxG5xBzetISka8BFphLaQRPRI1SlM2aWPnx0nc2Cp4KUWtgRYdroSc9lENfJIoOUQ3zDGvtEGsisNbfqkvXlkkOrjME1u+hO384zDGW/K2eUfElf+8K+v8t8kXaSJw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m81DNLkqtys1ien4in+snRtND3oF7ctu/vc7nvcwkQ=;
 b=q5SoX2FL2mquWhL3v7h4XeBiYwsu87mknwLwUzAwUvPdylyz460wUj6B++Vwr6Wc7A/Z+ZawmAQaoruS3h8E0BT0gql20fdXJjrdxA9yfLgnxAT7UFRGBZorIrbEHqqT+ut3n60SM2x3VwN3bhXNSE+S3yr6521eRcFeMt9nbIb0k9NRI0f6C4pi/izYtHSGt8tS2LBdwtVrwXgRS2PLCHgQPfEBWh+DezMFhAESIjklQpxTb4G374uBJTHQ50cmA2iSmai3qI/sTgFCjEf3VeXQG8cLn3aH+jmkU6+DCpNtulWiZ0Oi5aMsXsdcrf8u3hjLmUGsnkVPzA3FDRrmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m81DNLkqtys1ien4in+snRtND3oF7ctu/vc7nvcwkQ=;
 b=o++aXP+MciW1WANloSYe1FfhrL2hNdVwQW/vk0vWHp1aCSiBh1Y/Ff2qKY6RZ5BgMYLS9GRuW7jtgZiDVBEpBqu0Kdfch3I16KiS58CO7PuqVKQUP5Bv0cbRjxZGH7LSQXi8++hik+PiiZu7GjmZaoUUKEocKQY6fTJLb9maMH8=
Received: from AM0PR02CA0106.eurprd02.prod.outlook.com (2603:10a6:208:154::47)
 by DB8PR08MB5354.eurprd08.prod.outlook.com (2603:10a6:10:114::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 15:13:51 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:208:154:cafe::d5) by AM0PR02CA0106.outlook.office365.com
 (2603:10a6:208:154::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 15:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 15:13:51 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX05.Arm.com
 (10.240.25.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 15:13:50 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 15:13:49 +0000
Received: from e129171.arm.com (10.57.17.154) by mail.arm.com (10.240.25.134)
 with Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport; Wed, 9 Apr
 2025 15:13:48 +0000
From: Luis Machado <luis.machado@arm.com>
To: <linux-kernel@vger.kernel.org>, <peterz@infradead.org>,
	<dietmar.eggemann@arm.com>
CC: <mingo@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>
Subject: [PATCH v2] sched/events: Improving scheduler debugging/testing tracing interfaces
Date: Wed, 9 Apr 2025 16:13:38 +0100
Message-ID: <20250409151338.1046335-1-luis.machado@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AMS0EPF0000019A:EE_|DB8PR08MB5354:EE_|AMS1EPF0000004C:EE_|DU4PR08MB11152:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2b5177-e758-4f1e-507d-08dd7779362e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WDRMTjJacVI2SWZzYzZyc052alU2U0hsWWREQUVoblNqWk53d3ZGOWVGTTZ4?=
 =?utf-8?B?WUhJUmV2b2JjSVpUOEhKWXM5S2RiUDQwWm9yVjBnOENrWis4L2pNcy9WT2hh?=
 =?utf-8?B?dld3eVQ5OGFnNlhDWnBpeWw4UHg0SGlMZlpKMW9YUjVIajk2dzVLK1hmOWJW?=
 =?utf-8?B?ankyZ2hIb0E3MmsxN29rajJIM2dXWEFiT3VHMnB0ZnR5WStUc0xlSGdkYVEw?=
 =?utf-8?B?QWdDam5YMVZaTm92TmVROTVpYlR4U0VCbGVzZDhjSGdCa0pmdG1EMWY5UDdG?=
 =?utf-8?B?NlYvNE9CY3QzU2VyVUFwNmwreUV2TU5rakZNOXdSNG9LVWR4emlrODdidHNt?=
 =?utf-8?B?L1pnMlZsSlZEM3V6OCtrSDk0a3RDMis3eGgwb1l2Z3k2UE5yZWllTEZSYmtX?=
 =?utf-8?B?MVRPb2d3RDBYWWczU256Z0FnOTJJKzZqaW0yM2J1a2EzZHpwTEQ1OUgyYmF3?=
 =?utf-8?B?VXdaQjRCeEEvUWhRQm1LaGc2TlhwU213OVI2dFVsUWwzcW4wYk1WK0hTenU0?=
 =?utf-8?B?YnJvL3RTL3NTNURtNlFmZmtNVVVid0NqbGhCSVN5NC9ycktzOG5YVnBmVFdT?=
 =?utf-8?B?R25KZUFyWWNPTytFc245M1lraGhmV2ZLQVZRTXUrYmFoYlVqZWRnZG42TjRW?=
 =?utf-8?B?Z1l1SmlpMks5eUQzZFdZdDUwbkZIN2wxNzJjbVIvRm01aFEwZXc4cGpnbzFl?=
 =?utf-8?B?NEpjSFlrNngyREJxcjN5Z3dCMjd1RUZBZzhaMnpSdjQ3WnlhOU5SYk0zVDhp?=
 =?utf-8?B?amVCSTRSczJqT1krZldZUngzdmFYamVxRDJSTDhKRDcya2ZZQ2dLZldTN2hX?=
 =?utf-8?B?US9ReDNzUGRtYWJLZXFuUC9GeCtETzhkUFl3S1VVdktLK3laakQ4VHNwWEhj?=
 =?utf-8?B?cHpyOVYwK0dZV3owYlJkRmQ5YkNEQ054blJqblBNTVFMMndQMHRUZmRpdE9K?=
 =?utf-8?B?c2o1NjRCL3dXc0ZoR3RyWVU3bi9vQi9oeUc4ck1DV3JyZlVxc2FNLzdpeFl4?=
 =?utf-8?B?YVArSkZqQjYvOTBuZnhMVTN0ek9vWFpibCs1WGcycUpSN3BhREhacGdSbzJh?=
 =?utf-8?B?elJkT3FjdFFadVE3RHJQMGxkU3RPUFBFT3RCZ0x0d0YvbjJJUUNCYzIwOVll?=
 =?utf-8?B?NWJHcTA4QlQrdXN3TERwTlMxQ3lzNExEcTB1YUpFYzQ3ckdzdDZZSVhYcXpV?=
 =?utf-8?B?WTN2eTdoR0ZVR0RRU3REQUZYNUtpRXBnWXY4N29udTQwV05wK2ErLzNQT2lv?=
 =?utf-8?B?ZTYyYkxaS3ZEQTRkcWlFNG5zVVROeGdwaTlXbFJZc2laNFN5ZzZ5U3FSV0tV?=
 =?utf-8?B?RWg3d0NmSjdSVkRGbys3c1N5alpZSzNUT1FCczJDTUJHL1hVcWVRTllhWUhp?=
 =?utf-8?B?WjV4eCt4VTF3US80dlI1bklJcmZvZFYrTXNxQ2NuTUdNNUVlNEd1WVNuQlQv?=
 =?utf-8?B?eElBRENnZEZNVWhiT3czNEpmSDRsbE9McHg5UXZkZFIrVkkrak5wUEd2c1hE?=
 =?utf-8?B?N1VjZjV5b0Q3eldCWEZDalI3d0prZnNvMTBQc2VvZXJHdWI1dnhwR2RqYXJ6?=
 =?utf-8?B?MzI3KzJnbTh2UUdzbTRRR3ViUGQ0UVBaMWFBUGYrNGJsdDg1ckFSOW9sRGp2?=
 =?utf-8?B?eGQxdGt4RE94T0dZMzJZYTFLcTRhVmhONFQ5SVRJeld3QUl1bkxxSWNyRFpF?=
 =?utf-8?B?UFZJYXBhYU9XS3RudEk0dWZDOThGdkNzeVR3ZWRxdHRqV0xTdWI4NWFEd0F3?=
 =?utf-8?B?V3pVVE5aMVBXWlNUV0hWdStqazVNU3FRVGRtRmZvVDZ1aGgvSlQ5aExzRnlu?=
 =?utf-8?B?cE5VNzVZdE5KaERyVTZERlJoaldiS0lXZUtISk5DZncrblo5NjZ6S3c5QTZX?=
 =?utf-8?B?bmhmMGtxWG9qRStNbGRjSUVyWU9NajhpOFB4WXVJUUZTSHBQZnpGM1FHNHV2?=
 =?utf-8?B?ZUd0b0xMV1BQVU9xcVRJWWR3LzdRNkR4ZlhibitXaExJck5HcDl5eERab2xV?=
 =?utf-8?Q?Hz8XHvDf+iaTjMDLH5RY/zIfIGd6kE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5354
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26b3c41c-da26-420c-dce2-08dd777922df
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|35042699022|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmpsenF4c01wUTZNbW96aktPemMyV1dTbys0VVJINHpRYkFYTXVEMU9RVGY0?=
 =?utf-8?B?WG1hemMrNTgrOTBHNmxyQ0xIb1NrT2NLM0UraXQxK3NWR09xdkhyUHdNUmdF?=
 =?utf-8?B?bDlxZld4OG01b1dTZjBGZ1o4a3AvNlVaOGpiQmdyc3lBU0p5eTlxNElFSVZL?=
 =?utf-8?B?ZFlLOXl2MGw5UHVjeTJob3NjTnFiTXVqWEhVaWdQYi9nV2NCc3BYZWhWZVJy?=
 =?utf-8?B?ZFdwWGRPS3M3RE5BbUlmcit3UXlneThyZE5wTTh4S2JmKy9GdXlLVUg4WVI3?=
 =?utf-8?B?TE5ZanVPcy9uQ1g3d1ZWRmhYanVMOUtqa0ZNTHkwcE1vTTRyUHREWHFsR1Iy?=
 =?utf-8?B?ZTJEbHhMRlVSSnh3QUJ1WDhRMWJKSDFTM1ZtOWR4aXdndDhkMmVQSTB3dCsw?=
 =?utf-8?B?OXN4Z0hoTFprRjlFdDFCVlNrMVphbVhvRHZITG51T2ZYL2lLbndzSEc1dXlk?=
 =?utf-8?B?UHpGQXF2cUxYS1JnZHhzaUJaKzU5ZC9yMHViSkF0eVZpV0s1RSs4YTVPMkgz?=
 =?utf-8?B?dzIwdWNWa211YUdsYnhjQzZrSVFnNm1PdnZPbGtyeTBsMTNHVGl6SzA0L0RK?=
 =?utf-8?B?M1lLVXpRYlQ1STBjdHpRQURMaE9FWGtKVmZBMG4yV3cxU01Ta0NaUWV1L2pm?=
 =?utf-8?B?U29OWHhYYThzN2g1L2pGWXAvM2dCUHIwVWd2S3dEL1RVUCsxSlpzc2FRWlFs?=
 =?utf-8?B?NlEyUVlxTmNMdFdyYVdXZDFVOG4yYXQvRDlwRC9VWGhTd3Nac1BPQyt0M0Rl?=
 =?utf-8?B?M29oUjUrKzZ1QTEvbURwdjRlU05nOTlPY3VadlJnLy9UZWJsSUpNaFh1Q2Yy?=
 =?utf-8?B?eTBTaEdkU3VqRVlBdWg3MnkxSXBwK1FjaFMxQ1cxaGVtUUR0dXo4Q1FKQW83?=
 =?utf-8?B?c2ttZU9EWE1rSjE3NFBreStzNE5FT1I2c0VDV2Y3ZXNMdnpjNGV1UURFTXE3?=
 =?utf-8?B?OHFCSE9hNENJdldDZ0J6aWxjRkc3S1lWQUlST29WWWd6a2FJdVhJZFJEZXpo?=
 =?utf-8?B?WWdyOEUvZnc5bE1CRHdWQUplOEQ0L0NrT2cvdXRKRmVONjYxaGJHd3VqRzhT?=
 =?utf-8?B?VXVNNmk0WDM4c3lCWU1JZFc5YzFUZ1BMV3A3WEkrV1ArSmxZRHpkRkFQRkpr?=
 =?utf-8?B?MFEyRFAvZTV6d2p1em1YSWd3SExMMjhoenRXQ3Z1ZTF3NG5LVFB6WkREd2ls?=
 =?utf-8?B?UDV6TGV2eWsrZHpsU3drTkhrRjRBS3JocmhmNXBSNVZac3NsTXJFWWdyM280?=
 =?utf-8?B?dFM3STlQUFEzN3NMaEhGUWtZK1VucVZuZyt5RnBDdlZrTWdYdld2SGdKQTdZ?=
 =?utf-8?B?VjZxcnpocDVPODdyUXY5VGZGd1hIMTdVRjRpMC9abk9ONmhHTGFmL2tIT2tC?=
 =?utf-8?B?OWVxRVRjRWhlVStZK016TUU1YTQ3ZGZ3ZVo0TDdMa013VU9JdEhLcDdZd3Fq?=
 =?utf-8?B?bVhJb3VIdUdnMzQveERUckdLY21YakxoUjZzZ2N2VzRwZE1xeEc0RzIxbDBO?=
 =?utf-8?B?NFJiT1VKL3V0L211blBIdTI1VklGNytxN01uU2REOTlHZURpV256ZldIcTlm?=
 =?utf-8?B?b1lOSkExTWFyS3U2QTYvcFZJeHhlVDkyMjZON1F3TUhZdUhMenhlRlZ1UVkv?=
 =?utf-8?B?QU5ocjFDMVlyUjE0eEVOSkFuYkh1dnl2YUlhNWlHQ0ZUNk4wWDl6d3U2WHUv?=
 =?utf-8?B?SmlrTSt4akd1TXNGbnZOUTJrUWZVU1RROUpQQ0lBcTdzSWgwQVVSaHFScjA2?=
 =?utf-8?B?cTRSRGNmb3kzc1psbFN4R1RJaHFTMUlqUExONG1JYi9YaSs4c2FWNmNGcDFI?=
 =?utf-8?B?UnVYWDVHc2dwR3NyYTZSL05xL01Oeks5Mkh1SlhYV2duMEcyaWUycUFvdmlS?=
 =?utf-8?B?eFQ1R0RGa2paeE9lUTZHbU9XNzBHYTU1UXZBQnQwS3lKRTc2RHQ0YUw4TDZI?=
 =?utf-8?B?YzJzbEtkVmJZNWY4UGZIYlEvdGI4YlN3MnZBOWk5Y0FVdG91ZVBUWjFpbUE4?=
 =?utf-8?B?WVFsdFZPckNkSUhOZUsxelZmWllJeWM5S0czYnh0cjZYQlVWQTBmNktzYW1u?=
 =?utf-8?B?TVJIVXJzWGZWTTFvVVFsY3pIaEczcm1RbmZ0Zz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 15:14:23.9294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2b5177-e758-4f1e-507d-08dd7779362e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11152

This patch is primarily a proposal aimed at improving the observability of the
scheduler, especially in the context of energy-aware scheduling, without
introducing long-term maintenance burdens such as a stable userspace ABI. I’m
seeking feedback from the community on whether this approach seems viable, or
if there are suggestions for making it more robust or maintainable.

Today, validating that a set of scheduler changes behaves sanely and doesn’t
regress performance or energy metrics can be time-consuming. On the
energy-aware side in particular, this often requires significant manual
intervention to collect, post-process, and analyze data.

Another challenge is the limited availability of platforms that can run a
mainline kernel while still exposing the detailed data we need. While we do
have some options, most devices running upstream kernels don’t provide as
much — or as precise — information as we’d like. The most data-rich devices
tend to be phones or Android-based systems, which typically run slightly
older or patched kernels, adding yet another layer of complexity.

As a result, going from reviewing a patch series on LKML to having a concrete
good/bad/neutral result often involves several intermediate steps and tooling
hurdles.

Our current data collection relies heavily on existing kernel tracepoints and
trace events. However, adding new trace events is increasingly discouraged,
since these are often treated as part of a de facto userspace ABI — something
we want to avoid maintaining long-term. So extending the trace events set isn’t
a viable option.

To work around this, we use a kernel module (LISA) that defines its own trace
events based on existing scheduler tracepoints. This approach gives us
flexibility in creating events without modifying the kernel’s core trace
infrastructure or establishing any new userspace ABI.

For the past few years, tracepoint definitions for the scheduler have been
exposed in include/trace/events/sched.h. These definitions are not always
made available via tracefs, and are documented as being for testing and
debugging purposes — which aligns well with our use case.

However, this approach has limitations. One issue is the visibility of
tracepoint argument types. If a tracepoint uses a public type defined in a
public header, we can dereference members directly to extract data. But if
the type is internal or opaque — such as struct rq — we can’t access its
contents, which prevents us from retrieving useful values like the CPU number.

One workaround is to duplicate the kernel’s internal struct definitions in
the module, but this is not good: it’s error-prone due to alignment issues and
requires constant tracking of kernel changes to avoid mismatches.

A better approach, which we currently use, is to rely on BTF (BPF Type
Format) to reconstruct type information. BTF allows us to access internal
kernel types without having to maintain duplicate struct definitions. As long
as BTF info is available, we can introspect data structures even if they’re
not publicly defined.

Using this, our module can define trace events and dereference internal types
to extract data — but it’s not without friction:

Struct members are often nested deeply within BTF type trees, which can make
it awkward to navigate and extract data.

BTF describes data types, but not semantics. For example, sched_avg.util_est
appears to be a numeric value, but in reality it encodes a flag alongside the
actual utilization value. The kernel uses the following helper to extract the
actual data:

static inline unsigned long _task_util_est(struct task_struct *p)
{
    return READ_ONCE(p->se.avg.util_est) & ~UTIL_AVG_UNCHANGED;
}

There is no way to infer from BTF alone that this masking is needed. And even
when such helpers exist in the kernel, they’re often inlined or unavailable
to modules, so we’d have to reimplement them — again reintroducing
maintenance overhead.

To address these challenges and reduce duplication, we propose adding an
extra argument to certain scheduler tracepoints: a pointer to a struct of
function pointers (callbacks). These callbacks would act as "getters" that
the module could use to fetch internal data in a safe, forward-compatible
way.

For example, to extract the CPU capacity from a struct rq (which is opaque to
the module), the module could call a getter function via the callback struct.
These functions would reside inside the kernel, and could leverage internal
knowledge, including inlined helpers and static data.

Here's an example of the proposed callback structure:

struct sched_tp_callbacks {
    /* Fetches the util_est from a cfs_rq. */
    unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);

    /* Fetches the util_est from a sched_entity. */
    unsigned int (*se_util_est)(struct sched_entity *se);

    /* Fetches the current CPU capacity from an rq. */
    unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
};

The idea is simple: given a base type (e.g. rq, cfs_rq, sched_entity), the
module calls a getter function that returns the data it needs. These getters
encapsulate internal kernel logic and remove the need for the module to
replicate or guess how to access scheduler internals.

Since these additions would be part of tracepoints used for
testing/debugging, they are not considered stable ABI and can evolve as the
kernel changes. It would be up to the module to adapt to changes in available
hooks, types, or fields — something we already do today using BTF for
disappearing types (e.g. struct util_est becoming a raw integer).

While this approach would require some extra code in the kernel to define the
callback struct and register the functions, we believe it would significantly
improve testability and maintainability of tooling like LISA. It could even
be extended to support non-energy-aware scheduler debugging scenarios as
well.

Our current testing pipeline already makes heavy use of LISA [1], which
automates test execution and data analysis. It also integrates with rt-app
[2] to generate configurable workloads.

The attached proof-of-concept patch adds three such callback functions as a
demonstration. We’ve tested this against a modified version of our module
that uses the callbacks to fetch scheduler internals.

We’d appreciate any feedback on whether this general direction makes sense
and how it might be refined.

[1] https://tooling.sites.arm.com/lisa/latest/
[2] https://github.com/scheduler-tools/rt-app

Signed-off-by: Luis Machado <luis.machado@arm.com>

---

v2:

- Fix build failures related to unavailable cfs_rq avg field and lack
  of arch-specific capacity and frequency variables.

---
 include/trace/events/sched.h | 27 +++++++++++++++++----------
 kernel/sched/core.c          | 30 ++++++++++++++++++++++++++++++
 kernel/sched/fair.c          | 16 ++++++++--------
 kernel/sched/pelt.c          |  6 +++---
 kernel/sched/sched.h         | 13 +++++++++++++
 5 files changed, 71 insertions(+), 21 deletions(-)

diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
index 3bec9fb73a3..ac45fb9b1f5 100644
--- a/include/trace/events/sched.h
+++ b/include/trace/events/sched.h
@@ -793,6 +793,13 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
 	TP_printk("cpu=%d", __entry->cpu)
 );
 
+/* This struct is declared here so the tracepoints below can pass
+ * these types as parameter.
+ * This is only used for testing and debugging, so tracepoint probes can
+ * use the callbacks to fetch the data they need.
+ */
+struct sched_tp_callbacks;
+
 /*
  * Following tracepoints are not exported in tracefs and provide hooking
  * mechanisms only for testing and debugging purposes.
@@ -800,8 +807,8 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
  * Postfixed with _tp to make them easily identifiable in the code.
  */
 DECLARE_TRACE(pelt_cfs_tp,
-	TP_PROTO(struct cfs_rq *cfs_rq),
-	TP_ARGS(cfs_rq));
+	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(cfs_rq, sched_tp_callbacks));
 
 DECLARE_TRACE(pelt_rt_tp,
 	TP_PROTO(struct rq *rq),
@@ -820,24 +827,24 @@ DECLARE_TRACE(pelt_irq_tp,
 	TP_ARGS(rq));
 
 DECLARE_TRACE(pelt_se_tp,
-	TP_PROTO(struct sched_entity *se),
-	TP_ARGS(se));
+	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(se, sched_tp_callbacks));
 
 DECLARE_TRACE(sched_cpu_capacity_tp,
-	TP_PROTO(struct rq *rq),
-	TP_ARGS(rq));
+	TP_PROTO(struct rq *rq, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(rq, sched_tp_callbacks));
 
 DECLARE_TRACE(sched_overutilized_tp,
 	TP_PROTO(struct root_domain *rd, bool overutilized),
 	TP_ARGS(rd, overutilized));
 
 DECLARE_TRACE(sched_util_est_cfs_tp,
-	TP_PROTO(struct cfs_rq *cfs_rq),
-	TP_ARGS(cfs_rq));
+	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(cfs_rq, sched_tp_callbacks));
 
 DECLARE_TRACE(sched_util_est_se_tp,
-	TP_PROTO(struct sched_entity *se),
-	TP_ARGS(se));
+	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
+	TP_ARGS(se, sched_tp_callbacks));
 
 DECLARE_TRACE(sched_update_nr_running_tp,
 	TP_PROTO(struct rq *rq, int change),
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 79692f85643..d4b4646f984 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -99,6 +99,28 @@
 EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpu);
 EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpumask);
 
+#ifdef CONFIG_SMP
+static unsigned int cfs_rq_util_est(struct cfs_rq *cfs_rq)
+{
+	return cfs_rq ? cfs_rq->avg.util_est: 0;
+}
+
+static unsigned int se_util_est(struct sched_entity *se)
+{
+	return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
+}
+#endif /* CONFIG_SMP */
+
+static unsigned long rq_cpu_current_capacity(struct rq *rq)
+{
+	if (rq == NULL)
+		return 0;
+
+        unsigned long capacity_orig = arch_scale_cpu_capacity(cpu_of(rq));
+	unsigned long scale_freq = arch_scale_freq_capacity(cpu_of(rq));
+	return cap_scale(capacity_orig, scale_freq);
+}
+
 /*
  * Export tracepoints that act as a bare tracehook (ie: have no trace event
  * associated with them) to allow external modules to probe them.
@@ -8526,11 +8548,19 @@ LIST_HEAD(task_groups);
 static struct kmem_cache *task_group_cache __ro_after_init;
 #endif
 
+struct sched_tp_callbacks sched_tp_callbacks;
+
 void __init sched_init(void)
 {
 	unsigned long ptr = 0;
 	int i;
 
+#ifdef CONFIG_SMP
+	sched_tp_callbacks.cfs_rq_util_est = cfs_rq_util_est;
+	sched_tp_callbacks.se_util_est = se_util_est;
+#endif /* CONFIG_SMP */
+	sched_tp_callbacks.rq_cpu_current_capacity = rq_cpu_current_capacity;
+
 	/* Make sure the linker didn't screw up */
 #ifdef CONFIG_SMP
 	BUG_ON(!sched_class_above(&stop_sched_class, &dl_sched_class));
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c19459c804..e0ccc763ef9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4433,8 +4433,8 @@ static inline int propagate_entity_load_avg(struct sched_entity *se)
 	update_tg_cfs_runnable(cfs_rq, se, gcfs_rq);
 	update_tg_cfs_load(cfs_rq, se, gcfs_rq);
 
-	trace_pelt_cfs_tp(cfs_rq);
-	trace_pelt_se_tp(se);
+	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
+	trace_pelt_se_tp(se, &sched_tp_callbacks);
 
 	return 1;
 }
@@ -4698,7 +4698,7 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
 
 	cfs_rq_util_change(cfs_rq, 0);
 
-	trace_pelt_cfs_tp(cfs_rq);
+	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
 }
 
 /**
@@ -4728,7 +4728,7 @@ static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
 
 	cfs_rq_util_change(cfs_rq, 0);
 
-	trace_pelt_cfs_tp(cfs_rq);
+	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
 }
 
 /*
@@ -4865,7 +4865,7 @@ static inline void util_est_enqueue(struct cfs_rq *cfs_rq,
 	enqueued += _task_util_est(p);
 	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
 
-	trace_sched_util_est_cfs_tp(cfs_rq);
+	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
 }
 
 static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
@@ -4881,7 +4881,7 @@ static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
 	enqueued -= min_t(unsigned int, enqueued, _task_util_est(p));
 	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
 
-	trace_sched_util_est_cfs_tp(cfs_rq);
+	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
 }
 
 #define UTIL_EST_MARGIN (SCHED_CAPACITY_SCALE / 100)
@@ -4963,7 +4963,7 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
 	ewma |= UTIL_AVG_UNCHANGED;
 	WRITE_ONCE(p->se.avg.util_est, ewma);
 
-	trace_sched_util_est_se_tp(&p->se);
+	trace_sched_util_est_se_tp(&p->se, &sched_tp_callbacks);
 }
 
 static inline unsigned long get_actual_cpu_capacity(int cpu)
@@ -10002,7 +10002,7 @@ static void update_cpu_capacity(struct sched_domain *sd, int cpu)
 		capacity = 1;
 
 	cpu_rq(cpu)->cpu_capacity = capacity;
-	trace_sched_cpu_capacity_tp(cpu_rq(cpu));
+	trace_sched_cpu_capacity_tp(cpu_rq(cpu), &sched_tp_callbacks);
 
 	sdg->sgc->capacity = capacity;
 	sdg->sgc->min_capacity = capacity;
diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 7a8534a2def..7ca37abf46b 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -296,7 +296,7 @@ int __update_load_avg_blocked_se(u64 now, struct sched_entity *se)
 {
 	if (___update_load_sum(now, &se->avg, 0, 0, 0)) {
 		___update_load_avg(&se->avg, se_weight(se));
-		trace_pelt_se_tp(se);
+		trace_pelt_se_tp(se, &sched_tp_callbacks);
 		return 1;
 	}
 
@@ -310,7 +310,7 @@ int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se
 
 		___update_load_avg(&se->avg, se_weight(se));
 		cfs_se_util_change(&se->avg);
-		trace_pelt_se_tp(se);
+		trace_pelt_se_tp(se, &sched_tp_callbacks);
 		return 1;
 	}
 
@@ -325,7 +325,7 @@ int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq)
 				cfs_rq->curr != NULL)) {
 
 		___update_load_avg(&cfs_rq->avg, 1);
-		trace_pelt_cfs_tp(cfs_rq);
+		trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
 		return 1;
 	}
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c5a6a503eb6..2519da0c920 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -182,6 +182,19 @@ extern struct list_head asym_cap_list;
  */
 #define RUNTIME_INF		((u64)~0ULL)
 
+struct sched_tp_callbacks {
+#ifdef CONFIG_SMP
+	/* Fetches the util_est from a cfs_rq. */
+	unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
+	/* Fetches the util_est from a sched_entity. */
+	unsigned int (*se_util_est)(struct sched_entity *se);
+#endif /* CONFIG_SMP */
+	/* Fetches the current cpu capacity out of a rq. */
+	unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
+};
+
+extern struct sched_tp_callbacks sched_tp_callbacks;
+
 static inline int idle_policy(int policy)
 {
 	return policy == SCHED_IDLE;
-- 
2.25.1


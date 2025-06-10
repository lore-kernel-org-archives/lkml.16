Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F306A13C8F3;
	Tue, 10 Jun 2025 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569980; cv=fail; b=CQCQOgM4YfrmkBVvIOz7xPP4ZZtWLxsy/HftARXwVuPUtnYI649TReVW0OeeUAz1VLcysxobFjxSNmd5Lka1q6zarTOCbt8B5q3oJQfrB8fvWSWEga/6GlCyxv5LvENJ8xY77AIa25I2Q6IGaI+J5GGW5td+IZ9sJuMTwgYpFQM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569980; c=relaxed/simple;
	bh=dZqRl1uDVs910n0xoR4loYFcx5M/oKc5+FjZcFn0PfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F+g7hCx+Z+O7ANcv22HO9Bh5tUmLu8xX8aMabtBMiTev9CeaTdbWhJNB9F2X/KOm0IHoukdLGbBl7eyXwKyyYHYqFKsl56tx2+6XHcBZDsL9oazW1X+v2gwkc8iDo1Lz0jIYA/0HFpj5/yKpo68RyH6Ow6+Ekp1upHACrq0vdx4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QsCdgWr7; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QsCdgWr7; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QsCdgWr7";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QsCdgWr7"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SgMZj/3P0ZZ8Y3KZuahwfU8MqRK0cDNrdDm0eF9VGUVwQIcwA79BJmYa9d6jReb/IbHf3tucp7NAASVr9eLM3y4cP4OfvEAycUsg3jguGa79uKC9xSVSi7LgojCKJc8qdEOTenOOfaLDs97Avkv9qMb0kqLZLBLMKXFMWfMxJEa7a5jDc/+kYbMDiDbUkGGDsL5duuwenLjY9v0NdPEdPkxjIn//bkKttQwUgoIxVXgJ6wMkv7blkr2YQobonrV9irkxZM6H9OxkvgyO+B56jL7G3OT8rgrsWG2wcY9IlIP5ECaL7X78xMBD0hoM5bhQOVPIYq5d5CQ4PgSPYMEyow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=781O2cU0QIqY2hyRZSQLyXrx/oRkp89fxnPz0uds5OM=;
 b=T7a5Q62A8kBA1i9kQFjvQo1PBm2j/KO07nyBNq9o+Z3w1EZICx5ptsne2XfUZcL5CLYopAaL8I073FZwMIvaJrodlzhxHlfA/xJyqe/k6KZUNKmA2QcGaky5dHytLTYb6OWA5K5RsgXOlb7dPUs6/ZaXUI3Thic0c2F1ZiFfBgGRQ9ia4ZYv30TFpHFET8YChSSNIMOZ7n3qRMLfqhVQFKbOn46SCapqK2RXbkHzDknoJaQQcJpupFmbtL/nWlRVgcmDLjdWSX9xkPXVIjDZTsTJv391OpxF5FfQK4PAmLqbNJlSxpBzGSJJrybML1pzbYIsyudpEQgeSl2N4YJ25Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=781O2cU0QIqY2hyRZSQLyXrx/oRkp89fxnPz0uds5OM=;
 b=QsCdgWr72jNYlxJhth+K6WfarBXZUhTZFDCo/poBoYDzMwO/yTpQM8bN2o+pAohSMG+A9EOC0ePBkE4zMvH+/RP/CaIlIU5rJ7E7M2/zPmTm5gnIY406n5VpV4yC6x3miW8OSuj727ufpG83d/abSMGPhYyWD667xTtEXQ74qMY=
Received: from AM0PR01CA0109.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::14) by DB9PR08MB6412.eurprd08.prod.outlook.com
 (2603:10a6:10:23d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Tue, 10 Jun
 2025 15:39:35 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:208:168:cafe::12) by AM0PR01CA0109.outlook.office365.com
 (2603:10a6:208:168::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 10 Jun 2025 15:39:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 10 Jun 2025 15:39:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr2hGMYcavVSfWx1Dq67X/9fdzeJcim3DbB66rv0ZZpxVhFPjZgPLog4g4nvNUIDXE/ou7PJlW1//xfnUhn2xnin+3FdAMrvoN/vPCMvJ/p4m0g2lz/Qh9UwHpobi+ur9Tp9YEMvTdIBHjbKE9mdqi0A9zSrZUomsLbSmgmiDyZSWveRv+q3jjT8T+BKBMjZWSfbyHx7c4RzhBZRZJSk9sJN2o77l9zt5K8nB8wTbyRjqdWM0RKMshqpNT2JHkLDo+62zPi3PVmEn/GS828F5bvs9OKqYU2zAbiTabMdmKjl+QLds2vVwiLPFmaCzbgntV/EmVPHQk0YndMcwWo7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=781O2cU0QIqY2hyRZSQLyXrx/oRkp89fxnPz0uds5OM=;
 b=k54ypjqlm7zMhbiQREm6sRUEDu5/NLSIXHpjAuBEiIa/9liF9sgNinnhlKocTwU/sIcAdDg4W7j4Pj8rflQaMrN/KRDBFcd3yLEfvXG9TcZ84tuUeSNlSrgl6tAGuV+J82yhPfG93E8ED2GML9VJ+5CmWyT1zxk+ZdGIroo7TSPAR9BWgZQ/ioZArvRmVfnQct6idkEH63acDRDk3ANfqzCwJxaFXA0rJWsebR5DlBUCOzsCtf9YJxC/7g4kZ4on1iUXfMp7VeA/7Vr6IcGsEgU/k+iEFc8PWK3Oz0184mytVaPv0j/o6CTP1c6cc/qHsw8y9hYELyHg8P2peqDdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=781O2cU0QIqY2hyRZSQLyXrx/oRkp89fxnPz0uds5OM=;
 b=QsCdgWr72jNYlxJhth+K6WfarBXZUhTZFDCo/poBoYDzMwO/yTpQM8bN2o+pAohSMG+A9EOC0ePBkE4zMvH+/RP/CaIlIU5rJ7E7M2/zPmTm5gnIY406n5VpV4yC6x3miW8OSuj727ufpG83d/abSMGPhYyWD667xTtEXQ74qMY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB8484.eurprd08.prod.outlook.com
 (2603:10a6:10:3d4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 15:38:59 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 15:38:59 +0000
Date: Tue, 10 Jun 2025 16:38:56 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/6] kselftest/arm64/mte: preparation for mtefar test
Message-ID: <aEhRkDzankUBPQp2@e129823.arm.com>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
 <20250610150144.2523945-5-yeoreum.yun@arm.com>
 <6b13e414-9377-4806-abd5-fdebda6c14f2@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b13e414-9377-4806-abd5-fdebda6c14f2@sirena.org.uk>
X-ClientProxiedBy: LO4P265CA0258.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB9PR08MB8484:EE_|AMS0EPF00000191:EE_|DB9PR08MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: c71ea6de-0853-40c6-34b0-08dda834ff0d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3kCw/lilie/mvKPUnUgamkgSPvQoFG53s9d/UWAHjDFvQwhcIwzG+Jdnszo2?=
 =?us-ascii?Q?v7rr3avw4mc73GvguzoJTxNC7pOKBDbynxjilNT3cNdtNKnCoEw8K3ZtMQmK?=
 =?us-ascii?Q?KcIoPrFJtsfxE3FCkWZGMR2jriZaEPgEVnff4A7asw2zIoFh7uxGArUIsvmM?=
 =?us-ascii?Q?/mC1y2GGbGJPXf6oE7OIayXjhBUK2KwZmk/ed7NMXJNo2Jc3fz/YVk08m/RZ?=
 =?us-ascii?Q?lDfnOckTPnzlNORdjlmx75iIrZxSaU/8x3uL/DGCYG5HSzWbXdL6LG8j+bvt?=
 =?us-ascii?Q?XkucPsllNfxVa5xQ8nP89UanTtykLDJfGavgdbJ0nE7jiWBakVd485SVWBs+?=
 =?us-ascii?Q?7p8p6EmueOFjXcwuNranF8ZyjZ7YpEW5lPsoLllnatsOELh7jVZZVX0hInz6?=
 =?us-ascii?Q?NhSExXi8YsQ1+zSoe6gHwEy+5tCaKGhK7sXnT4o0og8zJQ4iZ0/Q0K511q/N?=
 =?us-ascii?Q?R5czqc8SenmxujL0sex64uj6yK8DxkwNJEO6MHZ33Q9zlrUlx2236OC3UTjE?=
 =?us-ascii?Q?e/rpayDZk12hfejgZwatxh2gIAhQeSu/NCgKeg1hs6cLp2qbjZSOcYr4wMng?=
 =?us-ascii?Q?/8GD5ebXPon4tBKbPZsKaY+P9S6mZe2POtXTSlHx/XMIw7yfJQpqiO8jBzrj?=
 =?us-ascii?Q?hckw/OYQPRNz1cukbzEIDE4WnY/S/Xb2bfyuw8n0thd6NCun/ADMqFGT+R5K?=
 =?us-ascii?Q?SwJd8OqYg/8Swg7hgvqrSVSAHjvMc31ZehlOOIdIlW3MXgP6ITlE7eEXSrjN?=
 =?us-ascii?Q?Gm3NC/l44FxHfGVM6SWmmBWF+NNUnFN/yqftYbWtDoc8aSZJQ3Az1hsPMu18?=
 =?us-ascii?Q?i034GAv/iHhilhx4YOtOoxVn0OBN9i70X7L5D/DIKgcdkcQiMN0RzLVoyUvT?=
 =?us-ascii?Q?R9mHZx1sf7DsG8Gpf1XkB6B0UgZNUM1TxKo3XbHlptpRgVPqqZFCoKKAmROB?=
 =?us-ascii?Q?YJHRFNziQnqiAhIkkZR61YPNjm8Bcacf2Gt6RoDIVts12tYfAqcjfVloHf4B?=
 =?us-ascii?Q?5DhN1UMM7weQBP2Ebc21Ch05qFfU7zzxgKyyrlhgkgX5mtQDkHWpPJ0hZb1y?=
 =?us-ascii?Q?BgW4siRa4J5CeZPeU2k0iI72zN80TnVFKE9wIhz8HtDhQNNG5FCfM0CyTum6?=
 =?us-ascii?Q?gxb6OCJ9pbZqPQ169fUmRqrCmnRpJSVkXgdaNG/b8e7rb474xMBjX8PLXGpY?=
 =?us-ascii?Q?l9iccvvlwx66Vlw3t52fMGaVe4bULdkpUSI1LC0RUGtPQKkYb1+a6lhCKZBa?=
 =?us-ascii?Q?lZxVS1coOfEs288mTxi4R1XkEygKLvSWcZLReGlFDXYa8lGOuT5+/rZdlwCX?=
 =?us-ascii?Q?RsraJogY8ZOZZZ3g49qxy9xLE/5C0WARz3tY+BltRgSvInFuEpA3lCAF0eh6?=
 =?us-ascii?Q?obXaTxs4y1/nQA3USzTeFwu5PBTikw7WseJr1tmPSKESrrbSgQERjP2qq44r?=
 =?us-ascii?Q?pWdYz+xO8mE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8484
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87137c22-f05c-440d-4a97-08dda834eae6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|7416014|14060799003|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K/XyrBYRCpEgImF/QT9oGSD75T2Qfn1y7xOE9LGqGy7xzrnKtesgw+AIeE9t?=
 =?us-ascii?Q?NJSIJTn59D47kG/kTUnneahSmGg2KiA8zqeVJB4OKFsiiMRTRmWGxnzkxjml?=
 =?us-ascii?Q?CIDAOu+nErLxZD/ImiltSs3JMK/iyPMOx0tVDnKs3pUf/wQfk3fK/6C6mtn+?=
 =?us-ascii?Q?UPb3HV/6Z6kUD77Xz4PgngucfIhESY+jtyoVaWFmdr66p5G3E/3hFRbdj2vQ?=
 =?us-ascii?Q?6T84XqNQAhrqoYgqN/Cjv6V8N6fGPB74C229hKbQjxhuWQGsa/InGp7wV5eg?=
 =?us-ascii?Q?7gC7NICq6fOmNsZnhG20jujpVP+od9gqBHwuY45waA0vxYOKl5mQ0h73Pv1X?=
 =?us-ascii?Q?QegAZB+GPwTzf1tz4FJbI2M7afaqubO73TJgXlHVfnxmwAupM+4VdRMv+HBW?=
 =?us-ascii?Q?MW9jVbipeNuT7YmYIlyYmzuiwAN8X/BnbOeu3/I1gj+x6Pnywym3jWALa/bA?=
 =?us-ascii?Q?5VqoirpUNKz0jr3rzy44vIBmmaIXxYY0TtuVxoFFZaADhM+WshK/RtWDqXqd?=
 =?us-ascii?Q?ZKvIf7Z4XO/aDUubG6QJ1tKlUOjMlrqLCYIuJUW3O12az/X+c6Od1P+WNIhZ?=
 =?us-ascii?Q?lUn/A30/0DBf7cked/rc7xVrPleQwQb/BPBUaAooRKQjMslDNUUDEIyiQscv?=
 =?us-ascii?Q?JYlzybxYyC8MIbzG/VdhSmwzQKdddoy7XjikG/AWBpA7/l6+RhQdw0pNynFn?=
 =?us-ascii?Q?lHhiS/x3aEPakZHSScwVbWYZpPGoLwPFVwtIN9SIu741Pnf8S6cZFN0CvNyF?=
 =?us-ascii?Q?m9Mt5utWZoFTkBnTmadmskvHr5Q5x3TbgRnU2ZqDsamvzXB1WmqNMrvAL93x?=
 =?us-ascii?Q?FD2vaS75b4o8AyH/vLOIZlPr3ePFguluUzhii5syiYqa9YU92JI+JO05Yi+3?=
 =?us-ascii?Q?lGUSCV/R6P38tP4t3x60O63m9IliW+P8krL60CBYl4h7GQ0BsKDvOFsrvh7C?=
 =?us-ascii?Q?p/fh2Jq/RUu4PVRMJvCdVT+JKLUJS6URxCrvpumSUWeAVn5anArwUtwnVxd0?=
 =?us-ascii?Q?KxaPigGp4K3SciWfRfRnWYlH/z1oCnej2oPCIXo+TUUWmJFPXftVs4ujt4VW?=
 =?us-ascii?Q?FG8JeCgMIuMoeOE6WJG3+0R/+p2ShqdpB+VugHG+cTzyGMGPhQn5+fofJAuc?=
 =?us-ascii?Q?QOfKLUPgjU3+mQwpeerkLzjLa4w61LTTeZPK5vUFwIjen3R6oibe/ERLXrmn?=
 =?us-ascii?Q?j9zd/EEPDQZqF9+/aYhgBcxunCZho5hXcT3FjpJ52b4Z8T7FwxoW6PBvOMtH?=
 =?us-ascii?Q?XFQx0RF4z3ZU8ix9vKV08PpfSUefs8c21ylDRIqyQNqCFZxoctw4pzrZzM2H?=
 =?us-ascii?Q?Dxtlj4btwssuYsFuuBmR37uACr1cVe9JwIk4jkr4jGJnwEvCqJ+HgAvQ3iz1?=
 =?us-ascii?Q?tG+PfkNy1uiENFyi+7MLumojFaP/Ifumien4r6OwCWeo2NWuxurXddjLfv9i?=
 =?us-ascii?Q?J7pe8UafodEVASD2O/oZll2vboGB88hQX7+oDvyU8T23mu1SfKjyskyOvX04?=
 =?us-ascii?Q?mztDavR6KPkv1M+ouHmU10Dt1/yVcYKYmLMB?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(7416014)(14060799003)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:39:32.6170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c71ea6de-0853-40c6-34b0-08dda834ff0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6412

Hi Mark,

> > If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault address
> > are preserved in response to synchronous tag check faults (SEGV_MTESERR).
> >
> > This patch is preparation for testing FEAT_MTE_TAGGED_FAR.
> > It shouldn't change the test result.
>
> I'm not clear from the above what the change is intended to do (ie, how
> does it prepare for testing FEAT_MTE_TAGGED_FAR).  I think this could
> usefully be split out into multiple commits (eg, adding logging of the
> additional si_ fields separately, or splitting the renaming MT_CLEAR_TAG
> to MT_CLEAR_TAGS), it's kind of hard to review as is.

My bad. I'll split this one. Thanks

>
> > @@ -45,13 +64,18 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
> >  		}
> >  		/* Compare the context for precise error */
> >  		else if (si->si_code == SEGV_MTESERR) {
> > +		 	if ((!mtefar_support && si_atag) || (si_atag != MT_FETCH_ATAG(cur_mte_cxt.trig_addr))) {
> > +			  ksft_print_msg("Invalid MTE synchronous exception caught for address tag! si_tag=%x, si_atag: %x\n", si_tag, si_atag);
> > +			  exit(1);
> > +			}
>
> We should really exit with a kselftest error rather than just a number,
> though I see this is just copying the existing style for the file so
> *shrug*.

Okay. I'll change this

--
Sincerely,
Yeoreum Yun

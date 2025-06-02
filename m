Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A8B65C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 05:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748840423; cv=fail; b=AH+OA8Xd+OEUFzEP4fWby+/fyHll07MqjZc9qWHIWPFyqIv7r/BSHpS/b01fS+upTJkEC/1JRB2QWHH4wbDUARy4CryVI1sTRnDK3plWAu8dWkl5P/aIJXYQHtw6TrXaJwoXJrs2uswhJFUW6m9797mYlwQwhznYyIeuYSuhqPY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748840423; c=relaxed/simple;
	bh=6MVdVtuI9xy6Cxp3jwk+WJsyMUhZc59IJiFBV2EtZQ0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=neUu0IG/3e83GAx/PtLNHUYYyoBssNyn4R2hu1Lw7iRCBMenkiLXuLvfmc/LUicF8f1XWXAlTWlP6J2r6GsRlOfTMHqf+RRYuB3scBClWirHJZ8pjaAlXbpr12AuvHykSCwUk1ylvFGdn4emx6e5bHEJRIY5far79PuQWU3mPXI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c9bz7L/F; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c9bz7L/F; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c9bz7L/F";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c9bz7L/F"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=p/ZqGWp4hfynw9JrP02Nm3QXQKmbNcuuUBvyeTWtDso/jFs2LKLn++sAMXdDsrAkHyqYhzPKxRgVD5Q1wuvA+ksOVAxPv5AOr41GO4X3yP6HR8Pk84L7rQPKzrkmG0K/+qCswESbmw6UNoUBIqAf2j3KUIYN45G5FI4flLyoi5HBlb2hoWxS1sJG+y83aI4gRC0vEfCafCfyPCHcf4ZeUsCPNj72NXoXUHUmowc17C9As6AvtvIq+QAX96lTPusqGRYMLB421q2hm6VsGLDeB05vPPaVPCM1Uq+HgRJvtyldxlUnyxgL9k64NCX9HKx8FiEwfsA+utoFoj4TLxGfOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM6izBOjrTnyFziQjIs/bsX38m4x+FPm5EXNHuTfztA=;
 b=WUraQXV5dNHiFwW1QXxZ5H7ebfUa3MZavkg3dlKoRNaAn/VjdcDdr3FUKb+ewq+GxywwIv+/ukwpwlRXmme2W8NiNUOAvZM7TNvMQPaeNToNPRLHOtdQ+iQqYFDfuFO2Gbp0vQqlukv10TO4LggEQYzp0EXUwEWWd035bWo0QysKZBPKRMBJQoO5R/w7QcfwyDhaQEjodDmLXNE2U0PrJwuQXG5JTKqCJ2wheGclOquIwz/AHhLuNQaF52YFztyYdCkVyzEOYdKxTd50EPpqRJN6hIzHYv6+SPa3jjjnPJ6BlGXmXmtTZgQ0GYNIWofrAfuol5j5yByL6xyvT1tivQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM6izBOjrTnyFziQjIs/bsX38m4x+FPm5EXNHuTfztA=;
 b=c9bz7L/FZazqwuzKoBYnY66nrwjv7cOR/WkJQtp+g7ziGpIm7cbVlwHVTgR01iZIBeqE7E4KR3CoQbsomD9Sx4acR043Do9ETy6GBZzt/6qUzTvfZZHugN5HuGyKgQEzxl8V3Eb/PyVojxAQJHGpP3UFoMpE7XSG7KoK/jOv658=
Received: from CWLP265CA0446.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::16)
 by AS8PR08MB8300.eurprd08.prod.outlook.com (2603:10a6:20b:56e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 05:00:12 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:400:1b7:cafe::41) by CWLP265CA0446.outlook.office365.com
 (2603:10a6:400:1b7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Mon,
 2 Jun 2025 05:00:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 05:00:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZJgtrrYdlDxgQ/1qTh1CeR8BNcy8vCqVxcjBkFb62IuZtOBYQbXjIx6EJ8036vIwKcKqIBqQks68tPMVl2OOl9k4dDfpXK+iG3dncT2WYiWNuVy97HuVhQIxgBlIJNK7Qo7embh7wGnJo8bsVMtzrSdXSy1iTwrcNUCSmHU6Zfl/E461miFshSpE14cPyAZy9AGRjFdVO9a/ft/gVlOmJr7lgSNfXpkCU+S6IooukzP1E5I3CW1Lzjz4NaxcUB96H0pXkI+guETuUxGEKjQ4YcfSpnxQCujqx/ywvxLx0Xlt1vCFWor1iZ36ji/CfXR9ymP+Isz/34rvH9V7bYR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM6izBOjrTnyFziQjIs/bsX38m4x+FPm5EXNHuTfztA=;
 b=tHo2KxrXJDmjCtoY9nJKTvuiOqzhtwDtQL0ERMeEfwwlw3BG3tjnJvIVGvvBkCKf0RY3Fc8N6I/chfS1RCKnXOuj7MGmE/aNSehzXS8BMopX918HgQsVyA4lajDnFm2v33HA5mXwQ6YzA/3esehjg0tQU3jazvPcvWTzDiZjYF6C9/BUIUU+YnqQqMbRUMP5l5/kj3yMGOROJTmzK9etR5Nzt52a6yPVtg/gLsUi/TVPidqWzhOjCS1rhnyltJzE6ukd16puX8UN+Y5cCNeXOFbt9rLbmpJyhEYHmI74TSCtzzAtbSn+tlFEnbWvZ6t96hu8DLfVwUhOYNMTlaHRtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM6izBOjrTnyFziQjIs/bsX38m4x+FPm5EXNHuTfztA=;
 b=c9bz7L/FZazqwuzKoBYnY66nrwjv7cOR/WkJQtp+g7ziGpIm7cbVlwHVTgR01iZIBeqE7E4KR3CoQbsomD9Sx4acR043Do9ETy6GBZzt/6qUzTvfZZHugN5HuGyKgQEzxl8V3Eb/PyVojxAQJHGpP3UFoMpE7XSG7KoK/jOv658=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAXPR08MB7527.eurprd08.prod.outlook.com (2603:10a6:102:24d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 04:59:37 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.029; Mon, 2 Jun 2025
 04:59:37 +0000
Message-ID: <7b71c574-0c52-440c-a83f-1e7d5dcd68b0@arm.com>
Date: Mon, 2 Jun 2025 10:29:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Barry Song <baohua@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250530152445.2430295-1-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAXPR08MB7527:EE_|AM1PEPF000252DA:EE_|AS8PR08MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9914e8-1df5-493d-6afa-08dda1925aa5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dThGZnQ3b28xLzQramJjbTRaQy9DSjI0bHFVYzVxKzJoV2dzczhEMm9xZDlC?=
 =?utf-8?B?cTFTL0JEaW9nYjBhMGMwOGZ2N0RTL0s1KzVwdHJiMHRDV3B0YTVtYktSMUlG?=
 =?utf-8?B?QUhTUS9hL3lZN1F0YVVKeUN0empDdG01YzU2QUlrTDZ3eVRFOVU4YkNEaVZ0?=
 =?utf-8?B?eWRvQno2L2YzKytIdDZJRmZpYW9WRTk3d0t3Vk1YUVlGQlFvNWJlZ3BleHJW?=
 =?utf-8?B?RXViVjk5SUZsVXFsUjh3Q1B6eXAzbmZxMERGbW82dGpoRE91Ym9TRGZwSVM0?=
 =?utf-8?B?V3FMSm9mTG1FZ1hBUnhWZWtIdWF4WGtrM3hDUjA1N3pBRWc1MEJaRU9QbDBX?=
 =?utf-8?B?cUx6bWFjMGZOZkdzUGxUWS83eGVMQzhXcWVrR2c5ZG9MSTJGMmhFcGN4bitu?=
 =?utf-8?B?UTFUVUtUajEvTEhNMERGM1JybksrRTYxQXJnUXU3QnJyNUppdUNYSFRMYzJY?=
 =?utf-8?B?MkhYc2xzaFB1TUtuZWFoMG96aHphem1wMEhwUi9qaFM1b2VFd1RjSk50bVBw?=
 =?utf-8?B?eTNkT29kQlcyNEg5TUltaTFEMTltTFBKb1pEeUQyYkMrM0lMdlBpa3MwZUhm?=
 =?utf-8?B?aVAxcEI3b0dLZzQ3RTZ4cDQyZ3JXQm13RVNxcHJua29JUEhPZzNiZTN4WktP?=
 =?utf-8?B?Z0ZhZTNWaEpPSVhmeHJKaVZ4LzhTQzNSUndvek5VWDJJZ2I5Z21HMEFPRHZr?=
 =?utf-8?B?ZVZ3OUVuNllJZmhsVVNuNWZ1MUJucnRhRXRjQzBTdHp5T1dZZHpwb2Z3L04v?=
 =?utf-8?B?ckJ4VTJSRit0QlhuTXoxdTY4eDcrdzk4QmZiSVozVHFvQUR3WHduSUFUV2Yw?=
 =?utf-8?B?VFFGdmk4NVIrOTNYZ1VmR2haY1A5THNKSmRFUk9TRDRaSjZjdkZGUklhS0FH?=
 =?utf-8?B?RWlpbjF5SnB5Y0Foc0krM0xjM1NRYUpxMjlkWjZPQmQwU1IvK2tLc21LaXdj?=
 =?utf-8?B?MzUyaDBiS05kL01FdlBKeGdIWENESmVVZ2tqa2FTRm0rL0Q3OWhZNXdDdXlY?=
 =?utf-8?B?QTBhOHBaaGVJVm5pSDNVWlZrM3haejl3akdkVnZtNy9qMEJ3ZW0vSUVRcXoz?=
 =?utf-8?B?ZmtTdmRNdjRnQUNDYm1SVFd0eThqNEdYSkNjQk1tTGx4VzJyNCtNTWMyVGxE?=
 =?utf-8?B?VUpQMnpFNUM4bFhKNW8vb2pISnVhaTNtakVwY2tkR2VkT01ScHZrcFJBRW0z?=
 =?utf-8?B?dGZJTEtqM1RPMDExbXZVMlJ4alp3VHE3aldOMTduNzM1T3FmdEREc1dOSXA1?=
 =?utf-8?B?OFlJenU0cGNBanp0UVBWajJZK3pnUHZLWDFLQXM0WllTVUducEdhRCsrWTd5?=
 =?utf-8?B?Skg2TkhLUU5Tc2pYWm85dEx5VUpOQm1hZHg5UzNGRXdqNW93eTA0akNtbEZX?=
 =?utf-8?B?a0FBMnA1V2J2dkRXWmVSYmR3NWNBc0ZvOW5UTThEYWYxT296OUhob0JwVmdr?=
 =?utf-8?B?S1hDcjFhZk1ZUVhUa2xZOUNNTG5xSlV5S1FpSFNvN0RKRlRjcC8yQ0Y0L0tS?=
 =?utf-8?B?RS8raFQwWEJqMkhPbFZUQWEyOGNJNWdXZ09wcWhzZ0xtNDg0bmNGbTdIdzh3?=
 =?utf-8?B?blBFZ0lsMjBsRWZZMGlrK2JoWUlwQ0Rjb1MxMEMzaGUvZGJGVUpDMGFyS2d6?=
 =?utf-8?B?T1UwVUtDT2hRQTdOdG5xcGl5SHB1R3lTQmdLa2xiMkh0YmFzdGJSSVRoS1Ro?=
 =?utf-8?B?NmUxZ0E0elVIaWl6OTNqRSt0WFRzUVd0NkVXZTk4WWt5SUNYczAxcHI0dFZG?=
 =?utf-8?B?L0kwbHVMdlliTjdaWmRiYVFLKy9Qby9HUjNvVXhqYkVMWDh4Tjl0NTd2TTlw?=
 =?utf-8?B?N3g5aDZ5RGF0VURqdlFRU2hsTmRQZ0FIUlBsVkhqOERPTXNzakl6eDZKMmZh?=
 =?utf-8?B?ejNZMitBc0l2Tk5lNk1RbmFTK21iWW8yMGwxMFNmT3FoWkU4K2ZEZDliM0hE?=
 =?utf-8?Q?SnkA4BMpgYo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7527
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee853413-5916-4c4c-99d6-08dda192460e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|35042699022|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEFXU01peGZlS1JPQnk0TkVPcGFTU0FFTFFMS09iRkI5UjhtSE1QMFFaczZv?=
 =?utf-8?B?YTdwMmJaVUh2blhCVE5seXRHVWNPMkM1eEU5NjFVOENZc2tkaDN6cDJhd2Vp?=
 =?utf-8?B?a1J6WkEvQXBpMnBhYzdnU2p5eXZ5TnVJS0tsYjlxUit2enpaYlE4OGpDSUl4?=
 =?utf-8?B?aXNDUDIrYW0rOU55U0lTMHBDL1hWUGNicTN3MG1HUlBTRWVIbUtCNVd6Zkhl?=
 =?utf-8?B?emNSSUQvQW1DMGxRL3grNlcyWVhaQVZrOCtyUVpsc3pSOHAxQlZtTnBNazRp?=
 =?utf-8?B?NVBVWTYxNHlYUjgzTlp1WUFOWi9wZHIxTHc4dmx4MURDZHdtK0djd1BSR0Q1?=
 =?utf-8?B?SmNhbjdHUXVSNWE3SUhGM2FBODN1R09wMEs4WFI1SE9URUk0S2JtMFIyK2c0?=
 =?utf-8?B?YVZrTFVjeVNJUThQMU5QM2J4YlFHQk50eXBqRGdqaFpFNTFpRC9STjBHbGQw?=
 =?utf-8?B?T0V3MEFNTk1wN1ByOUlIa0xoUDd5TVloOXdQY1c4WXJ0WHZXWVRZSURhbm82?=
 =?utf-8?B?cVBYVGhhZ2s5Y2NuSkphWmlpQUdKUDM5amNJNnVHdmVId3ZUaDlyUjNuNkRN?=
 =?utf-8?B?eER3ckdueXkxVVE0a05NL01Zazd2aU9TdEQ1MUVPd2FhSE4zRU1DQ0pqSFNh?=
 =?utf-8?B?MFkraDY1ekZ1amtkL1pKL0FsRXNJb2g1eFRIS05veHpHSkJsWHd5TkFYV0x3?=
 =?utf-8?B?RXhZTFpNU2tCV2dIRGg4M1Zlc2ZZdnQxZCtSOVgyTU9CYnljM3M1alN4NjI5?=
 =?utf-8?B?UHVEbEFjYnV6ZmxIY25GOTkyVWtTQ3pWNFFzTDZMS01vM1JFZVZicmU3N29P?=
 =?utf-8?B?V05HbUhpYXByeUFIOUxlOTMzOVFxcGtQdit3ejdydDNpWVNiUm9Ra0tRaXpI?=
 =?utf-8?B?QllKWlJFWmJGY3RZT3NOOWhFODZ5ZWRaOURJSktYcHNWWVJmTlFsb24yUGpo?=
 =?utf-8?B?VWxkVnJQY1ZYQVlvTEJ0N0V1RmNvR0N4N0Z0OHExUnY4bnZzQ0pxZWFkbllG?=
 =?utf-8?B?cXVYOU9qeUozejAxTGdNTVlWdVdaNnlnbVhnUjRHVTdDQWhaUXhVL2tmc3F0?=
 =?utf-8?B?UDYwZzFIU0c0OFlHeHBBUWQrc0drV2d6SDZRVXkwemNZK2tSaHpURXFuNUc1?=
 =?utf-8?B?aDZxZjZhUlJhZjhnZ0J6RnNvYThOSVV3NVRsU2ZtQithdlM3c0pzb3pFWHA0?=
 =?utf-8?B?eWFwd05DTHQvaHBCemd0WHRqTlRaQURLdlNVYmdRdCtyd2dmL2NxMWxZUW5r?=
 =?utf-8?B?Y3ptcmYzWWM2c1g5YWJpNFJLcHlTVVdtaEZNWnJFaWg5SzdDbXowWXhyT2FZ?=
 =?utf-8?B?ZlNhS3dOeDhvN2tnak9KUXhIRkw1MEZZL284bThsZWEwdWlBbXBNcm1CRVdM?=
 =?utf-8?B?L1pIWUg1eTMxN1NoczN6MHJ2NVZpZEhBSytrQ0dtL1M5U0Y0OVkvSGdNczBE?=
 =?utf-8?B?MVZRQ1g2NndYNmNjZWFXM1lZQ3FqR3FHOWhnRXRrN3lmbUMvZXRSc3NnTmJQ?=
 =?utf-8?B?TkdMT2dHb3RoSmdWUC8raXFmeUQ1M3QrVFlnS0ZZbFhmSnJ5T3JQSzd2UXdm?=
 =?utf-8?B?OHJWaDYrRjJHc2VUTmxtU0thNGNmWHlFaFlsVEJWc3JYeE1WTkdLYVVkYzNq?=
 =?utf-8?B?b2kvYjRqYW5KV2YvcGE5QXVyTEdFOEJKYVFxMUtaWFYzQ1hEeGoxaUNKZFlo?=
 =?utf-8?B?b2xHNDhNTnNpckQyZituK2szS0g2by9IMUlxbUdnM0IvMEM3L0pNdVhQWDJB?=
 =?utf-8?B?QW4zWmxHc0xsdjB5RzhiU1NiRzNPNFkxemNsRVUvNXlOSXVtM2MzL096SWF0?=
 =?utf-8?B?aEtPb3RUU0ZBaXpLTDZPc0pMQnp0ckFva2psOWg0Rm43QzFlZVlQcFZ2T3c4?=
 =?utf-8?B?RGZiUyszTXZJR3hNRlZPYVF5R0tIUjNvYk45NzBJbU9oUEdYRFdFR1hENENG?=
 =?utf-8?B?bXlBV2VNMTNTZ2hQSTNzV216MkpIOVBMK25iRWozU0Yzdm15NWthMlpxdHh1?=
 =?utf-8?B?STlTRExvMmVhZ01nRjZGRWZpUE95TVdZMHdaOVZoTzgzRUJiRmErT3BaZzY1?=
 =?utf-8?Q?VE9Bnx?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(35042699022)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 05:00:11.3597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9914e8-1df5-493d-6afa-08dda1925aa5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8300


On 30/05/25 8:53 pm, Ryan Roberts wrote:
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") describes a race that,
> prior to the commit, could occur between reclaim and operations such as
> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
> details but the summary is:
>
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
>
> He described the race as follows:
>
> 	CPU0				CPU1
> 	----				----
> 					user accesses memory using RW PTE
> 					[PTE now cached in TLB]
> 	try_to_unmap_one()
> 	==> ptep_get_and_clear()
> 	==> set_tlb_ubc_flush_pending()
> 					mprotect(addr, PROT_READ)
> 					==> change_pte_range()
> 					==> [ PTE non-present - no flush ]
>
> 					user writes using cached RW PTE
> 	...
>
> 	try_to_unmap_flush()
> """
>
> The solution was to insert flush_tlb_batched_pending() in mprotect() and
> friends to explcitly drain any pending reclaim TLB flushes. In the
> modern version of this solution, arch_flush_tlb_batched_pending() is
> called to do that synchronisation.
>
> arm64's tlbbatch implementation simply issues TLBIs at queue-time
> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
> of the batch to wait for all the issued TLBIs to complete.
>
> Now, the Arm ARM states:
>
> """
> The completion of the TLB maintenance instruction is guaranteed only by
> the execution of a DSB by the observer that performed the TLB
> maintenance instruction. The execution of a DSB by a different observer
> does not have this effect, even if the DSB is known to be executed after
> the TLB maintenance instruction is observed by that different observer.
> """
>
> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
> requirement because they are called from the same task (either kswapd or
> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
> if the task was migrated, __switch_to() contains an extra dsb(ish).
>
> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
> a dsb(ish). But this may be running on a CPU remote from the one that
> issued the outstanding TLBIs. So there is no architectural gurantee of
> synchonization. Therefore we are still vulnerable to the theoretical
> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
> potentially racing with a parallel reclaim leaving stale TLB entries").
>
> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
> This aligns with what the other arches that implement the tlbbatch
> feature do.
>
> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown during page reclamation/migration")

Do we need Cc stable?

The patch logic looks good to me, but again, will leave it to the experts : )

> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>   arch/arm64/include/asm/tlbflush.h | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index eba1a98657f1..7d564c2a126f 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>   }
>
>   /*
> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
> - * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
> - * flush_tlb_batched_pending().
> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
> + * all the previously issued TLBIs targeting mm have completed. But since we
> + * can be executing on a remote CPU, a DSB cannot guarrantee this like it can
> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>    */
>   static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>   {
> -	dsb(ish);
> +	flush_tlb_mm(mm);
>   }
>
>   /*
> --
> 2.43.0
>
>

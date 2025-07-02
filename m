Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CA02FC3A9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751473360; cv=fail; b=TimIjVUUFRw34iCb2bI9MN5NVMVNGlYpOwSXLxFO+w3FscpDn9qU2cn384HNt8DfGoAy5g/QBLgxBzZBRImcwqyl0bbocZLD1pyldZPKjaoO0C/9FhUNiyzs3GSfxMMx9OPPCOPx3j5rEURp0WnnW6n6cVbj25JYDT4tuMGLtuo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751473360; c=relaxed/simple;
	bh=IOb+Hep2gDO4yV1VMS2xavKfhELAoiSNwhfIvhMFXsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G2oXloPwx8O+6T7YUa0GScCZ3dOrjo6SDf8s4fbvtpsjCn7sGDXsxYXYn3QeWGdQLMwWfsjQy25fE68L811/Uhh1uR5elOzVmc0SdOnBPCDYFqxuky0bEWYxjD3wsnBZFAqOesaoq6efySpPxbZSB4ZHe1GSmHoatC+Z1oOsOy8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S1Qt0RGO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S1Qt0RGO; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S1Qt0RGO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S1Qt0RGO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yJMdP0eemcP6atNqB2XzxB5ARPzcXQ82vmmUsH70QorXThMnJvxs259zqiRRsuMfPrDc/VghxHqyAx2pQKHcP5PzZCCJunKcqYdsBAuUYf7x1xUXR4XpYwTHcjC2dEJFtQEuCif0pIZYiFKyMV/PE3WunuuROm7dq5rpVA6zRJR0O9paNGFm1sbHVbC13G02Z6jhRt3BCBQzfI/QpPL8uat/kjTD14mduGl0CHUrxuaCMNiolYD7w7Gps+Pcng30QUJvW3pp5SSpxh+f0+omIMb/0ibWTywlz6KJjHdkRguFQsJPQbLnanHID2lWYVAsgpFI991qpv7c7sBQZOvJyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXQ6jDoB+KGmh3iMkA3fqpoROxC/ks4eGvYjmA40akk=;
 b=tHCFbUtiIXQ8ujhqsLdfiapQTWoy2kc7hOi3DGS0A5fBZr8ft8B62NzfxP8Kyrp17UG5r5AX11QPgiAZuWyQVtvB3wEHOjy4s4giFhnAgdOAexN+1KN7fa9vJ5Yy7jq/XsmTOctfz/Vjg/blIJYUPNV4HUnjfj/W8esdaGdh6ab6sPf+wtvcuGdHpjmU34vivQ6g6uVWNQHSru/lAUbe9PxXP1no7+CY2TeuRNBsUOIBcwtl+iPAatzgA2s+LaT4YeI8lRQA5pEmpPPDHEvy1Q2W1SnWk6EXZHXb2EZjctgFR7l634iwkwe1aTKrkxWa0/Ur+0uoJxlfUizM21JdiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXQ6jDoB+KGmh3iMkA3fqpoROxC/ks4eGvYjmA40akk=;
 b=S1Qt0RGO8/0fBKrzSF8KGXSq7oO4SlNcLvylV1ZJ7T7z6QZsLcSIyurdpBRnbgWoPMTDEmDwDQWwvjU8DDnXf/hAzZumHP1bQplyY56tnKXEl/6QtlXuBMR1HdSRt1/v6W3mZS2cnq5ljR7YkhoXjbbvB6ibeqXzS1O5l5+yaFk=
Received: from CWLP265CA0388.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::16)
 by AM9PR08MB6146.eurprd08.prod.outlook.com (2603:10a6:20b:2db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 16:22:31 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:400:1d6:cafe::c3) by CWLP265CA0388.outlook.office365.com
 (2603:10a6:400:1d6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 16:22:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 16:22:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoMYFx2nSy4MIsZYQdIp37of4v4++BR6kdxrOtoEPGYIwDKYkNFU/OZQ6lPCCSXRRp5aE3wN/8U2EP+82xbl2+kkLaB06Cm0cqHr3UR0ZOkMDaWLC7ELpriGR0sxft9JUtwj5MjegAxC8VcYU4FDadMUU28knUNHDDqt1y3ROHnBYIozNUgmhRccGMah+OF+YhW+WVWvb9s8kt+ImPmFakEU4AI7XLQLexOG6vxhIxRa/jh5ALCuaaBVY5gpM0Jupa7/ynsUIiYK4hX7AG+LTL+YVV0w0uebTUv8GOyHZm7kchXqBh6I6OHeYj86AXhS+019pU28yWipPIyfHLStvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXQ6jDoB+KGmh3iMkA3fqpoROxC/ks4eGvYjmA40akk=;
 b=MwgbyrBcRAP0/zRFH0RwFplOih7run6Bi4B31/C623HGWaHEgm9D5Grsnzcs5+mY3E90SIyFGkOkyn/Jw0vWgB/xFekfyriSOYJ6IhrJ77/s9Yn9jv6Ap7tYWlL1TkwtCYi0AFXDLa+SBMFQqVczJ8jmdOl2Ga4RJpULwU9BcPWLqOtYC0HgNIY4I2Bcnjqzz2QSbuRo1Vz7cdz38Sx2xuvA4uNwHCToXQUoI4/+JzWgLlAxauQiWZtv8pStZOdADK+puVjqam9xeGiCM+w/MyNJL3opIStI8+GyS8Vn150U6mRx76Hc/EaNj1XCRN6hAY7pqtFthCWE8evc7xsmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXQ6jDoB+KGmh3iMkA3fqpoROxC/ks4eGvYjmA40akk=;
 b=S1Qt0RGO8/0fBKrzSF8KGXSq7oO4SlNcLvylV1ZJ7T7z6QZsLcSIyurdpBRnbgWoPMTDEmDwDQWwvjU8DDnXf/hAzZumHP1bQplyY56tnKXEl/6QtlXuBMR1HdSRt1/v6W3mZS2cnq5ljR7YkhoXjbbvB6ibeqXzS1O5l5+yaFk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAVPR08MB9579.eurprd08.prod.outlook.com
 (2603:10a6:102:31a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 16:21:56 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 16:21:56 +0000
Date: Wed, 2 Jul 2025 17:21:53 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/28] coresight: etm4x: Add context synchronization
 before enabling trace
Message-ID: <aGVcoT9ChSwXUUq5@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-6-23ebb864fcc1@arm.com>
 <aGUSZpR1QHNgLu6f@e129823.arm.com>
 <20250702144028.GY794930@e132581.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702144028.GY794930@e132581.arm.com>
X-ClientProxiedBy: LO4P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::19) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PAVPR08MB9579:EE_|AMS0EPF00000197:EE_|AM9PR08MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 1690987c-3938-434e-dd7e-08ddb984a4b8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?EFOtZUGxH6SNIG0oXvClo491yMPV8CRCZz3v0Nk20fjA1w/yU9c20w3aVGro?=
 =?us-ascii?Q?hbp13Iyz/+RwkLqhHCmGJkOXmTtPVqdvOXWPGKMYWT1cLFOu1dqYbZ3Hh1jF?=
 =?us-ascii?Q?J2Kpv3n7P84uZZz1iDKbqOAsNA2kPibG/jhYI97xC267pgdsCjMLXQ+XAvvL?=
 =?us-ascii?Q?m3mmsM2OB/W+f4hp2WfAQEP5ByvnaM7xaN9UjLvFYPA3xqLx3XrW71Ntrocv?=
 =?us-ascii?Q?J6nsdw3CbldSweGjYixm9WoRsNWXd7wEZfgIXuNtEQ8ubsnty3Pe4k7gDuJ3?=
 =?us-ascii?Q?0AJuOUTYE4RBDwowABY3sddS/+pb5Vkr+uvD/Nafj/6uqLphIYk177WK8jsT?=
 =?us-ascii?Q?QdC0Xkw35oJpWGO6RJaja7hja8UeVyVBf/pVPj3gwnKtzM0pgy7aN+mVwEil?=
 =?us-ascii?Q?1WKEYPai9c36hXkU/+Ci1NaiQfQ+E1sBdx+3gumHJcSFbpKmJYk07egVSwHY?=
 =?us-ascii?Q?594NBGouhn0rHmCm7rbrC7gWr8yCbqG+eSSz5TMnx3n64u5WtQ/c0tWyKtix?=
 =?us-ascii?Q?I0i0dPZLCNMnpQjayPWmhx8ABoRNT+s2JsijXgaDLmkeH8T/c3vcrYElmc9O?=
 =?us-ascii?Q?cTYfqXqIvO89RMnC+8ZMXWJzameXwgCzdIkL4diALQqkj33ahpSDSJ1TKl/W?=
 =?us-ascii?Q?oDCzstyTmKk15B/2zKw5UyF4FSzKzjgpfFqDh4oDB0Oen5xUyrNT1JuNee/y?=
 =?us-ascii?Q?vcS0hHy2asFpF6sKvlPVBxMCD8cRROlHFBYQsWhBDU2t8ENFgO7qUDvbN6MK?=
 =?us-ascii?Q?MnKFbqwZ0sY0ZMnOgVwFujDpHSvSjV4wQQM5a0zU7Nw8Rkl6x8EyX9ZrDn1F?=
 =?us-ascii?Q?z5Ftv8GeEveECR8zoMA7C/d4tXxFLOiLmDuQYKUszMfOlAbYubB16EWgrB/L?=
 =?us-ascii?Q?76GuXBIPY6yIs9o8s9a4xGIQ7bIyp9yHEnppZXCUlz+lnBW0XYhOP5iy216I?=
 =?us-ascii?Q?J4Dc8BB8ndPMk2PRJU/Ss6sr5JjYENCSfBtmJisIIVo+674uBP+40srZPovI?=
 =?us-ascii?Q?ViKR2796iK5b1TAK2oOM8pnhKGCXk5ZnBclXIsWrrZolc9fF4ZZHQbIR32O6?=
 =?us-ascii?Q?pA1cGUva4N6U2V4E+eUDn7qPIv9WatYWnn621UTcaJfgwricKuStuLfHalWL?=
 =?us-ascii?Q?j2Lrqt4Ns/y5/VsAnrPb/UzjjB8u6XIld+0S3zd1TGAKCBST4E51Qx3NPsEM?=
 =?us-ascii?Q?4P8RcTDvmAsGFIPP2mk/xhc4qBYyqudDNW/8OscvF3xYmNOrmRN+0d4gwlXQ?=
 =?us-ascii?Q?D6Shn2+BWop2GTwjiDwxhtgYscYjq3nH3CcXvGuqPBKb6Sd6AruE5ckRKyva?=
 =?us-ascii?Q?J1ACaFN7tP4joRmG9INs4jEYrusFhPqOjBND5cV/3AOMDxx5lGloF2yjiIAx?=
 =?us-ascii?Q?jbIoInf9BL+5goce0uqGTBPW0Wm12Ko/OQxB0+VBdh0FsT+9rtt/tC5a0cAf?=
 =?us-ascii?Q?SNg1vhLvdsQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9579
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2f1f916-1033-4312-246a-08ddb9849022
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|7416014|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kshE6x16+1G8KAgq1GLMrRV/fLNwLZ5dXux7zGEbZgQVap8iHDNj+X8CuIuJ?=
 =?us-ascii?Q?y+mFDYRG64g7LDpz22KkIS0H51FyE6jVig7mAi33qzn248iD9NL9KdF63L5r?=
 =?us-ascii?Q?B9bBp/2Z6C9CdFEdFy6EkqBZGmZNtehgHuaFw4qrHRI8Y7COMKY9x6vPOlZP?=
 =?us-ascii?Q?t53g9je2XRp3PKiNPlbJZr3ooqaSAQ3D8H/CF97okCgNRgu/ZNDxCXO3Pb7i?=
 =?us-ascii?Q?EvJPW5FksaQzW3/MPIYQbTKkB1RuIuAz3ggMC9gAlYB+j8ax+/lAZrrWRTxr?=
 =?us-ascii?Q?ehKJ7Xl9c32jnLnnQAJ/HxVQ2TNKr7AA/NhlNoig1/6+5mylvX+niKSDAYNp?=
 =?us-ascii?Q?N+l6E0kztM4eYd49rslcnl/Izfa1UMHzFCu6hcr7/jX3MNuxmIPdIN0Ps1K4?=
 =?us-ascii?Q?Em3tIKgu7dswgm3gucHhy3ZamySfpZ3in0YSxL9MqbnMAWG7nOo46l+PHrBk?=
 =?us-ascii?Q?7qfQRx/77HSW56JRGju7TAxeJM1c6Gsv9wB/noU9xOJAT5uMC+9WGji0TEec?=
 =?us-ascii?Q?yK0+IGEvXs5XHGe76pGCbu6S1WmamGhfRlHWLSQY+My2GqjJgtaCGBYaKnWQ?=
 =?us-ascii?Q?prrqNJud7/vg8TIUR7pLfEDVv1zqc4tmllrbeh3pDBCNzRdVbmQBT1/Xhd7W?=
 =?us-ascii?Q?uIHXx2zREsujyuqHHcY4ALA43QWc9c2rYnxq7qTfl4/1g/rF73eHhvPgNj0K?=
 =?us-ascii?Q?5cN21C/J+eGEyyjxeV0Xxiq3yRvPWHiTmHzGoFjtdS5XXEzJyry2BiXfYDQt?=
 =?us-ascii?Q?bdJeJHf8wXfnA0pQZPvZYnlMtubT7hzZprglRp3XBDdT/j01kKVGKy9F6F9L?=
 =?us-ascii?Q?J041F9MLDZZJsM3Cxd6bpnYGVT0DWCm+skdLitukl+KyyQaIF3ZjU9BQAce5?=
 =?us-ascii?Q?j1THjUETbe9KslWGqXn6w4QJVHNy4hcxhngtRebwZRAq1YLlIf3/UGSH5Sfm?=
 =?us-ascii?Q?gWMM9ZRWzJL9x90V0aapg7wjt1gpUxxNuwxtV60Mva9NCgQ5XUSXT9kt+Wwi?=
 =?us-ascii?Q?u7Jso4mEo/8UuW5bPxs57v42h/89Ne4Vai3G0T+Xpn6icW4VGH1ZwD78fLzp?=
 =?us-ascii?Q?bYLvfNFeVED3Rv85rx31fFabOh+ykU4UyRMdYdlLNe/rfXxl4MeDB4y+WNxf?=
 =?us-ascii?Q?ugeJkl0pp0Gjp5a2l8c2eH678cvDuXBhh24MGzAgz5gMxVIaBrWclkNcljvS?=
 =?us-ascii?Q?V6f9Jq2/dTXyU+bwrTjaNLCWtS4SZCHHtntrbn/a4VEjwqtlbEaK+ymgiLN4?=
 =?us-ascii?Q?9avNjlj/hzYQD8Ynn/wlJgYXjUfY5mSDW/ruK34JyR1WLUkaua00SIkgbdeQ?=
 =?us-ascii?Q?hnxPjCc2Ma8/jscGPwcdERb1LD/DyuqYkO53RKoo+GkTLf2MW7hOhJJIOjzd?=
 =?us-ascii?Q?bgjwpoL/7nHZU4rkDVdN0rDSmTEY2npFOMZRbaKWW4o9DI6IKP/pS/NPTS27?=
 =?us-ascii?Q?KC2nriL429rzNnx73TEJG3RI6l+/sdgpAFMb8+Mt2qxrRTkV01l9lb34MSKT?=
 =?us-ascii?Q?jo6YaC77x11bEeRdIOrGRxqkJrOiYfk8hh3V?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(7416014)(1800799024)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:22:30.5944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1690987c-3938-434e-dd7e-08ddb984a4b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6146

> On Wed, Jul 02, 2025 at 12:05:10PM +0100, Yeoreum Yun wrote:
>
> [...]
>
> > > @@ -445,13 +445,37 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
> > >  		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> > >
> > >  	etm4x_allow_trace(drvdata);
> > > +
> > > +	/*
> > > +	 * According to software usage PKLXF in Arm ARM (ARM DDI 0487 L.a),
> > > +	 * execute a Context synchronization event to guarantee the trace unit
> > > +	 * will observe the new values of the System registers.
> > > +	 */
> > > +	if (!csa->io_mem)
> > > +		isb();
> > > +
> >
> > But, when write to SYS_TRFCR_EL1 in etm4x_allow_trace(), it already does
> > isb(). Is it redundant?
>
> Good point. It is not sufficient. As a system register writing in
> kvm_tracing_set_el1_configuration(), this is why adds a ISB here.

Ah, I missed the write_sysreg_s() doesn't include isb().
Sorry to make noise..


--
Sincerely,
Yeoreum Yun

Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E8283FFD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032271; cv=fail; b=p/2t6IBIxawcrEAJKyTRIFc+SO+B5nRoCiVre5A+5/h8VIoLvohMOEMG16pBabCX2tINBE9BEBxNJi07sfLB8uUl/ii9bdtZDk3fygH4CYI3/oIK6XB60quXEbEp5T0M2bUojYYnNRRSDxO249GnjWF0OMo0bDZz3Sm074aK8zM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032271; c=relaxed/simple;
	bh=yrFbDucNH6h259ExXTAmbk/qwUrthPCYcMHkkoL8oT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BWWaR9kcg3nRprKGvI6ISWrjqCwub7OPRBGuE74A0sNMwdQTcACBA5YIqsWbAq97RHBKIZL1OyjiN3el0Nrz/nJiDZOkLXxntTXbK/hZc28w2IEGhFkl5Z0/Ft+reVaM6DFE441hSlEb7b51uJnIVEMXimIamB8Ps+ojmQmnFAA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZAk1bduJ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZAk1bduJ; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZAk1bduJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZAk1bduJ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a1gBHmJYxbegrZPSjNvOawwbUTpA0xEbMU1ebAN1hOY6Ob5UTdDOac7RpgOLJqQL0gIApCao85+I03ry3ecnR99Q37DLoG1wXiRqASVHPc0ndAPi8TfRnaMqwFT1Cd3GfHJJPBg0rBXARRjIz6IRSKh5Ffsirq7b5716vVm03jptzirh3NVYcd+d5SmU8yNisdbDQADbdOyHPhr3lJMmGaMauEw91Rt3ZZzV0FYgZcQchxQG8kBLUwNZ0yZyeF4I/2rZ+grpPMWGqkDnQcMYBkTRmv9zCwgoxWymtaqEtghp9QG/ma1nuY6AXd/7w4AjF737aULz33rDBgihkx60yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SehH3+FIBviJK1fAuq3/LV+6zcyfG1GREZL7vlCTNjY=;
 b=ReGRiLK8ugqCPLbXgnzCMqyoUks7TxxeRd4ZBu9CbHEn0AsKYRBT2bIy3BQhc3VsJ53mgoos38ZoWGBACT3SetX9tcdPr4NoQjwQM2qpmEEeWEL5UJKqqe+pCARA7+FMxHLfKBBBLk2M930HJrV2bF1s+QHKViKnC/owCjx5LmQCLScqi+lZKegzPxG4sG6SwGRKRfX9+WyGW9MjuDpJA4GicQAFVuTkEfieEJVO/pxukFtMrvH80ZIx2UFuXoyfjiljE4SHFjcG3PTdnKTGpjUvql6fhjHcLp42BYBzuuh6WXfP9zX21wdMIIa3b7pZxw+o/x/LchNRwNwcypcOFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SehH3+FIBviJK1fAuq3/LV+6zcyfG1GREZL7vlCTNjY=;
 b=ZAk1bduJTna4dfoIRBKSGrO7ci2KKeTkLTPdnKAuYzv6jpCpE62zlHraUxGfo/Gy9KvyYgeX40rPENB3If8mv8kUCTO2QwCv8OrixP7rmPJbby1f+Ys6Pgy4/fp5ZghdgIaskk2Cfr3ME7+SYMVOVSi4yUPjSqx9LSGIZRfQE68=
Received: from DUZP191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::16)
 by VI1PR08MB10200.eurprd08.prod.outlook.com (2603:10a6:800:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 13:51:00 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::dd) by DUZP191CA0006.outlook.office365.com
 (2603:10a6:10:4f9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 13:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Fri, 27 Jun 2025 13:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i39o2+gKP3Kd8AbuJHevUrD4AXR6jGZryNcP5eGANQLkB+sUUGTK7bbEZ1xUvHRcMjOyeRnWthBkJAFhBPrEeT9NcK/XQqjv0pkC4cY0NCTi10DjTRxNo9DM3WblsP8Rr8Dw2jEKX3wjBBBj31Zo2AYBIwfI4XTKGf+GCmPbrx5pyhBq6JSObR9sx6zavg7ND352o0GcJAKrL6ZiAP/o6nCK5wOYMWwPh8p5b9EgO15zO4ul0UNxJf0Gt7u8PP2+ErC8PQAPBjA1IURfFHc9WVm+SGkfDnNRVmB2QogUoZRG+6jB+sRFazi+H1blubGRiQLZ031ZOmj3P5/EBjrbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SehH3+FIBviJK1fAuq3/LV+6zcyfG1GREZL7vlCTNjY=;
 b=lulyfJiPicBrRyBa63mzU4USb03G2iTwJ3U40iXdTWH/uAMib0WSpiPfg2FgQ4vaAQ/bXHjafFvsAo6IDUlLK/szLNCI1r11subNGUQoZ1eL3lDKaNON8o2+sg+rNqBYnc62+i9yVOYQmD3O+coqj262JBAjt0g2YL8ohs8GapK/IVCN0LYmdt5qdQsJznWSspbM+Z97bro/9D0DpSCiuL1qrdenIr6L9ZdTTqT8Fuz3cT/zuqbynMUExIwRQr7DUvNeGRO/hPnDQhjLx1+l5NRmT15LvE2aKHL32q69pv796P3pv3k+I46XUVSlSqt1pBccTolcwa3zs9/HCym+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SehH3+FIBviJK1fAuq3/LV+6zcyfG1GREZL7vlCTNjY=;
 b=ZAk1bduJTna4dfoIRBKSGrO7ci2KKeTkLTPdnKAuYzv6jpCpE62zlHraUxGfo/Gy9KvyYgeX40rPENB3If8mv8kUCTO2QwCv8OrixP7rmPJbby1f+Ys6Pgy4/fp5ZghdgIaskk2Cfr3ME7+SYMVOVSi4yUPjSqx9LSGIZRfQE68=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GVXPR08MB11210.eurprd08.prod.outlook.com
 (2603:10a6:150:1fe::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 13:50:25 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 13:50:25 +0000
Date: Fri, 27 Jun 2025 14:50:22 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/10] coresight: Fix and improve clock usage
Message-ID: <aF6hng5zsao38hA0@e129823.arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
X-ClientProxiedBy: LO6P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::18) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GVXPR08MB11210:EE_|DB5PEPF00014B8F:EE_|VI1PR08MB10200:EE_
X-MS-Office365-Filtering-Correlation-Id: d37502cc-70fe-40c9-d755-08ddb581a617
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Uu9n6jsTO////wJ6XXoZSMHAC42WK82trt2whOO87GIxSqJGTR8EUO5MRcjo?=
 =?us-ascii?Q?saWhNBV4xAki1Gyb4nYdxsWovfUmWcE9JSP8Q23OiQzUnjAndF6o3RR7Lxhg?=
 =?us-ascii?Q?gq9q1HU7F4Pox7fy/wAQgWqp6L2OO9oRxWenM0oPo6NP6ivHWtuQZOJOuJH0?=
 =?us-ascii?Q?yvxTuW4itxOdt9GUIv1POE5+cOVbDkVxGkPetM7E/j8S7+pJHR3wlx3TDV83?=
 =?us-ascii?Q?UvYi87tL5ORmSkvvlaL1dBV9wF4b5BsOP7Wa0BLTZ9oFZxygembYyb9T8v+e?=
 =?us-ascii?Q?rqyRycG8rNvgB8marU5tolWx9Wn8oy+kZdDTnnPOonrSsGEQPZ2WDFKMh366?=
 =?us-ascii?Q?tCJqVdl68JtZYce+o3X5JoP1ycCQmeRW3Y4dEPrWQHGeClgkq3utT/SI23HN?=
 =?us-ascii?Q?HlmFf0ubUNyUx/DMQcQp+2hG+Y87vOqooGLzJKRW9ajFNDtv4gygPLz+xzh4?=
 =?us-ascii?Q?3EfVDgLLWaMTqSmxs2w1Q9kha9jbR5OX3z0UzT7e20lLqEYcb7ZsrhGWgVrJ?=
 =?us-ascii?Q?bJKZSAOp+78npi5od/QS0VBePVmdkTaGXXX2RrMyybK0vKJb6wmtTsDZSU6F?=
 =?us-ascii?Q?v//D8rlOSU5SFQeHmnyqPu4YWub4tigWkpxZn1Y+0F7Bp93UOiRaAgDsTrBq?=
 =?us-ascii?Q?3eBA8T6GfIIOwHfSQacWs/X5Va/BcxrbUPo0xz1O0xWjQdxiRa7RZm0Gbb6d?=
 =?us-ascii?Q?2Nq25S0o4ehEgOgLNzQzhm8xbZLfhPQBtNKJ47IZiKEM95EXPMRh+7WoybQJ?=
 =?us-ascii?Q?ucBgPt7jEcs2GmVUan7Z0I41sCj0x+ayHzl7s24pdBzMc3zd/Xd8B+9nFZts?=
 =?us-ascii?Q?6Y+6YisB7rbXSgyG/85EqkfpNBHADmi6/zqfATXF4aGu8W1aT7RokuRLsj0G?=
 =?us-ascii?Q?vPXu6jEYf6lnzxBPjTcz/kQjhCzF4ofbpp2YCUJBWIVPhSKHXtpNTygPT2Kr?=
 =?us-ascii?Q?8rjJKmZGN9+3WObYJ6jBLwNrD1XbqsMpf42QT6C/SlxDQxA7Yv+PIG//jWUo?=
 =?us-ascii?Q?rRY+L0ynR+e5T0HDZdfMH+/+pv0yK6yijUoRsEpA99k4g+EfBGrFWqRFrxsr?=
 =?us-ascii?Q?7TbMYvPJzaZ7DlOTtId7c/OMRHv+JpwdI9pjeierrG8LjF4Xw0RDa4cWTiFm?=
 =?us-ascii?Q?P/S1ZrglN8CNP7a2pQnc0JnRR/kIzNDKmjGJk90Tx0rYFu9zGpYz+HYuOHsZ?=
 =?us-ascii?Q?rM1CY2jsw0SqAtI4ro9xl3S5uvOnLhS7BdmNg2ACyJz/Naz2ztxxmY3oraws?=
 =?us-ascii?Q?/Y1FHt17eJVAqOo4MBzUQJExPAzKFtK8Y33d/5vvykWoxChNWtEVX9xPGA6G?=
 =?us-ascii?Q?jY0zUyq4X4D5b56xdjtnxs855Lpu4SdNEJcKz31rz3JxzjHQshIflhRz2nMr?=
 =?us-ascii?Q?//n0JWvJPaPkOSdoJEZEpuT1+NW5mndpp9x3LuWwVeN9uo0UisB1StqGdoPJ?=
 =?us-ascii?Q?rryPaoAM2vg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11210
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18bb58ee-11c2-4ff2-8866-08ddb5819183
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UJCXSpRKG2J15xB2Az2W3CnLfd53FxAarZ2NEp9r4uX9OxTOMG/zwaLDFc0F?=
 =?us-ascii?Q?4aT4Wr4ZXHOXWBQ0I53ln/BwGED9RYx0gxnWiaUjuUlQEfFreiE7it3Hn0O4?=
 =?us-ascii?Q?YuG6R+SVn172vqg6KtiHxYy8ScvlQxasaGzCVirlyWIQZlX/azHYL+uc1fj5?=
 =?us-ascii?Q?hc73/6bP4HYSGlnukC8AOcmRl63/Z2wV5hKGHmzNX7ix5opGcLCq13ND8AiB?=
 =?us-ascii?Q?fdYwHIDLk7wvasCx7G7bG72cmk0asQMyLuCmUCMn4+yJhBAfPFHKKmCEdMKS?=
 =?us-ascii?Q?8TvIKHTBY6YNb3WgIcQQ9fEUWGmNxxgytYf35E1BGwMfxuSyYu2CVEJ3VkF5?=
 =?us-ascii?Q?h6sAKB/msYScy8XP+gQhfPq1CWFk+ozWWd/s01GLYeao2VDrMIb+ffduPUY5?=
 =?us-ascii?Q?YrW9bfoRm9LA2OyOPfgjOmi6VRScunaGMzJu1RecumWLUV2EG9CXAoOpN0ue?=
 =?us-ascii?Q?UGfjnWl+0UEfdBMboNinHAXxRCNqewrwGF+kwIE0AQrbYZoOAbvAGzQpCbed?=
 =?us-ascii?Q?Qr2h7ivpWWa5wFF6lV5lkNgc9237ox2xt19stEz+W5JQmxJM0wntPLpTbZ9j?=
 =?us-ascii?Q?cKSE8HU+jlp1cWluQ0M7HoZUPjbKLMHal74i+7LTTdgxkBWP8VJJOeG4YW5J?=
 =?us-ascii?Q?XArfXsIG62TTGrw2pEALloQOfEG1tXuPdCBTuQOuji+jOFPhYe5y/Vx0kOyZ?=
 =?us-ascii?Q?F08gEkAUyyxnshbJ2OVLMWMU6SUyJ53GGa4nOmTPEsJo8LU8BaFbVYbf8DzO?=
 =?us-ascii?Q?h9QFwZhKfc8zJ2wkR/5JLrvYdVdYzkRN0tM9HMi/xdahlxfGDpc/wddoLDyJ?=
 =?us-ascii?Q?wtSiuqYkl5kVUfFKYepk5alBlUOsMrHygiK1ewyTHZkyG+FC6qRI5djQyhjh?=
 =?us-ascii?Q?PQ8/5XDe3/4sUNuAigy7rAuLfEEyrKWzZ2pWpV6JhtMqV18l+4CatSNEgs19?=
 =?us-ascii?Q?RXpvIe1aQl+PC325Ati2nISvvb0f9oL3bLHQO+8FX+aX0+3txU+bmtJ1dl7y?=
 =?us-ascii?Q?mSlMOmjrTx5kfyEsrtXJjFBCuNXOfOE9bEKXBNKUy6mP0skca1Z0OeK/sWJh?=
 =?us-ascii?Q?ZL6jBY96XN7/TXSYcBUGFeZpltSaNh1vY5L9QEvkWlhd3lho8JISGYVbDgHh?=
 =?us-ascii?Q?oFsaulgn/XxqJIgd0Pvk5KsWVHUKuuUCxy+H7E2yJyZNMAirwizRyyonm9b5?=
 =?us-ascii?Q?f7dqBT3Iaew31mY07jXyRfmO6IHPMdLWtS6M30c3Zpl6K9hYp5wH5tdWKxpQ?=
 =?us-ascii?Q?RB/YfRMkl4rpBlAoXIMtvqy2XjqCBkwzEhbOIEmUx8EIs0f2acXdoINS7KPc?=
 =?us-ascii?Q?4OK4TK687LrO8Hq2k89E0wVcWlifC7sDowVtGW2UQizXo5rNj86YIZ0OKhTf?=
 =?us-ascii?Q?umamx0TW4szXxVl0L5QPlpIk/KWomsGjK3IwbrUCIrlVCicJlW6Aew52n33S?=
 =?us-ascii?Q?8hTWe69fdCu76AhsKPcFQVsveEGJ2L/wao4RLRQcIMUPiwd/sPD0fhws9bEv?=
 =?us-ascii?Q?dPiAXOa0m7zmzvKYIJWQ4WKsyxzuUsf3pMwI?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 13:50:59.7484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d37502cc-70fe-40c9-d755-08ddb581a617
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10200

Hi Leo,

[...]
> Leo Yan (10):
>       coresight: tmc: Support atclk
>       coresight: catu: Support atclk
>       coresight: etm4x: Support atclk
>       coresight: Appropriately disable programming clocks
>       coresight: Appropriately disable trace bus clocks
>       coresight: Avoid enable programming clock duplicately
>       coresight: Consolidate clock enabling
>       coresight: Refactor driver data allocation
>       coresight: Make clock sequence consistent
>       coresight: Refactor runtime PM
>

All of your patches look good to me:

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

--
Sincerely,
Yeoreum Yun

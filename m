Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2070.outbound.protection.outlook.com [40.107.103.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5841C3039
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.70
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221447; cv=fail; b=fNdhi6qPGsFfkYr6cAEFl6pFgaYIuVqkC8pCOGg4HYgyYlqpSk3f2Tnw/VE8je3xrOSkK+bgRCQ7s9EXZIsDlbQwHJ79weJzJpBYVjACMbXq1yqwq8QD3c9R6ISn3hPT9bS1e/FPiwpPmLNe3/e3BB1NVWnHn2GiAcBbRWikxXQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221447; c=relaxed/simple;
	bh=ClrxWaOAdMa3TIb2U62qe21ohUXjtAdZ28oo9GBXzy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BUeaBlYwRZDEUNMsT94miAWpwuZedUtCc1girAcj9rh3UI/MzRaZ70VrqoRCySqibpZGxSrmhTtlLMX1QpHCx/kbSbGp7HJ7RrgVc+8Yoo3S/rSGuFKzB83ZhKSRSvUhMx/20m4J8iOhZ5kgUcO1vpSpF7M2O0b3rJDdA0YzJ2g=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Mg5+KU5D; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Mg5+KU5D; arc=fail smtp.client-ip=40.107.103.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Mg5+KU5D";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Mg5+KU5D"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IKOOXhOEjcZKTN7dQRfFqfBpGT8wX0eMiYwKWXF7aPPbl4gVxWerzXpESCLVANdVGSqwCvL9YVeT1bCGX4qRvzBIZF+JR1mH9HkwN+2lIreUJO86em0q45DkGJ+Yd0FJgGOwyUjhZewnORmAGvg18wIxQ3iSqIyskDcmOp/miV4ILSUhVqV7HuN+vaPmED7tAVYITeNA5PK4Asklk2RkLAEj7l4FeC1ozqznXbLn7fUJ2lTwJgF9JoN9VbrA4goXjefHLrFJSIdTSN+ewe/9OSM8TaoPrgHMn5vYSk6zVtFhdFs9+nTv8pEz70sVyRtiDWkxSuZqKeH0BxdddfL1YQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A53SA5CowSaFpLDG0JM+oMIstbVDogjU+2p1fPEDmc=;
 b=CM3jrGoBljiV9MSJVVQ0NKOwu6bSmZEAxQiqOqDHMSsGA9tCKC7NJrBhnWakTooTR4QFc/0I2BZDFvpx30XuYkLZkVG7HXLQ0IKMZEhnBGXXWbLkl3j+HfgQUvZuD/Nk7jB8iof60BqjjG0pyaXk0JeHmfJfsYz+/u9II7C+sGi7MDYZ33V35vfKbgYisx8mV9pi7BHkWXGfXMSL3dQDnH85jGdPHNPpF0KVLKw8hPqkOoffiL1ppavaAb7R3I8Ivr1d1TkNxRV5GpMBRw2kLlioRykeQT2ZURg3YdFQLpB7n5Nhf4mLomg3jngEP/ef4/TZvbyyzfTfeMb5QTQ06w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A53SA5CowSaFpLDG0JM+oMIstbVDogjU+2p1fPEDmc=;
 b=Mg5+KU5DNEcB85h2bfLX7lFOQY249BRUlivVsD9W7V86Dhqo973TgPdYFanNr0OTWnBo92cmtmH2LYIGy9La/q2FQffNqPafiO2TLnpZ6WYDS5Ceet/PmjmNNcad80Rlf8AYUoowdD0U/kKQPMPwxZvWw4QJuE1DqZ1g8rnJw0s=
Received: from DB9PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:1d9::22)
 by AS8PR08MB8994.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 11:17:18 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::57) by DB9PR02CA0017.outlook.office365.com
 (2603:10a6:10:1d9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Wed,
 14 May 2025 11:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 14 May 2025 11:17:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jH6SNg/gHXtFO+A7cM0f5bapR31NVd09PzDGzr2O7uJOlxkCibqbK4gZwe5xi+/Pgxd73nZ3BOzsucWcK0SRVUyYh2bsZchVNMlP0x/REM5FZJ1LPh8H7yQUAtfP3C0CwhJoyWyM1houEpLgpgke1Dp7R/r448ETrHuW5qJAPop8oI4tNGPLvDcaFWKvQPZkvTl+s8d0tO0wYLZyi/XLjCaNzuks0mBdDjoKhyPgAU6pEwjzwgM/MKxEZ5YAowspOt8EYbzdKtpcANEGq3YUoIUIMKkkUF6FH2qh4B+yVHqtVaXh9Qh0+yK7s+L3kUGYdH2X9AWRPnCzF/kmGdvHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A53SA5CowSaFpLDG0JM+oMIstbVDogjU+2p1fPEDmc=;
 b=Ze6wHnANHT0O+ahAFZ6Ngkx7fmWxIqa1swe9fgtZJwHmENu18VDyRrgseuweFwh6PXtpE9l1HHM0eh+bnFyQeP7CIXPVNjwmXX044POiD2edLENVnVghbIK5Tn2H3GrXKBBujw0SQFmduaGsFIDJJ5GvB9YbIJC4fahg4zTIM4mCFaT5iL0Tg6isKZDIYmomyaKmO9yd2dcJHth3yqBTWgW9B8S2HCplg3c2rLqC2nqn856fBxEuRvPL+0wLKQqfxJN4JPqgR4ZePy5/XckItv0n6M/nK8R1HQJKxfNUJE7wC2DfrKbSXDEMxFXso6RDoPEXk8uAUGrVmogkod3BhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A53SA5CowSaFpLDG0JM+oMIstbVDogjU+2p1fPEDmc=;
 b=Mg5+KU5DNEcB85h2bfLX7lFOQY249BRUlivVsD9W7V86Dhqo973TgPdYFanNr0OTWnBo92cmtmH2LYIGy9La/q2FQffNqPafiO2TLnpZ6WYDS5Ceet/PmjmNNcad80Rlf8AYUoowdD0U/kKQPMPwxZvWw4QJuE1DqZ1g8rnJw0s=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB8272.eurprd08.prod.outlook.com
 (2603:10a6:150:b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 11:16:45 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 11:16:45 +0000
Date: Wed, 14 May 2025 12:16:43 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] coresight/etm4: fix missing disable active config
Message-ID: <aCR7mwMEDPFmd8YB@e129823.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
 <20250514090513.GC26114@e132581.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514090513.GC26114@e132581.arm.com>
X-ClientProxiedBy: LO4P123CA0502.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::21) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV2PR08MB8272:EE_|DU2PEPF00028D06:EE_|AS8PR08MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aeed2bd-baf6-4fd1-ad82-08dd92d8e304
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?X1ihBK9b4zR5tIhh3PMifmt4Jocd1PvixqQPs7AwjexWiDzSYiV3WujhXQQz?=
 =?us-ascii?Q?w0GgeBAI0+9Ooq0dKTeR1GTV7q9J64haMEXog0HYfwfj1ugt0bQilh5X3W6Q?=
 =?us-ascii?Q?Q+thQwECGYn0sw5Pqc8CSn/yHAP8CuSV1hMOhF2lhYUHewF/W6UX3vOiXxyZ?=
 =?us-ascii?Q?u6XN5yokxSafAz1vR/8nCP7IwG7gc2xgjo6x26JByfCJSp6ztZ8US8FRhvhn?=
 =?us-ascii?Q?eOrA+9BQanR1zpnInCK+CauyKzj4a1OXkNa4Zl2fqsh9UhuugfwVSR6HoQog?=
 =?us-ascii?Q?/pc9sLDLdT4pRrUWs5i/5u1WvXZK1tMlJmu3eEO1RIZRDHkxZaD3MatDwaNq?=
 =?us-ascii?Q?s3viraJsgaonadKQWyfVUsh/JpK844LZ4CXa6yXpuh0INEzm+zauikbyrEwq?=
 =?us-ascii?Q?skPO3PhO5vMErw9IN67aLGXfb2DTj9DFz9RNN3jLMgeaoXQ34DTB1wQSnZ6b?=
 =?us-ascii?Q?FrEOADc9fG1zvtPTCTS1mM4LBDKbT1P9u1WLaLBM1LVuPfxVEgHq3uUfiZLM?=
 =?us-ascii?Q?JUcxIqj9968vqIYSId3+vqeRElDxAv/1mLgszVgkpzLvK8yLoJqUInby5ZEa?=
 =?us-ascii?Q?t0coJz+JL+Ns1h3jdEYhZ9SHA/dpr9eB5lIozRP1V0tmO+pQ7CA/x/+xesSP?=
 =?us-ascii?Q?fRPOiI4Z8zdDtK3y4tm1Hd2JA8kZcrNcXGQqpmZ9t/WzIcuk8Vh9zkFY9x1w?=
 =?us-ascii?Q?+JW6qmiWfhqkUD6v5zDNs7qUz4NMgh9y8pQux+UB2kDGnnH4cQtHk5/dJX85?=
 =?us-ascii?Q?G5EJ0ILIZvc684RfzporY2y+k0CGQ1ntvB3f4s0qoCjCxKDJvLzrip8o8AFT?=
 =?us-ascii?Q?3U5xJ3zCaMz7hN9aEe+ffJscgawpv1WUJVA7ygzWa5rHEIpuTC6YIL2wJ1nI?=
 =?us-ascii?Q?JE4Oug9d/VC2JwhZ1aNtjcq0Kw5XzJyc4IMaaZCe4JR93u92rKArY6sgcwiz?=
 =?us-ascii?Q?dN447RMAK6T7SYC+3+GAcI6axTu/xfyof/PsrKcbSLVp2BLWwiCxSok+caN0?=
 =?us-ascii?Q?utrZESl5IirkOFJ2PDUw6n8yRy2UEPh261xT2PEhxs7zJtRBmFO+LX5qSsDg?=
 =?us-ascii?Q?T+0RkYYASj8L9+itss53Y+p9P/B4Kk8J9Czt6paYowcs8QAsn5HflurhZ71D?=
 =?us-ascii?Q?Rf4P017qZNo9aTws+NRchp7drzXP3c/tqJ0prlVal7MK46Ci1O4rKiuuFfN0?=
 =?us-ascii?Q?zGiK3V1T2LYlseYEC/YuM3d/avqmP56gZSdoGJWvR77shvc7+nS7i3iff7ZN?=
 =?us-ascii?Q?cGgZGmgHzjeA+Zthn3PYzYHMtxJH+VHzLS7Zrp5HW4jw5W2cWXPpGPsfGEI5?=
 =?us-ascii?Q?aBFj3TmpwyPWu5A4DTwNggpfZz8cS2ECo9WqQ+lDb2IMYZrL3ILmOfJGFil5?=
 =?us-ascii?Q?iXEOpLDV4HptagWYqTcIJtJfsG0vGP4E+yXTPBqGESu5jF8I8m4xeUB3rDZp?=
 =?us-ascii?Q?WZF6Yk6uUr0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8272
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b62f93e-ef31-4469-f804-08dd92d8cfd4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U4ZP3IYi9nXub5RsoA/J7/V2ESEOMbW3XPfmJSCvHijxW1XtBpG4h5zZf2T2?=
 =?us-ascii?Q?7QGqf0z3UItGHmk8rzE430tf5sI+gSABsWCc2erl1ujrSIjc5pEQs9u9s5Vp?=
 =?us-ascii?Q?DskGcIUJxZjKkIYoltrvQqnCrSCAm6hHsBxYdtXa/ulfUrK2RIbyVIU35Sqh?=
 =?us-ascii?Q?4tzzH08bUPP98fi2XjHhIjRGGiQqAn9E9hZyenjT7YpXIdyt+A9VmBKSGZsS?=
 =?us-ascii?Q?XMIM8w2o5XZ91YPHKuSW2LlgAAbtu+ce4nxfrRPWr2R0ZnE8AdEuM/yljodg?=
 =?us-ascii?Q?DaIhthovvltsXYxtgOiqzpQoWYN/F/q4G77+4tYx5Ky5ohuYEQT4ax7JRZPU?=
 =?us-ascii?Q?IWjtCXSrJwqep89/BxuGJfMSun5sY5aMwwHhXOlfGgmZNZ3uZ/jw6lBmAWmF?=
 =?us-ascii?Q?NWhsyfUoWHQu+adG2tnRGI8qSMZuQxjwyFngFvL6wLTZMQySnPsU42sWycVV?=
 =?us-ascii?Q?IQ3yHZjzxKoBn709hbdwbUg01qXtHbqXCQeumuV2JJfp5QBxo+H68dUkdQzV?=
 =?us-ascii?Q?X9ixBxdUbsuVFuJuHNehTc+oAZxT3SRaHMs6gWEuAhQF8bdqjP8tYB5LlgP3?=
 =?us-ascii?Q?1HFpf+EhNctB2k9mXbWSjXRJzLwoM3j1+R14m9zFcefw1WkchgPNkzSSUOsK?=
 =?us-ascii?Q?tCCeadRtjCKeoKbjj5YGj1OughszMrO8Aoa09vhilVrQyb30kGqe6rREuUlO?=
 =?us-ascii?Q?5CHDPzbhr33cFRKW82olwWwaI0CWVc6gzjIDgthnWCUmEDtjGKgXg7JBhs/q?=
 =?us-ascii?Q?U9h/5TkUSy/MirPZ7w7FvIYI7PZ7P+VVHDVn9S84o5M1kRFcz+2ulqxLmwnE?=
 =?us-ascii?Q?6EM26A68aMQUg4EiN9mcXpv/jg4BqmCxbpxwrHtmfb+8WEIuBWyqCBj406Y7?=
 =?us-ascii?Q?WxITRQ6EKLRfsXc+YXbbitYrTCithBADDQLTcW4bcPBTvQpzK7hGRAOZJxvj?=
 =?us-ascii?Q?r+mPxaTSYu8gVTqO35Oyq28PeyhAgaHWzoZE7GmfU6AK1lD3tSzSQVCenQDm?=
 =?us-ascii?Q?4eVHCQSMzvWcBQu5Y9wC0oBC4qTedeRzUWxUsDXzshNl+svteYwBUpAW4X4U?=
 =?us-ascii?Q?4d2QzEjsG0wCrU7PAnLOw+tFB2SQNfSj2a9tXbUCH/y/gvXk+wtkLkgvv5D9?=
 =?us-ascii?Q?OqIMiCoZYQh0NRzopoywk6pX/uBo5qGCwYUHo7OhwZtn1JaXMl9rpMqOAnU6?=
 =?us-ascii?Q?rxFYM2h6BsiPFK0IU0DRRiacg86xREGwZeuyFar16HgpAlcP/EKRxCURdcgT?=
 =?us-ascii?Q?4sssmyQN42xyT1NUGaN8uZWEaNb3ry2J4VUT2G66KJAwg4YcqJK8753+3biA?=
 =?us-ascii?Q?ztmGr1OFOfkCSYnPbpKhY2TQ9reDhEe8iWpKhpwTKJ+er+MMF5oiFPuKXfkk?=
 =?us-ascii?Q?e93ApQOVv4ODeKzrScUW27zWRGYeIzQNeKODr1S88API6dh1H4ScdCX0rSk2?=
 =?us-ascii?Q?qJsm3nD7Ncs4LTGcpDXJYmq2zDj/CSEIdyYwamNIiWYWZQjG5/o/SWKr/6xn?=
 =?us-ascii?Q?cGypCmqFrFqJONHooohnMDSrLGmFCBpWEokh?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(35042699022)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:17:17.4789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aeed2bd-baf6-4fd1-ad82-08dd92d8e304
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8994

> On Tue, May 13, 2025 at 06:06:20PM +0100, Yeoreum Yun wrote:
> > When etm4 device is disabled via sysfs, it should disable its active
> > count.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>
> With adding fix tag:
>
> Fixes: 7ebd0ec6cf94 ("coresight: configfs: Allow configfs to activate configuration")
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Thanks!
>
> > ---
> >  drivers/hwtracing/coresight/coresight-etm4x-core.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 2b8f10463840..f008f87f0801 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> >  	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> >
> >  	raw_spin_unlock(&drvdata->spinlock);
> > +
> > +	cscfg_csdev_disable_active_config(csdev);
> > +
> >  	cpus_read_unlock();
> >
> >  	/*
> > --
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> >

--
Sincerely,
Yeoreum Yun

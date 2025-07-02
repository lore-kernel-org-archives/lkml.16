Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010055.outbound.protection.outlook.com [52.101.84.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2FD78F5D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.55
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451548; cv=fail; b=pzXYSA3zaTrE2oshQKIeRnlgvCZ6vXF5ZM2QKPr7orpwUCeYPL/Gq27yXKgKjWJfwB/N+eZumUTHybT7oXUquW1EcBU8qHTLSvZBfBtAH2l616PBPjeTmRg+KBN8BayNWISdnjbHkFxFmR9uk1FZZq3O+f8wMLTwzTbUFjN2Xuw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451548; c=relaxed/simple;
	bh=zR+t+F1QB6KrfuSiacrWLs15Mx5a5XkW6K/yJwv+jTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yzf5mLToaD18JnexGwad4iQaL3Ide6aVKSzAZ7uWYOQGmtsXpmTnG1IlBnqsXOmFzV6Wfp3v+NSw6onS09TUsm+s6cBcAd0nWmd2LoJ+uTpndLP3Fhxs4k0CPrhNptqJey0ojDzoZczb1PStUj881jbs5b6HZ/SlTDQ+HU7UjhE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c/qiparh; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c/qiparh; arc=fail smtp.client-ip=52.101.84.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c/qiparh";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c/qiparh"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hz9fRoR8IPwTwYoFrTh3xd00wZzsvD26s76OSoiYPBNtgiLuowl9PuTZgbu+oHGM11PKoBbtS3drCL/sNZTT0Ug7NGZYpiIFNCihTSKcR6SmARXf55ZWZv1Mzs0AxzFA37x7Mg6cH4dwEP1hNu8iKWFJsrz/H1o0wzv961Q6oxWsXvkdeitUrOP+Ge345pTkrE6pdRctBKbSDA6h/6PbLJ7f0ODdSoKlqJX0xJUOgIci5VG+MoVViWmTHUqIkfAgmmvaoDeMylc0FN2rTWF6PHoej/Di9NqCqgyXcTHdJH6ZkHodI/fUNBHBzVWLJqv5HyCjYIwdc2sr1jsZRZgaNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByfOH930EQPGw7MHLyJjpng6KMKMd0BrOKaTKe3cP3o=;
 b=YAXJi34VZiE2speErKOC5vpw6jZl91w+g/XxfevbiMQOMAI+i9ubo/va33l8NiLSl1yHp+fe/ck313INcFP8FTQXpXe5d5MZqZZfmDBm/zcguZ0o0uvtfiU8FQi7eCy/vjYI+eSsxjnOdbnfGJbsECguqIBqRX8k9MRz5Lu6RAJ//ZSXQE7nARyO4qag+3BpKREa+JJiEpEeHqlaubUpHyOLTff5UafNdSNrCJf/vtJ/1mRKjjz11qzThs+WnimXuq6m5/PfJ8vhM0qJdPEUciIy7J3fo5FIOoL88hC4SlFAQWugoEeP/fP6A2ZvIoQiIHFAA3DHlJatWSIwB42nzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByfOH930EQPGw7MHLyJjpng6KMKMd0BrOKaTKe3cP3o=;
 b=c/qiparh7LgHMrs90Fwo+t7VsX4ns6IbJ3BOux1FYscux+iVsdABxqS+aCt41IehM+fn6IYg0uA8cws0Sok3gdlBNkJWr5SkZUv6rg/RV2azzFVxeOWhcqHCZUZxMd7/I8GbROkAjvepqwieMd5U86DHFUKPgjeWPUZeYcreko0=
Received: from DUZPR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::19) by DBAPR08MB5752.eurprd08.prod.outlook.com
 (2603:10a6:10:1ac::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 10:19:00 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::d8) by DUZPR01CA0030.outlook.office365.com
 (2603:10a6:10:46b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 10:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 10:19:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfsbpg1PgOhOiMPSnz+7cDmsJTtVXdJ0aL+FOrn9zqUS9ml0dn6LM9/96GughcOVqJNODg5rJ0MGPAKNT8nq3I8rPVtgPkPbZD0sVvn/hWAiRNqpuzEvsRcc5Kp6gl2TSd6NgTvMwxcGiL9YlPOzcqAhJNJr2XhsWjonjDKsfb5spUraKIuUq3OWqGOz2ycxjl9kKe8d5gXDaN1UcvOMkI+9qPC8efMqVPdqOIDVyl+TEx8A/Zaccd1eQTIcHHpvgz4pBpIZqhUpfoVZxvkRIW4/RcrpEF3JdX5gmSfzerMRgtqPhmdWNmdiaYfHWGuRXFZU8ESy7nTZF7qOxXqf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByfOH930EQPGw7MHLyJjpng6KMKMd0BrOKaTKe3cP3o=;
 b=WC8ekEraQNhz9IEsg36qhZXy9t1+vcwTnY9bqtwY3B3nBszczmSRyooTzCeLGKxQrWcRnPCRhmCFAkYBEoXUqjwahZWWnb2n3wbLz/qLHAkui4Om/A/sJfeEhKxLuDAE3P3v/8WNc+r+e6uieYYg97NjAsGqlEFTasRnfRU2rFGlc7xHrggZeFjLsmhmCSRNdyOJxTWH6FhKmRc8bfuobp/38JBQ8I5wBNUec8MsOTPSzFrLm8Zb85Gpctr0ZfXC/7rqv1yXYVgPQLekUSH25heO3PsCN0V6C8TBdK9gvudSmPhc4vB9d6QqmZEc+h057PmNtZSHKqz4n6h2yy22gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByfOH930EQPGw7MHLyJjpng6KMKMd0BrOKaTKe3cP3o=;
 b=c/qiparh7LgHMrs90Fwo+t7VsX4ns6IbJ3BOux1FYscux+iVsdABxqS+aCt41IehM+fn6IYg0uA8cws0Sok3gdlBNkJWr5SkZUv6rg/RV2azzFVxeOWhcqHCZUZxMd7/I8GbROkAjvepqwieMd5U86DHFUKPgjeWPUZeYcreko0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB8704.eurprd08.prod.outlook.com
 (2603:10a6:150:b9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Wed, 2 Jul
 2025 10:18:24 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 10:18:23 +0000
Date: Wed, 2 Jul 2025 11:18:21 +0100
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
Subject: Re: [PATCH v2 03/28] coresight: etm3x: Always set tracer's device
 mode on target CPU
Message-ID: <aGUHbWR0vreo29kl@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-3-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-3-23ebb864fcc1@arm.com>
X-ClientProxiedBy: LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::12) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV2PR08MB8704:EE_|DB1PEPF000509EC:EE_|DBAPR08MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 55bbe065-a464-4e80-b91d-08ddb951dcba
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Y6QGQtYvWLB41d0vfe7C9JKaj+68xCCl46HqVcpWrYcBMBBDofNh9LFQCtaq?=
 =?us-ascii?Q?P6rHJpWjzSF5CumcA1ROqtirybfiu5eeTUh6ytrR0GkxnUufrNEbO4xMEsho?=
 =?us-ascii?Q?OkCRihVhhxTeHEkfXw5SQ5u828LPj0q7YlRm5mJnLplAEQuIndtkFQ/wApq4?=
 =?us-ascii?Q?Oz0BGVQPqpgf/DBlxcw3od0TfwhkRF6EMMgwLuAnh7lOl79dpKp/LLWSZQ5S?=
 =?us-ascii?Q?rp9ZDL/yoBMvuKmuhMNEvDRAUIXZ5cEXtIwXIBnu2pwkJGQtMBirErhsVA8C?=
 =?us-ascii?Q?uPMmrnZwT04HlN/5lG8NYSMCcRrVXLvzHanqGc7lkVmWUn/N/8CZibPZxP9T?=
 =?us-ascii?Q?e13z5kDqE3ZbrmjS/3IPjSoVVKN1AliIf7u+OakIY++Cw9Y4Vv3G5+s4wEWV?=
 =?us-ascii?Q?BRUgBuJX63SA0wEYfxQj5LoPDEM5LQgECWdRRJOGzp+BjYEQaKUbuEDj/Bx+?=
 =?us-ascii?Q?/VSfIgHFPmHN0HBJhPgBTjwASshvvkdveBxQLpdd9/hy25HsIKxV+v5HBKZu?=
 =?us-ascii?Q?GdpfNVsQYmHrpmlJ9YiwHN0NVaWXSkOXZGQw5wXju0n+GksNxseMMjZEAuvX?=
 =?us-ascii?Q?31EZ6XkbNeD3BIyBX3sxFj8JERZvL/e33uPtoi2K+Oj20W2vaqLi+GIJrdHr?=
 =?us-ascii?Q?Nuy+tont0n5rQh6QRgPoIY+FmLex98iu0QnA0i1cX3/LGdDHaKGPtvW9Xalt?=
 =?us-ascii?Q?/4Zsh8UBcdWHnof2Hutpdz05ZbX9YSphVMRNNt1xbS6difLwyWLZgcOwaBDd?=
 =?us-ascii?Q?1tSgFWf6UDsgYgKetjgFmJtVuIdP4OVHpVyKtb23U6sNKyVa7COsT6K4AU8e?=
 =?us-ascii?Q?Y8pxUURYS13jeddwr2cyJCAcWYAKAksxIitMTVXMVD2j8izgLkoXPiJ5wxle?=
 =?us-ascii?Q?TjqA6PXRydmIsU3yotKVWnCef8REECrsljFDOUE9q85Lbhf1l/z7ra+FIMEQ?=
 =?us-ascii?Q?LuJTCLR03EMJcGgauibDed4WegFdbstfbsFug1HaENDztQp9NLQzQFNQ7ZGd?=
 =?us-ascii?Q?5kRFTD5d0rp0OIwL+IXCDt/G9JLNp7eh2q8b8+xoL+xKW4qdBQ/D3R6mxErE?=
 =?us-ascii?Q?HxeXs/ALO51ZhChodN+C1qibmQzoQqGmjSPkaMR3eDSWjGrEwEhZ9TebLnub?=
 =?us-ascii?Q?fQOPuzRy5Tpn3EVVN4swfRNRVxrr2m9Jihe7FWR+xqZpJjHM4e3/s2Xg7xEo?=
 =?us-ascii?Q?k+iPBIaOSB3AxJP+DWDDmwNAhiK+uDOZq+6/ivWRtiK/9nsy8EEm94Ryx4Dw?=
 =?us-ascii?Q?kci2q2o2+htljvBCVtW8YHnOd4srsiJhhjNMrA0Zdq+gMnBTWWrtHwnrp8Xh?=
 =?us-ascii?Q?7zPhTZNYG0bV47mbx+4tlqcXVOXmGrROU5/xA+OWF8BS+UzOFM0hVbXknAE3?=
 =?us-ascii?Q?6W32e7rsbLpgrP/FppKCO7LugLOUU3axZucsRg/Gk7PfezI7Xxdvznkd6Xz8?=
 =?us-ascii?Q?U1mq//wqfRI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8704
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7f724d0-8209-4c75-a20c-08ddb951c6e4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|14060799003|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xvmRNJOlbgwQVZWzUZ4G4lgxsl/2ZJZ8RAB2RWoab5NLarPWZDlv09ob6jX3?=
 =?us-ascii?Q?C73Pej1IdGYOGKqR0DyH16J1+JDn5qSbiRijJ/WpKGFdSHqYhfcg5ZIryuzL?=
 =?us-ascii?Q?xpDYe2rogvy30eOYcqL8KBRfhvb/epaC5IbxFo/Wps+UZBNWWypUjPAcFYpg?=
 =?us-ascii?Q?FNbAS4TCkOj/17O4i1OLDW/z//ZqYvRx+8tTqmYf2hwU+isqH57bZzks9VIk?=
 =?us-ascii?Q?AVw3vDLKBlXxIPe+rzwvsaqWkIRwIumXaKYiEpzvbaCYWm4uOHqSOXSUXzw4?=
 =?us-ascii?Q?5XT6FJf9Pu9ETkPCZKjgW1XBsH7I5j1gl1Sh1u+hBU1pjEXPOk+fOnwesE5Y?=
 =?us-ascii?Q?TSrvMUFR38QjG9MYMZmPRGUMTA1a3FYSe+2oxYPQcAi02F1TtgvwUTwdXYT8?=
 =?us-ascii?Q?ftdWATtTW5iCxr/XRkNJU/F9a+Ir/59jZXFxbwhL4xm0TTm9hP2b/X7FVGcn?=
 =?us-ascii?Q?thoetF/daM2TqkpCE+c7BeJMwmzqsB4pK2+S8mzBMvClSeaDnncqo7C9f8Th?=
 =?us-ascii?Q?MAUxeInF20KVXUyh6Mp4neEnLW8jUNJvrynT5/H4YXo5cggc01R3hwgHli26?=
 =?us-ascii?Q?+CqQD1kSe9IgNxZJ7sW2L0Um2+hoy2ufRq1ZJCf1T356z5Ut7VOqXrLBXucA?=
 =?us-ascii?Q?uq/rV437pbkEhByPQvQGxph77NHqr9jhbnpe8SOcidua4sWNaMIA7MHpluIc?=
 =?us-ascii?Q?QuWQ/9EtEyOUzmkEwdhrJU4asKsJu8dxI5n4pAp5urXJZGJ9Qz6dsp0J5yl5?=
 =?us-ascii?Q?URQDUqI1h0fA/ddD3JEF9fV+LDKldypeevn4ZjUJMCxPm8Vp8F7nLZVge4IF?=
 =?us-ascii?Q?7NJeppvvtZv1qKU4DpUvqViTG/rK0quyxOXnNYLYRVMtQKhZhipS6OOQOkni?=
 =?us-ascii?Q?luCq4gxELkN/KYDzgpUMFZKNbDMtbAqrEE8GbwXv+Ct7ccKz4fShR6DrZHAR?=
 =?us-ascii?Q?X7KS40JtOKXDxUgUwbjMpMYxCQaP+qpaOmqcR1GG3JZpTZDs7D5O7DsUMj5q?=
 =?us-ascii?Q?mLm2o6weOup35K82nUWNPCXdHFkXxXUd6ECL2JK+lRmhn80lt35fQdWI8mtE?=
 =?us-ascii?Q?AN7AjYoWPTRKuudBoN2d3iUu5K83d4EZjj9QwKUj/Y8lcc7M1F00kyG5Co7g?=
 =?us-ascii?Q?3k2xnWODImzRyVLmmyTlWBmHe4cJMSjZMUQVwRJogYDbWKwJGpZZ9oKU/gXA?=
 =?us-ascii?Q?VK3IUt/scq+4i4PXFES6XhCYB9zpyE8I6W+XXVBHSFrSd39PcP697oZITU3g?=
 =?us-ascii?Q?5TkYosCCu69jHWqFvcbFPCA1qSvAXeZN+8WQXH0RQ8yHTkVEVN8AauQsu+YH?=
 =?us-ascii?Q?W2t77A/1Wdx399Tnu9i+MWMTJ8YjkvY6akeby9mNAbDRMcNeOinnjlCfuWL9?=
 =?us-ascii?Q?OBAvHf88vB2FwMtRZTibIByi8o/bpLto/qdTBunR4yzmUM8G9B+DJZgPiuRk?=
 =?us-ascii?Q?U09mZZVNMe962JAUsShoKXQmaQ1nOGETvy9AEzFlvJSLD037jcdFJOIjAQB7?=
 =?us-ascii?Q?FxSFN9R7BnFMAWdfobgJ+JfpcO8om6io9T5s?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(14060799003)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:19:00.2187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bbe065-a464-4e80-b91d-08ddb951dcba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5752

Hi Leo,

[...]
> @@ -464,17 +477,29 @@ static int etm_enable_perf(struct coresight_device *csdev,
>  			   struct perf_event *event,
>  			   struct coresight_path *path)
>  {
> +	int ret = 0;
>  	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>
> -	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
> -		return -EINVAL;
> +	if (!coresight_take_mode(csdev, CS_MODE_PERF))
> +		return -EBUSY;
> +
> +	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
> +		ret = -EINVAL;
> +		goto out;
> +	}

Small question: why drvdata->cpu != smp_processor_id() check after
changing mode? Would it better to check before change of it?

>
>  	/* Configure the tracer based on the session's specifics */
>  	etm_parse_event_config(drvdata, event);
>  	drvdata->traceid = path->trace_id;
>
>  	/* And enable it */
> -	return etm_enable_hw(drvdata);
> +	ret = etm_enable_hw(drvdata);
> +
> +out:
> +	/* The tracer didn't start */
> +	if (ret)
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
> +	return ret;
>  }
>
>  static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
> @@ -519,11 +544,6 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
>  	int ret;
>  	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>
> -	if (!coresight_take_mode(csdev, mode)) {
> -		/* Someone is already using the tracer */
> -		return -EBUSY;
> -	}
> -
>  	switch (mode) {
>  	case CS_MODE_SYSFS:
>  		ret = etm_enable_sysfs(csdev, path);
> @@ -535,17 +555,12 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
>  		ret = -EINVAL;
>  	}
>
> -	/* The tracer didn't start */
> -	if (ret)
> -		coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> -
>  	return ret;
>  }
>
> -static void etm_disable_hw(void *info)
> +static void etm_disable_hw(struct etmv4_drvdata *drvdata)
>  {
>  	int i;
> -	struct etm_drvdata *drvdata = info;
>  	struct etm_config *config = &drvdata->config;
>  	struct coresight_device *csdev = drvdata->csdev;
>
> @@ -567,6 +582,15 @@ static void etm_disable_hw(void *info)
>  		"cpu: %d disable smp call done\n", drvdata->cpu);
>  }
>
> +static void etm_disable_hw_smp_call(void *info)
> +{
> +	struct etmv_drvdata *drvdata = info;
> +
> +	etm_disable_hw(drvdata);
> +
> +	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +}
> +
>  static void etm_disable_perf(struct coresight_device *csdev)
>  {
>  	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> @@ -588,6 +612,8 @@ static void etm_disable_perf(struct coresight_device *csdev)
>
>  	CS_LOCK(drvdata->csa.base);
>
> +	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +
>  	/*
>  	 * perf will release trace ids when _free_aux()
>  	 * is called at the end of the session
> @@ -612,7 +638,8 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
>  	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
>  	 * ensures that register writes occur when cpu is powered.
>  	 */
> -	smp_call_function_single(drvdata->cpu, etm_disable_hw, drvdata, 1);
> +	smp_call_function_single(drvdata->cpu, etm_disable_hw_smp_call,
> +				 drvdata, 1);
>
>  	spin_unlock(&drvdata->spinlock);
>  	cpus_read_unlock();
> @@ -652,9 +679,6 @@ static void etm_disable(struct coresight_device *csdev,
>  		WARN_ON_ONCE(mode);
>  		return;
>  	}
> -
> -	if (mode)
> -		coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
>  static const struct coresight_ops_source etm_source_ops = {
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun

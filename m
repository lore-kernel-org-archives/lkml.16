Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2067.outbound.protection.outlook.com [40.107.103.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E3421D5A7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.67
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390142; cv=fail; b=USzmLhsKRnd40Xz27PjkASzJSsCOiEVBJUVFk/tmT1YJlToYH2wRbmRdZnen5FEAFqDUDVAjVexeNc7pV44V8RvkwhZLxYUy9qpBbN47mjNyiDFakraRZ8g71FNbvULo1F95QrauV2dG6eRycOiUj+yX7+sh2MAzCSr/azkrW5s=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390142; c=relaxed/simple;
	bh=lahUPth5XFvat9HkYbNmJSl3vWPL9kNNtW/UylfN2cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KGaktV05/+NYyXSx6fMXk2ARpjR8RzJHSU3ZeqWmiUFE/CSl5wTbkvZzNtL+56F2tWsZYatv+0DJuhV6Nj68l6ifUQ5YrH6eZrqIEY/9uKcZftezd5zWQhmLwFZrtOKRqGm9NOUY0QkD6zT/qoLpJX+eOPnLGm4uoFkGJw6olw8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mZB6JoKh; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mZB6JoKh; arc=fail smtp.client-ip=40.107.103.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mZB6JoKh";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mZB6JoKh"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eKmRpykjGClDvoFJ9TBdZngVq0QFg7sKUqqyZs3RcRNsu1CPIsDGGuYDm+ErKRAP4wuQjfTc9p9ogMyGoaKZan1s/ak8mZLyBX6ippWzUtYl/p2Pldc7Gbx1XLl47KDJm1OBUljTnHStA6FFnyagnPFQ18DVMADLtOSCjC7v4FurWUXYME6xf0wx9PipDCfhd/QZnKLsJ6Spo85ZCfDD7YuPG8xidLb3fPsn6Br9uO4vc1d4ETnQgbV+DOmNFvwNjRiRDrW64qsGqqvpTD22Ji7tfFlhGmCLRZ9r7NEtvX2SBsNCjW5BKY3Avi5CGrdh2iDXwViuwy/rSWNDDCQdgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FboywRVJf37U1g0R8v8ectIigzdgspQTjMXCO+3kR2g=;
 b=neLyXrouwO1b/IIYDYD2vNaJviMxfbfROsgY7GR5CP/i7PKadkU+Q1ObVcfQdKiV+rnYj+kmwF3wSSbhxAZiCLk+Oox4b/LAgHDfMLYCzty8TUQHA2rN1SvSXG+2stF93w28zvEjJ8rN0QvadUKvhr5QdDRHvUyNkqZWsyCGyfaVp4VTsVZesqnBD1vr+qODQJf8pcZjx21kGBJrLtmSkoLb3yDTJz8iL5UqNCiuDIdpuN0uvx5MfRSPUhrsh7Pqldt5irARdYgBmcMFW04DH4TqJOFPIsSJQDvA161R6C4uyUljc05U8JaOWMCW3+29c1aWWpecX2VTPsau9FnaRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FboywRVJf37U1g0R8v8ectIigzdgspQTjMXCO+3kR2g=;
 b=mZB6JoKhGW1L+hIJqR4WK2CnBStqJ8QHkQ3moxZj6eFtnyJCjZelQtfFsPEuFCeuP1VFZN7UsjHX+Xt5Aip1XZIHyLNJdGgi2Pp0OgELcUyJXdYlXUegGnNvlCPDdDgKuNXx27v9q2YgOK9pvpZuGBxniop80K70+N2agu45h/4=
Received: from PA7P264CA0369.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::8)
 by AS8PR08MB6007.eurprd08.prod.outlook.com (2603:10a6:20b:29e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 16:48:52 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:102:37c:cafe::15) by PA7P264CA0369.outlook.office365.com
 (2603:10a6:102:37c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 16:48:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 11 Apr 2025 16:48:50 +0000
Received: ("Tessian outbound 14ceab290806:v605"); Fri, 11 Apr 2025 16:48:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3364811acce12a4
X-TessianGatewayMetadata: QWWP0ZlWiWGUnxCcsSmxFiZAotjg1hmvR5k1S9EJLjj9VbVReWoQumDYL2SSU/LVnZPAoE8U0SNYR41Iw/3vGALW0QyGCNtmfIxturMqYc56bwJmmF+z+485/hQyFYUYfFMfhf/gyK5KO0NQ0Uohy/AU31KZZ0oMclYK5pQllws=
X-CR-MTA-TID: 64aa7808
Received: from L2c728b089e97.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3ED1861E-C2D5-41C3-A0F0-EAB1B618EA4D.1;
	Fri, 11 Apr 2025 16:48:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2c728b089e97.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 11 Apr 2025 16:48:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Een4zu+xghcMj6g0cZWIk+ArtGAHtYbCQUchKIP6GFYCA19+OzsMOe72gS1eo4149E3o7fW11jkpEAHDxYhD/k8nOL8Bjvg4HbYyoe9xX3du11qCB4Y8RH5l+fF1a83+LlHBHtZwKbg2CowWhn8raLtDN9udsTCtrDfdRL21dQwrsSK5q9QVWcbxAWvUBOeO6XGAvKrpjzDz71/K3Z0SptGLHva/1eI8Nz6FCuWO3QFX+DiQR3HmGtg4lgF/l1vkStog9Tw7Gl7IDQLLDgsdUYzbtBY7zAhY+1O2Ob6MeklELayZAgWNMvuRmvNvJTt9TY9+y5fZ1987M7R9k2yw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FboywRVJf37U1g0R8v8ectIigzdgspQTjMXCO+3kR2g=;
 b=gAhZVYfwaDDiYsFIHwzzMiBDU53Z3wE8HN+rZhsWXeeMYgwYy71xdEmkBs1+tudaiZOu/PRGAKjuFXl3Tk6HBj0icZOHgQvLbLQSURbhAxPRRT5zBVzftL9YyJHCv09H+BtXqEFi7vcYxrac4pXGhbFowVOI+6MBNGd90DAhyC18xe3lb/mbavv52rgrunL97STMlVNBalQpg2cG6ik5g6RAbLgs0lejfrLyYayOFnpuojXAWEtPnnaWOCP4swS9fJ8F5KvpcakOBFj+giUtgnHxVsMOATweMUb3eW9LjpZmGUpVw8MRnuATGQ/CUYu7xkgu9kUf5rdLSN7xFss+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FboywRVJf37U1g0R8v8ectIigzdgspQTjMXCO+3kR2g=;
 b=mZB6JoKhGW1L+hIJqR4WK2CnBStqJ8QHkQ3moxZj6eFtnyJCjZelQtfFsPEuFCeuP1VFZN7UsjHX+Xt5Aip1XZIHyLNJdGgi2Pp0OgELcUyJXdYlXUegGnNvlCPDdDgKuNXx27v9q2YgOK9pvpZuGBxniop80K70+N2agu45h/4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB7605.eurprd08.prod.outlook.com
 (2603:10a6:10:308::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 16:48:41 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 16:48:41 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/panthor: Add 64-bit and poll register accessors
Date: Fri, 11 Apr 2025 17:48:04 +0100
Message-ID: <20250411164805.2015088-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250411164805.2015088-1-karunika.choo@arm.com>
References: <20250411164805.2015088-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::26) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11200:EE_|DB9PR08MB7605:EE_|AM2PEPF0001C712:EE_|AS8PR08MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f8dadd-1e96-4668-18ae-08dd7918bc93
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?/mtGqYLL9p5z4tONgcAsfIw3ToMYe1qBMRMVDv7TXgYIqfMLsPStlE2wUxYJ?=
 =?us-ascii?Q?s8XiZxGYsLD4vQpmnbMFggLJbF58piM3EENdBBi8khnNTI0SYLWJWGHE1/pA?=
 =?us-ascii?Q?QSC1zlf+gihImuFqSqTb5JpEWSnaarvR+u7+I5F1CEhVF3t6jle66FPXXmlm?=
 =?us-ascii?Q?t2KmC+ydYZ2z9gaQ46liGxmvU+YKVEffoQu9QRsPPfKvxtKKc29VLiPHCYT4?=
 =?us-ascii?Q?VrHoOxV1WNQY5DgiPty4C7Ov9qQbGrFN/DwBxRygXJpTphwuv+ApLOOg8rcu?=
 =?us-ascii?Q?NWuwYHHjUWpFrDNud9Ws4xjsx4TMLnLFmw93pwwX9XJutxOXeJktrzjIrlkD?=
 =?us-ascii?Q?gK2wlqOVNv17wgvrRXbL8RwlgdUvw7SbMuzrTBV/nj/CVZI57AmcNLF3B46z?=
 =?us-ascii?Q?OyhTJwwvtnY1+MzcVBsiKkTDcx+yQWewgUu6k2JkkhTPwLMqwtbRs0djVW/s?=
 =?us-ascii?Q?EH7YZgEQvq1iCLpbkW1uKve9iR2zpn5BFINHgVXr6r5zhHwbKxIV33iEhqPR?=
 =?us-ascii?Q?6xLR6dZOle8cxr9Ma2iceAzJ7bvYzgIIfamnG/G8EEF4sbJsysS6F7dB3GP/?=
 =?us-ascii?Q?5wT2e8XX7bCUynRxvArqnZWdxUyTaBAOd6Mx9FDfYejo00m2jxFHJn5mzqlS?=
 =?us-ascii?Q?P/S5UitYOAJnBz3FjzLtyeueME0G7lva/7B9RMw0Zb7Pc/4JqKV9s6utBcg3?=
 =?us-ascii?Q?Ib0nt6Vpl6xCZWxP6RhxFNLce2GSquNqdK3wwYlbWCNjX43+/83h7sk1jqal?=
 =?us-ascii?Q?/ZOzKp2wh7H2kcXOA+loXWPj+BatZsv30tmgof+roBoJhaGs3RnLKM4qn6Nx?=
 =?us-ascii?Q?qddAr7yqsLeKXrmH9g3o67QBI2T5SI2enUJIX46jY6EXBMCfpmDQqhUlGnqr?=
 =?us-ascii?Q?+OS1eVea6M/jrYbSx8xuFmN1tBRDD8olfK64lR+bE1bUIYsC4ZRdCPPsJwI6?=
 =?us-ascii?Q?gTenP6xqKCCjsCIGx4Fzk91a2WjJ4+bp2JDIgcI3j4AYz9FqaTzExWkTaxnH?=
 =?us-ascii?Q?Qtfjii2ShY4yvr7tEINtZsLQDMuCABwcrPgQDOifbm29vg6rYB1/fyoT+erP?=
 =?us-ascii?Q?L8Ti1scIJNr8TOAR5y3PqgCAJCrHieA1JlspQTR2vNQNeP7g6OhMTS78uEeO?=
 =?us-ascii?Q?QfW1tWpT7ZbaDOckLXnQo3wFS4fZjlKcuKdozKHveF3HiUB7whdP6hcKz+H+?=
 =?us-ascii?Q?KIvJPzkgMAPWJPPcX1eYfvwjBV0uLvWnp5/sWOJGHsdHOrp4Km6NZ5bnrg/l?=
 =?us-ascii?Q?e31Pnod4fty5C1HWPsJphIcFRQ/kFu7PqielS3ayPLtG3V4F9XpPKVEitOLk?=
 =?us-ascii?Q?LFkO2d57bOUXVdbC9wPUZlVgXMZ3zloSfCkW0Dgzh8Afsw5E6vlGGYNRHxNU?=
 =?us-ascii?Q?pCKww+S0Ii4UPtBPKODgpU5akouVm8nDq5FMlxCgmzv1GLZoPWKA9VuxrJWy?=
 =?us-ascii?Q?HwHLZ+M9lH8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7605
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:257::18];domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d2184f4f-e90f-4bdc-a0e1-08dd7918b6ae
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wXPJ1UxWuJP4Y2P+1S7zm2ntlpQPx64FKflZeD7Kmnm1heDMlr2T0pEhHQg3?=
 =?us-ascii?Q?N0ltY9ckptGFTJJgqtj/GSWeWe0qkT+tCzyayT6u3REHaL5rHZKICf8Mcjtp?=
 =?us-ascii?Q?WCW1HK1WuTbOjiFI9FOpgYPL+JEwpaUMabozS9Hz2q1Ux3xvgckoVdhWamTF?=
 =?us-ascii?Q?rUBg5hioGWUWpnxPkTYaIo9ZOK4rGTorMquKz+L/xTSekeGI6T3IhYk5CykY?=
 =?us-ascii?Q?NMIvy1WnKQVX38ahqutAWH5+g79acQzhyz3WUjdVT9FfgDEYnlAecv5DaEzj?=
 =?us-ascii?Q?ewwo1XrR0P2X+XrMuWAXh7lfr6xcaGxq/FSX+qj6ild5vjQTdcGs1WyzcFgE?=
 =?us-ascii?Q?cBC92/MPWsARZBdt9xIckmzO44mB6P7tqVTfjv52lP2vHWyaDKbZhfiPXaMT?=
 =?us-ascii?Q?zU7y3/90HAn/dVPZhIze7Vn8JtufsMq9pPO+KI4ZQy9Ii9MOhbugNYxBxMLG?=
 =?us-ascii?Q?apXQ7+ptrl8Lf/IdduiNXBfVOaH2ITN6AWNpuDOzo4FgY9eArTkaEVC1AOMQ?=
 =?us-ascii?Q?B50J4ngIKtLlSsEauLEULOrPCZTE9F3d4yJlTbisgVKGNNo5hYmQ/9vqBegC?=
 =?us-ascii?Q?BJ2QXRWCYcwZK47bihzORuC89VhRQh7Eu0h6wBdstuK9IpauCyEvb39jy0lj?=
 =?us-ascii?Q?XVqBe+FuNP2xQXe0NkqYQ3ng+2+G2vgPCJpyNRdbQqtucbaos9cHOEJ55bZz?=
 =?us-ascii?Q?YscFHpSw6H9/VW+7eDm0oNuFUdctu2Iw85uofXH70vcBgGxSUtl9Fjfioiqj?=
 =?us-ascii?Q?PAdTQVja63nQTuycOGj2Vqh56mO/t3VJU71WzptlbVlxpy4mWdgxXmu8UvoG?=
 =?us-ascii?Q?/h+b3W1Zw7VyOUiy0eUEsOeuB1goZ1kLQCZhObuhLZvXDU89pCkrtOiitsz1?=
 =?us-ascii?Q?n2RciGEBUfMW3xcYUiFiQ+XQHuuMKk45C6V5x0WSP3xb79nD9nzcFoq/rBQL?=
 =?us-ascii?Q?MpZqyd6YMuievEgViFsj/GKbR9WHMEhcScfIG3jq0KBdtCk7dmnZs6gLBlOP?=
 =?us-ascii?Q?pdbLS1hENazAgvC1lnBMHoZo/R2guP0w5HJ/axrvjN+4O3v54fCr30lVwcJ2?=
 =?us-ascii?Q?0DmcTu8pYeYMil9Vux8LnRQEKgX3LbZGeoKgKd0V5VlXAODccFopmrZRwPx0?=
 =?us-ascii?Q?Egvs00AZBY0fCZ7nPpQO839UZ95ENn93YbQBGHL8lVmA7fxBe1sLCp0jF2JY?=
 =?us-ascii?Q?RXau1/S45967Z8VsdYb9sRq81bWABAJFb3FJEGPMfVCNP/IE9i1mhHWJHDMI?=
 =?us-ascii?Q?aGvTwc59Yj3aofJ7xnubm7l4wsAofEGvUlVR4Jk/MdaViM1MXId4mFfC+qqw?=
 =?us-ascii?Q?FhSmfcx0TckLGAmoPiyfrhwpWZARk190tQ3JFdrQE01FqYzWYmNDQMT2UrZW?=
 =?us-ascii?Q?qNkriGtVuuiSzDJOPy+fg2gldqIthwlUb/TQ6t0h21YfJOCuX2hsAgkYQO9P?=
 =?us-ascii?Q?nB2lQL5HtaFqb3S+U+KXdrpNB6jm4XevQ1n209SW4XWJDa+VuxJEfby72I6N?=
 =?us-ascii?Q?1SR78jQP8oZ+AdwNG52eFZV4mJ0HLBbw9bMa?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 16:48:50.5786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f8dadd-1e96-4668-18ae-08dd7918bc93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6007

This patch adds 64-bit register accessors to simplify register access in
Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.

This patch also updates Panthor to use the new 64-bit accessors and poll
functions.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 142 ++++++-----------------
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++----
 drivers/gpu/drm/panthor/panthor_regs.h   |   6 -
 5 files changed, 124 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..40b935fcc1f4 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -428,4 +428,75 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 
 extern struct workqueue_struct *panthor_cleanup_wq;
 
+static inline void gpu_write(struct panthor_device *ptdev, u32 reg, u32 data)
+{
+	writel(data, ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read(struct panthor_device *ptdev, u32 reg)
+{
+	return readl(ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return readl_relaxed(ptdev->iomem + reg);
+}
+
+static inline void gpu_write64(struct panthor_device *ptdev, u32 reg, u64 data)
+{
+	gpu_write(ptdev, reg, lower_32_bits(data));
+	gpu_write(ptdev, reg + 4, upper_32_bits(data));
+}
+
+static inline u64 gpu_read64(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read(ptdev, reg) | ((u64)gpu_read(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read_relaxed(ptdev, reg) |
+		((u64)gpu_read_relaxed(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_counter(struct panthor_device *ptdev, u32 reg)
+{
+	u32 lo, hi1, hi2;
+	do {
+		hi1 = gpu_read(ptdev, reg + 4);
+		lo = gpu_read(ptdev, reg);
+		hi2 = gpu_read(ptdev, reg + 4);
+	} while (hi1 != hi2);
+	return lo | ((u64)hi2 << 32);
+}
+
+#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
+	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
+			  dev, reg)
+
+#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
+				     timeout_us)				\
+	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
+				 false, dev, reg)
+
+#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
+	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
+			  dev, reg)
+
+#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
+				       timeout_us)				\
+	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
+				 false, dev, reg)
+
+#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us,	\
+					     timeout_us)			\
+	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
+				 timeout_us, false, dev, reg)
+
+#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us,		\
+					timeout_us)				\
+	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
+			  false, dev, reg)
+
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0f52766a3120..ecfbe0456f89 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1059,8 +1059,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 	u32 status;
 
 	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
-	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-			       status == MCU_STATUS_DISABLED, 10, 100000))
+	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+				  status == MCU_STATUS_DISABLED, 10, 100000))
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }
 
@@ -1085,8 +1085,9 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-					status == MCU_STATUS_HALT, 10, 100000)) {
+		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+					   status == MCU_STATUS_HALT, 10,
+					   100000)) {
 			ptdev->reset.fast = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 671049020afa..fd09f0928019 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -108,14 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
 
-	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
-	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
 
 	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
 	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
@@ -152,8 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
-			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
+		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
@@ -244,45 +238,27 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				u32 pwroff_reg, u32 pwrtrans_reg,
 				u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwroff_reg, mask);
-
-	if (mask >> 32)
-		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
+	gpu_write64(ptdev, pwroff_reg, mask);
 
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
 	return 0;
@@ -305,45 +281,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 			       u32 pwron_reg, u32 pwrtrans_reg,
 			       u32 rdy_reg, u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwron_reg, mask);
-
-	if (mask >> 32)
-		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
+	gpu_write64(ptdev, pwron_reg, mask);
 
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
-						 val, (mask32 & val) == mask32,
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
+			blk_name, mask);
+		return ret;
 	}
 
 	return 0;
@@ -492,26 +449,6 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
 	panthor_gpu_l2_power_on(ptdev);
 }
 
-/**
- * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
- * @ptdev: Device.
- * @reg: The offset of the register to read.
- *
- * Return: The counter value.
- */
-static u64
-panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
-{
-	u32 hi, lo;
-
-	do {
-		hi = gpu_read(ptdev, reg + 0x4);
-		lo = gpu_read(ptdev, reg);
-	} while (hi != gpu_read(ptdev, reg + 0x4));
-
-	return ((u64)hi << 32) | lo;
-}
-
 /**
  * panthor_gpu_read_timestamp() - Read the timestamp register.
  * @ptdev: Device.
@@ -520,7 +457,7 @@ panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
  */
 u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
 {
-	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
+	return gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
 }
 
 /**
@@ -531,10 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
 {
-	u32 hi, lo;
-
-	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
-	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
-
-	return ((u64)hi << 32) | lo;
+	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 12a02e28f50f..a0a79f19bdea 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -510,9 +510,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
 	/* Wait for the MMU status to indicate there is no active command, in
 	 * case one is pending.
 	 */
-	ret = readl_relaxed_poll_timeout_atomic(ptdev->iomem + AS_STATUS(as_nr),
-						val, !(val & AS_STATUS_AS_ACTIVE),
-						10, 100000);
+	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
+						   !(val & AS_STATUS_AS_ACTIVE),
+						   10, 100000);
 
 	if (ret) {
 		panthor_device_schedule_reset(ptdev);
@@ -564,8 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
-	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
+	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -615,14 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -635,14 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -1680,8 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
-		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index a3ced0177535..6fd39a52f887 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -232,10 +232,4 @@
 #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
 #define CSF_GLB_DOORBELL_ID				0
 
-#define gpu_write(dev, reg, data) \
-	writel(data, (dev)->iomem + (reg))
-
-#define gpu_read(dev, reg) \
-	readl((dev)->iomem + (reg))
-
 #endif
-- 
2.47.1


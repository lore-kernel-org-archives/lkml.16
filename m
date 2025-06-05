Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0849819D07E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749100439; cv=fail; b=kZ3804xSeIg1Aka7oN2o8ourrkhDvc0DNzJKt0o+tQe91qKv7wO5lO6WJs6ykXRthSB1mWG96+zNZYh5j8GwsAxo7GxblM5Ki2ZkttVDaZ91m4PdELvRIp8MMsQsSwN+qAdNr5wLXQkk7oC+5MfeV9aR/ESrY8KhtDwOYG20MeA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749100439; c=relaxed/simple;
	bh=XEDV0r3ix6odEpm0gPjoDndex/Ia7Hbzg4oKoU0qbYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jz/0+25mHh1QchlSoZIhKAB6k2OObAHug8+b76DequqJTDG4xJS0Itk+sfSQHE9WrOnfosW/PaJ1VoF9vsLK0lNeqBHFmFac8TzY5XKMW6ovI/PadHcD87t79aQ1V7VvHotO//SNb3BTPxuncaqWysrzSKDfwA9tPMZw1f962jo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qOcKnXj/; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qOcKnXj/; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qOcKnXj/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qOcKnXj/"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C2UzJyvS3zPgVZndK8nKd3wtCnvNDVlV8/F49kZUmWRe3TZT66OkFYiGjzKS6e9cvpKLaBiige0VKmjQ3+K9ue51i9+7CQquwMQNLJ+b1/vgy8UrLbTMtqP1wLuBokMLr0H2RpLZ79Kyu0mNRJqvQJBIbNuwPq1aDpeApvP4z84iNUSsZj74tXDgiLwtp9Nk+9PRMN1HtsrRHq4Fg2nl+qiogtt4ztHpilkqaFfvS+bTh01JTFbuSvrW6XA4m3jyvOFpkoiYBorPZ2DdR4/MPi77IslZcd+4Lmv2Cag7LRlgUDs8Fnes69hhfPwLRCn5U4K6tnBYRGgf9KrR0gjr4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nl0+njriRQAm/ycOE3aj+a2CnCQKBtN6Qb8tgCFhhiQ=;
 b=d5o3MwR7Aumvr+Dm8PLgh1uQIepFR6qSW4INtSQ4DrR1e0b72TWzkYW3Ew2UabfQumagrz4OygpO3YBLSy9Ao8MNs5LNnf66UaoRaGzXhlMMDrffgW2nOHw093kwpGupsOZrTfmeEGlzipUhdHUCvvhlPSxxC9Qt2VPAAa7qqWRb4+1LmhuozNeNYk737RW7xUV6MxH00vS1clIyxJ1WZAAXVK49wzU72ErbDnZ9VQ/j5qhO3wiKOhaH2/6OSvdAL//4X6Xyz/ZOrjFBomqY3Ul8+mQduVzK8MBZfI6IOGHUbk2XJ5x2yYT2IDks7B3nE+OTuF6t2MsWTdK87H3BUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl0+njriRQAm/ycOE3aj+a2CnCQKBtN6Qb8tgCFhhiQ=;
 b=qOcKnXj/kxF2XjHU2mtInlGFSMWHtaJWAJ6cg7Xak9LmM/RMPtyQnPQ+U93YuhWq1sO2GGlPggx3VMIF2PquNWWcmyryq9Sbj7ePS/0ZXAsjYxUOpJ5rNzDaRPqNbz2AMMScjRCK0Sa1wj8lZ1w40KziL8IfA2ZPvp5WkJN6OL8=
Received: from AM0PR02CA0116.eurprd02.prod.outlook.com (2603:10a6:20b:28c::13)
 by AS8PR08MB8273.eurprd08.prod.outlook.com (2603:10a6:20b:537::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 5 Jun
 2025 05:13:51 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::61) by AM0PR02CA0116.outlook.office365.com
 (2603:10a6:20b:28c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend
 Transport; Thu, 5 Jun 2025 05:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 05:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQccim1LJCYgR9iF5tju6NXvwfsKmeQk/SS1i2GKUHJki49R3sOE8uzK90zVbI2gqN7wq/rbZ1jQfH4ltQ3OvJ5U+g61HU3JoEkEb3WQ3lGNAQpLuZ0Ozstob3wj+tDMwdj0nX73S+Ota0KXhvR1PFvaXZX6+OJ9z702r5mGgY2ho1OyMQBRKqeCnOjgLWwo/JcApJ1kpHX9rPhUVF8oReHKHDPiA+291e27mti8s6M5Ewoyy+XHnNl37sVH2Y1YkG66ZBplKVPzWjEwIb6rUqk4B36k3F8C5UZ7rzksWLARIqSrRwO43PTYkpI2pOkoh9PML5BI5NLmQTUMpBNuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nl0+njriRQAm/ycOE3aj+a2CnCQKBtN6Qb8tgCFhhiQ=;
 b=QsZuyxx4+Ci6hZidrsdWfQ7O1Kinjoll/Jv731GSMdzZxmZ7sijp55CNxOy9wW4csl0AgD9AfiGHubRIhaCV0/UDYipCQ26g+vzoy9tY4j58zeugWTp8Px8+L/e+rLyhkM4DTcKck6Ix1v9q8xju3MB4xJU6qEGVUp/tAY6f7BX3ng/5gnFqE/pMqxwnt9ZhpOK93+Y2+ECzDoF2OM2TdsqP9JE/LLAslKg186Ud+pkjZmRQOb+TLK9j8V4L92mEj97BbhEtjsD2W5cMNKtRp2b5+sVv2aVnBswaZE2utQifnTbf2ICndN6iKv1Xo8ZTyJXbJbQthFukqD0CqZMHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl0+njriRQAm/ycOE3aj+a2CnCQKBtN6Qb8tgCFhhiQ=;
 b=qOcKnXj/kxF2XjHU2mtInlGFSMWHtaJWAJ6cg7Xak9LmM/RMPtyQnPQ+U93YuhWq1sO2GGlPggx3VMIF2PquNWWcmyryq9Sbj7ePS/0ZXAsjYxUOpJ5rNzDaRPqNbz2AMMScjRCK0Sa1wj8lZ1w40KziL8IfA2ZPvp5WkJN6OL8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB6165.eurprd08.prod.outlook.com
 (2603:10a6:20b:29a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 05:13:19 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 05:13:18 +0000
Date: Thu, 5 Jun 2025 06:13:16 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Luka <luka.2016.cs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] WARNING: locking bug in ___rmqueue_pcplist in Linux kernel
 v6.12
Message-ID: <aEEnbJKLdwOZm3UC@e129823.arm.com>
References: <CALm_T+2nmQCQXsBSsD2QPTXb_wOKALAgOPwzTFc=evWUmUsq5g@mail.gmail.com>
 <aEAC4/XzOqkqA1wd@e129823.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEAC4/XzOqkqA1wd@e129823.arm.com>
X-ClientProxiedBy: LO2P265CA0484.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::9) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AS8PR08MB6165:EE_|AMS0EPF000001A5:EE_|AS8PR08MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1d3240-06ee-47c3-ee40-08dda3efc262
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?KeiBJ08lkAdIcYfGhbi1GEHx0TVytUfHN0XRK14UHgmpGzIKgRT9Bt3oBnsF?=
 =?us-ascii?Q?FRwJYLOAg7MLq70nHs5/OhzbXXjvLG7UDt0fJr5mZWC+RcBUSV5oLhUwOBf0?=
 =?us-ascii?Q?yBlgs2ELKOMaleSWtzzNBdAs6nJzZ9Z+CM2NGlVsunRMvXj6sAlPiatio8i0?=
 =?us-ascii?Q?1miG/hvgm6X25BtxVFrXa2bj3iO7CbAN2BDfa33OSO6lpF9AuBjoB8Gqdqba?=
 =?us-ascii?Q?ogWuvCtXT0QrEfwYJQZ09d4n5uALlj4I2dkXGMh/qLVd+l1ZSe347Fl575A0?=
 =?us-ascii?Q?d8VAQZd6SjLjtfzRnxRNjRyh325Bkrrax8x5JlSWKBiHb7E3DlNUg2tHZk7U?=
 =?us-ascii?Q?s1mLAepjR1ePf00uzLdHVXs7VxQHBTkYQkkxuhZKdskwC7/YunDKNb8nXzxJ?=
 =?us-ascii?Q?srlknBSdNgL3VLUeW5zWFtZkHprbenaAmKahAPOviAdT9/LyQhwh8tV7ec/i?=
 =?us-ascii?Q?l01GOV27wESMF6pqY5nfBdzBWr4JTSmF8L1XoE9+495JKSEO+LUQEfuaJyS1?=
 =?us-ascii?Q?zybr/Xa4o3p0uZuvD7Yocj04hi/S5BOtOnkiMcaT8iTUukoi/Z/1jxWB2f6F?=
 =?us-ascii?Q?yA/jW+B/YthY7C8uS7Lls/V/DqvC/c00ukiVdkkk9jxULA7UZpdy5Fwwv5Qo?=
 =?us-ascii?Q?goC9eYSRMBHehMRKA2Dx2yi4cRilLbUtBddgyUNl1oXQpqY3xIjYzHCn9dt0?=
 =?us-ascii?Q?n0xr8UIXHBDzgp2MPwyhw1TGxLhrP6Wke8/sB42l4zsBVJ0eJdsXgHWhfQZp?=
 =?us-ascii?Q?LAq7pM+ZbApYdbaHDy/hITNZzh6PmJ1vONTqejdKAL9W7fKeXeXomqFRtGSH?=
 =?us-ascii?Q?sNDvgQHk0RPCCrR6fyZPYq77qnVcNue/fJ58QS15mWsYyF2QSY1pIy5V2c8q?=
 =?us-ascii?Q?J0m9p3rJe2ZOCTszxU0O00GtbjNxPDpF3sq05Der5GUr/YmQtHXX+I17A9B8?=
 =?us-ascii?Q?0Aw1avtZqgzA7tyaenDzZWTL3ic6ILYdDyZqqqvU1uNbS2GrZSxnBC9iy5Mv?=
 =?us-ascii?Q?KegV9xQywGnvV99S4NPu8ExVVDdmOMtbltu1Qsx8Thxk+dBfItcQHKFoNr+V?=
 =?us-ascii?Q?aNitWOycV2NkWBhUqELkULEMr2rFnGM6dMBwXIdZj9vvNykv2RdiVXBFJg4l?=
 =?us-ascii?Q?TRZbZh763I35IMo4ox1ImmMVcu5k11MwF8KUkoOgMffe8ceLPRNZ9ekRRd6B?=
 =?us-ascii?Q?Ij+3lXZSK1WgCMVUyX4Fh5MbtGZC5z9IkK9b0hrDRw77upokj7OFTCEKkIpp?=
 =?us-ascii?Q?+al3Q85YYTmg60YROCQy54ayhLlOMcyr+rdvp/33hHTDP4mzScUJTLAtZQRN?=
 =?us-ascii?Q?P7bugq4uIxC2Q6s9XdijfCr6TY8FKoi47zhVBK6Olr1S6Bx4c0ddNePGFJXu?=
 =?us-ascii?Q?tI3AVAA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d73271a6-2619-4549-fba2-08dda3efaef8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|1800799024|376014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X+8kvSUSOqTWS3R/kZ58ExAqdJM/SrsXaDILEHxzzmMgvluIfhCHzPur+iZJ?=
 =?us-ascii?Q?hZrHIZ8iK9IC0YGlbn1ALhHuXYJSZRreNVT3tWX/dN8R5JHyN8RZ8uU5Vgoy?=
 =?us-ascii?Q?bCgxeEAH8X/Lw87J+7m57LaRUrYOhUsbLV5xMF3Q9aTcmV3jqVegwShAmBYG?=
 =?us-ascii?Q?CTzJiGK2WcXXfp4DH/5ZAOdPTdlgp8wm4MrM49Tabv7oxFvDcIfpzJxhLPX2?=
 =?us-ascii?Q?9XGoGB+cIvULd+jwBjyAhV7e++jn6AWMV3llhqJOPJPubo1Qm5xRKpDSfuUO?=
 =?us-ascii?Q?9FIOkvoej+qD8Lvwyx4k+d62alEMzPRw8a+Uewd0o7Bm8fWEk5elRG4J7ZOh?=
 =?us-ascii?Q?SnfmOeH9AuLRehw/O+hTIbWIFdYUy9QNO/KusHDTsu9E+R/Zb2k74t0GlGd7?=
 =?us-ascii?Q?x2DtTYncef5PmuYIfmO+7VDG03/DR70uxUWUdD6nXdNe3AHSPB8cNiDyANLV?=
 =?us-ascii?Q?b7AbH3J/aURoFIfjWkL+VfIR8odAZbAliKZqV6hE18kctwMFPit/glYuTWWG?=
 =?us-ascii?Q?5WEuSJxmI+zityfgAww6pJZwtvefW5y2eMTziPpVK1hb3pKyYcbykIXCQwPw?=
 =?us-ascii?Q?sw2BDIo2ji+wTzqTD/6Hmvp4PfFHlo4sRC2Id/27OwB+8TIGCEkkSWDE7LU/?=
 =?us-ascii?Q?TGKaCF51pZOswi1gmH+IAAQ1jqH/qcvWU1k+yR7rQK59g4UA1nPA+NQX2I1W?=
 =?us-ascii?Q?Git+ey47NHLdsbvwVdZI3poLA7Z5doH/QawYBdlZIH40ShryIv5pJVfkaSaQ?=
 =?us-ascii?Q?f1B5Tbir6+xrHxR14O47kn7zU4csa4tC8mROIq+XnwcwtMekc3V69otV9kM2?=
 =?us-ascii?Q?LSMQNxQ+BRFPupyOC9ICxt7C/00Z5M8gGsfRMmRYJ5hyhdmZUq5RR8cO4kdT?=
 =?us-ascii?Q?mnD1FTLt1rl9Ohbm9EBFNCboI4oUTDE3yWO+L6XMYE6YEDqcRPN0sj7obn84?=
 =?us-ascii?Q?XYTIVVniGWOGTcGndtntav2lRP6UhPaW6HVEssqwRvgQY02HZ8eQcQeCedgZ?=
 =?us-ascii?Q?zR0vktG7LJdWb6fuamxOxseHCQQ0UmDn37p50zdi+cVkF7brnBHoazghGbZY?=
 =?us-ascii?Q?NsOI8x3fGp0JyfG1VbTG0Lns6NgdVp1eCw2Qb6Tc4xnwW/oTWfApbaC0glC1?=
 =?us-ascii?Q?TClSnarb6DPXDqqG9TU3AzHPJuL0N5T2QU376rZBTV3nH4CYxXyzx0rqeCx6?=
 =?us-ascii?Q?BYDywetF4ou95NuUtBm5vXVRYE97f7e1nx6GwVLMN9rkayX5qfQ8rrEl/2nr?=
 =?us-ascii?Q?qtUw1NgHODn/tBIC5B6CIJu7GXv6fNEX6k/jUDqFhjLTuQqhhwgVySYYuHmR?=
 =?us-ascii?Q?1kr8zL5JehAgmF3VDG2Wr1QRHc/56ETcDOf9VGELvgH6g2CboSstJZE9Y1ud?=
 =?us-ascii?Q?P1sv2xIqv+/wUysxwIVVSD6m4Aba6tSyHyLazmIHPVecDrvAugpes66innGG?=
 =?us-ascii?Q?PtyNa+Ws2Dh46gJkYZ2Sy1lAk3oxACz3OkN7KVYRHUZs+qTgkgYP/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(1800799024)(376014)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:13:50.9361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1d3240-06ee-47c3-ee40-08dda3efc262
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8273

> Hi Luka,
>
> >
> > I am writing to report a potential vulnerability identified in the
> > upstream Linux Kernel version v6.12, corresponding to the following
> > commit in the mainline repository:
> >
> > Git Commit:  adc218676eef25575469234709c2d87185ca223a (tag: v6.12)
> >
> > This issue was discovered during the testing of the Android 16 AOSP
> > kernel, which is based on Linux kernel version 6.12, specifically from
> > the AOSP kernel branch:
> >
> > AOSP kernel branch: android16-6.12
> > Manifest path: kernel/common.git
> > Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12
> >
> > Although this kernel branch is used in Android 16 development, its
> > base is aligned with the upstream Linux v6.12 release. I observed this
> > issue while conducting stability and fuzzing tests on the Android 16
> > platform and identified that the root cause lies in the upstream
> > codebase.
> >
> >
> > Bug Location: ___rmqueue_pcplist+0x3b0/0x236c mm/page_alloc.c:3276
> >
> > Bug Report: https://hastebin.com/share/tobupusuya.bash
> >
> > Entire Log: https://hastebin.com/share/imecipavet.yaml
> >
> >
> > Thank you very much for your time and attention. I sincerely apologize
> > that I am currently unable to provide a reproducer for this issue.
> > However, I am actively working on reproducing the problem, and I will
> > make sure to share any findings or reproducing steps with you as soon
> > as they are available.
> >
> > I greatly appreciate your efforts in maintaining the Linux kernel and
> > your attention to this matter.
> >
>
> Could you make a test with this patch please?
>
> -----8-----
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 28066b4ced81..4c7007377525 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -707,7 +707,7 @@ enum zone_watermarks {
>  #define        PCPF_FREE_HIGH_BATCH            BIT(1)
>
>  struct per_cpu_pages {
> -       spinlock_t lock;        /* Protects lists field */
> +       raw_spinlock_t lock;    /* Protects lists field */
>         int count;              /* number of pages in the list */
>         int high;               /* high watermark, emptying needed */
>         int high_min;           /* min high watermark */
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> :...skipping...
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 28066b4ced81..4c7007377525 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -707,7 +707,7 @@ enum zone_watermarks {
>  #define        PCPF_FREE_HIGH_BATCH            BIT(1)
>
>  struct per_cpu_pages {
> -       spinlock_t lock;        /* Protects lists field */
> +       raw_spinlock_t lock;    /* Protects lists field */
>         int count;              /* number of pages in the list */
>         int high;               /* high watermark, emptying needed */
>         int high_min;           /* min high watermark */
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 2ef3c07266b3..f00d58aba491 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -134,7 +134,7 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
>         type *_ret;                                                     \
>         pcpu_task_pin();                                                \
>         _ret = this_cpu_ptr(ptr);                                       \
> -       spin_lock(&_ret->member);                                       \
> +       raw_spin_lock(&_ret->member);                                   \
>         _ret;                                                           \
>  })
>
> @@ -143,7 +143,7 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
>         type *_ret;                                                     \
>         pcpu_task_pin();                                                \
>         _ret = this_cpu_ptr(ptr);                                       \
> -       if (!spin_trylock(&_ret->member)) {                             \
> +       if (!raw_spin_trylock(&_ret->member)) {                         \
>                 pcpu_task_unpin();                                      \
>                 _ret = NULL;                                            \
>         }                                                               \
> @@ -152,7 +152,7 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
>
>  #define pcpu_spin_unlock(member, ptr)                                  \
>  ({                                                                     \
> -       spin_unlock(&ptr->member);                                      \
> +       raw_spin_unlock(&ptr->member);                                  \
>         pcpu_task_unpin();                                              \
>  })
>
> @@ -2393,9 +2393,9 @@ int decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp)
>
>         to_drain = pcp->count - pcp->high;
>         if (to_drain > 0) {
> -               spin_lock(&pcp->lock);
> +               raw_spin_lock(&pcp->lock);
>                 free_pcppages_bulk(zone, to_drain, pcp, 0);
> -               spin_unlock(&pcp->lock);
> +               raw_spin_unlock(&pcp->lock);
>                 todo++;
>         }
>
> @@ -2415,9 +2415,9 @@ void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp)
>         batch = READ_ONCE(pcp->batch);
>         to_drain = min(pcp->count, batch);
>         if (to_drain > 0) {
> -               spin_lock(&pcp->lock);
> +               raw_spin_lock(&pcp->lock);
>                 free_pcppages_bulk(zone, to_drain, pcp, 0);
> -               spin_unlock(&pcp->lock);
> +               raw_spin_unlock(&pcp->lock);
>         }
>  }
>  #endif
> @@ -2431,7 +2431,7 @@ static void drain_pages_zone(unsigned int cpu, struct zone *zone)
>         int count;
>
>         do {
> -               spin_lock(&pcp->lock);
> +               raw_spin_lock(&pcp->lock);
>                 count = pcp->count;
>                 if (count) {
>                         int to_drain = min(count,
> @@ -2440,7 +2440,7 @@ static void drain_pages_zone(unsigned int cpu, struct zone *zone)
>                         free_pcppages_bulk(zone, to_drain, pcp, 0);
>                         count -= to_drain;
>                 }
> -               spin_unlock(&pcp->lock);
> +               raw_spin_unlock(&pcp->lock);
>         } while (count);
>  }
>
> @@ -5744,7 +5744,7 @@ static void per_cpu_pages_init(struct per_cpu_pages *pcp, struct per_cpu_zonesta
>         memset(pcp, 0, sizeof(*pcp));
>         memset(pzstats, 0, sizeof(*pzstats));
>
> -       spin_lock_init(&pcp->lock);
> +       raw_spin_lock_init(&pcp->lock);
>         for (pindex = 0; pindex < NR_PCP_LISTS; pindex++)
>                 INIT_LIST_HEAD(&pcp->lists[pindex]);
>
> @@ -5854,12 +5854,12 @@ static void zone_pcp_update_cacheinfo(struct zone *zone, unsigned int cpu)
>          * This can reduce zone lock contention without hurting
>          * cache-hot pages sharing.
>          */
> -       spin_lock(&pcp->lock);
> +       raw_spin_lock(&pcp->lock);
>         if ((cci->per_cpu_data_slice_size >> PAGE_SHIFT) > 3 * pcp->batch)
>                 pcp->flags |= PCPF_FREE_HIGH_BATCH;
>         else
>                 pcp->flags &= ~PCPF_FREE_HIGH_BATCH;
> -       spin_unlock(&pcp->lock);
> +       raw_spin_unlock(&pcp->lock);
>  }
>
>  void setup_pcp_cacheinfo(unsigned int cpu)
> (END)
> @@ -2393,9 +2393,9 @@ int decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp)
>
>         to_drain = pcp->count - pcp->high;
>         if (to_drain > 0) {
> -               spin_lock(&pcp->lock);
> +               raw_spin_lock(&pcp->lock);
>                 free_pcppages_bulk(zone, to_drain, pcp, 0);
> -               spin_unlock(&pcp->lock);
> +               raw_spin_unlock(&pcp->lock);
>                 todo++;
>         }
>
> @@ -2415,9 +2415,9 @@ void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp)
>         batch = READ_ONCE(pcp->batch);
> :
> @@ -2393,9 +2393,9 @@ int decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp)
>
>         to_drain = pcp->count - pcp->high;
>         if (to_drain > 0) {
> -               spin_lock(&pcp->lock);
> +               raw_spin_lock(&pcp->lock);
>                 free_pcppages_bulk(zone, to_drain, pcp, 0);
> -               spin_unlock(&pcp->lock);
> +               raw_spin_unlock(&pcp->lock);
>                 todo++;
>         }
>
> @@ -2415,9 +2415,9 @@ void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp)
>         batch = READ_ONCE(pcp->batch);
>         to_drain = min(pcp->count, batch);
>         if (to_drain > 0) {
> -               spin_lock(&pcp->lock);
> +               raw_spin_lock(&pcp->lock);
>                 free_pcppages_bulk(zone, to_drain, pcp, 0);
> -               spin_unlock(&pcp->lock);
> +               raw_spin_unlock(&pcp->lock);
>         }
>  }
>  #endif
> @@ -2431,7 +2431,7 @@ static void drain_pages_zone(unsigned int cpu, struct zone *zone)
>         int count;
>
>         do {
> -               spin_lock(&pcp->lock);
> +               raw_spin_lock(&pcp->lock);
>                 count = pcp->count;
>                 if (count) {
>                         int to_drain = min(count,
> @@ -2440,7 +2440,7 @@ static void drain_pages_zone(unsigned int cpu, struct zone *zone)
>                         free_pcppages_bulk(zone, to_drain, pcp, 0);
>                         count -= to_drain;
>                 }
> -               spin_unlock(&pcp->lock);
> +               raw_spin_unlock(&pcp->lock);
>         } while (count);
>  }
>
> @@ -5744,7 +5744,7 @@ static void per_cpu_pages_init(struct per_cpu_pages *pcp, struct per_cpu_zonesta
>         memset(pcp, 0, sizeof(*pcp));
>         memset(pzstats, 0, sizeof(*pzstats));
>
> -       spin_lock_init(&pcp->lock);
> +       raw_spin_lock_init(&pcp->lock);
>         for (pindex = 0; pindex < NR_PCP_LISTS; pindex++)
>                 INIT_LIST_HEAD(&pcp->lists[pindex]);
>
> @@ -5854,12 +5854,12 @@ static void zone_pcp_update_cacheinfo(struct zone *zone, unsigned int cpu)
>          * This can reduce zone lock contention without hurting
>          * cache-hot pages sharing.
>          */
> -       spin_lock(&pcp->lock);
> +       raw_spin_lock(&pcp->lock);
>         if ((cci->per_cpu_data_slice_size >> PAGE_SHIFT) > 3 * pcp->batch)
>                 pcp->flags |= PCPF_FREE_HIGH_BATCH;
>         else
>                 pcp->flags &= ~PCPF_FREE_HIGH_BATCH;
> -       spin_unlock(&pcp->lock);
> +       raw_spin_unlock(&pcp->lock);
>  }
>
>  void setup_pcp_cacheinfo(unsigned int cpu)

Sorry for my bad, I read code wrong...

This problem is gone since:
  commit  d40797d6720e8 ("kasan: make kasan_record_aux_stack_noalloc() the default behaviour")

Thanks
--
Sincerely,
Yeoreum Yun

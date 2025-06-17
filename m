Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011041.outbound.protection.outlook.com [40.107.130.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC52EF9A2;
	Tue, 17 Jun 2025 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.41
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750185564; cv=fail; b=UAqfxDp8brf9X/qAfG5rXBiUFF9j+l5ZFAQCeIs1VK3zP7jOWxItnhbDjUTTCSLnshOzfBEBKiW1o+o44v9e/4MOPRqXOI32I79n20d1e1Jsp1jzwLUWLkaGac9w9dm99v2+AgNXOukxev388bGUVyR6x8j/GF0M6zQ77O+E9Uo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750185564; c=relaxed/simple;
	bh=VCQNOl2AY8lECcyGELBYbfI2CivZGY+68CbdHEC+YBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fe0KOIbavdTy6hGr1b3DklMoOO1RgwMrHfnJOxo8zxat+bI3P06WWRnATqTnuvjjZkLVVnE3fkMRcz0SWXjV84OaEuQptF3Pu02hpUoIt90dAD4EKSjXwL55Ik5ustaNXvtThxNzKxg0bbLTcUh3XFBhi0QFV4DVe8fLcwl6MaA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K1JaHJ7T; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K1JaHJ7T; arc=fail smtp.client-ip=40.107.130.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K1JaHJ7T";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K1JaHJ7T"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VRqu1xrjT9DQqBCKNyv57Xby0fZlnsAP4OizBfruCk0XclLaGHwfcUzi9XRq0HoOM8c7ngzg3bvUvkwpDkTl6shvXTYwWCLjd0/8xMVx7aoBdoP+VvC1+Z7xTb5DOp04onDxp1jg0JovqXyzVf8ma6sfc+dht8I4HOS3tjZRGTEL68/uhM9aUg3ROnu2l2R9BeFj+H4Y6LIRQRqZyoq+47ZoYQcoFwCATRl9THjE37Q7Rj5PEB7G9TnyPqc/XZ/BPrvh4VLYj2tsh1OJ5yTIes/595BpULt/3EuhSU0+p34vy5GXtiAqyoEeL1+F6ju3lLC39crDYXprTcBI9M2pFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znlbSxRXIMQJ/M8RfELFkOJ6Sb6OUWzMDV/rFE3sgtw=;
 b=Ydg6LRDowQCxRntGRbVAV9yf3yGpf5PvKaVILqhCwau7Jq4Iwzz+84JOp+Hyziytj/1BX8qNIoCyXthAqmqtc4pci58bYj6EPU5VOYgneOZp8n98goIisWM+dpboTn+x1eKGj0pufT2bSysINQDS5Ag3Wx86rrMH6yI8cJ2DRaspz+CbdBp+74pS3+BimwK2yz14hB9CYsDFVSimTm1TGxNDeXAQIPBemKbbuBRdCvlICEKeLB1G8tbzOTi3rIG/oyrCE9V6ELb/ioQm9JCcSPo30sHHjnxlnUBpwJbuw/gu8ZoLOqSp4yLaZYhN5AYdNWfGlpCaY+Z4GPwgkbMW7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znlbSxRXIMQJ/M8RfELFkOJ6Sb6OUWzMDV/rFE3sgtw=;
 b=K1JaHJ7TBQMuywoMovT+A18UDDuTtEuRkgQ2nJvVxCG8krs3WrUT2Zi4sRx4GoxEJjIP8E0rFNIAHrXBC8fMGVHV49JVIajQHdNkGUzGHxFGCwifdaqAGtdmbYaeGWnlThWSfFrNihjIdrL7AMNKvcKYLLOrM44tzmRYTpmf3pk=
Received: from DUZPR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::8) by VI1PR08MB9958.eurprd08.prod.outlook.com
 (2603:10a6:800:1c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 18:39:13 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::5a) by DUZPR01CA0033.outlook.office365.com
 (2603:10a6:10:468::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Tue,
 17 Jun 2025 18:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 18:39:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVcQ6RZSh3DLdOqqTodPb2d5eBasIl2hbKVG64qUVFnFOsGznbqo9U3TH3XZYOitd/2B2TzBmqnQC5WRw1GczewOAtxBt5pUckwpQ1zFuivl+TA1rJJ85rAJTnOn2HK4yDfD/zT190eS3V3j+g9v1tq7DUeL6yWJefNVMrQn7NWmai3dUmY18ZwsWSZ0yEIDuMLa/7xupBVA5tZ3JIX48mcoU6pwRHjqUtgxZ46PO/wv/2VJXbLNQvFs9vDxkzLD3X31asmR5pbz+VnEQQHuh1tXj5yaoejGpAoqLoD1yqtspC9CucEKJMvhRM1+k9AxqZEEfU625CHk0h0BxZ5IRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znlbSxRXIMQJ/M8RfELFkOJ6Sb6OUWzMDV/rFE3sgtw=;
 b=BCILpfSDmOXnkmyWtfrxlUFEoNjg25AVtDXEpvybU4/PTRsAtyan2hlFk+Jrx7AYrWVAIN9ypXNQi/yx9bsaY2+hAV8UwePQ6Es1loWV9Nscd4oubXVWCbSWEqtgacGRFigS7BNqQVXf+49YOjvR4i4X1awFYnMrHO9nhwpb0vGoXiV8D0RiYYIZLnfBLdaI90P6ZlJzVflU+upr+WrB2befTI/zAbptFqjyWjgEak3OHgSKN4DDZn80UfrWX/uBHMuSsvPBAYWzrJJsaSRVfedbNV8wPBzPaBGqk7Pih91+b8G5j8cHtrjTadsNPSniwJ90qq9LVUiMyMGQyH5hhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znlbSxRXIMQJ/M8RfELFkOJ6Sb6OUWzMDV/rFE3sgtw=;
 b=K1JaHJ7TBQMuywoMovT+A18UDDuTtEuRkgQ2nJvVxCG8krs3WrUT2Zi4sRx4GoxEJjIP8E0rFNIAHrXBC8fMGVHV49JVIajQHdNkGUzGHxFGCwifdaqAGtdmbYaeGWnlThWSfFrNihjIdrL7AMNKvcKYLLOrM44tzmRYTpmf3pk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PA4PR08MB7572.eurprd08.prod.outlook.com
 (2603:10a6:102:271::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 18:38:41 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 18:38:40 +0000
Date: Tue, 17 Jun 2025 19:38:38 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	broonie@kernel.org, anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 1/9] arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
Message-ID: <aFG2Lsc4AhVBZ7Jm@e129823.arm.com>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-2-yeoreum.yun@arm.com>
 <86y0txcsxf.wl-maz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y0txcsxf.wl-maz@kernel.org>
X-ClientProxiedBy: LO4P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::18) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PA4PR08MB7572:EE_|DB5PEPF00014B95:EE_|VI1PR08MB9958:EE_
X-MS-Office365-Filtering-Correlation-Id: a74af8df-cf1a-431f-1b37-08ddadce41b7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?RWdn82yaBlvv8MvFX8iI6IRNUvX5S3RNvoefeBdASo6QOrMGSYio+opXqFHl?=
 =?us-ascii?Q?HNR9a/Mzhb9s8sWtkIMxLh9COab10F0GZaFPDnTlistDR1sI08ZnSrHT6H33?=
 =?us-ascii?Q?2LIp9oLS84zRJGPGSRfkJF4bdkWa+uFidpnwFMzNgr6I/lHSSvwu5o/Bayx7?=
 =?us-ascii?Q?EoCZXMVHeUcc7Ht2uEgNVVTLCwKmOD1IFFIUL69mFh+ePR5Y7LZ+QxmLEXIn?=
 =?us-ascii?Q?OvZ2MS99e7U8vmgy/w7VwBb01L488ZMhozD0ZGt3BkLZlFCVBNseMFw2+VTX?=
 =?us-ascii?Q?wRbh/2+gQJuZfiSBcOldXQmcS5eY2gP2q9mO/yM0Z5eH7fJxf8gUVymUcWF2?=
 =?us-ascii?Q?a2LygBpSwub6mKQR2jUwGkt8Rb6/RcdIbla5e6QLNYx/+jgeD7zx38A1HSXe?=
 =?us-ascii?Q?Gn48u87Ae1hYg4ybkL6xonEZXQZifhIeCs4HGBVHP6DW7WZ4gb9u//wqtxzZ?=
 =?us-ascii?Q?2vEjlkl0tHEDV4CCSGE47/WtYofnhi12h9boa7j3Jx4ZKBn4Ko7jPf9AycQQ?=
 =?us-ascii?Q?Z0loCOgRsZmBPJ/82EjKf2s0OTfLXOKzJdfvUWHTvm5Y9dGRrp6d8M+SON1D?=
 =?us-ascii?Q?uNvBa1Mq8M13Xipp1Xy3tfv1SxPoA7yCcoN9a+W5tvmHKMPaztGYiyYakXvT?=
 =?us-ascii?Q?7ufi3uGq9VG/J5hi2M1ScvZIbo/n4tLZt2VFhnhm3FfPxQ379LhRfCOPgjUD?=
 =?us-ascii?Q?Qdzo6GNrv/DNiBm9mcIQ+zbocrSNE78nk4hYVClfFdajzmLEltYewITCQpCv?=
 =?us-ascii?Q?/SDHlwpWcUBn328F9boL+OlCzFz4R2vZtP0XTlOKHWkUj/uOlg/zkD6dNnDW?=
 =?us-ascii?Q?9M3/devbVlsaXdQETIwMQJq7cjwq2gemxDE5NcwZnQPgPIASqVqhXqAapaTN?=
 =?us-ascii?Q?ErPJZF7RxExeSbHnWGNdqbaLZzOG++AoxAQpJNbvYNU0/pu1qu4rI6DEvzH2?=
 =?us-ascii?Q?s4nAhXobtjKOX8i74R8SyxJY2qApgMxrrH542BtGEzNKU4+goD2RrieaXtf0?=
 =?us-ascii?Q?RQcE0l4XfmSLTfTo8p6Di2vracUu6Ttpn/R9QVxQc8R5uZWxbeIXQVn2K7PX?=
 =?us-ascii?Q?e8lBDqnXO1OBqfU1+Vyg+eFfMRjstdjnoKDg5oEQ8HZXvAyunygYUzT2STI2?=
 =?us-ascii?Q?Pzvo2MlhlBqDCftXwIcwtUdaD8Ak9/7v8DC8Hl8aEtwmmPO+zpKBRdWx3rhz?=
 =?us-ascii?Q?MiUrV4fmYB3ucaDVAmCIuZEl/at3fKeG7sySYfDLDL6DviUGuU5S4Q1uhLC9?=
 =?us-ascii?Q?kHaZk/mvjYaHfpIvjh1v77mLRvP2UUMTxmwAk2O9XcKE0aok3V5eG/2QJ5el?=
 =?us-ascii?Q?nDnUaiWBkmBBp7k1RhW/6dWC/S8b+oG+2EVmsVb95AXHjyL9T8tbs837cogO?=
 =?us-ascii?Q?iUT2OIpXfH5ojuGuIVMbuWOj1eZpwLj6qEpUrP9+qhOPMFGBU3tFw3Zd93I+?=
 =?us-ascii?Q?F/993KbvUGs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7572
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e140b42-b1a0-4372-ef73-08ddadce2dfc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|35042699022|7416014|14060799003|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5NS5y06pSejPHJKrxD1mhYhN9LJifDG33X42RrHDK6pIos6uqnaxHHTJmMry?=
 =?us-ascii?Q?NNVrVQHCMmWqgtrIKzO71tLydJzwcHIZ7tSBE/4EkEFxw4zeZpIMZmzrOgWp?=
 =?us-ascii?Q?fPl6/FS85r0eCN3YVxBc6QN+nQJ7E1UMxGYJ9zkXqnv23jZomH5t4QiaySw7?=
 =?us-ascii?Q?TTqPKfNStkAyCa5r7S+TN7VQhfh7fkjWABMoGn+JITpt2vJ8Uyc8rk9sOOXy?=
 =?us-ascii?Q?ItTbZfu/kxTMV2I+ngOVKLrzLZF7tGMdN2JpYezWsHkIG3HpfPQO3bjO6Ogv?=
 =?us-ascii?Q?2k4yt6FBVyfhGEgL6N/p0IscTBX7J6N+poZ9blSpLj5Sci1/sw+4YSpQzNO5?=
 =?us-ascii?Q?mP9irRnCagsJ+K8qCy6Jg95TVCf13pJlFhrt4Khj8+zTG11bfckxkycbSXJv?=
 =?us-ascii?Q?ZBK0Tb3tQiO9KyxeQGLWHCzQ++3FAT0zI3h7lk1e4iDu7YRzwGNR6VDVqtyr?=
 =?us-ascii?Q?gDi5CjzqqMAp4TT/5bL0uXeVRvvxUamu0a7ko4rOsfsrPZW/8q9e7Sc7TkPM?=
 =?us-ascii?Q?VT0IZeEstCK3qtZR4jp/FzgpuXYoE8eTJfv6/GG0WaLn4x/aktZirF7na8dk?=
 =?us-ascii?Q?MRe3ViS/jMPMKo6g9CucUoHKpKKEKnb6Gr+V4QW3gycHIEJPnz3yZ2t72wl1?=
 =?us-ascii?Q?ZlRFUBiafT0rENgocyxkcmpNfhro99X/4OTsJFr/e6D1dL4HTJ045fHrGR7c?=
 =?us-ascii?Q?Ls1yr6dCiRwyMZG139WdxQUxZlIjJiA4T2gFXuMN8EnhzpZeroJTY0Qiw+1P?=
 =?us-ascii?Q?QPEodPdWG2OxTUwMSS8EwGo0k7AN7mMrLkU9JLWxJYZJpOLVCjz4R3a1pprQ?=
 =?us-ascii?Q?vTrZ7ybqaNLPsN5OSyS4/if/aBSgPtgp+x11mO8X8GbTcuR/aFbncQlDQWQk?=
 =?us-ascii?Q?sJi6lnsSkjJQz5QMrQg1VRrcz8sspwPaMMwUya7XwXJ+jXyftQQjlnV4B2I/?=
 =?us-ascii?Q?kXJOJiXyTgFfLOn2l/C4Y4PlRMyUaf9/Vtb3DSk4s0BNMtMj3+U4dGGvjfLK?=
 =?us-ascii?Q?1nhTzKOlL4G1Abr16UoWDkA0KGGVnXQJOyazGOZAChwao4VVBuDIPM7CJxUU?=
 =?us-ascii?Q?k0tSchwtuIEvA+S9UgdefGDtL3Poq6H9yqlZPvkjmo7qmd6Aas3Uc08Z57xw?=
 =?us-ascii?Q?XmKhbgDyaFHOA6NZnW2qp1T/wbE+Qd3LU7Ay2PQSlGeislJS1RosC02UGQg/?=
 =?us-ascii?Q?jNVVWrAMjiQjhf4vLWCXEDwY2BkD3W/sqrqAhjMtFMTGojMlUD7WqlGGonDL?=
 =?us-ascii?Q?fIwFm7D2t65VEqV6Bc+O7p3WyM5tV3o1EOnSdoBbx88YyctJBpHUmFsS+iOi?=
 =?us-ascii?Q?/1vAUeqi0JHGaPCAdFMO6kfwtU869d2EbcyHq7ZXdANat6n3eVaQg4jHUDE8?=
 =?us-ascii?Q?xnFYCoT5W6iRT3woQ3/bBtxL7I+cAJLrQAXAxhUKqEp870Ec9GH5Yv8ACUuQ?=
 =?us-ascii?Q?nPtjc2+2ks4nzYxK0jVIFkYdeSBDbCNJ5QUybzYv2p2apvlXl7DtblI8JS2R?=
 =?us-ascii?Q?REIsjxiK+7p/THEQ3mtrS4EKyQXy0UxvyFxd?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(7416014)(14060799003)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 18:39:13.2882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a74af8df-cf1a-431f-1b37-08ddadce41b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9958

Hi Marc,

> On Wed, 11 Jun 2025 14:58:10 +0100,
> Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > Add FEAT_MTE_TAGGED_FAR cpucap which makes FAR_ELx report
> > all non-address bits on a synchronous MTE tag check fault since Armv8.9
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
> > ---
> >  arch/arm64/kernel/cpufeature.c | 8 ++++++++
> >  arch/arm64/tools/cpucaps       | 1 +
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index b34044e20128..af6a6924a3e8 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -320,6 +320,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
> >
> >  static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
> >  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_FPMR_SHIFT, 4, 0),
> > +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTEFAR_SHIFT, 4, ID_AA64PFR2_EL1_MTEFAR_NI),
> >  	ARM64_FTR_END,
> >  };
>
> Same thing as the remark I had on FEAT_LSUI: for anything that does
> not introduce extra state, please similarly enable the feature in KVM.
> There is no point in these discrepancies.
>
> For anything that has extra state, you should at least consider what
> needs to be done.
>
> Thanks,

Okay. I'll expose this to guest.
Thanks.

--
Sincerely,
Yeoreum Yun

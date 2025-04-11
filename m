Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012006.outbound.protection.outlook.com [52.101.71.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDED7204840
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.6
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384341; cv=fail; b=P1q6SKa4qVdaALWSMbBYxd1GupurKuZLbhlxpM+zDBCMaTC/j6bnYOVaH1wd7GsSoOsFNZApwJt7Ec4XLNv9unkV/9PrX/bLx1x8PYiPDwgdFKx4wzg55VDezH7kOZKCigwMTEGg8lzVK9N7B/QjKXIFCjhUuxTp5QcX9pSzjHU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384341; c=relaxed/simple;
	bh=CSvvMeVFK+uYMw/uBk+ZV3RgKHD+qOabeFehC4Z3ld0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=on2VbLjMIUMpVBsPa8Z0RJqYUCybeD360dNStmUS1ea4vmnvjfE6ntax+ysadH8GxD++TR9vB8jIl8ylbcblL+ZjIuZCRdLVcDwrVOP7U7crLJ+ekd9/xwkgptWrx1nmKBs27OsqcG5oRcvs6UhYzq6fLpFPp/vX5NTpWBOEG0I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PozDvU01; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PozDvU01; arc=fail smtp.client-ip=52.101.71.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PozDvU01";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PozDvU01"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G3OE2dXMLxICDq7x9KJB4yaSa84lKRoVPBolcc3yY9J9UmS2/F6gZbBp1p/5+MNeOcYB6oQphtp9uzC3gv55RSXegwPGbb+ybW/ST3Zi23eVq71HVIQPhwaSJs/zAQUkSJOj1QY6LAKCktBNd8raVaEF58+JLXfDC0GNYtuj14VpeIBoxuJU3uw4P68NDP/CovKvVY5Um/ykD3NYrNONYeprG8FucHMQH1caay+N3h5T/RvWE7EPX/qp8dghDUwy89ydWKDTynzDU3UggNt+qrumhs8O/IGfVQVDWIFbrptix6ElhuHhK+LB5FzMuzWRbtoBM8FMimg0/j4ufk2aDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djE4K+X1eMGuaikq68pIW0nw/8wJR7ag85uZI3UcHvM=;
 b=Yl8sr+cxJSskcNncZxIWZi3/AzaHxjOCle9YWpcuGqDsHeCkXJ3cnzSX0tixRslK3aBDs6ItrFCKC6SblFudCgKiFJl+QM+JeZN4kLboo4niVPB3HdHFsuVmMR38avKH/ydFeflWvCFHKx6SAgGOctEaee1/999oEY4vhsqQljlWuK0CJntMSQdpI59njtAdH4g/qCTNP0LB8vf7X2U/mCGGeC/NjBZMmCQ9sey/y2l4X+oV5Td2VWh92KKP+/cFf8y6uzIRWpSbq65YrYMcCSbciexfjjcTqCBIBnsxcHOvQRZuFQGWg2voGLVuE6vRQj1N1u+qM8vJnyMctJAahQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djE4K+X1eMGuaikq68pIW0nw/8wJR7ag85uZI3UcHvM=;
 b=PozDvU01KQB7HgA2F/qLaJrtaWq9VrdFJwnETTJitZYwVQcCQ+RJOf20vcDudjwNTtm+NgZTjLAlvqEivene7Ptpt0ONoYwONnFcyAeUOn6b2IpNvSiRXRM9rhFq8nk/tEcS5zEA2TYt4ZB/zbJMRTNlJ4B3KzeWsAKaM0i5LV8=
Received: from AM9P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::10)
 by AS2PR08MB9391.eurprd08.prod.outlook.com (2603:10a6:20b:595::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 15:12:13 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::93) by AM9P195CA0005.outlook.office365.com
 (2603:10a6:20b:21f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 15:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 11 Apr 2025 15:12:13 +0000
Received: ("Tessian outbound e6e18cf4ef9f:v605"); Fri, 11 Apr 2025 15:12:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f67cb2373aadad20
X-TessianGatewayMetadata: +Q6f3r7Z67/eqf3mfYo+v8b+irkGIsQ4IGHNiA55o5ocxleQ+9V9xyxAK9kW0IzW8FFXU97Kllz3X1nRm1VHX5qLAohTJgqasxWXkBHmCdwQbOAV+Baz03cQBmFKZOfCGnItP4c60DKaN6MuBQYTXXSYUobp7bX3YmJ0VzagKFE=
X-CR-MTA-TID: 64aa7808
Received: from L821ee0b2d86f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 42624077-7333-4510-AAE8-2FCAE7594CEB.1;
	Fri, 11 Apr 2025 15:12:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L821ee0b2d86f.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 11 Apr 2025 15:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBCvQIwxJTpBay73b/tBL6Ijulurg1Jl2qMWnvIYhOpbRU1fWyfP6aHYX/5rbk6rht8SA7hWUAuf/AxZrUc2vXdbBmE3i+0UGXVLMr+mujQnzNyBlV4zuPZN1/JGJnivC5abrRfHXEwpCN80fBO21TXDeNA8c8SUZzd8f2/pBAXxvmRxyxr4HWTWdqNoh0iJLOBkpNQ5zZNCNt8zJOUJk8fN8/6b/RiK52FlsBM+SJbmf3d8N4e1Ld8/irmRhbSls2YLJP4LSZKkciHLsAzcoe4PsEAxiyx9LytrL8FWTv91rcscRSv+/GxGQ2so1g0nUljoi412ahA7GHvmvXu7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djE4K+X1eMGuaikq68pIW0nw/8wJR7ag85uZI3UcHvM=;
 b=AoHnl4RUTGqTdL8NwWcOCqtDKO7iUIiDJuyNZO3wseEwohFsazR9BIaWLztDTguH1LhKUNB0wIDZeZ4aRs75nht2xkl4bCKCzRZ8RugYY1ExMWhJOEwJkgtqcmjGeq1GE4qQaTKdZTbsXe9L1G9sVRMtSJEla9UI3zJwpTx8G0UG81T57GRppDEKbzPPViXqzT1XxP/Kgc+q18sg3hWm1Nbxtz+A2CXu7dhuWIIRBAySoed0BfPfWDwgW+Xno9kebztBI83wwUq+Wkl93Ywbax/gAlKiOEsi3lwKJW0K7kF74Z3UuDkgNLQjBsm/CM/HxLmkshfksA2PveQ37OQ+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djE4K+X1eMGuaikq68pIW0nw/8wJR7ag85uZI3UcHvM=;
 b=PozDvU01KQB7HgA2F/qLaJrtaWq9VrdFJwnETTJitZYwVQcCQ+RJOf20vcDudjwNTtm+NgZTjLAlvqEivene7Ptpt0ONoYwONnFcyAeUOn6b2IpNvSiRXRM9rhFq8nk/tEcS5zEA2TYt4ZB/zbJMRTNlJ4B3KzeWsAKaM0i5LV8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AM8PR08MB6499.eurprd08.prod.outlook.com
 (2603:10a6:20b:317::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Fri, 11 Apr
 2025 15:12:03 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 15:12:03 +0000
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
Subject: [PATCH v2 2/2] drm/panthor: Clean up 64-bit register definitions
Date: Fri, 11 Apr 2025 16:11:40 +0100
Message-ID: <20250411151140.1815435-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250411151140.1815435-1-karunika.choo@arm.com>
References: <20250411151140.1815435-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::23) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11200:EE_|AM8PR08MB6499:EE_|AM3PEPF0000A797:EE_|AS2PR08MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: ddbf6086-451b-45a0-3cad-08dd790b3d52
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?gwKte0ZUI/m/iZbkHOBuonkpEmbKlVEqzAcmathEFbkZQ/hZA+j5lIX36ncH?=
 =?us-ascii?Q?A/v0gKF5y42YCB1QDuXyPEwS21IdDG7SqjpON12NjqXoDNWE2I4HtzN8O1Cv?=
 =?us-ascii?Q?WH7xYbBXrWIPJtI261Eia6F0iH4v/rv7x6bAyVJafLYzjMclBD3K4CLB6r9u?=
 =?us-ascii?Q?PxJEn9TaS0kNrjFIb/9dut92u4qf/DFktLeApmPCH+vYvwmJOWAOJWzxrkKX?=
 =?us-ascii?Q?RoEalMbPRb1jOXnqgIaM405EYtef3K9yKO8PI9bv6DnHB7VlDHcjLit0ow/0?=
 =?us-ascii?Q?dzh/4IkgxAJ0JorWrBNSVTkDko+T8CwIgAe8z51yf1RV8GCXwM6OTHd5S77v?=
 =?us-ascii?Q?NQ0ID9y8SOGmUKwUd5+8EXz6rzBtnk5A1vcnUEtvrAqZod68V/5lBrqCqrtG?=
 =?us-ascii?Q?rk2NTthAoAxkpUR5jLHfpD44PRvZV9VRNJf6iKwZNGyk3qQG+Cf2/PPMH8wf?=
 =?us-ascii?Q?GdnpWV6tjmq2Pc0zKYDNRG5Ks8tkHG/63O63xkIainOh1dgt3E7tNsa7ZkJ/?=
 =?us-ascii?Q?6cWbtLwpEOj2kSAlQwtSDHUGwxoqJzKAN7N/F9cRGaRuq+UaDVee1I1meWwM?=
 =?us-ascii?Q?buoBWq1WqQkfAkiUll5K9AEwrThtYy89TeELJN/ciV3qtp0a+74UfioQJofG?=
 =?us-ascii?Q?dTqhZlwcJwcwiFUyyK0q6yMwur5sFjUkO7Iw6iedLln6ftfS+tQUFNn13SF7?=
 =?us-ascii?Q?9QqaOEPyUGSxM+O7+HH4ibiQpQC0UkMSigqgdVWJDKz4UvmNCKicOk0X+vOc?=
 =?us-ascii?Q?JDmUqOJi0GBjo4XeK3cHY2aV7MbGUA2uABOeF1YqxrIOQ8U7aa3IoLwAYeK/?=
 =?us-ascii?Q?LyXoWtuazBZ264TueA26F+ErCZp00cc4X4FKK7PASOZFTK92TSQJ+lK8YfJP?=
 =?us-ascii?Q?LWRLxgmzbbv5t2ZuLk+wpvFy+ppin3Nv8cdqlUjtk9Zrwb67Ly5ZTeOqArOA?=
 =?us-ascii?Q?GdEZZ01t792HfXv2WlrelKTa4+yKpZBXEJvnH4P4p5xUC7t4QBLU5P/HUi/a?=
 =?us-ascii?Q?MsMvpZhmSV9EIRSBG6a9nD8bQQqSOv6W+zdyC9O8PYxhy5eeK8rPOPx/O3jC?=
 =?us-ascii?Q?HUrgsF9aQcvpZjQ+REYFJmPOAStEdqXla9MDxEZo79m9/KN3cZaLzZLL55SG?=
 =?us-ascii?Q?13vaL8GotIoWQW35tCvG+DTqatOskg6IFj7KiyNwQ0MAaNyhBI4MeMmRhCux?=
 =?us-ascii?Q?wCBJza7/302XVF3fqrNDaEvRUmXGQDhfcJkOVVMKf6d4+7h1d28JCfUBQI8U?=
 =?us-ascii?Q?AYszFvo3R0URFButQ8SfvV/04LHTO48qAZU5ppkAppMoSn9shsW3sOTszmZT?=
 =?us-ascii?Q?/A26Dam9mpENhuGMODG6MUa2vQYt0Sl/+kogFhEf8W+8tl+UaathDQFdHtX/?=
 =?us-ascii?Q?GY4WhLUgO9Jop5LBtJc92ZEM81/oiCL2RuSg3W4Y6oUP7uSHmA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6499
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:257::18];domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	66fb0279-a641-4886-cb88-08dd790b374b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|14060799003|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HkkIfggukZucw+XoOm/D4+boTQu7IMvSUfiyCSDlBIWAKfhv1na9lKSz6mem?=
 =?us-ascii?Q?sPnNQcUbusopVAX/af9E9LSP6lW5sfhcq/PflLE59zTCeDRcDNGinQZSLOyZ?=
 =?us-ascii?Q?qzybBS6KqBxYyjmTP/juyOVyNvSW1ni9g2B9GsiAMdZ914VaoZtrmNraoeEU?=
 =?us-ascii?Q?KuGYCYpwSx/Bwe6whG02kjlNeRVNXh+GOeQfQWG0Caie9WZHFZvtC8aU5Bpc?=
 =?us-ascii?Q?1qyoMby4M1F2gAnv7rFQJkwvaMim3IyaGe5MXLFiEzRwvai+vRjwbouiajYQ?=
 =?us-ascii?Q?mF1nbIPq6zj8AsxaTM0jLOM5X/OvBlwwcakbZo8EgscC3OIfRn7OSX4D1EdM?=
 =?us-ascii?Q?7aVSt5hhif2rA0IDE3lMb9OyEw2tQtXkWrPRqHZTgZM2gFOvDTMw7rDnbj7c?=
 =?us-ascii?Q?t0PuSPR9kkFqruJZg1vvST0rJ+9ahVGXcF/ou5+HStq08uOOy8kNV6XGsD4v?=
 =?us-ascii?Q?DUQkwBnhoslKP6Ez00ZQHa64ctk4Gt1nRdOTi0XtWR9OQWF7c8uRRxqXf187?=
 =?us-ascii?Q?Jj16I8sdiaNYuhApIveORp+FJyPf/tZW0GyUzwKy6sh0bpHxeLb6F/eulPQD?=
 =?us-ascii?Q?+5sfPc62m7p8K0AHSqxe/7Q2onncPdBU/SPxZJKg9eZDEPqUilBPtkn+i76B?=
 =?us-ascii?Q?e0GHEJYjaFA7IjqRVoYktGW73FETRh6o6ABqeARembptHsxa63WOQJmSfc/Z?=
 =?us-ascii?Q?Ub9vm9kP138DhvzH5r2Nfvf059wsgTaziTOL+E97pptwY3dDwSvedgcENxMv?=
 =?us-ascii?Q?sete58VErygLjaxdrEhHpg6DNnFyUmmDex8EYAklRuUr7zNU0UaxYtFXLH7u?=
 =?us-ascii?Q?dXCy+0Hm54j6X4S+8EAIgU/TphIgC58xWTP2Ec15wOcZcOOqPWVJ1RwkC2X/?=
 =?us-ascii?Q?1JRs3lfUS7X4NjphkdMUXGfrk1wyElfJayQPj8fTnTpIpYqiH6Z/NUqnZwDA?=
 =?us-ascii?Q?gGBRY3Kh3DCNOuqcfIAxM6Bs8L38YI7iD2AQwyaFrayw+UpfA7SU3/fgci6s?=
 =?us-ascii?Q?/Fr+NQcn+V2mkPg43FqpXjyyhkzBqpzYFJ59CrsbhfHCVoou0jNxaP3qpeoC?=
 =?us-ascii?Q?7uos5FsiVHq6taC8nRQg3NaZd6/+uAk+d21/RZmf1c0m2n+WspQ2L5ykMsCb?=
 =?us-ascii?Q?wRmDFBiXSbB/ucAHpJaOczpFjYbsnuviRSYX7dmnD/ZR1Ys7aqLadW0IaXCC?=
 =?us-ascii?Q?7RRoXf95ehB6gWwmQbb+FqKbrYY+hlMKPMpH2m/7mNuTFRrYQO3J+HdOZhpQ?=
 =?us-ascii?Q?FzPtIAYPbY39vPrWDyh8Aaflyc+ha+Z7moTvED0Blzj0TqgSQ8wZ1z9fmhX3?=
 =?us-ascii?Q?QCqyyuaqUwzcfRgLoxoS4Za45+GrIrgG49oJ/Pb1y9Wnsg2OqivnI6ZaPU9G?=
 =?us-ascii?Q?BPN+jpBN1GlEaOerubY9jvSD8y1VozAD7UyKdYLwF6IBfH3ToUPcMc6vl6NU?=
 =?us-ascii?Q?LAnMXo6gkHni8s6Rkn5Edrhuqm0wjSJAa/BR2Z2PRjyjgU+GJlIhFmHy+53R?=
 =?us-ascii?Q?Wd6RA6kekfvzrqCNDlqLPrWqvV89HQQalIF7?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(14060799003)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 15:12:13.6254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbf6086-451b-45a0-3cad-08dd790b3d52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9391

With the introduction of 64-bit register accessors, the separate *_HI
definitions are no longer necessary. This change removes them and
renames the corresponding *_LO entries for cleaner and more consistent
register definitions.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c  | 12 ++--
 drivers/gpu/drm/panthor/panthor_gpu.h  | 10 +--
 drivers/gpu/drm/panthor/panthor_mmu.c  | 16 ++---
 drivers/gpu/drm/panthor/panthor_regs.h | 94 +++++++++-----------------
 4 files changed, 52 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index fd09f0928019..5fc45284c712 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -108,9 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
 
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
 
 	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
 	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
@@ -147,7 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
+		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
@@ -457,7 +457,7 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
 {
-	return gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
+	return gpu_read64_counter(ptdev, GPU_TIMESTAMP);
 }
 
 /**
@@ -468,5 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
 {
-	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
+	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7f6133a66127..89a0bdb2fbc5 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -30,9 +30,9 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
  */
 #define panthor_gpu_power_on(ptdev, type, mask, timeout_us) \
 	panthor_gpu_block_power_on(ptdev, #type, \
-				  type ## _PWRON_LO, \
-				  type ## _PWRTRANS_LO, \
-				  type ## _READY_LO, \
+				  type ## _PWRON, \
+				  type ## _PWRTRANS, \
+				  type ## _READY, \
 				  mask, timeout_us)
 
 /**
@@ -42,8 +42,8 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
  */
 #define panthor_gpu_power_off(ptdev, type, mask, timeout_us) \
 	panthor_gpu_block_power_off(ptdev, #type, \
-				   type ## _PWROFF_LO, \
-				   type ## _PWRTRANS_LO, \
+				   type ## _PWROFF, \
+				   type ## _PWRTRANS, \
 				   mask, timeout_us)
 
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index a0a79f19bdea..1db4a46ddf98 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -564,7 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
+	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -614,9 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
+	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -629,9 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
+	gpu_write64(ptdev, AS_TRANSTAB(as_nr), 0);
+	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -1669,7 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 6fd39a52f887..7e21d6a25dc4 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -65,20 +65,16 @@
 #define   GPU_STATUS_DBG_ENABLED			BIT(8)
 
 #define GPU_FAULT_STATUS				0x3C
-#define GPU_FAULT_ADDR_LO				0x40
-#define GPU_FAULT_ADDR_HI				0x44
+#define GPU_FAULT_ADDR					0x40
 
 #define GPU_PWR_KEY					0x50
 #define  GPU_PWR_KEY_UNLOCK				0x2968A819
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
-#define GPU_TIMESTAMP_OFFSET_LO				0x88
-#define GPU_TIMESTAMP_OFFSET_HI				0x8C
-#define GPU_CYCLE_COUNT_LO				0x90
-#define GPU_CYCLE_COUNT_HI				0x94
-#define GPU_TIMESTAMP_LO				0x98
-#define GPU_TIMESTAMP_HI				0x9C
+#define GPU_TIMESTAMP_OFFSET				0x88
+#define GPU_CYCLE_COUNT					0x90
+#define GPU_TIMESTAMP					0x98
 
 #define GPU_THREAD_MAX_THREADS				0xA0
 #define GPU_THREAD_MAX_WORKGROUP_SIZE			0xA4
@@ -87,47 +83,29 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
-#define GPU_SHADER_PRESENT_LO				0x100
-#define GPU_SHADER_PRESENT_HI				0x104
-#define GPU_TILER_PRESENT_LO				0x110
-#define GPU_TILER_PRESENT_HI				0x114
-#define GPU_L2_PRESENT_LO				0x120
-#define GPU_L2_PRESENT_HI				0x124
-
-#define SHADER_READY_LO					0x140
-#define SHADER_READY_HI					0x144
-#define TILER_READY_LO					0x150
-#define TILER_READY_HI					0x154
-#define L2_READY_LO					0x160
-#define L2_READY_HI					0x164
-
-#define SHADER_PWRON_LO					0x180
-#define SHADER_PWRON_HI					0x184
-#define TILER_PWRON_LO					0x190
-#define TILER_PWRON_HI					0x194
-#define L2_PWRON_LO					0x1A0
-#define L2_PWRON_HI					0x1A4
-
-#define SHADER_PWROFF_LO				0x1C0
-#define SHADER_PWROFF_HI				0x1C4
-#define TILER_PWROFF_LO					0x1D0
-#define TILER_PWROFF_HI					0x1D4
-#define L2_PWROFF_LO					0x1E0
-#define L2_PWROFF_HI					0x1E4
-
-#define SHADER_PWRTRANS_LO				0x200
-#define SHADER_PWRTRANS_HI				0x204
-#define TILER_PWRTRANS_LO				0x210
-#define TILER_PWRTRANS_HI				0x214
-#define L2_PWRTRANS_LO					0x220
-#define L2_PWRTRANS_HI					0x224
-
-#define SHADER_PWRACTIVE_LO				0x240
-#define SHADER_PWRACTIVE_HI				0x244
-#define TILER_PWRACTIVE_LO				0x250
-#define TILER_PWRACTIVE_HI				0x254
-#define L2_PWRACTIVE_LO					0x260
-#define L2_PWRACTIVE_HI					0x264
+#define GPU_SHADER_PRESENT				0x100
+#define GPU_TILER_PRESENT				0x110
+#define GPU_L2_PRESENT					0x120
+
+#define SHADER_READY					0x140
+#define TILER_READY					0x150
+#define L2_READY					0x160
+
+#define SHADER_PWRON					0x180
+#define TILER_PWRON					0x190
+#define L2_PWRON					0x1A0
+
+#define SHADER_PWROFF					0x1C0
+#define TILER_PWROFF					0x1D0
+#define L2_PWROFF					0x1E0
+
+#define SHADER_PWRTRANS					0x200
+#define TILER_PWRTRANS					0x210
+#define L2_PWRTRANS					0x220
+
+#define SHADER_PWRACTIVE				0x240
+#define TILER_PWRACTIVE					0x250
+#define L2_PWRACTIVE					0x260
 
 #define GPU_REVID					0x280
 
@@ -170,10 +148,8 @@
 #define MMU_AS_SHIFT					6
 #define MMU_AS(as)					(MMU_BASE + ((as) << MMU_AS_SHIFT))
 
-#define AS_TRANSTAB_LO(as)				(MMU_AS(as) + 0x0)
-#define AS_TRANSTAB_HI(as)				(MMU_AS(as) + 0x4)
-#define AS_MEMATTR_LO(as)				(MMU_AS(as) + 0x8)
-#define AS_MEMATTR_HI(as)				(MMU_AS(as) + 0xC)
+#define AS_TRANSTAB(as)					(MMU_AS(as) + 0x0)
+#define AS_MEMATTR(as)					(MMU_AS(as) + 0x8)
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL		(2 << 2)
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(w, r)	((3 << 2) | \
 							 ((w) ? BIT(0) : 0) | \
@@ -185,8 +161,7 @@
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_NC		(1 << 6)
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_WB		(2 << 6)
 #define   AS_MEMATTR_AARCH64_FAULT			(3 << 6)
-#define AS_LOCKADDR_LO(as)				(MMU_AS(as) + 0x10)
-#define AS_LOCKADDR_HI(as)				(MMU_AS(as) + 0x14)
+#define AS_LOCKADDR(as)					(MMU_AS(as) + 0x10)
 #define AS_COMMAND(as)					(MMU_AS(as) + 0x18)
 #define   AS_COMMAND_NOP				0
 #define   AS_COMMAND_UPDATE				1
@@ -201,12 +176,10 @@
 #define  AS_FAULTSTATUS_ACCESS_TYPE_EX			(0x1 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_READ		(0x2 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_WRITE		(0x3 << 8)
-#define AS_FAULTADDRESS_LO(as)				(MMU_AS(as) + 0x20)
-#define AS_FAULTADDRESS_HI(as)				(MMU_AS(as) + 0x24)
+#define AS_FAULTADDRESS(as)				(MMU_AS(as) + 0x20)
 #define AS_STATUS(as)					(MMU_AS(as) + 0x28)
 #define   AS_STATUS_AS_ACTIVE				BIT(0)
-#define AS_TRANSCFG_LO(as)				(MMU_AS(as) + 0x30)
-#define AS_TRANSCFG_HI(as)				(MMU_AS(as) + 0x34)
+#define AS_TRANSCFG(as)					(MMU_AS(as) + 0x30)
 #define   AS_TRANSCFG_ADRMODE_UNMAPPED			(1 << 0)
 #define   AS_TRANSCFG_ADRMODE_IDENTITY			(2 << 0)
 #define   AS_TRANSCFG_ADRMODE_AARCH64_4K		(6 << 0)
@@ -224,8 +197,7 @@
 #define   AS_TRANSCFG_DISABLE_AF_FAULT			BIT(34)
 #define   AS_TRANSCFG_WXN				BIT(35)
 #define   AS_TRANSCFG_XREADABLE				BIT(36)
-#define AS_FAULTEXTRA_LO(as)				(MMU_AS(as) + 0x38)
-#define AS_FAULTEXTRA_HI(as)				(MMU_AS(as) + 0x3C)
+#define AS_FAULTEXTRA(as)				(MMU_AS(as) + 0x38)
 
 #define CSF_GPU_LATEST_FLUSH_ID				0x10000
 
-- 
2.47.1


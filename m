Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479A97080E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664533; cv=fail; b=NvabVCQhaekaP5aAx6sBxzKbSqcCQaLce0x00qPZXzihiZgkfbLAmr3Pxarj7e2P6ixHLf2W/flGz9Y84PFb+6EaEA4MMXwX6kgLYWgo0hQpdpFVKYjrAb+QG0nycKr3NUGO2aoE58NboXW8LGCR07G6AAxznsBlanYbS3rkL14=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664533; c=relaxed/simple;
	bh=wPXxZZKgb94wz/MJ6qmUqNS6GgSrCt7AZBECYBg8HKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AqvZN3keAzrPkVSw6GExmuHnYX81qOFnpH8xh8AnB1lV6Fixbu1QhShD3Zz6EMbhvfcF6JGZp1XUA8cnTvNEHBKn4Tx0fo7khEkGYpdnGpTWdOop1FB8AIPIUX/6rRjK0lrPqlPWrxomCxl7e7Vc4DOxdl9/ukZf+60feVqKiFg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mXzKDWdc; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mXzKDWdc; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mXzKDWdc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mXzKDWdc"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bziPZm+mHrt6+ezAkNztm0T7rdSZlKhG7sZQ7+o2XSdThevCkQMR9mo5h4g/dFCudo3GEsYSEr/FSnytr2nwIQODMup2pvkybg7TPajcL3llHt6hEW39L/b+0xBhmN0mIKJoR/Zk0Mx2fEAKmocIdW9WbNddCcs5END6AOLu//esBbU0mFmrkxJ04XHP0z3Z8zHhpt+vX4a3DaKd8uBrbaeqyLYF1PVlnbBGh/QobRp1gC9III36bdqQ7dTnfJLW9wyfSLCHAT7/W9MTVjBIDAvSC7aewhi/39bcD4l3RMSfcc3Rrn8d6C4RkmOXSV+YMYOMT+TFwkyX+Z6os2ihzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nBIEXzsnId3yx5zvpvjoMJGfKhMYTZIRl+9ol8dabc=;
 b=gdV0k8ckuxPosQ3SqWhFrYxfZC25yu+kZaVkjurqRxnmBRUx+mlo0BGKB14XcATC7FwLJCwhjOAY6UecOeq+txTlVtpFYvWsLZw4VrqLGP9WY2w+pfW3SDUK5dN4ueJdV0VawX0xxwEbX+d2wniacrm1XeEmWri2wsVZnbJsC2+4Dqat4ZJf7vW2KhhM8dvr/bQQFCkF0DyRfSmDNrjOzaud13o4eOv5o2XgpzI5IEjDY5W4PTi6/pgwjyGqu3makeVfb7XBff3bMg75kA5lKsHRYJ008KNZBVOHkKgowxd4JC7s26MrYdKE46TTwKJi+bebeDhwUariHmGAxeYXiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nBIEXzsnId3yx5zvpvjoMJGfKhMYTZIRl+9ol8dabc=;
 b=mXzKDWdccRslyoI+aYghlxgkRYpV+Zy/M0BOGSoUbmG3Raor/S2NAwiFT0/PLEHD2l2xxwbRCKHqC0MZemTtFJX5yBkoW7kgDDKTlZJSErGodVASQKP1Gb8natLoOganKYHoUd9Cq38rVDAf3D6NlH0NXoqlcO6NT9jaANXNLXQ=
Received: from AS4P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::14)
 by AS8PR08MB9337.eurprd08.prod.outlook.com (2603:10a6:20b:5a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 17:55:26 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5da:cafe::79) by AS4P192CA0014.outlook.office365.com
 (2603:10a6:20b:5da::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 17:55:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.0
 via Frontend Transport; Wed, 11 Jun 2025 17:55:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArtcIhyQjJfkG8/IVIZhmz26dsb/un8yeMBuGdu2lXD4/OB8mBN3bmKfrYuwP6c5L2fNDxT3niB7q9D/UkcR+zMPDrIqQ97FXRhN7ynny8MwyuInh4W+WFQdcLFakTErV/k+mjh0ITgJ5ZRPgIrwc042hZrKSlDg/wGs981H40BLXYZCG37AcKJxzMcEFTvSEivsZJWHsuIh8S9sn81D4RZg9V7deXwLGorqMD5oExECzZpbWQk+xbCoHA5DZjnouWvFpD9oZBYK511wEaG1QsMknNHao8ndKij2sD+cQ82RLpdXfwLarrpUv95JRK6omCl0OCqYJIWaRfw8JkKlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nBIEXzsnId3yx5zvpvjoMJGfKhMYTZIRl+9ol8dabc=;
 b=XFHE8+FwoH7YnqyVIvlYYKvlT1ELTUTrdqF51exeOMCgTEKSsI6REhOzUhz8o4EZRdAf4yU84ahM6ZFoU+rpe+Z2D7jwMrOSk/F22OZWr1EJUGk8cm9/XWzvlFZdfugzpWPAs8r1j/Dj8n4R2Uw08L42v6ofQD9aFFRm0ZaCtxDgC1OjVO7jg0EczKvFNKfOhT/IcdClEjmSsyjcOkxblg4MJz7xBYsh8c3TcayjkmS2f+fGKXfRpvJgD0UpppfLTch66u5bdxLm4BsIBgr8LQ4qXlwFGpE3Eb+Pql3gClup78KHzBBzEAHzqcbi1Tlt44ulsCGAEPCmtiNfC4xpKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nBIEXzsnId3yx5zvpvjoMJGfKhMYTZIRl+9ol8dabc=;
 b=mXzKDWdccRslyoI+aYghlxgkRYpV+Zy/M0BOGSoUbmG3Raor/S2NAwiFT0/PLEHD2l2xxwbRCKHqC0MZemTtFJX5yBkoW7kgDDKTlZJSErGodVASQKP1Gb8natLoOganKYHoUd9Cq38rVDAf3D6NlH0NXoqlcO6NT9jaANXNLXQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB7676.eurprd08.prod.outlook.com
 (2603:10a6:10:37f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Wed, 11 Jun
 2025 17:54:53 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 17:54:53 +0000
Date: Wed, 11 Jun 2025 18:54:50 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64/Kconfig: add LSUI Kconfig
Message-ID: <aEnC6img102ZygDy@e129823.arm.com>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
 <20250611104916.10636-3-yeoreum.yun@arm.com>
 <86zfeecnog.wl-maz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zfeecnog.wl-maz@kernel.org>
X-ClientProxiedBy: LO4P123CA0146.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB9PR08MB7676:EE_|AM4PEPF00025F9B:EE_|AS8PR08MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 2192844d-ab32-4c93-88db-08dda9112554
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7SAVl28wbG3fdWAjLj5hWpQnCpI5oA9HYe+8ndTvh46GRCG79rT3rKDqtAF5?=
 =?us-ascii?Q?8ql6EYKAOUyGguJjIvWqBW39yih6ctYD61Na8Zwa3BHk/mkfx3wDYQvqwqjz?=
 =?us-ascii?Q?gWLJ2uy8Vgi/jtpaQ7SIvQ2961mI7vcW+F08rfZ9Hx/SMUFETMhnMsKYAu55?=
 =?us-ascii?Q?5xXRPgqRZC6S1l9iG018WNVNzRP4fyiugfwliOhS6lBSFHq0tU6Z6ZDxMjtK?=
 =?us-ascii?Q?N+ck7IpV66VOZILJfFolR+wfP9fVQnmytkTre5VflQ/r03g4Rro7c2DaN46O?=
 =?us-ascii?Q?EoFSCp18RAchFhimhPeNUr0X9rL/C9iV/R/fXxWpCwvPjV4XwKeFbl3k2J21?=
 =?us-ascii?Q?qdIX4Zd1P+Xams2RZd5sA4UKmask2avtgigH0YPoMG7ZnC2VtH9waA8M6Fct?=
 =?us-ascii?Q?flKzAqNkXootE7mI2XH+zAfK1NbP1CXSWenDzz3YKNUWiWsCjmEgD8zPbZ/J?=
 =?us-ascii?Q?/NBjFx2KZU2u9yRjGdMjdkFOBeeEm+qBru972XlUYPFhFXiDeZSndsFQrgfb?=
 =?us-ascii?Q?2bhjBne+/n6ZJKKeP6yAtXod0cdWdaLCgQwP6MniKznsbWkuGkKsyNEkTz0s?=
 =?us-ascii?Q?LTE8dFGGYEkD+bE1keVPMEfCejTnUS7dS1W4AhDNeVa5FpIU7FqGXmQGDKA0?=
 =?us-ascii?Q?fk+O/5ip3aacRqDvkP3EucCEvy3vfTflwcaalk3pTKijQtxreY3rRvCpSMll?=
 =?us-ascii?Q?G0V62htNtLJnZhXSfuH+e0wuSnhCoUwZhKZpoCwOQNdo8VVINW2NhN7sZ5Wn?=
 =?us-ascii?Q?BSo3exvlXC2x1zAs7E83D8VpiVFTvEcJ7s5+k0K8/Un1NZUZBmbdXwBaZYdU?=
 =?us-ascii?Q?UFbmqeledL8QiD35bBJDuZkC+zqbxPyMpxUftAbFTd6TMj86ZoQjgWkzUyrG?=
 =?us-ascii?Q?BPWr65o4R+Ee/fox9AekywP0Sc4QFJ7bgvxz2hYOPieVYYZjGvvWDVfoA+9I?=
 =?us-ascii?Q?MROkYff1yZgTL1V18lyGtzRItuRoQJrAvgyPDcrZRRmc2yRyYjfIPSpMe1PL?=
 =?us-ascii?Q?d7NVSFhB9AhDsN9kB0ncBYfToCwbCpeu6E+hlS2fI+mU3U9tIhpthn1N11rT?=
 =?us-ascii?Q?MNUEiqkZnEs1MAZFdLvxFFZZMsZnzqSF5id+FhiPbYbJA5jjAHPgaSmfPKBn?=
 =?us-ascii?Q?RpNG8lEtdXEXKZTLC/UkZ2P9EEa7n4iOOOMP6K5YBWRYr6zu8P5L3UDP23/I?=
 =?us-ascii?Q?GjJ0+/KzppuuwZiiBGEB7lq9tESyj99lfn8vhhQUVMc1Dqi3LGycbPuA3RRn?=
 =?us-ascii?Q?tWgmbNGkzrUQt4F7cgfFySlAXMpDwuNLlhVmxXYbphg6CoucTTu2KhfN78T/?=
 =?us-ascii?Q?D1q0t/SuIykPlV8J8NbSgJqQ6MItcVig52WCZhz/ce3bWkO0WPIh+UiJalkd?=
 =?us-ascii?Q?8kP0FMOab3+LUSOZ0PuHAjvnhQJ5aBo+HJLpzaVqbHEgOdI/Rw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	33485efc-3bdb-49a7-0e9d-08dda91111df
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DHwDy0AQMdonuFWjCOa6qMIvF9gPsR29zOVlIFUJN1yacB9TR8F+tTAai8ub?=
 =?us-ascii?Q?u2nsLOIQ2rUvrZbsaRD7j+UTFiCYkUAqFdMyZXA2weaNib0HmfjcjGCNbkW+?=
 =?us-ascii?Q?z75SXbUKHSUTs8LGmzuHKhhxBOXDPM8HNgai01SnPC3umj5szaaAJfZ7Laqm?=
 =?us-ascii?Q?XPAMbzrmzevlsmWMAheJzwYpCgGgfhuPOenB8gpbL4LpnTTDnpg+Q0MgVRaT?=
 =?us-ascii?Q?AcrSRHkWIMjZnchpqKcSmzg5yrFqbrwktUetP1DwFxSimW3AtYZ18+U7tYif?=
 =?us-ascii?Q?/p3AC3hrIXTfsq6AARs2NQdUwFeYfJ1VnKj57QBlIttOkVt7HeaMKl1wpzBa?=
 =?us-ascii?Q?6Mqxu0hJ8yKW6XgsQrQZd5esTQIQuohjkcdhh5XGPLYwgUZFZvAgdsInLzRd?=
 =?us-ascii?Q?FgUTMffShqK/y1rlb9ZcziWMOCQoF9cz/7uSTxovs3sTzsEKZNvT4WWMw3vg?=
 =?us-ascii?Q?qyhZcfRAI5usl+W8kc9d8Ye+AwYEAYbgwgc8MOqe/Q92feENNk1jEEss5ejH?=
 =?us-ascii?Q?hcPvt4OJ8khd+r9+jWM2yWDYStYcXZTD0y0WRPzbSzNUsRupyJyWeWV0psCX?=
 =?us-ascii?Q?66TMnY2MxJ5/zsAEPyt8L6m0vOIy1N0Dv2TUl1B0ciBm6pRE3oaDXoEYEUbt?=
 =?us-ascii?Q?jEQAE5hBslnw+LUAJUMEtla+mVpQuWaHafK9cpcUOspozIvHGlPDZx2iaE1C?=
 =?us-ascii?Q?uCE0wi9c8zcONkR4HjTjLFOXEEbcSHcjCMM+6BVnO0ALysmOaGR2DHqH3iuk?=
 =?us-ascii?Q?lsqMubPL0tfPt7ME5ZbyA4NA2rW47qKbUJsl+0SRsPFb9vAhd5tLA+gSSn8a?=
 =?us-ascii?Q?T3rGHtkC30Crv6W76YRUMqxVrXR0iAK5+kbM9ds6RjHLZj0nXKtmoG+x+yAX?=
 =?us-ascii?Q?evmBUEaQneQnUYcKMX8CySnM2ukpmN/+rM/eb+6mFH53/gkVitADwh/dMWKd?=
 =?us-ascii?Q?KsxzDMbnJyL+D05rUjorCHgI6STu0MOn57Em3YfE+6HtJAz3AaPFefhUdphc?=
 =?us-ascii?Q?WN6+b5uYv27D+7kLuQRqzjPAA2Q9/7c7YFtTTEQaUREDOTIQEI6Zqr9zQkRA?=
 =?us-ascii?Q?I+ek6eWM4swI7BhnmBgt9TRBQE9lSlBlbT9hGLSlRZ/FBwSNuJyXhNBpl68a?=
 =?us-ascii?Q?OXQtvstqakxaxi6LLHBWta7XdkJxWjC2gu1eXMMiPlZTb/UbC56W3pGpR3G+?=
 =?us-ascii?Q?nMpIgzs6ea/DoEOz6pueTL1cn+Dxe0LOJoF+gmv3oDPubzmc1qCvL5GfWZHv?=
 =?us-ascii?Q?tnAICD+VZ+RA6XeXJNCZS5zyJAMRKbNCLI2HUE9dh3soNERS1tL3kay1HxxV?=
 =?us-ascii?Q?NVgWXKu/keJxPZ/nVSKiuuzllsqN8y8x2ciC+2lK96TKeapr+NU32SlRKRar?=
 =?us-ascii?Q?rhk3Y66pLG7Ci6vVWsn+tN7KsSSBlS3t+PNcn1pRGq2GiyqaL2OuAkwhOmxx?=
 =?us-ascii?Q?XNvbug7tYZ/111PUbBU3ZZST/Ea0DPSxrqH7noI/QXPtm571tcHd8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:55:26.1467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2192844d-ab32-4c93-88db-08dda9112554
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9337

Hi Marc,

> On Wed, 11 Jun 2025 11:49:12 +0100,
> Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> > previleged level to access to access user memory without clearing
> > PSTATE.PAN bit.
> > It's enough to add CONFIG_AS_HAS_LSUI only because the code for LUSI uses
> > indiviual `.arch_extension` entries.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  arch/arm64/Kconfig | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 55fc331af337..20f360eef2ac 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2237,6 +2237,13 @@ config ARM64_GCS
> >
> >  endmenu # "v9.4 architectural features"
> >
> > +menu "v9.6 architectural features"
> > +
> > +config AS_HAS_LSUI
> > +	def_bool $(as-instr,.arch_extension lsui)
> > +
> > +endmenu # "v9.6 architectural features"
> > +
> >  config ARM64_SVE
> >  	bool "ARM Scalable Vector Extension support"
> >  	default y
> > @@ -2498,4 +2505,3 @@ endmenu # "CPU Power Management"
> >  source "drivers/acpi/Kconfig"
> >
> >  source "arch/arm64/kvm/Kconfig"
> > -
>
> Can you please document what toolchain versions have support for this?
>
> Thanks,

Okay. But here with comment or Is any other suggested place for this?

Thanks.

--
Sincerely,
Yeoreum Yun

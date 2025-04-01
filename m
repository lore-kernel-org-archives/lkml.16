Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC01120CCCC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.67
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522543; cv=fail; b=N0owf6wZotho+5Z4VifLPvTDb5XW+bEYw0DlBxLVo6J51Uc7mMBgAYjh86yqyxwSPKblerGjP/G/zPfYRF26XNhuTW0NtS5aOUdbsED7O6/MfVkdWmznKnEL6TgPalY9LTeXZ0Ajt42S8P94eMrQRfGcVivfQgPHlOrmHlrpF94=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522543; c=relaxed/simple;
	bh=WkhCTufnnIpGsVl6KMi9zZUee8znNwJiqdYqaDd4N/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M7foRYBVt1pzTDZt2vuIgnAarRhXW4AtGQIkpjtqUqOD/Yem1BAbaoks6WPHUE5dXz79OmpBOJKlm213Zo0cswhZEoA2mFT5hQ+argAGjgZPeMfJNqP5nqZ80ckeLb9YMOQB9QMdhht8h10sTcg8XLBRrbgMHvGWzzpe99Kq1yo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LEFBTRoK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LEFBTRoK; arc=fail smtp.client-ip=40.107.21.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LEFBTRoK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LEFBTRoK"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZR/3VHgvQkhVXwkpaWUBamc3f7IMbF19vzDckVEVCcgK4BH2duEvj7fwmct8eXxEVMq1VBJHuSLthUoZiOV0bN0JpkbiwyJFfjVC+qO/vPUSFzchKTWszkD1AxI3Hqxx/XyJUCoVmALmBKdjoZ6pYmqPV9bab3bDwMiL5hZKSnbxybzCPB6y/QupqM0ucrU+nrzsARYcBdXvgA1sIDVokceopV9jxyEGAJsHk0lQNjINS7ACy0/wN5aU6SS1Z4TLWYuPnJ1Au4ZDm2vn8/kmRO/SRX8nLQ5vnIHYgsAqhp4giDjBkOFq6FW3Pl5CHr9va1QlA3IMaEBhP6p6m41+ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsrSlE0RqRhNatSH9PeOhP26l7gL422INcqlFJXpfVQ=;
 b=XSClfnWO/rByDtGbEbL3mBRzfV98FcMLfmQQNFoZb5yfn7U6OxpOo3dMYzcHcFJMDzJxpXBgyPNOWXUskn8TR8ftfkxxKJtvUHN+MRB4IkgciARScL23BsYuQdbnxey/rV6SrMxNkZ71GL2Do8jr8pVNlsuDTrIZ3CunxtaauDCCl+Wu1LnEOGhUkYvh/q9R9mOONg9BbDGVQrWZblqX6pr/dJlthuznhjLnuIslxgwHbZ/U/iP6buEjKrJtHmfpS8fu7nxUr7cF6Z+cHWy4aXakx6FELRxfU2JLurb73E9ZWFRQOFszb/jxb3HwgD3l+sPE5wsB4PPohxyGufwyrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsrSlE0RqRhNatSH9PeOhP26l7gL422INcqlFJXpfVQ=;
 b=LEFBTRoKe4aIML4F9vw8qQ7+DiS0eJjCvj7YRZ5att2d24TKSk016jOOXoVyOTbUfRzDaaOiUsA0YVrOkoVvN37a+WYyQeorB9A/Quyr6C4EUeryV/qx6mq3s+F7it4MBPD+JjtxlHX9k3Pm8YX4gwcpo/0FbzC5ScCE7hVF0Eo=
Received: from DBBPR09CA0023.eurprd09.prod.outlook.com (2603:10a6:10:c0::35)
 by DB9PR08MB7584.eurprd08.prod.outlook.com (2603:10a6:10:308::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 15:48:54 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:c0:cafe::48) by DBBPR09CA0023.outlook.office365.com
 (2603:10a6:10:c0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:48:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:48:54 +0000
Received: ("Tessian outbound 850a7d29d40b:v604"); Tue, 01 Apr 2025 15:48:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83949acd2e2dcaaa
X-TessianGatewayMetadata: rfQJ/Gaud4ugcxZyXp+QDj0MytGyn36N+5BjuUKERINkjFOQ8zzPzcQ4fBM2zs8AX/ajOfPJLpPGd81oOENp1svXjsTtHWqLl0xtG2sFdvdlRcN70ldKF8f3cjLKvoPsa5LIx2DpKiJpkzMVwX6UkA+bhm99tf3lOOF15e0FvkhHJgOjXezZEzNsPVnBjN+jV8XZ7GpMeF680dMPYQJ4vA==
X-CR-MTA-TID: 64aa7808
Received: from Ld0ef08db9166.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5A01BB6B-016A-4F12-95BB-49E0B76FC9FA.1;
	Tue, 01 Apr 2025 15:48:43 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld0ef08db9166.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 01 Apr 2025 15:48:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lza470LosDgCpCWP1rvHvaEL1Bm4ZogG2ru9yfsZ1VRStntac+l7Sy3nLptPwazVOGwolDsNDvQyvMww7TpEWcNp+ypAVer2Fd9IBfuTV3ITonwruKQXy/Lj0/oDEzU4+mBmH5owrpU3ChtAtfDwqjSarxER+oQQRKCe40jhEjCS8miCpou4jOWPnO8pIP79rbwxyfy0H2ffG342tEKC1VCTjnoETyhcwiFcSIpw8K0BpoSZ+vKS95WMZcxHuqAgVxuIvOuNKbeH9M0yAhIvSo2RbCL/S2ZBCk/yQyYKbZKnw3IYy655ZywUUY1wB56w1eYhN1CxLS7GgO5xL+VnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsrSlE0RqRhNatSH9PeOhP26l7gL422INcqlFJXpfVQ=;
 b=H/VXOnQ2YAVF/dEYglPY7ZdGFNd33SVxlO1FVHV1j6eiKDZDdwuR9QA/KS0t5XmXL0oyGtQ3VNBbt3FD71UtzJEd5bXfNER2MySmQgPkj7yYGrkB+c36RVGJOT+A48kZsdFoAd91p1HXiG+LENfsxztd/27fqXxZef+BsgpNKsV6Oa4Xh+xqwe3YraPgUBDPxqgDqYzUSIRo98WSYYXcqBGFLwy9dUv0kJiaDI8Q5t3rLLy5DPOin4HV3wsM5SOoj8x+XVr2uzsZrs9t6dAqS/9rHWhrVwfvfS0pqdm5x/iUJT89xcoqZ6qPKOAPQiaF8jH6gSdsY/+VYQY1cUwJew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsrSlE0RqRhNatSH9PeOhP26l7gL422INcqlFJXpfVQ=;
 b=LEFBTRoKe4aIML4F9vw8qQ7+DiS0eJjCvj7YRZ5att2d24TKSk016jOOXoVyOTbUfRzDaaOiUsA0YVrOkoVvN37a+WYyQeorB9A/Quyr6C4EUeryV/qx6mq3s+F7it4MBPD+JjtxlHX9k3Pm8YX4gwcpo/0FbzC5ScCE7hVF0Eo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:41 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:41 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v3 3/7] drm/panthor: Add panthor perf initialization and termination
Date: Tue,  1 Apr 2025 16:48:18 +0100
Message-Id: <c21cbe4a9f0e6143454b09e683d68e8ba9e0f0af.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1743517880.git.lukas.zapolskas@arm.com>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::28) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|DB3PEPF0000885A:EE_|DB9PR08MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 351f56e3-20b8-4a1f-80e2-08dd7134b531
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?x07Ldoz5JTaEzlT1VGNG27ynOJQMfMCwG1v6+9oaWjGBWinotKq1wgujzzjH?=
 =?us-ascii?Q?KgDYrinGamGkBsnNTqCSjk3+9w1riOz/Yfa24iwCXEaCIc0+I/+ak2EYBUGA?=
 =?us-ascii?Q?oWOr4Wu4PHGRLG23bE7ABB1wKY/VkAr5vXhGJomnUZxPyPZGtIHLzhrdZ4UC?=
 =?us-ascii?Q?IQsPI/gfTguOO64qAkwpR/ssD6Z+iFiGqP5sJkBd3u2wi3vn+xhWLZCjixqt?=
 =?us-ascii?Q?Xl2jFMAj4aRqiYEYe8B3Xas0HFs7AOppuh8PrwFgytmRNgs7s6ydbv1F9aDj?=
 =?us-ascii?Q?yZ4b9WyYnNQxolz5gUXFi6Ru7XHSIiKs+xig9doouYXg6FtmQRqMcB1R8U2b?=
 =?us-ascii?Q?NgkihFtgjqnEJT9ndikZ29I6G6xIfzZ3WiM2wq+oUs6xHDpGeWraHPOpnoTR?=
 =?us-ascii?Q?IdGy9XOdoH8Dt0TTJUt+zozjijUpfAzFytIHG7L2UTvUec25PNbnldvlpSLQ?=
 =?us-ascii?Q?vH/d4J3fLqlpo5B8zqU60VaEUDNct5AsbX/Z7bbmtiynTBIhPV+J/PQ+E7dl?=
 =?us-ascii?Q?gLf7p36OKXW8AjVfcBuPkQuIUuhAKT5FrE7ztFg4Uly1mlNRA7zjneZucKEG?=
 =?us-ascii?Q?nTlURytp4RVbX4rdM69+bVcgOAyi5rVQ/HihH6w9Ya+5ZuOwFTLiEBidd//H?=
 =?us-ascii?Q?MDERUv09ihkRTb0CyRBcLCgwfws3DvibgmolX7FMCXPAMChuz9mTSaLGIDW2?=
 =?us-ascii?Q?dMQVjqzR1dOixJWEpCfjwRxr/d7WgQpwJaIo68jiJz9mo3D87eoXnQ5qJJhx?=
 =?us-ascii?Q?+37O/IsP27UwyTONzUAuDbHhULh0LNnAHCa3JduRuuEKeJwK/FilqyqMjAxC?=
 =?us-ascii?Q?Gm/DMrKAV+jpyD0WgZef7wfdgiK0eV/03dw1YKhTLvRCTmhOSWy4dPxJWN8s?=
 =?us-ascii?Q?AmwTz/qN7jrXsjjZt1pj6iCLgvRKv8vghKpcAYA/k+T3DE/VYKjg7tmHSeVY?=
 =?us-ascii?Q?eFQEG7BEQjswv6WZKRRo6natL0wTK97mutRQTbnAioVM5Kplh+rfe9I05gF5?=
 =?us-ascii?Q?iepAV8uLm2vNOaXUqAR8RVSAPG9CFdD3fCnIYrEBvrQaRgelSRKVkV9L01zD?=
 =?us-ascii?Q?WuVgDefHDSY71mMFWDBNYdSedyrc0A3SxqIbYrnYhud7bf61GTuTXEGLM6bu?=
 =?us-ascii?Q?mcz8pqnA+VJkeo9DlJTveg6VZfuT22vIIT15bk2eOutSK+Jo5uBJh+u+LDXb?=
 =?us-ascii?Q?bEDPjWZigBd1TE5AFOk5fePz1s/Irk4vSc/OOptA6SZVwppMySg9+HHFFmx5?=
 =?us-ascii?Q?otY/jhI6ptcsQ0YTWSJnvItKs5lD+PCrJxKQ6+eELxGf84UuPliS+sP5dcbG?=
 =?us-ascii?Q?XWhACpXwmaZHEjyb5LGt2OtFYrWQhiqBhhQLpCEWLIdZLX1bD+e0hw37++aV?=
 =?us-ascii?Q?9h8jNLCMHqI2vxIHXwGMKUrhMubIEPhWOd0vRotW3R4luoxoi307ypSTASrl?=
 =?us-ascii?Q?3I6oNpFdfMo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3315.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:208:5c::16];domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e8c7f37-02f1-421c-9781-08dd7134ad49
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|14060799003|36860700013|35042699022|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oNrltFpRX/xyxIHx5y7piUXLDr4GbaENSQ2VwPqS43N34siMf5PDK8KdfB/J?=
 =?us-ascii?Q?2YNgbi5Tiffjd08xpAP1YT5iXKyDn7PAUvKfp4Id3V6tfxthbWNXQxO2UlSz?=
 =?us-ascii?Q?HKkDObK32oOTP5yn1eQU95BsPGekPLjol2tIcqzJ0mu/RKZLkQOZ5PFS0IVa?=
 =?us-ascii?Q?FnwYzPVtJCtAkJ19uwnIWKP1iMM0EtzcdpkXbjztrnyXA8jsJWPIrN4XR2Xl?=
 =?us-ascii?Q?NxDHmpz1j09SXuk6qXz1rci795VlHk/LJT5wseDq42JJAnQz8Jl+o3cj4FEg?=
 =?us-ascii?Q?GTsGAR2r06tu3FqHFfPsut4s45mg0TsoGnmE7SfJPljDiyW3xNMT1OuiAFtj?=
 =?us-ascii?Q?BO0ZnLs/GIEMFxfgOsjpFJwKgcYNQ/HkjQHceuSY83p/VvosiGHQLH4zFXQ5?=
 =?us-ascii?Q?Sw9jYJGTRBQQQekX7uNiqU612N+d+KvyZpn/sr8R+UiFhoTEvgCcBvBdTV21?=
 =?us-ascii?Q?vKqfxtqzqMH3LQ2uKuRUB7FWG+ix8wonm9LaFY3D2q7tuCKav/PER6utCPlo?=
 =?us-ascii?Q?y9UVPr1LpsNB2TxWf0fWm4tF+8dYwHHU2W55dVvPssVqalTwCXgf+qs5aLjO?=
 =?us-ascii?Q?NBfBq3QKu4VSg8vK3wRkU5Yl9Z7WuiBDYmCWdcr8TrNzc1zPVUsR3EGzLZtQ?=
 =?us-ascii?Q?FWqJ9OfyKSV6xSXll8nw5Gdm1abvG519+Pjj49xxis+CKqLMgAcpGR4CTEuc?=
 =?us-ascii?Q?VwMkXUIjCCnBHvffPcUAP3r5m6FoEmUwEfUXLHli2X61lz5ow5bfSJrpVNrW?=
 =?us-ascii?Q?JNAojzXShgE70tnGrjRgJE7FhGI9gDifUrV8C7B3/onUyEhzRzkzzUFcXrl7?=
 =?us-ascii?Q?+wGvnwzecQduTCO+O6BaYXTws843E9Dn69mH1Y/9LenhowADyiO5EyJ+8dZz?=
 =?us-ascii?Q?8F8FhVZfo2O7VnlPTTbyHdjlbm91LNRQxvDQncu69Xs8exBFoYaI006g/BJv?=
 =?us-ascii?Q?Rs9O/UDLukVeQTvhl9/9FKlyZArXvZjk+hzDrYxHmsyqVSMt2i8mHKw/yi9W?=
 =?us-ascii?Q?mUMvWJO6m8EJxWtuK3xTMsIckh5WuFx6C3N+e5a8Z/mWogN47an6VUbrshug?=
 =?us-ascii?Q?PBVkliynGPI5KeGaJvpUXzixIYfQ7FFTMb7I7z1LMe68m5JnGyx+LB81h+lh?=
 =?us-ascii?Q?BrOfqLln1EzULB5vAknaTY1aG3bous+O7CR3Zl4sQWGdNGbRH88awIG+rInE?=
 =?us-ascii?Q?7wejk/nD/2cHGW1JpaeBEV1aAzaIy0KcDz/kG21GTYYsAAVtQm1vWw1kKXwB?=
 =?us-ascii?Q?bOGp40UD4dngYTL7LumgbkTUE2KBoQpuiUjJzl4XagkV2dQzbyZiY/JVRfdU?=
 =?us-ascii?Q?UEyO7EW8Y9qsvu09kbOOM8QVY5EXE4z6g7Ix2MLfHXVdTrBCp/lVsDn7s62S?=
 =?us-ascii?Q?cDx9UHB3KL56HLk3jG7AIt1C3eyT8CsRJMxuURsjOY8tPFNtFKnjvqAB+I1Y?=
 =?us-ascii?Q?V11ztfJRY2ilZaCYCs041FliWM1BHlc6EisqwXI9b0K2HYABHajI8WJbc+gS?=
 =?us-ascii?Q?28+1VTP/BVdhkPA1WRwm10fQT5TtrCv3f9aw3jKtj7XQ6R2uRgOXhiVHMw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(36860700013)(35042699022)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:48:54.8636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 351f56e3-20b8-4a1f-80e2-08dd7134b531
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7584

Added the panthor_perf system initialization and unplug code to allow
for the handling of userspace sessions to be added in follow-up
patches.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  2 +
 drivers/gpu/drm/panthor/panthor_device.h |  5 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 62 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.h   |  1 +
 4 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 76b4cf3dc391..7ac985d44655 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -98,6 +98,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	/* Now, try to cleanly shutdown the GPU before the device resources
 	 * get reclaimed.
 	 */
+	panthor_perf_unplug(ptdev);
 	panthor_sched_unplug(ptdev);
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
@@ -277,6 +278,7 @@ int panthor_device_init(struct panthor_device *ptdev)
 
 err_disable_autosuspend:
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
+	panthor_perf_unplug(ptdev);
 	panthor_sched_unplug(ptdev);
 
 err_unplug_fw:
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 657ccc39568c..818c4d96d448 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -27,7 +27,7 @@ struct panthor_heap_pool;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
-struct panthor_perfcnt;
+struct panthor_perf;
 struct panthor_vm;
 struct panthor_vm_pool;
 
@@ -138,6 +138,9 @@ struct panthor_device {
 	/** @devfreq: Device frequency scaling management data. */
 	struct panthor_devfreq *devfreq;
 
+	/** @perf: Performance counter management data. */
+	struct panthor_perf *perf;
+
 	/** @unplug: Device unplug related fields. */
 	struct {
 		/** @lock: Lock used to serialize unplug operations. */
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index b0a6f3fca8a9..7c59c8642b7c 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -9,6 +9,19 @@
 #include "panthor_fw.h"
 #include "panthor_perf.h"
 
+struct panthor_perf {
+	/** @next_session: The ID of the next session. */
+	u32 next_session;
+
+	/** @session_range: The number of sessions supported at a time. */
+	struct xa_limit session_range;
+
+	/**
+	 * @sessions: Global map of sessions, accessed by their ID.
+	 */
+	struct xarray sessions;
+};
+
 /**
  * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
  * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
@@ -42,14 +55,61 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
  *
+ * The performance counters require the FW interface to be available to setup the
+ * sampling ringbuffers, so this must be called only after FW is initialized.
+ *
  * Return: 0 on success, negative error code on failure.
  */
 int panthor_perf_init(struct panthor_device *ptdev)
 {
+	struct panthor_perf *perf __free(kfree) = NULL;
+	int ret = 0;
+
 	if (!ptdev)
 		return -EINVAL;
 
 	panthor_perf_info_init(ptdev);
 
-	return 0;
+	perf = kzalloc(sizeof(*perf), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(perf))
+		return -ENOMEM;
+
+	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
+
+	perf->session_range = (struct xa_limit) {
+		.min = 0,
+		.max = 1,
+	};
+
+	drm_info(&ptdev->base, "Performance counter subsystem initialized");
+
+	ptdev->perf = no_free_ptr(perf);
+
+	return ret;
+}
+
+/**
+ * panthor_perf_unplug - Terminate the performance counter subsystem.
+ * @ptdev: Panthor device.
+ *
+ * This function will terminate the performance counter control structures and any remaining
+ * sessions, after waiting for any pending interrupts.
+ */
+void panthor_perf_unplug(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return;
+
+	if (!xa_empty(&perf->sessions)) {
+		drm_err(&ptdev->base,
+			"Performance counter sessions active when unplugging the driver!");
+	}
+
+	xa_destroy(&perf->sessions);
+
+	kfree(ptdev->perf);
+
+	ptdev->perf = NULL;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index 3c32c24c164c..e4805727b9e7 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -10,6 +10,7 @@
 struct panthor_device;
 
 int panthor_perf_init(struct panthor_device *ptdev);
+void panthor_perf_unplug(struct panthor_device *ptdev);
 
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty


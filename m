Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012043.outbound.protection.outlook.com [52.101.71.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774A22F74E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.43
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748949302; cv=fail; b=eP1atmmPC+vqumU9ZGbE9vCmucOXZf23yybPMGNB622QdwUI7sGSw75I1O3m72CSWN7FAXs2ZSFU/+gzI9+ekxmqYqjPwo1pEQlOJ5xl3YJEclKqH353QRkKYwTQHjhLYpFnX9EJjlvmexkW9O2xKBf8wGLSgdgTwqUtGhAEFFI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748949302; c=relaxed/simple;
	bh=QXoT1uwfLp09WylaqpN7lwYIm1SIwyKbY3Klu7NCkDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RFVahJzecbjtW5A2paitOA859ugdM4PurijjKuavv2Uzm1T9qTumaIv2L23JX4bzJ93tDru+a1rKfadE7NCaoS8NC4jXma9cSvGpmGWZQYIBYxMV9HRN2cxaOX7c889U4hai1kBGzfTzDskGVmV9nyoK86ldvEYuzLnptzUkL74=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q0mqgFSK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q0mqgFSK; arc=fail smtp.client-ip=52.101.71.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q0mqgFSK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q0mqgFSK"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pGGojR+TCAoIAmeWy0yEztJ7AHlIBVrWF9a+skuEq1y+yhiT/bTJagMd7zQDRdb6Rle7PhiqBKa3sQ+nk8MNAuPeDK0vtgfaKnr7vbTNRg2V6tPdHxWmTDg3UElm1KwGv7Q8qZ+Rvsrv0m8Xo8Xy1ZGzhnhVg0fonHe0FpzpA7HVSZeJLQ96OrktHNvAvGwSGP6aj3DLMDJeXKLok4OH0J1xjf6axDLJ4wLgDmlwGfVgswVMfdIgGQT5wxaI4NLWctBoPv//+5oS6k74kGUocMI3+1b5+HNk6TGu6zfHIaLg9HrGk1ZXS5x64d1GlD58R/DlxlqYGMT6X/pNKut1pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a55Q5cFSYuC7vnuecHph0h8adJygxXm9SFKG5YUMKto=;
 b=ioAFMMkevagEMxKwp8VRTYzsKL6jra1LAfYJjKaDmjG9l55oFWvVsc0ivgJFdIND2A8ruVx/8/x3qNAL7ZBq/tgzkkqFsmopDQp/AAy8DxehDQavimQwnyhEEehpBYi9U9Ps/FczvTlfpEPfeRAkEYPaSwvRViU0j5YkZ4q8zqWwGAAKFJhwt7ookNsj06mtvtx3kg9XwmvqlLEvF+yQQiA9Z9BsRNLKMbybM9coO1VenGQD8BDlMOxapdQxQxU2b1RcawSM8RyTlCfCviolNFcAR8OrGpxKXnTiU8bVabPf0ppeXpiCs/6jYAh1jDstCn6G/DoT1olXc8ZyDJ6vew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a55Q5cFSYuC7vnuecHph0h8adJygxXm9SFKG5YUMKto=;
 b=q0mqgFSKyO4bKm9tFuZaYazz9F4ntb6LWzJlyzVZcBGCkLx8M7XLxgRSQ65LUbs/NOTjQCrm9VmCNIczwXOJbwLjrrNPo6S2/nVeWcJRGMSr8rvOOupnMsrbFner67TnARAAB7CrB2xJq5dZpzC8BE1nUFVHr3/R0tnvoE11YjQ=
Received: from DUZPR01CA0212.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::18) by PAWPR08MB11142.eurprd08.prod.outlook.com
 (2603:10a6:102:46c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 11:14:55 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::70) by DUZPR01CA0212.outlook.office365.com
 (2603:10a6:10:4b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Tue,
 3 Jun 2025 11:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Tue, 3 Jun 2025 11:14:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzw9u1lmLteeX2uPmBvn8uas2n0cKwoudHrm8ca4tLFsydrrHz4IGhon5BcYFuhWSxMpakf0KrNjDZt54scuDggKoYrtEm+DxpSIZ0s0/E6okPtO2kvhNgaN898llfxh9kUxGi3x/z1GeoZxge/wedUwAsN4Q1sddcgBFoz44eANb3oBIA3RBtXp2LG9NqXa2vnujgJlF9R8ZW1iW51GW+ueAYq1tk/XiXpVhmrPPYaSyF7JWxy2fgyXjZ38RQAX3DYTFiGWfolOefFBozyfWz/B6ByLzjCMBys2Io6CjDUWFKJIYFzEGjlOUA5NKBagktv6ZQrLJWoO2WBCwDji2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a55Q5cFSYuC7vnuecHph0h8adJygxXm9SFKG5YUMKto=;
 b=liaHaolrNrtfbdZvvTy2oIArNooF1w311lM4xqNXaxY3mXKt41R/J0H2b83fy9CSdls8xyxkKJR4BbN5Mavl/HEMzr6iKVCOkOK4sQisZvW44q6dtyXau0EdlNtj5sRMb1qdG9DYwDQl1biyBVsobYZAymhdihNgsZ1I9zeSUc9Ykjp+q0MdNN7Mpsv7sy/uJgDYkDHB51gexXcV3Lj6LTaoNje+MdAafw8q+olIFpF4/wZZRZ9oucyMNdt7NOl/jjAY6ghq8QqBbJW2mKqbTfUUneOrsWllj7q2uR1n/GnBhVqQld9OGS/pC4lbkimXNYYmVtpnR8pwOlv2YNr2dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a55Q5cFSYuC7vnuecHph0h8adJygxXm9SFKG5YUMKto=;
 b=q0mqgFSKyO4bKm9tFuZaYazz9F4ntb6LWzJlyzVZcBGCkLx8M7XLxgRSQ65LUbs/NOTjQCrm9VmCNIczwXOJbwLjrrNPo6S2/nVeWcJRGMSr8rvOOupnMsrbFner67TnARAAB7CrB2xJq5dZpzC8BE1nUFVHr3/R0tnvoE11YjQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB6433.eurprd08.prod.outlook.com
 (2603:10a6:20b:36b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 3 Jun
 2025 11:14:21 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 11:14:21 +0000
Date: Tue, 3 Jun 2025 12:14:18 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
	geert@linux-m68k.org, broonie@kernel.org, mcgrof@kernel.org,
	joey.gouly@arm.com, kristina.martsenko@arm.com, rppt@kernel.org,
	pcc@google.com, bigeasy@linutronix.de, ptosi@google.com,
	james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ada.coupriediaz@arm.com
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <aD7ZCnNUqxb9XWNh@e129823.arm.com>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
 <20250602124738.GD1227@willie-the-truck>
 <aD27GxSWsFekORcy@e129823.arm.com>
 <aD2_Jp7CQgnp15Kx@J2N7QTR9R3>
 <aD3kfTx8sF8/Yar/@e129823.arm.com>
 <aD7EA2Bmp-mrWZaN@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD7EA2Bmp-mrWZaN@J2N7QTR9R3.cambridge.arm.com>
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AM8PR08MB6433:EE_|DU2PEPF00028D06:EE_|PAWPR08MB11142:EE_
X-MS-Office365-Filtering-Correlation-Id: 97cd155c-e165-4791-a05d-08dda28fddd2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?nZnpKymAAN3NvZfe8Sg4hXrTLPCHMRWXKI9hwLXLSnNTMOr9As7qYPbh5oGJ?=
 =?us-ascii?Q?lHimOpDRGLfBcyD3YEXItUHNAeSgOFa0dOueB9ltFwYKlHxVvRFZADWvEuDW?=
 =?us-ascii?Q?DD/orj/a0/Ju9zvNPQc3pQ/ndB6QYl/onB3M9KLO31xbQvZ4eXaoxMIbZts8?=
 =?us-ascii?Q?XZOvYnM41aLzkWZjRuAxTgb2pUvsHcHqzXUY7IY9DIYmylJB6Saix6WmzZ3Y?=
 =?us-ascii?Q?iUl3A9befmYDNW+39112Q3UB3Q2M6F5lwBukSeEaTxmRYKyj0X0hFyjPQxrx?=
 =?us-ascii?Q?FkJp86e6JBaGfpJvpv5Zu8ru1AazU5YRl0H4oQet20dIVJE9N/IW3cd8Ro1Y?=
 =?us-ascii?Q?eOxvVN4jikg2fpYC93q+/d6LiIv8BxmfGsFNeSWJFhnjfKgtyL+qZeB2HHVY?=
 =?us-ascii?Q?wQ3/W5YX1EMyAvcbYLgFbXs+B6ldW6T9EMt5GUzsdaDces+ZC43BWcPA+XIm?=
 =?us-ascii?Q?VZEkOUSiZvl8+nuL2Ryc0fsssVORQBDdv9k94aMi0xbmvYZ/jwtq0Du59fPw?=
 =?us-ascii?Q?KnTOmP8mceKpa2gk7nPO6yQk9Lxpp0Cd5GqxTv/AHbAAOEXCGOgyHMe9aPMc?=
 =?us-ascii?Q?AwM14y/wBm2LNB5v3PiAt/6huOcky5x2t7IU0v74GxKvoARa0lard9pbe/bN?=
 =?us-ascii?Q?Ut+42exjtFAwDkKMIBAHrsbVuAeGu5C5UfPVzCyfSaQW0meJCWF5sBvyS4cc?=
 =?us-ascii?Q?PTG2ZrFufx4WWBbshHPL6ebwUCBmT5Uqo/yz2TCjIUGapv3NIwDoNutBgFHR?=
 =?us-ascii?Q?xWp1b4B4MYb9DtKeuLbWQc5dSPCofWxXabaU5UIzssVO1nTkzA/xoEHf96vF?=
 =?us-ascii?Q?Qn4Bh2XWpV4Ar1INWcnS4+HTU4nIEf2e8hXgtEGquZ7rORo5ZVQ97usTbjCm?=
 =?us-ascii?Q?djmyCFHp0USakatrytxHu2OcYPRTp0lh8Nb8PxVBAafMBN3+nMGrrQyE0B3e?=
 =?us-ascii?Q?BcUk8GjMbOMvz5xwUwI3bzHkZ39x7/bmEIk1KtRyCLmm105kEjUM880jUEsh?=
 =?us-ascii?Q?G+5ZJ1LLXpUw/s6pPfBp2OCl2g/FlFGohnl4TS47VvPtHsBnqkRS8ae7EoUo?=
 =?us-ascii?Q?M09wmq5ymuA7CPpRloLyxXYCsGnPEGJXaluWOY31eyws25/KByd09v2YnW0W?=
 =?us-ascii?Q?LoNFSvQyGChdu9psAxZJk2IPljqTBABzgjx52qi0uykMPQUiVBRQ8PDqQUS1?=
 =?us-ascii?Q?id+scPfyO0m+hIzoAQo1NfyNt9dfppEJH6/ohDGK7H2Z/6e/n5tUqK299Bbf?=
 =?us-ascii?Q?5hp+dd5Udt7rO9RpvSuFYDXCgiBEgOAyQAoH3uom6db1An2sWKBpyeYJWGeS?=
 =?us-ascii?Q?MUZr0XdUU+tsxEGscrmLwFuPqwtwWGd/gXfVH9YNOfpGqs18mpMlb/rxxUgp?=
 =?us-ascii?Q?mZkHmhcjfQrPKqpaLgAdTPhyw8e4OmKwS1D9qVxsRRxw3nuy1sfT7y/PKqZa?=
 =?us-ascii?Q?fRokK0R4ODE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e1fdc7f0-0b38-4c69-73bc-08dda28fca0e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|376014|7416014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2/Q1h7qG2JKUVlVTFrwGtqdxMHNDYEFa4xy3MIpJG51nYW49baBz2shqFHLi?=
 =?us-ascii?Q?ZNdO3XRFCvGBN3NGyDDO49DxmyXmJ5kFz7uGuALrPCB0JlU3xsJEMdFupK8o?=
 =?us-ascii?Q?lgPX5cgWpvzWjwta2dOs7ID6XCAJFtU98cP4D7q4aOusGkmBCLSAbP/uSzZb?=
 =?us-ascii?Q?Sx0llY9DY8VbpKimErG1COW0R7E/ra/EmPFhfnI5kVSa8KXtAUsRoblSMAjL?=
 =?us-ascii?Q?iwbiSBh9dhj/O2heCrbQvenQGbJ5CVHvoTJmZu8+/dTTpeg8KjIYDM8MowS8?=
 =?us-ascii?Q?50zOsAKYZbJK7oN8hSXmOp9N9nFzPNapsQe1Wo14wb+KtS04WEoRMOxk9KbO?=
 =?us-ascii?Q?bsKaJrdanc8q1NQlOUWxgZ4V74zeLe0dt4zF7nls3gZUOu1niiwf1V/vNf8W?=
 =?us-ascii?Q?wZ7oOiIzfzhwNEOYzSHYB/mNNLjvwClWCVo0k3kJgdIsX0qnzaA0zzseLsDm?=
 =?us-ascii?Q?rUZwvZuZMtFIMYsdFzDsUh8GNm1vhzLFshnA3OoXYrow3TdwDJRDWW8iWZRo?=
 =?us-ascii?Q?ohQqKHwsXTwunVszQ/kM867V+9eFYHqOaeh5vp0w9lH27ORg/auMFfGaalN5?=
 =?us-ascii?Q?LuGxEens1fCBHo3HtrH4+SU0cA/2Q55CXeJPPVnkbFYfRVF0WTVOXmwKpoVm?=
 =?us-ascii?Q?6gTsadJP5mrzqMLOAxNBYRKsGTyoYJkSEuKlY9XSa1BaHT7n9Oakbiu1Dya1?=
 =?us-ascii?Q?Seaw7Lavk5fwpVRjB83jQY83Wzevv+/s9c5H846gukDkHSEtmAhbCIVTYjF7?=
 =?us-ascii?Q?2BMdXz775uCVO21LjtLoZ6jamgaKzTWjMDGzb+jWHE41thJlfHGgH9P7enIf?=
 =?us-ascii?Q?lCL8Lqquwa3wZXK3Db6RJzdA8OYK+s/oZ5uXrc+Ro9OPJ0w5Qg0njKFLraP1?=
 =?us-ascii?Q?AfAlhz3a2ux/ox5gxw7wa9Vd5Stfu4yvFj8ZTxMT1I27zvFw+7Y88v1BucLU?=
 =?us-ascii?Q?YG8wVB6foyxn2CudTUNlaICgouCm6q2DlZ/sueMJvLE3TloW2qNQWVS6unJg?=
 =?us-ascii?Q?1MnvksMiLavxkjX4VxnIUEQWNB7JFLjG2j4uYgIyvJj0RS6jVr/2QvJcBov1?=
 =?us-ascii?Q?4FXz3H2M8Z2pRPnGW0V2WV/f0q0+fjcRiKzSriDicgoNQOsTf320DO2Fxty7?=
 =?us-ascii?Q?cXztB8w21CadI2Sw85d4O+1L2/7cibLU6024Tz3A2iVEWoiHMhKa6CYX9lP6?=
 =?us-ascii?Q?fCdaETD8yrjCCnBjff5ZvSJ6q5eGF4Ab5GP/YHbOr7EOR4EKyNyTzPKhA4iV?=
 =?us-ascii?Q?vZTWQL1pGao14lrToLSzaNrPYCuHR0i22JBu8714mteH5u9pFojMPJOeDJR6?=
 =?us-ascii?Q?QmFlbcRvc1oJ/QvTxZ1CbEo7/eWIT/DEr/PkwEjXBAc/EYU/KKJ4TXYC1OSc?=
 =?us-ascii?Q?B29InXaHxrHLmClp7OlbvFGdqqS1xB/q9MafQxBJSVq0T4XWLz/9VcLu/GUv?=
 =?us-ascii?Q?yue8tu07Nw+dEGvi5wJ7jfK6tFKCzh2zxGfm/10zhucnVSGE7+NBJZnqyVvL?=
 =?us-ascii?Q?T7kLDLh1lZ9xUOJyZHWF+YDXErBuou47D6ZC?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(7416014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:14:54.1084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cd155c-e165-4791-a05d-08dda28fddd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11142

Hi Mark,

> On Mon, Jun 02, 2025 at 06:50:53PM +0100, Yeoreum Yun wrote:
> > > One of the reasons we treak BRK as an NMI is that exception entry for
> > > BRK will leave all DAIF bits set, whereas schedule() should be called
> > > with debug and SError unmasked (but IRQ+FIQ masked). Generally, calling
> > > ct_nmi_enter() prevents preemption (and hence calls to schedule()).
> >
> > I think ct_nmi_enter() doesn't prevents preemption but
> > debug_exception_enter() disables preemption.
>
> Yep, sorry for the confusion there. I had erroneously pattern-matched on
> the nmi_nesting values and I had confused that with the similar
> manipulation of the preempt count.
>
> > > Another is that we may have a BUG() or WARN() in entry code where the
> > > task could be in an inconsistent state, and we need to treat the
> > > exception like an NMI to avoid consuming that inconsistent state.
> >
> > So, let's think the "inconsistent" state like:
> >   -> el0_enter()
> > 	  -> enter_from_user_mode()
> > 		  -> before update ct_state (context_tracking.state), call BUG()/WARN()
> > 			  -> el1_dbg()
> >
> > It need to call ct_nmi_enter() in el1_dbg() right?
>
> Yes. The critical things are that RCU may not be watching, and all other
> entry accounting may be in an intermediate/inconsistent state, since the
> BUG()/WARN() could be anywhere in that C code. Currently that means we
> must call ct_nmi_enter().
>
> The other problem to bear in mind is that we don't have a way to
> distinguish these BUG()/WARN() cases from others throughout the kernel,
> which is why we currently unconditionally treat this as an NMI entry.
>
> > > To handle that properly, we need to:
> > >
> > > (a) Figure out what to do with entry code. Last I looked I was under the
> > >     impression that x86 either didn't have a problem here, or simply
> > >     ignored it.
> >
> > TBH, in above case, x86 seems context_traking.state will be broken...
>
> That's certainly possible, that was the impression I had last time I
> looked, but I haven't looked at this in detail for a short while, and I
> may have missed something.
>
> > > (b) Handle BUG/WARN traps separately from other BRKs, such that we can
> > >     use local_daif_inherit(), and treat this as a special function call
> > >     rather than an NMI.
> > >
> > > (c) Somehow teach make_task_dead() to handle the case where DAIF.D
> > >     and/or DAIF.A are set. Most likely we simply have to panic() here,
> > >     as with BUG() in interrupt context.
> >
> > Right... It should handle for DAIF.D and DAIF.A bits...
>
> Yes.
>
> [...]

Thanks for clarficiation :D

>
> > > As-is, I think an extra warning in the case of a BUG() is fine given
> > > the larger functional issues.
> > >
> > > I do not think this patch is correct as-is.
> >
> > So, what I think:
> >   1. arm64_enter_el1_dbg() should ct_nmi_enter() as it is.
> >   2. in bug_handler() while handling BUG_TYPE, add above ct_nmi_exit()
> >      conditional call.
> >   3. DAIF.D and DAIF.A handling.
>
> No, that is not safe. In step 2, calling ct_nmi_exit() would undo *all*
> of the ct_nmi_enter() logic, and may stop RCU from watching if the
> exception was entered from some intermediate/inconsistent state.

Yes if call ct_nmi_enter() without condition.
But I imply with the condition check what I posted.
if CT_NESTING_IRQ_NONIDLE,
it wouldn't need call and that cpu can be watched by RCU.

>
> If we want to change anything now, it should be the DAIF.DA handling,
> but even for that I'm not sure what the best approach is, and that'll
> require some changes to core code.
>
> Please leave this as-if for now.
>

Not now. But waiting for Ada's patch merged.
and let me talk with you again please.

Thanks for your confirmation again!

--
Sincerely,
Yeoreum Yun

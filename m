Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993261E485;
	Wed, 11 Jun 2025 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648521; cv=fail; b=QdA308/ZrmPPcX8iHzgmO54zA+rgnU8lvbCHSe29OLMotKv0Jf6GwVP7vLDq+QfAd+y4MSdI65nR+BYbFXASKBrTFyuI54fJnKuQztfjPovL/uAZfpnx+Pr7v8X1PNHPziyhk2htr8mBsnvED99LITPR84r9/X8PQ/yE2jsLHcY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648521; c=relaxed/simple;
	bh=qxn/V+hIE0PSGtqBn9lgZucxbSSFXxmXC8R6U/K+6no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UcFtbnqZ2I6o6oyHQpoC8TStItOnEogxh83YP4KOjbCoEhkhurtrJSQvLzrMVtMDu0gt67B+0MR8fAwkV7ciyJ2ejbbaJeJxYqkBsELYRYA7v9sJsoD5T24doQAHKKFooItq9jGIHdY7/LCoYxV8XO/HGc42ln1/a0WxJQEQ7kc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SdsC5enX; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SdsC5enX; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SdsC5enX";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SdsC5enX"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wQGcMfPq4mnItcp26RAJBMyo3jNiyJU210fP/Fx1RpOsKcUbpPKIeUHKK69fOsP6S7K1bazJDmwcJmcLBufk0LmeV3u+o0C+XUFUffrgPHRUrzwn1bWlthfdX8oIqPNVL/OAfmQq4+CCybcyaN2oF6e5zdStSwNd0UkHaUDCaoN6m70ISzX5WKnQ2n+m+zBrKLMGLTe21jnnb697ytQ0jSgkw+Ar+hUeatAa2fn+Cy1bvFF7TkKUI8W4XH72OeozLCf7FVipQf466Af735cI6Txtf/JRsvIwbVoAI5X7Udl0K7KLIASOQ0Bi9hHdzPHR4krUC1lAPpU7Nj4N4M3h+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UUxcIlRvxY+zQpwURld6CjQ0i03L/KOiFlEnGSycg0=;
 b=p8AFIvKlrMw/auPEwuCOelI/tIu0T4u0t2V41mA9GAmMGYOFBVMGDlg9IIH7AcD5YHgib03hXjyFV0H+PPO9jo1sJYC0Ue0a77F9mc/VInNXF6eIAbPhpmolY0ol7rmn0hkBfEy0EcjXSQkTvwpmehfNUa4QuOHbd9qN9or1J5NlOuXh4/p5IqxtYknN4bpj8Q1D76OE9CPayNZmnqJxUbulbvDFKF83/yS+AgMzvY5p2wnYdRA/ONP9xJJpgmAdvS0CWcN81o5atG19cuRG74NFodhjhQ/BKzabZSCKZZxvnTkI23x0knOkR7Dkaupj8T8Ott3BODzr3IixOsEIlA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UUxcIlRvxY+zQpwURld6CjQ0i03L/KOiFlEnGSycg0=;
 b=SdsC5enXXLMCEhRDEZdX2OkapSe2hui9EaI1bx91gzz4yo/npIIukiEaFjzDt3F5Xt0VSPK49aMScl5Jdv6bawypDvCSIpyvGuNLf5Tl/k0qY6k1wMf0OrRuNaEYUwkAERqG6elFuRGW0IGqHnnKwfA+PiTeUiBKRfUxP9SdS0g=
Received: from DB3PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:8::40) by
 AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 13:28:36 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::99) by DB3PR08CA0027.outlook.office365.com
 (2603:10a6:8::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 13:28:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 13:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw12oti/M/FtS/O1Zuqn4cyyI4FA2+cIYzXNnRNG4RiOtk4OVtHsYuw9IPdlNqTn0sGbb2iREz4Lr6kLWbE247uxulONzGbyqRAfMiaxXwSMLfLM09TfmPS43foyMyHhquqgwGT41Y0+GVEretz8MJh+sn54OX2q+lWpgOjbSB32OcIdzl/blH0hHsnmlUPqaUEJZNhs0YqT+BNRDmm8MmxIPLKXNnQr4ghFyIBneXjXEYn7BVeuoycDkPdojlg0MTjehP3sRw9L2a2wDfOPedX5ClyRF+PbfdZcc7ixU1bl6vD2ziNxRx7zNg7tkbQD1+/WJCuj6ix/ycf5MIoHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UUxcIlRvxY+zQpwURld6CjQ0i03L/KOiFlEnGSycg0=;
 b=PgnCz8MXKCh4gZn6VJUncgdWwjLExywm/DeX1xEadoTNo00IBgRhA5GEqf6eFS4e4iw7ckAJLHCPFIA0i8UNX4izHXipZsGRls+98zh234XxfThtW+NUTJHjZy6U86S9aE/tfAxlzuPrm/ksFdBV11pcKJw3owufiCQqRPmY43ysLxOtET05nftKdUYZltFEuAx0MRCVeAT2OtDag6euWWQeQBgWKTWpCKJ4e47UsJS97FtcOEG6LT8P6ijLixd7YwzIqm1WKVvD7SX68XqAVmhbvsMOcRyRAVWnQL9oyiZ0UfOEu7TtGSMKL/zfzgNxPTkKsg63Gc+JAiSZVliHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UUxcIlRvxY+zQpwURld6CjQ0i03L/KOiFlEnGSycg0=;
 b=SdsC5enXXLMCEhRDEZdX2OkapSe2hui9EaI1bx91gzz4yo/npIIukiEaFjzDt3F5Xt0VSPK49aMScl5Jdv6bawypDvCSIpyvGuNLf5Tl/k0qY6k1wMf0OrRuNaEYUwkAERqG6elFuRGW0IGqHnnKwfA+PiTeUiBKRfUxP9SdS0g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS4PR08MB7712.eurprd08.prod.outlook.com
 (2603:10a6:20b:513::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 13:28:03 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 13:28:03 +0000
Date: Wed, 11 Jun 2025 14:28:00 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 8/9] kselftest/arm64/mte: refactor check_mmap_option
 test
Message-ID: <aEmEYLKw1qLiqN1U@e129823.arm.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-9-yeoreum.yun@arm.com>
 <0eda8416-b8b8-41e2-8d08-6dab1c1c3561@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eda8416-b8b8-41e2-8d08-6dab1c1c3561@sirena.org.uk>
X-ClientProxiedBy: LO3P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AS4PR08MB7712:EE_|DB5PEPF00014B8F:EE_|AS8PR08MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 97496bcb-79b5-4165-0357-08dda8ebde07
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?5Ra1gCz/gNiLsBVAFka9kZXbUcBe8B5PgXn1jsksMT5dkzVuP46NU8QlrRZR?=
 =?us-ascii?Q?XAi+3c8iir7GOdy9RKeM0qQXFrVoWLa6cJWoDdwu3xuY+Ng4gW52FIDNhmwL?=
 =?us-ascii?Q?YvmpeVDOBCiRntNHYLVugPWt+HbFeFiJaExXVPIi5gMF3mnJc5cAHsr5o7a5?=
 =?us-ascii?Q?08/dZ0kXX7JjfiH8gYdnbepHXWzIAzpW13c2vK57YsBrNnnTfEAI9JADp+nK?=
 =?us-ascii?Q?aZywyc6UTqG0+UW/6byXi/3QfBSWyfKKeCJ5YL5V9IXJ237/a1XBe8TAWjT3?=
 =?us-ascii?Q?1OQVsEnRYT6zHZFCtivA3NmcOIUVx+qMQrmW/r2kUzXhqf4Ne/6zVsr0ZfNh?=
 =?us-ascii?Q?Jey/4phYDXGBpjc+4U2z3YGsZuLssdZzO4a1cs6PrUKGnwAe12vpHJq1wkeA?=
 =?us-ascii?Q?AMOsXkEFOwWUX1VG+wGG/OUoqug1mWsSOvMxbtXr4kJcu9AVKO0wPPV/EoTM?=
 =?us-ascii?Q?5kmZmFBp76Hnn7c03SITMaDYl5IwNbXZjSjX4jz6/oDhgUpkUejV+dchvkFw?=
 =?us-ascii?Q?k+3V9kqq8pEClr9J/Btc/3uTJqbyxdNqIYbniyoOxUU70P9F56m2enNaShGU?=
 =?us-ascii?Q?q0SgZtBtvSbwWIr4SQg/JykCKRrMznWe1SuLlTd1fWdTlqPI6j4QmHH3Ld5X?=
 =?us-ascii?Q?dv0pokJCVaEIDAjkp9oCqRbzP2QBAXe0rAMy4VRyPOPKTqvCjrdqrzHKcZJh?=
 =?us-ascii?Q?Aa5Ipy/4mnFaNB7ZFKF5lynB5LwxE+baIjCZjXsGVL+MsQcsDI3sVFSCgNDp?=
 =?us-ascii?Q?PGYUz6WOA8MpJdQwXqqZV6YFrAiEacKs2yreeDzJ65+gz3lHyQz6eJTobSGO?=
 =?us-ascii?Q?wA3cau+87oBR1GdVNVlYcOKIAl2c+2zx8bA8I+nXm244RZ0gSLT6NKfHTwPk?=
 =?us-ascii?Q?BINmGO2/bcGRURwUXIC2kS24djgpnm5wMgAlUHWsvcl7Tq4l0wj3GATwGWrS?=
 =?us-ascii?Q?VWrrQThVuACryic3o5G5LtYXCqBlE1QmsEGOH2YuWH2DwXiG70vMMyCQM70r?=
 =?us-ascii?Q?1pw8rJ3I6XO/FovnUM/MUq11dKLsO9GLOCKC/+27Od7o2eQ1aeF56pqvGiAj?=
 =?us-ascii?Q?PiXAQrEXS4lmg06JG77awvDo7AYfS2iCXQggTRKFselpH+XcFV30wEQ9a3fj?=
 =?us-ascii?Q?oYjPKPPCx7uo94aT99D/g2sNow7AaYMUKGaWx01i6wrU2twDYibJ6YsJFaQL?=
 =?us-ascii?Q?q398lryy+OIsUPIUOw2iQzipz5/1R6EcR7lWkdjrR3pg/I23cdjHJjA0JxHi?=
 =?us-ascii?Q?8EQkHwCSpcLkijbzRLw+XnJ9OieM19NYmSneUQ3mCe712OA/H+y48L9k/dt2?=
 =?us-ascii?Q?kWRtfkUrAni53CrC4jYcm6BlXq5khRphn3ljZlan7GsbmELDfeT8l3DOx9xE?=
 =?us-ascii?Q?VO77YH1Aql2aDGXF7nQ1pgVMqVQtvOeQ7t55LHyTX8b8GbsG3Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7712
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6c03239-a9c0-4354-d858-08dda8ebcadf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|376014|14060799003|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o7z53OxqvuxVnKcCS3julrDeXjjW+YonFka9RN2jcjfQP7x23HdmFSXXKX5v?=
 =?us-ascii?Q?7vqYbQ0IEIh+eaJBh+rFJHrvM6m4cwyCTQgwCo3FHV6ZdrsJG1xRP7UI7WVQ?=
 =?us-ascii?Q?hrrs0/wjeGjcJncI3H/MnwpSFG5uaMRlB8BsnRL7szcm/ync/NJwhC00b4+W?=
 =?us-ascii?Q?xOnKQ5RN3qT9/kX1em4Eroyuv/IVXzLQ4KmCgsPVDGs9ceeBClBhV6AGVwhx?=
 =?us-ascii?Q?IIUkCWHXEE+4pLOuk9lp6IM/WKCATGUBlmOPaJu5eBiL/QDXmv+mV1dCkAbB?=
 =?us-ascii?Q?pVnB+JpvmkFjk2ucOHdd/6G9k4+M/b4VSqcEmandmzX+kqhbC7lKQ/RSOsBG?=
 =?us-ascii?Q?XWdnvXipjpLuA3gGGN4tCuFgvW40k84QbXc6C2o2ZIAPawIY+JD6twgWdB6h?=
 =?us-ascii?Q?AlaJAWfCyo6ihRI4OQJ4iViQhsg8TQ82FuZ8ap+CWRrQfpSeued2lTfMDew8?=
 =?us-ascii?Q?Rarx70QbGgxivoTPoOLP/9eaEhtbZ9pnGOp1y3xjH1GyTUzhVaiDFE4FoYPR?=
 =?us-ascii?Q?dt54W7ElxEGjBJlYnkU38l67sm7PwsaGwpsPmOQTFx1YzXPJHX1AGqefncW8?=
 =?us-ascii?Q?yGm4YLQtW1UjB5yrlQD6FKPreO9n2lhiLZVWisQKIzHqZVIFKZjQTupP1oSi?=
 =?us-ascii?Q?9mTT6DFn1W3oodbUMkXW8+v4zFPavfvtTlonBA3M3yKNsiyjjxJp+Q3DQG6v?=
 =?us-ascii?Q?hCJSMKqb7XIGdUAW5XHqpHn+RvCfFpTVnX1VjDhFaZ+sxBJfMEpnD/2OuyKi?=
 =?us-ascii?Q?vLCqr/68sFjmP7pwiTq3JWZeW7omKYmY+w4e1mOTKrordNPbTvKWneFZr/pS?=
 =?us-ascii?Q?niCCp/mxpJeMjMXdFJChoqmWzA5Jk7vSQMCVfHCwV7Qu7EcbwNAzV+eDhIk8?=
 =?us-ascii?Q?6wiNj4UHM6QCgDQqM3Wjl4AgAxGhYqEZLbSjpckC8cVBi2Rec8pf/XGW+8dB?=
 =?us-ascii?Q?7j29SXfzoziodETQlwxzyDtaXSTKJEFBEqnWxv+NPhaEM9obX+nWnpXDc1HO?=
 =?us-ascii?Q?O8Bz2//IwJYJ4suQVtOjgDWv+eiRJE9scq3D/6TXa4g5nqMVmuEUzZW14vre?=
 =?us-ascii?Q?6DSiMoVtP7QmG4jH352I2JwfuLHRpD6VtQqerqTgmbx/N8GBDZbWy3aV67W7?=
 =?us-ascii?Q?5C2m+PWxFtzN3ojwS42fMvtk+4KnhGJQJXuNZCOS+UfDnoNln5pOnbf7MU8e?=
 =?us-ascii?Q?mOxIZYm8g+zk8Bve1kQnngtvo7APO3oXnjwBcuvELoXN+5pFHehobbFc7U16?=
 =?us-ascii?Q?hHp1PvcZIkcMKiRKoJ0iqcM9INRGX0cbo4zDc8hSsSk/K8eP4/Y2/g2281nm?=
 =?us-ascii?Q?Bl9H9R+fX9xf1/lCYg8FlRNykKxfummqTR2zK7oZ4RTmGwBlYSiYes2HqL8b?=
 =?us-ascii?Q?GKjphewAbJd3oRDbSMXS1KnDtCfO099laz9siq7wO9jyhl0geN5+Q39giLsO?=
 =?us-ascii?Q?AoAE9Tf5ajH9Ytd/ucg9lnAbkpnB9Ye69VZwHCUOT8//tRfhh7f20dvGZTjE?=
 =?us-ascii?Q?up5kQIjuwfSIIgaSSg23vhUX7Xc2afnWFYN+?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(376014)(14060799003)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:28:35.1262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97496bcb-79b5-4165-0357-08dda8ebde07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469

Hi Mask,

> > Before add mtefar testcase on check_mmap_option.c,
> > refactor check_mmap_option:
> >   - make testcase suite array with test options (mem_type, mte_sync type and etc)
> >     to use general testcase pattern
> >
> >   - generate each test case name acoording to test options.
>
> I didn't specifically check that all the tests are the same but assuming
> they are:
>
> Reviewed-by: Mark Brown <broonie@kernel.org>

Yes. It doesn't change the all tests.
Thanks!



--
Sincerely,
Yeoreum Yun

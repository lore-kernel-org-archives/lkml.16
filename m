Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9CE1ACEC7;
	Thu, 24 Apr 2025 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.50
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502634; cv=fail; b=N4tr+Dtb8/uqI81ijUbUCyoBSu2uWGZ9UQ5NI3zJ3xcawqS9jzhnNcACjDpCkw/3D/49tmNAFwv99o8YMz3V350lIggphhbtsEY3VNRZ+ifYg+zffw8bgglLRdf+49xHiWVZCClefFQ4/5X9vVoBHslacclzcIRKDuiT+VlZpDU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502634; c=relaxed/simple;
	bh=4lBBNawOOIXz1OGBlCLZhEzj/ZW5ketv5kdBjRRLaEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s4GbHtCi31hsn1aGcsgEHQwzkUcyyfahfasloJUHX25TIF7i8+wZu7gDATXqg0C0YH+HvhQHhBQKyvWfagZYNraTKSC7D++Zk0vgeyGFGgSapXFqBsUjFn7Di50Qsk/g0/1pKJAL0sJ/r02TeOVFvYI8eZ/IqYmnsM8L49uapGA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dhCFLMfC; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dhCFLMfC; arc=fail smtp.client-ip=40.107.20.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dhCFLMfC";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dhCFLMfC"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JVTNzvXms7390KmGnJ426s/hRh5oD8bjAn7+A/ZhX17vy8BTknJN9wmM8jA/Id3QzrvlhgO/UM6rntGU0NferGGryD79mzmYw7FFx9XfY0aIiPRJRRx80rJTvSHbenv9dCNB2CpolNwgOGXigM4WnLrE0Cy0+rgwatw1q876R0WgnnmFlY+KY7G2AEuu9YbXLUI5gq7STR0rh8Xbfm/WSfY+TJTmStF01xEjnGIK70uMKpMZx2L8WlHUK4nlFBg+JW4jM59TLKb56R8DMwC5w49IeOktUN7SZv2VuzRfqn+Jhj8aSUEu8qHySDviCSB9Ry8bx35PFrgOWumQni0LaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2LEKwu5lpOaUX6zUdIJKidhR2YDWU7S9g6oCFaZiIo=;
 b=qXUhGkDogRuo1AkwVPZw1gY/caKVzPPd/BjyfVcy4Bw2Q1W3I+W3hmvqvIwdXmnEY4IF8A4zuF7rYHQakfDGGvdiD0LAZN2z43cn3HZSHCtmwfZsGL6qhVA/SCZVtCq7rq5pWpZuAcxcMDxuP0olEOo7Lk7q//n9ByvbdDF1WfjmGObIRPvnH02rxwu40zgg8sIf8PT9KdtqFC9oFUQpep1Np0Ozu/B7JK+ObI14stcUuEIONIe7SBnpuMvbLHTCoXwtd/EemAGkJVFI425+U8xf4C4Y9Ue2jT7sw5lt9eNBBiOv7eQGbnSc5SnB4Y6agCoZ5tLgekULHOB3UNhVyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2LEKwu5lpOaUX6zUdIJKidhR2YDWU7S9g6oCFaZiIo=;
 b=dhCFLMfCw8QXUnYIdN7SvQ8Fz8MPQwYuc5ural1Y260gelhfHLahTMYNJu7Ux2qbUhd3/36drnVYB/WSmb6fP8PbR6i2wPWJUt9wcAPb40Ej03xgo5GP6/nXK7nlFsuJ/df4cqs7/jnCjmlW8WbOzITjHiiTR+sNXvU+alOkedQ=
Received: from DUZPR01CA0286.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::12) by AS8PR08MB7306.eurprd08.prod.outlook.com
 (2603:10a6:20b:441::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 13:50:27 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::96) by DUZPR01CA0286.outlook.office365.com
 (2603:10a6:10:4b7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 13:50:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 24 Apr 2025 13:50:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFtJzjvAEOTOoAptEJNSrm3Jz6vJQYrdpqEPlnwL02Dup/tw0R/eRWUqM/8lKCi1Ni5AHKq6thxOTfoeC90RHsy6kJS1PymwZSkXriX+4DhTorg4M4Z1fNWv5dvuN+SmTjKmhDSiWxhoSBFTokQwrjZmxJknEemqGxDPqMOgK97Dnn00Hl1IvEdmeNT6oVk7/c9HyOhkjgv4JOB9u9tL73iDQfrSUKRTS5i4q32duCGjBJYLVEpeXvvp6iCvunN3pqDvijNvN4B+09mpDtLTJ6nk7HQl70lvvl+R3zTYL4Xe7Fr38b3p/urfGu+Ja+6yPRozRYiwDaOm8Xv/8s3mbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2LEKwu5lpOaUX6zUdIJKidhR2YDWU7S9g6oCFaZiIo=;
 b=mYygtwzxCZvqJjivoKF9REAP3ur1+yCV3keD6UUgUi/oRH5K/wUP3AewHUJnaNMdjlqKCpry/gu9oYbeDOZwArqG2jHbvVM6z5UbOZ+paquBUx/3dhKLTQzsPMtM1HLnw5EPgBDCvyzB7EPPPMg0K8gvi87r76zOfoFlE84hpHKMvtiCVzHex0blsSb+upXepQy4iGHtbdQpwgFUpxNu43NF7gNKG46pauHP0Ro0vnAlqIiJRG+P0NUilK3zpWeeWMgrcyYfcRltSJw1K24ebLgLMuVJ9FAQHbKfxgbFyHS4m5ZgQXNOlGPTf4WmBUhQf7FytkYVSy7jJBUyfIorIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2LEKwu5lpOaUX6zUdIJKidhR2YDWU7S9g6oCFaZiIo=;
 b=dhCFLMfCw8QXUnYIdN7SvQ8Fz8MPQwYuc5ural1Y260gelhfHLahTMYNJu7Ux2qbUhd3/36drnVYB/WSmb6fP8PbR6i2wPWJUt9wcAPb40Ej03xgo5GP6/nXK7nlFsuJ/df4cqs7/jnCjmlW8WbOzITjHiiTR+sNXvU+alOkedQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV1PR08MB7914.eurprd08.prod.outlook.com
 (2603:10a6:150:8e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 13:49:51 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 13:49:51 +0000
Date: Thu, 24 Apr 2025 14:49:48 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, shmeerali.kolothum.thodi@huawei.com,
	james.morse@arm.com, mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 0/3] support FEAT_MTE_TAGGED_FAR feature
Message-ID: <aApBfHXRxn75Lebp@e129823.arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410074721.947380-1-yeoreum.yun@arm.com>
X-ClientProxiedBy: LO2P265CA0339.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::15) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV1PR08MB7914:EE_|DB5PEPF00014B94:EE_|AS8PR08MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 84abbcbb-758f-4ec4-7a0c-08dd8336f87c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?yn265HKGEA2YtdwcbSNQT0fE4yeXSI4PH2x+3Ad0bJKlof3NAa++eyEbTi2E?=
 =?us-ascii?Q?SDXXZgX4Nto5QCS+hsudn6Ox2x3uBJXnhrD0hVQX872QFLsGUgEghSBtvRmf?=
 =?us-ascii?Q?AtAjAM2QhnGBMYpkPn5wDCTtw4bm6chrJwfvLFX9q7K+aJ5hEEblXcJ9DP2u?=
 =?us-ascii?Q?dCAGEmsoswd/RdJMtIdougtayUqyjnEqNOtrwkHzd1cdlGpcS0rdbO7dWZLH?=
 =?us-ascii?Q?HFAMJzkIVtSy72xSS+Fzll0XrozFW+P2DmZf140qQK9IuTIRGjgJmuaQSw9m?=
 =?us-ascii?Q?x2mmgU9fzjF+mj2yLMHVIIdRMxnV/3qjlAWgLZoXLXeFwderHARgu+pxt8wq?=
 =?us-ascii?Q?Mza4WNT8H9mQLMiZoyZgTjuuM0aHHHgMoOfThdHztE5VhsHLSC1Wplz1iO5h?=
 =?us-ascii?Q?90EU93uXciOD1VEGfnJBIOUo8i05qVS0XnMwnVH73S3vrvWIpb7lr/QUzfau?=
 =?us-ascii?Q?/VygqsCz2eOZ9cEYUdv8CIuVjW2BEr9DJNQR5TegiiyGzYqywccCIHlfvmg/?=
 =?us-ascii?Q?CtkuIMuhVyBQMF3xBgEICpEWX7iznCHH/nKcQIrtSo7M3vITk5/DLPRGPcc3?=
 =?us-ascii?Q?fz2bBpSewLqU4q+X9JZ/wOx3KqxusQ00cQH4UnmYW/+7ZEh/s9YByRwEtnXu?=
 =?us-ascii?Q?p6B6VZIPeK+Zqe3nYGatamhoHwy1PBxYGTNPWRTRzAbrBAbhORkGp5vXTB1t?=
 =?us-ascii?Q?TB5tci1Kw1EB1RAHDvGWhh67Co3+pYy4g0h2WjZ5zT+3KYQORZJqzJWZUV7T?=
 =?us-ascii?Q?GB7spb8TWoLSLOV9QFx4U1FzecykOrZQ4VZTVLyU/i3EwHH3hq8BMwscbIqU?=
 =?us-ascii?Q?bRrs0NMhSIEXF8WqYa/iyHpHnAmTLG4uMyPYubtTgjnGNm/am9qSCUP4H2C+?=
 =?us-ascii?Q?PH6NtLRE7kAxpYyfV+ufUQqwVihjVqpOQbhj281tiZXbK8phG2mz2mkWDCm7?=
 =?us-ascii?Q?+wT9cX8cHaLXAqEsHleY0pN0qeg4HfMQji6lxfnm+eDasWyODElGMmv8Z/vW?=
 =?us-ascii?Q?Rk1kj9jQllyeXS/7HNV4a7eibuo9tUgP1S5HtLIEkykNwcGTdrubpFsNKKzx?=
 =?us-ascii?Q?E0rUuMrzJH0sObWxt9dkYfTg/18CV+HY7bicHOPWbVvJBiMoLvQJdgbAR0hw?=
 =?us-ascii?Q?EB05qraEi8s2It7etCt93tor4gVior5D8M04BfgbaO0J067Hkf7Tu8Y4TsD0?=
 =?us-ascii?Q?TQUXsnIbYb54u4A9/5EcUp665st9RDvDKEkv4AeZY8CzPuLjc/bVGSXcIW34?=
 =?us-ascii?Q?UgwvNvO6bAWyhEL+/GlWeFj/Mj67bEWNxou0ICmuwKIsxDx7TuAziTnOul1l?=
 =?us-ascii?Q?DiEcvnVa8TgMMBQKzBFoVOW6K8PJD57Gunb6zwRcYBlsaUnjcBpfS2JOlAKR?=
 =?us-ascii?Q?YJQymFsaRLyPbZew31Xl3YRQ0FThyFHLRi6pOBd8T0CVCRJCrKL06WG/iLTR?=
 =?us-ascii?Q?i4uR5nW8S9hBBXhRx6vL61GPngo56sobihC9+weRri/sl/oROZ4YpA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7914
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd3fc0ec-1baf-4dec-3d1e-08dd8336e268
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|14060799003|1800799024|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5+SSF9cBZKTJzt+hXNVPiZhVCWIxfJDk/H5eiJ8MrUfQERBR9OQAzGrEjqjc?=
 =?us-ascii?Q?7PhxT7yOQjtPr1eFzVqMi0dmIwK3xoZjZpzKbqxHPxukLnaxU9MyGlEDREtp?=
 =?us-ascii?Q?jPYqaRKRtxjH0/92YUA6yzovhJPA+kY/fUStXDTudRcrJEgBFjrLcnTK7iki?=
 =?us-ascii?Q?1EyO149916Cq/bnsCbDSSijEMXU8bxhiD+cN4qeLFn85can8mKlqVqhwW7df?=
 =?us-ascii?Q?2i//f5OPuK7ToX1PQEQT/8fRcqwNWEImi1zMEP+HTRdvvbbxn0J90c2je6Zb?=
 =?us-ascii?Q?hljDu04KdE3SwWjevqTLQ4mYVt30pEvsa5I5s35tROCTeLFmtd8SlBCTWddr?=
 =?us-ascii?Q?PhSnm5UTDVsyPTxm1AL+RcHOaAkyzrCMDv6Nd5Eq5NgjYFbmYaA0y6V1Jamx?=
 =?us-ascii?Q?43UtswG8tnk3/ehVti+DP2R2RWizRZBY836+5BilHCo7lCKPst+Q+aufnWT3?=
 =?us-ascii?Q?dSgV2477NsuqfM/49M6roorju5N0evb/ErYNYiU3vlgWWbnp9bBZHA1PUcY5?=
 =?us-ascii?Q?IOsE6iTk3EaWfhrF+LHV7E54i0cgr6FgUbcGD1uloMdMqwxHFFvglb7y0A3G?=
 =?us-ascii?Q?3Q99A1ma7O8K6gudXj9K3Hkq+K+siTSNzPI3TE80LIccWWNkfoDAQfbOhBSA?=
 =?us-ascii?Q?PJhaceLlljXGwvN27Qm0VCnV8fHdSjR/XwwWxgDhacllHTGowhB8a63aEcnQ?=
 =?us-ascii?Q?OXVZEfljWIq+fdWjkiZM2QIar1+PwgCeJqg8j8wbFZLNtEzQ0D2a5pCvpLL/?=
 =?us-ascii?Q?M4WlncQOcCnGpOIv5aYLI67croIS+H0xX6e3GJDB+Rq9Bw/xs6OCl051G5ki?=
 =?us-ascii?Q?xd/QPHN86exrvAHzNOtcxgXv9w6psdV1SuN3bEgNJZHeSBxqxJPTi5wXdIkC?=
 =?us-ascii?Q?FlWEFjUZz8yFV9XjQqK5tILy8rej2dH8STs3ayOgMu+TtkL7JD6RhAbMWcDs?=
 =?us-ascii?Q?TPCy3CAiHlfm425zU+yMU4WFSpvGFjEmcZY++gBXUx7YvEqwFpsELr9+L2Cn?=
 =?us-ascii?Q?keh3VMDDX0WhjF66MYOZhUuwKAskEXZ3TYw3TzZLMU5KAn1Cn1MKyqcNMxIx?=
 =?us-ascii?Q?s1F8k62G4ty795r86Nttdyp2wf9nSnb/DjNPXFigp6hXmG63ymrPgGJWp5Ah?=
 =?us-ascii?Q?UPcw+oRSbsujl1sD6lX9/SSf/vh8tA/Na78M0jJcj9/OjDl2HOaSjJ6vdZRG?=
 =?us-ascii?Q?AQYj8pvUTGqWwoWTWmtk8IgCaC2okHQtiKejXSre/yefKH11js3mBasUw4No?=
 =?us-ascii?Q?H+RDEk60g3L6vaSdLM0zFYvB9nnIGJONRL90xm/r5VBetjk2NpWUpOpTwuzR?=
 =?us-ascii?Q?Fo3WYmFd5ZRKwR4kR7o5ZJ2Jp1kQdw2RtuO+307XgovJ5tvAOc4Ml0pYy0Qq?=
 =?us-ascii?Q?Hn5j2mw0bv1dzTaGpprBzKEDO9NttnveWP99gN7QtS3aJHf+5kflvlsaUUdU?=
 =?us-ascii?Q?sg9sXytaRQ/SJvbJB+XmpNllA9K8d4sPn2gsE1IBI7geL8cOiu7ET99PRg+h?=
 =?us-ascii?Q?XY/Wwz0olCQc495vBrXzW6O/4Ir/D6WAkvqpuKvAngxDmGVH5ZewWla8kg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(14060799003)(1800799024)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 13:50:27.5857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84abbcbb-758f-4ec4-7a0c-08dd8336f87c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7306

Gentle ping in case of forgotten

> The FEAT_MTE_TAGGED_FAR feature provides support for
> reporting all non-address bits during a synchronous MTE tag check fault.
>
> This patchset extends the reporting tag to include
> not only the memory tag (logical tag) but also the address tag via
> si_addr when FEAT_MTE_TAGGED_FAR feature is supported.
>
> Since v1:
>   - add hwcap test for MTE_FAR feature.
>   - add MTE_FAR doc into elf_hwcap.rst
>
> Since v2:
>   - Rebase to 6.15-rc1
>
> Yeoreum Yun (3):
>   arm64: add FEAT_MTE_TAGGED_FAR feature
>   arm64/mm/fault: use original FAR_EL1 value when ARM64_MTE_FAR is
>     supported
>   tools/kselftest: add MTE_FAR hwcap test
>
>  Documentation/arch/arm64/elf_hwcaps.rst      |  3 +++
>  Documentation/arch/arm64/tagged-pointers.rst | 11 ++++++-----
>  arch/arm64/include/asm/hwcap.h               |  1 +
>  arch/arm64/include/uapi/asm/hwcap.h          |  1 +
>  arch/arm64/kernel/cpufeature.c               |  9 +++++++++
>  arch/arm64/kernel/cpuinfo.c                  |  1 +
>  arch/arm64/mm/fault.c                        |  7 +++++--
>  arch/arm64/tools/cpucaps                     |  1 +
>  tools/testing/selftests/arm64/abi/hwcap.c    |  6 ++++++
>  9 files changed, 33 insertions(+), 7 deletions(-)
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Sincerely,
Yeoreum Yun

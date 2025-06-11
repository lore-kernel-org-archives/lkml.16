Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AEA29AB16
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651008; cv=fail; b=JM6gkAnTUULR0jwRcJ2YRmZSFRZVCkP8xmQPsbY+aNIXgmOY6HTwLSV2XkOnXQLEoDBeqmTFMMmm3ffKiUuUzs/Kz1knhOn5tnix2Ox3B2lIfUvV/kdtlKTn6pGSC0Xonzlpa3PBpLlumU25JdB8a84hZyMFTyY4EvXTFwiQN8s=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651008; c=relaxed/simple;
	bh=HXi7aLsPj8QWxCTj5iv65ovO2CSRHFxsVUyDqQFFYE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p5FDfbo1OvQXKmxa6c0mB3L5vA976YSSgojsL2uw+0vuNTyx5AjM9CI0VCRrXVk1zx4HX5DxihIEJwuMhx1OhtZ5CuEhYsfRLb6cgqKrnvprcp61zlbs6q3GY/YF7NzuupxiFr/VY7UMiXAkCeYFAny85xlQbDKsHE5mxcnpYF0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KIBEf3av; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KIBEf3av; arc=fail smtp.client-ip=52.101.70.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KIBEf3av";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KIBEf3av"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qRrwIrvfkj9DcaRHP+WkqjNukEKUqn9bdk9n9ACc3sLBDE+poWzu93IUshS1YWn8UQsLmWdczvggQls/rDJynqw9KyA8wQ0e3/AQNFFdDtOqDkq7ZhAWiQTvFTOVwu/kJ8Qw+h9CuQYUeij9asMFJlBxAJ5aO7YZYjVptJT5rApN8c06DyHDERkjDWTtqZaW+mfjMWjK9rHpxAFPs8wBiYkhfWTGya5tZgfgOWKDsvWQ0F/bJJE7lO820wHl/iWgvHQXCCXyg5zHCahVhgvPfxIi3JVS/1MT/iGtzqPKsdzPmmBN3sk6IBsFTBriEtNwMb4+07MN9+PacuSe9eJ9Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXi7aLsPj8QWxCTj5iv65ovO2CSRHFxsVUyDqQFFYE4=;
 b=ZPgy3iv4nT75wnQnFMe8LWY/Ysu23gD+GZRIxF56JlnItpmjebV7GpcQUSrMgyKL+hFPyUoV7Y6VVMzE/HEnirc1QZRgSVj0ZPVMd0M6Tl4wVV3AiXibitlQkzrjkwFaE5pXPVP+53/Z6lDGycTdItjNQfUZ8i17YkqgcDLCQA8xDjf6gvEOw4faai+cqwUlXahVyJ0JBKLYbgUR8UBI8iyBSTEhxGDQmfEOOwJKB0lA7su0HB9KvxlOmIyHmjmNgVjxrgtBNTxFtSq9RswicYayaaps1RTESoWILdn3bRMWqNPI/EDr5FnP8cX8Y+qlUIWyjDPSUAxMY4VN2PMfCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXi7aLsPj8QWxCTj5iv65ovO2CSRHFxsVUyDqQFFYE4=;
 b=KIBEf3av7M4vkp1pTf3tFawNq3T1r1DqsYqCQP8RS+WNNe6pQD8zDoftzwMJq5VJT3VsXkOcQbL7+IUvAixRrOFWFLEY6IGAZ/4OZWKGX/Vyx2XOmuPOKI/wkcI+QP529nDpc1smTdCFuvANms9ddC6FI98KNZvBXgb2X7HUX7Q=
Received: from AM6PR0502CA0044.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::21) by DB3PR08MB8820.eurprd08.prod.outlook.com
 (2603:10a6:10:438::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 14:10:01 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:56:cafe::5a) by AM6PR0502CA0044.outlook.office365.com
 (2603:10a6:20b:56::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 14:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 14:09:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ma8j/mvmPO8biSDgaiaCJwA5Hcjj/Yx6wG6vbDFPevycbFIBHxoDibpJgRDogH9Kq2qyuxQPSQq/7EJZnidAEuNaL8SeeI+p9Eh5LkbdK7bqnUfi+DtxFNjQyBqaGnYjMfjbAf9gsrzKtw53n3hWQB3EE+84UUQty7ZLlEFd/+tpres02L9/i92VHuXGfnoxhTezHCDiydgIAbOCSTtp6Xgzo5htvN9rpvvOGMr/QBNh6tJ+eSPSPaWCtk1+CVhjMR3MoloQnG1eMa2PvPjfv2p2xOPSW3ZKD9nqvO5APzRTN3F0dGmb8JevHfYqUR/NW9V+wj3Q7fn4axTo286V/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXi7aLsPj8QWxCTj5iv65ovO2CSRHFxsVUyDqQFFYE4=;
 b=rRytvor5ZBtloMr3Qda1xb4qnpHfku7cSkVT7bU2pLAKYjYNzzFbadzS71n/8Kv9u7J1QY9cybNfA3g5MsNQv+yhShR11owdGEdfFUtBUjTVB/AAdMCzCS38bu2Fp+01/uXTMKE/PcA1v0A5gcX1WuRwmfmF9M4sNwzjyqZBRHu0kRIijnleaYTwh0yzkOtVsBMPDT3Y38Qcd7Rt+8REijfvmkOtKV9f4iLthDfGUXMbtKGe7vhAGyDpDsn5+G3vqkaF3RAsIqSknIthgu+UCpfNCN9lBAplwEDZ9FINyJjHvxDgDtKiB+sWKMgcUjQMgXKTJuZbr2H+ai6b/AIHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXi7aLsPj8QWxCTj5iv65ovO2CSRHFxsVUyDqQFFYE4=;
 b=KIBEf3av7M4vkp1pTf3tFawNq3T1r1DqsYqCQP8RS+WNNe6pQD8zDoftzwMJq5VJT3VsXkOcQbL7+IUvAixRrOFWFLEY6IGAZ/4OZWKGX/Vyx2XOmuPOKI/wkcI+QP529nDpc1smTdCFuvANms9ddC6FI98KNZvBXgb2X7HUX7Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB5PR08MB10163.eurprd08.prod.outlook.com
 (2603:10a6:10:4a2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Wed, 11 Jun
 2025 14:09:27 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 14:09:27 +0000
Date: Wed, 11 Jun 2025 15:09:23 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/7] tools/kselftest: add MTE_STORE_ONLY feature hwcap
 test
Message-ID: <aEmOE4b6CvhPX8Kl@e129823.arm.com>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-6-yeoreum.yun@arm.com>
 <ea71432c-edbf-419a-bb5a-37da5b09caa0@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea71432c-edbf-419a-bb5a-37da5b09caa0@sirena.org.uk>
X-ClientProxiedBy: LO4P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::9) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB5PR08MB10163:EE_|AM3PEPF0000A79A:EE_|DB3PR08MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a4ede8-1393-4ec4-f560-08dda8f1a6fb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Bp4xBQ0k1s987ptwup4MhTFJcEpRMPEk7Cc/YV6omrmTHTdnGMOGH7eVH+tW?=
 =?us-ascii?Q?oc7U2pcMRF+toR5TN7172w+2mlYilRfq5HPYf1e6Kp0ZHe3JYWsEML/RkvDK?=
 =?us-ascii?Q?cAXCoVZ4jaiJ6t1+O4WQz+t9srbBYH3gQHlI7xbrZr/rSwXrAKyUr0b9RUSs?=
 =?us-ascii?Q?C1pbk15mlngqIVxj6Il+OkEB6VmeKY6EfqOFlSlyosCj429vJeKYSG6i+Nor?=
 =?us-ascii?Q?qxzqk9zeBoWsSpIaIiTWDpPJui0H2lrhQnyEQc1jmVS+nQohq6tMsnXwKh32?=
 =?us-ascii?Q?kf8XlRFUkETEdqlk60nbhY+Ai9h9mt9ligeHPq2IJqWn7otVlxSpi7S9G9dM?=
 =?us-ascii?Q?bGtn7ROY62J0ONpAOweK+W3KzYW0205LfxE5WdxMoFSPmOwhSuKtlTYPgmVa?=
 =?us-ascii?Q?ei4KC3sQX524qItcL1V93b0Pei+je3Q7PFaYiVPk9WzrbVSHe4oNHM9MJp7a?=
 =?us-ascii?Q?uBzCAIviiGIqp+DYceK4/ERrE8pk835ByUEi110GxCNP3ptYV3lKn54lcFqL?=
 =?us-ascii?Q?ZFNgN7IFiRtDkFVesq5Kv5hTWkdmQ/f8hC7wVEjrJ1ubBZmnrqAN5SIcHcdE?=
 =?us-ascii?Q?LK7ghL6EW05C+PQcMncIGp1mjSCV9jX0QL4HSQIQJOg4W4xrmH74HfRqiTLq?=
 =?us-ascii?Q?vMtf9KWZWhpcEOPwKy2h3gO9SfdeqXiryqk2EZfVcTlZtIlGX/u9sYCitBZN?=
 =?us-ascii?Q?jYosDFEKG2IznRb7YE+jbhfko1lyOcAXnbNBdK/tu/PwhPreKtwQIaRduuJR?=
 =?us-ascii?Q?MLhX6/JHrsc76MdD1Od20TW6Lk0ZxSs2LQ48jHeaievTXQLMZYNKa5cmlkjd?=
 =?us-ascii?Q?LKlADXx5Szc5c4Ak14C0elEe1X7LMRzHxpeloUQKYAZlz1PTIh4athGESDxU?=
 =?us-ascii?Q?mtRKZemeNgrHV+4sMotAEgHvP/hzBtxR1y2rJ61oeGsqdwLkW31Y6HNZcvki?=
 =?us-ascii?Q?2w9spaRj+b9jD4/aV+k/I1kuils6bg/j+J8cydziNyi+OjSl3bEYicCzQLb5?=
 =?us-ascii?Q?WEPg6lYzOy0DwXJz4etqEpufttEhD5WO+Yl0sd6UdU4xaTDlMnNEsI4wCBaq?=
 =?us-ascii?Q?hlLitN5wKNpQDcFCI4VH8ZZHUm6KaBCrdU5WUZmPm+cl9grqrxj3eMP0qm8f?=
 =?us-ascii?Q?XJQRAhjpmaIw65Ma+86E0T6rfttDoTiCf04f/RIVE9i5GkxdRd7XYeEC4weY?=
 =?us-ascii?Q?uM6qi8SF8yxGpn3kUzGDsZWaBPrIa3k1HZ7+kz5yYM/fwafCWT6chYvQpNvF?=
 =?us-ascii?Q?ljTKGtu2JGbfqvR9OXzhyGzuAKQnr7txAB5gFbVLTOtlmojnWdmcotx+gfIR?=
 =?us-ascii?Q?xcWahYWXBvd2bHbEN3mMYdmkajUIGizwP3HdcT5U1/kR1gzcKBmT8N9ya7jR?=
 =?us-ascii?Q?1Qr80dht0okyMELVs5wwcSLhmB8abYlAiL1cavp5TtOZenZmWg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10163
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7c7a8b0-1b78-4a33-a1ad-08dda8f19378
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|14060799003|82310400026|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5w5pVq6Z+4sot88y9XJRXB8Y15TCh+g01OcM/frIPCChmDLMx6p5EwsNaaam?=
 =?us-ascii?Q?lyQRL9NeziWaJJ5IRpz7LaIx2YdoE0+s+XIdFhbA7oQiqJEoMJmlFH7zhMDv?=
 =?us-ascii?Q?eHTN25GFlgsRBK1HE0E0hmm24k4njv3Hib9+OhGYtuT/1z8L1ydDiB5C3l6h?=
 =?us-ascii?Q?1eTVChTN2sk23jrDS4ZoOxVhQc5FeZ4Z3UqVL5WFR7FbEBBndzlUmk3BZpSC?=
 =?us-ascii?Q?Ws1Zb0wN1DF7JX2I1YM1SqDo4YU7S4nt/qY1DKDftbA1iXFS4QYv+jcrPMDB?=
 =?us-ascii?Q?hYEL8EKjswr4dBEApd+RE80cfMXr+PiTHYThZ6+9oiUvG25kE6nXMKavueNa?=
 =?us-ascii?Q?68IVOG0JnrsYQb6bSlxiY8Ju1zkzBLnEXoks9fURnlYxyritSGo3vrqfe0wc?=
 =?us-ascii?Q?UWDLUrTYWWQJ7+37sRRxBxTy5RpEitTkxFtNZgfZ3p4X2KwKUkcd7b/9iNro?=
 =?us-ascii?Q?bLE1YQZIsaqJc5uOMikoUKCwiDGLX0mmt0lVrQEXnc79LBsPOrzr9njBIXhq?=
 =?us-ascii?Q?SLSZ7A2UlRj1I95qIm3SmnVAs/0Oju97Wk/Ujn7WGHEU+LATyxaPcw7o6+zT?=
 =?us-ascii?Q?bRSPXOpC2kSEiOvLSTd5zqm3PmC2i6fOhPoeKLtksYZoTz/QI5CEU9T7dp04?=
 =?us-ascii?Q?VEQn1bXFEKFpVtTXA3UCAO6q/LrjqpVI6A2pex8V8hMFOwMWbIMx7W8Muu32?=
 =?us-ascii?Q?vPVMF/p/Ov/naLvghODSmaUABYWYacYAx2e+w3zG7OI7bk8dm7hsYB/7lvIG?=
 =?us-ascii?Q?3SuCd/A/Cw3aj+Zaxlm4Zg2tneBeiisI/R30vqBKgqrY99oh+RhkTm/GSXmS?=
 =?us-ascii?Q?gxsEoxuM2yxgoAqihO7pK/z8gxX/sOmj2o6Kit9va512CDpi/IFrPgVxFzbk?=
 =?us-ascii?Q?qXzfH4T64KQmOejRWSeEXrUp7bGptBijO981tVfd5dt3nOuqO63M83V2Wofx?=
 =?us-ascii?Q?xUbMbREok6cZUaOLFNTB+DXi9GAWJekQaUiayv5PrOzzMbtNrMTyIz9/HpDB?=
 =?us-ascii?Q?wmS9Yxt4C51ZI9p79VtzbtqxjEHmYHueMHHDYNcKsUOQeVaml7FUQ4Ou+Hcr?=
 =?us-ascii?Q?MST0riHKWrY+ZGKIMAQYicvNaYJZmXupXWIoQS0H5f0yyUpv5QlUAIfbQ3sC?=
 =?us-ascii?Q?cs0o7Lm2tgKgaiwgy5UbRr86hGPu65qOBbL1pAfxZa+r+WMU7bCM/J5/ZGgg?=
 =?us-ascii?Q?CLNg47vxB5qD/4463lXc07N1aS/UvSplUg6dcTq9cP8hA8VoPqvZbhE2R5Co?=
 =?us-ascii?Q?kObgQxmT/U8G5RfurlSHMh+92kbzeDhsrp0Ex2CHfXj2W2lF0G4bOYC354Bi?=
 =?us-ascii?Q?cWfOK/81lEwEDYWHl2B/C6HP865g2Ea/A460gWNyx7ExbB+H5gzhGgXGKmu8?=
 =?us-ascii?Q?O5R2x5zt3pqLPUVXxL7R4912pjUkBgs3fJRrn1Hi6L6f/VeEpvOuNYHnBHlM?=
 =?us-ascii?Q?9KmR7UGqIxp+U1R+YT7rxCtHndFXdICGDGfU0FT08UUc75Ffwt6N4k5+pzxS?=
 =?us-ascii?Q?IyQoPqhx4Zz+1u153TMWrXdirdn9gJbFJxGo?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(14060799003)(82310400026)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:09:59.7706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a4ede8-1393-4ec4-f560-08dda8f1a6fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8820

Hi Mark,
>
> Subject line doesn't match the usual style, otherwise
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thank. I'll change the subject format.


--
Sincerely,
Yeoreum Yun

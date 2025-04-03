Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892A2512D7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 17:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.72
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743702019; cv=fail; b=hZImV8zwaFZ/npSD35AHhgfAJRKmXruonD3EDr4WVz5CQLsQXKXWI+n4qfzWmbxKH1qU/B7qrk4cwgwkLd/fDLg4m819Xb+/hekDRoR4IFbAKvEiNIULg/Vw7RkiD3UUjVcFNP9a6/0CXDiOv/ZhTD4viHodi6AP9BWglwqgQO4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743702019; c=relaxed/simple;
	bh=9XCaWGvIjv8Wfblk/1+BkT11ULUPLZ92nLmatgus3pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jYFXX338e4oGSVFSYWxkW/8o5khMLbX4rbdtOABdZ1brkxMfINi1p4Cf1NALGFMvEejoDGRmW2gcHnsE+RT4zL4R6alvU7lqrxbsWMvdL3pqnqSwrbF4RC3I9XidZskHKeNRA7vSRc341giTbOC4g/icL56cMWNV1RRqo6DPEm4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aiM4yhOR; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aiM4yhOR; arc=fail smtp.client-ip=40.107.20.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aiM4yhOR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aiM4yhOR"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CUcsx3G8MGeA6esX5d3sImZqFIdmpPheltEPfjj17Rzss+cM7Z94UZvJwL40rzC7jutMruTySBGSBt8PZSTYQGwTK5nxlH+q4tC7ch+7putBqN7Gly1bm6f7WG6FzBCJJzDc8JTAXrJClIz7qs1yar/lSt82N5f/wBblvEukszGKfpb19p/aS04FgT8go0WMYaz6Gk1AtDifu1a3OxSOOEsq0BNCORjx1yFPBob64xRSJmrtPh/pz//q8E9XEiG3nDv/x2YEuszuUfqFr5rlpw1o3jX7K5jKfBKF3xIc1x5YlTZ1W7BmTwJHZlLrirJe/WXGaMnQBydKT7OtCsN+qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XCaWGvIjv8Wfblk/1+BkT11ULUPLZ92nLmatgus3pg=;
 b=VZBjpdT/xYWz8NWfRhxFfSwc6yyN0DIekQVxoMPAPRHaof07kAb4ifo3Hrc63m4vEsFVBdlnRjiFOwDM9W3JB2Wxif1pMR0eXOrY2HViG7YQwNqjZl41/KZH1bm/Kb1E8ld6LB+Y/GlCVCHqyApHy93Eb+OeF2viTAkfxpsVqPOc7ci2eqJ9oU1LLrMFpOx8o5Z0/UAuDK2Rgo+Mhmn2bxIAPAlQybSoI6R6ipX6iIG6Kw4sJ+t1uCB+/zR7MF9da9HDJzPjConH4zzotT9EOMPHZ534XrBG5r8jywYxMZHZeLLNGKfGYobOTe5gRDjPl4S9+LRxRLH3wL23KvGgZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XCaWGvIjv8Wfblk/1+BkT11ULUPLZ92nLmatgus3pg=;
 b=aiM4yhOR+tbeRt70Efd4QOi7dlnB12MDRqXz91MZWBOvSR8f1LO89NpkFr8YubMcJOs9Qhc/E6xOMRyNyCytbSZbPQNmTBIBY3DtAR+fTncsQD112/abjNiYNRPEORFkV2csDFcYRzug4U0bYF9Gm6U0gR77chgEWUGKt9SBDkw=
Received: from AS9PR05CA0345.eurprd05.prod.outlook.com (2603:10a6:20b:490::26)
 by AS2PR08MB8479.eurprd08.prod.outlook.com (2603:10a6:20b:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 17:40:11 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::b5) by AS9PR05CA0345.outlook.office365.com
 (2603:10a6:20b:490::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 17:40:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Thu, 3 Apr 2025 17:40:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvAf2GqovFU564Mw5MDKuT1rpqSPUcXyIEixZVTGaZCbf6LdPk1MM133qHuxIzufApKOCg2zOJyWPbS/LRps0/bAiZja1hSjamM4o0n0ZUcqqkNTAnkNmAmAyVmEKcSVuuA4INhCaUJJpa9IzYvm7qtvLGi7qG4KED7PpkIQp+NgEpy52AGDnO3O1f6O/JPB9b0PVkU3akU91gXrSMPNIlYLSaI3l6JztJO7LjlBzQkpPRkjG/EvKz3fOUUAOenK5+DcAuaa4u4ghoiB9tYu+7hmSOsP5JQMrFkJh55sD6auivTkF1Z1a5QJHunJUUcs8PHf9loLgut4LAf2W9DAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XCaWGvIjv8Wfblk/1+BkT11ULUPLZ92nLmatgus3pg=;
 b=cqwAooXJ/4xM4mVrlBWVtAjgIbU7h/VTn2e2L7fA3xkG8pLpaevAWUJUE69yGR+8uRyDgaW8o/CsKaCDUDHTRl59S+OE0tV5kOFFhKLVbe2V859u4VZfhkbdEmGOcPz3iG3H33/Dq9h67XmkX4u43OwLoH9S/p++7tjnZjsW6i28sKS5lCeYCBVg5+hM97VIyITxYY/cwvsSSTwYSwE5s1HlDlsotyeCtPaX5hZB89XrF6hqcYLbcpb8SSyUJtR2+Hpg1zmmsvxZ1qr5sYeJTFapBS2rU2JQisVPKSetUiNfiB1URncqtgQECohjR8Sn1TsFsC4GbZhJXPI/XgKAZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XCaWGvIjv8Wfblk/1+BkT11ULUPLZ92nLmatgus3pg=;
 b=aiM4yhOR+tbeRt70Efd4QOi7dlnB12MDRqXz91MZWBOvSR8f1LO89NpkFr8YubMcJOs9Qhc/E6xOMRyNyCytbSZbPQNmTBIBY3DtAR+fTncsQD112/abjNiYNRPEORFkV2csDFcYRzug4U0bYF9Gm6U0gR77chgEWUGKt9SBDkw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV1PR08MB8499.eurprd08.prod.outlook.com
 (2603:10a6:150:83::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 17:39:35 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 17:39:34 +0000
Date: Thu, 3 Apr 2025 18:39:31 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH 1/3] arm64/feature: add MTE_STORE_ONLY feature
Message-ID: <Z+7H01Gn7sLCxpnc@e129823.arm.com>
References: <20250403142707.26397-1-yeoreum.yun@arm.com>
 <20250403142707.26397-2-yeoreum.yun@arm.com>
 <0a430cca-a473-472b-bb1f-fdf3ed99da47@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a430cca-a473-472b-bb1f-fdf3ed99da47@sirena.org.uk>
X-ClientProxiedBy: LO3P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV1PR08MB8499:EE_|AM3PEPF0000A791:EE_|AS2PR08MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: 543a6fc6-cb7d-4d0a-5496-08dd72d69466
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?qbyxbom0nZ9aNQeq+Ps/k83dyLTZPaP+11fJtI/V96tSKhbQVh/vX3B8jZSz?=
 =?us-ascii?Q?O6xwyGZMcEZKHwQWad7FUj6nnvo1uYYpTY435nA96d0fnErTaj1vVgHAxgKK?=
 =?us-ascii?Q?sBkIINkilcne0hHukeHJw0xKE9jMyGLMIzBVeKlEJDGxn4xU4wCN1S/7+/TQ?=
 =?us-ascii?Q?cpS9iJVDoknn2NSTKVanoJZ/dDQrDSTdNx4eAoRm+vbeTjodaSYjwXY8BsEN?=
 =?us-ascii?Q?e171T1Zj7qb43SZ9SJJR+Aw7UUGjLZlmJAnLPh9lFTAuwQ0UNmMzgOqcQKaK?=
 =?us-ascii?Q?Gm15gC7J9hmxS7pim/6t1joVe83vmKf7THNOvUGKYIelT70yiGDN1WRPqv1b?=
 =?us-ascii?Q?t7HsOAFBxDmn2h6cmt14I+vq4pI37zNM7Z2jRDvjAQWfTt5tIJLyQ9lyZkGf?=
 =?us-ascii?Q?uBe/KFgYIWYa8uuGvSHFxMOy5TDBFHq1VgS/mKURH7s+4RDf5e5fDFJ0Uinr?=
 =?us-ascii?Q?Reb5tf77FHBq7Sxyz80vQ+YjWqA4InnrG2vhZYW7lS+I8MJwSYuesieJJx9+?=
 =?us-ascii?Q?73xx2ZWG7862ZWKNYcXwlrpqCVneq1AjSBp3iiq5yuvzsveK65YcN9gLhLty?=
 =?us-ascii?Q?ZAYndGwdWBODu+Yk2EwBt+gegmJ8lb1bfBM8BEXXCKnscv9KBKOQ2N38NKlz?=
 =?us-ascii?Q?DiF9MBB2wfM9Z5McCMS1TRauurrvgwYSnTD/plVn1EKaifCdnyzJMIR+QztL?=
 =?us-ascii?Q?1ydNgHI7ICHlKK/wV6EdajS9PP8AraAbOB27ymiybj4QfLzTVbQxGgICVLra?=
 =?us-ascii?Q?lDN38tuZCzZ/kHRfOvHHChMRUSoC24nV555cRg9WS2mRMEt3U+MDtiG7HUqD?=
 =?us-ascii?Q?00fj+z76piL2wbWxaX8d36tbOALuQMBX77/1dOJY8ruX+L9Psa7AF/t/vP7J?=
 =?us-ascii?Q?RAv4ErvlzuVX/7tY1iEW+nrFVKFjnDlnNn10GExy5hk9SKluOnVoVI7hc2G3?=
 =?us-ascii?Q?cCQtrmc47rNZDBAhzrRq18fcq7JZRU0uqHpB/rrx4Mzxd4L8stXeBtynDRE+?=
 =?us-ascii?Q?gRO/TKgu5pKaq3BhPTSLCEsGBNcrFDOJcHmGk+lh5A4M23WT0WTtLJX3ojcn?=
 =?us-ascii?Q?Gc43kgnYe8bG50Pjp/zzMyhX24eWgCdD5ryBvT5kyisafImWRS2qfXT3kVPE?=
 =?us-ascii?Q?90tXwmkCIw/BJ6fiyWNaWnbIy9QgcL6DU+d22kbpk18daqF753oIY46JfZmX?=
 =?us-ascii?Q?RkWOFqn6P1tVyzB6WGKakMJuS7TKGeHHm2/8r+0mEYuI6ioHm11OIWUFIRmw?=
 =?us-ascii?Q?ZbBKHLMSiIPZZohFlO2J1eDIpmmd2Nz5bkk2fQHv9hFc60OU6o+iFdGkJWNW?=
 =?us-ascii?Q?U0zOvmh0v7pTZBOJobsehbFIgxUG2mH+PMH3oiQPZFRxyaBUAf9+9xBn7nDn?=
 =?us-ascii?Q?nSLOfdOvFuU/1wsXPV0lO8YCLO8N?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8499
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c6a2c47-7b40-474b-e678-08dd72d67f8b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|14060799003|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YbUbPF1CpSKPNW6jLIbwD8E6kEUBn3Xkct9N6eceWiuOKguqbevjgC0bJ9OS?=
 =?us-ascii?Q?xPri4mMjYWAXX3MTEqk2LSPLiczd9Vx9ay/DAYEQtevmlkTcSVD+x78kCJdr?=
 =?us-ascii?Q?egifRENL66GZYmOx0hyL66CZX0uyAXUIysvXR+9wa78anH104taWQsMlHh6L?=
 =?us-ascii?Q?k889xoAyGHGYclSebayZzdp1yCddZHUIoO/khimty1aSMW/HS70g9fVitG9Q?=
 =?us-ascii?Q?a4r111hfaNY0+ejtDrgvSegGSY39qjSd/ZssHTswpv2L10yDY98IV1sZVFNo?=
 =?us-ascii?Q?R/SGpHSEz5KYZZB6LIA4cCIAajSTutIP14jnfIxvh9bz40cSVK/13WxD9god?=
 =?us-ascii?Q?iAUl0MONUdVcsMQ4lHsjItRoOcltiSJoaBgxOylR7/Kx97CIohpLb51McHDb?=
 =?us-ascii?Q?x9IWNeLj4AzyqoAbnS+FGXnTnoz4YHj1yRPrr3mOhkW0cu4vZ3xMH0ivF/6P?=
 =?us-ascii?Q?VqPl+eajNlPA2wcfQRqCmhJC1p8PpzZXYqGYWS9oYeemV/+rP59tcyKCb3T6?=
 =?us-ascii?Q?kpxZLHdFxtBV7oclGhxpDrjRpeJ4GkgBfvjsVeupBVtteY+JhEDs/T+U8K73?=
 =?us-ascii?Q?lnRg81GtgvJl/UpxeYVq0SOty/aOSquc6w4OGXh2vbedQKJguK293K4K14j4?=
 =?us-ascii?Q?6j2Ml0cOe0qh8IWqpJcV4R/t/ttRUbiY0gEWOY73Kmj2Y+GW78GQg+fpODfG?=
 =?us-ascii?Q?MTN1k0a+iGl8rjH9f3WXSuJNJUQe4nVrQJyaAqQiCJQGKdP4skoXwpUKYniM?=
 =?us-ascii?Q?z0LQZrV+8kMQtGcm5LP9hoii275STpHaXT9e2U7HJr/EI4PGR9wPgTBOESmL?=
 =?us-ascii?Q?jS5+5yi5Iza1mxaoSEJ12YMvYbAQEf5rO7rv8WOXfHWMl1gqMryUJ+yLCAyk?=
 =?us-ascii?Q?ilGH5k4Aomi28bZ6cvVXyLfFra//NAD3QSJlCykR3IJM6To4UVirXi54keO5?=
 =?us-ascii?Q?8LAZfNksGnMSI5jA3Kc8I0xdDfDfjosMVDmKtVqUaniW+rN+Kf1WH19c7vhK?=
 =?us-ascii?Q?FWbCW+HAl8wLG2EM46YV2mDWIYPoRhmr8cONSdNrYX9td+mee0kdodj/HJ7F?=
 =?us-ascii?Q?blCSJGQb4RRzxCjgm3/VBPWmC1xtek6C6CP9QkOnpXp+YXPYwko4goCQ4cJm?=
 =?us-ascii?Q?54N34A5X8lCjlBeZnc8ENRj0d2EyGAz55JeTzgoQGDzzVQY8PKUppeEpIeUk?=
 =?us-ascii?Q?R86IrM4wdM2ECsIdkiKWHW+KmB5HdOfygVtBTBXtMPxilS0/U7jJmHVrYaJP?=
 =?us-ascii?Q?Y2ksgrWiv9YhrdDgknGeMM018KlxFjs4xuG9ON4USl9rU3iokbz/SxX8mM87?=
 =?us-ascii?Q?eaXs0EMDJCOXrg8nBZJrDXHlUcmn0CZEMf3tpBBzRvbvhmCtjODGbvjwl5Dk?=
 =?us-ascii?Q?m/Ts7j5g9swCoGTCt7p12/OoX87qPvxxFFkENh1Io9l1xp3NPU8O6HbWy+f3?=
 =?us-ascii?Q?+cBd9RsiZtttflAbM23LW9aIeWHkZ8G20uxPvn+GOKRLRQUTfVidYjoE5CYv?=
 =?us-ascii?Q?IKNarnH4+X3oTDY=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(14060799003)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:40:09.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 543a6fc6-cb7d-4d0a-5496-08dd72d69466
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8479

Hi Mark,

> On Thu, Apr 03, 2025 at 03:27:05PM +0100, Yeoreum Yun wrote:
> > add MTE_STORE_ONLY feature and HWCAP.
>
> Please add this to the hwcaps selftest, and to elf_hwcaps.rst.

Thanks. I'll add.

--
Sincerely,
Yeoreum Yun

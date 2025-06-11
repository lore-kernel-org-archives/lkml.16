Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C567428C855
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651128; cv=fail; b=JQ3t1hGRD2rhPWfV76GZBT1x0BonTADXOGozTZm+8vHYqWl5x74UuOwOtQLs9bArSdvh/BtVMs5une85IbFSfnmM/kOrJu+OQvceTPmEU0/p59qi5EelA3SVpTaJYwlYYsG5BtWrGyybEDFZgAHjfLYU5xtCQ9lMzwppKMOhm+c=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651128; c=relaxed/simple;
	bh=sT+KL1hNRDnZJsc9ye5tNPijAEU7SpTzLe1Qaxg/1Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S3j+TQZfrwZCxewVN06P5ER286RzB7SDeoto32L0o5NBiB3NvEhf991s7tXUhRrD0bNLeQ/RzNKsHVk/G1JIPVNc1y7vjaqBvq+SsKFd6C3bdaJNXysbuG6B8T8MFEMVhViqIyedQCbdIWTFY5SquZHRjcpaRopH/+67rEz/9r0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ceaeh+gM; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ceaeh+gM; arc=fail smtp.client-ip=52.101.70.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ceaeh+gM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ceaeh+gM"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kI6TJR5VAXkKFvQEC5SWBX5IIsyt+Hbi2pqB++YmSqRZKes1dV4FoeeU6ahSVgJpjChmhxQerMP0C4rvAfjQGzmEGfb/lhxQWG8Vq1EnxlBb0J6r7txWbhHkmjzTszjZJv08NLQGyS8HViwJKlAXTSHuj96lsncN4AW08yfhbjidjmQ8K9bz35Tb/bI1zZrXfxi1nHONwZ7ExBXYMkaFcrqakXRlAhxOoqj9sZfvvWE4ufv4dK+CikUD30RAyHUat9ZxnVxN2O5igpoqcjoD5Q+D+6VE7VAtJ+f98LcBelSZG3j82hiy63T4wWhL4cNb9AwrYDoX+x1WjATrsehS+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxTCxy474wIYG8a6dpaASV6tjdRZJz94qbjMl9DuRXk=;
 b=CiCOrATayrrFTXDLWhalEeO7VE2l/LfbGSuVcZfoCXdQ65dkOgx8fzzNxK0LYstV/0Xeu8U12AVL6MtTGuzaxVmJjJacV8IVkvCvDSkQbDNqTYILlY28sXFkB57nZ6Rm3oUlap+w+LMJ4ihCPj09//Z+wES04rh3fAWhFRQ6I/BAijIghwUpyYLz7lEbVhphxJjNlWXJ3V0mj0tOKICc4oIzq/wR+4dSTGLkUQQfmIk3n9TojSsR0bv3/zq7TfywIZO2Be4KdvYNOdz7iv3Nb8pASLZyNASx0N64MUfjDdafICY9T3Y7IBjp3gzxiMnPk2TP+bdz5eR+xkdn/KBn4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxTCxy474wIYG8a6dpaASV6tjdRZJz94qbjMl9DuRXk=;
 b=Ceaeh+gMuRTBPsIg2+CkOmbg/uo66nJmp6Q5RLQNKH5Qgheoy3StFTW7m8gHmp9lwb6RgQ6HmynDr+R65Ga5/o9+pKn2FX/HreuW0eXQOFXsJ/+k+tAwA3vwEVeH8UJ/zvmXD5y6OM78XT7kPFYe4+hVdovZ8IPMj1NN//DoiuU=
Received: from DUZP191CA0068.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::29)
 by AM8PR08MB6483.eurprd08.prod.outlook.com (2603:10a6:20b:315::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 14:12:03 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::7a) by DUZP191CA0068.outlook.office365.com
 (2603:10a6:10:4fa::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 14:12:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 14:12:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2pkMmF50ZKGBhsnjP/JT6Grr8yyO49Gn1XSgGAVV2cZ698AAS3PaqAEPSFlbmpoLL4DICjpMGzMiDGSyM9xUr9rYT2xxIf9S0JgBhNm1Ouv5Zkex3QuEhYPdbVLrIuEeKuKWkipmWmrLlt6tvpGKHmIxO/neMaGe4jRnRHTbfU2zPm7YS6Nw90xC0UNCrqoW8OaA+eVZnmwvsbxPyTnwy10a9IA31eI52Oyvg1HZ/gKYjJgg9kRYslNRBxBUQSDM44egobXWs3TNEQmfCm+Y0ubd82BKOC8gBBTgbaokPVIGsHIUzIPAWbGKVIvRVpVj20hMN4mDmWrfdW0edEbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxTCxy474wIYG8a6dpaASV6tjdRZJz94qbjMl9DuRXk=;
 b=ErB9ShEcZruMSUcnmQCzZbXMuDSutcpsXY0UZZxXKzPPZa2y6mcHfbzQZGV2xwhbrcKxmhAXaxLLXhYRL7EHISRQz+QsWkAMkKR4mm2axP6ZUur66PBJXrPANPLbGExTxgnBoKsmkDdv6tn2oEFGp9lrXcBFHPiuvYol+eYjp3Rnpjd0ZN4GgnSYL2IYUIcgHBUz3l1RvT48eSWMuDZ9845Q4GrRT1vgrs36sbd8CgFiFkS6IMDesB2gbV3hlAbBwhypA9+Q6TYVRn3j5KUimH4wdJsTHJIAyJQ682ryBHDZhxUT/fyI4qFlDx7ZU76dLFD5odBbUBqbKUNIyMCQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxTCxy474wIYG8a6dpaASV6tjdRZJz94qbjMl9DuRXk=;
 b=Ceaeh+gMuRTBPsIg2+CkOmbg/uo66nJmp6Q5RLQNKH5Qgheoy3StFTW7m8gHmp9lwb6RgQ6HmynDr+R65Ga5/o9+pKn2FX/HreuW0eXQOFXsJ/+k+tAwA3vwEVeH8UJ/zvmXD5y6OM78XT7kPFYe4+hVdovZ8IPMj1NN//DoiuU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU0PR08MB9678.eurprd08.prod.outlook.com
 (2603:10a6:10:446::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 11 Jun
 2025 14:11:29 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 14:11:28 +0000
Date: Wed, 11 Jun 2025 15:11:25 +0100
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
Subject: Re: [PATCH v5 7/7] kselftest/arm64/mte: add MTE_STORE_ONLY testcases
Message-ID: <aEmOja7F5afmuosj@e129823.arm.com>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-8-yeoreum.yun@arm.com>
 <c613b941-063e-450f-a38f-c16248e95e81@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c613b941-063e-450f-a38f-c16248e95e81@sirena.org.uk>
X-ClientProxiedBy: LO6P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DU0PR08MB9678:EE_|DU2PEPF00028CFF:EE_|AM8PR08MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc1496a-abd3-4d01-7d43-08dda8f1ef67
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?DwCeYcmUw/cgClaIedTgpgbz9s7BEjhWiH/WAeLu90Pwk34BGbuq8XK6/QBX?=
 =?us-ascii?Q?hKl2y1H7p568IzG/i2QIoHm7o82fzOENaXhOlK4q8+0Iw8hB0i1uxN8ieV1C?=
 =?us-ascii?Q?QQfJI9rehxaEMhHGvpF2rWWxR8pluHeD+mi3/VXwk5K2c54cgANQ4IZc0sBH?=
 =?us-ascii?Q?Z6UVa7Yjb3Pw0OhB8x4XG2gZQoQEx9FhiSvqzZT1wafG0udqIZuXZoa04RPA?=
 =?us-ascii?Q?wHDKMY+ekmDjW6GAE8mo1mNjBUHZ1SGfFuvMXZ38izt55vJAquDCjuLzmbnP?=
 =?us-ascii?Q?4idARRjDaSpfWTSWprOIF6O/jmFGWj/8BnJg1o4wMA+uzqwQKYSSVYzWzeCY?=
 =?us-ascii?Q?DIVRG34+GLdMClfToGCJVtmZovT5zrO43wh/jjcHQTOOHqcEv2oCC9pAtStb?=
 =?us-ascii?Q?s74uSxDHhw17V1tO1B6xb26vEV2L8SMctY4QBdOddCBym8ZN/Hf0Jy2cZmmL?=
 =?us-ascii?Q?V2ekh7tA++Fepxbo4ihuiwrhyO4CRJ/sR+TFY2bJov+Q1BuhQpImD/kSN7kD?=
 =?us-ascii?Q?Qx5UxFT1TkFMAh9rJib1iyxsNl6twhs273SJ54nghIslmpkBlqHxDr2ArCYL?=
 =?us-ascii?Q?xm0zE70tN1Hj6ZbR1Waji3fpB/KY5vKLgb+hA9A8Kf7obDhJYP1CCoPlt8aA?=
 =?us-ascii?Q?xYnlhCV+DFO6UAKeApnww+y3EI+fqrltKnYJvxfpsSrir8hJXwgeBbop7i/U?=
 =?us-ascii?Q?buqxu9XWwfcZuTreMgCEqBbMJ/3cB5sE1eAMs5TYxZOrXsCyp/Y9j8ZHTWr5?=
 =?us-ascii?Q?E3/9KrHgSW91TJej7Qst+4pp06Tga6a2QEWUAvJkMr5FfwsiTon4IyYLlU8f?=
 =?us-ascii?Q?4HyaELX5DXpbWgiaccWdS6jn/hcu6Jtlr9JCuBiMz8OxdlCsbZT+W6Qft3Eu?=
 =?us-ascii?Q?0PBADrZ8zOsx3kBxfNy5n/HurHrqncg/iJubRLe4EApTIF3u5i6a8Ct2zBx2?=
 =?us-ascii?Q?LPuOgocWlaz9oZ/lsVEUeTlD7EnprCDpjFeD7uf/HOci0FspAHT0gkSfh6Vy?=
 =?us-ascii?Q?i8Ja/QHd1ZYn4FR2yOLuv8+1aFcSi6b+hGLXYM/S5UCPRnhg50ab0kdC+XS5?=
 =?us-ascii?Q?VOlhWJOW1M142nj0LktGT93ijDBL3nit6J1W5wa1fvpNqaVP53JZwv6cSnEh?=
 =?us-ascii?Q?noZYXAonvH7z+A9pmrYrVD1WxVsaLX7fKUweiaPvJBt9o7GqYB76q57akDl/?=
 =?us-ascii?Q?Zs1d1YZEVzKEmG36z7ZDz7HG7XOlhlUFw8bHbjZDthU7sg/qXvFSqplzb7IW?=
 =?us-ascii?Q?FxyyqzK77edHH5/zdBpYyNREYFZ+2FEqNqwzeO6Ej+ZpRWyDG99+C+C/9c4i?=
 =?us-ascii?Q?4QrOAPN2V00DFiZkjP8GfOE2HJ+P+ol70OwUP4RI55RtqRaLdJSGHxJG7gI5?=
 =?us-ascii?Q?ZK8xbUIXB7TH83NOkNN50lSU39K4jFJ4OVCRoXr+oAJk02mfQ+Um8/uKOZ+k?=
 =?us-ascii?Q?u0sx4EPOrBg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9678
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd9182da-c6dc-468d-d586-08dda8f1db7e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|14060799003|82310400026|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1JcIJAtny/PXwa0O3dggvpW8f6O44wo0ZnMdn9RTIOziA2cc8fqJh8bcBnxZ?=
 =?us-ascii?Q?D1H5zqhhGUi/qVXxKvHt2gfosJ2qmc0+F1+NiXNPucpQZErJI22PHn1SYILj?=
 =?us-ascii?Q?64fuOZ/YZdnRdbYvkqX6GGKBcSV8oq1oieTzPwuPpJAKtYP0fveg/k+z0O9A?=
 =?us-ascii?Q?G+vly7S8EtLSEnwRPBWcNrsgCyzqrfdGwK8IYzoGQN7ab2t+5SQK8OsWNsVk?=
 =?us-ascii?Q?BuouQcaZIyyaqRystMfSzw31e7Z5Y/gwfLVqXrU9XI105ceA7Qr0z82mGOp6?=
 =?us-ascii?Q?VyzIdgFgkL+fwgZ4Jpd8LSFcCpm/nalVT1ezszLB6DalGDnM+h0ALolpPMvQ?=
 =?us-ascii?Q?CibP2L7z7Id5YEvQYmuAspttdA14UGi/TIq264qYBm6+9VAZO3SfaSu03po0?=
 =?us-ascii?Q?x85tp3ZOsgdaAz8OiWKrynnf3LdZqu9dAlrpDCDtdntpKP6xnmuIz0PI0/6p?=
 =?us-ascii?Q?IB8xD8MGeL7ZH0fVUyosKwWrik40Qajn81shccTt/UzYPGulWVwLWkZ/K1Re?=
 =?us-ascii?Q?uXaoPGXRaZtDOjWHj2TPLtxQBU9FYrStGEMKJzF92JZmoJSgUZNh40ZidAb3?=
 =?us-ascii?Q?dbBag8dS5GQWI22udr9o4XlXTVFnOcZFAqJRJt1zi+IFOvoAhhUmFjhznszk?=
 =?us-ascii?Q?Xwo+10iwBPBdEZPb5IFQyrnabqz5qtHNvdUUJS/+mzKk4ddiWKoZmSm09caJ?=
 =?us-ascii?Q?5N2bw3WNtqFrGHuW5DTLdH1hLijO2wAk3GTcBZNwYydz4QcHXZhItggMBHYt?=
 =?us-ascii?Q?IansYULer2UPI/fWO563KkIFkuJ+v3Vq9t7Wd3KQlRsfL/oaCmNpq/k616Z4?=
 =?us-ascii?Q?XcoOr/JMBxey448UdLRgvq0xH2kAq2Kh7VpAeXuLpaEXXxI3TuIKSWw1jnG9?=
 =?us-ascii?Q?1P5G/1Pol9QRuHGdH61NbCP/5bWrB1iJFEqm7AtIxC3OtcjQKwcXxZ7MfoOf?=
 =?us-ascii?Q?aQc15RiyDVd62iiwk80dxwM/8/C8FzSe0VKJyvr3KlPtuIUjOm0wHd9XNYaq?=
 =?us-ascii?Q?NVlm9TTGMUW0OUQtLaZCbMOAjQsNDPfbfC+rav0zvHYau8EfMuGZJQdT9wFc?=
 =?us-ascii?Q?fOTQNL3WIRmr1xBZ9qpunBUVZ2yrRBScbXe4CakhmZRPf1vUywSnby0gB6FP?=
 =?us-ascii?Q?tPQ0aIPiWE2lilu4EhJpIufJGUF9LpVQ/aruNX8o+2mCtlcbJ4yyCwU6XgFU?=
 =?us-ascii?Q?QRQSdzVKrBjNXZ22/PAuqWCQbimRHnh9gaYAJXaMJEkgv6TfVfVvZScsa3L/?=
 =?us-ascii?Q?IC3oSKV8b7emvLlWwjWAt+YBKKAyPUTUgnw2RinxQcCd/25yOuvzqK1WzdRr?=
 =?us-ascii?Q?mx0L/yAVLnt6oNEDB5zT3ZqlNs3I3q6ynfCob+JJUVMFEJ3k9MRUoaZ49m0H?=
 =?us-ascii?Q?5fd5fCGdWHzVEEtEDRhR0g5WC7a5PGQX27FDPim6t89c+BwX5ub+y89JyJOC?=
 =?us-ascii?Q?dNw3o6PV/SlpJh6e2USSdfkdI3HeE/qW4t6IweDOxurpm9SrUgzFdw9l6B3M?=
 =?us-ascii?Q?X4zIEs2rr4Q91qCIEIzXh/P9wfW+uuDnXkXs?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(14060799003)(82310400026)(1800799024)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:12:01.2626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc1496a-abd3-4d01-7d43-08dda8f1ef67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6483

Hi Mark,

> On Wed, Jun 11, 2025 at 10:48:02AM +0100, Yeoreum Yun wrote:
>
> > @@ -144,7 +178,7 @@ static int check_file_memory_mapping(int mem_type, int mode, int mapping, int ta
> >  			close(fd);
> >  			return KSFT_FAIL;
> >  		}
> > -		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_check);
> > +		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_check, tag_op);
> >  		mte_clear_tags((void *)ptr, sizes[run]);
> >  		munmap((void *)map_ptr, map_size);
> >  		close(fd);
>
> check_file_memory_mapping() looks like it also has the issue from the
> other series with skips being upgraded to fails, looks like there's more
> instances.

Thanks. I've fixed this in
  - https://lore.kernel.org/all/20250611135818.31070-10-yeoreum.yun@arm.com/

> > @@ -106,11 +115,11 @@ int main(void)
> >  	int i;
> >
> >  	ksft_print_header();
> > -	ksft_set_plan(5);
> > +	ksft_set_plan(8);
> >
>
> This should probably have been ARRAY_SIZE() to start off with, sorry.

Okay. I'll fix this.


--
Sincerely,
Yeoreum Yun

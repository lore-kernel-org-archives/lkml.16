Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CA0266EF1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642419; cv=fail; b=He7X/ziG1BqZQOmYhsEsbGLuQT4M8ZUp0vV8LbKx20kkz9hIBjgOTkKNcwzFfq5zwfMYNuBynmggULb0Hc3AsWmHtImW2ZoN8KzMm5onDmkVVv3ICO3EFuXoWCcl1irZb/PUErf0ETKFyqosUwReSf5zCfgxVhwhLLQpc47O7ws=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642419; c=relaxed/simple;
	bh=Rf4ow3yRlUi/8dA5LCiKzsjV5qAxo23MowF9NNCnDGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h8/YdjnoaZptRCG0EMBNnlWM0p5NmA1CAlrEK2VG9PkYEGTGVf6poLQUxLMkiC7fct63KmbjJhNpmHPW5r6SoTLiWEMN45vs0Le3hp+GxhB/+rK3bdsRP/LYz1/muVFdJHPAhVGCP3UX1yvPKzUlJwsId+dqbveCRDo7u4/yYFc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F35iygEL; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F35iygEL; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F35iygEL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F35iygEL"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aj1H7efdLfX+QO4Ik9b4MJQrJHf9ti/3ax8f/RT31wXoLXVQj4jJsr6ryk/7ovqrtLTNQVtKjqcF9xYIvv55HO8k/EbErUyKrJrQ9JLpgr0uYT0klJojXrQ4Zv4wcKoC2/Zfj9QOmesXFCZP7Co+fEWRfREqHXYXW7EKLk31A3EItcCEYoC3EeweypVr5aCtB4GGWzRfCaTVVgHCd+nAWKlo+1K5K3B+kK3SxVUhXet3HJzPAgG1C/nufleAAkm6nYzFL5NEPoCCPZxwN/2de8K/0Rjpbyy3V9G8piMgJnmaHu9fYw5UUv/cicpbcEjX6jFEFWSGMKegpr0lmwrBwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMFnlOtpRbbgEQx3VkDyYQyuJ9hGjtIf/g644D+Motg=;
 b=davZlhsAXuQbCYGn1+ejLK3WQyjl3tXjpxCgCviYjemVax2NNk1l00ehc7HsauPoW44jicyllLsdvfDWsAkpIBU2h132h5OLu6bNhNHkzlMEtczdRHJNp8YcJBfV5KIUR/AdqcQIpMWDUUQnA6EiEA8FawNq2dN8n9bnvPeW+VnN7xFNMc5azW+xLhBeFNdu/FeaBN7FDT8oLBEYjVFPsZP9HbfyIwiYykGBw38xYv3paevdj5HST4+I+BUkxj9g2DL9U4oy87RPdR0wwrw1aqanzKqosFNs2wwAVu+KJdamvZVJdUGbrER4CNpVgvd1uxkXgHV+/MY94fjIaNp3qw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMFnlOtpRbbgEQx3VkDyYQyuJ9hGjtIf/g644D+Motg=;
 b=F35iygEL54HfCbo5vZA8y8s39G6uy4ktAO0PNMEA+I+RFPocc6RwN/c5r9I02lBrcrXr9GG6H0y4Qo6CoW/OjlytsQI1OEtBeNrR1wUlDKA/sbJr4tusY5urOXHFI9XDVEBFC8CIZtMc+7MhTAGDVcXeoKs9+CyKdJoeXldcZ7k=
Received: from DU6P191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::29)
 by AM9PR08MB5985.eurprd08.prod.outlook.com (2603:10a6:20b:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:13:32 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::ae) by DU6P191CA0058.outlook.office365.com
 (2603:10a6:10:53e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 19 May 2025 08:13:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Mon, 19 May 2025 08:13:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwsWrCkPxhzMTroAjJ3QgDLBOjP6FvPcVVz64vvhwVh2+QlZfJZ/2mJk5h5PkEE8x76CxFx66XAFihGlklZyGPFEg6RRXE7jH9teSPSwOv1FatKY6PzIpKZtTgzOts3BlCMDB7iol5TcZOkGEYti81b5YD/xa4mNV5J57QJ5UxZyBXjs9H8WfT4lDZpDqkIBzNopcQWvQfCRisjCvELkxCiweJMDeu4+WF2ZEDefv/kTXmYguEAljYBhvdkXVZ9pEh8WfxowSufcLnyiYy4PDy8xv2spEcKBmXSjKXBv1e7zv4BXsG/LdcJPQFAKv2DLe8bABvrVy4PQibMmbicoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMFnlOtpRbbgEQx3VkDyYQyuJ9hGjtIf/g644D+Motg=;
 b=DpPDHuk+OkAWlBb10rMIzR0bfupLAQ0LtLY+frWqiBPziuthvfh0vc1iYh2V1ac+w0lC+u/oNeRZERki536Hfm05nzfoQTmowQjYjreJFmc68I56s35UEVTrUU+XD3CWetgBNAwyZDI7ApLI0CpR39QLMK8v+z/bB3dtuv6fDFQO6hULCelp4HZA1R+O4eZYQxAxdQpfsNSQV6FVnKAqOuGI2KPfDScYckFL9zo8EqNAKR6KL97cy6SNIeTErr1gW6isw0PV4glnceyg0ZMpVpCN19PWs2XE5jd166HO2n9TbDcJHu5GLUAwFs6C49pJIZ++LPi3+8/njLm6g0WIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMFnlOtpRbbgEQx3VkDyYQyuJ9hGjtIf/g644D+Motg=;
 b=F35iygEL54HfCbo5vZA8y8s39G6uy4ktAO0PNMEA+I+RFPocc6RwN/c5r9I02lBrcrXr9GG6H0y4Qo6CoW/OjlytsQI1OEtBeNrR1wUlDKA/sbJr4tusY5urOXHFI9XDVEBFC8CIZtMc+7MhTAGDVcXeoKs9+CyKdJoeXldcZ7k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAXPR08MB6414.eurprd08.prod.outlook.com
 (2603:10a6:102:12e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 19 May
 2025 08:13:00 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 08:12:59 +0000
Date: Mon, 19 May 2025 09:12:56 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	broonie@kernel.org, anshuman.khandual@arm.com, joey.gouly@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, frederic@kernel.org,
	james.morse@arm.com, hardevsinh.palaniya@siliconsignals.io,
	huangxiaojia2@huawei.com, mark.rutland@arm.com,
	samuel.holland@sifive.com, palmer@rivosinc.com,
	charlie@rivosinc.com, thiago.bauermann@linaro.org,
	bgray@linux.ibm.com, tglx@linutronix.de, puranjay@kernel.org,
	david@redhat.com, yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/7] support FEAT_MTE_STORE_ONLY feature
Message-ID: <aCroCLuvhwnrnfjR@e129823.arm.com>
References: <20250507154654.1937588-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507154654.1937588-1-yeoreum.yun@arm.com>
X-ClientProxiedBy: LO6P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::15) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PAXPR08MB6414:EE_|DB1PEPF000509FE:EE_|AM9PR08MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 77fa3dce-681a-463c-4909-08dd96ad0b92
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?swk3gnOr6RumYtzTcqpbgUwkt4epC3vWVsFuZtSYJ3iI9AaI4su4USS/KoE7?=
 =?us-ascii?Q?kqp9SImz6QrnbwmiiwTW++KDE0qFuABODC8tWnkRNU6mK8OC/5PydQEWbsnl?=
 =?us-ascii?Q?5YdOcpsdwn2pcqrbPGQ0ZLBYB6F9YVp4J5T2ChraDeT7roVL+ZFx7kN9gr83?=
 =?us-ascii?Q?eRdq6Dx9D4aEJSw9UEhhg+7BDcFRW2LAYQIvrsEVLmna10VqQmhFvrzZFg0c?=
 =?us-ascii?Q?bkQgvRjnfpIq6BZMykVglEm0P9emA5r75BbQg7RiHmSl1nd5jw/QznCEwF1G?=
 =?us-ascii?Q?w76cD9BnBIJ3Pt0Ryci/R3YS9VzB0qYhC1Sa9BrzRIBWJ+9tdpXj5VVYqsPD?=
 =?us-ascii?Q?i45KY/QLebwlZvMrqfRLZXu3HyNFVXUWtwQsnvw+OoRFNydo5qnnJp0/tucN?=
 =?us-ascii?Q?3wfG5TvnYPFoQqOq26TQtDdk/2AgDcZNai09pw7VCyBIZKvJMqmT9Kxrp4B4?=
 =?us-ascii?Q?Wu3DiWvnu+tnQ4rfe2KDIu2cbrLGK0xz+vLx6tFC95UedN0Q11TzVrnUHfU4?=
 =?us-ascii?Q?+yKBZv4uKwmVV/viFvXd4Egt5bol0CndUG+cpgYKYmVXVHs3sy82OMmRwyjr?=
 =?us-ascii?Q?Ga+7vZ5cP4x7uA6cS2xYNRMpxaXe1rnZajCbkBfgSwTiM4YPAOoKwizq5Hn3?=
 =?us-ascii?Q?8xA5jEaWUd9qdNDej9IEqi5AQ1VUAvj/fUofp4PzdIbBsDtxamEPBiluab2W?=
 =?us-ascii?Q?fWq21acxijorxHqAfj+0WrZLp0ZTBT6IpUP0U+5CQ3ulItopmklpvfWKuKhj?=
 =?us-ascii?Q?AwkDewg6ZPShzuwp+okLGLgYH3/UiSgigcqlsc+/uE0KRSAgsEpVeRcEBSXa?=
 =?us-ascii?Q?bfe9v6suAzSdw+oV9d5a6pEexqoz/m6PCM/LiR/Cgw7ueGUz1D2h6JmLsj5p?=
 =?us-ascii?Q?s+vomAyhpnTZX2cVB4TOgCDXcE4oFd8dSQWLKKLi4+qI7khSmpWfjoQNQH0I?=
 =?us-ascii?Q?ol1ZtumAFzIpMSbGrH150vObQxmLI7Kld2BXgluXqnr0whzmezmmIPKvdUYS?=
 =?us-ascii?Q?TPaoHIOPACwVxvbML0CqiKYMprm1tiLVoazlpVMnNry4GEmTgTXOmEgRy6tr?=
 =?us-ascii?Q?ppxsgNAijujmS1t8vpMIiphGYjxkPq5iQhkBH1qHdyHPxeYkwi8QaqqKicHt?=
 =?us-ascii?Q?hhSv+BbCiedpW8lWR2lADBwUG1DyqJ2yd1d5QPxbOuIsjR/+EQPvFb5XckHG?=
 =?us-ascii?Q?GHPtkZlPUn54IsnQKuIc/qvxsIf6BOBP9fKg1S805l/f0JM0fDQsnj6KRjQ7?=
 =?us-ascii?Q?l5QfEmLGZPnC+EwFDukDUX3iqOpJqwQff/OvW8vk5Q2+l6k43CzyBP5ipTdu?=
 =?us-ascii?Q?Wb8Bdk9OxYxPyNcQ6M6YD2/ofZLU2hfphE7OhCY0tTsP2lg8vJH7jx6tNAfP?=
 =?us-ascii?Q?Wb6G0W1l/TCp/sSNU3b16JEuw/T/YWadmDh5cSkF7BI4lQmLC7BSr0m5UFWS?=
 =?us-ascii?Q?yfc+p3mtRuBVuFai6xFF8+UcyYunj2VMmfpwDEiKGqsGaILg7m/IVBgYmq/6?=
 =?us-ascii?Q?fztgjnXcqYgNVlU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6414
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9347d336-9170-4213-9888-08dd96acf7c5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|7416014|82310400026|35042699022|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QsQmay4RUXEtjyREvS7iIe40gthEJ/pxxNwPqqHsMSW/+jFnIEskIv4pjGa7?=
 =?us-ascii?Q?B3g5s+Dl/aToLf6yJEiZqkJMvORikPdtHVrqC5tGoKk0BK/PYMQgjuAbZcqZ?=
 =?us-ascii?Q?i7BgyopEeQmjS73vhu5yjMw7fCecZ7Ia1KxneSeuC5i3jM5lTdfRlVwbMWo3?=
 =?us-ascii?Q?rouFCRL7lSpjoeBdVycN1p9jcC0Si5wP3B8a9K7+gBK4ZulY5qXgW9EYI9sz?=
 =?us-ascii?Q?pjOvGcE/BjgqLnxMCEw4ZIVFyDU/EmvjUW9NrZTEM9QzQq83anG5sIH81pHh?=
 =?us-ascii?Q?eAOUDzgo7TFyLftOPQYcCaOTpPlKXulnJD4sP6Vq09oo4p5FeF5875ivbRDL?=
 =?us-ascii?Q?43/fAnQq08et4HdzZiAWLlDR5G2rWbujAR59pWi7dkJiC3/lRLP0QOYEEypD?=
 =?us-ascii?Q?jnIJx3Lzds/bz1veGSTKuZGrjoapmFCF0MHjkNlg+kZiwVXAl1zLULawqRnh?=
 =?us-ascii?Q?TBg3JQKYfw/HerpGfz6XMlzNzsngWXFLSNWJl4jNHxrWNtgyk2wWoiOTRVf0?=
 =?us-ascii?Q?/53qV99BRe/xR1rs8AF5bd9ypLD9WIZ159jTSVR1S66ZrjFKcHKJ4rm9AHBX?=
 =?us-ascii?Q?sc47q3AcxzcS2rxM4LG6kkSvByPXzBF9tK/M+QXglOQpeAPIZdT45X4+QvuQ?=
 =?us-ascii?Q?9yeCGLQ2QutclvctNjYdqxcu7vNo8utq3VF1GNYrFicBRixBM64wrmF2gy0B?=
 =?us-ascii?Q?19IpsXvHKAcn9LEDqt2SExgbzxPWWTQy0iNR09vWGExdlbh9RATFq7pivf5p?=
 =?us-ascii?Q?0NBw73UU+7whcbAayYgATlE7bRjgbSLnbzsWuAB791YI+RWOAAdg7AKl2ZNB?=
 =?us-ascii?Q?+4q2Ns8Z6DOJAdtqkHxlw8+5+Qb2gIlH7o4CVcwfF494cxV82hKZUuuf5xO7?=
 =?us-ascii?Q?41XxdLesiMpIQ3aXEkj4pUHu2kS1ZsANIEgg2YTPJNxx0I+T+I3IXCgUumrd?=
 =?us-ascii?Q?iJBkZthQVtSdBy9QCHoIqDYyFiFxUlLDE9TjNn+mlVDQ1PIeBqFLkoFMO8vK?=
 =?us-ascii?Q?Uvv9hObHerjYFmEEqrCqjL9v9qxiyp7zM5vWtDSngTHrYro6ffYGmLagpSVO?=
 =?us-ascii?Q?l1anQ0BO9QWMz/sf269eXntcpaSmdzyaGIkHrBjQbyxKC2E5lZxXGcp5MEuK?=
 =?us-ascii?Q?gyOn1rN9QByISuQHraqrdU3ZFEP+3G/Bco9bBU82JRF/Hz6NayTFNP1BEawO?=
 =?us-ascii?Q?vv3f938ovWMF+7DznSh1c3HxR6nycwkEir+9Js2+az4NHTeAOuOCjSsHMpFg?=
 =?us-ascii?Q?yScrwSrdyXTBxgnmzIUhYRHap7eP1izKBE9SY6T9D52UG7nj8Oo0KfLbnmCm?=
 =?us-ascii?Q?K9P/8TJIlfsSvhZ9Jgglr8pwcTxwl7fIVQPTGKZnFhmXqDTiiHEgchvawoEQ?=
 =?us-ascii?Q?hki27L6tJCQ0CxMznowVFyUdb1zOPaWo7Rqw6ywiP60duT2xaTtxyeMNB0dj?=
 =?us-ascii?Q?HzV+UR9KixCNq7Bp0UjMscD6KkgxImFGQZvQoV80K38zvems51UK7SY235kX?=
 =?us-ascii?Q?yjCwuLNpofLC+piVYYogWcP2mhrDvfN18yOHsV5Di5AjGIMfoRYYsla48wPF?=
 =?us-ascii?Q?Kk5uba7xdfOc+Jrhia8=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(7416014)(82310400026)(35042699022)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:13:32.3136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fa3dce-681a-463c-4909-08dd96ad0b92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5985

Gentle ping in case of forgoten...

> ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
> MTE is built on top of the ARMv8.0 virtual address tagging TBI
> (Top Byte Ignore) feature and allows software to access a 4-bit
> allocation tag for each 16-byte granule in the physical address space.
> A logical tag is derived from bits 59-56 of the virtual
> address used for the memory access. A CPU with MTE enabled will compare
> the logical tag against the allocation tag and potentially raise an
> tag check fault on mismatch, subject to system registers configuration.
>
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.
> For this, application can use PR_MTE_STORE_ONLY flag
> when it sets the MTE setting with prctl().
>
> This feature omits tag check for fetch/read operation.
> So it might be used not only debugging purpose but also be used
> by application requiring strong memory safty in normal env.
>
> Patch Sequences
> ================
>
> Patch #1 adds cpufeature FEAT_MTE_STORE_ONLY
>
> Patch #2 introduce new flag -- PR_MTE_STORE_ONLY
>
> Patch #3 support MTE_STORE_ONLY feature
>
> Patch #4 add HWCAP for MTE_STORE_ONLY
>
> Patch #5 adds mte store-only hwcap test
>
> Patch #6 preparation for adding mte store-only testcase
>
> Patch #7 adds mte store-only testcases
>
> Patch History
> ================
>
> v3 to v4:
>   - separate cpufeature and hwcap commit.
>   - add mte store-only testcases in check_mmap_options
>   - https://lore.kernel.org/linux-arm-kernel/aApBk8eGA2Eo57fq@e129823.arm.com/
>
> v2 to v3:
>   - rebase to 6.15-rc1
>   - https://lore.kernel.org/linux-arm-kernel/20250403174701.74312-1-yeoreum.yun@arm.com/
>
> v1 to v2:
>   - add doc to elf_hwcaps.rst
>   - add MTE_STORE_ONLY hwcap test
>   - https://lore.kernel.org/linux-arm-kernel/20250403142707.26397-1-yeoreum.yun@arm.com/
>
> Note:
>   This patch based on
>     https://lore.kernel.org/linux-arm-kernel/20250507095757.1663684-1-yeoreum.yun@arm.com/
>
> Yeoreum Yun (7):
>   arm64/cpufeature: add MTE_STORE_ONLY feature
>   prtcl: introduce PR_MTE_STORE_ONLY
>   arm64/kernel: support store-only mte tag check
>   arm64/hwcaps: add MTE_STORE_ONLY hwcaps
>   tools/kselftest: add MTE_STORE_ONLY feature hwcap test
>   kselftest/arm64/mte: preparation for mte store only test
>   kselftest/arm64/mte: add MTE_STORE_ONLY testcases
>
>  Documentation/arch/arm64/elf_hwcaps.rst       |   3 +
>  arch/arm64/include/asm/hwcap.h                |   1 +
>  arch/arm64/include/asm/processor.h            |   2 +
>  arch/arm64/include/uapi/asm/hwcap.h           |   1 +
>  arch/arm64/kernel/cpufeature.c                |   9 ++
>  arch/arm64/kernel/cpuinfo.c                   |   1 +
>  arch/arm64/kernel/mte.c                       |  11 +-
>  arch/arm64/kernel/process.c                   |   6 +-
>  arch/arm64/tools/cpucaps                      |   1 +
>  include/uapi/linux/prctl.h                    |   2 +
>  tools/testing/selftests/arm64/abi/hwcap.c     |   6 +
>  .../selftests/arm64/mte/check_buffer_fill.c   |  10 +-
>  .../selftests/arm64/mte/check_child_memory.c  |   4 +-
>  .../arm64/mte/check_hugetlb_options.c         |   6 +-
>  .../selftests/arm64/mte/check_ksm_options.c   |   2 +-
>  .../selftests/arm64/mte/check_mmap_options.c  | 116 ++++++++++++------
>  .../testing/selftests/arm64/mte/check_prctl.c |  25 ++--
>  .../arm64/mte/check_tags_inclusion.c          |   8 +-
>  .../selftests/arm64/mte/check_user_mem.c      |   2 +-
>  .../selftests/arm64/mte/mte_common_util.c     |  14 ++-
>  .../selftests/arm64/mte/mte_common_util.h     |   3 +-
>  21 files changed, 167 insertions(+), 66 deletions(-)
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Sincerely,
Yeoreum Yun

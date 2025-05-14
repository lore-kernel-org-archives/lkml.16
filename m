Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4A46426
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747220722; cv=fail; b=abI8yyxFS7yOagFZWBse3y8AxaQj4usfHhoJM4mymCmG2c/8B78k+uZ72Fz7+tXS6bVhLVTL/b4OI6f4LeYe81Yb9/ibnmGnbgevL2Pg4VUSKQVcD8tuh+z3iA3VgCtefruKbrWenmfxC3Eyj4lyLIG0BPoUTSahmfbLIBd51+0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747220722; c=relaxed/simple;
	bh=5DBWJW5K9+9L7vdJTUq638dt1wLknylm9uYhPAEYbMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FNwIxMBMGd673LHUDqODgOH7hTgQsY1acziPYluO2DEweIY8OvVvdIs05KhMvFaG7C9EUOA2ufPqD7LIdD5SSXxykaKZLqc6nzIHlsnZhJKPN/MStAbBQhoxWgr3jyf4PJ1FHRDdVYZwyjjIL9dp5Ie5pFiexdUc5kwz/ZskAz8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S9QlzdJt; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S9QlzdJt; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S9QlzdJt";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S9QlzdJt"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FYzD8dytpH4qgBzB4i+sdXhhuV90jnalGMudnxzBc+K4/GSoYwT2Elan9739cAhZ7X7fKWur/UE0OePQj6ZRFe9iwl7NSjQV8NwKh7hew2MxIpee+4ZmultLsl4Sy0qZXqPeGg6ZuiCz6OiZ35HQuyzDbx93g5MvHf7JcIQvD09J+EY26jBcSKwZl+jWwuMEJb4B280z0hkHoyzXXuRnhCWxg444/y7Af08NtW3AqskeTOC5wD25dKpPbF667WEuZV3LbxZjYdKWRIqOOfq3RwsDdq1cg/HO81L5cNImmreOeGF5S+DSeQgg96E2EZPdfUeyq05/eA/Urfp4xYS+7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82kWtSkOSE6l5n7S2Cwh/fiAPNrjl+oanLeB12VQk7Q=;
 b=Hwn8X9kGL7wyWhKw6qUzY0eAoaAdprjo/Im+O5KzukPpWxBdxGiSBAlq1CF/CXYQ7UQoWYDAGAQ9K94jzI4JelUBXOoYMgkK4slJ10cOIYZZ/xRLi6pcyHiVBeAf1iLXTWGW/dPvMfLC4zZZIeY/W+r9ALlS7tVABDiD4IgCbDGMcHCVoosjCdyfBufq5AEvglteHCirmUvVBRDQ1G/6YfmhTgXI+rV1jWyV3L8t4hay8Hic9xo/mvqKUErYy/ieI+s+e53as+xNZg89WoJg1d0dCKp+3RxS0nYX5QSIze8SCnQ6SnLcMSmGgMNGkZZPmU/S5yObfWjiaEZBC6WReg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82kWtSkOSE6l5n7S2Cwh/fiAPNrjl+oanLeB12VQk7Q=;
 b=S9QlzdJt68ZD+FMboWSlj4EUF+ajEQascEYwnTurSRSd+kJgoGL/FXQhBhDDIMoBrO13uA7sxXzqogRDaOZH5aav4Am2ISthtMvfaq+G8E8dOdC/HifZzf+WRx1oomF33hB+CAqGeBHBGS6i9KWuo+Kff3o/Vqgu6B8eCg4RdMo=
Received: from AM0PR02CA0189.eurprd02.prod.outlook.com (2603:10a6:20b:28e::26)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 11:05:16 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::7) by AM0PR02CA0189.outlook.office365.com
 (2603:10a6:20b:28e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Wed,
 14 May 2025 11:05:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 14 May 2025 11:05:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7mrasDBi68U++J2241jm36Gxb1G1h6PpOxoJLC6dd7e5/s8AZ+NtLgNQh6lGiR5ENcl8xPTVV74OtYYQdcaxttl+9UDd4ijtZ1ehFjAWQnI4hh2zDCovIGVk4U3KEcLAV3naW+uIRVbRT0bUue2oU+02MMc+DGBcGATvF9lRrClu4zKPJ38xTguWV++MIytlflEt0RgQsOH2/RnGPGq4J/z0P10tYX1BlrhCcdSvfNJBDol/qCtvu/KzCk02yfGjEDZu5i9rFNbG1h85Dku9wh86+TwY6EWNHZKUuNnOl7JrWCDO//y3F5AWu3WxhlB7zWITdJEthH3PdpeboOGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82kWtSkOSE6l5n7S2Cwh/fiAPNrjl+oanLeB12VQk7Q=;
 b=U3IA8zHXMkAHSmdz/ayPEmFHCZBrtMbBY6R9Qpxr45q7VTeQCkD5ZLppbiogXmi87JRtsVerlvtZ6xRpkWK4CMCVDug1V4e41nhj3A78OtA8UcqpQ4We76MIoNzFJOS3ZtknWpFi+dw/iUphTCtJ4jqaPIahgU0buNBQczAVH8SqzmPQwUbvya9gd43EpMnpa2flXcO0wx/fMxIgCEB9hGxnM1R84a/oyJ93hY58idEFcSnJHOj3Ka5al4GE2Ou89Ig8pkc5o0T46Hc5KbTWscQmgU2dYMqUL3LElhmkwXDX0Pq4M8NjozbTptz9DpZapXWOP8iD+6JW6rwoejs7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82kWtSkOSE6l5n7S2Cwh/fiAPNrjl+oanLeB12VQk7Q=;
 b=S9QlzdJt68ZD+FMboWSlj4EUF+ajEQascEYwnTurSRSd+kJgoGL/FXQhBhDDIMoBrO13uA7sxXzqogRDaOZH5aav4Am2ISthtMvfaq+G8E8dOdC/HifZzf+WRx1oomF33hB+CAqGeBHBGS6i9KWuo+Kff3o/Vqgu6B8eCg4RdMo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB8654.eurprd08.prod.outlook.com
 (2603:10a6:150:b6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 11:04:42 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 11:04:41 +0000
Date: Wed, 14 May 2025 12:04:39 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <aCR4x/+Wp8JoqG9P@e129823.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
 <20250513170622.3071637-3-yeoreum.yun@arm.com>
 <20250513170622.3071637-4-yeoreum.yun@arm.com>
 <20250514093019.GE26114@e132581.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514093019.GE26114@e132581.arm.com>
X-ClientProxiedBy: LO4P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV2PR08MB8654:EE_|AMS0EPF0000019D:EE_|AM7PR08MB5447:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e53de63-61a7-49b4-fc98-08dd92d73451
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?+Ej+z1E7rdFlZ/axyeEAf4nY2vMOc3WyqchQJNrM8cTYwQxaQ8j2pkz3Dily?=
 =?us-ascii?Q?HN/U3rl73xJ9lAZvD3S40wCOKhIA3JdeDJL3KKeWB6iSSfIhV4h/WN14V86y?=
 =?us-ascii?Q?N5pJQqDohp7CUukhFFq6RY4GYGE3rk4nitc+5IqgHCfjyBcHXFi+8b5yAPqr?=
 =?us-ascii?Q?fhgHgrxP1NmKSEGOJmd6E7kpGEQa3c83XKwZwfT+Nt4vRQQmEz/EYdZoA/lj?=
 =?us-ascii?Q?rmwtF/3WORthV2oUIKK7tDaLSGOweKPCuNmOCU8dIleQbDlnIAf1Zb7XZO+g?=
 =?us-ascii?Q?BFY1ufbIFinX3diSQ6aYGF5kx4G0w8zU8lNy2e2XgRJK1YikbKikG0lRRn0c?=
 =?us-ascii?Q?3NL+2D3FrGPlKAywSaf++uj756GaHtQNFOnnaYmqAjZk736tcuD3abOCaImd?=
 =?us-ascii?Q?hN3Xq0p1Zs7ed8YtHcny9tfJndTG30ZV+qE1OpISGX6NvZephDrdsDq8EVdD?=
 =?us-ascii?Q?Cewqr6BOd6F/16gXn4gK5/cQQM9wug9MBrZM/XpXOas0VldIysWo3hLmbgnT?=
 =?us-ascii?Q?jHyGlMTYoho1T9o0ZBV7XtDh3SJW+wu9pPQaA0Gsv59+vUHgLP0P9t2tNCSx?=
 =?us-ascii?Q?/fX3qgxx5zr8hmZ6ryh4DMl7xMLZlc440COZYR/GV7GJdOnERTA+rAxuqy+/?=
 =?us-ascii?Q?rjp6Yx8Z1NFD/z8jKvOZqFHq72JtYqZKnabQOnDeNVFBcMsvLc0f/oX9eYSx?=
 =?us-ascii?Q?p0NwHPXn9c4Zue9ldSAYpvlt5WP+jJJzjRLy9MZqqI9iaZLtNeI+8JL+vwk+?=
 =?us-ascii?Q?Nk5xQooPlaGYCzCE5hE8aKeajizU3qGaESnp9P/TzFfGHAqNbzne8+mFtzST?=
 =?us-ascii?Q?XY7kU5c4k2E9XC4znsC229GcGPRj2cL4uXbHI/xzDZr1DGlGrsVTdeGLWzLa?=
 =?us-ascii?Q?aNaTo3LN4YmLPjiwn0NbmK18UOcFNcUbSVrPoML9tcVtdnJ465Chipp93Vgr?=
 =?us-ascii?Q?0EMyu1SupzKbSuE38cpoxapvIDkja2UT0PQIOCr5IYaTqKcGzB4CB6bBK4QY?=
 =?us-ascii?Q?va7kYl9rypFycx68XbPXNaqSH2FkDTbk1tY4aQm63X57pMehOfH7u9H5ilWH?=
 =?us-ascii?Q?KiEALF1HWnQWG/AdKId3pDiX8becMRnlXzBgpCEepjorTrq6gESEKIIpO+GX?=
 =?us-ascii?Q?/4lW286gLXqs79EubauaybZ4P9KUpbWdRGSJDVILot8yLNvbaSbd8A/FUV2e?=
 =?us-ascii?Q?ajg119nMTj1p61NJyR9TU9MsBRbsIzNIK3YfSVyq8J0YQ7MBj1f7oEd2SwIO?=
 =?us-ascii?Q?9d9BOxSCjvj3OkvmPsOnCsgjYAnAj0x/jneCXwexvOl6FfOuNjT3exvKs9al?=
 =?us-ascii?Q?xECwiAl2pgWrx6XbJnPP0PtPt6+ekAyWMIp+FZRJKeSBE5iTLHZqMA8NUxsb?=
 =?us-ascii?Q?8FbU4VIHpFJkCbdzOMTvIHzTj8mJdC9m/00l7RRx9kNc+wFuIA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8654
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d47d751-afd0-484b-f115-08dd92d7204c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nhuruNcz7Hg7OXnFu+J5a0Tqq++sxeKoF5+HpuGsCT9v8HycwqnjGOfVZ4a6?=
 =?us-ascii?Q?B6zj3AgPB9SVBoiGLVeCDMzRRQzhFjYqWLAJ3b+oPBpav9kjG/flnF1g9GNw?=
 =?us-ascii?Q?pm2sMnZizk+5N8YWTNOyUEDMzFihOKrEDZakyT+VVnp5KABkRww8p58EH1BR?=
 =?us-ascii?Q?qEHuw+snrAzR3ZjbBaJcZ0i/f5BDwBfzk4O4FHBH6U8TvKnlgWU22b2I2wPN?=
 =?us-ascii?Q?uBxKfgKRmlQkGalSKtsC4evfGpvY4HzvfFuG/oqHn1t8VAEenm1FL60U7bcB?=
 =?us-ascii?Q?rP9VosHXeZGIjlGIiCMI1nKnhi3wcwZv7yLQwPumKNqavxVgp+DKA2c6ytjR?=
 =?us-ascii?Q?TL4G9/15R/GSS64GOnffdEhUobqjAqWH/YOutC94RE4rhBVUozvfg/8AnOIp?=
 =?us-ascii?Q?NAoDLvLays/7/t4L7xZYzxrBYv9H+nkcW2ymkr8Gn1wzstVukByL0SuQxXN7?=
 =?us-ascii?Q?PnTuzlPujdnKdJff7GSC66QSBDjEUNp3ftSULwKcTBfdmwPBetUww3Trq6FS?=
 =?us-ascii?Q?FIqe3VrCkJ5OeG5/GZuROpVzF2bTKHES2H7Ca/rIb4CagAuurKff0lf5sLaF?=
 =?us-ascii?Q?uidWQh+VWxb6hmpEH9vzNrMOX+R5Ej/aFjNOFX70C+XDbGVpA7ee7VkAUQoV?=
 =?us-ascii?Q?A68gSfrYE0WnCP0c695s4/xU5Q/M4MJP3bzFiGE3QUGY9FN5Mi7w87dJX4Ck?=
 =?us-ascii?Q?hK8/VwP0HotHym6Qf4aMghwR2y76z2I1MEpEeMhN/UXtr1dyc2/D0g5GaWMn?=
 =?us-ascii?Q?5K3PHJvB4RRd/DAxdTOcX+3H71km7Q9JdMxJnneWk/1HjURbjpk06Vg3iKS3?=
 =?us-ascii?Q?YJlCAwsnAGrI1XODjv1lJIeeZ3Dt1jJ7pYcjq90mxAUdRS+YhwfL4UaRynId?=
 =?us-ascii?Q?AP/AIxTWHVV0JnNJSHWnRTimJnj7y1UJ3r2aVS4no/0os8gw5J4wsxYow572?=
 =?us-ascii?Q?YH+qK6g0WqH3qjYAWsUzUd+m+yfOQPlPl26MERlMUkvR35MSMsc+5nf8wzRl?=
 =?us-ascii?Q?KgWcy2GEYcoRJjRb6H304OSsEsSDr1pK6QItkTHpwNIMy7j1q7DxM6gBJlI0?=
 =?us-ascii?Q?vnU35/WxWRfEVnDoIqi4lYzkMnIpM24/oymBj0I6MyEjHKx0vX97xBv9ga0S?=
 =?us-ascii?Q?ZN+scbWixP1grR7zPIuZIPXRAe9GsMScjz40In0wu092ScJhssOaQt9Ax6Mq?=
 =?us-ascii?Q?DxR84ILGb9Bn0oH+cibauSOyTn2eCcL9+/W7w9e1WyaanMl4U4N+XcJI5RDF?=
 =?us-ascii?Q?zwGUHc+NLkEWfhDxH2HvXcO00+b5xC+GD4sNP6nNYCTwCwlRWk0xDYP9BgSU?=
 =?us-ascii?Q?Ic0oFODU4O3F+1oZ7JZzjTRxyIJIuoirWvO8e72Dv0784otFJ3f/QrgigaVH?=
 =?us-ascii?Q?zP4iah+ux3/fnm8j/MyXBFqlOd5v0CPeAfqKNGLdL/BR9MUYqVXoO2IiBjwv?=
 =?us-ascii?Q?bINrLgVMflzlzHjVwP55T7qnj034VTtC+2fObuQtsoY4rwtoO+LG+5+W7KQa?=
 =?us-ascii?Q?PiqY9IjH8Qu74mk1I5aRImh+6IllUtwjY5yT?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:05:14.9036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e53de63-61a7-49b4-fc98-08dd92d73451
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447

Hi Leo,

> On Tue, May 13, 2025 at 06:06:22PM +0100, Yeoreum Yun wrote:
> > While enable active config via cscfg_csdev_enable_active_config(),
> > active config could be deactivated via configfs' sysfs interface.
> > This could make UAF issue in below scenario:
> >
> > CPU0                                          CPU1
> > (sysfs enable)                                load module
> >                                               cscfg_load_config_sets()
> >                                               activate config. // sysfs
> >                                               (sys_active_cnt == 1)
> > ...
> > cscfg_csdev_enable_active_config()
> > lock(csdev->cscfg_csdev_lock)
> > // here load config activate by CPU1
> > unlock(csdev->cscfg_csdev_lock)
> >
> >                                               deactivate config // sysfs
> >                                               (sys_activec_cnt == 0)
> >                                               cscfg_unload_config_sets()
> >                                               unload module
> >
> > // access to config_desc which freed
> > // while unloading module.
> > cscfg_csdev_enable_config
> >
> > To address this, use cscfg_config_desc's active_cnt as a reference count
> >  which will be holded when
> >     - activate the config.
> >     - enable the activated config.
> > and put the module reference when config_active_cnt == 0.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  .../hwtracing/coresight/coresight-config.h    |  2 +-
> >  .../hwtracing/coresight/coresight-syscfg.c    | 49 +++++++++++++------
> >  2 files changed, 35 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> > index b9ebc9fcfb7f..90fd937d3bd8 100644
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
> >   * @feats_csdev:references to the device features to enable.
> >   */
> >  struct cscfg_config_csdev {
> > -	const struct cscfg_config_desc *config_desc;
> > +	struct cscfg_config_desc *config_desc;
> >  	struct coresight_device *csdev;
> >  	bool enabled;
> >  	struct list_head node;
> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > index 5d194b9269f5..6d8c212ad434 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > @@ -870,6 +870,25 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
> >
> > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc)
>
> I would like to change the return type to int, so the error is handled
> within the function.  As a result, the caller _cscfg_activate_config()
> does not need to explicitly return an error value.

I think it's not good since cscfg_config_desc_get() failed only when
try_module_get() failed and its return type is "bool".
also, If we make defines error type in here it would make different
error code compared before this patch in some function
(i.e) cscfg_csdev_enable_active_config() want to receive -EBUSY when
cscfg_config_desc_get() failed but _cscfg_activate_config() want to
return -EINVAL.

So I think it would be good to sustain current return type.

>
> Otherwise, the patch looks good to me.

Thanks ;)

--
Sincerely,
Yeoreum Yun

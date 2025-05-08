Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012041.outbound.protection.outlook.com [52.101.71.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D362022D4E6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.41
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711296; cv=fail; b=X3lCwuaVKYsiiEiZ9vb/Ym/4ALJvoX7zGuDxb01memRSDymUYpWyj/iZ5Jx1Lmq39NaTMBZR98JUtyMFh2gARE7CbO67axqmZUZgyeReBwPal9x2E2mUgx0Ym8UjVYob6R8UcqmMIbuT3ShMhtBVuGD4qbIuKYrQfzRlLxovzYg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711296; c=relaxed/simple;
	bh=zf6MOfQX5wdYN3KUzhNxXu/jmJODvB/UqNS2ttPmwj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l/9VV4uF4K7q8sOv7a5rzR9pGAJS5KCZmvVAI9+bThopUEZJHv383SVVA35mRryJA7VbJ86pxAhJ0MrqSiCRv5V+c2YM2NSdcOCuXtTgYTzGU37bagbdij0be7dvKiqiw/5kn0K8mnTY1iRJGPb6dQSQPm1sk2pck38T4UwE15I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IUU3l5fO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IUU3l5fO; arc=fail smtp.client-ip=52.101.71.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IUU3l5fO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IUU3l5fO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vzt8SasbEl7TlfkvJM4klLUa6CMClRpjVsVKgo7HRR1A2D2WEEZjyXU4uqprujp0r4ovGcDDYvdJiJ+qq+LPUCMUhv9CzXlcSvgF5t2v5pqc5kfJcDERRyXNvXw9XZIWR1cdVdn5cG1tFRUaES/8ovJ4op67L3uxgsfJHOjd9wCpHDCMTX6SZTIodN+Rs8SD4KaQDdRCZK4iJN1Qtx3II2UEkvsewmXjF9uMwFspC/zi0EqYKU+2bpud1pCOy3GmoAoLD7HekJz741TFvELinw/fHKwj9Y29lIBZvK80O/GwBruCu9E3U3MMXPN25mFL5DZb5LKLzCbDY+7tKA3aeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZdQmj3mdDPvf6eggZITyWKpxVxFInuXLZ/S6Ysl0mQ=;
 b=abZ0a0RnGFohl7hk9xKhdO9HCG5GpB5Hk9edBr9oniSG52iA6V5/NzCAqHd8wjS90byGG1fWRRk0t7sLV8j91vE1CN4LAQwS9wAWvDE/iB9W4vdgiS9PDuC/QHsjA5KLzhayXe644SjkfD8AVkQdTh9vwjm1+0RU8zfuOfTPlEfiRfL+duqkeDBd1YkiL5ckcTBfd7W969yMEtnqP3JmJ2IT+7x4/91r1xmgAlilWJ52FouqrfiOPp17WFSe7EeMwvbHWSsx6CBXTnkbewf8C1IyKcedSf7G8VAAIlI6T+6JzlLrl0WHcYDOUdYojMDZzNssMUpZuiAXnuYIZ6Rjtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZdQmj3mdDPvf6eggZITyWKpxVxFInuXLZ/S6Ysl0mQ=;
 b=IUU3l5fOwQ77dBfWVMkIbQ74pXKqaQpBCltYSy20iH+sZPBdVYViTTnSjXFLc0qaucRm8blT0dHCLgyqgwUsNr1vbDyr6K7fANNoozM0pbV8SeYf/RUQHviLUPbUlibX93nyzzB1kObUPDC8wIos5B9UoUMLcnIKiRF/bo6298g=
Received: from DU7PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::29) by PA4PR08MB5984.eurprd08.prod.outlook.com
 (2603:10a6:102:ea::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Thu, 8 May
 2025 13:34:50 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::a6) by DU7PR01CA0008.outlook.office365.com
 (2603:10a6:10:50f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Thu,
 8 May 2025 13:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 8 May 2025 13:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju5dLwt9w1VE+F8teW2A+vCFrj+Z4LMoaqenvh4o020HrzjhW6Dfep0zj+J3IzefKQOza3ya92JlKqML5IaBArDM9ruvOPBDHvAzmnXWmj0EhEzG6TmiCL2h2vYKRUz5DO0+tBR5CYKhVsVNnecto4C75w62sfz5z6xgHSkbsTGBXLlQgnplDymOzDm5B8VUQ2jmjiN+uRF7t2kC/dRG2PUVqZvecgxSrwW4rQWkhs28s7pKeu05mRDeBAdLaiTLhEMfyfWGQ+ejcsO/7X3yYNhz4DqPtuoxvkD4lzNxb39m6UKOSoHD55McCFCKi5LenZxcZqLzQugLa7T9Le0UoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZdQmj3mdDPvf6eggZITyWKpxVxFInuXLZ/S6Ysl0mQ=;
 b=AdVKrV8fmEMkm7XdpIDBDbVId0z9LTLYfDWvFZmSktSfhSjRmkYmwCh+uQdpbGDzmC94deIPWQ36ZHCKLU0s9Tb33LWP9j1p154rydilERuIsbJYF33wrtMRExVkeeGy68MkEsIorsaWl3GV6V0mha7UA6RZyUcnRbH6+oP5igUDjI6ptA9QUtU2Av8Rq7YHLJkC2yXBIaCJ8B2+54TYx0m4jk5NPVueoh2ydR9gezGCsT30nv8v+t/6ybwrKGYk3uGMCK2bcFWcnB7YyIpM9baaz6NFxUShHz5hepOXd5r8W45Vr1bA0TxpYCNypXfwl+cBK4UbkZB31ckt+bJY3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZdQmj3mdDPvf6eggZITyWKpxVxFInuXLZ/S6Ysl0mQ=;
 b=IUU3l5fOwQ77dBfWVMkIbQ74pXKqaQpBCltYSy20iH+sZPBdVYViTTnSjXFLc0qaucRm8blT0dHCLgyqgwUsNr1vbDyr6K7fANNoozM0pbV8SeYf/RUQHviLUPbUlibX93nyzzB1kObUPDC8wIos5B9UoUMLcnIKiRF/bo6298g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS2PR08MB8384.eurprd08.prod.outlook.com
 (2603:10a6:20b:55b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 13:34:15 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Thu, 8 May 2025
 13:34:15 +0000
Date: Thu, 8 May 2025 14:34:12 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64/boot: Disallow BSS exports to startup code
Message-ID: <aByy1CFUieJQeofl@e129823.arm.com>
References: <20250508114328.2460610-5-ardb+git@google.com>
 <20250508114328.2460610-8-ardb+git@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508114328.2460610-8-ardb+git@google.com>
X-ClientProxiedBy: LNXP265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::29) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AS2PR08MB8384:EE_|DB5PEPF00014B95:EE_|PA4PR08MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1aeb1e-f171-4e26-91ae-08dd8e351ac7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?8fT8ZMm9b6i/d76CwUowSnGSup6Gf8Cm0l/ve//VB+Ojr+HNVcpAYmEItgB2?=
 =?us-ascii?Q?09ez5CRVbCe7Dw2Au683RfLdTnvFtxp1crMUykF1xXS6BRgDyzH20FwYTvew?=
 =?us-ascii?Q?LZz5SEYtUUgMha6ZBjiklOepru8Amvq1yBvbewdkoeCKDpXAdVDFdXi5ZbAe?=
 =?us-ascii?Q?DkQJAn3HmY6xfa58EFCCvzlfretd7HN3a7+3/+75gw0eCG/ZfU+6txbrD/iI?=
 =?us-ascii?Q?9wexwl3LQHeZyh791DsBQEMlh1N2Yph7TJIqcoXn4KKfmKDZfn0hS+Mp0Llk?=
 =?us-ascii?Q?TEbTb9r+GEx2aUmziyUwvHLeIa2QLO53gV62LhhN7Dm/kAfC4GNBtJCIW2Ut?=
 =?us-ascii?Q?helmQVJDQH+IXVb+Ij2sREcCOje/F4rczTvwK2h9Sxv3WbFPTZwf/lC4g3Fd?=
 =?us-ascii?Q?y53LXaOv9R3mpLYlEQ4VcYhPWyytPjMZSneASIYnFOHm3FF34xtxmNQ37/h5?=
 =?us-ascii?Q?nJaiCTh1cEjG25zYcn29HwT+mkf59dkJTM3R60UWJ95pnsz+4vIPZ08U5P5u?=
 =?us-ascii?Q?greOhD+dkQcEVb3qsN1UjCiqXds+h9YzUDvcq53aVmftlyh6hSyclZFi4G8C?=
 =?us-ascii?Q?tsrDLsmDJpadNX4ETmPkOVu0OR1bHOFn2S4hn4Gdv5T4IVohREq8Slvmng58?=
 =?us-ascii?Q?dr6WPcwBKJLU+Q2ON7rpRxGQJKAaCCMwaCVRyHP/FvzOkjp+C9/72zAX47vV?=
 =?us-ascii?Q?lxOFvPnoka73ltm8veooeNthtoSNsGlFoCcrkK/MazGRs7EsMIsmD8pdHwIx?=
 =?us-ascii?Q?j6KGdjLNZY1mmhWan1eyiyg6W+M24WuDcvqTdh3HpAg4S/fK9Qgpz+Juo1mf?=
 =?us-ascii?Q?zFmuHEJWhmXIAQuneergBR2TAV552FZSjRbR5/peu56LW1c8hyksA6SCVMnp?=
 =?us-ascii?Q?fXzseUhBr1auMipTJUxq6CTJlPy0BoMnSRUnOzHzzNb/54x85iVbM9Zq4c+D?=
 =?us-ascii?Q?Jb+jYH0j5WrFYZk+Wm5w60papyG57tktUhC5+MqRMNEEIT3t7oeZILYmdZ0W?=
 =?us-ascii?Q?AzGCxQ7140pwTqQcClTrraWlXbmepIOR+BUPma9lxjhI2hiw+wa7jSniNyy0?=
 =?us-ascii?Q?JTuQHSQjLLV8cd2MP+emSuvHhOSrLlAUbW5zw6YHZb8e+uBjw1bRupXY2Xx9?=
 =?us-ascii?Q?lnVhXFaW6znWmIb9j9m9amjdoaoCpP3cKQSoKny3Ytm0z6d5YhABwR+Pzd9A?=
 =?us-ascii?Q?lL9pBWOFzLjkFPysNlAp2KkOHzTnGPUZEDdyjSHR+97vIk6zaLoHQcC+1Qq0?=
 =?us-ascii?Q?yX7jAgnksAYn4cZYinWf1rs5IAIjJjrsX0ADlFEduIzRHTTkCMNcFTmVOhJM?=
 =?us-ascii?Q?xDQBMyIxtWYBZXOvA+7K7Gxp/oPFKfSZeWAgzT+IPTUC2NsCVuLCdPhKLpgE?=
 =?us-ascii?Q?+/UbAwpu021mjbeqknPQ3AMTtSu47Oi/JQaFTe6zgenM+bXMXhCin8Gyyg+I?=
 =?us-ascii?Q?40ALFXEmcF8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8384
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09367c04-7569-4654-2db9-08dd8e35065b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|376014|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/KKDgOb4lHWHM+JXq0ETFflGDcpk7QD1aNOq3rVoLF73LIXE3fYQD2ZYFAj2?=
 =?us-ascii?Q?u+6o66OGnFPQOez8ncgpKmwSWqFdPdrvkiFaGTs/9GcNNxtilVdOBBVU8teD?=
 =?us-ascii?Q?GTTbqyP0mk2lI+LBwAAVSluxDNmpftN8YY4/CXIPv9/PWyKVyOijHYRpnbot?=
 =?us-ascii?Q?rSppC+zJZtGyMeqkcTXdcvetM4dW7SsuOrMFbpg0G2ElEpdwEL6ld7KcpA/N?=
 =?us-ascii?Q?1nQzQvxB8CSr5ggm7Jn0HRFx/0FvZHY0nRhenQYv2OUvKMAXcZgeu2LNEwyM?=
 =?us-ascii?Q?mLc+2z+PAje4e5tVfKAlU9VaU+bVYhxg4PyBAYs+wepp2n7WmtybHG9BofMm?=
 =?us-ascii?Q?WqloGHerK7pakHDl3Z8cWRuKloYduf7hLBBpY2tfSLs+garlvB+PawFi1pMg?=
 =?us-ascii?Q?XM5LTLmxl8RfCaOvSTaSYQQRPsBnYPEG/SqUbzVxMigY8IkyFXvrmmMaTKey?=
 =?us-ascii?Q?M31pyuJ/XQL2/E/RmWR7gs1xubNdhenbBviaOjSQ9TRTmz2U21QB/vC3vQgb?=
 =?us-ascii?Q?qg6bYfbpCPb14prrnhc6MPbWVrU6G1YoiF0yTo5mCrqPCjScjNP6m267/idP?=
 =?us-ascii?Q?Vi4FZxvbb/cZ+TkUy8sceUOxz5YJyLy4ZSZRyu9LxBCvwllP14kjygtf8JSa?=
 =?us-ascii?Q?9+VeIOT9m3B4KkneHE0iyF/1cFyAWK22GVFo1k30NsK2tBC3ni2ttZVke3QX?=
 =?us-ascii?Q?HIBGBjOhPwpj1KFlIwQqDZGurWOF0bYe0NmV49XK3qtaitOJrzx9L2cDFtif?=
 =?us-ascii?Q?ksCngrNCsay+a7vS1fBUjsvqJ9eOhaHt27yz9pbbA9YJI1iSQ+GYn9UOsUrm?=
 =?us-ascii?Q?pHm+z0AVCjElAueDVXLuqdOudO7i3ukKWYNV24N9a1bG9wXoRtwvepIstJHO?=
 =?us-ascii?Q?9IvPeHNwvVgoYjNS2lyHnr37pF7+kH2brSzO1B1fcyriV3ihQCtJHb8A92je?=
 =?us-ascii?Q?pZA3RDtT+BBB1V8t5LqybCu9tkQUCQlUBxVxNGXCavD94SEfilmmhD/VjstG?=
 =?us-ascii?Q?/od8yltERpo8s8njHEZw5tfxm0itNXM2H2OgS3xLjZwoyFw1YMh/4t1INvDo?=
 =?us-ascii?Q?yUjqBilbMAxiSHbFNpV8ffhwYnxXxELxQf8WDiG3lPAQM3ROFZlm/n7K0lDm?=
 =?us-ascii?Q?JnUH6C78MOeeYI3Ac/0drdLFjJyDjU3buHCWS1OQxLop1Fqy5TKhjhcPngI0?=
 =?us-ascii?Q?zPBuSp6v6wpqPYm0yeGvkZNdfbXelLldbAiCGNvBgwAzefP4KrmeNnf7UdfI?=
 =?us-ascii?Q?iving8Wdc/d72Talx2xs/nTV4m1jpsEdHpLv2ZbGdO5FNPJ0KQynNxqgpzwn?=
 =?us-ascii?Q?/eVPs4EWFL0/lz++E/JPKe//7n6Lw0uctXfnOdRXZgWkvRo9xyB2HtfcxwkN?=
 =?us-ascii?Q?qgM+TR0ZWYoYube31CWyTVAu37uvUYJdHMEOPsSQCBBxl+kzyXT1rnVXIi2R?=
 =?us-ascii?Q?H0hNiuMiXuVJPGEZKsCjhsHHVJr+Qy6JBJ1BXLBe88KLvtQP6phrBflsF8bq?=
 =?us-ascii?Q?u3+rAQnHK18yk1YVicQJxK0o9xV/GvLEcxwf?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:34:48.8974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1aeb1e-f171-4e26-91ae-08dd8e351ac7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5984

Hi Ard,

> From: Ard Biesheuvel <ardb@kernel.org>
>
> BSS might be uninitialized when entering the startup code, so forbid the
> use by the startup code of any variables that live after __bss_start in
> the linker map.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kernel/image-vars.h  | 62 +++++++++++---------
>  arch/arm64/kernel/vmlinux.lds.S |  2 +
>  2 files changed, 35 insertions(+), 29 deletions(-)
>
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index c3b4c0479d5c..a928e0c0b45a 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -10,6 +10,12 @@
>  #error This file should only be included in vmlinux.lds.S
>  #endif
>
> +#define PI_EXPORT_SYM(sym)		\
> +	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> +#define __PI_EXPORT_SYM(sym, pisym, msg)\
> +	PROVIDE(pisym = sym);		\
> +	ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
> +
>  PROVIDE(__efistub_primary_entry		= primary_entry);
>
>  /*
> @@ -36,37 +42,35 @@ PROVIDE(__pi___memcpy			= __pi_memcpy);
>  PROVIDE(__pi___memmove			= __pi_memmove);
>  PROVIDE(__pi___memset			= __pi_memset);
>
> -PROVIDE(__pi_id_aa64isar1_override	= id_aa64isar1_override);
> -PROVIDE(__pi_id_aa64isar2_override	= id_aa64isar2_override);
> -PROVIDE(__pi_id_aa64mmfr0_override	= id_aa64mmfr0_override);
> -PROVIDE(__pi_id_aa64mmfr1_override	= id_aa64mmfr1_override);
> -PROVIDE(__pi_id_aa64mmfr2_override	= id_aa64mmfr2_override);
> -PROVIDE(__pi_id_aa64pfr0_override	= id_aa64pfr0_override);
> -PROVIDE(__pi_id_aa64pfr1_override	= id_aa64pfr1_override);
> -PROVIDE(__pi_id_aa64smfr0_override	= id_aa64smfr0_override);
> -PROVIDE(__pi_id_aa64zfr0_override	= id_aa64zfr0_override);
> -PROVIDE(__pi_arm64_sw_feature_override	= arm64_sw_feature_override);
> -PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
> +PI_EXPORT_SYM(id_aa64isar1_override);
> +PI_EXPORT_SYM(id_aa64isar2_override);
> +PI_EXPORT_SYM(id_aa64mmfr0_override);
> +PI_EXPORT_SYM(id_aa64mmfr1_override);
> +PI_EXPORT_SYM(id_aa64mmfr2_override);
> +PI_EXPORT_SYM(id_aa64pfr0_override);
> +PI_EXPORT_SYM(id_aa64pfr1_override);
> +PI_EXPORT_SYM(id_aa64smfr0_override);
> +PI_EXPORT_SYM(id_aa64zfr0_override);
> +PI_EXPORT_SYM(arm64_sw_feature_override);
> +PI_EXPORT_SYM(arm64_use_ng_mappings);
>  #ifdef CONFIG_CAVIUM_ERRATUM_27456
> -PROVIDE(__pi_cavium_erratum_27456_cpus	= cavium_erratum_27456_cpus);
> -PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
> +PI_EXPORT_SYM(cavium_erratum_27456_cpus);
> +PI_EXPORT_SYM(is_midr_in_range_list);

small nit:
Would you rebase this patchset after
commit 117c3b21d3c7 ("arm64: Rework checks for broken Cavium HW in the PI code")?
Otherwise, I experience boot failure because of SCS related code:

  ffff80008009fbc0 <is_midr_in_range_list>:
  ffff80008009fbc0: d503245f   	bti	c
  ffff80008009fbc4: d503201f   	nop
  ffff80008009fbc8: d503201f   	nop
  ffff80008009fbcc: f800865e   	str	x30, [x18], #0x8 ---- (1)
  ffff80008009fbd0: d503233f   	paciasp
  ...

At pi phase, platform register initialized properly...
So it makes panic on (1).

Thanks!


>  #endif
> -PROVIDE(__pi__ctype			= _ctype);
> -PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
> -
> -PROVIDE(__pi_swapper_pg_dir		= swapper_pg_dir);
> -
> -PROVIDE(__pi__text			= _text);
> -PROVIDE(__pi__stext               	= _stext);
> -PROVIDE(__pi__etext               	= _etext);
> -PROVIDE(__pi___start_rodata       	= __start_rodata);
> -PROVIDE(__pi___inittext_begin     	= __inittext_begin);
> -PROVIDE(__pi___inittext_end       	= __inittext_end);
> -PROVIDE(__pi___initdata_begin     	= __initdata_begin);
> -PROVIDE(__pi___initdata_end       	= __initdata_end);
> -PROVIDE(__pi__data                	= _data);
> -PROVIDE(__pi___bss_start		= __bss_start);
> -PROVIDE(__pi__end			= _end);
> +PI_EXPORT_SYM(_ctype);
> +PI_EXPORT_SYM(memstart_offset_seed);
> +
> +PI_EXPORT_SYM(swapper_pg_dir);
> +
> +PI_EXPORT_SYM(_text);
> +PI_EXPORT_SYM(_stext);
> +PI_EXPORT_SYM(_etext);
> +PI_EXPORT_SYM(__start_rodata);
> +PI_EXPORT_SYM(__inittext_begin);
> +PI_EXPORT_SYM(__inittext_end);
> +PI_EXPORT_SYM(__initdata_begin);
> +PI_EXPORT_SYM(__initdata_end);
> +PI_EXPORT_SYM(_data);
>
>  #ifdef CONFIG_KVM
>
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index 466544c47dca..e4a525a865c1 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -319,6 +319,7 @@ SECTIONS
>
>  	/* start of zero-init region */
>  	BSS_SECTION(SBSS_ALIGN, 0, 0)
> +	__pi___bss_start = __bss_start;
>
>  	. = ALIGN(PAGE_SIZE);
>  	__pi_init_pg_dir = .;
> @@ -332,6 +333,7 @@ SECTIONS
>  	. = ALIGN(SEGMENT_ALIGN);
>  	__pecoff_data_size = ABSOLUTE(. - __initdata_begin);
>  	_end = .;
> +	__pi__end = .;
>
>  	STABS_DEBUG
>  	DWARF_DEBUG
> --
> 2.49.0.987.g0cc8ee98dc-goog
>

--
Sincerely,
Yeoreum Yun

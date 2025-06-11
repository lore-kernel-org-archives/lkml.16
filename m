Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010048.outbound.protection.outlook.com [52.101.84.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710D22BB04
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.48
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749653349; cv=fail; b=aLNbpHTViyh3SjtxEEnCuyUCCME2S3ITkd3XdC/xANxsdUvVA9h8TkDLQQL9c+4mp4j+YdmA56q1lG2NPSffB+S+oK1RRkZdjWyEOocvyWQkrmOY+p6Zccx/BlxqaXOXUntFbJGVzMaglv3qewchDK6XcuQlnMX6kFyNpzwkAz0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749653349; c=relaxed/simple;
	bh=MgyQr4XnURvAwuNzcR7Lds8tSIGP3X0E2nFaiEw0J4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dPs7aHxaMz9hDp6AM7N60GDve3x/uRqahZ1rEQq4Z2lj/+XsTZkLfVoXXz+FIOmfXxHtjd+QEpt3xxokd4gnS+tagR0g6WE1tLrGYUGEyIrleAOHKrolAxpyopPSwGC4y+IZnnrwtN7Gp4viM8CyVLnGoxW77+whQj09v4FfkVU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bCurzc4S; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bCurzc4S; arc=fail smtp.client-ip=52.101.84.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bCurzc4S";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bCurzc4S"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uGV0Z+0P7Ud1I0dYeSvlhWAd2XBaiqWJEN2EZBVlvIQmJRA1md+TOuAn8rQ8JPrBQrJa8Fk4BAwm5+JzIxP+pmheynoQlZXkgg6luxyqzPqNuZ+C9EHiGq/KlE6V48PM5A5Yu9SttZTiqiyZZSj1g+BCyQDjEXUuzFSrGB5RT4Z9xPCL/E/asEASM6pAvWHUZbzfy+kBru5Sq+RY5ut8zbhJ1dW++NSJC6sbs1l8LAwkM+aAx3lvNNkBGzH+WD4lFHh18euzLgVR6aPjdUxyVDUtaYn+AanJSYGxqcXQvRmpy//qbreyCMwEG1kdJyuZ07se1hFl+5HFUthXZJBHuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DivgVIb6UL96CBEuMcrZEyk2+7B2pJ5nRf7qdrPdzus=;
 b=cPCFyu8LZOEUHC1TR+atxkGhBdeRyjFN0cHH74Cp3nFa7wFatl0R5xOOmIAksh2pqPEwmsbKPyFaZS40NAnTgfwLAs3lxhcbXCSs3xWPhyDBomrRVHDcd+rceGo7ngZ5Jl1tpvcb84e8zacAU4/YglyEwcnKLrqPiVwxyG+yxX+vURZpv45i33nM/vajgXszaoCXzr/AKoi9gGAztixuAv16dGpfstiW+fNJUUi6enJQzx6Xnglm4pubY/v7P8STqqDIcv8fkL8XTB9vo7Js0Nb28olEB/Gs0TY534diV0r4pjEHSHSP585zCf/zvkMkg2m08PC5gyXG7QYqFLfM/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DivgVIb6UL96CBEuMcrZEyk2+7B2pJ5nRf7qdrPdzus=;
 b=bCurzc4SUpnXbcGsimCVmdNxtBUo7EntyBOldBKNjRZ/7J2PxgWJA+Xt9M3nzejJ8Yc80SLZViNZScp6CHDOkJkgMKJrErWc8BxuYg0Uwt3xBp/pu+KpO6C+OmxXxJNFqzs/M3MFbb2Xl0Yl5tcj0/hfQPPc8pRPuyAWIlwhJF4=
Received: from CWLP123CA0187.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::6)
 by GVXPR08MB10587.eurprd08.prod.outlook.com (2603:10a6:150:15c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 14:49:00 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:400:19c:cafe::3e) by CWLP123CA0187.outlook.office365.com
 (2603:10a6:400:19c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 14:49:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 14:49:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXuNXomAayqCmYwGxnIp8OLZNgm4io3a+CNVJfCwKxo5konSPKqoN/XSB32jT+a1CVWPJn4iENQ0AH1ZotGz/Qbc8nBky61JzuQFwoCGemSwL+ecImI+f1MiKf8nXl00bPLy52wDAshCLIEYxkQAI42m4g1hEEhGO0qr+KrHFrDv25YK7sSKhn+jVgF+R3eKIUW9GYKy2s1FPQG4Bc0EfZw9ocMCZ2ykVAaAoxmm6a3g5MNdsO9txOoFy2Loqe6rc+aoqLT8R0oeegPHDrYUEOvIhJ39bcmXbdm60g4mZjdDcVRZnaBagv037knQOI7vczYjLKoK8HwqzwB8S39dGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DivgVIb6UL96CBEuMcrZEyk2+7B2pJ5nRf7qdrPdzus=;
 b=qmBf0RNKuY7O3Ccp5yIENrVj0XsinQcqAePINYk2f2GLyLNcepgfqtXqSY9Rqv+9MOU0Wk3PsimNgQsgFvX8Y7AL3GgDojyQ/0hpUOLlCSgNsPjLK84tcgIy8KT6PvSNsjSHyoT2GRL3T6hICw1nOXSiKCb7qi33MsmxCGjmkJLbKT/XZoYN0KFeJMkql01yY/RpKnp90iNjZQrxbhzg1IBWX+JhyMGB9869TpQS8rW3LxrmWnumuBXJZ8gUicUoM+LO7y5MTOxpeniPlFZXEu/uDdZt0cNw+O5a3V5GStxSbU29Ev7PUc8B5yIZQdIYrO76XnTgDnzmWjB0587zwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DivgVIb6UL96CBEuMcrZEyk2+7B2pJ5nRf7qdrPdzus=;
 b=bCurzc4SUpnXbcGsimCVmdNxtBUo7EntyBOldBKNjRZ/7J2PxgWJA+Xt9M3nzejJ8Yc80SLZViNZScp6CHDOkJkgMKJrErWc8BxuYg0Uwt3xBp/pu+KpO6C+OmxXxJNFqzs/M3MFbb2Xl0Yl5tcj0/hfQPPc8pRPuyAWIlwhJF4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB8682.eurprd08.prod.outlook.com
 (2603:10a6:20b:564::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Wed, 11 Jun
 2025 14:48:27 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 14:48:26 +0000
Date: Wed, 11 Jun 2025 15:48:23 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64/Kconfig: add LSUI Kconfig
Message-ID: <aEmXNw01W6IosBXt@e129823.arm.com>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
 <20250611104916.10636-3-yeoreum.yun@arm.com>
 <07190b99-5e8c-4de0-b460-248ec39996f4@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07190b99-5e8c-4de0-b460-248ec39996f4@sirena.org.uk>
X-ClientProxiedBy: LO4P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AS8PR08MB8682:EE_|AMS1EPF0000004E:EE_|GVXPR08MB10587:EE_
X-MS-Office365-Filtering-Correlation-Id: 9babd492-5098-4347-21a5-08dda8f719f1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3hcYL8b4HpTwurBO2ZkDmyxqgyYd8WmemTKMXqFNxhVkMAWyJUpcdo7as2+a?=
 =?us-ascii?Q?7Dr1w1jSf7LULV1/xfrIVnN/3GSLw9lcBE5Po4/gP4eZ++bmciMwjn4Nyw5/?=
 =?us-ascii?Q?dsOmEfkNflDZFaUNQ+Njm97sInLrJt5BusSmPvs/eSvDKl93XwxE8Tx6Lbnc?=
 =?us-ascii?Q?grREzt2KqxJkr4bZbA2UY3/OTGJc49wsox9dqyOA+53MVaivFPNYxjVBBF5v?=
 =?us-ascii?Q?ZrpS9xSGlQjHx33aEuRT7zRC1A0uvXyBEDYr00iYek4pk84jbgfHXUTHMJlW?=
 =?us-ascii?Q?Wdw12HkXM8iUvS5ULlzr8to1LvID/ciEejsPAxF7X7giB/XtCR2cETBwNFqn?=
 =?us-ascii?Q?Vo8A3zWF5nOtoKQxqQIR+HAC466CcoV7qlu0SZIjiOxpBfBUUlHhUAEUrkng?=
 =?us-ascii?Q?wXDwJv2OkdOeqMP1KJjil5BnnMMwCKr7lgZXVf0SkI9og+ndEKYzbxMacXkn?=
 =?us-ascii?Q?gPyEAUxbetzV0mTJfviG2qAzzwe/OtpPZcOE2Ndo0IfuTRml3z/8az/GdjPa?=
 =?us-ascii?Q?+u0D8NvbDYLixYgjcpQC1oXaHBfWekz6IaU4UuQd607WliLkPjjWOcTgIsXZ?=
 =?us-ascii?Q?X3K7hZkIkPXCXQhwY/6KWSG3rDC1YjhlXJ30ms/hGN0z7YxicVWq9d0MjpsS?=
 =?us-ascii?Q?xENDlAx7L11OfYY6OAVYOO6f7/wV5wL8Ecy4AqWP0FBHk155s71kul9DLBW5?=
 =?us-ascii?Q?YxVhud6CZoAPtjDb4XN+avpTn37bKYK1WMqxeHEN3zGbrO+wWbFy18/BuVbR?=
 =?us-ascii?Q?VuwbNuRFc/c9q0KLiC9KBzo/VAQ0DmhxQOAQxPwRQAE8Ih83lphSniJuL2Dh?=
 =?us-ascii?Q?3D920q49BOT4g1S6QFPMhe4sz+O5NCnwPSaqL0Jftg9Fo2MOKYzpv+gdT/4p?=
 =?us-ascii?Q?7yCQMvVhJ4nVaPaHJI8xFpCQubvm8J/EyoUNDx+eE/N7BqOGbe6twIwEaaSm?=
 =?us-ascii?Q?5S8Mr8cOluPMl1LoFhzGPeix0EnlsguZlE0S+uvAdLI9q1cR0fmcfdUSll4G?=
 =?us-ascii?Q?tGMf+jLooLdNVOg00volBT/TFVNmpy/LSdgRixKG/P1PAUris5gTGHH+8Cvq?=
 =?us-ascii?Q?VMPEuRWzfgG7yjkSn+arZghCzc2qICeFHm+PxFDwX0uZD+2bX0ZrEIp1+Azz?=
 =?us-ascii?Q?w8jbvj8QVGk70F7i0BbXW9wNuLXGKG4QEPEbmystxf7k7g7sLgux0N20VFtH?=
 =?us-ascii?Q?WWN41wNtQTb2JgSUlUNNqFYygNhDLPwQytxKN1yNpdw6WCeBHtkWau7a65GU?=
 =?us-ascii?Q?neRLjR/1KeAvt7cn5bHvOmE5S2AA6UoOb7ktv5h2GvY1QzlAT4kFWkJo2dgC?=
 =?us-ascii?Q?ocAh8IbNMhUPJQCTesI3hgYidXOsmc01S9+TcSTEns4jOdehEGSvYwdv7+LJ?=
 =?us-ascii?Q?8jQwpSJoG1rjnhL+JfgkS/XFcfLUSDhfvOwzv9M4vh0gbdW1lTGj2yaQniz2?=
 =?us-ascii?Q?Z00ZURMQjI0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8682
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	67aedde8-e654-403f-790c-08dda8f705f2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700013|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UbrF6CKaPfMfn3T5VPTbABFODlzKjeFIO5W7K5dkPx0uv/6rGGnroHz1n6aw?=
 =?us-ascii?Q?YKoSmYHPx3N/6IxICX8IEvYDPbk04lUhltQMo3eEopYt6HgAmdFpPTZnu9um?=
 =?us-ascii?Q?5qnC73VelRqBw0sfVhU/6dkTeXdGyuH/91n7T9f7Hoj+HahHu8hPASKB+A6L?=
 =?us-ascii?Q?YY0uFFKryIbq2hhjW6++sasO2p/dwfbahApqjuAjw5nFyUrAQxIYbN81AU/t?=
 =?us-ascii?Q?d9imofUFPWyePMBUVQTjkRenHWnni778EJfwNCz7zVgSb2FKchNM5ZO7yhiA?=
 =?us-ascii?Q?sg3F1nSWwV5GD02az/sZtdbY4sU5rltIpddvN6BVIeo5TM1hPj4fbvkWZQ87?=
 =?us-ascii?Q?7sdjcpXX/LF0jaNToZ1WzKJu6WozGSok7sqdNCgFZZ8t+tZfCJ5iJ4bIo+df?=
 =?us-ascii?Q?RxOZ87T3QCE/nkUgVgrzRKPI+vqMeZ6QS2gJkTEIGH54Y16mF6qbQrz+yKj1?=
 =?us-ascii?Q?qjxwOUQFpMHnAtZReFu0NCb2XL0Wb9lX2Y1Qm+H74+eAA1k64G/o6AqPdrGV?=
 =?us-ascii?Q?52HO/ZMBSdFIH9YWh/n9oQ4Y8pkzNc1brQwmc1LUKbwZ/bM+b+u9kXVZRZBs?=
 =?us-ascii?Q?vNf5Mwzgh3qXkX8veLlJK2TRCbO+frGudLdcgKz5FzW1pgmwrpTwWT2OZWN4?=
 =?us-ascii?Q?3FkpqDHRt03+lmbbnFS5jNg+KM02pOXvgFEqZaEDFg8qzfcAAwRpVDSXi34L?=
 =?us-ascii?Q?4Tzdv8kfYoTeuOF2hnrIQ/U07140Fy0ZMr+LpvuKvL4dX4k3GeGBf1sfAFnN?=
 =?us-ascii?Q?rfe3EAragv37Zp1dLpoCO2VcHg4Eoup63oFxAuBCh0gZyP4394NPYsX4XHKZ?=
 =?us-ascii?Q?UsQIWp1w+aNXTTqFcLrC0HLVmeLi/pT0qp7iUhJeTWyQ5fxNujCz/F5MYcqC?=
 =?us-ascii?Q?KLwNUFucvgOPCv5pRpIQZcdUSTFLTCNAYArQUU2z+jRdaJX70h685kcS5CsL?=
 =?us-ascii?Q?CxbqDvsbdtyIyLAAhKFK4wGzUVk2+pYtoZgT+rmdrN0mr+cKoXofg+6Vy6an?=
 =?us-ascii?Q?4Ofw075JglieqULwX7TulGxf6hOfE4xRFMfI/o31AWZTp8IptZrMuNj3ZvlW?=
 =?us-ascii?Q?qgL3PuXKQTWEyFpYP9bSXCy9XteSzrcatClbGCraNMVZG1KPoOeOfx/FySnA?=
 =?us-ascii?Q?tjiuySxTwx+RreVz7Dk30Nx3xdWkHfpA/tFvXcMAJBQbZZKbnI/19zUpbBzi?=
 =?us-ascii?Q?5N7syFSxGkGrAAHt2ymYYdhLgcylKJzCKyO1hNg/THjr3Wn4EKagnHsLCwTn?=
 =?us-ascii?Q?S4e2RUL2ORqidz7wOpq5uqNxKAMqP5po5lDMoZU/mWM5dnn4zJs5fgcxLDp3?=
 =?us-ascii?Q?Rr4qZH7KQmm1PjkK3TdkrzuqbKiDCBA/VwtG3XSA5SzoxHSIhO+pgW1cUFOq?=
 =?us-ascii?Q?mz6fBQpm42inzP4ifi/R3aoul+RGQoGJIyg7D69oW691klhO0lDnOfMFPA/Y?=
 =?us-ascii?Q?COLw2KBnJBiUrI49r+g+1MITNhJfXWIe1hpbSL4x/Yr1irKSskYzHw7rubiF?=
 =?us-ascii?Q?9hASFEYoYUjcZSYI0ASUDDigOqmyX2iyDfXA?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:49:00.1277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9babd492-5098-4347-21a5-08dda8f719f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10587

Hi Mark,

> On Wed, Jun 11, 2025 at 11:49:12AM +0100, Yeoreum Yun wrote:
>
> > +menu "v9.6 architectural features"
> > +
> > +config AS_HAS_LSUI
> > +	def_bool $(as-instr,.arch_extension lsui)
> > +
> > +endmenu # "v9.6 architectural features"
> > +
>
> This is adding a menu with no user selectable options, does that not
> result in a confusing user experience?We do often add toolchain
> feature checks inside the menus but that's usually associated with
> hiding a user selectable option, if there isn't one (or any other option
> for that arch version yet) we should probably put the check elsewhere.

Well even the v9.4 menu can be printed a menu with no user selcatable
optoins when UPROBE is enabled (ARM64_GCS depend on !UPROBE).
But without any selectable options adding the menu seems weird as you said.

Like AS_HAS_MOPS, let me define AS_HAS_LSUI without menu.
I'll remove the menu entry.

Thanks.

--
Sincerely,
Yeoreum Yun

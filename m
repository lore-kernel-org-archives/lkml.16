Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022129.outbound.protection.outlook.com [52.101.126.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBA3149C55;
	Wed,  7 May 2025 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746582170; cv=fail; b=UWb8jQDlYmbgv9UgGT6OdVY3UhRrICeNDNILepf1KYzME0/IDK19sHceK0yxTEESBDDd/TZfO7cDfNuF37/jubxdTunQHYdGkVizMF8oHbhhklTulmGmPmuzP9HGyYT4FvxuO47ARu6wMKEhMUr3WZuaXiw310gTuL2odK7vR0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746582170; c=relaxed/simple;
	bh=h5a0lu2uWZ6xtJZE55ctAl0fgUodRf7UrwBlyOuCK6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE5kxpievQPlAVVuVufptsGTrRv2dV3f/RkwXdcXpd4Avap4sOi89f/L7ZS/mDhn0Q00XyypjaxeyAg51Jn+IqTiyueFTOGzjvIvcZh1rZWwirGtDCX3Ld6+t53Z+qfKV2O1Sr37XDLuYru6Ij4KuQVcky460wRfcDGcTjzwaVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EynwA/xpcR6Wv/zF0I7cHqBP+xFxXM7/LEhSVJ5uASULplxEzzMovEGpTrfYiYebI0T5FPtBAk/77hWgaCEHI01SgUUJ4PWFK9NzNgWmDjfRRvgo0j5nNW2NeHWyaPiDmiXq7Vx7R7F/C6DCH+Be93Yzn9Bsas1w3lR3XwyaP8tUAQOxnxlU7/z3842CNwVDn4K3L2Qvu6N9VRHh78NvtlZJOEsGpz9CCIJnzf2VguIwaPKp/o8NQCII2kE/P3CT0MtOkQpcMaKDvXNqASKHmGkXuPnWyctKqSJxM/C9dxyRPLVn9XPIbPIVP/TLk3lAg8+VD4w54g8Iu+ltrtx/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO6+OFH4to7uYfaZlDshMTZtrLpHci7SAywo9hr66Mc=;
 b=oFQRWTQ4MORBRj8/1cvacRxl+07N11xC4n0z7ORD7r57/SlPechYcpLVubtbOgyo7by0sqwLIZKwp4IyI7lJCrCTXLMGCmroFWoaEPl5nyHDNtX1GRySzxRmiqlJI0+0bwHFLaq6iQs3SSxqpr6wOaG9nMZIYHqHh8KpqqePY401gtyBfAXSmoLkSXzdtsRRF+sykmp9THsB2k0ALXFXf5JbG+8cnZFD93+zJdZbfOkCavHy2rx0g8BzCv2umsLJ33nxkVoYHGNWSzw73383AcD4wcZzvG+X55d+Jw6lTZkUrn89HpzgHTU42KlkilB9eMxJ2ERLI3hCgSjP6CbW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0056.KORP216.PROD.OUTLOOK.COM (2603:1096:101:115::7)
 by KL1PR06MB6428.apcprd06.prod.outlook.com (2603:1096:820:f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 01:42:41 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:101:115:cafe::3) by SE2P216CA0056.outlook.office365.com
 (2603:1096:101:115::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 01:42:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 01:42:39 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9F51C4160CA0;
	Wed,  7 May 2025 09:42:38 +0800 (CST)
Date: Wed, 7 May 2025 09:42:33 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com, sudeep.holla@arm.com,
	eballetb@redhat.com, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v7 9/9] MAINTAINERS: Add CIX SoC maintainer entry
Message-ID: <aBq6iY8ofJmNWFOf@nchen-desktop>
References: <20250506090752.3695666-1-peter.chen@cixtech.com>
 <20250506090752.3695666-10-peter.chen@cixtech.com>
 <2e0efc8f-516e-47fb-9a8f-f140bf8a47c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e0efc8f-516e-47fb-9a8f-f140bf8a47c9@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|KL1PR06MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c434fb8-8be2-4c74-f9bd-08dd8d0873cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S8tfqf8ICo+jtLjlOcKYiau0f19RlcDVR4UsH8Wb892GXLvG41/bLj8wLY0B?=
 =?us-ascii?Q?uBWEYFATp/nANFn3Lrq3i6KWhsOqxuOSqljVCmmvTvKaIOAviPsjjBqR/9X3?=
 =?us-ascii?Q?5J/uRspFUYN0KMWQe+3ujkP/3GP8ahgJzFYj/7WcyKFU5sD7emaZMk79SRcJ?=
 =?us-ascii?Q?9h51LjMb4bURpfptcvPOnCVcUMVVlKt/VZcOOhR2vBiZvXh0oTmqvOYfZ1eo?=
 =?us-ascii?Q?fFV0t0h1zOxYmNNBwTbIvDV5a7RaHjszX+Yl9VN5TBKhthbPzbk07rkp+Ijw?=
 =?us-ascii?Q?3FJD7aB645bYkqHmOhR2Z8Te3Mkjusbtrt3s2RCr0+1FvT9uhQb8O0zNeqG9?=
 =?us-ascii?Q?zrwNIQ4PQjYPYW1uMUmEZqegMmLJsjgF4BwHiKYdAWPW9AJJZmzV1W+zvIiV?=
 =?us-ascii?Q?cq7K+0Qie1Z0RC2kws8KKl0+U8VYiCNuiM6i3/2w84RANMUtCBHbtwvbw3vA?=
 =?us-ascii?Q?dce+TUaJvIn7Z2mQIGvPM3NV3/ICZx13kO3fz8X5TNFEKWPfAmXdtXHlIhSA?=
 =?us-ascii?Q?6tDDbRm4OuKMfP9D2Jo9Cpf9qccKm/9EHEev/TZc0TkyuMD/3UK2UbUjL+6s?=
 =?us-ascii?Q?w8pD5/aX6TOH8BPW9c4G1zIZyU9pSPKhHgplzaQ0+IUjYrYpu/6U34Y7Heeb?=
 =?us-ascii?Q?MK6f+CEN3zX2xTL+PIQ2imXTZ9AVJptGjpYF+sRfLVX6HgOeG7PNKsxTs3Ka?=
 =?us-ascii?Q?r++IJlQXaUL9VnFKGjARVNGxoaSok5rEH1G9KhxxUoZKv3k5rkFzPqfyyq0O?=
 =?us-ascii?Q?1OqBMnhuDwxQ0Hf46xich2wNKD1Wjx5eWVypFA06lboBImjcb6un/zqezchQ?=
 =?us-ascii?Q?tGUNs9CZXTC68+Nsf1iJJ73O+4CnxW+425feb+lIOTETSfJTUAb7rLOwvgru?=
 =?us-ascii?Q?k91vey7T5A9iRQoL7HgeMng1oY1eDviUHo7tCpUZSD9d0gBZg6qs7wlURQ+5?=
 =?us-ascii?Q?pYXFREFOgZgW9MLPtLc1DZEjzv3As205llJ/tol4TbS2kkjvadPywnuvLmNI?=
 =?us-ascii?Q?hmXQ4JRTHkJ/PZhRjgDMVd+R3eNTEjmTHvcRoEEbPSW4RT7Q3WhNhy09Y7Fr?=
 =?us-ascii?Q?LYP5ruwE6qaidpTRwj7p1rPxabskXhhY6vBn34viy0ZFk/lzqY1WdPDH4vqp?=
 =?us-ascii?Q?i2HyxHgMsOjOlpwFEwFSv4GwJsxmz0pwtYHnYpr75w+5B3tjcn/vItMNaxVi?=
 =?us-ascii?Q?3w3XmH2//3VvkSPGyj1rVWm0B19tBGd12U6dcCOnNRap2BXgXLpLjfJjXp5y?=
 =?us-ascii?Q?0deYQHefC1/+cSKR8TarE6y55FYNTgfGVBoKsO/L921KIKwFR8YOLZbDpmRp?=
 =?us-ascii?Q?Pd/djeP43VOfv2NW3L75hz//Aqun3JWj3jKYQ/XNJlt3uT5xoIhfR/KHSOcU?=
 =?us-ascii?Q?5pI7rTvERIZkNDQsiT7fRDkv/YtGps+JLOzshq8qMY14xeR2kl4eYvMhLOT+?=
 =?us-ascii?Q?tS9gQIThkkbX4mKjET79jxjqV1BF+qz9Iv7fqFxFjhPcOMjlQWZ2TA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 01:42:39.6157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c434fb8-8be2-4c74-f9bd-08dd8d0873cf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6428

On 25-05-06 20:38:45, Krzysztof Kozlowski wrote:
> 
> On 06/05/2025 11:07, Peter Chen wrote:
> > Using this entry as the maintainers information for CIX SoCs.
> >
> > Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> > ---
> >  MAINTAINERS | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c59316109e3f..169b89eabea3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2404,6 +2404,17 @@ F:     arch/arm/boot/compressed/misc-ep93xx.h
> >  F:   arch/arm/mach-ep93xx/
> >  F:   drivers/iio/adc/ep93xx_adc.c
> >
> > +ARM/CIX SOC SUPPORT
> > +M:   Peter Chen <peter.chen@cixtech.com>
> > +M:   Fugang Duan <fugang.duan@cixtech.com>
> > +R:   CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
> > +L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:   Maintained
> > +T:   git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
> I am confused. I see this patchset already applied (3 weeks ago!) to
> above git repo:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/log/?h=cix-for-next
> 
> in a branch claiming this is for the next. This is the branch which you
> are supposed to be feeding next, so:
> 1. Are you properly feeding linux-next (see for example my beginners
> talk from 2023 plumbers how to do it)?

Thanks for your "Beginner Linux Kernel Maintainer's Toolbox" presentation.

Currently, this tree is only for someone who is interested in CIX SoC
upstream pending patches.

I have still not sent request to Stephen Rothwell for adding it to:
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Next/Trees

-- 

Best regards,
Peter

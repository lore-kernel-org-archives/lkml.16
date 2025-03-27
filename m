Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2131.outbound.protection.outlook.com [40.107.255.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A2B1C5D55;
	Thu, 27 Mar 2025 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743057894; cv=fail; b=ripupQ7UgIQurNZhG2iKHp4l/GpFdDq7dEt7kUd5tye/yZhKvG0O4hKhEu0QLP8XSJ9NG3vnyu24C3tClDuwUCq49fKVENDQtodSO2VEKL2Hwuy/I8CrKSAvLhFFnsPmbVZhg20926TsvoN9cbcQM2tAvHVjQFRFyEHAdYfjkBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743057894; c=relaxed/simple;
	bh=D55nfZ+kkO/Wbg/HwMhmQKcA7oOInAsljWkqxi4rKSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qItW+tpTgirOJmqSU57E9YWTMNiMrQ/vaCWajqOUT01/fHSptr+c1hxmbYcpROU8A1ZvmfYZfFnJJCWpWU8hBGvKK638VBvz0vPFrWo5sWzdfOkfnjvhSw0Y3Q2FF2fABZpvuLW86x9/dh/D6OPvaP8Bl608zQSJUNaJYecHBz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.255.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rd0Ov+za62JG1v2T7jH8c/J9SEYp+shZAhwH9rNhOIwRNznhAEUGjnxSuXCr15N0Flpsd9JP/yIZ2K8/56mRKY0d9LmgmIH3NX2NQJLEiUQZJWF6eukh87ILudFnufo/7JZFWFdB3ywXe9Dj2DIMiY4PzGWlqVloCf2+2mzseLq1iUZ/4XqYdI7gmt1hNdC2xhXQ/8/2twNyY1xapLl0l7MbVgeZkxYD+6fY1tDDHr7LnMCktHk8cXLtI8zYla7MjsoLP5T3ecaDM0u81Xcd09H2Q/McTgn0TPWhvJdLzApDuzjOsVYzguhHwFc/bWYnTxVfQqgzCo07ny2o8zsgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoxM2ZNUDoGOajPL7E9zX71F/k1SrQyTzShSOlrjhfs=;
 b=bOvpI/d13toJPML/sNuy4qcGToaxxbPpGOvJMIWXDAmpkkQgXaZIIAQux3qmevxIK3S8rwxu7nzjRgds1Fos3Z0zaMgm4q3cqckyk1a8Ya/OrAdeUoL3chkEkqVlyYWxG9YSn84SQg9wvUPW0IqmaYiWEeu9pMXHzP5tf+yogus/BneyT/e+Xpru6HB6oJMMKJ635YIrbvpHkUQ+D0shuK+FY9CL+YqhWDnQ9cjlwtD32MSLaLGaOMseLbCe3ff395HqI518b7ZaSc2bOG5T+Bdjdf3LIVeEy3xd4VowgDgI3//yVIuKV1dvMQ214snRdQfx3uu+I6E2ShY/bGhH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c6::17)
 by SE2PPF444A52B44.apcprd06.prod.outlook.com (2603:1096:108:1::7ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 27 Mar
 2025 06:44:45 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:400:3c6:cafe::55) by TYCP286CA0166.outlook.office365.com
 (2603:1096:400:3c6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 06:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 06:44:44 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8DB8B4160CA0;
	Thu, 27 Mar 2025 14:44:43 +0800 (CST)
Date: Thu, 27 Mar 2025 14:44:38 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Marc Zyngier <maz@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, marcin@juszkiewicz.com.pl,
	kajetan.puchalski@arm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <Z-Tz1moMNozx23k6@nchen-desktop>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org>
 <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pukm9yd.wl-maz@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|SE2PPF444A52B44:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba70125-c3bc-48f0-1819-08dd6cfadc5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a4EnfEdQsXhigYOqHPsWFedCJZvyZ8L9doWrlm+h7gvb5HjXX40usbGDrQ+v?=
 =?us-ascii?Q?myu2NSHRiba5adVuqPARUo7oJ4qssfvZlqCcylr/NNpw0aYoZk16ye2G7wNX?=
 =?us-ascii?Q?UA1oR/k4AcwJBfU5eqH9hreTRIoZSh9dA9O9W8ZkRHaKrutKbhu7Xh1fgf4Z?=
 =?us-ascii?Q?MfjJaXRRnDi5RnXGARimVqFq46qLPzsov3O5hmrVU1xHUMy+Fkfdto02cDKO?=
 =?us-ascii?Q?6UgWk43QaxE+zvokpXi3nxIYt1qMx94NDnjl3EqYfcpqJ0crbIB/dg2k9Ibk?=
 =?us-ascii?Q?sqUi4hJkAk5r6pL8lLZpC/UKwNaGfta9evlPuX2syHVLaAZFvN5sWOkrf/+8?=
 =?us-ascii?Q?mGK+mYiL7LprA8wAI+NBfbyd0GQIPkaR0mnW5axlZbEpC5U00mTObFgztQR+?=
 =?us-ascii?Q?mqSvKXcwSFVmrSELilOOcn/1+AG02mkv+r+reQHydSb36/OO1OTG1hpqY+++?=
 =?us-ascii?Q?3TSErg6mBWTlvgBScc9tLOEy1/qEkKnyvfiSly1ytbqEHlnBBYmpWx1VtC0x?=
 =?us-ascii?Q?QlPDFfs3MXbcYHKXptLaMD6q+VP/X9B3GLU2lvJxwPaNRImzriiYHwMR2Gnn?=
 =?us-ascii?Q?5Iw8PrHetdVQVAwHC47hnfdFy09IePfMgT64TTZPibN3yRrMuBBfN3dl6+KO?=
 =?us-ascii?Q?LjfmhrIdDsNy1QnOI9eh7p6NVimas6wOYfKZwYFnaeqjnDqL9XySMsyKL9rZ?=
 =?us-ascii?Q?j+QOBUg329oZHQPHm55y56lZin3oVcASZixVJpYd7EESv0rcHIe2o3D8FcbA?=
 =?us-ascii?Q?OBOgZZGEr/e30e1QS4xCPMsgCHQ0pqk617kr5ItemRcbKqG8LW9zQLFoUZ1e?=
 =?us-ascii?Q?1NojtVmobWIgyCnTUm4iI4r8JrGxlAV/APqw8n/1sO+Y88184w5y4t74oMcA?=
 =?us-ascii?Q?3cI7juMoF/ChBGBkvJv26JxGtRyhlN6/BmVrIIAjxDaaZUVAIvkG7Gyya6NH?=
 =?us-ascii?Q?8SVfriRwzU50c9Ovnq039RGG+RV4KcWmVtvLmH+RsFmWgGtv0OY4x98cUST8?=
 =?us-ascii?Q?4L/LH9oZJ94fegKR7zCQ9HIg3vs8lqaKaQaMNDIz/fELE87Eg/06QINkJx7P?=
 =?us-ascii?Q?0Z5oOx1GCIpgUDJVau7CGfs5cx3SphYptnQHdl1zL2X5w12VXU5rpA4Vs7iE?=
 =?us-ascii?Q?VaGUMca1YXAynBSXMbE7VhggeJ2eGNegmMjvMIGZG+E7/uLZVIGCBcBpNehE?=
 =?us-ascii?Q?FTE6Ara6+bnXLoUPhVjLQEII4rhN2+hRb4K3GWgLWtYCNA100+Ssj6/DUBh5?=
 =?us-ascii?Q?tJgN0RR03LhTvU2lRIdxzINDIdlrSdujoADSJGR5v6olpLvkaTMz8YxevWQz?=
 =?us-ascii?Q?/CJvvBx4B8HxHOpmjbr5DnTk2V/V+L0sg79vA88beCskrxji0Fu27VYoQ9E9?=
 =?us-ascii?Q?aXdGh7lcnNoXJutm65N2V7Any3mB3CjIMUS1dbrBmaUOS1xeK38fEmx80NJB?=
 =?us-ascii?Q?uw5W/7VUGmQ=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 06:44:44.8558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba70125-c3bc-48f0-1819-08dd6cfadc5b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF444A52B44

> >
> > On 25-03-25 10:52:10, Marc Zyngier wrote:
> > > > +     timer {
> > > > +             compatible = "arm,armv8-timer";
> > > > +             interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
> > > > +             interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
> > > > +                          <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
> > > > +                          <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> > > > +                          <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
> > > > +                          <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
> > > > +     };
> > > > +};
> > >
> > > I don't think there is anything wrong here, but it is also a pretty
> > > useless DT. There isn't even a UART to interact with the machine and
> > > find out whether it has actually booted.
> > >
> >
> > UEFI uses the same UART, so we could see all kernel boot logs until
> > switch to use kernel UART driver for printk. If you would like boot
> > to the console at initramfs, just add uart node like patchset v1.
> 
> What's the point in upstreaming something that requires extra changes
> just to boot it? It only outlines these patches are not useful as they
> stand.
> 
> >
> > > I reckon this should be part of the initial DT, as this otherwise
> > > serves little purpose.
> > >
> >
> > Without this initial support, we can't add some base drivers, like
> > mailbox. The dt_binding_check will report warnings/errors [1].
> 
> Of course you can. You just add additional patches to this series,
> making it something that is actually useful. So far, this series only
> serves as marketing material.
> 
> > Full UART support depends on clock, clock control needs mailbox
> > to talk with FW using SCMI protocol.
> 
> Then do it. You obviously have existing DT support for it already.
> 
> > There is no any support for CIX SoC, so we had to add one small step by
> > step.
> 
> No, you are deliberately choosing to make this platform useless.
> 
> That's a bit sad, and a waste of everybody's time.
> 

Hi Marc,

Thanks for your interesting of our platform, and your comments
help us a lot. But I don't think it wastes reviewers and maintainers
time, a clean patch set saves everyone's time during upstream process.

For how to organize the patch set for SoC, Krzysztof gave good summary
at [1]. We are going on upstream [2], this patch set is just a start
and base but not like you said for marketing purpose.

[1] https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=duPVZX==0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c858ee3724c83c
[2] https://lore.kernel.org/lkml/20250325101807.2202758-1-guomin.chen@cixtech.com/

-- 

Best regards,
Peter

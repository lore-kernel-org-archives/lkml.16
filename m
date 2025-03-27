Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD353207E1A;
	Thu, 27 Mar 2025 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743064515; cv=fail; b=cCEohYUkbHA+ucEfRXrkd9YuPNhvIDMDNCuFXQb5E23HcoXV0uN3Iw93XfeNsvRNHyIrAtJUusSXkeL9gXKyqkMHaclukM7NUrSr7mtXBwlHCN22LBn+HIsLkNYrth7cCXmwiZJqN+T78zeOnv5UpAnrU92/HVwZd7bGdPRPU2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743064515; c=relaxed/simple;
	bh=2GKsLuxjTsMXCt9j209aS2cpygvrmJtznTe1dw3OYKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSrf2QrjEc07eFo8L8bcw74Z36uQin9c84KefOL64z3bAoLDuljEB44gXOFQc2qjflVf8SxhglXEi7mny0n3Sil1jarns0+yhY4Bv12xUoK0S/bSOzAjZ/v+QKEW9JCXqyZ+TCycOHwoWMeFXJRDlyDUFkplAF5O/NE/wwkHwUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.117.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWV0JZMLcpiPo8h2S67v7OBbRj+RijLbVPuxhIK3RSs65foFxXxwPvzGPFrEr8rUjLhWe75jZOrrRp7ewQHqERfz7ewoJEg83FNC48rR3LHSATY3Yx348XW8d+2kvN9l2yu8xvDOK4ly64cVrCGbzfDJU0YL6SCqgiVedy56ANSRMrZpZpCnOXqAEi7Eo4ltJCNfPQuXKAaFL6HfRtsXBgRZoegSoPWFjtcA14ZuGoMCH8IFIplKZidSDjjuF4zkp8Ial63dzJ8EMEy28YzRDKh7yBMp3gBpzx6yefQmdz4AiKRTGLSXYSjSWpgVogxN9KqzYfK6gs4n4iIOvSOFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDlVt4FSUTGLCu2124JJ/IMoAeK/iPh22axagZc1h1I=;
 b=X6hVvf4tTU6MyIuZsoxUD8hDpoAIgjrspW1ZSrO2gpUX1I1It7fSw+/38zhfyYPx54yZxHsSGV5aWi1/LGeqcek6XXZvb/FDj87yTJToCuImZIX799/HUwA0KM9guRYM3kTmwnsOZrqyIkAdhqy9vk9zOUejBJDE72WRYZa9C2IybQpw3Lesgi7ZockstxdZWi2vLyCJsT+3p3fylBAVNLqsaXLcn/ojzf5t82+j9YsESqc6+5IJfQCDte+BIReh7OvmLCvJ3k4796i5gPu3chrAr8Qqd6INdz4TO/QNSlM7z+xmDKeCod6FwPeZ5FERsViYabQkLZk6k8Eh/izTpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0044.KORP216.PROD.OUTLOOK.COM (2603:1096:101:116::11)
 by KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:35:09 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:101:116:cafe::ea) by SE2P216CA0044.outlook.office365.com
 (2603:1096:101:116::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 27 Mar 2025 08:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 08:35:07 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 909B54160CA0;
	Thu, 27 Mar 2025 16:35:06 +0800 (CST)
Date: Thu, 27 Mar 2025 16:35:05 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, soc@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl, kajetan.puchalski@arm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <Z-UNufwSNmZreKya@nchen-desktop>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org>
 <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org>
 <Z-Tz1moMNozx23k6@nchen-desktop>
 <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|KL1PR06MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: df5e7c3a-2079-4d9c-b3df-08dd6d0a47bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nnN/LT2Erm1Ksw+IexTKsvBIuvdlv2EXm+EB4oJ7wj7zpNHqePi8RLTb+fPi?=
 =?us-ascii?Q?08MpcYoPiaC/V33YFEbcFasmcym+Mu73NuEKfN9sujMt5FHOv1BIajqK9VRN?=
 =?us-ascii?Q?ZJ0yw7mCBhtYCYX369oXElq3WmPlClrNW4r8iU+YN05KegJmhJjPlXLVhFWo?=
 =?us-ascii?Q?esdtWMqMVRNE2QCKA6BGaxNj51W1M+FuXbqwjVoFJ5gxGq6s5pTVAo1Pkglv?=
 =?us-ascii?Q?2L/DuwiD93M3xhRJ+Pu2PVmcpngwCi8IOOwqy8cJNJvnB5fTugZx0QmCBHEn?=
 =?us-ascii?Q?refZVM61MorOAldrvI26QccGVZHkGXewg/d8GwmA4EmQ/mV9oOMFdnNjaank?=
 =?us-ascii?Q?T6eWSKsnNmb7p15qpH5evW0JM+eEvHe04Xh0qXaik/Nt1yXdskeVQhSeYb6A?=
 =?us-ascii?Q?UMJXJMnbb+nhH9DrIkpD8V8x4KIiELKZKpIffQOB09UQ8wunI3u2jHK5GMlR?=
 =?us-ascii?Q?3wsI5FZncYcUXZJEHLyF39ofs/9JvK3isgeHLCRJUzrjhC2i8x9Tec9pI6ke?=
 =?us-ascii?Q?2wF0srLzuOafpwpOpMefNHZxMu/dJG0d7D9gIMJR8G/nOwgq0MKeZrdMrTjn?=
 =?us-ascii?Q?/zVvCOa8DlkkuCcQjVzzTnKngOqtePmlqEPY4rOdmzeggvlARs8KQS3h9es8?=
 =?us-ascii?Q?55KvVu80ngDKUxiZQLHOwmIl2voi8Vnfa0vzoW4KipHyREijq54lgMg/fCo+?=
 =?us-ascii?Q?HlZ1SrzAbMjC/JPnfSVCarz3Va/+jXkKEG5XHBIxNI8XAziZ2+5/wiw85ULu?=
 =?us-ascii?Q?iRSB61Bn0eN6OXo0HcCXblqk34hggS+RxrLcmBcejszbeNnwbkUPwFt1kMEO?=
 =?us-ascii?Q?r8QTQ1STiwb/CWy8RlwC4S30abaZ+iYHRhh0tKwpkWcIzjsQC6dN4x3xWFVp?=
 =?us-ascii?Q?tMWEVguU5NanF+2RhXjS88YsxY0MvwuvkOqsXYVUe8IeElnqXZVRoDFO8QNy?=
 =?us-ascii?Q?be90XaC0YiWUHYd3hQJX8ymN9R/RCI7fbL8ioz8kCf4E9ePlWIFVDxfRdgBM?=
 =?us-ascii?Q?svePYy/1rC2n728rPcRH44HNmMiYRNRPgJPBTjmsTsIIvVHqGKJ/gV5i2ikl?=
 =?us-ascii?Q?DXI69lIVdhOotRp7ooolCcznVNFg26pY5WMp4/yybmyC1mIW684MvA6DYQgu?=
 =?us-ascii?Q?5h+8+rISRFMOTGYkrNaQRJweAHjtTATwrBVmZQNPqRpTJwRFNrPS1kn9EiNp?=
 =?us-ascii?Q?0PtVV1nhFKMT//3g8nl6k6d/QJrX1WhSBuY8Ms2OTGap0gE0UgiIr/JnJ0CJ?=
 =?us-ascii?Q?MIP1oXl6C5r+Y2uHT+9TAo0IZtEnfxd2g6CnRmqyhApxIsHhh9ZSPVxXAxjM?=
 =?us-ascii?Q?1eEc7qZc3tl8WGMDX37gzxQV2+61RSgFirLzJuUyT2GMhMReeCLMM2GkZJKY?=
 =?us-ascii?Q?yrWR9GbSsKIVFQhb1AJ3QFgk81xXaMcxBV4qxUvIdCTRGymyFb07oVM83ItB?=
 =?us-ascii?Q?tOSjsRsDzrtJP0FAlMlbYa6veq74pFT79Bh7FMUKxvgeCetouq2NEkdQHlA0?=
 =?us-ascii?Q?85GHjJWcSNToYtA=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:35:07.4980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df5e7c3a-2079-4d9c-b3df-08dd6d0a47bf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7330

On 25-03-27 08:16:33, Krzysztof Kozlowski wrote:
> >>
> >> No, you are deliberately choosing to make this platform useless.
> >>
> >> That's a bit sad, and a waste of everybody's time.
> >>
> >
> > Hi Marc,
> >
> > Thanks for your interesting of our platform, and your comments
> > help us a lot. But I don't think it wastes reviewers and maintainers
> > time, a clean patch set saves everyone's time during upstream process.
> >
> > For how to organize the patch set for SoC, Krzysztof gave good summary
> > at [1]. We are going on upstream [2], this patch set is just a start
> > and base but not like you said for marketing purpose.
> 
> 
> I do not think I suggested in [1] to ever send new SoC containing only
> CPUs and interrupt controller, without even serial. My instruction [1]
> was how to organize it. The DTS can be even fully complete, see the
> upstreaming example I have been using all the time - Qualcomm SM8650:
> 
> https://lore.kernel.org/all/20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org/
> 
> Entire SoC sent to mailing list on the day one of public release of that
> flagship Qualcomm SoC. The SoC DTSI and board DTS have almost complete
> picture, except few trickier pieces... but it even has full display and
> GPU! Plus, as I explained on my email on samsung-soc, that DTS/DTSI
> patchset references all other bindings with their state, so SoC
> maintainers can understand what is the overall progress and what will be
> the result in DT schema checks, if they apply the patchset.
> 

Hi Krzysztof,

Like I said in this thread before, without this initial support,
we can't even add mailbox binding that the dt_binding_check will
report warnings/errors [1], the reason is "cix" has not existed
at vendor-prefixes binding. How we handle this dependency?

I thought we need to move one step and step before, and keep clean
and avoid warning and error for every submission, but it seems not
the way you prefer. 

If we follow the example you said at [2], we just send dt-binding
patch but without considering its warning, and go on reference the
submission at this patchset cover letter. If it is the prefer way,
we will add serial node, clock node, mailbox node and necessary
header files to satisfy the minimum submission requirement.

> The minimum, absolute minimum submission is with the serial nodes. I
> would prefer to have some storage or any other interface as well, but
> that's fine.
> 

-- 

Best regards,
Peter

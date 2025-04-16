Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2096.outbound.protection.outlook.com [40.107.215.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116091E0DD8;
	Wed, 16 Apr 2025 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792043; cv=fail; b=QqyGuWkDStxnKpdxX1LV68z2ab6bMIIgO7BVzpnkuqepeGGPYaB2Crp5mBCJof5Ou9cZbCED4WxeYVC15wEdSFXgsfmwrNFPqBIbsszbAK7r9u2Wkx7vNERk/t0Xfaw6dmqoOOnjQpaHBtVbtMjEsvPJ9dvCyZ1L4bAbejsqwkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792043; c=relaxed/simple;
	bh=ncxOBqQ7eIFawFwWWMbZ/V7Scv4oo965SSSn1hOnBA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+viIJm1hVewrMcGBsl/t1pOvK82gTG0FxJpqAj+IMLyK6ohFgJAtl5ZfkC2PLfCoj8BR2j+UCCmYVK5csgbrO7Apy7NgZ/u6EUT/jJA4kOQYvyHQ8L9Z2Y3/eAMdS3ryU2jJNZeFTCpUpvMdN2zUxHdP49MnKpcLzhJjY/wYYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.215.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eie5VZcSIjykjuNU9EbZb/fMYlvkEBYUCbNdVNXpZoAXO54BUvNRiEy4m7gz3f1vkXssLEBYLH8HdyXa3507yLl78JfDsdsvB09ep9GJlul2EZADyMJawqisyRJzpp0szphnqsdBdbAmSrjrNf7fvfvNVSKHiayMs4fKDcY6IQBP+b7qcwJYgSnTG7KBrJTkS34XqgEvnObuikuOSQs0YxZjNWm0JJGmEH5PhcOdlwHWEATYeIYjGLrq4Z43k+Itnpxak79EsyvucDDfI4BTgVDFIClJIdimn7Sfse/7kPwLDjkFSGOLgvpHobRVSew/S2HWNXXhmq7YLAlFsfmdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojNiaePhho4E5RIqjVzNSbbu4HJwo7FomnRdlnU0eoE=;
 b=XOKgdz0mmlba3f5nSzQrgeqn/M6q7tov58sCSY7IBX/YFBWm1jRpu9iBBqRP/c4dYo9lU48/c10BjUAH+lFjg1GrVF4n5FrIUi8IMSQglnoK7Mh0KyqNUqNSd+QCyDiHXsacfRjymjfIKZLJaELX3ovHhbNZGP1OWpa18a18Um3ItsQFnctbpJDhlKqSLHyB9q9zH2D/r59BhOxVMWvh8VOAqRu+UubkePYhm9tj5ugQnIsqBvhH878ioJajTFxjrGvt1P67HUq/1SiMBC66x823RGiLmNRBA5K3VQirzThbYRvCXd+Q/umuA3gzuCH6WmgLiuHAg+9mVDGXY02HQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0034.apcprd02.prod.outlook.com (2603:1096:300:59::22)
 by JH0PR06MB6477.apcprd06.prod.outlook.com (2603:1096:990:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 08:27:15 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:300:59:cafe::ad) by PS2PR02CA0034.outlook.office365.com
 (2603:1096:300:59::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Wed,
 16 Apr 2025 08:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 08:27:14 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9DA9F410F606;
	Wed, 16 Apr 2025 16:26:43 +0800 (CST)
Date: Wed, 16 Apr 2025 16:26:38 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 08/10] dt-bindings: clock: cix: Add CIX sky1 scmi
 clock id
Message-ID: <Z_9pvs-YKLwFal90@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-9-peter.chen@cixtech.com>
 <bdfe0108-7ac3-4f2c-b7f2-97943ee85235@kernel.org>
 <2f05420b-0c6f-4336-9854-036edf8d28fa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f05420b-0c6f-4336-9854-036edf8d28fa@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|JH0PR06MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: e61f8f03-5e72-4eb0-3307-08dd7cc07e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RLUBMoUBVsLp3s8bYwVKB944Sa3bh4seukigCIeRISaJiVXjenXtMENFgQ2R?=
 =?us-ascii?Q?WCQxwPSg3EHYVajcPjxE4vRmvWsE5jyNyca7vClm49DoBwQE75xiVJqTaFXy?=
 =?us-ascii?Q?A+1nt8ChMVTxoQHIMQwIl65UUs9ZW1itosd+gMHqEEfUgG/hWsB/UGMvoRzo?=
 =?us-ascii?Q?/zcp+zdK4EeAZxjj9RRDNzySP9DajwsZY4kJUUMTX6xdT9fetSp8QQLeVUR4?=
 =?us-ascii?Q?3H3l08d+dRd5GB62ISSWalZg3ZriGlwDgqhu2c9DdMQC8k0Z3PSthzjq8KJD?=
 =?us-ascii?Q?v858eJJmgNJvrt8eNvaldp81li8L6XTMEs2fQV/MFI4OEw/HoybD+b2Qqbcv?=
 =?us-ascii?Q?mhOBWzwe6mS2JgFSWNFbiSY8CtPxD+/bTy81PRRgrdt3rteo6PwsTOhWRvFQ?=
 =?us-ascii?Q?zRLiwL1VV4nlg4DI2tMdiDoTIXbp2L9kq6cpDMREkV5wYAbn9RTd/MHF8iY5?=
 =?us-ascii?Q?rpKFu2GfEqZ6R6aGREOhOfYTGcyD46hPoOfcdRB+NN3ua59+Y1V8VZrZp2ke?=
 =?us-ascii?Q?i2+PXaO2CiSw/v/JF2Zi6fW9mg7B449wPBFiE3EvZc8Vy/xUWGKxSW5ik3wX?=
 =?us-ascii?Q?ZvVVk/zRzF2STE9z53Fqt18xPZs/c3v4d+AGt3b3iQl6+MdlHODlIppc3PuB?=
 =?us-ascii?Q?GFVe7V0psYJzKzfvf1Xx2fAlPMimNNAHxfxQVQqp3amnGhAJYFp//d1OEa4O?=
 =?us-ascii?Q?gT/SRI23Dx350I8l42ucpc3N2I8pedB3Vn928l2YwEInZV6pvFm7LMV5alSb?=
 =?us-ascii?Q?v6G3XLk72Mk5RSZ5/6UmkDvVfMvyYMf+Nq+NuvaMj/RXY7nfFldKbfmG1Lc1?=
 =?us-ascii?Q?/biFiUCwpc0zYyaR0PjwKJAE9FPUtJU+Hlqzg9ehv52BjQOiPJAKmTOHyUZF?=
 =?us-ascii?Q?A1nxZnZLUEYWBoe+iCqSuwAHgn9rzGcLeXA2mHxRhtsgmAzK2mdSVdVajsf5?=
 =?us-ascii?Q?Rd7+3tsIvKz+qmdqQBWxMewgzgFGdUEcRy1A4AI7nnO9tki+NgusPJT3fHmz?=
 =?us-ascii?Q?Hqz3c+bFk0pxsI2olfWcPvE9A/gcKb8+87g4uwECJHcXtImrBh0ERo8RLl9N?=
 =?us-ascii?Q?XvjCfI0nCh+YMyIV2jZGuyrlO4XtLkdw+rJTalQzSv9/zP/9y2+suPla6DaB?=
 =?us-ascii?Q?7NGinyGQ/8Y4xC7fADyFIkp/cU02nTzLzFR0yxJWqz/FKX7yAqp3p9buUnJq?=
 =?us-ascii?Q?hX0EUWSxZ9sFNmU7V4Xc1WHMzIFftZDrf5TQjN3yTZE8mljvPrBc2mLmgbL6?=
 =?us-ascii?Q?oVt5gZvKhpE38AFhupold8Z0dxNQmCbciywVI4bCEBAr6BQiDowc0ZjbH0zC?=
 =?us-ascii?Q?pj089OZQ0p8yvmR/cCwwu/zJmXgOESlNoJm6/Kwlh+rMKg3z9PIHezq2SG5t?=
 =?us-ascii?Q?cWOK/1BjGav+I0Uy5myMv+qyHEtoFFLxtSMPigMq6p62FIgsNDZkIto9GWHj?=
 =?us-ascii?Q?PZSHHFQI6WSdnOPhdK2a7FdPn1e3DlV1hSNVYJUZR1gyLyGwuantOG+RZbFE?=
 =?us-ascii?Q?pL14EP94QSJZjAwjevv2iph3yPB5lqW0mi4/?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:27:14.5386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e61f8f03-5e72-4eb0-3307-08dd7cc07e1d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6477

On 25-04-16 08:38:55, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 16/04/2025 08:35, Krzysztof Kozlowski wrote:
> > On 15/04/2025 09:27, Peter Chen wrote:
> >> From: Gary Yang <gary.yang@cixtech.com>
> >>
> >> Add device tree bindings for the scmi clock id on
> >> Cix sky1 platform.
> >>
> >> Reviewed-by: Peter Chen <peter.chen@cixtech.com>
> >> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> >
> > Incomplete SoB chain.

Sorry? What do you mean?

> >
> >> ---
> >>  include/dt-bindings/clock/sky1-clk.h | 279 +++++++++++++++++++++++++++
> >
> > Filename matching compatible.

Will change to cix,sky1.h

-- 

Best regards,
Peter

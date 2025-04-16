Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023140.outbound.protection.outlook.com [40.107.44.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FA81E1E09;
	Wed, 16 Apr 2025 01:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744766024; cv=fail; b=B9HfC7dn+NntqQQM/MPqNLXvi6MhhRlQWqqZ3AatVTsyzbXYfNwlSnTCaJJ+y0kT62m2n/vpEVY+SMqpNyLQ2vx/IPIng8PfUgvm8iQdd+ka6iKFYKJ55zPAVWB9i5AtLc81ACNFimjLoFDFLD+BNoihcCi65BMh/qHE3BiYCuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744766024; c=relaxed/simple;
	bh=3nDTBKsqDQAHeu/VYt8poYwXqao5JDP2xsj3bA/9r3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEUQmrJusfy7uP54A2RK5ouYZ1WxDSctf5YvePd1MiRqcx3+REJRR/iQSyFIvDI1mqGwhB6wLJRtbRpWNJyL5hz1a6m+SEfo39jZn7oeiY+uh35ydegqzfsH3Nam1i+VCShVmFeNC3Q5fo3nAaj4cxBcP1mw/2KwxTmp+KSxT+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6dmkxGGbsUxbYkHYnAISPDuQ0R3wKoSMXTbi4PDKav965+fq4mfYjHzXUJSYIaYxHGWMrdiJX4RuEmJvTWVecTlK4amrCjrmbPBxc8NEghk/x5N/LyhQSnbNu2FQMISX1RskjO2V20kj4wVyGQiJo7TgKNA0xyO1if84NUFSKhoaoww8l18CsI/Thrfytx/xrCTHaQC2dMfVcJOqMvuWuCYzea7syz8kFONbVZpfYifzH8aERVOcMD8T5+l3YlItVpkWLkjShutUN8jF8ApHgOoOIRviq5rMRO1aMroYtUrcx0rLCs7c9SrgsP55ChFVYiMKRppIgYZbHeekpKk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G8RdxQVeg31wQ+e1YW/h7pUUyXwTQfIzEi1LZKqkEQ=;
 b=dCQoL5bb5atdgird9EfDX2zRIdJYVNTuEPhkxLbvVvOB++e9dZKmW4zAi+6j3JEzHITVigJMMIen2WYefWGsvXnNWBfJLAGhBJy5dTh1nds5LEVPZP3R/fnsp24XeaeJ5lN6sB7U+Vxntb+QTPU+36InVD9/bnVpxd6yANFCSE2pPxO46cqK35vvu2c87KdYAePuThFdiwQ5yWby2oavyDc1n2eGlLecXWP14L2pvFOA+RlA+kUXfZbjHNPrwuidPvyMVRLN8+i0G8wWjc+JPLsYkxHCTGcUbQ72py3th4EHg1YsejuNS1AKAl7POGNLLdN9vyMsMqtI/3bls681lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0024.apcprd03.prod.outlook.com (2603:1096:300:5b::36)
 by TY0PR06MB5428.apcprd06.prod.outlook.com (2603:1096:400:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 01:13:38 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::fa) by PS2PR03CA0024.outlook.office365.com
 (2603:1096:300:5b::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 01:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 01:13:36 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E385940A5BFB;
	Wed, 16 Apr 2025 09:13:35 +0800 (CST)
Date: Wed, 16 Apr 2025 09:13:34 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Kajetan Puchalski <kajetan.puchalski@arm.com>
Cc: <soc@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<arnd@arndb.de>, <jassisinghbrar@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<cix-kernel-upstream@cixtech.com>, <maz@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <Z_8EPktc5ogcUmRb@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
 <7cnhezft5jzvtdjx6m2vjmtaxgla33j4fynd6ef4c6b7dh5pvo@4cbxewawilqp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cnhezft5jzvtdjx6m2vjmtaxgla33j4fynd6ef4c6b7dh5pvo@4cbxewawilqp>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TY0PR06MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: 746d5d6d-5f60-4ebc-1400-08dd7c83ea5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2aPRmtHviE0+XdzeUr8X9GkWIiDmJAJxfJmYdxPZ0CWUPn90P7O6cCDXdPkO?=
 =?us-ascii?Q?NNV/5BXLXWXLBpoAUDANrewxZ9CCZTn1H8DOebogmpxyn+SF7AhXa2sS0wkH?=
 =?us-ascii?Q?bth+p92wkygSQVaFsk8hpw8kJSS1niUxzwj/X+lXPoaYrHDe0pvAckq2+Kv2?=
 =?us-ascii?Q?leS8/M0QtnEfhsa0Bva1Xb0L1ulvUgzhodWV+CFp44tV5ltJnOLnS7f0E4/2?=
 =?us-ascii?Q?Cx1psJGrYAaSQ1vk71HfY6lYovfXMPjyrw8Ly39Fzl73jMcUdXi/55TJ2Q7b?=
 =?us-ascii?Q?K4+fC2lwlOq7MkZ0F+uAYuv15hZYOjdN0cM4sW4ApR4l09mJ3EH0jMgRsEZE?=
 =?us-ascii?Q?IanK/kkpMlU1Alwzdeak5E7Ko1mIdfX5uhnf4IBZYbafXE+c1MixPtcTEzWh?=
 =?us-ascii?Q?xEkakfLmuqza78B8RQW+qsY9/wD0duIRLwEgmj17P7eds8CNM0PJ9+GwAdOd?=
 =?us-ascii?Q?ZQ1Kjw2HCO2+AYxbBELAaNnaUNTbja388eo/Wq6Ierrx7Qkqqynpk2Tll6AB?=
 =?us-ascii?Q?H4oWstZzKMTJXF7V3lZn7O3OE5KcN+SGFdhhWhYFXhFlfx1qd1o8Np7UTf7q?=
 =?us-ascii?Q?45vxuoSkQpTW6ZIdPCY2jgJpAeGv5h1Pf2e432qgfFxYFYsJ7c87UYUIQjnr?=
 =?us-ascii?Q?m9X3OwVLvoDjiGOotOVo+bsWaXaBEO67Ql1uKsRR+joMyf3gIPLdQcLZgLDH?=
 =?us-ascii?Q?ngne+LWQREMRGzRFHeaBVzBCDWF2w7CyPFpYLHOpgJdrQ3VVzo4ZPwOg1Paq?=
 =?us-ascii?Q?DYwVasUa1WkiNnKJSqaWm0dD58iRcQdO7OlJ40P1EbiUGt/+bDWw7q1sjMYo?=
 =?us-ascii?Q?vUDzvjA2JNA6b+k+RMSDD44Yj7/lHJi4dR/M2M245a1nd1eWooat2LXnlH0f?=
 =?us-ascii?Q?kcuTh9KrVlbYrDa345VgcPzDA+b6GiMhUJ5KwlFkGXeqrXI0C5X16i/J79qK?=
 =?us-ascii?Q?IVK5BXCWQPbJQqRQOsqDvEC4g4CWjqLpBIiZvZUUbArWE9Bletmvvkl5a6vd?=
 =?us-ascii?Q?/6HAnhczgWXWtgLCn7e7AXAChP55J8LF+z0cZR3h+31vPQC4jSnH+Bs2nhuD?=
 =?us-ascii?Q?jPV1aRwWHeToX9Yy9dN6RZqF6YFSfICPbQ4LR0vRLM7fHWtvABiUiP1a6yd0?=
 =?us-ascii?Q?v/Svky+ztPfzfJkYNgTN/QE+rGiM9IBVKnkMHkBqW0almbyoOIKSB1mCIVxG?=
 =?us-ascii?Q?dpQghidgmcR4kFQjogVULJJ2+rUXcA/Sul4c6JdwEAZGiBE8SZLBj2OB584u?=
 =?us-ascii?Q?zHWUxpPp0y7K5gcqZapqDfm/Ynbtmrqvsa7dkoEqf3sv9U9PM3/WfCgxn9aq?=
 =?us-ascii?Q?4HYxr6/W7tNIecbDosXO2W9giZz1BQmkNk0q5iLSVE4/TtCrjGgBbX5aZOwb?=
 =?us-ascii?Q?u2XTsktEH9EhclqyfXSGRLNd3pqVb5cY0yHURDuCEAip0iG/YnjmQu92zRUk?=
 =?us-ascii?Q?H/ctZ/F+tXMD+rZYc3xBi6yto4PwM3qOtSrXOOAYR4zG0FC+LZ6kUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 01:13:36.8728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746d5d6d-5f60-4ebc-1400-08dd7c83ea5e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5428

On 25-04-15 13:48:38, Kajetan Puchalski wrote:
> 
> On Tue, Apr 15, 2025 at 03:27:23PM +0800, Peter Chen wrote:
> > CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
> > and Orion O6 is the motherboard launched by Radxa. See below for
> > detail:
> > https://docs.radxa.com/en/orion/o6/getting-started/introduction
> > In this commit, it adds sky1 base, mailbox, clock (scmi firmware baseed)
> > and uart, and the kernel could boot up to console.
> 
> The commit message style is supposed to be in imperative tone, i.e. "Add sky1 base".

Thanks, I will change subject to
"arm64: dts: cix: Add sky1 base dts initial support"
> 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> > Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> > ---
> 
> I've tested this on my own Orion O6 with 6.15-rc2, the UART does work and the kernel
> does boot up to the expected point. Feel free to add the tag if you'd like.
> 
> Tested-by: Kajetan Puchalski <kajetan.puchalski@arm.com>

Thanks for your testing.

Peter

-- 

Best regards,
Peter

Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021092.outbound.protection.outlook.com [52.101.129.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF420E002;
	Fri, 28 Mar 2025 03:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743131629; cv=fail; b=AkT7QCQO2iW15AcA6lXQ7gsv79CVQlmKQ+pPXRGjLY01H29M8UqOh35tb5QmYj+CTdjiTFdk0EQODeNC+T5r+C8LTvu3b+kJkCN4LQPvJE9lG06EcuJjhPlAKjKSMNSGsfNgQ017DkuUzJp+zvS0LhbHOcJonYsoz0/y9/uSIpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743131629; c=relaxed/simple;
	bh=AaT6M6kYRbIubCMxOFtvg/eI9YsrdrlvRMMWJDcG+y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpbcLGNnIF5kdZk27JmItQN+O2opunTotLZY9LK2QqaPhu8J1NuCd/5fBitVvuPc0VLay/cqtpsHH3r4lf/XNpV9V7JDF9SKMPJ2hhba0OaQGHH5Le4yHwJfuzTmZMnH3JPWsXXpcv9Vj/GiZWZ1snG7NyL975CXWWBdo+ArGvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.129.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iT1daxZLLzkTrHQZosDKmtj2C8t6GsOyKDy0lEOvGCALjDrb9omj+JYYPAilIdzmlP33cLRUbPlVY9ZYULuXZTGyHs/5wonYuMLfpEiD6ycJpchpIuMboES1eOeIFdi4Sc5kbCqmmMNK/1W0CkjknoJxlB2ViOhPUQEd1lYzlCk02b9nbcLrVyhopw6rv/sPPyDu001L4b3Zmo4BzjELSX+r3i3h8mGnWETc7lWy6sVVl05fJLYVOQzWCh58SUyVqfjUYSg82DBbt3uz9j7jNvTBPFMz9p3EcezcobEzwqs3rHowIRg3RntHU1BINkKKrpkFNIcQN2ksV3cp70yDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWd4V/sJuYT1ZhMNkVkLxnZfyx66UNlv3qiplqWiEPU=;
 b=uSWbN3zaaTXg2smWck4SUCtx+QjaUbYZfAdJCi0LT8hYQdhtQSSNOfqmapnWAzwjWTi9ON9tcBTVdAlO/8P0RcJyYfH18LavNL+ntx1EWPwOC9781UJqFp4DJTelKy8AzxC03j9soav3iXme8ap8wsO7U7vZ1j2BoHtK7awLT7X0cqYziJE6V7HQOT5qgHZABeu9HxymFYMiuikJHVrTBzJ/J5WHnyI3w/pkQ1qc4BfWqTV2/ILDe6Ih1U7/BE+OVQI1t2rlNDb9QWXZdxtRpt8idNDFN5jrTF4KaRvdtEQnB3/3AuPLlozVma7h4rBn2fCfZbDDAexX3mvz2Rsy8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0043.apcprd02.prod.outlook.com (2603:1096:4:196::12)
 by TY2PPF7BEC1550B.apcprd06.prod.outlook.com (2603:1096:408::797) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 28 Mar
 2025 03:13:41 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:4:196:cafe::4) by SI2PR02CA0043.outlook.office365.com
 (2603:1096:4:196::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Fri,
 28 Mar 2025 03:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 03:13:40 +0000
Received: from gchen (unknown [172.20.64.84])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 235A64160D20;
	Fri, 28 Mar 2025 11:13:39 +0800 (CST)
Date: Fri, 28 Mar 2025 03:13:37 +0000
From: Guomin chen <guomin.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: add cix,sky1-mbox
Message-ID: <Z+YT4XroHJ3OjiBX@gchen>
References: <20250325101807.2202758-1-guomin.chen@cixtech.com>
 <20250325101807.2202758-2-guomin.chen@cixtech.com>
 <77f94763-5604-484f-93c8-dc018c166b37@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77f94763-5604-484f-93c8-dc018c166b37@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TY2PPF7BEC1550B:EE_
X-MS-Office365-Filtering-Correlation-Id: 301b7a4b-d34b-4e00-dd40-08dd6da68a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTJuRTJhY3JaS1c4ODRhRkxGcGRJYkJOcmt4Nk1TZS81cVZ6R0MwbU03QzBl?=
 =?utf-8?B?cW1nUUNJVXZCSUZVbnRBVVFubXNWQ1hXc2htWEhuWFljR0xCaFlDVXRoSGVJ?=
 =?utf-8?B?ejNqL3NkQTIrSnlUUmhFZlVKazhlR1pSeFZoY0REMkJCTHVHY0VtZkwwaFpR?=
 =?utf-8?B?aVBNcjJFbWRQU0o3VXp4eStHYkpGSWY2aHJqQkJGSzlzbW1sTWZKWkdWWERz?=
 =?utf-8?B?Ykw1Yks4RnQ1WjNseXM5VUhrTkVpcDZBN1N2MFFPM3hFbGl4dE9LSTUvbmtT?=
 =?utf-8?B?M3dnaWIwOWlyellRaHRra0ZtN3ZxTkhqRzczSTNuNlRkQzBHaXJRUk5pemtn?=
 =?utf-8?B?My92a0JiaVpTcStSWW9qeEpMWmlqSjF6SHJ0ZEhCcGo3M2puSnpxRTJDY2pR?=
 =?utf-8?B?N3RWWTZyMFJLSWRVdFRUZGs3aStsQzIrVUlwZUZuREdUdVlQTDI4U0lUZW5G?=
 =?utf-8?B?cWpMR0xuVFFZSjFmTzViNFBSRnkwVWd0dzN1NUFSRmd0UUx5OVo3L1ErL2sy?=
 =?utf-8?B?NWkwQVFEazNzWXl5aVl3T3AzazFMZytrSXhLbUZOT05VekV3OHhaWGlQb25r?=
 =?utf-8?B?Yjl3MVR4WHRJalNhaHJtV3BTQ2owZ1FTQklXS2YxR3E5cE1rdkhER0x2Z2FV?=
 =?utf-8?B?aUNaVnk1U21YZUhUaTBCSW5OZlJyS3RPaXRIWC9KMG5FQ3ZyTUhRazZJR1ZM?=
 =?utf-8?B?akJnZnBER1p6ZWNhRjBuMVBQUEJyM0RBMklRM0VPRUlrUVRXaU5Ia2NFbktx?=
 =?utf-8?B?QWtsUjNIeTJEN0ZaTzFaQWJxTU5mSnlKdm03SVZISzVPc3ZQTkYxRTc3ZXg3?=
 =?utf-8?B?NGJER09EQlljZ1JIRGczZXBOYnRVRC9uc2ZyVUhHUWI1Y0QyMGsxZ210WUN5?=
 =?utf-8?B?WmJ4Z1B2YzREd2crMUVNY2lLek0zUEVOcEZtT3pxSDRjU1J3cDZidlJJR0pq?=
 =?utf-8?B?Mm9pUWNWeWZTYWN3Vk04RVpML0dZdkROdWRPUkVDL2oxVG5PeTU1YU9Ec0pD?=
 =?utf-8?B?L0pRTm1DaHFOcDJsRFE1YlZRayt4NXBFclAyMHBCRTZlQUJycUdaajE4THBO?=
 =?utf-8?B?SHhCNzZHR1RiVklLQ09telhUZUtwY29ma1Y1STIwejdZNkg4cjdick1ySnFU?=
 =?utf-8?B?Ym5pYWNZOVVxRlNiNHBOV0hnMEVLYVNrWWdCa1lveFc3VkxHSUlVa2RmaUtF?=
 =?utf-8?B?cE53d2lHTUVtU0NyTUNWTzBLSjROQXhQNUlnUE1NcUYzS2loOHhrOWZVUEMz?=
 =?utf-8?B?amsyQk9IRjJGRWdEeGwzZkROWU9YM0FLNmRURWUxdWs0dlZKWTZHU2JyT0I2?=
 =?utf-8?B?aW9QK3daU3c2cUl4MjVGL05ldXluWStLVmN5T1NXS2N3OVBLU1FqYWdENGNx?=
 =?utf-8?B?V1NaSGNpY2ltOG1hSnJsZG1mSkdsdHgwN3FURWZrN1Vtc2UrSTNBeXArb3Zy?=
 =?utf-8?B?eFZzTy9XblF2TXl3N3JTTDliQmovZHRsOWRjWUdmVXdRVEtDVkVDaXFqTkhv?=
 =?utf-8?B?elBQK3FDdm55RDdqcDY1aW1RaS8zRE5BWC90aGRDWE9Ja0N3S2JSdzdLUXo2?=
 =?utf-8?B?YUVyaFFTTjVRQk15R3BGVFNvR05wL0JqYncxZzdVOTVlUngrUDJCbU5nakl0?=
 =?utf-8?B?SDQxTWlWQUJldENWbmQ0M3hTZGwvM3ZyUFJrQ1RBMmhyaWZ2ZlZiUjN2ZVI0?=
 =?utf-8?B?MmN3K3paQTBQbVg2SWZOK1U3V25OaWpCN1IrWFpza1FCNU0zczYvbW5TaVdi?=
 =?utf-8?B?L0Q1UXkzTlJWb2JnSFNYNVNWMlBPczZKNkIzRVhQTXhnSHlSMkdETklXTzRv?=
 =?utf-8?B?Z0gzcjdEc1R2UFFaK0hWbFdpZ1plSEdhanNCeTJoUmk2U1U4T1dIcUUyUUp2?=
 =?utf-8?B?cDZ3Vjk5M0ZIMkx0N1pua3lTSVRUMWsxNUM0T3d3WTZNcnltNXBhM0tGT3Ba?=
 =?utf-8?B?RytCYTRXUGJwYWpadlMrM3o3UWM2QXl0VWkvZ2wvS1A5WUNESlk4N3Y4bncx?=
 =?utf-8?Q?czdFocBXs+suDyeha4a4pP/UEguzRQ=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 03:13:40.2822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 301b7a4b-d34b-4e00-dd40-08dd6da68a15
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7BEC1550B

On Tue, Mar 25, 2025 at 11:36:18AM +0100, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 25/03/2025 11:18, Guomin Chen wrote:
> > +
> > +description:
> > +  The Cixtech mailbox controller, used in the Cixtech Sky1 SoC,
> > +  is used for message transmission between multiple processors
> > +  within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> > +  and others
> > +
> > +  Each Cixtech mailbox controller is unidirectional, so they are
> > +  typically used in pairs-one for receiving and one for transmitting.
> > +
> > +  Each Cixtech mailbox supports 11 channels with different transmission modes
> > +    channel 0-7 - Fast channel with 32bit transmit register and IRQ support
> > +    channel 8   - Doorbell mode,using the mailbox as an interrupt-generating
> > +                   mechanism.
> > +    channel 9   - Fifo based channel with 32*32bit depth fifo and IRQ support
> > +    channel 10  - Reg based channel with 32*32bit transmit register and
> > +                   Doorbell+transmit acknowledgment IRQ support
> 
> Maybe you split one device into two and that's why you have
> unidirectional mailboxes?
Not like this. Each Cixtech mailbox controller is unidirectional, so two mailboxs
are required to achieve bidirectional communication between two internal
coprocessors—one for receiving and one for transmitting.

> > +
> > +properties:
> > +  compatible:
> > +    const: cix,sky1-mbox
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  "#mbox-cells":
> > +    description: Common mailbox binding property to identify the number
> 
> Drop
> 
> > +        of cells required for the mailbox specifier. Should be 1
> 
> Drop
> 
> Don't repeat constraints in free form text. Missing const.
Okay, I will remove this duplicate description and add const.

> You kept here pieces I asked to drop. You dropped pieces I did not
> comment under. Please observe where the comments appear.
> 
> So again: explain what each cell argument means.
> 
> 
> > +> +  cix,mbox-dir:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Direction of the mailbox (0:TX or 1:RX)
> > +    enum: [0, 1]
> 
> Respond to comments or implement them. Previous discussion was not
> resolved - you did not respond. Sending the same with unfinished
> discussion is not way to convince maintainer. Opposite: you will get
> NAKed because you try to finish discussion and push your patch over the
> wall.
> 
Sorry, about your previous comments.

As previously mentioned, each Cixtech mailbox controller is unidirectional.
Each mailbox supports 11 channels, which differ only in their transmission
methods (e.g., FIFO, REG, doorbell). However, the transmission direction of
all channels within the same mailbox is fixed and determined by the mailbox
controller itself.

The Sky1 SoC contains 4 pairs (8 total) mailbox controllers. To identify
whether a controller is TX or RX relative to the AP, the driver introduces
the 'mbox-dir' property in DTS.

Alternatively, the direction could be specified directly in the compatible string
without using 'mbox-dir'. However, I think these two approaches are the same.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - "#mbox-cells"
> > +  - cix,mbox-dir
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        mbox_ap2pm: mailbox@30000000 {
> > +            compatible = "cix,sky1-mbox";
> > +            reg = <0 0x30000000 0 0x10000>;
> > +            interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            #mbox-cells = <1>;
> > +            cix,mbox-dir = <0>; /* 0:tx; 1:rx */
> 
> Drop comment. If you need comment, then this should be string.
> 
> > +        };
> > +
> > +        mbox_pm2ap: mailbox@30010000 {
> > +            compatible = "cix,sky1-mbox";
> > +            reg = <0 0x30010000 0 0x10000>;
> > +            interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            #mbox-cells = <1>;
> > +            cix,mbox-dir = <1>; /* 0:tx; 1:rx */
> 
> Drop second example. Wasn't here and is not needed. Same properties,
> difference in one value is not that much.
> 
Okay, I will remove the comments.

Using two examples is merely to illustrate that the Cixtech mailbox
appears in pairs to achieve bidirectional communication.
If you think it's unnecessary, I will remove the second example. thanks.

Best regards,
Guomin Chen

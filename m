Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E732C3244;
	Tue,  3 Jun 2025 05:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748927466; cv=fail; b=hijFyO13h2ROE4lAcI/886I1vxYcvg/l67v8WC8AVNTH6IwKF9leoaDiQP7Ia39OrRb/xsQ6AH/MfdBOuPria4u5GdbBCegNR1/Qbj2kujDCo0oAMVGSBLpx4KCuCyOm8Cc2AhBenzWCOWGtriM3wOg0V2xp3orXgfa10D/fx8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748927466; c=relaxed/simple;
	bh=PAjQI1p3fF0LIvhUuQeC9Aqd1r6HJvNs7tDDfnPylEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uo853ZjGEacSuH7nutUK4POmdeeqSQn8Bd1gvRU/s1kg0VZstElkqJxwwwzuOV0cGBrtrzu/XpdVRHK4XBXtu2SBmzKH4K6nE3aObfn3OHVKeoil4OGaF/fq9CpvvS4PzF8ewq/KKP97mL0186jRK3//+M4KkthhcdfzYnSKHS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=QTCUYEyk; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="QTCUYEyk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmGvnNHvFrFoljY1QP9zTEOPKa5hUximKBLS6JnqFeWeLdKhCZv8ZFLMOuwPJxRQt57KqpvhofxOkavnTSueiNXR29mHPObWU11w3Y0+oOiLg2AFsPrGRSZynHD7ICCg2pFjbGbxYzchODMo9RaYbNkcNG5btz8l3on8a5lYLw0swdx5m8bT+8lcmWvELvTKYvqyN8gkqFRmgFHn023P/FTFeUipzn3Z/yPCxsimMhw+TBTcmDP6gN792M2LQWakLYRlK+mu65uvWhQp/h45peCCdZbwiNQR0n0XCpEcIPhK8LfV7+QmFdfzOQhD+aiCd/WlW6DLdEdGuKMuNCP/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEyEuVBuWZwtqpT6OdeDlX1LsaM9BZjsv5MjA6tFt3s=;
 b=l8d4KAc5aUd14qEtF3XEoJuJXjH1HplfwPx2FDEgzfslWRgf8MdtZWp/s94zvu9x59g77UPs2PEOI8vzLfVR5VFsDoJkJ2RrwzVbtIdobNCa3Yp9FbM4EW7WLiRM51wKvTdYakf7lREZd7MaFHFPn3DpXTQGQIEWA9JMd9AU1yarRuOW53jLiPYE73Fbm/jApvXPbUbLwZph0jfrkTJlLATuP2HV/hCKBfuMnftf38P4s+fmtJfH2wLu2cs/AAUrMLqpPFrjNaKvpkLzQsKHj0KjZx0N4/TbBzI66uLzxSX9mIcAQ3Dzind4FWl9uRMxFLGDs6yRNT0riHhHvb6bOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=buenzli.dev smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEyEuVBuWZwtqpT6OdeDlX1LsaM9BZjsv5MjA6tFt3s=;
 b=QTCUYEyk0rrjfeY/8Q/rHjrI7dkbZihB2oehC2asttLlrYmwO5v20/975hv+mvVAALJUhZM1IvYdQWL52dH/Ifbl+e7yOV941Pw2NYHjtpW1CUzQW+RIOKHHXA5brq9Qmp31pvHRVV+xgZMJa2z6llYhcE4q4+6/9JiA7AnAN3hOQHvadJBEp6JUxWDabRfIyKoOHnlfZSdijqOfDO1ZFGScoJIefXAc+a7cNWuQ5DTQJNtQM6zIifnuNSeV1ZFZlYvEE2eS91Gu6vJ+K0+sIh4k8Itv0wQoHzbJNyEdvyVWVPFK0FRLfaFxF6neQtXrEqBEUSzR8/gS9YzTKjKWUw==
Received: from DU7PR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::24) by DB9PR10MB7363.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Tue, 3 Jun
 2025 05:10:57 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::28) by DU7PR01CA0002.outlook.office365.com
 (2603:10a6:10:50f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Tue,
 3 Jun 2025 05:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 05:10:57 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Jun
 2025 07:10:56 +0200
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Tue, 3 Jun 2025 07:10:56 +0200
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Jun
 2025 07:10:55 +0200
Message-ID: <b2225fa4-ffdb-4156-afb9-561484d6d78e@de.bosch.com>
Date: Tue, 3 Jun 2025 07:10:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v7 0/9] More Rust bindings for device property reads
To: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
References: <20250530192856.1177011-1-remo@buenzli.dev>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250530192856.1177011-1-remo@buenzli.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|DB9PR10MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: e3cc0368-dad1-4811-9186-08dda25d0638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTgxK0tMdmpuR3hiME40QXAvTWxWbWNsa3RRS2VWR0dIMURyQThESTVjcFJQ?=
 =?utf-8?B?OWg0WVBEdHRaOU1BckhIOEljdUNmQ0kydzI2enI4dEpINC9UdEhZVzcrUDVB?=
 =?utf-8?B?VDU3emlzc3pKcWJ6RmJ6NGtNRjMrT2hKTm5QdGhac2Rrdm1QV0o1ZVNHTGov?=
 =?utf-8?B?bGwzWkZLbDVzVjhOdW5BR0VBQ1FqQ3BUN0FveHRYUG1MemN5YTQ2Nzc0R09n?=
 =?utf-8?B?RnFCOStJdUpaM2gwRTJNOUtNVUtzbjh0THpCeWI4VEd0Qk9HdnRWZlp6UVdK?=
 =?utf-8?B?M01IOXNib0dDTFB6ejVBMTJkMkxuUW5YSTU0OFVMK2pTa01abWJaRDFuWENO?=
 =?utf-8?B?U3hxU0JKcHpKMHY0d1BCT1ZEbGZNeEVOWUdXOXFsK3JNT0t3WWErRVRSTHpV?=
 =?utf-8?B?QVpiUmJKTzIyQ1RuTjFsanFkUGdhTmJjeXkvZGIrQWNNbm5XUmZ5Y1owMDZ3?=
 =?utf-8?B?RHUveGx6aE04OEt1Z1Y1ZVZ2bmZvRDB4UnBGWGdVSit6Y2p6K3lZcE1UL1py?=
 =?utf-8?B?REdSSmJZZUExRDJwd1lNVFY0b2pvM1dGYW9CVTltVnlERWkyNHI0MFgvcmdU?=
 =?utf-8?B?RHJma0FYSmJkUjlJcXBEY242cWMzVThJcUoxRWh6TmRkM01CbEdydk90MVFv?=
 =?utf-8?B?OUJpT1k1UjFzYkVXYjlBWHN0Ti84L2s3dVdIU2s5SlJhb24yaUZsb0tlWUVI?=
 =?utf-8?B?eWRXME9xTHVZYVR0N3VLbTh6K1JSSEQvcktvNFhCTmpUdDFJOE10NHVVWFFP?=
 =?utf-8?B?WHJqeG1Hdzdod0hQMG05ejVycmFKUEd4MmpFY1UvcFZpV0ZPNmgvamMrNEtz?=
 =?utf-8?B?bWZJbXVGL2VsRlBtVjVTcENTNkNuM202Y0FHdk94V2thS0MxR01tbjQ2WXBY?=
 =?utf-8?B?dmlLU0greEM3OGlHQ3Z4SWFJUXBhd0NHYUVkTnBPNUp2cmYrYXBmSkpRcEZ3?=
 =?utf-8?B?ajFjYVdOdmlOVnRha1F1dmxFUnBjUC9qajVjRS83N3UvSzl4YWZkV0JWbUpr?=
 =?utf-8?B?OG9memRzRDF0UG9iL1FqeDlZTDZSS09PMUc1QTVHNmRuK2N1ejJpdUFENXNs?=
 =?utf-8?B?TytkdlM3ZzZMV1Ixbis2SmUvdmZEeHRWd05UcWduYzFaSWtwZFk5ek9ERUlB?=
 =?utf-8?B?M0dtWmh1NUdhNHhjZWI1SFR5R2ZpK2xESExVbDhtVjE3c3FsUG1MTVdPY3FT?=
 =?utf-8?B?RDAzSU82aFh2VitpZ0hKcmtDMGVUaUJTRDczQXoyMzRxR3Q5bjVlVS93WGUy?=
 =?utf-8?B?Y28xRWZCMEJrMmdDUFpxZmVCUjlMMGE3dG1Mb00rblMwdHpOVm9YVXlsdVl6?=
 =?utf-8?B?YjRacGptcFVudFA5Sk5IdXBZTDhnYktUY2tSSGJNNDBNdDU4MDdyanZ2RDZw?=
 =?utf-8?B?dlgraHRRUTl2cVN5YUZhWXoyMDZyUFdwbmpHUDV3aGcvc1NjMUZMby9ISzNz?=
 =?utf-8?B?RFluSEZPRHhpdUl6QkZSazJZRjNraGlHVUVQWTFLQWdkeXlTTlZFSE4zY29Y?=
 =?utf-8?B?RTFQalRGbnFrb3c1L0lORjlaSGlBRGxDRXhuek5oZHoyWHp5Q1JEUU9wVUVZ?=
 =?utf-8?B?OE9ZZzcrVko3UU84REtGeVB1R2VVdmJKcDZ2R1hjNGtxeCtzUFlFRi9lWjl6?=
 =?utf-8?B?eENXbUhwL0lhT1lZYnd3WUVVQXQzQWhGQ09NU0NZcW50ZXhuWk81SXFxWWEx?=
 =?utf-8?B?UHFBRDFUQWVPV2xnb1AwbURkVHo0MTZYQmdhaEdCVWEzK1BPeU8xdG1WbU5a?=
 =?utf-8?B?N09OTFU3QjV3U1Yzc0Y3dlpRbUpXcnlTV1locG1veDNQMnljRFdYelFlYWRu?=
 =?utf-8?B?Sjhjc2t3Yzl5V2k5dHpJNXlZR2FnSWN0bGcxcWpKK2NOSUpYb29lUmlEYStl?=
 =?utf-8?B?ZEdjSWRuem9semFCUXU5N0x3Z21vL09BRGNjOVI5WnJNTENvYmRXeTZZODEy?=
 =?utf-8?B?YUY2ajZBSmdsUCtYMHlna0U4WjZLNWQvampvcFJwQ0I1M3NSWStFRXFtRmtN?=
 =?utf-8?B?V0Fmckd6MEthcVJuWGRFRVhzWXljMWhEWldTdWFUTElTTVUrK21pYWc0VnVt?=
 =?utf-8?B?RGc5TkJEVStTKzNVMzlsY0hsMzNSYjY2Zi8zdz09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 05:10:57.5538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cc0368-dad1-4811-9186-08dda25d0638
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7363

Hi Remo,

On 30/05/2025 21:28, Remo Senekowitsch wrote:
> changes in v7:
> * Fix a typo in a commit message.
> * Fix bug in `FwNode::display_path`. I took a slightly different
>   approach than the one suggested, using `Either` to handle the
>   owned and borrowed case. That also removes the conditional
>   `fwnode_handle_put` at the end.
> * Move `FwNode::from_raw` to the commit which first introduces the
>   `FwNode` abstraction. It is needed in an earlier commit than before
>   and I think it fits better there.
> 
> Best regards,
> Remo
> 
> Remo Senekowitsch (9):
>   rust: device: Create FwNode abstraction for accessing device
>     properties
>   rust: device: Enable accessing the FwNode of a Device
>   rust: device: Add property_present() to FwNode
>   rust: device: Enable printing fwnode name and path
>   rust: device: Introduce PropertyGuard
>   rust: device: Implement accessors for firmware properties
>   rust: device: Add child accessor and iterator
>   rust: device: Add property_get_reference_args
>   samples: rust: platform: Add property read examples
> 
>  MAINTAINERS                                  |   1 +
>  drivers/of/unittest-data/tests-platform.dtsi |   3 +
>  rust/helpers/helpers.c                       |   1 +
>  rust/helpers/property.c                      |   8 +
>  rust/kernel/device.rs                        |  17 +
>  rust/kernel/device/property.rs               | 590 +++++++++++++++++++
>  samples/rust/rust_driver_platform.rs         |  60 +-
>  7 files changed, 679 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/property.c
>  create mode 100644 rust/kernel/device/property.rs
I have tested this series with x86/Qemu running the sample. And the same
on real custom ARM64 hardware. Additionally, I ported a custom driver on
ARM64 to use this (well, it just uses the trivial
property_read().required_by()). So if it helps

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

for the whole series.

Btw, many thanks for working on this!

Dirk

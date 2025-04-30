Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935E6204F9C;
	Wed, 30 Apr 2025 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999084; cv=fail; b=DnCzyMz/MQY5W2Lfr41eGvMu3djEecURD7EtVCg+L90XJilOcttdlC2USpukbtz53o3WrHsAb1RSsJZJWISQCwwrnxdAPvgvTlRepZmSY8Nzt/uINTvKwWNy/5h7FKSVR3Si1lRHMpUht3st+pqoyI3eQI4jfnN6vGHN9uJdPYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999084; c=relaxed/simple;
	bh=h5KY6ffPJoe3aYlLVNpgDHzPdf0KNV3bCbhVydU5sfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CLPwTRuZQPYqRrYvEMx5yoFpHij8k05HQ+PYgsjZ6Y2JUZlU1iPwp3hZbxmMlp3R3ky2wqANq+P9qDsXd+Rf4qyqVZZezM7BnVilvQvqLEsGD94It/lhQQfpIBCiY6tPxUY6sYRT9HklRoDHvwd0QtPI3LZ+srhXKJz5+iNnlvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Arn3ByAM; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Arn3ByAM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRbVafceyWE+9pPObHXRPq58iz0u6SNjC9DbhBeknn9tJaBRgXObCJqLiM8DvMK/aHX6rTLaQBqmB1zCUMtg3wz3HjHzIVbFZTAjHQzgkV9apPGpf2DlFtqRkhRR5Xucrhp+OLslcTx5fa36RksAOdqu9uULoHLQ5R332kMw3qD+v7tgSKvdqU18lNV0uXTWpvyiiN2i/3V+y4OTW0AsqjjLgNVpiWjPxRDqYDt8XmxXLRaN8nEpjhI8HSbNlP/ZNYBvdmWLpzJy1Ekzo9vN3PhirUcQlNV+zw3KzBGF1PTmOpCZq8EaFdP7ifcnOAS50RpyDFvxUonOgfhOgGsryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqFt9Jd12jxYN6lY4LDJXBPir8JfirRblcVSyC2QY5Y=;
 b=BwLA7p1AeTI+v2oMHv4r+Aubp9GZ1JbDadmgHQc82/1s2fctbLq9dIR32f/3jQ30es9yh8ne29UqI9W4c/dxZIj1bMuKQ1e0lwD/2oCiOdOjjuNHpRn09RdBgq0I0zsHr+s38Y55SE2NlaXa/i8s0yAHAE1JaTsKe3XuVc+AxzS0Q7Wmx3H6IH146UntHhP5eZmMrr28oRL78y42ikPuj3HZc/WsF5OYOEitYyteBPZ4mikq1D0yZpVBcpLUAPLBZZbo82tbQtLiMcKMERrGs2wYRTREkNjnUtDgXByICw1DWhF07I18hqcjLLDB1QJIgkV6u8w2XCNtgpzxoBZkOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=buenzli.dev smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqFt9Jd12jxYN6lY4LDJXBPir8JfirRblcVSyC2QY5Y=;
 b=Arn3ByAMMyY+9whZH9FPBeHvKPyRCV5W+fXuixEh6sfOC+ctDKQUl0Zoa7qaWZpp8nFKcpIi5VpG6Oa/7RrUX33nmRXQ6O3abFjZbP74veH0JloDHDbj7T2qivtwvXVqVHZYP6VndyPxchL7P9v/4gws5ijH/5dYcqLC9TWIrsqR86qbEehb5oR74NUXdJqjVtYbjScgowUBfSUaCkvryF79DApGJDetxc5dSSuThtJoqNQBDfOMmREUV024na9Mqtx1Sa0SQMe+38fq3lRn5G1rs8W+w3ij7xPOBhHED2B/ILSGrexkYEYUlsi3um6OeyCOThzMOEBIp64Feb0S9g==
Received: from AS4P195CA0044.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::7)
 by GV1PR10MB9092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 07:44:37 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::c6) by AS4P195CA0044.outlook.office365.com
 (2603:10a6:20b:65a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 07:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 07:44:37 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Apr
 2025 09:44:33 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Wed, 30 Apr
 2025 09:44:33 +0200
Message-ID: <6b1393ac-bb45-4911-ad79-59f0bd7d882c@de.bosch.com>
Date: Wed, 30 Apr 2025 09:44:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 2/7] rust: property: Enable printing fwnode name and
 path
To: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-3-remo@buenzli.dev>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250425150130.13917-3-remo@buenzli.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|GV1PR10MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: b07861f6-b870-45e8-555c-08dd87badbac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0toOWNXNWlWYkUxTi9YZUJxQmRUbld6ejlsUVYwWkc2dk5IYzhxUEtqdi9o?=
 =?utf-8?B?R1QrRm1NWEVkcjBVRTEvWEZYMW1hMVRJUFNxZldSNTBzeWlBd2tGeG1ocTU3?=
 =?utf-8?B?RzNyazk0TENmMFpvaWRDTDZMZ1B2OTg3andJeHh2eDUyTFBVMElvTlJJOG05?=
 =?utf-8?B?SkJweVcxRXJZMkt0VG9lejd6TEJWWWllZnRvbUdkaWJIcStGbEVCdlVyVmNU?=
 =?utf-8?B?R1dBZlIvTmtGOEYyM29kTnJPNlExTUd6Ry9IV2ZDYTZtbFdPQVA0SVErQXdv?=
 =?utf-8?B?VDUyZ0h0Mk01TnJCUGFOT0tabFl6YUxEdHhWMmc3K0tzOVRiTG9KT0l2TTBl?=
 =?utf-8?B?YzdJQS95Sy9wTFNMSTlXaVlWczI1MU5leDYxWjl0WlV3cmpFOEQ1K3IzWXdN?=
 =?utf-8?B?cWlDa0Z1RUJGL3hiNUR2TUUzcHFoc1VuTnB1NTZlc1F4ZU1aOTB4N1VIcXRG?=
 =?utf-8?B?QVl0QXExcW55NGh0WlJHTHZxTFVNMkdhN1ZWdk82eS9XY05UdGd2M1poVVZn?=
 =?utf-8?B?eUFaMndmR2hDTkp0K2MyaURjOEZpMTYxYzZ6V1JuU1gzY2pmN2RlblpZakdL?=
 =?utf-8?B?azVVQUVRSXhsdzRWTEVaSjVTVXcwODVoYXNkTHFsY3k1d1FUZkRvNXFETEMy?=
 =?utf-8?B?QlpwN3JsNFVVektmMzU1OFZQMXQzTFNxdiswSHB6REx2Y1U0S3phdEU5MHdG?=
 =?utf-8?B?V0F4bDJWb0x3bWhiQ2xRT0N5cUZoRHFrMEFkL3k4VU9mUlJXcnVrNnhtN2Yz?=
 =?utf-8?B?aGhHU0R5b0JQQ01KQTNUYitwVnF4bW9lUWZxR01CRHdBZ2R1ZGFHb3NMRmxT?=
 =?utf-8?B?ZWlkTitndy9FNGJ2VVUwWHhrelVIYitvdGJLeFp2eU5PcTRkOTZlaXdvRmlO?=
 =?utf-8?B?bXNkZnpJcjQxd3pRNVVpVmtXMmZ4d1haWWhuVjIrVFRQVFk1ZHEraDlCRGNa?=
 =?utf-8?B?RzJ0ck5QZDE2V0EwWmo4K3ZYdzRuZ09kR0ZtaWxaZnVXSklGdWRFTEpoRGZD?=
 =?utf-8?B?SW9uUmppM21uQWlmZ0NORUdxVnJKUjBGSUxQcG0wWjk4dFdXL1duSTJ3VVly?=
 =?utf-8?B?OEpEUWhqdWtnK2wxVzNIUkNVM2FsVVMyYUlGcit3RjZjSURSdjdySmtiNWVV?=
 =?utf-8?B?bnBxMjV5V1dHZzhRS1JjU3h0MGRLVnBJUDNvWnhVV0oySFFlVE1vcytPbThQ?=
 =?utf-8?B?dnlrM2kwcDhwMDdUOCtPUE11N3hLMk9sS25EazU0c1JHanZJNFZ0anBVeC9X?=
 =?utf-8?B?dFBtYmQ5c2NZN1MxWmlwUUk2QytGS2ZqQ3hSTlBRMkJ6MkVSV1Q3bzZWbUNW?=
 =?utf-8?B?WUgxRmlqcys4bisxWWdWSnVqLzVnT1hPNjFYQmcxRDV0Sjc0ejlvdHoveHVH?=
 =?utf-8?B?SlhzZFc0QVFWeS9YNGZmMHhRNzRkdnBqRENTWkdETnhtdDAyd08vUmNsN0V6?=
 =?utf-8?B?L2hvZ2ZFcTR4VmpVQkV4cGRhSC9KUlZJMFJibUFLMWozWHBOZ0hTQ2o5Ujcy?=
 =?utf-8?B?VEM1dUdrME5Fb0IyaWpPSklITnJxbVJtK1J0MGRjYVJ1SnBNUUMyYTNnaWlY?=
 =?utf-8?B?OVdpclYwNWVULzVnb2Jnb3hJNW11TSt5RDJRY0gybkl3Z2ZQR1MrNU5iNzVO?=
 =?utf-8?B?VVBXQlU1cjFxYU11akxMcTFxb0pnL0lRbGRIUlNqNnREZFByVlN2RU81cVRL?=
 =?utf-8?B?MG12Umg3ZGhoT1NWOEpwVmtUd0o5NFNsMkVNUkF2L2xIWlk4aXZZTEhZWmY1?=
 =?utf-8?B?VnVvc0IyNUIyTE9oMzkyTVA3L085blZ3c3AvZWZJYlVpdFdSb0hnQ0w5SHU5?=
 =?utf-8?B?T1B6d2lWdlowUkVlY2hJTm43YTJtdEFIVEo3dWhKcGhPWEVFNzB3bzFFV0hW?=
 =?utf-8?B?Y3FBVXBEWU1PQ1NnQUkvekc3dGhHNG1aSTMwdnZQRkdLKzl0ZlQvNFVYNnhX?=
 =?utf-8?B?ZEVmS3lWeGlqZlBGMGk1b29QWXZ2c3NCK1B0SmtyYnkycHpmeEFHSDduRUdG?=
 =?utf-8?B?bHJxbW83UmozOWJhQlg1aXJPalExdjF0NmI2eUlJSjdHb1RyeHAzTTRxcFpZ?=
 =?utf-8?B?V09uN05vb3JQM0R5V0t0UnFLbHNYOTBuTUZVdz09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 07:44:37.4909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b07861f6-b870-45e8-555c-08dd87badbac
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9092

On 25/04/2025 17:01, Remo Senekowitsch wrote:
> Add two new public methods `display_name` and `display_path` to
> `FwNode`. They can be used by driver authors for logging purposes. In
> addition, they will be used by core property abstractions for automatic
> logging, for example when a driver attempts to read a required but
> missing property.
> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/property.rs | 78 ++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> index d89715f7d..28850aa3b 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -49,6 +49,84 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
....
> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> +    /// printing the full path of a node.
> +    pub fn display_path(&self) -> impl core::fmt::Display + '_ {
> +        struct FwNodeDisplayPath<'a>(&'a FwNode);
> +
> +        impl core::fmt::Display for FwNodeDisplayPath<'_> {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +                // The logic here is the same as the one in lib/vsprintf.c
> +                // (fwnode_full_name_string).
> +
> +                let num_parents = unsafe { bindings::fwnode_count_parents(self.0.as_raw()) };

Missing a safety comment.

Dirk



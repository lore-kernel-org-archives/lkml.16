Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2041.outbound.protection.outlook.com [40.107.241.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E019AD8B;
	Wed, 23 Apr 2025 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411983; cv=fail; b=JOuUAwWUTVllJDvg9kdlScXpkYAH4FMM+D/qwp0u7soAJP1FIrvKnWmche3avI4S7tuUL3gzgDProdG19wcX4JS8i47kg9VbwYdTmGkwKFdy/AibTICFd8cxKPl9pr+yAG58I+tHRZ+1wOfTvG8+i5Ib/WX4AUrK6qKDKZIkYQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411983; c=relaxed/simple;
	bh=Bxzh4DigbT67gymx3w2gkqyvURAQh4yOGp0280eNMvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CLQMnHpzL1fEF9b5KY5B3RjtmK5NArOBrN7BDotpwPpxdwR+mC7LK1oPOWRuOLb2e+kHhCY+OawVEbTkgd01QtTwbVYS6OUjdJzh39ve6y05GMuIuwel8BctoOwudoXNgGLvD9aoRlcZoHjJL7/cw3yNQ09l2ovq9JVvv/jqTXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=gi4ypWZY; arc=fail smtp.client-ip=40.107.241.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="gi4ypWZY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQcflEnmknFru4GEYouP1wGro8PAzD/rpZbvFUnIE7+oZFC3nVJMF44YeuBU5X8NoMvUuOjmRBte08EnhVlUA8uXEvG+2xbzwr9X4SWBNpTGUAvci+G9WLywqDuAegaSGSQiCKO58n5G8gn8wxilgcpkXXODqKJKICdI5/EbKz76W6zWajKQITFksc+7Vq4Uvh8VXw3uPWudx9m8LZUMAd1PSZVMvKfGxP5Ba3V42+zAhQNT63qDPYoOPRf+ELI4LzZZo8nx2AKgMbXti9dSC3eRmw5/vKUWfiLBSTZiHP74KJkKsk5ZkakEJeJObLTGx3fVPgVQnkDt2Qf7uV7wjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIndMRnQAZCi0j9jdVWMdXOzcCKM8JChKEqCiylxbIY=;
 b=LAQ+ZM4ZLDL1aQDKcqMcyuj+GyQWG3P3Vb2frN1n1LvQkoFBhGg4MZTGtnoSUPqrbFYJYWfeh5OuKmJbshO91jXXQrpuozcTGiCwcLdcoL2am71lT4fIlCOSVrUPDWHd0snUN7b+UruPVQpGMoH54njT01vUIsnyn5fxKFrdq0xGiX3Cj6Lnv/GylEjCIqt7xMhCQ+T6zSETDZbF1WZT70KXdQx4EX4qgCaS5HtKmWcGi1yuMWcs+nmJ9pugEgdO/S+P59gnLyxttBTeS97xW8p89XCeamsDStGGcKVkMO9crfMTevdHF4gUoxYLcfTSHLcShgK6e3a2jYF2TadbwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=buenzli.dev smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIndMRnQAZCi0j9jdVWMdXOzcCKM8JChKEqCiylxbIY=;
 b=gi4ypWZY4/1mlvOlzbA7nxKUyPEURmSqbiAIvj2FJurYXeyLhWmrG6dS+djlCFQa/9YFHTe6IbKVARza0tN6GyrCtfYmcJKI4/jPnS/iMkHxdErov3UMJ3Q1iAjHzCzUh4KzeyR5Bl01VyVuzOhcJh0nlTzcd9BfJocDHlE3zvCZN4t2F9azaYtkoggmFFVRWNC+c767nnjmypWsMVGQ1O/sFJePSraqJAWTHZEBh9wFmqTAEJ18OYWWHHsvLyRaYBiyToAURcssPmgK6BXtWpfllWbnfQ/def+sJ9JoNYA/K1/vLqr2gToGUU7X7eEHv8ycRsFKzjHDHAVQpz0Pkw==
Received: from DUZPR01CA0278.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::23) by AS2PR10MB8033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:558::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 12:39:37 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::9d) by DUZPR01CA0278.outlook.office365.com
 (2603:10a6:10:4b9::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 12:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 12:39:37 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Apr
 2025 14:39:13 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Wed, 23 Apr
 2025 14:39:12 +0200
Message-ID: <cc50edea-08b2-4507-9410-935f8aac6f62@de.bosch.com>
Date: Wed, 23 Apr 2025 14:39:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] samples: rust: platform: Add property read
 examples
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
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-6-remo@buenzli.dev>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250414152630.1691179-6-remo@buenzli.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F1:EE_|AS2PR10MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc58892-ab9b-402c-2837-08dd8263e8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGNUdVlTVVZNdTFaVFVYdVl5bndCYmhOZVl0UkY4Yit4YmtiaHJuSExSazBo?=
 =?utf-8?B?dng2NnJjb3piOW0yU3VhYlVFSnMrNldHb0tHOGdGaXYxbnlLd0VuSzJHRXZr?=
 =?utf-8?B?NkVSSnBuditOb1VpVG9OVGpkbmEycWJDMkNvMEFvajdlRWhjSStsaGlBNXc4?=
 =?utf-8?B?Wld6Mkt6VmNPRCtReXRYUVQ4U0w3Y2tZbEFGbDBKVDhoSzdMLzRORDdhRnJn?=
 =?utf-8?B?STE3L3N4QUlsemVwdE8yZjh3bFI2T2pCd3FRdzA3TmJ4VnFSRFZZN3R0S0o1?=
 =?utf-8?B?V3hnNlBTQ3lnSm96U2NOTkZjT1RRWGorVURzckhiREI2WmxIWEs0K3BMWVhi?=
 =?utf-8?B?bkx0NnBzQWpMb3d4ejE0M1IvMzR1cmdDWmJ3QUdmR1VOZTY4RjA4OGNVcHY2?=
 =?utf-8?B?ZTVSNFZlU3R2TWt2RndzU0x1cm11VW9sbjc0N1FNQWNKeEVXQWNJZCtPVTZV?=
 =?utf-8?B?dTBVYTFjRnlhSnpMcHloSDYzK0VLUFdWZlE4eXNLbDM4OGVVZTQwaDFTNTVw?=
 =?utf-8?B?dXFDTmpnaHIzS2N5czIwZlJDcGNNeTZMbGtVdHRxSHBEQ3NNb3hHVTczNnFp?=
 =?utf-8?B?c1NjY0RpU2orcVJHL0xTZ1o3aExQRjlOeFNxWE5iUU1oNTI4UkJ3aVYwWUxE?=
 =?utf-8?B?VzBrVlRBaEtYYzZNZGNuREt2MkNkY04yb1F5ZWlLUDdrdTN5QW50WFlPNmg4?=
 =?utf-8?B?azhUSm5VVjdoZ0FQc0JlYTJGZmV2cVFXOCs0OWtGQUVjL2tETTY5VlVrSlpz?=
 =?utf-8?B?TjBCcDlTZXM3WFllTytIaXBNcWVmcXhSOFBreW1jYWg1ZXJrWHVHTSs5clJO?=
 =?utf-8?B?UFNCeEV6eXdkdCsvZW4yYTFadUNuZVpCeEowemxoK2dDWU5jditMSFpZdHRi?=
 =?utf-8?B?eFU5L2xjNzBtVk11eWhIc3F5aFB2bCtvV1hIUHpzby81VHhGVytSV2hTWnRr?=
 =?utf-8?B?M2J5OWlnejhCeXdxUHltYm93SXpQejRYcEJIVjlWV0tSTG1YVlFYbmtuc1hM?=
 =?utf-8?B?bi9aWDZZWExZN3ZRMWZaNnRxSHRSa0NUVndtUnNFcWJhSE1xY2FQaW9GRW5o?=
 =?utf-8?B?b2lPb042U0VYMy83S3hSZ0puZVVDTlVSZmhHMGMzSnNoUUtUdlg1N3NlNEVS?=
 =?utf-8?B?VnBhSzVZR0lFVjVTVjBERmVqM1JVOGU4ZUc4SGpQZnBKZkZHVlhEZno0aG5Q?=
 =?utf-8?B?TXJoVWFlR0NIckFLNXhqQytxUWRTYjNnaUFHTHI1Zm5URUFOeFIwUC9mK2ky?=
 =?utf-8?B?anRlbXhEaXJVUnc4eTc3QmIxQWU2K0lEMXREenFuNG5zc3Q4NjhUWWlOT1N1?=
 =?utf-8?B?U0lSd1VVaHo5aUVaSG9vNVhMNk4vR3RtMXk3T0wvM3U0L0xycXJtWUpUWXNn?=
 =?utf-8?B?YW02MDE0ZnBRM3AxRVJwc3E1aVZGYTdpTTR4cElnWXBGcTdWcC96MytURTda?=
 =?utf-8?B?VnE0L1dYazVrbkwvM1BzWXRnSURXekRuZTFSeFRTYVRHSVhqWFZ5R041a1dR?=
 =?utf-8?B?cjg4dXBLSUtPUnhrNXN5NE9uZnNHeWNUeU5ldjBFUlcyakw2ZFNoSU9vR3JO?=
 =?utf-8?B?alNBQVhaVWFnYjJSWlFleVFDQTQ1VzBIcTQ5dHJtb2ttQ0lFVzljR3YyVXEr?=
 =?utf-8?B?SVB4bmxQbzJmbXJyTElHQWFHdDcvM0xRTHVHM1hveUxGOEFuNzVhbXR3SXcw?=
 =?utf-8?B?bHN0VkgwRzZJY0QrYXE1alpwYWtxUTVoRnNUMG1LMjU0TFUrRnpNaUc1WSth?=
 =?utf-8?B?NzRVTFFmSmt2Z2xiWkRCVG5TTlBzSk5oRytMNjU3NzRoRjNpZURBUXhDVEE3?=
 =?utf-8?B?QW5aRnIzc1RvZlhBMkhUUFhXclNCMHg3ME5LdDE2d0Fub1hXTHM4YlJLSkM4?=
 =?utf-8?B?MmcreWNLdHRIUWtCbjd4Y2dsZ05kZ3BKVXFpRUwxa2VqZXVMeTMyZGI4dnhD?=
 =?utf-8?B?ZW9DQ3hiUzZHVDh1TnZGQlJEdFh3YmNaa1dGWWFRWXhrSGY2YXNhb2pvKzhl?=
 =?utf-8?B?Q0R4dUFtNVQza2NhNGdKWVFhU0MvWXRPTks3cDBBb3Q1QlNibEc2YzNqT21t?=
 =?utf-8?B?RlQ3b05KQm84Vm9iM1BWQWpOZU9hMHpMM1NMUT09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:39:37.1830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc58892-ab9b-402c-2837-08dd8263e8a4
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB8033

Hi Remo,

On 14/04/2025 17:26, Remo Senekowitsch wrote:
> Add some example usage of the device property read methods for
> DT/ACPI/swnode properties.
> 
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  drivers/of/unittest-data/tests-platform.dtsi |  3 +
>  samples/rust/rust_driver_platform.rs         | 69 +++++++++++++++++++-
>  2 files changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
> index 4171f43cf..50a51f38a 100644
> --- a/drivers/of/unittest-data/tests-platform.dtsi
> +++ b/drivers/of/unittest-data/tests-platform.dtsi
> @@ -37,6 +37,9 @@ dev@100 {
>  			test-device@2 {
>  				compatible = "test,rust-device";
>  				reg = <0x2>;
> +
> +				test,u32-prop = <0xdeadbeef>;
> +				test,i16-array = /bits/ 16 <1 2 (-3) (-4)>;


Is "test,u32-required-prop" missing here? See below ...


>  			};
>  		};
>  
> diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
> index 8120609e2..0284f1840 100644
> --- a/samples/rust/rust_driver_platform.rs
> +++ b/samples/rust/rust_driver_platform.rs
> @@ -2,7 +2,7 @@
>  
>  //! Rust Platform driver sample.
>  
> -use kernel::{c_str, of, platform, prelude::*};
> +use kernel::{c_str, of, platform, prelude::*, str::CString};
>  
>  struct SampleDriver {
>      pdev: platform::Device,
> @@ -22,18 +22,81 @@ impl platform::Driver for SampleDriver {
>      const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
>  
>      fn probe(pdev: &mut platform::Device, info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
> -        dev_dbg!(pdev.as_ref(), "Probe Rust Platform driver sample.\n");
> +        let dev = pdev.as_ref();
> +
> +        dev_dbg!(dev, "Probe Rust Platform driver sample.\n");
>  
>          if let Some(info) = info {
> -            dev_info!(pdev.as_ref(), "Probed with info: '{}'.\n", info.0);
> +            dev_info!(dev, "Probed with info: '{}'.\n", info.0);
>          }
>  
> +        Self::properties_parse(dev)?;
> +
>          let drvdata = KBox::new(Self { pdev: pdev.clone() }, GFP_KERNEL)?;
>  
>          Ok(drvdata.into())
>      }
>  }
>  
> +impl SampleDriver {
> +    fn properties_parse(dev: &kernel::device::Device) -> Result<()> {
> +        if let Ok(idx) = dev.property_match_string(c_str!("compatible"), c_str!("test,rust-device"))
> +        {
> +            dev_info!(dev, "matched compatible string idx = {}\n", idx);
> +        }
> +
> +        if let Ok(str) = dev
> +            .property_read::<CString>(c_str!("compatible"))
> +            .required()
> +        {
> +            dev_info!(dev, "compatible string = {:?}\n", str);
> +        }
> +
> +        let prop = dev.property_read_bool(c_str!("test,bool-prop"));
> +        dev_info!(dev, "bool prop is {}\n", prop);
> +
> +        if dev.property_present(c_str!("test,u32-prop")) {
> +            dev_info!(dev, "'test,u32-prop' is present\n");
> +        }
> +
> +        let prop = dev
> +            .property_read::<u32>(c_str!("test,u32-optional-prop"))
> +            .or(0x12);
> +        dev_info!(
> +            dev,
> +            "'test,u32-optional-prop' is {:#x} (default = {:#x})\n",
> +            prop,
> +            0x12
> +        );
> +
> +        // Missing property without a default will print an error
> +        let _ = dev
> +            .property_read::<u32>(c_str!("test,u32-required-prop"))
> +            .required()?;


On x86 using above dtsi it seems it error exits here:

[    2.178227] rust_driver_platform
testcase-data:platform-tests:test-device@2: Probed with info: '42'.


[    2.178715] rust_driver_platform
testcase-data:platform-tests:test-device@2: matched compatible string
idx = 0

[    2.179122] rust_driver_platform
testcase-data:platform-tests:test-device@2: compatible string =
"test,rust-device"

[    2.179563] rust_driver_platform
testcase-data:platform-tests:test-device@2: bool prop is false


[    2.179841] rust_driver_platform
testcase-data:platform-tests:test-device@2: 'test,u32-prop' is present


[    2.180200] rust_driver_platform
testcase-data:platform-tests:test-device@2: 'test,u32-optional-prop' is
0x12 (default = 0x12)

[    2.180598] rust_driver_platform
testcase-data:platform-tests:test-device@2:
/testcase-data/platform-tests/test-device@2: property
'test,u32-required-prop' is missing
[    2.181244] rust_driver_platform
testcase-data:platform-tests:test-device@2: probe with driver
rust_driver_platform failed with error -22

I'm not sure if this is what we want?

Best regards

Dirk


> +        let prop: u32 = dev.property_read(c_str!("test,u32-prop")).required()?;
> +        dev_info!(dev, "'test,u32-prop' is {:#x}\n", prop);
> +
> +        // TODO: remove or replace with u16? `Property` is not implemented for
> +        // unsigned integers, as suggested by Andy Shevchenko.
> +
> +        let prop: [i16; 4] = dev.property_read(c_str!("test,i16-array")).required()?;
> +        dev_info!(dev, "'test,i16-array' is {:?}\n", prop);
> +        dev_info!(
> +            dev,
> +            "'test,i16-array' length is {}\n",
> +            dev.property_count_elem::<u16>(c_str!("test,i16-array"))?,
> +        );
> +
> +        let prop: KVec<i16> = dev
> +            .property_read_array_vec(c_str!("test,i16-array"), 4)?
> +            .required()?;
> +        dev_info!(dev, "'test,i16-array' is KVec {:?}\n", prop);
> +
> +        Ok(())
> +    }
> +}
> +

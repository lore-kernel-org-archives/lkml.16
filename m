Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32C82192E0;
	Wed, 23 Apr 2025 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411709; cv=fail; b=enp77WjT/lykzz6eMLpEgU3GrFuYn/pV6BqrS9iSRvBJps6i1lEeSNT2LBcbIpe3ZVX4O2UXONcKpgYpaIkuVzgcE66HJKz92ctkM5BD2j8rrJi18++8cpaIGt/Varvg2Q0Cutdo4/JHb40nAWkOQXtL+wz5pn647xGMOfLxt/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411709; c=relaxed/simple;
	bh=MhejD/ZMqhNjA8XhH1LuOE+ukGH53Lu7lpe+hIOEDgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rmSipVZrGOroi3j61+E4GNU+N51XWmtbYYCFXdA4+24VzdtOHCTqVFZZdGSGfXAgPNLhAmOF4DdI9Ts+GsUH63LxwdTagVPZ1RsrenV4eVRX68NaLzQn2mTDT/m5P0sWQQvlHBn7oSsN4fow2PObH7OuPK4GXCvGzRItYoseOJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=JlnZ74x5; arc=fail smtp.client-ip=40.107.130.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="JlnZ74x5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmisRTgQLsyHBKDGRX6a53GNOKcgCM8uhXzHUmZwJmpslsxjowrY2XRvzFT4gEpC86PogVkQv2HyjlUhwSuL4J+FhPCD/mtzxK3uiOJeK+HJkDbkl+QHBVP//kHFSTCgldqTE787KlEy4agFbwUvogziH96sNp0vxJmQt36MeW7Fsxn6HvGda+9tSFA3w0Kot7mhxF/z0pnVfzdi7K5fGL/bACgH5hMdTRuVTYhjT01v98AeGvj42/IXd3MOON34u9B9cXc9G4bSO3AaB97Ubug4qWMmG5oCiXJ+cjGfC0j9l7j3Ifk0ExDnLngYGQliqs3cI2PlQJXEccKKS7rhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ594Yad0jFlv5OkjjZ/U47ItkVCmHP+Fqw0DeYuu6Q=;
 b=v+Sh5uKuUXS8YZqBHQ9OYxkZuGXlFcZUpnK4sIMbAvshDwNhyScCPesZBM6uUzndVgonSIce/owm4Lm95mi4Glceu2FaEPKGW+GXLDmu1HU/U04hOtbBMVK4GDfPO1N0utG6HdPkcmOT2oqWzQAOWIQ1JQqFxdf1iTk5Xx/t+e3O7XTrn972pLcagmVgAQjD8UR65yQHePqMAB3bVPAFu8PVtjPAgL8BtYe6+3yAPtGgdZgCy30fQ5O4QrM1SRt2ChVfjgdimRZqyj9proJuOo0oc5wh7xrMyNBhF0vaPoauhdiUUK7sWqfKfiANIcbq5LGOvjsJ1dHi6FdfDUsA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 139.15.153.206) smtp.rcpttodomain=buenzli.dev smtp.mailfrom=de.bosch.com;
 dmarc=temperror action=none header.from=de.bosch.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ594Yad0jFlv5OkjjZ/U47ItkVCmHP+Fqw0DeYuu6Q=;
 b=JlnZ74x5Pa113/YzYCBYtVKajqyrT6cixYpGa0Ut9or3M3E2ABrmvye057KvUCMBssdxEE7xRiUQkBoyeFr5IyQvgMSfISdCZVoX8P1FhXM9aHfBNNk/wCR0el7MgwamC9xj0x7qv1lQmNTWMOqmem601NWoCwYw6TjHjwYn9ua7mZpLaCfBwUlPXHvmPtowQqz6+kJ7Blohw5Ej5zB51InUKejzVc0s6onpV5DLeAwzqmcklUC2kSuAih6kRW2Yz4GaZ2P6QReSUXnL+ofXdbRvolGelJ666pUc6L4D7St+RICvSOMhJG/DPtcEDiI6H1eMDCSKtSZzqTtvbaUaTA==
Received: from DB8PR09CA0026.eurprd09.prod.outlook.com (2603:10a6:10:a0::39)
 by AS8PR10MB6433.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:56c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Wed, 23 Apr
 2025 12:35:00 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::ee) by DB8PR09CA0026.outlook.office365.com
 (2603:10a6:10:a0::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 12:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 139.15.153.206) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=de.bosch.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of de.bosch.com: DNS Timeout)
Received: from eop.bosch-org.com (139.15.153.206) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 12:34:58 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Apr
 2025 14:34:31 +0200
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2001.de.bosch.com
 (10.139.217.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Wed, 23 Apr
 2025 14:34:31 +0200
Message-ID: <8fc82ddb-fe5c-43e2-928e-efd3ebaec3e6@de.bosch.com>
Date: Wed, 23 Apr 2025 14:34:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
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
 <20250414152630.1691179-3-remo@buenzli.dev>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250414152630.1691179-3-remo@buenzli.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|AS8PR10MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: f21e546c-5331-4b62-dc78-08dd82634242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGk3Y3pQbUVEMmhSdlZsZnpuSDdsM2tsWFBwME1NM0RHT2Q0Rm1Lay8vZm5D?=
 =?utf-8?B?WWhwV3hLQXdJYytSUnRjRlRiYkd0SW8vaG00U05Kb2FkWmJFN3BiU2p3UUVI?=
 =?utf-8?B?d1hDakllVHhtQUZaRmZ5WlpVVlBqSnl5RjRuTVFnMVV1dWNBdWRpczBPay8x?=
 =?utf-8?B?dkg2d2tNVXpzWXJEQndsSGJweVZxUlVLcU1PWVRFbGg5ZU1Sc2RwNS9sb2R4?=
 =?utf-8?B?L29iYnJvbGNVWDBMdlBSbS9zd3lKSmMzTjBRblB1WlR2RFBGeHZUOWlLZ3VC?=
 =?utf-8?B?R0tkWXJMNllZYndmaXNTNlJYTm84eE9YdHZRVXh1dmJSY2s4UGZ1cjgraXZD?=
 =?utf-8?B?Q2FvY3h4SzQ0VGRBd2g3MVNTaUVWYlZLeVJ6d0hCTVI0bUxVeGllb2VFeGhY?=
 =?utf-8?B?UXJnYS93N2kyYXJwZ3NtU3BXbXdRZWlwUThjVzFSS1lGNUVKcnJWWlM2aHlS?=
 =?utf-8?B?cTltemtTcDlKQTVPNkV6TVYwSFdWTHkyL1NSWllHaE1NK3FSNjBYQUxGRG5V?=
 =?utf-8?B?MkU2cEs4RkFrWWRSQ0FOWHRNNG80YTRLZkQxaHR5OTYwUEZ5Z2FWNUJwejQ4?=
 =?utf-8?B?UmlHMm81UGVzSkpMeEdBRnNrSVQ5VUllakllS3Rqd3M0VXNGcDdvREF1Nllo?=
 =?utf-8?B?R1BZQlVFZXFPQ3Q3OU93RTI2clZZWDVmcmRtRGl4eHMzZkhFemM5a1gwRkVv?=
 =?utf-8?B?UlJqQWdNT1pORkpxR2lZUXFhcmRmWUpqZHI3YlFNRlAvckFBT0xJODFCY1Jv?=
 =?utf-8?B?YStpYzVPTnFwcC9PNTRvM2NiR3M3UWd4TnROS2F6TXJDcmk5TXZMelp1SWJl?=
 =?utf-8?B?RXgrVWhpeVpsSVlGVS9rN1RzSmR5Y25Qb1JhSzlOajk4QzhGbDI3OUJTeTBK?=
 =?utf-8?B?Y2crN0pPODM4bmZGYUlSdGxoR2hkMG4wcmkwV01zRkZhU3FYaVZ1aThic2Zl?=
 =?utf-8?B?ZVFFcTNhZzQ5VG9BM2JNZlI3NTQvNjhwdnR2U1VyUXdxSXoxeitpdDE3V0c1?=
 =?utf-8?B?ZnZ6N0VYcXp6Qy9JU1g3L2VEaWJYaDcyNndzN1hXZ2h6L2V6OUtwN2VPWE9Y?=
 =?utf-8?B?Sk9EcVFHclJoUDRBY2paSXk0VlpEd3h0aUVHd2FNY3JyRW5ETStLYWJoc1li?=
 =?utf-8?B?bVhDQitabFVhSkdwMEZTZW1kZXBtQkNyQ01lRkF1bnpLamFjQlZHalMxeTF4?=
 =?utf-8?B?bi94UHpQd1NxSkNZR2UyaFFlRnJtODhNMTR4c3RORGZGQU1sSnhyM2JTbUk3?=
 =?utf-8?B?Z0JIRytINWYxb3VLWXM0OXBrVUdXYnlsMkJpMzRBQmVyaWVPdms0REhQek9p?=
 =?utf-8?B?VzdjZVJiWTNBRmVSek9FY2JBOG5Bdk5hZ3dWRXpneHF5OHozMEFQeVRzRm5P?=
 =?utf-8?B?dWVJTm9xb2Z5VUE5T1UyWlhtdVc4dkQ5NHNGWmpZVklBTUFXNlMzQUQvbkxV?=
 =?utf-8?B?djMzdTVVbmEyVjRDRUhDYndDQ1VnNC9rU21mMnJaRVVLWkgwbnRZVFhrU1hi?=
 =?utf-8?B?Y1IzQ0Y5bFdacUh0bjhUZnZwd0Z1QnloZUxHMDVtQmJyY3gvOTdCNlhKYlVD?=
 =?utf-8?B?blVHOWtRZUlySWJ1Ymk2ZFhVQmJreWk0VGNCZ0V0OTNoeEpobjU1SjdKTlp6?=
 =?utf-8?B?Z2tBMTVkWEoyckVYQUFBdEMyaDlYTjhXMUNKNFgyOVFZbUxHc3psbE5rQkpV?=
 =?utf-8?B?TktxM0t3NnZOekxScmsxc3NnNmIyZ1RTNEhuM3BRRmJ5TTIwWmNSWFdia1lM?=
 =?utf-8?B?L3BqZGpvYTd3M2RWUVM0N2VXZy9kUTlvWHM5azZzODVsSm1neGZZUks5R1Jw?=
 =?utf-8?B?ajhYaEJxSDRvTGRmdFdRNVVFWjdvQ1lCWmpOam83N2Q2dTJ1eVYxckx5alpJ?=
 =?utf-8?B?N3g0R296dm5nY0FQZjdFSVNyMGhVeHBMdDdrbnRlMjZxZVp0M2xQeFJuNklu?=
 =?utf-8?B?SDBhcjBmMnJ4bVRlbThucS81ZjNacWRJcHZLakc2MHM1Mnh4RjQyYjAwaHJG?=
 =?utf-8?B?U3djRmVBNHRnWjFqWUsyTnd3VHN0cC94RmZQNDdQclZzWXMwWmlJSkNiVU5N?=
 =?utf-8?B?VVRjVlJmejk5QjhQYktNL3YybFNJZmU2eklYZz09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:34:58.0477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f21e546c-5331-4b62-dc78-08dd82634242
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6433

Hi Remo,

On 14/04/2025 17:26, Remo Senekowitsch wrote:
> The device property API is a firmware agnostic API for reading
> properties from firmware (DT/ACPI) devices nodes and swnodes.
> 
> While the C API takes a pointer to a caller allocated variable/buffer,
> the rust API is designed to return a value and can be used in struct
> initialization. Rust generics are also utilized to support different
> types of properties where appropriate.
> 
> The PropertyGuard is a way to force users to specify whether a property
> is supposed to be required or not. This allows us to move error
> logging of missing required properties into core, preventing a lot of
> boilerplate in drivers.
> 
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/property.rs | 385 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 383 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/property.rs b/rust/kernel/property.rs
> index f6e6c980d..0d4ea3168 100644
> --- a/rust/kernel/property.rs
> +++ b/rust/kernel/property.rs
> @@ -4,9 +4,17 @@
....
> +    /// Returns the value of firmware property `name`.
> +    ///
> +    /// This method is generic over the type of value to read. Informally,
> +    /// the types that can be read are booleans, strings, unsigned integers and
> +    /// arrays of unsigned integers.
> +    ///
> +    /// Reading a `KVec` of integers is done with the separate
> +    /// method [`Self::property_read_array_vec`], because it takes an
> +    /// additional `len` argument.
> +    ///
> +    /// When reading a boolean, this method never fails. A missing property
> +    /// is interpreted as `false`, whereas a present property is interpreted
> +    /// as `true`.
> +    ///
> +    /// For more precise documentation about what types can be read, see
> +    /// the [implementors of Property][Property#implementors] and [its
> +    /// implementations on foreign types][Property#foreign-impls].
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use crate::{device::Device, types::CString};
> +    /// fn examples(dev: &Device) -> Result {
> +    ///     let fwnode = dev.fwnode();
> +    ///     let b: bool = fwnode.property_read("some-bool").required()?;
> +    ///     if let Some(s) = fwnode.property_read::<CString>("some-str").optional() {
> +    ///         // ...
> +    ///     }
> +    /// }
> +    /// ```

With CONFIG_RUST_KERNEL_DOCTESTS=y I had to change this example to [1]
to make it buildable.

Best regards

Dirk

[1]

diff --git a/rust/kernel/property.rs b/rust/kernel/property.rs
index 17ad176378206..bd43c910786d6 100644
--- a/rust/kernel/property.rs
+++ b/rust/kernel/property.rs
@@ -214,11 +214,10 @@ pub fn property_count_elem<T: PropertyInt>(&self,
name: &CStr) -> Result<usize>
     /// # Examples
     ///
     /// ```
-    /// # use crate::{device::Device, types::CString};
-    /// fn examples(dev: &Device) -> Result {
-    ///     let fwnode = dev.fwnode();
-    ///     let b: bool = fwnode.property_read("some-bool").required()?;
-    ///     if let Some(s) =
fwnode.property_read::<CString>("some-str").optional() {
+    /// # use kernel::{c_str, property::FwNode, str::CString};
+    /// fn examples(fwnode: &FwNode) -> () {
+    ///     let b: bool = fwnode.property_read_bool(c_str!("some-bool"));
+    ///     if let Some(s) =
fwnode.property_read::<CString>(c_str!("some-str")).optional() {
     ///         // ...
     ///     }
     /// }





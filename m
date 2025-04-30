Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8631E5B7A;
	Wed, 30 Apr 2025 06:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994427; cv=fail; b=Ox2nONOtLp7VC44Pcrg6DmVCYJsW3hNCPnvl6rJKnUGBSIzqQ3+PgPxyEhr8xaBbGA9ZSHdXIhKDi1fiCNTMIhaQH3n5FR8vwZ6JE+hVqsKc0GLwZJcW3dlTYEZX2NTuBkRtz4dokjZdLqkoe+Mr+tg+x+8uXtHnEULKKgyWASg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994427; c=relaxed/simple;
	bh=BUlpOPiRooA883LL+4k6Y77XRMSPf9kzrlCMzYSxogw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z1Z1T6JD3Yqd2G4aQLRcWsxm9yeSH8/WVNzfqRdYF46kJjTtwjmo2G0xuuvP1ZwKDukmoBKa6lKZwhj8fkTlVhFaU5MSMJPiuZZPjjNS09kHqlMQ1KkUAqZb06YCqWqhLneMYt9Sn+9W/Ci7XiUTWP+pdBy9jGHXeja5gMRiqiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=raXIdruU; arc=fail smtp.client-ip=40.107.22.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="raXIdruU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKcIQ2VNJmgkCSpQWDIFDW4wQyOVNLWiYBHsZXdPo5kb9CjYgv9eIdbwb998LARIvtfXpflTlkHRwtaNvEZVp67fl8LlXp6R4ytLmkzzZ1knj+IQtIfc/vitu9mPzSOOJUmk9dc83F8vA0/PnTeODe0D7UdNlxIBguiY9SSRYNEE5cuVEY1RJoKfua3LUxLzkCTkzNVhh3soOZl1LOuQAicYlACjeA+vnyiFk2OIQb/M1ajzGxm753dsmDlTuOaf5DmvChDcwccS/aJmN2h36TlpLijUkU0H4W042lFn/+pkbkYvBjhPPkTSjRqB3T0exDN2gGzTCgFPcrVJ/g8/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP5lYqnnUZzT7vFhBSOAXf+EM87XWW6iO7UuZaoPYPA=;
 b=BnuMXjRLV+DNSzfsCIR9ssm4x3tC4OfGu2opnhEvh1I6hfvtB9EmAp0k4CNQ5rM0vKqSDKhR04PYLMSsCAqicfvXLPJ3ZvQVre7nwFlWSot60A3NmznzP3Lq4/veJq4sIEllAN9hR2vmjP1cWz8TZNSfvAz+oeO/tJohw8XMPXRYlHUTsLxsf2ttUYiQwtthy9/uprFRXsKkFPXMOIuE1p0cYDf5VG3nSkMQfWm35V3Ay1TA/F7Arh/6uIH7ZZcpV9QDAJzG1CC9qLuc7rVTJxtHvhEvI6+UpQXoyrcY+W4GWjEF1fGOz6KlfANJcXo6+Cx2Fpoe9xCI3TynCdceWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=buenzli.dev smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dP5lYqnnUZzT7vFhBSOAXf+EM87XWW6iO7UuZaoPYPA=;
 b=raXIdruUkpz2FjaNO2mWoOcQCzemkmx75t2I7S84MaVi6jK8xElZUy7XU2VXOmm5TmYFtBJoZ1V72A65hYIAIO8BAl2jWKqWRGept8dMuACZgOSBcc/azYsaZmeI0FEDDF5zHV3vcY3wjt1/sCdqiplRihUDudWTCv3fD3bBb6pllAjPB410Om+qlq9vW0tAV2qYzWSb8cKq8ouaLji58lZGqx2LGQ1KgdzvXRnVz7FYS+M6guvW0F784oqDUqyl8e8TEECM+zNvhZkEAy8iTHtHBjRtWulpO+d0XBuUYFbd0fYjHC+Bmfw1zvOeIQYji+mjfgtGRAlyZkDaITMe7Q==
Received: from AM9P192CA0011.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::16)
 by GV1PR10MB9159.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 06:27:01 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::ee) by AM9P192CA0011.outlook.office365.com
 (2603:10a6:20b:21d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Wed,
 30 Apr 2025 06:27:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 06:27:01 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Apr
 2025 08:26:51 +0200
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Wed, 30 Apr
 2025 08:26:50 +0200
Message-ID: <e2dbf92f-5024-4dd2-848f-3d9e2f85698c@de.bosch.com>
Date: Wed, 30 Apr 2025 08:26:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 5/7] rust: property: Add child accessor and iterator
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
 <20250425150130.13917-6-remo@buenzli.dev>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250425150130.13917-6-remo@buenzli.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A60:EE_|GV1PR10MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: 490569ce-fe2f-4c3d-3512-08dd87b00499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TStONUY5Uy9IREdtTkkzRzl4eXZoYmZkU0VWdWExNWowUHpsYmJPSlU4K3ZF?=
 =?utf-8?B?cWU2MkJubVNQa0hXZnEvWmR3ZzdtOVhRdW9nYndsaFIwQ0Z3VUdENjhwVURV?=
 =?utf-8?B?V29vaml2YnRpZFpiZGRFMFBuSDRoY01IcVFxemtEZ3FocXBKbmpydGIrY1dv?=
 =?utf-8?B?TEU1blZ1dDlQb1FkWDNiVXorTTBFL1lhWi9qWVpuUEtYSXRkSEhsVWZYR3py?=
 =?utf-8?B?a2xhWFJ0MnJLL0dJVUlYSUJEU1p2cjFWL1AwSUZobWV0OGpIbUM3bnYyUUlq?=
 =?utf-8?B?TTR4Z1d4dm9Ed2pOSDBkUUtsQ1l6L2Z4MXNDb3o4dTd4THBzT3RtTE9ERTFm?=
 =?utf-8?B?L3BzcUdhYWRUOFJ0ZVZvSWppcnA1czB1UlA0Tm05T2Zyc2xMT3hDTW1yZ3Z6?=
 =?utf-8?B?MjVtZTgwaU0xRHJ4RHhXSkVDSXpZVHN2aDFQQ25vVGVUT1ZsbUYxV2Q3a0U2?=
 =?utf-8?B?Z1lJOU9wZUhyd01OQW5kczc0bWc2dGkvS2hHZ0hSRXg3RER4ZmwyTEpFa0xp?=
 =?utf-8?B?RlRBQXRvdHBWT1BtQnhra0NIM2ptNVkxV3A5MjlsbHF6SW9reHlvWitqR2x1?=
 =?utf-8?B?TU5scko1UzFSZ09KaFJ6Mm5GeVE1eC95c2ovOU1EUzg3YnQ3U3hXMnB5UnJn?=
 =?utf-8?B?Tjl4dHhDSVgxa3BUa3hQWkI1YmZiOFZvcWZoUmhZSXdFNmxVVEhZTTlFNGha?=
 =?utf-8?B?OE5LZ0k1Z3dqMWZ6V2NsVm80Z2RzK2hJWDhCVVJ5ZDhic1IzOXBwKytXa0dV?=
 =?utf-8?B?aHBNL0p3d29oNVZNOFVlZTdzMC9od3RVSEkzS05LNUZIclhuOVFKUU4xS2RE?=
 =?utf-8?B?SStTZzVYV3NPdHRWWC9SY1B5Wi8yblFNT0JPTFB3WUdzaCtucXRvU0Exb2tV?=
 =?utf-8?B?bXZOc3d2S01waVpyRTJMQ2ZyZmZ5cTdxd0luNHRBZldaN3NneXNrNFhBMzZ6?=
 =?utf-8?B?bmZhSkdHUUI5Yld4TXR3VUFZaFI5bmZmS1V2TnBYUlhkeGl6Y2x2ZVJnalFa?=
 =?utf-8?B?d1BRbEVqc3VlbUhhWFBBWlAyelA3SDY4TktjbzljSkdTa29lZjNjczJmemoz?=
 =?utf-8?B?U3Z6VXFvWkd0Ri9FVnk4U1FZejJWN003djJQMUsySzVMMTlPMHlqZXBiTUJI?=
 =?utf-8?B?eXdXNTdHQ0lWVnRSYjJPSG5JNXdlR09MVi8va2JLb0ZaSExvSGdwUFM4Z214?=
 =?utf-8?B?c3djbXlFMFBpZGNia1RXREczL3c0T2tUK2hEQnhCRU9ZS3cyaiswL3VBSlRO?=
 =?utf-8?B?MHpLNEc1ZWZxQXdRS2loMGh6eC9naExQeG92SnFhaFNGYVYzNG5HNUt5bmNG?=
 =?utf-8?B?RnFCM3MwMnVjRmJDbzRvZDdzdVpOUnNQMmlVdk5qTkU3UklGVXVCNE1iY3Nj?=
 =?utf-8?B?QjlSQm05ODZqbWVEVmhkVHNGNWZHdCticWtxOFJqZUI4elVBbEdQUkRvT3Vt?=
 =?utf-8?B?WHhaczNRSVMyVlJZQVYxT0RXdjN5ZVhPSlgzT3FlbXd2MlhwN2ZTaHA4am5a?=
 =?utf-8?B?UW9wWGp5ZnFXNE0xeDdvQ3M4QWdmMHpYamNraEJHRExpUHpMUHpsLzA0TFJq?=
 =?utf-8?B?QVJ0Z0ZlM0E1Tk0xNTYxdEdxZkhDQjE5bENBcjl3RWRPaUV3SHAzM0dIa1pY?=
 =?utf-8?B?TWptZ1ZsY3ZGZkZNbVExL0oySUMyR2crOWlXYlVBU3M0eE14N3R2NFF0NE1x?=
 =?utf-8?B?Z2VnZENPVTI3eVpZQjdCVW0vbDJGdnlnMU9NYmFrVVhVUVB0a0FXY0NMRnhq?=
 =?utf-8?B?UWUzQXpZMW9QeG1TUU1zNktQQVIxQjd4TWRrNjV3YTc5aFdjcHFQRWpJMXBB?=
 =?utf-8?B?d0E5MGRySklSakxqMzcrZU14enBoTUp0emlTTS9XZEJIejRjT09DeXQ0T1dm?=
 =?utf-8?B?L1pUSEl6c3l4Q2EyQUxlUEtxbk95TUtvYTloQ1BvZkRPaEs1MUw3TDJvNEZX?=
 =?utf-8?B?SHZpVzJNUGU1bHAxQUJlMzc4anNvMTVHeHIvL2xpMjBoN3hERk13Rm9FSnI2?=
 =?utf-8?B?YVgwQWs1N2gySUdSaVU5R3ljTUJackRNVEFxZlJaMnJHd3hTK0wwdnp4dGx1?=
 =?utf-8?B?S28zdWZnNVlucHVqUUZYNmxxU2NhNHBwRCtuZz09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 06:27:01.6901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 490569ce-fe2f-4c3d-3512-08dd87b00499
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9159

On 25/04/2025 17:01, Remo Senekowitsch wrote:
> Allow Rust drivers to access children of a fwnode either by name or by
> iterating over all of them.
> 
> In C, there is the function `fwnode_get_next_child_node` for iteration
> and the macro `fwnode_for_each_child_node` that helps with handling the
> pointers. Instead of a macro, a native iterator is used in Rust such
> that regular for-loops can be used.
> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/property.rs | 79 +++++++++++++++++++++++++++++++++-
>  1 file changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> index 9505cc35d..0a0cb0c02 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -13,7 +13,7 @@
>      error::{to_result, Result},
>      prelude::*,
>      str::{CStr, CString},
> -    types::Opaque,
> +    types::{ARef, Opaque},
>  };
>  
>  impl Device {
> @@ -52,6 +52,27 @@ pub fn fwnode(&self) -> Option<&FwNode> {
>  pub struct FwNode(Opaque<bindings::fwnode_handle>);
>  
>  impl FwNode {
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that:
> +    /// - The reference count was incremented at least once.
> +    /// - They relinquish that increment. That is, if there is only one
> +    ///   increment, callers must not use the underlying object anymore -- it is
> +    ///   only safe to do so via the newly created `ARef<FwNode>`.
> +    unsafe fn from_raw(raw: *mut bindings::fwnode_handle) -> ARef<Self> {
> +        // SAFETY: As per the safety requirements of this function:
> +        // - `NonNull::new_unchecked`:
> +        //   - `raw` is not null
> +        // - `ARef::from_raw`:
> +        //   - `raw` has an incremented refcount
> +        //   - that increment is relinquished, i.e. it won't be decremented
> +        //     elsewhere.


Quite minor: There is some inconsistency on using the '.' above. The two
`raw` sentences don't have it while the last 'that increment ...' has it.


> +        // CAST: It is safe to cast from a `*mut fwnode_handle` to
> +        // `*mut FwNode`, because `FwNode` is  defined as a
> +        // `#[repr(transparent)]` wrapper around `fwnode_handle`.
> +        unsafe { ARef::from_raw(ptr::NonNull::new_unchecked(raw.cast())) }
> +    }
> +
>      /// Obtain the raw `struct fwnode_handle *`.
>      pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
>          self.0.get()
> @@ -238,6 +259,62 @@ pub fn property_read<'fwnode, 'name, T: Property>(
>              name,
>          }
>      }
> +
> +    /// Returns first matching named child node handle.
> +    pub fn get_child_by_name(&self, name: &CStr) -> Option<ARef<Self>> {
> +        // SAFETY: `self` and `name` are valid by their type invariants.
> +        let child =
> +            unsafe { bindings::fwnode_get_named_child_node(self.as_raw(), name.as_char_ptr()) };
> +        if child.is_null() {
> +            return None;
> +        }
> +        // SAFETY:
> +        // - `fwnode_get_named_child_node` returns a pointer with its refcount
> +        //   incremented.
> +        // - That increment is relinquished, i.e. the underlying object is not
> +        //   used anymore except via the newly created `ARef`.
> +        Some(unsafe { Self::from_raw(child) })
> +    }
> +
> +    /// Returns an iterator over a node's children.
> +    pub fn children<'a>(&'a self) -> impl Iterator<Item = ARef<FwNode>> + 'a {
> +        let mut prev: Option<ARef<FwNode>> = None;
> +
> +        core::iter::from_fn(move || {
> +            let prev_ptr = match prev.take() {
> +                None => ptr::null_mut(),
> +                Some(prev) => {
> +                    // We will pass `prev` to `fwnode_get_next_child_node`,
> +                    // which decrements its refcount, so we use
> +                    // `ARef::into_raw` to avoid decrementing the refcount
> +                    // twice.
> +                    let prev = ARef::into_raw(prev);
> +                    prev.as_ptr().cast()
> +                }
> +            };
> +            // SAFETY:
> +            // - `self.as_raw()` is valid by its type invariant.
> +            // - `prev_ptr` may be null, which is allowed and corresponds to
> +            //   getting the first child. Otherwise, `prev_ptr` is valid, as it
> +            //   is the stored return value from the previous invocation.
> +            // - `prev_ptr` has its refount incremented.
> +            // - The increment of `prev_ptr` is relinquished, i.e. the
> +            //   underlying object won't be unsed anymore.

Typo: unsed -> used (?)

Dirk

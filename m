Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D269A217664;
	Wed, 23 Apr 2025 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411375; cv=fail; b=l30L9WQ9AszdeBHcWsOizD1NOwhMOiPDighEY7QoaWltbPoAq/eVR6zlvFaD5yR2DyhpWxGyFGxcQglcNV7UGRSDTw+SFFPC3S+cmx1GIFb0wyYgdxWMGnf7+apPGOF7sV1nbUk9iX3e9QTfET+VUoDKBh5B3CyqRt0Mw2Jy2sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411375; c=relaxed/simple;
	bh=+z1LwHYpFRym19t7IdtkYtKTJhuf1QB/nDdSxyqsAyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B6ZLS8/5VC1RTiBmmceorSvZav++x1OMBgDArVQQVc2kaQTaAn3nxwGHO9VdNIzfKJUcPsewLNG8emWRqahepk+OEK1/NMmia9nmTLPYa3Rtzkht1oD4fbOcdTRTFo2gnt4fTFjnPdQnJ4eIANBLDayXv2OL8GI0RRXWP1p9wNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=YapRCC1s; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="YapRCC1s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBObEg52TW0GvuHncBOKqmMuc71yNPPFjdZvo1V+b1l/2tdZUsFCCqITF55tcMEWCIr1r84og/ZYiTTVrWAjCBajJP6EISHhHx2LFtfpN9Uva4uXKTNHsQzDWwzegwYrtAe5G0tuC9pjHU74jpZJIU3KYoGti45P/BqwXhbyuxsj3aH0UTB+f9lb+k6iCkNcijSfBNPEbTn5qLWkpp1WLURLdhQnXcJyaNmLnQlUAtRcV6Y1Xoj5Qa2eFKIV/2mJAOx/CzuGiwiSch73MwY8yyJ6BuFTltwfWyB0Pfx6BdSpvZzfi2O/LX5X7Y7IndhGuWmsq7ANjxME81OjLRipyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlyP0vXpzWPXZF2U34GQj7l5E9qZvltMBmUm+8p+iG0=;
 b=jEhNPO6kJUh+S58cIZOHV1Esb8Q5thMgOlPKdVjCVdBr/NRT3BV4S39DMa2E/Jx66dUEDTA1X0IVHoB6hNc1ZAmD09dJU7g5hagYbQ3agAHVg9LUDjm/mUb+e1vaUNLcqBGwLOYsY9FDwwt4eYrnaQ48Z9Sxz89q4WWqxxorVGQwQa9JJBGiP8fWcDQdg61kHtk5pcQXP+b2b11YyNixwUb8cYO3oKZamFSVyYQZTWBN7gf4IYmdvQrZucZhY0xIFFuNosj3XJjAuYdEaMcdSFQ1gKyIhe3MkMYsdAqIv1XY2hYI3yTDllBHHQIoyXv5NNvdEljGmEhDHwguez/09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=buenzli.dev smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlyP0vXpzWPXZF2U34GQj7l5E9qZvltMBmUm+8p+iG0=;
 b=YapRCC1sTwIbh7orvLtx18WL6yLhlyVynXXfDgAb3qbPVBOvcpvTigaac1m9C+Loa/KONTSjARrgXGqqIEbDN2Mu+ivuPNSPBJfxwKs2dRtX/8XFz0j7TqRh3xMvjKnDdx4EpAFf11ZBJLI7Dmb5GcBe72DMksL6xdoY2ZVWX2Spva1dKHn5nz+Z4Dh/79WZ5kkpRyluAqYobDg7b3YIXSGlP8MsMGdsBgNVNKn1t3l5hWHXvWGhWfgu07HtFJ8dYUk9SGEpkK4XzxtCXYJFpSI23pJQ+0uVkw4gOGrbp996hRXnTBDjOaYXlu7NaA1jk1Yokf7y8M4H30efy4uzBw==
Received: from AS4P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::10)
 by VI1PR10MB3695.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:137::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 12:29:27 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::ae) by AS4P250CA0019.outlook.office365.com
 (2603:10a6:20b:5e3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 23 Apr 2025 12:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 12:29:27 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Apr
 2025 14:29:19 +0200
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2001.de.bosch.com
 (10.139.217.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Wed, 23 Apr
 2025 14:29:18 +0200
Message-ID: <d179848e-63e1-4921-891e-455834f3733e@de.bosch.com>
Date: Wed, 23 Apr 2025 14:29:11 +0200
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|VI1PR10MB3695:EE_
X-MS-Office365-Filtering-Correlation-Id: fba39a1b-27c4-4fdb-7dea-08dd82627d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGxXT0NaN1k2cFFmdVg0UTJ0R3AyU0h5dHlYYzQ4SWwwRjdBVHU0NXpSZzNi?=
 =?utf-8?B?dmpqRUxic1p0T29lZWpHaEFTYmF4RjlPejhtVjF5djZYT1lVdkp5ZUdDcGFX?=
 =?utf-8?B?dEErUzFCOFZGQ3QzQU9uc2dJOHU0aFIrZHF5eFdscUZCbUhIdDRTblhkcFFk?=
 =?utf-8?B?Vzl6UDJxQlRsQ0ZJRzlDRUd5aFZudjNlUUlOMHpSQVpUdGtaN2VQR2E3NGxs?=
 =?utf-8?B?NUdxemRrMjIwMEhBaFpMNi9KdXBPZ2xDdmFYbkVUdzRDdTZIU25SNUhLSUEz?=
 =?utf-8?B?OTV2WTFpZEQxUTBzbWlFSkVxM1hsUHd1VDFDR0xYeVR3VEFTZlRkSm5rRTRj?=
 =?utf-8?B?MHRNZ1MvMk9IRFFCblB4T0dmZTV6T0t5RjUwQndQTEg4VkZQSlBkcWFJS1RY?=
 =?utf-8?B?QUFOVExUUVBOMTBjT3gzaGdNRG90R0ZkRmZ3WHBES3FsTit1TWQwZUYwVmg2?=
 =?utf-8?B?cXYxWHFxMGV0ZTZ4K0hVVGtrK2N2QUdmOTcvVjB2Vk1aNlRDZWczUUhmTU51?=
 =?utf-8?B?ZE5QZmNFNVFObkRsR2x3T3lUY01JOGJkZ1ZnSVJ5YlNVZVlBaG1hODkvbWZR?=
 =?utf-8?B?SGlpOUFIdSs3eDlQNWd0TmZ1WGYwR21uanZBaU9NUUl5S0NuNnJNNG55SmdM?=
 =?utf-8?B?T2thNzRhSFNPeEVuRnZPZTJ3d3U5TWxVcllDLyt6SmtsaUNvQzhWMnVVOFND?=
 =?utf-8?B?S041a05IZ3VLc21QZWhLSEVnTFM0dGhvMGhKTFhaQVFCQzA5VmJDTWZRRGkw?=
 =?utf-8?B?WkhZRVFqN0tNVXFITTB6aGhBRS9PdnA0blZkdjRyT1NOMmNTS0FILzhTZTZC?=
 =?utf-8?B?biszZllaOFFBVVZMT29FaVI1ZjJpTS9LWXFtRUpTOExxWXpXNGRVbmsrVndm?=
 =?utf-8?B?Z2JGaVpRd3duZ1lJNXdHQnkzekRZSUxEL2lrVXN0YWRFK1JkTWdnd1hiTmNl?=
 =?utf-8?B?TXFMWjNQUmZMMDY1eGxxaW1mYmkzOHZTa0RNaUU0c1RUQzNoK2NpYmJyMVpR?=
 =?utf-8?B?enc4QUhBQVZZZ21BdXVEcEJFTnQwV0tVNkR2UzZxbDFDdEZlYjhsdm5EcDFW?=
 =?utf-8?B?UFA0NUg5RzB1c01tQXNTeGwvb1cwSDBkeG5FVTBpZjhzYzJQbXBlUkNsdU9T?=
 =?utf-8?B?enVzb1dwb1RPQnkydS9zbGtjc2FNY05yVlArOUUxZ1JzdHFDTitDWW9nQjhw?=
 =?utf-8?B?bWZWT2VWdDZDMmNKTkdhMUJEYjdMRXB2OTRKZGlhSlp0RkIzanJqVGRLdm9V?=
 =?utf-8?B?UkpRVDR6RmtaSzVGOSttUmNvckZra1dlanQ2cnc3VzZqdnE5TEtVcXh1a1cw?=
 =?utf-8?B?ejNEMnNYM0FQRVp1VElsaHovalhGWmtIM2djYThXcG0vcEtuc0h5TWlGLzU4?=
 =?utf-8?B?VGk0UlpBREFFTVV1WGVHSVVXYUMvZlpONzZLTW9nTmNTNHJrZEdKa3pjWk9y?=
 =?utf-8?B?SGdSK0VEaUhuQ2VjeWZDRHEwYXVITHE4eS9ZdUFIQ2RxdzV0Mm9kRE9ocFlt?=
 =?utf-8?B?WERBNEQrdGNpUTkyOThkTWJVMUlDV1Ewa2pMWDRYLzQ0Q0lnUzRvUzVDemYy?=
 =?utf-8?B?cHRncHBmbzBTUk5NL3lGZkd6b0M5VmY3aWd3bzdGRDlVTlBUeFh3Ty9tUzgy?=
 =?utf-8?B?MUlxRDBZSHFpdjhCbzZlMHB0Y0FzSXJ6ZlcrSThObGx2eGY0VHhuWG95NlU0?=
 =?utf-8?B?R1dmNW8zVHpDTWZOcmNlZlJ6YlJIQUdpbjdRUXBlUEhKbWpYRzlFbURKMkJy?=
 =?utf-8?B?cW1jVUIwcHQrNmNiVHJYbnlWZktFKzhkQlhnSFBudGIwUTBuYmJkNDNTSnVQ?=
 =?utf-8?B?OXp0M0UyZ2hTREVjVm5GblM0VjdrS1FwRmhlblp2MFNESGtRcVVMZUVDcmlp?=
 =?utf-8?B?bndVUlpVRXcyYjYxUEIzRUc5Tmk5eEpwdkk0V21sc1h6MU1vSEVTeDc3a0xq?=
 =?utf-8?B?M2dUVk1zSm5sWWlqRUJsSmFiQ2pSSDJFbmxTT2R6NkNDblVyZjN5czgxRmcw?=
 =?utf-8?B?aU16YjRTelhSNEJUMzAxZlowaHhRT29KeGkrbDZ5bjdCVjFudlBkMHM0NE56?=
 =?utf-8?B?Zk0zNFhhbnRQczl0M21ST29FZUE4QTdtbXBydz09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:29:27.6726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fba39a1b-27c4-4fdb-7dea-08dd82627d53
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3695

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
...
> +    /// helper used to display name or path of a fwnode
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must provide a valid format string for a fwnode.
> +    unsafe fn fmt(&self, f: &mut core::fmt::Formatter<'_>, fmt_str: &CStr) -> core::fmt::Result {
> +        let mut buf = [0; 256];
> +        // SAFETY: `buf` is valid and `buf.len()` is its length. `self.as_raw()` is
> +        // valid because `self` is valid.
> +        let written = unsafe {
> +            bindings::scnprintf(buf.as_mut_ptr(), buf.len(), fmt_str.as_ptr(), self.as_raw())
> +        };
> +        // SAFETY: `written` is smaller or equal to `buf.len()`.
> +        let b: &[u8] = unsafe { core::slice::from_raw_parts(buf.as_ptr(), written as usize) };
> +        write!(f, "{}", BStr::from_bytes(b))
> +    }
> +
> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> +    /// printing the name of a node.
> +    pub fn display_name(&self) -> impl core::fmt::Display + use<'_> {


I don't know about the details but with rustc 1.81 [1] I'm getting [2].
Just doing what is proposed seems to "fix" it:

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3b1af034e902e..eadf7501d499b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -26,6 +26,7 @@
 #![feature(const_mut_refs)]
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
+#![feature(precise_capturing)]

 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.

Just want to mention it because I think the minimal rustc version we
have to support is 1.78.

Best regards

Dirk

P.S.: Many thanks for working on this! :)

[1]

$ rustc --version
rustc 1.81.0 (eeb90cda1 2024-09-04)

[2]

error[E0658]: precise captures on `impl Trait` are experimental
   --> rust/kernel/property.rs:256:61
    |
256 |     pub fn display_name(&self) -> impl core::fmt::Display + use<'_> {
    |                                                             ^^^
    |
    = note: see issue #123432
<https://github.com/rust-lang/rust/issues/123432> for more information
    = help: add `#![feature(precise_capturing)]` to the crate attributes
to enable
    = note: this compiler was built on 2024-09-04; consider upgrading it
if it is out of date

error[E0658]: precise captures on `impl Trait` are experimental
   --> rust/kernel/property.rs:271:61
    |
271 |     pub fn display_path(&self) -> impl core::fmt::Display + use<'_> {
    |                                                             ^^^
    |
    = note: see issue #123432
<https://github.com/rust-lang/rust/issues/123432> for more information
    = help: add `#![feature(precise_capturing)]` to the crate attributes
to enable
    = note: this compiler was built on 2024-09-04; consider upgrading it
if it is out of date

error: aborting due to 2 previous errors

Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B7E15A86B;
	Wed, 25 Jun 2025 06:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750832610; cv=fail; b=CAc9ajJlKRX+88XHNyZeMI1KyqFXzf9+mDhgjbkxehJF0mwhkikC4yF2cxVnDBwpMY1p9gZA1gtBuEfHAfJ+X9Upp7DbvsgpiFu/xavUS+ImxGs6iKmTXFzXPKq0khnaM2ZkpWbns15Z4iZdvGXEFApsH4Cei28x5TxZCnXJzl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750832610; c=relaxed/simple;
	bh=jDFAGZOoHrRxjh9mw0olQVG/6ikExjDVOAg66G5SWZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aBN8XJRWv+UrdoQAbj5zP0BrXK57NTrApMMVsuvkZYhTKwxI/Fp4UPZlqo0ZNEG+nQuz5i0wgaHu+hWs7g3eScml+SisgWV4TMbhRNjnORvDr2POBeuGpZo/wpHMluqPIF45upnd+g8BMXat2kMUv1f4bIrHl/jXg4WncP2l+xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=IUy6h5RX; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="IUy6h5RX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdEz+LR9dKMhw6L+TKpJYb1URLuxUemMZ6ynOSyAA/LbSjIhGCNzY2n3TwPf+ygi7JEJ2WpU4mXc2HOq+E/SxeoyPQwQo8iBOdDnBs8x0mgjiLysj+aK+/G16iXU+v5ozisUxhULmIdkbyo/QAOrSZeqRQfZZzNbVgdQ4gLJL9KbYw3skHRX/2Rw9BcYr1zKIPAn8v1DFBliX7Apc5khUe9YJZJ7MPO/csSOwAP2EQDF1CC++giysO+cbhuuy0VzNRdPRZCmu8m6qm+yaoXulzrgU8mj1cCkry6sMTRbAIXGbjQzvCB70wwWJ6DWqy/KllxhXlX6+ATUoV6r56naPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCjchQIP0TCeADoa/aE0yvTd6WPLK2hH+W4Gj+ysL7k=;
 b=jEUweRvOmh/RpZw+aqqMyZ3T0BI/QGpwrAn3S53gelCDqLbFCPHR2MRhkbtTxHS13eFils1pKyQ3lwoOx/WQQImGmoiZNKJNhJOOegfz0fZa7GBLsiBxF0fQw4+xC4f7u0mZfQ50RAw/1xgXQYB7NXD82yxeTuC0pAwCvDEYK/3M9IXMRtxHc3vWJuSnsMVXNSotGd4sA/y42lxP56FMrWdg6n+rKDMJ+DUKhJDPnUN99GpIgBudt4e4JtMnBcl3VSoYQ9/QNhoDpKZ7hwDofi9GfvxhCIo+ddWOtOJWtfBI+vgO4/knqlrhq8sc1tEaJ7OyZK/CvRmgIWWmNvkO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=google.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCjchQIP0TCeADoa/aE0yvTd6WPLK2hH+W4Gj+ysL7k=;
 b=IUy6h5RXLDjljZSaDgJV19kiPWt8BrMPrdX4pjzmoS8uqhSvrMLm+wfaDXR9UEqfDi5Xr/Rj5Y3p84s4YBIF9qd0UcgtVOuScv/P3rDMd4wKal3bRXSrBtMVqne/0LsXogFGsUD7MXVaamYBTF/yb0HYg/KUFjBnpRnyS88LciCpCNGXKWZtE42U/bvShJSXnCVw+EFVZi/FoR0S0DegcFxVWcfkMRm0iYzJsrT1zMvmh1dN22lJ/RGnyP0HbaEftJk2NBzJBng0wrhjmW211rWIlMnvHMi3YHk7EK2H5JW/8GbvAic8ApgJbcb2IssngFPyP3/MTzGFkeF6y2pWqg==
Received: from DB8PR06CA0040.eurprd06.prod.outlook.com (2603:10a6:10:120::14)
 by DU0PR10MB6385.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:40e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 06:23:20 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::7) by DB8PR06CA0040.outlook.office365.com
 (2603:10a6:10:120::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Wed,
 25 Jun 2025 06:23:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 06:23:19 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Wed, 25 Jun
 2025 08:23:14 +0200
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Wed, 25 Jun 2025 08:23:14 +0200
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Wed, 25 Jun
 2025 08:23:13 +0200
Message-ID: <a9fe125d-6227-46ed-b006-daa90b2f4d53@de.bosch.com>
Date: Wed, 25 Jun 2025 08:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v7 0/6] rust: DebugFS Bindings
To: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Sami
 Tolvanen" <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, "Benno
 Lossin" <lossin@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DU0PR10MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 268373c3-df43-4ff9-16ef-08ddb3b0c79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|13003099007|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUJ3UVZtUTU5WUUzQVJwdGJGTFB2My9qVGc0ZDFnU2Z2RTUxMENnbm9IWlRn?=
 =?utf-8?B?cjNSWU9zVjlqYVVyU0JnVjh6czBsdy9hMlhRS29YZlBKYmhCNzQrVFdjdG90?=
 =?utf-8?B?OFMzSmlCb0RKdHRZL3FMaEg3Wm1DWk5uMklyemloNDNGNjc2NUhPWjhCYlYz?=
 =?utf-8?B?LzlweG5DZ05kNEZaNm1BNWZydVh2aG9GTkJTLzhwVUNzV1Rhc3ZndU9tUGVr?=
 =?utf-8?B?Zm9SalJscWc4RFpteWZlM01ybW03emVvbHJVZ0M4RlNyTVhxTlk1QUZLN1VS?=
 =?utf-8?B?UFlwSUl2NTMyYzFzanZHT2dERVdLejRlYW9GeWthbnErWWw2U0lOSlNoYllU?=
 =?utf-8?B?aW55eG1oeU41ekV4cnMyRmp5d2tCTkxOT1h4YWhTVWtZblUzVE41RWJicDB5?=
 =?utf-8?B?TWppSE5TdFFVNlhnelVsSmJWT0Rrby9GNG02LzVLdXBXWis3eVBFdzJQdUQr?=
 =?utf-8?B?VlV0RVIvNytSS1hWL2tMQ3BVNE12ZnlDaW9Yb1VrREJlMDhPb0VNVDBUM2xL?=
 =?utf-8?B?VEpOUTY4eEkrdytzOUowcTRDY2Z1RTVlWHVaZWRRV3BPbDE2WThHMzA0ODdZ?=
 =?utf-8?B?WllrU1FwNXhSNENadHhINVc2MDNkNWVMZE5POEJ4VEdySUl2bkYxd0VIalpn?=
 =?utf-8?B?dEl2QXdrNmpsZ1ZaYmhPWGRTMy9RV2R4b3BYMjg3Sklpd2hpWnlrZXkzOGlh?=
 =?utf-8?B?cUJvNlpRYmFIOXlQNXBHODFJQzBTalI5ZFYyc2RMU3o2ZUxHZmd2cGY5T05K?=
 =?utf-8?B?MFJIVERnaDNjTlFBdFc5SzlMZFhMMGdFZlZtc1M4MGlPQlBNZmg1enVlTWp3?=
 =?utf-8?B?L1RQTU10TURmRXNyVHg3RkVGeE1wQWVEdSs1ZUFXOFhZcDYvR3VZV3llMjlB?=
 =?utf-8?B?RkdBOUxYMm9yeFZwS1JBRVpzSlk1SWhGc1ZCSDVvc0xOTittRGszTmJreWZU?=
 =?utf-8?B?cDFXQkw0U2hTUkdCc3FLOGFEaHF4MDNMQ1RuUkRwUTFYWGZtcHdCaHVyeCtG?=
 =?utf-8?B?L1ZocWd0ZWZDK2pMdjRjY0FaUmxOdXJRQU9ScjlObElBZ2VHNlBMZURLSy9D?=
 =?utf-8?B?bDEwRHMvR0NZU1J5ZWYrY3BxY25oQ2gvejA2ZWpxNWpuWE5USkJaVmNrTXBB?=
 =?utf-8?B?RWkrRUZqNndlb1d3S1VMS21xWlJkekpSZEZwRkVudHQ2WUdZMVRRVmZldVM1?=
 =?utf-8?B?REhjWkF6N3A1MGlFSlMwRnZVM09lUnp1bWNZaThmUDJEdUUrZmZqZkpIZUla?=
 =?utf-8?B?a0hJdytMZThtMXBHdk5mUG5mVkc1N01Dai95Mmd6Vk4zYVpXVGQxNFpqOGpq?=
 =?utf-8?B?L0htS2dvTWlQWXhicU9Gamwwd01HU0pmMHphd0FQNGFMSlBUNUxnTE5XOE1H?=
 =?utf-8?B?TDRIM3dCL0lLem9zTkVuN0ZYalBnQ2svQ0lqcS8vMFJ6bCtlVDI4ZXV5b2xt?=
 =?utf-8?B?QmlQUjFPMW5IMmczdStmWTBReWR6aHdmS3BKQ0pwNFF6alNzT0Q4OG54dG13?=
 =?utf-8?B?MjVPZ3BuejdCMnNETGNObEc1c08xSVhGKzVqMkQrTUVHTXZqR3hlVjNaOXZP?=
 =?utf-8?B?UmR5cFViMGFySkYwd2lwUG5oc1ROVG9MV1RsZmREeDlEcWd2T1ZIeXVCQUUz?=
 =?utf-8?B?aUtIMDF5Q3F0ZExTNTlTbU5rT0dGTGJXbTZnWkViMWpiemF3NDFkYmk4ME9W?=
 =?utf-8?B?RkhsR25vdXRmakIxbU5EU2F3SmQ2bXdHM1ZabG10aENqL3ZsM0VGMkw2RTZs?=
 =?utf-8?B?cVVMVFArV0wyTFVNQzZxZlNwdWNwcW9OZGxIUDN0S0lIaTBKQ1A5Yi9OMHQ5?=
 =?utf-8?B?c1BXdzhFM3RtaDVGVEVNMlRNMk5RMER1Q2p1Z1RVZTd5VngwOGM4Qm1iL1NT?=
 =?utf-8?B?eDlqaUM5TDZkRDljMEVYTkphM2F1YVcxUG5UbjQwc1lKYjk4aENxYm16ci9X?=
 =?utf-8?B?TXVWaG1ic0RIbGg4dFQ2V2I5S3ArZlkxTnMvVnpDSzM2eURGZUdQQjFNWFBQ?=
 =?utf-8?B?ZWp2cU83andNbXBWaFpNcEJIaTVsTWk1aUJSMlpBZFZhOVRraHVLVmtZeFBv?=
 =?utf-8?B?SHl6OHJCZkswanVmYnd5cEZoTi9UZjhNQythUT09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(13003099007)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:23:19.9872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 268373c3-df43-4ff9-16ef-08ddb3b0c79c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6385

On 25/06/2025 01:25, Matthew Maurer wrote:
> This series provides safe DebugFS bindings for Rust, with a sample
> module using them.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>


Same testing done as on v6:

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks!

Dirk

> ---
> Changes in v7:
> - Rewrote `entry::Entry` -> `Entry`
> - Use `c_int` and `c_void` from kernel prelude rather than core
> - Removed unnecessary `display_open` cast
> - Switched from `Deref` + an explicit box to `ForeignOwnable` for
>   attaching owned data.
> - Made `&'static` and `&'static mut` implement `ForeignOwnable`
> - Swapped "driver" to "module" in sample code
> - Link to v6: https://lore.kernel.org/r/20250618-debugfs-rust-v6-0-72cae211b133@google.com
> 
> Changes in v6:
> - Replaced explicit lifetimes with children keeping their parents alive.
> - Added support for attaching owned data.
> - Removed recomendation to only keep root handles and handles you want
>   to delete around.
> - Refactored some code into separate files to improve clarity.
> - Link to v5: https://lore.kernel.org/r/20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com
> 
> Changes in v5:
> - Made Dir + File wrappers around Entry
> - All functions return owning handles. To discard without drop, use
>   `forget`. To keep a handle without drop, use `ManuallyDrop`.
> - Fixed bugs around `not(CONFIG_DEBUG_FS)`
> - Removed unnecessary `addr_of!`
> - Link to v4: https://lore.kernel.org/r/20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com
> 
> Changes in v4:
> - Remove SubDir, replace with type-level constant.
> - Add lifetime to Dir to prevent subdirectories and files from outliving
>   their parents and triggering an Oops when accessed.
> - Split unsafe blocks with two calls into two blocks
> - Access `private` field through direct pointer dereference, avoiding
>   creation of a reference to it.
> - Notably not changed - owning/non-owning handle defaults. The best read
>   I had from the thread was to continue with this mode, but I'm willing
>   to change if need be.
> - Comment changes
>   - More comment markdown
>   - Remove scopes from examples
>   - Put `as_ptr` properties into a `# Guarantees` section.
> - Link to v3: https://lore.kernel.org/r/20250501-debugfs-rust-v3-0-850869fab672@google.com
> 
> Changes in v3:
> - Split `Dir` into `Dir`/`SubDir`/`File` to improve API.
> - Add "." to end of all comments.
> - Convert INVARIANT to # Invariants on types.
> - Add backticks everywhere I found variables/types in my comments.
> - Promoted invariant comment to doc comment.
> - Extended sample commenting to make it clearer what is happening.
> - Link to v2: https://lore.kernel.org/r/20250430-debugfs-rust-v2-0-2e8d3985812b@google.com
> 
> Changes in v2:
> - Drop support for builder / pinned bindings in initial series
> - Remove `ARef` usage to abstract the dentry nature of handles
> - Remove error handling to discourage users from caring whether DebugFS
>   is enabled.
> - Support CONFIG_DEBUG_FS=n while leaving the API available
> - Fixed mistaken decimal/octal mixup
> - Doc/comment cleanup
> - Link to v1: https://lore.kernel.org/r/20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com
> 
> ---
> Matthew Maurer (6):
>       rust: debugfs: Bind DebugFS directory creation
>       rust: debugfs: Bind file creation for long-lived Display
>       rust: types: Support &'static and &'static mut ForeignOwnable
>       rust: debugfs: Support arbitrary owned backing for File
>       rust: debugfs: Support format hooks
>       rust: samples: Add debugfs sample
> 
>  MAINTAINERS                         |   3 +
>  rust/bindings/bindings_helper.h     |   1 +
>  rust/kernel/debugfs.rs              | 268 ++++++++++++++++++++++++++++++++++++
>  rust/kernel/debugfs/display_file.rs | 155 +++++++++++++++++++++
>  rust/kernel/debugfs/entry.rs        |  66 +++++++++
>  rust/kernel/lib.rs                  |   1 +
>  rust/kernel/types.rs                |  58 ++++++++
>  samples/rust/Kconfig                |  11 ++
>  samples/rust/Makefile               |   1 +
>  samples/rust/rust_debugfs.rs        |  76 ++++++++++
>  10 files changed, 640 insertions(+)
> ---
> base-commit: bd243cb5d922cc6343007a3f3918c8d1970541d2
> change-id: 20250428-debugfs-rust-3cd5c97eb7d1
> 
> Best regards,


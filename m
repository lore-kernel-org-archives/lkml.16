Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012008.outbound.protection.outlook.com [52.101.71.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530A1280CC8;
	Tue, 24 Jun 2025 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765087; cv=fail; b=ShcAK+oETdw4wh2BLbmgbi/gn9KRTl9ykU7LdL0iRBsHRp9w3WOpcIMtiG91MluHvAQtcR/aTvTeg5OWB2+M3Zl43xa8WC1CGVvKwc71JJggeFNXGvxrO9pFvcaRBQPdQzloFY6ANMiN54XKM2Gt5L4vhkuqwaiMvg9j5vD4Ayo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765087; c=relaxed/simple;
	bh=g3pV5CCzAL/pwfjwm+tVjG+felHRkaVUXNIbPhlCjV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=exl7lrgqBfXSo3aVTCILZLh7qzu518tJi+5gZGd98XY7jqs7LDtIi1CzfZB6t2CZMmYiHrsFIJM08nLhllhwyteO5I4xItXMhycPHePxRFrOZXb34NrbmjH+FVAxWK/PPhJak+KakrlKjX6hn+A55SOcRKSXg7k9XknN+DE5Olg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=gyhgh+/M; arc=fail smtp.client-ip=52.101.71.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="gyhgh+/M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlrBLmq5X9jLJ3TNR3X65zcn3zOYRiCf4GyLHZUIGdIN307RIi7ZE9fy4J8XFCrJH0bvWXmtdE/eS8siua3KGGxlWUmknP4CMO5PAdQz8NvEUIpoJ1ECh3oRiNniqhZbXv31Mf8I5tiXYxALneUZvNP+zJSeSwM8NRuXwjbmpNbqVgqeMujtr6AvaLrCbFoCj1ShHQYFiYGFgsCStrjE4NyvwjzOQoJ1nZR4UtlRURGl+0P5l1UpI8HgMLAQgwuiwLYhBxc33Ta4LE/0W6xO5gdzgX09hL2fuvKrm5Vz5wZoN7qRXU+apKU7ALrtR4NJQ6MU2FqvTYYpKVPVTIMefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCCb4hHcpPxGnVA6im6TgqeXKOib4Pb285atxT2ZbCA=;
 b=UjzHqcfhBLpIddS0OS0eb+YT5LJDsXLT+T4yWEDj/xpoMVCNltbSDpfQBxljMHCb7vXHoKYp2nKjeFzyWcpXDQ7Zd30/S4LGLQIhdgrFjbI19D1f1Y/FOdV4hkgvOSX3okWkowYAuyQ20AnzqiC/CWgAj7fzoykN+54LfUFr9gwzUAcckffQR3oqKL0AY3EC4peD2bgNt5P+WK1bD/w0HoUydlB9puZYssnmmbUkIrMD1rUGOMZBmkwUITo0hgt2iGytslM53xnGUtkRE0rPkkmJ68p5atdfvalNwh9eBvBDMDLnmFfPaU6rEJRlirrjK/WKE7cjrNlEs4bGd2NWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=google.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCCb4hHcpPxGnVA6im6TgqeXKOib4Pb285atxT2ZbCA=;
 b=gyhgh+/MmWJ4vE0dOwoT4ozky8OQ/pA/mgwf3CdZbIu1u3fdCiQv7v38LmF4xbRvxm1+eLAWjU9aft4ckA8QGfoALVOQqvtp5taTjGaTPTBI96ZKXOXt9MdrDKCqvQbBdG50gqI+o0SqVjUsjFaRCaBvCbj95r7RnvsXUXWgSYNUO/DH7dGemse3Qn92eaTtxdsJ2eje1XO3AIw7GwkOszTXfIUC88C0siQt8rheQK16aog7uVEccTUN1s0fDmEEkMiFr4KgGLOEl6MOOJGl8ncMZTFH3/luaD2ySWX7sG2el9znhCcSIuwfX/mHPBhG9rURY4fFqakB6zkFdT6UOw==
Received: from DUZP191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::29)
 by DU0PR10MB7460.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:425::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 11:37:59 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::71) by DUZP191CA0019.outlook.office365.com
 (2603:10a6:10:4f9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 11:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 11:37:59 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 24 Jun
 2025 13:37:46 +0200
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Tue, 24 Jun 2025 13:37:45 +0200
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 24 Jun
 2025 13:37:44 +0200
Message-ID: <0c9466fb-4d62-48f4-be5c-20e25b4003b4@de.bosch.com>
Date: Tue, 24 Jun 2025 13:37:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 0/5] rust: DebugFS Bindings
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
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|DU0PR10MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fbe913-23ee-4788-e777-08ddb31391fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmxIWFFUaTRDQlphYTFuM1ZmUE1oV2ZaTHNFRk9zM1pVZ2o3cFBnK3ZXMzE0?=
 =?utf-8?B?ck5FeEJwSnpvWVp0QnkvN0QxdGxKREtjTkVWNW5YUTBhRERueXFLVTloWjNs?=
 =?utf-8?B?Z3NJMzl0NjBlZkxvTDNpa1ZNOFhubHZMSXBVNkRuajhVM0hGN3BBb2hnTm5o?=
 =?utf-8?B?ZEpmNVVLUjZneURKMS8zUFFsSVpxYW4xRiszaFgzejdzbUF4VE5BVjhlOGs5?=
 =?utf-8?B?MHNvOEZ3eWVxWXJjamRPQTVTRGJaNGdWNTR4RGY0aTJxSGU2MzhZQmxWbUdR?=
 =?utf-8?B?L3ZQK3g0UXlPMmJqM3BNTEtZOWhMdlBnVmlYWWp1U1lHSG8zQzd0Z0grdnVN?=
 =?utf-8?B?T2dxUEJmSFRBbFBsY25ZT2IweUZWbEkyYjJpMDFzRkhRUjh2YnNmNnpKQy9G?=
 =?utf-8?B?a3Z4aXR2dEdHZlpLelBNYVZxWU1JR3B3ZE9UN2NyejFEcWZtQ2kyQjI3RWFG?=
 =?utf-8?B?QzNpU3ZtWUw1ODBLMi9uVWJwYWxhSXAxNkFQeTJxVjZJQmNTYmlHVksrUzNy?=
 =?utf-8?B?UEd4QkdBTlg5ejZJV2RRWS9JYms5U2ZGR0tUNTV2L2dGUWVucHZDQmFtVzNG?=
 =?utf-8?B?b2d1V09Cd2dTWVhpVGtjVHY0bWluT2hoSEIxRkF3eG9KMDFaL1ZkdGRFN1lu?=
 =?utf-8?B?REZDM0VMS3lYallocEhLZzJlaFRMNklPZkFPcy9xakRYV3FPdis5YnlQMEZX?=
 =?utf-8?B?eUdtUjdHNldQc1V0Qkc0cmc5Ri8zS2hrUCtzVkdJUkkzME1zMWFDVmZLNmhu?=
 =?utf-8?B?ZHJ2QXlXN2dIRUtoaWUxTEZhdmRXRndHR2xpd1hJRElrNkxHOUlYYmFDQmZi?=
 =?utf-8?B?SzJmSUpjaDhSa2VmYnFzM1JHNHhhajFpbTQ1eXJOZ3djMXdIdUc3bFZkNXdZ?=
 =?utf-8?B?WTZheEFZZnl6UmdjK3M0MjIrc0IrK2c4aDdCT1hZZUZlbGJFMTJlYUxXS3U4?=
 =?utf-8?B?REFmNmZ3KzBxTktDbS9wcnZudTBKK3liOU80UDlLM1BNblBJdWQ3c1d2UkV6?=
 =?utf-8?B?cHdkREwzcmxyT1NVc1RyVHByekN5T2VSMjgxOU5xOXRnVWFYZHNHNGZKT21M?=
 =?utf-8?B?OURqVENSZ0liRFRFV0JtSHdsVVlHVTBER0tZcFE2Q0k4OWd0bHAxekF2WXNk?=
 =?utf-8?B?dm5pSHBXQWVCWFRZWEIyV0VOTGttTzQybDg0SXdidnY4SmJVRjArY1o1Tk5O?=
 =?utf-8?B?UjhoYlIyWHd3dW5kN0xYNTZ0aEZNWE4xb1cwTXZaZ1pPc1VpV0tRUUkxaXlU?=
 =?utf-8?B?NU1CZUJlVWxNYjlLekUzV09GTkdnMHI3VG5YVCtTY2FKUHl4amJ1RTNGcDFW?=
 =?utf-8?B?amdJREFXWUVGS0pUb1h5eEduUXhLTlZKVmRPR0NPT1NOWUN1TDlFajhHOWNj?=
 =?utf-8?B?M1k2ZHRIZHhraUhWOXZaR1FHa25IcHd5c0F5cGxNaUxWM2JaNDcrUWdmYnl4?=
 =?utf-8?B?T0lOMmRlVEhnaG1NeEhEOFI5c2t1NGdDTi9ZaXd3VWhZOHNLRUhXOFNIQTRF?=
 =?utf-8?B?WnJndUhmcENKNmdNeTFLQ3hudkZoK1BWdXFYb0ZXY200cmc4OFdqRXdwQlEv?=
 =?utf-8?B?VHFxQmJJREZxZVF1a3VyNDlweCt0SUp2a0JuWVcvZU40R2w2MEwxOTVvS3Jh?=
 =?utf-8?B?RkFGU3hTK2tiekNrZzQ5RzFzWXoweVZaYWU2dnBFeStvQmRKa1VmMGJuRTJD?=
 =?utf-8?B?UFU5VGNIaGFzODYrbzluV0x0V1pBS0tsS0dlNDk0OFN5N1hURzVLM1JGZExK?=
 =?utf-8?B?TGxGekZKaU9xVWJuT0VSNm5FaUFGNy8xdjB4eFZKdWtzMTQ3eklJWXplUnky?=
 =?utf-8?B?emYyaFZmSGlXK29ZcXFNVEdEMGprcm14cG0zdkd5dlZHbHZ1b2h4bm8xL0lp?=
 =?utf-8?B?Y1NtcUUrVUlBZzhRWTYrcWpoOFpjc2Q5Q01qQjZoOWRpZUduMGkvQ0dsSGsy?=
 =?utf-8?B?ampqV1JJSVp2VDdVbno1bmc1QXI3bmJPaXNoaEZuQW5sNzdBWVZ2OHl1cEVa?=
 =?utf-8?B?dW5hRnpWK3l4bm00d1p6VFNaU3RQWFBVOWFBS1cxSVZhRHg2WFdQT2pGQVRo?=
 =?utf-8?B?eGNYbGJPSXd2TUhWUWJqclJyaXh2S2U0RDVCUT09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 11:37:59.0440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fbe913-23ee-4788-e777-08ddb31391fb
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7460

On 18/06/2025 04:28, Matthew Maurer wrote:
> This series provides safe DebugFS bindings for Rust, with a sample
> driver using them.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>


Having this series applied on top of v6.16-rc1 and adapting a
proprietary driver exposing some simple u64 values via debugfs on ARM64
looks good.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks!

Dirk


> ---
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
> Matthew Maurer (5):
>       rust: debugfs: Bind DebugFS directory creation
>       rust: debugfs: Bind file creation for long-lived Display
>       rust: debugfs: Support arbitrary owned backing for File
>       rust: debugfs: Support format hooks
>       rust: samples: Add debugfs sample
> 
>  MAINTAINERS                         |   3 +
>  rust/bindings/bindings_helper.h     |   1 +
>  rust/kernel/debugfs.rs              | 218 ++++++++++++++++++++++++++++++++++++
>  rust/kernel/debugfs/display_file.rs | 115 +++++++++++++++++++
>  rust/kernel/debugfs/entry.rs        |  66 +++++++++++
>  rust/kernel/lib.rs                  |   1 +
>  samples/rust/Kconfig                |  11 ++
>  samples/rust/Makefile               |   1 +
>  samples/rust/rust_debugfs.rs        |  76 +++++++++++++
>  9 files changed, 492 insertions(+)
> ---
> base-commit: 6a7635cd013da3b41bf1e66bbdb9ae4a570d7449
> change-id: 20250428-debugfs-rust-3cd5c97eb7d1
> 
> Best regards,


-- 
======================================================================
Dirk Behme                      Robert Bosch Car Multimedia GmbH
                                CM/ESO2
Phone: +49 5121 49-3274         Dirk Behme
Fax:   +49 711 811 5053274      PO Box 77 77 77
mailto:dirk.behme@de.bosch.com  D-31132 Hildesheim - Germany

Bosch Group, Car Multimedia (CM)
             Engineering SW Operating Systems 2 (ESO2)

Robert Bosch Car Multimedia GmbH - Ein Unternehmen der Bosch Gruppe
Sitz: Hildesheim
Registergericht: Amtsgericht Hildesheim HRB 201334
Aufsichtsratsvorsitzender: Dr. Dirk Hoheisel
Geschäftsführung: Dr. Steffen Berns;
                  Dr. Sven Ost, Jörg Pollak, Dr. Walter Schirm
======================================================================

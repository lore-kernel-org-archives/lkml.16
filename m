Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012035.outbound.protection.outlook.com [52.101.71.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11D1271476;
	Tue,  1 Jul 2025 11:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370144; cv=fail; b=Zwx485ZQehnPUr2ZcFCpdZeVieFl1rGxEUQayxITq07h9cxAn7DIB1r7rrBwnciTLTrzdVu4ymNE595K7CHxkhRux3JPS6vk1UHC4kRaaeSj65ZXYGxr1a+Jt/0mLqxwalmWnKqdjXUaaIt7iBTBk+9GD6IQA9T4OMnYmFdd/g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370144; c=relaxed/simple;
	bh=dajwTr2yUNghQPnWH1daf2jHjxGbG0QcRKX/H2+9BWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q5wmfx1z0E9S9GIqgZp3miPrVqo22DaZsIND/t8TtNLgzSwovE5bHZtP8KHg5d3t2I3DaP61751GlYUu/Mo4j16dz3FLxSDBBMKO1o7EtmdJm1k9/f9h2STfwRa+71RDuqECRNuAOuxGKXXL3cWL0VodQUFfW6f/IT0lnEYeoz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=cpSFkqDj; arc=fail smtp.client-ip=52.101.71.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="cpSFkqDj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mvm3ubFRQaaSb8c4Z51WnhD8iMHvnwj4sk4SxIdr7q2GjdqfWhqFWf3nB14GJP/UNmzTbiZoR4Sw0rcL7duEMMtheASftsPqVT62qZp2Zq1XqyESzX4/fr1SgiRDVCqgxoIOmPIfDuWnDn9XU8dJezszbxpUPZev+UE1EJttGriceEXeRfvS18f9BOYIewAPvQIfQQr7YcWU11JU6PrNIkckJFw848BFEK2s11dBMbHJ2qGN1yHTSBN7B78Sv08B+M0jh79i6c0R0XhQ3VTlazbmgehvFc1M2Oq66TeG2TtbPaKul4ti6eRpXAkMk9VeEh3OkEatxPQUX509K20qrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUt1VKCy6nhskqZEmgRYiT67ubSYInB0siv9NoO6y2I=;
 b=bbF5e7+EGgokVHKKrNTT3MFnRGws/fhoG+XorcwyDqqabBHjsVR/mx7vpI/e01vcFv/QWwpMVsYXTHTWMheQ0C+AxV+vZbuwec34OIK17ZF6bQZZ9FpmvFQ7fxLl2h9OoWeO8h0JYxmdttqaLfaq+dgCg/phw+9ELiRQDUaucgUyVmK/Mn53MNKtWxn0IAHTReIl6GdI8BcdeaECTJciHX/afHI8fRgrREAOmpCqShpf1fSBYRHBlQYN6BMdZ39b5fwA4Q934vLkSNvAtnFz9EKaefp6VqPiTnxkCewhQ3dVgxKRjYKFD8Ccxs3jJxG5ORYW2fksdZC+PowpN6khAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 139.15.153.205) smtp.rcpttodomain=google.com smtp.mailfrom=de.bosch.com;
 dmarc=temperror action=none header.from=de.bosch.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUt1VKCy6nhskqZEmgRYiT67ubSYInB0siv9NoO6y2I=;
 b=cpSFkqDj/k6NBGK/wBBXL5CL/AFrIcMAE3xIF1NY+tXIFpgSVNP/dR30n0phnISsGcLBwhS4qWhM8Pv4k21kc1Vx+5TKpwc4OhJtXJE0x3tGCZL5p9EafS0mqsfqFJo9HMEsmLtXQ1MvpKcxPOJByDRHccLJhMLubX8qRX8jN6lho82D98NXVSS137vdFRtqJm9TPTnWqC9lh7xGbF3wWSb2YR/aWuOyAn0rm+5NjyDaaVQy4qGbgDWLwTaIsqp8FyIaFNJjH0YXWEm4IyJKUdHDNlhTJbUbIVmSMGxi+ua0/utfsejczj18E27hLbeggkze/K9mhzCgHwZ0OR6K6Q==
Received: from DU6P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::28)
 by VI0PR10MB8523.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:237::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 11:42:14 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::be) by DU6P191CA0017.outlook.office365.com
 (2603:10a6:10:540::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 11:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 139.15.153.205) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=de.bosch.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of de.bosch.com: DNS Timeout)
Received: from eop.bosch-org.com (139.15.153.205) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 11:42:13 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 1 Jul
 2025 13:41:55 +0200
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Tue, 1 Jul 2025 13:41:55 +0200
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 1 Jul
 2025 13:41:55 +0200
Message-ID: <b0d2a93e-4f23-4751-ab70-12c8357c46c6@de.bosch.com>
Date: Tue, 1 Jul 2025 13:41:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v8 3/6] rust: types: Support &'static and &'static mut
 ForeignOwnable
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
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-3-c6526e413d40@google.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250627-debugfs-rust-v8-3-c6526e413d40@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|VI0PR10MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: be7351b0-f0fa-4b33-2c17-08ddb8945240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|7053199007|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHZMeXY2QmYxVDZNWUVoZUM4bDZEZTVPVnNka3VRczY3NHV5RGI2VXRnS1d3?=
 =?utf-8?B?Yk1NRE5uUU5VejkrSlhteUxJMGZrRTI5QlZDOVY3T2tqTGVMUC9kYVRoYUgv?=
 =?utf-8?B?OTFkMzM1UWE0Wkl0ZkNoeDUxcU1sNVFva2ZtOFBnUnRxaS91U3lMbnN4bG9n?=
 =?utf-8?B?MmVGWWdnMkk0NmE2THZFQXVCc05oSDFlWlVPSUo4dGJvUEJIN1k5Qk5zOHpR?=
 =?utf-8?B?cEc2TlFWdlg0Mklsd3BqaVNrUlp2TzRoVEVtYnllVm1mNVc5WitzcWp4Y01F?=
 =?utf-8?B?N253ekhmM3VoZEdUbDJXdG8rZDZDdDNwSmtXSnpOT3NkaTRXdnRnS2RGb215?=
 =?utf-8?B?TjdPMDZSc2ozSTVpUlV4dTV2NWxWQ2hBaXk1Z3o3NS9DeDR6NU5LR01KM05V?=
 =?utf-8?B?VmEyQ1lyQUJ3Q2N0dUhnT2NlMzNHeGp6UHpSdkJXa3ZWN05BTlNQcGlvSHJN?=
 =?utf-8?B?ZjIvSlhJU3U0Z3RHVHRrUSt6endnM09meTZreisraWlGK2d1MmRSRXVrMmd3?=
 =?utf-8?B?SlN0TmdGeXlXZGFLcHNjNWwwRGZhalB3YW1ka0ZFdGk3YmtwUVlEZFo3VjJL?=
 =?utf-8?B?Wml1ZC90UVJQZmFsS3hXaFV0WnJoYUU5RXpLem5DRncyVXBnK3pWckt2Q1VH?=
 =?utf-8?B?KzlJbXFWM2drc1lnVXRvdjFoZ0cwSStLYldqVyt0N1RCenhSR2o5eGVXR1BS?=
 =?utf-8?B?Qm1Ta3VVUjFsTDNURVRjUkllaFJxTGkyWlRaOXNRdGwvbmVBNFJRN1NYWlUz?=
 =?utf-8?B?N2Q3bFQzbVRTaVFFQzBiM2RidjBvTCsrMGJKQjFvRUNWYk5La2dsS1FpNVly?=
 =?utf-8?B?YXh2Tk1OR0xLdlQxOUJaaml3TkI3ZytRZWVKaXErSk13akNqemNUek95cnpZ?=
 =?utf-8?B?L05YcTFhclFPRE9Jbk9mU0dSVG1seERjUDVieE1vVTZRc2w1U3oyZTdjbkc0?=
 =?utf-8?B?bzNMY011T2NkWUNXa1BJSzhhWEFVb2htbldIcU1PUHFPNTNxLzl4OFR3RkZL?=
 =?utf-8?B?UTlJbkNGa3NHYm44MVRzRTludDA0VFlOaFNxU2hFMFNmNWpUa1U4QXFHTXRo?=
 =?utf-8?B?RTlHaEJaT0NGMFQrZitXbkVhTHMxanFWN0g2RmVSNGFhamlxLzh4cVNwWGhl?=
 =?utf-8?B?a2MzTHJxb3g3aTBXVTBOWDNuUzhXK2RzNG96TEJaU2VEeGJJRHJZRXAxY0ho?=
 =?utf-8?B?MHpnMENwbWJPMjlCN0FJd0IvOHFBY2NPeWtSQVF1NHh2OEdyM0F3WS9YQTR1?=
 =?utf-8?B?Vi9Yd3Z6RkdqcmZNM2NxZlNhVjlGZzQrVVNKaVVPZEQveG02Rk8xRXN4bG95?=
 =?utf-8?B?WXhBN29HeVBxUE9KZTdDNVdUYlVDNnpmRC9sUFA1OFJoeDJ3TzVack1vSkI4?=
 =?utf-8?B?RmdpVm5RSFVwd1ZETWlVSENnM0NhbGpHbHF5NmdyaTVGZXpqZUxDalRzWWdN?=
 =?utf-8?B?WHlXbVhRd0tud1BCbjNoSFdnNVdQWkRvYnZtSDJWRXlLQVJqc25SaVFQRU5t?=
 =?utf-8?B?aTdYdUh4NlZEWkJ1ZjdjNUVscUE5blNvMXZhcFZDdDdKUndOYXZDMEFOSjNy?=
 =?utf-8?B?bmlDQ01YUDc3MkNKcWNPeFBXamtRdWVVYWVzaTd5aUxQaCt4cXljMG5xZ2g1?=
 =?utf-8?B?MG9BQTM4MU85SW1hVUE1bVA1Y2ZsaGFLVEZSKy9WRUo3WnVIcmlzOTR0U0JI?=
 =?utf-8?B?YUwwUDA1RExCeTE2VWN5YXRxci8zSTU5dW51UWJzR2xYd3ZiRXZoSWgwVTJR?=
 =?utf-8?B?cm9MOEFTeVRNM2tFT016M0pJNzUvYXhoYzJJQ0dOZVROWWlXQkxKSmNaL21o?=
 =?utf-8?B?T09hbERwMkp6NWc3dlR1TUtDQ2ZIeEZHMWtCQkNRc0VYSWNqb1NlamFpUEVN?=
 =?utf-8?B?VG9MdDdWbElTK1dxNmY2elJQbE5CaVlvVW1HQU5ha0FCTWJuRTdIaCtYNHJO?=
 =?utf-8?B?T2M4ZE5pTURBMWtYeDBJSU1QdmdVZVZkd0JWWUpvNVV5TXBMT243L0h2YjB6?=
 =?utf-8?B?UFRTT0hFbUZGNXBqbTJKZS9ZMm1laW13Slp2Q0E4TWxWS3BHdWFyb2hrUXgy?=
 =?utf-8?B?cE1VY0hIL2UzeDZVMXJIOXhjS3lCUjVVWXA3UT09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(7053199007)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 11:42:13.0058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7351b0-f0fa-4b33-2c17-08ddb8945240
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8523

On 28/06/2025 01:18, Matthew Maurer wrote:
> These types live forever and do not require cleanup, so they can
> serve as `ForeignOwnable`.
> 
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/types.rs | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..0a2b15cd05f91c69ef9c678555b845a23c19b82c 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -142,6 +142,64 @@ unsafe fn borrow<'a>(_: *mut Self::PointedTo) -> Self::Borrowed<'a> {}
>      unsafe fn borrow_mut<'a>(_: *mut Self::PointedTo) -> Self::BorrowedMut<'a> {}
>  }
>  
> +// SAFETY: The `into_foreign` function derives its pointer from a reference, so it is correctly
> +// aligned.
> +unsafe impl<T: 'static> ForeignOwnable for &'static T {
> +    type PointedTo = T;
> +    type Borrowed<'a> = &'a T;
> +    type BorrowedMut<'a> = &'a T;
> +
...
> +// SAFETY: The `into_foreign` function derives its pointer from a reference, so it is correctly
> +// aligned.
> +unsafe impl<T: 'static> ForeignOwnable for &'static mut T {
> +    type PointedTo = T;
> +    type Borrowed<'a> = &'a T;
> +    type BorrowedMut<'a> = &'a mut T;

Just fyi, depending on what hits mainline first, this patch series or

https://lore.kernel.org/rust-for-linux/20250626200054.243480-5-dakr@kernel.org/

the latter might need something like [1].

Dirk

[1]

diff --git a/rust/kernel/debugfs/display_file.rs
b/rust/kernel/debugfs/display_file.rs
index b38675a90e1b..9cea3bd633dc 100644
--- a/rust/kernel/debugfs/display_file.rs
+++ b/rust/kernel/debugfs/display_file.rs
@@ -102,6 +102,7 @@ pub(crate) struct BorrowedAdapter<'a, D:
ForeignOwnable, F> {
 // SAFETY: We delegate to D's implementation of `ForeignOwnable`, so
`into_foreign` produced aligned
 // pointers.
 unsafe impl<D: ForeignOwnable, F> ForeignOwnable for FormatAdapter<D, F> {
+    type Target = D;
     type PointedTo = D::PointedTo;
     type Borrowed<'a> = BorrowedAdapter<'a, D, F>;
     type BorrowedMut<'a> = Self::Borrowed<'a>;
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index ffbd750e1eda..c2d87e077c8f 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -149,6 +149,7 @@ unsafe fn borrow_mut<'a>(_: *mut Self::PointedTo) ->
Self::BorrowedMut<'a> {}
 // SAFETY: The `into_foreign` function derives its pointer from a
reference, so it is correctly
 // aligned.
 unsafe impl<T: 'static> ForeignOwnable for &'static T {
+    type Target = T;
     type PointedTo = T;
     type Borrowed<'a> = &'a T;
     type BorrowedMut<'a> = &'a T;
@@ -176,6 +177,7 @@ unsafe fn borrow_mut<'a>(foreign: *mut
Self::PointedTo) -> Self::BorrowedMut<'a>
 // SAFETY: The `into_foreign` function derives its pointer from a
reference, so it is correctly
 // aligned.
 unsafe impl<T: 'static> ForeignOwnable for &'static mut T {
+    type Target = T;
     type PointedTo = T;
     type Borrowed<'a> = &'a T;
     type BorrowedMut<'a> = &'a mut T;

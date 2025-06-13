Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48884409;
	Fri, 13 Jun 2025 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822385; cv=fail; b=Tg0MX0M5zKy1s9aKD9bvlfngnQc3CpiSD1qEbTC5HauDtVVlWuu1EL0ivyuMLBBxuRzu5nXW8HewLV3dLyyD2G5v5TNmNUMal9zb+amX2TO075a8kmDmlUNRqKK8UMJKYxj6RkHxHp9Dk+wdEZE6lDR8TyXTx5I4qkLHmu6hbLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822385; c=relaxed/simple;
	bh=BJJ8nWtMJrU7XHidYnupbwT0fLnLSfonJ4XTQYzBwQk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=jDGSXVOUnJLm+zAcaewnIpz8gKoPaYGwubguMwinrPSKPBQfS7Qo4VlAAcYzZ6u//mtxuOlJNe4bnnGD/kxfTUhjdrEOzrSkIWHjetvt2et0Vp3Woerbn5hREC8nhP1m0P/gbQMEgj4njZV/pwcWSym4837uMAfBhQTKd5DeNoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eneAJfyn; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eneAJfyn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGKsKAWtDHInbQGATxrD2bdO9qy0oGTTQouygzhPevdnRlIYlrQNPJ2Ke6ZP3vzVGvi9Qv7nYvetDXaA6ke/TXs/0uDgzo0aJjaC3RccBSCFxs7JbT7AloP3aKvWIS8p9FpKUulLG1wru617xx6P2WmjPUxdPruu9lFRGWbkqgKC3yCE/rGYuw4FL8pNJk9JRTSRNpIcDktZw70dGkJdC078LXJ7AvJff4C+kEzvpImAWwPbBtr7rJv4SqjEHPR0MRZ27HOOL7Kx+6nPq/yjcLJgqgtOkX9Q84qSnpWt3rDG/oSNR09n/213hf9hz92zJLTvB2+kbeVIbX2kHC11Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVm3QyF6Ojy9i14b1IUrheuKsKZqCtO5euFblzTW1R8=;
 b=U9qjKb6fi2a6UU2NBYzfi3C7sfrl9xjyCrXracH6B71lggW0io0cI52Gc+Fsok/aYYpR8jKgK4lrvGh8RH15IhN8dW0zDZegVvPaJnSR55Pe4z6xQXhHQ9ANpb17qdqHl0WCT9gpvciqobtpAc+0ydG/PrjhQhZujrTJeBfJLq5D2iMC/ongZmmeM1NDAMbens3tZBqi+TG9dxVGzfuk/rkKZEIFMT0+ap2D6yccOQxKpqDiQPdgX3X9SxEzT+FBGJtHc6Smmd9HF5O3xydxWkaDF9ayKtJtgUqqnJIMBGrszvoZTJcUMJCrZtmBzpy6wPkzw/GmjifnIueQ25zoKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVm3QyF6Ojy9i14b1IUrheuKsKZqCtO5euFblzTW1R8=;
 b=eneAJfynFhipxd4e4BkMKpqxPZZ1PIXAzvynkCczU+RPvblguB+ndaYhtYIM42qNyWVKVrOYc41407GBHHlicqIskn5QIWWfaRsvx7htZY54NRCVovKF4lWgwC87+WGtkP5O5CEeGs3Xzj6ScL54fWTPd0mM5nvQ4/U+6HhPFC8Kr1PSVBQNMn5Ak+/2/wCkjNCO7VDvla1m34IC1x/fKvHlJ5q7IcHkU85Fqgfi29kbhppXwBP/Ki1UiHUPhhPRsd92THdyX6IMv6+JSUQyg4hBVYZ85AoTpxW8dWmEklAkkvmxXgj1VybKWDHKWPXqjaNgBpdLIlYuXgW2qvRCzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7458.namprd12.prod.outlook.com (2603:10b6:a03:48d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 13:46:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 13:46:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/4] rust: a few common Borrow/BorrowMut implementations
Date: Fri, 13 Jun 2025 22:46:07 +0900
Message-Id: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ8rTGgC/13MSwrCMBSF4a2UOzaSRyvVkfuQInnc2As2KYlEp
 XTvxjpz+B843wIZE2GGU7NAwkKZYqghdw3YUYcbMnK1QXLZ8U4JZmJK8Xmlab5n1juPXnmLeFR
 QL3NCT6+Nuwy1R8qPmN6bXsR3/UEH/gcVwThDYTWaVvbOtOdQyJHe2zjBsK7rB1rtT4ypAAAA
X-Change-ID: 20250531-borrow_impls-8dfef3fcee93
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2526d0-adf8-41a4-3551-08ddaa80add4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVhlenNMVGZRN1JhUmc4SFQrK2tTek5xZnBZMmNtWXBwNEJxQ0ttN1Z5N1Av?=
 =?utf-8?B?ZDhUSkd1UzdnNmFUUTNVVU9MMkNKM1RUcmgrM2F4TmM1SGlqVWVSWEhaWWs3?=
 =?utf-8?B?V3RTWjZPNjY4aTdCSFR5Q0lOcmJLQU9KamgzcHJndVhHMWt6bXYrUGljdnQz?=
 =?utf-8?B?MlRUVVZVckNRa0JwVC9mUVoxYjJlSFJZbmZkdVhVdUNLUFk5WVFNeng2bHYw?=
 =?utf-8?B?MmtvZFZXcW1HU3dBcmdBTXJBbWhudjlXVHJFamppZG5makpTaUx6cHFna1I2?=
 =?utf-8?B?akJZM2IvRGUzemRVeUpJU21naVdOZmdtUjZLK3A2bmsxNmg1djhEWmpRUmI1?=
 =?utf-8?B?SUJnRHZ5U2lvTytsUGhhZ2FZUkY4YzVBQlJQa0d2U3VQbldSOVFJajk3VnQw?=
 =?utf-8?B?M05qOFJ0TkZ5aGc0U2xKSS94eDR3VlByT0YxUHJNRmVvYUFpVEdJbkxkam9s?=
 =?utf-8?B?NUZjbE9jOWpESW1pYUZlTDFlVldDT2ZrK2lyd1Vzd0YveUNaSHZWMHdzamwr?=
 =?utf-8?B?VEJyQnFyblNpOUo1cVc2MGtoQktsdkxiYjJkbndnNlF6MGUxaDZLRE9oRGlN?=
 =?utf-8?B?Sm9xemdiZjRjS2FZK0NrdmNSTm50cXFzdWNhc3hpYUlSVVQ5SzhyQWFxd2k4?=
 =?utf-8?B?djgvZ0RJeTh3cmY2cHR3Y0RURzErTlJCMEtESnVqVmVKclhRMGR2aUFMK1c4?=
 =?utf-8?B?bFZ2VWJreTNIb2k2ckZjajJ4K3o2Sm1WMXdSd0pFc0phNUcxNUQ0eUl3MVlo?=
 =?utf-8?B?MzZlRkhHaGpwQkRUSzhqSkhNVENjYWVJc1RxRGdLbFlaUkkwbjFSZW5OVC9R?=
 =?utf-8?B?OFVnVUxNUWhaWWlyWjNWSUg2ZHFMTmJhQVJISFh6YVo3MDQ1MVYzM0xwWkd5?=
 =?utf-8?B?MEJaeUJvQ3gwYldWdmNwWGtqYzdQMGl6SmRUdHlXQTFvRC9qam9kRk14dVY1?=
 =?utf-8?B?dEYrbjZyaEkyQWZ5UTd4SGNPZ1B1YTNPWG90M21FQTZNYmk0eUkzdGJGeVhN?=
 =?utf-8?B?YlJDVnlaYzVTbnJNV1BNMlhpMkR2aEdRZ2E0eEJjNy9NNDBjQzlpejRVVWlK?=
 =?utf-8?B?Q2NUWUNaTTdQMUYzUng3ZjRTNDlsV0x3aHZzTDVTUFZIOEhOenBNalowZVJ4?=
 =?utf-8?B?K0lYU0dYa2NORVVRNjZDaGdibWJBYXJ1WHhTQmgvdDlNa0dVcEc0c3QvaDB6?=
 =?utf-8?B?NXVHMnlWUFBvNUNzMXJ5a0lJMmZiRkdTL3RzY3lqTmVsa2NhNXVSRndjNHlK?=
 =?utf-8?B?Y0FXQnpYL2U4cnl4VHRYOU4vcGd6ZVBNdE02bFhYMytVQTNCay92R0d3aVFx?=
 =?utf-8?B?cHBsdDBnbndxZTAyc1BhdzF5RndwTk9DL3ppVDIrUnFXajhuc1VqZVlhZkpt?=
 =?utf-8?B?c0ZrandGRDZHcEJhMnJiMFRuVlZDcFJ4Wk8weFBZbDNkZnBRSDVWbGQ5TDlz?=
 =?utf-8?B?V1krQVFLd2g5ZmVYRUJCU3ZqdnRHSnluUVJvRXVmenlSMFpWb2dCRnFldWQz?=
 =?utf-8?B?YnhYYmthL2U0UFVoMUhLajd2NUQ2QVd4cjY2QzhLREtEamJVaVR0cXhmUzA0?=
 =?utf-8?B?a1ErVXRxa1oxUUVyTDFycFV6QWFsS0srZ3FHaWlsUG9pdlRycU9peUtaQkJ0?=
 =?utf-8?B?cDV1aU5NRmtCQ09pdkIxNmhTN2dOdUVoTGtVZ3ZHdnozZkZTTksrQjluK0JT?=
 =?utf-8?B?clI5b2I3NEQzcm1lQXluTFJYVndCUk1GdENiSElpTVJqVjBkbXpsSU9Zd3ZD?=
 =?utf-8?B?TnFySTlTN3Rjb0p6dm1hWEFYYmJGTDFTQmNndFFRajZNM1Ryb1RCWG5Qa254?=
 =?utf-8?B?VTllSWl5SlZXaWxrSWJETDFiZlpWN0J0VEg4ellaZ2Vua2t4VFc5Kzh4a3gv?=
 =?utf-8?B?YlZxMzFacWtFaWZDQWJndEVUYUlXU28raElUT1dCNTUvd0Z5dnptL2hWb3Q5?=
 =?utf-8?B?UXlGQzBJaXRuTXUxYWhnMkV4V3pEWkwxRVVGRS9YY0JhRks1UmdSQzN3SjVW?=
 =?utf-8?B?aXYxa21vdXJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1huQU4vODFYVmwwa3ZUalczUFY2RkNuQlVVWlZ2VEVUU1RkemtTL1RtSTQ4?=
 =?utf-8?B?Z0VRaHFNU1VqU3dVV3JaczY4cGlBV05MMjM3WVRXL1dtNTZkeFdnZm5EQkN5?=
 =?utf-8?B?WGFwYjJVNVZTVklwQmRJQmk3K0JqOXMvTWZzTkQzSW9EU1ZsYmJpbVlEZUF4?=
 =?utf-8?B?SmNjVzhQdXBla3I4NDNSak80L3hZUG1lSUNqOUJaVVVwdFRJdmhraHYxd0ZC?=
 =?utf-8?B?M1doMTB0aFlnNk5wY3BhNXJQUnBFV2RrUW9SU0I3NHU2SDd2dUc0NmJ6bG1Z?=
 =?utf-8?B?MjNLZUZGUXlmUjBSR1VsRWdyOGFNalI4d3llbXg3bXNMdnVGQ0JRZzAzZzVz?=
 =?utf-8?B?QitQY3hFLyticEMrUWZjVWVFTWdzcjNvcWdiVitVQXNQbDNxYUlzOFlzUGF6?=
 =?utf-8?B?TUtrSWtQY3F3KzZlU3RtMkdMZDB6bUJaKzFrd0VwRTZWcTJYVmcreG5hV3hG?=
 =?utf-8?B?NTN4eHh5UG5nYkhmbWl2YUs4R2tCeHZGTzVUWW9GZmNKeWhJTnRJT1IyS1ZQ?=
 =?utf-8?B?U09EV01lekZMd0NxVFhob2hZTjAzWGMzTk1hRWNxakZqNGsrS3M2dHQrdFho?=
 =?utf-8?B?R0J2TksvMjdaVkJXQXg3aHZhSnRRVmVRSDdoZ3NmTVFVTU9MODdScEhNdi9B?=
 =?utf-8?B?RDFCbUx6NXFIbTFZOFhGYUpVdzZRMjNtcFlEb1NobnllYmhLOEFzZkx2eFIw?=
 =?utf-8?B?dUhKdEFFOXA1NEJFd1dNQjU2SzFqU2svSmd2dzJtSzB5OFFPL1pUdFBDTVc1?=
 =?utf-8?B?MTBoOUxRbm45cWI3SG8ycGt2Yk1NWjdsZ3krVDVTQXFKL1RhVjZqQXAwTkNL?=
 =?utf-8?B?ekRScnJHNndmN2MyR1IxUW4wQjVPUm5vOU00MmlRMFFHOUFjM2hVcGRrZVc1?=
 =?utf-8?B?c3BMTnZRT3h4bjVEbWlDNVorU3VnYVVjNU1pbnhla1ZkQzNZWnZLUnZGWkNS?=
 =?utf-8?B?eWxuS3dUZjRrc0xnKy9YbldYdHZPZ3c0Uko1S1ZtdFliR1JKNEtDZDkyR1pR?=
 =?utf-8?B?V0VqYVlJQ1MxOW9jUDhiUHg3QTlzZHdSWVZvSlo4emZrbGMyalRSMlhvbVh0?=
 =?utf-8?B?MENXam1NZGZMdnIwWjE3eE0vaFIrMFM1TXFlUVhOTlFaWitPaGpJRytxcThV?=
 =?utf-8?B?WEI1WDhwRzRKdVBsTXVtVU9vTFZUN1VhN0NpaGtVQ3hTalQ2L0M5dmovOEg1?=
 =?utf-8?B?L0ZFZmFoL1l2VWFQbHplamwrN1lVdWRucFIzYTlKaTZ5bzlTeFF3YmVxcmRV?=
 =?utf-8?B?WmxwZDV6VWg2Tm5janYzNVpPVmpXOEZqTmxYenhLSHhyVDFialhrVHVKcU1K?=
 =?utf-8?B?WklOM0dVQnF2VTdpWWc1RFBkOEd1eG9naUFXRlpCSU45ek9tMnFqVlZVNGhW?=
 =?utf-8?B?dnJxMFhLYXB2Si8zQTlubjJxeGpwNEdsUUYyVnRoSW5POTE2RGIxU2xhQmYv?=
 =?utf-8?B?U25ISEJ4MmFNeHpPbUhOZ0d0akFpVW9IaHA0YktmQTR4RUlOYmtDL0RJS21S?=
 =?utf-8?B?L2EwMjczSE5uK0JoNVJPNHp6a2d6SE5PbGFnSmRqY0VjYXc2ZUFJQmpzTEFR?=
 =?utf-8?B?dS9wSUR5Vy9OZGQ2bGltRmZ6enlEbzdMZFIrYkhVbWxtR3JoQ2psNW5TcGJO?=
 =?utf-8?B?c0xpRWMwTStrR3lBL0pWRzZNVi9OVlFXZjhvMUNOei91QmdzVFlVYS9QNHNl?=
 =?utf-8?B?dG5IejRleW5CQXMvNEtWemk4dTA0dmNmK1VmMHFOTXpZNjNKcU00V3RKZWY4?=
 =?utf-8?B?NWdlbnRKUkFpYVFsV3pnR0hYaittaXcrZzY5V3pkRFFkbXZVektPZjVUbFJH?=
 =?utf-8?B?TGhaS2twYXcvV0Z0ZWF1K2EyalFmV2N3VERrTFVSaWgxQnk4bityZ2I5R3ZT?=
 =?utf-8?B?NXRXK0tIbW9oL0s3ZjZZNTN4S2VaaGcydGVwSjk3N3ViRjl6SWRoNzJuT1l0?=
 =?utf-8?B?TG0rNlJIdHMvUnNlQ1hmcEl6akZybHJKYnp3Q1dZd1hKNllYRkJaTDc1Ni9P?=
 =?utf-8?B?YjVMNFM5TzA1UjNiSVZGT1NHMHZrem5iLzhTaDhEdXArc3orN09aRkdNMFNa?=
 =?utf-8?B?QzAyK2M4TUlEeTFOdVhzT0ZnTk5XVWM0MHVHRm9vcUhIQTZCbGwxYTdvK1kz?=
 =?utf-8?B?QVBUY1N4aVAxbVZhMkhmaVpoTGgrdWhnNm0yNkpOd0Y5UkdvdzZBZ2Y1L2ZL?=
 =?utf-8?Q?aEUc5Y3lZBTwjYIj8reTzD9xkQWmIvjeCQmmLkgUNQ7d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2526d0-adf8-41a4-3551-08ddaa80add4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 13:46:20.8077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EipSqPHgu/kBEkv7H8xz8EdOzJR+GlE1Y/70tA45ZKzsDWOrBbJXG2aYra6Bp/kk/NmU57eThClrYM56GSXXWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7458

The Borrow trait has multiple uses, one of them being to store either an
owned value or a reference to it inside a generic container. This series
adds these implementations for `Box`, `Arc`, `Vec`, and `CString`. I
came across the need for this while experimenting with the scatterlist
abstraction series [1].

This second revision adds examples to each impl block as requested. I am
personally not quite convinced that they are needed, as they just
illustrate the basic usage of `Borrow`, but have added them to this
revision so we can decide whether we want them or not.

[1] https://lore.kernel.org/rust-for-linux/DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Rebase on top of v6.16-rc1.
- Improve commit messages. (thanks Benno!)
- Add examples on each impl block.
- Link to v1: https://lore.kernel.org/r/20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com

---
Alexandre Courbot (4):
      rust: alloc: implement `Borrow` and `BorrowMut` for `Vec`
      rust: sync: implement `Borrow` and `BorrowMut` for `Arc` types
      rust: alloc: implement `Borrow` and `BorrowMut` for `KBox`
      rust: str: implement `Borrow` and `BorrowMut` for `CString`

 rust/kernel/alloc/kbox.rs | 61 ++++++++++++++++++++++++++++++++++
 rust/kernel/alloc/kvec.rs | 57 ++++++++++++++++++++++++++++++++
 rust/kernel/str.rs        | 49 +++++++++++++++++++++++++++
 rust/kernel/sync/arc.rs   | 84 ++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 250 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250531-borrow_impls-8dfef3fcee93

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


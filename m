Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF93517A2F5;
	Sun,  6 Apr 2025 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743944373; cv=fail; b=TOwzc9r9vQkkn069kcbtQMUX9CuoPIVcrm3mI1ZQ78C0syHLHWdStQ0RQgy7z3NFJClkohBE2zzSXUvy4llzLrz/+xxGSfNtYfZe3GkT1jlIpjjCMH5/b+H7dlFRAllKVKjnOfOE85xq/mc1Oi+oz3p2W1QdzkgQZ/UCzDp1m0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743944373; c=relaxed/simple;
	bh=Pm3pGlifbk90W5+NS4JB8UvUCxDLoA9/Lr+8xkNJEdM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=CW19E0w2p3WkJxJfodCTAc7k0rzIFBSk1d0mMBUbQEXc1tLhZXW/SWLNDjCg3V+KwhQ3M0stwTxxY9+tTQdAwUrJT76YArgXNCim6vyJwVUNs1/+PArP0uX0K/i500BgRb6b1Yf4QyqbHbQi2eIujTQLjJQJa/ft/+1sOPiKV8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HRIGE45W; arc=fail smtp.client-ip=40.107.94.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HRIGE45W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjlXz8TTpOz9FZv1M3AcX9wETueK04xFuUPPa7t6AHiBiBTkOkHYAdkeRDkCO2NvZLN8YkkyrBSnEUg0Yhvvg/qSk84CqLo+bt4wBHTI1O0f3Nfw6aa7QhpPQdevOY8uMS4EMSVYOScjf1ReTIbqLgS8GAKkcZwSHAv06pXG2wT6CFNuRtlhP+tCzh+8uBhRMI5owf9WvXgfCL3ydjhDrkvY3woKE4l5IR6TF3xxqe7qfFUHcLxk6HDpWnbfufvbsOKbPZHshhEKjUFd1+rgrYtuH9fdUcMqe62zoRFpiq3TKMUf7P7glO+z7A82MNyTm3Ieb5S/trmF7f4unOtSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFCa2+XiANuAF/06/F/XatdJaa/3bF3TE4QzGjlKgUU=;
 b=m4oOVZtqx0u2C+Qi4UAfnHlvH9aXgGSOopf/BKFcixL8iQfDoGUcTIIZAIrITK/2hB8pKBqS3U43g4iy0kV9hlLXvy83GlD1iIciTfnuUTBssbbVYUQoQ6/fI5eSXG3KnHeQXEefeGw3BzCzUTHqaucKVO/lzlRcsvzxQ0bhr8FUE9cO8VlFMhugzU/UHapiw6v55++mI2R6zw+V4heB+/n5B+TgyYkraa62JN+DBqGu4SvpFd1RTPFtLofUgW7t45J39A09lDjY6KdXaFmB16sSeidRxArbSi2Pkrn3udRuhHhLP3Wcjy3Cv1ov6ZyyzhpKyzwX/x7zmbVnMQj0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFCa2+XiANuAF/06/F/XatdJaa/3bF3TE4QzGjlKgUU=;
 b=HRIGE45WGQ05iBSlDvHvrnsO9sIflWn261/Pxu7sNCipOqQ5Cjx7/u7N6QI/69+F8YCJCp4xe9v3f3behHFlolEO2u81I5jQP4uLld+SOKg3OOUahJS3ea09sTLkRNQIBLKA/SI9VwErxC1rwBa36/9PTi4QfUjZlFfuervR7H8krTDx5bFfYxs8h+ExNJ5ivlPnarABVkZtPhLMZL5NuBa/dVNJNLt1PukaePZQWJfm/CTR9OrGO1YXsLXIDT9Xb3MesQOyhNTZJl3E5DRi/H7mFJIeiimltFO4aCdC9hCmtUUGi+6qeTj7Fu9+gctKc1vu5Ksz4f0M68uI56/QXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 6 Apr
 2025 12:59:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8606.029; Sun, 6 Apr 2025
 12:59:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Apr 2025 21:59:19 +0900
Message-Id: <D8ZKOIHKPBCN.OIHEWU3TUE1W@nvidia.com>
Subject: Re: [PATCH v2] rust: alloc: implement `extend` for `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250405-vec_extend-v2-1-e4a85af43cb3@nvidia.com>
 <Z_GIELVB_HI_qeWX@boqun-archlinux>
In-Reply-To: <Z_GIELVB_HI_qeWX@boqun-archlinux>
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecdabc1-f850-4446-b903-08dd750ada9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3Fxa3NLK3o1QkJRUUR0UGdWaHFVTXgrSTRoNkRLZFlwOW4zbFFsWiswMnQ4?=
 =?utf-8?B?eGhqcjVnV09nQU5jQ1UxRVh6SGZaY01hTjJScE1rbzU2WE8rVW1zS0FFYTNX?=
 =?utf-8?B?UzY4a3owMWRjSmpOUkdSOUFGQlFHUnBrWG5sQldFMlJzbi9qekpKSFlRNTVq?=
 =?utf-8?B?UVdMWjFKRkhUb2RPbFFTMVZJT0NLMnQxRkVDUENxUlhrd1Q1b0tuQWRhZTNi?=
 =?utf-8?B?T3QxVXc3c3FLUXV1MFJRbUEyL2QxeG1vbFhOUFNuUGEyaEJ3QldaUUN4dW1t?=
 =?utf-8?B?eWZYakxBV2VCQ2ZJT2tCTml1VzZ2N3B2ZjkxQWptU2FvT2hEaHJuUEkrdTdD?=
 =?utf-8?B?RUt3cFdBQnJ2RXJGVzUwK2l3T0orWmlJQjVBbzhIZFN5SjhZSHplK0FMOEFG?=
 =?utf-8?B?eWlKMEwrclB4OGRZclBXcXZxdWd2RE8vZEwrZytvcFI3aXJ5R0l1TU9XNy82?=
 =?utf-8?B?YWRZU21MNVYrejNyNFh5aEhpM01YQmFxcGhob0ZJbWtzdXNNWWc3VjhuTHJ5?=
 =?utf-8?B?S2M5V1NKSWE5NzFWZTYzSHU4RkJTMzhIL3UvOUFLaElHRFZLM1FOK2hxbit1?=
 =?utf-8?B?NkdKV2NobUJFd3JIeGdRMjJEOTN2ZitKeDRQdzJ6N1NkQmR5b1pZSFQ3TGRa?=
 =?utf-8?B?eHd5WTFqQzdjc2JFUURVRkNiVkY0eXRlUm50TkpsbDZPOFBFeXRFTXhYOEdG?=
 =?utf-8?B?YTR3c0pFMHFDdGMwTEtrcXc0K1dVZExaQ1pMWEtTaDdFTkRHVUlzdlBxVURJ?=
 =?utf-8?B?VjZndEl5MGJyUEVEdlJXWVJROUNZczRTWklaQmFNVHpKeE44UCtyYnNucTJz?=
 =?utf-8?B?b2tKWkg0MU5pRmxFckhkdTVHcnU3T0VRMmlUdEQ0OHl2eHQ3NTVIR0UrRHZ5?=
 =?utf-8?B?a0tJYU5Vd3E4M1RndzFWbGNDWkxUTEZLbFl6aWRqeEpPUTRuYXFMamRLZFJj?=
 =?utf-8?B?MThwbElhamNMRGZGcmlUSnJyOXlGT09oREpYbkhmbGgreFRSRkFQOWo0QjFu?=
 =?utf-8?B?K2hjUmp5SGxGbytBYytQN2k2Z2dHMDVKck9NalJuMzN0M0FpdElONVdYQlJH?=
 =?utf-8?B?NlhMR2JURmJBUjBxb3JKS2t1dk1waDl5NjVWSjlrcjJVbHVMQlhOL01UVVd0?=
 =?utf-8?B?WHRid0xuTkVUdEdQUzBZODlOdkg0cDArbWUrb1RBMmhDbU9wOHZpSmx1bkpB?=
 =?utf-8?B?RTlTb3RkYjMvdG10TE4yTHFiQkFMWEpzYldyRWZKQjJFMG96WU50a1ZmWEVa?=
 =?utf-8?B?TkFaYm9HRHVpdTNJMHUyME5qUExpQnBKd0Vrak1GcHd5QmcyWWRxSy92amtJ?=
 =?utf-8?B?Y0JtYlc2SkF5bHhiZ1ZtRVdLZDJOdFMwS3VYcjJRNWdPLzUrMGcwaVgrMWxQ?=
 =?utf-8?B?RUc2N200U1NWVDlUbnVENjJVNTBzSlc0WjB3cHo0a1M1bHNnaGI4Wi9GdDQr?=
 =?utf-8?B?aHdIMGVKcyt6bmZTODNSSjc4Q1lOaWVtZXhPTkM4dlYrQllYalVxMmgvQy9w?=
 =?utf-8?B?TTdsbGJyZXB1aEdyTVQ3dmNOR0lUc2xzbTk5RVNndXRISmp1UUhhQWRRQVNM?=
 =?utf-8?B?Mk5DcHFHcDQ3S0x5QkI3THkzWDNMazl0L2VFMFBIVnNPZnkxNVpYUWVBZ0p5?=
 =?utf-8?B?UWVIMkF5eGt3dzZpOFVlem1BRU0zVU9rd1pPdFpkbjNheVBkSG03TDhqNkZR?=
 =?utf-8?B?TlVCQ1hzeS9Eakc1dGlBenRLVHk0Wm1oMGczR1I1RkZyZ0grbldpNkl2VWUr?=
 =?utf-8?B?eWxpdlJvYjJ1V0Fwb0lvV0tBMmwzWlZjVjdDZ3RQTXNkOWh6UlROYnErV0VW?=
 =?utf-8?B?aGpQSFhqVjlpUFUwSEFlNWtBUDVLdWM4NzZMRkR2dG5wYkNSeFJERHg1cUFE?=
 =?utf-8?Q?mr8fFkyfU8+iX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3EyU0xpNkVYV0hPcHY0RWdLM1B2YTh1SXQvOXo1TTNidzVKeThGTEJTM0FN?=
 =?utf-8?B?WkZmNXJZV2pnc3lEbmRpNWpFdDFNL3lZck1aaWlCNHJoa1M1VUl1ZXpKeC9u?=
 =?utf-8?B?WEo3azVjTzNNdENUM1B0b2xSZm9ZaE1Cek92bnBvUlBQaG9DOVVxVit3b2NZ?=
 =?utf-8?B?WmV0U0hhQ2VYcjBpSS90TEh2cmxJU2E2c0EvNFJtQWFTdExuR2hxYlZCSUtw?=
 =?utf-8?B?MVZBY1RTeVJXNEZocnA1eWdwekMzM2JoMGlMMFpqeU51NzF2UzN1eHNYN1FV?=
 =?utf-8?B?V3c1Uld2QmZzSkcyc0Rva2VNQmdtYXl5N0UrNXVyOXMySERpRTdxZVM2SHpw?=
 =?utf-8?B?NHZ3OVFzclVITnU5SnE0SXE4Q1Azb0NjUTBDOW10NjFJR1o3YS8yWDBHeFZO?=
 =?utf-8?B?bERhc3ZmQ0tSQVpBWDIxS3kyQ3BKcmhUOVVrWGJvMnZrSUZLUW9aWUhCUk5h?=
 =?utf-8?B?UnZ1ZFByNWR0TERwOFNFUDdGdjAwMUhNYm1oOTFVM0szLzJVaisxUmVyZjNT?=
 =?utf-8?B?cDAzSVFLQmFLTEdaSXZ2VHBOY3l5UVpNVENNNW9GVWl3UVBDb0N5MjQzckxY?=
 =?utf-8?B?RGU3S3hRTFV0bnVFRld3Z1dXQkJqdlczMGliOHZuWDNqTjNUb3FhR3JYa3Ra?=
 =?utf-8?B?YkI0eXcva3B0K3VDT1ZhTjArbWlxNFg2ZEFEdGxiUElWVEp3aFB0TnVzK3BL?=
 =?utf-8?B?alk2V2l6RDkyYUdyQlpOaHR6VDkwdzQ1TDZGc0lKaUtMM0VFOXFZbHFpdWFD?=
 =?utf-8?B?N1ZZcmpZUzkxMEtDeFc1Z1EvM2FESEhINnhjTWpyV0k5MkFRMUdzY21DZVZJ?=
 =?utf-8?B?K1dHNjFWcGV4c3VVM0NGUnI1d0tYRWVlMGdzQkdmV21kRDBJU3hOYmZycW1z?=
 =?utf-8?B?TDdWWmZENUpFdWpEYmlqTncyVm1aWHZBcW00bThLZU9YdzYwN2pMb0IxeUk2?=
 =?utf-8?B?OTBPZFJzbkdBWDh4eUg5ZENWS3ZtcnZjZUh0dWlwWkVTZDl3OW5hSVlReWNi?=
 =?utf-8?B?ZnhTeHZ4N3poQ0lLd1ZsRjJOb1YrMjR4MFRGR2oxakdMUEhjc2xTaEZMck5X?=
 =?utf-8?B?L3hBNXBZbVlSVGtyakhJTTRnVFp4emZid2k4QTltRHZHbTNoS29veERuckh2?=
 =?utf-8?B?NVNzdWVYU0Y2Zzh1YmhNWTJvN0hBVkc3bkIwa1YwVmE2RmlLcWdkM2NkcHdp?=
 =?utf-8?B?eDVhbGI4TCtOWHo5MU9Ub2hGZkkvMnlzcUlOSzZJOWwvT0hvWGt2SW1ZSS9R?=
 =?utf-8?B?d2F4ZHY3QiszY21zWElaYlRDWnMxRFcxNktlQTlLNDhMS2NXLytSa0hFVTdk?=
 =?utf-8?B?QVNQQVJES1VVTm9ZcHY2TXdPNWZESFRER1AwRElxS0lOb3JYVHZmQVI5TEZi?=
 =?utf-8?B?WGFQQUljdjhYS0lqRlkzMmlCWitFaUQ4Z0xENSs1ekRTcnU0bngxazh4KzRl?=
 =?utf-8?B?VmxOb0VrVzdYMWJvR3BpbTNkQ3pBdGZxaEN6NzRNeXN6VWFobk1VekJqZHB1?=
 =?utf-8?B?b3A3cWJFTXVYZUVsbHEyei9kT2pxekpMeHJheDMrZHdvRDhrd29uTEpHazhG?=
 =?utf-8?B?SDZvWXZhWlNiN1ppakJyTWdxZDBQeTRWcS9UaVREZ2Jzd3lZeUhDMnk1TGo3?=
 =?utf-8?B?c1loU1lkZkw4ZTVJeituODRIclRyQnVRWGZxWjhlUi8xVTJ3U3BHSzcxcExn?=
 =?utf-8?B?M1pod0JSb1I5S1dvVlBFNnQzK2tFQzhiMHRuK2x2dStPNXdiSEVqNmVaUWs0?=
 =?utf-8?B?aVpUNG0zNjRlRFNiL0NyRjArYi9sa3hvaDdWVTZ4T2o0WWEzSjJhRGEwSFFo?=
 =?utf-8?B?L085cmg4bnU1U0NxVmpnYnowNnFZZEQwMEZTbUlGd2F2ZjFYdko1UkRQZ0Q4?=
 =?utf-8?B?TXNUNCtCMkZsUTBNU2xCcHBTTTRFUUx4N1diZUlsRmh0M1ltTkVGdkhTN3VZ?=
 =?utf-8?B?eHVRN21FUDJheW5CdnU0NmVrbkVGcm1KdHdyZ3cwa1JndUhMWjlSVkl2K0RG?=
 =?utf-8?B?V2hqQjJZZG5IUmZSOUxIZ3Q1eEk2OElnUHNRRUY3M2cwc0ZVSldrVGFWSkFI?=
 =?utf-8?B?WDZRNStXU01yRW8vclVobGwySWZLR2xibzUxOEtZK0d2eXh1bGJMbGNPS2RK?=
 =?utf-8?B?b0RwYnphRWZyWUhyeDJnaFc2TWlkejRsbmE0V2c2dFl0b1BYa3lLK2RPRWh5?=
 =?utf-8?Q?HqpgkhgA8S+IHREcqjhiNs2hjy9g+tJiT2UQxHY9laam?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecdabc1-f850-4446-b903-08dd750ada9a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 12:59:23.7740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdFLYkMIJDySgQSKuIT3zscpUN+oKIvXR75FzYbSm6k4+Wgz2VBlSMgNp2vN1rs3FdnuxaWnPW96u+JJxYNdYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087

Hi Boqun, thanks for the review!

On Sun Apr 6, 2025 at 4:44 AM JST, Boqun Feng wrote:
> Hi Alexandre,
>
> Thanks for the patch.
>
> On Sat, Apr 05, 2025 at 10:51:41PM +0900, Alexandre Courbot wrote:
>> KVec currently has `extend_with` and `extend_from_slice` methods, but no
>> way extend a vector from a regular iterator as provided by the `Extend`
>> trait.
>>=20
>> Due to the need to provide the GFP flags, `Extend` cannot be implemented
>> directly, so simply define a homonymous method that takes an extra
>> `flags` argument.
>>=20
>> The aforementioned `extend_with` and `extend_from_slice` can then be
>> reimplemented as direct invocations of this new method - maybe they can
>> eventually be removed.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> I was a bit surprised to find no equivalent of the `Extend` trait for
>> KVec, and while I anticipate to be told the reason for this, I also
>> didn't hit any hard wall trying to come with my own implementation so
>> here it is.
>>=20
>> I expect the new `extend_with` and `extend_from_slice` to be optimized
>> into something close to their previous implementations, but am not sure
>> how I can simply verify that this is the case - any hint would be
>> appreciated!
>> ---
>> Changes in v2:
>> - Changed the diff algorithm to histogram for a more readable patch.
>> ---
>>  rust/kernel/alloc/kvec.rs | 89 +++++++++++++++++++++++++++++-----------=
-------
>>  1 file changed, 56 insertions(+), 33 deletions(-)
>>=20
>> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>> index ae9d072741cedbb34bed0be0c20cc75472aa53be..e78cb5ee575ce01e44283f8b=
4905689fb1e96165 100644
>> --- a/rust/kernel/alloc/kvec.rs
>> +++ b/rust/kernel/alloc/kvec.rs
>> @@ -454,30 +454,64 @@ pub fn reserve(&mut self, additional: usize, flags=
: Flags) -> Result<(), AllocEr
>>      }
>>  }
>> =20
>> +impl<T, A: Allocator> Vec<T, A> {
>> +    /// Extends the vector by the elements of `iter`.
>> +    ///
>> +    /// This uses [`Iterator::size_hint`] to optimize reallocation of m=
emory, but will work even
>> +    /// with imprecise implementations - albeit with potentially more m=
emory reallocations.
>> +    ///
>> +    /// In the kernel most iterators are expected to have a precise `si=
ze_hint` implementation, so
>> +    /// this should nicely optimize out in most cases.
>> +    pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), Al=
locError>
>> +    where
>> +        I: IntoIterator<Item =3D T>,
>> +    {
>> +        let mut iter =3D iter.into_iter();
>> +
>> +        loop {
>> +            let low_bound =3D match iter.size_hint() {
>> +                // No more items expected, we can return.
>> +                (0, Some(0)) =3D> break,
>> +                // Possibly more items but not certain, tentatively add=
 one.
>> +                (0, _) =3D> 1,
>> +                // More items pending, reserve space for the lower boun=
d.
>> +                (low_bound, _) =3D> low_bound,
>> +            };
>> +
>> +            self.reserve(low_bound, flags)?;
>> +
>
> I want to point out this might cause a behavior change, previously
> extend_with() and extend_with_slice() do a "all-or-nothing" extension
> depending on memory allocation, i.e. if there is enough memory for all
> the new items, do the extension, otherwise do nothing. Your changes here
> make it that extension can fail in-between due to AllocError, that is,
> only part of the `iter` is added. Of course, in practice, both
> slice::Iter and iter::Take will just return the number of all the items
> as the low_bound of .size_hint(), but it's not guaranteed.

That's a very valid point, and one of the reasons why I would like to
see how the code is actually optimized in `extend_with` and
`extend_with_slice`. While the method is designed to handle
imprecise/incorrect implementations of `size_hint`, the expectation is
that outside of very unusual uses the code should be able to be
optimized into a single-allocation, non-loop pass.

We could probably enforce that if we had access to `TrustedLen` or
defined our own equivalent trait for the kernel. The set of iterators
that could be passed as arguments would be more limited, but for the
same reason as above I don't think that would be a big limitation.

> I don't see a direct correct-or-wrong answer for what behavior is
> desired, but if we are moving to a new behavior, we need to make sure
> updating the document of the extend*() function. Plus if failing
> in-between, should we return the `iter` so that users can continue do
> something about the `iter`?

I have updated the documentation with more details about the sub-optimal
and error cases. I am not sure what use a caller would have from the
remaining items - and after all, the currently existing methods also
don't return the iterator upon failure. If we want to preserve the
current behavior, we can always reduce the size of the vector to its
pre-call value on the error path.

>
>> +            // Number of items we effectively added.
>> +            let added_items =3D self
>> +                .spare_capacity_mut()
>> +                .into_iter()
>> +                // Take a mutable reference to the iterator so we can r=
euse it in the next
>> +                // iteration of the loop if needed.
>> +                .zip(&mut iter)
>> +                .fold(0, |count, (dst, src)| {
>> +                    dst.write(src);
>> +
>> +                    count + 1
>> +                });
>> +
>> +            // SAFETY:
>> +            // - `self.len() + added_items <=3D self.capacity()` due to=
 the call to `reserve` above,
>> +            // - items `[self.len()..self.len() + added_items - 1]` are=
 initialized.
>> +            unsafe { self.set_len(self.len() + added_items) };
>> +
>> +            // `size_hint` was incorrect and our iterator ended before =
its advertized low bound.
>> +            if added_items < low_bound {
>> +                break;
>> +            }
>> +        }
>> +
>> +        Ok(())
>> +    }
>> +}
>> +
>>  impl<T: Clone, A: Allocator> Vec<T, A> {
>>      /// Extend the vector by `n` clones of `value`.
>>      pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> =
Result<(), AllocError> {
>> -        if n =3D=3D 0 {
>> -            return Ok(());
>> -        }
>> -
>> -        self.reserve(n, flags)?;
>> -
>> -        let spare =3D self.spare_capacity_mut();
>> -
>> -        for item in spare.iter_mut().take(n - 1) {
>> -            item.write(value.clone());
>> -        }
>> -
>> -        // We can write the last element directly without cloning needl=
essly.
>> -        spare[n - 1].write(value);
>> -
>> -        // SAFETY:
>> -        // - `self.len() + n < self.capacity()` due to the call to rese=
rve above,
>> -        // - the loop and the line above initialized the next `n` eleme=
nts.
>> -        unsafe { self.set_len(self.len() + n) };
>> -
>> -        Ok(())
>> +        self.extend(core::iter::repeat(value).take(n), flags)
>
> Would this actually call T::clone() n times instead of n - 1 times?

Indeed - we probably want to use core::iter::repeat_n() here to mimic
the original behavior.

Cheers,
Alex.


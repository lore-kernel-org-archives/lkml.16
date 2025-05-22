Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A26221729;
	Thu, 22 May 2025 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902219; cv=fail; b=N4LJ9ES/kJNuC4nS0GAZ/hwUrkrAsWidcbmSlkPQPZKXxLGJk/C3lBLmiBcPQCqrjIxu73xSYObwgz/5iYKYntqtawDrbDQdPc82FfoOjSU08QyFcz8Kytf98kdFdJEJHEdPHg0rlQi/5UiiiK/NKnL09CK4nVQmBqvOSQYva2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902219; c=relaxed/simple;
	bh=OIIm17YdvcbvMvTFjOkVFjXI5pnVGFQ6/QLoQ1Kd+pw=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=oU/NxjSc28Mz5fy2cYH4f76hlV2KmxMDqeu44Vl0HkwtlJw8K5ipGsFh61/I2hzy6pL2/BDMtb8dpqoBTxO80AS9A4JuhbDzsT3ciRdy7rYMHOw4eU41TjLX2F7c0NW0ElPXVV3FYEGw07iiqOgXnLnWG5ZXFsKee19hem56tQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U6c5S6RW; arc=fail smtp.client-ip=40.107.243.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U6c5S6RW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jd+NrQXO+CJOKIOloFwAF0paFl4K6p+Hb6QkRghl6mX6TzvB75Z03dEY0wg0t/Ji300/XGl/J5dCkqDQ5OQdndSeFt3+IzqBvkh5m73P+MWEyp+WUs5LkKBNv9Cf/nUztNNAk1ESW1YQww3WYCjMxwxX1x+Ym0us8W69qZS5yGWrZd70mzQIrKo/LuxNtaQP+WUDCi5MVDGbGKDMnG82DzPZFKl4xNHSbdvNX6gjlWHHiglskUIgrhqea4OwGP7VTYGs47qrx4QvO7InQMp08W9wUzcX31jR9xioC3m154bxUK0vbidVTXnho2zJDKTj452O/D+L8il/k8/JMTAwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwQyqGFQ2LW/TBlYSacU5pnirjWszUW2z7hn/ymVY2E=;
 b=rBU6uCTd9or/10WSc4RKc3gl/7w2JWD1eW1h92aSX7etMgdxpaKTZ9+foAey+WfZ6MgYxTb239hqyCaeu6Rv2I2LTxZgG4MviAMcVafyhKF4uuGuzlCPH9mqL/+OzESzkQ9eLF6kaGOTnLqMLopgUzI6elGVHLsTxwvGtbL6Qp3nHn6PkrIJ2pYbv/gU998gGgyrqly92zULDMslL0ULStbUbzuDvEz+fSYwq71VE+W5pBSULl5uTLEQSrR8n86ixPFgzVR5gMEi1fxaH/jpM5TdSeLX2jM0kRiggMb4/RlV2k4WCUU9ea3k0FkPR2ySL7q+W4SiB2OwWMRbaU5/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwQyqGFQ2LW/TBlYSacU5pnirjWszUW2z7hn/ymVY2E=;
 b=U6c5S6RWs85oWlUwqZkSrJM83QKg/3+BXdSUYZRYJ6j7xDlvtS0kP7jyAOf1TUip16di2eR/oFSEnAElaMvnU9FvxhL8f0pCNoTwt6jV2DdqFSRGpaH5TdZZmj5PP8ovDrWKhyYb/H8B8KIVf84X3GbiWR1oROroIaejX65ihG8sVL9qS3d3wVheNvxUqPlwqQ6DaqNonDbTXCyLTVToza/jEAicdxd00lj9BqohTJHK3hKFna5lRiRGckVHPpQxTdjst1IATJyNmWbZdWL1iBfaj9TROWFPQ5ATqKpUlcGUJzQaxhxO1xBEJmsD/8vMeZhmTZu1wevZOqDN6oYOaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6750.namprd12.prod.outlook.com (2603:10b6:806:257::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 22 May
 2025 08:23:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 08:23:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 17:23:31 +0900
Message-Id: <DA2JMEL971SA.3J61636AYG6E9@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Fiona Behrens" <me@kloenk.dev>
Subject: Re: [PATCH v5] rust: kernel: add support for bits/genmask macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com> <DA2D41UHSQTB.2P6FHWB6TBVO7@nvidia.com> <CANiq72ny+uSZ8wNyqozTUNma1tKfS4du0yd4+nTjioYmyw25CQ@mail.gmail.com>
In-Reply-To: <CANiq72ny+uSZ8wNyqozTUNma1tKfS4du0yd4+nTjioYmyw25CQ@mail.gmail.com>
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 4755ce83-7ac4-40cf-45a2-08dd9909f14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWlvR3hlVnJaRUI4dG02OU5mTEdFcFpLVEM5VEQ4UFZPSFhJN2ovTkZCVHNV?=
 =?utf-8?B?NUxYN2VHc0dSeDZjSXlxNS9OcjVKelp1Yk90MnppR3ZRZ2g1N1JyK1pGdGRp?=
 =?utf-8?B?OTBkenV2Yy9OKzgxUGlES2dCeklXWDhUYUZML0tsN3pyNGx4REhzcjdhbVFi?=
 =?utf-8?B?L09SRitJUWNBWld0d1JPR3U3VlVwSlFoS1VpdUZvMHNXVCtRWVdEL0dQVVpu?=
 =?utf-8?B?VWVsN3hhWXZlTXJEcmR1ZUFJTzI0ZTlCekZBNnRhQitOV3c2Zm53YVdoSVp0?=
 =?utf-8?B?N3B0b0JJWTMydERsRFk2V2dDSzVVNklsZjFNRjg3T1J2R1hMM0FoUEhhUG1m?=
 =?utf-8?B?M2RzRHJPSFM4Z3dPeGJmanZ0Z2VuYnowS0ZYVjloejF1VmVXMEdtQjYvVnMx?=
 =?utf-8?B?dmExSDJVbjNOWmFtSFJLQ28rQ0NLM1o0S0NsY0VjZmhBSVllbFFseEhuaDlT?=
 =?utf-8?B?RmtKS0lUdjREWjFuaWdqTTZCUGF1S0hmSGUwSTJySTN6ZmhoWmtZZ2MwQlRM?=
 =?utf-8?B?eGJZcmVuOXpQT2VjUnVqbmczQ0UxRjB6MGQ0cUF0bjFjVUd3TSszTHJNZkFn?=
 =?utf-8?B?V0NqTmN0REhJQmRaN2NPeGRSMDRjMjJQS042ZVJBMWZ4UEQ3RWNvR2g1NDkx?=
 =?utf-8?B?RUZnVGhGZTBZd3gxcm1aMFRqaTlNVVA3RUxhU2t6ZFJCVGlHazU5UUpEaTZK?=
 =?utf-8?B?VDlhek9hb2Vvcmh5Q3RxYkRuYVk0U3RvTzdrbzJ2Y0dKSHNHZDN2MnJQVytt?=
 =?utf-8?B?bThkSzJKelhzVFZHWnVhZ20xd3FWSm5Qc2pGbDQwZlo1dWRCVHUvclNhcHdn?=
 =?utf-8?B?OTlXVlZJNmMyeHpRVjBHeDh1RmIzQk5XaHhNYjJiU1RuNElCNnlzajZCNzdR?=
 =?utf-8?B?aC9Dekc3S29LZm5GYzBPVUZ2ZUMxQmJKc2VxMWorbUxPT0lxdXFVQVJqVlVs?=
 =?utf-8?B?UWQ1NVVFUGgvWHJ6cmJXU0U1WDkvUnBMTVRjN2pwZkVIKzhlMCtUQVQ5amcz?=
 =?utf-8?B?c05zQk5DUmVpTXpZazJoMmxkb3V6MWRVNDVkVjVUZjhWcWVlYytLdVRHanB4?=
 =?utf-8?B?Nk1pNUNVTHplZURsZUdFVnJsTE8vclJKVHpKZmdiTGozMG9UQXhzeXEzbVhu?=
 =?utf-8?B?ZUdDNGF1SGFGUzlzYjVMcFBNU1l2YjZKMU5tbUJON2UwK1BtOXViNjN4aVow?=
 =?utf-8?B?NG1wbUpFRXB6dXJXZlJ3QzVLanVtM3RUbThPeUdxTVRkYVhTa1JMRGtMTXlO?=
 =?utf-8?B?bW9YYzlOMVEzalplYjNUUlhFeVhjaHJPVVovdEdac3RqMzlFMytZNjVEajQ2?=
 =?utf-8?B?dmZDVXUwRzFhdUowaHFRa0VKZDZkbGRIMnArZHppTjZVeWpVQlpQSUhjd2tU?=
 =?utf-8?B?amliWXZibVlBeThYcTR5QUV6dTlWSGhSczFYSmplR1J2WEJpOE9tb2RQWThR?=
 =?utf-8?B?b1BsRzhJOEN6aFdjaFZlV2lkTjhCcG5sck55TU5Mc3o4bjlibUMxZXNFUml6?=
 =?utf-8?B?VkZwUjJuUTAvbWkxT3Bqc3g1cDJ3dnh1dkhES25ucjMrVTh6bzN0M3hDZmlC?=
 =?utf-8?B?b2F1aWtWcGhWOHZpZWlRWm01d3laYStxZ3B4aXVhK21teUczTkhybm1CM3ht?=
 =?utf-8?B?cGF6ZTIzcFAxUWlkeFAyRi9VZnk0dWFSaDEvYTJrUUZCZ3lsUm84VzREWmNL?=
 =?utf-8?B?RS9BdGNNMUNOWm45Y2JBNktHd2hTcGYrQlBCVFRGb295cDV6dTAweTZUd3ZM?=
 =?utf-8?B?M2dPc3RpTW51NVF5NTVBRFQ1TG9JUm9ybXB5azZXR1VvcUJQRzloaWk3MkNW?=
 =?utf-8?B?RUJCZ3hHYmNBWXIxdEh4VFMyRDdOcHdxdS9OYUxidVEwdXJKY1hLL0pid0Zm?=
 =?utf-8?B?WVRwYytEK2haUktKdjRwano2bml3ZGkzandYdHJiQXVkSFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wkx5RThScndDSy9pbU56WXJQOUJybWFlUStDOHg0ckJrNGFINTVyNjNHOXlk?=
 =?utf-8?B?NnVGdG9TNXdNQmZFcGJaZ3dIVTdJVzljK2FBemNUd1lTMyt3ZVB0OXJrRW1K?=
 =?utf-8?B?VE9wQmFoYWFOSnJNZmJxZGViVXFLNFFnRFBCK1ZlWC81bHdJSmFXc0RNNDl2?=
 =?utf-8?B?QlNNSS9sendMTjJxbkF3c2ZJOStHcFFWY2pObVJpWW1oWlE4WENRejY3bjdo?=
 =?utf-8?B?ZzNhL0dqbjNzTlExbkp2TGdBLzR3U1ZMYlgycVRIYlJ6YnZtbEdrUkhSQ2Uw?=
 =?utf-8?B?VkJQZTgxbjQwNDdOTnNJTlZ5bTBndklPQzBWZ3NRUHZuSnplbUxNMDNjV1kw?=
 =?utf-8?B?bThTSW5MRlNVV01VTk9NUTExZ0w2alh5M2xBUlNkYm9aMDVUdEUrTDd5Qnoz?=
 =?utf-8?B?bWhvWnZQeVQzc3R6Z2lFRldrWEU4TnZUVldRcUhYQlhPWkVQLzZUM0dCWUFW?=
 =?utf-8?B?REhROUduampra3lwLzR5Nm1HYWg3NjlXbkpzMFlqbmhmSnlTb0piL2d0ek85?=
 =?utf-8?B?SXhqWWFpRjBQTTJ4RS8vMCt6TWd3amRieGQ4aUJQa2J4cUQ4NEdmeWpSUTg0?=
 =?utf-8?B?Qk8xM0N3OHduMWdwTWEzNnJ2bFB4NzhQSFRtUmxQR2k1V0cyZHdmMEp5ZmNS?=
 =?utf-8?B?OGdCUlVWVTJhVGRkUFI1VGJZK2R0cGJlZGNiSERLSElBMVF2Nk5iOUFpZXoy?=
 =?utf-8?B?d2d6TkRMUGl6MHJ5Rk5nQnhrNDMvM242amdMUFZuemxFTXh4a1VTdnFDaUIr?=
 =?utf-8?B?YllyYWk0bkdKSWk3ZGZ6YWVzU2kvWkUrTlJPTVdDM2Faa2ZHMjVueHpHbFJH?=
 =?utf-8?B?a0Y4WndjTnlNcmUyOXRmbnEvUkx6eWx2aWhuUHFFSXZFNlRKQkhkU0doY3g4?=
 =?utf-8?B?UStQVVhlejMxNEhxRDNXZUVhNjk5azJQcHVOQ0tLeC8zK2h4Yjk3S1JBZk12?=
 =?utf-8?B?SmUxSUhMVEp3VUJLZUREYm95b2FUZHgzL1h3d09iVG9tZWJNSFZ6aEJqMEFj?=
 =?utf-8?B?alo2eWtuc0FOcGxiRk5xUi9WK2YzR1U3SzlsRDc1eTdzSjlUWFZLQTJnOG8w?=
 =?utf-8?B?OWNEVjl5UEFsTkEydC9XN2d1Y3c2aFdmTXBENDAzM1ZvMzZaRGJtenl0UEl0?=
 =?utf-8?B?b085NXBhK3FraHBmVlNlMlhhWWZ5S28yMXF2NHlIVXBCWThhUDVCNlJ1YUpE?=
 =?utf-8?B?OUVzby9Wdkdhay9PU0xzdlZmSlRmekduNkFTQXpqb1RtbE5BWnFJSkI2aTU4?=
 =?utf-8?B?SFpTWFB0RU9DaG9idFdVQjl3MXVQSGsxUXUrUW0vRStWWEl5ODEvbE13YTBX?=
 =?utf-8?B?RmR2VnVjWlFheXRLcy9KUEZGcW9FZEswSXlGZllkMi8vRWorUUNTYWpHZ1px?=
 =?utf-8?B?NE1ZbUZTekZoVS9BTTRuZDFCTHJmMU4rVW1wOUlTaVRNbExWWlM0S2l5ckgy?=
 =?utf-8?B?YVJWNVh6R0Z3TnBZTk1jMFpzNUhKSU1aU3M0YjdRUkhmU1ZUa2F4MWZyZXlE?=
 =?utf-8?B?b3BrR0VkV1F6SkczKzcxN0R0akt6dEhvOVQ2RTBXS0JpRmNaSHRSSjVxZG50?=
 =?utf-8?B?VW1RbDBacUYzUEdZbWFQOThtSjNoOHdGVnNaVHJSV21HektzRE9KWTJFU1NN?=
 =?utf-8?B?eHZyQkpwZE14RGdzcmFTNXJNeDBrWENCellhQmgyS2dXMFNYM2MzSXorT2Q1?=
 =?utf-8?B?RkViNU5mNVFHRm1tUmZBdHJPSEMrOU1tbW5oL3o5VDN2Tm5FV1h3OEtmeW5t?=
 =?utf-8?B?TlBpN2Ricld6ei9tV1p4M01KUWc4V2tRdHVBNVliYmJlNDdqdmtZNmR6a3h3?=
 =?utf-8?B?NG9RalZQMCtQRmpyQ1F5dUdLZENkaktSSDBvR1N6K0Rwd0hNME5TNUEwcGU0?=
 =?utf-8?B?cXFOTERZYVpwR1VSenhWdGR4VTUyWGxDM2ZVQVhxcUFyRkU1WWoyRkE1WVJo?=
 =?utf-8?B?bXBVaFZ3RlpzZ1pCYU55Uk9DaW9WRysxUkFBTXFFcHBjRFU1cEJWa1d5Q3VG?=
 =?utf-8?B?MHkwbjRCekYwVDFONEVxZ1BTeFZ1VXhIWVhZYzJ6Sm00alQzUkZza0pEcGk3?=
 =?utf-8?B?SEpFUVJJMUE1eFpYYnF4UzBjUnpyeTM3Sk9wQ3ZoZlhmSHdqdWNvVWo3dDdC?=
 =?utf-8?B?blZTWEJqbHZSei9ZNS9SZ0RNNXY2Sng2MG02VzZlMzdhZk1aK0l0dVpSK3Jo?=
 =?utf-8?Q?iC6LmU3HF6r3YBZddPBAjKtB4rF2JLC8YA+lJLs7dawy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4755ce83-7ac4-40cf-45a2-08dd9909f14a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:23:34.1612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ae+W0yUQPzC8V1V10/+o7gOWle+KBbVniT9fhja3IaGfgnFMV/zL6RvPr/RMtuT8hIoCq5EXm8Es/l3lKQuSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6750

On Thu May 22, 2025 at 5:21 PM JST, Miguel Ojeda wrote:
> On Thu, May 22, 2025 at 5:17=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>>                 // Compile-time error if `n` is out of bounds.
>>                 pub const fn bit_u32(n: u32) -> u32 {
>>         // Only accept values known at compile-time.
>>                           static_assert!(n < u32::BITS);
>>                           1u32 << n
>>                 }
>
> I think this was meant to be `build_assert!`. `static_assert!` cannot
> be used when the value is potentially not known.

Indeed, thanks for correcting!

>
> (It would need to be `#[inline]` too).

Like everything else in this module. :)


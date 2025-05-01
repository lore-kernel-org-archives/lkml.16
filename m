Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5E022541F;
	Thu,  1 May 2025 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746133382; cv=fail; b=Iq2Xl4Tz4hR5ve76JmlrExVyXjn8LCyDr6MHZ9Hkr8yLkcu25gw3xFXHqcAmUq//4uS82RcC9A99K76d4BKmj7bFFUx0dPaqP+i4fiqParKbaqxrrP5WmdKLw94LSs/QlgdL09MElQECKuEHMU/ePx9Gro7FzASGDCU47nacEyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746133382; c=relaxed/simple;
	bh=KixzsNc/ym5ajVBqdhtreHYv+aLe58VcGjEH+jhxpEI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=O/h3npdf6fX+YVZIjxtFxxznjxQUJlvELEQt6iLm+nbkHfklk077gFofObRwSp7BD++Q/fkQ+bAurSES4gDpYIhHtoA1s5Yy1RJOCO7/N956a8YZMeFiGxXaL+ayQ70h3Krkmhx1Ik/tiCmTexIHbpw64IZBBaprevUZ1q8J+TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MReaQpr+; arc=fail smtp.client-ip=40.107.96.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MReaQpr+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eb/h7a3bhEURjEXTyB3fz2n74q4Z/hmDjWEiGes4MVJkUAn+G8b/6+i1gac8p408+S2Tcapa0cc6j6UA1wUxiQYqT4fN+3mdVgIHVgG6mWH/lIj7jUFVPvFs1z1/VE7Kxpfy7WwBtHimK3VuRTsCTExlooUfhwsKD8rzt3g7IiSMVtWUXO0ySliB9NbKj/WOy7mHSH9cM5eWuioO8JpyrAAY67PXg1d3zFoGD694oiCUkH7UKLFtaS+0xRUd7lEt+qz7PQAco5FSw77w2bMvf6Lzfj7RjrojIwV+OLLhUYPbckW9RLQb5qP3lmjD6BBWWsAJ25BOjXkhzVx8IL1Ksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFC6YDQM0EvbTD1QQG0QUvkztnpAyFcnCj0wQviu5H0=;
 b=vd9tOTBGy0RvobqFm/212vMw7vqv7oVNy541gDWB4SgKb/l93FaFWw7w59xUinvXHaTzNBxBLXlI3AV69A98e4S2kmAjwuOYrG1Eyk2uFV0DoGApnu4TcJiYV5dxoSji7mXcmxKp7H7opnLMWf4GbuvHfgY+gBam/4gjTkNuVhhPwWhjgcT2IGQRk6xx4WjMMkObBGGkhszgs67S1AZQci7JgK7b3kuFY604aRb7ZTOyKbh6NNdy0l5IklxNmbzGbQUHaObrUnK9+WS2roTDgsnkcaFCj6o4aiWJhlQgvGxhJ2UCO0g3jDvUn7uSs7SAdWdpSKLbCKkK3srMusy7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFC6YDQM0EvbTD1QQG0QUvkztnpAyFcnCj0wQviu5H0=;
 b=MReaQpr+LT52+U2iorqJTnnPgpLrMYaOHiEOYCxBHlC361ZlYVbnwpgTradlmS8BhQOsGUW/xmybRENs9nvETVS5NElR59NY5NExVPhsU/fcsvjCi62XndbaVICVnTP8WZpudfOyooDfUmf570SKzRGxopfI3E4akk6Sgn3r1cq5HkrFuLqt2EplatKL9ZVe/k72i3EoVHMrbwVmfTkqyLvAXby5genTHusAIa6VSmKm8x9l5AnBOqTlNlaiT0sSx0YaSsPWExVBUQVgwqwu1nRwRH987814NpL1aLE4jmOdUE81Fw/SZ0rB5x87xUL/OLFZZMCwvKLgZcpuj72hVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9022.namprd12.prod.outlook.com (2603:10b6:610:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 1 May
 2025 21:02:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 21:02:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 May 2025 06:02:50 +0900
Message-Id: <D9L4MCKPAUE9.57CNHP46R2IC@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "corbet@lwn.net"
 <corbet@lwn.net>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <eaf5b0cf138c32135781977a7774bfd4572286b5.camel@nvidia.com>
In-Reply-To: <eaf5b0cf138c32135781977a7774bfd4572286b5.camel@nvidia.com>
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4c4b86-5b9c-4377-fb4d-08dd88f38a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFN3Y1hPdmMvZjFlRkRIc3Y4L09PaGFERUJhanRvdVcyUEYzRk12SXNWb3dm?=
 =?utf-8?B?aHFaZ2JYZXVpRHBaK3F0cWF5ak1yU3BpTy9sQjBrQ3BxMGNlSkFrUW9iVXYx?=
 =?utf-8?B?ZFFoeURTL1FEZ1A4Nm04OTd5Mi9hWjk3NzdPYlpOaEExVTAzaGsxOExya0l3?=
 =?utf-8?B?RHpScm1VSE9ibnBFU24vb2JVOEdROUdqOHQwNzZ6TGIzZTlxVkFUL1A0dUhQ?=
 =?utf-8?B?MWZVL054MWpPMTVHU2c5U0EwQ1hXaUhYczJIRlhSOURzL09VOXY5MmIvS1BP?=
 =?utf-8?B?NEhwTDhWbnhxZUdiYmhiaTJrSlR6cjFRQUVPWTl4cXZXVlc5eEtVTDRSTjZU?=
 =?utf-8?B?S21NYUY4cnkvd3VEQ3JtdWJVTXdKN0s5OVVLUDhKTkFlY3l6WmFGZXMydkVx?=
 =?utf-8?B?UUVUbjJITGNGSzQ3aitTK3NnY1I5MjJ0Q3BYVGZNUkNqV1Z0ZE54a1BLS3hw?=
 =?utf-8?B?SVhYa2o5K1N1NUFHeTJrbksxY2pMSWtEb0RNSi9sTnlOZGlYcXhFaFFSV0pB?=
 =?utf-8?B?Q25UVlVRNzVaYVp2NlBmREgzdHFZbktpSjBPVDNIajhsNnhIbGJmNVdsd1Ru?=
 =?utf-8?B?K0xFQm1IMGRuRU5Gb05pTU1DUjJGdEQ2UlZJR3FzTUUvejZjckdGY2dkTUZW?=
 =?utf-8?B?V2NHVFJUdjM0YUVSeDYvM2k0MVFMaWRCMkFTSExEbTYyVEVJWkFhTEp1clRk?=
 =?utf-8?B?TW1wb0pCcnlaWFZjZ2tBeFMxTnlWaFEzM2thbTdDR0ZnQ01rTlNnMWJWTUcy?=
 =?utf-8?B?VlI5eVZRbStmYzEvc1ZUZ2pzNFBvNmlldkJ5REcvSWY4N1NHbzRvYVRXNkFL?=
 =?utf-8?B?TXBXejlJaWZoOHFoREhrb2dWM2pVSDc2VG5HUmxsYWo4OHRnOWFqKytwdzM2?=
 =?utf-8?B?dzgydWpvWEY0bWFBSVpUbVNJU0dHUmxlby9HQUFWcHNpU0tBNGNNd01PWWVY?=
 =?utf-8?B?cWEzUHJkQjhJWWROdE0zcHQyS1JDcFIzZVNrdUxGNTkzZ1BrVmJMZmp5THEz?=
 =?utf-8?B?SWlUcC8vSzBZbEQxMU5MTmtvaFM0Q0F3aGlMZm9GQkp6T1FaRTNDMHcwMVpD?=
 =?utf-8?B?TVNpKzZZTzNvWHJCMUI0R3d0U3lYZWJUREZWV3hUUDZSczdqUVpSeVdRaFpa?=
 =?utf-8?B?UFhIMG5xemNGVmRqWGNjQUxCeFZnUTQyOUd6S0hXcWFrUjJ3ME80cFMrRE5D?=
 =?utf-8?B?MXpuVjVPN1FYajdMQTVQYVBNSjJLRU1yd1Frd2xtYTBjaUNPa0h3bC9idkUz?=
 =?utf-8?B?T1dQZEp5blhEZjVzT0xuRmN5R3pmODlIWFNydmtucXdRbFE3cXNENEpuWGhJ?=
 =?utf-8?B?aEhieVZrcUVsYlBiVUxFa29NbVRTNExrMWtEcCtIK1Fwc0pPcE42WlZaMTBT?=
 =?utf-8?B?bm1FME5OV3lrWm13bUZCUEdGR2FoQ0xKRnpjT28vb2dDbGxvVmQ3eHZidlg1?=
 =?utf-8?B?dnR2bGNRQ0ZNUGtXS1FyeUI3K0xaYThCTnFBODJTNlBvVUN3MGhHQ1o1QXk2?=
 =?utf-8?B?VDU4Q1RvT1cvTE0wMTZRUGhLbkdMYmF6MmZWYVI2M1dhTUordnRqU3h1OTVN?=
 =?utf-8?B?b2V1OTVyNGxvZ05WaDJCUDBRaUZYWTRPZXNuNUo3dmNEcm5TMXVuYTJXeFNs?=
 =?utf-8?B?dlRFN1pzMGR0b285NG1QbGNrN2ZlYzZtVktJV2UzTm1ubDZzL21rYmRuak5Z?=
 =?utf-8?B?TWlsYUd2ejNvcTJ5OGJKTVhPSC8vUFNUcm9tanBneEZFZVJwUXhQTjM5SThH?=
 =?utf-8?Q?nXnViGriB7vh7DcMHID7TdpIoszoN/PpB1n6pOT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjhNY0dEWTNYUmlYL0lyYy9keTh6S1JDUnFzSC9pNTl1Um5PQlcrek9zay92?=
 =?utf-8?B?M0tNU09zUjNaTW9BS2I5ZWtYYThOb2s3TjBrN3BIQW8rWVp2a3A4UjJ6SHhq?=
 =?utf-8?B?SlU3WFJGL0RVMjB4bndMQmkrd0RUbzdUWEdacnNBSldjdldCYTNyejQ1WnZJ?=
 =?utf-8?B?R2JtNFpBUkwxWVl0TTNXZTFuS0RybG5admtWUFRTSTVxeUgzUm5ZWE96NVlP?=
 =?utf-8?B?d21IYllndDhJVnVHaTZsTmlIY0phbjUrOG1rbVJuMWZoTkVGUk9vVEhCdTFn?=
 =?utf-8?B?NUJzUEU5Q0dMbW92cGlheFVCTnBlcTBPVUFseXJ1RHhCTWVqNW1yT2dnS3E5?=
 =?utf-8?B?WXJoU3R3N3JjVmlneEQwM2U2Mzg2b2tQV2JMVzBuczMrbWxjZEdkUUNCc3RZ?=
 =?utf-8?B?Qi9YQjZlTFYzZVpjRTlWZmt2UGxPNFpVcDRkZ2R3WHlOUEFWeHZFRDNVSzRI?=
 =?utf-8?B?NmgwRERtNUpJNkhFK2p1Y21USFk3OUJKNW5RVGVoOG56NU9XeEVCTVRnZ280?=
 =?utf-8?B?UEQ0dVd5aTFOVUxjWU85NCtzN2ZWS1JEdDRTZXNaMzB5c0J2blZtU29wWTla?=
 =?utf-8?B?RDhvcUFUZnhoRllZeHVxblc1TVY2bmpRMlkwZEpXSTdVVkFCNnRtbHBlMXBs?=
 =?utf-8?B?SHlLY1FuWE54OHdKVUJKcTl3OUx4VGtZb2Z1TUNwREdrWEFEaVNjZ3JQVVN1?=
 =?utf-8?B?bmJpRjhJeTNlRzl4bmpNQ2lNQXY5eGd1VWFub0tjVm1uVjRoOUpRY1ZlM0dU?=
 =?utf-8?B?MFZJV0ZxM0VVTS9TSEFyMWwvNWExV0x6RHgrazhjclNQZUNoaFJ2RENpbmxu?=
 =?utf-8?B?ZHJvVDY2VTFkZjlUb1d3amRyN2dhVnV4OXZEVm1hYkFXMWEwSFI0OGkrVXZz?=
 =?utf-8?B?amhrak8rMUNrODhHZDFyZ0hMQ3VuZVB2eGUvYlpMQnRydDc2aGNwMHV0d3Vt?=
 =?utf-8?B?c1RLVnd3dVAyaXpDN2MzMnc3ZGdWenQ0Wm9FWUJrMDFVOGgxSnlDczFhY3hm?=
 =?utf-8?B?VDlLYUtsQ1BoeVkzNXIvNmIyTVRnTktYckw0cVZMTEJYZTRRbm5xZFBlelk1?=
 =?utf-8?B?c2o4UDJieGV1UTNBZ0czMDluSld3cmxDdUFRaG9ydXluZ1JCNUxmMitUNUs3?=
 =?utf-8?B?blJXeUd3Z0JIVzBiT2daUmQyeE1lb1p1K0pGejVqZjBZREs1bksxTW43LzA1?=
 =?utf-8?B?Q0RxQlJTRTJqV2wxSlAzaXlBaERSeXoxRHhqdlUrLzBEamhQZHlSS1Q5NS9t?=
 =?utf-8?B?alNRMkZZeFFDNGoxS2VKWU4zZmV6Ky84Yk5jK3ZQTExvYXdzWUIrQllvZFVo?=
 =?utf-8?B?MHczV1JSS1pvNVNaWE1JY3Y5LzNHSzNOOWFCS2xnOVNGNmVLUDlkcFhaWXkx?=
 =?utf-8?B?VVk3WCs2TVRwbEZHaXZndjZrTXVTbmlxV0tNTWVWRE9XT1Q4K3g3K2lPWGRQ?=
 =?utf-8?B?dW42MkZTT0lHNDNKQUJjQ3NiTWpsMTVtVlVMSnZ6dFZZSHlzWTc3UUlvQlQ5?=
 =?utf-8?B?d3hhNGhUSGR4blYvSnJqM3NuSzlNZVdaU0xSbmtkSGYwYVg5d0N4a0NkOWlQ?=
 =?utf-8?B?UElsMW1sQnlBeUJvdjRmaTZITTloWVdXNXJrNHVOcHVobmRmVVlMbm9yZ0dJ?=
 =?utf-8?B?Q0h1N0Y0TjJMR25uc1I2a2dXUnMxVkRWMk5QZTdJVzdDbzhrVHpOdUNPUnhT?=
 =?utf-8?B?bmJpUStTUFpjY09xLzR1QjJzQUN4SEZ0V08zc0ZlVkVNdExhR01zRmR3UXZP?=
 =?utf-8?B?Q2QyL0hHOWxJWFd5TTRWVjRqcEpVaFZmc1JDdUpDNXZadE9iRUxFTEZZYjZ2?=
 =?utf-8?B?NTIraEZCRVZJTW9zUE5Odm5oYnNsS3lpZ3dGZlZoTFUwYXBDZXp1RVlSdk1l?=
 =?utf-8?B?VWU0TEVISnVBd0UrYzRUbldyb1VjRmZ5VnF5bmJCYkQraEZQb1N6R1VFWStW?=
 =?utf-8?B?dzFOSlJuaG8zQXUreFQxUUN2VEhiMzY3Z0NLUFR6enJOOW1aZUhEYXl3RDFF?=
 =?utf-8?B?blVkRGI3Vzd6QlZHOGJsRHRxdWp3Qm1meWd4OHpJYkZSb1hBZ2lMQklETHJG?=
 =?utf-8?B?K015bG5oWDR6SG1qdWI3Q1Q1T3FDTnRGL3ZIdVI1cVMyUktadEgrdzFXbmZF?=
 =?utf-8?Q?BY6MgyJHKgI11tQ1lS4Imf1PM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4c4b86-5b9c-4377-fb4d-08dd88f38a2f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 21:02:53.5679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAxuTSBU6n8yt5PUWT0oyUS2oiqjCwRT3qopu1AgvyMFYFtPsWWzTQdQvJ596+a88RouOErzweMEBk+Il2rT0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9022

On Fri May 2, 2025 at 12:19 AM JST, Timur Tabi wrote:
> On Thu, 2025-05-01 at 21:58 +0900, Alexandre Courbot wrote:
>
>
>> +impl UsizeAlign for usize {
>> +=C2=A0=C2=A0=C2=A0 fn align_up(mut self, align: usize) -> usize {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self =3D (self + align - 1) =
& !(align - 1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +/// Aligns `val` upwards to the nearest multiple of `align`.
>> +pub const fn usize_align_up(val: usize, align: usize) -> usize {
>> +=C2=A0=C2=A0=C2=A0 (val + align - 1) & !(align - 1)
>> +}
>
> Why not have usize_align_up() just return "val.align_up(align)"?
>
> But why why two versions at all?  Is there any context where you could us=
e one
> and not the other?

The second version can be used in const context to create values at
compile-time, something the first one cannot do. If we want to factorize
things out we can probably make the first version call the second one
though.

Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F674C8E;
	Thu,  1 May 2025 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117847; cv=fail; b=iSgCVnC9rsWtvCRfKOvlIismTfmkfxtzspluwYCc/Ptj6qMOfxMnNz90X1nt0SM0DtVNnjkAgo3KLtcLvktxFUCdPpF5ikJ/i8biHneucJgJGE/FPAAd8zDwOcsemcGTdie9n1rnD0Ttt/GyjxUgcN5lyRqOujejHY5rEv5yzqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117847; c=relaxed/simple;
	bh=fVtPQn+L0JyjnpP6EjRFA0pRzPvdv+aiaBz4xMXogUk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u2ejJiCCJ+reLvi5FSjXhfinEzvowKYKOyNKQLqg6Z8zVq5m+tHEirt3xLs3etwEC6FiWqBRXgJ8GHDcmq/AsnnIzScPthlOVM/cI0I5mgs9bD3jJHP6HfcrUIS6oYAm9wuUnN0ht/7LqkaR2LzcifGt2FvQUreaQ7HtqMvA5xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YHcSsqvT; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YHcSsqvT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KH1p+BPdlZQ7+XvCF1zJ/p0LQUy60xSQ6tLKAbvcfaiiVvNBlDO5wpnBWKJFWZlrWD4IXQyBeKPcTDt0TpmkBghmryEF1Lp1nSaVL1G57pBaZ61008+mePQ5caSS0+KwpCIL8ZOFXqoTM2LXeCPWC2BtY35Ou8m5rpENa4kJ7a2vsCfbJEQHFFzkGqZ55mUq6EYnQ1+VvZa4l/GnlYNQTDdbZFUyjUrOlEQSHVZ7CMQ+M6hoi2Lfb6PGew7C98Fe8p+z6QzCw3RMyv9bZ//SCOn8LyrQL9BrJhr/Y+j2nWziwQV3lKOg4t860cNYovARMXiJ6gEKB5+5UHBH2KUqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVtPQn+L0JyjnpP6EjRFA0pRzPvdv+aiaBz4xMXogUk=;
 b=bt+2YGkGiFoHMiGwEYEZgyzxgHfSc8lE3AtUB5BXa29DPDIctY9REBT0cCVR3MNBifdj20lqikz4pG9ti3V4I9QTC9fTGog3YyabkTG5T69Lr8RyPv8OCDpPyihOZwCgsATlHN8j0vS55/3vN8eG97k90GWQTvVBGucxuq+piT/cfLkVYhvB4YtZ7UB+UCAA/lXx1sSy9dqewX2oe58DbinCdaswZ/YO3GfHerwdp5ltkDTy7v/k4WR/kjvdued8P6o4SvgiFSwpqY0Xp4i8d376M2r+ta1EH7UC765+lN6xthmwf42FJwVWgaxzlvo4/tfyzvM4xtzMX1hr57el9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVtPQn+L0JyjnpP6EjRFA0pRzPvdv+aiaBz4xMXogUk=;
 b=YHcSsqvTWmyy2gM9W2zx1iyhzCa5COlRNL9n8AF0pLJ8wn0y3f7qwjwra77oQguPhOg0vUoxYjUeBvZRyyjaYYvtaDmm2PUyjgpdSdCMETgSQbS1Co2nm/htxGlZMCTeuxkoljZ5zKYHtkKys2XW6QMtn7x3NQXWBPZ9IAojIFcziDfElSVKY1bpigk8yMIt38QkDvuN0UfF3jb47Ydx2VBg6dSGmm5DYHqKiy9YFUHC6FwEn/3C9+VS6mkTFd7ukvIB9lBkfdu86ztO7ooRCKsXVi5C1MT5k5tM4brcjQyQPaB2YCfazRlpKguTyCwd0JX2T52XOWeR4mAguqbW+w==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH3PR12MB8994.namprd12.prod.outlook.com (2603:10b6:610:171::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 16:44:01 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 16:44:01 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"mmaurer@google.com" <mmaurer@google.com>
CC: "tmgross@umich.edu" <tmgross@umich.edu>, "benno.lossin@proton.me"
	<benno.lossin@proton.me>, "rafael@kernel.org" <rafael@kernel.org>,
	"gary@garyguo.net" <gary@garyguo.net>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"dakr@kernel.org" <dakr@kernel.org>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "samitolvanen@google.com"
	<samitolvanen@google.com>
Subject: Re: [PATCH v2 4/4] rust: samples: Add debugfs sample
Thread-Topic: [PATCH v2 4/4] rust: samples: Add debugfs sample
Thread-Index: AQHbuiginyRt1mP0EkSGVHm7jxdvcrO9ZDgAgACX8gA=
Date: Thu, 1 May 2025 16:44:01 +0000
Message-ID: <487552320d1b854769797cd8c4c5c95cfc1248ff.camel@nvidia.com>
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
	 <20250430-debugfs-rust-v2-4-2e8d3985812b@google.com>
	 <2025050137-ongoing-such-46f6@gregkh>
In-Reply-To: <2025050137-ongoing-such-46f6@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH3PR12MB8994:EE_
x-ms-office365-filtering-correlation-id: 41ff8927-5a05-47d3-72a4-08dd88cf6077
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Yit1dmNyM01MRHV2VHZWVnU1T2ZGZEVjVmZ5eTR0Ull1WmhkVW5uL09NNmtk?=
 =?utf-8?B?MFh4Z2o3R0R5S0ZVTTFHKytPRG4rdm95Qm1QQnc5Y0dLSFlrV2ttZHN0cGJh?=
 =?utf-8?B?bURmU01tK3NrS1lDdW5ROWl1bGpacExDcFBHcnNUWWxBOWx1WHR4ekhnVFM1?=
 =?utf-8?B?d0VHQ3BsYURvcUF5ZkVkRmF2NThkaVJCTEFXc0JJUTU2SCt1MkdobzRLWGY4?=
 =?utf-8?B?QlVBZ242cHY3QkNUVGZvR1N4Mkpyb2lNcXBmQW1RUzMwQXhUa0loZW5NSmJH?=
 =?utf-8?B?NStOYjhJa21ETUZvVW5oSkhVNUNRTnc5OG9pUkdxRmdlRjdvZlBCQXdWQWk2?=
 =?utf-8?B?UGdEcHNpQVo2dER1YXJPSFRKTkdzclF1SFlqcnQzb0RnRmt6SmJIWnBEc2JL?=
 =?utf-8?B?KzhCUHBqUGk4YTc5TFkvZjYvMHFrSnVsYVM1NUJoZmlzMDh4Yzh0RXhWcUR4?=
 =?utf-8?B?M0gzVDdNaS9Td3VmUUwwUlB6dTd5cWxJZkVjNEZzUWNWa3ozMTZrNUtLZHFO?=
 =?utf-8?B?eU1qdkxReWFJRTF2N3lYYjhRM2cyZ2ZPL1doaHk1b0FPYXB3bE1RUVIwY2p3?=
 =?utf-8?B?OTB4Z2JXY2d4d2tzYU02c3dIbnI3d3JmeHpWYVcxWVNWTVdaT3JPLzRaSFBp?=
 =?utf-8?B?eFJnWXFSdEVRc0NyakIyd2VXYU0zS1A4VGdObEEvTHJWYjlhRGc0bnNYbnhq?=
 =?utf-8?B?SXRsN3NFSWlHNXFPQzQ2SlRRNXVBM0hSM0NDMmFpVFgxNCtIVXBkcDJuQnRq?=
 =?utf-8?B?dXc0WnJwcTVlaWZ3eFgyQzZUTUdvcVVlOFV6MjgwdjcwTnFUM3BFUU02RDlF?=
 =?utf-8?B?eWNnUTVPVnFsMWx4TFk3M1RFT3VWeGcwdXVmOUxJdUR0Rjg3RFRuYkJxUW1r?=
 =?utf-8?B?bHU4OGxVTG9BdTcyQTEzUE5mYkZWZ2R5STY4andZaGU4V3gwc1U0ZmxhZGVG?=
 =?utf-8?B?K2s5NkwrQ1JCMDY1OGZkd0ZneFVRM1VOd1A2cW4vV2dmN3ZUcExPSWJZQnB6?=
 =?utf-8?B?Wm5tbVZ6VDVLSTJJLzBUWm0rTWkwaGxWTGRoQXIwejhsdit1SktKcWlKa2I5?=
 =?utf-8?B?dVdkamFYVGFLZ29iMUlSbU9zU0VjQlBWZ3RsRjdVTkNuUENOeGgwMG40U0dl?=
 =?utf-8?B?Ry9WYVRHczJsVm52YWd6eWVBYWdSYlNFYWg0bEhsakRNU2tvekFSWW45eW1s?=
 =?utf-8?B?T0VuQTE0cjA2NUlpZEZIQ25tVU5RMlo0a1FZL3J3bTVtMFg4Qk8yNDB2eEFH?=
 =?utf-8?B?bXFlV3AvbW5PWi9lZ0p2S1RwQ0tseEp2aW9pVUZ6eklHMFRkWUdraHVxS2tO?=
 =?utf-8?B?VUJsc2JDNWxoVzFwVktETFJzWnlRU1hSWHpoSGZRSXBGU1NUU1ZVT25TU0ZT?=
 =?utf-8?B?Ymxya2YyaWpZaExJV0ZwZXoyZXNGM0N5L1hDQkZMWUduaWswNkhENGZIWUFr?=
 =?utf-8?B?ZWNLdlNpZUxrdVZLYWZkaGZoRmMvaTFuUEpQUjRoY1E2K2ZiSCtRK1NubjhC?=
 =?utf-8?B?TG1TSGRmd2NwTzZYdlVjclppUmtreWNBVjhydmFjQmlhR0F6dW44a1pKVEVk?=
 =?utf-8?B?TTZlOG1NWXl4Y2w2UjJKbks0S1BPQk10WEZwVWxKWWpsRTlIcElUREFVb3Bl?=
 =?utf-8?B?UXpSelhsWjhodHBKUkFWcElzOXREYVJQcTlNRE9FSXVWSDFoVEI4bUkyS3JL?=
 =?utf-8?B?WStDWkpNUUd5L201UlpLM1hEUDI3NlFrT2FkdW8zQ1BpWEt2SUN0MjVWckx2?=
 =?utf-8?B?VGFGNnk4eXcvdUZvLzZpUXBuOXpUVlBhU29yR0pCWDlSMzN3Y1FiN1pnU2tM?=
 =?utf-8?B?dW9OeGJZRUFURHJaMXhHWXJObWxscWw5SS8xK3dXbHlBOThkOGdKWnVwR0x4?=
 =?utf-8?B?LzdZZVNPYURoTndLSE9HVnRHUFNGWmUxNGZla0U0akJ3N0Npa1hGRFc2aFdL?=
 =?utf-8?B?VWxNWmRBVjI2R2gxM1F0OXZubVU4NENuTXh2UHZ6NEYra0x6MWFPUjM0SWRI?=
 =?utf-8?Q?2cT6DF1VpczUupGfK5cgv2NI2zZdqg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QU5zNUs4RmZXNGVnZkdiTWlrOXBqOFlReFNyNUdkdWc4WEdiVFdVZTUrSy8v?=
 =?utf-8?B?aFdCajRCUjlQUjJpbmNBSU5QcmdmT3kxS1VoK3RkdDR4d0o1RmFLcldiZk0y?=
 =?utf-8?B?REZUdnZsUnJwd21pZ0pMTUtZVTdNcm10Q1dhM29MOW53Y0NhSVJhdm5wenF2?=
 =?utf-8?B?L0lNcEhaNk5QN3BrUjl6c2Q3ZlMvOWlvb1RUOGx5ZUFUTWpTNlRqNjVIZmpZ?=
 =?utf-8?B?WEd4dllnU1U5YTZNUGhJU05BN3RMQm9PT1FURUFadGs0RXE4MjVUNGk3cUdI?=
 =?utf-8?B?bEVUeEJlRlJLVUQweWRVWGdQbWp1a0VVUldycWFJWGVPNXp6d09FeFdHNElU?=
 =?utf-8?B?ZGZuaDcyN3pIQWNnTERFemFTajk5OFZvaHpxQ0hPNUxCcFNBWExTZEgzZnVn?=
 =?utf-8?B?dklnL3RiWVVNZjVpL0FLL1FWbldjejhzQkdLd1BIejZGd1NEbHhYZmlkNm9T?=
 =?utf-8?B?K2gxK2dpRmNWNEpISjFJanNOSkQyM2tNWjRDRWdoRXVrbFZsOTM2dyt1Nkp3?=
 =?utf-8?B?Yk9zT1NDcllzbFNscWV4MXFNWTRZQ2hQV0NYa0xhWmJ3Z2RjaUZuTXRRaWxz?=
 =?utf-8?B?Y1VBVzNxNFl1N0xFWUhEVEV0UFZESndicXRpL0xLb1pvYnVMYWFMVDBDYzZl?=
 =?utf-8?B?UlBGYlNVdzU5UEhDbmR5UkdzL3FzRFVMNmZ2aGV6YmJXNFE1eWhlTTllV0tP?=
 =?utf-8?B?a21nbzhpTmpDUFgxYjFhblN2QWhEWVVlaHhZR21Qa0VBS2wrWWF1WFhVR3ht?=
 =?utf-8?B?UmNwbEFtSzlGNWdxTGpBVXlkVTY1QUp4MitMeVBWcmlySjFNSDZ6WU5pSldX?=
 =?utf-8?B?K0VtV3pYcnk0T2RQV1hlS1B0elF2TTI3NWhpMkNLeEh5UWZvYURhZVlBblc1?=
 =?utf-8?B?clNYclZjN3NtODNVOHluZjVQWDlrWi9PaVhneTdPd0t6NkhLV0J5YnpKbGhC?=
 =?utf-8?B?c2pYUy8ydEYxSDUwQTUrMzFsMG1YNHBMeUg1OHlTU1kvck9wNXVzVXd6cG5v?=
 =?utf-8?B?S0d2ZE9qMHh2R2ZhUHFaWWM4aStGbm9vMGo4TGJ6WU40OWE3ZStQenF6MHJ2?=
 =?utf-8?B?MXpFNmk5Wkw3d0ZjajFDYThpK241ZWJUR0FXN0hESFEzZmN3cThkYUVJSDFD?=
 =?utf-8?B?cUtkQldDQUtvdjJWRjBGa2xyMHdUVkNPU1dLME8xMndidzYxdStMVmhJTzZs?=
 =?utf-8?B?bkgzVWZsVExrMzkxNmpRQzUzRzI5L3ZsbnlzSHNRdkZySTIzd3lsMWIzSHZL?=
 =?utf-8?B?d05NSGFDYzlLeUlMQ0ptWlN3OFhQZktBZHdSbGtaZGlVdE9FZjVsd0JqU1NS?=
 =?utf-8?B?RkVDaTdWdFBmc0lrZVVkYlZsTklRNFFUZmRSTkIyditZUVZhUzBFTlFlMUkx?=
 =?utf-8?B?MDEzZ0NsQkhsOWdBVXh4OVg0NkpTSVoxNzM4YU5uYks2bktib2twWXJOcFB1?=
 =?utf-8?B?S3RxR3pLenZoMXFzai92M3NiQUE1WWJaR3YyYjZXUjUvaTNuQ2lRU0h6OXEy?=
 =?utf-8?B?RVhweWFIY1kxWG90UTZoRHNYM3k5UlRxU1YvbkJBT0w0MWx0WlJibEtjUTNl?=
 =?utf-8?B?T0Y5WGRpTXBoVmxCKzZ3cXlaMWpIS2ZqZnFMd01sTUdxNkdpYjhLa3pxQmdS?=
 =?utf-8?B?clI5bTRqbExJK3lGV2N3ci9haXJ2SGI5TmR2SmNSeHlPemhkTHROdE9SbkFa?=
 =?utf-8?B?TDBRMUcyZDIvQUx4MXhENExwWG1jcjFSWWprSDZJNDF0eGZnRzlFaEtmSGZj?=
 =?utf-8?B?aWtxaWdVMkxHL1B5R1RuU3NuRG9wN0dOdEFyZjVBT05GRkZ2UUZrbk1pRGJV?=
 =?utf-8?B?bzFCcDV1NUxhVzBxdEwrUjNyR2FkK0pHZ1ZWTTdpTnd0SFg1bEQvWXFXeVAw?=
 =?utf-8?B?T1UyZXNMcjZqbG5MM3UwSzdndVJsL2J2Y3BwYUUwSU41OHNFQXRCbHI3S04v?=
 =?utf-8?B?ajE4K0VIUTB5WlpMRm16anlRSnRXVTNOWlpUR0NXQmE2cU1ldDhsbE9ra2Jz?=
 =?utf-8?B?SjZhN3ZDUFFwVzdPZzhqb2tkaHpRSFVJOW80Q2J1WU1uU0dYNWIzOXBSVWdo?=
 =?utf-8?B?QThNZjFvbU1TNXpmelJXNlhKaTBPdWZoQytxamlWQUlhMnZiUGEzRmdDemIx?=
 =?utf-8?Q?ZLx2RDcC61sg2t1/JmU446q7k?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6AEEF2590B5514B9EB124771E2C9D0A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ff8927-5a05-47d3-72a4-08dd88cf6077
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 16:44:01.4503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCXnljvWhZflR0pdJ46rJAKsY7oxKwN5NRODcIqoUyQ2ktcpdt9zxDch/kjEtcGstwocLoS5cQ1A6B7cjFYZnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8994

T24gVGh1LCAyMDI1LTA1LTAxIGF0IDA5OjQwICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIFdlZCwgQXByIDMwLCAyMDI1IGF0IDExOjMxOjU5UE0gKzAwMDAsIE1hdHRoZXcg
TWF1cmVyIHdyb3RlOg0KPiA+IFByb3ZpZGVzIGFuIGV4YW1wbGUgb2YgdXNpbmcgdGhlIFJ1c3Qg
RGVidWdGUyBiaW5kaW5ncy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IE1hdXJl
ciA8bW1hdXJlckBnb29nbGUuY29tPg0KPiANCj4gTXVjaCBuaWNlciwgbWFueSB0aGFua3MgZm9y
IHRoaXMhDQo+IA0KPiBTb21lIG1pbm9yIGNvbW1lbnRzIG9uIHRoZSBzYW1wbGUgY29kZSBoZXJl
LsKgIEFzIHNvbWVvbmUgY29taW5nIGZyb20gQw0KPiB3aXRoIGxpbWl0ZWQgUnVzdCBleHBlcmll
bmNlLCBJIHRoaW5rIEkgZG8gdW5kZXJzdGFuZCBpdCwgYnV0IEkgdGhpbmsgaXQNCj4gY291bGQg
dXNlIGEgYnVuY2ggb2YgY29tbWVudHMgdG8gbWFrZSBpdCBtb3JlICJvYnZpb3VzIiB3aGF0IGlz
DQo+IGhhcHBlbmluZywgc2VlIGJlbG93Lg0KDQpBZ3JlZSAxMDAlLiAgSSdtIHVzaW5nIHRoaXMg
cGF0Y2ggc2V0IHRvIGxlYXJuIG1vcmUgYWJvdXQgUjRMLg0KDQo+ID4gK3N0YXRpYyBFWEFNUExF
OiBBdG9taWNVMzIgPSBBdG9taWNVMzI6Om5ldyg4KTsNCj4gDQo+IFdhaXQsIHdoeSBpcyB0aGlz
IHNldCB0byA4IGFuZCB0aGVuIHlvdSBhdXRvbWF0aWNhbGx5IHNldCBpdCB0byAxMCBhZnRlcg0K
PiB5b3UgY3JlYXRlIHRoZSBmaWxlP8KgIE5vIG9uZSBpcyBldmVyIGdvaW5nIHRvIHNlZSA4IGFz
IGEgdmFsaWQgdmFsdWUNCj4gdW5sZXNzIHRoZXkgcmVhbGx5IHJhY2UgdG8gcmVhZCB0aGUgZmls
ZSwgcmlnaHQ/DQoNCldlbGwsIGl0IGRvZXMgc2hvdyB0aGF0IHRoZSBkcml2ZXIgc3RpbGwgaGFz
IHRoZSBhYmlsaXR5IHRvIHdyaXRlIHRvIEVYQU1QTEUgZXZlbiBhZnRlciB0aGUgZGVidWdmcw0K
ZW50cnkgaXMgY3JlYXRlZC4gIFRoYXQgZGVtb25zdHJhdGVzIHRoYXQgdGhlIGRyaXZlciByZXRh
aW5zIG93bmVyc2hpcCwgd2hpY2ggaXMgYSB1c2VmdWwgdGVzdCBmb3INCmFueSBkZWJ1Z2ZzIGlt
cGxlbWVudGF0aW9uLg0KDQo=

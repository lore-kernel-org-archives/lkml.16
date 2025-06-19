Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A072AF07;
	Thu, 19 Jun 2025 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340565; cv=fail; b=KrBvqSuvIk3L7nHspxCJ1pgyKpGGebKWB6tc9td9EjVLGeBpOJSplvvErv3A6orzU5ZPmuLq0aeV/gRlS5NbY2cOpNaYWNbtwHYG6jlyPeKZoGr4eWNzVh01MPV0M1XfYCfai7JpImYWDN9Vt2HFu1b2mgbxOW4S/vaTuStTd64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340565; c=relaxed/simple;
	bh=Mjyvr0s+ucz+Kth+rLMd5RLbwZZ9g195l8X6QZIt8OI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AR6bOLnt3bk0HmsxQGihF7eW8j8umvDFIi6ZAyOBOL/5CqBAhLSAak2WIjVlE1yMhLTqfzJiiJKp4iQaZA3PUui+wgmU1FrXjuUwTXVgASRx7nT5w536BM+Nx2LNGFknPEvqwLaxVa5yN2MzHvYgLBuohLAgj8wEjhX2cdP7diA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EmMQGUDU; arc=fail smtp.client-ip=40.107.244.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EmMQGUDU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRp4NvkNLM/8CALwj4ZB8yhL3o3GcpZuqmrUzi4cGYb/lpZ/26QyMtpQHY2EQUIfpq1LR3nZzCEj0AZOaprlrRofK79JCbl30To0/U2ef5DSRNrr3CsSFXPmnP6C+uKAKWKNPPSzDW4nxuYjEksJVdGr2UWcpYmdbgOhzRZb5Xx3vbLLP8Wp2NDFPuhfvLwgq2ASOUJ94WNNcnpCF5dMlkqLpT7UcNRaf6i+Jc0yddG0GpBPVhtyZYwUbd+w0aPQbyGdDAOLv6WlYJ5tO9wEUVwdA+o1TmtLGVr5xoqyGnCZvlyRKRu2iMClCmEIKkbDG6JX49kVv+JDFeF+x15Ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mjyvr0s+ucz+Kth+rLMd5RLbwZZ9g195l8X6QZIt8OI=;
 b=bfGKIeiW2HHs+tCUTwg1J9zQe/PNxCCWhJo37S+L7Ph6UJAtahGS5kCyKp8N/ujMJYfeH3CjpevX6+qkm84cXjTHdEzbIHqj+KOMt/sozDordIj4XVuhMYhn4aztqwaD63VRQoaAjJ7YHgSLBufYUCT+y8vCrq8ZRhSZ57nEUI20U+Yb5PaznUkKg0NvQTXkLBPiPWHdMkZJYdkXH5cw5v+3tCMBhXH1C8oFUho2Msn69qymyu0Vd1qIIyH+1/6hNuHpXz5gK0XbK0qkhn17/Be/e3SLOVD1uDPQ7Awf7qYYHW2sYJKROVqvB7mFLqtOj6hAejn4udeMcTJkluytzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mjyvr0s+ucz+Kth+rLMd5RLbwZZ9g195l8X6QZIt8OI=;
 b=EmMQGUDUgdIg/ejcBy6PX2X1ML0085Zpyb9KSVqEAlyLyP15tb7Y1FpTyIBQGoOHlE4iZqLX+HfkiOquTdGckAQisZvJx+sZhNdMsLTDeT46x+joz3i5k/xEnR5mny94i45h0ees/Mv4//NBjq++ZvI7dUw0TL+/vHbp9SlzxaSMMkjl3tTCDA2z/jWWh39zqyHnkePHQAKLYhLLKHGixBa1BBjC2Ck4Q1Erf3x0mk6jJjdhUZUZca4qYBar+/6n114+AqNlXpZWu3h/4XOc/cmv62YBeO+35BnFiig5NjBjFAyXwKbbPYx4jzUWXwpMOGRnmrUVmZWa0tvX/tq95w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7729.namprd12.prod.outlook.com (2603:10b6:930:84::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 13:42:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:42:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 22:42:39 +0900
Message-Id: <DAQJY05958SB.3FH2C0GR1229U@nvidia.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>
Subject: Re: [PATCH] rust: shorten `con_id`s in `get` methods in clk module
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250618093508.16343-1-work@onurozkan.dev>
In-Reply-To: <20250618093508.16343-1-work@onurozkan.dev>
X-ClientProxiedBy: TYCP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 489abe4b-aa3a-49de-78a2-08ddaf372a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXZOcVpxbFBwL2l4RWhuMndaN0Y5ZUd6aUVYZnhmby9TTzN3dWxnTFgrTWti?=
 =?utf-8?B?cTlQb21La205VGd6L21QUkQ0VUxxNnFraHNiQ0l1aGhta2R4VmlPZDZhbm9Z?=
 =?utf-8?B?UzFPb2xkamRSaHpZZzBZSW16T1cxclBOdmhJQjlKQW1OWVZnc2pBN2NlNXkx?=
 =?utf-8?B?NVRuZzBUeGZpRVRLSzBDdlNDT2U0em83MWJDdFBiU0FpNkNaa1FzOXRyMGx0?=
 =?utf-8?B?ZVhNaG1SYzZjRVYyMTB5QWgvK04yQktZaE1ZbHZIcnZwNVJVdHBwM0dTUU1B?=
 =?utf-8?B?SVhYcGRHZW1XN093UndTbFkyczBDSS81UkxaaDhkZDJBOXZlTTJUU3JqbFZL?=
 =?utf-8?B?elVVVFZkRE90RkRkbll4Wk5sMmN0SVhDcEExQmNpcS9pcjZPSzl6eXptSjVG?=
 =?utf-8?B?YUh3YnlhS0tvZGVlMkdTUCtlRnVOZ1NLMEtKQU1mSlpzN0laaThCWTFVSlU4?=
 =?utf-8?B?ejRyNE1YV1EzQ295bGdNRTB6WWRHNHN6Y2NQUXp0M2JwSnFCTW9kR2xCR1dO?=
 =?utf-8?B?NUZvYlJDeUduTWdNcnpKNDBMSEg4QnJPR2pYa0RUZWlmai9rTG5sWHM5ZVJN?=
 =?utf-8?B?MmJnUmU3eVZsSENNMUNXRzBTeEJod2lTeTcvek5NV3pwUWVVNHMwMFVjQkZj?=
 =?utf-8?B?Z05ZVlRodzNvR1VkajlJeHR1WWpWTElTSld1U3NXaytWdHBYVHhkUGR5Smdj?=
 =?utf-8?B?T2lZNHg1TnRxMTBEd0pYbVlZSGZvREF3eGhzVlVXeVdHbjBuZk1GL2dxNlNh?=
 =?utf-8?B?QzFOelE5MzY3UjRSZ0F6TzdCTnp1RGo4RFJOMjJ4ZHcwNjF2QWp1WDVHN1J4?=
 =?utf-8?B?VElIcko5YUN4NWVlSTNOZGszQWpFVFRVTHVEeFJyQWpVM1ZtNUQxVzhRcnJo?=
 =?utf-8?B?aXgwSW1UZ3hjbnZkQ0kxR2lwZ05JajhUSWFzT0YyK1pxdUZFdWlLellOK0Zr?=
 =?utf-8?B?NW5qUUx6cy9FWFU3VXJWS2MzdkNOb0NqYjdmNmcwY2ZPSEFBMlNYajQrVDhy?=
 =?utf-8?B?RFNMRVNONEoveTloVENNV2srZXNPSW1rcnQ5ZTlnSVA1Y0IvK09MN01tVksv?=
 =?utf-8?B?UTg2WGRCcFlmWXc4bFdiRWFVU1g4TyszRGE3YnhqZFFZZ1dkQTBRWVdoUit0?=
 =?utf-8?B?Mm5RMlBJMFZtNk9WQnZrTHg1VGRJSnp3MDJVckNMQlR4RWd0eVhkTTY5WElU?=
 =?utf-8?B?c0hjTWh2TkpxT2JtZzhQYVM1aDNtTlhqbm9yd1EyemZjZFp4RXVORTBOYW5p?=
 =?utf-8?B?bUowTnJvUEs3eWFpTnYxUlVKRXMwRmtUcUwwZmVrNzQzcWtPRDFsaVBxNjN0?=
 =?utf-8?B?MkZnRFhlUzhDWU4yaTRUUjVwTjFxdkhDSSs3SHV0RGlyV1RaamlPMlR0VnpQ?=
 =?utf-8?B?SDk0RmZXMkpwY3hibWx5V3pBaXYxc0VONnRnUUl5RlVQNThGMGcxeFFOS1FO?=
 =?utf-8?B?TTBTT1VZaHI3T2dJWnluQnJqNGVlVnVNM0JSaE4vOGlYdGdoVUptMmNjdk9n?=
 =?utf-8?B?aTc2Z2IvbURXRjdRREZmVEh3ZGRCaklEOThmcmFNMXk5M1VwMVl4czArcnJr?=
 =?utf-8?B?dlpQcFpEMktHeTVEMk4zaUE1UHFsNHFKQmtrZnBzd1VzNHhPN0RlcHBmSnVo?=
 =?utf-8?B?NTFMenE5T3VpVms1c2thTkRzWVMwSjRpVDdqVnZFSWdjUjZESnRzRzRQN2ph?=
 =?utf-8?B?Q2lGeVBZaElZRzV3K29ucU5taGd4MU9NWkNWT09pK0N6ZVVFVGQ5d1g0SkZw?=
 =?utf-8?B?cG1YeCtDRjArVWVYeHVmUmMzU1hwbDkvemIyM3Y3OFZvMTRGK1A0VStKQnpE?=
 =?utf-8?B?ZnoxUWlISWdJcERmVXAzS1lNRlZkS1NTa3lqeXJEMnJDZ3RyK3hWWlRXMlVt?=
 =?utf-8?B?cHYvOVJ5RllpRU4rOVhNbVQwRGVZTmIvTzNqYzFRZHZxN1h2N0xUVVVWSy9q?=
 =?utf-8?Q?qXL7+YK3qKk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmxHYnBKOW1kSXpqUDhyRGlWekI2Ym1rN2hpTkh4SjlTaHVlTitucHZDNHJo?=
 =?utf-8?B?MUt4TmI4cFBsemYvY0dHVTNUL3JmQVgvY1hDYWtSUkp5SWZYNTJvQm1pVU4z?=
 =?utf-8?B?Uk5Ma2JrM2ZnakxVVElRZlEyWkEzdzNsaDMyU1c4VHFVVzRaWTl3UzlPK1Zt?=
 =?utf-8?B?d3V2VERrTEt4RTcwMjRvVXBZc3A3VURNdjQ1TEd3T2hVck9mMU91b2t5U2Zp?=
 =?utf-8?B?akZXYzhvK25IMk80OW55blQyb2UvNmdOckowS1NLWUlXUnlxSllGVS8xbG1D?=
 =?utf-8?B?WmpKa1MyZytqN083MnZzMHRKV2w3OFBxbWh3ZDNLRjI4ekRmUkZBT1pnNnND?=
 =?utf-8?B?dlkwMDhHYzRRalRWeXZEZUxZZjJOSUQzQTdZZFczMGVYbTN0SzZUbllxVWE3?=
 =?utf-8?B?VmlaRERmaXZqV0dSNHg2ZUltZDdWV0xLY3Z2RTNDb1ErSzc1Z2Q3Qi9PZHNn?=
 =?utf-8?B?cWRsL3dHbXRKdE00N0pnZ2dNNXVYbmdlZWlOOWd5Mjlod04xQSs2aEJ5a3JO?=
 =?utf-8?B?RzAyM2FBN1pwVUpoSngzdmczbExsSHFDY1VGM2JQSERtRzlPaHlBMkFwZHR1?=
 =?utf-8?B?bFhVRW5rNndFa2xZanFvcEtHa1M1K2NjRDV4Z204VnNpSi9CTllPckM0N0lK?=
 =?utf-8?B?c2pTQnRWckoyd09oQ2hyRFJOM21MWUNuZFJ3Rkl1ZzloTlArNS9qeE5UU1h0?=
 =?utf-8?B?ZWFYZ0ZwR0hiYnY3UXdKbmVEb0ZVUnpIYkxMVzVBNlgrdWJidGE0WWt3c0dX?=
 =?utf-8?B?aG5WWHEzWk9RK1RPejFHOTloV3BlU2U1S0dwcmRqOWFmemQyRTRjN0dRK3B0?=
 =?utf-8?B?M2ZmbkZPcjRFdGM3ZTJLK0hhbFRGYXdzQXRKeWtwYllCelZ0bmhVQzBqZ2Ew?=
 =?utf-8?B?VWd5MGFZeHVYK2NMVUxsM2p3MlEwSmhQMFpRRDgwT21GS2hpTW4zM1VVVEM0?=
 =?utf-8?B?Q0RVeUlEbXBwckVma2tMOThIY0lYRDNmVXZEMEhNZFhuL3dWdm44cFVTdzhn?=
 =?utf-8?B?ODkzb2svaXdQYVJkL042MVFid2RMYUN1bng0VlljcDUyM2lMczhSTXVBRGg2?=
 =?utf-8?B?K2gxUlVXQ1FJdFYrVXlOTzcyM3hzb1kxUU43Znh0U2ZWWUVrWTg5RXJLZU1x?=
 =?utf-8?B?VFJpemtub2Y5STBmdG1rMzV0WDNUZ3RZRkc1eXJZMjhhdHBKdmp0QVcvOVhi?=
 =?utf-8?B?UWR2eVIvNGRsQmhKUi9PMkRPdWRuZ0ZHdzZleWgybWpmdzFiYkV2ZEJIMDBK?=
 =?utf-8?B?ZVZMb1NBS0dsOU85ZVNiSm4va0UxZGw4bE1XV2FiL1IvK09zNGZHZER5Zzgx?=
 =?utf-8?B?aENJRzZjK1JZUVZ6WjA4S3NIQlZyQmM4WUxraXdBTks1WCs0Y2dBUHpXanNG?=
 =?utf-8?B?T2JLb3lvdE10OGVYbGQ2cG9aNzU1Q1FaU3NqYzB4VTBmSjR0VUd4djA0b3hD?=
 =?utf-8?B?V2RSeVFrRUorMDJQeHRoV3JyRUdTZVVmU09HMWJNZlFPMkVjNHRDYzhNMS9X?=
 =?utf-8?B?azdJZ1dqK1hWUmFjSUxXSTFBODFQSzFCNTI4aUJiWFBVRU5PUWFzYVJNSGpC?=
 =?utf-8?B?ZlZOcVhWR2xYa0x5NjNFRWVrYmtKaXRZR2xReW5uV1RBTElGUEhkTlN0bUJF?=
 =?utf-8?B?YzJyRWFURWdFQWdnWk81MDlLRGVzdWJaOEdQdXJZYytJdlNVVTBOWTNvZStD?=
 =?utf-8?B?dGRkdzliNHltNmxOS1hESFJFUmVETDA2T0Fnc0dQQ09vYXVaSExveTlUNzJz?=
 =?utf-8?B?OThRVmpqeGxhc0NERWVIWU9LMHg2dGVIQmtybHI5ZUlud29vL01NNks5NXF1?=
 =?utf-8?B?K2paWnFBc3hvTlBZTTBTYmtoVWNKdXRNYUFBTTJVRGMwYytCbTJzMi84VVJH?=
 =?utf-8?B?YUhBQ3JDWmNsY25RclhFRFRRMGJGekxLaHJvazhtL2VYYnN4Z2c2MmdjMXg0?=
 =?utf-8?B?TXpzU1lUQ3E5eDFvaU5ZbjFpVUgzclZvcnV3bUYwNmNOUmRyQndJNERuRktO?=
 =?utf-8?B?a3NXUTE1UVdGa3NWZVFWbDlsQkxpY0FUbjZWb2JHSmF3UHdoaEhlR1p4djJq?=
 =?utf-8?B?TTBwdGJsOCtzYndjZmw5enFCSjIreWhwMzBxR1VOb2tSRnpmT05aT05yY3Vp?=
 =?utf-8?B?bmsxNkRYbjhXWXpXTjlVR3ZteFQveGhwVldadWpxbzdZU2VZOHY2TzZNaXA1?=
 =?utf-8?Q?jSE8C1Ni0BkCWlg8qHhrmraVi54llJBt0RRBhF/4iZcR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489abe4b-aa3a-49de-78a2-08ddaf372a16
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:42:42.1753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KUsVSeX1Kf4wNwc9GCS1QxrlYkkwHN6fKvyVQsxAbSlxA7DDZeCuL3W86CBfl/EIIJG87tA00V3jpfzbBmB3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7729

On Wed Jun 18, 2025 at 6:35 PM JST, Onur =C3=96zkan wrote:
> Converts `if-else` blocks into one line code using `map_or`
> for simplicity.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

FWIW,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>


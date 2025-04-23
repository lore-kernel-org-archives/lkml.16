Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6232701B1;
	Wed, 23 Apr 2025 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401217; cv=fail; b=Rdzxt7jHa6l6+5wnoYj8cGpiB2HCLYvvY122T6vso6z9f2N20l0KTxQt9OWOxd5r+PgXRd0UK2NbDtsMWaQdi/kHlwskmkbugt2GaUDXxtMgmEVGg2exaantVFSYJWOvBJOU4YaLDnLdZmov7KQCOpU6pb5KsByMbdvfSNhod3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401217; c=relaxed/simple;
	bh=Y7ddmRGVDVT7h0HWvObWLsyLeV2i5QBq+ibR9/7uDo4=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=FhJVEoAP4+w/hb7/KcgnFPrYeVU9HF/Vkpk7oMx8WaOTIe2kdjASzpFCJ1Q2+plV0r56Xea0+zRQjNgFL4EcrrN5p2OIjeJ/vvwLF9ToU/ZsxDAb3LJNA/s0o3KAKd8oqz1EK2U+CCSyn1iQBsu7Y6FGXEE/3rb6nWYCxYuUKBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=suFd7g7g; arc=fail smtp.client-ip=40.107.96.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="suFd7g7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yom016xkwU11RVxslOVxakQueEnt6VmM0LE3H37c5VK3+8wCr63cY7Vhs5r3tQfgVBRIOTwowKTMX3Q9N8/b8INlo5PLvZIEvHirsVzEydUT3s4KURWNj/3mdLRm8B+KeLu8sKo/hNN0B1BZcBEejPIfxFiL4gK+1D5nP4P4ki3mIDT7ZYYvAyJHrLyDORv0SVsfouZIWbZ/qN6R0iI31IV0LL9/4JHf3i8QIZcBfuLolwf/gm4F0ydBFN5zxzEgML1V0REdeBWULjex2A1LpuyLl78yr3/FfXtGzQSHgMaISsw2iQbftyMhK/NurH5VcY0ZLB+NXdixmk58R9COug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+6M2/pyabA+aUFOfb16KtoVdjOO78txFjayBMlAn2E=;
 b=aB+2kmM/SCGHNDx2D8gbnKNfwY0bYkEDczixljy3f+uMjJ0QX/vsIhyZUSi3eC1Uj5juBcLKCF1IBA3pwPzDLpJyCYVYGeL6g56NzkgcpQqwsAteyBP8hQqy8DSLHjEVvIc9s/g853rAY73I6m1dfOOiaPRdF2lhZlQXbmqhilADn1Ud9Tqdln7mv614K2GjBqB9QCVKpwc9XG/KF7yVk5bGGIfFOE2zfXWbtqBwMvkSyiOOuqsOlGtREdH9h0k2u69tynUIZIx+X9z0Rq5P7U2ySyXo3sE77crHtmz3UduMFHDSyZQLjeR3v5n5kVc9btFJ8HOYmi+CEWmakjNl6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+6M2/pyabA+aUFOfb16KtoVdjOO78txFjayBMlAn2E=;
 b=suFd7g7gfDFNBzs+u6YANXSksa20NutSq9gx6aIokGWVjxqSLrHK16Fg2OCdkOy6xw77cgAv1fFUqSRUhp2DJN5Px+QR26gYoiEe7ipwopxNTKFwuOww1J7XCMWVGvb5mgQg8/M9+M7fkCN/6YulxsZa+lsrjCYHMZJ08DrMitva3rV3Sx6XOniXeDnfqnNZUdddIss3K8jaBW6aKGOV65/s2rRF5E29Q+QibXPBqR6e5x+lMNHMhMq6Hc4TkLvt5cloit3b9sX/noS675h+kvD9D5ShSrOWPXKqcV7qLl8PG/zPpiNnOhKVycKz2FxzV6vUU2dE06TJvTYRm1huYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB6690.namprd12.prod.outlook.com (2603:10b6:806:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Wed, 23 Apr
 2025 09:40:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 09:40:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 18:40:07 +0900
Message-Id: <D9DX39CF2RB7.IM219BZLVMCY@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor Gross"
 <tmgross@umich.edu>, "Joel Fernandes" <joelagnelf@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux> <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
 <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com> <aAfL-e6qA9oBce5t@cassiopeiae>
 <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com> <aAiqCXB9sJe_v6Yc@google.com>
In-Reply-To: <aAiqCXB9sJe_v6Yc@google.com>
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 7841f492-4480-4b9c-ac4c-08dd824ad788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlJHbkZwNHBlSHBKZkNqZWFYYXErWmNXcEFCbHkwSFdyYkpNdG5KV0Z2bE1H?=
 =?utf-8?B?TWUzZjdOMDBROUpSSVE0UHRQT0JuT3Z5aVJuN245ckdiT0g0SUZ6Z21qVDJz?=
 =?utf-8?B?eTMwbjgzTGZSQ0VURTQwU0VzUVB4MlNhWHlkSi9hWTlSY2c4N09WcXhTeGg5?=
 =?utf-8?B?OW5zRVhkSkZrSG9FRk1MbkdtdHM3U2xMSC9TSlY3MW1LUDY5M1V2Q3ZKMWUy?=
 =?utf-8?B?VGYyT3RwZmZvaDhwdVBJODJFd3orRFp5T0VCN2F6bGRXSmYyRTU5ZXJ0amlo?=
 =?utf-8?B?em10RmRFRTJaR1hhajdva2NaNmdnZzNoVGwvSmw5OEowUEVvVGdCR1FrT2pl?=
 =?utf-8?B?clhNN3F0NzdVYlhwRFl4cGcrYS9SOEJmK0xZMEVTY0NFMG9IQ0MwYmpyR0wv?=
 =?utf-8?B?NlprYktXUlo0TmVuVjgvbnpPUFVtV2hQQTRUSThNMFV1YjJQQVVBd2doTUpO?=
 =?utf-8?B?Mmd1MmxKdmM5YjNFUjJRUU5mYUtSbjZOQWkxL3p4ZXlzUHk1UlJFL0FPSnE0?=
 =?utf-8?B?Slk5d0xLRkEvUjROcVRJQTRzTFpXdE8xSnBmZ1BTMi8zQ3lBM0ZHZ2ZhM29l?=
 =?utf-8?B?eXVmVUgzVENmQlVZdXlnU3JNS2RISnN0Zk41VG8wSCtORjZkTlRicmNnVlo2?=
 =?utf-8?B?UmZQOHZMWXBndFc3RXQ0UGdkckpUSzVLdnpCK1NYZk1Zbkc3azRESGNUQ0JW?=
 =?utf-8?B?bUR6ajZoM3Zjekc4MTJyUDhUZkp5TzZzRGNvc2dqcTU0ZkFXM1N6VW1kandU?=
 =?utf-8?B?eFExM0Ewck1TQm1YNkJEenE4Ty94YzZQdUpsTGwxTFRSS3EyWXBTR2ZneTNa?=
 =?utf-8?B?S09VMnRMdnVvRlBqZ0hWUllHZ3JOeVJocE9lZHUrQzZCZ0ozT2NiUWpLLzdj?=
 =?utf-8?B?eUZnNmpFUTZTY0lQb2ljYUZPeGNrMHI5RERDbEdOTmg1Nzl5cHdGS1ZuMnNZ?=
 =?utf-8?B?R2NnVCtVRDFuNC9oK0xRb05rUnVDSk50eWdLZVhsNnhZWksrVllIUXVERzFD?=
 =?utf-8?B?YTJwQnhhK1ZKTjBqT2pvZGlYL1dOK1FQRFFSSnU1ZXlwNVFKMWFzdSswaUp0?=
 =?utf-8?B?dXlYWXBhKy9Hc0xiVmliVG1FWnZYRmlQN1Z2NjVWU0VxMzhmZEdSVnBhaVhw?=
 =?utf-8?B?M3dXL2hTU0U1WXBJKzBLRjVnWXVCaERma0pvblovZnNWc2lqYVlyVDNLZkNi?=
 =?utf-8?B?SUp0L2U3eXFmUDhXQlZ6SW9MR214ZU51Z3QrV3R3Z0hqOXlybW5jZTV0SjI5?=
 =?utf-8?B?SURPWjNGS0tITVZrVGE1RnhkdjFTTExpZWp2Qi95T0VtMlBPdUgwTnY2dGpt?=
 =?utf-8?B?SlZYU3UxemtYTnQ4eTlTaFpVTmdhUjF0Rm9pYmpWWHV5QWptMURINVgydjhM?=
 =?utf-8?B?dHBWR1VlNGRWTG1mcUZuTXJ6Q21ad0JrWThmbDV2T3ErMmFBbUtYZmpYSXY0?=
 =?utf-8?B?SUNHZnNJK252MlJmbzErcVFSMzNmdEJ1dmhtYmZkczFnNmVQRWhCUnppbExL?=
 =?utf-8?B?U05zQWNrNWtndTVXcjNiSHNXNGpXczBKS1FYMUlzUkl0ZGNKOGxsTGExcmhj?=
 =?utf-8?B?WnU4SkJVeGliaTJpdmlIZ0ViYmNvQmc1VHRaSisxWVlqeXJSL3RESmJybGFQ?=
 =?utf-8?B?bUJvNHIyRTc0MlVDRmUxTG4zWmRzbmVTK0hqcjF4WG92R1VtOVNkRDRvbG9x?=
 =?utf-8?B?VjYrU0hrNjlRbnhFSUxlcFFSdlVEWWJBSk54U2RJOUViY1JSNHJab3VsNFZn?=
 =?utf-8?B?UUpFNFIydFpRWmVwQUNPTTlUYjNqYXhwZW51cDkzb2xyakJtYk9Pdy94eW5Q?=
 =?utf-8?B?WjJoaFhUN3l1c1BOOUJnTXlUZ2xzSEFFMTZuL3FNdW1oVTRaSUJIa2NsTDVj?=
 =?utf-8?B?L1hYUGZXbm9HclJXajlJbVg2akN0ZDB1RmxhVTUyV3V4RUJSS3RJbWZxdlUy?=
 =?utf-8?Q?NyZkowO1FXI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXdRRFRvVEZiL0hJQk9hejJrTUdKZXZmcnozYmdEQTd1Tk1LRmFwWFUzWnJm?=
 =?utf-8?B?RUFkZ2hkeWVlZjlMOEl4VXRiSlE0VndqMFF5Wldwd3F2SUpvdXJIc24vQVlv?=
 =?utf-8?B?bE5FYmxTV0dLUEZPZDl0UEoxN1RYYXgwUmtyb0xxclBaMU4za3lMRlZOWEty?=
 =?utf-8?B?T2sveGdFOFdza1dWTXNudFlMekYxTldjR3E3bHVvNURhM3RhTExFSjR5WWgv?=
 =?utf-8?B?bTllellWQUZTYTNNMTNUZDk1NUhveEpwWVlHQ1pnL3BlRzVvRmFjNGI0RS9R?=
 =?utf-8?B?WGJ2em1IS1RVSnNzVXkweTAzcG9CSGJHQzlWSlpTUm5WWEpydlVVQzk3UUVj?=
 =?utf-8?B?SFl5TWYrNEtSOU9tVXBGZnpmUG1zUS85NzJTRE56TDRYQWRvR2s0NGhnMlY5?=
 =?utf-8?B?MUY5eHh6ZzI2VVVUQ2ZLb3QzS05MVjRvdFZ3K01hanM0T1VYVTdRWWFWcms0?=
 =?utf-8?B?RVJWcW1UQTZzV2RabkozU2REdkxWSWM3V0Vnd3ZaaWxLNjBleFVlUHJ2UWxi?=
 =?utf-8?B?R0NNWkp5ZTRJVWdHVXY1Vk5JN2tXb3E0Sy9ndXBYV1JyckN3WWNHK2Q3Zi9L?=
 =?utf-8?B?OWpRbzdkSGgySlYvQnV2TU9pa2p1Z081b2ErNlJQWHR3RW5ybU5rLy9NK2Fk?=
 =?utf-8?B?OHovTTRRRDZNbHhJbGoxbWhNaDhuWVh2WWZHNnViSWFCLzRiZHdYOGdYODh6?=
 =?utf-8?B?a2o4alZyVUhzUXdJemhxeU1HYXRLeWJnTFhVU0lSQmI2am1qRjVsMkFhUmp5?=
 =?utf-8?B?bWNJdnBsUVY3TTI0MzYvOE44ZWtUbzhYUU5yTTJvZmZRVDNIK0Z3eEZQSEta?=
 =?utf-8?B?TVltQmZoeUx5Z1VWOFU0ZDBENDZGT21ER0dtSlg2MHc3c01tMmw1RWtXSCtn?=
 =?utf-8?B?Z3dCN0xYSmtZWTNiNUlCaWg4MjZrZjZuTW81NUM3ZG1MSmUxdFpkTW1yVDhB?=
 =?utf-8?B?NlJsaU9qQjNFVHVNSFpBQzFRQlpseEhSQittWURiVndMN3lsOU5tdWp3VUw4?=
 =?utf-8?B?T1lWSkRvVXRuLzVLeGxIL3JGYU1BZHBSeHVmYnBNbVN5UWlpOUlxemJ4Sk9j?=
 =?utf-8?B?c1djUVM0YnVIVThsVGVFTU4wWHNNMVJhbFhUWFJFUCtvRW0rMEF5ZTloNFZo?=
 =?utf-8?B?eEhpNlYyT3pJOFRjeE1OdDRqTWVOMWJCazVDQnZWSEtFb083clhRK0tDN2t4?=
 =?utf-8?B?MEttVWVjMUR3QU95QTdCajgyaExTbXpyYlJtaXpGTkVSY01sSFBUT0pTT2pM?=
 =?utf-8?B?cG5HZXhockNqb2RYUlVJVEVIZlU2anFhNVVwWUg0eVluZ1dsYUZTNU96OTBq?=
 =?utf-8?B?NWRFOGFrVThwNXhyTG9BYUZFUE1acDJaVVVzNjV6OFlhUkJ0WTRxd2I4MWZE?=
 =?utf-8?B?bXpYV09lUE5nVElzNFVFS2l6SWxnajhxTkNQZENDbng2Nm1ISnFZSXFZSEth?=
 =?utf-8?B?Rmo0Mm1BY1loN0FnTVEzOTVGblNNM09rTHJkWnVBSWJySGc0VmpuSWFQay9r?=
 =?utf-8?B?SFF1REJRaXNsSHBtWmdXMzNqUFJzaCtZc2xqZ2tlb0VhaExZbjAwdHVKU3lU?=
 =?utf-8?B?eGR4VHkxbWxrK083QlVUSUV5ZkZMNEx2Vjg5bDkzVVNBWkt1amI4WVl6QXJt?=
 =?utf-8?B?aHYxNG1BaVVZMnc4Y3RSTUlNME1qNmFkQW52OGFsZy9TbElUSDBDYzBhN05u?=
 =?utf-8?B?SnJVVDhoRHBpVmNIdUx3OFk2UGYyOGFoYS9VaUtwQVV0YWpSRDJNejQ5ZENN?=
 =?utf-8?B?NXEwTndkWnNhR2J6NzFXZUZMM1dkZmJjWHAvSnlybFJJVDdEWFYwcDVwMGk3?=
 =?utf-8?B?YTV1bzhhTXVVOHNEZ3NJL2p2K2NPcjVzTHl3ZjZNK2EzWXFGdEtDUmZMRjJi?=
 =?utf-8?B?b2xiRXB3SjE0UGlkTzYwclF0VXk2bFRMcEN3Q0ZHaXFyelo5dmFpeDYwL1dL?=
 =?utf-8?B?ODlZOXlRc2MzYy9jcDdFU2xtUDd5R2NTcFZLRlBZYVZyVjgzMFpiWDhZSjBo?=
 =?utf-8?B?N1dnNjRoblNYRkFHT0U3MENVVTNVYVBTdW5BWDBhdUdPdFVyL01rVndSU1ov?=
 =?utf-8?B?UGJkTkdvem5WR3h6L0NiQnJqWWlPRG5aM1k4RTk2SzM3MFdzWmd5VTNuaTdO?=
 =?utf-8?B?QXh1SFJ2ekpJL0VnK245bmpMRDI0SnVXVmxWQlRMTzhZdXB1RmNuVSt0U2Qy?=
 =?utf-8?Q?K2A8ohw9/rWzOcxlOAnVgrQJHoAHvUZ9d/4rsuchqcKP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7841f492-4480-4b9c-ac4c-08dd824ad788
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:40:12.6078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DfjvAq8UHKMMz01C5hjhBrED0VrGkYmQHU9kvXflR3XMoijIuCcw9Pa5LIQZH4/hV8D9aG6VS3Ut59HlYFeHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6690

On Wed Apr 23, 2025 at 5:51 PM JST, Alice Ryhl wrote:
> On Wed, Apr 23, 2025 at 10:02:58AM +0900, Alexandre Courbot wrote:
>> The problem I see is that if you try and do something like:
>>=20
>>   vec.extend((0..10).into_iter().skip(2));
>>=20
>> with the standard library, then the use of `skip` will remove the
>> `TrustedLen` implementation from the resulting iterator and
>> `extend_desugared` will be called instead of `extend_trusted`, which
>> could add some unwanted (and unexpected) overhead.
>>=20
>> If we want an implementation of `extend` as simple as "confidently
>> increase the length of the vector and copy the new items into it, once",
>> then we need a trait that can be implemented on both shrinking and
>> extending adapters. Anything else and we might trick the caller into a
>> code path less efficient than expected (i.e. my original version, which
>> generates more core even for the obvious cases that are `extend_with`
>> and `extend_from_slice`). Or if we rely on `TrustedLen` solely in the
>> kernel, then `extend` could not be called at all with this particular
>> iterator.
>>=20
>> There is also the fact that `TrustedLen` is behind a nightly feature,
>> which I guess is another obstacle for using it.
>
> The stdlib alloc crate relies on specialization to speed up methods
> related to iterators. We can't use specialization, so losing these
> optimizations is simply a cost of not using the upstream alloc library
> that we have to accept.

Yeah I was surprised to see

  impl<T, I, A: Allocator> SpecExtend<T, I> for Vec<T, A>
  where
      I: Iterator<Item =3D T>

and

  impl<T, I, A: Allocator> SpecExtend<T, I> for Vec<T, A>
  where
      I: TrustedLen<Item =3D T>

in the standard library, which clearly looks like an overlap. Didn't
know it was relying on a non-standard feature.

That's going to limit what we can do in the kernel, but nonetheless if
we can support only the cases that can be optimized I think we would
have our bases covered.

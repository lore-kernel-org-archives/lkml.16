Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE47BA38;
	Sun, 15 Jun 2025 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749992387; cv=fail; b=VNCg8wvSPLYMC+cJt7w7FjFcvQpnrRDRAmKr9KS+3WwfL/34Xs9nmti0wUG+dMjVrTT31M2lQJUQHSp05tSWYCzE3FSkuC7/SHHu2jIQ57VeGFdu4NZeIF/S/Sooy9IAbsmDFv2G/27yZZBbbt/waJJxNHrtR6IFyeEhdL+63ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749992387; c=relaxed/simple;
	bh=U2Pf1otpKYKxMf5Q7hgJhaME9eFdbGihzOQwsI4Hlts=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=H7l6T6VHRlcB1qdJi1NQahI7So3oVtNuQ2cAZceB7fgCsGHKbgl0OQIPusNKVEIWrYN+HXeet873URemwiVNwcg8dmiFNUuytgSk4BQ9lIzwcPyQpF73lsaayIIUq3tUpLk8DinZ9MJd/BZ/Gq6LTI2XpSJX7sKFJS7siabLfrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l8ASWSvj; arc=fail smtp.client-ip=40.107.95.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l8ASWSvj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkvnH6IiVCxMo7jzQRgQmwxL+YAI7NAen8WQksdItWMAbdnK5s2PcyF1/7iGEdzdW9VJ6O7cBCzMTuWdFQ2xv/zWrYeiLaIhA9nGbHynpUnwYlUnKhb17mcXGM9t+SXaFE4RLASmy0MiYjVeOJH4PfGgumdxaH565foyLOxyuRLLmayDeP7IwcwwzCsTmqiNd23+1uDELkLezoD8LlnuIz0228Jan3PHgUGcJ6IRUFBymldhgEu6o/xgD3cASBXF0LfLfEMAOOkjRkW3gaDHgEj04XlRr2JsWiT4n1+klaVzhWj+BN+TtAJnvatkaVmi/IxhoyaoE9Gm/gBBKltlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIQJIdWZD3YqPnzXwB/1SCH6GSv6EYdLwrgQMI8F85E=;
 b=nvuPLJBMLkxxljQiWJNfXhz8reLx7ULXaTb7uiVOGtHGisPcdTEai0dCunTMjjCZJQ6AeR4BBsvqGAGXBc9nmfNAyFySpKs/7NySdJon7iyq1esXg5uEyKEngTBALyHWDBv57wNzP0+5J537q6gGgR1kPBgqoeQql+m9nkyP1JUBce2k9jo+iYCU0KOycUZTqzeCmEJgqo3MCBT/YI068zP8CYSX3EsP9Dal8HSoq7l52SAL18ZnhOMB/p5mmr5uwOqgx2ggmqM9rGCtntV9+32b3vDClWNSRidcEdUmyjVP5901vmg6jLUy4zdH7q3Y7W78M3eEzNpj097Kmp18hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIQJIdWZD3YqPnzXwB/1SCH6GSv6EYdLwrgQMI8F85E=;
 b=l8ASWSvjsejCdp8YPp5jQR23vkkp8dauNCV8uMWfjNbJuKOdg75MPZTld+GFcdHG/97Wr4Zm/DG4I6bUhc5Ccqhd4X6Nace/v1LuuBYQu0mj8PpQoUVZUUQ2vC6jcpWwwoAV/8Whj18Ly4Ybvn9s5M7suGgM9SCgG2/jK8OZpqdYXCZ38DXS4W2jLticWRcOhsx3GFyQ2Udj1TL4zVI+02T/91s3rXSH/tVyih7Z6mxrI29fRRsS2sEKnnCcHHVfmt6HjrU2w9hRF8wX7tBTQciTTUudDqZrVWsVsVVX+c4rJcdLKNDOfLHtVwK+0XXyUIXHoHrFbnkqtRsWyedemA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB8809.namprd12.prod.outlook.com (2603:10b6:806:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Sun, 15 Jun
 2025 12:59:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 12:59:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Jun 2025 21:59:39 +0900
Message-Id: <DAN4IWLJX27C.1TBCMNKRMNH9T@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com> <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com> <aE2P3OBo1Ufjctxy@Mac.home>
In-Reply-To: <aE2P3OBo1Ufjctxy@Mac.home>
X-ClientProxiedBy: TYAPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: fde870dd-2026-4855-b1a4-08ddac0c7e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alphcE1rUHdMT2grT1ByVVE4NldTcmNsS01nZ2M0WXRnWTB3Z25WRUg5MEx2?=
 =?utf-8?B?cW5jZWlIZG5MQVRQTEx4SGltRnh5SW1WVU4rTnR0SzMyR2kwam5DeU1QMURi?=
 =?utf-8?B?UWc4NG4wdlZzVks3M00wMXZTMXhyMDNzVExaWStnVzZrVnJsa3lybmVpeWVm?=
 =?utf-8?B?WjN2c3Nwbm1nVkUveFQwTEZJaDNwbHNMeUpxNlNkUXpNeXhUNjhjbldnNkNy?=
 =?utf-8?B?a3l1NXFXUEJTUnZQTTNhNnJBdzd5L0RNSHBld0gzc0lsQ2dNbWtaWTh5d0hP?=
 =?utf-8?B?QkZBRmZ0MmtNMDVxdWRRbW5lWkxjUFlzbTJVYnF0aVVTVElhazR4Y05rSXpy?=
 =?utf-8?B?TDMrSFozTER4Rk55QXI1U3JYaFJpZ2ZZUVB4dUlhV3FPZ1E4aG12RFdxcjVp?=
 =?utf-8?B?UC9XUHNiTytWa0REa2k2UXFaSncySVV0SlRReVhidGJ2azZZeHRCck5yVndK?=
 =?utf-8?B?N20ybUd4NjZFVnUwVVZCVXo1bU4rNTRXVE1wbm9FeStHVEJ4d2xsWERlMFZQ?=
 =?utf-8?B?Z3pRSHhaNzRET0ducEx6SDFrbnFQQmoxYm1uTFZ6L214dm0xNi9acjFZR2RS?=
 =?utf-8?B?N0NYNko0MXhPQ21PczBWZVRqVXVhZXRGeUxpRVZYUmhoL29kSW1iL1ZMZ3NJ?=
 =?utf-8?B?MGFsNTErVjFwRnBjb0R2SUF2emdzcHh4R05LUEhPbXk1SFlFNVNUN0x0VVJ3?=
 =?utf-8?B?cHFBQ0FmU0I3QmxMQUpTRUZraXEwMEwwRzI5eFhkZ3BkSi9pUVZCb3lFRFpl?=
 =?utf-8?B?LzZhOHZjQzgvMkMxVWtKL08rZmt6dXhoM2JOdlVBMDE4Y1NmSmladjZRanR0?=
 =?utf-8?B?eVpnN0c5QUZhK3ZPTFp5Vm1mZ1lyUnpMQWhPNTg4T3NNSGo1Z1E5YnZvbzFX?=
 =?utf-8?B?V1BkUGM2WnNvcW9FRElqTTk1dWhiZEIxNkI4VEFFOG9oK2piT3F6czdTOFhJ?=
 =?utf-8?B?b3RjeW9qVmlOWmhUbFJHZ3JhZ2NpeUNHM0FXRytpR21rQ0NNaHFCRzVRT3h0?=
 =?utf-8?B?UTNFdVFER0g4TnVxaS9MdTcySm1sZzJvcEsxWU5LN25aNStodzZrU1c5S2h2?=
 =?utf-8?B?NDk2Z0lLcDgrMThoUTB2ZWoxaTlPTUEzaGtKTmNtWE90VFRxbzVYWE5yZVVt?=
 =?utf-8?B?S1VBc1ZzQjJnL2FXNksvRGk3RW1DYUVxVjVud0ZBdmdVb1JxbGV2UEZiWUJM?=
 =?utf-8?B?ZlJ3M21pMVNTcFVDUUE5TThrMmNVbllyZ1ZCZlhZUDd0cE9VVFd3VjRieUJY?=
 =?utf-8?B?Uy9UNTRNTVQ1M3VEcnpXZmlPVzVnbkIyN2ZqbzZodVplRVpBb3d1SXMxcUlp?=
 =?utf-8?B?WDhCMmFoc3BMVWo3UytkdzJ1aEhWV0xEZUF1TGFOK01adzN3dG1ST2ZUSnpX?=
 =?utf-8?B?U0lOS1ljdEFUTkJ4QnNaODBUQU9SSkJJeDBXVi9FZDJQa0xtM0JkVHEzUWFT?=
 =?utf-8?B?aVZ4RjBEUjlubEo4endkemg0RDBUak1Cc2hWYzdLQ3ZqNnFsQ0s3M3NkZ3NG?=
 =?utf-8?B?OTRMdEllWlVVMEtyQVAvU2VLTzVPVjdLcjV2SkhOb0ljS09KQXNaam04UUhC?=
 =?utf-8?B?c2xadmFEZE5RalFVOEt6NXJGdzBFUEliM3JRQ0tVMFdpVGwvU0JmY2hlQ01C?=
 =?utf-8?B?TnFwdmdPTUJwU1NINmh3NGxoaXBrY3JBWW9PUEthUFBpa3dkL1dWNW4ydllk?=
 =?utf-8?B?NTlYK09EdEFkNzB0R3BMK2grT21OTXZmNTJUYVI2bGhpaG5hazhrN0Vyd0Jh?=
 =?utf-8?B?SCtWaUdMbXhPaHlxMEFYMFFUaGN1cHI4LytTRk1GOTBFK2wrMXRobXJ5dHF6?=
 =?utf-8?B?d2ltK2MySWRMWjFzdEE2RmVuaTJTdG1BY08zSW1HMjFzS1FReTBKTkx0RFJj?=
 =?utf-8?B?bWd0cjlkVUtjSWQ4WTFZd1VzdndKODFRQnVvc0Y3WGN2TzRXTDllYjUwdUwr?=
 =?utf-8?Q?WoBL+XePRYg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFQrZEs3byszN1ViUDN5ZkVTV3dMZkhlY1ZrTkVWT2RPWS9vRWlKS3dGQVV4?=
 =?utf-8?B?bHJQU0R5R0tjdXoxcnh4bkJpL1c2a3VZdTg0Q09FME1iQUR6NERTMnU3YThi?=
 =?utf-8?B?QTE0RDAwSVNCWjlBVFd5UGJrOVRBYlhMMVQwWktETXlkbTRDTHREVFZ1cG1V?=
 =?utf-8?B?a1JYNmZUWVhqTUtTL0RrcVEzSDdjQWdqNGxwaDJWeGNDZTFFVVJXNGtlejAw?=
 =?utf-8?B?YXZiTVQwWUduZkpEMnV3WERvUGN0YVE1UzNCRUJjL1gvTFJRRlRsRGpVSWtT?=
 =?utf-8?B?SFZIRU1FdjNqMlh3Y2dxOW83MUV0Tm0vMVIrK2h5elczY1RBcHJPWWdaaTVN?=
 =?utf-8?B?SnRSaytnVTVnNjIya1dVc09KK0JFR3ViZmoxUHljOE1kQTJ6MkNoVGdBMmhD?=
 =?utf-8?B?cnhER3BOUVlBTEc2REIxMzBMS3JiSVk3NkxNaVhKMEFHdHVPYURYaTBZeGdw?=
 =?utf-8?B?YkFOR1dTWW04blpqYzJlZ0JnblpCMlIwcFNzQ0Z6WStiVHBJcE00L0hsLzkw?=
 =?utf-8?B?b1NrWXF1ZXIyNUw1R0UrZUJpTnU4VjhPOHhkN0p1Qm1NVVNaNmFCeWJrT2dp?=
 =?utf-8?B?UFQ4NWdWb1VvL1lxUklmbjdyU0lUWVlIcU4zTnBlbU00U1Z2Q0pSVTJoN0ZL?=
 =?utf-8?B?YXpDSlJlMjFjQkZsR21weWd1b2tpc2xLWU5hZzc0SjhGUjBUSk9JSHpOSGVM?=
 =?utf-8?B?Rk93emdMYUlhblpmbExxcW9UZmd6QnFQTThERC9OY2o1WTk3aFFUSkhvZUtP?=
 =?utf-8?B?Qnc5TXZPbGZuMk8yWk9Bc2dRT2svZzZKUTVhc0swbEc2UkdSQzV6WGVEa3Fp?=
 =?utf-8?B?Y25aZkIvZTdldlRMaE1XQXJwUTBjejV6SkFhU3J5c2JHTXVaVUhHS3NFeVpa?=
 =?utf-8?B?NjhrZDdNNE5iQzJQRHlBR2g4QlVnNVRuSjJmL0lkUmxodFlOUGNNdERSQU5l?=
 =?utf-8?B?UWV6eTUzOVFER29XZG8yZE1lb2ErNThDUjVUaE1zckM2MzBxZnRWcWpwQ3Bz?=
 =?utf-8?B?VEZPWVVTWE1tVE83d25rc1BZTVE5VFFyN0cxb2lFdmY5REk4YldUeUk2S3Yy?=
 =?utf-8?B?Wk5GeU40M3p6YVU1ZURhL2tsYmlRYk4wTEhCQnpSdjFsbTRBTFpub2s3a1VZ?=
 =?utf-8?B?L1dOUFA4UEpWbGtZUzBabUM0QnFLOVJVSGlTVWZBNWZYSlEzcTZXNDV1cHVs?=
 =?utf-8?B?VXg0aVZFZkJwb0c5YnJ1Ui82aGI4NTRGN3ZDdVJzakVFcWJvY1lYdUczZWFR?=
 =?utf-8?B?Nmo2Wlp0aVRDanpvMU5Vc29mS3JyUDlTRHZrR1pkNnovazVCMHQ4NTEwQk0z?=
 =?utf-8?B?aXJaRkdVcHZVMm5VMzdZbUtTR0ZZZi80SkRFUWxUVVNqRGIxcEJuY3paQVhI?=
 =?utf-8?B?eXZQTHM0anNNbWtSRDBJcmNrYlNMUWtueXhBaVlMcWxkbEIrN2hEaDE0YmRZ?=
 =?utf-8?B?UkRyL0thNkdZQzBtUU50SC8wMTNvdzZrRTVUMGtGUFFlVHR2K0F1bHFXc0l2?=
 =?utf-8?B?aUR0a0oweEdXUjhqcCtGNUpOdmEwWU13bkpBdm9vbjBtcTNIMncycTRhMy9V?=
 =?utf-8?B?d2FCZkRqSERORWpNZS9SRHhwQlpqR2UwY3VISFNiV3RuVGpVVlIzVTE1Z2Nm?=
 =?utf-8?B?S1BlRTRBTlZLbXJXbHVvYi9qRkFEYlAzL1k3REUvZm41RjBLbFpRcFRMRHlW?=
 =?utf-8?B?L3V2YjVPTFk1Qk9xSlBPWklyOG0vdzA0TmY5Rnp5Ym84aXhJbVN3bXUvWlRT?=
 =?utf-8?B?WXpTaGpDZ0ZNWUVsQXZ1RUFoZWtaa09GeFJaeDFaQ01haUlrLzErWERTbjJX?=
 =?utf-8?B?eS9pdDRKdS8vTTFxOTBXTWNGdzVUb1NvVjRONFRFZ2JpRXhyZDl5QlN3dDNB?=
 =?utf-8?B?ekdqSDR2VUozanV1ZSs0SkNuL05rM1VQRlJXL0w2ZzlZaWtveHdJYjB2aC9v?=
 =?utf-8?B?UkNqSTNFQlZvUVliUmFJcVJwNFBTcEloYjFTc25YS0lsbjMxTHVwZ3k3blUz?=
 =?utf-8?B?Q3ZrOXprczJrOHBPYU54ZngxbUduWjFYblUzQ2NKVkNpUkFnL0d0ZWk1L29B?=
 =?utf-8?B?STJzQWF6WEV3UnBDYURHdk9EanN4L1MxNVdINFh3Ly9XVmFUKzNoY0pTS1Z6?=
 =?utf-8?B?R2x2VUlSQ1NQa2IrMFhUWXVuWU9CSTVlTFN6YWxUdEVheG5WRUpDYVY4c3ZF?=
 =?utf-8?Q?wUxAVmttz5aM6JU8pA5iMjh/WdHQsJcw3ywH1kY5+1na?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde870dd-2026-4855-b1a4-08ddac0c7e89
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 12:59:42.1610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcKXhX2bIT523le2eAmlED2C+VLuj/jLPCgXEXf7+m+UGAlsb7Axo5M6w75uW15jA8Omn3wtFHPLQZcF8NPUvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8809

On Sun Jun 15, 2025 at 12:06 AM JST, Boqun Feng wrote:
> On Sat, Jun 14, 2025 at 10:38:11PM +0900, Alexandre Courbot wrote:
> [...]
>> > +macro_rules! impl_genmask_fn {
>> > +    (
>> > +        $ty:ty, $checked_bit:ident, $bit:ident, $genmask:ident, $genm=
ask_checked:ident, $genmask_unbounded:ident,
>> > +        $(#[$genmask_ex:meta])*
>> > +    ) =3D> {
>> > +        /// Creates a compile-time contiguous bitmask for the given r=
ange by
>> > +        /// validating the range at runtime.
>> > +        ///
>> > +        /// Returns [`None`] if the range is invalid, i.e.: if the st=
art is
>> > +        /// greater than or equal to the end.
>> > +        #[inline]
>> > +        pub fn $genmask_checked(range: Range<u32>) -> Option<$ty> {
>> > +            if range.start >=3D range.end || range.end > <$ty>::BITS =
{
>> > +                return None;
>> > +            }
>>=20
>> From this check I assumed that you interpret `range` as non-inclusive,
>> since `range.end =3D=3D 32` is valid on u32...
>>=20
>> > +            let high =3D $checked_bit(range.end)?;
>>=20
>> ... however IIUC `checked_bit` will return `None` here in such a case.
>> Should the argument be `range.end - 1`?
>>=20
>> Your examples do seem to interpret the range as inclusive though, so
>> probably the check should be `|| range.end >=3D <$ty>::BITS`. But that
>> triggers the question, is it ok to use `Range` that way, when its
>> documentation specifically states that it is bounded exclusively above?
>> We could use `RangeInclusive` to match the semantics, which would
>> require us to write the ranges as `0..=3D7`. At least it is clear that t=
he
>> upper bound is inclusive.
>>=20
>> ... or we make the methods generic against `RangeBounds` and allow both
>> `Range` and `RangeInclusive` to be used. But I'm concerned that callers
>> might use `0..1` thinking it is inclusive while it is not.
>>=20
>
> I think generic over `RangeBounds` is a good idea, and we should
> .is_emtpy() or .contains() instead of comparison + boolean operation
> when possible. Seems we need a function to check whether one range
> contains another range, which is not available currently?
>
> I would not be worried about callers treating `0..1` as inclusive: this
> is a Rust project anyway, we need to learn the correct semantics of
> expressions eventually ;-)

Right, your comment made me realize that my concern could apply to all
uses of the ranges, including the basic and common slice access. So
following the expected semantics and offering the caller the option to
use an inclusive or non-inclusive range through `RangeBounds` indeed
sounds like the way to go.

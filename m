Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E857FC2C6;
	Sun, 18 May 2025 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747566763; cv=fail; b=kVKAbFN+CUQAigmut5FVx1XzHL4mh56s0v5I2XMDrX+YTQsjjtYPteRk+xSkxF4JEUBR9k30wCWeZtFv5KH8usO95fRc/clBABJHistGq7uwFd98Yqq5QBU3SrY/P/foFOAJxarr1sLle59Pu8rd3/Bs91vPNi9hIF2SPlhzerY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747566763; c=relaxed/simple;
	bh=rxemhW6AAghOXv6pt7u1IoQCMAXMHP3idpZsIV1R6+8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=sZjz08yaU1d1pzDmBvQ/WMtgctePwfVbN9wdVVdzgsnf52Mjjp07VzmqDt1M/uUW6cbGSSxLMdC1Vneolgtm1w7IIVlbHnR+L6K1WCiUA0yd/ZsP+CfCvNOX4aa5sY+Ivi2cGy7ZuTaUQUYpoGPxwlKz1UNA1tyAVQ3TlV8HDVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NOVrCJPr; arc=fail smtp.client-ip=40.107.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NOVrCJPr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQIsbUWoEatGDRkU7Ro3IFfoNbrtGrK/rZ4D5lIYP9xa1sgpf5uhbY3n7NAcKSrgXsMBrL+QZ556zMf4+xK0x7N6WbXxt99RnJL9PFHz4uX+6AY+BFHib9m3A65AdcJr2/TD7KPJ4pmb7fVqtHe0znWVT4h0feHbmQoL3AYEDoWv+m7DhxD7oQKps2gDPBw0ksGDbntGfBpWxvu7u5fkqS/oPERmLHnAEM2VHVlw6AF3r9B9lyuDp1uwLnHcdvHG5AMQV3zFL0ZqOFOl7UN/+dV4A1+OvMIqelLx/XNQtnrVpffRWIEm9csIVo182wOhDpqHL3vBkYBv3/NNhklqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3q6FTRilFh5jiz1tY3Ea/vTMRFJKn3hgD0CEur6pOc=;
 b=bIUkHHpXL08d7OMKjDLfHkkvsVB39n1rl4wUJn7fF9GWNPok6yUpYkmTajVlGp5cBq/LUt4H1eSulxt4r7Ty4DxT7NPY/xWlqc17h2v0cqX/hvirbXiRGF5bkTSGULz+x9wvbOcZjyeOvms938VF86WZm39Qb0VrQFkrNORj7ihKmFN8alF+f4DmFRcID/gjMF0VZc+efto6aeFDQxKtFUyKyvub26OqQ+i1biQntuYqWaWSOYXY9EwvYtw5m1VXMVe1aF5Y1anhCYFueqIcpWrCwZ1lVnz31NyPRS2xQRPMlslIlzCSXPg+Qv+OjC/LKh93vbUrC7qAOTkcWwts+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3q6FTRilFh5jiz1tY3Ea/vTMRFJKn3hgD0CEur6pOc=;
 b=NOVrCJPrg+Rv0t72o2k6b+UDyyVbwEmME+aNGEAq9cWKAKIxWJk1H+9WtTEnKx1RxzZe+96aEFV01zRuNsjVjXgqkvA+6B6UTnndfnBbkOYzGfpHEtzo+d1HHQeBdcsXS2JynVzlwv8mjoj9S/tBtHmauKvlJsD1T0Aq85zNU7EPres9aJN3XkXlstf+aRYXjWGbRZYQXpNnyIlX30ouNM/662fpca2Qv/s5t6++lzZdgSJSHZaA/ULfjShG8EQFXVG/IAkGpLYDdgc4MYK5EyYUWNsO5NzUKF1lAxB1BCpQMgdpIsdUzglUpFHVNEZ+RTME7Vfx5OexDPFhwBvMSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6400.namprd12.prod.outlook.com (2603:10b6:8:b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Sun, 18 May 2025 11:12:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 11:12:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 20:12:29 +0900
Message-Id: <D9Z8PLIZGSJ6.254ICGG44E4PB@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <D9Z59JWL4BTC.3DTN0LWCJX5AZ@nvidia.com>
 <D9Z73XZUSYWO.R0P38ASITWR7@kernel.org>
In-Reply-To: <D9Z73XZUSYWO.R0P38ASITWR7@kernel.org>
X-ClientProxiedBy: TYWPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 52dc79db-fa54-47d7-7602-08dd95fce2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFZhWi90S2pBdmthWC9RRmdDTGJoajZpbkVwZjYvOTJUYmRZNDVyUGZyd21M?=
 =?utf-8?B?MGZ4Nmw5cW9COUx0Yjd2OWRLUTN2c29kOXMxUnNubG9VcEY2em9kaUp0ejRQ?=
 =?utf-8?B?eGc1ZnI3cjhXZkpnbFdCNXhGQUtnekI0amdsaUErNmRPdm02NEx4eTZmV2Yv?=
 =?utf-8?B?dVNZQThFT2ZZbkVWV1ZkUWkvZmlSdDdMeHNaa2Q5VmduZFp6ZWFKakhPU3Rw?=
 =?utf-8?B?VnZIdTlDUUFjUEFVNUVYOU5WT1BFaFcwTjJEU0NFMmYzbStRRjA1RU1LQjhU?=
 =?utf-8?B?a1RPS2YrWFIyRU5oRGlra0Z2MVVQcTBobmZyOE0vQWYxVWtRNm5DZEN0Rm42?=
 =?utf-8?B?RVZUcTUxNTRwa2RNN1VWM0dHOTkwTXNOcHZWM1JTYWpzOGh3bHgvdktVd1dE?=
 =?utf-8?B?VTNJN3lXS1BXalh0OWQ0UEw0em52cUNmZnZtV2t0VE5uOGx4R3RtU0N6eGJ4?=
 =?utf-8?B?ZnU4WVd3TUN4QjIvUFZoMWVrUzJkMU5kWUVsdElydm9EYnhwM0Z4OXZmSC80?=
 =?utf-8?B?M01VVlZhb20yZ0hzNlZuUm05UXgxNjNpOTdGcG9nb2hSUHFtSU5ITEpGYnRl?=
 =?utf-8?B?Y3VTOU1pU2RJU1NGeWM2a0g0UnY1OUJjL3JPc3FvQjlVcXp3QTE1RFNzNFVi?=
 =?utf-8?B?cC8yUVR1V01zRkR3OHBiU0RhbmFqK25QdjJTOFBNclNuVlNZRDVYaExaN3pC?=
 =?utf-8?B?T2NLRHF6NTJrZGZSb1ZrSWluSml0NUdCdzQycFI2WWNqVWt2bGhkbHNOMnY3?=
 =?utf-8?B?aHVla0FBMTJVUEs4Q09wNVRRS2N4b0NEcU94VW1QN3Iyck90WTBkcFZEVlJH?=
 =?utf-8?B?enJvVEg4MkRoM2hDMG5JUWhoMkdNdFQ2ZDFxRmdPZmlEcVM2amhHb2h0Ykln?=
 =?utf-8?B?UGZ3Z3VacHl0Tmc0emIvUkIxVWxUR1hpWmJydWE2QklJL1FGSGF3UUxPdnZ0?=
 =?utf-8?B?ZGttaVdrNlRFdWtFODlwRWVUMjljR0xQT0pqY1NUMUVYa0IrL1Y1YXRWU0J1?=
 =?utf-8?B?QkR6ZXZwWGRQRTB6UzFZSm8yQ2dUSFZ1ZEZ5UXNmZjhHbTlvd2ovY1NPRkVG?=
 =?utf-8?B?RzlMR29POVI0b0s3WEdJdkxKQ3QvQmZNbGI1SzZxNEFSYkYyOUd3akhIYytX?=
 =?utf-8?B?MHcya3VQSVF4cnliamMySEk4QUdNL3YvZHQrb2RibVZ5UEVteU96Ynh4MnZC?=
 =?utf-8?B?Wm1xaVFPRjRNb1Z1L2htTEZudTFkMmVoVHFpL1MvVFhYOWNVcnFsRDhjaDhZ?=
 =?utf-8?B?TWVJY3hnUWcwSUd2b1Z3QnVCcDVHTWIvK2NCL3lHN1dqTHVlYUV4eERHU3Zj?=
 =?utf-8?B?S0U0QXNSSkt3WkMra29IMFJsaDR2WnppUVZmZ1hKc2JEOVR0WUJLQ1FRWENo?=
 =?utf-8?B?emJJOUFueWw2Z3ZFVjZsMlJCVTVrRlJMZVVZdlNDdTR2M2J5TDNoaFhVWHMv?=
 =?utf-8?B?UFl1OGdjT2x5aWx4Zk14d2l1QU1mYmxEeElDbFl5SEsxRlNYcW81ZkdwTnlT?=
 =?utf-8?B?SUhJQ0t6OTRFcitOcjU2WEhHVSs1N1E4dWUrRlUvSW83THRSaGV5Tm9NY1ZZ?=
 =?utf-8?B?YWl3SEp4bFVBY1djRWJ5MmFkUFFXd0d5YWZhQjRPUHpkY0hIeHJxYk9yMi9P?=
 =?utf-8?B?Z0Y0S1lnbkFRL3lkK3hhUVZtU3BTMDhVZHBCd2lmZ2FMS3lScXRlWVk0enpB?=
 =?utf-8?B?M0NVOXNiaUYycXdyemEzVXJQSzV0M2ZkRHVHOS9aeTg5OUdxeElVVG5MNEg5?=
 =?utf-8?B?Zi8vcEU5OXh2YXBKVmEyd21zTlRHclB2RmJkcVFRUVNIdHFLcHVjUk9TUkRB?=
 =?utf-8?B?a1F5TXU2TnpHL041T2Z1NjZoMkh1SGJTS3I5Z1BKMjQyOVFaYlVCNlM3azdJ?=
 =?utf-8?B?M1dTSUJQZkI0V0NmcTMybG1zV3ZUZ0lLQm5DUU9SL29kK2txYTRNMlhoQlF0?=
 =?utf-8?B?VkFEQ1l5d1lvN01pdmxVMWxDQkRlL3QyWFpPdURzNGVVaWt2cmU5dzh4bW1h?=
 =?utf-8?B?OXBzQnc0UjRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDZUNktoQmdqK1hjZkh0R1RHU3JqcEdwZStOSzIxcDY4N2FlZjI4RUVPTlVz?=
 =?utf-8?B?S1FkVUZIM1RjRGJUNG9yK013bWlmZlp1a25Rdk1DUUowV2pTd2NhWC83VDUz?=
 =?utf-8?B?OVdUdjZmNWtQVkI2WlA2MkZOTTh0MTJWYmdqSzRXZUJKQWNjK0ZIN000eE9R?=
 =?utf-8?B?UFF5QWczSndNVXpMSXhNaHlnQW5uT0tFY2lCMkRlTERqRjhFeGNwZUpOOE1w?=
 =?utf-8?B?bk5STzR0dXhhNCtTWW1LVVdBdnV6WXFPNFBiMjZZenczRW81eWlEKzBPTnE0?=
 =?utf-8?B?Vm51bDBiOU9nekZ5WVFEa2I3bGczYjRIMGhsQk9QeWRqRG5EN3N6V1VZNmxy?=
 =?utf-8?B?VlQ2Wm1Nbjl6YlZhd0lrS084Rmk3Y3VvSXlGNUNBTStMeTlENTFRY0Nwc3ox?=
 =?utf-8?B?YUtnSWcxVEs1cXBYbXFjRk5hT2hTMG9CRytFRjdtRFJBbU1Ud2dtdW9lb3hL?=
 =?utf-8?B?WHRzRVk0WlRwSUg0RzNwYzdZNkpQcWxiWWoyc0hzcWtNejI0R1R5cUtzS0lS?=
 =?utf-8?B?UnlrR0VBMys5eGF3NGFZbmtjN2E3WTM3WGZIRlkxVGhhTjdtQjFzbFk3L1hK?=
 =?utf-8?B?QStFZlk2ZTdZV21QdDhTVVFBaWxRNWRYTDE0T3p5Um5QLzcrbGJFSEg1WWRG?=
 =?utf-8?B?ZVA1NW9EbUxJZEhmeXBjOGt4bjllQ0RIYmdGQjc5Y3M0R1pibCtzRUJKYU52?=
 =?utf-8?B?WXRqQ3VOWU5Rd1NrQTUvT3JxbkVDWUl4TFB0eE9yKzhZTWJQb0luR0Irelo1?=
 =?utf-8?B?d3d1ZktyZnMyZm9wZ2tnMUFFdjBRSEl3MVBUSE1POXpsK0FWOUJYQ3B4aDlR?=
 =?utf-8?B?amU1aGUxLzYzUVI1aVFDRUVXa1FiaWp4YWxhejRuK2Myb3ZFOXMwNXJ2Vnl5?=
 =?utf-8?B?TEk3STdCSStEYWNSV01UeU55RGtZNVUvV3drMFNOTXZPQzZnVjJveVRaTlZM?=
 =?utf-8?B?cHh6RFBqZ0JwWDBhUzZxcWdkWFBRem1qNlhHOVdQV2dKbENucStVYkdtK1RF?=
 =?utf-8?B?anZxSGhyMitsNVQyU2x1N1VzeEZDcnlNRDl0c1ZQRERtZEJKNkswMGNGZTVk?=
 =?utf-8?B?d3NuZDk5UkhNVDkyVWdoWHVNaFdNdUNjWFAyTGRoeTJEQlpXMU1xSnVSb0Rh?=
 =?utf-8?B?cy9OY25hY3d1cEQrQm5LVTF6QW9OL2tnY1V3cGJDcnd0dGxXN3Z2ZUs4S0tB?=
 =?utf-8?B?elN0VWwxdy9vZXBjTGxNanpQaHN6VDNEQ2gwQ0I2NHlSVWFGaU1TMjFhQ0Yy?=
 =?utf-8?B?cllGRnRBQmNLMzZwZlJkdGowSGRIbjBKWHFlRjNreENVNFh0dmJKR2xycGRJ?=
 =?utf-8?B?d3ZlRlFNcFpwYUJQMEk0RGc0dDZ2L1E2M2NOWlBSSXhobTM5RUtDQzcrcUhQ?=
 =?utf-8?B?Y2NIMHRaN2xiZVk0NmVNL3NpemRvdVp5bjJ1algzZXJzbzhtZnB4bDQwR0lW?=
 =?utf-8?B?QXIvWlpMbjBYNzEvVTlhOHFEYU5Zemp0UlRZQyt0MVo1Sm1Ib3hKNklETWcz?=
 =?utf-8?B?OHNuVE0zZmhVQW9QWDEyN3VTM1A1WnlrTVV1WTVuOWp0Z1pWMlZsMGRQVmdY?=
 =?utf-8?B?Smx6Tm1RVU95MGM3QlZzaTNLbVVtbnA5MkxXYkc3SXpoVWkrY0d1WTUvUHlC?=
 =?utf-8?B?VjJ4T28yWXN2dytTRUxiSlRRbENMMXp3RSt4V0hxMEtrdW5yZTl4TTdYcndG?=
 =?utf-8?B?T1h2K1dIVVVmTDlVRmg2bmVDYUlnMmNhYmtmNUphQWY3NlJRSnhaWHFvV0hR?=
 =?utf-8?B?SkQ5emtYUHhWL3NFbVBUVVFQdkViQzNKd084QXhLYlFWODJVeGpYT2E1ZkFt?=
 =?utf-8?B?cU5zMXZocjBGcnNLSHdOa1N4aERBMDBXUWJYbEp0Wjl2aDFsN3lkSWdvRmhs?=
 =?utf-8?B?MEgyL3dKNk9IaUd4YlJab1Z3dS9vZHBjQkRtNTF1YzZNeU5tUndtNHNKV3Z1?=
 =?utf-8?B?RjMzS1FEOTZtYklFblRuOXBKSUdGbit3VVAvV0hkNTZPRWdvWG13cUJIaUR1?=
 =?utf-8?B?NTIvL0pVU3pOTWVtRTBYaFphS1hjSE40YkMvZGg5Mk5UM3pOR3g5N3oyNkJN?=
 =?utf-8?B?YitrZml3MUhaVnZRWDl1NW1lenc4bDFDQVlnRUJBSWNsV24yTExHYjVOVHgw?=
 =?utf-8?B?YnFaMlg5QVBGWTZ3UVcxcWZZdkNiSjVmaVdLT2gxcTNFekloZUZaMU0xNW91?=
 =?utf-8?Q?Y6B7dAv8HQhIQah/N/sM6LSFvzyKWPbGlLmJ5JJOmPCr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dc79db-fa54-47d7-7602-08dd95fce2bc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 11:12:33.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OK484Z6WhM5qkhlrZACX1fUN7C8t8Fquf7ru1V2JlPKIWYIhaZYa3dqi/4CLPtQ3/g/pwz2KGpb/VXVvHhfq3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6400

On Sun May 18, 2025 at 6:57 PM JST, Benno Lossin wrote:
> On Sun May 18, 2025 at 10:30 AM CEST, Alexandre Courbot wrote:
>> On Sun May 18, 2025 at 5:14 PM JST, Alexandre Courbot wrote:
>>> On Sun May 18, 2025 at 4:19 PM JST, Benno Lossin wrote:
>>>> On Sun May 18, 2025 at 4:28 AM CEST, Alexandre Courbot wrote:
>>>>> On Wed May 14, 2025 at 12:44 AM JST, Daniel Almeida wrote:
>>>>>> +//! Regulator abstractions, providing a standard kernel interface t=
o control
>>>>>> +//! voltage and current regulators.
>>>>>> +//!
>>>>>> +//! The intention is to allow systems to dynamically control regula=
tor power
>>>>>> +//! output in order to save power and prolong battery life. This ap=
plies to both
>>>>>> +//! voltage regulators (where voltage output is controllable) and c=
urrent sinks
>>>>>> +//! (where current limit is controllable).
>>>>>> +//!
>>>>>> +//! C header: [`include/linux/regulator/consumer.h`](srctree/includ=
e/linux/regulator/consumer.h)
>>>>>> +//!
>>>>>> +//! Regulators are modeled in Rust with two types: [`Regulator`] an=
d
>>>>>> +//! [`EnabledRegulator`].
>>>>>> +//!
>>>>>> +//! The transition between these types is done by calling
>>>>>> +//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] res=
pectively.
>>>>>> +//!
>>>>>> +//! Use an enum or [`kernel::types::Either`] to gracefully transiti=
on between
>>>>>> +//! the two states at runtime if needed. Store [`EnabledRegulator`]=
 directly
>>>>>> +//! otherwise.
>>>>>
>>>>> Having the enabled or disabled state baked into the type is indeed
>>>>> valuable for drivers that just need to acquire and enable a regulator=
 at
>>>>> probe time. However, there are also more dynamic use cases and I don'=
t
>>>>> think the burden of managing this aspect - by either performing a man=
ual
>>>>> match to call any method (even the shared ones), or implementing cust=
om
>>>>> dispatch types (which will lead to many similar ad-hoc implementation=
s)
>>>>> - should fall on the user. Thus I strongly suggest that this module
>>>>> provides a solution for this as well.
>>>>>
>>>>> It has been proposed earlier to use a typestate, and this would indee=
d
>>>>> provide several benefits, the first one being the ability to have sha=
red
>>>>> impl blocks (and shared documentation) between the enabled and disabl=
ed
>>>>> states for methods like set/get_voltage().
>>>>>
>>>>> But the key benefit I see is that it could also address the
>>>>> aforementioned dynamic management problem through the introduction of=
 a
>>>>> third state.
>>>>>
>>>>> Alongside the `Enabled` and `Disabled` states, there would be a third
>>>>> state (`Dynamic`?) in which the regulator could either be enabled or
>>>>> disabled. This `Dynamic` state is the only one providing `enable` and
>>>>> `disable` methods (as well as `is_enabled`) to change its operational
>>>>> state without affecting its type.
>>>>>
>>>>> All three states then implement `set_voltage` and `get_voltage` throu=
gh
>>>>> a common impl block, that could be extended with other methods from t=
he
>>>>> C API that are independent of the state, as needed.
>>>>>
>>>>> To handle typestate transitions:
>>>>>
>>>>> - The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
>>>>>   method to transition the regulator to the `Enabled` state.
>>>>> - The `Enabled` and `Dynamic` states provide `try_into_disabled()`.
>>>>> - `Enabled` and `Disabled` also provide `into_dynamic()` (which canno=
t
>>>>>   fail).
>>>>>
>>>>> Essentially, the `Enabled` and `Disabled` states simply enforce an
>>>>> additional operational state invariant on the underlying regulator, a=
nd
>>>>> do not provide methods to change it.
>>>>>
>>>>> The `Dynamic` state would be the default for `Regulator`, so by just
>>>>> using `Regulator`, the user gets an interface that works very similar=
ly
>>>>> to the C API it abstracts, making it intuitive to those familiar with
>>>>> it.
>>>>
>>>> How will the `Dynamic` typestate track the enable refcount? AFAIK one
>>>> has to drop all enable refcounts before removing the regulator.
>>>
>>> I guess a choice has to be made about whether to just proxy the C API
>>> as-is (where an unbalanced number of enable/disable calls can result in
>>> a dropped regulator still being enabled), or whether to clamp the numbe=
r
>>> of times a Rust consumer can enable a regulator to 0 and 1 and disable
>>> an enabled regulator in the destructor.
>>>
>>> The initial proposal does such clamping by design, but I also suspect
>>> the C API behave like it does for good reasons (which I am not familiar
>>> enough to be aware of unfortunately).
>>
>> Well after thinking a bit more about it, it is clear that is does that
>> because a single consumer may need to ensure a regulator is on across
>> multiple internal states. I suspect we will have Rust drivers complex
>> enough to benefit from this behavior sometime soon.
>>
>> So I'd say the `Dynamic` state should probably mirror the C API as
>> closely as possible and not try to outsmart the user. The
>> `Enabled`/`Disabled` typestates will cover the simpler use-cases
>> perfectly well and ensure a well-controlled enable count.
>
> So just let users ensure that they always match each `enable` call with
> a `disable` call in the `Dynamic` typestate?
>
> That is ok, if no memory issues can arise from forgetting to do so,
> otherwise those functions need to be `unsafe`.

There shouldn't be any, the only side effect would be that the regulator
stays enabled when it shouldn't.

It's also easy to implement more behaviors using more states. For
instance, `Dynamic` just proxies the C API. But if we also think it its
useful to have a regulator which use count is clamped to 0 and 1, you
could have another state that includes a boolean (instead of being empty
lke the others) to track whether the regulator is enabled or not, and an
`enable` method that only calls the C `regulator_enable` if that boolean
is not already true. That way you remove the need to mirror the calls to
enable and disable, while only paying the memory overhead for doing so
when you explicitly state you want this behavior.

But maybe I'm overthinking it. It would be interesting to hear to core
developers' opinion on whether the C API can/should be restricted and
guide the design from that.

> Also we should clearly document that the `Enabled`/`Disabled`
> typestates should be preferred if possible.

Definitely, build-time guarantees should be used whenever possible.

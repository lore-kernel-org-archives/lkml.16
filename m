Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2061.outbound.protection.outlook.com [40.107.212.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B15253939;
	Thu, 19 Jun 2025 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340907; cv=fail; b=TyRYo3iMXgF+xou/aNAhtp1TcWbf4r85LsqsBImt1cOu8DbuunGlVu8jKgWZFkRnLApICNMqAA+S4ZPkom6ibVqCsnuvZRC0r+osADO8YdImURCNMJAlG0YDM4aNXKu6P4pKBAQrPSQLrtipi7AoiSEWeECl0GDmjhOAyiGjc4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340907; c=relaxed/simple;
	bh=a0ALJqFaufmxH95x/VhoNpl3MV5J7wQRDCwEZxIyWRE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qKF0fhOciUXyGvXcNR0YGdJ6K/JkJfhAeB5NablQ6KkoZwxdQIqKiLCoU9Gh8ZBZXXExEXEmUWrSZb+wDuo/xFz70NdLeQxop5QQIsJ3F6B2HwZ1vfemIO3tOg1giB9hmi1Ex5/kJ0Limyt+fpnqh8IdOnAlXTG1TjYe6NJs7os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qomgvr0i; arc=fail smtp.client-ip=40.107.212.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qomgvr0i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfiS9Qn1WRSfCImyVfk2LbyDf4MsI6ObViPnpixjm78UBP6w02Z2l7llUxkp4JkRMK2BQHsMFQ7sZWctSFSfDR1z9Vy8qdIw/GdxvoZ3HWv8pPkcxNO56PJLxorNWnD74lJDkhFIhbvJRpXjJG53Pztqq3BZI17R4IjcIyXG3Rb5SBKzQcXwwTmpjfpmMEj4V2UowNT3YR7poy3m8pSr81uwcinkqvdwYDyRil+krkv9gwthbta9W0kTXZVdZYVAZ/T3fx0oFXPSiNPL7CRSBzy/2fOclTONXl0rpZY/tf+S6cS07xtVpOhAFe/vSR3OYr/2k6YnxkgcagM2qIRiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0ALJqFaufmxH95x/VhoNpl3MV5J7wQRDCwEZxIyWRE=;
 b=gbAm+j1gqI9758KzxQH9qOxT/PBBf9L4oB22qv9d7KcMO5pNfDfZt0ZY3lgm0zwB+8FURArUVLqY7AYa+7ooQXbHmRENBB67dHCt9bOppQ9NCMZYUO3P7XIA7pTWkj/uHYEfv+egYNF4ev580Lh8GqC1UAPVOmfWBfDDXjZCvW/hgPbdblQn1rrObyNKJY2+HS/mP8iXJYLBeOqgv8QtboG/rsdbqETZW/KGu8ipr0Zy3IL6DaKqT7qkc4sQxgnE0wVkIXK6c/zrA1lvgL87upRg3a9NrSu1xhekzw3sfmtGlC6pnwdF9kLCVAuHwYVQyockQONEx6oc1eAOAReHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0ALJqFaufmxH95x/VhoNpl3MV5J7wQRDCwEZxIyWRE=;
 b=Qomgvr0ixrl1/Zs8jl5IfGo4XqYwOEHlOzcZ6HP6VRRMvOZFvDUXNIhsLbTmITWMqqLN6l5Ve3/WaIrl0/YoMEwocw+rQL2VwAsXYvhFUmD5WxGW9dFioNZqhku9x978/g0Y1WIxL0p2/c7rIY4nsgdR84OIAL+2B2XZNbI76bqXJQkflvsGQPfRo4uAQolm878O0hh7HfwUzX0WQr08ixJMlwFCqYc9iY+ZQVyWv6UuKcJOZaW0avjBSnkKjyxzQ+uqda4uv/GygMWPvafpSIwiggcbI2XwpeNDJyybxzT8SJxInDTeKoMXS96WpeV0buiSZdADq3SdCMfSy8RRAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6783.namprd12.prod.outlook.com (2603:10b6:a03:44e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 13:48:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:48:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 22:48:18 +0900
Message-Id: <DAQK2C3GQ5MB.1XV256W5V0ZTY@nvidia.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] Various improvements on clock abstractions
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Onur" <work@onurozkan.dev>, "Viresh Kumar" <viresh.kumar@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250616200103.24245-1-work@onurozkan.dev>
 <CANiq72n0v7jinSyO85vorYRFB=y5NH5roW4xLRjwZz+DFJ5QSQ@mail.gmail.com>
 <42151750134012@mail.yandex.com>
 <CANiq72n3+qzDCCf0ct-5gtQHKXDbT2rr1fgxVQP4qBW69JmmhA@mail.gmail.com>
 <20250619064534.nipg4rs2gwepxqw2@vireshk-i7>
 <20250619130551.388da2a2@nimda>
In-Reply-To: <20250619130551.388da2a2@nimda>
X-ClientProxiedBy: TY2PR0101CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 287a78ef-b91c-4cea-4f9d-08ddaf37f445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXRlMFJ1dzF4K283MUlWOVhOYndkdk54cW1jaFVSUEl3dnJGclJxcms5MnNl?=
 =?utf-8?B?SkNCZ0N4V1JyaXZtTWRwUHhEb3dLOUVBWHU3S25oMllqbXlZTy9kQlRqUmln?=
 =?utf-8?B?QnJYUk51c0N4WkxObHJwdGJkVjdkZ0JtMHFaaXZmeGlzQjIxZG8xMEhGV3VI?=
 =?utf-8?B?aDllNC9ybXJPSmxlREpwWmVTTUxmNmdmQ2djbFZqMWM3T0VxZGtWYndNTXdu?=
 =?utf-8?B?SXhYc3Jjb0pIQWNUSURpNno4ekFscUtwTkdXZFl1V0w1V2pPb3MvZUl0cU40?=
 =?utf-8?B?aFd5bjQ5SWh2VEM4TWhXSHBzcmp0OU8weS96dVRUaWJNckptOGlPYjRHcHVI?=
 =?utf-8?B?TmlFN3BkUHhJS252OGlKaWtiLzI2UkxGUklsSmxHclRhTmZxdFJmZHhjNFpJ?=
 =?utf-8?B?dWFrVzJScGtBNlhCRXFMR2FjdFRQNElQOGRDSnIwRTk3MEtVNG0za1JCaDFB?=
 =?utf-8?B?blhMc1J6MndYdWYvb3hCS3lIYzFyTUJxSXBPSndJeWd2TGw1bHhPZGR5WGlQ?=
 =?utf-8?B?RVRwSEdIZDQ2TzhMTlZtK3dSdDU0bXVQUkJvRTdVQVl5UG1GZzU3cmJ2czNo?=
 =?utf-8?B?T1ZKRmJOa0tCWUx0aWJSY05xR21OTVdxNjJyQ1dXeXVnMG0yWWJFZjhkVDVl?=
 =?utf-8?B?ck1WUVlBSUtXRmgrdkM2NjIycUpDRENSVDVhdTRGdmJpbjhNVWM1d1ZlSm9D?=
 =?utf-8?B?VFR5V3grMFR6SWZvVmNEVmkvNlFrL1hkY29zbWxablRBVG5PbkRMeGg0NEpo?=
 =?utf-8?B?aTdEMFpsMTAxZ1Z5NFFkSk9waHg5bGRPcHlKM2FYUjZEaFBWa0JuRVZNemw0?=
 =?utf-8?B?Z2J0UTBGMlZGNFkxWGgyL0EzL1d2L0w4RlJFNUtlckVwSTc4YU1aTzdxaDY4?=
 =?utf-8?B?cUdQeE5xSzVnc0FqY1BZcHdDeE40bzUwMFVtN2pRWGNaYUtMMUVmaUJYamFt?=
 =?utf-8?B?WjdIdFNrODFRV2twRGlmcU1heENqSFJ4Zmw0Q3ZVNFhYUkphc0QzcldFbkgx?=
 =?utf-8?B?Vnp5eGR5N29JbEJmeEtOaW1mdUtNL1htTlE2d0tMdW4zMzV0SlJkckRSdWpQ?=
 =?utf-8?B?KzFTRkEreStVakhTbFl6MUlNVzlNMnlWbVpxS04xenVaNHdwQ2RyVmFHa0s3?=
 =?utf-8?B?OE9uSVRRSHBHUWdZOHlSOWVpd0duaDNTdUtmY2VTSlArSG5UT21aVVdkcXkw?=
 =?utf-8?B?YXFDdEwyV1BtakFvS2FHSXdYYmFEQWxjTFpqMHVQWHlrSkVJUExCMWhONEht?=
 =?utf-8?B?TkpwdTh6WFlZc1dGL1VnZVRBS1luN0xZSXBVZWc0cE9rdHg4SFNHWnl6cllG?=
 =?utf-8?B?NjJIWG9Tdm9YM29QQlAydWd2VmZYV09JQ3BpRURaVUFueFlNcTMyWEtpM2t3?=
 =?utf-8?B?M3cyWllwZjZiakZJanB4RzhMQ0RNdUxrRUgvb0U2bzAvcGhRQ3lIYW5UWVhl?=
 =?utf-8?B?MHJjSFdvZmR1d1ZESGNCRHZjSmMvZmRMTzJSYk5HSmxqdGNrbWZRaXo0bWZB?=
 =?utf-8?B?Q0lLdXg4RW03Z3BqY1UwVGdDdlJQOWlBWFNjREZrdnVNNUdYN0I5TzVMSWVM?=
 =?utf-8?B?WUU5bXMvSkQ3M3dYSHpNd1A5UE1XTEF3WVd6ZnAvUTBIT3NhWDc3UCs4RHdG?=
 =?utf-8?B?RGV6UE14dEV3dkdqNzVJYlFCNW9Ha2duOWdVUDBiSDVma2ZFT01abEFJRGVq?=
 =?utf-8?B?NEtrcEZSZlRYclJ3SWJubDIwa0xtS3I0WGVXMjRYcU4vYU1XQmpDQzI4T3NT?=
 =?utf-8?B?WUQyck8zYmc4YnlRMkU1VVhBUVVvZjRHMHN5d1ZMdW11M0MzNndoOXVxNTlw?=
 =?utf-8?B?eXRNYWtYNmV6K2pFSyswak55dCtNVVZ0VHRFbVo2aFdsS1BiOWl3bXZVWTRH?=
 =?utf-8?B?N3krcWtnQUh1OTUxV1lVQmFYMGEyKzVxSWkydHgyRDFGTlMySVdJWkE1REVV?=
 =?utf-8?Q?4qMeRKAOKqo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHBaNjdmNXJvR3FORWlKRyt2V1YxWUlqSER5VWIvWlB5TWNkYmhieEI3SGJC?=
 =?utf-8?B?czFmakFVREpKdVJnejZYcFlLL3RsNUxkendobVYvUk5ocEJpQ0xXS2FkT2hE?=
 =?utf-8?B?all0R3RMKzdFNzlKM0swUWIyYmVxc0pQMGZ3UGlWMjlPWVFHdW1xbTV5bkRS?=
 =?utf-8?B?RUNENDJGMG56SWtKcXZDYjhISEh2QUR1VHN5TnEvR3dnMUVHL2l0em1XSDhu?=
 =?utf-8?B?bDY2VEZ2QllvdnVURm5vK2pUeTNQNkxmSHVBQ3FCM0I5dWFnZnBqOHo1SW4r?=
 =?utf-8?B?U0hIVmpmdm1WOHIvMjBKOWhUMVNOaFg2ZjFWUi9WNVcrK1N6dFUraEt1dU1B?=
 =?utf-8?B?T2pNL3A2dTR1QmZJZW1YaG55Q0VGUTRlR2FIcWdsU3p4MXE1S1Bia1E5RXFF?=
 =?utf-8?B?eWhNampzZzJEUUhHSU1YdGZNYmlNZzM0RXRnZ1lkYW56NXY1V1NlZ0xWWW83?=
 =?utf-8?B?M3JMSjlNSjNQYmVPWk1OUFNyTTFNQjlJTnFlTmZGTkJnc3A2MGR4SGdIZkUv?=
 =?utf-8?B?UEFGdHpIUW0rMDhkWGxzT1BLNU5IOFB4YVZPSlFsc1JWYkJnR2pTL3hvSVc5?=
 =?utf-8?B?NlBlNXFiTkw0UWlMdkliaENWZzdWVXFKcTAxY3lUME5xaDJoUVBZaFY2V3pN?=
 =?utf-8?B?SDhyMFZodU8xRVdlbzRWd0I4em9aRXMzK3pWbnh0UzNkTGV6T05VdlVXUFhu?=
 =?utf-8?B?a3lNSmxPV1Y2RGU5UDNzVGhRYW1NSDVSaEc5Nmh2WTFEUS82bWVQeEd6N3Zw?=
 =?utf-8?B?WEptTXpZK3F1WE96M1d2ZnpwTHVvR1JxNVNLZXdVV2xJUE56VjB2aG5kSGV1?=
 =?utf-8?B?NFovSTdFTlZ5Y2c2OTlBS1ZqU3hIL2hIamN6aTlBckRBazZoSGRGV2cxSGs1?=
 =?utf-8?B?dU1hNVNOOVFKb3pSYkUwbjliWk5NNE9zdXlhV2hlNkxLSlEyYnlvVmNmTUNJ?=
 =?utf-8?B?WU1XMytQYVNCZlZ2NklwcmE4bVoveHo3Z1A4Z2FlS1NPb3dZMWtPYnE1bTdC?=
 =?utf-8?B?N2hRQUZSSVptYzlnYVRnclBINmlqcVduUUdhMDlxL1krOXd6dDY0bXZMbmxI?=
 =?utf-8?B?clZ1SVJ3OVJvSEhKT2luTUxKejBpZzZXOERiR25ORElKZUJVMmtJK1VxaG1Y?=
 =?utf-8?B?VU01MVJtWm8rQkJSVUZLVDlBMUV2NWVSUFRDMk1mZGlDL0tBVWJReEo0K1NN?=
 =?utf-8?B?Mnl2cHlJMWV3THZSb0hwSUtnYjhPTW15enYwS0I1UXVGYm4zZlFpbEtjVmNt?=
 =?utf-8?B?citZRE16WFRyNkdpWXhlOXU1M1UvSjVJazdwbjF1MW9aUThXQWdmVEp6c2Rp?=
 =?utf-8?B?LzNEYmphLy96cXVFOEhucXZ5NTRyZzJIVjBORkQ4L0FFNnl0V0ZmeFN2T2dT?=
 =?utf-8?B?YXlpNks3V04wazRxTjFkZ2JpTGRJN3pEQ25PemxZY3dSNEpUQjNEOXdhRW5S?=
 =?utf-8?B?MllkSnJDRThDT2tkdHR3dzZHWWRURjVBZi9nV0JuWHVlOHBpbnZ3YTZHd2sx?=
 =?utf-8?B?RnBzaVExR280RDE0c2VRWmNPcnZTSGpiRnVOR012Z2RIVHRlcGU3cE9JT3Iy?=
 =?utf-8?B?cG1vQVBiYStjTk5uNnJ5R0czVW5LRWI5QUVTaGlVUnIrKzIxMzYvSWJESFls?=
 =?utf-8?B?d2VML3Jxc2FjT2xWMmt6NEJSV1NqVkNSRUZYaExUeHFlVldCNEY3TnlGeXd0?=
 =?utf-8?B?dk1UUzFuZFNrZy9xQzQzZWJMeDVqUTJqei94QUtrbHoxbXFMZHlHSDV0ZVRU?=
 =?utf-8?B?bS80M21qa0E3d1BROEVZcUphR01FOTZkbWFoU0hOVjhDOHYwbmpaZUhFUnJp?=
 =?utf-8?B?eFJNSVh4cGxMZHM2T2VtYk1qU2NQV2pLZ29sS0k2Ry9scEl6cjBFb2UyNmFR?=
 =?utf-8?B?T3RFV3lmaDZwR3NZNEQ4QUJmem9kWEJpbTg3TWJvcFUvdjRXd2RSdUpmWkEx?=
 =?utf-8?B?bTY0Vm1NMVhEaFJzREJzeTdzNVVJb2hOWG5iZXZHRFZEMXMxUzVuQnhCRk82?=
 =?utf-8?B?SzdldUpocEpSZTl6VjhndVdpUXowejdpYW1CRHVUWW1lNmwyTzlwaFJzQWtW?=
 =?utf-8?B?N0pGTVBpYklRbEJYUThFTHR1enprZE9VaGZDS2tqSW5zNE1tb2lUKzBuUmxR?=
 =?utf-8?B?a1Q2Rkl0WnlXMFFZQjluUnVKY0wzL0hvTGdnTVNjL3FCbGRSMk8zSGROTlpm?=
 =?utf-8?Q?RSMqNK6NDk5OuflNjMbAauovW61qNcGlF/arkVbPtAEX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287a78ef-b91c-4cea-4f9d-08ddaf37f445
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:48:21.4238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVuERdJ+riT3iT6yELlgU3meXT487IFTaQxAy4wFaEmD09Vn7mIeUfBAkqxuJf/FPzxVuh0FgCZ13UdeoY7MVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6783

On Thu Jun 19, 2025 at 7:05 PM JST, Onur wrote:
> On Thu, 19 Jun 2025 12:15:34 +0530
> Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
>> On 17-06-25, 08:55, Miguel Ojeda wrote:
>> > On Tue, Jun 17, 2025 at 6:28=E2=80=AFAM Onur =C3=96zkan <work@onurozka=
n.dev>
>> > wrote:
>> > >
>> > > Yes, it should be "Onur =C3=96zkan", sorry. Should I update that par=
t
>> > > and re-send the patch?
>> >=20
>> > I would suggest to wait for other feedback, and then you can send a
>> > v2 if needed.
>> >=20
>> > > where my patch converts this into a single straight line which I
>> > > think makes it more idiomatic.
>> >=20
>> > Up to the maintainers :) So far we have both styles around.
>>=20
>> I am okay with all the changes, the commit log can be improved as you
>> mentioned earlier.
>>=20
>> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>>=20
>
> FWIW I split this patch into 3 parts and sent them separately as it
> was suggested earlier by Alexandre.
>
> Here are the patches I sent yesterday:
>
> - https://lore.kernel.org/all/20250618092810.29370-1-work@onurozkan.dev/
> - https://lore.kernel.org/all/20250618093508.16343-1-work@onurozkan.dev/
> - https://lore.kernel.org/all/20250618091442.29104-1-work@onurozkan.dev/

These look good! Small nit for next time: since they are closely
related, please send them as a series to make review (and merging, as
they will conflict if not applied in the right order) easier.

Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964661A2C11;
	Sat, 31 May 2025 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694830; cv=fail; b=FD5/CuJ+ikqO9HZrNN+k20g/U0I9+8rHKRbdhyy+n5UEXZGFD/YKbMtrpmeFjrqvqc+VuapKBugizpZfmlXVogFSvhcMy2npTIXrHZYVSvrBWjlmk9Du965IMU0mk3479jEDy+LB02LyXXXJJ7XktbWy8y9FmUBq0GxpHIaNybs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694830; c=relaxed/simple;
	bh=sZBjLuQz6FPNZL6Fz/DiyDgGMHHx3V5PDZEPU2WiUvM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Skn0M6ldymQ8ABSPby1+GywGSEiPSdsfNDeKdHYzN/++6VFsxdOGUy0567NJZYX5Ny5uO4wW/XKbAyrBxwBJvGSpgLrqxVXFgWTc5JO3I1/SVB1lJpQr5BRndqlvOb0HT1tnGq6IeoG4bvoFee+qfy7QTGT7ZJJxpmCh6zjeGLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rXlKBDm7; arc=fail smtp.client-ip=40.107.236.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rXlKBDm7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGx4dS3nY8x0AIi7qs2RqEHUwaec62pUsOIsYcVGQj7XF7lsH8qX15gbB7BaB3tgP8/EhQid9lta1ymoZIZfwn7Rn5zCqYAaI9gaJOSzcfB4npI0ObC8yHShr3i/PcW8VnxTSWbw7UQLkBwoOYyMph0tHcriDcSZs01pWDUoZiqJ20pzvWpGwAtwydpjDhJrgg0zQXuWpd4eUJ9Ka+R+W0pmddDjhrVn2GYhfbmPsgghLk7KQ3E8go3I/ikmmTpT2vl6E+5QWRCnw5XaUXEPe/pdAIDxZQGgTSzuxNvx+4RvQkTrt0bCOTnN2D8XgX9GXT4k0MHv9tG31kbemZByAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZBjLuQz6FPNZL6Fz/DiyDgGMHHx3V5PDZEPU2WiUvM=;
 b=pxy23ehWdWqnlPQZcMU6AQq78Az9TgSzh1F8JegNIL6Q4y0vga/uQVb06dOjDSQtLY4WQSNDwlk5Jgf4n02+I/hUWOCiDdzwM57hfpFLFKZbffSJrhgOC5LGPy2RkI8VCS/voeJy3dzWawWajGhxIk34EIF4lV/3iXkKkpQhRfTQHNKZtAE1zFJqUrWavQK84/eOpTEsEGvfMKvWMtj3gVcYYdD87kkmGeWMnLoJPWRG/T5dZwyiZqlbuei1iDea5Tocoj8mB8uVx28rEMrCzFOwt/zWV8jCbi5/uB6e3Af0PlmQ+RLtQnNecec5U9fJ1JVC9X+weVZ1Sv6zAIBMnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZBjLuQz6FPNZL6Fz/DiyDgGMHHx3V5PDZEPU2WiUvM=;
 b=rXlKBDm7GUwbDPcoxfFKrKu6poHmaDcyTvyRtw1BgVNXpYtbSKMihG+Ea4f7WC9jmi0fPW/Ze5s84fXfw2CmUTirsgnTDBimT8f4S5cnYsjVco6WqP85dds/F7SQHcZ9j85sdTkZULw6HcnfLL0X0BDiLKV1ipbTOgi46kfrL53lry4iuRhF7nuHC2fpXkwId7s4qiLQGWAnyaTWRisf+jMM+q0OUz6ObmEUl06MZJcIOhwNrv3vaCw+OJ+3eKMO6cfmhi0BaBXlafIPnQfGowUfLfhHxFhyenP9KQZKrqMYxp834KjLoYel1ca+xUx8EFMsMqhumt20pyXQuAPl+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8941.namprd12.prod.outlook.com (2603:10b6:a03:542::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Sat, 31 May
 2025 12:33:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Sat, 31 May 2025
 12:33:42 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 21:33:38 +0900
Message-Id: <DAACKTM8B9A1.3SI9LRGNMSBH3@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Timur Tabi" <timur@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
In-Reply-To: <2025053148-gore-badass-1d1d@gregkh>
X-ClientProxiedBy: TYAPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::24) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 241191d7-ccb9-4d8b-c039-08dda03f6064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2pLQ0lIUTU0UTJXbXRncGFnbytNRzg0VW5FTWZmWEdpQVYwYjhzbHVWTWl5?=
 =?utf-8?B?Tm5WSzV0dWdiWm1Fam5SNGxZVmJESDlOclRFY2hrM213eHVJakNLN2NUVHRS?=
 =?utf-8?B?ZUN4cUs3ang1R2hkWjhoU21yTDRnRnFXUFRQTm53ZTJqQnk4UFhpbXllemhL?=
 =?utf-8?B?Z1JrVGpjcGNYdWVBWkFrZGRaSitEdEEzTEJQcEdwY2ErSVJ2Njdzdk5nK2ZC?=
 =?utf-8?B?dEdrVGFrd1pPckpjSFZZWnJWQS94ZFhMMDZpL2h2RGdQR1g5Zkh3V3VXb1J5?=
 =?utf-8?B?YTlicjFGamZ5Rk53UFljVm9UL1JpcFZDdjZ5S3MvY1duTEtLTlZrSGpqQ0Yy?=
 =?utf-8?B?cmJrM1pZNkJvZ0psVmVVQ1dUbVdkTnZvVXFoc0xzQkczZm45a1FHc3p3WGkz?=
 =?utf-8?B?b3VCN0hCT0ttMzBscENjZ0NYZGVRTzcrRlFuK1Y5bWF4byt0WnBtT2FUbW0z?=
 =?utf-8?B?S0t6S1l5aldlbHZSakpBUXZLS0VsSjBjSVk3dmUzL05RVDFnbFJuN0hDVklC?=
 =?utf-8?B?QVMvL1Vyb1NiOENueEJqRk9Sdk8ySXlialRkbjBRTnRlbUhYeUoxV3J2aVlr?=
 =?utf-8?B?VXdoTFRYUUtKbDE5aWtGeHFSc0crNDJqeHVyaFpOR0R4dG91OUJQQThQdTg3?=
 =?utf-8?B?SlZnMldTMGhFOEV2SFZkMEFPcmZLRFZaeldoZXNCUFJQY2kvRktKbi9EZDNh?=
 =?utf-8?B?RC8zbDBWT3dCNTFPWjdKMndTbTNUQm42eWhzSXhWU2o4ekVQNjRBaEVKRzcz?=
 =?utf-8?B?VHI5c2hUUVBQai9Bckd6TFZhVVl6QkdLVjIzUi8wV2lnM1RZRklMSFEwNjRS?=
 =?utf-8?B?YUl2b3NXR1hGRkNmc2ZJK2FkZUo4cHBqU2VkOTFIYTJuZ3hpYysyc3A2NE52?=
 =?utf-8?B?OEsxbGVjZ3RIUDltQjF3SDd5SVloS3lZWW1lOWZlaGNuUEJReE5DQU9PS2Ny?=
 =?utf-8?B?S0ZVZGQ1cEt6NzMvKzZlSTlrT0ttZVRkd2ZROWtYN3EyV2w5VHRNY3dIUGhz?=
 =?utf-8?B?MVhEQ0NWT1Voa3RtZzh1WmVycE5OaWUwM0Q0Tm5zMDFjbVBzQ1podTZaMmw4?=
 =?utf-8?B?WTA3RGFPZ3hVZGNGU3pKa3RZZXNJaE8xZFV4Q2lRYmVCQUsrZGZteUFBOUU0?=
 =?utf-8?B?T3gwS1cySm5DelpOVDVTcHdwclhUS0dNcXZPdWJVWEpIcGVQL0Z0MTNxbFAy?=
 =?utf-8?B?blYwSlJFbGxRMU9CRVJzZHg0dUY1dzNCSU5tTlRETVRqMjB6Q29kODJjdmM5?=
 =?utf-8?B?ZXAwRFVTQWpmKzhxc2htWUdTK2t1WDZDa1hrM1ErTzN6ei9TZnc5TE84YXN3?=
 =?utf-8?B?RlBFZWVKem9qY0ExK1RoZ01NaDVvWUoyMVdLRUJaaFlpTHhSZzVNRHJDWmh1?=
 =?utf-8?B?bUt5QVNrMkkwdDlsRGgreHovSHJMMmVhT3pMaEE2WXRXeHR1MWpOd3RrRDh5?=
 =?utf-8?B?ZjVPK3FFNXA2Ym9mNzNGZXN3Nld6MGtsWm9aK3pLNjZmbDRpRjRBd1lveno3?=
 =?utf-8?B?eXZLSEw4RGxMSTJaUW4wTDRXeVRDRjhEZStLL2F2VERtRzBBVmc5dTFXbUhr?=
 =?utf-8?B?dGhSWFFjL0w4Um9LTVpiaG02eXFydXE5TUFUNk91aFhIZmtoRVQ4cDRwUDhC?=
 =?utf-8?B?azdJKzNHckMxTFNUK2tqRDUrck5yNHZCWkN5eVE3ZUhWSEhQNnBWSEFwTnA3?=
 =?utf-8?B?WVd3VlJRWHViZ0hWWGF2aXhDU0dBaVpaSW5tS1RNS3RZVFYzSUFxdEg5U3Uz?=
 =?utf-8?B?NmVoMGNWaHdyWUJ1bnhCM25nd2h2bkp3NUtrRkE1ZzNaSVpNSVVzL0phUWpR?=
 =?utf-8?B?S1RTREFiSkdOSXJDSlFjdUNWdE9VUkFidUFzcGo3N3ZOSUdaWVJnbzRYdGJp?=
 =?utf-8?B?djZLY0M2Z1hiL09EMis0NTNiQmpybXNDZVZOdUZnR2dsRGVGREs3aHI1ZWNr?=
 =?utf-8?Q?tAvTekC/nAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tml0emZmYTMwei85VEFIenhFZWFabmZ6RlFwUVplMnNpNGFzejBLQ3lGMVZa?=
 =?utf-8?B?aXA2RFJxRmdnQXdkTFcwM3NnSWZYREw3SWNETXF1SXZHTWYzaE9IMWZDNkhU?=
 =?utf-8?B?dTNJbC8yeTBQbUUyWEtURDBUdGh0NDY4RnIvYm1YcUFHdmFOUmROUXpKNFg3?=
 =?utf-8?B?MGJ4cGlHUnowcFQzTUVRTHQ5M3N0T3hmZXVQQUJZbVYybWZjNFk1R0psRnhl?=
 =?utf-8?B?eElYVzhSNE9ERmh1OVh0RGpDSDFEV0JZditsSU9sYWV2b1hSckttakhxWHZo?=
 =?utf-8?B?cjByM3k0NEVIVDJxRWdPQ0JXT0gzQ2VnRUFuaFkvK0lCSWlITStRT1RsQ0FU?=
 =?utf-8?B?SEhWT2haSVMyMWlMK0l6ZnNCSERaRFJHS0dVMGlDdHZVNDRYVEc1QUlybU1x?=
 =?utf-8?B?cloxdXY1RjhxcXZHQjc1Ty84SFczak52cVBiVk5UdVo1cmI0aGdqem1YRzBQ?=
 =?utf-8?B?WVJsM0NMNzQ3S0JxYk9sWUlrRFJuY3NTaisza2FwRDVGVUJ2ckg5TDdHbTJi?=
 =?utf-8?B?U1lIbnh2Zk02aFhtQlh6aVBRSWtScC9qUlE5UGFNd0xtd292b29ueDdvWTJ4?=
 =?utf-8?B?YncxOW5Ib09wRHpFbktoRStMMVhBKzNKUzFjcTh3ekdUTUJjcHVDclg1blli?=
 =?utf-8?B?VG9rVG1CeklTWEhpTDEvQ3NOS3dJZ1M2TkhDcTZWL1NpUWxDNWlTWnlpOVov?=
 =?utf-8?B?ZVlqR1V4TVc5T1ZJWllyYTQ5OE9ubW9wMmJWMU1WNFNDOXZ0VXFCZ1IwVjJm?=
 =?utf-8?B?WFc5bkV1eTZtR3Vra3kyOUw2Mi8zRSs5ZFRTVWt6YzNHYnE3K1ErclI1QkRH?=
 =?utf-8?B?QzFYVHlhK2pHRUprUVBJNUhDQVVnWDJWMGJvSGR1YS9FaFQ0RjJWRlJaWGx1?=
 =?utf-8?B?WXJMYXJJc2EwbmVrUnk0dmZ1Y0NOMGxiMitiRjNweDhOeFJhT2ZYdlJEdFg0?=
 =?utf-8?B?YW5qbUUwVDBwUy9VY0tXYy9ra2JOSWwyVU83Z3kvSmoxYS9JeHJ2OUFnd3hq?=
 =?utf-8?B?Sk5MdWN2Yk4ralFZVkFVZmZaM0U3TElua29DWGVMSDY4MWh0VGdFYVl6SHRN?=
 =?utf-8?B?WWdSWUczUXVkSFRNemNrWTMxYzV3NFlEWWlHQkUwUG83YU82b3plSmxsZ1Iz?=
 =?utf-8?B?T3AwRzBJM3pzK2J6Nk5xa0pBQTJrMzk4M2lodGt1TkZwekxobytDR2VWTVRv?=
 =?utf-8?B?N0Jacmw3TEZLTVUyWW0vbjBhT21JVFM2VE9vN3RrQmwvaENjQ21aZEFtL3k4?=
 =?utf-8?B?MFJnSEwvOVBMTHJnWDNLV0htRlJJTFBrT0N2ZXdFNjlsbDNrU2NhN2pHVURI?=
 =?utf-8?B?R251L0R0WDF3ZVVjb2oyMEMxZlp0MFN1SUgxalA4MWpuaytJQkZjNlhGYU9w?=
 =?utf-8?B?T0JpSDNuTEhwb2ZTdVFxOGNaTk12MEt0ZjRhVTBmemRMNmFrT1hrQXZwdGMr?=
 =?utf-8?B?ckJibnVlT2ZTSmdnbUQvbkJjdDlnQW5FWThrQkJwd2ZXbnZDR0xQYnMzTGV6?=
 =?utf-8?B?emVvdWF0R0NNbER2ck1vQ0JjYlVhM0o4UjNwVjRUdlNHMkk2V3RBYzJNb0JK?=
 =?utf-8?B?RlB6cXhZdFVGYVJacU85eUwrbGNDSnhwMy9MS04rcm5uR0tIT1lSQmYvU2hC?=
 =?utf-8?B?ZzJCaXpRcWg5TnNEQlFkQk85OGEwNkJqYlJsblpFQmdFd2RMM1FKYWpEQ1I3?=
 =?utf-8?B?S29VNWFiTGFvUXdRR01NVk5kRnVpZlN4RDFVSkpva1NPR0tsdjF3eEphTDFH?=
 =?utf-8?B?d1hrUTBEWmcvMSt0bDZMQWt6N25oQzY4ZG1oNzFCSWZVSmdqL3lqVys1TVN5?=
 =?utf-8?B?cWdheTg1VUQwRmxadHdlNEc2RmZmd0Mxdys4OVBuZzFzWDRrRU1TUlQzSjlX?=
 =?utf-8?B?dE95Q2pzUkQ0S2JOZldQMEJ3Y1ZiOEVhajJsemE5M3NRbGJFeUlUTkNjVy9S?=
 =?utf-8?B?aWpJdGVLOGd0MU9relVQZWp5bWVGMmVYTS9RZERpaE56MVFRQU5ZNFdaRVFW?=
 =?utf-8?B?RmZySzZRb1QydGczcTIwbCtXQWkrdTBMWGNuaXg1cCt2N3UweENaZkJvWExa?=
 =?utf-8?B?aTNPdnZVTUFBbE5YMEx6dy8rZUpaQTdObWoyZTJIemlBNVljbFdZYnhmR2d1?=
 =?utf-8?B?M2FLKy9kc1lNM3FIUXg4RzRCaElDaWZ4MTNxd0Q5N3VFdHFEZXZUeFh6aGJS?=
 =?utf-8?Q?q8blxuX/Uh6F9CMmYCQu6K4xa1m36hxV4e7xPCxgp4y4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241191d7-ccb9-4d8b-c039-08dda03f6064
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 12:33:41.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3i1ZSmcjcz+cnQnlpUXFMIR6Y8Lz8ETbtwAwrRiW5TFdwB5Wf9CB9IZk+21PpE2zwmYEz+vF/JJpky0cQt+2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8941

Hi Greg,

On Sat May 31, 2025 at 2:45 PM JST, Greg KH wrote:
> On Fri, May 30, 2025 at 01:10:50PM -0500, Timur Tabi wrote:
>> On Fri, May 30, 2025 at 10:42=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
>> >
>> > On Fri, May 30, 2025 at 11:34:02PM +0900, Alexandre Courbot wrote:
>> > > So to try to answer your question, I am not disagreeing that userspa=
ce
>> > > is capable of doing what we currently do in the kernel. My follow-up
>> > > questions to that are: how do we command userspace to do that work f=
or
>> > > us when we request the firmware, how do we provide the result to the
>> > > kernel, and is this something that distros can adopt easily? I'm hap=
py
>> > > to consider doing things this way, but would need a few pointers to =
look
>> > > into.
>> >
>> > Again, look at how your firmware for your devices in your laptop are
>> > loaded today.
>
> Note, I am talking about non-gpu firmare images here (wifi, usb
> controllers, etc.) that are using the firmware download subsystem for
> ages as examples of what to look at as to how to trigger a firmware
> image to be loaded by userspace into the device.

I would really appreciate it if you could point me precisely to one
example (a link, a function, a file) of what you are describing because
I'm starting to wonder whether we are talking about the same thing.

Previously I mentioned udev and CONFIG_FW_LOADER_USER_HELPER, but you
haven't confirmed whether that was what you had in mind or not. Assuming
that udev is involved, I tried to snoop events while a
`request_firwmare` call is performed using `udevadm monitor`, but that
revealed no event related to firmware loading. Then looking deeper into
the kernel documentation confirmed that the kernel does indeed a direct
filesystem lookup in request_firmware [1]. IOW, the kernel looks for the
requested file, and if it cannot find it it's game over. This matches my
observations with udevadm, as I tried requesting a non-existing file and
no uevent was generated. I don't see what user-space can do here.

I also tried to look up this "firmware download subsystem" you
mentioned, but couldn't find anything under that name - I suspect you
are talking about the sysfs loading mechanism, but AFAIU this depends on=20
CONFIG_FW_LOADER_USER_HELPER which doesn't seem to be widely enabled
(not on my distro at least).

What I am trying to say is that I am more than willing to look into
having this work done by user-space, but despite this conversation and
hours of research and testing I still don't have even a thread to
unravel. If you know the answer for how to do this, please share it.

[1] https://docs.kernel.org/driver-api/firmware/direct-fs-lookup.html

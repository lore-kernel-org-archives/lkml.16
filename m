Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDB019343B;
	Fri, 16 May 2025 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747406152; cv=fail; b=NQxnZ4SON5ms0dGBfadq0H2lId0Q3WI3UH9YagI4rFF0h/d6IqcaUzCyAUlasuLY6rQu0MXE24JwyoDSadVcD+KGEJtJVR8nDseAvDIkRkZOuyW+SI5IK8d38ap04IoK54n2F2GMAqWq22PRuc+uqY6HynC4fT6iAWJV4MW15wA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747406152; c=relaxed/simple;
	bh=vgZZTgUF9wDfqy9C0c/YOhoBFF9eVwaBXHRPUhO0PMo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=j4u45Jp6PSc4DlZ/eKm8e5sC4fvC2OFAKO83+iRul8zjVjp6gcMm+jMpBiV++dPXPt0udkzHqo74K0fUm2nXAbsIyt2V6wWqicFMxGD6emmKSoBCrKlUgluj+UZ75k/z81rLt4bw8QRm4vW2mNY/rzO/4vWv5xJ+BrPJ+857UAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NAn9/OUb; arc=fail smtp.client-ip=40.107.237.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NAn9/OUb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKQ4r+Z/mg7KhrG8L71cnnf38cQ+bkKinh7QrK0425IAzj6UIzkiSf+/DABw49BKYmahRCrTOHLpwjH+STAgj32gLhsEc8HOabLb/smEGAT6O/gGHBR5eeMj3EjPp7JVaehPTTBdKAxfoyh7wh4EGHfBV7RtRPjn4Ym2Xljjkqtk51ENY9vAyAS67JmLf7cu/a+4AFhCp11iSCUc++DFvr9DTA0u/Z7hK41IvnXte/fs7NBJveOwcF7xCwwJv1WMpbraWvx2nhrtQNA8ZZSWWqEdPFGXG/ZYuQo5EyBLsTGvCgCzSYQWJfpCOUYw/W/gPbbg6dP8BNrPBy9LkRASsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxQ4LZf3Oo4/IDbvtDF0vG2FK07XYAkhP+3Mp2De5rE=;
 b=N+9xKxZqdumhjI4UDC1m+1qKFoKFo0Fx3/UoqGBAS6oE4drQt47CeolZHDr3MBcARy3BvRKRujeZUAFWUvJ918rlt7DMhjE3HOdGpJPHblDn4ii8dd2m5RcOPGgRL7kStfFh69CHjcfOG+UWDSvsjNz6JgyU9Tmd32KiyW8xXjZBouhohTvHE/60Bzt1OCuuUKNlM2Q9EfZnJirpu9CU3KqevjJj+CiOLnjha0L75Gfr6nBlgTau1Wd4izCAxAa6B+Z9pdR8W8UYXC2u/TYEwovAJp06Fw5L0BL46RQLhiefpyAC7HVFQDzRBH57EQ4reW1uYAI9DlBHuMmDeOnOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxQ4LZf3Oo4/IDbvtDF0vG2FK07XYAkhP+3Mp2De5rE=;
 b=NAn9/OUb9D8xfc2xF951C0iQtAYIMVkBCKyRNlarnlvg/MrFQhObOJHbd4sxwMv1MJFB402zP5fDARYtsSmEStMzd/HiXBnrRU6+HTSw/dW1dOmiteoTztNwVogAPgGd4eFtXsgr26LjJI+dSO0RNdBZAoPMbc6Xu/SKx3+3dXabN9+OQInO9koKlwalIL1TqvDRY2IQ0d5KBBntIp5tQvd1HhHwlFcjk8CXccprbPLKgbEeN9wj2Ot4HfFb8k5ELWsYyYFo8tiOFLAKsWmGmnTSGty1Smvu6iBygURk1Gp++fEoSrkhk/s+Q7qpPKs1fBJ0gErWQAuPXksv93V3KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by LV2PR12MB5821.namprd12.prod.outlook.com (2603:10b6:408:17a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 14:35:47 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 14:35:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 23:35:42 +0900
Message-Id: <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
Cc: "Greg KH" <gregkh@linuxfoundation.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <timur@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
 <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com> <aCc_PSOPkLWTcTru@pollux>
In-Reply-To: <aCc_PSOPkLWTcTru@pollux>
X-ClientProxiedBy: TYAPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::32) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|LV2PR12MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 2485b9ae-74e4-450f-52ad-08dd9486f1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sk1YYmp4QWFqMWNCRkZzTHF1QWFMS3VrVTFHdFg3SVNpVHVMWTg1eGlFT2g0?=
 =?utf-8?B?WlJTelM0Y0JIdDR1SG5Ja2hBZjlobGk2Wi8wRm1FRW1jakx1MmI1dThacEZi?=
 =?utf-8?B?bTNSUkRiK2FTVWtZWDd3NkJXbS9JbUlVTVhCUTNzQmIvZk1pNEd0bEdmbVpH?=
 =?utf-8?B?SFhialVhRGt6S3NITjlhWjJyRzNzTHJPcDRpRzRSOXFOdFpwUnpWb0dUZ1FR?=
 =?utf-8?B?WFgrOU8wRE9VcmJFbk5aQmpJVHJEV3M2NWZjQVRBRG1jalFXK3VYUW9Odlhu?=
 =?utf-8?B?L0U2TGJuRnZZM1F1M09DQ3huNVJORWVjd2gyeW12OU1pd0xwbXlFQXBBaC9l?=
 =?utf-8?B?QVl2R1BFSFdMRGtrZDlrY21hMTBSV0ttS0xvWEFFVDdWMmV5R3lHUksvTUdC?=
 =?utf-8?B?Vjl0VW9Nd0sveWFTTGczckNZeTBLUHZnN0FqN0Z5UlFpeGVHRGFNNmg0L01p?=
 =?utf-8?B?UDZWNGhFWDAvcCtPcVlvYmU2OEZrV1pVZUlrdW9Md05BckxvbXpiRXRud1VL?=
 =?utf-8?B?MnVIb1VwWHB1OUVuN2V2UmxSckNtbUYvY2hnMERuSTFwMmRZOFoweFU0dVRB?=
 =?utf-8?B?VHZXbkFYM1FubzJxS1UzQmJxUFJFTWV3RkUwaTFVc1NHT0VzMEsydjZ4QUlD?=
 =?utf-8?B?TUQzNXJEY1VEVkpXcTVoY0FWU2t2M1BpcUlObjYxZmsvOTc4Y2tMWmoyREVB?=
 =?utf-8?B?QUYwNGZyYVRLQmVHT0FNblJvSUpPb0d3RCswRnh5aFJiQ2g4WmVMN0UxN3hx?=
 =?utf-8?B?QWhvKzZWSUx3elBoZEpGdXZ2T0pjZlJjUUhjc2QxdnNWZGxyS1RzUjZFVnJx?=
 =?utf-8?B?emJ5TitJYlBrWVlRWFIzS2k3UnJweEs0UTRmZlBvdklFc25pVTZ2dW50TnNv?=
 =?utf-8?B?cnU5Kzh1dExoTlQwTDJZcE5EM0t4MXU2aFRHUjF3K0YzbElJZnA3Nm1mYmZt?=
 =?utf-8?B?TEZuZ2ZMRi9KS1NOdUszOVY0OERCRmNNeXZJUGZHc1IrUWZwQTRHT2VqTE1B?=
 =?utf-8?B?aHNySkZEdlhMK1hJNVY0OXFvTHdHMFMzbGJqc0JXUFFsZkt1KzMzN2FLOHlJ?=
 =?utf-8?B?c2VzdXRWUFRSeTU0MzB3OW5hbkVQU0ZkalFCKzJMelhIdUR0VWxIZzE3OHR1?=
 =?utf-8?B?SDM0U3pLZ1JwVnMrenZQVno2YS84OEo2b05rOU4wTmw0RXIyY25UZWNtTERw?=
 =?utf-8?B?d1M1SFdvanc2Zmx2cDZlaUljU2JsVlI1Rmp2UVg1V1hxc0JoYUV3eTh2SlV1?=
 =?utf-8?B?RFdEcDVDVi9CZ0VhWFFtL2JCL0p0ZXdZZmR6Ry9PWVBCQWZFZlJWQUhWOVM0?=
 =?utf-8?B?L3hLTG1iZWhPb2JmT0FrditVWlVYS3FNeXM0OEIwQ0UySWp4WjJ0UzhnOU9s?=
 =?utf-8?B?ZmFkcXFhT0JHdWJFK0xYcjFVZDZ1Z01PMEJHZk5pUGZyTVRnWGtKTnYvcTR6?=
 =?utf-8?B?eXA4c2hvOXFDRTFUWjhGaHBxVytxYVhDNkdTQTVJNTRtZ0VjaitabDVNR2pm?=
 =?utf-8?B?OG9Mam45R0FUMEo5S29NSHhScTZWcUk2SUlMMXRqUERCbzJjZVJoMWJxR2Zj?=
 =?utf-8?B?YVBwZ3phUzMrZkphSzNhMlY1VVppTmJBbjA3UWw4ak84VUovUVRRL0s2Zk9l?=
 =?utf-8?B?Snk5RkZXMk5qaERNK3hmdDVyMUJkcTJ3RE9KRFkvbXlTUVRwN3ErdkZXOHZG?=
 =?utf-8?B?RXFxZllwNWc3MFNQdDVUSjU0UVVvSnZkMElsRXU2VC85L2lTVFNGdzdtd1p2?=
 =?utf-8?B?QXduejFHQ1U4RlhnbWYwSHhuTUpuZFZ6Q294Q0FrYUpSMFplbjlmaGx3OWFz?=
 =?utf-8?B?akJpNC8zUXFVcUJXRWU5T1V2OG5UcTRIY3huMEVpd08rdForcCs4R2ZhVTRw?=
 =?utf-8?B?OXJIOUxSODdnZjI3NzlJYURzamhQdCtlNEJaS1U5ejlJVWN4TlFZeHpGU3Vl?=
 =?utf-8?Q?6wISB14o/7c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlZ4SGl1amNCTVVZcnpxNFRCeDBOZVZ3ajlRVy9iYkNsS1JvRXRLeS92OXFL?=
 =?utf-8?B?MFdYWUZPa3d0OGRzUENFQmN2VXMrOFMycGF1bWFmQmVXMzJIblpOc3IyUWhr?=
 =?utf-8?B?OXJyeDU5Tm8va2NiQ3I5TEkzWVczOTdhaU1DYXA4eGRwamhCdTJSeWhDSUts?=
 =?utf-8?B?WjZ2SnJuYjE4OHdpU0FlUitoSkI2d1NnbnplZXpMNHNCelNCV2Rqb3padmpY?=
 =?utf-8?B?SEl5WGZ6MEQ4ZUZPOGU0TUxCeVlaZVdxVk5uUDE1RkdSOFozb0RSbzFVU0M2?=
 =?utf-8?B?Q0RLc1c2blZyaXlLQU5pSkpORS9ZaWt4cG1tanFFdGptMmRPWW42M1VPMnpN?=
 =?utf-8?B?V2tPOGhwQ3lOcmZUOG1HUGhTUzQ2TjV6S3IxNUFBS1V1cm55aUJNWHJ0MVpz?=
 =?utf-8?B?ZEdWU1h4ZGQyakEvMEFncFhaM0VDOVVEeVlJQW9ZWkVVUDNpNyt2OUFOMmtP?=
 =?utf-8?B?dlBoL0VoYlRHTDVhL3RtUWx6eHpWdUh0SDFhTGRCWlVCUExxZXB3djhrM2k3?=
 =?utf-8?B?Yk84MUVZWTh6N3dOaGsvcTIrZEdhL0U5YTdaVTI0bmlIbmR5UGt5SnpxWFp1?=
 =?utf-8?B?TlNUdGwwMnowWDZtZlFkdnlaWlBTMk9HUTZYL3psNUszWmtyMU5nUGpkazN6?=
 =?utf-8?B?VG1XM0o1Njdoa2hQSVZEOFdNTEJocVpOQnV3QzMwc0txRGpSOXhyQUFOMmxI?=
 =?utf-8?B?QmVMM2d2cHB1T0kwaHZFd3BuVXF2SFRyQngvOHZaMEcwajFQUklMT0oyNGwy?=
 =?utf-8?B?Y2NRNUdiVTFXeVJlZkxWbTZLdS9pVXkzUEY5d2ZWTzJYK1dmdVJVL21SOGpG?=
 =?utf-8?B?WmJ6bDk5SmZucnFOa0N5YTRNVlM0RC9zRUhDVTEwYXlPMDcvK2RVamYyWmRj?=
 =?utf-8?B?WkR1U0kwblVJRTduSmRURUlEZHVQTE1GaVJ2YWJ4WS8zNHF4QnlOR1FtdUxV?=
 =?utf-8?B?ajQyU3JNQzU5a0Nzdk9pTG5vQ3BNNkNoakEreThPbG1tNkJjbVRZQU5heHFR?=
 =?utf-8?B?T0xUL2g2ZzFvV2k3c0RhQ25xb1RWamhpRkFSN0ZjWnpGdFpXTVNVOFVrbUw0?=
 =?utf-8?B?SlYrTHV4THVNcVdPdWJ6aloraHhLZnY2cUZEY0piR1V4eGZXS28xNFhGSVZv?=
 =?utf-8?B?ajVZOFlNYjgvNFBVc2NsK1dTbERGOFpsSVVkTy8zMmlQcnJaZE5ZMUxrUDhO?=
 =?utf-8?B?M3c4aVhNZjlSTHV3aUxQRUJKbzU2aThrQ204SytNUEN3K01HRy8wNEU5TUtk?=
 =?utf-8?B?SVNkaE9BcjBmTHRPNmxHYWtYQ29nSSs5QlFuZUlodTkwdXcva0xHUzFLV2Vm?=
 =?utf-8?B?QkEwSXducGR3SEFOUno3Q2xjdGJmdmZnMkh1UVBVdVQvbXo4aDRPWGhseHJV?=
 =?utf-8?B?UlZIL3ZLbjZDWnovczFIbEY4OEcvemtLVGlOTTZJYWwzdHRUUnNaS3lrYTVm?=
 =?utf-8?B?ZGZEYlQycUR1VGdjUmJPeDFFZkRHRlpIaHc2RlpyMjhMdkx5eXNiTjEzTUwz?=
 =?utf-8?B?M2xkZVJNanJEUjkwcDBSSm15dlk2Z2VVS0VIRmpFaTl6R3FWWmxaZnYvOUxI?=
 =?utf-8?B?Qnc0WnZqTmxtNitTdkJwMzYvVEgzamkrSHNLQzAxSVZJNU5NRDl3NGl3MWhQ?=
 =?utf-8?B?U0RsTlhBQmZ1S0Z3dUVYSGFsMmsvTW1RekJDZ0hjVzNKRkE3d2Fna2NKSk1x?=
 =?utf-8?B?bUFIZXpRZkZmaG9zbkFrdnk2NlkxbDd6bU90dWw1OUtaa1VOczdxR01pRWM5?=
 =?utf-8?B?L2RiSGdoV1JKc0NEQ0lEUUhhczdMLy9PTEZXaFhhMCtpVExBNFk4S1BSOVhm?=
 =?utf-8?B?cG0wYnNOK2ZlckRMRTMzcHI0WlVWcjhuVzY0bXdzY1c0b1lyMWdRUjE4MDB6?=
 =?utf-8?B?UUhXTDlyc2YwVTNsZjdoUXU2S3RkUnJwQThWRGVCdkp6dmVPeTU0VUlTbzhT?=
 =?utf-8?B?cGtwN2VDUjZnQ0tramgweWNuZkxsdDVmZHBYeWY5TVJxdXlEeGRXS09XT0Iz?=
 =?utf-8?B?clRYTkhRMU5NMHlKQnl2aDEwckRCakt5SVNLbngvKzN1SUxjbnlsaTRJOVlL?=
 =?utf-8?B?c0U4bkVZcVIzanpuWGIvbVJGOGMzM2pKVk1rbFN6eVpwNkxvdnZLODdrOFk0?=
 =?utf-8?B?aHJTdmZSTnB0TWZSbVg4cjkzS0RsUTFKRzQ1V3NQRlZ3cHBaL09qS1JuNWZS?=
 =?utf-8?Q?8/VTZ2R5yprfUPOpFEA+LzLwq6TA8/eBNcWYuNCpe27a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2485b9ae-74e4-450f-52ad-08dd9486f1e4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 14:35:46.2914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0A89PV8Q1ZZqF+Jf42i1uFBlM4mLIeaMAjkJbc9zfWgVKeCAqZsuJRtOWQqXPN6rXqL5RAUjkahQZ1+o42Pq2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5821

On Fri May 16, 2025 at 10:35 PM JST, Danilo Krummrich wrote:
> On Fri, May 16, 2025 at 10:26:10PM +0900, Alexandre Courbot wrote:
>> On Fri May 16, 2025 at 10:15 PM JST, Greg KH wrote:
>> > On Thu, May 15, 2025 at 12:17:00PM -0700, John Hubbard wrote:
>> >> On 5/15/25 7:30 AM, Timur Tabi wrote:
>> >> > On Thu, May 15, 2025 at 6:43=E2=80=AFAM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
>> >> >>> Or if ELF is the problem, I don't mind introducing a WAD loader. =
;)
>> >> >>
>> >> >> The "problem" I'm not understanding is why does the kernel have to=
 do
>> >> >> any of this parsing at all?
>> >> >=20
>> >> > Nova will need to parse ELF headers in order to properly load and b=
oot
>> >> > Nvidia firmware images.  Nouveau does this already:
>> >> >=20
>> >> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c#n2931
>> >>=20
>> >> Hi Greg!
>> >>=20
>> >> Nouveau influenced us heavily here, because having firmware that we
>> >> can post once, and use everywhere (Nouveau and Nova), is very attract=
ive.
>> >>=20
>> >> Alex and Timur discuss other details that explain why the standard=20
>> >> user-space approach is less simple and clean than it might appear at
>> >> first glance, but I wanted to emphasize that the firmware re-use poin=
t
>> >> a little bit, too.
>> >>=20
>> >> Oh, and also: the ELF images are going to remain extremely simple,
>> >> because there is nothing now (nor can I see anything in the future)
>> >> that would drive anyone to do complicated things. For example, if
>> >> there is some exotic new thing in the future, it could be put into
>> >> its own firmware image if necessary--because we understand that
>> >> this parser here is intended to be a simple subset of ELF, and
>> >> left alone really.
>> >
>> > Ok, then why not just bury this down in the driver that is going to
>> > actually use it?  This patch series was adding it to ALL kernels, if y=
ou
>> > need/want it or not, and as such would be seen as a generic way to
>> > handle all ELF images.  But as that's not the case here, just copy wha=
t
>> > you did in the existing C driver and make it private to your code, so
>> > that no one else has to worry about accidentally thinking it would als=
o
>> > work for their code :)
>>=20
>> Keeping this local to nova-core is perfectly fine if you think this is
>> more acceptable. AFAIK there are no other users for it at the moment.
>
> I'm not quite on board with that.
>
> I think we should either we get to the conclusion that the desire of pars=
ing (at
> least part of) the firmware ELF is valid in the kernel and make it generi=
c
> infrastructure, or conclude that there really isn't a reasonable technica=
l
> reason to do that.
>
> Please let's work out the exact technical reasons for doing this in the k=
ernel,
> such that we can either conclude one or the other.

I think it's mostly a matter of where we want to draw the line.

We use ELF as a container format to associate binary blobs with named
sections. Can we extract these sections into individual files that we
load using request_firmware()? Why yes, we could.

Now the GSP firmware for GA102 contains the following sections (skipped
the ones that don't need to be extracted):

  [ 1] .fwimage          PROGBITS         0000000000000000  00000040
  [ 2] .fwversion        PROGBITS         0000000000000000  02448040
  [ 3] .fwsignature[...] PROGBITS         0000000000000000  0244804b
  [ 4] .fwsignature[...] PROGBITS         0000000000000000  0244904b
  [ 5] .fwsignature[...] PROGBITS         0000000000000000  0244a04b
  [ 6] .fwsignature[...] PROGBITS         0000000000000000  0244b04b

That's 6 files instead of 1, for serving the same purpose. And the number o=
f
signatures is bound to *increase* as new chips get released, but since they=
 are
associated to chipsets, we can maybe limit them to the relevant chipset
directory and limit the damage. Still it would clutter linux-firmware a bit
more than it is today.

But let's say we do this, and problem solved. Only... let's take a look at =
the
booter binary, which is another innocent-looking firmware file.

It includes a header with offsets to the code and data segments, that the
driver loads into the falcon microcontroller. And one offset for the signat=
ures
that we need to patch. Reminds you of something? :) Should we split these o=
nes
too?

I would push back really hard on that one, unless you agree to go after all=
 the
drivers that do the same thing (and I have names). But how is it different =
from
what we are doing with ELF? We are just indexing a byte stream using indice=
s in
headers, while carefully checking the bounds.

At the end of the day, it's a tradeoff. But I feel like our only sin is usi=
ng a
standard file format that gets visibility instead of rolling our own header
that would go under the radar.

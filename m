Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0191FCFDB;
	Sat, 17 May 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747489323; cv=fail; b=TXGTNYt0OZADAdWq3RlOk/TY6huVmDRZKNKtplViWoKhp8oVm8QDUZe65K0dXWGLxWiCZLLp3k5x3f3+Np8y9evQljFpHr2YKdtDKk9vI/RG+RG7DOMoPihCXYTE+9/Z1ey8p4q4KACicvvaaMcYB2Q9SfSTfjsoObZqguRXipc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747489323; c=relaxed/simple;
	bh=4PF22Cs5iC55mxdXN32iIuY+YK5l/4NpnQPyXkjLSXk=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=OP7aArzc3soPQ95iLZ7eEhCpRGHh/UnlcP2tuLej8sGCzQ6OKAse5nvKloMZmNrjVCzbHlgW7hdDZiWylLd278fFQ9SBFD/OPHQZYgAQGN0IEbYzAgUPSwjliwHJeSrrpDO1Mw37m8V5r57gsrK90niSybt6fadQxROGAamh/lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CEAmuB1c; arc=fail smtp.client-ip=40.107.237.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CEAmuB1c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMdmxODNXQlQQSODRKPS+z3ulONYvupwNKKgziO+OY1/VOR72ghJBhwq+5Ee5DNzgyFuiMnxijbhlkaNth88N/5fIIOsg1V2Wys8PyyS0AvKPqM7QVtlhVExvhHA9DiYR4J1fAA/Gx5jIFgIGEotYO2TJRPc3Bzu6uI5B6e9ShmxhE9bxdA0+5Asj+CWC6eqRKTlbw029PVgJA3UL6ta2b1FLlkwRm1EeZNJP696t7rU67f2kCQ1b98CnNZThhuxcjlQB73FcZb5MP52dncqRkZkk5iAm5CNUO3ViMhe++QaFrk7hSoun1E+NEQhqU7BVAdX7Ir0BCEEWDy0/2gzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PF22Cs5iC55mxdXN32iIuY+YK5l/4NpnQPyXkjLSXk=;
 b=SiRznqdLGt/6W/6y0l4XuncFZ5lEXzgFiWq5u7ZuI6SULGSy0f9c5oIPROkQdo3XKjXN+yPe2r6kjyKbRBGVCoO1c9+F4rDeVwW6RHXFeo2cWKrFPpQCA2TA9oG1znyW4c7I6gZZuQBP2zcorDAyv4//mo1cfinJWXeGbunPcJwwb4aku6XKvVnDP5+xG0JtD+f8ahT819D0dVpIzm1aFSpLWt46rUqvcVZtVWMaMwJPlojODihZvEjErOCATnR0IVuzSDBBlL/W84/QAiR+t+Mue1qoL63e3SB1EGqxvKcqjA0NZ7PR5lvQMyuqbYiXWPWdZKuL40ahVcudbWPb2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PF22Cs5iC55mxdXN32iIuY+YK5l/4NpnQPyXkjLSXk=;
 b=CEAmuB1cenqVTYDUehDCs8u4Fk2InAEDubqil6RbapJHGtXWUmgXwy6euiHtuKT4jkv4G1Hru2itP1fogVHKIfzf2PmULodQxB6S8+Wy65VIG8uijRSBm2nvMnxMklwfUItuVZGbh6okz7wgHpSAoy9Hp2G/Cdee4Owb/EveXeUY/e3qBWKXmwh+YhYCHM9P/pR5QhHYbbaxDQ+FSlxmqOKf2NevwtskdPKbFKgJz/ff5sucHGJyFVhquxbUdB2bohXM/B5JZp2obHfoHQhZGBv+s6AzoSULRspi+e/l9Rw/+yg4XL/75d/08c36ujtt67uGbqsKAFqids0spl5QyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6118.namprd12.prod.outlook.com (2603:10b6:8:9a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.28; Sat, 17 May 2025 13:41:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 13:41:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2025 22:41:45 +0900
Message-Id: <D9YH9CJUTMVL.3DAA5LXB46ASA@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>
Cc: "Greg KH" <gregkh@linuxfoundation.org>, "Timur Tabi" <timur@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com> <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com> <aCdhS10JCh6HRpqV@pollux>
 <08a91cb8-2e08-44a5-9d5c-c2c223aaa71d@nvidia.com> <aChhTJvY6KFvqrTP@pollux>
In-Reply-To: <aChhTJvY6KFvqrTP@pollux>
X-ClientProxiedBy: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: ceef9378-5f51-483d-9bdb-08dd95489372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azVOcS9GUk0reWZWTWlPZ1FYK0JIbHQ5bnRuMFFEaUNqaFRtbEp1c3VUclZS?=
 =?utf-8?B?SWMxSWJXM29XamxzelVsT2pjT3EvcFo2SWJDYlYwNmF5RklLTTdaa2VTa3lZ?=
 =?utf-8?B?YzZqcm1tNjFEeUpTRzhDNEhvYlJDSHhxalBzUFNDQ0JwNFFSdVZFdXAwWDhU?=
 =?utf-8?B?NUJWajVQaWlqUGNjb0gxWkd3Yk54WW4zSm5wVGZHVjltTzd5SUFMd2FhQ0Fn?=
 =?utf-8?B?VW0xRGxsTTdrQkZaQy9LbnU1Tm9Wck9vR3Z5OElqUWJxbUZnRVk3WU5DRDhW?=
 =?utf-8?B?Y05Hc2s3UGhtZWNsRzhFOVdBSFgxUnU3YlF0blVpQ1JMc1FNRkxXeTNCMEdp?=
 =?utf-8?B?M00zSWxTcUZKeTVNeUVIQ1FmYW9INmx3Qno4MGhVa3NGanVLaDhaN1BIbFdm?=
 =?utf-8?B?cG4zMGQ2US8xMmpIaVhNN3lNcE9Xc25aTkRlbkZQQmdGY3p6dWdyYzZKRGd0?=
 =?utf-8?B?dmdrd1JDUER3VGVaUUFXa00veG93SFc3QWd6MHlpa3ZkeFVMYlRYUVphamI5?=
 =?utf-8?B?Rk9FUVVvTEozZE1GM25CQU13Q1ZiR3hnUXBHZ2RGVnh3V3Jab2pnenptNEVT?=
 =?utf-8?B?UEp4Um9teEI0ckUvUHlKdm1YejE2SWRHcFVkYUZwK0NTbGtUQVRoTit5S3NL?=
 =?utf-8?B?RDh0WUV1aktndFlGdHFTZkZ0aDNvN2lvTlQ2NUY2Y0N2K2U5UXV0Y2JldUkr?=
 =?utf-8?B?UXNxaE41TzNvbFJCMjF6cVNCcUh3NnVXb3ZnSTRrcHdzZTJMRHNNcFZKU2tw?=
 =?utf-8?B?dW5GTFprRnltNDluY1BOU291MTF3M0tsbWtBZVMzdnQ4ZW1oSFJzZUdiRlkw?=
 =?utf-8?B?K0tSVjNGcmRLR2dBYVZYa1h1VmY0WVVRbTI1RWp2T0VYcnNReXdTR2IxM1FQ?=
 =?utf-8?B?YUI1NDNxaXdkdFVnUm9BaUJhaXNOeS9HbmhheEN3NWVQTHZtdy9sd0l5dFBL?=
 =?utf-8?B?UnFnbTI4QTFxTXhaRW9wY2JQQUNuUHNPTTZlZVpJaTZNTE5CcjQwQ1FJOFdZ?=
 =?utf-8?B?RmhuVkpVZ0NsTGNMZUlvOGR3Y3d2MVhKQTN2VFpJTGYzOTltaVozaFFPTzhY?=
 =?utf-8?B?a3d5bDFSUFJaZElqSnVRR3ZwVzRjV2lTTEYxZHBHSlJKdFE3aTB1NVc2RkIz?=
 =?utf-8?B?ejN1NG80YitmZkZxcHVNRVNTei8xSktKMWlCMm8wT00rc0tsdFR6bWRUaXQy?=
 =?utf-8?B?SnNLQUFzT1E1dXZycEp1MFZYZmZlNHUzbzlPQlRPQXpwQWZnUnUzRG5NU094?=
 =?utf-8?B?K2w5NG5jQ1ducVh0bzdSVXdTOGRaUThNUDVkTVhHMHJzWHhFUWxyT3I5SzZx?=
 =?utf-8?B?QkR1a1FZM3JFcHJMeVZ6aEh4MUJMSnBpK1hnRUtaUFlRUFM1OHFaSUM0SmNS?=
 =?utf-8?B?T1BKM2lqaTBncFlDYzg5K1R6N3lmWksxNTNTR0d2K1pxQ0YxemRaZjllN2F6?=
 =?utf-8?B?NWxacENYT3RUY1dyZVp3TDE4T2hpWU9QWlZheDdVM0VnS2FiK045TXJjRDJX?=
 =?utf-8?B?OVhoSDdpL01CYjduSEJlV0U5NWROaGxnT0xaUzkzKzk5Q05ERUEvUUlpQmZh?=
 =?utf-8?B?QnlJa0hJWFJPQlBOc1dwckJ6eEhqSm51TFFkanloNWp3cEhwcWNzK2p6Y1Uv?=
 =?utf-8?B?dTBvYU5HOTR0bGdWMEx3VS9WSlZzaFdQSmJpMEtDR0x1VUxzYTE3S2Q1MWtE?=
 =?utf-8?B?dWd2RmRYU3R2L21IOVRQMnBza0ZLOTB6Mit0OHJMaVZIUUNjV1lRSk84akt6?=
 =?utf-8?B?TVh2N0hmaUlORHRLdmdKS3hUYVJrNDlma2ZnMmg2a2x6Yno1bXJDa0Zidlcw?=
 =?utf-8?B?T2lPRzAzQU4vZXhUeVhsbGd2MFRCM2RmbFBRYzlkUHBxUEhzZmNqMWRLUHhU?=
 =?utf-8?B?RG1vZ3JvQkZIZXFUNUNhWmdhZ1IzY1hVV3JzOUhRNlhWR21jQ1R6OXBqWDNZ?=
 =?utf-8?Q?vQDbxtSk0gY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVQxTXk0eXR4SWRKdWJKby84OGNlcy9PcmNlT3NubFI5R2VKWk5oOXUramcz?=
 =?utf-8?B?ZUtVb1NaVmo1TndodHo4RFY2Q0RQRXljQW1NSjhmaGV6dGI0UUxaMmg4Mjhz?=
 =?utf-8?B?aGhwcWM4cHdhaENEMnN0OUE5U1VLUjJrclNtMWZWTWZ6dHdnQjRtZkRHeUdC?=
 =?utf-8?B?TTVQUVRvN0RRem0yY1BMU0lMN2kvR1E2N3RnQzJpc3lkSFNEdmUyUlVScjBB?=
 =?utf-8?B?NTlzazgrbnNiOWc2VU9jWkhpdDF5UEZFdEFmeGd1S1p2TkVTZzhWOVZzRWJP?=
 =?utf-8?B?aERLZW9hSFNRdlRJZEpxRDdjZmhWZjBTRTEzdWNXWHNtbk4ycDloakk0UWtG?=
 =?utf-8?B?bjd4UUsrTXVDOXI4R3pNZUNIV3hCbWxLNFExazlaUldoelVib1Z2RktKcmh3?=
 =?utf-8?B?WjJhbVgra2RZcEgxd3Nxd1NkRWo1d1p0d1luM2RMOCtSZHY3TFZWUHVkenNk?=
 =?utf-8?B?cmxFNjRlelZZSXRLNHRlNGtIdGdPdWk2c3l5SXB4THJSaHRyVU5ZQWFEUDN2?=
 =?utf-8?B?emllUHpORUJHNlRKcFRuM3RtZkwrWDA1cUFqa1BrVnNFRjVBaVlmZksyblBE?=
 =?utf-8?B?NDl3dzBmV05zclVsdHN6dXJQMU00dENLSmh4NUVGNEJlMFQ2allFNHhHcjN6?=
 =?utf-8?B?VDVrbGUrbkxFTTR0VTE3L1VuckxkanBxa1J1ak9HRnpjeTFhSzlHWXZmYVZj?=
 =?utf-8?B?bzZzNFVZVzNYYi9xaWF6RFowdlF1UHdaVlNQQWlpdWk1NERyejdmQ21rMU9L?=
 =?utf-8?B?ZFBKOGZydUtsbE5DY2xhcXZFNzloV1NWbWNsZE4vN2ZsMUpsMDhOYS9rcEFs?=
 =?utf-8?B?YlJQWjFkYWRvMm1yc25yWnM2ODZRK2pCU3lLenNqajEyTkc5V05QQUtmMm0y?=
 =?utf-8?B?MGRNK05Ea2FrYUlPWjdGcHgzWDlJdUdUVVRDaWpOTGszY2lUT2JhaWNtVTZz?=
 =?utf-8?B?eWorMmdlVmd5eTB0Uktta2RaVVpuWWZzS0dadGorM2VjVHp4RnlvQXVsbjJt?=
 =?utf-8?B?Q1ZiWHAyWnRqeTNUNTA0a3BqZDNDa0Uyb3M0MUlUc0NLMnkzWHh2TDRMVFJl?=
 =?utf-8?B?WjZLL1diODRldzNXNmhnZStpQmlqSkdHcmp2SEhwelVhbTZ2QnJBOVR5SEpj?=
 =?utf-8?B?YmFrRmwrZHpzY0NWVFJkbS9aNjJGVU5PWmwvd3RnMldLY0pJTnRoblgyMUNM?=
 =?utf-8?B?TnplN1ZCNmJmWWNyQURxWWswQ3VZQUtYQjEzZlZwK05HcktQOS9nejhzUGpp?=
 =?utf-8?B?VjhDenRVUFB2ZkFaelFsK1lUbjBmM3U2Wm5tZXlsc0VDMk9Eb0ZDNGx1TjFH?=
 =?utf-8?B?NHU2N3BYd1dHb0pSQ09WOXk2MXc5MDM0SGF5SUpxZEVWaXBIQlMrZ3BFdWcy?=
 =?utf-8?B?QXlBTFl3bHdVbkFuSm5BT0RiZGFQT25rYlBiQlY1eldGQkdFc2F3TS81a3FG?=
 =?utf-8?B?OEpjc3YreUhlb01XMEVWbFhEZkZGbzJOTzJGc3ZKSEM3Ry84RzBCRFZTdjlP?=
 =?utf-8?B?YXlQUmxHZm5pNVZhcUNFUGx1RkZDQThLcmk5RVBUVnkyQVp5Q3RYZElNOFlY?=
 =?utf-8?B?S053cFI1TEdaaGRBdHhjNi9oQzRzQkUvbTFuTXN2MlZWY3NHNzdxOXJjUzVi?=
 =?utf-8?B?L3NrODdRcFQyM2lDSUR1SjRpU09LV1RBRDVRTE8yenJrcUhWaGg3NWxBdWpZ?=
 =?utf-8?B?bExzZE0wbFRWZzhJTmgzajlMQWdLRUhRR1BpbXR3cXFEU3MvbEo5b2t3dUp1?=
 =?utf-8?B?V1MrU2NEU0VaOWdrZHhJd0k0VEE4ZmpEcEkySzZ5aVR5VXBtejY2WWw1WTVV?=
 =?utf-8?B?R2FNNE55NWU2eWZEdC8rbUI1RkRtb2V6ZmhaZEJCOXIrYTcvKzhUdmFHK3lQ?=
 =?utf-8?B?VVh1dG5jN0k2OTh2bkwyVXR2WGtLRlpXYTZVNTBOeUd4WnU3MzJOb3lOOEpK?=
 =?utf-8?B?em5rakR6N1hxdlUyV3Z2UXBhanFtMTU1VjdSazFtTlVHZTdBMlpDeTJ5VHps?=
 =?utf-8?B?N1ZJUlBRNmdEcGpXcUorK0FaNWFMQ0I3OTFOa001bnNHbUpCVEJkQWxMMTlm?=
 =?utf-8?B?a3pua3Q4NjNQZHkzeVNGNHRRancvcUdSZ2kxQkwrTFFycmttYzVwMHMvYzZ0?=
 =?utf-8?B?V25GTmpzaGtLVUJtTStwdlRTU3l1VWJxeHQ1eWJTTFp0aGQrMDMzZTlDdHlS?=
 =?utf-8?Q?8ygARfuMRZ7TLOuSL+c+CPF6NG8PB4ANeajOgW4CGA3N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceef9378-5f51-483d-9bdb-08dd95489372
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 13:41:50.5069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZZfws2kYhaY/4yIjgm3S8SpO5Isq3iqWBJlJviDDKN9P1lwKmo2OuxZhK55lUZukn2Vn+5yE4ZFS/HI44PP8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6118

On Sat May 17, 2025 at 7:13 PM JST, Danilo Krummrich wrote:
> On Fri, May 16, 2025 at 12:00:11PM -0700, John Hubbard wrote:
>> On 5/16/25 9:01 AM, Danilo Krummrich wrote:
>> > I did not argue for or against it -- what I do disagree with is that w=
e seem to
>> > just agree to disagree and stuff a generic piece of code into nova-cor=
e after
>> > three mails back and forth.
>> >=20
>> > Please keep discussing the above with Greg until we get to a real conc=
lusion.
>>=20
>> Danilo, this is a small amount of code. Is there any real problem with
>> a compromise, that starts out with Greg's approach of putting this code
>> in Nova?
>>=20
>> And then we can promote it if and when we can make a good case for that.
>>=20
>> But in the meantime, we really need to be able to take "yes" (from Greg)
>> for an answer! I don't want to blow up the firmware images, shred
>> the "Nouveau and Nova can use the same images" story, and delay merging,
>> all over 100 lines of code.
>
> What I disagree with is that it seems that you actually *can* "make a goo=
d case
> for it", but stop discussing it with Greg, because he would agree with ju=
st
> stuffing this generic infrastructure in the driver.
>
> It seems like taking the way of least resistance even though you seem to =
have
> good arguments for this to be generic infrastructure.
>
> The fact that *only* nova-core would use it to begin with is not the rele=
vant
> factor. nova-core is, for obvious reasons, the only user of quite some ge=
neric
> infrastructure, yet we don't stuff it into the driver.
>
> The relevant factor is, do we agree that this is a valid requirement for =
drivers
> in general (which you seem to answer with a clear "yes"). Which means we =
should
> keep discussing it.
>
> If we can't conclude that this should be generic infrastructure, we can s=
till
> figure out the way forward for nova-core (i.e. have our own ELF parser in
> nova-core if necessary).
>
> But, as I said above, please don't stop the discussion with agreeing to d=
isagree
> after three mails back and forth.
>
> We have plenty of time to discuss it; we do not target v6.16 and the v6.1=
7 merge
> window is far away.

I've tried to make the case for this being generic infrastructure in my
other email, the TL;DR being that there is precedent with at least three
C drivers (if we include Nouveau), likely a few more - and I haven't yet
looked for drivers doing the same thing with their own container format,
there might be a few surprises here as well. ^_^;

You are right that we are not in a hurry, and having this discussion
should not slow Nova's progress (which is our main concern). But should
the decision take some time, let's keep in mind that moving the module
out of nova-core into the kernel crate requires little more than a
matter of doing `git mv`, so there is little friction in having it
locally first.

Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315B1F17E8;
	Sun, 18 May 2025 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747556093; cv=fail; b=tT8KmBtAOb1d7jqxvDvEPXaJHoBl47kGiw2ypejUcVPZa1GI5n5OGXHcc3ffOHPVqrDcBjbxDjYr8oLDuVFpE6BdXlDYct84aNdt4LVZrS4pkSddzEgSbdzqMMMYRQWE/89qpjC5VbGb334HZz05ICLVl3qK8Hu7H0a0l7K7flU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747556093; c=relaxed/simple;
	bh=aBu+Mykq8HLCwZGPiLTqmv48UATN1Kl5eu/HDy/I0d8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Cl7c9jnZg4yshwbwWrBQrzmpVh1OHDp1dMXwtZLpTWHwHlfYePkRI5tAcmb/itVZcwU/mLWeLGHaDqSMiOL6EAo8ZMzcDVQB9AcQ+s8eBFuTA23ZJmlb4EU3pNmMAHkiw20pkK4WCwrVTWbnOH2vnK5GcA3Rflpp7NwrAAhCdVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pgve1iwr; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pgve1iwr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ui9satCERfprAUW52PlmnfaLuKArPU+IYumq/Ch0wXB0HeL2FQ1fClmOMt143iY50bADSZHrZuN/G0emlK5tJfUuLPgv6JyDTWvAG6U3e7b+i0aNqKlxMyL387ndKm/sRxz86UM9HqH8tBFcuuRUCQw6QbJTO0oWkjF4ywrrfIkM5Wb7AuaieSEKZCm/FfU8+6rjzQ0h8xuzT7sakXDEUOnO2zfz4hb1t/ROR2cFMwY4EawcDLhHrdTzDThP+v8AWqLawRxe5UdSCmuoNB8Q8gqQP5DsNI1yuvE5YRbj2szrgcDaxnyA2QpObrn8jRWpR94uodKeLyHmS4BP14KkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB+Pc218yJYVU5V8xvkRnK7FmRur3yxRn9T8mwMWSUU=;
 b=jvMz10OJNXfwwLryA3O4tynXF+Vmte5guBgfYujGZVn2lj4xt/hsij0yOO7Zc7x41Vp/XyE3EPY7tnprJuVWZj4/zQnOhYAA0QUaguq7v98lTDyv2RYITdoC9j/M+TZk+iK7zMs3gI2tJ1xs6aRflKowfAxjpDdR0m1j1wgwVSwpJ2+yR1/yyvLMh+CG5PEoK/Ae6Fjn/N5bOQ79AJYALDC0c3AE4gREJve7rnPskjQvdNBPPjLeYotWtDzeEa5OOcLArnMKAhZH49fKAiIZvKwAMYag7BzxcVQXWs9zjh2ImRHD9xtUjcTAX+5qe38Y6xF7GMe/y/Gow9Cnlehhhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB+Pc218yJYVU5V8xvkRnK7FmRur3yxRn9T8mwMWSUU=;
 b=pgve1iwrrSlO+3hm2zpNg7f/rFQ9lJNbbcPrgpNwZ025IxmBDrZBe1r75utc/IPQGGpkes7hS4Npx2n5ITZLwmJ6UDFa8d8xvd4LWi2RhN5mELaffwlZ2W0B1UouiujQ8pRW3QCuTTvACN0eUonFns8C3cMjRLZBM7Rwm3hRXGQhUmsgUPx4W2Swc5r4wSq7NfNFnwEVHLcr0Ug6j+6ffRGtYWXme5SK/HfjUYZM4MCmzR/ID5ZVivH1peSq+57Pm9lnWtMHIauFAM7j+mdyVy/fav9hOEay1tVwT75x5kYIb1rSpNJUpewYcQvXBx4EN6o9FcGaCTPcs8UJS6BMqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Sun, 18 May
 2025 08:14:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 08:14:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 17:14:41 +0900
Message-Id: <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
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
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
In-Reply-To: <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
X-ClientProxiedBy: TYCPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:1::31) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6263e4-0754-4918-7581-08dd95e40c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1AwbHlXQXhFQytyaVFSNEp3V2Q1Mmd1clJuN3R5YU9iU0IwWWRRYUZvVnFH?=
 =?utf-8?B?NWQwZEhLRnMyYnR4UEREYTNsR3RwZVYrUzlPdmd4WVdDR1hDYUlqS1ZnbXhl?=
 =?utf-8?B?YkR0aW5ZS0kydkJha3RWdGd1OHJTRWh1M25LWHFrcCtVcGFTT3FQQ05TeE9S?=
 =?utf-8?B?ZzN3QTZ4aDUvVXlMN1VWaXpJUVVBczUzYkNaNGVWMzNyMFh0TWxnV2ZIYS9L?=
 =?utf-8?B?NytveHd6UHRZZENYQ0lKd3N1RDhsLzVXdjRTWVd1NUZzU0RaNDk2T1BkWnlT?=
 =?utf-8?B?K25obTRRdk5tdUlzZWZQTlFSODJldHdmY0pCRjNoTFNZcTFSNkFBZUdSVWpn?=
 =?utf-8?B?OTAvZi9HU0NUQ1RSeVdzUGFTNmJSbEx6Z1Zsd2FLT2M0Vnp0VHhNcUN4Tmln?=
 =?utf-8?B?SGJCMmpWcFhpMExuRmhMbWRQZ3RXTnJ6L3dhWVovNk9UaURFY3Q0TTgxdkNI?=
 =?utf-8?B?R0wyamVQRy9ONzFrNjA3MmN3S0tEQ3ptVU44SGVYZTEwK29hZEJiVUM3OXFr?=
 =?utf-8?B?S1BiT2JBR0l3VGZIeUVMQmxaRjQ4ckJsT05EcFRIek13eDFacmJ0TzYyT3pO?=
 =?utf-8?B?bUZLdTNxNDZCRXJHZUFxdkNIVFRNcEpqb2RuZENyVkhCbm9KZW1UTStXeXJT?=
 =?utf-8?B?UlBJV1BSald6Ti9nYmVZUEtsY291VHFSaU40WVJqdmZoTEJJajZzYk1yMGlZ?=
 =?utf-8?B?RnFqY25VanhCYnQwb3dnMGo4NFdOb1hYblZ0dXhsUWYvTUZaTnlNK05ZR0Rz?=
 =?utf-8?B?a1pnZFpKSDFVejlxVmVLczh1QzNFUDc5VE9KMUZWRzgzWC9ZNWhXdnVwZVJR?=
 =?utf-8?B?TDhmTHVvdk1aRTdNYk1TcXJJVXNBbDdDREVqeGczM0V2RHJNaHBidlVEOXRU?=
 =?utf-8?B?SnZoR1NyckNJaHJMaGtjZk5IYkJMY1RzNFJmWmNaa1k0QlR0djJCc0tEbmhV?=
 =?utf-8?B?V3A3NFNOWE5QWEJFZVFiSS9ETmhRY1NvcGdIYkZtL2VJL2phVkJ0V2pTZGFz?=
 =?utf-8?B?Z2g4aU0yWHJZQjVEOVVIQVd1S1hrV25rVDdoMys2MDA3VXhubmRRalg0TFha?=
 =?utf-8?B?eTcrZ05hLzdCZFNQME1vTWRVZ05TUUZyR1ZJdmhDbFNNMno5eWl2OU12QTdX?=
 =?utf-8?B?WElLUG9SWTN1a3ZzWHcyc1FNN21aNVBpVVFrUEF4Qzg3cldKMS9nMEdqR3Nk?=
 =?utf-8?B?ZFphR2dYd1BEQjBQTWpwQWtyKzhRTHZEQjBVKy9CekZEdkpnM0Zvcmh0OTZU?=
 =?utf-8?B?Q211MW9PMUVRSnN0cEMxNSt3bnF1NlRGTmZFVlNhUmthYUsraW5teVRhd2Ji?=
 =?utf-8?B?emdJMnYzZmdnODM2NjF0ME9FUjNZcEV4czJIbVRqaTh4TDJ5YmpBNmIwaVp4?=
 =?utf-8?B?UkQ4TmMrazArNFovWmkzd0hHcmZKVzZZN3gzazZxV1FhdERNbEFiVFRtNHpE?=
 =?utf-8?B?dlNvMjZZRGV4dHljemVRRFRNZnNadVhvMWVGKyt1Z1BIamlmUTBFalp1Y2Yw?=
 =?utf-8?B?d1NaVEhDbGljMVY4aW9CaEdvRzllVTlQQVJobkFBVkx2dC9TdDRjeUtqZk1w?=
 =?utf-8?B?OVpYLy84aktIcHJCOUtrYW5RcW1XTEtpNXErK1pNY0owY2Z5Mm1GWU1seFhl?=
 =?utf-8?B?TjlIUm1ZcUdoZFZ5L2tpM3NNWW0zcHVKT1A3c3VoV1dCY3lLVllNeXRhZnZt?=
 =?utf-8?B?RG5ianY1RWhJMWg3dFphZjlEN0xJLzNkeU9oWUExK3FCVngvbmRGcUJ4V25l?=
 =?utf-8?B?Nk5zSmUzZXUycm9zWVVYZmtsNEFEVEFJMDJHUjFOaWtVRXVrcXNyU3FveHlT?=
 =?utf-8?B?cTZjTmJKaGkxd1hZb3pvWnl2S251RDhpaHRQbngrbUxiWHJSVzVxaG5BU1hH?=
 =?utf-8?B?VGxFc3dXK1dON0cwSXZkM0hyNlRWVlViZVcwTXBkbC92YWhRb3ZNMTlhVGpt?=
 =?utf-8?B?RUZUT0ROMXoxd3FHRWhWZ2FlQ2Q1MFdnQTE4NFA5NWZxOVJQTVBuR3JkVVly?=
 =?utf-8?B?QjNFRkdBM1dRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVBNRVJJbndxQml6czJPTXNnSVJybk9uVzNDRklGNGpzSy9tWTJOU2FPOENy?=
 =?utf-8?B?Nlc5MGhVMXUwZE1RMFBtS09jaWt1SWdoR21nNEpmSm5pY1o2TkpIZzdoSVBN?=
 =?utf-8?B?MG16cWQ4eE5IVWJWSnhZd2MvMktWV0QvYmZ3YlZ6Tk96L1J2SzNRRTN6WFhu?=
 =?utf-8?B?bmd1ZlNWZTlVUFlMN3p0UFRueHZBVUVQVW9EbUxDWmgyd2ZEN25CWmE1L1dC?=
 =?utf-8?B?UlFPOW40UmZDTUJJVDYwa25uYVZYbkFNVWQ4ZWpnTnFuRzczWSswUkZHRFRQ?=
 =?utf-8?B?MnJqTWhaMmxiTk9uais3dU1RSForblBtcEZ2VHpRb04rQnpFR2lnSG1tUDJL?=
 =?utf-8?B?T1VWY2tSejZ1TjFleFpMay9SckcvYUtRMWUrd1R6S0Z6MzA0T3ZvRlpqQUIv?=
 =?utf-8?B?eVMwVGVFcmtTQVJobkVSUlhEYjJyTmFmRVR4bTJJQVFOZXQyTVdJOHhNcUk2?=
 =?utf-8?B?UTNVdmVKTTk5L3BzSVNGWXZaU1FhcHpWNmd2N040b0YveisvQncrYm10V1Rk?=
 =?utf-8?B?cVhkYUlqQ1AxelROakNMRlZwZ2doSjVWMkkyWmtyRkVLSFFGNjY0UDFXd2RY?=
 =?utf-8?B?V3A3dWpFV29LKytkcG9rYXVxZHpwQ1MzR2wxbHVkNG51R01kSWxLeEczS2RQ?=
 =?utf-8?B?aDdXMHppTy91dzdFNWtHa1c2Z3JlUENic0RXQlNQT2lJckJsVGRPc2dDWXQ3?=
 =?utf-8?B?TWZYMVpVekNGbDAveHRRTW54ZE5jcXVNNEdiWDNDWmMramQ3bTlDNmMwMnRm?=
 =?utf-8?B?T0dhc2t2NmJZZkdMZEtUclhtNk12ZW40TkhoOUhmc25pWnd5eUF1RHFLOGRk?=
 =?utf-8?B?YjRvSVp1Qld2NjBvOTNtMndZbE5zRXJEc0o1TGl5SlNsOW0zQjB1c2h4UGdU?=
 =?utf-8?B?Nk16TlFnTFNOaW1sMFNYV0NxZE82bUNjL21LL2M1cUl3L1dONmczejNDeWRH?=
 =?utf-8?B?bEhRa3NSd2hDZWxUazJUMG1HRFplZjRTb2tNKys5QmMrZyt6YWtlUGU0WDJY?=
 =?utf-8?B?RlBxVVl4Y3l2TysxejlTbkhadnpCWUZCMFpSN2pPVmRBTHNiM3Q4ZDBMSVN5?=
 =?utf-8?B?SkVyNGtjcFRMQ1hUK3g2eExTSDJqKzNYSW1mY29CbGZwWDFvTDN5YXlucnZj?=
 =?utf-8?B?MDU1QmJQWXB6Y3R5Wm5iY3JEb3hib3M3TWwxc1AyVVF5ZEpzZ1prMDhhUFl5?=
 =?utf-8?B?a01XWlFWQkszdklMTlR5bXVoVzg4bE9xamlOamtUU0g0bkJTa2gwU2l3N210?=
 =?utf-8?B?aGJGUTFpNThsa3lBOUluelhpRWNNcXk3eUlna1B4Y0gwcnNDQTkxcFBzWldk?=
 =?utf-8?B?b0l4T2tkRGFidnIvYnMwK1hWMm1uUzBETVNxWGJFMVpiRmJob21MVlM1a05v?=
 =?utf-8?B?clNHaUo2bVlhbkVwTGNudHh6cTVuZ2tlN0RjTkpxa0JicEhSRHp5SEtVanpG?=
 =?utf-8?B?SDZnemZJWXNXYng0RXM3V0VTYnF3c1VmMWFJS1NYQnlzRjhYTlJ4WjN3Wlp6?=
 =?utf-8?B?Z1hMTHNGRmEyeS9VNkx5c29sTmJBQ00wcCtCZWF1Q08xN3c3Nkc2U0ZDU0Nl?=
 =?utf-8?B?RW5wbzJXNjR5N3BBUWlxeWlqVEl1WktNa1NRRUNOUTU3Z0ZwUUNEMnlNeWFD?=
 =?utf-8?B?UHFRWFRvbTRtdzg4VlFhNmZhaStlcml6Zm1oaWNPTHZubkF2RXlJVi9haitp?=
 =?utf-8?B?Ynd0N2tnQnpTZzN3UVVKeFFLY2ExbHUxS3ZzRDNTRFduUFZjMFBFQWY3alFI?=
 =?utf-8?B?ZkpadTkrMzk1MFNyb1RHVU10bGJEVmJKOUhnb2Z3NDJIM2RNOEdvSzhUeHg5?=
 =?utf-8?B?NXhZeVUzYWRoL0RueGhnSnVSZ3JHMHllVzlVb1UvcEh6S1ZQbUNnM2hMVUgv?=
 =?utf-8?B?OXE0NmUyTkVlT3NGNldJS2p3Q0g3M0lGcU9FVXpjRVh1Nk5WdFFJYjF6cExU?=
 =?utf-8?B?eExvU1NUNWJpUkRMOGpxeGJjenkzbHAwSktFVGRRRExkaXowamhNdkdnREhD?=
 =?utf-8?B?VEIxelcxZ1R6bVdYMmp2aWRnQTFoWjZVeDBIcjd3ZEY4cTdDYzhKOWRKYUg4?=
 =?utf-8?B?MENqZ2lwV29yeDVWNGNrTFhyUkFTY1YydXo3aE1adk5WNkFLL01hL3A1Vm1H?=
 =?utf-8?B?QndNSFBYS1htTkk0cXFrUmhGSTBqOEE4V0c2Sll1elg4Q1U0aGNkOHlyYlJR?=
 =?utf-8?Q?7FjIqzyiY8scqdnftsNCRk0WEzkRQT2c+/rL9B4dnz/M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6263e4-0754-4918-7581-08dd95e40c7c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 08:14:45.4101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwp850iiNMuLl6QSZR6rnfVm8XpzOpQi4gn+HKoRKuN60NysoWEMzLUTEuWetWIMKWJZwQ/Gcxs2KC3rxKI+4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100

On Sun May 18, 2025 at 4:19 PM JST, Benno Lossin wrote:
> On Sun May 18, 2025 at 4:28 AM CEST, Alexandre Courbot wrote:
>> On Wed May 14, 2025 at 12:44 AM JST, Daniel Almeida wrote:
>>> +//! Regulator abstractions, providing a standard kernel interface to c=
ontrol
>>> +//! voltage and current regulators.
>>> +//!
>>> +//! The intention is to allow systems to dynamically control regulator=
 power
>>> +//! output in order to save power and prolong battery life. This appli=
es to both
>>> +//! voltage regulators (where voltage output is controllable) and curr=
ent sinks
>>> +//! (where current limit is controllable).
>>> +//!
>>> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/l=
inux/regulator/consumer.h)
>>> +//!
>>> +//! Regulators are modeled in Rust with two types: [`Regulator`] and
>>> +//! [`EnabledRegulator`].
>>> +//!
>>> +//! The transition between these types is done by calling
>>> +//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] respec=
tively.
>>> +//!
>>> +//! Use an enum or [`kernel::types::Either`] to gracefully transition =
between
>>> +//! the two states at runtime if needed. Store [`EnabledRegulator`] di=
rectly
>>> +//! otherwise.
>>
>> Having the enabled or disabled state baked into the type is indeed
>> valuable for drivers that just need to acquire and enable a regulator at
>> probe time. However, there are also more dynamic use cases and I don't
>> think the burden of managing this aspect - by either performing a manual
>> match to call any method (even the shared ones), or implementing custom
>> dispatch types (which will lead to many similar ad-hoc implementations)
>> - should fall on the user. Thus I strongly suggest that this module
>> provides a solution for this as well.
>>
>> It has been proposed earlier to use a typestate, and this would indeed
>> provide several benefits, the first one being the ability to have shared
>> impl blocks (and shared documentation) between the enabled and disabled
>> states for methods like set/get_voltage().
>>
>> But the key benefit I see is that it could also address the
>> aforementioned dynamic management problem through the introduction of a
>> third state.
>>
>> Alongside the `Enabled` and `Disabled` states, there would be a third
>> state (`Dynamic`?) in which the regulator could either be enabled or
>> disabled. This `Dynamic` state is the only one providing `enable` and
>> `disable` methods (as well as `is_enabled`) to change its operational
>> state without affecting its type.
>>
>> All three states then implement `set_voltage` and `get_voltage` through
>> a common impl block, that could be extended with other methods from the
>> C API that are independent of the state, as needed.
>>
>> To handle typestate transitions:
>>
>> - The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
>>   method to transition the regulator to the `Enabled` state.
>> - The `Enabled` and `Dynamic` states provide `try_into_disabled()`.
>> - `Enabled` and `Disabled` also provide `into_dynamic()` (which cannot
>>   fail).
>>
>> Essentially, the `Enabled` and `Disabled` states simply enforce an
>> additional operational state invariant on the underlying regulator, and
>> do not provide methods to change it.
>>
>> The `Dynamic` state would be the default for `Regulator`, so by just
>> using `Regulator`, the user gets an interface that works very similarly
>> to the C API it abstracts, making it intuitive to those familiar with
>> it.
>
> How will the `Dynamic` typestate track the enable refcount? AFAIK one
> has to drop all enable refcounts before removing the regulator.

I guess a choice has to be made about whether to just proxy the C API
as-is (where an unbalanced number of enable/disable calls can result in
a dropped regulator still being enabled), or whether to clamp the number
of times a Rust consumer can enable a regulator to 0 and 1 and disable
an enabled regulator in the destructor.

The initial proposal does such clamping by design, but I also suspect
the C API behave like it does for good reasons (which I am not familiar
enough to be aware of unfortunately).

> Also what happens when I call `disable` without any enable calls
> before?

The C API displays a warning an returns -EIO, which sounds like a
reasonable behavior for Rust to proxy.


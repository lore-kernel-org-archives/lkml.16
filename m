Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8556199FAC;
	Fri, 13 Jun 2025 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822390; cv=fail; b=sCCaD4cZ+MlOBkw3/kMpoteaGxjx8Eqi5o6kK9Lc8XGjmzIjI8DdRNhRYEM2JE8Nbd0inQp/7k45qxy8/faO7SHMVcY0kfP44Ye3icdDxoXKRJIEG01mGlNm0ApmqImMqQpn36AOs1Ehd+aFpHfL2548AwLF8tsgBEFLBBW3qrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822390; c=relaxed/simple;
	bh=3Vb0Zs6ff94NMI1eGirZbF1GLE+3PfrdGUMtIEhJ65w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ay0lJdM5Zxout7p1wxnNYpCNe09vWYcOuDeDhrXp48NcZ4UVxPR4xvhZf/6v4z+myPycKpuhvcmYIrWhGzHSDqpURh9NvPaQgMWnGqYjOkWC8DzDFqcQ4OSY0h8LxuluY5ru0yXB06cVgDkXPUqG/RC/MV1RH2khOk32gxKWrhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LDFFtUew; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LDFFtUew"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqAk9vZWC3jNfIErfbqBxu9Q/cC4+QH63V5P5zORYUf2Il9HOicfyLWP6KMAKrLbeNEBaSTXmo3sgXf+f/vM8ilzkjR2mwGEc7mnIkKg5atRaKA9oozcfxv+JPvu4dpJMql24AAct9h6sFTnEUqLcs3HR8ewq0LdCLgT8Jgm3dYpmpzI7LuYt/kjBbMlKWwaC67NSEEvmhUEr4Mr6BcmSkf2bIut4qoo7MqYhwHm9Pspo9mn8fzN/Pk7O8C2rN6KYtfPyGXkacreLG29Mnt17wNspc/b12ydjIXKmOHXbGUe/sc/w+Zj3dZnNtOzOsChd7VqOxbuOMZ+ikEKFdoTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VakdrVi5dX0CxYyKdJ8rQymM405nm0WJvl+a6ZIzZdY=;
 b=GEtNZhJ4w+CW/DSxSIGILBbzws4xyiu5Cu4aPSoNA0GK8eGcnIzC5QnbYVAF2j/iX0x1PkYJr5UW35T3kHcmwaHrA9t+aMV1dUq8j/5cXaULcp0RUbDd/iqWMLIYm+ozYBdcCpqBUsvjHJvTkePUxW9AaW6iT17u8TJCVEFGqBfyv7yoYo8tsYtrE9+nl1PfYXR7k8DnX6L041lcrRt+ZLqunDJACveUX10lvDJ1i0ODaADko1NGgRiWCCqaHc4PvCo4y8A+omiNaHlEN9LKGv69HuS8gkBurWtBr+Gr68adOCcsF4/MJMyDcAKgJ+yU00eafpCcrcz943DW7ONE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VakdrVi5dX0CxYyKdJ8rQymM405nm0WJvl+a6ZIzZdY=;
 b=LDFFtUewIw9X/sJI/BT9U2nysbxs2zH+0IeQo1ESyFtBh/HKJ5BDZHD/Gj26qqf1+U4so9AM4GHUBYsMISymMkyIctd/7zLiqPGaZMP3Ygr/YLJaNhQoj7P+leFm+WM4Dn8Ga8y9WhiVN1mlDYBpdhYL5Wez7omsOU/yBT+R5hfe447c/nYICXT9+/jWSiSO/hked4WRIRhHXi3pzDjHofIX0qivs5EtjU38Vg8AGc0p2I099MUis+Od5xPSgtIfybYv6rhmODMflDkVOheUm7IzBOq1UFR3zD5tXy0+07fZ4O5cmCPEvHLp/U4Kudjp4qIxOsq++V2aQcIiBqlRlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Fri, 13 Jun
 2025 13:46:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 13:46:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 13 Jun 2025 22:46:08 +0900
Subject: [PATCH v2 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-borrow_impls-v2-1-6120e1958199@nvidia.com>
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
In-Reply-To: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYXPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:403:a::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ba0d9a-5a47-49dd-e7fa-08ddaa80b011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ano5cnpCSlg4eDBtUjVVSVd1a0k0R29iWGxjb296TGQvTjJiWlRlZUdMMDhm?=
 =?utf-8?B?M2J6d2w0aFlKSkRvcTF5ZHp6My9sNWVpby9uYk9GenZVRzM1NjlGOUV0aXk0?=
 =?utf-8?B?ODFrUzU0WmRTZFhEWUpZbW9rOUdZTGxvNWdRZjF3eUdTRHRpY1k4MnZBdVpk?=
 =?utf-8?B?NlBZcGNnK3lsY2tFUHJOMmxxcHVCeDFIa2ZLUngzNTJycFlLUytJOHl2ZXZW?=
 =?utf-8?B?VnZkc1paOC83M0RCcUd0c2Nhbnl0S3Z2d0FLUmFweFZyemx4N053MzJuZ3Fu?=
 =?utf-8?B?eU4rS0s2amdGTW9IN2FLRWJVaVpwNGFLYkhmWXRaWnJsbzhqNkdhK01YM0Yv?=
 =?utf-8?B?TXpuS1FmYWROU1VpdERhelhoWlRxWHlpSk15M21heHl1YjZuMmpad2twOTlo?=
 =?utf-8?B?S3pZM0tRazJ6RkhGNkoxWUpTVU9sdkR2Smp6RGVLMDVrV0lLVlJjYnNRTWU0?=
 =?utf-8?B?OHEyY0s4Ui9pbldsamxnZElKTnBNUjdBNHpIOHNBU0lwZXlKTW1QczFaK1ZF?=
 =?utf-8?B?bkdxWFNiZ1plNm9uNWJiTHlFMlVycTY0TWdtb3ZPS2lYV1Y2QjFMSFpnVHBR?=
 =?utf-8?B?YVlPcExJWGRGeWpoQnUzTEdlR2FCNHhibStzTGJoVm1XZ2oyeDBXM3BPbG9k?=
 =?utf-8?B?cm5UUExHdFRWdFlkdTgycjZWT2RRcUNYeWRTbmJCeWcrNG1ocWZDRDhqdFBT?=
 =?utf-8?B?LzFRQ0N1emJrRUxmeVdySkVYRWo0VTBISTlvenFneFVvdFplVVdmWS9IL1Zu?=
 =?utf-8?B?QWh2SDBMZVB0Y2ZvcndLYVRkVHZTRDR4SjM1ZUhQMGtnM05sT1h6NXoyM1N4?=
 =?utf-8?B?dDIxR2psRStTeko3NStJZVJZeUdnK2R0K0lQY1Z0TmorTVd1MzNYYkJKbHRz?=
 =?utf-8?B?K3lmMlorTi81UVVSeDZ0RXRDMmRJRGNsSWpmbmQ3L041aEJaM3pHWVROc2NB?=
 =?utf-8?B?OTk3Q0tMdk42MGtpWnQrSDNXZjBYZDhqQTFFeEM1Y1g3MHNBcWNrb0xhWUkv?=
 =?utf-8?B?dVdudVNMR25uTkNMenRyTW13c1JKNmN3WFFpOHBLaFIxaXZQeXZoNVc0azh0?=
 =?utf-8?B?Z3V5aHp5czB2VllpclBuc1V2b09VS2NsbnlCNDdTazQ2UGFvUkpCeHd0OHpO?=
 =?utf-8?B?U1lPN1VHNklMT2lEdTVJVG5nVGVmMzhNNnZVbFVwQWZBNzZJQkhzcUNVeEdt?=
 =?utf-8?B?SFVzdzdpcmF2U3UzYlNEN05ORzJqQ0kzUkxiTXNpNWJ3TEhsMTJvcWZYMnN5?=
 =?utf-8?B?UXh1UWtmRVVZSEVNM0ZIaXlDTk1QZ253VnRlaGxPZzZEV3FiMmtjVUtzaVUy?=
 =?utf-8?B?Wk5YaURneTFsRXFOMjE5QzVLa1NyeFozbWEvbWwrN0psTXR5c2xIM1FTalhB?=
 =?utf-8?B?UE1Fbjl6a2FqdGxHU1JPS3k5TVZ0ek9oMGh2L2lmMHUzU294WEJxOWdXOSsz?=
 =?utf-8?B?WmZ3b2JPQituZlRmRWxpa3RNb0ZISkt6amZ3dFhBNTU5MitBZjUrSmpxZ1k2?=
 =?utf-8?B?Z090MGlnbFk3ZVA0aHBWd05MYVR4bm5OUkFNQjdhaHhtTlVxNmhSMTc4TzRm?=
 =?utf-8?B?aUtkZ0owakFjUHpUVjRWQzllcFUzZVB2NFJSRzZFakt1QVB1UzkvUm9Sdktk?=
 =?utf-8?B?c2RYZDV0MFVWNlhqNWRsaGpPV2FRbndLYzJiY3pkTzdic2lPYTRVczg3NW9W?=
 =?utf-8?B?SDVXazlzWkUrTWlHNHRaZDl1alZzT1NXam8vN3pqMDdDbFF0SW45bklOeUxJ?=
 =?utf-8?B?ek16V3lxR05EbGhoUXAxSW9rY292YS9RNHZBSmZOSGVyc1Arc3FvaXJWb3Q0?=
 =?utf-8?B?V283M0RPRGFvQnY5b0cxQk9CVERrckd1R1Q2b09CTU5OOHdtYjlLaUhEeDg3?=
 =?utf-8?B?Ny9WUGZWallKWW0zcURmdmJ3bVZiaWZSM2hjUjRRc253K1hmb2lnMmFyR3Bo?=
 =?utf-8?B?TmRLSHBhUnpSQVV3YzFqOXM5WGsyL1g2RGR5TFA5a0JpTjRLaDYvbTZYa0NQ?=
 =?utf-8?B?RkJNaTl3blJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzNnU3dDeVVZMDkzWklxaGoxbVhIaXovMHorN0FCZ0ZMaDNpRWRHT0NIYlMz?=
 =?utf-8?B?WE5odWdYQnFWUHZWNFJ6R0ZZbjRtdHR6MGpBdEI1WEhWS2ZnSmMwMWdSWGV4?=
 =?utf-8?B?TFRnNk1EeTViWWFvS2NGd2s3M1lXeVpadGNDUXljUlVSU2FKUTQ0cUswV3pI?=
 =?utf-8?B?QW4zTXRscWVSWVV4UjBoYVRUR0d4WlA0TllvR3N6elhDRjhsTVRNMldZajdt?=
 =?utf-8?B?dFBjdjI5UnFvU05QdUJXYzFFZkk4V20vSHU0QVR0Znoya1Z6NGh0ZytPS0xq?=
 =?utf-8?B?ZEVURCtWZDQzcDJRamlHd3l6aW9YMUJQbkY1eWVNYkJTY3diTEdEaGVEbmhH?=
 =?utf-8?B?aUJPRU1EdkVOWXBnSkk5OGFPaVlnbGlSeDQ3bjhhczVibjBGS0Y2WDBnOTVn?=
 =?utf-8?B?b1dpVnlZSDdHekNBSldlMXdDdXNDSEVGM1VObmJleUdIZkdXVWtwMnhLVnZK?=
 =?utf-8?B?aGNCdVF3Ym5VMlJxa0dRMnp1ek4wZFJUWDhNb3N1UXlJaWFHbGI1czVpTjho?=
 =?utf-8?B?WkNEVUtRN2FMK1VJaEY0Qi9Ndk1PckYyVC9qR1Q2bjZRdUhkbGlIYzVpWXIz?=
 =?utf-8?B?ZGJlbGZzUzFNeU4xakVFcTZJVVVOLzdFUE85Y1lxOW5MY0J1d3FRNVJrWEY4?=
 =?utf-8?B?eExiSWpCK0ltTk04dWJ5dVp1RVpOcnltaWlmbVlwaC8vcEtRK1gxSGQvaWJ3?=
 =?utf-8?B?NVk3NWhDQ2tUbVkzdTN4ZFhtUzdRY2J1WGVnTlFKWUVpd0h0T29vc3pVYzdS?=
 =?utf-8?B?YXQ5MVV6Ukl6TUV4RVhxTnlYcGdMYTVTcHB3LzRObUNTTHVzWi8rWDhUdzlx?=
 =?utf-8?B?WjB3Qzc4eGVpanFFQlVSQW9RVlRnU1djREhkcHJKamhKZzRaeHV1cnY0NUhM?=
 =?utf-8?B?bVV2aFl0RUI5RkltcDVyc1cxLzlSNjNMcUxWQVg0WS9NY0U4YlBrbUZ4ZlAz?=
 =?utf-8?B?Qlh5ZFRCM00wc1N1YkxNelFRZWJmSS9NZmszRFMvR2xOVkRZNThrV2tzMEo0?=
 =?utf-8?B?RTNZSzFRVk9CRXRZK2NmNFB1UkxCNm1nbzFzZ2IwK1BmV3lKTXhvU3QvZE03?=
 =?utf-8?B?U0lRRml5bTRCbXBSVG5MSVM5ZFlCSUVRclNPNEV6QzBqTkh0ZjUxTUZPcWVa?=
 =?utf-8?B?RkZUTW11TDFHcS9CMFdPRDBPYTBBSHlab0FBODNQVTVPR09id1F3S2dvekJ4?=
 =?utf-8?B?dEZzb0MvWU12MXgwZDRqTitmRHNwb1ozTXlSK0VsZkQ5cVd0VFgyc3dXbXNB?=
 =?utf-8?B?OEtXM3pRdk1jVW1FM1JCMFBjNXkzbGl4QXBUQlljaXhrQTJZRGdiT1l0QWRv?=
 =?utf-8?B?V0pMRUJnM1VWdjV5T3lWSlVMRmFKanZlTnRueWc0TGhhczN4ZWZvRmgxVUkz?=
 =?utf-8?B?RXFCSzhaMkVIU1RaaUhXNGVwM0F4VVBqdUFTbXVBSzh6dW9oTVRkTDZiTWYx?=
 =?utf-8?B?eWtLV2FEbDFTOFBoZjFGbnJvMzI4WWh5RU96UUF3aXI5VFJ2alFqVmVBWmFO?=
 =?utf-8?B?WHo4QVFmdFpraDFsK3J6a1JkbEs2eGIrQ2tPNzVjOVQyd3hIVFBtOTlBWmti?=
 =?utf-8?B?R1o5NmRyT1lyTCt0NUVCSFUxb1BmcXNGamNMcW9HbmtselVRaHBmTE5VTDNh?=
 =?utf-8?B?Y0RoNDdXRjJyUVIyenNkYnVkTDFuNVkyZi9KRUphZlJKZGdHMFZUWDFKekFB?=
 =?utf-8?B?VHFKRS9WdkRnM3ZuMWpDblZOYyt2aHRwZGg0N3RYUXVaMHNtSHpUendaNHB3?=
 =?utf-8?B?ZGU2QTR2TG1OaGQvWkFyaFo0aDN5YVY3c3ZYVHJrOGdTbzhTSFFWMU4wWVpO?=
 =?utf-8?B?T3JDMzJNYS9xTTFtejh0M1N2MEpNRW5DdmZicjdqSmw4N3RCMG1GdWVUa1BZ?=
 =?utf-8?B?dHdtRmlzSTlJdU1JRTRGY3RjdWJPODY0WjdlK2dRWlBBUnlGNVY5Y0d5Sk5I?=
 =?utf-8?B?U3lRUnVGV05wMTNmKy9CTXpiaVF1NmVWRHZGcStHd0tMTmpSbmdQQ2h2ZVov?=
 =?utf-8?B?S1RqdmZyY3pRU2xFa2pZTXpWMVE5RzdkOU92aHN0QU1IcXVOaFV4SEtaZS8x?=
 =?utf-8?B?REVBZDJJVDRkYzJrblFFRThCdTl4U2ZrOGJkVCt3aXpxMHo3UDBxZjI5Q2Q4?=
 =?utf-8?B?VVh5ZUNHa2pwMlVUWC9RcEtrOHNpVGtkL0xXVjQ3VGxVWXg3d204K21xZkJD?=
 =?utf-8?Q?szbfQuSQWKnMEfddEGaD2IIGqLjr58Qj3cJbRqHy9gHB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ba0d9a-5a47-49dd-e7fa-08ddaa80b011
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 13:46:24.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sV+rpv2pWU9X9b1e/LWJ+WY5VJqHcjUCqXm3bKbclt3aUgiElq9mxotzoW9x//NrE8nW7gJOlTGptO6cgPkfKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892

Implement `Borrow<[T]>` and `BorrowMut<[T]>` for `Vec<T>`. This allows
`Vec<T>` to be used in generic APIs asking for types implementing those
traits. `[T; N]` and `&mut [T]` also implement those traits allowing
users to use either owned, borrowed and heap-owned values.

The implementation leverages `as_slice` and `as_mut_slice`.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kvec.rs | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 1a0dd852a468ccda6ea1b521bc1e7dbc8d7fc79c..3f368d4a67683ac5a0ff87d7df33a3bb640ced59 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -8,6 +8,7 @@
     AllocError, Allocator, Box, Flags,
 };
 use core::{
+    borrow::{Borrow, BorrowMut},
     fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
@@ -890,6 +891,62 @@ fn deref_mut(&mut self) -> &mut [T] {
     }
 }
 
+/// Allows `Vec<T>` to be used as a `Borrow<[T]>`.
+///
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// struct Foo<B: Borrow<[u32]>>(B);
+///
+/// // Owned array.
+/// let foo_array = Foo([1, 2, 3]);
+///
+/// // Owned vector.
+/// let foo_vec = Foo(KVec::from_elem(0, 3, GFP_KERNEL)?);
+///
+/// let arr = [1, 2, 3];
+/// // Borrowed slice from `arr`.
+/// let foo_borrowed = Foo(&arr[..]);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T, A> Borrow<[T]> for Vec<T, A>
+where
+    A: Allocator,
+{
+    fn borrow(&self) -> &[T] {
+        self.as_slice()
+    }
+}
+
+/// Allows `Vec<T>` to be used as a `BorrowMut<[T]>`.
+///
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// struct Foo<B: BorrowMut<[u32]>>(B);
+///
+/// // Owned array.
+/// let foo_array = Foo([1, 2, 3]);
+///
+/// // Owned vector.
+/// let foo_vec = Foo(KVec::from_elem(0, 3, GFP_KERNEL)?);
+///
+/// let mut arr = [1, 2, 3];
+/// // Borrowed slice from `arr`.
+/// let foo_borrowed = Foo(&mut arr[..]);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T, A> BorrowMut<[T]> for Vec<T, A>
+where
+    A: Allocator,
+{
+    fn borrow_mut(&mut self) -> &mut [T] {
+        self.as_mut_slice()
+    }
+}
+
 impl<T: Eq, A> Eq for Vec<T, A> where A: Allocator {}
 
 impl<T, I: SliceIndex<[T]>, A> Index<I> for Vec<T, A>

-- 
2.49.0


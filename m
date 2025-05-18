Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7B31E50B;
	Sun, 18 May 2025 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747572734; cv=fail; b=lI8ppMWgzIBDKAOeA6HqjxUlWGcbqNg1qnOgUiMFfVtI8w8AS2jB7DnGfnD/n1RMw+xBo+QdssTxwKKQGrLoC1uIr+kxgWfylO/3F1iZkTxjBK2ZjAmU+sQSDb4JSgWseV8JNOdDtQ2AMzmYGb1FUDef2Rkpn7OuEr/K2eaP2K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747572734; c=relaxed/simple;
	bh=wpe2xwapSTf9A15OLGrztmeIKggNOGaaXTOEXMuMY58=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TKgvLFe4ila7guU7PL1/vV39BW1kT8CMPusYKLtencSJztvXwTUA0oz0GUWCT0Xifn1aEquKZngKg+xfnGiTxmt1oH1KcjRomZTGuf4UOS6dUj3KJqKSxyuJ5d3vZaMmmQdmUgRdVKEePcm51FbxQQbAIaA/IWXfsSvBmrePK/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FF/Ttar8; arc=fail smtp.client-ip=40.107.95.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FF/Ttar8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1Xa5mjcAC7Qb3ofb6Wmd2zu9ZeYYKOaCipG5OUR5rrWCBjolaXETv9JmcrKCuSuaFbuyRGl0OYX+TEAmeoUhjny0BKdplvDpN6Lzz0bUOm5/l+a6PBfGH0Ns8GKJp3Z/K9KKUhY5YA3wwzmkp9hyw6Zcq7u0TkSzIkL9pxZMwcre2xr9GSeWzFg4q0SQY1LalSC48RwhhAM/DVuav6VIgoENJHaJkBzmPpZhvBQTI1y5A3VolfuPBLmbgwZ4hrY+UObdJe7r66pq+eRpjTD9ihF5zhO1EUx01M9vXq40tWYZkyluDQAR2T/XNRWS0MXUeBzVyG375iCU9Fz6VGweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOppqtPtZJ2Q1RGdQEtzWUJHBRe8t8nYoI5q9JLYX6E=;
 b=ZSbCmOdpj+TrTqYyqJsSq54qzk+MNRb4PROJQwbqXynHr2qVfYwGldxmcGtlUjSXljE3McF1dbUhx7Zm6793s7YwgMwm9RMYbGqL7yyrL5vaq2mMTCU6hYYrzCYmBJQNLaLfhbuEDtqzoXqGkq0A6O3eFW84RgcKoM5sJKOzigknnMArr9CmMWKNyjSc5qEbT6I6YeEhyrqL2qPkwHJ0SYiLLKGxUEU+6IEx6rq2rxg4UcXbWI1ehX8bWO5zVOnPqaTqSeZZr+j8CNQpGGGqgQSVfP7WidNNgt7f+iehGk8+kBUv3SbdCR0hx/958qARz9LXiEKZsESKY62QQG4yWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOppqtPtZJ2Q1RGdQEtzWUJHBRe8t8nYoI5q9JLYX6E=;
 b=FF/Ttar8Rtw6YubjPk7FjSH2Ayq/y3dPc5/dpl9DiILe5FAD3ljudufuqHDpB/R3Hrjalhlxv6eaaGFSs9eKUS1OR46DMktMhKefdEwn6qMHvfNi7NLwaf/zPRRreNT/o9mCV4r0iliq5zgTvRNolGNJtfq2dSoXoAk6S4U37LV10rh+pdXss9PeSXLhtfXOxvMVE0mdBeJvhYfYKbFc1FWBvVmpzHBfZpA4ZpD61InLqEC+ZWgMbq5/anBd52Pyo7M1tie0MnRWB+UnnhlCmMiLuPb5sTHaESrMS6KKI+UU6FueSC7+KfC4JaBQH84FMPuM4La1DJq7PlCju6+2uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Sun, 18 May
 2025 12:52:09 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8746.029; Sun, 18 May 2025
 12:52:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 21:51:33 +0900
Message-Id: <D9ZATG8GW7VO.3CE92MUKXU65Q@nvidia.com>
Cc: "Benno Lossin" <lossin@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>
In-Reply-To: <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>
X-ClientProxiedBy: TYCPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:1::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b79d9fb-a7a1-4b6f-3254-08dd960abd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mm9xRlViREtsREJiOFpUaGVuc09nMnJpWWdpUHl6VFV4R3ZhZ3M5V1VXQlE4?=
 =?utf-8?B?eWZtWDlqdEdqejFZQVlVNVBOUFZabDdIeGI3VGJKRThSVmt1TkM1UGp6VjM5?=
 =?utf-8?B?UEgzakRuRnM1U1htdzJEWmVRNjN4dlJRaXdKQlJNN2RTQUxOdS9ldjlaVENS?=
 =?utf-8?B?ajhyN09zT08wM2dqT3Y4cnRZR0VLYXF4em56NkpIR1hkVFhlbVYvOTdtS1d6?=
 =?utf-8?B?RHRGeTJUdlJxaVNBOGRCUHlWeDFVcld5L0RodUNMVUdsSXZ1TzlkOEoyb2F1?=
 =?utf-8?B?dWlWMzIycTBFUCtmSjRlWFdaUUQxcDJyR2tIM2JnMUdCTDZ2SEUzTFFYUnMx?=
 =?utf-8?B?YU91M0RPdGlVblRleStmQ3BpRjVhNjk5QTZLb1MwM1BnSkU3TlJ1NUxNUUxV?=
 =?utf-8?B?VDZleG5JSFJiUk1vb0N6VmRXdEtaWjBpcDJGdmFPWVdOZkhaU1BNQkg5TXlL?=
 =?utf-8?B?VlpHQ0ZuOS8vZHI5a0JSdHZub0VRQVp6NkIxU0RNMDJqdXNTYURpV1N2NFpY?=
 =?utf-8?B?V3JXcVJNdjBkdTBFUGtrOUM1Ty8xYzV5R2M0RnBldlVEUDRKc09jbVRUMHUx?=
 =?utf-8?B?bUxQOHlMWDJvMFF2QVg2WmRWM2FtYzhqcFJjUlMyeVdUQlZScS84ZDJGUGN1?=
 =?utf-8?B?cHdzRVROd2d4KzZhS0swYlYxQmI4cVY3NUJnUDZkWDJheVo4Vk5oWlc5N0Fm?=
 =?utf-8?B?TENQWVFlcytFYUlheS9VUDFjQThkcDRQd2FvYzJpQXp4YWV1YUs1WXRYTlFz?=
 =?utf-8?B?TUdzczRPYVI1QUNWL3NZMWJLRWJkSVZVdXFlNitEemh4WDdrQktRK3FnUVZi?=
 =?utf-8?B?SEZvN3kzNGRnMWZxM1NWMGkwTVVhNWg4YkRQOXVXWnJ0NzBKWFZuVXhmR3dU?=
 =?utf-8?B?aklDUmxReWlWMmZLdmQ3b0d5VTVUSmxiZnpCUnArWUxRN3R6OWRQaWZmNDJu?=
 =?utf-8?B?RmRXbm9vcGZROHJxWDlNS1AxekFYdCs4UlZROEJ6a3ZRVVVKZHJxY1h0NmRF?=
 =?utf-8?B?QWJKcmtHdkpLT09hTjFEZmNCbVBocXdSalpIMjFOakUvTkhaRHd3WkVhZTg4?=
 =?utf-8?B?ZEFqNjU0R1lwL0lvZHQ0MEdVOWkyeDBiNVIxVjdZZjNPUUtaZFkxcjBTQjY0?=
 =?utf-8?B?TlN6K3RLSXFiY2ZFVnpUV3hyRStvQnJWb3ZhQUpYWlJlbXVLNm8venUzWDVn?=
 =?utf-8?B?TDlpUzdhUG5odU5LRDBvWCs5cHlSOHRtbEtWVW5GTFlVclFZSElOWVpVbkov?=
 =?utf-8?B?SjR1S3FzZ1BPU3RTTTlUVFkwQ204NXg1Z2JMQ3FrSkMxNjJNeklLOTMvb0J6?=
 =?utf-8?B?UlRNY1paZHdZLzc5c1lmZFU1K0hKRjJlM3FDaFNRbDNtUVVTcUxVcXVSdjRq?=
 =?utf-8?B?YWFUTTdzayt6eVhYdUF1NWprNmF6MnhjWkxhSWVKZGpRekUrVzVxWWdVRXJa?=
 =?utf-8?B?LzhGVkJaejZSY1NzNzVhNnFLNW12MHZmL2xweWVyUmFOUlhzVHN4Y08yNlRu?=
 =?utf-8?B?ZlZrd0lCd3FCSDQ0eDZRUTI0YXo0OEI3R1dLemNlN2tjN2ZDZzlZVVkyS0Fo?=
 =?utf-8?B?MHk4OXo1dmhOT3dtWW5RclJjTFFDRXdkY0c1QVdMVmt2azdxM09hYlNjN2Yr?=
 =?utf-8?B?clVLV2VDRXgwam5oNTRWQm1NcGZpOE9QUkdvVWllcXltd3RZVVc1SmE5d2wr?=
 =?utf-8?B?UEZobEc5ek9TWUN5ZGdFRHFLVDNmY1NBanpHUjhFWnEreUo3QXhwbVV6TFg4?=
 =?utf-8?B?S0pLTmJId1k1VzZ0VWpRRThzL1pMRmFCZjdSUEUwNGVVeDA3dnF1ajdhS3Nq?=
 =?utf-8?B?OSt2bHVsbnNIRkZCeHRPbVBYQVNOVWZZVGpoRytCVm5ZV3pNMkpkNlhRSmhm?=
 =?utf-8?B?MHB0WFBwQ3ZWMnlXYWlzU0RqbjFpN1hrM2xjcjlhbzZEZWUyRTd4SDUzNjE3?=
 =?utf-8?Q?lIlxpm9vT80=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0RhMEJDZjk2VEFuelplTkhjMmp4UFdnajdYRTQ2U0ZHRmQwQm1pa3ZqbWs1?=
 =?utf-8?B?bjNQRXh0ZEhZYzFmU1B0OG9oS2x4OXVPWXRTTXFjdE0rdXNpZjNuUGdyOXNi?=
 =?utf-8?B?YXVIOVBQRlZUbVRZcGhzL3VvOXZGTTEyb3o0RkdwQ1lOWVBHbkNJb3JqSHNk?=
 =?utf-8?B?Z1U0MVhWRWxyUWpDYkhjMTE0N3cxYk9yT3ZZTE90Q1lvMmpITERiYjVONm5y?=
 =?utf-8?B?TEJ1K0U1KzVicEFnTGE1ZlQ4cWhZa2s0VHNGVjJKYTdvMXI5a20yZTRWanJp?=
 =?utf-8?B?SG53MlQ2YmRYanZndktpOGRDTnJid0lla0pvcG01VnZZblZ5ZEMvSEZHVDMr?=
 =?utf-8?B?b0JiZ2YyMGI4UEFUeWVBMVZjWDBXV1pFYlhod0MzZko0MWpkYjUrYlVNR2tG?=
 =?utf-8?B?QWQwYVgwb01IK2hjME5qd2Rza2c4OHM4dmJwaXVBcE5SVjB3Tkc3Q0E0M1lu?=
 =?utf-8?B?cGJQdlRFRmdyWm1qU0ppQlI1QnRYMnZTcGNsQVp0SjZiZkNJaE5IRGd6ZzQ1?=
 =?utf-8?B?cFdMVmNiM0FGNnRaOVNBRU52dEg5MnFHUTBGUzdkS1VBOEs3Tkc5T21kbWdq?=
 =?utf-8?B?UW8zTjk4YTlDamdWeVdMcksvdUVUeTRia2UyYUlLQlFHamlHY2R5TzlZcXI4?=
 =?utf-8?B?elBSU3VIWmVmWHdrcVdKei9zV1ozS3JIU1lLbGVXN1lEd0FMczEyNXFPYTY3?=
 =?utf-8?B?bkl0RFVXWGtzdGE4bllKaGF6b1Q0bXZVeXR0ck5kMlZPUlM3N0ZOeWFCT0k4?=
 =?utf-8?B?L0s0aEhRVThDdGEreEM2Y01IUTJiZUpNOXkvcmo1YzZOSGlWZjBwYm5kYTc3?=
 =?utf-8?B?aEU4Zzd6WkpzSDJ2T01wR1I0Tk5PK1BZUzhKRlM4YVpGQi9pbWpLYVpFei9B?=
 =?utf-8?B?QmpYbjkwS3ovTGd1VGp3Z3ZDZWN5dFlPTHBBRmtsMTZmaTRyNTRPOVFubVE2?=
 =?utf-8?B?eXBIWjcybmFBb0JUQkRWS2UrMFNNbkFHWnduU2FOc3lTaXIrMzZ0R1BDSVNk?=
 =?utf-8?B?QUFjMzNVdFMwRlNIM1c4TEl1NUVRellGL0x3UDRLbW85TzZ3YlJwT0pnTmY1?=
 =?utf-8?B?R1NsVU5TLzZjUmlSYzhTdDJFNUtxcDJUZnBRUFZSeUZXdngxaVBzY2dXUUZv?=
 =?utf-8?B?YzRSVmFvR1NjYkJzSDJiNUQ0Z0lWU2U1RkVzMzkvU2NpVFYrY3ZvVjBlOUM0?=
 =?utf-8?B?SDBLVG43Tk9uc3gwbEVYQm5Dc0MzSmo4cjJ2OU9zeTJJNTJRbzF1NkJlSHMz?=
 =?utf-8?B?Y3dnb1hoV2VvV0szdGFMK0F4WEd3ZnBTMkJuUGc3ZzlQNTE2TXhPVlpVbW96?=
 =?utf-8?B?RFk4YzViQTJPZkRoOGdEOFd2ZUZTMWh2RVhlbWhZMTkraHRhOGlEcUxHY0pH?=
 =?utf-8?B?SXN5MEdDMGFxSW5qYnEvSkl5NVFVTXI2NmR0MEROSlo0M05IK2JzMGhpdWFi?=
 =?utf-8?B?QUY1VjhUSFdTTE5FZkRPSmYvNUNyRWw4b0tsN29GTGF6RHl3TE1tdFBxT1Rn?=
 =?utf-8?B?bWdDWlp4Mm1ldjRoZ1NRZ0hKOG9oN1dwZ2E5R3JCRm1GNVlMV2JtUXZ6aUc1?=
 =?utf-8?B?V0hITzRnZzgxN0JiNkpNc3FYWTBMWklqOFdGcHl4T0NNeXRvVVRtc09VdEU2?=
 =?utf-8?B?MjdLcGpWald4a0dnL1FEVkUza0pLRlhUam1VTnNNVmkza3NqSHRLVy9lT05F?=
 =?utf-8?B?bCtMYWdVa3ZvYWZObzJ2bklUZWV6NTJQdUZJQ2dyR0NqaGFLZzFPVmxzNGtD?=
 =?utf-8?B?YUx0NGFxdjhTc2lDVS9pb29rUG9ieHlJMitsYWpjeFFOQWpIVW5RcmhLMk90?=
 =?utf-8?B?bGQzNmZSMXZZZ0pUMXcwak00Q1hnanhYc0JwMHJVcFdZNkswQVlWTG9OTmE1?=
 =?utf-8?B?K1pQSmhndG1uSDQrNUszZGYvQzZyL1c2bzZuaVBZNHRmc0RMOVVTenZuYzR3?=
 =?utf-8?B?RW9GRGtwaEFqMUdKYnR6TnV4SVorOGo4UHJSZjQ0MmlVenlUbWp0U2dFTWNp?=
 =?utf-8?B?YjJVOTM3eUg1UUJOYzBOZjk1cGlLRGh5bEZmVHVaQ1pueVlhcEtURUJQeU5Y?=
 =?utf-8?B?aVFVVTQ4MW0vRDVOM0F1dkFkd3krWUw1bG9QSTY5Mngxc1JDZEY0S2l6UjFx?=
 =?utf-8?B?bTEvSTJUWjd1S1d5U2laSGRDSmM0dzZ3eDJWWnVkb3FIS3JwS1ZCRzdhY2NV?=
 =?utf-8?Q?ROXbvtqqslMgXRHSVPWld75OQcbBRfQRdTIhwzkwNPpS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b79d9fb-a7a1-4b6f-3254-08dd960abd81
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 12:52:09.8258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8RMAyiW/hTCKfw2JSZriOW218Q5+07BI6IKV9cwN6GYKQ777LSCsfwKGj1kHqjfG4tae0+yczKq1W4iwOAitA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193

On Sun May 18, 2025 at 9:20 PM JST, Mark Brown wrote:
> On Sun, May 18, 2025 at 05:14:41PM +0900, Alexandre Courbot wrote:
>
>> The initial proposal does such clamping by design, but I also suspect
>> the C API behave like it does for good reasons (which I am not familiar
>> enough to be aware of unfortunately).
>
> It's so that if you have multiple logical users within the device (eg,
> an interrupt handler and code for normal operation) they can work
> independently of each other.  You could also request the regulator
> multiple times but that's often not idiomatic.

I guess this means that we want to preserve this use-case with Rust as
well?


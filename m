Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D4F217F53;
	Mon, 16 Jun 2025 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086542; cv=fail; b=IX9I1EpRMIOyCfbj+dVqfMmZcMC4Uiv11o7gzyZFrXVpzcvELT1bEB+6pAD1TBfo1Wz8FsyONg+XmT+CP0ZXW4RQlqKlcm0qSMC6L8XsM3K0wWLtEzt9pUwGLPS0AbcafZ/LbVk1KdYGtpe5F9pO+9cyYs/ntVzxt6JUrRZiLjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086542; c=relaxed/simple;
	bh=Q23JX8JyYCqUxp9JboNtegLbrpdtDBE4FUT7+YzEYgY=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=W3aWIkE6flUtbXZAhaZF9uBXE5FzGBbSOoGCh56qgff9i/qmE5x0ixlVPUEG2R2ne+IxN94RM+6VXHERGUHElLhdWEl39ql+9hLa2x2KEr97R+k/J3fTF7Nocf6NAMl6EwJv30CJEz7HqiJUtLjCwz2F7VvdBz4i+YSv3JGF2TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tFg3Dk9i; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tFg3Dk9i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bY00On2T3qSL4JGuxx3KjVlqN89COJ/sPHOfLgDa/cmp00ULbIqSxL+2xsrnW1bR2dDSv4oFtzJ9s2ULpRB8a08dLJBdla7EWz+fJEORUdWRgvb467dVr76HnfoGWzsGu67zPW1tK000YQQ9CGHuUqPfD+53ariboEg+rcUtk4UcIkzXriIRU+Xfs1/JU56On7Avu4/++FC0jqYFSiHSLVifA2GFHHDs68eeai8Vh+K2fNyrLztt0jREV3ydz47SN1moP7SNy5q4esdD0NueEnwfug3iVHiWecnOTSHIKvDW0SA+F+jrFv72A4F8Kgfix6nNqJtUz5FJmZAMrphjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kTMyWUKnf1qn1B4a0nut1TD3TcpDDuY5zaOdhzaCHo=;
 b=xGPT0uUvqXoyjNHqVXBP7+IcQFP7GCwOsHNHRZo4P0Ea0KVnSoton2YFtS0qYWDr7n2VTo8s5uOZAKDVVhff51OHDJwpFhEYZEfy7+e8BUxzvTYXBsdQt+O5oXo5AfcwBRp5CleImvSgMYpX8cuvmCMGxOsKUqnnHiqjeccyrY9PYp9pGV2oT4V6RMSJSTyB1PrB15CgGMWFi5za+vaMSuqikJ+QDwQWKAiNSW4MdcMwBjFnysbaY7Lh9JyrYn4Z6RcTEE+4GbNp+vi/2Hk0SktTsIIVrxTb64tt2RujxqzIRp2nsiz4s1y/Cd/4kauG1/0ROlv5paAIcO4W7vSGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kTMyWUKnf1qn1B4a0nut1TD3TcpDDuY5zaOdhzaCHo=;
 b=tFg3Dk9imz7FsBpG6TNhKtdVSQ8XcSXLtDEDDHqrsQRIsVBgs/BwfbUywqlb8qaU10AN+0zxvq6OLFk1rJ/qj9IzcHpnSJGRcKr2hnUpYUWhpglQYfnqEdwkTNcM1Zdd4krYcaA3peuTIF74aQcBqeFyCMD6I00O60VDjgz9ZvQihyR8zOEesr4wIEME0IGw9fisHek6KDMicuJb33llwNN22oVMqLwLKxgUWoRZ9GKNPkIu9JtbSF7EhVO19PjLtfi9KjmwzkXgGqPHbQ6nlsbyTxJQxmL9a86oUh3FXAexlYQvdIM3Uq4mnzgf/G4M/BMZBLqDnYftlObgZwczAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7280.namprd12.prod.outlook.com (2603:10b6:510:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 15:08:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 15:08:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 00:08:52 +0900
Message-Id: <DAO1WDWJTT04.1P4XT0W2XHPNW@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com> <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com> <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com>
In-Reply-To: <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com>
X-ClientProxiedBy: TYCP286CA0299.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ecfa50-cba8-4fcb-c8f4-08ddace7b62e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?am93dnRtRFY0QTA0MWxzMFppM3RFOU9DekhJek15VjFzNkRoZTlXcFFULytr?=
 =?utf-8?B?Y0w2bmFIUktTWGRXS1EvU29kWlhoZFBqR3BwSE1RL3FzV3d3QUVBVERlbjc5?=
 =?utf-8?B?b1ZYbFlodG9hUUdnRmRrV2RnU0pIbjF2dXpSOVNKNmh4SHVWeU5rOElBcVhJ?=
 =?utf-8?B?bkJ2cG5NSHZTK1I1KzI0clpzM1Q5Y0dENWpxdkV5Zk92ZDhTZ2Z5ZE5TZ2Fp?=
 =?utf-8?B?WEp2V0RvME0yeitYVllFbXZLYTltUTJab0FFdUJVRjh6bUFFUk1WWEZRWERN?=
 =?utf-8?B?bUVHb0dGY0hxTGVTTGJiSUZ2OElWZEZvVkV6WVlPYnRSNXBEcGZXeEtranJv?=
 =?utf-8?B?OTl0RVhxbFZhQWQ4SlJ6WGJiTVZnN1l0UjkyUlFWZ0lCUUZIT0hNcjZEeU5s?=
 =?utf-8?B?MmVYV2FFcy9MM0FtaE9iNDJoNnlFK2pmN3NIVjRzRlRvNWovRmlOejJmTkRq?=
 =?utf-8?B?TXFDUHFHWWtsUkxQWS9BS3dEaFp3TElPV0dvWEoxdzdGWGhVbDhJWS9mcmJU?=
 =?utf-8?B?Q0swVENab0VLeS9EVng3UDA4VzZobTVqQzhMNWJZOGMxTURhTDl0QzZlRGR1?=
 =?utf-8?B?SHpWK2tIdzRvZ3J1eHNINWxLN3d4dXFoNUJXQS9rYUo4T1JBZWw2YStHU1pE?=
 =?utf-8?B?QkpjNHdITGEyU1ZxZ3dxbTBvcDJVUjVhS0NWYlhJRU84Mzh4OGxyVktyQUQv?=
 =?utf-8?B?ZWpsYmJXUXlQVzFLRGtzU1UxenhHVmtXQzVBbTRTcXhJMWZOSUxXcnhUMWRT?=
 =?utf-8?B?TGNmRXhETzIyMTJpOThSdkxka3MvYkRXV01ETjc2SWVLcU9lbEh0NTRpekRS?=
 =?utf-8?B?bWE3ZzA0eW1HQk9iYzIwNExuSzk1aFRBVkJ2aUlub2haM3RVMDJNYW5GZjRx?=
 =?utf-8?B?VzF3R2hRMTBiK2V3SndVYTA1NFA4QldTQU56bjFvSU9iNzh4TlhjY0czRlFS?=
 =?utf-8?B?UWUzNVVGQnB6ZHBpZDZrb3pQdVRjWUNDVFlZSVlzKzY2Rms1RXVHKzlNZDVT?=
 =?utf-8?B?clRiWldSYlV4RitTZ3Fac29FaDdNSG1RZFZodHBMSGlhbG1sQjJiMDhMY2ZG?=
 =?utf-8?B?UVExMG5DQ2pSTmc1N2pSa3Rzc21nOVhMVUtUUyt3UDcySGo5R1RGNCt1TDRi?=
 =?utf-8?B?L0hGWjRLR3k5dE5BQzFmeU5GYUdQSHVQU25ROTJBUU0zb0k3VUtwUUZmY0FE?=
 =?utf-8?B?U3c0VDlocS9SSXdHcm5YYjQzN0JwNENKU213dXVTMTVmazNaL04wcTVjK0JH?=
 =?utf-8?B?OG9NSDFtNVlueW1WQ3JSYSttZjhEeU1UdldMMFRBOVdLSjlySHBkZklHTEdK?=
 =?utf-8?B?cFExT2dYMGY3TVFMYWNWb2hhVmpTSHljNFA5Vk1rMkwzZmhYVThubUZ0MkJx?=
 =?utf-8?B?R3d4ZC9pbkhMQlFvZkJPeXh6ZkcvNDBtallFYmZsVWltNFh1ZytPblowcXR4?=
 =?utf-8?B?aHBVNjM1N2xQWFc0K0h0RmRwc3pnTDlEK2RMeWNyZWdFZTlvRFNRVU5xQWwz?=
 =?utf-8?B?MWJGaWxPaHZvU3RVMXJmTzlUTStVS000QXpheFF4YmtBZ2dKaDB1ZkhMRUlt?=
 =?utf-8?B?S0ZMOWlOZ3FCSVh3NEMycW9TQ0xqaXNWalprZG9zcjgyV0hMSzVhQWhPL1J2?=
 =?utf-8?B?bmVVVnAxWXhVeVdEZm9NR3BlTGxqM0JPTTlZK2h4NG1qM2lmVzdlTFg1Qlgv?=
 =?utf-8?B?WWsyU1I3NGM1dGZURUhWVWM1VWhNai8yUzc5M3Y5bzNHOCswTWl6ZU5rTldD?=
 =?utf-8?B?UzVsUm13SjdmUWlnbEI2MnlNeFdxY2svWmpzOGZVN1B2Mng4N3RoWlZsc2ky?=
 =?utf-8?B?cFBoWEZ0M25naXRyYjI1bTJHYXpWbGM3cmVFQU5XaVpuTUNpN0xMMUJJNkFM?=
 =?utf-8?B?eDZTcExocVg0SVluV05JMlp6UnJ3bU5teUFaRHRzcWFSK05KTEpFU003SEZE?=
 =?utf-8?Q?MRFfbulgjoY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZtTUV4MVhYcWdDZmZMaGZ2VUlXQ2pwSnBQRFJlWjM1VHd6RVFMcSt0b2F1?=
 =?utf-8?B?Z25yWTh0Y3VkV1dsT3lmdzZFRU5BYUpaTm93Tmg0ZmtWZ1ZoWVU3TnArMVNH?=
 =?utf-8?B?VjRCS2tnU1A3WVluRXhVZUZDaGR4TzR6cnhUb0ZNWm9CbWJKS0REUU5DT3lj?=
 =?utf-8?B?Q2dHdSszK2RodkxHZ2NSRWl2U0k2KzNXMENwZE1lV0VSZHNHNXNDcXBPM3Qw?=
 =?utf-8?B?N3Y5L2ZTRlJCM2tObE5lSDlrTi9CaUpvckhDSDZRS2pVZmNsMXQwOU5rSUp3?=
 =?utf-8?B?UGpFZ3B4ZExZaHNnRkV4bHdjYUpiK3RtcC9GUkdGMm4zT3R4SUV0M1dqZ01Z?=
 =?utf-8?B?dXZ4TXU4RVpudXBZOWFxbHJ4ZDdmMGhieVVLMEJiYkVWdDNnbzFWZHM5cmgv?=
 =?utf-8?B?QjVXM3FMUFppSGNmQWZqd3dvVHFPV1ZKL3B2RWk4NWVFYkpKUGUvSHdLYzYx?=
 =?utf-8?B?LzF0SXRadVJBb25TeVBBNG92cXZ1aVRXc1BrbWEwNWc4bHFMbkRJOEt3MWdt?=
 =?utf-8?B?WDB3RGp6dnlJcGExd3dFUFZNV3N2MHRuSDJmTEZMMm1MalB6VFZOZ1RsVmdO?=
 =?utf-8?B?WDBMb2YvcWFITEFpZWdhdmJHNW4vb3FBbkRZb2p0NnZtSnVQUTkzR3F0YkpI?=
 =?utf-8?B?WVo5WmRISEZMTTdteVlNY21tOVdKejdaRFBTajQ5QzJoOUI1MlB6TnBDRk5L?=
 =?utf-8?B?QVB1T0RMSlNMMUlQNEtCaDAzdDFoZjBiRVozVk5pNUYvTDdkQml4OVk4a1J5?=
 =?utf-8?B?ZGl4YjlmQlVZMExvcytYdzhqQU5hWGw3VHhsbllqcEt6blBma2tKSldWWFAv?=
 =?utf-8?B?Tktvd1pGYTY3VE4vWlk5bHN2WER3eEErL1ZrTjJxcU9BNFhVaWpidjh0a1Np?=
 =?utf-8?B?djdWWUZ5NHlUanpYUktuWmVqTGdVNEVWN2lyeVZUUTdBZFYyK0JHaHJXeks5?=
 =?utf-8?B?ci9HN1lKVUZXT1ZJUmxZNVRWL2tWVm92T0pOVk1ObXFhS2YwNnd3cko2ZXZO?=
 =?utf-8?B?amhPcTZRUEU0MHY3S2d1V1VFZVVrQ05vSG5RMHhYUTZxOHJnLzhpTG5KbTJO?=
 =?utf-8?B?aHh2ZW1ONURmd3RzU2JLMFhlV1dEOXVDN3ZjM3lEbGQ5bnNONWRxVVJ3cXgy?=
 =?utf-8?B?T3N4NEhrQlFZMEtSbUhCZVh4ZGFrdWVNOUUwZlBYMlJuUWRPU0F3VVU5bDhw?=
 =?utf-8?B?SUljMGN4aWE0K21QQjRZb1IreFZ1Zy8vZi9tUEtvbVBHVWE5RXV2L2pTRFEr?=
 =?utf-8?B?QTBWZEl3S1Rlb2N4RXVuNnQwRm5sVk1EUERBWkNHSmJNcGRwQTJ4TXV1K1NI?=
 =?utf-8?B?enVNZ1ExSmJBbDA0dnpwMHB2NW1Bb25TZ0xUb3FNY0pmZmN0cDRudVY1bXdy?=
 =?utf-8?B?cmxmbEdUOEZrSDk1dzhNYmQ3NlFMSmR0MnlKam9lU0hmSlVMVnoyeXNvZ0Y2?=
 =?utf-8?B?eHRlYzZkVGR6dm1NYXJpVFFzT1oxMHI0QVBFY3RJT0VuOFVrVkxOcG9ZU0Rn?=
 =?utf-8?B?TnAvdStpaVRDbDd2Z2NDRHhiSTUzSGMyYUVsUlFScFo5Vk5GUjVRUTl1Qk9v?=
 =?utf-8?B?U2V3QTl2cHF6dlpyd2s1cERCc1Q1bVNreUF3RGhIUyt6a1BQWVBwS0hVMXpk?=
 =?utf-8?B?TzJQSEhPSTgwd0Fpb1l0QTM1NWpKS3JlWXdZUFZSckp1SW5LMnJIRmNnaVVm?=
 =?utf-8?B?L28wNWkzS1hMdGRwcmlQeGd3YVY5Y1R1YkhMcVcwSXRVUWh4WXNDa0xTQzdD?=
 =?utf-8?B?UUtMWTJSMFp4UCs0YlpEN2tiSlFRbkZTUEJwaVdjOWwyb1pmYzdrWVlZSWpy?=
 =?utf-8?B?bDNDRjFSNndOUmRVOVNGdnAzUE01MWVlZ0Q0cFFzM3Mrb1NEQ2dBcnZJY0tO?=
 =?utf-8?B?WE94NGxWR0pYdlU5cjRTZ1hIQ0lYcEJiM05LeDd5NUk5Um9UQUt2S0JDSFp0?=
 =?utf-8?B?enZoblU3QVUzaVJWNWVGcjNNdkR5Tk1CaFYwcG9RdFFpQ2xUcVZ4NmRCNjdn?=
 =?utf-8?B?dW1tNlhTbFdWa0U0YUFFUDhVTnRaSWZOSTdUZ2RLZnZuem9jVnBoSjZ6M2ho?=
 =?utf-8?B?dk1wMlZJcitWT1EzRGpTUnJVaDhvZFlUWjNDdWJLOUF3TjVYTzN3emhPTTBG?=
 =?utf-8?B?RWllK3lRWmIyUGxIdUk5VU1QSU1UdFNDNXc2UmErQ1UyVWgvb0I3K09vZWo1?=
 =?utf-8?Q?E1GXMUl95Ww9NnAH55T87gTxAkXRJfUU3aADSvG1AHop?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ecfa50-cba8-4fcb-c8f4-08ddace7b62e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 15:08:55.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QN0Ks0JjGjSiOyZjqT2w/z0vM6axygEPbmNVwngoxQDheAdtiLSDLJxenEl/xq4fj4hyrg3ayc3ivKAW464LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7280

On Mon Jun 16, 2025 at 11:14 PM JST, Daniel Almeida wrote:
>>> +macro_rules! impl_bit_fn {
>>> +    (
>>> +        $checked_name:ident, $unbounded_name:ident, $const_name:ident,=
 $ty:ty
>>> +    ) =3D> {
>>> +        /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is sma=
ller than
>>> +        /// the maximum number of bits supported by the type.
>>> +        ///
>>> +        /// Returns [`None`] otherwise.
>>> +        #[inline]
>>> +        pub fn $checked_name(n: u32) -> Option<$ty> {
>>> +            (1 as $ty) .checked_shl(n)
>>> +        }
>>> +
>>> +        /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is sma=
ller than
>>> +        /// the maximum number of bits supported by the type.
>>> +        ///
>>> +        /// Returns `0` otherwise.
>>> +        ///
>>> +        /// This is a convenience, as [`Option::unwrap_or`] cannot be =
used in
>>> +        /// const-context.
>>> +        #[inline]
>>> +        pub fn $unbounded_name(n: u32) -> $ty {
>>> +            match $checked_name(n) {
>>> +                Some(v) =3D> v,
>>> +                None =3D> 0,
>>> +            }
>>=20
>> This could more succintly be `$checked_name(n).unwrap_or(0)` (same
>> remark for `$genmask_unbounded` below).
>>=20
>
> Wait, I just realized that $unbounded_name is not =E2=80=98const fn=E2=80=
=99, so we don=E2=80=99t need this function at all?
>
> Users can simply do `unwrap_or` on their own.

Agreed, we can probably drop this.

>>=20
>> ... or we make the methods generic against `RangeBounds` and allow both
>> `Range` and `RangeInclusive` to be used. But I'm concerned that callers
>> might use `0..1` thinking it is inclusive while it is not.
>>=20
>> Thoughts?
>
> I don't think we can do what you suggested here. I assume that we'd have =
to
> rely on [0] and friends, and these are not const fn, so they can=E2=80=99=
t be used in
> the const version of genmask.

You are right, this cannot be used here. It's not a big loss, limiting
the API to inclusive ranges as discussed on the other thread might
actually end up being safer than having two options.


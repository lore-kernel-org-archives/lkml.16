Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1E1A0BFD;
	Mon, 16 Jun 2025 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086179; cv=fail; b=n1842rgbdfB2l9aBxvCYV9xxnYn+EbtkLwdhiueKwwvWDKAUCjF5PzNEsVSh5WN/EVq4nJHUYbKy6QbSYSNI0xgArkoMfNpi8/8AF25uhFFVj9LKv5cWDJS6nWznSZZd4v+UvYqsjd9cYQaH2x7Ln3JFM3wE97+EUxbgnj1LJX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086179; c=relaxed/simple;
	bh=es1hijBAZFPgPj8R9iVvfe4Ty/B5ECana3fMe7Pa2QA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=JyGXa2ijlJTJ34OaY5enstKiQxvfY3yhr4n5QahL7ZUSuN2eEcMp+xe+w0oLjAtU/KbG5Zku6GoucW+U5bMMMHFogkdtFd4E+zp8XeyNDL4GZgeazH799xzPE5OEOffv3MIWgJmx041gT8tQrLE+4D5JZxZbZPoCMH3wAPBEwmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WdRDEBLf; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WdRDEBLf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXbeoxET9NAAzAyTxc/zodiSaO6GfyC3hlNeBhCh5ppS0yshDYgFpPXWyN7tWwpxMvas8LzCQHJupgpWJeMzEY1rTXtOPnaMGtEpGjgGyfdxDzqPe+EFzAX8kyr2JYubfd/qfZVos0emwiH3+677LYmIAcuEscibPJxr/2ei9cIYJk8fZImotFFN0tx1wZD5IOQ9jH5MxXJtqPQpneQvQNReloQ6gCRBDKHZA+baRrQWP9gsPf2HFmlOKo+GyxUKWG1505zBXxmI0fmfQh76Serjfk14kvo8H1yK2/5p39NrHSAg+Sf82EhjNzlDEA8Cp1KVoSx1P4HnQ4Lj8Q652A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es1hijBAZFPgPj8R9iVvfe4Ty/B5ECana3fMe7Pa2QA=;
 b=shPItt8JSs0DqtJ6aeJ1iVkN3HuBcCIRj9lNHCgRj/lPP8u1Qi+kpgtfSR9yk3LAPYm9bliBn/gEj6d5lgZ0cAk8YvNYKZ020xrLFozf+cnf2RMNNA8uIJQL88nMswjg1JCT1I9j7muUqpq93cQpTxhlOjbr6+lVm72jxOFHPRfKRSPXWbY+rTPzhb5/RAA8QDfVU9M4tp92gqnIh8+I7itCqIcOiFM22L+yFJehrxLt8sDVazqFGXO7OZEQA6CXXvNrigTMvph3E4+KFPQdKKjHcU5QDzap7H0afhPWqk3PtJPjmgvzq7J77cJ9gOZs1AefdZceU/PsqAboSE8+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=es1hijBAZFPgPj8R9iVvfe4Ty/B5ECana3fMe7Pa2QA=;
 b=WdRDEBLfI0Ks/ZtX+eHeGV33tj2FPMUR0fOZaNaFUzBf1cpdxiv06/t/fTZr1sxk7P6EQiqfl0N8kk+KqUkjgLDb3hJu93yo56GRn7Sj5F8t7OuYQd0Zv0stSgfKvp+xZWC6YseiPCYJPrP3z4ictTPsHBKAgAsnbR4opBkQZw1X6VWI4h7fjJRW8ctU3hZsFiNYP45jFBwrbgWI2hMTuncKRjnbPGYA9826sAtl8YGYS2Jz0KtSl711LpE7XXDbKEfHle1Ng6TtOMGVvu95+iT469nktyDkQNU0zv5MCG7dje8tMxKQptMGxMyV04PdKlb/EV/z3B4mvyoj5O2jtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 15:02:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 15:02:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 00:02:50 +0900
Message-Id: <DAO1RRSIUW6F.2FUMJ00GSXUIQ@nvidia.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com> <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com> <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com> <aFAqLYBMHkC_X-dr@Mac.home> <D29BB87C-356E-4885-8308-456028AE3B6F@collabora.com> <D12DC02A-E1EE-47F1-86AF-C25C492FA3D4@collabora.com> <DAO1K5YIFVRH.31XI173DWYYX1@nvidia.com> <3EAB4EAE-DDCF-47C4-A712-77B37AEDF4E8@collabora.com>
In-Reply-To: <3EAB4EAE-DDCF-47C4-A712-77B37AEDF4E8@collabora.com>
X-ClientProxiedBy: TY1PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:403::24)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4051:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be6a112-eb82-44ba-3d08-08ddace6defb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEF1ZmRPOTVEbTBBOUtTYi9DZVI2dUhxZzZyQk1kV1BLMmR3WGpsQldUcEtP?=
 =?utf-8?B?YjlSRTh5RDVobHhkOS9rY3F3MFNSVGJ2elF0S3ZYd0hFMHhuZEtFWllvZVQy?=
 =?utf-8?B?V0tMaTdCblM4dDBCTUpaK21JcFVGQUViNmRtdnVMSmRQY3h6V2VFdUhLUmtZ?=
 =?utf-8?B?TFVERW5uNWJKQkQ0anJLQm1nY1hUaElyRExtY0hiVnNkVkJVNDdPZGdHd1Bi?=
 =?utf-8?B?d1VZK0lsV0lweXdrRUVsU005djJDUVJEWVQ5Wms0cmVvMmNSMmsyeEFZMjcy?=
 =?utf-8?B?ZTBVak5LOG5MTi91ZXRGVVQrTVJTaXNOd3czTHV0a3djVGQyLzlTRVdJTU1R?=
 =?utf-8?B?ejdIbklNbVBxbU80NDVHQnZKUDIxNjNtQmpOb0Z5bG92QTFxOHdZdlZPY0Zk?=
 =?utf-8?B?dEtGdTRjMmRIYlFPZzRPK3dSemkzTUNxSVhNRENPSzZlODk5aTdKVXhyZnI2?=
 =?utf-8?B?QndVcWtieXdnSXV0eUk0azBhb0RObis4QzBTY1VCL2s4USs3cEx5SFB0M2ZV?=
 =?utf-8?B?WTFmU2NrNWhCUmQvb2dsMEVKSk80NzhIVWE2a3pLSmZMb0hEc1dnY2ZCYTFC?=
 =?utf-8?B?djJtUUZJTDlkYVV4N2s5WTFOWWhzQW9xZVlaNHA4WGRPbnF3WGd2eko2OGFM?=
 =?utf-8?B?TXlEVGhFZm01NWF3T3d4MVBGNjk0emhYOEpGNDRTNis5aFJFYzc2UjRBak1I?=
 =?utf-8?B?VzFIRWpIU3dTRFpYcjdoenBzVGJWRFlJZUlXUWhaT3gzaExoc3pOeGJUQ0RD?=
 =?utf-8?B?eHNXME1EMkRsTVZIWlVzbUdmNXBaaU45V2E4K1pVRE5MUzZicmpGY0RwWkt2?=
 =?utf-8?B?bEFzVjlSR3pBYlM5eHlwVktHbDdGWjVvbXNWOVJlaGNyRVczZWZrVTk1ekRO?=
 =?utf-8?B?SURoUU0wTTBjVWJoOHJsWk9Ia2ZpZ3BxYzNCT1I4NGJMdXBmdUhxbjltN1Er?=
 =?utf-8?B?MnJPcnNXVWZaOXR6b3pRQmxmeCttNmNGUElGbFptUVlRaGVFT3pMQ1ZpSFY4?=
 =?utf-8?B?UzIzSkQrYnZJY2h0WEhOWGxlNWJXbjB1UXZCQ3VKTzBZd0tqMkdyTU9lWVY3?=
 =?utf-8?B?NnZxOVo1enpPaGNnSnJZbGhwRkltWW9Xazh1dXYrU3JydGx2di9aN2J2clpa?=
 =?utf-8?B?SVZLcUY4blJZM0pqK0NsZFB2S0xhN203SDJFb3Q2Vk8wRXJEWjZib1VRejBv?=
 =?utf-8?B?Q0EwSWdsUlNXdHhZQ0F4Y1dKSDVucmFIRVFQTm9mcG1MSlpTalNEMkJ3c1lX?=
 =?utf-8?B?c1hTcThSL2laWTJNdVJEdSsyZGV5TEtNVlZVNzQwZ1RXcnJQaFYyM0ZnNHlH?=
 =?utf-8?B?NlMrRzJ0ZmNpMFVzYjI2cjJiNlNETjBDZldTNzAxVmZJam9ROWNtcDY1TVBa?=
 =?utf-8?B?RzJwSmRJaXlxaE1uanBTSncxWlpLMVpaeHplZU85VWd4TmlJUUU0YzN3a0xM?=
 =?utf-8?B?ZTVPUVFpYnBIQXg1QnpBODRpTDBsZ0pLdTVXTTdCNnRDTGduTUx2OVRiL0JD?=
 =?utf-8?B?ZWlUbHNiTGpPbkdObUY3M1h3cG9iZ1BQUFI1anMwRytva2l1czZjN0d2bk5v?=
 =?utf-8?B?cjlndDVaQVNSUUFONVoyblFKaUs2dkxydC9DemFUeFFpLzcwMHBydXRGbGNk?=
 =?utf-8?B?Tkhmb2dnOFBWSE5TTXcwamg4SUVnMEJoNDlBQnVsWm5zOXJGOEFDa3M0c2U0?=
 =?utf-8?B?VDF3SlNNVmpBY3cvZnpiU3pjUkFrSTNxUkhnYWVWUlRzR2x1TUFKZ25NS2xt?=
 =?utf-8?B?NFM0akdmN0xLTW1icmdPZVByL2N4b3dzY0VmVC96WC9TT1JwY2FSb0RDRXg4?=
 =?utf-8?B?ZDdqeThsdm01TkxaVlRBMmpJNVZXRlB4RDJVNDU0SS9lVC9KSnhnOHArY2sr?=
 =?utf-8?B?aWkxdldra01heWJIQlp5K2VUNVhvYU9qMUtpdDF5MWZvODh6RDkycjlwUits?=
 =?utf-8?Q?Uga7qCFXau8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aURsVTVjekV2d2tMeTZIdFdYQ1Q1bnA4ZjBLb0hxRk1xallYbUtaMFNjLzFK?=
 =?utf-8?B?ZHRGQzdLTWl0SU1pbk5RdTg3T2tFeGttVWdRelc3U3VhR3pNeTBEdVlrd0Ju?=
 =?utf-8?B?MEIrdm52N1d4ZkYzcFZMY1hUSzVDYTUwQUtCY3ZUTGZTYjBTRVIrQXZpS284?=
 =?utf-8?B?c09RZVBjdjNwdmpZeXFpcUVBUFJLNHA4b01TNVVWMjV0emhzUjNqeXlaYVNC?=
 =?utf-8?B?T1o2bzlaTnYzTjI5ZFlTVzNES2xSTURJZEdIRG9jc1VDMjBCaHFYSWE2eVFm?=
 =?utf-8?B?dEVFMmdkbEJBYVBrSVNBdU9IODA3LzBjbmFXOFNQaTJibm43T0xtTnV6OW1P?=
 =?utf-8?B?RmpxZGRMZnBVUTdDYXpvYWM2MzVYd3ZqeENtWkVRdHlpTFgrVjZJWXNscEwv?=
 =?utf-8?B?RkJOZ1ZJZmhNUENPa2pBeXN3Ri8vbmNiVFlSRGxXQThESHNpODdWdXNrVXQ5?=
 =?utf-8?B?QkdGTlUya09GaTNNeG0vYUlNYXMzUVJXVWoySGNjQ3ZNN1lNTXVOME9GTnht?=
 =?utf-8?B?THd2NmFFOXNxM2N4VlBZOXJQWis0TS9TcTh4YnRnSEZUanZya24xTUFSNHdZ?=
 =?utf-8?B?dGFWYmNXQ05UVTVWbGt0ekpsWjJwUHFZbkttTTc4VHIwdFZLSERickxOT1JO?=
 =?utf-8?B?ZElGdVBWWUZPRXkyM016ZE9oa0xaeW10akJCOFJOUFdlenhVSUUwY1MwVTJw?=
 =?utf-8?B?TWZjSWNDa2FyeUZVSFBZVHAxNWlZVDFsbmdBTDh5dE1XUk15eEN0bVZ4QUpz?=
 =?utf-8?B?T1pxTzBwSWowWnNWYjU0Z0VGMEM2QzdlSFo2d1lqREcra3h4TkNSVEI3V3cv?=
 =?utf-8?B?aEVmSFJjemdBRGw0dUtrL0hVS1lqR1ZvL1JGM0V6NjJjU3ZwVzFDdjJmcUtD?=
 =?utf-8?B?d1FtanlYMlF2Y3BaNS9ocExRRTZDTjVXSDhZcTdVUDJ1cDRCbnlWRTJzQWp0?=
 =?utf-8?B?aHZnUDNIc2V3RzlKQXhKaFlOQzBZVGNZdHFxTU9Wem1LQnNIQytaMjV0TFRy?=
 =?utf-8?B?Y0JPck5nMXFqQ2VxME83V0ovamRRSXJmUldjMXAwYnJtRXV3cldGNHkwcU5D?=
 =?utf-8?B?RkpaUEhJV2M5bURoZkRjQ1FteE9rVFptS3hYcHR6NHlNbUoyTTNqckFYejVt?=
 =?utf-8?B?anlBV3JlbjY3VDJVTkpOWWtqUCsvSjdMMEFneW5oNFRyN2VhK1hLKzFFSkR5?=
 =?utf-8?B?QzZLMDRROTFPdlFmN2huSGg3YWhrSzdrQkVEQWxKUE5qeWVTZmFUWEVvNHJB?=
 =?utf-8?B?V09KZ2RCNTFKd3lrQVdMUGdnZ1h0dTYxZWRuQWpyZUxKMldmallNK1NwbmNs?=
 =?utf-8?B?bVBFMW5Ybm9LeVNlMXo2VFV1MTFSdGoxRDM2RVJHNHFFWjRsOEpOazR4M1ND?=
 =?utf-8?B?cmYySnZvK3J1ZC9ib0pKSmk0ZVBMalFLS2VyMVhoVTM2NmFsY3R0YTc4QVIz?=
 =?utf-8?B?bnd4aGtIVUlwbzBQdWQyQWNsS0VqcDRxaHZ2NEd1WWxremhubzJPYk5wZWJY?=
 =?utf-8?B?NVpHc0poTlNmVUVybFU5clRnYVhxRlVLVGU3dkRGUFo5TEtmelF6Q1VNcXRS?=
 =?utf-8?B?UmRyMWF2d3Q5NTZ2U1doZ2ZxZytUeXpuYlpyYm9xUG5XRngzMTM5WGtUSkpj?=
 =?utf-8?B?d3FkWXZwWXBwN0Z2bWUxTVZmOXdNQS9Ta2x4MlJieDllR3dVMWlTWVFxeFB6?=
 =?utf-8?B?Mk5VTVFhS3pIdlR2SVhJR1MyOWRONkhaWGhZWUEvdXF2UVdkalplblY2RXJi?=
 =?utf-8?B?SGNUQVhSb3ZTK3h0WnJ5QmtUaGgwKzBXTEpjaGQxSmVFdi9seWhLUUNjZWla?=
 =?utf-8?B?VUx2c0lRZWtSbnU4b0IvRHZZSXN5SVlFT0dQSVkzazd3anFtLzNVS1pwWjQ2?=
 =?utf-8?B?SmVEK0g2dFlTeWZabU9FQzVHaDVpd3VVZTBNK29aVEIzMTJ3dXl1NldnUEh2?=
 =?utf-8?B?OXNuVXNuaDViOFBhYjFMbFNvTFVpU2lPbnM4OFl1R2ZwZGcxZXdXdmZPTU50?=
 =?utf-8?B?ZzJKMy9nWmhvOGZmc3QxVGtKVERSNDZkRVVkWkRTajhHSkZoVGY1M2tvZS9I?=
 =?utf-8?B?b0RaY1l1WTU2ZlhiQUs0a3EvbjU3MFJCdVJnUnpHZGpFUjE3Wi9zY3hKTGlv?=
 =?utf-8?B?Vm1paFF0ZmRaZE5IVkRIcHdvUGJKV0pBQ29FaXZqZWM5WC9GYitkSG1ObU5T?=
 =?utf-8?Q?JCoXO9HcBwTHxKulnkerxndwyOZlbuC4ZeVT4sA8XklR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be6a112-eb82-44ba-3d08-08ddace6defb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 15:02:54.1388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqH9yTB4Zv7rm3jFvaQH0mBORcHLV1qmZAzO95knRI75Roc6gLinUpt0suHgwBOQPz8rAT3YViXB+KVfPIbuJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051

On Mon Jun 16, 2025 at 11:56 PM JST, Daniel Almeida wrote:
> Hi Alex,
>
>> On 16 Jun 2025, at 11:52, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> On Mon Jun 16, 2025 at 11:45 PM JST, Daniel Almeida wrote:
>>>=20
>>>=20
>>>> On 16 Jun 2025, at 11:42, Daniel Almeida <daniel.almeida@collabora.com=
> wrote:
>>>>=20
>>>> Hi Boqun,
>>>>=20
>>>>>=20
>>>>> We should tell/educate people to do the right thing, if a..b is not
>>>>> inclusive in Rust, then we should treat them as non-inclusive in Rust
>>>>> kernel code. Otherwise you create confusion for no reason. My assumpt=
ion
>>>>> is that most people will ask "what's the right way to do this" first
>>>>> instead of replicating the old way.
>>>>>=20
>>>>> Regards,
>>>>> Boqun
>>>>>=20
>>>>=20
>>>> This is just my opinion, of course:
>>>>=20
>>>> I _hardly_ believe this will be the case. When people see genmask and =
two
>>>> numbers, they expect the range to be inclusive, full stop (at least IM=
HO). That's how it has
>>>> worked for decades, so it=E2=80=99s only natural to expect this behavi=
or to transfer over.
>>>>=20
>>>> However, I do understand and agree with your point, and I will change =
the
>>>> implementation here to comply. Perhaps we can use some markdown to ale=
rt users?
>>>>=20
>>>> =E2=80=94 Daniel
>>>=20
>>> Or better yet, perhaps we should only support a..=3Db.
>>=20
>> ... or just drop the ranges and do as Daniel initially did, using two
>> arguments. But I agree with Boqun that we should not deviate from the
>> official interpretation of ranges if we use them - the fact that `Range`
>> is exclusive on its upper bound is documented and a property of the type
>> itself.
>
> By the same token, I agree that we should use ranges instead of two argum=
ents,
> if said two arguments represent a range anyways. So my vote is for a..=3D=
b JFYI.

That works for me, it has the benefit of being absolutely clear that the
range is inclusive.

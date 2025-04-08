Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF1E1F94A;
	Tue,  8 Apr 2025 05:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744089550; cv=fail; b=BVBudvay/SE3h5xvkGnKfyplxBapwhPh5ZdY4sxxqklEkMmYWIUh3O0SDMAWRer7jqnxwFu3dv5vqbYJ7x0iZ4sPHc2WZjUBv8sG2acIRF7YEB8NRfKyuJtoSADfb82EKFxpbG2MR1u6dgHDOY96te/7yA1GNvhI4n8WTZMA2G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744089550; c=relaxed/simple;
	bh=tFQ96XNqEWxrkxxQuByn6FEESEFiRLlGb5CCh+nDbx8=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=L+pur4kKrJJXw6TkcilS2bqf02w47cgKwhgCwumjlGNQJl4LHREnE1JAaHYEmfBeZqWLHlyUPtOfZJmyT84cxtWZao+7fzhzoxyTs8sp6DQy8edAuCybbThFOsqTKZtoKj2VT9yFoCyS85vDHzDfhykTIv9CJHvr9bKKv03jTSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WI83u/t2; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WI83u/t2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDXqO8rp/a9yOoQkJzSAVE3KUL0MQCxCyDYlCAUmVv7An72HF7yXtZbNxbBIVL4icnkGio4PSLg6rtRedaEpxSb4Y+mqyIxudnr/r/Tprg71YZJ8n0zAKkEnYc4JvCcXSWz4Dam/0p6EjyOWpeANQEXgM0vuHRejlHBkTwmvhh2dCqTGwkxjRPi1rc68VXx8IXyYGR11SY0Ig8sjLm935gnWuOHHKztUeKMTqArSaHO9fzYD0DWg96xWQ29kcHJx4BWGnthbLumr8a5E+izzEE6KaskTuKWr8PXca1PxSdCLZgASARvQP9vTMoMvAcsl33FqgQRXi0rXjRy+Y+sQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fXoXpQY6j/SGNxx4CvPU7CDbnm2ADEKXh4D72LXcIA=;
 b=r0G2AFLn7OsSAQBUkVn2K07NGrHQw4FVo04uePNiywyQtrkSs/62XE8MCudNl4CWbTOdre315SOacedRLeu8ERsHdsZz6Wut5aL5BXBPUOrxSAJTljhXr7aOpLd52l4LF0ZXTS4W92VGP2iTlPGqPjVp2kVBSUCvRGKRRCwyYYwAPL1REDIpPjT++ROXl2WrxyxmpLDo+tLKRXAhHEd4N8NnUIkIRspfh6DXm7Pzxi8/cNanc8BlFAI8HxAlpyHnm8couz3DRJYxjy7UWMj6cmvBQmTW4s6LTwQcgc+zc3jvL16V11kxbC+aEcknomWHEbmJvjAzFhFxDaOQ2Jm+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fXoXpQY6j/SGNxx4CvPU7CDbnm2ADEKXh4D72LXcIA=;
 b=WI83u/t20L+QeCkSQJicYDACkOWnnfF9QINOYmjalCLuw9f6MSzwenk7zRZS3E7WeCn54u2uE5bbFfYroeAeY8yJsNvsXb2BFf793+VaL/rr4TSw1Jxj1AoHIZIo88MXnstLKO6EC6NlcQ+yx3e6v/jZEAx9MnsFRi4UdKN9/9Bm0CeMA0XUuq6Fvxz3fB37POsmb7gV+evqFibJzZglrXppZX3p7a80NWzbsUV1iRQWAgKCGJ10ao/fULQGgfhrkDchdW8HR9AK2zn+AaoN5H+PElNhXbIRijt9pTXUZhikpOQJlwSQMIEBr0MHUbm8TwftA5X+KbY5T2bqI5D6rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PPF5A8F51299.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 05:19:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 05:19:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 08 Apr 2025 14:18:55 +0900
Subject: [PATCH] rust: alloc: allow coercion from `Box<T>` to `Box<dyn U>`
 if T implements U
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAL6x9GcC/x2MQQqAIBAAvyJ7TlilKPpKRGittR00VCKQ/p50H
 IaZAokiU4JRFIh0c+LgK6hGwHoYv5PkrTJo1B22OEgbniVHw3kJ9kwStemxCuXQQo2uSI6ffzj
 N7/sB9RjqyGAAAAA=
X-Change-ID: 20250408-box_trait_objs-02a700401f0b
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::13) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PPF5A8F51299:EE_
X-MS-Office365-Filtering-Correlation-Id: 4477a76c-c642-49ff-3121-08dd765ce186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXlZZGJuaHphTks2aEY1bVJYRWg0MjVwTWMwbE96NkRWcmZoTHFJYTRMTEZr?=
 =?utf-8?B?ZDZTSXRtb0twR1JuUkNiRnVmU1ltUmRUWVpqSUlpWWU0VWNjY3BQc2JuY3dN?=
 =?utf-8?B?VFhINW5jYnpHYzA2N1dWRHpBV2NRWEM0cEdubUNCYVcyVVErSEg5dldHRVdr?=
 =?utf-8?B?NjRheVppdFY0NmRTbUliMWgzZzNaWFF5TXRFbjVlZ3IyS0VvYjl6S3pnQzcv?=
 =?utf-8?B?Nll3RUFlbVpuY3VqYUNCMWdKSlo3UkxQNFA3R0hNQW8wbWVtdVZSV3ZGYkFt?=
 =?utf-8?B?NHdXUUdyZkpoVVVNYU5sdkMvdTNoUUcyd0hJbkR2RTNvaGdWOFVFSmNWZnFi?=
 =?utf-8?B?dTdFRlMrU2NkZ29qSTd0bWVZNXBTMGtCS1J0ZW1iS05WZlNYSURielRtNk9C?=
 =?utf-8?B?SlBBaituQWRaNkY0YUlGclFlZDM5aWErdjI1dDFlMHBkMnowUmsxdm9lVHBi?=
 =?utf-8?B?R3lJYk1CUWpIUFVXRmtyM2psRmVDK0NXeitBYStFKzJlVzlqVW94QVdibXZ1?=
 =?utf-8?B?T2w0ZnoraitUVW9EM3BEdXlSZVg4R1VWdmRBa20ra2ZmK0N4N3FLYVNPbnNN?=
 =?utf-8?B?T01zZWFUdmhONnZBKzZXeFMvU2hOTHA5TUtFM1BaRExuU1FnWVh5WFc5L0J2?=
 =?utf-8?B?Vkc4dEpjK1IwU0pRZm95bEowVUlCZU9FUXdleG5JdnNpNGlMY1dPZnZpbmZB?=
 =?utf-8?B?Vi9LTFEyYy9Yb2RZRlFtRnBLaHFPUnkvaWxiT2JFZ0h3ZmNydUNJOWtGMnR1?=
 =?utf-8?B?MmVKcXJMMUQ1NFNzdWxnZzQ5RkpnN0NSY1dKaHlicTVKTTkreS8yai9YTHA3?=
 =?utf-8?B?YVVYek0yZ09idDlEK09rZGtlTCtSVEU2ZE44Y2ozOWVxZzVmNDB0eHFoWm91?=
 =?utf-8?B?MXhucnl1bFdTbHRrWUJDTlM2MEZiQlhRTnQ0ZmNoYUozNnpSL2dteUpEU294?=
 =?utf-8?B?VytSbVVQYzAyajFkWE56R1hoVFdjYmRLbDg1TkpzNnQvVkpTbTkxL0tUSnox?=
 =?utf-8?B?NG9XVmJ1U0lUWXE5cFd6bXdPdTgveXRwaHhGV05wUVhvek5VRkpBaUg4N1dY?=
 =?utf-8?B?NzlSd2t1S2JydlBBQmViRUlCb2RMQjdsSzdxR2FDeGxTYXdlallvUVo5a3ky?=
 =?utf-8?B?TFIvZ0plS3JPRXo1c3lwSy9hYzJ0eHRhS1p0OTI1K0wxR3dXZ2d1Vk9BdlJn?=
 =?utf-8?B?dTdMbTlKbTJmUFZ5Z1ZTSVRjL25HQ3A5bHZwSGg2Z1JKWTNXYTRCTHJDTGlz?=
 =?utf-8?B?ZGJhMUZlMXhmNnFtckxtUHFGU1ViV0hXUEpLS2xxS2RHR1FnREh2VU9VWTRn?=
 =?utf-8?B?Mk84NWRDQjVWRlo3QWRrVDlMQkRvSTNHNUwxVjBPTWY5OTFteUI3dkVOVElO?=
 =?utf-8?B?amdJV3RrZkdEcWJjZWRnSzlEUnV4TG5TZG9kUS9SaEJDVlIrMlpUanMzOWU0?=
 =?utf-8?B?LzBVOVp0dUFjbkhqdi9yajFkbzc3TWNyaEluZ2xkL0paUkExbkRvenJxSDlk?=
 =?utf-8?B?Y0xSdzJqcWVnVE01eHk4MlJKQisrYVZkQXRndnFXRzhPblkxOHVHUEtKMVhZ?=
 =?utf-8?B?cm14TjFtVkh0c1NnREx6ZjRaaEdleG4yUll6WXFaU1g1N1lzNFZRVFhLUHF5?=
 =?utf-8?B?QnhiZUpocnZXV2ZSU0wyalUrUXhURnIxM0pYbytIekxFQUVITVUxWTJYVlRw?=
 =?utf-8?B?ZlBzQVJra3U0UDZVTWZITG1NbzFnS2Z4cUExbVk2Nk5QVWV2Y3o1TDBvNnNr?=
 =?utf-8?B?MFpMWC9aTmYvZzZJdDFwRTc3NDVzQldrMEQ4K0dzUHE5RFkzVlRDQ3IrdHRm?=
 =?utf-8?B?c0Z4dW5ydm1EeW9TeXNCMUU2OTZDdUM2eEVyV201NkJmZi9GTEU2YnhObVds?=
 =?utf-8?B?WkQzUXhGZ3V0N2xMWW0wcURKR042U2JnamkwS2wyMTJUbjVScm0rR0NEdW9Y?=
 =?utf-8?Q?Mt4iWpwFKI8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emtCYWxGcC9PbHJGRDN1d3pjWU8zWVNtd05VWXRDaUE4Z0thMENJMGs2eHFO?=
 =?utf-8?B?cVBZYUZySWF6M21aR3Exd1l6SGh1V3k0ai8xemxnaXpsQTU0bmVoNEppajhv?=
 =?utf-8?B?d1o0MU5pZE5xTm13Y0dIWnVtVFhLKzNTdVByZHUyb2VSMi93dWpUdlJiU3lY?=
 =?utf-8?B?Vll4cEkvMUQwdCs1T0VWUG9Oanp4dk9xWEIrUGIxNFMwK3R1RGZaTzNpNmFB?=
 =?utf-8?B?b1pQMkJwQnZnR0pTWU9leE5lV0E4WkNRek1IZ3IvdC8wb1lCUmp4ZGpnNXlI?=
 =?utf-8?B?VGF0ZElRTklqNEg4cms4eEJabWJnd3ZNalFhSWpNeENoaENYVHZLYUFqS3RE?=
 =?utf-8?B?elg5ZWczajRrWjJoUXdseTRvd2drSkxONm4weUdkbUpkdVJOTDRlMHZmcG5x?=
 =?utf-8?B?YWo5dktCdGZBdkRJOTJiTG0vM3ZlNjNwSUhwRU4rQzBEU09PTXp0WFRBazBB?=
 =?utf-8?B?cDZ3RFpoQXRCZGxmUjI1anFML1lScDN0QVRoZG14ODJCVm05dzZjMlZqTWF4?=
 =?utf-8?B?Q2lTNmhqK3drazBYM1ZDcnNJNlJRTXJjYXNUVXQ2ejl6cWNBM2diQ1NlTFox?=
 =?utf-8?B?Yng2RjIra0xpMmhGS1hGZWIyZjB4d3FHcHpVaEIzV0ZSS0R1aEorakRaTUo1?=
 =?utf-8?B?RitpdndPVnJzYjBDMlZuREZtWjBoWmU0NDBOajY4NDlpS3RIczkrV29tSDhW?=
 =?utf-8?B?M1pNNWh0emN0RWs4eTMyR1JYem1oVnpiNTJRb0xaMDhVdWNNendpQWdUZlFB?=
 =?utf-8?B?RDlORVQ5dkhmTE1pWE1CTTdtMmEzQkVGQU1oNkFXTzZmYXd2b2FrUFFpQ1Z0?=
 =?utf-8?B?U1RvSHd0STR5dS9uaDNWeHpnTTJGeWhYaTVGZCtxLzVyTWQwQXdLZlpJbzhN?=
 =?utf-8?B?d0RsMXA3NmhMY0VLMHF0UGw2eDVFS0ovanJ4bjJJK0FMNHlxeEx4YzN2UDI2?=
 =?utf-8?B?L2VVR05Oc3pHM1hlUEJqbFJRY2oyb2sybFo0RzRuT1llWFZOMjNna056R1pr?=
 =?utf-8?B?KzRnc2VqV2ZVUVJ4ZVF6RHhxK1BxZUJWS1ZBMTZqNmU4d0lpYUFQSkR5NTRM?=
 =?utf-8?B?d0VCaXE1M2Z5YTAwRXR3bDNyVlFLQTZyZXdQZ0g0aERiZDkyNHUrVVZCRWl0?=
 =?utf-8?B?emJjMlpyZHliR2VuRzcwdkhGY0NyTkVZamFHd1l4WWlvbzRUaSsrRVVKUVJ4?=
 =?utf-8?B?UHcwN0tJeVpjbnZKd0dvY0F1ZlhCeU5RdllUdmZDZGNHbG5JR2FUSllFb2JS?=
 =?utf-8?B?VS91ZEdCdTAyY3NZU1MxbVlpZnJYUjVyM2FWYlVNd2Zuak1iMDFNejRCSzZr?=
 =?utf-8?B?M0U3NDV6Q2NwSFNDRE9CbmRIWUJ4cEsyN2kwUVNBUnloRmZsOTRDa01CSjlZ?=
 =?utf-8?B?RVlNVEFsV1lvSlg3Sk9RV2htSmN1akRSdzcrVmNRSlVLK3NnZk50Zy9ML1Uz?=
 =?utf-8?B?aDVwbS8yZ2NJSzhjUC85SlRac202UzlmSFhHdUFEVVJ0QTNNbVZyZmUxK1Q1?=
 =?utf-8?B?Vlc4WG12Z3BaUFpJd1drL1l6Rzdzci83ekZHQzZvUkthZlFYSEE4ZkN1bTFz?=
 =?utf-8?B?dmdjUlNxc0lDaVMxZWNMU1lHOGtKWG5nN0Z5R3Z1WDdDMjRucXRxRFZYdElU?=
 =?utf-8?B?Zk5ocEhQUHU1VnE2MDVPUGpGSDlyU0IySjlRMjFMSFNMYndnRHdoYi85WUZu?=
 =?utf-8?B?eFRPUHE5SldnT1RUZHY4R0JjQ0JzdjNiMUtxaXh6SzN6MDA2b3VMcG1zQ1ls?=
 =?utf-8?B?MVJPdWY4SG85a3JnZjZSSm9BRlNJbVBJOW5QdTUzWVlMeVNkS2o2dlVlS2Mz?=
 =?utf-8?B?OXJpSnlNMS9DdmxOdjBEL3Vmc3R6QVgvOHROMFNVWHJZT1RQQmFSVkswS1NW?=
 =?utf-8?B?TG5obC9SQk9iUUp3QWdITkx4K2lNVkl2VVAwZ1hIUGQxOExIVjcwYmV6QWdr?=
 =?utf-8?B?UW9scTJ4OS9SWldPYWo5c3FVc1NUeDl0d1NNbm5RNGtFWlgzcVAzUkc5S0dq?=
 =?utf-8?B?SVVsZFF2ZVFtZ2trelc4bC9EWTNxNTNZYUw4RjNGa1diTDJqNGlwbkZ2TkJ4?=
 =?utf-8?B?M3dNeWpvZGdRMEF4eEZyb3hMaDNLTDlwR0ExaXFQd0ltOUZBYlV0ci9vZHEy?=
 =?utf-8?B?VGtyTjh5ZEhyV0tPcmRuNFZjY1paSWxETEI3cGE4ZEl5bTZHaUhsQkM0S25h?=
 =?utf-8?Q?eINJcAGplSlJ+0k2qHYw76Fcc2J5/cNcMa6ehwXZwGh8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4477a76c-c642-49ff-3121-08dd765ce186
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 05:19:05.4019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZS9FnID4BJaWQGH+g+gtW5SN4QlJZq4gYmnf1hxx6qfk+lrOVG97TVe9B7kXQ2ds2QMFeC0fLiFitXcF+v9ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF5A8F51299

This enables the creation of trait objects backed by a Box, similarly to
what can be done with the standard library.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
From this discussion on Zulip [1].

Heavily inspired from the similar feature on `Arc`.

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/Trait.20objects.3F/with/510689662
---
 rust/kernel/alloc/kbox.rs | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index b77d32f3a58bab5ec73c612bdaaba0d79bfdff65..969b9f9fd3149685e1d1ecdf1eed9c647c887397 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -32,6 +32,8 @@
 ///
 /// When dropping a [`Box`], the value is also dropped and the heap memory is automatically freed.
 ///
+/// [`Box`]es can also be used to store trait objects by coercing their type.
+///
 /// # Examples
 ///
 /// ```
@@ -62,7 +64,17 @@
 /// `self.0` is always properly aligned and either points to memory allocated with `A` or, for
 /// zero-sized types, is a dangling, well aligned pointer.
 #[repr(transparent)]
-pub struct Box<T: ?Sized, A: Allocator>(NonNull<T>, PhantomData<A>);
+#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, derive(core::marker::CoercePointee))]
+pub struct Box<#[pointee] T: ?Sized, A: Allocator>(NonNull<T>, PhantomData<A>);
+
+// This is to allow coercion from `Box<T>` to `Box<U>` if `T` can be converted to the
+// dynamically-sized type (DST) `U`.
+#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
+impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::CoerceUnsized<Box<U>> for Box<T> {}
+
+// This is to allow `Box<U>` to be dispatched on when `Box<T>` can be coerced into `Box<U>`.
+#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
+impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Box<U>> for Box<T> {}
 
 /// Type alias for [`Box`] with a [`Kmalloc`] allocator.
 ///

---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250408-box_trait_objs-02a700401f0b

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


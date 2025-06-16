Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70851C5F23;
	Mon, 16 Jun 2025 03:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044902; cv=fail; b=LT6CH2vtK8kgaLchQ1O8eLSjPoS7hrV4OuA6BRBycTXtvKvYXX/9qxasBOLL70KPx4Vbgpa0JROXyERCo0Haxwk+sJ5DReC/iLzOVJ8LzfVt1HsPqtZFI6WjlMGePEkcmx77KSjAXS23KRHSc3uIVMH+Z/f6eR3mVCy09Cy3K1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044902; c=relaxed/simple;
	bh=9OdpaRKq1B0TWyM6aCOJgZ277WGgs2qsxz8ETElQWOw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=C+JQYVye8kL15axrsXoChTThezgLx1osH3elQKxJk0WWNXmD86aKXCJNFCQ128ggosaHXTiSqGLn38x7BX05NnlD9XTtQR62MO+bWa66+xQQwihKeypMXITZyIwG5J6GkwF9IafiS+1969EnPDJOlrk4P97AMyKJ27xJQAmfgvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=krBCKKyH; arc=fail smtp.client-ip=40.107.93.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="krBCKKyH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEevabzYDYgq3FdbJodpnk55c/KR0dPS7uJua+MLD6i4GkLg5hphchWX/nyAHs1Y12hXavxL1VE7NwfGpNhUkaepiKh2Gg6fs7EIze4MdEogfEsojYkTJX8q8ZPwH/Ocs87f47uRcO7+MQacEuwU1xDUmsPSZ3DTZKhsYv8hAlSZlVT4Lvw+bsmMcsY1qWaQc1hw51iQllOBRMVfEzGMeQ4P3b7m5ETGukApirgBRvYu2tyRLF+Z0S+5RGz2uXFhlqKHgKLsXBlLa4+04IE9Eo8l2m15VPuxp/OSaU1QI/h5RWJa4IY3TXqTxqakPj3mDWUZtlBEYDV0PZ+F30VeHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4X/D42Sczp1pqLRYFutk5NxwbBI/ifY+AW6JHkRbLNI=;
 b=ksVRMlbKsnTLZYaGqRbhtlKED9Ez7VqWE7CD8Oi+OJcIRHlgESR9HEUuAm3SLZuPuFw2QkUVlC3xOSJE93XdRiu+Oxnf+30D/DYVmlFv5+ijcaO5WmT0d/AEpZRA7L4SJj6K/EoGRapwET0s7zDLDHIUx7CggzQjq8GUc6DZ5PBa7saWYbK3h119xWtH+jmiUgqC4X3JNAt3NhRgeyV69UNrWuYZrMl2ZlggXF26inHrtjIgwTYImvSJ1r4064c2bWjgiuGCK++1w5/1QPVVFg5Rsa/swsZk83AppEAonPNKS8Mf/0w4viKtlV+dCF9zIyibjC65qb6HiiH+O0xHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4X/D42Sczp1pqLRYFutk5NxwbBI/ifY+AW6JHkRbLNI=;
 b=krBCKKyH24Ww13z9/QqX8tetl3CfFG5Rq0w9znDu/U1B8UM/EMl3pRLxgCy7YFFyHr3Qw8N9Idv7MBFXhTVMATrJ6XK4D2ONHUCpGOmKJA/KHNievsxet7L2+Js/LNprQHoSFxZjULOWSCc0B/fnvz++AbVd4aqgc9zykYqOw+g+a7qsqzbbq/iE1ljlXY5TXFdlNr9kgnR59xFQpRx1GQU/VV7UO/aDdJcFeMtHwYdQCKB373LEabfkD/l4E3t0hYeCAmt4K803IHAcQ0ojiHOl2iWkFpbMw2l4MMYs/o3OK73EGfwtC7weE7TIKHZRtNKPz4wkDbHJpqx35nKefg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 03:34:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 03:34:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Jun 2025 12:34:08 +0900
Subject: [PATCH v4 4/7] rust: str: make `from_bytes_with_nul_unchecked_mut`
 const
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-borrow_impls-v4-4-36f9beb3fe6a@nvidia.com>
References: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
In-Reply-To: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: d19c2493-91be-4a22-3304-08ddac86c447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWlIN2F0bWY1Smp2SVBObncyTHNOWDJKNEdCcG85SUF5UXR2UnVoaEFTd2FG?=
 =?utf-8?B?MG56RGNQK1dsOTdndTJ4OVd6ZFdmVUd4Z2diL0d5QWw3NWVvNmVWMCtOY2F1?=
 =?utf-8?B?RDNrSDhtK2VoeWNsRmpMOUxZelE5d214Q2ZXWVlpU09VMHRpVEVUTU1Ldjds?=
 =?utf-8?B?Z2syczl4YVJTZnZqYnFtOHJjWmI3cG1vTjYvQVpncmJuS2dtNnArRWorSkty?=
 =?utf-8?B?bkZXRC82Q2l4MjhpczRwbjFIT3B6QUhlV0k1VFlCclpzSmFwRHNScjhNK0t2?=
 =?utf-8?B?bERiY1RMREd5cDJVVFFwYzl3SWU0Uy81WXdxZHM3YlEvTThjSzNUa3RjVWVP?=
 =?utf-8?B?NnVHODJkU2hvQThuMjRaM1Y4WUFNZTYydHZJR3o2SDVzN3lMRkJpb3h2TFZQ?=
 =?utf-8?B?RllHcWR6NzNrbHFjaUJUYXU4dUhkemxVd1JMSUtHQmtvQUpFS2diSm1SVXRM?=
 =?utf-8?B?cmt4VVdtaWRTaUFFVkE0MlVUYmJuV2Q3YlovSzEvYWdzQzJiaHRXNFlKMXow?=
 =?utf-8?B?ZkU2Smc0MlRVWVZkcG9VMktDUVpPUGhUTUtEZ0ZydmhHaVROaGVCZGFWTWl1?=
 =?utf-8?B?TGppbE5Gdk9Tck1NdFdER0NmRWxha0R2NWIwaDY0L3c0UzhUZFhIUUVuS2JE?=
 =?utf-8?B?MFFWNzE4dVNtdEhrYkdVYkx0cmNoV3NZR1ptZ1ZHeXY0OHZhQjZER2N4SE1U?=
 =?utf-8?B?ZlBYU0ozazJXMDI0c09TQTJKZE96TnVQUmlGMDBlODAvYjJKT09za2Vid0x4?=
 =?utf-8?B?SGQ3SXA3RUNhenVXekJ1aXdCalBQUWFrMGJSS0QyZExEVlVybnNXR0xwT212?=
 =?utf-8?B?MHVCVHVOVVlESm10QXF5S3ZUMnBYZ0U2aTBGTERRdmIzZ1Ewb1d3VGQ2d2p2?=
 =?utf-8?B?dnNxL2x2Tm52Wm93bTcyR0V5YU43Njc3VHIxMHVOcytxVTV2MEprQW4rc1dt?=
 =?utf-8?B?VGJkeWZ2TzRmWUkwRzFtTHlwWlJ3RU9FbTdYT0c4NGx3OXZIZDZ3Y05Qa01O?=
 =?utf-8?B?eE10Z1FNU2dpdmpKZFJxNlppNkVpODBSSnpPMmovck1EdzdkdzFnMWZHYUp6?=
 =?utf-8?B?ZkY1Mnd1R3gxZU9FSi9BR29PL2FZWHBNdzFZQ3BaQUkyLzY1TEN1N21VNFFa?=
 =?utf-8?B?ZUhmaUFSN2FibU9CWGJyYmVnbmh5TjU4a2lSWjFnNnhiRTNzeVZJK2FFVGJy?=
 =?utf-8?B?byt6c2lmdDcyZ1dJRFFUMEpUcEl6SGdkQkY4RzFJc1Jnam5xZ1ZMdW5EV2lt?=
 =?utf-8?B?UXhQVGxyWndHUkhHSUdTcnlHVkQyZm5ieXFUQmZDSE55Ti9YRklpdkNsYlZq?=
 =?utf-8?B?OHVscmQrZ3dIeCt2ZE14aEczOHB1RjRsYkVTbFNZeTRkejM0a2FyUWszelhT?=
 =?utf-8?B?bml3TVRIcXJETThSRjRSSUlDVW85SXdybWh1WUNIRkNzS20yV2tMSHZSdi9Q?=
 =?utf-8?B?V3FTSjZDMC9YRWhnSHhGTGhEbjRGMFhrVXl3RXd1OWNpLzhrZFlyeTNBcENU?=
 =?utf-8?B?NFJyU3R0QTVlTnlzd1NIQzVEcTR3YTBLYWVkbzBLT1F2QmJIeklPc3l4ekNy?=
 =?utf-8?B?a3pmdVlOd3RwQ1FuSmthWUFUcjNJNC9ja1VaeDlPTDBxaFNDUmJLbTB3eWxw?=
 =?utf-8?B?UEowN1lZNHlVWXdMNGtJNkxkdFRJcmJHR2pwL2hIcXRWZ0pGZEdzUDJBOVkw?=
 =?utf-8?B?cStLQnB6QW1qOXkyQ3dIVC93T1BlaUVsTS9zUnJYMDBmdlZuR1VqQ3JGWDcx?=
 =?utf-8?B?TlUxZnI3OVp3TnlEcmR4NXJ6ejFlYmJvY2VqS2J6R1MxeDZUZ0kxcFE2dnlY?=
 =?utf-8?B?L2lQVmRCMUNiR2ZZdUZwSGdDSFZjSDJGbmZXRnR1TnZIejNMdklTbGlWQkJu?=
 =?utf-8?B?OHhVaStRQVhhQWQ2ZU1nRUpKUEMwQmdKaXI2K3AydWh4K2VyZHZVVHE3SUxn?=
 =?utf-8?B?M01ocFBpV3hMTlNkRTJCdllYOGlNcFphOVFCQkRNQjBHTG4vKzdtMWdpUzZj?=
 =?utf-8?B?VkRiejBPd0xnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anduY3c1SzNkU0pRRVFGcHJNMHJXY0lWRWhLVFlFcXdvVkRZclRZKzRFdE9Y?=
 =?utf-8?B?a1YwTHM5Rkk5VTVncjdjUnhRcjI0eE8xN012TUVFbW1OYmNkZjA0VVh0SmJN?=
 =?utf-8?B?a2p6bVovcjFwRENMWlNGWnZCWm4vUmluNXJ4R3F4VWp1bjBIK1hXYVgzSDk0?=
 =?utf-8?B?dWs4bEtld1BBT3I3d0hnVTkva2c4N1JlejFoTldaTUpGM2FnSzMzbTRCQ0VO?=
 =?utf-8?B?Z3k5WUM2K0VpNVM0NVhWSVN6WFk4TGh1UUZVdmF2SE9Bb0Q0MmFzRTNXRUdh?=
 =?utf-8?B?QWR5bS9QYXFkN3RJL1FhMjVwWkJ4c3dmME93N2tlOFp6M0xPQmlIUW8zYXpO?=
 =?utf-8?B?OTh4ZVBQdDVvT0EzRnRZU2tzRlh1dkFqVU5na1NWcW1uTWpGd2VqMXdObFls?=
 =?utf-8?B?T1Z3OVBpZnltcWRwU3dJRnU4R1prcmJ4NTFoenhISE9Ock93YkdYb25KOGZl?=
 =?utf-8?B?QUxyTE02UTVsbWxWNEl2OS91QjA0RVdnRkdZL1U2U3VSMTJuM1R1aVFLazdL?=
 =?utf-8?B?YzUxclFnc3hvbHVHcWxmaG5KYU5ZdWk5bkRYYm5wb1FRWXIyTXlqY1dCSzBs?=
 =?utf-8?B?TGtPdEFkYTRzNEpDVFllVmxOcTBtaHBRbUUwcUpLNmw1a0laR1dyZ09ZdjZL?=
 =?utf-8?B?Z01RTUJucStMMDE4UU9iY3ozWVJpNEdBZHRJL1FJTUlkcytEYWp1MzNFcjBo?=
 =?utf-8?B?K0dMS1Z4b1loL1ZSOW1ET3huaEZlRDgxQ1RQSGhXNjNtT3hQUDAvOWx4VVJ6?=
 =?utf-8?B?NE5zblVZc0RQWm9DOUZScFluYnZLb0lVb2VBM2NqYmc1QmlPZlpRUmR1eGxZ?=
 =?utf-8?B?SUtWNHpBVGNlcVVaMEl1SXdIUFQySmpyM3JrMnN6dWc4WkJzTFJFNW8ydi8v?=
 =?utf-8?B?d1JBcEtGeUxuSUI4ZGlhVUNqVXFFZ2RoQnVNN1Fac29oQVMyekkvUyt3Si8z?=
 =?utf-8?B?QUs5YkZNV0krTE80UTNhcTZrVldpZ1F2ODA1bW1XajRoZ2xrM1Nkc2xCN0VF?=
 =?utf-8?B?cXcvUkROdW40dnlLRDJKUHVGZE16Q1ZObGNYNTZwbGFHWDI2dEpueFpUTWtv?=
 =?utf-8?B?UjJjd1lISFlTeC9vVVFJYmMzdWkrZy9sOWpHaVFEYVBHc0FBdEhDb0I3RTFI?=
 =?utf-8?B?OUtScEFsTldyVmE1bngxTHhUYnV6RHVsVGpEZjJzVFdvYktnN3hNVGMwK2NS?=
 =?utf-8?B?VE5Ea2lkc29pTExTZXIxVXRDbGlrSHowcmVYamlRTFNGUVg4VW5MOUpUQmNk?=
 =?utf-8?B?b3NJSFBwS0RhRnk1NE4yYzlPbGU3enRUaVpqZW1xd3AzK2ttUG1TT015NGdz?=
 =?utf-8?B?cGVzZjNSQTF1eHN1S1dMWGtJUnhHR24wa09MMU00L0QyeWRuK0hOZEIvOHJY?=
 =?utf-8?B?emFCOG14MnZkV1k1NWVLS2h4TkM0ZWZwMXp2cTRCNGJhKzQzQndJMlNKMTRZ?=
 =?utf-8?B?VmFzMHAvVWhMSjA4a0d0WFB6ZnE1TGRaT0pWSWhWb2IxdTNDdzNkdDE5L3ps?=
 =?utf-8?B?T0hNcnNXR3lJd0N1aG9uWkJpdWtqLzdCenJ5V0RyQmxnRHJVM0t1alhRY0w4?=
 =?utf-8?B?S3F1emM5QUh1a2N3dUIvdDFrSFpyaFBTYTY1N3M5eFBHYWtza1FHQk5pQ1dF?=
 =?utf-8?B?YjhUdWpVYnVybUtjTHJ3NTh5bTdpQmEvZTgvcUhNQzBnSlRMM3FPZjAvQ1B2?=
 =?utf-8?B?L3FJazhDc2g4aHFqb3pVQ2R2NmpLWTYwOEtVNVNMWU42YU1KOEhKYzBYczlS?=
 =?utf-8?B?OTNxNW9tNTlvUXlVbTVkQVRmZVpDYllDNDk1clBBVG5WVkd5eGIyQjZKNmhz?=
 =?utf-8?B?ZStDdmhTSVNObkJKMUtWV0ZYMVh0c2JTMGp5T3FlQ0JmSUp5VDBYQlRkMU91?=
 =?utf-8?B?SE0zelZLMGhxUVoyUVVMRjE2RytxcHNENjZVODYwc0ZiRVVoYTBHRkRza2VL?=
 =?utf-8?B?RWFVUjdyZXNkYlZpb0hYNXJ4ZngzNHdVVVdBTW5OZ1RKdHIyUDVnZ0VBcmpB?=
 =?utf-8?B?aUlKZy95OUNHVWtWUGJlRHlNbU9kRnY4NTlORUpyRzJ1TFpUck5yOHJtWSt2?=
 =?utf-8?B?TlVnQnhCMEdwN1NGSXRFdUtyQ3BkTVRweUdpNzY0ZTNNcFNRQW54Nm1teGh5?=
 =?utf-8?B?bTJZeThLaGVpeHF5TGhKZ3VaUzNpaVZ6b3BTODFOa01scGluemJ4L0lYejdn?=
 =?utf-8?Q?wNeAR08nTkagTdsfrJ1l1kB0Snjx3R4LqgTIt8CGyvN1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19c2493-91be-4a22-3304-08ddac86c447
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 03:34:57.6063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hz97XKMnTyl/KdfY4o1bu2c2DtMlKKbp5cJMAH9l7bhxnixfO8z1mHHvIdWcEypNfXZwR0vjRzu4AsRV8zGr0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

This method was probably kept non-const due to the absence of the
`const_mut_refs` feature, but it has been enabled since the introduction
of this code (and stabilized with Rust 1.83). Thus, make it const to
match its non-const counterpart.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/str.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a927db8e079c3597860880947a03959e1d6d712e..2640a050847e64bfd18c127a5a83b93f01f036bc 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -288,7 +288,7 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
     /// `bytes` *must* end with a `NUL` byte, and should only have a single
     /// `NUL` byte (or the string will be truncated).
     #[inline]
-    pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
+    pub const unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
         // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
         unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
     }

-- 
2.49.0


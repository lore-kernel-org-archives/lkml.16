Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359BF19F495;
	Sat,  5 Apr 2025 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743859604; cv=fail; b=XQK0xaW6zCwKRGDrGES9efXD2vcrBE44U/68uNb2h/9YmYgRnKKYohxKzByc+ssLSi6s503ncSZSpg5HaperZvEF3JV56G1DoDWhhjyuxskIptxdWMmrNle1tL59b65vGklmnAIV5vVN8YS1o6RzrBXeUn3FLkq7KjDieMZU0RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743859604; c=relaxed/simple;
	bh=zx/herELpIcyIcFoRjSNPRjVfrs+/GTKds0Kge73J4Q=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=MNjJxbNFtaMc6eXai94aNdphioU15p7oUs8lb+2CNuJWrc18ozt5FJf2vOb+3WDqsqpW4x3OWj8WqadMrN08Cm4xUaB6lq+qzpFbLe1VLGMy7DTkr3OJMFOKuMvN/eryUCuicuxUUzxvlioW8ytrikv0IabKfwuolPV6bGK+Fhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RPgpaSh8; arc=fail smtp.client-ip=40.107.223.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RPgpaSh8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvsHhKNReCLgY11QFxJq81acmm1ekgsttbJ4/31fteYJzrWr+2/hSVTyZr3TkhNz8HOyRZafr7yF+oWblBRrFTtSDJV8oYBos4EFvoJVY4p+7b4KBdFnA6+FdAi0vxNDSOJ1JcFapSn4sDh/EjS+yTyOKl8nCO9KyEiwO914mxxj+CHXi6Uh6d6PyFthWG2U2FPeQ+eprdlOmXNLGCEvbxB1aUnxfyeIWCJIkzVL8YDC5yf+ykg3EFYzPlSEEZn24VpUggqlC3KqJyEVYdXnX5GFHxdupRfTNSmsg6GJAMGGjdcH6FqnyDxuYTaleivjecvSI63kv/59aMZiPcF/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3exyJR8Yu3x3M9NeGgWNtGSeZHoXRDP0gVqhwywFd2c=;
 b=golsGgfNSV1oWBnguTvPQQhUDo0ef5/TPSlI/fM015YT8KPg3zJF7UG1iFfCZcrOHWozIvWMTKKrRiOapXdyUwjCYb7PqF61JwDciemcQZwv7TGtAJbfBKa3Lnhx2tMhkrQujbE+cIiCDtsKU+spsil6PDt3DP4++QKuSlbS8HDYwqtoXKkcpCDupcKkdof6iREBtB5M6QKuRjqnDod8PJErNShOA5JSSDy8PVQdYJphs5asgUiKrc6QQFUe+YvbGJUXBGD5L1Tco2/umfCcRd13i46ZxhPJve89AZEUWFot+4A0rSw7W5pd6DuZCFjlT2/Hbz7JC8AEUykRRZ2yog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3exyJR8Yu3x3M9NeGgWNtGSeZHoXRDP0gVqhwywFd2c=;
 b=RPgpaSh8PcPKPskqevWgwcRLF1zp8y+gz+JLYLmhW4JGAUQWtCnEPqWvCXKTKYT7qZwLu/kCPklO3IG8sGDfplsufTsfxF4kpeo6/E8pZM7IpUtQpwX+UYvC7u3+GyXycA1ma3tIFD1AYqEV+HPCl0uHNjIWxZYFttM68KLUyIuaXqKNfOqzMLDpUpJUptPRCs1GIsKEC81WlyNd+s3Ly0kjgotn8mKpjsGxLglIM2rwYyIOEP75qSLvTaxYRWUP6DExW6r2LZFJOaFPaEo4M8fPG8+u5ldEX7XPm4rcpPGJ/7sQTUTXbhqce+m5PqJtMEMzKRGnZ+R2T7Ngazf0mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Sat, 5 Apr
 2025 13:26:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8606.027; Sat, 5 Apr 2025
 13:26:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 05 Apr 2025 22:26:22 +0900
Subject: [PATCH] rust: alloc: implement `extend` for `Vec`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-vec_extend-v1-1-bb7d19b47adc@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAH0v8WcC/y3MwQ5AMBCE4VeRPWvSLr14FRGRGuylaBGJeHcNj
 t8k818UEQSRquyigEOizD7B5Bm5qfMjlPTJxJqtLrVVB1yLc4PvVVmwYWs659hQOiwBg5xvrG4
 +B6x7am7/eN8P1JMpOnEAAAA=
X-Change-ID: 20250405-vec_extend-4321251acc21
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OS3P286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f7::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: da394711-f644-4311-8524-08dd74457d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVNVUG9DaUczR3lRaDJ5dk1Ya0dCemNQWTlFRktiVCtoNDJzTXhRTCthQldk?=
 =?utf-8?B?OGNXSTRacWpBeldrTTVzNVUxM2pGYk5UdXlEUGZGUWVuWXNWYjhTb0NqZDRG?=
 =?utf-8?B?RDFHS3hSZlE5eXliekRVVnF1cUJsbGE2TUwzVEhicytPQVFuK25BTkJ6TEdh?=
 =?utf-8?B?ei9kbXBXazhtODRXNUh4SytjL3hCMVhNY1RQazQ3aUNmdUg2ckthMmxIL3hL?=
 =?utf-8?B?WWZVWTNhRVp0d28vWURkMVpxc05aODFCUFNNbkxjU0RlU2N5dFVMSWFDUlVv?=
 =?utf-8?B?U1pHV2NZTGcybEdwcW5kcjJWZWVCUlU0Q1FpbFd1K29WU0VPMlhvam9Fc28x?=
 =?utf-8?B?NDJFcE5sZnAzbkh1czZ6empmMHJHQ2pLTG1DT24ySzNqRXFiSlk3ejQ1TWFy?=
 =?utf-8?B?b2d1YklLYVBtaEFtVjhMakhPblQyeDJaZ0RLVzFyMm42UmE0ZlMyOG10RU41?=
 =?utf-8?B?QzZBbGRlR21tOVdaOUFsRmdxQm5IZXp3aXUzRGcyWXVweHl3VzZHZUI5N21X?=
 =?utf-8?B?MnRjdVdtWHR5bjBDNVQ2ZGpndTE1UC8yNTM1OVpzYnB4Z1FRdGFxcTRQWVNH?=
 =?utf-8?B?M1Z5Nm9CSGZ5c0pWZ2JoSzI2ZDNGenQwNExZb2VkRVlJbG9zZldiMXpCbWNa?=
 =?utf-8?B?N0NWNDZyMnhhYXhrZzIydWJtV2JTVVI2dWszOXFuOEZZY1ExUElsMW5NN2xm?=
 =?utf-8?B?RndablRLdGUxZU1vY1JVT21SaDdUdWJHTVNpQ3pqVHdFWnBiVXMrdjcvYWJl?=
 =?utf-8?B?YVllR0dJQ2gwMXYrd21MMjNzTWt1VVlvK0RpWXZLc3N2TkpYWDg4Z050STIy?=
 =?utf-8?B?Y1QvMnBYZFhkOU0zOUgxR3NMRmR1SFhmVHFJK1pTbXNDK3JmQ1NJNGNlb3pS?=
 =?utf-8?B?ZTRkaXkvTmVVK0NCdTg5aFp0R1BJTUFBazRwWWIyZDNneVVXK3ZyRU1VREp5?=
 =?utf-8?B?NmZDVlVsSzZ6MUtEYzIyVGVMN25WL2ltdjQvZkx5TUg5OHFnWGZlVnZPYnlv?=
 =?utf-8?B?RWpUM095UG81K0crQkE0c3BiZ1lsL05yMlZmNi9zWktJWVZuMzlXa3dKa1ZI?=
 =?utf-8?B?b2FXK0ZqMjUzZDZIWHg5c2JJd2dLOGI4d2x1SjVpSGF1WUlPWVpaN3U3QUh0?=
 =?utf-8?B?Z0pKWnN4ZVZjK1ZsTWNnS3BWZTl6VTAwRWNleXdURkhnSEgwM0YxZS9DamV0?=
 =?utf-8?B?UEJzd0FuWGpjc0dRVms1MDlpZ2czUE5Zck5NTTNKaFUrMnFycmExclhwdUgz?=
 =?utf-8?B?TkJOem9rWjdheHhGNjF3aTZZQnBic09WOE5KSDFMcG1CdGJyNVQxaXVBUHBv?=
 =?utf-8?B?OFl1MWZJOTlCY2JoWGRlMVdEU2U4K1lyMjBhdDRwU3NXbEF4b0xVaXdaRTdr?=
 =?utf-8?B?QWJWVVh4TXFLeWRRNnZkVzRibWQrMFdsUGhybDUxOTI2TUlwQnpCalMzdWN3?=
 =?utf-8?B?eEduZFU2TjZNejFydDBtK2JKbFpLL1JwYVFGL01BamZrRzNDSkxTSUhtK3dV?=
 =?utf-8?B?UUNFMmhySHVYU0ZTRDRVNjc2SzN1TDNnSDVoekJRdHVEUFVkbmtUMm1xem9s?=
 =?utf-8?B?T3JOalIwZ3hWM2RkbXZ5MUpBR1JoK2Uvd1BDQ1BaQ2dOL2JsVWF1TGRjeXZS?=
 =?utf-8?B?VDVoU0NMNWFKTnd4QXR0VjNDb2pqSzAzd3pEN0VrRWIxVCtKelNBNU9LUTdj?=
 =?utf-8?B?SVBiL0xuUnBDWElEa1daRkNqaGxVU0h0Rms2bE9PM1M3VVE2RXRSZnpmYVNs?=
 =?utf-8?B?Q2NvU3llaFoyUFlNTFdUcFZPWUZUSyt2TU5OVUFpS0ZrL2k4TVhCclJXejFy?=
 =?utf-8?B?cXZ0ZVdOYXNuVkkyNlRRaGpjUHdxYXEybVE2OTVUUHR0ZGI1amVRU204NWhU?=
 =?utf-8?B?VXRnNFpsekFpdnBWQldUSURuV0g4UmxTcXJacXRDTFdxV1lMZzROSTE0WHN5?=
 =?utf-8?Q?F+Zpl4QDAiQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U05abFh0T1ZuaHVzaVB5MXdHMStsN2NSeDR2ZU1wSXV0ZVp4Mmc5TUFtaXZ4?=
 =?utf-8?B?ZC9Qc3VkSUI1NW45TUFOOTdQeklkSnZhWmszY2ZYajJacFA2VERNOFRNc0ts?=
 =?utf-8?B?OGlsdTE5MkJTMzExSVg5c1ZkbklnWDYrMWppTGQyLzgvRTZlMmxYTzZEQ21u?=
 =?utf-8?B?ek9PaXlyZ1lTL2JSaGdGa1c2RWZnUytKRExYckpVSWhiQVdoZ1FDTGFENVk1?=
 =?utf-8?B?bU9vT1kwMmlvRnhWVG0rbCtFSWpRUXdXbzhYWWdRWS9ZWTNuRnZtbVArQ2VV?=
 =?utf-8?B?eGV6MVdwVmJqbFFQWFE2UDUwN0ZjeFdNZjY3YWE3Qk10Mm5SeWUwY3pYa1Vv?=
 =?utf-8?B?S1BLSnc2YlQxd2NKcFNCMEp1b29mMFNFekprQ2dyT0lEQmw3NDNHd011elBL?=
 =?utf-8?B?di84NUQ1VjBscjRERnhtQzlOY0Vudk9LWThNSzJFSFpyUDRySFZ1eVpFSlJ5?=
 =?utf-8?B?L0taMnRkWUJ6RHRDVmlKb0dKcU1TaUNteDhBeUU0cTRXZXVzVDJtZVphMEEr?=
 =?utf-8?B?WWd6UVlSOUkxaE0vYVRaVXdrdkFxaG5JTlNXSktVK2xUTWZTSjE4dzY4aGIy?=
 =?utf-8?B?TnpBS1UwNFpKSml0OHlNQ3FiQWxiYklqNkZTeC9vSzdKNCtLaWYxTW5ZNVlX?=
 =?utf-8?B?c2lZSVNWdmJmUHRlQXVrNk5tYVlDaHUxYjhJb2ozYkd5M1dZczRMSzQ4K3ZT?=
 =?utf-8?B?TTBqNmdnanBlU2RrcWRvRVNoakFFR1hUWmV2WUwvNHZ4WVh0YXJFMGUydDg3?=
 =?utf-8?B?UDZsaEhUL0t5YkdPMWFpQm9FclZqeTBpdkVHZXpuc0lhUXFNUDV3MUhCTW00?=
 =?utf-8?B?Z1lEckgxUWhlc1VEdU1ibkFwYysydDNoMHBKUlpkWVY5eUhDZUV6am5MZ0xk?=
 =?utf-8?B?eFV3Sm9sTm41YjdaSE1jUXBEVEErQzA0dUd3ZHJsbmo2UlpWVTJ3VjhBN214?=
 =?utf-8?B?eFQ1RTNuSEJGa2h0MGlnL1hNeEpNeHB6bWlOTmlyVnNZYndtR2JsRGh1b2gz?=
 =?utf-8?B?TXRFYkRjYllLbmtWWm5CVWI1c0dOR3BCWGpkQVNic3dmNVNQV3FVc3h0Z0Vw?=
 =?utf-8?B?R2xidTM5RVJNMC92TU9VLzVOakpMK2l3eW5EN0lETDNKYjZNZFdKak5GTmJ0?=
 =?utf-8?B?S0RPRjJ2UFNOMFIyYmc4OUNIVDBGblZuU3dKYit2SmFCVGFsdmd6aVBsdFFy?=
 =?utf-8?B?VFJERGxuWnh4UTFjRDAzLzVFdDNqNkZTSStxVWtpTENsZHFwRzZMZTJaNFNh?=
 =?utf-8?B?YXpZZFRlMFhNOVdkZG10bUFwVHlTYUtLTVgvNWZXZ3BaeGUzNjF4QUhEOHJ1?=
 =?utf-8?B?MzVDRDllQnhwdzI4ZW1GUjRFRXl4bVNsYmlqc2ZhVUFMNUxTcDh1ODBHRGdq?=
 =?utf-8?B?NjRLV05iK0VMZEdpbWxXaHZxU0IzZTJLZ240VG1adktIRjl2OFgwVmdablI5?=
 =?utf-8?B?ODFoNHZMS2dmN05idG9iQ1NVMFBlNHYzcGh1Y3F0b3Y0RGNIcU0yQ0prYlZU?=
 =?utf-8?B?YWVkY1hOenBNNmxiYmZlZyt0WE9XTXhBRWRSSGxaYUpuODRYditlalJWbm03?=
 =?utf-8?B?aUdDSE5ZcWl3TmM5OG12RGF2dEo2RWxOaUxjM2tRcVh6VFQyZnFDSDlhblZr?=
 =?utf-8?B?ckpNYUt1SkxkRS9ySG5TUmJVNlA2Q3FRRmMzd2h0ZXRDM2Nrcm93bmQxWng3?=
 =?utf-8?B?VlFwLzRjYzJrTDFhZ1FhajkwRnlsM00yRW84SWlKMFM1NW14cGh2L3hFNmNm?=
 =?utf-8?B?L2EvYlN3ZkZzK3k3WTdNYVRiMU8rL1lpZ1dta00wUGxsWlBvSkFmU09tb3My?=
 =?utf-8?B?NVNsNWhKcDdGaG55UWxRc0xRVHMvTmlrWUlFRVVINzdSRTNGa2pHTHNhSDJw?=
 =?utf-8?B?UTNpcGxZaHZDOStnbm5yQk1KRHNJUWFjT3hjdUxkMDd5cnUzRk5FZStXRlZD?=
 =?utf-8?B?WWhwMStUL1NvUElRdVhQQXVGdmtCWDJHbnlXczMrUmMxSmhRZXRPMnMvSU8y?=
 =?utf-8?B?MGF3YnNPNjJ3dGFoMlE0bmRJcU9mejRjMWdCZFk0RXBraHhtOVY4a2toWnZD?=
 =?utf-8?B?WWVOS01HQUljN0VpSGtWb0RoM1BEdzBEK2l4dmJGUVNpangxTlBhZzBzMFNG?=
 =?utf-8?B?K2E0UDBxdEt5dFc4aUdESE0rbkVUZlhKOTJFM2tkeW1WdmsrRU1WaVhYSVBQ?=
 =?utf-8?Q?bvTlDaRcchW84fST/8NvuYP4mYcWI0toMdiT6+wpfaz+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da394711-f644-4311-8524-08dd74457d52
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 13:26:36.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3uMT6T6/Qt26UzUQvL22zxW7CQrjYvEP0rbL7GIF79jDyhQy+Hq8iMClLRGOY9ZhbxaIbX4Ggv3fZIWdBlgtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928

KVec currently has `extend_with` and `extend_from_slice` methods, but no
way extend a vector from a regular iterator as provided by the `Extend`
trait.

Due to the need to provide the GFP flags, `Extend` cannot be implemented
directly, so simply define a homonymous method that takes an extra
`flags` argument.

The aforementioned `extend_with` and `extend_from_slice` can then be
reimplemented as direct invocations of this new method - maybe they can
eventually be removed.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
I was a bit surprised to find no equivalent of the `Extend` trait for
KVec, and while I anticipate to be told the reason for this, I also
didn't hit any hard wall trying to come with my own implementation so
here it is.

I expect the new `extend_with` and `extend_from_slice` to be optimized
into something close to their previous implementations, but am not sure
how I can simply verify that this is the case - any hint would be
appreciated!
---
 rust/kernel/alloc/kvec.rs | 81 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 29 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ae9d072741cedbb34bed0be0c20cc75472aa53be..e78cb5ee575ce01e44283f8b4905689fb1e96165 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -454,31 +454,65 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
     }
 }
 
-impl<T: Clone, A: Allocator> Vec<T, A> {
-    /// Extend the vector by `n` clones of `value`.
-    pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), AllocError> {
-        if n == 0 {
-            return Ok(());
-        }
+impl<T, A: Allocator> Vec<T, A> {
+    /// Extends the vector by the elements of `iter`.
+    ///
+    /// This uses [`Iterator::size_hint`] to optimize reallocation of memory, but will work even
+    /// with imprecise implementations - albeit with potentially more memory reallocations.
+    ///
+    /// In the kernel most iterators are expected to have a precise `size_hint` implementation, so
+    /// this should nicely optimize out in most cases.
+    pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), AllocError>
+    where
+        I: IntoIterator<Item = T>,
+    {
+        let mut iter = iter.into_iter();
+
+        loop {
+            let low_bound = match iter.size_hint() {
+                // No more items expected, we can return.
+                (0, Some(0)) => break,
+                // Possibly more items but not certain, tentatively add one.
+                (0, _) => 1,
+                // More items pending, reserve space for the lower bound.
+                (low_bound, _) => low_bound,
+            };
 
-        self.reserve(n, flags)?;
+            self.reserve(low_bound, flags)?;
 
-        let spare = self.spare_capacity_mut();
+            // Number of items we effectively added.
+            let added_items = self
+                .spare_capacity_mut()
+                .into_iter()
+                // Take a mutable reference to the iterator so we can reuse it in the next
+                // iteration of the loop if needed.
+                .zip(&mut iter)
+                .fold(0, |count, (dst, src)| {
+                    dst.write(src);
 
-        for item in spare.iter_mut().take(n - 1) {
-            item.write(value.clone());
-        }
+                    count + 1
+                });
 
-        // We can write the last element directly without cloning needlessly.
-        spare[n - 1].write(value);
+            // SAFETY:
+            // - `self.len() + added_items <= self.capacity()` due to the call to `reserve` above,
+            // - items `[self.len()..self.len() + added_items - 1]` are initialized.
+            unsafe { self.set_len(self.len() + added_items) };
 
-        // SAFETY:
-        // - `self.len() + n < self.capacity()` due to the call to reserve above,
-        // - the loop and the line above initialized the next `n` elements.
-        unsafe { self.set_len(self.len() + n) };
+            // `size_hint` was incorrect and our iterator ended before its advertized low bound.
+            if added_items < low_bound {
+                break;
+            }
+        }
 
         Ok(())
     }
+}
+
+impl<T: Clone, A: Allocator> Vec<T, A> {
+    /// Extend the vector by `n` clones of `value`.
+    pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), AllocError> {
+        self.extend(core::iter::repeat(value).take(n), flags)
+    }
 
     /// Pushes clones of the elements of slice into the [`Vec`] instance.
     ///
@@ -496,18 +530,7 @@ pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), Al
     /// # Ok::<(), Error>(())
     /// ```
     pub fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), AllocError> {
-        self.reserve(other.len(), flags)?;
-        for (slot, item) in core::iter::zip(self.spare_capacity_mut(), other) {
-            slot.write(item.clone());
-        }
-
-        // SAFETY:
-        // - `other.len()` spare entries have just been initialized, so it is safe to increase
-        //   the length by the same number.
-        // - `self.len() + other.len() <= self.capacity()` is guaranteed by the preceding `reserve`
-        //   call.
-        unsafe { self.set_len(self.len() + other.len()) };
-        Ok(())
+        self.extend(other.into_iter().cloned(), flags)
     }
 
     /// Create a new `Vec<T, A>` and extend it by `n` clones of `value`.

---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250405-vec_extend-4321251acc21

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F0D2882D1;
	Thu, 15 May 2025 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297987; cv=fail; b=oJJ19e2s+8xcoEJVOZYyoqY+S4JnZOwl0Yz8nDqvhtEl/80EqGUgul/KMbpm30Gx3ooRRZwN3BQ8iIWo2exWMYL/h9f6nvB13wTsCwU3ODPNuxMZnf5JisJZNUOkDT1zzS2KYFDXdaUm8MOkrse2h7/0G4vi9M8OrCybac9K1CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297987; c=relaxed/simple;
	bh=f5IcOLicxiH5ZF7/fZEllXdYNsxudAF8PdXTs7kHn9o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=L4BzxAWQvNv6MHH/20p/ZJlMQ6xhz9NGi2MID7+CrWQSd5AiLgw3SzeU3znpUt6Bpxd2fxxzCFRYTPkWZGgnlsKEsvxmlCD/CKsItOq5lhlN8krpIgdUgyHfUYqOnb97poYhtxhdWHoHrXXvhK8trJ70CdJ6l6HG4kevT8REceA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DZKSO7Jk; arc=fail smtp.client-ip=40.107.102.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DZKSO7Jk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOn1uNwkgipnFUlpbHUTNecCK2YAuYyw7+3+60JAhmlyNThkoERyaZN1uhwGLHbZGjN5OKMdfVT0ouJ6Z4w/olz2HLMtl3MRmAGz+labD2sskJY40SZ9XyBMVlRJoUtHwQPS1fOnqHDn7L7d/aqXkDnT65uMPCRWusbQPFG+oNRmjPscjXGhAOGiKYfhGdAqPUyjWVgfDbl5/h0sCsxhDKFa6Db3gJjYBM1p+bb8cNW/WjX30MSP0sJh5H8jQ9n/CFzqyAi/icX3ZtNrxtOfDqSLfDVx0d5vsOJjqZuz74W+B+g+5VgZW7NEfyeEXQELpsy+A5pc2oJD9QI9V0yHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+tVeDBxzyxYW4g3Kr7Z8jiDU1SoPmz0BNdb+bpL9wA=;
 b=p+IEjW2i5hU89xC+amE52bLIgPe5gT+u1PFfE2iO3YvaVabQy5xhtZha/8aQsyXJsj92Mubxdim6eQH5s8dunZ8xguBMYnwwqsZXAigjeclsRgYhR5rvyr19tSOqqIqzvz6IzTmDy9b35iQjZc0qjSLnRkUvabOs6q7LIv0+AX18yi0hfz0Q27m/0WBR2FE1hxuWyBiB/cZEuZh8B5v3wjs6qgRD5w+0gvbPEbfHPIqr00eE+rgJOMCafh5oMdHMJhIFCWpjLFaNbK7ZPeOC+hPutrdxqtFghotUOBO/9Q8m0wSJfScJX1Uh7wGwCvcFM9oeSYcV++jVRV9MUWg+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+tVeDBxzyxYW4g3Kr7Z8jiDU1SoPmz0BNdb+bpL9wA=;
 b=DZKSO7JkNceZCOWKmPHU3LoPCCgmqCX4te6u6H/rRsqi5KsB/xQ8YI37PK6ic6/y0TmyG7YGFC5qIpFB61Mfsa+1EGzK8SvuTJypb5DWN0ZnF03CX10G2YR+zN0bVnbUQBFB6oKUd1vUWj42J5CYOb5VaDusoSLT+XmlciI+wEJ6ALImb43w+HZGGJ2yLfbwnRS1a+16n6q3rK1CsB3sEso3pnfoe8AHseorvWh5s5oSIXu1Lau2vuEwzwx6pW4stEIa6n6BPVTZTo8Ljd3U8oa98VAnRPOaJjwyqQVEtNuKzQuce4Ws5wFMIQnZ0ohUJvK/AO7+oT7kXgOAaXf99Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 08:33:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 08:33:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 17:32:57 +0900
Message-Id: <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
In-Reply-To: <2025051543-override-rockiness-3ead@gregkh>
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 8123f160-8ebf-4614-2756-08dd938b1af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1BRQzZFOFJPVUtrTTh1OHpId2g4SC9iZkxjTGVsMk1vVENjMlpVQm5jaXFa?=
 =?utf-8?B?RVZnTWp2M2pwWDBHRDBITTFxN2M3d1JacVp5ZWVNTEVudi9XTEE0SFBzVk93?=
 =?utf-8?B?Q2lsM2hBOWdqVWdGYjc1RU5qcWhjSkhvd1c3Y3V4b29FQVF3NzlqY2xsaFNh?=
 =?utf-8?B?N0FjRW5PdFArWlRBQUI5eVY1ZXV3eTJrMHltWU40TzdPYWY0U1hvcWZKamxH?=
 =?utf-8?B?NXNBQzJQMlpiOE9kWkhTNXphREgrcGlrWU5XU2dxclU1RGErRm1UZzZRdUFh?=
 =?utf-8?B?KzRvQlRqcjZkTlFhM0h2d3FmOGcrWXNCZkxLcXZuWXZPWTRQcUwrUFJkNUs4?=
 =?utf-8?B?ODE2QWMyb2dYU295d3orUkpDTGtINFRONTVvOHd6WW5OZVdiOXFiUmNzekdr?=
 =?utf-8?B?My9zb2ZhV3QwSjQ2MVlWcHQzUlpJRk8vc2VrQ3VQaVBGQ3Z1cys0WU1wdXp3?=
 =?utf-8?B?VFlPMnF3VnM1TENvOUNTRXJRWlBTcXpRTVErMUMvSTlzZHJTWGh6UFUwZVFw?=
 =?utf-8?B?dVN6SnRndDhMRTZiTUpEUWppZGtkbkFGaHB5V2EycG0zc0RJRlE1N0xkK2g0?=
 =?utf-8?B?cjJoSnlRaVlweG9FQWExeTYzamc3K3IzRTdDTFp5QW52M1FhWUJ2cDFjcyt3?=
 =?utf-8?B?ZC9OcFlrTVZjOVcyR09NTlhBRmUzTWVLWTc1NVAzaHR5UVdsMWM3Tkx3UnVY?=
 =?utf-8?B?MGRJMWRLT0ZLbjRudDI4Y1h2WGx5NWtMeU93T0pnTllxY1I5S0VGU3JZR1Rz?=
 =?utf-8?B?MFgvbWk4bXhkN1czM1B2TEtZTXB0bndrR0NQN05lZWI0UG52S3RkamdJRWtQ?=
 =?utf-8?B?akI4cjhZampiRDlGZmNaS0pUU1RzM0hGMWZPOEllTy9rcEh3bCtlbFNuWHVa?=
 =?utf-8?B?OUYrUndEbHJqQ0NHZmJjL3V3K3lpZW9sQXV2YWxNL2NoZ2hGY2h6b2dycTVt?=
 =?utf-8?B?ektHeHBMVFdSY2xIMWdIMFJ5OUdoOGhUWUJTeTMxNmx1ZUh6WEVBYm5PSU05?=
 =?utf-8?B?Q2lsMlN5S3NOWTNQZFJaVXB0VXZxQjg2UlJ4SXFxcUNWV3k3KzU1YWFWbU5C?=
 =?utf-8?B?U0hTNnRRMC9RV29KNmlBejVwQXd0bll5UFJ2d3V1anM3d1h4NHlCc29jellP?=
 =?utf-8?B?S3BhY1QwZFQ4L2QxWmJEUWk2eVRUZEVkWUNWQmhHWFZBbkV3U1ZBOXpicVJy?=
 =?utf-8?B?WjhvYjEwVlFXMWNRbUp6SWIwR3R4SVYxS1NrdU9pcVZ6Qkt2bHEzemE3ZEFl?=
 =?utf-8?B?NFRLbzdLWlZPVmdGSnU0dE9SNGI5L3d0Yk1mWkVuL1hKYU5BZnFla3B3dDBG?=
 =?utf-8?B?VElSU0RDcCs5OHR5T1hmZExETzdmSkZJUHlWS0hiZHNuQ1JYaGtkdUJwTzdX?=
 =?utf-8?B?cW5wV0FkNVk3RjFMeHF4LzJDVXRpVzJUS3hvZm84TEYydVh4L212VWYxUkN6?=
 =?utf-8?B?SmhlaDZtbW5HanR6L1ZNd3AwVjZLTWRzZGl0N1Nodm8veW12d2tnVjZCOTk4?=
 =?utf-8?B?MDVNUzQ5YVVTQk1sZXlIOFoxNlBsRzg5aGlzWTdFbEpDRWtHZFZvY1ZwQndu?=
 =?utf-8?B?MG5oVGp3WGprcjFwUUVDbENLMThwb2VvTFpXUzB1ZWw2OVFldUZpclJqVXBK?=
 =?utf-8?B?dGRoTml5cXZ3cnBUYm9lKzlxUGpzeUZrUzhsazNCbk15d0ZvODRVb3VTQXVE?=
 =?utf-8?B?VzdMc2lrY0x3cndZWFhuNEV3Ums5ZTVBNFBEMFRCTlZIVkVzekNQMUxtRWo4?=
 =?utf-8?B?aitVNzZKazMyUnRSSmk5L3dQdmErbmRCU3h4cUw0a2JjcVg5bHBmSFJWVW03?=
 =?utf-8?B?U1hqMVdXYjdaSnpON0ZncGRaUUkyM1YyQzMwQ25QTWRrT3hDVEJsMFhoc2Y1?=
 =?utf-8?B?dVoraU9SRVk3ZDlIdHY0L09yL2Z5amJGT1hpZTRhTTFNeVFoQmZoMmlXSVor?=
 =?utf-8?Q?4xGkywg4ryw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blVCUDBaemw0KzNYUGYwWDEwRjZTZ0VGMHd0anVkaElITzRXWTROMElJMGI0?=
 =?utf-8?B?SVFoelNLUkVjUWdlSzR6cUV2ZkhISXdGeFl2dkRybXZSc2k4OFJjak1pMyt5?=
 =?utf-8?B?UFhmRTJtUHF1VG5ra0o0QmtaYzU1bWtuQytxUDJwNmxLbngvTm0vdU53OXls?=
 =?utf-8?B?TWNDR09FQ1JhaXl4SkJnZGRlUlFRV0h1bFN1V2dtVHo5cldxcjRHbzZTOTBV?=
 =?utf-8?B?UW1VaHY3SUtsRTBlSHNSTHBuMzlNandlbnI3YXJ6OE9pMHpuT0d0WmZwR1ZD?=
 =?utf-8?B?VDE2ZmhaNFgxeUw2QTNHYytxdFFCZjdyWk1Rd3dxQ1ZVSGFJb3ozQTFFdjdj?=
 =?utf-8?B?cVgyOVlhalp6OXVMYkNLZWd4RGhTVlE2MEhBMkkrNlJXRWEzMW0rNFhkL0N0?=
 =?utf-8?B?YWFEd3RsZzVhYXZUUUkyMVJwa3p5T094UUVpT2ZKY005RUNVMEkzS0lRSVlr?=
 =?utf-8?B?Wk52b044VnFQcDQ5c0pXaGdoWWNYc2gySzE0cUZidmIvbmdwL3R5SlJ0QnV6?=
 =?utf-8?B?WEQxVGUwYVljNFcrZ2Zhd3UvaDRVWk8rYXVIQTNCZHEyUDV5bmVxcnhudWRp?=
 =?utf-8?B?SVN2SVpCN1pqeW5xVytrcm9LV0VPN0RMQ0dKaTNiS3F1c1FGZ3lvb0k4Yi82?=
 =?utf-8?B?azJVaHRTOXNySC9wdEwyRmhYQnRIYW9pSThpMmZUZVdwUW1pRHRiMVVVSFF4?=
 =?utf-8?B?WkZPMkNjS0g5WjhZWmxGMUg2M1lTK1BEYkdUNXlid3JyMXFjSkVTdU9DYTJt?=
 =?utf-8?B?dVptcDZNaTBjN2JEcXkvUngyQS8yVnZOMVRlcGxQeTZWL3lYd3k5alREL0t1?=
 =?utf-8?B?SnN3alB5d0pySHRva3k0NVU5QU9JM3NLMm05cm9POGtIa2FhOTQ2V2ladzdP?=
 =?utf-8?B?MHppaFV1Z21BK3F4M2k2SnNsSEFFNkphYnUxWm9qQ0hkTjNzM2tvNjFlbXE1?=
 =?utf-8?B?YlFETVJ0V3paK0RSNHBHRzF0MkZoQ2tiUTlUM0QweC9Tc1RqSlRWQXloNjRq?=
 =?utf-8?B?Wk55emhwTDRsQ2srOXFDcXFhditJM1QwSlpwTUo2MExDdkU5YlZoVnVvbDFr?=
 =?utf-8?B?QjRnSnAxbGoyOFpHdHphWGwwYTllT1FsNTl1bFhpSS9iZy9obXM5RXd0RHkx?=
 =?utf-8?B?cXVCVGFYNXlCN3FaeERhRHlCNU1GNWFHOC9nL2JhbmphY0FLek5KU0NWenNR?=
 =?utf-8?B?WitWcnRIenNxZUZDbi8yZTJGWGlmYitod3VIbDVaNW1zYlgrSDlDazZWYkF0?=
 =?utf-8?B?ZjFiNHphN3FtQW9hams2OGZ2bnQ3OWFja1lQNVlUYjdoaXZNd0NsbSs4OWJw?=
 =?utf-8?B?R2lIY28wS0F4U1NZd1BtTUpEVEF4V3BYdTFvSDhsdGNqVVczWkdtTDBxemZz?=
 =?utf-8?B?bHhEa1o5TTI4azZ4MkIza24wR0JhQjlkcFpGTzU0UUdQc2xBNHBvdnUrbyt3?=
 =?utf-8?B?b0JheVJwNWtYQ2ZlNjlHK2FiT3ViM1RidXpHUzdwQ3hqNklaNjNHY2ZseVA5?=
 =?utf-8?B?NHlzNTBYdG16WHlzaERoTzFhUXoxZmFDUFBvV2d6dDM0QmpReEM4RDh6M2xG?=
 =?utf-8?B?c1hGQjFMQVRPYW8xM0Y5T2dLek51L0UyV2hkcER6amhHdmRRMXpxSTQ2bi94?=
 =?utf-8?B?VEZrUjllYTBuRHB2Z0phNUFRZEhJcHAxM1RubGpsQ2tqRFFNRFVjYkN5STRG?=
 =?utf-8?B?WXMwQVcra2RXTUgwTUp5bHBpWGZ5QnVlY3c3eHlnZ2pUcVpURmdnalp5aVYy?=
 =?utf-8?B?Y1A4Y211cDA3SW5Bc09HYk11VjF4cEZFMm8vZnI0UzlLQnlNZzJVZ2FqVkti?=
 =?utf-8?B?Nnh3d09pWFVIMHlubjNTa040dG0vL0JZd1JoZEJrc0c0WmpVSFNsTFg1N0tW?=
 =?utf-8?B?ZHBsVkxWZnl3MWQ4Z0xWRElRQkxZbTkzOHJUdkxjaU01SXFSMXBpM2JPK2hE?=
 =?utf-8?B?cW1zZkk3VWpwcFdEYVpGZFMvbmVDcU9SUTBBdkxuVmVrM1R1WXhuWUwveFMr?=
 =?utf-8?B?eDVRWFJCb091SU1zK2tFM0VxczRRU2lMZzZOYmw1bk90bzYxeEthWUgvYjZK?=
 =?utf-8?B?TVFmVklacGkvVzBBYlVwam5TbXZEUVI2SmNUdXZ4R0RoVTJxcExIVU5VV3U3?=
 =?utf-8?B?REM4bVo0aVpoamtNTlREUjdNYm9kaUdRcS9nRlpiZzhvR3NRVmV1N0lCUTFp?=
 =?utf-8?Q?O5vjJymWBk6s2bZY56vEkbVH1OvPLOqSzPo/z4OiEY/8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8123f160-8ebf-4614-2756-08dd938b1af9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 08:33:02.1629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7XbGyhiDVuAgd2c7gycpmdFRasFPf4dCbZbN0xUANyoPRbsl6GXF7k3imhxoB97gZKeFsVSWSKLm1JuIgeukw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464

Hi Greg,

On Thu May 15, 2025 at 4:38 PM JST, Greg KH wrote:
> On Thu, May 15, 2025 at 03:03:51PM +0900, Alexandre Courbot wrote:
>> Add a simple ELF sections parser for unpacking loaded binaries from
>> user-space. This is not intended to become a fully-fledged ELF parser,
>> just a helper to parse firmwares packaged in that format.
>>=20
>> This parser is notably helpful for NVIDIA's GSP firmware, which is
>> provided as an ELF binary using sections to separate the firmware code
>> to its other components like chipset-specific signatures.
>>=20
>> Since the data source is likely to be user-space, checked arithmetic
>> operations and strict bound checking are used.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> This will soon be needed in order to load the GSP firmware in nova-core,
>> so sending this early for separate review.
>> ---
>>  rust/kernel/elf.rs | 322 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>
> Why is this not just done in userspace and then have userspace feed the
> proper elf sections to the kernel through the firmware interface?
> Having to parse elf seems crazy for the kernel to be forced to do here
> as the kernel should NOT be touching anything in a firmware blob other
> than passing it off to the firmware directly.

FWIW, the GSP firmware in question is already in linux-firmware and
loaded by e.g. Nouveau.

I am not sure how userspace could feed the proper ELF sections otherwise
than by splitting the ELF binary into as many files as there are
sections. Is that what you imply, or is there another means that would
preserve the current firmware format?

Note also that in this particular case, the kernel cannot just pass the
firmware without modifying it anyway since the signatures relevant to
the chipset need to be patched into the right place before it is loaded.

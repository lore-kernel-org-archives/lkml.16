Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18833208;
	Tue, 17 Jun 2025 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146733; cv=fail; b=GYDhaLj6Zuo0yuVEmkJjp8VGnbs47k6ammvnI/1b4phlPR/Mn55t37/X9mPRvVaHIv7j2aNwjhpEZb7BSLISwQvFZHDvAwhb9zWrooZp7at+Rre+eoS18Jxyi4h0i+FHPLFaCNUGaE18wK5ww0rU/OIvg1BnBJVRaLqEcnk9MYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146733; c=relaxed/simple;
	bh=2YI9xT8pcMyzOHxDloGDNJYXlLZnQMwrEvw38hrJhto=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=L2nWMpeW7yMfDdW5saNEeEFxryequy0kfQBI3Hg7qw12TtwDRn3FWFAZ1eLV+TPpAd5KHyEaRVpQX/kQ+0Y6QJWzppS7Pdi4NBKu7l7hCWVRte9W+qB+ygufGsVldoLDFjdVHhNVd6nkMo8z75SP1EYZMZs8flzRl2ObfIPMYz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sLzz/f6b; arc=fail smtp.client-ip=40.107.92.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sLzz/f6b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yek/BP8scGw5QQ8Ef1ptbYSkk4wcJd7JUbyC2D8YrQeluj865x5ALxjLgPgmC2Ll8OWOimKBmCkEQT4yOCWFIKWnimbHg0vgBNXu8muI/8FP18bdmtze9R+O8fyNto1JQJXoeg9May0B5eUCXlI+Vq26JQPTrLDmgM8/beK7tf9OSbXIZEykOqoBaC4fCeyTiBJH8RUTJh/3LqBG1yzwstT1tdjR6ZHvJGcmmyhDz7jOLKilX2d9+/+/AE04gcLP30syqPQtXbLsv1PT5kIGsJ5znvvcMsWSszdULvrEceP4GI/QnLlkgUVMvMERif0rBhW5uuVxX/xnRNFpH2Fing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jkJ1zENHaZF9JmrWgb7FrCKMpapYa2m8dKZu+vlkgw=;
 b=xEjQGDAzoEhDEEmEYMz9maybp3ZKVz7xN4s/aHeR7/Mj7W/g98Yme28kCJdHZkLx2dr2WS90E30f6G1LHLb341U/nTB0drLY8nrGhral2cOpAhY1f3/XTL6Zx/c04uZpnIKq8cmqDvEOueBFt6BHyYGGPOIGQoSLHufDHssSvdOZzyifIs4tgTumgmwdT2d3nvADeOR9frSU8oeSHOxMKw80w/KC6DIyKgfkRZyt2bUq+cJhBDSoyel0te1slq4CpDuXL+hn9HCEHWg6RMFj1IUA/rYcC1i9CEltIHC8b7D6iWblEIK/Su/HAp3VLVmaFj/ETbKnndchT5JPuBm6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jkJ1zENHaZF9JmrWgb7FrCKMpapYa2m8dKZu+vlkgw=;
 b=sLzz/f6bDdaS1k9DBEu1qOAs2dTEli/+sp46hDxGVVsxxWUE/OXpWcum50y8SGyEDN4yN3gu9utqWluTMHqxGRyQAVw4AwbRFGtR9qImNK3s75/N7wutwTYAbmVamaVcVm8VFm/0553H0aE+cACzvHi3IZpzEmlAl/Pv8yqvsamJHO1u6dOTOZP2zH6AQOi4Mv/WWk7bWFtvGoxBvscOETIjZuVbbAgknZsRrn9xOBg0Tlw79eqPvO/qG4GYud3DxIorvCTZRGT6PQPIv4KqwfL/V1hhqkuE2YpBsSfdGDLvY0HpEFo3/gt873QXkyRoTIaUPjAbuNH5j2HmBNreCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 07:52:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 07:52:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 16:52:02 +0900
Message-Id: <DAON8H30Y6VO.2WKLGX2Q9DORU@nvidia.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>
Subject: Re: [PATCH] Various improvements on clock abstractions
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "onur-ozkan" <work@onurozkan.dev>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250616200103.24245-1-work@onurozkan.dev>
In-Reply-To: <20250616200103.24245-1-work@onurozkan.dev>
X-ClientProxiedBy: TY1PR01CA0184.jpnprd01.prod.outlook.com (2603:1096:403::14)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 279d734f-2b14-45ab-80cf-08ddad73da8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU9OL1Z3ekhad1B2QWFBQWx2aWgxVVFMbmZtNVU5MTRXaHM5V0tFcnoyWENk?=
 =?utf-8?B?UGowVk4xSS9BaEpEUUJUTEFWVkNrcTdPS2lEZmo5ZDFYeTVNTnBMM2IxdXp4?=
 =?utf-8?B?MjRHS3FTZWlQSTAwSFoyWjNFZS8vc2UzYzlWNFRkUjhxVWEwSTNZUkRabGUw?=
 =?utf-8?B?dU4zbWQ1RkdZSU5nR0pmOFFzcFJvbytBV1p0VUdIay9NTENhdkhablJ1STZx?=
 =?utf-8?B?ajh4QUpzemJiWUhTYUhtS0tXTytKajhkZEg4SFR5dDlHcEtpS2ZDMjRJbUJl?=
 =?utf-8?B?WWRMczRlVnRpR3c4M2x2ZnE3MERkWlZhZE4wWVNNL3ZWTVpVOERqVUh6eHM4?=
 =?utf-8?B?dzZ5R0huNE1WdVk4dHFabUZ6TWQxTE9UY2trYzlITjdraWRyOXk3ZkdwOGIr?=
 =?utf-8?B?QjRKZG9IVVErZDFCY1RZWHdvU2RpY1d1cVplUGNQRlhsZnQ5b2ExdFl5dlFI?=
 =?utf-8?B?N0Z3a0E3TXpkdWpDNFMrUlFFakpWNFRQZFRzK2EyZEVrdHh1eTNkZzI4SGFr?=
 =?utf-8?B?ZXVib0lvdmxxdGZnZWNwMG9pb3k4eWc5RzY4YVdvMjJFc2pWSDJmL0dPdHlr?=
 =?utf-8?B?MW1LQysvY1VsZ1JQd0MrNWNBRUV3UWZoNkt1S0xFdzM5YUtkbFVGbk0xcjNk?=
 =?utf-8?B?MTVud240NjRWVkhRaVpycS9wREhGb2JDYkJYS0ExdlVIRkJ4VkJYc2NPenI0?=
 =?utf-8?B?WlhjNW9vcGlaZEVXdmZXaEQvbkVaUVNwNHA3RXcxeUl2NzRrZWJOMEdHNmtM?=
 =?utf-8?B?aWJkekZBN0NWMFliSlZQZFJLV2tHTS90bHAxNVd6S092VVhHTlZYejI3UUdU?=
 =?utf-8?B?ZWRYT2NFSzNKVGs4WkhGYVFPYXk1YTY5VGlDSkNHRVROWU81MllBMDhiTGd0?=
 =?utf-8?B?TWJka0FLY3hkdzAvU01BR2dsK3R4RHRqM3NPU2EwYmRqeTBZS3lBOG5FUURD?=
 =?utf-8?B?cEZMRXNSUklWb3Z1TlJERllIbjR0OWFZNVpya1NVdEhFS2Y5NHZNQXg4dWE0?=
 =?utf-8?B?LzNDZ0RoUXE3Vm5uV0JXbWtrY21xYnZoMDJ3UVk2TGF0RHhwOVdmaXhOcnVJ?=
 =?utf-8?B?VnJUWEJlVXpkazJVZ3N5cEZuaDJQMHpVSjNuZzZ1R0kxb1Q3UWF0Y1M1Nlpw?=
 =?utf-8?B?c2NVeVN5R2F4M3IwN0hYdmhWMkppQTZvbTZOTkdpVlBmNmNJM2hkakJZbEpp?=
 =?utf-8?B?SG9jNTQ1Uzh5L1I1aVp5WWx5a2laYXpyajAvWm1nRWJyR0FsK0pPODRaWE9q?=
 =?utf-8?B?VU4yeE54SEEwTTBhQXRyckRXVHM4WjZ5TVJTMXQxVVRCVWxNUzZtNGlXRFBE?=
 =?utf-8?B?N21kWHgyQmJWbUtVelZGQm5CNW9UTng0QkpNZE9rVXBkS0ZZUnpna0MvZEJ5?=
 =?utf-8?B?QjQ0VG5ycCswdWtWNUVhSUlJNzVMU0ovcmc4bi9kS052RGJDZXFrcXlMUWhD?=
 =?utf-8?B?VmdIbkVzT1czMHZEL1FmMHZOdzRtakhkbng5UHprVklKbXcyQ0lxM2hWWncz?=
 =?utf-8?B?SkJoUEdFVGd0RVRrc3NmTG5vT0pqN1ZzNWRzaVNmcTAxQnhQRXpWR1ZwR2wy?=
 =?utf-8?B?cmZLbGdJenJTRVhVOXhvRGJ1MktBeVR2eG5aL0Rpd29mS3dYWXJRYWRKVzho?=
 =?utf-8?B?d3hUMGRvWkovQ2tSMEJMVzZSQ0dkTUFqT05GcWNqc3d2Sk1SaWx4WlFhcnNC?=
 =?utf-8?B?NWVTbktWb0J6Q3FYdnJsdzRjeGM3UjBDbklMRitKUUNKc2l3R2NRaXoxZ1RQ?=
 =?utf-8?B?L2ppb1p2N2YrU3ZuaWhSMkhtNUtiV3lNdzJCTmorTnVhVEFTcWMxMG5tWEpZ?=
 =?utf-8?B?WlNINmtibmRCTVVycnVuSzIza3R4NWMzQXV0dWw4K0xhZ1FLR3ZWUy9MVGRr?=
 =?utf-8?B?QkNodUQvaUtoMmYzUEQzU2xCRHExSnZuYmdsSFRMUkhsdEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE5NakxsL3hEcXI1d1dlTkxIUnU2VEtTV3BxcGIvUTBwZW00Y2VSQisrbThF?=
 =?utf-8?B?NEZybXhoTWk4eldlMmYwVERxcXF4L21PL0k4WncxaFlMSU8yWDhqaEpteXcr?=
 =?utf-8?B?MFVwRHFBQmh1bUh0a3dicVBxNEZRQWQwK0I2SzNrTk1FQURwZjZWY3JtM29a?=
 =?utf-8?B?eDdCc3dOdHV6a2wzSC9GemlQZWcxdWR6UHVobDE2bWNiK2JndlZRYzdzRGJi?=
 =?utf-8?B?T2FpczhPTGticVJRVjVVYUFXejBkNkhwSFpsN0E2bEZSd0hMNmdOQjhTdXlD?=
 =?utf-8?B?MG9SQk82Q1pxRlJLSmF6V2lvZUlFN3NZRzVvUzdxb1kwOVdGcXA2aFI0Zk9L?=
 =?utf-8?B?TW5qNlVjNXpnTGJBb1dDaTNsTEVrOFdiM1haUERHNHNNSndBTytwV3l6MDFL?=
 =?utf-8?B?dWdBcnhIdm15RzRVekpxNXNXWkxEMUo5Um1pZmVNQ25lMCttUUFrT3RXRk9P?=
 =?utf-8?B?THg2NzVWVjdaM1AwcWtHRGlvT0N3MWRENEI1Y2h2VmN5N2lFaUk3N1NPWHM3?=
 =?utf-8?B?TCt0U3JvVmVkQXNYWDkxY2g5dWYzTzN4M1B0U28vZ0hKOVpsbStkOU9KbU9O?=
 =?utf-8?B?TWpLR09sWmRLTEpqbXk1dDJxUXY2d3E2cHkxUGpTRzhZUC9VdDEyWXFVRTFO?=
 =?utf-8?B?N1hFU3llNXVVak1MQ3JCcm5uY0xaNzRCV2FoQzZ0ZSs4Tk82aHMxTWZpYVNO?=
 =?utf-8?B?MG15a2craDB4YVd6NjhEQVNuL1hUcEppQ0RRSWRERWxNOGt5b0c1Y0d2NVZC?=
 =?utf-8?B?NU5WL2c3U01oSngxRk9TVVI4VU9JalhEYm5vQ0FhZnBBNE4wWFdyaUFrcDQx?=
 =?utf-8?B?K09TektIa2tMRFVocmVldHoxL2lpNW12Z0NFMFJMRHZ3M2Q3cmgzcmR6L203?=
 =?utf-8?B?QVB6VGRMdzg3dkhaTkxWdmQyRmlrMlErNWRMNUMzYmRIVGxDaE04bEx4eTFt?=
 =?utf-8?B?aGRPZ2VYakYvb3JLcUlZNklTcnlBU0JNakRCaGZkV2tHdWtMU1NvMVZZNEhX?=
 =?utf-8?B?dlFLa1IxWUtSaTZNK3NOUTFaMjE3Q3R2bTdRS01GQ01yYXNuaHpuaDlKQ0tP?=
 =?utf-8?B?RUJlOExNSkJvOTZzWTF4L2FvNzJDRWR0TDVMUFBLZkRWNlFiMXRsV296d1cx?=
 =?utf-8?B?Umt5UTFhRUtOQUNMaGVzMFIxTXR2bU1FMTFaYml5c1dua05pQVdlNXloaThP?=
 =?utf-8?B?SFZtS1JYM2QxNmh1VXdpK0o4WHVQSXhpa3BpVHdKNGEybkg4MVNFZUtVSE5F?=
 =?utf-8?B?cmpjOGQ3bzJiKzNuNHNocWdqb3F5RzZTU0ZYZG05R3NQZnlPV3luVnlKMTJB?=
 =?utf-8?B?Z1g5N1RmNnZHek1Ham9aU2RLU1hzM1ppWTNVYWJHVzNhcnZXNExmUGtqWFdY?=
 =?utf-8?B?VTMvd3ZiWi9jL1MyZTFTeW1EckE1WlBFNDJkY1VRQVIzU0xlOU5jMmN6RUZq?=
 =?utf-8?B?dW4yUnhVT1lLaldTd2JiRGZYb3I0TUVhRWtLWmNMVXRSTlVreFV2QzFSQWVH?=
 =?utf-8?B?czZmU3djZ0FrL0cxMnMrcGRjb2RQRHZUak1mbVg4WkNZMXZkS2lBdmJBbmFh?=
 =?utf-8?B?RVZDc2pJdGtlRG4xSnhUMkhHN3Fpem1ONVhvLzVIeFNuNGJ5cStzQWJhNEVs?=
 =?utf-8?B?UEtSemQ0cGFqbFRvYzdSbHlQZ0FzS1VrK0RweE02aXFVSURaeXBoM2ZnTTZl?=
 =?utf-8?B?NklrcnlKNGRCTG4wVDV1N3NyRE9qemIvTFlqNHc3L3VIUVlkejdvNGtncmJr?=
 =?utf-8?B?WHZvZGhhZXpta2lZNmc1MW1lT2xhTjh2djcyRUdwaDZQdWFvd2ExdkIwcVBx?=
 =?utf-8?B?czhISCtQTVNvTEJqTHV4L2RlUWJDcml2WC90alB2b2Z3TmhTMUlSelNoYXNI?=
 =?utf-8?B?MWZzWWNId0NEWXFGS3ArZk51NmVTd3dNejVXVk9uS1ZZRVdiZVFRN0FWSy9w?=
 =?utf-8?B?WlExT0wvTlE0ZUNsNEpwa2ZaOStNbGN5QTZPME9sNDhiREVEZXJsMEg5N1VR?=
 =?utf-8?B?ZVUyOWlVVFdacHhXd3FyOUY3TG1FcGhyL3FzcWZsYlFFdzd4WitMMzc5b0ZO?=
 =?utf-8?B?UzJ3aUNOVExNeFRQYk5YNTBrMzhlZmU0RWNjQ2diRUk0aWtLSGxseHh5RDgv?=
 =?utf-8?B?ZHQ2ZmhXZ2JnTTRIUWQ4cUhQRElmV04xRGJrMWFQdzVUakhaQ1kxc0ZveVZC?=
 =?utf-8?Q?0rShzw0IytYPRQWbX9ie2zbLh+WdEAwp0mTt0QPKZK0S?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279d734f-2b14-45ab-80cf-08ddad73da8e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:52:06.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2g7Y1g3z6yEMKYFpdRTKhxMNZImkHew/PJI/zGIOi9bbY8caPZGNw8Nhi+tjQlXUqki3Y/WD6c+FeqS/REjdZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864

On Tue Jun 17, 2025 at 5:01 AM JST, onur-ozkan wrote:
> A few changes to improve the clock abstractions and make them a little
> more idiomatic:
>
> 1. `impl Hertz` functions are now constant and compile-time evaluable.
> 2. `Hertz` conversions are now done with constant variables, which should

"constant variable" is an oxymoron. :) I think you just want to say
"constant" here.

>     make them more readable.
> 3. `con_id` is handled in a single line using `map_or` instead of using
>     nested if-else blocks.

Please split these 3 changes into 3 patches, I agree that they are
trivial but a patch should do a single thing. This makes review simpler
and allows to apply only part of the changes if e.g. one of them needs
further discussion or is rejected.

The changes in themselves look good though!

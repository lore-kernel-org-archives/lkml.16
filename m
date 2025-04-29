Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A3225F963;
	Tue, 29 Apr 2025 20:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958932; cv=fail; b=i0FqlvrLgXH7BQcC5mekERZwT3W/GNlpxGnOXf5vi/s9uDnvKdzSinGg00AmDRGbclNn08CBDIuDua8KAuVX2SQAcTXCmcFDZgbMwZQU6P0r6abzUKPSnwD3xMj48bCBy1SgxV8q6EcaDgrnq2IHDLSt5NZkh+iKQsSHzGd3/pA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958932; c=relaxed/simple;
	bh=WIVlJgkktbMm8Ff6Ut8HmKPXC8RoyDo5gmpg8ceaXgw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VM3rKEN0vkwyAvfHIJDXzx5ip3mLYalgc7v9Dj/8flVUmcz8mBR+IdHZKppeXJwPhU87Zp0zpBdeVvAKjfRCBEFgtAMwPp1mX1dl93J4vkWLUvfckU8CcpfmlZU6iRH/0IMwmns8X0aoRP3EFTUX5Al8q5ayeKjSOEZvd8QzUfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SMnUqoGI; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SMnUqoGI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+RdG0XNwwMCCdT83FnZ7CJY+btjeC0YuADHcBeG7JpoB6bB7vv6xDrb06oUWnk4L1zKDxnQQS+sAzoC4aSwgM0guB/PSAhIiJ7IsskZXsIRuQe4Zx7ZFDZN7DVkQu7Px1GvMzVeW3Zh5BblUrmGCW8wbQ/82rSTCzCLph75DFGZ+o7ft38UgqmTyeaunyi+34AnSWPhjjqb+VliZlVoIjmoXjSzFsR3Q4ittqTqGfQNwTL4TlcsVsRobcsxJ0Xo5EsSilp7qpWzOEfDjTZZgYkd3rYWKa1QZzYYeMT2wFUJ1CPGbzgDHyxqLibC2Q3fZy+ui6RE+oust2clymtLMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8bGI1GoJ3OUzt1MYKi46sOSLCvcaPKasAKi5yOb/A4=;
 b=yQ+J/RhQM/QlvtuE6WlLEZNYV6YY7KKWG3XwOIsMpsb9Et2XZH4fUuR8WuFyHxjxPWrbv6/lzp/UUuoIXC4uFTcYRmhLnBDWvX16NgqyZ2wpkp/qPmFnd9ZQplijwXHi9VphestemlY9H2eheUoAQECNskwuW7N/HTskkNhno6zyDJkOsl6NsD7BeL9GhqZ8PbQOnuEfS5X8EOakD+LKSkz6sD2q8rbRcftmTc0J76JTdEJWoZSCAt/wMw/xOd/ieh0T+KL0aJnQtSEY2fsTwW73cXrFZRh+AMTc2/BUO2zxex0u7VdidIHQQWQ7zQA5/qztJuZ1V6Dagh4aKH1oRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8bGI1GoJ3OUzt1MYKi46sOSLCvcaPKasAKi5yOb/A4=;
 b=SMnUqoGIh72Ec3QF9fiJ1DhTR4w2NGpdzh4hGxMIUhLX/EVUc7SnH42gtSOB02npzjv6EEMpjbfTOTIvmev/EBVxoLHihVIheOCyU5Ypw7ONp25cuYgpkDGUWnaCCsqrIRMQrzxbkTvb95UXaAgv7fKb1vZZh/95VQjHFe3nSEMBS9vs7WFG5+BTn1V0C27kEAZflEulEZRUDIH2l3mZb+FY6yxr8HC2ED3tQ0e5t6cK30oU9fLZACq+TSyjnE1eJmFHfg6ccFhVP/wCN32QjsfnDtY/aZw12SktWp41X4cMDsQT/MmuxMJEysFIyyceAPTQWItFxrBEYbOGAq0KAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 20:35:23 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 20:35:23 +0000
Message-ID: <c30392e2-f0c0-458b-8b14-81661f83c67c@nvidia.com>
Date: Tue, 29 Apr 2025 13:35:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
 <34457c78-fdcd-4f1b-a349-4ca9bcc2febc@nvidia.com>
 <aA9M8_K0MQfWg52t@google.com>
 <509c3fb5-310a-43ab-ab84-75207e0c577e@nvidia.com>
 <aBCLxR36AQ7oZYn4@google.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aBCLxR36AQ7oZYn4@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH8PR12MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 60534192-fc4f-4ee2-a32f-08dd875d5d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGtVZTMzR1EwUVhVSDJXSThrcUo5UFU2QVhIRzZyT1lFZ0p6S1hGa3JrUWV4?=
 =?utf-8?B?N0ZQMDhkMjVuYTFwcUxHSVhrZ0tRN1NUZGJOenJiTHhqT2RMRWxlQnpXYVpL?=
 =?utf-8?B?MlRLYjYyQ24rTEpLU0twWVpEYlh3b3d1ZGJWUWJpUE5zczBuWDR6U2tSaTVu?=
 =?utf-8?B?TWt1NDRyRVdIK0J6cEZMcVYzTVJRYlBlMitFSkVENEx0VXphbmlrVGFYOGRY?=
 =?utf-8?B?cS9ZZEc3dldEOXEyUGFCcVJwYURiRjNieUhNMWNaQ2U4bDRCM1dqVHZ4bVRY?=
 =?utf-8?B?VXFIUVQxNEU4YVRQN1YrQWROMlpTTEdoMmdWZUpPc0FOVUxSUjdsdWdGM3Fs?=
 =?utf-8?B?NG5NTEdtTE1lWDE4ZHZscGs5TzZKTVlMK3VuOStPaGVoZ2dTbWxBYWVsV0JM?=
 =?utf-8?B?Z2pyb3lXdzRGalkvYzE1eENzd29SM2ZDdGIzWTNoT3BoU2N5Ny9rY0pVODdw?=
 =?utf-8?B?KzRYOTR5NXdxV3VFZ0o4Uk0xRGRNQy8vRit1N3UwQkREV1pFNHRsRm9vZHdD?=
 =?utf-8?B?aHdlSlJVSlovZnFxS24zVmxPb2crYW40TjBHbmZPTmhrZEJWMHQzNTJ1cVJw?=
 =?utf-8?B?dVZsK0RmU0p2elVHeUpScGFQTjh4a3Bmb0NOSi9BalhzMjJ3aVZXaEt0eDFZ?=
 =?utf-8?B?QVdxYThhTnVZZnBEZDMxWnpBZzNDcTNxeHk3eG9qSjQwbHFZZGl0MnMrQ2FN?=
 =?utf-8?B?Y2gzQWJvVStPUkg1b2ZoRXQvSCtMME1XbW1lUU56V1dVWGl6cU5KbTVVN3I0?=
 =?utf-8?B?S0tyaTlaSFlhcWYzL3VNUmtRR3k5RGErQjg0NlFrNXZQSXNvdm9zVU1sbjk2?=
 =?utf-8?B?Ym50TzNBQ0hlOUxQMnNUalhoMWFQYTN6dldja2Y3aE94djhHbDdtSlVrQ21u?=
 =?utf-8?B?QVo3eER2ajViSnkvYlBveVdPd1NQaDY1cFB2SktLZi9CU0c4QzJrR3ZUUmE0?=
 =?utf-8?B?V1dLcUlNbjFFbHUwN0FabUlIVFZuY0FSZEdGcVk0bmlNdjc3SjFleGRaaGp4?=
 =?utf-8?B?Rmc2bnZ6UE1tNkpsQUZCcnBGeVQ4NGljWlBqVU0zdXJVMFVBSW9YcVhNV2hi?=
 =?utf-8?B?MDN4M21uclp6cVAzUncvdWZTcEk2bC8zVDJXZVBuQUJONGJPeGxuZUJ2S2Vw?=
 =?utf-8?B?MWM0dFhCcUtWUkNMMzByMW1IMW5RY2dCaTJkUytjUXg2ZjRKTHdTRm9YUEJC?=
 =?utf-8?B?YzFmdE4zeTlGeDl5NTloR0I1TmRSOVZ6MU1iU2dvTDlUYUlQaUdpMDl5b21v?=
 =?utf-8?B?S1d0ZEJUNkZ2dlNWZVpQTTZORXVjdW5RVkd0bVlic0NpRWgxTUpuQlh3V3Vk?=
 =?utf-8?B?ZGNMbHNUUC9uajMxY3lsQ2pUd25pVWFBaU1Lc3ZaUmsvRERmK2JXOEQ3ZTZK?=
 =?utf-8?B?Njg2RS9KeUd3VTFGVjFiRzdGL3QrWEpiUEZCZmlwdUpFQUVYdnhDcEdqbU5W?=
 =?utf-8?B?QmVQanl2ZS9JdndCaVN4MjY2SEI1VHR5bFJSRWwzalBJT08xU0N6eklEM1oz?=
 =?utf-8?B?MU1SZnV4QnFpaWhCdTRDODF2Z2RzeFVZdUc1ang4dlMyWDlVNkNPYXUvNHgv?=
 =?utf-8?B?Q3lLUVRQQUFzM2JUaUgwSjRmRUg0VyszN1o4aUgraGVxUmZSdFJJZURxelIx?=
 =?utf-8?B?aTNERU16S3pyQ0VldVJvMUFmM1JEL3IxbWNlczNwcmJuaWozWUMwT0Y4cjRX?=
 =?utf-8?B?UTFaRXU5ejBOUnRudGo3V2N4a0g3aWluRXRFRTAySHM0MHNOWXFrR0VjaCt2?=
 =?utf-8?B?RmEyVVdpVmVDZ3Zwa1VqL3ZZcjkzM0V2YXRmc3VHSGxRSjdGTVZlL2NBQTZm?=
 =?utf-8?B?MmRSV2ZZMzZIVVhRVFN6ZEFkM3V1MGs5emNOVVJlb0Jzb2VMRjBSMEgwS3pS?=
 =?utf-8?B?azlYLy9GemhOKzExZ3J2cTdNcTF2QnJMQlR0NlEzTmNzcXZ4VVNlcEpjb0xO?=
 =?utf-8?Q?F4D2fXAB55E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REhqV0gxZ2MwSVdDSmp6SVR2aEkrOEVOaUpRVWZhbGYyYzMzL3pzaWdQdXNt?=
 =?utf-8?B?TFJWTW9LQlZvbjRLSDU4WjVBZmFqVVhXNzBFa3BBVGY4L1QvSnFKQUNSbmNk?=
 =?utf-8?B?ZGFwWE9DTGVKMFg5V1F0elJvN1FxTEIwWmptYzRzTkp4a3JmaEVVeldHZXJO?=
 =?utf-8?B?TkgzeG1oUm5vUHBzeUtlRnFJT3NEbktlb2s1aUt0TXROZ04wQXF4SmgzZ0Ji?=
 =?utf-8?B?UEFQQ1pMeUlyMW1PRHlWR0VCZkJDQjh3dCtIcGgyLzFtQVZZaDI2OUNadEF2?=
 =?utf-8?B?U1BoOCtqckRySTd4OEcrYTY3TXUrZjJhQjFXVGplbFFWY2VYVURmdXFNQjNs?=
 =?utf-8?B?eFh1dUFLMCtUbTIyOU96TUd4QVhSUUJjR0tYQXFZaEhmbEt5eWNoL3l5aWl5?=
 =?utf-8?B?dUwwMEdjRlE0bkRzMEFINUpySUNyemNnaUs5KzRDejJoZHRoeEJZdWczczFI?=
 =?utf-8?B?Tk1TUXpyY2FGRXBpSVZScEJZR3UwTlVNSjQzSEtIUnBkM213U0FPUFZUcVg2?=
 =?utf-8?B?dHhmQ2d3U0RDMEpWQ1I1ZndsSG04ckRXbXVpK1JHczZCekp0c3FjaEhHRnRt?=
 =?utf-8?B?MVpTcytsV3htUHZDSFo3bG9QaVZMcXJqU2NyWlBPYVpsMGRSaEY1U29iZ3hx?=
 =?utf-8?B?aDBtUDZRVWNqRlhhYXZBKzNpbzAzU1pEK0s0ZCtYY3VBbFR0cDZuRzdWc0Ja?=
 =?utf-8?B?NFVocjIzbmd4cERhSkJyVnk3WllmR1FvNkNWZ2t0TVZPLzVDeXQvMmdHMlR6?=
 =?utf-8?B?VDFwQ1lqT3VpSUl6Y2JNeFVHWXRBRkxWaGdCVk1CK1Rxamd6Z215NjUvUTZw?=
 =?utf-8?B?bXNGaTFqZENRbjNaekRXUnBqRXVMNXZzcllna1JwSzZOVzE2YzhNSHNiMFJC?=
 =?utf-8?B?akh3bW9zS3kwdWxLS000a05SR2xjYWhkdGNHTmdJbGhXNWJzbFkrZm13MFAy?=
 =?utf-8?B?S0M3UzhPcGdmeVM0V3NJQzk1VzZKdXFzTlpQMG5CNjg0ZzBFV2d1aGNKTldo?=
 =?utf-8?B?RUZSdHVjL3d0aXF3QjMwOE4wcmh4WE0xOEhOU1gveFZ0WUYwdTZsYzJ6UTZv?=
 =?utf-8?B?VjVJR203WW1BQk1xYzh6U2VQMVRVYWJuT1o0dWNRZlM2Yk5BZ0w1MHRGeG10?=
 =?utf-8?B?Z1oyang1ZjVqRitJS29QS0psbTk4RUFSQXlMT0hQYUUxM2IwRmNyM2J1UGZi?=
 =?utf-8?B?UWlwOVNlTno4ckVyampURDhNQTlUZy9uMlVCcC9VdXI2ZTRJbFlhRUN4dW1m?=
 =?utf-8?B?ZE4yYW05Mk5lNjd6MkZuZDV5THN5RDVuZEd4RE1EaHZBSUV6T2Q5TzhMQllC?=
 =?utf-8?B?b1VoV2ZqZVIxUSsrM1VST2hnVklhU1Z1UTdyT29CRDVVd0J5Z2ZDQTZDSGhn?=
 =?utf-8?B?SGFvQ0xEOGExRUMzVm1QL0FNSk1LaHNIK3dveThDTjkxMzlxYVJJSytrYXZG?=
 =?utf-8?B?QVVRbHdJYjNTTUU4Zkg0UkxHRjJiSWpNZmsrbkNwVENvYkxGaVYzU2xCWnl1?=
 =?utf-8?B?ZktlYXZmL0FDNFArcjZQSGVQT2ZUdk5ESS9KN1FzL1NyUTk4bUYvYzNDcjFo?=
 =?utf-8?B?enNnQkhPQnBCQ05URVY3L2ZxY0lvMmtSYXFsZGNSY3ZSa2ovZzcvUlZmYkhY?=
 =?utf-8?B?ejM5RTEvSmh4NFl4TzkwcHVBZytSaXd4bHEwbFpXcHNqSStndnBFbVpQVUJF?=
 =?utf-8?B?ekE4U1VNMXVHMlduN1R6VEVhR3pKMzJxcUgyR0FBMkNSQndHUjdlaVVEczFr?=
 =?utf-8?B?eUtBQ3hxVklhSkJMeHZYRjlEVHg1dEJoT2FpQTVKK2ZZNWdseXBWQngyUkw4?=
 =?utf-8?B?cERiMVlxYjlFbVRXZldxd0pSU0dCUUhDenV5dlphemJVUmg2VUVVMzdxci9J?=
 =?utf-8?B?QzltdkhseGJzemZoeHRXNU5pZ2tocHVmcm5lcmFHME1IQkNERktIdzllb2tk?=
 =?utf-8?B?S2dXYWtHVE1ZVmd1em1sZUZSYlJyL0xRYWlPbmRrck5KSHlETWNpWE03R05k?=
 =?utf-8?B?T2NYS1ArQ0pIMTBDb2RmT1M0MDNCREFMRVA5UEdRbWFJRk5ndXBLbzhQWTNX?=
 =?utf-8?B?dUhRVmw1d3BzSjFEUDBZRVRpVmRmNDAvOTY2Sy9ubU1xeHdxd0xkL3NDOUtm?=
 =?utf-8?Q?agga/1gkoHyASiaHrIAH0PxGl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60534192-fc4f-4ee2-a32f-08dd875d5d93
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 20:35:22.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRXAhi2w+Si+22qFnPZdbsu6MF6D4ZfOxNQVJWUk8Nq3DxnThbuQRO3Y2CAlMIDQBVu/5q4TmtGdA94Wx1ImzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842

On 4/29/25 1:20 AM, Alice Ryhl wrote:
> On Mon, Apr 28, 2025 at 12:54:19PM -0700, John Hubbard wrote:
...
>>> The `if false` branch is used to trigger a compilation failure when the
>>> macro is used incorrectly. The intent is that the compiler should
>>> optimize it out. I don't think there's anything wrong with that pattern.
>>
>> OK...probably best to either encapsulate that, or at least comment
>> it. I'm accustomed to seeing that pattern in cases where people
>> expected the code to *not* get optimized out, so it triggers me. :)
> 
> Okay ... why exactly would people do that? I can't imagine what purpose
> that would serve.
> 

lol I know, right? Two things, neither of which gives me joy to recall:

a) Configuration games, in which the dead code is available as an
   option that is not configured right now.

b) Binary patching games, sort of the same as above.

And at a slightly higher level, my concern is that when one reads
code like "if false", it sets off "omg, someone is either confused
or doing something questionable...actually, why choose? Probably
both." :)


thanks,
-- 
John Hubbard


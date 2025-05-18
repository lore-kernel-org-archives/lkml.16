Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BE8C2C6;
	Sun, 18 May 2025 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747557037; cv=fail; b=CKfjyYPKWN8X/8kzaO8nf6/PxXq1ao0Uj3BAdPopIpll3i+vAv9wSyaxRyKLBeASCiLbBjUcxMyIHvEgbK3rfT/1t/VQcgjDQA6rdp/MyPIJf0W1aizqflcAzQv1u5m/eWliav1ChRXAfco7Fjzpqa7JP1ESv/P8s+n1oQEDW40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747557037; c=relaxed/simple;
	bh=GKac9OgXIr3IXnL+cr/uzO4achfyWyp9ZKXoDtd8zZg=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=KEkRrSMp+KPJhwbLfobU+0esuxRJB+7uU0nuwsxaFjVOHiPutKoXginpVJ1LNwh3CKYuMQ1Ebo4KK1nC86Hrwi7PbHCx7HvVfrZIMwAJphKFZjZNQQaDcdK7f0/49xQW7MWnT705wnJMjPseTzOp3xuE0JTm2LHhFNzhypgwiiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q8T8hluh; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q8T8hluh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6CCSMafVs5wO8yFWfs3Dz499OdfZoTjNAhnKrcH61gdd/t5/hMRhUJT7hhkYPZ7lU8sPt3GPBQclmORZhGjO/o18WbdFnnq6VGa3LhKSCzTrEb3zMz4/1DqWHtHCnvhSqpDnnd0xJyiuhb91CDLFmsqPyJ/vK92mVfPamWD/A35ZmiUJqAivzNlEoEuAN2JTctRTbeejtMxAkdqPJy1zG1n9ED6vZHnUpzFTOEMPUfIGaRh8y1ZYUVMggOiJM4DgUTnqJI/sAmChPriT9ERcPtzgQkDmjsRQXSFHKrskoPaIGicwvlaW+U01vmyRKs1tFHB3m/QNOqJILPmjdJmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKeLXrCaaZbb3l+JdsPQpKQvHrNS+MhD9pW6P2eWFyA=;
 b=BJJIHmbsR4WfOgDRNWVonNdwbWZhfm61quuSGMuspMr9lmh674g8Fj+uvVksOPcoHV4Goq0TjLpq8vnZy/hak/Uogbk7Isph8YL8u5qFYortw1rORcmWf4qAo45pxi591ZP5M1w6WrBRFkW33KjlBvSuyhd1TVJ/EfhNHzWqQLAhr7VI0jVRqEaWHzKaBXi5ug7+jcZLmPtNvZlPa1PuNl463BHq2uF9BXuTxaCFXI7OtzTcSE24nkoM4rj3iKOaNSOOEa7WcAeT1Cer+PLHqqSdVc4hyjJvEF0YaHztYNF3++OvXCkmN9EvyEUEa+1XpGEP5pPymKRuKxlAQSlB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKeLXrCaaZbb3l+JdsPQpKQvHrNS+MhD9pW6P2eWFyA=;
 b=Q8T8hluhiAKV5JR+XGxS4GDGZTghiGCxPJU1TzUjqmgQ8SS2PVn+MLFDA1NVot7KHZJv0nLZ3+TUtH+HzJ9bRyB0AHkjY8xqx+Od71PjfefXRvcoV2WfCPYN+nXVB7Yw5l8uJKRg2nZCWT+0GekPtizeoXvk7HFz3xmBtGrb1DRLPQJdKs1gbONt6RDoVz8b3kWvaiEhEwFuURhYlmIoGAaGjsm2FQtfhqHv3ZpFWkF6P5WpTgGMr+/Pjd0brUP49Ed0AiunDZ6Hm2WvJFyRZ4EzOuToal4+/nDXNFPmj+aw3kkXudMnGC10G0csonKB4Yr2sOzGkvRJfCjSfMqFnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sun, 18 May
 2025 08:30:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 08:30:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 17:30:28 +0900
Message-Id: <D9Z59JWL4BTC.3DTN0LWCJX5AZ@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
In-Reply-To: <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
X-ClientProxiedBy: TYCP286CA0275.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: ed84ef7c-eb32-4088-d119-08dd95e64092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmVrWlMvOVVCUzQvZXk1UnZ3aUZGMEVINjRYRjFPd3NFcDJCTE9RL2tUdGxD?=
 =?utf-8?B?SUFqSEZNcE53TVJBVFlNL1lYWGF5QXFoS21za3ZBczd3VDV6SUtYL1paazZn?=
 =?utf-8?B?ODVIUFZ2M0FsZzVHR0Qvb3dXOUo0TDhpdVdSa1AzRjEzUGtqaTR1VS9wVG9t?=
 =?utf-8?B?NTBLYUZ2UmFpTFNkb2xrRG53bGduQzIzK2w5THBHbytHdHorRTVtUXBsS2Np?=
 =?utf-8?B?VzF1a1BraGQ2V2I3ZG1hOXZIaUtXdncyMC96K3ZDRVowWlc0QUJPbXNnUnho?=
 =?utf-8?B?Ynplc29kTE9sR1JuSFl3WFJ5R1BIZzZTNXpmSFpHckpPcVRsQ0tNVEVub3Y2?=
 =?utf-8?B?RkIvOU0ybldhZXRuVmdObFhiS3J2c1NoK1k5TGZTSG56ZUpucUxuUGtRbXp6?=
 =?utf-8?B?UE56Q2lxNVJIci9IZGwyWTlVV2syTTc1WjVocUdWdzAwWFZvcVArdEFwMGVq?=
 =?utf-8?B?QjZnSDRVU0tJWDY2Zi8wYUtidmNHT0w4NGo2TGlRbU51OXpBYU5vNElYUE45?=
 =?utf-8?B?bC9WM3BJcGJYdE0rN25nN3J1WDExQkVnSFM1TVl3UGVRcjRQK3h2YVY0NVpo?=
 =?utf-8?B?K2hRNitjUHNobkJ4VTdlRkZHRUg5eGpxTTI4b0YyUDVpbHVKcFlScXRhQnVM?=
 =?utf-8?B?cEtiRDhSUmgySStKekMxWU1OSHIrWk12cGthejAvVlVSMXhabVJnTzh6V0xh?=
 =?utf-8?B?RFl6K2k4QTFNWXZTa1YrYUIvaUxwVXVKREx3cnJtMWxFbTA3dUVBWFRxeG9H?=
 =?utf-8?B?S2VhaFBVeW5OdzJoOGRoL3FGb3gzNWtiOXdQMXA0MnlONTRrcm53VEUvcWMy?=
 =?utf-8?B?YWphWmY1VExiakRTNUJZd1J5dVpTQnloWDViZEVlNVZUVEFRU3NBdFc0ZndW?=
 =?utf-8?B?K3BuS2ZwMGk2Ynh3T2ErOGtMc1RtR0lJVjlDR0pwa25KQ2xCbmovb3pnWkZx?=
 =?utf-8?B?bGx6cjZGYWQ0Rk9ISzVKVjlGWFIrSXdxSW1EYlFFUEI2a3EvNU5CbHhodXVx?=
 =?utf-8?B?c09JT0tOWmFxbllpRU51TEZEZWZsUTd3Zlh4U3pOZkZBR3NLUkJmZldZbjNh?=
 =?utf-8?B?dEFieG5JMHFFTjRsWGQ3bHJsa1N6OEhPWVAyaGprNW14THNHNmQxNEYyaENy?=
 =?utf-8?B?L1ZxaktaMDdESVBBRDB2dkhPYmxTOWNpS05Vam5tSy9jNWE3ampvekhFREtT?=
 =?utf-8?B?WVlzVHNQRlVaeFlRK3dlcnFCNUNuZlJaM21PMDlZaGlMWDVsUEtYUkdwem9y?=
 =?utf-8?B?R2hEamtuL0RKYVh0OG1DMGU3M2VRdjdGTjdRV3ZuTGZ1ckJ0NGc1QjJ4a1dC?=
 =?utf-8?B?cTA0a2hEaEhNa3E2S1FUdEo1WmZqYmF1Z01LY2dVSXJxaWZsYi9DdGg2Zmls?=
 =?utf-8?B?ZUNHWUhCTVRNS2RGY1pkSG15REZwbVU4akNCZ1FkWktSZVN5bTRMT0dJSXZh?=
 =?utf-8?B?WmNkakdhbWpFbXYwMWdHdDVKSng5T0YzQjNuL1lUU0R1NHRzTGhjVzhSVjVo?=
 =?utf-8?B?dlhicG9hYmV1S3RDYjRiT2g0Z2VGdENjdHpFY254Z0MrNFdlM3BLbGltcGU2?=
 =?utf-8?B?YkRXa3dxQm5FTGp0SzJTelNnZ0k5Vk9haGQ1US9QTDY1RGVicVVtazh6Ympq?=
 =?utf-8?B?R3RNalRFam1tQkhFbWtoTHkxZVdaRWVBMzBLNTNmMmlKZDNXZEhLVHZWVHZR?=
 =?utf-8?B?VTRuMXljbEJOMVFoSnE4Qm1XV3ptSGNiYXRpT3RWSlZGR2NJc2RITlpBdzhs?=
 =?utf-8?B?UDlDYjFKS3VXdStXM1FOalpUYmlCaEdIelpsZjVJZSt6TnlaWVd4TFpaQUdF?=
 =?utf-8?B?L1VyclIyWWdMZGE5RXFRSW5DdldRbjdVaEI3d1FSbFJaVWJ4UWFQRnZCaTlG?=
 =?utf-8?B?RnpBME5zakZnMTh3cjM0cElBazdLY1pwbm1BK2dJNWFHTkl6OWlwUjhXSklS?=
 =?utf-8?B?OEQ3dUFCeTRTZGg2bXp6Nnhya0ZGZW9RQUF5dHZpdEZiTll6QnNZZkRTTUhr?=
 =?utf-8?B?Nk9vYm5FemF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0hKbTBkY3B5WlI4aEUwcHdqTmt2QVZBaEEyR0NScXNIcVI1elR6MjNwNzFx?=
 =?utf-8?B?ZExnb1pldWZoSUp4WWI1andQMVBWdms1NC8yUUJHS2hIWnArbjJoRG1pRFd6?=
 =?utf-8?B?ZWptKyt5L3dWcHJFdTFDVEFwbCtRSEJqbytxZGVQS1hnS2FOKzM3eTBOUy9z?=
 =?utf-8?B?UjBIdVhGN2Z0NE5GMHVtSWh4bzVoVGozNlhEMlR2UWdBVGJSZnhVUDRWVGpW?=
 =?utf-8?B?YkVaUmRFRmc3OVRSUk1HTy9GaVBZbXBWSHlJYXBBVStDRGh0TFhxcEViMzMr?=
 =?utf-8?B?d3ZrWlJJZ2xXRHBuWGw3Y3FENXQxZ2sxSHlIQXVoaXRqRmZIYUxHOXZaQlNS?=
 =?utf-8?B?empObmpmUWNQK0hiZ0NxZG5WOUJlbE1xQWR1Z0pKS21pOFBza3BQZXpSS1dP?=
 =?utf-8?B?YnhKSzBQRVcvQlhmZmFRazBUTWJNR1V6Nm5CUnZRby9KemxyUmpQQ1ptMTJl?=
 =?utf-8?B?aUpoQWg2Z3Q0UEVrWUI1dDF2c1FBR1l1MWEwa0xmbWcyS2NJamxJeTE0enpI?=
 =?utf-8?B?UUVPZGpjWlZib1dwTkNGVlp0T0dvZ2ZHVHpDMldhMSszVzlqMkcrU3Z3bk1v?=
 =?utf-8?B?aHg1d2dmUlMxaHB1M1cyREhFWnFXbUR3TnJjV003U1hLUEdERXRVeWhXZllZ?=
 =?utf-8?B?cTNTVVlIbG5FeVFyWk1rMFJkQ21ycVdVL2lDUnY3TkhXWFVwUFNtOHpSU0ZW?=
 =?utf-8?B?NUdyY1JsblpPd2MxdXk3a1dGQVRqcWdlQVhVZVU3N3BUczRRVjJMUDZJL3NK?=
 =?utf-8?B?OERXMUJXV2JmbjdYQXd5R1FxRmFUTmJpR09qN0UrQ3QyTmhxVTJISXIraTgx?=
 =?utf-8?B?Y2VucGh6WWdjaTMvQm1OZFBGdUhCK211bFhEbEFHWW1ua0dFT2FwcEN1NTcy?=
 =?utf-8?B?cWk2bVliR242aWVMbGRIWStTQXljbWxLOXIrNzRJZGpRRzBxWG9OdXovL3Q2?=
 =?utf-8?B?NldwcFpiSURwK0VCd3FZRVA0YzNpd1JxYkNYT0s1TGZrRXlvWUtpbVhtWWs1?=
 =?utf-8?B?WEszdkNBb2hsNmRaaUZQNXdEbTdRTHpqakduN1U3VjNrSCtJY1A4eU5FaHM2?=
 =?utf-8?B?anR5aE5qTlRZSDlSS0VvcTVzc1lma1Zrb0VkaFlDb29OMjg1QVpRYXcyMGlU?=
 =?utf-8?B?YnU0djNSZU1jRGlnNFBvWDduR3l3c0JTZEl2QTB4RjVyYTVhZVRLRmZ5a1Ev?=
 =?utf-8?B?ZmhuRGNEdmo1R05URGxxREtYVlBGcVNvN2cvLzZMZStmbEVJcWJKSDY0Q25n?=
 =?utf-8?B?MlFKMDFHb3BtRFROMGlyZGRLdS9COWZLdnNxZnZsUmdoZ3lJNkVDYUdLbDFP?=
 =?utf-8?B?VlFPdzZNcVNac09XZ05xNUdJSzYzdFZFTThiMGRQV1BhUVVUdGNEdjUyQUR4?=
 =?utf-8?B?dGl6NG5pK1FyeU5rVUQ4RWVEejhoUlduWXpoQWxxZUtDUGQ3TWhDUjcxaW40?=
 =?utf-8?B?MTJFM0JiOE9xMkV3Zzd0c2ZCdzF0b25aRkM4V0ZRRGFRc0Nwc0krcENnM1JM?=
 =?utf-8?B?b3B4QUJaU05MWUxWMllibC8veTgxMUUxL0t5a0ZaMlBEc2gyVmFvZlVnemVy?=
 =?utf-8?B?MDkzM0hBZGd0WW1HWXlJN2dxYjViRDJkcXFnZ0dYcmNvbWlubGJLL2VtTW93?=
 =?utf-8?B?UDYzb0QyRVp3L3l0T2ptZWJqSmNET29KSDNvQ0Z2TFJIY3ZDdUM0OVFmRGFj?=
 =?utf-8?B?WkJpQUJmRHgrWDFZMDB2dlBUNGNmc3JxdlNKekRwSkpXNGh0T2w3dUUwM3JU?=
 =?utf-8?B?a3M5ZDllZXc1U2FMMWgvWW1EdzVIZ3VURGw2akpnbHltVWV1bzl3ZCs5emNk?=
 =?utf-8?B?VWNNaDFDOThyL0xqSE5RdlJNYjRRR0I5Y2lKR2p5NXAzN3lQY2pXZEd5ZUxZ?=
 =?utf-8?B?ODJiQzJ3aUJiOFlFZTVZYmNpMkVBcDduZzBwRjNXRFI3cWg4RGc1NE9Pek5D?=
 =?utf-8?B?UHlrM3dVNUhyL1FZbjZDTnJIVHZLWHErOC8wQzhjYUlaT0VKTWszdHZwNnNF?=
 =?utf-8?B?OE9hVUk0dkRRZER5R2Qzd2hBWDl2aGJ3K1QzaWdhU2U4SzdFVGRtWjFnc0Vm?=
 =?utf-8?B?RUZBVEIyZnZjc3dTMUswRlZRT1I5OHZWODQ1K25Jd0xEdXBiTC9iMjI3SDhx?=
 =?utf-8?B?cHZ2ZjF2Y1lBVnA5NlpCSnU5YVc5SnFUODFKOUpCbit2MVhRZXduTXRRU28w?=
 =?utf-8?Q?dszGwFQSXZ3qlQlBVmRLaXZNX66A31sr1DW+oyilgzWO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed84ef7c-eb32-4088-d119-08dd95e64092
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 08:30:31.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kh847NXc1TggdqYxuj3tg1CklT5mYry0WNUeuIqwjr9diYEj6gD+MJsT3wDa2Ken4tCvxM0GmfCVFM/aGgEJRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589

On Sun May 18, 2025 at 5:14 PM JST, Alexandre Courbot wrote:
> On Sun May 18, 2025 at 4:19 PM JST, Benno Lossin wrote:
>> On Sun May 18, 2025 at 4:28 AM CEST, Alexandre Courbot wrote:
>>> On Wed May 14, 2025 at 12:44 AM JST, Daniel Almeida wrote:
>>>> +//! Regulator abstractions, providing a standard kernel interface to =
control
>>>> +//! voltage and current regulators.
>>>> +//!
>>>> +//! The intention is to allow systems to dynamically control regulato=
r power
>>>> +//! output in order to save power and prolong battery life. This appl=
ies to both
>>>> +//! voltage regulators (where voltage output is controllable) and cur=
rent sinks
>>>> +//! (where current limit is controllable).
>>>> +//!
>>>> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/=
linux/regulator/consumer.h)
>>>> +//!
>>>> +//! Regulators are modeled in Rust with two types: [`Regulator`] and
>>>> +//! [`EnabledRegulator`].
>>>> +//!
>>>> +//! The transition between these types is done by calling
>>>> +//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] respe=
ctively.
>>>> +//!
>>>> +//! Use an enum or [`kernel::types::Either`] to gracefully transition=
 between
>>>> +//! the two states at runtime if needed. Store [`EnabledRegulator`] d=
irectly
>>>> +//! otherwise.
>>>
>>> Having the enabled or disabled state baked into the type is indeed
>>> valuable for drivers that just need to acquire and enable a regulator a=
t
>>> probe time. However, there are also more dynamic use cases and I don't
>>> think the burden of managing this aspect - by either performing a manua=
l
>>> match to call any method (even the shared ones), or implementing custom
>>> dispatch types (which will lead to many similar ad-hoc implementations)
>>> - should fall on the user. Thus I strongly suggest that this module
>>> provides a solution for this as well.
>>>
>>> It has been proposed earlier to use a typestate, and this would indeed
>>> provide several benefits, the first one being the ability to have share=
d
>>> impl blocks (and shared documentation) between the enabled and disabled
>>> states for methods like set/get_voltage().
>>>
>>> But the key benefit I see is that it could also address the
>>> aforementioned dynamic management problem through the introduction of a
>>> third state.
>>>
>>> Alongside the `Enabled` and `Disabled` states, there would be a third
>>> state (`Dynamic`?) in which the regulator could either be enabled or
>>> disabled. This `Dynamic` state is the only one providing `enable` and
>>> `disable` methods (as well as `is_enabled`) to change its operational
>>> state without affecting its type.
>>>
>>> All three states then implement `set_voltage` and `get_voltage` through
>>> a common impl block, that could be extended with other methods from the
>>> C API that are independent of the state, as needed.
>>>
>>> To handle typestate transitions:
>>>
>>> - The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
>>>   method to transition the regulator to the `Enabled` state.
>>> - The `Enabled` and `Dynamic` states provide `try_into_disabled()`.
>>> - `Enabled` and `Disabled` also provide `into_dynamic()` (which cannot
>>>   fail).
>>>
>>> Essentially, the `Enabled` and `Disabled` states simply enforce an
>>> additional operational state invariant on the underlying regulator, and
>>> do not provide methods to change it.
>>>
>>> The `Dynamic` state would be the default for `Regulator`, so by just
>>> using `Regulator`, the user gets an interface that works very similarly
>>> to the C API it abstracts, making it intuitive to those familiar with
>>> it.
>>
>> How will the `Dynamic` typestate track the enable refcount? AFAIK one
>> has to drop all enable refcounts before removing the regulator.
>
> I guess a choice has to be made about whether to just proxy the C API
> as-is (where an unbalanced number of enable/disable calls can result in
> a dropped regulator still being enabled), or whether to clamp the number
> of times a Rust consumer can enable a regulator to 0 and 1 and disable
> an enabled regulator in the destructor.
>
> The initial proposal does such clamping by design, but I also suspect
> the C API behave like it does for good reasons (which I am not familiar
> enough to be aware of unfortunately).

Well after thinking a bit more about it, it is clear that is does that
because a single consumer may need to ensure a regulator is on across
multiple internal states. I suspect we will have Rust drivers complex
enough to benefit from this behavior sometime soon.

So I'd say the `Dynamic` state should probably mirror the C API as
closely as possible and not try to outsmart the user. The
`Enabled`/`Disabled` typestates will cover the simpler use-cases
perfectly well and ensure a well-controlled enable count.

I guess this also means transitions to/from `Dynamic` and the other
states will have to be limited to the ones where we can clearly infer
the enable count. That's probably ok anyway because I can't think of a
reason to switch from one pattern to the other for the same regulator.
Maybe we don't even need these transitions at all?


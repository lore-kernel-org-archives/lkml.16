Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC10DF42;
	Sun, 29 Jun 2025 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751159441; cv=fail; b=pLkK99zU4SvxsZdZ/SohjsfH3pQUnkf1kga14XCm/OhE3ldVn9y7Li/UISiv77NSN03K3siNPeiyXKa8esLxtA/od2tA4NbK4v8ZWi7/sEribMrPFfFembJjoREeTHB/nCqzvRbZoxFfklo2iV6llgbptDyfzO5fz8GX/p81KD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751159441; c=relaxed/simple;
	bh=KQtvfo/wt/Qf5twcp+2ES1xCnhR0olBjinG/JBeJYuU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ciNt6WhPOdTlVlSeF5xSABt+BpM8bnkit3TcHAF27uMI23u1+7rJ0pqGTXm7nUK2hAFfTNBD1zhzf+25Nqj3C8g73hYaLRBpm1r7gdkdjXT2DfZ3ZsFQho0wGbs2Vz8fhiWGOFTQtesDifuwu30fDA06P5cboCDeJx+36iuaTZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CTesngLu; arc=fail smtp.client-ip=40.107.244.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CTesngLu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jN4yJ/nTYp421O8X+YI67Od3TXd6XD/UPJ919luK25D37V3F7g9hq3nRrXW+r61j2pvYVhp+8F3Qk4V2/xe2mPMC+IGLs49Y5zC1qFONn8ZDnxYJQMcvcls9FMbyIUexuvDZ5VE530UWt8wghZN4KhKpHwXLScIHJKM0uS5bPKJ8S1n+SezC2aBy1eyYGFHiwgnJkcp7FaoGqSJKGbNvk/xDv5uM21R7i4ne8CqjsYhlbQUSR4HlRSlhT1S6AfwtIljbj+eUrPJ67Y6zhY6mcqgrrc8F1Vy01pihwWDimjHWwh5YjGdReu1YFXa4E5IZASwcHOS61lhnGO3Mq4hJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIiXtsZDK0Hb2c0zw0tnEaJJm74OKLiLXfA9hVNBDz0=;
 b=p0VkTsttMhpZ9UJ9RiRZhEJ1UsG8/Ls2j5baUlTG2OdeZ8/jKNu1cCBuxPMzQCuiGdCrCOsGWd6RJxJ531ytB3OrsGI7PL4gBrCiiIMNWELw5SnYjHhaX+rwGA8cNpL87vt8lyP7RI8IvK7lM0ils8DYpPdTQn4ceZfa5mb20+NHE309DG7+kNqxqshaUBDwq4fORANdY5o3H2FTy0GqCw//iXBuSbjLaoj55uUdrLh4IEu010QWPnsL30p+tykepp3FGC10CSlGxpLAIWPHtcGXuXqI2qveqkjSlrZAy4ng92oLmu4yA3pqPmt8SAdOBzJmANIJ0l6DQolpZF35Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIiXtsZDK0Hb2c0zw0tnEaJJm74OKLiLXfA9hVNBDz0=;
 b=CTesngLuoYdInlUJFfNParJfx/bHe2EyWKEOHrxROYl39rPRKt100suFz17vf8kI8vEsObTbBZLkVwnA8NZCvvCzRDLeJJ3R7YZXspt2tfA7q4EpH5rybHxST+wmQQuhMjXbJK8dV5zVg5HNOxuKJ7Hk8qnI9+XzCUIC5LoxfwJug/dv9cFpSP4zdCf1JiXmvjJVMpxVT9Kc1t6uohc6NfWxWO6zljo+iYpGLiGIVYwgRKBttg8ftLaqsFgO19HIMR33vcDAms9Si8cWpkWITzDaLP4zB5ZcG9DTHlJkVzOQgDqPgf3VVIwW5CLJcdb2uLhtS0igveQwd+wh+PD4Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Sun, 29 Jun
 2025 01:10:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8880.021; Sun, 29 Jun 2025
 01:10:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Jun 2025 10:10:33 +0900
Message-Id: <DAYM7LVHPJ4U.1T6R0TCM6MNTW@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: require mutable reference for as_slice_mut()
 and write()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250628165120.90149-1-dakr@kernel.org>
In-Reply-To: <20250628165120.90149-1-dakr@kernel.org>
X-ClientProxiedBy: TYCPR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:3::32) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f7822c-6abe-4dbf-a82a-08ddb6a9c183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|10070799003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDFKU2FaVzc0eFFjQjhyY3Nla1FoQXhKMUZTVzZUSGI1U1BUYUdhSFZBaUtZ?=
 =?utf-8?B?aEhlbWtxQnk0SzRHTUNrdFhtWmhJaGpmM2o1bnc5V0R6Skd3RktIcEtUeGFh?=
 =?utf-8?B?aWtobEwxYmlFQkxvU2tKZDBkeTVUSU9icEIvWEE5Ry9PNEc0RzhSVG5EOURY?=
 =?utf-8?B?Q25RUVYxUTBlSlVPRnFicjBOZDIzTzY4NFhOSXBxWlNmcG5CdURYemNUVU9i?=
 =?utf-8?B?Tkd5K0pTbFNtSWQva2VvMmZvRnJXbW10dFpnN2MvRmFVbDVyVjNVUHhtMzBm?=
 =?utf-8?B?SXlBWjFLOWFKVnpxc0xqbEVMci9iTUx2YlNiRDNObmlSclY1T1UxdFNmR3c4?=
 =?utf-8?B?SnJvdHlLMEpzQitQSWhHOS9nMFRPV1djbnlUdXhPSXVNQmVhbXhrbVZwYVFD?=
 =?utf-8?B?L0syazBWd1FBb3kyRkxaQXQyY3ExN3dWZXNFWDVVSFNsYjZBR0FISEJ1d3Q2?=
 =?utf-8?B?NkoxY090WnV1NG1uMFAvbXBueGtBeUxCNEFXL2RwNWIxbWs0ajFMdlN1bno3?=
 =?utf-8?B?ZHNubFM0Smc5SGtJRThoM25FeEFpbXcxc0ZJbVA5UEp6Unppa3Nsa0xxaEpX?=
 =?utf-8?B?WjI4TXFhY0l5RmFDTGlLR2MrSTNSRHNXSWN4N3BhbnNuWWY1UCtDOS9HT0VD?=
 =?utf-8?B?YWtsQlJPekMweTJiWnRWRFFrRlRRS1pPVnU5V25JZFE5NEJHdjZrNHBzdUZp?=
 =?utf-8?B?T3VRSHp2UzhFUmttajNMK1grMkFCNWZOUS82c1A5cC9rTSt3TlhDM0Z6djI5?=
 =?utf-8?B?U0YyeFdwZ1k3ejJHZXo1N3ZpUmVCUDVRT1A2OERyZ0JDdUtRQWRQMVEvNFJk?=
 =?utf-8?B?OUJheWlNOU1jT0JzOThaNi9ZNlRTWWxvRWI5ektPcWFFU3lLWDRSTnZUcW4w?=
 =?utf-8?B?SllhL1RMQUFiempRRWJ2MUYxRWVBS045aDA4STBxd0oxRkZaWjZHSHdhaTVq?=
 =?utf-8?B?dTBmOE9ucjVmRDExN0s5bWp6dGdIZy91Z0VsMHFRUEJtZkNvNXpQWkR5R2U3?=
 =?utf-8?B?UVpSR1lKZk1yK01nL3dEYUEyWHZYN0hVcUJwUDFoQ3BHZmIyU01vUVVzLzdi?=
 =?utf-8?B?d2hDQ2YvSWhndDJxdS9nKzlYYmZRY3BrM2tiRElaR3dCc3dCaDF4MURrZnpq?=
 =?utf-8?B?ZGI3Mm10c2JZbkZudjVZbUNmWUJQTzMwQlVjYWJndnZkZE5EQU5DdGU2QW9w?=
 =?utf-8?B?cE0zZDdzMGphOTdadzdXa0dOcDFHRmNzckVsZUF4RTdQRlpuaFVuK3hWOFdn?=
 =?utf-8?B?RFFITXFFL3QwTnFVeUw2YmJ6Q1JIVzFKTnFmN08wc3FNSndycWRjQzhEQ0JZ?=
 =?utf-8?B?MDZVejBCSGIydzhvaGVlL3R1WHBUSEYzcHVGVjVaWGl1MXB3RHZSOWdWQm9N?=
 =?utf-8?B?TkdZOHRROEc2Q042d3J4Uk9mcGZoMWs4Nnd4VTNhaHRpTUZIVU1VcTN4b2dX?=
 =?utf-8?B?bDhDV2ZNWHJxcWlsSm5lMjlBV1dGdDNRODcxR1VjTHF5RTJNamt3ZnF2L3NO?=
 =?utf-8?B?S3RDd29EUlhVUUNTWDUwRVVUb1d0bnRuM3o5UGUwUXBwTXVLZnZwK1NFVm1v?=
 =?utf-8?B?dmtiUStyZmRObm5DTnRyalA1T0Rsd3BSRXZLRUMrZUdHOWVsalVOZzFIbXIy?=
 =?utf-8?B?S3RSbHl4bnc3V3Y5M2poblBHaWhaN1BTN0ozNFlNek4rUXZoMmZtcklQWHRG?=
 =?utf-8?B?ZDB0V082Ni9QVDBidExPamg3N1d4cTNZRytKbFNFaWc3UTNNOE5KdlZaMUtC?=
 =?utf-8?B?SXNNdGEzYzB1M3NDU2RwT2Z4VzczWnV1QlBOM1FkTGxQRGRzSkZxTjV0Y0FR?=
 =?utf-8?B?VkJGWEN6NTQ4U3oyV3R0TkRKQ2xTWkFuUVlDSll2Q2ZnQWRWTHhYK0V2RzZZ?=
 =?utf-8?B?MG1HaWt2NUZvbFFlU2Nsem8zY1N4czNKazBhQmpOdzJ1V2l4RVQ5SUhLSmlT?=
 =?utf-8?B?akFWdTJ0czFVYlJQSzU2MStscElIc0JuTnd4RjI5amxVRnhqcTdVWkNwdUFI?=
 =?utf-8?B?U21MSTFTYUZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ry9qSlkzOWUzdTFCUThEWEljcVhmWkNEQVREOXRza1VhczJ3NHZoNVZvUHlT?=
 =?utf-8?B?YlFUVlAxUTZjLzZVOXJ4WjJ3cm00MkFrdE1QNysranExOHd4NFRPU2NscC9q?=
 =?utf-8?B?Q3ZySDZwbVhiRnpMcGNscG9ObWFlTUx2djhYaTl3a0xiYmgwT2JpbVZJdk1z?=
 =?utf-8?B?c0Joamd6RGFsRTlTRnJ6RWpGamRTRTF5Z0pRcUNFTGtVYWd1SEgrenNHb2xr?=
 =?utf-8?B?VWxnNWlMNDBRQ2ZrNkVzWVQ5REtZMGJJTitJY3NhUjBuamRPSk9zeEt2UW50?=
 =?utf-8?B?STJhaGlTNlM0M1MxTjNZSEdNVUttYUw5Z1RvNFJkZGVsaFJlU1RvN2hZdW5z?=
 =?utf-8?B?MlU0Y0N5cm14ZlVNTStWZFNRd1Uwa2hPNVoyOWsvdG1FeGhrT3o1ZzE1a2Mr?=
 =?utf-8?B?a2ExbXNLdUNKOHNUbUxlNXpCV2oxdWNCUzBvbjdrT2hyZEQwS1pMT3dBR0c1?=
 =?utf-8?B?ek9SQk9YYmhSOFcrekVMQ2RNRFJQcnFjZWQvSU1pK21Wdjk4Wk43QWo3aHpt?=
 =?utf-8?B?d0VROXZWMys3RjJ2bHcyWi9jNUFNZW9USU9rajcwTE5CZGs4bXdBZU1WUUNB?=
 =?utf-8?B?WEdDSFpuVkZ4MjRiRG9GUFNkOTluUGNUc2dvL3lpZDlkcEtZbytMc0dBcVZM?=
 =?utf-8?B?V3VPc0Z2dDQ0K2lTdVRBTWR3R0gzQ2VXM0RkTk5YY0tpbnZTbFNQNDF1NVN6?=
 =?utf-8?B?Tk9BejhoTDRmTE54SE1rQlpvNnhoWVBVME1yVmhFVzEzOUpqVW5XbHhpZXdT?=
 =?utf-8?B?SGVqOTFDTTNjWEV2Q0cwSEtZZVdGZG0zWnlUeEtQLzBESkFqR1V0RnU2NGpN?=
 =?utf-8?B?SzVTSGhvY0pGV3JlKzVnWGtMRHdtM0g3OFhXMVlaSmtPZUpLMmU2R2c4Uk1p?=
 =?utf-8?B?eVZUdk56aEZkU0ttVTJOckk5WlV5SEN5TXczbk82b2d5VEN3eG5VazFzd0ky?=
 =?utf-8?B?blM4YzgvSWV0WXZrc2twTzhPQWhQUFF2ZzZOY0Q1Ums1ZnFMN25aUjM1cVhn?=
 =?utf-8?B?dHZucXVTZXFtUzdsU3Y2OFZ3NTdBdGhQbmR5cjN2QU5NRDBpYUJUalRLYTBT?=
 =?utf-8?B?NGs5Y3E5RDdTU21EQlBwMUNVbUg3ZWJmUjNKRnJxTWtBYmw2eXZnQ1E4VVcy?=
 =?utf-8?B?cVNqd0dHazN3Ny95bEc3WDNqeXBtdG9qYW1TdEdWNXhBbkJnZlFRRkswMEJp?=
 =?utf-8?B?aGk0SEl0dkNGbFFCbGJNSDF1Q293RnJNZHFGZEYyZ1RjbkVZQUQybk1mWUt0?=
 =?utf-8?B?M29ROUFnZmdsQUdmaFA1Tm5tTkxiYlh2c1c0UExBSk53ZFVrNzdtYW9BS0d4?=
 =?utf-8?B?YlZydnRsd0ZuYmpHcUtiSWhxdmVEcmw0RVBxK2hqcFFCd2xuTWtJSE0xZlFP?=
 =?utf-8?B?UUY2REU5ZjMwdEdqZjJqTU83bGN0U2trVm9zNFNoS2VKdjd1ZTBmT25kREZS?=
 =?utf-8?B?MEFuVE1ZT0VhQjY1ZTdsMFprU01SVHNqRFN6aXpGT3pOREtJeDd3NTFCV0th?=
 =?utf-8?B?R25ualJaWFFLU0hKNDZYQk5WR2NOMGtCYTE5NW9QbUc3Vml4YlBncVMxcGsr?=
 =?utf-8?B?MVZUOERDZVg5Wm5pRmExcjRJOVBSYWZ6Mmd0RldVUkxlYmF4WFZoM0Q4b0Fz?=
 =?utf-8?B?N0I5R2NZdUowZ3VabzM1KzJuemRha1ZTeWhvK3p6YkhTZWN5M2E3SHdiNVl1?=
 =?utf-8?B?Q1NObDJMRmYvSG5qRUd3Ullkcnp5UmVWTWx3RzhhZjl6emFVZCsxZWpVTDB4?=
 =?utf-8?B?ZTVEMkwyWUpvRnlNQUxUU0RseWtwS0VnZ1VLMHhkTGp2a0tYdElDODYrdE9w?=
 =?utf-8?B?eW9YeTFsbHlkT1BieHVmcjV2bVV4dnUzYUN5QXd0bUxHcy9uREVoMVF1SVVq?=
 =?utf-8?B?RTRTRHZTbmdLcTExR0doZkRiYUhWTDhuN0dqc2RTdUlTS3dOaSszNXlVSGFo?=
 =?utf-8?B?N0lzNGREbmovU2VLaDNwYkltUUx0SU5QMmUzUkFnK3lzV2hicEcxUGR4amRu?=
 =?utf-8?B?cEZmMS8vM0JaNkVXbTRZekRpcnJKK1h4cXpsMUM1ZVN2c3dJOFFuOHpEc2t6?=
 =?utf-8?B?enBDN3pWYkF0Zno2RlFYTFRYNXZIZXhBcUFDVnB6dFZKeHJmZUlLWjBnQ0h3?=
 =?utf-8?B?eTRtazA2RmViVWw4cHFTV0hvemdzK0xnMGpPc2RPVFZjMGd0Q1l5RzFITmZM?=
 =?utf-8?Q?xPo7VkuX3UKiftdkW028U4ZyL0Fg3wedCAjD6FEs6F/v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f7822c-6abe-4dbf-a82a-08ddb6a9c183
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2025 01:10:37.1403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWBQGeOI+b8/7Tx1o7pPiF3zTTAiBdT/yAREXaGPkrO2MNZet68d1SWKe9LGRHrUB7UG/sobZ2hIxFQZ2jBy6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413

On Sun Jun 29, 2025 at 1:49 AM JST, Danilo Krummrich wrote:
> Given the safety requirements of as_slice_mut() and write() taking an
> immutable reference is technically not incorrect.
>
> However, let's leverage the compiler's capabilities and require a
> mutable reference to ensure exclusive access.
>
> This also fixes a clippy warning introduced with 1.88:
>
>   warning: mutable borrow from immutable input(s)
>      --> rust/kernel/dma.rs:297:78
>       |
>   297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count: usize=
) -> Result<&mut [T]> {
>       |                                                                  =
            ^^^^^^^^
>
> Fixes: d37a39f607c4 ("rust: dma: add as_slice/write functions for Coheren=
tAllocation")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

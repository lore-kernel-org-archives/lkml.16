Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A3F14AA9;
	Sun,  1 Jun 2025 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748746855; cv=fail; b=hznrfI9ZvB0dz+h3kQEnp7USZATsIp80beykRZmv04G2bu0QOXw2mROOKtyiQZ8kb3VBkWfqN7YYDDmwDrKS7XI3OiSNoLf0HGRUavc1BHl3Mw7of5jKhIUSsAKL4e1B4SJLbTu5Llg3e3XrPgQGeWQMMX2BfzWR8MFKj8OHDAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748746855; c=relaxed/simple;
	bh=D3feTtNX2aQLXNsK6GJ9iOSMvpMkPZ+h+BsteP9ODk4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dvc3MeY8f3ve5X5GoIAhdlldI7Z+JAWr9ZWXwhHXbSSrI8ryR3u2uz+6K69fISMxlnCY1pRzv60u2b0jxFWWez3zascEaAs0j+vj53WPmJn7KVP3mIWfdtsO3TnfkERk0NUmhHObnfZZ69MGkEaE7MW2XAQS5u4cBfwWuI8f/Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tuSv3QSq; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tuSv3QSq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cv/x6WY3BBQB2QZCnm99kWx5roO91dhwXt9B+3WDZPJZQhaXfLkL6XJ4ObrQB9lniGTNHPRa+RgG2U+DrGvHRhU+gYecn65kw3u/hkr0hy2RpgenepOu3O3rTTIUmd01aN3iwyLM2JveKlu5jKgUs1yRFw06nqpKB7c2UHbVrm6abdC1ePLtfSVBu4ZK2LH/cQSC1462ZsDMs0tWU9pHusr5iFsDDnZYPlRuFfYTsv2bnnfN+qgnH/gb9KrVp4zBxtn3PP6gSbyKVXunc4TTG8zaqiDaVJ2P5HfqEaXhpA9UM1EYr7cCHpmzqA8FYnCcZ53kuCNE8cfqgJWiQgAwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/VT6X7nU7Xyf9HpjnUc2WBigfvcuKQnnKDc+zU0XNA=;
 b=JdWxEQJRK/C8fygrFNArof/ul2uu+WvLK98+7buCp4C+hL2Xh4FLIc0izZJDpqr+dsJwrmnJ9ghTeeEA1ELwbEsUMTJt3PsBFksImw2JlX6pvu2RQqquMmr63tDF5ZtwoqCO5KeFwu8OzcUHOc//KwSDdntBy1rPfBLwgWVayzGD3niwUo7sNwxuoeYddQFqCkfVCO01BKKN6+PIv0zYZj1OEK5C/mPjq6FPLFFSnDZ7uEIi0l7/Z4yqACnYaR4JYNH1rJREeZIqqNdW+AIS3JVfDT5U10DTLOl/Ln/sig4tCFWquqy/AUxMv5RV/dna6mrI+wpyacWN1bNrRliTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/VT6X7nU7Xyf9HpjnUc2WBigfvcuKQnnKDc+zU0XNA=;
 b=tuSv3QSq3uFABK6kFenwgTRXOptTV8Kic3emRKjkEWgVWlvd2tmAdZ1TZJU60YlnL4tvBrxIqSuhLX10cZ0rM63r0YoH6B+lrefBdzfPfYuy6HtwMH/0K9T3ZvOIeqIQPeb38vZHi/3coWotuiuu4YWPrdn/L80xTVT76e39HNM6X71dFBtXAZNrAFK6CTocjZcWzV4YogkcjZ62ZRQQTctuRjr0fNcEVlUDNm+e2OVQKWf7y8oNwdfRbWWG3lFXBRI0iazRBIcm21+WFldz6lXe9geVXmcw0hck+ightS+BW0CE4ly4Bogm4Bie3zi6bfRD00h3HpFz0dgfj8eQLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Sun, 1 Jun
 2025 03:00:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Sun, 1 Jun 2025
 03:00:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Jun 2025 12:00:39 +0900
Subject: [PATCH 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
In-Reply-To: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYBP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 90907616-235e-44b1-413b-08dda0b88410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0hXOVJLTEN6MTk1anNBbmcwUnp5d1RSZkgzTkxFOG40eUFSYzVFZGE3ejJy?=
 =?utf-8?B?OWRqNVR5VzBLVGZCd2NTZWJMZmlnNVpJaW9lMHBwVFRkYUpEY3loOU5STENh?=
 =?utf-8?B?YnE0OEJSUFNGTkJWTzBRdHRHYlh0c2NNYmpzZFpiaEtpeUJiQjB0R3RVRUw5?=
 =?utf-8?B?N2ZnSGlob3pDUHprN3lHaitTNmwyeCtPRnc5TitmVmo1UDBnTG5WbXJ2WFVJ?=
 =?utf-8?B?T3dWTEp6TDBLallaN0JKcXU2dmY4MGN5Y1FXRFBlVUc5c3U1dTZ3aFBQTWgv?=
 =?utf-8?B?RDNJbXo0WVJ0QUJiVGc4NXdmZVp3dlRVczNVRVYvMmdnZEszdUNWcnM0WjBQ?=
 =?utf-8?B?T0JQOVBtK2w4Y25FdDVVaFZXUm1OZGZWTjFyNUtMcGMrVmZsbEd2S0ZOVitH?=
 =?utf-8?B?a2lnZyttcWtzc0ExeEhEaGlpNVFYamwwOFdlelQxeXVaRXUxdjZWdWx6RGgz?=
 =?utf-8?B?elZOZXRQTDNLK1BvV1VLNmZ4bnJPZ0U3WXByU1hPVkJBODI4K3BQSDdVdFFt?=
 =?utf-8?B?MVlvak5OT2M5bm5Ed09wRkFsbHNoRjBsYWs2Z25iaWY4SWtrd2lTTjQ3UFYy?=
 =?utf-8?B?blFTbEZidDU0VTZkakpvcFV0OVp6Mld3Y1pQbVVDY3N5blduVDFScHRTNk9m?=
 =?utf-8?B?Q1BnYmxrdmx4OVBLcFBSZktGTHhyeVRJVTBiRzMvbkdtVkloV0xMcE96VmQ3?=
 =?utf-8?B?N2FoUWc5L2cvTjRzTnRnWmVDQmNMUzdqRy9rOGg5UUc0dWJib2tQRDBuUE1G?=
 =?utf-8?B?M01qV0ZKYjZTemtSckV2bjRYZkVSNmJ6RVE5SHA2NXRDNDdvYmtrK1pTYlZj?=
 =?utf-8?B?bUg3KzJQMVorNDNEZnczcnFwV0MrV3VXcXMwTzQxeXlhRjAyUXhhUThMQk1x?=
 =?utf-8?B?NGhTSkYzNlNiRC9hVjJSc0kzMDVKNlo1RWlKRWUyV1N4eGxxWUM0cEtnSzBD?=
 =?utf-8?B?SWYwVnZhVWpLY0h4SUhkTTc4UThiWnNqMGt1ajJmZjRhUGJscFVIMGRuTWtw?=
 =?utf-8?B?cStoZ2IzYUdTOXB5aW1oV3ZvdzVWdVlEQXluUGd1cmhnbUtvdTUzQ2VKOXpI?=
 =?utf-8?B?Umt6aUhZNVJlT1VBcmREUC9tWWVPWUJvSEJ1ekpVNjg4QTZXZlhyMVcwWWE3?=
 =?utf-8?B?b2hiaGM0VXYzZW0relhwa3BxMXovTVVuZ3dkbFFHWUxRRnRPbG1mbFR4VVg0?=
 =?utf-8?B?d29nRjJ2T2IyWkg0UjBiQmRFRVp6RVlldkpuMGRzMm9nekJFWlBZNE9xMkhU?=
 =?utf-8?B?bkc1ZnZDQ0tIZWl4OE94QzRXN0tjV3R4OThOTC96SWJEcGhsSFNGc3lETnhv?=
 =?utf-8?B?Uzh1alNyMTdkdlFQbU56RFNiL1B5MGZZbGg5MTdTRUpsYzhjUzlIMTNWOEtF?=
 =?utf-8?B?YXFlSlFCRmQ4SEltWTY4M3hFa2phV29VekxiTUNpbVRrRmRlTUJaVFdtUzVI?=
 =?utf-8?B?S1pMSEFJM2dWeWs3UFR1VnFocFNwekNVR0dsd3FtVWdYeDRQR3BKTjZ4MlhF?=
 =?utf-8?B?VGs0aThWZ3hlY25SSk9MRG11UGp4R2hDOFJFSi9YM250TG1YdzVpMWRrU3V3?=
 =?utf-8?B?U24wdjA2VkovTHlzVVIrZnBsU0F2eEpDMENwOVN6NGgrVmFUZURBUXpQeUVE?=
 =?utf-8?B?MjlNbWVjeEp5eW5YOGF4RE5KZTVEZEhSS1F2MW01ZUdOQjNHWG5UZjRPQjlq?=
 =?utf-8?B?MEJ0NGhoYnZnRTdCOEpsd3pUZmI5L3A1K2VwVWRFNTlVUWxjWUNQRjJ1VlZH?=
 =?utf-8?B?U1JjWXFqTFU0bG50bzhKRWtGZDZXb2VjeWtpNFlMeFJyOWV0YTNCL0kySGdB?=
 =?utf-8?B?QklzNE43YjllR3J6anZtbWN1dWFyTGM5VDBVaU9EVWd1QWpBb2l5UzFsanlK?=
 =?utf-8?B?N0tHdjAxdzVkSFF4Zm5YQ2FQWkg0OXRhTmtzN2krV3h3SjZtV0ozejUxb0FP?=
 =?utf-8?B?VVlWVkNkdmJyMkJiNkhXQ0xZRmt1Z2NZL2dnYy95aERPa203SWNvRjBneWZG?=
 =?utf-8?B?Z3k2TUxKdFpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXZadDZjYnZBTGFZVUczSTN2WTh4L3dqTXRUazlrY25sbzZxeitYMUlhWnNU?=
 =?utf-8?B?aWxBWmJCcTRRZW9kQkNiQnpuZWFwcm8rcTl6NnhOV0VncHZlaUtaMFZrNEdP?=
 =?utf-8?B?amNJOFBBdHVoVHpQb3V0OU1pY25oMjRSUnA3alpOa09sQmpTM3cvdlluOUJH?=
 =?utf-8?B?eU9FRFdyMTBWSXV0a1E0RUtDQ01PVGhVcmVhYnpYcTE2ZHV2N2plRjRjcWJ2?=
 =?utf-8?B?S0pCV04rZE9tQlpvcjhwNGRZejZSdjE0K21uREpEZFVWQTM0dVNjWnRnZGY4?=
 =?utf-8?B?ZHVMMVUyYXk3OVNFTXBObUdsSHNxUjVEcGtEWWQrWUxveHd0WFdNZ2YydnZS?=
 =?utf-8?B?TVBvRHhBTnlkMzF3YzJjYjVrY0Raa3FOVWNnQ2FZNzRTdXBBWkZ2VDNaa1ov?=
 =?utf-8?B?dGdudHFNMStEaWNpNVBnSXRRZDVSSzNpbUVBOEw5UmRzdTRSblZOYWNmV01Y?=
 =?utf-8?B?VXBaV3V6OXFFSkxWZXhsRnJYY0p0dDhGTEJqZy9wcFdtdG9qanpNVVVOdGR3?=
 =?utf-8?B?cFJNMEZtVVdxL2cycy9LQWpNZm51bkhWYXdReVU3M2FMRnZWUzFQTlhIYmhi?=
 =?utf-8?B?bjJ2cGtidHVGeUV1UjhVQWxQSVNIL1U4bFNkVGczTDR0UWMybkl5QVhueStV?=
 =?utf-8?B?Z2h1Q0VEMktWMDFUYkl3SStQTXNuSXcxS0p5KzZaYVpZWGEzVnFWT1BtSzRr?=
 =?utf-8?B?T2UwaU5SK2hPSUxqUEVQK1NyNmlobWJycUYzTzluWDNMNTlyM3ZpT0VyZEVK?=
 =?utf-8?B?UVNKQ055Z1M1TWF1cG9DTC9maENTenlVc1llellBUC9OMzZZbm9wcEQ5MGdK?=
 =?utf-8?B?a0l5bGRYK3MvZUhZdWs4UDFmV2pCZENMajNjcUdpT0VQSWZoQ0NKNFZEMUZj?=
 =?utf-8?B?cDVDMnEwSVo5TldaNFk2aGpQbTJYeVdVNmM4UFhQbkVaWDQ0ajRzRlo2RXdN?=
 =?utf-8?B?WmcxQ1krSDVtV3Nkb3k0V3I2Mld4QXUvMzZUYXZrWXgxTGNRb1RvbHYxZi9s?=
 =?utf-8?B?M29lVkxjam5xdkJWTjBNeit2TE1KRnE1SDZHV0N3OWZPd0JHUnVwTWlNd09v?=
 =?utf-8?B?d3pGRVhLbTdoODI4N2FDanBsYTdJUC9EWDV3RXZEbVBlWXJXaHVTMEMwcXYw?=
 =?utf-8?B?WjdYM2tyNms3SzZQc1c0UWdHamVMNWJwV09nam5IYWlCVHAycnVtNjRKUERW?=
 =?utf-8?B?cDYzaG11M1BCei92QVRzbVFnY05ES3hQVzY0Y1I1V1dEMTM5NUNoT1FYNUdu?=
 =?utf-8?B?T09GQ3I0OU1xeTBHZk01WTQzS1EwMjVYY2Q5S1JsdXNzbDUweUdLMG1pRkN5?=
 =?utf-8?B?TjI3ell4N2dWbXl0RjRURWExREc1Um9vNmZ5MkJXdlhWcTVLNnUxNVYxeFpO?=
 =?utf-8?B?bVJVK2IrMTE0TDgrQnpDYlgzaDQzYVkwZGNGcTVoOWtxaVJ2QUNIZFpWU21i?=
 =?utf-8?B?QzNvNDVaWCtjdjVjeWZrb21GNlg4Y2lYaFMweis3MVpXSEVzaVhQdU0xWFd5?=
 =?utf-8?B?STIxZFB4OW1iZFJReUgxZStLUUd5N25lMDVkM0kyQmgxMjNWbVljN3JDWGNL?=
 =?utf-8?B?d0ZjeDFOT0tyUUU2ckZYM2svb2lRUGhvUlQ3Z0s4di9PbUJCQlE2anFkYXNs?=
 =?utf-8?B?RXk1T3p4QmwzbHljd2pvWTI0bTdXQ1FCYUY5bTJkTWs4aDJjTkhzU3p5eDhQ?=
 =?utf-8?B?cUg2d2d5dlVxamRTYTZha1QyWHNvZDZDU1VJMjJYcG1tUVVaVDhzbmZ4SW5r?=
 =?utf-8?B?NDNZQXI5YkNqU1pRRlVtZnhLZkZzQkpBNS9ZdVBsWVZIWDI0K21jU2RDbHF5?=
 =?utf-8?B?ZmdmYjZuVWZPemwvOWZ1ZmV5cHFnWjhnSDF1LzgxMExDSmpKNFBnNng4U0sy?=
 =?utf-8?B?S1dRNFpZdnlrdkFoYmZNUC9IUHNDWWZWeDBJUGFHYS82bnJ0VnpJWWwyN1Vl?=
 =?utf-8?B?Z0FDM09kSXZXNVZybExvR1NlY3B3V2ROcFJIMjdlTzNTaFNyMk5VbmVrWWxX?=
 =?utf-8?B?c1IxdGk4aUdINTNHc01udVQ3bWMzOWFxRmV2bCtvK3JUemFiK21UZDhZa2pn?=
 =?utf-8?B?bThpMG1jSFhlYUNiZ3pCUWlORDMvZ29YUm5ZaWhDbHE0NDhwUVJWTmVTU0dm?=
 =?utf-8?B?d3ZIazVJMDQ2MXBnVXlVKzJmakNKMTZWeVcwVlo0Z2UrYm0vcDgyUkhIRjA0?=
 =?utf-8?Q?+cR/u4yxMKSRr70nws+hBr57Edu44qCe6pdr7AZAtXqM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90907616-235e-44b1-413b-08dda0b88410
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 03:00:50.8865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37LYVRfdrC6X9Ip4zNAzohGgXHf9XJ5qfxrsLeBpFFbcotJH9jGwGqzTbys1/tsN9f3H+WHMkmAOZh+BIK0CcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504

Implement these two common traits, which allow generic types to store
either an owned value or a reference to it.

The implementation leverages `as_slice` and `as_mut_slice`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kvec.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 1a0dd852a468ccda6ea1b521bc1e7dbc8d7fc79c..45f813f69fe0f338a83c577752dd3ba1b3b2003f 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -8,6 +8,7 @@
     AllocError, Allocator, Box, Flags,
 };
 use core::{
+    borrow::{Borrow, BorrowMut},
     fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
@@ -890,6 +891,24 @@ fn deref_mut(&mut self) -> &mut [T] {
     }
 }
 
+impl<T, A> Borrow<[T]> for Vec<T, A>
+where
+    A: Allocator,
+{
+    fn borrow(&self) -> &[T] {
+        self.as_slice()
+    }
+}
+
+impl<T, A> BorrowMut<[T]> for Vec<T, A>
+where
+    A: Allocator,
+{
+    fn borrow_mut(&mut self) -> &mut [T] {
+        self.as_mut_slice()
+    }
+}
+
 impl<T: Eq, A> Eq for Vec<T, A> where A: Allocator {}
 
 impl<T, I: SliceIndex<[T]>, A> Index<I> for Vec<T, A>

-- 
2.49.0


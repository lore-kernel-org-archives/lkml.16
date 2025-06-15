Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F10265286;
	Sun, 15 Jun 2025 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991047; cv=fail; b=CAjld5OD62Lqcclp0vzPXp/PI2rNfl1zYjJWtjccaD6EX2EwRmRqm/mX98U0PS0ZR9IVNRcYpVZCxD4TsqwE4J1AL4FSwUZjIdh4Sk4OvihQvTGKwU2UHsj7nlyWRpWDQcCTI0T5Qr20PP2X2EgvDt6AG8ZZa9bZE5pomLmz0WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991047; c=relaxed/simple;
	bh=0qcaxHYbHNLPOTsHhaTlJX2BljSDY5zeQ3iD9VHENwI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eqKYRdUqFQsXAiV6dSIpwOGGSOXxey1UsiAek2k+TahNtlNMYqyimLQvagESeoiRmjkRBdMwzoJjRyYOeI2qK6C9fWq8NPpSmLxCneh2KQKWnN0lvUPzqDbID5nV8+1NCYO+tWjjQ5MgtMxVizotAUpreO2ayBUNZ9h2IFfvRsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z8x1LWn1; arc=fail smtp.client-ip=40.107.223.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z8x1LWn1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X03PKvwcoLYPrehdECtQXIf+Pu7ag8lYgFV02ikgX3/f6sYLV25pbvfSPFAl8BYrjB8KUhwhL+d8Ey+sWJwx9zmzqygMonWR0NOsLs73DuxyZjLP0suOHnuicw/IrrsNOY2Q+8HixIKjapwrT6iR9490zMRIBPQUK+esSdT9XC61LBIFU6duwDPS+Lcvu0PD2WdYO3iI1LNQH9zYt4cT2l85+FZBuh+QSEEtrzdq2wkehuRqwWgsapyKX8l0k5CSilrhO8/SsmPQJt6MJZGOgQAo3zJuQUpY/U8u+mHv02XE9T2iWWJU1S6eBKCRrU4G+7l2luFHWXHH+35gUwXo7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDHpQK2oqEIgboVrFKNl31EYhLgFoVBR1H4T6J785lY=;
 b=N9i61DvmpyvoO+swBGtJnidIictwyvMTli4Kqajvfx67rQvajaHQLFvdF+y/EwZgkBHfGe45uOf9Hryhz2cRHNjYFxrHVO5JQ8RO577d0bVaMIkWjzQn+tcYrzjXb1ArAPorTC97lZfXlrEW+miZROJSC9Xbo86ifeEPI+s9xEk4MtQlxVFfKy4lk8j7g5rrdbA5G1EIBon0r2mQD5AETLBgt7lLD8hreSEr4BYdMbPlzSw2A7hMFEHRz2D9MJnml6YyUbXL/q6sUvJQODt+sJQBCl9Cb3rtGNoMeIdatesMPj9v4GCa8H/w40bRIzeQ0rrTnsyt12tArhWoe1CbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDHpQK2oqEIgboVrFKNl31EYhLgFoVBR1H4T6J785lY=;
 b=Z8x1LWn1bJpR7Q+9Ru6Vrbi1JwHVPGtPVOR+WwR65l9O7AsefwhUYN4W0aMPaBJ+cZoktMq6PZ3QS5A30gaUD902EVMShnM+92/8LNR2l3ZHv2Mu8PbiyN7LnBo8WWtK0uYdzPL7lyaM3U5X7JtyWme1db4Vj00sw2Cu4N/7FfWWJaVemcWbfd3epr/0/ZG9lJx902Rag403xo/FkzAQyI6ey6HVzXPfMju7qm1anB+NGgYiEe9aOXsbAMuE6Zue6jQr3c3j24MAcZuw03l/Nt6hEB4KvP8XUqg+QJPaxN06mXd14gTNaNNui6QqCOwHI7q9fqG/4FWuZzxwCmJj2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Sun, 15 Jun
 2025 12:37:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 12:37:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 15 Jun 2025 21:37:09 +0900
Subject: [PATCH v3 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-borrow_impls-v3-1-621736de7f29@nvidia.com>
References: <20250615-borrow_impls-v3-0-621736de7f29@nvidia.com>
In-Reply-To: <20250615-borrow_impls-v3-0-621736de7f29@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0274.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 45460e9a-ce6e-4ac4-2fcb-08ddac09606d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnYxZXYxL2UrOEJhdFZGVUhSckJNVGppKzd6Ti9FQlduQ1F0Rks5RG5mZGlt?=
 =?utf-8?B?aUlVOFpQUTFRUWJYcUUxUVZyS3cwVjlmc2xQazMvVjREMUowYlY2ck1raUk4?=
 =?utf-8?B?Z0M3NXBTa2tsdS9zWW5vL3VGNVBFUEYzWWdoT1ZoK0x2dmJaakZ2Q1AvNDY5?=
 =?utf-8?B?Z3gvM3hBY09ibTB4dW4wVGFhcGY0UEJQQUFLandYQXVkVWxQb2dJdW5lSmIz?=
 =?utf-8?B?SnZOR2kzcHEwOVh6V1pYSmY1SGlNVjYrMnE1U0QxNjlsYTNVbzNTdFFWNElU?=
 =?utf-8?B?dzJOdy9BYW91OEVTekp4K0ZVWXBrQ3p3MWJDVjhKMHdzVUd6c1N1RVlEWEVm?=
 =?utf-8?B?QVBNVDlpb0l2cXlneHdoWkdIOVdyY0MraERoZUFETFVKRXJkYlJXK0dDcEtv?=
 =?utf-8?B?aEN5aWNmaDdqaWxJSk5kcDdwQ0o3TU5UL0diQnNmR0Y5TGUwLzNoZHorRklU?=
 =?utf-8?B?VHA2UlhNa0JKNUtEU2JaN1NqL0d5aDU2K0FRZ2xwZHlibnlqemFMdmVOd01F?=
 =?utf-8?B?THFxNGVhR2xkL0NjTkFDSHE4Vll6ZHhROHg2ZlkvYnhQSWtXNUsvVHAzVlhP?=
 =?utf-8?B?OVdPVXlLbTMydWxyNlVWak9SaXVEY2FMRDdkOHdrd29PSDJqakVFcTl2aVUz?=
 =?utf-8?B?Q1huaTR6blNoK2tvRVAxRmVVUUF1S3lhZ2IzZkZkalpiV1ZWV2lFQ1NvSldK?=
 =?utf-8?B?SktVcGhpL1JXeSsrRHZ1aFRtTHpNdTlLWkVnWWNVWkJXSlE0WkUrM2lBbHFh?=
 =?utf-8?B?d3IvWGVseU4zcmVCM0hES20rQURCQ3gwZmI4WUVUeFRjUE1IQzJNUmpVTDFl?=
 =?utf-8?B?WWx2Q0JWWFF1S2ZFOVZaczhudVVjTHV0UXJwSHRMVTNjYUpTUzRzT2ErdTA5?=
 =?utf-8?B?N3R3MzFnN1JzTm45ZDh5WE96TE9TZEIrczExeUV6djUvRWdXVkNITGZTS3dl?=
 =?utf-8?B?UHZ6TC9VR1dueEtlNmp3NUVUMUpPZVpEZFhUUm5QMG5KcCswS3NMdDYvSUJY?=
 =?utf-8?B?Qm5kbm5uOHR4NlBiam44V2FsQnFzcnZ2ZHBoWFRhdHllZ1ljOS9wWjljL21t?=
 =?utf-8?B?Y0RHZjV2eUVOVUkyaGhVWGNSR1VMTE1yQy9XeDZEU3pSVDk1Sm02MkdlQTFH?=
 =?utf-8?B?aVdFN2VwbXFyK29acWhMMGZ1ejhOK0Era0Jqb2xhdEJhTWJiVXVHWnlNTjZL?=
 =?utf-8?B?SW13TzhVRXFkb2JmVTF2LzNCM1p2ZlFXY2ZiTEJiYldCcWRYNlREK3ZWWDBk?=
 =?utf-8?B?dW1zRlR0VGRmcUtGNkRVUDN2eDJLRFJ5eGhDd3ZXbUVvWCs5Wjhqc254cW1k?=
 =?utf-8?B?aHVMd0VkZHphSmlIdVRCSk9PZTZjVlNuUVdoNVJBTmRYbVpSbU5ENDdGZTUz?=
 =?utf-8?B?aEJCbWZaMTVLNlNhRHhnR2V1ZWw0TlhOY2xySXVaTkE4QXNRVi8rNk8rTVhT?=
 =?utf-8?B?cTArTWxuZjdaeVRYMjFmYzA0Sjl0K1Z6MVRsLzhITWZ6cm16VmJFMHJlaStE?=
 =?utf-8?B?eEdyOWNtUlZObTRIMjJvMGdZeVVzSSt4T2IwR09ybDVFUjlHRWpYSGduQ2t5?=
 =?utf-8?B?VksvRnlmKzZxYllTYldWTUIxOHJscFJGaFo3T0l4ZUFrclhTUGlPTjhqVWs0?=
 =?utf-8?B?akU5Q3BRYWVvNEc2U01LYko5S2hKRElFYU1PbmdWRzFqUEtHaHZXM05XTXJ0?=
 =?utf-8?B?R2lKQWpPQkd5VVlOVzNYS2JWNzRlQVBrQjNzdnl2SkRSU3piSkNST0QwRVU1?=
 =?utf-8?B?N05XZUtuTGtJSlQ4elpFUDlXK1VNVXZFTy9pTFZia3U4ZUYvcUpVVkRSdVly?=
 =?utf-8?B?M3F2Uk1DVXBSRGsvaXBYNjFmSG45aTEybFhLeVZLRm8vdHB3Y0hvazF0K3Fj?=
 =?utf-8?B?RmtIdTNlZ21MZFhJOHlFbzlabnc4RUNUQmxWa2FWa3JhQ3ZsN2pvOFJlK1ZB?=
 =?utf-8?B?a2wzRHZwbWJMd08zMTREbldJNGNzWHVIUHYzR0JzWlJhY2M3d20wUjk4dDNs?=
 =?utf-8?B?UG9VanNwQXhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhTMjNtcjNCYTZ0VS9sNlJ6SktlNzlRSUxxbkY2RE50aU9uWUk4eSt0azV2?=
 =?utf-8?B?VmR6eEg3TVBaYVd2NDg5TGE3TC9PeHA2U1RnQmNDSkNCWmlYRjBDMFEyMHc2?=
 =?utf-8?B?Q3IvaWJ5R3BSVkhoWE5VblN4aDJYd2FOKzg0Rm9xUUoveDZydXY0Z05ieFlC?=
 =?utf-8?B?QkFlM0pxQ0t1STRhczRsYjAxVEtSVjVhNVRnZzY1WTZMZWhRTkJaclZmOVFZ?=
 =?utf-8?B?UEZjZktqaVh1Titvb3czTVVJeFFHajZFM25GR2hxMVF6VG82anl4ankrUnd1?=
 =?utf-8?B?NWpMb2JyTkpHSUhFQm5OQzQ0NloxL2NROXhpM0c0dEdZdXFmUlFERld5b2lh?=
 =?utf-8?B?Q2F5clVHMlorK1NrVmRLMjVPVzRuVHdtOGhuY0lmdDhqQXBpNnJpTVJERU82?=
 =?utf-8?B?SHhpV2wxak01RkFsNWdiRkRaQllOWEY5eEQ3ME5JcEpoazhjdDYrUVkzTEMz?=
 =?utf-8?B?K0hpUWZNRGRINXRCT1Q4cEEyYlZnUUtmOUJPUUtOazVWODUrbzVseVhyVjdG?=
 =?utf-8?B?djMxL1FUM3JqNnpxUzFWQXM3UVl0cVdSSjJpQlczQXRPaklzcWdXclpseUV5?=
 =?utf-8?B?ZUozOXlLdlpTWXZOaTExTktQbS92U0pORkFHWlgzTnNDTmtIWndrMWlwUUZ4?=
 =?utf-8?B?dElSTU1DdytGVGxQZHM4anBSaDB5VXRoQ2JNUG1nVXpOU0FmWkp6L2Y0cVRI?=
 =?utf-8?B?cC9Ic0NwcnFOdnJRdzlDSU8xMW4vdjY2cWpneUhtN0s4c1VVV0g2NnFIU1BW?=
 =?utf-8?B?K082YzdMaGtoTDNvazBuWUQxejcreWRPVWtGMHpTdExkQUpEOVZWRkhkeERI?=
 =?utf-8?B?Y2Zsc3hzUzBlalNJcW90M2lsTGlsbmNPYzV1T0xoOTJlMmUrRVVISGY5T3Yy?=
 =?utf-8?B?cjBQNjhCNURvVUFJSkRxRVprVVdaZEJBUFNybGZRbjBSSW9yZUtsNWp6TTNv?=
 =?utf-8?B?MzF6UU03QkVtTVRkZEZNUVNOTEhueVVDKzBRam1FVFhkUHZWamp6ekZIRTZP?=
 =?utf-8?B?czVOd1Fub0JWRHdmc0RTaTdXd3ZRck5rVWgzUTRVaUtWc0pST0h1eVIxQVVX?=
 =?utf-8?B?R09Xc1dhdTM5bmdnMXRoaDYwbk5wMENmelJXRkVlOWwwYy9FOUlKUEZSZmhI?=
 =?utf-8?B?VXRHUlBoMVlsaGQzeFpEdWtFRXNUQUdYcG5GaDN5WlRIOHhhbkZQb1JmMzlB?=
 =?utf-8?B?OEo0ckpacC9vSEd6WFdMWFo5THRDWWpPMFE0NHRjbFN4cmJlcUoyQUVPTzFz?=
 =?utf-8?B?RmowVjhQdGNoOXpjeWRxc2JFcFFyNmJjcmwzczB0ZCsxR3h2bzFmcUZKaFFt?=
 =?utf-8?B?TDlKd3lKZ1hBNGxPUmtTa2p4ZEx0V0Z1ZmFGRmtibFFzTXNhRXpVb3ZwZlg1?=
 =?utf-8?B?VEh2TjRTVkk2VW5GVWpyNXRRRTNHT2d6blF5SnlKRmgzV0NpVURhU2trMFZ2?=
 =?utf-8?B?WWg3QmlrQnRyQlRjOVovTUlaNGQ5QXlyRC9FM2w0ZkxBb2VRNGNNK3VGY1Vw?=
 =?utf-8?B?WjRXekFQYy9uZHJYZmJtdGVjaE1HeVhmTThWNzFGMTB4TWo0UkRSNHpWeElS?=
 =?utf-8?B?WGZwRHlXNUY1d2p5NGZFWkt0OVlCK1dtenczaEc2U05TMzlVaStzcGpTMVdB?=
 =?utf-8?B?a3NHUlBYa29FdWlSWTNWUE1ZNkRzL1R5cVM5UjhnMnNvTUM2OVpxMjNUV0x6?=
 =?utf-8?B?RTdlVjNNUERMLyt3bU04NWNlbTN1NWRTUHByeXpWS2x0K1VQcmdNWHlkdXpH?=
 =?utf-8?B?eTRCWkNCQjZUU0xmaFh2NVYvcVdXMFJ6UmhvUDBBak4vYkVrTzFGRHBoVERl?=
 =?utf-8?B?VjFXSzhxMU5BSHZtb2NUbXhJU2dJY3dQQmZucVF1aHk3NEkvbDZTK2ZWall4?=
 =?utf-8?B?eUxrNHZXNzRIa1F4UnpzWmt4azMwNUJPcVZCT3hIdFN3T3VlaVZsZ01qc05x?=
 =?utf-8?B?VWxGOXpQUHBBL1F1SEdwN0JUZGZydG16VlFUL2FxMjM4V1I3RjJtWFVWa0JM?=
 =?utf-8?B?VDRWazg5NG1ETHQ5YTI5Ni9XTithSi8rb2VZVnBDeXZzdnFHL0lTSUVZVFFw?=
 =?utf-8?B?cmFuLzNaVkNtQklXWnBFVWNOMUhJZWRvb0RIa0o0MEtPNXZCcUN6VzZCTTFW?=
 =?utf-8?B?NFhxNHMvTVlCZ1dEVTFadkEvbGxseko4SklGa1ZBY3RzR1FBL0daU2kwVU02?=
 =?utf-8?Q?aSbHQX8rfpo7armDIle83WEWzlDJgLcqj++IjJxF1Aeo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45460e9a-ce6e-4ac4-2fcb-08ddac09606d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 12:37:23.3106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJVp0B0I7jfxbb9BjnH25t03gIclPw8o5D2Ff6urllVXJYvaJHtpLt0yKHGAjsaj6l8b0FRoKj/pCvVV7ZBciA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278

Implement `Borrow<[T]>` and `BorrowMut<[T]>` for `Vec<T>`. This allows
`Vec<T>` to be used in generic APIs asking for types implementing those
traits. `[T; N]` and `&mut [T]` also implement those traits allowing
users to use either owned, borrowed and heap-owned values.

The implementation leverages `as_slice` and `as_mut_slice`.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kvec.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 1a0dd852a468ccda6ea1b521bc1e7dbc8d7fc79c..cc8e7499427181e79af4a54576a7af23ac8b1bb9 100644
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
@@ -890,6 +891,58 @@ fn deref_mut(&mut self) -> &mut [T] {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// struct Foo<B: Borrow<[u32]>>(B);
+///
+/// // Owned array.
+/// let foo_array = Foo([1, 2, 3]);
+///
+/// // Owned vector.
+/// let foo_vec = Foo(KVec::from_elem(0, 3, GFP_KERNEL)?);
+///
+/// let arr = [1, 2, 3];
+/// // Borrowed slice from `arr`.
+/// let foo_borrowed = Foo(&arr[..]);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T, A> Borrow<[T]> for Vec<T, A>
+where
+    A: Allocator,
+{
+    fn borrow(&self) -> &[T] {
+        self.as_slice()
+    }
+}
+
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// struct Foo<B: BorrowMut<[u32]>>(B);
+///
+/// // Owned array.
+/// let foo_array = Foo([1, 2, 3]);
+///
+/// // Owned vector.
+/// let foo_vec = Foo(KVec::from_elem(0, 3, GFP_KERNEL)?);
+///
+/// let mut arr = [1, 2, 3];
+/// // Borrowed slice from `arr`.
+/// let foo_borrowed = Foo(&mut arr[..]);
+/// # Ok::<(), Error>(())
+/// ```
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


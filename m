Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C43218E1F;
	Sun,  1 Jun 2025 03:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748747208; cv=fail; b=QBlKQK6GNtvklur6FPQfH8uYd5D77M/odxoWHBUGJtxNbIyGanpJGPVQ7hEQ1mPKecAM3hpc6EcdiGnlERX3LhegBlQ1AB5alB8X/pG0T8KQlmQqhKB8L7+zxsaiAajrDBEBMj38mQyupEJxwVihYYWeKjGkNssSDZmeLO/ENyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748747208; c=relaxed/simple;
	bh=kahWh17QwnLhDp7NEAlS5hFMYEIQYkR0LCz3qFR9vWM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FlAaRSReG/EENg34Y6mWDBxrpsz6D4SfjSejG6E1h+MNz/fmjRb1c3aclhREV904t4vlvU9TF/MSsYwJ8UdgFgtXOSkVw5mXLhnSctPK9WsEFmX6e694Zvsm8K97UQmi/yZs7elR9N5ejSX+Vm96lQFPCenXjrU1wOlZEuoXEWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UmqTZM01; arc=fail smtp.client-ip=40.107.223.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UmqTZM01"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xm6iIXHThxxBXbiO9Q681O/yQZFXluWOdOcYzJEPJ015bYuEzLJYywQZ/Zz2y6N5US3g8aB8QaTmmsYkzzn1Vk38QAuwYB/iyqAWQMUA0POTKMb+Q4i4nkcGjXgiaEfgIsyIzsqQcE68j/kGPhoHLpahpbjuL2wNSqvCDGggqE1FwOfNfuZDD0TKsJLZuqarmi01v/121q+XBsUjRkRJ6OinqxVSNRgxh3s9sW6TmhL/PArNITXbJAE8muj6KEsKyK73JAcwfOh91nUyi4on61jGiuAVvq9It0V8Zs3QETSqh4J2kFwu8JXMMcDtRBTLt1b9uHrB7M3oM0vk4XMylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kahWh17QwnLhDp7NEAlS5hFMYEIQYkR0LCz3qFR9vWM=;
 b=V/MIW+kKJDiBgc60aGXcbI+NMtq0xM+j5NaVqlgNUMkeK3NGy5hkRtaYw3RlHyHjWxZMLvo1iosGlXOzZj6b1iSKlPxvYps9EA2crQ60rdnjFSj5IILs8nZSBYySLTXlnjfiYJOE91klwm6zM2oHanl0K5X/SjfOHUR038yYmgzVeoSZ34YXSyz0fyvqDwzm77R1UrWHoC6jMlcJnwtjBDkwbzBSxH2X94iYK3N02Kn9HDXDBWbGgkIdtpGc2h1NyIdh+gI+Z//FRIonyZWI5FvnIch+yZ/Iy1maOagMMzr/mmu/g50KOS2hracyetuuXan8ZFiwuEpaAO0Apjnitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kahWh17QwnLhDp7NEAlS5hFMYEIQYkR0LCz3qFR9vWM=;
 b=UmqTZM01A6FkBOyVd0XWWG7HkyI2cTnq44mJvtLGJB+oIwAsq2T2VwjeO/CYJ3VszRjab+jxFYUR9ybF77hDndBfS5o6VW1FziRE1frRGowIsOK75nj6vK6B2czGSxjsKCK4MsSJd50utaXpqfKGwJzfrzem1p7Y0GJ50ihnnDLVVeTzss8UuqR4aLGATRIU4gRqBV5ri7XEXz0Pe4et1roK568+7yMZWUKm3jrr/m/+uuAlvlu9Kg/UEibMQLrKAQEGm9wxPHrRcOSOUMwR1uepfDurwyklmsHNGbzdfclyNEcpPaJ1Qt8Rbgnx3puoSIkeIGyPlq8tLzOdS5dd4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8604.namprd12.prod.outlook.com (2603:10b6:806:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Sun, 1 Jun
 2025 03:06:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Sun, 1 Jun 2025
 03:06:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Jun 2025 12:06:40 +0900
Message-Id: <DAAV5979EOWO.37D9QE70YWR4Z@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Arc` types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-2-e1caeb428db4@nvidia.com>
In-Reply-To: <20250601-borrow_impls-v1-2-e1caeb428db4@nvidia.com>
X-ClientProxiedBy: TYBP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::33) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: a17a3e14-9a54-4b93-1d2c-08dda0b95658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkwyZXhZZjJKKzIxQUpUYU9UTmtFRTVadDRJV01Wamp5ZnRVOFdyNDVyTGhS?=
 =?utf-8?B?Nk1maFR0ZTUyWVVUckcyRVE2U1hBT01PMXNtb0FhVHhKSzJEaTNkZWJGWU9Y?=
 =?utf-8?B?T1F4RDQ4S2Z3b2pYZ0RMUnRHc3pDbFU3UlkwMlUzbmM3SU9GQW1OaXk4Q0JS?=
 =?utf-8?B?Q2FZU0o1TE5lQTNWdGlKYW52aXhTNEo2dlZSL2E3TjlBd3RZVklrZWgxa2pa?=
 =?utf-8?B?V3QxWWVpd1Z3Unp5L1hOOFpHVll5Nk1zbSt3TFZPSGp4eVZadXVGeXBNaVpO?=
 =?utf-8?B?VFpOaHBhRDZlcjk2RU1ObVZtZGVuZ050dDc1aVdqZ1c5YjN0TTFYK3JJY0hh?=
 =?utf-8?B?dnpRQkRxVlNqcGVPbjRTYXhVeXNXTGZqeWpoeFZyM3NtLy96YXlQRjRNNDh5?=
 =?utf-8?B?N1NDZE5IN1E0YTd3MUQrb1lsOHF2WmdxYno2cjd0R01VUEZTVmJVMTNMQjJj?=
 =?utf-8?B?YVNieTdONkRWdGJYV3JyQWloOUlYZyt4cnRPT3E1am8yWFdIT09kdlJmVjYy?=
 =?utf-8?B?UldYbUVVTXpLdjZkeGhlbjlDbFUyc0ViemhCeWJHMlJlZ1NNODJCUk9Pa3Fu?=
 =?utf-8?B?MmtyZVEwUVJDL3NZQ2h1ZFpKNTgvUndyM0U2YkN5d0hCZXdxRW9tNVRwa0J3?=
 =?utf-8?B?U2dNdjFGMGZHdUgwOFdwUU9EYTgxV3k5WlFSbHpLZXpnUVlKcFdjSFBHL1Jv?=
 =?utf-8?B?cTZIelJSU3RpeCt3WHBOT0hwRnNVaGVWYk9Beis3alBFazZjTGZkUmRiQkd2?=
 =?utf-8?B?L1NtQ2wzR2RkYmc2aXlnRU1WeWYxclVQdTVBQTZkTWs5KzRmeWVRVlVXWkZN?=
 =?utf-8?B?TzJ2UWQ1RHI1WG1yOG1xZ2xMMFRwZmg4WHBQcUUxOGJGWTZwYkJxaFdmYzFw?=
 =?utf-8?B?TWYwVmFLZTFNdVNSVHQxRVhVbUN1RWFDUWpiVEVOdUk1WkpXMXRidzhCRGRJ?=
 =?utf-8?B?NjdLRkVsQUE2bFFsK0tlMmxSWG1lSXEwZUhWSy8ySGF2ZlBRSWdOb1ZGUGRZ?=
 =?utf-8?B?QXBGdUprQ0x4dmtTTGU3aVkvRmNsUjJOR0hMRlUwVWw3WUtMdVZGeFJWZUlL?=
 =?utf-8?B?OGx6WkVLa2dSSU9yL3BKRExSWVFRUlZvcHZEUVVOcTJXZUhXYUVtc0JrZU9R?=
 =?utf-8?B?QXJkSURPdHROR3FFalNrK1kvdmpGenhtZlRTbU00bGNIREhXUTJaYUNmdmtL?=
 =?utf-8?B?Mnl2d0JVOVhySlpNclNmb3BkMVlkNWNjc3lXN3hjU01reEN5Ti95aEZqMld2?=
 =?utf-8?B?ZVlFT0VpaUNJZXdObFBlbjAwNG5abDl0TEFBTVBhMUNDY1hyaEs5eUhadUFm?=
 =?utf-8?B?SWtSYTB5aVMxL3Rua2ZLWXM2M1NDdENoMGpBYTRnSmZIbmRPMXZ5cWVrVDc3?=
 =?utf-8?B?YWE1Q3pEelBQOG1JU3ZGd1U1K29JQXpQbjlMYU5DdWZMbyt5bGVVdkh6eTU1?=
 =?utf-8?B?NURyZ1hMSDRMUVR1WGFseW84RE1kTXUzTHU0djJVOHRYbWUzK0FMRlcvOHhT?=
 =?utf-8?B?eFFiWm5vRSthS3plVnFWT3RzZWxicWFLRnF6cGRmTTVvYk5wODBUTWZ4VmRB?=
 =?utf-8?B?UGI3Wm5rQXNXS3JhT0ZhUWZrUmY1UlNvOCtRNjZLMUs3emU2N1gwcTk5ZEFt?=
 =?utf-8?B?Q2hmdUR2MGtmYWNzYWM0bmsxWE5OaTNtN21RS214enJwTlVPK1lHRnNFNVBN?=
 =?utf-8?B?eld3Y244RHczZ0grV3Juc0RWZll0dU9LU0xsbW1ZK2tiUHFEWVlKNUpucmND?=
 =?utf-8?B?ZkdpTWtFSldCZWdmQk1BQ0NHck45NWN6STB2ckp6WVNXVTFCWFg4REtXcWo4?=
 =?utf-8?B?MDBQalRqZVFpV2hnMnMyeFlZUWJzanliaDVhUlp1YnUwK0Q0VVhvTVA5K2NY?=
 =?utf-8?B?ZWwxL3RjTFM4dDNLTHFLVlJEamsxUEltNjZoVXljeHNWNEFKc2NlR29XNlNP?=
 =?utf-8?B?VFIxVFBoaGg1UWZnd2JaaEcweUppdzV4cW5qNGlRS1FTeEljbWxUSWloRkp4?=
 =?utf-8?B?V1V0WTA5aGNRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFhBbFROU0kxTms2OGdkRlJFZzAxQVAwUDBmRlZMWFR2b0tHZUFEZk5hdUR1?=
 =?utf-8?B?UE92c0xOdlpaQWFMcjh5TGRqcFpkV05QQW5IbzF2dDhBbzB0Q1U4SDRDV0Rn?=
 =?utf-8?B?bEhoOWNIc2F0R2FZVXNKblo4Y1lJTkdLK2VmWUR0QUh2azhoSWZrUk9EQTRz?=
 =?utf-8?B?TmNTYWtyUlBLb2dJU01UZ1huQzNZclg2Njc1aUJzajFGZWF5dWdlQkw0THVq?=
 =?utf-8?B?M2Z1M3QxWFV3dFpKdXpWWmVBNyt0YW9WbWhqc0tZciswSWRwNnc3REQ0dnRH?=
 =?utf-8?B?QUEwMVp4cU8xYWZOb0NlSkRDSTJNbEhZN0pwemF3M3BvTm5MK0NKek14OUN2?=
 =?utf-8?B?QXpDVnh4ZkE3QUpkcDNvT2oySGI3Q1ZieVRDV3k2eU5OTXoyRWFnY1ErYTAw?=
 =?utf-8?B?NnBVd0d2MytxU3Z5MU9JS21keDVVZitFdEpHVi8vNWkyUm9aM0U3cEdvZWNa?=
 =?utf-8?B?T3JNMUdpQ0FFaU5RYUJ4Ull3Q25DV3pZaWpZcEhPNHNHYnNndHk3OW9iSnI3?=
 =?utf-8?B?RkpUWE1VcUJONGQ1d1dheUlyOFpzQUxQVldtL3N6Y3BDVkkzQnVVMHZmRW9p?=
 =?utf-8?B?USt5V1NEZ3JqdmpLZ1JyWG1EQ3pDM0ZlYlNpVTUxRmhtUkI5SUJ6RGxGc04x?=
 =?utf-8?B?SXNHVkFiNkJHWmRJcFpLRTVGZVZWN1Vha1QvbUkwK3RocDJ5ZlFnV04zSDcx?=
 =?utf-8?B?UnVwKzlxNXpjMVZiTDl5c0FFUHlXRTJ6anB2MU9vMVhOYXpkc29YODhjNVdZ?=
 =?utf-8?B?ZUZTRWNBaFA2cjJ5b09MYUw4c1RrRE5ia1lHWTVjRU5xRjNlRE0yV0xHSVZi?=
 =?utf-8?B?OGNwaTZiZHkyQ1kwcDNmZE1tSUs4S1d4N1dFN0x1V3VoT0cvWkdIMzRpRS8x?=
 =?utf-8?B?T3FIZy9rdVoyQlZqc0VBUWVNbEphbXo3N1FuU1dqeTJsNEw4dUI0QTh6UzVn?=
 =?utf-8?B?M1loLzZaT244T3JQQml1eGZZMzdVNlJoL1Q1RGVSTnZwMDFiaHlCaDlHOUlR?=
 =?utf-8?B?enBDd3p6cS9GVGNNUWJRS2dIM1ZXY1FTcHNSYUV6TVRZYlhKOEZobWhSNHIx?=
 =?utf-8?B?eWRiZWZzZHdiZzhkcmxFYzEvTjRnSkxadkJZWEpFVXdZRnJQS2c1SHdoVmd3?=
 =?utf-8?B?YzVmdS9icndja01rU0NCTmZoOCt5ZVJBUStOcHMxUXp0SUVySkNnSjZwSGNK?=
 =?utf-8?B?WUFIdmFxT1hoVXYyanlpUjRSN3N2Wkpxcm9KU0lMZ1NDdEFOZERrS1VJUy9D?=
 =?utf-8?B?eWRTSEFnbnlFVVBEQ2NmcW9YR3lqSy9XcmxqeURvUjV6SVdUNUc0QVBIbUN4?=
 =?utf-8?B?bnc3SFN5TkF6OCtCYzdqVW5md2pIMTJSdjFWZFFQVHNvdzZFSGlGYnZRWjFi?=
 =?utf-8?B?ZC9tSUJaYXJ3MHk4TXFBSkxKVG8zUkYvMkQ3YUxiNENrSy82ZnAxdHA4MVpi?=
 =?utf-8?B?VjlJcnJ2enFSNUZ5RXJkY285V0tRNlZVUGpNNDVGMEgvZjhSUCt5NFd0SU5N?=
 =?utf-8?B?d29BS0o4THF4dytQUkU5UCtLQ1B2WUFybUxwTnh3azNhSzdXUWRHKzlKMW91?=
 =?utf-8?B?K25NSTZKL3UzamZpaXU0STJBWkZtN3A1SFRPWFVCNkpBUUovZU90dVpFVWp4?=
 =?utf-8?B?N3lMakZPWjdUdm1rQU1QaDJzYm5QZlF1QUZMTlRIK0t0NHA3a2Exd1IyM1Nr?=
 =?utf-8?B?ZE1ncDBaM3l6a0JsZlNNN09oV09xSDJEc3JEa0hUd3MrbEYwTDFxVUlkYlZM?=
 =?utf-8?B?Y0NMZW1vc2JyaUs1UzZkTUE2aUs3L1NmelJxY2NpeVRCK2hRVkRhNklMVDIr?=
 =?utf-8?B?MXRhMkh6QW1BazRSOSt1b2FqZ0FYSVcyUkpiTllVY3NzUG44TkJuTEVHSC9r?=
 =?utf-8?B?bDNzYzJKMG53TjNzTDFHVWhwK0grK2tRQllJRHpYQXJBdWRKb3k4TmhWc2hq?=
 =?utf-8?B?Qy85RnZybDZ1WWhIV21pcU9zbzFLYi9Ea3o1ZTdDL2dUTkVrQXhhNmkvcGF4?=
 =?utf-8?B?aDNrcmlwT043K29ZNU5DL29DSktPYlJqdDBqdDJuNm9KMEhYUDdvWWllTGJN?=
 =?utf-8?B?MHJVZGtidFBtTFhRR1ZFTUlJSm90NlowejU5dE5kQnd4cENONGVpT004YTNB?=
 =?utf-8?B?ZXRwVGptSW4xSnpOKzhKaHZsS3lsNFFwUHpXSWhQL3haYUs0Y0lJbDFaeUFL?=
 =?utf-8?Q?IxtWMPqpgxvDeD07fZA7Wf/0OUbXfMIFsqtiZTUkgUxu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17a3e14-9a54-4b93-1d2c-08dda0b95658
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 03:06:43.5592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuaFjYdarHZIemQRbNdduAzyyfah315BjfHpEn15LUamyixxDvjiNaw9togE40eCoLvk8UWYIuz6xRwg6Jw8gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8604

Typical noticed-as-I-sent mistake: the prefix should be "rust: sync:",
not "rust: alloc:" (also wrong on patch 4). Not resending just for that,
will fix for v2.

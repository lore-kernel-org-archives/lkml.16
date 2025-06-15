Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262B2676FF;
	Sun, 15 Jun 2025 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991052; cv=fail; b=pSxuGwTMXPCqIzjMoGL0pcacedwER9Nu5h2amZP9oMcAkoyjuEs2935jMFMVlnDlK5o5jmg8QWEBKcB/oK38FthNWxlPyetyfeaI+NUaONdJOXW4JiJxnkqTX1Nm7kuJzz+uGu6MV9TP0N4kWlk7v12ZADDNykzUVAHMCLOeqh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991052; c=relaxed/simple;
	bh=s+BXPKlarqlreEA5eVRW2UdjHNhQ6f8B7ZGVWSM9EdQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TyAzCmkq2IVeYebuLA2UipjPWL9M2xVQAt6l9BazOL4Gb3HOfTatg88QYn3+IMcDoPGqFtoaYVdz13rWPXHG6HKfwPVki2wGMakVxztwmcTaBGGBYMv9ipqaBD1SgBvCXNFYWm2k5Xi74666vJ+qdFVnTW0IyU5MRdzAITsjUB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UWBvrrAL; arc=fail smtp.client-ip=40.107.100.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UWBvrrAL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAau1n8Fq51e0+qfO0w+ZledL8Cf9V3LoXYUUiUJlaUFyolFX6YvA+zn/t784+cV+5lMLurlroqw5rlnazoS4GsgKiTCNiLVhdAqw8wokWHkC1+eql1QOrvo51vC+Rk9NDN4IzUlP3EFGxDdt0LL+DPMvs/EkkXEUZfsnDN999vAt1RBQ/WSqZeP4+TAttvofVwY8/hTAb/rXYE5nLgLS613AcgvNXL5DKNGbDDROoMuhY/C4WR7kA7NXgyaqdMYsMMCCSJ5KBaI9beMNF5dYfs6hUAUEgFIkIEKY9nUoJWs6/s+R++J6gTekIBH6nJNsCoL5/rICGuiAC8PN8e5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/s8a1Xq3bRnL6zsjuEcTB8EjM+t3aWhz2UAznp3Wnc=;
 b=TFP0CDhIfvgL0T7g3+NNoE95T6UC89lP1fjB3e7Gi4cgkrB35ivtBsgxrlLyWIB323/ITUod7XLmBEj0s351+83pQ+wR0hLOxi1DrI+5ugD7HYbpdNaf7Uo1hEF+WTvZ74oAgr6F3MoiZibxAVwDYslbnHBq0fQiacpPowcU1kt7jgyOtClrIN0y1eWheMbiR54xmrHEvM/2yt9ebzPBs/LInSSASJKtfnDl5KzZOjr3Ib2CQJgZx05Fja9joIpgYHM+Ht7SaGbdHVOOxkhPQ0dVBMnO6eUlr2fud+U2SvUXlIs0gz3GCVtldYvyw+t5eZ5cwZweSr3aHLhsjTIlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/s8a1Xq3bRnL6zsjuEcTB8EjM+t3aWhz2UAznp3Wnc=;
 b=UWBvrrALkD1qHeq9A3tmPli5RwmkucHpbaPe1vGQf4DAExZnA3nm0popjGmjknmIwCy+7S0vYnhFEtC3ldAJTi4JF66VELT2stfOlJ++ZJb38MNg2FgRSy1DCE5rtwLr+VQGY9h1v9JtGUcS3NCeR2JgS4Mia0IJ1hSoVqikgAmi+ctZ3TPCho0XkqRvCv/GcddN3g+aHcEuqPrwS6TApkHV0bM8+tBoBF2OUiQafSEQhohgaIIadiTG3nUGnRkYBzB/DZ9aKUxY1sN+TBS7DLCPCPa3+h8O8T2IUBOo0sZA86FAT+7Dl7c3EIO5BmSaIqDlJ7bt1TueQqVN7ovb6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Sun, 15 Jun
 2025 12:37:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 12:37:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 15 Jun 2025 21:37:10 +0900
Subject: [PATCH v3 2/4] rust: sync: implement `Borrow` and `BorrowMut` for
 `Arc` types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-borrow_impls-v3-2-621736de7f29@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ae2f26-ee21-4367-a2a3-08ddac0962e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHAwd1lWZEF2WWJwNU84ekpzQ1VKYVlEWmJlTGZLa3hkc3R1NExoSnBCSG9M?=
 =?utf-8?B?WmthU3dTY1VaOEJmdVZKR05uOGtnR2pPNlo0Q2VwQThVVFVraHQ2aW5FZDBl?=
 =?utf-8?B?cGRHNU9XajByNWkvd2Fra0krY2d0U3BycDdhSWNZenRISC9GaytUd3V0MmVY?=
 =?utf-8?B?amtzZ0FEZ2dRdGpjdHREdjFENWxSMTNzdVd5aEJWUW5vYUJXc3RldGZOME9Z?=
 =?utf-8?B?Skd1cDNpcHFRKzYyd3lJTjhpUk9FYW94VzBEOFdNckNZOG95VVFPQ3dYT3FT?=
 =?utf-8?B?ODIzQnVnUGhOQ1BsdlgyamhiQ2ZzNDh2OTZxQUtJcXRWckNlRzB5MStEZGw3?=
 =?utf-8?B?d2hvN2hFTHFnMFduTHRmTVhkNXhMaElIQVFEZVhmUVRBSXB4SFhZVVVCcmdL?=
 =?utf-8?B?YnZ4RThwSmgzQ0liVGs5bHhxWW5VNUpvL0ZKK3p3U0d6VDArMnpOd0xjd2hx?=
 =?utf-8?B?R2doQnZrb09sV3o1M1RUVnJOTGdWd0FkNy9IL1ppQUE3WW1ENVVsQk5yaE1r?=
 =?utf-8?B?NEI0VC90WWZGNkhlaGFlY2ZOWG5KYUY2UG1vajYwYncvamlyVkowdmkrMVdN?=
 =?utf-8?B?YWF5ZlNKYWZUNnJPM2pqSWdtRk9kUWpnVnI5TmUzTWt5bk4xK3lGSENGNDJH?=
 =?utf-8?B?OGkzQVpFcWptWTNwME1tbTJEQ2U4VGx4V3FLSXhPTjI2czlzeXdCMGh4REp4?=
 =?utf-8?B?cVUzN3QwTWZrdlQ2STVVdXdMcHJMb3F3cFBXR3V2cHdwRVA4a3RaNHhjU3NB?=
 =?utf-8?B?TVF1U1daVU1PK2tVbFJ6YUdwVkVuWkJOSk9QKzNVbjZYNEw4N0xRdFF6UkFv?=
 =?utf-8?B?a3RXcThMNkJzbUlQeWlORXdSanVULy9WU1h5SVJaV2o5TVlRZ3NOaThNT09m?=
 =?utf-8?B?cWZFcFU2d2hUdUxqOGpYaEhOMkJpVWM1dEZPbURsODI5UTRBWWM1ZXFtNlhv?=
 =?utf-8?B?RlZaMnN4MGFJcnZBSCtSdGJ0V3E4djFzdm9URndDY1ZzU3ExTUZiSDFLZFA2?=
 =?utf-8?B?ODFzZkUvQ3cwZWhvam15YUJpbWRBQ3NnL0hNbWRSZUZ5K0VlQjdEaG9vSm1i?=
 =?utf-8?B?RGRMZGF5UFdZQ1UzeFNwL1k1NGxjZjhFUWYxaG9kbHdjM0htMWhMc3JyUEFF?=
 =?utf-8?B?RitnMGdjZis4dGJmM1ZCTEJzRFpoZ2dUK3NCb3hOQTVVRksva0N3MDJieWxv?=
 =?utf-8?B?RzZ0aUFwY05JWkY3WjR0R21jMUx1Ny83eE5jTjc1bkRoamlIbEt5QTRXei9B?=
 =?utf-8?B?ZFJnUFU5TnRDaFpvY1dXTkV0YW80anpHbTBZOGYvMmRJbHp0Q3ZObll5SHR2?=
 =?utf-8?B?TWdhaVJqSXpOZkRyQk8zbFduQ05XS3lMT3NadFBZY3hXTGwzR1Z5dWdnQjVX?=
 =?utf-8?B?STdNcklTUy9Vc0VCYjBsL25PS3h6RkswaUUvRzRLWDhyYURqZTBockZvcFA5?=
 =?utf-8?B?WFRQeVdzcG9VRzV1d2kyd05qT2pQLzZ0OFpkYTk3ZDgxL1Zjbm1TWTBKWHdF?=
 =?utf-8?B?UUJxeitVcEdEVGU0RitxL2ZGOURBVE9HWTVwSitEUG9VZWpsYyt3M0tqRDhX?=
 =?utf-8?B?enFNWWM4aTVqelVvVHlKRVZuckw2WTJEMnVwNUtyTnUvdmptbjY3YWdwSnFT?=
 =?utf-8?B?K29wbXMwUWpQdE9hb1MwOGhEK2QyWHVRT2M3ZlRoaTdob0hyc0o3NUZmWHo1?=
 =?utf-8?B?cE0vT0tINk5lVUI1cXY2ZyttaWFidklCYk9kdm93OHRiTEFZeUhLaHhVWXcz?=
 =?utf-8?B?RklmUnNMSUZoSnVyVk8zMkNFb2RmWFhpY0o4VEhPY3FqajRQYkVLM0tSMC9I?=
 =?utf-8?B?UWZUZWJEOEd6a2JkVDgrY2J6NjhtdjRPU3h2UHp0c1ZLL2pvejdWaUtEMnNh?=
 =?utf-8?B?NHpIYnVid0wvNndlYSs0YytQUEtZVXg3aUMyWTF4S1JIZkRndEZhL3FKbngx?=
 =?utf-8?B?am42dHcvdkJnZnNMTzZLeXRpM0hTbXZwN0lUUGltWkRwVG1Vb1VQaDZjWW1K?=
 =?utf-8?B?dkpaVmU4YjVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d21UelVWMy9yUXBDQnlPdVV1NHJ4WkxvemJWMWs2K2NWc1E0eXZEOE82OFJ2?=
 =?utf-8?B?UXFRWE12VytuRGd3bkxJNVYrTkMzUDAxdXBoUUZUakJRbWdKMjdxNjNHeW9l?=
 =?utf-8?B?Y2NxTlRzTEYzSldQdnZDdDRldjQ4QitHb1RUT2daK1lJcjRsT2szY2hyQmFa?=
 =?utf-8?B?Q1VDRVhqYzA5cUt1d0I5aVZRTytNc3cyc0lsMEs1eUhKQWVYVkFZcHEyQTBL?=
 =?utf-8?B?SDc3dmg5anozeVN0VTNYekFsZ2JrVjZKSWJvSnYxREhpQ1ZuQU5BUHdEMGVX?=
 =?utf-8?B?Q2VMQk1BSkNaZlNHbzhnSW5vbktsOFE0Y2JwT3Raei9jaWVhbmM4N2xLSGg0?=
 =?utf-8?B?TDhuMmtoaXl4NVFGV2FReU9Cc0kxbFQ4MStyandyVWpxeWhJUkoxWW1jWEs2?=
 =?utf-8?B?R05HRExKNGl4SW5jeWpzUmhYQkNyMWRReDcvakNOQ0h2dnJWWjZ0OFZDL1pp?=
 =?utf-8?B?UWtDUzdFcUg1SU1LTHUyT2U3ME9VN3RUOGlCUnRubVdOaFdWY1N3bmxOdkI0?=
 =?utf-8?B?SmdHUzhxNmRGMkJrRW4yQmd5Q3EvUWg4WWIxT0RsUE1HVHpaSjh6TDB1eW16?=
 =?utf-8?B?TkZRa3A1TkNNaXlCdEFGQ0dwVExjN3Z0YjVLbTk3QlYwNzdhdmY1OW5JdFFl?=
 =?utf-8?B?STl2Y0p3WGdFUDFrUWF4WjdzaWxmYWlhYndQREFvQlZ4bmJlb0tyZTg0aXQw?=
 =?utf-8?B?b1dnMGhkb3lOSWFvbTFITWdibVZqRU1VcytVd1doQzlRbGxGSTh2SC8xdHM5?=
 =?utf-8?B?RjEySzVhNlQ5c1l1TExLRkVjd3V6QU5KYjRncTI3ZWNHbklNRzVSRmtHWmI3?=
 =?utf-8?B?dVFjVzBxaUNrdDJjNDMyRGtVQnJVOEF2Ykl6NHBKZTNVOW5IbWRuS041NDhk?=
 =?utf-8?B?WE93OXowdXYwbHZKaURjdERMRFkydHVNbFRWcFpOaG9qNUlzTElkVE1RZTQz?=
 =?utf-8?B?MUdqKzJTcTBXQnJFbWF5YmkrL05waklBWXAvakVyblNETzNVVmNobVMveHAz?=
 =?utf-8?B?QjlVM0VNblNhNEY4SzFpVG1NZzFNVDdML3ZSbVFYeXVjSHBPRWF4L3ZoTThs?=
 =?utf-8?B?UDFSMFVRUm5JY3JtWjhXNWRNemovVXAvcGZZVWZnS3BEQnZ5RlRVVVhpS1Yv?=
 =?utf-8?B?VXJOKzV1MGsza1hpcXQ1bzNoYkVnZTJBY3lmcU1oR2J3djhKU3doNDZxM1JX?=
 =?utf-8?B?Q2dnRWdxbmRyV05CL1E4VUhYTjNKKzZFT2EwUnphS0dYRnB4MG1hUDVGcm9u?=
 =?utf-8?B?bDdHVFVjRW9UYW8wcXFkRkZQL1IxSEIvQWo1anF3TWhHVU5tT0tmd3FteFFw?=
 =?utf-8?B?T0JVazVubm9wVFErelFZMjgvMlVaTElKaXB2dkZDY0dmcHFyZklnNUxoQWV4?=
 =?utf-8?B?N0d3MklMTTJWUzVNdE5sNVRZSEI2UDZyakNEKzJ6Y1pZZHdTU3MrTTlHWmRC?=
 =?utf-8?B?KzFJRVdjMnNRcTI5U0hVdzFDaXlEcXo0YUpkR2dzOXNoalkyWTdCOGwwNzQy?=
 =?utf-8?B?ZHhhaHJRWk5maXlDS3p3VFgvejN3RlQyWjdWNkNQYjVXcWs2OGMxWmJ4SUps?=
 =?utf-8?B?YkdLYllSZEx1UmtYbzhYSldhSG5iUStSa09WTDUvdDI3YUM4cHV5VXpUbXQz?=
 =?utf-8?B?bzZXNEMyZEJkTUwzbHlUUXU0YVFoR29uSVZPNzA3MHFkd0VXRHNQZWZGZnI3?=
 =?utf-8?B?ZWl2SHE4d0F5RWtvbnhNNjdKZzVKb1gxa3R4TUxJY2pyazRPK3RickFWTk0y?=
 =?utf-8?B?YklzT0E4cHJKS0crVUtHaVBEREZlYlU4T0FIY1RYRFVsK1lnc2ZXUE5zSVhU?=
 =?utf-8?B?WjNpM0V1S2dUcE9aYTlNWHFnRWprWWl3cFN6SGl3cC9yWEZ1VWFac0ZyM3hG?=
 =?utf-8?B?bGtQNWw2VFNLZGY1Nm5rejU1b1NuMWxac1BxUW9YNzNaazA5eW43VCtWSnVO?=
 =?utf-8?B?eXFqUnp4anYzNFhGZHU0TFFqdGxGUzBOQ1p3V3dvZXFsNzlFZkdrQ1JReXdM?=
 =?utf-8?B?cW55VllMMHFyN29zUTI3K2RCY2VKU2Z1TlJkV3JqWHdZQW1JcVRQRDErb1ZZ?=
 =?utf-8?B?cC9VREFENUdCNHhiODRrTitOeE1rMVZhamtmVHM5ZXc1b3Q4ZkpEaVg1NUt5?=
 =?utf-8?B?NXZSVlljaVdld21LakVJZ0Z1L3V1OHh0aHlwNHhKREtMdFpwVFQzYkpaUWJ3?=
 =?utf-8?Q?po+6fCtWVksLcIf4vFfOyrv/pcySVkdrjem85VYRBbWO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ae2f26-ee21-4367-a2a3-08ddac0962e2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 12:37:27.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xf7ROGBlFa+8gSmKgupkuNej/uSiS1lldCD1VwShdUUAUokCHJKRk/S021u3TLJE6LzvR7n72VxqAtYNvTAKmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278

Implement `Borrow<T>` and `BorrowMut<T>` for `UniqueArc<T>`, and
`Borrow<T>` for `Arc<T>`. This allows these containers to be used in
generic APIs asking for types implementing those traits. `T` and `&mut
T` also implement those traits allowing users to use either owned,
shared or borrowed values.

`ForeignOwnable` makes a call to its own `borrow` method which must be
disambiguated.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/sync/arc.rs | 78 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index c7af0aa48a0a049bfeeba3a81080355f4d381738..31d6f5946d554602ff689a452df7f2b229eeef71 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -25,6 +25,7 @@
 };
 use core::{
     alloc::Layout,
+    borrow::{Borrow, BorrowMut},
     fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
@@ -406,7 +407,7 @@ unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
     unsafe fn borrow_mut<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
         // SAFETY: The safety requirements for `borrow_mut` are a superset of the safety
         // requirements for `borrow`.
-        unsafe { Self::borrow(ptr) }
+        unsafe { <Self as ForeignOwnable>::borrow(ptr) }
     }
 }
 
@@ -426,6 +427,31 @@ fn as_ref(&self) -> &T {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::sync::Arc;
+/// struct Foo<B: Borrow<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Shared instance.
+/// let arc = Arc::new(1, GFP_KERNEL)?;
+/// let foo_shared = Foo(arc.clone());
+///
+/// let i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T: ?Sized> Borrow<T> for Arc<T> {
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
 impl<T: ?Sized> Clone for Arc<T> {
     fn clone(&self) -> Self {
         // SAFETY: By the type invariant, there is necessarily a reference to the object, so it is
@@ -834,6 +860,56 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::sync::UniqueArc;
+/// struct Foo<B: Borrow<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Owned instance using `UniqueArc`.
+/// let arc = UniqueArc::new(1, GFP_KERNEL)?;
+/// let foo_shared = Foo(arc);
+///
+/// let i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T: ?Sized> Borrow<T> for UniqueArc<T> {
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// # use kernel::sync::UniqueArc;
+/// struct Foo<B: BorrowMut<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Owned instance using `UniqueArc`.
+/// let arc = UniqueArc::new(1, GFP_KERNEL)?;
+/// let foo_shared = Foo(arc);
+///
+/// let mut i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&mut i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T: ?Sized> BorrowMut<T> for UniqueArc<T> {
+    fn borrow_mut(&mut self) -> &mut T {
+        self.deref_mut()
+    }
+}
+
 impl<T: fmt::Display + ?Sized> fmt::Display for UniqueArc<T> {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         fmt::Display::fmt(self.deref(), f)

-- 
2.49.0


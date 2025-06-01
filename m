Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21714B950;
	Sun,  1 Jun 2025 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748746866; cv=fail; b=HCmPw3Zm1zv7jNTVCOIDNAed3oPYIbX7YwqSABSmpEiOxkpl1+bYLaGc0MN4q/1NM/8VKRDKnhnPJu0OExLcNT3NdAT2KCl2tpDZ1vHWY8fiJnhf5phcZ6dTG37rYlfaxbKEq/x2xGaPuPk+I9EVr5oLTI9wlAuUFuzLJIdPS84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748746866; c=relaxed/simple;
	bh=atYGca4WvybiZGUuR54ZkFdPFgzPQV1pl+HqIVx8/00=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=syjcttBj8tqNZwqFmLYpuHt82T5PtdKrOt+ajTuynV7h5zQcG9zPKNTcRDOiyX9VZsJ4EtkiIS1KhpGMsc3gR2vfMTKFCBkQmq+htcYUybix+JanhbBTh/CaHe8XQZCIVrBJuUVVoP2F31msrKaq2W0pOIEI3xBIGfY1tjKH/h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VSLU95Xg; arc=fail smtp.client-ip=40.107.237.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VSLU95Xg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gs6kXeW7nKYMNA/fDhu+Wk4AtO+oFI2+k8rfekE8mfMN0OarsKMUW3irVgKVJnkzx0897PSW0xL0bX74F9J29MjIX0+AqSzBtjBLtVgBBtXfaUFarqUawJPvqWOnPU0YOt9GyER/IGb3894x5T8qA0p6x+3o97nIn6KbMHdjDZeS2VguwLbFCaX01tNGHW94Zcrzn/VXZvHJGQoiHj/CRSzkEs5DDDhQDaQrSrUIxSi+Ev0RR78oVusv2c1Elo33i3VgbuwqG3nGFnFt56qc7/XHDICBaYrkv9Zs6BO7YjIqmc13w3qzYbPCegVBX/v0rTs3rD+nA/b9eExdrz0kUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtiU4DmNIJAZf2vV0xQW+Sz+TzTm13t+z2ixi4GX3gc=;
 b=da3k9evurYzdWKqiOeIk+Lj41eE0nva9swqFf8nrcXqvPrj5vcGQmOQcRxDmiYJYBmkei8fci9znXr4T+StXdbUBiXpOR+4ogQIiXGQONN08BBtnX/hU/+17dpMOnENT5JIxdu5TORuX0JFwaPSf0uexOzisFUO1W2L+lgCGFF5MwNbPn1Ws84TIPT3HWNK6pnk3cD0A7BzDIHRljTv11jwzOjp+642eQAcEfGGeZcj5E3SKgx5zFTAf5OoAUcav+H7+L6hQlWO7yLUue7cHjDRNiDtuQVK1d/ME/qac5wI9FkNMhm5qKh8TcfJ1pDa/sUxmYtDlX7+fHyBsXwk2Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtiU4DmNIJAZf2vV0xQW+Sz+TzTm13t+z2ixi4GX3gc=;
 b=VSLU95Xgx1QXhqa4XZIrZO1rTr8KXNxkE0cTTGxVTWQ8H0RWUgzo+wMQUSODhvfDEHY6Mxan7JNLOafTgOqvjRWuZqNfVEFsnoe7XYB2kl+mVcEpdZHk7lZ2SuV/Jrsg/ihaJ3lhBuLpxk9pz8WLiPnbi9A485Cns1/3lCEajrNrCRb08FPonSF4VvMajw48NMTk44dzWBVlPDp4POcA49TAhyxIKFDxSwmdwrYSCjnsk6vid9WaXbeJfYl9HJDi2ZyfgvPP5jn386rry59vzHdVRvMLo6l7N6wGQs5rMIrwrs3RgJ63bwOaKVfy4Szfemjl78BrwgK9vS/oDc2/jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Sun, 1 Jun
 2025 03:01:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Sun, 1 Jun 2025
 03:01:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Jun 2025 12:00:42 +0900
Subject: [PATCH 4/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `CString`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250601-borrow_impls-v1-4-e1caeb428db4@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: aa621abf-563e-46cc-0c76-08dda0b88a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVRnRmFxN2ZyRjNsY0FaYkJraTMxc0ZzYkFUeWRhbkV4UHNiZ0doTUoxelc0?=
 =?utf-8?B?RkxiNTBXMExUWjdvN1p6N2xpczJOU3lFbk1uZHFiV0FHQXhkd1NxQ29zaGp6?=
 =?utf-8?B?Zy9odmEvNXo1Vm5ZTE5KMUY2elFKWVVTNnY5NDlTOExpdWZtWGN2ZmF1RHkz?=
 =?utf-8?B?amNaeWEza1FDUmNjcGpoNFEyL1RuNmswMVY2ZmRzNlF4TWFBdU5SVWRXejhI?=
 =?utf-8?B?bDlySjBmcGJrZ0FDNFFZQVZaUEpYWWNCYVoyQnBQU1Z6dUgxNUxLMnc1VFI4?=
 =?utf-8?B?TlFGMEw0cytYZURkempvWDkzSVljYjZNVEgvb0FXZ1kzbmR3d1UyeHRFeGt0?=
 =?utf-8?B?VEg0bVcxaEo5OW8vRCtzazVVWW1Sb1Q1ZlZjYUpLR0orUnU0TVZHa0VUdUxW?=
 =?utf-8?B?VGo1RFYvVC9MVUdIZ1NXRHB6QW5wem1JWVhJY0JSQm1Yck52WWdVK1hIMGhx?=
 =?utf-8?B?VjF5cGhBMVBqVmY5WVRzdGh2OXZ0TXdZREJmMXNzVWhzZzJjaTBhU3J1MWVt?=
 =?utf-8?B?eURZbUJjWWZENFFCSkQ4UU42WEU5bUdhZFhteDRwTW53MmhZRzlkUW5xRHI3?=
 =?utf-8?B?MWoyR3J5L0lzemMxYzlvdXl0TktSaE1WKzUwbmczeXF0ZlhLaVBtWElYczhT?=
 =?utf-8?B?Vnk5OTFhL0l1c3MrSFhuUkphdEFrYTJNMyt4NGlOOWNIMUVWd3ZzM0J2SVFK?=
 =?utf-8?B?dExscE8yTENsT0gxRU1nZE5ac0xDYWJvTWxwNTJIVjk2TkVieUgySCtySzN6?=
 =?utf-8?B?MWpuNjVRRHFZYXM5UjJCY25kTWpMUWpBU0MybHFSbXhLMWpRNFE4SHNsalh2?=
 =?utf-8?B?cFQ4V05ycmZjWjFXL01ZdnF6WkdjZGg2My84Q3FnbTBjekVUbHRMYVFBL3NU?=
 =?utf-8?B?dGs1MUU0T0w5c2pGWlppU3VXb0FkdWxrdzBNQTUvR09CZW41L1ROZzVLTVFr?=
 =?utf-8?B?QUx5bEQ3QkNMcnFnam03L05OTlhycjRjLzB2Z1NPZUo1eFVpNWRyblJRalFZ?=
 =?utf-8?B?MVVDaS9ubHVnMG5JVjRzOWRqbkdjbHN1MHFMOFN4VkNhNXU5TWtHelpFaTMx?=
 =?utf-8?B?TXNQNzhUUVNyV3YzczU0MnVqOUdKWmtwbzVJK2IyQnVjYUxHdjZCbngzdTZa?=
 =?utf-8?B?MXI4N2ZZVU95dzVESTRCTHVoSnI3UE1OZG5YZFhCTzA4Y3NCOFVjclBEblN3?=
 =?utf-8?B?T2FZTXdxV05DU0RqN2o2dVd1YjNBNy9yZkpFSy9XeUlvM1VIMnJSQlFoQkY0?=
 =?utf-8?B?TytuRjRoUDlzSWxna3RVdkJSSGlHMVl5TE9ISU9qbFJvUERLVGhzdTlLaDFG?=
 =?utf-8?B?VDcycUI5bXQ5VExGZzVIL1Q3MU9URllUUWkzOU1TUFdpU3EzNHg0R0N2NThS?=
 =?utf-8?B?NnlkeFcrTG1ENDIyN3pIWVE4TFRyWCs1WEU5ZTNlWnkvdXNLa295RWpRRjAw?=
 =?utf-8?B?N29HcThRaGs3RGRjYWJmU2h6eVdHcUhtVDJOWWJ1bFVlSWFsVUJiMWdKdTBi?=
 =?utf-8?B?TTN0bGt5aStPR2JheWhEc3RXMVUySTJrdzFWR1lSU0RFSTVxWEhvcXQzQ29W?=
 =?utf-8?B?bzlCbVREMWNQeTNSTjVOajA2UEhWYlpRVjVEKzFUamFmQVV4QTk2Zm4xMlU2?=
 =?utf-8?B?RE8xZUZXUDV3WHdNQndEWEZ2dXZ2a05kWFJScWpKZHgyM3RGQUxhWXgxTmVH?=
 =?utf-8?B?MzdUM282Z3E4WEJyTTdZNHVwck93TytycW5FeWoyeFd5KzNLL2hzZXhkQ3g1?=
 =?utf-8?B?TUw2aHY2aXA5YkVQM3RLZG0xUmtCOHJOejlFbnFubmRJTitIdXljVUR4Tkd4?=
 =?utf-8?B?QmJVRFBxbUdnZWxIQnhMbUdSNXJlK1hsVlpCOGlOSXN5M1JCMHpSV0x5c044?=
 =?utf-8?B?TFVXSlpIRXpkVDc1L1VLaFZZWE1QQnV1ZVhEeW9DeGU0b1crK1dRbmVRMmRn?=
 =?utf-8?B?bGY5ZU9uK0p0bVYxSmpEYThMYWc1RTJXSEJ5YklYNVBYMHhKeWVtYUhCSGZt?=
 =?utf-8?B?eTM2YlJOT0l3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Smx1cGJXd2cvTFYzb2w3anVjbzFRWkpwZ05vZEs1Z0F6NlVYMGxMZ0U3dUJy?=
 =?utf-8?B?ZzR0K3E2T3ZjWjRzSzR0MGl3RU9MUlNVTzFpdHdZeUVaYTk0ZmFjOUlhMjVW?=
 =?utf-8?B?L2JXRWFSZ1EvV2E0T2o4bTc2UjRlOFI4SSsxQmlocEpZYUNPc09rT21WcmVr?=
 =?utf-8?B?NXJXaG1XM0RoZXhvcWRqeGJYVlc1ZG5GR0ZtQUNOalE3U0x6MG5obm5BQStn?=
 =?utf-8?B?M0hjUWswYVR5UWVSTHpPSzhIVUZqdjBadkh0N0Z0T0VybXF2UnRxZUF4L0Q4?=
 =?utf-8?B?R2g4NEVrSy9DeXU1MDBjRitwanIvNURPdjZ3c3h5Zk1saWlSaUlZcXQwdXdX?=
 =?utf-8?B?NjVGRHFOOCtuaEtDdHJwK2laMXloRUJOdkNxcnRxWFdSdUF0RGoyZjVNb3lO?=
 =?utf-8?B?eGdqcjhXWFE1WVBOR3lmOGI0QnZ4bWRHSmtEUnNrQWxpalZoc2p6VGsyUXRz?=
 =?utf-8?B?NnNEWmxvVkpscWYzVXNBVzBxWXFmZnk1Y2NXSEJnU0J6UmtKdUJjMGFTSTRz?=
 =?utf-8?B?MUFCSmM2L2N3eUhpODB1QXd6eHV3aTYzMnRmdHlEK3Z6by9GOHd1MHVIR3pV?=
 =?utf-8?B?Q1dSZkJpcHhwUFlpR3J0aElFRlFJbFErSW43ZFR6a0NOM0Y4cUNaczRieUls?=
 =?utf-8?B?K3dBeWpEazI5RjhqYjY4allrRE1Qa2tyWUlCOHB0Qjl5M21iNzVUU1V4REVQ?=
 =?utf-8?B?N0ZNSEpEdm92TGJMdEJjS2NselFaZFBIZ2t2NHNWa2poSEZzMmlzMHRudVNs?=
 =?utf-8?B?NTA3VFdHM2dDQTFQYXhscnY3RndCdXBQOXo4NWRnUTN0c1dkZzhhdHRSUmM0?=
 =?utf-8?B?a3RxQXdtMnE2Sy9vWFcwV2N4WnNTeEplNit0dEhSRUFlc1ZDNm5VTFREZDJX?=
 =?utf-8?B?UXdxTHg3NFEyMDBzVHZWRktmMDh2ZWlMWktkNGptUXBHNUp1aWduM1lqR1Yv?=
 =?utf-8?B?Uzd6ZzRJckVKYTZ6WllPUmpJWk5vYWVGSjNiS29ESC9reHFQL2tMQWxZWE5D?=
 =?utf-8?B?OTE0UGhSOVpvbUZsWWFzd3NEM2h0akV0enpyWHVGSER2ZmFjOFErRnNYemF6?=
 =?utf-8?B?ZkFuc0FPR1laZjhMUEl0c2dHdkxuSHpkVHNqNmFnY2xNeGZhdXhISFVhU0lF?=
 =?utf-8?B?OXhtdTZ4dDFSc3plRU1JNncwQVVEOXNKREZWd0xxYjhsM3hkeEF6WUMxME50?=
 =?utf-8?B?MUhHZFRUYStRWjJ5VUxWL3VIVnRhYXJBNTBXbG01R1JuUDlkWUp6eUlrYmFJ?=
 =?utf-8?B?TXJsQVo3VE85YUxIenQzbnJvNDFOWExjUHVWRlAvMHY2V0xaTUQyWlJiK0lW?=
 =?utf-8?B?anNnTS9ocTRmS3lYbmNBUk56RTNXUE1CcXlMSFlqaytObExHdG4ybXJadmd3?=
 =?utf-8?B?RTIwV2FKdWJja3NoQ1FsWkdVYXhsd1ZibFduMEROODBTK0dlV1VDVGF6ZU9R?=
 =?utf-8?B?Njk5T2prZXNqSnR2dGtqaHlrWFVQKzF5QVh5TzJlOHkzM2xHeUNqR0dyOW1Z?=
 =?utf-8?B?ZStSMWdwUFYxZU5jcWQ5K2NpK2hEWFFpSVdsektTRFZVT0VIQzdQY0JsSEdS?=
 =?utf-8?B?Z2NQdmF0QlBxYWpuZ1B3OVg4QXY3TXk2T3F4dUhZdkNReEllQlJhMDJ3M2R4?=
 =?utf-8?B?WUp1OW9TVFRDR2VjdnRVMWZ3TlY3M2JSeGdZQ1V1SmQyYzBqSzVPbU94d0NT?=
 =?utf-8?B?V1kxODUwTFVGajVrbFhhbEg4WDdtYUpDWXE5Z1JOZ05lb21iUlVuY0Uwa3lq?=
 =?utf-8?B?cEhNZVlzajQxdE9HMVVmd1d0bXpMQU5lTlVibVg0T2tERzBPM3FUZy9zSTZ5?=
 =?utf-8?B?L2JHR3NWRmI1Mm41OEtjUStJdGJBVXdJZXRubjdLbk42OW1hVlUwV2VmQ0xY?=
 =?utf-8?B?M3pWWWhpTlp4VmFYeXZQSDMvWmRuMTdDWHdXejZsQ3VWb1k2WnlXZnlsUi9Q?=
 =?utf-8?B?UjFQaW9mTW9oWVFmK3o1V1V1YnJjOWdmSkk3b0h6S04yWnFqODRjMGp3VTZ4?=
 =?utf-8?B?dTJpRUhZSmROUjNlR2M3eWllNG15RWJMM0ozb3Z2eXJMbXpZZGJwVVg2R2Nt?=
 =?utf-8?B?TWRaRWttV1BNTVRFZnFNNlpvaTEyd1IxTGpkTWZEWWt3T0FKa2FTRm9QSmsw?=
 =?utf-8?B?bGxFRU8vaXF2TkZqRUxSRUplYkc0VTVGamVRdVRiVWlVOXZsTkR3TFc1M2pv?=
 =?utf-8?Q?n9l3Lr+rHPPrk4bgncaQ82QlHEee6KLaQKwXuchjXl5N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa621abf-563e-46cc-0c76-08dda0b88a54
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 03:01:01.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Poyo7KPMHTxKqoHh3nPZBopk/nPujSbD44O7+KpzCDWJ8c7mXBfaTs2eqBPscRtaG86EKFm5ejFAvJaXsU+tkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504

Implement these two common traits, which allow generic types to store
either an owned value or a reference to it, leveraging the `Deref`
implementation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/str.rs | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a927db8e079c3597860880947a03959e1d6d712e..f5da512ebcfef6c8d5227e8177ae32f6194ecffb 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,6 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
+use core::borrow::{Borrow, BorrowMut};
 use core::fmt::{self, Write};
 use core::ops::{self, Deref, DerefMut, Index};
 
@@ -911,6 +912,18 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+impl Borrow<CStr> for CString {
+    fn borrow(&self) -> &CStr {
+        self.deref()
+    }
+}
+
+impl BorrowMut<CStr> for CString {
+    fn borrow_mut(&mut self) -> &mut CStr {
+        self.deref_mut()
+    }
+}
+
 impl<'a> TryFrom<&'a CStr> for CString {
     type Error = AllocError;
 

-- 
2.49.0


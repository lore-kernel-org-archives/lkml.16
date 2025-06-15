Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68111267AFA;
	Sun, 15 Jun 2025 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991056; cv=fail; b=lBBcY30kV/LuYlTInwukY3rc2dZD/o3piiA+Mr+7oBwqIwXfISJy/+FnmdtovMUXWE2sCglgH4tHoI4aMTBfJLm0pbaesSQbk44q+FIo3gcEcgeFE7dZh1zzqKQUaJ9bl3SOyYaXKOFdgBR6axlopEp1n8xkwEjq/SCNcIsJvdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991056; c=relaxed/simple;
	bh=IJJpl/I7rMxRi2GCMEY2jIK/MOxAHQGh6N+4uWuVV5U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=APrADNaGlLIKYG9gAudmqY/sfVjuX7DTtY9/pE6vNEuU8hLQwlmdkKf+mtXjtd9TO5MbiuTaLHrEJJ/CZOaGjim4XLu0hPrXHvqPrPyFFrF6KWGYnMpxoglhsm4IoP8LVWfNzWrBIqx1Dfk03bCOpKsFE7F3VrHRVDfkdnFh7tQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SjH6PyMt; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SjH6PyMt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGViOnJQHt+0o4nG8RHi8lcQZwIjJGYYxZdC8MRQ8laWBUg9MqqU6MuB/yOy3Yb5ZdAzll/OzIdzDe6HstJ0qkuGMdyB1qB3LIv7T/JMfIdKKnAg2KVDN1B5zj50FJ6X26cXRXBTC3USHziWxJ8ryRsgkGOaX6RnZVQReNzvULMyCRtlkT116Z+gTANRGirWyvrHg4OXp2OVVxAASCwyX5ofalmQy5j4Rl7iO8ZgfoPaTybX8v0QNKLmgcxVaNilRh8EYlrDDnbfZ57wudkfyui03LYqywS2z/7U6SDQ3dv/dJqmxDXc/6XJKTimHEGe825PUbcwXY7zyH0OgNmm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiOURGfAUwarW52hPXPq5a9fuMvRb35ml7CVBLbu8V8=;
 b=sK2FAU52NAeYrg202TMYVJS7iC2fkpWpE6Mn1l9HF4rPqO45lJw3K0HozfDTlQlWLPCCjqLWwaYLzkzQXWxxx2ei9pkZxfdiD+8MmHs1gkSkLf+yqoFEA/ISkCfEibuADEBjKg0bV8ONZdOPwdEYVB0t7RYsxLhh5+tFSBCDuqTgkH4cEvz7BLJuqitIfuiFx4CjINA123eJkFQMRwmipQnXRRe4KoJWuovc7bdKgbJT6wOLGQdNYQiO4l0BCk0PS4eebkJnzeGKB4e1hzE2fV4eF7OOYX6eLTM97byxN1Zet6Cag6Ax5kAPRlp2W9yvDkJUlues0YXj8y8hQTfEPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiOURGfAUwarW52hPXPq5a9fuMvRb35ml7CVBLbu8V8=;
 b=SjH6PyMtLuHRR0EcDHN+BAXnk27mH5UqvC6uZHPktTKJ4xFlKCkxAC4B2AG8C5/jCnDgu8hnLtzjtpnXw0Yusf4A6wOqf379Nkz2X0vvCuCswnRDpETGIN7qezyW4PCR7jwhx8vh5/yXd84FaFMPbzl4Fl38zqGCZMt5QhV7x6ByDuwfeKpCz9M7jN19rjVXODBpNptZqrQTkHB/15KfgLc6TaENuZhSAG5XEAWsfggjxnFekd+rp2c66SKgEZzJIWa0MJIePoJv9dCuhf44FubtV69KKS28p0RJ9SvVsxFFdmRgBZEtCl7cpMla8nF9r0V3vk9Ed2yWhQZd7dghQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Sun, 15 Jun
 2025 12:37:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 12:37:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 15 Jun 2025 21:37:11 +0900
Subject: [PATCH v3 3/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `KBox`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-borrow_impls-v3-3-621736de7f29@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb2c3b6-7b1a-4bd5-bcf9-08ddac096533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0dJSEl3MEw3WjhRbXNaVHBlSXZLaXBQR3B0SzE5ZDQ2ZklFMzZOYWllOTNo?=
 =?utf-8?B?WTFZVyt0MkV0QkJRWFBNcW1qUUY3bm9jNERocFNDeWxiRjdOK0xpQmhPSTRu?=
 =?utf-8?B?NnZXZGRzRlBpN0lsdmhaNnlKNGNMeGVPd2lHZEdLMTJ0NjVKNkc3OThFYmlk?=
 =?utf-8?B?T2hrc0Q1WmF2bkZmSGJiRlhZVU1UUmVwRjZzMityTjRmTEpNOHlJVHdXNTFY?=
 =?utf-8?B?VDFDMGNLSHIvcWYxaTArd3ZSQVppVk9EaDNaTXRBZ29DSGJmQlJCb2gyaVdv?=
 =?utf-8?B?ajhRZ2h6eVRXTnluemNYVWx6YUUwYUhiM1BWVFF0T2Q4QjhhZi9nZUR1OHo1?=
 =?utf-8?B?OXVlckVvcGZldFZGZngwSDIyM20rK1pXSFFvdjVHclpNM25Dd0xWbGxmQzNj?=
 =?utf-8?B?NDNBUTFRcUNjTm9RdjhUU1NaYThKK2xQQVFWa3VjdEl5bFBleFJwVHNGQmw4?=
 =?utf-8?B?bVdNU2J6MEdUODR6dkJwck50dFc4bFRlWUI3STRrYy9ja2RMNG5HbkNaY0dZ?=
 =?utf-8?B?OWZjV29MeEtFQ2txZ0VraVpudkZaK2ZqQzdVUklkYWtRM0I3S29GUEl3OXhM?=
 =?utf-8?B?QWVEd2lEaW5lQU1ZVjhkb3FBSlVGU2syeWNPbnEzSU9WRDFDejl5RzlwRHVa?=
 =?utf-8?B?RjJlVVZpekhTNFZhSGZUaVEyeitQaE9OV2Rkbi94dWhrTk9JaElxVDl4NDNK?=
 =?utf-8?B?aEhjMjV0MkdtNTdPQlpFS1VmMGZ1bk1SN0RUZHF2d2l2ZXhRelZSa0h5dHRY?=
 =?utf-8?B?ai9FWXNpa0V1a2d2N3NNNFVRR20vMkRRV3BFR3ZKWjVQMHpRbUs1akdqZTNB?=
 =?utf-8?B?aDQ1N25KVTZLRkVpT0pQUVN0Tmt6OFZyKzBJMDZnT1l6S3RmKzE4ZDMrQUNR?=
 =?utf-8?B?QzZPSFhtd3A3OEUxdjE0clZRRnR4SXJyVHYwSW5SQ3M2cW1CRDZMTnJ4QktK?=
 =?utf-8?B?SE1QWXlZa2hYQkVoaVg3UGZCTmI1eHdDdmJIZFQxb3Y1UHRGcTU5bHZ4dVdG?=
 =?utf-8?B?eTlWNEV6YUlJQzFYN3dDYzJQdC9TZkg3Nmw2NElldWQwbC9DdkY2dWFVcHMw?=
 =?utf-8?B?YmxyUFMvZFNpdzd3dlVkais1QVZ2UnhXN01sZDFMYS9rZXpsaFdoNGhsaXlq?=
 =?utf-8?B?anF3R1djOUdtNjVUeERrRG1ybmtqNmpxdzhwQnhHN1FZdVByZDcxdlhPazlM?=
 =?utf-8?B?c0loUC9iSmF6eC9Fd1M1ZHNOK2VHeVV0d2tuT3ZMSkJ5VDdBamwvRDlzb1FR?=
 =?utf-8?B?a082TE9keEllSzZCd3B4WkVqUlpieEpEWXZjZU1TbDBDVVdqc3k5dGxndFR3?=
 =?utf-8?B?aHM4NkducGVDOHo0azErdk5ibXRVUnlnNFg4UlFXL09YckFkYmxUd24xenMy?=
 =?utf-8?B?OVpHZFNWWjVDZ0Y2UnhCVm90U0g3c0ZmVzdoKzNLb3ZpaVlqaEM0ck9QU2lX?=
 =?utf-8?B?aUxUZngxOTh4UFBtNzRyWGxCM0NTRHZGa0RpTWpCSXgvU2RqTzdaUFZXUEFh?=
 =?utf-8?B?OUd2Y2prZzNMQk9wNE5RNnY5clBhZkk4TDkvMGxXL3MrbjJJZnlzcjFUajEz?=
 =?utf-8?B?L2lVYldzaTdUQ3BlL3pWWDkzVjkxMnowc2lETWtnU0FRNkpNYXNFTUo3SGNP?=
 =?utf-8?B?K0VoRzhtMjMwVmVOWGNJbVEzOFBMZVRidWprQWVhWkNJazg2MkcwbXZBM1N6?=
 =?utf-8?B?UVFrRGt1ZFBjMktreGg5V1J2THNYVFZvQUVSUDJGcGtadEtrT0Q2WnJKUVZ2?=
 =?utf-8?B?T1VjMDFaSjdLdEVYSUNRZDVyZ01YMnZsb2p5M29lc2JrRGRPYVFTek43aWp5?=
 =?utf-8?B?UHRQNytWUURDaXlEQUJiVVM3QUpmZnkvRTdVUnNaU3NJUDFGc3Q0ZUpYRUMz?=
 =?utf-8?B?Tyt3R0taU0NxdzBJa0doTW1IS2RBbyt5ckRqbzJtWFJwNzk1WXczN29SYkRj?=
 =?utf-8?B?MUN3Z1Fzcm9HRmRYQnhQTDhNTk5UY2NmZEJNWWZxalBocEtJbUJZZ3ZHeC9y?=
 =?utf-8?B?ZmtOWWlnOGZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3FreW9RcEt1UktMOE1lZEhYNWM3UDlqZGVUbHBXVUdlSmc4Sm42ZnNReDZT?=
 =?utf-8?B?SnpTakt5U2p1UEFQM1Jud1oySXYxaU1VM2I1VE5IczAxRFVqN3cyZlNaUU9L?=
 =?utf-8?B?NS9BVUoybFF0NGVrRk90ZjQwNTVDZG9xOG9uZ0M5QTRBdFkvUnRYOGZ1ODFJ?=
 =?utf-8?B?YVlDVm1pQjBOVFZkYzkwQVFBeGdPbmpVQ1NMaFRnZ2dVTW41c0RGOG85djF3?=
 =?utf-8?B?Uk1tMStIMGJRYlVsMDFCVXl4S2hCQnM0MHIzWU1LOUpZd08xTEJCNzV1NTFV?=
 =?utf-8?B?NjN2YkxaUE5wang5azFyVURFdHVOdW9xVGZrMmVQRDVnYnNUVGs4bk03QzBF?=
 =?utf-8?B?SjJhQ3gzenk3aE81cHBDSEVwWmJBZ1JXSmd3VXozMjJyeWdOUDJwWWdPeG1K?=
 =?utf-8?B?TTZNOHNpNTQxRGFqSnVHbnNyZUU0VFgvZFB4eUEyZlUyQVNwdURsSGVLejVj?=
 =?utf-8?B?VFgzMERTWjVnK2FaK1JKa3lzL2dET3RZdlFiZld5VVJPRFJjTDFGWTBEVW5s?=
 =?utf-8?B?cEdKNEs4WGxFNmRhYVZpdFNSUXIrcVRKY002R3pWYTFaZHUzbDB5Tzg5Q1Bv?=
 =?utf-8?B?UlV3NThrRmZjV20yc2s4TmlObXFyVFZCWTMxdkh5bzZYNzdFdUNUVllIaVNW?=
 =?utf-8?B?cm5oWWFBdElOMWRUWDR1TlI0UnFXaVlQNDJja1dKVGdPZGFVV2RyUi9kY0Jh?=
 =?utf-8?B?VENnT056OTdWZUpFRWhMUzM5TDByV3pxK2ZyYUJTS0M5MXVVb2RFRW82Wlpa?=
 =?utf-8?B?blRpdmliYmdFb0kxdytHZVpTOWNSdTcrc3l5UEx3UGU5S2VPdGxDdEo3dkhU?=
 =?utf-8?B?U3FnR0kzcW5NVWFtdnd1WU9IUVhGM2NMYlNydGFLQ2c0SSt4eGFTczdiem9l?=
 =?utf-8?B?dkFwZGVtemFBWGtpWVdQdnNmSzdjV3Z1VmNkeko3V2FJYjJUaTVTbjhZeGtZ?=
 =?utf-8?B?YXZLMmFqdld4Z1VkdkpHVExVaGd2cllUR29MVXUraVBVUnpySTR4WEwreVJa?=
 =?utf-8?B?bG1NSDlNZGZKUkhxQUhqbHdpTmpKMDZsY3RYblhnQ0wvenJLUklXQnBLaVVO?=
 =?utf-8?B?eDFsaGJNZmg1ZmVPNHh6TkdpRGtzaGpPSDFUUTBDNG5hcTlBUnFwVkhVMElP?=
 =?utf-8?B?a0NVVkwyV2Q0U29aY2lVVG5BUW9ERnhqTGxhbTdXODNhRWwrWjRucllqL2ZT?=
 =?utf-8?B?RXZRVEU0TDVuRklWejBtTXNESS91c2c1V2pub21XVFI1RWluRno0aWNSQUdE?=
 =?utf-8?B?aHQ0RUdjOVBWMlYxRHJ1UUgwb1ZwdnYzSGhSV3B6U3FFd3dnakJFb1ZjaTJI?=
 =?utf-8?B?VmE3ck50Rk5Fa0g4ZC92amhMSkYyY1lnZ0xmeGZBY3EzWncvTHNrUnkvUEdD?=
 =?utf-8?B?YWRpclMrSDI0eGpxcEFkOEV3MmoxK0lLWVpKUzArYzVnOGhHU1E5SHZlb2gw?=
 =?utf-8?B?czQzSTQ4RWVOV21Ha1craldWMWJzdXhESVJ2VXYxQ25zMUtZZWI2WGhoUSt4?=
 =?utf-8?B?OHBYdkFoNTlMNFhSTHk1U0tiSVdhUzhZYkt4YkE0VmV2NWVBdGRTWG56SW1Q?=
 =?utf-8?B?ZWtwbEIyN2ZSdEdOdmZEekYxdHRFejlwZmlJdTZQNm9TRTdFL1hHQzFQa0NM?=
 =?utf-8?B?R1B0VVBlVFhYUStEOFNHUXVRbVpZL2pkdWk0bDFFemFpanBoK0crYTVQU2Y5?=
 =?utf-8?B?RWhuN3NBWGwwMFNkRFZQSG5PMVl2eXJiUndyU2RpUlN2NFN1OVlKSFFDenY4?=
 =?utf-8?B?amZRN2ZTNE52ZDBwaDhMTW1LSlZ4YWk5S1BPdHlGNzJvSUhRTWdtVklIeHF0?=
 =?utf-8?B?WTFvVW10dEpYNVNBT3AvMnFBallHdStiZmgvRFZoTmVhQmFGMzVMRFBSS1hE?=
 =?utf-8?B?T2IydGZrNmhmamtXL09kemZ1Z2FaeWlnQkhqb0RzS1FhSG8xeVZ0Z25iYkt2?=
 =?utf-8?B?ZjNsNkJKQTZESmdNS1Bzdk1DSDlEWjZERTNqc3c5Zzdxelhadi9zMWxORkZN?=
 =?utf-8?B?UlUrUVk5MHlkSmFpTXpneVRMTHlZMFhyVDJ5RmVFWDRZVDl1V1J3Yis5SU9F?=
 =?utf-8?B?OVA3dktsMDQxYlZoMzd2T2podU04ZzBGRTZGaGt0dzArZU43RStlY2tzL3RZ?=
 =?utf-8?B?bWFkY055Zy9JY2FXWDBpMVNtUW9ibldtNnNmdFl4dndGN3B6dmtDRVA0SGw5?=
 =?utf-8?Q?VV9MIdTcRFk8719WIEFIM9edTPFGKl/ZGYJufoBlsmz/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb2c3b6-7b1a-4bd5-bcf9-08ddac096533
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 12:37:31.0208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpYJSwZ/tS3u3AOluc8tF55UMUqrf4SLJ7L4RtjSQHnsMPql/nOwJ+rLQeHIkR06CPE4EtAHOKOA5oNsq+NzRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278

Implement `Borrow<T>` and `BorrowMut<T>` for `KBox<T>`. This allows
`KBox<T>` to be used in generic APIs asking for types implementing those
traits. `T` and `&mut T` also implement those traits allowing users to
use either owned, borrowed and heap-owned values.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kbox.rs | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index c386ff771d506a2eb4c211a93ea9b59bc04c93f5..e60e8c9b4d8539db6b8861ce9b8ae610ada4ddcb 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -6,6 +6,7 @@
 use super::allocator::{KVmalloc, Kmalloc, Vmalloc};
 use super::{AllocError, Allocator, Flags};
 use core::alloc::Layout;
+use core::borrow::{Borrow, BorrowMut};
 use core::fmt;
 use core::marker::PhantomData;
 use core::mem::ManuallyDrop;
@@ -499,6 +500,62 @@ fn deref_mut(&mut self) -> &mut T {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::alloc::KBox;
+/// struct Foo<B: Borrow<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Owned instance using `KBox`.
+/// let foo_box = Foo(KBox::new(1, GFP_KERNEL)?);
+///
+/// let i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T, A> Borrow<T> for Box<T, A>
+where
+    T: ?Sized,
+    A: Allocator,
+{
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// # use kernel::alloc::KBox;
+/// struct Foo<B: BorrowMut<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Owned instance using `KBox`.
+/// let foo_box = Foo(KBox::new(1, GFP_KERNEL)?);
+///
+/// let mut i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&mut i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T, A> BorrowMut<T> for Box<T, A>
+where
+    T: ?Sized,
+    A: Allocator,
+{
+    fn borrow_mut(&mut self) -> &mut T {
+        self.deref_mut()
+    }
+}
+
 impl<T, A> fmt::Display for Box<T, A>
 where
     T: ?Sized + fmt::Display,

-- 
2.49.0


Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8F41D8E10;
	Mon, 16 Jun 2025 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044907; cv=fail; b=Jy9+SL9LNUa+cdLU2MKxsuYC0gLs+Cj7vPF3pcoSjAZNSOoqxKH4bSCSKhts584V1MM/WW/ckSCd8dugP+5c9dndgWjlC0pK3INJIgB2LjAkoGHIkdrrfWrcLa46i/x16bnplVfgD8qxppwgzAESI1DEqZZAM/xZB0jM7roiHmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044907; c=relaxed/simple;
	bh=dKRtvzKYbo+ueOLTEjM11FEGeCNGjwAT85oNbnRZTWo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XI0U+0QVyL1oBhbiZ43A10W+EksRPQlHErVXBjLFTaUf8iy/iEeFbaQMjVPSf06j1u+Ddzu15DUoR8gEZDyR1w2XabTl2z6a/DnMcgr5541kk+2EiR39cnKsbiZ2xD3rSGCkL/oQwZ8TYJLXeM+Leyx5fXT9xRdbsFex+fbyjL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WuRMRAey; arc=fail smtp.client-ip=40.107.94.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WuRMRAey"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0WJHyY9kYEQ0KOvL5lFPx9BJiWK4QlA/ysMXxcoArEHWU+/WekWvEXEMkXcZOh2VTiNA7SiUWk39pPiBhReYr98Jgzc5kTuLs2cXmUnlrsBzhLjHzpEMbJEQgOZz3ksp6nkW9FUl6zXCv3bHx150YujCRLQLmp9upHAYvgP9cfn7hX7Q7JhTgoDT7L0zDLt9or9uTni6iEv/+S4zAbsFTqCKU9CMgqwuKqS8wybusyPNb99P8HVK/bRgc31EYW5tc6mVgIm056GOLuk4uRN8tXypGXQA5QppVFVdCaEr3Sah/yNy7OxeHkanO6nTd6ins/VUdfMMpxes3KIvEjLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40HN023PannlatrNm6vLLgPJtSmIWewktu/QGJIdQqQ=;
 b=rfcwosQbGoeb4MDXvnPf0PkNaGeKXPvlxQaGYAll9i94JTj1K/1w2xqmRz421COwfmI3Z1RFyy/5aWdZ5MN94XnUzh82J9fcX/07M1IBmCx7Q7Az+ReFXYzlyTnbb67MO2nAdK3ED4fI44Cmg/T9o909iKT1+sm90fNZvZiqLwauWmg2gTnoIr/HNVU/uQAmQ+lO3dL7Ra1lJOXjs4TR2noDhuzkeLsWeDTC/azzn3Q2zHcxg+HtH/Re3baC6CozT25H2xfuuRj5XlUxmxeoJxu1SsawdexqbQ02vJn+0aVinJ4Jz49sTz8OXgbFKCZ6rhCt2PaE7pjwLgfUcaU8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40HN023PannlatrNm6vLLgPJtSmIWewktu/QGJIdQqQ=;
 b=WuRMRAey6dA6ic25KjOjqVTdccM6bkqFCZDyxWTLHzMET4pPR+T7L/s0QdoRIYZDSxeqddMDTfPgnr6PGCXseLv8AejhbzO46jf2Ut/fXmUgNiVKz07g9AwXWU/t5gkU+Def73YNZ9mg/yfq2WZB6TxlRQMfBrwJ/oKcYlt83nvuDncQpQVs6Ourg0s1AreDoLXfoWx1NvO0OpkFJLaGVEqhQreGeVapu4W2P8aUiulN1c0IwpShwh6eeHvGguKdKdrJ4kSTlH57jsgsGeMW2wwRbQZTh6BbBI1eM/rLg5AWLh3hSp1qUBUn9AT5HekdLBBEidfvU6C7kq/DI9VaZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 03:35:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 03:35:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Jun 2025 12:34:10 +0900
Subject: [PATCH v4 6/7] rust: str: implement `from_bytes_with_nul_mut`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-borrow_impls-v4-6-36f9beb3fe6a@nvidia.com>
References: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
In-Reply-To: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: 96632833-5b39-4df8-cb7c-08ddac86c7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlRVQzM1WXJsV285SjFzOGUzak0wekVJb0crRDhjYytvald0SGZCT3JlK0pz?=
 =?utf-8?B?VXRlUWQrSmpOaXFBTHcwbXY5aXJwWHhZNzBXeEJGaU56d2VVcnd3VWJQVEVV?=
 =?utf-8?B?aWhqVXNicGhqRWttMCt6K1RLcVJaVFFibmttY0ViNi9KbG1aL2QyYXpaVEgz?=
 =?utf-8?B?NjVTYjY2eTEvbmdMRGVPSGc3YU5GOXBWTXZUbDlYWkhpYkh4aHpoRXRvY3No?=
 =?utf-8?B?SVJrdEViOURmK0lwRnNLYlNZcHM5allpZmRlOG5SaWxMZ0V2NVBHeFBXd3BM?=
 =?utf-8?B?NVdYTHVKaXNUZnJRanY1SGtDV3VpT01CajhQMjFEY3krR3g3N0hGdVpHZkx5?=
 =?utf-8?B?Z0hZVmpHQzRFbFRKZ2NjWEx0a2o4bUl0bVFiQU1LZ2s0dTg3WStYdUVNcG42?=
 =?utf-8?B?aGZaTVhKTXdYZzNWTWlWZm45TVhMYzlqVzJkL0x3VTJWYVdBdWd1bDdncWVi?=
 =?utf-8?B?QzFwVnZqQmF6d3A2U1hRMzNtQSsxdHMrdE1LQ2srRTN2d21XZCtOaUhDUEZZ?=
 =?utf-8?B?SWYyQ2pzRGhVSXZFMzNWejhqTXFJbGxGSFgzM2VsWXczN2ZnZTNzVVpDbjFP?=
 =?utf-8?B?N0JMZ2RqcFMxQWNXOUR5anIzR1ZNaE9wazM1ZEt5YjNqL0x2N0Jtc2lZM1dL?=
 =?utf-8?B?TmwvZ0FmNC9ucy9pS2NBZFpROUdSck94OUpZRG42WXdTOFdiRkp6aTFqOE5F?=
 =?utf-8?B?U29RcFFHSmtLSUk4K2NhWGVYeWFscXZjZ3RaOTI0SmYrbzRFVDlwdFVQQWVQ?=
 =?utf-8?B?TUJWdTRPdml0QmNQWnVMcHhtMkdXL05POTl4VENxaE1DTzBGbjJHNUhQcWtF?=
 =?utf-8?B?ektqUW1jaWM5aURMQWRzZWgxMFpJcDlUeEVNUkxoOTZBdDJ1OWJGZnVJbENy?=
 =?utf-8?B?YU1vcG4xVm9kZ3NHNTdRbU5vNWpZNDFJSThNbzduNVNacHJNUzBDaHhTMnJS?=
 =?utf-8?B?bzJod1RBUC9oUFhMaERvME1IREw4WXJyeEZXRmYyRGxWT2pjL0k5cXpwQktp?=
 =?utf-8?B?UVNKSXZZbGU4NHM3eUVwYVlHd2tYUHk3c2NjQ0F3M2xYRDlEMlcvZVlST1pj?=
 =?utf-8?B?dVI2V3lwbXlzN1BzVDk2MTdaNUFSNEdvYW5oUkd4WGx5Um9Sc0lhM0ltcjBq?=
 =?utf-8?B?MmtHeFk5WFQwVEIyQW43dzJ0dmRTUlVjd3U4ZHBtKzlZYmQ3UEtpdWRjWkx3?=
 =?utf-8?B?R0VEMVA3SXZVcXJEWFIyQUk1MzJCYks3N2tqbEpWeXM2aERjRkhGTWMxNzVX?=
 =?utf-8?B?NWFmeWFLZlB5b3czNU9kR0hwVTJKVEd5aGhSMGlyQnB1a3N3R1E4b0xTd0FW?=
 =?utf-8?B?b2wvejhYRHJQZExyRkN6czBSZUNpdTNwbHAwR09BSlBjV09KbmZpNVNubnJq?=
 =?utf-8?B?Vzg2UzU2THh6L3FRVElqeGNSelBoZStBNmk0cEhnMHMwUG1nNVF2MWJpbVVL?=
 =?utf-8?B?OWpnaUlSdlR5aE9UZmhmL0NOL1kxbnhITXhyWTljSEh5L3Q3T0RxaFcrTUtL?=
 =?utf-8?B?NXVmdnZ1dU9DVmRPL0d1OEFvTXExQmZYRzE3WVk3SHRFZEgwa0ZhcHJTcFZV?=
 =?utf-8?B?SDlTUVYzRXJmU0RKai8xQkxsVHRwVmR3djVNV0oxd0QzSWRacHR0b2VOTXlG?=
 =?utf-8?B?ODFudUVqcngvendqSmppS2w3bUYyUGdIZ0pOWVJUOUtPVXlXOTd1STNodUx1?=
 =?utf-8?B?aWxrY0hndzN5UmNUSVRBdFB4ZUlpWGhZN2JNRXZmdkcvZ1kraWI4a2ZRSjh1?=
 =?utf-8?B?aGtXNE41aTF5Sk5raStxOGkxUTg2UHJxeE9uTTlmMXNBdVF0QzlLU21udGxH?=
 =?utf-8?B?VGZNZmlrc0lpNGJpZDh6ODlEY280Z2VnQXhEdUR5dmtwaUNreWFOL2pQeWJM?=
 =?utf-8?B?bFNDclVZUS9QaUhYTGVGcTMvNktZTHFjamwrNXRlQUk0RmlnOU0ybGtBd2Zo?=
 =?utf-8?B?QWEwNjZYU0tXMUlCeFF0TVpyOXBWWURTSGF6M25UV0Y5MG9ESGJUVnJsaXl5?=
 =?utf-8?B?TTBJMTlYbWdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlNKSEJadFpGcHdzbDB6MWF2WHQ3cUV3Y3d1Y3ZscGJMSjliNWY3TnUrdm42?=
 =?utf-8?B?SDV1RHl5MFRSR1hhUE9wZVpJM2FBdjY5QlBpdUhTS21WMHlaNzhyMndXZ3I2?=
 =?utf-8?B?MzJJdmtKTER4N1Z5Vm4yVVpzZGwrQXR4ZEp0Y0RRZE5NU3V1ODlBY0drVEJp?=
 =?utf-8?B?MUdodXlGT2pMVURndFhvcUlmTkphTkR4WVpXQThRaUJUa2loSktLQnI5U3ll?=
 =?utf-8?B?R0w3N2ZITFJabUluZjd6ZllMemFEN2VnTUkwMENmbitPZ01GZzBTUHE0c1Qw?=
 =?utf-8?B?T21tVVRTdzdtcXBvYi8wUHRteUduT2E0V3VOOVhqMm9tc1NNeHJyZ0pJUk1x?=
 =?utf-8?B?ZjFRUSs4WFdOc1o4WW5WZkhYaW5Sb2dEbklvMlBjWWg3dS9Vb1NKQmZzbkQ4?=
 =?utf-8?B?dXJFQjFJRytPTjJ1MGhabmFWK013NkpBZGNRdHd5Vk1OWXZPOENPS3hnRlNO?=
 =?utf-8?B?ZmtUM1F4TmJxcExsV2RiTVRyQnc2bVpiUU9qK1VSVVBDeGdVREphM1FtdFo1?=
 =?utf-8?B?RTFIQ1NHYnFuL2NXOHRqY2lZZ3llQ1BGc3lpS3dYcTlwVHR0bFJ4V091UFh5?=
 =?utf-8?B?VTBPNmZxTUx5aG1xMEtpUlhJWm9UZVk3VitELzExSlNTRDkvUEJHdjFhMlRq?=
 =?utf-8?B?ZW9oZ1B3eHYxSkZlUnJPSFZuQXhlOGk5ek5NNExVb3Q4K0pKcmRUcklUSFE3?=
 =?utf-8?B?UEZVQU9JcUhUSVpEdW85NzVyZ1JBa0hkd2tlbkRVS2N6UDdZL1h6U2JqaFBR?=
 =?utf-8?B?aTQ3eGFFR051aHprWmg5dGI3TXlOenM1b1p5aC9xcDdGZzg3OFhFOVJEUklo?=
 =?utf-8?B?SE0raWRibFFEVStNK3FBVTJRTzUrVmk4bGdGbWttZy9mZlIxUXpEMXF3UHY1?=
 =?utf-8?B?WDFWZ0hOQm1ZR0diamJJcVNlWVdlNmc3Sndma1JHZGFyTExDQXhtVGZnQ1M2?=
 =?utf-8?B?d1FGTUxtUUlWelR0anBaVC8zOE92dHB6OXM4Sk01OXBtUnZQb1phZzBFS21u?=
 =?utf-8?B?cDZuY1NiSmlXTzQzWUtjOXF2OWpQcW4zQUtRd2tvNEgzZlJ4YllLU3h0ZFdE?=
 =?utf-8?B?V0Z5Z2ZRczBGVGMxOFFvU3ViY0JQS0IwSTRIN3BpR1o5aGVJMHV3cFcwaFlP?=
 =?utf-8?B?SjJpNmFKTTBWTGtkeWU1dnZpMXJ1QXUzZ09VQzRIdzI3cE02ZlY5c3NGOVFp?=
 =?utf-8?B?U3gxdEF1bVZqTjlXcjFtUFpBek5VMmdFUDZqa2JmSkU5SjZwai80VENWWUxF?=
 =?utf-8?B?N0NDSDFLVEZKMEpqVGdnYUs3UXVIZHA0OVBaUCtmRnB3RCtuM1RBdmZlZThw?=
 =?utf-8?B?enQrUDd6WVhhOUl1Z1M5eXRxYU9pSTU0L2hTTStzMzI4UGhmaWlTRGpMSDJZ?=
 =?utf-8?B?RS9IWUtSc1grdXk0VlZpclhKYjQwK1E0MDE3UmFJdmxJclZXa0lCelk4bVZ4?=
 =?utf-8?B?d25wUTRaVDhXOGRuT0Q3b3pZcDgwUkNycFZtODA0OHFwNlZFVkNEaUhkVmV0?=
 =?utf-8?B?bGNNcVAvWnZLOEJwb0IxTWp0Z1FwYjRmUy8rY3JQTVMrMlVCa3hZWVBJcVN4?=
 =?utf-8?B?Y1lDSmR2YkZFd09CcTVhbllIUmZpNFJGMU1oY25iQjRLYkxkUm9HK3A0cUkv?=
 =?utf-8?B?bXZZQlcwQ0l6K045V0pLVWJwa1R5cWVkYS9ONG01Z2ZuS3pTQkxIYlcvWHVF?=
 =?utf-8?B?SXZnWG5ZR25LdUVIOVZyUjIyUEJpaVpaTjJjSTRGYUVKTlF5ZkRmV1Q3cFdh?=
 =?utf-8?B?WHBtNWlxVHBqcE5jM3Vxekp2YnUreTRpZWZwME5TZ2s3YlhnTnJtbHJRWGpR?=
 =?utf-8?B?QjRNVXN5Q2k2K0MxVFdNL2pHWis0M0xwRjV1VlAwRkVhdHAvOFluWTJYZ1pT?=
 =?utf-8?B?WWM2d29lRjZucmJmaUhpWDZ2dHR3RjByUVVxRDV3M28yNjJrUEVpZi9hb2FT?=
 =?utf-8?B?akxiWmM2NmdJdzVCbjdSZDNWZ3dvQWhQbXE4ZTFybmJyOHdsZ3dwb2U5NEls?=
 =?utf-8?B?Y1ZsdHFlaWJ1eG9YRFZUcjNvZHFBQ2JTQzk5T01RdURQWFh5d2RjTFJJamlB?=
 =?utf-8?B?Qmg3NUUyajJoNnhuTjdoaDhwYVFtRGdrSDJZQU9aUDJtSk02c3hudzhxQlBH?=
 =?utf-8?B?dDFTd2RESFNoRnNZQU81bUxqZFJUVFl4ZlZXSjJrSFJNVzYxWHVST2dPZjhx?=
 =?utf-8?Q?p7OTZfh8xo9g75M41LgpcAztq9hxlzQNglRacDaEWrF/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96632833-5b39-4df8-cb7c-08ddac86c7f5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 03:35:03.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wHcWj2abyWM+57Mqn/7POb4F5Szrp0UgVLF13SLfrl+gyu+PXSblxE3x66ZHNKA7xmtAVMDX55/gQUnFCxu2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

Given that `from_bytes_with_nul_unchecked` is paired with
`from_bytes_with_nul`, it looks asymmetric that
`from_bytes_with_nul_unchecked_mut` did not have its faillible safe
counterpart.

To avoid repetition, factorize the `CStr` validity check code into a
private function.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/str.rs | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 28f2f359ab23e6a926e88913e3cc9f481aa86037..21d6f8801ea84686d4aa909fbb52578af96fe2d8 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -243,11 +243,13 @@ pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ffi::c_char) -> &'a Self {
         unsafe { Self::from_bytes_with_nul_unchecked(bytes) }
     }
 
-    /// Creates a [`CStr`] from a `[u8]`.
+    /// Returns `Ok` if `bytes` can safely be interpreted as a [`CStr`].
     ///
-    /// The provided slice must be `NUL`-terminated, does not contain any
-    /// interior `NUL` bytes.
-    pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError> {
+    /// `bytes` is a valid [`CStr`] if:
+    /// * It is not empty,
+    /// * It is zero-terminated,
+    /// * It does not contain any other zero byte.
+    const fn is_valid_cstr(bytes: &[u8]) -> Result<(), CStrConvertError> {
         if bytes.is_empty() {
             return Err(CStrConvertError::NotNulTerminated);
         }
@@ -263,8 +265,31 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
             }
             i += 1;
         }
-        // SAFETY: We just checked that all properties hold.
-        Ok(unsafe { Self::from_bytes_with_nul_unchecked(bytes) })
+
+        Ok(())
+    }
+
+    /// Creates a [`CStr`] from a `[u8]`.
+    ///
+    /// The provided slice must be `NUL`-terminated, does not contain any
+    /// interior `NUL` bytes.
+    pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError> {
+        match Self::is_valid_cstr(bytes) {
+            // SAFETY: We just checked that all properties hold.
+            Ok(()) => Ok(unsafe { Self::from_bytes_with_nul_unchecked(bytes) }),
+            Err(e) => Err(e),
+        }
+    }
+
+    /// Creates a mutable [`CStr`] from a mutable `[u8]`.
+    ///
+    /// The provided slice must be `NUL`-terminated and not contain any interior `NUL` bytes.
+    pub const fn from_bytes_with_nul_mut(bytes: &mut [u8]) -> Result<&mut Self, CStrConvertError> {
+        match Self::is_valid_cstr(bytes) {
+            // SAFETY: We just checked that all properties hold.
+            Ok(()) => Ok(unsafe { Self::from_bytes_with_nul_unchecked_mut(bytes) }),
+            Err(e) => Err(e),
+        }
     }
 
     /// Creates a [`CStr`] from a `[u8]` without performing any additional

-- 
2.49.0


Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C7F1C3C18;
	Tue,  8 Apr 2025 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120812; cv=fail; b=tTeh0IzP12UzKcpj1So7kniLuQDo1iV2pzzaWjDW/MbgTYQ6ZYxvEp1tTLkasWH4MpfbSUpqhobw+A+WBmlGJl5jocwtasFwsPA50DosYIAzZAZhZJNjszklEvzWCHsPvCHL3/HCZ6j9OC4gcTK/SaiJ3T0OXt7Mf6LyCH8Lkcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120812; c=relaxed/simple;
	bh=UqbQCGWq4Y+FGzShkTPA08fLJ6MPkD6YT8MIOQg5sic=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=umdmSNzuuxjvmmR3LIgA6B547gurUYgW6JCm0SVJRYJdvoH7bD7zBveRX7FH1lrrXmGciV/uCS+oV9gFCBIRCc1QP93iB2WrKLCEATCMSFIq2i3VS2lJH4ZgVCWMo4Eus8T0RJ75HDVBBqTl4pyFjjMn0rB9o0e6xYI4SWC4kHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a2R6arA9; arc=fail smtp.client-ip=40.107.92.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a2R6arA9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbcV2MdFIzlt0tsnk4p1DoXZr7ujnR0eQ/IBfxPQkWzZxpjXBbWhwb4PCfB0BmNDNP/3x5+762JT2Ks9frBSethOwVvJwk7ffDUhujBKxHY3fHl+DGaLbPeZ38/ZtUpQPsom4X6LNcOI8IGJ0Z2ZbCJum/m0FW717srYKwHtIuI4/uU9ZEwLYBI4/eH7W73CiJ5/DqnMuo1FNKB2rL51cGrIJCE1D2iUFRHQG02Nj03Fg5s/d0QEYV+I1QGiZHqQG3URljF6IoSJXnG61A9Ll9AyA5a9W7Ox+MeGyV+nmn3SkAZJa6knlypYDxvlnvSG0KnTmX8oN5shQ5CQsv4Buw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74+QGwDpES5cwsG0AUzdHQocdvCj5vSqR2XjnO+WbpE=;
 b=gNZvci93xwP7hLuLUnGr8Z/rcjNqpG08kX9PUW6DwVoZhdaY2Z9vEmbJAe60h/MssbzT0WKfNnEuMmEYVnVULNXQX65+cWZeLPlGk1GJllnzQJ2bdvTzBTilvcfa5xFveWOvquZ1+/6i+ChtzFtryqSUKSPV99unWxPNStHkjG+NtNDOX94/Pw00qC2ItLQV3QNsK6wseBqjbuAXPNzhypc/fsFmM0yUe9FNGdjvO0JuZsALXy69/3a7P5n5iM7cgP5A9KaGb2HI5rCcVTHZY8lH9QCvwf26Jg2p/kKz1bI+irH6GYPcKQeCFGbGpwiKBJjV+8V70rLmzaVgi08wxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74+QGwDpES5cwsG0AUzdHQocdvCj5vSqR2XjnO+WbpE=;
 b=a2R6arA9ZI+NlWlCz89jwQEN1D1Fy8G/s3k4kUnwd3IZG7LrjEU+NRbbD2TAlXq3BLwx/mOzUTbDlzu7fa3XUYq09EKEXjHt7sGgP8I9eyOyEeDHPmS3MZAOieDOI8KhCvRpydZK+tbJR16xflspP6drdfF7Oe4mK2XI6329v6T5B6TQPm+OwgIC9lCJdD3cBsJqs+vx99JXnm1bSi4GQtlqGo/HP8ua7NAkV9esBnXyu+pRM4rnAmJUtUrgOu6BPMjjUczVr4+5pZtfTX8XcGtW+A1qMBDC2EzMrbRhH5O2ux0b+sWRa2hpPoy92gLW6bDmxx/YqOXggGcUebFfPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8503.namprd12.prod.outlook.com (2603:10b6:8:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 14:00:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 14:00:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 23:00:03 +0900
Message-Id: <D91B844M3AIC.1HUEPDZZX2O9C@nvidia.com>
To: "Benno Lossin" <benno.lossin@proton.me>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <D90JUX1YE0MR.25XH5EZLUCDBM@proton.me>
In-Reply-To: <D90JUX1YE0MR.25XH5EZLUCDBM@proton.me>
X-ClientProxiedBy: TYAPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:404:28::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d878733-6e19-4f65-2305-08dd76a5aaf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVBtZmtyaENYeGpiVFI0UksyWnlFaHhGTDloeXBrWGNtd29KZ3J1QTBJODI1?=
 =?utf-8?B?Zk5Vc3EydzNmellwMUpiODRnRUhMYWliK2owdzZkaEp5QmY3YzNLWDMzTmx0?=
 =?utf-8?B?NEJHb0tod0FaMmRBM3M2Wk5teFk5aXRVRW1STFZRRnhHdVNGcURCN1M2Vm9y?=
 =?utf-8?B?VEIyZ21GYnVaQmpFQkFKVWJKaEhqcUlyUGVTUFR4M3R1V0RXem4xczFpWDhi?=
 =?utf-8?B?MjRuaHQvczdOUHVXU2pyd1FzRlZlcS9wODJmS3c4K0xDU2c2MDF2OTRuZ1E1?=
 =?utf-8?B?Rm1EMm85YmRZWUVGRGpPN0dLNTZHeTdWUWt4OEdlNC9rblRhL3dGck9DS24w?=
 =?utf-8?B?NHJYbjlxazBkMTl4Yjk2SWt1b2xMVHI1VHc3VHowTXk1TkpCd1Ridm9LUnFq?=
 =?utf-8?B?dFRRNCtMNUJhbWVKWlNnR2ZRM2cwSEVyeXZkZjF6ZElJYmRMU0ZobG8vTCtF?=
 =?utf-8?B?bjZpczlkR2pkd0RHVjNRL256L2JmSFJxKzkzOGdhRThYN0tSMVRsclBZdEhr?=
 =?utf-8?B?U29BTis0UFA0MU9uT0NlU3ExNlhBSkFqeDFNcU1iY0lLRDZ2VU1KWEk1TjQy?=
 =?utf-8?B?OEg5Mno4T09UWHJlQ0REaXVCdnF3djlvcmRvekZ1dHVOK0xZOWEwRVpZZldp?=
 =?utf-8?B?WVMraHNkZkR0K3M3ZFdGcEhQTC9nL005cGx6eTNhMVp0ZWtySi8yb0kvUDFx?=
 =?utf-8?B?ZFJtNm53MDBFTWdSZHB0NFVpUS9kcU9SMXA4eHd0N05wbE40N3NpRUlmY2Jr?=
 =?utf-8?B?K0xQdTNkenExSCs5Y1IzVDFuNU5BTGxvUUlEbnQ3Uld0Z252MVM2SkM0d2Jj?=
 =?utf-8?B?TmpYVDVoUzBwdzRydjl1WW55RHNrTWdxT0gwd2NyRXpqZE1aeGZwUlJJbWhE?=
 =?utf-8?B?YjIyYjEyLzFtTWtON3UzTXZ4dWVLU3VLbTBtYzlyOW5jV3BVdktCaDA2aEZM?=
 =?utf-8?B?cDBobHJjVFpSTnE3bVFEeTlDNHl6LzJZMVNaOGZ2SC9SSHFiSGtGd0s5NWlT?=
 =?utf-8?B?MTNzZ3BzRmp1bHRZWDlaWEdQNjRZQTRrSEd2K2JVcXpwMXRSeGtqY3lCNFcz?=
 =?utf-8?B?bHpNdlRwc1lFSndSL3lMSlorYURpazBBK2RxQk9SMWpLN1czb0FrdEg2dkc2?=
 =?utf-8?B?M0l5ekRrY1JSZHQ4YWFCWUlCcGlSUFFTZXd4ZkRkQnl3SUtzWnpRVlZNSXpx?=
 =?utf-8?B?RThPdVJ5T09FSWlscERvS3BUNlhmUUlLT0E2SEVnVzZkbmx4M3hES0hmam1I?=
 =?utf-8?B?aDJYN3M5ei9kQW1uK1RwN25BR2VXckk2WUsxcURYSzF0c2tKSHMwdnFEMG4z?=
 =?utf-8?B?clpQOTZqUGg2Q0pzYTYwOG8yMkIwMnlGZ2pDYmFlalFXVFovQWZpdXV6dEpr?=
 =?utf-8?B?cjI1ZG9uZm9TNVg4QjAyUHZnVVRpSnh3SzUyWUxTVUxkSCtldTdFU0QyRkhs?=
 =?utf-8?B?OUNwa3JiQWswZVFNdFMzM2xNWklmYXVpT0ozRk1qdTJIZndzT1ZIVGE0ZzQ2?=
 =?utf-8?B?eTRZbnAzelMrYXdNOEM1ZkpsS0REVG1IUDd1cWRINWVpNmRDVkFYV1BLN09l?=
 =?utf-8?B?M2g3cWd4NGkvM3pycEpXak0rQkxmc2g2WTQ0MU1GQ09FWW9IUUR1K0Q4dzFR?=
 =?utf-8?B?dkJ2R1ZNZytTZnR5SDl4S2RuekhwMEhpOHJLZHFRQVUwZFJtdVVkbW4xL1ZO?=
 =?utf-8?B?UVJzdVdyZDY5RXNiV09vVllWUnNsRXdWYnp0MnIyR0tHTW9xcnVCc29jNERE?=
 =?utf-8?B?cVFudE14ZHNhYkZ4UHROZVVTTlJTbmc1SHlna1VZeHFXdUNyeUJ6QjFsajVR?=
 =?utf-8?B?dGNNdDREd1VFVzBjSmQ3UFVlZFNjYVJQUlZNVzhTQ0o3MEsxcVVyYkhzbG5V?=
 =?utf-8?B?VDROYVVjdFV1ZkQ4SWZ4Tm4zd0FIb0F1akxFVFU2R0loRFJSVS9xYUh0RGRN?=
 =?utf-8?B?VVRHNkNLQXEzREVrcTRHa00wSzRRZ3BheGhGcTFMN0hqZis3c09jTnFqZFE5?=
 =?utf-8?B?bTE1TXVYS3FBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anhlekdNWlZ5OFl5eUdMbEt3THpvSXByNzN4YUFXSzVkNnprMVdrSzVBUlpN?=
 =?utf-8?B?ako2aVhtV1VKemw0dUlvdmhwRTVRL3lqTmlBTVZQUjMvVUxFeGRqcFFDZ0o3?=
 =?utf-8?B?QkVmeXBSbFZ6R091b1lRQmttZ3BNOXV1T3JBR3Z0cm1jZS8rRTkzWUhKV3J4?=
 =?utf-8?B?R2IySFJsTS9GMlp6YjlKRGJmdHI4ZnAxeHNUWks3UTlkSFJwZUJUUVdtRk1U?=
 =?utf-8?B?N3JZR20rTjVVeldLSGt0YlhpMk5rMEJGTGdpMml3ZjBlSklPYzZjaTEvNWZR?=
 =?utf-8?B?M3ZWVGwwNmVkeE41em95Z294UmJXZXNBVnBjbUo5Q0RmbzRkR3Z6VHpqSERX?=
 =?utf-8?B?c3MrNFA1dy8rWHl6NHNFUEx1K0x3Z3E4d09YSGNJcHVCaVp2Y0pIdVhMV1F1?=
 =?utf-8?B?WGU0TVV5aXVYbnJYd3lhK0Q4cVVRSTlKNUM5bWNRcWcvTzNKQVVZclJXY1Y1?=
 =?utf-8?B?L01rQ2RSVjlWS3pYZkFvVUlSbHdNQ1RZOVBCRzFyVkx3Ymdwb1Z1R3VZK1hM?=
 =?utf-8?B?dS9Nei9WanlKQytmcDd5Wmo2UUl2VnF5Y0dLcVVFM1VxMWlXY0RPaUJCUmZK?=
 =?utf-8?B?WmhYMlFGMFRBT0FvdGRuNGY5WC9HQTM4TkxYSU1kQnU5RFZQWEF4U1BXNWZ6?=
 =?utf-8?B?bzZ3YVdXUythRTJ6cFNkRWYwdnErbnVibi84T1hNbEJiR015SStQbm85dW9T?=
 =?utf-8?B?NWhndEE5TlkxaHkzWlo1V2ZSU3ZlOGQ3dy8zZGJlbVFBRHVMM0NYYkViZlln?=
 =?utf-8?B?Q2c4TXIyVUlnL0NqeGRsRXRJMk9Xam9VbW5ZeUYrY2hHbDRmNU5EZlUvMktv?=
 =?utf-8?B?SEV6OWRPYWRSRWFaNHJIVjl1U0w2NjhWbUpWaGdjZUJuY1c3anUyQWpob05U?=
 =?utf-8?B?aWphUHJDQW5FbjJzeFAvakJ4R2hCRTRSeVNGSUFsQnUwWjlyZFVydmsyQjBs?=
 =?utf-8?B?VW9OaWdLZ243UEEyOTJDSXJVZEtWb2xFYzlMVDNPZ1JNaU9nSm9zYWpTR21J?=
 =?utf-8?B?cUd6RTZGYWRsb0JyL21lTUJQSythUm01ZmUvTWtQUzRuQjVxV2psa05SLzFQ?=
 =?utf-8?B?M2tIZUczQ2Rqc0E4bzM3K3Aya3Y2cDEvc25vRXlwUnBpZFNsRWZUcDdlUWdZ?=
 =?utf-8?B?VDJ0OHh4VFB2Z25DcHB4T3IyOXdBV1JCVkduMlFCN1htYW5rQXdCbklvU1JJ?=
 =?utf-8?B?MEhwUVJuZE5sN3VDYkVkMlpNRTNPNnNRVE1NangveDRzYkM1UzVodlhNNTFN?=
 =?utf-8?B?R2xEOW84OW14d2F5UXRjZkRjcmtGRU1jQUpXS1U4aUQxcFhYOU1HV1pnaFdP?=
 =?utf-8?B?NU9TaVlRTUdsa2ZMQy84d0I2ajRjYnI2TmhlbUZjMFUxMzFRWERrd2t1bTFk?=
 =?utf-8?B?cldjWUhGL2pwZ0RUd01RbmJMK3VQTlc2bzJqSzZBSmp2RnN4L2U0aW1MME1S?=
 =?utf-8?B?aVdTZ2xvMEV0a0JrcXVIYjZsdFRnbVg3bzExQmZPeVlvQ2ZyL1o3SjJCMDA5?=
 =?utf-8?B?bUhLc2pHZEZ5ZmtVcDFaK25MQmdzMmp3elkzQkVoSzk4c3MzVG5sdkcrbWlt?=
 =?utf-8?B?SkVEZFVPZG1xdndITWphUWhuOVY3eFlHOWZ5MHpVTDdOSTlVRG9TQk9ZWDIx?=
 =?utf-8?B?b3dRME83K1ZtY21KSkJVS09pRnd1KzhVOCtWV0VYOTVaOXNXRjZCMEtyODk3?=
 =?utf-8?B?end2ek1uclpUNEZ5QWlLVWJpMHN2RFhpaktkRVhJYVR0OGY0MmdGdmQ5V0ti?=
 =?utf-8?B?SEdNdEJyUHU3azZ3ZHdRR080cGprVk93VUhVRHUzekNTRmdWbytpdTEwazU0?=
 =?utf-8?B?V2E5NUVCa2svNTVtY2UvSkx3WXFxYnBOKzczbjRTcno2TjNkRnh3K1I2ekhJ?=
 =?utf-8?B?SGFXTW1UdDFQZFlNK1c5QlFqK2pBMURMTXo1SWVYLzNOV0ZaVkNjZitxUmNL?=
 =?utf-8?B?cVkvT3ZMdGJNNGdHMmpvaG02YVRZWTRFT3FLNEJvREhRY3h5ajdrbERYUmxW?=
 =?utf-8?B?WEJEcS92Z1Z3VG5sOWxHeEVJbFUvN29ZMU1JcWE2bmpOWjZpYnVkalV1RTVa?=
 =?utf-8?B?ektqemhJK2FLMjg4YmVEZ3EwYityOUUyUnNiRldFV0NQNUszOWo2ODhmdHgz?=
 =?utf-8?B?RkcxMmhjVkdWLzBINldoMzFGWlpTT21VNHZESS9xc0xSUk44Y3p6MEhjbHh6?=
 =?utf-8?Q?h3JllUWqQrHDYs5qrA7Kfko9M1V0tr76+dvxAKhxpOAV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d878733-6e19-4f65-2305-08dd76a5aaf3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:00:06.8525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XK3PWjOkT6ZD4HpChetsuyXDUiPsCaLb00B+4FKbe+8nVneJpK2l1jzOJCTo5FqPe4VrEPUaj21A9ChHT9KUeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8503

On Tue Apr 8, 2025 at 1:33 AM JST, Benno Lossin wrote:
> On Sun Apr 6, 2025 at 3:01 PM CEST, Alexandre Courbot wrote:
>> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>> index ae9d072741cedbb34bed0be0c20cc75472aa53be..b3c4227e232cca3b5c17930a=
bc63810240b9c4da 100644
>> --- a/rust/kernel/alloc/kvec.rs
>> +++ b/rust/kernel/alloc/kvec.rs
>> @@ -454,30 +454,86 @@ pub fn reserve(&mut self, additional: usize, flags=
: Flags) -> Result<(), AllocEr
>>      }
>>  }
>> =20
>> +impl<T, A: Allocator> Vec<T, A> {
>> +    /// Extends the vector by the elements of `iter`.
>> +    ///
>> +    /// This uses [`Iterator::size_hint`] to optimize memory reallocati=
ons, but will work even with
>> +    /// imprecise implementations - albeit in a non-optimal way.
>> +    ///
>> +    /// This method returns an error if a memory reallocation required =
to accommodate the new items
>> +    /// failed. In this case, callers must assume that some (but not al=
l) elements of `iter` might
>> +    /// have been added to the vector.
>
> I would add that items that haven't been added to the vector remain in
> the iterator. Do note that some iterators drops the items when the
> iterator is dropped. But if not, one can still access them later:
>
>     let vec1 =3D vec![...];
>     let mut vec2 =3D KVec::new();
>     let mut iter =3D vec1.iter();
>     if let Err(_) =3D vec2.extend(&mut iter) {
>         // can access remaining items:
>         for item in iter {
>             pr_info!("item: {item:?}\n");
>         }
>     }

Indeed, better to mention that, although I guess that if we go with our
own unsafe exact size trait like Danilo suggested we won't ever need to
allocate more than once anyway.

>
>> +    ///
>> +    /// # Note on optimal behavior and correctness
>> +    ///
>> +    /// The efficiency of this method depends on how reliable the [`Ite=
rator::size_hint`]
>> +    /// implementation of the `iter` is.
>> +    ///
>> +    /// It performs optimally with at most a single memory reallocation=
 if the lower bound of
>> +    /// `size_hint` is the exact number of items actually yielded.
>> +    ///
>> +    /// If `size_hint` is more vague, there may be as many memory reall=
ocations as necessary to
>> +    /// cover the whole iterator from the successive lower bounds retur=
ned by `size_hint`.
>> +    ///
>> +    /// If `size_hint` signals more items than actually yielded by the =
iterator, some unused memory
>> +    /// might be reserved.
>> +    ///
>> +    /// Finally, whenever `size_hint` returns `(0, Some(0))`, the metho=
d assumes that no more items
>> +    /// are yielded by the iterator and returns. This may result in som=
e items not being added if
>> +    /// there were still some remaining.
>
> Why do this? Can't we just call `next` and see if that is `None` too?
> You could use `Peekable` [1] to call `peek` instead, then the logic
> below shouldn't be too complex.
>
> [1]: https://doc.rust-lang.org/core/iter/trait.Iterator.html#method.peeka=
ble

What worried me there was that the compiler might not be able to
optimize the loop away if we always do a last checking `next()` call,
hence this shortcut to avoid an extra loop for the most obvious cases.
But again this should be solved by Danilo's suggestion.

>
>> +    ///
>> +    /// In the kernel most iterators are expected to have a precise and=
 correct `size_hint`
>> +    /// implementation, so this should nicely optimize out for these ca=
ses.
>> +    pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), Al=
locError>
>> +    where
>> +        I: IntoIterator<Item =3D T>,
>> +    {
>> +        let mut iter =3D iter.into_iter();
>> +
>> +        loop {
>> +            let low_bound =3D match iter.size_hint() {
>> +                // No more items expected, we can return.
>> +                (0, Some(0)) =3D> break,
>> +                // Possibly more items but not certain, tentatively add=
 one.
>> +                (0, _) =3D> 1,
>> +                // More items pending, reserve space for the lower boun=
d.
>> +                (low_bound, _) =3D> low_bound,
>> +            };
>> +
>> +            self.reserve(low_bound, flags)?;
>> +
>> +            // Number of items we actually added.
>> +            let added_items =3D self
>> +                .spare_capacity_mut()
>> +                .iter_mut()
>> +                // Take a mutable reference to the iterator so we can r=
euse it in the next
>> +                // iteration of the loop if needed.
>> +                .zip(&mut iter)
>> +                .fold(0, |count, (dst, src)| {
>> +                    dst.write(src);
>> +
>> +                    count + 1
>> +                });
>> +
>> +            // SAFETY:
>> +            // - `self.len() + added_items <=3D self.capacity()` due to=
 the call to `reserve` above,
>
> In my mind this precondition holds, since
>
>     self.spare_capacity_mut().len() + self.len() =3D=3D self.capacity()
>
> and
>
>     added_items <=3D self.spare_capacity_mut().len()
>
> But I guess we haven't written the first one down anywhere.
>
>> +            // - items `[self.len()..self.len() + added_items - 1]` are=
 initialized.
>> +            unsafe { self.set_len(self.len() + added_items) };
>> +
>> +            // `size_hint` was incorrect and our iterator ended before =
its advertized lower bound.
>> +            if added_items < low_bound {
>> +                break;
>> +            }
>> +        }
>> +
>> +        Ok(())
>> +    }
>> +}
>> +
>>  impl<T: Clone, A: Allocator> Vec<T, A> {
>>      /// Extend the vector by `n` clones of `value`.
>>      pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> =
Result<(), AllocError> {
>> -        if n =3D=3D 0 {
>> -            return Ok(());
>> -        }
>> -
>> -        self.reserve(n, flags)?;
>> -
>> -        let spare =3D self.spare_capacity_mut();
>> -
>> -        for item in spare.iter_mut().take(n - 1) {
>> -            item.write(value.clone());
>> -        }
>> -
>> -        // We can write the last element directly without cloning needl=
essly.
>> -        spare[n - 1].write(value);
>> -
>> -        // SAFETY:
>> -        // - `self.len() + n < self.capacity()` due to the call to rese=
rve above,
>> -        // - the loop and the line above initialized the next `n` eleme=
nts.
>> -        unsafe { self.set_len(self.len() + n) };
>> -
>> -        Ok(())
>> +        self.extend(core::iter::repeat_n(value, n), flags)
>
> `repeat_n` is not stable in 1.78.0, so you need to add `iter_repeat_n`
> to the allowed features.

Indeed - added the feature, thanks for catching this.

Thanks,
Alex.

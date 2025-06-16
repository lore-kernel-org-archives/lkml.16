Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A92C1CF5C6;
	Mon, 16 Jun 2025 03:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044904; cv=fail; b=NA//0O2b6lKn7j6G/oC0qfu8whPZJuKyTY51dX3ycRCvE4UdATG8jvBXOt3g859bsGM97AXwuWChXljtI5u6dsgjP32Dv4dmdyNRwTFvejRuAmRRXL+9lmznfIPRD9gMA+oJMwL3KYJH4TnNW67D42aHxDexfMFeQ7ckG+9Jw0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044904; c=relaxed/simple;
	bh=OeDFU13KsnvBob9bcUH2zU+l3Ri33W0PvCE9F9WNGwg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ggh2GiUMcqXw/V1FIz6+bl8ganASNyxyqK7nGzGMTym9uuYqWEY6z+e95z8gGvxfBiAhCeEuBqaHeleWM17c8f90rQGrpkUNJe22EGVIcEGqn9g49U8kyU8KR+mh4Kys6hQS4BTPVoAiQmLNIbC00LB7nBPAeq/+x/FOSjhV5VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=plsNLff7; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="plsNLff7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfsrbOISMVTK3FIyo3LvBvGducTqJKh8HqfFIoX++6qZph9a4i8Nh+KbLTag7NyLVDzfHgvXHZhAR1nvyIMihZvTJ55e+c2C6Pn/AhAs8fwX+tlrTzQth12NpboKapMSa6cKFbfHJ9zw9AbWkAz+cZ2mPkZFJ7CmhtZY041Gz30qNTCi2D7xX2/MuUNzjaYrOk5B7fXLj0ipRJQNgG9AT5Z1xF+Q+itVKyq22N8JoNm2Ii2IDwREqdWruixxSRVQ+rdQcVtNyfVGLJFFt29zHgt/BK6gp4nwkcaofHZsaWFX59zkScbSvWoIpG86KzWEORHxyMx//1zmI7vQMqmGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etG2gW45oib8irthRAdx6lSPjZmK5R7Ea3195Q9jmHo=;
 b=AxnZCWtzcNs+Ll4yx+ejTorqV5lOVAGO2BqohplnM6sPNS8SsQxv2ffIRVsSiU07MuE/DovK/H5pAvw7h+nQQhSoUgaOPxqEyZiLmvedDhCSaUOSlmccJZEbsprxuob/6WyaNPBxJSiDqHsxx+0nhs900h6UJ4zGjA8Tl+Mm1cOHS32W3fIJQJR0JwPBTBjDF3GNiHItOZM03Mq+ujUGePR4Hx99Y0yptRKjKUVLkKuj0kV/rW6MtMOo7twcHgbG2LFVvMbAykq+VMoI8NdkiV4aiQNn8x6fZ780gclo8JZboRrEWr4NScXiMCBl4OTu60kX4OpmQPv61XoIEs4ejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etG2gW45oib8irthRAdx6lSPjZmK5R7Ea3195Q9jmHo=;
 b=plsNLff79y1u5MhDdkqjFjPSY0gVPRYAbYQRizExl7dy6QtJeYEYyayPA+2LIiMFavKhFG+Ook9KYufCsZEUXyEIJHHmKlWOOlsHmAhVFCGHs+rorWBujHv8mfEZttiYztrJP8nxp64bHAa/SsL8fvphpDEnY9CfM24b+54CuV5D3PIAfyBvJzR5PlwP64vH/uDM1bR2/AT37kPOR8y9y0UYlxbroAO6k3U0ZpNrWNZgEwZpm+47lOGQEpmaC2XshujQbtmwIgiGTPnY+GMUF7w8Na2wugIMsklvSMdymnGercXvN813vymC0FMW9+9DWC8M93J+nzi1/VjFS56Axg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 03:35:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 03:35:00 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Jun 2025 12:34:09 +0900
Subject: [PATCH v4 5/7] rust: str: use transmute in
 `from_bytes_with_nul_unchecked_mut`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-borrow_impls-v4-5-36f9beb3fe6a@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0271.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: 64bda462-b39f-4083-cd78-08ddac86c631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm11c2RJRUNzMWt4SXM0VU5aZ28wNkRFVDg3aE9KQXhZa203TDR6Ym1nOEF3?=
 =?utf-8?B?cjZTbnE1cDQyeTRQVHZTZmlpTGRPWXRjUWFZUDl2QTBHNm9VU2tSeVl4TVBu?=
 =?utf-8?B?L1JmTmFlbHhlNDBUSC9aM3dQRExYa242S0p2c2x4WjJBUWRDNU5WU00vWlRw?=
 =?utf-8?B?SXQ0bjdMNFZxNk1vTW80UE12UXVSNnJpV2tMMlZXa3dLdkJoQlBlTXdiY1hp?=
 =?utf-8?B?dUdFVzZrTU5KS1pEbEE1TWxjTEVUcVhsWW9LM3piS2tBY2hLZnFqeDZsZ3Rx?=
 =?utf-8?B?a3hqa2NjdkFRZU9kVWJDTG13Um5PQWthR0t0Ri9Zd0NJZy9WRFdiWGlUR2pK?=
 =?utf-8?B?SnFzMnBqWktHY3VVS0lEc1VpL0RwdnJMUlNueVBpS0FDQXlmSnc2YmZ5cG5P?=
 =?utf-8?B?ZXd3d0dTTU9oSzc2U20zVSsyazkyRW5QTEVEbExyUzJRckhobG9RVGRxQWFI?=
 =?utf-8?B?RFlxeVJLSDVmOGNOSS9RaWZYeFJMMDlnaUFwcDZJY1Q1RjJPa2FoM09yQ2tV?=
 =?utf-8?B?VnNocTJ6K2hVUWlmeUVHNmlDSlJZbXZMOFZmdHhteDM5OW1pdHpKQ0dianBI?=
 =?utf-8?B?OXFnYzZjd3pMYnZDWklhNTBkbjMrRGtXbWk1S2t0T3dQelRud1ZuQjFMTHdR?=
 =?utf-8?B?OUt5bjE1SEdnN1ZZTjJuWjNkcnErVE01TmtORUZPQW14MnpBQzF6clJSaGtI?=
 =?utf-8?B?NzBBUit3bVZPeW1mbDJxdm5wYWE1ZWNBMGl0NWJOU25NV3diVnZqSlVpUTJz?=
 =?utf-8?B?Umd4ZDFaalk1Y1krdE9FVGF2bVBpamZrWU1xcVM0dWppM3krMUFyZktTRGtJ?=
 =?utf-8?B?UjFaSHZMSitIdDlEbU5TMGY1d0Jzd2JZSnFIVlU3aG5RQ002Ym1tQVYwQ1NE?=
 =?utf-8?B?aER3VkdZVDV4cXRzcjVUVXJmc3VuUjJlR3BmTHlVUVpDT3pWdjNQQlZhSlp1?=
 =?utf-8?B?eHpxNENNenhkbE02M2xDUEJ2dVVPMXNiNnVoYXluOTkxWTN3aWJwdkxzaERj?=
 =?utf-8?B?UjJyYldIbUFuNUdZMHo4eHFMN1FhRnZGRXdqRHRWWURHMFlySTJIZnRKNGRN?=
 =?utf-8?B?OXlyVzIrSk9hT21oSm9HMnVEb2VIYmIwUXVhMEdWcEdDSmpjQ0d6SUt3UDZz?=
 =?utf-8?B?WXJpamRZTkZiR2hpb25wSUZXMlE4MDNWdnArNTVqRTFRS3hDMnlSMnpwT2RK?=
 =?utf-8?B?Z0g2bktwSnlHNStnWkV0U0Z5ZUFQQ2F4U0s3NUhvbVd3QjQ3QTlOZHVOdnlF?=
 =?utf-8?B?aUxQWjhqd1JoNHI4TTI2WnRPNFF4K3hVS1gxWUdLUWpUck5JUm9NSDNnRDI2?=
 =?utf-8?B?UEliUXJOT1I1dkRoV0Z6OFFnMWZPazR0VitVYU82NXZ4S1BiQnRMUjZ3dWhw?=
 =?utf-8?B?bW9DWGFrVGJjZnpHZkxsVEJjQkp4ajRaTStDZXd2NjFpeklLbVZ3K0VuMWxM?=
 =?utf-8?B?L1I3QjUrSWVXS080UXVyQUE2bDQ2Mk5nU2JWZEdtV0ZjZm1kY1RVcm54THFJ?=
 =?utf-8?B?blhzblloSnlPNERGbTg5cXEzeXBqbDRaMUVxdkxVaVRKQ2tvUlFWYURRaVps?=
 =?utf-8?B?VXBtcENzdlVUQUhqejZuTkJIS0RVZUNwcWxrUUhEUzNoSFJKZzFQRjA1NDUz?=
 =?utf-8?B?RXFRbk96OWtFbEsyem1IR01VRE5LV0ZTN3hHNWlPZmo2dkI0L1FTMFE2ZmNR?=
 =?utf-8?B?QldIc0xNaWFpZXhzRnBOcSsrZU11ekUzTUdhSDhjeElOZWhTc1htQk5Fai9t?=
 =?utf-8?B?bkE1TVRLaWUwcHFtM3gvQnErbUt2N3JHOWdZTFRNU2F5akVIenpBNzdOUDU4?=
 =?utf-8?B?QnlBSFIvTDViUXYySmNGSzBrenhxOUNGZThJT1RXTVdyaWVJQ1psK29xaUE5?=
 =?utf-8?B?ZFRSa0hOdnh3ck1XL0hqaXF2OGErVTlrUDVma0g1QmthbVlBLzZ0YmJMdG0x?=
 =?utf-8?B?cWtKQmpGRkZzTHg1d3oyV1FrcFkxZHczaG0vK1ltZXdvQ3MrN01PNDVIWG95?=
 =?utf-8?B?aXJzSmdVa3dBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3JyTmJyYW8zeVc3Nk9DV2dVck13cDYvNFUrOENjZXFPQXBPd0pjMjdjbGRI?=
 =?utf-8?B?aTZ3MXdYMmFLZ1NXM0FHcFJEdFl2TCtGd3lqSFd0Z0J3NG9iM1hkdFYvTEhi?=
 =?utf-8?B?Sk11VFh4MnI0NGNTM3FSenFjdUErN2NnL1k2aTlIVVZoRG1udXFyVnRIenBw?=
 =?utf-8?B?VWpOMDRxUE1UNjNpVEpacVhQdTF3a3NDWWFKaVhZTmUrMWJkZmEyWEZhT0Nr?=
 =?utf-8?B?WEpFUWR5UkVubzQwOUw2dHJOa2ExSmxQcGM5TmpaR0dEa0duNnp4RnVqZml3?=
 =?utf-8?B?UktrUWgyQVdmdDJYQlRKYVFkSUlPRWRmSWRybnV3R1NvNFBzOHBKLzlYM0Rz?=
 =?utf-8?B?V1krV0M5UWI3ZVFvYUtIVlZlRlRYQzNhVWFuT3NlWENjWHdxMExzbzdBcnJO?=
 =?utf-8?B?STJkVEt6Uy9KOGlGNjVLcmpSVTQ2azJETEs2d1U5bnh4bjdxRmZEUEJIb3JL?=
 =?utf-8?B?akZpZ2wwM1BseFRpYkFTaUxrVi8wOUNLYy95VFM3cm81KzEvK0wzVHorRkt2?=
 =?utf-8?B?dGc5REViMDRUZHRvTTNaYkFEdFpMUWtGWm9iNzZWL0Z6VXdMWlZ5VlJLWGYv?=
 =?utf-8?B?NjNvb3E3Ny9NclhYSUxmSzBEQUw0NGFHS2E0SzIxamN2QkJBUEVXcGV3bkhp?=
 =?utf-8?B?TzFFTzY1ZElXbnl5bXhSeFJBRnhqRjloQlBhY1lvNXVvR0JvNzZNVU9tMU9z?=
 =?utf-8?B?SklJak4xbmNwbnp0ditzVTVJbndpSmhlZ1V4VzZGNmQvYW9qLzFlbmIyRWow?=
 =?utf-8?B?VUorK001M2FsYlZPQ2c4RnJyVW9wc1liUkxlM3VrWVFCVVNLRTFOakpNVGgx?=
 =?utf-8?B?THlYWHNTdGExMDVTMFArWmVUdUR5Z00wVHRaODZxV1gxVkh4R1h2TDJZNkVL?=
 =?utf-8?B?alNWSzNid1EwWlhwUzlWeURQZm9wMlV1amY4eDZQOTlWQTB1WEpJcTlMR1p5?=
 =?utf-8?B?MW1aSUFrYXV2b01Bc2pOQ3ZPaHNqaStWUnRoa05rYUl6S2p4V2N3ZTlzT3Ur?=
 =?utf-8?B?ZjljeEsyeDZ6UHpHM1BYMWh4bWZwNXpMMXVRU01RSmF0dncyMVZaSlZtTm80?=
 =?utf-8?B?V3NxUm1RdkJyWmdYUHRIZTF5QkdMc0xCeFZ0RGNqZUl6RVVKTjdaVnZYSGU3?=
 =?utf-8?B?QmcySVFTenZ0eTlya1RURnhGVmhyNFRlS05YeE9vcmZidzB3OG5HOUNzS21U?=
 =?utf-8?B?NkxQdGZjd0NpTHRtaGphaTY3alN2bjVuMWlaQ05qSGs5ZzZQbmY5dUdYUmVJ?=
 =?utf-8?B?c0c3YjJBd0ZXTkkzWHE2bTYxTGZPckZXUklRTXBCRXlqK2VuNTlick1ZZjhm?=
 =?utf-8?B?UlRqNWoxL1Rqb3p1MVc2YlRKeFo0RHJjYVNTRitHT2ZLa25NZEk4R1pUc2RO?=
 =?utf-8?B?ZEFleFVaeGU4aVJKMjZyVDhDQW1GNmUrLzlvVmtqblR5T3FrVE9makxkM3pn?=
 =?utf-8?B?dTNURkRBaWRFaWxkaDFncXUyNk1xQUNYYjFEWlBkeC9helpGa0M0bGxIYkhM?=
 =?utf-8?B?ZHFWSG9FZE9za1A0VVdNZFc3SFJia3RZZlhFb0ZJR0RPcHhzMWdrU1RuVVVp?=
 =?utf-8?B?bnlYVmwwNm1yQkFHa2toSys3SkltNCtnVnJBUCtTNFRGNEpSS2F2bkJ4QkIw?=
 =?utf-8?B?YkFmajlMY1ltazdFZ3NVK2hvMUNTSUg0Q0F0Z3hjMUdzWldVby9Ra2oxQ20z?=
 =?utf-8?B?dnJPcHlTTmZXZW55bVlHdHhFWFFqTHFlWnRXTUErSEFDMnBtYndpQ2FOWm5H?=
 =?utf-8?B?VVUzWm54d045bGszVkJvTFh2K0pnanBtdVdmTTI2blI2cEpYRnpzZjFnNVZT?=
 =?utf-8?B?WDdXY2FvNnhXRWs0YllRSEdBTlJGS0hFd096bHVvNG9Udld1YnBNZ0NibVd5?=
 =?utf-8?B?dWhKS3IwSG43TkFxU3dJWXZlWWJQTXZGc3BncTFEL0IyTHQzMFRicXFDcWVs?=
 =?utf-8?B?VExKcEVFZ1ZTZW90M1FLVzVmQ056UmJZakh1YWhxVWQycmVtRWUzdENRWUN2?=
 =?utf-8?B?MjEydjRQWmNzZ2cxT0luZHpuajZ2b1NGZnRsQXFHMVYrUndQb3ExNk5JNkxZ?=
 =?utf-8?B?SHJIaUpTUmlMWjlsaFJ4WHBWYi9LOEhxOHFIaldKZjl2WmxieVBMUEh3R2Z4?=
 =?utf-8?B?Ny8wMEMxdTc2Q0tlcnkveVMxTTdWbHZHVXpzaHFSMkx2dlFMdEprTmJScTk0?=
 =?utf-8?Q?sMFjYnQHTl0pgc7AhvF1jroQ5GQLRBOU3zdEu6DmLHdT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bda462-b39f-4083-cd78-08ddac86c631
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 03:35:00.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9v5u9g1x8dqu5So9jFtDTglnxcyw3c9nSTLI6VF6RES39l6DwM4ep3BtHELcKz8PrAag/dSz1ZKEvMZDht/XBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

`from_bytes_with_nul_unchecked` also does this, so do the same for
symmetry. This was probably not done due to the unavailability of the
`const_mut_refs` feature at the time this code was introduced.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/str.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 2640a050847e64bfd18c127a5a83b93f01f036bc..28f2f359ab23e6a926e88913e3cc9f481aa86037 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -290,7 +290,7 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
     #[inline]
     pub const unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
         // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
-        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
+        unsafe { core::mem::transmute(bytes) }
     }
 
     /// Returns a C pointer to the string.

-- 
2.49.0


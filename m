Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66D79CF;
	Sun,  6 Apr 2025 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743944530; cv=fail; b=VdKbA3yN/cY2OTzTWUyM8tSGBSxMXI+yIllqJc3t/jY8lW7/JdoMyIzoaVK2neBiDf2gyjac+Y+0wo3NWANdW2pHGoFvHsRoigM8rAdDy1ACluSfzHV6hCXfUc23hoUbT5FyBK9ksqEhKm9r2bwI8PI3yfvIfUD49JtgRMAHf+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743944530; c=relaxed/simple;
	bh=ZBjVutlg8NztvQwoYYuXzReP4+NkTLFWM99bT1MI0Y8=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=h+6mnLWzqHf4hWKLerFXfvruZ1Kp+p7sHP7RDwB5eYmRmOmzFAr9VDRnxWJmS9W6KMQaQ9Bw2MtSa0Tj+sF+M4wpv6Z1ePy0/qPzIJ+v16HXszU2jchjN++JOiECCWzIRhbzMoFQ0xU0EqKLzC5z58QFuBpK8S/Yy9eYPM4nRw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RcyMZYDj; arc=fail smtp.client-ip=40.107.94.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RcyMZYDj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZTR4QvtybiO/r2kKShy3z3G8eanKWvdKFKnNOV4K1uB7o8vCOtp+oxaQYSojcLCH6ei0ZZX9kYjMFUEsCeTGAXIyKZOo86+SvtvPX3LiOxfpt3sI+ZfAi0F3yt4zeHtJvLJA9gwUR9ej5uSl/EIHeZ8vEv5ERNpk9qgPnNAPD7DpSsdhCLUMNjP6To7f52M0KAEVevPmVtpD7a00Pjq4kWbUbzXbLMQzTzEnbgXobN6kYOr7Wc3ywELuf2gz7ETsRNigsaQKDb5d2YIhWIU673COlQtcWiGhBYP5HBhp6Q4QIMlmDxWfBHqKHyjmrDKSp9O4VeLqwxDVZqFAmOIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uHNQ7+7NbAzT8RsOF8E/1GUB0tOA99CNGBtmmgE+W8=;
 b=V2WiUwZzp64550S4z6+oU6PwIIFJ17Oq6gaT81te7fMUoA5Ep84lIuj/NkyxSAGkc8mCQMF/ILkJFBZvpWJkJSkkJdEeAv2XEpNg245iKSMSXEyTOwYamVcoyiF1nARF5QqtFCGR3buS39WbDhhCoA0Xybr0XdT2bJSEozxjqxAMy9G3lzvVvWeqeHMmfUnHVAxyBEqtju6j7E4wiHth6f8urUmbHHiaFzvcICEdkadkM3oMRsFU7y9b7dwJbwskyO7jYy3LQDN16O3m7SMkAnZFApr0c4UDbLsOb02lTVKyOVHN3hnlGArHAjquCf7KCWtJ0koKg8XE9oSpj6jz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uHNQ7+7NbAzT8RsOF8E/1GUB0tOA99CNGBtmmgE+W8=;
 b=RcyMZYDjUdNx1SxIrP7QvyQXIp87gapM1lQIKgK4R+pxEyQvYE4SP1ZMG6YOvFiyrU1IXJIhUBN/dzj1vzscHoDPxrvT4g3UGST2Fm8IItHT3q/g/k/12E35oF7A0AN5lPlv1SSzaY0o20oQkCbVdyfFRY7cqF3pWA889NGRFlnY4epJSxTFZWmmeXQmW4ktyEp2dTY/iHTECl8/kPxPR8hqyJjhHREQtd+C1n4YGd7OpIiv44+P2+gsbVYhfL1Lbm1bssuZQu4GouXQykbZ2HMDAnawMP7GlvGLPzi+yB7sbuSMR6sy7XvEp3VBwRBYEXjP2bzB2RHP3WMwGGgiJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 6 Apr
 2025 13:02:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8606.029; Sun, 6 Apr 2025
 13:02:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 06 Apr 2025 22:01:55 +0900
Subject: [PATCH v3] rust: alloc: implement `extend` for `Vec`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAEJ78mcC/3WNywrCMBBFf6XM2kjzourK/xCRPEY7C1NNaqiU/
 rtpXYigy3PhnDtCwkiYYFeNEDFToi4UkKsKXGvCBRn5wiBqoWtVa5bRnXDoMXimpOBCc+Oc4FC
 EW8QzDUvscHxzxPujNPvP2FLqu/hcDjOf15/tzBln1jaeb61qjHf7kMmTWbvuCnMni/+uKC4qs
 9HmrKSz8sudpukFccb1GfYAAAA=
X-Change-ID: 20250405-vec_extend-4321251acc21
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9e2adf-7431-46bd-646f-08dd750b3b38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDFEMEZXUVZ0Mk5BKzZtaFozUVFiZTdZcEgzWmU2NEtpVlF4eFd1eU5VazVz?=
 =?utf-8?B?dVMzU09acnc5UUdneGErbXlVakU0N1VtQlNrUEx4QkxicEwyM1l4Uml4SE0v?=
 =?utf-8?B?UlV2RjJNR3dybHkwMFNpb3lGdUpJZHorZVoxSTVnOTNNc0piYWRkUktiSVdh?=
 =?utf-8?B?dHljd1daNlZad2ZWT3NiMzNRNTZneHNmQWp4ZEF3MUt6N2h1bnlkcDV1aTgw?=
 =?utf-8?B?UmtsdjVOYmZFK3RKN1NqWHZxc25kcWtjZlhUcXhDZjRaa3ZmanJiR0U3NVRC?=
 =?utf-8?B?b1dqcVRvckdHNk5pdEV6Y3Jmb01QaEM0eVg5NWN0OXo4ME5aRkErb0xXRU5P?=
 =?utf-8?B?d3RCbFdxdHUvelNhNCswZ2tKbWRsSFdqNSswSmRMbXd4MFVUbWtEdzc4b2Fi?=
 =?utf-8?B?c1BkbDlnMVRxY0xxL1N2b2NpWDVKYldXV0R3VFNQdStZclg2R1BxSlNCaUVh?=
 =?utf-8?B?Y0JqU3VIK2ZtQmp4THY4VnNmVDlsK21JaS9CN3NwUnZncTI3OW04NmE1Q0s3?=
 =?utf-8?B?YWEzTzZJek5XUGMyZW1jZDkxSThicCt6N0R1Wml5cGh6eS80UDhwLzh4eDU0?=
 =?utf-8?B?TjhtV01rU3ZONjFpNnVVODJpdEN2RTFKeC8rVlpraG5mRzcxa1RUL09Sak5H?=
 =?utf-8?B?OCtQUnVxbVlBcFNza3FrWTRKVjRnNU12aWwvRVYrUXBlUU53MHozT1JBbkcv?=
 =?utf-8?B?Nzk2N3NDcXUxNTJZbkFxWitVWmx0TTJmMzc2ejN5MHRUTC9jVjMrNFpJOFd4?=
 =?utf-8?B?RHFOa011WEUrd2JUdnR5VWFnNVRva0U2VytCMndLbGFRc2I1YXBENWxCQ2Ft?=
 =?utf-8?B?V2QvWjZ6ckFBM2NCTFVrQUt4c3IyZGJzamtDT3hVZzVLNENzTnJuSlkyT1Vq?=
 =?utf-8?B?cW9oNy9rOW9xeGR2KzJTOXJpSVA5b0hYbDlVUUErVDNTU1dhdUx6b2RmS3M4?=
 =?utf-8?B?WGo0OVV6L096OHJyaXVHNDlHYVRUNFhIL2hsWTN1aEFRaW1NKzZVRk5JR0ZW?=
 =?utf-8?B?QzNlMXhlQXNaVnpMRDRmVDhJZmpGQTZMZWFlVzdoeE9ITzJ1NGtOckJTdE9O?=
 =?utf-8?B?VlVHZjdBMFZmd0ZHVjZXWVQvN2xFcUpoUDNCbXM1bEhUdEdMWUxvVjdXZUFz?=
 =?utf-8?B?NkxramdxbDlrRGJoUFhkWThRZW4zcTNjdDB4ZmhuWGp5VzZNM2UyK3Q1VGRz?=
 =?utf-8?B?eGtkOWZ1eUY0RFQ4TkpsbFN0QlVmUE8yYUxZdVhXclcyYU1pVWZKcmkyMEJl?=
 =?utf-8?B?OWk2alZ4YVB3b05hVHRwQ1VaMElOYTBOSzNGd1NuV28yTmwybnltYjZFaE52?=
 =?utf-8?B?UlppeG04RzIxVjVESzZobFYwMk5qd2xwdHhaT0ExaERmdXFNVUMvQkMrRjNo?=
 =?utf-8?B?aDVoVEZkeVRoS3NXTkFGeFJqOWE0YXJCbmh0aXU1RXRjRG9BVGdXclVtTHYw?=
 =?utf-8?B?WmRkMkxXYmRncWJmM1pxS1pBU29qZlVuYjFzc2tBQ0t0L2lZaCt3aXZwM2Fp?=
 =?utf-8?B?bFdNRUVzTVp2dURPRVY3NGgxN3R4VHBwcjUyc0RIbU1UNm02bXNBNU5sbXY2?=
 =?utf-8?B?OVVONGFWZ0c5bmh0TXZCRnRKYjd4QWIvc25JVGx0a1ZudmgzNUM5T3M2Nndj?=
 =?utf-8?B?aEZDVVpzbGZEdnNFTTJuZGE4SklTYURNR0JBVURxV3Z0WjNXb1RWakdLamtQ?=
 =?utf-8?B?UTVYU2d4Z29yWDgwQ1MrKzY0dVBLRGMzenlLZzRjT29DbkJiclpsTjJ0VGFS?=
 =?utf-8?B?ZFd5Nk5ZZE9sYzFNVTYrNGlrYmZmSGUyaWFNOUJsd3BQblFwTitKQVRIaExk?=
 =?utf-8?B?SVJlNndQWTBGM2FzL1JjQ3p0VzFiQW1yWFVUVkpaek8ybG1QWUNXTnUzd1Ex?=
 =?utf-8?B?KzN2UEk0cjFkbnU2ek5jRXA5V1RsUjF0NXVvUHhyUHY0bHB1azlLSFpWcHll?=
 =?utf-8?Q?QU++W6JkfUw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVFNd0RJZHhpN2hkblk1RUt1eTc4YjZ6cUg5ZlZNMG9RVUpwSGUrQm9YVkMx?=
 =?utf-8?B?SVBOdmVjbDlPeVZTRVZnVTdVM3FPMEpuUGZXZ2FncDcyVEZLUlEwRW0vYTlz?=
 =?utf-8?B?YVdrbnR6OGViMUFaOVA0VXpUUkxPRXJYUnU3aWF6ME5INTF5aEppdnl1TlFT?=
 =?utf-8?B?MzVraEh3THo2UlFKVHE3YWFuWGpoNERXd3FFVXpwVEdkbXREcVBpWWRHZ3N6?=
 =?utf-8?B?eWZoNzVWVXQvMGEzQXo1azBoRUVmclFHVGhVY1RJYllkNy9wMkNrTTVOZmtM?=
 =?utf-8?B?ZXNnejNFKythdjIyUUJJNkE0ck5UMkZQajNKL25CUXNYSTJGY0N0NEdqYXM3?=
 =?utf-8?B?M2R1Ni9TRENNTGozellGYjFuMmEvdGU5RXZZVGFobTh5a0RmNUFMdEJKL09i?=
 =?utf-8?B?QnRYZ1JiZXY0eW11U29nYlR4YjR3RFBHM1IwSzUra1FycHJNOThCbVJkWjdR?=
 =?utf-8?B?MEZvMktqSjVKcDdWaVpWc25mVUszQVZVbWRrSmNyNHZGV1BlOEhtcGY1Uzd4?=
 =?utf-8?B?bnFZd3lXUkd6amdFdlJqY3ZpMWlYWCtiTmJWUWc0YytTNFlDS1RSUENQVVMy?=
 =?utf-8?B?YzhtY3pUek9DdTVKYWVCUkhLd20yWnlmNkhDS2JjQmo4cWZQWGpza3lZWisz?=
 =?utf-8?B?dmI5SGlKQjNZSjB5ZTZVck1YSVBZVm5ub2pDRjlQc1J0NndyUzZtN0Q5bFJs?=
 =?utf-8?B?OEFvanU5Z1pvVWxPUGl4TXhkd01QSVU1dUVXbk8zNTEwMFN0bHRzYXVoM0Rk?=
 =?utf-8?B?ZDZwKzE1ZlRjSWJlUGRvNVBsT29BZFZ2WlkzNVhLek5sakUwSVFQM3F0YThz?=
 =?utf-8?B?c05ZQkY0S0tHdzFmZ2huN0dUQk1TclBnaDQzdTlQRlhRM084SE5FUkd5SDBl?=
 =?utf-8?B?N2VHRmQxd3ZjdmtVZm5jR1NuTHZPZWl1TnRiQ1h5K3pwVTd2Z2t1U2NXank4?=
 =?utf-8?B?Y29BTHJCSkdEcU5IbmNXUUVjVlJraUZLZXpuRDBkSnBEemF0VzNzMjBvVWlE?=
 =?utf-8?B?NWsvNlYrZ3VFNlFlTlcyMS9IS2pIWDhtbGNLSEFGSHpqcGVhYUt3ZFlQcm9k?=
 =?utf-8?B?Z1hxbHlaSUUzbS9IcWNhZEhvYnJIQWVkSU4vS3J2RXU0Y3NCQlBYWEhudExN?=
 =?utf-8?B?aXh3OW9NT2hacEhaMzFidmVHVFhnVzJoWVBvWWZPMnNEQmYxdjBRQnlBVFda?=
 =?utf-8?B?a0p6S0xVbWV6dzhZWVUzc0hSL0dnaSs5NUtEeDFGUkczOHhUaHVGVFJGNXMv?=
 =?utf-8?B?ekowYjEvb3Y3VE9BbjI5WnI3SkFDeEk4RFY5L1daUEh5S0ZWTzE2aEQycHVy?=
 =?utf-8?B?NVg4ejJXL1R1SCtGc2NIRmFTbUl0eE5FRTVOY3FwNnBuTWZaMDBuMEYrdFFG?=
 =?utf-8?B?UTFVRjh4aGc0Q3hvdWNOT1dBL3ZxdWhESlZjMFFlTE9ROGlCY0lrTzlxbUM5?=
 =?utf-8?B?NkNYaTFETEd2U3h2aVpTUWN3YldtdTJteXkyTXVFUUp6N0Q3a1A1Z0ZBVVND?=
 =?utf-8?B?MXl1bURTd1IyZy9KKzNLSk9JZVRMWTJ5dEM1Zk1HbWV3dFR4UGFvZEhrZ2Zo?=
 =?utf-8?B?MDBCcUV6dnRiMGFKaFRaMXNaTjV2bmp0RUtzdXNmRndqMzgzZmhMTmZHc091?=
 =?utf-8?B?VzcrcGdIN2VLQ0hyRUptanF1U29KbFhlbmpaTW5EN2xQZ2NzcjhhUEVUYnYv?=
 =?utf-8?B?d1JJRXhiWE9qUUltZytwYUoxV1FhaDhKeGtORTY1RkZkVEZ2UWNQajV5bE9K?=
 =?utf-8?B?RHp1TGVOblF5NTNtYW9GS1krSXVyNnRCdzFSWURtTmFxMU5ZeERnS2hoRGEr?=
 =?utf-8?B?Z1hpejViRlJOU1BVMjMwcnBidkppQThJY21TUHJTTE1WSUVjTXlHNXFYUCtz?=
 =?utf-8?B?blh4KzNGcmRuUnVocjU4enhkYXFYUlVQbGgwSDFUVXFBcUJPaTdrblRVbm1G?=
 =?utf-8?B?dFdKVXBCRjZXRVpOM2lVSHpUcjdkMU1vZE1NK2hyb2lBY1hBdFQyQXpKOVc2?=
 =?utf-8?B?aU9WREViZ2RleFRyZk5XZGdXSGZoTkg2OGFFaURtWSs5dmd4NiswT3BhTWMr?=
 =?utf-8?B?QXZLVG1jUTNtMnhKdXBFUUFwMmlHbld0VFVxM2xrWkcxTU5nb2VrMFNzYkY5?=
 =?utf-8?B?MDZXQ2dCaFRpSDJCVjd4U0lhR3l2UEgxdnJhVVFORTFmSjRFTE9vdG91R2JT?=
 =?utf-8?Q?zOSgzPQwEhjcIXe8/LlmVdT/XaL611KO3flV8tEzj7+9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9e2adf-7431-46bd-646f-08dd750b3b38
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 13:02:05.6669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ihOJqbrOpM7OiTKjAY2ne0Yb2QuCQGH5Ahw13pZl9Z7aHqYBXU3+UeFZ7G40v54F4T6shLSfMhx1CFLZpmybA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087

KVec currently has `extend_with` and `extend_from_slice` methods, but no
way extend a vector from a regular iterator as provided by the `Extend`
trait.

Due to the need to provide the GFP flags, `Extend` cannot be implemented
directly, so simply define a homonymous method that takes an extra
`flags` argument.

The aforementioned `extend_with` and `extend_from_slice` can then be
reimplemented as direct invocations of this new method - maybe they can
eventually be removed.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
I was a bit surprised to find no equivalent of the `Extend` trait for
KVec, and while I anticipate to be told the reason for this, I also
didn't hit any hard wall trying to come with my own implementation so
here it is.

I expect the new `extend_with` and `extend_from_slice` to be optimized
into something close to their previous implementations, but am not sure
how I can simply verify that this is the case - any hint would be
appreciated!
---
Changes in v3:
- Use repeat_n() instead of repeat() for extend_with() in order to avoid
  an extra clone of the value.
- Be more precise about the cases where extend() will perform optimally
  or not in its documentation, and how the vector might be modified even
  in case of an error.
- Replace into_iter() with iter() and iter_mut() where suggested by the
  kernel test robot.
- Link to v2: https://lore.kernel.org/r/20250405-vec_extend-v2-1-e4a85af43cb3@nvidia.com

Changes in v2:
- Changed the diff algorithm to histogram for a more readable patch.
---
 rust/kernel/alloc/kvec.rs | 111 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 33 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ae9d072741cedbb34bed0be0c20cc75472aa53be..b3c4227e232cca3b5c17930abc63810240b9c4da 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -454,30 +454,86 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
     }
 }
 
+impl<T, A: Allocator> Vec<T, A> {
+    /// Extends the vector by the elements of `iter`.
+    ///
+    /// This uses [`Iterator::size_hint`] to optimize memory reallocations, but will work even with
+    /// imprecise implementations - albeit in a non-optimal way.
+    ///
+    /// This method returns an error if a memory reallocation required to accommodate the new items
+    /// failed. In this case, callers must assume that some (but not all) elements of `iter` might
+    /// have been added to the vector.
+    ///
+    /// # Note on optimal behavior and correctness
+    ///
+    /// The efficiency of this method depends on how reliable the [`Iterator::size_hint`]
+    /// implementation of the `iter` is.
+    ///
+    /// It performs optimally with at most a single memory reallocation if the lower bound of
+    /// `size_hint` is the exact number of items actually yielded.
+    ///
+    /// If `size_hint` is more vague, there may be as many memory reallocations as necessary to
+    /// cover the whole iterator from the successive lower bounds returned by `size_hint`.
+    ///
+    /// If `size_hint` signals more items than actually yielded by the iterator, some unused memory
+    /// might be reserved.
+    ///
+    /// Finally, whenever `size_hint` returns `(0, Some(0))`, the method assumes that no more items
+    /// are yielded by the iterator and returns. This may result in some items not being added if
+    /// there were still some remaining.
+    ///
+    /// In the kernel most iterators are expected to have a precise and correct `size_hint`
+    /// implementation, so this should nicely optimize out for these cases.
+    pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), AllocError>
+    where
+        I: IntoIterator<Item = T>,
+    {
+        let mut iter = iter.into_iter();
+
+        loop {
+            let low_bound = match iter.size_hint() {
+                // No more items expected, we can return.
+                (0, Some(0)) => break,
+                // Possibly more items but not certain, tentatively add one.
+                (0, _) => 1,
+                // More items pending, reserve space for the lower bound.
+                (low_bound, _) => low_bound,
+            };
+
+            self.reserve(low_bound, flags)?;
+
+            // Number of items we actually added.
+            let added_items = self
+                .spare_capacity_mut()
+                .iter_mut()
+                // Take a mutable reference to the iterator so we can reuse it in the next
+                // iteration of the loop if needed.
+                .zip(&mut iter)
+                .fold(0, |count, (dst, src)| {
+                    dst.write(src);
+
+                    count + 1
+                });
+
+            // SAFETY:
+            // - `self.len() + added_items <= self.capacity()` due to the call to `reserve` above,
+            // - items `[self.len()..self.len() + added_items - 1]` are initialized.
+            unsafe { self.set_len(self.len() + added_items) };
+
+            // `size_hint` was incorrect and our iterator ended before its advertized lower bound.
+            if added_items < low_bound {
+                break;
+            }
+        }
+
+        Ok(())
+    }
+}
+
 impl<T: Clone, A: Allocator> Vec<T, A> {
     /// Extend the vector by `n` clones of `value`.
     pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), AllocError> {
-        if n == 0 {
-            return Ok(());
-        }
-
-        self.reserve(n, flags)?;
-
-        let spare = self.spare_capacity_mut();
-
-        for item in spare.iter_mut().take(n - 1) {
-            item.write(value.clone());
-        }
-
-        // We can write the last element directly without cloning needlessly.
-        spare[n - 1].write(value);
-
-        // SAFETY:
-        // - `self.len() + n < self.capacity()` due to the call to reserve above,
-        // - the loop and the line above initialized the next `n` elements.
-        unsafe { self.set_len(self.len() + n) };
-
-        Ok(())
+        self.extend(core::iter::repeat_n(value, n), flags)
     }
 
     /// Pushes clones of the elements of slice into the [`Vec`] instance.
@@ -496,18 +552,7 @@ pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), Al
     /// # Ok::<(), Error>(())
     /// ```
     pub fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), AllocError> {
-        self.reserve(other.len(), flags)?;
-        for (slot, item) in core::iter::zip(self.spare_capacity_mut(), other) {
-            slot.write(item.clone());
-        }
-
-        // SAFETY:
-        // - `other.len()` spare entries have just been initialized, so it is safe to increase
-        //   the length by the same number.
-        // - `self.len() + other.len() <= self.capacity()` is guaranteed by the preceding `reserve`
-        //   call.
-        unsafe { self.set_len(self.len() + other.len()) };
-        Ok(())
+        self.extend(other.iter().cloned(), flags)
     }
 
     /// Create a new `Vec<T, A>` and extend it by `n` clones of `value`.

---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250405-vec_extend-4321251acc21

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412DD17C77;
	Sat, 12 Apr 2025 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439378; cv=fail; b=Tk48mjd6/Tkwp+SVUNc0KKLIuUny/ufoMCljdqSQuwuH/B2P7RnELCz1yKJPAvnddFioKNPAP6eHYraG0LT5eiyaqvuedX1K/Ok/jYo6hsQvmVKdR6aM4I2vh+MUylm/xPi1/Zdh97HtCQlPL8ydcnWRahX1cuNNoACT+/4VvD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439378; c=relaxed/simple;
	bh=g7hxRaxqtIzlrq3nZ9Szg6UM3R2blcF1TKkNoiBT5Y4=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=hOuSPCSc2NouStGdSIFUAjxjItDefg/99aXi5k4aPE67KNLurZwqG+9sMsBSg7C6PHFQQRNCwQhxt5lH/QUhKyxmplFKNbeD1vMMewdDGr9FnCKE+Uzv8aGH7B6iLAxSQVz/TfKo4x6SD0Ob0YuIoO6tu+m8kOdxnMj/eUHBwdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RUKsyyJr; arc=fail smtp.client-ip=40.107.237.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RUKsyyJr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+iXJ1BmVU6Md0ifZkmikBnnTgkyNzokI5XsMiLK5Wn2mlc9j3XxF1flgf/1384n+vl+6Y9SGAc9Q0aE3xDZfTTVxA6A1K5JGs0FMty3/K2UtuS0VgBa7whGTi1q/l4PezdYPB2/DbY1Ck/bNKvB77FvRSAutBx11Pk4sMkoLauVyZm9ct2aCH5kGocN4IPiraUV0rEeKT7hRp7iZEapd5LAouwtSQmUjE78uyQKqjyFj9Ukvy7Rx4H2qCdW/MW6XpOSrWYhSKrj9+bwM4icp7GYYCCrGTUPZzb9YCN0JUTkZ/bRsJGktcnubol/ZFynMG9OBYJwxfQPoX4FTD8v7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xvl39a7AXeUfHnYkWtn2wXcRJFeb5jsDAfaTUw7wczM=;
 b=E851umQHmkqPBFcq4n7wQ4t2nc78tl/oSD+3ZVOwE2DQeVSyJAjjH1UAj49GznVDn2jvQsmcaNPLwJvgtADS2FREE+FUoRnYZ0JIZz/ssPZ7LU/+WruNKwZcFiOc8Uju7GXdAH0kv3KGwd8zNkFCSgC9+O5gycIDlNjYXqrihKYOsudeAK/y2betl3jjPRZJLlR+G3pmsY34T0HQhc8M4ruNodyFzBHPge/mvMltux8beooe92mQx8Ts1UyWYVJElU882NFFfkptePbta0uweI+MTNRHXiOf3ROuGJuHcVp5f4zsMMy0EkbdLgLw5Y18MeXsZy1COZGsWQHSh3hCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xvl39a7AXeUfHnYkWtn2wXcRJFeb5jsDAfaTUw7wczM=;
 b=RUKsyyJrgiUDAmFz/U07jkqFSizXpXIJvwouWz6Drtn1plNu5arbBlMrUUov3bJDnXAqV4wleGGiidZb46vmePTxTCHMBVVDT6z9yZtFpuhdLPef+eJ4f+rrURvYn/YynovcBa6br7vbM1Pes3hhREisEAgRVr59dC0njsDOsDhlyoctmH6OQI13Z5IpGesrS2AViyvvSzDY5J5BACUVoikYVfwCgif9id64pwokg1lOaZPpSVuAiZkeCTIQqLzUNEmO1aUZORZhLFhTv2DYOA0VsvMdHyi9B8y9Zz17l4jEcXCRVbAVoIlLP0OEuHrIeEnN7FhhNlLuPKLwfFd0XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Sat, 12 Apr
 2025 06:29:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.025; Sat, 12 Apr 2025
 06:29:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 12 Apr 2025 15:29:13 +0900
Subject: [PATCH v3] rust: alloc: allow coercion from `Box<T>` to `Box<dyn
 U>` if T implements U
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-box_trait_objs-v3-1-f67ced62d520@nvidia.com>
X-B4-Tracking: v=1; b=H4sIADgI+mcC/3WMwQrCMBAFf6XkbGQ3bWnw5H+IlKRJ7Ao2koRQK
 f13054U8TjvMbOwaAPZyE7VwoLNFMlPBepDxYZRTTfLyRRmAkQLDUiu/dynoCj1Xt8jB6E6KAc
 60KxIz2AdzXvwci08Ukw+vPZ+xm39m8rIkbfSSNtJDU6L85TJkDoO/sG2VhYfPuKPL4o/tK5GL
 Y2WTfflr+v6BiduFmHtAAAA
X-Change-ID: 20250408-box_trait_objs-02a700401f0b
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: 138d6bf1-6d09-407e-3679-08dd798b6088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elQxR200Yno3c25jckxLbVNORWdheW1xWnQ1a0pXbG1yYzBKWHdRVDZJakY2?=
 =?utf-8?B?U1I4R2NRUHAyZkVqeTMvVVhBV0ljN3FUcUpyT0JBUkpHeVdaS01hb0RQbFVS?=
 =?utf-8?B?NklmVjBxVmR5NGh2MnJUVjVKaHZLeDFoNktIVEZsZG1hdUVkQlRXUGJZVnJX?=
 =?utf-8?B?UlprU0p6eTdLOEY5Kzg3SWdOVVI0eWgzWGxrdkdVaE1VYWN6QjZUSlByTTRD?=
 =?utf-8?B?SlMvcGY5dHJwYmZobTBKeThvUFFibXZXWFA2MC8zWm1FUmZ5TWZSUmhwRGxC?=
 =?utf-8?B?ZHNkVEM3cWNZcktrbTdYMDB5OHNmb05na2tBTU02c0ROWHA3YThLTmtVejcz?=
 =?utf-8?B?eTFRSlh5RFQ1Y0NqTmVvMlh3NEdMVm1TNENEVm1QNzdKcGNKN2lXY3RCbHlK?=
 =?utf-8?B?YWlaS0hiNGZRMzdMQlMwdHJodG1yTmJaREY3d0xiYTlOb1BveDQyVXphb3hQ?=
 =?utf-8?B?MTZVWHFSQlBWM0ZoNDJqLzlkWVFKMGZTUjVQSG9uOU5qa3BLaCtaTkNMcmNm?=
 =?utf-8?B?QzdDNWpYclQzUzJEMWJjSDQrYkJwZVlESlV2OXhlS3lCaktENUc2VHJvNmhO?=
 =?utf-8?B?UjgwR2JPYldYWmV2Q1pzQ1lMd3JxOWpFcGpHaGVxZHU3eXNidWVXSGU3Rmgx?=
 =?utf-8?B?bStCTmdWODhlVmgvU0hUVVo5ZDJZUzlkQ0xISEtOZGpBbXVhTVNTOFlnWHp4?=
 =?utf-8?B?bXNVeThKUWVnVzBrZG5jUGF2TFBzdXUvNGlhaTlpbXZvRWpjc0ZGNjJ2VkVQ?=
 =?utf-8?B?U2E1N2k5ZlpSaVZRNWJ3OU5kTmdxejBQelE4K0lvaUhlMkZJWWdXY042eTR3?=
 =?utf-8?B?N09BNkZNZTZtSUdaQlNYRERHQkw1U21nQjVwNHNScGxlYWRGc2pzeGhvWjli?=
 =?utf-8?B?Q00vRDFFc1A0RHZnRjZ5TnphM0YxSWtiUTQ1VDhqVUw3d1grbzBUN1BxcG9t?=
 =?utf-8?B?U0sxbUtWUFNjRDdjejRWR0VwaVJCc09zUTkrWHg0TFB4VDJDVUhUeW8xUjR4?=
 =?utf-8?B?Q1ZHN0JDTWpWdy9wVG1WYStPUkNkVm16cXVrblMyOVV1bFA4Q1dXc1gzNXJJ?=
 =?utf-8?B?MjVzZmM4azBSZkZsMmk2ekZCdjFsRTRjQnVRM2E2KzlaK0xCeXBLZHVweG51?=
 =?utf-8?B?Z0lReW9nTGFmemlDU0VVVCsxa0FxQkp3aFJVNWE2Y3h3aThXUlE0WWY0d2Nn?=
 =?utf-8?B?aXQ1NWhjM3hsenBoMUpUbnU2RmxUYUFUMnhiNVNrMk5qdC9nNEo1WFgvQnVh?=
 =?utf-8?B?UXhQK0UycTRaMlE0a2xKWFpwVExFZi9McnpQbzV1dWhBelZsS3FVZzBlK09u?=
 =?utf-8?B?dDk1ZnBOM25rZmlnWnVPUEN6cXc2ZG9GNmttaU4wS0hLTnhHRXBiNUpLc2hB?=
 =?utf-8?B?SzNXcmNQS3VLMy9weWZzbHFwcEoybXFLdWNPUlZCUUZ1TEJqWlpsMmtiWjNO?=
 =?utf-8?B?UEdiU2tGalk1cXZGWG45ZkRrRWxOQklMZGhyekZHeVhKY0RhcU5oNjA1ZlVy?=
 =?utf-8?B?U0J4aGQrdThvcHc3YWpUN3RNcU55bitYR0hNc1VIY0tQUGVnNVlvOWw2dEcw?=
 =?utf-8?B?TXd2S1J0ZGNvemprMWt1M3U0Q2cwZ3JLTkJzVXVYV2duZTErb0k0WlpIRURH?=
 =?utf-8?B?ZjJEMXhpaG1JYm9IQnQrTGJSVEZvM2hiYlpBdHduNEM3NE5HalhLNmw5Tmt2?=
 =?utf-8?B?cVNyWmcrd1hQVHhSTXlrQnhyMkZxdHF6bCtObk5PWnI3R1gxcGozODYvc0Vp?=
 =?utf-8?B?VkltVDJERzU5L2gvSjd0YXIyWGkvTWFmY1pZS1o0ZDVUbjFpTGJEZjdqd2Nl?=
 =?utf-8?B?MWFvN0RZaVhEYkF3enNaVlFKS1VtQnlydEtYRGtiQmFVWVFXaE1xZEZ1S1pY?=
 =?utf-8?B?WGNmdGJOLzlaYzlsOXlPdzA1Qi9EaHZyWDZZUmx5UkpYSEVEOHdXNGM4RjZK?=
 =?utf-8?B?eE94MnhJSFNpcTlwWWZrZFJ5TXRWSEVzblY3SnJNSE05cWtzMFdWRW1KMFZT?=
 =?utf-8?B?SHA3SjhrZDJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0E2VEZKcEVCZExkeWJ0b01xWjlIMUxhVlRFVjV4K1paZjNyRlpZUEQwWVNz?=
 =?utf-8?B?cE1SVTVLNWw4MmcxcUtFUE5oTTEvbGQweDYrdzkvRFcvNEFOTDk4NjdRQjhF?=
 =?utf-8?B?UXRHditJR3BmTnczSzFhOHJGN1lrZGtVb2NKNG9SeWZNbmttdnBmbmJPL0o2?=
 =?utf-8?B?Tmh2RVV0akhFeDVTTVVNeml6V002YzRCZ056NDZUb2NHZGhJejNNa1NSZU9o?=
 =?utf-8?B?dTB0SUhrb0QwT2N2S2tiTjA3Z2xqYjJyaVFtR3pvcXpVWWppelQxUkxEK2xr?=
 =?utf-8?B?dXRFR2N0RldLR1prc0haK1ZQTitNRG5PTDkrdE9KVjlybHlwN256T3F6Q3BX?=
 =?utf-8?B?UEd0VVZFRzVtdVhsRk9nTFpIQ2dDUkxrWVg0QmVLdFFyTnpUR2RoNkEzL3dQ?=
 =?utf-8?B?dUZvcGUvcXpXNTlUYncxc0VKMDlwQUEyNEE5TExVeDMzZmNYWWdVNWthNkZl?=
 =?utf-8?B?TDdiZ2xDcWtValRsL3AwWWZHNUs2RTNWM0ZkMXA3Rk5wTG9VQWJFb3hjQWIw?=
 =?utf-8?B?bnVzRGprcUNtRS84SUg2OGZ2T1A3U2FYRkowT0RmOUcwOHdTaXZwaml6Q1c3?=
 =?utf-8?B?VEFIa0hvTkt4dy9TdThXS2F3WktBdmllRUpWYTJ2Sk9NREtrZit6U1dWRlZt?=
 =?utf-8?B?VlRoSzJHTUN0NE5UWngyMlowaGUvYzdLNHcvaXBqbGE3S1h1UkxTTGNHWW16?=
 =?utf-8?B?ckZjd2ZSUFJhVXN6bUdFQzdGdHhMdkE0L2I4cHF2aGxlSStteU1GSnFENjk3?=
 =?utf-8?B?WWpua1pIZWg4V2dielpnVmJoVEFPZU1ES2x6bngxc0VjOCs0b3g2cmlzaWxF?=
 =?utf-8?B?RjVlS1pXdTVET3RFUFArN3dKajdEZVBHOEVnNSt2Z21LWjExVm96bDc0Ynhu?=
 =?utf-8?B?ZGczWHcrUnZYcll6bGpBNWNMU1pLa0Zjc0ppSjRoRlVQTzlrZ1NPdDhVWExL?=
 =?utf-8?B?b3RyZ0tlUUFBZGx0VFp0WFMxWUdUelJoZFVxaExiVStmOS9oQ3VzUWZnTlpi?=
 =?utf-8?B?U1lKNVVob1NzSHZ4UzVEZXN3YkVCMnp2UkU3SDhldDNHdkc0Tm5PUExpcE55?=
 =?utf-8?B?MFJZcDlkYWxKQ0VkOGVWQ3pUbk9JZFNYcjZoTW9tRkJZc3ZSZjN2Rjc0NEFE?=
 =?utf-8?B?cWNUSWpJNDl4UEdvNU56V3RWRG9abjRGY09GNzdRcXNEdFhTT3NaU0h6SGNI?=
 =?utf-8?B?QWV4UEdsZVdLQnM3YzgwSTc5aGFpU2tIVHFTeGRmWnBpdjFnWFZHclhLazQx?=
 =?utf-8?B?b2ptb0hHREhQd3UvMEROS0p3ZmpscU1FR3ZFU2s5MXZkaWpwWXowcHh6YkRo?=
 =?utf-8?B?cGc0Z0xpWXJtQmZib29zb3FOazQ0TWNZVDQvREEvcjFlUFNmcnFua2NqM0h0?=
 =?utf-8?B?SzF2VEttMkFTLyt4Vmd5WmRMbkVEa2ZJc3hxQ3pMZVdwQWNQaFo5SDVGTmgz?=
 =?utf-8?B?ZUhKTWtCSVdKWDB1YnBOMk84N3IzcHhCSnY5OFJEZWF1VFhIdkZibUdJdmFk?=
 =?utf-8?B?YkFON1RaNm5DNk1JbmsvUk9Ma1VDdDE5VDgrRlJpbFdUbkhhVW9lcEQxYktm?=
 =?utf-8?B?NTNNbzhyTTRvRG1xQVc4NmhwRUZzTUpNNmZib2RrSUw4RjhEdXE4Y0ZQUDhZ?=
 =?utf-8?B?dlpPOFRyajZQNjkyWXF6OElBVitFSENsbmRWcXNlTkpIWEF3NVlCQ2NiSDZF?=
 =?utf-8?B?VHlmZnp0cW1XMWhFRXRhNGpvMEplbzQ2UHBBV2l4RTJ3QWZxeWlSSlAyUERW?=
 =?utf-8?B?OW1pZXFJcXpuRSsvdW0xOXV1bGtzRG1Sb2E2ZHNqeHpaY2ZxWlh4YndjUXdl?=
 =?utf-8?B?S1ZhS21JSDBOOFlUdVRSVFUvWkdxNTZCVFhjZlNsOVhKQXlhWldtSmcvTmph?=
 =?utf-8?B?L0FMcFl6STN6YU5aS0w3UGowcERsdUhEVVFlaW8xZmQxMVZjSC9qdEFkVkF6?=
 =?utf-8?B?RHc1bzJHWnRjNHBzTGRtNzBpVEt6Y0wyUUVtRW1LdExHREppR2xGOWs1eTVZ?=
 =?utf-8?B?WDExMXQ0SHZDSG5QQ08zUnp0M1JhWVVmdlJlLzUvbWFuTmVyYU1DRXQzUkNp?=
 =?utf-8?B?NFpyQzRlanZ3NDdvUlNWOGV0QXY0bUFHbHNJRTVMYmZWUHQxSG00VDJVaVUx?=
 =?utf-8?B?Z3FpR3B1NmhOMlA3UGVyR3d5YXNLVHM5MkNORlZCcWN5VFA2M2IxanB4dFVO?=
 =?utf-8?Q?CA+umOXIi3kUPyFt49khOBnbaOszoXu17IckKVBq5Daq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138d6bf1-6d09-407e-3679-08dd798b6088
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 06:29:28.6397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGPZAjkp5s1pYPCZKZ0i+4VRjDzsA61ahA3M+CXjfOAFN8y3qnEDsFzV7LQaFvwISbuYH8jI9pgwxc6O3dbquw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207

This enables the creation of trait objects backed by a Box, similarly to
what can be done with the standard library.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
From this discussion on Zulip [1].

Heavily inspired from the similar feature on `Arc`.

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/Trait.20objects.3F/with/510689662
---
Changes in v3:
- Added trait object creation example.
- Link to v2: https://lore.kernel.org/r/20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com

Changes in v2:
- Use where clauses to improve readability.
- Fix build with rustc 1.78.
- Link to v1: https://lore.kernel.org/r/20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com
---
 rust/kernel/alloc/kbox.rs | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index b77d32f3a58bab5ec73c612bdaaba0d79bfdff65..e043bf2f468774c4556e99d9d750f1596f0ed089 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -57,12 +57,50 @@
 /// assert!(KVBox::<Huge>::new_uninit(GFP_KERNEL).is_ok());
 /// ```
 ///
+/// [`Box`]es can also be used to store trait objects by coercing their type:
+///
+/// ```
+/// trait FooTrait {}
+///
+/// struct FooStruct;
+/// impl FooTrait for FooStruct {}
+///
+/// let _ = KBox::new(FooStruct, GFP_KERNEL)? as KBox<dyn FooTrait>;
+/// # Ok::<(), Error>(())
+/// ```
+///
 /// # Invariants
 ///
 /// `self.0` is always properly aligned and either points to memory allocated with `A` or, for
 /// zero-sized types, is a dangling, well aligned pointer.
 #[repr(transparent)]
-pub struct Box<T: ?Sized, A: Allocator>(NonNull<T>, PhantomData<A>);
+#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, derive(core::marker::CoercePointee))]
+pub struct Box<#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, pointee)] T: ?Sized, A: Allocator>(
+    NonNull<T>,
+    PhantomData<A>,
+);
+
+// This is to allow coercion from `Box<T, A>` to `Box<U, A>` if `T` can be converted to the
+// dynamically-sized type (DST) `U`.
+#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
+impl<T, U, A> core::ops::CoerceUnsized<Box<U, A>> for Box<T, A>
+where
+    T: ?Sized + core::marker::Unsize<U>,
+    U: ?Sized,
+    A: Allocator,
+{
+}
+
+// This is to allow `Box<U, A>` to be dispatched on when `Box<T, A>` can be coerced into `Box<U,
+// A>`.
+#[cfg(not(CONFIG_RUSTC_HAS_COERCE_POINTEE))]
+impl<T, U, A> core::ops::DispatchFromDyn<Box<U, A>> for Box<T, A>
+where
+    T: ?Sized + core::marker::Unsize<U>,
+    U: ?Sized,
+    A: Allocator,
+{
+}
 
 /// Type alias for [`Box`] with a [`Kmalloc`] allocator.
 ///

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-box_trait_objs-02a700401f0b

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


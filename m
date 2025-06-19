Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA232701DF;
	Thu, 19 Jun 2025 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340507; cv=fail; b=to3HmUYugexCoBWEGUX/3sBErSc5OibSRCWGx3Lc0MXZAu1x0JXc5dLRB34tP287aqK/Q8ziJO2yqr9KPzz5zA8uPwWi88twI6/P+hXP+wKfc2NzoNmsmtehzPIr1ykf4MxGS8M4xpHY754Sj/ejU4zkW3o0yUibWvBpjnV0rjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340507; c=relaxed/simple;
	bh=3f6RVRU2uXVGeLcAPq/WQQxUDAeGqZNjn1PArM3yGnk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CAz0ZdaCia8KHsXJFCI3gxTQXQTLx1RIMshdjSF0DkhYLTglBhg1dxyXcrfKzKV8r3J46RkBBslnrg796ta9GpUNRO2MqxgX3c+054+JDG9jGbSR42W6u4g+M6K13w0j7aBKd/5FOzhIZAT+Hko7nr1hjy/pEFsaNSBq/NhUpfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cu6Mg0qM; arc=fail smtp.client-ip=40.107.100.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cu6Mg0qM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnTgLn2GVt5781uD5j9SIERss4a2TuGC4Sru/wVfuXaHJVIBlXqHvV83ULQ3mDxgynKJy1IXx64klq/90s1yXcuCQ83vEBiKO8ly2yMTWd6iPCa8PVoWgG0XCtExsZdFClIt1RmUY/CWSZj31txLz/favjcVcu4OYoGP924xeEKXwrUBihUK3IRfmz9Dg41u+9CIj6LIicwnP7OTZ+D/63Q5bHQKSAzertns4/LYduav3XML/9iS8x3hO6Ygi8Ln0nNtsXMUdFXH/SMPfMhkua2bfJ9/v5l3GAnO715QsjHgoLRwHYR0tf8nN0oEnzkp69lekDWnvYp0YNISiiU0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3f6RVRU2uXVGeLcAPq/WQQxUDAeGqZNjn1PArM3yGnk=;
 b=RU+t9qeOq344d/eQYTM3Dq8e87CS6uVMke5e0PIiYhJl+24zuMNKKwifOSmadNipJHu3GCKPSdK+g409ZP1jjpdhPbXSSXMkhoK/XP9MStNXEWjFLW60F1w4SPlIubSnVa65Duibl7TBqbaTSgCLlhGkXKlWqw2BwFN7iOMjsgVS6KRLwPFCMnAs9Xl9MSfFiT0oYfi+Y8ouwOFAmPLBCclGr2EmPUz6gGbgt85qO4Zpp8DLdWgjPLgmcJMcILU4mXUzaTbFFiEaBNZUKsrFmCiFJcUqBL6B6Do/WI/l1SAFlC2PkDeXw7HfM7N/58LIY6xo0zMP198cze8ipOHcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f6RVRU2uXVGeLcAPq/WQQxUDAeGqZNjn1PArM3yGnk=;
 b=cu6Mg0qM/ij1ayzcEJq8H6Pw/DSwiuwn1nSj0DUJjZ1Ka4hu07ipMOf/3Rg8NdbBpAA/FOxBV2Q8UfV0b7P3Q4i7bb0zm8l/aCQVAx3hd8LHk0nu7TwYjtNeC/C3zCX4/A9CUlC4JjaKwFC2w7rlDdc+ZPXvmtcGniDCnGaQC/u+BUhudtqM9lVcn3g2dPmXWNt36w4Fb1r2nFUDAQ/fG9QIqYUWu9XaxLEBZYWc5lip3ft+4jdPXqVfnECvm/NsPUAWwnvi1NlmzWF3uJwr2+gj4RFpJJ1ricsCCNgPKKVSVqRIwD+8M9qilzc9XTuaivKj9yW/vXCgB4A4DX9F3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7729.namprd12.prod.outlook.com (2603:10b6:930:84::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 13:41:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:41:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 22:41:40 +0900
Message-Id: <DAQJX93WKP0F.1RCTR99FDCQJX@nvidia.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>
Subject: Re: [PATCH] rust: make `clk::Hertz` methods const
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250618091442.29104-1-work@onurozkan.dev>
In-Reply-To: <20250618091442.29104-1-work@onurozkan.dev>
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 999cfdc6-81bf-40bc-8ef6-08ddaf370703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck0rZFFLR2RqVnJOOTArN1l4QlI2bUxYK3hMQmZlMmRTMUZaaExrdGdYeExG?=
 =?utf-8?B?Snk0d2o0dU1YVzB3d3NnelJLd0l3MWxmdXZLa3dxSGxlNTVZNDdlT2djMDJj?=
 =?utf-8?B?T2lneS9XUFB1aGM1OXg5aEViR0g1ZGh2UmwxTktzaklPS3lZZ21wNFZ5Tmw0?=
 =?utf-8?B?YUtBbW04Rld4aGtIaVNza0RCK2hxcHJyT0hqeEFjRXV2Z0liYU5YZmdYNVk3?=
 =?utf-8?B?REh2OStJdE5ER2VkZnBmOEhLdFdWaVB2MitsL1RRMXI4Y2lsWFpIL0orbEpO?=
 =?utf-8?B?TC9YcGR3bWZ5Q0laUXUzTldGSTBwK2VNOXdyWlhrSWxxTWlhRzA2RW5kNmgw?=
 =?utf-8?B?Z2RVekdwaHpQeVRXcDU5VGJlM29BZTRRcmFqQm5zelJEVHJiQThEb2pRbFFR?=
 =?utf-8?B?ZDVjMzdoNllRemh2KzJUTHNTdUdpVEtZUGJJK0dDQVFHcERkZzhJeVI2OTNz?=
 =?utf-8?B?WWRNbEVTQkkzWnF4VjZlR1F2WnBjNmVWZStVQzdjUjZMOFpmdFc2Lzk2OWRp?=
 =?utf-8?B?SkV0TTV6czZRR1B2c2UxOGd1VnNQYjliNk01dVUvdUpvNFJGTWw0cVFxU2Q2?=
 =?utf-8?B?SEtHbWlEVXlCbnRVVlc1QUxITWh5K2NTZzNyZlJleTh5RngzWnFmZDFCTzcv?=
 =?utf-8?B?NUZqRy9Kc3QxanV6cEQzUitTTmYvN1Nxb0JuREJZYnp3WnorRGlWeVdhYkxM?=
 =?utf-8?B?bWxzNDdqemlWWnk4S2FJQms2OWs3Ums5d1Y3bm4xWko0eEZBNHp3dFBtUmRS?=
 =?utf-8?B?WkZBUjl0Y295cEg5ODZBS0o3TVhUWm1VOEZNbjU1YmhrRitBVmEybmg2eXd2?=
 =?utf-8?B?SGpVQ2ovbWlTQllibEw2dXZ3QkxaYXRpbVhQUlNnV3diWllncHZsUngrNE5V?=
 =?utf-8?B?bmFuN0QyTlhCYnEzSHRVRWRhcmFER1lzak83cTZ0Skh1c3ZvcGJOVVRPTkoz?=
 =?utf-8?B?c1htQ0d3cHZiZFV4d1Zwc2JmUGo3VHFqTU1KZWlnMGdSdFNGYzRRSW52Umg1?=
 =?utf-8?B?cFAwT0lheXZtdmFXcTZWY3JYMU91c1BUejZNVnNaRm5kVHZWcUtXRFJwcjZS?=
 =?utf-8?B?bVhOV0l1VUxtQ0J0dEJRK3FZaGRUc1dTNTZyb1JFa1RaOGNWbXp1UUJiTnVC?=
 =?utf-8?B?VHJHR2tuQzZpalB3QzkrSWhqcitVbDFxcE1na2xJL3ErdW5vUStFZFlpem94?=
 =?utf-8?B?UGJRQTRheHhHNUFpb3NINWpGOXlkVHlha1NuL0FIazlJRXBCSk1YYm1Pb0xR?=
 =?utf-8?B?QnVrUlJTMVdSVDZCbk1MZWVsT21WZ0c0bzdPODM5bnRvY050dzEzMFVRMTVF?=
 =?utf-8?B?OVhoREQxemVZNU5zUThLdmo0MGh6TmlBY1gwV1pVWDR3VzZpVWx2SU5wM3dx?=
 =?utf-8?B?aGZuVTZCbnRIMk8xMzM5QktvNlBMOXNPaDRXUkpoc1RHR1ZNQlpGTnR1WXJa?=
 =?utf-8?B?Q1BUb2U3bEpub1dDMzNRb3BZSHl0dStmcmxpdVBIYmk2ZXVQcXpMOTZCYVk3?=
 =?utf-8?B?eS82MndEMWYrL1BsYVhxbnIzdzFHWTh4RzRLOW1heStac1lzbEVxdGdwSjhh?=
 =?utf-8?B?cjNKekxQSTU1WUF1ZWpURGdBaGM4R1U5WmhBSG5aOXdJZ0RLU0RrdmpkR2w1?=
 =?utf-8?B?Y1B4a00vdFRBWlhRaWZPVjZER3FVYVFCMG1qNE0vR294R252c1UwZTNtK2Vh?=
 =?utf-8?B?VDBxMXlsZGsrUjJYb1J2VjBVaU1kWFF5MGFHRlc3WFlmRWhHaTZVYk96K0pW?=
 =?utf-8?B?eUd5QTJYcmdPa3duWHFVdXFmOXdvbktyYldpazk5dTh0MlArR0UzRmpJajBC?=
 =?utf-8?B?TllHbnNyVEx0K09YTjc3OVlpMWsvTEFvK1hQTERsS3Ryem52dnV0bmE2YmRM?=
 =?utf-8?B?bnM5Y3FsWFR3dFliS0ZIY1NRTEwyR0RUWDdaQVV2aTlaRG9scjBteWIyWG1Z?=
 =?utf-8?Q?CDm101AgeV0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UldyTzR3SnRWMTJDbVF3cjh0czByK2k0N3Z6Ujdna0hyZHZiZVZzUy8wWEph?=
 =?utf-8?B?QkRhemtmZEx0M3Z2MDJENjB3d3Y1TzRnNWxLUnBFQTFwRnAwRS96M3NCSmRn?=
 =?utf-8?B?YVoyUzFlSUMvRWY4NUFxeDFVdzc0WmhrekdlbTRhYVBBK2sxTzBMWTB4NXhY?=
 =?utf-8?B?VUlFNkJ2UHNja2JKVG0yem00cGxyb21RaFFNS3hRMGYvOXNySWxGeC9ZMEtn?=
 =?utf-8?B?MFA4djJwNWZKNW5Fd2VRSG92ekFDQ1A5SWVkYTUzQUhUOWVXY0xNd1paajFh?=
 =?utf-8?B?Slh2Zm1taWgrNW8rT2ppQ25RTEVuNldMVGRWTHRTVW1MSWU3VWNRRnhsTTQx?=
 =?utf-8?B?Q1c5TnhvSTJyRmx2MnljOTdieWNLVGpJYlBHUDdMTjRLRmtQZzdGeXc1Mit3?=
 =?utf-8?B?bGhCdmpsUHAvb0FSTFZ2Nit3b2JqYnpzZmxsZDVGRXRKd05TZEF1U2pCR2Fy?=
 =?utf-8?B?NlhrRGUvS3QydHl6a3dwWUIvTVhTa0dzMmw5ZDZRaXpucWhPc29qeVlXYVF5?=
 =?utf-8?B?SW5zSk9TZjFYSzJZYTRHazlaVjh5WUFtUHRiU29MeEJIcU9xeFpNZmM0Q2Va?=
 =?utf-8?B?NG9CMEptaDVKejJhTW5mYW16d1JCQTBvS2Fkb1BqUUZvRXAwSjdScmFuUHFt?=
 =?utf-8?B?blR6aE51TThTS0xpMEhxaWI3bEFjVjc4M1JvTVU2clJETFc4emJPMTNtQ2dV?=
 =?utf-8?B?QmdxcGkzWGh4R1V6NEQvblJNbzE3SmwveVpiZThGTEd1c01TWFlVTE5IbHcw?=
 =?utf-8?B?UG9NUFk4cVFRSFRDQkx4bjd1ZlB2d0dGNkV1ckRlM1Mzay9NZmpYVXkvbkgy?=
 =?utf-8?B?MzVMbjk4TlFrME80M2QrRlN6Ynl0UzJ3UFk1STV3MWlTVElQaHlSaGF6MWdH?=
 =?utf-8?B?a01Gb29kQ0ZFYzdIQXBYdVhCLzFzVGlidTVXbkdIM1VmWFJ0SkZwQW5VbEVj?=
 =?utf-8?B?Z1JvS0RlN1FvYWVyWGV0Q1pMNEVkM1hRcUwxcXV6cnV6bU1hSVdFMVl6NFdB?=
 =?utf-8?B?OFQxWGhyK2xmN3BRN1ZZaVRPNkhlN21LM3dyZlVPcXBKZnlXZjVFTXhmR2xD?=
 =?utf-8?B?Y1RHYUJHM2lJNndCZzBWVXpndFhPSWlOREJuV2NHeTlFMzB3Q1NIWXJsb1c5?=
 =?utf-8?B?V3VxV0d4a0ZtUTNYL29Hc1dQMHRuczA3ZGwxWGZzZjZudGJkeWhRVGVWcUJk?=
 =?utf-8?B?Q0xJUjRkWS92Vk5MN0dCSGt4dUFVR2E1dlpXb2dyTjJnT2pyMVZmRDl1U0Np?=
 =?utf-8?B?ZEM5aFY5TVl3NE94bXZwSmw2aHJzSzlkRkR4UUo5WjdDYWt1cU9Bb0VYclVw?=
 =?utf-8?B?MFYzTjhiMURDMU1jSnVWbU1IZzg0cGN0UkVGQ25CMGM3dS9NL29PMGRWcHNk?=
 =?utf-8?B?d3NidXF6YUlXSVdzbWM5cElwVkVaWSs5V1ZVTnpPSVNtWW9ldUttQXRnenhl?=
 =?utf-8?B?dnBHNXZkNU50aW1haWpHMzZHMVNQOEFSU2VoaXh0T0tuMmtweXA4dDUzWlNH?=
 =?utf-8?B?dnBZcmJnY1RiRk1vbVc4TjNUMkpSWE05Um85VkE1NytmMzAwUW1zaWFlUXNv?=
 =?utf-8?B?VGx1eWFGbE9jTUg2bHBqQVpvOHcvU0czTGMzL3Nkeklxc2c2UjJzRkliVHUy?=
 =?utf-8?B?U0JkVFcvNjdVMldNcm9DUi9NUlJsRWpMZzRFTEZNUTJRM0laVTVYSm43Y3o0?=
 =?utf-8?B?N2FsYzNnbG1ybGFRV1JrL1YraC91NXdTR2QrV0dKcTkzK0poYlZmRkhGYzg1?=
 =?utf-8?B?OEhIMHkzWnE0OUdCOVBxZmtNUHlzY2JhbUttdmRZSjNJWTVHY3IwcUF0U0ZJ?=
 =?utf-8?B?SXMwS2d1eGVkWnRNb1JqdDZHTHFTUjg4WGVDVjdNMi9va0tHMjZaS1h3TEln?=
 =?utf-8?B?bzJjQzhSTXBuVUxrdE0wQXN4NnF3UDNodWFyVkpxRXR0YStkdElwOVVJMVpZ?=
 =?utf-8?B?T2dqVSswRkx0anVqR2Q4SEhYbUdVSm5ZQ2E2aTM4U3hSaTBrazJ6dFFDbG1o?=
 =?utf-8?B?WlFrT3RocTBadVFZc2d1anZxZmg1Q0RaQ3Vyd0RuR1hpYXlITExSMUpUQ3R4?=
 =?utf-8?B?SllnK25vSXV4SmRIWktWNmdQVzg0V2s5bWt6cjZETVkzNE9PajhiUmRqcHBO?=
 =?utf-8?B?a1JaRE4xTHZ1N2dtc2dSa2RmRnd4M2NuanpzNHg3LzRjQXgrejNBbUNHMlBB?=
 =?utf-8?Q?v1He3axAJAm6gpMOEg1PF/piFQOQGicfL4par+UzlL07?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999cfdc6-81bf-40bc-8ef6-08ddaf370703
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:41:43.4842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PO/KLnHo/qSRbPYYsrcvyauM9oMBSFkNCe6KPdpLps5og5xTh0+DtuslViPEBDj2wAInIEXvVR+MOKDf07q30w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7729

On Wed Jun 18, 2025 at 6:14 PM JST, Onur =C3=96zkan wrote:
> Marks `Hertz` methods as `const` to make them available
> for `const` contexts. This can be useful when defining
> static/compile-time frequency parameters in drivers/subsystems.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

FWIW,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>


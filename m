Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754E20966B;
	Mon, 16 Jun 2025 08:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061369; cv=fail; b=ekRCO6UUq4wwFNezwpRLA9pBt4MVsNkD9xZKDfgv0MXc/woSJWXX0bKd5ptz8K5bKTazww9gvOSkrC3X0oWIbQZO3Dslav/i4TmlXSPPmxNz+KhM9lVYXHiAxoxkPXOOs05Zvuz6TdjhP07bwURTPPU0JAK19cCWnzHMUCJUFjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061369; c=relaxed/simple;
	bh=89gTRQkGjI1TzHr/Xp0mCNngr36hgL2fLY4kA/Z07oc=;
	h=Content-Type:Date:Message-Id:To:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Lwaca99iKG8i+/siRgH8BExEAZrKVmZCSFNc9K5ScuCSSpJ5UbY7nikd0o8TJ82sjegEAf3txRrmHOWhdjGnkC2BdMazOtAIoLOt2gg6fNvqu61AW9uImk1HIP0RthQoOHzYpDfqYykw3vFkiKQkj/vqxSLCxdke6/54/Rd9tbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J6G2x1Ek; arc=fail smtp.client-ip=40.107.223.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J6G2x1Ek"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZa9XvltOCLoAKFAmBxOaQGZ7Zc0ZiXTAOqS1t/OmufFLQIwO6BbGDyuCV8J2e7TFQW656LWzz/tkoD88hTMGRG/TpP4xfBUfRO7up5OiVHmxbV3JmUCjCOOIbF80E+utxCK8WB7c+8131t7uPxDeRX7LDdVnNktfm5O8z98HFcOkdkW7BUYQCjSTiksre5vWDsk0zKt86anSU70um+YnPIBpnwPdKIaNCxns6ASRzBjuFlW1SiaXdjoPmKlONb1Z6H5KIYs4NXLwCBNUh32p91+/TfCL8ZAW0cm1sB/OtybllaTMM6xWjravP4JFvVUPQ70pFqFolS4J6Q5o+2SSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXT2hKPVcGGwAtgJnEC8y5HDW6/KS35o5nXgFbleFCg=;
 b=Eh7gptrX5Irpl3VIucOfcYBoDoU5dRRYbnZEXTkaCsNBdM7A1kdAB7wA3LBAfYPpozh56+7G60sqLL5d5sFwieIlngTC+btdpNnk66JDyloUc1qlw3wG1oLpPC9OktOXaIc7Vuw2XCOQ93eHOw1JEH1saJM8CPAjKT4dVWjA2NYYzUIS5by75rm23tU2JAKBKbp9tEk3NWcs1iiFfDxRjTsHZGs6hYOn8Y9hTDVSasjZhc1zOSTS2wdUalZAK484KaRkiEGVaqbMhVid/BqVWiQmOHiDAr9Fh7oJw8hkRf9x+ZV65L2LPN+K4uBYZhRYweUNhTpYx9+14dFGZXGpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXT2hKPVcGGwAtgJnEC8y5HDW6/KS35o5nXgFbleFCg=;
 b=J6G2x1EkL5chLVjKAteSEipxQ+0X+rIXvwYkCiEz5jVswTebSjNlsTGLuMD6Tg2MLdsh/PSR8VMqpV5lezBEeiEJJrgIVUzsYZ1e7cUZqSs6+VKZBan5fMI4t4q0YwTyuR5BFePnKIo3mmfg8ZarnESjIuBawvI2DfXsomC3jKy4sxjJXJA07lACi5+F9ZTNoRTuFPoSzFNvDpRj6sv0C4nCAHfVYeeQqEy0t2IpqHb+O2a1vExXL9pNgkSuN6jXGUU9WIDpfzD1d0k9zDEnDdUsDLeAHyZac3jv9hwkEqK7kxAA8H/ieWV+gkLTBqHxJ0CYUYtk8azfiDGhDwjfFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 08:09:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 08:09:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 17:09:21 +0900
Message-Id: <DANSZ6Q476EC.3GY00K717QVUL@nvidia.com>
To: "Every2" <christiansantoslima21@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~lkcamp/patches@lists.sr.ht>,
 <richard120310@gmail.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
In-Reply-To: <20250615072042.133290-1-christiansantoslima21@gmail.com>
X-ClientProxiedBy: TY2PR06CA0047.apcprd06.prod.outlook.com
 (2603:1096:404:2e::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: c132d69a-cd29-4ebc-037a-08ddacad1b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWdYdHZldmwyRjI1MGhkaUUrT1RSdzZaRFUybGY5Um95cmprVjVJMng0Y29P?=
 =?utf-8?B?RHVEQ3ZHKzFmd3pHOW5jREhYTVByK0hpcU9HTEw0Q2I4bDlSVmZkelo2NjVs?=
 =?utf-8?B?RlZPdUJiUEhvUUtoaVg4R1BRY2lwZWFtaVRPYkxBNU5TV1BIQUlqOGVnRUFz?=
 =?utf-8?B?czJ5T2FuRit0QnRzWEtFdlRWK2w2c0FTcnlMbzk3WUlLaW9SMmpZT09malE4?=
 =?utf-8?B?WmVES1d6ckM2S0V0bWVZWEFTazRLN3pjVEF1Yjd5VEFieC9wcjJLT3BLQXph?=
 =?utf-8?B?dEovS3RSaHI2c0NsK0cxaGxJUHNYcEtvM2pnbVcwL0ltaWhsM1plQ05JOERN?=
 =?utf-8?B?VkFZVXFQWG1yRmpmQ1A5RDVaSE45ZVpCbWp1M1d0dU9zQ3BTYUREVnhGNzF6?=
 =?utf-8?B?QTFEam9nM2ZHY2pOaEMxK2w4VHpEMlRLNEo3dGlDQWFYY0J3cW1PMUhqeTB4?=
 =?utf-8?B?MG9McURQbXFRa3pvMTl1S0wwN2hnNVgvUy9PemdQTld6VllBYWZLTXJ5cWI0?=
 =?utf-8?B?czMxSkJhNU9LQjFtV1lReU5aTFJFaE56WlBnU2JoS1J5WmNRK3MzbmdiVmJC?=
 =?utf-8?B?eGRwUk1vNEF3R2lIa2t1YXpRUVlNWlVYOXZxQitaMDQ2aEFiOWtTa1ZnMmZL?=
 =?utf-8?B?MVpxNlp4SWozL01yM3VLRjJVV3ZHZnlBVDhtQkhPb0F6c1FkQlpJaWZCWlRZ?=
 =?utf-8?B?ek95Wk9VVkUzbktpNDlkOUNGYkJWdkNTR1MzUU80bGhWK0traGdORkZHWkNr?=
 =?utf-8?B?TlBWbUJ3UlgremJYVEhzL3RuOVVTZGJQYk10M2hXeTFjNWpUMWN2NVpyUzhw?=
 =?utf-8?B?dkJnaUdPV3ArVFozUlNCaFFhM0ZYWTljMEMvTjlRYkFhaWx4M2c1SzlMT0Jk?=
 =?utf-8?B?WXBCRmVvekZZOXY5MmlZckxudzJhYVJsajRtQXpTY1I2T1ExaS9PSWQ3YUNt?=
 =?utf-8?B?cXdVZmtnVGxQYVZyT2tPcVJGTkRIbHozSUlubGlTQUE2dWovTjgzbE94VnJs?=
 =?utf-8?B?bEFCSk41TjNPMXpMQW9aVFN6SGJ0ejczRFhtZEhNaldKckNLcEIyZTM1SGo5?=
 =?utf-8?B?Rkt4K2lCaUY2WW1TcHpyREpTRlR4cElldEJZQy9UYUNDekw2VTd3ZTMzWHpv?=
 =?utf-8?B?djJRNm9HMVNaS2J5WERPYk5TZ0lkdE1KZncyeVZMYUx5SXU1TFN4ckdKMU9O?=
 =?utf-8?B?ZU5hOGwwVUFvREMyR2l4dkZMVm54bkxTWlJqT0dCdnNwL0tDb3MwKzIyRWNz?=
 =?utf-8?B?MWk1TS90SU9SbWtCak5TdXcvbGMxcmlvaEc3RlNINUgwVUgvQTkwZnVMaHVF?=
 =?utf-8?B?bWJveDNsbDdTZ0dOYkRZRXNMMkQ5VnMvNjd5b3pxbzJkVXlaK3hnd2I5K0RU?=
 =?utf-8?B?L3FFZUNYaXpvbjVOVEpDNHJzaEhzVXlsOWJ2STc0TXViZGVXelo1bnd6d1ZK?=
 =?utf-8?B?SnVLNytLTTBmdmlEcDM2RjRreWlFVnhDcVB1VThiNHEzR0FETFNzc2dMbE5C?=
 =?utf-8?B?UUt5RXlHV2NHNXhuZFpIWXFYRjk4S0NXclFFeXFSUHhSbXNIb2NsN0VucUFZ?=
 =?utf-8?B?RFhiVXh3UCt3ZzU4aGJONXBtUnptU0xWR3NJSnFGanU5NVUyZ3lSQ2FvbXN3?=
 =?utf-8?B?SnQvdDNHTkpTZ3RaTi9lVmp3Vk1lNjVZbDBGOWZZZ0djb3RmVkJqVDZXbmEr?=
 =?utf-8?B?NkF0Slc4WnZvWThRai8wZkh3QncrUFBmdzFIQTlqbUJ0RUpCOTd3Q0M4NVRh?=
 =?utf-8?B?cTFGSnU5UWk1VWlaZDVCUUJaNWJJU3YwNW5zdGJIam9sakdWRjdENGZhQ1Rl?=
 =?utf-8?B?dFJkRFNqbng3Y3N1cnROT2ppeFNpTmF6T2liRVpOT092Mk1XdTAyL0VxekF1?=
 =?utf-8?B?Y2Q3OWk2VW5RcWpCNzAxVWppcWpEb2JUb0N0dUF3NnVEUDhDb3NrTjJvMHln?=
 =?utf-8?B?NUFrVjNWVHcyMW52Zldla3ErTWU2UTJiS3gvNVBWRFRWYlpua2llYUlubU8y?=
 =?utf-8?B?Z2tkNTc3d2tRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk10YWxVSFBya3dxaE9jaUxDOEFkMjIwYmNqVkhBVzV6OUZKNSs1OW9VbFZM?=
 =?utf-8?B?K1JvTTRuU0JGaHo0STk5RmtCYVpSNTV5Uk5mZnlZOWpsVk5jTk5FV24wU3BX?=
 =?utf-8?B?YWhnNkQzUDFnYWVwZTJHSEp2SUVpWENFeWVjV01IVENYeHNGdjZtYjZmMEQv?=
 =?utf-8?B?Um51SmdJZFl2dmNxc25nTCsyQ1hsY2lTS01HYlRwakZ3UUFIdnAwMnpGNUVh?=
 =?utf-8?B?NHJkWmJ2SGUycVRqT0FPWnFaRnd4TUMyazY0Y3psbnZoK2JHZDFFb1RhTk95?=
 =?utf-8?B?VlltUlNHblZDTTlLNVVyNzVBZ01KNFZDaE13RXpzWTM5bkVjTUgrWWF1d1ZO?=
 =?utf-8?B?OU5VMlZ5ZG5iYjJzRjRKYU9OaGJ4TlVsM3ZUSzRLL0Rqd3NQQ1NzWXBnYnRM?=
 =?utf-8?B?YTdZOStpTTJleXAxR2k2SGgrOXYweUprcFFySy96N3FWZWxuVUtRRU5JOERY?=
 =?utf-8?B?WDRUMnk3K3FIemFwbWFqY2NVYVBxN01PZ202QmNWd0xJaUI4Yld4azB3QnJh?=
 =?utf-8?B?TVFzUzh5UVgvTG1TSURKR0FKdHprWHZKR2sxRGxZU3d3SVlVUy9JMDRTVFRk?=
 =?utf-8?B?UDlRRWxRNlBxY3M0WEhPaGloM0twTVVodEhiU0tlTk5US3VsWTJUQytyK1B0?=
 =?utf-8?B?cVRtNDd6aldqVVBUUUhUaWppQ0ppUUVEanVHYkQ5SDlvay8xS1dkZ0ZienRY?=
 =?utf-8?B?Mmk5bkpSeHJhS3dRQ1F0WWswbGd4WXQ0TXJpMHduSElub0xkekRRaDM1M1Fa?=
 =?utf-8?B?Rnk3TENibnNZN0duRFZFUU5zcklpSmIyL245SGRKaEFMWXJjN3MzTVJBdXFG?=
 =?utf-8?B?VzQycVBWQWRvMzR0bkJGU3ovUStYVmtOa1FrRFdiUHVJZjVLYktGYzJ4QXZH?=
 =?utf-8?B?MjhsY2VYWjVXT3hHNTVuVW1ZdUpQSDdJWFdWSmNqM0d5YmJXTlBCdXU1anFX?=
 =?utf-8?B?L3ZmMWxlaHdldlRId25UNTY4S1pTYWpzZWZyYStzdzgrelBFZnA1bHZYWVlQ?=
 =?utf-8?B?dnNhSm5EWlVEb1NmTHFEL0N4R0Z2MlhrZkczc0hUVmxOdWhJbEdQZExsUm85?=
 =?utf-8?B?alN6Y1ZRR3BiUzBoeU43a1N1d0p4OG9DOWo2bC85UXgwbHYxT2RHWnNRRjFj?=
 =?utf-8?B?R0FHSExyTlJLdFN4WWpIRUZxMGZYSkIrK1ZFSUVBVVVxRm1tMGczWnliQjQx?=
 =?utf-8?B?ZmZiZ3FmTnpoVndIRjJFa3l4VjN3OGVLWG9PcVk3b3NSVWh1SHJrYkZYZXYz?=
 =?utf-8?B?M1l1eHYvWHpINkMrVHNwV0RreXhiMllHRkV2UlJ5K01LYTZkbWdLMGZ1dE5L?=
 =?utf-8?B?OXFQNlRVQXFuYWZVbnkrZlljSk1ZZlpwMWNjcjZCcWRoRStMUVZiTGZSRG9Z?=
 =?utf-8?B?SVdKSWJ1b0VncElKZ2MxVG9HclBOUHBGa3pYNURvbGcvcVpJT0JLQ2RBU3J5?=
 =?utf-8?B?YjNpMlJFeDR3SWRwaWNXem5GdHZtK2xQUFV4Y3lQTERiYVhFVnJLcUJtMCtQ?=
 =?utf-8?B?ZmpPVm1SazJjaTdocEI3ZmZqRENxZUQ3d0ZwNGRITWxia2tvd0h4Q3N3TVpX?=
 =?utf-8?B?NVFPSHp0N3lsYmQ2MXdrQkxKbmZnckI3YkNnQVQ3dzQrSnFMOFJ5MTlJSWk1?=
 =?utf-8?B?VXlNMCtSVUs1bmJkdkRPVDRyK3R3Y2VGaHgxRWFtY042cVRrNHFseS9qWTda?=
 =?utf-8?B?ZURycXk0ZE9Rb3I1T3BqYmVnZjlqZ0F3MHgzM2Y2VEx4a1d2eFBnSXdBL1Zl?=
 =?utf-8?B?WVFhTE1heTU0SVFkSnJ0MDB2RThVd1M5cHQyZGFKTnBvN2UxS09NZlBzY3hq?=
 =?utf-8?B?M3Q5NDNFdHVhMWcrSmdFUWo5RXpOSUlZSTBmTkRyTTVxQmZGU2c2azlyVCti?=
 =?utf-8?B?Z0xUS29QK1ZWQkZJR0tua3F1YkV5bW4yMHNOOEExOEtVRk55VjRCZVRLbjk4?=
 =?utf-8?B?L3VWTEt3OUJrZndhTng0ZWtuNVNJek5VRDc1bWpKSkZIUjh4ODdSdUczaVZS?=
 =?utf-8?B?eTZ3SHl0SkhyV284S2J4MXA1ekxDUS9JZG9CdzJod09iNzdRMEtXd2d5eHc0?=
 =?utf-8?B?Y3VNQlRUbllwQ1UvaHZmVHpQRGJDNUVEOWtnOVZKUkQyVmRZSit5QTdIcjdQ?=
 =?utf-8?B?ZTNGRWlHdHpuK1U5Qm9RSnl5SVRIVk5mRXk0VkVpaHhUdTJYM21NZjZBRGM4?=
 =?utf-8?Q?5FWocGII5z21BqW5AsopjbtCa2AL+BFSH6MUFkDVladK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c132d69a-cd29-4ebc-037a-08ddacad1b7a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:09:24.8787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZkSIKgvUTP1fDSjQig614YKFgmMfVS7RpQOjoeOquCpSlvp+qOpdE3kKYDNSdKi/nUyeakUBVOE5oBLIrjcyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531

On Sun Jun 15, 2025 at 4:20 PM JST, Every2 wrote:
> Methods receive a slice and perform size check to add a valid way to make
> conversion safe. An Option is used, in error case just return `None`.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1119
> Signed-off-by: Every2 <christiansantoslima21@gmail.com>
> ---
> Changes in v2:
> - Rollback the implementation for the macro in the repository and impleme=
nt
>   methods in trait
> - Link to v2: https://lore.kernel.org/rust-for-linux/20241012070121.11048=
1-1-christiansantoslima21@gmail.com/
>
> Changes in v3:
> - Fix grammar errors
> - Remove repeated tests
> - Fix alignment errors
> - Fix tests not building
> - Link to v3: https://lore.kernel.org/rust-for-linux/20241109055442.85190=
-1-christiansantoslima21@gmail.com/
>
> Changes in v4:
> - Removed core::simd::ToBytes
> - Changed trait and methods to safe Add
> - Result<&Self, Error> in order to make safe methods
> - Link to v4: https://lore.kernel.org/rust-for-linux/20250314034910.13446=
3-1-christiansantoslima21@gmail.com/
>
> Changes in v5:
> - Changed from Result to Option
> - Removed commentaries
> - Returned trait impl to unsafe
> - Link to v5: https://lore.kernel.org/rust-for-linux/20250320014041.10147=
0-1-christiansantoslima21@gmail.com/
>
> Changes in v6:
> - Add endianess check to doc test and use match to check
> success case
> - Reformulated safety comments
> - Link to v6: https://lore.kernel.org/rust-for-linux/20250330234039.29814=
-1-christiansantoslima21@gmail.com/
>
> Changes in v7:
> - Add alignment check
> ---
>  rust/kernel/transmute.rs | 95 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 89 insertions(+), 6 deletions(-)
>
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index 1c7d43771a37..5443355de17d 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -9,29 +9,112 @@
>  ///
>  /// It's okay for the type to have padding, as initializing those bytes =
has no effect.
>  ///
> +/// # Example
> +/// ```

This test won't build unless you add a=20

    /// use kernel::transmute::FromBytes;

here.

Also, two other tests in `rust/kernel/dma.rs` break as a resulf of the new
methods added to `FromBytes`.

> +/// let arr =3D [1, 2, 3, 4];
> +///
> +/// let result =3D u32::from_bytes(&arr);
> +///
> +/// #[cfg(target_endian =3D "little")]
> +/// match result {
> +///     Some(x) =3D> assert_eq!(*x, 0x4030201),
> +///     None =3D> unreachable!()
> +/// }
> +///
> +/// #[cfg(target_endian =3D "big")]
> +/// match result {
> +///     Some(x) =3D> assert_eq!(*x, 0x1020304),
> +///     None =3D> unreachable!()
> +/// }
> +/// ```
> +///
>  /// # Safety
>  ///
>  /// All bit-patterns must be valid for this type. This type must not hav=
e interior mutability.
> -pub unsafe trait FromBytes {}
> +pub unsafe trait FromBytes {
> +    /// Converts a slice of bytes to a reference to `Self` when possible=
.
> +    fn from_bytes(bytes: &[u8]) -> Option<&Self>;
> +
> +    /// Converts a mutable slice of bytes to a reference to `Self` when =
possible.
> +    fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut Self>
> +    where
> +        Self: AsBytes;
> +}
> =20
>  macro_rules! impl_frombytes {
>      ($($({$($generics:tt)*})? $t:ty, )*) =3D> {
>          // SAFETY: Safety comments written in the macro invocation.
> -        $(unsafe impl$($($generics)*)? FromBytes for $t {})*
> +        $(unsafe impl$($($generics)*)? FromBytes for $t {
> +            fn from_bytes(bytes: &[u8]) -> Option<&$t> {
> +                if bytes.len() =3D=3D core::mem::size_of::<$t>()
> +                    && (bytes.as_ptr() as usize) % core::mem::align_of::=
<$t>() =3D=3D 0
> +                {
> +                    let slice_ptr =3D bytes.as_ptr().cast::<$t>();
> +                    unsafe { Some(&*slice_ptr) }
> +                } else {
> +                    None
> +                }
> +            }
> +
> +            fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut $t>
> +            where
> +            Self: AsBytes,
> +            {
> +                if bytes.len() =3D=3D core::mem::size_of::<$t>()
> +                    && (bytes.as_mut_ptr() as usize) % core::mem::align_=
of::<$t>() =3D=3D 0
> +                {
> +                    let slice_ptr =3D bytes.as_mut_ptr().cast::<$t>();
> +                    unsafe { Some(&mut *slice_ptr) }
> +                } else {
> +                    None
> +                }
> +            }
> +        })*

I asked this in the previous revision [1] but didn't get a reply: why aren'=
t we
defining this as the default implementations for `FromBytes`, since must us=
ers
will want to do exactly this anyway? I tried to do it and it failed because=
 it
only works if `Self` is `Sized`, and we cannot conditionally implement a
default method of a trait.

We can, however, use a proxy trait that provides an implementation of
`FromBytes` for any type that is `Sized`:

    pub unsafe trait FromBytesSized: Sized {}

    unsafe impl<T> FromBytes for T
    where
        T: FromBytesSized,
    {
        fn from_bytes(bytes: &[u8]) -> Option<&Self> {
            if bytes.len() =3D=3D core::mem::size_of::<Self>()
                && (bytes.as_ptr() as usize) % core::mem::align_of::<Self>(=
) =3D=3D 0
            {
                let slice_ptr =3D bytes.as_ptr().cast::<Self>();
                unsafe { Some(&*slice_ptr) }
            } else {
                None
            }
        }

        fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut Self>
        where
            Self: AsBytes,
        {
            if bytes.len() =3D=3D core::mem::size_of::<Self>()
                && (bytes.as_mut_ptr() as usize) % core::mem::align_of::<Se=
lf>() =3D=3D 0
            {
                let slice_ptr =3D bytes.as_mut_ptr().cast::<Self>();
                unsafe { Some(&mut *slice_ptr) }
            } else {
                None
            }
        }
    }

You can then implement `FromBytesSized` for all the types given to
`impl_frombytes!`.

The main benefit over the `impl_frombytes!` macro is that `FromBytesSized` =
is
public, and external users can just implement it on their types without hav=
ing
to provide implementations for `from_bytes` and `from_mut_bytes` which woul=
d in
all likelihood be identical to the ones of `impl_frombytes!` anyway. And if
they need something different, they can always implement `FromBytes` direct=
ly.

For instance, the failing tests in `dma.rs` that I mentioned above can be f=
ixed
by making them implement `FromBytesSized` instead of `FromBytes`.

[1] https://lore.kernel.org/rust-for-linux/D9D876NZCA5O.KFO526Q4HEED@nvidia=
.com/


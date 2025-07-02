Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CAB280A52;
	Wed,  2 Jul 2025 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462710; cv=fail; b=hkKLFzYo9N99qQSpgFFG94N2C9ZuBOjYiTO+GaXiTTL09coGRRiegGNVlUJxXoA92TPj9hM6gt89yX7Y0yvfciDshoRzE2pAw5F2w0mI594TsuOi2xQk7mgqzMXYJN+42AuPEspWuCpKyK4Zrmgd6pOamB5zIww+oq8qqSpz7ZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462710; c=relaxed/simple;
	bh=P+ro6TRoYyyJWYo+GfmFwPoO9439KXXxVbX2roiAYD0=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=WqfPgC3DQrsNFaCgQDhFwZcUwedjhUtoiclNac2QLwgQxe43uAbCPaoqNkBYLqGmWaLss0n41FxmwMSAUGWubV+9C7p54zcGf2juzVUp7bz/3g3Qi25rpCVef38fdtBjtE8Ecd+aAR7flOJzrKxHugOZKOHvkRQWirXENIc8Ebc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AP2uHd87; arc=fail smtp.client-ip=40.107.220.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AP2uHd87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaymG5me34GnWoLQEMIh/gkCwKkvmQS5YqEMiE90bXsaqvksDtaZt+ch+nilgDcnmBSNWfchgq6ANRmuUQDLs0z6krNm2wOQ2lVuOktC++srIW9mgfl2z43gG8u7lURZA3DN7ivoYt4jIsVzmiGfS72M3uUosKZyajkeAI5kJ+1iSo6FgLhqxzMifG+/Iyw4OtuJ20mrvUQY5HCNluHjOF1cfXXUcqdwz2dpXekCyN5RDNZxa9vdnI7+bC3FQTLksKerQaVUt+9zhVehvRm0qS95Ch4QuLz7PUBF5jkl+49lzABjp0HMeCs8VXe092bABSt/yruL4gU+lonUEIH/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN9mb261KOht98XSpYHCAW53lReTTsT17M5rrcL3Mb8=;
 b=w7CiWrL1dDpYhcrfTDOHPZi57hKbRYxzt3XgA/Vql4maH37JVnBAvr1cIxjg4N5RVj+kjucRr9L66aE6LXiYwXC1Boy37Six4DsM90SYcNpQ4VBt9POfnY055l1FCgF6ZpsURakO16bE/Oh0LzQNUyiD4mTkuORNj+vH/7vjFJsE+wgXd4LtU0JaQeUlSWjsjQpW+W7+sKEU0k6oa9D036/Ky203FgIAvUJJhcgLBl/4C2CvANUIzZJ3Aw9v+5N9qVrmYpRD+/5DiwWW3GSb1qxISCCFVb5YuQjHgQGbkWtt5xAvkJO+WfJel3oA5YStH1ybT+zfhzMMr6zK5Ch8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN9mb261KOht98XSpYHCAW53lReTTsT17M5rrcL3Mb8=;
 b=AP2uHd87wFpkyvsetCsNACxXy40aED7/MLHH4idVhPUWhatgHCU4kET1jXBYG+mZjSBhxakHckEeYbgulBQ0W5LiDFm1F5pRL4+O+LLhrN9FMS3noNepHoVpH4hmFISdT8kowVeNSpsz0mED3vlsUk9hsf4/e4gUfrnbmq5XLRNAulh78O0P4rwU7463XvzZcb7wg9kmDBCDv3mHPUPFjdCqEmlHAPXCn/wQ46Vso/NFgPZDGYEYQ/kL9cgcHi22zGYmYsxIq2SQU3CGSHhBwL5ooREfTRufeY58Lu3vElfziP0dCcU56kkJSLP7BgYM+a+I5CIA99oC++xNECGG+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7383.namprd12.prod.outlook.com (2603:10b6:303:219::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Wed, 2 Jul
 2025 13:25:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 13:25:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 22:25:02 +0900
Message-Id: <DB1LPLOF0O0R.YQBJ0HBDUSKA@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Benno Lossin" <lossin@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v7] rust: kernel: add support for bits/genmask macros
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250623-topic-panthor-rs-genmask-v7-1-9f986951e7b5@collabora.com>
In-Reply-To: <20250623-topic-panthor-rs-genmask-v7-1-9f986951e7b5@collabora.com>
X-ClientProxiedBy: TY2PR0101CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::32) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: aea8393f-897d-4b93-ea73-08ddb96bdbb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nmc2bVR1NnBjZTdwZkN3OTNJUVI5VFJvNmhpWGRQOVlNMlpxcFg5c2VaSUlq?=
 =?utf-8?B?Y3JJNHh2NnpsYkpSWTdWRkxXaTBkak12NEZIeWFaL3pVOUltSW9CT1Y5bW1s?=
 =?utf-8?B?RVNUNkdCVW1qd2twL05WbmQvelhsdnJZRG5nR296cFVWTmtwSUpucGlxZnB1?=
 =?utf-8?B?RmhJZnd1N1AyZFIzYlFRaytSRFdzREVVK0hwbTljcWVIVlhZZldyb1lsNE1o?=
 =?utf-8?B?NkhSVW9VN3NHS3prTS8wYTJMSzE5WStEUEpNd2NmRXVjcjF6SG5ybWNnMXlx?=
 =?utf-8?B?OXN0MEIyVVhiUUlneDlHTkpuaWNuSi9YNitlait6UThEcWxsdFZHcnVRR1dV?=
 =?utf-8?B?MGhDa1BoVHgrUzFXR0FQUzZJSXFqQ1h3bkJwQ1lwVjZKVUtVYzFNeVBSSGdu?=
 =?utf-8?B?SUczNzB1SFQ5OHdJR0Jra3NWUkZIQ0ZIc1dWU2N2U3RQcjVYa0liaXAzdFJl?=
 =?utf-8?B?bU1qSFdhQ0xXeWMzSkREYkNtcHArM0VBU2xKUlUvaVgvTzJKSmE1US9GdVIz?=
 =?utf-8?B?QzZGZFJSZXliMk12NHBDRUFSZFdRY25EY2dpc2M0ZDE4TGtoOUVkbzBVd3I2?=
 =?utf-8?B?NnpaTnFJQXM1MkNvcWQ4Skw0Z3laT3RaYXkvdHUxUnZiQjFyeHJNcm5zMFJF?=
 =?utf-8?B?NkdSREJGeVdlVm4zV09mVGtYeWw2c2tKYWY0WTh2MFhPVGlIci9ka2g1WERI?=
 =?utf-8?B?TXRiZ3NYY3p6OG9iQjFoMkVHUWRTWTlZMHV1cTVJS1hDVFo4ekdHNTZLLysr?=
 =?utf-8?B?RC8rZXBMVHZMNlNaTmg2ZDBaYXdlbXVvWDZiNVdwUk9VNGhHSmJRS1RSZmw4?=
 =?utf-8?B?N3lXanp6clZPWm5MOFBCN3MwUzFGQWs3ajNWaXp0MW91aFYrczBqM2Z4Sm9k?=
 =?utf-8?B?MXB4bWlqak1kSFozcnE0dzRjSlRmZ3ZFNTNtbTVBb1hvUWl2UEhjcWNaVWdE?=
 =?utf-8?B?VHdlZ3BtL0pIZUtmd2dCSGxYazVUQWRqcjBXL3BmckJTYi9rdkxqcjNNRFRi?=
 =?utf-8?B?UkRMaTQybG9qUGdjakttL05PcWN0NGVDMk42ZTY4TU9nK2pPVVpROXpqUnRB?=
 =?utf-8?B?TUJkNmR0UTgxdGpxdi9oVmI3b2ZzRlJaek1hZkw1SE5FR3c3cnNPVDFMYTBX?=
 =?utf-8?B?TjFjMTdwaHBJZEE0aXhVVDlONzlMMmtNN1cwS05JRDRuT1RFeTRwd1ROSEVv?=
 =?utf-8?B?Q3Q3M3VxTmRhVDZSMnIzQTY1bnVzKzBUY3ZOZDA2S08vTHVoelczOGVQdkdP?=
 =?utf-8?B?em1YRU8vbEk4NFZXejFDUTBXRm5VSWV1MDdZZ0pqYkhvMDNvOHRnbkZKTkJB?=
 =?utf-8?B?dXF5cHIwOU1MSGVBVFJwVkdwSDAxK01RcGVKZlBCUmJvKzJ3VzNWS2pLTWlD?=
 =?utf-8?B?eEZ0dnZHeFBROEJJM3ovR29Cc1RDeTduTXpMZkE5N2V0V2tQRFZVM0RlUDA3?=
 =?utf-8?B?NnBCNmNwYnR5RlJ3UXZFZXI4TkFTOWl5ekZxbUFXZjU0SGhYU0FmM1BDMlRj?=
 =?utf-8?B?bkpYNzFVMG9NeXljRjQrdFlpVjlRbnozU1ByL2lQUjU2eXdVQ1RVRGJxMHpm?=
 =?utf-8?B?NE5hcTQ3eFVnMytaUXZTQnB4RmtIUUxMbldGd0wvcDVRRjk1WHo3dE9FclFq?=
 =?utf-8?B?K2lZTXJWN1Z4TW1BR2RlR2FITjJBb0RxVndGYk9uOWJLQzFDeFpKZTVISWpX?=
 =?utf-8?B?OEcydXY1UDU1NVRUaThtQXdVVWdsRXNpUU9rYW14Q1QxQUtzTFp6Sks1bGtt?=
 =?utf-8?B?SVVXaXFYMWFIZFBpNTFoeG9hMmFIaG9YdnZvc2pOTWxDTWpBbUNGd21UWXhW?=
 =?utf-8?B?RGxpQlBYMGl2aFE5RjdJZDF1bmFhVE1KcExvV1BLK2F4R1Q5SGxKOVlYS0pT?=
 =?utf-8?B?eXNRVWtCbFd4SUthTnVQcWxlVW1DWVJBb0RaQ0pmNm1Qa1RlZkNoREpJYzE5?=
 =?utf-8?B?M21rSmFGd3liaktxamRyZlp3clk2WGwzeGV4eU53S2ppYnVWTysxK3YwbDVz?=
 =?utf-8?B?d3hUazZTK3FBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTYzWDhmK3N6dis5LzVuc2ZzSmp1NE4wbUhNOFA0aCtvamduMDR1WEE2UzhE?=
 =?utf-8?B?WE52VjdOZEdjQk9xVDRjcEoybHk0ZXNKQ2NzNFFzMzdoM3dwVitxWVMxK09Y?=
 =?utf-8?B?YnZQeU51VTcyeEQ5cDUwS1FHRG92KytrcDMycU5Zb3hmZFpuMXQ4YndBbWJ3?=
 =?utf-8?B?SWZFOXNSRDJkRDRyVDhZT0RJTzFDMkFUcHBWOFBlVUhCN0trN3kySDI4Zitp?=
 =?utf-8?B?VnpDbG5vSlp4U296c3pjU2JwY1NLdzhEZTR5L1JDRXVUZnBYMm9MRkJseGdM?=
 =?utf-8?B?MFZnVEduOGg2YVB5cWRNNHVoUlYwOE9IM3hGcVJQMENXRXU3MXcvRGhIZ1Nt?=
 =?utf-8?B?RitORXlDZExCMkg3MGpNUWdrQlpEUGtFTGF4VkNybE0wbkZhWllEZWxrODRk?=
 =?utf-8?B?UDVpT0xLTzUzNVRubmFsbjBiL2NpdUVaVnZ5L1R1WDhCbklMTzNkTkZUZEtL?=
 =?utf-8?B?empHN3Nsa2JCNGxINUt0c1dNOEhjVC8zME1BN0UwOSszWDZqQSsvQ3FQSVZh?=
 =?utf-8?B?UHhuMUNqZkVMaHlFdTZMUThNc3hSM2xKbFFibkpFWjVSWE5scENOcUQvQWYy?=
 =?utf-8?B?WlhDWjMzQUsrMVhtNUJrTUNSbzROM3lIU0N4RVA4NXV4dzNodTdmSkQ1RTZB?=
 =?utf-8?B?Y3BTc3hyK2kyRU9lUmxaVlpPampjMTI2eEVOZzVCejQwTHVkWGZvQ2w2QlRz?=
 =?utf-8?B?dVZaR1dSZjdxRnFqV1plVlRZV003YWRvYTlzcWhoR3grY1dvc25ZUVoyWG85?=
 =?utf-8?B?d3lYeXMxcDNaMDJOeUVZalZXSWNzOUVEaDhRVXVwcGVQZ3o3RWdrTTg1WVJz?=
 =?utf-8?B?R2t3OCtZbFhWZzNkNDRSeXZielRqUGVyQlR5VWxtdXRFZnBqNXpoT3c1RmJI?=
 =?utf-8?B?Y1JXSk1idlp4bHV4VThGOUdoeEljOW96OUhVdk5MRVJ6YW5mRWdsbDNmSFhV?=
 =?utf-8?B?MzhMWEpXZTVJTU9rQ3BhT1c5OVc4WTZkNi9VVDVnRDNIVjJjWHBjelJPbkhP?=
 =?utf-8?B?WXhqMDJ4SkxQUDRKQVB3UmRwdFcyelNIT3E5QkViMmhpUU5IZzNwKytxVmJG?=
 =?utf-8?B?dVJvaWVZT1VUWjdUeFJMcE8ybGlwM2ZEYlNmbGlwampVYk9LVHhMaVZDamJm?=
 =?utf-8?B?QTVNQUZYUVdvMnh6TnBpVU9UYlNaLzlyN200dWtBNlJqOFRLMlRHMWlkdjF1?=
 =?utf-8?B?bGQzV0RLMHJrSlNCa3dOZkNYRjY2eUhGc24yVEt4MWtNSEMvbDk1Q3FnUnZN?=
 =?utf-8?B?aGhKWXBZTEZsNVFmVXFGUXkrMjRRT1MvNEdhTG9OdzJ0dEVGOGU4S2NqK3d2?=
 =?utf-8?B?L2FWR3MzQkNCWDhCcnN2R1hLZkU2alpQa2IyUGNXcEVTZzdNSlp1VU5FQmkv?=
 =?utf-8?B?alk3Rjl5MUFVNU9pU2IxNTkyRXZEbGFtWmVYRGdNdjlLaTNUUE9VSk5LOVlm?=
 =?utf-8?B?czJvYmJVZWRnUEFIcURxQmJmR3U5cmZVS3AvU25RUGpjdVZZbFNuV25iZTlL?=
 =?utf-8?B?UEZhZHgzT0dQc2UzY291L2RpT0lqUnBsMjR3TUY5K2ZYSHNuS0xwUUppcU1J?=
 =?utf-8?B?bkhxdVZ2VXkxWUtnSjBMMWluZTFVVkRmQmI1OVk5WGRNaGk3dmIyZktiZFI4?=
 =?utf-8?B?LzlndWhNL1gyOWFrT29vZnBPSmxlOWRMc291aG0wc1dxNGNTeXdRTkoyMVJ5?=
 =?utf-8?B?cGJZNzI5MnJ2NjJucjNZMHF4QzVHTXRETHdiOVdSa3JWNUpmdlN5ZE1vVmRr?=
 =?utf-8?B?QnpWWVdRQTZldk5pMnlFMGprMXllWFl4QVVJR1VUaEVRcFNXZ093RUxocWZK?=
 =?utf-8?B?MGs2R1hwOWhKaDc5Vm8yUDFtMHhxd1pQdHJyaWFOeksyN1l1c3VlMVJ2RE5n?=
 =?utf-8?B?U0xXOEdmd3AzSCt0QUhkeTNETG5ramhzS1NPL25ZekFVTjVPZ0tDcHpmUzlE?=
 =?utf-8?B?UVpDSDAzNU8wSE9YVHQ3NDRxdGdMZUpqdVZiRmdkVjNhd2xSSlQyQzJHWERY?=
 =?utf-8?B?dXhDRXBxalBaZldnVjliMllpTlQ1YlFPNk8vaWNSc1d2clB4MXJDOXZTSEdP?=
 =?utf-8?B?Z1dmV3UwbFRUOXplU1ZMRUJXUlgya2hRai96dlBqa1k1T0N6K1I4YndhUGVl?=
 =?utf-8?B?K0RlMENKVHdUZ1B6RTYvL2RPNmZuSUlkYTFvZkFwUjU1WkhnRjFHZ3RaaGVa?=
 =?utf-8?Q?ymNS4Q3L3g2p3U/bEjsAjxaPkg1xiHyERouOa7qzlAwA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea8393f-897d-4b93-ea73-08ddb96bdbb3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:25:05.7062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esGneI/3a8NoJFx2mxedCLFk+9K0yb9virl240GW/yB4XArh17mWV1KS7At5vStEOjvIgDHzkAb8UuyV6lmU1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7383

Hi Daniel,

On Tue Jun 24, 2025 at 5:17 AM JST, Daniel Almeida wrote:
> In light of bindgen being unable to generate bindings for macros, and
> owing to the widespread use of these macros in drivers, manually define
> the bit and genmask C macros in Rust.
>
> The *_checked version of the functions provide runtime checking while
> the const version performs compile-time assertions on the arguments via
> the build_assert!() macro.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Overall this looks great ; I especially like how succint this has
become. I think I found a couple of last remaining issues, please check
below.

<snip>
> diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..8db122b5db9565b76c14fc33e=
33058f9dac7bd75
> --- /dev/null
> +++ b/rust/kernel/bits.rs
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Bit manipulation macros.
> +//!
> +//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
> +
> +use crate::prelude::*;
> +use core::ops::RangeInclusive;
> +use macros::paste;
> +
> +macro_rules! impl_bit_fn {
> +    (
> +        $ty:ty
> +    ) =3D> {
> +        paste! {
> +            /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is s=
maller than
> +            /// the maximum number of bits supported by the type.
> +            ///
> +            /// Returns [`None`] otherwise.
> +            #[inline]
> +            pub fn [<checked_bit_ $ty>](n: u32) -> Option<$ty> {
> +                (1 as $ty).checked_shl(n)
> +            }
> +
> +            /// Computes `1 << n` by performing a compile-time assertion=
 that `n` is
> +            /// in bounds.
> +            ///
> +            /// This version is the default and should be used if `n` is=
 known at
> +            /// compile time.
> +            #[inline]
> +            pub const fn [<bit_ $ty>](n: u32) -> $ty {
> +                build_assert!(n < <$ty>::BITS);
> +                (1 as $ty) << n
> +            }
> +        }
> +    };
> +}
> +
> +impl_bit_fn!(u64);
> +impl_bit_fn!(u32);
> +impl_bit_fn!(u16);
> +impl_bit_fn!(u8);
> +
> +macro_rules! impl_genmask_fn {
> +    (
> +        $ty:ty,
> +        $(#[$genmask_ex:meta])*
> +    ) =3D> {
> +        paste! {
> +            /// Creates a compile-time contiguous bitmask for the given =
range by

This is the checked version, so IIUC the bitmask is not created at
compile-time?

> +            /// validating the range at runtime.
> +            ///
> +            /// Returns [`None`] if the range is invalid, i.e.: if the s=
tart is
> +            /// greater than or equal to the end.

"... or is out of the representable range for $ty."

> +            #[inline]

Can we give examples for this function as well?

> +            pub fn [<genmask_checked_ $ty>](range: RangeInclusive<u32>) =
-> Option<$ty> {
> +                let start =3D *range.start();
> +                let end =3D *range.end();
> +
> +                if start >=3D end || end >=3D <$ty>::BITS {

The range is inclusive, so something like `0..=3D0` is valid (and returns
a mask of `0x1`). I think we want `start > end`?

Also, since you are using `checked_bit_*` below, I think the `end >=3D
<$ty>::BITS` check is redundant.

> +                    return None;
> +                }
> +
> +                let high =3D [<checked_bit_ $ty>](end)?;
> +                let low =3D [<checked_bit_ $ty>](start)?;
> +                Some((high | (high - 1)) & !(low - 1))
> +            }
> +
> +            /// Creates a compile-time contiguous bitmask for the given =
range by
> +            /// performing a compile-time assertion that the range is va=
lid.
> +            ///
> +            /// This version is the default and should be used if the ra=
nge is known
> +            /// at compile time.
> +            $(#[$genmask_ex])*
> +            #[inline]
> +            pub const fn [<genmask_ $ty>](range: RangeInclusive<u32>) ->=
 $ty {
> +                let start =3D *range.start();
> +                let end =3D *range.end();
> +
> +                build_assert!(start < end);

`start <=3D end`

> +                build_assert!(end < <$ty>::BITS);

Here also this check looks redundant, since `bit_*` will fail if the
shift doesn't fit into $ty.

> +
> +                let high =3D [<bit_ $ty>](end);
> +                let low =3D [<bit_ $ty>](start);
> +                (high | (high - 1)) & !(low - 1)
> +            }
> +        }
> +    };
> +}
> +
> +impl_genmask_fn!(
> +    u64,
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::bits::genmask_u64;
> +    /// let mask =3D genmask_u64(21..=3D39);
> +    /// assert_eq!(mask, 0x000000ffffe00000);

I think we should also have 2 examples that show the behavior at the
limits (i.e. `0..=3D0` and `0..=3D63` here ; possibly others if you can see
interesting cases.). They are useful to understand how the function
actually works, and would also have caught the errors I pointed out
above.


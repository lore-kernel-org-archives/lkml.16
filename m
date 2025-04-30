Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4984685;
	Wed, 30 Apr 2025 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971462; cv=fail; b=cyVU1ohb6E0XzHNfUITjIEQXjf3G9UOlyU1OebEOEX9RN00ZZxPcweRtpmw0CkrPBQmqgSIXbLs8GLhOA4x4Rjs88kVVVHBRpx3b0nko3GCr7XJh+8EMUjmqVhNAL5swzEmN8rid+6Z7wlhHFloh5af9ax6cj7kHiA8bQ1+4PfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971462; c=relaxed/simple;
	bh=3xJ9PRZa8zdeakmve1ksU3xmjhfmdPkHYUZV86h3erA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jYIQ018q5qibPMg4QoDnkEmh7TPl4//Yppml6z1wMLk3gNUBFcAxvVnXeqwSCFaVin2maNRGfNQJMWkmEAn+btnT3aNskVjlfFxar13I0I7TuzGZBrEXE6V+coIQH4feptC/Lg4lN/5e73jxmAAvHDOETE3wlQgCaZyba4yDtXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YWYXMBj1; arc=fail smtp.client-ip=40.107.244.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YWYXMBj1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etSc8BOKMSEADlmHYryfANfcfdY+w0KQjcg9ZlCRLJO7l2RbUXzn2BG3Xadkbl5iooEmp/99l4mhKT+cULoY53bLkWJfyKp/v/MKKOVG6pfKPnlkZxEKk+GBneJz7aSLZGNpkB0Kqys67/UZWA+Kf9kuaYTeTyzBgmQkWiQHLu8Mfwy3drOdbhgaPDhcYdQ72Ecg9Mv9YAnQwjrs5K5KwpxHKbiMe7lcN8YnIIZddh+oSPJQw4z+tQTTkKXdb+2UPwyYTGHMO30gJygfdDp7K3LXkqJk1PljV1tCdeOyJ21th1Bk+DtGlECP3pm6ZUcXEgW7F1cUvT26U2/KybOSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8FoSFk1/1kNNTpCQ9Sk5uV7X6+MEHdL+C4G9QT75x4=;
 b=wMSddalRsGg+04vH2psUejSccSSt0AD2c/Az4U9a0lHAerH8sxYXEl7h8bgwF6Rses2VjY41T+5TbimTLZ5E/OrKjkqjpfZKBMcYMBZWBfgSJadF9vF7/Ldhtzx7p2Ii6Qho40/2jSONIzfw9KxwkVN/RbbKrwawsQPxTX6kZnVsnxl1g03LyDQBXnTpbUgGGc1DYL9OL+TBwCceKoL4FEj+aw1fa0uHKUg+h4lP//BlrTDESjqOWokudomXfVkt6tnvuK2u2ef+M8RqXF8RrYqljZ/BhL2c38lc6HBV4D2H2xIBqjNbGXg1RTwAOWnuNqnn1GvXa1PDzMCKm0zt1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8FoSFk1/1kNNTpCQ9Sk5uV7X6+MEHdL+C4G9QT75x4=;
 b=YWYXMBj1BNQd5Ot1vzFivYl60VCnp0eLtPc7ewHXFbJJdDK0zFcT7qtcvhObXiQCYd8XLo9mU3U2aKXTBdW6cjZYqu33nyHgQhydhSNpLwzudMxbvm9SRfnlbChr0kRjmaYQkyGb4Xa6Lp7bbvLwFLfCGGFR4/Fy4DRIcWFddiM3ATouv56yCgxtoMH4MlZiCDk4tlQy7GazFak1IvcS709QF5YYRghFTh4K4CZ7Osmj24f0yNFVMKC9yU1CKHrcGGN6TPWSYUmemp5bgNdMRr/CEZZZsqrKKd0YFlCmp1VRV0h9OPW0tg6Wrc+O5eQJ74A/6iPZZjApP6cQAJ3KxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 00:04:17 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 00:04:17 +0000
Message-ID: <92254c83-1075-4de1-bed7-38c99ada6ea2@nvidia.com>
Date: Tue, 29 Apr 2025 17:04:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] rust: DebugFS Bindings
To: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|MW3PR12MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df3bd7e-c3ec-49b4-7734-08dd877a8c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmtETFpzaXRIckl0VTFkTG1aeXdCeDRNMlZiOU1Yazc4dXJUUzZZUlZneHlp?=
 =?utf-8?B?dVluaVBRQll4eDB3dWNtVzhKa3FUa0FIY2ZSc0w0RXc5bGExT1A5NXBrQUFJ?=
 =?utf-8?B?b0hHN2hDOHpNUzJCOXhETHdhVW91MS9PZ0d6bTNHUnlrUVplK3BuckQxMlo1?=
 =?utf-8?B?ZEJJUG9EbU16NlI2VWdxSmQ4TUdTN0hwZDdOUUhvN3BzaGx1aWU0YzRIR2lo?=
 =?utf-8?B?bkxrelBIVmtZYnZaQkp0UGdoVnlpcC8vMGM4MFRwZ3ZtNGl1a2orLytxWTZw?=
 =?utf-8?B?SUcrZjNqblhNNjlHcFlnY1R5TzFBSEZQWFlITDA3YStVY2VVU2VzZkNQSVRQ?=
 =?utf-8?B?RmFxbFZLSmZhdTVyZ1labkZ1aUNWLzFqVGVFc081dkE1THpaQzkxTFpxQThB?=
 =?utf-8?B?dE9adU1aNyttdFdEL081a2pBYVdZWFUwYzJDQnZETWVrSDIyV0VFSUZLSlBa?=
 =?utf-8?B?dURONGwyOFJPT0hsVHFWbE1GaWNvQi90dlBlR0dIVEUvWXBkanBSSXF1YVF1?=
 =?utf-8?B?b09kcmJpL0U4dmM1MDhPeElzTTRKUWUrNDV3UmE4eU5TT2paQ21mdEl0UmRF?=
 =?utf-8?B?R2hzeGNQb0k5ZmI4NWJGQnRHZmtMNS9MNUNvWUhlWHYxSWswSFNucmREVHox?=
 =?utf-8?B?ekNKUnVNMkxwTUtCQmdlWEd2SkF4aHEveTRINENsT2VhcDVUZGJkMTZ2MWMv?=
 =?utf-8?B?R1c0SUE3TkZvUVA2RkFUajEvMkhSbGttbUFLblNVRW14RzM0SmVRaFluUHBC?=
 =?utf-8?B?Qk1scDB1NlRldW1wbFo5cU1xTWxNSys2Zk5iSDhqU1lEYnUzb1IwaGJjaVhh?=
 =?utf-8?B?cytqM29TMUVmb1A5bGc2RlczUzgrNkg0c2I4TGZQbEtCMEhqOFVGQ0pFSk5V?=
 =?utf-8?B?d21ZYlMzbHBTaVFWWmdSNnRmbWNCcjhrM2xlWUdlYW0wQnppWHRHQ0dQWElE?=
 =?utf-8?B?QXV4NktxejI0aS9NdGlad1BQRktmelg0MmVKK25XTUZseER3Ym93MjBndlZa?=
 =?utf-8?B?ZnZmckhJTFVwVnhZbXhoUGVEMGFYUEYreVNlUG5Rc1FiMkl4V3FtN0ljQ1Jm?=
 =?utf-8?B?ZW5wdDhOYk1lZGVpSHR6eEE4MFd1U25ITHRWRWRrYzR6TU5xMXBnQnpTcm5C?=
 =?utf-8?B?alJWOWxNL3N2b0hHVmt0cEZkZzI1U2NxdW1JYU5STTFIRm04T0Jvblcza0w1?=
 =?utf-8?B?Y3JnTkFtZlBvUms3OVllSjNUbUYzV1VXSDExeGg0SUJxcnZyeDNibTl5aUFR?=
 =?utf-8?B?eFpBOWlqa1lFaEdCQmYzZ1o3YWUxcnRrZEFYWU54QXVsVzVnV015YlcyakFC?=
 =?utf-8?B?OGx6QW1wSktjSTRjWGpmblF0QnBmT0U4aFZLV2pmVE4rMmZmcE5sbUd6OTVr?=
 =?utf-8?B?ZDB4RlYzZVl4NFUrbGdUK093MERMYVl3UUpUSmZ2b1JueU1zUm51bjhhYWZX?=
 =?utf-8?B?QmZhN2xRRmYyMHJCZUQweVNZRko3MDVlT1NzQ2Yzb096Z085YXJpU2pxcTFD?=
 =?utf-8?B?ZnNJZjFxQ3FITEg2RGhGUFR2bnJrSytLMkFXMURvOGIyYXhzaHhGSTVTeDZP?=
 =?utf-8?B?QTBjbTFzaTBkOEpwVTZMMkRMdG5PS293S1V1SXdZM2hhVWdBTWF1dTVDNXJP?=
 =?utf-8?B?eHgxQUJmQ3h3cExoc3JTVGFrQ2tReWhHUmFUWXlOUmVVd1N4YjlkT25VdlM5?=
 =?utf-8?B?WXp2YkJmMFI4SndPcURSaU5pdWdDVUJwQ3hjSGF3L0dtd1pXbUFhZjA2Y25a?=
 =?utf-8?B?NG9ZQXREUmsvZTU2akdHUko2a2IyRGF0K1hSc2FDS3NLYmFDY3NSdTUvSU1T?=
 =?utf-8?B?c2NhTVlpYjhnR0Z3Ri9KaHA5anFlNFlnY1ZIL0VRL2w4a3FuV0RFWW1nZmhi?=
 =?utf-8?B?Yy9KZUJKRlFQSG5yK3h6MkxRT2JsOE8wUHNSNHgxOHZzMTE1WUltRExYb09k?=
 =?utf-8?B?bGFocjZOYmthdEhVTnhTellrK3BQRE9yZkZDNzBUTCtEZk9lblJZV3ZJc1Qy?=
 =?utf-8?B?dHFOYzlxLzl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFdHT2dHcXI0d1cxb3k4VHFzUUxTWWtlK2JhQTZIcVd5UkVmNjY2ems4ZjFC?=
 =?utf-8?B?VE9NTW1xc0FEV1JwRm13VVJXT1JNb3FSWUwxQy9zT3VtaEZQR1ZhcFZFUVBH?=
 =?utf-8?B?ZDBmWkw0NWE3S3lFSDlrZ2dPZ1huck9CNGNQUHJzVm1QTE1KODJxQVVZZEpo?=
 =?utf-8?B?NEdvVVVwTlRwQ29ISHBIVUlVQVF1SElLVzRXeDZOYmZkUFhmTHRYMVdnS0tN?=
 =?utf-8?B?aDVEb2NjZjkvSElFVE5ZU3pyNjlGVjV1dkkvaTl3MjZOMkJ3clZuNjJMckRE?=
 =?utf-8?B?S1Q0Vm8rR0FoTDlmS1BzNHZmSkhhZmYwcllmZXdZejhudTlxUUgrbUNJekt1?=
 =?utf-8?B?c1ZCOElnTXN4RjdTUlZJTzJnM2lSL0cwQkJFeVAwWkJpWVlkMi9ZTHpyMkZV?=
 =?utf-8?B?WXcyRHoycFlyQlVsTCtSd25QcTJ6SUVPY1prUTRKeHAwYlRkMlZyMWZhZDZB?=
 =?utf-8?B?dU02UFFMRldhbThGTEFZNzhkNWVTMWl6clZ5ZUt3Uk1YVnJJdVBKUmRjU3lL?=
 =?utf-8?B?THV1WkVCQnRnTmFFT3pVbTRmZVAzZ0Y4aGY1RHNxVEhNYWJVekZQaTdlR2Zw?=
 =?utf-8?B?QmFwQVhNYnZxdWxEam82MWovUzYreXNZcXdhVzhyNG9ZaExWZndIV2drTHVZ?=
 =?utf-8?B?bUtseDFvSWcrUmJLeUxSSkhCc1NQQ1FQQkM3YU9yWHlQT3FJMGl1RFR6TGJ3?=
 =?utf-8?B?Uk9oRDBYRldOUEk4Q2tlajF4YXZBNklyeFJmUkRmYWJtaDIwa08zYTlNUzUx?=
 =?utf-8?B?RWJkQmhEUjQwNW5lNTlaZ29va1NobjMySU54WUdXVXN2WlVZb1FTVkhFT0Zt?=
 =?utf-8?B?MXp2OU1tUFYvMXExMTVvdFpDM1BZc0x0Ym04UDQ4ZmpjZnd5VVlUbDBHZHRL?=
 =?utf-8?B?RzVtWjdOTk50bTh3V3RPUndPdWppK3pVdGYzc0c4MkJDZmoxRWY5Yy9XbFdW?=
 =?utf-8?B?WE5TSEl6Z28rMkRadHhrdDA0SWtFSUdOZVptSTV4L2dXTVkxV2Y2SFdrRkVM?=
 =?utf-8?B?cU16bHRHQkR0R0lmOENqUVRxclpEa01MRGdicFBoRHdvVGVqWEw4T1dkWnlT?=
 =?utf-8?B?NUFxZ3V4eXdMM3NxZWtUby9oakJobjIrdWg4NFlYQnpYWlB6YWlFbEN4VmtQ?=
 =?utf-8?B?anpwNG4yNUJheU1jd0V0cnlxTWtVRHp2OFg3eEFWRXVHdkFoWk5qeThBazY1?=
 =?utf-8?B?WHlTaVg3UlBFb2NnRUs2NElGM1dqNSt1a3BCOWtNdVZrRXhwRTZyb244eHFk?=
 =?utf-8?B?MHM0R3VFYTMrQnNqWEZJbEsrQzdXZTkzQ0xkYjVrNGF0ZUxmVGoxUEIxSGN6?=
 =?utf-8?B?QkEzZ3RlL0tKNXZUNjNyVWNPNTJ3TUhKN2VEdkhhQlhMMXQzMERoNTJnZW5q?=
 =?utf-8?B?MGFYNDcwNXllcXgvOXhVOFVLNm84OWRuT3MxaDd6UnF0R1RQdlllTUhSWnNn?=
 =?utf-8?B?TWludFdnbUJ0TEU2RkJEcmYzZG5PZ2tlazlVc3Q0VzlDUDFvRy9ZdHF4MkZh?=
 =?utf-8?B?aHI4UVE1SDZTbE96THBSL0dsSkJURC9CcFBZa3U1czIrUUxybjAyOTJUTzhp?=
 =?utf-8?B?Y0IyQzRuUk1VcGhNVGlVZE9nMDNQbFl3bHkzYU9vdHRka2h2Q0QreGtRS01O?=
 =?utf-8?B?MXVlZjUraUVqMWh3SlNmR1o2T2ZDd25CWnlIYXJLWm5qR1Y2YkhxRVVmYjJa?=
 =?utf-8?B?RjU4VHBIOGpUTWxtOHpNUVdxWllrRDdhWkVGalRZRS9jU004cjdFRUYvNHB4?=
 =?utf-8?B?VXowWWFlZE9nZTUyNjJTM3kwQ2p0VGV4UGlDdU40akNNU294c1ZCTkk3bFlC?=
 =?utf-8?B?NVFoRXE3ckF1a3Azb3lpVmpIaUNDRm5hV291UVROOWpkaHlSRWNzNEoweUdh?=
 =?utf-8?B?ZGJ2cjJSUzdxTkRvb3ZvRkFaTXVQRngyWWMrRWh4azRRQmtGbGVvL1JDbjh5?=
 =?utf-8?B?SkN5dmJ2d25xdFJYU1B2c2YxZ2V0djNwUG0rZFZNbC9Gc25UMGR4cGlkc3hE?=
 =?utf-8?B?UXhydkM4aXRXYWdzODhPY1lUUGRwUGpSZ1djL2lyRUJKSUE3cTd0QXNYQmNm?=
 =?utf-8?B?cmVGbHN0TXcvL0x1Nk83clBOZWhSUmZReVNSS1pyMmVIeVp6dEhPSzdMVTMz?=
 =?utf-8?Q?DK1/P5ALM7QfdXMlaZI0MHGlA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df3bd7e-c3ec-49b4-7734-08dd877a8c95
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 00:04:17.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSHtA0xcCN9K7+UNuZenaFP3YhCzVtKxvD13GJI1lS6p21cLAw1KrC9R+37eA/fihl9mt358Nc12fllzo4uMtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377

On 4/29/25 4:15 PM, Matthew Maurer wrote:
> This series provides safe DebugFS bindings for Rust, with a sample
> driver using them.

Adding Timur Tabi, because he was looking into how to do this.


thanks,
John Hubbard

> 
> The primary intended way to use these bindings is to attach a data
> object to a DebugFS directory handle, and use the contents of that
> attached object to serve what's inside the directory. Through a
> combination of pinning and equivariance, we can ensure that the pointers
> in the attached object will remain valid until after the DebugFS
> directory is made inaccessible.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> Matthew Maurer (8):
>        rust: debugfs: Bind DebugFS directory creation
>        rust: debugfs: Bind file creation for long-lived Display
>        rust: debugfs: Add scoped builder interface
>        rust: debugfs: Allow subdir creation in builder interface
>        rust: debugfs: Support format hooks
>        rust: debugfs: Implement display_file in terms of fmt_file
>        rust: debugfs: Helper macro for common case implementations
>        rust: samples: Add debugfs sample
> 
>   MAINTAINERS                     |   2 +
>   rust/bindings/bindings_helper.h |   1 +
>   rust/helpers/dcache.c           |  12 +
>   rust/helpers/helpers.c          |   1 +
>   rust/kernel/debugfs.rs          | 514 ++++++++++++++++++++++++++++++++++++++++
>   rust/kernel/lib.rs              |   1 +
>   samples/rust/Kconfig            |  11 +
>   samples/rust/Makefile           |   1 +
>   samples/rust/rust_debugfs.rs    | 120 ++++++++++
>   9 files changed, 663 insertions(+)
> ---
> base-commit: b6a7783d306baf3150ac54cd5124f6e85dd375b0
> change-id: 20250428-debugfs-rust-3cd5c97eb7d1
> 
> Best regards,




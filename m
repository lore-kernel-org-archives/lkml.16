Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F5E1A5BA0;
	Mon, 16 Jun 2025 03:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044897; cv=fail; b=YAljsEQqDiJwyEb2IRXTykl01+/v7Visol6n5YSPjtjJ2StoQ+ITbCg1KGW0ELlEC/p7PQZGM065bsR32TfLSFkHVEJmLHL2tmgJqsSQWBanqsd0R/9F2ttWaiBlwChGq9Cj1V8RgczXMtr6Wcx2ewcduJ2NEkvgJwe/r4rdrcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044897; c=relaxed/simple;
	bh=U1c3QsKWqTzaddcmjThfMUbVYmGW5bWrwbhzQAtbaKk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u2jSebVfFloQ4oQld8LATXM/ltANKeB7UwIR2Nw+P8Ql9neXIssWH5n9HtHLc0Adv6CYgdWn/2RLbBBrEy6ivAsMBSwFwylzNxxN/tJRn+cB6ztvpNZOcuvw52xqqe1U5wo5SX0L8BRz/SbH8ikLwzg74xdgyZl9KIYyJbJplxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cVzPvn5k; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cVzPvn5k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaOOBOBl0COgttMxf4x9vtyK2Iu9s+rCKZXkF77cv6GAHysg5vSx5l0eBdRU+A5Bmxi/Xjq7TSA0R+JX6vhUttEW5VyIiAyXpxBG3JqDymuNgjo/5Vz35eZoVxuXBAKBstRPnwi9jwVKEdmPIkRxJ8kJ3cudLpWZYkXOuKFrZmDSlfrpHSuCp4OkvP5tJ1ol3sXhJYmDYM9YEK3PhJEdNY9AlA1RxGnIqxrVkUba8XQzaBwY0crkJXvapNOVwDhVaUnhbeWlQKBRWJzyHyL4wAfGCpXADCze0lt4dRFljLmBeOgxzPlwy37qENwfexHbms4o6CcbVbZ+dQM9vj2v4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ifdDfCMD6wdSX1Kc+7ULZPbVdnOs9E8/H4d/l4FI/k=;
 b=CqI2c5k7D0nPb77OtLx3a6tEsu4GcWpGtxO5Gvi8IX4z64Six5+TWomaDk4tv/5l1OilG+dvCkJZzTtZ7otVu2qkm2VsnHywaHyY8r13DzKjPUqza+2zYrMNQeFn5NvFv9/3fVVSRul/7e07oPCFHMkx7cFV26xsSwdDvZhy6qeUSVX7x5m0IgXuhRu8uBdCBhU+3caZALbgLpF7GPlOTuLg1u1YidrqwWxT0gQJKYPvyXN060MwDLzIM+K2uZ5xSghdwn0ueB/0H2I92Z1Y8H6nmq/7JAP8wqzYGZCVxfFxyQO5H7aKogPwH3hNWPdlOy0IZAHdxVtkiIuq20AULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ifdDfCMD6wdSX1Kc+7ULZPbVdnOs9E8/H4d/l4FI/k=;
 b=cVzPvn5kj7+Mhh80r2+fxyY3zSkoV3dIbvJinnKnWUyNev+ZXQj1CJUY8b+m2N7/DT0MwF43UblkhJpbM8LVP9xSaIcYdxvVJUKZ8bi8QJvPLcBK96nrO9rxJduagtw+ToOgklmHFD3RwufoYi9USATNDueJYRNmFuB3Ck7/RuhNyBBIwwBq2iTNyBt08alH+Dcm8swbITZvFzQmIh8BcRBtQMIKnPSq2YrwX5cT0PrjBrKuJmfO53dUspaMmjeG9LCj3HwIPovEozDEFW0S5NzmzDrfmfPAEFacsiJX8W4MSe6/sHNkNZrNW51krWZOYOWt9jdDOtjcLxP7KpAbyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 03:34:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 03:34:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Jun 2025 12:34:07 +0900
Subject: [PATCH v4 3/7] rust: alloc: implement `Borrow` and `BorrowMut` for
 `KBox`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-borrow_impls-v4-3-36f9beb3fe6a@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: ea391d4b-01be-4e8e-0275-08ddac86c268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WS9ucFZ3eG56a2JqMWhGYk1UemRDSHR2TWRBVDZSM0tuMWdWOUoyN1NYR1Uv?=
 =?utf-8?B?UGFTOHBRaUJvcjhaYjFHQUhsMXpTK3IvVHhmbWpwY2NQblNvdUdxcHhHbmZP?=
 =?utf-8?B?WkRuSlRpWnN3WUhMVkwyNTZ2QjFnTVIwOVBuWS8xZnBFUkoyWUNvL3lOTUtv?=
 =?utf-8?B?bmVKc3pSWVNtN0dia1plQVQ4WmRZcWV4c0ZXTVJmblRkWWVPZDBrMXljSXVx?=
 =?utf-8?B?ZFpyYVFGS1BGYUg3MXpNTm56YW82WTdiQlJCMUQzSENwTHNMYkZKaTRGM3hP?=
 =?utf-8?B?c2sxWmxRQnZiQzBtUW1PQWN5Z0w4T0kvb1A1QStLQkRuN0p6c0tjZmhSakFR?=
 =?utf-8?B?WXpvNkIwZ2RER1pZQ1RhYmJkOWZVNWdoRE51WXhkOGpra2QyWU96YVNHNUto?=
 =?utf-8?B?WHdCWko4RVJpL25lNnRadWN6V2VzeE9INEM3VDdLL0w3TW9JcWo2a3E2WFoz?=
 =?utf-8?B?bHdCL0NXUUE0cXp6YXl2OEpGcit0WTRHMzlYUFplOWp3bWxZaVhWRGdBVStx?=
 =?utf-8?B?WGdISkkvRCtic2dPbkRDaURWMWpSWUU2REhvdGdaQ0NISHlmN2pUQk5zNTk4?=
 =?utf-8?B?dUtiQkdYK2hCdERMNUNKcDdrS1BzMm5NVlk1QXI4cjhTb0NucWRMTnpKZnZv?=
 =?utf-8?B?dFhWVEZYSWV5S2d3MDJtV1FjNFZ6UlR3blRuZjVqbXlJN2M2emUzRkFzajVz?=
 =?utf-8?B?WFB4MzRZbkFwQUI0TE5wM296bDJvaU5yNnh6elZQNlVDeklpYXBiQlBFR3Bp?=
 =?utf-8?B?cFdHSW8yZmdROWoxOExCb25xcmFnRGUvQ25JM0g0dy8rQThrZkVib2ovQVoy?=
 =?utf-8?B?Nkp5Q09hK0tKUWlabjdwbXFaMk5DMnhUd0dxZ21tR3VrNWZMakZsYjFyMmdm?=
 =?utf-8?B?NlJTNlFVc00zem9sVU5YTXliekRITkV0MGdnTktUamFaMndVS0xhUWZNRy9u?=
 =?utf-8?B?VmRySjMzL2lkaCtUYnJwZ0FOYzEySVluY0RLcW8ydWlxMVA5L09vSWpFUFNC?=
 =?utf-8?B?QXk0L1ZlZFFaZTk0d0JOSEZuUEJyaGJmQVhqcU5YVS9JbXhXTnU2cE5LaFRE?=
 =?utf-8?B?MmFmTFE1dTdCNmVQdjZVTEswcUJmK0VNM0xjVk5heHVsNC9hRnF0YmdWakZH?=
 =?utf-8?B?dzN1WUlmWWp2Y2hZTldpdGFKUlRYc0FYRjd0V0dTc01KR2pPbVpNYVYwRHZE?=
 =?utf-8?B?ZUt0TTBpWFM0M20wSW5uamRKSDZhSFRxYTdlQjRBNDkyZ1c0TDVIK2VPRGNw?=
 =?utf-8?B?azY0bGM1NVZUTjN0blBxcUo5S0dEcmRjL2pydDBaK0lRZkFYQm1XTXNBQnF1?=
 =?utf-8?B?VFUyQXBBa1dGWWs1TGNLTStaRFpZY1BtQ1ViZ0EzRHhBWndhQ0U2eWZ5VlZz?=
 =?utf-8?B?YkRXVEpnaFhrRFlrQWNNVlVHeWtTdld3QlNFMlRoYU9QUXFCak13dGFIYVBE?=
 =?utf-8?B?MCt4cFpna0FyZWtKbEYwUmhVZzZreDFmNmZNb0tPbXpWam1WQnRRZTRLbkxV?=
 =?utf-8?B?MDltR2pzcUxnU1VjVnJuVng3TWFzbU9DbkdMdU9XVytSUUdlVjNMWEI4Mlpx?=
 =?utf-8?B?ajBxK0FCV3ErOVZEVWVaM2tVMkhlRGFFY2Q5b3BiQjFXNnpzS0FGRU1XU3ZQ?=
 =?utf-8?B?TjI5ZGh0R0p6Z2hqMmpWQ0hhWDFOS2lUY2dLM3BZZ1dlYU9uRUpYUmlOZFhu?=
 =?utf-8?B?bExRekUxZy9nL1hqRUpOcmFINS9YNHlUV1k5SmxtWmlWRG9GK3BKLzJwTUR0?=
 =?utf-8?B?Z2Zza3dabS9HUU1PMWxEK2J3TGNWQjdmT3FnTWFqbXArUmo2SW5QNVM0TUF6?=
 =?utf-8?B?QnBuZkNTQW9wdlloN1dReXgwWk5UbHV6NDFRT0FKRnh3UldFVU5UR2REeCti?=
 =?utf-8?B?d1Z4bENob3VHdis5Vk9LZEJHWXFsNjI0RElCUmtvbjBEK1RoVUlQMGh6WXBG?=
 =?utf-8?B?M3FwWmRhUkZZQkRIVE9WSXZVM09pZFcrVFVyRlhlQWN4akd6ZHBmdExqeUpI?=
 =?utf-8?B?WUd1T2JVait3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnRJV291R0hiYlRpT0xFSVVFUU1Gb25EblM2L2VsQi9LeUFBQ0lNSkdNRUly?=
 =?utf-8?B?TnlWRGVJNEdYUklYS3ZBN0lXcTNDeGxnYXpkR20zTy9obzFjM1Y5ZDM0NHpu?=
 =?utf-8?B?Q3BxSGhJZENKN0h5VE02MmVpcU9wazVqKy9xWHlLTXlqSi9DMWVvKzl4MVVL?=
 =?utf-8?B?VmZzWDRoN3YxUVBZbmVjK0F0RGJsRzhsTUg2YStOcmNNcm5pK3Z3c1lhMDVO?=
 =?utf-8?B?NXU0R1o5SXJJVTVGQ1daaEVVUFBiYWVqeUVleTZxbVIwZ2lkaHNjRENUdnUv?=
 =?utf-8?B?dmtxZVVMQ215WVBHSVN5bjBLck1UenRRQmNobnZOZFN3c1lhRU8rVUVTYjQ4?=
 =?utf-8?B?aVp6eUR5YVRiK0xqUmo4WFhhQlNPejVjZ0JDNE8wREpkOFRlSXlBajNtdjgy?=
 =?utf-8?B?M1JFbUdHbEMxRGx6YU5wMEYrd0dhNytDMGJyM0tFZEtRckEzclZQdW5hSkVD?=
 =?utf-8?B?YUtpSmZrT0EzYzZCdXYxWTRiazNVczQ0MGpmME02Q1hpL04wSzErWnBQS0dk?=
 =?utf-8?B?blJuYkN5OVZEbnpQSmpqK2RjYWl0QWM4TTdoNnN6WDVyU2U5bFFtUHI4MXFz?=
 =?utf-8?B?bysxNlFVTjRDY0Z0WnkvU3A5aU14VHVhUW1SZUlweGhPeWR0Q01KZ3k5QXpF?=
 =?utf-8?B?M2lWeXNYTWZWbjFWa3oxRHJkRGtieW1BNDEwUko3QTVJOHFtbmplTERPU08r?=
 =?utf-8?B?U3UzZUtlK0EzVGVlVmJUTktmWFMySC96Mmg3R3BtSTJqNlBFcG9ScTArL0dx?=
 =?utf-8?B?TlpwY3ZidXBMSFFQSzhOM3M1SEtIN2ZUdjJnY0tsY3Zxa0RzUlBZbzlMZS92?=
 =?utf-8?B?MHhRUFR1YnQwRkVJVnJGdGxPbmxRekhvYS9adWtpVSsvcmpBb3NxT1A4SEtr?=
 =?utf-8?B?NHJOT1FRS1RuR056b2lrNkp4K1FuTW8zSzRZTjE5VWdXYXVrV1dma0QrcVRV?=
 =?utf-8?B?OFZFZFV2Y0xlZTdBVGlqUHcrbTZoaU1IRlAySk1iR0FzTDZIT0pBRlhtaUdn?=
 =?utf-8?B?THJDL2prNFhqdG1MbmYraFVQdEFDSmNwT3NhVFB6VTl1OXd6Q3BxMGUya3pT?=
 =?utf-8?B?aUdrNDRrNGE3TkJ1UGhQOTdGTGZKYWNxcndXMndQelFwSzJ3N1htVWx3bTM5?=
 =?utf-8?B?ZFR6LzA3ZDUvZnlDVDJlcGVSZTNWS1NITXZiMEFrZkRWdzFrc29pNkF6UWlQ?=
 =?utf-8?B?T1lWQlFjbEc2UnhqblRrTEg4T3NqWHFLRmcreVlaekZmbDZMS0VVbVc0WXhI?=
 =?utf-8?B?OEZNczhQcmM2MUxYclpMM2VKaEN4SHRJQ3BUUzZEZk1BdXBVVHJxWEN3Rlo5?=
 =?utf-8?B?WHk2eXJqK2RtWUd6WTdPVnNVcXpRa1N4RE8xYlZ0NGxaTVhKYm0zTUFSTjk1?=
 =?utf-8?B?cFJwZEIrb0VVc0NUcTRTc1ZxMGl0eHdKUkFHMmRQL3FPRlBKVFBKR1VHUnJt?=
 =?utf-8?B?YkxQZ2p2UCs5bDJodm52MlBqbzFBcVl2c2JLK3BGWGxiZ1Q1ZHYxbzFtaDJo?=
 =?utf-8?B?TEJMc1k2ZmtkMitETEVMYWFhdzR2R0t1cHA5dm9JRDBKWDBYdFoxZ0VMODJL?=
 =?utf-8?B?blhENEdzRmJqcC81Wk5GcHJsT3N1dGd4N0NVRzBOZmtIZlhSaFJrd0VLSytj?=
 =?utf-8?B?bUI2eUh6UWlNbGh1alF1WlJOd0RWZnhEeWEveGRlbGYrZEMzaXFXL1hXZytU?=
 =?utf-8?B?T2w3ekllUWNIbFJzeGUweVFRN2hITko4Wnd4YVoyQ1ZjTkhwYjMrNyttcytU?=
 =?utf-8?B?dzlGME1Mci8vdTAwa2xENWJtNTZzUk44ODNHRzl5OFFUUFVaUVUxVHBrU0Mx?=
 =?utf-8?B?WnRmcXlJdVBTRVM0MzNKeE5veEd0NFNEWHJTWFBmV0IyWEJmUXZIWGVLOU95?=
 =?utf-8?B?cnpaZWllZisrbnE0d1J2dEtSZHJvWGM3OUlZWHJRWTgwVHl2OGpKR1FjNGkx?=
 =?utf-8?B?RUl3VG91RFFSbWJFRjBqUFpQQmlpeVY5QzFIL2ZrYnFsUlIvSXVyOHgrQUxa?=
 =?utf-8?B?blNkMkJTRHZVcWw1bndNTFYzWjlydzhIczNsOUNhSFhDQ1hpNlBEL2x0TTdu?=
 =?utf-8?B?cDBXdmRheHdsdGswbFlORzJuaksyYVMyQVlrOHErWjNhSE9xNVBhazI3WkNQ?=
 =?utf-8?B?QUJ5d1c0akJGSy9rRFkwMWZEYnhYamw3WXFCR2lNQnZ3aVBDRlZnTS9BWUFI?=
 =?utf-8?Q?C/ZlZtxsIF1iTCcRMHBOivmCFhkyEoERYcwe51CmkrKp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea391d4b-01be-4e8e-0275-08ddac86c268
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 03:34:54.4965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X33YZfXkcxNY+zNwu2MvDf+OPSKTGQJq4VZ2PEbc4WW6eCKvfzzFx4/Itn98DZhglaF1MSTbQUosQlOVxgEK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

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
index c386ff771d506a2eb4c211a93ea9b59bc04c93f5..ccf1df7da96cf9e879330385fa6f744d6f60c972 100644
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
+/// let owned = Foo(1);
+///
+/// // Owned instance using `KBox`.
+/// let owned_kbox = Foo(KBox::new(1, GFP_KERNEL)?);
+///
+/// let i = 1;
+/// // Borrowed from `i`.
+/// let borrowed = Foo(&i);
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
+/// let owned = Foo(1);
+///
+/// // Owned instance using `KBox`.
+/// let owned_kbox = Foo(KBox::new(1, GFP_KERNEL)?);
+///
+/// let mut i = 1;
+/// // Borrowed from `i`.
+/// let borrowed = Foo(&mut i);
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


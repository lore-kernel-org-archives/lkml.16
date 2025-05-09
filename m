Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6C220F56;
	Fri,  9 May 2025 20:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820870; cv=fail; b=Xhuumfv1SvrEJnkzph7MkpdNOWqE0VmAR0T04XzUE7aMJhAruGQ53cqrGF1i5xLqj1lSsiLKeR+KEfm27Ap6WjhsnqK+NKoFnjFMM7WbOnGkSqgp5g+4cFUqhbMM0o1HSvV/nVGPo0spZ5hDgoLWn7EXnTSAhMz22b6uJlbtMoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820870; c=relaxed/simple;
	bh=3mHaTdBxShDD/4guUAJPQDAse7+tk9xYfWZpvfOeyvU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ipp4+xTP6xNAMthKyRtOF4E4A1lmksa6FllievKTSLyTEaqDF684wtBHJtZw8LnKkJTNYtyQ4V4IFNdvb8qpbQFxWpuFyFGCjBmvDz7eYXmIkc6pN2HWWTY08rNEISTSIOOBh4NkZUNNj8hkckrYzgL9HP6TFIeyEKdPAfnldGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N8r1OxWC; arc=fail smtp.client-ip=40.107.244.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N8r1OxWC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezQ86644NnyukpLsRmOhP+g3xGs4I4+Z0nX5l68L+C5tPQrse73l3MUohCmcJopVfHp73KooqyUzGCuAkcgW57l7gyk52SC/a7+Kn87xDvfhwu0jTrfpq6c6CHqvKyHZXGBTllKMyPZtyyVRCXzVjsKRmTdPTxzArFcxrvT5vjAGj11clbAlnIW5MjTA42tHReJHfRUBg9VWKD8OcqQihzSyYAyAsyEOS440JnkTXr5O36IuxX/b+KpdufHmnYEQ5l3Z/kbVZ+qCxQ4jxeVnJVlD4MVsyYx5Iie73dHWuyejGvse1P2k4LiMK/d2ZEiHx8ruV+12s9iEXEKpxrOpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Plid8pfhMVaHlt2Ama5R0dRUJ9TQxRAVF1bpmOrEGfc=;
 b=uX4jrrPBHSLxS/l7ODRh3tdXhjhBv2BjpXW/AgtxT6G65i1ozj1NisLSsR2+ws1W6rIorFAeb/xVdbTe/OWWlDXpN81Wi9Th+i91tJv1eyudpqEVpLCc5SnPOCBJe/waMLWkWDA5Xu+EhN0OTzSmoX/ntCKou5EGC8BrSfN8a1VfYt8keV/Y9s7XqGDfy8saLg8KzJI8bQlds4Lm7OOqwY7UDuZQFueJnkTIg31mmmVYkmTRANqwcSg7/ycxQ9g12eSGUN+3N20T2MMom70uu3MtobEXuHoqPWQXN+DYRcsEnGY3wUCaWjITko7r47j1R2NVE5Xv/RYU4Iab4uN3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Plid8pfhMVaHlt2Ama5R0dRUJ9TQxRAVF1bpmOrEGfc=;
 b=N8r1OxWC5gZMZyHwf3cm5JfUmrwhJlOZDON76X9JU35sTRCMtXyQB9cwPord7XyX5YWdzKxHIZMYaeBqe9WROw3Qs0vZeFxl9hnV+ieLgwxrptD62wrIjvZcW3VE3RuzgFwKBGsgnOlYwfZDGz/eTUsP0EACn9Qobn4nf55MYto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB7178.namprd12.prod.outlook.com (2603:10b6:806:2a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 20:01:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 20:01:03 +0000
Message-ID: <6d8e91d9-8ae2-43e3-bf6f-4ccb063ef115@amd.com>
Date: Fri, 9 May 2025 15:00:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/5] platform/x86: firmware_attributes_class: Add a
 high level API
To: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Joshua Grisham <josh@joshuagrisham.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
 <20250509-fw-attrs-api-v1-2-258afed65bfa@gmail.com>
 <7cbfac66-e7fc-4035-b8ff-b40fe9592085@amd.com>
 <D9RW7Y6IU7Y0.GOM8TXTY9QPA@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <D9RW7Y6IU7Y0.GOM8TXTY9QPA@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 82443536-f46b-4c6b-85b4-08dd8f3439f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXI1bytweU1QcUdNOTh4S0FScmpyenNVbjhkTlduV3drNlNlYVBVc2JzQVJK?=
 =?utf-8?B?NnpJenVqT0VXYkpnUjdXZEFoRjIxems3MHZyNzI0N3RTMWVkUDVoclRsYU13?=
 =?utf-8?B?T0swOXpPNGFPdzA4UUJTZ3lXeXRwZm1Gb2lVdWNuU29mU0hlZGo0dStGZFBz?=
 =?utf-8?B?ZTFWNkxPK0gzdHRlelVraE8rSnoveFh3RDdOMmQwcGFzaXlrNXB1UUdxTStZ?=
 =?utf-8?B?U0M0SjhMbnZFMStpUnBweTBTUG9IUDEvaXJDSTlFNFMwZzE3WUtYUnZFRG15?=
 =?utf-8?B?a3pOemx0SmZ2WUNEMm1NRlZFZmpjZ05UNDVSQzR6NENrcDd0RHZHcjd3OFJX?=
 =?utf-8?B?bTZtZ2pqNDRqTE9xbWRhUGxOVFgzWWVUQjhoODZIa3VvTE93c3JDMVNaYzZN?=
 =?utf-8?B?ZEk4WmczdmdqWXZTVzB6bmZYZ0sreFFmVVVlUjBpVHB6cHhTS0dWTXlIWDUz?=
 =?utf-8?B?S01SOWl4N3dLL0ozcUVDbVN3bkMxVjhJeWZMRXNTTjFxOTVESHlxS0NKZ2ZT?=
 =?utf-8?B?NzVvSXVTYjBrSkN5VW5id0czcXF2d0swMm5FRVJ2NEJmQnlZeWE1VmFhZTM2?=
 =?utf-8?B?N3Rlc1hzS3RHWkF0WTVsUHJvWnVQczNWM3k2RDZJTENVaW1tN3VVOUdhK1lK?=
 =?utf-8?B?RzNFVWNybzRQZFpOVytPRWlrTys0QU9RNUc5dFp1Q1FJTloxY3NkYzlQaDQ1?=
 =?utf-8?B?SmNSRVErZHZEOWYySkVLa1BLQ0lWdW5WVWJnNTdXWXYzUnh0aXRmcm90Ymxz?=
 =?utf-8?B?bHluSDUwMXY2czBhMmx1ZVNlYS95bWNBb3BqL0MzeElMbHBhb1IxNVg4ZkRl?=
 =?utf-8?B?bDhobWlzTXhacDdDM0NoSG1aZHdLVWZoMkM5L1d5MVBpSFdMVG83NW55Zi9D?=
 =?utf-8?B?dVExTUhybktrc3R3Y1huUVJSMW9QRmNkZlNab0RUL2xBZDNzRUNBMXhIKzRI?=
 =?utf-8?B?SC9iYkVUemVML1JxNzFpK0RQYW8yWHJyZTRvSEQzaGVmdXlyb0FFU2RXMEtv?=
 =?utf-8?B?K2FSbnlkUWdnQW13SGNoUWVWMXZENUUxaHNKTEgvV1E3cFNqaFNKTlBnWnp5?=
 =?utf-8?B?WEJyVng5ajBvNGR4Rmx2elJVVEpkcnEwWmJTbENiMmo3NGNpN2xFQnJMZkJM?=
 =?utf-8?B?Mi9XS3cyQS9XWExNYm5PN2g1WTNjUWZ4TnJGMW5EcTM0TlNrbzhrRzhJNisx?=
 =?utf-8?B?V0tlRzBvam9ReGVwTkFvK2dIcGhHUkFIYjBhVVRiMXp4bkI4T0tGeHJJZWVM?=
 =?utf-8?B?clhxWVRQVlR6aTlnLy82WEZ3Wk5zcEhHWExLeGlpL1ZXamtzaWFHQk9xSkxC?=
 =?utf-8?B?VXQvQWZZV250U2lNczU4eFRZNm1UUktKbWRnT2p3aVV4ZTMxRnpFTVBtTStl?=
 =?utf-8?B?V0ZydTlRNDA5K1Q0dUI1djFTRE1EKzRSaUdOWFp2ei9nem1yZ0tDSlVhZm8z?=
 =?utf-8?B?YTlFVk14cmtIY0JlUFU2R3FuUWpFNXN4Z0czOWx4ODdRQXlsRUJZSFFrUWhi?=
 =?utf-8?B?UHFzZXc4QTNabngyTUYzSjZIWGtieCtCd0s0cW05clJSdHliM295R1lrT0xH?=
 =?utf-8?B?R1NaRVYxYllNQ09xQ04rYmlXRlhRNWFQS1J1cmxndFFlcFVMSnkwQk5CYmhV?=
 =?utf-8?B?MmVIc0RIdFRQd0N3aHpNL2p6STRucWVDNS9EQlBJaTltbmRjL3lDM2JOeEZJ?=
 =?utf-8?B?dnNaUC81VTVGWFJyNmxkZ0Z2RlpYU0Vjc1N3MFc5R0xlajQrS3E0cnZMbWJD?=
 =?utf-8?B?Y2hJU0xZTU53SDF0dkRPOVhRWXM5bldNb2NWWUZlRGppRDhVOHVCdUZzZ0gv?=
 =?utf-8?B?R3lvS21RVkZBVFFkYTBrNmtUMTNjY0NUVG1Ram14VjFBSXBzeU9wVktYZ0FE?=
 =?utf-8?B?ZU5OaHQzVGNLbzFTMWFxS0ltU0pSN05GK2x0dkRBaWtKdTNOR1Z6aXFXR3pZ?=
 =?utf-8?Q?kyYdBn45+/I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2prNUNmTGd3QVRNTDhjc1RLN0ozMVgvZ3pYOWxya2hlZHpsZnJVN0VuS05U?=
 =?utf-8?B?T21wSCtzRTBpNU5NWWZ2NUI5YjFlYzdLSytIY2E1MUFQbEVCUFZGUzRZZy9W?=
 =?utf-8?B?Q1gvRWFmQWdRRDROcERRS0FBNVJyUUdFYVBySXJaYjEreWEzWndjZGx2VFhH?=
 =?utf-8?B?NlREcnQxK2p6OEFNbWIxay85d2VqeGhqWFB4ekU4ejJFc09GZlZtYjBzSzIx?=
 =?utf-8?B?SmhSYnZLbjIza2UwcHNkM2grUm1OR0NHRnU1WHJFSVFNYXR3UzhiWEM1cnJL?=
 =?utf-8?B?NkdaMHh4U3Y4VTBpZjlUaEM2K2tGM0MrWCs4bFlGOVpwSGptKzh2UkhINDQy?=
 =?utf-8?B?SXdmMWxZZjdQamNxTmE2ZEtiTjZPMXMzbVl5YUg3MldlbmNrdkRyUUM5V2Rv?=
 =?utf-8?B?SkVLdG5WUTFJQ2pYdHBqbG8wazBPeEF2N3FVQ0hZbDZrRm9CZkJlZkRwdEdq?=
 =?utf-8?B?eUF4WE8yTVcwUjEwMi9qRURZQjBWa1M1eWJPOFVuaXc1NEp4STJIdjJqanFG?=
 =?utf-8?B?OFBZUnlpT2g1SGIyWHJzZ2R0N3RDbHNKSENwbFFGRUxFUTVHS28zaGxDODl2?=
 =?utf-8?B?ZTEyUGdNUktBT0lrTHZUcFdwdEF0SHdHai94Q1hkWlJ6cS9RK2NYVzhla3p4?=
 =?utf-8?B?RDJITXdZUVZ1WjBxL2ZiQ3V1Q3RkZmMrK3M4NStQR0RKdjh6alRqQU5MRnYy?=
 =?utf-8?B?MTcvc1FkcEtnL1dFQTdkV1RpR0Q5SzQyRlBKSzJxbWdZWFhWa0l5ZXByUXRj?=
 =?utf-8?B?bWhuM3Q4Rmc3d0NRNGdHaXZsdGo1RkNjcUM4RVNRWUQrN0VMSWhhd0NFK2tm?=
 =?utf-8?B?OUNrWXdtaGQvM3YzalpwdUJRNDNUZFJzSHZQTDROT0xOczBLS2JLaHdFMWxT?=
 =?utf-8?B?UFpuY1Z3SEg3UVZCTnhHUkhQVDdwQVpHRmJpU09UZ1YvWkhLS3ovZFY5byt0?=
 =?utf-8?B?anhQNWo1dmsza0IrU3o1WFJ3d3NndHVGTFg0UVN1dStoQUFEVUtpQzBESXdR?=
 =?utf-8?B?cWVVSDlDY0RJeFhrbTBkU0YzOUV5SWtVMG9CQkF5Zy85QXU5QURlUG1iL0pG?=
 =?utf-8?B?Y21kREpXc2hKLzBlWFdpR3ErVmhiQzNhWitRS0pieXc5RVpNc1hVK3N1YmFG?=
 =?utf-8?B?T2JpTG5JL2REeHo4V21FcGZCSzhFT3VDV3pnYUl1TGpQMjNtQktJcXhKbStU?=
 =?utf-8?B?ZmlCWmk4bHVTNUpwSlpUR2tsZGZuU3cxdm1LVi9tMnowRmhHajIxeDZEV2hy?=
 =?utf-8?B?U2ZwVjZ4UXlZV0l3aUpZQlJoeDI4OERZeGRqUUZycHB6UHk4aFhqa1NIc2hs?=
 =?utf-8?B?SU9OdmN0cmQ5S3FOdGZEdGJlTjFCeGl3UFg2Ylg0cnlvUDRLcmRweXZjSE1l?=
 =?utf-8?B?Q3IrN2MwNlpzVmR2YzV3cVd0ampBbXJVSkcyUENldFVhNkxsMzU4bWZBQXRH?=
 =?utf-8?B?Zm1Bc0F4Z0IyREFUYlNIcDNCNDV1NEFUcUZKbFFPelRUd3NVVzZUYkdpV1Fm?=
 =?utf-8?B?QmxZMk5kMU9GekZ5NDVFRlI1QXVmNVRHTm5wMnB6MUN1U2ZZVVc4SGgvMnNL?=
 =?utf-8?B?enFTRE81UlhXTGVoZlQ0Rm85OG9RN2JHS25Oc2ozc3BmYXJHSmdmdGZndnhu?=
 =?utf-8?B?U1RpbEZNelVXS1VCck1qMVZkMGZHNlZqVFBtTWJjTVhueXdiKzNLai9IbEhD?=
 =?utf-8?B?TlpkT2xPYi8ybnVWUmtPVlpScm83Q2lFdmRhR24xYUlDUDYvR2hxdHNOVU1X?=
 =?utf-8?B?WFlEeWhnTjd3NHJGSmkwOTNNR0pWaHFESUVETkRYNUpXZ2hWUE9NamV0UDhk?=
 =?utf-8?B?SEVSMUJZUFhaNGc5WE9PRGwzT0FJbGt2NjFBNUhuVzgxU09TNEpaaGJTc0FY?=
 =?utf-8?B?cVRsUWVQcUpRUUxoQUwzLzA2RkxjZTVub1BmZFBLZXE4RU5CMFhmdENKajB5?=
 =?utf-8?B?RjhoWXZ0M01Qd1cxZUhQdllJcUVaQVI5UkQ2cWovakVVeS9lQkt4V004d3g3?=
 =?utf-8?B?YVdTVGtCTXQzSHVBVDhWaGZ4cGpzYXlqeUhINUw1Mk5uOXljSGNzMEFSeEs2?=
 =?utf-8?B?bTVoZTZYQlBPT1VUWHFPRFkreUN5bjRqZkZEZ0xETmtPcUovRHhOMjFoWnJB?=
 =?utf-8?Q?iZ8o7Am2pBCjI8cy4WhcYkhqn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82443536-f46b-4c6b-85b4-08dd8f3439f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:01:03.2542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBlV+LQbkV7LzHBnRrNrJRaj369wBfRn6EG18g2sFcfHXiqdJ/V8nNdXjupVXmiMciO771E/39AyVedl6dIqEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7178

On 5/9/2025 2:56 PM, Kurt Borja wrote:
> Hi Mario,
> 
> On Fri May 9, 2025 at 12:58 PM -03, Mario Limonciello wrote:
>> On 5/9/2025 2:48 AM, Kurt Borja wrote:
>>> Add an attribute configuration mechanism through the newly introduced
>>> `struct fwat_dev_config`, which makes use of other documented structs
>>> and callbacks.
>>>
>>> This API aims to be simple, yet flexible. In order to accomplish this,
>>> the following features were taken into account:
>>>
>>> * Ability to statically define attributes
>>> * Custom read/write callbacks for each attribute type
>>> * Ability to map attributes to numbers in order to differentiate them in
>>>     callbacks (`aux` number)
>>> * Ability to reuse read/write callbacks in different attributes
>>> * Ability to reuse property selection in different attributes
>>> * Optional visibility callback for dynamic attribute visibility
>>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>    drivers/platform/x86/firmware_attributes_class.c | 249 ++++++++++++++++++++++-
>>>    drivers/platform/x86/firmware_attributes_class.h | 228 +++++++++++++++++++++
>>>    2 files changed, 474 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
>>> index 58ab1495ba3bd449cfe17de2827a57a0c5937788..7cfb0f49f235728c7450a82a7e9d00b8963d3dea 100644
>>> --- a/drivers/platform/x86/firmware_attributes_class.c
>>> +++ b/drivers/platform/x86/firmware_attributes_class.c
>>> @@ -7,14 +7,233 @@
>>>    #include <linux/kobject.h>
>>>    #include <linux/module.h>
>>>    #include <linux/slab.h>
>>> +#include <linux/sysfs.h>
>>>    #include <linux/types.h>
>>>    #include "firmware_attributes_class.h"
>>>    
>>> +#define to_fwat_attribute_ext(_a) container_of_const(_a, struct fwat_attribute_ext, attr)
>>> +
>>> +struct fwat_attribute_ext {
>>> +	struct fwat_attribute attr;
>>> +	enum fwat_property prop;
>>> +	const struct fwat_attr_config *config;
>>> +};
>>> +
>>>    const struct class firmware_attributes_class = {
>>>    	.name = "firmware-attributes",
>>>    };
>>>    EXPORT_SYMBOL_GPL(firmware_attributes_class);
>>>    
>>> +static const char * const fwat_type_labels[] = {
>>> +	[fwat_type_integer]		= "integer",
>>> +	[fwat_type_string]		= "string",
>>> +	[fwat_type_enumeration]		= "enumeration",
>>> +};
>>> +
>>> +static const char * const fwat_prop_labels[] = {
>>> +	[FWAT_PROP_DISPLAY_NAME]		= "display_name",
>>> +	[FWAT_PROP_LANGUAGE_CODE]		= "display_name_language_code",
>>> +	[FWAT_PROP_DEFAULT]			= "default",
>>> +
>>> +	[FWAT_INT_PROP_MIN]			= "min_value",
>>> +	[FWAT_INT_PROP_MAX]			= "max_value",
>>> +	[FWAT_INT_PROP_INCREMENT]		= "scalar_increment",
>>> +
>>> +	[FWAT_STR_PROP_MIN]			= "min_length",
>>> +	[FWAT_STR_PROP_MAX]			= "max_length",
>>> +
>>> +	[FWAT_ENUM_PROP_POSSIBLE_VALUES]	= "possible_values",
>>> +};
>>> +
>>> +static ssize_t
>>> +fwat_type_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
>>> +{
>>> +	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
>>> +	const struct fwat_attr_config *config = ext->config;
>>> +
>>> +	return sysfs_emit(buf, "%s\n", fwat_type_labels[config->type]);
>>> +}
>>> +
>>> +static ssize_t
>>> +fwat_property_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
>>> +{
>>> +	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
>>> +	const struct fwat_attr_config *config = ext->config;
>>> +
>>> +	if (!config->ops->prop_read)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	return config->ops->prop_read(dev, config->aux, ext->prop, buf);
>>> +}
>>> +
>>> +static ssize_t
>>> +fwat_current_value_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
>>> +{
>>> +	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
>>> +	const struct fwat_attr_config *config = ext->config;
>>> +	const char *str;
>>> +	long int_val;
>>> +	int ret;
>>> +
>>> +	switch (config->type) {
>>> +	case fwat_type_integer:
>>> +		ret = config->ops->integer_read(dev, config->aux, &int_val);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		return sysfs_emit(buf, "%ld\n", int_val);
>>> +	case fwat_type_string:
>>> +		ret = config->ops->string_read(dev, config->aux, &str);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		return sysfs_emit(buf, "%s\n", str);
>>> +	case fwat_type_enumeration:
>>> +		ret = config->ops->enumeration_read(dev, config->aux, &str);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		return sysfs_emit(buf, "%s\n", str);
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +}
>>> +
>>> +static ssize_t
>>> +fwat_current_value_store(struct device *dev, const struct fwat_attribute *attr,
>>> +			 const char *buf, size_t count)
>>> +{
>>> +	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
>>> +	const struct fwat_attr_config *config = ext->config;
>>> +	long int_val;
>>> +	int ret;
>>> +
>>> +	switch (config->type) {
>>> +	case fwat_type_integer:
>>> +		ret = kstrtol(buf, 0, &int_val);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		ret = config->ops->integer_write(dev, config->aux, int_val);
>>> +		break;
>>> +	case fwat_type_string:
>>> +		ret = config->ops->string_write(dev, config->aux, buf);
>>> +		break;
>>> +	case fwat_type_enumeration:
>>> +		ret = config->ops->enumeration_write(dev, config->aux, buf);
>>> +		break;
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +
>>> +	return ret ? ret : count;
>>> +}
>>> +
>>> +static struct attribute *
>>> +fwat_alloc_attr(struct device *dev, const struct fwat_attr_config *config,
>>> +		const char *attr_name, umode_t mode, enum fwat_property prop,
>>> +		ssize_t (*show)(struct device *dev, const struct fwat_attribute *attr,
>>> +				char *buf),
>>> +		ssize_t (*store)(struct device *dev, const struct fwat_attribute *attr,
>>> +				 const char *buf, size_t count))
>>> +{
>>> +	struct fwat_attribute_ext *fattr;
>>> +
>>> +	fattr = devm_kzalloc(dev, sizeof(*fattr), GFP_KERNEL);
>>> +	if (!fattr)
>>> +		return NULL;
>>> +
>>> +	fattr->attr.attr.name = attr_name;
>>> +	fattr->attr.attr.mode = mode;
>>> +	fattr->attr.show = show;
>>> +	fattr->attr.store = store;
>>> +	fattr->prop = prop;
>>> +	fattr->config = config;
>>> +	sysfs_attr_init(&fattr->attr.attr);
>>> +
>>> +	return &fattr->attr.attr;
>>> +}
>>> +
>>> +static struct attribute **
>>> +fwat_create_attrs(struct device *dev, const struct fwat_attr_config *config)
>>> +{
>>> +	struct attribute **attrs;
>>> +	enum fwat_property prop;
>>> +	unsigned int index = 0;
>>> +
>>> +	attrs = devm_kcalloc(dev, config->num_props + 3, sizeof(*attrs), GFP_KERNEL);
>>> +	if (!attrs)
>>> +		return NULL;
>>> +
>>> +	/*
>>> +	 * Create optional attributes
>>> +	 */
>> Just a nit here; this probably doesn't need to be a multiline comment.
>> a single line like this is fine:
>>
>> /* optional attributes */
>>
>>> +	for (; index < config->num_props; index++) {
>>> +		prop = config->props[index];
>>> +		attrs[index] = fwat_alloc_attr(dev, config, fwat_prop_labels[prop],
>>> +					       0444, prop, fwat_property_show, NULL);
>>> +	}
>>> +
>>> +	/*
>>> +	 * Create mandatory attributes
>>> +	 */
>>
>> Same as above
> 
> Ack for these two.
> 
>>
>>> +	attrs[index++] = fwat_alloc_attr(dev, config, "type", 0444, 0, fwat_type_show, NULL);
>>> +	attrs[index++] = fwat_alloc_attr(dev, config, "current_value", 0644, 0,
>>
>> Is this permission right?  Some attributes could be considered more
>> sensitive can't they?
> 
> You are right. I assumed most drivers would want 0644 but think-lmi and
> dell sysman use 0600.
> 
> I can add a mode_t mask to fwat_attr_config and use that for
> current_value, while other properties would be masked by it, i.e.
> `0444 & config->mode`
> 
> What do you think?

Yeah; current_value is the only sensitive one.


Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1B620C49C;
	Tue,  1 Apr 2025 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523062; cv=fail; b=o/ZpePQD4wb7GtTCpsxMhZ/AScP/wL0Axau/jElNTSlptevJLZvdann0/C3JVu192qxIaKoYYkd/lV4jeWsDRLZaF+CwtmyJCrpPLErRHLzv8hd+sBYX01DlN+mtpzmofpEbklYW8h048qyCu+HnqV5bKrLgBMmkNQ9HHgXK/aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523062; c=relaxed/simple;
	bh=BiQOGv2FpRnGuaQH6kUl5waQkgFck5qfKwG2bZ+ieN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YgeK/j4lSO57dxKI7YLWSZgQEydX0ym7yZyOSdH0r/zkY2Wfl2qyMlB5tUJJKfC6K9wrbbJ+W9W/F18oXOAlW/SRVN2pMXcatwfPawmVfsdkolKKyJGYswx/NOt0s0DjF7KkmaKediRhP0cDSbHMCiHiiXSoZ9L/01bdu1cHkGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DlOfY528; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DlOfY528"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yr863sELSSmG5jK2qjuJmlF60thQ5GZdB/uitabHA14ZL8QuejgIqfAdEK9RUxbfyJzOxvBqpgvut3LWHhRvXSDgp1cHSLG/Wwm6E7bmXqQ/cMjXJzILPLnbRiAoMNXfQbZu25s8FnCQHAr4G82taXt/KEvG0g0VPYgGzH2lOTqQmBNkEZYKFnFg4X+741iLhKcVKckLBzPfAyhuFFEBq/xLROYkXW8jeeISaNzvS/Nsmh632tF7HHSfUpi+tzJZYeZ8Rdun1+c5/fmFnwain9b7tGVRKsTZMeYZ44xYPe5fEuOT8p9gEWQmUz3Sjjz96QLi1oqH+6DcDIJDixzBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkTzIAp2pAWzS6egOMUkwS5gDIZyg/BQmi0fO+sxP1U=;
 b=N6JZGg5/jj4goXtMH3lSB6YM9B7oXUE3piDXltRxC5CyW7PjRgSPQ3Au/wXWoG27TL5WEWPxK7+oAnwswFcmomwZIyilXrKkNqqm7gTm8GMniOc6DfSbxQxnddtCm/YtTg4PhXIiZiS9WHHSDeQ3QRBMMm2b6i1aJ17ceaYZC+dPO0ZhjwqGSLlaONKy5ueKNiFgFWbj5fQOaD3RSH1YjOavbZGyJZudwD2Z9TLx5amqZyhOg8CSjHiFx092uX8fd6rLzf6F7wIy4tfmnLOVwnLnRpeklcwgX1CKOWKY1f6UdWQBoflvIN8/Ra2ZmPtqUFzsiO8ShoHopV7v9M80xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkTzIAp2pAWzS6egOMUkwS5gDIZyg/BQmi0fO+sxP1U=;
 b=DlOfY528pvp74LCi6Fg27Z9ybRX8wntitGCegb7ySxrwXre6r6I/c/KaEHzlwvnbfWijiYbIYlZWv8Rc2Ucj/U+EnfEeaddXi8JdA2oXfCp9ybMaSnO2VqK2wwafO1/whgVF+ua25//y+/VkzkB6IbUD6mVr5fxmi9ycCeXyrprD0HFwuz22+BxOZBNosdHCrhvrg6mnquG8vMuE/UEru/C6C9x0w+PdSBbaNnDls5graFvhVDr5vWJOKYKBDDezzlzjQvSUQnq1D4yznYEFAMzfLtwyytgsY/FPaybAxfyTbAYAw7r9WEQJrJSFtXBT30N/RRRRI3REekQNSgUFCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by SA1PR12MB6947.namprd12.prod.outlook.com (2603:10b6:806:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 15:57:37 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 15:57:37 +0000
Date: Tue, 1 Apr 2025 11:57:35 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Guangbo Cui <2407018371@qq.com>, Miguel Ojeda <ojeda@kernel.org>,
	a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	benno.lossin@proton.me, bjorn3_gh@protonmail.mco,
	boqun.feng@gmail.com, boris.brezillon@collabora.com,
	dakr@kernel.org, gary@garyguo.net, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, rafael@kernel.org, robh@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	John Hubbard <jhubbard@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
Message-ID: <20250401155735.GA804471@joelnvbox>
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
 <67AB9311-3EDC-44A8-9C7C-ABF2ED6B632C@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67AB9311-3EDC-44A8-9C7C-ABF2ED6B632C@collabora.com>
X-ClientProxiedBy: BL0PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:207:3c::27) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|SA1PR12MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b98d92-1af5-4947-a8be-08dd7135ec93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlROcEJLTnYvOWdINm9mUWlUNVlUaXp3NFFmRFhoNms3a0paOWlON3dMMmU1?=
 =?utf-8?B?UWhtdGs1dktTTzBlb05lWjg5VzArRm1NeTRkR1cwVXk5Y1l1dzZJTTI1T25H?=
 =?utf-8?B?NUlPRWJGZ2JIVmlIbWF4TWNiTldrZE9yYUVNZUtHVWV3eDd2OS9KdVRKVFBj?=
 =?utf-8?B?R2pRamp4OFphdjNzYThoU3FsZkRKREsxdDZGOUJZbm1obnI2bnROMEFzZHpx?=
 =?utf-8?B?bkloSVBHenVNanIzS2I2RExrd0pNSXQ0Sm14U25RZjR1dFVOWmlpd3hvL0l2?=
 =?utf-8?B?dmNEd1FtSHBqOHlXSHBKM3NCWUx0bUlwcVVxTVFmYlNSdE91cy9nQkRzRTQz?=
 =?utf-8?B?cXhHQmJTeCsvMVB3WW1NRXJnQ05sd2xXMEoyUUNPaVhzK2RRS2JlL2V3clF2?=
 =?utf-8?B?ZSt1MXhZYWE4Ny9MZklIcXh2cEhpNFVzeGgzSTBMcHFqd0lUZStBbEM4WUdP?=
 =?utf-8?B?WkJlTU1KNXVhTE50RjNodDVvc1FLNWQxdEZEUEgzSWFVeTdLd1FSZ1R6ZjJG?=
 =?utf-8?B?dnBPNXN0WmdzTTZFc1Jrc3hJYVRaU0hNZDd6aVQyc3poRzZWZUNrMG9ZNFRC?=
 =?utf-8?B?eXJVRGF6OHkvWTJPYVZIaDROZzR6aGxRVjJsZlRrc1JVOXJicFU5OFVZZWxt?=
 =?utf-8?B?bk1STUUvdGZOWEJpNTVKbmxoVnIwNVptMFN4U3lnTXA2KzRueHRqdUlTNjdQ?=
 =?utf-8?B?QUl4dDJRbGZlclJaMU01RURYa3FrQWx1aE1YMTBoTysvRGxjT214eWxnSUVK?=
 =?utf-8?B?bVlTdmFWNUROQmFRTVpvbEdlcFB2OFJsQlF0YXBpazRwK1lJZVFpeEE3bEtn?=
 =?utf-8?B?VmpRdHBmQ21NSEVDeG9EZDVOTDFUQzUwS3k4NHMwYnpHTUxMeVMxMFNmY0J4?=
 =?utf-8?B?TWx4NWIzeVprUEw3ejk0VktQU1EyTjhrdThFUEMzYlVVL0Y1M3hpYko1Mm5O?=
 =?utf-8?B?K2o1dlppd25ZZ29tRVY0eFdFTXBHQ3dkTlBIc1pvak94OEpBNmY1UEZTNTd0?=
 =?utf-8?B?LzRDeTlseDBFc2Mvak9vMWFTVmdmWVRDWURzZXZ4MFZxU0trQXk4NlduZ3hw?=
 =?utf-8?B?RTB1ZHZqalJJdUdOZXBqSXJhVXp4N1JlcHBMZTZGdUFjbzZFK2l2Mi9zK3lq?=
 =?utf-8?B?M3A2UEF0ZDJ6ZDFvSGZCci9iWkxzaVJiTHVIZVFoaFZZZW52Y1AwUm5ncTRX?=
 =?utf-8?B?bW1DZlNaWisvN1pZZHMzSVdKelk2UFJ6MjBOUThKSmE0ZThKN2c3M3k5S0tL?=
 =?utf-8?B?d1BEMDJ2Sm9URW1XRGk5dmZBbXplS0dBckF2RGRjME91NEZnU3o3UnJUc2pP?=
 =?utf-8?B?cHFWaWo2YmppT0FmbERHblVmRXEvRUdhNEQzVndLN3dmVTJ6YSsvMURiR3FD?=
 =?utf-8?B?VjAxOFhyRitmektqTVh2UEZ5d0piQVgyQVBaekRvQVBTM0ZJNDE5Y0RMNEgv?=
 =?utf-8?B?NTRIaFpISHVCV3VCaTgwdENOQklZU25ZdDdLMzBDS014L1VyTWJ1S20vK2Jr?=
 =?utf-8?B?WTYrcTBLblRKOW5sNVdtZkl3NjRyTTBtb2FDTS9HWUQ4VndkT2dqR2ZxdllW?=
 =?utf-8?B?ZE1YZzZWQW12TEpOQnkzV1ZKOWFzWjNOREhOTm1aMDZZQTJTMGZHaHExUTU1?=
 =?utf-8?B?NVpnYmY4S0orc05yOC9rRVhRZ0RXeUlSSlJSVEQ5SFBZUlZtWXdTNlFuVldw?=
 =?utf-8?B?VFZseGplc0owdk4xZ2h3M1dybXFoLzdqU24xQkxiY0VPVzVBMHk0bXBLMDBZ?=
 =?utf-8?B?Ynh5UnJkdW55TFlUVEQ3YzVIVUhrNldGWlN2VW1UeGZtSGQwVU5pWFQxVTFx?=
 =?utf-8?B?SmZaTTRrb05Zd3h4MFJwQjlVUkxaOFdKeGMyZHJrM3ZUb3VZSktlUzNPcFE2?=
 =?utf-8?Q?jG3cChMvlHHCL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8056.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFI1K0dnTEdZUjJlVDMrMWx6Zmc2VitvSnVtREdzaXN6Mm5SYzBiMlExRHA0?=
 =?utf-8?B?VjBPWVlrYllDYWNRbVNFN2tRSld3UXJ4WHlrWTc2ZXBaQ0NxV3lYMTNONlpL?=
 =?utf-8?B?SlBqdUxwczE3MTlxUDRMVlVwYmNpbFh3dGNWcG5ubkVTRGpDVjhPOFpjYzNq?=
 =?utf-8?B?U0R0d24vTUxkenRVdEoxcnNqMlNNLzI0aVA2RDh3RWM0QUV4UHNSdDRFRFNN?=
 =?utf-8?B?SjE4ZnVyM1lNcVloWVVRTVFNWGYzaUlIWmg2SWFUTTVaa2MzdmxuMUVUaEpn?=
 =?utf-8?B?Q0xMNEJ0dVIrR0s4QmVQcTUvOFI4aHEzcFRJdmt3Q1gzSXZuRVJrcFhFaFBE?=
 =?utf-8?B?aGRuRm1jSmZ0Tkl0UDJBcVZuNGszUzhrV1R4U1BkNDFOOFFlT2JlM2pGQ1oy?=
 =?utf-8?B?ak4zOUExSVJkQjNOQkJRcEZQYys4YkJDVmdvaWY0UTMxUGZKMnBqdUlmR2VU?=
 =?utf-8?B?MmlZL094cVJUMzJteHl0OEgrc1pmTitDRjd1OEU2Sm5IL0M2aUZKVmdTRStN?=
 =?utf-8?B?bkg3SEdtWjVyVEFnUk5hdEdjUG5kVUhuSE9DeHhyaXFhLzJlQ2phbyt6UWM1?=
 =?utf-8?B?dUd6cGNzOVJscmZJTkhxNHhHbG05YUExMFl3c2ZvY1FtSE9oSkZMNy90WGpk?=
 =?utf-8?B?TitNUHRnU3ZHbVR1amVRUWltMGJnUERUZG9ySXFueTFZWm8yRFdNWTcvYlNp?=
 =?utf-8?B?SDNvRjJvR1NZU2pPdTNkMENlNXJVbGVINUZ0b2ZVVGQzMmxEKzlmd0NwZFhw?=
 =?utf-8?B?Z01kTlYzUzZuQnhGVlJ6dkowZzF6dzl5S3N3ekozRVUrTE5icS9QajFCSk5T?=
 =?utf-8?B?RkxwS2EvZ1pVd3kyK2ZtbFNQMVdtdEp3b2tNdkpZNjErNS9aZ0RobDVveUgx?=
 =?utf-8?B?dUtZUGpQQ2NYNytwTXgzVnRaR3pSWFp3amlUWXBjbjhuMVhNcDBaYXNqSjRX?=
 =?utf-8?B?Qy9vRmt6L2JwbW1UVk8rUGsycmVZZjNKQzZNbW1KQVdmS2VHR2QwODQvL3JS?=
 =?utf-8?B?T2Z0QXpyOUN6QWprUTk4WXV4K2V1Nkw1cm5KK3lNdzJPakdnYjJ3UC95SFVX?=
 =?utf-8?B?TFllYTFJclc4Ni8xUnIrUHY5ZmlyZFJpd05veTM3Z0kzQlJqRGpVMXhNekpn?=
 =?utf-8?B?MnZCWVFNZE5nVkVFWU8xV3lrcFFOVnErd3dOY2x5RU1UNzdBWGhSUTFPd045?=
 =?utf-8?B?Wm1QbVRpbjlYUEV4VkNtUVJRYnhycGRjcG1hbjdycDdiZ21FQWFlN2tDVEQv?=
 =?utf-8?B?MGxydFZ2Ni9GM2FhV1FUOG9GdmN6R280cHRsNzVVU0RzUXZXa29ZVXViRFNm?=
 =?utf-8?B?Z3JVb04xTWptWGx1MmtSRWg3cFJwZm95OHZtTzZFK3BzaXFQWjlRUEJVT1d3?=
 =?utf-8?B?RmNEMjZmS3dUdHhQdDBUcHRyWW9NYTRJbGVKdncybWN6bG9yaG04VnlmeVhz?=
 =?utf-8?B?eUtjR1Z3TWwvYStRVmpGRkZmU0kvRTdPRGZPZlNqQ0FqbmJpeG92QVovTnZQ?=
 =?utf-8?B?Z1FGeWJ6Mk1QaVdydnAvdU9NaGd6MXV2N2hZTmE2MzR2VWEwRWN6c2RTelk3?=
 =?utf-8?B?VE5qS3JGaGNaeWlQbGhZUS9PclBxenJqZkgvb1dSakxBaDZ1S1VjZUtwMXds?=
 =?utf-8?B?Ukk1ZlhKc2srZ1BOcTJORFpaeXgxK2hwL0x5enBRWDdHa1lvTm1zZWgzcFda?=
 =?utf-8?B?eGozby9qWEdicEduam16MW1HaElTaUtPRytJK0N1T0owcFhNVyt1ZUpkck54?=
 =?utf-8?B?NXJySGtHbitRRlN0UUs3MzVEZnhzbG9PMUZzTW1XT0ZUVTE5akZIMnM2RE9V?=
 =?utf-8?B?V1ZEWmg2OTVCeElYT3hHM05hVHFNcVB0TkdEZ2djK2NyZEp2MmtkWnpsVWdI?=
 =?utf-8?B?dlJNQk5wYllvMmtrNTVoTE9NOGRmV09ab2J2UVdWb0Vndm80Ym9ZRFQyQktH?=
 =?utf-8?B?VldmRU5RZzRTcXRHVDNzWFpVZzBYMUFidXBERVpheGxlU2JoQmQ1aUNkbWZB?=
 =?utf-8?B?VVlNQlhZbUtEUnNlKzE0TzF3YWROZFlzMTJGZ1hLNHBUYTdUWlFTYVQxbWd5?=
 =?utf-8?B?RlFCZWVhZkRGcnFjQnc1NXNWaGFkaURsdC80TW1RbG1jbkI1VldqVkNtU3JN?=
 =?utf-8?Q?9ys2QD0Moz+c15B8mwUtnnLvL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b98d92-1af5-4947-a8be-08dd7135ec93
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:57:37.4800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLq5KxygUae7djXTGZBc3eF81kCncO9ohTcXhwluBL3gxZRsW4RAs3u6qvfXocdQazSmysXwu8Cj+YHnxksE5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6947

On Thu, Feb 06, 2025 at 12:57:30PM -0300, Daniel Almeida wrote:
> Btw, Miguel & others,
> 
> IMHO, I think we should write a comment about this somewhere in the docs.
> 
> When I first came across this issue myself, it took me a while to understand that
> the build_error was actually triggering.
> 
> That’s because the result is:
> 
> ```
> ERROR: modpost: "rust_build_error" [rust_platform_uio_driver.ko] undefined!
> ```
> 
> When a symbol is undefined, someone would be within their rights to assume that
> something is broken in some KConfig somewhere, like this person did. It specifically
> doesn’t tell them that the problem is their own code triggering a build_error because
> they are misusing an API.
> 
> I know that we can’t really provide a message through build_error itself, hence my
> suggestion about the docs.
> 
> I can send a patch if you agree, it will prevent this confusion from coming up in the
> future.

Interesting, I just ran into this. I am writing function as follows that
reads bar0 in the nova driver, however not having the "if current_len + i"
causes the same issue:

ERROR: modpost: "rust_build_error" [nova_core.ko] undefined!

which did not help much about what the issue really is. I had to figure it
out through tedious trial and error. Also what is the reason for this, the
compiler is doing some checks in with_bar? Looking at with_bar
implementation, I could not see any. Also enabling
CONFIG_RUST_BUILD_ASSERT_ALLOW did not show more menaingful messages. Thanks
for taking a look:

    pub(crate) fn read_more(&mut self, bytes: u32) -> Result {
        with_bar!(self.bar0, |bar0| {
            // Get current length
            let current_len = self.data.len();

            // Read ROM data bytes push directly to vector
            for i in 0..bytes as usize {

		// This check fixes:
		// ERROR: modpost: "rust_build_error" [nova_core.ko] undefined!
                if current_len + i >= 10000000 {
                    return Err(EINVAL);
                }

                // Read a byte from the VBIOS ROM and push it to the data vector
                let rom_addr = ROM_OFFSET + current_len + i;
                let byte = bar0.readb(rom_addr);
                self.data.push(byte, GFP_KERNEL)?;
            }

            Ok(())
        })?
    }

thanks,

 - Joel


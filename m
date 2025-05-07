Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE3E139E;
	Wed,  7 May 2025 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595944; cv=fail; b=QW4UybLaW8NhMnp25IWWFfj7Yx3dxtSzTI61+9WciqYfDqsxBxeudqLN6/7I895rA39TVG1nBuCHVVnbLBhuCFaP7DMJ4KOjAzNowyurqam8oVc9UvgF9/PX1Ayup7jH7BwituHluWzzrlm+BkBV3zHXqmMaYyPeKth/8rv9yuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595944; c=relaxed/simple;
	bh=cKbkYWSfa3SXWbCqhzwqxZrzB7alH4e3P9fABcrwHSw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=ZK9MAEOS5aMzP9iNPPZzdklNON30LWmhbWPx28imTf91SbHq3mCOGMrlNB5FrsDVY8d0QN6yeYngKvYiRRXGsmVhYfGBXhNLRFrBVaJRVu/MI93KaadSDdqzYpWPwP86l94UflzyvHELANniZoksM0ziXhN8eFCEv1KbPa1fCoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dxWfTOwG; arc=fail smtp.client-ip=40.107.101.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dxWfTOwG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXt6kHpc1aw8gOk5DggY4BPV/2NJUJQna1BrOqBlfyQMMNAyeWIR1f+jdU17FbLUT03nKe9z0LYE9ULJb+zB4vL6LkZLBc/6VsgKPrmnrXJHCW7+E2ejqZOGli1m5DNJ0SmsIjvyk4c3FbgjR1v7uNMDO5UcUfmhKlGsfjXcTdaXZiQqzFNkhWtgELTGM7RyUamtDzBkM90IQZlxoDWIMgQ+GI7rj4lgEw+JeM/BsaUUGd1j9l8ZExV9xS30uekAlXeZsaT08SztdIm5FIo/OWPTMnxhD/S+2BAO1tONn1WTn95UTHezkqOdtkk85q5i2tnqTsvZw+9c9BoY2kQiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Tg9GWab7hn0SiqT+wsjPNDcUIkOQzEFIrc4UDSIBfs=;
 b=pOQpyUyHuLmKybEe3jIhTgfd8a2U4JRkVkxK9oPRcHFrY7T5ufElZe9WpUTPghK3IjKA20bz21YV+Tov00tXZIGgCyOORkrA57LiQ8PBG/s1N9Rax5VlPmS09JDvmWRdAsXlTKnQMEBMx9TofvEJrmz/WsD/Rlu6OycT8g1WXztY4yH3dUELV7adxGDE+HyosZHXcoVMSTkiERW56zviYSyryBzXTd3a0GRQfJUc1Fh7gzEEaoOW/ZZ6oGINbK4piKWYgqzN2RkMIXxPxGE5rfODMN3Xc4e0k0FGJuSpqlCxs88CBLdqjkdzpLmAorNxjz2PZscO5lnsAKF8IJDA4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Tg9GWab7hn0SiqT+wsjPNDcUIkOQzEFIrc4UDSIBfs=;
 b=dxWfTOwGgSUp6pdCOvKpLxleoSiRxhHXxAFAmYtU1RESZ+yPbSKo6fogUH0ra3TZG2Lt0nYQTcrGnej/37bbuVQCQ/Zwjo4lsf9cigx76F+F/7+Tdr2ZJkKmtFPDcgEfNxgk0JWmGKq11z4f1wWr9uYcveQYvVLgL2k0qyH/pk6CQt/8vIlhKznIYh5Lw8n1UY0T2Lw/K0IeoOp4fyIAA5bhmsax95k9HzKa+wkLgUNdlaJdoM5W3EsX5W1f1IGbgOT/C/bCXHWZHF9letzSoMaujCzgPzBawN7RTkl/8rufYG0GMvtjR+jRwguV+LAbcym5Ja9nbH9zwL9SNyODaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9025.namprd12.prod.outlook.com (2603:10b6:610:129::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 05:32:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 05:32:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 14:32:10 +0900
Message-Id: <D9POL1CR89RN.2OOMXJAOR4XAK@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/7] rust: alloc: add Vec::remove
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-6-06d20ad9366f@google.com>
 <D9POJZ60ZCYQ.1XBNZSXOQ9UJS@nvidia.com>
In-Reply-To: <D9POJZ60ZCYQ.1XBNZSXOQ9UJS@nvidia.com>
X-ClientProxiedBy: OSAPR01CA0332.jpnprd01.prod.outlook.com
 (2603:1096:604:2a::32) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9025:EE_
X-MS-Office365-Filtering-Correlation-Id: 97fba84b-30d8-4989-71bf-08dd8d288569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjdQWThQS0RUbnV5UCt3SHdlOVQ4Q2hNWExwZFNPckJxRXgrK25TdXhyMHhF?=
 =?utf-8?B?SCs1QTJ4c0txSEd1TVZod0tsMDJpVmJtWkFOM3F0RTUxdmI2TTdYbVBYWmZK?=
 =?utf-8?B?VXBqR044T0hHRFlFSy9XSVB2ZVh0OUFTQWtGTFhaZ3JVM01jM3JvS1lUblBr?=
 =?utf-8?B?cGd6WXZHRkt5elVPQ2dNRUR5TTBwa1NVd1FMVlM4M3YzNzBDTmJzOFhnbVZL?=
 =?utf-8?B?TmFYak9veUkvSU9EYXVLOHRsYmR1clB5TUZoNE4yT3YwdDNHYlBOTWVocmJj?=
 =?utf-8?B?cGZMaWJzRmRwWEVvUVVVTjRFY0NEWTNQWHM1UWxmUThLWkUvT3JsL2lESlZu?=
 =?utf-8?B?SkhqZ2VvMjI3RUd5bWNTMHN3c05ISS96OGNPMnR6dFJGTkVYWkR3VStENm9k?=
 =?utf-8?B?b2U2Q3VOaGw5MHNWcy9Ua09UQURXc216TmJVbVdmejIwVVkwd2FMRHl1NDk3?=
 =?utf-8?B?ZndodmxnaUJPdDE0dit5YXBCdmVtL1A0dWxUQWEvdUpSV2dva2VHd1F0dlRl?=
 =?utf-8?B?WTd1SFNNWmRQczYrQmN2cUhFVmhIRExIMGlhUzRidkpYTklUckJoaWdpUk14?=
 =?utf-8?B?ZkFwcis2ODBMVzFsKzRCQmZXbkNvKzdJb29Rak15RVh1MFVDdE1ZbDVKMUYy?=
 =?utf-8?B?OUxsM2d6dG5KZTB1dTVjd2pjZFRtVzFSa2xnQkExMnlpYVNwdGdYMDBXdVc4?=
 =?utf-8?B?a2NKVi9qUzN2TTY4cE50bURYNmI0V1dNKytXa21oTG13V1hBVC93blVRV2J5?=
 =?utf-8?B?ZThTblNYWS95M0xiMXhpUVpKbFF5UEx1Y0J1ekwxNVM1T1pxekd6TWw4TURU?=
 =?utf-8?B?MzVnU0N3TDhrczVsYnVyTXlsalFwQUxZR3hYVC9CbkFPSDFCRmx6MS9vblh6?=
 =?utf-8?B?SEpCVDJLeE9zSWhQRHhQNmhZV055TkZ0VjFDSlFBcitCa2N6a3ZuSE9RUWcv?=
 =?utf-8?B?dDYxaHd0UkZvQlhJZDhoQklBb012Q2Jxam5PZ0xvYTgrMERzUEYwQnYxbndO?=
 =?utf-8?B?OXZlOUpiQUZlZWZaZ1g4cllVMEhiOVhHMWRPOStIWC94T0ZtZ21NUUM4NWNF?=
 =?utf-8?B?RHRoMVJ2UjdRckpSN0tqeWpjYStDaitibEE2elR4a0NnSWhmei9MSllwOFRw?=
 =?utf-8?B?UEdXNlp4LzlNN1hBbGE0d2g2d1NGZFF0Ym5vR245Z3lWMFBoa0wveThwQ2lN?=
 =?utf-8?B?d2YzeXBRUFdFOC9CaStJaWJnTzdIWWgzWnhIaGs4YzczNXN5MjYvMUozSmlE?=
 =?utf-8?B?MTZ5VklORVZuc2EwRUcyWFJUaURIWFV6UTZ4MStaWkQvSHZKWXZoalFjM25J?=
 =?utf-8?B?d2l2b1NpeHNTLzlCOXJnOW10M1ZUK2Y1VHhtcGVZRzh5ZGJzR0Z5NE1IZXlh?=
 =?utf-8?B?YW9MUTFrNVpOdUVIL2RScDBmQkxUekRxYkNrcDdnaW8wb3g2bmtacWhLV2Ux?=
 =?utf-8?B?WXdmUE1zUzk0aHA2RW8wT3I4YWNxVGVVRWx5TWxUWk5NRUMrM3B1STQ1OS9F?=
 =?utf-8?B?RjJmWFBoSWtDaGlDQUcrU2c1S1JkT3N6SDBvV2tDUUorSmlTdHcvZ2V1QXNj?=
 =?utf-8?B?MFdPRDZ5V2VwZDlNQVlOV2pCUkR1eU1EaFJyTkJEeHVNankwbWZERTRXS3Iy?=
 =?utf-8?B?ZmNUV09HeE93VUhVRFBHUjdQZlRlV0NBRzZucytRbHJFamdDRWhFOTZKZys1?=
 =?utf-8?B?TFd6WTEwa2xhUG8ycy9RWWdwS1hzcFdqeWJYRndGeDVYVmJpaXkvZUFzMld4?=
 =?utf-8?B?Y0FjMCtFZUU3RnBiS2RtYnJKT2NtVCtXcWNXMDYwYzlDckxkaGM1Tis5Z0xt?=
 =?utf-8?B?WG5iZEVnYnhYWE1iS3dtTFFKdmZ6aDZjUkFyOE9nUFlsOUE3NlBmU1hRQ2M1?=
 =?utf-8?B?Y2cxc04wUkJrYjZXSHdvQ3dWSURzZ0VscHZEZlJyQnNzRlZNUndnQWs4K3pz?=
 =?utf-8?Q?TP01pRytjck=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGZUamVhNVRBd092UDV4QVptYm9yYzJ4U0RFRWN4aWJ6Qi9DaFVhTkJuN2JW?=
 =?utf-8?B?WFdxb1FSZVZ6N3l6TTVlTUtreHNHOE5VTHRUeW1vSUQ0d01QTlVBTHBobGpt?=
 =?utf-8?B?VnNOUXpHNVBHcGE4WnJuOFpuQmRrcW85bUNCU0JQL0loUisrODM4VUpSdExS?=
 =?utf-8?B?MGFRU1pDWVlrYk9GOHpOSGIwbG9xTnVWeGhKQkdvRU1rWFd4Sk9ORXU5ZDlE?=
 =?utf-8?B?ZjNsOEd1RXJOSllEaXJmcWJjb1diSU1iOVd0T2psNDY5STNhQndKV3BnT3Ri?=
 =?utf-8?B?bVZDdWQ4eG56bjdHeG5hR3JFUmdWRnAyMFcwbE5hWWdmanVGczJzL3pSQThX?=
 =?utf-8?B?RGR0QXdWWHMwUlM0OWpzUXlSOU1BYk4zTjJRQzFNWmw2dmJzNEdXYWlmc1gx?=
 =?utf-8?B?dWhvWE9VK1g5TEhpU0gvTDM5c2x1WVNsSDdkMzU5MjE0cEZQOURWY003czY3?=
 =?utf-8?B?Qzh3WGJ3YjBYeDFwNXlOdmZ0Z241Vkp1bDdDYkJrZThiZGNSK1A2ZUhFYzZq?=
 =?utf-8?B?MVhEY1UvUklJeFE0SDBoOGtVZnNJQ3NPU05DYlBCTW5MMzVSRVp0Vy8rZ0Jy?=
 =?utf-8?B?WC9yc1BtWml5NEhPMWJsdStBNC8yakw1K1A4b3pZaGlPRHdCRVJvbGkyMFhK?=
 =?utf-8?B?QTJ0SFVVQVAreDJ6NnBZZ01FUjBjL0cvTzZ6OTV2cm5lbkJzdW9MaUdUblNy?=
 =?utf-8?B?bWsyQzlwQzNtRnE3UDdVZytPV0NHWDZSU0o4cFhoQlRmTUFLZTQySFcybVl3?=
 =?utf-8?B?cjhXNVcvMGpkdE1mL2N6S0I0anczM1UxQmNLei9ub1JscVd0ZUJOQkpmUmFz?=
 =?utf-8?B?UHdPUXRlR0xvSW9BQUZRazVwR0VjSWo2ZC92bnV5TXRDN1lvK0d5MDYvTDcw?=
 =?utf-8?B?U1c4dHFrOTlXQlFPdjZDd0E1N3hvYTc0VEtpbVZLN2Z5aG9qMHEyKzdSYmpi?=
 =?utf-8?B?Yytwd05nNGl0dm4ySTB0SnJFTityRjlSRWU0cXNhcFJMYmVzdUtrYVUrV0l5?=
 =?utf-8?B?T3loV0NpQUNxdmtsSURRQlZPNGcxR3VNQmwwcmFUV01FdDBrK0x0QjZhTVhX?=
 =?utf-8?B?VXlPK2JvNGs4R244MEJjYWRPTXE5VDdxSjZDWWNyai9BYXZwV290cW9LcWxQ?=
 =?utf-8?B?WEdyek9WN25DQ0RMc2E0b29aaW1NN1crc3J1MGljc1FmcEZlcVhlem5YOGlT?=
 =?utf-8?B?R1JGV0RSanJReTNubHJLZTlwUEFXcjB0N2E5NFl6Qkd6NTg1WjFVc3k4WmRj?=
 =?utf-8?B?dUFRWHRzMTRsVFBtVUxTZ0djWnU3Y2hucmIwT2xNMUU5eFo5T1g1cGF5NVJt?=
 =?utf-8?B?cGlBam1EOW5wTkk1L2NSU2ZZODhxWlZROTc1a21sZUs4QUZ2eDVDWU94UHpm?=
 =?utf-8?B?bURFZUN2bW5ZNzU2WG1zVjIzNUFFc0hpQVNWVm1lL3BibmhxdTd5cHFaeFd2?=
 =?utf-8?B?ZFlZRkZnRmRsQnVhL3B0eW40a3RuSFcxUVRvVDJYbFM2VnhTUVYvVzJxVWpW?=
 =?utf-8?B?U2JicG4waFQ3WVUrZHpzUW5JeCtQMDhKUU9wSFFQc1V4eVdqaEp2RlpRajNl?=
 =?utf-8?B?SlJaNCtmN0xEbTdhaC8wOWlwOGxiYmExcTJzaWx6N2hUNmNoSmk3OGFneEdi?=
 =?utf-8?B?a0RKOXdGalFMVmxnMXdxQWdZcFZxSzB2cVEweG5NU1RmY250dXJZc2NBTWcy?=
 =?utf-8?B?UFl1TTJiZmw5cG5iNGxLSTBlNnlOb3lmVFVqTFFrejFLR2kvYS9oQlo4Y0dJ?=
 =?utf-8?B?VTAyTENBMCtrSmVKNTNEWUd6d25YbDJRM3dYRURxSWQzb2NMeVl6Q25UM3hX?=
 =?utf-8?B?TjlIU1lDdXpVd1kyVXlOZU5ldTVxZjR3d20rcjNUbFRaV1VlekdpZjY2bllm?=
 =?utf-8?B?S3BaVDFTVXZGbEVncjBDdzEyS0VvT1hQelprbFZUb09PaDA2MFBmY1FVeW1u?=
 =?utf-8?B?ZHhzeGNlU1ZzeHc5SnFuM1JQcldsY0tsUHhYMm1qejhLUFlKaFBtQkN5Nnlx?=
 =?utf-8?B?Nm43YXdFT0UwZXVMc3JhWkRMdUlCOHpUUEpHT3V6aEh0SVp5b1BHSGdxSFVH?=
 =?utf-8?B?K3F6UGE5WFA3ekhrTnl6eGRSWTFNYWdLSVBOMW13dkRqM0FSdm9QMEVMNExO?=
 =?utf-8?B?UFErVmY5N1cxL2lZWjJJQU9FT3djNmtyT1hoT1pHVFZGYnEvS1JBcnlvcVdx?=
 =?utf-8?Q?nitEbMuzWSkMcUB1f/4sCXYRpQQWiKwG95UQM1iubEJN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fba84b-30d8-4989-71bf-08dd8d288569
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:32:13.4721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DV8XKuPR/4A9eA10qQJlOhTV8GxaVXN7yC+30GD5HAO2oaTiWNAQjzjQDYxjHIkR/mWWHRNNMtgqjC7Qj18siA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9025

On Wed May 7, 2025 at 2:30 PM JST, Alexandre Courbot wrote:
> Hi Alice,
>
> On Fri May 2, 2025 at 10:19 PM JST, Alice Ryhl wrote:
>> This is needed by Rust Binder in the range allocator, and by upcoming
>> GPU drivers during firmware initialization.
>>
>> Panics in the kernel are best avoided when possible, so an error is
>> returned if the index is out of bounds. An error type is used rather
>> than just returning Option<T> to let callers handle errors with ?.
>>
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> ---
>>  rust/kernel/alloc/kvec.rs        | 42 +++++++++++++++++++++++++++++++++=
++++++-
>>  rust/kernel/alloc/kvec/errors.rs | 15 ++++++++++++++
>>  2 files changed, 56 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>> index 3298b3b0f32c70f3fe517fcb7af6b9922fea926b..8845e7694334b672476ff935=
580f3a9eb94d23fe 100644
>> --- a/rust/kernel/alloc/kvec.rs
>> +++ b/rust/kernel/alloc/kvec.rs
>> @@ -22,7 +22,7 @@
>>  };
>> =20
>>  mod errors;
>> -pub use self::errors::PushError;
>> +pub use self::errors::{PushError, RemoveError};
>> =20
>>  /// Create a [`KVec`] containing the arguments.
>>  ///
>> @@ -389,6 +389,46 @@ pub fn pop(&mut self) -> Option<T> {
>>          Some(unsafe { removed.read() })
>>      }
>> =20
>> +    /// Removes the element at the given index.
>> +    ///
>> +    /// # Panics
>> +    ///
>> +    /// Panics if the index is out of bounds.
>
> According to the commit log (and the code of the method) I think this
> panic section is not valid anymore?

Oops never mind, I didn't notice Danilo already pointed this out. >_<

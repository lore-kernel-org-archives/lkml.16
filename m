Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11C125179A;
	Wed,  4 Jun 2025 11:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749035961; cv=fail; b=TMnss9nX+KPKrxliCi+FnwKnSFc20pj1N0cO0xgGlGT4hDTtzdOwVbWOVvSJCAKLmAx8v6r9Nk67S+BPEkD9aZHFC3ALU/3n1dMY41tcnhWMWbWOavIulU9fRPLG747DcSjAdUhwfA0f1tQgVpMZ7t83DCa08PenKwx+NF/SlRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749035961; c=relaxed/simple;
	bh=dQBr4oX4ztQKM3Q8+3d5nNSdZhYK4EESPMrGh+DEJ+o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jeokrV5YphSyI/HjiJhx8mlgRgQiEPO/hZBqZ79Px1R31YxkWqy+urUXyghJ3uuGKOtkO44vlKLtcAgvJDdDDkSgsFPeEUH2BoJvQj2++rgHOcPDKlKhNPmkMeqfMyqsPKHuwazUNtEHOex1/ZEGaOreE5yfFubSvQiLeDjpyVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=n4sMG/rc; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="n4sMG/rc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivHGXSKhc8JNz7/ehmVFgAdcyyTOMkJtmzorT5i3sGIYwD5dSVC15Tob388RwtIdMQRAhZbrtTXd4YXWI72URM8IYjpucmDkyaGy7+LNqP9rrCGqcm3TAF5fpylw2jE7XrhymwSbSaNmwpEeRCmNQ0IcAvpfDd96/AV+2jIgjionznjbU6j5D04yvrw53YTX+FNpAjz6JW0mp4VzzC0MSmpEsMmY7XtXXtD8gNd5uGx1oFRneUXd3FVimh+KVY2gmP2lvNauA3IpLb+jprKSovBCEayuNLTlzqc2s3CvQesJ+OyWzY78muwY/tdGa1HwPF+eByu5ChkdcKrMO3VyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6hMGq1mE9osyEeL8Nm0hx36p0vXx9b8x2D6Tqx+eZ0=;
 b=FbDVFjb5D0R8NlByi9IiVt28Gdz4TdY4sFIAffxkX2xUWqZQLuBkfQyVHEyI4oSkBWPhOXeKv25xj4WiCcpbDmtPxXFe/YYKJbLgMOhCmrR04/VBVN63sIY2cg3YTsgSxlMAD1IMEr9BJF9DSV1Ym1vTinVBDogKgTqlXBEXcl9fpjdv1Sopt+n3UaBlraCmpiNyHi556PJWKoRi3/1eOf//F+M9l+ZLXhJuqL/565XipVq3gIF1KSCCpkFo3bNl4IBAtKpxRqtKi85p/cAj1sd05ooiAa0tKah9x9/FSH3QUDV/maQm15Q2SJVWAI1MlyZWmXlCj6rKCS0af6GRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6hMGq1mE9osyEeL8Nm0hx36p0vXx9b8x2D6Tqx+eZ0=;
 b=n4sMG/rckbqmw67boBy+M6CLi/jsODh2hERqsDX8zfykxZLqPISUMI++ThApxbCAVkZlVGih+V0ArTC8tIC9hMZ0FvdLPe7l6mDLp2vrQ6dipUJ3OKiOiicfddlAr5x7aq8Rfvt3owQQw6NYKbyogYpSm30ZydTBK0kuspqxRpxBuT6j1oCer3m8gmGT4Ucplohl7YxdyI1josfmHdjVkEUwsSPHgYqY7gGP1dYxSXev3U2tJcc1sHk48NoUlagoOA1w+itbm7knPc11nnvcnTTXo1SNyywpd7pqpbJFNxbzwXoVrQWrE+tW0H4N91JGJ9ELgK9tnZ4cjTKHWGyBCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by MW4PR03MB6554.namprd03.prod.outlook.com (2603:10b6:303:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 11:19:13 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 11:19:13 +0000
Message-ID: <bef27c79-7d28-4d06-b05b-567e2a69a9eb@altera.com>
Date: Wed, 4 Jun 2025 16:49:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix10 service channel
To: Krzysztof Kozlowski <krzk@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
 <20250526-sip_svc_upstream-v3-3-6a08a4502de3@altera.com>
 <3a76c7b1-ce02-41eb-a4c0-ae065e9b99f3@kernel.org>
 <0f74ed36-13bd-4b6c-9d5e-f52cc25235f8@altera.com>
 <7e02b0ef-2470-454b-81df-810602d8a626@kernel.org>
Content-Language: en-US
From: Mahesh Rao <mahesh.rao@altera.com>
In-Reply-To: <7e02b0ef-2470-454b-81df-810602d8a626@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To BN9PR03MB6201.namprd03.prod.outlook.com
 (2603:10b6:408:11e::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_|MW4PR03MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: ab328cd1-f40c-431e-af45-08dda359a267
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXFXZmRZRVF0YU1hQVFwZFh6aCs5K1ArWHZtbzloNitSUG1CK3BRZGVUL2l2?=
 =?utf-8?B?dEpKTE5WQ1AzSTZCVml2WklWTTdWY21pQ05OaHNWUDBJbXlMcUE1dno2ekJF?=
 =?utf-8?B?UFBZU3Y3K3NLMmgxWWNGTzB2NnJGUm5jMGxlZGJOWHRXZG1rdTB4UG9QTG9Y?=
 =?utf-8?B?dDlUN3c2aDBINTZTMm1ZUCtKRjRhQTV5d0J5aFlJOTJOSnByRmt5SjB0Qktn?=
 =?utf-8?B?UFgwSWtSMXN2MFRBMlJ6RTBjY244YmNNSEQvdGlPQi9PcDVqajY5VGNLQ2Fn?=
 =?utf-8?B?U3dSSmJhekFyTFpnSm5Rd00yM3lKVFM4aTd1MEoxRFZMTnN4RFhWUU1kUE9n?=
 =?utf-8?B?UGl2UWJnU3BDL0Y5aEFLUmZROEtuWTZQL0llZkN0ZDEydDY1WS9YRUpGNFJZ?=
 =?utf-8?B?N01QdU5KbDRYbENlNXNKOHphODR4d3gyRFQ0THU0NC84eEhMVW9IbUhzakN4?=
 =?utf-8?B?aXVMb2NhQWNBS094UWpScExpb2xwUnF4RXBRV0JUK3RkZ1l0b2hDYXNtdEgz?=
 =?utf-8?B?UkV0WHIraGRiQmJpMGNEaXExcktIWVY3V1laZHJZaUtTenFoN2JrR200czJD?=
 =?utf-8?B?anRnRWFNQVpsMHV6MFZ3dlQwLzczYXJUZE5tZ1J6UzM3dlBkMjFmc2VpSWxQ?=
 =?utf-8?B?S3hMYnVWbndlaTd4YVZrMUVEekdvUUlQSWY0Sk9JREZ4bkE5YjAxVTBZdXlO?=
 =?utf-8?B?UXpSd2NYeE4zWGRKaDNhRDQvMkpqTTZhUHUvbnp2REsvNjM1RzRseXdEVmVu?=
 =?utf-8?B?dllnY09sMENRSSs0N2t2N2xwUnZENUwwNUtMTmJEb2s2QUhIUm94c012bWhL?=
 =?utf-8?B?b0FML1kwN3NzSzZIQ2lhcjBYWUpOaEFNZE03aXNoOTViSVFvN0p0d1FlNU5M?=
 =?utf-8?B?WVczN1MvTHdVb3dpQW0ydTJVdmxDY3NWSmFpaUVtZzN1b2xyWDJZMFkvTFFt?=
 =?utf-8?B?N1dmaTVZL0x6dWhqSFlObnpUcnNCZkFVNEJLU2NZeW1RUzhoVFU0bzNNcXJQ?=
 =?utf-8?B?Q0l6WkhYK1cyRFBsVm1GRjVmQWpIYk5lRDNvMGt1RXFEOU1pd2NheklmaUFG?=
 =?utf-8?B?YjRnQ2pmUi82L2FubVBjSVBQT2FqNGpDWEhGdTNDcWRLZXRoK0F3S3VINjBn?=
 =?utf-8?B?Zk10dzVPeHkvUThSN3VjcG5talpBZUhhV1BBZm9BSFJLd1pLQnA3djRFR1N3?=
 =?utf-8?B?T2ZTZWhQdFE0enR6Y0djRk9XV0ZnN3lmMG93M3ZjYXQ0VForMnhCOVlydzhO?=
 =?utf-8?B?WmhWRG5ONnlob2kwMGR5My9taWxhRDBrcno5aXJQNlJ3ZjIxRFNWbVZ6a2pD?=
 =?utf-8?B?dXk0YTV6OWt3R2Q2bitTVjloNkZmb3hjMHE0Zjd3NldjU0hJTkdmN1pYdjgw?=
 =?utf-8?B?QzF5OU96MWdZem9KanpSSkZHdzdlcmRjb3BXVXFtbjUzTVJsMk5uejc3V2ti?=
 =?utf-8?B?QlNZdjJnSzN3RmNqUEhaR0ZON0xhNEswZzJIUDNuaGJhTVA1bnFkWmFLVFFN?=
 =?utf-8?B?SWo1Q21heUlMdTFDQk5pZnVSOVRoZjZyUVVvNnNDZGxkMWJ4eUVKVnlBM1Nm?=
 =?utf-8?B?Ym9nSXlqOHJnM3VPWWUxK3lmb0JjdmZrN3ZMRXR6V1VmUHJ6akpvc1EzQkRv?=
 =?utf-8?B?V3I0Y1hOdkhWWWhqZXRqZXNnM2h5MjBtNzFZTlV4VnNzTWFaSWZBd0dEeW5M?=
 =?utf-8?B?d041Z1JzMlVoRjFZZ3ZMVUJiNGtETllQd3lGaStZdER3QlBuemRpWUFiYmN3?=
 =?utf-8?B?cE5jNzhYcGVyQVJKdkVYRHU3ek5OMDZORjl1VVVmejVWMmVaWlRFTkVCR1RL?=
 =?utf-8?B?UnVZV2Jud0htV2YxbUZjNG1CZXVrKzRBUGpCZUpuTUxTeitFN1BmcE8rQnpV?=
 =?utf-8?B?bVAxcjlLb1ptRzBnM05aclVCM2ZyRm9ia09hVFo5bjZ3ZWJQZWg4K0hHSjlB?=
 =?utf-8?Q?wqyILnQ0o4w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmZYa0Mvek93SEJ3RXVWTTgwVXFXQ3VvSHgzWXpoZm9uRkFJRmR5QlE2a0d1?=
 =?utf-8?B?SFJBMG1NUTBUQ3NObEc5enVkMVcrN08wWTUrK3cvaVBaUzlPN2V1UVFvNVJy?=
 =?utf-8?B?dVVyaFVPakVGKzlxSWNiZzA5eFhNSU0xT0J0SE1HOVVLRFZNU3NEYmZkbnkw?=
 =?utf-8?B?ZHZGdHdrZE9hUzRmdnc4M2lRVFBOU0NBZ0szbkkzSVNKMGVnb2dnZkZocmFl?=
 =?utf-8?B?OXhsQm5HUHRhUFE4T1BCSTNwRlN6bUgwUjRzZWRDWnA1R25wV3BpSU50MHY3?=
 =?utf-8?B?REtlSXBwRVp5VjFwL0wrNm5UNWpaNDhJOHZBWWVmT3I3RUI1R2duUndEQ1Jn?=
 =?utf-8?B?SW9mK0hiL2VzaG1HVGJVSFdsRmxwSlJiaUtaNjI1N29VU084Zm1lMkVQa0lq?=
 =?utf-8?B?ZE5iYzFJMlY2WnVSZkxoOU8ya0pOdDlZRFl3eElSZHdGdE9WblBVODMwSmth?=
 =?utf-8?B?RW9PaG1mUGtXYjRvcER4TUFUR1g2cGlhaWF2aHd1TnlqTU4wYjljSkRwUHFB?=
 =?utf-8?B?OUlWTmJUZVFTNi9nQ1VheUNQbnhzNG81MVMvbi8yRkdrdGpZN0F2WU1uWHkx?=
 =?utf-8?B?VEZJRXZ2RnJKZTJmK2JlVmRWb3ZuMS84NUYyNy8vT3E1UERoWjd2RGdmdjEy?=
 =?utf-8?B?dWY0dHVxTWlTQkt6c3FZWG5vdXhNSEFSMUR1U1B4QjlKSDUvcHhTZjdNWmhh?=
 =?utf-8?B?ekxIem1oVzZlT1J5K05FNzVGVkxuOFlsaFJUWUg1WENBTFJ2bitkV0lEYTBK?=
 =?utf-8?B?citSVzY2Y2RFUndCUXBRVW43S0gxb3FnZkk5SzliTGRnRThJV0xTM3NWMUEy?=
 =?utf-8?B?WDhHYkFEMjV6YkF5M1E0SWtWUUlnaW1YMFZxbmw1QVdod1pnM2MzdVVFdEJ5?=
 =?utf-8?B?N085OFBHTkttNWNFMXJqMC9pZGE3MUhsd3Z4QnRWQVZPUHRJaGxDUEZWZEc4?=
 =?utf-8?B?Tm9Ha1BRUHRvSGc3ZDB2Q3R1YzJrMG01WkREQ3NWQzFUSlpoeWp5SzVDaC9M?=
 =?utf-8?B?QVNUK2ZUUkZ3NG1VcytCYVVVeThsbHhlS0E5cHRnQkJzcXFncFIxWDA5UCtt?=
 =?utf-8?B?MTRES1dtalJxUE9lU0xzdEx4QW1lYUVqWlVGdWVnWmtWVEVHRlB1b0FSU3hY?=
 =?utf-8?B?VXN2eW1ZWi9uWkRaRlRGbGN6Q1MreXBRZGJDdjlra3R3bWwwRUY0RW1QRFU0?=
 =?utf-8?B?L0xoS1NPV2w0OWcrc0c2ODZ6ZDFXT05GSDF6SHVNLzgzSVJQWDRhUlBrVTEv?=
 =?utf-8?B?b0lOVmYyWWszTGIxeXU2STk3czJxcmZpdHdoV21yY2EvVi9aSXpnOG5GOUVu?=
 =?utf-8?B?TUUzQjFWSTZWRTBEZTlSRTl6bGE2UUtVcC82UFgyRGtwbFZVN21TNFMybVBx?=
 =?utf-8?B?ZUM2ZVpvZm9PUUtNNk1BdU81eHYvSXl4UGVXeWJ4bFBSN09NVEFCazl1MkNu?=
 =?utf-8?B?S3c4MG9vMy9SalNkd0JQQWZvR0I2VzFIZXNkcnBoSi9VUVBnbkdnQUlvbEVH?=
 =?utf-8?B?Rk96VFJQejJsMnkzaEhwUlVCY0t0eWRzRVJpRTdJZFhCM1dDbEl3MUVVdThI?=
 =?utf-8?B?T1pYUS9TbWcwU01od2FWR0JuZ2lCVStHQS9YVzNsRndzRHR6UFo1R3E4TnRz?=
 =?utf-8?B?cmtzNjRCemtoM1ZFMEs1dDFCYlZsbVVZNGorTnNmVm1sNDNCRG5md055ZjBB?=
 =?utf-8?B?NFRrbWJpUnhja0w2aE1XR1ZxZ1pWMzM5QUo1eFgvZm5IaWo3QlJReUdJQzRr?=
 =?utf-8?B?ODhFNXF6VnkrSVJVbS8zTDdkTy9MU2toOEFWQlZPQ2NLOEtkcS91QmdtQmdX?=
 =?utf-8?B?YzFBdExQL09RQ1djbDFiTms1M3NiZ1VBbEF2QmNNVnFDRmpOZXRycTR4VVN0?=
 =?utf-8?B?dStRNlhYYXNSUzF5aE1nNnRxRFBhVjRKUnhJN2x6QS9Cbi9IU0lYeEVtcy9Y?=
 =?utf-8?B?T0FrankrOWhaR0txUXFCTjJhRWU3aVE5bjdhMEV4WGUwWTJDeGpzcjhXNVhw?=
 =?utf-8?B?L2VuTVVyUWxwb0gyOHphS203elM0MEQxOFpCc25JNHJrQ3J1aC8wMXNUTlhy?=
 =?utf-8?B?R3RFV0N5WC90QjUwQ2RsOHlnSFZLYmZ4M1RsV21FL2xpWXRHYWo4VkhBN3BM?=
 =?utf-8?Q?f+HuWEdo5QnqJtwbYOdJIHhSg?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab328cd1-f40c-431e-af45-08dda359a267
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 11:19:13.3163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWNynmSK9k/wXZuMiXTD9JibjCRhaKp0SEu5eZ0gwoqOa+YCY092I8Xe3F7QJX4MK6QW+6nSOqya+RaAQYpt9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6554

Hi Krzysztof,

On 28-05-2025 05:20 pm, Krzysztof Kozlowski wrote:
> On 28/05/2025 12:29, Mahesh Rao wrote:
>>> ...
>>>
>>>> +	args.a0 = INTEL_SIP_SMC_ASYNC_POLL;
>>>> +	args.a1 =
>>>> +		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
>>>> +
>>>> +	actrl->invoke_fn(actrl, &args, &handle->res);
>>>> +
>>>> +	data->status = 0;
>>>> +	if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
>>>> +		return 0;
>>>> +	} else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
>>>> +		dev_dbg(ctrl->dev, "async message is still in progress\n");
>>>> +		return -EAGAIN;
>>>> +	}
>>>> +
>>>> +	dev_err(ctrl->dev,
>>>> +		"Failed to poll async message ,got status as %ld\n",
>>>> +		handle->res.a0);
>>>> +	return -EINVAL;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(stratix10_svc_async_poll);
>>>
>>> No, drop entire function. There is no user of it. You cannot add exports
>>> for dead code.
>>
>> These functions have been newly introduced for the Stratix10-SVC
>> platform driver. The client drivers that will utilize these APIs are
>> currently under development and are planned for inclusion in a
>> subsequent patch set. Would you prefer that I include a sample client
>> driver using these APIs in this patch set instead?
> 
> You must have user for every exported symbol. In the same patchset, usually.
> 

Ok, I will add a client usage to this patch set.

> 
> Best regards,
> Krzysztof

Thanks
Mahesh

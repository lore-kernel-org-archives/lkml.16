Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022116.outbound.protection.outlook.com [52.101.126.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B6C226D02;
	Thu,  3 Jul 2025 03:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512716; cv=fail; b=TwWylm5pZWjFCyKQPwdCJhpR17Y2jmbpgzwbb77bZT/yOQwR0mzRAv9a67drxOjd/WqCbbSzNz3m4tyft4SV1Emw3kyRCR3u1pizbZ4JElmaluhy6TjC0j4/7QO9YsViAu9uD0ISSgODwQZG5hy+bDW20XuN/obr53+ck1xXNoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512716; c=relaxed/simple;
	bh=a0WD5a2aT+qeee+WRcP0q3Qz8lb9vRv5dbMEAuUnnpo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jOq8MxU1iqzLIRhl1KJ6/gSk7CX9n3J5LCwv0vnZKdU5RYj2W2K83+B8m2Pfso+iUSz+RUZXhrdwsGtZygDKeKmflEBsFn1ElCnmChNpOUz+UGwLJtM1BECUF57UE7veDOqVk+w5cXhPsG5Frw2PB5YMfkHm2Y1oSJ5T4ZkiDMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Iwmo+tRJ; arc=fail smtp.client-ip=52.101.126.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Iwmo+tRJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szky1eVEAQa9tLeAQ38wxwUQowLu5/tDsJF+GhVSgoXER9x2D/yRd6BuGmqAuUxFyLmO3MfbCm6IQpWhLDHrZ0Mm9Hehl/cpbaEX0WIhKk+Zd3WJPLN54J5LAWS7KohAxE50I7OqmjOQOLkkt3C1sf0DuDdeCJI7o2n4iX56/pd1N0Hhm+eVEza/DHh9P5R1rqqDgrsmv1JYJQaCCSku9H3DOQn6nmw+Ev5p+20q9LMk4GRSIvBpu0no2O7aueEqpIgpmOkCYxzr7uUG5Jf96O6UfJ1mSCt9H2zxLY0quX8pzofDZFwy7brexuQ/cEAtez08YcYb+vavbHaPKKaVag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTaJpBE2ZF8OH82IaIyy9y6VTlx3AUewfPPqMu+0gT4=;
 b=bDYt/32gyk23VeFcAyjA1dm1/RRgUY1FzZsHphfB3LZk5GwHkYPy4Mbh7Cq3p9mDyQkVrKfJ9EDCR3SywcAlyPE4ZgpESxXi87JuAU496I5BZ2ZHKfgjWUYSBh8eo5PeueeEvBjhA2qemSrYyj8euu4/wRouzyse9I1FZOL0q/jjBTFuk1pn+HG2RTt6tvk16hir9kho7aXJQto2cU1AzzDB/fjXjoODFUsfhSS5umOTna5AOPFEWHK1Z474B/Q41zCg9k5HwM1FPDVhCq6Zfld1SMoJ/d0epHqY4sB29OfHweWqBrWTGUF6ooM257T93O6P3g+fHoebXcE4zm9mLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTaJpBE2ZF8OH82IaIyy9y6VTlx3AUewfPPqMu+0gT4=;
 b=Iwmo+tRJkFs+lUkM8XeoXqgxupoSOjb5Ps1OkyxpTVKJuOMM0+VWcVcLaazhOscihX+Vv/KUlZQsh0bZH4h3j/3mEEKk2RMZk4xxjsiQHs87pdV3xhHFbIS+f4dzCvNDSrL84txToDx2cDD6rItJ9gSa2ERvvTYNw2myzg/cVPQFjxiqvb1AZz9Fd6amMmkw+9lXVG1b+zzV0+T1R7DB20RKBLzuETd/wELUfbVdT/4wNSImkkluqPgsiZsaJWcwsnpfFJA0/o18Kr9O9vbEL6esVh99WNAZ2/XiBTLHep7ZpvXoruKOd3h8Yw//Vsxc/Lh+zuFQhUxnsaEgGY1L6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB8766.apcprd03.prod.outlook.com (2603:1096:101:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 03:18:29 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 03:18:29 +0000
Message-ID: <a7738c67-25fc-4919-bee8-69a72abb4871@amlogic.com>
Date: Thu, 3 Jul 2025 11:18:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/26] clk: amlogic: s4-peripherals: naming consistency
 alignment
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-12-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-12-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: d03c091b-c0ba-4979-fd40-08ddb9e04809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0t5Rm1QQk5DbldWVTJDak1MWHBCajArUWxWaU8zWHhpVTFmYzBTUElGZmg5?=
 =?utf-8?B?amF0VEg5ZFRuQTh1dXhudXZPL1l1L2pka2htWldEaHh3VkRYWHplMy9tRjUr?=
 =?utf-8?B?dG5vQ3ZIdjlMSDNGazRHSmZpZVg0VFY3cU9mY1NuazZuMDdJcEd6dGZZMlIw?=
 =?utf-8?B?Wm9HSFR4bGVBc25nQVA3b25CMFhYaDhjOEwvcUFwL3d0NUJ3aTVmYkl6WCtL?=
 =?utf-8?B?N2FSQWVSYkhzdE5YWWRuaTdxVWhlSmQ4RDdVZnJKY3drNXI2TFJIVDZXaW56?=
 =?utf-8?B?TWdHL1cvV0tBRGhwRnhvRUI5WUZ1cytUWWllTjJCOFJYb1NVUkVTZjBrVmZX?=
 =?utf-8?B?ZlFJM25mQiticHN3TXRSclJyRHkwbUFaQStiQ1NjVlAydGhoeVZrVzBsQkxq?=
 =?utf-8?B?U29INTlZQnlSTEt1MXVlWjVybEwrZUhpYThlcjU3TTVlbWJ0emRwRXlXandL?=
 =?utf-8?B?bWl4Uy9aYUluR3J0ZG5Jdi9aRjl6cnE5d2crUzVzK0M2SGF3MEhncVR2VXVK?=
 =?utf-8?B?QndBemhNUGJlemNnMDB0UEJyUnVOS2FtbkhJcUczc3Y4YVpFY2I4dm5JLytn?=
 =?utf-8?B?R2orWHB6RkNpb1lEc3BhQW16MkorRDRFNE5pVzlIZDI2SjRDdDcvb0x0QVZh?=
 =?utf-8?B?VDAxYVlwODltMmlpNnJBKzBKaytrL3RFS0ZORVloV2pleHZNZXA0di9ZUUJT?=
 =?utf-8?B?VDI4cWFvYlh5aVFIdUpKUUZkT0JyL3lqb3AzL0lGTlJDNmk3VWpWb01DcXJy?=
 =?utf-8?B?Ujd6dXdHc0tkVHBVODE3VHkwVVR6RUZWMW1STmcvTFlEUko5NTJ0MHloTjVn?=
 =?utf-8?B?RHlsazd4SkorUHJhWXZtcVRBZzRrd1h2NmJhNjMrSnE5V3VlTDNOUG9oZjlI?=
 =?utf-8?B?TUFZby94Mysrc1VCU0diOE1hcjBJR2ltS25xZDlzazlnYll2YS8vOHdQR0Va?=
 =?utf-8?B?MG02S0xQRE1mZll0TDVQTHdNL2d4UHV4UFhIekpFTmU5N2F3YXlVVm9kdWFk?=
 =?utf-8?B?eWhmZ2wrcDlTUHgySVJUQ0ZJQys0R25RWXpFMXgxdlRKN2FIYVNUeEFiZ0JH?=
 =?utf-8?B?QjUvSUJ1NVpPZFVqeWxIWjNsTm1HZEdxeENwMUhTTC9YcktQUWNYZVhOWUMr?=
 =?utf-8?B?eVhIRlRjTnNOSW5TdGpPL2pFSEE3MXo2Zy9OanJTMmEyb2dzYTUyN3lrRUYr?=
 =?utf-8?B?UEdxaDhaaWs2THNOdDZ1TUE2OUR6ZUx5UTYvclhhSEVYWjZldWJleTZ6ZnUy?=
 =?utf-8?B?MlFuVlhYU05MN3BxTW9mbzdIYzZhNDlZeTRtMXZOTFlKNkxxQzYrMlFqS0FW?=
 =?utf-8?B?RDlxQ3RHSGZuYjI4UTcwWkc5ZXI4Z1ZnWXc3R2xkeithWGpNUzVPTXpjVXVh?=
 =?utf-8?B?bHB2cW5rSlRyaDZtOWpVRXE2TFJ5ZXJncytIOHFYSGpwWC9aSS9QOVRUZjlL?=
 =?utf-8?B?Zm9TZUxCZHFDZVU5QVh4ZkhCaDZMb2hhQWYrTE8xT3dvSVRyRFE0bzVPWFJm?=
 =?utf-8?B?elZwRDNGcStFZHR5QVZ4K09VeFNvZzhHc3dGSUtsVE5MaUZ0cklDUGRkVGda?=
 =?utf-8?B?ZEc0eGhVSUYzZkRDbUR6VE5paXpzV2NLMllIRXUyNjBIR2NaWUszSXJPZ2JC?=
 =?utf-8?B?TC9OYUZyZzA4eTB1ekJyRW9IL3dUb3FtMXcxTEs4OUVQUmhiWjlaSUtXa0Fv?=
 =?utf-8?B?WlVTTHNkUzhNN0YwVzJKcnp1ZHg3S3hoYU4xTldiUTZJaURWNDNqcWkwN2VD?=
 =?utf-8?B?dk1XbDFPOXdMKzRoVmZYMWo4RGJ1WXRzQ3ZIZlhobzdXSTA3VWRoWXZiUUs0?=
 =?utf-8?B?U0lvZ1ZWVVY1RElNZ21SQ21Hb1JhS1NiNHVpb0lKQVMrODVlckp6NFV5enNE?=
 =?utf-8?B?RWUvd21YN3ZXbXowaUsvU25CSVBqcVk2U0Y4d3VWRzBvR0h6RDBzRkkxUkpE?=
 =?utf-8?Q?aTjpkR3kypc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVgvQ0JUOWdNOWZvTjJmWnZ0dndvbFRQeFJWamI0RHdOM2tjR1RCMWRLNHlM?=
 =?utf-8?B?dWxYWWFoYzdrSCt4RkVWWlFXbVZKVWQ5eE5CM09hQ0FoUDY3RTgvYUpFY0Yv?=
 =?utf-8?B?bUY0NzU3aFhmNnVTcWNDVlBUNFl1TkVtQ2M4bGdpZlNvTzlXZXEzYkgxa21z?=
 =?utf-8?B?U3diTFdZRE9jSDZ5eVBsenF6N0ZCeWJWUk9KdWRaQkZwQ1dqdzAyMEhIRVBU?=
 =?utf-8?B?WjBEb1JHNHhaeW9DZnlzQXBSMXh3Y2VxNGFoRzlEK1VkeFF6WC82UTRIR0tT?=
 =?utf-8?B?Q0ZFdjFvRXZ4bmlPYVFRVlZpV0RmRlBJZU9Leno1SmI3a3EyS2tJZEwray9T?=
 =?utf-8?B?OGh1c2lidTNPMnNJeEdPQk9GdkVuSUducHJmTGJzM2VuT3RQSUUwYW1sTGlw?=
 =?utf-8?B?dWJWMm9GQ2FFL2hHZHdnMVJiTlBnNHAyRzB5TVJVODhDTG9JUzdiYk1HMW5l?=
 =?utf-8?B?bm00TkxpS0tJaGtNVTM2UWhYZmdLN1hsSEdWYTVtbS9pYVoyUk9jbUkwUWpC?=
 =?utf-8?B?eXA2RSs0cHBuK3hIWG1aWFNhODc5MmhIb01vWVpXTFV0KzhVNXRRcHprQUtM?=
 =?utf-8?B?TWsvYjFSWEEvb0J2eU15cTIyS3loYkNBdTBIS1h0bmtLZjlzWVZkK3piUDRN?=
 =?utf-8?B?RWxIblVPQ3AyQk1uRDQ5ZkRzUVVTZStBTzNJT3FGMjA3aTlZSk1pQmJId1k0?=
 =?utf-8?B?Um9ZTGFVRTFiZkFaemY3dDlqNEJ6cFNXUTFIdjFSL2JjbkFNZUs0N1lYYnZp?=
 =?utf-8?B?eDJ6VURVYUExYUludy9rVG4rNktyNDdWUURkb1V2S3E1bjVsdFJneWhwZk9a?=
 =?utf-8?B?V3l0T1hKa1lueTdTUHZwa3E0MmhvdzgyMWpINHFHNDduMGpiQWphQnlZaDR2?=
 =?utf-8?B?STQ4THd1aXhzUTgwUHJCdzY2bng3ZG5vUjgyQ0kvMzhpdE1jTGhRWllncHZY?=
 =?utf-8?B?T3F5U1VIenlXOXo3bGVHSGs0Nkd1cUw5WnY5ZGtaZ1VYTFd4V1lHR0ltVTIx?=
 =?utf-8?B?NWV1VTZyd3U4V2VpQjQzQ1gwY0d3V21memN0a2VCTmhsdHFjaGNUcWhzQmhK?=
 =?utf-8?B?YU9Wa0dndHlic3NxNHpRTExyVEl1dFVSeE9mbVZEMEVOVkdRSmJqOVdGeXRh?=
 =?utf-8?B?OExQNnZDb0QzM3UwejRCc3BNT0dYdHVqTENCbDc2T2ZhUThMM0lmSE1vNWhJ?=
 =?utf-8?B?am9ZN3dGNXlxbjlvakFrVDJWTFkyRTRWblhmbmJ6Zk05NkF2NE9seXNMZHRB?=
 =?utf-8?B?Y21rOE1XeFFNcDVVb0ZDZk1hNWlvNmVjcyswOWhJVmhEdDZ0S3Y0ZDdMTHZi?=
 =?utf-8?B?YU1NenBTQVlKazhhclk5R0FnOGxpejJ0MWI0ZFphenA0M0tCQU1EeGo1dGFQ?=
 =?utf-8?B?QWNYUllLckZzbHNHUmNWbTE3RWJPNkFGOG9za1dTV0FoTzA3K1FUYVliWC83?=
 =?utf-8?B?dFcvR1dtTHNTWUtQWnBiT2k2N0txVzVnbFY3VkdBcU84SlhHcG5LZlhaWVRq?=
 =?utf-8?B?TjI5YkE0dEVCY0pibGRrQ0xFOXpXKzVveEdvUzgwUzM0emV2UlRxR1Z1dmds?=
 =?utf-8?B?QVVTT2gzS0U2a0dnR0VkblJBZ1FOQlN6SkVuN25FbXoxTlQ1Y2txbXF2VVdC?=
 =?utf-8?B?aDZVeUptQ3hTM01yMzhNYXhRK3UrUGdjc3BMMEZhOVBibk0xdUkxL3liOWs5?=
 =?utf-8?B?OUxWYm5abGVNS0YwL1o2QjgxVG9FZjJtVVFkbmE1cWZyL2JOamNaSFYzMWtm?=
 =?utf-8?B?SHJ1NGJVcFA2d0FsdHNiM29DbmRrYkdJc1VUbDc3QXZnbU1PRmdFUzZ1RVoy?=
 =?utf-8?B?MlhENWVUMCtsMm5WZk5aTnA2M2pPcjVvNmEvWENBNmJ3VHo3blcvL2lVbTVJ?=
 =?utf-8?B?R1NmWHF1UVNma2JNTlNNUS94UXNBMFpPdzRNcEI1MnhKV0ExRGpZRGxzYzVQ?=
 =?utf-8?B?UThxdHprTEFuMkYvK25YQkRHdWFyblBOaWlER3BNOVB3aHJjSUVkbnA5ai9w?=
 =?utf-8?B?bjBZNDZEQU10WkFSTHRIcnM1UXdqWTRDOENIUGRTOWJ6djlxZ3UzeXBRSWFr?=
 =?utf-8?B?RW5pbkZBM2dzYjZQQnFBOHhVVjN1YjBObzFlUHdzNUQ2MGY5YlgxeTM2NWFC?=
 =?utf-8?Q?k6yLX5M42wbQTqj8E2Ao44os5?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03c091b-c0ba-4979-fd40-08ddb9e04809
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:18:29.0753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yWg/Bjy8UiovYOqveuFnPVMaCI2eTGpyDfv7y9T5fA52uCAttrcpmiEqyIfnEkYKh85imLQTsfa4etZoX+pAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8766

Hi Jerome:


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Amlogic clock controller drivers are all doing the same thing, more or
> less. Yet, over the years, tiny (and often pointless) differences have
> emerged.
>
> This makes reviews more difficult, allows some errors to slip through and
> make it more difficult to exploit SoC commonalities, leading to code
> duplication.
>
> This change enforce, wherever possible, a consistent and predictable scheme
> when it comes to code organisation and naming, The scheme chosen is what
> was used the most already, to try and minimise the size of the ugly
> resulting diff. Here are some of the rules applied:
> - Aligning clock names, variable names and IDs.
>    - ID cannot change (used in DT)
>    - Variable names w/ SoC name prefixes
>    - Clock names w/o SoC name prefixes, except pclks for historic reasons
> - Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
> - Parent table systematically named with the same name as the clock and
>    a '_parents' suffix
> - Group various tables next to the related clock
> - etc ...
>
> Doing so removes what would otherwise show up as unrelated diff in
> following changes. It will allow to introduce common definitions for
> peripheral clocks, probe helpers, composite clocks, etc ... making further
> review and maintenance easier.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/s4-peripherals.c | 746 ++++++++++++++++++-------------------
>   1 file changed, 370 insertions(+), 376 deletions(-)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index c9400cf54c84c3dc7c63d0636933951b0cac230c..9bcd35f12836de5e318fd1ad9c9ae15a2bfc3dd7 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c


[...]


> @@ -1320,7 +1320,7 @@ static struct clk_regmap s4_ts_clk_gate = {
>    * mux because it does top-to-bottom updates the each clock tree and
>    * switches to the "inactive" one when CLK_SET_RATE_GATE is set.
>    */
> -static const struct clk_parent_data s4_mali_0_1_parent_data[] = {
> +static const struct clk_parent_data s4_mali_parents[] = {
>          { .fw_name = "xtal", },
>          { .fw_name = "gp0_pll", },
>          { .fw_name = "hifi_pll", },
> @@ -1340,8 +1340,8 @@ static struct clk_regmap s4_mali_0_sel = {
>          .hw.init = &(struct clk_init_data){
>                  .name = "mali_0_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_mali_0_1_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
> +               .parent_data = s4_mali_parents,
> +               .num_parents = ARRAY_SIZE(s4_mali_parents),
>                  /*
>                   * Don't request the parent to change the rate because
>                   * all GPU frequencies can be derived from the fclk_*
> @@ -1394,8 +1394,8 @@ static struct clk_regmap s4_mali_1_sel = {
>          .hw.init = &(struct clk_init_data){
>                  .name = "mali_1_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_mali_0_1_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
> +               .parent_data = s4_mali_parents,
> +               .num_parents = ARRAY_SIZE(s4_mali_parents),
>                  .flags = 0,
>          },
>   };
> @@ -1433,28 +1433,26 @@ static struct clk_regmap s4_mali_1 = {
>          },
>   };
>
> -static const struct clk_hw *s4_mali_parent_hws[] = {
> -       &s4_mali_0.hw,
> -       &s4_mali_1.hw
> -};
> -
> -static struct clk_regmap s4_mali_mux = {
> +static struct clk_regmap s4_mali_sel = {
>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_MALI_CLK_CTRL,
>                  .mask = 1,
>                  .shift = 31,
>          },
>          .hw.init = &(struct clk_init_data){
> -               .name = "mali",
> +               .name = "mali_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_hws = s4_mali_parent_hws,
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &s4_mali_0.hw,
> +                       &s4_mali_1.hw,
> +               },
>                  .num_parents = 2,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
>   /* VDEC clocks */
> -static const struct clk_parent_data s4_dec_parent_data[] = {
> +static const struct clk_parent_data s4_dec_parents[] = {
>          { .fw_name = "fclk_div2p5", },
>          { .fw_name = "fclk_div3", },
>          { .fw_name = "fclk_div4", },
> @@ -1465,7 +1463,7 @@ static const struct clk_parent_data s4_dec_parent_data[] = {
>          { .fw_name = "xtal", }
>   };
>
> -static struct clk_regmap s4_vdec_p0_mux = {
> +static struct clk_regmap s4_vdec_p0_sel = {


Since both vdec_clk and mali_clk are 'no glitch clock', should we also unify
the naming from 's4_vdec_p0'/'s4_vdec_p1' to 's4_vdec_0'/'s4_vdec_1'?


>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VDEC_CLK_CTRL,
>                  .mask = 0x7,
> @@ -1473,10 +1471,10 @@ static struct clk_regmap s4_vdec_p0_mux = {
>                  .flags = CLK_MUX_ROUND_CLOSEST,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "vdec_p0_mux",
> +               .name = "vdec_p0_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_dec_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
> +               .parent_data = s4_dec_parents,
> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>                  .flags = 0,
>          },
>   };
> @@ -1492,7 +1490,7 @@ static struct clk_regmap s4_vdec_p0_div = {
>                  .name = "vdec_p0_div",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_vdec_p0_mux.hw
> +                       &s4_vdec_p0_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
> @@ -1515,7 +1513,7 @@ static struct clk_regmap s4_vdec_p0 = {
>          },
>   };
>
> -static struct clk_regmap s4_vdec_p1_mux = {
> +static struct clk_regmap s4_vdec_p1_sel = {
>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VDEC3_CLK_CTRL,
>                  .mask = 0x7,
> @@ -1523,10 +1521,10 @@ static struct clk_regmap s4_vdec_p1_mux = {
>                  .flags = CLK_MUX_ROUND_CLOSEST,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "vdec_p1_mux",
> +               .name = "vdec_p1_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_dec_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
> +               .parent_data = s4_dec_parents,
> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>                  .flags = 0,
>          },
>   };
> @@ -1542,7 +1540,7 @@ static struct clk_regmap s4_vdec_p1_div = {
>                  .name = "vdec_p1_div",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_vdec_p1_mux.hw
> +                       &s4_vdec_p1_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
> @@ -1565,27 +1563,25 @@ static struct clk_regmap s4_vdec_p1 = {
>          },
>   };
>
> -static const struct clk_hw *s4_vdec_mux_parent_hws[] = {
> -       &s4_vdec_p0.hw,
> -       &s4_vdec_p1.hw
> -};
> -
> -static struct clk_regmap s4_vdec_mux = {
> +static struct clk_regmap s4_vdec_sel = {
>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VDEC3_CLK_CTRL,
>                  .mask = 0x1,
>                  .shift = 15,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "vdec_mux",
> +               .name = "vdec_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_hws = s4_vdec_mux_parent_hws,
> -               .num_parents = ARRAY_SIZE(s4_vdec_mux_parent_hws),
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &s4_vdec_p0.hw,
> +                       &s4_vdec_p1.hw,
> +               },
> +               .num_parents = 2,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
> -static struct clk_regmap s4_hevcf_p0_mux = {
> +static struct clk_regmap s4_hevcf_p0_sel = {


+static struct clk_regmap s4_hevcf_0_sel
+static struct clk_regmap s4_hevcf_0_div
.
.
.


>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VDEC2_CLK_CTRL,
>                  .mask = 0x7,
> @@ -1593,10 +1589,10 @@ static struct clk_regmap s4_hevcf_p0_mux = {
>                  .flags = CLK_MUX_ROUND_CLOSEST,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "hevcf_p0_mux",
> +               .name = "hevcf_p0_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_dec_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
> +               .parent_data = s4_dec_parents,
> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>                  .flags = 0,
>          },
>   };
> @@ -1612,7 +1608,7 @@ static struct clk_regmap s4_hevcf_p0_div = {
>                  .name = "hevcf_p0_div",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_hevcf_p0_mux.hw
> +                       &s4_hevcf_p0_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
> @@ -1625,7 +1621,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>                  .bit_idx = 8,
>          },
>          .hw.init = &(struct clk_init_data){
> -               .name = "hevcf_p0_gate",
> +               .name = "hevcf_p0",
>                  .ops = &clk_regmap_gate_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
>                          &s4_hevcf_p0_div.hw
> @@ -1635,7 +1631,7 @@ static struct clk_regmap s4_hevcf_p0 = {
>          },
>   };
>
> -static struct clk_regmap s4_hevcf_p1_mux = {
> +static struct clk_regmap s4_hevcf_p1_sel = {
>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VDEC4_CLK_CTRL,
>                  .mask = 0x7,
> @@ -1643,10 +1639,10 @@ static struct clk_regmap s4_hevcf_p1_mux = {
>                  .flags = CLK_MUX_ROUND_CLOSEST,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "hevcf_p1_mux",
> +               .name = "hevcf_p1_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_dec_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_dec_parent_data),
> +               .parent_data = s4_dec_parents,
> +               .num_parents = ARRAY_SIZE(s4_dec_parents),
>                  .flags = 0,
>          },
>   };
> @@ -1662,7 +1658,7 @@ static struct clk_regmap s4_hevcf_p1_div = {
>                  .name = "hevcf_p1_div",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_hevcf_p1_mux.hw
> +                       &s4_hevcf_p1_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
> @@ -1685,28 +1681,26 @@ static struct clk_regmap s4_hevcf_p1 = {
>          },
>   };
>
> -static const struct clk_hw *s4_hevcf_mux_parent_hws[] = {
> -       &s4_hevcf_p0.hw,
> -       &s4_hevcf_p1.hw
> -};
> -
> -static struct clk_regmap s4_hevcf_mux = {
> +static struct clk_regmap s4_hevcf_sel = {
>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VDEC4_CLK_CTRL,
>                  .mask = 0x1,
>                  .shift = 15,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "hevcf",
> +               .name = "hevcf_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_hws = s4_hevcf_mux_parent_hws,
> -               .num_parents = ARRAY_SIZE(s4_hevcf_mux_parent_hws),
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &s4_hevcf_p0.hw,
> +                       &s4_hevcf_p1.hw,
> +               },
> +               .num_parents = 2,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
>
>   /* VPU Clock */
> -static const struct clk_parent_data s4_vpu_parent_data[] = {
> +static const struct clk_parent_data s4_vpu_parents[] = {
>          { .fw_name = "fclk_div3", },
>          { .fw_name = "fclk_div4", },
>          { .fw_name = "fclk_div5", },
> @@ -1726,8 +1720,8 @@ static struct clk_regmap s4_vpu_0_sel = {
>          .hw.init = &(struct clk_init_data){
>                  .name = "vpu_0_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_vpu_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_vpu_parent_data),
> +               .parent_data = s4_vpu_parents,
> +               .num_parents = ARRAY_SIZE(s4_vpu_parents),
>                  .flags = 0,
>          },
>   };
> @@ -1770,8 +1764,8 @@ static struct clk_regmap s4_vpu_1_sel = {
>          .hw.init = &(struct clk_init_data){
>                  .name = "vpu_1_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_vpu_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_vpu_parent_data),
> +               .parent_data = s4_vpu_parents,
> +               .num_parents = ARRAY_SIZE(s4_vpu_parents),
>                  .flags = 0,
>          },
>   };
> @@ -1823,24 +1817,24 @@ static struct clk_regmap s4_vpu = {
>          },
>   };
>
> -static const struct clk_parent_data vpu_clkb_tmp_parent_data[] = {
> +static const struct clk_parent_data vpu_clkb_tmp_parents[] = {
>          { .hw = &s4_vpu.hw },
>          { .fw_name = "fclk_div4", },
>          { .fw_name = "fclk_div5", },
>          { .fw_name = "fclk_div7", }
>   };
>
> -static struct clk_regmap s4_vpu_clkb_tmp_mux = {
> +static struct clk_regmap s4_vpu_clkb_tmp_sel = {
>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VPU_CLKB_CTRL,
>                  .mask = 0x3,
>                  .shift = 20,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "vpu_clkb_tmp_mux",
> +               .name = "vpu_clkb_tmp_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = vpu_clkb_tmp_parent_data,
> -               .num_parents = ARRAY_SIZE(vpu_clkb_tmp_parent_data),
> +               .parent_data = vpu_clkb_tmp_parents,
> +               .num_parents = ARRAY_SIZE(vpu_clkb_tmp_parents),
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };
> @@ -1855,7 +1849,7 @@ static struct clk_regmap s4_vpu_clkb_tmp_div = {
>                  .name = "vpu_clkb_tmp_div",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_vpu_clkb_tmp_mux.hw
> +                       &s4_vpu_clkb_tmp_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
> @@ -1911,7 +1905,7 @@ static struct clk_regmap s4_vpu_clkb = {
>          },
>   };
>
> -static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
> +static const struct clk_parent_data s4_vpu_clkc_parents[] = {
>          { .fw_name = "fclk_div4", },
>          { .fw_name = "fclk_div3", },
>          { .fw_name = "fclk_div5", },
> @@ -1922,17 +1916,17 @@ static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
>          { .fw_name = "gp0_pll", },
>   };
>
> -static struct clk_regmap s4_vpu_clkc_p0_mux  = {
> +static struct clk_regmap s4_vpu_clkc_p0_sel  = {


+static struct clk_regmap s4_vpu_clkc_0_sel
+static struct clk_regmap s4_vpu_clkc_0_div
.
.
.


>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VPU_CLKC_CTRL,
>                  .mask = 0x7,
>                  .shift = 9,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "vpu_clkc_p0_mux",
> +               .name = "vpu_clkc_p0_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_vpu_clkc_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
> +               .parent_data = s4_vpu_clkc_parents,
> +               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
>                  .flags = 0,
>          },
>   };
> @@ -1947,7 +1941,7 @@ static struct clk_regmap s4_vpu_clkc_p0_div = {
>                  .name = "vpu_clkc_p0_div",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_vpu_clkc_p0_mux.hw
> +                       &s4_vpu_clkc_p0_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
> @@ -1970,17 +1964,17 @@ static struct clk_regmap s4_vpu_clkc_p0 = {
>          },
>   };
>
> -static struct clk_regmap s4_vpu_clkc_p1_mux = {
> +static struct clk_regmap s4_vpu_clkc_p1_sel = {
>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VPU_CLKC_CTRL,
>                  .mask = 0x7,
>                  .shift = 25,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "vpu_clkc_p1_mux",
> +               .name = "vpu_clkc_p1_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_vpu_clkc_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
> +               .parent_data = s4_vpu_clkc_parents,
> +               .num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
>                  .flags = 0,
>          },
>   };
> @@ -1995,7 +1989,7 @@ static struct clk_regmap s4_vpu_clkc_p1_div = {
>                  .name = "vpu_clkc_p1_div",
>                  .ops = &clk_regmap_divider_ops,
>                  .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_vpu_clkc_p1_mux.hw
> +                       &s4_vpu_clkc_p1_sel.hw
>                  },
>                  .num_parents = 1,
>                  .flags = CLK_SET_RATE_PARENT,
> @@ -2018,28 +2012,26 @@ static struct clk_regmap s4_vpu_clkc_p1 = {
>          },
>   };
>
> -static const struct clk_hw *s4_vpu_mux_parent_hws[] = {
> -       &s4_vpu_clkc_p0.hw,
> -       &s4_vpu_clkc_p1.hw
> -};
> -
> -static struct clk_regmap s4_vpu_clkc_mux = {
> +static struct clk_regmap s4_vpu_clkc_sel = {
>          .data = &(struct clk_regmap_mux_data){
>                  .offset = CLKCTRL_VPU_CLKC_CTRL,
>                  .mask = 0x1,
>                  .shift = 31,
>          },
>          .hw.init = &(struct clk_init_data) {
> -               .name = "vpu_clkc_mux",
> +               .name = "vpu_clkc_sel",
>                  .ops = &clk_regmap_mux_ops,
> -               .parent_hws = s4_vpu_mux_parent_hws,
> -               .num_parents = ARRAY_SIZE(s4_vpu_mux_parent_hws),
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &s4_vpu_clkc_p0.hw,
> +                       &s4_vpu_clkc_p1.hw,
> +               },
> +               .num_parents = 2,
>                  .flags = CLK_SET_RATE_PARENT,
>          },
>   };


[...]


>   MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
>   MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

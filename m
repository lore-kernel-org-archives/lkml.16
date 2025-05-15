Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0EF4690;
	Thu, 15 May 2025 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336631; cv=fail; b=d08Wm5XHH9ayiwWP6nkNILUsiUbe0DmLRar3l7yWddsUQqMuM+B6nfMm1s+ASt0j7bQYuHodfsQnSb20BNMabHTq32UR2sjU9Dj3wJab51Hnv6sA9n1wJ10tkLOxNUjJwfEu0YTu/BJZWyyFNi/zpaVAtXUfZXmN3F/e4amszs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336631; c=relaxed/simple;
	bh=uoyDfTo+WZBEFr1KtXMtF38neT45DkVvKlTwXYHTLUA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nq4gp5GDo12Lwm2fVGVR7lwwMCnWKTdg3Ru7MOIT4mU2tSOL7f3pSOOs4mjfnyzWDJfx0YlCyJT6qM/29w1tY1gVEJyb4vDQJRdidDFNwJtx2blsHulgc1ArUBruyq0nWxZWYqAGvmOuyhuLkVRYkzDksV5zEXGLqSjK/XlkJQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rkXnPYlt; arc=fail smtp.client-ip=40.107.223.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rkXnPYlt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcVAjkExyQKxZYJUjj0PFb6qboz46x4ZBBjC1Hyazy8VwpEvJ9+ST5COH9ijLhe1ZkK8z58tuI4Wd+ZAD0zbnBKPRA1Lw8V6zkRX9RYUZDjiypCIsNkoMvaKj4kmO2a0fKFgiu96Z9nEIqbWYszICXkssxKTcrmjajcKkIfXv9Kc/6EXxB4BhEp6KeVRnUHp6ax2qEXx6qDJyw0AjVMNRZ0t2MfKkUUVorSEd8m3Ff0Od2Kpey6csdkgTMxO2TAufVEhvFrFu/w9E6a4MMQ48ieQe8LYfw91x0s3JEl/VDSTNTqLeeHdSKwKbV5IxpzdEezq+g56jeDt6m29fulOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCoyiY062KxW8ghblZQE73GfF14AlvogToXc32sfFPM=;
 b=a59t6vqMS8cUxcSrbamIQUGqPrBj1qZowukB6aRFMo1FIN+RDIa27DGOLyF8CnFjPaRRB/iBO/efb7nilam7ziVO34GhCGfCxkHWRmlmSGFD6ARTN2zDwcalNIrJumIZ9MzD/xnEFzEm3mn2r0onSynGpE5cdCedeYlB+McFpGHsDVWJza40MFfhzyFWg/NZ1FKgp4CAAOpinU9+I2eF1vvBo3GPpioZVgm0P5V12Jn3WHFMYJ1qJiWK31ypNgxONXnHw8XbsEb2KbOQnKEEUeobTnpoHpqMSTHNajOTJr/RUqCLF/lKwZIGHiPRX6bniU+pYJpY/ePDe2mH9kXuWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCoyiY062KxW8ghblZQE73GfF14AlvogToXc32sfFPM=;
 b=rkXnPYltXb2vOd75hftI7cxV4Mi406PJ9qF4aLEemQTryczWP68Dt1XWQtiJdqVnAsHiogucxMS3VS0Fu5syIu/Nbfmo+YpQhn9GYl+fvJLRot8ASf4Ji5oIvUe9oK1zGUpbso3XP+y13pKXTp3qDIteOj5Z2Bpqei0t+3NFHUZEUgjPzkBai/S48bk6+uvlninW0JDwxZLKzW76lqwObx+/NDEkZuCD6zBW5NQv/Tf+MVhq3esplCyrbyci21XlLY9jG05qxZUdseOYjAyzM1cFLHBdDatUFwppAgSz6Ob4sku2iiSgHBLvJl3knwIGhroXKosRWBHp/CO5W0pITA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DS2PR12MB9663.namprd12.prod.outlook.com (2603:10b6:8:27a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 19:17:03 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 19:17:03 +0000
Message-ID: <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
Date: Thu, 15 May 2025 12:17:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: add basic ELF sections parser
To: Timur Tabi <timur@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com> <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0184.namprd05.prod.outlook.com
 (2603:10b6:a03:330::9) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DS2PR12MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5aa70c-9c56-4a09-b5e2-08dd93e512f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mm16c1ZFcmMvT0xHZUdhWUZ6dUVuaW5IS0tjWElsSHFOdFgveEtGdUxLN3lJ?=
 =?utf-8?B?V01vVjZ0SEJXSjUzV3FUMVpYMzdIZGZ0M1d5anpKWEpGMmtRcVpJV3luSjlK?=
 =?utf-8?B?Y0twb3YvVm1EYnA2MjdxRG1nMnowUUd4VktJNjh4S2FwR0FvaDlpbS9BZUlj?=
 =?utf-8?B?UHplZ2FhK1YybTdCSjIzVlBGT2NJLzdvVTIyYjBTVVZOQmJQN3JLam4wcXA5?=
 =?utf-8?B?SmRsVUp0biszYjBZWW5yc04yYUlDZFdnK3FPeEVJL1ZiUGdqQlJuMWFQcWhJ?=
 =?utf-8?B?TGlURTQ5Zi9FRW5wQkV6bkZzVUIvNnJUWFVMWVoyYjRhUTZyY0pGQmlJcmU5?=
 =?utf-8?B?Um55RnlBekV5TDloQTRubDZGQUFPZzIyR2U1eDB0MnVGcHRhQW9hZHduWHJJ?=
 =?utf-8?B?b2M2N0ZpdlJVTk5tZEw2RTNiR3ZVd0Z6cFplQzdSb0dWSHRPMzhpZjByZVAz?=
 =?utf-8?B?YjF5NUVoWHVHSU5Kamk2MVJNT2ZQWGpvQkpPUUhpSXhaWWtkbWtYR3czcTVy?=
 =?utf-8?B?OGxtWXVadHRGemIyTlVZdWkyUUlYVHF3V1lPTGpmbDkvbzgwQWI0amdDMGpF?=
 =?utf-8?B?a2xrMmxBdXE1YXZmMWJHSUF1UitCMjFjUWxQbG83QW8rdHdDRXZWOHRKUFRP?=
 =?utf-8?B?SjJVTUFSU2ladElodktrUC9kRUNpYVpqcFp1emlDaEVpaDZxK1RRaXgxTVpX?=
 =?utf-8?B?cjRkVGo1eDFWelRmWE5jQlAveFM5OE1SZkpuNnI1NmNjMUFVdVBPZUpSVERo?=
 =?utf-8?B?ZVZYbTV2aStHUWZhN3J2c0drMEtaQUJZZTY2MDNuMjV5VzhmblpRVHJuTVpM?=
 =?utf-8?B?b1c5dE82SWVwWWc3TmdTQ1ZJdXF5cWVFMFlUb2JvTGE2WEg2aVRYSWZrb3Ix?=
 =?utf-8?B?SS9wT2VhM0RScU9QeGNVdUJNK3UySTMzdEl1K216U1NxcytORTN2Rm9GNTA0?=
 =?utf-8?B?b2FvdUtSZHFZQzhhaHhqaGFXd2dNQ1o4aC8rbUM2UzRuamhSNUhTcEhjcnp2?=
 =?utf-8?B?bXhuYkM4cllERFhZdUVCV3lKME5JS0ZzVFFzTVdqMEJkU0JoOWs4aUc4bWlI?=
 =?utf-8?B?UXRYVHI2VjQvemFBVUl4eFMzMXAySjBrNU90NFA4RTgvZ1QyNzF6MmJtbm5x?=
 =?utf-8?B?WXpEbEQxZUxuR2x6eCtESTE0M3pNb3IrM3l1SXUvQVYveTZwaHYxcm5zNmt5?=
 =?utf-8?B?WHo5Ukc2ZE1kdG1Tb0tNMjFGYmNkcFZ6bWFiTXhuSzNNYXh4ZDBrR2dpU1pF?=
 =?utf-8?B?TzZNeTl2aHpFRFQyZGFXVm1HK2loVWgzUlRWeWtOVG5CVHFGQURTQzhtZExn?=
 =?utf-8?B?a0llRjFMYVF3S0QyeVRCNVlYZXBKWUZmQWljdE9rL1VSZzBTTWhFbmZkSXpn?=
 =?utf-8?B?SVpEeitJVlBoaEJSaEpFb0RuTC8yVllsdEZtNkNhcW9UMWt1NTM0clE1dUZr?=
 =?utf-8?B?MkxGSnhQNCtwSHhYSVJVbWVjYkFVNTJ4SnJRRVd3T0RzMHM3MmRRVmZJVFpW?=
 =?utf-8?B?UEtUd2ZSZ0lHaC9vOWFlMDVIc3R1YWc3ZUpINVBJQ2tOcHFheGluRm1RMVRT?=
 =?utf-8?B?QS9DMFBRTEtMcm5VaHlsd3habldMRGJvZ1YvbTQ5UThmMmQ4NmJLNG9sQWw5?=
 =?utf-8?B?SGNIT0ZiSS9iSkVLK0hRNy92aWJGQTc4Nm8wMnFLYk1Vc1MvWjZhM3JYMlpa?=
 =?utf-8?B?Ulh3MmJGOUVIWXI3ODNGd05TTVMzWlk4NGg0ZEJaSU9XNE9PdEx0cjE0bzlN?=
 =?utf-8?B?ZENWMStHc2xlYWlreXVvL2RiSGxlNE93ejRiWU9KcGdKT1RNeHZxNTNUUHVu?=
 =?utf-8?B?Y0RCU0k0Um5wbDZ1UTMxWEszOE9KZy9FQlk1eE1qNmRXdDJ1bk4wamtHMm0x?=
 =?utf-8?B?ODVMZ2tESnIrNzBJRDJtbVZLekNmU3E3Titlc1NtL1dMZ2FLVlpXNDRtV29r?=
 =?utf-8?Q?7vD3icBVm8s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEpEMldqSjF0a0Nzb0RHcWNsTDNGMFQrWC9xZ0Y5STFieHI1ajdxMEo3SkpM?=
 =?utf-8?B?ZDVUZWpUVzN2clV2MnpWQmNmaGdPeTUzenBTTkJWSXc0WElVY0hMbkZkZkVX?=
 =?utf-8?B?bStxUU4vSEJxSkhRbjVUeURMaytpdTJGT1Rsc0RBTEYybDcybHR0bzZ4ckl0?=
 =?utf-8?B?dXYwRG5ZY0JnNVIvbHZ6T3E3RGt6bUpNT21wdmo2SHFZVjZ0ekxjTTgxS3I4?=
 =?utf-8?B?SG5YTXJiUGpFSVpKK0I4SUw1NlI1ZUhPclNYdlVSejY0Tk5DZ2h5bWloMVVQ?=
 =?utf-8?B?S1k3aW9ya0tmekZ4Nnk4NGF6MDE2dGJRTVpTeThwMkw0MlJsMTg1MDlWOUtz?=
 =?utf-8?B?MjhqNTJxbmFnekxoYjVXYnZPTzBkYWJpclovWXcwakJtQ1dsQTMwdFBjQ2cx?=
 =?utf-8?B?YWdrM0RzaG1KU252bDBuMEtSTldHeEo4VUQxdW5lbDJhZkliOWE2dVp6ZlNY?=
 =?utf-8?B?UlgxU3g3NUxFMGxoMGtWV3hEekF0eEVWam80dEhUb1RiSUlkWGFGZWptVkQ0?=
 =?utf-8?B?UWlZejgzZHE2SWFRT3BiamEyM2NxOHlXdWloRVJ5ZEtNTEpDaWJFR3ZESXVh?=
 =?utf-8?B?Q0dUWVdmRy9mcTZDZmZsbFM4NmxwalFJVjhsK2RDVm9aWFl1eUhvNDdwdVlT?=
 =?utf-8?B?dzZyMWY4bXpmVHdKc0JWN0F2dWI5VzRFbnYzTGNCWHhONXFEYnhuTDF1djhn?=
 =?utf-8?B?ZmwzK3BiQm16Q0hjdVBBQTBkNVBFTnViL3VVWFFoa2dUbUc3OERJSTVRQlRK?=
 =?utf-8?B?UkVBOFlvN1ZqMGFvQmZWdnVNd0RxYU01L3hFUFdYNHU5V3lUUVY0bnVOZ1py?=
 =?utf-8?B?Tkg3ZklEVGZyQThWT2JrQ0hzOHh5WS9Tck1LODlaYkZLM3d0dHErUk90eW1q?=
 =?utf-8?B?MVo1T1RON3JhN2RGalkvcFN3WlEzK0U1SC94cnRsdTN0WjVvR3VVZ21abDFk?=
 =?utf-8?B?RDVVYVF0OHRseHMxSVdabE1tWUIyTk83WmMrb1pMMGdoa1pYY2tJR2hWVUVF?=
 =?utf-8?B?cnZKZklIYUlTZVYzeUJEY2ozenY5SmlFYkNmVlgxVEVBL2F3TVBsS3F4K0Er?=
 =?utf-8?B?d0RRODViTU1yTXNrM2I4NXN4b25mWTdEZ2gwQ05GdkdiYmpFMEdEZFJZS3dy?=
 =?utf-8?B?Rzd6VEtqbjU2SG5HeW12VWo5YlA0bUtCd3dDOU9wN1lhZHh1M0Q5VlRxeUox?=
 =?utf-8?B?aXg3dFRnc2VOcTVWUnhlZ3lhSnZDNXpYejdLMFBvMHkrRXdGYUZIUDZyaExG?=
 =?utf-8?B?MTMyMGZWWWRZV2tqS3VuTE5Vc2JCVStSd2lSekRXWjUwRVRzRTNralkxUEFw?=
 =?utf-8?B?NHBZYzZRUHlkVzRxbVdMOG5WYzEzREdoTVZwek1ybmZtaFd4ZWtXeHhQNDNZ?=
 =?utf-8?B?RVFQcEx1c2Z5dmcyRVBtZk02MzRNeUFzRG41SnR0azVsaTg4dlRCVE5YdUdL?=
 =?utf-8?B?NUFTeHRVTmhLQ29xYzhmRGZNSCtrMDNhV296ckpMQ1lTS2ozVzNCOXp0dXNq?=
 =?utf-8?B?Z1M2VitsK3ZkTXpXWVZpSXRMTHJXSjZxMW9PUFoxL25zL2RyditlMTlxT1dB?=
 =?utf-8?B?VXAxWmhlaTM1OSttK0RrM015S2p2bG14WnI3U2xzbWVuaUQrb0lYc2tQY09Y?=
 =?utf-8?B?SGVDNFFXRkRvU1FobUxVaEtrQnljSnVqQjB6alNDWExzYWowY0VXdmJhdE1W?=
 =?utf-8?B?YWx0MDVqK1htckRyT3U4eGZuSExxSFdVME80THI1TmtYKzViT091Z05lUEdR?=
 =?utf-8?B?MGdaSEovcTE2K21WUFJmT2Rac2ozL29qY0JIWkk5WEU5UzV5emZtcEp1K3lR?=
 =?utf-8?B?OFhRNGYzSXZyWlpxSVVNYnNmb0VnSUlDLzEyN1dQV2NzWk01VTdnNmRXaXRQ?=
 =?utf-8?B?TFV4MXpZRlNIQ0Vtem95RjBkdVd6UHlPRVN2dU1DdWhRbFpVRjluMDJ2Ujdu?=
 =?utf-8?B?cXNVeXovQ1FTUTFpeC9QaGRuUzVLY1FwenliV2dJbGZOVlFxZGRQWDU4Qnkx?=
 =?utf-8?B?NUFQRXNUMUhWMnZoSm9iRUdXd21yTnM2Zzc1WDRrT1Jld2pGejhqc0RyQUtl?=
 =?utf-8?B?Q2tLWHphY1JuZDRQUG9FK3R6bjNXdytWeWFsTW0rb04wYjhMeSt2cEpCQVhK?=
 =?utf-8?Q?0KPDPn1QU3HvFXR8/jI4lVOQe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5aa70c-9c56-4a09-b5e2-08dd93e512f6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:17:03.3386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKhY9ggxcdiIj1pCOid9Ug6FL2iJH/rcff2Ci72UfltrDSJhk5xoGNJx5AjC2+5JK7IAWsAC1/v653etvckNTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9663

On 5/15/25 7:30 AM, Timur Tabi wrote:
> On Thu, May 15, 2025 at 6:43 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>>> Or if ELF is the problem, I don't mind introducing a WAD loader. ;)
>>
>> The "problem" I'm not understanding is why does the kernel have to do
>> any of this parsing at all?
> 
> Nova will need to parse ELF headers in order to properly load and boot
> Nvidia firmware images.  Nouveau does this already:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c#n2931

Hi Greg!

Nouveau influenced us heavily here, because having firmware that we
can post once, and use everywhere (Nouveau and Nova), is very attractive.

Alex and Timur discuss other details that explain why the standard 
user-space approach is less simple and clean than it might appear at
first glance, but I wanted to emphasize that the firmware re-use point
a little bit, too.

Oh, and also: the ELF images are going to remain extremely simple,
because there is nothing now (nor can I see anything in the future)
that would drive anyone to do complicated things. For example, if
there is some exotic new thing in the future, it could be put into
its own firmware image if necessary--because we understand that
this parser here is intended to be a simple subset of ELF, and
left alone really.

thanks,
-- 
John Hubbard

> 
> In addition, we are adding new ELF image support to Nouveau to support
> newer Hopper and Blackwell GPUs:
> 
> https://lore.kernel.org/nouveau/20250511210722.80350-55-bskeggs@nvidia.com/T/
> (grep for "elf_header[]")
> 
> For this new code, I used ELF for new firmware images. I did this for
> a few reasons:
> 
> 1. In addition to the large GSP-RM binary, there are 3 "meta data"
> blobs that are very small (<100 bytes) and I wanted a way to combine
> all blobs into one file to keep things neat.
> 2. I didn't want to invent a new encapsulation format from scratch.
> 3. ELF allows you to use existing user-space tools to parse the file
> if you are so inclined.
> 4. ELF contained all of the header bits I was looking for.
> 5. I was even able to include a CRC in the ELF header, for extra validation.
> 6. Structs for the headers already exist in the kernel and are used by
> other drivers.
> 
> 
> 
>  What does it do with these segments that
>> userspace can't do instead?  Why does patching have to be done within
>> the kernel at all?  What prevents all of this from being done elsewhere?
>>
>> And ELF parsing is "tricky" in places, and you aren't using the existing
>> elf parser, as proof of needing a new parser in rust :)
>>
>> thanks,
>>
>> greg k-h
>>
> 



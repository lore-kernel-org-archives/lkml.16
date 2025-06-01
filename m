Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900181FDD;
	Sun,  1 Jun 2025 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748780598; cv=fail; b=aE17FRmNKdWhBGsgUufyByU3PNxdRqvH++jg9H1mzihrLRdLj2RQXpTuhFbvErCpxia+nWdzSe38bd/VJUEP22fvKmiRKmyYUwv9puFM2hd0qscnToBtNw5xSFclQsBaI2MKZEQMPa9E14DyHlPjyrrkUOsSmLt399vxMPFpTBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748780598; c=relaxed/simple;
	bh=VH/+SGgEq542rljPG87Sndja5394DnHlm2HGbl1kTM0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Egz0nNmM1+OUEB0WgRyMo5QQl0bZ8dlz2EtpuBbGGpwxxeVmh03/h58gTc1r1b8HSRT5BwP8M/myWMQGnIq7ekOcUm9g7fMq8VNQ8/ZJGalpOVIVkcCucM+IageL3qydo0o6oVTQ2zeZa9P8T2YmoPTVrbrFTIdVqNeoXeha5pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rN0b4Yak; arc=fail smtp.client-ip=40.107.93.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rN0b4Yak"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWk2f/7UFJUvZgFX1kRtu/rojPW/cZMWDMiadL5QOWEbNcCKrujyHUS1L32OCm1+bbrs5XudPc4RS3ZErhpeMTbXOXyTxwJyp+JzVxIIRIMd39HNzW0zK1AXcPAvsNeZ39zC7lYIaCciPTV3ze7dgfFIkN3TMaA+zb3du7OeRvKmHeDO++gtyGQIksFxJX6ErL4/3aLzmaO1DOiYjMn9NRUP4y+5D5FnlU0sGs4ul5EIjMsOAjJVfCn6XynMr9q3F8Xay4/CMvfilZFWhLmu7zDv0o9X1UUiSMqZQurKP5zZGVTV9sIKQsFijZtmbdfOlk3bbf3XM1kzf62cIah/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLlxiqkhKeIQ3u4nfS3lmY7C5ZJ8w09ChctbIcPRF+s=;
 b=VWLKmd+LaQxn3nCTyJaAd9TDfPOMklKWJ8+TiMAWPDU9uHhChxyzVO79caJKiWE8Ar9X99ezTX98tL/KpjgNsE73h/QnNs3znSoVELTMPz3fxLMU9RCIH6RefukF8bMpTSAA6IuNG4z7YKYw9lKm9GTsQxRE6Tdsts5/3TXb+xtOqz2wF30OkRecOFuUMRsOhAd/kHAe7GA+ZyL6ePhJoxojhuVG4msSKon18tV/0FSyWmDgzDLLZBOG2oh7vQgdEUI3GWWM7acRWt5ett6XFjAU/sZriVySJVDOtXDfAs+XB7rbbggMYMB32uwMW7YMVUGLTq/cjE8VcCbDPmXPvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLlxiqkhKeIQ3u4nfS3lmY7C5ZJ8w09ChctbIcPRF+s=;
 b=rN0b4Yak0EkeS6TZQX4F5MvQyb2uGhxwys9P9jAKWz7CWSKCVQc7Fr41hICREPAc32w7lBLs4vdgCAFMXG76Fcnf0WgrdRM3lwVEDhlfJSz8Jyr4/pLGxBv31kjsgu3SRjJ+7W63FGS1JL88WlsNTX8LtE8zkNefjrCXM++ERMtR3VBRcyfH30dHLZbopSzMxqtUk6391rNa2Tz5RxH1ni4olNwmyMM7l6I+HiYroQ0fKBNUllWoWqE3lo50H8Aj0LAdbsNtzR1BYoGlaNRZhIrmSBAnQtnCHljbEXEJx7vuzK1q38Pt9NlVRrtLwzHCMR8WNBYrFBezzWSc+QYz6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Sun, 1 Jun
 2025 12:23:11 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%5]) with mapi id 15.20.8769.031; Sun, 1 Jun 2025
 12:23:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Jun 2025 21:23:07 +0900
Message-Id: <DAB6ZB85697W.2FPRLBGFCHGAJ@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Timur Tabi" <timur@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
 <DAACKTM8B9A1.3SI9LRGNMSBH3@nvidia.com>
 <2025053117-snowy-tradition-eb9e@gregkh>
In-Reply-To: <2025053117-snowy-tradition-eb9e@gregkh>
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DM4PR12MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d35ee8-44fb-41dc-a6dd-08dda10712c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnlhY0VjYnhIZUpuVldGMEJTdWhrcms3WHFQU2Z5MkM2MEg3aSsxNTFKNnZw?=
 =?utf-8?B?SUllWFFQZE1tWDVGeHlnWXd0T2o3NXFGbkZhTkppczhvUW8xZzAvd2RjYVow?=
 =?utf-8?B?eXNQUmN5Y3JXQzBqWVhjNldON3IxV1BGeldTNGZsNVJLVDM5ek00Nm41cXI4?=
 =?utf-8?B?ZElNR1dWUFZOR1pIMHBPRnJLZmF6SWs2SmZkamxNYkl4TG9ta2YxQU1vQnJI?=
 =?utf-8?B?UjZDWnFCdGw2Yis4YzZmd01iUzNlOWJyNHR6ZHN0djhUUHhrc0t5dlNVUURY?=
 =?utf-8?B?SnZESm1XQjZ2ZUZMS1RVVEpwMGJjdVp4TFM0SlU5ejlmcWJydUVlMVg3U0g3?=
 =?utf-8?B?OXppamtTOUdBWkdrYzlsYkNtU2RUdGdobnJ6QjFNQ1lrVXczT2JkK1Qydzhm?=
 =?utf-8?B?aVJYL3Y1citVNzkrWjZSVXFCL0ZjV2tVOTFtRndWejBHWm40RDM5L0QrZVhZ?=
 =?utf-8?B?OVlVMk1TM09EZlhwWDM0REdqV3hVb0d1L3pOZExVQlRlZkxkMTBnQS9SMXRG?=
 =?utf-8?B?bzJNaTlja2c0UGorTFpPVlFtdmFSK0E4Umc3S0VVUWo1Mi9FbFBnd1dFOGpE?=
 =?utf-8?B?RGJaVitYd09tT0JSemRTVDNWSEZYYVhnVldIS1cvSk5TZy9jVlJ5U0VKVDdv?=
 =?utf-8?B?NEJNWHljTnpRZ0ZyWUlib1dVMTlEd2dwdFY4OXp1VTVvR043SFdKamE1Uy9J?=
 =?utf-8?B?bExBSlYyVjBGTjN4cThGckUxcFpJa1R3VUtNQm1melhMVzZjdkIyQXVtZERD?=
 =?utf-8?B?c082Ti9LYWJobGNJeVNKaEppbkNXd1VVZkJCT3NnQnlIZWFrQVNBQ0d2U04y?=
 =?utf-8?B?UGRMbFpNUkMyNEJ2azU1aEZQNk9DM0MwVG1oQm1mY09WUFpKeUFZQ21Hc1Rm?=
 =?utf-8?B?S08wQ1RCVDhRSm82dTlTT0J6aVJRYkRrU2lYMGxZTVkvVjkxMmdvcW5QeVM4?=
 =?utf-8?B?NWhIcFVNcTZacXdhRlQrMXkxWjlGVXFWTUNXOFpVV21sckRqSTNKbzRaWHpD?=
 =?utf-8?B?bXAra0VXNVBZa0JYWm8rOHo5YzhFdDFHOFNTT1IxZTljQzVWTDVPTjN0bE9K?=
 =?utf-8?B?MTRaU3hHL1hWNkhEaXlnZ3dtTHJ3UVJWbmxsYnRNU014OXJ6UWpVcWVneTYw?=
 =?utf-8?B?dkdwYlhoVytReEsxUU15R2o2YU9VbnowTTMrYmpURWs2NTVpTjVMZmZUcFlM?=
 =?utf-8?B?YzYwZTdwRERlSXB5a2o1cHVuN1YwYW1zM01uS2M2RzhmUEhnbEFNVkZkVmhW?=
 =?utf-8?B?eWZkWGtKQ0Y0RkpRQW9PdVA3cCtWY2NvemllQmhEM2U2aFNjbnFoYjU2cWk2?=
 =?utf-8?B?ckZnMWFwUzJJZUVBUVdzMkJjOFVUOE9XS2lnZ2ZuTFFPdjZKbHlWYkkxTTZD?=
 =?utf-8?B?QUp5OTZUTlNRemoyRFh1TDY3Z3EzRjJOcU9qYjVIWTE5VlFYek9IQWVjaGJx?=
 =?utf-8?B?bWE2MWFUcjJUZ1p5N2dkTUk4NVdMdjVLK3dGZUNGa0pKeUx2QVFpaUJtRk5h?=
 =?utf-8?B?b0pyUStFVGUyWEUwVmFJMk9zZnhzV1AzdVZ5ekh1N01kMlI0OTRheDYyU1hG?=
 =?utf-8?B?RWJFZitSYWxuNTdKL3RZUzVhV29EdnlzNjFBSVA5RHp1RE5pZjR0NXpKTmFG?=
 =?utf-8?B?eEVwVnVFeWdnNzZRd3MrbmdiVDBYUVRIWTIxS0wrWkRaRkUySE4xeCtaRmNr?=
 =?utf-8?B?cFk2TnIyUE0wOGFVMlVmdnUvSy82YVdlMXV1Tjc4U2J1NFNYMXY5c2swRWh5?=
 =?utf-8?B?QTdYQXpiMUFOdzJpcmVscVJwUmF5T3ZtWUpzTFl1MmJPWWFmTTIzRTFoTlFv?=
 =?utf-8?B?UXJyQjJPVkJUSzJmeklPeVQ4YWM4Sk1CMExQWk5CWVNDTXA5V2VGNG5MUW4y?=
 =?utf-8?B?amdnYzV5aDZnM1N4eW9PZFRSYkhzUlpLRFFxeXFCNVRrWGRFclFmamhyUi90?=
 =?utf-8?Q?iLdunyBBLB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHlWNU1CWVYwMk94cWhGUE5CckV1WjNrSkx3blY0eXNBOVplek05TzNMNDdh?=
 =?utf-8?B?UkxjaUNVa1BJdDlidW5NTmc5K0hQeFovWGU1RUJrTnFZNDQ2aEVQUkFBZmhn?=
 =?utf-8?B?Z2R2VEpMdUFOODYxRXByMHpoU01EUEdEWEVWdEZ1SldjbFRmU0pWaXBQSzds?=
 =?utf-8?B?NVZxUEYxQW1UcDJFQzlYNmFRYjVCcHcwZDJJcE1BL2d6MDAwdkNyUk9zdHBX?=
 =?utf-8?B?OWZLbEdDZE1Edzl1OHJOQmlrMFZSY001K3FGakdQNTU5Zjl5K2ZUQm56aTY1?=
 =?utf-8?B?U0wzcVh0WEJTM2VYVmRKYU5FTkp3WnlpTjN5OW5HNW16Tm01Y0g1NFFwVzlk?=
 =?utf-8?B?Z0VDS2d2UTVRSnpyWTEzaXFsYUEyYktIMUtlZFpQWHZmSE0reFJrTTA1eFh0?=
 =?utf-8?B?S3dUbVc3dTlKYTByTndvZENiSERkdlNQRm05RlhRc01VTFJ3TUpaakd1UUx1?=
 =?utf-8?B?bXdRYnRUUzZONTZ2QTlMYWNrM0JzdWs0dzlQOUQ2K2NUSkZxU1ZwWFpTWlpS?=
 =?utf-8?B?RDFBUUNmL0dxR0Nhc1lJTmp6MGhjWEJ3bEE3b2UvaFZBbjZRZ3FNdDdZdDdJ?=
 =?utf-8?B?N1BhZWk1NXFGRjI3UUd0bXhEUlNmWWQ4RjRJdzA3RWpHTTdhZlg5R3NJZVM0?=
 =?utf-8?B?a3lsUXR5TjRKYmt3MFdRRDlIN1NER2sxeHVLaG05TC85Y2ZrS2xiWWw4TVBP?=
 =?utf-8?B?cVM1amFJNUhLY0pQRlcvWmR4VGM5MzViNFFQS25NWnZnZzRoR1NuanEyU25h?=
 =?utf-8?B?QUxKdVY1b3E1Zm9BUFdEMzkzdWZzSU5NUWtxeTJtSkpMQkZYcUNMWWpDbW1L?=
 =?utf-8?B?Um5xclR5WkgraGN3bVFtYk5sMlhaWDROL1FZK0tVamFJUTFUSWt5YzIzR2h1?=
 =?utf-8?B?WVAzWDFxT3hEL2JnSEdHZnRLQ0pJbXlPMUl5eXJUVXgvdjhFb1pQWC9NVi9V?=
 =?utf-8?B?ZDNWbUxkcjRBTlNsTzlYSWYrUWpkUXNLTEVmV3V0V2hLbTNDVXFjTkU0Qkto?=
 =?utf-8?B?TC9ZTmV0Z25CMDB2TzhrNGEwbi9Obldyd1FrTUJONUhmOUpEYlNmTHFZODAr?=
 =?utf-8?B?U1FmRTUzTWowQStvVDg5OEY3MWRQZWFQekI0SFVRalZpNW5wWkwvRjllR3ov?=
 =?utf-8?B?RmQrbmF1ZTBPM2RxM21QaGRXZitrT2Z6aFRGSm9aQzU3WXBkeFgvUkhPMlhY?=
 =?utf-8?B?QjFMR3pKQkJIOHlLQ1oyUi9HYXlzY1BYNG9hRGZFL044QjVoSjR0Y0pLSXpx?=
 =?utf-8?B?UG9Vamp5bTJNYnYwYS8wdnlYSk1Pd29LUFFhQUFyRlRZMldUUUhtWHlQQzJy?=
 =?utf-8?B?OWFjSmhXQnQwdzVxek9ySytZY044OUUrUnhTM2Vma3ZVdUZQSzhOUGdpT1Jv?=
 =?utf-8?B?QUh1TVgxcFFOMWtQZ3k5aXlUOFRYdnJ3ZWl6WGljUU5IcUUySzlGb2h1Rnly?=
 =?utf-8?B?U1hEVTRHYmZEOVZ1NjFrVTZsUkZ4MmdDQnV1UE5yT1paaUE1OE00V1d3eWRx?=
 =?utf-8?B?TkIvbTByZnNJVTM5RHpMaENzTXJKSkt4MTJoak41Qy94Sm40bkZqS0p4Tmgy?=
 =?utf-8?B?d0k5UVh1bEVvRzF1UTkrWXdadHQ3UGdmeTJLVnpHS3N2ZkZFMzVGbmFMZVZu?=
 =?utf-8?B?VGlSMEdJZ2FlZUI4SHFENnZsTHdWaVNUUHhoNVc0enEyNzRVSWwwN1hFZzMy?=
 =?utf-8?B?TitHMXFuMlpuUXFsZldobnNaZ0J4VTNhY0JxOEYwYkZCME1SRHhXTXMxMVNK?=
 =?utf-8?B?V0FiMWlYdlNqdExtQWlVRGliRmkwZEZvUUJzOEhzRHhyUkNma3lzQnJBYXRV?=
 =?utf-8?B?ME9uNWd5UVpRakE2bGh4eTQ2dGw4TnV2aTdlSXMwZDYvVTFmbGVMcW9TMEhi?=
 =?utf-8?B?ZjRVQVNpcTAvZzhwSGE1VENwaDZEaUVWME4wQzc3b3hPQVhZajR3eUM4N3dl?=
 =?utf-8?B?SVhNcXZFanh1dnlPQ0ZJWkFMb2p1bm5ORzZnS0MwM2dNRGwyNkpBZTJsWmNS?=
 =?utf-8?B?UTF0Ui9vVEdXYmFiYVBUQXUwMlVMMXRrdzBEOXhua2FkQ09xcVNHbmFCcmhK?=
 =?utf-8?B?a0FTRFJBbUJtQkJhWGlXVXc5cjJqbzBOVEhySXRDS0FCa1liK2dKWnNwQXdC?=
 =?utf-8?B?V1dJKzEyQlZLZXlyb25rVTRzM2tmeFEySEQvSW9mSU9tZ0M0N0I5dnhnY0hQ?=
 =?utf-8?Q?xD/KdqXT+F/nlNdunOYGh+MLbTNLhL43S6Y14MAngWXP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d35ee8-44fb-41dc-a6dd-08dda10712c2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 12:23:11.0857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8SDCQf1xuVUZPXvytxvBPsDpfRSOxz3j/e/j11B3X0FAFBmXOLrZ8R9TFJOo7J8lwl5862uXGwQ9zj53DaPPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616

Hi Greg,

On Sat May 31, 2025 at 10:30 PM JST, Greg KH wrote:
> On Sat, May 31, 2025 at 09:33:38PM +0900, Alexandre Courbot wrote:
>> Hi Greg,
>>=20
>> On Sat May 31, 2025 at 2:45 PM JST, Greg KH wrote:
>> > On Fri, May 30, 2025 at 01:10:50PM -0500, Timur Tabi wrote:
>> >> On Fri, May 30, 2025 at 10:42=E2=80=AFAM Greg KH <gregkh@linuxfoundat=
ion.org> wrote:
>> >> >
>> >> > On Fri, May 30, 2025 at 11:34:02PM +0900, Alexandre Courbot wrote:
>> >> > > So to try to answer your question, I am not disagreeing that user=
space
>> >> > > is capable of doing what we currently do in the kernel. My follow=
-up
>> >> > > questions to that are: how do we command userspace to do that wor=
k for
>> >> > > us when we request the firmware, how do we provide the result to =
the
>> >> > > kernel, and is this something that distros can adopt easily? I'm =
happy
>> >> > > to consider doing things this way, but would need a few pointers =
to look
>> >> > > into.
>> >> >
>> >> > Again, look at how your firmware for your devices in your laptop ar=
e
>> >> > loaded today.
>> >
>> > Note, I am talking about non-gpu firmare images here (wifi, usb
>> > controllers, etc.) that are using the firmware download subsystem for
>> > ages as examples of what to look at as to how to trigger a firmware
>> > image to be loaded by userspace into the device.
>>=20
>> I would really appreciate it if you could point me precisely to one
>> example (a link, a function, a file) of what you are describing because
>> I'm starting to wonder whether we are talking about the same thing.
>>=20
>> Previously I mentioned udev and CONFIG_FW_LOADER_USER_HELPER, but you
>> haven't confirmed whether that was what you had in mind or not. Assuming
>> that udev is involved, I tried to snoop events while a
>> `request_firwmare` call is performed using `udevadm monitor`, but that
>> revealed no event related to firmware loading. Then looking deeper into
>> the kernel documentation confirmed that the kernel does indeed a direct
>> filesystem lookup in request_firmware [1]. IOW, the kernel looks for the
>> requested file, and if it cannot find it it's game over. This matches my
>> observations with udevadm, as I tried requesting a non-existing file and
>> no uevent was generated. I don't see what user-space can do here.
>>=20
>> I also tried to look up this "firmware download subsystem" you
>> mentioned, but couldn't find anything under that name - I suspect you
>> are talking about the sysfs loading mechanism, but AFAIU this depends on=
=20
>> CONFIG_FW_LOADER_USER_HELPER which doesn't seem to be widely enabled
>> (not on my distro at least).
>
> Yes, that is what I am referring to, as you all seem to want to do
> "complex things without a specific filename choosen".  Look at
> Documentation/driver-api/firmware/fallback-mechanisms.rst for the
> details there.
>
> Or, better yet, just have your driver name all of the individual files
> that must be loaded and then no userspace things are needed.  That "big"
> firmware file will have already been split up into the different parts
> when you write it out to the filesystem, so no need to parse anything.
>
> If this isn't going to work for some reason, I think we need a better
> "this is EXACTLY what we need to send to the hardware for the firmware
> image(s) it requires" as I'm totally confused based on the different
> people talking on this thread about totally different hypotheticals
> (i.e. 12 line elf parsers in C vs. a giant elf parser in rust, random
> hypothetical hardware values that userspace "can not know", pointing at
> obsolete crazy interfaces like remoteproc that just happen to do crazy
> things, etc.)
>
> So step back, come up with a solid design document, and let's start over
> please.

Sounds good. Let me finish evaluating all the alternatives, gather the
pros/cons of each option, and lay out the context for our needs as
clearly as possible - this should take a few days.

Cheers,
Alex.

Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DA12BD04;
	Fri, 16 May 2025 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401985; cv=fail; b=ZoRibZd5ze0t3sEWq2swx0MUSFbftPyTk7nt6y0mVrSmNK42V0+1r2GMF6t/1s3NlL8j0LWTAtrx9SQe4vQjcMoecRCbfyrknaFkvkm3jAhXh2ntl8iEIxUKTturmiJ1VTysD/s0ZdrsIxEYqedoFhhCCLO/1ON+2CVm2yF2SC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401985; c=relaxed/simple;
	bh=Im8xQI/1BVlFm8lyplnKiFplpMiB24Qod2J9Wz/gno8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=U+/Cg9bv5nGQUXFYT2olju9mTAyO/gZFqORvwqP8D3yuDnB9UT/I4RwWi7SOjqVMzE6hw2XGTFO6nnZVfnbmZNKsMwRr0hfLFk/AKCQzoqC5/CATZp90VhDg36Fw3jozeHhPJzqAy4Eef7MgqAbVqdwVxbpc553GPv/EXzmSxOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I3RF/kic; arc=fail smtp.client-ip=40.107.220.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I3RF/kic"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ux+4ceUEDNfgEt9pcBEG+o5GLFmAGDVcIKdgznK+IsLMjSusqX1QqRBTNWrcCdERhZeiNUvKhZJu26mK6PC+ouTl8YNQq8z3xlo+aRcXXiSS/PSvgDX+sSkZaCB5V7NZPReanCteJWfE56Pqt/A6j3v/3nmh9wydeJYvEaW7UJ1KVVXu94qy9ojgDUdVz/E7ex0UheuDcTbd0LKDY2+cQrYJrjjQMAXZoIZwYMlMHvvKcSUVOCyG+icw1Ckc56+Hz3tlS3YJ0Iazb/a13ojqdv06NZAlm0aZgOoYyg+HsFsKR/fE9ZywxaCIS02Ci9LTnCqSDks6i9CM8JpGLTUD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRhfhCJWJEPxhUkJfS5sradV6BQAO+RZEjR/hBWK4Dw=;
 b=XvYs741UGnj31mcp4ZJWvB4UTj9WzcaTDuzsb+PsViLEP/iOflYp5B+UkBuHexGYnIJxv+S/euYTjP4AvvJhPSOLrJ64ju2d1YSOpWzIuaa2A5Q97ct6abLphn8joGVZJyIaWUJsTDnSOjWp/fz0p4w8349HPeGrDhLgs9Op0aVNEtGLFefEdNm3deZ1T4PXa/cFTWrjgSEFKSap/xoaP9TdbmfwoNF8SRan0HD7nifwCrlEtsnYiXnRa43UEpuLNeYwPCyiOL/e8tG6mm8g57de343tZHea2ChtR63hfaQ+METQSR6VB07PAap7HJC5Fr82QZ/OJy9O+FpVULP+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRhfhCJWJEPxhUkJfS5sradV6BQAO+RZEjR/hBWK4Dw=;
 b=I3RF/kicv9+dTB4XxPnl+HVhJZSCTgEm1SAGkA2WwYkB1ItgQo0HsUmRopJEMs1Yx5OrYYISQRpfgK95iOK5Meer4LVtnC1eQY+4YZo7Wli+SJqLfMee2aF7oJn/6i0UkHvVjburExOw6PQyNcFAEacZ2aELa/j7/HLlg10/cU7Hv47Mf5SoPVEBo9kjIj0NP450no1HkfGbUxi0iFXJNs9Xhe8zAhp9p7+cbZy+FELjsCDPsuKsuWZLkShDuRumsYNIgQt631Nr7ZZmFYzQwOpZHajerghlFwYJLzCsMAyrr7ZuI5CiBNjQh/mkEOi5wzbAparpfaroXFiQQh1/JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SJ2PR12MB8133.namprd12.prod.outlook.com (2603:10b6:a03:4af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 13:26:19 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 13:26:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 22:26:10 +0900
Message-Id: <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "John Hubbard"
 <jhubbard@nvidia.com>
Cc: "Timur Tabi" <timur@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
 <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
In-Reply-To: <2025051647-urology-think-b8e0@gregkh>
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SJ2PR12MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: fb83bb70-8241-47e8-68cf-08dd947d3df2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aitpU2c5U2RMMmRndytvR1NUdkdQVndKdS9CcXQyN0owR01wOXdReDROT0Jj?=
 =?utf-8?B?dG9qbEkvR2llTGdhMDI1U3YwZFIxeEREVkUxTnJWVmJ1ckJNaFV1a0VSTHpu?=
 =?utf-8?B?a3pvK2R5MTVJeWJhbXFPdURxY1hxV2hxTVRHYVlHYi9GY1VTQ1hFR3UrUFdI?=
 =?utf-8?B?YmkwQTY5QWZPalBRRml1U3krZzZhM25QZ1Ezb2JqeE1iN2k1S3dDYXBpQVZp?=
 =?utf-8?B?RFdVS0JwKzNXQ1R2UkNKYkNaOWtpTTFFY1Z3VkE3YUNvbkFQdmNDNkN0VnVK?=
 =?utf-8?B?aExxWW92c2hPZG5qSFFwbkFXc2VRY3M2NjBlMTA0Y0p2cjRRM21MR1VmeUs2?=
 =?utf-8?B?ZkdTNk9qdlRmZStMZjhERE1Jd2swbWlIS2xlQTRyNGRYNjZhVFN6bDJNSEFF?=
 =?utf-8?B?NlJXSWlvL0gzTTJhL3RsYlp3eEZRNEZVaGQ1b0NodnQ0ZUFqbWl5cXFOK0g3?=
 =?utf-8?B?NlBYREZvZkt4eDlxTlBZMk1UM1hDa0ZraFREWXhJUHpTRUF5c2Evc3NER2JR?=
 =?utf-8?B?STdKR2NENDU4VWNqUkdGTTh6SWlEVHhBcGZ4Q3ZIQ0dvdGZXbXdaZk1kZUZX?=
 =?utf-8?B?c0FYY3JLT2lUaHF5c1hCaW14dVVTaWZ6T1l6QUtNNTBmbTlxZG9YZWR0ZjFx?=
 =?utf-8?B?MHl0OXRJWnl5akdWbS9DTUlmb3FQYjAvSTUvVEFJQXV0UHpqMUEvVXgrWkht?=
 =?utf-8?B?V2JIdkdoaG1reCtOcjcxSjZpNHhENVB0dVovSDllMkJvYXFkYzhaUTlSWXhi?=
 =?utf-8?B?aWg2WEwzSUtHUE5aOUREVHJhcEMrR0ZjbmFCVUxoY0lZaDFIM0EyRWYveENp?=
 =?utf-8?B?U0ZDUjR1RDdMMUVhTDBSbHNrSmZIZ3NqZzBzcUZDQ2VGUmNqWExiamlMTUhm?=
 =?utf-8?B?SmFRdEd3MmJtemFCejRnY3J4TG5pTVRNSFJVa05RbFMrQmFrMCtFOW5SWXMw?=
 =?utf-8?B?VC85QUExVktWYkd1a1pCS1JzUVpVK0ViQzMwU3REVjZHWmFLSFgwdTZiSzBm?=
 =?utf-8?B?OUhQWU5QdW1uVW9DN3YzcVVuV0daOTdQR1hZV0Y1Snp2eDBnT0s5NW0ra3A5?=
 =?utf-8?B?MGFQVXpNZURoKzZQUzJMTlVRT0ZHT2RISld6aXMwWmRwRkJacktBNm1xemhM?=
 =?utf-8?B?bFEzT1RmY3RRekJTbUxLWlRYM0FlWVgyTml3b2phZDZReVpUd2xVSTZnVXV2?=
 =?utf-8?B?Nk9DQjFPTUJKWVFVWmd0Q1E3MXdOUUxSK2tUOTFtUkVHOFNtZmVPT3M3WmhF?=
 =?utf-8?B?djBPT0hlL0NiUS9CL1pCVzRFOGNhSVo3VWhYb2xxclJkaVJ4Y21qazhjTVdZ?=
 =?utf-8?B?bWZLZHl4T25YbTkwdHk1RjBTbC94U0ZlQ0t5OHhKcGFmcmo1RE15UjNzVnp0?=
 =?utf-8?B?RjhTWnhXRGx3RFIxMkNvekMrQ08veFFSOTVlZnllQ1U5SXUzK3RDZ283UjM4?=
 =?utf-8?B?czF1c1VjYjhmNysxaEE1R3ZUWFRrWjRObGpyYndyZGd1L1VoeTNUU1pBUlIr?=
 =?utf-8?B?OXh6ZXlOaGx0cHVFMW84ZjIxcThna3dXbDlTb0ZyOEpaQkxpSWYrazJnb2ha?=
 =?utf-8?B?d1VmaXVMajlCOUdPb0lmQXl0V21WR2tsakxLMjQ2MnMvTkNReHFmUU5xQmlN?=
 =?utf-8?B?SitON0xVOWZRMElBTFpNa0dFWFowanFLSDNlRENGUjVwM3hCU1l3QmhvVm5T?=
 =?utf-8?B?V1NNb3pENm5ubmR3MlFsUUREbmdISnU2c1AwUWZVRXUxaDJBL2dXb1ROckZx?=
 =?utf-8?B?VVlOMVFWN1d3ak9XckVjaHJYSWZscG1rS01iblp2QVhIWk1vVERWcnloaXFq?=
 =?utf-8?B?ZTlMUWdCYXZvOVVvMGg3U0NFdTE1TzRtMHFQOTd0WUhtdE9LcTUyUW1CUmNh?=
 =?utf-8?B?dmNpNElHeS9scW0xeGZHSHlHWllMaVZldWpudG9ISGU0bm5ndEE5WnovMitG?=
 =?utf-8?Q?gFTCquzhH2c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDFlazd1WkR0am9Vb1V4NWlqQ3V3MCtoYlJnOE4xTHJnekxSN1hCMG9VYkkw?=
 =?utf-8?B?TUkwWWdsYTNib0hUTmVnQnJNOHpMM0R1cXFGd1FZTFlBVjllU09WVnlUQkFZ?=
 =?utf-8?B?ZjFleTRTUkpwVUtWeUFEUmhIWDdIRzNpSCtpMEhzQUk3L0E3TWY0OVQrelg5?=
 =?utf-8?B?WjRBaWNGK0Zpdy9QMTViaXZGMVdjVXRLdDlaUy9sYW5zU2NKVUI4elNRNExa?=
 =?utf-8?B?aU9Pb0RYQ1lVbVhFbnBsR29IVjI5MENPUFdBQ3NzOElBeW9VWFlTb1o3OEVp?=
 =?utf-8?B?U0tPT2FvT2YrZnpjUThlMWcxWEZiT0pGRzhnMmdadkN5OGJvWHZiZkJnUjFR?=
 =?utf-8?B?RHYvdlBYa1ZCWHYyLzA2cWlBekM1dXR3VzRUVnpFbTcxYkt1L1E5ekxNb3Nz?=
 =?utf-8?B?aGNNKzhBUGRYSGQwN2tNZFF3NjBTc0hvbGJnV1lpMDZLek9qbnJSVXFQQW4r?=
 =?utf-8?B?dmpTdExVNjA5VmNGUjVYZnRycjZITWl3V1diUzQrUlYxUWV2Tm01T2xtUTlv?=
 =?utf-8?B?bHpxSHJiSXZNNytybTZvMDhDclpHcUpWMDNkNzc3QkxvenU1RDlkRHJMRWsz?=
 =?utf-8?B?S2hxWU0zVjJZRXp5am9sSCtVSXBaR3h6ditTOUNvZ2tKZkZTczVhVFROdDVw?=
 =?utf-8?B?dWNhOGk3OW1ZeUs1cTQxT2duVElTWVdjTHoyS1lPUXpITU9TNDdXODhFYVpY?=
 =?utf-8?B?RGs0UFcvUnJmclg5YzY1Q1NmZXFWL2w4MjdWejBVdW1uaGhNVXpHYjZ6eDk3?=
 =?utf-8?B?OGRZMUpDWi9Eb3Nid29KNWpERmw5ejYrbFpUSVdFWmN2dnFCZElRY0RXamdO?=
 =?utf-8?B?S3B2Rlh0enNVRTVFNkpJTEhDaitzNW1EOG8vSEVZdFJkRVVtK051cmxORmVo?=
 =?utf-8?B?YW4zSldGa3ZKaVRnK21tVmF6OTFmcitCc004ZjhEZW9Wc1ZEWlR5ZGZUcVBw?=
 =?utf-8?B?dkpuOFlmYXh0aHJ4OW9PWmhVMkVRZEFDT05TQ0gxQWtXVFNTMEVzZEtiTThp?=
 =?utf-8?B?ell5N3ljUisyU1F3MVFDRnA2RkRKaU9tMldOQnU0aFdGbVdRWXREVk1LWXNs?=
 =?utf-8?B?RWprMVpUV0oyY3R4VUlmU214dXBiVFF0UXBFbjZmY1NoL1J4VVZlMThoRElt?=
 =?utf-8?B?WGY4UHRkMDN4dEt3bm5NYW9nYXZEVEp0UHhVUG9xRGUvZk5SU0JTR2JhY1o5?=
 =?utf-8?B?RG5QdVFoSXk1bzk1ZDJMUldRUlljUFJRcnNDV2h5eXdrN1FXU2xRczFFR2FO?=
 =?utf-8?B?OU1LeEl4bUNMU2djWWxsdVNSZUVrQmt0MElldjZBbkt0QjdOcnJVVGZBMlRS?=
 =?utf-8?B?OEhrYWptM2ZBak84aWlzaUFxSFM1eUMrS2VSUG9JblBOS2E1cytuZ0Z1a3pH?=
 =?utf-8?B?NnI5L3NtVnErSXpiT2FCT2lwaGduK0NDRFZGanBwMzh4NFFoU3BIWGNMa25T?=
 =?utf-8?B?TlVpaVJSc0ZZQXdUNVBNM2hkNGpWU2w3a2pFWm9Lc0lUODNLNXgwaTI3Z2hh?=
 =?utf-8?B?WU94U3VNOEorcEU0eWFCUDVGUzd3V1I2QTFWOTdvdlFYZVc0MU1OcGdHYzlI?=
 =?utf-8?B?RndCckt0L2lsNng4SkkxWXhzbEZBNmRIUmtvbmxVNFRRRGx6T3FrNlVaNlhE?=
 =?utf-8?B?V0I4UGxoVjVpQXFXbzNGRyt0L010S3hDZFZYT1hZNEpCTDFkTEpDZFhvZm43?=
 =?utf-8?B?WlVCMXhHR01OQkdBVmNTZm12ckZSOXd2Qm9TM0VIcmFSNHRGcWZJREdlVnN1?=
 =?utf-8?B?Z0VzYWVaUjZTMVFtY3prbG1iWk1lbDFnUkE0Mmx6Vm9PTGp2SktyNllEVFpN?=
 =?utf-8?B?c2l2ZFhLNDlrcS9qVkFjLzRkQncxRUwrRk5FVmQreERXU2tkaGVXZlR4SE5n?=
 =?utf-8?B?TmFkVkh6WDFHVXoxbFZZblJvTXVRQWtPdHFHeXd3anluQXJtUVVWVGtCVHVi?=
 =?utf-8?B?ZEs1UnRHMlQvWlRibzhZQjExNFJEMVgySWZlSVhkMEZab2dTN0srY2Z4eHVz?=
 =?utf-8?B?c0dVQkUxREpMSWlISjZteTVpZmVjTFZTcFlQSmtwWGpIbmU0NGJiZU9HKzNn?=
 =?utf-8?B?U2FnbWozUWV5a2draEVlbmhOQzN4Y3BQN000aWF2NmFOZEZsZGVuZzE1a0Rh?=
 =?utf-8?B?bjNSUWNFeXFVMjVJdUxndUVnN04yL2ttYVIyUUt6bWp1UHJDcGJnWHE0eStV?=
 =?utf-8?Q?7c0tKGSJdylrcsFma6muBbSe2V90OuP7ExGeF668a5FD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb83bb70-8241-47e8-68cf-08dd947d3df2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:26:19.3890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpH9yPHq2KVHkiOzfG6525TyaPyAX0SIvc7RTQJwFyvFPiw2BvKFdshmwF3nxeXdiLYtMOxo4nfkB2cDLbJppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8133

On Fri May 16, 2025 at 10:15 PM JST, Greg KH wrote:
> On Thu, May 15, 2025 at 12:17:00PM -0700, John Hubbard wrote:
>> On 5/15/25 7:30 AM, Timur Tabi wrote:
>> > On Thu, May 15, 2025 at 6:43=E2=80=AFAM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
>> >>> Or if ELF is the problem, I don't mind introducing a WAD loader. ;)
>> >>
>> >> The "problem" I'm not understanding is why does the kernel have to do
>> >> any of this parsing at all?
>> >=20
>> > Nova will need to parse ELF headers in order to properly load and boot
>> > Nvidia firmware images.  Nouveau does this already:
>> >=20
>> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c#n2931
>>=20
>> Hi Greg!
>>=20
>> Nouveau influenced us heavily here, because having firmware that we
>> can post once, and use everywhere (Nouveau and Nova), is very attractive=
.
>>=20
>> Alex and Timur discuss other details that explain why the standard=20
>> user-space approach is less simple and clean than it might appear at
>> first glance, but I wanted to emphasize that the firmware re-use point
>> a little bit, too.
>>=20
>> Oh, and also: the ELF images are going to remain extremely simple,
>> because there is nothing now (nor can I see anything in the future)
>> that would drive anyone to do complicated things. For example, if
>> there is some exotic new thing in the future, it could be put into
>> its own firmware image if necessary--because we understand that
>> this parser here is intended to be a simple subset of ELF, and
>> left alone really.
>
> Ok, then why not just bury this down in the driver that is going to
> actually use it?  This patch series was adding it to ALL kernels, if you
> need/want it or not, and as such would be seen as a generic way to
> handle all ELF images.  But as that's not the case here, just copy what
> you did in the existing C driver and make it private to your code, so
> that no one else has to worry about accidentally thinking it would also
> work for their code :)

Keeping this local to nova-core is perfectly fine if you think this is
more acceptable. AFAIK there are no other users for it at the moment.

> And I still think that having the kernel do this is a mistake, firmware
> should always just be a "pass through" otherwise you open yourself up to
> all sorts of complexity and vulnerabilities in the kernel, both of which
> is generally not a good idea.

I agree on principle, but I cannot think of a way to avoid doing this in
the kernel without making things overly complex. We're happy to consider
alternatives though, if they exist.

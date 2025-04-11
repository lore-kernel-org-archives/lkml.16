Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7871FC0F3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382693; cv=fail; b=fMxlDdDEABAyjVjgbcATwpvpCbj9HenhhvVQXLkN/qwChBgvpCq30r6rx4lQGfxz/1xXI264G6W+6MYOzwiF+bAgcID1qbjIn03fSsfdFafsnrFcqQvvti1D6bTNDXbmackzACrwFoPAyrgMjk/jqPkl+uDgC98OpxRaRRqDPdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382693; c=relaxed/simple;
	bh=PmAbpkZFa4C9YG87iub/2ctMMVFGpGQ0VXzyUm2iiic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YVKfq63BiEPlMCvBcaSwe8uA3/0kBifezpDcSHBIkxowDHqajTGQrBFn2L736PVyTSrBtF6Qb3/jm7j6yps9nMAaoJasdqeenhQPO4CI7o7h+2qCE/x87vMgq4abE2suz28dpevD2EWtiPRTA08oDkJ8mIHU9MaEIg1k4XVjJe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CwTniI55; arc=fail smtp.client-ip=40.107.220.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CwTniI55"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkUpfoNNl6Mh1mfF5PCupPJYJ4xWsDvCrUF24ip5chGOCtZfnQVKJpHOMJ+3pDfU64oSG7ao8PZGdc++YUPLMz+Q1RsX72dBagxznW7XNP8w+dkWmZIIfnzCIyL10LNcbJ/0g7NXHB0tj5PoCZJdfiENdBUMjNUOvQGJUCknQTiqbYR/6aKuHA4btE1qehgtLVz9w5HKNKsQ+tvpIzKcJaDkyHOhr+4NV+Ko6MWqiP24mVENxSU2Xd5t+wbKjhFocSgdryp38ob3t8THHVD8SwhA8Q9YH1/dV4kqglk7EsTrWZyo2xoDLAh/Z0wwVwDH+qVcv5LTVrG+cJE+PTr4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDuN5KP1a0UKjyALNH4c6ezBbcF91d83q78zTmbuR/I=;
 b=pa8oC10CYTpLag2IzbEJXzX/zD0rMfABDOcNImLzEYeO8DxhwDYjIXRlTQhnzOO+zalL6RGE7EgiNNrUogCskUGa7TUNpwQr+KhgJWB1LAmxPXWkikfukUdlf49YtTh1/LBwpqqle4x9Xeous3W2TbZJ1M+KgtQjKWAxSnPtEP2Bf7vDOEahi1OPxQ45Q3XtO8ecW9SkDV2tIwh+0ICJRqdTTIkL3cGIIyN7iXhuIg5N8mP3OXm58zPj+c2IWkLQiektZrD7ByqYLBhSrPHVbx1fku2wfHgHjl4RmtWjynQfdqwN1MYNY6JLzZrZ1Ks0Y+dlBanxaPEM2+Ku15zb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDuN5KP1a0UKjyALNH4c6ezBbcF91d83q78zTmbuR/I=;
 b=CwTniI559QIcHyQXK7HniPa0Ls/S+/13QCEYF1BrnhyrijJ0BJipLSJoz/0gMSMfNVZqEGLJiShI7FPlFzBp2rIiHwNUkoIXoI4GK93A6K0mEVfjRSZjZ3FsKuXnOClDgB2P5D4IfUw3ON3gOon3xWHXvGKhJT6qziq/xbQhBCE3bnt/JIe8WZsZMWJJDpyaARpM41w8XCtQyXQ64/2lsyMBxkn6whWzJb2yrrNDrpLchcVQPkTzDAQEDJZ+FNB8gxp2hiUEleFZtth64x3J//2ypNthAZ/yrfhHKESzjNPqmsV35sBLFGo/GcN076oPBSbeslIul1mqQYnCZlUS6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB6817.namprd12.prod.outlook.com (2603:10b6:510:1c8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.32; Fri, 11 Apr 2025 14:44:48 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:44:48 +0000
From: Zi Yan <ziy@nvidia.com>
To: Barry Song <21cnbao@gmail.com>
Cc: David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
Date: Fri, 11 Apr 2025 10:44:44 -0400
X-Mailer: MailMate (2.0r6241)
Message-ID: <97612A28-8654-46C1-A2AA-C953C7EAAE4E@nvidia.com>
In-Reply-To: <CAGsJ_4zYV78RV+9a13Tyy2ykTDYMH_-ePP_ESEedGqb_LqBkeg@mail.gmail.com>
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com>
 <5c52b67a-8e7e-4dd7-9127-96944715d883@linux.alibaba.com>
 <CAGsJ_4yPxoF5P87WdXbXVb8BqovVvxhKg40YVddkEQmFjFsRYw@mail.gmail.com>
 <1E123113-7A0B-4D3A-AC7A-01767D7BF2D8@nvidia.com>
 <CAGsJ_4zMthcj0dtCX1OKQ1_A01OdF=P1n9FGLpGsbkTRwWoqVA@mail.gmail.com>
 <247fca57-8280-41a6-85b0-03a32ea08210@linux.alibaba.com>
 <6b532646-041f-4077-b09f-ff6d43aa4a81@redhat.com>
 <CAGsJ_4zYV78RV+9a13Tyy2ykTDYMH_-ePP_ESEedGqb_LqBkeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PH8P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 459715e3-5536-48a4-bfca-08dd790768a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGxLcFllbm51djhOcTlKNXpBb2ZVZjljSXd3b01NL08zbnhYZ1NMZXZ2SXpE?=
 =?utf-8?B?Yit2d1JBQVd6NUlqTFp1WlZ3cFcyMENJUHVXRnoyeGErZHBVMXdzcHpHWTBk?=
 =?utf-8?B?di96WWhaT0FHM29saXBLZUpXbXRwb1RjS1pqN2h6VHhjNlZlSWx4UWpnMUhN?=
 =?utf-8?B?ODBGM0NrYWtxaXNVTWRzd21YSml6WHMycXJzMDJGdVpGLzJQQ0VLSlBSbWRB?=
 =?utf-8?B?dS9sZnJxaEE3MVBHa05UckVoNFJzRzhPM015YkJkWld1LzNTWkN2YUk4bXVE?=
 =?utf-8?B?M2JzTkl5aUtDY3lRd2xXTXowUThuNDFLenN5a3VPNWt2R2xjai9oS09iblJD?=
 =?utf-8?B?cG1WR0FsMWZpUGNPU2J4eU03Q3Q3ZmsvOTBzWVhMdU9LeHhpeEw0UmtjMkhy?=
 =?utf-8?B?RS9PWlY3QnVTL1NNY09Ydkh3ak10a0JPYzNQTFR4T0k5MnM5V25nejBhOUdl?=
 =?utf-8?B?Vnl4bXdFOVV1SSt6dWlZZ0F4elNUMUdKMDBpZUV3bzJKZlB0THBIWWJvSlV6?=
 =?utf-8?B?bjhCQktCOHdQZTdvSUdIUklWTWVtVnZReWNaL1M5UThNekxHUHFReGdhVjdG?=
 =?utf-8?B?N012cW4vbm91QTNaUW11UUpzMkZlM2pGTVVuckZRRjBEMmFFMTV0M3JQdW1U?=
 =?utf-8?B?dHYxVEdLRE5peHl5TVcyTW9tMUhBeXgyS1orMmp3QU5oMmxIcHBBdVVHMktq?=
 =?utf-8?B?ZXhnL3BRZGVkcFdhMnhMR2FYcmFsc0VBZFo1R2l5a2JUNHcva1RYYlFWVGd2?=
 =?utf-8?B?UDlHdk5oTFlnYzVwdFNOb1RWMkt0Ti92Zjl0WHd3YVBvYy83UkZURWpFRE9U?=
 =?utf-8?B?aG9PcXE1M01vVUpvU3BJWFdBSmlkL0ZQZisrQ2VFMGg3dkVXV0JHWUF6RzB3?=
 =?utf-8?B?YUNFWlcxczhXL1l1Y2dzenBVR2cwOFdpbWhvQk9Mc0loZ25pQkVxUDF0azRr?=
 =?utf-8?B?Mm1WYzVaUk1ENEI5blZ1YmRlTGFKZHFTL0JjM3ZwdFRQWHhvbC84RC84UjBX?=
 =?utf-8?B?dGlBQzM5QkFQZ2hmT1hwRXlTUnFFQk1GU2xmdXhSdENBU09TVExxbk1qU3hV?=
 =?utf-8?B?SExXOSszOEMyUzJ6MW56anZkWHBoazRSL1FEaWVycmVTa0ZZZmJiZkQvNTEy?=
 =?utf-8?B?VnUyQnI5ZXpqV0pWdlVTS0wxS0xRbXUrU3JpUFVSVnU2aC9wRVVOTDJXdjJ3?=
 =?utf-8?B?SFpFOFBIK1QxNGVSMHYxWnExVml0ZjVLckhCdk9mQXhidVowRXBIVWtVWmN6?=
 =?utf-8?B?TmZRVE14alZGMmhJTlR5K0s0RE5LMHFVVUtDbTZUNWl5VXBmU25UaGN1Tlpu?=
 =?utf-8?B?UHpMbkNONjMwZUtTVWNGcVJyNUgwaDdIK1JkME1WcjJVa0dseHFPWFpLc1NC?=
 =?utf-8?B?QnFkMzdUZW85d3dmR2tEczlDR0ZVeDVmbHZZMlFkYVFnYnJXdWtST1ZTRklo?=
 =?utf-8?B?bnJncXU0WnJxRmRNcnVkTGxiSXNyaWp0bU5YVVlNdEp6SVFGSWpqYmE5bUJL?=
 =?utf-8?B?UkF2WndTMFYxeWxOQUh5K1RYU0hENkhKRUlLYlNPVGVzQ3FKTkdoZ0FQZ0Uw?=
 =?utf-8?B?RDNhNVJoL2kwbytKV3J1bW5aZjIrMGhXRDErNitYTUZqT3NhMEZYM05LZTgv?=
 =?utf-8?B?VGZ5M1puSzFSUEQrWlVXanBXVlhwRlVwa3JLbFA1ZGtlaDFGaWZObnhNeGtY?=
 =?utf-8?B?NkZGQmdCVTZ2YmRVUmNpNlhuYnRrckhvV0gvNzNGdFk0d2xuOVVsNnY4VlRs?=
 =?utf-8?B?VitFOTZhN2lGajJxME9xWTE5UC93OFowK1VkRi90Z0s0MDg0Q0RRcTlVbUJx?=
 =?utf-8?B?cmtSaXg1L05OOEMzTHZHbUVXaEp4dHdJa1dwNVdjck5TOERON1ROQkVxRUZR?=
 =?utf-8?B?YUxyejJvVkRqUHdhaDJYUzBaQjZBNmdTRjc5QVdEK3hjSFBKeit5NWFtVWVi?=
 =?utf-8?Q?SlwWRDxJNJU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkUwdzdsNlJhRUczcXZvL0p1cEQ1RFVJOTQ4V29HU3lzRU4vMHdsdzAyZnVs?=
 =?utf-8?B?RGxoOXdWU2xITWIzSmFDaml1bUkzdnpqOWR0SVB2a0xZaEU5RVZYdllicCtr?=
 =?utf-8?B?b2RFd1BlaWtDV1hnMUdmR2hYOVMyUzBDbURtaDdlTlVablM4eUNtZzBSdEtW?=
 =?utf-8?B?QnozQUZjeXdaenNDUzRHM002UEd3blhrRTQ3YjV6T0ZhZmJjZkN1S2dOVmow?=
 =?utf-8?B?NlBNOXNoemtDOHViTjQyb3hZRzJVanJoTGFTYjZ5NWFKc0UwNFEzcFdVQXA1?=
 =?utf-8?B?MkVDeGFtcnZXREFSamVCVmFjNVJNU1MvWW4xN3hvWU1UaGF2NVg1eU5NWDli?=
 =?utf-8?B?cVJnbUM0UVJsNjZab2FFNC9DSlNwaWIzZ0ViQUEya0tUWk1OTmV0ME5rUnlM?=
 =?utf-8?B?MFZacXBtRTVBOTcrWkE0K0U4bFV6NHFNd2t6aEFMZjhySlFHK3JSaGlycFZ3?=
 =?utf-8?B?OXFIRFI0cllERTZsVG5lb05zeEQ5R0JRTzA1YlhYendORGVMTS9pSWFxaTEr?=
 =?utf-8?B?V2tuZFdOUHlBSEVYWDE2QzJyVGhrZjBicURiNnJzREpoMGx6WitRcVlNeW1a?=
 =?utf-8?B?QzRIU2tsa3QvYUkrcHhYNTV0bkgxTG52bUdqUXhoQjA2TlJvb09sMGFMWEox?=
 =?utf-8?B?Z2kvb25oWm43UHRGbGJUL1JUVlViUHd1MmVCWENURGU5TXpiMlRSZ3RZZUhv?=
 =?utf-8?B?eWljdFlUSUdPcHZXZk9FOFhZdllLY0RnSEFBQlZJN2VKbjlpQTJ2ZjBVK3V3?=
 =?utf-8?B?aUdLYmIrL3c3a2ZpdDBHOEdqZ3J0VElPUEZvVytoSzBkN0Mvc3NpZkx3bVRy?=
 =?utf-8?B?Rm96K2lmSlpWd2tTRWhtUEpYaytMOUtTcEh3RU4xYm9NZDZPcmJDUDZJMGFk?=
 =?utf-8?B?UEtsTmxVYUI1Sk9oVzlPYnc4cmNibHptUnk0TGJmSXp5RHlJc2puNEJYVHNq?=
 =?utf-8?B?SkFsZmlwempIYU1sb05VVE5vM3l0MTNHd0VEci9iTXJSbmpyRkg1SHlkcWhq?=
 =?utf-8?B?UVRxVmx4MUUxOXNwZG44ZUtueTZEdGVhWGRoTjM5Vlg1Qk5SQVcvSEZuOHVC?=
 =?utf-8?B?bXdrS3JyZUJkUUlXYk1LREp6c0pVTXJRbVZkZTFwd096UnpIN1NQdksvalFV?=
 =?utf-8?B?RUp0WEJMQ0JGSlR2S1BZVnc0NEhqNjJnZVIwZVNpbWhMNWlZbEtNQmRVcWFE?=
 =?utf-8?B?WlY2WUV6akZNbWNxWDFvN283VWFFUTUxUGxkMzAvMDREZmYyeEJLMnMxWXVp?=
 =?utf-8?B?TmpnRVhFN2tEcElsSGg3bzNqTGF6ak5HUVhJbnRxcWFkcDRqb0xzL0JEZ2JK?=
 =?utf-8?B?VjdBbW0yUThnQ2lwNG9KT1k1WkJoZTRxQmxQazNiQmEyWDNwVDhNLzNpYWhT?=
 =?utf-8?B?ZUlQWmkyL0VOdzdaTDRmUnJ5Ulh6V1pSaWFTcGZzbmd2N2VoYVdoYmpPNERv?=
 =?utf-8?B?MjFiZ1hyT1IvdElLNTJnekRCNmlNbGQ5a2JONzB5MUMvaEVLWHlnWTcyTTFP?=
 =?utf-8?B?d1JEWjNDRGFjYTJ6L1ZSak4yTDZyaXA2Q3lRcys2TWJQWG53L2I5Z0FHb2N1?=
 =?utf-8?B?K1piSGRFUXNmSk9zTitiWGpvY1UzcWd5SXBvcVl2WnFmNHIxaDNqTVpKVndN?=
 =?utf-8?B?WCtlNUtCODdMR0hzTmtscmU3dDlVek1BTnBEV2RFUU42c21IRVVRZTJMUFRk?=
 =?utf-8?B?Tk9HWHZqNGJ5Q2pzNHczQWh2WWxlM1h4cUhxN0REM2laWDVUaU5LRnFxY2sy?=
 =?utf-8?B?Uk9zaUk0NFFjZ05ZOGZ0aG1hYVJmNmJIMGtjMDc2WXhlWVEyVWhSNkZEQmQ4?=
 =?utf-8?B?SHFteTNrd3FZSFZNbXlmWGJuYnZxKzRkeTRrY2pjNHZDRUNKVEhsZ1pnVnpE?=
 =?utf-8?B?THEwYUdPYmFUTHV6dU5KTTZ0K2FUb0ZiUk9MWVZKTGlDNktnUWZrcStmQ2xl?=
 =?utf-8?B?SHFOdGhLNHZDMUUrbVpmeUZGeTRiKzIrcjk3RlZXY05YNjBOa3k2ck1rZCs3?=
 =?utf-8?B?TE5MZ1I1WWpBblViRVlueCtreG9UNkVOQTQrYkY3QUc4SUh6MENGMnZjTTV3?=
 =?utf-8?B?bml6UFNJUk1yTGhKbmxka2FZUlZZTnhzWEYzNlpzV1haMkxwbjBmOVFDcmxo?=
 =?utf-8?Q?ef4e6pVAWzVDkfLKYe15Ws6E5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459715e3-5536-48a4-bfca-08dd790768a3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:44:48.6164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvOU6HkEjfhpVTDaxGJpi7BWhKAlna4eIcL6SzBpPtDXh5pFbjuS/OGaMr7po9Dl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6817

On 11 Apr 2025, at 7:51, Barry Song wrote:

> On Fri, Apr 11, 2025 at 4:42=E2=80=AFPM David Hildenbrand <david@redhat.c=
om> wrote:
>>
>> On 11.04.25 03:20, Baolin Wang wrote:
>>>
>>>
>>> On 2025/4/11 05:56, Barry Song wrote:
>>>> On Fri, Apr 11, 2025 at 3:13=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>>>>>
>>>>> On 10 Apr 2025, at 6:29, Barry Song wrote:
>>>>>
>>>>>> On Thu, Apr 10, 2025 at 9:05=E2=80=AFPM Baolin Wang
>>>>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 2025/4/10 16:14, Barry Song wrote:
>>>>>>>> On Wed, Apr 9, 2025 at 1:16=E2=80=AFAM Baolin Wang
>>>>>>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>>>>>>
>>>>>>>>> When investigating performance issues during file folio unmap, I =
noticed some
>>>>>>>>> behavioral differences in handling non-PMD-sized folios and PMD-s=
ized folios.
>>>>>>>>> For non-PMD-sized file folios, it will call folio_mark_accessed()=
 to mark the
>>>>>>>>> folio as having seen activity, but this is not done for PMD-sized=
 folios.
>>>>>>>>>
>>>>>>>>> This might not cause obvious issues, but a potential problem coul=
d be that,
>>>>>>>>> it might lead to more frequent refaults of PMD-sized file folios =
under memory
>>>>>>>>> pressure. Therefore, I am unsure whether the folio_mark_accessed(=
) should be
>>>>>>>>> added for PMD-sized file folios?
>>>>>>>>>
>>>>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>>>>> ---
>>>>>>>>>     mm/huge_memory.c | 4 ++++
>>>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>>>>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
>>>>>>>>> --- a/mm/huge_memory.c
>>>>>>>>> +++ b/mm/huge_memory.c
>>>>>>>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, s=
truct vm_area_struct *vma,
>>>>>>>>>                                    zap_deposited_table(tlb->mm, p=
md);
>>>>>>>>>                            add_mm_counter(tlb->mm, mm_counter_fil=
e(folio),
>>>>>>>>>                                           -HPAGE_PMD_NR);
>>>>>>>>> +
>>>>>>>>> +                       if (flush_needed && pmd_young(orig_pmd) &=
&
>>>>>>>>> +                           likely(vma_has_recency(vma)))
>>>>>>>>> +                               folio_mark_accessed(folio);
>>>>>>>>
>>>>>>>> Acked-by: Barry Song <baohua@kernel.org>
>>>>>>>
>>>>>>> Thanks.
>>>>>>>
>>>>>>>> I also came across an interesting observation: on a memory-limited=
 system,
>>>>>>>> demoting unmapped file folios in the LRU=E2=80=94specifically when=
 their mapcount
>>>>>>>> drops from 1 to 0=E2=80=94can actually improve performance.
>>>>>>>
>>>>>>> These file folios are used only once? Can folio_set_dropbehind() be=
 used
>>>>>>> to optimize it, which can avoid the LRU activity movement in
>>>>>>> folio_mark_accessed()?
>>>>>>
>>>>>> For instance, when a process, such as a game, just exits, it can be =
expected
>>>>>> that it won't be used again in the near future. As a result, demotin=
g
>>>>>> its previously
>>>>>> unmapped file pages can improve performance.
>>>>>
>>>>> Is it possible to mark the dying VMAs either VM_SEQ_READ or VM_RAND_R=
EAD
>>>>> so that folio_mark_accessed() will be skipped? Or a new vm_flag?
>>>>> Will it work?
>>>>
>>>> Actually took a more aggressive approach and observed good performance
>>>> improvements on phones. After zap_pte_range() called remove_rmap(),
>>>> the following logic was added:
>>>>
>>>> if (file_folio && !folio_mapped())
>>>>       deactivate_file_folio();
>>>>
>>>> This helps file folios from exiting processes get reclaimed more quick=
ly
>>>> during the MGLRU's min generation scan while the folios are probably
>>>> in max gen.
>>>>
>>>> I'm not entirely sure if this is universally applicable or worth submi=
tting as
>>>> a patch.
>>>
>>> IMHO, I'm afraid this is not universally applicable. Although these fil=
e
>>> folios have been unmapped, it's not certain that they won't be accessed
>>> again. These file folios might be remapped and accessed again soon, or
>>> accessed through read()/write() operations using a file descriptor.
>>>
>>> I agree with Zi's suggestion. Using some kind of madvise() hint to mark
>>> these file folios as those that won't be accessed after being unmapped,
>>> seems can work?
>>
>> Is that similar to MADV_COLD before unmap?
>
> I'm not convinced that's the case. Although the previous app exits,
> its exclusive
> folios aren't useful to the newly launched app. For instance, Firefox's t=
ext and
> other exclusive file-backed folios have no relevance to LibreOffice. If a=
 user
> terminates Firefox and then launches LibreOffice, marking Firefox=E2=80=
=99s young
> PTE-mapped folios as accessed=E2=80=94thus activating them in the LRU=E2=
=80=94is
> meaningless for LibreOffice.

In terms of marking VMAs, can you do it in exit_mmap() by passing a new
parameter, like bool dying_vma, to unmap_vmas()? So that unmap_vmas()
can change exclusive file-backed VMAs to !vma_has_recency() to avoid
folio_mark_accessed().


Best Regards,
Yan, Zi

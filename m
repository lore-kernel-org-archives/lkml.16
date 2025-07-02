Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8192741A3;
	Wed,  2 Jul 2025 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462852; cv=fail; b=I8m1tgnv2iRSqq9xQBGheQS5RA50wvAUmNQuovscY5oprfqJrYfnT1G/x+e8W18pcQjLLpVElZ7jMS8SSlzIN+yAM/K+nYdZ4ogZOBzGWh0ei7yznSsS79AcoPb7bdekpEaJYGslDm3U+AypTlmV77Mi8Ifof4OUscDYJhTp/oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462852; c=relaxed/simple;
	bh=pXJybz0QCunkNgsfFgYSEMTFQVbLolacCGqJ7rV2ZkY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=YXYCK+qB6N1+WSb6BP6Pn//pSudW8KRr7ju6nVGpGwu18TrqBNIfhoqHaWLfYNsqPtWfonuerepBFyAwy3hzBqPNwNXipmA4pBVEdfjRnRsu7rN20lhwCHDGnkxf+g+yGex/UkL28CKDl+YHBEPI4pn8ThWmoF590aK0Q4simqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KJiP74R5; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KJiP74R5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=My87B2FBAs7s/TPrqUB73z4InzGnkfSdd+F54uyILPBYuWcp6QR+K8Rk2Iap36QuIWiMtzhoPOyciBAhO16ozgCrDxlpFe4IMyeGIPOuqXd4JFd542jf1nXMhhSu7TMSIAmnAwEoPmaF/w2d4ZCFSt59JsNmVsyRVpWUUHziAl3cLjX+wE8iLUCs6ATMvNPnsRWfUPyFM4lBE72pKOlwlTr5kTFP/8aAmDXTt0aDq1KyXb6sQo2GmVwYPhdZQ+xFpZ9mkeHVH61ST5CzB61H6IRhlICz2lD0OSB7EkxhRcWXLuss6UzA6lZGFtHdqdiYpAVILwhPsRH7nUrczwUhsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31DTE1AenEIDmWez/U2uqd4aFPE/TwVqHVIi0mub2OY=;
 b=QPTFT6D+asdJYK9RcIO2J/rCwqcVNZ5hKUdIjzxX9NuWsDpv/sMfLwvBh9OGFSF/P2/UkQdPkhoKI9CaL/ovxgOhROq4cIWTp3T1M+4CW0M3h0m2T1kl7SE2cElv2tJT0X9Mwj55F5tdt46mzjrZb81Wtz8dcVHNI+ACHYkLWW77L77anHydpGvfTvIgoeKG+fjJFqx9IAmlbXnrZghn7nTr+ziauZpVCPTxa5rHMLuJNLHKG7C0rrXc6tJZel0WrYoehSHM4g8oGzky9KeyxcASPQfvuRiQv4dEfVxNbW2HWusgbOZKzcK9n5XTkzkAS6DADxjxXdm6SfeeGrsqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31DTE1AenEIDmWez/U2uqd4aFPE/TwVqHVIi0mub2OY=;
 b=KJiP74R5pZxSSjXb2OivR6w0VLRUn6xqgSGaTT+NrtE4rXmad5Sj8f64xMpVeLvvWuEtTxF2YYjf5x6f9/ONwYSeo+J8IPb3nc4AwtdEGphxMq8oa7rCXBoLDoz5gWXLsI1UXpPefqT3xuulbz0nchnmcrUxbKCdKZS1juBQo+ltvMUu7dSjXcEM14ovcWbGaacTIDoaoj8ELGOdYjAAxhyRLmNiyvloxANFDjvx59QbBXnoN/W5cjLiN1P4TPZJkhDjRfD4xqeTHObwEfBAhj7XQ9SXWYg9bfHS9QGHn0yzWX01P18IRI6OfCTZZgWESTodWu/FclTMo0A66rrOjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6980.namprd12.prod.outlook.com (2603:10b6:510:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Wed, 2 Jul
 2025 13:27:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 13:27:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 22:27:24 +0900
Message-Id: <DB1LRERP8RYU.1FA5867DN8BCZ@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Benno Lossin" <lossin@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v7] rust: kernel: add support for bits/genmask macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250623-topic-panthor-rs-genmask-v7-1-9f986951e7b5@collabora.com> <DB1LPLOF0O0R.YQBJ0HBDUSKA@nvidia.com>
In-Reply-To: <DB1LPLOF0O0R.YQBJ0HBDUSKA@nvidia.com>
X-ClientProxiedBy: TYAPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: a10b7554-6601-45e4-cdb2-08ddb96c2feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjEvVTU3L3E2eTJwaUF0OWI0QjVYNExScDVkQlRmclZWL3g3Y1J2ODdjT3JC?=
 =?utf-8?B?Y2RPTUVnMytYVW9tNWZOR2xWZ2o1aGUxaCt3b01pNzN3S2dzejBnWjZscHFz?=
 =?utf-8?B?S2xQUlMveXhhV0RjY2dTM1JiV2dRY3lqYmg3QmRTRjZNeHJSRmpwOVBjYVpo?=
 =?utf-8?B?TVRQNGNCd2t3ejJuUS9aNS92Um5YeUI0YlRTaUsvUDZzRmhOZUw3cFQwYVJU?=
 =?utf-8?B?ekdRK1dEbXlRdGRSYzdtMnh5cjNBemlTd3pqeWlhbys2WW1iakRxaGNTclRw?=
 =?utf-8?B?SHFKYWNucTBSQyt5YWtIV3BKSlE2emQ4a2tRNWhDVjlPYi93VjVIdUkwTklM?=
 =?utf-8?B?Vldablg1QjErNGVmQllrUXJxTXVvWlVYbm9jWCtOb0JFVEVHdWVjb3FBQ3pW?=
 =?utf-8?B?TFkrbFJNeWJKR0xuU0xWUlREU0VyOS9uKzRYRG1kVmx3K3owdW43dzRxRldK?=
 =?utf-8?B?bnEyakwyRklGTS9yWnF6Ly9xQXVTZjdEdFdaUlQ0ZzFLT1dJSkZQckFKS3dv?=
 =?utf-8?B?dlRXWXNpdDZxSUliT2V0MW1uVTUyN2NoM2xSTCtrSWl2VjR3cFhyY1ZkdVMy?=
 =?utf-8?B?MGE4MjJZdnpFSGJDWHZPMDFjYWZQNUNXVUMvaFkrWG1sZ3RGNzNlT3NUWFpT?=
 =?utf-8?B?b0lHb2ZIU05nZ0pxYUQ2QVZUWlRja20rc1RPL3UvRlp2TXEyb3dVb2ZBMTY0?=
 =?utf-8?B?bm40TDJ2S3Y2MEQ2VFBsZUNUbXVJd1RTbUxSVXdFamRTZ2lvWWFWZ1NwMWRP?=
 =?utf-8?B?SXlSUVZ4eEJDWitvUkxIbm9LeWh3eHZFV0VBYmhGNkJkNUNXbXBlQ3BtS0ZT?=
 =?utf-8?B?NkZ5TVNnbmR5ZnUvM1d2Z3F5VUxNL0dtMS9WcE53ekh5aDdIeWQ3Z2hYSXlr?=
 =?utf-8?B?ZWtkb0RuaFBjclhOVWlOTExaaUVUT2hIOFV3RjE5NWJ3UmkyWlJobUdnR2gy?=
 =?utf-8?B?czRUdjB5MDB3TzJCRHhsbEYwOVNRMjVGakdBTHVuMWw5MVFLRzJ2cHBIMCtI?=
 =?utf-8?B?ZytkQlExd2RJVG5CYU41Z3ZaMThqNnNyRTQzOWpsUFBOTnB5RzI5cXJkNUNY?=
 =?utf-8?B?QThXaUNqbHFuZ1ZCSnFyQmVHU09HRWM3TGVkUWpnSS9yNkRFWjI1TEVYWEVF?=
 =?utf-8?B?VTNhTktFZWZlbVl0NUN4OXdQbk5XNFdYRHByQy9XSDNmQ0FnVHNqaEN4dDVQ?=
 =?utf-8?B?dWRuMiszTTlVZHN0eGFzMUdMemZzRmpSS1M0eVVkWm5aRDdONTQvZjJpcXFC?=
 =?utf-8?B?K2lxQ3o3NERMbTNKcTJycDQ0MlRONXRJU3dJMU1ST1o2dnhGUjNuUmh1YlZN?=
 =?utf-8?B?SmRHSUV5cEpUNVdDaDFhU01EUXJsRXIwTW1HK0YvQXlkblZxZHJqcDMvSWd3?=
 =?utf-8?B?UFhMdVFXSlh2VW9mYWRuengyeWRmY0dpaFB5eFV1VVF6RHh4RU80VGZhUUNk?=
 =?utf-8?B?YlU0L3pNUDJYYjd3SERNRzlEL01qNnZGUDAyZVhuYjR2WTErZDMxMUNIYnRL?=
 =?utf-8?B?ME40RDMzaU9NTVZVVGhDZ3FVdjFjQ0FGS0FRTEc1TFczZ3ZBcGVXSGZhSDhN?=
 =?utf-8?B?ODJjeDhWcElMT3B2VklwaHlySFRwWEpFWE5xdHJOelBKRWI5dXBhMEhlUE9X?=
 =?utf-8?B?UW9vb3ZyRUYyN05VbkFhTFRBTHBob3R1Ym5IeUV5OWFGT2R0RUlHcEluN0s5?=
 =?utf-8?B?RG1SY2ZkeVZ0RnQrTWVRbUZOdTZKc2NqOGhXYm5tOEd3SDVJNjFKQndGSTJ6?=
 =?utf-8?B?OE1SdXlnSlduWTZ1NXVzTWNwZ3dJRVZkc0F5Vy9OWC9TS01saXpQd1NlUEtN?=
 =?utf-8?B?ZVVvWnhVd2hTcVlwaVBIcDRPNVhzdlRPT3ZHaysyVjlxeVRTSndFaG1oeGFT?=
 =?utf-8?B?MTVhWm95NHpaLzNURGw1dXBYU25rYXBXc0VTZ1lrQVhNRkVjTWVuMzFuSjhQ?=
 =?utf-8?Q?8Z6BPixlmBd7o0lEN5+QNrLiPuSfsQSI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlJuazZvakpzaFVIaGJBdVloR3lKbXVIYzRWeGtSK0hqcUl3akoyQ0IySUJD?=
 =?utf-8?B?WkFsUVBBMm10MHNpcngwZTFJamJTVGh1KzVwY0lCd0xxbTFuUmFCazZJeUhU?=
 =?utf-8?B?TUEwM1ZiSTlrUGVsR1E0Z2lJZzJJTHIwNE1kamlWTWRMaXZES1hkR3JHSlc5?=
 =?utf-8?B?QWNQM3Yvd0cydnFXSnNrUjRTeWhFZU84THlqVklidFFDV0owbGtiUnBjNEVC?=
 =?utf-8?B?anhZOWJCcmx1bnFCWVFFRHZUeVBNcmZUZitlQktsMFFXWEc5bjI0bnBzREpB?=
 =?utf-8?B?RzN5QlRjQTZsbzkwbWlHTnM4a3VaOVFvNE9DTHUvWmIvVHlrNk9EMDB1Qy9z?=
 =?utf-8?B?ZHFnVjNWOXE0V3UvVWs1LzNXOUdjOTh6dWZsNTI4bUpzNFZNdEZ5UVphVDhs?=
 =?utf-8?B?WURrRW1OTWgwM1hRbE1ocVU4RmlDak0zdC9hRGtVOGFTYlBBaldtKzU5Y0h0?=
 =?utf-8?B?YVBERzRlcmFkbE1hQnArcW5MU0dNUENSb0lXY3VOUWRWNWc4cU5Pc1lnUmJI?=
 =?utf-8?B?ZkJEUjE5NVRxcFFFQkhSdi9vMG5IM3R6MWsrMTVsRlp4VWlHRkxrVFVON3R2?=
 =?utf-8?B?TU83Zi9HK3JVZWtTUUNXeG5VVkU4aGlMVlI5Ny85TXpEN2w3VDBTT05lTFJw?=
 =?utf-8?B?b2VyMUswek5GOXlRMHU0UjhnTXlnVzFOZFRNaHZNcFFTaDRWSEh5U3dyYTNS?=
 =?utf-8?B?L1ovVTdrVGc1N3RyOWJNYWlmZTZwNm0xT2E1V3k1MDZ5QzJZb01PaEVzY2Mr?=
 =?utf-8?B?Q0JyL1VpUmpUR0NtVHdSYWMwalJWbkltRmZuMzhKUlZ5NmE4UnJ0Q24vaWE1?=
 =?utf-8?B?cEpXbFh3ODBkN3J3UmdIZDBmeU1WbGMyWEdkMGxEV3BlOXI3UFBQZzFqRmV4?=
 =?utf-8?B?RFJsdVVFWWkrcU55SnBSd3FkWmJ6UHgvaUZlem1tUStjUG1CblVZL3JLK1pI?=
 =?utf-8?B?eG12RjFiODRTT29FVXp2NzMwMFNpK0RnYWxxY3QrRE95Z2E3MHY1OUhtbEVH?=
 =?utf-8?B?SFpQeDhSbDBESm0zdmdyT2RSaHpvNURZOGJOTDJBeTlxalJ5WUhuRzhhcUIw?=
 =?utf-8?B?YzdpbXFJZTcyRjJ5RFNjV3F6R0duSHNGdlFaak1pRHo4NklsRHJGUG53TGlO?=
 =?utf-8?B?ZU1ualBNT1dyY1hzQlRXVFh5a3Q1eU51QW5Bd2t0c2pJNm9UdnArbmJtdkM4?=
 =?utf-8?B?OWVLaDhaTGRhME9nTU53L0RlamdDanpIQUJWUmNXNjgxWmVtV3FCdEZEcFFx?=
 =?utf-8?B?cER6YjF5YlJESjVUejRDM29mQTc2d29PaXdOeHhsZ0NmRk9PeXNFUERSRnhu?=
 =?utf-8?B?dFJaTitUQlJrQVRwK0t5ZVFwVEgxbmU2anRGdDJXYm8wVDJnaW9sUHNNQ29V?=
 =?utf-8?B?QU1ZbWNhNS9VOWRwYy9IZGJHaEI1UXpQVEJVSHRuc1pkT1RKdmRtaDlwb1d6?=
 =?utf-8?B?YzFFekNZMUxjZjdQRHFpYWQ0YkdQY3liMDdlUmwyWmxhdUN4MGt4K3dKaXJ3?=
 =?utf-8?B?ZjBIRTBCeUt1SEpLN1lHMzdpSU5hTFhLQW9wbmoyN2trNFdvZEgyejJmMUNV?=
 =?utf-8?B?UzZoaUtSOG5XekwzTGJoSHh1SHhhQTFXdGw4YXdOL0JFLzV2UzUxY2VlMEpr?=
 =?utf-8?B?UGpyTzFGSCtYSnhERVc1amxVOERXYTQwam1GVThmRTR0bnh4cVhKY3VwUkxn?=
 =?utf-8?B?TGtQL2JLSmpab1Z1NDZkY0ZhMVkrQlBmUzBmOENZQUlLQkovaEplMC90K0w0?=
 =?utf-8?B?OVJvNnQyNC9yei9GTnI0M09Rd0o0SlhkOFgwblE3T0Q3WUYyZkdzUVBYZmVq?=
 =?utf-8?B?eEZBUTFCZThFMzA2bjZMMHYzckl1bTF6M0FPRE1tZ2NCWkRqbiszVVdFMGcw?=
 =?utf-8?B?SFpnYnNQVXdnUEZMZkhkZlBlMlp4eDdXYlN0MmJEM3JMQXBTTDZHbm1NTEl1?=
 =?utf-8?B?bDZWQmtiNk43dVlMN205MDhxQjltd1E0dFhwbEpmY3F4ZjF4dTd3VXh3RldL?=
 =?utf-8?B?QXZsUlgvYm52OXNsVEVJOTkya2lnM3R0bitsQXBYenY1SnpKUzAyMElUb3c3?=
 =?utf-8?B?VUluR2ZNZTUxK1BOT3J4cTEzZnRrZzNOMVFTSzhQZ0tMSjhHcjlmbFpWMUIw?=
 =?utf-8?B?VEx1aVJra1pEdElKanMrZ1c5U2VFczlvYXdveERoaWdWbDRocUpXVVRTRk05?=
 =?utf-8?Q?pIiIqhgEQhOBSy8dyUQ7PhZkR5gNyylUw0mdinC7SjnK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10b7554-6601-45e4-cdb2-08ddb96c2feb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:27:26.9302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyACkHUcju0+lzJdNHJ7djUxOFutTdYjvnsUBXvXPnL0iYw+jcLZHk67KvhIyY3Rp0lSbMTEN3uocIcTgygzaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6980

On Wed Jul 2, 2025 at 10:25 PM JST, Alexandre Courbot wrote:
>> +impl_genmask_fn!(
>> +    u64,
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::bits::genmask_u64;
>> +    /// let mask =3D genmask_u64(21..=3D39);
>> +    /// assert_eq!(mask, 0x000000ffffe00000);
>
> I think we should also have 2 examples that show the behavior at the
> limits (i.e. `0..=3D0` and `0..=3D63` here ; possibly others if you can s=
ee
> interesting cases.). They are useful to understand how the function
> actually works, and would also have caught the errors I pointed out
> above.

Also one last nit: users will count the bits on these examples, so to
make that task easier, please write long hexadecimal values as
`0x0000_00ff_ffe0_0000`. :)

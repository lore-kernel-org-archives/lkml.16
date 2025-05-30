Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A2319B5B4;
	Fri, 30 May 2025 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748588359; cv=fail; b=A6QByI+09WK2gcqovQB/K6EeANMxeCfWmI3e1Uyrdc5RwJHLKXCd+DbVcwmv8VJBvIOCCElLrC0ERnLBOfIrMx7aUX3JjV9tg1Y8o4HWztmvH3lMxK2+tCd68FrBorGFufIA3nqxRd6NoOytMmBpz1Y6ksLvxPvYtTw0+t6tXs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748588359; c=relaxed/simple;
	bh=2smKwHqZSmRoi8EoBfVtRAz23a63Pzipv+HsMUmLeug=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=DnFH5fbmrWqGOo2DHGSWJtCyOO4HrycxoKNmtg4Jn5DWqtcKs0SppObj05G+HPF7dicCM5KP7+MCkv5bLJyeG+webx/9ZJSaTFaNhPLi4XaJx3VYTXjhXCJ33cuwujyz88bUOShCsl9ptgwkpab+iiTw48PQ/AUB/ZoVSQxAeSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X4eAOWnn; arc=fail smtp.client-ip=40.107.236.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X4eAOWnn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQgfibhXtjN+Ti98sdSmgi4RmNS2ZJmeBpECtIl7leVaPJgXqvJ0xDgW4+Ae9eqAr6Dghj9dBi25ABQSSAYRrkBXCxG1qO8L1RB8l1zZWOtRK6PA9EYh+JvyG9PjHHGivJxDdTN0TkwMRxbNyROgZa3msne8Z8dz+0z+zblVWf+ZkCVPq/ZCxvwyPfOpygQ2uiKQKIAz0LivHy8aU0ZA+KyTxX7L3rMUWK5+chlsTuRluW0Sa4X6lxEtEPH0+E7RUxrNeebUIhRxP+S3LNr7HtBu/CRjottym6yOi5LB0IItwAAhdFIDh2b0vclOyJtEK3hRPUbLDdrXk7GZfkkTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOpxOxHhh4F5XYLaE5IPdgBzvT/16/5ySJ0A6XIXbE4=;
 b=j8rzMZjdzwWr2DouvF/SBWzQgg/EN1YY0vkva+bMzTMDVLCq/Oor9T0RABVTXq81+TeHo/hRRprMU9CDHGuNPLhKj6V3iU0uzOcVSBq9Y4COt0KIy3eqfV3P07WxcartH6DPYmOrcCrEr0T+3xRxkIgxMdt0DIuSckth19srps88XczpplHtUS9EAHU7x/Od1v/N6e4jIbROXdNgJ00dnjvWTNhAGyx4Dcmx0sCdbBqlyO7YLWTQhYdKtBY/0dymJMZl0x5F4QpgjqYbB1JRqKwa2V/9KE+W4fdW8/tJJlLbY2WtIlLSRG66Fwf/y+pRsdr9aoK2C7oj7/aCEiUN3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOpxOxHhh4F5XYLaE5IPdgBzvT/16/5ySJ0A6XIXbE4=;
 b=X4eAOWnndJEbWwKo3rA1i9dgyRwNn+vim6Vd8oWCECCG0poOvEbVR1XfAQ+8txshiDn7ThVBgd4nqSCWh/apMgUk4KQarLQPRUHSN7yC5cuqxhiw8D6C2+fEiwi2Acnvt86mh4DNsrY97c7lIzX8kMKM46vcUPgLpU17BBGzKCp/As/Gzc+q1viFvRPqFI4gY6zvHjykd2YzyHFH9D7Ofy8mQ/eaBIJ49UtyzOmDeo8YSZyH1Hl8R5R3+XTySOTMoI6ynhpEDnnAH1OfTpTYzsH7CdcRpbAuDLc79kGWbZ67CSS6VM5U+fhPrS2KKYr9ne8X2/7LGmXoawTAGUpKDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7933.namprd12.prod.outlook.com (2603:10b6:806:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 06:59:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 06:59:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 15:59:03 +0900
Message-Id: <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <timur@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com> <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
In-Reply-To: <2025053047-theology-unsaid-d6ac@gregkh>
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 475c0f69-1651-4b47-2e61-08dd9f47794f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elBzM0Nhd3ZIUy9rRVcxWnpuS3h5NC9MRlVwSkdCTFpDRno5YlIzekJKWHlU?=
 =?utf-8?B?OWdJQmRtQ3lXK3h1bUkvS3Y4ODJUek5QVXpTRlA1TXNEKzJzYjBkS0lhbkJp?=
 =?utf-8?B?YVVNUUJYdGZuWnZIaWtzU0dYZ3NxSE5sbkJMUVlMVTJYenZMOG82bEVJMERq?=
 =?utf-8?B?Y1BMUDdkSGc2enN1OFo2cDViSUFvVUgrV1ZscTVvZDBxdUhMSFI2bzc4ajJk?=
 =?utf-8?B?YlhDaGg5MGxBdlIwYktWcVpqNnloa1ltWWJqQTg3TWZCSTFybkI1WWFvU3lF?=
 =?utf-8?B?K3NFMytPSkNTeVJpOTNmQUFMVDNuUXZQVkFURFpQMjU0aSswSTJVUTczemUy?=
 =?utf-8?B?dmw1M3VVcFJGdVl0U1FzSnpsazYrZmVxSVduK0JPenhnK21NY1dQSWZkZ2NH?=
 =?utf-8?B?NFk0MnRuYW95anlLNTUyY0Nqa0tEVXIxdWVGdGhOREs2b3JXSExGdDhCUDB1?=
 =?utf-8?B?aVloS3BtUk94RTlVY2lhTWJKc1NMZzk5TkxTZDN1eFBxTE9oUGM0VGhIZXUz?=
 =?utf-8?B?Ty8wTzRCVzFESkFCTHlYbCt4SkE1UVB6dDRQK3BzanFvUzQ0M1JpWXFGU1VT?=
 =?utf-8?B?L3UyVjBCZWxOL05oUDRzdzdXSmF2NWlTazFFT1l4Rm54cVE1ZWxFSHBncENS?=
 =?utf-8?B?U3BQbzlaNHYwM2RlVjZOUWRuaG1UNVRGZE5BcjhSbmlMWEhPUDJORmJBSzFO?=
 =?utf-8?B?MncvMjV5ODl1eUM5d2w4WHZya1RzT0ExRDFXd0U4T0VQK0VPTm9lWUlLK3g0?=
 =?utf-8?B?VkV4N3hITGYxTzBYbG9Ebm1YMXZUVExHcDV3ajhCRlNtczFUZTQyUXpIYUZG?=
 =?utf-8?B?ZGsxaTMzc0NlcjNLdG1KM1Q5T3Q0TXlaenI0NE1jYzdtNkd1aTFhOUZRTWNr?=
 =?utf-8?B?L3lXa1J1VmFwVG5qbFZURko5YlhNcDIzaXp4RlptZ1hqSHpSRXAwMkppZEtj?=
 =?utf-8?B?WDQycCtLY2orVnpkbm9tNTZrR2IwUG1EOHg5RDlQbGFRQUk3NktwRlgxVnFU?=
 =?utf-8?B?RStWWWhNNnpKYVl6czNIQW15NFV3V1Q5NFA5WWZkVTBOZWdUTWp5RXNMQkdr?=
 =?utf-8?B?ZktXNmpidjhLTjZlUVVlWXFkMjZsblB3K0dJUHBUck04dzNMa3RoK1ZQZ0kv?=
 =?utf-8?B?cDRvbnk2SFRhVzRQZFMwOEVPMEVLREt6SEFOMVp3a2JaQXNyS0RLODgycEll?=
 =?utf-8?B?ODloK1hyZ0pGNTEvcEVySFUvTUc3S0NzeDVSWWdCL3h0akxPVkdZU2haelZv?=
 =?utf-8?B?RGlaU2NjWE44T1E4dGJnTHQ2clJKU3VxdjZTNUJaVEEweThQTXdXd2srOE1N?=
 =?utf-8?B?K3VBVW5wbjZHYklRdVZZMmRSbDUyM1lHdTBsUDh1S05CM1gzZndWeHhwc2JM?=
 =?utf-8?B?R3NoRFQ5aGJNSG1kWmR3Q1NtbTJhd2poM283WmhVNkRBZFNDT0ZPWUFFb2ZW?=
 =?utf-8?B?b2NWVzEwM1BjOERXYTVMQjNZMnNoVkdabTY0RHJycE1KaHUyWi9MUm1RN0Zy?=
 =?utf-8?B?RUs5R2swd2t4T1ExTWY5d1dzS3pBNFJ2Mzk5K0FLRnVDazJjVVQ4MkNlaSsy?=
 =?utf-8?B?MlkyV1ovRFlRa1BzbGcwNy9DZGxWUWJPeFNVbFhpKys4T2dETWFGMnpGUEN1?=
 =?utf-8?B?Z2x0Z2s2OEhBNjdJcFZzRE50WXFTU1NXVlNCZWhqWk8ydlZkMWwvWlVnWFFr?=
 =?utf-8?B?dUMwRTVobnk5c3l4dklCdy91cUViOGF4ZEZOeHQvcWZPeVQzOEFxdTRHZHRt?=
 =?utf-8?B?enA1OHBaK205OFRsNTF5a3JhZlRvNDJBRUFJU0VOQzJyeE1GRFRqNjY2eHFR?=
 =?utf-8?B?dFp1QzFzUEdGdWd5cmtLbVRwanVZaHJ0RjNWNVpsNkZ1dTFmZHhNeUp6Q1Vs?=
 =?utf-8?B?YkJFcS9VaUQwWmhWemJzc3pQV09WSGdKcnNLa3hVMnRkVkZVdUZ6aHpock1O?=
 =?utf-8?Q?0SIbyM8oaAY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUViOS90V2w5T013dEtPSjdGd2psaEV5VjVQdzlnQWVUMnRXdWhnMEVXRW9n?=
 =?utf-8?B?b1UyNVJVNndQS2lLOFJDVUsvNENNSmtCLzIwbG55MVpzUExxYTh5M1QwVmN0?=
 =?utf-8?B?TVd1KzQ5YndOM0hlU1VORHFiZW8zNjB1Tjl3bE4rdlZUR2ZnVkdMczJESlpo?=
 =?utf-8?B?ckJIbURTdGhncXQyR1NHYVBFaDdMVTk2cUxuNElLQ05YakR1SVphMExtNkxN?=
 =?utf-8?B?OU1PaThIL2lIZUZpTHQrUUljVzZyc1BMOTBjaW1JZXlZRzZPZ0RIM3ErQUg2?=
 =?utf-8?B?T2hRcXRlbHI5NWRkejM4OHJPbEVNb0VaWUptRnBFN1BYS2FpVHI4SzNCM1JV?=
 =?utf-8?B?cXc1bkRBRXZtOGlNbG9rU2lBMktsSVVTcTZzblpZZUM3a2hyTEg4OHVqaitD?=
 =?utf-8?B?MTBFSCtSUlJlUk1rZVp0WGl1Ui90VnAvNUw4TTdFU3UzOW83OHJjdGJYNnhB?=
 =?utf-8?B?MzNuSmNwdEhHRE13ZndFOXQ4UXFuaFhneUxlUlFPTTRycHhjanlSc2IyeENE?=
 =?utf-8?B?SXVIQyt6Mk92K2VhSVhaWVUybnV4N2s1c3BXTlgrWkhVVGt1SXNQcEI4T3Yr?=
 =?utf-8?B?S2tQNk9mOUk2enhkY2tCSHQ1Q2hIa0NCMHUxMHRNMklkRTFDdUpIb0dLRlRO?=
 =?utf-8?B?NlZEZ2VrZ0QrM2J6UWN4K3RNanNLdHBrdFFpb0UybHN1QmdxN0t1enhPdmFH?=
 =?utf-8?B?Rzlsbm9NSEx5UzhsREhFRGRTOGIxRUxJemZJMThPeFV3UlZaWk9zekVlWmsx?=
 =?utf-8?B?SFNKTXptRzNiMVVjdFk4NlkraFl0cDFKNkZ1b0diOVhuVmhhZ2g5SWtNYm93?=
 =?utf-8?B?TjhoY25yZ2lDOUpORFdnbnozemVTQ3VVRk1sem5HVXhOMkNLRlhIZG1IcHFM?=
 =?utf-8?B?cFJndEpTU1RUY3k3MlZVakpFVzFRQnlSblUxVXY3RldyN1VHS2IwUUw5MDJ3?=
 =?utf-8?B?TlpPaDhtdUxBYS9ySXJtMmJBTG5jbkIyOFl6bkpOZnEzYVI2WnNXWlh5cDlE?=
 =?utf-8?B?SlduU05DYmZUUzR5RFd5OXVCc29rUDVqeXlxSGcxdnlYeVpGR250VHRiK29T?=
 =?utf-8?B?aHFnS0ZjT0d6bnBYRlpHRWRnZzFBU3dsOTV6VzZJKy9lQjNQZzBueDVtbkZC?=
 =?utf-8?B?ZWtZWDdzOHpXMDJZOWErRDJhbXdKNmswQURyWnphb29KbXpHNkdYTWR6QkpN?=
 =?utf-8?B?WXR2elIweGxiZ3Y4K0JGQU9QUUlBdjdTQUNkWTE5KzFoR3hySmdsRUdxMEQ0?=
 =?utf-8?B?TmNVMlIxSGo5d1o5R2dBR0pKejd6ei9pR3dUd2t4RXBPZVYrd2xWZnQ1MHYr?=
 =?utf-8?B?eFYxK0F4SURrckZTYU52RzVtVi9Da2pyclVNT3hxNnp2Vkw5NGdETm1Yc2dX?=
 =?utf-8?B?bGJoSnJ3NGlZa2M4VzN5dWlCelErWWM1R2R6NWZ3aVdqbzlDdmJUK2tLRXJs?=
 =?utf-8?B?bVloSHdiRms3K0R2L1pGM3J0NldkenQxUWliRHIwM0swM2crN0p0N2RJajQv?=
 =?utf-8?B?MmRDU2xQemZYMWFzT1Q2VnJ3Uk5ZTWg3b1hMOFRoTW1qWThKbUVWeGtjRmpi?=
 =?utf-8?B?SElLeEZLeEpvOUtNc01WSzdnalh6UEJzMEUraWUxSXpJNTJJT3NaaGV6Nlov?=
 =?utf-8?B?SFRacTg3YWZqVHF5c2xyb2t6SExuK3BsbG1nVXVzZGRDMVhVVVJzUTFMSEVh?=
 =?utf-8?B?L0Q1TXVSSkcrWDV4cC9yUkdlMEdlSTlpSlJhdm9KMGdLTmgzQXV4dDJacnJZ?=
 =?utf-8?B?UWRyTjNRKzlwbURFbXVMMWpseHNmbWVucmw1OHhqZ3lKN2NpVnJqdy9qdm1H?=
 =?utf-8?B?QldIVEoyVTlNN2taZ3VxY3ZiaUpORTN5Q2diMnhmbG9WbTN3ZlNSZkU2dmM4?=
 =?utf-8?B?UjdKd2wxNlczSElUM3RvU28wNlJBUjg4ZXlHR0EvV0hBUjc3Vi9DeFJoOGpD?=
 =?utf-8?B?UllJMDFqRWZkaWFkN3BuMkI3dkRtTk9uVG5mOUVBVzJxbnNsZjdZb2VKdVpZ?=
 =?utf-8?B?MklLcjR6UW9kd1hhM09mRzFFUi9Zc3I4YWV0Y1JCYXVsRzQwZWJQZUxGcjFY?=
 =?utf-8?B?cjljZmhwWnVueGhiajlMWS9uOExkWEJIR1ZFd1dIdjVEVDNxOUwvVEk2NWNy?=
 =?utf-8?B?WXFpeDJMV0Z5TEhwYmtzZFYwVzBpNWs4dGRvY3QzVHpJUFdlOHg4ZXNmZzVk?=
 =?utf-8?Q?ae37+iGVBZOOAtnyRacBMznOJdiaGp96v+aMnXZYBksA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475c0f69-1651-4b47-2e61-08dd9f47794f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 06:59:08.9212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeE+I2bSkirYbBNg/7bJFSBM4ODKA805PyoIRNZkporoos8vDw/NVA570u6KUWG13ENvpuy/3mabbAHGFXTVBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7933

On Fri May 30, 2025 at 3:22 PM JST, Greg KH wrote:
> On Fri, May 30, 2025 at 09:58:02AM +0900, Alexandre Courbot wrote:
>> However, Nova also supports a couple of older chip generations that use
>> the same GSP firmware -  it is for these that the ELF unpacking must
>> occur in the kernel. IIUC this has to do with the capabilities of the
>> microcontroller that ultimately does the loading (more capable RISC-V on
>> Hopper+ vs. older and more limited Falcon).
>
> Why specifically does the kernel have to get involved here?  What
> requires it to do it that userspace can not?

I don't know of a user-space tool that is readily available and could
perform such extraction of the ELF content upon kernel request. Is there
anything like this?

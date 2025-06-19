Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81493085D4;
	Thu, 19 Jun 2025 02:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750300375; cv=fail; b=rrUHhAW1QixtJYMBCtV41e1w++LzkqYqo+hFl+X7eMH0pPr7JsaMSOxOLrkxwPyiE+6pU0tCBr775Gin4QWPiywGdb1djZ3BHf7oOUfZyo2ZfUGGbC3bSnM3m/zEIBEO+S+pzq9FyH1I93euJRi3ZAG8ez05FQ8IF7I+rQawO7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750300375; c=relaxed/simple;
	bh=LjLsqkh1yJ/M6qOCXqzC5xpznHs2fQimOgkUkg5/7HM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=aHvVvpJXLfeuB70y21De/ehkJqyPv2/PbYMOkIFcPVUrJZgXjJxK0z+8QG6C6KnGWafDZsXBcYkqsPGyw0CbcYaU8EPF853AwY4ncG7F7/olShzA3Z+lh/7sbyJLnokIha6vCXtHNkZ/fFUEYAbn59ZcTPpBRLlviVD6a8+mgQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=arwFLSLp; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="arwFLSLp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNj1JL3E5ePw9ZNakp2LtL5KLXkoiOhZ1hgt0hv5n/pg/iEw/spwwQIaAqkFHhbR9SOxyon0XWTGsysFm0HdhZ/5BWAKVM41yoOiDiUbkYnb6jLZp7nReBf7jMbWbmsw9jFlV67cQco3HNlgzq9T8S4mBlu1yCTFo3hjrSY/EX1MiOObPkzVlqSjNmP3e1AMuHRSsHDMm0zAmgrvg6GgyISMR+TmLvNAYtReLONpn5591Z/82NDVYgWlzrGMS5XTQhfdLC2CyDCfg8SZqLqKBecQWMK9YCruaKlyT715Tyop0KlSKaHq7hBg3YDNIMz6aqCBNxXfSIgc7yx6Me8rIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjLsqkh1yJ/M6qOCXqzC5xpznHs2fQimOgkUkg5/7HM=;
 b=PyPvN6ZL2DL+19McNBZvptITlXwY4Cpad5cclafXPsx9Q8QjiQrVgI95xGxL48TCOJmzexTUoSeot+uc9Q5dJDY3xl570bWQxylxeVP8BBpoCg7KcbyXlqvCP42z4RgyAUO7c7RLUCX9N2BCU/214HeeysucVBYXH5STO6afNwPU27gIgnhzz4Q9f9yJiKBAziiKjCEAhnvvZ1/hd4mJkehKZTidclekATm7ajcCiWfmQf1JnvslBsC0nbXUppku0Fj/F54tt7Mavx23nerbc1fI5wIQKNdjZvGtbUwwK+hIZss+CMhQYyj4lAeol9A87P4S2LeH+WwHzAnuOuJMnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjLsqkh1yJ/M6qOCXqzC5xpznHs2fQimOgkUkg5/7HM=;
 b=arwFLSLpVfCEiIyXsFe8NLfzPwCjwIA/WQXxEDskO3ZxTUOHFKZ8r48yjp/3mYYRbMfy4KsILrd/NA1tE7UO99T2i+SFxAH9tDTLz2x46PoksT4P/7eSthHuNMYY2SVbKkuLIsai0BKDWQFzYml3cbB7P+H+afiEVTBAxoBAfVgaKZmVgJXefO0lkMqEhd0q8S8lOloZW+urbV0q45AgB88hBumvOcfx+aO4wG9EFE3EPiEwwEDAE3VmybAz9ZtRl9l5uMZOweBOCifz5ckjMa31fh+BKBxVurVYUgEQAtVW99UGHU3vAtzDrjVXAoW+wYNZu4gSS7n7a+IjX+O3pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8172.namprd12.prod.outlook.com (2603:10b6:806:352::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 02:32:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 02:32:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 11:32:39 +0900
Message-Id: <DAQ5P0NPCHP4.1FJ30U8EW3JZ2@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] rust: str: make
 `from_bytes_with_nul_unchecked_mut` const
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
 <20250616-borrow_impls-v4-4-36f9beb3fe6a@nvidia.com>
 <DAPYYWSUVMGN.L3ICDJAIJ2PO@kernel.org>
In-Reply-To: <DAPYYWSUVMGN.L3ICDJAIJ2PO@kernel.org>
X-ClientProxiedBy: TYWPR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f59a68-954d-4906-825c-08ddaed99144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUc1M1FWYlozejFCOWoxZmVjQU9VOENwSnpDMG9kbHo0TW1VK2ptTVNGYllC?=
 =?utf-8?B?UGRPUHBKQVNPMjEyVlp0UWpzdlZGR3Fzc2lRNHJwOC91WUNMYXRMTkd3UGtW?=
 =?utf-8?B?S0RzbUhqbHhlV3l2YnVBN1ZkN3BTTzljbENEQUR5bm1qVlZJODNTLzhuTjFp?=
 =?utf-8?B?U1R3aFpETi9uczNrdzV0ZjE3blBuODJRTTNZSlJCZ3ZBbm1vWkxHNHE0ck96?=
 =?utf-8?B?dFZpZ3MvbStpeDAvdFNOT2VrRE9BdXowVzJHL1hlNVlFbkJCNC9jTjU4UlhP?=
 =?utf-8?B?M05jQmVRVjJSOXh2WmpvM1Y3OXNPYW5xZ1hhdnREajZWL2xjdG1CQ0pKY1RX?=
 =?utf-8?B?R2xVNXVoWCtMU2hmcDYrSEhFZE1rTFB2MmFoMTlranRScTB0ZFhSa2tPRGN6?=
 =?utf-8?B?bitCazBxZys5Sy9ra1RVcndyY05MbTVWazFIQ0Z2WFRCd1VrNnhCeWp4Nys1?=
 =?utf-8?B?UFk2S1p2cDFBZ296aGZrR1VQNkZYcHlJbzErMEhMTUNIeUwxbElPWUpDOHlN?=
 =?utf-8?B?bnA3OHRaUTdoajNPYWVpVyszMmszNnJ2cURjaDFSMS9YM2xSWU1oL0dFcFRS?=
 =?utf-8?B?SUFnOS8xMXF0WTE4UUtCY1QyRnNna1FBY1ZUUzFrN09IalhFM09YbnZmckF1?=
 =?utf-8?B?eW5MSG5QVjVzOFlvazlOTThPMzVTYVZtaWN5c2dhYnN5ZHdKZ3FXRG51UldX?=
 =?utf-8?B?UlRsUlZYMHdoa2lsQUdUbHJGeWVsZEt2T2N2M1Z2RE9ENk00b3ozQkRGenhq?=
 =?utf-8?B?NzBVczlrakc5MlVVSEpvNG1OMys5SUI1cWxRelczTm5qZFdzSStqZEFscEVH?=
 =?utf-8?B?ZVNOWXFXd2J5bUYyeHk1WVlMUFJ6c0NCNXRmcGsrbkRWVHBzR2JvcTlzMXRS?=
 =?utf-8?B?amM3bEE3U2JGQkxqSTVmRU5TT3l6NUZzZkdzMzVvWVZiN3VpeG1tNnMraHYw?=
 =?utf-8?B?Qjhjbzg1MWpOc2MvZ1ZDcXVqckd3NTVvMnl6UGRibW9DcGpUTkhyaUI5K29T?=
 =?utf-8?B?ODBXcVRLa21aYStOL2JxYVRBZHUxU2pZd3F1K2VyaDgvallJTHU4ODl2UDI2?=
 =?utf-8?B?YmNHMlBLRnorL3lFRlJBZ1BBbnFUMG9UaEI5NlpoK3hHZnU4cDNWSUxyVDFU?=
 =?utf-8?B?K3NqZ0lucEFsZHU0djRabk5sbXNsbEdydGNYVTBLZDh1cmpCSmpKSXR4d1kr?=
 =?utf-8?B?c3Z0S3NEZkV4K1JnTFR6dGxPNmdOK2hrTDRnYXBMNGN5UGNBUkJWZmRTMTk4?=
 =?utf-8?B?T2FJTG1FdWRZT2NrK1VuL2FaQ1JLMEloYWtOVDYwQThLVmtSVWhJQlpPQWlV?=
 =?utf-8?B?clYxVTVub2hkZDEyblc1WUpuZUR5TUJoRlZFZGdYelJKRGlCVVZ0dVNrODE3?=
 =?utf-8?B?SFFlOTArSlg0b2Rqbmx3MDhneXlwMmRIVUlKOHlxcC9mZTRYK1VaUHJvRUc1?=
 =?utf-8?B?QVlabDRBLzRXajUvZnZZdk5GMmZFTnV0dzFweXduUlBmRTBiT0NlL281WUdw?=
 =?utf-8?B?ZzJ0MlJjcW1WV0VDYWhSZUtLOHFYMU5uV21JampuY2NRNXFXVDRONk83RTBY?=
 =?utf-8?B?Mk9CKzk4Mm1CYmhBaXhEK2xYRlUrSUM0NkpLK1hGNlhSbEdpbDd3cEEvOXNa?=
 =?utf-8?B?cExuRXM1NEp1QnAzSXZRRG1jUmprcTVCcHdCQ1h6dVVvMExoaGN0TzVsRHhI?=
 =?utf-8?B?OGtTc1RuZ2FmWGg3YUNlMUFZMS9HdU5uL1k4ZXQvUklmTkUzY2dQbmNWeFBZ?=
 =?utf-8?B?Vm5YRS9QVElzSkNLZCtGTFJEM2g0dDhIYjlEVGtHa1JNT2lPWFRDNWxyWGZt?=
 =?utf-8?B?bmU4bERUKzVYdkoxSTJWVzdpRmhMS2lkT1d3cnZRUldqOXI5cVBiR2NHdkhV?=
 =?utf-8?B?dUpIUW45eWVWanFZTzZEeWN5KzhrUnJTR2ZjRFdNK0lqYlAwOHhheGdjWkNa?=
 =?utf-8?B?VDRZcXJSdnU0KzN1MXFpK2xpUTFKS2RycE5zdklpbkd4SEs1RlhZejc5Z0Zk?=
 =?utf-8?B?aHFkMURkUTVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVhldXRYRzNseUFKeThVNGR3WE5GbFpQQlJlT2VJRmMrU29UL0ZxNldub0lL?=
 =?utf-8?B?UkR0WEZacWxLMmE0VmsrYlJOTlBNdjJla0NRZ0FaV2NFckRnRHNyOXRnVUIz?=
 =?utf-8?B?c2NCMHJLQjFNMTI1cUhHMVZhb1BlbUt0MXlnemZhUnBBVWJCMEw2VzV3S2pL?=
 =?utf-8?B?TzZyTU1jNjE4dEdZaDI2RFJFOXUraElQN1hnSGJsUldDK1drcnVDeVlGQk9o?=
 =?utf-8?B?NU51V0R2TTBIeUd5N3BmZW5uSTFEb3E4WGg2d1NYcENKUG9TMVMvYnFJbVZ6?=
 =?utf-8?B?Uko0L3U3cFcyV0lPb3E0Mjk3ekZoRklvMnR3dHBjSDVWU2dGTjh6TVVnbWln?=
 =?utf-8?B?UlRtQTdZZGNBUkMzSTlJRGp4ejFUckdFYUlKRmYxTWw0TXpGdzUwbFZ0V1FU?=
 =?utf-8?B?Tm1GYjRnbXovWHpLckdud09FNHVvRWxrdHVTd0JWb2l4MmRmS3BzcVNxNEk3?=
 =?utf-8?B?eEs5UCt2TSs3VzBBbis0by84NVBjZFpCVlZza3F4b095UkhXVlZKRmV6aXo5?=
 =?utf-8?B?Y0dIOURqelBYY2JLSWtBWmQzUlh3VUcycW85bjZCcmxqUmlUZEhZbVpxMTVp?=
 =?utf-8?B?eHNPM25mY1JJamhOeFRTRmdpbERQNFpscVB2UWUzZ0FNUGJrZm9MUm54OERk?=
 =?utf-8?B?UnBkTE5pZ3pidXJQQ3ZiZExYTVZRdUFTamYrMEFPNCtzb0VhSHFZUCttZG1y?=
 =?utf-8?B?ckRzZFBmUlNIVFNUNVBlclU4OTdJU0JHdyszTUZNNWxZY1p5ZHJhdjhuWHBi?=
 =?utf-8?B?YlNQdDZwUkYwaU5OL3V1dXBDUkpSUzBVS2FtN3E2SUZTeFBVZlpRa2svTkJE?=
 =?utf-8?B?ZVZmTCs2N3YrVFRybEFSZEVNRmViM2dVRVJOWDdkM0lMQnE1VDZnNFNFOC9Q?=
 =?utf-8?B?RDc0ZTZ5RWpoTk40QVNyNUE4UStLSHNaYk5TL1ozNS8vdkVMRkhqZ3lTK0U4?=
 =?utf-8?B?UkxHdTJhR1J0STNZVTdsc2QrZXdlaUM2TTNVU2hycWs4eDdVbXFGK1p1UjNR?=
 =?utf-8?B?QkE5VThxMm9wbmpJQWlIemlxZUFTOUxLWStYeEdRaWlWQnhaYWw2Zmp0SHM5?=
 =?utf-8?B?R2xsMHRMNzdScHUza1F6aTdwVGRacUI2eS9RbU9EQmQ1UWh2MEwzZTNCVFJL?=
 =?utf-8?B?THRHdTdoQjR5Wis4V1BlRllWYk8vT0svMk1kYVErYS95VmxyZUw3K3NROXho?=
 =?utf-8?B?KzU1U25HREM2MlN0Rlg3b3V3aHJLMzVoWXMzMm9meW52VW9xUlBnaVpPbTR0?=
 =?utf-8?B?Tk1KVXJPUWdBbGllNzVTdzlTMXQzYlVBcnB0bWVNSUlGay85ZDB6bGo4alcz?=
 =?utf-8?B?SS9oQkJPV1ljMXd2a2hpUmNIZHo0NEVTb3R1TVQvZ2lCb25Pbms0NlVGdkx6?=
 =?utf-8?B?ZUg2UXpTaVJrcE8zYU12Ym81aThmU1FJRnBXd0QvS0lWRkEzcnltM3A3Ti9T?=
 =?utf-8?B?bjdLTTJWZnhmd1N1bFRtTG01MU1DcnZ0TWhXZklTQVNwUVlSOGd1bVpFT2pk?=
 =?utf-8?B?ZVgra3FkdGxZSCt5ZEliSEM5WGJtSmh5MU9sMDVtWmZMdFJOM1dRWTZYNWRq?=
 =?utf-8?B?OEgzQkdiZVNJUm1IOU1hOFpvbGNiS0dnZ0llYUR0Rk91Y3ZWTVhWSWtISTlC?=
 =?utf-8?B?a2dSd1MvTnVJRSt0KzhMRFBPVjQrRGVuTmJ2U3ppVDRSWDk2NVNYYTlkTXN6?=
 =?utf-8?B?WENyN1pVVy9jVDd4ZmgwU2RmSGplZW9pWTcwaXVBaVkrY2pYVVZXK2Y2Zk15?=
 =?utf-8?B?YW9WUzMzelB4UG9Bd0s5aE84bmdhM1JDL3EvQTd3U1Z1QkF0U3ZIa3NleDVZ?=
 =?utf-8?B?Rmg1UFYrbFBySXZSQlJzdVorbHJ0YU5LLzdMZERzV3dvSFRWZ0MwREI5b1Zv?=
 =?utf-8?B?WFZBc2dUUGtBZ0F1WjBmQzcvQW5Jd29BNHhHcUdxNjZaaWRGbmFGVTlXVm9Q?=
 =?utf-8?B?cFhRa1hqQ2h5enNzMXpJQm1wZDdHN3E2Ukw1RmhXNFQ4eGlLeTNmMkI4dlJF?=
 =?utf-8?B?YU1idHVIT0JWOEZqdG8xc3Q4WVdFRHB2SnlwWkpwUzl1eXZDcVNpSE0xd2dO?=
 =?utf-8?B?M3EwUlczbXFqWTJyN05KNTlwODFuSFVIdDA0Tk9rRmN1c1ZuMFhZODlIQjk1?=
 =?utf-8?B?MDJLd2NTWERNbHdIWEw3ZzJxcVVTNEFzb3RCOGtUc1ZIb082WXl4M2N6ZzNB?=
 =?utf-8?Q?e4A/jHCxTUqLEwMcfw5dUl9rAvE0n8Jt4HNNGSIdXtnZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f59a68-954d-4906-825c-08ddaed99144
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 02:32:42.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0dCaNWBQIGwghT9XXho/IZP/W+qjvR7c0TZcwYttZ2mu7fGOAOuuG6dkvX1J7jVgX/Xg49JpV4L2aHO8kp5Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8172

On Thu Jun 19, 2025 at 6:16 AM JST, Benno Lossin wrote:
> On Mon Jun 16, 2025 at 5:34 AM CEST, Alexandre Courbot wrote:
>> This method was probably kept non-const due to the absence of the
>> `const_mut_refs` feature, but it has been enabled since the introduction
>> of this code (and stabilized with Rust 1.83). Thus, make it const to
>> match its non-const counterpart.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Ah on second thought, this and the next two patches are a bit redundant,
> since Tamir has a series [1] removing our `CStr` and using the one from
> `core`.
>
> If you need this *now* and can't wait for Tamir's series to land, then
> we can do this and the other two changes, but othrwise I'd just use
> `CStr` from `core`.
>
> It does seem like you need `&mut CStr`, which the one in `core` doesn't
> seem to provide... But our `CStr` also doesn't have `IndexMut`, so...
> how are you using it? Giving it to a C API?
>
> In that case I don't know what we should do about [1]... @Miguel?
>
> [1]: https://lore.kernel.org/all/20250530-cstr-core-v11-0-cd9c0cbcb902@gm=
ail.com

Let's drop this part (patches 4..=3D7) for now to avoid interfering with
Tamir's work - the CString implementation was more of a drive-by, the
container types are more important to support. I will revisit after
Tamir's series lands, if needed.

As Danilo took patches 1 and 3, this just leaves patch 2 to be picked
up if it looks ok.

Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6DB1A5B99;
	Wed, 11 Jun 2025 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658218; cv=fail; b=g8DtARz0GfLp0XYJzkHyy3NnF4brpNlanDlYzgl1xvh9o78UlMWSVpIfL6oR/AYjx5L7O/71h2GGSNDhBK3kf09lxFcGbR/iwRmLmiZtjDgo58Sjb/rC8xniKqf5GEurW2LCltmdfkaAmOoQyuKi/bx7kewQiRjazoYFhWMkGBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658218; c=relaxed/simple;
	bh=ReYYLCkIkMJ2xQMuB/XHEq5an1rPAGAlzj+aZ6UVC7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V877B9SvaL4OIwoP2Dzqce0ZIt2CPclTt+I14vju6NhOlnwz52ij47VJmHMKukSFqujvEWFYGqnhACbf3td/6xAlmjZYqKSHAzexhrHK30A5bvzYqfw/cK3pywqYEXNt2KEktQNOWHFag297yGgwdnDN1hgWn/SA4Y24ZOV24rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=KIKC9DAX; arc=fail smtp.client-ip=40.107.93.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="KIKC9DAX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftz3qMHkzBEiP67mYaWYpl4+6un7fS4No9ETduLN1prNNfMFlB7TON0W1P4VZUhIEfR9j2mxvKVj1AM86Myv26rPnv7Xj0i3p6ugiue4irV8V2e3W0//s8+Rst8dK79pVq3xjxLCqTL8iy+5WUQy9yUmlenJE224MGCmOacknx2Zyn0kVlYmkojs9clBOR8WXPvjy9E42e+ZQIahZX7qt6qw7zr6zf8zWzjc77W7RCd4llCQnpzGJAlCz4DQaNCzV9G1KK02ZbvRhhxpx8D0vQRzQYve4mWUyAXwPYnYfNxcUmnKboB3FMo86z3TVc9udEux62FydtkCYe4ozmnX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVLmDjCBr8Vm4VDHHDdy+KGvN7Yg1r/ooJPOvS6hGrY=;
 b=UXRGt3oLsgxpF35oIoywhgpFU66d+pa9yl1iOpOHT2BsAxpANuJrgRc/PzV7YwUC4GsH8SHpiIE6XpAQXUITlYE1bZ+lbPxh+862sg6MFtJyo6sGvV54O6rqN5jQVe+tKAycX4+B0Ik0h3GWST6FK5MIZDawjovhfzaKvXY7SzCfzwgcflXq1rQw6ClLMgO8oyw3guui5U5DQ0rKJ4k4yzIv4x3XiLlvyIaN4o1lrzFPj3sVHXw1K3PKiW2hGOJClthVaK6h2a+1o1K7Uudzhd5b+KuxOE6bWNH9pnMTcmvFnsBj7gDikK7JrEeYuLjvOdwNJhPVZ9nMCgH7Oht1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVLmDjCBr8Vm4VDHHDdy+KGvN7Yg1r/ooJPOvS6hGrY=;
 b=KIKC9DAX4ovvohCUXrugDeATkSr4mJgcGIOzHK5gRMR1WaCCHSWqfqZsg1SYAFk3l93z6TqljFiccUjn6YjZWy30TPHiCc6fEEnpj3bTtuyvj5baApNJqmvclnMn5n8zWo99gqRrtno0QXQtyM0ansOwm7BP+sQfysAq5qYD4CFLCdUS/TTuiYl0oPSqeH5v7U9QGrYOTR4fCUN32Qfs1Cip94Jg4Pt8luASigtdfGlUHwgCgmMtg1PNCxBRZDbK06WS51HC5nfKVsmfHvTOYtuVSV1iDDG0aEz+YoJsw48Bjdlyr6ViGlhCJVrybvcV4H5OyhUhzgCxHaW486v8HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by IA3PR03MB7666.namprd03.prod.outlook.com (2603:10b6:208:507::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 16:10:10 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 16:10:09 +0000
Message-ID: <e1a26da6-9733-4e87-b794-97baa2a9cb7d@altera.com>
Date: Wed, 11 Jun 2025 09:10:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix10 service channel
To: mahesh.rao@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
 <20250610-sip_svc_upstream-v4-3-bcd9d6089071@altera.com>
Content-Language: en-US
From: Matthew Gerlach <matthew.gerlach@altera.com>
In-Reply-To: <20250610-sip_svc_upstream-v4-3-bcd9d6089071@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|IA3PR03MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 26926f17-e486-47f5-4039-08dda9026fe7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWVYNVA3a2pCdWFRWFJNTTJGQkFqMWtlRHBBYVI1TTgyUzVFYlNoTThCQlN5?=
 =?utf-8?B?NE1vdm03OUcxUCtoMkwwQWFUWGJiOWhUNk1MTmJjY2w4OHlZYXRIRWJML1lh?=
 =?utf-8?B?blk0K1g5QUoxUXpsWVdWOTdsSkFKNXVzeVp4WXhPUzR2eHF2TGxRb0MrVnV1?=
 =?utf-8?B?ZndwOFhjeGEybXAxRUx3STZibVQydFg2Ym00Vy9mRHRoZUliblVaeGxCQlI2?=
 =?utf-8?B?eFJpYmtDeEtIalk0dGlWNlA5b1Y2Z09qRmFBWTlCelhxZWhpd3NwQ2ZqY1ov?=
 =?utf-8?B?VXc0cFRKSTFpZWNkM3lIWUJoNm91OGk0d2N5MWg5TzdSdEpCblJhNlVUSmg5?=
 =?utf-8?B?RlVHWG5PYjIvY2Z3Tmo4N2xXb0ZIbDZHN2FDcnJzQWVwODFQMC9zb1hocEJy?=
 =?utf-8?B?VklpSFlRRHpiUWI3dm5RdHdyRnYwOXFLbFRVUXRCN2tVQzdoY01VVlZSclVL?=
 =?utf-8?B?L25xY0tIZlhYbHFGazluWXpYbWxzOUJlL3gwMkl3cG1IbnlJVlZGYndOQ1V5?=
 =?utf-8?B?V25zMGVFSjF1bHpyd0Ixb1VJSW9lNi9YbVJvV29FQ29oVTlWem52Nk4yRkZs?=
 =?utf-8?B?TkRpc3h2d3UrdlR3Y0N4UElGZTdPUXVFSmFVb3NqSU1VdE5MRkFDMlFEZ1VW?=
 =?utf-8?B?eFdNSTlsaFhtUUIxdEd2NnVjK2ZzTUhQRWduUEphMzhLTGxvWUdxZmxQNnZ6?=
 =?utf-8?B?TXUzTXpZd1A2QkNDNmtMdXRpY2FkcWc5L3poWHVGQWlJU05uWEEvQzRrTlZp?=
 =?utf-8?B?NzUxSmRpWktIaUJvVk9XL25YMzNMNDlWR2ZaSEpGb3UzWElHdTVNYmd3N2hS?=
 =?utf-8?B?MTk1Q1dTZmRnaEdFVkZCbEt6TGlhQ2ozQlNMRk5TQVFvbW1GS2ltc1RJRkN3?=
 =?utf-8?B?emQ3V2NBOWlub285TEx5TVF2NmxhRzNzeUxsMER3OG9ZbmdUbWxwbStlM0V1?=
 =?utf-8?B?Z3IwUFF0c3dJSWozSkpwYzZGbmxKb1owZG55d3lhL0d2M1FjUFJ4SmdSK2hy?=
 =?utf-8?B?N3BSSlNYK0lFUnZCSU9rVTk5S2Vld00vNWNxM2pBUFRKNEtxVFFtc0o1VEdx?=
 =?utf-8?B?NVRUc2hmdFJ3aWt1NEc0blNMdVlyT1pNbld6WDJoRHBXSElZVXhmeWU0Z1Jt?=
 =?utf-8?B?TDdjRWQ1OGdvc3hXVStFYjJZUHE4eWRtMm1kMmtKL1o1Yzhld29zd2Mxak5k?=
 =?utf-8?B?M0NOcnpKcTBWSkdRb1NvT3RDS0hwRGFrcEFQWTZLUC9pVmVaNjNtOVBQc0tk?=
 =?utf-8?B?TWFGZHNUMnQ3UEpyemxhU2NWRWFLbE9mbC9zVzRoU3lxKzFUZmk5emlweUZL?=
 =?utf-8?B?RURtOWlPaHpaTm5Cdko5bytseGJjTEU3azcweEI3ZGVqckxpQlhia3FGRGJQ?=
 =?utf-8?B?VXJMVW9wZ01MU3pKYUhtSjYvVTgzTTZKM05ZK0dxY1RpRVBGK1ZBUEN2VVlh?=
 =?utf-8?B?VCt5N3B5LzhJVndhR094Mkp3K1UvekxxVFVKd2VtOFRjNkhGZHNBZ0tjalBE?=
 =?utf-8?B?MVBXcnAxL1FpYTFlZ1M5aitWS0pIZWpkNTR4NTlsRjU3c29abXpiaDBZdFZ5?=
 =?utf-8?B?Y3FhQ2ZuSHBUSkk0WnNvZ3ZRSmRSdE1oUTdLRjRmdEZvUjZJNjZWYzlCSzJQ?=
 =?utf-8?B?MkwwMlBsK2E0ZmdmZEloMHZIcE5KdXZ0ZUxtSTdNSmtqTU5KcUtOaFIvSVJ4?=
 =?utf-8?B?NDJOMXlYN0I0aCt2QTY4K3VzME5KZG9VS3h6dm5RMStURnlsM3RSN1JFa1hR?=
 =?utf-8?B?YURDTUJqd1F0UHg4S2hkbnVMcHJtTDNBRWZmeWdSUzB5U2U3MGJlR01tNFNK?=
 =?utf-8?B?bkhsR0VqTk01VCtzZnFWU0FSSWhhVHozalBNU1hPUDZQelpCSHBVSHBuRG5H?=
 =?utf-8?B?NDR5ZFFMTlVqb0I1NSsvZVFZOUZmNCtRWkFsOTdwTkg0T2pJVC9sK1ZRWGQ4?=
 =?utf-8?Q?07boSMyQna0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckVVbFErNzczeGtkemt6RnFwZzQ0TlNNOCt5aGpRalExenNGUkdMSXZvalRj?=
 =?utf-8?B?czB6LzNWb0xMbEdvS0Q2U1lNclllS1RrVng1Q2JRNlg5QktRMitHbTlPUFgw?=
 =?utf-8?B?N29Xa09GVEp5Zko1b0laVmVvczBqbk4rVFY5ZWpkckZxWjNiUFQ5VXV1WmVS?=
 =?utf-8?B?elF0dHVvQUJ0YkxiSFVXNEZtamEyOGdrWFhxNXVpTEZsZjByQkRiUWZ3Y2hz?=
 =?utf-8?B?WDgzcUtXNytnMGtxUmo5VHo5Zld0UG5rVENUNXRJdm5wajFrU3FhL2FXaGJt?=
 =?utf-8?B?MWdBaEN6QkM5MnJaU1pVcG1BZGxpYzhicHdYc1RhL29sVW5yOWhkMHIzNElL?=
 =?utf-8?B?anFWanRuenhDQWpGelIxdlBzcVRKODd2NFI1ZlFEL0E3blhjMDZNbHpJVkQ1?=
 =?utf-8?B?eStaeTIrdjNaQzh2NXV1cUVSZWwyN0N0NVBrN2duUDJMMVRQMnI4V1NuMjhq?=
 =?utf-8?B?SEVaWndib1dUd2hlZlZwNkh5WHF1N1BHOFhqL1NKbGV6VUdxdU9ZaW1ZemhC?=
 =?utf-8?B?c3dqRGpYU0JzR2YwVmRURm1mYVhObEdYN0dIL3lBZ2k1Q3VqTDR6eXZSMWNq?=
 =?utf-8?B?Ym5EWHVEcTBSZ3ZVWWVjRFhPUFZmSWhjYllNR1pUZFhMZjBmbjdEOWFNVVVC?=
 =?utf-8?B?TE1NUWN3QU1HODJVdnVYVFAwSjkrMUJTbEVjTGNmRVJsOEs2aVArVnBpaXJG?=
 =?utf-8?B?MEcrcGpPZHlqa0o3MGNDUnV5TnlDU0hVNitNMzc3S1hIdmhCSUNHd0x0Q0lI?=
 =?utf-8?B?N2FiNURWenJjK3V3c0tVVmEyeEZnL1N1U3BRT3Z6aFdIYk4rQkJUclBjT3ZU?=
 =?utf-8?B?N0liS29Mc0tZU3EyRnJaWTArQVI1bVV0aUMrNFM0NFpqSlQ2N1BlMEF0Z2RK?=
 =?utf-8?B?clZQK3UrUlNHamdzLzV3R09lbTJBbTcrbm5vNXEwb3RQdXhVWE1rMDhaUEU4?=
 =?utf-8?B?VXAxNlNRdzdpRklaZGhUckFOOGRhYVZobmkzUGhSYzlIS1JWbFlaeElhZUg0?=
 =?utf-8?B?blJvZTRiRm9WOWtZYWFoLzVSdkJUY1ZabkpWS0cvbCsxb1M0WFNIMDJ6WVFE?=
 =?utf-8?B?UURlU0JCSjJMczNFK3BZRTNKMlVqK0p0dXRaMytKd2lVeHpYQjVVOWZEQ2Jx?=
 =?utf-8?B?S1N5ajFrSHd3Y3Zad3NFK2FNTlRZR2FtdmdJR3JCd0w5WGtzNFRVM2R3ZXJM?=
 =?utf-8?B?QklSOGxPL3RRVjVxR25rTHl4TUxWMUNhRXlSSS9SR1M4cmNOdWRBSDdDN3p5?=
 =?utf-8?B?cEJaV0doLzNCQUhMKzN6T0kyS2dBK295U2FEWG9vclBITndBQTlIN1U4QlEw?=
 =?utf-8?B?Nm9CT3ZINXdpbjUrUnJ6TDJYRDNvM1I3SUVkaHNLZEdNbFBndVJHeTlYWjZN?=
 =?utf-8?B?Z1lXQ0FhL1pYSTNCZWxBZUN4cnZBSUU5d3lpSjlDb0NGdXJ2QWIwYlFUdDBO?=
 =?utf-8?B?TFBOVXhXWnFFQU9tT2ZsMXNLcGJZVytTQXVLN2JEdkNweDVaR3cwTmVWb3dL?=
 =?utf-8?B?NkJjbkFJVzNCd1ZVRi9KeWJkZEp0NExTT1BzSnQweHZwNzNCd1dkckZmTUw3?=
 =?utf-8?B?eTVMS2E0cUthbFdQRkFyeVJlT05DWUdIamFLUkg5RXJjc09xSEp1bWhjUkVx?=
 =?utf-8?B?TTBYZFY0TTJVY0FhdS91cXQzSmM3UTJZQUZ5ZHZDdjBndVBFODljQnNKaGZv?=
 =?utf-8?B?UEhhbVhYY1V1Znl0ZXkvOCtPYVRqYjUyb201MFF0aVRra0o2MEx0MmM5OWlF?=
 =?utf-8?B?WEczM1VaaHREOGRGUlVuVXVZQ0MzWHVDSHA4TmRUVDRzTUtFVDMzckphbWRu?=
 =?utf-8?B?T2Q3d1FSczRnRE1XK0lLK2wrK0xWOG9Xb0VFOUY4VnNYUHBESXVSQUFwZ0ty?=
 =?utf-8?B?Wk5DYmxudVNUQjdSRi9KTjFDUTlucTZ4bmcyTEdhS1BCVTVwKzVDOTkzNmtr?=
 =?utf-8?B?ODE2c3dQOFliNGg4V2RjeUJncjRnajMwN2tCZmM0N2wwdXM0RitzT1pBdHJW?=
 =?utf-8?B?d1J4L0lTeml2c2Q5M2hKaUdJc2t0TlJScUZrZVllMGdmeDZzVVB1TmRnZEwr?=
 =?utf-8?B?R2d3NmF4MkJLc0FUb21JbCtzY2Z3U2NJeDhnRGF5QS91VStLa2FSeGl3MXpD?=
 =?utf-8?B?U2ErRnc1YzB3OWVSYU12QTkrRVV5aEpKV0R1aXpkcVdib2JCU2ZCbXdWSFV1?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26926f17-e486-47f5-4039-08dda9026fe7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 16:10:09.8164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOmOtgfmrHm4hXgXYSHAJg+6Is1qQTqe2mnYds000RTnoScs2EN09dz9xdWs3tI/owbkrdAU6G2p58iQOEJ+JgABDxlcmYw2fq6QF4gaj+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7666



On 6/10/25 8:37 AM, Mahesh Rao via B4 Relay wrote:
> From: Mahesh Rao <mahesh.rao@altera.com>
>
> Introduce support for asynchronous communication
> with the Stratix10 service channel. Define new
> structures to enable asynchronous messaging with
> the Secure Device Manager (SDM). Add and remove
> asynchronous support for existing channels.
> Implement initialization and cleanup routines for
> the asynchronous framework. Enable sending and
> polling of messages to the SDM asynchronously.
>
> The new public functions added are:
> - stratix10_svc_add_async_client: Adds an client
>          to the service channel.
> - stratix10_svc_remove_async_client: Removes an
>          asynchronous client from the service
>          channel.
> - stratix10_svc_async_send: Sends an asynchronous
>          message to the SDM mailbox in EL3 secure
>          firmware.
> - stratix10_svc_async_poll: Polls the status of an
>          asynchronous service request in EL3 secure
>          firmware.
> - stratix10_svc_async_done: Marks an asynchronous
>          transaction as complete and free's up the
>          resources.
>
> These changes enhance the functionality of the
> Stratix10 service channel by allowing for more
> efficient and flexible communication with the
> firmware.
>
> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>   drivers/firmware/stratix10-svc.c                   | 644 ++++++++++++++++++++-
>   include/linux/firmware/intel/stratix10-smc.h       |  24 +
>   .../linux/firmware/intel/stratix10-svc-client.h    |  88 +++
>   3 files changed, 753 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index 6d21f0301c3457c1b1bed52e39ee03d14294943d..7f25804351dbedf4305c8cee98c3378a924b4768 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -4,9 +4,11 @@
>    * Copyright (C) 2025, Altera Corporation
>    */
>   
> +#include <linux/atomic.h>
>   #include <linux/completion.h>
>   #include <linux/delay.h>
>   #include <linux/genalloc.h>
> +#include <linux/hashtable.h>
>   #include <linux/io.h>
>   #include <linux/kfifo.h>
>   #include <linux/kthread.h>
> @@ -44,6 +46,39 @@
>   #define STRATIX10_RSU				"stratix10-rsu"
>   #define INTEL_FCS				"intel-fcs"
>   
> +/*Maximum number of SDM client IDs.*/
> +#define MAX_SDM_CLIENT_IDS 16
> +/*Client ID for SIP Service Version 1.*/
> +#define SIP_SVC_V1_CLIENT_ID 0x1
> +/*Maximum number of SDM job IDs.*/
> +#define MAX_SDM_JOB_IDS 16
> +/*Number of bits used for asynchronous transaction hashing.*/
> +#define ASYNC_TRX_HASH_BITS 3
> +/* Total number of transaction IDs, which is a combination of
> + * client ID and job ID.
> + */
> +#define TOTAL_TRANSACTION_IDS (MAX_SDM_CLIENT_IDS * MAX_SDM_JOB_IDS)
> +
> +/*Minimum major version of the ATF for Asynchronous transactions.*/
> +#define ASYNC_ATF_MINIMUM_MAJOR_VERSION 0x3
> +/*Minimum minor version of the ATF for Asynchronous transactions.*/
> +#define ASYNC_ATF_MINIMUM_MINOR_VERSION 0x0
> +
> +/*Macro to extract the job ID from a transaction ID.*/
> +#define STRATIX10_GET_JOBID(transaction_id) ((transaction_id) & 0xf)
> +/*Macro to set a transaction ID using a client ID and a transaction ID.*/
> +#define STRATIX10_SET_TRANSACTIONID(clientid, transaction_id) \
> +	((((clientid) & 0xf) << 4) | ((transaction_id) & 0xf))
Consider using the macros GENMASK, FIELD_PREP, and FIELD_GET from 
linux/bitfield.h for the above.

> +
> +/* Macro to set a transaction ID for SIP SMC using the lower 8 bits of the
> + * transaction ID.
> + */
> +#define STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(transaction_id) \
> +	((transaction_id) & 0xff)
> +
> +/* Macro to get the SDM mailbox error status */
> +#define STRATIX10_GET_SDM_STATUS_CODE(status) ((status) & 0x3ff)
> +
>   typedef void (svc_invoke_fn)(unsigned long, unsigned long, unsigned long,
>   			     unsigned long, unsigned long, unsigned long,
>   			     unsigned long, unsigned long,
> @@ -64,7 +99,7 @@ struct stratix10_svc {
>    * @sync_complete: state for a completion
>    * @addr: physical address of shared memory block
>    * @size: size of shared memory block
> - * @invoke_fn: function to issue secure monitor or hypervisor call
> + * @invoke_fn: service clients to handle secure monitor or hypervisor calls
>    *
>    * This struct is used to save physical address and size of shared memory
>    * block. The shared memory blocked is allocated by secure monitor software
> @@ -122,6 +157,74 @@ struct stratix10_svc_data {
>   	u64 arg[3];
>   };
>   
> +/**
> + * struct stratix10_svc_async_handler - Asynchronous handler for Stratix10
> + *                                      service layer
> + * @transaction_id: Unique identifier for the transaction
> + * @achan: Pointer to the asynchronous channel structure
> + * @cb_arg: Argument to be passed to the callback function
> + * @cb: Callback function to be called upon completion
> + * @msg: Pointer to the client message structure
> + * @next: Node in the hash list
> + * @res: Response structure to store result from the secure firmware
> + *
> + * This structure is used to handle asynchronous transactions in the
> + * Stratix10 service layer. It maintains the necessary information
> + * for processing and completing asynchronous requests.
> + */
> +
> +struct stratix10_svc_async_handler {
> +	u8 transaction_id;
> +	struct stratix10_async_chan *achan;
> +	void *cb_arg;
> +	async_callback_t cb;
> +	struct stratix10_svc_client_msg *msg;
> +	struct hlist_node next;
> +	struct arm_smccc_1_2_regs res;
> +};
> +
> +/**
> + * struct stratix10_async_chan - Structure representing an asynchronous channel
> + * @async_client_id: Unique client identifier for the asynchronous operation
> + * @job_id_pool: Pointer to the job ID pool associated with this channel
> + */
> +
> +struct stratix10_async_chan {
> +	unsigned long async_client_id;
> +	struct stratix10_sip_id_pool *job_id_pool;
> +};
> +
> +/**
> + * struct stratix10_async_ctrl - Control structure for Stratix10
> + *                               asynchronous operations
> + * @initialized: Flag indicating whether the control structure has
> + *               been initialized
> + * @invoke_fn: Function pointer for invoking Stratix10 service calls
> + *             to EL3 secure firmware
> + * @async_id_pool: Pointer to the ID pool used for asynchronous
> + *                 operations
> + * @common_achan_refcount: Atomic reference count for the common
> + *                         asynchronous channel usage
> + * @common_async_chan: Pointer to the common asynchronous channel
> + *                     structure
> + * @trx_list_wr_lock: Spinlock for protecting the transaction list
> + *                    write operations
> + * @trx_list: Hash table for managing asynchronous transactions
> + */
> +
> +struct stratix10_async_ctrl {
> +	bool initialized;
> +	void (*invoke_fn)(struct stratix10_async_ctrl *actrl,
> +			  const struct arm_smccc_1_2_regs *args,
> +			  struct arm_smccc_1_2_regs *res);
> +	struct stratix10_sip_id_pool *async_id_pool;
> +	atomic_t common_achan_refcount;
> +	struct stratix10_async_chan *common_async_chan;
> +	/* spinlock to protect the writes to trx_list hash table */
> +	spinlock_t trx_list_wr_lock;
> +	DECLARE_HASHTABLE(trx_list, ASYNC_TRX_HASH_BITS);
> +};
> +
>   /**
>    * struct stratix10_svc_controller - service controller
>    * @dev: device
> @@ -135,6 +238,7 @@ struct stratix10_svc_data {
>    * @complete_status: state for completion
>    * @svc_fifo_lock: protect access to service message data queue
>    * @invoke_fn: function to issue secure monitor call or hypervisor call
> + * @actrl: async control structure
>    *
>    * This struct is used to create communication channels for service clients, to
>    * handle secure monitor or hypervisor call.
> @@ -151,6 +255,7 @@ struct stratix10_svc_controller {
>   	struct completion complete_status;
>   	spinlock_t svc_fifo_lock;
>   	svc_invoke_fn *invoke_fn;
> +	struct stratix10_async_ctrl actrl;
>   };
>   
>   /**
> @@ -159,15 +264,17 @@ struct stratix10_svc_controller {
>    * @scl: pointer to service client which owns the channel
>    * @name: service client name associated with the channel
>    * @lock: protect access to the channel
> + * @async_chan: reference to asynchronous channel object for this channel
>    *
> - * This struct is used by service client to communicate with service layer, each
> - * service client has its own channel created by service controller.
> + * This struct is used by service client to communicate with service layer.
> + * Each service client has its own channel created by service controller.
>    */
>   struct stratix10_svc_chan {
>   	struct stratix10_svc_controller *ctrl;
>   	struct stratix10_svc_client *scl;
>   	char *name;
>   	spinlock_t lock;
> +	struct stratix10_async_chan *async_chan;
>   };
>   
>   /**
> @@ -1125,6 +1232,530 @@ struct stratix10_svc_chan *stratix10_svc_request_channel_byname(
>   }
>   EXPORT_SYMBOL_GPL(stratix10_svc_request_channel_byname);
>   
> +/**
> + * stratix10_svc_add_async_client - Add an asynchronous client to the
> + * Stratix10 service channel.
> + * @chan: Pointer to the Stratix10 service channel structure.
> + * @use_unique_clientid: Boolean flag indicating whether to use a
> + * unique client ID.
> + *
> + * This function adds an asynchronous client to the specified
> + * Stratix10 service channel. If the `use_unique_clientid` flag is
> + * set to true, a unique client ID is allocated for the asynchronous
> + * channel. Otherwise, a common asynchronous channel is used.
> + *
> + * Return: 0 on success, or a negative error code on failure:
> + *         -EINVAL if the channel is NULL or the async controller is
> + *         not initialized.
> + *         -EALREADY if the async channel is already allocated.
> + *         -ENOMEM if memory allocation fails.
> + *         Other negative values if ID allocation fails.
> + */
> +int stratix10_svc_add_async_client(struct stratix10_svc_chan *chan,
> +				   bool use_unique_clientid)
> +{
> +	struct stratix10_svc_controller *ctrl;
> +	struct stratix10_async_ctrl *actrl;
> +	struct stratix10_async_chan *achan;
> +	int ret = 0;
> +
> +	if (!chan)
> +		return -EINVAL;
> +
> +	ctrl = chan->ctrl;
> +	actrl = &ctrl->actrl;
> +
> +	if (!actrl->initialized) {
> +		dev_err(ctrl->dev, "Async controller not initialized\n");
> +		return -EINVAL;
> +	}
> +
> +	if (chan->async_chan) {
> +		dev_err(ctrl->dev, "async channel already allocated\n");
> +		return -EALREADY;
> +	}
> +
> +	if (use_unique_clientid &&
> +	    atomic_read(&actrl->common_achan_refcount) > 0) {
> +		chan->async_chan = actrl->common_async_chan;
> +		atomic_inc(&actrl->common_achan_refcount);
> +		return 0;
> +	}
> +
> +	achan = kzalloc(sizeof(*achan), GFP_KERNEL);
> +	if (!achan)
> +		return -ENOMEM;
> +
> +	achan->job_id_pool = stratix10_id_pool_create(MAX_SDM_JOB_IDS);
> +	if (!achan->job_id_pool) {
> +		dev_err(ctrl->dev, "Failed to create job id pool\n");
> +		kfree(achan);
> +		return -ENOMEM;
> +	}
> +
> +	ret = stratix10_allocate_id(actrl->async_id_pool);
> +	if (ret < 0) {
> +		dev_err(ctrl->dev,
> +			"Failed to allocate async client id\n");
> +		stratix10_id_pool_destroy(achan->job_id_pool);
> +		kfree(achan);
> +		return ret;
> +	}
> +
> +	achan->async_client_id = ret;
> +	chan->async_chan = achan;
> +
> +	if (use_unique_clientid &&
> +	    atomic_read(&actrl->common_achan_refcount) == 0) {
> +		actrl->common_async_chan = achan;
> +		atomic_inc(&actrl->common_achan_refcount);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(stratix10_svc_add_async_client);
> +
> +/**
> + * stratix10_svc_remove_async_client - Remove an asynchronous client
> + *                                     from the Stratix10 service
> + *                                     channel.
> + * @chan: Pointer to the Stratix10 service channel structure.
> + *
> + * This function removes an asynchronous client associated with the
> + * given service channel. It checks if the channel and the
> + * asynchronous channel are valid, and then proceeds to decrement
> + * the reference count for the common asynchronous channel if
> + * applicable. If the reference count reaches zero, it destroys the
> + * job ID pool and deallocates the asynchronous client ID. For
> + * non-common asynchronous channels, it directly destroys the job ID
> + * pool, deallocates the asynchronous client ID, and frees the
> + * memory allocated for the asynchronous channel.
> + *
> + * Return: 0 on success, -EINVAL if the channel or asynchronous
> + *         channel is invalid.
> + */
> +int stratix10_svc_remove_async_client(struct stratix10_svc_chan *chan)
> +{
> +	struct stratix10_svc_controller *ctrl;
> +	struct stratix10_async_ctrl *actrl;
> +	struct stratix10_async_chan *achan;
> +
> +	if (!chan)
> +		return -EINVAL;
> +
> +	ctrl = chan->ctrl;
> +	actrl = &ctrl->actrl;
> +	achan = chan->async_chan;
> +
> +	if (!achan) {
> +		dev_err(ctrl->dev, "async channel not allocated\n");
> +		return -EINVAL;
> +	}
> +
> +	if (achan == actrl->common_async_chan) {
> +		atomic_dec(&actrl->common_achan_refcount);
> +		if (atomic_read(&actrl->common_achan_refcount) == 0) {
> +			stratix10_id_pool_destroy(achan->job_id_pool);
> +			stratix10_deallocate_id(actrl->async_id_pool, achan->async_client_id);
> +			kfree(achan);
> +			actrl->common_async_chan = NULL;
> +		}
> +	} else {
> +		stratix10_id_pool_destroy(achan->job_id_pool);
> +		stratix10_deallocate_id(actrl->async_id_pool, achan->async_client_id);
> +		kfree(achan);
> +	}
> +	chan->async_chan = NULL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(stratix10_svc_remove_async_client);
> +
> +/**
> + * stratix10_svc_async_send - Send an asynchronous message to the
> + *                            Stratix10 service
> + * @chan: Pointer to the service channel structure
> + * @msg: Pointer to the message to be sent
> + * @handler: Pointer to the handler for the asynchronous message
> + *           used by caller for later reference.
> + * @cb: Callback function to be called upon completion
> + * @cb_arg: Argument to be passed to the callback function
> + *
> + * This function sends an asynchronous message to the SDM mailbox in
> + * EL3 secure firmware. It performs various checks and setups,
> + * including allocating a job ID, setting up the transaction ID and
> + * packaging it to El3 firmware. The function handles different
> + * commands by setting up the appropriate arguments for the SMC call.
> + * If the SMC call is successful, the handler is set up and the
> + * function returns 0. If the SMC call fails, appropriate error
> + * handling is performed along with cleanup of resources.
> + *
> + * Return: 0 on success, -EINVAL for invalid argument, -ENOMEM if
> + * memory is not available, -EAGAIN if EL3 firmware is busy, -EBADF
> + * if the message is rejected by EL3 firmware and -EIO on other
> + * errors from EL3 firmware.
> + */
> +int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
> +			     void **handler, async_callback_t cb, void *cb_arg)
> +{
> +	struct stratix10_svc_client_msg *p_msg = (struct stratix10_svc_client_msg *)msg;
> +	struct arm_smccc_1_2_regs args = { 0 }, res = { 0 };
> +	struct stratix10_svc_async_handler *handle = NULL;
> +	struct stratix10_svc_controller *ctrl;
> +	struct stratix10_async_ctrl *actrl;
> +	struct stratix10_async_chan *achan;
> +	int ret = 0;
> +
> +	if (!chan || !msg || !handler)
> +		return -EINVAL;
> +
> +	achan = chan->async_chan;
> +	ctrl = chan->ctrl;
> +	actrl = &ctrl->actrl;
> +
> +	if (!actrl->initialized) {
> +		dev_err(ctrl->dev, "Async controller not initialized\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!achan) {
> +		dev_err(ctrl->dev, "Async channel not allocated\n");
> +		return -EINVAL;
> +	}
> +
> +	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
> +	if (!handle)
> +		return -ENOMEM;
> +
> +	ret = stratix10_allocate_id(achan->job_id_pool);
> +	if (ret < 0) {
> +		dev_err(ctrl->dev, "Failed to allocate job id\n");
> +		kfree(handle);
> +		return -ENOMEM;
> +	}
> +
> +	handle->transaction_id =
> +		STRATIX10_SET_TRANSACTIONID(achan->async_client_id, ret);
> +	handle->cb = cb;
> +	handle->msg = p_msg;
> +	handle->cb_arg = cb_arg;
> +	handle->achan = achan;
> +
> +	/*set the transaction jobid in args.a1*/
> +	args.a1 =
> +		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
> +
> +	switch (p_msg->command) {
> +	default:
> +		dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
> +		ret = -EINVAL;
> +		goto deallocate_id;
> +	}
> +
> +	/**
> +	 * There is a chance that during the execution of async_send()
> +	 * in one core, an interrupt might be received in another core;
> +	 * to mitigate this we are adding the handle to the DB and then
> +	 * send the smc call. If the smc call is rejected or busy then
> +	 * we will deallocate the handle for the client to retry again.
> +	 */
> +	spin_lock(&actrl->trx_list_wr_lock);
> +	hash_add_rcu(actrl->trx_list, &handle->next, handle->transaction_id);
> +	spin_unlock(&actrl->trx_list_wr_lock);
> +	synchronize_rcu();
> +
> +	actrl->invoke_fn(actrl, &args, &res);
> +
> +	switch (res.a0) {
> +	case INTEL_SIP_SMC_STATUS_OK:
> +		dev_dbg(ctrl->dev,
> +			"Async message sent with transaction_id 0x%02x\n",
> +			handle->transaction_id);
> +			*handler = handle;
> +		return 0;
> +	case INTEL_SIP_SMC_STATUS_BUSY:
> +		dev_warn(ctrl->dev, "Mailbox is busy, try after some time\n");
> +		ret = -EAGAIN;
> +		break;
> +	case INTEL_SIP_SMC_STATUS_REJECTED:
> +		dev_err(ctrl->dev, "Async message rejected\n");
> +		ret = -EBADF;
> +		break;
> +	default:
> +		dev_err(ctrl->dev,
> +			"Failed to send async message ,got status as %ld\n",
> +			res.a0);
> +		ret = -EIO;
> +	}
> +
> +	spin_lock(&actrl->trx_list_wr_lock);
> +	hash_del_rcu(&handle->next);
> +	spin_unlock(&actrl->trx_list_wr_lock);
> +	synchronize_rcu();
> +
> +deallocate_id:
> +	stratix10_deallocate_id(achan->job_id_pool,
> +				STRATIX10_GET_JOBID(handle->transaction_id));
> +	kfree(handle);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(stratix10_svc_async_send);
> +/**
> + * stratix10_svc_async_poll - Polls the status of an asynchronous
> + * transaction.
> + * @chan: Pointer to the service channel structure.
> + * @tx_handle: Handle to the transaction being polled.
> + * @data: Pointer to the callback data structure.
> + *
> + * This function polls the status of an asynchronous transaction
> + * identified by the given transaction handle. It ensures that the
> + * necessary structures are initialized and valid before proceeding
> + * with the poll operation. The function sets up the necessary
> + * arguments for the SMC call, invokes the call, and prepares the
> + * response data if the call is successful. If the call fails, the
> + * function returns the error mapped to the SVC status error.
> + *
> + * Return: 0 on success, -EINVAL if any input parameter is invalid,
> + *         -EAGAIN if the transaction is still in progress,
> + *         -EPERM if the command is invalid, or other negative
> + *         error codes on failure.
> + */
> +int stratix10_svc_async_poll(struct stratix10_svc_chan *chan, void *tx_handle,
> +			     struct stratix10_svc_cb_data *data)
> +{
> +	struct arm_smccc_1_2_regs args = { 0 };
> +	struct stratix10_svc_controller *ctrl;
> +	struct stratix10_async_ctrl *actrl;
> +	struct stratix10_async_chan *achan;
> +	int ret;
> +
> +	if (!chan || !tx_handle || !data)
> +		return -EINVAL;
> +
> +	ctrl = chan->ctrl;
> +	actrl = &ctrl->actrl;
> +	achan = chan->async_chan;
> +
> +	if (!achan) {
> +		dev_err(ctrl->dev, "Async channel not allocated\n");
> +		return -EINVAL;
> +	}
> +
> +	struct stratix10_svc_async_handler *handle =
It is better to define all local variables at the top of the function.
> +		(struct stratix10_svc_async_handler *)tx_handle;
> +	if (!hash_hashed(&handle->next)) {
> +		dev_err(ctrl->dev, "Invalid transaction handler\n");
> +		return -EINVAL;
> +	}
> +
> +	args.a0 = INTEL_SIP_SMC_ASYNC_POLL;
> +	args.a1 =
> +		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
> +
> +	actrl->invoke_fn(actrl, &args, &handle->res);
> +
> +	/*clear data for response*/
> +	memset(data, 0, sizeof(*data));
> +
> +	if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
> +		return 0;
> +	} else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
> +		dev_dbg(ctrl->dev, "async message is still in progress\n");
> +		return -EAGAIN;
> +	}
> +
> +	dev_err(ctrl->dev,
> +		"Failed to poll async message ,got status as %ld\n",
> +		handle->res.a0);
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(stratix10_svc_async_poll);
> +
> +/**
> + * stratix10_svc_async_done - Completes an asynchronous transaction.
> + * @chan: Pointer to the service channel structure.
> + * @tx_handle: Handle to the transaction being completed.
> + *
> + * This function completes an asynchronous transaction identified by
> + * the given transaction handle. It ensures that the necessary
> + * structures are initialized and valid before proceeding with the
> + * completion operation. The function deallocates the transaction ID,
> + * frees the memory allocated for the handler, and removes the handler
> + * from the transaction list.
> + *
> + * Return: 0 on success, -EINVAL if any input parameter is invalid,
> + * or other negative error codes on failure.
> + */
> +int stratix10_svc_async_done(struct stratix10_svc_chan *chan, void *tx_handle)
> +{
> +	struct stratix10_svc_async_handler *handle;
> +	struct stratix10_svc_controller *ctrl;
> +	struct stratix10_async_chan *achan;
> +	struct stratix10_async_ctrl *actrl;
> +
> +	if (!chan || !tx_handle)
> +		return -EINVAL;
> +
> +	ctrl = chan->ctrl;
> +	achan = chan->async_chan;
> +
> +	if (!achan) {
> +		dev_err(ctrl->dev, "async channel not allocated\n");
> +		return -EINVAL;
> +	}
> +
> +	handle = (struct stratix10_svc_async_handler *)tx_handle;
> +	if (!hash_hashed(&handle->next)) {
> +		dev_err(ctrl->dev, "Invalid transaction handle\n");
> +		return -EINVAL;
> +	}
> +
> +	actrl = &ctrl->actrl;
> +
> +	spin_lock(&actrl->trx_list_wr_lock);
> +	hash_del_rcu(&handle->next);
> +	spin_unlock(&actrl->trx_list_wr_lock);
> +	synchronize_rcu();
> +	stratix10_deallocate_id(achan->job_id_pool,
> +				STRATIX10_GET_JOBID(handle->transaction_id));
> +	kfree(handle);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(stratix10_svc_async_done);
> +
> +static inline void stratix10_smc_1_2(struct stratix10_async_ctrl *actrl,
> +				     const struct arm_smccc_1_2_regs *args,
> +				     struct arm_smccc_1_2_regs *res)
> +{
> +	arm_smccc_1_2_smc(args, res);
> +}
> +
> +/**
> + * stratix10_svc_async_init - Initialize the Stratix10 service
> + *                            controller for asynchronous operations.
> + * @controller: Pointer to the Stratix10 service controller structure.
> + *
> + * This function initializes the asynchronous service controller by
> + * setting up the necessary data structures and initializing the
> + * transaction list.
> + *
> + * Return: 0 on success, -EINVAL if the controller is NULL or already
> + *         initialized, -ENOMEM if memory allocation fails,
> + *         -EADDRINUSE if the client ID is already reserved, or other
> + *         negative error codes on failure.
> + */
> +static int stratix10_svc_async_init(struct stratix10_svc_controller *controller)
> +{
> +	struct stratix10_async_ctrl *actrl;
> +	struct arm_smccc_res res;
> +	struct device *dev;
> +	int ret;
> +
> +	if (!controller)
> +		return -EINVAL;
> +
> +	actrl = &controller->actrl;
> +
> +	if (actrl->initialized)
> +		return -EINVAL;
> +
> +	dev = controller->dev;
> +
> +	controller->invoke_fn(INTEL_SIP_SMC_SVC_VERSION, 0, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a0 != INTEL_SIP_SMC_STATUS_OK &&
> +	    !(res.a1 > ASYNC_ATF_MINIMUM_MAJOR_VERSION ||
> +	      (res.a1 == ASYNC_ATF_MINIMUM_MAJOR_VERSION &&
> +	       res.a2 >= ASYNC_ATF_MINIMUM_MINOR_VERSION))) {
> +		dev_err(dev,
> +			"Intel Service Layer Driver: ATF version is not compatible for async operation\n");
> +		return -EINVAL;
> +	}
> +
> +	actrl->invoke_fn = stratix10_smc_1_2;
> +
> +	actrl->async_id_pool = stratix10_id_pool_create(MAX_SDM_CLIENT_IDS);
> +	if (!actrl->async_id_pool)
> +		return -ENOMEM;
> +
> +	/**
> +	 * SIP_SVC_V1_CLIENT_ID is used by V1 clients/stratix10_svc_send()
> +	 * for communicating with SDM synchronously. We need to restrict this
> +	 * in V3 usage to distinguish the V1 and V3 messages in El3 firmware.
> +	 */
> +	ret = stratix10_reserve_id(actrl->async_id_pool, SIP_SVC_V1_CLIENT_ID);
> +	if (ret < 0) {
> +		dev_err(dev,
> +			"Intel Service Layer Driver: Error on reserving SIP_SVC_V1_CLIENT_ID\n");
> +		stratix10_id_pool_destroy(actrl->async_id_pool);
> +		actrl->async_id_pool = NULL;
> +		actrl->invoke_fn = NULL;
> +		return -EADDRINUSE;
> +	}
> +
> +	spin_lock_init(&actrl->trx_list_wr_lock);
> +	hash_init(actrl->trx_list);
> +	atomic_set(&actrl->common_achan_refcount, 0);
> +
> +	actrl->initialized = true;
> +	return 0;
> +}
> +
> +/**
> + * stratix10_svc_async_exit - Clean up and exit the asynchronous
> + *                            service controller
> + * @ctrl: Pointer to the stratix10_svc_controller structure
> + *
> + * This function performs the necessary cleanup for the asynchronous
> + * service controller. It checks if the controller is valid and if it
> + * has been initialized. It then locks the transaction list and safely
> + * removes and deallocates each handler in the list. The function also
> + * removes any asynchronous clients associated with the controller's
> + * channels and destroys the asynchronous ID pool. Finally, it resets
> + * the asynchronous ID pool and invoke function pointers to NULL.
> + *
> + * Return: 0 on success, -EINVAL if the controller is invalid or not
> + *         initialized.
> + */
> +static int stratix10_svc_async_exit(struct stratix10_svc_controller *ctrl)
> +{
> +	struct stratix10_svc_async_handler *handler;
> +	struct stratix10_async_ctrl *actrl;
> +	struct hlist_node *tmp;
> +	int i;
> +
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	actrl = &ctrl->actrl;
> +
> +	if (!actrl->initialized)
> +		return -EINVAL;
> +
> +	actrl->initialized = false;
> +
> +	spin_lock(&actrl->trx_list_wr_lock);
> +	hash_for_each_safe(actrl->trx_list, i, tmp, handler, next) {
> +		stratix10_deallocate_id(handler->achan->job_id_pool,
> +					STRATIX10_GET_JOBID(handler->transaction_id));
> +		hash_del_rcu(&handler->next);
> +		kfree(handler);
> +	}
> +	spin_unlock(&actrl->trx_list_wr_lock);
> +
> +	for (i = 0; i < SVC_NUM_CHANNEL; i++) {
> +		if (ctrl->chans[i].async_chan) {
> +			stratix10_svc_remove_async_client(&ctrl->chans[i]);
> +			ctrl->chans[i].async_chan = NULL;
> +		}
> +	}
> +
> +	stratix10_id_pool_destroy(actrl->async_id_pool);
> +	actrl->async_id_pool = NULL;
> +	actrl->invoke_fn = NULL;
> +
> +	return 0;
> +}
> +
>   /**
>    * stratix10_svc_free_channel() - free service channel
>    * @chan: service channel to be freed
> @@ -1385,6 +2016,11 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
>   	controller->invoke_fn = invoke_fn;
>   	init_completion(&controller->complete_status);
>   
> +	ret = stratix10_svc_async_init(controller);
> +	if (ret)
> +		dev_dbg(dev, "Intel Service Layer Driver: Error on stratix10_svc_async_init %d\n",
> +			ret);
If the call to stratix10_svc_async_init fails, it seems like 
stratix10_sv_drv_probe should fail too.

     if (ret)
         return dev_err_probe(dev, ret, "Intel Service Layer Driver: 
Error on stratix10_svc_async_init\n"); Matthew Gerlach
> +
>   	fifo_size = sizeof(struct stratix10_svc_data) * SVC_NUM_DATA_IN_FIFO;
>   	ret = kfifo_alloc(&controller->svc_fifo, fifo_size, GFP_KERNEL);
>   	if (ret) {
> @@ -1470,6 +2106,8 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
>   	struct stratix10_svc *svc = dev_get_drvdata(&pdev->dev);
>   	struct stratix10_svc_controller *ctrl = platform_get_drvdata(pdev);
>   
> +	stratix10_svc_async_exit(ctrl);
> +
>   	of_platform_depopulate(ctrl->dev);
>   
>   	platform_device_unregister(svc->intel_svc_fcs);
> diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
> index ee80ca4bb0d0c6d3aa99aeeca6a4980a315dcc43..c98ed992d23bed5aa344868ca0c77a2d19d94c06 100644
> --- a/include/linux/firmware/intel/stratix10-smc.h
> +++ b/include/linux/firmware/intel/stratix10-smc.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
>    * Copyright (C) 2017-2018, Intel Corporation
> + * Copyright (C) 2025, Altera Corporation
>    */
>   
>   #ifndef __STRATIX10_SMC_H
> @@ -47,6 +48,10 @@
>   	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64, \
>   	ARM_SMCCC_OWNER_SIP, (func_num))
>   
> +#define INTEL_SIP_SMC_ASYNC_VAL(func_name)	\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL, ARM_SMCCC_SMC_64, \
> +	ARM_SMCCC_OWNER_SIP, (func_name))
> +
>   /**
>    * Return values in INTEL_SIP_SMC_* call
>    *
> @@ -620,4 +625,23 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
>   #define INTEL_SIP_SMC_FCS_GET_PROVISION_DATA \
>   	INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FCS_GET_PROVISION_DATA)
>   
> +/**
> + * Request INTEL_SIP_SMC_ASYNC_POLL
> + * Async call used by service driver at EL1 to query mailbox response from SDM.
> + *
> + * Call register usage:
> + * a0 INTEL_SIP_SMC_ASYNC_POLL
> + * a1 transaction job id
> + * a2-17 will be used to return the response data
> + *
> + * Return status
> + * a0 INTEL_SIP_SMC_STATUS_OK
> + * a1-17 will contain the response values from mailbox for the previous send transaction
> + * Or
> + * a0 INTEL_SIP_SMC_STATUS_NO_RESPONSE
> + * a1-17 not used
> + */
> +#define INTEL_SIP_SMC_ASYNC_FUNC_ID_POLL (0xC8)
> +#define INTEL_SIP_SMC_ASYNC_POLL \
> +	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_POLL)
>   #endif
> diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
> index 60ed82112680e3674b6b7e9852d315922ffff33e..bda837815bae35fbf4df6280dba5bc02d747426e 100644
> --- a/include/linux/firmware/intel/stratix10-svc-client.h
> +++ b/include/linux/firmware/intel/stratix10-svc-client.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
>    * Copyright (C) 2017-2018, Intel Corporation
> + * Copyright (C) 2025, Altera Corporation
>    */
>   
>   #ifndef __STRATIX10_SVC_CLIENT_H
> @@ -284,5 +285,92 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg);
>    * request process.
>    */
>   void stratix10_svc_done(struct stratix10_svc_chan *chan);
> +
> +/**
> + * typedef async_callback_t - A type definition for an asynchronous callback function.
> + *
> + * This type defines a function pointer for an asynchronous callback.
> + * The callback function takes a single argument, which is a pointer to
> + * user-defined data.
> + *
> + * @param cb_arg A pointer to user-defined data passed to the callback function.
> + */
> +typedef void (*async_callback_t)(void *cb_arg);
> +
> +/**
> + * stratix10_svc_add_async_client - Add an asynchronous client to a Stratix 10
> + *                                  service channel.
> + * @chan: Pointer to the Stratix 10 service channel structure.
> + * @use_unique_clientid: Boolean flag indicating whether to use a unique client ID.
> + *
> + * This function registers an asynchronous client with the specified Stratix 10
> + * service channel. If the use_unique_clientid flag is set to true, a unique client
> + * ID will be assigned to the client.
> + *
> + * Return: 0 on success, or a negative error code on failure:
> + *         -EINVAL if the channel is NULL or the async controller is not initialized.
> + *         -EALREADY if the async channel is already allocated.
> + *         -ENOMEM if memory allocation fails.
> + *         Other negative values if ID allocation fails
> + */
> +int stratix10_svc_add_async_client(struct stratix10_svc_chan *chan, bool use_unique_clientid);
> +
> +/**
> + * stratix10_svc_remove_async_client - Remove an asynchronous client from the Stratix 10
> + *                                     service channel.
> + * @chan: Pointer to the Stratix 10 service channel structure.
> + *
> + * This function removes an asynchronous client from the specified Stratix 10 service channel.
> + * It is typically used to clean up and release resources associated with the client.
> + *
> + * Return: 0 on success, -EINVAL if the channel or asynchronous channel is invalid.
> + */
> +int stratix10_svc_remove_async_client(struct stratix10_svc_chan *chan);
> +
> +/**
> + * stratix10_svc_async_send - Send an asynchronous message to the SDM mailbox
> + *                            in EL3 secure firmware.
> + * @chan: Pointer to the service channel structure.
> + * @msg: Pointer to the message to be sent.
> + * @handler: Pointer to the handler object used by caller to track the transaction.
> + * @cb: Callback function to be called upon completion.
> + * @cb_arg: Argument to be passed to the callback function.
> + *
> + * This function sends a message asynchronously to the SDM mailbox in EL3 secure firmware.
> + * and registers a callback function to be invoked when the operation completes.
> + *
> + * Return: 0 on success,and negative error codes on failure.
> + */
> +int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg, void **handler,
> +			     async_callback_t cb, void *cb_arg);
> +
> +/**
> + * stratix10_svc_async_poll - Polls the status of an asynchronous service request.
> + * @chan: Pointer to the service channel structure.
> + * @tx_handle: Handle to the transaction being polled.
> + * @data: Pointer to the callback data structure to be filled with the result.
> + *
> + * This function checks the status of an asynchronous service request
> + * and fills the provided callback data structure with the result.
> + *
> + * Return: 0 on success, -EINVAL if any input parameter is invalid or if the
> + *         async controller is not initialized, -EAGAIN if the transaction is
> + *         still in progress, or other negative error codes on failure.
> + */
> +int stratix10_svc_async_poll(struct stratix10_svc_chan *chan, void *tx_handle,
> +			     struct stratix10_svc_cb_data *data);
> +
> +/**
> + * stratix10_svc_async_done - Complete an asynchronous transaction
> + * @chan: Pointer to the service channel structure
> + * @tx_handle: Pointer to the transaction handle
> + *
> + * This function completes an asynchronous transaction by removing the
> + * transaction from the hash table and deallocating the associated resources.
> + *
> + * Return: 0 on success, -EINVAL on invalid input or errors.
> + */
> +int stratix10_svc_async_done(struct stratix10_svc_chan *chan, void *tx_handle);
> +
>   #endif
>   
>


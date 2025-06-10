Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105EE15A85A;
	Tue, 10 Jun 2025 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571607; cv=fail; b=s/IZqe5zxmEUCt3OKgtakf56b9V2Ly3tYg8iu2k9e0phqGJ08rtBRFYGPLoB1CUX1QtECfPhDXtRSpSlmzA25KarVysUe7NAbxXwsYE3tAhQsDECRki/O1U56k7pTTXm6OnLgQ21wS0AOEqElsKmV9/cU9KAUzCENi2iR77rmH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571607; c=relaxed/simple;
	bh=PiZ/G7klF7T7XtolAgu1RSd179lsOh0vRKMoU9XlNvw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tV/EvspP6OjpIPsLqhxmwplJSFQvWGqros87dkx8k/NF+dokOH2pK2nGjO+EDSgNXN6n3hxkG2CjrB6o8rSaFeIsdujzLlknhjIo+ugVwPpxoXpNmaG7IYz4aDkOKKHb5mM+Oe3KW7SNLnyYLbu5ZdfnABNkRD0iGRFW21TwwC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=r+IsR31+; arc=fail smtp.client-ip=40.107.92.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="r+IsR31+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyVBGQ9sNPUNCSGyT5gR16nXKaeGhgFWuYE+0piUgwlU5ck6qqyD6h5TZxiXhImo4wb+FaRJwx4vwyfcL/E9of0zyxvPTlCfJggfjJMVrhuUlKq5oIRyt73pViAC4riIalXlulFMLTNY7cyxOfDiYVnlz74W6F9oC4fmGKz1pZNot0e7Frx8uyFykx4+I4e7JvNOarBT0n1TM6RuCmGpndYl1iesVLOEiSO6dtzGSN+NS9vW85BTWIgq1yaMVAidyVVuGwvV/ZuBJn1m9CMFMPn6JSwMD7ADHkNYcLeDc+ow7Hcg61CUATf0z3h8JHZ8LEz9AiwAyHfaiAsI7J6xoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMRlcww5M+jYpUBTuYAeCQptFBsWrdOXHeOr8PUUsk4=;
 b=EtlSI8JeAipzglfEwMWGPoLyszmOACqfogmA5cdJXWZ2LKs5A6wC3/hnNgNj8T6Ql2xDGVqk756n4v7aK+EIME6McCLrBZSFJ0l1TvD77tZgZgovN33RfRIL1Qdhy/U0Y78MwL1ZJwYCNGnpV14y/BMEJr99oLyIWhKtjY+AWikBTFAj9pogqBNKkl6vA8b+22QBUUKlQ2Zh+FSqso1Sox1A0UkalBw2CeRrbRS6ZweN2nn812ehSY41gLAFI5SqYB7qxI4GbsNHu2vVnOs/VMUlF3xgsNbMU5RtR7HyGyuj0ASHlsLtwLEN8LXsyz2C4fatnC6UW59yf3uMFH80og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMRlcww5M+jYpUBTuYAeCQptFBsWrdOXHeOr8PUUsk4=;
 b=r+IsR31+48DTXk4t6DnXMk86YezxFE9UFOnIMuUQ0eU8EswEU0rjCRpCCv+KN4Es/geH2nH9CnuWZKowhOLFxBGXRWCg1ICiqkeaPcWFjE5IYcN7ESOgN5OoTjYR6jUeqmYxLbRg7AeODlLSOMLceXE+8qAIC8SUFR2JHwtVrDVBcDbiPUgqKUfbuGFF3FkcL2UUHACUchu3DBacQOZ64RD6V58qbuPrPfmEz5Tj/uy+AawinyezWolEoyeTsszey1jbG5IBuf4xppOvuBFquUfMEOQYo/gS3UdsNKBJYM0vVMgZ0QYHWW0WixQOUnmUtmjRi9vy60V1exlhho1MUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by MN6PR03MB7742.namprd03.prod.outlook.com (2603:10b6:208:4f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Tue, 10 Jun
 2025 16:06:43 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%5]) with mapi id 15.20.8792.040; Tue, 10 Jun 2025
 16:06:43 +0000
Message-ID: <6c6d40fb-8c1a-4e95-a12f-9c994ae03d1f@altera.com>
Date: Tue, 10 Jun 2025 09:06:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] firmware: stratix10-svc: Add mutex lock and unlock
 in stratix10 memory allocation/free
To: mahesh.rao@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
 <20250610-sip_svc_upstream-v4-1-bcd9d6089071@altera.com>
Content-Language: en-US
From: Matthew Gerlach <matthew.gerlach@altera.com>
In-Reply-To: <20250610-sip_svc_upstream-v4-1-bcd9d6089071@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|MN6PR03MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c12b63-001b-4702-664e-08dda838cac3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHhtcGR4RFRlMjgyWFUyNDRZWmtTZFQ3QXlabURRdlJNS1o5bHF4L1kvV1FX?=
 =?utf-8?B?UFcyc2diZUw2aTUvc1FVZEFBb25OQjVmZi9yWTR5djd4eU1oS0pWZFUzdTdU?=
 =?utf-8?B?eWt1VDluZ0oyVzk0UGlpYlNwSFNLZEpNMXhvZmJjRkpmdmJlWHFiazJJYUIr?=
 =?utf-8?B?MWF3clA3Z21KdGpCZWNIUS94a3RPT1lRTlRDa0o1MjUrYlMwSWhrYzVXZjFm?=
 =?utf-8?B?dHZ2OFN1aWJiQ1VMQmljaGlLZFEyZ1VGejZWNUszVXFuc0hRSC95dEJzK044?=
 =?utf-8?B?QVMyUjhwcW9mTzIydXJuYm11V1U4YTh0eDNLREoxOUxlUFBCWTJ3ZVFjTm1l?=
 =?utf-8?B?SDZGT2xVSHphb1FiM2hxbkRUbmhFSjh2QmJGMHgrNHVrVTJBeFNJL2dtZ0o4?=
 =?utf-8?B?SmI1MC9LYVFHWXhya0JSelFwMU5hc0tBWFZEV3l4Y3RCVXJ1SlVJc0g4cUlK?=
 =?utf-8?B?VjVpL1J1Wk04OWFyMVZ5Q2hZMU1nNWtUQ2ZGbzVLL2VMRy9WeGxDaEpLbnBI?=
 =?utf-8?B?T2dyR1AyYjd6eVExekNuMUp1elJXaTRTbFhwVGZGMGRNNGJzWWJwdFFIcVdz?=
 =?utf-8?B?Y0Y2azN6b3ZjNlNadjlPbVVzY3hSNUNmVUEvZm5TblVONTQ1bW1zZ3pBZ2lh?=
 =?utf-8?B?MStsY3ZJME1BQk1MNVRtcng4T25NNFRISTA3V2NxY3J5QjRxU0FBOUtpRHFk?=
 =?utf-8?B?S2dyTitRNlNkRmFpeVdOZHJ1eWFmeXc1Y0MxeU5VbEZBUGRsbnl6WTJTcWJI?=
 =?utf-8?B?Z3lpdDJyTzZ6SVRKRmwxTW4zZGdCNVZZTmVhVngybkRwaGlBM2Nwb01WU2RN?=
 =?utf-8?B?ZnBPNHJnNTNPMFlLL2wvMDVCWHlsQk5LVDZPVHJOQnBJYmNtZXNodmhoZjdQ?=
 =?utf-8?B?eEFyaXNhT2Ywc3pYeEluWGJsbEJ5bHUrZFRSQ2h0NFJJblJRWnIwUW1DVWxG?=
 =?utf-8?B?MGNrQTJyR21CZExxeDEvR09KM0swbzZvdkFyRDRFZml5cmN6Vnd1dEdCb3ZP?=
 =?utf-8?B?YVgrbCtaU3QzN2hqeHlTdXZIaWZGZWZSclBQcFprdHlvVG9vY0l3b0dMclYw?=
 =?utf-8?B?V2w1WVFMVnNUSmFYK2p6QVY4aTMxZHplUWpyb1ZicEpGYVVwQ0Z1YmZXRlFU?=
 =?utf-8?B?ckQyMmlMSzlLS0xhQkgvMVAwemxVYlp1clVTdE8vT2dIcE8xelRXQllBVlV2?=
 =?utf-8?B?Mm00RWx6M3psUEVhVU9VbnMrbktzYUlEa1ZIc3NWelp3N3dwcFZ4dnFvRldh?=
 =?utf-8?B?VjlWSDVOSFlydThndHgrTUxaWEdKU1loT1pDTWROWTNEcVE1VG5KTys0ZjJN?=
 =?utf-8?B?dG50KzFDUzJEMDYvOXVMRFlvWlNDbkZDNWVKamplWG5qbGhZdzlzTmY2cEox?=
 =?utf-8?B?aWZ6WXZvWlFqT3Q3TzhtdDMwOVVuS3NzS05vNVZtaWZCZFY0clhCUml0VWsz?=
 =?utf-8?B?MytYV01kZTY1eGdmMFBrZjRVcUQ4Vktvd044cXZDZEhtZ2todGxnN3Q4OHZn?=
 =?utf-8?B?dE1YUC9URTd4eVFiSk9EVTFyRWx0K0lWVFlZOTVQMHRVclloUk40WGFCQkpL?=
 =?utf-8?B?cVBWR0FNbHRPVWkySzNxc21TVWQwcEVlMDQwOUhlbUxVbWVjOHpYWjVpTVZo?=
 =?utf-8?B?QlU3ZkY5aW9rdlRLMTcyTE5oQzh0c3dkR0ZmMUI0QjNHbEFsQmJRUVVha1Vw?=
 =?utf-8?B?S0ZCSGJUY1k5UUgzMlhIMVhMd3k1RVBCRG9Xc0tpaTRidld0ZW9DaVFYWklF?=
 =?utf-8?B?SDZwYXFQaDY5djhQZEFTS3d5QlRkRjlTbFZxTWdnczMxek55dzZqM0VFRkFl?=
 =?utf-8?B?Q250VWt3SUJrM01JWEgxZ3R2SzVCN0lrOXg1OHpQdmdQQ0N0OTFWQ3dCeEpK?=
 =?utf-8?B?aFFBV3d5TTg3bElESWFtbjhLdzZEZFNucUxUUDlvenRqQjFiWldNSkpUTGxq?=
 =?utf-8?Q?2zMfWb6zuKw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmV0SkhGUlN3WTVRbWZBMC8rQ3BibVdrTUE2c3lQbWlVUnYveGZQY0Y0WTl6?=
 =?utf-8?B?WmlUVUZlNlJnTlUvVGRjOUVJUkVValBSeEJ1R3F4TU9WL3NaU3VMZUtQR3gr?=
 =?utf-8?B?b08xYktRQ2NhUFN4NlJTZkgvVFduTXR1VHhVeTZWRERFb2pGYVhNWXBQSElM?=
 =?utf-8?B?OGZ6UG4xNm1kbjJJZlN2UzV3OWtNOVZHRnJnazRxbTJ4REdpMi94MHpKazkw?=
 =?utf-8?B?dzZBRk5qNmZ6NFhNM1RVaFlROHVyayttNnRHcTBxWUp5VWYrMXVQV09YRXhS?=
 =?utf-8?B?aEZ6RHl5K21Rdjl6bGIwMDNXWDRrQk5QcWJ5VEpUQURlQ25lOW1lOTg3a0F2?=
 =?utf-8?B?N2txTTFLUDdiSkU0dGFqZGNjTHNVNzg3Y1JnMmQ3dW44c01mdGErN1dWeEZl?=
 =?utf-8?B?N0k1RC9tZXRPOXN6S3VwSHc3K1lXaG95Qmd1dXRHcEhMMmVkR3pOdXB0SGhV?=
 =?utf-8?B?QUJHRDQydHQyd3MzMmRqZ0pnOEJnS1hDTDRQWTJ2czZKNk9LdmltL2t5TFdU?=
 =?utf-8?B?NDhGaGVvL0ZPTFh1ZlJweEVGdTcxK1phS3Y0anpiRUlETWRJVUgvaTFZdU81?=
 =?utf-8?B?OEVBWUt4OENaL0c1TTVBbjRQYU1iRjVaZU5ha1h5NllYRDdyQmdDeGJobEN2?=
 =?utf-8?B?aEswV2x3OWRSdzFZaVV2S3Q5Rk14YTFHZTM1VmZQSWIrVkFZMlZxbjByZDhT?=
 =?utf-8?B?U0JvVDlkY00rNW5ycndPRVRRTExZekExckVPZExuTi9Ia2h1YXA0dGNrQVg5?=
 =?utf-8?B?ejRKK0N3ZFlaTDlVSGN5cGphKy9adE9QbHlMdTAwQmxqc0FSdHk3M3VzWDhr?=
 =?utf-8?B?M1pQczVLMmNLOURsMVBJQnZQK21EdmRuTmg1WTFFWk5QYmpBVER6Wk1YTGp0?=
 =?utf-8?B?cGNlNGVyRnhSWnlkc2VLbDFEZDFzWk1EWTdrMjV0UVRxQ0tFWkxhc0hCQTdV?=
 =?utf-8?B?KzV0aWhVS00vR1VqYTgrbGpiUTM0SFZrSUtQeVlUbjNDbnN2MWZPZEFxL2Vx?=
 =?utf-8?B?emNCS1RwTnhBV3BnZktmMDlkcGxvdVMxTWorUU55ODh6c0FXbFFKcGNnKzQ0?=
 =?utf-8?B?SWVOajhVN3FBTG43VkFaY3hNazhnd3R3NmJZNkx3S1IydWptWTJQUy9sUmli?=
 =?utf-8?B?dURnTVZocVFCYWNRUWVIUFdoT2czUFE2WS9wY0dwZW51ZzdBbW5Lak43UDNS?=
 =?utf-8?B?OUg5a1dQaVN5Yy96L3pqYTBwZU1KM3hqQjltbDRnQ1o0Nm9GOHN4cEU5djVU?=
 =?utf-8?B?VG1DTjk2dmx5bnpXUVFjOHlWLzJhWWpCaXRLOEpMOFA0b09RclJkdllMdFgr?=
 =?utf-8?B?dVc0QTI3bVBZdmJka1l5ZkxqdEJZRmd5V3lKSFJva3dJbG5mUDBCUVVzaVk5?=
 =?utf-8?B?eEE5emZDeWpzSS9JcGlyay80bC9Zc0pJTFRENFZvanpQSkFPa2UrdHlHNGRz?=
 =?utf-8?B?ZmZHTkhrWVpWeTR1VXEwUlhWenhieDI3SC9tZS8xN08vUCtWQy9xdWVuQU92?=
 =?utf-8?B?dm44TnZhZGwrRnZFd1lidUR1VzR2RHBmOG1ZSzlnV2NkVnJPNHNSZUsvUG05?=
 =?utf-8?B?VlAyUCtxU3psNWVMbDc5Rjg2SlBuNlpETEEvMWd4bkZEdkxxYklYVkZtUUhJ?=
 =?utf-8?B?bnJ6WFk2TC8wTGwvUXppQXVvaGVjbnhLZkZIQ0ZobXJXeHlLN1Y4bGdkZzY3?=
 =?utf-8?B?TkJaZnpjaWQ4aEJEdkM1dDQvWE9JSFZXUWkzSUttSTBCNDVyMFVSdzhJM0tY?=
 =?utf-8?B?Z0dleWdYL1BLMzljd3B6TzZpam9LRVBsaEt6ZWhVWEdPMlB2VUFTUkpjQTlB?=
 =?utf-8?B?QWk2UTFuaW5BSy85MEFpR2lQajhSS2d3NlJMMm1RZ0Q1ZEpsd0p3S3F0OGtP?=
 =?utf-8?B?aGFCSld1QTlxN3ptM1lQODI3QWFkWU0xODBxWlFnN2FSdEw3VlE5VU9sSjdB?=
 =?utf-8?B?SjhKZ1VDODJHbWJac01BanZMN0FrRjJiMXRpRGV2STF0N0k0U2ZvU1YzWWQ1?=
 =?utf-8?B?OVE3Skx3OHpMY0t5blZITU9DRExJWW9XWkc1UGVKNzhzNHRqSGVJanZlYXBm?=
 =?utf-8?B?Q0lFQnBqNHYybzB4U1JyMlV0S3NoaUdqbkc3MjkxbUVWZ0I3WFZoVHJZa3VF?=
 =?utf-8?B?T3VETTVEN1NtS1k0NkNpbzdOKzJmb3V3WXNQOGpyb1RadURXTkdvVmxibU9I?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c12b63-001b-4702-664e-08dda838cac3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 16:06:43.2580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ce0kvf39dVMRp43cLJn79T3M1h6RIQWtNu47ezvgfbg6FswdpORiBLaVuGYmuiyNZPTYZH+JLGUOoV+e2ytwEai6XI1U1/MQi5k8/Hf4tcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7742


On 6/10/25 8:37 AM, Mahesh Rao via B4 Relay wrote:
> From: Mahesh Rao <mahesh.rao@altera.com>
>
> This commit adds a mutex lock to protect the
> stratix10_svc_allocate_memory and
> stratix10_svc_free_memory functions to ensure
> thread safety when allocating and freeing memory.
> This prevents potential race conditions and ensures
> synchronization.
>
> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>   drivers/firmware/stratix10-svc.c | 30 +++++++++++++++++++++++-------
>   1 file changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index e3f990d888d71829f0ab22b8a59aa7af0316bea0..955468555738b2031dfcf6dc4db7dbf11ccc482c 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
>    * Copyright (C) 2017-2018, Intel Corporation
> + * Copyright (C) 2025, Altera Corporation
>    */
>   
>   #include <linux/completion.h>
> @@ -171,6 +172,10 @@ struct stratix10_svc_chan {
>   
>   static LIST_HEAD(svc_ctrl);
>   static LIST_HEAD(svc_data_mem);
> +/* svc_mem_lock protects access to the svc_data_mem list for
> + * concurrent multi-client operations
> + */
> +static DEFINE_MUTEX(svc_mem_lock);
>   
>   /**
>    * svc_pa_to_va() - translate physical address to virtual address
> @@ -182,14 +187,17 @@ static LIST_HEAD(svc_data_mem);
>   static void *svc_pa_to_va(unsigned long addr)
>   {
>   	struct stratix10_svc_data_mem *pmem;
> +	void *ret = NULL;
>   
>   	pr_debug("claim back P-addr=0x%016x\n", (unsigned int)addr);
> +	mutex_lock(&svc_mem_lock);
>   	list_for_each_entry(pmem, &svc_data_mem, node)
> -		if (pmem->paddr == addr)
> -			return pmem->vaddr;
> -
> -	/* physical address is not found */
> -	return NULL;
> +		if (pmem->paddr == addr) {
> +			/* physical address is found */
> +			ret = pmem->vaddr;

I think you want a "break;" here.


Matthew Geralch

> +		}
> +	mutex_unlock(&svc_mem_lock);
> +	return ret;
>   }
>   
>   /**
> @@ -990,6 +998,7 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
>   			p_data->flag = ct->flags;
>   		}
>   	} else {
> +		mutex_lock(&svc_mem_lock);
>   		list_for_each_entry(p_mem, &svc_data_mem, node)
>   			if (p_mem->vaddr == p_msg->payload) {
>   				p_data->paddr = p_mem->paddr;
> @@ -1006,6 +1015,7 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
>   					break;
>   				}
>   		}
> +		mutex_unlock(&svc_mem_lock);
>   	}
>   
>   	p_data->command = p_msg->command;
> @@ -1072,9 +1082,12 @@ void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
>   	if (!pmem)
>   		return ERR_PTR(-ENOMEM);
>   
> +	mutex_lock(&svc_mem_lock);
>   	va = gen_pool_alloc(genpool, s);
> -	if (!va)
> +	if (!va) {
> +		mutex_unlock(&svc_mem_lock);
>   		return ERR_PTR(-ENOMEM);
> +	}
>   
>   	memset((void *)va, 0, s);
>   	pa = gen_pool_virt_to_phys(genpool, va);
> @@ -1086,6 +1099,7 @@ void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
>   	pr_debug("%s: va=%p, pa=0x%016x\n", __func__,
>   		 pmem->vaddr, (unsigned int)pmem->paddr);
>   
> +	mutex_unlock(&svc_mem_lock);
>   	return (void *)va;
>   }
>   EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
> @@ -1100,6 +1114,7 @@ EXPORT_SYMBOL_GPL(stratix10_svc_allocate_memory);
>   void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
>   {
>   	struct stratix10_svc_data_mem *pmem;
> +	mutex_lock(&svc_mem_lock);
>   
>   	list_for_each_entry(pmem, &svc_data_mem, node)
>   		if (pmem->vaddr == kaddr) {
> @@ -1107,9 +1122,10 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
>   				       (unsigned long)kaddr, pmem->size);
>   			pmem->vaddr = NULL;
>   			list_del(&pmem->node);
> +			mutex_unlock(&svc_mem_lock);
>   			return;
>   		}
> -
> +	mutex_unlock(&svc_mem_lock);
>   	list_del(&svc_data_mem);
>   }
>   EXPORT_SYMBOL_GPL(stratix10_svc_free_memory);
>

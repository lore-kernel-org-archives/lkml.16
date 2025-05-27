Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7E027814A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357790; cv=fail; b=pqcSkbiVwNCwQIpkpvfjWD2CxJ8s9C7+Bx11AQSAGL3cl+4CjPY9zkdcQzZPjYB4uXDe/zldeR76AAJCqBxGRozOiQbO3nGz2y+kDhCOjKM+lsE4ZF7NkWQJBigNjrZ3IqKSJT1DZjSa9VVRB45G1CR8NraHz3hwE360VPRsynU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357790; c=relaxed/simple;
	bh=yYBXSfBR3G8WlqtsvMpsyP+kcIUXEc9e6QFqO8NH1+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e8opRvFJlsh84b68hPJ45K9JdRe8i+Pz2PdUkxmWhWzpW0X0DxjURFSUrgQUZrxiYVbi+/UI2VWDLzbWnR9ZT2DAV2n6MAP5dl8g21/zwi2VGFE3KWqnTvxO8EvFVfTt1P28Zx4aPqDRVNawDEpKsp6zWhsBpVtLSj8un2T5ha0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ayuo3idM; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ayuo3idM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlUEc3k/Px7kXahTurkU5miNm44jjif67lk6hhpvToL7pZoEoFNwxiBG7rXTax7uzpQRtxFv4Cf8jRkU+Eu4cZtUZJpM5XPO/Gx7bQxITIDY61YGUx/Sax/JN8U0w/TuGdcCsmqw6RsJn6BN6dF3gWfFgiDflBc9/r+23u1Cl5rgZj3MyO1Ots8C6rNz+mbQJkMRVw0I+tO5yPZVt/0TfAQIM2a35sjHQACFf3vt5YQwGr1Y5g0la4+Ho72g0Ihp/IIpqSUJLLC7Ta6vBw3Vz2ZN/csRlwx6gWyxk6Qboee+RoOUNo/OjJn20fnb8LfC0VF12zmv6b/iVlBR6f7bbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XQen3+sd0oKh7r13acRP0kXb38rjm8PAPFY0dRFULQ=;
 b=OoD/kHaC5U6AJ6YP2XSpSLz2TIrQ0k+UZqjJLAIjOcq2sIPpZ3djoLL9wbFdRKtRZvCC0ce2Uny9zDjeeNOoAtny8KPJkjzkzPc0U3hJN+YFHDiLYyjMbtR1zoiIKmX6R9yMwueT746RLvbP5YNHib3IntCzuSw5CHfYo1GXPRy6wHY9v6WOx4gT60FbhNvoIQuF3GCafW9mvTgQxHLVOVg8tRGGOXbJJ3fYGK9KiRPhH4amcgslBjl8Gkql9t7H6rleoZpnwviLVHS1jtIGfbSHFOSZlu73vZpFZ6HnitF5qg6kKq62fj/gi8ASXsLIWQtleOW1xCWIf/OZjXUyDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XQen3+sd0oKh7r13acRP0kXb38rjm8PAPFY0dRFULQ=;
 b=Ayuo3idMhrHOl2+dqNc6U2qQmXNEDHiYi9pAT/uunR67spIneSUSIB/DPx0oG8WiRkfgUX1RhI1IDSII7v2PE5zhLiPKK0fBDGpB+56orwztH05bo0LWpsMQ0lQz7/mWEklp7yPWy+ec2wn472t1tibRsJ6c01b9BGWIjp96D2ijYtGH8Io0Ngr/noq5OdZqmD7TI2zEsYg2MqbIgyY1eSj+2+JFH3bW77EnzonUVd3SR6SkPHjfxzdsy7P9vnqrwq3GlWf3AbFaTtXUgjOe2Uiw7QCd3n7ySVEHs+btzMu5n7gmUoGn3+Hq3j7ELaWw2qtuJ1MjIoAl8S5d/kE8Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB8827.namprd12.prod.outlook.com (2603:10b6:510:26b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 14:56:23 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 14:56:22 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] mm/page_isolation: make page isolation a
 standalone bit.
Date: Tue, 27 May 2025 10:56:20 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <6D760A9C-E821-4D0D-8E9B-B6B33FD55ACC@nvidia.com>
In-Reply-To: <3b1524b1-cb3b-4abc-8044-0a9ad30a26cd@suse.cz>
References: <20250523191258.339826-1-ziy@nvidia.com>
 <20250523191258.339826-3-ziy@nvidia.com>
 <3b1524b1-cb3b-4abc-8044-0a9ad30a26cd@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR11CA0013.namprd11.prod.outlook.com
 (2603:10b6:208:23b::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1379ef-1baf-4b9b-6be3-08dd9d2ea57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkxGUzdUQk5JKzhFZmx6RjM0My9aQmM1T1l0Mmg3Y01rYU4ycjMzSllHc3pt?=
 =?utf-8?B?WWtxUlFJM2sxbG9FMGw4R1EzZlpqZkxrcDVzQ0w0Y2JhYkdWcFRFOFFvLzFZ?=
 =?utf-8?B?U2pRZ05lRU14emRNcCt3MkNZc0tLVy9mb3FEWE1URkRIRHlvZTZ0eU9US1dG?=
 =?utf-8?B?SnBsWGFuUXUxa2lGeGJMTXF6ajEvWVgyLzhCWktialBNS09HRmxEaFZ2Nnk2?=
 =?utf-8?B?bmdzM3UxRWRXRDh6ZmJoSjN4c2JBeGZadHg0dTd3Qm5BMkk1b2JiN2JWMm44?=
 =?utf-8?B?SmxiSm43ZEVqNWppMnh5VDdLVHFmd1E4MER3QUxweHdqcWN5SXJsS3VoS2lm?=
 =?utf-8?B?M0FLM25iSVhkUWdvYTFrZHl1NFRqSXdvV0d1VnpjeE15aUxoMytGL3lnbEl1?=
 =?utf-8?B?MnpBd3QvM2xWMjRBaU5uQkMxYWFUU3kxSzRrVmVoOFVJWExtUHFWUmxzSTVi?=
 =?utf-8?B?T0Vjaytra0FOUmxCNnpscEtTK1g4M2djcTFTTE53cGx0WTVxVWs5WnFGOUR2?=
 =?utf-8?B?cmhzYnJSM0JKdy84dVlYWUJZUTVhRHZkblpGeW92Q0FPd2Y5dlkvNFRPWUFN?=
 =?utf-8?B?RTFFZEFObGsvYVAwNXhnZVVLUEFDMVdNWjcwTnI1QlFpR0xOUHhTcDl6NzBD?=
 =?utf-8?B?b1dhVXRONmVDWEF2VFZnZ2t1NkpmWTU2RmdveVd3aFVPZkYybGNuUnJReVVu?=
 =?utf-8?B?UmZZbitJZ0FIam43SGZDcWQvaWxTYi9wc0k4U2xYREhvNTZPK2N4MENzR1VF?=
 =?utf-8?B?S0dOMzJtUmJOL0xsd3dnQU4reHlERXQrMThQRHYwekVTeVpMcVNhMkNpdFhS?=
 =?utf-8?B?ZWg4Q3ZHeGVpeXJhSWtqdGFVbVNBbzRyMnR2REFzWXF4MXdJWXFseEEyTGtv?=
 =?utf-8?B?T1FseFBzaG5WWXEvYnJYYnNkRXNJU3JkRVgrVEsyZHFtWEp2WXZVMzN5U1U5?=
 =?utf-8?B?ckZxTS9RUU94czFYZ041R3grWnNTeVVOSUFWMHpDbk1Xd1dvSjYxSGFybUsz?=
 =?utf-8?B?Q0laQzc4b3V2SDVlY2FTdmVlWUxBWUhUL3VUWnZiNzhSNTNhVEdLV2szM2I2?=
 =?utf-8?B?dEpZN2RVbml2QzMzVGtVbWJkejFLQ0EveVRWcldUeUFlRVZHS1locEJXbENl?=
 =?utf-8?B?Ukw3MFo3VCtKMHdnTjNnYWxKT2tVQituUERiMmlFcG42QjVOQ1lwTUUwSzlk?=
 =?utf-8?B?eVVoNVJOOVpSNVRncW1aZkJwMjVHa1BzUFdCSkRhUTVla3pJYXZ2blMzaG13?=
 =?utf-8?B?SUxHOW43NlNiWXZqV0xuQm9RczlSKzRtWU1vSjF3Y1IyWU15S3VvMnNnMWlQ?=
 =?utf-8?B?SjlhTWVTQzl5QmF5amtwK0hlSWNkdExjejV3d3NuWlh1TnloV01IM2lOZklP?=
 =?utf-8?B?UlNic2FBS2xETG9jY0VaRW9UVmJDS1pncXB4SWxFL3RoU2UzL05QN05Id1Ri?=
 =?utf-8?B?TVFXYm1LZVAzZVNFemJ3YURjSy82aUN5M0JsdDRuc205ZDVSanRpc1dZS0Rj?=
 =?utf-8?B?V0ZLaDQydWhvcnJPeG05VVN4SW5qOHplZG5QdFVrQjAyTzZnbFFiQ1BYM2N3?=
 =?utf-8?B?TjdNRGtCaldvdmh5QjF5MndlRWVnZ08zTC9VRnYvSUJEdy9JQ2I2UGhQRWx5?=
 =?utf-8?B?UjJpTHRKTjBBN1NqT1VwWFlCcFpZTHE3SGpWdlpXYmFtaDFRVGJTcUxIeFJq?=
 =?utf-8?B?aFZuYk9kdnh4S0FoTm1UQytKK0k1YU1WK2lEbjQxc2xaWmJnd2xjMS9KdDZ0?=
 =?utf-8?B?OXovZ2hmWnNPMm5pY3BXcEZ6UVd2d3VoQkFwaVVtR1ZOWklKNTk1ZmY0aTkw?=
 =?utf-8?B?SXFzSzhGT0JHeld0M1BnM1orTituU3ZReEJiRXEvWE5sQk1LWC90dU5PRGwy?=
 =?utf-8?B?bFRVNEpqZXptZTlnOVh2a1NGdmZoSTRKT25tZVYrekxVaFQxWUU5bEdna2w5?=
 =?utf-8?Q?XiTwkI3bCxE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THZFTjAwdXgrMS9qSHdFckZmb2tsakxOaG80NjlQMm00YzJDME45cjJTajJ3?=
 =?utf-8?B?eDN6MjdSY2hGVDZaaFpIMFZxSFBYSDUrelVSelE3amFReEVKWFg1dU9WQzNi?=
 =?utf-8?B?Qm94blNUQ0J4c3dqcjJYMUhsV1owTGhQeW9namIvZUVTY1hFaEVBZEpnVTZY?=
 =?utf-8?B?VkZkMjA0M1BJOFo1d2lxTjNjVitERjF2Smh5QS85YnIxeE1XN09vbVFuMTRV?=
 =?utf-8?B?WlBXdkFqOWtvcHhzZVdGdTZ5Vkw5dUZ6QUFEYUVZaHhVbXRnbTJ3RGdFSnFT?=
 =?utf-8?B?dks4OUw3ZEsyTGMzSDF5djhxNUV1RE1xR2NhaE1rRkFvbnRhKzRXQ2VPUi83?=
 =?utf-8?B?eWlJOTNYZGh2TSsvVmpBdnNNL01BOUZlZ3JyM2htdzFIc1hwVE91OVdoenlS?=
 =?utf-8?B?UEs1L0dTZnlNb2xnQU5lV3hkdEVyUVlqZ2dBZWF6V2UwQ1FNLzd1ZmRjQ1k0?=
 =?utf-8?B?eFJhamVwaXVIam1vY1MySXc3b3djYWdhM251QzFyQk9oVmRxYVFmUERKNXVS?=
 =?utf-8?B?OTE1c0l4N3ZxQkduSTRGOHcwUk41NERza0tyZ28vdlc3QjlBZUdzdG5mWDdx?=
 =?utf-8?B?VWFOVE5yb2xsQ2h4YzluQ0hlMVp0ZCt3RjAwUzNWV3J0UFM1ZEJET1RuOFhC?=
 =?utf-8?B?cE5EM0czdjI3aG1WM3RtczNFQWV1MDJrZ0V0TU4xa3NzRjR3SjExZUorUmNy?=
 =?utf-8?B?QTZhaVIzREd6U1Nzak1vQ2dYaFRPR05odUFxK3FteWtmUDI2M2E5MGhLclNu?=
 =?utf-8?B?Q1ZXVkxFc1dkcXFTWnpZdEFMa1ltT1BRNUh0TU84U2dJamtDdzNRYnBlem8x?=
 =?utf-8?B?SWE0Ny9CbXFGRGprQ29POUhXMXpVaGNYZ3BNSkV4bGFXbUY0TVZqOHo0U05Y?=
 =?utf-8?B?UXhxMnoyS1B1VW85MU03NVhFODVrS3kzN1duT1dtdEpMeWUzS0N3VzZVWEx6?=
 =?utf-8?B?YnE2ZzkrZlpLUENCMEJTZFQzYThZcUVTWGtKYkRUbWdpSzd4ZWs1N2tHMmpH?=
 =?utf-8?B?bnRBelJ2SEhvSnhxWmU2SjU4VVlBL1hnNmIzZHJCWXl3eTZpNVk0b0RGdGxy?=
 =?utf-8?B?bDZNSG1NRCtnZDExVkRCbDJPQ2RzZ1ZkdCtjOTJ2MXlmdEpPdk1pdWFqcC9q?=
 =?utf-8?B?THpxK3FhcXB2UmJ0amhnalZnSWp1cG5VN1BzWE8yRlVQbnZBUXFYTHNCV0xS?=
 =?utf-8?B?czB0QSswVnVsaUdTcjQvcWE2UndLRXg4NXZJQWNvUmRraXBTVnlIU2FhMDc2?=
 =?utf-8?B?bGJVYVNYUUZYUUFyTFRrRlFnNXN6Q0hONnZ1YjVleUR2QWVkNTVQTVlKOXFt?=
 =?utf-8?B?b2NYZVN2Y1BCRlNJdzdGd2NaZWVOZnhKNUpSc29NbDRpb0NYNlRUY21xS3Yz?=
 =?utf-8?B?ckw1eGNPWU40OXBBRUU3ZG9mTURmVFIySURKQ2txdXJYdnVMaTVzZjFQL21S?=
 =?utf-8?B?TWpRT1FLVWFFZDBKU015ay9kMG91ay9FTEhXUUtrU1Vpb3ZwV1YxK0k1Y2V2?=
 =?utf-8?B?dWRNOWVoUFJaM0xtVUkwcnhubGQyaFh1ZTB2cnJ3VXZvK244aGpyTnRiUFVU?=
 =?utf-8?B?YzR4OXZ6VmlqRkgzb2JhRnIweS9YRkxUMVJaZG9KVE16R0pobDBjSnIzN2Zs?=
 =?utf-8?B?OTZiQ0t0TGdKVmZnZ3dKRzd5d01HZmJnTUNXaldCdmljNlpyWUh0YjNWdTkv?=
 =?utf-8?B?bGtabWYxeVQ3Y0JaaDMwU0E0UUREUHI4SUdCZ2lVcUM2YXZOZk5iSUlVOGlK?=
 =?utf-8?B?bXk3UjNDalJjUStIcS8xUDFQb1JzMXZmTldBOTNPSEhNUGowZi9wNkRTRjdT?=
 =?utf-8?B?NjRMMGIxQUN6ZmMxbFVTbDRKS2NrR0hqbGpmQS81VkdicGtoVFZSZ2dTbG9F?=
 =?utf-8?B?YW5HYzlXZW93WVNnQk15dlBhaFZQZXFxbmtXZGs0dDhRSlVUZ0ZkeFdwTHlC?=
 =?utf-8?B?V3pkaHNielVVc1JWZ1BQTTcrTW9lYVd2MlAvMU9zdkx1M1lWS3paUkl1Y0dq?=
 =?utf-8?B?d0ppalpmam12azdSeGxvL0l6WmtXUmZzOFV0cUI5ZENaRDJVc1RwamFqSkF5?=
 =?utf-8?B?dU13bWZ0S3RrZWJGcGN6dGFXaVBwWlFFSHgxaEtrZllSVCs5YVdJZkZyYUQ2?=
 =?utf-8?Q?vd21avNOxak3eJ3QKkQcJk9fU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1379ef-1baf-4b9b-6be3-08dd9d2ea57e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:56:22.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVWbRsjQ//X6v/6xb2vFyjEomkvdmqfytl6mjPMJxJ0dU+Mkgu0z4Fec0uts8Mb1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8827

On 27 May 2025, at 6:11, Vlastimil Babka wrote:

> On 5/23/25 21:12, Zi Yan wrote:
>> During page isolation, the original migratetype is overwritten, since
>> MIGRATE_* are enums and stored in pageblock bitmaps. Change
>> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
>> PB_migrate_skip, so that migratetype is not lost during pageblock
>> isolation.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>
> <snip>
>
>>  #define MEMORY_OFFLINE	0x1
>> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-f=
lags.h
>> index 3acbb271a29a..f2f8540b95ca 100644
>> --- a/include/linux/pageblock-flags.h
>> +++ b/include/linux/pageblock-flags.h
>> @@ -20,7 +20,13 @@ enum pageblock_bits {
>>  	PB_migrate_end =3D PB_migrate + PB_migratetype_bits - 1,
>>  			/* 3 bits required for migrate types */
>>  	PB_migrate_skip,/* If set the block is skipped by compaction */
>> -
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	/*
>> +	 * Pageblock isolation is represented with a separate bit, so that
>> +	 * the migratetype of a block is not overwritten by isolation.
>> +	 */
>> +	PB_migrate_isolate, /* If set the block is isolated */
>> +#endif
>>  	/*
>>  	 * Assume the bits will always align on a word. If this assumption
>>  	 * changes then get/set pageblock needs updating.
>> @@ -32,6 +38,11 @@ enum pageblock_bits {
>>
>>  #define MIGRATETYPE_MASK ((1UL << (PB_migrate_end + 1)) - 1)
>>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +#define MIGRATETYPE_AND_ISO_MASK \
>> +	(((1UL << (PB_migrate_end + 1)) - 1) | BIT(PB_migrate_isolate))
>> +#endif
>
> I think if there was:
>
> #else
> #define MIGRATETYPE_AND_ISO_MASK MIGRATETYPE_MASK
> #endif
>
> you could avoid some #ifdef code later.

Sure. Will do.

>
>>  #if defined(CONFIG_HUGETLB_PAGE)
>>
>>  #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 0207164fcaf6..b2c623699461 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -360,8 +360,14 @@ get_pfnblock_bitmap_bitidx(const struct page *page,=
 unsigned long pfn,
>>  	unsigned long *bitmap;
>>  	unsigned long word_bitidx;
>>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	BUILD_BUG_ON(NR_PAGEBLOCK_BITS !=3D 8);
>> +	/* extra one for MIGRATE_ISOLATE */
>> +	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
>
> This implicitly assumes MIGRATE_ISOLATE is the last of migratetypes so we
> can actually need less PB_migratetype_bits if we stop encoding it within
> them anymore, but there's nothing enforcing that (not even as a comment)?=
=E2=80=99

You point is valid. How about adding __MIGRATE_TYPES right before
MIGRATE_ISOLATE in enum migratetype and using
BUILD_BUG_ON(__MIGRATE_TYPES > (1 << PB_migratetype_bits));
here outside of #ifdef.

The next step of cleanup, as discussed with David, is to remove
MIGRATE_ISOLATE, so that all MIGRATE_TYPES are stored in
PB_migratetype_bits. And {get,set}_pfnblock_migratetype()
gives

struct pageblock_info {
	enum migratetype migratetype;
	bool isolated;
};

>
>> +#else
>>  	BUILD_BUG_ON(NR_PAGEBLOCK_BITS !=3D 4);
>>  	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
>> +#endif
>>  	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
>>
>>  	bitmap =3D get_pageblock_bitmap(page, pfn);
>> @@ -435,7 +441,20 @@ bool get_pfnblock_bit(const struct page *page, unsi=
gned long pfn,
>>  __always_inline enum migratetype
>>  get_pfnblock_migratetype(const struct page *page, unsigned long pfn)
>>  {
>> -	return __get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
>> +	unsigned long mask =3D MIGRATETYPE_MASK;
>
> E.g. with my suggestion above you could use MIGRATETYPE_AND_ISO_MASK here=
.
>
>> +	unsigned long flags;
>> +
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	mask =3D MIGRATETYPE_AND_ISO_MASK;
>> +#endif
>
> And drop this.

Sure. Will do.

>
>> +	flags =3D __get_pfnblock_flags_mask(page, pfn, mask);
>> +
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (flags & BIT(PB_migrate_isolate))
>> +		return MIGRATE_ISOLATE;
>> +#endif
>> +	return flags & MIGRATETYPE_MASK;
>>  }
>>
>>  /**
>> @@ -513,12 +532,22 @@ void clear_pfnblock_bit(const struct page *page, u=
nsigned long pfn,
>>  __always_inline void set_pageblock_migratetype(struct page *page,
>>  					       enum migratetype migratetype)
>>  {
>> +	unsigned long mask =3D MIGRATETYPE_MASK;
>> +
>>  	if (unlikely(page_group_by_mobility_disabled &&
>>  		     migratetype < MIGRATE_PCPTYPES))
>>  		migratetype =3D MIGRATE_UNMOVABLE;
>>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (migratetype =3D=3D MIGRATE_ISOLATE) {
>> +		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
>> +		return;
>> +	}
>> +	/* change mask to clear PB_migrate_isolate if it is set */
>> +	mask =3D MIGRATETYPE_AND_ISO_MASK;
>> +#endif
>>  	__set_pfnblock_flags_mask(page, page_to_pfn(page),
>> -				  (unsigned long)migratetype, MIGRATETYPE_MASK);
>> +				  (unsigned long)migratetype, mask);
>
> This could just pass MIGRATETYPE_AND_ISO_MASK here.

Yep.

>
>>  }
>>
>>  #ifdef CONFIG_DEBUG_VM


Best Regards,
Yan, Zi

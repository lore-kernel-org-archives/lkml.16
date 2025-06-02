Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CE922259A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873940; cv=fail; b=JQQ9+ZG19+UqGYOxT94NPlukkrjF1XLe8brKWGOy/5c/xOUbmXQzEzIDmTp3jKhIKATEJUHjAZE+vuLKyQpBmpZb0t4HWUHhg4bhIpBvk5Fz5pMJQBDKkKXvW+bMwFkfP8t3xgio2fLPLUtVQvSxK0bBnUzHIJEpiNUtMbaGIMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873940; c=relaxed/simple;
	bh=5hTRL0YeIIgawZtl1LySNZv+AGAXP2XqOenlFwnWBlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mIFw78qp9Ap/NEsFzJ8/d1docb9cdzLnyvwcQLO9L/j86RJvtrd0ObxPCQkuMU9jlEzZBQZ4wh4YxrE+66i//a7HVhaVbM8s1ePB0dRAQVxD6SPYxzTPJu+jqD6nbKulxbdjf2YaeUyAVJsKKK7GwLnACDX6Bze3+m4zGRXtfEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=meoJwoqI; arc=fail smtp.client-ip=40.107.94.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="meoJwoqI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5+QNDjoyZybWds20L8Mt+NiJdBz6o+YDtx/6Adxxiy6wb/cMjAPKqVTVmRgBaU3+PW8fKeIL/iyMHkN3dLOz1Aggw8KJzxn4uwx51Lc4fi+SCSmi9YH3OEEogmx5Vr0EIGdzlABY0tFLiYKifnQqWSh1pTrYKRsZWbKWbhsYcik7hP/x7PeitIXzH7mJ7pd34OCeU/CZxION57bu4/psVlK/ryk0AeOySH+hlaYd01e85WbkpFlSwCNyuK1g8B/Fg7iLfWdAMJZTYnRn+8AOxEWj/YfeuwufIvw58cd6MQJCTo1qf17p2MSZle/wBTx+rOdJPI70Z2YNAV4suGsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzj4RQw+8o2/bAykxsCkTE0rT7zfunzGjvomckUXEFs=;
 b=yEETO6RZDB8hNndyW2b8OqIHY94eBmBZLbwxz4k99jFG2GpA0OdRV/anNk6xH/zGDSQIxtEIb05JpcFv7NEx6Y1JbNq/YZvLti3sGCxBr4hlOUEiobBcmGcJWpFGm2iOMNWiuDPT4YOcy+0veF7OqleSgsPeUChsvoCSKgTwHBVoVyDR4wuQpomUygQALPUb7JlTxs1A352ydTRaylFvEVWnKJC2fDk7YbBQAhpn906oRoyquVAMhKFd3f6ewqSutjaJadYrXnsaefi9ubbYdqNimZp2Bbg8uHSRaU8TyVhTCcUcU4OguLRlszqMM8TsjfqJ7FW5NZ+7FV/gtMHqoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzj4RQw+8o2/bAykxsCkTE0rT7zfunzGjvomckUXEFs=;
 b=meoJwoqICbEOTKwW5Kp9zfhd0mvVu/Kt2yVMjsMWJObYuyCWGExgX2aegQtz6s8VpYWxvCxC7xWahjg9BAhXFIJ1RQps2K5Elwbq7paXOvFflqSyTbuw9VziMkiaD80xVMu7e1uwjYDt5UZPUCiBoLUmcilRMzF/DE9DOWKV/2yzD7RIUbKAlvvY42r8B1wy/s2krb1R5yLolYP4lCu+mVNvg+gQBULvYiIdnIqhpPVElRjKzrboG3OcOnsGy69SgNNGSz8K0LXp9B+ZDS3JSPx9LeHpg+DgbRQUbZa9pEp4ux/WyfsqJtFx2XAeeKIIT/2ODXWssvgqWWKwThobEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.32; Mon, 2 Jun 2025 14:18:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 14:18:55 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Mon, 02 Jun 2025 10:18:51 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <30A5DAFA-9594-46F3-8054-ADBA83C551C5@nvidia.com>
In-Reply-To: <e53ce3cd-86f4-4bf8-87f3-08b16e002378@redhat.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-7-ziy@nvidia.com>
 <ac7351c1-cffe-4da6-9397-f9421e53f59f@redhat.com>
 <8C1EFB3C-0F1C-46DE-878A-3546A86A141F@nvidia.com>
 <50da1626-5894-42ef-b3fd-935a331f14c4@redhat.com>
 <BA6A258B-04D4-48F3-BB47-1F1DDAA0BDED@nvidia.com>
 <e53ce3cd-86f4-4bf8-87f3-08b16e002378@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAP220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc1564d-8db6-4edd-b810-08dda1e0682b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTd5Z2ZnV2tKcC9Ya1F2emJ4Q2pRS3RSMHpVa0E2Um5KdHVWT2NtMEtOZExo?=
 =?utf-8?B?WVdmbE03bmxtNjhIU2phSVBQR0V0YjdIMTRjbEJsQUQ4enB5N2lTVDdWQUU3?=
 =?utf-8?B?eFRraGlEaVdjenZLYXovS0NPRzZXUDMza3psV0NmaXFDZGM1T3R5NEZSajhT?=
 =?utf-8?B?TG1RYlN5citnMHB0bEVCK0locjR5aE5TVksxMSswRHJXZU8zSlFQZ2pSb0lk?=
 =?utf-8?B?S0tZWElFcEVaVGowWnA0VCtWblFkNDVwUXR4RXNici9nUm93bnNaSG1MdHJm?=
 =?utf-8?B?OXp4VnV3ZHh1TjZCVmtFd2YySnFqb3ZjT0hxcFJjeEdVU1Z0K2VqUElBMWZ6?=
 =?utf-8?B?SGRCb04xNGNvdnRGakZWRlhOck9seVR0SGdpd3ZXRDI4VVYvTC9zS0RSeE5h?=
 =?utf-8?B?RVZUYmRMdkh2bGZZcWpBN3oxVkFJL0JkZEQ3akQxY09mc2RpTnkyWWVLSkhQ?=
 =?utf-8?B?alE4OVA3WlN2OUtuTkRiTHJGRnJNeUtQT0NFckREa1JUUXNuRW9rUVFJMzJ2?=
 =?utf-8?B?cGNGeFpVR2F1YnczcjVrOVp6UWdhVnJjQnE4cjgyTVNHV2Nxb1FvNFVwTWdW?=
 =?utf-8?B?cGx3amo4TXc3Rm5iS3p2eHZTRk42SnVBMW1yZndzTkFIUGp3RXF1Zk54MnhZ?=
 =?utf-8?B?alMwazhKT0ZXNUE2TEZpK090akVaamVXWTdhMnNwMUFrVXlzQWI2Vkc3eGFv?=
 =?utf-8?B?TXpNb0RqaFoza0FHZnRwdEVJWVpXLzdrVUdPYzJ2NkMvSkVUYW1DYUNNLzZs?=
 =?utf-8?B?cno3ZDNUTGpneHZzMnoxa2IxUkVBMHQ1TlVJbEhMODFJbTgwcUtnZWNCTldT?=
 =?utf-8?B?N0l1N2o2aGdqOHVPY2JXMmk3Tm4yMjUxZmhBYlRaT0Vtc1RtT0txRXd0Z1hp?=
 =?utf-8?B?ZUI5V3dlbi94cGM0cXUrZkx4d1l1bzZVYTY3WDFBZDZrZDlHUnZUTnJTYm1s?=
 =?utf-8?B?UTVWckNrTXM3eW9sS0p2M3VGSC9wU0Y1d1VVbkg5LzRiT01QNjNxeS9LQmxk?=
 =?utf-8?B?SlU2dVlkV3BwNmdBUHl3RmVMM2FTMGw3bmJVZUxVTElBUlJnOWFlOUl4aVpl?=
 =?utf-8?B?NC9ud1RlREQyUHE1bDNSbHJ2Y0RBWEFkelRlWDE1enEvN0ZDZkc1ZkRMRFhK?=
 =?utf-8?B?Um00Y1d4aklmdkI4Q1hlZmpRRUFwUHFZclkxWHlSTXAxODE3RjNPbXlKMDI0?=
 =?utf-8?B?aGxVLzR0VDZLWXBCWVhKT2pySmZjTHVHaVlCYkpHWmRZNzlEektrZnJDb21D?=
 =?utf-8?B?OVh5QW9TRWhZTFlFMStKRXJObERPWVlObVRqL3o0QndscFFDQUxUQ2VWZXg4?=
 =?utf-8?B?bEowWmZlcWxJczBFYzA4blYrTWZJelloQmdDYS9wMEdpZWcxNGovekI2bXhV?=
 =?utf-8?B?ZS81WXcvQ09NVXBmNHpDLzhhNUNabGxqdG42Tm5FRWR6RWlaaFp2eDRWK1ZW?=
 =?utf-8?B?cnprbU9YSEN0N0VoUkkrNWFVYkJZeXJqNllrSkE3dHdGaVkxNEhOQWdPc1Yy?=
 =?utf-8?B?QmlBMWFaNU4vNmcwUHkzcDRlY3dsbERGSkJFbDRsZUg5VkRXRG9sNDBkbGIx?=
 =?utf-8?B?WFJOR29nU1lYb3pLRjFUdHFybnlnb0RtOVdwd3RHK1hBRjJpRjFkVm5zZDJL?=
 =?utf-8?B?ZnpIT3hqdTJUeURYd3Rsd2dpaWN2VVBucWdYTWtrSDlPc0IyVGMyVGpId1RT?=
 =?utf-8?B?b1BST3RUY0tJVGlVMUxoMUdJVVJOaTdxdFZzQU9wMExpZENsZ3RQbzNUVHp5?=
 =?utf-8?B?UHhmRHMwTU5WZkxFM1p0YzVqS2JKU0E3R2hmRUhRR2hvZVZqNlJDQzBSWm01?=
 =?utf-8?B?L1oxWDR0U3FLM0JuellubkVOcms1NFRGZThRNWNLUXpsZ2xkNzM4eS9Cck5V?=
 =?utf-8?B?b3ozNW1TWDg0U0VUaEh6QTVPc25nT3NZMWcrSCtQQkxmTDdZSG5tL0RiWGh3?=
 =?utf-8?Q?OV9M5O7P5rM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UCswem1KcnNYeEtTUGl5NGJZR2ZhUWU3VFR3dVJxdDJZejlnMk1ISld4b1A1?=
 =?utf-8?B?MG9Lc0g4bElMUng4ak8wcmk2TmRGZnZUdU5ScnlRS091M01tY0lpa2JvNllD?=
 =?utf-8?B?eUFhYnZzVEpqd3JmUXBjdis2Y2FPZEN6Vkg5UnZ2QjF4UEVFbVMyK1Y0RThq?=
 =?utf-8?B?QUp4aHZOWEpkREQ3QldnN2hNdk5RSjBnRnFzN2VwdkxCcUJuenZtR01SNHVH?=
 =?utf-8?B?MmJpSExMZE1hYXNtanhZckpwemNQc2l0RFBoWkZxcmcrU05lTzYyeVJPdDVx?=
 =?utf-8?B?ajVTb1dNdGdaVFBETUpVaW9tTGkweThkaHRWZEF1aExaMHZORFlnNFBNdkg4?=
 =?utf-8?B?OWFKQXBKUnBhY1RWamowakpPWHhhSzlKT1YwUlBPS1ZvTFREbFZqZXpsejFi?=
 =?utf-8?B?KzVISGxWQkFqNmUzOFN2MVJpN3lRY3pSQjhYYzNzYjM4UWd0d3c5cTd1VHpX?=
 =?utf-8?B?R0lzZ3ltSDd4bDhqcytvRGJKK3lsbDhzZWhUZVJYN0RuV2plZktjNXF4Zk5r?=
 =?utf-8?B?MkZMMXFVLys4RzQvQWpJSnlPTzZVTzROZlREeUF5dC9OZHlJWTdwLzRmeER2?=
 =?utf-8?B?QXpsRXBQUENhQm1ibWNtaXFObmFQVWJuU2J6ZSswL0FjSFVxSUpvdXF5a3dR?=
 =?utf-8?B?czNZek1LMG9WRjBVRzZEaHNuL05wUVowNlVBSS82UXBwSGo4SEh5elEwRzZi?=
 =?utf-8?B?M1VNaUJIVGg2cStobkR3Z05wdnZVWFR4NTkrOE0ycEw2a2hRR3ArYjVwdGsy?=
 =?utf-8?B?VDNPNVVwbE0zekRkOHBwUnA5L3Y1THZaMDVvR0F0WlowR2FESnArLy93cGVM?=
 =?utf-8?B?U2lPS2NYQVVLV1BPbGIzbUVmd0FpU2dtb3pRS3VLR2xXSVFweDRUYndjWjlC?=
 =?utf-8?B?eTRPYTVPWVg1NTJXeERaZDlDbm5jbHFYaG94RFhOdTlsczE0a0IxaldkM2R2?=
 =?utf-8?B?MzlScXZBUis2ZVl4SHpEcWFHV3JUU3JXRXFQZUIySDh2aVdydll1UGxJTVNJ?=
 =?utf-8?B?bXYxM0lDTWxGL2tUZVFIdlRaT0Vxd1NxdzgrYzlOemUyTy9mZm00ZTZzcEtB?=
 =?utf-8?B?ejFoeUhwWVJSU0NvTkdJQ1B0cXg0eGtZTG95K1h0M2Y5VE10WGZ6MWJHMUdr?=
 =?utf-8?B?NXlyV3JqTG9zdmNlUWxrVjh1S3JubmFzbjZjNFBBOWc1UEhETFQwVnM5RjVt?=
 =?utf-8?B?VytFMGlOenQrMFEzNTBraWt6ZGR2MllGc0dwdm1QcjBjRWdCSUQ3Rk9nMlZm?=
 =?utf-8?B?MkdLL3JVaTRLb0FZbEtOeUVvZWk5eVdEaGZrSjJKTmhabEdxaTVUOTFsZkND?=
 =?utf-8?B?QnlaOW83aXFkVHJmS1BGaXVpRVZrdmZ5d3JFWTlndlFVYzUzZ3ZLV0FBL3BQ?=
 =?utf-8?B?dGZsZTlKNzVSM3ZZcGQvWnRVT1lhd0xzbERtNDNDNjN3U0FiVkE0SklSWjVy?=
 =?utf-8?B?VWJwVnc3amNzTGwzZ0k3eFhqelVkN1ducW1lb3p6Um1lMzZGZlF2T1JrR2d5?=
 =?utf-8?B?MGV6MTVmVlYxb2NuSjlCS3cwZ1dpbENoOXpGbWRVNElHV2Q5cDBPSDZ1TTY2?=
 =?utf-8?B?eFFHM09BM2hGMDZUclhReUgwT0ROUmo2VFhqUnhGc0FDKzAwT3R2bGVUVjZT?=
 =?utf-8?B?ZXdlME9WZksxbE5TK2MwcjUyOTFnS1VZeENSaFpEUjhza2xwSUJteXNBV0JT?=
 =?utf-8?B?K1d3U2JwMUNqT2ZRbUxLMWFheGhqNTUxNWpEMVVVZE9JVjUvYS9VRUE0eXFY?=
 =?utf-8?B?MkROV2NKWm4yWFVIRE82U3hGWXRuSFBxeXl0czVYSzlVR2d6QTJZTmdmd1I5?=
 =?utf-8?B?WC94YzhzU2FudXBZbHNJYnpaYzFELzJjOFBtZVl6c0NPOGw1dHd6SEtoZk5N?=
 =?utf-8?B?QjRPZFhQY3dGM2puVmNJK2oyUHVVQnFhYjZxcmhGcEdWWm1sOEdvNTZ0M29N?=
 =?utf-8?B?UFdwQkdOUUdjY3YxZWxCQlNZUFZrVE9SYTBob01IUnhBYUN5eE5FbUhuc29L?=
 =?utf-8?B?TDJuOUV4TGVVK3ludHpuVTg1YlFBV0VDVFNOcmFhaHVjdS9xRkRQc0UyUXhB?=
 =?utf-8?B?Tzh1UEdyM0F1U3V3ejl2R1JvYi9leHM2bUJ1N3VwUGRVdzdERTB6SkgyM1RR?=
 =?utf-8?Q?KmGeQn0AaG8vkzB1s9+P/xNS+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc1564d-8db6-4edd-b810-08dda1e0682b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:18:55.0655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppWIheoRLmi7iCtRd3cyOtkxmdOaXGSOwl9CeReiE8/L6XCglM6od5DnqCTOeC5T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081

On 30 May 2025, at 16:55, David Hildenbrand wrote:

> On 30.05.25 22:46, Zi Yan wrote:
>> On 30 May 2025, at 16:08, David Hildenbrand wrote:
>>
>>> On 30.05.25 21:58, Zi Yan wrote:
>>>> On 30 May 2025, at 15:56, David Hildenbrand wrote:
>>>>
>>>>> On 30.05.25 18:22, Zi Yan wrote:
>>>>>> migratetype is no longer overwritten during pageblock isolation,
>>>>>> start_isolate_page_range(), has_unmovable_pages(), and
>>>>>> set_migratetype_isolate() no longer need which migratetype to restor=
e
>>>>>> during isolation failure.
>>>>>>
>>>>>> For has_unmoable_pages(), it needs to know if the isolation is for C=
MA
>>>>>> allocation, so adding CMA_ALLOCATION to provide the information. At =
the
>>>>>> same time change isolation flags to enum pb_isolate_mode
>>>>>> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
>>>>>> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
>>>>>> MEMORY_OFFLINE instead, since only PB_ISOLATE_MODE_MEM_OFFLINE repor=
ts
>>>>>> isolation failures.
>>>>>>
>>>>>> alloc_contig_range() no longer needs migratetype. Replace it with
>>>>>> enum acr_flags_t to tell if an allocation is for CMA. So does
>>>>>> __alloc_contig_migrate_range().
>>>>>>
>>>>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>>>>> ---
>>>>>>     drivers/virtio/virtio_mem.c    |  2 +-
>>>>>>     include/linux/gfp.h            |  9 ++++-
>>>>>>     include/linux/page-isolation.h | 20 ++++++++--
>>>>>>     include/trace/events/kmem.h    | 14 ++++---
>>>>>>     mm/cma.c                       |  2 +-
>>>>>>     mm/memory_hotplug.c            |  6 +--
>>>>>>     mm/page_alloc.c                | 27 ++++++-------
>>>>>>     mm/page_isolation.c            | 70 +++++++++++++++-------------=
------
>>>>>>     8 files changed, 82 insertions(+), 68 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem=
.c
>>>>>> index 56d0dbe62163..6bce70b139b2 100644
>>>>>> --- a/drivers/virtio/virtio_mem.c
>>>>>> +++ b/drivers/virtio/virtio_mem.c
>>>>>> @@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virt=
io_mem *vm, unsigned long pfn,
>>>>>>     		if (atomic_read(&vm->config_changed))
>>>>>>     			return -EAGAIN;
>>>>>>    -		rc =3D alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE=
,
>>>>>> +		rc =3D alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
>>>>>>     					GFP_KERNEL);
>>>>>>     		if (rc =3D=3D -ENOMEM)
>>>>>>     			/* whoops, out of memory */
>>>>>> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
>>>>>> index be160e8d8bcb..51990d571e3e 100644
>>>>>> --- a/include/linux/gfp.h
>>>>>> +++ b/include/linux/gfp.h
>>>>>> @@ -423,9 +423,16 @@ static inline bool gfp_compaction_allowed(gfp_t=
 gfp_mask)
>>>>>>     extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>>>>>>      #ifdef CONFIG_CONTIG_ALLOC
>>>>>> +
>>>>>> +enum acr_flags_t {
>>>>>> +	ACR_CMA,	// CMA allocation
>>>>>> +	ACR_OTHER,	// other allocation
>>>>>> +};
>>>>>
>>>>> Hm, enum !=3D flags.
>>>>>
>>>>> If you want to use flags, then just have ACR_CMA. ACR_OTHER is implie=
d if not set.
>>>>>
>>>>> And ACR_CMA would then have to be "1" etc.
>>>>
>>>> I have a fixup to change acr_flags_t to acr_mode.
>>>>
>>>>>
>>>>>> +
>>>>>>     /* The below functions must be run on a range from a single zone=
. */
>>>>>>     extern int alloc_contig_range_noprof(unsigned long start, unsign=
ed long end,
>>>>>> -			      unsigned migratetype, gfp_t gfp_mask);
>>>>>> +				     enum acr_flags_t alloc_flags,
>>>>>> +				     gfp_t gfp_mask);
>>>>>>     #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range=
_noprof(__VA_ARGS__))
>>>>>>      extern struct page *alloc_contig_pages_noprof(unsigned long nr_=
pages, gfp_t gfp_mask,
>>>>>> diff --git a/include/linux/page-isolation.h b/include/linux/page-iso=
lation.h
>>>>>> index 7a681a49e73c..3e2f960e166c 100644
>>>>>> --- a/include/linux/page-isolation.h
>>>>>> +++ b/include/linux/page-isolation.h
>>>>>> @@ -38,8 +38,20 @@ static inline void set_pageblock_isolate(struct p=
age *page)
>>>>>>     }
>>>>>>     #endif
>>>>>>    -#define MEMORY_OFFLINE	0x1
>>>>>> -#define REPORT_FAILURE	0x2
>>>>>> +/*
>>>>>> + * Pageblock isolation modes:
>>>>>> + * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) mem=
ory
>>>>>> + *				 e.g., skip over PageHWPoison() pages and
>>>>>> + *				 PageOffline() pages. Unmovable pages will be
>>>>>> + *				 reported in this mode.
>>>>>> + * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
>>>>>> + * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
>>>>>> + */
>>>>>> +enum pb_isolate_mode {
>>>>>> +	PB_ISOLATE_MODE_MEM_OFFLINE,
>>>>>> +	PB_ISOLATE_MODE_CMA_ALLOC,
>>>>>> +	PB_ISOLATE_MODE_OTHER,
>>>>>> +};
>>>>>
>>>>> It's late on friady, but it looks like we are duplicating things here=
.
>>>>>
>>>>> Let me think about that once my brain is recharged :)
>>>>
>>>> Sure. Take your time.
>>>
>>> Could we abstract both settings and use a single one? Then, we could si=
mply reject if MEM_OFFLINE is passed into alloc_contig_range().
>>>
>>> alloc_contig_pages and page isolation, hmmmm, MEM_OFFLINE is kind-of an=
 allocation. CMA is an allocation.
>>>
>>> Just an idea, not sure ...
>>
>> I think so.
>>
>> This is the fixup of removing acr_flags_t. It is on top of the original
>> patch. Take your time. I guess I will send V7 with all fixups next week.
>
> Only wondering if we should rename "pb_isolate_mode" to something more ab=
stract, that covers both use cases clearer.
>
> Hmmm.

It is specifying the purpose of either alloc_contig_range() or
test_pages_isolated(), but these two use cases do not have high level
connection AFAICT, except that pageblock isolation is involved
in the implementation. Let=E2=80=99s postpone the naming to the future.
As we discussed, we have two TODOs: 1) remove MIGRATE_ISOLATE,
and 2) simplify alloc_contig_range() to isolate the whole range in
one shot, then do migration. Probably we can think about naming at
that time. :)

>
>>
>> The one strange part is that in virtio_mem_fake_offline,
>> PB_ISOLATE_MODE_OTHER is used instead of PB_ISOLATE_MODE_MEM_OFFLINE.
>> I guess you do not want to report failures there.
>
> That's the right thing to do. It's not ordinary memory offlining code.

Got it.


Best Regards,
Yan, Zi

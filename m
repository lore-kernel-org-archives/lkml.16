Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400713D52F;
	Fri,  6 Jun 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749223121; cv=fail; b=DqNs5jbczMBVjb+QujBs95pqx8PVo29R1L7u9YbrjjdiBRhZOr1HqfekZ2IHpoXcO2uxeL6miZTv4/XcMYOEBaXajYjDet75vZsDA9klLVOv2HW3q/Kp73sjF0q5LOs0DcMdiMQXb/GF4mEs/V7PAfZp+SoBH4Zz+UbMFLQOe3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749223121; c=relaxed/simple;
	bh=NffLlTwbMLTvPVSFKp3ezzNhlo9WuiwKEbpWfe5LuNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CPnIZQkWzF3AoWZibfOzzFoM1JGZec24Ohp2PPwCiNXXx86Hto7NOy7VBUF8gwpw8YF7fT9Rb8xVEXhR4bLbLWZaqMNqKaGkoztKVKRhfh09Eb+qbwnWwUGtN2hPKSQcnih3Cu2O8WHqkdCehsCAIdIXjU0kXQ2cCLJ1XZXi+ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZNTsRwcU; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZNTsRwcU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS4sA1cf+DUWe0KRSrQ/yetyZBTF3IQyTE49udZsYTJeDEia1q4spid/tW4pJQ6FcAudv0IRQ7cTyXlOpKLCsXXtiji+EqRNhJFd3S2tmp6fZ+rqWZSVcQm/FBuQR2q7W00+q4yeAKB1qdf1cdrd/kZgNJZEky+SAkHIzS8l6a7HXG3XuWJX9oPasJSWTHC2xtEk5P7Xd7ZhFL1xxkKZ8YAAv6Q2hy1kD9sFOaH3aowRqjRpUdfEtI1ifCpYmZ60shAjy9/R8juRhhz2DDpEu9TaoGTa/rxl73O8D5Fansu5+dm5gSWou0erwN9MG3a78Q8atgu3v48+b4rSW8Vfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iCR1ZJBL2B6Nxjw8NhPV4Cj+/3kBptyS5yBLqqS4Zo=;
 b=Fw8QBK0lqtAw+AuqH0N9HbaNmTgEcT3dnJAbEdtTEvjn6tDTJ31r88XLHIsQTmSp6vjsPVRjqwgmN+9sAGyWTHJQXFjD+Et/Nbryd8lbV8A67GK7TZf4rJfd8DD4ENdeRUBYOn/3ad86rBqjuQ9gcSWrmCTGHiyrHW24q/eKXVBUWvB33fcieGWUUCqztsLzjP33IlsTUlOq0MUWxGrAC/fPHzQuBJ/uEMrlO6u4ZSQzIa66Cics0XpCOLoLhX6+ZWEBxzumj10x7AhGg3v4U3atRzC/PDee3rWV7Jczn/jnLJmauW+we3pdTZnKNn7qKqKqmwWOa1/0kM7Ccmovjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iCR1ZJBL2B6Nxjw8NhPV4Cj+/3kBptyS5yBLqqS4Zo=;
 b=ZNTsRwcUCNKZdvFn6x2PSilNlCQr/0eIME1PyyT7kJnich4pHnttfAxII1my+gWw0yQ/DORKaE49U3oEbGoXjuKNcqR5U/+DZqXK1CAxwAwTKWC5o12H0qK/9kbFCeRq0Q6El8u43b/umtdtdKTRtNIfDLbLQ15OcKY4FJg50qfezUKEuIiVK3GVc/i1eBzWWWpupJwRefRK7IsnzljvFPLBlEDbTupsCWFLw0P6tuSLsVXdCslRjPt2epr2CHGeehDnJME68E4PQCkjUwXTg+nlWRPFEhisPlVpswbSEZ2SnwvYlINz9Ae1UDKzqZYKQ5Lle57peeeJ+Gvw5Ir9xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB7827.namprd12.prod.outlook.com (2603:10b6:8:146::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Fri, 6 Jun 2025 15:18:33 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 15:18:33 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com,
 Juan Yescas <jyescas@google.com>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Fri, 06 Jun 2025 11:18:31 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
In-Reply-To: <20250606143700.3256414-1-usamaarif642@gmail.com>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL6PEPF00016415.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:d) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 585971b3-7e29-4b4b-6001-08dda50d66d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVhvZ29lUDQ0R2ZGazh0eUwvVW9HTU5leUlFNDhndkFGZ2QrQmgrWmREQVZR?=
 =?utf-8?B?UHZsUU1EMitRS1l5ZG1KY2ErN2p2VnlhV1prdzEwcnhEZFpMTmF5ZW1abzFT?=
 =?utf-8?B?aWNiWWtaVndkZEdUd0tFSXNqVUhVbXlTWGxOTzlQaEFGYjR2NmFnTlRueXlH?=
 =?utf-8?B?NzIwaFYxRHdEaDlHc0pPMlFYeXRZYnJadC9VanRUTk1VejcyRkhvK3d6c1F1?=
 =?utf-8?B?Q1Z6QTgySWRFRlgwak1oM1NhaGpncS9FdlNwVXVYby9WTTFzSlV6V1dSeFVq?=
 =?utf-8?B?TmFuZDFKLzlRcU9FL0QzZkMxVmVoczA2SnVkdFhLa0JXYkdUcnQzZzdRTW5U?=
 =?utf-8?B?cFBvc0pVWmQrZ1RkOXMvOUV5MGp4ZE10cmdsUDhWOEpneFVxdUprMGdSWE5p?=
 =?utf-8?B?YlNpOTZQblNKbHNmUGhhZDV2YS9pTmNSMFVLTWpETW1OVTBJMC9nSnhwTkRs?=
 =?utf-8?B?S00yRENKeVFlNGtKc09rU21vQ0NrRGd3Sjc2VGdxY2dIRjZOWklUSjJFNTBq?=
 =?utf-8?B?RTJqaFNPdnNPNnkyN3hITWlURkhhcTl1QVBsRDBVMXA1aDIvM1pRenhUMHpp?=
 =?utf-8?B?czFtMGtFdWhlbE51WGlnbHhrWTM0TnhhbFMyVU44VndIaklRU3cvMUI2RDlR?=
 =?utf-8?B?SE9ac3daMnNuM0o0SjA4ZEU3V1dWZEE5QXRTeUxvaWNrMU4zZTR1UnRNNHlH?=
 =?utf-8?B?Qkx3NmdVaUo5aWpxMG5VWVI1U0ZobWZvbjUxc2pCUU5mSEtROFZiQ1VQQ3dn?=
 =?utf-8?B?UkNmT3FqeUNzSENCYW1ZaGlkOEgyUjd6RFh0TkV5RXFsWmxYeE5YR3NESUZD?=
 =?utf-8?B?bExRWDRPS1ZjeE9JL1YvaWQwV0g5R0JpRXZ4UXd4SDZiSFkxbExtWW1mKzFO?=
 =?utf-8?B?ZnAyeEEzbUlLeW4rN1NYa2tQbjk0eU9OZTB6Siszb1RYbzQrVnpLazVsSU9u?=
 =?utf-8?B?N2ZIeDJyWnlObmNmalBPYkxtUzNXNHRENDdvTVRFZlh3ZkNWQ1Zab2Jlckg3?=
 =?utf-8?B?WS9jclN4bnZYMjlaY3RSRFd6WGE0eHFuUDNqeUpKaEthWCtlWEZILzE1ZHNn?=
 =?utf-8?B?WkFkeSt6eUs5ZTRmUmJ5cnV0d09CUE1CK29lSFU4M2lqT3JjU3FPYXJhK0ky?=
 =?utf-8?B?UmlJbkhvMTFvSW5BR2NlU3BrMDVCTE1sQzBGa2dVQzUvY2svSVpRRlFZK1Vw?=
 =?utf-8?B?M0dJQzRFS241MGs5aW9rZ1YvVS9zV0NsR0xScUZHRjNIZENTS1E5Mks5TTFD?=
 =?utf-8?B?c1h6NzRSTHhlZDZvZTBrVDVrcHJpV0lmSEw5am5tUkNLUXJYbVJrMk9DcE1H?=
 =?utf-8?B?TzNwU1drZ2Z5UEdKNXFRSXkvdXlsUTIrVnE1a3RIR1h1bklWVDZ2WG5TSjFR?=
 =?utf-8?B?YzNKQWlnS1BFQS9hY3ZUQzhvNFA5ZlBMWWpBR0NzNU0xM3NCWjZlRTdWMldU?=
 =?utf-8?B?b1FZQ3hJTGpzT0hqcCs3YktuK1ZuOXJEcjl1SmZFb3l4T29mWC9aa3puQlp4?=
 =?utf-8?B?b0hKL215VkovN0x0bFVBc3MrYnBRNm11eFh2VVI5SmpDd1p0bFYwSVM5cHNw?=
 =?utf-8?B?NFBRS24xOEd3MVJFL3MvZG5JWDBDMFBnODh0bG84YWdvQndnUysrcUo0L2NK?=
 =?utf-8?B?QUtNbWQrYkYzT2U2cWR5bHFEUko3RjZ6RWVkTHpUKzdHL3ZiVmtjdzZZdEJT?=
 =?utf-8?B?ZkNSckFhQTZYNkppSVhwNEdzTEVjNVBKU1dSSjVmSVFqTkpHRU4xazlIand6?=
 =?utf-8?B?eE4rQ3BOZzdoczFaM241SHhleFBMaW8vUGZhVnFCWm1xdFJ5OWZzTzVFbzBX?=
 =?utf-8?B?Mzh2c1plTnc4VWwzMGRGK3FobDRjRGpaYTJXTUFPZmJOZDBJTkdmU3ZaMnZi?=
 =?utf-8?B?L1NkLzFWTU1iNWdFK1VLWEYvc28zQ0Y0LzZ3VnBPaVFkaGxMYkE3cEJxZFNo?=
 =?utf-8?Q?TVDjYJIvnNw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEZBMVRKczNza0dUZXEyd1hKVjlBZk53UE10SnZRTW10QUtVQlgwL25SMS84?=
 =?utf-8?B?MEZtZ3NHUUVTbDQxOURPVkVaOGx0djhoR2hEeUtiV015VHVrandXRFk2QXNC?=
 =?utf-8?B?ZEhPTTgyL0RRWldHRzBMcUhLRFZzeWE5NDFsQ1dRdWd0M0tsTEROOG5PUk41?=
 =?utf-8?B?Uy9DNE1HdkhqUWhLSDM2Mko4WTRxYXdKajNyVWx2OXJkODk3RGJpMU96RUZI?=
 =?utf-8?B?MGFERmVTTXFVRDFkMG95L0hkeHFJSGxDZlNqdzVEeVRYTU14KzhFWjRXRkoy?=
 =?utf-8?B?K0w3UWRlNlBKbGVtYk43S2NFeVNOdDgwQnhXeEc4WlRLanBYYnRSc0s5WnRJ?=
 =?utf-8?B?Y1c1QU82NEx6dHNQNlFZZzBCUEwwb29CSnRVYzF4T0VQU2JobFBLNVlZb1ZN?=
 =?utf-8?B?MWJ2RjhTYzN4SFRXUVdwUC9ReGtRa0Q4dW9sZGhVZXI2S2s0SiswWCt3NUIx?=
 =?utf-8?B?Qm1rVTRoUVNmam5ZSjI3eFNrL1dUaE1iam1TUUNacGVvZjVVbERCWnZFaGlO?=
 =?utf-8?B?S1AyUXJ2S1l2VmNaMi9Idlg2cnhlMjZmbmhmRnAwYlNrb1lZUS9IN1dHSGx0?=
 =?utf-8?B?NnNlcVh5UE9PbXlwVUZyZm5lME1tWWdudHR3NmRydG44bjZnNlQzTTJpbzFH?=
 =?utf-8?B?REgyUEpRM1loWVp4YUdsYkIzeTNSZG9vWHZnNkNUSWQ4V29PNkdRTDhGVGNq?=
 =?utf-8?B?MkNjN0xKbUxtMC93b25HUjdoTTFGRVR2ZEJBQjNtMDVCZ1U5dXB4Y2FQL3pp?=
 =?utf-8?B?dzR4aVJsVjBhS3FKVnhpdnF6WVV0bkhqTjdPL2U2KzRrSFhWZ0Y1ZmtudS9z?=
 =?utf-8?B?K3dod3VtSEVDS3JRMVFTZlpDS0xEbGZ4YVNxajIyRGN1SmVpUzQveUQ1QVVT?=
 =?utf-8?B?Nnk3UmxrY05NcVBoakUwKzVnbXN0ZU9kbEwxUzJrYlErdkh6ZHplR2lMMkRO?=
 =?utf-8?B?RXNXVzFvdUFyR3AxUkdrd0dMN1dxTEk2VEEySFYvMlZPOTVybit4Nkh2eDE2?=
 =?utf-8?B?Y2xEaW5uL05LTmlkOWZOdmR1T3ZDSlNuQXdGWUJoc21KT1l3REZseE1uWHZM?=
 =?utf-8?B?T3l5NDNIeUxZTlFwSFowdnVxUkZndmNWRHNtYTFpQ1dncFVVbnBlV2J2TXdv?=
 =?utf-8?B?bjQ1Q3ZMZmtpVWE0Y3UxTEhCc256YU8zTlo5U2Y1YmhjUkxMMFd2aGhHM1Ew?=
 =?utf-8?B?VnNteENYZTlpdkt0VlhxVHc4MUg4V2pVeFNWbEVSWEtRMXRBajFzVEV2aGhw?=
 =?utf-8?B?Q2NvcU83ZnJlMllyalNxQ1ZrekxVT1FDU2ZKdmZpZVFTVUdDa21ESGZQV0hB?=
 =?utf-8?B?V2JTWTNENEJVTUZ4ZTNyVXFYWXpUOFpkQWsrakdHNXVBWWphcE1XeS9OM04r?=
 =?utf-8?B?N1BwRTFvcUJFUjNGRENwWW5PVTVZcTk1OHNUL28zRlY4bDBJdHpDelRWcC8r?=
 =?utf-8?B?blo3ck04L2NKck1rcVljemVLM0l4SEw0NkgwV2FkV2ZQb1pRZkdiaFNJbHBY?=
 =?utf-8?B?U0tyOVJKY1J0YzE5aEc1OE5oczB4NlEyQzB1WmkxV0dQZ1MrdDM2cnErNWdJ?=
 =?utf-8?B?MnpqSnNrWU10bUZHUitzL2x3azZqdjBGU0RrOGlOclNXWlZkclhJTWV6aUxG?=
 =?utf-8?B?M2RRWEtPRFkrU0FPZ0hNMG44YzhiTXhjcGQzQmNwWWZwa3Jsc0lxQlJTQnNR?=
 =?utf-8?B?V3hLM29zTU5WRUdTOGk4M09wQ2xhUjhqQzlMc0tZRFllTmNXakdWZmljdy9P?=
 =?utf-8?B?SXkxL3hEVENQdnJXWTdYcVh1UXhBSEM5dFc4aGZPdW9BQTdzdFErejdiNU15?=
 =?utf-8?B?UUlPYjBBSFFDZjgyM3JBQUpLVnRIb1Q2ZXBPTlYwNHBsU05MWEJpbDdlQ2Zl?=
 =?utf-8?B?TUdETmpDZGhhQVRqdU9idGNHYURYaTViMUZTdzlLemNReU9Id0lBTEVYaXBX?=
 =?utf-8?B?dXAzbUxPSlQ1ZUIxN1NUV3hjcGFWU2t4SzBmc1h5QzVUZEV0RFl5aVdscmtz?=
 =?utf-8?B?SWwzMTVuTU9rNmNUZ3JoQUxnM0FBQ081cTg1ZmY2MUNKb3FmZ28vdGN3eXRS?=
 =?utf-8?B?d3R3L3dqVFY1OXAvbGtJZE1uRkxFSWY3QUpxWFg2VkpvV0lISEhTYUMrdVVM?=
 =?utf-8?Q?bQZ1cLqz9r2+DQ7403vL4e/1T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 585971b3-7e29-4b4b-6001-08dda50d66d6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 15:18:33.6380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCHzWIpaDIbUaCIEcD1v8a2tSkivzBzlQxUk+gGyEptDgfHErwd6fZRDteo4k3ui
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7827

On 6 Jun 2025, at 10:37, Usama Arif wrote:

> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
> watermarks are evaluated to extremely high values, for e.g. a server with
> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
> of the sizes set to never, the min, low and high watermarks evaluate to
> 11.2G, 14G and 16.8G respectively.
> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepa=
ge
> size set to madvise, the min, low and high watermarks evaluate to 86M, 56=
6M
> and 1G respectively.
> This is because set_recommended_min_free_kbytes is designed for PMD
> hugepages (pageblock_order =3D min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
> Such high watermark values can cause performance and latency issues in
> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhou=
gh
> most of them would never actually use a 512M PMD THP.
>
> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest larg=
e
> folio order enabled in set_recommended_min_free_kbytes.
> With this patch, when only 2M THP hugepage size is set to madvise for the
> same machine with 64K page size, with the rest of the sizes set to never,
> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
> respectively. When 512M THP hugepage size is set to madvise for the same
> machine with 64K page size, the min, low and high watermarks evaluate to
> 11.2G, 14G and 16.8G respectively, the same as without this patch.

Getting pageblock_order involved here might be confusing. I think you just
want to adjust min, low and high watermarks to reasonable values.
Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages_per_zone
and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, the changes
look reasonable to me.

Another concern on tying watermarks to highest THP order is that if
user enables PMD THP on such systems with 2MB mTHP enabled initially,
it could trigger unexpected memory reclaim and compaction, right?
That might surprise user, since they just want to adjust availability
of THP sizes, but the whole system suddenly begins to be busy.
Have you experimented with it?

>
> An alternative solution would be to change PAGE_BLOCK_ORDER by changing
> ARCH_FORCE_MAX_ORDER to a lower value for ARM64_64K_PAGES. However, this

PAGE_BLOCK_ORDER can be changed in Kconfig without changing
ARCH_FORCE_MAX_ORDER by Juan=E2=80=99s recent patch[1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=
=3Dmm-everything&id=3De13e7922d03439e374c263049af5f740ceae6346

> is not dynamic with hugepage size, will need different kernel builds for
> different hugepage sizes and most users won't know that this needs to be
> done as it can be difficult to detmermine that the performance and latenc=
y
> issues are coming from the high watermark values.
>
> All watermark numbers are for zones of nodes that had the highest number
> of pages, i.e. the value for min size for 4K is obtained using:
> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n=
 1 | awk '{print $1 * 4096 / 1024 / 1024}';
> and for 64K using:
> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n=
 1 | awk '{print $1 * 65536 / 1024 / 1024}';
>
> An arbirtary min of 128 pages is used for when no hugepage sizes are set
> enabled.
>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>  include/linux/huge_mm.h | 25 +++++++++++++++++++++++++
>  mm/khugepaged.c         | 32 ++++++++++++++++++++++++++++----
>  mm/shmem.c              | 29 +++++------------------------
>  3 files changed, 58 insertions(+), 28 deletions(-)
>

Thanks.

Best Regards,
Yan, Zi

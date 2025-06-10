Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA723246BAC;
	Tue, 10 Jun 2025 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572498; cv=fail; b=sUVU/s/o5WufpKuFYI+hqmYQLxhgisn/+ItcLp4o+jw3K+v8nZmXSEiEnrwTngjm1g2NYqEdAoI3MBT48O9D0hAtZcmAGac+s9Y93KnUnwqGhVRSzxy/2ZPz0x1wpHzo43Np4lNUZa6cgNt9yr+rEoEFnLxoH0b3rK9tRfxqeg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572498; c=relaxed/simple;
	bh=EX9wSNw7VpWbgx8/tdYUGx1Q39okUahA6UEn1pW/lzw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cmq/SBUCWnE51exaAdTFiH9tU10PcxIdYxuQMHryFb9JpwpPJ4xOUL+WaRzD1Fq1g6UrHIKB3IVWELau7ta4GE9COHDVrU4+yItVaNzihyh6jlU7XVHPEFf26WtdaqwBVqaMUhze50v7zUSiqG1IrZlKrCNYpyyRfDhmnwxy61c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=bwTBn242; arc=fail smtp.client-ip=52.101.193.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="bwTBn242"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnyaUF73vQSASrd8s6Y/S/Gcgla0Qd30eSbAHxM4Ur9etlj/CwZi3yunuSAcH+OEob5WV3mwe72vtujFphPhKO5PXdNCmhxGOpHkTYyO7gadN7LX6DX7qN3foYVaOvoAoBrwyNeHXCf7gD8u3O41Zg5QkeBpmZsvKEOy+6Yp1ubTlaBq8SFjK0Xc3TWTP/KQy5boGQdnm4lWBgwYrQwa7tkLAJOvsht8/NdswmRkfTL8d4SclGjyAL4CpI5jUR1AQe8srfJnwK8/PZcsEjBsRKUVU6s6P/DIGMU7h8KrF8I+jagAxcPMA77Y2t0IH2mKvlMzmjZ9XDXFfCe7Y1xTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h/lfLvMt2N+rw4HW75DaoSISXNHv98nykXNho/9C44=;
 b=Q2OrXvym444hIlC8SxIpqXyIfvlMSyUcBve915QfKzJzNCE0IQ6J9Jw41fmyWvGO3exXPlMUVYci0M8TV1g20WkXeSqziZZfG6OYklEPxQjaU8/3Nv//8v4BnkNJ+F3fXLNIkDLWAhELz1VDGjZZAmNBA/wUkzzkX/z7w2qjIdxZAQLZlt4D0j1p1vLS1el3MKCUESKTFfdnCeqhZDUCqRPeXRGlzDG1Fh64IdsNLS37oizCXzpt0IJjoQE6+LeKS/cn9CcTjuKUi0J6C5nniIaSXV+NGCBKxKF7qbAqw5CpT9XKIp8i18nt1UyC7IMfFEFRQ/ke9p3EYMFZbSMasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h/lfLvMt2N+rw4HW75DaoSISXNHv98nykXNho/9C44=;
 b=bwTBn242VY46mGF1E/NfYuX3qVbOrEKN41waS9YDw+SOstjGM+BegGkDFGKLdeNZ2C7xeXYmPiO9Ca4TzY1Qbn/zh5tzs0OT/eNGRZsg3Hk55wFGexlNm848hKYYOCdnfWeyLzr0PRC0JCQftlSoB+wXPXto4lE0AsP6b800x5IW8ETCCVtBCB9te/dUr6hGX6HyiX6UUFNrH+KdV8wCsGk8nxizs5ZXiQAQyoFLDR0G9T3iEL8BL4wytG/hhPCD4/+cacqlaV256QCM33Ze3UhDCIxf4lXd49wwvCrqum0G+0isUUHLfxC52YR8Aq2dY+2piNNj5LNAbFr8vNUojg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by IA3PR03MB7596.namprd03.prod.outlook.com (2603:10b6:208:508::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Tue, 10 Jun
 2025 16:21:32 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%5]) with mapi id 15.20.8792.040; Tue, 10 Jun 2025
 16:21:32 +0000
Message-ID: <7ca5a936-b5e6-40e5-9d40-a1cf5ff37131@altera.com>
Date: Tue, 10 Jun 2025 09:21:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] firmware: stratix10-svc: Implement ID pool
 management for asynchronous operations
To: mahesh.rao@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
 <20250610-sip_svc_upstream-v4-2-bcd9d6089071@altera.com>
Content-Language: en-US
From: Matthew Gerlach <matthew.gerlach@altera.com>
In-Reply-To: <20250610-sip_svc_upstream-v4-2-bcd9d6089071@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|IA3PR03MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 648c2f9b-21d2-40e4-c049-08dda83adce3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmxjMEFSbHBSTEdPTEZlOUE3a1pKbGR0dWxNT1FnS3d4MWpjSTlJek4wY3VJ?=
 =?utf-8?B?bkp2elVnTFlLNmZQN2VPcCtNMVBEcW5obzFlNXNxUXlOUjVlbm9TNThZWUVr?=
 =?utf-8?B?QWIxRVZjQmFySnVXSEN4UXIrMTNqY3ZyakZTNyt5cXJsZ0oyU09JWXVDbWlE?=
 =?utf-8?B?b0VRbHJ4dWdaOHQxczE3OFZlcldDd2JaNHY0L01ZRUZMMHIxM3crVzRidVEz?=
 =?utf-8?B?MTUvbUwyVUFKWWlYb1ZIT2Z6NjJJaHRxQjBBd05mTFdEeU5hOHRLeExPYlBI?=
 =?utf-8?B?T1ZRZWdPOTBpbjJ2djVkdUtocUtqaDJPYUFEdURzYlI2RUlwR2ozSWt1S3lw?=
 =?utf-8?B?YXV1dm1sN1NDaHY5N0FEUzNnRy9sUmhJVXlrWENFdUh4S3JJRGg3RkxrUWwr?=
 =?utf-8?B?Zzg4RmJJVFIzeDNDeW5YbkxJZi9YeXZSaDFYNlduWS9lUVhoY2ZGaC9rbHdD?=
 =?utf-8?B?dVdZWHFTN2hadTlGTlBISmk2Z3pFN0tRTGhIT3MxRTVacWw1Ui9pWUlXOThH?=
 =?utf-8?B?L1ZOMVZ6TDhLOVFHa0xvS0dlVUdhM1R0cWZkZWJvZHpnTmRiK3RNVER0TkxW?=
 =?utf-8?B?YWZDeGsxOEV3bTcyN1M4dVVnb0hIS0NiU0l0K21NMlgyUDB1bU83L08rT25W?=
 =?utf-8?B?SzREK0JEMU1EbmlaNW44VWJjdEtyOFE4YUFFUVRwUkJmM1hKRVl0ZnVVbmFn?=
 =?utf-8?B?Z0Rkb3BTQU1ya2p2SERwS2xub1Z2NDNvcXBsRFlMdFFsczFRanhGZGVZWDZC?=
 =?utf-8?B?eHphMUxqSnV6OXpWaU5WTzcwMHBtUng0MDR6SVJUMXJES2g0c3h4WFVTMXoy?=
 =?utf-8?B?UEpiY3dsU3NnK0FKV1BwRm15dHREbC96M3NKSi9SU2xkcnpDRytqNkVpd01Y?=
 =?utf-8?B?Y1hSalFLbVgzSHlqUWdmRThER3BWK3BIRmUvQVlZOW1SeW9jRjVWSjN2RTZV?=
 =?utf-8?B?UUc1aFROeE5UdUUxdUtKangzSS9nc1NkK0czSy8wMmVWdFFOTmZ5dEdWRTNP?=
 =?utf-8?B?NFZLa1hkQ1JqRzNoZ3R0Wld1akhRRUcxbEthSllzcVd2LzJZT1pQOC8rMkp4?=
 =?utf-8?B?V0FoRjZSQVZQS1VVTE5xOHNWVlNJWW94dHlmQThEM1pPMHpwejNLZHFvMXQ1?=
 =?utf-8?B?WHp3eUNxdHpPeC82OHpWUy9maE5hcm5SLytEejFRdXc2a2FncDlPT1dzTUZU?=
 =?utf-8?B?ZkwzUExGek1ZQjFEazZMSXdvOTB6UTQ5TDZFVjBYYVdpa2dqVTI0dXp6RFhE?=
 =?utf-8?B?bWZLUXFsZldicCtkaGtPZzVRK3VNbnBFNDl2TXFhb1lKVmNrSlBJUGhocW9p?=
 =?utf-8?B?QmhYQWhwMDFUTnpaamd4Qk40eFRBYVNWbzRTZUdWb0NZWDlpRkE5V3Rja0ZW?=
 =?utf-8?B?YmY5SXc3VURPS3JtRDM5RDF0MkZTbC84ZHdjSitwYU5ZbHJmdXVReGRudzh3?=
 =?utf-8?B?QVdWbnAvTnNzQUd5SnE5Nk9FajZ6ekt4MDhNVFRvOWlvd2tEVjhpZVNYR3Vx?=
 =?utf-8?B?VSswMlJCNnNUa291VFAzanlRVHl5NFJZUExCUWw5MmxlZkJ5WXVRdDh0WmZq?=
 =?utf-8?B?QnZkNDBDbm1JWFRJblJPSnlaemdEOGdON0Ezc0ZyZlkxNGhrK3N4bzJlTUxM?=
 =?utf-8?B?N01EbkVhTkEwQnZZYTYzUWwxWjRNLzZVd29iVFVpVmQwMXVsT1FDNmVvUlFz?=
 =?utf-8?B?akl0SDZ6SHpqYURES1JzVGdwZUJFSEhiOEVtL3pTSWJlMnhyNTZUeFFkbCts?=
 =?utf-8?B?OUVld0cwcmRXQzlkVi95ZlpYL29TQzcwaG1wcWxlejFubXZ6U3Q1YjZBSG8v?=
 =?utf-8?B?cU9hZStqN3hVcVFRRnQ1SUVtbm9NK0FGRlo5K0x6Qk1iY0lvRXAxZGhuUWdy?=
 =?utf-8?B?N0dRdURlZGhTSnBGTHdUM2poQThLN0cyaUdNeGEwaVExVDNLNDVSbEd3cWxl?=
 =?utf-8?Q?gZVRN+4HHFw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STB1aEE2bW9IamJ2eENQcGVTN21tRlplT0NwZjE5SmJGZVp2TU9DcmxRMlBT?=
 =?utf-8?B?K3l1dWxIVTcrTDh6WUVrWGp4M29palg5bkkveFAvS1NQK1JvWWpnRWYzKzF3?=
 =?utf-8?B?ZnNhOGtVcmZDdG15azMwaW1Jd1RWZ09VQnVad2NuMUtXVXBVOW53M2M0cU5J?=
 =?utf-8?B?NGQ2QmtYdGRtNkJ6ZmUrc0tEbTRYUURhL25kcGpndm53ZDVaaVRPd3B2ak1Q?=
 =?utf-8?B?ZlE3V3BrWTdXMnRNZy9zWHJLUUVCdEhmbWdMTUc0WGdVRE1NZUtEOHFhdEp5?=
 =?utf-8?B?OXFBN29ac3lONzY1dVI5NmVIRHhPSjZvK1hHQ1U3WkJkZjA0MnBWd0RGaW0x?=
 =?utf-8?B?SEVvYkNIZkliNFNZMWRXUi9CZmFNN2tRRTI0YlhaZnU2Vlo5WWtxamtybGE0?=
 =?utf-8?B?eFFHenozNEljYXpTcXM3Q2t2Sllla2RqRWNoZ0NaSUcrUDVpQ2xNTlJ0Vlpv?=
 =?utf-8?B?enloZms5b0hjTzRhWjgvOVFxTEF1MkExeVdSb24wOXpzR2k4YitsTXRxM0NJ?=
 =?utf-8?B?bGVyaTcvRTB2YW9Vb2hZTkxZSmV0WXJUVjFKdHluMUpaTkRESnRLUko4b3Zl?=
 =?utf-8?B?Ukg0R2FkajJ6MmRHU0VjRlVHd3dQbmw4emNSLzlONU9lQnNwV3hkclg4SVFu?=
 =?utf-8?B?SVgrZUNMUDBQMGxXd2xNUVBCOHczQ3VyTG0rREo0ejRaZkhmVUl1M3g5RnJa?=
 =?utf-8?B?SmttT2wwenhGUEVOWS9IaDgxRFlxUmFxNnNaTFR2UGJYbzRERUQ5M0hLWm1z?=
 =?utf-8?B?Q051elZDUG92Vyt4ZHdIcGtyUkkyZnArbnJ1b0ltaEsrSXpCYjMzc2FKMTRD?=
 =?utf-8?B?MkpRYTBETFdGay9FaTdaV0p1ZjZXS0NLNU5xS3VxVjZtMkRGSk1ObUhiN2JY?=
 =?utf-8?B?bmx1Qk5VdXJCazlxVzFKTEtHakhCM2paa1gyZ3VYWHdua1pSZG9PTEh4YjNE?=
 =?utf-8?B?TWhJSWxGT3g4eFZ5ZjNsTHByTU5OajMwQXJqQUdzK1c3VFhNdlVsQlFzN09P?=
 =?utf-8?B?cCtrcXdabnNaTktBUlNKZUN2Y2M0NE8yMkl0aHJxMFY4cWpSN3NzWElmSi9X?=
 =?utf-8?B?bVpMbHBmN0czeHdGVnRsclJDUUFKVUYvNWEweFRYTy9kVHQ3Sko3Q0x5akli?=
 =?utf-8?B?OS9ZVUdGcHRiQm13bEZBbUx4ZEp6eGxFb0wxWnhxdzlLZ2crMGxZa1kveGlJ?=
 =?utf-8?B?dThySjFtRUk3U096SzFCM3FLRVBDVy80UkFrTTFQbTg2TnFlMGV6VXo0WSsz?=
 =?utf-8?B?cVFoVWhBc2l3OGVjVmF2blFRTnB5U2RnZDFTaHp1eitHN0w4ZXdwcWZTZFlB?=
 =?utf-8?B?MUVjV1ZGS2JrbFEvWWsydUZxbkFreXNKV3p1dWlkUVhueGlWVW4xaXpEZi8z?=
 =?utf-8?B?em5tVERTL2lLWExjT2ZMMmF2TkthcDBQN0hmVW13dVFqZE1WN3NEK3U2bTRq?=
 =?utf-8?B?bmhxc3gzT3p6aFNNY3pGOXkyaEZSemhnUkZ4ZFFPWXpFNkQvWWVyVFEzWE1k?=
 =?utf-8?B?Mjh6N1BzRndiUDBjUk1iaVR4Yzh3M2hIcCsyTmI3NUlHM1ViQlk4Z0xNbm1n?=
 =?utf-8?B?K01jYUxxNHEweXJNZ2xBdGNrbi82V3I3Y0lmTFhiekorUmFRUXVOR0NSYXQ0?=
 =?utf-8?B?NEMrVUZVTGc2YWpuQ09qQW9CWTZPb1VWdEFzV25Ba0p0NGpCRkNmRmw5Rysv?=
 =?utf-8?B?UHF4Ynd0aXVUdzI2OFZCR2lWaDdkQzh0dFZoQjBVY3djb2VkOGZzNEFXT3Vm?=
 =?utf-8?B?ZjhJS3RQS0JNeGRIQ0RNb2ZIMFd3Q2x5WXcxYlpSSUtxTHRydmd2bVhnOCt6?=
 =?utf-8?B?ZkF5ejBNZ1B1dDFHR093ZkpjcUNBRVNxWDk1eTY4M1FraC9aZDVuaTBrbytE?=
 =?utf-8?B?eTNwdkE1YWN5RGRvd0F3czJUSDFhc09tT0hpY3A3cGdaTjY1bnpDK2hCc0l0?=
 =?utf-8?B?VUJIVkxLMkR2YVh6SkdvMllDYks0Z2wwUWx1b2ZaTEc4cGRpYXh5Um1vQjRq?=
 =?utf-8?B?QTM1WHhxYm5JMWNCOXNqY0kySExOQUdMV1BFWklZNkJ0TWVnQ0x3dkZNdjlF?=
 =?utf-8?B?MGhDN0RYdEM1MzNMcHR0a0FFNXlTK1M5UU12T252SXM1cDE3VGdrU3UvTlFk?=
 =?utf-8?B?V3M0NmhoZDBZYzc1SURGODVxY1Fid2JZTHRkUHlrV2pHeVZBZUo0Yy9OQUph?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648c2f9b-21d2-40e4-c049-08dda83adce3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 16:21:32.6157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dO5qQk5jBlUmGn5CehjddSx2PnJIIwdgIUDe61UnB/tpvLy2RmVDkXMENgv9cI5C74QTJFA5g1400ZDEpDD+IMR0WCinJVlpCJ5jKr/KEwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7596


On 6/10/25 8:37 AM, Mahesh Rao via B4 Relay wrote:
> From: Mahesh Rao <mahesh.rao@altera.com>
>
> Implement ID pool management API's which will be
> used for Stratix10 Asynchronous communication with
> Secure Device Manager. These API's will be used
> in subsequent patches for ID management in
> asynchronous operations.
>
> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>   drivers/firmware/stratix10-svc.c | 195 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 195 insertions(+)
>
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index 955468555738b2031dfcf6dc4db7dbf11ccc482c..6d21f0301c3457c1b1bed52e39ee03d14294943d 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -170,6 +170,21 @@ struct stratix10_svc_chan {
>   	spinlock_t lock;
>   };
>   
> +/**
> + * struct stratix10_sip_id_pool - Structure representing a pool of IDs for
> + *                                asynchronous operations.
> + * @head:         The head index of the ID pool.
> + * @size:         The total size of the ID pool.
> + * @id_mask:      Pointer to an array representing the mask of allocated IDs.
> + * @lock:         Mutex lock to protect access to the ID pool.
> + */
> +struct stratix10_sip_id_pool {
> +	unsigned long head;
> +	unsigned long size;
> +	unsigned long *id_mask;
> +	struct mutex lock;
> +};
> +
>   static LIST_HEAD(svc_ctrl);
>   static LIST_HEAD(svc_data_mem);
>   /* svc_mem_lock protects access to the svc_data_mem list for
> @@ -177,6 +192,186 @@ static LIST_HEAD(svc_data_mem);
>    */
>   static DEFINE_MUTEX(svc_mem_lock);
>   
> +/**
> + * stratix10_id_pool_create - Create a new ID pool for Stratix10
> + * async operation
> + * @size: The size of the ID pool to create
> + *
> + * This function allocates and initializes a new ID pool structure
> + * for Stratix10 async operations. It allocates memory for the ID
> + * pool structure and the associated bitmaps for ID management.
> + *
> + * Return: Pointer to the newly created ID pool structure, or NULL
> + * on failure.
> + */
> +static struct stratix10_sip_id_pool *stratix10_id_pool_create(unsigned long size)
> +{
> +	struct stratix10_sip_id_pool *id_pool = NULL;
> +
> +	if (size == 0)
> +		return NULL;
> +
> +	id_pool = kzalloc(sizeof(*id_pool), GFP_KERNEL);
> +	if (!id_pool)
> +		return NULL;
> +
> +	id_pool->size = size;
> +
> +	id_pool->id_mask = bitmap_zalloc(size, GFP_KERNEL);
> +	if (!id_pool->id_mask) {
> +		kfree(id_pool);
> +		return NULL;
> +	}
> +
> +	id_pool->head = 0;
The above is not necessary because you used kzalloc() above.
> +
> +	mutex_init(&id_pool->lock);
> +
> +	return id_pool;
> +}
> +
> +/**
> + * stratix10_id_pool_destroy - Destroy an ID pool for Stratix10 async operation
> + * @id_pool: Pointer to the ID pool structure
> + *
> + * This function destroys an ID pool for Stratix10 async operations. It first
> + * checks if the ID pool is valid, then frees the associated bitmap and the
> + * ID pool structure itself.
> + *
> + * Return: 0 on success, -EINVAL if the ID pool is invalid.
> + */
> +static int stratix10_id_pool_destroy(struct stratix10_sip_id_pool *id_pool)
> +{
> +	if (!id_pool)
> +		return -EINVAL;
> +
> +	mutex_lock(&id_pool->lock);
> +
> +	if (id_pool->id_mask)
> +		bitmap_free(id_pool->id_mask);
> +
> +	mutex_unlock(&id_pool->lock);
> +	mutex_destroy(&id_pool->lock);
> +
> +	kfree(id_pool);
> +
> +	return 0;
> +}
> +
> +/**
> + * stratix10_reserve_id - Reserve an ID in the ID pool
> + * @id_pool: Pointer to the ID pool structure
> + * @id: The ID to be reserved
> + *
> + * This function reserves an ID in the given ID pool. It first checks if
> + * the ID pool is valid and if the ID is within the valid range.
> + *
> + * Return:
> + * 0 on success,
> + * -EINVAL if the ID pool is invalid, the ID is out of range, or the ID is
> + * already reserved.
> + */
> +static int stratix10_reserve_id(struct stratix10_sip_id_pool *id_pool, unsigned long id)
> +{
> +	if (!id_pool)
> +		return -EINVAL;
> +
> +	if (id >= id_pool->size)
> +		return -EINVAL;
> +
> +	mutex_lock(&id_pool->lock);
> +
> +	if (test_bit(id, id_pool->id_mask)) {
> +		mutex_unlock(&id_pool->lock);
> +		return -EINVAL;
> +	}
> +	set_bit(id, id_pool->id_mask);
> +
> +	mutex_unlock(&id_pool->lock);
> +	return 0;
> +}
> +
> +/**
> + * stratix10_allocate_id - Allocate an ID from the ID pool
> + * @id_pool: Pointer to the ID pool structure
> + *
> + * This function allocates an ID from the given ID pool. It searches for
> + * the next available ID in the pool, marks it as allocated,
> + * and returns it.
> + *
> + * Return:
> + * A non-negative integer representing the allocated ID on success
> + * -EINVAL if the id_pool is NULL
> + * -ENOMEM if no IDs are available in the pool
> + */
> +static int stratix10_allocate_id(struct stratix10_sip_id_pool *id_pool)
> +{
> +	unsigned long tries = 0;
> +	int id;
> +
> +	if (!id_pool)
> +		return -EINVAL;
> +
> +	if (id_pool->head >= id_pool->size)
> +		return -ENOMEM;
> +
> +	mutex_lock(&id_pool->lock);
> +
> +	do {
> +		id_pool->head = find_next_zero_bit(id_pool->id_mask,
> +						   id_pool->size, id_pool->head);
> +		if (id_pool->head >= id_pool->size) {
> +			id_pool->head = 0;
> +			tries++;
> +		}
> +		/* cycle through the whole bitmap at least once*/
> +	} while (tries < 2 && test_bit(id_pool->head, id_pool->id_mask));
> +
> +	if (tries >= 2) {
> +		mutex_unlock(&id_pool->lock);
> +		return -ENOMEM;
> +	}
> +
> +	set_bit(id_pool->head, id_pool->id_mask);
> +	id = id_pool->head;
> +	id_pool->head = (id_pool->head + 1) % id_pool->size;
> +	mutex_unlock(&id_pool->lock);
> +	return id;
> +}
> +
> +/**
> + * stratix10_deallocate_id - Deallocate an ID in the ID pool
> + * @id_pool: Pointer to the ID pool structure
> + * @id: The ID to be deallocated
> + *
> + * This function deallocates an ID in the given ID pool. It first
> + * checks if the ID pool is valid and if the ID is within the valid
> + * range.
> + *
> + * Return:
> + * 0 on success,
> + * -EINVAL if the ID pool is invalid, the ID is out of range, or the
> + * ID is not set.
> + */
> +static int stratix10_deallocate_id(struct stratix10_sip_id_pool *id_pool, unsigned long id)
> +{
> +	if (!id_pool)
> +		return -EINVAL;
> +
> +	if (id >= id_pool->size)
> +		return -EINVAL;
> +
> +	mutex_lock(&id_pool->lock);
> +	if (!test_bit(id, id_pool->id_mask)) {
> +		mutex_unlock(&id_pool->lock);
> +		return -EINVAL;
> +	}
> +	clear_bit(id, id_pool->id_mask);
> +	mutex_unlock(&id_pool->lock);
> +
> +	return 0;

Inverting the if statement would allow for a single exit path:

     int ret = -EINVAL;

...

     if (test_bit(id, id_pool->id_mask)) {

         clear_bit(id, id_pool->id_mask);

         ret = 0;

     }

     mutex_unlock(&id_pool->lock);

     return ret;

> +}
> +
>   /**
>    * svc_pa_to_va() - translate physical address to virtual address
>    * @addr: to be translated physical address
>

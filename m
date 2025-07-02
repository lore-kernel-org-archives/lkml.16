Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F022E7BC1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471801; cv=fail; b=QBZ3oJHs/Um6MsvUK7CDwL+ZQ96cDcgMclIFLulKSnRjCnZ3magpyi8XMf9vlC9qAhrXWN3mEdcDsbSVNzR8aXfgLTdxdYUuYDhSPy2ppOF2rpfaP/CqEcieXFthC4ikZeVZdejTjMcsdqc3byJtJWDtrhRADtU/qTD+g4ZHvhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471801; c=relaxed/simple;
	bh=tukTeCy37QNV7TzxPMXRdd1jV9n6TRqsrLaMniZdCT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QX8pBQlzbj2081gsA5OBKItndaAsACPxjmJ7lFUbgzJCY1BAxZ+ITR6dPxWkQCtkMyLwN8ZzVRl7OtsJFX6In98j0Eql1eSKEGOsxhrmIFNWByp1guimNnUBqrztelTxV2RUroZBCZmZ+jU0lgmUiTAZmMYRO3HhJnTPaqTI/Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JIHEKsjZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vzhTnehC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JIHEKsjZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vzhTnehC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562BidBK016652;
	Wed, 2 Jul 2025 15:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=6ADRZa0BeS8lDNjZYlAyBtMtq7P1dSBvvK63LpoQcME=; b=
	JIHEKsjZqOZpHiKzocC3rPrKwqrvmrwuBsPuS4xdv1AVZsWeo4DJqGIJuY6iQvh1
	VFv8nkj2e3V11VvZxzKfGtt2/Sv28WVJuhrEQm4V16wLDvv6Bn8+cqkLbEuctHNP
	e3+RTgcJnA6jslz1PrE9D9nBcXistryqWz9BcgPImGrZK/+dZ5kYrxtTdNOqZ5cj
	EGLygkgpcgoZOYVwKvBgXowqM+twLsfEpGBPTxeq5YBLR9R911LZs78Fb0MhJpsl
	XQ9RF9LH8OPz5Otznj5CxpMD3udSiCFbJz2jxPfvAF8IN6pB3J8XMNWZLgoOWjSh
	ar4MPR7RSm0ZF33o7b9kNw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704fa42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 15:56:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562EesjH027501;
	Wed, 2 Jul 2025 15:56:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubcx31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 15:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edPNL2vR7MloR73ahZmeREL/q+5DISilJoOq59/cSFYaoPpXznIvrVuDoOGZ5DY77pT5j8/ULcpcZ9cLd0pfHauRMBkR3mnHbw2iCZnFrbVAlDfLJ5XuF69KOp5CH83M3REGSO5LC8oOnMbQYRyUHl/LULvu3Ule6eDTxs2XXCl0U94c+n8CQc5SGP/8B/l1p/PW/EzUzjphqs1zZyoFb7b98l7yT0WI5/NihzqxeCkSbYWrXW3tSUDB2RLlU3gfxTXnK0oWQQbsnI2TJcwHhX12BrwvNpnZhxJyOOchvr4EWQe8yHAbKkudKGEjypa7dY679pM2w+/x9svnoBQXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ADRZa0BeS8lDNjZYlAyBtMtq7P1dSBvvK63LpoQcME=;
 b=vWNrn0Yvu9/Y7zDsyQ+ST6ToUQ2N1jYK1FxL4RwVC5U+f7trTpea+6KHyZXha6JPBiT8ZX1ypR6ZeREIGPTcT4jRc93QcOO8ot4PTCoX5C8O07fHwsDMysuHUDWa4f7NxqdzzkcHM2ZCbMMXlYxldF/gGgwfe6ugnu0SE8odRUL8Vn0lUe4dJcUMAQ6Aa0a88gsGfSeIgxp5gXil2ToMUGEhUmvo/J4avgahFvYu5aTFUC1jr400DxegEhZA0Bo+DmUOD2wf8M2C+leybxHEj1/feuhvMD0DyKYruoMngo1D6pMRosoT3H8QK07Kblnri5g+t0fKrjoTVRGCVTaqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ADRZa0BeS8lDNjZYlAyBtMtq7P1dSBvvK63LpoQcME=;
 b=vzhTnehCi+65pXXNWbhqRE4nkJPwsRfuEqVCrUhz/S/zhSS3McDY9ZCuXDPxcHFalm/JVOXmENTsS1Xvi4OZkq4KLJ2nnLLp72i4vTe+sHdWS+3b/kEIE9z3N3zy8faTiehnvzR+67PqOIk+3n7sxmLCacXz5X6jBpDRpUmQ650=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF4561E4FCB.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:56:06 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 15:56:06 +0000
Date: Wed, 2 Jul 2025 16:56:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF4561E4FCB:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb92998-bc32-479b-fddd-08ddb980f469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXJscitnR1p0NTlzcU9iM3h4VEY3S2drbUR3Ky9KUXNoc3psdTBwaTE1RDFr?=
 =?utf-8?B?WUVUZXZtTGo0NXpjcDNuelA4NzlPbzRGN3dzUlc0TEw3emJHbHhzNllXbXZv?=
 =?utf-8?B?WXNUWnUwTWtnSzBIc0FzT3ppaTNBd0h5WGhnczJ6NnlIaXQyd3hTMnpXSVZ1?=
 =?utf-8?B?OXRRUGQ0Rzg3eDQyNit1VDZUOUtNaExoUmljc0w0TThTeXJWVmxWSTJOQ1Fr?=
 =?utf-8?B?Rm43K0VRYytSUFloL2hMSHYzNVhZTG96MHFKSFpaQXhiVkdwVUZMeWFGVWFQ?=
 =?utf-8?B?dnhnV1ZHai9LdC9sYjlLbCtzRGJIdGVubHRXam5iSlFVUitQL0l3MWJNVDlJ?=
 =?utf-8?B?YzIyeHlWWFZzcXNwT1NzSk93cmRZUTAxQmdBSzFRY3JrUVdKWWIxanZUTC9V?=
 =?utf-8?B?cHY4enpSZUVrNTZ2d3A1U0NEMlQ5WCtwaEFadGpDMUxCeXhKWkhvZXZaUUNr?=
 =?utf-8?B?R2gxVXM1ZUFCa0w5bXNFblRVSzY3K3l6Wjh2TC9MTnNMQ0RsSnF4UXBUdTNs?=
 =?utf-8?B?TFprOGZkeXU5Q0hNQXpnck8xWHZtOERDYUhhV0hqcFUwcUdYclhhbk5OZTZa?=
 =?utf-8?B?SzE0cVc1Tk92V0RiQllVNVRydjRTN29OWmZ0YXNoL3FhSUZuYmtHUzZNdzJG?=
 =?utf-8?B?enBFOHdRTlQzY1E1ZlZZeVVsMzZjTkg4RjdON3lnTkwwQU1jcjZXMHNubzBj?=
 =?utf-8?B?UVZWcFpSQmF6U3BGNytocDNlcEtEc0tDWVFwZXlUQ3ErWXhpUlFOS2VpQTkr?=
 =?utf-8?B?TER4TzA2azE1T3UzMG5IR2J2MmViVDJ6c0llcDNadDdKS2lud09QdmYwempB?=
 =?utf-8?B?STduVmZiTEtZYnRYRjU2TXVvRHZDOHFsbTZDYUx5S2lqUCs2TWkvdVl5Tmd2?=
 =?utf-8?B?emVBL3U2dzRqRWhZbU0xVEZvMFBSU0NuaGtLLzhUOWFhdTYwdWZrT09WYjhh?=
 =?utf-8?B?K1pPUExYZTVPNXEzYmhiNW9NclV0eXN0djJ6MU5LdTZKSXBZNTNrM3U1bC9F?=
 =?utf-8?B?SDNOZDZFbVFhK2JvNWgwckt5QnkrTTdiOFBmRW91aWFHTHpFWFpnejM0bmtF?=
 =?utf-8?B?S3dLSUlseHloTXplVXFBUTllSUlqL0c5dnBIOE5PajMrOXVTcTJ5T253L0d4?=
 =?utf-8?B?Z1dpVG9nd3RLRDlDK2VnUUVLaWdqbXVJaEZUWVJDWEh0VWEyMkFXY0xTeXUz?=
 =?utf-8?B?UGVDSEdoZGw0ZjZqdWJFS1dyRUszRTVBTFVNcHJlSk5xalNaQzRCeVdXaWU2?=
 =?utf-8?B?Z0pabjdYeTFOYXZFWTFIeXc0S1A5Vy9FUzFnMzdZQ3dvSTd3RG1nWWdQa0Na?=
 =?utf-8?B?Vm9wYWY1YVhGb1pEMURJalc5QU9COGpSdS9ZaytjU3pWS2xpNXdzdFZ2U05w?=
 =?utf-8?B?ZFAxeUg1Zyt6ckYwYzMwQWVFL1hsclE3ZzFHWUwxM1JCWE1oUVJoZFo4elUw?=
 =?utf-8?B?Q3RzdHhqbk5ZQlNoSXBqUnhtOXdod0dqZ1JuVThUM3hWVTRZTmovNmJHbmMz?=
 =?utf-8?B?KzdkM21ZWHlmWXhGcUtnMW1IRG5XZ2JNMHJWRm5DS0RER1k4d1JlSHNjOFBs?=
 =?utf-8?B?M3Njb04zNWdKR3Zzb0hhaXJhZHcxazN3Y2k5VXhpb0NpQ0hJWlMySzJUR0Fj?=
 =?utf-8?B?Q0UwUWpHd09sdGdWZEYzSEhHUm9zVlBsOGV0RXplSjlxMG5YU3h1dTFpNzA5?=
 =?utf-8?B?WFN1b2JlUjB3VXFZcXlYMTdObGdCNW8rVUJIbW91L2ZIdmJnZUFMVkpCbWxT?=
 =?utf-8?B?dXl1MGdtOXl2akFNK2lwWHhSSXl4VzBkdUJxa0JGWUlZVVVEL2l1ZU94THRn?=
 =?utf-8?B?U1ZRbGg1ZnhFdkNLWS9lamgwUjEzZUV0U0ZSWDNoNDVFaGlhSWJvbG1GWGVh?=
 =?utf-8?B?Q3pHWUFTRmMrbEVDcSs0T2xuUDlIS3lzSXBrVXdCVUQwR3BWczNUUk1CcU5m?=
 =?utf-8?Q?HDQ+LUN0joA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUt0RzZNcHgxQk5wREw5TUFvdklQanAzQm9YKzBFRHlmK25CbldkMzcwajJE?=
 =?utf-8?B?eXJPMUVhbExmUE9FQ2J0RzROY29DdCt1MDVlOEdXbTJiWFRmczFKL01qWStv?=
 =?utf-8?B?YnZ4UVU5THBKZTlaSDJ3WVBQVjU0OGhTdmtyZVFjalF2WVFlbzZpWWVDczE5?=
 =?utf-8?B?emljK2hVcTgwbXhwMTBlMWdhaTY4RkYxQ0MwUDNjVDBBSnNoZWIwNmpLZGhZ?=
 =?utf-8?B?U0J5TFdydFdiYkJpbFRya1hNVXBZcU9HdHd3VVJUU1F4SkowWGVEUmFSS0pT?=
 =?utf-8?B?b1V2R0h5RVgxWlNrc2phVitCMDhoelp0aXVualJ2eXV3RkdnN0RpRGMxMW1l?=
 =?utf-8?B?d2hYUDh3ZWN1UC9wS00vcXpQTE5hdFdFMGtHZXlXQkxyUEdDK0lNWDRjNzl0?=
 =?utf-8?B?MkY2cXl6MGY2QjE1Nm80ZjdSWklyRndsWis0em51cnpQUXQ5NjlsdVdaSERH?=
 =?utf-8?B?b3ZNYWRjd3FxVVEvYlFYM2s5MVlzZXIycWFIVHhnWGJkUklIQzRLeDRKelZW?=
 =?utf-8?B?UXJGd0tLR0tCUUNQYW1SUmROVWNVUlcyVmt4NFVLTGJHd3JONWtuSlpYazBm?=
 =?utf-8?B?ZnZKZnVsd2dBaGRVY21Dd0x3WmZrSGJBWEhBc1c2Wm1BUVREYW52eElkcWJ4?=
 =?utf-8?B?VlNuK05za2lXbDQ3Vzc5Ty9rdExxbElZSkFuamRCNUxsb3kyNWtGOW91ZUFp?=
 =?utf-8?B?R25HYU9sU3AvYWZKendvQ25Ud04wYVVxbHdOckdHRWpWN2UvakpFejM4MVg3?=
 =?utf-8?B?ZUNCd05FOEJ2TzV0QkZjV3JEKy9KaWJZb0dVN2lGMnY2QjhGNXkwS1dwQ0Ir?=
 =?utf-8?B?TEgva3IwVDdOSm9URDd1UFFmT1gxaVhFYmU3OHhSQlVYQUVPamhycDhDMUhI?=
 =?utf-8?B?TU5ydFgyOUh4V2JWUGhBNWltT1BBaEdXYnVwbXZSWkNDVFNjWTdsK2xYbmMv?=
 =?utf-8?B?VWYrT3lCV280SzlzR3F4bEV2OHovSy9BVE1xalZYWGZQYUd4V3Zrc3FlRmlB?=
 =?utf-8?B?S1E4WmhNZlJwSm52QjEyWDV4Q0U3R3ozNm1NM2lqa0dGZ0EwOTliTlRNOHNJ?=
 =?utf-8?B?L2VycHJhclF4TWh2TE4yR0ZmV0wyc3lmekhybTJkNHBpeXVtWit5VnpXbVp3?=
 =?utf-8?B?UEwwaTFoa1duNmw1VTJraE1rMHFXUzc4Vk5yZ01UaWhKMHprUmZBV001Rks4?=
 =?utf-8?B?ZnpoWGdaeDlVcG12TER3MTRiT3BGb0RnQ0ZaWDBqWFhjaGJJL1ZUZEduSGNp?=
 =?utf-8?B?a3ZpMSsxTUVSRHhoSkttdVBvU2pZRGlCMi9yWTdUTUZ6aWREZm5sMlFDc1dM?=
 =?utf-8?B?RjhjQ0N3cXh0T01vMHF3b2k2bXdJQmR2dHdBU2I2UHlPSXJaSllGTkdwZlNK?=
 =?utf-8?B?L1NWTWljcXpqdW1PNDFoMG5MYjR3RnVoeDRYRG9YYy9qcG5reVoydUY4SGZK?=
 =?utf-8?B?OGtxM01ObFl5YXlYWFBFWVJFaXRQQUhZOUtwbDVwRmlMbUlYdDI2K3FzRXdD?=
 =?utf-8?B?eEtZQVZvRDZFZWhJT1JRajZGbWxIeExhd2ZuMmNsRlhHdWdEbjg3YjF5NFdu?=
 =?utf-8?B?SzJpaEJMZ1RmRUJNV0V2WjhEbFZxWEttSTZWbFR4Qm5WbWtlcElYVkFQZ05n?=
 =?utf-8?B?d2pwaXBWM09XQ2RjdXFPa0w1Q2xmVzd6SlU1eHY0Rm8zVGxqQ0xIMTVHT1Bq?=
 =?utf-8?B?L0gxSHpYUTcxS29uR3VBZENiV043OVk4OEpZYVF4bnlZaXlkbE9WTmlRQ1V3?=
 =?utf-8?B?VlJDdHAvc2QyZjNOVWY3anQ1azhReXhIdkpNNGZvQThQQVdOaVFPYkNvNzBr?=
 =?utf-8?B?NDZpRC8wS1RPdHFhSmdOeWhteWc3aDJkYjFjeGQ1Rzc2V0p5azlZN2VQZTRk?=
 =?utf-8?B?OXJPZ0JnMUpqT2Q1MkF0c2FPV3lic0VObTZ5RDh3SzMvTVNzNVRUM3R1OWFO?=
 =?utf-8?B?UkRZNlpoeUF6Z3RxQTVLSmZDdUxPMzNsSEJrMWJ0eSs3TzlDM3NuajhGQlIv?=
 =?utf-8?B?SFptS1luWk1yOGk0TzB1MjE0N3RhRHdtOGRMWHJCMnF0WGZMSkFScG1iWTZ2?=
 =?utf-8?B?ekM2RE9kQWg2R3FOcXo4a3c5UTlDa28xcTVNbU1RR0RVZDdnaFBveW1RcmFW?=
 =?utf-8?B?WGFuSEl5UFJlNXh2UU1WR2RKVFhSejNKNGFtbE05YUFpa1dhNUJMOHMwdzF6?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eWDKWbcAsAmHC8fXTbfNUj2KgFozmEgjIj7AMbDeq1cmCllW1F6DrurXao05nfMCqkoq89cJ4plfaRMHJ6oQDTezsVWZ8KYpiD78Yn/0hYf/dTwHeGXy/wDxkKrGDevvdB7cQxNmFzYkHy7yQvoDhV28M73dVbtvLqW9uxfbYhdXHCZuf5U3BcS2+RUEc/bB/ZkKsChOjIXLSUoP2HsSyt8zG1rTa7CT5RFw7T7If5sgx993yjDSat6X6+eJCRapdffCmr8TzWUfIbjiuE6OeyR4EVtwh5s/wlP99X5/MDC7eYnkXE/aER87TH6ujGFRxYWVIHA8q58cJLy4HMGk2V8ccfpDusxYl1YDuzhSiJ41TEgS+LI7BeHtdHTpcMtVl4lYksK5OLjAMAlj8Nn59tbDf4HRj7nE+2gnWwQ8k492VQk0z0oY1cOAlDLZn/OVprQaUMN7VUTmg9zW/BQfDPYq6ZnJJo6Lsg7LW8gNXaatMOY7AzU1MdMCy4Qv/gxEsAJMTkiUYJIdoUVdWQ1QFCnoBtbvUUqOJ8v5bKCpFRUVCRY8vqU0/2k9xmuFSngBLI0/fI9WE9Ti6FpSKWYZERCoaEdg/TodjB4uIIprddg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb92998-bc32-479b-fddd-08ddb980f469
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:06.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2ElvgFz2pIsPVjb/5Tkjjh3/FoLImHJ5P29LV6BrzJTB3oYdnZbvMY6vm2FFpyx6Vu6N7gSD6hCaWy9BcoUvLpv6sCFxIkWHLhSol+612A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4561E4FCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=745 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507020131
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEzMSBTYWx0ZWRfX9/srvMOOuEQp 7BpbO0K6EgmG57rP14eF1SSqBdWC348FzNiUt3zrwrbG5P9LD0m2fFX0RmrlKyZOcbKm+lCI3p6 JjK8tC8uH8lsF1mUDavx6mljeXtphdq3QKvXz1BfklI18khrbbH8Ggy3bEtU9SOwGY3mTx+g/66
 bBuViDYNO9LCA1og5ttrCebBO1dTzZkZQpSTcyVyIHfVLRE3PqDV2DUw9x0dOhVDWR9Yf0uKtMx p7ABiV4DwgS6emPlzhMuWfdtNRK6UWjTBZYTd+N/gIUS8+s0nz9iIUsYwAHn/CaRmFAbjRleQ35 /1UzifeFy4EUPYZpLMtwPqXzRLZ7eMutZ5oqlxK+bwnIk8nBnh4wU92/XiNIZLfNWULEzad3xH4
 Il6UAUV9jK0Ht1dFKcB1CEdO6i2MkaxoKoqrPERPVU8ds2i5FgP4wT+rBFFJjtTrifj6hIhM
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=6865569e cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=990z6vYgR0eT16Yj80UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ylShm_mJuJaQLZUdbAWAiGA6q42u2mQq
X-Proofpoint-ORIG-GUID: ylShm_mJuJaQLZUdbAWAiGA6q42u2mQq

On Tue, Jul 01, 2025 at 10:04:28AM -0700, Suren Baghdasaryan wrote:
> On Mon, Jun 30, 2025 at 3:16 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > This feels like you're trying to put mm functionality outside of mm?
>
> To second that, two things stick out for me here:
> 1. uffd_copy and uffd_get_folio seem to be at different abstraction
> levels. uffd_copy is almost the entire copy operation for VM_SHARED
> VMAs while uffd_get_folio is a small part of the continue operation.
> 2. shmem_mfill_atomic_pte which becomes uffd_copy for shmem in the
> last patch is quite a complex function which itself calls some IMO
> pretty internal functions like mfill_atomic_install_pte(). Expecting
> modules to implement such functionality seems like a stretch to me but
> maybe this is for some specialized modules which are written by mm
> experts only?

To echo what Liam said - I don't think we can truly rely on expertise here
(we make enough mistakes in core mm for that to be a dubious proposition
even tere :) and even if experts were involved, having core mm
functionality outside of core mm carries significant risk - we are
constantly changing things, including assumptions around sensitive topics
such as locking (think VMA locking) - having code elsewhere significantly
increases the risk of missing things.

I am also absolutely, to be frank, not going to accept us EXPORT()'ing
anything core.

Page table manipulation really must rely in core mm and arch code only, it
is easily some of the most subtle, confusing and dangerous code in mm (I
have spent subtantial hours banging my head against it recently), and again
- subject to constant change.

But to come back to Liam's comments and to reiterate what I was referring
to earlier, even permitting drivers to have access to VMAs is _highly_
problematic and has resulted in very real bugs and subtle issues that took
many hours, much stress + gnashing of teeth to adress.

The very thing of:

xxx
<hand off sensitive mutable state X, Y, Z to driver>
yyy

Means that between xxx and yyy we can make literally no assumptions about
what just happened to all handed off state. A single instance of this has
caused mayhem, if we did this in such a way as to affect the _many_ uffd
hooks we could have a realy serious problem.

So - what seems really positive about this series is the _generalisation_
and _abstraction_ of uffd functionality.

That is something I appreciate and I think uffd sorely needs, in fact if we
could find a way to not need to do:

if (some_uffd_predicate())
	some_uffd_specific_fn();

That'd be incredible.

So I think the answer here is to do something like this, and to keep all
the mm-specific code in core mm.

Thanks, Lorenzo

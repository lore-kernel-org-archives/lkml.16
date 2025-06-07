Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97578139D0A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 07:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749281099; cv=fail; b=MgXkrHmNchdy6FWo+FQN8L4DFLVgU03IQmN5LYVZiNfA7+de9lEO11A83W9CJbx2kZJgfxR31DSWXtGyKfqiUX4tbDbVGDP5rVB9w1bWijdF1VXVc+a7bePGIxiPg4F+7FOHhQJhzi9IfleMLavvD0D0zJ2O0qT4RJUSjlX+t8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749281099; c=relaxed/simple;
	bh=ZjVo65Sqtelzzl6eukA664kdfxlDxHsULVSU4kkpHfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Iz0FBx8k6KvLOPKqCs6zzPwKg31p+/PSTMgceAIbtO8mX1K5L3LS9HpDWkSfE1mfhe/W375HqL233JqQUsb6FXkYW9j8+cIcbVzzx9BrBERoZJvVPxiWtGhPDOr0h83hwYsIFw8/y0W44J7bHMYTgjlKaHwaIKys/rHKSvmxDco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OS1L4tZ3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wpAnWdiO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OS1L4tZ3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wpAnWdiO"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5576vad2030637;
	Sat, 7 Jun 2025 07:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dAfWuXWw5v1qbHE4Ai2pgCBTY9aAFJd89g3pi7toquE=; b=
	OS1L4tZ3i9o8N17cN/0UgoAao/ECRmSGxKvs1QhRqww2Fic7veDyhvI7+aFKjrjo
	PVfu/EDTgbn0UGC36Qar2jBBh0zhcTBLknEhXStzyQeKaoUt1dPzP70Nu6zK+nMT
	MGF5hwMLuG1hz2/m/Q+geA8SBta/UOA64nhD5aLgv196rwEjq33cq3AICmscjA7J
	+YxseW6BN9HxeVIFuNA5iXPNvQA9Zv/PLGFhryYLzXulAskMAtIGYb2W+kTzmieR
	kdm3UObY0wvw6gLOqVZjuIrE4rASbo8KOSoDE1og6Lgj+tRCeEOIWfhkspAULIcM
	w3kLPtUYiCHHYzf1T8RVAA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad034a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 07:24:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5576iP0U031941;
	Sat, 7 Jun 2025 07:24:22 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5w26w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 07:24:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5BvBugNFNHtrcQX23P9jUQ5PttM5EjLYkzB1YUN+359YDGxrrqXZAKfPSz/lTFAqUZk/5CIpvrrJl6MWXYxmSLbL2GmWeNgp9IuU36NEXYefyBSAycjBURZlzaRdbVeBSSDol0EQkH+3Vs8pMb66puOf82AJcJlqf1nwT7IspmiHIoT+9nOVWHXEN2tOBHagAB7zT7woRSzf+XJwy8TZEBa6v7Mtn8LT2qemfBq1LVQ5sdyr5/WDKC9nepjvcPrkWKFOj2J2t6I721G466nDWnSsSKovRzsk/lOWSrHYVwTNh/z2WYgltcIi87NFnwXjs1swxax17F0/sBpkKAEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAfWuXWw5v1qbHE4Ai2pgCBTY9aAFJd89g3pi7toquE=;
 b=HOlHDuWfJKdXHDYej1Bc5SfzyJzsFLUybJzC06oh8Ib2P/9UbeqIc2/XAis7gemMASFw7pQ/XvheOiTLIj5ZNlcQG/Zp3a8yrO9Io8Q5ca3Ip34NLL3uYs4q/DZRNkdfjV3rnlHzw1XkDVHpUvvSM8kqeX3JR11cLatx+5uOdHGZn355xEyPfKBZYdWMnc16QqvzLxJp2j2JUarcqixFKT5j0Gx8DOojH4P6hPBRnWQkJ8m26dzNOxKpjUrU2avI92OZr+EoV+zro+z6ysiSdJZEJNux6xmrBmt92pTBuLtAkbBFMYCYIcUDmc9ZWSFK2BJQ9Suwf3EnkzdDxlefdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAfWuXWw5v1qbHE4Ai2pgCBTY9aAFJd89g3pi7toquE=;
 b=wpAnWdiOV0isI07l+NphhZEhYIQB9jCVgz7DU/5HlzHGvmo0NWEUuCEqHe0MPPZFeUi1bKwOh2B57tuR76bgj3V0ZDgs4YcZ9dt0uGzbCScUnfzwOWRt8fHFanszeuFykeKAjo/e5z2WnkitQs3ttJgObm9PjCES1o3ZJEywJpA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB6654.namprd10.prod.outlook.com (2603:10b6:303:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Sat, 7 Jun
 2025 07:24:18 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 07:24:18 +0000
Date: Sat, 7 Jun 2025 08:24:16 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <b0a9f57a-9f15-4907-b2f2-24720095e5da@lucifer.local>
References: <20250607004623.8896-1-21cnbao@gmail.com>
 <aEO6asiCu9oG1z8o@casper.infradead.org>
 <CAGsJ_4x1RbQ+GKKc1rrTaNA8Xd+W8K-Zu6-kwVYNKzB0OWiowQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4x1RbQ+GKKc1rrTaNA8Xd+W8K-Zu6-kwVYNKzB0OWiowQ@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0353.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::29) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f27c81d-bc67-4d9a-1fc6-08dda59450bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVhuTVNWWmlSUnpzSldUallnQkpERE03R2U2Nk1XaGJBZVM1WTQ0cEQwVk1L?=
 =?utf-8?B?VmZ5dGZGa0tHQnNqckIzYUptazlHR2hqSVdhUGx2Ym1RZ0Q2cVFucHU4WGdx?=
 =?utf-8?B?Z3FRTkowNHZkYVZ0NW1qa2ZzanhSOURVZFc2Q3AxM2xkZkVlbytiTkNaUWc5?=
 =?utf-8?B?elBweUxER0RWUFFjeTlNTFhJOE96Ui9vMlNMSWdTU2l0K0tQWitRdHZYY0Qr?=
 =?utf-8?B?YUF0OWhNbEJDc3UyKzlVcUdPNmFpRitpanFCT0IrZjVXSmZ1bzFsTFV0alM1?=
 =?utf-8?B?MlhPQlVYWTE3dEVSU1VzeFdyK2FCNlU4THJoVlNteHczSXJiTW9wZ1VpVUZY?=
 =?utf-8?B?UkU4QUNGNE5BVTRuZUdVR0oxa3hlWUE3aXUvamg1bHJMekJnWS9MMTNUb1Bj?=
 =?utf-8?B?dFk5aHJLQXpOTEx3dVFHVzdEV2JrNXA4Qjc1VGlpYzJPKzZqMFp2L09UQVBX?=
 =?utf-8?B?Q1hsbk0wS1loQk9maDVoTitYd29qVTVFUjdXbDVudU1HOUl4UkFFQzNsSmNX?=
 =?utf-8?B?akVranVkRnNrc21aeEZ6M1lteS83YjlFWm1jTnRrOXpNb0ltUVNXRitNU2FD?=
 =?utf-8?B?cklEY1BMNFdYSzhmT2QxZjdUMWhaUXNESEZDZFBsQ3V2MDkvS2xvTEs4ZkxN?=
 =?utf-8?B?VUhlQVZCSkdyV1gxWENpeno5VmxrNVBxdW05MnRNS1JqTEVDcGxrdmN4MEJL?=
 =?utf-8?B?SmJBWVBuYWxqZUdzVFhXcmtxenlaQ3UrcGVFQzdHbmJabmtOTTBZcW1WeGg1?=
 =?utf-8?B?K3F2OVVjQVBWTHp3WER0SDNZM0hoNWI3bTBhb2VlTytJeWVmUmxVTWVDRmRs?=
 =?utf-8?B?YjJOeUtTMHRva0ZrclVTV2c4QWJBMy9XTHVUd0JKcDFSWkZzNzlPNGdvOTIv?=
 =?utf-8?B?Rno0N2pFNXpJZDlYLzkxNHMraGR2REZYTStBNDZLUlNUdE1OOE5ZbE4zSndT?=
 =?utf-8?B?VVBsblpwZDBHKzE2OGh3aGJjUys0d2pWYmEwQkp6MUlpQ0dxVUZhekhPSnhN?=
 =?utf-8?B?TEtVRDVqM0dkbWlCMUd1MUZKdzJCZDZ1NlR0K3BQYXFKc2FoelVpUFU1Zmdr?=
 =?utf-8?B?U2xSYUxIckY3c3dmeFJnS1VxalJSbTh1Tjg2bzJjcTE4NTNEWTRTTGkrV3Ri?=
 =?utf-8?B?YkM3RERWdjVnTE4vVklNWUk0UW55eld1d0NuOHlaTXFROGdVaEk3d096WkZt?=
 =?utf-8?B?ZElZZ0luU0FiY0dWSlp0amVPK3Q2L1pjbDdCKzBDMVN1eWg2UE14OENJdVR5?=
 =?utf-8?B?Sy9CY3p0dEZQRDhjUjRtZENGK24yV3lLUmU3NjNXR0VBMmxGSDU0Yzcrc05N?=
 =?utf-8?B?Qm1PdkNTdXlhTENwWGJMaGN5c2J5bnRRN25RcFptYjBxWTJtb3hHc21RQjlE?=
 =?utf-8?B?NDBPcHhvaUg5c1ZOUktxUy84MWtWZ211c0lnOWhIZm9MRTFEWmI2dkR6T3ky?=
 =?utf-8?B?Q2tRcVJIekZpNzNoVXFwWnNSWVNZc1Byc0tpaTZRRmVqbzRJTU1VOFh4cTkx?=
 =?utf-8?B?RW95OVlQd3p5bC9aei9CbVBIS0dZcVNkL2hLQWhFc0c0UVZCS09RaGlYbHlD?=
 =?utf-8?B?Mld3cmN0eFhSREJvWU1ud1VZbGx6QnF5MkpDU2RxYTB6a0hRNWN4SE1ob21t?=
 =?utf-8?B?Y2VrdzhlaVFlK2gzdEZHZGVOL2sxTmxkTmNLL2I1YkdPeFJNamMrRlI3Tklk?=
 =?utf-8?B?aWg4azNPZDlJYnhhRDhRSjJuYUJEYTQ1LzVWd1JSQWIzVDcyQUhET0RUZ2dF?=
 =?utf-8?B?UXd0R1I5aHNKU0VucTl0RDR5TTdOeExZQ1FzRzl3ZmVDTWxSVlozT1drRnZZ?=
 =?utf-8?B?Vjc2d1NBaWsyTUVOZkdJK204WGdSV1ozVnlKdnlOUWFxMzgzdHVVTGZJV0Za?=
 =?utf-8?B?MHBCSnZhNGR5V0doS2l1bzBOaDIxNmNpaDZsNFg5WG9DNVBqR0k5VGxuSXZs?=
 =?utf-8?Q?ShMJsD1HUI8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVlWQStpNVlRREJiMVlNVmdVUVBMcXhOWW9wZkRZckJFaTM1bFNLQ2g1YTNq?=
 =?utf-8?B?K0ZPUEFCblVYbW5lbm1UaGNZRmhQUVovVmlwZjR1RjBzTE5HNTBqaFp1VHVY?=
 =?utf-8?B?bVJ1d1RCQUgzdUQwUUJoZnhiRlIrUzZKdjhPMEUrcnpDOTlBdGZCelNvK0lp?=
 =?utf-8?B?RTMwbDdncU9kUS9WSFJMWmtEczRTVVRmNStBYk5COFQxbU84alF1Ny9VQzBK?=
 =?utf-8?B?WW52VkdyS2tqeldlNlRJQ1lORHh4dFp2RHVIOVg2K2g0RHVjMTlUaCtVcDJU?=
 =?utf-8?B?VVU5Yjg2WHNnNWhsOFFBOHp4OE5EL3hLbStBUjluSGMrNE5pQ2E0Z3pMbmd3?=
 =?utf-8?B?YUhFOVdnV1RsdEFDcVhMaTQ3YzJUeHZKcFBsU2RsY25lZzJpaFlXT2RKK1Nh?=
 =?utf-8?B?aXU3NEs5U1JDQjdPVzJDc0hKOUhPZzN0TFViWXYwOTFETlkraGFFZVg5ellJ?=
 =?utf-8?B?Z2VsODROYkVNUEFKZHVqT0hWMk9JS2wzZzF3ZHNuWUliQUdZaHRzTnNIemkx?=
 =?utf-8?B?YTR3aTBubjRaSi9aS2JPN0tPSU1icWYxRHdXWk4zR09INnprV1ZrWXBNeVBR?=
 =?utf-8?B?MmFQSldEdVJZTFNXeEROT09JY3NPRGhwS3hUSjZEK2JGSmZPNFdFMHc3SkxF?=
 =?utf-8?B?TjFJK3FmaDloMGtDTk41N2E1alRsNjVEK3Zjd2oyblA2NGZ5U0NvdGRhNDk5?=
 =?utf-8?B?S0tBYUlyM0dYMkx4a1ZrK2J4aGJpY05KRnE0SWgwZDY0OURXUzdQN1pWbHdH?=
 =?utf-8?B?dlg0Qnp0MmU2TUZJOHF2ZU1SSzlYRlMxSU5MRDRJTjFoNGE3MXVHK2dWR1pl?=
 =?utf-8?B?M1BPSGI2VStFTUVpLzJQNGZjSFBOVW1rT051eFdoekZTb2dCUWhMdmJ3UVR0?=
 =?utf-8?B?NS8zT3lmN2FKd1dYeEZydnJmOTVvL3J4dGkydEpBeFh1V0hMREhuTThUYWty?=
 =?utf-8?B?c2tSSStiN0lManFQWklKNnZZNFZWNkJUVmlVTXBsaFFqbmc4VlZvYUcwUzNI?=
 =?utf-8?B?UEdwZ1MxYUIxdHh4ZG5pbE0yWCtMTHRUSDF5bXM1YkhnMzBGS1BLVVFOMFNy?=
 =?utf-8?B?d2RkbkNVajRReVlYekNxcnYzMXJLMWxLTGoyQnBseXFXM1BCZjVvcUcxUGZs?=
 =?utf-8?B?YUlLenhYZkZyTFpPelRwR1VqbjY1c3JYRUEwQVM4dS95cG5XRHRaQzRlRXJR?=
 =?utf-8?B?aFVyVlBuZXBpb2NCMmJNYzNUenhzcEhkbDBMTUJBeWJ1aUtmNUNHbjlmbFJm?=
 =?utf-8?B?eEE5S0ppYUZCeDM4aml1a1N2cUg3VCtBdDhLdEtuaHFvRHZPVHNWYUhxRHVZ?=
 =?utf-8?B?bUFBSEtCaXlRNnVZY2pZVlJvMVlyN0RIcG9TR09ZbWo3d3NQUFRKZmloLzZR?=
 =?utf-8?B?UEp1ajE2WmFvMXlySjR5RWZ6RHNUNEdsZ3NXSkhEVDUyWHFjOXMzZ081N3BO?=
 =?utf-8?B?WGFlaFJ1czhQWHBzZmFBNktLc2NzR2FMTGNmNjRuR2U5UG94aXZJbTlzSjdm?=
 =?utf-8?B?RG9Gc3czbTd1bFhDK1R5d0k0RXE5VnVPa3pLYnFIRkJrRHNwdGQxNVp0alFt?=
 =?utf-8?B?VTU1QnVMWWh3OWE1V0l3WnlEd1ZmR2QwYW1xSGNiS2ZoaklKWUd3Z1Yxb1U4?=
 =?utf-8?B?QzZHd1pQZ2c2c0Y3VlVybllpaHFOdENXbjhoa1owZUhrNW1yWWZIS3JTMGJ3?=
 =?utf-8?B?OGU1UHFzQmZ0T09ZNDFCSjRQZ1FDRDVxREFlbmxSWTd3WXYydEVyVVY0b2Fr?=
 =?utf-8?B?RngzQ3VKS25kS2VwUGpFZVczZFVleGllU1hkaE0rTmFDbStsYTB5ZUo2eXBO?=
 =?utf-8?B?Rm5yM2JTMTh2NFlJdHhRN1dhZ1NsN1lsUnZDSGwxbVhZS1JRQklISW9MQ0Vu?=
 =?utf-8?B?M0t4ZW43dDdmM1d6SjIzVFhTS2ZyOXBvbG5ta0FPcmRqQXRZOEdsa3R1c3JL?=
 =?utf-8?B?aUhrQitKZ1piS0RKRWltSWZ2aXQ3MG1Qay9MZVM0STBnNXZFaFZUaWNodDRW?=
 =?utf-8?B?N3JGbVM2cSt6WjFkanJiQUdzTmUzWjZndStWeUw1M0ZIU1hlTDFORXIwdXdx?=
 =?utf-8?B?R1VqNUZuakpJWENuc01JSVEwTTlMaGptcGtwdHBoUnpwSUo3VndKUmI5MVN2?=
 =?utf-8?B?RmxOVlNSMWdUaFIwUGJOV0tmMUVZZW5GMko2aHFQTWxYL1BwTmZiQ1hGVUtm?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PKca237e+iTkficobCZYrGeWSthQrlosGtt4KruoPq/8C3xHPD0eDvBXPUD+8bAwXOtSviVoV5ddn7FETujws/pXCZ0Pnn7hVAKaew1JLxsYml4TgkdBe4m+kzsXiu/pa8fTwk6qSgd3lspSwC2ufOACV/Xv/eXGiJlk4ZTtLffto7QMdKzlhb2u9uiybjKlpOi018Sal/gmWxmWsyPZ84d7WfGrmg1UGpu21cHtYahgeRWPMiKfcrFhbY6/zYadvgp4JOyCasfKgDIE3sfJiiQci2DS2DPuG7QrA6nugVc6wbpV1z49GenThsyDwOApP5qZ87xnSeN6pRXn0zIJxIOBNEgCI4jbpYxvzCfxsH02SFDiLgCrRYvUMM82YRWzHZMYVl/y8MQA69Ys5bf5I6TWA2h1rdzg/6rBJ+Pak/xd8aNLnQlg0+FLJp3pVEoBIBzDzglmrzGDFXQ6BAAW3Gt2P6zBVqah2r9FqMMzN/E8TrWlsSSItNTtbRXgqWakAJodzkMYpr/MS3J44OY8a0G25lYVtdAOwVlEULkc5oGZRR17Diw0ly/Ckf3/FiW3hFtyB0xGP9176+8B7AYLgs5kFUSh2VAUwKP/RTMYLL8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f27c81d-bc67-4d9a-1fc6-08dda59450bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 07:24:18.5934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fiQY2eBW8WmntEoqR77XtMTRAxp/IxgxM+rzn7OQDgR95yS//RZpiCkYiqzWhRl4CK+hD4Ul2UdkPQBFt46zc6bidXnLqLgcilM1BEgMEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6654
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070053
X-Proofpoint-ORIG-GUID: oIi-a9H6t9N1EkXHvygZKQCecbOHnmPF
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6843e926 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=cdPq_JiJUpSkSVrBLboA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA1MiBTYWx0ZWRfX0Di2+tB4va45 M5a2GdH+ZKGJgQ3EmbZ+7lWG4r2Mv+wOS/LmRiySar681NUp+4n/kXC5l3gGIVIWZBzxU3qi53S TUZam409q4Q6W+wmJJAdkYwiIANeNSKf9UtxaHRMLDsdVTDkqf+ODTr3DWbgmrMUlF1Dads5Li/
 hMcQyBMEyKsHxt6sJgSEe/d/ebphb7YKG/REWYUXv5WXCyYas4rL+TFDqBt8Uoxk/qqaI1bD7/n GT/BnVv6imc7aSeBnjbk62OwfpzjaLsXvd8o10TTGpSS/0HuWsB/JOtNnuRvt1nycLV6db7csRe ZfKYjgYdyJm4rKjPJ5hsRKDON/o0UVkZo0saTuiTjeKn92zPscjcsXF8NUWw5Gn00QkdQIZLCKb
 bDUKckB2DynyRLwCeoO0xAasQkq1bx7TIecPhRKEFr1XOT/R/djFunfMvlgYSLXBNe47oyUq
X-Proofpoint-GUID: oIi-a9H6t9N1EkXHvygZKQCecbOHnmPF

On Sat, Jun 07, 2025 at 04:53:02PM +1200, Barry Song wrote:
> On Sat, Jun 7, 2025 at 4:05 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Sat, Jun 07, 2025 at 12:46:23PM +1200, Barry Song wrote:
> > > To simplify handling, the implementation falls back to the standard
> > > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> > > userfaultfd_remove().
> >
> > This feels too complex to me.  Why do we defer grabbing the vma lock
> > so late, instead of grabbing it at the start like the fault handler does?
>
> Hi Matthew,
>
> It looks like you missed the spot where your comment should have gone:
> https://lore.kernel.org/all/0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local/
> So I believe Lorenzo is the best person to respond to your concern.
>
> In both v1 and v2 [1][2], we did try to fall back as early as possible:
>
> [1] https://lore.kernel.org/linux-mm/20250527044145.13153-1-21cnbao@gmail.com/
> [2] https://lore.kernel.org/all/20250530104439.64841-1-21cnbao@gmail.com/
>
> But that approach had its own problems:
> * It's not extensible to other madvise operations.
> * It's not easy to adapt to vector_madvise.
>
> I also initially found the new approach too complex and tried a few
> alternatives, but each had its own problems. In the end, Lorenzo's
> solution still seems to be the cleanest among them.
>
> I even forgot to move the code below back to visit() from
> madvise_vma_behavior(). I had changed it while exploring an
> alternative and should have reverted it.
>
> +       if (madv_behavior && madv_behavior->lock_mode ==
> MADVISE_VMA_READ_LOCK) {
> +               vma = try_vma_read_lock(mm, madv_behavior, start, end);
> +               if (vma) {
> +                       error = madvise_vma_behavior(vma, &prev, start, end,
> +                               madv_behavior);  /* better to be visit() */
> +                       vma_end_read(vma);
> +                       return error;
> +               }
> +       }

Ah damn missed that :) and I just tagged haha, yeah that should be visit().

I hate this pattern, maybe will refactor in future... entirely for this rather
hacked in anon_vma_name implementation :(

>
> Thanks
> Barry

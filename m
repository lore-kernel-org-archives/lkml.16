Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB18143895
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749059467; cv=fail; b=FM5aVnC6o+uReOzDqwCSPwbsFfC3uBhzvv0ymTL02BuQ5+g3MAJ35VWLM9BlGL9a41jlmg0x/Ug0OnwBWTzu6Jvdwr1K4HondcOVba+5jeMbYrkmRfHodghrr8LbgUGX5zZAn3LwWpu9POf3tTu8Yt6EarShUR50MQghbBq8t3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749059467; c=relaxed/simple;
	bh=GAQWIThB/++G8OLyKKNwdPCWVlaEUVSHtoJAGPjzPiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Oce0az0edNhHKN/6mea9lOH0BejMZjEX5BwFoCa5OEuUgbWp7/FZ2bJm5Wt4tVRGJxeO4NhM6V/1OYnT+hupel+txMeQUxPGE5cZE1QEZml7vrZ9J+WjCh/S8CAYk4W/4EzZIu+VpZ/+YnMQXk0wL2HgEg5SkCZSDktwz/bep+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c4ReQfWx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MhE2DIhP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c4ReQfWx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MhE2DIhP"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554FdvP3022899;
	Wed, 4 Jun 2025 17:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Bzjsi9PxKFdWbtVtKhmeFIVAIy3DRqezndhJHdBlNF8=; b=
	c4ReQfWxZW1lX0iCTspHHyv9C8gs0uIkEf81iiKchQsset8ER7rg+xHaFh5ZFyZ7
	rUGHvTd3+CgK4iQ+k9dLuBcoaDqTPFt2oFYpl93A+ZwvnVCoU//wWf0nMALyVzzy
	B9aZmd/L0Ohu1fHOrsZkUhFD7E3Lj5BlM8Q/Fwzi5sm3zFJC4Qvp7bsAExRsmfW3
	OJ6garIRVetON6m2/VgT69ixTYNj4uGJQxQ2QO89uYdbCSzMihYoWIuDzFk6wR7g
	ZFDdmUuW2YjgQJdR0NRrxz9SOqGMcmkhpRjBK6QxjVrq4tRfbxxhg7iF5jJE/9jk
	KWH3Wn+UteFs7NhD4ia48w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8kcjq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 17:50:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554HksKg034603;
	Wed, 4 Jun 2025 17:50:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7b2xg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 17:50:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYlvJCGR1HcxiuR2FZN4B6o/wpo+zZsEd6RKEUM7dU0jcys/3IrCtSvUCBE4zrigVIalCV9AeVzXPFcR1zV4f3d9iXmn0zwlyGKWudApnqHk5heFE3VLgXvicOuPowIjPi/SK3JO5LLTKSBBkza/m2IaM0POoYaL/AQf8IgD8QUFylw/PJ/MwgKxq/7vku4HHB0yjcCM7/Jnn+9hde2esBn01QoXOUUznvuPEL+qbc8i5A1UYAdaS68Lh/mZZ3XdKQIo9nwLjVdS4BX5d/doJtd6FxhWHtOB52Aj8sxNBnQ/1pCx5LsSbZXPxwjutc5Lsj9xYozFIU7KILnJ0SahhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bzjsi9PxKFdWbtVtKhmeFIVAIy3DRqezndhJHdBlNF8=;
 b=XrBO4K/2azmrgTm6WOb+DNsgBHO557Et11ISkohBW1AkgI5kkiz9lZ5wmVF598yhy/Lo3UnKOfWWZ6kivyFj8//Ci7AoljyS4sZ7vA5VgH/GHAzjl86iX+eypMK9cFL1sStf0GZfqBteIGfA/435RQbAc3l73+24PfsDsAFHi+cQeOeJrPjgpsMqNRbGwtHv0ZeSTyvbERHzvCkQMm18k8JYQ8xN0D8meNYwu7yInufF9Upig2qjBueR1nUhvyq55Nm3In67t4gqjoSFHtU5j3A6OTrg6VaZ8NnR8txxW4InfLPwxIQR1K3bAeqZFKT9uZemVpZuhVzvoGaemU5KjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bzjsi9PxKFdWbtVtKhmeFIVAIy3DRqezndhJHdBlNF8=;
 b=MhE2DIhPrZWerN/kCtw2FvSG5IlUJE6q6wTnG5dMQvkMrH5vUYaWSozsmE4v3XTeqq0HQZGKLLaw6vGZhi5HX2DI3TRg/4GZqTWhUVcX5y1d66DIJvPkI4/QV6hQRGhcBCVk5fWHZJ+6FfdA37jVfIyqSYJNuVB5IGKNAgWmNKE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7272.namprd10.prod.outlook.com (2603:10b6:8:f7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Wed, 4 Jun 2025 17:50:36 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 17:50:36 +0000
Date: Wed, 4 Jun 2025 18:50:33 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Jann Horn <jannh@google.com>, Barry Song <21cnbao@gmail.com>,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
 <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
 <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
X-ClientProxiedBy: LO4P123CA0444.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 253c2184-5f20-4034-97aa-08dda3904f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTQvemNEVUF3SHBMcXl0NXE1NHNSQ3A1YklDWWswWXFMNG4rdG5RZlRPcVk0?=
 =?utf-8?B?dHlzRGpONmhlUUNDMlZBRFpsNFZhcGgzMXdvbzlOUE9UN25OK00wOVZCbUx1?=
 =?utf-8?B?SEMzK0VLMVd3RGdDS0ZWbGxxL2J6MHQvb1BYN3JTY2VYcmplTUUzZDVEb1A4?=
 =?utf-8?B?YXpiY2hZcjM3SVJqMFAyMkZEOXZnODNtR3hCNXV4VmlDMUpKNEJZa21KTEtB?=
 =?utf-8?B?azBMaGxJMHRvWjZzTFNUWFh0Y0Q4Tk0vOWMvcEhUSUhlMWNnOGdBUUJRL1ZV?=
 =?utf-8?B?bU1kdEJFeEFReGd0MjA4UUlpRXJxYm5ZTDRDTWpydjN4L0ptbXR5R2I5ZG1i?=
 =?utf-8?B?QTRhTFpsejdLcG1mUWcwd0Jxd0l0VHlGNDFpcGN5TDZKb1k4b0k3TTREWkVQ?=
 =?utf-8?B?L2ZwOG9LY0VJcUNFdjBBbzhHYzVYa1FnWjB0N1FjaHpxZkxzQmxpRFdmdlFT?=
 =?utf-8?B?WXhSaXVYZ2NEOCttTU56MUczNUQzTnhFWGdUWjNlT3RTcVZEbTBwck1PT3JF?=
 =?utf-8?B?TUhjbHkyVXRFczZ6cS9QNHdaRVdPbjdMOGxnUWo3NUtLbGJuaXptY2lQa04y?=
 =?utf-8?B?Wm1NYlZNYnF1YW1DVWt3U3h0M3A3bkpXbmlIT2s0SDRnS1RPS3ZuM1JBRGNS?=
 =?utf-8?B?NUVqVWJBM1dDemJJZG1telk1cDJPN3h6djNyMHY2L0RTNGNYL3g3elhQUFB6?=
 =?utf-8?B?NGJQRGZrMm9QQ0U1d0hyRkMxaHRzS1RVZGp6WTIrS0ZLc1I3bnExS2xDMDk5?=
 =?utf-8?B?ZzRScE5EWm03S2Z0UWMwU2dEY21EdTRnME8yL2pTa0g4WXVXSklUV05oVzRY?=
 =?utf-8?B?RzRmM2xLU1hwcUxvb0ZuNzB2VlJIeEFPUmlUd0VxSEFwcTNxUk1OcEVJazNy?=
 =?utf-8?B?WGlQVnQ0L2lZRFA0YjVhUWRIekVaemU2SmNKL0tsTmxHYUYrc2dOUFdUSTNE?=
 =?utf-8?B?MnUxM0RzTXFOVlh4Mms3aHAyL2ZsN2NyNVQ3Qk5xS2F0M1R0Zk9OQnJ1SVZJ?=
 =?utf-8?B?VDlYeEh4eHBMb2J5cFZNVmh1SVhEbzJ4YzZLQWUxOTRKclQ3VFJWcytaeHNL?=
 =?utf-8?B?Q3lUclhGZGRSVDdZaUpCUWo2ZktGM3NScHJZbUQwdVVYcFU5TURZRFluOVJM?=
 =?utf-8?B?eG1QQnNUNkFDRXk0M2hORndoMkhVV25WeUhId1RMQXRsUjEyM3VtMGNvTWxD?=
 =?utf-8?B?ZVJWQ3VRQlIzMGpJd3lHZEs4NDZRL0R6SWZUR01QTmZjY1ZhZzJtTm0vR0VO?=
 =?utf-8?B?alVjQU1RNjFXWGo3c0dsTWdOYjhLbk9EbC9nNEJzT1B6aXR4bC9zYWNRTEhL?=
 =?utf-8?B?RDRYZksvZ00zR2N2VGYwcjFiWUEyTVJJak1VRTk3VHdCYXE5TWpEVXpQYVNU?=
 =?utf-8?B?VWJSb3FaWDl4Ri9PZ0dROU1SR3g2VjFIaUN4Um8zV1I3NllibXhKeEowSGZK?=
 =?utf-8?B?ZkFRdTFraElON2NQWWw3VE1kZSt2TjlQaUdzSkpMVWJDOUNVRkwrc25IaEpX?=
 =?utf-8?B?TE1XTHZEVHhxNkRSUmFzY0p0N1J3VWwzM2dkcWZPMEhqcjJPV3pCWHVWbjQv?=
 =?utf-8?B?cVFGNnduWDZqek5qL204WGM3eDRKcTk3ZzRjVElZdFBTcWFSbDJ0N3BVd05y?=
 =?utf-8?B?a2xXVDRsUHdXNUEzNTg5ZjVaSGI5UXNYY2JvSHQ3MmdYY1VsVk04eUJqL2FR?=
 =?utf-8?B?LzgzUVdKRmlRRC9tdkVFemhYanhnSUsvV2hUcjR2OXhTajZqdXh2UVFocUlH?=
 =?utf-8?B?dHJteE1jYXVHeUJ5TlF3QzE4T2plcGdsY1ZIekZmNjFQaGh4UXhETG1uNjVW?=
 =?utf-8?B?UTB6UTVUWUlFR2l1RXA4a1VLY21PVTRXenkvZDhySWlQSFdrYTk3SlVkQjBT?=
 =?utf-8?B?U2ZlUU84SCtWZHlBSHNYM0tqalhUSStyeUV6NmNuSGhCcVBNY3ZNUFB0MXFD?=
 =?utf-8?Q?cI4IbSxjI+Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEo4T213NE5PNk9xUXV3TWJON1NrQkk5Y2tEcnd5WVY0VVgzWmVsTzF5NVI2?=
 =?utf-8?B?bWEwalFNTVkxNjFjdHA3MEtQSEdJc0kwT01zVHJtSm00ZjRwZVZncm4zTCtk?=
 =?utf-8?B?QWo4TnhTbVhDaG00a3ZIOUxmZkh5RUwvSFplV0RGNnVjNjk4aUV0YWxhQjNU?=
 =?utf-8?B?bThRc041dEpxbUFrVnBiZ1d6WEl3UDhGSksyc2k4dFB1b3BnSEplT0NCRlkx?=
 =?utf-8?B?cW1OcXlDdGpiTmNnOXRQck43QlRwRWtmNTE5MUR1RnRHM1VFbGtvcTRtbXdy?=
 =?utf-8?B?VjZ6M05BNVFqRGMwU2lWQ3VlSHV2TEdqWk52OStxSjJOWEdNR0dNMEtvMEFN?=
 =?utf-8?B?NmZXS1ZhRTlhd01FcTRjWGVCM1Vheno0L0pNb2srcmtNMzdkeTV5bSt6cFZ0?=
 =?utf-8?B?dW5JblJvN000WkNKMzJNYmhQOEgxai9wMDR6RksvNmJyKzdLV1pNUGNVdlk5?=
 =?utf-8?B?elNNRXpQT2RVT2ZpL2lFV0kya1BSTUllN3RwT3M3WFptZ1krMnRGMzJHYW1p?=
 =?utf-8?B?d3NFOWZpSHhlN1Qwcjl6T1hxZDdPL0FBeHVxOGZaY1I1T1Nnb2JhVzFPOGdW?=
 =?utf-8?B?cXdQbE9MNzN6U0I3UkJqNmFGS2dneVlzU3VCTFhVUm9FUTRkUG9XaFNoRm40?=
 =?utf-8?B?MVN2VXE5VmhUQWlQSzQ1YWYyM3pObUFqNjM3NSsxM0RtaXYwZUgrNHBHVmww?=
 =?utf-8?B?U1lsVjVkcjB4OGlWK1VrYjdDMWloQkU4eDU2bGNrQkZHVURaMEllbjFLMzdn?=
 =?utf-8?B?S3Z0cUZ3RWpsZTduZFpsQXltcWxrMnhMcml0M2ZGZVBVZ1NHbW9VRFI4dXEz?=
 =?utf-8?B?dk00TEw2UE9LTi9OU1hLb2VPN3M1ZHJpSG5QbDJHQlpabWdOY1d5aklqQlhT?=
 =?utf-8?B?RGJmd28wQkdHeGJoZ0YySEt4K1pGYmNMNmxzWmx0RERKTmJibmlCTUdsQXVh?=
 =?utf-8?B?d3lldk5ZZ0lvY01HbmFmdWwxVEp0bk8vQWZBTzBOeU83NXZsVHhIblBZelY5?=
 =?utf-8?B?VW5mYXNhSTQxSWgwbWtkSGNNNFZ2ci91YWRKbGJvVzBaYUVsNWpxMHpGaGx6?=
 =?utf-8?B?aGUydytNWGYrTjZORFlodXBVU0h4blBJTEl1Y1pOTG1KRktqTmRUZ2NPQzI3?=
 =?utf-8?B?NkhTNTQrcG5YQ0owK2RCbXZiejJoRFhzWmF5ZUd3RE9OVDFWN2NlTHpoKysr?=
 =?utf-8?B?by9Cdk14N01HYmM4c1lzOVVScDkrbEFOdWo2bE9ZSjNtSERzY0RzU1U3b1h2?=
 =?utf-8?B?eG0xYldkeFJnNkkxdnQ4VzB0WC9oMUwwT2RKcyt0eDQvQWM3dXRxd2xjS0sr?=
 =?utf-8?B?N1dibGxpMzRvNUhPcFk0cHY5bWtZTWNsaUlBVEU2SXVJVFUxOHNSNkxkWW1C?=
 =?utf-8?B?dkhyZEJWbEw1VnNSTzh6UEw2MCthMmRyd3pSTmZYNElLWUNhcDIxQXQycEdO?=
 =?utf-8?B?QXlacjVmNUVDUkQzTmFZLzE3bUdCVTRCM0xZUWhyaWlxanRGMnVMZmFJVzVV?=
 =?utf-8?B?Um4rMGtWQ0FnTGV2QmI1WUpiSTY4SWZ3ZzJSVU53LzRYSFZJS1I2UjIweUV2?=
 =?utf-8?B?Z2QxbDVlY3BIUVRMZWdKSmtyclJWQ2JFZ2VQcW1OOWVnanBPSzJzUitOU2Z3?=
 =?utf-8?B?eXh5S2lBWGVhMDE2SnVaRWRyalhoWmFsa2JvZkNSUm5sZDJTQ2lWMmhYWC9Q?=
 =?utf-8?B?dkN0c3FGM1BReUw4dmJwc0lVWjU4WkJJQ0V2K3h4djcwNFdnM1pxNm1zczMr?=
 =?utf-8?B?Y0ZMTW1PVFFYaVVIN1JHUTFqdjUzbklIeW5xMytiTVQ3WnVMRS9KUkprTkdi?=
 =?utf-8?B?a2Q4QjkyTlFsYUllVWRLaVVVdWM1eUlBbEEyV1NrbHh3dFk4a3BnbzlSNHlG?=
 =?utf-8?B?cHp1SEZsT0Z5ZGFlU0kwNHZkTVY5aDFqUmltdWZNc0ROamI2MFZwZXhxT0RJ?=
 =?utf-8?B?SEVzSmJ0bzFUY0ViZG1MSjRzYVg5WnhiL09UOHMwWlRrbC9mWTF4ZkIySytY?=
 =?utf-8?B?R3BDdjZIS1FvcFN0a1NVdTl5LzdUZ1BVUDVxYlVWTDJ0L0hSZXlTMDdvQmw4?=
 =?utf-8?B?aXNLL3ZWWFFpSzA4UzA2QTEvNEJiQlc5bm4xbDFaeDRwQ25mZTJEZzNDaFBO?=
 =?utf-8?B?UmVjZnZMWUNsanl1VXdjWGFlenA5TmVLbHIrcXFNQzRQa0ZDS0c2YjNlR1pr?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W8P+eiV+q8FJ2hl6u19pd09lRl4cORbsFq1BOIb4fScewT/FoB/NjMDSAbvgfZiCjj4A1pM6+sw8Lq0DHi0JMrYKRii/9VpoL9ce6pdvtExF39Ftc4TD24Hri/C5aDnlRrs3Ivne8bQKtVqWNymqXlmgAhymswpYKH9+FPYhMJLXKxLjpA3z/r37LpA2mCXt71yA5fFuWeyHP/NgnRbW0xaVwIPIcm0XXwiacjdCKVsc+1eyAMICRNB5Xj/igXNIV3MWeNhcSlOmi36Dh0b4h8w1Na+v0BNxBFtq7K5Fk8swbcwcrLeuQUeiHw180vDbyEAy5Zvn8R/UYudNHJ9pBIXS5yp86bdDIvt4iO3XSxRifsrWbe/QFfvyhhyru+ANvkqeYliwsQcD1dF1716YrKahpgTiSl7gbaN5pdxprOlMxI3Mycxkl/ikeJ2jLXRZcwsOSDHAVy954kj9Wwf5nFR9eMpCufai7k4u1LSuXBuryK6tM1NAnjFgb++qIP0l/UekzdigddJ6tqa4oATLcUGYASCA9dW8xl/Lr1+lDod29d0aq8inj1BYcvTsr3Xv0JmvtBJCyCn1RDY6IlwBEfTH9Q0Czlr4NOnIfHL9ZTE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 253c2184-5f20-4034-97aa-08dda3904f62
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 17:50:35.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHREU1li1jlXjrD2gQjkZY6np2aarcPaAzq9u9sMJnUQetThOAPuncS3o1vGCKufaztsaSsbYcQ7OmrKUcBKB9vCMZxV8+fd+D5A29PuwkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7272
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040139
X-Proofpoint-GUID: 6OH3XXOlDw5_Fn3VJJT6flwiIbvUHVUu
X-Proofpoint-ORIG-GUID: 6OH3XXOlDw5_Fn3VJJT6flwiIbvUHVUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEzOSBTYWx0ZWRfXzseU+lQ4jrMx ClXFZosYb+Ir+Y0AyQjlMEfoba2Aiobi/2aLiNBvmo29j5ubVT5gAAseslCTzrNaEKUAD+VDrFi FU3117f1LYSltv/yp1DYJqEUTQvOM2BjnyOlvGF5xP4nrj1PVDmw8CnrZAZ8Aoi9wjq8+VWoVj8
 3bXPQ+E2QtROXAW4A2x7LHEgCaQy8yloK5UU5CzyIhOJXz3CLKcqdgSG8ye11lTUyz8zPA9qQpT ghsFNW6LSlEYB5gfrPBkS5KClufdxVVTe7GgQEcZFeirrlsmKDxVT4CsXEm6M4+z6/BeskqPO77 8Nudg/hGcs7rSpqIlfReeEVZPaNtA40hqiCjj2CSuGLRcFvVP53jYqReU0NpsdHCSFgMTyfV+4h
 gx/IaMPtNFcfW9gJyHd6tyJKrXmyGaYZFH/mP22WymDqtiH7W4cQ2TGD08YdJrw6UrrwZCfv
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=68408772 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=T_WtutNzgoIxV9vJ4REA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207

On Wed, Jun 04, 2025 at 02:02:12PM +0800, Qi Zheng wrote:
> Hi Lorenzo,
>
> On 6/3/25 5:54 PM, Lorenzo Stoakes wrote:
> > On Tue, Jun 03, 2025 at 03:24:28PM +0800, Qi Zheng wrote:
> > > Hi Jann,
> > >
> > > On 5/30/25 10:06 PM, Jann Horn wrote:
> > > > On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
> > > > > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > > > > frequently than other madvise options, particularly in native and Java
> > > > > heaps for dynamic memory management.
> > > > >
> > > > > Currently, the mmap_lock is always held during these operations, even when
> > > > > unnecessary. This causes lock contention and can lead to severe priority
> > > > > inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> > > > > hold the lock and block higher-priority threads.
> > > > >
> > > > > This patch enables the use of per-VMA locks when the advised range lies
> > > > > entirely within a single VMA, avoiding the need for full VMA traversal. In
> > > > > practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
> > > > >
> > > > > Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> > > > > benefits from this per-VMA lock optimization. After extended runtime,
> > > > > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> > > > > only 1,231 fell back to mmap_lock.
> > > > >
> > > > > To simplify handling, the implementation falls back to the standard
> > > > > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> > > > > userfaultfd_remove().
> > > >
> > > > One important quirk of this is that it can, from what I can see, cause
> > > > freeing of page tables (through pt_reclaim) without holding the mmap
> > > > lock at all:
> > > >
> > > > do_madvise [behavior=MADV_DONTNEED]
> > > >     madvise_lock
> > > >       lock_vma_under_rcu
> > > >     madvise_do_behavior
> > > >       madvise_single_locked_vma
> > > >         madvise_vma_behavior
> > > >           madvise_dontneed_free
> > > >             madvise_dontneed_single_vma
> > > >               zap_page_range_single_batched [.reclaim_pt = true]
> > > >                 unmap_single_vma
> > > >                   unmap_page_range
> > > >                     zap_p4d_range
> > > >                       zap_pud_range
> > > >                         zap_pmd_range
> > > >                           zap_pte_range
> > > >                             try_get_and_clear_pmd
> > > >                             free_pte
> > > >
> > > > This clashes with the assumption in walk_page_range_novma() that
> > > > holding the mmap lock in write mode is sufficient to prevent
> > > > concurrent page table freeing, so it can probably lead to page table
> > > > UAF through the ptdump interface (see ptdump_walk_pgd()).
> > >
> > > Maybe not? The PTE page is freed via RCU in zap_pte_range(), so in the
> > > following case:
> > >
> > > cpu 0				cpu 1
> > >
> > > ptdump_walk_pgd
> > > --> walk_pte_range
> > >      --> pte_offset_map (hold RCU read lock)
> > > 				zap_pte_range
> > > 				--> free_pte (via RCU)
> > >          walk_pte_range_inner
> > >          --> ptdump_pte_entry (the PTE page is not freed at this time)
> > >
> > > IIUC, there is no UAF issue here?
> > >
> > > If I missed anything please let me know.

Seems to me that we don't need the VMA locks then unless I'm missing
something? :) Jann?

Would this RCU-lock-acquired-by-pte_offset_map also save us from the
munmap() downgraded read lock scenario also? Or is the problem there
intermediate page table teardown I guess?

> > >
> > > Thanks,
> > > Qi
> > >
> > >
> >
> > I forgot about that interesting placement of RCU lock acquisition :) I will
> > obviously let Jann come back to you on this, but I wonder if I need to
> > update the doc to reflect this actually.
>
> I saw that there is already a relevant description in process_addrs.rst:
>
>
> ```
> So accessing PTE-level page tables requires at least holding an RCU read
> lock;
>   but that only suffices for readers that can tolerate racing with
> concurrent
>   page table updates such that an empty PTE is observed (in a page table
> that
>   has actually already been detached and marked for RCU freeing) while
> another
>   new page table has been installed in the same location and filled with
>   entries. Writers normally need to take the PTE lock and revalidate that
> the
>   PMD entry still refers to the same PTE-level page table.
>   If the writer does not care whether it is the same PTE-level page table,
> it
>   can take the PMD lock and revalidate that the contents of pmd entry still
> meet
>   the requirements. In particular, this also happens in
> :c:func:`!retract_page_tables`
>   when handling :c:macro:`!MADV_COLLAPSE`.
> ```
>
> Thanks!
>
>

Thanks I think you're right!

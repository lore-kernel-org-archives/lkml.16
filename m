Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB4E15E96
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748893130; cv=fail; b=kIJ4QyUd8y+XPkFyfY2/ftZ1Kz0kqj9eRxbYiY+4VkpmbQ57rz81+gGmKDVbuBfJCR3Y7V3RU5O8HtP6CR8JuEZoLa1KAr7FhHDqwt2ll4rQoGLgwCP+jvfQjUQ9EwKBikYOhOA+xteANHHsDVqPS5FWlRAIg8j/RjRMBzmt+Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748893130; c=relaxed/simple;
	bh=1dPVl9Twp5C6oVayMYT6+h4VvLA15SNCR+WstuS4OiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QJhzgy7lHcWHHf8iFWhSHWiiBuBKloV2tYAG1VATOVeGHbeu59npKF0d7iLDMVyCQ/5rXPhJ6kO4+BrRd5Rg+J7vY6aVdY/BMoKjuF5VlwTDGO5qod/j5ZFqptbVFwCxmtNdqJgMJV+IlWXrfrfJjMiOK02EyguOOB/59wtZjoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=px3ONMqV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yIXfHLiI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="px3ONMqV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yIXfHLiI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJUva010444;
	Mon, 2 Jun 2025 19:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BPKvkD6JKr/pacyygi5y5iPeB/OAI56+fzvrxYdo8dQ=; b=
	px3ONMqVFbQ+d9GIrd2F/E7nKtI1+7zbU53NsvyBs+aID7akafTQgnkK2bFXCBBa
	Coqvy48oRoQq9NhqFG/aNsYjCBeLCqzdGzioHwxP3kQolJlnx4TPXXzWGkIlapM9
	C4wztFaOIUggnpqts6r4OIL1QGszRbCY6laFvy9f/uavNrtyBodAOBCV4WQV5thM
	bSPzSvMP1dyMSaUGYZtLs7SzyxEl9r12xpD7/MUpEiMpUATyk39oAJdCSyObjTPD
	xyQsW22jb6NpMGP8KLH+uvmOiwliT5pGmBjcADyIZOgE+7EBrrI/WJ9uUcIW3+S1
	Tg7zM9oMRBt+NM/9vZ5XYg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8k894k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 19:38:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 552Iu9CY040708;
	Mon, 2 Jun 2025 19:38:04 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr78nh5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 19:38:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lb0ahjJcJ8hQEfaHdJ09eRM8kcPSCsiF9XNhFuBRnlLnbflgHjU7ZkxkXZEfcvcDcbFvcsVPHqMUOy4OV6hLhiEo63wulXqJ42VYlh1nYDUj5nE8cHjzTVBuPzpkU0qvvjdzDhqD7tvfKMRsw/4UScqLU9kwPcLbp8pmVEaR0fqU0yDWWUKpMylKKLHqPwYz1XtV/Ro8qlmgE7InxycaAmFn83S6Scm6MMsayYyPVTfMReA/zDF+eG5ICDZHF8WH+6i9+JgobCRcI9fMnQkV3S7995PyJIg8fcWt3VT96RuKT+Z0XmGfOQ3BAF//xpSfTz1sc8XtRRrKxrFHf9smAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPKvkD6JKr/pacyygi5y5iPeB/OAI56+fzvrxYdo8dQ=;
 b=S/r/yCDuGItgmXCpZ7zFs9EQTCOrILHfMcnlkCdQz8t4/Iy5O2lZkDdIYQVT/i9viFDIpJgH1rLzqdKUEHJtKds0LuDqMsA0arbHJhPKet2MgdX9z1wdGT5Oe3bbDoO4h7Ece8TqjfJQhJiFfEVXURuQnAfQayLgk3Olm94NESNOG48dydJVEYVpSigtjyyjKjfn7NbxFkNLH4a9mPYifTAYcRbYucu0Feu9lrJGIRXu66494IVIZzGlf0E/Xn6ntmMaSRIqwxr6G3sdNr3r10PgLIHv6XMWSDvWIIlM67c9LVCH6KrR/qTNeMeaZfiIDZMCW3ceKwUfmNwon3Hbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPKvkD6JKr/pacyygi5y5iPeB/OAI56+fzvrxYdo8dQ=;
 b=yIXfHLiIxeMw3lJChIrdnyWioIHfxHqTYE6jPHLf9x+MC9izHen6biqWs/AJrFc4nMdQ4G0DnJFzECfagcsPBte6yRudSucW1oIzedavbI8mBsIhwtdWLST9BxAxAIIcwIkihTeRsW8KWxaSl3l7/mO6lkr1dxtbnn+06s8ZP60=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB7837.namprd10.prod.outlook.com (2603:10b6:510:304::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Mon, 2 Jun
 2025 19:38:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 19:38:01 +0000
Date: Mon, 2 Jun 2025 20:37:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, stable@kernel.org, Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH] mm/madvise: handle madvise_lock() failure during race
 unwinding
Message-ID: <50e32733-cb77-4cd8-9e60-82c38f9f4b08@lucifer.local>
References: <20250602174926.1074-1-sj@kernel.org>
 <CAG48ez0cysRfJ82UKH39Ns0gYOcmn7HR=UVRDo74w=uwm6pcTg@mail.gmail.com>
 <b3783c64-1f68-452d-ade2-1fc44cd8f080@lucifer.local>
 <CAG48ez2aqd3gYV-6fEjhNpQ05_16htPZX+aGZk-iVh07HpBbTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez2aqd3gYV-6fEjhNpQ05_16htPZX+aGZk-iVh07HpBbTQ@mail.gmail.com>
X-ClientProxiedBy: AU2P273CA0107.AREP273.PROD.OUTLOOK.COM
 (2603:1086:200:6d::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: df308728-f5dd-4296-b5d7-08dda20cfc05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZytuL2EvMHMzWDJPMG9UendETUU5TFlkdVg1SXNuY200ckxXazAybk95ZXJI?=
 =?utf-8?B?WEJzcXRLRkxnd3FrMERiMnhCZmU3R1JySlcvS3Vtc1lCcFFZeVFVVFFYM1o0?=
 =?utf-8?B?Vjk2TCswNTFXSzFQek5mWkQ0c0dNVnJKb0g4anU0Rk4zOUZqdWFKcTJUaVE4?=
 =?utf-8?B?OTJpdmVDTjFWSXg4bnVpTmxxc1hvKzY1YkVEdVZoU3g4VU4zQmdGOGozeGFs?=
 =?utf-8?B?TlJxQS9Zb0NLMmZpc1ZiWUx0bVliSHFCTU1lb20vZGJTWGUzazhxNkJXaGNM?=
 =?utf-8?B?bk9tRnQ0ZG80UHcrK1ROSlEvS1JqajRrZ2JTQitJYjFraEFjWjJNby9VQ25t?=
 =?utf-8?B?aXdIV1RKU3Y0eXcrSHBHYVZpb2JLQzBzTU14N3p3K0ozMk50OGZiQUtzYWdO?=
 =?utf-8?B?TnQ5QnJhZ2xQWno4WS83TUpTZTZ0RXdHV0xmNWpveFVBcnZkMnV0TFJrVWxt?=
 =?utf-8?B?QVRjemhHRlBUUGVmMlpPSzIzaEpQTkY5eUdGSnJFZjhWYkJZZ3E0a0dTYWg2?=
 =?utf-8?B?ZFFUaHZKOG42UW55VE9XbGRUV1pEc2JvQzFBU2pZVEFQLzdiQjV5Y0VSVTVK?=
 =?utf-8?B?UWJtQTB4dVBrL3J0ejNUbmZYOC93bFhjeFNwMHFyY3VLbXpia2ozVjVnRlBE?=
 =?utf-8?B?UkN5TkRWT1VKbzdsL0VLdWxhQWZKV25SbTI2enYwaFo5TVpjamI3ek1wSmdp?=
 =?utf-8?B?Y1RqM3pqSkU1SVBmY2wydE9qM3VxcnZLRnJWNHE0VldIN2RobUk5eS9xWVh6?=
 =?utf-8?B?elVtcEJELy9BTmJpdGtwbkVKVDkzR3lYclRGbmhHMTFZcWI2SEhhRUJ2UVMx?=
 =?utf-8?B?NEJIM0JRMHZFWnhHZDZmV3JxYkxNemJ2NnAyeTQvQ1UwcWtPcHZRY1VQd05G?=
 =?utf-8?B?WmoxTTU4ZFFrdFk5RmlqS2YwaXFPQ2EweTJ5eWE5Y2owekJKaG5YMTNONmFa?=
 =?utf-8?B?V2swQk1COHB6dVY2S3hJa3lQb3NERGRjTWZ5TS92MkpneENoQ3JvRCsvYUF0?=
 =?utf-8?B?TThzM2xrUGdFWkpwaFp1dmlYcS9BNlluV3JjUXBYdTZXS3F5NnJvUlc0cGcw?=
 =?utf-8?B?UnRqaFNkbXhoRnNoQmhncW1qUDFGRGg0NTZldWJTMDR0a2Rybk9JY3hXcXAw?=
 =?utf-8?B?akZjay9JWFVOeG16VVVNWmhJbWZBbTgwNGNUTk9FVm5MYUpvaTNzdzB5MW1u?=
 =?utf-8?B?MjBabVhwSTFrbjgxZC8yZ3V3dlFyTWdHbnp3YTgyb25vTjQrMlZ5S1ZneENG?=
 =?utf-8?B?Zm8xcit6bmc1TmdjcVJoOERzczJIRU5DYk8vTGYxYUcwVjdmaFdFZ2tnM28x?=
 =?utf-8?B?Qlp1cjRHM1lGaEp0V3dyb3pRL2t4c3NxaTR5L1Q2MUpFYzZWclp2dzJENThl?=
 =?utf-8?B?NHlzWCtxNXZ1RUxITjZwVHdoOHFOcVdBMGZUdVpidmJzSGdZanI0T1l3NUFr?=
 =?utf-8?B?eU9DcW5rOEw0eHJNTEJLU2QxOHNBNXVuU2hNQlhSREY4RVlJQzA3WUVLRURr?=
 =?utf-8?B?Q09DVUo3YlplcFpWVzVnWEdBZm4veHJHbElCOHFOKzhpQmJoeU5teis3RTE3?=
 =?utf-8?B?aEZEN0ZYc0xxUVFtaEloeFhyZTdTOG1aT0ZWNjFhMCszY0dMbk5vOGgyV0Nl?=
 =?utf-8?B?cy9obFJ0WjlIMTJsRU55SGJGYXJ4b3piMnY4dWtUSnFIV0Vlc1Zab0VvTEdV?=
 =?utf-8?B?a3IwalczMkcrTHNOdHNuTzlnQ3FEVVBMQndBZ01pWHpSdmIxYzI5WHRuc1Fm?=
 =?utf-8?B?WmJjb2NtMTZYd2hoYk9YSUhUUDNCMEZHcGUxOWdaZkQ0S3BYM2lrdUhjQzdy?=
 =?utf-8?B?TDlTdTNLclJjclFuS3A0dGQrMm1mRHAxMHEwQ0xwa3dZcmpTem8ydm1iNXk5?=
 =?utf-8?B?bzBSN1dDa28xRjFqbVlzbWp0eWdlTzY4TjhsUHN3eGZ1V2lKMXRpcExEQitk?=
 =?utf-8?Q?cWOgyuJzYww=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHE4blZSNSt5Yy9MSkNnL25nYkpTS2xlZzEralFBa1kwKzBPcXoxeG9ZN0RM?=
 =?utf-8?B?UnRmb1lIOFNmWEhQWTM1cTA1cURhMkZOZkZJVkpyQ3NESlZFV041TUpVWGVP?=
 =?utf-8?B?K1JDdnhaVEJGUmptVG9XT09zaElvVlAvaGJmamM5S0g2NmJPMkFvSFVuRmZx?=
 =?utf-8?B?eU83SkdwTnlVU0NYSVUxbzQ3WVU0UUx4Yk03eXBvNG1sR0FPVlcxMGVrSElo?=
 =?utf-8?B?RCtndGlwTlpBTVd6NU9VNytNT1poanNTZHJiKzN6eitUVjZwYmRHUmxYZmI0?=
 =?utf-8?B?MnIrZTVvQlZTRlVVdHNzdDhFb3NqdGhMTmxXc3FIdzRFRWlSanMxcVVPd01E?=
 =?utf-8?B?d0J0SkFmTFBrckZXOHhRWFBReHJJc0RBelVjempaRVJocE0xb3kzT0JpSU5T?=
 =?utf-8?B?SHQyUnk4ZEMwSENhWkVWYWVmRUl6VVJFbU80ME1WTkJuZ3dOR3FuRXkrQnFt?=
 =?utf-8?B?WWJnekJVZ3ZXcnpNb2c5NTJKTzBnRFhmUlVLYjc2ak9EekZScmR4QmhwRFpQ?=
 =?utf-8?B?M2dvNnYyNTZwdFUrcTdSTkJxbGhOWlBSazdFTlpFdEU5c2k3c3pxNWZNLzQ2?=
 =?utf-8?B?UDIvbTNrRHBtZkhDajNacW5OcXFPYlp5Zy9yUXc2Z050MUVRczNSWnhmYVNn?=
 =?utf-8?B?cytmbXkxZ0JtR21BaGxmOWN2THoyd09tQisyY3h6WVZZWFhIdVhuTjhFQzV6?=
 =?utf-8?B?YmpDM0lDbENtakEya1NLZGJMZW9abnIrL1VhcFRCSGFuakM5c3N3cWxDWE9Q?=
 =?utf-8?B?UXhpWGFqWU9xd1NtSm1FbStsOGQzVW1RNFI0N3VUbktxUk1peTNFY0I5NURS?=
 =?utf-8?B?SXpIeGhseUdzZ2ZJcFg4ZGRZUm12ZExTWEJXdFlvZlRxLzJCKzFVVzlRUVcz?=
 =?utf-8?B?OVo0T2dWNDhGZUxXeDQ2UkdqcmR6dEJiVktWMmxGcFY5UnBxRHhpTDR6OENr?=
 =?utf-8?B?WFBVc1VSRnFaZFpGUHhiZFBtYTR0SEFIdzFNTzV0U3hMb3NhN0NDRlFvcUZT?=
 =?utf-8?B?blBhM0JwZnVMYnhIeFMvY0VZU1Eza3dPS1J4bDB0MUhNOHJac2JEOFJhTUVG?=
 =?utf-8?B?SnF3VGpMeGU1UjZNVHR3eHpwOEtTU3NuSy82RHFWbGViNkFBaXdGT2ZxdjE0?=
 =?utf-8?B?WjlVSFRlanB6VGY2d2c5ZVVpTFd0cVZtUStpcmlYS1JHZnFkZ0JHbytXQnZp?=
 =?utf-8?B?cGlIQ09sUFZNOEJPNld0eHYvSC9yalgxNTkzNW56U3VEbGt3ME1ySkY4QUFG?=
 =?utf-8?B?ZjBIVmY0QkJVRTBYZ0wxUDdZb21LWDVab0dnbmhJaVU5WjgrdzZYZnhEUVNT?=
 =?utf-8?B?YXZXcVNHaEt4S1BvQVQ1TFArcGJNTmVneHozR0Jna0Z3cnpxNHEwZ3dXcnBK?=
 =?utf-8?B?K3dxRFN0QWpxV0JpNUJ3Y0JzODBxUVp6ZXFHSDBXTHlnTDByK3hyNUtmd09R?=
 =?utf-8?B?VERPbkk1ejc1Y3hpUVUra1NNOHE3NHFiNlQ1OGVVeXNwNzJJdFVuRUttdU9W?=
 =?utf-8?B?NFRYK09ua29CQVhRQkdkMFcxU2xrbWVUSDdpQ1JDT1ZQdlA5YzFjelRwTTYz?=
 =?utf-8?B?eDR4aWhYR2RLdnRHbmhnSWN4SzhEcTFidkwzbFhic2FwVGZ0R1kxWkFZTTNy?=
 =?utf-8?B?b0Q1YStsZjcrdW1mc3R2SFkwcWxqZUlMV0RFYWx3RUdXak5EZzlsaVlsaXAr?=
 =?utf-8?B?SFFZYS9CcFlPazk4R1RsR2Q1SGsreHRxeHJMZ1MxRWFPMWl3SnVkRE9JRncv?=
 =?utf-8?B?K1lBSHpudDF3R1I0azgrTFpJeDROZFRiWmdLQ1R5ck1VSDA2cnllK2JDWEhw?=
 =?utf-8?B?dmt1anRYZ2VqUWovVEE4aUJ1bm84bkxOMzg1RFlEOWRRWU1md1g3SVd5Z2JK?=
 =?utf-8?B?THZvQkdmZXNaSU15ZXZPZVp6c20rYytCYmU0YmNqbGJEeGJzMzBjc1dSQjZ0?=
 =?utf-8?B?NkMrb3FXMjVXZmJ2Q0g0eVVJbExRVzByWEV4Qm5RdzZkVEFRRWJmZktyTWFp?=
 =?utf-8?B?NldvSFFiUlcwK0ZZSWdUSmJ1L2hzNnhkUm13WE1YMk5rUS9DZmc3em9VdktO?=
 =?utf-8?B?NWk3eEsyQjZ1d0FiTWFCUkJsSkZWNjR0V2lBWVFnTW83TTVJbElkMnpDRUxC?=
 =?utf-8?B?RjR4dmFDUHpxOGRGZ0dNNTdjdDYzY0l4K253ejRCOGJiTVRCT1dRMStpaTlP?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fkVCYRFSg19l3RfwLqjfcE+lka9KK2vEEjvSLhAy9xpdAEmOq/NG6AT/CkyqcEpwkxgCL0Ofy50ZQJEgJfCFiDG6GeuXQZSaDhCYDwiL7xWsnKJJ1aZ9ZdGWAy9YFOaOf1mC3d16PnZeQRe8UbJVxHXur9dyK9reJRiQ5GkJNKXmAglM/FiqkWbBZ2fnYBs7IFUi5igoao23Twq0Hvhz9gok0kQFUjfH4Nvf+QeueOyXIw9+lpAW4EkE4oi1IEvtyRKE7HZLRwE21hqENlKXHGU+b+UVEeyzfkngUumBCDr4OLUH+P9rb8f8HhK1MmGmY6kvfPnQOT3aruFipmynfwJOWYe1jCN+HUTQQS6dNwZqhJLDt7ZA7Hoj6dzrBPcf4wlN8yZkfvDJzdqRgiT+sCOxQoAtPkqy9ZiFZsZnQ1Mkl3zt0/3lwBPfGQ7DjYN45QXNIM3Zu98J25MDrAlLQSkJYr0vXO4KgsfUo1Z8Csm1Srpr/eb5GYKu5WpAJj/wAX4cECkeyTbutPCOvL5NW0JcT8B8vQ2XaVn/rUDQBwLZcVXotQ+CzJyfh3QEr8ES5yO4wiXUkwhRPHH3smPWIKNXwuo09HZetXhJYh+YnOw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df308728-f5dd-4296-b5d7-08dda20cfc05
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 19:38:00.9287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pu3P018jg4XdsiZ6HUjSrUTwdiLlXsB1PsCJhTWDX69Qo10olDDuDQSl8cwtEg58/S14sPpAYNP7ndXv+XLJhXUxHYqLKEXgUE7ekTlO16I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7837
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=746 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506020161
X-Proofpoint-GUID: LtdfV8C5pRt4kGSeI4sM1btfXCTkHvXQ
X-Proofpoint-ORIG-GUID: LtdfV8C5pRt4kGSeI4sM1btfXCTkHvXQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE2MiBTYWx0ZWRfX0JUkK2fQ2Iii jxBiPzdpb/HCDFl4v9qT8UBJro9yZYgWJsjc17ORpNQMMY1oO9hpis+ugpplLDx7ouxKWYvwO3z VZuB87V6TuRddbBY5Pqura15qDeQmCWTUiBi4fZfzp5pN3dXaAlf+X33F8JgtV6jEvJ0nvtvxhQ
 MsRUlt7eeU3EaKN/G4khMwSWAvVH2Em4IOUOR0BDmn91SF0OM7P+ML+AR9gY7BlsBJc3WgpEl/R ug0bNgQI5bnqBNOQO1OYpwPbmnhOmE8xeW4RJJjxJm6EcpeFFB69Fpz74cOVjdK2t9MxvTUDMjN qDvM+4hKg0gYASbZeLh7QHIeYlkK+LFZri+7POknnuXQ6TOVDQjcwFjvGF/gcQiwEtz8Kp9qKBV
 TGCLOqLhdK/j3LvGgvVVTXMI/5R1YfpVtWdXKHE2Kr+7BDGn2rNgU29/ZybpspNTHr3K/Y2g
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=683dfda8 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=CMS-Gjxx2RrcJRTMx-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206

On Mon, Jun 02, 2025 at 09:34:55PM +0200, Jann Horn wrote:
> On Mon, Jun 2, 2025 at 9:28 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > On Mon, Jun 02, 2025 at 09:20:14PM +0200, Jann Horn wrote:
> > > @akpm FYI, this looks like it fixes a security bug in 6.15 (probably
> > > leads to UAF of VMA structs and page tables by racing madvise(...,
> > > MADV_GUARD_INSTALL) with concurrent faults)
> >
> > Hmm MADV_GUARD_INSTALL / MADV_GUARD_REMOVE require only a read lock, so
> > madvise_lock() will be:
> >
> >
> >         if (madvise_need_mmap_write(behavior)) { <--- nope
> >                 if (mmap_write_lock_killable(mm))
> >                         return -EINTR;
> >         } else {
> >                 mmap_read_lock(mm); <---- this branch
> >         }
> >         return 0;
> >
> > So for guard install, which is the only thing that can return -ERESTARTNOINTR
> > madvise_lock() ignoring the return value is essentially a no-op no?
> >
> > Am I missing something?
>
> ... you're right, of course. please ignore my needlessly alarmist comment.
>
> (I think it is surprising that the write lock is killable while the
> read lock isn't but that's another story)
>

Blood pressure drops :P it's still a good spot, we should handle this because in
future we may change this behaviour and we mustn't ignore this kind of code
path.

What was that you were saying on fedi about killable locks ;) a source of pain
indeed :)

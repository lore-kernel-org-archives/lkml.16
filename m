Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99ED54763
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944146; cv=fail; b=AvtutRoH1bfp/YMqZV6SQE4So2alxHK8IZeG9gTDhrEok2vxDR74GUO9yJIGNqHQ0Sxrqs1P8YofU/nhBbCkkLTHZtMymPITzfsFL+gJ8oPyV/8sqlik94vqF4pfTkR/By+AM4ANCi1NjFcFrKX3yKS5h7NBRWojbKSPqqUZrPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944146; c=relaxed/simple;
	bh=Y5/l7hkL12YAsTIAGWoMvrNSD44PTN4zVMSH6ooBruc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ScRbLozAhce4pur5IcVM+t4jvgVWn8ZF04YtcgezHcHKAs8iBjqZ87dIxRsTvcvAkAfegsnoSvHten1Rba6wi2khLmGK6+8wg5wLoOKdLurPC6s4spvkE0Br2fazKj3lJLqkMWOTEiiTtbYMMA6JaGlTTNnLwm/JUFWOtWRaR0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UIvMRWIQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Op3H0uz2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UIvMRWIQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Op3H0uz2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5537uH5Q030348;
	Tue, 3 Jun 2025 09:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Y5/l7hkL12YAsTIAGWoMvrNSD44PTN4zVMSH6ooBruc=; b=
	UIvMRWIQWr+m6aUptnEaJ4EvosmO54FHxc8JNI7k7ao4oWOC2YiwMWDVz0Kkl1fN
	/FZdiegeIP6EajAdO+gYm03b30B4S59Uv9tqo5jnifUTHmm3LMRlDprNaPSMRUz+
	A3lynbvOS/iAWPyebunoOr7nppBU6y+OBqkSFYfrIsT6vZHuShuSo1FNUgLpJxRt
	F3IdcORdLKX0rci8qvzXcBdN7oIzE/o9pE/QVOMpLJomZN3OiwmYxsFrcTD9SA7E
	9FsMVumym2Aai7MQxKYVRCVxsfVODFojEfMm5E0hkc6dE21Lj1IoAV8I5QPPFX+Z
	KAYN9Us97ZmTgNQRlpqQhg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gah9j1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:48:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5538QnoQ030614;
	Tue, 3 Jun 2025 09:48:50 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012048.outbound.protection.outlook.com [40.93.200.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr792x9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:48:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ak6yT9+Uu9A4nV9E6aLkTIT0PjJ5OYzVjQXk90PuU35+GNWIi+y5RxhH2no5VBFK38tNbTHbTghmTJIERAY+f2inWp1qi3PAhesofW6AWTvML6cpUr7ySsLoQO6S2hYvJDVZxh8T/Gi+IW72QhocCcAuvVJY37/RjcuYSqOUrNaG3qZ/XO1yHQihqqsOtPbfltG/MfbfEYShxVnrhDO3FBCxv/ewXQbN4ao0c22ZxY7KRpXgOG5KAUTGzBcvHPA9kXNwzUjOBI67huGSB8d6Ca/jAbMnq7Qm2+1/jnAsqG1f2zV9ZT3FRdeKKvFntfM4QtyB5O0745dAshqNwGIrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5/l7hkL12YAsTIAGWoMvrNSD44PTN4zVMSH6ooBruc=;
 b=YXG+KLaj8AqHB8AmCscIZM2VRQDyiDcfB5kmrbS+MvDKBIvmcR03egIfl7EmAnVRp2IWHP3IImynko2UPcZl566eZusTPw4cU5PLebsTb2cJWfHR236qeEZ1YKLvVmmZeTBNLTlsfbMVOPAOjaqE4vk5/T0vRhatgTCSQn2Y6Tnb8V6jvqPBzrluiR3UwHB42LwImP1eZn3CJGi9PS5UEwNggW5F2XZ+MMHv39FvjfR4OcyicRRkQdCv/kJXNk9zcPbAWs7P3sDp8bFkeJlruO8B1d4K1rQST1hqa+ax24uIlyDRe8PHuJbyIbeBAj0JRz/zUSST/I/2hZEE290FHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5/l7hkL12YAsTIAGWoMvrNSD44PTN4zVMSH6ooBruc=;
 b=Op3H0uz2ny+VsdYziA7Lzx+GbEkCKQRvu0puToiK2xgyR/ToDWu+pSIVcQRs9n2moNaumL1EwRxulh70qGn/QJKkykkN4Ito8EUeO5p+HpyJ7hKah8Zql1qKFmGh8hxpdBPpQ7pLjoMr4Hhgip0FBksYv7f8lSV+IwUYmjqySVs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB4990.namprd10.prod.outlook.com (2603:10b6:5:3a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 09:48:47 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 09:48:47 +0000
Date: Tue, 3 Jun 2025 10:48:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Jann Horn <jannh@google.com>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <05281d88-2309-4b01-a271-edf6c888ce88@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local>
 <CAG48ez0kb+on=erofZL2ZwB9CqtrSCJVND7K7=ww1prMUGXDRg@mail.gmail.com>
 <23edf435-7cfe-49d1-9432-aee64c0096ab@lucifer.local>
 <CAGsJ_4znsRvV4CeAkiCdN5snusbUGo4j+b3vhuEfiQrNxnGG_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4znsRvV4CeAkiCdN5snusbUGo4j+b3vhuEfiQrNxnGG_g@mail.gmail.com>
X-ClientProxiedBy: LO2P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ef2f26-b747-4585-de49-08dda283d64e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y085bmhGNFhyNDVsNEh2ay8xL0JQQnBzNFpRYUNSN09vcGFjOE5KNE5nN2xL?=
 =?utf-8?B?NDFMdmpYWmRJOVJsUWtCUVo2dW40MlM1WmdMNlphMWlGNlVBMTR4UHZWUG5q?=
 =?utf-8?B?MjZiZ280S092ZUZBVmtZWWFSY2tpL0VMYlNXQTBIWHltaFhJRlA0MmVRU2xZ?=
 =?utf-8?B?K1J2SnRlMDBSangraUgyNk1QN0I0L21RdFA5YUVCekIxNldKRC8xc0s0TGVp?=
 =?utf-8?B?UVVOSjRZbGtYcXV3THZCbFRRZDZ2dVd3VWUySjRkdXVPa2dUQ1FyRWkwb3F4?=
 =?utf-8?B?R2xyeXM4TDhzNElmaHA2M1JhWnBudGg3UDk5OGdGN3BMZmdFZHVZQStPajZG?=
 =?utf-8?B?ZFliK21ud1ZvTGpoUVJSTzN3UVhrRy9PS3dmZ0xBalQrQmZENDQrWGQzQ3Jx?=
 =?utf-8?B?S2ZwNTUyb2U2K3BvZWx2dWVKMURmeVcyQTBGZSttaElYU0plYk91UUh0emlG?=
 =?utf-8?B?bHgyTXJrdEdmczJzMmczbGpTdGVjQjZVdHVRLzl6TkZWRlpFTlBXZWMyTEsw?=
 =?utf-8?B?UGtRb0FTNVdsSTR5TjJvWmEwQTFvY1Zmbnl6MFBLT0xyWGRsd25YbXEzRHdv?=
 =?utf-8?B?RVB3WDkzUXk5WDEwT2daaWYrczNFVHBJc1FnUVdHa2ZrVmVPQ0p6NlNGd3g0?=
 =?utf-8?B?UGdiMUU4eGJCbEd2Q2pwNy9ndmNkaHFTUlhkOEhRdllPbVExcWpVVFNpZzJM?=
 =?utf-8?B?eUV6SVM4VzAzTVB4dVJFMU9yeVFOazlWS1daN04wRjRsdEdVY0hObjNhd3B6?=
 =?utf-8?B?RWFTNVN3TmZzcjRVVFlCR3FDdWpKeHFwMno4VmxTdUhPN2JSZlNWQzFCUFJi?=
 =?utf-8?B?eHpQWTQ0a1gvb3MySFdoVThnNjYrZ095SVhhMVVoMlBad3R0cGtEQlh0cUtm?=
 =?utf-8?B?allFUE4rbzgwODJ3dlFlQWV4bDZqYXpNQ0tOWFZkUjd4YzQxK2NGZFJIdXZD?=
 =?utf-8?B?QTdEZElGYWM1b3g4eTdoSWhFa3BIV1pKZHhKV3VBU2NTTENwTmhYWlBWc054?=
 =?utf-8?B?bGZ4U1hJTk40RGxyOWlkUmZMR3RhNmhneVZLdVF1czdKL3NFR0FCSmlyRms0?=
 =?utf-8?B?eE56ak1QRUphZk5NekRobmlDT25KV3dDR0xWVUVVV1hBanFmL2VXY01QWHVl?=
 =?utf-8?B?SEZvNGZPYUR3N0NGSWhWUWJ5dzRqTWNKTnJCZ3NlQ1FDOTRDTDNsTE5HMTAy?=
 =?utf-8?B?ZHF6c2NPNlBWSnFBVnNtUVBhL0NoMmJoMlhkL2FwV2FGdCt5eVlPcElCYTB3?=
 =?utf-8?B?TDg4Qk5Yb05mY0NaZCttOUNtRWg2eGRHZjFFOFBQL1I5ck1UNXFHMXVNeUVy?=
 =?utf-8?B?cXFjUDlsTERCRkg0QkxQWDRFMjhuNXBnLy9EMTh2c0JTa0xWSkN1dTVHZzNv?=
 =?utf-8?B?cG9OZDFEbUI2OWZMaStzaDEyUWFnaGV6R3BkK1dnNFB4QjhuRGpqd2M5NnEx?=
 =?utf-8?B?U1RjWEZEMHlkNVdKVmFkMncxbmROSDJTM1czWjBPeUVjL3lLRG5qaERWWHlX?=
 =?utf-8?B?MzFQZ3pQKzBLQXNiUENFRDgrR090eDVTSlB0MlJUL1gyQW9WRUFVd3kydTl1?=
 =?utf-8?B?Qk0ydjB1STFtNVVML3RWTDJvOVpsVnY5Y2taUHpBdmNPcFJ1S2YwcWdvYUZ4?=
 =?utf-8?B?RS9yaEwwRG5rNm5OVjlUWlFBK3VCWGRjcUZIejREWi95RVZPQmowaWxpb3k1?=
 =?utf-8?B?bml2NHRxT0dXZ3lZanVFOFFvdjYwOGxsK1Mza1R1Ry95bDlXcHR3RXJhaHFq?=
 =?utf-8?B?RkJab2E3bS9QSUdMd0JwcE44U2gyVnVOVTR5N0QzSGNYRHQ1R1Y1bUVxWHI2?=
 =?utf-8?B?NVR1RnBwUURqb3FDVTVCYVltM294d3dzWjM1dEw3NW1qOFNRc2s1dlkrZ000?=
 =?utf-8?B?QytvU3l2dlpYZzFwOC94TGtEaVJlQXZPVmoxMDN2UFc2SXoyUFRwdzBEejJx?=
 =?utf-8?Q?Q5Jj6ENZP5s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUZVTEZhSFMrazBmSDg1NURDdXpIT1FvcGc2am9wQ2pTdXh3QmtiaFJ6bWpO?=
 =?utf-8?B?THh5bml1dnBSWUJrdjVIV1RVV211dW9jVWl5WWRTTC85NkU4Tk5XemhxbEZQ?=
 =?utf-8?B?QlhiVWZaeWhwV3dTdVF6alFSc2ZJUzlIMExVa0tMZXgxVExjbUdVbGFhS1ZZ?=
 =?utf-8?B?aUErcllSTFVxS3RYSXZBSTc2a0ZsQzVKUFFiWFpXRTB3YlNtWWZRNGtDVU5o?=
 =?utf-8?B?c3pxWko0U0J4YWRQVVRRNllCQ1RjWHdaYUpQdXlyUCtjcW5BdHV5TlpMVzBy?=
 =?utf-8?B?RXl3THFVbmVlaFFhY3MwbmZDbnIybEMrKytUSGpETENNSCtNVklLWC9vaFU0?=
 =?utf-8?B?M291OCtqT2dra2pTNWFFZzBHQU5ZbllWamdWbFRKK055TmtXVFpkRnNDb2FK?=
 =?utf-8?B?MGlqS24vRytadlNqcDJkZ2I4QkpkN2VXZC94NUg3cjFxZTBiKzBYTzR6R1V4?=
 =?utf-8?B?MmhJRlpvazBJb3RsRlFWSHJtWE5NWmk3MFdabDEvbHFnRWJubzdKNkhmc1VV?=
 =?utf-8?B?eEVLbDRyOEpiUDMyR0t0RmxRTWJNNWZURHArWVRSM0E2WEJtU0p4QjBmRitI?=
 =?utf-8?B?RFZTcGtTd3c5Q2MySW1PZDhzT20vUEJXamhYNkhZcGJ3S05OV2x0RzJoY2J5?=
 =?utf-8?B?T0sxSEE0U2dZYnEzS3kwQVFTMHBTbDBwKy8yOVlzcGJ3Snk2bVErcmpkczVH?=
 =?utf-8?B?V3lQMTRMQzRpSDI5Q1lZUWo2SjZTOGgwa2JOSU5xVmtueEh3S3h5WklCaHJ3?=
 =?utf-8?B?cTNzU3dNNHMyWjBQTi8vRit4M1BSenFsSmhoc3B2NUo4OURidTRNVFd0Ymh5?=
 =?utf-8?B?RzFHV2hFeGRSMjl6V0plRjg0bkNkdUFlajE3QU13KzduUXNncGZMdmlmOU1I?=
 =?utf-8?B?NkdqUlpQTW5WMGUrQ1JlT3ZPMkdRbktubjZIT1N3cU8waFI0WkZEVElvWmsx?=
 =?utf-8?B?a0Q5U3FlM1FqbW1zVUhlU29ZZ1g4M3U5M1V0RklnZVhSRlBBamJjU1VyM25N?=
 =?utf-8?B?UlNzUTFrNmZreUZxZTRkWit5TkZwWC9LckpKZG5NaTFPS3FUZ3lEc29QZHc4?=
 =?utf-8?B?eUdWNnh1WTVYTFFxemgxL0lNdmh5eVhGekwva09ENXU0aXVhbTc2RFZUUkxr?=
 =?utf-8?B?b0l1OTVLcVAwZCtvajdnMjZ6c05sZVY3L1dsMldocGl6cUw2VnRUUDlvYmJJ?=
 =?utf-8?B?Uk8rM0JwN3N5WTVza093ZEZkdUxQS1c2bkIwQVdCdmZ5em5KQlRTdEpTaTJs?=
 =?utf-8?B?SGx3U0N4SmR0Wm41YkdObWVpSE1GdWxHRFlIZldWRHAwVmI2Mnd3bUlsR1oy?=
 =?utf-8?B?Tk5vVndNcTd3MytHeWN0NDB4a1RLL3VaekV5MXVTQlZUaHl0dDh4T1NXa0FQ?=
 =?utf-8?B?ZmdJYW15RjhsbHNEME92a2QvTm82Nm1EVkdWWE9KcWh2ekVDY0lQRml5azRC?=
 =?utf-8?B?YkdGYnV4OTgyNDJqeHFVQkJpUm5Md0VZYS9GQlVQSitOQWQ3WWxQNmdwbTNi?=
 =?utf-8?B?bmd3TEtMNTI0QWpUdXNsNGk1Vm1KNjJaMlVOR2JxVG5FOXRvQ1VzdUtUekc5?=
 =?utf-8?B?ajNkdWFOMEVuZllKcDNnZHhMVi8vU0dhaytLSTgyNDdOQ0p4cGROZDdYeFVl?=
 =?utf-8?B?N2UrMTg0TkFUaFB0eWxoYjRoNkZrNmlmaDBmSUJydENxTXZvaU50ck5QOEpy?=
 =?utf-8?B?Q1ZhRzc3SW1wSTN6UEpsWmNJcVFyTm5PWHVqeExLdFNFUTRJYklRbFkzbDNG?=
 =?utf-8?B?RHhXNkdqaGh4WmdvZVVHTDJqUkxEeDdibGFCRjJVc2JlRVNNN054S1gxbHRH?=
 =?utf-8?B?NGt5bXBkUlRQNWgzellzUWpxOFZUZzExbTFLaGN2c0ovMWRIRStkNG9aVWJF?=
 =?utf-8?B?SzFBd0VKRTlKMmh6cFdyenJXNFZjVWIxWEk3aXc3QjVXcGZhSTkrd2xGQU5n?=
 =?utf-8?B?d09PS01EUUIvVHgxaGNyWDNuTUxodjUyd0dkTEFFdVV0MmNOUElCdlBPbUhV?=
 =?utf-8?B?cVdjOHRRcTRUQVR6Z3Z4bC9xOG90TjVSNSs4MGx3Q0Myc3ZKa2RHNVlXQXJ2?=
 =?utf-8?B?YVlTN3BmSnJlQXdBNllRNFlXMURlbjZWcDMrRzVwZ1ZFYWcxQnFlNkh0SUJB?=
 =?utf-8?B?eFNQRmIrbkhiaGZPalAzaTViWWVvaW9vSUovZzVEYVJ0MlVNUHVIOVZaZTd1?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2p2WWpE+itowFgvdQRsb7+e9xrMmbTSB+1TOqaS1gRiSiiNE3GqS5dP5BPkD6AN/HOGkvlUvgLqkdBVFS7x1XChnumzCRlqBoUNTuqSL1ed4eyKgVq65cSbLkq9xsnxxf6i43IOQdj/CkTFEhA0qaorfPq0cZLmIczvEyJqxdv+ZlkVYCkCe/wbesk4TngaQ67IsVhLNWbkKO6KoUBdws1djWCLAqiE+q95VWrCPsT7KRTTuZFUFxjwAPbNqUuOQT6LRXsXIwJqJgvUsLLlQvzVahQhglCl0Kg4jpjGnS6n2e00X6kv0obZFuPafCrCJmHTC+yDiO0jKHW2XdkCTfknmX8WB5WgmDdJy7xpjWgM7FZDosFTDv7bozjf+P2vadBHXVxRJmvacW9HTrnk3qoBm9PqO2mGT8E+9kcSBlo1bJ4felphrSVylNdBdb6SYYSaWzE2JPR2OmC4VK9IF7pu3yPjn2hhz+D+NAaIETTg4g7K+ba0PWwyOuwODYxvvqGbgG1uHoWb9ob3fDTi47d2n//rAvTzBO72xYYVQnXM7hVPBlDlXA6+moIqtHU38POxIIJ4TWPLJoBXxiF8b9b66kdDPKeFt+RMb+Ya+mx8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ef2f26-b747-4585-de49-08dda283d64e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:48:47.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/lc7YMck5G+31J6Y0TXy0q+u2vAY2p5IFYsXuXHiQQopzCXSRHpM7a6vx7PgHiCfnyE5qrqXg1PwJJZiuCHcN753Fci1TBC8LuCBSPB7dI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=978
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030085
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683ec502 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=j5u_enuP2R7DFyOC0PUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: 5uIsDKwmsRmoWvm0z4D6BtyQU7CyQl3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4NSBTYWx0ZWRfX0RaMgWSO4EBM 859O7/rDVfUG7ROTw8QhICeHLCT1AQfQm4EwvUKSya5jsZ2+RPRcAr5A+SIux1SvCzVSjCRSoPC Epjh2UlTNhnWA8jjUxGGjHbKX78PkHxjKOimvCR2ARkUSODdFfJtZ9h/pGBLhoHxzYexQPYAwCc
 LfKyd2d3PjQOs57LV0LMm4nuwRVA/Zmamc0VS0BTG8acsnd47F1wmo80prAk+Ufgy7Rjnutyqqj fGY3sRIcBx8w6GhwKT/TEJ/vSDNfZVtRLzSGWeXqWxSQI/Vm/gE9flmWA/DfNL/POmfZ3o0BNZ+ ksQ6fTXBycnch2Fcvqo90SQkS57B7DnPFxCya4sfrWi/NbAhkXcXvp2pNEBWicmGiv2E29agj+z
 5BX0rKmwth/pSumxsDSxt5avkHymkIH87V3Mk484Cygw0XwuquzPGA6bVJb2wL22wxFEL+cR
X-Proofpoint-ORIG-GUID: 5uIsDKwmsRmoWvm0z4D6BtyQU7CyQl3G

On Tue, Jun 03, 2025 at 01:06:15PM +1200, Barry Song wrote:
> Hi Lorenzo,
>
> On Mon, Jun 2, 2025 at 11:50 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > Barry - would you mind if I went off and wrote a quick patch to separate
> > walk_page_range_novma() into walk_page_range_kernel() and
> > walk_page_range_user_novma()?
> >
> > I realise this is a pain, but I feel strongly that having them together is
> > a source of confusion and having us special case a -only used in ptdump-
> > case like this is not great.
> >
> > It wouldn't include any VMA locking stuff from this patch, which you could
> > then rebase on that.
> >
> > I think it'd make sense as a separate series and I can throw that out
> > fairly quickly...
> >
> > But I don't want to step on any toes so just let me know!
>
> Feel free to proceed with the patch. I can rebase on top of your
> walk_page_range_kernel() changes.

Thanks! Will send that out hopefully today.

I will also come back about how I feel the abstraction here should work, sorry
getting tied up with other stuff so got delayed on that...!

>
> Thanks
> Barry

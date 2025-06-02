Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992BA226CF5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892550; cv=fail; b=Xe07BMPBd5Sxoivk40yQDVA8S3gvyGqHUpZcIsqVSBo4coK5itl9+cThPPFI0W9MVmbLyYj1Xduy2wliZQB/IQTF8VeZqE960oU6EhyPowpTWt4lE2bTfLQq8e8pI8WkNqaqGCxiVDWaBEBZy30q4bs4f0Jd8/OBpDQmak8q4uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892550; c=relaxed/simple;
	bh=As6B5XaQSA20Bvh8u+wP6Jbbqn4P6Lc0i58QLZZL5tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dst572Qs97sKIQMpUXfaRJpdqLXgBeRyMSbj3r25DjuB0xwg2t3yCe9jLkLwJq1rWrjtwOtHJLVArsh3/m5ephOr5ZhzBT0ZsnalmX3jjGIvLxv7H/SdeAnESwXnlWCknGiDAvdxZjUcJLPD1xM2ItJ8e9XA+dqcy+deE5uz29A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LFvbn78M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yEtgjFOH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LFvbn78M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yEtgjFOH"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJ6Ox026121;
	Mon, 2 Jun 2025 19:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3LDcS9hS4ejQzLySfCRQ3WLpdk120p40/GeRJVsYi7Q=; b=
	LFvbn78M8XYp4w29n052MiLWJmwRr535FdENxLcyvxGkN1ER3nQScksHxM3Br1qw
	lsOgkn9SJsN93Ct9gNUFPpwg3ieUVXqyaCTzlsQ0rZkU72yWn/xNnuFYhSeihvin
	rv3WMkGDudBHLDhUksZdZmNwE7CCG/eDkkOa7Nmi98+J8HwiIlGgzlZjd2pvQB/B
	mmj+PmZJdGAnKv+9342/s+LYQXJGO45feRuXwihUhomUCZSYP8ZLBkDplsUclEnQ
	7oz5Q8U2/NvRqPTls2YiQS/W/Mq79cLDe4FOpQOEUUZjl+Tzzu3JHKnwxGDN/Oz0
	zRztEBzEy0FAB8MPkZu2uw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8g888b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 19:28:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 552JScns034422;
	Mon, 2 Jun 2025 19:28:51 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr78cy1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 19:28:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEZ7nwYXkEuOti9QQnMlSg8TIdO2yDO6E+arW6Paqt7bhNmQ9dUn/1CQU/EnuKdaAOYio++5Ixo0FhYoIaMd9ToCFoAYkeEQ+P1qzdecGC2gqkGVGm65+KhKRn6j9iIAXoBE4p/MqRxgQwRQ45tP1yGcHAsgkrOjSDx5+Trl7pbS0pzO2O9B5po+g4ZqHIiq2nRU92Pl73wCtUc4uFtudxC1RbZtvzalSZeQz7aLlUPB2g7tSVA99yNlP1ymSm9vh7Mybh3UEODGczq7wIb6IsVlcb9JU3NFok6zgUH714BhSKQrYdOy5u1/7A+lrJfEsyQoY4kesbvp1m+aeFfPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LDcS9hS4ejQzLySfCRQ3WLpdk120p40/GeRJVsYi7Q=;
 b=k6w0nfpRfg8Op8ivXjJ7BspdcTx+8k2uO3057Q7tZq7xKW938W5km5iJXHii3g5D+MwvwmC8jUIrL/Q8m8Guu3B+Je8kwoWfevyQvyNY3zgYbIB44LEqXTUwKMdpltTr4eHqhGtxWmIZA1K+Izg60UQAYBJvN1xvVFhOmOYcsVXKQ73CtbprrRZLvm5ttPBSw2ByjM/PHdm0y/Q4xwhl+TOa3ljc8MVdkFh9+5wIJv0DTbsSpOmcV4JQSibRb937G8wjklbleed0uaZ7bbloshprXDQaPUy3p2vk0uM1LY0I1qWSmfp2g9mjdfuBL2oJND2HBxx0Cd0h7L8y9q8dvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LDcS9hS4ejQzLySfCRQ3WLpdk120p40/GeRJVsYi7Q=;
 b=yEtgjFOHLw5hgSLSr8m6gOoS90f+KRmbqEv9+VTszSpEWAwBC+7AvRhA4obHU8oKWWQwV3lviprgYLal8fxojpEqzzUKBgYHwW006vu86AbXNjrnuJzx7UDO0fwUc3bK407EDl6Ltiv4CMLBGvXmhVCMHnmDC5AVzIr3V0IOu6s=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ2PR10MB7013.namprd10.prod.outlook.com (2603:10b6:a03:4c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Mon, 2 Jun
 2025 19:28:43 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 19:28:42 +0000
Date: Mon, 2 Jun 2025 20:28:40 +0100
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
Message-ID: <b3783c64-1f68-452d-ade2-1fc44cd8f080@lucifer.local>
References: <20250602174926.1074-1-sj@kernel.org>
 <CAG48ez0cysRfJ82UKH39Ns0gYOcmn7HR=UVRDo74w=uwm6pcTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez0cysRfJ82UKH39Ns0gYOcmn7HR=UVRDo74w=uwm6pcTg@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ2PR10MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba36529-5fad-432c-a72e-08dda20baf67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDFxejF0bzVTZ0Zhb2FxNDkrQk42bXpvUTR6T1phNm9wRHBtUFh4YlpyelBj?=
 =?utf-8?B?YjN4Vzc5dkY3Yjl1eFdoVHFoNkgxbytZQlRwZ2xrRC9hMmxFR1RQYmg5UkZk?=
 =?utf-8?B?d2pjRkVnL3BqOVdEbkxPYXpoVGhjbjlJN3VlUlhwcnIwaUF3WklSUzlwMitR?=
 =?utf-8?B?dHNSQ21qWjRBakR3S2FpcG13SkhvWmlPWXk0OUluZW01WHR0WWczTW4xTHRT?=
 =?utf-8?B?VEgyS2RPcTFQc1hLNzVVLzNhTXpmdTQwSlJmUDVjZi91MTRUOWFlT3BmN1dH?=
 =?utf-8?B?YVJXclBtN0FObDlwSVdqdEViYVlqVXkwWE9KZ2RwQnFEZ25KOUZKWXZ4bm4x?=
 =?utf-8?B?Q2FsaXhJcmo2UTUzbkdVVmhvZXoybFVmMTlLaFhqV0hZNmlIWDVMWjQ1NjBs?=
 =?utf-8?B?djl1akJQL2lvcENVT01vWit4RFZFamlqQkVFUU81VnRCYldHK0FJM0lUQlA2?=
 =?utf-8?B?QmpVdHJ0WGFhMjFlcWxUbUtrUzhZM2lTTTRYNVJHR3diSW9kTHBxVmZqRWxM?=
 =?utf-8?B?eHNqY0hwWmJvRlNXMVN6dzdxZXVVdDdVZmIrbkVQZXdyNGdLcE1JYktYeTV2?=
 =?utf-8?B?dFhWcjBCY0N6OG9ES1NSTzRrM1ZvMVBwZHZER2ExTVhLSTZKR0xZR0U2cGJ2?=
 =?utf-8?B?djNMUUFKU2duNzVJK1I3UTF0NURMQnhpb25IWG9LczNNMHhtWW5CNCtvVG5C?=
 =?utf-8?B?WnNBMVR3SytkQ2FWTW9SV0MzSElIWmdtME1vWGZ1MFpSOFU1RXdFblhLOCsz?=
 =?utf-8?B?cGROTklOTDQwUC9VUWNhc0FMY1d1d1NCSkJ3WUZuTXZiRmJhQVhUcEh2UEZ3?=
 =?utf-8?B?ZnQ4U240cUhYTldtUHZEaDYvNnpnSlg3MkppOXBmVjlVUVdnQkQxV3JNN1Fp?=
 =?utf-8?B?SWM5MDkxWVBVSDJZeUs4RFNIVzgvell2QlVIaUlkZzBKSXZrdGx4N3hDekQ4?=
 =?utf-8?B?V1VqR0EzODNjL2gydE1ISnBnWmNYYllVb2gzSjEzaGxiWnROazNhVUlSTWE4?=
 =?utf-8?B?MG5sVTViWjYyaWpjdzBKK0JzR1hUVE9xc2xNVEpac2JZdzRQWWRvOVh2czdK?=
 =?utf-8?B?QWVqaFpTRDA3TXZtcXFDRlIvckFtRVJ4NGhabVBYMFVzRjdENEdvZjF5KytZ?=
 =?utf-8?B?a3pGK0pKdml3WlEzWUV4azQ3K2Q4R3Y3TXRuUUwyaXFwZVkxUFdXeHZ2L0ho?=
 =?utf-8?B?RFBqdEQ3a2hqVzVlN0lsTHBqalJDdGhwS004Vk95QzVaOWpmbHJ0Q25yeTN1?=
 =?utf-8?B?eDg3cGQ4Z3RzWWNvZ0JtTmRUNVJlR29YL01PMlVtd3RtSEx6RU1YdnFCSVJw?=
 =?utf-8?B?TXR5YnIrd3VWN1F4dzU4bHpUZk9BYldjUHduWmlsWGxLbXJzK21ETC9qTDlC?=
 =?utf-8?B?MkNlZHhlQ25tenRtdjJJQTh6NlZ5Z0tMbDMrZzNLVDl5MkI5MHM1WDlDWXF0?=
 =?utf-8?B?aFlQdHpOOVNlbDZjM2kvemt1NjZFZ1ZBMkJUbWZydklwREl1aXpSOG52SVND?=
 =?utf-8?B?cjhaNmIwcldMY3A1T29HNzM3SXVuWlZCOURLUTBHb0ROaUtQaSs5dmU0V1Nq?=
 =?utf-8?B?YlIweUxBSHJtVGo4UTFNeW82QWV4WG9LNWE1NHc5WWhTSTZhR1g3TVZ2K0Na?=
 =?utf-8?B?ZjNHaXJmNVZITVRRa01VQ0tSRU4xenlCUzNONGVMTVpTV3BpVGFCSkpxK1NF?=
 =?utf-8?B?RDU2UzRkMjgzdHpLd0phUElGbkg1RDUyM016ZWZPYTU0V1NCcmhwTUUwd1l4?=
 =?utf-8?B?aVBOTEJsQmJGN1V6TVVrTUhzR2F4OHY1cnVuZ1U3N3d4UW95cjhOcGVBL1dL?=
 =?utf-8?Q?evhXVs1VmeM/yM8sSKaVqQeQdCEHtxMuiAHsc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1R2bFltVExwSFhKWkE3NXJwTUFDV1FqSnhDcWRGcVZ5endGV2NJOHo1aUFU?=
 =?utf-8?B?RWxNVVBjK213QWwvQ2R3dWV4UDFFSkpHaUtqMEY3Yk9KTkcyb29RS2RkOUlt?=
 =?utf-8?B?MnBoNVFNZFQ1OFZXL1N4M2VUd0VacWx4S2ZQS0MyWVhvUDFQMVFZb1dNb1A0?=
 =?utf-8?B?ZUQxZS9PMnhLZ2FIWUdOaFkxOWg0U0xITFZObWN6YS90KzdLMnFtRFppR0tC?=
 =?utf-8?B?cm1DVGV1WDNkWHpJcGF1N3hIcm1ZRmdJVnBwalVCWHNidTUraEZ1OWp1amdk?=
 =?utf-8?B?N1BMbXkrSFN4MXgwRGo3Z0NSNXR3NTRWWkhaK0Z1QVk5c3MrRmVnenpWSFVL?=
 =?utf-8?B?TWpSODVlb3c3WGRad3Y3K3RHdWtZZGl0cTY4Yk1pNUNKT2ZKcmhQa3NWSFZN?=
 =?utf-8?B?aUJSZnEvYmVSTityajdQcnJUK25Wb0VYb3VRY1FtN1hWRzZvdkFleTUrbGgz?=
 =?utf-8?B?MTdlajIzbFFaOStzVFhoVkdNalZkd3VMeVVIWFZZMkd1OHREWlBaSnN3RnU2?=
 =?utf-8?B?dWhkNTJYSTZtT094UHZ1aVZpZllFb2RXdlFLbTc5bEdhNUw5VVpvQUs1KzBI?=
 =?utf-8?B?QVZqRUtWM1VXak5IT05pampRK1IxUjhhZUovTU82OVFvRzdIVEt4c1pyVFAv?=
 =?utf-8?B?cS8rQlMxdDZUakVCRTJzLzJ4WjZuM3kzSk1rdkwrU0t4R2FUK1VDbGplenUv?=
 =?utf-8?B?eDUxZ0I0QjRWc3dlMXNhWHE1ZWloSnJpR3ZQMU1rS3BWREtZK1hkY1c4Rmlt?=
 =?utf-8?B?Z0YvaGZhTVR4dDJVWHFsNUFYY1RJaXF4cDFCUm1rM1Z1QlNzNUxVa2w1WktB?=
 =?utf-8?B?eW5YRG84QWhIcHoyUHg1UFA1VDB0d2tYTXBzcDBENU1TYUFXTFowWTUyQUlW?=
 =?utf-8?B?SnduTm9oVnlPUTRpWW96UXE1bGdlZE9HN016SDJEZ3RkMUVKSTZOckJUUzZ6?=
 =?utf-8?B?WkRsSjFqQjNVc0M1c0sveUQvMnZrZW8zZlpJdTZxKytFODZNa0hJZHJpZjBR?=
 =?utf-8?B?eXNPekM1Mk51T003dDh3cTdQb0lXRXhnM25ienc3eXVoSlpvTjFsZkF4NktZ?=
 =?utf-8?B?RmxaZVV6Qyt2NCtodm4vdWhoQzdPT1Nxb0Nza0RSL1lQMjRCV0hFcER3RVg2?=
 =?utf-8?B?ZCtVbWVWRVFKKytxbUY0OFd2OEdJVFhkRXExTlBiR1NwRzBNaWNpL2hvTkY5?=
 =?utf-8?B?bG5iajc4L3ExYmhHd2VULzkwK1g5Y1lIaGUxRG10enRYS2ttUmhlMmladHNw?=
 =?utf-8?B?OU9Ia1RTTG5sYnhrS0ovTzFIays2Y3laczZNbDk0YmN3TEI3dUhqU05iREFD?=
 =?utf-8?B?WjFSSXdVZHRkMnNOYk01N25LeVFrbzQ4TkYzS1ZkUG1tZVVuRnhUU2FwS2sz?=
 =?utf-8?B?dXlmTGJqM2Vnckh0VGhaMkoxQTBBdThid2V5SG9xOS9qckkyM2NpL3RNR0lZ?=
 =?utf-8?B?TDBTSGZhb1VHeUxSS1RHcHJBaXl5aU0rU29DajdXUjJTZXhjRG8vTUhLZ1kz?=
 =?utf-8?B?dEVwNUQzUEdibjMvMlIzZkVQclVneVZ0SXorRTY5dzgwbWVHQURBQnpTdHVk?=
 =?utf-8?B?ekNlSzQyNlZkSlBLU2lPKzljNmJJSVYvbzQyUmpUUUxhVDVPakZhbVFPZUhJ?=
 =?utf-8?B?Rmp4WjNsKzR5UTBIcGFRcnBFaW1PaHV5MHNrelM4WGxaUUw1dFlKZFM5cjM5?=
 =?utf-8?B?OEp5MG1uaE5wQi9FcUF2bDNJczljRDRKMlNuL1ZhM3Y1OU5nWVFiY1o4bC8v?=
 =?utf-8?B?SUh1VHZ2MUxyRHZ5a2NQdVlTV21tRWptbXdxLzIwUWhZeVFwZHZLaVpzT1BH?=
 =?utf-8?B?b0g1bjd5OGsvZFJmck44bHcydzVXNEJtMWY0MjcrVTJBZmhUb0t3V2k4dFgx?=
 =?utf-8?B?L1ZQbWJVbnZBTDlhZVlLcTE2NDI2blJlazJaUUV0bU1YaTNOTFBNZHdqY2p6?=
 =?utf-8?B?eisxc2Ewcmc4aHJKRmVvZzhVcTZZb2IwSjFzNW5wQklyalN3WUtYdVNuY2Mr?=
 =?utf-8?B?M1JhbkxHUE5ISUNXNSsyV3VtTnRLNkprdmJubVFaRGU3bUFOSmoxOTFaZmpW?=
 =?utf-8?B?dzhabzF5VVlNVGVzRTllT3k3YkRGM3FnYnF3cStUdDlkdlg1WlA0MXlkYW9D?=
 =?utf-8?B?UGJZemJZYisvYVNHZ0JzS2JZaUMxVTNicGozMkpVVW5oK083Z0lMWjIrTlRx?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EVq/txWrT5o2oZmtSGRVSv3JYZgji6hfx14eBUxM8RGAltp+Y60BYWPYdV5b+08o7tHkLciyoKS+u1QHJYukPoc9uAb4A4KBnoFMzNgKRZ9dL35qiIKDEJ1bF0WhlU6F2SUULi5LhLCGqSSQDaSpDHVG/QPYzk8GvuEVGk02ZApCmFZiEkgEMgI8J3ldsy/MdvNC1WNzE8ZyyyfD5tL+AA5WyHh0mRhh49pZ9ZmgXNfQtLG7jZVjWV30uN5GQke/jfLvcVrcI/N9pMs3AG43tRsvVaFSL18Gg1rEBPRQYiwMCfQzcmrY0/QdPgQ15JT9WBEpmfxjMIUmWwXxEXur53sYzEikSeInOtzcOXLUINvJIM8FnT7rco9s7kReabzZBf0U2GuypauE1RLt99cT/Kiw/+PRVJlA+64jsQ8oZlOw79UFzqHeIKeGEGzRMrM4HyuifZrZ6UkZL4rJJtj+6HEJ/10cyMDUXMlirVbnlc3EumeV9O1hrSFjN7eUW97lfO6GOEC732JB0XYErAUEVW4/H4xUJc/orDn2MS8bOkyk1iS/COJ1x5fiJYZ/WXYCaJnqvPWado128SrL+fuocIaT7f32KIcljF+tSOazXUk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba36529-5fad-432c-a72e-08dda20baf67
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 19:28:42.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wT6ZQIbnN9TJknkwDaZT1+bUxofwuSwXJnJo4NHELDfitBjtHlYJ9PmEME4yDFQfaHcayxG2zhM6Gd3Vd0Uuq4onwv3/zOmm8+rb2v4lFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7013
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=550 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506020160
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE2MCBTYWx0ZWRfX8sB/rgkYImdV TJbx8bVsPxivD8xCUzXezhx4hl4j+XcpN3VRcZzaV6vKKj/GgFea+Nm3snWqnPo7NjDaYdji3lE pRpWI3Oa+AsS8R2Oy0rfbMM1Hlta9qtA8XPrjPa8nvpnM/TO4G7JVPYE2g55IzifBbzaWFYUjFD
 oxm3j4yd1ZcBnI60Yd1N61+CvobLcwRk0sZDwWYd7XlfH/KJswUIxcYz93vx+LcTRNDFQk7oO5P 7/pbE3fP+cmWRHOM9pTuu1gS6040nLgJSXgqNtyyfFFEmzZJVdLW2CoAsYc0J3d9VxkLN8Kry/K r42i/SAU8wqa0bVSE69NbzXhy/ZglVK3gUOzyZ1jloN8cIXTgT0NQ7SlYOgxdafkTo9kuoAaOCr
 ApPaYGx1UdV/PtkaoNbnkSplR5+Hs7BzQ9+hsjxUE86BYbAGFw/KMZbx0ndRXrMakp+bZL7g
X-Proofpoint-GUID: _14i6WmhvtzhGl7YTEOKwGCQiboxQyo0
X-Proofpoint-ORIG-GUID: _14i6WmhvtzhGl7YTEOKwGCQiboxQyo0
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=683dfb73 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=1XWaLZrsAAAA:8 a=rC8HFkRf3aqgI1s3kJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207

On Mon, Jun 02, 2025 at 09:20:14PM +0200, Jann Horn wrote:
> @akpm FYI, this looks like it fixes a security bug in 6.15 (probably
> leads to UAF of VMA structs and page tables by racing madvise(...,
> MADV_GUARD_INSTALL) with concurrent faults)

Hmm MADV_GUARD_INSTALL / MADV_GUARD_REMOVE require only a read lock, so
madvise_lock() will be:


	if (madvise_need_mmap_write(behavior)) { <--- nope
		if (mmap_write_lock_killable(mm))
			return -EINTR;
	} else {
		mmap_read_lock(mm); <---- this branch
	}
	return 0;

So for guard install, which is the only thing that can return -ERESTARTNOINTR
madvise_lock() ignoring the return value is essentially a no-op no?

Am I missing something?

>
> On Mon, Jun 2, 2025 at 7:49 PM SeongJae Park <sj@kernel.org> wrote:
> > When unwinding race on -ERESTARTNOINTR handling of process_madvise(),
> > madvise_lock() failure is ignored.  Check the failure and abort
> > remaining works in the case.
> >
> > Fixes: 4000e3d0a367 ("mm/madvise: remove redundant mmap_lock operations from process_madvise()")
> > Cc: stable@kernel.org
> > Reported-by: Barry Song <21cnbao@gmail.com>
> > Closes: https://lore.kernel.org/CAGsJ_4xJXXO0G+4BizhohSZ4yDteziPw43_uF8nPXPWxUVChzw@mail.gmail.com
> > Signed-off-by: SeongJae Park <sj@kernel.org>
>
> Reviewed-by: Jann Horn <jannh@google.com>

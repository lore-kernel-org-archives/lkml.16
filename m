Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1811F3FED
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242834; cv=fail; b=EuhJou10RfjAXNCNv5CWpaXV9DroyXdMWXNbIA8pZmIM9eOCeZIdovePDB6X6htjrqUHD2BSBQR1S7mUaMwQfh3+L88u9VzVN10cLSpdnt2YcOqUdbhdx+XLMFOtRBdsBUMWzYM4XxxWpo8L6/OavYn4a86NuyUOV20b26W9USQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242834; c=relaxed/simple;
	bh=1eJtjwWLAjg1fy7By9SZzok2L1kRmy/RcidotfMhkRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tryoCIvz9x4zE0LYmKQuEHiKFFqmBxI5KDjfL+BzMziU8L8KMqaobcNpJvaXx/MqbkD/dKq7WhCqo770solAahCl5AybdHgEb7eMZSF3h8FQ7/2+Tkp38YSWEuG5moc0jYgeCM9R+nDBd5hSksqFW4wbW27AKxdWJ78HdHX/K3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AucDzUD2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VlrKHlmK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AucDzUD2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VlrKHlmK"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8fctD001123;
	Wed, 18 Jun 2025 10:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hWrF1Vx9D8BucSr1/HbPgD2dB0IBzJBRV63+oJtkpm8=; b=
	AucDzUD2rZS7QwVnelQ6rfXhnV5vRtPC3OXNb6wJ7Q+9cMglU8nlGzTK/Fdtg5RZ
	gbWiINYTxk8iowm334GGfhUQ1kqaKzNvHwEpibOpR/D89SsVyaQYPDToeY2+QeFO
	vsVB2gmUFf/qbpb2ZC2YD7iExep3e60vcOIld8vScEneAz23wBNe+IXtijuL2hjp
	wNSuq1a/D7cSF78/EDA2je9ayORf383fVMaWXB2VSqO79VXYZFzaV1im5c6NsVPD
	b6suOLJCEOVv3EVNUiL2Q8rus1apYsYEAt3qTvzliVAf+FLMcXu+YfftZqtKoX/+
	A6zx2Fj3mBH/yv3NuB8IxQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xu0mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 10:33:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55I96uBo025895;
	Wed, 18 Jun 2025 10:33:23 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhgr4hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 10:33:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3YpS3G+UnCyTZg0LqGrCMgNp5GxAfJ/0Sq9JI6O7M4Lc5RH12sOLjvsdLEYdiEbYsKIbRjArh9qkUP2H4nGXspCxAs757pbe7R1Nlr4QOBo39i1N+Sv89lqfigkArFGNaE8oFaV+AS7bgYgfSRl98pejE6Unx1EZULj5TnLe9QfbcBPG4Bi1fIPHUecb/RtRrC5adE5ke8fPOE3Pap/suxjpzRPxD+EI0jVsm4phqcQfcR+Czc59+Xuh/+PywJOyd2ZtOQeBuRiM+9+BIAPmXgXrOZoqjjhv5Z9s5gAILcqkSGKBZCd93Ns83ikZBAbYqWCebDN55vg0D8z3ocReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWrF1Vx9D8BucSr1/HbPgD2dB0IBzJBRV63+oJtkpm8=;
 b=uULPQ6xzPQG0zhVSdChyrrgz2M7SezyruZgzFLDZolJN8d2plza+o9KxsGC2RSAJRGMm7EGxttxfbVTNCGXihTXKtt7pTcL9WMLKZYDLMaa5VnoWSjY3REU2DPrw0t1ebMRFaGEMQgVDPZ5hpKCJbIuFAO5RgOhn5aF6LBDh633EO5o7vQ9m5vvDm1mONMz7p4MrMFr8A6smwnWoWJQTs2K9cR9M2YsL/KR1S6aFgGH0g/9BeRIILyDr7afYQ3DKg5Azq8/FVLxzBzHdh+LAjTxGOOcD0xY5ldb1K4m1a4kFMOFpe+p2V4AuRdVg+/b+gEqSXduKIZnCl8j/ADqdKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWrF1Vx9D8BucSr1/HbPgD2dB0IBzJBRV63+oJtkpm8=;
 b=VlrKHlmKhnQzDDkiThaB2ZzmIZ/C4L+4QKmXEVt7oAmP7IcPR/TIrg6WxlL71Y/WlS+GTCt7XzKpRFYeaKvA43iHnmbvafaFpVMIbOcQjnyU9F4OJE4WBmqB52sTWNr7JRrFZ9OLEHCa2wjUs/KE/8xr0WDmHVwB9E79jFaDBec=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ2PR10MB7109.namprd10.prod.outlook.com (2603:10b6:a03:4cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 18 Jun
 2025 10:33:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 10:33:21 +0000
Date: Wed, 18 Jun 2025 11:33:16 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Lance Yang <ioworker0@gmail.com>
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <05d38430-3512-49b0-90da-1ae7a617a377@lucifer.local>
References: <20250607220150.2980-1-21cnbao@gmail.com>
 <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
 <CAGsJ_4yPg2AOxjorD3RPyu=Ko+7gpU1=-XWqQohvLWgGrzAEDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yPg2AOxjorD3RPyu=Ko+7gpU1=-XWqQohvLWgGrzAEDQ@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0314.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ2PR10MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b8eea2-f79b-41df-8797-08ddae538c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUd1ZENUTXJZb251WUhQamdZYTI4QnA5azhWY1lIMHdSM3cvRWJIeDFEbmkx?=
 =?utf-8?B?eGc4cEw2L1VGL2JMNnJraU9hZFlrbW9TRlEzNlhWZ25XMGNJTU8wUTEyaUVy?=
 =?utf-8?B?bWNjaUQ1T283aE5lQXhkbGNPeUJpSnBkZ0p1K2FtVVduOC9RaHREemtlTVJw?=
 =?utf-8?B?UHNHR1RQbjJpemZCMHhTeGtkMWVRZlBmTDhSQjlnUXZna1Z2L04rc3RSeWUx?=
 =?utf-8?B?QXFoYjRqYmtRR2tPSWhTMW5IYk9lTmkrMHZtWFd3V0xoQXhpajBSSitRQTVa?=
 =?utf-8?B?OHhkWXZhZjh3Ujd6azJzSXJSS1dWbER0WTVPekwyUUUzOUpsb1BOd3VUazQ4?=
 =?utf-8?B?bklmazI4NEpMd2xNRG1idFhKcGFqUzdoeEZ2eGMraGtRcW1SbGdOdEdYeVl6?=
 =?utf-8?B?ekhsYkVNalMzVEpBSitzano1bnRJcHF6UzZSc1RONEdFTUlMN0RLbVhjb3FG?=
 =?utf-8?B?NzhCWi9YNEVwOWFTaU9VbUNLK1NBYm01MHpMRU8wblBrNFZJVXk2TFUzejMz?=
 =?utf-8?B?aVgzMTJENHpJaXRGcGZkdWRkeXIvL1phNkQ4MWNHNmk5N3QwMkZFTFlJbGpq?=
 =?utf-8?B?S1VPTXJUSFJ2ZUd5ZDRzeCtvZjZydkJ0bU12bTJIenFhOHFUTXJFQ3ZGcG5w?=
 =?utf-8?B?ZXBwMTEwMm9oMmtTdTcrRWF6bzh6bzdsYyt0THdZWFc5UFhFbDVoTGh3K3pT?=
 =?utf-8?B?M1MvQUpOMzJUYkY1YzVyTDk2bFdwTEJWTVZRWXZ5NC9kbzhNOWx5dG8yMWVN?=
 =?utf-8?B?b0N0VEVpM1MrN2lvd2MzOGZEem5mWll1eGZoYzEyS2JPYXkrYUQ4aVFHOHhi?=
 =?utf-8?B?ZFRXd2JsdTc0WFVVb2E5Qk1yQkxqRnJ6YVgxdFZmMXkxV0lKM2Q4SUFRY3Jk?=
 =?utf-8?B?VHMvSkJFajBzb01XNmplK1JabUFMYjVNR1FMaTZjYWt5dXhoZWZKbUplaDAz?=
 =?utf-8?B?SUlLYkxPRFBtQURCRjF1RytKM0NGRU95dkVaN0lSMGdzTTB0L0tVM2VXdlJH?=
 =?utf-8?B?WkJJVU5sdlVZK2xrbXZvZ0lod2F0b3c3MkZvOVl5MFBEcGYycVlPRWR6bXFG?=
 =?utf-8?B?aWhYcmFYaVBkVjBxa1VVd3hoeHBlQnJwYXFndk9Bd2tiOXEyTFR5U3B1aURw?=
 =?utf-8?B?V3JyekxTZ3dKZ28zWHRXVnlhQ0tldk9tbkJzblBuZG1yam5WRjN2bG1IRWZE?=
 =?utf-8?B?SUZZUlNSbStyaU13Y2Q5NGNUVzZKM01VVldlYkF2c1JhUS8zWWZjRFMyYWxV?=
 =?utf-8?B?VmtHS29tSklJaTJCSlJ1VkpRUVhLeGR0RVkrVmhsWktnYUk2Q3dQT0lmZzI3?=
 =?utf-8?B?RnNzL2d4NGphN1phZmlLSU50aXlLc0J3bTNJVlJqS0xzVjdTU3VkRk1nNGRM?=
 =?utf-8?B?T1Rmd3phdzhRbkJsSmdKSFZQUU1EeTF2bjZ2aEthalAyQnB2L2hiU05uMVpC?=
 =?utf-8?B?dEpmQVRGMGdvQUYwUnkvS1llOXZpRTh3bzhNV093Z1hHMUVxQW5EUW9jUFR6?=
 =?utf-8?B?TElBMEY0emtoam5WWXJlTWNJa3picVI2ckcwa0pYZmtmMEJwQWJBdVFXNHc1?=
 =?utf-8?B?Yy9uS3R2NXgySGc5M3FwK2lXV3IvZCtQOE5hS0pPR0g4UWowTmRFM1VmczZm?=
 =?utf-8?B?WVBHcnZuanl6OHhUZTEyekNjeSttSGdJcG11MTZtNllvYm01ZU1BNmdDSjZi?=
 =?utf-8?B?RG5nYkl6bGVtUEYwb0hvUHZrbkpQN1piTG5xd0huK3FWSXVaUTFleUNWV3I3?=
 =?utf-8?B?Y0VyOEgyVHpMUWZxQ0xBNmQzcTNyQnlIU0poZ1hIeXhaWHRiMWZKdFA1aTJI?=
 =?utf-8?B?OEtQMVpyQnBzcFNaUmhDVG95UGM4RjNEWEdlOXFQWGdGVmlLNEJRUjN2R2lp?=
 =?utf-8?B?dzVKT2JVTjZIUFF2ekxMcUJQUW14MEVackkrKzlSZEZRMUdYYVRtdTVnU29D?=
 =?utf-8?Q?IkwbMj7SlsM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVVYZDU4cXVWUWFNYzdFZ1hzN29JYlhJdmlEVEh1NUtBSFhqNDZ0ZmhWSFRv?=
 =?utf-8?B?RHFselVPTTFrdlpGNXJ2ZEl4c1pUSzR0ZWZ3eTR4dkd3VzJ1dGo0Y00va2p4?=
 =?utf-8?B?cE90YWc5eWdhdnFmUCtpbVZBci9IcDZVSm92eXlVaWh2VWRCTWRMdEVsWmNm?=
 =?utf-8?B?K3R6TXBxdU9zSy96M2dmb0Jwbnk1TzBlelRQQU1NRnRhT0N2WUtoQlE0STNS?=
 =?utf-8?B?MHBPblM2L0d3Vzl5Y2lESnNyM2dIclFwSkVqN0thb2JGOE9XKzkwUlRyZVdB?=
 =?utf-8?B?ZHU1MlZGenk4WVNTVGcraldieFRHS0hNb0dVWm1Uc2lqbDh2aitFVDA0c1Jl?=
 =?utf-8?B?NzlzRlRzS1hDTjcxRVhjVUIvZFRyZy92Z0haWjlLY3pBVmFZNlB0djhrVlAr?=
 =?utf-8?B?MFg1Vis3ZmJVTnBTSTcxKzRSTmJUeVYwaEJEdk1pNSt6L0R0NTVWSlpvZ1VP?=
 =?utf-8?B?RXZKUjBaVGh5dkVnOWZKUEFZR2U2TjBqT2lmSEFLR1BCd3JyUkhsYm1rZ3h0?=
 =?utf-8?B?M1hna285TW45aDNOUjZJSW01Z1BGVTR5dWRXKzJSYXJvWDIwbXhoYUNPL1JH?=
 =?utf-8?B?M01JT3QwKzdiS3NZRU85dlNnYVVWYTFDb0tYdDRHNENreVdhVElUSUtiUHFK?=
 =?utf-8?B?OWpLSjgrK0U0VnZlZjVnTnZLUHFBZGNNYWtMQXpxZkN3b3d0SnFUTU9UTkZT?=
 =?utf-8?B?YXlXZmhqenJkbUExOXZmWjU0aUxjUENKSXZ1N3FqVTBQMVlUQUpyN29mVEQz?=
 =?utf-8?B?ZXBBN0dQTFRUNmZSczdFOTFjcTllR21WRkx5MDNFeTJiWDFEcjd3ZS9BdFNS?=
 =?utf-8?B?K05tcEx1RjAweTBQZ2RXdWp5YlBvRTZRMHNwL2hDeGxGMnRXc25oK0RBWVlN?=
 =?utf-8?B?U0JNZHZBT0lseTF1ZEJJekxEZjhRcEFFVkVRdHlNY1BOT1pXM3k2MzhxaHZN?=
 =?utf-8?B?bFVIaDl4S0laU1phOGNxREY1N25Wb2lZRzR5V2cxQWxHUlNiYi9LZDJReDVr?=
 =?utf-8?B?YmtkaHBHN1o2SnVhTUhKcnJBbVVGSnY3RFhicW9vWUdMcjdPc3BKcHRndTJB?=
 =?utf-8?B?RXNnTmdVL2dETG1PUXlnSklCdWRheUY3ODhPYno4ejZGMWkwdUkrVUtuRE5h?=
 =?utf-8?B?Ukg2S28xMFRoTjFLOUloZStUMitEZVF2V1BPSlVjaGxUTUM2OXd1bHo5R3V3?=
 =?utf-8?B?dzhGSXV5UUQrVW56aHdxb0Jkc3FVV1NFbUNOc2NJTmNEOFcvY2RETi9UTzFp?=
 =?utf-8?B?bDlBNEJwNDBJclVTeVFrbUpCRFgwUGFYditISEFVeEgyeDNTU3o5ZWhQTGI4?=
 =?utf-8?B?UktFZmhVM3FQd0xlR2tZaHlNRHRiTkpyR2Nsek9RUERoRVJ5Z1VzaDArRmlp?=
 =?utf-8?B?all2djFvWUozVTFVWEtxTVV6bXJPT2hVdnlsYXdDdkNYV0h3VWxYTERRUzdW?=
 =?utf-8?B?bzVBSFkxaEE2TUFLdHl5a1lIWnpvbGhjMVJ5NDE5eVZjaGYvUUE1bUx0UllK?=
 =?utf-8?B?SDhhWFkremtXTUVFUGxFYm1LNDZmanVYU1BUK3JyZnFVSExKK2tvNlMrb3dq?=
 =?utf-8?B?aUxNUnV6N1d5SjRjcUU5SVlEdm4vNkowNncvRlRmZ0xPWnRhQ3NkSGFodHRv?=
 =?utf-8?B?cVh6aXN4NUNLVVlvcXdvb2N3aGg0Y1RHRVVRTEgxdWZ0ay9XS1FBSFBIVk5n?=
 =?utf-8?B?ZTZlQXU4b21KaUFNdXE5ajdzSFl3Ynk4SGp5d0NQSFNJMlp5Y2J4N09oNkFF?=
 =?utf-8?B?OHdHVnJPSG1IM3ZnbCtsYXpjZVVVci9nS3NKYWxVRVRBS0tzbE9PblpCMWhn?=
 =?utf-8?B?cUh3WGd0WTJXQ0lSbHVPM20wTVJCMERaZmwrNGJ6cmMwSGdjNStHQ016U3R1?=
 =?utf-8?B?Q1h1Y1cvQkEvREFsYm8xRnhiTjJ6blRZd3Z0c3VNUkM3WjdpdTEySHZpUzBQ?=
 =?utf-8?B?WnFNZ1JHWktZWnVmU241dlRxZkNCbWV1dElocE5jRnk2ZVAvWElQUWROVmFn?=
 =?utf-8?B?QTE4TmlnVFpoVjNrTnBrSW1ZaTh1UXd3TE96OEVVenJXT0R2bzNKVEhOaDlF?=
 =?utf-8?B?YkZjZkZFd1pUdldaWmdHZ3p4MVh6N3Axa0hHYkgzRGZKd3pheWp3dWU5M2tM?=
 =?utf-8?B?QjY5Q1MyMXVIMDJzNjBHL1hMcjhoTEEwYXpUUzZ0U2JVRnlzMGtHUWowaUo1?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mVMwiYQa8H+FSD5VjEc+iEk2GWKH5ON6vtPUTjcQFkmdnyD2N6ZoWU86mrUesb4m9ep9VnxoO5IXx6H2bCiW7b+6qkdCrkLEjUTBhLx1Dp9maZCtHtJkMjHBB73Ur/b88Yeg7QnyJ2m/URzy+waKuj2m0SQj+glFeglvmM1Qz9fdxYLgXM8qbyIlLhIIQa2UXW1vYuA+D0l18JsEhrb98T8GbJ7IyrYEMYix4ZdowDCisO1PPfE//mmyeX93EaT5C1S0uJyzsJ/XUhArDNrjWqKZ7tJ93FLlsCVffBPPqmap/KN6qF5MqTUJb/FHZ1eEKHZpDHZyaenD++qh15RLcgZzgujeyau1vGjLIbkLH8fUo4BPqmJyKztUwTQpdm064N83xKnrpHP2wLuSWUy8T6bmnljto3vn3acrTHwiOsbnBgfVaiyYaLIWPhoIiSnAMSBq5feRhaWSg6QK0w/5SO2vGHI2ECy5g2EqAsWZgLHxeqH9mHTu/bAqIv0g99WSH6HniqEhAxFHFlBicWQacIEKIQ/okBZMcUNAKYStty9ZbWjNwIrgV4mUztu0ehPT8lxOsUNx/cLFeyNOLFxYB9mlFDtAxI2c4Or+N1hIP6w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b8eea2-f79b-41df-8797-08ddae538c08
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 10:33:21.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djm++xdZZLV9C2v43qt1ehlHT8aFnys+7Y6ChSNVcMU6jxZMOqBejaB31X8fcD2JxjIRXTHv34sxMXrcUwCngEWVVL8bj4Ej7nC2RKl2k24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7109
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_04,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506180090
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4OSBTYWx0ZWRfX2NjYDikqvbE+ 5+biQqnQOrxa8L+ODn+JmYzNm46UpxSclcXesbqyGYREUPuZHEQsE3qaJUGsH+O77U4dQfkZFNw LheCT5hrhvZ+JKOBWCLyz1LURhE/eenzYoaUNjItjE93mTyu0ccnsGAHS4zlPPOGvfj+SHoUPrg
 FxMOMIoo794zONB7g0JOFLZkPvQW/LWaCnF5BRBZNfgo6xlevSKiRphVoObwtJ3/z8ghHXv8XAg +5KlkxS0lbCTPrCGSGZw0CLuNQ3Rnf/rzdmGwapJKom8PRwmmk3ZYPH7eUeO3Rs40YhCycLCRu9 erf85Qdu3zwwK4oXKm0R7cQYaFIt6Xoc2ZpjwDFQlLiYtzpjfOiB2gLIamBFL/5bx+ZLt8cJz6A
 KMZMZ2ZR+QjJYybqcMwpF7mNwtllNnZx7sZ2aVCw+X58C2HZkxKhyYyLckgUb6U3HhivgRGQ
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=685295f5 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=ij9mWgLeLmdo_eutDekA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: m6C-vLxz5zYt4SLs3_ORsf1baUe9X1Xp
X-Proofpoint-ORIG-GUID: m6C-vLxz5zYt4SLs3_ORsf1baUe9X1Xp

On Wed, Jun 18, 2025 at 06:11:26PM +0800, Barry Song wrote:
[sip]
> > ----8<----
> > From 1ffcaea75ebdaffe15805386f6d7733883d265a5 Mon Sep 17 00:00:00 2001
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Date: Tue, 17 Jun 2025 14:35:13 +0100
> > Subject: [PATCH] mm/madvise: avoid any chance of uninitialised pointer deref
> >
> > If we were to extend madvise() to support more operations under VMA lock,
> > we could potentially dereference prev to uninitialised state in
> > madvise_update_vma().
> >
> > Avoid this by explicitly setting prev to vma before invoking the visit()
> > function.
> >
> > This has no impact on behaviour, as all visitors compatible with a VMA lock
> > do not require prev to be set to the previous VMA and at any rate we only
> > examine a single VMA in VMA lock mode.
> >
> > Reported-by: Lance Yang <ioworker0@gmail.com>
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  mm/madvise.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index efe5d64e1175..0970623a0e98 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -1333,6 +1333,8 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
> >                 return madvise_guard_remove(vma, prev, start, end);
> >         }
> >
> > +       /* We cannot provide prev in this lock mode. */
> > +       VM_WARN_ON_ONCE(arg->lock_mode == MADVISE_VMA_READ_LOCK);
>
> Thanks, Lorenzo.
> Do we even reach this point for MADVISE_MMAP_READ_LOCK cases?
> madvise_update_vma() attempts to merge or split VMAs—wouldn't that be
> a scenario that requires a write lock?

Well we're relying on happening to reach here with the correct lock afaict.

I'm going to be doing some follow-up series to clean all this up!

I'd rather keep this in here for now just to ensure we don't miss some stupidity
here.

Thanks!

>
> The prerequisite for using a VMA read lock is that the operation must
> be safe under an mmap read lock as well.
>
> >         anon_name = anon_vma_name(vma);
> >         anon_vma_name_get(anon_name);
> >         error = madvise_update_vma(vma, prev, start, end, new_flags,
> > @@ -1549,6 +1551,7 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> >         if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
> >                 vma = try_vma_read_lock(mm, madv_behavior, start, end);
> >                 if (vma) {
> > +                       prev = vma;
> >                         error = visit(vma, &prev, start, end, arg);
> >                         vma_end_read(vma);
> >                         return error;
> > --
> > 2.49.0
>
> Thanks
> Barry

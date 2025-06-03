Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF5D27FD5D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944508; cv=fail; b=lZ1wNM7sk91FhfD68BWRkLjaUBtehR9P9R0dNKcw0mJsKYUxeBOm47oVwTGj82Sf/cSjpEtE7DJhkQUWnX6omm09a0iGAny97g2HNzMgwe26BexDJ1bSaTlScTb1wes5Y7bk2YVSctcGn7fM8FBz6KqmzX/O2WBS6xi1AefeGgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944508; c=relaxed/simple;
	bh=nSgPZWDd3x36YkAdhqzAbMlM2bIu34aDnU5ajxGr7wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C9SZ8/4kOSHXUZzXr8CSenIw1vb8t+zc/DU3upo0lgYL+LK1Z4X0PeoLULfGdUC8kGJDe5qOWLP5cMn+ddk5gOg1knYPDEXkDd4aner57vvDfTCAbfYm8G/sUJB7+ZUCg1H8yI0sP0aHKzfJSsqGldPRVkjf8KlR82jWlMjIxHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iPp0awwj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oadNFQMR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iPp0awwj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oadNFQMR"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539rO7J028390;
	Tue, 3 Jun 2025 09:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=99hLKCFlKBlWOj5snj04dznG345ToDO3IDMNXStKfnU=; b=
	iPp0awwjUKWk4CWFRXxt+4znj3R86Y2sMS7C6FDqgK5aGOBLPL611KN7XGhTCSxS
	skEKauBLEURLfVp9lNPD9eMTIZ1zq1KzQ8hmE9aAcGoj1hGhQGbrwHonRgL17540
	yKoHVIWUAmJ9BeELTph54kFTpDgM53U/WHr6Sw7msdJh+FgFj1PYaPqr+iMwozan
	Xmo+Ujj28/qtVvlOHx1y9wLtlLnHa2PWr6FwVFqtxd3lsEe6JrHwxzaQ/Fkj5z/L
	myTksjHs5MszVJnEawwiqf/O9RMDb3/6ZZIijiDFDLrlnynT3JeEr3eN3EZaMInc
	KrGrGSocNSFdSwCr5vxShQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8g9h7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:54:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5539h43e035106;
	Tue, 3 Jun 2025 09:54:39 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79aq5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:54:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zvr1PiT/9D2Nb99nfu3mPjv6/rvJTrpsnbCk1Z7AGaKzcC6u2BHWVsNKLPWE4wx0AqJU+6fymgFCwEkshPoPzWc+8ojvCMe5Id5lfCWp1lxRodJ4ncAqeIpZox4g3raOStWwzPx5oZHns7LMFkNdWiKkZs2FOvjXeX1Gi63RY/p0YBfKEFb7jK/o9VpxAfIGQtdGH5g5Rcg8SISDvnF0ifbRDFeIjj5UmPC6VfoXSJq4JzmQyMaheBpzyFF6S3VPkpmclk/EQ/h9jPCMrU0ITYkL2DAe8IjEaL+swjkByGCI8tgx6wXviCyixKFg+KHQCx/aRsGb9ME2QvYdt8ZWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99hLKCFlKBlWOj5snj04dznG345ToDO3IDMNXStKfnU=;
 b=hQWY/r5ZME3rU2VjM4xwA95fJa3LTuAs4W8iRAn0Es0kUtqM9rLKEShrIVHc6vVcty9BgLCQ73fFvYLtKOb/lRlf08gw2rtCFlYMzc5XVbZThsK4rx8jZvULBaGArzD50uEUUdHZtA1AImF5cA1gcIBs9ayx65ySfwUF5wzOYPXf55tUohTrTHmkN08ZFJd303+g/h2VDHURXb1fyCWcORU9W2Km1TalSxYh1YMx2qIFcKX0EKVzMn646qOentERE279mJxiZrfr2h9pXz3M7TBs6+a6sGYTEJKDv505Bt2ENrpf/q3vuAc9c4THUTENPr1CI4PHvpYsYBGKCcG8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99hLKCFlKBlWOj5snj04dznG345ToDO3IDMNXStKfnU=;
 b=oadNFQMRKpyPK0dZeIYoiHGlmRmu0utixF0asezKy8MOm6okxzb/2aYfvpnqx5/BmlZT3Weg/yVwH/lwgsXbxELp80xOWVJfg24ZIzTr6vrQ2TsRwcMTWltodITqCMnZmDGJviGuRO9rCO8/MKS8y8N+CZo++biJX0uHDjFJvlU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB5078.namprd10.prod.outlook.com (2603:10b6:408:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 09:54:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 09:54:36 +0000
Date: Tue, 3 Jun 2025 10:54:33 +0100
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
Message-ID: <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: 652bc026-f4d2-48c7-f3ca-08dda284a66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmY1ekZFZ05jR0g5ZVo0K2xSbG1hSS80N1JPbEFZOEIvc2xPWEZ4Z1prRXBj?=
 =?utf-8?B?S2g2Y1hUVjZ2a1dTcVcwR1EyMmFITStYbTRzRk1HSk04cWNwdkYzRXA3dDNR?=
 =?utf-8?B?S2xsZkpMYnk3UWEvNHFIVWpJdHhSU1BWZHlmSUR5NWxvRno2aXM3aXY1UnVa?=
 =?utf-8?B?ZkdDdStZUDJHK1F5Y0lhWFJzNFc5MlRqV0lkMTdxRmc5R2hPaGtsdXdXWEVI?=
 =?utf-8?B?c1NhZVg3bURnQTE2V3J2aWZPNzFhWE5acGJNVW8wSlVsMllEeklTc2w2bkpV?=
 =?utf-8?B?alovODZpeUczRmZqa1ZwL1hhbzhHaFRVdnNaWUxmejFTN0FmOVFsRTlCOHpY?=
 =?utf-8?B?clVpRXdmUGRIdmV6TzVzSy84UmRqV2JubnB1YmtrMWtWakZoSUxSVWdJbWt1?=
 =?utf-8?B?b3dqazNldXdVblErUXppWVQydWV3VFdIRGF4cUM0UUMyZ0k4R043aWxRZzZD?=
 =?utf-8?B?U21Ed1NFZEtoOFJwaWZ3cjhuS1Z0ZDVlS3E2K2RmZUFzOHZYWHpKVkRUUmhu?=
 =?utf-8?B?UU1yN2ozS0ptUURIeWhCRm41Q21EY3NBdkpQeExXRHg3UTBadTNQaGlWMXlj?=
 =?utf-8?B?K2NDVmhUR0EvYlROVVFPcUFlUENUUHdpMkkxMWM0OEdzaFA5dFd4UDdPZk1R?=
 =?utf-8?B?VUVPYngxRlc3Ry9CN2phSklDaXFQTzRkR2NuSGVqQjNjM0FJeHBSNEpCVWRB?=
 =?utf-8?B?ZFREQkM0aitmSk1HUzFzUlFYTXhYbnVheHdZRXhmZnA0blpFSHcxRkVhKzhy?=
 =?utf-8?B?VDMrOVVnbDdHeXh5VUFLM3ZmelduWkxCWkREN2V4Z05KVFFNVzhWbnVQa251?=
 =?utf-8?B?aEF2M2VQSTFiMHRuWHRBNWh3dE5EWEd2dG5iNVN1bDc1TlhqVWZEbGFOS3pM?=
 =?utf-8?B?NTJSMmRsdHBEbmIvbUo2RUgwZXI4azJxOG90TXhLdDhOc1hPSWZDamFEMEY1?=
 =?utf-8?B?MDVQZkRRNEVWcWpESUJmd3VvdldaOXJWN3lybFBIa2x6QnVldFBTRGR3ZG1i?=
 =?utf-8?B?QndrcDl0OWZ5c3d6akhzRm1kZUlkUUhkNlJUYndUVlErZ2NVSno5bEYwTXVX?=
 =?utf-8?B?SDBEYXRpdUdSbkFnV0VKWHB1MlZkbzNndTBsbTNHK0dyc0tNem9rY3c2OWcx?=
 =?utf-8?B?YXV0NnJtbnRkNVZSaVpYSm9SNzlDS1czaGlpaTN4NTVMVE1tYmZvTERySng5?=
 =?utf-8?B?SS9RNm11S0VBV2lkakp3VE9ETlBhVzBOeHhVYjZJMHQwYXF5STRuM1dMWHJF?=
 =?utf-8?B?Ni9SNXNqRVNvYXM3aFNRS2I5eUZ3WGl1MmcvRXhWRkJvUXhtdmgyY1h3emFJ?=
 =?utf-8?B?R1VYbmptNW94ZjRRLzJvb2djNDhGbHNTTmgwUWVhVGJERWg1eGtSWm5ZcGhG?=
 =?utf-8?B?QWplSjRrR0oxWllkd3MzN0YyQzZ3bTRQSWRoS01lMnNPK2JkbmUvdVFoS2E2?=
 =?utf-8?B?Z3VydWdDaEIwaXdibjBQOElsemhITUZ3dTBHdExaRDZRVHBzTWN0a3JTb2xm?=
 =?utf-8?B?NVdFeTArTm1hS09XQjVBVXBLTVZXNWl3N0hHMVRLeW1YT3NrMWxsalI2UU1F?=
 =?utf-8?B?VWY5UTVOalhuK3RKamNYTUNOUDJjWTJFNFM5YS82Y2RKNzZ2dU5YRXk3K2t1?=
 =?utf-8?B?Yk9UOVlnUjdoS1orcU1kOTRSV0RSNEtQSXArdDVXcFZhYkFncTdMQmdtR2dq?=
 =?utf-8?B?UU5TT0JKa0Jnd3E5NFg3TWVqT3JMRlFDWS9HOHFkakRIckpJRGszSnBqemJm?=
 =?utf-8?B?TkhxUnZlZUVaQmRtbGhNZklSa2E2T1hNcS9kT2ZlaE0vUmVRRFBuQnE5MWVk?=
 =?utf-8?B?UFhQMVkrQUNwemJhMjBYNmNVai9GMEFNUlZNNEc0aGNkWjRGUkZkSHRNK0p4?=
 =?utf-8?B?Skp3dTFFOWlDdWFKa2IzaENsNWJTckpyNTRSbXlCU0pSejJDWmF2bHhESVUx?=
 =?utf-8?Q?d/1X42K3TbE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkNFZWdraGVqN1hIbDNtKzM3VEk3dGhPeWhwa0tVYzhmYXFwbFNnOUN4UDlk?=
 =?utf-8?B?V0JnRnNMKzhLcTFEUUNQRnczUEVFT0ZHSEordnViWVhERDl0d2pYSG5NWXZh?=
 =?utf-8?B?NW5vRkFjVmxuYVViYjV3d0NsYjd6MUhtZXdpc2FCc0FTWUFXSGp3VytPS0Yw?=
 =?utf-8?B?L3lVY3JudjN0aDN5MFozOXIxZjNZaWNqV3V6QjZ4L2dSSStVNUZCQkJvcldy?=
 =?utf-8?B?aUVhQTErWFpTWGxpdFBJSGllMUN2ZS93czBFSmxZZXJwc04yRWRHZS9kalQ1?=
 =?utf-8?B?T3RQdExUNHFrdnp1UjdpTHZlTUtjRDRvamsyTWIxUHVRZU5FWmI2UFhLTlN1?=
 =?utf-8?B?YUhYaEZDQ2k0eFdzcWZjb28ySG4rQkF0VEI4cDhzY25JeThuWXZoeEppUnZT?=
 =?utf-8?B?SldINjhKTjVHZjBJWjdWcTBVWWEwQXorKzMwcHJ4M2tDOTdrd1V4QnlLNXV6?=
 =?utf-8?B?MGNPU0t6MTVXZ3pGWDl0aHpvNXdTSkllYmR0ZC9iZzNlcU5SV1RwMHlDNmdW?=
 =?utf-8?B?czJiZlNjTTZkcDd3dklQQ1B5WGpmTUpmN04wOTAyS2RFbDVGeTVpZjlyblhy?=
 =?utf-8?B?bmpiNG1vY1RCOCtHZ3hITjdCUVlIVGhycER6TUJUVGlmSVo5b2JtR2xRckRR?=
 =?utf-8?B?Z2Q3a3F6WUhSakJUNytvdk1FcXNDZUk0cStocDNORFVsclJvUzVaMWRTWGpx?=
 =?utf-8?B?V290SzA0a0RvYTl5d1V0Z2pRZ1lvdUFCRjFmNi9wT3d1SmU4b1lhaitHTTBD?=
 =?utf-8?B?dnNENE1wbEM3czZ1N1VvemhuVi9JSnRKb3g2NUJhUU0vV0JzR2dWWFlNWlAz?=
 =?utf-8?B?NkkyNklRTTFWQU55dEJkZzVjbVR6Z2JpeVJqNVhUVENpN1dqU2R2cUM5dmZa?=
 =?utf-8?B?L0tKOXNhaytDT1k3YlRoR2ZMSFkzTXlReG0yQ1BrQkw4SlVlQm9xdTJicThx?=
 =?utf-8?B?WGJLclViZDB4blYyRWw2UGwwbWUyc3JjM2puQmFRbUlyZ2ZvTXd4UkNCNXk1?=
 =?utf-8?B?Tzc5a1lPQmgzMG11RVJqcHZuSzd5VnY2K25KTkdGcGlIN2E5TUlIVjBhYWZM?=
 =?utf-8?B?K2NQUEV3b1FmZDNpaFFRQWdmck5RU3pnWTZ2Z2U1YXdQWkJBQVZWYU9lMEZW?=
 =?utf-8?B?Y0lYU2RvVFpZUXNwazNMb3FjLy9KelVxWStCcHRUWnFRS2RXM2dGV2oxcHg0?=
 =?utf-8?B?RldJRmxOVENpWEhZVlZoVEorWjJtRk15UUpidktFS1ZCUXhwNXdFVlVFVmsy?=
 =?utf-8?B?S0M2QmV5NWg1V2dLcXE0a2FEN3llZEd0U3Q2d3p6WFVIbkV3dFY5dHV5Vy9u?=
 =?utf-8?B?YVg1Yno4MWdIUEs0SzgrYVFtbGZYTGtEa05pcDhEN3dlM09meHhNN214d1ox?=
 =?utf-8?B?dEJuUGNTZmdRM3ZlWHhUZnhUcjR2clpFM2pGVGpzRHM4N29KU3k2R3VnMWVo?=
 =?utf-8?B?V2hDYmkwTVQ5QnVnb1E4dEd6SVRIOW9nTnltRitZMDluMm5SMlRJWk5kcTJ1?=
 =?utf-8?B?Vzl4NlpxWVJ4VUFhQkVjUVJPY2hGc3pIdDF1bU9ycTlGT21YQW1XWlcvSm5R?=
 =?utf-8?B?UmgvdVV5NG5MbGlHSnNsSmZyWHdFbjV3aTdzY1NydHowRHJlcldQR05xZjU3?=
 =?utf-8?B?ang1Y0lnY3dlM255czNqcGVRYVlCUTkvTkRkczY1WXhHaE51djVkVWswcEx6?=
 =?utf-8?B?RnF6cTgzZlduYnphbkpnOHNIRlF0WjdqZ3VoS3F5NTl6cldtbjRscjV2d1pV?=
 =?utf-8?B?ZHo4b20vaEw0R3pIMnJpMC9EUjZaNUpqVmY3eEc2YloyNUo3RzIyYStwK0cv?=
 =?utf-8?B?UElGRGlpbnVNUGJNNjgzQTF2QmhKUndobFZUdjRaWHVCSFVYU3g4Y25xMVpY?=
 =?utf-8?B?bjdBaklyL1d5dHJtR3VsNmxxaEM1a2xaeGJ5WWEvVG9wOHNNa2lZaW9CS2RY?=
 =?utf-8?B?K1VQNGE4aGNRQnIxVkkxSjZRaXE4THJJRkFodXdEMnc3TUZZYjFsSUJBbG9O?=
 =?utf-8?B?MlZHZXBZWTU3SmdVY3dNa1FzTERlU0ZaUUxzV1hXL2c1WDJrbXRHNmErUHFs?=
 =?utf-8?B?MGtLRlY5QXZQbEZSMzFJaXNYTEY1QmRGUFFTeG1wdmZzRVp6RDM0N3NSa0kr?=
 =?utf-8?B?NDNhYzVXMU5wcTlyNzVsWnZma2xpbnVuc1N3UVJ1S1lQVEpMWERMUVdOWG9R?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WPUDtXcHgb3MeDrcS0S0iRvx0Ch+2nC24JA8LVV0jaV8EIXwCI8VON66Gw7Egh1pNqtDkjuxy+mkuLCtZTiQbtzsNJgmaYLvWsVA/bKhGjZ2Dnl3H+R4bqbgYMVX4smKCBbrmjBrU6JCWX3yj8WQvomnE0vNHa4WpJ+oJBDG/OHrlVrpflDpoRv9y4C34xJMz3aSHPISwf6xdN15PlTkI+VxelNILmd6/1oWdLpDXt0KkTJBV2mb2Hif0qC639ZTiy99xWxL8je0+iqEVZnRoJALYScSFTY10chWXLs2zswMZYFNZmefAuiPWRu2T4g/AfestvoUZ8gucbfeTAyIA8yh/dxztlZQuFsDZ+iX6WyPsDheQ0yUFRw2wFDVJsc5R090QXF33qbIN3DGO5mLazEyfuq8wl68aV5t8y6GHo2+9X9dsLdsECONRPjPVxXAhgNcVv/6mUn02f3xs8/Ny6GnmMryQqrWBWakuynxAzrBbbRE7rcC6iG+18WleX/kzjwzDlt643Pipu9oX0aGNiHWWZZYrWQwPkZg1RdMhXTNb3H9/fUEMhF7Cv2dsIFd5i4U1a8qUJ2FxifwSsmH0Xq/ZzBQji6E8rkyy3A1bF8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652bc026-f4d2-48c7-f3ca-08dda284a66e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:54:36.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHKNCeR5EKz1dWD24t3ms8LSF/pQ2JCLeaqSscSO7BD6QSgnnWxN/fUplnqpw2PiUjXu52DtsiT7ksWN7NN8Hz2eDM4v8lzB8sOW5M5FdpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=782
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030086
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4NiBTYWx0ZWRfX+XzYKj56hDpN YtVOoNhPzMcn0c7FGqRne39Tsfn5OOE218XstTthniub7ogqNmDa3oE5Ac9fo5cV8gyWosfRXgY 9UGgZo0Ul2UpOdxZI1xChtisVP2xb3YgfK+q76WBk7Fhuq4g6L+mfZB8a/dlbxO6WHLF9Qg1XzY
 CZmWUdmTCWAPoJOOV6zyS87Fk8ox0/KznBBKvXoPm0l++bSUIR3RKwQPrsqg0jwVrYGZFJqvJpn PI5YoOP7vXSuK+Lt1SMFVcM6afwQsnWM91TD+k8qI8RdABJjlEHmjO11FfE95S/0mRauVbmfJhN 55UxKVJLvW96kr/EeCYAR3fx10RBAmIb+0QBrzY/4oF57tIf011up0UuXhd7QLs2qFDaq2W8NFR
 iSUCkyF4o8cOgYGKw3yAyRt50J59LJ+2EVZn7WbifzJv+7xjdfrewNOMs+58QQWUoOupS0v8
X-Proofpoint-GUID: cRCeU98fQ54xm0X72QOyxxZ--BhYp3ho
X-Proofpoint-ORIG-GUID: cRCeU98fQ54xm0X72QOyxxZ--BhYp3ho
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=683ec660 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=NdVtgRisZG9A-yalZkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On Tue, Jun 03, 2025 at 03:24:28PM +0800, Qi Zheng wrote:
> Hi Jann,
>
> On 5/30/25 10:06 PM, Jann Horn wrote:
> > On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
> > > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > > frequently than other madvise options, particularly in native and Java
> > > heaps for dynamic memory management.
> > >
> > > Currently, the mmap_lock is always held during these operations, even when
> > > unnecessary. This causes lock contention and can lead to severe priority
> > > inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> > > hold the lock and block higher-priority threads.
> > >
> > > This patch enables the use of per-VMA locks when the advised range lies
> > > entirely within a single VMA, avoiding the need for full VMA traversal. In
> > > practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
> > >
> > > Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> > > benefits from this per-VMA lock optimization. After extended runtime,
> > > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> > > only 1,231 fell back to mmap_lock.
> > >
> > > To simplify handling, the implementation falls back to the standard
> > > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> > > userfaultfd_remove().
> >
> > One important quirk of this is that it can, from what I can see, cause
> > freeing of page tables (through pt_reclaim) without holding the mmap
> > lock at all:
> >
> > do_madvise [behavior=MADV_DONTNEED]
> >    madvise_lock
> >      lock_vma_under_rcu
> >    madvise_do_behavior
> >      madvise_single_locked_vma
> >        madvise_vma_behavior
> >          madvise_dontneed_free
> >            madvise_dontneed_single_vma
> >              zap_page_range_single_batched [.reclaim_pt = true]
> >                unmap_single_vma
> >                  unmap_page_range
> >                    zap_p4d_range
> >                      zap_pud_range
> >                        zap_pmd_range
> >                          zap_pte_range
> >                            try_get_and_clear_pmd
> >                            free_pte
> >
> > This clashes with the assumption in walk_page_range_novma() that
> > holding the mmap lock in write mode is sufficient to prevent
> > concurrent page table freeing, so it can probably lead to page table
> > UAF through the ptdump interface (see ptdump_walk_pgd()).
>
> Maybe not? The PTE page is freed via RCU in zap_pte_range(), so in the
> following case:
>
> cpu 0				cpu 1
>
> ptdump_walk_pgd
> --> walk_pte_range
>     --> pte_offset_map (hold RCU read lock)
> 				zap_pte_range
> 				--> free_pte (via RCU)
>         walk_pte_range_inner
>         --> ptdump_pte_entry (the PTE page is not freed at this time)
>
> IIUC, there is no UAF issue here?
>
> If I missed anything please let me know.
>
> Thanks,
> Qi
>
>

I forgot about that interesting placement of RCU lock acquisition :) I will
obviously let Jann come back to you on this, but I wonder if I need to
update the doc to reflect this actually.

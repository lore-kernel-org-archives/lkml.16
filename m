Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B33619AD70
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603697; cv=fail; b=tS4w4culfB1dCuA7gV+mK4G5Wawl06sRQeJ6b5UolDA1jwQDRrGMlSkLYOUVULV4gblvyoBNdW8zwF/x7lsVGhDY+rvrUcU6xdh9rLf9iBT2YqPv1wXYP2bQ89Nzqwd2lENossBVzn2dSE8Zrhw2PL7+Q8RsUBnXYQ/pvkHG0zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603697; c=relaxed/simple;
	bh=HkpkEW/P12jkQn6wjP/15122bTZ2m/f+rTKV5rZ4ris=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L3j0nlJrkqwnM0AnXxkjOo4cpMsw8m304eFBABt0cD76h/+qO9t01jXXT8U8Vn7gFJUs/g0QaXYBlCFS2jj4fsPZBkkbYYG+EKMSSrYFLrlI73lDE7AHPsgenoG98+MvI6gCddyj47VIBPmjHFoK66/YiQpObaqMQ8JU2nu7ZZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p6ApJPox; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ns07iXdi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p6ApJPox";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ns07iXdi"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAt1vY005005;
	Fri, 30 May 2025 11:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vLqng+x8Fa+UPr/ZKu
	7BkxGdcJCzORYk2NEFJIK+wLg=; b=p6ApJPox0ThvACgv+8qzVWCrPpRKjBDWbg
	1KccbHBskERwdeotOsJ6z5Felwj1Ut09HvDzqHZHpGFxtdEO6T9SSDlzZ49gQk7r
	xR+RkL42mb7r44Lgmy0txK2/7nWlq40+FMDo4LlRcOPns82/yt9yWGcZ9NVaK6Uq
	ieMM3vLBrTkku/XZBRzidRX3OsEjb3WC4XbqyP7tWAV7ya9BsfU1KuheY+Ki5UcU
	+MaC0/M/nm8WrdEc5u8eQKErPV0XHS4mrr88Nr/my4FJFgP+fDQvl3d2Lche3pTc
	2cRDE+2+sJugadGfM4ea7bqiWrRddlxoIVhOtpjvOc4r7Km46CfA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pd9tg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 11:14:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAKBmd025680;
	Fri, 30 May 2025 11:14:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jkdj7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 11:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0Wh8P9oX7ngkcTKkUpxgkr8mRFidrSKBNc4J6jHKVwZv5eR5t1PE/KusoP7wcaXw22QFnw6GCv7c2/42mEDw1vIE6EPXbZjoRvyPWwh7lvSp1pyPYWaKGiokvxoQZAYWzkeqTOkFdW6MSyfplpAU7D14YceQEnNm+4rjzRNNGgT+pWcpA1EAr3jukX/EoytJ2MP/sCF1Y6B3btSQRL0uZEp7DVZdqvqk2+TTZ+Mlu6/5Do70lKNj+oMZbqEi6D3fVsreDa8H8++LCgIVnNv9MoZXLNpwdttdDcvhflWzlS3DADNzqWrk8mAJgyEM0AeGkhKgMNP3MZOlWQlxo3ISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLqng+x8Fa+UPr/ZKu7BkxGdcJCzORYk2NEFJIK+wLg=;
 b=wrAGuaCY8yGVhHgaWH83HMSy5PZNv1QJYLVPWH1HiaIg/30Hrq0NhuOI7+kyCWxY6OoKzqoUgnITBuFceNcZRD5bmXv2qQNrtRLO3tbNhPoI+CMZOAsfEHXfzalIVfHtIUlpvPXnNoJjwr6QoRC0SvvjYyTCW4/teaG8ixueljepgKqjNUhhndRLHrDiCY7hWTDw24g5YvXxksRJ8tov6q8Wv3G7pdshG1rmpb8fG68mLFxUB8g0X/jxVJ/0qfkT9qWg2HRna0TdIqUoM9W7R10PS2LAGQoMwjpAoTilvhODcKWZL/jkkRMsmt6B6VjyuHMKQbIkPNqgSAymarFg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLqng+x8Fa+UPr/ZKu7BkxGdcJCzORYk2NEFJIK+wLg=;
 b=ns07iXdiN9OrnSZz+hYHC2X0F2qv7Qw3wtSK2qLUTbQ4YZQXAPSz2L5vV1rzEjd2m4teBBS62Gb1jDAfKM0jLcxnep1tQ1iO6W7OdwVFyXAHfVbc/JWZZdU+Wpk46myvMxGrC66IWWySE5+G4LTj7p/KjkPJEFqD7Yy/3F03xDA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB7691.namprd10.prod.outlook.com (2603:10b6:a03:51a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 30 May
 2025 11:14:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 11:14:33 +0000
Date: Fri, 30 May 2025 12:14:31 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
        will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] mm/pagewalk: Add pre/post_pte_table callback for
 lazy MMU on arm64
Message-ID: <7b4360a0-42ef-45ab-9e63-eace52943529@lucifer.local>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-4-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530090407.19237-4-dev.jain@arm.com>
X-ClientProxiedBy: LO4P265CA0272.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df462ed-a886-4d22-7221-08dd9f6b27af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XhEJc5GviLopTXBn3Bi3QfDovO6xyWO0ODfXOUKB6hwRWtGpBtrvL84TfDrt?=
 =?us-ascii?Q?QziJfMzDUXldrLWKA4tiEwyvmHkobLN7WrfzmtS3NKOZ7MLOVJqa/OjR3gaI?=
 =?us-ascii?Q?IfAXSLmGmy8G7kGCLvRGIp61ucf+cayQQlzyoMBVEzpLh2nDCvPoZDx7v/Ak?=
 =?us-ascii?Q?1YFvrYwqKlwquMyYxjWFuzPbDFcW/50UefWUQMKDdIZYnejZuUc7JQW0PP8o?=
 =?us-ascii?Q?VbqeV4OvaoazFd+6vDdPtwoayqoF84L0/Xf+R6XZbntxQ20h8Nn5PSDVTCFG?=
 =?us-ascii?Q?AP1AIkGVZ4blO6ghcSvOKOTLxdHebw1iX8Z6D5+u45yzIbYGdv5D2UTJQRfc?=
 =?us-ascii?Q?rcjOsNkPpZ5el/ZvebZTEBrATNra9RBtrbvoadQnSsAhPQKcZi/QhpRIbI1E?=
 =?us-ascii?Q?D5MUahhHyxSZcHIQ3l1ktu76NqgtyUNxO3w///uG72Dg90CHzgzs4OgQ9bUr?=
 =?us-ascii?Q?ws5uj8TgsTmAV3HShpeWuw18v2G7bxjAc0O3LP2b35LvCsqg+9FK2qxoetXW?=
 =?us-ascii?Q?iAwbgOvh442Pb5FElzwgTUkEoioD7sZohrBrx6WX/UdMuEwK6qJC6AppWzK4?=
 =?us-ascii?Q?ukdIA1DBJFz4jM7GgTKSyPI/qrW9N5hFMcaDqUbiqgIB47QqWuH5L/w3IzMh?=
 =?us-ascii?Q?DMfnAEfR1GlhV//gCtQVGSNbNe7NgPypnWH7Y8sH01jTLq8C9l/9aA245CuE?=
 =?us-ascii?Q?8TentkUth2DSil0isw+w4iyGaikg0mg01tlJDcEJC/4ki4YBQtrYHSmCl/fz?=
 =?us-ascii?Q?3JwhZpC3xMJM5ZV/tDW3omDUu3A5g/Ycf/RuGnJH03l29wFcLoGp4C39WlKc?=
 =?us-ascii?Q?e2wX+saNJ6plNFAPSGZFKQADLHYHQPB1L57BjZCxBumn3Sm6kBelixRN+E+6?=
 =?us-ascii?Q?XAv+Q0bF2JfzKOgc2WSnFO553kJ7Szcb79/CPMP0Q9wIUNY4H73VgI6Gioft?=
 =?us-ascii?Q?H+23JVMeqxUXnPky6G95Kfm5TFay3gI0WeRL4NViM0dlr4o91mKSrn3GHdcQ?=
 =?us-ascii?Q?WRrfZ0wlgo88LhOpz0vcljINKdQfwb9APSXEHOALv226iLYlgr9paDMdbLBx?=
 =?us-ascii?Q?U36vcxNc5GRv+SouvW7DyTk/W/KTKbAv1bmeftOQ+sRywVQYYNq8ZSWv7kMF?=
 =?us-ascii?Q?C3K+8l6jQ7QJx5g+KEfvsXONOEDWLqaAqBF8yG+VjYwJIfNPMx2+nIJI6NAg?=
 =?us-ascii?Q?lPKRxHqe/MVhvFf6V+W3cOTGsRxCkByV8BMD6tILyijrcuLqJYqRoW/oj1ru?=
 =?us-ascii?Q?EoB8F0dBScrkxABdmJiMcHgkNxVdiM7Fwr20N4Av3IanM0PTpuu1SwnNurcj?=
 =?us-ascii?Q?cHYg66QfawWNFn2XA/VIlqOR4hXg/zcYsoZdLH7JCejuJRIqNNMQMBHlMBmt?=
 =?us-ascii?Q?UmA2a4dVNhn1eadlsv7mhZFuyItH5s36oWHoW5mFINxHd1IIv3cIGX0YYlcY?=
 =?us-ascii?Q?WvZy3xLNU5o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N1G1aueg/QsAPjlCJYCU3xnmLOqDJvEBBaRziep+b1bRsOyTwfaHOiWnLBR5?=
 =?us-ascii?Q?qsM8OppYexM7CtD/YOr+RVNJLDm4/c9k26RNsYuNubOO5fNdWkjR7t0mVfWr?=
 =?us-ascii?Q?f/AgpBwa99W/zcGFmMckP75aqZWHeiBjI71aFhY3KXdeoAi6jtX8HhgegLx2?=
 =?us-ascii?Q?bM5VPDrWpu9EttSiByAprfG9WofdNuOYBV/cUbx77RGg2W54ekUI2uAfTADq?=
 =?us-ascii?Q?uCQEq25opoEgGc226IBXXMpokaLdVBIammHTHHTsxz2Y561HghR3eWZELlc4?=
 =?us-ascii?Q?dLQEP7YvcinfUJLaVaLA/M2kJ1zYvuksaBGfvARvLCdnxxj2OD4t381iEA/n?=
 =?us-ascii?Q?khvRyNtNYBa1e8vcLYt1dqzEcxXjNPAmDE9JHJeL4XSpMUhELWO2FQKWmOmz?=
 =?us-ascii?Q?m5VR8hUVlXy82EwDfGYwjdkjX5nT/eytBTFmCwDzus4NJz0DcAxZf0Vumm2u?=
 =?us-ascii?Q?DguFLotV0fMXXh+fnMB640vFjmh8GWbtP2h+ahDw1FPobrZkeN79ok4nluA8?=
 =?us-ascii?Q?SEavUJOpeVscvHJ9Y9C+kAMzIXetfI9HTTNpi4zaExLC0GfBloQypyvxJjut?=
 =?us-ascii?Q?9OjUe5lyXlwwRQ9IAbb93jZryidCIGAkLd1mTbD+SpLjH8SPFCCf6eszP2R/?=
 =?us-ascii?Q?DG2IIUBZ85Djy3CbV8mO3kom9TZDreYkUQ8UAYVyYB9vtX05J0fFfDK6Qy33?=
 =?us-ascii?Q?67vmKy0MnRqaOjrZZNLx3iN77Fzm8DHxodicniRAnixMDrIzZwPEWQvYmLeE?=
 =?us-ascii?Q?tug9tSLgTW6szlQW5I8+tRQs/Ahd9vny0CdjTGcjagvJ0VGW+I/B7eCCJoS+?=
 =?us-ascii?Q?ePTS4BhliKQVWNcH7H4CKcb6t9svh0X8jN5dpKEPw17RAQitBKsylg+0ln2P?=
 =?us-ascii?Q?X0cxofg0E4RLTr+gf6ZFlkiHLL6VRbdUiJSfGtzUnQXt/UreC7zKvdkSgPgA?=
 =?us-ascii?Q?SJEDWhSBMXL05u6qnjncSvQldq47mkJRbtOrCDWGnTraSPp3NPSNSQqaMgTw?=
 =?us-ascii?Q?NT3A1fbwn11Hm5ikkqLXnTlhe+Pmh7w8ZNC/++7REM5RzM57PX+7Cb9WOq1y?=
 =?us-ascii?Q?9qgTbB046eKE/juS+YPM3d+M3swniO23Y1/txNnofKgChqL76BowDdY8/0BO?=
 =?us-ascii?Q?JY9LX49mAQ7DJoTxQ2b/i8NJ6aM2pXqerG0z/bEIWRS/rxKWdtL8ARIMNOw4?=
 =?us-ascii?Q?w5Gw0kVR6V/KQo5B/n3+XEWBoEzpLSy2TbvhcljrgBIPRYKVFlc9zaQezddt?=
 =?us-ascii?Q?1McCP4uwBd7pJdd4tvNwy26peIp9F7xL2ADTsp5RCmcqpUlm4cnjjCaDUPEr?=
 =?us-ascii?Q?sSTLIplnhcoyV1eRQWbZYd2zKZRMz2D5a+KARO1JO9m0vY5YTiArD30cwm0p?=
 =?us-ascii?Q?7k+m4OFG2jveqXDnwFBMwsChI+N1BEQ4OBWwm1PYzxTZ7BwH7Jatz0fsezLV?=
 =?us-ascii?Q?qh4VOeIkUTttM31E5Km4Qn16KplUQznVQ7bvmLBaF93hRIgsjXHsJ+BmIdPH?=
 =?us-ascii?Q?Rf/0JofFX3KGOpFPoisg6PJbDsIGx5TJOl1weuWMBF9jJMIJf3CYdjR6r70+?=
 =?us-ascii?Q?UXGavMIPjunFIiI7kccQ+Mn6nsd86F2NR3Y2MpZ9nJhVJBKJNOuQUnooYaZz?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R04Ra5yYQp+aUHguxWMVU5giieaMJs2hqqUOkydjLcWG//gPsglUaD/EdY3D9deUCBpYIs5NSiDsd1K+CY2NYLJFttRgGiYSjBv6nuUa9J9nzwj2vcQds6XNAcmoJVi18zBQSeO8dYeiOBGrvckdS271oM4l3j/R21cP9PAYTsyTg6MrspnAQicbMZ+mgYLMF0+UPpK6F5ViL2Ew4Vn4D7bWErP6mZZUwLkf4LX/oACCUkQgOM65ztfNzWrdn3itVqwbkQtQPyhI/05GCRP+lQ4sFgsfSM05M1wpB8KpEl52JtsEJH1dQvtjq1RQ3xByXChOE+aEPB/J9W1jvoz2Q7vmJPh5c6KNT+1PEhORan0H8E5YS5Rfpk4Akpol9ZsfWfhgZ8XzsWOuMWUHIIaWUt3AyANqgiCQkG3pqgDJULkjw3f7gFAwnWYKHYUux3ho37TXdsOFOG5QWz6LF89byoY0idi9aFBqHy720RANic8aZ6+nArxs8NHb9GNvy05Ne+RVCe12w6STHhuo4jUlNkQPZbIG+Bcg/x9ap6xGz4071chORvTheJRLawnVtNRmUPT/SnGNTn59KOB4yvFApp0dVUsiMeuwvTtTGfi/uDE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df462ed-a886-4d22-7221-08dd9f6b27af
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 11:14:33.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pEOQi8N2UGIQ5R6kSYDWM0jsBVej3bNc2EQWRcb+AbBK2YVERRdUkY84bnOz+tCQgXtLTTGdHZ3U18tCb+aFc3rS/tPnmBVwz1enlJ6W0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7691
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=997 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300097
X-Proofpoint-ORIG-GUID: 7uw4yUUV2EAsgDob3n17OcmtsTtCQkGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5NyBTYWx0ZWRfX04sUwbOSm3cT 9K9xApOuCNooROa7vujUzkjenFt66jVLn/R/jh9GmucRCJQ+YfeaNishm4ZVbAlan7mX0Gq90xF GgDnJda83+lrfsSodQRqp2P22h/0iEav884jeNBPvt1OSe4ZJhdCjPUL8RAhoq0BTqeNkbUtUXt
 gVOt5m8cvdPVVuv+ITBRsAKtrcIlsLmgtv1J6oUQqRvjN9v9mkaZlpr1EXlFjVZWbN6DzAc1XOs HvwSO6BAMo/wDD0i/YpMDAr9avqMtx+zu02nyVJPGPGks44QHTMchOOR5ke3rDq5lM6WCI6ly9z iakXVu5sO3fuZynrST5ehoEhG5yT5xgwLGw5xFgxYHxknCSYbZeoSd82RkpqoJXQxu2gX9Fb9PJ
 3LdyWk2BAPY04dyfgzIJ7xlIK4NugtJLxaO22I+bX0FTtmTfqMcMt8bstzAuvkYbGmkYYcLT
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=6839931d b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=PADozcFKNrlWWUR8ROMA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13207
X-Proofpoint-GUID: 7uw4yUUV2EAsgDob3n17OcmtsTtCQkGv

On Fri, May 30, 2025 at 02:34:07PM +0530, Dev Jain wrote:
> arm64 implements lazy_mmu_mode to allow deferral and batching of barriers
> when updating kernel PTEs, which provides a nice performance boost. arm64
> currently uses apply_to_page_range() to modify kernel PTE permissions,
> which runs inside lazy_mmu_mode. So to prevent a performance regression,
> let's add hooks to walk_page_range_novma() to allow continued use of
> lazy_mmu_mode.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> Credits to Ryan for the patch description.
>
>  arch/arm64/mm/pageattr.c | 12 ++++++++++++
>  include/linux/pagewalk.h |  2 ++
>  mm/pagewalk.c            |  6 ++++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index a5c829c64969..9163324b12a0 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -75,11 +75,23 @@ static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
>  	return 0;
>  }
>
> +static void pte_lazy_mmu_enter(void)
> +{
> +	arch_enter_lazy_mmu_mode();
> +}

Hm am I missing something? I don't see this function or the leave version
defined in arch/arm64?

No do I see __HAVE_ARCH_ENTER_LAZY_MMU_MODE?

> +
> +static void pte_lazy_mmu_leave(void)
> +{
> +	arch_leave_lazy_mmu_mode();
> +}

Are you absolutely sure you will never need to hook this stuff on higher level
page tables?

If this relates to vmalloc, then we do have huge page mappings in vmalloc logic?

> +
>  static const struct mm_walk_ops pageattr_ops = {
>  	.pud_entry	= pageattr_pud_entry,
>  	.pmd_entry	= pageattr_pmd_entry,
>  	.pte_entry	= pageattr_pte_entry,
>  	.walk_lock	= PGWALK_NOLOCK,
> +	.pre_pte_table	= pte_lazy_mmu_enter,
> +	.post_pte_table	= pte_lazy_mmu_leave,

This is kind of horrid really, are we sure the lazy mmu mode is valid for
everything that occurs within the the loop? I suppose it's only simple logic for
the ops->pte_entry stuff.

But it feels like hacking something in for this specific case.

At the same time I don't want to get in the way of an optimisation. We could do
something in ops->pmd_entry, but then we'd not get to turn it off afterwards...

Same for any higher level page table hm.

Is this really the only way to get this? I guess it's not feasible having this
just switched on for the whole operation...

I just fear that we could end up populating these mm_walk_ops with every corner
case thing we think of.

>  };
>
>  bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index 9bc8853ed3de..2157d345974c 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -88,6 +88,8 @@ struct mm_walk_ops {
>  	int (*pre_vma)(unsigned long start, unsigned long end,
>  		       struct mm_walk *walk);
>  	void (*post_vma)(struct mm_walk *walk);
> +	void (*pre_pte_table)(void);
> +	void (*post_pte_table)(void);
>  	int (*install_pte)(unsigned long addr, unsigned long next,
>  			   pte_t *ptep, struct mm_walk *walk);
>  	enum page_walk_lock walk_lock;
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index 9657cf4664b2..a441f5cbbc45 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -33,6 +33,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
>  	const struct mm_walk_ops *ops = walk->ops;
>  	int err = 0;
>
> +	if (walk->ops->pre_pte_table)
> +		walk->ops->pre_pte_table();

NIT: you have 'ops' already, no need for walk-> :)

> +
>  	for (;;) {
>  		if (ops->install_pte && pte_none(ptep_get(pte))) {
>  			pte_t new_pte;
> @@ -56,6 +59,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
>  		addr += PAGE_SIZE;
>  		pte++;
>  	}
> +
> +	if (walk->ops->post_pte_table)
> +		walk->ops->post_pte_table();

NIT: same as above.

>  	return err;
>  }
>
> --
> 2.30.2
>

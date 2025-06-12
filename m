Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918BD2550CF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735091; cv=fail; b=SdXy30T9ZGPaLPN5vC98bDj7zJRimVNPc+NXWqzHBlpI69OQR+G2Cg4eyGZBqUx3Cf6z2gVXhUGO6EatFLsnx3ulfUqq8SSrYBRl7LToVJ3MHuPd8BufEmlvP3YdGsX/EA9qJrIrjOSGFec6HVhzW11M1s6qf8VwcjRgmAab5fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735091; c=relaxed/simple;
	bh=z7EuVbO0Y8fgNVW9/3p3DOO8Xgnjeh3Hr6sZ3ufMwew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Uo0DFIWUXZd//+VmqLS6g5Yr/cVOqDK7nRXjZ0XiMWJGG0j6ESnR6JYuWZTeC3VpKdpuc1ERf5lS1oIn4RDg1jMky/nEdJ6OnLvqxvmOcVUcYASm771FKQJuDB/BUS1MATzpPooq07AzHLoXL8J2faXEs+KcPnlloddFSvebGFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DlGqLHkl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OlOWRe+i; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DlGqLHkl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OlOWRe+i"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7fxqY022693;
	Thu, 12 Jun 2025 13:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=z7EuVbO0Y8fgNVW9/3
	p3DOO8Xgnjeh3Hr6sZ3ufMwew=; b=DlGqLHklr4p0JavvyKEzD3XNJY1TnHtpIx
	f1cBM6pqkKSCf7P+k0fWVKcatGJGaB03gzZYuCZVM+NCQ4st13GF8EGLNTnV4xzb
	XCbsnd4TAQ6ZIHnTpbKKU9e08Xt7O6eBxoNrtVCbyLbaBnvwp7zi3qk4bZ2GBcaD
	DEaNxINDWfTKoIPW7gviFv6Uny1wqf2NkuxhDMpbi1Pi48rkpqzS9aeCVExD69ps
	YZHyYnLxAV219AGwe9rvnbnGmY8YbCBENmyte2SGpotQkRvKeF0INuWQnOH6/XZp
	5pRAQOwmWDeIotERGW6jzlHRjr1cKQIqEf+zSPzmY48kb5fiVKkw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad9ke6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 13:31:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55CC4fGN037930;
	Thu, 12 Jun 2025 13:31:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvhu416-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 13:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGXNggcmub/uyxEm8ck/c2OApjz5OlSIt4fBfJ1DjX+F5Y1lkTvRkbssBOjvDXBldUZ3FlYN//1XcVfto77LRlsUy+APfHaRTBPx8xz3eVNHf8+nTDlsg7Ty1BKVNF9l9kFXSqDyD+RHVNTX2KLbJ+BwsoipnLpE2tM6sb14E1x0/mCLiTiEvGkvlWZvuiyeRd8qNJUu02J7qfDgS2qJ01G1KBDpB9C5CO3hFPufW74EG+cplpG5Y/3SMUnhNKZm9Zm8eCFDt0dXV4ssysbOcDcOkzA4tvT+RpYt6tZIAQxqjwZj8QTASzQqmEi4RIgwwIb5bsMkglGjZbsBOElyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7EuVbO0Y8fgNVW9/3p3DOO8Xgnjeh3Hr6sZ3ufMwew=;
 b=xNYLcHicpG+jAgL0SG+FrIEL9hnPfqNKLV+iopGc2QeQb7qfBjYYCDGfcTL+BuIOtQFm0IgJywR594/fgwJMJaSqSFcB9d42LgF4/z8tAB/WIS7UVxWopwJUfSxDEl/YNnwOZyzFyX6U8tNT0ktDUqOVA2ztlIlWq3c3ZyjXC/nKfzvE+956TI1Haolz3c69JOse4BxgKW/4w0YfJgRjV8Ni4CBISsHA4wWI+ppJ0Ek1bSitwIj4W4T2Omvl0nw6bFX3juyMw44fxo5F5mjQqUUBiQefV/GpXF6hV8Psn8TLra9NKTK+HGvkn8gpoCn6CCxrLxYzCyZn3CXubB1rBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7EuVbO0Y8fgNVW9/3p3DOO8Xgnjeh3Hr6sZ3ufMwew=;
 b=OlOWRe+ihA7sQguOxvliMEfL7pZN8EjKWOP9dCEo6cwgKbsE9SXPmXzziH99UhIGqyFFt0yRa9a1G178SezlhSVgV5Z2Da+20EfyTBN5QDWbZUHr2QVCxjxmTd+C4y8Fkl8gbHho8/k3deBgtSoj8LCaWjUecvL+BpoSlMv+hKQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5632.namprd10.prod.outlook.com (2603:10b6:a03:3df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 12 Jun
 2025 13:31:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 13:31:07 +0000
Date: Thu, 12 Jun 2025 14:31:05 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <935f3127-8304-481a-91f8-fbce02197e07@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <3a3f6f69-f0f4-41a0-b960-e76423fb6dc9@lucifer.local>
 <e80f8d1c-888b-4d39-a00c-5b92ee339715@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e80f8d1c-888b-4d39-a00c-5b92ee339715@redhat.com>
X-ClientProxiedBy: LO4P123CA0694.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb0274d-e927-4e7f-526a-08dda9b56330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kpehZrdsNhi6c54Nx+QXk3FEFOTkWJJV80CUhhUiVYnjviihyT051P++z5ws?=
 =?us-ascii?Q?j8AV8EqljlDyPz1tEQEJKPxE1fUVEo2wfb7WmZhr25zHAWwHD+LI2IBl+18s?=
 =?us-ascii?Q?kHEUiVYhN2596YTCJHH+ER4N4GZQQzptgq6H4+p/XWE9wTa2fDRURBRVcG67?=
 =?us-ascii?Q?2YF31R6toey+/jTUsanXH2APbEMZAi9pvXsropWYCOZgUNCGBH/ZjfWs0u19?=
 =?us-ascii?Q?bapsHTcNxZ7cD1JOnPPyOj29gxM1o+J/CNEbtZKJ5WbRtPM+sPpVGH4SDI8J?=
 =?us-ascii?Q?cMbhX4hlLOxoGVus2By50nqcZyJ2x5yml49p3PSwwZrGVUGczIdXmxBcsGZo?=
 =?us-ascii?Q?mm4jBA029aGD3/H3DrYdU07RWjE4U68992Wrb/jzM47/UtpCFC8XJT9ZZEF5?=
 =?us-ascii?Q?Z+JOXuobScthly+TEvFjURfHlp//j7okK+hpSBx0RG/JQjHPxJ2AxN8PVJXb?=
 =?us-ascii?Q?/3YUEB/YPQUKpjdw3nu/pvD8M9d0l9iBWOXo2mB9rP3+4hlN8P95VXkNigTm?=
 =?us-ascii?Q?A1T3cJJyOAbQwqh5/OJvgqSil2eXS7qf8wMzM0f/6D3/j2u5dt7Z4OS8b1N0?=
 =?us-ascii?Q?2OdhuvLpZpcbnfjx9Y5BfVXqVmAusRxxogqSXARJRdoj/8agIAtbEXC9yW9r?=
 =?us-ascii?Q?o8T+KEW73nTxth4dTusYvmk1NBTnwQq7D0Qc76RbP4Ga71AOoHuYRoJv+RKv?=
 =?us-ascii?Q?5nJXrc2PLE7KfXOvejVnJNiHuROs8ly3Am2/CAOBOhuqeDUWbC2Rnt8XL73X?=
 =?us-ascii?Q?osZKXrY0ajlEW8uIozja5n6IpEvpVdeoICrpy3WRbLQZ8bORx67zn8dqMyCJ?=
 =?us-ascii?Q?Gr+oSh/AnmLZBhr/KFsNF9GKT/sFoP9p5rLvaVqlFtR2RruqBMOe09LV+SzG?=
 =?us-ascii?Q?U1LY8Ee+JUmnGVMseIyioKFrhNv01q+TKN14xaLhs80LUaS+36JlRVS5oQCv?=
 =?us-ascii?Q?gYwq+dKX8rwIJrlV3QGZnfh3HYO59CzZArGtdoT+Y/owYlmNwGnjXfd4h2nB?=
 =?us-ascii?Q?q+uimp4U1XVvrEXxe0489ac1mN3b/gtwbiClW8IWm8+HJU7w+bzlfkVE1TsV?=
 =?us-ascii?Q?Q+scXsk891mtJDnn9tb7tSfS07kbZkiME5m2vItQ7Fmj1WGykcCpkqA4SFMf?=
 =?us-ascii?Q?nHscEA7QbL+1pqUbruXgL1tymJvxtj2tV69bWcxZnOu2MbOU9SumB+VXhGeb?=
 =?us-ascii?Q?S+TwNsh373RtBkdGVOZ15V1Elq9I28lQjMO6j66voP03XYydGyV3jLkQJ9bT?=
 =?us-ascii?Q?XjUoFCStkaTvf83qcn7hx0zT7+oXtJ1KIdKGvgkY5GYRUgYEpYdftwa3HClB?=
 =?us-ascii?Q?qiOpt/Vj25Tbl0xZ1OLYAApv7CxaXvT+B3xjEt14iRciUUWscibsE4T6v0Q3?=
 =?us-ascii?Q?hKVRZoGtWHk/J5D5ZAK32QF0Z03nNpc8s+l6EX5+rmKH4tUuM5/jmPTQF/xi?=
 =?us-ascii?Q?dbZshekNslE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FB15k3XyvhPEUyQdGFuT56xQ3lKAFddpXvUd0BjTjvYEIDC3098i5QbOKygP?=
 =?us-ascii?Q?Y/7ApbBxz6nhxz+M7BkkomGb8rfUjrG90wmj9TP3+rYAeZXQLf0+sQIRjKBw?=
 =?us-ascii?Q?94rLpmwI+IInHxYy2qcoraJKBNgzT9/3L3U0X1CA33kXh8LFg6Tpq+6eaoxf?=
 =?us-ascii?Q?uuxS0yjhEsKNau69RhKjQMoFdFuZYd8gscAHd1Iw3eFNzsXDyoh6VIL9buZQ?=
 =?us-ascii?Q?pYq43qg0ehK6VQeakyLeIIsXn0PH0zG7URSkzd01IcZM4FxecNaqQ5PpA4G/?=
 =?us-ascii?Q?y2U7R15fez/FauflgYCjDd9Bn4EleQVrwXFengIvVlfuzOiz1lInYX4sIF2k?=
 =?us-ascii?Q?zXdVs7ZpMJp9HKOrLXl91OKffuSCutOQ8zl5YI+F5bnoIqFsYprMR2HT7YMk?=
 =?us-ascii?Q?ds6Ccm62wMJ48Io8cgfQBdVclbb98yEmm8wbv1TMVfNGuJ9R2SmlU/UK60KH?=
 =?us-ascii?Q?ybdsnos1pBtHVVmE0ctSnvXzf9LQ36gtCDs4XbXW+S96PrmvfE0CYoVsIPF6?=
 =?us-ascii?Q?ehO4F/xE7s65zyU6/6MnW0NW/0BiufDp71YXarbgZ3DI3iLSLtxA7B3cPfeH?=
 =?us-ascii?Q?kcDEdvumJi3fD+MQaDFyHh4vnuhcEMMJsTk1A3ERTNm9k6DCvT6FzRExFuhT?=
 =?us-ascii?Q?kTVPJIz4GoLW4YnjETSZFk3j8FT3oQ8fZcMyd/CK2crQHFoV6JgD3E6rBSJC?=
 =?us-ascii?Q?riD5jLulqEZAlEfIm1zCvD0vl4caQhbieyl3ALQbwwofwJ7hgaAxQDCKfnhh?=
 =?us-ascii?Q?ibw/qQUyc6Uc00gzkMIiqgeMIIOxGOD5KRgOf1p5o3itblhhzn/fOIwFbapN?=
 =?us-ascii?Q?vy1YvFLPtPvTMo/mReCJFZJEttsMppijV+S6bKiLz+ip3qH4trX5x4T5xocb?=
 =?us-ascii?Q?u574WzxI45g8zmeYUzkQN1fkXozo41SeCIzK+SpoNfq1iBgsgUhQKp4qq+ZV?=
 =?us-ascii?Q?B8P5dJ0b9cUSbdGn7xkese3i8/WnNn4BVekEHpieSZusc2XYfMN3suDdSJS8?=
 =?us-ascii?Q?LM0lDJONdj0jZ7fHbwPliRsE87cSRdTsYtGPzEsycOZPaL8tPKLj5CVn/Lfl?=
 =?us-ascii?Q?i+c1u9NeN+vhSfg4jqeIeRlVxoqntTzVjjCAVwYJJEzErPisW1NGJ8wHd1E7?=
 =?us-ascii?Q?ZDO2HtCsX3MIWXUcV2TtTzwKBWUm6w7J+tkTUyOkVFSCqsDGDWewtRRskT0+?=
 =?us-ascii?Q?iYFU+i9TtrHwad7SK41LbSKEn6GkJRz+xmQkV97LZu0dcJvJxF1vQltb1be4?=
 =?us-ascii?Q?QGMXSVkYl/6TJf/7X2eQ398wMrnmJCArCGVAYtDw3OMfoU48MORR48a6vp9B?=
 =?us-ascii?Q?t6Nufd8flbJMgnQnEGX8vaqGWxtXN9tiZgn21qscC93N5Ic1dxd4vnbix96X?=
 =?us-ascii?Q?YrpZmQq95ip9EO0xyIdTv1zXwCZP5sdku8FE2+m/+6AqCoJWKBzUjGS8t9bS?=
 =?us-ascii?Q?YkXmfneX8bXcKUs4XjXY3CpNySZM+4symqM9Qvzq9CD2bIco/VnN+QsDOiAO?=
 =?us-ascii?Q?+ukfzzvjslICXgifpcbrVNFuLkf+VA0a5i4np24Uqc8ORjX6WnjsmH/IWT71?=
 =?us-ascii?Q?xQpAWpOa8QDC/soz3zuVVlng4v3M9SnpxbQsDQSt/CZnlaBeVdBq1XTg2QTv?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ETFWwmPhnVNq8gzLuKQ1DA7uaLMsvHbRs79t+H/wEh0Xbgh94v3pzzA0R2tCT6pFMwIG3k8CqebAwMMhUjCnUxWv6ulLYBmoHbs5tdnjQUM7q2oVBGFB+j8tiQm2u025l6sj8YQMcmQRqN7dPB0JgCA0Wpfs9H3oAm5vQsWahMX1rgZDF+rnfbk95iOnHa19s+JBRKm5ejSP2Kmb5mTuuWLWqdon2ASORj6DF0WfKvxippmc146kmrHAZM+mGX8Es2TYy4X0rnz90wN324qqSvEtDdLLxGaambcOP+9YRXTYTTsN9bSRiUhze0M7VgBechDjUnSNzTy1joHKmrogpIGTCVpijKLu91NRUBedfY1e4LPUDLg6tVtTx9Cb0iaVuQPDeDipjcrrZEbx0b5j4XyicqHCp/hqFIe2RcZy4Cb2qCqriRoYrjXn3+80kD9P23NhianQNASEBINVRhuEB7DjYUcKHwNRyIgtZzYk/Kg/+UP/F1URK7QhKMShmCZ8GqI+aGdxZZGlvMaHPOuTQzaJaMQ4GMyDGNrjzS+63aoSL2WgdagWHEy/aQ1mq2rUU6uOA4INtyhBPqfe0YrRqztw59n7+sRz/BgBku0s/XQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb0274d-e927-4e7f-526a-08dda9b56330
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:31:07.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGZwVmAFPe22kvWv/aqoqUtv05Iiv6oqWjt9HosM5g04VL2ydAJwuZ7UEIeMV6nMGCcvxsw00/GK9v3Y4miB60d3aQLD3rMTB0gFxaHEEKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5632
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=960
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506120104
X-Proofpoint-ORIG-GUID: 4nVWT808bwxveduaFOZsNY9xWwap1GpW
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=684ad6a0 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=G1JNWisfD23MATkZWEYA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEwNCBTYWx0ZWRfX4xidWTwff94f Qn/HTQBop7GXw/mYxrtV8W9ciDfyUf8sC/Ch+Z05Jyi2E+WZaHxR7hrzVbM0I5qsD62y4zWUmi7 ybH0bxakwgAAcPcOWoysN55du+ZXJ1ppEd7ZXBqIpH/IxUttxV0/khgBRpNjnN+iaH5eEXpOoJC
 Y16sELwVo960qBdsrWQjxREquMYGzAsbFiXGEPV1WnLfoCRn5Os44gYxveIyTUwNWk9szUcONrR ah+6VMBNih4wqPje7sLiBwAfA7mXGTe3860/lWqr1mv/BhNh+bZZPsGA/Tx/MYgZapBd6L05Wm3 3cHwv8bGIEKIyP5wgcJEw6ZSs3b1Hbrl/9w7GprMcxe/HGP5yFI+bfpONgKkX5oZDi4K5qVL45Z
 94SOogCh+MdHS0f0Ha92/VuT35IN9evr6zEwyQkOJRzfWx5GpC9iitvuKVkLOC8ao70kHMqr
X-Proofpoint-GUID: 4nVWT808bwxveduaFOZsNY9xWwap1GpW

On Thu, Jun 12, 2025 at 03:13:19PM +0200, David Hildenbrand wrote:
[snip]
>
> The masks are just disgusting :(

Yeah I was shocked when I saw this implementation it's bloody terrible. It just
is.

>
> While you were writing that reply, I just sent out something else. Not sure
> if that makes sense.

Replied there :>)

>
> I'm having a hard time figuring out what we even want here in the existing
> code.

I'm confused as to why this has been done in this way in general.

I feel a churny refactoring coming on... ;)

>
> --
> Cheers,
>
> David / dhildenb
>

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7133E185B67;
	Thu, 15 May 2025 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747341400; cv=fail; b=XBDjxlfTlp/TqzAdTajAz2Ng8XixGwtLJn9J8nJaXvEcu1a3KxuyVhlLAawuvRkhmnacS3okz8kF4ubEBMtRA79/9aX7oa1UUV62bciFP+XSCMTGcbB9qNHH8MnwJTDIVnRMks6sA2PNTYfxAyRwc/VbkquV3bmIDLr/IWZldA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747341400; c=relaxed/simple;
	bh=7d8I2P/JomvEaxZ7OAryi/lGW5E0O/QuchVLAtL3/so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mH3Jc/91VhwKJ0C5hCvWjxVjRUiafhM6IqG/RhH1q3QTMBGxADW29AdV9ZqXZPEaQ0+W3DiDsA12GDHgE5LMboPSuFyXgBJdIg33Gve1MUV9azaRdQK6bIcbiWv6XCMyHSgo2Lg385zr4Xfr7YBbsSlZImfxwoKLwfzes35GSpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oKE0MMet; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MmpsEd/9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oKE0MMet";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MmpsEd/9"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FKZGcT028562;
	Thu, 15 May 2025 20:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=IRcFALTfaYMyYOH1VT
	l9P78yaXtKKO9Gx6KeaUJ27ZM=; b=oKE0MMety/Y3e18SAVgCXm028aAVtgrBRe
	3tl71QDFNVmbFcO7hQOGEbdLRcf7I8pHSWW1pGJN6Y+G1OVBcbGvBMyLNGcQ9kpW
	kj3qvrb8lLxI3XF16Mfx98ul8cbIxZzVEsaan2gYdpE8DowejiKolZdCJ7hFdpYI
	RqjFwmdohr/jpt+IhvQLDpVdbPiboc2sbPLB9afEsIdoehwEeeBIKm5+3eHbQePT
	wMeUYhmj/BbmbO8DODeYUXDjyBCl5ovBKb6iyPm+q2dkhowST3iRzKnyNUI6Zf/g
	OtoyVrCaj3kYtUznIT2r+OE7D8lD/72dxJtV29QL2yu4k7qdDioQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcmn7y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 20:35:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FJoICP004506;
	Thu, 15 May 2025 20:35:39 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013077.outbound.protection.outlook.com [40.93.6.77])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mqmdx0eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 20:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wV+QuYH48DVrprazTKVTEGYopICtQcLmQqu0RzqzG89LF2HK/5xGMZ4n1SLjWQZW7itVUJAtr/0TdkkG+Sxf9BIH29JApT6/qSdGelNGGC1SsQMZUQVQC9oLpqlJAsKtObKxBn0IQszx3FGXPiV0f4JiuoouSJkdLJ6bmXhjDGI0MoE0TNxsXyi1NYgMHYGu0s9nfBBSLvuEYh5Wjz6BrsBH+T0I0UZbQgipdBpNEPzcZFfbXv/tVK0J3qy8/G3MP7sb4qDwORIemgYJf9e0qqBVB0hDHFjS8Yx4+gvuG0lBR2WqjdmcXSmbGZHY+UFaevjBauBGQzLoyx0JyhL1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRcFALTfaYMyYOH1VTl9P78yaXtKKO9Gx6KeaUJ27ZM=;
 b=bPI96x4DlbhYzjDidFeHTtAI+glDuOKC2jNv0oB19gb0hZDgOCuJECDuot62aejXcEQO4sKEnKYfQH1ea2OYB5zAFZY13g38XHxE3J8B0N+VXqFgwSdB0HOhfKms3KohFYuDOH5OMVwGY3p7y1lUg/XJq5xLwn8e35TKoWnjG3WKEIJL94cY2LuL9FIBdmUMWt5Z9ImzDo4WdOG2H2vQWidDKVFfP6h5kiuePBhl2cCS1igIhj8itM1Ii3bMT/TBG9u/Z58Rjl0K+/KhjvxKkd+lcO10XqzsBrCJ7kUAdUmILeJg6Y+PmCtgnRlOI4bOLapsxM3g94s2inmiYhSI/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRcFALTfaYMyYOH1VTl9P78yaXtKKO9Gx6KeaUJ27ZM=;
 b=MmpsEd/9hgHy/ceI0vUicpHGXSRCVaeV51qMz8G0htaCZCbsVLTehn/LhCnIKvg5vy0pMI2f8TH2Q0qZGbjtdXHf8t6SuF93Ij8vfDE56cqXuDJs/Y110GZfwbeYh3IVTGtzVFmb2EQwkJxk/4cW7YCtjDMha6bwVEwB7zv3BXg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB7184.namprd10.prod.outlook.com (2603:10b6:208:409::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 20:35:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 20:35:35 +0000
Date: Thu, 15 May 2025 21:35:32 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <cbc95f9b-1c13-45ec-8d34-38544d3f2dd3@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
 <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
 <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
X-ClientProxiedBy: LNXP265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::33) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 83626e08-fa8e-4485-8bb2-08dd93f00b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qpXT3fOmIJs16qab2UnfStQ5hBDDyYNTcxvqTDnuacXTxfeznLEE+2xZsRvE?=
 =?us-ascii?Q?pslyD0xmJ7IOuZDYBMosE1NmJnTriTeUunAyyRalP2+TxnK9zThMiwHYDWcZ?=
 =?us-ascii?Q?gpN0xQu3a2WEvew8o30gUmOi1dbxFBvrixkeoDNl5Yc+hRRjqB5yoKqTAodF?=
 =?us-ascii?Q?F6CHeUF+TXwsbUUsNhmyNaK658RrMIUEejmY37tE0IoArR6ExzS09PRhCcpb?=
 =?us-ascii?Q?41adCYysZdi56uzgWSgao8kTA1c8vokFZ0heuNledRdvVsNu4dAoLSb6Bfkr?=
 =?us-ascii?Q?vRLczkDFmgiQK0w6eJ4ZMbr92LY9epk6Po0XFIyVOPef3OSYzhlp9QLEd0ao?=
 =?us-ascii?Q?9f7PCpxIozmiVNWjoCc5yI640t+KlGuTW45+8qWzP1orqIXRQAwvzmYxstH2?=
 =?us-ascii?Q?yw5YyC5iCAcl/VQi276WSIwRTRaghrt+ccfNy1t/ZV50CJ1M7ogwSXi06u7n?=
 =?us-ascii?Q?dCZl2ZdWVfNfhrAVsU+ukouT9UOE8anaglNa6gGglGTgqqLOcIAwf3hIDGJS?=
 =?us-ascii?Q?Bq3fXNefnhuE3x5HhzwRB8D2vIH/L6okn2vX1bhOVkO56c5KHQ6dd2bzgCuq?=
 =?us-ascii?Q?mbgFKInjPpvvyKxv3z70857ODPJz6fK5DQapZlQBKQhu7iklXDrLiWbuusfv?=
 =?us-ascii?Q?oQeqj284fHn1hExWjLmeie2/mzyEGlH4QRDCSYYQT7rnJ08YItnZxeEuOJbV?=
 =?us-ascii?Q?AtSfx5LVdogAfLRHYvdPXOqtoOSxFJwcsLRtoJYwpjnZhL3CjPgO1+SIXw/p?=
 =?us-ascii?Q?z3Vv1UfYZYzml6/qawILnGNpqEP6qk9R8CM6WuNOUHuRTicQtGWmR0VCaqtm?=
 =?us-ascii?Q?960ShOheShfRwtJJuBC+TPQKKSeH+18QKHhXS+u4Btxx73fv+MqoeALqCzp4?=
 =?us-ascii?Q?sc6NyeUSFm84Ucn4IpNDNBwKr5CiI8CmtXF8JLQ5NvliJ7wQmzmOUzXJ8LPb?=
 =?us-ascii?Q?P00/Q7Utp3174JM1pPFIyy2RHZE3xHHPAyhYcnjXo0CeT+sTyFiH634cXg8g?=
 =?us-ascii?Q?BCas8wM/o73rOmcAgB12cyNzRkRyXEqU8dYjxW6EeN3JF3CbzuhhXqfOwb0E?=
 =?us-ascii?Q?+AimcOey2B7cpq06Q2QUL+kU2nvtlN+FJVbtTZdJTsW8HAn08YskK4LNQv+h?=
 =?us-ascii?Q?gKstpPbyFTjqh1FVT7otg45fWgQ5V9jo7xa0p3eZOb+j36CU14c3admolBN7?=
 =?us-ascii?Q?ODH05apntfUeHHU75RwGmA19EBm6oy7mD7wwFwJd69XoVjZWGgV9f5q3p3kw?=
 =?us-ascii?Q?II7z+vc9g5gcRDBpP3ZciRIKij2bkAnnl59PVBcqAvZujntij5pbgoBd8mLh?=
 =?us-ascii?Q?h9N5x/6HDxVAxZK9hvjxyyRm8lx5QQ/5aQonDOhX2iBixnZ6542z4p0zp+8q?=
 =?us-ascii?Q?6byYF6TAl31q2EdG3xY4vRQq+Hcjl4Mx3mjVDH+GuMj8NGhuotul97+88rKx?=
 =?us-ascii?Q?nv2Xry0CRQ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OTNIPM2upQIM6uyi9HarJNjalP/ZjG/eYhEVfa9u2mWj6l/ZZlUT/x/Ix8tt?=
 =?us-ascii?Q?YHfgE3o2CORqRQgRHTjIGcFQdnIpSWfsUSUAlu7Zz3KcUGR1v1frq83p55hs?=
 =?us-ascii?Q?4RTi7ByM/MTW8hDarKo06DeN2K7BI9k5FVE6zxHjgtrI3IOpMX6yxDY8VaC2?=
 =?us-ascii?Q?SIXpLjKDpBZI6Wrc/y5i0MGWHJsnmI0JrRP3EfuJUV3soCyJgnHWE0YcGnms?=
 =?us-ascii?Q?AAV3tTmV4a08gRx2yowQAt8AbVSvWn100ry+MXx9Rm4NcJV6BxlF6K9U3L7X?=
 =?us-ascii?Q?M9r1N84Uenqud0FBFRH/v2EpwlKYT/3B6CH4WB0HNoIRdh4DLpEE7nFPcWnB?=
 =?us-ascii?Q?eXltOqQ4B2xg0XKpw/fRCTG5aTdbXO2s93MyXJeq7/S50Vq8ZCZj8CUKnF8N?=
 =?us-ascii?Q?BwtPL/nXY+KX9tuHMjojTv87MpDNV8kydpdi8xOuVca3mIfHAmNccsfAtulQ?=
 =?us-ascii?Q?2TIek/Q+NSnjCydxR+dSGwmQRanlr/3Sx+UIxaXNPyKPaQe6K2MS6cjtZHKY?=
 =?us-ascii?Q?YnLCJMRDsZoQgoo6fPvnV75+duJntJNaoj3bJh5NpxHceUV3jj5ZDdY8GVse?=
 =?us-ascii?Q?/gQxl9gI+x3O5S4PEvOx3DAgxJ+461cvjPcnsvKeIzAGjP2rPV4n5CIVfNrJ?=
 =?us-ascii?Q?Zc4o7CPyTbq64jaQ9IJH8oQo6bYNkebrbi2V0e0AAKl7+bC4FV2C5ZthRrCT?=
 =?us-ascii?Q?V4lLhENQyordsdmb4kRw/Dhsr7pvl0jk2sAdMk8jybETi87ewhBNkNhD6Gu/?=
 =?us-ascii?Q?EDBszJRMmvpUROg9+AcfO4ddwQ52VoOe9C+vTbjTS1EO68zUHz6u4/0+0s3i?=
 =?us-ascii?Q?uKxbIgKSE2kIWFXUU9OXRreOi699TO2/shfDgDxgb+sN7wyoIJq0pWO4gxtS?=
 =?us-ascii?Q?c9O8+7yl18QfCd4HWd6EuOc1DR3ArkO0k+Op7vQvXkQTM3/Sm8zuMWqtW2UC?=
 =?us-ascii?Q?r9JDw6CQG9ZcKMQe5VZ8Q9y9155IrgbsY5JqgcYJArrxpIbwBZfZRVJrn1ah?=
 =?us-ascii?Q?/LPte7Huy5p3Ow/g/R4jeJussQ3AytTEFUm/C8Gy1T8aajDemZKwZf91FXUs?=
 =?us-ascii?Q?IU9gSEJwrm+W+56Kn05/EKEBr9CwBuDqXIisXbuBMKOY010Yp4DD6sEyhpzp?=
 =?us-ascii?Q?4Qv3gdoPZixT8bdMa+Zcv95MI1RDfCbLWFQqy/ibWTg32RqmoA+GQeRWQlQn?=
 =?us-ascii?Q?T/ZxfBshLEnF6R23jNApyvUC5fLPs3QFEBmMwhLERclWndgd6ZPZ/T3dSpNp?=
 =?us-ascii?Q?nHoYZ1Aa33JTsmo86uOETJ+SsCZ+I1f3SYHeQlgcC8dt667blXL17SN/fEx7?=
 =?us-ascii?Q?I049vBIDiZ5F/PytXJ5Fi1JdrzARhhpJ3yz4esesfcLQu1dsbXK7IRJZDE9i?=
 =?us-ascii?Q?GYMDSmyDiTxNGknPvpvl+MSMUMbVYvd7o5O8crf2gPd7LC3V2UMWfAvphMq2?=
 =?us-ascii?Q?0h13s6Rt3CxyfdcJ42LRzax/reFVOZneAZBtACEAfNHTbCARm5YsACTGkXuJ?=
 =?us-ascii?Q?wBZvPySl5F0jOuSfE5vZatoY2bVRTQBAuMU9XroVU5gYTsjQ27Za3oFJm31k?=
 =?us-ascii?Q?+9t79YgbGmFdSi7hNJpeMfLZJ4s+3JcCyFf7jfI2hljW3KzOLOM3mG6Vj0Qm?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+Rm9p/wcIzhtwPjQtAcq7QoPUTbbW1h878vkpkAWFwAJRimpW9nBRIDbBHf5n1KPzLIzzKRHvg0fCNoYUrADMWPL2kJ1/06F4dIy8Vq9v+tIh7F/cAxRdaKjyUWZUeuF2KA6O8XP3bWzwZv1DF1qHKnWpWmurL1XFyiYD5ds8lP/E7ceJViiooO+8klAY83rs6xd+Xf+2SOfpEuf63junQ9hl3KwY23y3sPWgTnLowPdgS1uVlvbkN8hw0EnuU5zXA/tWy6n2lTuvSwEi2LIWl8NotAIOvgdZpdIbc2Wq6ofBlR4RSFp+esiuem+dIIq5sKbWO0G/WUcJR/VWms+PCXWCyAv3/kWDUDXc5pVami/eZkGwLzbMrGjrLr8P0kE+7P4r8aOIm4ObfsS1YgzzKgQeKsyfRdsrKAuWpA0T1bmlpmQlqRZPaaHi7iwC9E9un/wBjn4FaSoKILpfy7pfv8/INo+z2xP9Y3crVSslRq4hG1dEz4cL8hblG23o7oA02VDYw+anZYj8MH0A1l3b0Hlygh47BHInkLsXl+8VnR5RKVDRpqAqre5nRgaGsLky9+GTcuZunM9z8If1IXUl4Y6HGGohxY3r9BXo+zWz6Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83626e08-fa8e-4485-8bb2-08dd93f00b6d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 20:35:35.0520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubE6f9FTjO5A84pRib08Lo3njPRUxiNeBL5HKlCNeHyndualCsGCN543xULoAjOXCjXVBrph8TDJwBCJJ6eJXtUTDH4KkKw3oVlUR4qLVIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_09,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150202
X-Proofpoint-ORIG-GUID: WKBQ-PmOHZIXNxSkH1X0Ez1qSOKbHjeg
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=6826501c cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=JFcP-F3lL9GHQUbs7a8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDIwMiBTYWx0ZWRfX5rllTMRZv65N bNbo61hFJpLygJ5DNxV8BxSse+zdhSHiJ/BLe+mlqZODqZXTzjy1VMDOX8RSUHDjS7sbzO6jX6+ xenm+yMAlUGhHIp/C/1iamFjjcitOh0nST6s0M3kerT53fc1YtAbI66zwNCkstVHlYwp0uEWhq4
 0Zv6nN3nHPEfZusVxsW1R+qkwmDfL6KZxLG5/7lORcQa3KU+iR7AD2cb+wJunRDXONZnaSA8y9H ewUtXvHbcCb0vHNIzDgW3Uke+bXVagHhVngxATa/AdS6l9y61zV/fzJme4cFTYPjJd9EsjaIm1i 33Brxv2ikxIsKig7eGRx4XZIM3NKiFOPBlG2GaWgbkqmWzH5iHtqXtKsrNEczG+z47MmtdOo6lf
 bXgF3K4aImsUxBTn2iSH4eoPld5P+EC/Zd6jaXcrbdBPYqpqiapELVwLhiQFibb+smA0uWOr
X-Proofpoint-GUID: WKBQ-PmOHZIXNxSkH1X0Ez1qSOKbHjeg

On Thu, May 15, 2025 at 09:12:13PM +0200, David Hildenbrand wrote:
> On 15.05.25 20:08, Lorenzo Stoakes wrote:
> > On Thu, May 15, 2025 at 06:11:55PM +0200, David Hildenbrand wrote:
> > > > > > So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
> > > > > > is to override global 'never'?
> > > > > >
> > > > >
> > > > > Again, I am not overriding never.
> > > > >
> > > > > hugepage_global_always and hugepage_global_enabled will evaluate to false
> > > > > and you will not get a hugepage.
> > > >
> > > > Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
> > > > if the policy is never.
> > >
> > > I think it should behave just as if someone does manually an madvise(). So
> > > whatever we do here during an madvise, we should try to do the same thing
> > > here.
> >
> > Ack I agree with this.
> >
> > It actually simplifies things a LOT to view it this way - we're saying 'by
> > default apply madvise(...) to new VMAs'.
> >
> > Hm I wonder if we could have a more generic version of this...
> >
> > Note though that we're not _quite_ doing this.
> >
> > So in hugepage_madvise():
> >
> > int hugepage_madvise(struct vm_area_struct *vma,
> > 		     unsigned long *vm_flags, int advice)
> > {
> > 	...
> >
> > 	switch (advice) {
> > 	case MADV_HUGEPAGE:
> > 		*vm_flags &= ~VM_NOHUGEPAGE;
> > 		*vm_flags |= VM_HUGEPAGE;
> >
> > 		...
> >
> > 		break;
> >
> > 		...
> > 	}
> >
> > 	...
> > }
> >
> > So here we're actually clearing VM_NOHUGEPAGE and overriding it, but in the
> > proposed code we're not.
>
> Yeah, I think I suggested that, but probably we should just do exactly what
> madvise() does.

Yes, agreed.

Usama - do you have any issue with us switching to how madvise() does it?

>
> >
> > So we're back into confusing territory again :)
> >
> > I wonder if we could...
> >
> > 1. Add an MADV_xxx that mimics the desired behaviour here.
> >
> > 2. Add a generic 'madvise() by default' thing at a process level?
> >
> > Is this crazy?
>
> I think that's what I had in mind, just a bit twisted.
>
> What could work is
>
> 1) prctl to set the default
>
> 2) madvise() to adjust all existing VMAs
>
>
> We might have to teach 2) to ignore non-compatible VMAs / holes. Maybe not,
> worth an investigation.

Yeah, I think it'd _probably_ be ok except on s390 (which can fail, and so
we'd have to be able to say - skip on error, carry on).

We'll just get an -ENOMEM at the end for the gaps (god how I hate
that). Otherwise I don't think MADV_HUGEPAGE actually is really that
restrictive.

That would simplify :)

But I still so hate using prctl()... this might be one of those cases where
we simply figure out we have no other choice.

But when you put it as simply as this maybe it's not so bad. With the
flags2 gone by fixing this stupid 32-bit limit it's less awful.

Perhaps worth seeing what an improved RFC of this series looks like with
all the various bits fixed to give an idea.

But you do then wonder if we could make this _generic_ for _any_ madvise(),
and how _that_ would look.

But perhaps that's insane because many VMAs would simply not be suited to
having certain madvise flags set hmm.

Maybe let me have a think about an improved madvise() interface along these
lines anyway in general... interesting thought experiment :)

>
>
> --
> Cheers,
>
> David / dhildenb
>

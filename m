Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F5B3398B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482301; cv=fail; b=YV8TaOLhO0h41HcRMt0oxrAgfMYx+3knUqUul6cI8bIEJgMzcnU+uhSWCArSZJM5xvayAhIAG/1aHzdjv/+5Ts4I81LCI31N7+F7QbQc4t3r0HWpw9JITd5l8YPBvDXNwOOjo0Azx6AMQ/jTxnt3Nz53ikKXiGxNoEblRNg9HuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482301; c=relaxed/simple;
	bh=wpchv2QM0k/bFhIVwyJ0Hc8KV5i8MTre2Dlc6FXvMOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MpYJk5E/dQJoXHG3/ka17YW153MYYPCOdJipFx2KEzQFbTzxOOqEQwBczghSZQ7PtEKTIz6jrRQzaCE40GDR+9lpEqA2tqOetwTOtbqytnbPJjWVjHLkpx/0gzGJvgB5oK/37jed/hAoTpi5mJrZt2yqqhufyos20rR98TxBWa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TbDsAyLx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vyrvqySt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TbDsAyLx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vyrvqySt"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593fZnw010478;
	Mon, 9 Jun 2025 15:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cI9yordqEqYAc9k5FirN7GPOjP7IxKY/y5x82up9/Ok=; b=
	TbDsAyLxF9lBqO4KQxkbAzDspJMvW36CSDhUs6jmpLq3L7srA/qWGCr12Fe2Vhti
	aUe9EI6dgOfoBtsphdcPQ4hRBqNVQxSkP3Y1xcvS2CJgQLQySsoZrGoyXXMnLUuw
	a5KwzlSF5kVn2ufvq6B1lUo6RtwgsWnh6OgrdyYg3fkhdXKipa+qJFYsc1lKlzvX
	Ifyz+ANPum1Uz3ynnphaofS2MLXU7kWflomoaaH1y2KHT93HF9rweQ3QCeQx/c24
	j39QdkrTLigTFFhUB8DtImgJ6I/zgDEco+A4qBeY/+raisHML6dsRN4aOuJf6pBH
	uDTtrRUrLake29HZj5WQCg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbeacfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 15:17:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559E66GS004011;
	Mon, 9 Jun 2025 15:17:52 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7jd7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 15:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxGJvTvBb5bP4lgnYBw8xMQocWUf3wtYbfkvxN8/pKY5e/6QBaU4372ujs6CfpcyX1JuQGko9g0fYrSYR8Yxe3jNARBXyocBzxR4zih4n5P8eXE2b/SMbTZe3m9isfvhqZt9qzVEtuKy7inKeyxNBVvCqoEmKydpd5ni5MyMLKiZEpJzCQmtgj3MCpy+rZerUwOSzx2kunR/MDt3auB0RM3ZfYEhY46nrfEk9jSgv7RnJE4/2lhrNnD16NRlxamciaYchV/x0EZJ8XQ7p7XOoVbIOXoDFFDaXy8103q6rVaDEAw2X5ZYJBTl8PIFi2CfQElVk37mAOsnQH302GttOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cI9yordqEqYAc9k5FirN7GPOjP7IxKY/y5x82up9/Ok=;
 b=HZHhpE6HcURjhCjaEB1nX1qZ89U6D5AVCNdciQH0mxOAejzb0mQwz+NvfSJOM2a2zQEJamVFxzLjdQ0K13KYL8nRAHZlDKvYv+vw7aFH9Kw/zFiIlLno4ox2iojBu7fmmfqzXLCsASxNm/M4zjDnRnpds9+XqUwpSbUQOI1WvPOh1SzfSohVgyvjQCOSiFgJgK/cIiiNo6EJPNEbSynwTzvt5iJIo18rcTtfU4QfLXcSwsiurxSHsnf8XHQ51LEKSmgWrT76aglclxy1rePBKgEdmQ9kdJU7zfmbkY9ziN9BO5Ji4ceN8wK3Q/7sWniz8e2Gz5iV6qbqKEOLicDF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI9yordqEqYAc9k5FirN7GPOjP7IxKY/y5x82up9/Ok=;
 b=vyrvqySt/P8cu9M9NcqXl1df6WA1gge+mhB3cSHwtoTH3bgjizJrBbVBeKt2FCi1IC8kovVY8CGnV2/TpU8I17FjnfN9ydXncmR4Z9kJkG63J2svG4lZZ3+Bl+lNZP24suwSWr3p5FDm3tOZBq3hbsdNRcqIbF4X2wxWFZ4ptE4=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SJ0PR10MB5598.namprd10.prod.outlook.com (2603:10b6:a03:3d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 15:17:47 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:17:47 +0000
Date: Mon, 9 Jun 2025 16:17:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <cd357496-34f4-4d87-90f5-acfc55ca5995@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <998a069c-9be5-4a10-888c-ba8269eaa333@lucifer.local>
 <a30660e1-f366-4b0c-846e-986067931c7c@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a30660e1-f366-4b0c-846e-986067931c7c@linux.alibaba.com>
X-ClientProxiedBy: LO4P265CA0306.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::11) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SJ0PR10MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8033f2-c298-4fdb-0d94-08dda768ca70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEprYk9BWTJORWRjdFhaOWZXZlJsbkwrWEFncE9pcDlLTVlIVnZOT3Z3TEo5?=
 =?utf-8?B?U0NmY3J0UCtDbFVyUnE4MzI3YktqdU9Bam1lb2tJU2d0TzhWSjJkVG5Ydnlr?=
 =?utf-8?B?NEFoOVVSd3pDRDZCTHEvTmEzWVhUaStWOXdpZ3lHdzI0NmRUWlZUWndObUgx?=
 =?utf-8?B?M0p3ZW1UY3MrUXNwb1VpZEx6bVZOQnlyeVQrUkFyRGMrMTloK3ZrRFg3TmdM?=
 =?utf-8?B?cGtCM0tubEdIMHkvY2dSRytBYkx3NVpFR2h5cUxJOWxvWTBpdmhsQ2FCVHZl?=
 =?utf-8?B?U3dJbm91cVg3MTRUN1ZGcXcwZHNoeW81MmdENlRnTHhzMGhDeVoySWJJUU5Y?=
 =?utf-8?B?NHVMQ2xzWnpKNWVtbTRoTXNveW56R3YreWRLbVZhdUlDS29jcXM3QUNWZWZr?=
 =?utf-8?B?MjFuZ2U3dTBjRG0vZFcvWjBmSDNBQ0xYYnVwdnZ0SzU5ak1hb2RzYnhhUnNQ?=
 =?utf-8?B?QUh1MzFxNmFBa2hMejJlNnUwNTNaT1NENHhWS2E2UWtYWWVhTFBYYkpNVkM0?=
 =?utf-8?B?Y2YyNDFtWTQrdEdhZTRoVncrNU9XNXhGeXBsWUZXeFdieERIRXFMelJSUjRS?=
 =?utf-8?B?enlNRWZ6blZoS1lWbkxVSmdnM1JJWUd1VVNUWWtBZ3Z5S3U3emVQdWtYaFZa?=
 =?utf-8?B?Q3k5RmlzSDJGR05uem5IYVFscG5KSkFGQWRuVGZNbFMrSG9ESDc4aXdVTzFw?=
 =?utf-8?B?UGo3eldhY2xlRW9jNUpHMEw2dWtweFppazgyMEtsQmx6c3VOSk44emhmQjMy?=
 =?utf-8?B?UHdabjFlYWlWNWpIOE02cnM3WEJCWG52QjYxK2ZxK0VKd0cvbFBweTlVYkNY?=
 =?utf-8?B?TFFFLzJUUmw5WmtnLzFPRDgrL2o0SW1VQm9wN1BsQy9TYWVjandVam9LaitG?=
 =?utf-8?B?cDNEek5hWTYwbXRMQzFiRlp1VnJDb0M4WlZrM3Rqd2MwUGVxSWwvblpMcWhL?=
 =?utf-8?B?MWZqRndibEFqSUJQMnhFaE5ubzZUU2dYMHVaU2NYMnpKU2FLZDFzdXhnVWpw?=
 =?utf-8?B?cVpZWVRLMVY3ZzB3NS8xeGhLczBlVzAwVzVvU0RBMUdZMUtqSUk3OExLT2JJ?=
 =?utf-8?B?bEwwYXlEakFHY2pvcWJzblR4Nk5sSDlpVERadlZMWWFXTHdUMTcvelVuaURL?=
 =?utf-8?B?NHUzVDdvZ2kzRnJYNVgza1MvanFJenBta1ptcnVpSkVIVGF2NDBRMENWcnFR?=
 =?utf-8?B?N1J0aWJPSFBBQzhranI5TmtWSFpMeFgwNEZLL1g4OTVTTHpia1NWbnNSMytT?=
 =?utf-8?B?bTdLdFJ2TGMwR0o1WCtsdXp5aVU3blREVXMwRnlVWXBhaENtdndTSk5MRVNF?=
 =?utf-8?B?cWtVcFRzdzhJTUYvNW9xRjFrMGhHNlg4TWZrTjFYV2haRHRxbDd3OFJiN0h1?=
 =?utf-8?B?eGJVblhDUStOV2tSSzJiNHhGTHZha3VRUFdyYWhBMXlpMDI4WU40WGQza21Q?=
 =?utf-8?B?WDlwSkRBTit3WVozNzJUS3pQRlg4VmlVbzJPYVZ3Ynd0L2IreHEvV05LK1hF?=
 =?utf-8?B?MXRkQmhqRTlpa1FLcUpCZkNRbS84VHVJYkVtcXIvWUtPbzZMbjJ3L2gwR1hF?=
 =?utf-8?B?cTUyL0F2SlU3VVQyMkZIcGNVN3RZalBTbTM5RGJDbVIyVzJkbC9mS0lXZFgr?=
 =?utf-8?B?ekJUOEsvWU02WGFEckdrUkJucDBaSGs4TlpSODU1RStHTC9iTHlmV1lqSjVi?=
 =?utf-8?B?L21lbytkMnJaUHhZREVNdGx6NWZXUDJYRGw4M0pTUGc4MFNrb0xIVDVPTElu?=
 =?utf-8?B?WnJWeU01K282ejVhQlBRMVg1S28xaWNHejZUWS9oYkM4a3N2NForYnhuZFlU?=
 =?utf-8?B?c0tGekdtWXJ5SGF1Z1VOdkVKSHU2YkxMZm5nOEw4dHo2dFc4TUVwQkhIMndG?=
 =?utf-8?B?MktEQU15YmJvK1diazVHQlhBdDVUSGdMNkxJR2hIME52WnZHUzJtNElsMXph?=
 =?utf-8?Q?yEX3RuX2SJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUg2U0drR0RkRjF2WW5ST21iYWRqNUN5S2ZkVm9SS0xhaWp0RnJMZExIZGJB?=
 =?utf-8?B?VjlMcWlpSmN5eEJJWWhldEkyaCtTUEtzRjVQK0NkTkxLV0pVa3VUZ0ZrdnlO?=
 =?utf-8?B?SmE5MEYxMko4TTIxd0FDc25xTEFnakZOUXUwTE1kZFZ4MjdSNFZYT1F0QnFr?=
 =?utf-8?B?SEc5eklHT2xCK004UHoySzY0YWdFaTIwVncrSTl0UzRwdC9FM0NwOTBUdmtN?=
 =?utf-8?B?ektZb2pPNVUyM2JvQ0dWNFVadjN5Zm9jMnovT1lZbUlaZVpDV3pialNJeWha?=
 =?utf-8?B?eFEyRHJiSklMK0l0aHNyYmw1TjQxRFZEYzJDMDljZ0Y5alJSSis1ZUJyL09Q?=
 =?utf-8?B?Z1hZZVNpVTBsWEUxSW5FSWZFbklsNm4rTG14dnBUN1JMNVVWczVyM25iMGFn?=
 =?utf-8?B?TEFlbEU0WnhBVVVqajNweTJ4cllXNWVjbXV2YnBsdkxUQmRGa2YyNkszbHFr?=
 =?utf-8?B?T2cvSUhSK2pqSkU3LzZtM3B6eXFpMDFyZWsvVVNGOHoxR1hZWTd4N1hPVDRU?=
 =?utf-8?B?c1g1Wk1UK3FNZ3IyQmZUTGlTR2REQVRveG16aG5aTThPZk9wb0dKaVE2SWIw?=
 =?utf-8?B?VUd5ZnVyd1RaUmNWS3hDWUhOdU9qV1RhMk1Jc3dmbWJrc1pwWWZhU3RFWElT?=
 =?utf-8?B?elFjSkhGZVZmQUNyYWx0a2hsOG41WTl1bFEvWWJMVkRma3pLUzl2VWV0aU9B?=
 =?utf-8?B?bXZtV1hsR2RtOGdWVjRKK2FYZ2Q0d20veDdrQVVMdlNLL08xeXVjNUdmcllU?=
 =?utf-8?B?ZC93MTNzMUdTblhzc3AveHdYU1dpREQ3czVQZnVlVjliU2FXWmtLSWJGNkpp?=
 =?utf-8?B?cVZ2YkJYazhOa085dWFTYk95M1pseld2b0t6dlJUZ0h3S2FBNXZXdDdxdDNV?=
 =?utf-8?B?TnNJMWp1UmZTbmk3N1lNZnR3QnZ1V1ZoemFKR1gzNTNMQnBWODFsSXRnb0V6?=
 =?utf-8?B?WDhncHRpWWNQNjVCdmM5ZDlvVlhzTGREdGtlTHVVQkxObWZ6QWV0cXhtejZW?=
 =?utf-8?B?dUNzRExlV0s3Yi9CWXp0Njd2QTJkMncwWlBvVXI3U1QwU1NtVGh3WmM3SjdJ?=
 =?utf-8?B?Q3ZNZlA3WHhSSzF1QUxOUVdzekplNVQxQVZXRlMvZVpwcnVhcHFzNUhiUnM3?=
 =?utf-8?B?aGtQSzJRbFNLODVVOVFkcHEvZWNURzJCVTVxWU5NblN4UHlUSkR3NDFKN3lL?=
 =?utf-8?B?czJ5ZGgyY3BGeEtaRmVDRFVNZEE5Uzltbk1pMDZJbWI1MVZTQkhhelBLWFNY?=
 =?utf-8?B?Q1RtZHEyZm1GeVMyMUs3a2ZxUHFkRzJ2S1JGbmE3VXFxNEZMenk0aXZFRHZ1?=
 =?utf-8?B?bncwdWRoWkNqWlJ1YVFpODZ6aUw4ekc5TXdzVG1zNzhTSHFiZ0d4ZFZMNGM3?=
 =?utf-8?B?VFNsUWpMNHFZaENhcG51K1N3WEtXK3BsYjdTWGloUC9iVXU5SUVxQWljNmQ4?=
 =?utf-8?B?K0hFVVpCQUsxMnhmMzJMRlRwMXY3YWFMR0xPUGQzV2wybDdSQnQya3JwUjhP?=
 =?utf-8?B?TmhPRkI2KzROOUtodnJJNGFkYWVQNW1rWHVkRlZ2K0xXRkVMcnNZRFFkWWt5?=
 =?utf-8?B?V09mWUVqNGt4eUpPUmZNWERCeGNxUE9KTEZXVWdwV3k1ZUF1Uk5zOTA5Qktx?=
 =?utf-8?B?d1lqcUI3eE02cy9wMGM5Q0t2NWhvSnExb2JGMG9WMzgydHFsMkNFNnNtVHIw?=
 =?utf-8?B?WVhxeGJKTS9YYzg5RmpZZXFjQmhDRXJ4ZnlRK3JMNmFyOWhvT0dyaVp2Q0l0?=
 =?utf-8?B?QzdZbGw2MnZhN3daczA3SWZQU1greFE4bTRxWVRtTnJkNnV5T3IzQ0ZjQ3Zl?=
 =?utf-8?B?QlNrcTQyTnh3M0U0aUtraVIzVWxaRll5MkdXODE0TXZsS2NwTXV6SEpBN1lh?=
 =?utf-8?B?RXJRdzdjbEptUWRlNnYyN3A4alBSWWx4dFJ5c2lqMWt2enZ6K0lESTVkT0tV?=
 =?utf-8?B?UFVyczg4N3ZYVlBESGtMTStRL1NWQ0tGaUJUSjlpekp3WERwZVZwQVdlMytY?=
 =?utf-8?B?S0RRazlWZVZjRXNrTEFKZVM2WDlFNWNQZ25rTTIwd09GalN6Z2RlUGZhdjdI?=
 =?utf-8?B?ZDNoaE9uTEpIKytIOGttQ3ZkS0ltUG5Gckg4eEZ2NjBBWjladG1yc0c0TUtX?=
 =?utf-8?B?YmhpL2tOUlZFc3Y3WXRyZ0o4blNiVHJmVXRxUFQ4OThXQ0htcmxvMDBDdDhs?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4/yYS65kbvl5Im0+pwvfr2RkAWnYlgJRXnReP4nhSyW9z+9IRfiHSVy+nqYXA7ADNl+BLsHfNM17LPMg34aHsQLyWfP+AmIbVaqITHgBdEMeR9X2XXaqJMIKA2sAjg6Ai/n6Ht1tgm/Frm0t25vQmXSyxxnOWUqimdICRCDV5qeVgj79Bh0GJljdDeUvVadkw1FY9Fjds6ustrjBjth3BlZABp3L7rDGJW7zWHNpGgZAAqlr9ooN1bxuB+UFBY0V0DH3Sz36vw3oEK9PFeoaEubwfMguaFiMr5a3dIEbp8QW0XRyu3MpzaGNgn+KxhIapUK9ZWBgV2fREY+zQ9ZfekBGBe99hqX2IMePX6UFzUxHXNVmQZpAx+ipTCZ+zAzo2oXQQv5k05VL/ODhE4rcJF7Y9kaEgw1BUz/V21FuNnbELCZggETixGxI6QfbYWoIQ0GT1AjdQhimLeX5/HHybfA5tVBGYj9VWY/7tGvTtZfSPmDSP2u6r7lhZcb8MX5GT2J9zmZ57Ci3HZhpoyUre9a4vK82LlIU4h9qGBqJRn4UKtMH2zr5tKNwEde00XVUNMgTQCu/CGQ/AmpYA4nBNrFBMCQPFjOBzyy12sLOf/0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8033f2-c298-4fdb-0d94-08dda768ca70
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:17:47.1990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wROMZiEE4rhVrEFchqs2TICgUVPEdehJFjnoRSQi8nSJRY4xHXxsacyYe4VJuHtao8yomHss28SJ+SSY1m/3JPyOFaibXkiSKyxly8KERdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5598
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090112
X-Proofpoint-GUID: I9-nX3pZqlEvq3Y_e-2_sBO3GuW-sW4K
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6846fb21 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8 a=8xJKfzfH2gkFajNTWHkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: I9-nX3pZqlEvq3Y_e-2_sBO3GuW-sW4K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMiBTYWx0ZWRfX3MjhuaFta4H5 8y8BlKNyTzhtQVZo12NNm5RyYr5kKKVR5oTZAzzAs4U4Z9X7LwuKoE1NZuMbiRc6M8t/isai5PI wWazDBOvO61EFa2u0Y9G0fUbA41IpltA18+5CcByKIBxK6xBdxv3tWCpzJzdxH4RfrorHf3HpUq
 8RefUY8M4MWHABMKpcLA8qxz+woEMOV39TTKHEhTsIA+4ETfaovtsPDsjfOL9nU7MVHlMp5xyys P29SwP+QU0cr6OPeeQMHultlD1W0BFCVQKv3zgvBK7xz3qOd67WhPtALmEf6CKJOmzG/bRHl+cA siDuqbo3EH3nh4ytugx7CoEYA6f+U38n1o2lgaAZTWb+s0Yh9cMNfgRrN0tvcucpTr6KSVLCwyV
 pCbv+85X7YWxJkkmkEzxhk1xhscBPIwrh4fbYMEyxnR3m3l0On7IwlVwVXmiPTfZe+vgomA3

On Mon, Jun 09, 2025 at 02:10:12PM +0800, Baolin Wang wrote:
>
>
> On 2025/6/7 19:55, Lorenzo Stoakes wrote:
> > Not related to your patch at all, but man this whole thing (thp allowed orders)
> > needs significant improvement, it seems always perversely complicated for a
> > relatively simple operation.
> >
> > Overall I LOVE what you're doing here, but I feel we can clarify things a
> > little while we're at it to make it clear exactly what we're doing.
> >
> > This is a very important change so forgive my fiddling about here but I'm
> > hoping we can take the opportunity to make things a little simpler!
> >
> > On Thu, Jun 05, 2025 at 04:00:58PM +0800, Baolin Wang wrote:
> > > The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
> > > means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
> > > will still attempt to collapse into a Anon THP. This violates the rule we have
> > > agreed upon: never means never.
> > >
> > > Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> > > in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
> >
> > I'm generally not sure it's worth talking only about MADV_COLLAPSE here when
> > you're changing what THP is permitted across the board, I may have missed some
> > discussion and forgive me if so, but what is special about MADV_COLLAPSE's use
> > of thp_vma_allowable_orders() that makes it ignore 'never's moreso than other
> > users?
>
> We found that MADV_COLLAPSE ignores the THP configuration, meaning that even
> when THP is set to 'never', MADV_COLLAPSE can still collapse into THPs (and
> mTHPs in the future). This is because when MADV_COLLAPSE calls
> thp_vma_allowable_orders(), it does not set the TVA_ENFORCE_SYSFS flag,
> which means it ignores the system-wide Anon THP sysfs settings.
>
> So this patch set is aimed to fix the THP policy for MADV_COLLAPSE.
>

Yeah of course, and this is exactly why, but what I mean is, the patch
doesn't explicitly address MADV_COLLAPSE, it addresses a case that
MADV_COLLAPSE uses (which is as you say the motivating cause for the
change).

So I think the commit message should rather open something like:

	If, when invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS
	flag is not specified, we ignore sysfs TLB settings.

	Whilst it makes sense for the callers who do not specify this flag,
	it creates a odd and surprising situation where a sysadmin
	specifying 'never' for all THP sizes still observing THP pages
	being allocated and used on the system.

	The motivating case for this is MADV_COLLAPSE, <blah blah blah> :)

> > > To address this issue, should check whether the Anon THP configuration is disabled
> > > in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is set.
> > >
> > > In summary, the current strategy is:
> > >
> > > 1. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == false
> > > (global THP settings are not enabled), it means mTHP of that orders are prohibited
> > > from being used, then madvise_collapse() is forbidden for that orders.
> > >
> > > 2. If always & orders == 0, and madvise & orders == 0, and hugepage_global_enabled() == true
> > > (global THP settings are enabled), and inherit & orders == 0, it means mTHP of that
> > > orders are still prohibited from being used, thus madvise_collapse() is not allowed
> > > for that orders.
> >
> > OK so it's already confusing that the global settings only impact 'inherit'
> > settings below, so they're not really global at all, but rather perhaps should
> > be called 'inherited'.
> >
> > Maybe I need to submit a patch to rename thp_inherited_enabled(), or perhaps
> > that'd just add to the confusion :P
> >
> > OK this is also not your fault just general commentary.
> >
> > Anyway, I feel points 1 and 2 can more succinctly be summed up as below,
> > also there's no need to refer to the code, it's actually clearer I think to
> > refer to the underlying logic:
> >
> > 	If no hugepage modes are enabled for the desired orders, nor can we
> > 	enable them by inheriting from a 'global' enabled setting - then it
> > 	must be the case that all desired orders either specify or inherit
> > 	'NEVER' - and we must abort.
>
> OK. Thanks for helping me make it simpler:)
>

Thanks :)

> > >
> > > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > ---
> > >   include/linux/huge_mm.h | 23 +++++++++++++++++++----
> > >   1 file changed, 19 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > > index 2f190c90192d..199ddc9f04a1 100644
> > > --- a/include/linux/huge_mm.h
> > > +++ b/include/linux/huge_mm.h
> > > @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
> > >   				       unsigned long orders)
> > >   {
> > >   	/* Optimization to check if required orders are enabled early. */
> > > -	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> > > -		unsigned long mask = READ_ONCE(huge_anon_orders_always);
> > > +	if (vma_is_anonymous(vma)) {
> > > +		unsigned long always = READ_ONCE(huge_anon_orders_always);
> > > +		unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > > +		unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> > > +		unsigned long mask = always | madvise;
> > > +
> > > +		/*
> > > +		 * If the system-wide THP/mTHP sysfs settings are disabled,
> > > +		 * then we should never allow hugepages.
> > > +		 */
> > > +		if (!(mask & orders) && !(hugepage_global_enabled() && (inherit & orders)))
> > > +			return 0;
> > > +
> > > +		if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > > +			goto skip;
> > >
> > > +		mask = always;
> > >   		if (vm_flags & VM_HUGEPAGE)
> > > -			mask |= READ_ONCE(huge_anon_orders_madvise);
> > > +			mask |= madvise;
> > >   		if (hugepage_global_always() ||
> > >   		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> > > -			mask |= READ_ONCE(huge_anon_orders_inherit);
> > > +			mask |= inherit;
> > >
> > >   		orders &= mask;
> > >   		if (!orders)
> > >   			return 0;
> > >   	}
> > >
> > > +skip:
> > >   	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
> > >   }
> >
> > I feel this is compressing a lot of logic in a way that took me several
> > readings to understand (hey I might not be the smartest cookie in the jar,
> > but we need to account for all levels of kernel developer ;)
> >
> > I feel like we can make things a lot clearer here by separating out with a
> > helper function (means we can drop some indentation too), and also take
> > advantage of the fact that, if orders == 0, __thp_vma_allowable_orders()
> > exits with 0 early so no need for us to do so ourselves:
>
> Sure. Looks good to me. Thanks.

Great thanks!

>
> > /* Strictly mask requested anonymous orders according to sysfs settings. */
> > static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> > 		unsigned long tva_flags, unsigned long orders)
> > {
> > 	unsigned long always = READ_ONCE(huge_anon_orders_always);
> > 	unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > 	unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> > 	bool inherit_enabled = hugepage_global_enabled();
> > 	bool has_madvise =  vm_flags & VM_HUGEPAGE;
> > 	unsigned long mask = always | madvise;
> >
> > 	mask = always | madvise;
> > 	if (inherit_enabled)
> > 		mask |= inherit;
> >
> > 	/* All set to/inherit NEVER - never means never globally, abort. */
> > 	if (!(mask & orders))
> > 		return 0;
> >
> > 	/* Otherwise, we only enforce sysfs settings if asked. */
> > 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > 		return orders;
> >
> > 	mask = always;
> > 	if (has_madvise)
> > 		mask |= madvise;
> > 	if (hugepage_global_always() || (has_madvise && inherit_enabled))
> > 		mask |= inherit;
> >
> > 	return orders & mask;
> > }
> >
> > ...
> >
> > static inline
> > unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
> > 				       unsigned long vm_flags,
> > 				       unsigned long tva_flags,
> > 				       unsigned long orders)
> > {
> > 	if (vma_is_anonymous(vma))
> > 		orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
> >
> > 	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
> > }
>
>

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D370823
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989493; cv=fail; b=q7DYnoy2axTb8iekfVN9HBqSgG+Jt4fGBwWj2ThhWpSkDF5Y5VG5KGOB0utiK7O3JQkWGcnLAKhwaol4+IpeXPda1Vdbs5e020dKxlQgvyxFV5kfIv08H9O2hkWMZbtO9tupNvaNH5RImtpbqoo8ravc7jsVEM5ob0mJw3FNpDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989493; c=relaxed/simple;
	bh=hBI5k4LAoolF47k+NWmN/PQVp5PgmnZQ8oWwAZoet4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Uej2UYv6PC5DpuwjFWqyWhQnj8VHYAoGLMfOwkXhcEsxGjgVXH3NculFXoVm4jJv6nRddrS6FTuytWaV8V7fBONIF4R8OtJae53Wi9xkPkgLeQgeONCz+vPUYRF/UXAEs4xjUkPwVdG/xl9U5vyDentzyHU9dOHc4PmLwLf7TI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EGyMDgiq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rV5CccAT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EGyMDgiq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rV5CccAT"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IE9whA001214;
	Fri, 18 Apr 2025 15:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=RgCYbeOIhUpuSS/Xx0
	deTP1E7SG9A+fGexs3WJk1P1o=; b=EGyMDgiqA55EzaaytjHRlNZaFSbbutemrE
	OHiNroKY3uNu9CcZzmlBJWxmfIfTUQk3q8DPZtgcGrxUG+90OTm6xamClFnRs/Gk
	QNQ4QFiGzz18IFkvOaxgUHnzs0cNXTCRDcChoKqDyzg4qGWowiBcJyB0sbm/I0O6
	M2yi7Dfp3mvDsC/EM2FYf7YQHmRt3mnT5/HNaDFT5m5HdfZkMIPR1Gy95IxAnVUW
	hxqSABrfifzRqWBphxo5DvUZyXD3Skp5SC5HELMUOHOObMk1p/bqeCGbBFaAUu+5
	Ox1sj02WsnK6XupLShof45xIqtACRcpREeyC2I4l4kZmRTDc3YFQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187y0e7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 15:17:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53IECDwW024673;
	Fri, 18 Apr 2025 15:17:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d54yyy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 15:17:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7WhjA83JOL/UOyZ9nTBZYM/DFyGAVbwIeMgvkgDYMqOrf8PWfvEBII1BqStYX17m093bil3Xj1l5icT8nQcDxKEs1E/XX0bFUUjWAey1y/+UA2vXydSHMVwq5o6KpCqeniCYEQgNFBq9ViucSk0qX0BIy5LPJ9tvDcltHh3UKOowCIw8t0+wyzz4K0dNdqpoU/NXJ0vo3etoPSv0GdQ0ojSWdYEMq989Q0Hcq79u+iIlBAeUTGbfv1/jx1PX6uRqGIAhVoqJE3WtyAZFKOkIzK6tXCt2LXOW/1Ip/Dym2W1siQnWC8SLdy/SZgX4FZ8vlKkafZX6uN2zYfMrzuC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgCYbeOIhUpuSS/Xx0deTP1E7SG9A+fGexs3WJk1P1o=;
 b=sN1u3w3OKr2lP5CAld4lVZewFM6KYPe8aZ6eYyEVf1UCLgC5NKJH8WD6BA80hj7xNsZvZw764aLpivGSnqoll0bi2uPWgq1b3RkKaOJ1afmPTKr5jaoX9adzHg9xc4pCNNz+hzspuTDqOTF3p/lhEBjfFbKqTrUXMI384lLcvsis5C4W/V/hrUNunya7aNCYrkbD4IepfBeqv6RelRVdrBf8C0cttaTuBwi7Ftr4UwznNZG8XEguIm1tbYq18i6RFr7FzY0Vc4sUdTXV3IN4XIBerSRwfxHBFTLMLovIvMhoaBgu0nznjVdMJOKW8O2zBZhygvoMehE40eI1noh5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgCYbeOIhUpuSS/Xx0deTP1E7SG9A+fGexs3WJk1P1o=;
 b=rV5CccATHAP8douEj2NN80EW2MQTUNCKrh1eDLgl4Ns5d/ObDZsS7+FCJMAHSjVecD01RxLvQ9Bk04esmYKjIwBTWMo7m0sbrju70AUpTK8az/HL4v/7lmHA7ksVI238NXFCXCVqJyjjJPnkouhIkyeLJPndhTb9enl1I53mtxc=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS0PR10MB7272.namprd10.prod.outlook.com (2603:10b6:8:f7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.22; Fri, 18 Apr 2025 15:17:50 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 15:17:50 +0000
Date: Sat, 19 Apr 2025 00:17:43 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: cl@linux.com, rientjes@google.com, vbabka@suse.cz,
        roman.gushchin@linux.dev, surenb@google.com, pasha.tatashin@soleen.com,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com
Subject: Re: [PATCH] mm, slab: clean up slab->obj_exts always
Message-ID: <aAJtFwAH_ayIJ-SR@harry>
References: <20250418061459.3898802-1-quic_zhenhuah@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418061459.3898802-1-quic_zhenhuah@quicinc.com>
X-ClientProxiedBy: SL2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:100:2d::22) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS0PR10MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: e67e300f-61e2-4229-e79d-08dd7e8c2eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tYH/LzXCG28CZAp7ZSnBo8QVWPHWtS3KyIIrc9heFvstS1YkMM+d8E1NM1xt?=
 =?us-ascii?Q?4MAJzeLaRNg8J+Ug49sWEmwwRgw8tl+KeQtbOOszG55hlsSixPtJAOBorOMR?=
 =?us-ascii?Q?ylydSDf5hkL/UZieYWwV37tyK/F2vbA/MPfUldYUu3gRBNCYoXOoy8HwKvXK?=
 =?us-ascii?Q?5N9iRV0ACWcSGBZrPYAN68CeJtI6ZDt6CfGPhAA6FxgLdcnFw9kWalasvyVJ?=
 =?us-ascii?Q?iXu5PS+WiL3i9RLvv9QyspFTzI708WKl7J4rDERwVyvjDeK28gTOlDV5RSoh?=
 =?us-ascii?Q?MdsIT64+c3OXGispR7qzC9SqRqHtJ7mhPbqADm4y8d9pU7tfo09XsLgSG/Fe?=
 =?us-ascii?Q?+3ohQRNaB8ecMb+rNEd5RgTCbBvdVwqYvrz1suCY+x5UBgiXLUAH9JqWohO0?=
 =?us-ascii?Q?TFt+gOlQtRkUqKaWpdNI140yW6El420J/rcEMm02cl3BBRGhQz6YqaJ9Syg7?=
 =?us-ascii?Q?01hmK190PyHgWFwzHFzGe+Oyf0n1B/hPwbMcae37w5I8CrR8E3p7fwMB6LGe?=
 =?us-ascii?Q?iBh7v5SqgabGim2c/vC5NXHTdHGeu8yrQJUGTTtejjcets8s+E/h3O03EIMU?=
 =?us-ascii?Q?z3M0msi3ANQoPm6XMWKp6IU9lQMx3k59kOUyPVQM8wuwXuXVDp7ttC5u0GH1?=
 =?us-ascii?Q?xCSFQNOxsfn8Mf//sLvjTICRY1R5osraqeqwhbSYi+9GlF86pRbBr4gC0jXl?=
 =?us-ascii?Q?BtJO9AP7UQIH/h1OJHljdnImgSfHlIdafcr7EAbXr9WEKzZi1lrlRJ/fJbnD?=
 =?us-ascii?Q?1NcOPqunoP8Fqe1PIqRaB3abvxa2qqzu8bKPSVCqGuFBYVsxwcrRJiFdlRF7?=
 =?us-ascii?Q?6uf1HzUxPR5NoXuWn5YtZiHm+XvG0bD7ko4plIshUmb2yqBVqe7MB8jMNBm4?=
 =?us-ascii?Q?HS3KxMitTzqKnBK3s/zaZRtp0y6mM2b639BKbqKVBlhjbNKJKrf/OgAVJJAl?=
 =?us-ascii?Q?49sovVlA5CNEYhQQvt6ooPiCPJ5J5sdSmXIFcwwGM0BF7uWkxvcouFA89Yat?=
 =?us-ascii?Q?9yyRPALTbaMi4kpb4Hg6ciXg+pRDNrAjCs7RPU1g/2zWbHN4WrLYKP3xXexi?=
 =?us-ascii?Q?O+Vo+36ZDjSjejxuwwOkbe2P2gLCFTnMdnjmK3mPvY6rlBE1E3ALDYJQQqjc?=
 =?us-ascii?Q?w0Y+BgikgmA1BYCriZU/IfFXLJ8vABajYa9Fs4guLtyYHn1AvsIIoUsHVsIn?=
 =?us-ascii?Q?aUDKwSNu6U1jaOAs8e/lN7FkdwvPuZYs0oIGF5OgBp1mPP3dhbocu6GExsba?=
 =?us-ascii?Q?6TliXJelqwsWZofRCxn7wcCJvTTGjRuS7IBUY/5sBiyCOez0zrFzmw2fTM0x?=
 =?us-ascii?Q?75YvCDD8T1xCjlwBa/FV32WH2HZAJUqH8diSM+Va6ndv0FQKTt2GROUFuIEY?=
 =?us-ascii?Q?mscD3CyaSnVpzOqTfP+nZi58EQTGgUJh9wWcQma/mKbspn4U977MIL4nN36D?=
 =?us-ascii?Q?ElVSPuhcqck=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AotGoy1mmmklP4NScrf/3cbeUNhDJiNvVEPE3M7IIIkwIteYvs2irXXeAhF5?=
 =?us-ascii?Q?vzgwzcJbAmsBT6cA0SIV1eoOA9axJaBZ/N/8VPfbTdCdSJdbEyQQw/e2q8bB?=
 =?us-ascii?Q?fYDePY81TDc2xVvDRnwskE3Bzc5GhI77WLmTLUSWHZvIaHtgsXGWK0FHR/Jc?=
 =?us-ascii?Q?eJ/tbKRHIA/I+kEHgpNAhuk8yL6CAz0HwH1lr1Ywvd5lgAZHoHWbcxcYR8ig?=
 =?us-ascii?Q?xXN+YjMleUgzKqqA5jNCQdj1Oftd0lHxbAOoiLdxO/vOePDzYxM1AEXzqFx9?=
 =?us-ascii?Q?bh+WYp5KaEh/556TlWIBObGflj/kPqChFNFP8WB8FTcWrZtuDUW7alGSSABe?=
 =?us-ascii?Q?Hc3j91k+pAKgvZ30DKI/WesylKU8kmtFyviVBgcmQW3z2rspK/11akTauWgQ?=
 =?us-ascii?Q?E9JiaHH14gj3QcJgd1BUbSNKN+Z1NlTGwGWzaqXsK/mNeuVUGf0BjyrEiWlY?=
 =?us-ascii?Q?ZNqpyW18wSQP1rACy4Lzb8p1Msh9E16N/UPz5y1aS5a9McYZI9G4KTQets2m?=
 =?us-ascii?Q?buhNPeiNXJjYjbN1m30PUNFH7keEXgccM1gFd0kLyd/QYqBPIM6DsAguY1px?=
 =?us-ascii?Q?wXpMr5ZU3ZGf6HL5bfdvaqbGUOkLbnKtwzcBs/xZbWIUDvUyDSSZJ91BE/I2?=
 =?us-ascii?Q?ZE7m6IUscw6MqKm8J27pYEjfkvGRpG4zRYFqWcbb5zIpIkPU8tCTckVypeMO?=
 =?us-ascii?Q?wEWFaiAI96dACztmIU3tAzyN4uEb7M7J8zHzK0WHuaypPY2zUErKC6rpjOtY?=
 =?us-ascii?Q?g4ZORvQsbPasRRONkQXd1Ioqj+zJQ8Ce7vem4rYoK3bW1yQmpsSYc5Pq3HB9?=
 =?us-ascii?Q?gDd2UcRRjKE2Mu4cJ+Kmnp/NktS6nszFGcoOeq0dbWB9a5wemN2H2wy0h6xd?=
 =?us-ascii?Q?cXvDTCKnal/DiQFvO31tbzDC/TCuEDLWPRHt8k5Z+wc6TijrsmatOerkjNNU?=
 =?us-ascii?Q?HtULcG51arunMHG+BUeAlBiVkDBel7p+zerScRJTlPfqCqP+BsBCQiuZebPs?=
 =?us-ascii?Q?ppPtMAKSloJ3XPayIaOXcnezzNhLmzW03SYJ67lRv+Tg6UQhgLM1FFifkItf?=
 =?us-ascii?Q?aWtC7o6ia9/BM+mpEV/DxaBHzBtactVxZMOmBiM+3E2JETisRq91YfoKOmxg?=
 =?us-ascii?Q?cLe2HfO8H1Vz0SZc/eiqawe+43DT4oxz3Lz/SxxHCNwEr7mGggs97ECM9Ti4?=
 =?us-ascii?Q?QpJ+ZZGFlVHyL4zrAkRyKWXqO58YYzlhPB5RMS2AFkAZqK2optw8NQJvSEzK?=
 =?us-ascii?Q?UfxrfNPuDMya14KeINNV0ZOqj9TlxDe6xFcqlhoTGSUU/Aur1f00+cQt6Y3R?=
 =?us-ascii?Q?137MoJ7Vi55qBI3sZYRqhAZ8NWU0IdijHTiYGWIQKlAZb4tsXAIH2YGKjn8s?=
 =?us-ascii?Q?wj8mQlzDkfU1Bvx1jcnvLr+arIWw1UbjnfuWEXqLC0/mwtuYSM4nRe625W6B?=
 =?us-ascii?Q?wNLHEShAzjWGyQ1dC2X7LpGQJMMyamx4yeXeRltaKnw2zq6q1+XR/dijJLlo?=
 =?us-ascii?Q?mqsAiFSgbl7uLF4l6gQ8iOuQ+e+H9nSiF1jt2TfKrTDaClnF3Lom8Tl1ShkX?=
 =?us-ascii?Q?sDCrKuSTGnqZJg4oLVrBvhZUq9h6SXHGUA24dFMs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Mwc+vFW+NaBdvGkhKpwCgV2TtWto02pBKI6fZ7K/knXwAGfWmlRLwbi8yShJA2DNldfkO7s000rlx7jbFZ6AHX34JNJReJW4VEL/3DKVc+a3vZ64eqHvl1nVFjugSayhI/vUtl5HfuGtX0lLB5GqXIpfmEx33bNOwqPlGSZZ4nXV224l5Nro+5/MGYg7x+Hz1Iu7nWz3POmWqbwR7cWh1eN4np+MdghdMNX+ieF+Frb1sOqTADO/1TKcUOuaKHPn5hnebaT+iy8mWE/n2VI2BWZjYSR1fxfV7F+qf6okcIKugT+DSL0lHRf2DhCIBp5FTrcsQNNQG6owXHdKXHDrsUojdZ4gd0owVop549eG2V/mg+CT5wK746JtpQU7QX8zsDlUsQrZb7sOXdC/3Wu3ct5x6Y64Mn3pWS7/2LaKqFxOnQ9YPaZdFqA7ZdNoqUZ97qh3KSdt+FxF7RmOF8R9ObenWt7QTEgkaaCq9v0i8FRZKrNp7BP1QY//4lLz4tRH3SN8wHY12q2BgYagZ2G7KOEPz0oJ/YPyvFUMtv8WrS4C9/pbWYfyYpUvy8BFXi4bcKRU9GWrUGyaDUIkyGgsjYIpRE3Jo0S3JdSAXPztMrk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67e300f-61e2-4229-e79d-08dd7e8c2eb8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 15:17:50.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UEP9WaSlDtE5WdW130tqmy63dwX/5ClrqvZkyXYoKE+f8XV/MMfBqPBELtN+x9NIfnErRKeTwcE/aP/2Ezc/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7272
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504180113
X-Proofpoint-GUID: CAKypsBiBJsvTryw8mdj9P-vGPUb5Mra
X-Proofpoint-ORIG-GUID: CAKypsBiBJsvTryw8mdj9P-vGPUb5Mra

On Fri, Apr 18, 2025 at 02:14:59PM +0800, Zhenhua Huang wrote:
> When memory allocation profiling is disabled at runtime or due to an
> error, shutdown_mem_profiling() is called: slab->obj_exts which
> previously allocated remains.
> It won't be cleared by unaccount_slab() because of
> mem_alloc_profiling_enabled() not true. It's incorrect, slab->obj_exts
> should always be cleaned up in unaccount_slab() to avoid following error:
> 
> [...]BUG: Bad page state in process...
> ..
> [...]page dumped because: page still charged to cgroup
> 
> Fixes: 21c690a349baa ("mm: introduce slabobj_ext to support slab object extensions")
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---

Acked-by: Harry Yoo <harry.yoo@oracle.com>

I reproduced the issue locally and confirmed that this patch fixes
the issue.

Tested-by: Harry Yoo <harry.yoo@oracle.com>

By the way, I think this should probably be backported to -stable?

-- 
Cheers,
Harry / Hyeonggon

>  mm/slub.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index dac149df1be1..b42ce3a88806 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2023,7 +2023,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
>  	return 0;
>  }
>  
> -/* Should be called only if mem_alloc_profiling_enabled() */
> +/* Should be called if slab_obj_exts(slab) */
>  static noinline void free_slab_obj_exts(struct slab *slab)
>  {
>  	struct slabobj_ext *obj_exts;
> @@ -2592,7 +2592,11 @@ static __always_inline void account_slab(struct slab *slab, int order,
>  static __always_inline void unaccount_slab(struct slab *slab, int order,
>  					   struct kmem_cache *s)
>  {
> -	if (memcg_kmem_online() || need_slab_obj_ext())
> +	/*
> +	 * The slab object extensions should now be freed regardless of
> +	 * whether mem_alloc_profiling_enabled() or not now.
> +	 */
> +	if (memcg_kmem_online() || slab_obj_exts(slab))
>  		free_slab_obj_exts(slab);
>  
>  	mod_node_page_state(slab_pgdat(slab), cache_vmstat_idx(s),
> -- 
> 2.25.1
> 
> 

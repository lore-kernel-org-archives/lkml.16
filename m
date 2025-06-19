Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89522405EC
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337636; cv=fail; b=gYfILSHCnIXQL8NxX1TenG6OJXKYEhX+l2tJMNEZ/5I7FAw45XlIQcO/xxJoNiaSPK1TRBczN42/UPBODO7bg3OX9Hk6nZ1FbbWQsvLVSiZQHBwWdKFvwHP3zuj5xnzzLaggNJXtaP2ArkGu1joisuMPO5fgWc6sp+0RRBFDAIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337636; c=relaxed/simple;
	bh=cdPsqPU8bC6FGV5U4363WNJavqLVUy6ypT4tr1+MpZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FZjxXM29kDhh/kM65+CvhJ4HEX1DWTc9ZEqo7K5eY9q+L6+4IiNduHxhb464Q6J1RSvs75kwFjjlo0c29jYgJJwuHc8DbNOuOMBTMt5ow2ySboPoWwvKDJSEjnuzrhr3T+5a26vgOEVd626fdnFWiOzQtXWsJnu3IAEnKcCqefY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HXRrs/5t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qzNqEiHX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HXRrs/5t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qzNqEiHX"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0fbST027889;
	Thu, 19 Jun 2025 12:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=lC8dRjx+QheN5ZOtJF
	qcI+6/kFlVRF4amU58J4Ku3BA=; b=HXRrs/5t1RkXBKXFCQIdI5IbjSS0C+ayqG
	7eYMEEzQ0NS/D15t1QA30cMQW0T288CIubUIxJK1zuA16TL0SaHEKqQl21d9jef9
	V2vv27iEOzBBvew8LNBIIsplibFP7lud2tV48yjlGOvThH2LcesYcsfQ1FYlZfJ4
	h275yNlV7fMdzQe1C0xw1kz8toVULB5tbc5NIb0oifVi+WNv/aiQtO/vYlDt/n5H
	4Wz1p4QqBXPTwqvQKUjypETdQOWp2ryPb5MsUhTB2DGJYzMQA6GsLBliD66RWzZJ
	fhwaYyXoxdE00ASwxDqK8jnM0cUZ0Oa/1hKTNSs9OA2xtijYdQCw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd9tsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 12:53:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JB1FXc022769;
	Thu, 19 Jun 2025 12:53:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj4v5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 12:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LX3ihnC5cNi7HqB7GYaqaBpgKO/UOzPrdKUidd7xCJa0sFNjYc/n6K3Zxx3zR/WrB1vupaTreo2T32lu1ByVKmptN7HMengAqENGHgAf55IMnVHOC6HP966HpOtciBiCJo7SE9lUo9+B/Wj7pWvD/b3jUHA30+m8SeH/xLIwN1uZOnHuH9Q9fhEE4Pc9sxaY6Ibd1cFhGLO8sMX086kcgWYPJh252xVlMhR3qp1XYTJ0vEMy6+GaFOQO4imCCAXkgEVFtm7oeCQ+FLoZ/WnqIddHYk2LrCm4qehSOX2bGXfYYoI8lmcNq3IuLVjOym8Ol+gC5R5RghWS5BMJfA3LkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC8dRjx+QheN5ZOtJFqcI+6/kFlVRF4amU58J4Ku3BA=;
 b=wftrQoN+mEQ4kVgerQ3JCmSIImymy/Uya7UDcWBS4LoDTsKsy0+lXmX9qeLdtgnwDRyJH25ERAugpBuPVyECXluOhUlWXpAgdLrTooPTOF9aSKpGryVOUBd+YO59HVdh//XwkBI0OXF+JanVGGxtDydOuciy6Uz9lr4+iFR1UHhnM2c2ohXVYSjN0mqZpVeKcvgL0Y1iK1JqxHXGTRv4CI941hhWpncMIgNvRArntw5A/bxUg+3n1VKpaIOgf476lB+T+hFcKdutMWV9LdUYCOWUpDFODOB06It3H0oLx1Ejj0doXS1qUEj3LWfqoUKMo0c+a6v+dy9vrIyNDhnZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lC8dRjx+QheN5ZOtJFqcI+6/kFlVRF4amU58J4Ku3BA=;
 b=qzNqEiHXsqXDBGp2D0BMnPszCMNdYFEqKODwSkfZJBbe3dJUdu46T+XDeOpvdGJuUp8tQ0wym28bGcWhSrHTX5j42xV+iietACa3eLpHq5tuZ9kp+uYJYaqzgOz6g2r8kDYRMHi0qaJk5XSFe84pMXVV3/W/G8NLbQ/HapTZUJg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB8036.namprd10.prod.outlook.com (2603:10b6:408:28c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 12:53:34 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 12:53:34 +0000
Date: Thu, 19 Jun 2025 13:53:32 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
Message-ID: <40a79c33-2490-4d82-bb93-6a65d0d16e0d@lucifer.local>
References: <20250618102607.10551-1-dev.jain@arm.com>
 <f4de7754-e60a-4a87-9319-24b78a0c6895@lucifer.local>
 <e3a0a179-9246-4055-992e-3b9046e89748@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3a0a179-9246-4055-992e-3b9046e89748@arm.com>
X-ClientProxiedBy: LO4P123CA0688.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: f62ef2d0-0ed3-47ea-9139-08ddaf304d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZZUz8sTjBVfdwrzfJndNzsHrKjbB138ZlalKFpdjAZAAF2RRjLU4EH1TNBb/?=
 =?us-ascii?Q?wXlFgPON41Bl7diukVVt4THjWpespKgzV0r4Oz4KSbhIzHNjX3/3EsuGA92H?=
 =?us-ascii?Q?kBdkteV3zWtBu15o+bfZ2fGJba8gYmgmZfE9GoL83snxWIDV5fWsNQ3gB+HU?=
 =?us-ascii?Q?XrZTinZ9AmfL8a8fd18AzKPisaeeTmPs63eNqtdP4/7dmHMDCMM84nOUY28d?=
 =?us-ascii?Q?EVwF2JqVkefsVwuwHNvk7HRyL417FvcSOvg9OVPczHt/63kv4mYJIbX4lcMz?=
 =?us-ascii?Q?/2djglW4cga7OKd024rgl1Luwar8r7lS2mkIdSKf/2wqLds9hVJmKKqhIZ8A?=
 =?us-ascii?Q?6qS6ETOLmFURlQq6o8QEn/cPTJnQeMXLJEuY4OgOtexErFXXh2aImB5s/KhE?=
 =?us-ascii?Q?/PUhf+bkjEu3fKcnshUimSYMLJFuaA+MiYEiO4ngK8XnzMcnI4m4mhS/vQL0?=
 =?us-ascii?Q?+mD1fi99JyfBvLfNyCKGZmq+zvjrcuzG+vc5NQWUuo3i1iHzsrCG9+5ZFVFt?=
 =?us-ascii?Q?rC5j7e7yhhYiUQp4lUFb2yyXLxHV4SuBLfevym2TTftvT8soqC4J7H75GdNe?=
 =?us-ascii?Q?oOwIpuOoeCDdv0saF/zgFjRuTlD0K2qV3mccvCuErUZMjKzAURdveMY4/x3a?=
 =?us-ascii?Q?rFToiyuwGMPrymUjW9ZF3YfWx4P4E1cy+IINpo9/ZUxds3ebrL/MqmOLnK7o?=
 =?us-ascii?Q?UuTVl0jMS2sQVWIPaZWulOIPWDpjHMpOSmQKNE3o41Toq+CSTHjRNF/W6Hec?=
 =?us-ascii?Q?PgCbYyNOjYHS39yOEuKJs5ZYthmBhuxe9l7JH4qgTuMqke41wSENKH9j5rxz?=
 =?us-ascii?Q?swRdU107PAApKIlXK7sgZ5KUNAk9t5l255kw/wgU0GHRJklxi9PHAqB/MqwP?=
 =?us-ascii?Q?8MUka+MqxyyPAk27m1qsSmn3YqEMWEVwxrhl9SQ8fVe29JmOmxI+JLw2V0yc?=
 =?us-ascii?Q?AvsxystGTZiuBc2yGdc2wYsOlWpoiwTyrCHiy273ZP1U+juRMuKaq7Cx/VgK?=
 =?us-ascii?Q?jhbpfZW61lbZ4FODbp48UCMbxySWNuzSV4JKPtfUD3lJWa5eHmqnWhTwUUQ0?=
 =?us-ascii?Q?aSnn3qo9zw7BBkhCR2gbggJEr8S4yoR34/o9OKHzEm7iXgvCdWeqIJnm2RXi?=
 =?us-ascii?Q?Esv9HeDjXRV3JxjYFaAerN9jXsKXS1r1yZVV/aC9+23Xzq64LCPaYn1aNRQd?=
 =?us-ascii?Q?WaVIzZYZciv7xxvNAoRo8rnh58kno6neAdjVH3xabYqLj6+uOWClYx1RqVAu?=
 =?us-ascii?Q?i7OkPN/Cuy8nb4gDZZrP6hLmVGmgQIWj5TCxQZgdNNI7vIQ4vlgzqhotnrbl?=
 =?us-ascii?Q?m6ohJIUbo1HrcOauahj4iFMbelEC7+2vUOzzaNlJjckAWRZUO5LDO6YtWsAf?=
 =?us-ascii?Q?oSA3tbnaF36U737XEH3nCcx4UL/qEZ8pPGinX6Zn7kHS/TtuIxyUXqYLBZsn?=
 =?us-ascii?Q?MJ/J7g7VRlE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mUFOJ7V1Tnw8swiLSZ+xO+iLggCGhkNf5Xmt5fwvEGFGPJo4JcqOEZr7QQM6?=
 =?us-ascii?Q?M6H3+3svxf8RjVuO/zo4j4P+c0/r2OGwgyf2EWhXOQSvwsAzE0c7tVu2EIqe?=
 =?us-ascii?Q?1o8DlcFOWsi1QUA81LvR7GP37ZTOfuibsOCWcAp89ygB9WJiuLmxQsaZXydU?=
 =?us-ascii?Q?DeCEyp0ZdrYxdNupxX32ES8nvQX+kPwZWSdC8HIGSXI0isF18YHz9zXc5T6t?=
 =?us-ascii?Q?e0UlXGDKQv4qnu9GdrgVGL5P/z+2XrFoZA7jug010biArS6fwSr0RcdfV/lj?=
 =?us-ascii?Q?eoHxCH7RIgqmmheX/j8py50xxMimfckGcI0YLxK0BtLgj+HiVxLz3VJRHd+4?=
 =?us-ascii?Q?jPRMTWjJVQkrzoNPC/AAvF6NnghQuiIc+j6uSXbl5KFxdGSAovgVch7Aoltn?=
 =?us-ascii?Q?88M7gFx5cjFTGMt00gI3d+Qd1hw87z4q4M79Y+FwsiTJdrHVZf1WhxWwQMDZ?=
 =?us-ascii?Q?OB7g5w6ARTHznHXCrY/HdwDi65G3t5crsRn5Aso12K9+QTPIFu9eEDbIMO6r?=
 =?us-ascii?Q?XLiJ2rUyOU7cKnj9rzpik/nE/I84ID4jBxNgRfQlufs0yBhjvXjrPQVHpSfz?=
 =?us-ascii?Q?ddUKYjaqucRF0rlisqEKqzDuBp/8LNkhSf7d50HJRJUhj0id3171fCi8Pp55?=
 =?us-ascii?Q?iavF2OY0o4SNgi5DwkFubexQIjRcQST+dOtMy2lAib2SVnAHMSmYMAsb8N/H?=
 =?us-ascii?Q?Pdc7q4njjU7f+pwoA5nRCtmPcNo7kC/Uv6SNT3s6O7RGU2ITkPYx2D82uvzx?=
 =?us-ascii?Q?zgrboQgjIzhblJMOqu+r/ZgEkclXe7/oXP6oYLudkWOGex4X0QpOmexeK6py?=
 =?us-ascii?Q?HpsvJPIGdq49yDQyRhIZrmIWEgkJYi3Bo6/BS3Ck7lh6iMuC6aLVBU2Agz5X?=
 =?us-ascii?Q?DodqMuVRN4QjSdQzvCdgvriMuEdDGqgypCAlE2kxcP01ber4fvKnoP9wxJde?=
 =?us-ascii?Q?vPgmh3MgRWkvwu/Q9mnU1jjZEpi9zFku/5b8JovRABJWLch3uTQa6+L9vaD7?=
 =?us-ascii?Q?M9m7ntoEF+ptSO92n6I/8nXmqXc0yh/TmH/KFQk4fw0A4+tDqqBeSibg9ZO+?=
 =?us-ascii?Q?W6c7pdAdpDmC4z0JMIqb6wIYUcw0gro+StM79boQWV8ZJFDoXoWgX5R0Nqtl?=
 =?us-ascii?Q?X/uwIWh5uu0mKlOdGMM8uGuq2/U2AGBD4yAE+4+91QzNsZhi3sH748miBKQ8?=
 =?us-ascii?Q?uRIrgoquStzwrBdG8DyNW7Omitro1ZlGzbhbbUqtOfivO+HKgBLsGdX54HBo?=
 =?us-ascii?Q?NL+0IZ9/RMTMGVImNxJ8Qq5gN/cV9IUpmwrAWfldst/RgPeIBs4VW6plbRLg?=
 =?us-ascii?Q?qE0Es4173GlktjCs5aFJQI8w3QCuaw2/g4faJ5B1I9QGC7eXiFIZgFRkbIJl?=
 =?us-ascii?Q?N0K3/55AFrIB2LWarb/rsyZlsRT+K5OsIBWlHS1MMK9DzoiJw9Le+nLvBc0u?=
 =?us-ascii?Q?teAViwAv1xQfqmTFDr6v8+5cfIwKHGpxZ+QHK75S0Grsx20bPOuqK8teJ/Ra?=
 =?us-ascii?Q?T2E0CvJJrPuB1qzsUTPWbQMANO/8zdrasCYuaEOkXqZoABvSI4UBOgBfaeZw?=
 =?us-ascii?Q?OsThJEm0V969xztI9bEhAVRoqbLij5e1GYnIQ2i/Vf1TCskXRnwPxf4wkiX3?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/rEZ6CHJdcnKlPts8rVcjMknF6nUh1p4NCwds7IhL7Vff/50XLmHcvhBk+ZeBTHGgq9a0BI+vBHqwcfpKXClwYpr3wafZsJUEUCjfvjct8fQBOTNFoF3I8DK/K9TxQxXbKIYF6IvKrSQuFAKzrFwJ/0p8RdHrte6Hub99YIfbbFEdNDikV/QpOanbm7qzQvn8ywTvMkRHTw9aJ9JCcABhUqR5VLimhP0kThzddJmVXfYUdKKsOq5KGaRM/HGfv3DxAevigyK+s4eyQS5Has0i7/USukedeaJ7IDicDacQ0AvYtL0pdFM+R+kYP47SE/XwrDrsbHdhnalAZaQtwFUQAd9XAYmtF8aovDsSfYoAzPtSJkvixcdNGYGjSZ1rFTDe1nz6bJVC5tfKHX6VYwD8tKuBAn0E5mjoBDLJ4L7JMipzRZdaelumT8y3fScLAIvN4nOExJDXZpOzozkcrixDH+GgkWPAtSuLQ2qGPMoqK9pK0ECb1qeZRINFbm8VC4S6kWJtxnR4AUX21LDp8RAatd+yxZFDfSGt+L7SNu1dXbbqe6glvLwCOrrUnyjgSPrKTFrdKaA+jSZTdTSNJO0upIyjcguqNWPL+WHtX/8gtc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62ef2d0-0ed3-47ea-9139-08ddaf304d2e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 12:53:34.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1b1jBwEr3qML30NsvlsJHmxt7WfISG5rU287g/HiXLr4gDGEzUoE/oT5b2eVJRjmKzUgTh8NQY01hzwFPwcr3T/x0ho3mgsoaN9w8oeNLuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8036
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190107
X-Proofpoint-GUID: WPKy6wEGDSZNWMAg925K83X5gu2FICtQ
X-Proofpoint-ORIG-GUID: WPKy6wEGDSZNWMAg925K83X5gu2FICtQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwNyBTYWx0ZWRfXxgzCip1oiCEZ 84cINDSEaBX1p+v40SKrlixVGrp+2g38FtT45k+oIPI8zsa53RQhge0Hv1l5OGdPfkgngpLgwt0 J8JuaCM/HmOqUZV875RtJLIpbqTe8kwWcWBTidVQvu2VPzbFDnqYfFU0UxMG3tjah553cz/HaUu
 N4Z2V/RzZ2QAVqqEbASm53KuX/v1WoaZKdvrExLA5Yx40M1ZeS/hvsV5M0FJJKf4QSCwhA94NU2 PzOlOBS5w1KcNUn55TFYYYndm59xGFZU1bKUSGBK9GAehU+OcTVE9WeocevtHY6bMaP18m+GCWn sdaDbV2c3Z82L+OQzuhhVaehyoQp+2FaBy0nGakaMSKUXjILGm1DfSAJ4tgLAg2ZcncNfgYRRFk
 J532n/ycYHsVVuDDDBgShhIBqYYMOZwfrRJgcToUHOJd0uqXDLgnLaCTEIE/0ycrS4JE7Flr
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68540852 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=okTdQrre1o-CogPxC6YA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13207

On Thu, Jun 19, 2025 at 08:52:51AM +0530, Dev Jain wrote:
>
> On 18/06/25 10:56 pm, Lorenzo Stoakes wrote:
> > On Wed, Jun 18, 2025 at 03:56:07PM +0530, Dev Jain wrote:
> > > Use PTE batching to optimize __collapse_huge_page_copy_succeeded().
> > >
> > > On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
> > > Then, calling ptep_clear() for every pte will cause a TLB flush for every
> > > contpte block. Instead, clear_full_ptes() does a
> > > contpte_try_unfold_partial() which will flush the TLB only for the (if any)
> > > starting and ending contpte block, if they partially overlap with the range
> > > khugepaged is looking at.
> > >
> > > For all arches, there should be a benefit due to batching atomic operations
> > > on mapcounts due to folio_remove_rmap_ptes().
> > >
> > > No issues were observed with mm-selftests.
> > >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   mm/khugepaged.c | 31 +++++++++++++++++++++++--------
> > >   1 file changed, 23 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > > index d45d08b521f6..649ccb2670f8 100644
> > > --- a/mm/khugepaged.c
> > > +++ b/mm/khugepaged.c
> > > @@ -700,12 +700,14 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
> > >   						spinlock_t *ptl,
> > >   						struct list_head *compound_pagelist)
> > >   {
> > > +	unsigned long end = address + HPAGE_PMD_SIZE;
> > I assume we always enter here with aligned address...
>
> Yes.

OK cool would be weird otherwise :)

>
> >
> > >   	struct folio *src, *tmp;
> > > -	pte_t *_pte;
> > > +	pte_t *_pte = pte;
> > >   	pte_t pteval;
> > > +	int nr_ptes;
> > >
> > > -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
> > > -	     _pte++, address += PAGE_SIZE) {
> > > +	do {
> > > +		nr_ptes = 1;
> > >   		pteval = ptep_get(_pte);
> > >   		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
> > >   			add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
> > > @@ -719,23 +721,36 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
> > >   				ksm_might_unmap_zero_page(vma->vm_mm, pteval);
> > >   			}
> > >   		} else {
> > Existing code but hate this level of indentation.
> >
> > The code before was (barely) sort of ok-ish, but now it's realyl out of hand.
> >
> > On the other hand, I look at __collapse_huge_page_isolate() and want to cry so I
> > guess this maybe is something that needs addressing outside of this patch.
>
> Trust me I have already cried a lot before while doing the khugepaged mTHP stuff :)

Seems we all cry together about this code ;)

>
> >
> >
> > > +			const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > > +			int max_nr_ptes;
> > > +			bool is_large;
> > > +
> > >   			struct page *src_page = pte_page(pteval);
> > >
> > >   			src = page_folio(src_page);
> > > -			if (!folio_test_large(src))
> > > +			is_large = folio_test_large(src);
> > > +			if (!is_large)
> > >   				release_pte_folio(src);
> > Hm, in this case right, release_pte_folio() does a folio_unlock().
> >
> > Where does a large folio get unlocked?
> >
> > I mean this must have been existing code because I don't see where this
> > happens previously either.
> >
> > > +
> > > +			max_nr_ptes = (end - address) >> PAGE_SHIFT;
> > > +			if (is_large && max_nr_ptes != 1)
> > Is it really that harmful if max_nr_ptes == 1? Doesn't folio_pte_batch()
> > figure it out?
>
> Yup it will figure that out, was just following the pattern of zap_present_ptes
> and copy_present_ptes. Will drop this.

Thanks

>
> >
> > > +				nr_ptes = folio_pte_batch(src, address, _pte,
> > > +							  pteval, max_nr_ptes,
> > > +							  flags, NULL, NULL, NULL);
> > > +
> > It'd be nice(r) if this was:
> >
> > if (folio_test_large(src))
> > 	nr_ptes = folio_pte_batch(src, address, _pte,
> > 		pteval, max_nr_ptes,
> > 		flags, NULL, NULL, NULL);
> > else
> > 	release_pte_folio(src);
> >
> > But even that is horrid because of the asymmetry.
> >
> > >   			/*
> > >   			 * ptl mostly unnecessary, but preempt has to
> > >   			 * be disabled to update the per-cpu stats
> > >   			 * inside folio_remove_rmap_pte().
> > >   			 */
> > >   			spin_lock(ptl);
> > > -			ptep_clear(vma->vm_mm, address, _pte);
> > > -			folio_remove_rmap_pte(src, src_page, vma);
> > > +			clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes, false);
> > Be nice to use 'Liam's convention' of sticking `/* full = */ false)` on the
> > end here so we know what the false refers to.
>
> Sounds good, although in the other mail David mentioned a way to elide this
> so I will prefer that.

OK

>
> >
> > > +			folio_remove_rmap_ptes(src, src_page, nr_ptes, vma);
> > Kinda neat that folio_remove_map_pte() is jus ta define onto this with
> > nr_ptes == 1 :)
> >
> > >   			spin_unlock(ptl);
> > > -			free_folio_and_swap_cache(src);
> > > +			free_swap_cache(src);
> > > +			folio_put_refs(src, nr_ptes);
> > >   		}
> > > -	}
> > > +	} while (_pte += nr_ptes, address += nr_ptes * PAGE_SIZE, address != end);
> > >
> > >   	list_for_each_entry_safe(src, tmp, compound_pagelist, lru) {
> > >   		list_del(&src->lru);
> > > --
> > > 2.30.2
> > >
> > I can't see much wrong with this though, just 'yuck' at existing code
> > really :)

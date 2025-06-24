Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CB326CE02
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779442; cv=fail; b=i/XrhvJ2NxRiEpwmXlf8+7rYp4Es98wsTvIUzg7h8dSg5tvk7SjBW8PUIN7/ogDytqrSG19Zryyi/Ovaf+R3tELgHWJG+SxcTjUZ7VleMmDmoTZ/zNGt72VEha+UOavksSdazkortNTQY9R/viOzsr+74WyOIFtdeBXCQ300kPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779442; c=relaxed/simple;
	bh=hd2oSQ5hrmedHo4tEKtnPzutHPKgBypFDUP1drfvMDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ivxHUX0W5LUS4gnceuLn/f6Qqc3e0+Izsy1GhD4EjEw4QgjHgyi4FLBnvdn5kkz/Rsz0lhsZr8dOfLUig+wgRbvQQpwE/FSfep/GNVH0HlXZpJLulVXP2TzMkH7+66qaZqLsmlT1h4avHgQJq2V4ANGhjNco3xbrp6P4Pf3VPIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ff2oBmq0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xiQBiicu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ff2oBmq0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xiQBiicu"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFMovj004175;
	Tue, 24 Jun 2025 15:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Rk++k6vtiJwMCKnf3W
	Vo/K9ii4RQoh5CKfeAT2UV3ws=; b=ff2oBmq0Y0OWqgXHilpKj3YolHIomrM6OH
	/ZvhCaLbKT7+PdjZ98uowfCwPAurIeHEuAVfBuZuF+uvKrWoN81zwcu9ki8DrOhP
	BcAd9gkU1tOzGDXyWqQPPMPsEiM8ZfFogWFpsF2CIRFFuPtdwdlUmKgmUMfK3diB
	spvdgB41E9nlKHEeNaUO+y6PYHhewHek47u5mFwWJqlJo9pV+MPgON83bov4TxRn
	RCnhW4SBZFXisR4MbPnl0GSDdD6UrBjA9uid1YRS5Hd3CXrbdODBR03I1wcqdxVn
	IFWDW5nxztwhrrhEyfsjAfvmniEeiVR6q4DIlDzSdtanuAbSRa2g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7capk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:37:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEdh8v031951;
	Tue, 24 Jun 2025 15:37:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpq9tms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhu6TCNMejoAuKppWlg08qLer6pjcqlJjBXDvOHQ09fVa6eqkM4tVCYV7/hYIwuCL0ouHIq+6Bv5QEVtTtxB5OyC3/c9SlWIZOM0jbFuP2IvLZjTqyxrrGq6H6mZdVWrRvkjTemebUjbrdy/XgnYVHuYZJrdEn4+LUKNg4Ro/aMED/a242Gdc4eLeF0to0ATWgXCjxsUZOOZ45c2aAjwzse83Dh50mkjOre9q4BxS1d6pD2ow2d9FwJq0eZ67tvZNtOrtqFhkaq4drfEbI4VCj+qx5AWBakiK/ACr6mK7ivawwt/7HKHjGVCUHfiwdlpJ5EtlLM0Zia3vtY2W+U/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk++k6vtiJwMCKnf3WVo/K9ii4RQoh5CKfeAT2UV3ws=;
 b=EtdMI3maRyUv+fQ3qi+rZdo8dQSvJ7mq0ruloVk3i+PBS6AMd06aDet6S4u73FQwrLA97iOWma/w7hC7uimu8kq4oVV5iDrUnPx38f5i630Wjvx29zRzIHvnIrPSUOmwF3TrUJYhp1hY7evrNgdW6TT6UyMk8F4mQuDN8NAP73sPPrS3I9krjkO4olhntbVOxjAkF/cPZynhtJZftGT3y1El0/pdUmQzMV2sAqXtkPifhKrZiQ7BmKuB0YBf14h1fqn+g0KmLVZ0pmWi4vWj5QMWFdAKBJxZ0vVUEZnBmelz+DveeMnT+R2ibUmGNTaXFl1rmLM6jK4/Ha2pnQmbuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rk++k6vtiJwMCKnf3WVo/K9ii4RQoh5CKfeAT2UV3ws=;
 b=xiQBiicuhiTC/MS6ZCf2Fam+xwUU5k8jvrGYuqujpry7IVU1yJB1VUeOB6M2gLuFSKL76LQZbC/cqiZ84NfYlOONBDTnmB+/6S2uO2Z8z10VelXrco/ot4vy4ItYy1Wv+nciDZjWTJemAvAfPHt+JF+w/MIp3rF3TpeCNKbhFIQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW4PR10MB6323.namprd10.prod.outlook.com (2603:10b6:303:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 15:37:03 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 15:37:03 +0000
Date: Tue, 24 Jun 2025 11:36:47 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, richard.weiyang@gmail.com,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] maple tree: Use goto label to simplify code
Message-ID: <qzqzj2qhiavjaklwscit3vjmxozbigq7bpgglwejfjpx6vlwjl@y44d47g37x4b>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, richard.weiyang@gmail.com, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250624080748.4855-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624080748.4855-1-dev.jain@arm.com>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YQBPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::18) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW4PR10MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c4c120-1edc-48d9-6b43-08ddb334f78f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FSTy0JctSnYKwwk2kPg1mR3IUmV9eXCtqipkEjfiV3nu786BlJkPH0AbEgYh?=
 =?us-ascii?Q?kwUQw+CZ7E8eRUWvz6sqYe9MLIWlowPB4rc8x6ch49w5q/pFnnbEA3CsV3mv?=
 =?us-ascii?Q?Z5Ips3NL6dJpDMaGkx9ebJxCfJrPmK1HnvC/JOZrlf98Eg+ueTjYr3d62gGu?=
 =?us-ascii?Q?Y/mdIJWnB05AykACo9cVNnuUy45NmI66JMupEeNR1K40FjFcKr3hSUPmSqq4?=
 =?us-ascii?Q?T44ybaxf8hGWH6zlPJ+v+fv4xdLMppLmh/Y3BaRnRGbN4hvUJCsojfIS2aY3?=
 =?us-ascii?Q?l5YlO/55XOfS8d3xFAXfESs5iBqq6lb8LBaAbaUKmMt7u3/hNkcO7XCmr7V6?=
 =?us-ascii?Q?V2+OOg086eMr5DHGjzl0dPwlTO9fCm43MbdrHU4hxIKa7EJ97wT4NHzHJ8yL?=
 =?us-ascii?Q?eFiqF35D2hyGlR+/EqgyzoZjYZXQNpZ/8fn7pCHBt+7kQ1nEp2zLS8kvehnq?=
 =?us-ascii?Q?KEDYnrHeY/PHXL9aZnsfkgnOl4hpwR6ECipgVUsk4BtqFrWEbQwNIQn3/EY9?=
 =?us-ascii?Q?HviiN7FsVfjI8gd6PKecd/uj0JMMHyegV2DfIoThFz/IZzqzPcbB692J0ul5?=
 =?us-ascii?Q?ZRSQy+/duEGAjEukiYjzScln5nlTXKisJiCcWEttKFWlUsuzvMU/5vgxUA6f?=
 =?us-ascii?Q?tLR16mqfTMjqXvyO5JEM68HGz2+JAu+tUq3GJCMlQQq5RrSbT/23NLuUHplZ?=
 =?us-ascii?Q?i7qWCKPTFe2l+MWdQUoN9ykKv2hWrpd/NpHG4b6ZsiCVS8nihdtwLf58+Ywm?=
 =?us-ascii?Q?O3yAQMrXIiXIXU4Hb9p7U9LaqXQO4MVtTEk/fu4muotM949P7n5eL62PeLNh?=
 =?us-ascii?Q?vv/oktE+5gWtX9W/PfmZDwLPXtQYpP3eZhYMDLPi07e31vctEKFsvYkNS26E?=
 =?us-ascii?Q?nqc2vGT81JxGaASPyALPdcPU/EbRpHOMOUf/V0L1lGlMFpxz3zub0b37qerK?=
 =?us-ascii?Q?AtXVIWZhErIzwaAzT7aBXizJUn4oQXWEnH3XZLOHZhbXV5K4kE0Es6payoJz?=
 =?us-ascii?Q?DbExuRwODG6RKukWf73ez94rs7AdKvNyGramuQRbSlwkRMs9R9V5AedKK27n?=
 =?us-ascii?Q?vIQbcO+3JkDZdVbE0OFP5vrMG+2mA6MJ33nXCJesk4vghpxsD2eLTOo+O+zg?=
 =?us-ascii?Q?68MVdjf0eIXfQKdC2eOzIbUOxxWe1Kt9SWss3wSb4UaBNkB3HnWTL9z3+YKZ?=
 =?us-ascii?Q?toPs8F1vqOD4BFVVFFNs9bTUfnhme4s1+7D4cUIROOYoz+znMNqNixvHVKe0?=
 =?us-ascii?Q?eYH2A8GXsP3bQhFJbbzrykQJTVmtO1vl0UC9YU185oYOAWkxSm542djuSYF5?=
 =?us-ascii?Q?kxYu/WN2kWK7dokVNWK2X0n1uIv+wuFAj7Cv7Rn1fzyY3dHCxCpOxLv8aQGw?=
 =?us-ascii?Q?9kN07t2BXheBvxQnuFF/gYltpqMdIWRbnWadurQ8joQEdPQa1ceD2RCM2o5P?=
 =?us-ascii?Q?qeqbLVVu3cI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UTZVXocC+wv8CNsbGZV7nuKvVCgfamS0Xb6CiqLFqM2dNKsxrVgiheAXBjqG?=
 =?us-ascii?Q?JT+bnZoWQD+FUSRriiPKJWdhj0gRACLExEF3p8DuJy2FahYGRZP0dbRzq2Sq?=
 =?us-ascii?Q?a1rPCp1DOX/YmAMbQ8djVl9L4hsxQAeMM1t9mTrZE8aDU+unM3R4Sv41iOut?=
 =?us-ascii?Q?uNlH+YnfJ7PYMk5Pf9V7DEGrjiOIuyjOQYrgDr1aeXNNcY/niBM0TJi/JeDW?=
 =?us-ascii?Q?WubtvULtEs44gFKf3czQzlGRkBmJKI3PrJpMHU5byGVDkDL7RQLFSE+EFS1e?=
 =?us-ascii?Q?OCvLrEhlVWTV4wsBfwFuA2355Z9KZmF1jZA9VhIb3v+EVG/ieaWWThvUF7Kr?=
 =?us-ascii?Q?kjFV4F3PVHUCdr9weapdxKw1t1toAoKfdW5lYHmTsBhrC+FFPLjOaYrgTy2A?=
 =?us-ascii?Q?mFa/dKU6edqOd6jw4gzWbaV9xUVn3q4ISqfMuv5Owx1s5wjxfsxzSGkwK2ox?=
 =?us-ascii?Q?u7kk6TfKkP9UViv7cYzXHjQztP3IOc4WLIsnvJTGmICsTkJVM3wt0YAqfCPH?=
 =?us-ascii?Q?zWsfhni+6IWBeNMZDjSYEkNc8sNjjzI+0SUh5cBSCaK4/M6a8k2Jl7or/HLD?=
 =?us-ascii?Q?Qtu/Y1dijH12TyzymgE4F6bqvVu+np/MDb1cmaleKQGNYB0EeE5QXho84NLd?=
 =?us-ascii?Q?fn/6lsxR8l/TELjbE3VQPXNyAZLCz7tYx5UzR+EHxFiihJ3Y824kjL/oM0P6?=
 =?us-ascii?Q?HklBFaUwrQs8TxLkk071JMHSBKBj/97U2TzUfB0eLdEErPC5VE/Yd8+gBHjm?=
 =?us-ascii?Q?REbU1AdC0DWq83qzy9GQYoChVOPSDwlvtRDaoncbS59u/tnF3MAsajv43CmG?=
 =?us-ascii?Q?eQbc4jf6+4OJWKmaMrOfAl+9MDQCvK7eS7ySBk6ObvGZYx0cxeZXlTSeG6eq?=
 =?us-ascii?Q?n/HvsoY3VJHDrUA21aBqAGqTP4sjiI36bOWffDCTyQ8dSh1LwfPRTkzjWM0L?=
 =?us-ascii?Q?ggdpwDSz/NFrKozr1K8ibXOG+5KK+sFG+Wii5DPFEkDcKEWpCb0nHJfDySqM?=
 =?us-ascii?Q?+RAM5Zwh0f8t5G/o9N0qhxSpQA4cKtZgwCRDNFJ2fwmlW8U7sQ16T/go62GP?=
 =?us-ascii?Q?IZGk7hPziDvTN1/3yXd+Tqw9EaXuqytYUNitEoDtKC9c/DZVnesnC04b2FX2?=
 =?us-ascii?Q?sXo4lJ4OKuuDUdBzrsekdGxlEr0KWZRF9sagexnGobItQjcnN95rxnkMBCgC?=
 =?us-ascii?Q?lCIiKpK3Mva8sdIN7nBnqPfmpB/JaXlLFgz4XuFwug0bsRqkG8ms1QqZ3Zo6?=
 =?us-ascii?Q?2PlqvS7r684UC3/PwbGfRXfZICCJfW7bFo9M4eRlOsEKKZ1QnetM3MwSispB?=
 =?us-ascii?Q?oTZHsr4EUgFxjjuY/bnsO6YnVrKh6mJyZ5GyqX0JlxaXpWkAprjfMgN20WdF?=
 =?us-ascii?Q?A95p5L8mctTodHhG8kABQVwoH+bTiCcD8/GjaQSlLoiJJK249TnJtrCuN/8Q?=
 =?us-ascii?Q?kTkPADhavAy8dAaOORPjcLU/A2Bic80KgIgOIAZsgoeLp0wk+RC8gI88nLH5?=
 =?us-ascii?Q?4w/7Y779clJ7ka6iHbkMip36NxnktroNivXjsT/CseC51vTPLwOFcrAVF9sc?=
 =?us-ascii?Q?5Vvh1U7Shet4tzZpRhK+7lNA+daSvWZ9PjXmhtss?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RTg3hO1w2EYXRxuuE8TfSUnIcrX3uHMXdRIS8ut3j6JiuxHIpiAjGllEHZivwRjeNrbDLXujmGUCWGlzfOH6lD8/eTNrVooZBGL0Ss7xqRlxVVKVztTBfE2qU/XSiiT5GpHfE350tUHXS/8zjLWvYl1k1n/3ke3rTl65W4PqHHWaI4bhkHAliNsiLXDt3L5bJKq1y/Thj+XG2OD5rcXelgWYclFUFF9iti+P2mlIxWpFwwu56P3L3V69GLvPpDdjMSOF5IwwTYsp4huyXCeL+f+UaZeWW7CqLRGzxtwVP6g2Hvc6vRxsTqs1XmKeX5BwDsyV4JkBVqa756WgsqFyDJjJMHKcNtg5/Unmoz1vV4hVMftR3XXtkwY1qPir/QWz1cdI7k8N/QcMh/DAd4WytlM7tzf4HvWWZXb7cVvmzlsvWsszRXCa36BlI8AgiLb5SXlet6rk3Mcjbtq9UsrxiSLY09XR/UEq4DcURmcn3NlsGg0W0ifyVdbij7LfXgoIq4OwFd1/ZTg4AQb6rL3VmC48UVBIzfI4By+IaqZE3MCVdFRgbyuzugsr+PwmlTY2NH4BYY5axi59qJrbKNpZJRNiBNf8eB//Eq30IwiHuns=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c4c120-1edc-48d9-6b43-08ddb334f78f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:37:03.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAs83+2UZ4a/0DQ3+BUNqiYFYLbrR3BbiocsNcljxhFpV8iDQ4OoZyIJgTBlxsIrHspoqIWeFsn/0VmqkW+z0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6323
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzMSBTYWx0ZWRfX0m1Sczb9sI4s ocnsMIeBFqvgDp445IquknDSQLe0f0X5B/ka5iTKgkJgJ7a21fVhnhjd6l9IA4LC1FfCyuG3EOi U3Dw3p0dNHWJqOpDyMU5O0c8qj4YVodZDoJXR43A2Vve2U/KaoS4Lgcl7laXICa4WJOcvfSyRLC
 +qaU4L//UefVNccUB+/hKcWx6USwrASy08ClHgr/HEhCEEPot7RUQCxp5CcU0668xI58WaCtdcn KcH1UlzKJg3hhgBFjBzxgcaHGCa7822cNV+LEeAAMuy+NWHwDa9OS0NOctm9XUAYD5FAwBlnHR/ PBtBmT0jrqc6ZW/4MVUSktS/0zWyzJYs7GCjE/meN+7lw0uQV7+hfqNcM23ON2Reswj9wCxRypz
 F8BU2/8CmUlpcyDK0J52HLSsfgLGfMsY8vtmBapvr6UuoLLOk+l1ZcHoXHoQm8b0IBluGBnU
X-Proofpoint-GUID: ATQPIgr5X19SocKqDaPm38o_LrbTgqy1
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685ac623 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=2sb9HQT7X1iFTJ8VSQYA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: ATQPIgr5X19SocKqDaPm38o_LrbTgqy1

* Dev Jain <dev.jain@arm.com> [250624 04:08]:
> Use the underflow goto label to set the status to ma_underflow and return
> NULL, as is being done elsewhere.

Thanks for this, but the stacking of labels is unpleasant to read.

A new line like I've added makes it a bit better.  It's more my fault
having the existing code as it is.

> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  lib/maple_tree.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 00524e55a21e..25cf2bc607ca 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -4565,11 +4565,8 @@ static void *mas_prev_slot(struct ma_state *mas, unsigned long min, bool empty)
>  		return entry;
>  
>  	if (!empty) {
> -		if (mas->index <= min) {
> -			mas->status = ma_underflow;
> -			return NULL;
> -		}
> -
> +		if (mas->index <= min)
> +			goto underflow;

>  		goto again;
>  	}

Andrew, can you just add a new line like I have above?

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Thanks,
Liam

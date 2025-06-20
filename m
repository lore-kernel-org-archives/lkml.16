Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF0A2DFF29
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433632; cv=fail; b=IAm2ldEFwvK4ch3u1qmLd+Gp0yeUOfceOlJ10ph1K4TeBqaOS4bOtsTPHEhUXVsY0G4I4itBWZiM4KGdAOvaVPbKm2HVX1yWaBTuD5knJOVXRXLY2H1ML2d+HOzSeMDRe9eagCrNQVx+YwPslr1weCpiUGyHJd6IEbaJr+M63TM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433632; c=relaxed/simple;
	bh=2eB+9AolxkOF/HVVx6dlWlb4qkLuoW+DHW/0FFnQY6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ayn7qF+2sCMOlfDrPI/JVLogbCcEom8jxWoxz5FFHfv86P95UcsJaVDqw/SHxVszdKxxhXMUuTixXI1UBOrNIFfeGURt5we7ZCX2D0V9wYvNHibwkU/ic6Qbe6PSWuta6s/LV8lr1KRwn2WDhB7KJ2BTHxFu00xvla+qU8m+eQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qqw+JIik; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KfBvagMA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qqw+JIik";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KfBvagMA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEC0gY022223;
	Fri, 20 Jun 2025 15:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=RFttMlVu9SKt6S4o4IxvRt3E6iqNgDP4SXcFt4ZGMfs=; b=
	qqw+JIiko3Sqe0AzA4UYzLscyh9xNKddj1XLJxHVbgkaJ2pk5IKwcwq473SFmdcz
	WikhnkEla1lVMOpL0xJb9eXHDH53PywJbSTvgYy6U/yt5Je4rSc40qxUej8e88C9
	eAeE+9dEr/TJH32cgqV7dT4mFLYk6FsCrSSTYQbAAQCWMvUX5o982Vl1i0bipDtn
	TRCCvZRmuAuuV8kVPhOENVjIlYxh456NDDdQxLeafYtsqpVEAEDnZ5NCnajYL7He
	HnoEq3DnL8jUnSvTJSvhJs+olmAdclvHPOlxK5JU/KjtJpRQtYqsFCL4fs/KWKLU
	G8WJveVbchDgnaunqEtTOw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914euwt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEJLDc038326;
	Fri, 20 Jun 2025 15:33:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhd230v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/YXXxqmfrd6ju0c9FEjB8Hew0Lwgentgip8q9Vw9y4gAw1DBoK9h0JDvinA2R4n1YHJSD1xlpk8oVUuiKm1WXSywQ7++Jk6O3nIt4re7pdsqj7eVulEPAoeVtUZHWm3JeJzbTnv6wZQuDdvtuq+iLVyBJc+nvip8OFUFM4ovX/2Vx3IQ+ZOgMwIcr4c+ZmNYCVw75kKkVC1CUOz+XNSV6wUwVZy0cmzAUeDaGrnbDELyz+wE1IsywMUpl2OS7MQNCO6vmeTGxJiXWbFzVWvlj+7AtSrNrO4xZcfmKts6ABvB1/P7nm+SRcWKPAwrmF72r2ZA22T6ybvM7Jfv+DJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFttMlVu9SKt6S4o4IxvRt3E6iqNgDP4SXcFt4ZGMfs=;
 b=ZvdExSg8ZTTgpg5CR1egmMIwzKe8HsjyRvPmTkNj2F/W6uVtH1Hc9+DJYFMaAyuG7StCFckevw9wJaGjFRHvsja8MQGDJb2dWohKBFRAwtkTbN94RYRRlPUexYxEVjwmk4Q9cZeBus7w9iFU7xWaEUeTDxtAc2Rgo2qGBIHmtkqOtuHGjBhrfb79u+KBvP1xpxx4FXbgLKBp1P6haTcSuOpdYnfHC5OOUFEwi/1rwU78f2DEfYB3nsy3SBdkTsqcdo62OfR3YI7tX6pmzAcgMVemuCamjVWe3mwnaO6rB76O6XhxbgQ12miFZPyKMslSvUXapgr0DpJaMTIjt+2JZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFttMlVu9SKt6S4o4IxvRt3E6iqNgDP4SXcFt4ZGMfs=;
 b=KfBvagMArsxpVbZrOE4P5D7VeDfdern31w2qQBVkKBawfCr+CaW5G5iX55hRcjfDp2Bfpk+vgCMQV89n1UE4DHw5p0QB9LRluVR2uf6k9U2ClIOopmB68iTKZg1UAmHSp9zxRKt/AR31sKHjBoG9lrXMHPkDXJuToFrzShd7H6A=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN4PR10MB5591.namprd10.prod.outlook.com (2603:10b6:806:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 15:33:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 15:33:22 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH v2 5/5] mm/madvise: eliminate very confusing manipulation of prev VMA
Date: Fri, 20 Jun 2025 16:33:05 +0100
Message-ID: <63d281c5df2e64225ab5b4bda398b45e22818701.1750433500.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0417.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN4PR10MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 98bb22e5-8b83-4630-1ea9-08ddb00fca20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R8hLWAbve/4Bd6J0vckmb8X24cV1kflxZbcn5uWk6H2OnonatzzQY6u64TlR?=
 =?us-ascii?Q?vtcthmU02/Pc+6LjdxZR67jm2TlBNTmqDbbtGX/Z+wcRm6BQZXkBHmBg7fFR?=
 =?us-ascii?Q?XmcVVhue0UK9cYXJ/mmemBwF3qwCiUFmiDgL619dOvtkQb7cv9VodaKy2i//?=
 =?us-ascii?Q?KsrWcJhnpK1TQsRZ8WmCxTKfrGLF2TyLMpFEJGXPfqvmg6RSJJA/2A9g7hSD?=
 =?us-ascii?Q?+lAvPtBrJjqBdGM2xisjOQVAkNkWqi6w+h5HiLqV/2IPV5NwqH62C049UoB/?=
 =?us-ascii?Q?qsBAdt/xz7AQn4JM+135LE1qBljpgRqWcIDBqPQIcXFyCpqNGBGEa4rFdji7?=
 =?us-ascii?Q?QSD/5ByP9XAXHrPUAt/wxLajwOQGFkSNO9VbtAmOWuLsd0nhyXE4vx2UApX8?=
 =?us-ascii?Q?1NJN0yQSuaMF4vDn5ddqbOoXUeRfAc7IEM/UOFzxbNuM5cWQjT+f96Qm2mZg?=
 =?us-ascii?Q?Kf0e8apAuzfWKfGvRYL1IpBFl6mhRXjEo7+byu7Jx4ZjnNduzoYICNON7o3D?=
 =?us-ascii?Q?7J4SeE+mighnqXrVPl/b7WX7RnoVmA62lSxJ15URBn3pBSUBGD0xYBo04GM0?=
 =?us-ascii?Q?pvLORNokqVdM8cc+fgUpM1b0nOxenaeLQD1m6+DLPGORXPucFZt+sKO9HBYt?=
 =?us-ascii?Q?mFRL501PhzcTAt8Xwab87eZ+Lv3LdqaDh9g7omuyTJbnxa1X9JOm332QxFZr?=
 =?us-ascii?Q?72Tlx5hp78iuuv8BYKDOOcfGa1/UKvVIRHrVucw5l/pURCfza44ShSBghX5m?=
 =?us-ascii?Q?FyF/G4wJKYMdMD8UsrTe8wTTmS+80he4GBekEBoBlzJruUrRZc2bbWXN6Ldi?=
 =?us-ascii?Q?D/rlIrsula3DoIcJdwnD2h+k0WNkU7yM0cro5BMv85fBMn+wNs5ATS/Etd3C?=
 =?us-ascii?Q?LfyESN+JuoI5W2DnGTjmwMDXXh2QMvSnxd0jjTGYrdEU2v6+uO+M0qhQUVFf?=
 =?us-ascii?Q?wOCcqXcMxFmJue88D0y7uNWjGZXMyOCw/RA3S1g2Qsze2rveHnVT+1SVN0bY?=
 =?us-ascii?Q?AquNfMOemFHjfNjlbulROGI2K5FCmuPBUFTDRHjrkRuJEfPBfesUFP7NKLrx?=
 =?us-ascii?Q?yikZ3FgpsvjIcOqooJDoTnugxdQIfiXeWO73rPiSGjMJa/wwxlYJJw/S+RmH?=
 =?us-ascii?Q?F5GIxYzv8aXvc9vlncyxqzfGdbMbOZsKWbXV+kE3sidRgySUhOArow0m0Qgd?=
 =?us-ascii?Q?9uA7ejCKjk2YZ9VO1S6WZp7JJMVAGVIBF7RYCdZzYp5q69DCJEJyPAa1ZXkN?=
 =?us-ascii?Q?4WUVPGNVkwMrw47W6KAe+ZQKITSAMrI09t69RiF+V8qSlFUK2KMmh8AMuueu?=
 =?us-ascii?Q?1RKGV+g4Wm4Mxm9Mr2ADnm5n8g5/mo1YQDjORnuSsVqPFxGh8Ewsp4f/+aZ+?=
 =?us-ascii?Q?5TjUIC2jMfUkFNv6vu1h1Al9X83tBAEGaWC25Z1NYMfFurNnFEaq75RneDR1?=
 =?us-ascii?Q?jOJDDwmKciI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m5nyCMZdpCu2EyO9GAhm6u3J6mpfZqVOy9cIhPRpi3wgC3/gCCqtzI4u8O/u?=
 =?us-ascii?Q?eB7VhE6Gf1g6+V+Z7+fpRcnBMAGCh6BiGQJgSK0gIisOzPkDzo7fXqkfMQSR?=
 =?us-ascii?Q?Tk4KFy4zSVMfdHgtD/w82QDXiWjHb4dX2V2s1Hi4ur0pWTogYYN7Imon2Nke?=
 =?us-ascii?Q?slZj53Hm8+9JKDkj1EUGyUjCyDzXMKctYqD04GWSatEIAa8YTn7ZjPRZ9V7N?=
 =?us-ascii?Q?3pXUhhjSo7xeZf3xBR87ExNYXRRA20TaEmUEISubVkWZhROujTpuUXvTIABk?=
 =?us-ascii?Q?KMCHnQGsBdY/iStPNrsVPsu+vCJIoZJRtlAjNPOGgLGjuZXpiUbwmw+CJAdV?=
 =?us-ascii?Q?TYNiMdiIqA5vtgnATWzSIW83oRhKWCHICIBHMuEJUfA2zLvoESrN29B+Ru+J?=
 =?us-ascii?Q?EP42OusM1nZLaSRvgLouqx1Ha4r0G/9I5WJPaSDVHjQcBqz0yQJ4k8Dr0cPw?=
 =?us-ascii?Q?ROGD6BhLomFZX4z/UlEMuf4JsjGxG7/AEfYhlPuy2WgRYZlTG5Vo2WEHCCtO?=
 =?us-ascii?Q?2BZCMwHZGvu/eaG6cjpSWxIGk7iSJ+1XB7NR45dIw2L2Asm1dH5keF6FBSfy?=
 =?us-ascii?Q?p2qTPCegDtjUDoNbZvGe525QkvMBODEUYd1Ig9Tn7Vx+k675XVfiSrkx+z02?=
 =?us-ascii?Q?7qXLkFbniLZ0QlGj/jNUPepIaK+SbKnfEXzrui0O9mPPWwZeqxbKvJHA3tEf?=
 =?us-ascii?Q?r9R988xZW+n2RZxbdUP6diHROR9IhnmOnt7ebNke5CSCF7BNxg1ByPPoMnZ4?=
 =?us-ascii?Q?XRo9cfK++p/wx8dC50JFHI2VGIpSp1MekOU5Tw67l37vovC6tTTTZBmf+oXR?=
 =?us-ascii?Q?pCPMybUHGqYik1+2LAOtT0CmpNeMT4dMXH4JcxObQ6MaOP3P8jaFAk2AKjki?=
 =?us-ascii?Q?fsmxAvLGmtMc0d2uWoGozHUmYyEh8GofCs28gy4TeH76zC0RpQxamvkWEAlm?=
 =?us-ascii?Q?WkU9k7dIrpSBuFGzZWblHYaGzX41PGsrSOGU0OswCULtf/tyk1L8OKig1hy5?=
 =?us-ascii?Q?djLrg+ZMwOSR+vuNWSO63FVcJQrFEM1BmjMTreEhv37kkDKTjbkFrOImglD4?=
 =?us-ascii?Q?BV37gzkgbWxlqGdDE5t/SFNSziFBabhfp7W50xQg0ggH+gj3rn4VZhvWvlDI?=
 =?us-ascii?Q?u+EF2RbMTwgdS8bDIrXFV6EkTcFiOC5fC0gTYNeAmgZMqMHf058K+68xAHx7?=
 =?us-ascii?Q?AIR7driHc8y4UFCMYuAMCx5XwQzAsUlwKSFnRrNgdVGDDc5KVIjd2UrPNR1l?=
 =?us-ascii?Q?lZdmdSvANuhII0QkQYVwU1QsaYrqSbIz+4dgKYHcg3fRZVn6+F7GJInEc6zW?=
 =?us-ascii?Q?g1MlbxNvhoNEsAgyd6iqe2o//6QQiDXPP6DcvQokciq1WY84XUO1hP5bMEXf?=
 =?us-ascii?Q?AIUiS6FiiPNJVvDi4DT1dbWKvmyGCIGEaQy3u9LYIJ/J1aKh8Q09R1ocMnuM?=
 =?us-ascii?Q?fhslHXTuP0aoOGUs9solUeSdSjjMP/BIFQSoTpEifita5j+EWanDSBvCFloo?=
 =?us-ascii?Q?qZWFIRYWONwi9Aa50qBcx4YnIPU7fuCF38Vd+BA7ZpC8rcuBLnhp0sJgzqn8?=
 =?us-ascii?Q?8Boab4cOrYvb15zF+/KpUMiLqE76ltJi09E2zSCjHkXZlh0Y9fq5+nm8n+uM?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3lCe0vvfsjaJ0rTst5HM/wcIW+8oXyso6UYQolFsOb6gHp+H3/TFO8VMRqJIPbs0hgsY6derhbofzxCF46bSh+vgg/cvMEodzzk/286h/JA/a2ZRC9ABX0OUfJiZc7f6CD6m98c65yIDU6qcI9GQiqXLiXcRrEDojkD8gxGX/mrN0zvzB3epHT0l10l+/4DzEkOnF6LOaIwHtXPlW6QxOuxxkL5YziJ0UqRco/Nzoz40BNlu72j4fLWaCNVjouC/BJ3nH0Bu5BuUHm2644KgBqSWgiGLJYXBVUc29OuUvRFOc5L0oLMthyBTjk4H9i4EzGgjIDZu1ZptV90wvUSMEPfGLgHlN18pcFsynoS/Xwmq6erpqe64zkJ6hqlkSh1fc9GXgeWhe4EHSpdf28TLlXwbsWjCStOOyjQ0tJG6HryBaip3sZ4MWhtpDS3wgroFkMZoTq3aIlKua9lvDaHJGmRzZasojWM6Qu4nw5MvomNZczTHKTFVk8xKfV5WXZa9Gjv3HuqFoafWEtvUCqEOjVn1q5yY4+FvogoIBBS9KRKGPZnMKewRvgMHU+Eu0Dcw//ENYuq3Tu/YiAwIwt1YG7sVqPQQ0baPMPRZhWzdec0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bb22e5-8b83-4630-1ea9-08ddb00fca20
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:33:22.0275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ag52ZgPn40LPX+FFB+bA2PDKaHmEiI51H2GHMIDICs4SNOlcE0K6VaZPY/Ul9QhMsd77SGWlYpZnCisXRuINEMQa+ptXDr7LEAuyzo2f0xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5591
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=912 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMCBTYWx0ZWRfXyJAI6h6yPqNU vFD3jS8KGurqh4OYU2oVFNDUei2VOZ5uLZ9H0/CmVzLZ3fVrpZFdu5sWhDE65rOfcNXuE9g5cvM 4HOX/KpljvWnUieKk6UYhv+aFKhepUY4WKzy+aypFxXX9A1W0fPH5lhel9EW7YkIqSD05vOB5US
 arA7l7Z7h6bn6pD9Bin41khipddwl58+vNo3sIRuB75JuUR7ZFsopuP5tzlTuQUn1sNc5qtr6pc fuP4JNwOebny9B6dQP+XPpaJ4gI88zgdHEGlKLrO8K2Tn5TBc6QcVOwCsjrFeDpQDn0GSqPGpAR uj1Cmtu+BxYURKCRyhC3IejWLF43bxeVVe3flMRT5TJ/Mzk/SsoRt5sTLfIQNE252DjUJBZ0U9n
 3UDn7EsITMXM1mGJB+GTHgL47I1CWjAzPDmzoTclrg0viAtxOZ9c27s3QEU+6V7rWDPtCDpJ
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=68557f46 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3PYvvxC6y3Yc54peycEA:9 cc=ntf awl=host:13206
X-Proofpoint-GUID: 4RlWqBaVGf7GLTye5qiYKZJL5UtOhtuZ
X-Proofpoint-ORIG-GUID: 4RlWqBaVGf7GLTye5qiYKZJL5UtOhtuZ

The madvise code has for the longest time had very confusing code around
the 'prev' VMA pointer passed around various functions which, in all cases
except madvise_update_vma(), is unused and instead simply updated as soon
as the function is invoked.

To compound the confusion, the prev pointer is also used to indicate to the
caller that the mmap lock has been dropped and that we can therefore not
safely access the end of the current VMA (which might have been updated by
madvise_update_vma()).

Clear up this confusion by not setting prev = vma anywhere except in
madvise_walk_vmas(), update all references to prev which will always be
equal to vma after madvise_vma_behavior() is invoked, and adding a flag to
indicate that the lock has been dropped to make this explicit.

Additionally, drop a redundant BUG_ON() from madvise_collapse(), which is
simply reiterating the BUG_ON(mmap_locked) above it (note that BUG_ON() is
not appropriate here, but we leave existing code as-is).

We finally adjust the madvise_walk_vmas() logic to be a little clearer -
delaying the assignment of the end of the range to the start of the new
range until the last moment and handling the lock being dropped scenario
immediately.

Additionally add some explanatory comments.

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/huge_mm.h |  9 +++--
 mm/khugepaged.c         |  9 ++---
 mm/madvise.c            | 77 +++++++++++++++++++++--------------------
 3 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 8f1b15213f61..4d5bb67dc4ec 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -433,9 +433,8 @@ change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 int hugepage_madvise(struct vm_area_struct *vma, vm_flags_t *vm_flags,
 		     int advice);
-int madvise_collapse(struct vm_area_struct *vma,
-		     struct vm_area_struct **prev,
-		     unsigned long start, unsigned long end);
+int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
+		     unsigned long end, bool *lock_dropped);
 void vma_adjust_trans_huge(struct vm_area_struct *vma, unsigned long start,
 			   unsigned long end, struct vm_area_struct *next);
 spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma);
@@ -596,8 +595,8 @@ static inline int hugepage_madvise(struct vm_area_struct *vma,
 }
 
 static inline int madvise_collapse(struct vm_area_struct *vma,
-				   struct vm_area_struct **prev,
-				   unsigned long start, unsigned long end)
+				   unsigned long start,
+				   unsigned long end, bool *lock_dropped)
 {
 	return -EINVAL;
 }
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 3495a20cef5e..1aa7ca67c756 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2727,8 +2727,8 @@ static int madvise_collapse_errno(enum scan_result r)
 	}
 }
 
-int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
-		     unsigned long start, unsigned long end)
+int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
+		     unsigned long end, bool *lock_dropped)
 {
 	struct collapse_control *cc;
 	struct mm_struct *mm = vma->vm_mm;
@@ -2739,8 +2739,6 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	*prev = vma;
-
 	if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
 		return -EINVAL;
 
@@ -2788,7 +2786,7 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
 							 &mmap_locked, cc);
 		}
 		if (!mmap_locked)
-			*prev = NULL;  /* Tell caller we dropped mmap_lock */
+			*lock_dropped = true;
 
 handle_result:
 		switch (result) {
@@ -2798,7 +2796,6 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
 			break;
 		case SCAN_PTE_MAPPED_HUGEPAGE:
 			BUG_ON(mmap_locked);
-			BUG_ON(*prev);
 			mmap_read_lock(mm);
 			result = collapse_pte_mapped_thp(mm, addr, true);
 			mmap_read_unlock(mm);
diff --git a/mm/madvise.c b/mm/madvise.c
index f04b8165e2ab..4491bf080f55 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -75,7 +75,9 @@ struct madvise_behavior {
 	 */
 	struct madvise_behavior_range range;
 	/* The VMA and VMA preceding it (if applicable) currently targeted. */
-	struct vm_area_struct *prev, *vma;
+	struct vm_area_struct *prev;
+	struct vm_area_struct *vma;
+	bool lock_dropped;
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -188,10 +190,8 @@ static int madvise_update_vma(vm_flags_t new_flags,
 	struct anon_vma_name *anon_name = madv_behavior->anon_name;
 	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
 
-	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name)) {
-		madv_behavior->prev = vma;
+	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name))
 		return 0;
-	}
 
 	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
 			range->start, range->end, new_flags, anon_name);
@@ -199,7 +199,6 @@ static int madvise_update_vma(vm_flags_t new_flags,
 		return PTR_ERR(vma);
 
 	madv_behavior->vma = vma;
-	madv_behavior->prev = vma;
 
 	/* vm_flags is protected by the mmap_lock held in write mode. */
 	vma_start_write(vma);
@@ -301,6 +300,12 @@ static void shmem_swapin_range(struct vm_area_struct *vma,
 }
 #endif		/* CONFIG_SWAP */
 
+static void mark_mmap_lock_dropped(struct madvise_behavior *madv_behavior)
+{
+	VM_WARN_ON_ONCE(madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK);
+	madv_behavior->lock_dropped = true;
+}
+
 /*
  * Schedule all required I/O operations.  Do not wait for completion.
  */
@@ -313,7 +318,6 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
 	unsigned long end = madv_behavior->range.end;
 	loff_t offset;
 
-	madv_behavior->prev = vma;
 #ifdef CONFIG_SWAP
 	if (!file) {
 		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
@@ -342,7 +346,7 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
 	 * vma's reference to the file) can go away as soon as we drop
 	 * mmap_lock.
 	 */
-	madv_behavior->prev = NULL;	/* tell sys_madvise we drop mmap_lock */
+	mark_mmap_lock_dropped(madv_behavior);
 	get_file(file);
 	offset = (loff_t)(start - vma->vm_start)
 			+ ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
@@ -633,7 +637,6 @@ static long madvise_cold(struct madvise_behavior *madv_behavior)
 	struct vm_area_struct *vma = madv_behavior->vma;
 	struct mmu_gather tlb;
 
-	madv_behavior->prev = vma;
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
@@ -665,7 +668,6 @@ static long madvise_pageout(struct madvise_behavior *madv_behavior)
 	struct mmu_gather tlb;
 	struct vm_area_struct *vma = madv_behavior->vma;
 
-	madv_behavior->prev = vma;
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
@@ -954,7 +956,6 @@ static long madvise_dontneed_free(struct madvise_behavior *madv_behavior)
 	struct madvise_behavior_range *range = &madv_behavior->range;
 	int behavior = madv_behavior->behavior;
 
-	madv_behavior->prev = madv_behavior->vma;
 	if (!madvise_dontneed_free_valid_vma(madv_behavior))
 		return -EINVAL;
 
@@ -964,8 +965,7 @@ static long madvise_dontneed_free(struct madvise_behavior *madv_behavior)
 	if (!userfaultfd_remove(madv_behavior->vma, range->start, range->end)) {
 		struct vm_area_struct *vma;
 
-		madv_behavior->prev = NULL; /* mmap_lock has been dropped, prev is stale */
-
+		mark_mmap_lock_dropped(madv_behavior);
 		mmap_read_lock(mm);
 		madv_behavior->vma = vma = vma_lookup(mm, range->start);
 		if (!vma)
@@ -1064,7 +1064,7 @@ static long madvise_remove(struct madvise_behavior *madv_behavior)
 	unsigned long start = madv_behavior->range.start;
 	unsigned long end = madv_behavior->range.end;
 
-	madv_behavior->prev = NULL; /* tell sys_madvise we drop mmap_lock */
+	mark_mmap_lock_dropped(madv_behavior);
 
 	if (vma->vm_flags & VM_LOCKED)
 		return -EINVAL;
@@ -1183,7 +1183,6 @@ static long madvise_guard_install(struct madvise_behavior *madv_behavior)
 	long err;
 	int i;
 
-	madv_behavior->prev = vma;
 	if (!is_valid_guard_vma(vma, /* allow_locked = */false))
 		return -EINVAL;
 
@@ -1293,7 +1292,6 @@ static long madvise_guard_remove(struct madvise_behavior *madv_behavior)
 	struct vm_area_struct *vma = madv_behavior->vma;
 	struct madvise_behavior_range *range = &madv_behavior->range;
 
-	madv_behavior->prev = vma;
 	/*
 	 * We're ok with removing guards in mlock()'d ranges, as this is a
 	 * non-destructive action.
@@ -1336,8 +1334,8 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
 	case MADV_DONTNEED_LOCKED:
 		return madvise_dontneed_free(madv_behavior);
 	case MADV_COLLAPSE:
-		return madvise_collapse(vma, &madv_behavior->prev,
-					range->start, range->end);
+		return madvise_collapse(vma, range->start, range->end,
+			&madv_behavior->lock_dropped);
 	case MADV_GUARD_INSTALL:
 		return madvise_guard_install(madv_behavior);
 	case MADV_GUARD_REMOVE:
@@ -1589,7 +1587,6 @@ static bool try_vma_read_lock(struct madvise_behavior *madv_behavior)
 		vma_end_read(vma);
 		goto take_mmap_read_lock;
 	}
-	madv_behavior->prev = vma; /* Not currently required. */
 	madv_behavior->vma = vma;
 	return true;
 
@@ -1617,7 +1614,7 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 	unsigned long last_end = range->end;
 	int unmapped_error = 0;
 	int error;
-	struct vm_area_struct *vma;
+	struct vm_area_struct *prev, *vma;
 
 	/*
 	 * If VMA read lock is supported, apply madvise to a single VMA
@@ -1630,24 +1627,23 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 		return error;
 	}
 
-	/*
-	 * If the interval [start,end) covers some unmapped address
-	 * ranges, just ignore them, but return -ENOMEM at the end.
-	 * - different from the way of handling in mlock etc.
-	 */
-	vma = find_vma_prev(mm, range->start, &madv_behavior->prev);
+	vma = find_vma_prev(mm, range->start, &prev);
 	if (vma && range->start > vma->vm_start)
-		madv_behavior->prev = vma;
+		prev = vma;
 
 	for (;;) {
-		struct vm_area_struct *prev;
-
 		/* Still start < end. */
 		if (!vma)
 			return -ENOMEM;
 
 		/* Here start < (last_end|vma->vm_end). */
 		if (range->start < vma->vm_start) {
+			/*
+			 * This indicates a gap between VMAs in the input
+			 * range. This does not cause the operation to abort,
+			 * rather we simply return -ENOMEM to indicate that this
+			 * has happened, but carry on.
+			 */
 			unmapped_error = -ENOMEM;
 			range->start = vma->vm_start;
 			if (range->start >= last_end)
@@ -1658,21 +1654,28 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 		range->end = min(vma->vm_end, last_end);
 
 		/* Here vma->vm_start <= range->start < range->end <= (last_end|vma->vm_end). */
+		madv_behavior->prev = prev;
 		madv_behavior->vma = vma;
 		error = madvise_vma_behavior(madv_behavior);
 		if (error)
 			return error;
-		prev = madv_behavior->prev;
+		if (madv_behavior->lock_dropped) {
+			/* We dropped the mmap lock, we can't ref the VMA. */
+			prev = NULL;
+			vma = NULL;
+			madv_behavior->lock_dropped = false;
+		} else {
+			prev = vma;
+			vma = madv_behavior->vma;
+		}
 
-		range->start = range->end;
-		if (prev && range->start < prev->vm_end)
-			range->start = prev->vm_end;
-		if (range->start >= last_end)
+		if (vma && range->end < vma->vm_end)
+			range->end = vma->vm_end;
+		if (range->end >= last_end)
 			break;
-		if (prev)
-			vma = find_vma(mm, prev->vm_end);
-		else	/* madvise_remove dropped mmap_lock */
-			vma = find_vma(mm, range->start);
+
+		vma = find_vma(mm, vma ? vma->vm_end : range->end);
+		range->start = range->end;
 	}
 
 	return unmapped_error;
-- 
2.49.0


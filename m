Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF22222BD
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696148; cv=fail; b=f3oGNJsk3P42Ww9OQTj+GDOZhsRkeJljVoxklD/WNKVzlM7NNgdvPVQc0XvwtKiOrC7AcMUHcUzt9UooEJxso/2r7axwx0QouGPo/SY9ulcTt0wGOXJFO4CC31i7Qd6enlaEDLjrDqczapvWdbeZcoXQDWHDhvWqSazAc4sgGrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696148; c=relaxed/simple;
	bh=8XTrbj9BzBHbwb7Dg/qlSNM2oxLBAIoODvKH1ZX18Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TZ0FihGOt9hMwPingIHvtfM33DhCGr9WrHwkw/FdMAtuG7sQY9S2/vb4KUKMtNDsrKNbtYtpy96s3IZlkPGdesVq4X3zwYyqE3njtrxAfDeA168ysBAO+cn6Yyi1OU/k54uBr9BQDa8XFZfKzAzlui9f0fcvyIkxWuL6xRRaseo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PN2dH+id; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z4alhBkV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PN2dH+id";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z4alhBkV"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5488vCgK028504;
	Thu, 8 May 2025 09:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=M39p1LuPy6uALYP1An
	9vt2JynrD5NNO1Fy1NEuyUODs=; b=PN2dH+idkHpIHfM/PQtSFvcKIahjZtZ6lZ
	IKYONAkttSS6tSUNpSlsJDxopXAZl1n456aUxYlOKPtNkd6yxfAHazGrOasE1szQ
	gIVnYLaHsqZC6mcDvJzMXYyty2KT1RwCmfWcmJpUKrQuziS3ZEX9iasoPvHE0uSd
	XdClbK0TeO/z5RGYjrDfJxm6ZXA64ngnnAJYQykEu0Iangkj3+9STGlObdQKIxlM
	961hTrXF1uF2E9AbZ8+2zSeJcFmO+An7+n8aFKx2Ly1I7zkLIGkQmAw1Q5MFJB50
	dFY7PqL0FZIANele3aH1uRZMQA6nLDDys8vKboTQRsKxyvLukIKQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gsj581dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 09:21:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548880JJ002011;
	Thu, 8 May 2025 09:21:22 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011028.outbound.protection.outlook.com [40.93.12.28])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46gmcbheng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 09:21:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yt9N3wC5ml9kVY671o1h+rJuYRkJYyyLvlTaHdu8qyzZvAgQ3AjWbct7xerPt5Gu07uAQRWbOo89CRpW1+SJCjgiGf4NlWZhOm7RS6sVsnqCgo52GfYnAqwRHtubeiwRqoxcZUDBv8tj9GVj7KooM/6fjKPRLu9LnOUeQV+v9PfUs3Zv5xFTX4RtXzXeYenIbLWDCNlbgMaHRXujjzJEJ9R0c1XHLaWQxm5KXX4DzS3wUaP7FKe+S/l/His7EOGVe9xupGFV1x9lHTDzHVY2YZJFnhCkThl5RDRXs1A2PRIM37S7K3I/dTg7D3w2dWs2QhMIWg3o/y2CruwmDI014Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M39p1LuPy6uALYP1An9vt2JynrD5NNO1Fy1NEuyUODs=;
 b=dqEhKurYoWnKSx0qZvK+8oPBhfdLEoWBBqAHOmdmE7JkyRHcFuyOVKk0tZ0ux7JeDrVIokuSHj34HNTpnPWrDOscKUROD73lD4mH+5C9KfwcMdWrJFwrMWs01i/Ws+2/vP4TGd25h6ZWwOZvI+5Om2ikuTXsPZ7cGo6HYWNv3/08oXtx+T4fC+jvwZESWP5vnsL3Ygm6k2Chyh1kEJbpaWVyiTNg2lD+XkjGsN05EuUcVS4uWSZ82UnFSr7pcnmNV3iwb6NJhT0NXmop4fBux/RYSu7HiROcsf6n6GJs8NsGb64581cM9EGAhuppelhn3scUyjMsM6O/vXJn4cNrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M39p1LuPy6uALYP1An9vt2JynrD5NNO1Fy1NEuyUODs=;
 b=z4alhBkV89Xy1Zql11gtszq7wBRUDM1YgjIKXHxirPn1duqJ9XANbmTd74+e0mIm9GP3e6ZIfma+CDqYCUPTe7lxricnG0WMIMY5ehFJSLfWATi/cTIfT5w5wYyueV5oo30RClehZAwnk+JfhUCu1cpAQeWLbsUOFdda7aRXTPE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPF5816B0BC4.namprd10.prod.outlook.com (2603:10b6:f:fc00::c28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 09:21:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 09:21:16 +0000
Date: Thu, 8 May 2025 10:21:14 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v2 1/2] mm: Call pointers to ptes as ptep
Message-ID: <b0b15379-1679-4ffb-837a-9fb64550249d@lucifer.local>
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507060256.78278-2-dev.jain@arm.com>
X-ClientProxiedBy: LO2P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPF5816B0BC4:EE_
X-MS-Office365-Filtering-Correlation-Id: cf05d80e-99d7-409c-450c-08dd8e11af94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8zYVKX6T+xo7elHs0PhoLcAhEDWtRH5kwCMPZmHlVp+UvTbzxbT+uIMWMqDs?=
 =?us-ascii?Q?WSxbYWXFuLGqWSbTziEE+3SLs2r8iuIjmpU94Am+11fewkovMJhxDSQWr4l5?=
 =?us-ascii?Q?6gg8x4yTFe2FaVL7l1TCGkMQvq6U72u/c2EE6r4ZCvj/KiSB1Sr7ZdanNjHI?=
 =?us-ascii?Q?FAdCR2YjOeb8ax2j9qqFs0ayAey0mFSQpL4/P8Sgdh8/Rkv3zT2fiTVjFRBd?=
 =?us-ascii?Q?T70yjU9BBMFKzFqBpqHX+AvDmEiG1sa83zAhg7s1L0VeHcovqKxF7wDBAOKP?=
 =?us-ascii?Q?FWhN9cGGiHsa72FJVt6ciMDS8wA/oWhjwBEfo3xvvS53ery3soeGh6tmZdbi?=
 =?us-ascii?Q?DjZqvaRtjfN1GmXFv8/w1KaReiVnRMjOGkfGxWUQklP3/YEjaD3sV0LOTt5k?=
 =?us-ascii?Q?QXjbI+SdZVmfG8xhjpiZM4l90zCFoniSZmLaxMd6KFiOShuv8bXljW9WluPg?=
 =?us-ascii?Q?a+JDhbTHNjLIllny/FRkWb00YWGErgvsTmk2VKJbQhVG1PW0mNhuFd12UVJw?=
 =?us-ascii?Q?0o648l8J9DIpEGCkkBISALGOx3cFLz31EDBiVrkGBm9oPU8HXWrCeRe2nGTx?=
 =?us-ascii?Q?KgG6QHU3rbipUF5ny88ORku7XnZGv7DzoTT7HVilrRRfc3On0QMugDxK4FCr?=
 =?us-ascii?Q?0Ofp2AlMRR7O1BFp7gezXNcefaQHgkkbrded9bDEwT0nU55G3h1crE5Wc3c/?=
 =?us-ascii?Q?k60BKzUfU5gdbPrdobKArBcj7yULh2+qb/wgkZdzLGbVUrTfMdWsEo1O2qyU?=
 =?us-ascii?Q?LiQNomeifkVB32vYda5Jchc6M5R9iuK3mm+8myVRSXJkQoXbjEvAvIyR79Xw?=
 =?us-ascii?Q?xGkgt+rWyk5UCVGwAPGqI1fkvL+YSzGLvT5YPWyO47tSpu/tbI6ES2DMyVVr?=
 =?us-ascii?Q?CyDnAYnpdC6enM9gL9LYT4Gse8ODQQnyx5ZqXl6GC1v0VjxVXjyVKfq/MPSK?=
 =?us-ascii?Q?ao3H7yWmM/lu1P5Y5zAVNNJRsZFLy/Fu6K3AFfoSLOVJY4AZOB1dS0sdfHru?=
 =?us-ascii?Q?Z7Bs9EYXUVSQnq8ZqpSA7sIw+KhthkKt1viyyP/GxQnofuC51W/jJb0xfKvC?=
 =?us-ascii?Q?HF6rBZ1mYgLqH4sY7f9wYCgHeFWafM9k83pqSjKJKK8t7iWoIW8zNitlresR?=
 =?us-ascii?Q?vCR0jLnnzzQC3A36OQArwgW61MNxSAU45l/WHop+7yR+mjy6b/0GdejE5AA2?=
 =?us-ascii?Q?g18euxqp7LWRG/gzRvfFyZBYhGeyS7EPycEENBcDesNgKm6gpsDxsxaFCrql?=
 =?us-ascii?Q?DOISIo4s+e8W7eoQMU+YzYzbX3VJywFlRYVbnznwfXVdHnFppZj7KBwVwiLb?=
 =?us-ascii?Q?WYZFzrthJvLKidRMHGOmgQ1+zRx+WqyMLXtpnki52t7lWWThpzsPCdMBmi79?=
 =?us-ascii?Q?5F8DizbPoWqnVzQYKgxrz1gRpPGKpfbHotea58Ltr/WtTzu+vxqViNIH/cq3?=
 =?us-ascii?Q?8Q36WHU1ZRw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ut6ZcEgC8AyLhtAW34OgmNAG7+76hpr2j5RNvpQQ1Be7ySTX0zb4yjkh7VU?=
 =?us-ascii?Q?hpTh0YReZMq9rBxGkLaa55J/6/iesabAmu/ZozaUwqNW1GtKIGj0unHF5Rqv?=
 =?us-ascii?Q?k8oc284TUJWlNCcLCO9qxqPATVyLDIgth7ljF+oevNEawarJO0MtfhVSp+qA?=
 =?us-ascii?Q?3Ge66UjUN78xfRLFgLPozgUykUxpGIhWhMBWOw+1pRC8+SdPZNe3pMZwvRqR?=
 =?us-ascii?Q?ubSAfLVKvhTT3DXVu0Hv8REOUAiGdeCkL+YqpKBpROvVoJw2hyMgp7GMikIt?=
 =?us-ascii?Q?IQi5GB/CCz0N+n6XL0iWjM4jV1P1xQs0deHCE3/VDBzKx7AAQDIRHJ0KKPKo?=
 =?us-ascii?Q?YSolZWT8RTKOiI8BiUpsO1QNLgXjSxHPHfhYJ5hcf+aiKXaP2aVw2qpIFrgf?=
 =?us-ascii?Q?sjePfZkXyIkTZMBLtUcnTTB7zzb9XFzcJKxgjamaxFk7y7oPac+0e59h3JLI?=
 =?us-ascii?Q?dkL2F6USui0LJx23olwA+Aer1yKefgTNt3hVsjmGcbQ28DM5jWeONQJ55EnO?=
 =?us-ascii?Q?81ip2Y0dbgIAFpudUd4D8ZpdobZhTOQ6JvfP2HoS94CQX8X8oknWIXYojkwL?=
 =?us-ascii?Q?I+JckxCQZFs5hTRNmNVAnR5WyNoq6b+y/o45gdab49OCqGBrvqV5ss2sEN27?=
 =?us-ascii?Q?YXYRk9lvB894RqX6uRVe4xtxsB+9qmCYgrHfOfh+HoETWwY8eZ0AYc/5iaF/?=
 =?us-ascii?Q?qBgf5NG1+/ljqhHBVqYM/Ews/ps3pxJzTUblS2UX1h2sOqtJsrF98UkGLi/K?=
 =?us-ascii?Q?sonYUx81ZFaRASfV1uCWSJI5mULmipxYyFmQsPP+f0dbxWPy24BD/LrdQyY9?=
 =?us-ascii?Q?fhAdeNaxehIXln1oUnMW/iSyMta3x1BwDAwp354lWNnKVYX4Dv8XM0M/XnzK?=
 =?us-ascii?Q?4uhfmvxc3zg9yO9EyO1X2nHu4X3YJ3gP1IGX1QZvj87k9x99VabGN9XIM0ad?=
 =?us-ascii?Q?iEmFsZDuDR5eRJXAlNuJLtBJa3x7GuRS6ddOpXMMavMs/wGphxYq0lc5Bf1I?=
 =?us-ascii?Q?SmeG6HQ1+7jTIPIAYnEdDRSQj3R90Vg+X/r+1izW7fnLvA7u7Nw3AOrDvSzp?=
 =?us-ascii?Q?/RO7pUOVZdKTdSyyTMuC//fSgMTqjktzXZ8/jFkgAdLspBa3g2gqomNmJ9sD?=
 =?us-ascii?Q?2+OihUX8J5PhcW8MRDgptprkCG0YrGZ3Mec3QRigu0JD+Dc4Y0om3tVOVw6p?=
 =?us-ascii?Q?oNSxaiDCpULWgzO5l/wSHvq0hZpOj4fzkm8y6vd/H3BW/jDq5wFH8RLjOZnx?=
 =?us-ascii?Q?aIV8y5ZbRU34G2PiDrBvcHg1wK3Lfd6ZIN89rs6oZ/M4Zu++G7m/G+KC7Pdb?=
 =?us-ascii?Q?GwKGVp9dI1kPrSatppJ6dN5RAu3fyYqfnokLzavtHFukophIe7KvSdUAYLJu?=
 =?us-ascii?Q?tc7CS6H84FoJ8jxBEmVSzWUtUJms4tBb7V5rWkcPcMjoYcDtXwP0MycmK46L?=
 =?us-ascii?Q?ihLJO3ezP6bQT/WkbXz0hhabLkKymA5a2vU6/chYEj0MG1n60X4D3v5HdvhQ?=
 =?us-ascii?Q?q5u5vgDPRTWBFY20qCaPaZ+PP/Ul+ryU+8i55/WJgDmVMYptvH4rVvLJWXnq?=
 =?us-ascii?Q?D6TckxFUPJi0NLVCh1BKKp0Jm93KRGR5gkjwZ0iaAzo8vCUFx8TWv/k0tcTm?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	81ZdZXsa9YcbSlweI+2Kgp3nZcemtZ88wUJWeAr0N8h+gIniXgasNLv2dz9ifKwJc6gqS/URBrQupkGFnjxjW6ddpAnuSWQunelyGqtuFo8k+6sBkpoGZDtjpMERfOITkGEJHEYuXxei1hKkCNm7Y5H/LsLU/5FJ/3xj6z11KKWtuyM0vMzt3VxHz2FX/JTy0SuhuQI4dcuxQqxj7hd1qsBI2ryRFQdov11jpp+rpzJCN8q4OcVOKRrgmnbZWQC2wyXB7SmlMM412qNGlj2GT9by9T5WRDzjjbrkJnmvc4PqiFuD0SHs1CuDzDtvzoJ5+XBKkZNLKm3sPWWjRf6tyyHx7m/T6iAPTStbElsb9NSiPRaR6T7aDNrLaZlD+nBY+8xP44vAOp64ec2/frTupmDv4egfgCXOeLvbxpPikNz0r9oXvGs1l5UhUPqeON2Q4ygJjNVtIyYnGAmmcD8xeOuVoMXTQyIxC9meHOL8RUDLa1vn6Hu888WO+liFfhrO2Rz5KwmGdiTnxX0P8VUBNWrYVjEJQIYd/BXZ3T96BVQGdaOEElpDKLMrf4E6b+skw9JySFyup1Xcn6GST58Wp+Fzp4YE+7vpkhoi+DSn16c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf05d80e-99d7-409c-450c-08dd8e11af94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 09:21:16.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McBW+aWrH7u6Bj+fOnIOi8px6i79sKsp5PcKJKYCKdEy5iwtOMnuv/dW0n6p1dJWItPyucrS+9OcMKfqG/mzKDAeiSjwyaIjRhNN6PaEHj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5816B0BC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=689
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505080083
X-Proofpoint-ORIG-GUID: j3xvEdWySQeU8Ja7a-M-Lg-KFDWKQviE
X-Authority-Analysis: v=2.4 cv=PZP/hjhd c=1 sm=1 tr=0 ts=681c779c b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=zbFZV_eTRfgqBz0VDosA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13186
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA4NCBTYWx0ZWRfX4rbK1BmjCMRz 22PON3FxxaDkCoKeaG+PjuH3bMWnRrnXhMuwKUoKVbl5LKYF9SbNXIJu0cMIjgu9Jfh2mWm6Ytx SG9XR1IepOZ6wJMF6bB0iCEOctI45ix9tFnrq7KHJtiKOTgMXqS4mKagOgkhOMFlvghi0U9jT+R
 baV9EUoU3ev90EjMV9YI5+TsS6NLUBXB4qtkG09hBIlB1yEcbVdvGB/wwEkAZ6DCTDNOnhHqchw Q9xecY9N5XPRGpqlMjKylo+GR1rHhlJhqrAdV2Bq6u3K8KiT9LnIncBIKGtC9NC+iYiR4dypz88 WfJu4KXDUFtbcl1Wr/lDp9A81nZWm9wHoP6U8XBRcAPVaFHOiyjz3gpAXxT5D0jT5kwwBYu8c1A
 k1VRBaUiG2dRC6PuyLbFeSiJaBlhqJF1H1lZ0YVWsEC1VzTO+gaeEimGAYPuiOL0u4GD66Ia
X-Proofpoint-GUID: j3xvEdWySQeU8Ja7a-M-Lg-KFDWKQviE

On Wed, May 07, 2025 at 11:32:55AM +0530, Dev Jain wrote:
> Avoid confusion between pte_t* and pte_t data types by suffixing pointer
> type variables with p. No functional change.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

LGTM, thanks!

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/mremap.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7db9da609c84..0163e02e5aa8 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -176,7 +176,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	struct vm_area_struct *vma = pmc->old;
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
> -	pte_t *old_pte, *new_pte, pte;
> +	pte_t *old_ptep, *new_ptep;
> +	pte_t pte;
>  	pmd_t dummy_pmdval;
>  	spinlock_t *old_ptl, *new_ptl;
>  	bool force_flush = false;
> @@ -211,8 +212,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	 * We don't have to worry about the ordering of src and dst
>  	 * pte locks because exclusive mmap_lock prevents deadlock.
>  	 */
> -	old_pte = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> -	if (!old_pte) {
> +	old_ptep = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> +	if (!old_ptep) {
>  		err = -EAGAIN;
>  		goto out;
>  	}
> @@ -223,10 +224,10 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	 * mmap_lock, so this new_pte page is stable, so there is no need to get
>  	 * pmdval and do pmd_same() check.
>  	 */
> -	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
> +	new_ptep = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
>  					   &new_ptl);
> -	if (!new_pte) {
> -		pte_unmap_unlock(old_pte, old_ptl);
> +	if (!new_ptep) {
> +		pte_unmap_unlock(old_ptep, old_ptl);
>  		err = -EAGAIN;
>  		goto out;
>  	}
> @@ -235,12 +236,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>
> -	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
> -				   new_pte++, new_addr += PAGE_SIZE) {
> -		if (pte_none(ptep_get(old_pte)))
> +	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> +				   new_ptep++, new_addr += PAGE_SIZE) {
> +		if (pte_none(ptep_get(old_ptep)))
>  			continue;
>
> -		pte = ptep_get_and_clear(mm, old_addr, old_pte);
> +		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>  		/*
>  		 * If we are remapping a valid PTE, make sure
>  		 * to flush TLB before we drop the PTL for the
> @@ -258,7 +259,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		pte = move_soft_dirty_pte(pte);
>
>  		if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> -			pte_clear(mm, new_addr, new_pte);
> +			pte_clear(mm, new_addr, new_ptep);
>  		else {
>  			if (need_clear_uffd_wp) {
>  				if (pte_present(pte))
> @@ -266,7 +267,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  				else if (is_swap_pte(pte))
>  					pte = pte_swp_clear_uffd_wp(pte);
>  			}
> -			set_pte_at(mm, new_addr, new_pte, pte);
> +			set_pte_at(mm, new_addr, new_ptep, pte);
>  		}
>  	}
>
> @@ -275,8 +276,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		flush_tlb_range(vma, old_end - len, old_end);
>  	if (new_ptl != old_ptl)
>  		spin_unlock(new_ptl);
> -	pte_unmap(new_pte - 1);
> -	pte_unmap_unlock(old_pte - 1, old_ptl);
> +	pte_unmap(new_ptep - 1);
> +	pte_unmap_unlock(old_ptep - 1, old_ptl);
>  out:
>  	if (pmc->need_rmap_locks)
>  		drop_rmap_locks(vma);
> --
> 2.30.2
>

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0E627E7C5
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306869; cv=fail; b=IEAy8MnoHVrWHfJ1oHPimaR13vM4wSmQsFlMYzAgrniU2ZawHLlgKOTpPBxUe1fL92C1V/Us6P0w8VGOECoh9rtccDufkxEdOhQ97e+gvx9P2a8Zv8LY+6QsSL/7LYIqmUoE7K72iZ6JIaizuHM/GU7S2VbdcTDYOV3Nkl2XudE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306869; c=relaxed/simple;
	bh=YyQm0zfnE/GOX9hQuT2madoohBV4GpKMgHhgEwC9IZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WVoLn3CG+Em7wE8PCLtZ8irs1kliewIGCZMaqSvZKg21fe22a0hf44fI1hnaWWq7u/VMza7QuEwu/gAlkoAwHMFuLl/3U3DJe4mWxuiR1uL6L58MPdFYv8BO6xAjLSr6hs8+NrxNe6M186O6+rGIJzKFEnKabM5Mtly3Di+3ecQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ObtLW6UB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yNgpzqou; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ObtLW6UB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yNgpzqou"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543L2L7C000499;
	Sat, 3 May 2025 21:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AjGL/kfeyRYEIw308dmqe7ZSy9pdc5LmotsX6koWyE8=; b=
	ObtLW6UBaIJu5fSg/nM8zeAwWXpMZgZWRzASWrNF26FtoM8GiNnHWBEy0zdzTIxn
	rq8805vqTzwc7TIBwBnmABU5WJYkU5wLXQka5zSV0rsOB9wWxHGzq+cAkdgoFG/7
	7TEFr0Oy7wnGrs6ryXGt8QPWAsORhy+LLUVKhW2FGUqJf71Y+dcL73SJwLueak8B
	VvAZcnOaW9kP006Sl8kBhaZDPdeuBVihZmdLWzzJgNH0wKVt0s2d3pSsDZTZAcwL
	5sw7RKr2d3V6TkmLq8uG3T5e9hstw8auuJ/FlrcEgzrFaAzFCWYzOLhhrRjIGJ1W
	UPIv45qIroldZSTIfHgyfg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dtja007k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543HmmbX036125;
	Sat, 3 May 2025 21:13:02 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010000.outbound.protection.outlook.com [40.93.13.0])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k6f61p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB7R7k2F541yyGR4u2JsIfTsXMvM6OhEOYQ3ft6MupuPslutN4o7pAoTqbLIb20IzniFUezQKnsVqpCobJxaZH5AxNObBVRXs3XUWT9CoyEiYFHOp+k6ujIb69dbpgDyVn1Qh8TwmS5/N0a9tMVpWYU0piwuqh7FitbfDL87ugnSreGJ7PuuKt0rh8untjXp2Q0g7wZGmGhP3so801izCVUyitpRiZLMsjwhWAoSsOVdji7wQu779PP/FCpPo4Y7ZjViMim+znpDjytTcuBOhe2TTu44/VwD71+q/fOXqfFjII2nfQt1MpO6EbLgVDJXx2ge5a6rwRAtPEWMHno0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjGL/kfeyRYEIw308dmqe7ZSy9pdc5LmotsX6koWyE8=;
 b=log2Z4bI5C0ob+YEBJEkXHuNEsVpwYuQ+jKFW0kTmt9tqgL5f2nYnv4FgJ/4gHJn2aq+JZptS/oXYsrvNQ7KH4kO60e2tkcRnxH8Qn8ZEtcrzaiKbgeW1+Arx3fiCc9obKzPBTxZN/JHq4ointJWRMBDbq/0NnLDFyMFi3RnIROtqm/qkWE4neBnGDUHf2pYivqFYoPJePiK3JigxTGG6Y7b5x0w4TieiZtTIFcyEZ74GgbPzi0qdLiJiZODaAwMTDaBtAyJb8DHQpFNu3rkGjAsgYgmjwAyuQxZcb6OnF/Sa54hHUdE3GunVNi3sa3CnFEocskLZhV9IJhLCLdEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjGL/kfeyRYEIw308dmqe7ZSy9pdc5LmotsX6koWyE8=;
 b=yNgpzqou0UZpExhncTlpHGf7gFO8QqOOYCh7rYSnBDnwrQYUo6ove+AHSASFdiGUk8/UZX4lSbom09xHPL1xoDEX/0ejGzkQoSPU3YGicA7x/4UAjJEhW4E1pceGsFc5zEErB/PRnPG0lOu1behTIp21DG8S7Tqvn8RGE0s4IQg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:12:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:12:57 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 05/11] tools/testing/selftests: add sys_mremap() helper to vm_util.h
Date: Sat,  3 May 2025 22:12:27 +0100
Message-ID: <9a80519bef46ea2736f63f7ff996d3b2c9573268.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bea14d-9302-4d79-dc13-08dd8a874747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+1+dKe3Ij5KLlbI7VezZewmZoCPbn34Urez0vaKNp83gQLXgOISuC6sDIDAF?=
 =?us-ascii?Q?Om6mTYvHGdmgqOIYFBXhVAPc5Frv4Txbllh47XDJVWCysw0siNN8oKeClS4B?=
 =?us-ascii?Q?Jc2ojiJ1dj7wlg0AcUqxhsCzIrHYCrZsWUGBoD65zcTQS+/Kpc9wiahmNi7D?=
 =?us-ascii?Q?VuVZMfX2Ws39mrNNpIIyjifRS7giIeOk+yWmODMj8+cErZVEJqASBx0/mEan?=
 =?us-ascii?Q?wwwUu/Tb5cJ7gZv/y0vSScqe3TYBzjwesqZOz2bkNXlCqGqJ6C3J9rh4j5+v?=
 =?us-ascii?Q?QWWm850K+GSmREU1LIOODDt4K/o5TPCtt6HuksayY6UBxM9iE7DG9kmDeDpF?=
 =?us-ascii?Q?2Xw5q55MakKjia7B8/0s4XpdQ6zBinPbiIOtmh8ieD7zcKqN+I2gdTnojNec?=
 =?us-ascii?Q?lb5CT8z4BfxvBy50zVkd3i6HXqlaVDr84gfi6cKpiAdmO+23Vni219eukjjm?=
 =?us-ascii?Q?D5WMOb5Y/ddsxqE71mVOhFy/0aJUzf266R8A/CAH5/Y+61bj5akhWrWNvNeA?=
 =?us-ascii?Q?FEbqlIEZob7uAdQ/fft1EiEKXvJh4XlVZe0wz/xCU2NpX3GeXFQygm3R77P0?=
 =?us-ascii?Q?ziyOl6/CJrZK3aURmdPP9PE5wEMbbkOslCqcZ+RvHkHmJftQPbqSpnUwIoNs?=
 =?us-ascii?Q?N3ZfU3diYL+g1DkpWGjauX1/3j7FUcz/RBVWznRGUBwno1TTysx6o8FxVZD3?=
 =?us-ascii?Q?aERu+r5nWALSNzrgxsB8IU7cw2A0FMR+nRdrUUT3fqL3GAAn4qgAlD/2pyfX?=
 =?us-ascii?Q?Vx+4lqneub0X4zKYbvJDB6Kxifi9jB7HxqXexBliuLDLPwaMhtUX1aUw8CF2?=
 =?us-ascii?Q?SXyXKdPxj3Pg0i0jmO9JkyiiVX/5/ntlzPt6Ev/vHOYU1a84Nyl81sgTb1X4?=
 =?us-ascii?Q?BF5tDkXxK299CJcFV+FGz+P3CejsCUWSPwd4m3mH10YduIf7vFGwZP5dpPFP?=
 =?us-ascii?Q?h/rdCC86k22pcnbyq6AHStom4uuPaKMkgWBfLccfU9IHxJofu03qPxbnd5sd?=
 =?us-ascii?Q?yaqqxK15TO45EdgiqecqaB/3sgcFPHpPv1NvHx/2ngdblvUtFDeZZ1/eV8ZJ?=
 =?us-ascii?Q?Jkb7ZCt0FQcvXTEtL7WPXSLuULRJc2lj4ado/XqvkMx6wENVcjeYcgR1yNFQ?=
 =?us-ascii?Q?vM6P6/MWg1EeKxqhC2e+9jyKZZP0wO8rkCqI1SvRZ+xGVB2eqZj2Cr+YjiDJ?=
 =?us-ascii?Q?Ck2hpmc8z+ZOAT2YDyeTvD6d9kFCOqL2R27hbfkCP7CPSUevJGnzSzUL8Y+d?=
 =?us-ascii?Q?zoAw5THHpkRfgolNn/jHjFbXBSG7GSLOQAFKSR+afCnEy7f8QYT2G+x1pcfJ?=
 =?us-ascii?Q?CrlZTMqyDuDFLMRbVwlf3FgRTHTndqLk7odiReNE6/1tFtQJlBLK1aU9Q/qK?=
 =?us-ascii?Q?Nx8NcmSWN3j9lL77e3HMirCB6JDh3T62BcmlJoId1qdKos+/PaKpsjoS25I8?=
 =?us-ascii?Q?gLCVqfPveaM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GN8G99VKKP370AiyDNAIlZRPH1EIVMd0ImAFTAIJgVw7L2FMglKOBU+aIJzw?=
 =?us-ascii?Q?W6c3WHAra1zBrdae0mmIlLlBJeRrNw+vnMsBcSUH+Znc11ESm4rVVQnKskCi?=
 =?us-ascii?Q?FhzYM6nWghf5YnmXUMMnz1pBzaDm+4CUIEnkHLOwIzIPFJOjMr4PEsFx5bHh?=
 =?us-ascii?Q?FD+nI0GA0IiX99jCYHWjpLGSOj2O5xo9MhhLQA6cZTucy7nLMTEr6Hrwz0Tg?=
 =?us-ascii?Q?+a1AXasGUbyAMyMATmssCKAf4i+PzsOv/Hq0IgK1asfFMU257oYwMUHTIFAI?=
 =?us-ascii?Q?+u5HbT/A15P3eGeDBgijeWgGobpKCBqKN5VS3LZrMDGK+oZC7Bhjfx4hFGya?=
 =?us-ascii?Q?DceFlpVzyoT/PC/RVQir7BUOYAkjpQqbF99I0Yy47AFaf5Nqvboc260W29hT?=
 =?us-ascii?Q?kWk0tWEMGQfgo1aRxTP2SPHJ4xGg1giGNcXo01XYHbsV7+AOFg8nbfqvUB6M?=
 =?us-ascii?Q?lyHdQjsQ/Mm3WONbiKhnD+I93kLBf4Xz6TI5VzV0RLK5B6eQGlwom0VAZQ3X?=
 =?us-ascii?Q?00Q8D7dogZUPXZK5x2pwk8lVZUHxvShN/4rS3mcAYFeyT1P68akteBTnIht8?=
 =?us-ascii?Q?8wKilfvpkad+qbK1I73TVhy/gwwi8g6CBZOJO1lLWatwNKTqOOYPl8EXLzd2?=
 =?us-ascii?Q?Kbrm4Trq3beTUryR4mF1JphdKh7QCJ9eMxXsWxVxEHBAVDk8c/iVfcXaDATg?=
 =?us-ascii?Q?+zh6V0oVuhVZj1PgGhgDNbXAt6E/KBAHz/79K/ia673+pKU7+xFn05SZ4wxC?=
 =?us-ascii?Q?JS1LhbaDZ/C/lHlEz2uiTfim+I3b3ko2roUG+barAo9g6c4Yif3OwwW64JUY?=
 =?us-ascii?Q?gVGz54uZDdWl7+KvozvF85+umioWEVkPp/l7ysKdAmd+q+BK0M+97DfhE/tx?=
 =?us-ascii?Q?2t8fHMDc1om3Th0pf1I4e/HCHaM0wEN+PqjudQJPMLP1dYfQcGV+DUR0zkm6?=
 =?us-ascii?Q?XRpBAokbFFZ6VcmOdk5k21XQb2cUWfB6Z1QgSHnInDIUMNNSQssi8Tk4ltjg?=
 =?us-ascii?Q?cb7ZQTfa+lvD5qu5HLobakIXZLXv6bp5LWbHkNvC8s74PM+ZTuflHyJCfJFu?=
 =?us-ascii?Q?5Ywr7Bzc6/KNLnIZMxmhp4FiuxKkk8kENbps31RFBqbkxnt/b9GQ08AxrP1K?=
 =?us-ascii?Q?zDtijmFY5MTjZMfEcfXcSAZNN4oEKrG/zWNwMIB3s2eDfAkDzWqWPDRKVcgq?=
 =?us-ascii?Q?HYNw1JsH7FHlpURuRJlf/Uhf11GzUxgJHDho+yNX4uXuyVFvEoVC8DsUoLPU?=
 =?us-ascii?Q?t06jbxIjntE3cV2RCsHU2Pm7hoz+cQk+srka3J07aTy/ZUoVUEYLM3FZkJxa?=
 =?us-ascii?Q?14lbzp118yu+YiQjxGuo53gezSzRsVJ9aL1dake/evbyGgmo4Omq07dFkH/l?=
 =?us-ascii?Q?13H4kYXXqQPjUS1ExVwuJ1+513tE1sS9EQHIXFFOLUEjAeB7D3JAWgyGYwXU?=
 =?us-ascii?Q?F7yd9KHZVH3gD03TPEtZvWL2V7ldNfhuRLfRbtZEaLH04ICjPQj0DqFb2EN9?=
 =?us-ascii?Q?fN3nZzLy8jhYWhWS8+85RcRrfkX64S3ZQSFg2o1vR6LVd/VzbvIbV27D8Uid?=
 =?us-ascii?Q?aXcWnCscoYs3+v9mt+dDa9HHNCdFdwvDqeKTPL8Nd/kHoabrrEb+QqM0u3AE?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tAsunSkkp6iidp5ijbn6Mfgt+ikgj/rvjGPHHkGNgZ9Go3mkQ1wugFp/06246YvWkFlaVo7SISmYNz7mIgpOgy/GnxRVXz1kCMZvCvrSUH2YUbD6HTToohiNp2/Kp09YWPZSRUJHEUoC5xAIfjn3XxDMLdMBpIcN7MyuQQEc09RdodJgIfRSkTo6bjA6Grg076jJWl4Hq1bRrS6/i6PHcqtPhRLfc3Tu/bNTxyQiWBu2uUn8u00+x7ShebKEO8/EyIC79NwPrRZS6hNibo6S+PlvWnS0fbEyCtgbqCNOjtFyirWxGfQ72LiBoWDsz5XWpGRr8rwZxmwcrS5YYdoSXpSvzC0nLTtHqtOxBlctwJFjlRV2u8ffuc8JIRQWkhTP5rA70rJAnlBNqE0JvyDkD+M68C5ApKz4su1v9wZ0PXfCUTmNt6cXxLxFCptVWD/aBIbcvYS8aKVmj3XEFpflM80bt4dSLz01R6Zyf5ULmX44t7hVgYOoSuDAPpd9gCGvtN4aNh/8vhJuDkUsbV8y4lcHCfuF1Ps/k5iuQD1sOmBiIdP++Hjtq+/FYKciuAf4lrKhDBdp4OGY5xmsrLjLUfawTUn1Z4DsNriJHtGT2ow=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bea14d-9302-4d79-dc13-08dd8a874747
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:12:57.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbOoE5RKA+vyv1EAx/D1FIpCd/0P47lUq5aG2h8nFscI8+aQs3cYqH2H5DFcT1hmkMgMWLAm3e2KC2Q8F458ekFpenxTdGIxFIyR4xNDbpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505030196
X-Authority-Analysis: v=2.4 cv=fu/cZE4f c=1 sm=1 tr=0 ts=681686df b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zIMt3jsyNdXqkI79ZEMA:9
X-Proofpoint-ORIG-GUID: _JJnbQfxxebhqSl-EqsRQaZEmRd6aGyI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NyBTYWx0ZWRfX7tb+UQF+uKVS qD32YKFC0be+pGGyeweBjpMXqdt63uX7u4/chAqskRbmpDnSWwa6NNdyU5NO3sFhvoM9IWMWuds QrsiwIoSs+5SPwrT4gtuoVm5z3Fs/8RPEA8L7uX/GbkJN3KamnsdZk5efg4Ysf/FBafX9LDqOVs
 w905TU9z1MD71ipGqttXDUgMcOkPOMmFdSJxGF5m2wKpVGD1YPn0o6k9HGc55WSJGUb0xGblvSU HQUrsr77TujdkQW+Ya4tqEnC6IYQVn0UwIIBWQg7O9UsS0fYBn5lnWEFpzUggxZjknpOXB1azUr S2s04WkD3FITILrv9XdCUt0p1rtmoEOsa4aEYUwdJHxslz9mlg2zsau6jBF/N1HYj8xgz1imaQV
 2KghJBsx0JM18biH4G/kATWySq7COwHvzd/qRay6FL9F/csC3+yqSmWJVHNXG62872ZZzyb7
X-Proofpoint-GUID: _JJnbQfxxebhqSl-EqsRQaZEmRd6aGyI

Add a helper to invoke the mremap() system call directly using
syscall(). This is useful as otherwise glibc and friends will filter out
newer flags like MREMAP_RELOCATE_ANON and MREMAP_MUST_RELOCATE_ANON thus
making it impossible to test this functionality.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/vm_util.c | 8 ++++++++
 tools/testing/selftests/mm/vm_util.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 1357e2d6a7b6..a2f07b10c0e7 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -486,3 +486,11 @@ int close_procmap(struct procmap_fd *procmap)
 {
 	return close(procmap->fd);
 }
+
+void *sys_mremap(void *old_address, unsigned long old_size,
+		 unsigned long new_size, int flags, void *new_address)
+{
+	return (void *)syscall(__NR_mremap, (unsigned long)old_address,
+			       old_size, new_size, flags,
+			       (unsigned long)new_address);
+}
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 9211ba640d9c..434a96b33738 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -95,6 +95,9 @@ static inline int open_self_procmap(struct procmap_fd *procmap_out)
 	return open_procmap(pid, procmap_out);
 }
 
+void *sys_mremap(void *old_address, unsigned long old_size,
+		 unsigned long new_size, int flags, void *new_address);
+
 /*
  * On ppc64 this will only work with radix 2M hugepage size
  */
-- 
2.49.0


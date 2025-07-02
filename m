Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BC9234971
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446402; cv=fail; b=MUJXtIuM8OY2rBKhJBDU3felIVupcraAaprYNgYwwPbyiXvzecR23zx7l5GZce3Ek9nPXwv2ZGtRXn93RFZyz8SJGYa5bYqQ57tJh6fisSloeqyJI96vRskRNKvUrfci8qmX7w7CBRZ91/IlS0lAiIs/QZt7QSVXbEoN94ehGck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446402; c=relaxed/simple;
	bh=NTirkld+GZ+/ORNHaqXu95MQeU/nNYZ+PeSflpA9PFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NNCG1eGRE0I3FJm8OZYLiokXna/3SwQ1NvtupjwdPSeLIkm0Rj90REkjqSFnnKjmj7Z4Cgyc7iNtSiUFy6n2HYfIrxwdrmCNheNbf3mTK1qauOn66tBWyAZoni+q5t6VxbaQhVlaYhgd7HMmCInxdXDyaCM+R7y6zzTFOmwbB9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rTm7D5n8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gy2L7Ivn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rTm7D5n8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gy2L7Ivn"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627McZE026856;
	Wed, 2 Jul 2025 08:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YOLhWGqW/EID5e3tJU
	hAqxuTA7CG+ZPqKl2WAm0LZ0A=; b=rTm7D5n8yt8z+uAq0Fx2ocCWnCavZx5xta
	3FbL/CLLq69cnt+4ZwtaC5s5TYOt+Oj0iTrePph8t7iubWoVLjS99MMGuVuIkseo
	HKxQYEOcbGQXujyCjHmQyP0QvZZ5+hUf2K93jGzdWOPvxih4ErsHSyzB3guWBWzk
	pjuVTXmObtATxko8wt966YyGQCDqt3QgevHysrO9x5uUW5r6jkWClVsUXEV95Kai
	4RFPn4dsZFnyCfOw+fiUL+b9ZuBnuyX0mSL1ckR5Y63FXORNLF+ziYVssI4Hd9ul
	WYVSTBHDHmAOllwJ3nSQ6dO33JazngfaQccIjdRGIKuIt75sU+ig==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfeeaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 08:51:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5628ZMLR019635;
	Wed, 2 Jul 2025 08:51:37 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uapccv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 08:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmi8XMS2cEhlKHesQfJYR7foufCFt9e6CcP/wAtsMhklzY5UZ2WVgxNiXbUa1LPJnHrjD8WKan5nBAkZmaVn8ElyUavUQ4URXRO1qHg1bNp7w37I0+aY4N7wrMvos9CmATD7i2xa0Ft7qsRu1fk7Z576VKGdQzuKb7G9zx2P0qyC9E7dyrXdoHqfg3Z6TikH38aFnP+JlTrxHRgNNmgxvOGbNzisanP+3wGzuBzfXiIjfmJ6//jGuIuJ2C0SqouiljIOgEPVtq+xj2LYhI/cJNlTsE+3HBgEw7KRQDrtQyJxFCNMTm1O/mbG00JVSh7LX0zc1rTgFOtDmghl6511eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOLhWGqW/EID5e3tJUhAqxuTA7CG+ZPqKl2WAm0LZ0A=;
 b=E3rAz5x/VXlzhUUYGmGpVwHxoorZMIgP6A1J8tJmBN1OKhYTmJleS3N3FqKiL8FxXIZsxz1MoJsRy6V5JHo9OUoCYV9mJJKoeL+Ctq0ojpCBXWEPPO2aVmrQRmKDZASaHOpI7YG7jr98de54KwMRFm+a9KF6MRvaX5hDI5izrtHA5Btpl5ocVmHT0VHXNBxWEHqHI4RjIw0yzYtvK4rHHYbp61s6pb0IaGHwWu5gcau75u/tmUon/XkTPDPKL9FKTydIW6Se8NjuL0IpOJjfZmhTL2eizlA2kyRf3swj39cxfh3NGsf+qkzB+nuK10xNWbTlVwCdfptjpl2SKkv7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOLhWGqW/EID5e3tJUhAqxuTA7CG+ZPqKl2WAm0LZ0A=;
 b=gy2L7IvnDArlkwe/W8d0QlQmOiHSTf4Rmv0gWbT1WX0bRcMADu8c5aNyZwUU1S4uYbxUVMiX9NNQtGvYftI1LEq8oRibK0g/MvaegFgDSmnSJQ6jbdVYZufqHPYTVFIODRXKKbOMMCjKoigwApeXiydF8EpslWH5O7C4ZhkAkzw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB6327.namprd10.prod.outlook.com (2603:10b6:a03:44d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 2 Jul
 2025 08:51:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 08:51:33 +0000
Date: Wed, 2 Jul 2025 09:51:30 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
Message-ID: <753a8900-d9ff-436c-8758-17d363967b30@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-3-david@redhat.com>
 <aGTw5ipC-ITJGfv0@localhost.localdomain>
 <1d98e96b-4bc9-45c1-9861-e0f3c5930ec2@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d98e96b-4bc9-45c1-9861-e0f3c5930ec2@redhat.com>
X-ClientProxiedBy: LO4P123CA0242.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f6f097-4297-40a1-210b-08ddb945a592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XEeWGvOIBawfTg2bTbF4JzwcyxfYURtL0yr0no+6sGMsDLw7CdYyJCJobqF4?=
 =?us-ascii?Q?hD8ShUAOfUZTWgT+lTfH8zRYGb8oVDYsaSx1Ylygt6VVWJ7mgpQveFRR+HV3?=
 =?us-ascii?Q?i+SaqmMkdvz/DnCN9J2BAc1xHjk2hi3nbuiYXZehWoaHFv5I17Rr5FsJA/6t?=
 =?us-ascii?Q?anvom20pCMlZ64gMwl5YprkOfJ+vJR1wC3iHssQ6OBCPhYcVO9TNF9eZTaaR?=
 =?us-ascii?Q?q0Zgr063Xexm6VwmmKrB16Bc+UVB7pQq9HVy7rSYKtJvdgNZ3cKWaytq6522?=
 =?us-ascii?Q?n3MK58EHJSU87JWbu+lxEdNkrkXMha06mJkmZc/ifGtsRRqy+uFGBcyyw/aM?=
 =?us-ascii?Q?QwQ8Dw+9Vg8WgzbfMVgdDVxGOLhWmi+kpe110Iu0DVE8whomaVach/AKbOfE?=
 =?us-ascii?Q?TKNX2dXYZ+Nv1B3pS/YJ7gpYk/FCNjW6f2HjUc4pySlPIT7k1NyBdhAL0Vm4?=
 =?us-ascii?Q?feoKSa+P22vXcZJ1GqoKqngcbWEiEJplmEENhwQ3BTurtFO+JvXaWE65Xc0X?=
 =?us-ascii?Q?cq8pJXonI4NVLqixCdGZ1Ud8LWAV43gJOr+FY1ok8NKzFxw7pAImNATKYaPy?=
 =?us-ascii?Q?+q2GrVWezE4RG/ep6aiXSsI5/7v4VV9b8xeL4aOXv1bHKH/BBjrcOlUTZJ3V?=
 =?us-ascii?Q?bj9qpPcp2zMzjwX/CzM5abdKqppIxXCL2RctnSOEdJjj8LZnoQPdm7repPdW?=
 =?us-ascii?Q?mMrXsFikIs5wRxGtNFKZWfZEjODdbh6fllyR39u1bYWIJ8vudtFQOUu6kj98?=
 =?us-ascii?Q?+W/FYm5Iz2ZK/JCG4qd3ApkGWSwVXNFh9nEyzZ5TH0CDDOfK4d+Go0KLrCAL?=
 =?us-ascii?Q?ee1ji6c4aL9br1jZd3RjPCaMrpK6A5J5fHKE3KjUNNULeDn88U/FW9jsJ+nx?=
 =?us-ascii?Q?KzyE46WnEc1sAWFRqO1P6S7o9HJ97pF6dFUBg6PZPcjVO0Th82BjTOzk5fyc?=
 =?us-ascii?Q?OqCnOpBDoVJ/vk7bSWk6vdn0xSj1Ld17k48b8IN1osJR4RflSdYNAhXcr2Pq?=
 =?us-ascii?Q?OdHvsXxMC2qSpJuszEquvGuEhsYQysHhQLtzCgZV6zP3toSq0JNmtB5IJ4Km?=
 =?us-ascii?Q?HqsLur+1aYQPhQwVD4gDds7qWLk7Vo+cHgtVZW49d5W5o/SmQx8zeXu8bNCV?=
 =?us-ascii?Q?wNEzqlVF6qwoYRq3HlZ92Ze8NghU6ZOIXiRvreNtXp+TSPQ5Nezz/2clr7JF?=
 =?us-ascii?Q?WF5nvN08zhDzraO9vs3GxhiwGD/Xr1pWITZqzvwiit1CSqr8laGwZ/Y9PuFR?=
 =?us-ascii?Q?UzHDCkRkV+7JcJzoO7KO3zvXxx4v4NDdegGKyN4RZ3pFX4nnHPqkatei3v22?=
 =?us-ascii?Q?wYjXUCvcrOdT7lB2qh4H8ugaUqi8w5hGoYM3a4FLNCViPyZzCggiNEbfehxX?=
 =?us-ascii?Q?UDnYT/Ic20KsYK0/qwBlTC8FXTCzVnKe24vcYoIVxU7+K8cpaHVv6zMEVuvA?=
 =?us-ascii?Q?MM2hLQSeKto=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2WhRKuuWt5o98feGBuuk1Tt0zfoTlVq1cDt/xnSxNgTFu+dZrOJRXnVivtX7?=
 =?us-ascii?Q?EnM7F0Y26k/EHM8UhpT8j0AILE18biMEkUkzbdnAvp/l9Phy5KmDoxSNcBwi?=
 =?us-ascii?Q?Qu7lOJqr5Ryipi5gSt5yunTr4PHr+Fq48iwy0/p+AI5FNkayQEEqB0JOEUJ4?=
 =?us-ascii?Q?rzlyRQK8le8kbcxZcn5faOsBCNoGR+bviZb46eVGR3/naUdaQS7QxV+XLllG?=
 =?us-ascii?Q?gn1g2xRciNHVkXIvODBSsIBo8hp7d+r2/fYS6zImTFACrdaE2DFxNqlI7k8l?=
 =?us-ascii?Q?hSmdZGGxHE58b9uASWoWqFoZMYrrPMU/MmlzR9T2ylgFdLh7/XTNAFeKPuEg?=
 =?us-ascii?Q?tjQ0/pVaMcKAhKPaw+SoU4W2UWa3MYz/ueltpAZTYCxobKx62/YcXKG9KBj9?=
 =?us-ascii?Q?rwWyuVPI/5KdCVyEzfYB2hg8ra6cZBknVsIbX90CvgjZPt0taWhLnFwNkFC6?=
 =?us-ascii?Q?2CF4QAyA9KkklJ2Koqo9Nj2RTQQ+Iy+ijWOpz6X1mcnkyQbepaaivNAXzUZF?=
 =?us-ascii?Q?2WeBC1l2Vd8pmzPQSAATPZPx77klRHBOANIG18mBlS3gZuYsMkI8k8MpiZH2?=
 =?us-ascii?Q?LucLtxD1lomSW9x6Hr4MBsP6rbDZ7j/+V+Sj/Z/So7ULrZn3dQLGPK+073mb?=
 =?us-ascii?Q?D2lWgqPuzcRl9e1jfeotloxt+pjROXmwZU/kB5jGnud9RhresbfAOtAEWYdz?=
 =?us-ascii?Q?HDFv/wUgBov5cTnV6zY/SC2wSzlUG6/FGzHpIsqiFENj93zOHHah8eBKRdoj?=
 =?us-ascii?Q?HkDn+dav1EgmwiYVb/rmyQR/Jbd/CaNYk8wYACAjzh0bEsZ4gOUI6LHpVO6v?=
 =?us-ascii?Q?01+wndqkUjDevr06WUM59ASyWu78/tEN8i3hHXVH1bto+242TszE8esUp1xo?=
 =?us-ascii?Q?2DPrFisrgDn8bFqRWs7IeunB+chpMSdXQ3A3KoTdmwAayEgVncUuSfo8gYyv?=
 =?us-ascii?Q?2Cq8GNaOB2Cn+QRAqbpjIGzQT+QmnAoi3NZbWNxxPrFpqCMUIYRN47dZvCnN?=
 =?us-ascii?Q?Phkw2pHtvSEFo24WLIMIz1KlUQ1Z2uo6ulhNHean9BvIdhWvhyoKRpF7yOX0?=
 =?us-ascii?Q?1xhsXSxqlx1Ee6Fmppt0k5BjpOHhbxKQCYMAhjdG2A8y+n0GcEpTa8Px+KLk?=
 =?us-ascii?Q?0f7cjE3Fla+PtMrRze0MUY2WBj7zV0DUjGXlyxrkk5imB0uOFzh5Hccuued4?=
 =?us-ascii?Q?4Qk9rip64XqsSDwhASKY89eQg4gaL/bmWfbtXyMWB2N0qnJNiRE+ONwgqssJ?=
 =?us-ascii?Q?cO/lHEUMNjzZNmWvntRWanqrTcPIGTDcG6h/lNT+SICa6G+ln7RMR/qqDns5?=
 =?us-ascii?Q?LGdtAZpOCEnBURa+g8uUGoCTIxPwXHZ7r+VCN0ns+M2qJC4Yjcy/VS9QRpP/?=
 =?us-ascii?Q?euZpLRV/Nj3uZ/F9RLR4AmCJdDdl9EnNzZujF9dspmQdZqiYNIU4L3oqtVDc?=
 =?us-ascii?Q?vJ09oaV7uHHHCvfdYl+qQzuuEKWU11/xQRAIAM7i9XjNDz2HX50F56HGlBpa?=
 =?us-ascii?Q?LLekvoNL2IzOoyba9vAqST0R00lFQGT3iSCuglk3saUG+V6EEJtKM7MTpbVe?=
 =?us-ascii?Q?aJD8o1DVUrqXFBrDZTN/1GAE04gyP1XzMnTT/lqwCjKC/5EVav0likZlY4qx?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0nL4s+i/muec39J1tII5zBQe44zZqoUKjOy0uxl6HUoBExH4z9CtyxJzn5QWmDzwTDsj/YFmsVvXLjr1Cd1WExkTIQ5gXI66Kco7fCRDWvAoyJerTWaiui8KMfl5XHxVAwSik7/w3KSSXM7kzfivLwuqCP2mM8o+TnaGOYDUvvxx/DLMYDdHAUD/hKW6dZgYzBMQBWJVNPpN45qfFTWA3z5DDv0qY31XJEl1QvR+dqLmS1sHFOJK+oC1vbSmOpX4DmBuNEzqVWfOcbIoe2jnOADW5h+h2Xguh6kQy9qnoMyBudKJVceQPEfkxi8vtI4x8lYdWPFwY5hXEAD3q1Sal/u1KsyJ48f7o2TeXpLX+Aq45qiFfhJFsm2MMGpBHuhTKauoAewyyOZ+Yqr9j9AE9oNQTvkKptGwphgsEAsvokmDeW4kqjKFdcGUeaXdre7fpxiNOmIQZvSZACMMHyKVHDl4bey5Fogb2WPRESWyXkkXYjQSDhOMy254vn5B7E6r4nkCet0yUyYsQ6XHJVvs4TO3flKmjxXWuk5jwTXOFOBjEPd68UiiscWeS/6fkpGPJb3Jpv6gNkDw81KeN1pJkkcO6JrbnuIj8swma0ep1jY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f6f097-4297-40a1-210b-08ddb945a592
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:51:33.8835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cun2JNXt6Iz6QCzbmBY3zOfo85o/wl95n9XjOUCSGiLvIhyEsZ4zTRzt3jgfU6szu7mlak6EJ52QYQS9NqqTaTAUHp07JYYv30kCOvxOOCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6327
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507020069
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=6864f31a b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=WU9MLg-8JL5_lQmH0cYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: Vwa7pSVp88Pq-GpuBPSShUsDLbXMIi4q
X-Proofpoint-ORIG-GUID: Vwa7pSVp88Pq-GpuBPSShUsDLbXMIi4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MSBTYWx0ZWRfX59Cckbg0nYEg hxJalGEBAB0sitbC0RUaHnhSOJyNVd1mtdQMEE2EzoislIVvRBSgkHweT1wZjqY1aMS8YZlEAZ6 AEW3D4TYkMlW+wI7OvkrPWMkyyJoep/eNteCyxQ65tqrV1yXT+1ns+Y+JzaLnaOft7vnOCc+jzR
 MM0mdZsYCDvLfQ4ues7X9D4aUCQKuOZiovtWZH1HpDmH/8BXLcLQNU72oWo1wIwUW37Q854z/Ro Roia5vdLoLe32SreBQ35WrpRTSqozHXtVS/fF7otI/JT4vhDIuDz5LWj7QRxm23GR1PmCq/wZIl EYQQFEEf9OaGs8MtjGvwPGEDcL7xggvhw6kQ9hNzoVt7B1IaZabK99NesqwBgDKb5xb0702FmZS
 QCFaLeECqkmcKGaLtC+zEQsWTVnr/LwevTq3tScdObgUTdOsGZS3lS9wAbRWxxRTIdA6nefZ

On Wed, Jul 02, 2025 at 10:48:20AM +0200, David Hildenbrand wrote:
> On 02.07.25 10:42, Oscar Salvador wrote:
> > On Fri, Jun 27, 2025 at 01:55:08PM +0200, David Hildenbrand wrote:
> > > Let's clean up a bit:
> > >
> > > (1) No need for start_ptep vs. ptep anymore, we can simply use ptep
> > >
> > > (2) Let's switch to "unsigned int" for everything
> > >
> > > (3) We can simplify the code by leaving the pte unchanged after the
> > >      pte_same() check.
> > >
> > > (4) Clarify that we should never exceed a single VMA; it indicates a
> > >      problem in the caller.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> >
> > Hi David :-),
> >
> > I have to confess that I fell in the same trap as Lorenzo wrt.
> > __pte_batch_clear_ignored changing the pte value.
> > So I'm not sure if it would be nice to place a little comment in
> > __pte_batch_clear_ignored claryfing that pte's value remains unchanged ?
>
> I mean, that's how all our pte modification functions work, really? :)
>
> Thanks!

I mean, it might be that me and Oscar are similarly 'challenged' in this
respect :P (high 5 Oscar!) but I think the issue here is that it's sort of
a compounded use, and in fact some functions do modify stuff, which is why
we end up with all the ptep ptent etc. fun.

Up to you re: comment, but I think maybe in cases where it's a reallly
compounded set of stuff it's potentially useful.

But obviously we still do do this all over the place elsewhere with no
comment...

>
> --
> Cheers,
>
> David / dhildenb
>
>

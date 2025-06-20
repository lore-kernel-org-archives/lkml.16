Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A830018024
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750396401; cv=fail; b=NbWywhuwkwemvv56bLcbgySxePPdivuIJLdHhVH5ghPYu/4bzgUv0iQA7TMtegBulArQeUiOX0z8JgZUTWO9QEdY60lXKqmgicDUIi7oxqU5FM2o3dHbWwVVwrsxYwQ3XWbGykqbjN5Ef3vi0LVtNtyEwOdqqeMBORoC2tVs9OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750396401; c=relaxed/simple;
	bh=Q08p2TeGyTPFNuZZhqW5OrVrCEDCrGmXqUkQF0t+cNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c0hI5xBOjV3J+IUfOXHwk1cjVqDodq8gUbYwefq16vjQ+Wh/uaomG6i3iJ8U8qzKQk+Jaoxb9Znj2IKi/86keCihakFtfjVDZVc6HcqxHVR7VJkZLV+MKteBzOGIljOEivR17DVso2qo1iDvvsY242LfWCPoWraxflLxhyZa6f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RthDBs80; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n1EgGxd+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RthDBs80";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n1EgGxd+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K2ufCC019357;
	Fri, 20 Jun 2025 05:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=UVBokgfwDmyMo5Ybm1
	DxYampTDTvBY4+UfwbJCksqfw=; b=RthDBs80pdZQLINiC9qRaEUdZLFLnWbIjJ
	uIlvcisc/qz4WI8xaw7OnrPzZRyySRiGfP9TwvSWxHto2mLNtvLnfrp+JTqV066m
	Iz/I1vxDiAz9V+TvOHeiP+ih6y3pZucSv3mlWn+vr2JxjkoMQcstmQQGJPzjiaYf
	8PSS6DB0m6ogWKq5zyI6NahhlnCrR1cpVj6OKACsPex3QIEQAHH4zb0lCicAX0XE
	zmAkGNprQKREmGPXGsbVi2dxWnjvYt4KxNpbx3mU+5gVdA1GkA5HVLadCHhjkKOV
	h5Cv0mGdLN/g2Cssxku4GNNvAsp6Jm8dn3pyXMh1lRDpZ0oAC7Ag==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvnabu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:13:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4hjvc038296;
	Fri, 20 Jun 2025 05:12:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhchh0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:12:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBtBpg4Bkl7YKF2I+puntwbrv4JukrIf5+sxYcwlmf+WJVxlLeMllwXy1UiIRkr8jhsjg3Ia7qDM+bVJTI1H4uLQli6NmlrmENZjLGbxrX3ApucqTNcQvNCxjjiZ4qY+HniXk71w1YRLBYlIbtlg+C7DoVvzeV/VTH9ItecS/32JKehShMXd9qzVgEh2SlmvnTu7wrNo04EwT0jAnPL0raL4PdugvaNWCTpBRPkIqiWke6C0X0JUtwgzVr4Uwkq3lifHOzwNehaxaIfTG3HNQtPYaHBV+0x1P+LhTcWoHD3f4YpHfut/JgcywidrQTFyAhMEY6isOwb1IhmGnXm2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVBokgfwDmyMo5Ybm1DxYampTDTvBY4+UfwbJCksqfw=;
 b=UKvmp6bTtDX+t7xJpaDAtgWgKOtRe6YFztABrITamvZHFoap0jAmvZlmzcCreEYxaP1sSTCkpQT5PCV+xME/drT8/IY4hW1m2YdWKaAcbQLZjVx8ps83WWeCS0FZpNE4LEqCCOll/Edf5+Kdqd0i6RUesSv7FL3tQRGgx2rCPJHPNbodeVJRuMdRROaZ8DOpr+rmBOlny6k7HOhFLJesXIlyDADKx/zSJl54UjGHonqZvAzEmTO9RPqES5UZYCMVm3lruZNnHXuiqN9BAHk+Uj/A1KnpB4xQNxG0WXlKAPCJ3KP5Ko1ee1asIqLmxxFXsyn/t3gMue/da20Z68cEiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVBokgfwDmyMo5Ybm1DxYampTDTvBY4+UfwbJCksqfw=;
 b=n1EgGxd+mGP+Ehh6ZdINS82KdNYO78/nOPj6CqVTg2ubY4D6qApg05R2bK5jCTNaDR5xyjYZHIztraJdp1tEFlWH/U7+fT56WhqjjK/xGxZh7GjVnUQKAJ9MCuzjRsL8MDSZCA0iDFZrHvI/JNGEOajEwZoAYSouSrvpaHwxl9w=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SJ0PR10MB4767.namprd10.prod.outlook.com (2603:10b6:a03:2d1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 05:12:51 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 05:12:45 +0000
Date: Fri, 20 Jun 2025 06:12:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 2/5] mm/madvise: thread mm_struct through madvise_behavior
Message-ID: <13481f8a-f3cc-425d-a4d0-7276a437b758@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <1be4352e1d414712e876cff4b5d982cc24dc7692.1750363557.git.lorenzo.stoakes@oracle.com>
 <B4B8173E-F592-4CEE-B35E-BFC6B2CDDFB8@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B4B8173E-F592-4CEE-B35E-BFC6B2CDDFB8@nvidia.com>
X-ClientProxiedBy: LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SJ0PR10MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d317c5-cc7a-4371-2490-08ddafb91703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q7UZTl7AeVKhmmUG7wUCS8X2CCp2RfKLDYPuTCcMCLaMKNM8tWSvMazAHkI/?=
 =?us-ascii?Q?jQBbWEpPSrJ8BN9yff3uX2miL95QaCzqKFzWM6Wcqg1TlDVvF0n9LaSEhVct?=
 =?us-ascii?Q?YxHnb46nwmQdUN/Biu06nw+sEZW4zh25UoWhfdUGa4EVITQk7RCKFbIfKIcb?=
 =?us-ascii?Q?vO+199qg9eRbrnb1wz0o0gK0Z1cNeNuDMHqWP9xEbJMlmefJZasb6O0/dZNm?=
 =?us-ascii?Q?9jOUgO0ellIuy2vZIiSf2xpJbERze39Z92R8QrUHtsaStPzlLkBIr1C4QF/t?=
 =?us-ascii?Q?cyEsHtqdCTpWn8Cfc1//nkOBz8e37lhEFtb+QGK0wit6Z3qN29JYtxmGcNWx?=
 =?us-ascii?Q?4XFtLbWIzTvoTgepCT8xSVIYLHLKKPKEeRIfS/bVoBY4DovDTwFBAq4833/+?=
 =?us-ascii?Q?8m4lY6xqTtDPOhI/v+8h13T77o2uiUHPopbX3KvgSMtsA4YThmXHuG87DwAm?=
 =?us-ascii?Q?Zq5XiIRh0y2KBXhF+uvZoaVxKQGmjbUOXIZGQaefRCS0CKrZlsV0ANXTPuU+?=
 =?us-ascii?Q?VD82qVKUb8f5gdM3hZtititVHdzQ6X0+mxCppwkpHR3z9+yvKgmTX3feLcnC?=
 =?us-ascii?Q?8U3+L3yF9QPN9IGS65y222wybjFM+pRdZ0q+SEIUn/O+s49cVe/UhZoiehhk?=
 =?us-ascii?Q?fZJkdI7K6rhzPZ0DcoNA04JHq9yEhwcutK30OfjxTR+IiDoWR0minmQNbJS4?=
 =?us-ascii?Q?3tK/z/xiL8vMqnPdvb9q8vvfy3YMkFvirZBQEAkfaWnMsNo+zkhzonTu1pnV?=
 =?us-ascii?Q?DSeNOBBWvU78z5fZkyXTzV6tNt048Sgpn2xapNof5RTgx/38yCnnU4fp5X6o?=
 =?us-ascii?Q?B8zhrC8kmFv8JurgAHXFSc0rvj/F1/8GVvEZcIoxoDJcKAJrQCTSF6rkmsxD?=
 =?us-ascii?Q?WQWwiC5rsfCbwYi6J7lFnhSp7nPfo9qthjcWBmn12uZCld/Q4hNWDHPNE49x?=
 =?us-ascii?Q?IgX51VrVAdP6rSi4X7KN9osuAIk/PP66yS4UkMcHDc3BV/9W9L/yyos0MOPI?=
 =?us-ascii?Q?ofkDZ/1jNGwX7O8PptJaQTJ5wUhYfZSFY/tWqNBizn5Ssvc4/qZAR8G8VmAQ?=
 =?us-ascii?Q?XQLrAixMkGlIz62FZkPYrCcn4A2aB6prHYFNKfoKmYp7Ek+Kqt6VNAAHiiGl?=
 =?us-ascii?Q?5VgFdWXQZkYsXzv2OPM3GuqUXiINH7E/5iDl0wwQ4yAyHevAyS2ZY+pz89cC?=
 =?us-ascii?Q?7yHYEsyVAnC8C/O9X9w4gr7ITbQbkHXeqlAN25GQU7wzNLhXIPEJlKAF6rtJ?=
 =?us-ascii?Q?WlQ6wnTFRG7INbUptNHeBMusKyCR5foeMuHs3C7gfA2LK3BX01xDkePqInQq?=
 =?us-ascii?Q?uJw94mRZI/BcUIwm8m4Cqk0hXBLXwml4I+Fs4Vgl+D5VNCOgXCHw5kQ6gS1m?=
 =?us-ascii?Q?MYbypCE9JmZNPdYhohznoTPEqox1lirVdANEv+cJlkMLkCLSEfZr6MlzO91u?=
 =?us-ascii?Q?Cxob5Dq6Qe8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ptkIZds3wpFH2lxxZeUas845PahFqdedWMXChDmoiUY02xyqyG2e8twD5m7e?=
 =?us-ascii?Q?b5nRLWMijpMiqRuS2+QGLXIKV/sKZK5DBvqdQzxePnnIKj2XG0kyPBOu6xgW?=
 =?us-ascii?Q?zPR01T2bBwrE1R6FIGbLyvDOO90l5OgxGfe9gmog0ntR/hLPu6K30orvwwJ2?=
 =?us-ascii?Q?+hC+cDZcodJy4Nw1QXNMcF5EFHFjTEk9s7j/NIpXJPBgD6zz2OlaD7gm0tDW?=
 =?us-ascii?Q?IONrcj3pTHn2SmvdWd73/PZoPWWeo1tcnh3kq84Ev2CqP4hHWxJoNLpQBj3W?=
 =?us-ascii?Q?3ts0NlQ5CQkoAICp0k0R2r2piMoGALao44V0mcgrMrwLZ/bG6m00JTk9wSTS?=
 =?us-ascii?Q?FQD1Efp1msy0qrgEQe8dA790PLRsDU70AJNbtAX0guaucF9QOScHvGbjxGR8?=
 =?us-ascii?Q?lvFn5T+UASEdAajLjK10QLelgRRZgmgKjL/YP73YuhD7QCgW355DfAt6xC7Q?=
 =?us-ascii?Q?u/eO5Wqp19sqpHDyqmtD4SlE6Wok0nRM/HkvuHvwbfU8m+NNfWL+z8z2sHxJ?=
 =?us-ascii?Q?fQesDazuc/ONHRX/7ZFdKWC3F7Hk/W91CVkh4YAzuCiu3tJ16ugRxYnYz8mR?=
 =?us-ascii?Q?nkzdRg6KjsAStY76VvUZARm1rxiIaAo6Hkx5oxjt/sV0k5zu08xZd0IQ17NG?=
 =?us-ascii?Q?3mRmnH8QRFYgq8kYaxKfrpwMswKG6G5fU5F+hYrHdw33ZOwiY3zfVIoxtTDS?=
 =?us-ascii?Q?TbHT/iannVB3hIY0crPKqG2pLKk5kC+7anfmdqkVB9OJC/CBY+E+uS9VP5Dy?=
 =?us-ascii?Q?4Gykq0KdJbyzNmN/knkyqqzjDldTMwoNKdic9v+2NCAQIj7CAlsOUPU1kBFN?=
 =?us-ascii?Q?bvJPwjI8cu+tgOyBdkb/1kUITuQ1kvePhh4mxgvWLzIfEOUTsZ91t/9s/P/U?=
 =?us-ascii?Q?c3ndgYtX+M5owdQmTnNkC2qYcjGT7xrCWMiVKRx0wjjJU06mtFrdLbYWMswZ?=
 =?us-ascii?Q?ie+JMYXj0k+9m2XnAXEbcF4bTq4oMlaZiUQ9YqTv65N6y03vj2AQ7mJ3V5YF?=
 =?us-ascii?Q?eH+AgFVGxIuFJvdEU5cxCpMrTnMTi5rS/yKvh2Z+gp8iL+wSyi9P3/NoR0Hk?=
 =?us-ascii?Q?LLOwHiMMCgqLmx9US9yb06Zqwfv9IUIgVlwpXNrm/hJnW2o6D+JtHTImp0RR?=
 =?us-ascii?Q?jabX+8nDd1B9pAdc4l//7H93GI7rYWaKIOoXrRqt66dm2uY2K1SzStPM+Xku?=
 =?us-ascii?Q?wo88GkKVC/a6PhDssOHRl/pPJmRsh4PsHuhAQwuGrztHmCPThgjSHi23BznB?=
 =?us-ascii?Q?FDsU9qwIALn26kcc3xmLHfb/tsRmCExfPXlXEHjw1bjTRnPUiiCTG8p+UZZS?=
 =?us-ascii?Q?hfjijW4nfoEfIp6dcERhHG5pQvvtr3o+09jgYcAiktjEP9CXeu4z1ictUdu3?=
 =?us-ascii?Q?/ye69RE9703A5C6W0cpb79ySMQyw7okfAkhyWM7/WcvBvRnf09TNhjwBBAZa?=
 =?us-ascii?Q?9Njxc/iUeVmHbohE0wBMxuYwtUiFs6Hy7XemTram2kI1IBhiIh4P8t49SQpY?=
 =?us-ascii?Q?HUOk+pmNMaiWBYKmSv0NpOE6Tcgd8rMRVyI09jmLtDBlhMZd161Osulocyh6?=
 =?us-ascii?Q?85R730ofVGaQtTAYrDrnXRJp3uJSOOSIbgvEUo6jkVfR1VQxx9ekUxu618VZ?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AY/Sl9V6ux2mymom72q7E8L95jO1WAdC1a+RCdgJAjMBAnXdgKSXXwQ6h8xA1EmLTKVJnmrfwfd68iAGYWZqw1xjSi1kKiXfVE1M+eWe1DizdIJBMKAG8PStw6TMLD95DCdC0NaHZWv4MQ1tG+LgJqkLBYrUwCxCUEnYcn1lzmFvWYjo8ZYFNU5DqgaxPmtAD3Zy55z75euHrSlRasz5w4w0khlJsuKuJYuU387icL+bdWSL/gGzb+evHiAIHN6ZptMTYBBgS/IjgSlJN3GDsyyojH4HraSkSY/ux1m0V8Cn+BFXQsg7+to1BtmgAaCmYWDLDmTywov8Zqv0rE3/Ju9Jh2A+H3KIEP07CiW/YZR5ldikCo2h1/bf602sMVYgxoh71vzM6yP6emVNFBqa1Xy73UcsuM/BPYiy0DGVDmQQtoa59cbiv9NwmNa0Jo2svT4ZNoZCr3pYkssol0/f2eU7tUiS1YtmdWENzp9fQtueRtPSkH1rkeiOdx5Epp013xMLz6xSMW06YRhCBK1fAMdylYfXYlQg5gI1oSu0nLO0Cbt6tYioYEKuSH8Wzsd+hNXyT0CquWjvGPd3meJgn34EVqOfrHXiMcQJoz2JP68=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d317c5-cc7a-4371-2490-08ddafb91703
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 05:12:45.2716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqGaXJlAL0nbVoqMjopORvsOf22XRzac0CD9TU8tAj/b/HkAJgM03NWaQg0ceqNDjMNYJ3BT2NEy58BCxIwJfiBvehEMV8kgnVrLriyS3Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4767
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200037
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=6854eddc b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7wy6QvLcof6fFiwGmVQA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: r3bwLWjj3TTW8ER3OD596z9LKYzVoA-m
X-Proofpoint-GUID: r3bwLWjj3TTW8ER3OD596z9LKYzVoA-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAzOCBTYWx0ZWRfX3weSkTtYCALu mB0zZwnfjlGPuJreKZQRLtUaNyk8k/xN4ODN8ESXBfbMfNyrh8OXnFk6oUZHfQKZWIJKLv8WZxG ZimW3Ca9KNMdWd6GY0l2fEKy8PK7WbPLxiu/AwKZUL0HxNu5r2H1cO2vivDpgBCOhLbVX5gQoaq
 dfkVkOqxKnO8eeM4lCJCQZ9yF5bGE7s/Bce1RqlTcyENdKDlebWEM6T1LMtwy35sw0RsyBDkbOR iat+YWpQ51+Sf2XSUz2yHFnvQ+w4BV9qwWtar3cVtYsAqrxPABumo9jWZ2L0EgPR9Dtyw2p4mTW qrO7IIXDotmFszXVU6CSvqnGjo4zZgaj9I2baIKRRycBFlfRFvURFW/mthgqnVFN9oqnmDbW7wc
 vvnKRl52MLcP/JjW7jjPXxxEDeGWyxoeXvQPoozVB9Ot/vp+6CL4BAbgVcIDPSo02+lRtcqi

On Thu, Jun 19, 2025 at 09:40:34PM -0400, Zi Yan wrote:
> On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:
>
> > There's no need to thread a pointer to the mm_struct nor have different
> > functions signatures for each behaviour, instead store state in the struct
> > madvise_behavior object consistently and use it for all madvise() actions.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  mm/madvise.c | 105 ++++++++++++++++++++++++++-------------------------
> >  1 file changed, 54 insertions(+), 51 deletions(-)
> >
>
> <snip>
>
> > @@ -1422,15 +1425,14 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
> >  /*
> >   * Error injection support for memory error handling.
> >   */
> > -static int madvise_inject_error(int behavior,
> > -		unsigned long start, unsigned long end)
> > +static int madvise_inject_error(unsigned long start, unsigned long end,
> > +		struct madvise_behavior *madv_behavior)
> >  {
> >  	unsigned long size;
> >
> >  	if (!capable(CAP_SYS_ADMIN))
> >  		return -EPERM;
> >
> > -
> >  	for (; start < end; start += size) {
> >  		unsigned long pfn;
> >  		struct page *page;
> > @@ -1448,7 +1450,7 @@ static int madvise_inject_error(int behavior,
> >  		 */
> >  		size = page_size(compound_head(page));
> >
> > -		if (behavior == MADV_SOFT_OFFLINE) {
> > +		if (madv_behavior->behavior == MADV_SOFT_OFFLINE) {
> >  			pr_info("Soft offlining pfn %#lx at process virtual address %#lx\n",
> >  				 pfn, start);
> >  			ret = soft_offline_page(pfn, MF_COUNT_INCREASED);
> > @@ -1467,9 +1469,9 @@ static int madvise_inject_error(int behavior,
> >  	return 0;
> >  }
> >
>
> Is this necessary? madvise_inject_error() only cares about behavior.

As you notice in a subsequent patch, we go further. It's also useful
signature-wise for all functions to have the exact same signature for
consistency, something sorely lacking in madvise.c for some time.

This is covered under the 'nor have different functions signatures for each
behaviour' bit in the commit message :)

>
> > -static bool is_memory_failure(int behavior)
> > +static bool is_memory_failure(struct madvise_behavior *madv_behavior)
> >  {
> > -	switch (behavior) {
> > +	switch (madv_behavior->behavior) {
> >  	case MADV_HWPOISON:
> >  	case MADV_SOFT_OFFLINE:
> >  		return true;
> > @@ -1480,13 +1482,13 @@ static bool is_memory_failure(int behavior)
> >
> >  #else
> >
> > -static int madvise_inject_error(int behavior,
> > -		unsigned long start, unsigned long end)
> > +static int madvise_inject_error(unsigned long start, unsigned long end,
> > +		struct madvise_behavior *madv_behavior)
> >  {
> >  	return 0;
> >  }
> >
> > -static bool is_memory_failure(int behavior)
> > +static bool is_memory_failure(struct madvise_behavior *madv_behavior)
> >  {
> >  	return false;
> >  }
>
> Same here. Your is_anon_vma_name() still takes int behavior, why
> would is_memory_failure() take struct madvise_behavior?

See above.

>
> <snip>
>
> > -static bool is_madvise_populate(int behavior)
> > +static bool is_madvise_populate(struct madvise_behavior *madv_behavior)
> >  {
> > -	switch (behavior) {
> > +	switch (madv_behavior->behavior) {
> >  	case MADV_POPULATE_READ:
> >  	case MADV_POPULATE_WRITE:
> >  		return true;
>
> Ditto.

Doing it this way makes life easier (esp later) and is more consistent with
other invocations.

>
> The rest looks good to me.

Thanks!

>
> --
> Best Regards,
> Yan, Zi

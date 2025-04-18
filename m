Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD0E155C82
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744973461; cv=fail; b=GPSJr6B/tfzMppEpIChvvcngfbNOFCCxtDD0cfds+tezJnBc/4w1IyC6B4WTgCFZiJIv0Q/2UMSV0eclNHXMi7zjpKSAPM8QedhqvukpWo7xjdw76HiVMzTGtDqRUJJTIosCl2YgSCYCAxfd+426Ik36AVVOdGy7SeA5NcXnbAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744973461; c=relaxed/simple;
	bh=WehFbMFlD6wC595yOjD36P/caoRuX5FNAj2aXLr64NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VNkhHIjRwQvd4gu/j1tt0yic/Df8mue5uZPEXl5On2/CsMzrANi2knsvGFYrJ50+d6YB9yGAUHbwTONd2XwYSRcLApfrXZnyFNgGatpts7uPCKAoZLBXFaaz0Fmn0QfsNsOQsH+fpa1sX751liXJF55s8FyS8mHHAUDfx2Q+rJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ENi57+83; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z/U4b4FB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ENi57+83";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z/U4b4FB"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IAGgSM021794;
	Fri, 18 Apr 2025 10:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=aWWXo7+z30U+1pt4aU
	F3E0IUYfTpqcehLPJa+EvAHdM=; b=ENi57+83lWkQFeptwAeoRfoO+7YRiz6aYx
	f6EqOgzUfFD+UmSD+edu7LmoyLMh9Ho45Vb1k+MYcuvJaTUCdffrbWyvdQoRVOJo
	B4qKyTkIFfLmuI57wdyPv+MdPur7axL1HHoSOuQDIHzSEdi1hgK7iZIr/r7MInnh
	GQunVyfvh0r5QVCsrURbFGddcR4xUBxXgHrJSQJY0W3kgVf7+xpzGxofEQrfCWKV
	oqgQTHstLZR+bqfwXDWZrao6jPXROFRakoGjx59Prp1fGDMdmF5u4EI7Kdcgoeh9
	dZP8O0MJMDt+5zz7jcBOalvOk7HH029WVZI3pLYPF+1PTN4juGFA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617jug5a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 10:50:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53IAa431008534;
	Fri, 18 Apr 2025 10:50:17 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011027.outbound.protection.outlook.com [40.93.13.27])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2ugx00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 10:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueIn8wCLXbIjGojqSg2YpLmWE8QFxSG/yZeDMYc/R4OcYS5DbJ//78+SvbbnT5aClPrvLx2H0onFPcE5QuaZSx8Yj1LFdd2Z67c7hcQ7m0iPMaGNNBG3AvikOy+v6iH42hYbUVTxnbei2L1/n6tnpeg707wJ7qD87iLPhZ2RA2WeUq6DYdaEg4ucwSUxLt9kSzbr0HUeewRYG1qgc+C8lUeX2KDV+ycYFTRWfL7ZGV/IyCfhG3Stc1+WmYiGmmuX7wBgMT4x04fFNQhN7E8AuYgX2X2GTG3CGzswnP70RmV+j1thu3h6AspPxmLSzgfzpX1Wm/Pd2YyCpAdbwYWeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWWXo7+z30U+1pt4aUF3E0IUYfTpqcehLPJa+EvAHdM=;
 b=p1KLt21fGVDHqO9vefH8BXPo1n5+mie1n2CgaiiHPcqEtD+GnOSjULQdWhK9c7XNfsK8Bt56oaW2RjBbCpLnV+rHLfcuvZFrIg2LC/CHijTvRK50DYeCJ6oiyDRdbxmFcp6sBF3T4/xq92g9PILyNjYTFoWu0LteJ/NU61JTzKeGTcsTlfkXWFG4hMtC4VWhqBKKu7QiydsCg6WCJKtPTXjrzHnz37/IPIY72WM8fzdn8EaMmefNu4OKc9LgcvRXx2O0DxDI4kc64vUBdbygDNIFhpZrZyIaPHaNtpOTvuenv7pGsq1P1R7aqt91wnoEB0pXTdoyfGxZXM8V2troDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWWXo7+z30U+1pt4aUF3E0IUYfTpqcehLPJa+EvAHdM=;
 b=z/U4b4FB7SkBqezXyop88GvCUZrnjOHgaatd4HIxRl+KKLjWeOMTUL3/v9Q8iPy+Jy893NmihN62JouypaE4mm/XmejnMRpnJwXxW95y0JxbXag2O7dP1GFF2zFy1fk/qoWZ0SZuz9X2z7Z4XxBBZ8erN8ZsANaRG5fZuufw6Dc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4347.namprd10.prod.outlook.com (2603:10b6:5:211::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Fri, 18 Apr
 2025 10:50:15 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 10:50:15 +0000
Date: Fri, 18 Apr 2025 11:50:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org,
        nao.horiguchi@gmail.com, linmiaohe@huawei.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Liam.Howlett@oracle.com, harry.yoo@oracle.com, riel@surriel.com,
        vbabka@suse.cz, liuye@kylinos.cn
Subject: Re: [PATCH v2 1/2] mm/rmap: rename page__anon_vma to page_anon_vma
 for consistency
Message-ID: <752651d1-7cca-45b8-b5ac-9c32ab97e9fd@lucifer.local>
References: <20250418095600.721989-1-ye.liu@linux.dev>
 <20250418095600.721989-2-ye.liu@linux.dev>
 <9490ed5c-f6e0-40f3-839b-7b3a5decb5f4@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9490ed5c-f6e0-40f3-839b-7b3a5decb5f4@redhat.com>
X-ClientProxiedBy: LO4P123CA0519.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4347:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2cf943-b0c1-44dd-99e4-08dd7e66cd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ud0aIh1pS87hRbbs4F8HBVSAywV+AF7n5OUJah4w6+AHlIYcLm3OTXjxabxE?=
 =?us-ascii?Q?2pX01npGvXOcZcYSvC4ruHfoAGK4AWdqtIoVyqiZc3imUfh/IW8M/VE1eYOD?=
 =?us-ascii?Q?VhN0GqajEfz8EJd/wVwJINgUOE6E1RpsaHKDContRTg3Rj8NoCirCPzRGK4x?=
 =?us-ascii?Q?oUAFRN9yXLwHl3tsHw/cuerwIrZHxKPTQUOtjqe7o/Wqg60yy2fy0STi5Fp5?=
 =?us-ascii?Q?m2Xnfqja/iHnDARjLOgxNKSQrOynvnLs4xGF5hzzXVx3ViM6qm4oyywfpyeA?=
 =?us-ascii?Q?qmTBbatw5LzMFVGfpue8K8DvaNX5x70Ks4qyqRWAgQRpAdhEEG4TIuRD1s9C?=
 =?us-ascii?Q?NhAzQJqBBE3nr8YjvxowEBQdPIt1SMCCUGSewhef6YOIogm3JSBQgTB+YNde?=
 =?us-ascii?Q?BmAzgy/r3qF+5yfHJYdV7wR2F1H0aHAGZ9DHGdslaQVEfb3yvCFzNrSYpldc?=
 =?us-ascii?Q?w8PG2wvmb/YFiBu1pJ6u6RcloweVLanVeAIPfU+TzuDmCZyA6u0miiCFYq79?=
 =?us-ascii?Q?3vnHOkBTSAuuGCfCNKTqHbFXQKIm4XoreD9uYwueGDdKJpzmJXEqWinWTqzE?=
 =?us-ascii?Q?QXOXSkMfEiEHQoDGPzhVS5JDsf3281cejSL4RFGFu9RPsP97e73XoBq3vklq?=
 =?us-ascii?Q?cQI5PIb4RO/mRFmAZ9LQZqtLsguNm+tMF8s5DzFOE5k7jta6qTEeobFC2P0v?=
 =?us-ascii?Q?+gJBBSyoF7sZ0r+LTd+s0OFrrlvpmx5+wPpZ4HoSw154yPS6gzbD6XIUsjMF?=
 =?us-ascii?Q?NymYP1vfezZDDsedxQ/K9504xfFGSNyELraMyAkc5nAUN1oVmL9+ocEgaAgh?=
 =?us-ascii?Q?Fv4Of9TkNb5P2I/fj5RmfhjVL93ywbP3ARs3CFJjAufATq3FrnLbeXqu30Lf?=
 =?us-ascii?Q?sbrt17us3k7eNj6pFnhIRT26hnFdX1hNSY6bws435dV22uoc679eETO28GZ4?=
 =?us-ascii?Q?8t9az62wb32xUWqy7+4wuMhUIRMFEML/m+Xof/+38LDBg3YpUTA7y6aF0lPF?=
 =?us-ascii?Q?jAw2iihKaEkdbtECtBEmEEH13NJWay6KGRxOvzLVe3Ro7xPR14X/b4lbi1l+?=
 =?us-ascii?Q?3Tn/7Ew3a6IPVQq+5Si9cHDaSTHOYIffRFe7u16nc/uIRHc115anQYUnL952?=
 =?us-ascii?Q?LMU5iV65HB5cIDYQ6khc6xqJ9pLdWKnh//0IkP3evjx9neBLTtagJKWMcJbE?=
 =?us-ascii?Q?CFQVGOldi/7VdRUP6FfexCW8X1EcfBqYaI83HAyIqoShdCxZK7RPE6Op5hM6?=
 =?us-ascii?Q?wVcMMT2Q9uSlsUNxp/1fvDxVggZbCcmaDiaArzRtAvX8TvA9ZtF6ow4VBLU3?=
 =?us-ascii?Q?UBeuxYgvdIiw535dcxREiBVY0K25kBVNzZ+Wy6l/fPm5ng/qzITKE5duljZq?=
 =?us-ascii?Q?0YIYPHdPNvdknB/iv8bevsV2WD2RHlqCZ9dtq2SeoVbxDUrRRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w4jDqQJpR9HRIe8NmxIhRTDYO/m7jc+nvEzgt4yTUNjtN7mkjG/TxwUgcYOe?=
 =?us-ascii?Q?UPljpuBw+wyP0z2a+7MNg1bXkh7LZqjaGMv+bjGfsk3KTMpK0GP23j8TICA8?=
 =?us-ascii?Q?Tm8u3/LmioCMhQHXtCWAjpMfUq+Z2cYsgF2WY37fQtk0GM5t2/iOgfCGlifc?=
 =?us-ascii?Q?kJBwIsX0EnUdOI5ttbJTv4BPPswv045/hTk+ef6c1Rd5u4giGIof2lY4PSxU?=
 =?us-ascii?Q?J1xNXh6VAroCkuffSP3kI7DX4BWiQ36SsXTnB12A1r+UPQcdZ4aKwAH0E51d?=
 =?us-ascii?Q?lWZ2+yU11wWlZCVSTdOx4BznfhGBvjIcBpFApgMH5PXLbjdiDV5a9p+pQylm?=
 =?us-ascii?Q?c/Iw2GWZYfEfVS8KnpQ+ytTT3IwG5K7tO9yFMIXevDGl4U7LL7ODu5V2575M?=
 =?us-ascii?Q?XXYfBG8e0E2mA5uaTnlB51TFO8eJa8bxLIz+GCne1DOils3gjYR1C/S95NLa?=
 =?us-ascii?Q?AaaS+hHwcRD8hsAznlPk8dNsBzUpncPdB7+XSwzY2f/oS9X/eI6sC40C3C4K?=
 =?us-ascii?Q?J1CtmyfuDIReR2248qru/yZB6UePp5p8NHSgS3z7vNG3h+4fqOSUHPFmqOO9?=
 =?us-ascii?Q?FLIYrqd3KVneHUS+fp4+nCu0U1ofnZFTsxANH3vMgkW5LLlANXliPkO7rqI6?=
 =?us-ascii?Q?xHJe8Sn0abz8AASoOK0xZ9GLHcFA97PB0fNyou4AF8OciYCknSxA08HSe2AK?=
 =?us-ascii?Q?f0rlOj1jXAxHyqxB15oCpOOe0kEXmrOOjtWpKxfuzoHDg67iFCbGQy1P4GN8?=
 =?us-ascii?Q?6R1G6D4tKirPFv2gH9tK/V0sP7T0YPJn5Y+178rq1wqUBGslOhcug+zcoBXn?=
 =?us-ascii?Q?tNMUIrdxOEg2mJ/aQ/JQKxSn14D6LdySbASu6zqwkzhZeGPNf3qQ2azO8z0j?=
 =?us-ascii?Q?d1/2O7E+NjDaA0LNhFkoQiOLghLvK+zz3J31LwWfCXCMGKD5tJg72lAMaF+8?=
 =?us-ascii?Q?cHxElttJSFLt+OxaLBaZpOCWMf0iI1gKrfWoDZaMs9yXnG26NaTz9V0G4p1J?=
 =?us-ascii?Q?d7BY0ys3mysP7sdXtJRFRF/4GXicuMHQAi7152WTOzsqdkz8s37eIc3lujkQ?=
 =?us-ascii?Q?qph7sGOg9bUY34GJgayXtcyGHA4YSW9MPnB15TpVGIcLy5tAgEMw6JBS+x98?=
 =?us-ascii?Q?5oWiv4PGLke1zVpg4mudm+X3+UP7X6ZddpzILcRue8GVIuSSvSjt5cdaaxqX?=
 =?us-ascii?Q?cKexXml4yGpWCYDdiyHDirKFO42RpHNYhnpMqJQIhu6LLwo7q+UqUr41z2kH?=
 =?us-ascii?Q?oAh+IYk704F7dOs5iK0zDP8CQUX6dqrCWAJntXcvcInODlauDaljXzCnWUqT?=
 =?us-ascii?Q?SR2hk4WPm33FQqIo85m6pt0ykC0OmeCDkcEBghEor0k10RDL62VRebRza0kh?=
 =?us-ascii?Q?2M6FRLesUUyR4YzEd4GhRFNsni+evCI0EwmWVFbwuI5AIG8HmeCgXtScH09E?=
 =?us-ascii?Q?VeJFcRH5pflI76TqEXbpSAgf9//zUc7uj3uWQWPTJQgi/5YrqrphY5e/oFB+?=
 =?us-ascii?Q?OCXgRKAje93/u9lixczxSr5IHHEOpJnpSGiDunUmoBTELhIu3SZj5aJ0octl?=
 =?us-ascii?Q?Ty8vd7kc5nKXjLKzS79qaWho3YT7IB3o8O7C2KRaGFoQtcGM2MyCQZB8SZZ/?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ebUaM6ARgO94/g1IM/RW4GAB1jIecderiGvtCow+9eK8hWzoJiKOD9Oc72lxfDPXqhCMnD6urA9ztOp5zpndSoTmkk74CqG6yeUzhnDIgAPCpTzwusy0riYOow8gvGK5fg+yCJSCCj+jHTKrW3ulqtmvywXPZI4koGtuvNTFWFTHwJ8aAXOah2Hz5hLyroJEpgOQp1zLwz/bu5fJIG4GJD9bhEczEytiPSwsRmZdUqXksprOZP2z5e0p0W7YdKZZNnvvwhKyoj67d2wud6CewL/dSAOlL+xsyA5mDL0Q26Vvhptn8QCWeYqHiIkA0hnFFsM1kmbSsGsVylb9vXvqpbEat1qaS54MbZcTBZij2tYbA9RSexaRhdKv44YLNJyDAxgsGVH+prLnY6Eg9Z81j4Mb+tf1e7czqMlM9wukF6ELt5QhUJ8KfhoRh76SkdNbt27nz78aSweWb2FIG3LnxB0X3Bq4UevS4r0sHEAbMs1yX+aPXtpgAzD8qTI00oV7DUwteJgDhND06C84m8PidxrRiRDGSp0zrKKE/GPkkWDM5jzXs8LNoaCOmaw8c8fKRgZ02yCExrOEMK2ntPLJFI9RBKfQBK82pzBCoRjpFnk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2cf943-b0c1-44dd-99e4-08dd7e66cd5f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 10:50:15.4826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZGL1y8qs6jcDf1PSMDIVJBpDuu0Min3KoPZ7F0k7pRjaIaF7Oqz/8RjFeDRy/Pd1z6BA4VkI0pWBUqKXdMAlWcTTtxVjfWcO9p7rCYzbb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4347
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504180080
X-Proofpoint-GUID: ckb8Yu74bXV-QBAgJ-JIOFhU-jkuRF4O
X-Proofpoint-ORIG-GUID: ckb8Yu74bXV-QBAgJ-JIOFhU-jkuRF4O

On Fri, Apr 18, 2025 at 12:40:10PM +0200, David Hildenbrand wrote:
> On 18.04.25 11:55, Ye Liu wrote:
> > From: Ye Liu <liuye@kylinos.cn>
> >
> > Renamed local variable page__anon_vma in page_address_in_vma() to
> > page_anon_vma. The previous naming convention of using double underscores
> > (__) is unnecessary and inconsistent with typical kernel style, which uses
> > single underscores to denote local variables. Also updated comments to
> > reflect the new variable name.
> >
> > Functionality unchanged.
> >
> > Signed-off-by: Ye Liu <liuye@kylinos.cn>
> > ---
> >   mm/rmap.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 67bb273dfb80..b509c226e50d 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
> >   		const struct page *page, const struct vm_area_struct *vma)
> >   {
> >   	if (folio_test_anon(folio)) {
> > -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
> > +		struct anon_vma *page_anon_vma = folio_anon_vma(folio);
>
> I'm extremely confused why this should not simply be called "anon_vma". Why
> do we need the "page" in here *at all* ?

Presumably to differentiate from the VMA's anon_vma, but it seems redundant
and silly to preface it as the page's (really, folio's) anon_vma.

The original patch is strictly an improvement so I'm fine with that, but we
could also rename this to anon_vma to make the function a little simpler to
read.

I guess the key bit where this becomes vaguely relevant is:

		    vma->anon_vma->root != page_anon_vma->root

This whole thing seems to be to deal with races with unuse_vma() as per the
comment.

Anyway, TL;DR: fine with that rename if we want it!

>
> --
> Cheers,
>
> David / dhildenb
>

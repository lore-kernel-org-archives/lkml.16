Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B3619047A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824979; cv=fail; b=GWwYnUvGonVogKxT+v6KnsTaAA2gKOEro2jGy1T9Na3DK128BEpoXJ2eBHivGw3QcCUZfoU9kwzbKh1IGNUoGnMc6TIUbEtuzaj+UXb+ujaRlyqi7sCcDzN7tlACkd4ec4PtoRnCGqy6iqrjkSb+sYElO9nQyvDAEdr7TGMlZP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824979; c=relaxed/simple;
	bh=pBDbsvPUlMlfUHBsezekWvrngtfgiJ1jyf9J9kVizpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R40JKD7A/wjzX9VEPkc0gChW3Mhge5ts/wHMpEVfnGa6Yb3cp5vtxxIqIBOoIi8Km6Huu1LKtinXOrSvroUa5zCU3EJlnrvRqunOXyHrDFgUv873vvPOcDBU4p9DaUzP0qH7sEg/k46QvChWMai+HjaLX6RTYWmgFG1OzU10LeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a+xunzi8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vI/OGDox; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a+xunzi8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vI/OGDox"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtekm020286;
	Fri, 13 Jun 2025 14:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=LFOPBmh1XhKiILCFbo
	5Xrdf0yX9HqgAJooVL0yJ4u0c=; b=a+xunzi8ozI7UITAm+OhkkpA5CXEv164BI
	3gMZJsMKkCy/ykuK9YXa6TxRSl5zYcaTJXa99E1FIRDa8sh0tC88ERXXSB/0NLay
	rw+mw8AQDLCyYNjrvXRqtwiVZALUWKFHUCv+eiKI7cj4/5pZlgXOuH7e1H1+cpu7
	49SUFIkcZ2Io1QgVFk6OKEhK0G0zIR+M9+2/Jb4VxDcrUFtnjcyv6658NNouHTQW
	V9Pfm7GfmRBtnFl9I+z2TbZDq5UFjpR3Nv5BK1qv5BAGb2HUzab1bfo+XWr9FfEJ
	rPkv+dBIVZVVY6BuWRzkCVijmgmMc07bfUmqD6DOlDLn34V0Rfaw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474bufbkya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 14:29:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DDONaY037779;
	Fri, 13 Jun 2025 14:29:16 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvk71ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 14:29:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwHF3w4Q4Vj1tDVu90VI3032vOiTfLtq1nPdqo++N+ahfJcmU71l8c1bzlr+GTWTQBH3ewT9KCP30Bdxv6fuM5Mi9C8RGHLQutNvX/9OZoPOGs/KLxiRnEJxi5aoHT8ZmDTnlYxWCDl6PioiZUmAVT9AwpzRokuZfoTBXyToFYnjhKh9P8EbwnSh/IoavlDC29oGA+dYIFG1oZQfEhStoUofsPbFKNCgnQ936UTmwA2ZQSH8JZLEL+AjmEQDW6+5dRuGBdJ1Y/Yx12aK2mAzhDA2WyciMFAwW5EesT8jO8CsO9n9QwdOKdlbCqI4wIJqB/3xa+cr3hLPwlnXI256lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFOPBmh1XhKiILCFbo5Xrdf0yX9HqgAJooVL0yJ4u0c=;
 b=jfMMcp9AM6TvXSfuAiPvwgselKibPiS+7IReWMAmSp5CpOL9BsHuQxPP1glY1++TqfsEOQo1FeA9sC3/7zj+50p5oFOJTmgbP/8+PZCrFRFyPM6oOPuesbeih6T/bsibGzy/R4VlAQTbIoXQIhZYK86OM4n29EcKon/Q7uK8/ZSUdqm5VlxtAt6r+sBQJKJD3M6YsvfgvNX6RvLaeBvaeIJv0U0szQP2lE/SfBkHXF936bgt++0AObf/DQALLd/kkBaWTlEU5GGjT1YRvkWsAGaLf5+a0Vh6or/gJtKRQEPJdnM7DiDeEh3VkqvPVcYOMmdmZfVr5zmRNcUMNM2EiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFOPBmh1XhKiILCFbo5Xrdf0yX9HqgAJooVL0yJ4u0c=;
 b=vI/OGDoxh8LXgBDX4IDE7fXdboEomZvLu9R9850Q+NbxD5D12V8pEH/0eUgF2PvMO1loLcpeN+5laBR5UWVc4+hVbSdsPpm1zNGbmvPhR58B+Y7M1reLR/3wdlsitg+rWtxSIMeXEsHVOJdF0Gr4QkfS6mZv4VJiAGN5VxCTgeE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5744.namprd10.prod.outlook.com (2603:10b6:a03:3ef::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Fri, 13 Jun
 2025 14:29:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 14:29:13 +0000
Date: Fri, 13 Jun 2025 15:29:11 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        hughd@google.com, david@redhat.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <6d0e65f8-b12d-4ce1-a996-ebb053b9b0c5@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <cb6d3f39-e0a2-4618-b36d-fff8724bf619@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb6d3f39-e0a2-4618-b36d-fff8724bf619@gmail.com>
X-ClientProxiedBy: LO2P265CA0151.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc66ee0-25c4-4b02-df2d-08ddaa86ab80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5fFdZvKZJ/x71je7RhKyb5wpohYbZBiXLGweNBG+SpwfjZPOZp9rpHBk+0/w?=
 =?us-ascii?Q?zutCfrRPfDOFeLRy0u08KAqDb28cn8wINOz9iId4nE2+UY4xE1pPdtqML+q2?=
 =?us-ascii?Q?hZPO4dMSs993KaAflq2LA8VOUf2VsCo70Dss1fB7+2votONvZgXQPwudIfit?=
 =?us-ascii?Q?a8bgPPD9MGv8BQ1cEG3ItHe5R9op5YjvO7vojcNd02e/zhb1DxIqsv9rHhu5?=
 =?us-ascii?Q?7IcJbGSoISzekoqxlmk+a2lsu8EKe2aaL9CqebEcvp/N+giW1Z8Ro0ZzXJY2?=
 =?us-ascii?Q?Q2ow90sXPe2IWr4tHSjoyOJdINVTkTXIOHjbRJsLycJ+gETKa8R8zYKA2UiD?=
 =?us-ascii?Q?c028Gz7OAFy8wabL3dgFSRP1jQ/DUjNYMJke7aF9O0Tgf5TsWdJqVlVxbZNh?=
 =?us-ascii?Q?HzdSVcpLW0CZ3L9Oel8218ZXtB9Zyro4wkS/assa5K7fMAFXsTu+uINxmtI9?=
 =?us-ascii?Q?SxwFzTrRkDGNZfE8mCbVc2m/IZXLb+xzgq1MTveZpzPmnk7ECDMWX2U/8knO?=
 =?us-ascii?Q?D1YgZvz7yIo1XkM+0XfKtuCz3baVnNLC86wNdFU5U9Gv96QTpvABa6QJy/Jh?=
 =?us-ascii?Q?q9aWnpy/QfCn3WUZbIS3rr2PL2qEgA52NSghDuNqkur3OlQcYxMjgEmcuy7u?=
 =?us-ascii?Q?76kbmDIAyNP1O9m3QQ6MxVrmT0rouhu/EBizcRSR7X/SPiJ9gXq597oYXeeL?=
 =?us-ascii?Q?An4eHwJu+QGAh3oc2cdbSdy3g4KVivYgivZVImVWb8yskYNJE5oO5n4H5A/D?=
 =?us-ascii?Q?CGD0hQ2/L/xaVet+ZZyYUb5yz5Fy+dADqMrUYCAZzbDRctxfhlhGTkEhPI/4?=
 =?us-ascii?Q?dgEW2DSY4p7fzmKFh7zXy9tv/a4ir8yu96YdBK9MEcxAswgbC4yVleEDoGww?=
 =?us-ascii?Q?6tShdcBH0WZc3xJLiwTTDj4QIzXACYdfhBiKfaOuBqIMmhpuGJ3DcnxDESo8?=
 =?us-ascii?Q?CJCiNokskfVKbmmaWTF06Uq1VzwktUyMzz9H0/HHiNmAYbTBZHZwd8I/sZQK?=
 =?us-ascii?Q?lMJciq9HFkwAArQeZJOWufNHSw0AY2vyjXgs9/1MoOBjuUw+MNNSza1aQMUC?=
 =?us-ascii?Q?qcBK/3VvV581PTi3Th0aaF2wPGJ3JMOINTFZkZiYI36nJOGKu0EL00d9ejkS?=
 =?us-ascii?Q?pdz9pmf4dspPSvV+he0Ye+uBhNjwzGX6bAHF6Hp7R/Qx9kVMwbEDQZo+bQCi?=
 =?us-ascii?Q?3sgtAOgNQJNd2aOBjBJ9b2GQm3L19RIwJ7E9mZaQ5hXKxi5Iy62W/AC+8QjN?=
 =?us-ascii?Q?CMQubhtzCiBvx17gRe5f5Sa7XpafEAlTHJfkfJukPTpKi/DeWacYkOWIH/+U?=
 =?us-ascii?Q?rV6TbfxMIDMvxoEBr7+V5aQCZz3UhHcURQilAFiFu+m6yL8B5yuTrlaX+tG7?=
 =?us-ascii?Q?Yee0+qc8URuvC2PCS9vXEP56y2DB0WkTayCoppnzawK0SLXMX5T/ynERoMNd?=
 =?us-ascii?Q?ZelfrD86ZYo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4xUPzCFcviSy0XO9qYjq08tR34kpP9luJq/AVC94EniOnHkkmDC7umDpEIoT?=
 =?us-ascii?Q?wRcsQjalbV2N1yhSIte2CTw27VJXgZxOWWSPc5HZbwHjQW3xeBBNc2prXNPa?=
 =?us-ascii?Q?kh4NP8+cOHwOf5vs/96FIVDY30NHZGXz+VXvY+MxzVdhHm2C1KLymEI/qJgK?=
 =?us-ascii?Q?Air04cii3BtnDi7LXnodAS0buS+sxHgcFAQRYj+u/u9U+Sb6ORHEC7FxH6Ko?=
 =?us-ascii?Q?bg4rz0rq+ymKzPw4PeomMhi9Or4sxpNpru2AvF7dTy2RWl0pyC8p82ureGPS?=
 =?us-ascii?Q?nPvvej6HbnNygtV/+zBBfZOEbZTN/lpc3Op0dLjKEgoZz+EJHMWvEeibh+FV?=
 =?us-ascii?Q?OwioFm1k+lCD3mbZ9HPWcyQx5brw050cKZxcXFSqfqSQO6dW5Uh+pEslaFEw?=
 =?us-ascii?Q?8tXPQCGZOKCrqJQcycSA+Wr2XWhhenaNeHu4JQVyCxyXw3U6ypKbxOKpkec7?=
 =?us-ascii?Q?eUUOiwmDVX/Z1O7RmbHDhy99xbcp3grfUsAylDiR4VlMm0JhEV7nnYrvfea+?=
 =?us-ascii?Q?Tc3vIOxhmoZcP1OotKK2nZ5BUUR/Yohwt21JxN61bPl5flKYQwCG8e9kUzDs?=
 =?us-ascii?Q?gber9cY/EwOB1iDQJUNXcT21NDAI7oZvl5CB4+K1AFZUfhkX0vGm4zPGW84U?=
 =?us-ascii?Q?ISXSH3SGXav8Wpj0428qZHwDX8fVmA7UJi5TpeR+NvZE5iAHDKoUqV0lb4zJ?=
 =?us-ascii?Q?iWOyCv2xFdFlWevF4ntoz0+KOxYWkqNeyZYrQX4EmSdXY9fnKh8Lpo+1T1hf?=
 =?us-ascii?Q?T/AbHcS5tmUo5ul727TXyxuFP7NzWz/7LAzZVACRKtjI9gfgg4iPpqGgag9c?=
 =?us-ascii?Q?XQlpAj3+Bdk2C+o8Ijvom88tOd2TyE9sRWjuawwG0aTwiRN0bjUU9Vel2AtJ?=
 =?us-ascii?Q?9bWjhWn0kbScekK56ipvHN0r7BYQS0VbHPnWdTRDHDfkeF/7PTCA2QuKiWQh?=
 =?us-ascii?Q?4tuOJSYyHKKIEfhXfSzhTJZIdRukiUuWnmrbYoOt186GYhkY01M1nCO37/W8?=
 =?us-ascii?Q?ejLJV9aAL6hASWPDwwSDMxBFxZKeMmK7y7lo+FcHykUMDBdK8aJglTPAe5eq?=
 =?us-ascii?Q?Ui9gLIDLZaMUp6c3XqMiSU4nU9kcLWQg0AfdX/oPsobIqChYG8cy4hAuWshW?=
 =?us-ascii?Q?mkmFQd5r/B0GNTCHxlDdDuboJqpOHaObMak6EzGZckaydqmtRJFoP/8Km+6W?=
 =?us-ascii?Q?mRbx5JIshbhiPqX0duyQJ7ACqxQWpidxKuBJNOrkgNNp6olNpBQHldPm6/5y?=
 =?us-ascii?Q?KprPOQhXC/pxc04PvBHke8CE3erItu4UTmVDeV2AkTf657BxLvht1J3mdDN7?=
 =?us-ascii?Q?IsNzRsq4yqUnilE1YS36M8wqKMbjCJ5DaB/8+IZpqTjxmmRLMmuH879BEyuz?=
 =?us-ascii?Q?xQhh1mW+6pE+sbI31hxIjoMvUXtKH2an3waebS1lmQGaueS6pOis0hkyTbmw?=
 =?us-ascii?Q?ClTrHdvxwNjlZMnJ8VjexUo75EXPFTMQy2uUvKo/b6DlquvW2w6RsFptps7B?=
 =?us-ascii?Q?mblUF25PlqXk3P6KqEvMCJqIxp2lk7JIUDOTxknJi2uI2tVvx6JSjqM0MU48?=
 =?us-ascii?Q?6fYWvz6+RQKNl71kAZWv2yaC08/d/nMk2LZtkxNv/JDmcYMYSeRQQnOcrHFN?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2c1WZsL7xVyQqFK04VSUBmieqzZRGomajZ6ZGO0TLUHYXjXbDrQobVMs5SmXiWx7H57Yf6bvsfXDoP651qozCihA6PIlJcpGieq+hSKeR7G3TUtCPmRxWecagm3PRcHbi6R15XxpcJYYX84aP5m0bVQTKYKOeHo2Ya6je/6d2S1ToesCbNn8MdQVh3pLcXJ5ZUkyhaUCLd4DbILYZWfzIxNTgtEfztDvwydkVDyuEjCv0o9zFsLgFYat64zNVT27Zi14gAPTlfPFaAvGxLPG7WzZ11VD2Vfj2TBG7MpYqFsI6LVyetl4akxfOVD7M59ZWdswRhQfM4nvw08tpDGot9FxbJkpJgf0IN8uJQWA0U/XxHvDdgPRIfbsEJcFHGH20kX8sQmocuS+RW9D5ZlfyXE0ks6YqGNeYwA7CfpNIppL1k5bHNM4YlscBQLMlgmDvzJ88F1OCN0lvCCR4tv8dz5/LEXyjX9W2/wr1X1k8XUY7oWKCSwSxAmSkRBHlgD3N36xR/GTyFUL1MvVArw9Un9x0Irpt/l4i79lFMqaijT/TmZnNbV3GxDIaa3Nvgbhz8MZcbSO/2fhgLykZyDUWtX/ZelcNjQZr9g5pkC39ms=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc66ee0-25c4-4b02-df2d-08ddaa86ab80
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:29:13.6887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqSN3jUuH7LJUTk2B9/eJbufby2odfN36/suwoAecoY11yRgC5cNIcbrr9oSIew3cgE4PboIqy1+mCAGkyp1PVQ0wGrR4KkL3l0jpnhBtXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5744
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=771
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130106
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=684c35bc b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=sZ6KsQ6Yk7h5SMabTn8A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: kx0Xoy50mI95XmHaOrnuVg3M5l78SDMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX0Cn2aG07AGZV 2J1Sk7/yGDs0m0u9QXrtmcF6hfsNJpRnbqNY6Y3iO6j45WjL56UQUHpIwzP08axDST3d666uHEQ g5SGtvur0wvZGRw1rJhPx1ByCBDa2fvpBdIq7hpOL9KWEs3neb/WlFas8fjZjtEY8/z2bTiQs6E
 duAduU0tN0Rt0HzGxHljoQEcfNCb64IDk1IU1GTD2fQqR89rvJm3LADS0mqv4TN6Lhc4tRRgD3x zsz+n0AVPgeVUvmmPJg8VdGLRUiqElaaQhcCUCF/S95jqIgmh64wtkTgfE/08Za0aUU4W+pUVgF mwOLqL/1ZSKo2SoWRXTt7WEBUPyi7+MN2cPRUjoJwSPnXabXeXjozg+RkzGRkgRrAGmJUkT7BbH
 +69FMsiJMx+DpIdCqsKCe8j3zUmeomoF+79FdmKg+xDAPxswrmKLp1YE+En7vsooTHow9aFp
X-Proofpoint-ORIG-GUID: kx0Xoy50mI95XmHaOrnuVg3M5l78SDMw

On Fri, Jun 13, 2025 at 03:23:19PM +0100, Usama Arif wrote:
>
>
> On 05/06/2025 09:00, Baolin Wang wrote:
> > As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
> > the system-wide anon/shmem THP sysfs settings, which means that even though
> > we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
> > attempt to collapse into a anon/shmem THP. This violates the rule we have
> > agreed upon: never means never. This patch set will address this issue.
>
> Hi Baolin,
>
> I know never means never, but I also thought that the per-size toggles had
> priority over the system ones. This was discussed in [1] as well.
>
> My understanding with these patches is that if we have:
>
> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/enabled
> always madvise [never]
> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
> always inherit [madvise] never
>
> Than without these patches we get a hugepage when we do MADV_HUGEPAGE, but with
> these we won't get a hugepage anymore eventhough hugepages-2048kB/enabled is set
> to madvise?

This isn't correct, madvise at a specific pagesize will still be permitted for
MADV_COLLAPSE.

In current contender for this patch:

/* Strictly mask requested anonymous orders according to sysfs settings. */
static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
                unsigned long tva_flags, unsigned long orders)
{
        const unsigned long always = READ_ONCE(huge_anon_orders_always);
        const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
        const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
        const unsigned long never = ~(always | madvise | inherit);

Note that madvise is considered here.

        const bool inherit_never = !hugepage_global_enabled();

        /* Disallow orders that are set to NEVER directly ... */
        orders &= ~never;

        /* ... or through inheritance (global == NEVER). */
        if (inherit_never)
                orders &= ~inherit;

        /*
         * Otherwise, we only enforce sysfs settings if asked. In addition,
         * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
         * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
         * set.
         */
        if (!(tva_flags & TVA_ENFORCE_SYSFS))
                return orders;

And then if !TVA_ENFORCE_SYSFS (e.g. MADV_COLLAPSE case), an madvise should
succeed fine.

>
> I know this isn't ABI, but this would break existing expectations.
> (For e.g. we have certain 64K page size arm machines with global enabled = never and
> 2M = madvise, and we want 2M hugepages to fault at madvise).
> If the whole thing was being implemented from scratch, we should have definitely
> done it this way, but this can give a people a nasty surprise when they upgrade
> the kernel and suddenly stop getting hugepages.
>
> [1] https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/
>
> Thanks,
> Usama

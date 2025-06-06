Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9793234
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205193; cv=fail; b=m941FP1dx3GBlqrUPBD8OeNtAAbKZlYw8hdCnJ8G9iqF3Au9qStZbqiiZIUO/GPsQz5My+PWhobLGMBEhviTxZ7IkwF/c6Q3LN+k3795IpGvm+kyairzXHKx5HLddTr2WQN6PWZinOvY5W4vseUO6vFcLE5CDchhOPqM9VB0v0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205193; c=relaxed/simple;
	bh=96KpHSEI7OyViUkOQlLImyOMA76rDvnL8aIQ210ljXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CQC/aWeUeBTBeFGcxuszVtEI07h31eHi1gs83Bj2r5GA7GbmzZu8ICeAgYeY7fat0L6I1rIDcnz0unPskq1AY4n7O+1/uQct0AufDl77iRfciIzXoYH8cCVxPITprrMnXdBsmL/3AqJ+0otOI0z9rZvwQRTQIWcUvQLjJ4SsAa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o+QL947p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UQs12VE5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o+QL947p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UQs12VE5"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565NCOv011366;
	Fri, 6 Jun 2025 10:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=96KpHSEI7OyViUkOQl
	LImyOMA76rDvnL8aIQ210ljXM=; b=o+QL947pidpPB26N9euHG8tYddgu7Xzsew
	RnFNXYS119fQTaag13HS1T5SWjuw+ZeuFy31qk4La83CqKAONrVrozTyEo84m2VP
	r0IEReWCo2FNxxShxEWqUH1keXb8bj9wzNCU5LNEj5kETVzacndEybUPm3h7SyM/
	epOtFNEk+PpTNleXCRKiijEwMB9BIqNEgrdeV/+0ohZ+P3dxmuVSAeGtlBM8KEKT
	YpdvRY/35EnGf1zuk9BNoqHe39QIMS33Oi2lQT7mBovOs6nv6ikYPF07oYaTwM/M
	lQb4Fy9tQGibyGzMraXckLo8kccr78Q1AgPR0LbrZhPCcDYUFZig==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gwhfkkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:19:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5568nx0L040198;
	Fri, 6 Jun 2025 10:19:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7dc78e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:19:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MK2PPXhc6KOiaGgpGHvl6eWierfY8xT3bbER064WK8rVtmswv8wxNJc21245P34Wz8Xcfded6IayS6v7XoIejhT8ugPxaaDAN1GN5I6nqxNNcT1mZII5WQ7bDMnMOCYMfMQ9nNjyaKx2zGwKEuBEgH7Xp+s/h6dJ5kjh8UcXe4XYzOaWiimUdwLk9EavBEaCy483eUSbseF1U1JXxxqYC+A0t+TL/ippHtR4LgTB8iFHqXjhRmh35x0vsARaNjOiXm8yMAuoOOImW4cP7Cim6di3ORXxMhO673kg4BENb9FToa3Y7RpAyy0ignzTJr74A2P2PRjgr+sBfemoYeNAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96KpHSEI7OyViUkOQlLImyOMA76rDvnL8aIQ210ljXM=;
 b=Y8TaylBI3eXTVBWAQb50+8vUUeBKvy2mC8Wc85kykguyf9P6iq8OoKqM2v10+FDSWx51whO0MZvombgCdNY3jrp7jwU7VyBJ14dz7fcgRThJnrJfXGtUDbUtJsUtNdyN0gJ5VcfL81aFNZvR+qnRSuxAc7vPHIIGFoXRywa31cu1LSRwj9WFmSaKfGYECC4g1K/sLpUIOx/CblAZJ2Zs0CTT8vSJLdicvuR5XwVEpKg5vuGO0IlLLAwjf3X3SfmYeWe76poA1/DydbapJLVImUFXOAS9FkB+pVoMN80YmEmWOYppE2y8TTDj4jvdUwCyx9/rRc1m5VPuPnbQS0eBpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96KpHSEI7OyViUkOQlLImyOMA76rDvnL8aIQ210ljXM=;
 b=UQs12VE5j1rppFRTzVsD5K3jeI1tgVwywqJTKn301jfrcLUdTqnjz17IyBaCvCh90CzcGxzmUNabjNel8VU1EJDxXAB7OirDfYBXkcJmokXmWMvPgOETieTacXFQ4Y3xSfTY5gAK2ZZz09KqP6KC3DYapSsUKynLKhyjzSWfJa0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB7336.namprd10.prod.outlook.com (2603:10b6:208:3ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 6 Jun
 2025 10:19:31 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 10:19:30 +0000
Date: Fri, 6 Jun 2025 11:19:28 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Michal Hocko <mhocko@suse.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEK_R93gihEn-xW6@tiehlicka>
X-ClientProxiedBy: LNXP123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::21) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 607d381d-3f74-455d-7a42-08dda4e39fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8vDFtyGgSzVc8TbXCagmaCEZRmgel6bV+WxXd1lFNrMgIm8Abzrx2M+Ht4io?=
 =?us-ascii?Q?V1bpgID8KpioTBl3/j9po9D9VEoFZg1dYkrRbK4siyznPx9ajHD02aLp57uf?=
 =?us-ascii?Q?VL8l1qSu9UvDgmMppNBbtvhE+5UvPqtIcv9Tc1UhSEQxVzw92T8TMmQcIpo0?=
 =?us-ascii?Q?td6yV+z68wLKvyj1b2ZiAAvlY8xNBoyTm6UAMlDhgfyPZ5sZHPi0hdzVyNYU?=
 =?us-ascii?Q?kwgEUg21Z/yDApiML0C6X6xGton45BB/wNtr3TOhpQnu2vY5RKnPJuXvXz80?=
 =?us-ascii?Q?31Qn5J8o4snIUEinchLubrlUb0/lWbOS3qAlrcWYZwD36VbrlV197GWbEj4x?=
 =?us-ascii?Q?AHEgRA7+FLoBirDtO0L8UzQOJHUtBnhQwP6rn3O5jvgmwiomxW2yV8A8szgS?=
 =?us-ascii?Q?s58KyqR9b9Fltlx+slH/zuGtw60ZAwlv37qROHVy4uj+piM403y6+lT8QE1s?=
 =?us-ascii?Q?j2KCzTO8eBnuMryvk41/MAS3oXUbWX5Q5ODCfCMoXUzzQdh3H5E8DrXplGrN?=
 =?us-ascii?Q?4oKoRnV/sbvxsIIDOnfknqt7GxO04+MlnqbSEkpAnr51G8ZuttjbC5jeWuX4?=
 =?us-ascii?Q?5g5K8Y5YB5Ki5dt8fUhyqukTsa/7MmtQh6LdnYORFoLmbiNQlQhqJt2WsRXs?=
 =?us-ascii?Q?3jdpi0x+yyAtvEi+VH2JxzJUxxEbQxnWlGpf0NKCbsHOwuXT3RAvti2QHQ0p?=
 =?us-ascii?Q?EpWGD5e8r4RvBXFtNv9ZQoS0ftSnBH0EmU/4bxeRHM0UBdqN46np06Pb8hOx?=
 =?us-ascii?Q?qUg8t63qUJhnibEkixkmCRIu/nuRmkWVCKwnlndgkdEWE/6kslh2t3ZrZZQ1?=
 =?us-ascii?Q?p1KZVn4uul8YOgMboHhxHilQRDtg/9gGTQAgkR7UDAseI934Eeo8E+ca0Tis?=
 =?us-ascii?Q?bqfNKUuki9EXKr3oyVpajoB4HMAcJR7GF1AGV4Zd6rfFtzANud/SpOL5tX4E?=
 =?us-ascii?Q?vgOXtr6a/wMWAYrWeG3i5UVfGa9YUnea+qcB7yAWuHynGQj4diihMHhDvLWp?=
 =?us-ascii?Q?k9tjXQPDodmsDzyDnY/9hAm4B+hCaK77f3j1+U2im/ZYyzwbDwmEjdbZPc4m?=
 =?us-ascii?Q?lZ14/RCdgUStAf75BhyFgswXnVbTNsobRHNIPeJnJAHNIqBwB/wq6y5EKbrt?=
 =?us-ascii?Q?HBFUCVqesSg2lVdk/C6jZEqXRjc8oY29WWxpXYquv04DIj2bijhYoFjaFU6t?=
 =?us-ascii?Q?Qg5KXFrE3+QEZJPUPna/wCHDBgNrBVdFjBoja1SVpL5Rl9xvpwUtMhEVD4Ei?=
 =?us-ascii?Q?nc53nDpZcJStxI8vwZXhqgVdbyyOLYFpYeYw4WzN877neGiaB0EEy3pn0y1A?=
 =?us-ascii?Q?RI9HcXSNe+cN9ApxGQx8UHQ2EYpnfu+og2qxHihDKzAwm0uMaKE4D5C8CMky?=
 =?us-ascii?Q?iVi+2haSPKApd3ziCUwFN1jws6rcBuYBNiFZFyITuX9eJBhWm7If55Yp2ASx?=
 =?us-ascii?Q?yS/tC1FhLIo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xBZWR6SMdt6AJTfmg08iH7VVO7X2QRAiCh43+zBwzUJ6jvttRemGNGVk6X+/?=
 =?us-ascii?Q?qym29aJrbb1T5DOWSniqEWiWjpjrsxvRStipjkVsvj2fe+Op8Bj2HbfZXAhz?=
 =?us-ascii?Q?/d9kYXoaXva1rh/LGFEBPNNCUhPdzg86DdUKuLJTeI9VdVUAr4HjoenYY6i+?=
 =?us-ascii?Q?UtIfMd4gZrJksgnLdcKg3t5stSUbvPr+E/fb6SrS1tw2gUEA+I9Pp6IiOkqs?=
 =?us-ascii?Q?BO8pd1rKM8amcR4q9smQrLNFbMBH27iFrUUQ4jmV16s7/7DY4dbzfSIylxKe?=
 =?us-ascii?Q?AQ1XZ0aQiLgMMg41A/jM9yv7pVhodFFUyJPKY500MD5KJz0IQczyeKLN98jW?=
 =?us-ascii?Q?09aii+YWlFJ24piaCaGCR52ryZ/ZfYVVCxnpJd2iqcmhOVABykWBqaAm5OFz?=
 =?us-ascii?Q?6HvfE5ZeSVTuLsG8DFQ9qgcvTaUP/TaSMh9xpax71wkb6Qt0myyHjfG0hFtz?=
 =?us-ascii?Q?z9iiqvBZrF61KkfsTpX/wNDl8ttN9dmw4t1O5P6VhADvBX3AJFGwpvAgCfsd?=
 =?us-ascii?Q?p3sqAj+tXUKIGqRuxNVJEuVNfM4GP/aUnCv96C8qB+zT9OKX9AsvMzPbdl3g?=
 =?us-ascii?Q?MzqKGfFzkrcRLlVhXtWfrpTNir2O7gQ22tjBDdI4uYkdIAzsAxfd/1TVUiPS?=
 =?us-ascii?Q?JNiuWYgp/n3jm/N68cxakPVebMpotg6K6vOb1yj6bKsHNoS+eCqoPF1IpCJ6?=
 =?us-ascii?Q?u51Pctf7VvTZ/42zkgEqhl8BSTGltxOmVBjYVPvX6LYHdg96v5iBAMpaEDG5?=
 =?us-ascii?Q?70wrkmn0I5Bl66+6cmpcpe69RpBriavs/RdUtWy3BXbjkTbKh3A3nyV6nzne?=
 =?us-ascii?Q?GRGQoWQ05Do9sgOMOW3UNd+QGUdpLwbX229BG49LlIsJRP7Ck5jDh1YVfD55?=
 =?us-ascii?Q?IqGnPtPAREyUz8ylceyAfbsYjIGZFAnH0G5OMgt3HJq0lbLGfH/vI2eZof85?=
 =?us-ascii?Q?8v2Xluc+1VX0b9mc9zMBqUI54qywVFQwh5Z+b82+Bd4GAO7n6kx6kOAyQ7QG?=
 =?us-ascii?Q?q3pQxaR5VZOpSNEUjnkc08un+9iTiILKVhsgg4GlUCEhIjzoKEAiMBAVKZZW?=
 =?us-ascii?Q?L/35Uu4TmiaxR6McggIhze5FbsXAFE9Q+b+CWecC8NzjCsjCJ4WSzDy6Y4lk?=
 =?us-ascii?Q?6aUcR9tGRsdxGUvSJkOwY1ZD36F5vVNnDBtUt8vQyeaXc/x9hF8MUhvIGB81?=
 =?us-ascii?Q?XtJJdjMz+MVIr6+rEZWr2732TGQjPSi1do4ZXf31IiSUYFcAHGgpn51ofM3l?=
 =?us-ascii?Q?dxjJGbqLCnru7cnb6f6MwWJhivHKlE1P1rRziFsMyALNocv5ekN5PY8QTM85?=
 =?us-ascii?Q?PIhH9LYC9p+W8vhx/l/8e12VGtic9xcWnIRxT9ZI0MXeVmJ6caN+M8lnVFs/?=
 =?us-ascii?Q?CHRbm6hLeip062PAN2t0lOCparucr0OTRNOKC8B26p/aXTxPy5VmwWPLmBJO?=
 =?us-ascii?Q?7U2nylQWDWWdYMwjFWlWbamfPfSugwCNQ3+3g2bwKRbYL2euOyQ49kFSOzWB?=
 =?us-ascii?Q?XiXwy5AZAcLUc2C86zompP4Pqm+k7KDkKrIF8+b64USkgvXzgRjaBPLF06LO?=
 =?us-ascii?Q?h7o6ZtqQPBSMYFnCjK15llaYDsQhPkHnj4oAJAT7j7Wz5j6uLbuNPFOvaKqh?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3Q8svOKD/3WZGPHvGhciN7l7uWKeAIN5e7PhCMXH5j6lK8ktkpF/k0KWi4S6pxqQBUJX+ceH8oP6NSUWMJ5jaG37OOsH0EHb0+lxDrBbJsptcpH/F42xChyV7kyXL9FJBr1QACUkmUwjMSJi4YOMYInO2lsUAEvuI8TEi7QHM0MsJ2lYOUrlPss+qALB98oexM9MPbqfdIyPDNHo8uOa7lQSS0/i10ubcSNDvzWAmVsZWhZNQhfmsaKSZn+inLLc3/lfGBCSTz5+hXisPUuyr/9iy7Cid3YwtsrIwC2O+gzeTKb7ts7mmCS4tpC9zEvrc+ybopKPXh0uwp7BQxJs3h1oaA2ruzzTQBubgxFtI1rRl3tp5DGmRNSJhf+A8VkW1Efc7L9oca9G1d8/Jm89EGpmrtA8hfVVUSfuS48W3BlPFkDVVzPqXABGdBqKP+j0xGBGtiuuQvkzKuOHkncTgJDY6EpCXV/u5gxLyeQF+hvpbKRZHUJDCNO7O+bqXLKrhCIIa96+KQTSJ+MoZCbztEFqcS2uxU7yo+tg8+tXgTMZbsNDO42eSUkbDH5rD3eg/q5jDBviEX0lHShnT93D5IXB7gxqPHAWVwQaaM9Dd/U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607d381d-3f74-455d-7a42-08dda4e39fe2
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:19:30.8147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wy7CeKBs29u8zPkK9IRQyXqx2fB+Kh5fiCe/WX/2g20rtoRmqTJrS2qtVo51yWjUzj6nrLoxpmnmPzfphBfoubWu2DWBoAxcPmEgLGDecm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=411 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060094
X-Authority-Analysis: v=2.4 cv=Wu0rMcfv c=1 sm=1 tr=0 ts=6842c0b8 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=8IXTDK3gWPi9ZSE4_WgA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: gcf8HNrDewP-meTKgehQvk9YSuKNb_CY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5NCBTYWx0ZWRfX7cZ7gw1+nhVS GOiSyNepWf9bXr3hr9Kslc3JO71d2bTNvKQGHrm6SdgEl1hY4rSiR7yXMFyvCEj3z/M5Zmnwgnk I9vJrDMw9f7dW+GmbU0c+2L5iFlCYBOb4D0MC2s/H6XkE0c8MoIXnoE0G3ci5WtlWn37MHutQLf
 xjVqCw2bQJiwcgvRdSFeX+sHdE4Qp0wb9WRb15o/JyMJzFQahDsUQhORAdzy5kfOgd+FGvUFEjQ i9b+OxRDQkubfUazP+Gu9Gamw0OIogOSrVS2dFX9ErdDZ+GFmUYhQejIzq64UZuaxGl4T5ZxJ6l 6Pav+7xuLAJpblnpd1oPFpnZCSpN922z/82vX5R/5MHU7nRmuWi/lpwM+oRfdxaS3uXp8/AXN7W
 m7b+lsRzQpWILu3zVGLWtG1lGSIO9FcBd5VojIhgYgMAvLhYOq9AMD+DJUkuihLODDJXfmxs
X-Proofpoint-ORIG-GUID: gcf8HNrDewP-meTKgehQvk9YSuKNb_CY

On Fri, Jun 06, 2025 at 12:13:27PM +0200, Michal Hocko wrote:
> On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
> > On 06.06.25 10:31, Michal Hocko wrote:
> [...]
> > > Turning them into VM_WARN_ON
> > > should be reasonably safe as they are not enabled in production
> > > environment anyway so we cannot really rely on those. Having them in
> > > WARN form would be still useful for debugging and those that really need
> > > a crash dump while debugging can achieve the same result.
> >
> > One question is if we should be VM_WARN_ON vs. VM_WARN_ON_ONCE ...
>
> *WARN_ONCE ha a very limited use from code paths which are generally
> shared by many callers. You just see one and then nothing. Some time ago
> we have discussed an option to have _ONCE per call trace but I haven't
> see any follow up.
>
> Anyway starting without _ONCE seems like safer option because we are not
> losing potentially useful debugging information. Afterall this is
> debugging only thing. But no strong position on my side.
>
> > VM_BUG_ON is essentially a "once" thing so far, but then, we don't continue
> > ... so probably most should be _ONCE.
> >
> > >
> > > So while I agree that many of them could be dropped or made more clear
> > > those could be dealt with after a mass move. An advantage of this would
> > > be that we can drop VM_BUG_ON* and stop new instances from being added.
> >
> > As a first step we could probably just #define them to go to the
> > VM_WARN_ON_* variants and see what happens.
>
> You meand VM_BUG_ON expand to VM_WARN_ON by default?

Sorry to interject in the conversation, but to boldly throw my two English pence
into the mix:

As the "king of churn" (TM) you'll not be surprised to hear that I'm in favour
of us just doing a big patch and convert all VM_BUG_ON() -> VM_WARN_ON_ONCE()
and remove VM_BUG_ON*().

Pull the band-aid off... I think better than a #define if this indeed what you
meant David.

But of course, you'd expect me to have this opinion ;)

>
> --
> Michal Hocko
> SUSE Labs

Cheers, Lorenzo

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64C1FF603
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594526; cv=fail; b=c1OTlRWcq9ObtXbG//6ZjTNvy7CTM3Dp6uX/jAOPY2eYlP/pVwXf0BmWxkdgngfLbvjiVk6UDozGCJSlQnNNxlR8Ke+wEkHIzTKI3fLbQggRZJaX41PL+NoIPUuS8FLL7IaZwLS6iKFUNwOqyd7fTY4MGrufAZcto+W5TamvCQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594526; c=relaxed/simple;
	bh=vpJiNatHwpjEQgzQt1l75ddokeMV29pQXE5uTT2DJ84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jL/YJb4RSqcFFS20Q9HalF7nX84EPXK7EqWVBfHBQ8TK5Y0eZMjFB5suBE7yTwRyHc2DV427KxoyEsS74HR++o9YtPzhaYnCGPwb64k3aePmziesXYTV+w3pQyfHOjYkEe95XurmtJFEtTtldngdo3QkZnvq/Bbzk58/7nRDU6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iMGC0Txz; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MGjsmIX2 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iMGC0Txz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MGjsmIX2"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U6tvl5021244;
	Fri, 30 May 2025 08:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=XjrGy+K3ld3cJXAbnJJh+2ny4f0kzmjPP+9iZ5RsptY=; b=
	iMGC0TxzYFYemdgTpO6q2bZ0ViZ2qIeU82dpaTvUmCRHBaokQQwkt8CeA3uzNnz/
	r5rbmA3Hun18zmNzIQoBPQVMe0weU6VRridfgXb77bkH4zBGptGH+VvEjeSKnT3G
	tcKFqPqhCP0Wwtc8AvxM38Gra2VG/TH09fADPc67g7fIas28vjXNKb65kgaF9kcR
	h+kzhZ1Bf/nEw4F839JHdpJEchwdhAr0kaaWRpRq27SRVpmkNdvcFQMHEbVBhumi
	/YrnfesEPRSH4FqFqz8Yv+W3oBqi+ObYt8v2JpniZuocDp/tQoJIt7Qj0W6YnSDO
	ysw5md3t11uT+uHlKZk+ew==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33n1uaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 08:41:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54U8XZVF025675;
	Fri, 30 May 2025 08:41:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jk98tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 08:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwJNKewyNcoGnR4LRwXkmJD8nE0YRkM+sKurnDL6SL2l8EJ0X6GMlU+ryQ3/1k4vpoozrwTUCtriwYKhIDvYnfY2eklmLaQrstnZAr5v2FiO5XEzsSoPxtaplmL6F1SEwDs6XAVTDMOpSAmGNrRj1+Cso7CnrHN8aWsphD4X6v64nCxFz8QcxfXKpD4cjtPb1qn6baYGJBJOlMYqd18qGrduJ8IuoyPhgHNNNGvNbHIVGVIWNc3LLtDFnCUhUmDVYs/ZcbjfXVrhn1Z2s0rwL6nynlL4KoOErFDpXXFHuk11CyJPmP4UWhrwqytmhv6v1q2XTpaGdEd+zGga4TNaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHo/GMSJOhHaA3KnM7Cr+xF8G3tJVTJ/+2W3K7CM4QY=;
 b=U5lgmIl2EuOrrzbTqS01h3sUZpc7PcJUGBi6iWPoiMyqW32mZwhM/xVS3vTascSqFWkVX+C3wepi+i9Lu+7ed71TSxFOVVhR8Zj4BUWljZ7U+3DU9yraRleDlCqCftGSW6BIPg81HgQUmTcxfn+ccrNixjCUayj83ImPa8T0fIEaiOON7yPmVizpePULNZZDQRFeJxBqKAM7RdJxA8aGvG0AnlGy4kRSEsjhYUJKYSHn0QrdlDdHLqdBKE2WD6MPCwzyJuW4ZYI9ij/ZZaMSXhZ/20fE35x+Es9IfauYWJKElP2bGosN4sTLTs1lF4OAoQE6MWeTx4IWUsomCThhbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHo/GMSJOhHaA3KnM7Cr+xF8G3tJVTJ/+2W3K7CM4QY=;
 b=MGjsmIX206jTVD9/IYSdFlsI2JJoh9YSyL+VveKYbsldyZ/NHxP4xYcJFJG+ZS9Z48puqmOcvG4T2khXR1AKkpIpLhcjj9PCM8QSAxagwsQN52q9pUlTd76RD4Fb/waiHV7mXZKc39PatyXWZHLTrjlZ0OEtFEqtokn0Qu0JTak=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB8155.namprd10.prod.outlook.com (2603:10b6:408:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Fri, 30 May
 2025 08:41:31 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 08:41:31 +0000
Date: Fri, 30 May 2025 09:41:28 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, Oleg Nesterov <oleg@redhat.com>,
        mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
        akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        pulehui@huawei.com
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <b2dd29b0-aa12-4cb7-9c05-d3a998f7b0da@lucifer.local>
References: <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
 <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
 <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
 <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
X-ClientProxiedBy: LO4P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fc1e5c-9f32-474f-3a4f-08dd9f55c6d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?qOsB14R4hdFLnuFzBC6sr4D6cQdA4GDT6d2NC9gY8dUzTLJY6axuc4a3w4?=
 =?iso-8859-1?Q?X1w44wXDx7Os3lJBkdxrLw6N+XRyKYL57nazAzE8/B2FeBWA5U4K05kyHy?=
 =?iso-8859-1?Q?7ekUjiRZr3EpBTe1r0yOUhlwxfKvkFlGKlOQkzsm4a8lqHVHdqL2rPp93J?=
 =?iso-8859-1?Q?EgX1qQQZt/D7T8Si8HUXwvYNSrqZxnxQ9g4dfrcyFpG52NXdd0NsA7Y9fK?=
 =?iso-8859-1?Q?61NZ2oW76nxLQXnAOdiJ+0ve/ZJR0y69Oa8wNkiPYKqPHOaZZuqDDNrXCn?=
 =?iso-8859-1?Q?ef6AUXIUhYbxdKyU7idcN6pGUBNpXVYGPp52KZlmz0K1gTP3+ftOJWLz1l?=
 =?iso-8859-1?Q?nF0CN/6GHJDh4yKK8+A0AEa6tGOBUPPYsCFiyZS0LUdX3UTQE34MkAuS57?=
 =?iso-8859-1?Q?9zzkZ9TzUIlUVpQXRrsdsudIV3i2icELncwNXrvIYN1w+npvMUAq5Bb7iF?=
 =?iso-8859-1?Q?W0KogJEDp60ym2WpSd8sp0Jda5mqq7E2C5uzJwyLKMaz26t4eLBufdBI8w?=
 =?iso-8859-1?Q?1TIbmlPL4w4amldBvOhGENiaU0ZAStEvhf2CLlJw9Q1/1Jwdk1CFAENDFt?=
 =?iso-8859-1?Q?0jx9EKOloDJh3XbZodx/yP6OGui9lWWCGcOpta9vOp2lZQ48MqY5NsfLj5?=
 =?iso-8859-1?Q?NBb6l5S2OENiJpSnNpEUBh4SqyGOZtnV1W+HnsYxi4sKaqxN76EscHXLNf?=
 =?iso-8859-1?Q?Zh3x9VJhAsI3qATm2NkB5YwPy4Ovksui423ChsiIeZBeC2aiFadYJCjJQw?=
 =?iso-8859-1?Q?hBJjF1rQlmsV+qhm/lqSFFgm8dgIyvPEHXqky4ESaMTeehd2C1a/ovsjXR?=
 =?iso-8859-1?Q?TT8ugNi3SJdV/5BgGj/Lji41oyp5uuz3RmTnSRTiMRv/iUXgdrf5IYi9Ez?=
 =?iso-8859-1?Q?TnpAZhT0nd8Axx0TISr93AYShxQ0A3VKn36epx4lAJzvzlh1EAs7AP0Sk2?=
 =?iso-8859-1?Q?zQ4EII10rLgdVQ4DyABm7oCLBmHO9Jf4LbaoXggPefkNtO5pl4evAQmLaE?=
 =?iso-8859-1?Q?HRRTbKBfebdsseHXdBLcpU+45EB5B8VW6Rihx25wJcf0SOwd0RlIE5Duk2?=
 =?iso-8859-1?Q?G84sEZPIlsF4SFGAx1K1k0GQnWf+YbipnfYRRxaKd5rGrXiX+MCN6/qKex?=
 =?iso-8859-1?Q?X7duVvavweYrQm5O8SKU/g7115uyYnVxpYU6i4EkdaIm3TJLIXC3mwJX3d?=
 =?iso-8859-1?Q?5u/H14M9e2/rRkJKrfbUJd+1bySCl5/weEH1vvDY9Bu73qbHjjWgx+zcpe?=
 =?iso-8859-1?Q?Ar87qlc5t5WusZoQW4rGy+vuNJcnG8UHDukQSJNrpg4K5aMl010QPNO+gg?=
 =?iso-8859-1?Q?LUqFBnZ4+J2dyjDoCkEza5Kyy9dlIyL64k8QDQCvaNAYhID/Zf0nrQen6b?=
 =?iso-8859-1?Q?yQ2bpShAdbhWRh/87qjJ5k7aUbtn5+Hvh/rItQ1pd/ZD/OD1d6hPFj68yP?=
 =?iso-8859-1?Q?kAIGkiUNqHh6c/iugd82ttWl3sD99uqtjMbfsJYG0PKlvIZB0RjpwLJ0wY?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?sc92CFAfMjco2WAI8PNy9VpjDHpvNlBaZLpxuuD/I5+0wmdR/bf3UnUWtK?=
 =?iso-8859-1?Q?LmQ9wagHMZ//k3AVHnL5I6wbxTDB2q1YyFwrFZ5tyFa5ltXHrwECsNqSvU?=
 =?iso-8859-1?Q?CmlUPYrHAyGK1L9lEWdDGrNT0aOnNTHcTBzANxpw6spwSglfH84CrvYlwn?=
 =?iso-8859-1?Q?IaoTLMa0Tn/R7FN7cFu+MnMn8rbQL4AY/epagy03rliQWfv8BwOmhProX8?=
 =?iso-8859-1?Q?f62zcp4sYco9RZwqyQyQcGD4ZuZuxqx4o/e3E41wIjrgce0EbzijJw/1W9?=
 =?iso-8859-1?Q?dANZ6OviaVV3vDn1PrwWm3pVKjhZqX2gueP5/aqlPHD2heDfO5ydNmGxHA?=
 =?iso-8859-1?Q?UmQHBkwkYILHjB6t3iR1gg1ILoZ4oqxK2tKwUe3PqrcRKVzNVsTt02joln?=
 =?iso-8859-1?Q?qBBLo5N+doahsr75SZoizO6uRA6TBKWdYp+BE5QEZKBiUTo+5ufHoSH7t2?=
 =?iso-8859-1?Q?A2VH3jyfHR1CC4bLHUMo3jNN9r2z9/pZb5HAldr3iTjk1MnhyeYNGGp7GR?=
 =?iso-8859-1?Q?GwP+Ptxb210JzXkcSed61DH7S024TMFFQz86KrSbq+iwPXNpyzQQxDfQ5+?=
 =?iso-8859-1?Q?LsVPJ2fa7nXROUhGufHzirBtzwMV8CeaL3DWXozCHIztGElVpqHXNn7qQU?=
 =?iso-8859-1?Q?YDPrJPx+VtDhpMFa2U8gHIZH9zgZLZTSDcXIXoPb9KVdkYXYikgj8baemP?=
 =?iso-8859-1?Q?yJ9e9LTsmIGBlQYALisLBpX9D4uGHgVMDqZo5P7CEqK4QM5qUAocwubqq5?=
 =?iso-8859-1?Q?Sga8H0YIrSUWpFBGjVWNl+whtM35VDpsLOX4s3T6PtVG8Li4P4qMkyLIqo?=
 =?iso-8859-1?Q?Z6eVCovy3gl05LQngLl0qSf6zRndPPxVb7yst0XnDTUXfciIIbWFapyNRv?=
 =?iso-8859-1?Q?p88R6bZWd3lnihoGL8zNv25ZvBpI1KEq0x3j0t2CtGKISNbXyj47/tK5un?=
 =?iso-8859-1?Q?oETU/m4cbht/mYPC57rgzDYV2OrQH03Ihbu44tFNiDRZ1c4S6FRaTJsyKn?=
 =?iso-8859-1?Q?M7SALgbausfBbZ5bEERXvF3AJybXx3cpjZe9tfUxmBeHtcsFmf77hJgOsj?=
 =?iso-8859-1?Q?p6/YaIiwqfX3pOcL2nBiTagNic/qsglb/MQ9Pzsw8NSataSGU+RWQCmTQ4?=
 =?iso-8859-1?Q?ZXJfy/RAmiHTrFlKQVfWBXeBfdIMdNEEKvlK/0XVCIxjqK1i/j97msBlRT?=
 =?iso-8859-1?Q?9LqaqVUxZUmHaTJJHTzABtf7LMs2YCBg4XSOcybP5teXTWzOn0a8QGS5Ua?=
 =?iso-8859-1?Q?cMxCElkwA2F2jJcYdPlqal0JOJfuYq2Mn8DSlTcXe+oALWz+YsoWW4IqWQ?=
 =?iso-8859-1?Q?p42vZUmOfGAKabsWUN/NQL/xYoaOtyVsPXDLmDjp8C62Il+EfBmQmHeiFI?=
 =?iso-8859-1?Q?VR/42hHo/3XAsEfHhKBkbuSbdnIYXbqsl/KvKZ9CkSSQvEpithIzc4Juw/?=
 =?iso-8859-1?Q?5YIJlnb998x//BWJakorv9xO2mvbdeDDTkDh182pXv2Xmd86PGGl7wzlZX?=
 =?iso-8859-1?Q?d9Z8vlFvhUNUKzLZAVuBecaDjgn1jsqUBo7St2MHMwj8wK7JtT7UJvOPd0?=
 =?iso-8859-1?Q?SxMMWp+tDTZ3Ihz8aNxS/35wA18q6BqkLkaeUr85QYDQ19YhocQ7V0TIu3?=
 =?iso-8859-1?Q?/KXINtnuCzpd2zMByCsFkhfsrWZtaUJEanRDwSeBPfuv7fYWS0uZkmqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Lqh2+3iWhzNujORIjMY0/ABT4daDCmMWQ6e36j7rb7o9vsX5JCzClESJHZcYbJGhQXr+fBJO6/mv/8rpp0H56dsRpdv4fVxDxBzyV5EKeVkoVNocu5WOK5gEf54Y4JAJzk+0nkCm/1KbD1fPyPZs5WeVawHyHT4ghwC0nhz0N+YlTGedEueXegKq7de0ijHxAXtahZosKlv2bjDVQj45sMowKbJYbWZPVdpRn0IVITddEZRHcu+F245AbBMXS3mNsNnuJPjaQEoTfRveuG7sdl/ahVUvDYNw85tu+qVF8PRY2MN9UgiC8QMBpXPv89AoxVD/L1HetHr94swdJcF/hrvuHix0kNRQvjX5mmJxU1Npqne+oqOE6BUOqFH2lsfje8v1IU8yn7pOqj0L/ogKbj5ipyCJrWnWC1L5HXkc3kRb30+AQdn7UrjXyBnS/tIr8MY8JrGBdUZY5+3EYh8uy9Vxcz+qjnE8Cs+Oh03wbwF+UmSKKauMBdROyDmrU6P5O2T1r9ICAISTfmiLwOGWqtgZA8by586dcVQ0yyXsL4LRfeNRQpUBfzmz/Zxlx6M2CxF1Dga9lp63ZqRACAMcim7Mod7fGv/V3psDAcx4t/Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fc1e5c-9f32-474f-3a4f-08dd9f55c6d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 08:41:31.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YeCn6qrVhVbDQ9yveC6sqVU3ZE2J/7ym5kZXkPeYi72KO7JkLKwXYpXz8CFBKXRB4qYRqSVQ/GElpBIoKeiBpIQEa4V24Mw9W1XaTggUalc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300072
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA3MiBTYWx0ZWRfXwsqo9XDsF2Ui 0fKjvUZpJk8AuWcOtHc5pPa/y2dRxcNXWTfHQeaNzsowHtAMYTxs5Y/KlQsqTzm+xJLfW2SGLvT ZKc2wzygSCFSLYePvdHJ6+wX30QRtf7mFwTnPsHO9nI58KVct5zl8NTeXQ5c8jQlouh6lR3VBH1
 u6d2Pq+nA+uuFWtRb7VcRP0THJgU7lqM7IiEGLwXyxIjMSGnyJtD+ryc+pJGLg4iG4vSLoPqpVo p7ylShnzi6l6YobuR2W0PAJW2xlxDMWAiHnPytWZ7RCmLHNzUakuqp85x3/woXuh8aeAgkIoFN1 wivmvRMFn0IjpxxYD0Mxo6a1Xxku7LAruWgh/U+M68eOSVCFZyuAUUKYF8a8xM7iQZVDwC4Fniq
 JdNbCLOSBoLhTuSlT1XgXMqZoHRJxGHaJSSV0A6T6mXHRyzqGSfD4OczEVwXq3gyXdINkhj6
X-Proofpoint-GUID: RI9xJiI80gG73zRsuev3e2PwZfbUiJS7
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=68396f3f b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=m4nWpse8auxlaRyR1JsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: RI9xJiI80gG73zRsuev3e2PwZfbUiJS7

On Fri, May 30, 2025 at 10:33:16AM +0200, David Hildenbrand wrote:
> On 29.05.25 18:07, Pu Lehui wrote:
> >
> > On 2025/5/28 17:03, David Hildenbrand wrote:
> > > On 27.05.25 15:38, Pu Lehui wrote:
> > > > Hi David,
> > > >
> > > > On 2025/5/27 2:46, David Hildenbrand wrote:
> > > > > On 26.05.25 17:48, Oleg Nesterov wrote:
> > > > > > Hi Lehui,
> > > > > >
> > > > > > As I said, I don't understand mm/, so can't comment, but...
> > > > > >
> > > > > > On 05/26, Pu Lehui wrote:
> > > > > > >
> > > > > > > To make things simpler, perhaps we could try post-processing, that is:
> > > > > > >
> > > > > > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > > > > > index 83e359754961..46a757fd26dc 100644
> > > > > > > --- a/mm/mremap.c
> > > > > > > +++ b/mm/mremap.c
> > > > > > > @@ -240,6 +240,11 @@ static int move_ptes(struct
> > > > > > > pagetable_move_control
> > > > > > > *pmc,
> > > > > > >                    if (pte_none(ptep_get(old_pte)))
> > > > > > >                            continue;
> > > > > > >
> > > > > > > +               /* skip move pte when expanded range has uprobe */
> > > > > > > +               if (unlikely(pte_present(*new_pte) &&
> > > > > > > +                            vma_has_uprobes(pmc->new, new_addr,
> > > > > > > new_addr +
> > > > > > > PAGE_SIZE)))
> > > > > > > +                       continue;
> > > > > > > +
> > > > > >
> > > > > > I was thinking about
> > > > > >
> > > > > >       WARN_ON(!pte_none(*new_pte))
> > > > > >
> > > > > > at the start of the main loop.
> > > > > >
> > > > > > Obviously not to fix the problem, but rather to make it more explicit.
> > > > >
> > > > > Yeah, WARN_ON_ONCE().
> > > > >
> > > > > We really should fix the code to not install uprobes into the area we
> > > > > are moving.
> > > > Alright, so let's try this direction.
> > > >
> > > > >
> > > > > Likely, the correct fix will be to pass the range as well to
> > > > > uprobe_mmap(), and passing that range to build_probe_list().
> > > >
> > > > It will be great. But IIUC, the range we expand to is already included
> > > > when entering uprobe_mmap and also build_probe_list.
> > >
> > > Right, you'd have to communicate that information through all layers
> > > (expanded range).
> > >
> > > As an alternative, maybe we can really call handle_vma_uprobe() after
> > > moving the pages.
> >
> > Hi David,
> >
> > Not sure if this is possible, but I think it would be appropriate to not
> > handle this uprobe_mmap at the source, and maybe we should make it clear
> > that new_pte must be NULL when move_ptes, otherwise it should be an
> > exception?
>
> Yeah, we should ay least document that if we find any non-none pte in the
> range we are moving to, we have a big problem.
>
> I think the main issue is that vma_complete() calls uprobe_mmap() before
> moving the page tables over.

Well vma_complete() is not _normally_ invoked before moving page tables,
it's mremap that's making things strange :)

That's why I think my suggested approach of specifically indicating that we
want different behaviour for mremap is a reasonable one here, as it special
cases things for this case.

However...

>
> If we could defer the uprobe_mmap() call, we might be good.
>
> The entry point is copy_vma_and_data(), where we call copy_vma() before
> move_page_tables().
>
> copy_vma() should trigger the uprobe_mmap() through vma_merge_new_range().
>
> I wonder if there might be a clean way to move the uprobe_mmap() out of
> vma_complete(). (or at least specify to skip it because it will be done
> manually).

...I would also love to see some means of not having to invoke
uprobe_mmap() in the VMA code, but I mean _at all_.

But that leads into my desire to not do:

if (blah blah)
	some_specific_hardcoded_case();

I wish we had a better means of hooking stuff like this.

However I don't think currently we can reasonably do so, as in all other
merge cases we _do_ want to invoke it.

So I'm kinda not in favour of moving things around just to suit mremap
here.

>
> --
> Cheers,
>
> David / dhildenb
>

Overall I'd suggest the proposed approach is what we need to fix this _in
the short term_ but am obviously happy to see proposals to make uprobe
stuff less 'hacked in' :)

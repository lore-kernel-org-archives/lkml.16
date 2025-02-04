Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC2E13C9D4;
	Tue,  4 Feb 2025 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664379; cv=fail; b=KMq3uPJ60sZCt/7pXA/Wt5PqeECVgVP/yW6CqULkQ5sZJNh/TNi/PjHQK9FHaIm1lAftuA/wQu4ePV8vGDi0X3cRhsRibUzV2TMzn3+AZ0J0uaTdcT1SZjDydqifrCBWWfPeqhb8KMu/NAGA4oYfNOO6RpV2KGrlt6JfdU/P/Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664379; c=relaxed/simple;
	bh=C/60r3of2V27JG6yTXzdJHsoEZ4Px2aibKjiecaPlhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hXbYBkwjgDOyOgpxRpu8a81vz9kFw1bIb5VIEKCPCFqXwzrvVuO4tW+elSbKAUb5VdB91f33HooQ4pfOBXnrUeixIELWsaHqYBCrUhQe21B6ELwFhN5e22Tgv5RfD0D+SEiZ77eUN/7r1rBmhF68Q6u1wk7ICZp97ucWJ99JwRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y/Pff2JZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gWZWMCx4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y/Pff2JZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gWZWMCx4"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5148u9DM024639;
	Tue, 4 Feb 2025 10:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ef3xwUeZ/UqrXb2S8k
	ErWqyGjas8DBKZajASTCW/LmI=; b=Y/Pff2JZQMqVsYRUYtSA2PnYDgXqD+AeNg
	mJPGQ6shuUKfDPWJBfcJeWG4axmt7VrQ8ywXdmixJPGjPbvIC9kC2HW/jKvCkJgW
	OJXZqPllbbRcAnuPcmquI8YI/bJ5rYSQcLg692L4V8GumqYTFqW2j9HGfpNS7ZAw
	VZLWCtq99LkwSVJ9aSI18SvxABgR2AvB3JfIMscKpjvn+Fi4Suh68sedDOb4EEq0
	4/lNtGaQFVYThcTD6gvvliAv1g5xvipt04K7I2WlDmh3neC8AUh6il0DsK4K5+ov
	Jb+Mg/DsYd47jDB01G5LL8/iFrjvCa6fJA4GNCI5bFrv+Q0IQRyw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44kckxgdm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 10:19:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5148w4OT029835;
	Tue, 4 Feb 2025 10:19:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p2t1fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 10:19:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZLquNrQpAcTNMGYHest8BvoWTvtHqq4OZNkD48rLl9m+PvXKtUBjtn2skImjwTfIViGnGn3L8EHegNKln8ek5qnobVsWpvBMxUBdc4hUemNsTOJcpFvV0Ezr0/Ax5UVFW4TPqzq3vENx8udD3SsK57nArAXLbtyzjBEs+nomI7yOGW6Sti9t29xTcmJZsuOjvENt23M40UO5Lh7M3N57yUHdZel+/9CgII7ZCXCeYNQXtdfv5u3DTIix8qsf5yyZUue/kswBSsSNSQMTkq+31NmmNBYDFT/YKm2XYZEfdk/9IJ8SE1PjVpF+vRTrjhMqOlfXe+vqhODvLvd7PvB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ef3xwUeZ/UqrXb2S8kErWqyGjas8DBKZajASTCW/LmI=;
 b=TXaDB9g3tL3X1RepszQZCfyRcgUgP2uf8YlpgFITLWqgyp8odsd7a5JjQUD5ruWO8T1kWhf/h3KZSR6G8BbY2/1XTYXGjiSsYAaQrFq/JYMjHR2/oKKlN950COWTgY2aJbhdMD+89JqwXcvpQBbH9CkQF+I6kNwv3xqtbc5ZxzW2QmNr51jhvV98wGH7iiX4dbCXN17GXaAMpRgJbG6/Snda0iUltc0nPfQbRybjKDdz6At4v/tbyLRQfYmzEnUl6JxtVdbInmg6qAW41oBBN/0F4iT1ZXYIq4ZlMjSMnkm2kjdNBdawl2hwq6vD6hmJyYDe55JMv5vmu+UdyLAezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ef3xwUeZ/UqrXb2S8kErWqyGjas8DBKZajASTCW/LmI=;
 b=gWZWMCx4fzmGOkezNjDcT7QtLFrM7VsopTZMj+cc0CljVdZLj8Hy1IfbHHoDGRMot6pdLdkTYLPckKJ6lUWnzEIefyb3MF7RN4IiGSv0qIaRqJT8pnU5pfcSooR3qNaFbuWUdVQdzKH34HEOihFAh9O4rY62czFC3F6qb8pD63M=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA2PR10MB4618.namprd10.prod.outlook.com (2603:10b6:806:11f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 10:19:20 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 10:19:20 +0000
Date: Tue, 4 Feb 2025 10:19:17 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
        workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
Message-ID: <9be8dd39-d906-4dff-8315-a69481e0accb@lucifer.local>
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
X-ClientProxiedBy: LO4P123CA0550.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::20) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA2PR10MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1fa588-4372-4495-6611-08dd45056349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Srmy/Hwcmnzy8vXxO9Y8+td4c0689+WwcijHYgG2tlaGzaynEpIHQD8soQbR?=
 =?us-ascii?Q?vbWJTlHPeaUMb8PrHVH0idzjYmtdSPdB8optzTBopXLYcc0aV+E3KMYNoj/M?=
 =?us-ascii?Q?Wjr/GGWYOCbvPA5Skhnxrxis1hpRMv7Oh17MhZEjF8uSLaicUJzqW+F1fiaR?=
 =?us-ascii?Q?F+T1DP5DulVa3fgvJ3n0BQ9OCaKWSmJUE6X7uKxJaZtuPNf82uyNoPIB8eeS?=
 =?us-ascii?Q?2/k6y06OPxQ+wEfOARbXJPIK9t6VbjFFVYx9inSzksmCHa9wO/iassVmA9S3?=
 =?us-ascii?Q?SLVHDM3coHnpO3vu626w3xbqYoz251fdPD+ULafcoSyiLIoX8HIv4xejqDLo?=
 =?us-ascii?Q?b0UByHofZ1Lrzg2oSNaDp4JWeo0GAAWkA1ZEkvfMVdD3oxrVtpYNKA+67EWx?=
 =?us-ascii?Q?K354bqMmchOUoPOlRt1gQn1YhRd3/FqGeb5aN5bwjpAGdbHCuIOIC/TOt1SN?=
 =?us-ascii?Q?p+eOefhN46pRPaBjfZsWlXD8sKim1bZP05isW8aESubGi8SohjoTH6C0kw0g?=
 =?us-ascii?Q?SgFakJEzsr3RY9BclFD3Q+z7ZsYYSe7HpIbDEBdTK1EJVOXXpzXh8dVuT9kn?=
 =?us-ascii?Q?b3acYHR4JsSwweZIq0giUfVk6ww0feXN4/fTZClV9jUz3Chll486tcpElBFO?=
 =?us-ascii?Q?IUXHVsbJPFHY3FmnYl1bGDSaeNSSBgITfAdzfODjxCy11SCpeMQ4aqtkZwwR?=
 =?us-ascii?Q?7KRbiLl46rLfPnwRqNRJjpkEj7O+9KwS4/+gt1ayhr79f5D3E/N8pIORLhM/?=
 =?us-ascii?Q?lZIu0m2+xhzSSzEj99JseMk2Sxoj2VaflTeoXgFXSw0rYgHsjGqDUx1qcZqN?=
 =?us-ascii?Q?oC5mC7t7ygelMnXndGp+JZ0qx/avFth/uzUqSsJmTA93mYRrRagMvewPnGRC?=
 =?us-ascii?Q?B7b0MWDuQG7989H6fZGCU/1/GoKjP9oedx2+u2hBZyLZaD02bbV/OCuOMaiQ?=
 =?us-ascii?Q?xunBiUHcfO0rrr81P3Ytka4BUfTaFgf5vygFTQ+cTHeDPnxZc970bK58xa8d?=
 =?us-ascii?Q?+cagpLSLmhEWR1iwhH1QbPLtEifC8sIuNx4frv7eY5EyYf3IR3NnE/fi6zSO?=
 =?us-ascii?Q?5fZ3Ml0uCIlSFLQY0ATBcluIEcHG+A5gC/KZOMgO2LTE/jRhnyf8RIxwNGra?=
 =?us-ascii?Q?hjliwUM2+2QJbeyzVmMoDFHv/NdqCSc6tpyaoUzykr269XAY2/yTK8s6D0qe?=
 =?us-ascii?Q?5KG6jcUn+8c4VmApJwWdCyS8cEWkVYl2zLXY7VKO34YrzMEJWncxUn4H2Bfg?=
 =?us-ascii?Q?Th04/NZWsg6Bgo0jjJu6I2fTR+emvXWiS//9AKpaLFdDqkADljtJ40otZn+6?=
 =?us-ascii?Q?8TsOGhfl5chDEsbk4IyknO+qDYu1qFIlNKWUHUizsvdHgH4VoGzuzLCWFZI8?=
 =?us-ascii?Q?PTxv6Q9CJWpVy332NlI55o7zfIwc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T3PDzz+gc3Gq780i29VB+SpCID2pMrJz+Zw0hhr5V+N0YMC0KRSVCvHbhGgH?=
 =?us-ascii?Q?AF8MDyvLkfQzqEDHe3Ds5+tFBWTB6ml3+SzupXe30DZWtRfj3iruV6KRbHyn?=
 =?us-ascii?Q?cQoRO90bl42zGNV9AVcZDyzgGqLkgKmTkw0nknsqwyviKU4LRJzu4qs7uPqY?=
 =?us-ascii?Q?i4sTD2Muqz3T5w96CmeCT98ICBZwETwirhPr18Vf01iWCGdvjUXkzCGkL4ET?=
 =?us-ascii?Q?vVmABiGDmxUScq9Y7hDUsvR3GqNQuGPHHS+hJejcE+qs00/IdWKz/kTcjfjC?=
 =?us-ascii?Q?qOZdOvEhNBXU9+VfnR8ezZD+hXjfWDazINP1UtKdhC23DObJitHavEuHtABv?=
 =?us-ascii?Q?lhv/G6hl/28XmSJNqIlxF4BtFum1Ew3NjQI/fzpiO3F2iDTTr835rsqr9yyr?=
 =?us-ascii?Q?tP8yYPooOSult59diUTtXiU/Nga4/Q+xFUY4QdAgGtbIfZcJ+hNGz+cKeUdB?=
 =?us-ascii?Q?KG9Y8VkT23yJGdD/F76Sd4Mv269OnenLGUBdoHkaU+V65YHY1h4QaCwViT8q?=
 =?us-ascii?Q?vpltnniRRGSg4ONv8kty8UehEueB5KF1U9tEqwpjsh+VmnzI9fGSXLE3XFvv?=
 =?us-ascii?Q?lEVSBIWErp6phT4twDmCXH1u3cNfufpRTAYfZdnglG+GIDG6BBWL5Xdni04o?=
 =?us-ascii?Q?r8qKfebJpIDYdgqQfV9mjBa6ACemfoQR3ZitiRWo8tR+lQXwHbRNxtmDbgF9?=
 =?us-ascii?Q?1VXNArePXkteKcFi/XjVOMOuIgmKCFQj/k6/PT4dPdyYefGrO4zvonHVvPpA?=
 =?us-ascii?Q?BvjDonq5uNGUthng13ogTzsB+Bvr5Ywl1MgOtkNcQ9YhDWTEtZbMeWAxtrMP?=
 =?us-ascii?Q?oXXq2INoet5fB7yOIf0wyULS/fpxw5xFTsNnwDgOYNO6A3QrnoZ9Bojjf8iI?=
 =?us-ascii?Q?8Z5XURITJz1JVP0MN+sCW0wDBPe28BX7OppQBsW4mWEeXRMDEl66tNV/nHoQ?=
 =?us-ascii?Q?pnRsJmAdPyH+WWQOEtrdPOcsK7WiRr1eMYpqGt2gp9FvsWzbQEo7ubZtnYY4?=
 =?us-ascii?Q?6P5SCrZTutNdA7A+p9DscYZ5GLW5BfC6weX5Sm8ciqp3U9H91A/SxIjCnVdy?=
 =?us-ascii?Q?fJiFtFeNKwZThaGqqCZU++aWmPD0nH1oynv4YLG3qMOcc6m2kmxnSBeeETSh?=
 =?us-ascii?Q?/4fhrczqMut9b8jU8+Kf1oeGzt5RBjf4AqGufYcFj3UK1o7ueD0SvU2YrTZW?=
 =?us-ascii?Q?y3kuvxOd+cF/GN3EAORqLjiQ1Vbh718e1VW1Z7xvT/r1cGJd0RRavxPGDdRG?=
 =?us-ascii?Q?uUaA86B9+rB9heKdDfPtKCn7gsKfrkw1G9pusR2H77dqaWrb8atXb62VUDIj?=
 =?us-ascii?Q?zINqV96gvk7ZJQNkbtf3wYm5ZgKIj/22XJXIl8V/r7a74kxRSCufa+F/d4zF?=
 =?us-ascii?Q?tdb9HcEBjuYhXiJQ7xR1vbfZk/ud/QFaudVgaKIWB+LxR6wh9tLwfTyKlpng?=
 =?us-ascii?Q?x2KMdUO6U8ytFxRYh7TDnitFTXOHPTQcpliNAd6K2CfULFJy37UN0pPzCmIE?=
 =?us-ascii?Q?S4XIr4mx7wqD2jivNKqasr74jrhfrCir3n7Up9ZOWOGzcyVoSkfwZE+BhOax?=
 =?us-ascii?Q?1ksem26J0xRQQBqU4NciwxYjEN0DQU/a85BvVzG8csShFYdFM/W05wPfWSG5?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l0UlZzItf4fnvNUUJZTTakxZjonbJMBRv5/NqLwtW3RZoiJrCImU8o7h5RUvyxjQhUgJkxvJfKO0DzXAcx4+huetqrYnZbLwtD0eLMmuXIJGLPDgF3HTcmYutVWRSA78gIgas5F41SdEuXdlaWOGjwatCRhrPIgr/E+yDKO7YYT5PxgP7HHmjUZQF34LVXsRnXx2MPO+wkNX3m1SqMYmMri0oeG/3e+KRRaXL9gDeE6HhDCLe7wvOQVyNGkieXtGSh0C7NE5mD45+otarGMu47FyW2xynKJM5OOeUjYhbN2V/j/4yFt6EfQ/ATJgP7hqQV/Z2QgENypmDFm1ac/PFX5CqPpCVoA1RhtNCuaS9dchVH/xmePdmq/4Ua7DhiTJjwWD4kVzTGxuUKKkzScewp3Kff0mChbsq/IqXNwlkgcuB3NFlDf+S+hOywDA9erhEsch0G7O9t4riZW4NbRHagV73nbDPYQAzAQJni6h0fkLkPL4f2GcQy/sBd1CmOJbXOYq/tjU4Tulv4WsRQvXVxAqTuRDVJcKzBGxpI2pnY2hrH3GZxgXqhzPMYnafwychXIJP6iRaZVwe2KiL/pAISA+vDBUQJHSCvMJ6eNXuxE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1fa588-4372-4495-6611-08dd45056349
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 10:19:20.0410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCU7NvIDbsmXXbT2gpr9pWqI9zC8Swx8jdpFDPA5d1/BStkrUUm3L4DhW5uhXn6zH5JO4c2Nc7qoOsGkIKNOKkkji5T+WpgTBe2xp2IoNTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4618
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040082
X-Proofpoint-GUID: a-1a-LFtwL-B5ZK7mwTPyb028knjKASe
X-Proofpoint-ORIG-GUID: a-1a-LFtwL-B5ZK7mwTPyb028knjKASe

On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> The subsystem status is currently reported with --role(stats) by
> adjusting the maintainer role for any status different from Maintained.
> This has two downsides:
>
> - if a subsystem has only reviewers or mailing lists and no maintainers,
>   the status is not reported (i.e. typically, Orphan subsystems have no
>   maintainers)
>
> - the Supported status means that someone is paid for maintaining, but
>   it is reported as "supporter" for all the maintainers, which can be
>   incorrect. People have been also confused about what "supporter"
>   means.
>
> This patch introduces a new --substatus option and functionality aimed
> to report the subsystem status separately, without adjusting the
> reported maintainer role. After the e-mails are output, the status of
> subsystems will follow, for example:
>
> ...
> linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> LIBRARY CODE status: Supported
>
> In order to allow replacing the role rewriting seamlessly, the new
> option works as follows:
>
> - it is automatically enabled when --email and --role are enabled
>   (the defaults include --email and --rolestats which implies --role)
>
> - usages with --norolestats e.g. for git's --cc-cmd will thus need no
>   adjustments
>
> - the most common Maintained status is not reported at all, to reduce
>   unnecessary noise
>
> - THE REST catch-all section (contains lkml) status is not reported
>
> - the existing --subsystem and --status options are unaffected so their
>   users will need no adjustments
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

This LGTM afaict, and makes sense, so:

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  scripts/get_maintainer.pl | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 5ac02e19873722d0f5bf3ac8de8374338c7bddc3..da7fc70f17cd8d46b45da8db0b2029bb11b25af1 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -50,6 +50,7 @@ my $output_multiline = 1;
>  my $output_separator = ", ";
>  my $output_roles = 0;
>  my $output_rolestats = 1;
> +my $output_substatus = undef;
>  my $output_section_maxlen = 50;
>  my $scm = 0;
>  my $tree = 1;
> @@ -269,6 +270,7 @@ if (!GetOptions(
>  		'separator=s' => \$output_separator,
>  		'subsystem!' => \$subsystem,
>  		'status!' => \$status,
> +		'substatus!' => \$output_substatus,
>  		'scm!' => \$scm,
>  		'tree!' => \$tree,
>  		'web!' => \$web,
> @@ -314,6 +316,10 @@ $output_multiline = 0 if ($output_separator ne ", ");
>  $output_rolestats = 1 if ($interactive);
>  $output_roles = 1 if ($output_rolestats);
>
> +if (!defined $output_substatus) {
> +    $output_substatus = $email && $output_roles;
> +}
> +
>  if ($sections || $letters ne "") {
>      $sections = 1;
>      $email = 0;
> @@ -637,6 +643,7 @@ my @web = ();
>  my @bug = ();
>  my @subsystem = ();
>  my @status = ();
> +my @substatus = ();
>  my %deduplicate_name_hash = ();
>  my %deduplicate_address_hash = ();
>
> @@ -651,6 +658,11 @@ if ($scm) {
>      output(@scm);
>  }
>
> +if ($output_substatus) {
> +    @substatus = uniq(@substatus);
> +    output(@substatus);
> +}
> +
>  if ($status) {
>      @status = uniq(@status);
>      output(@status);
> @@ -859,6 +871,7 @@ sub get_maintainers {
>      @bug = ();
>      @subsystem = ();
>      @status = ();
> +    @substatus = ();
>      %deduplicate_name_hash = ();
>      %deduplicate_address_hash = ();
>      if ($email_git_all_signature_types) {
> @@ -1073,6 +1086,7 @@ version: $V
>      --remove-duplicates => minimize duplicate email names/addresses
>      --roles => show roles (status:subsystem, git-signer, list, etc...)
>      --rolestats => show roles and statistics (commits/total_commits, %)
> +    --substatus => show subsystem status if not Maintained (default: match --roles)"
>      --file-emails => add email addresses found in -f file (default: 0 (off))
>      --fixes => for patches, add signatures of commits with 'Fixes: <commit>' (default: 1 (on))
>    --scm => print SCM tree(s) if any
> @@ -1335,7 +1349,9 @@ sub add_categories {
>      my $start = find_starting_index($index);
>      my $end = find_ending_index($index);
>
> -    push(@subsystem, $typevalue[$start]);
> +    my $subsystem = $typevalue[$start];
> +    push(@subsystem, $subsystem);
> +    my $status = "Unknown";
>
>      for ($i = $start + 1; $i < $end; $i++) {
>  	my $tv = $typevalue[$i];
> @@ -1386,8 +1402,8 @@ sub add_categories {
>  		}
>  	    } elsif ($ptype eq "R") {
>  		if ($email_reviewer) {
> -		    my $subsystem = get_subsystem_name($i);
> -		    push_email_addresses($pvalue, "reviewer:$subsystem" . $suffix);
> +		    my $subs = get_subsystem_name($i);
> +		    push_email_addresses($pvalue, "reviewer:$subs" . $suffix);
>  		}
>  	    } elsif ($ptype eq "T") {
>  		push(@scm, $pvalue . $suffix);
> @@ -1397,9 +1413,14 @@ sub add_categories {
>  		push(@bug, $pvalue . $suffix);
>  	    } elsif ($ptype eq "S") {
>  		push(@status, $pvalue . $suffix);
> +		$status = $pvalue;
>  	    }
>  	}
>      }
> +
> +    if ($subsystem ne "THE REST" and $status ne "Maintained") {
> +	push(@substatus, $subsystem . " status: " . $status . $suffix)
> +    }
>  }
>
>  sub email_inuse {
> @@ -1903,6 +1924,7 @@ EOT
>  		$done = 1;
>  		$output_rolestats = 0;
>  		$output_roles = 0;
> +		$output_substatus = 0;
>  		last;
>  	    } elsif ($nr =~ /^\d+$/ && $nr > 0 && $nr <= $count) {
>  		$selected{$nr - 1} = !$selected{$nr - 1};
>
> --
> 2.48.1
>

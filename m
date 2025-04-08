Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D872B19DF6A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104622; cv=fail; b=pSiPHUEmcm4ajoGqPJAiEaGQ53yIHhtGDG00kpAKzCtaJk9oR527Eftr2ggucp0s9uFJ2CcJ7CKlIlzqSI239OMYzHaErHsyqwjCWlSsIcd6iHzIqpIRuvudSnnP2NIdoEAEhXeWpEqeRH2Oi4ngpt6xADE6nX0YbPzlti9ZwJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104622; c=relaxed/simple;
	bh=ZHf6m5rO8DMr+OmwhouJl1F+7AJ8d1KjYwBPUm9hgv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cmBgH7cQ7QVom3vWs00a+iMOYx7mIcrsFO8aOCePm0YoNmK90G+qWI68IXNiHHHNVLReVEIiezDyetwwIpuoZKwYtVV6OjKhYXi5ZnU/HHglAfjkF+qW3B+Ie5BmoNbP4x31jtYEql/O+5BdBDcOl2YskrV4n940+AWNP9LcOf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TzBdMgLB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sVdaHYN9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TzBdMgLB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sVdaHYN9"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5381uwPQ015387;
	Tue, 8 Apr 2025 09:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=d+uXZYtT7o1SVExMTK1hm54h6SgNkV1DbNSIzYI3ToU=; b=
	TzBdMgLBaw3fgYQczYlEQtbrWR+tCro1AoMe8W4G/vh8asWFEjZeHCQxUNkzl+iU
	U9UmhUNb6cT/b2QbOu07me+Lcs6t2ZNMyI3572xZrBOOMCLq4EoZj3b1EeMPtcGd
	Mn4PoKm6LU4sZxpsX1NWpdiN9PbYTAxj+oeUr0bUaYs1cBApj6rEM2JlLEgMTNEE
	PPLbVlZfZl4I4gGi4eK0PKmvkauhJeS835TYYAFHzowF1CnFAxMrpC8qHL+eOsMc
	9wcP1eCH+7VM3b7e+vhh5/SIhYpgvWTX+i/qyhXKGkpvyrRxabAvVxGYvaJm+OpI
	UpylxGRYt0NwGVHtsIP3Cw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tua2vcje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 09:29:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5388CqjU001275;
	Tue, 8 Apr 2025 09:29:44 GMT
Received: from outbound.mail.protection.outlook.com (mail-westcentralusazlp17010004.outbound.protection.outlook.com [40.93.6.4])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty915gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 09:29:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2LCvtYHc/V21BPQOtnWj7BvBpZ5DtrtQbicEGn7dQA5rtDQETXXtvSJuEMuTJ2W31zB8XTD96VJUjs/z8ZVrfLvjXCvh73Mn+lZkvPgt8ECao9M77jEgYDVMpPFKhT5wgu1+kfs7Cl29VQYMeQiQ52Yg+o+KdjhitaBscZD/klx4R7i9YiM/63X/xiqBrzYEGHLqajRss84lNurQyqOFZK7WJXXvNL+bt25jzOos/KryfNGzXklV5b7ULFjCyrOIVH7XGboy+EIoFrkZ56KFKEIXh3N/qNtqiI/O7q1Fm1mGjcvQURkhW7+DnB59aHX6KghSNYWFmm0ceQtky2s5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+uXZYtT7o1SVExMTK1hm54h6SgNkV1DbNSIzYI3ToU=;
 b=OnIA9Fl0RpXvGTp8mu7gOMq97JFvIBZMdsGa0vyuHuSXfaS44pG0tTzGvuDdeXpKWzsbgqtYIReN6bptNUTJV3d/yEtgjyJbGukKFYWzB3sOkoRzZ1tmGs3II2Aacgo5lS+DyMREi/F9m0Jdb9FclU0QidDNPNQ0lxd560+hY39wjkkf97v2a0w+qHizQcxSexf9/R/uOhbGg8mUCZdN9Osk1LQECROvUlme7W0BvIc6x4CgA1Yym/V/1fmhhnzTlPBFQpKz9YNxH8l9fyU00vn89sXLl2pkLQXReQm+LFId1rxBoDMCB4G5rcojG9Jy3fIC3Qfjf5x9z6UriuDVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+uXZYtT7o1SVExMTK1hm54h6SgNkV1DbNSIzYI3ToU=;
 b=sVdaHYN9aq8lX1BatUZDgxYW9wvwViYXehM8G7S/n+aeIF40aciQauBXjm5fuQNIqfnVV4KpxsCh6mTkeILouTSvXcIiNlAW4ALTRmANXSjrZsVIwwnSL84O4oc2622YvNJdFiRsCuK3BYywbOhwjq672S/xGTgwTYNNqqRugvM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB7244.namprd10.prod.outlook.com (2603:10b6:930:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 09:29:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 09:29:41 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] mm/vma: fix incorrectly disallowed anonymous VMA merges
Date: Tue,  8 Apr 2025 10:29:31 +0100
Message-ID: <18c756fc9eaf7ad082a710c91133b8346f8cd9a8.1744104124.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744104124.git.lorenzo.stoakes@oracle.com>
References: <cover.1744104124.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1a6dfd-bc4a-4e47-3e0e-08dd767fe423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7wpmGvxQW2AlaCqLU0hOJLfvqrhXxd2Dvs0BN4PR98Hja3f2Y3ks/POBTMzT?=
 =?us-ascii?Q?4fYOg1yPO3nnQmECd2bqbyaq4Es0DR0weoNPD3LQQ/zU9UY5/nsYx9KOjwwj?=
 =?us-ascii?Q?gJqgQZvBuPqI9Cf6C+tJm5mM8liyHC+XaKhleKQU+tmEUJtlErJXyT6CcjjL?=
 =?us-ascii?Q?8XBa6VaPr6tFr8Xw9D6j1E+10wkj84yepnUi3b2k+lyhJ0KXQ3NkqkTnse+e?=
 =?us-ascii?Q?+AKC03WPDLFge52MN+C4afXy53pwgnhk1ddmKW5k6GQIiHqerl7gdSRDBFSj?=
 =?us-ascii?Q?DZpCrjLj+fQuvsDILsMBI4AOOhOpi92Q9kdEqpC5BUcj9UFgCyjLdRM2tgfg?=
 =?us-ascii?Q?Gb8oKNJ5Ec7+yyWXfLMQ+ftjJNo2Q10FATX68AvRNanPZRN3VZhUQmKFUXPK?=
 =?us-ascii?Q?dj1MzxS6d2JrlIQQijBhFxDxoAYpayG+QwbEdVeCtv0/0om/jAR6hkl+A16V?=
 =?us-ascii?Q?PXdmFuLPThJ9GOFh2ebn42QA9UAikORrlHUWSyXqDFkVSv04A/3s3zfLKV6k?=
 =?us-ascii?Q?D5UgfVH3JTVIZQxY721iCsS8ZI5dKt+62NThrI0bxwIvwrPXXMkd3XRgxMYf?=
 =?us-ascii?Q?rlvV8Y12OxOTJrdm+hyBXFI2Z014HZ0C0wYmauS4DIL76+mGwpS/xq+hB9kR?=
 =?us-ascii?Q?FWppVtzA8X8ISI+WnPWjrVhkgnPdbvD/toFkpTXXD25vGvoLhkEIQmX1sVp/?=
 =?us-ascii?Q?xRVPtN97dt0FFmX2tho5E3EjbgC6mHNez0R6lM19Lq5CxIdrtfQdEqccKhFu?=
 =?us-ascii?Q?qX74QHbdXd7wvYS+GJKY6CKp543yMQT01TYw68m4bjgsVNgJgyCCShguBM2S?=
 =?us-ascii?Q?/QEEZX+uaUdSXwRgpTk4fd/tTjifFTiPFNkoFasW96E/TNEAy0FdIVMMm4ty?=
 =?us-ascii?Q?uA1FpoiDRET9WEovm74Emv0MphpvYD5b1HEgUDXXLTemdYYholCe2UCsDU5w?=
 =?us-ascii?Q?s3ziM2IcBrAyp/KXZUPZCV7H6iIbXZeNA2O0wTR4yrS6J9b8TVXRmajdphNu?=
 =?us-ascii?Q?bfDj95fMLYYm5zxLm7I7in7La4fmLL0ujIkZYO5jtbbgcJQmJUH2t5LA9qxu?=
 =?us-ascii?Q?he5dBsebZwe1MaTAeO1FHKrxeHeEnCjiKuvCOoOAjKs0m0F7CE9K6G2C/p9b?=
 =?us-ascii?Q?EHWPywphPYQHQxrQfOjYhG7gNXIhWKtYtk0LsuqgjMZ80DWGBTMXwBQsg7DF?=
 =?us-ascii?Q?R7QsRTQSfNz/pqFHlFNI+nzGCBJ6J1YAS2gEEIk4gPmxc87uiz7FruERJ99j?=
 =?us-ascii?Q?W1W7bnOKOOz65xSwKDvccKbBIQI8hCViw9eJc84KiQvIjbG8OR6MnutX/XA7?=
 =?us-ascii?Q?tuJ+jbMlAC6SVQ2/gudtw6ISFfAHqlqXxGZu/SnGtIbFsATEx6vYKdQusETD?=
 =?us-ascii?Q?+/4EKFW5TGTuZUV5T0F7bJROxLUH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bon+v8MeP46xVRHyFVpfbqj/7YgALTGjZbprj/qDdFCH5k3Z/OHMAEsllYq5?=
 =?us-ascii?Q?SIV11zwnXQuh3f8G9x8Ua/aqjWpaq6/faVTfTFyf6XQZzHqxSrvfb8q/09dD?=
 =?us-ascii?Q?4kVZ1GFmClTRUU3HbsdIinzt+F6/fO93ifGV8PL9U53kJUQ34qXSw3pg0qik?=
 =?us-ascii?Q?fDJeuO3WndWIaSOsZSQZel5+IOIhwylH/vhk1zbeHmb93WGhNGVWYeW5TXQh?=
 =?us-ascii?Q?xgXxL+dNRJiIJkoPSQ35mXO7e49isvKH3V5EGkIIJoRsACAImAoKRWsH49gb?=
 =?us-ascii?Q?ZDi0diaiza0Ku1D1hVpeNsMQAB7bGZla9mp/j7sRqftPD1VFGve9mOeAXqrB?=
 =?us-ascii?Q?fOFKZpySuIR89RuwCh4mVFGqvZBOACcEBKclqLincF2vO8QbUcY4pRrl/BDZ?=
 =?us-ascii?Q?BRxZvT+FfxM5+ykAHjsyaF3aBN19JzaJFVffSnz8O9fxA6VBqA9iKWtm0aVr?=
 =?us-ascii?Q?94oWoaIltnYKHwj/HE3yJLli4hjIcpcATPmJvGmvdt+Ul97bkssgJoi2gQ5C?=
 =?us-ascii?Q?ErWQJ5UgurQpxPeQ7nwnmrjgq7V8Jdar1bRTjgeVGLnzTFEpUaEKHmPZVviW?=
 =?us-ascii?Q?1wgh1P/hCFPZqPfRjlT2S1XsErwyFgSK8QCU6P8Y+xY7QDOd9hgDdjgjfyx0?=
 =?us-ascii?Q?Ft4mcvEO2gf/cz6skFitOkF/Zrwue53gZegYBJj747Rnou3f2SzuqWp63Gpz?=
 =?us-ascii?Q?bNXG3ZuMT0Zm+DUD7Hxxptq9MfVwXGSBcx+adYOSglEAdibSjufuhCJIOZKf?=
 =?us-ascii?Q?GxzsahUBgdeLsHYf3PFNFcgNUUKNBemVA2p8xFJ2jLzw7DMU0TeLB8+TFT8S?=
 =?us-ascii?Q?XXeyvfiaFYZgY8WuSf6U+kp4Kx34AfP7gu1SREpC1X2cbTCBbgqCPa+A1R+q?=
 =?us-ascii?Q?q5XvG+L1jKNWIQQc+pY5zrSHKZTszNap35itoPXFxNHp1wDU7rHkhF+JYDHl?=
 =?us-ascii?Q?lsihkRSn3reROts0auIPqdlVaRSbE6+B2vyYmSfQbdAGMwDKID9USRykKpM4?=
 =?us-ascii?Q?X/J0+SfaH7M+pjGHFY6q59KaUSlwuJELpGR9HAd+FigTPDUqmxLKlJEsHXjd?=
 =?us-ascii?Q?xBCJyvdAPmDHGPN/yh6svGZ7tLT3aGg/nzwGQMFjoqOqVnqdP1rw1Ya65mzJ?=
 =?us-ascii?Q?0Zz+KaCSrprYac0SudMhBHPc95bAdIKFUUJRjBmd6jPSSRqPl+jjDzH/4PbS?=
 =?us-ascii?Q?DRLZdelAjrLdmihGVZAwvUkDuuNj12tdth6HrwsiohduXqVYdmp8/EzjuHgY?=
 =?us-ascii?Q?IncVx2U43aocJihh/5gUR5ZFQnKJtGauDhoWEP4UYbExcjHYQhL8MXmhyYZD?=
 =?us-ascii?Q?EJ3Zv6vpxTRPUsOQYYMc5TgLViOLC2orC29uv3mLWDWtt4N56V7cUSdY1CbT?=
 =?us-ascii?Q?COlfkg8JyHEABKs+ufhrVeY1qlIYlb9a/KnjfI5n8/vVE7a0iIt4+ocSHCD1?=
 =?us-ascii?Q?htFKjaQ+bqHy+fM4AYTz0Do+/qWXMc2ZXP7d3e4TjHn2NJBvN0UIMV5+uCWD?=
 =?us-ascii?Q?hp18qKOnIwnDpYA/ySxrh2wd7WETKHRb94Q/KwMegdDnr4yz959X5mAU8Ftq?=
 =?us-ascii?Q?zYwCZJMIp0PvcMoOUN4aBIUxHWkc/+6Lr44TbvlK7zu5KCNngFR3X8tZ8jEx?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f8aDLZJW825PPjJaVpAb7CTNcrBjS2H/A3D+rdhcQMK1BASjmTLGYox1YjbQSePVXkJwfJN/nAdQhF72ARfJ2lMStrJ1JeY7hBjYujkDF4UPjL9xwb2bc2VySoPWIneDIwQ2EysnfIW7jQAWNqP00oxCYFVLWMXsWD/Wtut0C3uCyYMjIwUuBY771ec79LEgerMYQw2xKl8tQ7SEKcAXt92vEDxPrdQpwAXReFQ894/Ouk+nO+PWmYDQW5o5kFCMMcSVgopObHy8lB5/v16qukrHoS0rNeVtBK/ovA02nZ3fbA+OB7v4igPoQuYJlYSX9pJUpjXCkZ9L3lhqNb32srgR2GtnyyhkKrpyvE+t6QRu3pdbOGMTk6dbVQpuS/gXuKyt3CxQKXmmdAcOVuVuExEG4ToQoxigBAu4aITDi02nciwRF28x/1QTp8n8l1umqxl1ZnTFRY1UdSWD+ZLyKB6xvfahbgrngAc4x47exuJ1C9qF1CzglaBuqJ62zZXcGkgAIEugyXSoypGKnw452WctlpZPlWUTYm9xjz5pJ3Rgarm+kVsK7zcUvQqzmSO1pu7bsPcpG0kK26to2Ojj1tafA+0MVjxLvB2kIaJTPuo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1a6dfd-bc4a-4e47-3e0e-08dd767fe423
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:29:41.8133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1YHWgc5jXk2/SpJaguyWIsrx3Ar2W5J8aZg7XyDS7gDDio4M5XDvtkEWclqYia5lTWpbjB77nOX4O0tG8k7c/UX52efv17d8E4cCozgdNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7244
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080067
X-Proofpoint-GUID: y356gagVj-Lg6OrZO2gKifaYy7wU8MjN
X-Proofpoint-ORIG-GUID: y356gagVj-Lg6OrZO2gKifaYy7wU8MjN

anon_vma_chain's were introduced by Rik von Riel in commit 5beb49305251 ("mm:
change anon_vma linking to fix multi-process server scalability issue").

This patch was introduced in March 2010. As part of this change, careful
attention was made to the instance of mprotect() causing a VMA merge, with one
faulted (i.e. having anon_vma set) and another not:

		/*
		 * Easily overlooked: when mprotect shifts the boundary,
		 * make sure the expanding vma has anon_vma set if the
		 * shrinking vma had, to cover any anon pages imported.
		 */

In the modern VMA code, this is handled in dup_anon_vma() (and ultimately
anon_vma_clone()).

This case is one of the three configurations of adjacent VMA anon_vma state
that we might encounter on merge (where dst is the VMA which will be merged
into and src the one being merged into dst):

1.  dst->anon_vma,  src->anon_vma - These must be equal, no-op.
2.  dst->anon_vma, !src->anon_vma - We simply use dst->anon_vma, no-op.
3. !dst->anon_vma,  src->anon_vma - The case in question here.

In case 3, the instance addressed here - we duplicate the AVC connections
from src and place into dst.

However, in practice, we very often do NOT do this.

This appears to be due to an inadvertent consequence of the change
introduced by commit 965f55dea0e3 ("mmap: avoid merging cloned VMAs"),
introduced in May 2011.

This implies that this merge case was functional only for a little over a
year, and has since been broken for ~15 years.

Here, lock scalability concerns lead to us restricting anonymous merges
only to those VMAs with 1 entry in their vma->anon_vma_chain, that is, a
VMA that is not connected to any parent process's anon_vma.

The mergeability test looks like this:

static inline bool is_mergeable_anon_vma(struct anon_vma *anon_vma1,
		 struct anon_vma *anon_vma2, struct vm_area_struct *vma)
{
	if ((!anon_vma1 || !anon_vma2) && (!vma ||
		!vma->anon_vma || list_is_singular(&vma->anon_vma_chain)))
		return true;
	return anon_vma1 == anon_vma2;
}

However, we have a problem here - typically the vma passed here is the
destination VMA.

For instance in vma_merge_existing_range() we invoke:

can_vma_merge_left()
-> [ check that there is an immediately adjacent prior VMA ]
-> can_vma_merge_after()
  -> is_mergeable_vma() for general attribute check
-> is_mergeable_anon_vma([ proposed anon_vma ], prev->anon_vma, prev)

So if we were considering a target unfaulted 'prev':

	  unfaulted    faulted
	|-----------|-----------|
	|    prev   |    vma    |
	|-----------|-----------|

This would call is_mergeable_anon_vma(NULL, vma->anon_vma, prev).

The list_is_singular() check for vma->anon_vma_chain, an empty list on
fault, would cause this merge to _fail_ even though all else indicates a
merge.

Equally a simple merge into a next VMA would hit the same problem:

	   faulted    unfaulted
	|-----------|-----------|
	|    vma    |    next   |
	|-----------|-----------|

can_vma_merge_right()
-> [ check that there is an immediately adjacent succeeding VMA ]
-> can_vma_merge_before()
  -> is_mergeable_vma() for general attribute check
-> is_mergeable_anon_vma([ proposed anon_vma ], next->anon_vma, next)

For a 3-way merge, we'd also hit the same problem if it was configured like
this for instance:

	  unfaulted    faulted    unfaulted
	|-----------|-----------|-----------|
	|    prev   |    vma    |    next   |
	|-----------|-----------|-----------|

As we'd call can_vma_merge_left() for prev, and can_vma_merge_right() for
next, both of which would fail.

vma_merge_new_range() (and relatedly, vma_expand()) are not impacted, as
the new VMA would never already be faulted (it is a proposed new range).

Because we already handle each of the aforementioned merge cases, and can
absolutely therefore deal with an existing VMA merge with !dst->anon_vma,
src->anon_vma, there is absolutely no reason to disallow this kind of
merge.

It seems that the intention of this patch is to ensure that, in the
instance of merging unfaulted VMAs with faulted ones, we never wish to do
so with those with multiple AVCs due to the fact that anon_vma lock's are
held across both parent and child anon_vma's (actually, the 'root' parent
anon_vma's lock is used).

In fact, the original commit alludes to this - "find_mergeable_anon_vma()
already considers this case".

In find_mergeable_anon_vma() however, we check the anon_vma which will be
merged from, if it is set, then we check
list_is_singular(vma->anon_vma_chain).

So to match this logic, update is_mergeable_anon_vma() to perform this
scalability check on the VMA whose anon_vma we ultimately merge into.

This matches existing behaviour with forked VMAs, only we no longer wrongly
disallow ALL empty target merges.

So we both allow merge cases and ensure the scalability check is correctly
applied.

We may wish to revisit these lock scalability concerns at a later date and
ensure they are still valid.

Additionally, correct userland VMA tests which were mistakenly not
asserting these cases correctly previously to now correctly assert this,
and to ensure vmg->anon_vma state is always consistent to account for newly
introduced asserts.

Fixes: 965f55dea0e3 ("mmap: avoid merging cloned VMAs")
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/vma.c                |  81 +++++++++++++++++++++++---------
 tools/testing/vma/vma.c | 100 +++++++++++++++++++++-------------------
 2 files changed, 111 insertions(+), 70 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index 839d12f02c88..8a6c5e835759 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -57,6 +57,22 @@ struct mmap_state {
 		.state = VMA_MERGE_START,				\
 	}
 
+/*
+ * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
+ * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
+ * would mean a wider range of folios sharing the root anon_vma lock, and thus
+ * potential lock contention, we do not wish to encourage merging such that this
+ * scales to a problem.
+ */
+static bool vma_had_uncowed_parents(struct vm_area_struct *vma)
+{
+	/*
+	 * The list_is_singular() test is to avoid merging VMA cloned from
+	 * parents. This can improve scalability caused by anon_vma lock.
+	 */
+	return vma && vma->anon_vma && !list_is_singular(&vma->anon_vma_chain);
+}
+
 static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_next)
 {
 	struct vm_area_struct *vma = merge_next ? vmg->next : vmg->prev;
@@ -82,24 +98,28 @@ static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_nex
 	return true;
 }
 
-static inline bool is_mergeable_anon_vma(struct anon_vma *anon_vma1,
-		 struct anon_vma *anon_vma2, struct vm_area_struct *vma)
+static bool is_mergeable_anon_vma(struct vma_merge_struct *vmg, bool merge_next)
 {
+	struct vm_area_struct *tgt = merge_next ? vmg->next : vmg->prev;
+	struct vm_area_struct *src = vmg->middle; /* exisitng merge case. */
+	struct anon_vma *tgt_anon = tgt->anon_vma;
+	struct anon_vma *src_anon = vmg->anon_vma;
+
 	/*
-	 * The list_is_singular() test is to avoid merging VMA cloned from
-	 * parents. This can improve scalability caused by anon_vma lock.
+	 * We _can_ have !src, vmg->anon_vma via copy_vma(). In this instance we
+	 * will remove the existing VMA's anon_vma's so there's no scalability
+	 * concerns.
 	 */
-	if ((!anon_vma1 || !anon_vma2) && (!vma ||
-		list_is_singular(&vma->anon_vma_chain)))
-		return true;
-	return anon_vma1 == anon_vma2;
-}
+	VM_WARN_ON(src && src_anon != src->anon_vma);
 
-/* Are the anon_vma's belonging to each VMA compatible with one another? */
-static inline bool are_anon_vmas_compatible(struct vm_area_struct *vma1,
-					    struct vm_area_struct *vma2)
-{
-	return is_mergeable_anon_vma(vma1->anon_vma, vma2->anon_vma, NULL);
+	/* Case 1 - we will dup_anon_vma() from src into tgt. */
+	if (!tgt_anon && src_anon)
+		return !vma_had_uncowed_parents(src);
+	/* Case 2 - we will simply use tgt's anon_vma. */
+	if (tgt_anon && !src_anon)
+		return !vma_had_uncowed_parents(tgt);
+	/* Case 3 - the anon_vma's are already shared. */
+	return src_anon == tgt_anon;
 }
 
 /*
@@ -164,7 +184,7 @@ static bool can_vma_merge_before(struct vma_merge_struct *vmg)
 	pgoff_t pglen = PHYS_PFN(vmg->end - vmg->start);
 
 	if (is_mergeable_vma(vmg, /* merge_next = */ true) &&
-	    is_mergeable_anon_vma(vmg->anon_vma, vmg->next->anon_vma, vmg->next)) {
+	    is_mergeable_anon_vma(vmg, /* merge_next = */ true)) {
 		if (vmg->next->vm_pgoff == vmg->pgoff + pglen)
 			return true;
 	}
@@ -184,7 +204,7 @@ static bool can_vma_merge_before(struct vma_merge_struct *vmg)
 static bool can_vma_merge_after(struct vma_merge_struct *vmg)
 {
 	if (is_mergeable_vma(vmg, /* merge_next = */ false) &&
-	    is_mergeable_anon_vma(vmg->anon_vma, vmg->prev->anon_vma, vmg->prev)) {
+	    is_mergeable_anon_vma(vmg, /* merge_next = */ false)) {
 		if (vmg->prev->vm_pgoff + vma_pages(vmg->prev) == vmg->pgoff)
 			return true;
 	}
@@ -400,8 +420,10 @@ static bool can_vma_merge_left(struct vma_merge_struct *vmg)
 static bool can_vma_merge_right(struct vma_merge_struct *vmg,
 				bool can_merge_left)
 {
-	if (!vmg->next || vmg->end != vmg->next->vm_start ||
-	    !can_vma_merge_before(vmg))
+	struct vm_area_struct *next = vmg->next;
+	struct vm_area_struct *prev;
+
+	if (!next || vmg->end != next->vm_start || !can_vma_merge_before(vmg))
 		return false;
 
 	if (!can_merge_left)
@@ -414,7 +436,9 @@ static bool can_vma_merge_right(struct vma_merge_struct *vmg,
 	 *
 	 * We therefore check this in addition to mergeability to either side.
 	 */
-	return are_anon_vmas_compatible(vmg->prev, vmg->next);
+	prev = vmg->prev;
+	return !prev->anon_vma || !next->anon_vma ||
+		prev->anon_vma == next->anon_vma;
 }
 
 /*
@@ -554,7 +578,9 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 }
 
 /*
- * dup_anon_vma() - Helper function to duplicate anon_vma
+ * dup_anon_vma() - Helper function to duplicate anon_vma on VMA merge in the
+ * instance that the destination VMA has no anon_vma but the source does.
+ *
  * @dst: The destination VMA
  * @src: The source VMA
  * @dup: Pointer to the destination VMA when successful.
@@ -565,9 +591,18 @@ static int dup_anon_vma(struct vm_area_struct *dst,
 			struct vm_area_struct *src, struct vm_area_struct **dup)
 {
 	/*
-	 * Easily overlooked: when mprotect shifts the boundary, make sure the
-	 * expanding vma has anon_vma set if the shrinking vma had, to cover any
-	 * anon pages imported.
+	 * There are three cases to consider for correctly propagating
+	 * anon_vma's on merge.
+	 *
+	 * The first is trivial - neither VMA has anon_vma, we need not do
+	 * anything.
+	 *
+	 * The second where both have anon_vma is also a no-op, as they must
+	 * then be the same, so there is simply nothing to copy.
+	 *
+	 * Here we cover the third - if the destination VMA has no anon_vma,
+	 * that is it is unfaulted, we need to ensure that the newly merged
+	 * range is referenced by the anon_vma's of the source.
 	 */
 	if (src->anon_vma && !dst->anon_vma) {
 		int ret;
diff --git a/tools/testing/vma/vma.c b/tools/testing/vma/vma.c
index 11f761769b5b..7cfd6e31db10 100644
--- a/tools/testing/vma/vma.c
+++ b/tools/testing/vma/vma.c
@@ -185,6 +185,15 @@ static void vmg_set_range(struct vma_merge_struct *vmg, unsigned long start,
 	vmg->__adjust_next_start = false;
 }
 
+/* Helper function to set both the VMG range and its anon_vma. */
+static void vmg_set_range_anon_vma(struct vma_merge_struct *vmg, unsigned long start,
+				   unsigned long end, pgoff_t pgoff, vm_flags_t flags,
+				   struct anon_vma *anon_vma)
+{
+	vmg_set_range(vmg, start, end, pgoff, flags);
+	vmg->anon_vma = anon_vma;
+}
+
 /*
  * Helper function to try to merge a new VMA.
  *
@@ -265,6 +274,22 @@ static void dummy_close(struct vm_area_struct *)
 {
 }
 
+static void __vma_set_dummy_anon_vma(struct vm_area_struct *vma,
+				     struct anon_vma_chain *avc,
+				     struct anon_vma *anon_vma)
+{
+	vma->anon_vma = anon_vma;
+	INIT_LIST_HEAD(&vma->anon_vma_chain);
+	list_add(&avc->same_vma, &vma->anon_vma_chain);
+	avc->anon_vma = vma->anon_vma;
+}
+
+static void vma_set_dummy_anon_vma(struct vm_area_struct *vma,
+				   struct anon_vma_chain *avc)
+{
+	__vma_set_dummy_anon_vma(vma, avc, &dummy_anon_vma);
+}
+
 static bool test_simple_merge(void)
 {
 	struct vm_area_struct *vma;
@@ -953,6 +978,7 @@ static bool test_merge_existing(void)
 	const struct vm_operations_struct vm_ops = {
 		.close = dummy_close,
 	};
+	struct anon_vma_chain avc = {};
 
 	/*
 	 * Merge right case - partial span.
@@ -968,10 +994,10 @@ static bool test_merge_existing(void)
 	vma->vm_ops = &vm_ops; /* This should have no impact. */
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x9000, 6, flags);
 	vma_next->vm_ops = &vm_ops; /* This should have no impact. */
-	vmg_set_range(&vmg, 0x3000, 0x6000, 3, flags);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x6000, 3, flags, &dummy_anon_vma);
 	vmg.middle = vma;
 	vmg.prev = vma;
-	vma->anon_vma = &dummy_anon_vma;
+	vma_set_dummy_anon_vma(vma, &avc);
 	ASSERT_EQ(merge_existing(&vmg), vma_next);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
 	ASSERT_EQ(vma_next->vm_start, 0x3000);
@@ -1001,9 +1027,9 @@ static bool test_merge_existing(void)
 	vma = alloc_and_link_vma(&mm, 0x2000, 0x6000, 2, flags);
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x9000, 6, flags);
 	vma_next->vm_ops = &vm_ops; /* This should have no impact. */
-	vmg_set_range(&vmg, 0x2000, 0x6000, 2, flags);
+	vmg_set_range_anon_vma(&vmg, 0x2000, 0x6000, 2, flags, &dummy_anon_vma);
 	vmg.middle = vma;
-	vma->anon_vma = &dummy_anon_vma;
+	vma_set_dummy_anon_vma(vma, &avc);
 	ASSERT_EQ(merge_existing(&vmg), vma_next);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
 	ASSERT_EQ(vma_next->vm_start, 0x2000);
@@ -1030,11 +1056,10 @@ static bool test_merge_existing(void)
 	vma_prev->vm_ops = &vm_ops; /* This should have no impact. */
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, flags);
 	vma->vm_ops = &vm_ops; /* This should have no impact. */
-	vmg_set_range(&vmg, 0x3000, 0x6000, 3, flags);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x6000, 3, flags, &dummy_anon_vma);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
-	vma->anon_vma = &dummy_anon_vma;
-
+	vma_set_dummy_anon_vma(vma, &avc);
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
 	ASSERT_EQ(vma_prev->vm_start, 0);
@@ -1064,10 +1089,10 @@ static bool test_merge_existing(void)
 	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, flags);
 	vma_prev->vm_ops = &vm_ops; /* This should have no impact. */
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, flags);
-	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, flags, &dummy_anon_vma);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
-	vma->anon_vma = &dummy_anon_vma;
+	vma_set_dummy_anon_vma(vma, &avc);
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
 	ASSERT_EQ(vma_prev->vm_start, 0);
@@ -1094,10 +1119,10 @@ static bool test_merge_existing(void)
 	vma_prev->vm_ops = &vm_ops; /* This should have no impact. */
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, flags);
 	vma_next = alloc_and_link_vma(&mm, 0x7000, 0x9000, 7, flags);
-	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, flags, &dummy_anon_vma);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
-	vma->anon_vma = &dummy_anon_vma;
+	vma_set_dummy_anon_vma(vma, &avc);
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
 	ASSERT_EQ(vma_prev->vm_start, 0);
@@ -1180,12 +1205,9 @@ static bool test_anon_vma_non_mergeable(void)
 		.mm = &mm,
 		.vmi = &vmi,
 	};
-	struct anon_vma_chain dummy_anon_vma_chain1 = {
-		.anon_vma = &dummy_anon_vma,
-	};
-	struct anon_vma_chain dummy_anon_vma_chain2 = {
-		.anon_vma = &dummy_anon_vma,
-	};
+	struct anon_vma_chain dummy_anon_vma_chain_1 = {};
+	struct anon_vma_chain dummy_anon_vma_chain_2 = {};
+	struct anon_vma dummy_anon_vma_2;
 
 	/*
 	 * In the case of modified VMA merge, merging both left and right VMAs
@@ -1209,24 +1231,11 @@ static bool test_anon_vma_non_mergeable(void)
 	 *
 	 * However, when prev is compared to next, the merge should fail.
 	 */
-
-	INIT_LIST_HEAD(&vma_prev->anon_vma_chain);
-	list_add(&dummy_anon_vma_chain1.same_vma, &vma_prev->anon_vma_chain);
-	ASSERT_TRUE(list_is_singular(&vma_prev->anon_vma_chain));
-	vma_prev->anon_vma = &dummy_anon_vma;
-	ASSERT_TRUE(is_mergeable_anon_vma(NULL, vma_prev->anon_vma, vma_prev));
-
-	INIT_LIST_HEAD(&vma_next->anon_vma_chain);
-	list_add(&dummy_anon_vma_chain2.same_vma, &vma_next->anon_vma_chain);
-	ASSERT_TRUE(list_is_singular(&vma_next->anon_vma_chain));
-	vma_next->anon_vma = (struct anon_vma *)2;
-	ASSERT_TRUE(is_mergeable_anon_vma(NULL, vma_next->anon_vma, vma_next));
-
-	ASSERT_FALSE(is_mergeable_anon_vma(vma_prev->anon_vma, vma_next->anon_vma, NULL));
-
-	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, flags, NULL);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
+	vma_set_dummy_anon_vma(vma_prev, &dummy_anon_vma_chain_1);
+	__vma_set_dummy_anon_vma(vma_next, &dummy_anon_vma_chain_2, &dummy_anon_vma_2);
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1253,17 +1262,12 @@ static bool test_anon_vma_non_mergeable(void)
 	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, flags);
 	vma_next = alloc_and_link_vma(&mm, 0x7000, 0x9000, 7, flags);
 
-	INIT_LIST_HEAD(&vma_prev->anon_vma_chain);
-	list_add(&dummy_anon_vma_chain1.same_vma, &vma_prev->anon_vma_chain);
-	vma_prev->anon_vma = (struct anon_vma *)1;
-
-	INIT_LIST_HEAD(&vma_next->anon_vma_chain);
-	list_add(&dummy_anon_vma_chain2.same_vma, &vma_next->anon_vma_chain);
-	vma_next->anon_vma = (struct anon_vma *)2;
-
-	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, flags, NULL);
 	vmg.prev = vma_prev;
+	vma_set_dummy_anon_vma(vma_prev, &dummy_anon_vma_chain_1);
+	__vma_set_dummy_anon_vma(vma_next, &dummy_anon_vma_chain_2, &dummy_anon_vma_2);
 
+	vmg.anon_vma = NULL;
 	ASSERT_EQ(merge_new(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
 	ASSERT_EQ(vma_prev->vm_start, 0);
@@ -1363,8 +1367,8 @@ static bool test_dup_anon_vma(void)
 	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, flags);
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, flags);
 	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x8000, 5, flags);
-
-	vma->anon_vma = &dummy_anon_vma;
+	vmg.anon_vma = &dummy_anon_vma;
+	vma_set_dummy_anon_vma(vma, &dummy_anon_vma_chain);
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
@@ -1392,7 +1396,7 @@ static bool test_dup_anon_vma(void)
 	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, flags);
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x8000, 3, flags);
 
-	vma->anon_vma = &dummy_anon_vma;
+	vma_set_dummy_anon_vma(vma, &dummy_anon_vma_chain);
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
@@ -1420,7 +1424,7 @@ static bool test_dup_anon_vma(void)
 	vma = alloc_and_link_vma(&mm, 0, 0x5000, 0, flags);
 	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x8000, 5, flags);
 
-	vma->anon_vma = &dummy_anon_vma;
+	vma_set_dummy_anon_vma(vma, &dummy_anon_vma_chain);
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma;
 	vmg.middle = vma;
@@ -1447,6 +1451,7 @@ static bool test_vmi_prealloc_fail(void)
 		.mm = &mm,
 		.vmi = &vmi,
 	};
+	struct anon_vma_chain avc = {};
 	struct vm_area_struct *vma_prev, *vma;
 
 	/*
@@ -1459,9 +1464,10 @@ static bool test_vmi_prealloc_fail(void)
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, flags);
 	vma->anon_vma = &dummy_anon_vma;
 
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x5000, 3, flags, &dummy_anon_vma);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
+	vma_set_dummy_anon_vma(vma, &avc);
 
 	fail_prealloc = true;
 
-- 
2.49.0


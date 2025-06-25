Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA642C1A2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866628; cv=fail; b=SRdeI9+mhogvs/N2u6iZAI+rVuX4tfXqVx8hU4X/R7B6IZpiAWAPgMzHYfT6S/dM/6XuVm0CElY+qJ6ec/NKx9r6ZyS6OaaG87wSNcwoo0zn4ppoTpMPdonukHgd4BJrtP9kg2FjD2kePqRR8NBMHyEAJl6Yqgiar1gPj3FC/BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866628; c=relaxed/simple;
	bh=uECDFiJNmljpBKTEBfvtZYPY5wZhIdcJIYuL4yHUWWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pe96G7tuIvbEfwitqwFWXYZbueUiM8rdvzyxX6cGpP1zxT+VNYXkylfCqf9DgyHz84M9AJh6P9oLbay5T8xFYjWnUP2cfZaTxxZiPmm4viNPWdUN2E8FmAlFTqvWN4uIVxr1+VOPfWN1BE3+ML2t8K+wMFlHXqdEJ9EOtb8kKXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GzqDKV3+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rwz9Gow7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GzqDKV3+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rwz9Gow7"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PFC3MI022933;
	Wed, 25 Jun 2025 15:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=uECDFiJNmljpBKTEBf
	vtZYPY5wZhIdcJIYuL4yHUWWo=; b=GzqDKV3+r28j/VDy7qEqFP0G12fQDYzzvt
	0G4zYzm1Iw4f+GcTVP7rZD+FC4gMA7MV/LX1yttl4Og5Fw7mtkawjARjrOEEuwu1
	IWOscMMPm+zfNGzBjkY+bvyj2NslxLdxC939MGzF71H4U2drAEnsSTokOup23BkG
	UewbR2cLB6LcecrXDB8fslG4eyQSQrcUGQtcIQgEoHxKyVnie2eosYs2848Xz2WG
	A9XqFVsOKHhGn+/yrwohX3Zs7YLdU35aNILsxJfCCd7aRVgMDNUeT4rGnlP8nhl2
	ii8VOBJel4RR4sc3OEmZ1ww9EjMYoRlkUyAVMmOs2zeTrTLNw84g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mys31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 15:44:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55PEZ5Y3012978;
	Wed, 25 Jun 2025 15:44:37 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvxrjtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 15:44:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUwsIC8K46cTh9P81W+IH3GqvV0sKLpPOTSY0k6u+PdrTSWmQMB8nEoU+GaSIXHangPY6DbVESedItPs8RsQudG0IgGPUtlO+Yh5w+MQRUX3CyT6GaKCRlSIUFeR/tUfYUbiRCsr89yv7N/EPWMF1abiLakEcy0fPTs9VWEJPZsxvcwQdbx8Nfbh2aFCWkdyw2NkdQYR0HdPrxUzUdWxtRrbJyWkd+G6hPGCfW0ROFd0YyXeHQbF7P7wmP9sWOTbOeULw2JIuiBoCOC5qA0tdyIZTdkoBdiHfZjNxDOUY1gB8i32Gw1ekGX+A61rXaRBv+XgPLWT3mlda+KD/29zaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uECDFiJNmljpBKTEBfvtZYPY5wZhIdcJIYuL4yHUWWo=;
 b=L0ElyaFA2DLuqNWvHuyqP3CgGSpB5I2SNvzVFxadQbHB1oLQIje21VPBZy2aISShRqxxb3+sRf+h42tyZuYCdpeF0Vvazan6jYnz1nCuvJ0I41PH7cDAxKZ0Mu4agFul2H17gJDXLt+H6p4PQchJNxLY7RdWRwWKQX6zHlg83DTImW6ku0k8RNojK9xOW4pW/yL096dW4dm78ovjBunxpRWdfoLOS/sfzoyqQ7lFCie6gIxKZSwD7tAqh0nvEpCrVorwTuUzTahJhBqAQLagBjJMFQ+7lpnhCraBdF3zgIfsBDdCoi3Pi+EG4DACHUvIizGnTN7fe8+GLFx0eU4BGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uECDFiJNmljpBKTEBfvtZYPY5wZhIdcJIYuL4yHUWWo=;
 b=rwz9Gow7ewKL1vP+s6CZ3SU5OBHKQpvzgLj75C4ws0LOFHn5ULTjlP4QiD+YOqFbhJmjGeZic2NWZ0Bm71KH4qIG13tgQXJHTNaL49ZbQcOpYNBH3CPrWxW0rwB70Y40TIJ91CfKICug2gr9aq0sZaRfECmTR6rLcOYoH7WEpfc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4278.namprd10.prod.outlook.com (2603:10b6:610:7f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 15:44:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 15:44:34 +0000
Date: Wed, 25 Jun 2025 16:44:32 +0100
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
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <31635396-1fce-4222-9d56-6893089902e4@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4278:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b3b0c8-328e-478c-05fa-08ddb3ff2f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Eg0Dw3sAXtdI9PejfMqizq5Lj7Vx+MV9p1xOlAdpPdKPWBYDdzYzqjkXCAi?=
 =?us-ascii?Q?go4UrSOveNIVWEt2k70OmZppN6SLN0Pm08qfLjKWZc0HKlwwCtwLp5wljnIB?=
 =?us-ascii?Q?lVGsVFjuN6FxGeEEjUi9ESd+2DSU9pJHCJOrUxgChTxdrcKSSiwJb8bB6Wpf?=
 =?us-ascii?Q?eu4ri2Kk9Wnt3uBDjOGEFqwA1Xey6NkTbb9bf0xTMQ2TL7sxa4N6xpi/UCAN?=
 =?us-ascii?Q?ZNHstqI5tpOA8o9WYw/UcM3fn3RmkHJ+ZLMgdy9iQOaBTjJ/k19upnGpqRrD?=
 =?us-ascii?Q?Z5zJ2G58T46M/V5f6fm6Uh1eDPSBMUlnZc+NrxgAhGk/hWygenOZSupwTxxE?=
 =?us-ascii?Q?4UxLCDesLCMAC9IddplGfLc7RNf62fzC39PXjgzH8GY3jVmAevHt2inukvWc?=
 =?us-ascii?Q?bU2YAip/mqpUSw+kZg+I++EwxSZZGD5qQtqyy0l57g/oCc640eMtwnBaIIG1?=
 =?us-ascii?Q?pY2h5CauAm5TXuoTKkyJCTWqgOXZoOmKZhQEM0vhHDJozQvJ3bDzAMKQACfB?=
 =?us-ascii?Q?mzcGrBnALPKWUkndv1sYXpy5fDzb0tjBoP7fE1mk54FMR/IpjlJvHXacEVuU?=
 =?us-ascii?Q?tJZ4bRq1qcF3ufq4LsE5IxHUuErC/7roIcF4I5y1WpiS/7bMNg5qQGJez57U?=
 =?us-ascii?Q?zpi+VUp8oONue7w4TMgmxrmT8jW82MjBtTK2PyPZSj3WviCmw26lIo9MhMPj?=
 =?us-ascii?Q?Gbpleblz4raLOQw/D9Hf9WgFI2VD7NU7rKhqghmPLQGNPR+ANcmnPuuLxkru?=
 =?us-ascii?Q?fpgRiG1j3NVi/yD3UxGRxcvF9AM4oOgqSCnkRhx0cr1hFg6wH68CORjnAZqQ?=
 =?us-ascii?Q?M9VchqR6e8/pDxJOW29Siw8u2p6WX2yqNb+jXlRF8uUXnmwsUn5oSTg3Ed73?=
 =?us-ascii?Q?Ih1I/Lmqe9d64ztJnlgYVxdhbyiygvk3hbKyy6K4QOuhmXcBfv+SfQPI4z2P?=
 =?us-ascii?Q?RjM6wWiLgDbcze/driGzKHCuQs2gVX5Yk5kM6RMaOUVocsUkRO7Uss9hvwlQ?=
 =?us-ascii?Q?MqXShrXlfcv0oGbFg92l3VJ/0TqcsfhCZRR4vHmOunSAxjUcu/SmRtuU5Xy2?=
 =?us-ascii?Q?OT8tu310PVQiHThhQ7Rh44UzaPukCUiw1pCjdOKBerZ9W6KOAYSi/7PRemR8?=
 =?us-ascii?Q?yCxd9hBGbhmO8fE5RmfqoE9GN76Cm8XdSI6pbLoBd3YbXDB2qBkdZaqsc72d?=
 =?us-ascii?Q?hGOEO1GrV0lplhWstZK7k0Scf6hiTb7dnV6v5cO1O+7aL8mmqAM8aGmf82qp?=
 =?us-ascii?Q?4lqWmAf4BgD9n+wswo5NvgX479PRMGA+67CMbF1k+4KJO2sXZPzYkheFyFZd?=
 =?us-ascii?Q?CQ4EO21t8srKvjhio3FsK4wKj+21A7VtY1oCf0G0KYT8lFTb1a0gz21pifWh?=
 =?us-ascii?Q?sZPQBMv5WvJqJ7TPJxGIH2rSBv/K9SBIXVqeNETtK7vVrcc83GT7cLyTz/6b?=
 =?us-ascii?Q?RUhW7s17wWg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ilkJOvJxBovcNaK3neED4ew4a8fqZeRGY0VUlgyCDTQVaZLQB1neip8OmAEC?=
 =?us-ascii?Q?YBys0QQlOc/seWqjZERtEpbeVNY8aNSuIUuWZbuzuR/MMN/sosmz6ODVXgVh?=
 =?us-ascii?Q?kRWrSmNfqJ3EozMshWFyvWPJkNUX1xRI7fi6CLdp8J2GMpIeVYK+kYb+LrZ9?=
 =?us-ascii?Q?eQuLJ5H4aFCW2NgD/TPiQtVlcFi8/v3ZnaHC5tyQuakobHKoxXPXDKMqMChX?=
 =?us-ascii?Q?En0RuSAfbhVnW9VU6RgHsw5scxV9ZeWQmfC7dtLGiN0glmiG0SkAgdQR/5aW?=
 =?us-ascii?Q?0YKDUO5pMBOIR0+5ROS0HXhEdS/gygd1wGC2+teHDQhIGCMWZ1QcdMlq4Pff?=
 =?us-ascii?Q?9z8W6t5s1zNpGWRYREaEhwuJ09oAtM6+hSzMbUpLM4eQUbV8r32SoIe0cfG0?=
 =?us-ascii?Q?U59z+hiJuui6Ke718j2fm2zvckYLhzudKyIzcKt3xDCdmpjkJ1huu3zPW7+l?=
 =?us-ascii?Q?D82pQcD4YM3uQWLvkLYKgSnw75LQliyVZPbcO5mMfuaeLNruFZJhR/ymz5lT?=
 =?us-ascii?Q?4jvCA/+6vXC+diGOlnbLsMykuBII1loHfQMH+2tkMDuQKjcNFtEFbxwWHNjL?=
 =?us-ascii?Q?+xkxuvnBy/h6rIH8WZvXbudUzeYENgvezaMlCVN7flF2Yx9LL2Xy8vO7la4N?=
 =?us-ascii?Q?YgRi2HA1ziUac6COwNBSgtbRXICr4Ywx6OkxGAgS76DO7/1asjrUVwyIImum?=
 =?us-ascii?Q?N1H1V87qiAKI3bn3f3t2lm/lA5v78XwDhyy50DjFW+ncfPhEgc7/wTv9CQsp?=
 =?us-ascii?Q?Ht9DUkQMNXJMFJUV1XUco2Cq2M1vGJguhCYRkxf55J9UTzoiJnqugK+kIqcq?=
 =?us-ascii?Q?r8f1QC+8FrEYICoKCmZniyUL5PWkYiZ8qoZ2h3FcayJzXHkDF5/GDCiZLZxm?=
 =?us-ascii?Q?SfeI6zfkMsp3uy9s+DEJaGaI+gpg9tbVlTAcqsxIkU+G+D4796L9AxLbeBaG?=
 =?us-ascii?Q?ZMXc4VUWXOymqcip3AQShWwmA3ezTEmriiW5MsKEyLqtAfKMQsnPjw5YHE15?=
 =?us-ascii?Q?tLHdYeRm8aR6x/2+53QMehrT3iYXZ0YhykCErj+hlq/DNjBdMmTkg4FwYzsM?=
 =?us-ascii?Q?dZT3z0iX7KX+9AIrkPe9YLZqj5WWbIBnFLq6ZAA12VnQN0yJMzQZ711hdBDC?=
 =?us-ascii?Q?pkwOHwLr7QWE+5wHS78fsFEcfWyD7oxUPzKHV9UJuufXYMsh3WDEqDr6gyjl?=
 =?us-ascii?Q?Ze1zjAgmeLAjfPZXDRxPoMvvzAvbO4QkE3hLbTr6T7B9X2iaL2wh3EPrvjhP?=
 =?us-ascii?Q?JD9r2ompCN3zmqm9EcanH+mcvKIQF0XvyyXWhvbqb9iwiRKEBL3bRo+bvd5z?=
 =?us-ascii?Q?qCicmInULVjR42oA3E0uPT2p4sHdtXYx04weOizb759Iil+W93SqGvyuS3W7?=
 =?us-ascii?Q?XbOsiB9tBgb5XlCzjrvZi73vprtVBo8LqsIdE2j0xij/NE/MLHsSKhDIH+wj?=
 =?us-ascii?Q?vfczIEW7yqh85xDtbt4wpZezGuwnkZ/aXYkX4hH4UVvJmm3SYw7ApOPAwhjm?=
 =?us-ascii?Q?E+kxccE1/oIilbVmgPnVJ6/MtD7n17oWCz71iPZU5FG632TEGYo1U5bz7jH6?=
 =?us-ascii?Q?EhsDZAdVqbadlVG9aAT3uoS3P53WUQe3qkIE9cZ5JpI+ems5ElX8gwkli9GE?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HxkNYNNQ5jYH2kuBinUhDrtDNfoXu09wREg91Y9RniCbsp0ZuhljjRn7lspavB/iO7kT+WPaHBTeUq/pAKdeY76u5a8Et+BMV9UT118XCMho37p5wFh1ruxqwLi2RJop0NTAaFPt05Px7n+TAORjbMkfOlPcK2U7WFwHvquEP+zdWE86AxDehkzatrdr8HGna6SN+CeXoFtHqsKah27+g8uAVhwpvdNkW+EU2vx3e9GMFbXj8jO97xpfSdPkk48L/ndIHLg0CNf3uMlNEKoSgTo1Z//APk2nFNKIzmwxsOaK8t6ca8+ULEeim4JtBm/ejTtkngEEgfp/kfdTdtLzBfZJWE1QfoiMhwolHS7hBq5wU0Fmx4NUqomXwyh1RAV7R6WAUL0ZGGsDDcdNE7u/aQzrG8+SUDTg4iz1tzkhr1g21vP4ZmvuDtYjAg3YG2dqD7NalicftOJUaA8jbUymlNHwwsHzDgvG62t+U4PQnXwUFMAySSoDqyvdqNb3d5s51KUFlKzck1i1i9fDa9jBJdusqxldo8wPEUVGleMLAfnGpP5d4lfj0CHjDIWMfoYC2MIF414yEiEq2N1Re0EOxZ6lCpW4VKp2yObiR/0wtdE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b3b0c8-328e-478c-05fa-08ddb3ff2f46
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:44:34.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2kiUrAe2NOOnxQE0tMsPAV4hyQVBjMLtUiSiC88fZecvRNJ2LmWatc/nYtvxPMjBXoh8zX35GFfEtuOSS4twLwECY5McQxoEwZyNj+gS1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4278
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=822
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250116
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685c1967 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=gdIJzz3PNA7OxZqDa-EA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723
X-Proofpoint-ORIG-GUID: aTFcGZxr7LqeMyDEhwvnk2YTiQKwFME_
X-Proofpoint-GUID: aTFcGZxr7LqeMyDEhwvnk2YTiQKwFME_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDExNiBTYWx0ZWRfX1aSGI6bMolAv ry6rnE3TxxX+qkfnjuFFBKKIm5GcvTLvB283XfVSOxOk9XUD986YMZzVrl633RTmuf8QAr52NI1 F9INty8RM48ey4qCbLDdwH3Agn4qG318o7vMiVi1xTx8vKF1sxCZnaBOH9vetO7RAWJyVuouGyb
 4it+XtmmJiCcpeP0DlbxsY/0Wdu0kgaNQjxuf5IxEaB8Yitp70U9g1S4wPze/fpkcW2DcKI18sO XPmLW6yb2kT9d3jRbz/oISr+ajO02PEtJ7B0L7YAthTEUx/SD1zXbY9XCsbM7iYYTujgWZCJllg yCvXINeNf90OZvW/+tyPHG/H+vIwuKtZHn1pIy2RnsRFiCnnHCw++jBLaJBekrAnfiYdCLBOKHQ
 piP7dMycqlwgG1x68pJ5iiVxWKRTZV1fPFjLw2OdEcxKzf+iN3HLeKhVZeelskpQouZX9/4f

Hi Andrew,

I'm doing a significant respin of this based on feedback, I was hoping to get it
out to you earlier, but it's turning out to be stubbornly tricky (rmap was a
mistake ;).

Dan's found a couple bugs that are addressed in the respin, so for the sake of
stability can we drop this series for now and I"ll get the reworked one out
asap?

Thanks, Lorenzo

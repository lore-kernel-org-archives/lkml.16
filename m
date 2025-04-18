Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB781DFFD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744967610; cv=fail; b=EpOakpVlm0Teguxw1lbHEivnmgXGvDb6at9KiNk7lTBNE8s5IqgHDpds8+kZzz7IeiRi+P+2op/lg66EnX8xeZkhf2S3/0D5daKZhUvN7nHotoHbcHdcorqJ0nI6b+jLqqF89x5IVRDhanGJSOMlzzwAAK3Mwdb0LA+/LWVGNG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744967610; c=relaxed/simple;
	bh=2n9dK/y2HWFY5o2vxAapb5iIHCYEwnOExj+Gqz+Y6uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OL57lb2S6NJlRqBuh+Sb3ugM5BqPbqQ/n0+wDSfvMNrDTnFcQzS0UEJL/WIx9latWsJ82Evao9HDGyOXvX9ZZfpUXHdRf0VFXdLbkMwYJzTAFUuWzHaNO0f+OYhp6tYZHvYIfPwQic6Xma/ioh8yVV6YZaTV5F8kT896yMjgWQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j3jO7idi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bS/MtllM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j3jO7idi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bS/MtllM"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7uo6J023659;
	Fri, 18 Apr 2025 09:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rjHt9YnTdFYcAU2BK/
	80BdY/gO72Y6hnAtPArRBr3oM=; b=j3jO7ididY7R9IlZA0HvkbWKHT1h56UjDM
	H0de9JyuNoiapXmcISjImIPtLc3uQXGFntTYPJ0b/SHUiF5CeN6NUt7bUX65A2HY
	N8E2HqFcKjcnG/1fW687YsAtATRzG13QJ7gpYRL+W3KtcMf50i4g6xMgRBulfvGk
	R6ebv0CRnqbL+lyy/H8zZhixJcwzyHzuQgNPeCRTwloJVENiYWMwNgAvqBf5XMP5
	Ho1jghsnqQAX/1G9q6raF2j76onr6koGUqh+T0OC55+rl1gauRyd+0p0VtOcku2z
	FxGUQduyVmwpEVvbA/krQi+46IqIZS6RrMdEiD6BZ07527NTl+ww==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185myvu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:12:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53I6gCfK008522;
	Fri, 18 Apr 2025 09:12:44 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010006.outbound.protection.outlook.com [40.93.6.6])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2uefcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:12:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njZxM41ww5/tuCEXDyTnH3Ohro2UqerTtTDhLt05r3iIm6qX+xwz/Sxgb/BUErUysPfCd/wuEQE4VJjIRxqXVXV3qbP65uzfLYBew5Fq8eb9r01KK0G2onlKP0p1FIyYpXVj+UmlElmI72xIJsApZs8d69pvGNUEqn4sUcEIxhCuCIDztCMVgNkfMPNBWFi5e6s/BbRuPgw85rReRqVHizbW1P6n0+mTMJVc6EyAaa50+j9MbXhJql/IYcHKthYD3/61sdA41ES3Q6yzyBwN3sPz3MJwXh181qlxR1pIPATfJH3KfxNXQL1ID/YvSiPjQbERvj5cpOosHIuNlD3nLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjHt9YnTdFYcAU2BK/80BdY/gO72Y6hnAtPArRBr3oM=;
 b=CrMzThmNntMdMy0ev6hYhrJoMyWwQSg9JmBxErF125vJu6nPtXiyAoL4B23da/FKSSc7Y4tt6H/NHuhnI4wJYFYWh/iAUo6p4adRaPK7MxMeAhqyf70QPRDurQckY7UcHDI/aKekI8fNxHT5QZkdBE5nZtoqYfQncZ5QfABXdRfWITSEA0ocSiMMXomEUaZw4FPI6IoZGwea6MN1lK77Hv3eU0JDQCkShpgozZHIdSQXw9Z8bhmkuis916M6rzJk3Sm3rSBfegG6M5U9WMzx9TxxScN0xjR3esbIMkAAfyfTFixzfmCcyzav+KUWxTrURdoFARsp3vWNL1f/+rzUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjHt9YnTdFYcAU2BK/80BdY/gO72Y6hnAtPArRBr3oM=;
 b=bS/MtllM9oBX2T3LoJBv19mF0EnSlxN28Zk6k/UaQ9piWF1GIk/tAVwFxZrVvrpknxirnpLMSRh1xWHklLrq6iNK/avpQWYChV3VuY3rug1NYRubn5A+qb02ea5vZxu3jITELtDJXoWxQm9l5CM+wWTkt4ku84duiJK6cwKUYrc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPF72E3677A1.namprd10.prod.outlook.com (2603:10b6:f:fc00::c2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Fri, 18 Apr
 2025 09:12:41 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 09:12:41 +0000
Date: Fri, 18 Apr 2025 10:12:36 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Ye Liu <liuye@kylinos.cn>, David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 0/3] mm: minor cleanups in rmap and memory-failure
Message-ID: <86353a8a-f04a-40af-be87-6b92bbad024f@lucifer.local>
References: <20250418075226.695014-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418075226.695014-1-ye.liu@linux.dev>
X-ClientProxiedBy: LO4P265CA0115.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPF72E3677A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d60536-ff7d-4886-d498-08dd7e592b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wy3GzwvCIeK6GxhRa1UVBoJikSPjDx79JnIGXOsSOYXLhEKq9FF4XMJlrzBe?=
 =?us-ascii?Q?wthvhEWeEJdSTydsDnOJKRW4LIY5WbnnnP8XKRSfDcdMPKB7g9ED59WOBXgW?=
 =?us-ascii?Q?M2w2/YbCoixBCx4Kn6uReJy8Je595s6w/tk7DhjEBEfPeQbVsbImZGwf270f?=
 =?us-ascii?Q?YAKJaUt6xzNrjALdAFXp3Jh1/xu8depk/cY8yptAgrNJOtsGOC8lvjZNxYU0?=
 =?us-ascii?Q?378Q3PiBH9XOjB6Y3cxzyY3VJ/XYJ/uvI2YIRCNABGg4zPW4AiF4ShFpM8RI?=
 =?us-ascii?Q?eg0EMNK+8V1dQYxZhi8EMPzxC0h+Fh+obdq93jv/LCUL+w9r4nXc+uuaJt+y?=
 =?us-ascii?Q?UH3w8slxTGU14CDj6STyALvDi0w1nDTRxhBSaVOS23R9IcGwXJFvxibB+S5T?=
 =?us-ascii?Q?bXWVmp7FoiiEVKNu9ItinbMuMZjrSAuxTWgyG+pLoJ5kcbyf2jXS948FWouh?=
 =?us-ascii?Q?tukqLINvO6Pflwz26ulctQ2sAibbpWGdDTZMfp8cb3jbkXk+0YUekWHfu061?=
 =?us-ascii?Q?kVRBrBgIYtxMgrqtL7SYqog/pNCPgdSBSyCJQ5p0vGHGIphYj2oPQWwmLTnt?=
 =?us-ascii?Q?88vPNcc0Bnvb1vni5daWluyEKyAWP7rh08j9x7RoEkMHniDKDu+FI17AtKdh?=
 =?us-ascii?Q?D+uGY8MhXDnGdefRXEfy6lcc5qpTnmXKJbpX9T+3rxB3S4txzP7mK7FgXiIY?=
 =?us-ascii?Q?9Fr+zQV6D/lSIq7rUQxoq2yE0xPuxa+Xu+gwjQ6QBiXFt/a3vHS5f9bdjHS/?=
 =?us-ascii?Q?z38iD5kJk5kuEi5euDKNqEshgvNUtCuJLnwKQyDzKN77ZagvqMlsRtG3pa2t?=
 =?us-ascii?Q?wk3S006BLqJKH2ksuuht7e/h7rSXrCQymS0Qmuc9jrDMxWFHmliQ2IPLrF99?=
 =?us-ascii?Q?cth/2MT/YjWP7ZTpW4LOAkz1BtZVl/rB1tcWK9OhY7Pypgge58DvAVKvQL2Z?=
 =?us-ascii?Q?dXCuCj3KjVxjvAPHd1kDegn7Mpeoc24YrQDshyoEYiuZ1UPWsGgaYsSVVX6t?=
 =?us-ascii?Q?hghUUlwBy64zffAgE82WCwzUQftsVEo6aoTXEWnjpdEI1zGnBg5LNaKErzXW?=
 =?us-ascii?Q?CNqFMYWZVFPZqK+fDecz1Q9A2sBKD7oTynYLFvZdS47Xh72InDwZ2H/fwL2a?=
 =?us-ascii?Q?l3LRwmqq7V7Xl/2UEwvQVwg5pSVbvjODBoCyr54tVxb3ixg4P5+XvJhNSxo5?=
 =?us-ascii?Q?BsO4Oz5LTNKwLxgKqRRUpuy3gJzzjTCfLu2EFOLP6mgelaZ76f3U/ExjbGe0?=
 =?us-ascii?Q?oTkxCRtYi1TrvG1tyOAfsS0ZMIQ9cwmRICWLQHF8E+Eyn5mfhbQQErKu4jiw?=
 =?us-ascii?Q?A0LWcWKOSEB/mvU7d6xBn5s46p73YoP2/6Bl8MuUGrzkyiXSqHcjmQRu3i8o?=
 =?us-ascii?Q?FG/EZHpSMxal4seaKIaP9zlg0+FQWhf0psdzX84JVHsIzEQUK+moG0g3f2vX?=
 =?us-ascii?Q?El4EtzrHbcg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fEoUSSfy4dGnHpKu0JXP0pFQbaENl0EvrInyby/zqWLcyxwATJN1fk8Z8iol?=
 =?us-ascii?Q?/uDTvPXaOdsQsLXnzmtTJV+hXegtYu1XEcBL8z4092VZnofLrxU3DnDnIPJM?=
 =?us-ascii?Q?pCZUyHyfa8wIHxpSaatz1nFSsZ97Hw1R95uZ1fhPWBc5qlRNoK19ghuAHQiU?=
 =?us-ascii?Q?UzoaFzxL2A30szfxsAYMuAWNX3t1zqJZ+DEtfWW3w02FqD6M/re1365gKV5D?=
 =?us-ascii?Q?glxT9QsWL2q3xIBFwHbXTIbn5/q4shaxEWJXs3UvsKF13mZb/Puh4Lxy5Vbb?=
 =?us-ascii?Q?1bOyv5zeisxmj7jAPLbeO31bgYAFjfcEDE6X3C+VRQsmrJ0ON+z3JpVejhz+?=
 =?us-ascii?Q?1Ch408w+Vs5mVg4ERj5OJh63DmBxp+xi7BAuFyMcpjBJUizdKyVLvaextULJ?=
 =?us-ascii?Q?aD2zqq/D3oY6dltFWeA/X+Y0Y7ubH4P/xUhS0+dmTI5Z9xCN5zpnowJj97JU?=
 =?us-ascii?Q?GUqIA5/6Hb8RGpJ8LhPjGrgBcrSVeRfFghh3h+DpMxqNv5QfA5YfZCmDZ44w?=
 =?us-ascii?Q?5TKF1C8o2txuCGAqkZzN7/mASxZrw+vGZYPhZjWmcPfoIdeKQjjnVXy+LXnv?=
 =?us-ascii?Q?KI9LaSrJEqHYwDvzY560PMxaGkjt+bgzKjOVjCD63UKoSaphjsfaZgz/f8Fi?=
 =?us-ascii?Q?pG++UeZcK5sqaMYgh8jIYLa0ajL0G2X05xvHG0V+rNisklm4FsvEs3hxYbX5?=
 =?us-ascii?Q?9ZODTqLr4j0HEthvJgSsHw7imZjmC0ZTq4S3a+sgQNhkxYFlq/PWdyyrx4aP?=
 =?us-ascii?Q?nED7oBiA4WSe2hwCF46+mPiR9J4k6Jnd8sp2DomILpbccmqIyfI+ybFZ6sMN?=
 =?us-ascii?Q?bwxx7hSu8K1RCKrj8ie5IqF7Xj8oAiaX+JJVOWnZPIiL5QS4tBXKKZ5fAChU?=
 =?us-ascii?Q?oL/i4KBNQIbeZ9cStgcDnmQkzQ0qe8rdEs3KsWbf0aTaHx3DoqGGuaroVAZk?=
 =?us-ascii?Q?M5BR06JFYn5rzCbEmYh21Z0vcl3aLVt0jOatzVMDKsLlSHsaEZBYktYwUz/V?=
 =?us-ascii?Q?I8gNfJrb5NBVzjDvApwesr/fhuYW+bZ1cn3C7bX/UOUxs36shHjgiprziy6d?=
 =?us-ascii?Q?1uCrullWVAaz5vdMJQp6gybivhGwC7aGWwjCcfelaOh5CBoNtUbw0Z1wiIiU?=
 =?us-ascii?Q?i53l4POS5rx3UlD5t4FWU5QbVYbqWtWVtPM+5OJM9SVB4aTXPS8CgFhJ0slY?=
 =?us-ascii?Q?HEWQhqgBBJr33F0XfItDMTe5zLXmwRrwbGaPByDt2i4+eLswrEKoZIyoFf6r?=
 =?us-ascii?Q?oSV4DsC7sq4sxKhG8XUBu3VN++ee34pHzCgJpFtklEc0iAA/74QSjfEDEcud?=
 =?us-ascii?Q?CMJzLGgTUTgtB7ficWrG/TqIh2GRCjUDiZMnFWWecrAlaTDBUcb5cyjs6kAO?=
 =?us-ascii?Q?0QhxDgg9yNNpcWtESli72lbeTldR05t8AJKhbzUTcuP8UUKYFcJgN0CQ50hr?=
 =?us-ascii?Q?CPRsXa5mIzfbGA/vhoZnadK8C3R9PusCmfI6IXShkeN1hqhI89TyfgNCt0LS?=
 =?us-ascii?Q?mwApHSJhTStecTuORlQWXT9E1eQwrTSANeOmfhXkX10kBmaMkur3NcSw+1c6?=
 =?us-ascii?Q?GMc4DxgRZU9EkUwRFx0kk1tuCodIXJEzx7pTB/kDff59emu5EjuFkWFoaULU?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MUPALEdaG2jR2u0SRZUZEei6ZPZ+Os3DO1rSuQhjhzHfG206WFBlRSvhOUmPZ/kd5Pyf58d6pBgsRvQJug93i0u2Hl85OKr6Af1z459VVxPBxZgn8d4IjAF5uXuylrDm+eBLCm2xyp79fum1FU0snvd6RLew+WsYYNPl8KDnEgM+OdfRNK0Sv7bAArW1oe/+UEWH5pKbN2n2ObbBhJPAn2lErvYu+IKBpBtA0LHKJGxnxPriFWAZrsrLlwUSFqXAYDbB8CW43HrLstTaUKF5XdsdHFphfDt0KvRrzAq+xz75856+WMhsunJfbVvyx7i0lL4M0PiGaMUYB76BZTYoFgpUlnil61Tp07zOw6VesAuUfE8ZPAgFgo9rSdLbq4zMHU38M5IchmfLNaTMUv9Ffkes4E7vmyITQS1hQFPXd9muA4+LXXfjmnEhWNZ1jEV2FFcnXMuv0NNFfAnjmgc2Lrw0qlzpawZMfqlC8Zl9EmpnA9K8liYDtBpQv2rsuwipcFZMVV3u4ELqWC+2rctShP7pcKzNS7D2lz6gZvLutcqyU2XggJSnOqAsawevLhlMerS3KWR/jT+erqdFIKvrvzbSSdgKMWvHAKyoBDbijKE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d60536-ff7d-4886-d498-08dd7e592b4f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 09:12:41.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2eLJxUx9KJv/duUll+xMQjzYATWxXuRzXFvN6dKQjCseTPIDyCW56LgRZAfFyN1nDG1VsaoHI77ZNMU0xF7ZEayb2+GfUcXI3x/5lAyip9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF72E3677A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=924
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504180066
X-Proofpoint-ORIG-GUID: qg8SQF5niJOUg_6OlGHX1dO7kHkLwfND
X-Proofpoint-GUID: qg8SQF5niJOUg_6OlGHX1dO7kHkLwfND

Hi Ye,

I asked you in the other thread to cc- rmap stuff to a number of people
while we sort out the MAINTAINERS file, please do try to do so in future. I
caught this due to a lei rule but otherwise we might miss it.

I have added the cc's here for you manually. Thanks!

On Fri, Apr 18, 2025 at 03:52:23PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> Minor cleanups in mm/rmap.c and mm/memory-failure.c:
>
> - Rename a local variable for consistency
> - Fix a typo in a comment
> - Inline a trivial helper function to its call sites
>
> No functional changes.
>
> Ye Liu (3):
>   mm/rmap: rename page__anon_vma to page_anon_vma for consistency
>   mm/rmap: fix typo in comment in page_address_in_vma
>   mm/memory-failure: inline add_to_kill_anon_file() logic at call sites
>
>  mm/memory-failure.c | 15 ++++-----------
>  mm/rmap.c           | 10 +++++-----
>  2 files changed, 9 insertions(+), 16 deletions(-)
>
> --
> 2.25.1
>

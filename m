Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39612980A7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433619; cv=fail; b=r5Ql7CPlWXLB+onr8nPzb1HDM8Y5zg+bdUawrkX3dUK1Vzu1nK5/ycS6pa58qiFFINVmjaeD99tSJ+ualb/ONJ2r0Brul+ohHQbq3ajXYzz2q90TpLDDUZSVOmgByDAU8EzxSVJLJL1a4TbktHT4bf0tz3chudvpDx+qDifHgQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433619; c=relaxed/simple;
	bh=U6yL0GruGwkLz9GZE6yYmN52ZxFHBA6KT8ENalyzuXY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ORriuwuJ5bedSe8o57JzhGMcP/0zFG70wmp7LM6x97KxdyORqoKDz4joEZclsAiSwiQs4VbK9JPS9CXMAN1p3fVVmUFYB0dVydJy3asxMbgF72YNstf7Ql2h9oWY83TmLe76Wwh9+O4rQ6jUjVZObqFfaP6rKCEyK7tdFkDcFio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L2WqHS0Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HJ9UgJwL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L2WqHS0Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HJ9UgJwL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBlmA010406;
	Fri, 20 Jun 2025 15:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=BtvHy65fczR1p/at
	YPab+EHGtzzKZEfFwJKkosfiQJ8=; b=L2WqHS0QqeGwh3bfTeKCilj2+8JX2jF9
	4AzH2IU2iWsa0CwjajDMOETdRrwXMkNOqMsrQEXzrtKFJkqJX1F4kp7cal9PJKL6
	F36My1lGR4rDZkh89ocSlVk8AnpD7GvlK0LXRh4BFZ6zYqEAOQzcaFfqvYoyQy5o
	hKScO1flj5IRRmp9/2Sa2mCGBiluqJfDbP9V7TBVu7Mt5MYHNbnbtarfQEL1UEmy
	WGhENJj7PuL820mfVj93qi1Zi/sgbpGUDniDhTZ2+9pXrpIqI/z5ZQdbjNObJDGD
	4NJ0GsRx6wZpCujtrOR6nvThZGnEfFJiO4mQkJcnlg03F9Q9dIpK7g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4uyby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEH3BE038224;
	Fri, 20 Jun 2025 15:33:10 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhd22vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tksio2GojZyMzl2E3mUXfZRjgQmlIr93dUnw/1F3hb2s1emYw9GFWq1C4HPYRe+g/1ADATMWzugTAFj44uUYULcelKV/24qd+APf3PQhI//9wb+0ufZANg0U2MPpwSF4SayadzLJ+T/T9RSJ1wnLcmybyc7AVuDaxCbRnBaK0FjjiAjrw+MiIG4M/olpgtpXpF6Eq6LvLpgn11xTuGeCIApQGwlliB+c9IP2d6Mm8nHk2/i3aJwMNCNhUIe4BykktLv8Xzgf5iR51PdY0MUy1+eq5ncR1wuC0fjgdGZ1J4OptJROKRDeWGLLiDnBqpIjw3+nuJHyHqjXGukSgaLE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtvHy65fczR1p/atYPab+EHGtzzKZEfFwJKkosfiQJ8=;
 b=U9WSt9uKIbghP07y+GXiCvqtB6p7m7DyXpppmHvMrLYo9076qxvoKgVx/tahad+Z5ec4EIWD/p+b3Yjn3yu/eZFsSTRIlmgAfvwN4qCyuFQZuw+2QzQTr6apiRuH3Hex0PSWc11x2iagS0DhfVAyEq2SlHLpRPxOJ0crMW3fIoTJSPB/4QAGq/6xdryoWnrC2EYV8x4xWLwCuB8Ii1dh+tu6TiFBozqzo7H9gxGQviCXywqYzw3OC58IzzpR7vvupAx2cX1vGdyhnwjgfrTR9aBwa7awnjko5/i1ALCNod3BK2iBM4RT9Eg2odqA08FnWgOZrKyJI2WFPcpFovgqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtvHy65fczR1p/atYPab+EHGtzzKZEfFwJKkosfiQJ8=;
 b=HJ9UgJwLtP2G3nNF688O2LrFnStOoHsoAzk/adMasBmbmFR3+94E3YbLyI0+hXFl5d798V2k/68fEghr6WLgSTzhwhKhcBd94SWL5MTmvMbirplRrl8UT13CAQhYQfXRC7Hm0k5I/5fZRK8GYKRgQxal1aVzkpR15sYAskcLg9M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN4PR10MB5591.namprd10.prod.outlook.com (2603:10b6:806:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 15:33:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 15:33:08 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH v2 0/5] madvise cleanup
Date: Fri, 20 Jun 2025 16:33:00 +0100
Message-ID: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0113.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN4PR10MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 5390a667-bd00-4775-3805-08ddb00fc229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vpi5zaArdQHuMWqk4PgluY9vQ4kEAn8m44LO/zVzvPgJXtAYfxUlU4Cu0DnP?=
 =?us-ascii?Q?OJm0RQpwRXtRO48eFoTeOigBIWBhQN0XjoAYP0pZhvyJE8T6tsJIGCxPBdyG?=
 =?us-ascii?Q?6KxIgM9BrWKZqh2j3ZhM6I09jUNrUCEfvcCPc78SdqHX8i2N3mslFMLXBQ/G?=
 =?us-ascii?Q?WTdntyEY3/xAH1od6oNg+6NImbmygOWsB9qsheTb6U8aULzYQys8CjKX5iXB?=
 =?us-ascii?Q?Y1giZNUIqUfi4b9Gxf7cD21PLBlcKqDy7zvJVzdq8c9+a8ulMKsrh7/WUA3G?=
 =?us-ascii?Q?Woyhlx47yu3XbBVWdBOV2zXhd66JtGJ88V4O1Gds0jnKdwR//nF1Yk2IX939?=
 =?us-ascii?Q?OdNgenTjDUgrhzi66ulq8SWAuK+05NFCxkggunAbyj67QzD3mjn30lhsGJaG?=
 =?us-ascii?Q?bsD7wY2VFATHFIW7x+TZrn+3jTCsmFbHmZ1xBDgBxiUDfWxi5TjvGRJ4jsza?=
 =?us-ascii?Q?hxKmpu6f1nB8rHfYH1qc/xUu6ZZ0GVZ5ALkDWR5VwmPXliyipMFKD9Jt991b?=
 =?us-ascii?Q?Zr6U4sebXQXK5/Rrw9oI3K6eELMOuRUtw2YxKNEFOI0aavfLtdTEtXSuisGH?=
 =?us-ascii?Q?pKXA8G6kDrhRhSL6iIp0uLJU5nDdoUjSlo3/djpuv8Fq3MmYMEQ/kP4U03xq?=
 =?us-ascii?Q?lqPkNUxNY8Cda8PuoEraHY78d0611OvB60TgFpTxogbLsP3++IVbFzbU7wOb?=
 =?us-ascii?Q?Cl97cnopt8whEeIi6nQgbvh3zvUqiLcWmAotKUnHgKpk3OEjPZdOcvQnOn4T?=
 =?us-ascii?Q?v4Km7gnuaHHNUqXna2wl5eKj/2gSt8cI+3RCKPJ86LHMgUZPOBbsl0eDYvfn?=
 =?us-ascii?Q?DHxTwzCvQLU947WoQUE2GYHTymTHhkfnZmusZubCRXOmxVi70FsCBdwk65o5?=
 =?us-ascii?Q?CblvTXHmxa3GikGvxrMC2zVVippr34+YhD/20QB+qs304pmUtpDLvoHCeKye?=
 =?us-ascii?Q?lSV1/OVx23tjoLlfpN11kEQwfHtnUblMOEOiwRtoy3UhC0rk+oEHp9m9IFQz?=
 =?us-ascii?Q?a8zy/iL3Bt8jauf0Ew2FZ+ezHMp0KPR3iKWwRnTyZKYdyVjVTVC1tEeDgnCG?=
 =?us-ascii?Q?szK1xPkkxQCx1m07T85R2/4WuZ/Wk9Nki2CtOApetE8D+o4HOKOe8WkbxxEW?=
 =?us-ascii?Q?T5nB/6tRJiV3Uk7JKxi+SvbmCZ5gqT9zUZbFUxtG9eilI8gNbfz0KKyF5XtM?=
 =?us-ascii?Q?k2iQ4Am5T9vdTfE8OhY/eEIRyUfr9HJd+OdirYzZPhcPbcklsSwy8pOYKHTa?=
 =?us-ascii?Q?fNpVPuy9DDqxejWZj5WZdJUeOwHcoHa1E+uzHwpgVVQRqthOH6dXB7pfZo1A?=
 =?us-ascii?Q?+IVVNmwQnR+ZFrfxtO06z1HH8owla+wGJIug9oyL9d2T77QWF5gos08mC7Qt?=
 =?us-ascii?Q?C1xoicb0yTOnvZudnFM0dEzVSfqBwZPMCcECs2rHDjpGZQzc/csd4FJyaU6m?=
 =?us-ascii?Q?XaIsA1EgYM0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cM8BK/v7FO85W1o6kAREXCWB1ZyTEBkmmz7RYmULu+tnKiDrvkP8a5aBCRpw?=
 =?us-ascii?Q?mRqsYrxNyUMDppJ4tP9HjLLU5YFn5o9NKpugcMo4rW7u/JAX7Q96ejztoslJ?=
 =?us-ascii?Q?Om+DQUYBZ9/qZbTPpMUvOzLuKaFm/YdbX2oyvkLgWEvqWWykIo7BtrA3ZTKi?=
 =?us-ascii?Q?CoearP3zDfC9Y0NI2EQNDLOC1/getitHtVC0jLPN8xXKcUEMHVpQuf9G9huW?=
 =?us-ascii?Q?u6KBTXey2DApU1orwN4+ZOjWBTzFI2JvG6OFn9rScuO4JzjU+D/3DBgaEG0U?=
 =?us-ascii?Q?4FXrXI0VM3F36uYf31wDpzB9QpGs2QFP0kztlzn0Z/S9o7R31f0Zot88PBJ/?=
 =?us-ascii?Q?dzG2inIJKyY+3cC8h4OLNSljfmeWNrvSpH1HnOza3y9pMUQYKWu0lPPIVx0r?=
 =?us-ascii?Q?B+D6Uqal46pw0yUNccllIbkkOhio5IGr7otsJ2aeR+OqTPAijtBTZENg44Qe?=
 =?us-ascii?Q?gYbwGSwcAyGl+POHUXZv5FtmvbLgoi6Tnhg8T+OyosZCQApuHO/bCwYl6c8b?=
 =?us-ascii?Q?oqfm8oiSQwHnicn/ZkM2Vc+IZKTAvCcVoeJtq+VRxo55lRGaOfK1RwkoCWYR?=
 =?us-ascii?Q?aC+nBuFRrOTXlpEKpzDYmaXP/ViUKVBppISQ8tGxmOG6WwLyahTAgbNV3BON?=
 =?us-ascii?Q?q3N+h7WPqNxXB2zB1r5lRDSJ7wacE8Dgyjs78XuM7EZGB1VeskOmrtyYeJcC?=
 =?us-ascii?Q?Vnfh9RWPiV1tnkJ3lyISEtYiYjbLhpWkMf+3ndAjvWUi9g+iH32ReFJPzlA/?=
 =?us-ascii?Q?zj9l/42ngikc61/9I1lpWc00/7i/zkI5eaUAi9j57G0JER42RCaFKr9Z/9vh?=
 =?us-ascii?Q?ugMK108HqynbfraryrULoA58JNlgAXDuooULrJsikhjBEkv9Zjza7e8FyrXN?=
 =?us-ascii?Q?DQUfiakRegYuydV3bmAbPN18zNfqBAv2Au3mseXUZLPNcruoJjjzgZpi/mRW?=
 =?us-ascii?Q?c1MZPSDAuGwBvAOu7C+bZQtd5sAzANr1cjhhUg14r1HjmDkedcNS0vqEY2l+?=
 =?us-ascii?Q?cNt2cWt6MErx1eag9ioHKKCqG7dHmDSZ9eOGzDy9P5b1RKomBKxLeOjqVXLi?=
 =?us-ascii?Q?aaMVniaP2XV5kBNyAX6rIRMmmex/y+ajE2BsrGryPWWMCzLjELL8DofUshVF?=
 =?us-ascii?Q?zVRN4kyVOLThQtIM4RUdBYMFF6US2xL9ZmKeOVlY73Qw8hEeGmixiD/GMBgy?=
 =?us-ascii?Q?a8AlOkIw29g6u5BWbU2htgGcQjfZJyyBno1JJb6XIwo03i9a+u5P3e1vqxiQ?=
 =?us-ascii?Q?in60moOCLrP336/jnxzZDq5cL9vamn+vbbOUwlrx6bpE7xVfhVLQS73eRgbs?=
 =?us-ascii?Q?JceAuPibyHlLtUIxCUZKEy1vEZ00eOCAZq86GzGahWc5KPM1R4nTT2ECBJqW?=
 =?us-ascii?Q?lTCAs4+U6+o9dXYd1GNjc2Z4oaGxIMcbUie9Q/jwx0vQyha5SPMkvEc+0CVF?=
 =?us-ascii?Q?0P7178cY48yKpI/sTKiXk2tgeO+Dh2Fe4ynypvwEWIvRfeNJ7tC/jMIyNXVq?=
 =?us-ascii?Q?ob5bIM9NMm/ku71ECaLgd+XYBUDk8IyURl0Q9ChnLOqGd5n5Ow8mB0ztSUI0?=
 =?us-ascii?Q?uHuOrdT7M0rw29YFK+gEvZ/0oaB8DmL/UEWPoeJf2FMmgQo2okor+SnVIxFD?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qHxtWD4UYIrR18PQS/8XtTaZvLK2inni5Z+WqLlkHpAiMwigQ6Sbf8x45D0ZobZmrk59qzFI/o4es9DdqCC7sCWVIIQEUP09DdCwawfKbGB12MYL4ya3Gxyiyf4Z6xnO4LScR4WMdMhyDqdlzVpd6xGsIjux2lhNxcSIP0B6m471Pet6+vnfSmMbMklniOcTH+bQGxHg2hLJ/jeW0cv3Nt32ryEDC2poKy1lzsdW33d1rgd+pz6yedxHSfWnRI38JCf+PKiXVSugFNnlntW1vywegOcAw4LBaXn9DVwh8zY61qi7JjP9QkxYl17F37U1dgFLuJbtV5sJeF1TGig1GguABT4P4nbEpSeSCFmGAFYQ4DOTGvgrDouXZ6xvyLS2EEqKi92NY8TwbsBPYA81jv5sksJVmVqQbVBzaz+irPxu7akhajHtK9FpvMx9Fxoc5T5UArLpJu7/5is6qCszKaTQzDWtGIzltIvWuCHEfO0gG3pQRwhlpbx0Z0qEoZktiFrMXrbtY+J57rHrAqvCakGmgi63jkcRSKO8d8q6aYEm7cSvdP/jm/7POrSPJ7J0R8msuTrfe9A/4Aik5SSTcHidxyh8wjwyMzig4T9U1Mo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5390a667-bd00-4775-3805-08ddb00fc229
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:33:08.5772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6s0+lbYMe0b9O+gdG5hPxMHpFiuXmv+iUv/BJFXa0OuTh+sLJl76n9BghcL6lxqtXM+HcF8aYItt/PCXlW2JCZ0ytT6VWkvrhcC48Fl0odc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5591
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMCBTYWx0ZWRfX5JkKLQTMsCnq RgSkNit089bFkewgFuDSgAa1wDdH2QWiIxQepQiM67yjsvRY/8MkyiKvrSzj18Yi6pWrRVep7bD wlq+34SfjNMwRzCkJDHqow2QhFhgjDjkvPEaAj/H8wIHxlISwZbx3NjvwH5g+sWY0SgSMuI2Vbe
 ezAtN3kVi1JAJrratvy0BSHua0IxK1MCvKav5viOIPFG81NJ8TiRpXEJfp0cmldGrBDl68hnGV5 87qniH+FaNEAH1LwfA2N5uDUboiSfoEqKjqClkZuzekQghK7mI7jiVK10glXETEDO5fglqHE5/P X8DQVvcKTCRbgfPKRIlO/GYJyGkDKmG7AvJpyEQ5oFjFphYIkJ2C1WrK4Nc4Jqr/+qqzEokXKnp
 p/mtelW/nydgxOB5+H2rDVBBk2JSjQjXQBaLafbTPGEtY4NgIyySCFMsl4MI7F6RmYmnA5dy
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68557f38 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=BpqHhWx3rprZVSaYkhcA:9 cc=ntf awl=host:13206
X-Proofpoint-GUID: usv6kGywah6wl1Ky0GqBNmZ-G122jW_B
X-Proofpoint-ORIG-GUID: usv6kGywah6wl1Ky0GqBNmZ-G122jW_B

This is a series of patches that helps address a number of historic
problems in the madvise() implementation:

* Eliminate the visitor pattern and having the code which is implemented
  for both the anon_vma_name implementation and ordinary madvise()
  operations use the same madvise_vma_behavior() implementation.

* Thread state through the madvise_behavior state object - this object,
  very usefully introduced by SJ, is already used to transmit state through
  operations. This series extends this by having all madvise() operations
  use this, including anon_vma_name.

* Thread range, VMA state through madvise_behavior - This helps avoid a lot
  of the confusing code around range and VMA state and again keeps things
  consistent and with a single 'source of truth'.

* Addressing the very strange behaviour around the passed around struct
  vm_area_struct **prev pointer - all read-only users do absolutely nothing
  with the prev pointer. The only function that uses it is
  madvise_update_vma(), and in all cases prev is always reset to
  VMA.

  Fix this by no longer having aything but madvise_update_vma() reference
  prev, and having madvise_walk_vmas() update prev in each
  instance. Additionally make it clear that the meaningful change in vma
  state is when madvise_update_vma() potentially merges a VMA, so
  explicitly retrieve the VMA in this case.

* Update and clarify the madvise_walk_vmas() function - this is a source of
  a great deal of confusion, so simplify, stop using prev = NULL to signify
  that the mmap lock has been dropped (!) and make that explicit, and add
  some comments to explain what's going on.

v2:
* Propagated tags (thanks everyone!)
* Don't separate out __MADV_SET_ANON_VMA_NAME and __MADV_SET_CLEAR_VMA_NAME,
  just use __MADV_SET_ANON_VMA_NAME as per Zi.
* Eliminate is_anon_vma_name() as no longer necessary, addressing Zi's concern
  around naming another way :)
* Put mm_struct abstraction of try_vma_read_lock() into 2/5 from 3/5 as per Zi.
* Added comment about get/put anon_vma_name in madvise_vma_behavior() as per
  Vlastimil.
* Renamed have_anon_name to set_new_anon_name to make it clear why we make an
  exception to this get/put behaviour in madvise_vma_behavior().
* Reworded 1/4 commit message to make it clearer what's being done as per
  Vlastimil.
* Avoid comma-separated decls in struct madvise_behavior_range as per Zi and
  Vlastimil.
* Put fix for silly development bug (range->start comparison to end not
  range->end) in 3/5 rather than 4/5 so as to eliminate it altogether,
  having fixed it during development but having not put the fix in the
  correct place :) as per Vlastimil.
* Rename end to last_end in madvise_walk_vmas() and added a comment for
  clarity as per Vlastimil.
* Update madvise_walk_vmas() comment to no longer refer to a visitor
  function.
* Separated out prev, vma fields in struct madvise_behavior as per
  Vlastimil.
* Added assert on not holding VMA lock whenever mmap lock is dropped and
  abstracted to mark_mmap_lock_dropped() so we always assert when we do
  this, based on discussion with Vlastimil.
* Removed duplicate comment about weird -ENOMEM unmapped error behaviour.

v1:
https://lore.kernel.org/all/cover.1750363557.git.lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (5):
  mm/madvise: remove the visitor pattern and thread anon_vma state
  mm/madvise: thread mm_struct through madvise_behavior
  mm/madvise: thread VMA range state through madvise_behavior
  mm/madvise: thread all madvise state through madv_behavior
  mm/madvise: eliminate very confusing manipulation of prev VMA

 include/linux/huge_mm.h |   9 +-
 mm/khugepaged.c         |   9 +-
 mm/madvise.c            | 585 +++++++++++++++++++++-------------------
 3 files changed, 313 insertions(+), 290 deletions(-)

--
2.49.0

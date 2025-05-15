Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAA01F8F04
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335871; cv=fail; b=YJFqkUBiBVUFC/MCyak1rbaSJPkX9v5vVIkI12wL5dCINiF/zVOqyuSOfh/H6vNiq5v2aysgRpO7ckmAZ2iuz3B3g1brd0wq+rTSiaPSj9Iiuj136MlNBvC82nHSpvlKbsZsmEUVR4Xsp7vFX3JCoAgPqGdwm4ANNGSAkADg8hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335871; c=relaxed/simple;
	bh=eB9s0WSZb32oQi/w51CFLXjEiZ9dq6ECCW9YOtpUMIM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OZClmUTDRhANQKTGLA0ww96Kboe0IYIcdz+7y4Bzy3NN897G2n+mtE7mWSMpxjIurav7sbbd9N0+2yeSPPc4/CNO9Da9ReaT8e8ikcsuvizpMKICugc3ouzoSDhVLM/odtGZBeAvpSpThHYLg+qiEQvWFC/u88eMcpy6442o7QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TH9WEIz4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tqRpWNwP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TH9WEIz4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tqRpWNwP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1okw006303;
	Thu, 15 May 2025 19:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=bwJVwFf2uUKC1UuN
	/vnPOOpSOqGNRlo0su7tQxInawI=; b=TH9WEIz412nPNh0dkvBeiH9JwRny2SrI
	doVIprERUwSMeoapceyvAk6J+GgC9xlj2+IP2j+Mv8efzhBXjs6ZT2+KEh0FNZbx
	Z8TGZF5KfnHOkUgWCRqZN06fLGU4wLY1c2TAu2nUvbDGr7L8/B2bUZTV+AjEeD+Z
	SveV35dLMTqdxcd2cDz2Ouj8ug6qWj5jQwjFrO+ScQZ4pOwc4EL9f/H4QgqjuYfX
	O5muISUzzjYZlt9tFytkXgoSCm35n9hPzt7zg4sK8wbdo0dzWm5UETafqJ5Seg+C
	rbZ99obIPiwof8nd3YlaifJrcFJU/A1aaato6hAwrTu+A627DobfZg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcgvxu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 19:04:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FHHd61004284;
	Thu, 15 May 2025 19:04:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mrmegtxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 19:04:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfXnGbw1APH82gvIEHHp/q7W9TjpWk0abmDj080tZcjEFAB5iH1h3LKTOATS22zua8YkWW1o6WJJD4unfha8Q56/3K/LIhWS8VwBW4uVpTB+C+SyPsz6hojspqXx615PAkfeP8qe58k6UwwMcuEBC6cD2uw9Ix854aDcZ9iBudMz4w/uY5pHkrM44SncxYyy+zPcx9hri632q4oHgxDR8OsjooHeeQV1C5vL50O3guvQfXqa9JiFKY157XJ4+OyF5G79aPM4n+AsJcFpFFh6IPqSHZySuVEsmOu/UXskuMV++L+Ozewfh3yYlaHhNs+Zieb/a5qT8u4mQx9GPMbVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwJVwFf2uUKC1UuN/vnPOOpSOqGNRlo0su7tQxInawI=;
 b=pq8597pVT31kCJlH15MY0WtKYA7sUE14P7t6Lu7q+wb/maTy+L/Rs9D2rmRXZehgoBZLif9VQ46i9VKWDkAtBbBecyRDGa3XJRWUFoWdoyEYPgTooXsbyn1I2UuA0dquYHjCd7mbZiRyD1IwauJto+Xommuv2VzL38ju5swz0pH9sSbRwza4ww6DL5th38TldfiA9bZB2O1+zqgKv5BRIf4UV0zWAxC+PCtlBMwsRhKuumucw1m9hO80rHOzO88ajNMOXokXDwVSXGXDgYBUYrmVe5syCgoFbNiS2vMG6QsHDZfoJeKPknfQG+SCZAz0NU07KUu3H1xQgWNGgrnLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwJVwFf2uUKC1UuN/vnPOOpSOqGNRlo0su7tQxInawI=;
 b=tqRpWNwPcVbE+dgJ+d/T7rruRtGAtASdd4stob9gKh+vFsxH80GzrcVHXyYgCX4C2A73a+g0eaVJePvEfEZQzagDy6+Pa0tU9BoK+Hmi5b5RhvfE6WrqF1q590Ggff5cWq+SOQhVo8OEM0vVvAnPkeOx7otTQhqYNyYPlSOdayg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL3PR10MB6138.namprd10.prod.outlook.com (2603:10b6:208:3b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 19:04:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 19:04:14 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, xu xin <xu.xin16@zte.com.cn>,
        Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add mm ksm section
Date: Thu, 15 May 2025 20:04:04 +0100
Message-ID: <20250515190404.203596-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL3PR10MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b45e0b-40e7-46cc-db27-08dd93e348e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JsoGexIpRxDyq7jQyCQJpSzz9uKPS8M02JO+BwvjFV/g1kMXMw4YXWkHlmBP?=
 =?us-ascii?Q?8Rj+JhlnN7XZ3npmeUU/sQRqvhel5biEANRTwfz0iyRKw9q8Snl+yVjwC601?=
 =?us-ascii?Q?Z4jTek2vqaCZhCbJ1QG8OM5eAyqEbGMEpmgIjxs2x0t8ZoCz/YUsUo/y1hik?=
 =?us-ascii?Q?cuerJ0iDTbv4g+WzBODT+xXjIhiHftaJxJ2m22ciGkFB0C3dE+6UxamkGr5j?=
 =?us-ascii?Q?5Ec4xNWYVcj4loqWHMwU08+STyGC8myZVcFMoUVlzGKvrJsXTmSOssheKsbr?=
 =?us-ascii?Q?LPLjGCzpeXdY/X9OqyM5YGifx/4Q8+RlzK0Jx558G+Jm7t+b1iSMw1feu2wC?=
 =?us-ascii?Q?I+R7QuiaIPaN0lt47b0JcEX3n3mEovwd2lTPDkIDG4dQ8r1aHIsvzOKzKAMq?=
 =?us-ascii?Q?s9Sl9X9mt0+zIVomlte+0At/o+PgqopEXyjngNteh8+byFkpAOczLKQZxZn8?=
 =?us-ascii?Q?7TA2BhaBjWUocPvX6BlKi507oGshx2GBcBJkFdogNDuuhVMwsm6rd7vxeUFT?=
 =?us-ascii?Q?qHc/2xLNxoJEZmBT+OYI//y/YXY597oxrqDVYatU1C3gIaNxKY/qOr2WVBP5?=
 =?us-ascii?Q?T0xHW3z/E+rhi7Ro8tREXaJ/TqdHtGnGemXMxFlSaEwqBX2itD/NEdG11UoF?=
 =?us-ascii?Q?D0wV0lNVr+jrbLeDQVXQSUfsCXcFCfCSV0p9exq2SAcAvrcVTbfXzNzQitSd?=
 =?us-ascii?Q?DQuFBRiCPmhgC9Ru/G7MYcujaxVVGUUTq6DfRaDBjaNXePpe3M4Hfim+CGLD?=
 =?us-ascii?Q?0dcEE63XLv269Jt5DuIqvQDItziwk3aughjnNKeC8qhPXrVH+E39+x/pw7wc?=
 =?us-ascii?Q?S1hKNppyRAoJWZf/T33u6UnzY4t+uGT7wtR45V+uT4HmPGqNAtzCxrjVLNrl?=
 =?us-ascii?Q?jzN6GLSpGK6E24PoBRpxuHsd6bqNn74ElTeKNdvSjfALL6K6dl/mDYrrHXYa?=
 =?us-ascii?Q?8dy8NPtSamIr0/MNw3dXQRUHGUb6Imi+JoET66buPkw75zcgAOZTUZsMsqAB?=
 =?us-ascii?Q?DouAQr5z0U3ntYKaoeLZH0lMJEetjIdonWS9M2anqaLBTzh+IxJ7GgQ9TTnI?=
 =?us-ascii?Q?X6Vu+UptQdVt1MNw1dRny8lH4cKBpjpidZ2kP0LD8PQcGYCMsho15mTg2lOO?=
 =?us-ascii?Q?Ydg2lpGhSHyjNfJWA+V7PaGONLT6SsCDkwo7i2a5hRHnEykJZmVGiYfu5ME0?=
 =?us-ascii?Q?ecZx2ly19CKapDq34OLZv2Vati05Z4XVO/BQHSn9PHXOAId/bOwJYos+Ejms?=
 =?us-ascii?Q?qhoZr8/kcAqVcuHG68V+e33aOLsyMffMyU3mZUT/yEQyikSK5Wu23CPOYGIl?=
 =?us-ascii?Q?4O4Z8u9qZsvQIdARn3M0xpYLJg7xzRV1RYlpeQS891yQ4+KhuH2lqGH3lmHr?=
 =?us-ascii?Q?eMjR5/L4tRaZ8BfbJ6tbc+m+v833?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lKfWfss+51QzVYkcZRzA1baSjY/+wd+DCvgFSRMUyePy3tWN6o/mpJpsBVTB?=
 =?us-ascii?Q?kFn5UZW0CdaFUfhNVheFFaGJfxWE2Eh1UK19SIuzvor9oc5GYWaah2mVtOP5?=
 =?us-ascii?Q?fct26N6U/3kq6YyTIAzvkUTLsDsZN0/lHRMM24oxmFbYnLYXXn3o+/mCQM6Z?=
 =?us-ascii?Q?YRud3cs7eRODM/FHEZeZ3snNYsTT1It5EgnY1g40BHH+8kuh+FEWWbkR/X1M?=
 =?us-ascii?Q?P+gLRWR2vG/ROgT9sV+WkK1xmWJxGs4O/TTfGaqBQd5vemg3IRuov/bDOMfg?=
 =?us-ascii?Q?ij5KlN26wvLqlMkif4YfzZ8yb92iwG4ItllTbTT39Ivs28xLvVEqEq/9llyo?=
 =?us-ascii?Q?9GTZPt6xyM9ME1vavpKQZdnF8UoUIniatg8eDLx+RJ9Yj9U36exxLsNGSLfe?=
 =?us-ascii?Q?gi+C9daDM/PqQhzs0R4nZM5Apzsbgqg2q9fXKg9nU+vcv+YNef9toQ8nX302?=
 =?us-ascii?Q?+kb/IGsBPPp3b2EyuP5VZYdytajljBcaHsTjPtf/hL8L08xS/K4NMsNYpO5s?=
 =?us-ascii?Q?Ym7cGOu6u4Wga93JKzFI1EviDMxppLZhrZaJPa+0Kt+omkpq+WWCaQu1VwMI?=
 =?us-ascii?Q?Suqw5SADBtAe0dL6GzQqVmJQc0YCI+/UMMTmBRvGFlA5o2tYxzf5Pn5MCyB2?=
 =?us-ascii?Q?vQ9vvu62dWZzuXEnisACuuvpPZn2Rlkn3k8xczEKmvXiLSFlvIld0FWBNJ2s?=
 =?us-ascii?Q?SBtqdpLP9HarA197MS0fNsDcKdLz2s1g2ottQQpI2uz3n6FccDMVjI+aeazy?=
 =?us-ascii?Q?UbiiOjZxCqQpzoB4aIa0I099Re1cRJYF+lSRXfORzPn5B3sFzJJT2Uu3DHEw?=
 =?us-ascii?Q?dEaxyaaY051KK/NAw/B3ovk7AlzuCydHawFDw1NUcbkdv/vJytTmgJO5+bq6?=
 =?us-ascii?Q?b5sCC5HinRTW7b0Gi5BgGKOBq22PY0AObTEClXMR4ruz+jNMKW5X0Eez/Wz/?=
 =?us-ascii?Q?2lPYk0UyKXWhUx2r0jFBPmsQ2VnrqffNxUV/O4ul5cxgy01YixCQwEHnmiev?=
 =?us-ascii?Q?xxhryDLevSmNvSkWD/9XpLAd6W9RmY0KDijSa+di9iYNBxG0PYIoTZhaNLya?=
 =?us-ascii?Q?kj6Lf6YdzNrqzyEvYRzrZbA3pyhfsQaBjO/20sTF3SsVwlcVkKQF+6eYf7Gs?=
 =?us-ascii?Q?Ub0oCLx/LlUURml5Lb/4BDcyqRf+YENKBej4/V2uOeg0z03c2nrAonRZUcTn?=
 =?us-ascii?Q?C+kNZQrD13IWPGTaWB8wpGbPsJqfaSOe5GalLK2WX8xFT9CJgVzWOr1P4o9P?=
 =?us-ascii?Q?EnjAl8IKusxUf5FPoIClLzO1mtuRttBUf7P/scxtYI0ZdzHDUr9HpwhQQNcj?=
 =?us-ascii?Q?HczwqT7Ip2s5/OaYxzaECjYTeSC/y8aCas/dJT5XRhLUHqbznrcIBWohNMLQ?=
 =?us-ascii?Q?vJbWVCAJwE67eVnT7NtFd62eSZDySzrVbm/h8S2O3GUd2VI4YTl/ozvisoHF?=
 =?us-ascii?Q?GAGQ2NAFPUCL3FpSxruVsUVaZs2C/vjey7Haq7qKgTH6AjcV/0pIPOZMg7bR?=
 =?us-ascii?Q?CZhuv0NGWN6RFEldD4x9XjbipMet0dQr4gCZDLuR4GCxQqBSVSe03Oq0BtR6?=
 =?us-ascii?Q?EVCkN6Af4P+9OERyC5PM+SzfeBOFnrPdoXDA9m396o9ciffpZJklIVNdMl27?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4RpORyh1v2rgIdXN5IUxfqWjPt6u1Y5S0D3WVf87sfe9q/6Irjl9BVBkC7RF/h6x+03VhqQcU+WrjmXW5R2gzqcsl+qFvYhDhdc7HbwxjP5V9W0iEfOqIOHXVqtajAZWYwuKX7bB+ST4B+vdGaACUCoo6Xm/trs9ZnjNWN5dH21a6iJ3Ib6nRb79dHSWxJoQn5RsKjZyw1GubYgNvM3k5COGs1Zsm3cSqNAEMi9BL5trSzuyNuQOCyTqsHO+yzataWSQwTjB1fvJ+so8703vIIQW/xLoFyai6gldBA0nh1cVC3pXHAZ3F+0ghpq5cYid2QPPKMdtNqU/yRyGiDqc8AyHRHwZNw067/VGymGO7ZeclBik5NKJkNtG+KU5xdRj2kiz/wa5WschWBpYBYo2vwoG2NPHUcKEHzxoPuZxplBiW3u1tLetsG0PVtV0ImMiRIQhJ5HI8PSiCs7cwWX67x3cbSQ0SkeNRgDffoFAGhenDVzT7Xw2u7Ql9Akq8AMJwt5NbcLp7PuQUHmTNVslHY81QRLa4MOOPKIhnl0FjSAO/ZQl0Z/8wmEQJdcRDlAo1r6788OwwSZadWEteno5IpwjfPrfE9pAb6yHospP8zg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b45e0b-40e7-46cc-db27-08dd93e348e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:04:14.7407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0HkczJNG5K5K+qbCqDeKmOrEvsJX8pc1MG2xaRi72sjkyoRFJc/qkccGhRY+3jcNUXOhtvaqH9AD/ZUJwmv3WOvsROIAFHniN3IdEwYEFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6138
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150188
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE4OCBTYWx0ZWRfXxy5LxJhbKLAa SbJOiUMy+6FY273ZsCg0xBPFLkiGmn7yUjwERQwgAXBDTNhZs/1px3aum9jfXz8DcxNh5cjYhQC F4NXn+RvXn/XG2CbkAPnfjHXaUJAg9dqgMbVeb5uTLM3Y2K1EXLQ1wql3xqRFOIZNzajpbRfFbH
 fb4F+IkT+8vAkb9vqoKhQnWLgRvhegO6gR9/UTzSbz5LEU3eHGTJH+BEByWwi2acsKSe0ZSKJa9 O34dzSnLaMLcNR/a6CJN5DaZLT+rC22Vk1PzXDbU9sLdtg9EhHHvf0hoZPZ+2cFlGQFF2Pi5a2+ 3Ek3pJA8/KBbPPtiw5jbRo/CqevCAJKTQfrsrkUU7IVl2Vhb6YvKo08eDt0VK9IqpgL6sY3QeYR
 w4eYCxeMSGvd9LNMPP6No3YzRYQKwbkUjDAynqHOSl9Yl3iStA7KxfAYEAHTRjNiauLkiCrs
X-Proofpoint-GUID: LMS_XInWSBAZYhU05lWljwR_BEVGFnkY
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=68263ab3 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=1-S1nHsFAAAA:8 a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8 a=1RTuLK3dAAAA:8 a=37rDS-QxAAAA:8 a=cjGtlG39UyusbnDD0z4A:9 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=kRpfLKi8w9umh8uBmg1i:22 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-ORIG-GUID: LMS_XInWSBAZYhU05lWljwR_BEVGFnkY

As part of the ongoing efforts to sub-divide memory management
maintainership and reviewership, establish a section for Kernel Samepage
Merging (KSM) and add appropriate maintainers and reviewers.

Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Chengming Zhou <chengming.zhou@linux.dev>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
v1:
* un-RFC as consensus.
* Capitalise 'Xu Xin', copy-paste accidentally made lower case.

RFC:
https://lore.kernel.org/all/20250513161758.136402-1-lorenzo.stoakes@oracle.com/

 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 314007e2befd..8859357122eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15577,6 +15577,21 @@ W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	mm/gup.c

+MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+R:	Xu Xin <xu.xin16@zte.com.cn>
+R:	Chengming Zhou <chengming.zhou@linux.dev>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	Documentation/admin-guide/mm/ksm.rst
+F:	Documentation/mm/ksm.rst
+F:	include/linux/ksm.h
+F:	include/trace/events/ksm.h
+F:	mm/ksm.c
+
 MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Mike Rapoport <rppt@kernel.org>
--
2.49.0

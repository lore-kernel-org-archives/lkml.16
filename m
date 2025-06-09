Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19E2566F5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475677; cv=fail; b=YAJWTf2uuPmb2BRwJtNWOrtBUtksJJ1vzDmMlSb0/ewqtlrrHYZCZ3LfdLE7IsCIZHaKgOz4MC1msXVtVyZIh4+jFwieoHuPdhnyrGWb/s7jHcLkjYYEhj+HpBbdyQ2VRgLRIYM+AQTtmlPk/EvNnhe8frVtkNdq2n/IAKzgEKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475677; c=relaxed/simple;
	bh=N9VWcreQKIkKQlQxYTdQkEYZjvCMC9v9olqXlRWcwAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RvkZonTkb3ADfBEF2b6Y/bwy7epTg8IHlQe4i9q78HgEv9hYRyd3VFafYxywQES6k0X447LZOEkiI1jAyAuvtfKeAEcrnvN6THioD12S4zdWksv1YggMrC9ameTBkXY76B2dUuihnw5sHbkl2FBpjW9AFZScI2v0OW0f+avl4UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IfL+upE7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S0398xPZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IfL+upE7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S0398xPZ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593ihJx017205;
	Mon, 9 Jun 2025 13:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=UvUEHwgbvWvHdYKMZiKN9Ao8MJG4FEQMhAk1hOqsSdM=; b=
	IfL+upE73R632mT7S3NM+d7e18Zg7Ecyz24fa7YdheJg+MMZtgGcLnrPTN1YNFjR
	logTIK+T/ybchQ5KBqB4qIAkw+jznAtGqDaKEK6WSCjSemydmZSq+XL93Tf4OdX9
	foNa/zJTGsFc1x3DwBQQbW+JYWR2P0fyhenmKxFnQmTDBzMmUowr0axmS2HhN2YL
	7QyhVjp+M7jnsIwxQLdv6aUtEvtIiVpWlc+fpo40xmfS9WMi+CYAasXGS7Jkk083
	c7QsJEFERRB//tJ6TbER/Gf5XYHdGElGrAAxfvVQhK0745lAv7VMKv3lbKNVeasR
	12J3pAmDOGWL6uMICIgdtw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74t55c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559BJEKu021452;
	Mon, 9 Jun 2025 13:27:09 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv85swq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsU5PM7oc/qiUQbkKgYJx7K8Uqn1DKTyLdrSAy83r2+1hHbOmuIm3Shea4uT/5l8iUhHVQLzbuZtL2wzfBWq7L6WmwuOVn9OSjbmNVRIsby7N1ZrxWOTiLUMRfHegJBBjH+DYHbkgkvBBqoygUhXdkwHfhfe8W6l91DeT4jGwFY1/gFyhiqtU736gzRlfJsxpM3RwoEiAKEdxqX+lABM8XBdQxIlyLaUxVzYxbmIl0fdcDxWWJbY3kMPTsnI9jbWzUkdEXwdwnK24I+8Iu95ev6dDu55B0PCCqVloGsM0jGYWPw3crYnLNIxH3QnSnke4rdc+3P+/NuRfc47I27Tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvUEHwgbvWvHdYKMZiKN9Ao8MJG4FEQMhAk1hOqsSdM=;
 b=jy4Pg9IKXk4Q1oyxCCsH4S2zm8Iy2l8Xz6ZzQkXNoGvcKnBCnt58KevvnB7lSNWDY9KOgh3cfX6vCewyopSBIrl4fyN9m24eZl3YU9UMSv4zPJLChJQfOU6hCTxpsr5U3pJN7BAhmqeiGfiWNqwbtow+n9iemIpF5UCIVoTI43VpQUY/j7TckjEEKwUMVafkkgpAlQeoI28JK/yIFGdIKVlUmi1G8q0gZgGBa9hleVWhaasIgkjmFE3IjW1Ecj6LoGzttifO63KQyWsXacATsqITQiRAfTNXHTt/CgFDrurfEMqQ8eoTO02m5MHOKzNvMHbaWiX/GlaEP+qdVIgpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvUEHwgbvWvHdYKMZiKN9Ao8MJG4FEQMhAk1hOqsSdM=;
 b=S0398xPZOgxcZnV4vNzEkYs9XJjoWEROw03tESr9ZVnrwUnA27u7aYYjwSItD+qJ55PqOkOnCQb2y1v91Q2BJERLVNRHRAYzfUEc3f8aAHSWr+CviU6vKjq49lY1BFx8EJmY/4RuepBwYM5+ujksqjll3B6+QYAkcTFlIyBp+cU=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB7849.namprd10.prod.outlook.com (2603:10b6:510:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 13:27:06 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:06 +0000
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
Subject: [PATCH 04/11] tools UAPI: Update copy of linux/mman.h from the kernel sources
Date: Mon,  9 Jun 2025 14:26:38 +0100
Message-ID: <ad488a05068ece234efca1ef025208b2aaa127cb.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::14) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 11092588-ffc0-46b8-ca91-08dda759547e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tNeyJ0hgmHIsC/r0WCi7uky6UALW8FIpXUgt5/bRUTqhu0NC7+9Sgp6KURWU?=
 =?us-ascii?Q?/JVnGG6qt2cMP5vfe8PqbrcgrWUY3mDRupyDMdR3HyN3XjGQKIR1exR0DzDX?=
 =?us-ascii?Q?QUgmONhkxg7r6qem91Nk/0LkaCeOYmsSjgmEH/OMbnsHkvtBBo0Oo1DDvoYC?=
 =?us-ascii?Q?CNDfZfIqI9OyZVHT3umqmXOw5KnXpANQ8ddPdnCFsvrEsVIw/jiJQcgAlGy1?=
 =?us-ascii?Q?lQ2vM76QgDaqfVMWuBGAdLq5eOFJlG3exVv2QtbIt7gs75mJ9yWaSl6kx2qX?=
 =?us-ascii?Q?w4u1d90rYGOQxRVLmHRXmLAZ0Kqmqj5KYsTMKWIsiT5/HbFW8Bk6Yj8JN617?=
 =?us-ascii?Q?PdirlIGuFjr/5dQ38Sp4Uc+/BMDflupAe/5OwlCIHaOlnSJVFKVIRWqic6Nc?=
 =?us-ascii?Q?74O5qW1M8rd47K9+9lYVZYywpV7h0On70PfaQZ3KmoyoZRA5KNF6Ef+j4dkG?=
 =?us-ascii?Q?iXN46QwivzjMYhsOK9kDc3x7lLgNQsmsAGAOturGKjfgp6C2GQnEjdI1hXeF?=
 =?us-ascii?Q?W+4i1V1e/Wo6sZN8oNGU0RQfvgwUMesqBXqxmxlQ74Cv/nmIhFsH/M7SnGKO?=
 =?us-ascii?Q?FzQkOeo2RM8DefWIAkUZl3EnC+rTwGUMMDrTWjqF/Z5eWsmfC0YWpbUFTofO?=
 =?us-ascii?Q?EP+RGljxg3MMaps8n1+GtzmywlDKdZ/IbLhZ+GEnRRhtZulKcui8PkG0//Xn?=
 =?us-ascii?Q?UCXF43c7DUUhXKQypJ4wzzjAQNlQNcZdc28LaKRhO4OKxuBff4b8HROA11W5?=
 =?us-ascii?Q?qO5Bow788t0XjjNtnjHLsWBrXTa05fPpA/ie7wnykKFk0hnit0UZNqQIVUf9?=
 =?us-ascii?Q?+g4gZ/ronyAi0lFRJ1prth0lB0VSyrHJB++7XQ9BAoi88Q7u/3ksGBozTJKZ?=
 =?us-ascii?Q?M7+XU5vuRwxxFefgfJVUGX1YBovEt+uOzCqkjTFudJ6Cj6UJYHb2ehVzQNYO?=
 =?us-ascii?Q?kKNIaHmMp1hQHYojEOSKylPJX0YDPpsUAC+Ugyef048A03vyWLbV6sDnNbCc?=
 =?us-ascii?Q?PTIRoeKjP+B4OMapzWQc60XH9ZNx6VDXT4m036O0tI+rxULmGKcMgahgiG6H?=
 =?us-ascii?Q?nwxsTW7IsVFlTLC+KIGhTjPCObF+gCExUVZ6vAsm0TYC2oDedbBTrsTFwL5F?=
 =?us-ascii?Q?RAVmOOVnAhpwMubfUKEKT3nSGioiu44FCVyOV7d8jzZzq1h33auxPXxrsSbg?=
 =?us-ascii?Q?Uwn8gCOnFHF+Yj8rGKPp8pUaQaejdLKNK+A7u9g4sh7gstG4bOEntcr0IJWE?=
 =?us-ascii?Q?bSFitP4g7c2z4YEoVxii8zqoLNeZJ/466dQX7G3qWgZn7pTFcY7JdMuK0mh+?=
 =?us-ascii?Q?IOjGkkAf/J28fPns1a911/JdrjRZY5pqtU/VETCgqzzNxccJGMnFIy9fF5Kq?=
 =?us-ascii?Q?mURMhKidzDm10J2nmXyuV4yM0/iA9fdn2h+GOOe6j7ap4z+F4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DCO7KogpydeIHlGIXmgH6HyCWWIgW0l8jmYOsGpayWoTGBXOAO3bf0vPZZle?=
 =?us-ascii?Q?d116NjVPgWLn8rKFdOtheY8J8Tv0BbfFgAR0nKT8jwO244wRBVEzSoTTxuWL?=
 =?us-ascii?Q?syxp0VT1dZufGSiD4FzjgWGaKbM9SucXbaEXP8iMj1ke+Qwij/vQ9CYpE/zd?=
 =?us-ascii?Q?+Z0bwTlansWico6/KZ1qycsNXmAOL8q1R4KGgq0VyPxeGeU10JVJJvi9D2c5?=
 =?us-ascii?Q?RS4c6rmYTxYsyAWVQacNMReAI4w+GnHNIE1+cLhXtJ+yudDscaLSCOtzBAf4?=
 =?us-ascii?Q?NxHaxdwLY3WsfdCGZfO/8S1Brt5Muva2m4R/oLB1CwF24fYJbpVa9N/B4nGj?=
 =?us-ascii?Q?/z2+dF5Dfu2rZXuRGA3cLmN8dPfxcnZCa2WVqG6iwF+L3dstHu5Eu8QwQEvA?=
 =?us-ascii?Q?qqgrTPnKvo25MAGOxROieexvsBCI5piqDVjcJoW8GdQeKCvKT4b0zxRn4WHZ?=
 =?us-ascii?Q?4D/12GQLlEd8CONTh3+yytCfDeMcZpFTAOTrslwE3sFb5BMGLrjMc/th0yxB?=
 =?us-ascii?Q?EF2OWUmPITM1HFQpwm24ecrQhiR8AQw3HiSeM4GKsvUH7YOSDq96htS7oK7V?=
 =?us-ascii?Q?YMQXtNEhzECtkhBizH1d+P1OD3/ET/iHJlm8qSfITDQMIb60KA3JJkwCl2IE?=
 =?us-ascii?Q?pIlpXlGjumQYqQ2G0bGfQaPpUgYFv/ml4qfNZ/AVr6OmG/HyY1mLlliEKkGw?=
 =?us-ascii?Q?haYPyOv73agAZkmVfC33ZNAnE6qiRQmhLW4A9q9B/nN/6u7sTK2Ise0ts3+X?=
 =?us-ascii?Q?CysBt81Q1/T1kgdi8CQzrOUXGFoCiufl4Lt8YjQyx7z98x3kH/RQ66IVBZ+e?=
 =?us-ascii?Q?aYUmaLXWIm/Hs7pJ3eeu6WbKRBEk1cTfsy1wIdq3tIvLRwj8sRKsAYtPqNsS?=
 =?us-ascii?Q?tHYYxflI8CJ0COCd7tf9C4F8g3NCmPh6ohSu9nugb/zm+LB6hY7jNu94MHA7?=
 =?us-ascii?Q?a65m6JPk9o1QfOgND2YjZ7XvMg5Y2zLUnse4Yay5485cDfIYjl4Vth8rD5r9?=
 =?us-ascii?Q?TDpAKJ+TkAblqSmK7h1h0vD8zU1ivg9LEknLu8KkPNW/B4m0hwKK0nWFufC2?=
 =?us-ascii?Q?fcWqrm6YmkaVuxXotrnEjUbMZEPJNdzffRvOWbrQc4IsjIfqzgpgpt+4VvDk?=
 =?us-ascii?Q?trDFh+xx/vIruqmQQLgdGhCrHAnvlETnchWPQqg5t4s3aTdb9rZk58Ig3aCB?=
 =?us-ascii?Q?nNNdoQS7gRIAlM8NV6kiYUtrsft2c7YwQprHe9OKQvSX9SLANS4mYK/Zxoyu?=
 =?us-ascii?Q?8xSUkQvMYNx8AFBO+i0kHYYIge968Sm0UzAOvT8k1t09IHEdfntpXsG8d8rB?=
 =?us-ascii?Q?FlEagG4DX+SUba5ekqNyOf/IgJACmmPtwctZcto5Bc0oa7sxBbvllojXeRJq?=
 =?us-ascii?Q?t8olpJ5KcYRJCSsfkhu5u6pHEa3kh1jlqlk8TuECOoaxRGWNJADWPWRAYrwu?=
 =?us-ascii?Q?CBsBSMO43Zv5L20ochptmqNxfaJAye6zoir8Bqt8nmxEpjRpHphIkFo08GeP?=
 =?us-ascii?Q?KTb2vOdbGfoVojHFF9HoZd3L7+7SVilU/tCr/o371GI7v5wDx9Q/K7ql1uDR?=
 =?us-ascii?Q?EZkPpSRijB/WqnAexrMVjEYSSJqw+hwHm8KogILBsoAw1xy7/RFlpwYIpvKx?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LRgLjC79b+YZ0kuo4Blo/MvbEoJuWk08U+RKu8rMjO1vCfggj8/0Xb+Y6fM3OFemkx2/z8rOXC2W7ws6lWWIJKPNrC+YF08FXm02kDhctB2Wk8eiWlA4PkkK7GVfc8uT2s9fXMch7lyRkuKDfngSM9iBdqVJ7dqoTvVZzTSn7Ni9sMBVkvCr1KZwy5+Eqe0WIqlNRYu8V1IHQYYhKXytOMCbeZvgRRx7NGsgIzqMs/bgp7EHe2yBeciOZvO271U4XJaIF/B9L2/8L2AT/qJTLDj30M+VEFXBoTDO8PaUwKu2eXHuG9TMHf3Cf4GUI5EiQRqz+moDXSU2pN1huZZaHySsIeME/8eE7qlYQZTo5Z4gp4+vbpa6f0eZAaGF8YpxuZd+dPTxf6Nn8KnIwIMm4uIb9vFC17rH+Ka3XVBBYr390+c0BuWeT1EkkHZ/xmSOkmp0WJYYwzbbBmx/DN4c/Lbv8E3siDyWzwQavLscElfJzme+uDc0R0EBFN0lpi4CcMxRmXhpRzHpeUBhnP0A4d3BZujFELnKpHJPVMtNaxzs1EfJOs8dSv+3FurD05q1HsSAbB/Sykl7SJOr53fozQVlfs12YG6ivZSAJaSx/Nc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11092588-ffc0-46b8-ca91-08dda759547e
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:06.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBSnMuLhIxiJdbW+nGEI+scvjyB13Isu3cmO0G0LQUOqZApI+Dbc7qWQZ5V6OocsYfwFMcnQdPse+yKL2buPyU8GaueGjCJGBqKCT40L/gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=6846e12d b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=I4nLmWgRydlkl3k3lWsA:9 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: R8EMIlQBiQk5e2OpWA4sJuKyMLE5qq6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfX89kooQE4wwuD ptAENnzYBgvLz0ct8ncBN7HKru5LhnLK2yeaZttuPj/zuk+duFqnf3/uZVnuH1t7c/67d2Hbc0d dmNWSJxHwOTmgPSS+4Beg9iiUBIce24sXCTpNCnvYi3HzN/5v6der2oR+3+kkEoG6D+cqZqHT8i
 0b4TkScl19/4dCThRKdvxYA+VqtVDyg6YQJyWrSvqVFK43v1MpPBBPMoLAJhxE8ALcxw9QMjUqo 1i7G+JXSc/j2ZUERIPSc2vsFDKK4iMUy8Z0Hg6TQjBDhQR/RjafW0gP+nCMUjHl02GEeyaWNqsS CKdjIufXk5Z+58K3oqjQlg95g9cFep/a6AeaRnnw60IKQiTHM4aTrFqNhsLT/SHmWcstF9ZPJ4r
 Uc6Fj2aXCk16Jrum3QMsGZep3vT1pbO+gwoz9h1KsMsyXsXTlcKC2FJH3XAGt/sTX5wFRFUp
X-Proofpoint-GUID: R8EMIlQBiQk5e2OpWA4sJuKyMLE5qq6-

Import newly introduced MREMAP_RELOCATE_ANON_* defines.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/include/uapi/linux/mman.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/include/uapi/linux/mman.h b/tools/include/uapi/linux/mman.h
index e89d00528f2f..a61dbe1e8b2b 100644
--- a/tools/include/uapi/linux/mman.h
+++ b/tools/include/uapi/linux/mman.h
@@ -6,9 +6,11 @@
 #include <asm-generic/hugetlb_encode.h>
 #include <linux/types.h>
 
-#define MREMAP_MAYMOVE		1
-#define MREMAP_FIXED		2
-#define MREMAP_DONTUNMAP	4
+#define MREMAP_MAYMOVE			1
+#define MREMAP_FIXED			2
+#define MREMAP_DONTUNMAP		4
+#define MREMAP_RELOCATE_ANON		8
+#define MREMAP_MUST_RELOCATE_ANON	16
 
 #define OVERCOMMIT_GUESS		0
 #define OVERCOMMIT_ALWAYS		1
-- 
2.49.0


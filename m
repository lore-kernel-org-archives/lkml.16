Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D1171A1;
	Wed,  4 Jun 2025 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749060288; cv=fail; b=COYuwIn5FLByBlaQmssXxX/fjLYd/BLDJ7IYUJSPvbccHkOywbAYKcleqY+28Tq/Np/BVFojmxawhs0D/sP0N1c/GkzJab8xwUXtVdW3Pr9dCFCULvmAo/urxvuWlIyuCxVPtkSO5c+K5MQ/BgP9pAeYqT66M8kCcod432R1B4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749060288; c=relaxed/simple;
	bh=IKdwvrey4QRVge0FctAlmNuDrHgtI5t+D3OvOtRnP9o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LNVEerXhUk5CURoHs9HsXbpDsqf24J5nAmNwMCCHo9t17sFqOGuC6QEY1EXSh/uUbpBUxDuWXV89tx2sxkhA2eojnTh+DsAMP+xsNnodRvNdFs4GwSjvlAr4L8qPwbdYju2m8ShgnQSSPq09uviyak3yFOXgand74AI/NYl7OK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=q/232Kd2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OBRAGmyD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q/232Kd2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OBRAGmyD"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554FdwkA023805;
	Wed, 4 Jun 2025 18:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=FMYxu+bsxDKbkwTq
	v5a4TRNQadjclqbjIgvLc0tlkEk=; b=q/232Kd2y1DjJZKqnsfgzLizBtge8Opp
	MhekJL44LbJtWQ2NiDcgoWrNNlTJii84OqB6vjltFqvxNCjxBfpEaBgbkObHDRHX
	M7SQyZN84CRf3XvFj8xC9U18AIAlH4wio/4VbGhUyC8IRE4O3h3SzGLSxdMxK9AX
	Ezt69D/Io2F6jdUchO1673DsxDNOgE+fnJCvk0KfN+y0WFsZI9T9h8VHMGkn7nQU
	XzmJRCrfgfemdA6O5uK84atZWBF5ZKyWOotU8d83BVK1ZX/AORTKDGwoQYjpaZYQ
	RnFueZG0Ia3kprNRFMCZFX8UZu7b6znizlDmotvPcmLzlqcg8SKQEg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8cvjc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 18:04:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554HvShv034873;
	Wed, 4 Jun 2025 18:04:16 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7bbafv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 18:04:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ce+qz5e6uEVSUGmJgusKi/lnN+raEAi/xN88DlPuevgF0eJeyL7fnE5y2WPaP+hfMn0xPiKF9W64eVaHKixv9XEXkFPgY3c/rKiJJZVAmzxO9lh7KLEh8HWH9b5iQmlptblGnHyo+tFRBd25Ml2sSLwPzQ1ZYQt7tgNLq+lVBQ+eZpqVg3tAKXYw/rIKzdIidL+9HO7LaRm6B6ekuuM9XPoLzk+Wn8nWxjDTkZaMT2F3XosMogC0ckFtFCaT0ioCm0EDYwn81uxDC5f/PloAbqE2DXfAZLLEtEW/ELgEPHuAjBVS6GgGgc00PdPP4askgpHwVS4423ZtI60MMXF9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMYxu+bsxDKbkwTqv5a4TRNQadjclqbjIgvLc0tlkEk=;
 b=VR//tWwgkMvlyTGrxMxgVTET470Tg0y2O/fjJHU/DylONAnxva72LKrHk61LtvToMavlLpPCKJ02xxjW41ULvf/OeiILnO/H2xhGXOA1YDBChp9v+xRA07r1RzoeAUItJToC7B8iC+q+rMhzqwWZjn/QReTXeuV9n204zkziKn5Aa7Ap9rf74OXDmxKxeR1NoEgGA/Pid3xzLthmBepYFBQBl+cj622SMXW+Dktg3ljUItx8nPsttUO21gXt0Zxn1EinpF2CvcyPaukb3lajXvL5I/nQdOAbaljpuS3VTQ/vFw6UXgvJJYI6p2bTm32ljTwXOfzcL6UrBSKZJOgh9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMYxu+bsxDKbkwTqv5a4TRNQadjclqbjIgvLc0tlkEk=;
 b=OBRAGmyDRCVT7wSs8q/Z9DqIkEfDhwayfHSmjlxIUSZBj+1V2JyfEWHbGIiWzyLK+FZvL+owOJJbLbbpIryK6o9Jsv/elaTYCa9ibYRrpzfPtIWt1UDI4MUsYH/aIJr7dK3VMPVF5hcrfdj4QxVi8+J5YTevVbbhYQ8CmFN3izk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF2740EE012.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::795) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 4 Jun
 2025 18:03:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 18:03:14 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>, Jann Horn <jannh@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs/mm: expand vma doc to highlight pte freeing, non-vma traversal
Date: Wed,  4 Jun 2025 19:03:08 +0100
Message-ID: <20250604180308.137116-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF2740EE012:EE_
X-MS-Office365-Filtering-Correlation-Id: a597da94-f62a-46db-cd73-08dda3921359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DZs0opCFhc6idFDLrwjAWTVIWylwYQyW/KhR3TTCPSaHKh43d7aIp+8fNuYe?=
 =?us-ascii?Q?lnIzXtbmVZ+kLzZDK3KFn8hg9yhjr7PM9XRDH1PmVgqMR8R7hp9p7jBCS2Y1?=
 =?us-ascii?Q?kkkNRfNRFm3shXdnmJnJWcRGkMwmUJwWj9KjHdmUF1cBISZlOQPqb09RGcdF?=
 =?us-ascii?Q?Os9r5+OxRYfwJkIsPkNci6NrNtkLYvk7fkf9fY9lYD+PfwpnFPLY/M0U+j5s?=
 =?us-ascii?Q?5mHgqOr5/nPhxl7ISChvSIKMvN+jTWYni5HQyrABFLZeY9lFoBXB81QmM9LE?=
 =?us-ascii?Q?fQD/a+tUGOzO8D0nvmlvHpAF8wdaxiavBqGgkdY1UdcZu+bteovsq6SV2mX9?=
 =?us-ascii?Q?tkPwXmAvzBAl9gKBnldxhqaw1CnoB0AEhwVahQl4IHZ6bwTG7qy6JQuxjIu3?=
 =?us-ascii?Q?NoZ4s4QEgEEUbiOUrL2lz8D4EtnLFDSFPARKo0tORmIQvazZ1BuE4SoaFjAZ?=
 =?us-ascii?Q?FzoXm0kPtzWuIsYNYrxKv5GGNsbniJ/9v30wuydHB8fWsdGMO+U2AOf7W58N?=
 =?us-ascii?Q?HfmzpZPc344XPWK1pEvxjoXTTnWU0ruELnGZGnBG3IV2E+QnBDdgRr0frKJq?=
 =?us-ascii?Q?EBo9dsOt93gmJKhtGlfeT69o5MksKh/mk/qE7XQlsxJJAwbPDCNDuNZ8+3TH?=
 =?us-ascii?Q?ktsAo53j0XNLIDtSRS9eysQwnjLUmPRfbm56plvqMk082KA6UgZCoFh9X40x?=
 =?us-ascii?Q?VG7rag5Obr1oeXPBkx+0C9Ff21UneQQnGaKx07m8kmf7qLm9MBHDy01b48jy?=
 =?us-ascii?Q?3BaIWRsTaR1m0plyTV67S1MhXykGjkJk7l54iEAtPxjpMFU01/zWEDKP/9RE?=
 =?us-ascii?Q?HoPkqr4VKOSuxZbCIQfT6/iEke///56ydm4ysDTGza1d0TmGDuGrXOWRZjDe?=
 =?us-ascii?Q?hX2QVW9F+uHMKomhMmgEsFGxmEtm+WyQ3t3vBttaRptKSZ7Jkare2CmzuJoS?=
 =?us-ascii?Q?cJakc7zNZFsi0OZzVjfIUQe5dckYyb5sqjtLZVSMda2+B0lzHAe1/GQQ8jEE?=
 =?us-ascii?Q?GRHYTwSa8OoVwJg/xxIx5B7dpI2bRG+6VMm2OkCwepnPeDxFQZpgueyoZnLZ?=
 =?us-ascii?Q?ebdu+0lGV4kCtadpj7sLrZn+vMI35rpeKbreYtYia/4ZdPdcGAKJ4xM8Uite?=
 =?us-ascii?Q?eSwJbz5m6GSTPTdzMG4Q+UW0+v3s2fm17wqCXBDtEivhY28ZFKwcso8d4Wvf?=
 =?us-ascii?Q?MHdqRIcpwa2iNF8kmMVLlWlyinPL1to6K61RyCpcs9hfBTKe3p4akalQY6nS?=
 =?us-ascii?Q?EwdfZ79Zt+d+SPV4ArHQFEwBti1YZ8eRmUB/IWWLXF7bePxKLU9r8T/MLrdd?=
 =?us-ascii?Q?mwoujgbFSX9dG4nbwNRIzyEBbzvWHBYpgtbjvjCEiHie30Zg7hlFOPUZ7v+b?=
 =?us-ascii?Q?Pbst+uVR+ATf/VVF4i1LVDcujXA4DNKRdTHHC3RQv9ZS83V8aCGdPRavq2Wf?=
 =?us-ascii?Q?BfPLW/seoNk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wUAdoDEoBmXcA8dDg2ixYZiyl4S6DXrphDnw/bwAnNd01cCe4ocnwM6+OWgY?=
 =?us-ascii?Q?2F35nK4P/Lof8kyBkscjBVa926ggfgXnug+EOFafAt5jXDWx+FjNa2HuJJUu?=
 =?us-ascii?Q?Z1jO2fgvBzWrBWLVKanxYpRm/zOoYtmTyTY8rTwNzF0aTFifIrKCp9E+BXHH?=
 =?us-ascii?Q?c33+xiC0MVQMGEwIb8hB/W5vsw6REaL6DkGv2o1K10eOfYCzBS4z4oxjOLF2?=
 =?us-ascii?Q?QFeFPBxu8Z+T5oEFjPtzI/GboFg76Sb8d9z/s2EBbnCmH6jLiUUIYMEkp1Ib?=
 =?us-ascii?Q?PsRKH9VEPvk22P3MRBQmURdvhRjo472NICMJbD4PBDTFm305o7kk6U3A4/7u?=
 =?us-ascii?Q?RSW1Mji5YDiQh7vJPrvUd/+A9/TyBpgQDX+zR+5J1DM54bIMvuPCGpuJv6+f?=
 =?us-ascii?Q?+U20gCxWyOi02EN6q+xnxUw2T3tNOYhdNU/bkLLihmJrKNOP700jIjxuYef7?=
 =?us-ascii?Q?NHdajJaZI599VQc4bjhE3pNoR/dv9IZwJYQ0C4n6e9oZ8UthMdiVbTORpAny?=
 =?us-ascii?Q?qH1wTfnseUSRFP/MsZnW5gvpMtypbuz8fV9Y8w9tbnl5ZOrCmuZbaw8wDIJq?=
 =?us-ascii?Q?fovwIYVQG6nSH8M6ejdk0hEnJ8l9NU701Pl4eA13Ymc9xVaR2vGytiTTHSEz?=
 =?us-ascii?Q?MRQPyWZnt/Y/4NkpaZoVf7v21GwSP8SNuJl9QvrLblKZ6e7AiKrIx5U6czSK?=
 =?us-ascii?Q?GjoF59g6hHu30NH/Ba6pHp5eXl0Gz5OOAGUZeUHx3BYDjO18vnxuJg1WMxvI?=
 =?us-ascii?Q?xcRPMHmq57I4pv4wIEAOmnI/8zBnZNMP16hJ5kSy6Fc09V/Apst30OM4OLtr?=
 =?us-ascii?Q?PsaU5cuuzwERirz4kxhRi0iUHu63TwWN6h5mGZLCpQ/X3vW0Yuv5KmYL7yyq?=
 =?us-ascii?Q?UA+FJwAuVp/NLB0nTFqp0bg9J59KSxQwbwlJ1OUa5KDQdniY7kl6EV4ofc3Z?=
 =?us-ascii?Q?KE0LHSAlaN6tSULvzgGylWz0hze+mqrlE7YJG+gt4H5gYDIyCYb11Faa8FHU?=
 =?us-ascii?Q?hsJWsc9KX1vVvtjpkT50iD0yUsRCXiB9ZaFFxEFAM954VoEj5GTTbWw5sSJA?=
 =?us-ascii?Q?otINXfJOD6KIm+F5UyuE5UUUHLVuYMHi3eItkWPNunX897ClQw+zTJ+lHQUE?=
 =?us-ascii?Q?UhK9yU0p/90VqgcwxCSqkJVT9oyXZFpaJq7FQvA9i9RZSk9byuTcDzETPhwY?=
 =?us-ascii?Q?+2Gv2Cg4ne247EC2FQS3i4QRAPbtVH21ajXV6CDugFA2wSZ7PlFwSDQBywry?=
 =?us-ascii?Q?HF4bc6TINmQrXtadNrXL7darInM1zfpTWttJpKjdfpAqQUuTRTIgyz54fcWm?=
 =?us-ascii?Q?ogAoO6ESHJI9TT0CAQH0Ie5atSPDiDKJnqmp46qysYhQCwrk60Zhy1fbTv4B?=
 =?us-ascii?Q?HPmf5giSQa3bdIfc/G1BdEfvEpvSVG981JKnNggMUkVj+7uEOtUYEwRgSUOy?=
 =?us-ascii?Q?INtLOI0ku07NkBK3hAun63At4BC8F/TXJAKLSJP5oy+fb8zustH36mUBGuIR?=
 =?us-ascii?Q?2m2/2uhcP1uXvRah4saOzDhU1DQ0Mk5HbNu1A6F3I3fImgNPFHU9hnLSyPAi?=
 =?us-ascii?Q?tjWSdBUpb2ev9OEQQKwapRCoJDKqzjZ5CKBTLcw1kwkWQYuh+zCKX4GYJ7jc?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ml5v61vjJ2v9EH76jeaYuikr4Lhul5gNJ5o58K7DV7WRzhZ7HWcSTYWtXu0ymld3Xglj6UY+aVnIiy3m2BoS8KMqSl9IrrB0+vJ2c0npELOKWxzaZfEOSfv9YQeEP3rjuBAuGbtWuF7Q6AlVwqSXS2F4s1cMuobfjyCmbAxEuMuV4+O5jwXJPqruDbKGS+q8R2al3Ne/G5/x12pDXy3RNyhOgnXSrIVe/B9AScXRWp7RGqBSwifckqOa1tMEMA5mW8PWK4yl4a6t348fZAqjpTNo7Vd6AOELPvOSnrshElYR2g5LSKkRlYruDpVgcZcfhR1oDJjN1VtKLZM8ZvHhpSE4oqlY1RxSlre+LusBR0bvpg8UsFrCPFW5ugBBlg1uZrZpzmUG9x4QEHedq4//9akI1iPOwhHDoFPoEJHHiuD/9N3o1EX34fgG1g4S4D5zdjBFzNz5N3IaIt1BeHhMr64QvA7EriWVqmxPdGg5k+ZCMgQVK5qgkyo8/I2D+ey57/Dgc8S4a0HfssCEql6I4QxPz+P2KiGzqM4TrL4JA7XjpWbjyZEYvO5+6l3SH/eU3nwv9EiB9LkAafjvuV4zIe0W5DpIv9NdHK+XN6v0HYE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a597da94-f62a-46db-cd73-08dda3921359
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 18:03:14.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +umVD7TUFL7gIBUuAEZMOgfSrmOSLERsNLDMGzvr+uyRa/QqupDMxmAqzYFmOyW9lqz6BvobU4PA+En4Lx0DcfbVtlZjrzfqOq+7tD6Uf4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2740EE012
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506040141
X-Proofpoint-GUID: 8tICHBd9sQzMUbiXmTPU3IdocQwLMA2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE0MSBTYWx0ZWRfX4vLN/JNpIvT1 3JEpF8GFyOKGJZNBCpVsFBROR9zKKc/VVH1LRdETMOg6eDWL4M7AcDYlt8dYRUsHInvvz6aSZB4 uEiwZ4JIDakwrw5p8gV4CNE1iuw3TxTeMlpvviCbiUmFgM1f9AxoYAw1LFM42PM8JlSnYc/1VrY
 NN1//By1/ncOvlM9qeZSntHGcZIfBMnOhP3woWWcPfFgOv6A8pv4eJldLUilkwCBg21mzvYcfDv r2BgJaUZtBLy5TqZ1/90yi8A8UJMjWIMol7/E7M9a5AudVnyTyVyZPn+iTJH1xnlJw1P6DZt3l2 7gF9X4TCNPZ+6yFgSAAJmBtEyrLx24+XPSsuf+/gzeV7me8N/ihRWyVZoQsAYrHVqeGJwI8bz9J
 dSgKyiZ9DmBLjQevlfciQyA1scxEMDaG9P2i1UnSfERaGH6IFu7f/kc1gAoYtQ/WffPSdkEv
X-Authority-Analysis: v=2.4 cv=KaTSsRYD c=1 sm=1 tr=0 ts=68408aa0 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=brj9Pt4pMQsRI3ToJi4A:9
X-Proofpoint-ORIG-GUID: 8tICHBd9sQzMUbiXmTPU3IdocQwLMA2f

The process addresses documentation already contains a great deal of
information about mmap/VMA locking and page table traversal and
manipulation.

However it waves it hands about non-VMA traversal. Add a section for this
and explain the caveats around this kind of traversal.

Additionally, commit 6375e95f381e ("mm: pgtable: reclaim empty PTE page in
madvise(MADV_DONTNEED)") caused zapping to also free empty PTE page
tables. Highlight this.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
v2:
* Replaced references to walk_page_range_novma() with
  walk_kernel_page_table_range() and walk_page_range_debug() as necessary.
* Dropped references to v6.14 and the commit that introduces PTE reclaim on
  zap as per Jon.
* Added additional reference about freeing PTE page tables tables when
  zapping under RCU.
* Clarified kernel page table locking as per Jann.
* Dropped the warning about zapping and PTE page table removal - it was too
  vague anyway, but it seems that VMA lock acquisition in this scenario is
  not required.
* I will address the issues Jon raised re: markup in follow up series.

v1:
https://lore.kernel.org/all/20250602210710.106159-1-lorenzo.stoakes@oracle.com/

 Documentation/mm/process_addrs.rst | 54 ++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index e6756e78b476..be49e2a269e4 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -303,7 +303,9 @@ There are four key operations typically performed on page tables:
 1. **Traversing** page tables - Simply reading page tables in order to traverse
    them. This only requires that the VMA is kept stable, so a lock which
    establishes this suffices for traversal (there are also lockless variants
-   which eliminate even this requirement, such as :c:func:`!gup_fast`).
+   which eliminate even this requirement, such as :c:func:`!gup_fast`). There is
+   also a special case of page table traversal for non-VMA regions which we
+   consider separately below.
 2. **Installing** page table mappings - Whether creating a new mapping or
    modifying an existing one in such a way as to change its identity. This
    requires that the VMA is kept stable via an mmap or VMA lock (explicitly not
@@ -335,15 +337,13 @@ ahead and perform these operations on page tables (though internally, kernel
 operations that perform writes also acquire internal page table locks to
 serialise - see the page table implementation detail section for more details).

+.. note:: We free empty PTE tables on zap under the RCU lock - this does not
+          change the aforementioned locking requirements around zapping.
+
 When **installing** page table entries, the mmap or VMA lock must be held to
 keep the VMA stable. We explore why this is in the page table locking details
 section below.

-.. warning:: Page tables are normally only traversed in regions covered by VMAs.
-             If you want to traverse page tables in areas that might not be
-             covered by VMAs, heavier locking is required.
-             See :c:func:`!walk_page_range_novma` for details.
-
 **Freeing** page tables is an entirely internal memory management operation and
 has special requirements (see the page freeing section below for more details).

@@ -355,6 +355,44 @@ has special requirements (see the page freeing section below for more details).
              from the reverse mappings, but no other VMAs can be permitted to be
              accessible and span the specified range.

+Traversing non-VMA page tables
+------------------------------
+
+We've focused above on traversal of page tables belonging to VMAs. It is also
+possible to traverse page tables which are not represented by VMAs.
+
+Kernel page table mappings themselves are generally managed but whatever part of
+the kernel established them and the aforementioned locking rules do not apply -
+for instance vmalloc has its own set of locks which are utilised for
+establishing and tearing down page its page tables.
+
+However, for convenience we provide the :c:func:`!walk_kernel_page_table_range`
+function which is synchronised via the mmap lock on the :c:macro:`!init_mm`
+kernel instantiation of the :c:struct:`!struct mm_struct` metadata object.
+
+If an operation requires exclusive access, a write lock is used, but if not, a
+read lock suffices - we assert only that at least a read lock has been acquired.
+
+Since, aside from vmalloc and memory hot plug, kernel page tables are not torn
+down all that often - this usually suffices, however any caller of this
+functionality must ensure that any additionally required locks are acquired in
+advance.
+
+We also permit a truly unusual case is the traversal of non-VMA ranges in
+**userland** ranges, as provided for by :c:func:`!walk_page_range_debug`.
+
+This has only one user - the general page table dumping logic (implemented in
+:c:macro:`!mm/ptdump.c`) - which seeks to expose all mappings for debug purposes
+even if they are highly unusual (possibly architecture-specific) and are not
+backed by a VMA.
+
+We must take great care in this case, as the :c:func:`!munmap` implementation
+detaches VMAs under an mmap write lock before tearing down page tables under a
+downgraded mmap read lock.
+
+This means such an operation could race with this, and thus an mmap **write**
+lock is required.
+
 Lock ordering
 -------------

@@ -461,6 +499,10 @@ Locking Implementation Details
 Page table locking details
 --------------------------

+.. note:: This section explores page table locking requirements for page tables
+          encompassed by a VMA. See the above section on non-VMA page table
+          traversal for details on how we handle that case.
+
 In addition to the locks described in the terminology section above, we have
 additional locks dedicated to page tables:

--
2.49.0

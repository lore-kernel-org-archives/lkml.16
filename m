Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B749274B59
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778844; cv=fail; b=rrqq/99h5pJ2GNGG9n7LdjzGupvg9LL5cS/FkzOeihpfc1XnqLSgtn9izU83/pSvH9h7Y0r+m/tAGIIKs38a3XjHobKFtuISm27nBa4ht9Do8arCCWu00yQYU7xf15QK5QFnMXGn55EM226CL5kOHs16isODWL90MVFbCKdRZfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778844; c=relaxed/simple;
	bh=Qn0QfFzbllO1LLH1M6sSLKgy/0dJZthHseOVUNyX5ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KYDgPJxlwABa1OzL62AeGBzA8FQ2vB5tlDUxSGQNz4sqzU8g7+sebsDTFo+UnaL6cfqE028CLyRwkR+YzOI5rE5v+kPH/EgNJUIwfFb0OyBUnhPYcoSb92PHwGN7y8JDPgYX9ER/sNcIyhxpfFyHdn/VvwTGOl1cK9/KgXhXbsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PLISmczM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oP73bR7N; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PLISmczM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oP73bR7N"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFN2QI029304;
	Tue, 24 Jun 2025 15:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=E9B6z/5lunXJACiTG/
	pvR3IxCaPiER9+wZZBDiRaBYg=; b=PLISmczM5CWsL8+hxYjcebBpw4oP/Ityf3
	79z0xXRPzP6nP5rj8ibWpLWhKZT+AlQK2jzFCk2Ys3fniyF1fP55XDrA48EQ1blO
	4DJR/VIGxfsRgSr75laX47ccUT7HTy1BfdG2wU+b1Zv2zDuReO2d6ezEm3N6s6vb
	7JVtDvST7snfaQZQR+s6Nm5DMFWcv2Df8guyVVMH6yGPhvljMbyBRYFIsX/iScvI
	ljhE2HDstQ8ZMSqhDEYBERASXPBTTNB0JYk8wD/uzSJ1XXH6N64jNRbCEsjvoN3r
	CaytT/LaAfs0ZdOvpnt3enRVlDXyySa/IyF5M1BSdWrslRoqUriA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds87wegh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:27:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEdWcF008213;
	Tue, 24 Jun 2025 15:27:06 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq3st08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:27:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cABsi11qKAWZocsyWl7NoHyrH5ODYMpy/3BxZzjdUh+K1/LUUmVZ1Oht9LzFdKhdN6BLrh+jP64aprdzFK94hOcL9YFspPgdatkuSBtTI3o5jXWNuZAsJEdVXtb3sVB6nPek8Ku/H9Wk+iOJyeR6eG24Ub4A0nYIESGquxvsyGBefRzAiFekDutDaVUmMzRIGZ1bBufyenUQxmcAUtjkZRhzwUVlZfUGM/8pm6o7SLSMc4YXiRyl12RG/W3E7y4efeFC0sQM0kKwVYS5aD2VSlopGp3IFn2zGMo+8vtxhkoAw34C3IQzXiCeEHeWZcqJzF0hEsrwel96rxsijdzXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9B6z/5lunXJACiTG/pvR3IxCaPiER9+wZZBDiRaBYg=;
 b=Sjl1i2wnSRNI8Juumk0dNt6bhHr+V94t3YK7vYzktj72735189oxoB7ODWElX3bvnv/LbN/5m89C/ZiD/JfBUfiExBGNTfnQWrES5LUhdqFWeDRshjNeQPu/xJ6vSwRMWPdDbLNLP1bmKe/8e013+h7xt2xs2+M/3xj9Qoupv3Z03nlCEyqv53sWd/cvWyslY7iksPCgD+yl7Qxp9IGEWOpmkTbJRpSaplLVJLJwQKZmFfi8vwP+GE3W9YwiA8mEE9oPyik3YzQbBd6++7C6XGUq8Ay9Pybg/2Fkjc5QUWw8jir2w4wklCCOxS3p4ySi0aM/QsV+9p0SUzDE5pstJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9B6z/5lunXJACiTG/pvR3IxCaPiER9+wZZBDiRaBYg=;
 b=oP73bR7NAUAHEBRJ3RFh+MfMHy5LiHyAvWk4nahPHeOeQF7ELAKyUTkZWvZwSfGuqRTUikbEFEDgAxZ7VEjervgfMca3OJ0VXMUSNBVEBtSDcMkSsyJttp6G+R6wlE3kCJr2hiwfrSuoMMxmtscRFnEBkrPw0pYA0WB8WlSYsAI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BY5PR10MB4113.namprd10.prod.outlook.com (2603:10b6:a03:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 15:27:02 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 15:27:02 +0000
Date: Tue, 24 Jun 2025 16:26:59 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm, madvise: simplify anon_name handling
Message-ID: <60186e91-bf02-4d39-b745-ffb4e62632cb@lucifer.local>
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-1-600075462a11@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-anon_name_cleanup-v2-1-600075462a11@suse.cz>
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BY5PR10MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2f9830-0f69-414a-e3eb-08ddb333914d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hODYLxjDsMa8NI4vIJ3sMDYUWY6HN5qHPGIHZn/sAHr+V8/qC5EXkme9gmlj?=
 =?us-ascii?Q?irza5QJVs5yrlgQctnnu8tmQD7nboBP+veTwaOA7pjgaInzd69CiCDkDQ74L?=
 =?us-ascii?Q?Vo8CNHLp2QQQf/3e9x8tHRCTEHS9QcPT41M65I0oWeHtMvXTJPWUV0IsWs4K?=
 =?us-ascii?Q?tuZtgiV+COXEaVfIUZOcTmB7v4ngo/LhZkKDSjTk7xQ3aV0Pkz3AIGFCfIwl?=
 =?us-ascii?Q?oioUHGYqbHrw7jxFhix4BfO6VG24iII4Udmb5Mylt0Y7P85VhBjNOfvuMmvB?=
 =?us-ascii?Q?aj7wpzWyuQD6jxZypI3amG/NUSSG/4FVAlP6lIOSyHnfW8LTO3NzIZ/pixrS?=
 =?us-ascii?Q?Fkrchz5CXNCSMftZ3iq/h80tQ1EKC/kIL3zgEuJQ5Rw/W/hbE3YA7z61wlg7?=
 =?us-ascii?Q?A9CD3LNGYb8GPA4Z1AuUHqr2nXb3oXKF6YViyJM+hoKjNMI4TEZOlrOBkTA8?=
 =?us-ascii?Q?ilC9w4GUGtS0KeRIZj1Yj9rTEsqzQbhLK53GQXLHCBs2eVXSJ25t0qPQ6L6J?=
 =?us-ascii?Q?DpL5MdIKP/9rJ20Z99ikl6+5IFFHEH1kfo/QZkglsgf7ZrOLHY4EdeMKSWpy?=
 =?us-ascii?Q?V7j8j660VP8ofysLHdKiwWY0nEHIqht6C9QZUvUutvFc8+MfHa+jk3B7LdJ3?=
 =?us-ascii?Q?bUdsJB5/HV3PmvEiwJLNGVOEuTDUZNVT/kHBNjt9a0mF23aJ4VepVa/A27e1?=
 =?us-ascii?Q?JkaIFmLOKeygHzvhEKZvPLPYDobD8OCldvTh46E/W8wni8hPur+WtmWck/Mh?=
 =?us-ascii?Q?wShfTasBOXbh9ZiqFgaxoPLsl0Ua6a24pnL8OrIyy+NEu16aDJ1kPcQ0WuW6?=
 =?us-ascii?Q?3FhYg1l7cICTcw232nIg37w2EQjtr15QTlYl14xE9rHTYaCXmEl/FnxM8ai3?=
 =?us-ascii?Q?810bOJzhS1qbb6UR7uY0z9fo3EZUaurWHBpgVzck7iIXcRQKOioq4hrJtsTb?=
 =?us-ascii?Q?DIXOhpXYJV1jrK7M7ebzhabxvkBM87jZb6wSpY7dScEzTpidifEOj1tHUfu0?=
 =?us-ascii?Q?P4f2+SOd2uKFuMVPGq6f9fEpeP9TfuY91wUkO4Rc1bsIzP7CCS4RfxEVEk/5?=
 =?us-ascii?Q?HH7k6PpxV5GdqEaosToytXamqZc95527JWbw+Gx4aINaZlPT+WYLujVt2iqR?=
 =?us-ascii?Q?1IrqTPfgEF6DD3YQsdLc3lgasORBxgVQSl+ahRUmZoyW/c+hXvyP28J25OlW?=
 =?us-ascii?Q?R9bmqG9pjXxkgI45lrRRUTASgEUnpZHpO4qDu67LQkxud4L2ECRWTSogo2nD?=
 =?us-ascii?Q?mw0S3CwdSy4VU8N/ReWC+HBhZSsUNwo+rnosZEaIb0WFOqIbrc0JmQvQRRtV?=
 =?us-ascii?Q?OlhSALtVK6LaXVN6XPRNe7uOjj+dqrHmkS5FTNRgGPe2luIXCicOr4JaxMKC?=
 =?us-ascii?Q?xKI/lsROM0cOkkDQAuXf1EyS+/NJTqsAdH1PeX8h1EHKiKXyC34lAq7v40c8?=
 =?us-ascii?Q?P3DzskqfsyM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VDAPxZrQsfC53l1Qu9SL41x//spudqWicEooiR9l9obkG9UnSiKcdRYbTJsB?=
 =?us-ascii?Q?faXCM4TjtXxvZFeoIK+5AxuJKBqNVAHsfEsHGVVm6UtElExfanngS2P08ZFM?=
 =?us-ascii?Q?MO7bR5wAGM32qz6kz5JQYbnYBvb/4M9SsxXXT73eQ2X/NNhQxFHoxzw9Qwbp?=
 =?us-ascii?Q?/rSakI3y8rPujBn9mt8hs/2NcWgNyngTHPtNAyH6vYit/gi8ySqzEo8ixr+o?=
 =?us-ascii?Q?imTbV7VXWs2Do+AWMT18YN0alx/0mnQVWAvpacy4tClo7Tp4TNRtABOwvJ2c?=
 =?us-ascii?Q?CRv97wddSpKmF067SJaiMD3FEaHec+8oFSH0KLuirLvGFUEOdZ6bnp5bFsj7?=
 =?us-ascii?Q?kPYcplybIPmfyaXPglEJUxH6Ux8R+Y+gaZUDMD+FOxBUMHAXyUAHtNuA6XUG?=
 =?us-ascii?Q?aMlVZo8/Hs25pqbq+GpIbifptc5pC5TCUDJVJX2yTbN4NN6d5687jrcxhc0M?=
 =?us-ascii?Q?LMvYXzUo1NcJzw9z3Da9kLMTyiIGSm+mDSssufM5Oa9VXjyr6zF8OIIO5Yn5?=
 =?us-ascii?Q?l2Rse58vwdfJXATC6QI9RtKEw9JdH1Q8hFU8ilgu9jUsTvLB6fRRZNMqIm+v?=
 =?us-ascii?Q?t5T8QbFRF182GVZhVakjLuvjN7jz8W2+B8EVc0OLuBAZqsvHtgIbHaAjchmi?=
 =?us-ascii?Q?b5NIaqoaNb3I/z3FXgpree6+WsZZ0iGVE1HlPUUdqKNQdYFFy/Y+rtXIy/0f?=
 =?us-ascii?Q?+3rkoY4rt5mMCT1dFtqkAsdVtP/2g+7Pc7CDy+BaqA79YjNFnrqCcybNBj0j?=
 =?us-ascii?Q?2yAT/JMdweFJC4p8bdTvn18J0XnwUkwjIgNjLveOwFLE4STO5SVXqEFJXwXM?=
 =?us-ascii?Q?tYnPS39L+MXgVRMimZFUrNYkkuxkobMIx10n90GkdFm4OgCOPG1CcJhlZMsy?=
 =?us-ascii?Q?orpAb/ZsusXUVTOFxxRjVelEyVdTJhCMks5gPJfrSOUGZVAV/vBK/YppEh8Y?=
 =?us-ascii?Q?1KnJlC0kaBAE5dkC77Q1dhu/xsaE9+xviahSw+vHhCBEUApS1NzoHQIOb8jp?=
 =?us-ascii?Q?gVSb1ji6EeZw79zQGuZswrHbtq5A+gS6NNWbx4bl19utgE+KyNyCXDXt28Ib?=
 =?us-ascii?Q?dT6poXb9Ol0cwNqHI7O4BEOFmOYED1KYl+YgN3GAF5N8IUkjlu/WT1oAWN4Y?=
 =?us-ascii?Q?gNbeXWi+dmvwojlPoQ4gUkBhtSm5xYn+igOUSTu8vXLbcuw2nI7PCqRQMZG+?=
 =?us-ascii?Q?EfB0dzhlF2H1SA08LgM42bbYSXyRpxZp2IgnR9cTG1dzH7MOh1JnmArpCztg?=
 =?us-ascii?Q?4+tOri2TfZv5ODViNN/7nwxi2lCqo6yapRwCptItthGRwwca/1wPBYc8ehZa?=
 =?us-ascii?Q?7iyHiotlcc7A+nh1V6yR+DLXElL2P4zUhiuNrtQu5ktAPNf2t+Zc9juC/ffl?=
 =?us-ascii?Q?9l6JZIvEdDtmox+ftGGDiF00ViSmCJITPx/OIgmMuwroJJ33+RIVvp1sOEh7?=
 =?us-ascii?Q?r2Mh2G9nqfIpDQeNLHmIeT1o+vo98Mx2TMLihrxPgSwJHxH9leqghHt8nyD8?=
 =?us-ascii?Q?n0LwRCdQ94ekl2RSrQLHUJiLJKP7uAwJuPtfMsfyxxOY+kDQ8mqjM5XTBdTY?=
 =?us-ascii?Q?Kbn5Ezppf18qnUVR9Kqc9CH9BaiG0fCHL4GKgcmU7P8/d7PtR3Gelu2/+TG9?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iM7xmLwGTmNe7isaGplxU02pC5pcP5NOHLY2VxFdpKFL6zWQk3WiuvXlWczFLaRqrjM2bLDOR09kokNE3GmOmIs9mBDQSRN7bjQ2Fy/fXldyO5BL4VZYKM+7M47WjHBXvXdMAgHaryiHra7iFFkGG/COmJmTBjJbnSwy3NLrRemEVzcFc8b+2PXajia7PAJjB1VQLjTxoboPeSzFLRHqWGgFih+nVvNLl1GesGuAI6LBr/BJve3K46rCJUSLrcTs4EIDKfBqYL6bKUVoQ/PmY59t4fQ+Qjiyc2UA55v4ff5XbTG6/W0Mv7F1XezDObnMJ3Kg0+1dW7zETapdNbbIsbCsJ96kckhK+L/geU3bsf0n6VGgiND2Xsh2uFw6QGto5QR68M2qN5rZCvuOywI8DS3yZJjM8S335sA5wRtEDxPKrJMBa0zn/omxON7AoqwTJaM5JDpCUv6gtVsXIIequ0Nje5VdSsnVpbVkiTzzZeWC/U1VyD6IokUbMiAUPhHiH+iaZcoWk/WPkK/6z2BOS35BKFEPLwJJokRemUZNqE+E8OOh7pmWzjFfHanhALhy9WHpUmt6qxjfOfHiCZq79CVFKX618e7I4/8zfxEO4Q8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2f9830-0f69-414a-e3eb-08ddb333914d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:27:01.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkE/P2zrPZqWNr/r0hnBK83wbfioU4TpOb9R1mE6VgPHcB8KFnj8TlFOt1OAsiJ61xV2Yfn40ARfBYscw3+FFPtYkX9m2LKHdw1j2Xr8gMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240128
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=685ac3ca cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OF1RcNzQEI2zktfG27YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyOSBTYWx0ZWRfX0OfnZP1TD9AD +MpDZ07o/yheFq5UMgGu71K+omecmYwKTor85dc3QHw4UjAllarzegoBsNBMt97aiCPyddvB3UU Zv1zDhs0mRXmJduKQ/hP28qd/D9Qp1xjZnr7XYjBATwlRnqwYqsdtheO7VbBIU7SFOfp2go+Ob9
 9DD0K+nFCm7B0L1cfC+N7EjZVkl3Jaq+2NxnqQbcKH8bDttimzHT2dADz/mTFp/yF9a7E/2suAp YuB3E1PIYOPXGvcBFPcxwgG750FVLQgPAn2n2glgyVL/tHgilpzt02b3WKFF+KE8+d4+2R6EyvP 1W/wsh8kYmPK7hvhcF155M6/IKGMjI4DMJK6ePKqZjz6x6BJG4qi2zRhPhXlHfL3jn+dmpZ7BxX
 PAdqrxXuYsHa6c5Ub5ACZ6xoGQC9FbaNpSQqaSrXpBlvChPDjjt4EKbDLUliXFzmSnzEqy2U
X-Proofpoint-GUID: gp85w-ELfOo2OA2suSdS4yutEs7Fpd2I
X-Proofpoint-ORIG-GUID: gp85w-ELfOo2OA2suSdS4yutEs7Fpd2I

On Tue, Jun 24, 2025 at 03:03:45PM +0200, Vlastimil Babka wrote:
> Since the introduction in 9a10064f5625 ("mm: add a field to store names
> for private anonymous memory") the code to set anon_name on a vma has
> been using madvise_update_vma() to call replace_anon_vma_name(). Since
> the former is called also by a number of other madvise behaviours that
> do not set a new anon_name, they have been passing the existing
> anon_name of the vma to make replace_vma_anon_name() a no-op.
>
> This is rather wasteful as it needs anon_vma_name_eq() to determine the
> no-op situations, and checks for when replace_vma_anon_name() is allowed
> (the vma is anon/shmem) duplicate the checks already done earlier in
> madvise_vma_behavior(). It has also lead to commit 942341dcc574 ("mm:
> fix use-after-free when anon vma name is used after vma is freed")
> adding anon_name refcount get/put operations exactly to the cases that
> actually do not change anon_name - just so the replace_vma_anon_name()
> can keep safely determining it has nothing to do.
>
> The recent madvise cleanups made this suboptimal handling very obvious,
> but happily also allow for an easy fix. madvise_update_vma() now has the
> complete information whether it's been called to set a new anon_name, so
> stop passing it the existing vma's name and doing the refcount get/put
> in its only caller madvise_vma_behavior().
>
> In madvise_update_vma() itself, limit calling of replace_anon_vma_name()
> only to cases where we are setting a new name, otherwise we know it's a
> no-op. We can rely solely on the __MADV_SET_ANON_VMA_NAME behaviour and
> can remove the duplicate checks for vma being anon/shmem that were done
> already in madvise_vma_behavior().
>
> Additionally, by using vma_modify_flags() when not modifying the
> anon_name, avoid explicitly passing the existing vma's anon_name and
> storing a pointer to it in struct madv_behavior or a local variable.
> This prevents the danger of accessing a freed anon_name after vma
> merging, previously fixed by commit 942341dcc574.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Cheers, LGTM so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

I made sure to do some stress-ng --madvise testing with this series (+ my recent
fix) applied :P all good.

> ---
>  mm/madvise.c | 37 +++++++++++++------------------------
>  1 file changed, 13 insertions(+), 24 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 4491bf080f55d6d1aeffb2ff0b8fdd28904af950..fca0e9b3e844ad766e83ac04cc0d7f4099c74005 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -176,25 +176,29 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>  }
>  #endif /* CONFIG_ANON_VMA_NAME */
>  /*
> - * Update the vm_flags on region of a vma, splitting it or merging it as
> - * necessary.  Must be called with mmap_lock held for writing;
> - * Caller should ensure anon_name stability by raising its refcount even when
> - * anon_name belongs to a valid vma because this function might free that vma.
> + * Update the vm_flags and/or anon_name on region of a vma, splitting it or
> + * merging it as necessary. Must be called with mmap_lock held for writing.
>   */
>  static int madvise_update_vma(vm_flags_t new_flags,
>  		struct madvise_behavior *madv_behavior)
>  {
> -	int error;
>  	struct vm_area_struct *vma = madv_behavior->vma;
>  	struct madvise_behavior_range *range = &madv_behavior->range;
>  	struct anon_vma_name *anon_name = madv_behavior->anon_name;
> +	bool set_new_anon_name = madv_behavior->behavior == __MADV_SET_ANON_VMA_NAME;
>  	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
>
> -	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name))
> +	if (new_flags == vma->vm_flags && (!set_new_anon_name ||
> +			anon_vma_name_eq(anon_vma_name(vma), anon_name)))
>  		return 0;
>
> -	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
> +	if (set_new_anon_name)
> +		vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
>  			range->start, range->end, new_flags, anon_name);

I will do a follow up (doesn't really belong here I'd say as involves change to
modify code) that makes this vma_modify_name() or vma_modify_anon_name() as this
is the only caller and we don't care about flags here :)

> +	else
> +		vma = vma_modify_flags(&vmi, madv_behavior->prev, vma,
> +			range->start, range->end, new_flags);
> +
>  	if (IS_ERR(vma))
>  		return PTR_ERR(vma);
>
> @@ -203,11 +207,8 @@ static int madvise_update_vma(vm_flags_t new_flags,
>  	/* vm_flags is protected by the mmap_lock held in write mode. */
>  	vma_start_write(vma);
>  	vm_flags_reset(vma, new_flags);
> -	if (!vma->vm_file || vma_is_anon_shmem(vma)) {
> -		error = replace_anon_vma_name(vma, anon_name);
> -		if (error)
> -			return error;
> -	}
> +	if (set_new_anon_name)
> +		return replace_anon_vma_name(vma, anon_name);
>
>  	return 0;
>  }
> @@ -1313,7 +1314,6 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
>  	int behavior = madv_behavior->behavior;
>  	struct vm_area_struct *vma = madv_behavior->vma;
>  	vm_flags_t new_flags = vma->vm_flags;
> -	bool set_new_anon_name = behavior == __MADV_SET_ANON_VMA_NAME;
>  	struct madvise_behavior_range *range = &madv_behavior->range;
>  	int error;
>
> @@ -1403,18 +1403,7 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
>  	/* This is a write operation.*/
>  	VM_WARN_ON_ONCE(madv_behavior->lock_mode != MADVISE_MMAP_WRITE_LOCK);
>
> -	/*
> -	 * madvise_update_vma() might cause a VMA merge which could put an
> -	 * anon_vma_name, so we must hold an additional reference on the
> -	 * anon_vma_name so it doesn't disappear from under us.
> -	 */
> -	if (!set_new_anon_name) {
> -		madv_behavior->anon_name = anon_vma_name(vma);
> -		anon_vma_name_get(madv_behavior->anon_name);
> -	}
>  	error = madvise_update_vma(new_flags, madv_behavior);
> -	if (!set_new_anon_name)
> -		anon_vma_name_put(madv_behavior->anon_name);
>  out:
>  	/*
>  	 * madvise() returns EAGAIN if kernel resources, such as
>
> --
> 2.50.0
>

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79AF221284
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494781; cv=fail; b=PB5AaZNt1xqxrXu5kRM8AI1XTLpczJYVF5h1izZEAvs739CJSPOgVmlkLOuCvfD/lB8OtfS9NbFNgSolQKx3JGmUOD2V9KUVWsCf/5jkuQY05CDixpkJ2Zmyb3bKFpmBdIJALqaXukjhpL30LgBHyeqHm+vezrvDD6joUCU5Mk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494781; c=relaxed/simple;
	bh=cpBJX1Kj3MywIYQfTMzch5JPNbYEraZc+7lXg+CxU2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=msz5GxEpykX+ToPrLWMSDqf/UPGR9ueciwTJnE878voAzPB7gEHYWvg50Gx/EyBKDShzgD2jjHLicCvUmHLQdS6U7DCIPi7h0MhCxwwwkz5mftVHsP3wTlKpnSwD9QoeGSP+JYvrYCPWeDKzvI5l5QMEc1A0AbHSnxEfw0HZaIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A/jludTs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RSGd0B6K; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A/jludTs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RSGd0B6K"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAHK8X013582;
	Thu, 24 Apr 2025 11:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=7xdo5xl59si8ju0lh9
	GjxXbdJl0h51DkIG4fvf6bepw=; b=A/jludTs7Z7oMi5thlZRcHu8n/hy4bV2bv
	p4SbtYLuUf6DNMWwYZG3XTISBVLk2dtIrkzIF0iBcV5bJ8hGm7Rj56Yk7eg+0T07
	/fvYsyhUp3B7r1JHg9Lke9WiIYnz5SV44KUn165M9Ugna/tR6eWxO8EXNWLNBQ42
	SWXYcC+PeUD1N+XOz9pL1r9qKcZHV1xzaQg+EA48ud2CAu2xoEOkjZFDvOf2LIxl
	+iw9EHm//kzChb/YlQVog5dZzxtf9u1eSkAvGR0wshtkP0YHvn1LRZq5pkBocSWA
	vAVfqc3sDbQeN/1llnILAfZSOCHEJkDwu7jx0rb5rqv4GQdODTug==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467kdg84xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 11:39:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9OedG025216;
	Thu, 24 Apr 2025 11:39:24 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010003.outbound.protection.outlook.com [40.93.20.3])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 466jbrx51m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 11:39:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfA36cO/mpiK0aBEFPDZtjRtQFPIE8krwREWOL0KgCGPyV583Ar4r6QK+klV7nVwMLrT+9F3MoD7HU1GEFiMANE0rAv7X0Mtc4kSnmx35KZC7UHq92iPpfezSudR3aWGRIX7T9IwF5/jdOBVcGjvO+ox2ZB+2grOe7Axir278SCxi/X35zBSaBZNjWW4rwqFEpYR+gk6YrM8RcgIqFaZpc1NlHTzZ6TF1Da/HLOUopVG8NddZpMkLyadiL1y7cc/hiVycKIA7SiMP1wn1sDljjVnLiA/3HUGtufVeX+owgvhj0r4CVT/3yfKV00pCH2JCCA8GSxka+KULw72yUapUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xdo5xl59si8ju0lh9GjxXbdJl0h51DkIG4fvf6bepw=;
 b=yi8J/y4KeCywqUkTrvBme5nzTXEO2dJ0y6tuDECFwR7Yhi+WbT7p8jdy43I/qPvmWT7ztHa32hTXh3jgliG7e2ui4EZz4/l0gCz9f+8FfeVMe0WP+U/hMBamsla9gfcO7c1kHAaKcOQb12XV5v6p1QtmWTeAMZ8ZlpziWXc3nmwTpzgJiuopVJ5vO9fjZXebi6wiJBFhqMiEGbV13SUyR55J+MvyCwYmDeefODRBnF2PC3t82pDw1fHitHkAb0ygKuCK9IBBaIXsX6UKj99sk4Ee4IW0oHrDxN3xs1IdQpwrta8We70YAW1N+UdWax3IFafd2M27LjfUYlgCe5H34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xdo5xl59si8ju0lh9GjxXbdJl0h51DkIG4fvf6bepw=;
 b=RSGd0B6KDW58iiTYxnXr+fAy4zpBLVQmecAzkuaz/rnqwWoA70Zrs13/IzE52Taul9bYIwl+mOAqnF369as01Dqqx4Jwexx6BsD9LHJyCEhnDddc6cUrX2KDUBbn4wmLOFcTJGJEBupW717ZCwoh1pcDubdbx/+JXeYhhXtEC/c=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB7682.namprd10.prod.outlook.com (2603:10b6:806:375::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 11:39:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Thu, 24 Apr 2025
 11:39:22 +0000
Date: Thu, 24 Apr 2025 12:39:20 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
Message-ID: <327e6f2f-0f0f-48af-9ca2-3f8cadf0d8bf@lucifer.local>
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0388.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 015d085d-1728-449d-d235-08dd8324a863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?40xNfYsk1pdAi0dMje8tKrzS3E3p6WTs4elCJHytsqyeVxYn0fZcRJ1cFMEp?=
 =?us-ascii?Q?IcrkvqyuSj08AVCWlYGa7wWSRPV4/BiSvpasXBogabUI0ys+yhpi5K1Q3In4?=
 =?us-ascii?Q?oRC06sJYG3ZFgk7yww+Mg2e58RxO/bvU5huaZEiGFvXv0bmsONkOapBaZpRb?=
 =?us-ascii?Q?1y8MPrA0EJQOaFeehYeRmWm3FGqJ6aY18mTyTdZ5r95xHQNfrTQ4ZRBeyt9y?=
 =?us-ascii?Q?+ElMe3Ql3KRpEu5oWueXmToIwupus1SseXEaVmfmcMPvJq4TQPtWbw5+RnCV?=
 =?us-ascii?Q?C1qvOyxzlb4/X/kGAmEMUBI/R+NYgJnT9/jx8L4y2smaCGeTZ9bJMe4sFCBQ?=
 =?us-ascii?Q?DBJlvjd1IGNNR67Sp4PjaGSMhNxap9yVYI7lpcCztrHTbxqa2d0A7feG0H35?=
 =?us-ascii?Q?p+nPDu3J/v8uiDKQM7RjafTUhNBvy4aRD7JT+nFoXmtejDeynDheKukjV7uA?=
 =?us-ascii?Q?ybGvxKOmO0ZinPYLMX6EKWHupo6sxLcI1VxVCrIrcpcbirnJyckO8P3GfOqR?=
 =?us-ascii?Q?3AQ2XM0bjdL8vEXpL3ykeDQODnigzRSSkqlV13xV9CGKkKv9zcTvxVDWo3l8?=
 =?us-ascii?Q?kxxOLb1BQS80CKuKhZehxocpp6xGNcv8NtghvS3AFOkKl8Nh7deUQDKITF1H?=
 =?us-ascii?Q?LLYZutgNuM3KtdKNsCPVspmmy8PMbg0aoDWiC9LtGQ02HUtHeU9xdfDJRwHQ?=
 =?us-ascii?Q?wyrp5qh4CduHKzPVDyeOR7QAQGS/feR7YLhlaxKwbBos2GWsMSGD9jkmnKk4?=
 =?us-ascii?Q?zx4PwP7ENzY50LM68mtsFDK8TacuSubS3w7RBjxsKY6gvyT5JQUget7SvGO6?=
 =?us-ascii?Q?qoKuNTgNZdxOI0226l04i+S+GO4EAX/8x39julrGr6CznX2pOKTEehELMOLJ?=
 =?us-ascii?Q?xTBfKY7TuAFgYmkgjAVmlIp+9OshjUmoe+g5Gxe3GGggUXbRaDggljneLRDZ?=
 =?us-ascii?Q?VF3IG8hqF1BQqxM9jyzwM9BuCW1XAKbpBFdZzSoIwywVNjm6GJZgO1GLEbnp?=
 =?us-ascii?Q?DEQenmYxfcaL2ETYIGY5KiGVtgY/90Yk1q/azAFghFg50VRwrFbDSTrNCs7P?=
 =?us-ascii?Q?FzPqdEi7gzfRoUFUS+vRph4S4N3ABgZeN+D1RPETtHXiZ0Y8rnyySv/z36sw?=
 =?us-ascii?Q?kRdtHfYqULks8OKDhbDwpY6i0O5HcGoQntcg0lGglSF6XLhtJixuvtGHTFo6?=
 =?us-ascii?Q?xu3gS6978r6xih+HqBO55vGIolibdyhhVHmrN1GZiqzuhrvYSPU4YUjaSlRD?=
 =?us-ascii?Q?ALG3sTS2SJSbEDVk9oQ262SAZfFhRaVaSO4D2N/PioBs7L9Ir6Ds4ZisClkZ?=
 =?us-ascii?Q?+65EAHMZaZjhWxnwcDi8ZMlcVSwryFmUnTfYYXuIUHdqxLymbDXUE4OoLyAb?=
 =?us-ascii?Q?IQnX3fg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1AJquy51A8m166RZCtHL17k8jQ8yn/Fv4SUZoxsnYP//p/zciar0cRSxYIio?=
 =?us-ascii?Q?6kCnEqLoZ1uPOjKWM4NkIDbXAjgD1uGr6RgjN6nEmgwsXQcTbHcd9llWYQen?=
 =?us-ascii?Q?CVlgv8ojrAJW2lAuANwbx82XGCocFO6lQ1jwrURFxFUJQjVd0stNij+o/inX?=
 =?us-ascii?Q?bD81YKnUCEX37snndf9hrm3EDVVW6eeq2SIScoZtuK034Ym9EUXbFdOxeWf9?=
 =?us-ascii?Q?JFgLnAiQGtMtyKaf5GZ3evuu2gPSNE3zUHqJEIydWEl8x2jvIuAkSucpVjsO?=
 =?us-ascii?Q?AeoTn+2+SZrTwdXLjW3Lt5FVrL8PTvSu4vE+VtDlQqcCJ/Hx4ZVX8rupf3oQ?=
 =?us-ascii?Q?YDTcF1+c+34V/K8wZOeux5XRvQrPJx7LOCN7Et1Vf87B/SMPjogpmKB6fRB+?=
 =?us-ascii?Q?5+3JKLplxGL/7aE7KDVKl7Mi/hhz3VO3peuPQ/qVFxPepbdHgVe/TRqFLlzn?=
 =?us-ascii?Q?lYmf19Yv4nSpPy7ixBX/mKfufNhppu3dQOy/8xiD1o28zrdvR20MQXiTjbwW?=
 =?us-ascii?Q?4Pj2BBD4Pv0TnNqjGJdV9MCRduNsZrZ3vd8j6ZU3zyArSn82M0bx58txaRMi?=
 =?us-ascii?Q?FhTC10Pjg/pcCvGQNF8ad433zUsr2G0NgYR3znnhro5Iw8MEtEIAQi7ynIYS?=
 =?us-ascii?Q?DsO/YYE9rln3PQMu25JNM7RqMaA0lNmA7WUUNZYSqIewFkffBghJFyLea8eu?=
 =?us-ascii?Q?e2gSHlAfCCtCP3yaqiS6bjQ1aHQVK6ejKKtjqljHzhT9em4aJsY01mJQO1oc?=
 =?us-ascii?Q?hvNpXhcMl1KLauaO37zfHaCdU2uITbu3hi5rb3AbESAQUWFsrnoCbP3VTFdF?=
 =?us-ascii?Q?kFbaSkxFOedHCppEFJCPODovdEiWm1pXtoVZFo4LKmZi2lb7CIk7YC/JTZsX?=
 =?us-ascii?Q?Vekcg1pxKa1VNTZU9otEepliwHdnYyMcNXINe4ZAC6TFZ98VmKmkeUiHQqBy?=
 =?us-ascii?Q?3a7FtUa7vR2T6sCdKJSdhwVytyelDPHT/4xrP05IPPkgkrOYbaTmPbpuGSs7?=
 =?us-ascii?Q?rgH1/nQiUInTZyYyHrcUtOVqTuYp/J5VpxsEN3OeJCjiWKMo45mIe/1pq4y9?=
 =?us-ascii?Q?PtirUk6K5T5aenjiZcD1pEM0Rg2bul1YagVJKDQRFdrOJUNqT9Z12C6sBkd5?=
 =?us-ascii?Q?ylEIZ14801BI3jXkFFEz/it4e8s5NevdB2/y3N+nej7S8Tnbhko4BoSp2j5K?=
 =?us-ascii?Q?ir21XWew8FZ45NGeqACTbsP3TzZ/t/IKgN5DxHSLjRnFNfWhjXA+zKbhnJDW?=
 =?us-ascii?Q?m9qpeARQuQPfE5a236booO+8j4WLpYz9kHGbnit/9DwAnwX2P+6QWj5svd63?=
 =?us-ascii?Q?gaIrjxu2vBrxKL/lJDB3sZV0hAmoVqufvYB03RgSq6YcoOxNbCJ2Ffppkdu1?=
 =?us-ascii?Q?tGhDMMKgUaedfOJuSOOcRs76zO+fdG4zmH9/UJZHOatUixB5OEBvrxsD5MaQ?=
 =?us-ascii?Q?Hmn5FQc0xKrQIzR9ezFU3p3HizusLxpr/4bxs3ryx/EvY4EdzkmnGxlZ+RTG?=
 =?us-ascii?Q?3IeHCMgDpVi7j5SphywdQOIUVtbOrtY3YIrcW3sTetRJEy6nSqQ8HaBJqgMJ?=
 =?us-ascii?Q?LnE9If4bNwcPSPUJzCvbkVAsJ4G6JulCIn1NTlj+Ao7t6QP+skHc30yExZnc?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tpjrx/vIw/crI1nUo+CcDAWaJCvI52VkvPJIHKmKyoslGnYtGrvndusVgg3PtsHQ+xcwJHSMJgTKeOI1UyANAZn/I5Rk3Ed5BCm/5I1h2kN5rjsC7bTld64B52h5gYSB3E1UL5SbmReqQB06maplF36ULGM451jgga6V7sVGyYuOFOal7nUoThNey9ZlvMNMFcCUTkVtWs4TNpflnfvX56vxpbRV94oQcJDusLl6HlMlmgOlckzsegrks6BDmlg9Nk7ONHHkPON83blOvaq+bFG6Sibiq//4GbDzgIitVXLmAeSG/CxsY/avpexooSkA6UUjNnLlEVhjRGPn7SCldMDRneequUN5U0a+83941ix5B1kmV7wv28PiPMgZqcsiGkg04COODgQBjxMsPeW8fxD9+F6LXewPf0fLuvfJ2FJaHZp6rbcT+wj6NuwpBawYv29T7ncFQcgGfnNRmhsr/Jk0yqidjBdOfWPoHlUwaLb4fQFzc9Fitxm8pszD7i7shAqmD36w6chhk6mCIZJxC4yL9rtmF4svfD6M4HZCToUc1am4PXh4bqukcbgMSvvk+mUyuvCs70KKkmAd5hyleOtr5kjjyGzYlWp/VzV8usI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 015d085d-1728-449d-d235-08dd8324a863
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 11:39:22.4649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csnw+oPupGcp7ObV44LWlBsuTqTxJWGQv2r3FfjiHsCmkAm9G7AGdCQj/3xFYXzrj20It9U7fUo9q9vfJ0+C0tf7R5dIGJc/Ka81PyrCEVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7682
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504240078
X-Proofpoint-ORIG-GUID: TgZENbyDb3-88rOO-0OgOTY5OvxLJ_R2
X-Proofpoint-GUID: TgZENbyDb3-88rOO-0OgOTY5OvxLJ_R2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3OCBTYWx0ZWRfX4VHK+Lhtol4Z 19N62soigEW9fae4VG8nOhVdI+qriMxx5QGysv4qfXivS8dOKutoaxSgeX/GXgGUiGK1CtggYd+ HHluRkICXJqlHhzzaLvoRHIWZ3n09IaRYk7YpIJp2KT4lr4o8oz71yiLiOx8T0wrKXBNkHLvIdG
 uj0kgDqdr7C9kV5QIwFpW501ojdPyRz0wTHORFSmizy8n58bXyin5vMxvrvyOFuLCWmEEVtIaaP n0mk22lduTBm4j2b9E97p9XRpYNZrmdo9cH2hQ3oz4kRcQucWiMJHaWnK/XtbbWqHiNSm+M21KB Pnh3J4DkB4ws6z2bW+RRfh/2TfQYpVIrNu59HVLD8I38vBu9pA2N3ZzFroXCdBWWIDdKOJ19FmX oTq3Lgma

On Thu, Apr 24, 2025 at 12:16:32PM +0100, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for Transparent Huge
> Page support and add appropriate maintainers and reviewers.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
[snip]

Hi Andrew,

Could we update this to include Dev as a reviewer also? Fix patch included.

Thanks, Lorenzo

----8<----
From 5f141e0fbc0d177dd489484e5504f283ec206267 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Thu, 24 Apr 2025 12:33:35 +0100
Subject: [PATCH] MAINTAINERS: add Dev Jain as THP reviewer

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 85cd47a28a0a..596eff35762f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15572,6 +15572,7 @@ R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
 R:	Liam R. Howlett <Liam.Howlett@oracle.com>
 R:	Nico Pache <npache@redhat.com>
 R:	Ryan Roberts <ryan.roberts@arm.com>
+R:	Dev Jain <dev.jain@arm.com>
 L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
--
2.49.0

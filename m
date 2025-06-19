Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A53085DB
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345560; cv=fail; b=dQOd1XOVD8/fR/FXW0q/lObAmKBayHh7DcoicpLGScdy0fbimlj4OnmjZrCsRRCPzr+Behxq/cxa14Jip2qg8e7G9Ec24GRWSmsRXuOYWYa8J/ekJztNnxVr3vOn1NvWTD0tT97bpBKm3eckR0hd0ytfYsE0J1hZ8PqTea7zo8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345560; c=relaxed/simple;
	bh=EMsnzzYtg/m9Jl3etpEhbwoifbbkfF+CoffgcQ+CNog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KdKS1So72cAc3hnqZJIm5Ena0PNyoIDuTXBtXuTUZ/ULXocgdKAqRMMU5do4MKJvSikHl+HZk6ro+IEV++qZPqQZdjEEh8FUXil0DEnxMg6bOcAZ6PhjqlIIugeKTe7zM0suoWnTpvL2siNQgvRezj3+Rm4aH1us6vnmNtg1EQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZNv0dH74; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hmJeH/bJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZNv0dH74";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hmJeH/bJ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMZaI011340;
	Thu, 19 Jun 2025 15:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6KE9M9KG0E3WhBX2JQ
	ZHMkDWWMWJMAfmmP/RfALfX88=; b=ZNv0dH74pwiRoFCtMPA4hTyP5H+iKEJgix
	AF/qwnygo3u7SzKOU9fxKWCq7El0VLYlta/SmztTuaSqWFTK6nLDJdbUbD/hrk9q
	vUoVRPPVZDrirK1xFVXbzSJc6RmdsBapeyEc96A1yZGSOBFnWxJYI9y5nb0NP41C
	5VtBnjjJlBCVSfMyUS6MqtbqW/mty6Px9mEMnwdi2ebuC1B8i1jQhGqput/THZeD
	rBKNuN/HZVBSU8qZbu13ctLz+W8r8/RzQrlIWkqC9lbsJjGae1O8v1T0Pbm+2+Rx
	QPJb90KUDzHpNSLCfQnAxK64Sd3tp9dzATIVbl0Cz38GIYpcX2Ww==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f247q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 15:05:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDKtd0023266;
	Thu, 19 Jun 2025 15:05:12 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8pdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 15:05:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbq/kBNqocEhAqpIPxY/69EiIxyyiIqsmggOkEMTeH6A1DuvT3liuOokbzPsZjUZ/xI8ucAbWxEAQaUXsQ7o5+5Y+Lw62fLMdFYHmwLY5M4MRkDrngzB5pbEwLT6GxeiYV7REi58ETe0NyZvRQOBoVTSgFPGALjINAu+LrYrJWyFzOqex3LoKT6GtjRUOxoKD8kYWAowUXK40FRqsgzs7Sfdv+LZc5pBcP7euVxzfAWkH9RjaLDZyhs/tseIxmBSgrXv5ehIO2oXoQIGJHFi3nXcdg1d023Bj70A6ziT1GuvRA/LygJUCTfPhv/lQGQcUulTHpOdtQkyP5JHF4+QaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KE9M9KG0E3WhBX2JQZHMkDWWMWJMAfmmP/RfALfX88=;
 b=l/EVvwvFW8kHFLZdxU3I00LhgKj8jzJO3uRlu4xSNnmsZuTpVPGY9dypzWLaq7fZ69c64DJEB7tDSjWox4rlZNzvPbQcHXcV5Dh9SCRm5IqnDjqLg2dg1m8hdCw6t+4GrLZti5zf9J3YjPb4HAvxGVNo0fRBiqbzRJzFVPoa4sglTLdrN2L/Kjxx0Y1ecuIt5hp/CoCoEpZQ4mFx5ePpPP86omn/b9sOz8We8g05/KI0XbCIGk9XNo3bo65ZiW9m5ol4CMhPFfTxNsxxY+KQ4IssaC6PRb6AXo8Pr+Y+bLadTq/2Vvnz5yINUuIo758npbrRepn6EQrST1q2e0FJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KE9M9KG0E3WhBX2JQZHMkDWWMWJMAfmmP/RfALfX88=;
 b=hmJeH/bJnshKFpocydd5jwhLSZaEKqkksLQyS/bF2je91p0JzPnzWB1cC5vgBC0efS1Ez5Qg/KxxQPHffQWyuxHvGYwWekBhb63Ypa+FR/X5vvw6yasIy1eZWXZkQU/8mFdvl5Ruh494PskNqlAtlLcPwxVC/A5VnKErA39jy6E=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CO6PR10MB5572.namprd10.prod.outlook.com (2603:10b6:303:147::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 15:05:03 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 15:05:03 +0000
Date: Fri, 20 Jun 2025 00:04:50 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
        Adrian Huang <ahuang12@lenovo.com>,
        Christop Hellwig <hch@infradead.org>,
        Mateusz Guzik <mjguzik@gmail.com>, linux-mm@kvack.org,
        Suren Baghdasaryan <surenb@google.com>,
        Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: Kernel crash due to alloc_tag_top_users() being called when
 !mem_profiling_support?
Message-ID: <aFQnEj0UASzl2Lxa@hyeyoo>
References: <202506181351.bba867dd-lkp@intel.com>
 <aFQaY4Bxle8-GT6O@harry>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFQaY4Bxle8-GT6O@harry>
X-ClientProxiedBy: SEWP216CA0049.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::15) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CO6PR10MB5572:EE_
X-MS-Office365-Filtering-Correlation-Id: f5671c32-bf22-4563-dfa0-08ddaf42aae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wzV65++DwxrgWcpDCQQk3O0IZQFbslE139f7gz9nhKWpxQA3luLIaCa/TXdw?=
 =?us-ascii?Q?4OW9JUjHyGJGO1hTqonKHqnBWJ5LafjsvGkfpWh5NPpttpHGTNbXvXsc89nG?=
 =?us-ascii?Q?AmBc61gkDLUiHMf3IDq82f2HDcadCQ9Vp1I0PFkfele6y+5fti0qrRu+E5X5?=
 =?us-ascii?Q?5LSo1EqM7wDEcJlQRpPx4XbfXv+M9HPyjWTcpwuWpPlEa2HD3L+cJ3VY7MFs?=
 =?us-ascii?Q?+YoUi8EU96iyEEeQoYTwO9d6Mx+oaSl/vs9yTtxBuAXG2KGVL7iHLHlt+bDm?=
 =?us-ascii?Q?kQNXSzoQh4zE91IpZoOys13AuBiEof6cN5sSte42DwKe2qkIZw+Vu9r0ebVq?=
 =?us-ascii?Q?TE6quWw/rXN1+JasORr5n9xDEPkCcy8F8TUD9btniVDBY9vTtS5m7k2kOpcp?=
 =?us-ascii?Q?tOngkokS+sQ3nkF/wzseWHoTHXheE5HJwYz7xYQQwip4InYIV6KOSKybOLQM?=
 =?us-ascii?Q?FA7vlihBCYI1ooX/Z/Y4xHW3dZ1wP7qCiXuqcq+TIyb/JwNBz+bYxWTlE/jt?=
 =?us-ascii?Q?8lM61GkaWCmArDRG6dIgjArh2GQ74g0H0wzdCKdLNHazW1MHXam8etzoLN56?=
 =?us-ascii?Q?Ken7MysNfartxOVe53tdfzDOTeSEVMxSh3eItuU1OZF7F8GCXQR8/r3+WEKt?=
 =?us-ascii?Q?cdJbMnnFk0PVjxCXJ5JyevwWocPr58RC2nqRQRES2S0wfhcuzDNVTgW8l4Oz?=
 =?us-ascii?Q?rn77PaXNE8mEpbKFCqOFvVFJFHqd3FfcAWgEfQ0F9UNhnfifvHt3KqKaQOvk?=
 =?us-ascii?Q?uzURAiJgfnETZobDqHdEPCpk/kLoRWzU5SwCKBBt0B1d0seBQlzNMnnF9Srx?=
 =?us-ascii?Q?RwYjeUEzRL+gNTVp28XIJvGfo4AHaDM59ziJmTpFjLLpECLr+Yc8+lMo76P6?=
 =?us-ascii?Q?g/twYwT9iI3+nIwiMsgsXmhHFaNWoAHWR3Ww6AhuBIsHsZDcoqjggb90ath7?=
 =?us-ascii?Q?sNx5zBm2QKrmqaRFgF4e6eYUC/xjD2fojts9SaRqoo0NRJnh1Se5c+GNqBGq?=
 =?us-ascii?Q?TVbSSqCgEibN1pIXZ017eatzikOyU6EQRqRCqXyaW1YMxKF6f/2JJ42Blp+1?=
 =?us-ascii?Q?lKV/uwKnlh68hn/sHvhUyR1/X3YbC8nLH8Pr60cMJZ0r7dHQ3W8HYvmO2wBj?=
 =?us-ascii?Q?4GQn2dT3BqIqOWi9Oo3wHke74u4M1xuRrrBEmxOb04Mcl+1XlAfRwNGvyB2Z?=
 =?us-ascii?Q?XcQhrLDCzwkZ0IwmXgKHjkxFgH7B+lUu9aUyugckEgB3x5dmB6MmEE9FB5Ot?=
 =?us-ascii?Q?sYWc4EMpVOHFyIAiEYGxSKzYovMBgWFhcRo3iogTWDaxXXxjf7MS8mhv08oG?=
 =?us-ascii?Q?OX36Vk7Qk1lefScd1dy1EjfoXA21iHUb/wyI18P0Yh4yDbj21balkfDp7Ssm?=
 =?us-ascii?Q?Hb9YfHb7ZOJEPiirayFduqnmKl9B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0aJ16gaJzXJFXhaE8KoaxsmRYkqu4ZuKxbnroi8Nda6MTNTi/KvwGj1rB8eJ?=
 =?us-ascii?Q?oPlbmGpXaA53K52I7Qzb/Wrn3ZzDhM9y1/gsVAtWDMSWkr177gRj5XCHuCJF?=
 =?us-ascii?Q?TazzTvvFJk/8mVr0ZeP2WUQxKCi41Peq7+CAQFqmZfKajl/fnTfuKL92yMk1?=
 =?us-ascii?Q?sWm7K3pMS7toBJLuaixyn5kJlh599wP5WfC/k8OE4rgd3+LnUfnIBWoziQ8U?=
 =?us-ascii?Q?gC1tN77sOLVPfHkudqkXYHMjhiOX6LeqbqrkJxvIuZZnZs/xw23Nptkq0K+H?=
 =?us-ascii?Q?NmR2vLHdIwX82sclboMv5BZf20Xqm1tS0aqmBKPorN3HvykWJTfFwPmiSU7K?=
 =?us-ascii?Q?qnPszGL4XGJ76zXgDzp/jr8OBVsomhn6pFN3+eIiY2o/Rvgu5CswoElaFIdi?=
 =?us-ascii?Q?ONoTDYNtb7xkqz0R+xUXGDeIHejwe7iktV1LYC7e9OALGFomfiuHzb58q26g?=
 =?us-ascii?Q?/WIFLvD7GZp+KcGDyPtGxraOJjn7ompyBrORnFadA50JUe0O651hdHUuL6yS?=
 =?us-ascii?Q?AQKdsjg5X4ZEfDKccR/8mSyTTuabfmnxmgByFjWbUBD/y25Mwh5dO1ZLdcYi?=
 =?us-ascii?Q?Rqy2e5ZfoCthJ+FX0oh5yTZmVKYgNLt49NWu7Wfe+MLVKuqF0ve46xxYG6Dm?=
 =?us-ascii?Q?vRn8D+Piv/rQy3kpcGF4sDGjIEM3U4QcVvSk9jJzu3TqwzAtuawhRJhS5isc?=
 =?us-ascii?Q?G9jUAGmzXmZ7N2NDRu0qFBhbnnCsqtV3CXwtJqJiBBRun8cVpzFarSKP6aTX?=
 =?us-ascii?Q?bG4IxhzHIJN1t/tIFb2la6ept8IW2orpvFcs7WHFQsqiND1+IFTN+G0ccx2a?=
 =?us-ascii?Q?3V0n4b3Y1QaDU3qEE5mnZHHZKztoeibbALBoxqt0+PnQ+2ccSXeJnOAF5yOs?=
 =?us-ascii?Q?Dz4BKagFECGKlROVf4CAGsreYxV4LFmkEQIew/aXZ4g+LUin0mMxU7fZCgwn?=
 =?us-ascii?Q?SPnNgmFPciAAozQdVV1HDphb42D8tMkjPTSLs21qSWNuMHXTtsotNieSJ19y?=
 =?us-ascii?Q?Mzg8kfQA4uMCr1/FGiSDfqqRsh0TUD1bO0SXxSWAvuFxEquXZrHEu6ZBqdfc?=
 =?us-ascii?Q?8HumWJdPm5G5O/ABM5hBBe4tTHRqizkfjlTA1Xz7YOirieehlVaVt2jGroRC?=
 =?us-ascii?Q?aXkADuf5RRCdvODng1ZfQIpYvoCN2ETowm4rzocB5eeFpbdjKG8glxv2Ko3f?=
 =?us-ascii?Q?fMYK6mzmVnVKI5kLeaLWpxj41FA93+YYA11gUATkaUtrn7nS1aUX7i9taIS8?=
 =?us-ascii?Q?pGqlriXQj/SM3281tarT8p9o04xUOnHtuecTbsrODxLWtJOY1+L9ReCMkiCw?=
 =?us-ascii?Q?bM6PbnPL119nF4/WIc9rw1+3xRVITFeY2mvmH26QNKCQBw1/MdFqiomKBIrs?=
 =?us-ascii?Q?w3yXRTIv4KVfqLPrLkAjHUkWd/NB88J2B1DH7osmdF6b9Wx1t+aYIWQp33Sq?=
 =?us-ascii?Q?e385twUrSvcsMhdDmq+G52CEqT3LLK91cH599TP4qiy3vxiy6YILD1/ZlHJz?=
 =?us-ascii?Q?uP8JWVtGvmjTgRUCRMCZ2kugQHuVrRzeoDxOvhc+VXonvXnU/KvBXa2ud58X?=
 =?us-ascii?Q?nw/9Ke6hAndjzbkOL40ZcmZ7XsGoF+xq7jdx/CCT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RVx3Ykj9KMPU26os9YOfp5shP+j9+fMGZP8xbBQ3zEbwR478sIALOV6EvTGCziKo3ODZxp3bdKbu3+NOxkZCrT21XuP3UeFWc1CZ1p/ZXy+ll0ScfYC8BW4GmTCtS4RpQjyMLYfDfalr8iVXftGgt/SlaJ7oRD+fKKVq5QedApxrf0cmf6ePREujEZpz1M534Q+CEAJl7mLKXDCRxKboJWWWB4BvCBch9ZsLshFB6GoUjbiIRrf3HYORhkXNLZ/Q3gmbPaXxCGCtU8umKBkWAFJbeXu3nRxs3KO9hfgLXDULNPU4uCuYWTBDo7SxYK0sIgBWLuqj4/uvf46RKOhbS6TUXzISHBZKnMTD6gymftUQTg8uPqF+Ui208Oc2NFwseGwDjhgbkOaKe7XZmY1cBYun4q+X+AJbKcchWlI7YL9+NTJVXxXnGT3KBxeqkcB7uX5EbgaSpI77TLfCgh/sg8xakUPI2s0zS3tHXgzdvr7i3npMf8bdXPH7TkUG70wnrBCiFG83eTemEHtx9NOczyXO5Tafwyqjp1fVj1+KL/Hdq7lcjpXYwthoUAk9XbLd8QNk4+HOBMFfcFp8eLnGCJr8xOheplxvOTjN69oT1D0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5671c32-bf22-4563-dfa0-08ddaf42aae4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 15:05:02.8231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l74krUMakwC6AlFhX4/kGXQFZlGfWNrmHrB02JtMoW1WT8juB/UtgNu+GCqBL4YzhhweM3DzP9B5wOSnSwSvQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5572
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190125
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX6uq7Ccp2Pr/E MiSgLTY38q/pe6vWk+A2fW+H5STXNz5ln9u5g78uKf2LsHiwtWlcfnnQVNN6vYrRAmFuJbqDEnD ggUu7yR8JkNfGNV0OuNWYFwagP3cZeZb3rwvdR5hdxSzL6rvNGs8Qfn2xabtfpDZR8ij3Y1hol2
 4K2OegwEtKVJRL1MhvuHFFwzMWglare36Sc7nxqSFKBLwamNrWhAxNBzKuOIwKh46y0hsqLT70X CFBp8/y6I+kweaPHBs81JkJCXMXhZWFWURx5pR+tOOPhf2nBDSiFeS80o3RK76ZnGgbhZRySXHF 7CPLV3+C8Qf/oY3H8QSt6KP2O0L7jdurHVCQ5wTEltXtIaPizVG9jIKCIpz5iRinfK2kqpwclfp
 PB2wd0aB51N8+eCHZj4G1bLZul7VS42caWj/8CLTNDFHqI3yJPXpc0mpft8C1fJmorgSrzzf
X-Proofpoint-ORIG-GUID: S6qRQNIfeSln0ZBAZdF_nfb09ACZZBUU
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68542729 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i3X5FwGiAAAA:8 a=NEAV23lmAAAA:8 a=jvFgrfncrO7L_kr82SoA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf
 awl=host:13207
X-Proofpoint-GUID: S6qRQNIfeSln0ZBAZdF_nfb09ACZZBUU

On Thu, Jun 19, 2025 at 11:10:43PM +0900, Harry Yoo wrote:
> On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> > 
> > Hello,
> > 
> > for this change, we reported
> > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > in
> > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> > 
> > at that time, we made some tests with x86_64 config which runs well.
> > 
> > now we noticed the commit is in mainline now.
> 
> (Re-sending due to not Ccing people and the list...)
> 
> Hi, I'm facing the same error on my testing environment.

I should have clarified that the reason the kernel failed to allocate
memory on my machine was due to running out of memory, not because of the
vmalloc test module.

But based on the fact that the test case (align_shift_alloc_test) is
expected to fail, the issue here is not memory allocation failure
itself, but rather that the kernel crashes when the allocation fails.

So I expect the fix below will work for you as well.

> I think this is related to memory allocation profiling & code tagging
> subsystems rather than vmalloc, so let's add related folks to Cc.
> 
> After a quick skimming of the code, it seems the condition
> to trigger this is that on 1) MEM_ALLOC_PROFILING is compiled but
> 2) not enabled by default. and 3) allocation somehow failed, calling
> alloc_tag_top_users().
> 
> I see "Memory allocation profiling is not supported!" in the dmesg,
> which means it did not alloc & inititialize alloc_tag_cttype properly,
> but alloc_tag_top_users() tries to acquire the semaphore.
> 
> I think the kernel should not call alloc_tag_top_users() at all (or it
> should return an error) if mem_profiling_support == false?
> 
> Does the following work on your testing environment?
> 
> (Only did very light testing on my QEMU, but seems to fix the issue for me.)
> 
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index d48b80f3f007..57d4d5673855 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -134,7 +134,9 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
>  	struct codetag_bytes n;
>  	unsigned int i, nr = 0;
>  
> -	if (can_sleep)
> +	if (!mem_profiling_support)
> +		return 0;
> +	else if (can_sleep)
>  		codetag_lock_module_list(alloc_tag_cttype, true);
>  	else if (!codetag_trylock_module_list(alloc_tag_cttype))
>  		return 0;
> 
> > the config still has expected diff with parent:
> > 
> > --- /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/7a73348e5d4715b5565a53f21c01ea7b54e46cbd/.config   2025-06-17 14:40:29.481052101 +0800
> > +++ /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/2d76e79315e403aab595d4c8830b7a46c19f0f3b/.config   2025-06-17 14:41:18.448543738 +0800
> > @@ -7551,7 +7551,7 @@ CONFIG_TEST_IDA=m
> >  CONFIG_TEST_MISC_MINOR=m
> >  # CONFIG_TEST_LKM is not set
> >  CONFIG_TEST_BITOPS=m
> > -CONFIG_TEST_VMALLOC=m
> > +CONFIG_TEST_VMALLOC=y
> >  # CONFIG_TEST_BPF is not set
> >  CONFIG_FIND_BIT_BENCHMARK=m
> >  # CONFIG_TEST_FIRMWARE is not set
> > 
> > 
> > then we noticed similar random issue with x86_64 randconfig this time.
> > 
> > 7a73348e5d4715b5 2d76e79315e403aab595d4c8830
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :199         34%          67:200   dmesg.KASAN:null-ptr-deref_in_range[#-#]
> >            :199         34%          67:200   dmesg.Kernel_panic-not_syncing:Fatal_exception
> >            :199         34%          67:200   dmesg.Mem-Info
> >            :199         34%          67:200   dmesg.Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
> >            :199         34%          67:200   dmesg.RIP:down_read_trylock
> > 
> > we don't have enough knowledge to understand the relationship between code
> > change and the random issues. just report what we obsverved in our tests FYI.
> > 
> > below is full report.
> > 
> > 
> > 
> > kernel test robot noticed "Kernel_panic-not_syncing:Fatal_exception" on:
> > 
> > commit: 2d76e79315e403aab595d4c8830b7a46c19f0f3b ("lib/test_vmalloc.c: allow built-in execution")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > 
> > [test failed on linus/master      e04c78d86a9699d136910cfc0bdcf01087e3267e]
> > [test failed on linux-next/master 050f8ad7b58d9079455af171ac279c4b9b828c11]
> > 
> > in testcase: boot
> > 
> > config: x86_64-randconfig-161-20250614
> > compiler: gcc-12
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202506181351.bba867dd-lkp@intel.com
> > 
> > 
> > [   36.902716][   T60] vmalloc_node_range for size 8192 failed: Address range restricted to 0xffffc90000000000 - 0xffffe8ffffffffff
> > [   36.903981][   T60] vmalloc_test/0: vmalloc error: size 4096, vm_struct allocation failed, mode:0xdc0(GFP_KERNEL|__GFP_ZERO), nodemask=(null)
> > [   36.905195][   T60] CPU: 1 UID: 0 PID: 60 Comm: vmalloc_test/0 Not tainted 6.15.0-rc6-00142-g2d76e79315e4 #1 VOLUNTARY 
> > [   36.905201][   T60] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [   36.905203][   T60] Call Trace:
> > [   36.905206][   T60]  <TASK>
> > [   36.905209][   T60]  dump_stack_lvl+0x87/0xd6
> > [   36.905223][   T60]  warn_alloc+0x15e/0x291
> > [   36.905230][   T60]  ? has_managed_dma+0x37/0x37
> > [   36.905237][   T60]  ? __get_vm_area_node+0x33a/0x3c0
> > [   36.905244][   T60]  ? __get_vm_area_node+0x33a/0x3c0
> > [   36.905250][   T60]  __vmalloc_node_range_noprof+0x170/0x306
> > [   36.905255][   T60]  ? __vmalloc_area_node+0x460/0x460
> > [   36.905260][   T60]  ? test_func+0x2ae/0x469
> > [   36.905264][   T60]  __vmalloc_node_noprof+0xb8/0xd9
> > [   36.905267][   T60]  ? test_func+0x2ae/0x469
> > [   36.905272][   T60]  align_shift_alloc_test+0xa8/0x165
> > [   36.905277][   T60]  test_func+0x2ae/0x469
> > [   36.905281][   T60]  ? pcpu_alloc_test+0x31b/0x31b
> > [   36.905286][   T60]  ? __kthread_parkme+0xcb/0x1a3
> > [   36.905293][   T60]  ? pcpu_alloc_test+0x31b/0x31b
> > [   36.905297][   T60]  kthread+0x452/0x464
> > [   36.905301][   T60]  ? kthread_is_per_cpu+0x51/0x51
> > [   36.905304][   T60]  ? _raw_spin_unlock_irq+0x23/0x35
> > [   36.905308][   T60]  ? kthread_is_per_cpu+0x51/0x51
> > [ 36.905311][ T60] ? kthread_is_per_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250614/kernel/kthread.c:413) 
> > [ 36.905314][ T60] ret_from_fork (kbuild/obj/consumer/x86_64-randconfig-161-20250614/arch/x86/kernel/process.c:153) 
> > [ 36.905318][ T60] ? kthread_is_per_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250614/kernel/kthread.c:413) 
> > [ 36.905321][ T60] ret_from_fork_asm (kbuild/obj/consumer/x86_64-randconfig-161-20250614/arch/x86/entry/entry_64.S:255) 
> > [   36.905330][   T60]  </TASK>
> > [   36.905332][   T60] Mem-Info:
> > [   36.919941][   T60] active_anon:0 inactive_anon:0 isolated_anon:0
> > [   36.919941][   T60]  active_file:0 inactive_file:0 isolated_file:0
> > [   36.919941][   T60]  unevictable:41612 dirty:0 writeback:0
> > [   36.919941][   T60]  slab_reclaimable:7429 slab_unreclaimable:145259
> > [   36.919941][   T60]  mapped:0 shmem:0 pagetables:145
> > [   36.919941][   T60]  sec_pagetables:0 bounce:0
> > [   36.919941][   T60]  kernel_misc_reclaimable:0
> > [   36.919941][   T60]  free:3233392 free_pcp:1185 free_cma:0
> > [   36.923830][   T60] Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:166448kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB kernel_stack:1952kB pagetables:580kB sec_pagetables:0kB all_unreclaimable? no Balloon:0kB
> > [   36.926265][   T60] DMA free:15360kB boost:0kB min:16kB low:28kB high:40kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> > [   36.928855][   T60] lowmem_reserve[]: 0 2991 13741 13741
> > [   36.929411][   T60] DMA32 free:3060560kB boost:0kB min:3224kB low:6244kB high:9264kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:3129216kB managed:3063680kB mlocked:0kB bounce:0kB free_pcp:3120kB local_pcp:3120kB free_cma:0kB
> > [   36.932080][   T60] lowmem_reserve[]: 0 0 10749 10749
> > [   36.932604][   T60] Normal free:9857648kB boost:0kB min:11744kB low:22748kB high:33752kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:166448kB writepending:0kB present:13631488kB managed:11007884kB mlocked:0kB bounce:0kB free_pcp:1620kB local_pcp:740kB free_cma:0kB
> > [   36.935336][   T60] lowmem_reserve[]: 0 0 0 0
> > [   36.935802][   T60] DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15360kB
> > [   36.936931][   T60] DMA32: 0*4kB 0*8kB 1*16kB (M) 2*32kB (M) 2*64kB (M) 1*128kB (M) 2*256kB (M) 2*512kB (M) 1*1024kB (M) 1*2048kB (M) 746*4096kB (M) = 3060560kB
> > [   36.938318][   T60] Normal: 6*4kB (ME) 2*8kB (ME) 7*16kB (UME) 5*32kB (M) 3*64kB (ME) 4*128kB (M) 6*256kB (UME) 2*512kB (M) 1*1024kB (M) 3*2048kB (UME) 2404*4096kB (M) = 9857528kB
> > [   36.939849][   T60] 41618 total pagecache pages
> > [   36.940324][   T60] 4194174 pages RAM
> > [   36.940721][   T60] 0 pages HighMem/MovableOnly
> > [   36.941188][   T60] 672443 pages reserved
> > [   36.941626][   T60] Oops: general protection fault, probably for non-canonical address 0xdffffc000000001b: 0000 [#1] SMP KASAN
> > [   36.942185][   T60] KASAN: null-ptr-deref in range [0x00000000000000d8-0x00000000000000df]
> > [   36.942185][   T60] CPU: 1 UID: 0 PID: 60 Comm: vmalloc_test/0 Not tainted 6.15.0-rc6-00142-g2d76e79315e4 #1 VOLUNTARY 
> > [   36.942185][   T60] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [   36.942185][   T60] RIP: 0010:down_read_trylock+0xa7/0x2b9
> > [   36.942185][   T60] Code: b0 ef 25 91 e8 57 16 40 00 83 3d 9c e6 a7 09 00 0f 85 2c 01 00 00 48 8d 6b 68 b8 ff ff 37 00 48 89 ea 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74 08 48 89 ef e8 3c 16 40 00 48 3b 5b 68 0f 84 00 01
> > [   36.942185][   T60] RSP: 0000:ffff88814657f848 EFLAGS: 00010206
> > [   36.942185][   T60] RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 1ffffffff224bdf6
> > [   36.942185][   T60] RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
> > [   36.942185][   T60] RBP: 00000000000000d8 R08: 0000000000000000 R09: 0000000000000000
> > [   36.942185][   T60] R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff11028caff0a
> > [   36.942185][   T60] R13: ffff88814657fa30 R14: dffffc0000000000 R15: 0000000000000000
> > [   36.942185][   T60] FS:  0000000000000000(0000) GS:ffff88841c1f0000(0000) knlGS:0000000000000000
> > [   36.942185][   T60] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   36.942185][   T60] CR2: 0000000000000000 CR3: 00000001636e0000 CR4: 00000000000406b0
> > [   36.942185][   T60] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [   36.942185][   T60] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [   36.942185][   T60] Call Trace:
> > [   36.942185][   T60]  <TASK>
> > [   36.942185][   T60]  ? clear_nonspinnable+0x32/0x32
> > [   36.942185][   T60]  ? vprintk_emit+0x165/0x194
> > [   36.942185][   T60]  codetag_trylock_module_list+0xd/0x19
> > [   36.942185][   T60]  alloc_tag_top_users+0x95/0x216
> > [   36.942185][   T60]  ? _printk+0xad/0xdf
> > [   36.942185][   T60]  ? reserve_module_tags+0x308/0x308
> > [   36.942185][   T60]  __show_mem+0x167/0x54b
> > [   36.942185][   T60]  ? _printk+0xad/0xdf
> > [   36.942185][   T60]  ? printk_get_console_flush_type+0x272/0x272
> > [   36.942185][   T60]  ? show_free_areas+0x115d/0x115d
> > [   36.942185][   T60]  ? tracer_hardirqs_on+0x1b/0x28d
> > [   36.942185][   T60]  ? dump_stack_lvl+0x91/0xd6
> > [   36.942185][   T60]  ? warn_alloc+0x251/0x291
> > [   36.942185][   T60]  warn_alloc+0x251/0x291
> > [   36.942185][   T60]  ? has_managed_dma+0x37/0x37
> > [   36.942185][   T60]  ? __get_vm_area_node+0x33a/0x3c0
> > [   36.942185][   T60]  __vmalloc_node_range_noprof+0x170/0x306
> > [   36.942185][   T60]  ? __vmalloc_area_node+0x460/0x460
> > [   36.942185][   T60]  ? test_func+0x2ae/0x469
> > [   36.942185][   T60]  __vmalloc_node_noprof+0xb8/0xd9
> > [   36.942185][   T60]  ? test_func+0x2ae/0x469
> > [   36.942185][   T60]  align_shift_alloc_test+0xa8/0x165
> > [   36.942185][   T60]  test_func+0x2ae/0x469
> > [   36.942185][   T60]  ? pcpu_alloc_test+0x31b/0x31b
> > [   36.942185][   T60]  ? __kthread_parkme+0xcb/0x1a3
> > [   36.942185][   T60]  ? pcpu_alloc_test+0x31b/0x31b
> > [   36.942185][   T60]  kthread+0x452/0x464
> > [   36.942185][   T60]  ? kthread_is_per_cpu+0x51/0x51
> > [   36.942185][   T60]  ? _raw_spin_unlock_irq+0x23/0x35
> > [   36.942185][   T60]  ? kthread_is_per_cpu+0x51/0x51
> > [   36.942185][   T60]  ret_from_fork+0x20/0x54
> > [   36.942185][   T60]  ? kthread_is_per_cpu+0x51/0x51
> > [   36.942185][   T60]  ret_from_fork_asm+0x11/0x20
> > [   36.942185][   T60]  </TASK>
> > [   36.942185][   T60] Modules linked in:
> > [   37.000652][   T60] ---[ end trace 0000000000000000 ]---
> > [   37.001188][   T60] RIP: 0010:down_read_trylock+0xa7/0x2b9
> > [   37.001731][   T60] Code: b0 ef 25 91 e8 57 16 40 00 83 3d 9c e6 a7 09 00 0f 85 2c 01 00 00 48 8d 6b 68 b8 ff ff 37 00 48 89 ea 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74 08 48 89 ef e8 3c 16 40 00 48 3b 5b 68 0f 84 00 01
> > [   37.003488][   T60] RSP: 0000:ffff88814657f848 EFLAGS: 00010206
> > [   37.004072][   T60] RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 1ffffffff224bdf6
> > [   37.004848][   T60] RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
> > [   37.005610][   T60] RBP: 00000000000000d8 R08: 0000000000000000 R09: 0000000000000000
> > [   37.006381][   T60] R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff11028caff0a
> > [   37.007178][   T60] R13: ffff88814657fa30 R14: dffffc0000000000 R15: 0000000000000000
> > [   37.007940][   T60] FS:  0000000000000000(0000) GS:ffff88841c1f0000(0000) knlGS:0000000000000000
> > [   37.008792][   T60] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   37.009411][   T60] CR2: 0000000000000000 CR3: 00000001636e0000 CR4: 00000000000406b0
> > [   37.010175][   T60] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [   37.010950][   T60] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [   37.011716][   T60] Kernel panic - not syncing: Fatal exception
> > [   37.012397][   T60] Kernel Offset: 0x6200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20250618/202506181351.bba867dd-lkp@intel.com
> > 
> > 
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> > 
> 
> -- 
> Cheers,
> Harry / Hyeonggon

-- 
Cheers,
Harry / Hyeonggon

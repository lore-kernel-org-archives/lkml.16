Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27221898F8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 02:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648861; cv=fail; b=ObE1nr0BKqHk42pfepnfhZ0Dq1XhUrslf8cY/MtGyKG+u7Lw+Zuo7rwEYd/yrVZPidJANDyWDWoo3InEGs5gt5xJIgRAKkmu0rlQnwM4OQjcFUutb1u64Sk+AGer16cohMtsrnxisku03vf2te1Hp9NLt6mbZsVsO0lQYhTgI5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648861; c=relaxed/simple;
	bh=R64epuSGWT3Xwgjs7eDwibgfa7UnbPps8w53nPgIoMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VRkgZm43/gd5e7Sspn69ezKLBcGEB1TB42aCQLpMg+1JXtgyi9U0CE7Mbiyf6k4EM801/zv1oqwehhtxueUHQzBuwxytEWtHKx7LooryEqJ0HGC60oe/ptvt/dVb2gFCbqfer8iDjwLH1HzS04KZZnX6/2vxay3fMAx+ksN1gGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fsy0fTgG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZgLkSsid; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fsy0fTgG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZgLkSsid"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532NMr1D022086;
	Thu, 3 Apr 2025 02:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ljhL4pCc1X69ywN4+n
	QJ20FrO5u1P6jRoGtnXxcdpmE=; b=fsy0fTgGE9j02HXOQ4CbqmDE2YCUZks8as
	T0ce4N4TuScI3uwqFkTcFDllE2JPfCr88RWKjFqnu0n3X4iM+DxkPVdjR8nrThUv
	/5P/xp+UzGbLh7TwafMilxiq0iWxV8oVK0GHnjqu9xNQd+KtBY5CiNXLqwgCIX73
	nTMrKQrWkbPQDfrqMwA8787QbVgocQIeAdli+VEYqB+160XOFbhBtAtA6QDOXWx4
	0eKlYrK8zlI8r58VSZ+zpN4P4zHzYqU7sr4A6+3JuME2+LMDWEN3eTR0CM3hm1jk
	PrB0oEKwMaplG7P2o+ExgaVOUuclUOoEihIFrXElF5UZyXiSIAQA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7f0ktmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 02:54:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5330fY0Y033698;
	Thu, 3 Apr 2025 02:54:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7abnf96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 02:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdKAEE8kUIu8W1/92rWSIEwtrzuqyqt1xt+0vEk+uRrchzARGzyxTEwWydVHzLZ/QRmrbJcW3dDJWiNDRwmMYPbMa6To3R7FuwbhZuMLSwHHhYFuY1ZJQ0VoGsSvfzEHVYK/Cstnvx/poQhEkuOjed10Hxil2/0vPVB8o4UYOGlBX9MzEHPGXbwFWqJXOO0iU9XLETPi3/XDAjTvk7B0SZ8K5ocQPmNGBHTJWw9ga8x2msHzdKWDDB2W0Q/fQExIA2VJbgDmG45hZOQEa9oQ41auWCOoou0R1HelmaqyTcU2P+zXriZcHiPQY6S9ics+fImbRPQlbEeAOXQkZV2fUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljhL4pCc1X69ywN4+nQJ20FrO5u1P6jRoGtnXxcdpmE=;
 b=BKO7aKkxfsCazJLz1CV5LJBM+vy5fsLjTMvtYPCAkdNpA4sylJNQ7wI26UcclOnD0miZhQi4Bf/NFharNgt0FhfwxM5P69VvH7mN9tGbQnRMUvdN1i0meUHwJT5VT37fYVlyNyAtc10zFmzoQaLZm/hUzCegLO4GZI7Q3RD9xFIwxmUsRhVZOzPZCEU5yyX4k4b8zE2pSi+KlQ7tA7EiQSw3gWn3lfMMr4ODS72BahooDMwYAFxoDzFrigLu3osTrG55hsVOj9Rvf/rgGDs+tGvBTnYIkNVGnbqaTXG9G4AUD1I1pvjFVMMkoo4DTWMWZLjSpN+YS4Pyotx8493Wrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljhL4pCc1X69ywN4+nQJ20FrO5u1P6jRoGtnXxcdpmE=;
 b=ZgLkSsidUhMw88XLws9OesWLVpwfRUJg46JkBPoEGrS7PJ0yLQlyG20aNpkHp/5gtIuc2C9vafBxL0TWFrYyfKR4tj5VfaI9Ts0xGraok1/atBxuB//yHBKHhTgp7YbjI/QqpLuqez4izWpHg0sKC9+XkS59Q98Wxi2/RYmfdnU=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW6PR10MB7613.namprd10.prod.outlook.com (2603:10b6:303:23b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Thu, 3 Apr
 2025 02:54:05 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 02:54:05 +0000
Date: Wed, 2 Apr 2025 22:53:52 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH] test suite: Use %zu to print size_t
Message-ID: <ubvc2fxn6zl6g6kb5ndzazyjj6ds54onawxvar5j5vfu6gz2dy@k2mfcvhatoza>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20231101171629.3612299-9-Liam.Howlett@oracle.com>
 <20250403003311.359917-1-Liam.Howlett@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403003311.359917-1-Liam.Howlett@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0357.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::13) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW6PR10MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e190d1-4d88-441d-3b9d-08dd725acc1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yvBYPmHvv4P8PDLDF4tqsAV2McyENbaBA9CNJUrSyiELZ5gTeqVwNRe+swkl?=
 =?us-ascii?Q?KXWAbu0b+Qk09lAG2yt7/Xzn4LHCY18rISgVImaQgMtWoEQYV9oVSa4kIzt8?=
 =?us-ascii?Q?RvARoXCbpoJObDmx/bAFywkZlQJa088EYSvsl62kJtHq84nqc6/CrJccvAzC?=
 =?us-ascii?Q?d6zyDLYl/6EqNo7fZm4nRbITb/3lfWr3lYGkxpa0kdcAlqi6oQAOZKF0cYC/?=
 =?us-ascii?Q?ZGGPA5YFktfr0Qkum6H3YubrVwvashnM5jOWVUwF8F8lFBs75VpppEz4I6DN?=
 =?us-ascii?Q?GxWc+T6AGc3byShf8YVSZ6Reash/zNlhlkO3g8mIB1+Ra3T9SjQSlb3RdMKg?=
 =?us-ascii?Q?xaXUIAj8QvUdK+iqUaqUVZIO8nV88TdnP8wBbgcMTBFelBD+h4QsYM4GyIfT?=
 =?us-ascii?Q?LE//LQm4CAl5seffGrXgPnxYsb5HpzBYzMgbGRc3kEBpN9S5Yut8j2cbkkPs?=
 =?us-ascii?Q?wiy+rn51EeL8JXSitsaB2k0FB0+ryLvqgOh6WR/bEsYRTetaoJIYvGZyObZI?=
 =?us-ascii?Q?w/yRjSRcwVz/6fwc09sI/ZZT7A2T5o3ycLlsojHGZBNSL3InIxm4SSSta3S8?=
 =?us-ascii?Q?hV5y7Sn0qhZmAWfJkMboDkYGON0iM3VPacGnFMmLqT5phKRnD3QhyqiIjaSj?=
 =?us-ascii?Q?/Wk/R0P+ge4DI+kIfXURPQjZu3m6qdyADkgxc50Lo9JpNfOx4AwVRFXoymgX?=
 =?us-ascii?Q?Urm8E/KYoeKkStn5y7vlR0RMg0ZmZ2DnsyPFmQxXh7ClgiJ2uFuH77cBDjEf?=
 =?us-ascii?Q?N8BrVq/Sbc0L9I6+B5yhHW98EzXNA0aRzdfqqpAyBOVKnvXBYYvFkXGZEj7T?=
 =?us-ascii?Q?nuKy63nrt15Ifp1s380T89cZ5ztTsE0AiMxrSAwg+bvA/CF07bcWCyJhDetk?=
 =?us-ascii?Q?Z6h2nnv7TmvgEtMieZI0lUzLa+Tis1Upk/L/XTx0AEM1Y2s8uTubiNfSCdvu?=
 =?us-ascii?Q?GalZ7om7t3RoxIJpy80aLa90EuGazN0xGNCS0ANNMndEodMXkXKLxdZIMBHh?=
 =?us-ascii?Q?Rkrg7RNTVD6HfboXZegfeZv0j6kkj9hf8xmnEQxe+c47GSYoUvXmXmou2imG?=
 =?us-ascii?Q?y4JftAeNmvOtZp4S/bGFjxESjPq4tmMe6Ubli5+LOm0L7Ic+hnoGNUJBnWjB?=
 =?us-ascii?Q?f9b+PHg+PDDPnmLun8xRAR9JUpEROvFcs1X9LGOFFxxCvmT6mARPLLY1laQ0?=
 =?us-ascii?Q?ZMK6Sc3HrOon8a/tetlAutK1vp6hIohhO2g2AaLO4dWm1Z+oXkWJ/Z5JENNO?=
 =?us-ascii?Q?nD+crpeq7ERWjFZzrhrZ39q09Kr0Fl3XWNYS8hCqMHk8VaKvWvBGChsxRi8t?=
 =?us-ascii?Q?Osy44zcUN0wXcNeqGxvItQFmn34HWVXb4SVgvxrAZXJpelrZJaPhmNnKyvhb?=
 =?us-ascii?Q?SeNfBVD3c5OZe58pKpkiwpZXY8/F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x1rrbY4Y/E8cImMFT4+upZFcSZuLGQW9fRaxONgr+9uosKmfGhpGhh61ikPE?=
 =?us-ascii?Q?MZk6uQYT9O22ySB1oiDsb26RszCCErTVKTxVJAMdYG+jDJx+IMlwkUl4B7Sc?=
 =?us-ascii?Q?FAOEeAI740ni8o3KAIQdGjcAY0MKBF5gOoIekMgre3+eWBeRMTXFBnAlil9V?=
 =?us-ascii?Q?0lmZCwZ94go9ZOJ3icB47cSR1bAoTLYp/ZB2dwYpn/iy4WxOnFpELyuPd45w?=
 =?us-ascii?Q?22Bp3Nz0dd9qk4X6WaqoWsOkcOBdwQTvycDDYXip64uY5uvI7oRu2uSOWG3/?=
 =?us-ascii?Q?kQP0Ic5c4W/9L1lGKk6n7e4geKmOOYZVNaTMiMB3Q3QLcGt9iV6N1pMp6fwA?=
 =?us-ascii?Q?QgUNvZqJQ//Z9VUs+vHtAojjXQHUfsX1MmgcT/VfsbRA2ygJ++1rntf8FETb?=
 =?us-ascii?Q?4lk1DlmQ0GBviCMhMKfpG1LOmJVSzMqi+ALprLedfM9/utuG7xlOYj3uTLtX?=
 =?us-ascii?Q?Ohy9FsvuQQk1AM0B81PcY+YwQvRmcqfbJ44sK6pNe1Gbo5tRvJoyXckkvy4N?=
 =?us-ascii?Q?Kju1qIyWx32z/D10G5F71sRTDTuCvB1lKWD/jGU70jcSmaCCQEoVepzPVitY?=
 =?us-ascii?Q?pOJx7q/KxDkl1tTeGkOnb33lFq5hF/sjR3QBoJC8dgRkM07vjeYb/TaN1lMT?=
 =?us-ascii?Q?KyRnnRm8YpqG0Q1i96gFA4x+xje/l2XbkZMP1pS2yp/vkHtXBB2lKN97SqWS?=
 =?us-ascii?Q?8lWX2lGAFE5McbaeisnEqABZ9DA3i0VzHpf1/RorFIRLVJxGJSKHRjpCygGP?=
 =?us-ascii?Q?qSYNvwU9pRyhJo1vxz+fJB8i9rv/WUHJuFGDctz7vSTfXouFZRGvB3liI1yJ?=
 =?us-ascii?Q?Vh1p/GvG3XVMuPXQpoeg05KYiCfjKQp3air3eKsFtJ+4fMEbUSJOH4Oy4VhS?=
 =?us-ascii?Q?ft8fkKwdb0HWCN9yJRsDhGzGPH3nmKzE+KaAAHpu0I2cLTZ7L/CYdpd6YD/u?=
 =?us-ascii?Q?tp3I8YIazFFZIooLy2nDqfI6fjq6JAG4GeO29Gi95pwnHDDIgRKiDJD33gPm?=
 =?us-ascii?Q?utYXEHzWtt4GKR4ylTI/opFAeFGWhM2CFuxJI8W38luE3NnqIMIfEj95TML8?=
 =?us-ascii?Q?QYNtwOx+KDCki5jE7GQDjlcj4cgi6IMqpwYCtxDNXDlHdWrG+F48/lqE6TtK?=
 =?us-ascii?Q?nthlZ/1TLcJ7YHLjp3TllmT9cLFBsBtq3VWiMTDNAjgik3SYmW71vmeLBUgU?=
 =?us-ascii?Q?nD9OaghRkB83K9gV+wI1BTXFoxyYj4l2zfOyouImM7K9akmp3IyGDika8L+4?=
 =?us-ascii?Q?SaFf4DyLGV8a3N+JT3zzyAieNVH6N9n6+RyH90mdJQWhCBRO8/OqNbHU2v6U?=
 =?us-ascii?Q?T3jwj/33nOESFnG8rA3XNQswehVu1KHRALG7HT2GGTn4ylgL6VViyK5lv19A?=
 =?us-ascii?Q?JSDPw8iAVacMhAW2S/2cBf3sNMSIVolD/gvla4gMO1hBmtsUAhbh3HzlFwni?=
 =?us-ascii?Q?Nz9Q3J/Jy2u4z6YQ7dFc8KJYePIkt4M4zOBEk4zJZM4E9VUjYuRFhVyv80kF?=
 =?us-ascii?Q?tSEvPzO3hMPhqFsrlCvAUn8AwpRUcYKhxLXdM4h7tEJm+W9NhxhrIV5eZ1wQ?=
 =?us-ascii?Q?CWNwTpipc0Xdx1GgSC2Uj7YdoOWGRkJdnFpJM17G?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wisOa90Z74ZDusXWBq6GzqG3QxvbeD/pWgJ/SLGdrlUAfpYX1nEXgEd4aiXprVD9QI2Cs+W3JgWKTx/mght85iFxpuJNcHZqV6CydayK5dzcL/tqNoSLYJU36VccQw9Hou2x3TcL3MiSS3yK9vkZS5/VhZfX6arSg5YGJYsEnITnbSi/jV2y60yPzdck7lX9/HeQ2HVK7sD4G7KFZHY3A2TLOol7K9sU8jsim3W8o+64ajuXdBgS8Wu9JrfuYU1Qy0p8euN38toCIngVcurRv+R18diBb6FgcLS6HTQviZBQtu4SxZVGirXyYJcwSSCI4GbH9nolGo+3lHLiG4MCj46jmxYKMSPBofsyTtHLhM/dM97vY8R8rGHzTN0K1TVm1+xkJ0JgoAdpG1m1i32XyB56isvZNnxEGTiy1NWTjAlJ32EdfKb5Sbgl+GvfOwuabteKOt7g7wBCDCM68SFxDGrjx6Jb5WRq+bsvrpF0RhNLaSpqfb9HfHg/84Tk+/fiS6ZxIEXMJsBUCYYhp/s4FzLTEt8D7AcpnPzl7glYwjsBbvKU/n25t1hgEUyU2OmQpDd9aKJXO24Kh7upI4JM0GzqPbm8rcy6+D1XG1w0LyA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e190d1-4d88-441d-3b9d-08dd725acc1a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 02:54:05.5997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61swvG1l6YmogDT9B5Wvgbus/9zO2DnfP51TncS1OBiGnObaYvQFavc9dM63qCPOxQrgo2Wbbb5HmymtPQIW4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7613
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_01,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504030013
X-Proofpoint-ORIG-GUID: SAydfYQfA9_tDSyqHc95jehJ7_uurY_f
X-Proofpoint-GUID: SAydfYQfA9_tDSyqHc95jehJ7_uurY_f

* Liam R. Howlett <Liam.Howlett@oracle.com> [250402 20:33]:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> On 32-bit, we can't use %lu to print a size_t variable and gcc warns us
> about it.  Shame it doesn't warn about it on 64-bit.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Fixes: cc86e0c2f306 (radix tree test suite: add support for slab bulk APIs)
> Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> ---
> 
> Note that this requires the patch to fix the headers [1] for the testing
> to build.  Unfortunately, that has not landed, but the patches do not
> conflict so we should push this upstream anyways.
> 
> [1].  https://lore.kernel.org/all/20250321-fix-radix-tree-build-v1-1-838a1e6540e2@samsung.com/

Sorry, This should not have been 'in-reply-to' the previous older patch
set.  Let me know if you want me to resend.

Thanks,
Liam

> 
>  tools/testing/shared/linux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/shared/linux.c b/tools/testing/shared/linux.c
> index 66dbb362385f3..0f97fb0d19e19 100644
> --- a/tools/testing/shared/linux.c
> +++ b/tools/testing/shared/linux.c
> @@ -150,7 +150,7 @@ void kmem_cache_free(struct kmem_cache *cachep, void *objp)
>  void kmem_cache_free_bulk(struct kmem_cache *cachep, size_t size, void **list)
>  {
>  	if (kmalloc_verbose)
> -		pr_debug("Bulk free %p[0-%lu]\n", list, size - 1);
> +		pr_debug("Bulk free %p[0-%zu]\n", list, size - 1);
>  
>  	pthread_mutex_lock(&cachep->lock);
>  	for (int i = 0; i < size; i++)
> @@ -168,7 +168,7 @@ int kmem_cache_alloc_bulk(struct kmem_cache *cachep, gfp_t gfp, size_t size,
>  	size_t i;
>  
>  	if (kmalloc_verbose)
> -		pr_debug("Bulk alloc %lu\n", size);
> +		pr_debug("Bulk alloc %zu\n", size);
>  
>  	pthread_mutex_lock(&cachep->lock);
>  	if (cachep->nr_objs >= size) {
> -- 
> 2.43.0
> 

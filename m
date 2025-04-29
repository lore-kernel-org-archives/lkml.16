Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B181978F40
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934807; cv=fail; b=XqnJJyUCwVt+tses5kURvzsW+zWY0EwWw6m64d7lPn++JoJIy4xtrRdS8K/K/X7C4it5Ybrt+emm2jmHd6NW0YA4JXvnc/+Dk5fe7hPPeFGZt38ooEtM5+7pDjtI8xpaCUyFExAh1eWEFQSaMwwffNJBVe9l0IeVhYAw85poKLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934807; c=relaxed/simple;
	bh=d8UUdxyCN8ihlyKwq4Vlj2m5gmhXjzFgRcpQGIzlx+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o7W0LS/vY8yH1UTm3pG0zBkRv6xaX07NXN9b4XQpjRl4zu0th1m9ABn5HfleMoBmXiAEKzhzHzjoNOE02bbBSf+y1B8gRDiGQi57P098Cv1RpDcqP25jKcBy2hQVtKlYr9XMvlIhGMi6nfxXqZig5XwWbBaeHdm7KteBHIvYMwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B+QrvxqG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LbqbzvMz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B+QrvxqG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LbqbzvMz"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TCM5Aw032131;
	Tue, 29 Apr 2025 13:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ZYCB/bLUmEmNdHwJy3
	vGLZF4lV2pB9Dsy7uIFIhKlsk=; b=B+QrvxqGh/bRLTTgcHLnA2U/tYMOUyXvSC
	SU609mL+WqLnXUIOyyX0m4XEokzIKoe0k519VhP+J17n+U5HzF9liM/MXvaP+iGd
	R0K6FMx8iv+d4YZxCRFUfSMT+iSryidh21s3Q8JMOhCDC3Px/RIK1zYf/PDoc9Kh
	zFDrUMsyo43Cty8hlFrDUwWyZMMR33VD6QJwwNnCZqDufVHdCR18sz0VGBv2bZcM
	bpxZYbhay66vtdl5pfJ31MdcNb80E8xdn1qADyWE8I/CY9fVF3g0dQaHJMahYM5z
	76OzVvt0Tf2sh3pWh6FmjOb+4YJHNLBZlwiNNViKcvVOw44S8eOw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46axq607as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:52:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53TCp6Ar033555;
	Tue, 29 Apr 2025 13:52:48 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010007.outbound.protection.outlook.com [40.93.13.7])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nx9w2j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAV4A0E33eEvr3wNwffDAQZfZ+yHV9ah2RyIMKlqsV52I/dzcRe3+muLfWBuFOMC6/oqK9vAToWmakTl3Pk0xIVdlqq+PgO4RAVfw8Ktv3BBzAhAKStQt18xd57l8qSk7x7d3teNjehbxDQO+9OVTO7A7LPf0HCfn2u9tco2ykFFn9SqoCQ6LsPnURqNPqhp14J9I21NMS6sDaK4h1BTO3QO6fbmz2KX6qjPWr4vfIss0cigQLc4ghVWOWntN0D7BHgogrjIgr3woz/4QJwmrPULtArjtBDqfoUvYBM/nQL/QTCP2erJF81cEUYcnhJUFfyr0bY6rIfaWvqV8Hug3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYCB/bLUmEmNdHwJy3vGLZF4lV2pB9Dsy7uIFIhKlsk=;
 b=Ls2e9HS3zexcjPkrls2xeWGFysq+YXHq4/vhOkA9UePJhv6barSheP/acsUTmNbs6KQ6Zgndc7lkCbHLCxifpixJRcuJNfoSwFYYY2LxGmZuM1NtywgsXCuktQeF2SVyQwsNW+fB0y7Pyf2my/xwVmIU6giIpH/aANgVmyP/yNbvWLj3OIN/VGbhB1fycESfihdP3xaTFPM51sIpOQmHEevLFN9/CcsT8MkNH+x4vkn/lTaitxFeveZL7leH3m84lTNE/OP3tTDF3ed2M68Svuh7sh0pY0LUqsl7QbI2zBhiZ8yiStKje1Q+YzRzml3Ud97yCAKQXJBxt7sg8QEHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYCB/bLUmEmNdHwJy3vGLZF4lV2pB9Dsy7uIFIhKlsk=;
 b=LbqbzvMzImEQv0g3XJrB4L27hEe8VCoXRPi8tslhXfW8oqvIoMs8KgD9bbSMNLD6mjSiR1BpiGmvInRNmMsJNnoPH7ZvofDcDpWHQTwX9zLpLWH1NJjPvra15k5CLNtj+jVuOf7CRB3KD5pU93Cs9beOkZxRnseQ8l1JzqB0ZTo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPF2023FE2F7.namprd10.prod.outlook.com (2603:10b6:f:fc00::c12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 13:52:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 13:52:43 +0000
Date: Tue, 29 Apr 2025 14:52:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, namit@vmware.com,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429052336.18912-4-dev.jain@arm.com>
X-ClientProxiedBy: LO6P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPF2023FE2F7:EE_
X-MS-Office365-Filtering-Correlation-Id: b1317edf-cebd-4795-dda9-08dd87251db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KvF3POaQ4qixUzc+uLYHD2NSDzL/kZbF70v3S6chR/t7QhlQxUqlC+dgB/oz?=
 =?us-ascii?Q?ke169IY0MgOGjGD83wCQkSKv8jxi3T6P3fFbSEIVjKyiJMRYZ4QSs8srP/iu?=
 =?us-ascii?Q?bpZmKO/0kZ9J7EDj/C0r1GLneBhdAkJj5zY5ibBy6Uks1rWYxG718Hng2e73?=
 =?us-ascii?Q?cR1XiG0sxotua/HwXBIhd/KhXWEFXNRmuoZD0kEBjzNQ9JsHtrAPL8lQb3XO?=
 =?us-ascii?Q?19/LBumwGoIzA/R+8jVBKED/PUbXbfEsbQplmYY5oSuO7u66+7YDvhsiU77d?=
 =?us-ascii?Q?z/biHuzOqvbkiLaw1Me72zl4EQD8JMaMW4UdQ6KFH79qoAi2W8xKxZT26Q/6?=
 =?us-ascii?Q?s4864BW7l7Xkvw4YhzHl5Ndu2kbtAULBYUYkt05+6UcBegf9AgpR9Wr6Q+/4?=
 =?us-ascii?Q?D9YFNnQibV9fHXR4PPEiQ9yEYjAhTVTxbF4O2ZlYL7u27sPMUCmxPTcxzc7I?=
 =?us-ascii?Q?Zytnshyx3g/b00g0WcPk+5RH3NhOV7CoI0BX3mxq+F5LfC7TGPNmRQ2dQxZM?=
 =?us-ascii?Q?4tmzleeyxebW8T1pimL1cY1QA/RbSo0VOTtHzlOko535sbkxff095nn9UT/o?=
 =?us-ascii?Q?hkxrUo6A4Vg6AUVAj7Is/JBdbLPhu2dpYMZmLdzDGYITNN2cL6XLw31blcYP?=
 =?us-ascii?Q?dBrWaHFcq6JOll/kuDhTd02zFwPGtF4bisJoWbDiiO8ytYKhRPEAjBfIECJB?=
 =?us-ascii?Q?hla457H+or4P+BexF3QZOYYkRYna0GSxnYhfl0ed++zcI3RzGOV4FwZ79r35?=
 =?us-ascii?Q?G3kDNjWkktW4aZcC340JSgeQvCKnRingUDoxM6qeE34wma3m4f6jDbtz/zzC?=
 =?us-ascii?Q?1Q8ldpaNqFIt4E/i68arfu5PLXmzD44U2noWg5lDzqTVva/y3QY0QE9D55kZ?=
 =?us-ascii?Q?AooDfM5XsksvMkNqMk3jyYAWbBOvpPjzuO8PrmHzxv0g0eHsc7sT69C3ZZT5?=
 =?us-ascii?Q?znmeit/71dgdOX/Mh/Rss8qtVqv1ytXcC4DV0Ztmbxu2cYWo4M84PzoQs8NN?=
 =?us-ascii?Q?Ni10Zo2iC26ChBGjV/VLv0JYQH/k1yKLFIiQumrQY5zeuL5U/M5WlgnkHZQn?=
 =?us-ascii?Q?cnECk5hLoyVgPJ6A3+XOr5k4U8OqQm2IkXRFGpKf4tPcDhmwARu7QG76YzVS?=
 =?us-ascii?Q?8RwLGiPp0D+xDD+Z6czd+3ASNsUjrGIAL2+4KAzdkq9lekrbOL/SUsaDjld8?=
 =?us-ascii?Q?3htKOF3JrMAi76r09ooh8JY8Ig7ZnE/9W/M/srSmXBtAlyjU5u3ZBGgqyICp?=
 =?us-ascii?Q?W8X5R/tgikHH1t0vtXHKt3gM1PhnkUTu/kC/rIsdARf8ONRY5av0CByomsi5?=
 =?us-ascii?Q?vp3nNNBhudBEC2WDBlqbFK3GX7tAgux/WzEcMlYT1hpkhA12yYBgbBkLPqz+?=
 =?us-ascii?Q?TbJxFu7bi7YtbXs/0T23eMWg1SuU2OyYPJ5B4TYOdJw/LUEpeXC9x8qsowTC?=
 =?us-ascii?Q?dqf9RDCbtPE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pR+akyBbHTr+KmpYXdaykz1TGEIe5Y3ilm6OZN8D0F6MqCGFmVtLFjLu5Ws3?=
 =?us-ascii?Q?kORCTgUJ3J9ijDE0hubKLfu4CGyePlhKiwc3885oO8ytssYsyzCCZAxZ6IU7?=
 =?us-ascii?Q?PSkBqZWvdUzO9bDBWTGeo3TG8NmtIks7ldp0Yc3is5QtPxVYeecwB5zNt9Lz?=
 =?us-ascii?Q?AU2/ljpOq6yazcRf8JsSgwN/bjMoXThrId2gw3xjeGRV3cqOEYu4bZNbK1jF?=
 =?us-ascii?Q?tPG3Nm5ucfNGBTdh5yW/EyhxRCzBarPB6o23ToZh2U95yUqP1dGAW3RtZBN+?=
 =?us-ascii?Q?h0O0FzognsCj5s/rweEWX4ORjlvTF7vxXbhgeujtVNzjBzPTF48JoA+YHGpC?=
 =?us-ascii?Q?0uJAeGkZFNxiU7fbkKWUhvUBxbgy0ZnRm4ag2LQDSZyneGAOheeEgU9CDRF6?=
 =?us-ascii?Q?kjglTQHn5Udj2Z24tI1GCzKYxF1LKcsyqV80MMLWekkooGahaLLQD+Peorp2?=
 =?us-ascii?Q?EsRu9bPEOTQK5vi95Z8oYpv16uQ9L8Xakh499Rmgd2gh7EbH9cjd+5tmb9S8?=
 =?us-ascii?Q?q+DW+Yjak+B1ARG15l8C0gIJezSfaeoAcQkZGEpuKLzrAgAMK9lZbD8psHFl?=
 =?us-ascii?Q?2YlJVyvU412Gaoa+6RVp0c8l/IW85W4jisCvXjahJM6EiWopC/02vL+w2DF4?=
 =?us-ascii?Q?eGEdjOQavGaSPdnbWqjD0rDwjuW1yYdjqOX/Q2/+4xMd59LlCvSFimWxZJM7?=
 =?us-ascii?Q?gmX34Nq+efO45sm+SEfyhDzXdgutcz83+mFLRWpFUpL46fo3B4LpgLUxD+vh?=
 =?us-ascii?Q?wGh+T3RfJxRBWPhZpyNDW2usrU9pJmrvs3G24fdd9NFOE0lSk5AM1QLEYKZW?=
 =?us-ascii?Q?WJ2eM4sSMjsfCDujHWDMZcmFn55ziGgs7Oa6a1CR12F9Bn+pMVUaFfflWAf0?=
 =?us-ascii?Q?DHAk9b3k9k9bBtUbhwtSX2qViWL5IjT5aHlA0MmdGKwJvXrtA/rhbBumhC5X?=
 =?us-ascii?Q?2SUUNdzLGbdGZIrfvvkBOYS0i8YIq7Lm4JTvQRTqaeyZXV1ZhPLTMXTFHdcM?=
 =?us-ascii?Q?OQqlIBwTHn87uAeBsKTy+vZN2ZYQqCa+CiE4SPQR+SHrGTUY84xXL27bedc6?=
 =?us-ascii?Q?U1Fc1v/0fjgcyu2+rnX2WdEs2sP/qPFgNTOgJb72n01+PUDLBB7nMyb1CINW?=
 =?us-ascii?Q?ozb0aR8KVTnKZRiokkr2+4ldMaJ8Rnl3j7piCpIsWbV8BahkYdZv7753UnSy?=
 =?us-ascii?Q?ckoNnWARh+s6/Soo1h5FM1biVd3g3xWi/GUJybKScvBGash99r5AmCPrufVs?=
 =?us-ascii?Q?JYlIQvpqqXpztxZhyuqIPnA1hD2rRCxuJFNvSXcBUhco0YZprqqSyhi7GlY3?=
 =?us-ascii?Q?Tg72QSbB592t4yGTJw3HiUk8x0JyvIwxyIEfalRj7JocLxMVj0CikssBlBTK?=
 =?us-ascii?Q?uE5HAJQ+uZz1jwu6ppwJMpxwt6zrRBCsD+Aksz9go+iAzuIfghEsMCg9PB1V?=
 =?us-ascii?Q?erAzRvS1Z7YgtV1jXCAip6muIa9+Hn1GHosFgxymdmUG7h/gU46IEiQ+/HDI?=
 =?us-ascii?Q?eYRl+BOK5WvDb5Dxomqz3EszlMA2nc8ndiR8lo8t108ZvHZM+TWRtbl9XPnQ?=
 =?us-ascii?Q?fmiQGWqVp/ODT+pC2/kX0t8UCdMDgMn7lNSTAC0jYxnjH+Myb7lQU8SZIfBk?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sC+0ea05/uNROfrG30dFtzyYqt4Qt1ZvqRsRaMu1Vu0Ms7m4lWbC+SNAI+SFF2wzsvr7BwD4ZGeXuH6CS2/Ydsr/qBLyByhIkJEtRT7tHbiAG+lXzz9VNd2DZH15TwBHppgvJHXgRWBON9zAL7uSj/CP3nOgLBbb/iy0nlexaCDgF3/ycu3unmQxNGOcmikGnssMwCw8F5H9NFMRMLbCnY4bUn3CCXRg3q9MVzSBLXH7tNXLyTRdzp3g3SfAcUlmu+FmwfZzhjVxTiRzFfdGTETy1JeOSg7IR00T6O6OV6iV9uZjFbI/Vr2TD/kWxLq2REtV4fl1HEy5tHkwaOX+fVmRZFdTRdf9LsaAAlElmOBPC1lmxTcAvdZQDd09lS6Wlpq1cf0xYpaAmS8qdA0FDh9+VYYC2IxGNlT6DHQ7PG3BXptQUqHar8sGLf44F4QXRjzfrQ/4GyqpHKMfZIipYx+tXPfh7PYHwIb8fSuYCAN8XdSR+/eB8q09NI0AHjuvTXktaceX0SGLPxjMVNsiBvP6KFwUsPH2Ri68Ibj7K7Rnw8G0mUrZ1iWAg7Z3GUBg0CBPZ5pcdDsnlfJrcFaYMOH8RU1UeH6Ml/r+jsqf9Zg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1317edf-cebd-4795-dda9-08dd87251db6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 13:52:43.9318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vl0QHll8PbyDmI5lyX4UY3cEIu+lL/+Z0hDKbNd/K3Aqjb7hPWMm6MboNPR3bLSTLvnqyHslWWaoR1sOqlkPocDWGNmbnF3PmVf4UWm1EE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2023FE2F7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290103
X-Proofpoint-GUID: s4fCx9Gp6OCAjkRV6Z6WEgM9RRVMAkCW
X-Authority-Analysis: v=2.4 cv=GYgXnRXL c=1 sm=1 tr=0 ts=6810d9b1 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=aA_IuzxnduqX0w3ZzwYA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwNCBTYWx0ZWRfX/g76wgpHmmTS eMWb8RWVOpfA5JQAtqpzoYY6FOv0TefC+uNLk0rb+E6CeeWE3tktLK/qmkn2H9Tr2PS+R5lPu2H ZSZoQIrglGCcIzYoLXlZYznU+CwYEWKS/nOOUIvDImejYJEWcBK3bqRDBsYvCadgUQShgaYx/1M
 rYfNmXbWG+3nk+8HzStYlSXcpNCY9g5YRm08eq2p3FeOiNsZBvPlfDk06hQ+Fbq6VXzEVqj6oHP bOBGiFBb2j3uVaDCnIc7nmjVbshz8clIP9faJogLVdUJKql+elRnqFg18gX6AJDfWx6vGZ5kLNZ N9OMxlzIOPfft7qitNdu+PdY7cAW4Vi8v08plmzPf6ZbMSzd5KgtxD4xwKzbooDFOYBPLhQEBzh vic4emua
X-Proofpoint-ORIG-GUID: s4fCx9Gp6OCAjkRV6Z6WEgM9RRVMAkCW

On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> Architecture can override these helpers.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..ed287289335f 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>  }
>  #endif
>
> +/* See the comment for ptep_modify_prot_start */

I feel like you really should add a little more here, perhaps point out
that it's batched etc.

> +#ifndef modify_prot_start_ptes
> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t *ptep, unsigned int nr)

This name is a bit confusing, it's not any ptes, it's those pte entries
belonging to a large folio capped to the PTE table right that you are
batching right?

Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
the name?

We definitely need to mention in comment or name or _somewhere_ the intent
and motivation for this.

> +{
> +	pte_t pte, tmp_pte;
> +

are we not validating what 'nr' is? Even with debug asserts? I'm not sure I
love this interface, where you require the user to know the number of
remaining PTE entries in a PTE table.

> +	pte = ptep_modify_prot_start(vma, addr, ptep);
> +	while (--nr) {

This loop is a bit horrible. It seems needlessly confusing and you're in
_dire_ need of comments to explain what's going on.

So my understanding is, you have the user figure out:

nr = min(nr_pte_entries_in_pte, nr_pgs_in_folio)

Then, you want to return the pte entry belonging to the start of the large
folio batch, but you want to adjust that pte value to propagate dirty and
young page table flags if any page table entries within the range contain
those page table flags, having called ptep_modify_prot_start() on all of
them?

This is quite a bit to a. put in a header like this and b. not
comment/explain.

So maybe something like:

pte = ptep_modify_prot_start(vma, addr, ptep);

/* Iterate through large folio tail PTEs. */
for (pg = 1; pg < nr; pg++) {
	pte_t inner_pte;

	ptep++;
	addr += PAGE_SIZE;

	inner_pte = ptep_modify_prot_start(vma, addr, ptep);

	/* We must propagate A/D state from tail PTEs. */
	if (pte_dirty(inner_pte))
		pte = pte_mkdirty(pte);
	if (pte_young(inner_pte))
		pte = pte_mkyoung(pte);
}

Would work better?



> +		ptep++;
> +		addr += PAGE_SIZE;
> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);



> +		if (pte_dirty(tmp_pte))
> +			pte = pte_mkdirty(pte);
> +		if (pte_young(tmp_pte))
> +			pte = pte_mkyoung(pte);

Why are you propagating these?

> +	}
> +	return pte;
> +}
> +#endif
> +
> +/* See the comment for ptep_modify_prot_commit */

Same comments as above, needs more meat on the bones!

> +#ifndef modify_prot_commit_ptes
> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,

Again need to reference large folio, batched or something relevant here,
'ptes' is super vague.

> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)

Nit, but you put 'p' suffix on ptep but not on 'old_pte'?

I'm even more concerned about the 'nr' API here now.

So this is now a user-calculated:

min3(large_folio_pages, number of pte entries left in ptep,
	number of pte entries left in old_pte)

It really feels like something that should be calculated here, or at least
be broken out more clearly.

You definitely _at the very least_ need to document it in a comment.

> +{
> +	for (;;) {
> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> +		if (--nr == 0)
> +			break;

Why are you doing an infinite loop here with a break like this? Again feels
needlessly confusing.

I think it's ok to duplicate this single line for the sake of clarity,
also.

Which gives us:

unsigned long pg;

ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
for (pg = 1; pg < nr; pg++) {
	ptep++;
	addr += PAGE_SIZE;
	old_pte = pte_next_pfn(old_pte);
	pte = pte_next_pfn(pte);

	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
}

There are alternative approaches, but I think doing an infinite loop that
breaks and especially the confusing 'if (--foo) break;' stuff is much
harder to parse than a super simple ranged loop.

> +		ptep++;
> +		addr += PAGE_SIZE;
> +		old_pte = pte_next_pfn(old_pte);
> +		pte = pte_next_pfn(pte);
> +	}
> +}
> +#endif
> +
>  /*
>   * On some architectures hardware does not set page access bit when accessing
>   * memory page, it is responsibility of software setting this bit. It brings
> --
> 2.30.2
>

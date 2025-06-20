Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FBA20C461
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750396923; cv=fail; b=A0Zrt9isEylms3Mb7Rl6JlFA/89JiSkG290JLJ7s/93vjeJ2fXsXI5jfKrShsaiDfsb1hh4ChO/DSXEqiHrrUAUaaHt1qznUrv+GnEGi5EdnBI7K6WihT7P7yrCDGadPVafnwBLr6151v6Dq1m05APyt+Qn2UFQ/FdQjDiLec0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750396923; c=relaxed/simple;
	bh=lXvoWjpv9T859nvHcfJ3ipQHTBRg5Y0F6fab/+Sc9dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AoXQnsaPgiEPC4yLF5wfJv88mVQc67JeW0IkUJGwizdvE5Z4LU7N0Ew95xLXXl5N9HqD61vS6K+8Q0iLEvS8atDkSHHJfX0LI6e+DYcjL0CsfGWvOclgH+2SI0vTFtpti6UhHZVUvuBCzWKlJBpq6HFdwI6JjuKyBeOTbFCEwBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MtHrZ9Ki; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YuPpTAZT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MtHrZ9Ki";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YuPpTAZT"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K2u9w6018425;
	Fri, 20 Jun 2025 05:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=IF7e/D/y6H6aGtlPqq
	wRHZmq0F6LJFQ44szyV5CTZgg=; b=MtHrZ9KiYFw1rCsc97OC+SQ35ct2ItS7qr
	er0W5YrF46/iPD4GazkaQnveHU5EepsEqSk4G8Wz5sFBZGG5zvELhIDeyl7EBJjt
	oEjhGTR+iU29zlEGllbOFmlmCn1W7Zrt6bclYtCjIohHoLgyMrpyZJXnCBsqOwsj
	xhqaDqe3z13VE2xb2u4L0np1orCfuZSqUWVyWPgjQvhu5M+CfjetV4mbpDkLJYx1
	FpFr9Ry0T+3rORtZiw8IPcIKXnCywF4koeBu5NX6wErlfJ9cRB2XyTadF6cLstyC
	ssYUfNnVeCrGSMPBy62pkqex/KXCAOzs1cPUc7N1WcQKAXa3+zig==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvnac2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:21:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4h6TT018490;
	Fri, 20 Jun 2025 05:21:43 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010044.outbound.protection.outlook.com [52.101.85.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhchu73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 05:21:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSbdEikHD1O7n4gqNWedW5nzHxMo2ahvgnQLJ0NDey5TAj3XpchbSt+tcFVOKVyizbuDzqRslm7TStm5dNz9OVR9VHugkrAevqJQmaDnVHLjLvPE2wxFqkRpUEvgz3ayhupvhTXTQ3yruu9aGU/JNQdTOryT0plelPQNZe2bVkECcl8VNY4SVZBb1yWtyNw8Zl6jG956SeJ1WlvBCi91nsmGDz6KyT6Of9anvcU5apsvPFUiUwjkngPyA5ujVrg6924Na9+5j0qIRqoVM4+7OFmmvzrMX2djTJoODnu86Fyv9dbReP4nJfbDk1qBizipIQ/3zzsDva4suvJ4rtKGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF7e/D/y6H6aGtlPqqwRHZmq0F6LJFQ44szyV5CTZgg=;
 b=Gw0Be/ED5BYiuglS5p8he9w7NGmTnhhqyER8N85+yc7DspOqX0bWa7XHYPXyW8w5yoCOGwAnSj8daX+HAS0cGpaic3QCECsUwb4OQ+nCGPbWh3bmEHKP8UfiCh+gvwiZYLwRo7qwaVU+jnuxLqGRw2IeylJh0SIV9lTGbQz4f6tCH0GxczKPOQlYDhT7tP96D/KkX3/XC7Tsp1MBFUl2TaXbJInTZs0m83JFG96ywKblny3CZaa4F92kdcOokonBld9JEZ7WuC2/x+qMXYUvY12bOKZhXA6vrIUX6cXVKEmPUWEjPXQaSuhSwESWmBydU+95JuTmhcNxY1H2WDU/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF7e/D/y6H6aGtlPqqwRHZmq0F6LJFQ44szyV5CTZgg=;
 b=YuPpTAZTBjOWSo/46pHlZqJKIOZP0T0Lm9dNJ9XHwMedBWGXQu29YMoeNyt1OoPRj+IOyXBcW2gSDY+wORdofogLn/iy7ocTB3x1JfzmPk7Yh0H/PkOQZWm/S7MkS7LfArxjJOQPVn1ABoyuUr5c31Nt/VuPC13bHTlUf6ho8T8=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS0PR10MB6055.namprd10.prod.outlook.com (2603:10b6:8:cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 05:21:41 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 05:21:41 +0000
Date: Fri, 20 Jun 2025 06:21:38 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 4/5] mm/madvise: thread all madvise state through
 madv_behavior
Message-ID: <4fdde03c-b7e9-41cb-85bb-aaaa34746dc4@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <ce41fab11efac21ba28b89328276076b9e389093.1750363557.git.lorenzo.stoakes@oracle.com>
 <70EF3B55-2F36-4980-9944-E47E6C64570B@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70EF3B55-2F36-4980-9944-E47E6C64570B@nvidia.com>
X-ClientProxiedBy: LO4P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS0PR10MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 68745da1-6368-444e-518e-08ddafba5678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lhCrexFD/RJEW1p9AcIABMEdVlLa50yhW+E17TT7QmOYRwWtpqTxijaEuLST?=
 =?us-ascii?Q?pqTGWUGJFzC7TF8AYqH/hECBly+XV2lRRGnqgE9BWNvTAvndMnKCLB5hOgWA?=
 =?us-ascii?Q?UB+XKGyKF0WHQ4Tv/uUJe6lrkN/p6Kw4nVfJ2CgPJrxzBVE72jBgxT37VKUh?=
 =?us-ascii?Q?esEtmvxiz3FO04cig3HcTY2w+9TxAxtgJhfgcWUtyAMW3p6oW4z59QNgIfqk?=
 =?us-ascii?Q?vTUnMaXe090xU9RRqe5YLIyNLMO7DxY5if++OM6YXQO1/MeCqhJMOCcfeP9J?=
 =?us-ascii?Q?TDI3a7jgzQUNTYt+iB/XrMZJuuRAzyLxPvN/RWYF+w+UiYKjF2Xi3J/biO3o?=
 =?us-ascii?Q?q/7HzLyUOTU3SdvyuLf3Ak9Qm50EZ0MfrjjRZCgnRsHYJDyf/QViFzzyY8wD?=
 =?us-ascii?Q?3jhJBtfWs/dxfZRrU4VBA6imUKmkfkVpUN2ahcLzf6dyKyvF3/o3cSBtrD/p?=
 =?us-ascii?Q?27oMmrxmUP5FpW3We+p7hYS3VntOC0IINp7erJBnka1cOiCfqPt457jSttu/?=
 =?us-ascii?Q?CE+euNs2LEEzk5GOAuTMnPza2A1MiWCnMRUX/VwXsrjFpNK4wkE2qwhOIMZ0?=
 =?us-ascii?Q?Z+0KxvZkC7lSXrqBCaIMHVQurJv12NgsJ4k7xOKEiZc6oeU+OBurWPYxTYNK?=
 =?us-ascii?Q?P6j8nnb1ye+LY6vtV9Ig2Urg5JYBx95TcfO0k7M8qdAGZ38LZFr/Cd85fgsQ?=
 =?us-ascii?Q?KqLjVtBBx0fA2bZbN/LGSeTTbjxwxmC+Mkpg5qo6YxdqN45+oXGaK0eWocFI?=
 =?us-ascii?Q?cHx9feOA+lnYGojhmKNapOqWtLg8bFKybJSHVeq1lzleZZ7O17vg8pl9C4yY?=
 =?us-ascii?Q?OowSrJ3grVfk3ATL5rglgj8H4YHk2l2iVWEgIUsNGjz4Mzuaf9KAjgd4HMLi?=
 =?us-ascii?Q?sxmMEVUAHFyxDE8ngFoyvUoaiUsMs2vHUfEQVYdt/RK5CB0S9+UtEq2/moR7?=
 =?us-ascii?Q?35WHdtr3nWMK81NwFZQYXNDwDWcz/zJ4EYsSOGMFuU/r4Oqfuyt1lFQG0Ww3?=
 =?us-ascii?Q?7iuKcaxAj65YmNZYDG+6bh06RO9fRTdN3zuQFCOts7jXJveo66XAJDEzFjJT?=
 =?us-ascii?Q?upcEH8KY9WQZQjOHB82VLvnfyrNBwSW3vGGLgrELhjtR2Xh59mIphfPmTmiF?=
 =?us-ascii?Q?2RiABOt+JgFCpqGN3rN8qFqPI7kHcIx9NcZ7fVfB7i5uOKfC8bRv1KNuUlqG?=
 =?us-ascii?Q?t+NyghuAnwEAJG/pK30d4mHmDQiN+DAagm4+5Im4GvOQ8dwzgFL/AdRz6StC?=
 =?us-ascii?Q?XYH1g0k55EgWWjndmL4OEvLIVBdEg1J1ouyQ4EnxJBMV52DkTcxHvnc0Olwz?=
 =?us-ascii?Q?q3NQ2+nVfunlosxE4ndE0w4tVdvAJpv5kAs0V/PjzfCb1OJiPm/80mkaOiqr?=
 =?us-ascii?Q?3mxQsGheapKujPgNpzmjhrOZf/dtOVlsf5+9Rt5R8K1vegFlvLb+Psr1c/7Q?=
 =?us-ascii?Q?8q4BWezNgJQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mzALHZQHdKyytWla54349nC7svlb80BRzSz1Im7KEz4PVFfNbYIgQvsw9lfN?=
 =?us-ascii?Q?ik2v/dg4/unbZJ2MtqHvW8F6Z4P2nIQyBXodO9Hb7j9CthgxRdLb4VwdDZFE?=
 =?us-ascii?Q?lmNp+0hpTdTS+XBVKE9cXDdJhs8vgyOWwvCHw+LHgdqnAGeYdaZk/o/d0aFg?=
 =?us-ascii?Q?6jZjcOuum0qeLTUkhm7ymNSePAMwaTwaWBtpQz15ymkso9ZfcrMZf9pPsOY2?=
 =?us-ascii?Q?S2UYmPiR0vOGI9RZbTHmvvT4U4iAt1m1zCkshe2BlUYHbNVsB1OY2j5jog3D?=
 =?us-ascii?Q?Iixn+7It+MvzGd5tEs0P/vF2MuT22hlZno5VUWQWLyLfHc2i8bKXD1C0VkcA?=
 =?us-ascii?Q?sacH6WF6MWxH8v2E6UYZ/Ur7lBwI0w5sstcfubmlk1nMOgbvLGvE+0rZ6pNg?=
 =?us-ascii?Q?yAv5HaeT8GkOCfav4OUD1XWO07ndx3QTVrtYnvY6l9T0mNo5beB1zQJBf4+r?=
 =?us-ascii?Q?DoEQSAw/inc6pmYMlpKQCT5cmOzZZf0QXWJ8pdAQ0MWPhR+R1eULS7ODr9D9?=
 =?us-ascii?Q?lTbOjZ0K7znLbyZK+NiN5XNHGadl8WWaFu0Xt/1Urucu/dgumzZCzDeIz9NU?=
 =?us-ascii?Q?bHoI87OGelx71Yck0NLfiFEVMoZISUetTo50M733z6/TugbyT4b3bObrcFN1?=
 =?us-ascii?Q?ivsEYLHN+FaxIWOewuM5joa9UQnpOtBhpdVaij0WNXUZ5yaWkCqtQdavBp4p?=
 =?us-ascii?Q?z3UWnc2p0Tmgz1BMdnmKMqIRv1fovjHY7j21jsOGgbCa2DW+v3xK/Sv3zx7B?=
 =?us-ascii?Q?U0O/SZ8x4DIUZIaT/MwSK0vXoNxG2M4XOpUieYvCe0cZ/Pjfx5eVEKUMxjSk?=
 =?us-ascii?Q?1RqNqA6ILUZnkBlM8dAMza+MTRYd3x0FY2xRUKzPp/063F/Qb3Yywsc8xkpX?=
 =?us-ascii?Q?hk/WfAqRzoeJQwu+oF/MoMQJI0mVHN3SjGp6/apAZ0jqYilx691tiVIqoaWb?=
 =?us-ascii?Q?PxzUQBNzkwjK1scOYypnwoNxoXk63PbQ/14MUF8T1txN3jlDcJ12vyN+LIMW?=
 =?us-ascii?Q?1MWVp1TJlY1hYKH9BHmxnep8w5+nrNOOcQ3b5U+TBO5QbZHohCLy+TZnHXih?=
 =?us-ascii?Q?L4cy0hfYk4l5WDK5723GRI7Vo4CSaqIoIRP+L+MTMY5Fh0eXQRQtRvL+FTR1?=
 =?us-ascii?Q?LZhoXgpwzDSyJpfzcLBm/Z2iVoziOV+FpGhEN9egG/B1OSqc+jKE40HkyodA?=
 =?us-ascii?Q?4RW00/TFjetoKyAB+Z2uGmF34h+LXHwBA15j6a0FIOS68Zp8sOvzwIxuxHiz?=
 =?us-ascii?Q?8UvfztOm2zC6Rz9ljvYjv639BfUFvMaMV/SSDpGwYuf1glhhDyOzKB4WtO4b?=
 =?us-ascii?Q?4RRDwPRizxWfcIdIdWhlsE1/NN+rUR8yHNAx366jy3KXH39B8oe2OToRe21+?=
 =?us-ascii?Q?/lpyFM8wiVaSx0Kb10tMbmXYUqQnbIhTwdB0FzHNtFmqeKk0cWe18aGROi/V?=
 =?us-ascii?Q?WM+RKFol1JBle5PuA/iWQeoCmv72w7wBcYVM51g7hUfTXC0XfKF92w4Eq+HY?=
 =?us-ascii?Q?+rw4AVyzyyfouDlOh1SuxA2piiioFtRAk4qdiwRl/7GSimPS9/KREQfvp0D9?=
 =?us-ascii?Q?93J4aFyVCcRxRJgG4dWVwIQ5aph0UmerF6hJczLfbWAIfmSaTaNeKLLjTw3w?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IQY2FG2I+3a+6P/hvG7HCy9jcJt1hiz5k0EkIqZgqv8qqmuMjLXUIWT4A0HKN23sEmLkpdjGA8epiTGsDQGibja6RfyedkuLAYFWOKoTjumo4VAoedku/Fn+qZUBPVzxKfHxL01BxyDYb+c6EKkE6ky+PZpyWTn15Egevm5HumuoG5qWXBlddu/JkyjgoSsn+fmskIEDP+67MNnx3Vn4QDKXWJoEmW3j/z4ddYWgRBkzAr4asAQUmNtY4S7DNmBMNvNmexjyBGOMNuk3n7fGFLD+m3YJRjWmUuxkTtSjJWBytP1gpS0OK4xaeR8NZnCZQYslVCXB4QsJgFdknub3vIiHhR9ABbU1yaCyxWx+aEqfN4FnfiQSE1k423THyL81e1+LuBOHiX60VA49U6taNMJpUbX8qqvC8MKnNuhWI18nJlVb3D1KcQFD1CrFxdn+L0BGOM8e3qG6ffiZyHqC6wlQSqYZVJd85xb63QWf8+BknnnHfId3VGb1k59/B7OGQrylTqo608IYSJOOQ2eKGacLYWldCaf7WBpLH7Q0fg1cN5Tm2GWjJKolv8t0Qpayq0VRTDhaZmhm4bQLX/Os3+qsN7MKIaQ6rAG2tVoL+DA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68745da1-6368-444e-518e-08ddafba5678
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 05:21:41.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwHWGjcvoJvC1Icx2LbmRY1WEPbUhWqCQEueWpdHKgc1rveE1hoj2nivQqer0GLlZgyF3jUmmLQ1pXXnb+GCBL/c0NxmDu/GLaG2DO4UEt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506200038
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=6854efe8 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Ikd4Dj_1AAAA:8 a=FaxuI4N_TEtKoXk7LF8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: vXFlpztoVS5V8E9Bu7tjLZuUTRY86GaE
X-Proofpoint-GUID: vXFlpztoVS5V8E9Bu7tjLZuUTRY86GaE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAzOCBTYWx0ZWRfX+4d3PiH99GJI Npi+Jo8EBmg5lHsVdZ2yETLkwSHWPQwzLKw/ixN1Db0BYGoMprVLR5AoS/+De99Ia7RhF8SZqNM LASt7lfmOReKjObtm/mUS2Ys9hkVhX5b1TodBbjrw8tHamQ6N14mHTo9vU6L1yimM3B0mhpXaGm
 2vL6+/fjTuPTj1IQOQ5dfSHvohvR79rMVua8+xlED5sVkZvqkeYhjjFwN3OOQHdPYv8ZhxErnGc 0KmXx4xgYXnImJ0iTtlDwQoMFNuVgxvrB8Yj1Y+3h32CTocT7t+z525txKGjBWYb27SrQwcPHqC 6gBK78OqADaw17eNuGWfVRHBWpu3rWKCXVaDP7fx3wbXdV9c9gQcPPz05Zj21YLbizDo/DPp4B0
 PnDpsk8bETLPtODfwh8zuVuh+Q6K4PoraLT9umLH7huoZtGt8Obo8ZuQToXS0mtTqsklyQhs

On Thu, Jun 19, 2025 at 10:20:23PM -0400, Zi Yan wrote:
> On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:
>
> > Doing so means we can get rid of all the weird struct vm_area_struct **prev
> > stuff, everything becomes consistent and in future if we want to make
> > change to behaviour there's a single place where all relevant state is
> > stored.
> >
> > This also allows us to update try_vma_read_lock() to be a little more
> > succinct and set up state for us, as well as cleaning up
> > madvise_update_vma().
> >
> > We also update the debug assertion prior to madvise_update_vma() to assert
> > that this is a write operation as correctly pointed out by Barry in the
> > relevant thread.
> >
> > We can't reasonably update the madvise functions that live outside of
> > mm/madvise.c so we leave those as-is.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  mm/madvise.c | 283 ++++++++++++++++++++++++++-------------------------
> >  1 file changed, 146 insertions(+), 137 deletions(-)
> >
>
> Acked-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
> --
> Best Regards,
> Yan, Zi

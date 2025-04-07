Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1E64879B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044320; cv=fail; b=slDQh0bsZIrZ7N4Y0RDzbVRn8DvtYm1M1GoHm72X9U4gsvrQU28OEiQRyJdAchId/PBC4tdJ2x1h/HYVGBR3RfCSSHMCEIcUsC6iIh5jpO+ecbNjI7oLn5bUVL0QAKyPBjY6dVt6/wrNbXilt5r4zlHiM/hAVFBS7kI4GwNhj4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044320; c=relaxed/simple;
	bh=lWfhDa8oIO5lSsF8YDW+PfYQGXkBpoS0rlydCj8x3OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WVyz1U2jOatfsrkB5Vg6/N4zHUMcxVkTsCbp30Nh2+XELeo4NK0/G8lrO2LVXWqjTfIunlZZmABra+0N/TCtV4LUuWLpTvmjH0hTVbBp4LgdAZLglEMZVR9S1MF8IhazjGz4J/Az9MkZanReEmZGFFE4/ZxnroYCxISCMUh09Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CysvvFsh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wIBhpS0h; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CysvvFsh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wIBhpS0h"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537Fu69P016013;
	Mon, 7 Apr 2025 16:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=lWfhDa8oIO5lSsF8YD
	W+PfYQGXkBpoS0rlydCj8x3OU=; b=CysvvFshyRu/TGn2as59QkyZ4PX009DaNA
	f8z4brYy7HoDakgJky2y+goilQa67/jHOcCsrxVFluiWBT7m/9l+3knX5n6CB06f
	/sxbNz6QWnmGCv1QhILCl4QxxEpf2MhOsgfiA+VPYFyrpwxjs6RvtGl5rkP+tQKv
	govNqNK2EA9GukNNOQqCZGz8DsP0SXdtoH/DDr1UDsoAz9N6bTqlDrOBUNDOLzqr
	A0j8fBiJ+t51iZpPF+L3tDFAVMk5DS6XW5m0nklZjNNQB9hfwGbIh2eIkTvFBaMP
	Pp5gQCaxl++fRV4D2cVXeFpfPF7GHufSlULEvfTCzoo5i0pmVjaw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tw2tk224-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 16:44:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537FDnBR022201;
	Mon, 7 Apr 2025 16:44:37 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty8tfe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 16:44:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dT/nZ8dRC24TY+S7sxhMkXrqhqb907Vx3iop5urYgQK5xqlGBmN+7AX7jbxDfJzfw/WOol/X2vRV/W8/nZ9pswR+IUaCu6+dAt/pfX8Md906NOyeCii1scodyegDf60S9zi+F9GC3lNtDDbVxKvujUjij5XofFNECtlg8jQnbxHu9j72XxDrfrmQZ85sMUhipOWo9q+hzad5boFoIVKb+I5Hcs6nIlDMeWDqerUzvezthAw5TSbsKpJdDKTDu+zrOGKug/DD9pLN3jJPYWGAF6nImMmVmz6UhJQYtKi2vM9m8Uf4Wi+A5wWXpI/1a3Vlch04yAFd4D9VlLdUit/1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWfhDa8oIO5lSsF8YDW+PfYQGXkBpoS0rlydCj8x3OU=;
 b=Rx0hvmLg3R53GA16NpeiGD5SncoCc92rTqKD7rUVfPv8otFro1QzxrgseJeWpATVO5LcgCtMctXXFBAqmIsuESzUpPOtId+9Us25JooYVwmY0PYwdDWPd6xUpnuWZDPcAVNGv0b7fCOFBOL8+6j0zLufczEwiEErmRVXWmXE0l8DplzM8nMhKLYXvSx6t1ayTWJ4HruMEcp2ZbA0AUKmxEYT76fKMSUiRoKBJfHX4DlIJUnTplrQ5kJH/NEY2ths0HLd+JKXh7cx4NuQjy95gUCn/PqqUWZ0sFEAaVfI2VLmgyvQ1ulWhDT9WIqaOIBFWc6Nd+juqSlSadCUjAUkPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWfhDa8oIO5lSsF8YDW+PfYQGXkBpoS0rlydCj8x3OU=;
 b=wIBhpS0hEq5IFNDrlCAq/XcLfDeaiXrEOnH13ZP+6Kb2CuiV0nDbrxROH1FymKRDfigB7V7YMRRMQ5ROy6dIDylXuobYVAvA/N5LK6hWfZCq+nIjACnp2FLnR/PSwcx+7hQHAAocox0Kjn6vm9lzCWdS7P6q25zAH86bIUCDeFc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA4PR10MB8612.namprd10.prod.outlook.com (2603:10b6:208:55d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 16:44:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 16:44:30 +0000
Date: Mon, 7 Apr 2025 17:44:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mm/vma: fix incorrectly disallowed anonymous VMA
 merges
Message-ID: <fb1a0025-ed51-4729-bf6a-34277afc0822@lucifer.local>
References: <cover.1742245056.git.lorenzo.stoakes@oracle.com>
 <ab86a655c18cf9feb031a9b08b74812dcb432221.1742245056.git.lorenzo.stoakes@oracle.com>
 <20250404125315.5bou5ays7u7sv4rb@master>
 <2fcd2760-0116-491e-add2-c3277d5bb19b@lucifer.local>
 <20250404233231.bk62hjwq46vnrpmz@master>
 <64847aca-bb02-43e0-8951-33f18d6af193@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64847aca-bb02-43e0-8951-33f18d6af193@lucifer.local>
X-ClientProxiedBy: LO4P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA4PR10MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: b76089c0-4694-42b7-5b0f-08dd75f377bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HsXSN53ZarWqYMhI1rXxahcSF8jPvRjgwnIL5oA2RrJJspq2VpqvWjOMcHhb?=
 =?us-ascii?Q?rqOoME6EYZxLb59JHeNzeOfSK3rTzvtg0koaGwIflIerFt5+YYPJymyEaFJg?=
 =?us-ascii?Q?v7Vo77hfUwuhHO295yB0CG1XKlos/vHyrGVVwV+8U+IzTA6Ol/XYt8RW+l7r?=
 =?us-ascii?Q?4sEV/AjnHkgGWfzKpQG8KyknkiSP7AvUqMLF+KnmlC+QvVDghL9/N1Gsga5C?=
 =?us-ascii?Q?AQobDEnHkuNK8CiJJJSZ94jGI8Zb066E+sM4WR3USWicxUSLN90UxaDPvh3+?=
 =?us-ascii?Q?vrGHovZhNVqiBfmM+XDLCF9bRUBEQ3lGv2DWm+MB07JOA1ROwVm319Ujk92C?=
 =?us-ascii?Q?lGjNVFt8ZiiLNIH9wsQ2+CqiiYEq27U+wpTK82b/pqCiEX/w8vpdP2TaqTIM?=
 =?us-ascii?Q?2EUs/bnc2FfYzF4fB+I/8mQo/Zeuk+1Q2FY4X9or4hse92LeKIGtJ8K+dtiL?=
 =?us-ascii?Q?OHBiuHSwcXMT5r2JAFKaeKH7gnUFAuCk2PoyWduy7Za0fZGtjpL22B/HQkLB?=
 =?us-ascii?Q?wVmd3zOhRymwSynVzZT8KvBPL+oCYxmLLlwUUjqF7OPW2n6Hclgzdk7nwG/y?=
 =?us-ascii?Q?o7zkD54EUMNXBN/ZPe4NFL2jM8uOSPRvUV9isLBb5Q/X1+NHyraxmxth9iMS?=
 =?us-ascii?Q?ZgfZhoM3Tq3MD+COARJKM37LHYP7R15GxOj5dGAejqTOi9h5kcaFefeqsbtV?=
 =?us-ascii?Q?DtssBg5muKaq6n6R8kYOQFVLfGFOGPiUOgXYb3tx8WhWOlMRL8VqHb1fdJmo?=
 =?us-ascii?Q?U4lqKRf8eMRtSXOgePffiiUVYmie2JvIxCuD6tKxECdYy8NXKh3EpB1rKzRn?=
 =?us-ascii?Q?4d8HKtvRKUY3x8xfhRcz91Wiw+di0dntxfzAaac3Cumx7ICt9Aha18Wsg0fU?=
 =?us-ascii?Q?EIgOjKMZQIcEmZQCLg3sezmVgaMheBIahechpdXK/Nu0FqObRr/Qq0tP0xEu?=
 =?us-ascii?Q?FezkeWaE6erFyzW7VUqtZX6j/is8venKCw+6mbm1poiAlHcYwP36PDYRBijF?=
 =?us-ascii?Q?6BIYZ4AdG3TqZ/m+KMY687A16QQpADOlc7LItD/kvwxJWbGdEDByWGNI3kUx?=
 =?us-ascii?Q?4TQ/3I4QZLyKRSYWlZ8LcAEjCtwEYjle+iR0C0byVVbjfnv8JJUHnXcF43oj?=
 =?us-ascii?Q?LGuKsUWP/+8DfcWfMvABwhrsvAZm+YtWMtSc0TfovC4KFgmNMieqZLL7eAS8?=
 =?us-ascii?Q?H3j87V3l7ficRujpLSd65gbzHFE86Wu0mg4Lg4XxEMtUKG7J3p1HjRZxfO/W?=
 =?us-ascii?Q?83sj7E/LgvPnZpmI9iNoxBJbE7TEiT6LJnKpcmNzpcioExfftu9IdNlc8fs2?=
 =?us-ascii?Q?02+JVjxAWTL7I5I2GRqtVcBbnqb2Jh9nulxYwU2lNtiYIDlyBWK/temOZGG8?=
 =?us-ascii?Q?Y5pJoNRh2upp1DRdmtZkppCvXIi+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TYcLB9S4N+jswfUbNLScaP1zG2wtNZzA11EF+HZ6Q/ckEyTP+VBXcwknQy//?=
 =?us-ascii?Q?c7crmfvR2Ow9SPa2+RAAj/o8VLs7CmR98lrTjphET6pOvAvbLtx/omD2QOra?=
 =?us-ascii?Q?2/IjJlO4gtnMMTPykPkD7EOSa3NqVTf7IB4vpz7JtMvw72LZpzBAcC0WXRX1?=
 =?us-ascii?Q?L+cunBdUsV0m35qF247Jpq3VUpejT1BqaXNW6vc1aZH46joAq0ImMxHgjhJC?=
 =?us-ascii?Q?pro8VmVIRo603unWa9AypEAmlaKdszAA1GAL+Bj9BbTe2Qv/g6nBhrbitP0C?=
 =?us-ascii?Q?Niucy2VYmP80RLuHHvggaIbxdMcr1YxePJYjeAzGdQQ5f1IQu/4EU2IzCsIe?=
 =?us-ascii?Q?bOTrrBfPa8b/B/uNu0mCEFRoGNeRzMSMTGJ3hA+cIDcJhytxBuEt3oOM0DNr?=
 =?us-ascii?Q?X4czMwHjoUOpSi8HnXcn3YAuaCnl4elR7AhL/vmeWNjAo5oQK0vmLEXG480K?=
 =?us-ascii?Q?5twYgTr90weQhDOEgc8UUiDC3Gy2eS1nsdJy/CarCAeEYvoy4Mx48M2dvg/w?=
 =?us-ascii?Q?2unMKL/zHTxMCzyWDOPzvPjvM4BmJ2Lx4/DqqVMevio/hCAX0Ih+h8uq8Nim?=
 =?us-ascii?Q?eCiOBJxhLCX89lR6ifhnaDeOV20susEmNlayjwO5jUQ8fFg25oM2u0Dn1Bgw?=
 =?us-ascii?Q?QQoX66yZcBl7ouJIIRX+AumCIbtfqkdEfnl70uY9wxE6GJY04Ef77azMxFiK?=
 =?us-ascii?Q?d87FvNxNXZfnffj4mYiA5ciQCHI+XXmTsLBvT8Qitq7/RqhUOMhoVEZIzq8/?=
 =?us-ascii?Q?DHgAjTFH5EeBIs+vJ+2zMaPBNeJHekoLNjR0wdNvuOKpVfTH0rQUnhQo5CsQ?=
 =?us-ascii?Q?TIi/4gFC31nYn7MYZgUfJt1A7umOCEXrwRyFO1fU4VJzRw1aR9klAHzydxkU?=
 =?us-ascii?Q?7XI6sVTbfV/v+KH2R8YvQAJFFNo3NOQaCNkQiK9zCkDmHivLAmB9u1U2B+BM?=
 =?us-ascii?Q?GQWUEm28u8tWLXHbdmjDfgmSMGUd2JL3dL6Ft3WqJlUGdumVYBaujoMtqEZ+?=
 =?us-ascii?Q?2kDfcDWszdi4KAXbmamKnqMdqxVF/XL3cbQ4boPeUx/UaSLjza8bChlsRr1F?=
 =?us-ascii?Q?aHYmxyTY10LiiLj2oNto2dUuVqHgUKB+oTiTaTaMblmHgzjrwD99g6PqYDx+?=
 =?us-ascii?Q?ptORYDEBHypxtPFaD2c2DngljK2geKQi9yXXuCxYXBCOVE8U8Yxqz1b5+6pb?=
 =?us-ascii?Q?a6hZLm4V6wqfnz9J4KZHIMTeT3S97Dhw/qhvz2owQejLqRboRSgiqs/ISyMw?=
 =?us-ascii?Q?j/Hg62uFJK99jpwJX4KnXQmqUHUvpJLWHXYjLfqu9bx/f+XtIWrEiZmagm9U?=
 =?us-ascii?Q?AC+wQZYr7eIf8KeVst2nxWf+2O9f23EPU8e5y+Tt4LPPLELQvZhJdrsZb+0v?=
 =?us-ascii?Q?PJNzOr72jr8HHvFbQHR3ckEfhTsZoOcj53hBMtWg08K9l2rF+qKiFnjK0FOX?=
 =?us-ascii?Q?qrEDjiNqulk4pHC8bqms5FytPUXq+X2Z2o9mGuvo48LF89GIlDqK7cfiICMA?=
 =?us-ascii?Q?a/Nz0IQe8c1a0mXeDBybEJu2gy1M5m5FiGEuea2O8bWYYzgaIuWzUlui9AON?=
 =?us-ascii?Q?s8KRLJrkZuXABnjADRA2gWD9BwpqUsz5gtIdQ/Y+5MJpJaDBC4WPcPUTpk8e?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qmANh4loOYahHMu+SRLhzTckZSrUqXUhSvSo7J7Axw/GIc35/w9g+a+DafQCC9K9kf4SkSpU6Kef85iT5tqxWZJQRv9oyXF+TQV3D17hod2uCWS4pzYLM7e7LuXpoJ+/odvg0SHi5eopgtivbX0jZ6DV7KUJ1ddgzyAK7YKwmS7vP6slIPMZA43vDqTc8CoYuXinPJlarAwgaWG+G5DJXfgqztuAIdj0DjkbO35FrKxycCwLnJqG6RAQXQOnWBqcdIWRx8D9Ri2woE5Alu2/aIMq7U0TJ8+uObGUVqMcrGr3vMnng1bNNpoWmu6ad8FYPj0n+iyjcW9gCyNOOVGKc8EFlqnMQ9Fjr9G8Eu44pr032A698taibAgVDBysOh3wMELMUUHORPf83k+lC4k2yplGzuY2UMe5TW++UvjGaY9hx2VKuvQzlsn3N/lpASBax6LBqN+BjEY0o9Thhq/BXiQUJsASYRehyDRAuBT4No2SQx2gZJOE5A0L2yShoAxbbRxJEXXTpyQhpJNQozlCU0f7yA62fM8+nQm4b5Pi30Wk8hf19oxNmdQWXqLskos4sXqfzXGaGaTbKsnOazqt9y2oHvtFwirGIO4zcJgoZ9A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76089c0-4694-42b7-5b0f-08dd75f377bc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 16:44:30.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BkHLKwPY7jlFuj33N9fs+odxd1laRk71qLy+90nTbw+eEcWvCSOYHdPJMXPX6b1SEV/pYTsSMawnLSyzl0P/XdK8mlp6SjKGuvN3T65Co8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8612
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=739
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504070116
X-Proofpoint-ORIG-GUID: ziLiM9xoZX1SATw7QsS3b91P_O3DtWh0
X-Proofpoint-GUID: ziLiM9xoZX1SATw7QsS3b91P_O3DtWh0

On Mon, Apr 07, 2025 at 11:24:19AM +0100, Lorenzo Stoakes wrote:
> Since you seem dead-set on this issue, I think the best solution here is
> just for me to update the comment a little. I'll send a fix-patch.

Actually, re-reading the comment I added:

 * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
 * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
 * would mean a wider range of folios sharing the root anon_vma lock, and thus
 * potential lock contention, we do not wish to encourage merging such that this
 * scales to a problem.

'If _at any point_' - we already clarify the situation.

So I don't think any change is required here, sorry.

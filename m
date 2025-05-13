Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557161B3950
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747160274; cv=fail; b=bdZb27drolato8Wd5O3m/fnuYJt4Nw0JQMpKhHbcqif6IeqlS+fusiWggc9oOPXdcCNDoHd5tFIRxGagMZarCbllq/uOdKeH1kXU8DqQ+QaWOa37heF6mLmaqoVIX3mfGWuib7WWqSrpKqjOyVH27CNKR3rzANCxsG+aJjUQc2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747160274; c=relaxed/simple;
	bh=oRqsQWT+pHMC6cnnWYxEMOVellq+VrmaCZwFoJN/0No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KZwsbYRt29OP55x52tLX5CljgTFbYppQU7RSUS62C58iumTarkFFvP0zkvLV5/M8YpJp5lPGyiDEULH6mXujk2PxwqimMje5qxmHSZ7V6alQ6oyeZP5FTjFQpusrbeP3v/5GuXgfhX+kHXxEuc47hyelTxvttNNyB8CMIhjbp6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oIhw1WRZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AvOmOmCh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oIhw1WRZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AvOmOmCh"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHgGt027156;
	Tue, 13 May 2025 18:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=WDk7eeVVp596PGt6+1
	AALLfRGtbZwlNcyafVprbxD9E=; b=oIhw1WRZy3SLcfBFBYfSEYuZc//cOhRwNu
	V5BC3NanwNhutN2P1sN41B1iUFwRyXUOSPobeOWRZ5rsx8koLhS6zfPx6wj6PckG
	GC+2e3PsNEmHdVewuiSWgjOaU0JGAUiQBr3Y5owAyOi9ijTjGXoIBrYuND3xys+G
	rwVrFeiqjiUbmhp9YEepNcH2miKWGBYMv2GTA+5X1OK24KSW57LQDtUTaeGuRj2h
	eL6phrsw9dP3urxoJYTX9iI+LBqzhiaNfxQbsvANG2FlaLgpFu9HU27DWr5qbswM
	BuZVTVuUpVOJ0jWZxPBbwY27n0Gak7PXzWJ4QDmbaVNsC+UlM/iA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j13r5ftf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 18:17:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DHUfKf022301;
	Tue, 13 May 2025 18:17:35 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010022.outbound.protection.outlook.com [40.93.12.22])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46hw8a33by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 18:17:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=al8WwzDcDMhEZowTEwqd3wgHWirv4bpf6rE4qHSGKW65nJey7HTe/8DZ7zMi864oiQCqAUzgUHSbMYVqXnjPtOPUSIv99sB2+RYYvn6ARunJVrOMnLo/UYyAraQ0B0DAB7jZJYLPGhiGMNP9LZ+tSFniEqtXIMijc+IslGPzNT1ZWCGoPq5FepFeByISxzOmnoGEcudzRiBTqZvHfStj4do1nVVyulY04jz+qVntBtLCUND6EtDlXNzua73oHI3sVWn9XjYE2OUc0D41yEMDYqOQd9FJZ9ixh4zy9lXVvY4ljWKqf+C+XB600UIu0xqIJkZdaI2EIVNm/SPjN1hDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDk7eeVVp596PGt6+1AALLfRGtbZwlNcyafVprbxD9E=;
 b=e7PKE6dXpRv5sfXLVALTwmE52ME2ar4wmUmCj30AterS3tO4wmelFPcfJwhqzX7WjXv5XhT55+NJzJml63RbuAhUj3IW0OXUYtfyElrYhfhNxohoRD1N/c/7c308P8uSr8zU4ayEFvaPWq8YQmx6wuD/JIeHGxzUDVxKZl9qadRWWFNo444nO8gpv/zTi/g9jGFSdQyGw8zpDZsNF5pas9+CVE5R6W/WjiC5H95YAVEL6RZO3XuaHmHdi7ir1K9AqUXnVb8rviFG4q9ojpSEF/8Ha+vgIL1ssvZcfJGuaE0/HkXptf/Xf8vr43iHBh3y6kpEplbA4ylHclujy+hDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDk7eeVVp596PGt6+1AALLfRGtbZwlNcyafVprbxD9E=;
 b=AvOmOmChXr6JffUgnEOKs/cyz8D3wvcBUIh6liREToI5DuZjd4vsGPgyw8uotldWZOUIAzeD7UskKcGEPacYFtA7+KWv8jrPTXTDD1ZKZWh0I7Uj28iSIs4ESwcJ11SYZr3vx3zby7BGrZy/BOKyyNZbHemgiUZU8gsK54qefCc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CYYPR10MB7569.namprd10.prod.outlook.com (2603:10b6:930:bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 18:17:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Tue, 13 May 2025
 18:17:30 +0000
Date: Tue, 13 May 2025 19:17:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, xu xin <xu.xin16@zte.com.cn>,
        Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm ksm section
Message-ID: <783a848c-f9f0-4f2c-8d6f-46d2765d80f7@lucifer.local>
References: <20250513161758.136402-1-lorenzo.stoakes@oracle.com>
 <dd10e199-e5de-4c4c-a524-68091973de7d@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd10e199-e5de-4c4c-a524-68091973de7d@redhat.com>
X-ClientProxiedBy: LO4P123CA0500.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CYYPR10MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 79fbd137-a4fc-4ef0-4571-08dd924a6c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?03uSH5OS7HOiS7ai2WNysVxASLhsW1qEXSPk/0Hwe1xqB66ypHSEQfF/2gqe?=
 =?us-ascii?Q?e6Nn9s8tZ8RpJH88PgL7aeZx/NCKVMWIo19tLRFfCo7zIlfGbPDvM+tRVsbM?=
 =?us-ascii?Q?VbkKZ+3TpPyyKp0GC77aedpM0JsYRNN7SnpcyIpjmKPax526cydnruO//oMp?=
 =?us-ascii?Q?BM6fyoJmplq9IpZDweY3RL6xHqo4GIfGkPwSBc9Lx8YTPHZaP2IlNEg7pjHH?=
 =?us-ascii?Q?NXrbnmGijTHcpzu2PWKpKM/1e3EcgPobGJbCc3jB8b4Z6spyCTp7X7+XqjfP?=
 =?us-ascii?Q?Kcfz8UI4Pqlai3Y5qtgylBA9/usqaM/ML2Rk2dtk97iQ1jci3U/h6IVlJF4t?=
 =?us-ascii?Q?1/wgR3kKPiXZu1aseZM0zRTbdVgp6RU8lhmMNwB6CEm+RNpCXijpyMCzNsT/?=
 =?us-ascii?Q?SKVE0Jo8fmkcp2X3iW6W3nGZ9t6GqYDk9s39D3xeiO+InU1FZrQWTPbySfsg?=
 =?us-ascii?Q?DptHZse33Ogr679Gb/SfCKgAqaJlNOOEPxm12YSl/FJM0vsWMrQhgLvNyRnU?=
 =?us-ascii?Q?PKpfkl2wbqjBs2wu2KlWjD4i/w2uWfjRYaF4TGmPcEfMREa55bnhhHnKA1IX?=
 =?us-ascii?Q?5gTyzg6BR1rk4iCpu5ibsZbkMrp81CAihkR/b2cj9FPB4tNm69DGN7YvUytl?=
 =?us-ascii?Q?YEmOVVWtZFwXCnOC4mWhmYAalcoVnKeRb5bs3mdbLdm+nwLdJd2J2UdcJZgh?=
 =?us-ascii?Q?Oy4YTGmDBz8hmi49JAigeeDivqq/1UCA6ueOp5b2fP1jzflACZYLarh6wS2M?=
 =?us-ascii?Q?/O5f0CqcykIXmh5ts1jzH42+hH13FX27xcYB8SzaK8pQaiAXiq1PzXxGlgwP?=
 =?us-ascii?Q?sRvItzICqtYJs/GB6GvJRgNXm/tT4UCUlXF+6hDSCBMIe2CFVxv0TP4mzb99?=
 =?us-ascii?Q?v7KQXJIDdFjhd8piis0k4xkHZYmiFcOosqrZuU6RZ1+Ie5Bvf3XwxHX+QECy?=
 =?us-ascii?Q?bwqXrdh1qfYm1KiUIAN+yc5XuXeGcsv4qTOyf1WXkiBKrVg5mKejpTYR/pOt?=
 =?us-ascii?Q?hFnxw7q4KfXRdfe4OQzMMDDFuSWduxjWQXy1eDhjSo6XCO4qkiUGWgkTmFH+?=
 =?us-ascii?Q?nObIST41uAG9kZzwNK2Z8qz96fmlqHqJOJpiVIXAqsSlxKjnQgiZW9JfA0ac?=
 =?us-ascii?Q?fhi+pOoq3zXwY2Y2/WNvQVy2Qb/X2n5wWchHWgpDb5kLsqQQhPvF3yJlt3nr?=
 =?us-ascii?Q?0kXjwXcB8HSTA2gnOVSUCM7ih/ihfFdpZx96W1eDDfWIqR2uWld1gDyuN8Lt?=
 =?us-ascii?Q?GLVjl6Vz6+tvKhU6o1d/xWelvCG+CHXsX7NjnP5bKx/w6KAIznOwFEWmpmmD?=
 =?us-ascii?Q?Ln+NTZ5icvw4f4VCC+pDn54bRwXbYxEWTL7DCJL/jHxmiIq40c4xY0Q8Dm1E?=
 =?us-ascii?Q?3lorLjo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V/kH3TYBBrg2aclCPsUrINUCB+iIFDXLu10WwrwKW4qUaxr5wGQ5T+odYGpA?=
 =?us-ascii?Q?6LkDYwJH5lK2SMxUQuOgzTrYlS+DT8iGtdjk1TDQWJmRuXfq06gDqVTbQCRN?=
 =?us-ascii?Q?8/l2bnAQGlRNHxAMD8S3yxxoZ5p7p6k3e8wNr7Ku/LdRKLtc6iYw3rljsbFZ?=
 =?us-ascii?Q?RddkkyRrQCLNFXdwx+4wMWHU0RuwwUusdtMcCu0Vj+eNnamR7QaiKrpScfqB?=
 =?us-ascii?Q?vrH2S+LwKhNzZwrO8Y1cvwS030hR3JwoEJQBhL5bxhPMsBgQVPePHq2L+0bP?=
 =?us-ascii?Q?O/VRiEPpgJva1oC5og9dyY836M+iuT27/Vn+gUpGj9TbgcT1UzFJaArZfWEo?=
 =?us-ascii?Q?zKlTCaRdPKdfrHSzDWhEzNj1zjQGaJR5Wg88MBa1PiOs1+wQkddTDikdv9rH?=
 =?us-ascii?Q?/QH+eDMAtqWrfrr+dwHbWPYzQst4Okd/R/5qQd/k/B715GuUiGftk7QkggLk?=
 =?us-ascii?Q?k4oKuhb0fr5fgT0WLueCVja0fufNjJqWGbRsHho1qbG6n7tJsbYyL+k6cpBt?=
 =?us-ascii?Q?bnoyL9hUOb09x8HFwrbVplqbJDcKk5ni96dCv4PCfBRKnDE38/kxGvcCHkDH?=
 =?us-ascii?Q?bY1/jm+GPZrW25U1A3g+BJ4viHtiB/WImIXr4MpFRLPCmfkg7gVNVdIoRKip?=
 =?us-ascii?Q?c06UV1MPmGfbBEiNvsnfUNut36MOl058wM+crR8n1zeyMext99sFx3Z1EkGB?=
 =?us-ascii?Q?J9BFsxuOewHlJW6qEI/ogHeuXNZxBDlDtJuQ88jgVdkj4sneENEzonARBa8x?=
 =?us-ascii?Q?48q85ijvvy1U//vnKZn0iZQ0FdznBNaLgIXmJVMXnLu5NhNdCHqzx+PYYGZZ?=
 =?us-ascii?Q?UrAtB9DA32/HazhkPk6MBBGKlf+df3+uQxWr1HJ6VFddCPXpQiEZE5MYOPfc?=
 =?us-ascii?Q?1n0GfDhhziDAkQiTt1ab9Lkv7rgdIL8B4hFIADjhWtSChKZhYjsvNEM9EXS9?=
 =?us-ascii?Q?1nVC2La2piEGAC80fh+Tbt8emE7ycXuP0Abgo/BGsYNpIIHT4EnsT5k7bQ4D?=
 =?us-ascii?Q?XXOH3Mnz6UBX+yljyQwWMP8/FkMyrWfJImBqApwPiApKnwPi/xbfSYrVcGsY?=
 =?us-ascii?Q?Vm7xOv98Y8Oixdxk+tgEf06TLgMNmXknGJHq2J8qbSrhR1isP4I3/QxiAZ5v?=
 =?us-ascii?Q?zf8xZJEPBUtlhw7SgTHJkHVfBnG6WesxIeiF0gM+mmf/768shNqZGwGte+dl?=
 =?us-ascii?Q?TrZT7qISKE65O84scLgoBuYpq68F6XZdy3rDSRCB1N7c0sN2uUsr5B31SeK4?=
 =?us-ascii?Q?3kzixmZ0OQ4NXNFgwJ/g0QaWmHhum1nSUF41WVvoJYWWweD3fvXaLT/hqhi2?=
 =?us-ascii?Q?UPsSJVp07mw7666LwQiLTrZDb45q9V0A7fL4R5BT5oXdWlOao1e23ggRluaq?=
 =?us-ascii?Q?DqyA9QOslJH+UtEiGN69nVITX+dRtgfiRujsRvFL50uSfvJADwR54rLmz9CS?=
 =?us-ascii?Q?0Jx+GvNL8tyeKT+g/LYMxKSQgWaO9KiM70PT6Opblr91snE1lSClw/9d1x74?=
 =?us-ascii?Q?uC8n8ikTj++VFFKl5/dSjNT1teidUDlpY40vuTQkHNRIHwlgpOeLeOeQiVsy?=
 =?us-ascii?Q?k5h2XZEEJy/0My5Did8r/twozIJo3ZbLNTFefwtmBLKOcl73Ikj2VYG8ncAN?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P0X6pZCeZQh6l5h70C15RjgYXw50++kLke8egW8FMG7DSnIgvJ3AHgPy8IJOqCF0JK2oaS7uUVibE0z5Obn+8i6ogLI2I6DLfCMLaJC15s7XNKKvDTaptOMHRq/yiO+7uTYZnu0aBq60g3JzEQhL2GZsQGV7dG2lxeBThzNbKhjIik+KkTRzBU9Stvn2Px2DB3CmJWZSGTo2Ny+6G+yqOSirBOP7tiA752kDR7MQJhcawlaImmwIRVYyDPDLgDGsNf+HxCft7bXSht2QctFLFs5tKpBTFO8p8L7EHLxBv13BvTT7SLjwFBLAa38I8OK4QSooh2m9hTkxdN9FzSmkN8y/k/R80sYcZhqLeOSddSE1skBbI1qMZ8oW8TuF1M7oKVXcA6cK3lCboxbgZnw2wjlCfyBHwQCGW8d2uVoF2m/Lbs+p8L9Xsb29KfrATxW95nDAoRgFS0d/RcYMKQf1x9wuxtqx3gNnANt4Lcv2YmiOsA87FDKUmSoE1FuWLfhh/7uKQ3ELcZ4ey26F7il+Io2Qc5uh2z62rCV2azy6uOP2EU+QwYFncTQBfe5uOCHJC+Y8EqJVnG2fr6lNkKoya7711O1llDth1w71ShyVzho=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fbd137-a4fc-4ef0-4571-08dd924a6c63
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 18:17:30.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXsYjSnMrGzCDcgHFvDs1LNTl49ca3WsE6bAaOr6M4X8rgx6SYJ7Ofxe37tAzUYb9lglNnEQM2/YSQFf0WRVEYhKHHx6iJxfFBe/fSjpGsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7569
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130173
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3NCBTYWx0ZWRfX0je216qOGxOH 4OGljYCpR/OK3vUlvJpya5YdBQHw7tl0YYWSLVexNtE0YOF0v5t2TbUF939rWUKw1rOBgP+ltTp WaUa/keImtwnG9/RC5YiDnl9VV0hJICaYUns3YkdiPRWnhphde3VEBb/7VJ4KCuJn+umctsEIVK
 7IkPpWP89wYiXkS7DZ6EV4fQzytY3GCUaHbpAdmpWXX8zzXJJKwMCG1/sk1yZhrRiYoQ+7GDZcr lwmKgEhHlXy3mzkhDwdrAgOxYpOQtWPcJz7gY193FyFhgoS9mKiFxpM4AdgKTHNd8DQxfYpZIid OYSd3Dsafm2TVGM73NThhbpGLHh78sLaVM4A+rTfLRxxrsK2M2eGd4qmOOsMOY0njUP9HgzlB7A
 5djQJRYPUtkviyiN/j+ludgWMhmCf/w7MCRzR9SqsLbmX+FhPuzSlKICBHy/C/Ls9YIfiCOa
X-Proofpoint-GUID: YBRRPQAyTjazdPz6GpNBmJcLRb129TnC
X-Proofpoint-ORIG-GUID: YBRRPQAyTjazdPz6GpNBmJcLRb129TnC
X-Authority-Analysis: v=2.4 cv=M6hNKzws c=1 sm=1 tr=0 ts=68238cc0 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=1RTuLK3dAAAA:8 a=naES7JBLLK4CkZDVlM4A:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=kRpfLKi8w9umh8uBmg1i:22

On Tue, May 13, 2025 at 06:52:27PM +0200, David Hildenbrand wrote:
> On 13.05.25 18:17, Lorenzo Stoakes wrote:
> > As part of the ongoing efforts to sub-divide memory management
> > maintainership and reviewership, establish a section for Kernel Samepage
> > Merging (KSM) and add appropriate maintainers and reviewers.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >
> > REVIEWERS NOTES:
> >
> > I took a look through git blame, past commits, etc. and came up with what
> > seems to be a reasonable list of people here, if you don't feel you ought
> > to be here, or if you feel anybody is missing (including yourself!) let me
> > know :)
> >
> > David has kindly already agreed to be co-maintainer for this section.
> >
> >   MAINTAINERS | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 80aa09f2e735..5ea2020acf84 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15567,6 +15567,21 @@ W:	http://www.linux-mm.org
> >   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> >   F:	mm/gup.c
> >
> > +MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	David Hildenbrand <david@redhat.com>
> > +R:	xu xin <xu.xin16@zte.com.cn>
> > +R:	Chengming Zhou <chengming.zhou@linux.dev>
>
> I don't see a single RB from Chengming Zhou, and a single one from xu xin
> ... :)

Yeah sorry this is fuzzy but git blame mm/ksm.c for 2025 gives you _very little_
activity in general, a series fro Xu and a series from yourself :) Xu's series
was... acked by you :P

Equally with Chengming based on other files listed here, I went and checked to
see if there were substantive series as a sort of 'fuzzy matcher' which might
imply a review interest here, and see there did seem to be some.

But obviously if anybody feels any entry here is inappropriate, or on the other
hand anybody was missed off, more than happy to rectify on the un-RFC!

>
> In any case, for my M :
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

>
> --
> Cheers,
>
> David / dhildenb
>

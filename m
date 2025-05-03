Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0FF27A921
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306901; cv=fail; b=R+BhetJgSNUaczvneZ+HSXEChTacdiBKMJnjJTruzdp97IIv8pFG+11oFA/yATJX75WE0UhbljYqV5BALDmh8xGR0E0VF5muMkGUFRHNDHlo9SaRif+EU7XYh9JIC0ys/gfje/fv0Qvbd4c3g82F2I7OKZIkmD1xGL69NlrEn+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306901; c=relaxed/simple;
	bh=7sLuwl2ZAiCb8HL8YX+bBkdnqgETfRl0Jo7QP4jrIoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cHH/UNHCUX3yX8W81vtyu9poyiSwCcgbIRzmlSiYDIlZo7q6c2AqF0MNKMSnj8U+bAYtwdEFcLaOTeoM7T6VOQ/KsDtS1O6aliRzWf9kJwmT6EWYehFYty7phbdnUegUmVAredjSgACulGKPhgOgMNmoHhgjr+6ZIoqDiL70RQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SCsUzRv2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gR3XY6au; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SCsUzRv2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gR3XY6au"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543KxD63028475;
	Sat, 3 May 2025 21:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=C/YSpi2hdOJXVBFpLoX4CnHShRqzkX1FAZslryFtQgc=; b=
	SCsUzRv2qI2FNhLW2p7+P6LOjk3g/EJ/cphggzZoUKZ2HcLlwxwjuf/X9RtcZ0Uw
	4/95gFQlMO27pkz/Wa9kMsxQGDPTPyoi1kKtuwK1YJ383TCuVFtS2dB0xM+jajhx
	Pu8T1XPZU7Ke9UGk6ze/Z720oZMd9tJFAPO9tCuFT7g6mqiUc/JWZUuoYtQZm8yP
	mfCY9YquRFdIOn+TPekSchj7wyEC0CiLVC6A9LWBY8LOhORYmG2hSMqm4YSIFvtw
	T4wvaF8Xoq8tXk8/WB/3ZaYEStKNiX5TKhDNgAgXJIB3yagpYXKWf4XjZlF63y+a
	wxZPwoN95+mlzY4Hx+g+6w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46drqp81x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543GhE9p036206;
	Sat, 3 May 2025 21:13:35 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013077.outbound.protection.outlook.com [40.93.1.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k77456-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEfYRRdvBGTxzO4HYKSlqAG8xNLn+h7kyK00kKG2+us6paCB9wP0Q5OihVvIr/ALZGI3bhfReUbyUmxwHZiCl3L961VOrwZh9PYzIEMT23Pm0jDah42dgg6wvkC1SLh1j/VLQsR5Hk15PHdMAkUjO6YsXKJLt6qih3E0R37Kzwjz8s0fKkmoS7vHSWyTXWq3+ucwFDz8+fOOlDRkrdFOfYgNrrO3Ms6FxubDViTWgkezCreh4zGnrtW9nQbuejG3l56k3cDZGVOUPg4fwAgno9GKLhaTBPUq4xbsv6zC4Y5rxh+ACM+JjzLb/CEQ2m2QqxKqcrFDg6NIGjktYM2/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/YSpi2hdOJXVBFpLoX4CnHShRqzkX1FAZslryFtQgc=;
 b=MkHjDaw8ybyNrIf8ifmJVs2FfVQkjRy5tTCMIozcZeaB7LhVLRr3bdL/p8U2aBEL3hj1ZVf1d23lesYa0/pP5JchY9A/S9IOeL2sTvJN++yW8+JyOMyswttHmNzHa+gKZvO92xeg5+9La9Zrgl6/uzSwfaZTtsiBFrQucTYkuDsNeOBglQWY7uimdtvjL7VaDijneJlL0zrzjZkWffQvtQpT3fR5QR/O8UkHGpzkpnIEcGd3eonp7NaNS6CeYL5dyEQ3qA/CbI9xKrQME7ze7Tr50Z9yuVbcatzHMmV2ZE9EZAa7b2hNASUbsR4qTwOM/wFsQxjdl+f3qrxHgotH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/YSpi2hdOJXVBFpLoX4CnHShRqzkX1FAZslryFtQgc=;
 b=gR3XY6auSDefSCNMl/P0DR8IHhOgFVLkyPt10PNUGi5obvuLMPtlFfm2FTgLVqS1KEWraq7R8+i4jaVOk7I7Csq63VLUDoWhj1lIVd8lanxwvjij23Muwr26D3omQrq+tCn2KhPE3lc3dUUzGQ1kIXHorJgrM9nxTe06R3NEDl8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:13:12 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:13:12 +0000
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
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 11/11] tools/testing/selftests: add MREMAP_RELOCATE_ANON fork tests
Date: Sat,  3 May 2025 22:12:33 +0100
Message-ID: <86dbec8afa755c42641eaf6af676f1ef33e0e37b.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: fec0cf49-20c3-43c6-4057-08dd8a875005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Lnw+tsLw27xrJz117eYb0n40AAZmBut1zkDY03KmqhO+PKunxf5IuS/RpC9?=
 =?us-ascii?Q?PhkCvcMTfJUuZsWYAHGnW0gPUIgqKk6rHDOVQIgM2lfuIJLTSt0OfeAg4ydJ?=
 =?us-ascii?Q?zmKHODYFhvFGFQ3ryBO0r8g+7aZs+EWshjrPXsCd1ZRgE7UdYZtPcvlK5OEc?=
 =?us-ascii?Q?dNh39wCzUlUQsOyp+Q3RjbRsp3iYr0AnC2PpotYEnsTZA0G9y7nDlg925FBy?=
 =?us-ascii?Q?UT+BoW0N8IoApDpGLtMsbaGRCA6HbVqUTTSgAhEqc8EnxKt6D3qIOj5vAS/e?=
 =?us-ascii?Q?Twc/XP8ztEYc2Hq/pq4o/7+oLA4C76wgFvDMv27J1wQoIxHoMuMGQWa9KFC7?=
 =?us-ascii?Q?2SaMbx0SZAdeNbyyg8sYJNmPiVNuIxCEwT2yx1IakDBgJMQWBpkRKt8IrH9w?=
 =?us-ascii?Q?+/xkh8trwXZAkLoGuntYriFuE1PDEr6YVOk+9LqDnevFACRreahPTE5HmTVx?=
 =?us-ascii?Q?nMOLXrLyDeZWnpwy1AJ2KgWYSqiG0RBQOO8aly0/J3fVZYzSmrh7m42mJ0iH?=
 =?us-ascii?Q?5tIRWvmU+vD/HAbY73VJAt7tunehzMoVGmegOKOcDbNr97jGOFLklnM0CF50?=
 =?us-ascii?Q?kvMCugbbL4BvSgRmEa7myJ7dhZa5gqIaE6Vybh7pMdqSV5LBoeQ+lhymgzbz?=
 =?us-ascii?Q?yDqkqMWoUOirT2VNCrs/5v5E8m7Fj2hrxSsoyW+L07/LS0neBI2z0mhSsUxJ?=
 =?us-ascii?Q?7rz8gkTccDDoC5eKqNBpcyM1Inizjimx0uKxJZ+94KaagsvmvwEqBJwna0+Z?=
 =?us-ascii?Q?hnm6fnw7SHc2d5dSfhOe4iBMnL/zr0+o6s35yE38m1zsunIMflZ1JPHCBLi/?=
 =?us-ascii?Q?85ZnunsCbOabNdqWRi1xNqNyEFp+XYhttMxT9YuWnjw8wEiCvw4TgWeVhR8/?=
 =?us-ascii?Q?W/1hFRI75B19wxTn2wnSeK80AvbBwX0EnpE3GtclSwtEneEyjA7V6FecgjtK?=
 =?us-ascii?Q?CqP5ONLrBu8shJA7fQkULuvB9On+O2srBAXIasmRkCWb00w5b3Nv6olVE3V8?=
 =?us-ascii?Q?IbBPNnPa862oTI8US8A++GMh/8IUIkIaWwhjFklRJOlyDeyY2A91qk+P8Hso?=
 =?us-ascii?Q?fnCt9y0Xorbrdwv1os4j2VgBbKFsWf17AY2M9jcsKJvvFy+iiwcR/o42RprW?=
 =?us-ascii?Q?A5cMPirJylhveqhY9KmBAaR8e5WzGFUMoqLUPlNlg8OoVfpjAUh6XhPx7l5T?=
 =?us-ascii?Q?MC0Leeqotut9CcW3WkeGjGS/fgtL165qUE2TS3aY7M+tNx4RfPkywCRf3Zrn?=
 =?us-ascii?Q?Km+JyHmnpZcU7horWvQdMFZe1e+710gaF+LYFkERfxGtdfpx/El+MFvnskE1?=
 =?us-ascii?Q?6i5E0Kp9uuy+N4cROq/nvOtV18xeCO+cN9B/nB3JP0Mf/VqUuYcauEsOrPFq?=
 =?us-ascii?Q?hgBZ3gvDVOF/DDbMzG9mL5PfYfxoChtcuSjM3AthTZuk6JtJ4gcsYS5MbW1d?=
 =?us-ascii?Q?GLSvZyDXXQQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oj6Np7WbpEKrYfAnTJ9kY8XxpkXF1fBQE+y0EvxNsA8cUWlLyiN7nhtWttkc?=
 =?us-ascii?Q?A9/xdaxNN3BLK8QVc7IyTivzWgwHReUwD6NjbtNyxN9iojStF6uCJX123r1B?=
 =?us-ascii?Q?zecbGrNs5x58MzW8zJr7nIHoVXFpiv8w0GXsvjhkezsnoj6sq2LwOzqmoVEI?=
 =?us-ascii?Q?fVIaf8iArHVQjZ7ZxgWRDCThE7fdol04NuhwMvNTKNs+nfZKfU6QbX6OZaSN?=
 =?us-ascii?Q?TOZ3A3wi/F6NQZuwXWqtEgl38YLQK74j513vWOikw6Q6DgOVfn++CYKCvx1t?=
 =?us-ascii?Q?N9fyE2iU7rxmthmkat0voq1sJvi8ojeGuMTrds6euMbBEuBs3lgZPv1HFjqw?=
 =?us-ascii?Q?4OIFjh43GbWlRxaPj2PWfZ4ErPPHI4dLgNckxT7nw8Jwio0LvS6kcd4OZJtX?=
 =?us-ascii?Q?aWolaFVilJAqmYHWXGSp8Eu4AZ64pumA+5i4wzKl8U8xFLiupYiBDg5iyUuq?=
 =?us-ascii?Q?+xTngQrgk4k4KjkoYZHXNZGk597DCAn21Gk/3ugtnOMNZ5/md7utk6KDM0PJ?=
 =?us-ascii?Q?qlQRANtV1TsEnKQVAM5XYOUCumfLE8cv1mGWe6qeDFmVoNphuK40FwmOsDNs?=
 =?us-ascii?Q?x335jxODw9K34LsQ0v4VV6XhsoGGQqFnt0PCybmvxw4SUmBgLEp3QalsgN3n?=
 =?us-ascii?Q?QOltcOvxg8o32zW7gW78BklQRbZio7nS9xb83zaiY6U3YMjqrRW35xDHiQ91?=
 =?us-ascii?Q?WiFovPkPZE+lTDW3l6kiQVK/Azmmk4vGd0+kP/u4bYtuvMKOUZOdNdPjc4V8?=
 =?us-ascii?Q?EI4TqdfgF3jcuul2buj9jNfH3lKV4+kwrdLVpndFdVZi3HMQLlniZIfm5yAP?=
 =?us-ascii?Q?oke4L3BJMyWbf1RiYeGAylNhHk/Qicmlb0y9wnWf76CJht8Cwaro4ApW5wQS?=
 =?us-ascii?Q?lfJNA45bj5cuY2Jg7LTz3q0dwrprOw0svIXujXH8V7lY1T9KOUtsfJpR1x/C?=
 =?us-ascii?Q?4XVdSNTJfGvaqJyEp2SBSXY2yB0gAxW7CAEmBx6336Q7YjW7W+gsV5sDOXQc?=
 =?us-ascii?Q?hReEKM6xQqe1oMfp/X67eCgQCsSlYAiJIQ+hiTdXJuhyd+Ol6n5Gy36rmNbd?=
 =?us-ascii?Q?8E+9SBNoaVSJihGgfB7lexnVuvGGjktR3qkzYY0uBtdEKoZppL59mTAsjdbJ?=
 =?us-ascii?Q?rG0YBXg6JnFl6L8cA44+7XzOc2i/hAA5h/Vz9zScaYx/TYzzuwi/EojuMYOU?=
 =?us-ascii?Q?mIwCChdFsc/eZKNLCaya1+Rb/dA6C5kibtvy3SivvSkQ74nnm06u7xFnXFCW?=
 =?us-ascii?Q?39DRgwooMJufJsnRE4s9sufmrpx6lGUo+L9OLtiWqc+ReLkAj6HvYq81whan?=
 =?us-ascii?Q?gpVDwdwzc6R9qDzgmP0W2JkC1Zk//KGubnfNse55FsRYehuf4RuqHFeo1LBU?=
 =?us-ascii?Q?B/6FhceHaBZr0PFOWMEN51ZxYEiDUOz1jAHlyXorcNENTNv5MQWcu1Pk9vuy?=
 =?us-ascii?Q?zv2De6HIAdSCKXgnkgyNm1NDSlB+rME5wM3b06zqe7NfdEeLatJreOaYamnz?=
 =?us-ascii?Q?sOGii/ICX+zDgGpBfMezFEcu2L8k2YOb5Pu+rJg3T+xDSJQxIojDqOYyRLVo?=
 =?us-ascii?Q?UTI/RIazENXIZ9bI2IlKGpOHaxprVilwrypJF5dZmrxMiDGuR/EPKY+pylzN?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ax51iTOycdkANd6Y/0lWOa2Jy2wHkuY3ehy9u/j+V6hNRU/m4ZRzLsJavZobHaoBlHBg3aicwnD3QA6R3yO7cstVtfgXXsTBRCxIvg3I3cptNOL7GgXwLNiuV+x1nVs1iPyNWqORz6bqW+3IVkFARg7DocDNQaOGvSY933+H4/vENUEObE6u7BNWMXfZgthi/0bOdkMV9XEgli7kDuTUWp6Zz/Tn1MyGg3s3NhAnTQ/hk1DOkOI+ZROlWP3pCdrkddu5fFp0359Y5H6goiswNiOJDI8lmt75JOUmWsb6U2UKdzCgkTRAo4c0Pn/6qIzeDq7q8GvnJYmV1Ma+EsZVGn6utjdpSY/8Xdpbko4w2CSoQUPIgGAriu7C3rl59+Dx0mf73Vqte8jvOdzJB8LQa1g5sZtUyQod95CgjIGZ4NHLMWhP7JOLX/dJJIAisTrBifIOFSj//+U74HCicfS9dwXQsSwR7nwplm1eTPZbGH6j6U1rekb6gOAwNhfE3lLzFsuFmrARwxqUf9hhBDLKp+3ddOc9bzjIX3v2jqQsLjJcip+5YQaSq39ujjeMRAGzfZeItpe+scf98+vxzkbWIRMo2ZShNEqPWZ7FcrshM7Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec0cf49-20c3-43c6-4057-08dd8a875005
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:13:12.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7iF1HNXKXZf4dPijwJlU4Y1DjHjaSScUDm2zgtCXOlaWQGdtNDmVLr/mtvtEcAgU5IFgoM9uXxNU8vTDzPp8gjdegMMzGk9458LSCsF95w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030197
X-Authority-Analysis: v=2.4 cv=OYaYDgTY c=1 sm=1 tr=0 ts=68168700 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OgtH0bAP6xwZXywqETYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NiBTYWx0ZWRfXwrDkFxMiWnT0 haWVYfvL6nxDkw0x5RvynCbKrZ0FMmvaz///NWxpHgPjNWQhRBS8iH9Bgx8LKVM8L2qFxv3CZSZ Q+RTW8OjUVqJKEiVU06jNKTUbyNlnkSBQK/VENCj2F1x69TZEZRdMmeTOSvb2P6UxuX6QDQ/PBr
 h7mZ+1p0aALVrxCPhz00LvpiiBa7J6p39W56LxomwGNlDn11opLUUu7mlwUZbz/QJOXRmuyPon2 7/s7xK4nFBHF2ki2LszYPtr/2TlDpxguNWxUnzc2VFMqdKL3765nGq+UPtbF7nCWcbUmdW4HeAw 6fONGpJBGTh4k5llNgwvEI3j5P5dO+QNIX87+F2iT3OBeW7TLpo2BCPtW0aGU4TNM5P42ZMeFE2
 cSQ7SJXgNZk2SK5A0GEPEMComJCXKXdmun161ZQ2M90FQdqmaUM8mi0/J81LFQ2aVhVElxg3
X-Proofpoint-ORIG-GUID: N_4N5qmlFktGe24LXWxu3cx7GaJsbQ0G
X-Proofpoint-GUID: N_4N5qmlFktGe24LXWxu3cx7GaJsbQ0G

Add tests explicitly asserting that mremap() fails on forked VMAs whether
they have parent anon_vma's or whether they have child ones, as these are
cases where the folio might be mapped by multiple processes - in this case
we don't even try to relocate folio metadata, but rather simply disallow
the operation.

The tests use MREMAP_MUST_RELOCATE_ANON so we can detect the failure
correctly.

Were the mremap()'s to succeed, a merge would occur, so it remains
appropriate to keep these in the merge test suite.

We also explicitly test the anon_vma reuse case. This is one where a
munmap() occurs on a parent anon_vma which still has children. We keep the
empty anon_vma around, and then attempt to reuse it on the next fork of a
VMA whose anon_vma references this empty anon_vma.

Consider the first case over 3 forks:

FORK 3 TIMES ONE AFTER ANOTHER
==============================

Process 1

     |-------------|
     | avc*        v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|
     | anon_vma    ^
     |             |
     v     rb_root |
  |---------------------|
  | refcount = 1        |<--|
  | num_children = 1    |   |
  | num_active_vmas = 1 |---| parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|
     | anon_vma    ^
     |             |--------------------|
     v     rb_root |                    |
  |---------------------|               |
  | refcount = 2        | (self-parent) |
  | num_children = 2    |<--------------x----|
  | num_active_vmas = 1 |               |    |
  |---------------------|               |    |
                           |------------|    |
Process 2                  |                 |
                           |                 |
     |-------------|       |                 |
     | avc         v       v                 |
  |-----|   vma |-----| |-----|              |
  |  B  |<------| avc |.| avc |              |
  |-----|       |-----| |-----|              |
     | anon_vma    ^                         |
     |             |                         |
     v     rb_root |                         |
  |---------------------|                    |
  | refcount = 1        |                    |
  | num_children = 0    |--------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|        |--------------------------|
     | anon_vma    ^           |                          |
     |             |--------------------|                 |
     v     rb_root |                    |                 |
  |---------------------|               |                 |
  | refcount = 3        | (self-parent) |                 |
  | num_children = 2    |<--------------x----|            |
  | num_active_vmas = 1 |               |    |            |
  |---------------------|               |    |            |
                           |------------|    |            |
Process 2                  |                 |            |
                           |                 |            |
     |-------------|       |                 |            |
     | avc         v       v                 |            |
  |-----|   vma |-----| |-----|              |            |
  |  B  |<------| avc |.| avc |              |            |
  |-----|       |-----| |-----|              |            |
     | anon_vma    ^                         |            |
     |             |-------------------------x--------|   |
     v     rb_root |                         |        |   |
  |---------------------|                    |        |   |
  | refcount = 1        |<-------------------x----|   |   |
  | num_children = 1    |--------------------|    |   |   |
  | num_active_vmas = 1 | parent                  |   |   |
  |---------------------|                         |   |   |
                                                  |   |   |
Process 3                                         |   |   |
                           |----------------------x---|   |
     |-------------|       |       |--------------x-------|
     | avc         v       v       v              |
  |-----|   vma |-----| |-----| |-----|           |
  |  C  |<------| avc |.| avc |.| avc |           |
  |-----|       |-----| |-----| |-----|           |
     | anon_vma    ^                              |
     |             |                              |
     v     rb_root |                              |
  |---------------------|                         |
  | refcount = 1        |                         |
  | num_children = 0    |-------------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|             |---------------------------------|
  |  A  |<------| avc |             |                                 |
  |-----|       |-----|        |--------------------------|           |
     | anon_vma    ^           |                          |           |
     |             |--------------------|                 |           |
     v     rb_root |                    |                 |           |
  |---------------------|               |                 |           |
  | refcount = 4        | (self-parent) |                 |           |
  | num_children = 2    |<--------------x----|            |           |
  | num_active_vmas = 1 |               |    |            |           |
  |---------------------|               |    |            |           |
                           |------------|    |            |           |
Process 2                  |                 |            |           |
                           |                 |            |           |
     |-------------|       |                 |            |           |
     | avc         v       v                 |            |           |
  |-----|   vma |-----| |-----|              |            |           |
  |  B  |<------| avc |.| avc |              |            |           |
  |-----|       |-----| |-----|     |--------x------------x-------|   |
     | anon_vma    ^                |        |            |       |   |
     |             |-------------------------x--------|   |       |   |
     v     rb_root |                         |        |   |       |   |
  |---------------------|                    |        |   |       |   |
  | refcount = 1        |<-------------------x----|   |   |       |   |
  | num_children = 1    |--------------------|    |   |   |       |   |
  | num_active_vmas = 1 | parent                  |   |   |       |   |
  |---------------------|                         |   |   |       |   |
                                                  |   |   |       |   |
Process 3                                         |   |   |       |   |
                           |----------------------x---|   |       |   |
     |-------------|       |       |--------------x-------|       |   |
     | avc         v       v       v              |               |   |
  |-----|   vma |-----| |-----| |-----|           |               |   |
  |  C  |<------| avc |.| avc |.| avc |           |               |   |
  |-----|       |-----| |-----| |-----|           |               |   |
     | anon_vma    ^                              |               |   |
     |             |------------------------------x-----------|   |   |
     v     rb_root |                              |           |   |   |
  |---------------------|                         |           |   |   |
  | refcount = 1        |<------------------------x---|       |   |   |
  | num_children = 1    |-------------------------|   |       |   |   |
  | num_active_vmas = 1 | parent                      |       |   |   |
  |---------------------|                             |       |   |   |
                                                      |       |   |   |
Process 4                                             |       |   |   |
                           |--------------------------x-------|   |   |
     |-------------|       |       |------------------x-----------|   |
     | avc         v       v       v       v----------x---------------|
  |-----|   vma |-----| |-----| |-----| |-----|       |
  |  D  |<------| avc |.| avc |.| avc |.| avc |       |
  |-----|       |-----| |-----| |-----| |-----|       |
     | anon_vma    ^                                  |
     |             |                                  |
     v     rb_root |                                  |
  |---------------------|                             |
  | refcount = 1        |                             |
  | num_children = 0    |-----------------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

We can see that at no point do we lack either a raised num_children count
or anon_vma_chain list count.

Equally with anon_vma reuse:

FORK 3 TIMES ONE AFTER ANOTHER, UNMAPPING AFTER FORK FOR ANON_VMA REUSE
=======================================================================

Process 1

     |-------------|
     | avc*        v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|
     | anon_vma    ^
     |             |
     v     rb_root |
  |---------------------|
  | refcount = 1        |<--|
  | num_children = 1    |   |
  | num_active_vmas = 1 |---| parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|
     | anon_vma    ^
     |             |--------------------|
     v     rb_root |                    |
  |---------------------|               |
  | refcount = 2        | (self-parent) |
  | num_children = 2    |<--------------x----|
  | num_active_vmas = 1 |               |    |
  |---------------------|               |    |
                           |------------|    |
Process 2                  |                 |
                           |                 |
     |-------------|       |                 |
     | avc         v       v                 |
  |-----|   vma |-----| |-----|              |
  |  B  |<------| avc |.| avc |              |
  |-----|       |-----| |-----|              |
     | anon_vma    ^                         |
     |             |                         |
     v     rb_root |                         |
  |---------------------|                    |
  | refcount = 1        |                    |
  | num_children = 0    |--------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|        |--------------------------|
     | anon_vma    ^           |                          |
     |             |--------------------|                 |
     v     rb_root |                    |                 |
  |---------------------|               |                 |
  | refcount = 3        | (self-parent) |                 |
  | num_children = 2    |<--------------x----|            |
  | num_active_vmas = 1 |               |    |            |
  |---------------------|               |    |            |
                           |------------|    |            |
Process 2                  |                 |            |
                           |                 |            |
     |-------------|       |                 |            |
     | avc         v       v                 |            |
  |-----|   vma |-----| |-----|              |            |
  |  B  |<------| avc |.| avc |              |            |
  |-----|       |-----| |-----|              |            |
     | anon_vma    ^                         |            |
     |             |-------------------------x--------|   |
     v     rb_root |                         |        |   |
  |---------------------|                    |        |   |
  | refcount = 1        |<-------------------x----|   |   |
  | num_children = 1    |--------------------|    |   |   |
  | num_active_vmas = 1 | parent                  |   |   |
  |---------------------|                         |   |   |
                                                  |   |   |
Process 3                                         |   |   |
                           |----------------------x---|   |
     |-------------|       |       |--------------x-------|
     | avc         v       v       v              |
  |-----|   vma |-----| |-----| |-----|           |
  |  C  |<------| avc |.| avc |.| avc |           |
  |-----|       |-----| |-----| |-----|           |
     | anon_vma    ^                              |
     |             |                              |
     v     rb_root |                              |
  |---------------------|                         |
  | refcount = 1        |                         |
  | num_children = 0    |-------------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

UNMAP B

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|
  |  A  |<------| avc |
  |-----|       |-----|        |--------------------------|
     | anon_vma    ^           |                          |
     |             |------------                          |
     v     rb_root |                                      |
  |---------------------|                                 |
  | refcount = 3        | (self-parent)                   |
  | num_children = 2    |<-------------------|            |
  | num_active_vmas = 1 |                    |            |
  |---------------------|                    |            |
                                             |            |
Process 2                                    |            |
                                             |            |
                   |-------------------------x--------|   |
           rb_root |                         |        |   |
  |---------------------|                    |        |   |
  | refcount = 1        |<-------------------x----|   |   | We keep empty
  | num_children = 1    |--------------------|    |   |   | anon_vma round.
  | num_active_vmas = 0 | parent                  |   |   |
  |---------------------|                         |   |   |
                                                  |   |   |
Process 3                                         |   |   |
                           |----------------------x---|   |
     |-------------|       |       |--------------x-------|
     | avc         v       v       v              |
  |-----|   vma |-----| |-----| |-----|           |
  |  C  |<------| avc |.| avc |.| avc |           |
  |-----|       |-----| |-----| |-----|           |
     | anon_vma    ^                              |
     |             |                              |
     v     rb_root |                              |
  |---------------------|                         |
  | refcount = 1        |                         |
  | num_children = 0    |-------------------------|
  | num_active_vmas = 1 | parent
  |---------------------|

FORK

Process 1

     |-------------|
     | avc         v
  |-----|   vma |-----|             |-----------------------------|
  |  A  |<------| avc |             |                             |
  |-----|       |-----|        |--------------------------|       |
     | anon_vma    ^           |                          |       |
     |             |-----------|                          |       |
     v     rb_root |                                      |       |
  |---------------------|                                 |       |
  | refcount = 3        | (self-parent)                   |       |
  | num_children = 2    |<-------------------|            |       |
  | num_active_vmas = 1 |                    |            |       |
  |---------------------|                    |            |       |
                                             |            |       |
Process 2               |--------------------x------------x-------x-------|
                        |                    |            |       |       |
                   |-------------------------x--------|   |       |       |
           rb_root |                         |        |   |       |       |
  |---------------------|<-------------------x--------x---x-------x---|   |
  | refcount = 1        |<-------------------x----|   |   |       |   |   |
  | num_children = 1    |--------------------|    |   |   |       |   |   |
  | num_active_vmas = 1 | parent                  |   |   |       |   |   |
  |---------------------|                         |   |   |       |   |   |
                                                  |   |   |       |   |   |
Process 3                                         |   |   |       |   |   |
                           |----------------------x---|   |       |   |   |
     |-------------|       |       |--------------x-------|       |   |   |
     | avc         v       v       v              |               |   |   |
  |-----|   vma |-----| |-----| |-----|           |               |   |   |
  |  C  |<------| avc |.| avc |.| avc |           |               |   |   |
  |-----|       |-----| |-----| |-----|           |               |   |   |
     | anon_vma    ^                              |               |   |   |
     |             |------------------------------x-----------|   |   |   |
     v     rb_root |                              |           |   |   |   |
  |---------------------|                         |           |   |   |   |
  | refcount = 1        |                         |           |   |   |   |
  | num_children = 0    |-------------------------|           |   |   |   |
  | num_active_vmas = 1 | parent                              |   |   |   |
  |---------------------|                                     |   |   |   |
                                                              |   |   |   |
Process 4                                                     |   |   |   |
                           |----------------------------------|   |   |   |
     |-------------|       |       |------------------------------|   |   |
     | avc         v       v       v                                  |   |
  |-----|   vma |-----| |-----| |-----|                               |   |
  |  D  |<------| avc |.| avc |.| avc |                               |   |
  |-----|       |-----| |-----| |-----|                               |   |
     | anon_vma    ^                                                  |   |
     |             |--------------------------------------------------x---|
     |                                                                |
     |----------------------------------------------------------------|

We reuse the empty anon_vma from VMA B. Note that process 3 is now parented
to process 4's (and 2's) anon_vma.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/merge.c | 361 +++++++++++++++++++++++++++++
 1 file changed, 361 insertions(+)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index 8d70c24b4303..25731482a5b4 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -2,6 +2,7 @@

 #define _GNU_SOURCE
 #include "../kselftest_harness.h"
+#include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -10,11 +11,18 @@
 #include "vm_util.h"
 #include <linux/mman.h>

+enum poll_action {
+	POLL_TASK_RUN,
+	POLL_TASK_WAIT,
+	POLL_TASK_EXIT,
+};
+
 FIXTURE(merge)
 {
 	unsigned int page_size;
 	char *carveout;
 	struct procmap_fd procmap;
+	volatile enum poll_action *ipc;
 };

 FIXTURE_SETUP(merge)
@@ -26,12 +34,18 @@ FIXTURE_SETUP(merge)
 	ASSERT_NE(self->carveout, MAP_FAILED);
 	/* Setup PROCMAP_QUERY interface. */
 	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
+
+	/* Quick and dirty IPC. */
+	self->ipc = (volatile enum poll_action *)mmap(NULL, self->page_size,
+			PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	ASSERT_NE(self->ipc, MAP_FAILED);
 }

 FIXTURE_TEARDOWN(merge)
 {
 	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
 	ASSERT_EQ(close_procmap(&self->procmap), 0);
+	ASSERT_EQ(munmap((void *)self->ipc, self->page_size), 0);
 }

 TEST_F(merge, mprotect_unfaulted_left)
@@ -1777,4 +1791,351 @@ TEST_F(merge, mremap_relocate_anon_mprotect_faulted_faulted)
 	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
 }

+TEST_F(merge, mremap_relocate_anon_single_fork)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	volatile enum poll_action *poll = self->ipc;
+	char *ptr, *ptr2;
+	pid_t pid2;
+	int err;
+
+	/*
+	 * .           .           .
+	 * . |-------| .           .  Map A, fault in and
+	 * . |   A   |-.-----|     .  fork process 1 to
+	 * . |-------| .     |     .  process 2.
+	 * .           .     v     .
+	 * .           . |-------| .
+	 * .           . |   B   | .
+	 * .           . |-------| .
+	 * .           .           .
+	 * . Process 1 . Process 2 .
+	 */
+	ptr = mmap(carveout, 3 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/* Fault it in. */
+	ptr[0] = 'x';
+
+	pid2 = fork();
+	ASSERT_NE(pid2, -1);
+	/* Parent process. */
+	if (pid2 != 0) {
+		/* mremap() fails due to forked children. */
+		ptr2 = sys_mremap(ptr, page_size, page_size,
+				  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+				  &carveout[3 * page_size]);
+		err = errno;
+		ASSERT_EQ(ptr2, MAP_FAILED);
+		ASSERT_EQ(err, EFAULT);
+
+		poll[0] = POLL_TASK_EXIT;
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 2. */
+
+	/* mremap() fails due to forked parents. */
+	ptr2 = sys_mremap(ptr, page_size, page_size,
+		MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+		&carveout[3 * page_size]);
+	err = errno;
+	ASSERT_EQ(ptr2, MAP_FAILED);
+	ASSERT_EQ(err, EFAULT);
+
+	/* Wait for parent to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+}
+
+TEST_F(merge, mremap_relocate_anon_fork_twice)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	volatile enum poll_action *poll = self->ipc;
+	char *ptr, *ptr2;
+	pid_t pid2, pid3;
+	int err;
+
+	/*
+	 * .           .           .
+	 * . |-------| .           .  Map A, fault in and
+	 * . |   A   |-.-----|     .  fork process 1 to
+	 * . |-------| .     |     .  process 2.
+	 * .           .     v     .
+	 * .           . |-------| .
+	 * .           . |   B   | .
+	 * .           . |-------| .
+	 * .           .           .
+	 * . Process 1 . Process 2 .
+	 */
+	ptr = mmap(carveout, 3 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/* Fault it in. */
+	ptr[0] = 'x';
+	pid2 = fork();
+	ASSERT_NE(pid2, -1);
+	/* If parent process, simply wait. */
+	if (pid2 != 0) {
+		while (true) {
+			if (poll[0] == POLL_TASK_EXIT)
+				break;
+			if (poll[0] == POLL_TASK_WAIT)
+				continue;
+
+			/* mremap() fails due to forked children. */
+			ptr2 = sys_mremap(ptr, page_size, page_size,
+					  MREMAP_MAYMOVE | MREMAP_FIXED |
+					  MREMAP_MUST_RELOCATE_ANON,
+					  &carveout[3 * page_size]);
+			err = errno;
+			ASSERT_EQ(ptr2, MAP_FAILED);
+			ASSERT_EQ(err, EFAULT);
+
+			/* Strictly, should be atomic. */
+			if (poll[0] == POLL_TASK_RUN)
+				poll[0] = POLL_TASK_WAIT;
+		}
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 2. */
+
+	/* Wait for parent to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+
+	/*
+	 * .           .           .           .
+	 * . |-------| .           .           .
+	 * . |   A   | .           .           .
+	 * . |-------| .           .           .
+	 * .           .           .           .
+	 * .           . |-------| .           . Fork process 2 to
+	 * .           . |   B   |-.-----|     . process 3.
+	 * .           . |-------| .     |     .
+	 * .           .           .     v     .
+	 * .           .           . |-------| .
+	 * .           .           . |   C   | .
+	 * .           .           . |-------| .
+	 * .           .           .           .
+	 * . Process 1 . Process 2 . Process 3 .
+	 */
+	pid3 = fork();
+	ASSERT_NE(pid3, -1);
+	/* If parent process, simply wait. */
+	if (pid3 != 0) {
+		/* mremap() fails due to forked children. */
+		ptr2 = sys_mremap(ptr, page_size, page_size,
+				  MREMAP_MAYMOVE | MREMAP_FIXED |
+				  MREMAP_MUST_RELOCATE_ANON,
+				  &carveout[3 * page_size]);
+		err = errno;
+		ASSERT_EQ(ptr2, MAP_FAILED);
+		ASSERT_EQ(err, EFAULT);
+
+		/* We don't retrigger, so just indicate we're done. */
+		poll[1] = POLL_TASK_EXIT;
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 3. */
+
+	/* Trigger root mremap(). */
+	poll[0] = POLL_TASK_RUN;
+	/* Wait for parents to finish. */
+
+	while (poll[0] == POLL_TASK_RUN)
+		;
+	while (poll[1] == POLL_TASK_RUN)
+		;
+
+	/* mremap() fails due to forked parents. */
+	ptr2 = sys_mremap(ptr, page_size, page_size,
+		MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+		&carveout[3 * page_size]);
+	err = errno;
+	ASSERT_EQ(ptr2, MAP_FAILED);
+	ASSERT_EQ(err, EFAULT);
+	/* Kill waiting parent. */
+	poll[0] = POLL_TASK_EXIT;
+}
+
+TEST_F(merge, mremap_relocate_anon_3_times_reuse_anon_vma)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	volatile enum poll_action *poll = self->ipc;
+	char *ptr, *ptr2;
+	pid_t pid2, pid3, pid4;
+	int err;
+
+	/*
+	 * .           .           .
+	 * . |-------| .           .  Map A, fault in and
+	 * . |   A   |-.-----|     .  fork process 1 to
+	 * . |-------| .     |     .  process 2.
+	 * .           .     v     .
+	 * .           . |-------| .
+	 * .           . |   B   | .
+	 * .           . |-------| .
+	 * .           .           .
+	 * . Process 1 . Process 2 .
+	 */
+	ptr = mmap(carveout, 3 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	/* Fault it in. */
+	ptr[0] = 'x';
+	pid2 = fork();
+	ASSERT_NE(pid2, -1);
+	/* If parent process, simply wait. */
+	if (pid2 != 0) {
+		while (true) {
+			if (poll[0] == POLL_TASK_EXIT)
+				break;
+			if (poll[0] == POLL_TASK_WAIT)
+				continue;
+
+			/* mremap() fails due to forked children. */
+			ptr2 = sys_mremap(ptr, page_size, page_size,
+					  MREMAP_MAYMOVE | MREMAP_FIXED |
+					  MREMAP_MUST_RELOCATE_ANON,
+					  &carveout[3 * page_size]);
+			err = errno;
+			ASSERT_EQ(ptr2, MAP_FAILED);
+			ASSERT_EQ(err, EFAULT);
+
+			if (poll[0] == POLL_TASK_RUN)
+				poll[0] = POLL_TASK_WAIT;
+		}
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 2. */
+
+	/* Wait for parent to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+
+	/*
+	 * .           .           .           .
+	 * . |-------| .           .           .
+	 * . |   A   | .           .           .
+	 * . |-------| .           .           .
+	 * .           .           .           .
+	 * .           . |-------| .           . Fork process 2 to
+	 * .           . |   B   |-.-----|     . process 3.
+	 * .           . |-------| .     |     .
+	 * .           .           .     v     .
+	 * .           .           . |-------| .
+	 * .           .           . |   C   | .
+	 * .           .           . |-------| .
+	 * .           .           .           .
+	 * . Process 1 . Process 2 . Process 3 .
+	 */
+	pid3 = fork();
+	ASSERT_NE(pid3, -1);
+	/* If parent process, simply wait. */
+	if (pid3 != 0) {
+		/*
+		 * We only try to mremap once, before unmapping so we can
+		 * trigger reuse of B's anon_vma.
+		 */
+		/* mremap() fails due to forked children. */
+		ptr2 = sys_mremap(ptr, page_size, page_size,
+				  MREMAP_MAYMOVE | MREMAP_FIXED |
+				  MREMAP_MUST_RELOCATE_ANON,
+				  &carveout[3 * page_size]);
+		err = errno;
+		ASSERT_EQ(ptr2, MAP_FAILED);
+		ASSERT_EQ(err, EFAULT);
+
+		/*
+		 * .           .           .           .
+		 * . |-------| .           .           .
+		 * . |   A   | .           .           .
+		 * . |-------| .           .           .
+		 * .           .           .           .
+		 * .           .           .           . Unmap VMA B, but
+		 * .           .           .           . anon_vma is left
+		 * .           .           .           . around.
+		 * .           .           .           .
+		 * .           .           . |-------| .
+		 * .           .           . |   C   | .
+		 * .           .           . |-------| .
+		 * .           .           .           .
+		 * . Process 1 . Process 2 . Process 3 .
+		 */
+		munmap(ptr, 3 * page_size);
+
+		/* We indicate we're done so child waits for */
+		poll[1] = POLL_TASK_EXIT;
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 3. */
+
+	/* Trigger root mremap(). */
+	poll[0] = POLL_TASK_RUN;
+	/* Wait for parents to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+	while (poll[1] == POLL_TASK_RUN)
+		;
+
+	pid4 = fork();
+	ASSERT_NE(pid4, -1);
+
+	if (pid4 != 0) {
+		/* mremap() fails due to forked children. */
+		ptr2 = sys_mremap(ptr, page_size, page_size,
+				  MREMAP_MAYMOVE | MREMAP_FIXED |
+				  MREMAP_MUST_RELOCATE_ANON,
+				  &carveout[3 * page_size]);
+		err = errno;
+		ASSERT_EQ(ptr2, MAP_FAILED);
+		ASSERT_EQ(err, EFAULT);
+
+		/* We don't retrigger, so just indicate we're done. */
+		poll[2] = POLL_TASK_EXIT;
+
+		wait(NULL);
+		return;
+	}
+
+	/* This is process 4. */
+
+	/* Trigger root mremap(). */
+	poll[0] = POLL_TASK_RUN;
+	/* We unmapped VMA B, so nothing to trigger there. */
+	/* Wait for parents to finish. */
+	while (poll[0] == POLL_TASK_RUN)
+		;
+	while (poll[2] == POLL_TASK_RUN)
+		;
+
+	/* mremap() fails due to forked parents. */
+	ptr2 = sys_mremap(ptr, page_size, page_size,
+		MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+		&carveout[3 * page_size]);
+	err = errno;
+	ASSERT_EQ(ptr2, MAP_FAILED);
+	ASSERT_EQ(err, EFAULT);
+	/* Kill waiting parent. */
+	poll[0] = POLL_TASK_EXIT;
+}
+
 TEST_HARNESS_MAIN
--
2.49.0

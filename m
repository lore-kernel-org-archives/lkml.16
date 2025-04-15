Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9CD275100
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744697708; cv=fail; b=aT2u7NE85B3gQ+PhotcZpdWGsXNtA5+2uSH+1MZJisjawjfEFPQhrMK0qDnlj4WWBRH/jZqNoxtiq1dal7gAHpc/RNKrJSZr4h+rNOEgqWv643bhuwSnEobMmZS02Gy1QSKfVR1FhljXgoIF+61dZBzkX3L7+5AT5dmNuIg9NnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744697708; c=relaxed/simple;
	bh=xhLqILD/BAglXCFeW2yXoSLLOeUDdCVUHF/2j3NS4Q4=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=sjW4BcoGl4ZIp9gr6smCmIduyKhciiuAnFZQ5Z+/uUjMF0vwSsHf6kdDtpQfS1YSkXgh4MoF4stEcVp4LiKBJnmUYnAO2TqN8CT60pKdG0phYx5K2Bo45QQpV3BT0qhkgpVEk7b+uSgIwhFP6nl1BB0h0x06KwPkaHo/wkJCFSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SKLjFJKb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v2dXCSoA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SKLjFJKb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v2dXCSoA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ELBmcq022799;
	Tue, 15 Apr 2025 06:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=z8ukK0dk5cQi5AsFm2
	hibNAd2XZy9+pbLSds8SeKDYU=; b=SKLjFJKbf7UEXhp7d/6nK3sJADOnO7QvcU
	hhoU/kDwsf7GCGwWva3p/cuChgLi2UFcPnyLar24hz9jkMp+ehEpVg5XmkgucTq3
	x4hTm0MgNtKVwaLdRZH/eYgfF7F4qEFwSFfY1Tx/JldWde6yX+kEmZcVZx/hp6sv
	0x3SS8gBXJZEdad0T0/49Np1B9Cy1bcCSCg/Ag6+x+0GlFNlwXZWOzRtC3mI7qmG
	XW9OrmfpGk4LIhmdamGwBPUf6aVfBbbt77kMbv82Fnhdu6PZJ4V1qU4jHPv8zXGQ
	rbQq6jxuw9XXO9pDxH2Yvtu8wdgwyU1nK9CXjQTTBDErhV3SMS1w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180w901w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 06:14:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53F5hSk6009227;
	Tue, 15 Apr 2025 06:14:23 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010003.outbound.protection.outlook.com [40.93.20.3])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3hgxjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 06:14:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWaxsvzs0Lhikew1FrPhYZbzUjAt8anm+/qfPPaHGY+ebLLBhU/vtRD7H/Gav81MdpFvQrm6yOAvIvwFXrEc2j7qYSzsRuUSNh02JbBXlTZIQfjZJjAMxLeyvu43dr0hRRTnLhQLE0eQn2SXAviGGG7i9JEsK5SZMo/je80naM8iA6LIBA6jxGi/QmCMvosUgbFhRW13c4GA9W4EU61DnQC4qC7CTpLvMDOjrescJr8P/j6NWnie20nsngiaVmh43VK+aELQ7GTrzlT6AdDXHYGCIedWxOreyEynk/dMGrIZ561+OqVsn9H0Qdq+0zGt0Yr8v2F3EsWHetqzvNS95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8ukK0dk5cQi5AsFm2hibNAd2XZy9+pbLSds8SeKDYU=;
 b=OuZQ4cguFWBHAG7410xTXrmg59Fq8GSqFv7j8+DmBNfY9l7bTeomqxWL4Gtqz2tcB8cnAnYftkFNKGAYFBF4UUjFvsHmxZhF7+C/pU1bqoDlEALfi9uNnl7yv5NYRJOHU+l3ql6JTWjAspcxTeSUAbnDokn+HCnZyxzkoQPn9yiYnjEQ/ewqyOQ/AqHeRmZu0rhzTlhdMTNHRGmxUMHoVJ4zj/QwZ3lqPQ07eF4x7RUJkESBUmG5v/xYS2nTryy4A7saTA0m7E+so+h2aGg+yZ885EFx6gMJTqP10uhcMwDSNBiBgHs/KPM3E6RdmsULOuJZEnw3RXYM+fjhEmENVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8ukK0dk5cQi5AsFm2hibNAd2XZy9+pbLSds8SeKDYU=;
 b=v2dXCSoA1Cz6BHfhg81Y40lZQeu7eYbc3mb6bF3i7+XbCo3wV5SEKXVzBCfhybIi2lL06J7ZPUJ5vR+tBgPQJCaCKt3oHkiKuGGkkEUJb/wESgFN8YN9Yekac4rImARhJX1yWRXUufGr3xVgO2UnmBQif1j78P1toubFIkpd9ZE=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6414.namprd10.prod.outlook.com (2603:10b6:806:259::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 06:14:20 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 06:14:20 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
 <Z_yr_cmXti4kXHaX@gmail.com>
 <20250414110259.GF5600@noisy.programming.kicks-ass.net>
 <pf2p3ugs3blztd5jtxuwrg3hc3qldc4a7lfpigf24tit5noyik@67qhychq2b77>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, paulmck@kernel.org,
        rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
In-reply-to: <pf2p3ugs3blztd5jtxuwrg3hc3qldc4a7lfpigf24tit5noyik@67qhychq2b77>
Date: Mon, 14 Apr 2025 23:14:18 -0700
Message-ID: <87h62qymrp.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:303:b6::6) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: da4d1820-94be-4272-067f-08dd7be4c204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EeA4oChX3l3dKAJF8HMK7ADzre3F/NhaDst7zwIo3YCUWIFvXcSt4oHzCgG7?=
 =?us-ascii?Q?PY9ZHaJPLZwxs1ptCg7RXB5IhtTlhg77a9RPJOJinRKK0Wu+4DjirHB5YzbL?=
 =?us-ascii?Q?ctiyP1tf98UTX/1VvV1UVM64AP/PAX/65BIzHyxLPYwkv4tM8nJP+lKMgGM3?=
 =?us-ascii?Q?5jf7vwQE8pBtQjS3IB9TR52aXBeeRxRYbAhuQoENzfmj1Llenx1z664WEjNt?=
 =?us-ascii?Q?P+/kanWM0GTZzy/pQAmyGHXCC1syp9xqEecYx1iRN/rkjlfjoL9N+w0cABj9?=
 =?us-ascii?Q?GPPOf6bsPuTeVxy3LwDSlRzaoZ4WeMHgjZoBvfCtECb4SAY5IlPmXgepFyvD?=
 =?us-ascii?Q?kRgXg9GGms4YDbPvSMUoWfWsqb+fvVkUNbhNokZoJZ51lLutJWlj9eADx3pX?=
 =?us-ascii?Q?VxF+tMrFLXb3qS6MVRF1Z7yCpxU748oSFU5Gff5KALj/1Ye/DEampM/LmPVc?=
 =?us-ascii?Q?aHA+owGbVJmFx35sYvXW1gbIdxBZCg9Vlhe/nXDtUV19Y6jJM4gyC/9ol7Qc?=
 =?us-ascii?Q?7XZub0zyr27hVBBt1ahVOAQUEe3LZywZNFDWzqlMS7xLM6V9l8RflNJSEmTd?=
 =?us-ascii?Q?IP/RC8/GG32Kh66cTMTU8iYVCeMG6YyhbO03XIy2+EO8HCsR7owG33WKGfb8?=
 =?us-ascii?Q?HZHnohVftUf26jaDoqbINCjFrXkg8QTKfuiruQqKP1wWBEc8nuoQMZIvyPVH?=
 =?us-ascii?Q?gFFoNS3LGEgkVtvA/WAovhIZwFa8bhwCGnStHHF0buisqCWzqLyP4C6pEJUo?=
 =?us-ascii?Q?Sfp7XRxqjo2sPqFIuu13r+MFElzGL6UPx3Pgrx62692NtwA7G9+WgkuF/m/t?=
 =?us-ascii?Q?Z0pSTY49OXFJQNKvaVeE+nNrutfjhFtQ3YvlCTcWMxw+5F0zhOMNO0q36WgA?=
 =?us-ascii?Q?dnZLx/tfX0vL3idvzuto/Awq3BRR+DL423aeNoxTNVxHpshZd06d2ipAKat9?=
 =?us-ascii?Q?wtaOfFOxsvB8KqjbVyX7HjlIUQeAuyqQbCDa4RbXzRTxlMD8PQtGDIiR2Sxf?=
 =?us-ascii?Q?EIzB25Rd+kyEp5I3F72FHjGBGXMZeQ3Y6ErCP0p6yxjv4HJ16AaV2vg4zTja?=
 =?us-ascii?Q?uXEZZ1dyA1/DNfquhDNtXxGZzcL+pFWyrD+oJiAoyNMDV12n/Xx1icEehC1/?=
 =?us-ascii?Q?AQuyw+JA2A7lvAwog6l6mFE+8odh9JjeHxBeiO5QGWwjMaIEbqDH//wskzq2?=
 =?us-ascii?Q?jDbGs1GgT7FSPMmRA0LyoBOOrs4n+ZGkBmiNt+rQXxxpqUUOxdrqmv43xFe8?=
 =?us-ascii?Q?k+dZJs4ls3txBAiMFxRjusJtDo4Cd5/eC0N0neMmnVkqojB+T3iOdPHgwstz?=
 =?us-ascii?Q?/dMRQw3CsoY5OJullkCHID/qwpR/uCD4GLeSRlPpOYViGBQxWriNaLOce08B?=
 =?us-ascii?Q?6Lpt1uOAribVKJf0ZGjOAaOa6TwrLd5teas/DjJCHmuh3BjX6CILUtDx31yv?=
 =?us-ascii?Q?VToJCqoFR4o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KAbTGgXKmSlb/AgV9kZQN4ZrfhxB7hVoiOaX+CQU120NPKu/P4NC6wz9P9E1?=
 =?us-ascii?Q?MTthtzdeAYySM6SQNEs+voMXc44EsLpd17eVMqt9p+az2yF25Aa8Jv6GpBOa?=
 =?us-ascii?Q?S0r3o9fALvZ9D4uDpy9xpipUwhbWQzr90AhdIFjZgFMgOBsNcEZ9ZPrXVntn?=
 =?us-ascii?Q?/ihCvTpxgI2tajWeoWdN7bvkMIXntk3ILAeDVQORl+vo3ZA8u41C9NOpoG4O?=
 =?us-ascii?Q?N8zeNmI9rHEWGJ0eCnA+Y3xI40ejoteio/Mh0rTrxECTmgISpQ3fCKO81QzF?=
 =?us-ascii?Q?ees+mpJlbDC53wJWRjcX8Tt/xC0Telbv/lXxlwXj7lyIk2nOIk13Nayss01x?=
 =?us-ascii?Q?O7j6/fsTZUz4Wni9htI6sWry8N6pMnih0Qc1Kgl40/dkSGiRAvwa5LqWvKNh?=
 =?us-ascii?Q?4ygoqoV12OYv9h9IU8Qm3j92i6eAUW8g2kV2yo+Y1YCvzdmuwAs0ZXsJhOva?=
 =?us-ascii?Q?wcdNk+UJzy2vnc8cTBj3IbSU0uF84IpxhHeRKcLkcD0Th23jJYdN4hl0WWws?=
 =?us-ascii?Q?aO1TZpqoUhuUUq37IbWVgmetn46FHmlxf2IjK5VRKR+ZU09ny5b2o+0oSvJ4?=
 =?us-ascii?Q?fnzMKvDQBjrzqCUlE5QGGqSif5zW4lfLmQp22qarBl/x9yP4bLz/MAHnE5mK?=
 =?us-ascii?Q?AKQecEmB1qg5ibrbuy7X+OyIFii3xHeg2aVFXGtjeeKxvnHdtW0FexSgZTzo?=
 =?us-ascii?Q?gTYkivuzIjwMz8SLmro1ksCE5t+i/45IN5U219SAUgvyI7eD9HZBI3Tjb2XJ?=
 =?us-ascii?Q?QWRhk5TAhzFgkcBZ29noV+siMezgoZF/QRWKyc5h7ESJ2icaT7kwF0KMflRE?=
 =?us-ascii?Q?LxmEmGBzE+lTcHhrX+48O3TFvXB3hu4mxZl1xqls3Bm/WFfbQzh2dSdB7JJP?=
 =?us-ascii?Q?Ai/HLCKcP19a7S8PO0GY9ET86P7qOsacjlEKdDntRKvyTQdU8claQfuKYFDF?=
 =?us-ascii?Q?YvTTDHeNmJx19V3H+sbs2UdzBhEH1JA5LUDAWYl3TBl3c/d0cb3XDQTA1W+0?=
 =?us-ascii?Q?y+VfVjbB1eTAmm5957pm5h36n58MCIotTKxgT+XQzrY/54xsyTES32P8hNjc?=
 =?us-ascii?Q?ejA+BlqP6mV73QYqaGNZwSeOZ53dPBAv0qZAjNbCZ7N1Lh4GGPdvHBxdSoT9?=
 =?us-ascii?Q?1fu1Gm4Ido/AWKm3dsOiN6ysrl7yFv1A0AaNIrFSrczvIjxfYU48c2arY94l?=
 =?us-ascii?Q?UObq6neKNuMBgk44QEHeLtYUBcs+hVBQdnTZ1/ulGMy+ARMaLaN1uv5gpQGY?=
 =?us-ascii?Q?3+aUbDtUYXEwuK2N0AaT8hzxD+PMt3zevSVKklsjKMN73veO0Rq2F7zJJ51m?=
 =?us-ascii?Q?dzJYT+I0VS06/naTVwO9e+8SLNJWsxmugnI8Q31ng2KE8ojZY+mDtgcruHKD?=
 =?us-ascii?Q?tF8dfrrxwf7J4WzxjQouwrgoQgpglFoa5I1NO1m6ZJJtMyBYXFRe3Oyt3zw0?=
 =?us-ascii?Q?Is9uq6Bj1ESsrJq1N/1Aje8sO97PE+ccVmVYo7IfDy1CS+B0MDDxzaNTeAFn?=
 =?us-ascii?Q?lzQ2qurkzYyThVtcz8X2tomplBycm90PR+BMoZ1lMpYIWACBbyaGN07ipZ+o?=
 =?us-ascii?Q?Ff/+22Uo3lnLVrXxBHZBGOovQXDhBMc/UP8umlnRCdfL8V3nzK15JEcLyERN?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ndidg2koidXTMsOmXp24KyK6MxMI6RAxZKstu7UTdtC9qdHsnjCpd1c32L85t1fA4piaZ1HjBnnqKKEI6YTMZAizZNXNDvhVOOgPsoZKyemtUoklaXDUEhIb5Trwb7qyzpak/n96RDxAw5ybw/DZsvgo+ALsK+0pfF5o2BHoDPZxVSzeXBuOSPeX69zpYoI975SJ1GLSKIOwQ7Gxi7hqYGrlovlr87Nd91dMwhTGWwezjWxuGhXN65fVF+x9F6f9yZEpQzf2EkZnDfKOw1bma0i0M3os+kMcjsy7VhyJCMWkBSAVzj6gyLMWeUUpTY//m5ixcfcNTpoyX9NazRyZbiZYCWYOB2mZJtwABSnz+IWHjOEyiGA0QkrUkJcsGZjl8dz3uKkSOgYL74EdKo6u9c7TtsHBOSZp9fr/nF6thr9t3jn8MV8SRKtgAvbL9rug0o7+XdeQ0eVnpbbbFASAwPM51JP1KNvPzq+gTQirU2FfE1e7DahGRIuhjnXZpsDVeexh+T7GPj67zB4CbpixrIHPgncD98TbiP9fF3E0oDjMxcq/WcJ5kx7nHXA3oki6oCPSkd8uEiaijCn95ucpudGjV6XZGaJB2RThVdmqp94=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4d1820-94be-4272-067f-08dd7be4c204
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 06:14:20.5786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1vnVlLqGhenu1tJEhhC2UqbkcMOlv9SjZZftwnmAks11zS9YpNXgsQjs1aKh1dKJc8kG915V7zULrcvkUBzCj30v5qJS/98FlXwbmYEmQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6414
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150040
X-Proofpoint-ORIG-GUID: JF9lmiu0vc6bJXGCxCXJ5lqSLn7Imvfb
X-Proofpoint-GUID: JF9lmiu0vc6bJXGCxCXJ5lqSLn7Imvfb


Mateusz Guzik <mjguzik@gmail.com> writes:

> On Mon, Apr 14, 2025 at 01:02:59PM +0200, Peter Zijlstra wrote:
>> This symbol is written as a C function with C calling convention, even
>> though it is only meant to be called from that clear_page() alternative.
>>
>> If we want to go change all this, then we should go do the same we do
>> for __clear_user() and write it thusly:
>>
>> 	asm volatile(ALTERNATIVE("rep stosb",
>> 				 "call rep_stos_alternative", ALT_NOT(X86_FEATURE_FSRS)
>> 				 : "+c" (size), "+D" (addr), ASM_CALL_CONSTRAINT
>> 				 : "a" (0))
>>
>> And forget about all those clear_page_*() thingies.
>>
>
> I have to disagree.
>
> Next to nobody has FSRS, so for now one would have to expect everyone
> would be punting to the routine. Did you mean ERMS as sizes are in fact
> not short?
>
> rep_stos_alternative() as implemented right now sucks in its own right
> ("small" areas sorted out with an 8 byte and 1 byte loops, bigger ones
> unrolled 64 byte loop at a time, no rep stos{b,q} in sight). Someone(tm)
> should fix it and for the sake of argument suppose it happened. That's
> still some code executed to figure out how to zero and to align the buf.
>
> Instead, I think one can start with just retiring clear_page_orig().
>
> With that sucker out of the way, an optional quest is to figure out if
> rep stosq vs rep stosb makes any difference for pages -- for all I know
> rep stosq is the way. This would require testing on quite a few uarchs
> and I'm not going to blame anyone for not being interested.

IIRC some recent AMD models (Rome?) did expose REP_GOOD but not ERMS.

> Let's say nobody bothered OR rep stosb provides a win. In that case this
> can trivially ALTERNATIVE between rep stosb and rep stosq based on ERMS,
> no func calls necessary.

We shouldn't need any function calls for ERMS and REP_GOOD.

I think something like this untested code should work:

 	asm volatile(
            ALTERNATIVE_2("call clear_pages_orig",
                          "rep stosb", X86_FEATURE_REP_GOOD,
                          "shrl $3,%ecx; rep stosq", X86_FEATURE_ERMS,
 		          : "+c" (size), "+D" (addr), ASM_CALL_CONSTRAINT
                          : "a" (0)))

--
ankur

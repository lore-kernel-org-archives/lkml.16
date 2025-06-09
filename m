Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8525B67E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475728; cv=fail; b=Sx4xcxGa7s+kDt6ems96Xpxfof8CLC0R8+a85lcmpKjtBxVYRRY9tpqviREiU33fXCLaLXQhhS34cDhGD6HQ3rPhIAAbvV5V6uQgJGpMmNDSCDgdgt4YRAYVsf7+7kg4RNmnAg/4noSpU6ZmaDZE7o3Pnfd3OiDo7xMreflWVRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475728; c=relaxed/simple;
	bh=kCmARXBD/fKrsi0pim8tUNY6DjZN0F2nQm3WOOazIFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AsGcIlb3TktJGBqoqgD5tmoG1Z4fs3zurCo0SsDGxsFZ6CoEQ4DVZg+OUrqNSUlLAdcabuDn2rhxwrH7w+e9yDT4WLNwRDGaTPgPifsfVPCL7Gn3v/DLAotWQNFEpbF6hO5QtFSVEGEa0eRvEj2cUYeEz2ZYFl2uoA+fTWcC+NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CWLzN56y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uiEtQHTB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CWLzN56y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uiEtQHTB"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593fVAT030905;
	Mon, 9 Jun 2025 13:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=49C4IEW9mDvC+0A+Ji8uvlehZPCs4Q60woSqBCHMaRo=; b=
	CWLzN56yT8tkTMFWQErHLokaPDJwsorpzr4yGGmQkQdEbA8nhznvClVltwPC97Px
	UXXh6vYzJzi1ZOj+Paw8xzRZ/sE08yy3Wdo3rB0JXDQDjeoI0HDRlDDy1crJwkVA
	RFwxeyyiUV0fjuRGAHYe0QJ+xIB8ixtziQ46DpyNCuxFupzUmP5lzv7SwsbI1KJ/
	7JjovBJ/wBZqFnlK4L5LxpmJRkpwlJya7ipop7WeBLK9luiibJc5frGtO49UJGIm
	Y+vbvj3gY3oM5KqVdKhQiaIJF91btHZfr+JOtFkpkxiBFlW59mD4hdxZUy2a7iI+
	In6yX3qBCUtyfGAuTv93DA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v24fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559CFHO1011825;
	Mon, 9 Jun 2025 13:27:23 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8ede9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLuCwHWznLpOebCUBqzKQAUBIy7zfl83OE0iCGDfXnXER58Q/h0ZIqmj1B8miyyUDyyxpGsVPoVzipFd2XDamdTkXCreNTP+wAox9nDkJ8A4qcEcwIWTmgZBqHOuVyGHEclRumwDurQht6r2xhK+8iYEdbWzEtkmPvQk0Q0Yc9SnxCSBY3pB0PWgIrGy2grNtpIZVW/f2zD2Mlmrxhdvj+SV2l2SITgC02or5jkaiEo8Ot2uZgVJjoN3RwiFUvv6yW5GvP7ow/+kvXRjZKz5I2g0uP6TX1FjBiBgwlSOogyMdaDNe9yeQVDq/sbwgN4kvUcGzGT86yJ52r9UiI7YCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49C4IEW9mDvC+0A+Ji8uvlehZPCs4Q60woSqBCHMaRo=;
 b=bDpEsEcq3sAhG0wJcOlEW7eLaUrtSHyHcgr1VfpRA+2scGlPc5SDbgvsVNP8L+NPaldxGNkvpcmikRCvrPDaDkmG+aNxsoBA+nP5t66VxjXekTE6yPFQpIEM2m4mmfVo2r+EnV3k4jMNSrvm/5wWUsTw1M4R7mP/XGdIbdTlJ5Irrb6kOUXwAr8bnE3veOg6pUT+cb6x7iKTztZUyYfKDwrhRjoc132yVIiuDOb077+6H1+h2QbKWaqUt1zlkkeQGLVpqVD+mmcW86J6yh+vKxFhG7Czi8PA22qh94hTdKH4uxLsP5vske/Ahm5K2gcGOMzqjohfpmPGDYqTXLwaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49C4IEW9mDvC+0A+Ji8uvlehZPCs4Q60woSqBCHMaRo=;
 b=uiEtQHTBDWJR2J+LraCObrbITswFXdQylTchqyU0qoOsJfwmG9melaGQIO9jBMqjs8oTVkw98zUW0HTG8kR5lq6ZNRDjQ7eOyUbHr56hMi01GC1CYaVdUPJZC5f2XMhOghmzgkf/LbEkSqbHavV+B2ZEU4h0xlHCiRdIatMp1Mk=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB7849.namprd10.prod.outlook.com (2603:10b6:510:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 13:27:18 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:18 +0000
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
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] tools/testing/selftests: test relocate anon in split huge page test
Date: Mon,  9 Jun 2025 14:26:44 +0100
Message-ID: <064971308aacfbdaaf404ebe5736666744dbd005.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::13) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: fa78b102-5cc7-495c-efb8-08dda7595b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l5f7/23IOv0Y2EwGUTOQgYYS3mOCPqFDaLJXibAl0sDVN0pP+7tXGZt1wrQy?=
 =?us-ascii?Q?Gr0YfeehnAw0q7KW1CS6NOLpKS8c1/nXB7d/AS4hP30PtFkowHgjsQDeUE/Y?=
 =?us-ascii?Q?Hsf9+WM7xSSIqZVXAZ6m3+r6xCvim7Oyi2s0Wl8u7q21TXv/nmNDAnFVrLlt?=
 =?us-ascii?Q?sTBuQ6FO68Zcl2ypIbnXuArJoIVdaaBN2vJW+uRo1a39wVP2tT+XOMyW+oxk?=
 =?us-ascii?Q?dxgU8APNTyNAoqwri770R+rKlcv/q8z95KhzJ3JKcCyyT5IjERGa1XRp8tuU?=
 =?us-ascii?Q?kNhkfgsZMsaXjLzr/INUAZWMlzlmyNjNLtrhBxaNHxKQoKSvfQzV40PvsAsn?=
 =?us-ascii?Q?QChcMYq0jMaf59/sOpa69CxtfMPUNceQ6klNv4hHqEGhXSxjCKxkzloeY2zP?=
 =?us-ascii?Q?bghM3BlbIn3owwmyQr1n2EEwyUikW/vgm3pGIRIuxX98pbcSCsHcoYjODVw4?=
 =?us-ascii?Q?vhZuV3qIMegOGjvSRrV8btit1tjpoRx6zgUZM2fln98kqUyirp8nvbOo2hYB?=
 =?us-ascii?Q?qHcY5sYtQCr3VYH9U5fzeDyFFVcxl8vy9RY0zVRjyoC48urcfl7dOB9tMqn2?=
 =?us-ascii?Q?KD+fnaTm0ntOe8298HHeNqvvkSbkfyUAHP2gsFctAofuq5uiEyjeFn4QoV+O?=
 =?us-ascii?Q?F0DT6Bk7UtJl1mO33KGMmKY1CHENofddZUrZgD+KkDXpVNMX+x9sSM6nfZRf?=
 =?us-ascii?Q?KzJNHS+nu3gjfSYlZ6eZ5fIfRr34arrpHfCEwkhlGtVhLZDcTbOeILGbPAHr?=
 =?us-ascii?Q?WdbSmz52R30q6f+beUgWaK8TGMhGbLjm3TyJR7ZEBoJHrqiLJ4RckOemtSTz?=
 =?us-ascii?Q?GFavlZiZWDYSC/oO36ZkHYQ7mUczW6gXzATSA9WKaauu+PlZWg/ysoaFsfnh?=
 =?us-ascii?Q?qdIYuVuVBgquD6OZj0zYZKJDVar2MIiPVG6SiIrRB8odcXUvymbT23vS37Pr?=
 =?us-ascii?Q?9HeG+DEJlgulUpUceF81xkbR2rPFJJbk5iCBg/BEjUDTfTSifdm4oLNN4kAj?=
 =?us-ascii?Q?JioptaqGJZSt0yToEgz9Qdg61ib2lR2PXoR9fQM2zjKtcSs328ibuh0kJjm6?=
 =?us-ascii?Q?NnRrgolg1/aSPwt0658UwyQ+70hMxfjiViQeAbFwVia8QGDRVhb1Ppx2qjcn?=
 =?us-ascii?Q?kktg13MPpaSeeVmDz22Jf05QjD1zIVms1MrFG5gLAsBYColB04iMCMrfLCve?=
 =?us-ascii?Q?FdSC/g3rtxFtErccok29VKUcVxk6sGuy+8lwBTvV05kDMM97JxtUgzXJ+GPr?=
 =?us-ascii?Q?Cq00AaN2ami8YerAVI36aKAJuY3ii8yO8Txa+1/Lf4Il2NkNak+prcKyTCjX?=
 =?us-ascii?Q?daDZO35Fgmlhh67ApGMq5YRxaXFb+NnrTE7QTfA8hrlYXIQKllSABga92dJu?=
 =?us-ascii?Q?PkOmxM9ZxB6wc54890JKzpxRogNUSvhT/TcHvtzkcz3PQqtY4+yEqH8W1R4s?=
 =?us-ascii?Q?fJDOSZpqXxc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R5/1uJEAmZE67GBOWgoG52d5NnaR/py9NSp3ff3cICIFFniVv0+Az5+Kio2s?=
 =?us-ascii?Q?VO3BBRRYp2yFoHVGsjhKyITIcm1KfTFiJz0knnIl7KwJpPgmeM45OGUm1WZ6?=
 =?us-ascii?Q?RSqHw9VtPFUmXxXL65BMfgKFxC2XJNv+gXM4MAE2Tpq7ZH6pIq82h19g2NbU?=
 =?us-ascii?Q?FS5yF5qoO/HKgESyUc/za/2jMcebKA18sr1TpdRNzEJufJ4OC1dRWg2/OoDl?=
 =?us-ascii?Q?JkE/Z3eZv45hBnJZgADkDI2IAJLI3R5bBZxaXU6AkuoxdnXm2DE9rJi/9BkA?=
 =?us-ascii?Q?vBJOgBxQ8imA/dkrjVI2yEe2SJk0Bp93UAALtzwsn5aff53X2utTDScAshDc?=
 =?us-ascii?Q?49I75IOt/TYAGkrXi6buXtx8jUQquvEP3luTgxXa2MCMrJBTUEFlxuHKYdYd?=
 =?us-ascii?Q?cWoDvaaDi9BuwM9KESIlZ3WVn4cmBJvBpsXckabqOLo1GZFnT6HCC2u5Pud8?=
 =?us-ascii?Q?m3umc9PX+GWe2PJZa1aVm7Xq3Q3HqOSwFav6O27LWr+a1oi5DrANgx6Exz1r?=
 =?us-ascii?Q?iZg6u4XJTtwyb1ce+mguEGCQyk7xmAydfNzAOLGqikbOEJOi38H6Qj54CgdZ?=
 =?us-ascii?Q?llFg1xNZfilZ8dEDquZHtZc8qeHtQStVC37xdqSbZMyyICHBxL/l1uIoAJ35?=
 =?us-ascii?Q?zl6cz345V8V45oMTwgdoop20Sc1ZT3hsie8khSwoeKBmQl4/4sITbOx0ydEz?=
 =?us-ascii?Q?JJUreev48jLPdWZ2i8XGi4/Uu9CLerlamrZm2umj6bvkq3eHyQvl17FlVrj6?=
 =?us-ascii?Q?snTVoy20KUhi8F8wvAmqp3lCzgYzGFQMNPbwi6era/yrgVB6eUdDVhdxNGhs?=
 =?us-ascii?Q?8l7jj9GNp45uwXsdbbRsNBZoJGGbDYgyLTiozalxyGTWvwKuPcJ/gw2YqL1X?=
 =?us-ascii?Q?SvH/VN+/8Dm+i4k9qoFXtf+L3pkNTnPAntm3VzJFY6keBxho0PoTZS3G06YJ?=
 =?us-ascii?Q?oriIxPBq+rXLG1B2PM4z4EICDSjZWXbMI58GGNgEFuA7jsXRfehsZOXr5+1b?=
 =?us-ascii?Q?7Bw9ZG0TcJHZ5ReQ+2XeRUlEM+IA9/ZFmsvJ4kHY2A4rs7sk0FL0nHwJ2h4R?=
 =?us-ascii?Q?GZGW9McfFEgz8KUPWozN0I9C/mCw+/u4yFazHyzESbYxGmAy63imIdsvKFZd?=
 =?us-ascii?Q?DnnckTMqTHMlqX7d8Dxa/rgQwn3EwAD6ZK7H95DiEJ3RjGQtSDr33LLi/kUM?=
 =?us-ascii?Q?1rA3ela+fwYVwDLy4fyig3H6+t3iZXTNoAZzsA8OwQDUrsEDvGNgTRy7TwXP?=
 =?us-ascii?Q?dfvtTET9ZKhhioqXpWLaTOqVcvbsku45rQWHPbxepcZfxqnMYoXcoUj6dU8f?=
 =?us-ascii?Q?Pkv3te2PAZTqpI5FhMzDLnRH7bwYqayi3rmIFaoATBHM+kLn+FNDQcPoRKQV?=
 =?us-ascii?Q?VmIgz9duLrndSkZJzaJSZqp2pdt9TT8xuncKp4tARrIbsFUoPawucsM0qSp4?=
 =?us-ascii?Q?/bzXAScDJptbdKLjAu7KUqNr+nE0g6doVOxRZ5cMVSSgy+g3TsGeF5fxZXJr?=
 =?us-ascii?Q?ARDlB9Q9iNHeIoL6utEW7NQm5tbGpbhqZpo0cpAPzCyVaHq1f44KuL/pW1rk?=
 =?us-ascii?Q?jbp3HwVkBEZn0vl032jHYM21RPx0f/pDZeNlh9hq4is5A05I7sWFDvJzBYh8?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iBGRVPIT8nda4gmQW7JcfXaprEMp7ZRwHWvSwf5q4ASHcB4g4sNEmofsmHCOO6wDpysBes3kOK7YEo988V87o4tQbs1yMG5SNwIOOBQBCMZ4hfpqQm2Am8kBCFNDatAJliph2DEvHw+PXo9B0g1PhY1KjPcft2e7OjcUYTYHJP4VVsNjNgZDLtRTDaiEkDcuo/7nAM4/+rWiXubmdwAoejaqMEhtU1JpOREq+TZ9tfKCVCGl2t01ACiYE2H2BQ6P98/8grVYyDQ6qoci58qXhdNzyfantnn7SmCIo5TVEJEP85i4tCeMrCzWql3H0dIU+gBZiQ9uSRsirqj2D1cFM9O4dsMXPBeMY4Q4uw1TEfWfKiy2xJu+WribgYg1uNvyqU5Gn3eJaua1N4HxeaMQsr2YcS8ajO4NjkRCOL+uzmE6YlRX+TyqTPlWjcxtx+W1Ndi0PaAtMrizo3zhyMEf2fwxCU5mHo6uHjCO+wniU/rn788Rp7G+etRrqjpMT88giedrHovW9cTNrmHfkK2D+OkByf3abK9azVRTMK3ipXf8UQe0SjI/scwE4aMUkyntlwXfe0Bc0zNZRtPBvFCZ8i52I9TuarP7SzP/nrMDlek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa78b102-5cc7-495c-efb8-08dda7595b7b
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:18.6520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kmt/tgQtRcmditlWtXftQF/CeOZXfZnj6GQEFEvDCuBm/vAT4tl9LpPOYgoGr850Ts9yEgC8xrTrL2IbvUanyDI97ZRB5YUh+lsAGy5JYRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Proofpoint-GUID: uq3kOoiXiJFSYEJ6zZSpzg2cBPhBDC9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfX2xsNMCXnS2xE Rpcsdw7n65Om5oUwinPa4iQcff+pJhHBORPl3f/bPxURvIasY4duhbet5BJzG3V8WPZm3qKIRfB UM73mGpXOn9j8Th8zhy0jM2ikX/MuvTfh6AZSUhUue/PG+sh5uoNSrSCc+iQE+yYkjh3ja1tvv+
 0TzGtnO+QgT+B2+kPaDwKAcItznuQbmOcZ2dKnbJ1DphYqkhHVa6jxT43Jkf7XxLL/BDQcitFbk 71VXHulovEEtRGqEjzTswPf3vnNHzEXgONDMewzOYn1p2WIt4bV5BEk9qLtD7uMYOOJh2FJfTzI bMLGZJdhRMfnUgDj1AT4wqv8LOyAUP+0Yc2/0sAJEC3QB1NAXNASfgmgA+2+7I7lAudm0OeTkex
 JfYHs5pzqjtfaxoo3pX1V9fZGp1gzbqCBWq8v79H0G9WZg7Zgi/jZHcc0+zh0jTr5s990GZO
X-Proofpoint-ORIG-GUID: uq3kOoiXiJFSYEJ6zZSpzg2cBPhBDC9J
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=6846e13c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=eNrB-mthgvSI1smxAGAA:9

It's useful to explicitly test splitting of huge pages with
MREMAP_RELOCATE_ANON set, as this exercises the undo logic and ensures that
it functions correctly.

Expand the tests to do so in the instance where anon mremap() occurs, and
utilise the shared sys_mremap() function to allow for specification of the
new mremap flag (which would otherwise be filtered by glibc).

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 .../selftests/mm/split_huge_page_test.c       | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index aa7400ed0e99..1fb0c7e0318e 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -19,6 +19,7 @@
 #include <malloc.h>
 #include <stdbool.h>
 #include <time.h>
+#include <linux/mman.h>
 #include "vm_util.h"
 #include "../kselftest.h"
 
@@ -180,7 +181,7 @@ void split_pmd_thp_to_order(int order)
 	free(one_page);
 }
 
-void split_pte_mapped_thp(void)
+void split_pte_mapped_thp(bool relocate_anon)
 {
 	char *one_page, *pte_mapped, *pte_mapped2;
 	size_t len = 4 * pmd_pagesize;
@@ -221,10 +222,14 @@ void split_pte_mapped_thp(void)
 
 	/* remap the Nth pagesize of Nth THP */
 	for (i = 1; i < 4; i++) {
-		pte_mapped2 = mremap(one_page + pmd_pagesize * i + pagesize * i,
-				     pagesize, pagesize,
-				     MREMAP_MAYMOVE|MREMAP_FIXED,
-				     pte_mapped + pagesize * i);
+		int mremap_flags = MREMAP_MAYMOVE|MREMAP_FIXED;
+
+		if (relocate_anon)
+			mremap_flags |= MREMAP_RELOCATE_ANON;
+
+		pte_mapped2 = sys_mremap(one_page + pmd_pagesize * i + pagesize * i,
+					 pagesize, pagesize, mremap_flags,
+					 pte_mapped + pagesize * i);
 		if (pte_mapped2 == MAP_FAILED)
 			ksft_exit_fail_msg("mremap failed: %s\n", strerror(errno));
 	}
@@ -257,7 +262,10 @@ void split_pte_mapped_thp(void)
 	if (thp_size)
 		ksft_exit_fail_msg("Still %ld THPs not split\n", thp_size);
 
-	ksft_test_result_pass("Split PTE-mapped huge pages successful\n");
+	if (relocate_anon)
+		ksft_test_result_pass("Split PTE-mapped huge pages w/MREMAP_RELOCATE_ANON successful\n");
+	else
+		ksft_test_result_pass("Split PTE-mapped huge pages successful\n");
 	munmap(one_page, len);
 	close(pagemap_fd);
 	close(kpageflags_fd);
@@ -534,7 +542,7 @@ int main(int argc, char **argv)
 	if (argc > 1)
 		optional_xfs_path = argv[1];
 
-	ksft_set_plan(1+8+1+9+9+8*4+2);
+	ksft_set_plan(1+8+1+1+9+9+8*4+2);
 
 	pagesize = getpagesize();
 	pageshift = ffs(pagesize) - 1;
@@ -550,7 +558,8 @@ int main(int argc, char **argv)
 		if (i != 1)
 			split_pmd_thp_to_order(i);
 
-	split_pte_mapped_thp();
+	split_pte_mapped_thp(/* relocate_anon= */false);
+	split_pte_mapped_thp(/* relocate_anon= */true);
 	for (i = 0; i < 9; i++)
 		split_file_backed_thp(i);
 
-- 
2.49.0


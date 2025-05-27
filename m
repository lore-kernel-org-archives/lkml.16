Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4FB248886
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363623; cv=fail; b=cimsjoL/ULCpulQrug8pxvaQbc2aBzsA+6/wjQ5AcNil+SpxOIcm3jLF0YfZiYNqN49++Abtz1M/NoVjiQiwjvGgUw+vEe7nLoIFD3RU+mmravIXiP6NaAMtO4TQjzgXQ3yp4/g/Rz0/rRo5x3LO3CsDnG/fppVYYNyHMFjEPdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363623; c=relaxed/simple;
	bh=QVuvE4kzZ2nPm3QJQ0nE7BeFB1cNNgohYrOjw/x1Mug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IHy1XcUom69gN97MWSPDhPqxwXL8XHs0VBoK/rwb/i59vzkzTKKvmg2GK6/tuPSM5D0CfQbJq6CBkI+nt5qgVT9MB+1itLBS1JhMVMuHVQcRLso6V+l66V/zgTVi3L5on93dhi/shzY7ZUSEksnywrGubAhDYi1MYdDK30QMNuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qaNlTbyX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bpB0en7o; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qaNlTbyX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bpB0en7o"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RFu3ul028778;
	Tue, 27 May 2025 16:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=84Ly+mzTT8I9OjpdRp
	5k6ZUgCTzBx7u91oaYmN8T5EA=; b=qaNlTbyXJ5Z7vJqhhFUdtYQB7rN6DM4Y1f
	V55W8edYOInZJ6le8sOiZJ3qNNWAcbw1WFXVFUAvvSRVJFzmZ5ZFJBol5xuy1SnQ
	wt+Ho/hNpBBwGs28n81MvVSBDC5aTUN2baVSnZx7M7i9aP3AIPK/1Jkl5zLltW1w
	fgN0mJHPLEJaVLdj1fhVzK3CaBPe0UPobl7jucb49sleZmRNbZbY3nSCbHCtuxgU
	qXGdsJT1k2D/K5WltWWJokT7lQ+H7P5UEdmL8Ho6/7MWYn/U8MmXR+2td1JZQyUK
	ZIS4tDqbYCkuLXa7QV7nizi5uCs8mOAFbfCBtZ7nEEeqPmUmTaVw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3hjunfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 16:32:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RG2TgT023160;
	Tue, 27 May 2025 16:32:56 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j93wkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 16:32:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5oJmQLblT6zlgi6gvvmNf4lu3OteJKn1vqSpwk2nobLR6Iz/ScZ2Ot1LrFtyXaRLKAH6LUXsX+30+V9mIARElIg8fFhkwe6SEgSITOTzQeghWxEF89YwoSmv3yfw4vw0t0cOyNeoHhXv6WRAjr7/iAnQSlaI2oQC3AIBf5ERHYsmYGwDFDnMs2n6XKWtRfr+arAUN5j2N+R5GGjyFrWJkqzpLPi6VI9fqZEyYiJokifROqxrUgHipW5QhPQShwKN29ypIt/98TSpRlcXVJYoTI6kIpeGm8e3LGgyAzs+ZzlZ2zBlCrgmE3Tt0e0Mp5jTalXzQTtDwExZaCJyUQx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84Ly+mzTT8I9OjpdRp5k6ZUgCTzBx7u91oaYmN8T5EA=;
 b=m10e3EbdZM+KgaLwxsD94BElDKB3nSj7GVpcCW+rGFjs/OIhmL+/uo1qi/S511VWLnItRx6BvEiwVrm5Abt+jXKWxFrK/GsyJIkDJkCKegsI7jIUfUU2KyWQmwg0TEE4rF/QsVADjSVihze+FbaFiGKUxWRXRux8YzdsRgxVqoiT0tnoVTK0Rqn1eQ7UIn1LbpmEV3gfUhyBfZqTZg8P4rAL0QkpCyIahKorAXZXohkgL7GJeT5/JRFXqT2Ux6O3TZvs5ul91oxnVA6wxSeNdqExBfV4W1RCCU1RpP8YLMts+zKxPD0wzSsHXY9JFAae6PZivOhaZzuBFWTGjU7GzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84Ly+mzTT8I9OjpdRp5k6ZUgCTzBx7u91oaYmN8T5EA=;
 b=bpB0en7o1r3GkzTQD6Jq1tOdjbjwtMNTs5akp6D1Tmtdo7v10a2kSCqji6Tz1vaY27rQBy87kLBANjyG8v7YvuoJjPmE92y73OVcJh+wij3xi/tHKOLB0eDo2AQJQPlyt/GDxdeCjOOA9QFiZeZYN5v/s9APOgrpTR8kBPuVy/M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB6242.namprd10.prod.outlook.com (2603:10b6:208:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 27 May
 2025 16:32:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 16:32:53 +0000
Date: Tue, 27 May 2025 17:32:51 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v3 0/2] Optimize mremap() for large folios
Message-ID: <27619706-6758-4bc9-be40-528e949544f6@lucifer.local>
References: <20250527075049.60215-1-dev.jain@arm.com>
 <8df598a2-4147-4f96-b683-23e0957fc769@lucifer.local>
 <1d1c80fb-3012-49ce-b974-4f9445825e0b@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d1c80fb-3012-49ce-b974-4f9445825e0b@arm.com>
X-ClientProxiedBy: LO3P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: d2438832-e92b-436b-2b4a-08dd9d3c211b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4+9EKCOsWleHI5W27kOaKBBoutTQr9QR7dvftD/iShFwjBi2Vry59fwnUJV5?=
 =?us-ascii?Q?Ua27NeYxuKAf5eBnDiMzfnTTdKb/0DUyT2NBnpAPIeMhMPb/9jNCAWz07yP5?=
 =?us-ascii?Q?1Ur1ucPABHxUnAo4H+72eMjzCfUOsg1FgnxOoDmXd5woOzJzNKWEwSDnY2oB?=
 =?us-ascii?Q?3V7VA7pQLFysqf5tOTbMG1iZSjaDtH237C+cEGK+rqg6887n8jerzodkxbLF?=
 =?us-ascii?Q?xJVjdJnpMiT5uPf++JdBTzSDrmasQGlVoSahpEwyWbc+B1EC32jQHKT9iPP/?=
 =?us-ascii?Q?MvbcCHhE2zqS39Gc6tSRNS+d/HH315rXYhEmwT8bg1fU2EdurnZUTeoB10Oy?=
 =?us-ascii?Q?obb+1vQxHUO2wBeX7A3BlknHX5ImB6C+RXVrsV/LGRBWHOY4hiS6gcSf/eBR?=
 =?us-ascii?Q?PstCmaC3jhQRPYpyWKvkCumWrHganpGh2F95p31zxWLKhfidUhKEMcC6mMuF?=
 =?us-ascii?Q?32NvrzX6Eoe2MTZS23WXXEdPP0NSCNz2RGbVm65hQsWWI+FbiW8tFDL32Z/I?=
 =?us-ascii?Q?pP5MagNJLYMzH5Unu+fgu7YF773MYSPcLUtGmGlzspoZyF04IoK6XfrvcHWi?=
 =?us-ascii?Q?OqyAZS6he4UOyXRKJCLJhUyxbYxIEjEEtfmftsaSAr13VDkiohTWYvVF+taF?=
 =?us-ascii?Q?aCbbtJru5GAyIU2eAzE3j9TdQZPj2UzTfFrP9wRBtb8whgw8ZxSYvi4Gc3H6?=
 =?us-ascii?Q?ZZUKXYOcIY0RIOXVKigbrzYDI2hCi5XSQvs+a8COm/pP/ZlaoDmkT4sQmJEn?=
 =?us-ascii?Q?zyHwIVQZBuUUMKUWmjAyWJgreYpaMSjZdrM5zy+3b6+5SKJrG4tt0g5YA/eK?=
 =?us-ascii?Q?LlXFeFmPTMLEuNBaKSmBKrzQvhPk4II9IVUqr7vixin0Fagp3Wvnx7+yYUKx?=
 =?us-ascii?Q?Vmda5poKPFvKdbAA6glBV00yB3cRlBBvWKpUmzQt/O0cDc+tz/DNNeRRWcHH?=
 =?us-ascii?Q?86shwgSSdvl0mTsutEeQxCkXhLAqEbjusBYRwK3ZxzuWVbOiK0tgegwEqR70?=
 =?us-ascii?Q?wa3s+3UKlBCZpeh1St4cj88e8zeFHv/K3wExvUnhrp3sbtSTD6vF2lXhKQDZ?=
 =?us-ascii?Q?57iSXWXl0No3eOCTkIuWUJECNxOTdVuwv53Ht7ep11A64bohyBYTXVUsd/3/?=
 =?us-ascii?Q?ojZNbLvbzEdMfBllvCPltgCOtsZkiKb4a6iBRN9aawzN05IotQpKzRYO5/3q?=
 =?us-ascii?Q?L7Y0epMeZeDCqznDM0L8DxcakOibvOLxIcHfYNH9qu9lJCGYBaVV8+SOR0ZU?=
 =?us-ascii?Q?ebmiuAU9VjHAqU+LFgaNzBMnBhMfHj+eI01Q2XE689a71/Gi6V40F599c4SC?=
 =?us-ascii?Q?3+QB3zLvLRzAQthCJYD6WyRWJ9QnTvILh9heRkKTgivtrcRvONYnWu75dA4F?=
 =?us-ascii?Q?h0GdZ5wBVhU8EMP1ylzFvmCFwqo1dvW6otj5DtipsgmldPQdl0JY881QF0Ir?=
 =?us-ascii?Q?K/0EzSPcyZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PprDYo5SfXKF8wodvbjKp99xC7O2o8XQR+W9Z0c7/5uxdzFBmAnL1kkstPk0?=
 =?us-ascii?Q?OYKKJ67JqSx+AFB6HUMo8MBTSXGKUVxn/ODVADLxPi4Br8pG454Sk7ho/rK7?=
 =?us-ascii?Q?xQfHzy/B3Av7YP1uUgz4jgPsdcG6ekO3hGDVyMAY4JoWCUXljPvjft/1/p4N?=
 =?us-ascii?Q?jvDdm7lFZIMBSwB3931oASxB3xw/DQvsUsT3O6jFrSSxgdxbLtX1Cs6ATVN7?=
 =?us-ascii?Q?1G9BhIAVkVw+D7b8YByP8UlSBuyMH47CWBdrYOwjKkAHLN/EykDrIb61tlcd?=
 =?us-ascii?Q?6TQuVwd2+bcztcebDbmZIyqBFoE319jsCTE++K1dm1IgWxph3DnuXOOujDxQ?=
 =?us-ascii?Q?SOtbkeoq9EEFeALpMdS3krhJ8sFV1XOYugspTHb7lO1ydZPN7qOan3WOnFBh?=
 =?us-ascii?Q?fANXjoVO2PKxkhU+wHzy3N6i3m+Gm6hK4cXTr2etXusAro0ti5xB1Dlr1ELt?=
 =?us-ascii?Q?mHyjpSlDLZ+5BeWGPuXPHJGpQot1W2ow2LL0bCnW+Rvfu4uTpDjpPLI0Ir52?=
 =?us-ascii?Q?RxlI9NSnoDrZTl5Buz2Nq/NiZzZ2IIZbi1B/pCmkiMnzzczKEDeUxNQy3/9a?=
 =?us-ascii?Q?YmUmzIG3iZSXp1VSAjQxR41o41csFdF+CF6NT7q0gA6lfZ8t+nIOG8q3cwJ+?=
 =?us-ascii?Q?TT5u71bOyrcZuPSFh741SAuayVJnH6fbt/q3UZTNlp363Pzh/gm1J9p6uSgq?=
 =?us-ascii?Q?hbpb8XWsza1cfyw+9RymgIGRb2x+3pbvMFvrc+2W3/4nPWHj3ivAaVBvfm4w?=
 =?us-ascii?Q?mtm1wyMGf23V4ZX3EH2JzMNJgkkNElcWuiKcbX55hRB/xk3p3O5SZ0biHDVG?=
 =?us-ascii?Q?UVbI1IfvaD98c11io2mQhvuVWdGjX4sfz60yJI1TIIT62qMlYvPEs/VfQAKx?=
 =?us-ascii?Q?pIeAaz93/Ym3D4X79fqG+6MpY7jVGa6pjrLEbi5bnBEHkX+zXhQyiDp3TVGX?=
 =?us-ascii?Q?p87XkDUEyXPlaPQRnwbeWClFzXPJe28a+jqnu+PeO+2tSZiR9vhN1c7e6N+X?=
 =?us-ascii?Q?n4l8jpfnCoPuxLQ3XVoU/2lpqHj+jKGXZaqMJUL3a9l1Mq/PLDb6LDD5Ix8+?=
 =?us-ascii?Q?IUQFPLUxlt/b9QZEx7k1sdywQfa4nrzPWLJUoP85Q/7UcNiVpolhfLjKzosa?=
 =?us-ascii?Q?p/DN/g5oiyYR1d7kfBEV80ZKOqgQRNLnHaFTa+mSfMUeQgMSIt2kFiQWXpQq?=
 =?us-ascii?Q?EXj61aNnFH64Jrhzp3Ysc3Z8LhKmCYnoHdwsdA7BNFp2KfD39tR9CRCaWn/3?=
 =?us-ascii?Q?Lkkde7L1z3Wx7lm8BCMFpZkX49tulJYSfgUZv/sDRY7UrEyOgPMuoxrG9Bd6?=
 =?us-ascii?Q?acI2f28K8fxcg6FJGXrq1gCJGjd+1wmf7tuz6BO5UwjQqezBITyr0SzqOsCH?=
 =?us-ascii?Q?v2pfm3Y9ze5RQwa5pKO/uAuyVimRXX4fYEPaZNRzDe6E2LKyZhiBFR2Ws6qo?=
 =?us-ascii?Q?mG+YYuD/3AUzCp3WJnYUjtP320XujlMV5LwP8g4TXRV0ThPSgoKHhD+jQwdu?=
 =?us-ascii?Q?TO3clK/KKrOLSIb4kCpdg1gyRRsp26M5Yq4ABtAchrYdNZfa+QA03baugcAM?=
 =?us-ascii?Q?1teuTQV0RELW3Iykvcrs8x6GbqVRX0Wa0qCtYE28/UXuE8SLSViMvO97KEm2?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gRwHV5E2m7K0pWSV6kRphMMfMEpylIHmNRiOgdjg9mQ0GODArQfuJ+EusyS9HgGTEoPeURzqxTw+4gvwJVD9dH/6cX0yRssE92e4mqHlyTx2GPQDyrSmE4F3yQtwuDYPY+r3ifq1Hv3bUrgZm2bYEsNlFGnzGQuOvD0BHrCtAfgtxn63F8PjBtZDu97ynsV8LC7i69tgraVqOG3Y2VJ7z5TsUwLISBVVcF/yHOdwKFpLAre6CifDy6LJ9GD0sIrezn/pyvCEqKP21slKQa173/t4iMlckPM9V/hky3T5ARXaHstNDFB3IrcetTmC8Hs4hidGhilL5EqKjbzbd+RjEeADSPlXTDl6kX9FWWVbNETSepb096SuBK4F8tsCDaXuFNiQtufuub9QtjdSItSDS0NkqOfv3XRvPwQrKp3iFPvlD0baweazTt/6Zh0obAjGblV1JzZeA02Owj43BknpXw75BS3nUDi79iIS8fmdgqFImKQ+vLexcf/zSbgHGBsBGwXyFM0gtEWde3v2TPKoZMG7nWby1xnu6zRaIZDiGVLDtaZ/lhTl0gmcRyqyvUaw2YjsWg/m5r56MFEQtvKVO/jGa9uNZzBlZNgMwL0qfW4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2438832-e92b-436b-2b4a-08dd9d3c211b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:32:53.7799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQjnO1SFKr+1yY0qP0W3tp7IAhBR4SYUpjWv2idSz0cL5rCirE1D5+RpuhsBIYQ8GyUQloPNv/1F/e27WU2qEBJM8rHikWGbbvPwTrkNCEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6242
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=978
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEzNiBTYWx0ZWRfX+29WMEmaNw2V s1cPngRemCpV7xdoFN1NvF8clHPG4kukqDM32KEygfsF6WEqL7srh7Pjme4LdBCoP81/NiwxMIr D9/ZbVexTrX1hNiTRcyk/DN+wda4WyuZKB7nyTMnNDp7ZBsaEkuS0v7QUnRr0XwN2x9YLj+rmle
 yYkWL56BqbEjP1U8ad14hc95JKuj/xucnX51zGslRjASaJBoGbm2fZzk2IGIFUx4VpOKJHSKiy0 PX2ZfiXUNhw+6/JlPpV+RlY7zOc1vHHXEU6EGIk7iInuMkl3CZ+CkLCoelYm17GwfqvvGSKfruI Nvtzep0uMjDvwBaKP0ylWVy5DhNgNJ3hnbkH4jTIuvZC52+Xx+R7sdBDhAsmNlvVeESIjoUEJLu
 jLB3ieN9XWMlvgM3byCsCdA1OI7LEJ6g/xvurU0eso6Qs/rSRVh09CyknAcbHzxnBnBMQvES
X-Proofpoint-ORIG-GUID: MhSeIjFxKpR1BZf-bUVjOfvDOs4GB07B
X-Authority-Analysis: v=2.4 cv=CcAI5Krl c=1 sm=1 tr=0 ts=6835e939 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=WD4CokmYHYvUhSEkok8A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: MhSeIjFxKpR1BZf-bUVjOfvDOs4GB07B

On Tue, May 27, 2025 at 09:56:37PM +0530, Dev Jain wrote:
>
> On 27/05/25 4:20 pm, Lorenzo Stoakes wrote:
> > I seem to recall we agreed you'd hold off on this until the mprotect work
> > was done :>) I see a lot of review there and was expecting a respin, unless
>
>
> Oh, my interpretation was that you requested to hold this off for a bit to get
> some review on the mprotect series first, apologies if you meant otherwise! I
> posted that one or so week before so I thought enough time has passed : )

Yeah sorry maybe I wasn't clear. At any rate, I don't think we're miles off here
once we resolve the questions, so doesn't matter too much... :)

>
>
> > I'm mistaken?
> >
> > At any rate we're in the merge window now so it's maybe not quite as
> > important now :)
> >
> > We're pretty close to this being done anyway, just need some feedback on
> > points raised (obviously David et al. may have further comments).
> >
> > Thanks, Lorenzo
> >
> > On Tue, May 27, 2025 at 01:20:47PM +0530, Dev Jain wrote:
> > > Currently move_ptes() iterates through ptes one by one. If the underlying
> > > folio mapped by the ptes is large, we can process those ptes in a batch
> > > using folio_pte_batch(), thus clearing and setting the PTEs in one go.
> > > For arm64 specifically, this results in a 16x reduction in the number of
> > > ptep_get() calls (since on a contig block, ptep_get() on arm64 will iterate
> > > through all 16 entries to collect a/d bits), and we also elide extra TLBIs
> > > through get_and_clear_full_ptes, replacing ptep_get_and_clear.
> > OK this is more general than the stuff in 2/2, so you are doing this work
> > for page-table split large folios also.
> >
> > I do think this _should_ be fine for that unless I've missed something. At
> > any rate I've commented on this in 2/2.
> >
> > > Mapping 1M of memory with 64K folios, memsetting it, remapping it to
> > > src + 1M, and munmapping it 10,000 times, the average execution time
> > > reduces from 1.9 to 1.2 seconds, giving a 37% performance optimization,
> > > on Apple M3 (arm64). No regression is observed for small folios.
> > >
> > > The patchset is based on mm-unstable (6ebffe676fcf).
> > >
> > > Test program for reference:
> > >
> > > #define _GNU_SOURCE
> > > #include <stdio.h>
> > > #include <stdlib.h>
> > > #include <unistd.h>
> > > #include <sys/mman.h>
> > > #include <string.h>
> > > #include <errno.h>
> > >
> > > #define SIZE (1UL << 20) // 1M
> > >
> > > int main(void) {
> > >      void *new_addr, *addr;
> > >
> > >      for (int i = 0; i < 10000; ++i) {
> > >          addr = mmap((void *)(1UL << 30), SIZE, PROT_READ | PROT_WRITE,
> > >                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > >          if (addr == MAP_FAILED) {
> > >                  perror("mmap");
> > >                  return 1;
> > >          }
> > >          memset(addr, 0xAA, SIZE);
> > >
> > >          new_addr = mremap(addr, SIZE, SIZE, MREMAP_MAYMOVE | MREMAP_FIXED, addr + SIZE);
> > >          if (new_addr != (addr + SIZE)) {
> > >                  perror("mremap");
> > >                  return 1;
> > >          }
> > >          munmap(new_addr, SIZE);
> > >      }
> > >
> > > }
> > >
> > > v2->v3:
> > >   - Refactor mremap_folio_pte_batch, drop maybe_contiguous_pte_pfns, fix
> > >     indentation (Lorenzo), fix cover letter description (512K -> 1M)
> > >
> > > v1->v2:
> > >   - Expand patch descriptions, move pte declarations to a new line,
> > >     reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
> > >     fix loop iteration (Lorenzo)
> > >   - Merge patch 2 and 3 (Anshuman, Lorenzo)
> > >   - Fix maybe_contiguous_pte_pfns (Willy)
> > >
> > > Dev Jain (2):
> > >    mm: Call pointers to ptes as ptep
> > >    mm: Optimize mremap() by PTE batching
> > >
> > >   mm/mremap.c | 57 +++++++++++++++++++++++++++++++++++++++--------------
> > >   1 file changed, 42 insertions(+), 15 deletions(-)
> > >
> > > --
> > > 2.30.2
> > >

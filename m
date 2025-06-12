Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EACB17BED0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731956; cv=fail; b=PSdlCXmO8ThklTkJFhexCb8I+Suf3wJHdhasntfMZrfyDXgodYOOazexfM0mVxzqugvP312QFYeWk0C20N6FRkwcMVLsU7cdiABLugJBLNPrZDbg06zErXODOaax86fTB4YXbQ04f8pvTkttnNjldC/HN+nbHEEWmdoK1XoZbsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731956; c=relaxed/simple;
	bh=MrtG4Oi2RFXc31gebsW5HP7h4b/WePFuGXwfPpys9LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=atkQB8NJjOG9dv13yDo0ImIlM13EW2XX4xOqUTnVvjpAa1Qjibr7tP/aWvCqhB7HjP9qh3SNYVnkELJANfRQ2VugRMyG1ZGTP62H14cWZ7RnA0ddfWJvwc7lbl5LZXJFuCGAkLNLXXCQy99MKwgQHLVmgYJ8Z++6rjytbk4bFHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qEhC/5lU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nf6tpfor; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qEhC/5lU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nf6tpfor"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7g2Yt023471;
	Thu, 12 Jun 2025 12:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=LrGXFmSDU1g77DBNcy
	2EnSpV9bMKQxBBXJzGoW5q+fs=; b=qEhC/5lUBTw6t2WPsktBKTXUjCCvKkG4HO
	MbN7XWq+DhoYKcV1s68WjT0ABSDUivac0n3GIkCmjjt4TTnw/uM6zTLO79QBEiz2
	hrTXfa3LC4mLA5nFW1lvOwLoJ2ISu2wQxAQ6KYs85EVJhjVOoLajHBGW+gIh8rNq
	kJ3bhVEICl5h35Yr/hnioVuDmKUso2XFS2StGTqmAyH5jGINuGs5Q28arGcnP0xL
	EBtcgvS6XHP/1uGfGGq+z150xaXtamMYyiTjrZTrax/PB178Qn03chf5J3nKHCCC
	FWkOeeIKFpH6r0Ez0FLT3kiy1uvdQAKeyTnGU6AUe+Pl1RexwfwA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad9fuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 12:38:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCVJD7040713;
	Thu, 12 Jun 2025 12:38:58 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012054.outbound.protection.outlook.com [40.93.200.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvch76u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 12:38:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWPmpaEOI7OV3/IKw4nMlvVKf4TXYa2uDD+xoFytwlWebCynnXsVwlV+VUEA1WSOc+gjBlpqEvJQrmYaFpSzoK2/4iFzYz4LHIMQqzs4GMtwqlE76/hXFxi+GR0ygaxcusLalw2Cys37ibEpAOgEJZlkJHS6kah4+RU3NF+PZ8+6xtC/BTmpdCsnGO/hjf0/iFVLwewTWgeNRR1bhYVpDliUFvL3sfMTH/ooQ2KXprEx0nbHrIuXibuxAA9t9XagrxsxrzIAxBCTG6hTMVloQ2lcfpzW6rBZ/s8tMyPzbM2a6v1lPNKq+UjQv2eaZ5aJbl/sv1O4mmKhalCLHi+5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrGXFmSDU1g77DBNcy2EnSpV9bMKQxBBXJzGoW5q+fs=;
 b=Jp4+tYf3S4MlJ6CfiXuqp08wDjRLCTdSOvnlUQRb/VvJePTyd7rLou2uxRB6siFjmxRos9X7V28KmdfD6zcL3BfpXeqD0dazh2yfkPnYupfkeoy6nWYJNf569uteG4Kp1+8HcOawOXwxJmdEkwhU5kl4qXbYTdhfunzhy6db+t//WhG7nHGgjy77Oub+48/5pGFfXO3Do+ccxwGp0oLzfSpGvp/p+3PlP0D0RRCyYIsk7PEw/YRmoBHLqUclYw8Fx5EOa9F8BCNUnLOz/XBbdwoI3ZpQiAsO8ocFHzMavoyCKLsX/ivKX6r6sAjJLsWKcCyiaVGX0EfmW8kXSiDknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrGXFmSDU1g77DBNcy2EnSpV9bMKQxBBXJzGoW5q+fs=;
 b=nf6tpforAYIAnvTqRCkTGa7FpzHM4R5/Wn+uPmGTDGojtI+f8O/U9thoyrqHHUb3rpnbVMrnnSB+FLgV3ZSrFEFkDzxhw5mU4MSl6HAyLgpUpBBZkfbm6GedwWCu7Z0U/lCRzjVV3gXB+0qQlmx5nMFIoJHeJnfsWhDwuvZlq9g=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB7166.namprd10.prod.outlook.com (2603:10b6:208:3f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 12:38:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 12:38:50 +0000
Date: Thu, 12 Jun 2025 13:38:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: peng li <peng8420.li@gmail.com>
Cc: david@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/pagewalk: Clean up folio_walk_start() by removing
 expose_page
Message-ID: <eab54d68-35f4-411f-8c1c-aa67be702f2b@lucifer.local>
References: <20250612120903.2678910-1-peng8420.li@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612120903.2678910-1-peng8420.li@gmail.com>
X-ClientProxiedBy: LO2P265CA0502.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db501be-41d0-4c13-03b2-08dda9ae1554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2N4vLPUmty2woQ7K2He76jaRsvQOytAGVpLfX5WjDQVvuvvXACnfon53h1x1?=
 =?us-ascii?Q?v8Nw97rrvBoQrdnsC4ADvGPwqdwTh63maQXEvWTpevOMOPzwoKaE4jYRX60o?=
 =?us-ascii?Q?XUOZ7FqQhLe/wrWJ4dEUrrTDjIBxV2A59Sv+nCX2A3RIe+4P+W01B2U70Sru?=
 =?us-ascii?Q?HCnCdPaKbxEEZ+JuJ3rd2z5TMf2V71gfY4+4EESkaf++p8nxRH1QogVt6BBk?=
 =?us-ascii?Q?M/3wNZ9C+Vcx+fJXJVDy1MqqXvy6G3Duk5hWNfs9BdkyMgEp278AjGd85aeK?=
 =?us-ascii?Q?H3iTtK0mG/jxHuEKvD/p90WOdrX8KeKZmRQpUA7ulliW2WR5DNhIvpDwwnxD?=
 =?us-ascii?Q?2S/+7VzshOlH1zQ55ll52G7blq5zkLvytNv0FdjodD/i/xiY9vp4uveZTNoS?=
 =?us-ascii?Q?IY78trNNXX4xDX4ep/xtBskRY0t5sE2cOcSdu4Zyn9KWu76hS2EbLDWLlEa2?=
 =?us-ascii?Q?wQuoG+HRzf/bOg6ZdzyGvB9TzAMB4/x8f1l0QK1DHuQQdxA7VSN/DInOc1V7?=
 =?us-ascii?Q?sFN0h4bGoI3ugKDKpz9nHSKQD2m5WQ0j3Yzjmx1pTjZ65YbHxS4NVumY2VGM?=
 =?us-ascii?Q?m6Px1MsFlX3wjjFjloDnTAEjqbwdE6DtCsxKCpjD/rXLUhYvgFHHBvk3BT27?=
 =?us-ascii?Q?B3wQ7+72SoVbQhyNPO6xdLxXrYQFVireI3+ALMLZLYgYzApHdnL+Jirt5qYr?=
 =?us-ascii?Q?/O/rPxvhNT/wtgJ98s7C8m33CA9sITe3pwSxCoPszs3gb4G5JUNsJZfjQn08?=
 =?us-ascii?Q?mG3ZOUKpIMYmeXryxQ77tYOyGoiCCe9jvdCt+rTX6vR1zbQM66G9BUehWn3Q?=
 =?us-ascii?Q?PVvTbgmdR6Rtp1NGXmvSYs+E6pAgJWcHZCKwnIKkugrUdIFqhHh0049sQhkC?=
 =?us-ascii?Q?LayXRRzNE6Wxnbk6tZVTL9ImrMplbKlYXJA7Jh96VWlwPH9DGt3/l/dryGp2?=
 =?us-ascii?Q?EbR1jqw7SGOk/02av7Cv9oR5pfFepvvY7b4GXPcTNxprvG4SXdkqQgI/81Ne?=
 =?us-ascii?Q?wVG8pMiDcl5/8/ghYEsyUQcXnZA6TbMqh0kNckGvq3IsO2DDuRvCNt5+nBXC?=
 =?us-ascii?Q?HbW020woWuLnXqBYq6OGfLmLv9B6kTcsr4u4U+g6K/ZUJsLyfTQ/O6AaQhOs?=
 =?us-ascii?Q?9I5aPTWhEPYh76OgInKog2qa9E1FLv+GmHYqmjUFIiQgsRDs5EC5alMdb9WI?=
 =?us-ascii?Q?N6I/nijtfmDYiVJSCEMMZB+/4Zvqw3HF2sIjU3meUXjHv62Opn0NrXd5aqIG?=
 =?us-ascii?Q?Vr9lbjBuApOyG0mjCAwbAhLrEMK+3BmqXCO3WsWdaHTZem2ZRvpeeZB0fCrZ?=
 =?us-ascii?Q?a6fTnYTq2Y0VQ/A0bYlHC/UmRTOnwmXi2rCoIbBgpAmhqf9QOiE4GYF7QxKo?=
 =?us-ascii?Q?/seBT1nvJyrGDEInudhvnEEiaAcvEifCCXtyKGYXJMuDRdcBnQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ka976CXCZ1+jTSz+ULt7/p3D0LzyA7hzYQC1p2Ohr1/tRVTCQ/PF23cYu0om?=
 =?us-ascii?Q?pjrn+avoRWi+DtXo9hT/IgR6C/W/zgyMPz3hHHEkVfcS55Dy9IbEvPDmMdxI?=
 =?us-ascii?Q?4Tt4FeAot1B3foc8G6gHlFUJivkBbtUxm/JvlDde82DYmOLZ+YqfGBLmENII?=
 =?us-ascii?Q?/goTrRMTP/tJLX2ARnm3rfIb51ogB+mwYg/x7Vsnu57kJ604ppt3yLCornLG?=
 =?us-ascii?Q?ZM/tz067CQyKcLWj2mAWi2xGfJ/tFNPc21X0mBLT5stlgZkhCADFqc6uli0e?=
 =?us-ascii?Q?QnaG2WNX/Irr2HFahRFzub0Qwmz2v9JzfVpVB5QD8x92v47AripKcgfJW5KS?=
 =?us-ascii?Q?T0uqd4QkKbByul2Sdr6oNepkg8q6aTMZoHQMpLMiR0qpKcTRRscjSSdndHyj?=
 =?us-ascii?Q?5bwy4IBWmzlByhdvZyFz4YDfgPygFgc501Mw6u3ZDECjHAhq6dgrtcIHP31P?=
 =?us-ascii?Q?uHMTcR//LGQAGs9NnruQJkl6//ecy5m+nsguuYJwEM+H5F0vfQE9VEbldnBs?=
 =?us-ascii?Q?rDtPDJVSdC0zQqbvLUe+5ffmIzvz1cEEK7MtXrt8Ao16zq3uMmhTUUU5jqaZ?=
 =?us-ascii?Q?jAaJv2Kp1PMWzVUo3ri8E2s2X4x7x58Iw/acqvJahHtkKi49aWpE4QXi6T4j?=
 =?us-ascii?Q?ohGw54Z0rAoIEEuTuio0KMOXv1JjA5Spg1ShY6w6wzYNhFlXqfqgDU7eacOD?=
 =?us-ascii?Q?1KxFDGXjdGNhA9+4ga4C1cUFSkRbG2zIG+JJJaHwoQvquxSEpOJ/dNhFM6Cr?=
 =?us-ascii?Q?RoUJ4eBkw5kfVhrwg7HoxvdEAXnVtnossbgiC8iUNyaytYxUsw27MPl99cOx?=
 =?us-ascii?Q?tkiYSZ0iqB1TvtnJnepaBnLuTO1kAIkv2DAHwAm3vOBrtGbAf7s6ndHwxIej?=
 =?us-ascii?Q?LoXlKJWeP5Dbf1d5YeEoxNqYy4eHD+Zr06njxkMf6V2UhctrM636/n9twcSd?=
 =?us-ascii?Q?hGRXb2ONWOocbht5fXAExINE4oUoc5TyPxAlBjRjwz7eVYsRcxWdoLSeu8O8?=
 =?us-ascii?Q?xMEEh5JdrAt6M85cBRl3Ez6OdF3mTjmddZ+xlTE2uYrA0Vs97MGcjrqLsk7i?=
 =?us-ascii?Q?6WrU2PJtjs6fOAoWBpJq+f/KEeSfnHLdiD7Dn0dDVs/CxdXpc9dB8AsAh7Ar?=
 =?us-ascii?Q?eyqJ5k/hFCRA/iXtbLgo796sav0b0lNeg2IJ5n4UsWhExr4aNV3DUMYX6EQy?=
 =?us-ascii?Q?DC8Ed2xOIwXnwQ8FC5tkK6luBUlFgdm+GXtMADctREm58K2gteFdUSTbJFRq?=
 =?us-ascii?Q?YhnfWPQXBZoiU5yNF8FKVUqJB26VooRU4J2mg98GB5hDCrKF0chDcXMHLuMz?=
 =?us-ascii?Q?A8b38Nd8hpUZGCdDJmVUMI4Jy8Lr3yQDv+28bKo/AUCanLd1LepHOiYQ4b8T?=
 =?us-ascii?Q?YKIASR6DwvVaA/+XAeXp4AuMWun/SJpH9b0gnad3hi2M3jJy86pOocqH1PAg?=
 =?us-ascii?Q?sQF6aj+t+SKfJiXfIg9dNpz8PvMewxUQ4ZDNYUgg4DhNqb90LeCXFGyVsxuO?=
 =?us-ascii?Q?ljSjtnJiVrKb8CEmv3NAFDbD/7hAsmQOPQdk4U+O6pJVpWyVnCBOJ4sarLfS?=
 =?us-ascii?Q?CFuDlr8VcSj9Bn0Y5xTHUqd+J11qq41tIIh7BX3gcpWT8PHBK2R8ozAvqCdY?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HyBXSuvTN7XmQcEvpB0dkme7a6GooX6e8Nhwm83G1s92J+f4mHRbixZbSdyq6gQEnelunYmEiQhK00qcwJSnbVsutWEnegIsH12TMJbcijaXUm4y6vFPpZk96Zdlvg1qJt/mJnwazQdjvYtGsmD4RVQJyHaP4t9P2Ee6302qBkR3CIh8gKBmHFDmZ0uBX/sDPzQYQkV4tBznvh/WD/GSkjj1FNgEyLALD2txh3yMzCTolJD3KrRNP3XG8WZj/tFIYPo2ui1tX1d0abFF9Qe5J7UHTvMkmAsHnxee4ieDvkxf1CdPAl5EBCI60d7V7/ntw/O/XXn+tfOInUBmzpzmVvFrvKxXb6IaHBtaHfB4RLbE7xe6uIKr7+MFmRiqIcpZzraz4WthOvWZW4BR/YkK9o58uGLpHdgpkqjS/P/ystgxbvlmyy3uPSnY8bVNJK4/GBl0JHM0of/8z9F3Otd+Ln7P9ZS3767w+pvUOp6go6LN166Tekfykpka5n3n0sZTgM9AN3pIbUbkFfVSHc1mJAFuOdNs2tQVqpamy+IHzjnrYhRU/NKBMSw3LfcUT/TtcFPVWBi/3Ey9dJ0m6BxnIWH0OyPhtao2HfWFHVOKv4E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db501be-41d0-4c13-03b2-08dda9ae1554
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:38:50.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHolygLW7HGB970YNtLs2nZwnGFpI+ZLvTkz8soVxy29+TYCqPWKBo6TP/tOQ/UlQRjgavlzxUnPBe5pfLOWoWAkxzPP+2P4DgMeK+6lBuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506120097
X-Proofpoint-ORIG-GUID: Dc_k9gXHcgSTzE96GPMUY3MvDPx19xD9
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=684aca62 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=bGrusymgq6STZoYsp94A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5NyBTYWx0ZWRfX0CESfDZABxmp DjNBvisLo/tm2cFUSS7mTuSyXkf7HTXqYiMJe+4WJdyjQ7GOv4GAUoqo0/J1iWFKlvZ2I4t0+Cn E1WhOQ+6qTWnCz+g+y22fMSDCTzp5oOwP3zZeBLZHneTL0yMUut57iwTzXOZgowR0i89NequYQk
 CkgvA3eXUV6QzcwEOqqFyTLRy/HHu7fwUvttagcChzgG5/3eJos8teimzNDHgx1QhZacfYwL7+G XgH0fPDhkuXP2iGt5XzZmRpb4uPh+YkcwNlbywH7h0teNLKi/8trxLKdhXabDLMRnrZNLvKUAzL dNx4YQYr9xUxlnZqH6R9fMcSBqK4LF8H7xhY8aGGOcA6YAQ0VpMEuMKJqef2vWeHILrmOoiniYQ
 Kqtv9K7sNYovi99tZKPizfaZOYB9XUuiLtVwsBjFkna+TE4302LIXXJRsJMKpB9NEuauWzaT
X-Proofpoint-GUID: Dc_k9gXHcgSTzE96GPMUY3MvDPx19xD9

On Thu, Jun 12, 2025 at 08:09:03PM +0800, peng li wrote:
> The name expose_page is confusing to understand. From the code logic, it is
> probably meant to express "belongs to the normal page and get offset from
> the mapped page"?
> Perhaps changing "expose_page" to "normal_mapped_page" can better express
> its behavior? But perhaps its existence is meaningless, because fw->page
> can be directly confirmed and obtained from the page type without the need
> for a separate flag.
>
> Key changes:
> 1. Remove expose_page and its conditional logic
> 2. Always set fw->page when a valid page is found
> 3. Add clarifying comments about offset calculation
> 4. Initialize fw->page to NULL at PMD/PTE levels

>
> Signed-off-by: peng li <peng8420.li@gmail.com>

This patch amounts to 're-duplicate some de-duplicated code'. This isn't good.

Sorry but you need to try again here, this is making the code objectively worse.

> ---
>  mm/pagewalk.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e478777c86e1..15150c27b9cf 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -831,7 +831,6 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  		folio_walk_flags_t flags)
>  {
>  	unsigned long entry_size;
> -	bool expose_page = true;
>  	struct page *page;
>  	pud_t *pudp, pud;
>  	pmd_t *pmdp, pmd;
> @@ -884,6 +883,9 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  		 * support PUD mappings in VM_PFNMAP|VM_MIXEDMAP VMAs.
>  		 */
>  		page = pud_page(pud);
> +
> +		/* Note: Offset from the mapped page, not the folio start. */
> +		fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
>  		goto found;
>  	}
>
> @@ -902,6 +904,7 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  		fw->level = FW_LEVEL_PMD;
>  		fw->pmdp = pmdp;
>  		fw->pmd = pmd;
> +		fw->page = NULL;
>
>  		if (pmd_none(pmd)) {
>  			spin_unlock(ptl);
> @@ -912,11 +915,12 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  		} else if (pmd_present(pmd)) {
>  			page = vm_normal_page_pmd(vma, addr, pmd);
>  			if (page) {
> +				/* Note: Offset from the mapped page, not the folio start. */
> +				fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);


This is no good, you're duplicating the code.

>  				goto found;
>  			} else if ((flags & FW_ZEROPAGE) &&
>  				    is_huge_zero_pmd(pmd)) {
>  				page = pfn_to_page(pmd_pfn(pmd));
> -				expose_page = false;
>  				goto found;
>  			}
>  		} else if ((flags & FW_MIGRATION) &&
> @@ -924,7 +928,6 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  			swp_entry_t entry = pmd_to_swp_entry(pmd);
>
>  			page = pfn_swap_entry_to_page(entry);
> -			expose_page = false;
>  			goto found;
>  		}
>  		spin_unlock(ptl);
> @@ -942,15 +945,18 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  	fw->level = FW_LEVEL_PTE;
>  	fw->ptep = ptep;
>  	fw->pte = pte;
> +	fw->page = NULL;
>
>  	if (pte_present(pte)) {
>  		page = vm_normal_page(vma, addr, pte);
> -		if (page)
> +		if (page) {
> +			/* Note: Offset from the mapped page, not the folio start. */
> +			fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);

Now you're triplicating this code, this is the whole reason this was done in the
first place presumably...

>  			goto found;
> +		}
>  		if ((flags & FW_ZEROPAGE) &&
>  		    is_zero_pfn(pte_pfn(pte))) {
>  			page = pfn_to_page(pte_pfn(pte));
> -			expose_page = false;
>  			goto found;
>  		}
>  	} else if (!pte_none(pte)) {
> @@ -959,7 +965,6 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  		if ((flags & FW_MIGRATION) &&
>  		    is_migration_entry(entry)) {
>  			page = pfn_swap_entry_to_page(entry);
> -			expose_page = false;
>  			goto found;
>  		}
>  	}
> @@ -968,11 +973,6 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  	vma_pgtable_walk_end(vma);
>  	return NULL;
>  found:
> -	if (expose_page)
> -		/* Note: Offset from the mapped page, not the folio start. */
> -		fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
> -	else
> -		fw->page = NULL;
>  	fw->ptl = ptl;
>  	return page_folio(page);
>  }
>
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> --
> 2.25.1
>

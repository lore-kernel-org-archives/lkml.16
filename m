Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954A1E25EB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744967739; cv=fail; b=b5kmph3HmbHNxWq4SKR3koZhIM2IJ/u9iBUusl1U0wSYJiBEoVsPD8tD1ZwhVf09twBnlQQQv01iZ55T/2Nxjk8maGoNwqWRoXYaKt50HJAxPgauprN4wSolyVnC2cF2Fd/QauPMyKq6Fpnw8MmgHLdUtFTAtfnU4oii2CnwmAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744967739; c=relaxed/simple;
	bh=ASPA9Fq950SCQ4nnbOkTzEq4HgWt/zru1KWV42tvOo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XtVFjMwqu10NOgkyVzwigFcqsykAEs7f52HQJfIHMFFgP2sOEyYS1rdJAhbNlDBpKp1yv5LdShAmhHh8nz1OymijqusmQLPGvghYcckv2s5/HOfURvJFCWp9KtToqTAs4rWD9caStr67pU3uoRNg6zVHfBTpmkIEPwr19cH1T6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Nv6HaMzs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kjjyA6FH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Nv6HaMzs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kjjyA6FH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7u2AS028433;
	Fri, 18 Apr 2025 09:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=QqICeje0D4nWjsu8jtcN03uBPO5dURvDDcwIzfftjeA=; b=
	Nv6HaMzs9yc/Ecdq36dGmlLyqvRCnPv3nLEI0QZIcc3XSM1ve3Jfd8OUd7pgr1Gf
	4hrmeHDcdZ/T3QpF9Rq+ZCkwkU9HfnnGSSTB5o/MPkrr2a/W+cyVZWJnypZ6+hjc
	R6secebpiSj06IcQfY+s9q2vHObuL2Cu2LvTitKArcNAtod8UEJKBQoRbCWTwo2P
	lL9CuKIhH5OKeh3zcy7g/56+4ORGa/09hstU36xwI/kKSpPW88OR6wrpJ0R2JE/g
	8vcAK2fCT21g91ts22H5rjECAgabM0EGBVEt7j6qVgyVq7HJnLfy2dFds1qABGcn
	pB9i4zRpQnm1W4gO5VNxZA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180wg574-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:14:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53I74woD030966;
	Fri, 18 Apr 2025 09:14:57 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010022.outbound.protection.outlook.com [40.93.12.22])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460dbexq5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:14:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j11349ODJaDhKB4h8/+qBGusQnK5tTDKV9jvO7bfWp1HKqL0Gt0Ut+ljxlXmHilX8BJmwqnJBFOKukVYbap6B1de9w3Ph+nN7oWSG/24nmcnSPLPpe4lr9F4EdyXJk5th6374xI0zsK5g3Vhq7O9f0+cu3WRSCivpKEt+5r9p0PnWRiXAAkzp3k2tnWuXAXkNZ268iI4lRbccuOwAyJJPvxGCvQRElZZ+uI6EAUcujH21Sbqt4UeQogQ6L44A+7Ghkr6ElQVs/+HCEGN/o39seQ469E+RJfCdqfrdKouSqGiRiZFvW7prlbYWRCkAZYDfHZDDxWysasijfCYZSOblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqICeje0D4nWjsu8jtcN03uBPO5dURvDDcwIzfftjeA=;
 b=HO3BAzGKl1VxbWV9k1iZtxrwlsR1tsmJB/oE4+BKV/CnQznKeSXm1049uV8aa635uFFtfOi1W4P6YfBdVxPFREIVdVTtnMj/RBvyCK64iXFx1hcBAkjRKl6mtbd/3PucNdwxy7nKlkfYJGyScwBCPeq9+LeENn6SFsokpkGgZBIvijIurZUvucKzFudnAsqfYQJpB79DHIRcqoHyoFagP8OxMWokhfc2s1Hx7+KhYSz0rLM/i+OuGH3RuKHe0L7OOIfeIaYmToBW80/QdipTt4ZHvFruFN40vIb8TuVQS/QByOLNoAz0qw8vByL79YdBLhHTTcCJIr8ZBZlASb1p8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqICeje0D4nWjsu8jtcN03uBPO5dURvDDcwIzfftjeA=;
 b=kjjyA6FHyXDQIJfwMN+NUC+CDlrR54fqS6tIckwMzisuTx3Pdf200OTd3fjk4uhfgqHdUKxaWvzlHmi4rtzpPGUn2bv3V76kuRWHTzUXTZtYPtp3xgyJ3jzuoO7UgLINmKzpwXT1wdcRpF6K4yzewA7QvL0p1FXJPR2kncB3+9g=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH4PR10MB8148.namprd10.prod.outlook.com (2603:10b6:610:244::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Fri, 18 Apr
 2025 09:14:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 09:14:54 +0000
Date: Fri, 18 Apr 2025 10:14:52 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Ye Liu <liuye@kylinos.cn>, David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 2/3] mm/rmap: fix typo in comment in page_address_in_vma
Message-ID: <a35142cb-4c7c-471d-8f71-4ac54a26c8fa@lucifer.local>
References: <20250418075226.695014-1-ye.liu@linux.dev>
 <20250418075226.695014-3-ye.liu@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418075226.695014-3-ye.liu@linux.dev>
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH4PR10MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: c56c1c2d-3ec9-4276-3702-08dd7e597b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RStqc3UwV080b0JhaUN2OVFFZVBlY0pnNUtxY0ZhYVBHdXpUMlAvTVQybkYy?=
 =?utf-8?B?bmVrQzZPelVXaURFeDVKV0hHREFaMDNGUis5RDdPaGJjWmhyZ1BqRUlJRS95?=
 =?utf-8?B?c1R2N0J6OU5KS0diTGNsNVVBTkl5K0ZzWlRBaW9ZZmk0STI2SERkNlRtcHI2?=
 =?utf-8?B?UWw3MWhTdkloNXdSeFVmSmNxZ0QrSlpkS3drK2FDYUpXd0pwdUxLS3craUlE?=
 =?utf-8?B?RTVlNlpkYU5KOFRaUGZkNTVxNElwYm04UGtVdzRURmNaK2pSVGkxelBtZjNO?=
 =?utf-8?B?QnpkSENYVlI5NGRIdTVoUmJHZU9VSWFxSlRqbDFTaVJVRGx5WlVEVy9tQWMr?=
 =?utf-8?B?aDZCVUVNNzIvSnVtbkI0SC96T1cxam9wbTBuZWFPS3J2bmRvR1VoZ0lWUlNy?=
 =?utf-8?B?N3p0TGdoTGczTE1zWk1mWUN6V2FudVJrRVdGWTNrL1gwVEhSVUJCWWlmYWZn?=
 =?utf-8?B?elFiYng5WEpUSUZOOEVUK1g4VTNrb05FelUxWURWYUIwQWo0ZEZqU1g1L3Bi?=
 =?utf-8?B?MFQ1cDNJSUd0VXdkaEcrRG44cjNHTjZzbVF3S3puUDBsckZ3L1FMMy9QMUdU?=
 =?utf-8?B?OU1WOEhiS0tMV3JXY2ZvY2VqVVJ4aEZvYlpWTDdhQVpMdndpSzRrQXd1c3FL?=
 =?utf-8?B?cXBObHlScjAveEhuT3p3d3pSeUM5aHdEa014Wm5EaUFCcS91NkJyL2tJc08r?=
 =?utf-8?B?R0NSeFV1bndUY283TzRGcmpWNHlKRE1KbkxZQTBwc1JBNW9scmVmcmJsUVl4?=
 =?utf-8?B?MEtGdmo0OS9BRkxmYUJqSG1xL0V2Vnp6ZCtUa0ZQUXE2Qno2ejJlVFhDeEMz?=
 =?utf-8?B?T3ZjcmlJY2VBUUdFUmU3empWWldSRFp0TThTRHBvayt0dHo0ajkxZ214VmZG?=
 =?utf-8?B?cmY4Yk1Ld1BKQ2IrdjN3c05IVlhXejBIdjVQSkw3bm41SE4zQ1BHNllKbE1i?=
 =?utf-8?B?WlRKWFJ1bHE1NVE5MlJUeEVtekszVmc2MmZtNE5OWk0wTFg3ZEFVcmJlMTEy?=
 =?utf-8?B?S3lvMGdId3Y4UXFXdDR6SGo0WG5VZGlhdFlZdkRzTitwU24yOXVoTUhYOUwx?=
 =?utf-8?B?VS9PQXlHU1dMT0Nrd0lPdXlHdDhoNGNUTkJTcjFTci9BazkzMngySWlJbEJX?=
 =?utf-8?B?T2QyQUVHUnY5M29vc1VZS092cHI4dFdNaGhJU3B0S3dqY3hEVVNLd0tFbFJp?=
 =?utf-8?B?SDA3QzQ2cmk1OWhMK2Yxc3JDbVpPVUZDLytWZmx6U3A1SDRjL2E2K290SVNC?=
 =?utf-8?B?UklLdWV2MmtNeGhabTBQRWV0WVZtQ1FscEFLM0xzV2V4elA4N1MxUDNOQWdE?=
 =?utf-8?B?Zis3VVFHWVVUc2l2d251Lzl6dGhaNC9SNGsralpTTmFMNVBCNjh4Sk1hZGxk?=
 =?utf-8?B?azVEM3Z4eFArUEE2bUtJVk5RQ2xzbUdqc1c1TG1zQ0FhejNQN3NNRzdpdHRC?=
 =?utf-8?B?QkxXT2syakcwYUtxS3cwQWlJM1EwNXJYKzFLS0htZmZIUnNJSHY5THg5VjVI?=
 =?utf-8?B?NUZRaXlrQlRTL0NaL0pabGNPTzBjL3VzQU9OeW9aZU9WL0M5OVllL3BOTzd5?=
 =?utf-8?B?dW0wR2RDbDRlN2lWY1ZrNFQwVStiZHZXRXVqbzN0UUNiRWVhOXk4ZmNrOHNW?=
 =?utf-8?B?K0FMbFFZU3VsM3F3eXdCeWJxdndZdjdtV3FQanl4a1lFcjFLUXFJQmU2SzZr?=
 =?utf-8?B?NWo0S3Fpa0xKNXJiZld5ck5QZ3BjT0hMUFU2aFRBVTNLMWcyR3o0eitiNmtN?=
 =?utf-8?B?cW5wSElYSm9JMVc1eE5QVnREUXd2eDBaQlBEZTlldXFhYmVMNW0yd1B1clIr?=
 =?utf-8?B?WUt2NHZLZ2piNE9iRE5SVlhMWC9ORzYvSU5obDFhVHFxeTErMlhMVkV3NDJx?=
 =?utf-8?B?cTM0Q2NObFlRSDFRZ1BycmdwZlB0dFBlY3ZhejQxMjNDUHlxalZVMExzNUJX?=
 =?utf-8?Q?Am03YgMbgXY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXhEUThqd1o2aHJ6ZmgwNm9UTlhEU2pnL2t5QWtrMFp5LzdSQjUxT2dpcjl3?=
 =?utf-8?B?d1dMWGg3dDFDNjc2UkR6ZzI2d0FYOWQwUkVxa3VmMzM4N2ZlQ0dDMUI0T2lN?=
 =?utf-8?B?ZG4wNWZNWCtBbzZGMWxQMmJJdS93MEVrRmVwTDhCbDZ0SjBsSG82L0pab1li?=
 =?utf-8?B?N1orT3BNd0pMUEF4KzhIUC82cnd2SERUYzgwa1k2VzVDaDJucWNoR1RZVjZP?=
 =?utf-8?B?dDhweXlFMW1uL1Fvc0Q4WGdyeko3Z1I1MzhiZ09JVmVZaFIyV1Z0QUNXeVk2?=
 =?utf-8?B?ZCtPTU9aOGdWNmFJRmJhVXlqK3NjQkpMOWsrdm5NWmNXdjZQWlFLNUN1L2Fv?=
 =?utf-8?B?NElBL3NXMExMVDNqaG8xRkVTRFRISUUwbXhlOE45UDd4czRWVmw2TFRWTFYw?=
 =?utf-8?B?N1BoZ0pKRzBHTFNGS01aZUtyNkpYakhvRDNIaHVkQ3ZaUkd5WkYramJieHlh?=
 =?utf-8?B?aEFCNmEzaXczeWNKc2VRdnNmRlhKSC9nZGRlZ0hna29zTmtVclFXZWQvSjJ2?=
 =?utf-8?B?WW9iR3lVVEtxU0NLZ3dZVGhmczBOYXBzNm5zaUs2R1BBOEVDMnIzWDZhZzMv?=
 =?utf-8?B?WjN4ZERmRERFWkpuUVBOQS9xZHM4OHg3bmQ3YythNURQdGJXVm5FcnBLZUZW?=
 =?utf-8?B?YXE5d2RGcVpYbEhOVWZyUUhBVG5tVjB4cHNaN3p2UkdYUnJSTTkxS2pmU0pD?=
 =?utf-8?B?TW9IY0xXRjhiR0dMWE9YaFFVenpUQUlnWXp4NmlDbjlPL3NpSWY4ODVYSDVG?=
 =?utf-8?B?ZkVWOWNJUEFFN0JRL2RtVU5RS3ZNOG42dk5rS0hGaXBObWMxVllRbHdPQjk2?=
 =?utf-8?B?QTZCNDBQdS81S1RyUGZhTnBnQjRtZjZLUXJuek1SeldpREpUL2JZeTVXK0o4?=
 =?utf-8?B?a2ZWUEdRRDZOTnJnSXZvdWVJcDQ1V2RSQ2JubU9oSUhNb21EVlRDUXJxSis5?=
 =?utf-8?B?cW9DT2I4OXpKNkQzanBhREtFOGlUbnh1WUVlbC9Xa0dBUVhaYjdBcnRxMUtk?=
 =?utf-8?B?NVZpYzRLa1c3RER0QnlrZGtjTkRtNkVpUmZERVU2WnRDdHRmcCt5SHNERjhK?=
 =?utf-8?B?SnMrcW1hSnAwQU9xNjBvQUdlbWFXbHVCU3l2OS9Vak04MmtHM2NtMzR6Mkkv?=
 =?utf-8?B?azVDaklrOGNxempDUXFCRi9SSmRGbVFiZUNNZEhNcCtWSlhzWGwvZ1dFUVlG?=
 =?utf-8?B?Q0c3N0I0UVlYSmVRK09FNWhscjlKaWU0VVJxV2R1MmlNcDVhWi8vT3FuQTF2?=
 =?utf-8?B?dk9lUjVwQTM5S1FDeXluTlJTTjFkaHNhbnZsckVIWFh4NDdwR2pEeVBNeE9V?=
 =?utf-8?B?bkUxVWtzYzhSZTB1VGl6S2RnWkNEcnk1OFB3T0hoQ08zWVBtL0duTjRDSzc2?=
 =?utf-8?B?eGd1UjJtTThVdWxMOUNIZlp0dkZnWTVyNWZZSjlQN3RWVEIxeU5vMHZMZnlW?=
 =?utf-8?B?a0djeFVqaGVPWHNJUDdORjIyUFg3Y1VuTVBqNzNiN3J1WVdDNG5FZkRhaFhi?=
 =?utf-8?B?cEthUDdUM3gzUWZQS1dlSitvWnBacnVnWVVZYnRPMXhmR2ltKy9tdk9UQXkr?=
 =?utf-8?B?dk5XeDhCSEJnK21NaG9aYXpYREpUeUw1Y3B5aDJzaGkwKzYwdDJsZnB6SkRZ?=
 =?utf-8?B?dm4xaGFDWHl1THJxWFNKTHZnTTRtWXFUUkZyaHB6eThDcndCUnRYZ29xbytB?=
 =?utf-8?B?OEhqdGJrdU5qMUw3WXVxeWlSUmFHMGFmQjZLZFNFb1VGVTdnUmFlMUVvOTk5?=
 =?utf-8?B?djMrdW9sZEREdHg2VTl6MFRCVVpJVGtHNk1YdjMzSkFqNFV4Qm9COUJ3WVpE?=
 =?utf-8?B?RFNERFFyWkJUNG9xcG1xZ2lKcGhGVUVJaTBIY0w5cklKSEtwbjZ1R0FuNE5J?=
 =?utf-8?B?Rkp4djdQSW1VME1ka0tweTQ2V3doMkRycm9mVndtUUlSVE5sbDFuVFZnSFJD?=
 =?utf-8?B?bU8xRnNac0xwdmozaEpleFNKYytjRTd1aDhrazUxYTBDQkZoejkrMDkxN0pJ?=
 =?utf-8?B?UGpoa1dFcFYwTk5KTkFmc1AvRUg1a0xKWlBSZnFPL3oxMTA4U3hXcHlob1lX?=
 =?utf-8?B?aFpSeHpyYzJ5TWY1RUI3NkdLUEV4aTlkZkJVc1BaWnY0bEN2OWlWc2h4OHp3?=
 =?utf-8?B?bU43OFRDdy9BNTQ2bHg3ZGZodERvblhyeXNhdENvKzhBdXYvNnNvN1pTNjd4?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wmm9CMT0WwJbYwoyapl2/ngw7OfWAXn9b5Sd6BuAIr0T4d/2zswqK8m0xC6igbHdUkqtqhGAyKoFw5Z4N9GrKKjD9yGqZyZzf1O3xfQCUD1qiumGQDykQzb/dOIJu9EadStYL8B1XeCMi56o/MtDHEPQXlxTJFx0wG6aMhMM6d+qXVhKMubM3xbTKGfnL8R4lLeV/JV+hHGY+Wuq46QBZ/02b2tFA0f5TQSHb3UAgCEbRNAIt3wH/EY3DESoJwo8RAlYiFaWn/L2LF4+1G49/fYKvG1mhy6STyO9CL9RI1tcJlntsAfI3YpdcHHloEiWcTBZst5O+Hp80EAa8bvOYgpe1cQKC+Rb8Yrxg32wklG0jd70wE0rs0ydU6nC1H7mhFpA+38Ru5FzWdxZTPSngO50PIEQoT3/Wdd/w89H40qeeP2ZXzW9CT6jUYT39D0uWNpxzRvdNnGcFiCMBagiKQEJ9XRS5gvOpWY7hAc/+jraism2+IKUYkXRTZ89PkQOfMPJdgN/vrru1qeM7+LapQr1jAR152HsE1UWIIVfghn4g4eE6AaLz7pMLFEjUI9xpn51NKYOpeegvaURE/JtXiMSOFrOj1ovOMv9d8VorVE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56c1c2d-3ec9-4276-3702-08dd7e597b7a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 09:14:54.7154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KIquyvsfigZ4fio+om0PEsOyduY6PcOGE5c5nh0jM9i7CmU7alDStwx7Y5UJfncPj+VVxOKJRDeYgvF72S7n3exJ3ydY+X6Anh4pQ8nvg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504180067
X-Proofpoint-ORIG-GUID: timmh6YZLx1KQmtA_WE7nl52vvYwQck5
X-Proofpoint-GUID: timmh6YZLx1KQmtA_WE7nl52vvYwQck5

On Fri, Apr 18, 2025 at 03:52:25PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> Fixes a minor typo in the comment above page_address_in_vma():
> "responsibililty" → "responsibility"
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

LGTM,

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/rmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index b509c226e50d..a9eed8981e18 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -774,7 +774,7 @@ static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
>   * @vma: The VMA we need to know the address in.
>   *
>   * Calculates the user virtual address of this page in the specified VMA.
> - * It is the caller's responsibililty to check the page is actually
> + * It is the caller's responsibility to check the page is actually
>   * within the VMA.  There may not currently be a PTE pointing at this
>   * page, but if a page fault occurs at this address, this is the page
>   * which will be accessed.
> --
> 2.25.1
>

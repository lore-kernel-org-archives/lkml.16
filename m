Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B51828EA45
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557579; cv=fail; b=cs+v+QoUCLfkoVsZ/6ETXJ6Z4tH7t5tTLlNeRPxnNI4jSOB6RWaexRJspUuVXek961QIxNO3KgMgtfDspUh6ztb3w1IGuc1J/rYEySdzJ22+UaA1lJ/7emcRNYL6B5dok3hO2XNrz8zOKM/w2Egj7XRk9d3JxRZuDn2we+dILW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557579; c=relaxed/simple;
	bh=KE5wA8P47uPc9Xdym8VKUqPuAmjEVM59SDHRYlLwgMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D3Cc81tUS8x755agLz1wy08ZuNd8YVsgMRG+iob2s0Btor9h3lFQ1gTTC8XxWZRtUm/AS28YvhUSxbOtXY16xI9jd4pKJvwN7Y6jSp1h2laU7aB4VM13k9Sb7AWvNegpqD6JH4pKvfnjRWM2zsKNr5HwYJecXOefLizEPWhAbgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b2ktUSGz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s8kUvvS0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b2ktUSGz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s8kUvvS0"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A2fbjw007256;
	Tue, 10 Jun 2025 12:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=h0fP2rZYWEPWTtndFa
	OoiPBmdLZRqHtDV9RxytKRyAc=; b=b2ktUSGzj8OjsYG9IgfkmqgBwDIOeKmfyD
	BthGh8k4FvSj+kuBcpKqYz+j19aMTCb/jlsNsGtbJnWc6ZCu/6pq6ssu9GXfnGTf
	SkWpFrCaTAve4O/MarMj2AF/Iors6aMwbSZ8qnx0YUQaQDNjpzCJt8zMI8sk3m3S
	pvsX5/y4efAI0uJTfjYrUHJmy+1vpLZHY23KYhmuvAH4CVw8xRRmTJM7M04qrDxm
	gBthvP1G1WIy90ExGy0/RYQGHMX5cdzHAmx5axBJcWJPwjeULwWZUqSDf43iqrNf
	ZSBDjavJPmvk1+yxjtEzo78/1/wdMVgXBZvw+XGR8IuTmpPgiV0w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14c2xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 12:12:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ABhwDs020775;
	Tue, 10 Jun 2025 12:12:01 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv9c4pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 12:12:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtqMLCDWkP5/ivB0C/7jrw9pye04QVz+kYbXCoMsE2TXTIU97XdE8mxGGeFOjT0DrQp5mjkD2UTdifGrdNQcgVi1dempK3+glGmCBrz4YO601sa1OCR9ALv5s27I848CCj/CX9YTkx+oWJo4rChPhHiKMTotG/vXSuY0JCC++trjlCp376JQa7OBOdKZAm2ECDxwSEAqfzLTiw7BAgHcVIv1L93khbCXFSW6X6iobTDUWWw57lL/wsRC0FlvIPJeTHODiTcKdbKoxXviQJCjH0qXOlDOd+JzH7dayDsJ1URuDqDyR4V7NcCqOXScAZalfehLoHWTOq1Po9WKzGGZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0fP2rZYWEPWTtndFaOoiPBmdLZRqHtDV9RxytKRyAc=;
 b=olHc4Hg3hJrx4UOsjVmkrmo3K3V/IEhYZzYkHpRg/x6XkWgkZRLNNxRh/4PS7j2aYSDerhGC7Px2xV6v6varxKuYK8o3rAaoDswryvN2sCHpySUiXWhKaG74TKoWkjNsB58NhTAgreEEn/SDxl0l76WoMW/AmDYl0TWARdG4T7V7JQy0W3MYkpdUTvksxc1/2tahNoHy3ZIlJdxONOIQfzQnPgruoFcoEoucTMQbksl6X6GCO3YNQZ0TCfpOB1NiEp5ygaPP6KWWZ2zkOn+R0l4hENL/p+Ie5GM0cB8B9h1Oc5ZQkoJEBpNZYsCGUqxDtejm3+UHcbesMZ/0kKfKgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0fP2rZYWEPWTtndFaOoiPBmdLZRqHtDV9RxytKRyAc=;
 b=s8kUvvS0MqU1oqS2WJQkmc8LsPBIZXCOnaLFe5kPLOjwrfyaLhW1LMJLRJDuM7sgtKKizewn1ym7yFNrVfgyQUCx9fzAEWc1Jx46WD4Qn974UZlW6pIP/+uQjKmUM/FaE8whCOvVL24x39c/8mD892ENetlWboh3m7miMMQoZnk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB6424.namprd10.prod.outlook.com (2603:10b6:a03:44e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 12:11:59 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 12:11:59 +0000
Date: Tue, 10 Jun 2025 13:11:56 +0100
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
Subject: Re: [PATCH v4 0/2] Optimize mremap() for large folios
Message-ID: <7cf96262-85b4-4a7f-9ca3-de627ee13a0d@lucifer.local>
References: <20250610035043.75448-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610035043.75448-1-dev.jain@arm.com>
X-ClientProxiedBy: LO4P123CA0262.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: 4042be85-abb1-48e9-4fa7-08dda817fff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EP4Jy6dNUaK8Y4vcHacE8e1ZqZr0c4DXCdPp4UEicagv+FSjNegSewFr06+S?=
 =?us-ascii?Q?t6LZ2Sa3iV8tUHs7gieiS/+Fbns+X5MTdynNg56FiTTxHOMa29tDxiHwvjSv?=
 =?us-ascii?Q?yOKoeU0WengIdDZRVWlcN31YsO4KKc3aw0/xFzx1ldPbDEigjG6SQAY3oPjk?=
 =?us-ascii?Q?ZVMqSwU1jjThzEPL+eOMzVTZoIu+JkIXDy1YbuIeH9FLKth1XYuOWHThvM+V?=
 =?us-ascii?Q?pX29LX7HVvjaiQJ0sAzGcFlGN009uGCowrrvyVWZ8K6xqVQctCjQ2skY2KKN?=
 =?us-ascii?Q?aPwHV+/HgjLbaHwyTmUjrMNpTDJhF8jVr96HtITafz7Jp7wM5SjjBv18yM9Z?=
 =?us-ascii?Q?D2hhH4S4kVLT7kL1khoUiEQR6fCqnDMKsSkaQDzi0pLHenWI+cJ3+76cXpji?=
 =?us-ascii?Q?4zqFFgVOZ9dBEO8KTJnVq+HlwIK+rijaiGkgvGSEQFA9ebmWw1U4uSDiW3FR?=
 =?us-ascii?Q?ZfF2/r+W54iraBbE3OFX5FFKWUEv7Oy4EH/0EEAGcGG+AdSmhIGWJIAGL4q4?=
 =?us-ascii?Q?rSJ1yp/6QNmnqxvQ1EbBDCSsQ4K2/qGgQ/OAFj07fedO0vF8IJ0pEEplxczi?=
 =?us-ascii?Q?sIuO2f0DvyGqgS2krT5k0OfVB8VKfSxEvnauRW16RqkmV2ovCAN4HcTSxttO?=
 =?us-ascii?Q?PGFZjlbOkBLnZfApH1WgcucSE7rm7F1DfDj7mUIJ0N1eXCVDVaC/n/GYKLPA?=
 =?us-ascii?Q?HaF8Q5pd7aHLae/nAQpBELF0yBaaotk2u82sdRHZQQ329XPhgcYPY/yjeWZN?=
 =?us-ascii?Q?+slc99I58XcslD2o84QCsv6NTo7ph2AkB8QJ0taBp88/LrkvGoZLlCPvlG1V?=
 =?us-ascii?Q?pjUBV2W2kfjlVIlbqKaSPfhoBzY/OxMo98FiLwrZQBbt3SUTOW7lmLcc8ZKz?=
 =?us-ascii?Q?CmY8+nflqmKJNbw7OlPfw+olYp/IS+98nQNbjxXRWF3gXJgc5Jx3CCpeCbTy?=
 =?us-ascii?Q?08qbXujlrhSHbupFc6lkkhxoWSWJmpZOj0/jBlNCNdh+ZCk23Y7qSSMNBnMQ?=
 =?us-ascii?Q?1gQsJwT6HFRw4gYjVCEHa0J7LDD/i8OGQtvFp+KklVmRUUQJJJ7n1B1ntOfc?=
 =?us-ascii?Q?PbjIa8YlcYfzsZjxo/+pWxWgCrfv6w0cRdlXUqwhGz08pk8bmbSOdR2n8U3p?=
 =?us-ascii?Q?/NMpHQxCDIs1Lo6egx+jGmEhdyt5b6A3x8BwqNa5tUhLrfF5HMKCxbztN/s8?=
 =?us-ascii?Q?u7cYgVLC7x5cvZ7XvEFMMyCVWX4KeOkpJAPKMKdZJWVRHs7P2rwipgGnzams?=
 =?us-ascii?Q?tmZ0SkBYIZQz2XEScMPc98Qqmyh3GkzV6Rw9XL6yBuuT+C7FncI91dtWqf36?=
 =?us-ascii?Q?zHrMVPsxdeE+WtAfBhYn925/V4RNHdUiohhSNJJvM7qNJz3WdmxaRQLyUJkx?=
 =?us-ascii?Q?A2U7yEDY/I8reH++cJSaXuBJcilB6+zyIRItgGgqK1ZMTEC7ZvXJVTR2YLpD?=
 =?us-ascii?Q?0YJl2LzLbNw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gvJSTWatX6teRgiUCOp9ghZC34HG5t+f1t/iot5lwQ9qEhUIR6iZvzNT6lNt?=
 =?us-ascii?Q?As7AHV0SGHrbF50RgewnGEZkeMvGCRzB7kGkq95uquaPytYUvVOsGkq44XoL?=
 =?us-ascii?Q?1UMRxIYcVMWqtpAcztXm0EFtdBRm4NDgarGZ7Vmh7sYjFnMhK0veXtFgP1Ec?=
 =?us-ascii?Q?h6zgF7TVRgSAeAJFWhkLDNimWa8Fz2REtWVfRXzC5GqprLF2TN3JG3C+1ORq?=
 =?us-ascii?Q?Nd9OIJuzQI/vFR/7z+yLXaqXa8CwZKyrl6ZRUJ3dtvoygiFhsYrQD5qyQTIr?=
 =?us-ascii?Q?qjlIvAG82orEsz04uIFIkjTSsmkiU+BUnN/sOvpni5FMdi/HnD2VAjwYNaRP?=
 =?us-ascii?Q?1cnDWfCszcZNbtZ/mbrLO8S0hbCMoMGYDPMad/whaoP6dsMKL1cuutAoETeq?=
 =?us-ascii?Q?ogMbRX4bfCB68z3aiO9ImyTvfecNZnY9MWRXxEnCVHa9Ua3H3VgZK+jdrQbu?=
 =?us-ascii?Q?4258oWQdV9eMvWIRN/HgcaRFJRBF8kGotfBoK57eI9ydITiQlA0PO1USTcT3?=
 =?us-ascii?Q?Ea6nHwp9MkdkCXPp5CxQtisvPhniYFWLxbEvXUjgRLXi0+4vsOEOB5cyfz+w?=
 =?us-ascii?Q?3Q+U3ryVDfKK6bdIc63E0Uzxh00tOPepnf6rwlAzuFrD5tEF57SMDi+4e0Hr?=
 =?us-ascii?Q?7eJPeWHZ5b5jX//g4sjvE+uEDNogUZEwJ0HFsuALbXGAZ/ZkfgPTnxZUCqgj?=
 =?us-ascii?Q?uXMAW6OrPrFb88TRdp7ZFE7sgBQaHj66IEvr8igbwjU9moLciEg2nuEglTX/?=
 =?us-ascii?Q?0+rPMjK9AZfBOxN4J8TKMvmmdR9DeS6VIrrmQ3riVyHwL3jbKRgdZ40+JLyu?=
 =?us-ascii?Q?YLmnXMb/xzcsDRQwgMhAQ021yY4fPShl/5m0Dp1oKw3H6E/QJ4emtr2t7q3K?=
 =?us-ascii?Q?7GhL0gcSjP8cfwpO13aCV3iHsOvOxABQoT8i+oz6KhfSbgcgsdv3+nNfVJ8j?=
 =?us-ascii?Q?UJA6u2KxRm1r3RVr1gI1/Adnw0bUpztjnVu181Z1XnS/tdnm6RvlthYsC+f9?=
 =?us-ascii?Q?YxIHXi+XrqMBSW2OIsATnFFBdZFbSAYJ0xBnSUY/NuunWvvGGT322XjfUNCG?=
 =?us-ascii?Q?GS/vJxXP8W+UFacMZ96F8Gp2/lSZbjnCivIjErmlWcPMfjd5VxBCYULHxQhn?=
 =?us-ascii?Q?F2i6i5ex6SjjpjhPjSrIkypXFGT3e38WN2prQwKStsR3kpqYSRwRPTac0lXb?=
 =?us-ascii?Q?nyQ6AEo3XPulM2/3ye1WH+/7EqRkM9Z1fLUO+oHol9mFE5AF5yiEX73mctCv?=
 =?us-ascii?Q?xz9AapsRw0HMUViB6z+Gb026LFnYFYB01SqShcX0NXvqlp8n/rWt4sYYzj25?=
 =?us-ascii?Q?OysLLk0ZMMYc3sJmMyjVCagqDfvfSI2StKF68UdHMhdGzGEwQAgP0YHxkyBq?=
 =?us-ascii?Q?HFgo369N/gHq1cezAJgPX04GtWk46jWAVnYMpyIlYZc4x9jl98T/6LATy5CD?=
 =?us-ascii?Q?5fTzAtJd/OfTOOUF0mnHKtwYovB+nMy6gSA2dTbBzOQYxzb1MW2mGFfIsykI?=
 =?us-ascii?Q?KUzB7ZngNKBVDnP9HUcpYZIFAynvpMYwwjUKPG84WBzAeD0mtK5RQLVMcpDp?=
 =?us-ascii?Q?nogyb3uS4sNl9rO6jmJRWxWWKdMENo581/+L68pCquZAJGqKErldhotdR7J/?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5eqAVDcBKGFu1QI2FgI+9Dz55LO52tqXdqpPE4jfniEPx57bGgM4rcpD7e/tokC+C3INbCRqsB2m/3hFB71D7BobSbhikDiX+LiyL7+7VaqYzu/oqe+Mv0uH2iVd8tROJeE2VQy9mv3IocdpWVrsdGVK1SwKjNt1/rmsmvYLPts/itfYI3pchFF2/TV6uyuqk9DZIQtNrZgbFc5Jnux4I+leZkBNc8Jypv83Wh4g/965qy433kqaQfT51SzhLhrUv42cbgjJuNB0WDXc2AZgvulRAG2KpnMcqaTnXY6ROwCNTTFllpsysZ1HdrB1u2g9G38LmtmqCjrpqH0p/6pkhm7d2Vx69rgZoqETzZ5kwtrcizQJD/9Wvx2JWT3fQns624G80UNhC/7wL/2fvF6QK5rBKwPROPVfunCHfM2Z0hgdtRopuETutWCiWdShRRsxzEdahMR4SBOLWr7Gv4Af/j7cI0LwkyIcJ0/ry16BDK0H06KwqZusdLrBG6GDKBC0Fef0yP6WedZxWJdmEUFpBqE9EmFvrg/q5BrvR2KV3+GqY0AALFo7yQeq8nFCxerpPTqzbgZIudGA7gGHcU0lWrvSzek6+akUbAHZD5DvdvM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4042be85-abb1-48e9-4fa7-08dda817fff8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 12:11:58.9556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iI6KzXVtfuQjzBtGp6jlZi10EEDZ2MrnNPEs5nSi9saMLGF9aPpTBz9q0qYOSsmINecvM3OmGvaVU4vbO/1g5I1mHv7vNM9j5CsdegWa2Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6424
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=606 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100095
X-Proofpoint-GUID: sAX8Bs2eBLh9G780geg-T0Ii72RZrepZ
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=68482113 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=iNqf3PfALo1hDmsuP2YA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NSBTYWx0ZWRfX3i+snOmhRO7c 1sASa54197s9+BlQiBoZod6ca9HIdj01pw52ou8/f4cyuTNINiZ9NgAFDgAU+CyZOy3JUYYGkZ2 clPJCLD2CpL+b5EMfAVmSEIw1MZNSZ/WTVSkSbdey8PnAOz/71TZRtGtLUmH3PXv69M5gnLa7v0
 VhfMcmE0oAyA/YsAn4oKW3HU67A8CJyUViPp9avlsOsTGgdDvyVRHFEz7TRyXnLhmvCzQjWA4ch M4BC3qL9ccEOigvbNOA7GT4551hbxO7SOKQCdOkID+3lU1Yqjt1asAnIY/fmkqKDAngPklimtpG 1NF+/sf0ldOvhmz5avP6x6Urt/VjDpCQkmjMsclKaBZmIHi5wFD6vbGptiHNez0fW8Hy0vIZcmF
 QQtb39dGK5QKQz1ouaKCp/JUJ3w3XogGXzDlrugdlWc+7tCc/hEYJQXNM42Qfwt4GHQKXerM
X-Proofpoint-ORIG-GUID: sAX8Bs2eBLh9G780geg-T0Ii72RZrepZ

On Tue, Jun 10, 2025 at 09:20:41AM +0530, Dev Jain wrote:
> Currently move_ptes() iterates through ptes one by one. If the underlying
> folio mapped by the ptes is large, we can process those ptes in a batch
> using folio_pte_batch(), thus clearing and setting the PTEs in one go.
> For arm64 specifically, this results in a 16x reduction in the number of
> ptep_get() calls (since on a contig block, ptep_get() on arm64 will iterate
> through all 16 entries to collect a/d bits), and we also elide extra TLBIs
> through get_and_clear_full_ptes, replacing ptep_get_and_clear.

Thanks this is good!

>
> Mapping 1M of memory with 64K folios, memsetting it, remapping it to
> src + 1M, and munmapping it 10,000 times, the average execution time
> reduces from 1.9 to 1.2 seconds, giving a 37% performance optimization,
> on Apple M3 (arm64). No regression is observed for small folios.

Hmm, I thought people were struggling to get M3 to work with Asahi? :) or is
this in a mac-based vm? I've not paid attention to recent developments.

>
> The patchset is based on mm-unstable (6ebffe676fcf).
>
> Test program for reference:
>
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <sys/mman.h>
> #include <string.h>
> #include <errno.h>
>
> #define SIZE (1UL << 20) // 1M
>
> int main(void) {
>     void *new_addr, *addr;
>
>     for (int i = 0; i < 10000; ++i) {
>         addr = mmap((void *)(1UL << 30), SIZE, PROT_READ | PROT_WRITE,
>                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>         if (addr == MAP_FAILED) {
>                 perror("mmap");
>                 return 1;
>         }
>         memset(addr, 0xAA, SIZE);
>
>         new_addr = mremap(addr, SIZE, SIZE, MREMAP_MAYMOVE | MREMAP_FIXED, addr + SIZE);
>         if (new_addr != (addr + SIZE)) {
>                 perror("mremap");
>                 return 1;
>         }
>         munmap(new_addr, SIZE);
>     }
>
> }
>

Thanks for including! Very useful.

> v3->v4:
>  - Remove comment above mremap_folio_pte_batch, improve patch description
>    differentiating between folio splitting and pagetable splitting
> v2->v3:
>  - Refactor mremap_folio_pte_batch, drop maybe_contiguous_pte_pfns, fix
>    indentation (Lorenzo), fix cover letter description (512K -> 1M)

It's nitty but these seem to be getting more and more abbreviated :) not a
massive big deal however ;)

>
> v1->v2:
>  - Expand patch descriptions, move pte declarations to a new line,
>    reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
>    fix loop iteration (Lorenzo)
>  - Merge patch 2 and 3 (Anshuman, Lorenzo)
>  - Fix maybe_contiguous_pte_pfns (Willy)
>
> Dev Jain (2):
>   mm: Call pointers to ptes as ptep
>   mm: Optimize mremap() by PTE batching
>
>  mm/mremap.c | 58 ++++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 42 insertions(+), 16 deletions(-)
>
> --
> 2.30.2
>

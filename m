Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797CE244691;
	Tue, 20 May 2025 14:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752259; cv=fail; b=o1WrAWoAROxVMq4k7mw88+hnKiorS7tuTmo+gOz83Eu6YglgzK2B9O9WT+FbJpsm9xGE4eQ1tmAQ4kdQDNhwnx8mFf5b93vaONdaJYKDQDQptnCWmtIgP4VFFXTQwJ6kLqB5bW6NHaRA1+x+Unu9geJaWRWQWng6qmaGqpc96Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752259; c=relaxed/simple;
	bh=FOzUhtSQMOLac/Xzlod519KnH2TaIieOVPA+P+D6/VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q6O3SOT2C8vd7EQSy03tvTdsjacd2KiAjeQM50uCic6fgLNimZtaQnmuSmXKffBRQLmQPBbwPQeorLVeuigXtH70K7sh4PNiCIbsLyFZ6jD3nDZ0A0tQ6nrLhER6oLh2YCfaa1UQlsU9ZDfphWjwtIxGw6ubWENuJYWdtm2D1dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IaVIaRtk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gfVowkNJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IaVIaRtk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gfVowkNJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KE7BA6024586;
	Tue, 20 May 2025 14:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=NmVHPC3ZcSIR6F0Y/Z
	2jkhlrmcttr9VuA0zzgmx2Khs=; b=IaVIaRtkW8kDHtKTtNUKcPh5zjEOt9TP1O
	58viCByGQ3jYLowUcMCS+0bR2bJBf4o6rxMeuSpjB3ZnwH1kdhmb1Z88J4NOODoy
	ifCdT4mg1htd7C9Z3Z2+8nyAa/fzXmavwnWtqUd8zfty26lJIwuvow/Ajt0NQ/Uk
	owf0w5bKuWRTXjudMVTzM/UIS38W1yx85YLr3qukxrCiduLfydwf3+XV3y3nB4JY
	pvaAaA9mMa+fcRqDtSxE33tjj5uNWJLGiBZr8g01GgJrI1sSp93xFAPn4MbYdnLh
	FG80Y3BhC/v4hLnRH85LyreH0LqiP8EFL4f7ckVfQUAx5bJmVV1w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ru7dr3ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 14:43:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDh3T9028917;
	Tue, 20 May 2025 14:43:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw83cg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 14:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bv9HZyGdzWJrD6uVXV8lgBoXls8CD6yw2CET4tdWcMkb+QQo50Ji0u6ktPEIc1CHGTm9WFdK3oj/LxKbhlyz7oOmevtJ0xqscbu04cClhYFftpLg3tUcbRqwQaKFbCxyE/5Ca+bI3i4SB00WiQWO2SDd8a5ef7MRSnv8VEDmnU5/78CLgGjwHdSEsB3tehseM8KB5hzNeljZQqvjntXFCA5W5InYgcYR7aWCfMOorPqx8omV9uCLiFJjx5kYVbs+PtKqSvHL53ls58BJUO+Ymg5ewpp/FA5PWEvf5kttANpFEr3/au8geMfADWlZyqzrcIty/J/OpsDH74uGWb5Tcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmVHPC3ZcSIR6F0Y/Z2jkhlrmcttr9VuA0zzgmx2Khs=;
 b=pISBMf9Q8QOpVnZ/fZ8LYwth4HngiyDazxjwePzYl1i+epJxAuKTwXak5Ku64W/R6Y58a7J7H3JpmDn4yGxI6NaXFdESm5lX+lGK4V+Fhokfhp8tJ8qf7gj/SfxVMDt2qREAuvehMnP2j7sDBR9o3pRUYRQvIt/DkiH7z7CQCmiO9D/lHMUp8vbz0FpqFDhwcO9cqEpUFTHf4ZCYe5euoJmSaWrZFtCm8M9HYp//K88mhS7J8Cm124Z7vAaPJeKBBQ9kGNEnMgOefcdlhcKHQPApCpS2tP/k1mR9055CKFbP0j4DASIV6pu+om2qxI44/cfJohPpaUv3s3tyq0Cp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmVHPC3ZcSIR6F0Y/Z2jkhlrmcttr9VuA0zzgmx2Khs=;
 b=gfVowkNJTZTqMXU9w5pvxra49lRK0KzaSvCSWEDFmlQtghpjHeFceBI5NrU1U5YHvf9o9CnysUJCyskN03p65e1yOvmY12tnBpxTxZfKQFVFG9ZrPnynHSet7bRf/FUi0Edmhbaoiden32UO0wdtLN5jcPwN9NcMPiV8BIe2xiA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4757.namprd10.prod.outlook.com (2603:10b6:510:3f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 14:43:20 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 14:43:20 +0000
Date: Tue, 20 May 2025 15:43:17 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz,
        jannh@google.com, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH v3 1/7] mm: khugepaged: extract vm flag setting outside
 of hugepage_madvise
Message-ID: <18be636f-d6a7-4270-b324-22750b3a358c@lucifer.local>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <20250519223307.3601786-2-usamaarif642@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519223307.3601786-2-usamaarif642@gmail.com>
X-ClientProxiedBy: LO2P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 693d8eb2-acc5-40c3-0a0f-08dd97acaa82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+tjlrY7HTaTaNLCT/WQ9FoJlD61ZZkcp6dJzk8y2ldccJb6Agqn40NNp2lz3?=
 =?us-ascii?Q?bgp+R2cuR1GnT+Qo6la7X5XbidUIP/+WbGHM1vaPajtNGXX7gbHasPS/+RMM?=
 =?us-ascii?Q?WG1qXIhm+g6hbvVkuzvmmk4ml3UoMLDdcKjTcvLCTbUlIWmtktaZalcp2M+7?=
 =?us-ascii?Q?dK8rMEMyrtPYDn5NgPK69WL3zGkusX7FgVp5tMPrttlnVyTGou/ULTNQ+wkA?=
 =?us-ascii?Q?HzULrYgn/wI8aZzXDXmsthjV9OBlOKUHnnpFuwWOKfsv7iXr73NlBqGzN5ra?=
 =?us-ascii?Q?IUs+aMnJ+yPuqOjsjV2uWuI1GHCsusfqhC5OxRxB//k45WFiDUhCLNSWWDVG?=
 =?us-ascii?Q?8RSm+BovODVHGbhUsp/Jf66IQp1DRmkkPJTHlKUmc8ZD92pwF5NWFYLVQbvo?=
 =?us-ascii?Q?QfkDulbX1ygpw+X0BCcDbCIJlLCnjN/G0V13/LhZBCZN7t91dBn7wj2wICQE?=
 =?us-ascii?Q?izhOnml3jWOi51fIDeTEJY1iaj6bMw5WFZf+n2h1rkLGEhFuif1gWHhWViN/?=
 =?us-ascii?Q?ZezzvRzLRtOSEMV6OCEft+6wKp4X6dUiPpFZWe7va1dy1jexgLAyST135gh7?=
 =?us-ascii?Q?dY4Cvm9s0/7ueLRPIdyET810K31NYbEkaF13u9Q60mh9fWi70Rm6bMcRKibW?=
 =?us-ascii?Q?LYg1KO+h/wQ+aiyF/MjsCUBWBU0UocWFF6oOO1H5AfzgOg3GmtAyEWx8JI5r?=
 =?us-ascii?Q?wmuVKpP5yIzcZemEl3pYUvlXJWwc27DKpMvyY0gks/p9ra6KzMkzmjXHzxCx?=
 =?us-ascii?Q?ConT/7ydy3VcjJK34Fod94p2mZYk1VslL4ITyjD1zozX1vZcGjqVAd1q2i08?=
 =?us-ascii?Q?fyaweIuEd7HrNai7Aieol8xwymVYcdO8anFpD2amUb/MR+OYvEn5InF855W0?=
 =?us-ascii?Q?r+MFtoAzUgvvshBgtZ3/fVqDJXzyew7QJC7+kOIm6pV2/e0GpAvCoUsxD9ny?=
 =?us-ascii?Q?r4Ko3Y3sEe/UgXsmfjF9HmUMmoZJxPtbFUG2kusovtCWYE+6U+MWdNEQKoKR?=
 =?us-ascii?Q?0nodopSHhDGAzDBTqIsdza26gbys8nBqCU+y2BPVgC2v0rDEAtAPlvFi/HUl?=
 =?us-ascii?Q?+eHAptOizx0+V43DwOugigCqtrdei96zIwIG2/OlN6ImdHTnxoH6hEFn5ipA?=
 =?us-ascii?Q?ZpsBPm8+qpbTrXmnv2MvAZGektW1tJJg6M5ILgTzXL6wECQ0Om2CCYw/vNcF?=
 =?us-ascii?Q?G7PjkKYRS6s6K6SjcLSrwjy/KbaHWfyEpnEOEaupqu4+7MoKTqj8UWacm1aK?=
 =?us-ascii?Q?HLvt7No4rtn5nZ5Md1y0GeFyLtXNafNDOOz7XVoEFWMzCqU4jNrCbJ2rl17d?=
 =?us-ascii?Q?9eZqzIOIBQbWeDd7i/1x1LWitPhs+7kfTsU7OG19dmkuBWL92Wd90yzGOco5?=
 =?us-ascii?Q?2/gNpf2gce0T84JkUd8VIwnKM/e/Sr4PRk8PMNHM7m4rmMxHwQ5SvTmNlt/L?=
 =?us-ascii?Q?sxFk0Wpo7MA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yB7EjbgHTIQVGnsC7I5L62R3rEGnVsKrqLG/8onjURVbQ1S6MD5gtLHXfnVv?=
 =?us-ascii?Q?QCt5UhgG/RUIlE0CggBrEkZLhx8ccy6FBkHxkJz8baJQaffcVeRYcbK4RaCG?=
 =?us-ascii?Q?9pSxXcysxjoklnkyiO66Jxp7J61pH3anzjDW0sMP2EGUCiSoUx2jD6FWumqF?=
 =?us-ascii?Q?mxe/ueXTqwjR2cYJYFFMWYIo6izIz0guJm9WiY6P2Ne9gjbnGAId30wr8+o3?=
 =?us-ascii?Q?wk2DxnTCcvQzo0hBQLtnByd8GTFYTtXubbPPXlYmmiSYK7ymAfUVqNiEo5vM?=
 =?us-ascii?Q?lGq6Xj/gVtSbKPh/uFXb/uIq8hBN1wsX79WRYj1EveS+UrRgt10zWvHAP8oJ?=
 =?us-ascii?Q?yAX763Ci49JtQNvbCqDaGUaWLoBzKvRyp8KZHBAbAau+EXJeHz+V5r4WyY2K?=
 =?us-ascii?Q?9GiPuDxmkqUMMrOt8N2LywekazbuYv9cvE22/FyqKXL3swS2Hdr3uTKmWFrV?=
 =?us-ascii?Q?3OKqqmNNsj3FKgv61Ldig69ujUXLi88zb5wIqv/ia+fHzmmFGEplbv9pQbkE?=
 =?us-ascii?Q?6ECB2LWCuFencmZj9+0645L02v/E/uES3neqHPmcsh6kihbZka3W/I5WDXTt?=
 =?us-ascii?Q?FdxQBe8uPlbarP3D631Vx+ZmSJ/WkjwCTOVvB6f5ensBdbPqfbbn0fs6+T5R?=
 =?us-ascii?Q?WAiaHD9wKFmv0ZB4xrd6l1Fqa/IYg8sXIPyY/8ePiyXSAxEwFBmO9Pu7aB5Z?=
 =?us-ascii?Q?RHlFTAZajMjmpw+5lUEItM7wbXOjKU+Z70pnC0vjhF3HnwsbolKKrE2ql91H?=
 =?us-ascii?Q?0XTPgzeIr3r40znuNiDvWgO9bAMe8mCRFS8sAmFI9c00uU/UDc8Yg9efuv6R?=
 =?us-ascii?Q?rYrisP5izuX5uNduVt+4K0vIPGAKk5s58/geEmLUjLD8pZSMCgSDfuAInGmu?=
 =?us-ascii?Q?vMp1ur0DG4vB+h6kTW6yrOZ+fVA0wNIrIERRBqKLqVU/XRFGdjvKIbTALWd4?=
 =?us-ascii?Q?PW9b+fZx7xNJfIJZI6yKrYyJoSkzSSSMPmbab/iHtkxtIY6gfUlG37A0Y0dD?=
 =?us-ascii?Q?uPaVZmBVmpt9YLpWQTC7QjnX4ZfxXa9i1cUckG32cn1WzW7lQbpinLdQ0RC2?=
 =?us-ascii?Q?g9k+n7RHfGXQHUAqK092ryhI0OKiNqP2BziRluPeD8Hd2IyOOt1sW6o8voHT?=
 =?us-ascii?Q?gADV+neiSJBZYapfgULYrc3z65r/Ti/ne1BlQJ0pFBOT10yy+PzyPIptGjkg?=
 =?us-ascii?Q?jCcvZHql55xau4NLGZ0Jfc1/rjxoHVVlZx9ZDRZB4lJlTqg+tmuAFD300fnZ?=
 =?us-ascii?Q?mtor1+ZkkznLdWBtv5655nJUysgCkKvN+UD1PSMj1uWk10dnXXRuxeqjBTUZ?=
 =?us-ascii?Q?6mL0e7JurREKdMEsr7QdLHLChM6R/RB6rhCgWllTpd5Tixtu5/sPpXz6Y138?=
 =?us-ascii?Q?AkLp7pfqAVU8l3YiWn6rhyolE/uJYzgPuHEV1eBcz94C6dpnH1HQ9IqsDWbr?=
 =?us-ascii?Q?kHiM+HnDEkiMC1lNepLhq9fnjaMWLT2mJO9A9nLkOokdRLCS7sHSf9w7Hd0x?=
 =?us-ascii?Q?6UQjJRBf/S/JwzKwsb8XQKoW4H+0ePgyXFKw5/UyJBa7ynslRq/p2sffA5qV?=
 =?us-ascii?Q?0rC6I46fkhTxHFNiGvOKENGfQjryutMYGTfxZ4UikDEYtt2n1z8ZvZGON+Tm?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pB4huGggvOkRKul0dIBcJpIa5m3vabd/ElXjjiwv9K4aFzW24SS1JMvAQTqe9C52THny/S9FCpaL+h+a2fKRmkKpMKIHpVMbO6cyQMrEpdjVClpVYSZBbvx+ErpEPINjBjSEd9p/xLXlCwWupb29xBiPus+bWTpo2MaTOZrxh7P9gOTNCCEn6HvuL++dUnYugE1OkncnqtslRrjBzWJD+CyzY3kH8s25roJCrdOEXyq/2dCrll6XH1kvwYfjN/AxoH0AuJWbTSrTnzOnaL8AUBFUxfmTiI8ffIdjrqgXW6IUUYZHEirL8C21v3mxhm8Dk1mOme7vnKWVEpj5qZQKfiQVBUwKVnnNis/tUuwXjJyIkJdkfaL81RA1if1Te7MKsAB8YzIWmi4/4pCuiBUGpHa4QSYk6SIdmY9kIDbtRNtXYStGkU1wbD/2KFIIz9s8Sr/UNDiIMMIVEmgf662qqxV2Ayg7TbfArzzDYfAOR2jnfVr8Ixz0Vd0rd3sbNKuCf10MOFC0CciQwutg02StVt5c2fX5l6BE3arwBw7gWzjf6NK59ShPEkyGeUOvhYmUXl25MY117Gq7eXJ316tuChN5umBddDRHtVriuNrhPFA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693d8eb2-acc5-40c3-0a0f-08dd97acaa82
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 14:43:20.8045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhqV0vlf5dJBRmmsIGxC9o0XCGngJ/KNkMweHHjYaop1a9BLKQJyz9DHcQVTgHle1nydhdYrUHv0+Sg7hkbAGoewVkQtumV1EObHbHfT3rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4757
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505200118
X-Proofpoint-GUID: Get5ILam4i8OA9-37qSRdPOHZONTxq3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExOSBTYWx0ZWRfX9WUIz72D1e8G CIcOSAIKJQgHgTbTNq5zutLLmKhT4Z++LRj61Op2TIm0RoPbZbVBIi4aAuboWlyMLyS0vkcy0lB 8sFJqZKz8FwQeaxuJ2t4B8jR4k+93oFO2vG3eFShEOw8zPK3vfc5FnJtqtBP4NV0mDM5+L+4qdJ
 gtOOUXsPT2ickBLeBp54MYiOoKruUaxeJc41zHtbHxjWCrzmWZlGS3uiOi/cvH+W7cnP/F+3Wlh KLwIcIvabbKXv/dOSXGnnDvS3cU55h/h98tc/RwEl+I//rrKE0TRsCITEHg9i1bmtGza/YlIazC NEBaREmKHjn94yAhX/aaTF0hr8OG7KJQnlrWFxHOwRVXjj5ep08Jsv0a5r4/Vr75yZWFgXuN0M9
 /4gjFzr6av8MLbUZIuM+d4yebWdPZAGlewl3UspwtoqBLnXCx/994oacYxxN3LdDuugbT6bl
X-Authority-Analysis: v=2.4 cv=bo1MBFai c=1 sm=1 tr=0 ts=682c950c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=JAW6VLgA79HtZzqWFwsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Get5ILam4i8OA9-37qSRdPOHZONTxq3R

This commit message is really poor. You're also not mentioning that you're
changing s390 behaviour?

On Mon, May 19, 2025 at 11:29:53PM +0100, Usama Arif wrote:
> This is so that flag setting can be resused later in other functions,

Typo.

> to reduce code duplication (including the s390 exception).
>
> No functional change intended with this patch.

I'm pretty sure somebody reviewed that this should just be merged with whatever
uses this? I'm not sure this is all that valuable as you're not really changing
this structurally very much.

>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>

Yeah I'm not a fan of this patch, it's buggy and really unclear what the
purpose is here.

> ---
>  include/linux/huge_mm.h |  1 +
>  mm/khugepaged.c         | 26 +++++++++++++++++---------
>  2 files changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..23580a43787c 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -431,6 +431,7 @@ change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  			__split_huge_pud(__vma, __pud, __address);	\
>  	}  while (0)
>
> +int hugepage_set_vmflags(unsigned long *vm_flags, int advice);
>  int hugepage_madvise(struct vm_area_struct *vma, unsigned long *vm_flags,
>  		     int advice);
>  int madvise_collapse(struct vm_area_struct *vma,
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index b04b6a770afe..ab3427c87422 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -346,8 +346,7 @@ struct attribute_group khugepaged_attr_group = {
>  };
>  #endif /* CONFIG_SYSFS */
>
> -int hugepage_madvise(struct vm_area_struct *vma,
> -		     unsigned long *vm_flags, int advice)
> +int hugepage_set_vmflags(unsigned long *vm_flags, int advice)


>  {
>  	switch (advice) {
>  	case MADV_HUGEPAGE:
> @@ -358,16 +357,10 @@ int hugepage_madvise(struct vm_area_struct *vma,
>  		 * ignore the madvise to prevent qemu from causing a SIGSEGV.
>  		 */
>  		if (mm_has_pgste(vma->vm_mm))

This is broken, you refer to vma which doesn't exist.

As the kernel bots are telling you...

> -			return 0;
> +			return -EPERM;

Why are you now returning an error?

This seems like a super broken way of making the caller return 0. Just make this
whole thing a bool return if you're going to treat it like a boolean function.

>  #endif
>  		*vm_flags &= ~VM_NOHUGEPAGE;
>  		*vm_flags |= VM_HUGEPAGE;
> -		/*
> -		 * If the vma become good for khugepaged to scan,
> -		 * register it here without waiting a page fault that
> -		 * may not happen any time soon.
> -		 */
> -		khugepaged_enter_vma(vma, *vm_flags);
>  		break;
>  	case MADV_NOHUGEPAGE:
>  		*vm_flags &= ~VM_HUGEPAGE;
> @@ -383,6 +376,21 @@ int hugepage_madvise(struct vm_area_struct *vma,
>  	return 0;
>  }
>
> +int hugepage_madvise(struct vm_area_struct *vma,
> +		     unsigned long *vm_flags, int advice)
> +{
> +	if (advice == MADV_HUGEPAGE && !hugepage_set_vmflags(vm_flags, advice)) {

So now you've completely broken MADV_NOHUGEPAGE haven't you?

> +		/*
> +		 * If the vma become good for khugepaged to scan,
> +		 * register it here without waiting a page fault that
> +		 * may not happen any time soon.
> +		 */
> +		khugepaged_enter_vma(vma, *vm_flags);
> +	}
> +
> +	return 0;
> +}
> +
>  int __init khugepaged_init(void)
>  {
>  	mm_slot_cache = KMEM_CACHE(khugepaged_mm_slot, 0);
> --
> 2.47.1
>

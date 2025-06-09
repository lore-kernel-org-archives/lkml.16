Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79ED19D093
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482001; cv=fail; b=DR8EsRjOCErFZnAEgjnhOLgipcH5TMqNwGPtZEclp87ghhTlK/hNxEIxahczV5VMv2jFI18/1btcgcqJ1+fbyo9+BOeA2fk0zsVjpug/hUJhh8w2jxa816oxFeqz7CU8NpdOzCa8D5MRDw5lWsX6fxZaFQ0qaILN3B9kdN07rzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482001; c=relaxed/simple;
	bh=KCEilSRmLIm/A55Zxp2xj0DOSx7qqtu3OHiMcHzBYcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X0eeF743H4XA1U40uKvU167W9K7pMJYguJCmuMhdtxhKD6MKpgTDaUc3pvvOep8Dn5eFzX8sNMQk2hjs2F5EteQgZHQ2uFE3+AhQX6PLGxcG3+AvTVxPT/2jxoQyVd2NDJIqCemiRXUN0V0MhSfucVhn8UAwPdfAoZwv6nYNQ9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cMLg4Wp+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bE6JHMAg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cMLg4Wp+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bE6JHMAg"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5595DvmC009412;
	Mon, 9 Jun 2025 15:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tKOeNrey6Q2xV8X7ANTtvO4C9shwb8R8Mk4xuMBVz2M=; b=
	cMLg4Wp+bKjUWHZ/jR9fCq0OgTJ9/dDcprnpRVKnAxFEjEWOe5WTar7H6VF+18EX
	ek7XQLc0oGBYoZnR0I+9c8QefUgqxgB8MExNfReDitxKoP7S/zXXHyXflrZkJ+lX
	s4OP3siqDNBlkSwyP9ULSCHVPbmufKgiRoXlofEQvIQMXYUvLQMHg9i0PZThHhTV
	9R7cRJPhQzsVGcJpRBrDYncyqMG1cTUZPqAzsSHOQOW8a+Kglgu1lhpYEGst+KZz
	OX8+JGZ8qY1Nf+sLLMDZrj6YGblgPIe5j8DYGmM4OKB81zg5NM2HJ4JmrVBHfr6T
	xh2wm9CvDh1YdksjpSlR/g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74tcg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 15:13:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559DaNen007387;
	Mon, 9 Jun 2025 15:13:03 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011048.outbound.protection.outlook.com [40.93.199.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7am0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 15:13:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YphX2iY/s7LOWXk4l9WTmp+5oyBTvna9mClA3fDl7hnuRpZBpBgRGXUAN1J8Tb8G4csp9ozHNHv8fE1eOmYU/4NkNXHjNCTG/hyjLILvYAf8ahig9QJDLmbxjpclnXrNzNicbteHx6mqVoxmkK2eJzsqLGJ9hSGbWfJ2p8x2QXkJsz/8iMSYCiuyW0JejftVGXVaBe9kVpnSsFoYRRemRZlZownbHENFOPZSyCDE4JW8s4hcNJUYpQePgcrdhenKhuGgZH7puvnt2QBPcreeXyxYI+DrOK9c+bpUQQZMGovmNnxmdoqgPRCWObHWkOMEDQL2FVy6OGXvKDwAHbN1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKOeNrey6Q2xV8X7ANTtvO4C9shwb8R8Mk4xuMBVz2M=;
 b=SY3PeX5ejqRnQDQSzY9L/bdYqjF2lFGBCfaxon5rZvK1prBjb4zLaFR0bL1titD9ZZFAoTwgU0hdfVaFF7ANzh2SRUCAELH4mVtjrZPk8/wzTiFNnO0jESrCjrbEovRTFDu+NsGepv+wi50pSicP/sr5l5bZFjGLBThDwkmwiZ1i8mBMJe151rFmppc7Jw4x6aItXiCJ7EtSFjetwiThnHSVAlQ70k/IZPdIvNJZQ4HlCHk0eGu8tIK7oV9Xqmeto4vRfSb4VjoGu3qzWYQLfshwcY5xZbXD6VOri70iliOLih9oUE+WCUD2+sxXg4Lh2pVLhI/9p62dNiHkMiwA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKOeNrey6Q2xV8X7ANTtvO4C9shwb8R8Mk4xuMBVz2M=;
 b=bE6JHMAg+H8K0lIsbBG1VEl0c0ZgCF5p78LBwaD1HIziVLuratWOEJEoTBI7q5wmwMsLDalI9dSChEChdANRebJvndoc+9QjuAnAAfPs8pLkq8/+KDMKAj8Q9qE/80bo0heTsFuKo7fY41GLFvVN5WDVBevDgneHdQ7FkBE65IU=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DM3PR10MB7925.namprd10.prod.outlook.com (2603:10b6:0:46::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 15:12:59 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:12:59 +0000
Date: Mon, 9 Jun 2025 16:12:57 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <1f195812-6088-4f20-88f2-d4ab999fae08@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <998a069c-9be5-4a10-888c-ba8269eaa333@lucifer.local>
 <381ca19f-4b62-41b8-9883-f233b50d6521@lucifer.local>
 <43872045-518a-4690-acf2-a0eb4362ca1c@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43872045-518a-4690-acf2-a0eb4362ca1c@linux.alibaba.com>
X-ClientProxiedBy: LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::6) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DM3PR10MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d22585-8d3e-42f3-d2df-08dda7681f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVcwNFpZdDgzRDh4SGZLbzArd1NWWGpMV3pxTlpZaFlsd0w3L0ptT3JuSHhz?=
 =?utf-8?B?eWw4VGp5STZRWkhuUVdGTDh3bGE2WEdpcTBsYVA3aGg4ak9sSVFrQUtpY2Ji?=
 =?utf-8?B?anFjTjlKSzRnRmhwb1ExYWcwejRzcmh6eHM5NUJMQ0J1USs5T0xSTlE3Sk9B?=
 =?utf-8?B?bGlRQlQyOURwdWRZQWJGRUhRZ3ZLN20rbXBlbWRYbHN3ZU9JSnlmbnJHZDVr?=
 =?utf-8?B?cWwzNnJheGVWeXNZcEpLdHd3bGFvRE0rOXVyekFYQm1oM1ZXUm1BOFljR2cy?=
 =?utf-8?B?OXhUQXV6SkNqeTRPVlMwUU5QZU9lWE5ROVExUmxTZi9sYUt6RlRySUcrVWtp?=
 =?utf-8?B?c2MxajJWRUhYeStQMC9CelhFcW1PVWxHWUNiNzV2TnR5dGVMdVBETXh2Z2FR?=
 =?utf-8?B?bDlTV0VramljYWFRUTFjcnZ4M2RLWHpCSnk0d2hGYlhUbzVyc01PNEtFRE05?=
 =?utf-8?B?NExSbEtDYitwOWgzVkFZL3hpK1V3dUQwLzQvQ2NpZlMrV0NBK2xCejV0aXZs?=
 =?utf-8?B?TDNpOTZtSmRsNHhnSFBGVGxveWIwNExnc1pIRlpvbHFleUxwWUZHSUpXblc3?=
 =?utf-8?B?dWVzbzNFeXFsZHVIcFJRWWFvYVp3ZzBwazlPQ040R1NSQ3QvOWdFVm9IY0JH?=
 =?utf-8?B?R2t5UWVOVjZETktQMkhUbFo2YUJtNmdnVTlHQlNvVjFBWFRXVXdVVlJxUnNv?=
 =?utf-8?B?V2xOWVFEcjBPWTYrMXhlVDZYdDlseDBVTGdsMXI1Rld5cEJuUVFHS29XSXhB?=
 =?utf-8?B?eG8yOGxFR3FnU0tUNmlEVm0vcmhtNGswdDZiWXVoRTFYODlITWd4RnNSMDJO?=
 =?utf-8?B?VnJtZmp0TFhHTVo5eHdsK0VQb0w0M3pNZFRuMW1JZ09Yd0JzM2NXU0dQQ05Y?=
 =?utf-8?B?ZG5aTytBQ09aOHNpTU1ISjBGZkp6YjNQbDNmNVlaWEh4ZVJWTWxBcW5ZeTg3?=
 =?utf-8?B?TURGVHFvU2Iyc2RtZ29DVXpFYUk4c1ZyL04zYkFxb3BrTTk3NUtNRjFvRzQy?=
 =?utf-8?B?aEQ2dWZyL2ZKYjluMEJOMDBJOHBXbEp5VHRKZGFTMk1wOE4zM3BveGFiVXIx?=
 =?utf-8?B?Z0I3NTYrSnpVTm1rT3piYlpJWlIrS0haV2pzZXNkeXdma3hlUi8xUTYxd3pN?=
 =?utf-8?B?SXRNM3JJMDZyMC9GSWR4d3B5Q2JnenVYNmRId25DZGloSDIxV2hMWG5MTHFQ?=
 =?utf-8?B?bkMycGxPQUJDOG9FcEZ2TFFpWndXZ3FxTjdqaFlYd3ZjYnJOOGVSMXdkN0Fu?=
 =?utf-8?B?bnJTcm9zbTZtMGRZNERscHk5ZGU4UGs0NFNEMW9QTnRaOWhmcFV0RUx0ZzJL?=
 =?utf-8?B?UXdObzAvN245VEJScG90RE9LUDIyTWxXaEdpSkN4d2w2dFMya3NOQ0d4L3F1?=
 =?utf-8?B?VE1Qa1ZZQzJ6RzZiQSsvVzZwdGNqdGd2Y3NxK1A2RFRhTlRXY0t5YUtTRWlV?=
 =?utf-8?B?Y1g2V1BpeFBwRE03dVhwc3NLU05qbmtNcE90RVZJTjVNS0g0U3UyM1lSUVlS?=
 =?utf-8?B?Zjl0b1ExNHoyWmxJS280akFheDNUTUVyZGhWeXpnMWpjZXZYTE1Ja3pDbFhY?=
 =?utf-8?B?STVNRzY1R2VSbUIwdmhVUjlWZytYYXVpWVdLcDVhcHc0czV1Sm9CczJYOFk5?=
 =?utf-8?B?MDZRaCtDRFpxZFZGaFNIaytUbGQzYkhBeDF0Z0NMYlV6TktCOTdCcWtrVm82?=
 =?utf-8?B?aUFwUkNOMzE0aXVrZTNubFZLQVN3VXB6NEJPeVJqbUo4a3FjaHl3VzNSWmlS?=
 =?utf-8?B?aVJieDVKaEhvUTRmTzM5clJKcEpheENxdkdVajExc0RSUmx3YzgzNkppYWdN?=
 =?utf-8?B?WDYwV0dDTjc0TTVyN0IwTnljSUFMSW9mOE0wamdwZHpmY3dMcVU4QXlic2RE?=
 =?utf-8?B?NDZjR05ob01nWDdkbk1ZWUlXbVVDWU4wOEJaWlEyVHBEZGxJWHFUa2tVTnVE?=
 =?utf-8?Q?GHU/jeb1t6Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE9wTzBaVmJicWd5djZMRWoxaEluYzdwRVR2bFY3UlZFS1UrOTNNQStiYm43?=
 =?utf-8?B?R2N5bWJqZ3ZtcTlkY3BDckluTjB0dDBVRGhDbmVzLzdoUW43Lzl1dE5hYkpT?=
 =?utf-8?B?cUxnOFlCWjJvTUVJaGp2NFIwNVJrcDhsdFJ3Q2RrekRwS2lJVTdYL0RyVHhT?=
 =?utf-8?B?STlZenY4TElrWjF5SS9tKzZEK2dNY0VpQUVxSVUxeUZyWEhkUWxCVVdLOEpI?=
 =?utf-8?B?d01TT2tVdkJjRCthNUJ1ak5VQTRaa0d4SGp6UERvVjhvYlZuaUM2b2xZOFM0?=
 =?utf-8?B?NzJqTjBCdDRMWHBGbER4aFVqb09VM0dTQkM5RHo4azVHcnovSElvYnVwZC9T?=
 =?utf-8?B?VHRGU1VENnRuNnd1S1NvZW8rOGwzM3ptVWJGWjQ5QkdPTlY3REVJclR1UTNj?=
 =?utf-8?B?czRxajNTZURaMnc1Qm4xak44Ky90WVQzc3Q1bzVZWmNONm10Q3NOL2dZdk1F?=
 =?utf-8?B?Z0M4eXhGYWFvOE8wU2ZCRGw2V2VzMk92eHlVVEF6RnFxR1J5Zk9pNHhCVVFG?=
 =?utf-8?B?U2E1ek8reFNTVGl6ZGliTTIrSzZuUHFvZytQcnlEOUJSR2pDd2FocmRMYTd2?=
 =?utf-8?B?bEo0L1NJd2RiTzhEZ0I0amYxUHl4MEYzSkQrL3pDSEp1MDBxdGJTU25rMzlZ?=
 =?utf-8?B?QU93Vktpdmpvd3RuUlN4WUt6VVhtUE1laFQ2TmpQTGN3UjJLR2twSEo1WWF2?=
 =?utf-8?B?dWpMcWRWdjBYMUJRbW5ybWZBTGZyYisxMktSelBqVVBTV2ZZMTZ6T1M3UEt3?=
 =?utf-8?B?djc3TmpPNWVXbHNrckRPYlY4M0NtVWhrbW5HVld6ZmwwMHJSaHRTWE5CZFhr?=
 =?utf-8?B?UmJkcVl2dWpNYTNUQzJ4VHRJNERuTmhjRGIrREtyZENUcG8wdkpOdTB5bjNF?=
 =?utf-8?B?aEtIUk5pNjdJMlVNZTBpcEI4ZGNRYnFuVGxDN1NPK1RjMTRoeXdlR1hzRXdI?=
 =?utf-8?B?eENsNjd6UEoyVzZBVGZnRkVFc2lIeHp1YTRSS0lkYlVtc0d0Y1lmVDh2cFdB?=
 =?utf-8?B?NkJ4L3hZKy9TWVdSQWtVcUJZTUZldVFDTkRDMzlJQ3hFWGdxaS8zSHlPUjJo?=
 =?utf-8?B?aERCS3dKZDZQYVUzbjk5WmdwUzRZbjV6WnZwTi95dGxhNU1EaXc3eGRpSXFj?=
 =?utf-8?B?K1J5aEc0WWVxM0c5VUxyK0ZyamxZVFFacE5vMlNkWjkzc3BuN2dXdmdmeElO?=
 =?utf-8?B?RWx4dG5ETk5CazQzbXFCN3huWGxHVU9udkdodjluVFl1NmRiaDB5dElEZEN1?=
 =?utf-8?B?elMzdW5vaWNQbmhXNFdJaVQzRHgxTTBJTHNaTE1jZVdjUHYrV2JhMnVrUWpo?=
 =?utf-8?B?cUxqbmZydldKd1I5bFhPSFRNb2p3a1M3bUxXb3BRb0dFM21nd1lHNTU3OWZm?=
 =?utf-8?B?UytGWVk2MzNYazhqUlRYZjZMWnNmM3JwcENndFAzOUd1aTc1YWlqcFp4ejR2?=
 =?utf-8?B?bktzeUc2VWh0Si8rWDQrckpFdlNvdFBXRzJiZE5HRDhtb0FaS3lxNkYrM0RN?=
 =?utf-8?B?MVlWTmN4aGRQSHJtNmM0ZHBkNUFtZWRlcGhpQTZwZi9QQThMTVIwYWRmTGxy?=
 =?utf-8?B?d0hraE5rNlpBK1BCbWliYjIyN3p0R3lpYk4xeFBzaXpXeFhIb3BMNTlORm00?=
 =?utf-8?B?aGc5MHlHdjJhcU94MUI4OFluTnRWU2FhcDlDMWsxSkU2a1Q0STN5N0lKWit1?=
 =?utf-8?B?ak1OV3YxL2kweFNvVnNiZ0hoZnVTWlJQMXBCMk9wNFBtUmFGNXhRbFR3SkN5?=
 =?utf-8?B?TW50SVpCMlBNamxSeVVzN3BKWG9CdlA1RjdrVEhSNWpsTnZKL0ozaGIzZGNJ?=
 =?utf-8?B?N1BsTFUrMThhN3FKUFZ6M1Z3OGZnNHdwM0hxNFpkNFE2My8za1JSOTgxbVpM?=
 =?utf-8?B?WlNwTy84MDdseDJxNkNKSVovV2tmUm15QTlyNEZ6VG9aSWhGdWlEZ1luZ2Zm?=
 =?utf-8?B?b2oxRDZWbWw1bVQ1RVo2SUNybUNkR2tBaEFYV0l6RDJnbDMyMXJGaUIwNXRV?=
 =?utf-8?B?TWo4TXEzby9FQkphQ1loVndhYlNsY3MxM0lDMnU5Yi9hcUNqZTl3UnIwbUw3?=
 =?utf-8?B?aCtBQ1kvTkYxK0FDQWhaNWRTbW16Z0x3b3hadm0vNGtXRVJuYnpSMU9QalNQ?=
 =?utf-8?B?Q3pOTjdieldrR1ZhcUptdkZCUWt2SXZFOGh1T0taOXBtRkJoSDBFRGFSdExZ?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cB4e2onq1U6TJRusQ9czI/wnkdMOBrngEQcDBnSuEQTh09C23n4PnDiNnW6VOHw0uXyQd0pzSRnjmncSYxvAe4Zcj7XmXEvJ0wuaXUONKQ1KwC5bfsk9VC1OHAzRlz5NakHlWFHP7qhoPSCWBIKsmPN54RM1RFVCTstROEH4zJKfJeZ06MYFw/UPNJQj7K3XDZ2iRaLuuD/u3WSC4L93ePZsQmNLpXeRZTudXSGhizWCfK0TNgB+tXFUA+pdQwSJxZUvK7VPrxgxPlQGW3ZHIWCVW60doDZBIw1I6m5ytDbheQ3CoHl9LoBnWo3YNb6Fc4kJADPClz4+LLv6URQKAZ+GkPs8XazZ+kMa3BgAQ9trxZUgkpIjeYJ6R4R3ICDb96CwXNsT21LlbM32KZXDl7pBGplPluo8GRos+5TsVx0YoceHkbE33dc4RbETe6HDMUFImfC1fhh0931t5AxWL3KSUKzOmtcjgEDSJavmBpaxrWWkkmVmuuwAwoXqnqbM3asiAgqxMP9OqPnEmxbUN+OeJKucwxp1J7nQkT5JdIqrmVKPrSj43iQ7qmZKh8vK1nL1hd1r1joQwlX4IB/qWCg5NC8Vq28wst64afXqSqc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d22585-8d3e-42f3-d2df-08dda7681f1d
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:12:59.7668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYjb8vkQYbmWHj7adjj6pmaVZco2fej+SLGtVaPRe+i1TmhOB4Osod2W4fwg8xcahILrwg6YWYeD3IdqXKtpK8x40FEMM8mXQnRgZjWw2pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7925
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506090112
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=6846fa00 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=UU_Ni-z2IR0InpsZt5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 40t_aRfivQ3cOlrwCGngJJlENYOHNvUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMiBTYWx0ZWRfXy02Nx0fntaIe q/fP3J1cxQsEUX3MYaNPugPnHah1+yaA+hCbP7UBORtptlT1WsjLIVhD9IQoCdR4RQ6NYTzRrM5 2RjhDSFpz1Y66xEzwakd8DgBgJGOBGDqBMlvrv1PcoNXhDqe4d3UXEZkH9dG5p65/9kY7JX69Oz
 z7Xnd8KsUc9KlGnQTzEu5AixE+14vhevaUp8g8MPiiUzjjqyVaYm2Q6JQhdRCO5GC179n8IrR+9 Rr4Bx1OxpsfsBdD97iUA5Wl+KNNXWpANoC9vEUJnT9XYHTeYmCO7fdJ2iV/CTa6AVJq99hClCu7 ojUF++TnxbjT8BNtKPBnc11O/GVNe8YBBGJrhLSd0z97kPca+RVQF4ZvxGPZhMT/GdT15e7Jzow
 ew7fuQpXA256wGQi3M8sz7jgd2NP+lw6VwL9MPegqBCwZ+LmH9ypfddWK2/vn+G4jqBdC24q
X-Proofpoint-GUID: 40t_aRfivQ3cOlrwCGngJJlENYOHNvUg

On Mon, Jun 09, 2025 at 02:18:07PM +0800, Baolin Wang wrote:
>
>
> On 2025/6/7 20:21, Lorenzo Stoakes wrote:
> > A couple follow up points that occurred to me:
> >
> > On Sat, Jun 07, 2025 at 12:55:19PM +0100, Lorenzo Stoakes wrote:
> > > Not related to your patch at all, but man this whole thing (thp allowed orders)
> > > needs significant improvement, it seems always perversely complicated for a
> > > relatively simple operation.
> > >
> > > Overall I LOVE what you're doing here, but I feel we can clarify things a
> > > little while we're at it to make it clear exactly what we're doing.
> > >
> > > This is a very important change so forgive my fiddling about here but I'm
> > > hoping we can take the opportunity to make things a little simpler!
> > >
> > > On Thu, Jun 05, 2025 at 04:00:58PM +0800, Baolin Wang wrote:
> > > > The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
> > > > means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
> > > > will still attempt to collapse into a Anon THP. This violates the rule we have
> > > > agreed upon: never means never.
> > > >
> > > > Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> > > > in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
> > >
> > > I'm generally not sure it's worth talking only about MADV_COLLAPSE here when
> > > you're changing what THP is permitted across the board, I may have missed some
> > > discussion and forgive me if so, but what is special about MADV_COLLAPSE's use
> > > of thp_vma_allowable_orders() that makes it ignore 'never's moreso than other
> > > users?
> >
> > I'd mention that MADV_COLLAPSE is special because of not specifying
> > TVA_ENFORCE_SYSFS but you are making this change across the board for all
> > callers who do not specify this.
>
> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is
> only one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
> collapse_pte_mapped_thp() function, but I believe this is reasonable from
> the comments:
>
>         /*
>          * If we are here, we've succeeded in replacing all the native pages
>          * in the page cache with a single hugepage. If a mm were to
> fault-in
>          * this memory (mapped by a suitably aligned VMA), we'd get the
> hugepage
>          * and map it by a PMD, regardless of sysfs THP settings. As such,
> let's
>          * analogously elide sysfs THP settings here.
>          */
>         if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
>                 return SCAN_VMA_CHECK;

Thanks for referencing that - it's a nicely worded comment that does explain it
indeed :)

Definitely worth mentioning that in the commit msg I think.

>
> >
> > I'd also CLEARLY mention that you handle David's request re: madvise by
> > restricting yourself to checking only for NEVER and retaining the existing logic
> > of not enforcing sysfs settings when TVA_ENFORCE_SYSFS, which includes not
> > checking the VMA for VM_HUGEPAGE if the madvise mode is enabled.
>
> Sure.

Thanks!

>
> >
> > (i.e. addressing David's request).
> >
> > [snip]
> >
> > > I feel this is compressing a lot of logic in a way that took me several
> > > readings to understand (hey I might not be the smartest cookie in the jar,
> > > but we need to account for all levels of kernel developer ;)
> > >
> > > I feel like we can make things a lot clearer here by separating out with a
> > > helper function (means we can drop some indentation too), and also take
> > > advantage of the fact that, if orders == 0, __thp_vma_allowable_orders()
> > > exits with 0 early so no need for us to do so ourselves:
> > >
> > > /* Strictly mask requested anonymous orders according to sysfs settings. */
> > > static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> > > 		unsigned long tva_flags, unsigned long orders)
> > > {
> > > 	unsigned long always = READ_ONCE(huge_anon_orders_always);
> > > 	unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > > 	unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> > > 	bool inherit_enabled = hugepage_global_enabled();
> > > 	bool has_madvise =  vm_flags & VM_HUGEPAGE;
> > > 	unsigned long mask = always | madvise;
> > >
> > > 	mask = always | madvise;
> > > 	if (inherit_enabled)
> > > 		mask |= inherit;
> > >
> > > 	/* All set to/inherit NEVER - never means never globally, abort. */
> > > 	if (!(mask & orders))
> > > 		return 0;
> > >
> > > 	/* Otherwise, we only enforce sysfs settings if asked. */
> >
> > Perhaps worth adding a comment here noting that, if the user sets a sysfs mode
> > of madvise and if TVA_ENFORCE_SYSFS is not set, we don't bother checking whether
> > the VMA has VM_HUGEPAGE set.
>
> Sure, will do. Thanks for reviewing.

Thanks!

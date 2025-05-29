Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875B1D6DC5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748531652; cv=fail; b=buWE+xGxzMx25vRWcYBon12crG8pmemJI0w8eP7L/6YsDuEg96opnsgGkmZ4NHi7FU5wSlGx1MOJMQOUkXzueBPBORkKFpGq9LuTKMGXuc50XvEeEBwbGNaauY+/ZaeEO+SSvNibt//NYHnGkmUIBQQ1urJewO8WOPPQkV7lH3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748531652; c=relaxed/simple;
	bh=mHHn1D0RcodvBJCkrn0ux2kk8495bDsXDqZAiFpeoKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=izUQ+JgVciiXwwg+nGMchzg35ROokRdHxiDcUzmBVGerCTOR4Tj4H0qQH4dADEwlyiLzIIgQ4p7L6bNGyahLsp0lizZbMjJbFNpjiCQlQJ/b/p3A++lrzmvTrlWUp13CdTWfx/SJ4niuo8wyycYGjl+N19Jw/QfLiWU1Fi9PMgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Amc8CiSO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P63e54MK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Amc8CiSO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P63e54MK"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T7u1Fb019799;
	Thu, 29 May 2025 15:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=otHUPCUPzhIm5chrVahfOWqUkUUdiwFJNel3qA9dvO4=; b=
	Amc8CiSOYordxCC7lSfgf9s3w8t1yIPGy+5bIvhzOcmjx/L5wC+ym/XCDAxYL4CO
	DJ+XfslxNgMv69VHpkG274GB5nMO2AVES+xcNNsRd7OZzWdgEEw1v7gUHMcJYcMF
	pPM1ge9bCMomXaNQth2SZ0O+a4Fh0BJ9s9vet/r8LRuQ+Tojdp+XJVR/hXJlHaQO
	e7RahIJTxSV6+w9s7QPQcs3xAv3MNC/0Pwp4drJkUj8Vfj/R5b5iTGWVj00QhuI+
	/sIyWec/KCcJudVaQDNohLP/CQ759mwP9Y1+ImW88gQPzxNF2yYaoWARvQTDQynt
	hr1Cxeq5pmjOLuMgJRDInQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46wjbcmdw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 May 2025 15:13:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54TEGMDq008200;
	Thu, 29 May 2025 15:13:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jcu096-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 May 2025 15:13:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOJQAg0Ph6I4AaPq5YEI3RVg9eCQNznEdLC5v7oqUlzX+Jw5EMowMjzvix7QpSWrwxGVhbfcvY75AL4p1DHjWnpN6gaBVl9K/CcqU/pQIaxMXfsckVGxVxSL02srRf8LmnoKAWJK0z2hMGEfttj0Nza7NYL1UpvDjLT2DjhA3usyVWSrnuJO0nG9gzTXVAvkDGkbefxFiCZGQb60kcLbMei4/TxM0XPqqaaNvKp/jKWTykhSuwoBDIKMi3AABoT3xtwhlTKFKgquqB9rIxaY14+kqQATMlwvJJ54S76SuqdWrN0gSEnrOPe67D+BE/f3CSC56lMXE5iFYcyeNIxEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otHUPCUPzhIm5chrVahfOWqUkUUdiwFJNel3qA9dvO4=;
 b=XNLYeWekhgpgRZ5mEM6TdO5PoesW6HhhIa1lSbtqKxUsNyuGXlL7a54dVUghboBooBAuztsBwgql5aYB5D8o43G6c7FCsLsIuyBZfS2xYEApmiAhyh8Pk9j1Gdexym8sS+hXDlbPXZb2BS1PI3aa0dNgF/cf8McXK8j2D87w25DyE8+NBiCJAD7Uin5jPPPdCOZj+zd70DHDvgxf3g/1hVkaiNR0BZGE6chySRwn6qC4wXwk+ZyfW8Rsb61Xoi3fYJD+hALpfMHCWc28JBqvSVEqSDBwNBEy8xt8pG9ROq2HV933XsigAqC+5ax216NWaakWDuIPyQINfGJotCRV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otHUPCUPzhIm5chrVahfOWqUkUUdiwFJNel3qA9dvO4=;
 b=P63e54MK8ezdsXCYbQEYBC4s5p+1uBeMPC6UIjd2suSO3AZAG5VbxcDMHqyfnb2a/9gnH/1RevV55Oy9JL1+pVaFTw1P7qAa31BB4uOAdiCtZjD40ZO6JLejtixC4g9sF3kHOtnzVZMz4Bey0wmPFD8BYrJmpD8rpqNP7vYW+04=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB5986.namprd10.prod.outlook.com (2603:10b6:930:2a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Thu, 29 May
 2025 15:12:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Thu, 29 May 2025
 15:12:56 +0000
Date: Thu, 29 May 2025 16:12:54 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: Oleg Nesterov <oleg@redhat.com>, mhiramat@kernel.org, peterz@infradead.org,
        akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <bf392cd6-c240-474e-8c9c-0df223b4c2a8@lucifer.local>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <20250527142314.GA8333@redhat.com>
 <fcb3b061-ca4b-44d7-a9fc-ecd0713c3fda@huaweicloud.com>
 <20250527172018.GF8333@redhat.com>
 <58d522f5-751a-44ff-9581-bc772c8d5c60@huaweicloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58d522f5-751a-44ff-9581-bc772c8d5c60@huaweicloud.com>
X-ClientProxiedBy: LO4P123CA0457.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e58ef8-8712-41ca-1e34-08dd9ec34abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXdrTTNFNHJRbWVtNU1xZm9sKytXUUhhTHZDSmxyK2lwVS8zOVUxVXd2VjUr?=
 =?utf-8?B?VmxhNmloMG4xQUx1U0I2S1lDWXg4TVprd3ludTVneFZKRmV5aUpobDBSOVk5?=
 =?utf-8?B?RkRsOUlDVTlBYU1HU3BEamJHbkxTRFNZaFg5d0FqQmpGOEtVUUduVlQ2blB1?=
 =?utf-8?B?R00yV21abEtiTmdnYWtvajFQK0x4L1h4UVBaVU43cEVQYUxvOFVDbE5JSG01?=
 =?utf-8?B?UER4ZUcwMTJCQmJ3WWZSTGNWSDdWT0JMY0JBd0FkMzg1UURXTVJ1NzNjbXp3?=
 =?utf-8?B?a0Q5Q2ZScFRBbUVLVkw5MWxtajVTS3d1VDFmVkFmSCtUQzhJYmdrSHNsVWV5?=
 =?utf-8?B?dCsxZ3NpaE1ZQm92K09pWWpEOWZpS1R5bE1jZWJoUTY0RkV6R09IUUhFQlI2?=
 =?utf-8?B?Mms4djZWeTh3V0JNdy9IeFF5MitYQ3F3bXRlOFFYL1c0a1AzV2I1c2xUSkMy?=
 =?utf-8?B?TTdtM1lOa3M2TnlEbGJtMU5YTE5ibHR5N0NMSk52dlluS1AvNWdoc0NZZWM2?=
 =?utf-8?B?ZWErWVQ5WFBYL3QzT1Y2L3NrZldxQS9ROFlXbDY3dGV5TGcxeVhDTTNDZyty?=
 =?utf-8?B?VWQzbVRzWndoWkFTRklTK2cxL3l4RGliVFFjdjZyMnZlQlRTRTk0T0tTbzhV?=
 =?utf-8?B?Rnk1cnVLNTk0OWxnOGI2K0tPYXMxclZmc3FOT2xSUjZwY0kwbzB3dVZPN3B3?=
 =?utf-8?B?ZkNFdTVTTFNoaVVGZkFZM3NrYzR0MElrd1cwRkN4MG1FUVN5Nm1iNTE2Wjc3?=
 =?utf-8?B?dmtrMDZmNzMzU1licjlhcHdWdHgvYUlWeUxuNHB5Qm9iWnFsQ0ZRQVNrM0Er?=
 =?utf-8?B?enBhRytvNlVEMWxITTlVdU90ZUVXQks4UkpISWRtT0pydkN2dFNiMzFiYVFH?=
 =?utf-8?B?UHg4bW9HblJKaFZhb2pudFdqelBwdDZ5Z056RzVmTUdhMEJIelZiSkllbTlB?=
 =?utf-8?B?dlAxNDdGaVJ3aGREMHZoVFlSekpLL0czd2RLVzJaTkxmRHRRRTdiTklSSHg0?=
 =?utf-8?B?czRPYVZBZE00cDZjKzBmR28rbmFJL1BHbmNvcjExQVZpaWQvbEhrWkYwbzFk?=
 =?utf-8?B?ZnBBdk0zZlBVenFvb2dkNmZ4clJ0b3Y1VWk2L0VoRXEvVXJNS0wzUDg1d1hT?=
 =?utf-8?B?bE92U2lGOGRwajEzRWFMMHdSQndYRUNKK0tWNStBdXk5SDFDWjJ5V1pkRnZi?=
 =?utf-8?B?NmlFMUppdFRROTVzdHgveVZsbzZEVUpyY0V6elJFaUdyWkNJQXpRYUZuY2s0?=
 =?utf-8?B?bE1xb3hKNHlLaVlQVHl4UXZOb21yRENTdEFUQ1dWOSsxQUVOSy9EZm5ZNzRl?=
 =?utf-8?B?ZHJQdE5RZ3k0ZzNvc3pkc2lEUHdMR2N2MTB4OVFwYWYvUGZ5VW5zbllTb1c5?=
 =?utf-8?B?OGFJSGdiQmp5K0I2UCttcW9SMEhWMUNUSC9TK0lzZFQ4QlNVUTZqMWduMHFl?=
 =?utf-8?B?MmpMOG5sVWtVQ080NjA2N0JiMUVPcW5Nbm42RER5NzhXWU8zZXVjQ2RMbUVr?=
 =?utf-8?B?TTg0MG9FQTJDNWFRT2NsWjVsTUhvREprME5kVDF1Tld2cVh5STFyNndNY2h4?=
 =?utf-8?B?Mkt6TFdMVzVUZVVtM2FMWHN1QWJyRGdyZ3p1ZDJoaS9QY3VnamNWb3BmNVgy?=
 =?utf-8?B?UzBJellnNFd1MEt1ekgrM1hmbnUrUWR1eTNPaXM0Q1dmY2tLbnNpcThLeTlt?=
 =?utf-8?B?SDFXWVFncGdvVlBYalFieWJsMjZBNFgxK3ZNRExnejVmQWY2RlR3bWpvYWkw?=
 =?utf-8?B?TUlEN21qWTNiMFJuMGNRMzRyamdqR3BCdlBlTVgwR0xpRG9welJUUFJzb0NR?=
 =?utf-8?B?dDMwUDlROC9UVU16WXpXTWRHU2d4VFUyamI4dVFwMTJhSXNzTWJhM1dUMFRv?=
 =?utf-8?B?azFLdUduYmtTYjlwTmVYemVLN0svR09RamllakdObHlrcytNWlNnbWNJSng0?=
 =?utf-8?Q?i82UWyxcGSA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm9vUUQvUG9hd1BPVzN5Q015bXZlNU5mNDFzQkRxMHFaOXlqb2Fja1pOUXN5?=
 =?utf-8?B?VHdDYW5EbWFUclRlakVrRVlEa3kySVNUZnFlYkFBK2hkaE5pUTJ1OWlnUFFa?=
 =?utf-8?B?ZXBCOXhlYVJlUUhhRzBsVFJPRTdtWG1UVlZpMjNkTXdlVndHbWduRTFyV2Jv?=
 =?utf-8?B?VWgvdjgzY0x5Wnl3cWlYdTF3U2hIdTNJZ05SbjV5eUhQdEJIeTZBWVB1bkRp?=
 =?utf-8?B?eHZGMEVrT0NnLy9xK050SkhBOFFpWVpnWTdNcTNkS1NveTQ1ckhXR0VTaXVF?=
 =?utf-8?B?VEdGa1lockxxM3h3VURqdGJRTmtFQXVqYUNZUytBUTdTb3QwaUJjSThINmRl?=
 =?utf-8?B?clRXakRyaWliR1VTcGNweGVsM2R3Y29DOHdvQWJ6Sm5PaS9kTXhkOVUycTVS?=
 =?utf-8?B?TDc1a3pMdHJ2RFQ5eThQRlJvck84VDFYait4clE2OTBvbmR6bGRsbnBDNUxn?=
 =?utf-8?B?c0U5b25tMzgzbmFsRTRPWlJ2SFVkdjhMS3dkcEQrSTM4QWYzWDV1NVB4ZkpW?=
 =?utf-8?B?QzNkTGdaSWxvendURTZBeFVESHpXeW9hWWl3alkybm9wTm1seloxbnZnUHR5?=
 =?utf-8?B?Z1lZeTlKampJV2t1eE5IZ3Q4Y25LcllnTmJTcGxjQ2lhZTlqMjlMK1VGeFcr?=
 =?utf-8?B?R015b0J5U241ZTJwYTBTNEZGdFhucFR2bCtyZHRrNUlNTzZIYUlCUVY0WWJP?=
 =?utf-8?B?Mnk0VlcvOEZGemNISTBnSDNlVjlyUGRDYnJjS0lyVkVZaGF6R25KdjFrNy9l?=
 =?utf-8?B?bUc4QldYc2J4N1VKRWc3RzVUV0tuVXc5QndoRlFvSmNKa1BLcElWakp3K0xN?=
 =?utf-8?B?UFB1M3pLZEZiblAxZG5seFE3NXgrR3NGZkQ0NlpEcVAzU1V3dmpEc1crR29Q?=
 =?utf-8?B?cmFEVCt1QkQ0NGZSWnF2dDZwY0E1M0lYMjdJS3VVZmthRWJXZGFqVnl0UGJH?=
 =?utf-8?B?N1ZJSG56bVJhMWNjL1JsWmtPNGZSeDNraUJ2Tnp2WGJxUFZ6T3FXSnVhQi8z?=
 =?utf-8?B?TGlDcFlVc1dGY3FFTWh4L3pObytWVXVPMFpQNy9sV2xwZ09qMkZxcEdodTgx?=
 =?utf-8?B?YURaL29sSEN1ZjBzRGMxKzEwZHlvODI4Ym5COFh2RCttVzZxa3F6VXY0U25K?=
 =?utf-8?B?aDhZTGlNYXFqSHY0TXhORHNpVzhWVTM0OGFvNzZGOTJpZFI1ajJwL0cyell0?=
 =?utf-8?B?dmRCWjhMMHhjamNQUXNFbGQzYyt1Y2JrbGJJOWtYc1ByM2h6Z2gyWU1yUVhp?=
 =?utf-8?B?SXUwQ1lWT2xiZVpvamVROU5UUUJzZ0Y2d0JocC9XbGpNOG9rSUp6a1ExbVJk?=
 =?utf-8?B?SS9iMTd5WW9GWCttZDJQZFJkOXlmOUQ1YU0zMW9vREpDSzJYNlVGWG5xUnBC?=
 =?utf-8?B?U21mNXk1SldTVWdtMnhMUCtldmdseHZXbEdXcG1aQW5vem5VOEpBK0VmUHFU?=
 =?utf-8?B?MUhyOGpxL2FDZ2xCdUxiWk5zT1RUc2g0b3Q1TUVOSUE5djhIUE90Q3paREpv?=
 =?utf-8?B?cnl0SXlVV0Z4bEx1OTRXK25MMy9QZzczUDlqcmJvR0NyaVlDbzF5MTU1M0My?=
 =?utf-8?B?UWpIVGkxdGE1eUlWT3daaDVBRXBPU1lxV2dwZk9iSnR5RVdnSnRCREpOaXBY?=
 =?utf-8?B?b2NzeVBFbnppUjdvTVZKM0d4NTRESlIxSWp0czhXRzF3MWNhaDZQNWpsR1My?=
 =?utf-8?B?S2k4MUwyZUJ4dnR3L1E1cUpybmZCTlR5TURZWUNyekx0YjJFR2FmZ2lpdDky?=
 =?utf-8?B?NzlodzEvTnhFWEUwcGxERnZya2NVREJZT0ozNjU1TkF3ZWVkU2JDcjFTNUdT?=
 =?utf-8?B?cDhHdUxlK29OZjVBRlFhcFF5QzFlTUF5UzJ3RFdMcDN3VUNPbktQUlkydkJ0?=
 =?utf-8?B?dlFlTXdTTGQ0REREaldITlZzSE9ySEdqdzBxcUlGQjZCcTBtRG5jZEtlL3RY?=
 =?utf-8?B?ZC9TUEg1RXp1V3dDN1Y5WUJiR3NiUkF0Q1NrU3BEMEpEOURudlREVGhVaVFu?=
 =?utf-8?B?eHNMay9mOTJ2UE9VZTkrUklIRENIZk15YUpOZjV3Q2UxT0E4U2J1bjZMQ0xs?=
 =?utf-8?B?Z2hvcENsSktuS1ZYWnlBNm42SFNLZWxmV2JySVdRV2pOVUVjeVIxT1JQbU9u?=
 =?utf-8?B?N0VrdmpiZnM5aWZKQWZLRnNINVpqelQyeVFKV1hnVWNreHd5WXpIZkhHMEo2?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cD4+P0jB1EWZ5FHREusyK8byhXJDSqif8s+JNjSUQCOY97udoJC8fLEhLWEQ4WdIvEFXNbIijOjRKoyugv/dYms/eXcqesKVL2xx8UHT66tOmck4sZAmJ1CSwR/yY78kMYh/jW8wG00Rh0BWoQzmL0FBuIz8yyYL2vMCsZOoSiXc1nfB+uy3b9Tc+uwWgu/Wmkbn2a5Aeq19WdQKdVp1nnialQQFR2bb+D3M5XSBrNIwKeuI1sWmmDMEaHyUMSXWzg9WQc/Uuxh2LM/PFlsDrdxwRVRtOJEQQ/3WitfIpTMaoaZeW3fo5Qjvwmf/SOVDvmM3NKHPZ4oD27R9PIbgNZ5QoH33eP7no/XUP5is6j6nlffKMX65ck2layoRlpl8OP32USPQcf4A0INx1Lpg96+fA0Palww7f/j0DjqJbGKgt+ivj98h2eZaZcxNsrz2puCuagth5zEaBcpEEel1mQrhJNt6vuXFO0DqMNiuWVh2A9Xgwc49bJz/V3Ig9zcv13TFcEAGEadxEBpTuD6IXJIa085Uav99oIZtZbreBfdd+xApwmf8LxUqbEIWe+/XVwEPufzQqXKEr5tH8tdogyG+BNoCAKlMgZqOAugg5Nc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e58ef8-8712-41ca-1e34-08dd9ec34abf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 15:12:56.7285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpzQ5E5rReS0JvoA4NlGqI1DV2eRdvY9tPRgLm/r95trj/kSMkDcmAa7T37G8i89VQXOfbpayJd3HfZB3bn8UoSSI4tiXM7PFqd7WLe/c5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_08,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=859
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505290148
X-Proofpoint-GUID: l9ktVV2c5-OGf1LHx5apAJWeFEnUu6z1
X-Proofpoint-ORIG-GUID: l9ktVV2c5-OGf1LHx5apAJWeFEnUu6z1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDE0OCBTYWx0ZWRfX5engqaQqFtZc ofMk38aUuAShcACcIrIk01tEvydHCq/uNE4DQWPyaHwmM8KLUt944a2XS+H56LyWW37zzyG+hym 7dEhzoqKMmzBtrZt+5a9xNeYujWzj4EIZiEDGiBBSM6QqeofsNKWEByuFtct4/oaA+NA7oyWlEk
 HR2bAV04yfw7ICrQ/dOT1rsAzGeytwZ/UL9BAQDE8X8XROnHFp4ZJrpBOApSrpwam0mbqFGI41R tn5pJ/et+eEVwttFCCCyUPUibJbTle+B20vCFZ+4z5kKUb7r8ptThCrbk2GTxAZt0j/n0zzor8Z 6tYyoOZaGzFKnxETDjR2uDxx8W+FsIkn+z8TSB5rCVHNGitct2zqfKCzyqNsad9Ud5t3jdz/DUf
 PZN7BLr1HZLkyZBmO2RGzwfU18wYuEI2SLRwTrg948ILM+jyZoHfmUyzrM9hlsxcjeYA9Dlc
X-Authority-Analysis: v=2.4 cv=c8qrQQ9l c=1 sm=1 tr=0 ts=6838798f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=o-of5dUOdZIspm9Ftt8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On Thu, May 29, 2025 at 11:09:47PM +0800, Pu Lehui wrote:
>
>
> On 2025/5/28 1:20, Oleg Nesterov wrote:
> > Hi Lehui,
> >
> > On 05/28, Pu Lehui wrote:
> > >
> > > On 2025/5/27 22:23, Oleg Nesterov wrote:
> > > > Well, I leave this to you / Lorenzo / David, but...
> > > >
> > > > On 05/27, Pu Lehui wrote:
> > > > >
> > > > > Fixes: 78a320542e6c ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC")
> > > >
> > > > I don't think that commit could cause this problem.
> > >
> > > Hi Oleg,
> > >
> > > Me too! I was test that before and after commit 78a320542e6c, so call it the
> > > `directly related commit`.
> >
> > I feel I am totally confused...
> >
> > but _may be_ you have used the initial reproducer which used PROT_NONE in
> >
> > 	void *addr2 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> >
> > ?
> >
> > If yes. I _think_ we should have the same problem with or without 78a320542e6c,
> > just you need to s/PROT_NONE/PROT_EXEC/.
> >
> > > In fact, I think the issue was introduced in the
> > > original commit 2b1444983508 ("uprobes, mm, x86: Add the ability to install
> > > and remove uprobes breakpoints") # v3.5-rc1.
> >
> > probably yes... Damn I don't know ;)
> >
> > Oleg.
>
> Hi Oleg, Lorenzo,
>
> Upon verification, the issue was first introduced by the commit 2b1444983508
> ("uprobes, mm, x86: Add the ability to install and remove uprobes
> breakpoints"). Uprobe only became available for user use after commit
> f3f096cfedf8 ("tracing: Provide trace events interface for uprobes"), but at
> that time, the issue was obscured by another problem—specifically, the
> always failure of uprobe_mmap processing for the newly allocated new_vma
> during copy_vma. After commit 6dab3cc078e3 ("uprobes: Remove
> copy_vma()->uprobe_mmap()") addressed that, the original issue was exposed.
>
> Therefore, I believe the Fixes tag should best reference commit 2b1444983508
> ("uprobes, mm, x86: Add the ability to install and remove uprobes
> breakpoints").
>

Wow, thanks so much for putting in the legwork to figure that
out. 2012... yikes!

Sorry, that probably was quite painful to bisect to/extract from the
obscuring commit, but useful to have the right fixes commit :>)

Cheers, Lorenzo

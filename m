Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BE61E1A31
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839468; cv=fail; b=VENfoYncJcnI52FqF2hHxETPZ0/c8XgX/VwwzdV/Q0zYJ4HP5bKmXcUrwHhPAQ0Qgnwb3H1cqhu3Ji+umQKp23kIwp9Q1wjWZK/8KSef7qoDmtrNiO2ZYShuegiJ35Q/Ul/OXawMtxkCdGc7by0ra3KrBapt43j/6SV73iVa0+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839468; c=relaxed/simple;
	bh=oQVafFbpBMSPc1w6nimR35JIkDz9Dzc39Q1e6Xnt+jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YMLoGv6g3AysErrQsyC1302AX8gaQezbhFrwWKZ/zPwELQOEqEZBOVBIpXS7GZ2NH3R6nMAMOntM6qOSA36ywjfvCVpnmgzn41mRzokyZNWN590ugVrxCTXmW/qQjwPr3+nwsm+BQOUZMJ68CDOBQ9gUdXrlKe6Ay9knekMTVQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VOkdrqCX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IklicshH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VOkdrqCX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IklicshH"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LD3V2x027985;
	Wed, 21 May 2025 14:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=oQVafFbpBMSPc1w6nimR35JIkDz9Dzc39Q1e6Xnt+jA=; b=
	VOkdrqCXWM88cHtVr2+4WGPWmxCCU9tezXuA/XLJ8l1b4M1GLacW0V5IsTdnSVHV
	SaXfx4jOIBm3qtZjm9172m14r2AckLRmaevnH6txCF7wJgAH7fnRgG4WsOBPaHX2
	ufoOKLAHt3pXAAy7A1zvarYK0iearJFlaXDDcaBUi2+PJN313C5AiXY8iFz5gz5x
	6/dR5cJkqmUxKMTQ/HYInN/CUbw+HeOLyfG9RUG9/UoWhU/AyrC5I98Ozyzk6OCI
	16DViQZWyinqLDbNy3zLI4k9pLnvO63+3eP+UK5wIIO7JNlZC6jMX1BGYqvDDYfM
	IcZppHIY7+4QhqksWahQwA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46sf77gc65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 14:57:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54LEqF7C020217;
	Wed, 21 May 2025 14:57:23 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwetyf9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 14:57:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faAD+KP1nTNh493AYM8uV5dkvW3JQty6dkrziwI43PvYEeCvTMyIXWIDI2qjrT0LDEM2XFuVnzte1NXxIvd2/MweeupLLXgBhj1Sq0ln7PlkiF4xmTvwd9UWz4db1RsCewdiKkdgoHDlr69Q6/5+l4w+NtrOrL1MpXrjqKsyHAe3StS20++GeoVMaRrxkM6FtFV2RST6G4NAbpLLBUXdTm+dQaN2MpgDCWVhdHRIetmuLZfNRAyE3f9/K7CxzEO0qKfQBYAshk/Uoi9RxDNL8jjvdawhk6xdgNNwl+0hrKNaeIppbp4Hb23H6DGm9+AFtlcuuqcSyd6SAwOVIm+o4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQVafFbpBMSPc1w6nimR35JIkDz9Dzc39Q1e6Xnt+jA=;
 b=u5QOPaiEJSuHCBA43sh7iu7iqG5FajJm/UwB/3xTzMXBcd+0rLYJVA7hvzPemUI6+88xUY3IzeRCJ+1AzXFyaPR/CncJtkQUqe2OgwSBis1jxXetejoPhm4VjpGJS8rjdxUQN0egKyLrtBNmIV+X3p9ikCmgzO4CeBqukRBfq02hWYMm28H3c6ZQza+6fym26wgm2m/27tY9uLpsnwKUmKkjc0qae/kIiQqSWtl6UfuSAKrrSeNNay5GbSr44dl4bSOHuCyizK0AT1emhojcdKmlRGU3iXt+JEV1SDInQRybVWkZnfCI/ACyamyGV+j5OvQe3SJeuE2azJTWNEPYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQVafFbpBMSPc1w6nimR35JIkDz9Dzc39Q1e6Xnt+jA=;
 b=IklicshH/Jkzq520P3xzCtzFUUnF1tRFBXNi445U7ZBCr/O+uOk2d14pFXX1V/wfRTeRyqVh5VuaBf2d27oLQcHtetkbgxaQeiuIJdjXv+VqE48uBb8r7GkgArW7ZQlLcN2sfYJkv5g6J3h1Jn0CIxPowkWyydwVShRImRzRGSs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB6213.namprd10.prod.outlook.com (2603:10b6:930:32::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 21 May
 2025 14:57:20 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 14:57:19 +0000
Date: Wed, 21 May 2025 15:57:17 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Message-ID: <e1ff054e-bfaf-48d1-9d6f-46ea73d09ac9@lucifer.local>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
 <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr>
 <20250508123046.GA3706@willie-the-truck>
 <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
 <2ad910f4-6930-4da2-aa2b-f3875f71e001@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ad910f4-6930-4da2-aa2b-f3875f71e001@arm.com>
X-ClientProxiedBy: LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::28) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 44202551-99e8-4c27-b22c-08dd9877c8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFVPUDcwRi9rS0FSRHJmYzRJaXo5SUVZdTNPais0OVV5UVQ5MC9JNDllMVE0?=
 =?utf-8?B?V2tvL2pHRGd5b1lKSEFYZDJDYWk5MVdsaEhib1FEZERNdkR3bEVSSzBLTWtI?=
 =?utf-8?B?a1BUU0NFbnN4UmI0Q1V2VnhqeUJldkE0VGs1Z0RVS0lLS0JmMUZ3b1AzQWFY?=
 =?utf-8?B?VWhJZW5Dc2FSTjZjd3R5d1VyYUExVWE3VVA1TStadzdyd2JkWGFFYlZBRlZj?=
 =?utf-8?B?eU8zNXNWd04yYTZQVGN0NTBTOWFaTkNIL1pMT2pvRUV1SHFueWg4WHQ1OVJZ?=
 =?utf-8?B?dUtPd2hDUDRxUjQ2U3FMWUVNNEJ2MUFQc2ZHY1BGT3Z4aGgwV2J3WnlmYlFN?=
 =?utf-8?B?TFhIcHNleHZSZHkzSmU2aVZDMXNLNEx3Sjd6UUNFczVaRjFQWmpueXpNaFdz?=
 =?utf-8?B?Zk5OS0dHRG5uWmwrLy8zY2hFY2ZZMVV2bWV1bC9lVmpYa2ZXQURIOE5YVjcy?=
 =?utf-8?B?emlsYmdUaUVCR2x4VC9xcWdDQmdpcEE0SkNuWGVzMVVOVnQ5QzhJVkhKN2I4?=
 =?utf-8?B?WWEzODJISkhwWm1lM3ZzMkdHY2NiK2c4aUZWL0g3RzNyUElpQStReDFaYmRs?=
 =?utf-8?B?cmdvM2ZQdFFzOVFGUEpMUk1UNXkwKzFJRlQrS2tsUnliSTBJUVUzaE01ZVFU?=
 =?utf-8?B?azZaaCs5aE9Xa2kwaEVBRE43Wm1JY3ZQaWZnYWdUb3lqY1h1SndJUDNESk4y?=
 =?utf-8?B?VjJpc1kzTmI5SGdQcmZBQ0M1b0tIMDVMQW1BdnEya1Vqa0lONGJta0t0bEtR?=
 =?utf-8?B?T09oNU5ON3Z4dkkwcTFlRHhlNjlxc1JndVpZUkFsbDA5ZXB4SlV5SmlHUmNx?=
 =?utf-8?B?OUZBUFhOK1NtclFreWZBcmRGVDRXTCs0ZFBPbGt3Wi9OUjJ2ZEJoRjBtUGh1?=
 =?utf-8?B?WGVYRElCbDFXNWJSYnlFaGdUZ3ZpRTd3MDZqMWhDOFpRUzVIY0dlYng5aUxL?=
 =?utf-8?B?Q2g0a252M3F2Yk9sbVpWRVQ5VkVqVkJuWkVMc3FDSXo4ZmdnNlFsb1VGRG1p?=
 =?utf-8?B?dExNcUhTekFBd1JUQmZXcCtGb0RFMjEvSFRxRzZoY0hhQWlhOG0ySkJYVS9i?=
 =?utf-8?B?UjBQTmM5UE5DUHViSVB6cXVQSldQMmVDbWFFdkR4UnZLUU5qUVRQdkRLNy9o?=
 =?utf-8?B?RjJoTDJDZkJIM3E0YmtDZnBLMkZHbnVQcTJDc2xKbWt1K3dsTUg1OGhqYVFN?=
 =?utf-8?B?djIxS1NtMzV6dXRnODNBaHJ5aDhQZzBKaS9IQmlsTW5IZWlvYmtWTzhsaXdL?=
 =?utf-8?B?RkxLZWJBdG9XS29jaWdvVmNLekxMTklyOGN4T3F5L2ZrbExxVlRwVmlrYzFa?=
 =?utf-8?B?QWdRYy9jN2VVMWhYbHIxL002RHZHMFNYendBZWJjTDc5d3E2QnBwMFBMRlph?=
 =?utf-8?B?MU9XZHJRQldCVEYzeEtXTXlwbktzSStyRHBnVXR6MEpjUWhSZ1diVkQ5MjVn?=
 =?utf-8?B?UndqMExjYWRRZ3BTd1pIWk1tWTU3T1QzOS9scXoycDBaMm1ZQlNJU3BRV2dx?=
 =?utf-8?B?TjdGU1lKdWJZSVVVekJIMWNFYVN0Tm5TaS84am95WDFrYk50SG9ZWE5ZRUFY?=
 =?utf-8?B?L0EyYUc2ZEhJdmNkS1pVMkxweWI1N0tOZjhWelY0ZnUwdGN0aERDWWJxbVd6?=
 =?utf-8?B?Uk1pSi9uZk1DZWowdXYvRmpTYTJVVWhBSDgwUU9oSTczenZpRE1BN2tNWmwv?=
 =?utf-8?B?cmFvdWhFMUErNVpoOERqKzVXNHpJdkRvelVTK2d5VFl5TVk4VlR6NWpFdVhN?=
 =?utf-8?B?OFNNTWNxNXpmdEZiRzRtaUMrNHJxY1ozamMzNzlWNGdseWJUbmpsR3BRRFJL?=
 =?utf-8?B?em1zd1Z5NW1ROUJXU0UzWmVPSVJJT0RQQkNLZms0Z2NEYmdPSy9scE1GYnJm?=
 =?utf-8?B?RFpmR1BONjcwU0dhYXR0b2NSOWVlTitWTnpPd0dLNFRRSXBzT09BdjN6SlQx?=
 =?utf-8?Q?q8YoNai/miI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlROMm0xRGd1R3B0UmloK0VVcXBEUXAydEEzYjdpVnIrRTMvbXlIRzIrNW15?=
 =?utf-8?B?WkVWOHhJMFROV3FiajlORXd4b1JyeEYzSVM3OXN0VzRhK082N1JrN2ROWUVr?=
 =?utf-8?B?cUwwUmprbXJxUGNBekxQTXJMMTNyMzAzNE1lUG9vWUhxSFduOUlvUUwySnJL?=
 =?utf-8?B?eDJJSGMwWVdvZUtWSG5nZU1SMEFsZ25Qdzc2aHdacVZSUTZCbU9lZ2RlRkgw?=
 =?utf-8?B?V2NZdnIwZkdzL0NUMS9CSHRudi9YMWlaeDhVNWpZNG1zeXF0ZFh4ZjcrRWY1?=
 =?utf-8?B?Q0lIR0tsTkVEQmt3U3Q1VzhZZkthZjhTZCtZR0wvUm9QTkxtenMySVI0a0hP?=
 =?utf-8?B?VzhKVVM4SHl1bHJSSXl2OTlKZTA5Z2I0WEZDK0tjVDdCVFVRQzBTdmRLbHEr?=
 =?utf-8?B?QzFmSGZ3WTRRV0FDR096ZnU3M0U3ZGpsSVFjcldEVUx3VUpNMnNwUk4waW1w?=
 =?utf-8?B?MHB5MjFjQ29JdzlnMGRZeTV2a1VXZjNWbmNkRG5uVVp0M2xkWXA5WWZBZnp2?=
 =?utf-8?B?MWZPUDBSa0pHZFVvU0I1aXFON3VabEJTcG9DTjdvNW0rTGkzeHlZeHV5TC9W?=
 =?utf-8?B?dWlLRDl0R3FhZ3pTcWh5MmVQVGNqWSt1TlNXdCtSU3NQMzJBSWppcVU5NUI4?=
 =?utf-8?B?T3RUd1p4ckhlZHUzOXp3c0RLdjFmdWJ3Wk80ZjdQMk9RT1Y1NHZSTVhDRCsx?=
 =?utf-8?B?Z2Y0UW5lNjFvbWsyNGd6N0NpdFNocU92OWk1ME03R1lmNTFVVC9SK05FZXNk?=
 =?utf-8?B?Vks0c2hIYWNKbXBuYzBjOHl1dTlBOTlxaUtUd1ZXZVRBZDNsTCtkQ2J3MlZY?=
 =?utf-8?B?SkxMY29wL3cxM0FibUwySTJ1WUV3NG05cWtTdjVYWDhwM3dpTExlSytlYkxm?=
 =?utf-8?B?WDVzMmtGdEptSFhxd2NKQkRYaFMreGkvbHNmTU9aVTZUWWxqMnlPMWxKZWVC?=
 =?utf-8?B?NDFBblZLd05iZERsM1AyajlodVpSdk85OVlPUmsvT1lPU3pLVnd5bXlBQUZD?=
 =?utf-8?B?WkVFMExSWnNlWlZxemowVm94blR1dkYzOGdiYlZhT0lPSkRZd21RdlQ4Tzk2?=
 =?utf-8?B?anRYVDF0V09zSFByUFJLcDBWYm1BRVBVMWRUTFBRL3FMWEhOd2lhM3lyeEdI?=
 =?utf-8?B?UkJlaUw1OFIzQlRYMkJGUm1IKytuMWkxSGdzcjBXak1kWWpUeUxvK1hxa2xs?=
 =?utf-8?B?VXVjWXp5KytncG40dmlqR3BwcFQwUnhGd3R6UmJYQ1hVK3hWU0ZYS00yd0NX?=
 =?utf-8?B?dkVtUzRSMC9ycTdvVWdRTUwzS2ZWOCtpTklmT21tUGVXL3QwNU9OdTVPRmVU?=
 =?utf-8?B?b2lvNCs0THA4ZnFrVFBHTndXSTRBR0NkU2tNbWhEQi91RnJiYXordlF0b3FB?=
 =?utf-8?B?a1ZjenhXaHk0UjBFR0lWSXBHbnJyQThpZXhmSkV6VGhzWkxWblhudVNkL0RU?=
 =?utf-8?B?bFcrWVdQclBFVU1JVWpsUndFQWliMmNoNzhzM2lTRElFeGx4SlkwSUd6RWNT?=
 =?utf-8?B?anJ4NWZQdXRnYnNTSk90STBlNEhBdFV1SVRYb013WjY5ZFdpSGpQVjh0aWRX?=
 =?utf-8?B?SXcvMzd6eTE3eU1kYjNuWHhtdHQwbHRPeUtBOHBCN0R1Mm5NRzk1RjEvQ3Zv?=
 =?utf-8?B?c0wxa3BMYjEwaFhvdnZtSGtPMmtkTXJ5QkVXRzc4SVRGNnlyVUtGR3NSdDZ6?=
 =?utf-8?B?ODVwbVBIUnZjRHh2dURXZWNnRXZPTVkzOTRuOTR2enNtWWp6R1JVU2JZSkhN?=
 =?utf-8?B?UnpGeWdacVZualJndU1ZME1lWDNySUVKd29PUkJGeXQ1RE15OWFzNjd4dHI2?=
 =?utf-8?B?TVNJQldBNVdTNWhxdDVRTjJWSlpJS2pkRE85VGczYWxmbGVqa3FPRlVweFYv?=
 =?utf-8?B?T2xta0dwRTFtQ05IWXZBbEw3NmlDU1pjU3RYcTI2QUt2TVNVd3ppbis1a0Np?=
 =?utf-8?B?clNmdVgwSGl6M2JqZnc1ZkNCcXorZ0tHdUdITHFpRVN4dE9WeW9OSkJucUpL?=
 =?utf-8?B?ZUhzVFZybWNSOEV2V25QSTN0cDdNTkdncjBkejVuMHcvYTBYZVZmZDk3TVJO?=
 =?utf-8?B?ZStLdXhJUktwUVhERlY1M3ptT1BOQ2szMysvN3pJd0RBNkIvekl2Tk5KLzhu?=
 =?utf-8?B?SzgwRDE3Q1hqcFRDbERvaUlENWZBRlh0Y0VaMGxLMDdtaDEvaXFSek5haEdC?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YVmQitnDgvRtEr4WuFpm65a1xGdRxoKUWapSkZ16cGSngA51lPEc6oZyb5v+Wz0ErLin1dfP8DlzJaL9IH+Odx4ReOOfd+u8IS4HIMe9oqs/mLHtCW5LDS+Gh0B4F1mmN+pTP6dOeIKmqR5bdjdipPLYZIZxHeZFC3YnwXlkEP/ChSGoF88LY0rXo9iIihgD8ZW2MurkHycX4pHpDYUO+0NGd7twzj8nKaswLyu2Wuln3/2rk6l6MlRcBF87v92a2Xx7ajyXy8Cu9oPpZHNm6UGKRkDZDqycLGqvE/4wBzfV4fkAyNafuDq4Vyr+0av5i1P8UeQijSMGceBEYqMug06u6fuZTpMWWgh/GdnRM31fz3KE9HibIW2Qe6fyc6t1KdCbAzFZrIKi9IsKJkJ7D8ljudH5kRSJsAQkOPHcBOF0GZ3l4rzlkxwO9PiFnPTJ/2jbmDWaFNG5GUJq/u1rgTXoYWURD5f2kt92RwnBcETNH59nspjME8yyj34WU3PHPj6q7pQGNfb7D0bsCYjk1YeDsQ70oYs5wL95NviKjqFdPtqZLM7emrZiX8q0OasCPZwGG4YmcvmhcQ+t+SmbtK+O6k/JBDnYX8mxPzhyxlw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44202551-99e8-4c27-b22c-08dd9877c8ad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:57:19.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jz3H8D2niTWzFBcxoqsbMlc1de/sU2eM8mZsvzzmXUXapGrPwXG33XOMiBJfu4s/jC4+/dymWs/9uLVJUtWDvvuheGInx8TimuxtYpUuilI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6213
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505210145
X-Authority-Analysis: v=2.4 cv=Vb/3PEp9 c=1 sm=1 tr=0 ts=682de9d4 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=h0uksLzaAAAA:8 a=yPCof4ZbAAAA:8 a=CiC325fxN1SmnME7YsgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=MSi_79tMYmZZG2gvAgS0:22
 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: mmbvVNUMCjFqpMoy1MJbD8IR1JjRREXR
X-Proofpoint-GUID: mmbvVNUMCjFqpMoy1MJbD8IR1JjRREXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0NiBTYWx0ZWRfX3NswpcgQI3Wt vQbvPpiD3F5e58ueGiDmkXehrlCWYMiTwrBSUSqI1l0PAnC6LZpHDVG1O7W99H67V4KmM3PODVi iWve0F/lNGzKnpEdNwYBzi47GBoQSgvYKVhnF9EGbU8xoKjo+pBPkDyRZbsyDIT1qCONCv2zyUa
 mBBE3DIc6+mmPCmnYFPXfPEWJiLL1UxJUq/qAeQigb8lNP6VbdI/cAzotY5CQnRCHwF+F03lh3g Rz6FHU/m1c4ukunwunsTJFztYSqW1vg2IJX6HZ+phrWP6VM3OmS4NftbCxKISQX6mLFchfNkDOd cDTAqJ4g7H/US9uezCsM1SeqO8cl4XQdaczvssTnJq/dCtYVwqdkBvOPy2C1HuHPr0+aWU2BDaL
 fgT1Qdb+/ScK5bUDWdQuBrUgqcNGvYEidWdVf+1XQ1JKbLCxz1ugv5jMBUPc6cM0QktMkzCC

-cc my gmail, I no longer check kernel mail here at all, everything is via my
 work mail (lorenzo.stoakes@oracle.com :)

So apologies for missing this.

On Fri, May 09, 2025 at 02:02:03PM +0100, Ryan Roberts wrote:
> On 09/05/2025 12:09, Alexandre Ghiti wrote:
> > Hi Will,
> >
> > On Thu, May 8, 2025 at 2:30 PM Will Deacon <will@kernel.org> wrote:
> >>
> >> Hi folks,
> >>
> >> On Mon, May 05, 2025 at 06:08:50PM +0200, Alexandre Ghiti wrote:
> >>> On 29/04/2025 16:09, Ryan Roberts wrote:
> >>>> On 07/04/2025 13:04, Alexandre Ghiti wrote:
> >>>>> Can someone from arm64 review this? I think it's preferable to share the same
> >>>>> implementation between riscv and arm64.
> >>>> I've been thinking about this for a while and had some conversations internally.
> >>>> This patchset has both pros and cons.
> >>>>
> >>>> In the pros column, it increases code reuse in an area that has had quite of few
> >>>> bugs popping up lately; so this would bring more eyes and hopefully higher
> >>>> quality in the long run.
> >>>>
> >>>> But in the cons column, we have seen HW errata in similar areas in the past and
> >>>> I'm nervous that by hoisting this code to mm, we make it harder to workaround
> >>>> any future errata. Additionally I can imagine that this change could make it
> >>>> harder to support future Arm architecture enhancements.
> >>>>
> >>>> I appreciate the cons are not strong *technical* arguments but nevertheless they
> >>>> are winning out in this case; My opinion is that we should keep the arm64
> >>>> implementations of huge_pte_ (and contpte_ too - I know you have a separate
> >>>> series for this) private to arm64.
> >>>>
> >>>> Sorry about that.
> >>>>
> >>>>> The end goal is the support of mTHP using svnapot on riscv, which we want soon,
> >>>>> so if that patchset does not gain any traction, I'll just copy/paste the arm64
> >>>>> implementation into riscv.
> >>>> This copy/paste approach would be my preference.
> >>>
> >>>
> >>> I have to admit that I disagree with this approach, the riscv and arm64
> >>> implementations are *exactly* the same so it sounds weird to duplicate code,
> >>> the pros you mention outweigh the cons.
> >>>
> >>> Unless I'm missing something about the erratas? To me, that's easily fixed
> >>> by providing arch specific overrides no? Can you describe what sort of
> >>> erratas would not fit then?
>
> One concrete feature is the use of Arm's FEAT_BBM level 2 to avoid having to do
> break-before-make and TLB maintenance when doing a fold or unfold operation.
> There is a series in flight to add this support at [1]. I can see this type of
> approach being extended to the hugetlb helpers in future.
>
> I also have another series in flight at [2] that tidies up the hugetlb
> implementation and does some optimizations. But the optimizations depend on
> arm64-specific TLB maintenance APIs.
>
> [1]
> https://lore.kernel.org/linux-arm-kernel/20250428153514.55772-2-miko.lenczewski@arm.com/
>
> [2]
> https://lore.kernel.org/linux-arm-kernel/20250422081822.1836315-1-ryan.roberts@arm.com/
>
> As for errata, that's obviously much more fuzzy; there have been a bunch
> relating to the MMU in the recent past, and I wouldn't be shocked if more turned up.
>
> For future architecture enchancements, I'm aware of one potential feature being
> discussed for which this change would likely make it harder to implement.
>
> >>
> >> If we start with the common implementation you have here, nothing
> >> prevents us from forking the code in future if the architectures diverge
> >> so I'd be inclined to merge this series and see how we get on.
>
> OK if that's your preference, I'm ok with it. I don't have strong opinion, just
> a sense that we will end up with loads of arch-specific overrides. As you say,
> let's see.
>
> Alexandre, I guess this series is quite old now and will need to incorporate the
> hugtelb fixes I did last cycle? And ideally I'd like [2] to land then for that
> to also be incorporated into your next version. (I'm still hopeful we can get
> [2] into v6.16 and have been waiting patiently for Will to pick it up ;) ).
>
> I guess we can worry about [1] later as that is only affected by your other series.
>
> How does that sound?
>
> >> However,
> >> one thing I *do* think we need to ensure is that the relevant folks from
> >> both arm64 (i.e. Ryan) and riscv (i.e. Alexandre) are cc'd on changes to
> >> the common code. Otherwise, it's going to be a step backwards in terms
> >> of maintainability.
> >>>> Could we add something to MAINTAINERS so that the new file picks you both
> >> up as reviewers?
>
> That's fine with me. Lorenzo added me for some parts of MM this cycle anyway.
>
> Thanks,
> Ryan

Indeed :) happy to have you there Ryan!

>
> >
> > I'm adding Lorenzo as he is cleaning the mm MAINTAINERS entries.
> >
> > @Lorenzo: should we add a new section "CONTPTE" for this? FYI, hugetlb
> > is the first patchset, I have another patchset to merge THP contpte
> > support [1] as well so the "HUGETLB" section does not seem to be a
> > good fit.

Hm, this does seem to be very arm64-specific right?

But having said that, literally can see risc v entries :)

We are in a strange sort of scenario where there's some cross-over here.

I don't strictly object to it though, this stuff is important and we should get
the mm files absolutely under an appropriate MAINTAINER entry.

So right now it seems the files would consist of:

include/linux/hugetlb_contpte.h
mm/hugetlb_contpte.c

Is this correct?

Is this series intended to be taken by Andrew or through an arch tree?

And who would you sensibly propose for M's and R's?

If we are definitely adding things that sit outside hugetlb or anything
arch-specific, and is in fact generic mm code, then yes this should be a
section.

Does contpte stand for 'Contiguous PTE'?

Then entry could perhaps be:

MEMORY MANAGEMENT - CONTPTE (CONTIGUOUS PTE SUPPORT)

I'd say this entry should probably be added as a patch in this series.

If you give me a list of R's and M's and confirm those files I can very quickly
copy/pasta from an existing entry and then you could respin (and cc my work mail
for the series :P) and include that as an additional patch?

Happy to ACK that in that case.


> >
> > [1] https://lore.kernel.org/linux-riscv/20240508191931.46060-1-alexghiti@rivosinc.com/
> >
> > Thanks,
> >
> > Alex
> >
> >>
> >> Will
>

Cheers, Lorenzo

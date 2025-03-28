Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5C1E51E6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743184685; cv=fail; b=KCZKJ61IUVR0Bqq7xWLldkA4r3yBabZAHg8Uj08CmF4uHt7cYM7fVpQpOoLHR1diqMeOtD8HWGbYnOK5Njf9S/5sqT37/zeViGSL+a7vTXcLNz+pnMJ7r53XRVTFg3ng8BmPs3LXlcSV1/4EYd6T085NcV31AVY+2fA9TCPgxJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743184685; c=relaxed/simple;
	bh=E1DD/3YWFkotErNflbL/O8Gb+aPntcB0uHkETKhDl8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EKcOjvLSbJTutO44QOlMhlIkhUkjVF2tcHmqnOLzENrtk8kTqx4ksSxt5qBspT9OwMKLWSY9sLhu+5iYuXOyAbkyEjLBi/K/XRnUtTSicnG0FIKLzeXU7DYVJM1BJiILIyG/0ep2nVC5PFYz+hn8xelkk+WZscTPN9gi4C6xFiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CfWWgHKo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z+VRomCd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CfWWgHKo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z+VRomCd"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SGu427004307;
	Fri, 28 Mar 2025 17:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=E1DD/3YWFkotErNflb
	L/O8Gb+aPntcB0uHkETKhDl8M=; b=CfWWgHKoHAjBZ1D0ynKE4TaWxa8d0nUN9B
	dBE7U+HlD6KNBbz/7inkZBnKIHLGqscavcZ/OWOkpGpjUUPJrmQ1Dt9xNCS3CyLT
	rWb2DqwGiboCKp4OzRsgZagQFEUPnxO6aNE1SJGvwj9OHeGVhRZcD4pqtinivEoH
	7NLMkpP5dG7tiagLEeywoCst+PPNSSYh/beKZ5wz6Rxyk97YVt6xmiqdIr8q33z1
	UJByf/eh/g8yqMRIGDxCFhK4ndpGS4sAywNdhqDEztDgcPAhgi2tAIRsVLqxFcFg
	n6+PomXf9db/lgQFT2j4IhTwaw3HfoYJFL0fY4jvoIlXa84uidUw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hnd6f399-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 17:57:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52SHDiAl029591;
	Fri, 28 Mar 2025 17:57:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45jjc5gdag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 17:57:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLeeUyu0flYaAaji7/CfaFWyMctMHXQtEfa5NQ7NtDVC62UkC0bXwIg0xTnaoRZejaFvWapdfmFnJ6IOzpHi0RDe9S/C6sDIHj2LIYE02Y6ULkLKefBxJ4OZ3fe/KBvfN/O+H0juoSAhoR3JtwAAjElfC3OYMPRWYVORx6Ozk3pxkL5EB+sz7ng9YYPNnDGhbO7bjZPRNxU2ID8rPPYR9gIWhXYbSATf1BCE0EAVOhfeVgGszCGA3aKDV1FELEi7nNeIk7YI0crH3JgxDio94JZpf6R/MYALTf92/e+1OqE29eXS04fSeWE3yATVBGcZrJaNKgbyXLWh3NCv1YojKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1DD/3YWFkotErNflbL/O8Gb+aPntcB0uHkETKhDl8M=;
 b=MjnfZCiXrscZ1Uz8C+vdtrBgDNUWwCHGCtvUXV0dEIt79cREVM5bfUR5tx6MdKcOPXIvofjk7JhKi/VIlZpvjXpdw48wwjE/3PQadFQmPYAFVMpIoHs82MgyxepFQ3lP8p4m1VoiTXa0Q9l+c5E9Q5oXMgpqVKb0GPDKf2i6Bs/KOg4C5z8hrU8zJULYGpa2GmmRSqntWaQMaNRF6iwJm/9WKWLD2TYnmuGu4yVJvufv7zSIChgKHKfP026zeA3CwgTD39IGnxHmnRC0Fd0opBbn2GsrCYKvznwQE/4KCVLcUhYRDXTheXdSy/aXm5N28PInkys/IC8UWKULsW60Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1DD/3YWFkotErNflbL/O8Gb+aPntcB0uHkETKhDl8M=;
 b=z+VRomCd/R0sf9JlMtMBORaD/lz9jlBwyXpso1FNOvWGuI6cqU8un26U0aXUEBr2mlSEz4B0Ky+BxXW2KAOOERGTrJMCAR9iYrgXAHtcVXWZRJfb9NH8HC0T7BZllJwE8rKWXTqL9WGznlD+vRvKdktOmYWiw0OMyLSmAPPeJEA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB7328.namprd10.prod.outlook.com (2603:10b6:208:3dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 17:57:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.027; Fri, 28 Mar 2025
 17:57:42 +0000
Date: Fri, 28 Mar 2025 17:57:39 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Li Zhijian <lizhijian@fujitsu.com>, Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [PATCH v2] intel_th: avoid using deprecated page->mapping, index
 fields
Message-ID: <1f255d31-4c87-4425-bc61-bbfea76c154f@lucifer.local>
References: <20241203080001.12341-1-lorenzo.stoakes@oracle.com>
 <0fcfc239-19c7-404f-bbc5-70a29ccf6ec0@lucifer.local>
 <22d79ad1-0064-42d2-9f69-883ec2872c11@lucifer.local>
 <Z5kNgELpK1-zEXm4@smile.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5kNgELpK1-zEXm4@smile.fi.intel.com>
X-ClientProxiedBy: LO4P123CA0235.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 73278d1f-e89f-4d2a-2d9c-08dd6e22095d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6FGDxcrLbgBk8ABBm/3qxVYRMwgb/SyfKZt2h+MMit3EDx34kf6cnGOU4viY?=
 =?us-ascii?Q?UjFcKjUDSSJWJGpXtCnxpLzihBcgGwF+aFbLqk80ztUKcqXm9emMtWOWNq59?=
 =?us-ascii?Q?cpT2h4cscyfgg/bsj2lfT39tu0X1g7qn+ymsIPrFkFVnQMpiFIGwXAJH0MmI?=
 =?us-ascii?Q?/DCdTWohIgdQz6JGn3U7wWvIkWDwdYqHKu2Q+GJVgQhPAmXZAAs9xs7TtB30?=
 =?us-ascii?Q?6mmE6c2lt8L0k6l5VlBMK3U2ZVO8Hvi/+iXqfVuSbSznAk4tYlkO/s2DH4zL?=
 =?us-ascii?Q?q6T2LDBcTXbk3Q3ZIYVcfKxX3D8qY5JDghtCtgUxJPIneXLFX9ZWrUD0tzwI?=
 =?us-ascii?Q?P7oitQMRfStZfwmEBpThk0LoVIWk+zoGtFrjnHYncL9SRzBT6UujFME6iOzY?=
 =?us-ascii?Q?fuxdYeJ2qSHtGxt9030ubYd+vruFk50gr/dvQKCRjQEDBv9BA10H1esOyTri?=
 =?us-ascii?Q?kAGU8N8a4H2z2iBz7UWa4UGMPqZ1CY/Bh3h16UACi9snRWv7yMZ2yHxPgALQ?=
 =?us-ascii?Q?K6d0bDMopTaSri8k87a52KXEeIdd5u/w/rIYXmT7jeytX09SPpbx8iQjQw+f?=
 =?us-ascii?Q?WmzbMXc8jr3W9230YTKNDrv3xk+StaGGpX/49B70W/ucIpPuzroFhXaI4n6G?=
 =?us-ascii?Q?6DEODiNf7fcyCHXEB7zWN5QLtEUrkATLmm1YO0yloWjkPup3KkUDfBaoFbJT?=
 =?us-ascii?Q?yC02QP0n5WhgsufGndBAeLPnDSUzpQOlb8pp2yT2NfBKuAFmMudAVnX2+4WC?=
 =?us-ascii?Q?jxJEzIFfyl9i/3JO+M8szFC7MOfANuLs8DHSANl0p77SMxaDR/lPfzfvszoA?=
 =?us-ascii?Q?mytltKk/acVaETWrd+Nl2BRkTD8wuiDlffMvvN47wb7pANBIPQBdI/+t4CIb?=
 =?us-ascii?Q?jBKZlqCw08dvnsqHlX6PBTZFnL3eeDOvGARg/vi1zYGdep7ry8TzEjP9Vwpo?=
 =?us-ascii?Q?SVjh1d1coXuu2R9z0PNvAIfZRb5EO0OEOSXLedlJ2/+svWwJsgt6NOyJfyqm?=
 =?us-ascii?Q?vC+ZzwlABM77GQ6hwEvLGsvZ/T0ok3LjlhDrUGfGH0ZD3Lg8Wn3B2AScfVZe?=
 =?us-ascii?Q?+Ehh7gcKz9kaMIYMMrbxfq1yuJA8fA+5iNstp2KmImyivl4JBtgLafbl7tzZ?=
 =?us-ascii?Q?36J6c1QLO2hWA42kHoMinDt+ON3IMf8BNe9T+pxjcAz+o0FYdqxkzh63yIVn?=
 =?us-ascii?Q?tQGcy46ydM0i/6RjYG0cVPJ+Pux6mNWrwMLHXxpwylWEja5UhVqDXK24coPc?=
 =?us-ascii?Q?EisLLv2b9Uq7KMWDw5em8GUzbp5zp9sDQ++lAnfMl9154ZeNJmZ29qWDkFk8?=
 =?us-ascii?Q?QQoV8jlI7rPzTFF92G8Da9chkgcsxCrFlJ6ATN+hcylMZvlKxJLIurjIxFpc?=
 =?us-ascii?Q?qptUkEgIxHJSnqiTdS1fvdaGzHNz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7AEXsE5xBc3kAxEmztCcVta+5dMqZV4NrtfK4XSgL255RflVpDHGceaOKIfr?=
 =?us-ascii?Q?lg9fRO3oIrmBsI4mnITmNdl+6d1bnwYr04Q7nGLovj+oV+DDUhDbsX5i78GT?=
 =?us-ascii?Q?4qVnMkO73A5xIXZgYZt8cS8hdNYUTagfcAsEuDSc1zCUPteqGdR0moM/xdLP?=
 =?us-ascii?Q?JwwOEJep1JbxwxaUx/KSCyFOMxJIlu5bzTFpW9Go5VF1BgDPD0pPS/SKz90b?=
 =?us-ascii?Q?Xmxo5RSRv80jKIsuCa7m88ryQCDVsGkkbVQxv3K6agKBeU9/N8VzDCJIOIKP?=
 =?us-ascii?Q?J8E6FEjIisdsyXfJEcLeIgJw/aNjTvP/b8ka/iXxc578+aBXLC4DPiY6s1Wx?=
 =?us-ascii?Q?u7PagXTHhqxZI9xr/xJkhlm+Z0jxGRdG0krCDUiQ4qUn+wNn6OlU51lMlTKg?=
 =?us-ascii?Q?ew2t20uMcS8pAmZ+qQ5bCtWFB2sQ2CZcmr7qQK/b9qiOfqU8XAvV3Y0EynRq?=
 =?us-ascii?Q?ni1ZMvylHXSui85Yr/c0OknPoqi1jVszpVYrZ+guxIhkecR4dGULHBhSvCZz?=
 =?us-ascii?Q?st7zRFrJIxMABSNUNrB05ldfi9Q2z9T7QAVc52mSjfRejkWN58e9ITnYhM6H?=
 =?us-ascii?Q?dVngbC/K33QqVeo04AezNPT7KDXFoFrqwYhJH8qNavn6Y4METUvs2uK2xed4?=
 =?us-ascii?Q?b67YXNTIwicu/8MgIg1EI5P9YDEG0STNm7/ltCd5oTsK69ynpbMn3Ke6gwFj?=
 =?us-ascii?Q?alr1OAh4AEvPkMwefNmRQlJtRIHI80FQjeQoeA1KCyFmFuVkA+X6j7wcSxwU?=
 =?us-ascii?Q?CjnGoN6bNjQrLHXq2jq5p3voufRGUF+qqXkbhXXMgTPwEMaXlwbdmWCvv+Pc?=
 =?us-ascii?Q?CDuqMDy+39gCuNezxvvILOsPLU+hCDMFevo6carfUDlDGnJEtPh0KTVnEuXV?=
 =?us-ascii?Q?SJ7ZfL289E328XzX6I4Dt5mdypQdlM+ol/GLZP5C4/HfDfIYua9w3zFkBjbh?=
 =?us-ascii?Q?dcWIHbtaPAJSnAbg5SU1iGNrHABN3A7+E7pVIyz6orhBFLZPRfy0CzJjkMzA?=
 =?us-ascii?Q?lVzeeyINY1t+QKWp8cs4w8G3yhHUXmvzePi+SDiioGJDrJwOEPnsoCUX1k9d?=
 =?us-ascii?Q?qutyLUai/sTktZe9y/I6sahMcjFAviVOE367gGNNUX2AreDfF2+uy8V0xmfD?=
 =?us-ascii?Q?/ju48yBfQFgs8cJL6EmiJo+6s4UiugAFMbSITzRkiLF/IIsm1CH5kT+UQmgt?=
 =?us-ascii?Q?wWhpjfy3FL2Sl7DtbEBUcf2W6C3Gxv20WSGRyB20p81oFX8zT93UJYwBDqab?=
 =?us-ascii?Q?FLb56RebVf0WF3uuHcCAfIrnrMd+InNEttvqF7q+yceG8rHQWcGS0ykn9NeG?=
 =?us-ascii?Q?H2Y4SLVA2GQ6bk+L+Nz9SW68fohXLSb+lh/PzaeRgNoeaYk0FpDdmcQqQeQg?=
 =?us-ascii?Q?Q/blSoww1HEnoNrbkltkLN0bulJtToyxJTHUFp1LAXoT5kWQnrid7xUQofBn?=
 =?us-ascii?Q?9wXV6xVThu6Hr24sgeR7FxSl386rP1BLxgit0DjxxF67HqrO7kRrai/oPpCN?=
 =?us-ascii?Q?KGAun+EZqtPoQv0QsM1FsslFpD3KWdAnmo3SJbxsa8OnJbpC9n8GgKjkAyAa?=
 =?us-ascii?Q?pptHww8u0ZwiCmo9puJ+lPZpSgBIPg3qhVdGuQX603K/stsZjTa+vqqTHzI/?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5J/jR3lTlQqrAsoE64NqPOUGEV9BrtabIR6vRAuwnVJvO93DM3TO7CKBQj8kXrYsZZe05dBTpFBUDpjCnoQdG4YVq1g4dhi64tNvEYHltA+zUyjYiYCJZkA54JEOZRk5hCshlMGLizn+ic+57FPap+LQHC5Mi1eUoiH0Izz1hPkXxWm0StlRpVQOWPXNxsoRPMl5fA2QXRgPZqugeyESLtv2DznDbESyVHWkd8d4V4xIeYnDrQQonEiGoLTwcWBA4SGVhGJvtyNMAyOGoGsfhrxYzxK50Lgolo6PiOWactn1joUjmz5cwd5WwWKOhOoM3kfkaRsRvVXnnYVTW3lrzjoKzvcfxs1oKinari1i2mGOqP+XGs3ouxUSgE7nSLtVToY3uNdK73vWSUtiej3Qf7gobbO1lnTPBQTMbe/oUH14QtyBsT+opg1fsvLqd4id5lr9g97rpcHdLh86d2c8USq7eR52m+gdvyiz0EPK3CKGv3T3GCvj7XnCeSDQnkgBKW6A7m5MT2DU8xb0YQVHb0RxZgF53YcVFT318WegEDucdueMLhlKQo/BYMPyKtweyGBG9iolR+mKfCtHCl9cslcNMbZ2P0zvOD5xOychUmo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73278d1f-e89f-4d2a-2d9c-08dd6e22095d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:57:42.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Cve0vDChi9avRNpYtHt4Ao5hvrilgeW8j2A5Nln3yfdAeDPK5vvGYBFxOvwxwDV2scEcUsQiSytv5UH0IGEq0PnkLiP3UrNNiTrMmpVf7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7328
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503280123
X-Proofpoint-ORIG-GUID: 29UQOYgywRFsPPr3ymzEO61YKwcHvNK0
X-Proofpoint-GUID: 29UQOYgywRFsPPr3ymzEO61YKwcHvNK0

Hi Alexander,

I pinged earlier as this wasn't in -next, but got no response again, and
not seeing it in Linus's tree yet, can you please confirm that this change
is going to land in 6.15 given we have a week of merge window left?

We are going to remove these struct page fields so this is an urgent change
that needs to go in.

Andy - could you ping Alexander internally again, as that seemed to help
last time?

Thanks, Lorenzo

On Tue, Jan 28, 2025 at 07:01:52PM +0200, Andy Shevchenko wrote:
> I pinged Alexander, but It will mostly have the same effect as your email.
> So, no guarantees from me (it is not my area in the kernel, I can't help
> more).
>
> On Mon, Jan 27, 2025 at 06:53:23PM +0000, Lorenzo Stoakes wrote:
> > +cc some commit signers due to total lack of response here.
> >
> > Hi Alexander/anybody at intel/elsewhere who can look at this.
> >
> > These fields are deprecated and will soon be non-optionally removed, it
> > would be good to confirm this works on actual hardware before this change
> > goes in.
> >
> > So this patch is probably more urgent than you think.
> >
> > If there is a problem with maintainership in this area, MAINTAINERS should
> > be updated accordingly so I know who to contact.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

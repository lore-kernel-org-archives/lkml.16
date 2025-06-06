Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DE7286D64;
	Fri,  6 Jun 2025 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749204081; cv=fail; b=VChyuqPSHyX6tBUmLIBzqRsMV5wzxLpHYbcVUnhRi7OPk04npD7KGShoOmQLXgJnB4wNgJG2inYRY5DU7jVjms65JtH1g7ZGiCxjcb3v4zk+TlvRceLLQXRZSGRxktdxDa2nrjeDwqzlu7Sql19SHUJaRHOK821+W0KC4By+qY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749204081; c=relaxed/simple;
	bh=1NteGSJQitgqB4djOlXTyPdbDLbjOVA9Xz8s4LegtMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euzyT7aLUZJLnpmZElAY0CXFqm3G0y8nTiBUT0cIY783ehpb0rKRaigPmQRqJGFXxShgScG6Nwx1+FCc74/KFwbGeCS/M7nsFOeO7T78uSWcLwzkcXPqZ2J3jcu8MlDhcT9EiC+vQeTyjCeUqq6eYsH7hzWv3FPMsPkd5f1Kvwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DFdebgTd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=StBhc21b; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DFdebgTd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="StBhc21b"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5569wnvB002510;
	Fri, 6 Jun 2025 05:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rRMH/XdjagKhLnUSqHrK6gYeBYvIQlDISAEzHH0CbTU=; b=
	DFdebgTdojgg9+Fc7cYaqACWtuMXNpaahPqMGOZE/XSHCerogqaHNEVlS5fv0qcy
	Lz2YMgrEe6oMu5s1CkjbijC+IYiYl2rKfEsRTyILzM5C8h+vBbrrgBdx1veYuBUU
	k9GxkMDvCm2YuVfyFNB37Rad7DZ3f2AmCORlgzvKvMlzslMuSMQMy7Thdrr4bTGB
	ZZHp1zb0pSCRvk4XZEQREdJTMkJgLtuMV1T0Ndwn/W4+rtCnqarKJh2XcwO+Xt89
	C8TNS0Pka750EndbkglSO7qWKJAMt/Sh/CuVPGeERe0OARzZIXWczTmlGx+YAY3t
	uQxYcNewFeYu3vKgfL1n4w==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02hn2207.outbound.protection.outlook.com [52.100.158.207])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 471g8yyjvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 05:00:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYFVIp+xMn2bs5vyNzbdA6kml+xkqETt2g2IaqDi3HmWBXW+kTMl+I/m8mZ6yChffF6wT1aIuE/KlHb49rXhyIPCTGUX3xYUVVk9V6adt8vToX9Iv0ND2dngmmUk57aCkmu7tlzuaHbI9Pj6XCzQo8XXq8kSgdoUnZuCeEwFfm7fH+dYnSU4CsWvUnNuBT50W9zjJVWlkD61BsN5xU5hHS0n8VLJAuGFH4+KBlPGeTRBzXUWlMR7wkivdO1jYxxOYXcln77PaWfM7eJei7SCwOT1xeW2mhgHovx/3jx72t21osotBSBlLAGw2NNi1QYuf0U4yHJlG30Jk2ynUw17PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRMH/XdjagKhLnUSqHrK6gYeBYvIQlDISAEzHH0CbTU=;
 b=gR/ruFaziz7yj1qgAvP7C/IQ7KS1ndrividR2Fg3mDSox8Ols9+dSIEmrmjhMKY4ni6l2aiKaaYug7jViFcs4A2/8t2QHVMjKJTV9QTpx/oK3h0EqjgLHSW5JAv9sOoUvLkzja/Dpnk8ciANoYpKSfrSx1vmVeM0Zc37uaxQhRN9JyE1M3S5R9ElMLHUrGhntAPqzyi4l15YUWD/Q8IxknW8W+leeZT5B4rpyVEeAjHgRK9vi1XK3igI5RjwyoXIlr9Dm6zVvdKOJ5pZ2FkeCpf6jo1ZLCNr50adnSqROiXBZ8VaRwo8yrWVnqlc9VqwBh0PLW2u3Xgsv/RJWcE+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRMH/XdjagKhLnUSqHrK6gYeBYvIQlDISAEzHH0CbTU=;
 b=StBhc21bPYCYIf6fnvdzSPU5gkUkJI2saO/2XCN/sq4a538oLM/Tvc57tFqkqfnmEc9VwtVKv04o47krH8UY+4mRG8JTwmlQMvCHQb5mSmeEUZU+8lJZbHCeeCSQ672CDu+kER99zEUQMWV403YccW3qjW4gKq8mRppuwsmF8kk=
Received: from SJ0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:33b::21)
 by SA6PR19MB8674.namprd19.prod.outlook.com (2603:10b6:806:41a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.39; Fri, 6 Jun
 2025 10:00:44 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::a0) by SJ0PR05CA0016.outlook.office365.com
 (2603:10b6:a03:33b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.9 via Frontend Transport; Fri, 6
 Jun 2025 10:00:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Fri, 6 Jun 2025 10:00:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 088EC406541;
	Fri,  6 Jun 2025 10:00:42 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D869082024A;
	Fri,  6 Jun 2025 10:00:41 +0000 (UTC)
Message-ID: <f18e207f-94fb-4197-a96a-45231129956c@opensource.cirrus.com>
Date: Fri, 6 Jun 2025 11:00:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs48l32: Fix a signedness bug in
 cs48l32_hw_params()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Stuart Henderson <stuarth@opensource.cirrus.com>,
        Piotr Stankiewicz <piotrs@opensource.cirrus.com>,
        Qi Zhou <qi.zhou@cirrus.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com
References: <20250603214813.197346-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250603214813.197346-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|SA6PR19MB8674:EE_
X-MS-Office365-Filtering-Correlation-Id: dc45a475-45f2-4013-5a5f-08dda4e1006a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|34020700016|36860700013|376014|7416014|921020|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTRidzFUOXRFZlYxNEJWODYrRndsY1NwTnc4NDJBbmx3S25vb1pYNHRma29I?=
 =?utf-8?B?bjdrMncvSE5YRmMraE5rZlhaYXNCSzJPbzZZWWN1MlE4VForZitBRUpqOWc1?=
 =?utf-8?B?SDJWQjVNd05aWEdRR0hLYndsMWJtaXF1RG5leVFzSXNpa2VrVVMzWFFjUjNa?=
 =?utf-8?B?STJlZjZNalJQc0prR3dXeFlyZ3RYVEc4UVF0K3JPa1E4dnoyc3dMYThzYjUr?=
 =?utf-8?B?SlN2V09ScVRjM1YxQWlpL2JTcTBOZ0UzbWR0ZncxWHAzUGxGaVdOZUE1SlRU?=
 =?utf-8?B?QktOQjZ5Vmw5d2dHcTMrUEFvMU9qRzgvazl4SHZuWStrY25wOWIwVUtUNmpD?=
 =?utf-8?B?ZzZNbG82ZmpTV0lFMGsrY1gxbU9XaUh5Z2tEL0VHblgweE53ckpvWjlPZDUy?=
 =?utf-8?B?YXlqTm0xcHYyRUtFU0d6NW1ya3NRcUQ0QnVqSmdrYmJkU1hibndXY1N1anpX?=
 =?utf-8?B?QjVmSmtZaStOek9YWDg3R0tJUzBXVU15NTdwbU92U0hsZmVDUzZpcFY1WFpQ?=
 =?utf-8?B?M0VjMWdkcStsS0lncWt6SXV6Vmg1aW5pZFVBV3BJMUFjZWRIMS9XbmFVNmFP?=
 =?utf-8?B?UWNtdjBUc3NxVXd0S3ZLelkzTjV2VTVUUk9DQzZHZVlsZVBsaUtabmoxL0NF?=
 =?utf-8?B?ak1PQ0tjWnROTGpzNGxrWExlbksyRndZSkMvR0lVS3Vpc1RhM3hpYTdRdmZu?=
 =?utf-8?B?TDN1OUVBRytLbFJBWHFINU1qbXhBRFFFN2N4eU5OSkxzWU9OMjRlK295U0Z5?=
 =?utf-8?B?djFmbmtPWUU1OXNkdHYyWDduaWoyMnZuaDgwb0hyb2Qvc0Y1ZUxRQUV0eGJ1?=
 =?utf-8?B?eDNIc1pyUzFDRnl5UnV3aVBuM2FqMDZnU2hIbU9GQXNGMlRrRTZ3d2VjZDZ5?=
 =?utf-8?B?RjBvU1NkOStjYmV6OXJVSEtWRVdQdktUeHl3aXRrT2F5aTA1RXQ2bWVJK2VB?=
 =?utf-8?B?UDNWODR1RTZGREh4Y1NlYU9rQnU1aU51TjQxbEZqUGVBZnlrQnVtd0IyTVVo?=
 =?utf-8?B?NTZUZnB1eTlISis0c0RSQ2F2czRLZ1RJanJFMU45L1VmbERpVTdycU5rTmtu?=
 =?utf-8?B?VDFKNFF5c2hEU2ZLUm5WNDNjYTRoNm9UR21zNkxZKzIvdm1yd3pCYStzZVA5?=
 =?utf-8?B?MGs4eFZNajdyYjhnYVBUdWZpSmNVMmEzejgxTE1NQkVsWHZMYjVPVksyY05V?=
 =?utf-8?B?TmZVcFliMCtXdEpKc1R4TlJhc2tjVU9OSDR3V0F3b1UrSVd2bnRhNnREY3Yx?=
 =?utf-8?B?a2xkWDByQlZJWHhNbG9UMkg5Y1NYYlkrQ0ZlNVV3THp5VEQwdDBVeTkydVgy?=
 =?utf-8?B?Z3JFbEgrZDFYdEVoNGZQVEM3bUN4UHc0NEIvSEcyQ0dWSG1rdXVaRFpVMlBp?=
 =?utf-8?B?UVdhaDBkZ0VvYnFYSWVtRXRtODJ1eGdYYjBKRXIxRlhSc1BGZGVFZy9KM2V3?=
 =?utf-8?B?K0RjdFMvbzF2OXIvQm02VnUyNjdxZFJnNzJQZk1QWFhycC9qcEJaWkUxMzY5?=
 =?utf-8?B?dng3UTFadng5WlZyZGo3YXFlc21pU2JBcC9UaGVNQkxrRzY1NEVVN3FENUUw?=
 =?utf-8?B?cmdKQklHZDhuamVwTkVlM1VXZCtLTnc4SE9CcEVCK2QzaTMwYU1kbjNsN3Nx?=
 =?utf-8?B?WFpGQ1ZQb1g3OTZYV281YWVKVDhPSGllMjdPR0NoOUxxUkNaQWVIVlAreC9Q?=
 =?utf-8?B?SG5xZFBiOVlkeGVDRkdJeUc1M3prdzhRSVM5WWNjZWk3WlJ2T29yZDFEZG5j?=
 =?utf-8?B?cDZRTEVVWndNb2hLRmVDY1dsNDN1bUFvTUdFbHpvb1M0eWQyaXBHYWY2VDN3?=
 =?utf-8?B?OU16eGRpcExMcFovdzk2ajlLRW96VjhFdzduc1Jhakx3Mmp0MFE4N0tGQ0ZO?=
 =?utf-8?B?WDhrNE9QU241L21teklLRnI4YzFPYTM2MGJHQkNicGlHc25lNldIOTdoeFM2?=
 =?utf-8?B?aXlEeXFVUUZvZS8yZ1F0ZXpucFFLUkxmZUt4SWJxdzAyVWVQcXdzVjQ5NlVL?=
 =?utf-8?B?NUhBSzQyOFVzNkVZVWQrTnpPM1lMTTVyVjRMS3JYWCtzL21oc2t1THo0OW9w?=
 =?utf-8?B?Z1VwMXVOa1I3MUltSG1QOEpZU2VxeUdERXF4QT09?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(34020700016)(36860700013)(376014)(7416014)(921020)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:00:43.4699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc45a475-45f2-4013-5a5f-08dda4e1006a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8674
X-Proofpoint-ORIG-GUID: 8gYycyuYXyRXphmcCzAEbjPlQveh8at2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5MSBTYWx0ZWRfX5EeuG3Nndu46 3MslTpEKEcwyNi2ljZXOliCY/kZcn2Q/0tqoN6z6/zkb2KKolJ6ctr5P+3nbjV5oQZMoIu6a//A scpE/+khFH+62hQvBT3Y7PN9BhhJVX/2H+FJVSGwSPhCSNDiv1gh5M8qirxf1OM9oOewO9mhjdF
 oq4OX8LgXeFcqq6muYP6VeUcLyJKOD0Lcz6gq136iGrTk1iEviTscs7zP6X64tm7xHPyvKrLbv8 Nf+Fq3Bunv3gWes1MeMKEzwW+opT0QukOsEsJ6hAO3eHsWQLiHyljc5aSfLQUphcuMHdUm0Sa7q cKUk44+DbhLgEaqUw1bU9NVbJgzSrYkHa+eHm8m+MSoRfj6nXNZChN6s3ezCbWBj5iDn43KDlEP
 yb791c22JNLpHQYDTnrh0H6NzbMr1qmc8sFXEH0iIKLAeYpzkGnScAwXcxhxH7+4bmfYjqhv
X-Proofpoint-GUID: 8gYycyuYXyRXphmcCzAEbjPlQveh8at2
X-Authority-Analysis: v=2.4 cv=Pb7/hjhd c=1 sm=1 tr=0 ts=6842bc4f cx=c_pps a=GN986tOdW9pC5+Of7Oaumw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=yPCof4ZbAAAA:8 a=w1d2syhTAAAA:8 a=_DwRC79A61G041Pbyk8A:9 a=QEXdDO2ut3YA:10 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Reason: safe

On 03/06/2025 10:48 pm, Harshit Mogalapalli wrote:
> There is a type promotion that can happen when freq(u32) variable is
> comapared with sclk_target(integer), when sclk_target is a negative
> value it promotes to a large postive integer which might not be a
> problem in this particular case as the condition evaluates to false
> when that happens, but bail out early when sclk_target has negative
> error codes.
> 
> 	cs48l32_sclk_rates[i].freq >= sclk_target
> 
> Fix this by adding a negative error check when
> snd_soc_tdm_params_to_bclk() fails
> 
> Fixes: e2bcbf99d045 ("ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

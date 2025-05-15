Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73017260C;
	Thu, 15 May 2025 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320067; cv=fail; b=c+I3/jWE6H2ttqFCn3G1oftnQnQSkv4iUjrMuLqsWYVthk8/RgtNoPDYFfSMbtoFmF6Q5EG6Zbd+mrtaBHbMidLh7DWGYgNVPWTa/XMB9JSQD38l8RkBwPrmmp3Os0OTAl6RXMUu6UeyOtXOxhU5C4BJv8NS129bIHZhDx9isys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320067; c=relaxed/simple;
	bh=GjJuOGoap4Qzn0jAT4G3xxOhfUxQAyn4ni2U3l6IEZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Oad+Kee11g3/pMeOga/pltQOsoPsszCPzA2qO92wbf4P1dF653xYxhKHu5fGYCQxGpLyk/Zd9ghnBuUkW7WkDc0CC4DavGjfiiixHkRgBHb7Srj0m79ZGGHay30J/CB4UOLKAZ7oPtvasWebXGCS9e3S+CeRWbFfnMVSZYXJnaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XJ/QDIja; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JhdPOvop; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XJ/QDIja";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JhdPOvop"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F7Blqh015545;
	Thu, 15 May 2025 14:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/EsgMcSk87tvNC87uJopCuQSJGIT+3nCJkppmf1MAGc=; b=
	XJ/QDIjaUajF8BYkznrKQPfQoK31lRWoOilfJ3B0NhwbC1ubVr3fc8VsZdcs8PhN
	H+wB9XhIJyhlJxR+6EyaMf8BI2WaJsKCG0niqe32ROZLw2i9g1VvE+6L8PrcmX8/
	Nlr1zRgbLv0/gCy1J53EHbnazLv9CN1N+H/smmRS8zIuaQ2nYBlQ5Spe9Wb1X8F7
	UNuFyryHkkW/i2s30LglKB4U1aX4xOS/pytG6Lm2/qX3gylH6S37NT/Y/99Gxqp5
	Q89V2I6yfccgxAcdz2to1b8AnP46PU2K9hf/JNA+u4em7McCk9vqu/bnf4Oq2ITT
	KUbIcAjd05YguzIKk+5v8g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ms7bu24y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 14:40:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FDlPi4026678;
	Thu, 15 May 2025 14:40:24 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011028.outbound.protection.outlook.com [40.93.6.28])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbt9dwqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 14:40:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITCl8s8cGWmW3BX9Oaw2RC5P3ieWJrNUB7+uIwaLuJEAV7LNYAsIqOCVxMSFUxjtnLbwAHcjYChJHasxOu3dMt21ikFl8iJWiRGbIZ/UuNbxfAQg9gkGsF9lkE938g/SjxND8GO2uwSaJdYFNx4bAsILbE/ezffGk37UxPg0hMKYbbsZtszqWV9Bi1v33fVvkpY+0lEXe4hJEkxVEewtlTpiZzobf9Pik2E+ZUNF2AcS6Q8lNOCvs5wy4xF9p0YKsj5qEeOouR5lKD7npqkAZXCpqrqvVqLo0N9tPnBGC9FxPWMoFEeKA4KT1L5YbdwOLm1fun5g3vtKghOA5MFXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EsgMcSk87tvNC87uJopCuQSJGIT+3nCJkppmf1MAGc=;
 b=lV1DH8zAT0JjXU4cs6o1wop8weUQqOeag8EukmxpPYYlrW23aw7Lq7MhIW3ttfGvcB/gR3WnEyKstLQL3cZVXVvFomCKRJOnu0/ejXRFEprWXSlE0sVKlRRe9UX15DcAnNT/f6GPkNEpJdzlH9sOgpS8NPYP2gpKjGhq7kOD+OxG1NQbrBaUMa2b0NlloNqSzOxWow/rKxvbzw4K2ONMd4vH0AZxtSB17EjBIeFU+wE4+d5UJUQrQlTgAquRKcRyZYXj+g4stZ1DTLrFEiNLc94/DxUvYTTiw8vEKy3hhEZI22/IU6draB8rB904L49NgGfxz0PWAqAzwlKI+AGt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EsgMcSk87tvNC87uJopCuQSJGIT+3nCJkppmf1MAGc=;
 b=JhdPOvopORVDwV0kT0M6chMDs5pLShfQp+xDDysY1Xv9dZDE6/V0VoWOjk5nKTfh9hM0D+KtKuD1+IRgJbg8Fsl9S6g4fv+PPjSoEMU4DANRRERBtGV7WPmt4S6b+F5r6jsonuXXa2ONxDCl7sDsz/kMsB5bvD4LqJ50VzeoiKI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4431.namprd10.prod.outlook.com (2603:10b6:a03:2dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 14:40:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 14:40:22 +0000
Date: Thu, 15 May 2025 15:40:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515133519.2779639-2-usamaarif642@gmail.com>
X-ClientProxiedBy: LO4P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4431:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ac7b6d-0dce-44e4-622c-08dd93be6bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z05SU2M5TElNTkk1Y0ptNERGcHRpVS8xOEZPaXkzL2sxaHpGR1ZnRXV3WUkr?=
 =?utf-8?B?KzFPbFh5TUJRVkhrN0cvU1pJTWNKT1NJa1FKSlJJNC8zSFhnVUlVdkVYNHYz?=
 =?utf-8?B?WTM3VUJDSG9MNmtsVFFZSzhmUkIzdjJ5ZnpKdy9EQUFIMDdxL204L25VelJi?=
 =?utf-8?B?eC85THlKdDJralozWVFGMWZZOFlwSE5YakZZSDJEaTlHeHpBbzNZV09CQ2dl?=
 =?utf-8?B?MFM3cGtOczZXSDk2cFFETDhyVWtTRGt6MHhqSGhVMWNUa0Nvak5QRnVDODJF?=
 =?utf-8?B?clVENmJOb1U2M3JnWExJdlRJanRlbFEyNFoxR2xFakE5d3RRY0s5cUZ2eTN3?=
 =?utf-8?B?MVBncVB6ZjhTWlBtZ0Rvb3Y1L2ZZZkVGMVdCeG9ManNqcGZhSXlKWFc3NzN0?=
 =?utf-8?B?MUpHZXFHczhJcU8rNDFBV3cvM2o0dXdyZFcyQ2FEbDJiays1WU16RDFJOEJW?=
 =?utf-8?B?bTBCL1FDbTJkUG5CT3RUb2FoTlBRUzBKS3k3Ynd2V0g5OExzZlhmMUpzYTFG?=
 =?utf-8?B?VXZqckZHVDZRbS9wQjNkQ0dZRlZKRDVsUExkbnRtVk4yVlJyVHRPU0JnRE1T?=
 =?utf-8?B?OGpnaWd1SlNlbE1YZFRDRndRMXRUQmZTV1dOM1VpRlFpYU5EVm5CRXprS0t5?=
 =?utf-8?B?REx0MWxtT28ybE5rSEdld1drcWxCNGxHNFJuSmJnWVJ0SVcvSmN4bWhxdlJJ?=
 =?utf-8?B?aUJ4bkswaCtkbHVhY0tTbVBPU0FIK0hoMytHOTdmWFJBUjlQMFNPbk1BaVpo?=
 =?utf-8?B?b2ZZMUd2L2ZDeEtuampDejg0c3FURVNoOVY1MXR5TkxsSkhnc0VJZHBNT2xU?=
 =?utf-8?B?S3AydG1jZnVRaTJXRXU2dkpPNGh1ZitZZGYyLzA2NDFHYi9Na0JYTTdRYmRI?=
 =?utf-8?B?U1A1anNRTERwY0ZzbHc1T1VZT2hDQnBTYzRsdG1XVnpycTJ2ZFE3d1E5TWtr?=
 =?utf-8?B?VU1OcndOalV4c25pWHFYK1dMeENSVDNUeUdMRTVpcmNDQlhacENCemhUOHNw?=
 =?utf-8?B?RDIzYWx3VXJHYkxPemlhQTMwaGpRMFRvK1V3N2NneUw1Ujh3ZEF4UEdodVhE?=
 =?utf-8?B?VUozWXI4U2RnY3FwaXdYZEZ2YmswM21RTjRTNFdqTTRFc2YvcFpacVVnbmVN?=
 =?utf-8?B?SEJQMHcrRTlVR0dRcWlweW9TRzQveDJEam5pNTlpakxRdFlwb0RXSUxST1hn?=
 =?utf-8?B?YXNSL0lkTDl0SHhMWC9UaGpsUWo1OHQxWWdiYlplcW1ZeGk1ZVdjR0VIdmdx?=
 =?utf-8?B?STlTbFMrUGQ3VllGMzgvbGE0Rk9CSGxNZ2VCZU85cHFHOU50T2JLYVg0Qzd2?=
 =?utf-8?B?WGJBR2lITUE2ZEpsck5yMFo2MkpONE85YkxQVkVJQVM0NnVXaVI1cjFzaTgw?=
 =?utf-8?B?Vkdrci9JZ3JtZitvYTV2ZnpVMnl5Qm9vcUtRU1FocWhoekc1bXNDbi9yWis3?=
 =?utf-8?B?SFYyOWpBK0NjVVR1YzZLRENaQTRESWRGaTlpWFllTC9nRUdYQjVQVGJldExZ?=
 =?utf-8?B?bzczeDlGNnJGbWVZVG4rS2xBQ1NlN2FhM3dhTU5NN3Z0K2d2RHFoM2tFQ3FN?=
 =?utf-8?B?ZWN0UzJSMnZnWWthRDJVVmd2MUZEeGp2bk9OemFVbWdsOGc1Vis5R2Nob1lh?=
 =?utf-8?B?K1NxbjFBc0xRbUFtMUh6QWc1Tm1MYzdkSWZ6UTVtOU91VEFCS084MG9yM0hB?=
 =?utf-8?B?UXZNUHlLaVh3aUdMWWR5YXFKdWlqWTF6djhqT09nNVVrMEZGcUJrdTU0Wm1K?=
 =?utf-8?B?M24yaXZNbUxtY0dYY1o0Q2kvcENqNksxMGJVejJzM0tEUlI5S084b3FKSkwx?=
 =?utf-8?B?TlJ0a3BBeVVjaGtyY2JWdnEwOUdRa05YUkdYS285WDh2Z00wMi9nWEprcUJm?=
 =?utf-8?B?dkdiOW15Z3pURHZEVmp0UHh4Y29ueXlYUkZWdzRQOS9zU3R6TDdUTDhmVGsz?=
 =?utf-8?Q?GriIi1EOtG4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHJKYXl2VDN2MFlKaFlrdDE0SDE2b09ydHg2SFdJU0doWDFTNE5kb0xWeTJD?=
 =?utf-8?B?N3Uxa3NPVlpSeGdWMThTZTVHQ3NnUGI4Z0xTKzFZRHJsMzZhVktKbXY4aHJ6?=
 =?utf-8?B?TUc2UE5pdmZxRzlxY0lwK2VKcUdtSmo4UmJyN1BmZzE1aSs4SmhFN3FjMExV?=
 =?utf-8?B?NzY0dHpQektZK1hEKzVYZFRtY2x5MXdML0x4SERCeVltd3A5Q3JiQ05xTERh?=
 =?utf-8?B?QmloNitCeGhvS3Z1cW9jWXZjWVVVeVdWQ0x1djhMY0JPbUdVNUZlQXIzZ1d3?=
 =?utf-8?B?bHhhL29kajRmZGxTa1hDODRPN09NUHBJL1BpZnVrYnorYzN1dTE1MFFSWEFT?=
 =?utf-8?B?YmFzaXRqWERETEZLNDkrcmpqZGpPYnJUTHJXUlJJWC9EYUJ4aGd1cmJzSlZQ?=
 =?utf-8?B?eG1ZeVZmOWh4L1BrMnFjV1l6QWtPTndaK3poTXAyMXRmdGZsNitPSWFkYXRY?=
 =?utf-8?B?ZUJPUmo0Vm9lZUxLNWVZZytPc1o5MGwxT2xKWUtlT1Z6bFgyT1V6UUhpVlFN?=
 =?utf-8?B?VjJHeEpsSHY4YjhKRU9FbTkwZmc3Z3hqTjVwYmV6cUkxdWRpUmNJelJxTk4w?=
 =?utf-8?B?aTBwNFpocU1XY1NobXZOaHNKamRrZmx3WE84cWpoeDk4Q3FRMkdmeWhGWlZX?=
 =?utf-8?B?NzltZWw0QWI4aHhOeXlMNGl0YmpnaVFqVEdoTjZuUjh0RXJlRGRuVFRKeDJq?=
 =?utf-8?B?RGNFZGI2bDFkeDkxeEgyc0ZyRm90NWZ5WlVjMFVndXpMM2FZc1lsWmUwNGFZ?=
 =?utf-8?B?Z3ovOTVTRGdnZnVWMm5COUVEa3N6RXJqdUg0UVo2T2lWelkzL3kwek1MS3Vt?=
 =?utf-8?B?VWtGMEtlcG8zcEl0RkpubHdzcmw2RFJZNGoxZ2dkSWtzY1N0ejI1VHo0ZDNX?=
 =?utf-8?B?RURsbzZqQUgvck5WU1ZIZm5PUWJ0WHhqV2d0bU9ucDVlRzZMNzVoMjM5VDZF?=
 =?utf-8?B?cGFiL29SYVJMTzBQaHNFYWhBMTEwYjNuL1RzRHkvVlh2dUtHSG9FbVpzeUFj?=
 =?utf-8?B?RFZSMHpIUUNkeDZHazJVanBrY3RYWGFheEpDYzBpNXhyNExWQ21FUkk0K0E0?=
 =?utf-8?B?RUJSSklCQWxkL3A4U1EwNlhHRzEvUFd3S1ZpN3ozczRSUFNUS3VGNWViSm5S?=
 =?utf-8?B?OE9JdDhyRXFmcmFDZXA3RDhQdHUxWlU4bTFiMEsyOHJsOTlmcVNSN25jRzdq?=
 =?utf-8?B?NUZMYkdid1ZtMlJQWkgrdVpGM1BpelBjY0JhUGJrV21FY3F3R1Y1WS9mWjdj?=
 =?utf-8?B?bS82Sy82MFI5clZFaU1oaStraUNvbWNpaXUzelUwYW00UlRKSW9qTktvUG1Y?=
 =?utf-8?B?bkxNTi9XSWRyemliZ1R4STQralBEanJsdlFGNzBwcDQzVjZ0RU0xNHd0d3E2?=
 =?utf-8?B?OG5ZanNxL1RSaUJEcHAzQXhhRmFrb1VPd1g3QTcyR1UzcUhyRlhKaGVxanNz?=
 =?utf-8?B?cWQ3bExFQlluckZRWktONjNQY3NjNkdsVVhSTnZraWlXZHd4YVkzQ2cvcnBu?=
 =?utf-8?B?SmJZcURqSzZFb3NyRS9YaXNLZVhXSVUxVzNvRVFtQlNOZ2hSMjYxRTYrc3U1?=
 =?utf-8?B?VnB0cG5obno1ZlowUExFQk5iMnhZRW1Sc0tOWllCVlQwSFZBQjJWSzBNbW1D?=
 =?utf-8?B?NU1paTFrcTFJK25qbXg0N3dMTUd2L2ZKTkFyU01YaU5jREdZUzZsMUh5LzJQ?=
 =?utf-8?B?cmUzQ3RrbnVWUUpxcXFXRXoyUG1mckxvNUIrZXVwR3J6NHZNTm05bXRzRnFH?=
 =?utf-8?B?LzUwbHYzVVFqMitOSHJwN1hHTEs4Z0oxTHBlcXlsYzZIYzJNSWVvRHoyd1B6?=
 =?utf-8?B?clVmTkc2aVpHQnFERGhrOUZEMzZHT0JvRS9pYmJ4QVMxVUp6ZlRtNGR3STg4?=
 =?utf-8?B?TW9xWWYrWnR5NXNYWWYyaFhFdjlLaEpXTnAzb3B4bVRLM3R4RGNEK3JzSkFm?=
 =?utf-8?B?QVlkS3h3L09XODM1TkUvdGdHZENKeVBrZ01iMFVwVGF4cFB4aVNZT3RqTE01?=
 =?utf-8?B?ZjNBd0VKVkZub1V3eTlZb2h0emc1TnZ1WmxWcllFd1RHd1RBVUh0Nk03OUxj?=
 =?utf-8?B?S3VPTkk1RG1mK1E2djhXL01LSVNjV1ZkcDlhbFdncnYrODFKR1Bpcm16Mnd0?=
 =?utf-8?B?STRFblBBQk92b0M2UjdnaFhMNU5PZUlWS0pxVC9DczROcmNGbzFNM09lREpN?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3UyeAbp2BLp4zU/+DEoVmFy94eE5BVXEQ5Fjyk452BDOjeFLK6YGqtiJ+RAYFBKaj8b4EecTWry6TE+reKu9rerSUKVVRn0BXnnWhOaxhOWPb3mcZE0aPEuEfnsSEXWtrpxitMrNOFb35SIQA/I631GuvnndJpkXBZRfTT755OPiEpTygtSz43Kc+3PbBOVa+py3FZBYJayc8xDB2/vLT+c6i8oSuE6ib8FOLzdwOf9aJ7zVXcJkMxuO5ZTPwp+ETkt+Lf+qMWqm2nH92Mzro8/vQgq7XkvRI1bWQXPTYhWum1A27Uy9I4nB0zxuXxYlqwABRpn7kNLTIaeRbJMBvolEjQTwCxOQ4CAyTG8XcZ9aUmB4pQDkXcrAwNmSa8ZElZj7h5xVNA2rcbStlTu5ghpMyXiWQcLU27NyzrsFwPoOUbpNLaiD+T1AzogoyDv/cn29I99mmynw88FUPj9qLtqyLwHRhxfme5zPweC9MpwoPsuvqWqzMVZEl/h0H6NnYL9PbcJ9z9YVc1upwnZGGENS9FshQA7qegd1IpvGnl3UnJFbxFU47dop78vesxmojCVXoWzPGqFelruNUy4GfirbisYXthj8Q/F61pAubHA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ac7b6d-0dce-44e4-622c-08dd93be6bee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 14:40:22.1542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGCEcHCjzx09ZIFV6k00k0y1nKsNd9yTs9etPJi6/HZ8E9EP+62JMWirBsFh3tmIpPS/OpWd6iGWknB3h6qR+xRmJhiWK4rCqgfRR/6lfso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4431
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE0NCBTYWx0ZWRfX2sJoAV1isyOY 6ht1lAC7n4F8Q01weFIqmEwzHiXUCMUESoTyMWmU9odZ8t/8ItWc0fIFuTx6rzqxgf4c3QlG3a9 dXCYXUMeu//PYGrZ6XrIDnLS9MKhnuy0jLU55mH++NPKih2FiqegEL3iuRvpnBRNJbAF8jMoV/a
 mW9bi/xlQnzmMEDqeDt1OmpOcyFJZm5c6OMwKlm63gBpluxaZEeDcJFXLAGgnnwgKN8AVf4474w QoJGJE/LMROjqYAXUHAccBvgMeM53e353KmkzDahamx7iyw4FKjLboA8099fAr4VIdQfxzT7XTl futeXlki5qPXRWYlgBaFpcuttoMINBZFA5oQkyIRF+rBXF6b0lLcaPt9V5HansnsN2VngWvd2Gx
 9CQo8gkppZ3sxcKY/kcjASyen2djzkT+KikoWJQtAR1c3cwhTUSFGW+o3aBMnCquEtfAbc/L
X-Proofpoint-ORIG-GUID: 9QjpgD2CcZP3AteS3Jf6WpkEAVGlbfkv
X-Proofpoint-GUID: 9QjpgD2CcZP3AteS3Jf6WpkEAVGlbfkv
X-Authority-Analysis: v=2.4 cv=P846hjAu c=1 sm=1 tr=0 ts=6825fcd9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=XAL0NKGNisBYeAAHsVYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14694

Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
outlandish stuff and needs discussion.

You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
never is completely ignored and overridden. Which I am emphatically not
comfortable with. And you're not saying that you're doing this,
anywhere. Which is wrong.

Also, this patch is quite broken.

I'm hugely not a fan of adding mm_struct->flags2, and I'm even more not a
fan of you not mentioning such a completely fundamental change in the
commit mesage.

This patch also breaks VMA merging and the VMA tests...

I really feel this series needs to be an RFC until we can get some
consensus on how to approach this.

On Thu, May 15, 2025 at 02:33:30PM +0100, Usama Arif wrote:
> This is set via the new PR_SET_THP_POLICY prctl.

What is?

You're making very major changes here, including adding a new flag to
mm_struct (!!) and the explanation/justification for this is missing.

> This will set the MMF2_THP_VMA_DEFAULT_HUGE process flag
> which changes the default of new VMAs to be VM_HUGEPAGE. The
> call also modifies all existing VMAs that are not VM_NOHUGEPAGE
> to be VM_HUGEPAGE. The policy is inherited during fork+exec.

So you can only set this flag?

>
> This allows systems where the global policy is set to "madvise"
> to effectively have THPs always for the process. In an environment
> where different types of workloads are stacked on the same machine,
> this will allow workloads that benefit from always having hugepages
> to do so, without regressing those that don't.

Again, this explanation really makes no sense at all to me, I don't really
know what you mean, you're not going into what you're doing in this change,
this is just a very unclear commit message.

>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>  include/linux/huge_mm.h                       |  3 ++
>  include/linux/mm_types.h                      | 11 +++++++
>  include/uapi/linux/prctl.h                    |  4 +++
>  kernel/fork.c                                 |  1 +
>  kernel/sys.c                                  | 21 ++++++++++++
>  mm/huge_memory.c                              | 32 +++++++++++++++++++
>  mm/vma.c                                      |  2 ++
>  tools/include/uapi/linux/prctl.h              |  4 +++
>  .../trace/beauty/include/uapi/linux/prctl.h   |  4 +++
>  9 files changed, 82 insertions(+)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..e652ad9ddbbd 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -260,6 +260,9 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
>  	return orders;
>  }
>
> +void vma_set_thp_policy(struct vm_area_struct *vma);

This is a VMA-specific function but you're putting it in huge_mm.h? Why
can't this be in vma.h or vma.c?

> +void process_vmas_thp_default_huge(struct mm_struct *mm);

'vmas' is redundant here.

> +
>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>  					 unsigned long vm_flags,
>  					 unsigned long tva_flags,
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index e76bade9ebb1..2fe93965e761 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1066,6 +1066,7 @@ struct mm_struct {
>  		mm_context_t context;
>
>  		unsigned long flags; /* Must use atomic bitops to access */
> +		unsigned long flags2;


Ugh, god really??

I really am not a fan of adding flags2 just to add a prctl() feature like
this. This is crazy.

Also this is a TERRIBLE name. I mean, no please PLEASE no.

Do we really have absolutely no choice but to add a new flags field here?

It again doesn't help that you don't mention nor even try to justify this
in the commit message or cover letter.

If this is a 32-bit kernel vs. 64-bit kernel thing so we 'ran out of bits',
let's just go make this flags field 64-bit on 32-bit kernels.

I mean - I'm kind of insisting we do that to be honest. Because I really
don't like this.

Also if we _HAVE_ to have this, shouldn't we duplicate that comment about
atomic bitops?...

>
>  #ifdef CONFIG_AIO
>  		spinlock_t			ioctx_lock;
> @@ -1744,6 +1745,11 @@ enum {
>  				 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
>  				 MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
>
> +#define MMF2_THP_VMA_DEFAULT_HUGE		0

I thought the whole idea was to move away from explicitly refrencing 'THP'
in a future where large folios are implicit and now we're saying 'THP'.

Anyway the 'VMA' is totally redundant here.

> +#define MMF2_THP_VMA_DEFAULT_HUGE_MASK		(1 << MMF2_THP_VMA_DEFAULT_HUGE)

Do we really need explicit trivial mask declarations like this?

> +
> +#define MMF2_INIT_MASK		(MMF2_THP_VMA_DEFAULT_HUGE_MASK)

> +
>  static inline unsigned long mmf_init_flags(unsigned long flags)
>  {
>  	if (flags & (1UL << MMF_HAS_MDWE_NO_INHERIT))
> @@ -1752,4 +1758,9 @@ static inline unsigned long mmf_init_flags(unsigned long flags)
>  	return flags & MMF_INIT_MASK;
>  }
>
> +static inline unsigned long mmf2_init_flags(unsigned long flags)
> +{
> +	return flags & MMF2_INIT_MASK;
> +}
> +
>  #endif /* _LINUX_MM_TYPES_H */
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 15c18ef4eb11..325c72f40a93 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -364,4 +364,8 @@ struct prctl_mm_map {
>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>
> +#define PR_SET_THP_POLICY		78
> +#define PR_GET_THP_POLICY		79
> +#define PR_THP_POLICY_DEFAULT_HUGE	0
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 9e4616dacd82..6e5f4a8869dc 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1054,6 +1054,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>
>  	if (current->mm) {
>  		mm->flags = mmf_init_flags(current->mm->flags);
> +		mm->flags2 = mmf2_init_flags(current->mm->flags2);
>  		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
>  	} else {
>  		mm->flags = default_dump_filter;
> diff --git a/kernel/sys.c b/kernel/sys.c
> index c434968e9f5d..1115f258f253 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2658,6 +2658,27 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>  		mmap_write_unlock(me->mm);
>  		break;
> +	case PR_GET_THP_POLICY:
> +		if (arg2 || arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		if (!!test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2))

I really don't think we need the !!? Do we?

Shouldn't we lock the mm when we do this no? Can't somebody change this?

> +			error = PR_THP_POLICY_DEFAULT_HUGE;
> +		break;
> +	case PR_SET_THP_POLICY:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		if (mmap_write_lock_killable(me->mm))
> +			return -EINTR;
> +		switch (arg2) {
> +		case PR_THP_POLICY_DEFAULT_HUGE:
> +			set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
> +			process_vmas_thp_default_huge(me->mm);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		mmap_write_unlock(me->mm);
> +		break;
>  	case PR_MPX_ENABLE_MANAGEMENT:
>  	case PR_MPX_DISABLE_MANAGEMENT:
>  		/* No longer implemented: */
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2780a12b25f0..64f66d5295e8 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -98,6 +98,38 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
>  	return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
>  }
>
> +void vma_set_thp_policy(struct vm_area_struct *vma)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +
> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
> +		vm_flags_set(vma, VM_HUGEPAGE);
> +}
> +
> +static void vmas_thp_default_huge(struct mm_struct *mm)
> +{
> +	struct vm_area_struct *vma;
> +	unsigned long vm_flags;
> +
> +	VMA_ITERATOR(vmi, mm, 0);

This is a declaration, it should be grouped with declarations...

> +	for_each_vma(vmi, vma) {
> +		vm_flags = vma->vm_flags;
> +		if (vm_flags & VM_NOHUGEPAGE)
> +			continue;

Literally no point in you putting vm_flags as a separate variable here.

So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
is to override global 'never'?

I'm really concerned about this.

> +		vm_flags_set(vma, VM_HUGEPAGE);
> +	}
> +}

Do we have an mmap write lock established here? Can you confirm that? Also
you should add an assert for that here.

> +
> +void process_vmas_thp_default_huge(struct mm_struct *mm)
> +{
> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
> +		return;
> +
> +	set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2);
> +	vmas_thp_default_huge(mm);
> +}
> +
> +
>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>  					 unsigned long vm_flags,
>  					 unsigned long tva_flags,
> diff --git a/mm/vma.c b/mm/vma.c
> index 1f2634b29568..101b19c96803 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2476,6 +2476,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>  	if (!vma_is_anonymous(vma))
>  		khugepaged_enter_vma(vma, map->flags);
>  	ksm_add_vma(vma);
> +	vma_set_thp_policy(vma);

You're breaking VMA merging completely by doing this here...

Now I can map one VMA with this policy set, then map another immediately
next to it and - oops - no merge, ever, because the VM_HUGEPAGE flag is not
set in the new VMA on merge attempt.

I realise KSM is just as broken (grr) but this doesn't justify us
completely breaking VMA merging here.

You need to set earlier than this. Then of course a driver might decide to
override this, so maybe then we need to override that.

But then we're getting into realms of changing fundamental VMA code _just
for this feature_.

Again I'm iffy about this. Very.

Also you've broken the VMA userland tests here:

$ cd tools/testing/vma
$ make
...
In file included from vma.c:33:
../../../mm/vma.c: In function ‘__mmap_new_vma’:
../../../mm/vma.c:2486:9: error: implicit declaration of function ‘vma_set_thp_policy’; did you mean ‘vma_dup_policy’? [-Wimplicit-function-declaration]
 2486 |         vma_set_thp_policy(vma);
      |         ^~~~~~~~~~~~~~~~~~
      |         vma_dup_policy
make: *** [<builtin>: vma.o] Error 1

You need to create stubs accordingly.

>  	*vmap = vma;
>  	return 0;
>
> @@ -2705,6 +2706,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	mm->map_count++;
>  	validate_mm(mm);
>  	ksm_add_vma(vma);
> +	vma_set_thp_policy(vma);

You're breaking merging again... This is quite a bad case too as now you'll
have totally fragmented brk VMAs no?

We can't have it implemented this way.

>  out:
>  	perf_event_mmap(vma);
>  	mm->total_vm += len >> PAGE_SHIFT;
> diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
> index 35791791a879..f5945ebfe3f2 100644
> --- a/tools/include/uapi/linux/prctl.h
> +++ b/tools/include/uapi/linux/prctl.h
> @@ -328,4 +328,8 @@ struct prctl_mm_map {
>  # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
>  # define PR_PPC_DEXCR_CTRL_MASK		0x1f
>
> +#define PR_SET_THP_POLICY		78
> +#define PR_GET_THP_POLICY		79
> +#define PR_THP_POLICY_DEFAULT_HUGE	0
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> index 15c18ef4eb11..325c72f40a93 100644
> --- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> +++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> @@ -364,4 +364,8 @@ struct prctl_mm_map {
>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>
> +#define PR_SET_THP_POLICY		78
> +#define PR_GET_THP_POLICY		79
> +#define PR_THP_POLICY_DEFAULT_HUGE	0
> +
>  #endif /* _LINUX_PRCTL_H */
> --
> 2.47.1
>

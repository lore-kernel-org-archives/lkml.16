Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475334C8F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298923; cv=fail; b=APwlpPkYQQE4SuCgx0JlIwVe2TsJXuI90NiZ9wrtuRazx8yeAbS5qVEOgM5UC0t/pxNR4nQqhktSCK4jzRxoc9EXwwfXiyS2RshSvizL4IXzLRv8CGTJ4yF98xvqDyj18QP5p2YfvHzimW8C3ntNZp4Pvb3yjlswOKoh8KOmyHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298923; c=relaxed/simple;
	bh=HVO076MZPtJbDe2vcoy91pc0wb6X31PDLzw3gF2bSNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dWiYu64clva1XI7heEH7URdjVRquR4fl6fQkkotHe4WFiooi1SW74AZF5LtXXSfQl5dqFBKHDqZHB9Rg3VWcEM51RD3PZivHGmq7ng/RSvmBSaNVJBWL9Xv0bHg2yN98OUiuCJIx44cu53DdZqvTPtRCW+3eZCa4kHErTcYyRPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F9gTd49a; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xIqLhB++; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F9gTd49a";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xIqLhB++"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557AdwAd004416;
	Sat, 7 Jun 2025 12:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NwXajwdzAVMqg0alK9y+/m/zmPi7gamQPlAeNdOZp+w=; b=
	F9gTd49aYt23s1xNvRQLrXuyPBFOXGVahayC7VrCEKjb4EzWXN3kUPHWsAvrKDnV
	HGPzey7Wv81cnAWalNZmA7AIlRYuOIK/OvHtONV42PbOEOEqTBO1x6f1hnrNAuCc
	jWZXIL9cEGHUSMhlmKTPtXwVohuNZjGUuPLnCrIcckNLBjWb6FVagruZRGypMVpD
	BI9Ikdoqkd141d96NFeacH9dSCVvAYpA0Gs538k6ybmTMstfYK8ZNiRaR1WSofC3
	9Z5JcvSilXsUr1G0CSwU2EaZg8G/rKKk/+WPqVWngRLyLVH9HTsLNkzw8yUjQAX6
	W9CjXEEW9nQQ+sdVVlQjdw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad07rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 12:21:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557CIdWv007733;
	Sat, 7 Jun 2025 12:21:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5rs3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 12:21:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9/bIvxQlA899SGRHTvAYWe2dEsj+qrSbVYA2Et8YDH8kEkhuZzzaNRw9KA7EDF/k2pXrNzqyFC8mQ8LTL790VrR4d5SZt5HfX5A0iNYrKafg0fAfc+KiNjZu+LkSrtw4oNUy3/CJqL+6VUwvJ2lM1xiuR36CAUb9SOz+d7EDGVOdU3SQQN+xEMsuSAI72Y/Z1d067yx/aAudH1PRTsQ9t76W/S4AwgXqHtwq40VCqBAW4UGbx0QpmO93bNR7k09bPkfx5DzJBwruQkqOcrsQoKqlrZdx4mTvol+fysEacPDh+IYOBT//MxbMI+X6gf7yTj6l/yQSTY2p4B+Vmvl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwXajwdzAVMqg0alK9y+/m/zmPi7gamQPlAeNdOZp+w=;
 b=mX9KQuPagdUC7oKTcWGkOHWPJqmuxUSdlZ8dgIPbwG0T2+Qu6mk2zwOPm89TQi3ivNvpmDgpVI8GOBCetdihAP02/hXERUm6Rns/4GIcExSx3zxfVtRi5q0VSlhi02e0h2XQheGPGDIhbgUtxcyRk3JGYBVmLZq7e4R+hbWcgwzWyfuzP49Xv7zdbEVCSDQPLxxUvtAU26EcX086ft/E39NVYAuTBippW4bbW9dOs9fYA0Y5b63CNcBWNVQLW0Kpen6SzQhxtqpDn/pQpQYPkC5kN/t/VBpyOfHXtYl7ddJ4wQb1zyWo+Z/sleGu0srUkejwzOF91S2y8BoPq29amg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwXajwdzAVMqg0alK9y+/m/zmPi7gamQPlAeNdOZp+w=;
 b=xIqLhB++TAjfcE1ADVljKOpHnE9+Huotk8RkIiIW8FWDeHY2ywszv/WTlRhquH6xMbsnxF177Ma5meW58nKX4mZ30PWpXAuH1mpFb22wYfEE4U3D+8rQwBPo0g0sS1K6dezaNuCYVvm+k1cP0P/kv+mku/86+FcnQNJvPURGiJY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5600.namprd10.prod.outlook.com (2603:10b6:a03:3dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sat, 7 Jun
 2025 12:21:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 12:21:42 +0000
Date: Sat, 7 Jun 2025 13:21:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <381ca19f-4b62-41b8-9883-f233b50d6521@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <998a069c-9be5-4a10-888c-ba8269eaa333@lucifer.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <998a069c-9be5-4a10-888c-ba8269eaa333@lucifer.local>
X-ClientProxiedBy: LO4P265CA0302.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d17801-a6d2-4c21-db06-08dda5bddc5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGpMZDl6R2dtNm1EeFpWRUFjbHFMd3N1OWxZMDhySzFscDZwc3hXZERpNFZy?=
 =?utf-8?B?TXBwaWRTY3p6L080enNCRFAzYTdhZDdLaTlySEdDZlhIUG9OMm15Y1RLTHBt?=
 =?utf-8?B?NG1iNCs5UCthUFpwRi90ekJldlIwSG9EVzdRK0xUMzBDWmdMK3BsQm5zdXdF?=
 =?utf-8?B?SVdIM3R1Mmpib1pMcVRHRDJFdlNUV0RPNmFsSi9XSTJ1QTFpcGtaekdMaVFa?=
 =?utf-8?B?bnNYcXloREJXdTV0UzdTUjg0Z3hhaUFIUCtld0dtdzQrOWtuOVdkeVZJMWxS?=
 =?utf-8?B?NE5RYnV2ZmdkOFZoMmZ0ZXBzL09PQnZoYlhhT2ZqVGlaWDhya09ocGpCb3FF?=
 =?utf-8?B?Z0UrbGJpTTdVSFVQMmNoYTZqb1JpcU51ZHBPT0EwOFZEMGNtcVhobjdOV2ty?=
 =?utf-8?B?ZmMrYUREbTdmcTlTSVNNV0UwbXE2bEFUalZYeU5Jd0xhTGlBOTlvUUxJUWxm?=
 =?utf-8?B?VlRxTTlwNkRERCtQbmt3ZnFsUTRiK0FCTWNhWndyakx6ckJtb2NRM0tXcm5v?=
 =?utf-8?B?OWIwZ1N5Z1hjRnExaHRBU3d6Q1psQXBIQmxWQU5rTFdZUHhFZENET2ZzaUVa?=
 =?utf-8?B?Z0VjRzhjZE01MnlremdtVys5NlVWUGp3L21TS3JlMy90REZhVDZ5MlF3S3g0?=
 =?utf-8?B?YVhsbzIySHlnbWdsaFR5aytTVTNsNzJDMlV1R3Zrbnd2ZmRDcThtUzlyTzlq?=
 =?utf-8?B?c05OQ0lUYmcxU1RHSmxIQVdHeVA5N1JFQmpWWDg0cVdBZCtqTlNYZlkxUmMw?=
 =?utf-8?B?cDR1Y0NENHlnc2hEWWV5Vy9RcDYwT2J0V0pMLy95aFlzcW1NQlhvTlVuSkZs?=
 =?utf-8?B?RjU4eStrNnlvQmdXTVI4Z2ovcnYwNVNLNjBrWlhxMVFXbDViY3liSFlaYUhJ?=
 =?utf-8?B?MTJGVFZTWGRNTHRtVUhhbXJOTHpaVm04V0xFdmR3OTdMb0FBTUcxRFk2QTVO?=
 =?utf-8?B?NmVlQWVucEl0SjhmNFp1UHZ3dE0xOGZQMUg2eXNHWnZMQ25xYVF2QmdoZTls?=
 =?utf-8?B?VFNrOWxGRG95c3dMUXVBWENlT3UrbHdxdHcwdjRHaFVDKy9tNHF4OUVIbEQ3?=
 =?utf-8?B?N09Od3h4ajRpNGpjdXZOK0JZbzlFQUJVTk9qbDBxSGY1cFFHNkJaZHRzS2cw?=
 =?utf-8?B?aUZ1b1JoQkZhaVBJV0pZaWdVU1Yrb2UyM2tjVXNOUUJ5QkxkRVNidEg4R2FV?=
 =?utf-8?B?clIyVVlZb2hYZXhReFlscU90RkdiM1IrWFl0cGVlUUdrVzByMDlNRUNZOWFX?=
 =?utf-8?B?eHVFYlNVaUlXRndGdE14UGpGWFBqRkl5dnZWdHlzUkFiVlpoaUw5cGRqTzBJ?=
 =?utf-8?B?dVcyZ3VhNEMwRk9zQUhxa29ld2Y5MERKMWlTWkd0RllpTTN2UmtudW9uYS9S?=
 =?utf-8?B?MHZ0dDlPRjdkMnVkRjNJOWFXNDRSMFJDYm5HeXh0bTNmZkhNS1J6cXQ1SkNz?=
 =?utf-8?B?WU9iM3ovajBpNU9Wd25iL0U4MGFDakJQM1UxT3BxeEJEUm9ld0tyU3dTa2Ex?=
 =?utf-8?B?bnBGWVZudUZnUGxnK09YWjlRaEFucTBFb0NCVDdZU1pmVlhzaEFpZUFLMnpE?=
 =?utf-8?B?bHhQQ2VoRmx6TEJDMC82M1ZMNlg4bHE1VGh3Y2ZvRWZsOWJBcG52RWJ3eFZL?=
 =?utf-8?B?UjFKNGNabGdWMTVISWVITkYrcEpLYzlKWVl3VCt6WUJienhVc1ViUjJBWXEw?=
 =?utf-8?B?L3BBZ0tackwwcWxkUW56ZVNOWVBYejBISDlEbVNkK1dEZVVmU1BzTkIvTU5y?=
 =?utf-8?B?QXQ4OWVvVXhtQnpWK2pXTG1DVmtxTUsvbklZaG9UZ3UwUWpvNlhEZE1uQzFm?=
 =?utf-8?B?QkNKcTdOOGFSKzFxWEg0OVQyczFtTEhZZWxSSmh0QS92L25iZzlhMGpNRWRM?=
 =?utf-8?B?dmtqVXRLYVBDWk9ZSFJYTjl1Ny9XY0l5ZitjRFVFYmlWZ3M5ZXJ4cjRTNXgz?=
 =?utf-8?Q?RivxzyjkLJI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDE5REYxa2tSZkNFMzdZL1BlR3NRRXB5N0NwRVlZL0duWlNoL0R1ZlB5SDNK?=
 =?utf-8?B?MzZYaENpTVpZL1RyWW5zMklCRW5xRjE2WStBYXQ3cUJRVlFnU1gzMFBWdm01?=
 =?utf-8?B?QzErUG9oczQya3dvRXBIbW1iZUZrV1ZSMi9KT3NnRnYwNEVhR0RLcjNHVEM5?=
 =?utf-8?B?Z1BkM0VUSzBiYXFSdHRRUnBjbVhWVXJBcWhRcHhRS0ZxL3MrVTNnbFdacUxo?=
 =?utf-8?B?bmlXY1ZVeXNjOGQvdXdkdmluMFlPNi9FMDh0MGp6WUhjckVtN0QvYVkxYTVU?=
 =?utf-8?B?bDlxMjRHLzUydE9mRkVDYll6ZWhZQmhzUzlsQzhWRk1rdlhPYkZYVHVJRDNm?=
 =?utf-8?B?bUxSRVI5ejRlOUFxTHRRUVQ1MW1VQTVQYUdPNzA2ZGRoZW8wamFmaW1WZytl?=
 =?utf-8?B?Znp5UFRPYS9PVHNRTk9BeGZXYWd0eDY1bzFDb1JYS1dVbUR5RWUyYmpYbXFU?=
 =?utf-8?B?UkpZUWt0a3Q4d3l6ZzRPQXVMODlSMFNvbjhkL3BZcjZuc0VRSEN0OWV5NzVD?=
 =?utf-8?B?dzQ0cmViYTV6dW41TEJSczdlZEIyNHFJdnB1eXBVQ0dGbkx1TjArSHlBcGgz?=
 =?utf-8?B?RWU3NFNBUTY1RHBWRTRVMU5RNnVrMGpUSjhsSEtTUS9QU0p6ZkJvaU05TFVo?=
 =?utf-8?B?WXVxZFlXWlAzcnUvWktDSUgrMTFWb1Zublp3bUwwOFFPZVZwbEJBdHNnSkky?=
 =?utf-8?B?RFZDWXNNNEhLbTZlMG5qeUQ3UEJoM1RLNzJWRHNWV013NHRoeDBzbjcwOVdP?=
 =?utf-8?B?RFRPcEVla1U2eXZ2cG9jRXRGMERrTENjb2x2NzZXaHQ3amJaeFZDanNkeEMw?=
 =?utf-8?B?TGpOTDQyVE1DL2VQQXJ3YjBHVm1Kcm14SnNtRGRpUzhQUVkxUURyYjJaRVVm?=
 =?utf-8?B?bTd3cnY2QWdOM0NxdE1IQkNhZ3gvS2d0ejFwVWVFenNiTXBRT3g3UitEQ1dj?=
 =?utf-8?B?NFVWbllncW0zRVdEdkJ2SUhKeVBXZEZsdTBFN3V3N09qazMyQ1NkcURJbDRU?=
 =?utf-8?B?ZXpsNm55a0lxTjdVR3dpTDJDUlQxQ05EaFVkRDE5Ly8rRU1WYWpmTmVlZWJK?=
 =?utf-8?B?VUhpc3lBY2JudGNNZFFKQk5IZVZEcm1tdndLa1pnam9RdzBBTS8yMkRRNkVR?=
 =?utf-8?B?Vk5DVk9oTGlTcWNCcXU1KzRKU3lQTmNuaFRTVVFITU5lVnlaQ1FaRnBRRm1m?=
 =?utf-8?B?clpxejhqWTNJUnNNMDRHcFRReGpXY1UvcGZ3emZIdHQzdHpvZUVpMWZqWk9V?=
 =?utf-8?B?NWM1RzJ5eHdoOUk1KytJb0hJVkhFSzA4TkdwdjJTVUx1WGNraHVFemtSM0lm?=
 =?utf-8?B?WXJTYzlpK3pMUzZiWnFPL24yTGVIeFpWekw2eW1CcVBMZ3VEUGdvQ1YxYmVx?=
 =?utf-8?B?djZDcW5lOGlLWE42clJYQjFIT2hIK0pRazZVTTMvN1RsbHZEN2ljVXAwL3pa?=
 =?utf-8?B?RzNqN1RZTFJTYnZ1MCtleWVVVVBDYmRhK2J5eGIreWxQYzdQaG5NalJneE96?=
 =?utf-8?B?cTV1c2dKTCtBV2JLUUR2NHFJaTh0VXVIZFdLZlRiWnQ5UTBuS0Uwc2ZYMUpB?=
 =?utf-8?B?SC9vd1dPMG9waWZQQVlBYTNpdHVSSDVncWhqUmNqeHBsWDg2bnhHbzR0UlZX?=
 =?utf-8?B?V3ErMTlYdHVUejV1QmlrNU9COTVjZHNZQmVjTmNpUDlvWUVlcWtWMUcrZlMz?=
 =?utf-8?B?cjNiSS9pbFRmWTZzcVZDMzlnWW1IN3RWNUlxeUdoaEVpOTJmMlpxU05xZVNT?=
 =?utf-8?B?dXB4RThaMGNKdzNrdFNTS1hIS2F2aWtVYmJyeXh5WkVRMmZSVks2SnZSQnoz?=
 =?utf-8?B?QmQyeEZzamtORHMrak9WOTRidFFiYWU2R3NoZ0xyTW0wUlAzNjkzM0RPdnhI?=
 =?utf-8?B?MVNrMXk3cG5Bc0hNYmsvQTM4c1pOQ2FzeU1RZjZra1FKUG1VcWtSUVRIU2RC?=
 =?utf-8?B?Z204WUZzNUlXb25aOFRJZUdsNGxFOTFhRmhieG9LcFNpelZWeUtwak1ZNE15?=
 =?utf-8?B?QVlYQ1R4elZWV2dmZmc2YW9PVUZ1VjhQSTZMMVVYSWVML3Q5T1JUdzNQdDVl?=
 =?utf-8?B?Yk44WjlPVkZpckVTY2FtNnVnNjdtdFN3Q0Z3cGQydTdQL3MwYUQ3dmFjZnJ5?=
 =?utf-8?B?UUM0Z0lVN2ZBbXJ4QzJzOWdBazhFS1QxOVlpTzE3Z1BDLzMzRUloSzFoTGZM?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LK9zN/AfbHO0n0VF8n0dDsY5zwLr9LD1v/J3+xqC26NaRcHeYd3NzlBFMUBGEd/IWGOFTDf4yd5CCNFXjXwNAmAPMfHT+/B3zwQqeTZXMtlFcQO48tDsHY4JGUIjHM+KLgCAtQC4ZByoEe4+RuD2gCiJ6mcOYR9Unjhb+3F9XKrpTsf1Zw7aCcfaZuLWOUj2gJHHcBGSu2K7g+YN5mt3T6H3uC4pGPWtRskxVKfUarJcs2IwTUn51n+qbFAeLZszn62WWnnX3su/0QO/qVlO0QGwCv81fZq6x1gnlO4rql/IGFWYjU3FNO/mqTy+HmJrYPJqUN079XZKa95RAw31TzERbjvr3KFnKc8aY2JcD0XWvMf+v9EhW6JXjSHcrf4tCoxJOOPaxFrDDFAIbotM+MJeuUoaaRPXjwYL3YWUp28xc2I11sgvrffA4qtEVoo1UBKWt0Wgy1WGgqcYN9yfT95T8n7izeo4vwrPXNppFNHEYFs5SUWR+4/zHbfUrhN7cGYNrFY2aSfjvSYxFLz8izqWseaiGsKZL672wfCF0BiP3O+gJv0PiQRV/UHGpC2YN0ysKYxNnFwhtzKpbgV8JZoQ1a1aM8kblwpFMAU5zus=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d17801-a6d2-4c21-db06-08dda5bddc5b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 12:21:42.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6Tq83v18HJBS7BY0avbss7QFqKadeQhLj56OvU5CIr7oo8ijfmctwMGnTi5P9bh776PXqqwwpc7dWMhePFSXtePS0BMGwfTNtuO/UpmRz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5600
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506070087
X-Proofpoint-ORIG-GUID: j9Fqz28QFu8GspTrX-9UX3HMed3yoMKR
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=68442ed9 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=xoWPx12Y2HorSLNhkCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA4NyBTYWx0ZWRfX6fODGQ8wqzXj S2otNeZR2q+glLeVMspNnBYqWQX39R1doR4c9Zu5797qgsy3mEVDiQLnxsgmkB8RVwRNjCcy9p/ 1gewxJPYSTEjNwut0dFiSpiK+ghICqjhPgU5UIc/VJXM+wNn16MHW4wmsmw5EE+YF42MqSOG33c
 JBGu/PcqjgeE1W42QXMhqIiRlC+MusxHRxLkqAs8drShUo59eg4fc67yChncXwqOkBB01qYmDZF 01OFVDGsl9jBm7hocd1AGF38lcB4LUe3/GME0g6FP+9BF4qO3jTB1kwO2B3cd/nv6tq0w7Fy3oO smrJGue6qO+8EbQBN3vOkmJVqWLJazg/X8zHQEHkP5nYbChledIDuZhgzaw2xNuOpBWQoy3Qg2J
 tVO4AK7PS+uiSI4R+bETCjosW1ZrFYt6R6R37og3Q/xII4nJ9YHIrIHR0DmKuj+GsbVPME77
X-Proofpoint-GUID: j9Fqz28QFu8GspTrX-9UX3HMed3yoMKR

A couple follow up points that occurred to me:

On Sat, Jun 07, 2025 at 12:55:19PM +0100, Lorenzo Stoakes wrote:
> Not related to your patch at all, but man this whole thing (thp allowed orders)
> needs significant improvement, it seems always perversely complicated for a
> relatively simple operation.
>
> Overall I LOVE what you're doing here, but I feel we can clarify things a
> little while we're at it to make it clear exactly what we're doing.
>
> This is a very important change so forgive my fiddling about here but I'm
> hoping we can take the opportunity to make things a little simpler!
>
> On Thu, Jun 05, 2025 at 04:00:58PM +0800, Baolin Wang wrote:
> > The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, which
> > means that even though we have disabled the Anon THP configuration, MADV_COLLAPSE
> > will still attempt to collapse into a Anon THP. This violates the rule we have
> > agreed upon: never means never.
> >
> > Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> > in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>
> I'm generally not sure it's worth talking only about MADV_COLLAPSE here when
> you're changing what THP is permitted across the board, I may have missed some
> discussion and forgive me if so, but what is special about MADV_COLLAPSE's use
> of thp_vma_allowable_orders() that makes it ignore 'never's moreso than other
> users?

I'd mention that MADV_COLLAPSE is special because of not specifying
TVA_ENFORCE_SYSFS but you are making this change across the board for all
callers who do not specify this.

I'd also CLEARLY mention that you handle David's request re: madvise by
restricting yourself to checking only for NEVER and retaining the existing logic
of not enforcing sysfs settings when TVA_ENFORCE_SYSFS, which includes not
checking the VMA for VM_HUGEPAGE if the madvise mode is enabled.

(i.e. addressing David's request).

[snip]

> I feel this is compressing a lot of logic in a way that took me several
> readings to understand (hey I might not be the smartest cookie in the jar,
> but we need to account for all levels of kernel developer ;)
>
> I feel like we can make things a lot clearer here by separating out with a
> helper function (means we can drop some indentation too), and also take
> advantage of the fact that, if orders == 0, __thp_vma_allowable_orders()
> exits with 0 early so no need for us to do so ourselves:
>
> /* Strictly mask requested anonymous orders according to sysfs settings. */
> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> 		unsigned long tva_flags, unsigned long orders)
> {
> 	unsigned long always = READ_ONCE(huge_anon_orders_always);
> 	unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> 	unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> 	bool inherit_enabled = hugepage_global_enabled();
> 	bool has_madvise =  vm_flags & VM_HUGEPAGE;
> 	unsigned long mask = always | madvise;
>
> 	mask = always | madvise;
> 	if (inherit_enabled)
> 		mask |= inherit;
>
> 	/* All set to/inherit NEVER - never means never globally, abort. */
> 	if (!(mask & orders))
> 		return 0;
>
> 	/* Otherwise, we only enforce sysfs settings if asked. */

Perhaps worth adding a comment here noting that, if the user sets a sysfs mode
of madvise and if TVA_ENFORCE_SYSFS is not set, we don't bother checking whether
the VMA has VM_HUGEPAGE set.

> 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> 		return orders;
>
> 	mask = always;
> 	if (has_madvise)
> 		mask |= madvise;
> 	if (hugepage_global_always() || (has_madvise && inherit_enabled))
> 		mask |= inherit;
>
> 	return orders & mask;
> }
>
> ...
>
> static inline
> unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
> 				       unsigned long vm_flags,
> 				       unsigned long tva_flags,
> 				       unsigned long orders)
> {
> 	if (vma_is_anonymous(vma))
> 		orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
>
> 	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
> }
>
> >
> > --
> > 2.43.5
> >

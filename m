Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14B51F461A;
	Fri, 16 May 2025 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747397761; cv=fail; b=DYOz5Erf55B3X6FhETwaBh5HJL3RUKCZKseahb2yuv+rjsbv/MTnxG4xlAzNaPK8Am5Uyvh8xCV+3Pf7VSOgWhOwG31afBytBjLA1kgGdjOv6mhgQ66zNM2ORnG5qcnpHyeRlxzV10TaFdbjubTPJOHHVsp/QW+NqvxXiEXySNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747397761; c=relaxed/simple;
	bh=4h/76K5dxuoGgFFDd2GKyqy9OZanI2kwSO9L6NK8QVs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OstcWCxHdTPlu8MWckwXn1X5qRe7Ok6RsFcHEDgMo0Q1m/CoRF1p02AQegJQ2pt4t7vQwjARhtv5k5fYIjolaDHM73KMjO+0RZv10wbZnzKwY7WUuW3+l+cmnDgPHIg7Se9y8cLqUeE1rpcoezzNJOquS3pLw5aoR/NMjJFKwvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=biutn/3o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OFz5zM7O; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="biutn/3o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OFz5zM7O"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GAhH5l008942;
	Fri, 16 May 2025 12:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Ihpwueh/uv1x1xrXiN0t04G+OTdBARAN9BTE8bS/lmI=; b=
	biutn/3oNN2D8/ydNuFF1CfkSDSjJcZCt9BdXPljgqy3HxHLrJqiC/t2komzPaY4
	+yOnrP8sTPut0b2m/W6MIXe/NNvUyvL8a2JVHuvop/U+Sl5nKSik/rcNOcB8WSwd
	p5nllf0VjzNBDYcyjhO9Bm6lTXFiECJg/26sfhBqxsKrN0Qlv8tGWXPpi1/8sLKx
	oOAzcxsga/pb4YJQMgVUtDcqyXCs2CgSKI6q5KCeDalSc4Ycx859e4LuRHHLHmGi
	GqtLBoXP2a0vhNYXI+ivLRDB1NtkidXfY78UHr+ih5Jo6u73s0LHarcbTM7YJ2se
	A8MW64qLMDxcRDfwDZ9eEQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46nrbj1824-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 12:15:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBRIr5016282;
	Fri, 16 May 2025 12:15:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mc3615yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 12:15:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fr/8fAH3xGT31rLxUVbPpqA204gFzC/b9uhD7DbzaEIxHo9hbYTmPctxMP2Rq7OcfSHht14fC+Yl9APnHb+klH/Nn4bDAsoRPPtRQWByW5QuIq7sJ7zG93cQDqSkZ9jHRA7wTOIW/6hPlJnBA5dLSgYS/oOBQLIBgmW+e0hwcu+wwqKAwYir1WD43txc0uSbx80uElcW1BKXPgb7ZPL/ZUTTpDjW7iOAtXzar6Ju5HfP4Ngiz75bSTrvTWiIkg0k3iG17Tc4Srsf4wlcrbJ+2bn4y6PjlVAvkf9pvlHYDgIo09+d90Kdz4zPA8oTDB/tA6p5sKqkt70RPOelCcRKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ihpwueh/uv1x1xrXiN0t04G+OTdBARAN9BTE8bS/lmI=;
 b=PfcS8htJTZnyOOvvVcSpXLkaaCHXFwgO7b66VQcX0Rh1GEs1VDp8HOcXx6Cr+GJSb9gYojHoBxjIfXYecHbBLYzmHKMHtUf2Een3SPVlDLYNplEBsk6zr3Igz02+FbkMolZIj0GVN7RjJTNvb0d2dkMnIljGuVYIyIGGrAW+M3BrnYe4KTY7Lb85HWKtiw0FlZv+J6JcPU90CZ/bWp8Q2QidhZfBl4tSz03+Un573A4Ogsx8cCGuYjbOD5g685jotyjDMIS6Ic9kJCLDfD+AIaYPVGxTaw51tUoje1jVhPizKlQMXQ5Jy5E4wcaHzMx19u8Xl/QLKL3J0kCVOvzzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ihpwueh/uv1x1xrXiN0t04G+OTdBARAN9BTE8bS/lmI=;
 b=OFz5zM7ODqFMADEi0RGCpbUEKcoZm0U8IXhdmvLrGpQRVyc2med6yh5wmZzAn1B2UbwThQD8YWCHWFaWqjxvLEu6EkLJZ2xVHDsFYOMfs+meJFSdTJwrUrHs+uzVbfsnFfwEgjdD4y9aILAqI5Hs0+zLaVv2YeknAAz3HtambU8=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CH3PR10MB6812.namprd10.prod.outlook.com (2603:10b6:610:14b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 12:15:43 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Fri, 16 May 2025
 12:15:43 +0000
Message-ID: <6de86eb9-9d35-49ae-93fb-60cd56172f13@oracle.com>
Date: Fri, 16 May 2025 17:45:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/mellanox: Add mlxbf_pka driver for BlueField
 Soc
To: Ron Li <xiangrongl@nvidia.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, vadimp@nvidia.com, kblaiech@nvidia.com,
        davthompson@nvidia.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250515193234.2436452-1-xiangrongl@nvidia.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250515193234.2436452-1-xiangrongl@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWPR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::8) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CH3PR10MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 595abe12-b6fc-4c75-4cc9-08dd947360eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXErcTArZS93RW5PNWRUZkY4U1JITENjbmYxR1NJYXFvcmJGWStMa3FYRkcx?=
 =?utf-8?B?bTBVeC9pbEExUEtvM1lKS2RYK0tkVGNkZjAzRG9panEweTRiNXJGMWJqYlFE?=
 =?utf-8?B?MGdRMU83MFQ0K2tENm5sSER3N0VuQ0wzcklmY0VHbVRtRnhRek5uM012RTRS?=
 =?utf-8?B?TVZUSXh1L3I1dWhoVFY4QVY1R2lOcERZL0UvcWoxVTdKVk9Yb0wxZ3d3M2di?=
 =?utf-8?B?empqTjBjSGdwQWZSTTRHVUxWWnR1Rkc4QWhjODFyOU0xMkZiOFI0OGMzVXho?=
 =?utf-8?B?WXVzTWw1YlVHdEQ4NFY0TlNMdk1zWHJGTSt3TkJaYVd2Y1E4LzlydDZheUV3?=
 =?utf-8?B?VUtZK3htd0hXdHovTlFjaTkwZkIzdEUwVmNuS1RyaU1hUGQrdUtKVUUvY0Ns?=
 =?utf-8?B?K09vSWE2WDBNUGZFbTZjcWdidVFxSTVpN1BJNDZocXB5cmdEenlRSm0zUXlm?=
 =?utf-8?B?ekYzMURmaDlOeDRESHNsZms3d3QwZ3pDVUZCb0VqSVo5UGV0eWVaTXY5M1Ru?=
 =?utf-8?B?RkNCMHdRSjhQZ1ZCSFlob1MvNGR1Ulo3QW9yV3JhWUJCSmRGemY2S3J2V1B4?=
 =?utf-8?B?RkN2LzFOODcydGNqOGkyTndjczN5U29uZFZBeHhHOW9nc3FGUEt0b0FEdGdC?=
 =?utf-8?B?NGw2b3ZJS2JiK0dnakU1clovcmJJQUM3aVJEdXpSeHdvb0VsZS9SNVpIbE10?=
 =?utf-8?B?RCtIZmVFbmlVbEZYSTE3czhvU0VNQ2dUdExXODJjVDcwT25PTit5S2FtRFNO?=
 =?utf-8?B?Yy91SnNvRVZwTEl6K1hkY1dHZGFiaEh4Z2FOelVKTFhTZklCak5pK1VJVVAv?=
 =?utf-8?B?c0tPOUJwcGlNbXc5V3NUR21DdmtEZmVja2F0NzlJZzFlOHVsOUJyeW9UbXQ1?=
 =?utf-8?B?VnBJRlVKK3dxTitsdk50MUNoUmZDdG5VWm4vL1M5NU0wclRZK3N1UFNrNWRs?=
 =?utf-8?B?ejFGUlg2YVRIZnFNd3VuQ2RTTFJrVndWZWxpUlUrbnp1MnNsWEpMMEJYV2Ix?=
 =?utf-8?B?QWtGTEZyejhnWWVkc0NLWE00SjJYeWZGK09QY0pEbGI0STlwNUhYZnphZ0Zz?=
 =?utf-8?B?UlhrOEZDUFk4QXl1dG1lRGFjQlg4NCtOZEE4Z0pVWmdndVFXUE5nZE5DaTJ6?=
 =?utf-8?B?TGNCTnFoYlJqS1M2MU56Q0ZncEdzbGZRZlFJRktlcnJPNTlTMS9GdXdOK1M2?=
 =?utf-8?B?VTN3ek1wcEp5ZmdVU2kwZHVLUVErUDRORlRvb0NVVDRMN3dBVElIN0lGYkNH?=
 =?utf-8?B?SnVObisyM2Q1UXAzd3lLcXQ1V1JINVlZYllkdGw3NVlOSkhQamNlQTVBSzN2?=
 =?utf-8?B?VSsvcy9MZWVSbElUdDlIZHJtWGFWdzBRTkNCTjZnT2xLVUtyTkoyYmp3TDJj?=
 =?utf-8?B?Y0M1WStXdUdJYnJFalFQQWpsUEZmL1JtMHBtK1I5akZhVGU2U0NmT3dFSGZE?=
 =?utf-8?B?QXNUVFhNTTBNOUNDUGtLbjRlWVR5YVc3VTZIZ2ZrR2RHM3NHcWVFeC9xQnM4?=
 =?utf-8?B?MEh1ODFLWVIycmxORHVYTWdUeUpQVFI5NnhaUGtJbURFVXdFaDR0SzhhUVhL?=
 =?utf-8?B?YnRUSXNtNzN6cDZudDN2ZldJS1Zsc2pzaG12ZWxOM0ljK0p3RWFaUmhRWjc0?=
 =?utf-8?B?RWU2ME9ZY3phYTl1aUNOQzlrVHRZMDYwRDZwKzdLSHNIVXQ4N2Z6Kzlyd2hi?=
 =?utf-8?B?NWY0L0JKeXNOTjNEQW1SS3RZZjhuMjFRb2tOdnB4U3cyd29DT2g3RjVMVmdK?=
 =?utf-8?B?Ly9MRzUycitSOVl6WGdLT3UxMG8zT1h0L1pCT1hxaytCYkw3aDVOTlNHL1Bz?=
 =?utf-8?B?S0lhU1MxbENNWkhraG9ZQlh5di96UUJYTXBtNU1vald0dTJXM2t3UzVhTHpY?=
 =?utf-8?B?UGlFeFJVaFNyeTA1NEJDVGo3Ym50YkNtZHAxTDNLR3hjbW1xbk9VTnR1c24r?=
 =?utf-8?Q?1Ejnav/pXms=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNCYlNPc0pzTUJCTC9VMHl6a0pvMllyNUJqc3g1RG1JejJjRHBYRDZaRWpK?=
 =?utf-8?B?eU82U0ZQbzVzK3p4Yy9SSlBsNTR4dWpzRW03SlNZeW5XK1NFd043RE4vNm5S?=
 =?utf-8?B?RUVISHZMSEVob3VGTUI1Q0Z2cVZOdExlc0pablJpMGN4S2xrSmpzS0FGZitZ?=
 =?utf-8?B?Sis1UUFBaitPZVExSXVvMnI5NlNib1JuemdqNW4vTExxazJ6Wjd3R1NBbmN0?=
 =?utf-8?B?WWkya1ZDMlNaeUJXNEd4dzV6bkY4UE9GaGtyc3ZUa0VSNXUvMTY5OGNqUHNp?=
 =?utf-8?B?VmEySmprazJDbnU1UFUvYldMajRRMDFLUGtML2ZkSVpBcTQ1UEVJemJ1NzJh?=
 =?utf-8?B?M1JHM01nM1EydWdPOWhJMzY4S1NnKzg5dDNoK1R4UG8yWHpLK0FiOVNyL1Z0?=
 =?utf-8?B?ejFlKzlzSHYxNCszSUE2STBYSllKTHB3Tnoyd1Vab21NY29lMnhnVTFLNmpP?=
 =?utf-8?B?TkhsQzN1RURwMy9XdlMvckJ5cllvTmk2enYyc3pTREpHS0Z5VWFYZGEzZE1R?=
 =?utf-8?B?dU5tVm9Eb2Jqb2VGN2FxaTZPZkJ2TG1Vem4zaFBpZndoQWxrSjB0NXBxU3hv?=
 =?utf-8?B?bklWaG54Q1B3N3ZjT2tWZWdaTlB5Y3ZhUjhoYkd1S3hWanhQZEZLTVZ2VVE5?=
 =?utf-8?B?aW5xdGdOTzV2NlFOcmtFUS93MUxNK011WUlhbVFnTVo3NzJpYjcyL0s4NDFJ?=
 =?utf-8?B?ajVJcEtTZmJlYzZ5NFJWblNpRkdWQmdEUWM4eFpFbDlQM0JJcGZhYWUwSWRv?=
 =?utf-8?B?aG5iU3pKU2hEdWJLb1dVYis1aGVCMVBLeEZBK0wwVWQzVmJCMnJBemcrdzlV?=
 =?utf-8?B?Rkl4NE1WcXFORlV1bTBRWmwzY0FzakVRaUxzTktxYk9HQnA4WW9aaUhiRDdw?=
 =?utf-8?B?aUxFbmtLT3VhbHhQckI1NDlkV2p1dmJERGVTYkFUZ3RZOURNaUlWVXVkMHE3?=
 =?utf-8?B?MDl1S1dvQlNWMjZmM3pIQXFTUHZmYVpQK2JvbDRSeHpXZ095c01vektjSmxG?=
 =?utf-8?B?TXpaRm1neFB4TytSSCttNU1vSlNhVkFhVnlScmszcUZFZk1SOE5hTGNYSEkx?=
 =?utf-8?B?RXN0WUNEK2t6QW10SlZpbXE0MmdJaG5xZFJjWmUvV1BjMHJCOXdmYW51ekFK?=
 =?utf-8?B?NlgyTmUyUmpZakI4Wks5d1E3WGhZTk5PaW5adXB0UVpTaXlUVmhLMVk3aWNm?=
 =?utf-8?B?cGNiS1hiSVRETkxScnRpY2VBV2FYY2RvNk9yTTBlS0tZQzlPU0pzUWlNclI2?=
 =?utf-8?B?NUhwL1JJcEo1RS85c1VBazRqUjZEOVJmNmVCd0xSVHR1UEhSUnRLZ1JiVStm?=
 =?utf-8?B?V1VEUG5yYitYL3dIUDdnMitna1F4STdlb1pCUW5EYnp2Si9lSFFDeUpaRldh?=
 =?utf-8?B?eHJDOXlXRS9Ob2hRYVpXSnpYUE0rbHFyYmFGR2NkWE1qWDA1RG1PQ3IwOVZv?=
 =?utf-8?B?RTY3dTRrUlBwY1ZrMVF2NVlVMVdVVDRyd096eXNxY1h5T0JUdmx5UHRhUGd4?=
 =?utf-8?B?N3lwd2pGY0V0YWU4WWFDQmxqWTlyMFNIUEJGU1UzNDdaVTU5RFNac3dGZVQy?=
 =?utf-8?B?bFhLZm5yOVF3OEdjblloL0VZVTJwbk9FQzRWczZld3lBeWJXaEFXenN5Q0lw?=
 =?utf-8?B?Q2RidUxMQ2I5Q2JtQXEvemFJQlRjbjFMMGg2VGxxZ21KQ3o4RkRJNlUvOHFP?=
 =?utf-8?B?QWNnbmZja2s0c0VrbE1WdjcrSUorV2xPM1BCaHdXb2hvODY4dEdGWXY3b1NY?=
 =?utf-8?B?VnJHeExndmRhVytPTnpNOTdOYmJ4dTFVd0laRlhXWXJYYVUyQWxIS2dJa0ZS?=
 =?utf-8?B?bDB6K0ZzbHdNRTFYSFN3V2h6citWTTJQemg1K0hwUDk4RTJMbFhvSk5YTm4z?=
 =?utf-8?B?b3FaNFRabW8rYUp0OW9ENHFwUTV6SVFrd3k4eXFpM3JrTEtOV0NwNXgxSkZj?=
 =?utf-8?B?dDNneTNNRWtKa25XRW1CMmQ4YkFrblZENjVOaGNxSndwaXluNVpnSEZKVnht?=
 =?utf-8?B?RmQxOGt3ZlNHdWllcFlTbm9tYUlYUlhVeTdKUnEwb2czbjFlYkM3RGlDMXZN?=
 =?utf-8?B?STRPa2VKYnUySTd6VWt4WEZPUUhrdGFjYUZvb3N4dVY2SWJzZE5lUGNRREdt?=
 =?utf-8?B?T3RkQXBTTTNlL1R0aWQ0WllVL0tpVGhGV2VYK2hkYVRXTGVtd1Fob2xuNExS?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hvt4ExYe49WD3qgevwdn3xFYhd4SFDIRGI8Hi9JXsf+julHZ3EsOctXqqVvVg8zo5XLKizqoYAVFoFPBkE7bZ8zQVW57ogwE4go0zuW1FUPvI1SjL1+eEvZoKT+v6ZA2wDyGQxJXUlTlK83SEupSwhpIInHagkEfZuVJT+ZTZrtrYPyMYHvdjmKUigQhBavozIGflhmJSbiPZjvi6WdneYfYL2X5u0zmsVpmMjLNtzjRsSfvIgfG1dL4QTgixEbYRfxjlkUlmFo345iz5kbAF9lXCs5o7QOnX8KjPAQUEgO0zRoqVQfCe9MMLJbFnvixA8RtKWKTm+kj8BuljWTZ69Dzm+NlawqEm7Oc7ITrw4n1s8gsygL0mIgtRHploKWdQJkTtzAoMZu4ple7mMn68ZA1rCVUhgdH2ugrugtbh2n4vBr4izhwR8e9LPpDK2V2n5Rroi5AGsGACqD/4gqNTOUDv6OYF14oN3thwI8iOASSu+Mb2rxUNy5kt+I96thrlLGSceBgLZsR4Ci9mqel3t1Uvuup9JS5UvSAR1DK2NpBG3OLcuHNwTULgMHONUUkK+Ze8f+UualPth7SsWTZMHaKZXoGC9GFa7/+9svt4KQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595abe12-b6fc-4c75-4cc9-08dd947360eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:15:43.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQmWMhTme1vFnC6A5oXlBpEsZ/ZWThwOlPttiIMkIs8NL4+pT6WzLINSqZVSGqgc+7UEKPBE8/CT28bM7lf23IEK0X/68Tj672sXTfsj3ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6812
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505160117
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDExNiBTYWx0ZWRfX73+IBZu3+EWH lwsr4yR4GgKyx+RCFR9GtVVgtAEy9FOXNnRUxdRjQZYGKGy1vyjRFfARtMmCai/DOcGMKmFP/DS fneup/aBbiLS3vN5+yaTjmQHw2yEKPiEOgqustiLNApuyQsCPYpgM1rh7Qx3sym7uCB6WjiyI5K
 y9xzt3cLYaxuJimBDNVFSn89MI1pUsvXxi+LgRpZTouRw5eOZhbfD4cueDSk3tg6CPfc5fVFr3v dfM0fKj0yA7decKMsTw+5048HmXp4vzbPzHekiKwZMjBciX+siqy5TGe38FJyZM+S6KZZi1YpzV c5ouXf9jNpkXz1sWZlobU8PE1jrwVSN4/rHu3LL0FTQjLMnJH+BSgUeX7R4O1ecX+amsfuAYb/w
 cAspLoKZFYOgPxFnWg3I1QELNivRDKPn/Fpifz9fLcaVyKRHh9wnTRxJIe/PjxUYhLhzRttJ
X-Proofpoint-GUID: 7FzPQfijE4-FT7Tcrcf0orkjS9hPmWwi
X-Proofpoint-ORIG-GUID: 7FzPQfijE4-FT7Tcrcf0orkjS9hPmWwi
X-Authority-Analysis: v=2.4 cv=YqwPR5YX c=1 sm=1 tr=0 ts=68272c74 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=VwQbUJbxAAAA:8 a=jMoJkxaCnC1KPe3P0LQA:9 a=f0o0qlKoXmGc-9aa:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13186



On 16-05-2025 01:02, Ron Li wrote:
> Add the mlxbf_pka driver to support the BlueField SoC Public Key
> Acceleration (PKA) hardware. The PKA provides a simple, complete
> framework for crypto public key hardware offload. It supports direct
> access to the public key hardware resources from the user space, and
> makes available several arithmetic operations: some basic operations
> (e.g., addition and multiplication), some complex operations (e.g.,
> modular exponentiation and modular inversion), and high-level
> operations such as RSA, Diffie-Hallman, Elliptic Curve Cryptography,
> and the Federal Digital Signature Algorithm (DSA as documented in
> FIPS-186) public-private key systems.
> 
> The PKA driver initializes the PKA hardware interface and implements
> file operations so that user space libraries can bypass the kernel and
> have direct access to a specific set of device registers. The Arm cores
> interface to the PKA hardware through rings and a 64KB memory known as
> Window RAM. There are multiple PKA devices on the BlueField SoC. In
> general, each PKA device has 4 rings, 1 window RAM and 1 True Random
> Number Generator (TRNG). Thus, the driver has been designed to probe
> each PKA and each individual ring inside a given PKA. It also registers
> the TRNG to feed the kernel entropy (i.e., /dev/hwrng). To implement
> such design, the driver creates individual device files for each ring
> and TRNG module. The ring device files are identified using their ids,
> i.e., /dev/mlxbf_pka/<ring_id>.
> 
> The main driver logic such as probe() and remove() are implemented in
> mlxbf_pka_drv.c. The PKA ring device operations are also implemented in
> this source file, such as open(), release() and mmap().
> 
> The mlxbf_pka_dev.c source file implements functions to operate the
> underlying PKA hardware, such as TRNG operation, PKA hardware I/O
> access, PKA memory resource operation, etc.
> 
> The PKA driver is a lighweight driver that implements file operations
> and map memory regions of the PKA hardware to user space drivers and
> libraries. There is no in-kernel crypto support. Therefore, the PKA
> driver is included under drivers/platform/mellanox.

"Diffie-Hallman" -> "Diffie-Hellman"

lighweight -> lightweight

> 
> Testing
> 
> - Successful build of kernel for ARM64.
> 
> - Tested ARM64 build on several Mellanox BlueField 2 and 3 SoC boards
> that include the PKA hardware. The testing includes the validation of
> the PKA hardware execution, random number generation and public key
> acceleration performance.
> 
> Reviewed-by: David Thompson  <davthompson@nvidia.com>
> Reviewed-by: Khalil Blaiech  <kblaiech@nvidia.com>
> Signed-off-by: Ron Li <xiangrongl@nvidia.com>
> ---
>   .../ABI/testing/sysfs-platform-mellanox-pka   |   35 +
>   MAINTAINERS                                   |    8 +
>   drivers/platform/mellanox/Kconfig             |   10 +
>   drivers/platform/mellanox/Makefile            |    1 +
>   drivers/platform/mellanox/mlxbf_pka/Makefile  |   10 +
>   .../mellanox/mlxbf_pka/mlxbf_pka_dev.c        | 1891 +++++++++++++++++
>   .../mellanox/mlxbf_pka/mlxbf_pka_dev.h        |  657 ++++++
>   .../mellanox/mlxbf_pka/mlxbf_pka_drv.c        | 1066 ++++++++++
>   8 files changed, 3678 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-platform-mellanox-pka
>   create mode 100644 drivers/platform/mellanox/mlxbf_pka/Makefile
>   create mode 100644 drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_dev.c
>   create mode 100644 drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_dev.h
>   create mode 100644 drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_drv.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-pka b/Documentation/ABI/testing/sysfs-platform-mellanox-pka
> new file mode 100644
> index 000000000000..2ec5ed70dbf7
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-mellanox-pka
> @@ -0,0 +1,35 @@
> +What:		/sys/devices/platform/<pka-device-id>/<pka-ring-device-id>
> +Date:		Jun 2025
> +KernelVersion:	6.15
> +Contact:	"Ron Li <xiangrongl@nvidia.com>"
> +Description:
> +		The mlxbf_pka driver to support the BlueField SoC Public Key Acceleration (PKA)
> +		hardware. It supports direct access to the public key hardware resources from the
> +		user space.
> +
> +		There are three PKA device IDs that support different BlueField product:
> +
> +		===========  ==============================================
> +		BlueField-1  MLNXBF10:xx, where xx ranges from '00' to '03'
> +		BlueField-2  MLNXBF20:xx, where xx ranges from '00' to '07'
> +		BlueField-3  MLNXBF51:xx, where xx ranges from '00' to '17'
> +		===========  ==============================================
> +
> +		Each PKA device supports four PKA ring devices. The PKA ring device IDs are:
> +
> +		===========  ==============================================
> +		BlueField-1  MLNXBF11:xx, where xx ranges from '00' to '0F'
> +		BlueField-2  MLNXBF21:xx, where xx ranges from '00' to '20'
> +		BlueField-3  MLNXBF52:xx, where xx ranges from '00' to '60'
> +		===========  ==============================================
> +
> +		For each PKA ring device, the following operation interfaces:
> +
> +		- open(): open the PKA ring device specified by the device ID, and initiate the
> +		  related RAM regions.
> +		- release(): close the PKA ring device specified by the device ID, and release the
> +		  related RAM regions.
> +		- unlocked_ioctl(): make PKA related system calls, including getting ring device or
> +		  RAM region inofrmation, clearing PKA ring counter and getting random bytes from

typo inofrmation -> information

> +		  the TRNG module from the PKA device.
> +		- mmap(): map the PKA ring device to the virtual memory region.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f21f1dabb5fe..31821caf8a81 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15299,6 +15299,14 @@ L:	linux-i2c@vger.kernel.org
>   S:	Supported
>   F:	drivers/i2c/busses/i2c-mlxbf.c
>   
> +MELLANOX BLUEFIELD PKA DRIVER
> +M:	Ron Li <xiangrongl@nvidia.com>
> +M:	Khalil Blaiech <kblaiech@nvidia.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	Documentation/ABI/testing/sysfs-platform-mellanox-pka
> +F:	drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_*
> +
>   MELLANOX ETHERNET DRIVER (mlx4_en)
>   M:	Tariq Toukan <tariqt@nvidia.com>
>   L:	netdev@vger.kernel.org
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index aa760f064a17..6b99a7d866d8 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -108,4 +108,14 @@ config NVSW_SN2201
>   	  C3338R which is one of the Denverton product families.
>   	  System equipped with Nvidia®Spectrum-1 32x100GbE Ethernet switch.
>   
> +config MLXBF_PKA
> +        tristate "Mellanox BlueField Public Key Accelerator driver"
> +        depends on ARM64 && ACPI
> +        help
> +          If you say yes to this option, support will be included for the
> +          Public Key Accelerator device on Mellanox BlueField SoCs.
> +
> +          This driver can also be built as a module. If so, the module will
> +          be called pka-mlxbf.
> +
>   endif # MELLANOX_PLATFORM
> diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
> index ba56485cbe8c..1b2c61b26639 100644
> --- a/drivers/platform/mellanox/Makefile
> +++ b/drivers/platform/mellanox/Makefile
> @@ -5,6 +5,7 @@
>   #
>   obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
>   obj-$(CONFIG_MLXBF_BOOTCTL)	+= mlxbf-bootctl.o
> +obj-$(CONFIG_MLXBF_PKA)     += mlxbf_pka/
>   obj-$(CONFIG_MLXBF_PMC)		+= mlxbf-pmc.o
>   obj-$(CONFIG_MLXBF_TMFIFO)	+= mlxbf-tmfifo.o
>   obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
> diff --git a/drivers/platform/mellanox/mlxbf_pka/Makefile b/drivers/platform/mellanox/mlxbf_pka/Makefile
> new file mode 100644
> index 000000000000..67465a63edb8
> --- /dev/null
> +++ b/drivers/platform/mellanox/mlxbf_pka/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> +# SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION. All rights reserved.
> +#
> +# Mellanox BlueField PKA Driver
> +#
> +
> +obj-$(CONFIG_MLXBF_PKA) += mlxbf-pka.o
> +
> +mlxbf-pka-objs := mlxbf_pka_drv.o
> +mlxbf-pka-objs += mlxbf_pka_dev.o
> diff --git a/drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_dev.c b/drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_dev.c
> new file mode 100644
> index 000000000000..0c953c9e48c7
> --- /dev/null
> +++ b/drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_dev.c
> @@ -0,0 +1,1891 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> +// SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION. All rights reserved.
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/ioport.h>
> +#include <linux/timex.h>
> +#include <linux/types.h>
> +#include <linux/compiler.h>
> +#include <linux/io.h>
> +
> +#include "mlxbf_pka_dev.h"
> +
> +#define MASTER_CONTROLLER_OUT_OF_RESET 0
> +
> +/* Personalization string "NVIDIA-MELLANOX-BLUEFIELD-TRUE_RANDOM_NUMBER_GEN". */
> +static u32 mlxbf_pka_trng_drbg_ps_str[] = {
> +	0x4e564944, 0x49412d4d, 0x454c4c41, 0x4e4f582d,
> +	0x424c5545, 0x4649454c, 0x442d5452, 0x55455f52,
> +	0x414e444f, 0x4d5f4e55, 0x4d424552, 0x5f47454e
> +};
> +
> +/* Personalization string for DRBG test. */
> +static u32 mlxbf_pka_trng_drbg_test_ps_str[] = {
> +	0x64299d83, 0xc34d7098, 0x5bd1f51d, 0xddccfdc1,
> +	0xdd0455b7, 0x166279e5, 0x0974cb1b, 0x2f2cd100,
> +	0x59a5060a, 0xca79940d, 0xd4e29a40, 0x56b7b779
> +};
> +
> +/* First Entropy string for DRBG test. */
> +static u32 mlxbf_pka_trng_drbg_test_etpy_str1[] = {
> +	0xaa6bbcab, 0xef45e339, 0x136ca1e7, 0xbce1c881,
> +	0x9fa37b09, 0x63b53667, 0xb36e0053, 0xa202ed81,
> +	0x4650d90d, 0x8eed6127, 0x666f2402, 0x0dfd3af9
> +};
> +
> +/* Second Entropy string for DRBG test. */
> +static u32 mlxbf_pka_trng_drbg_test_etpy_str2[] = {
> +	0x35c1b7a1, 0x0154c52b, 0xd5777390, 0x226a4fdb,
> +	0x5f16080d, 0x06b68369, 0xd0c93d00, 0x3336e27f,
> +	0x1abf2c37, 0xe6ab006c, 0xa4adc6e1, 0x8e1907a2
> +};
> +
> +/* Known answer for DRBG test. */
> +static u32 mlxbf_pka_trng_drbg_test_output[] = {
> +	0xb663b9f1, 0x24943e13, 0x80f7dce5, 0xaba1a16f
> +};
> +
> +/* Known answer for poker test. */
> +static u64 poker_test_exp_cnt[] = {
> +	0x20f42bf4, 0xaf415f4, 0xf4f4fff4, 0xfff4f4f4
> +};
> +
> +struct mlxbf_pka_dev_gbl_config_t mlxbf_pka_gbl_config;
> +
> +/* Global PKA shim resource info table. */
> +static struct mlxbf_pka_dev_gbl_shim_res_info_t mlxbf_pka_gbl_res_tbl[MLXBF_PKA_MAX_NUM_IO_BLOCKS];
> +
> +/* Start a PKA device timer. */
> +static inline u64 mlxbf_pka_dev_timer_start_msec(u32 msec)
> +{
> +	u64 cur_time = get_cycles();
> +
> +	return (cur_time + (mlxbf_pka_early_cpu_speed() * msec) / MSEC_PER_SEC);
> +}
> +
> +/* Test a PKA device timer for completion. */
> +static inline int mlxbf_pka_dev_timer_done(u64 timer)
> +{
> +	return (get_cycles() >= timer);
> +}
> +
> +/* Return register base address. */
> +static inline u64 mlxbf_pka_dev_get_register_base(u64 base, u64 reg_addr)
> +{
> +	return (base + reg_addr) & PAGE_MASK;
> +}
> +
> +/* Return register offset. */
> +static inline u64 mlxbf_pka_dev_get_register_offset(u64 base, u64 reg_addr)
> +{
> +	return (base + reg_addr) & ~PAGE_MASK;
> +}
> +
> +/* Return word offset within io memory. */
> +static inline u64 mlxbf_pka_dev_get_word_offset(u64 mem_base, u64 word_addr, u64 mem_size)
> +{
> +	return (mem_base + word_addr) & (mem_size - 1);
> +}
> +
> +static inline u64 mlxbf_pka_dev_io_read(void __iomem *mem_ptr, u64 mem_off)
> +{
> +	return readq_relaxed(mem_ptr + mem_off);
> +}
> +
> +static inline void mlxbf_pka_dev_io_write(void __iomem *mem_ptr, u64 mem_off, u64 value)
> +{
> +	writeq_relaxed(value, mem_ptr + mem_off);
> +}
> +
> +/*
> + * Mapping PKA Ring address into Window RAM address.
> + * It converts the ring address, either physical address or virtual address, to valid address into
> + * the Window RAM. This is done assuming the Window RAM base, size and mask. Here, base is the
> + * actual physical address of the Window RAM, with the help of mask it is reduced to Window RAM
> + * offset within that PKA block. Further, with the help of addr and size, we arrive at the Window
> + * RAM offset address for a PKA Ring within the given Window RAM.
> + */
> +static inline u64 mlxbf_pka_ring_mem_addr(u64 base, u64 mask, u64 addr, u64 size)
> +{
> +	return ((base) & (mask)) |
> +	       (((addr) & MLXBF_PKA_WINDOW_RAM_RING_ADDR_MASK) |
> +	       ((((addr) & ~((size) - 1)) & MLXBF_PKA_WINDOW_RAM_RING_SIZE_MASK) >>
> +	       MLXBF_PKA_WINDOW_RAM_RING_SIZE_SHIFT));
> +}
> +
> +/* Add the resource to the global resource table. */
> +static int mlxbf_pka_dev_add_resource(struct mlxbf_pka_dev_res_t *res_ptr, u32 shim_idx)
> +{
> +	u8 res_cnt;
> +
> +	res_cnt = mlxbf_pka_gbl_res_tbl[shim_idx].res_cnt;
> +	if (res_cnt >= MLXBF_PKA_DEV_SHIM_RES_CNT)
> +		return -ENOMEM;
> +
> +	mlxbf_pka_gbl_res_tbl[shim_idx].res_tbl[res_cnt] = res_ptr;
> +	mlxbf_pka_gbl_res_tbl[shim_idx].res_cnt++;
> +
> +	return 0;
> +}
> +
> +/* Remove the resource from the global resource table. */
> +static int mlxbf_pka_dev_put_resource(struct mlxbf_pka_dev_res_t *res, u32 shim_idx)
> +{
> +	struct mlxbf_pka_dev_res_t *res_ptr;
> +	u8 res_idx;
> +
> +	for (res_idx = 0; res_idx < MLXBF_PKA_DEV_SHIM_RES_CNT; res_idx++) {
> +		res_ptr = mlxbf_pka_gbl_res_tbl[shim_idx].res_tbl[res_idx];
> +		if (res_ptr && strcmp(res_ptr->name, res->name) == 0) {
> +			mlxbf_pka_gbl_res_tbl[shim_idx].res_tbl[res_idx] = NULL;
> +			mlxbf_pka_gbl_res_tbl[shim_idx].res_cnt--;
> +			break;
> +		}
> +	}
> +
> +	/*
> +	 * Check whether the resource shares the same memory map; If so, the memory map shouldn't
> +	 * be released.
> +	 */
> +	for (res_idx = 0; res_idx < MLXBF_PKA_DEV_SHIM_RES_CNT; res_idx++) {
> +		res_ptr = mlxbf_pka_gbl_res_tbl[shim_idx].res_tbl[res_idx];
> +		if (res_ptr && res_ptr->base == res->base)
> +			return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __iomem *mlxbf_pka_dev_get_resource_ioaddr(u64 res_base, u32 shim_idx)
> +{
> +	struct mlxbf_pka_dev_res_t *res_ptr;
> +	u8 res_cnt, res_idx;
> +
> +	res_cnt = mlxbf_pka_gbl_res_tbl[shim_idx].res_cnt;
> +	if (!res_cnt)
> +		return NULL;
> +
> +	for (res_idx = 0; res_idx < res_cnt; res_idx++) {
> +		res_ptr = mlxbf_pka_gbl_res_tbl[shim_idx].res_tbl[res_idx];
> +		if (res_ptr->base == res_base)
> +			return res_ptr->ioaddr;
> +	}
> +
> +	return NULL;
> +}
> +
> +/* Set PKA device resource config and map io memory if needed. */
> +static int mlxbf_pka_dev_set_resource_config(struct device *dev,
> +					     struct mlxbf_pka_dev_shim_s *shim,
> +					     struct mlxbf_pka_dev_res_t *res_ptr,
> +					     u64 res_base,
> +					     u64 res_size,
> +					     u64 res_type,
> +					     char *res_name)
> +{
> +	if (res_ptr->status == MLXBF_PKA_DEV_RES_STATUS_MAPPED)
> +		return -EPERM;
> +
> +	switch (res_type) {
> +	case MLXBF_PKA_DEV_RES_TYPE_REG:
> +		res_ptr->base = res_base;
> +		break;
> +	case MLXBF_PKA_DEV_RES_TYPE_MEM:
> +		res_ptr->base = shim->mem_res.eip154_base + res_base;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	res_ptr->size = res_size;
> +	res_ptr->type = res_type;
> +	res_ptr->name = res_name;
> +	res_ptr->status = MLXBF_PKA_DEV_RES_STATUS_UNMAPPED;
> +	res_ptr->ioaddr = mlxbf_pka_dev_get_resource_ioaddr(res_ptr->base, shim->shim_id);
> +	if (!res_ptr->ioaddr) {
> +		if (!devm_request_mem_region(dev, res_ptr->base, res_ptr->size, res_ptr->name)) {
> +			dev_err(dev, "failed to get io memory region\n");
> +			return -EPERM;
> +		}
> +
> +		res_ptr->ioaddr = devm_ioremap(dev, res_ptr->base, res_ptr->size);
> +		if (!res_ptr->ioaddr) {
> +			dev_err(dev, "unable to map io memory into CPU space\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	res_ptr->status = MLXBF_PKA_DEV_RES_STATUS_MAPPED;
> +
> +	if (!res_ptr->ioaddr || mlxbf_pka_dev_add_resource(res_ptr, shim->shim_id)) {
> +		dev_err(dev, "unable to map io memory\n");
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Unset PKA device resource config - unmap io memory if needed. */
> +static void mlxbf_pka_dev_unset_resource_config(struct mlxbf_pka_dev_shim_s *shim,
> +						struct mlxbf_pka_dev_res_t *res_ptr)
> +{
> +	if (res_ptr->status != MLXBF_PKA_DEV_RES_STATUS_MAPPED)
> +		return;
> +
> +	if (res_ptr->ioaddr && -EBUSY != mlxbf_pka_dev_put_resource(res_ptr, shim->shim_id)) {
> +		pr_debug("mlxbf_pka: PKA device resource released\n");
> +		res_ptr->status = MLXBF_PKA_DEV_RES_STATUS_UNMAPPED;
> +	}
> +}
> +
> +int mlxbf_pka_dev_clear_ring_counters(struct mlxbf_pka_dev_ring_t *ring)
> +{
> +	struct mlxbf_pka_dev_res_t *master_seq_ctrl_ptr;
> +	u64 master_reg_base, master_reg_off;
> +	struct mlxbf_pka_dev_shim_s *shim;
> +	void __iomem *master_reg_ptr;
> +
> +	shim = ring->shim;
> +	master_seq_ctrl_ptr = &shim->resources.master_seq_ctrl;
> +	master_reg_base = master_seq_ctrl_ptr->base;
> +	master_reg_ptr = master_seq_ctrl_ptr->ioaddr;
> +	master_reg_off = mlxbf_pka_dev_get_register_offset(master_reg_base,
> +							   MLXBF_PKA_MASTER_SEQ_CTRL_ADDR);
> +
> +	/* Push the EIP-154 master controller into reset. */
> +	mlxbf_pka_dev_io_write(master_reg_ptr, master_reg_off, MLXBF_PKA_MASTER_SEQ_CTRL_RESET_VAL);
> +
> +	/* Clear counters. */
> +	mlxbf_pka_dev_io_write(master_reg_ptr, master_reg_off,
> +			       MLXBF_PKA_MASTER_SEQ_CTRL_CLEAR_COUNTERS_VAL);
> +
> +	/* Take the EIP-154 master controller out of reset. */
> +	mlxbf_pka_dev_io_write(master_reg_ptr, master_reg_off, MASTER_CONTROLLER_OUT_OF_RESET);
> +
> +	return 0;
> +}
> +
> +/*
> + * Initialize ring. Set ring parameters and configure ring resources. It returns 0 on success, a
> + * negative error code on failure.
> + */
> +static int mlxbf_pka_dev_init_ring(struct device *dev,
> +				   struct mlxbf_pka_dev_ring_t *ring,
> +				   u32 ring_id,
> +				   struct mlxbf_pka_dev_shim_s *shim)
> +{
> +	struct mlxbf_pka_dev_res_t *ring_window_ram_ptr;
> +	struct mlxbf_pka_dev_res_t *ring_info_words_ptr;
> +	struct mlxbf_pka_dev_res_t *ring_counters_ptr;
> +	u8 window_ram_split;
> +	u32 ring_words_off;
> +	u32 ring_cntrs_off;
> +	u32 ring_mem_base;
> +	u32 ring_mem_off;
> +	u32 shim_ring_id;
> +
> +	if (ring->status != MLXBF_PKA_DEV_RING_STATUS_UNDEFINED) {
> +		dev_err(dev, "PKA ring must be undefined\n");
> +		return -EPERM;
> +	}
> +
> +	if (ring_id > MLXBF_PKA_MAX_NUM_RINGS - 1) {
> +		dev_err(dev, "invalid ring identifier\n");
> +		return -EINVAL;
> +	}
> +
> +	ring->ring_id = ring_id;
> +	ring->shim = shim;
> +	ring->resources_num = MLXBF_PKA_MAX_NUM_RING_RESOURCES;
> +	shim_ring_id = ring_id % MLXBF_PKA_MAX_NUM_IO_BLOCK_RINGS;
> +	shim->rings[shim_ring_id] = ring;
> +
> +	/* Configure ring information control/status words resource. */
> +	ring_info_words_ptr = &ring->resources.info_words;
> +	ring_words_off = shim_ring_id * MLXBF_PKA_RING_WORDS_SPACING;
> +	ring_info_words_ptr->base = ring_words_off + shim->mem_res.eip154_base +
> +				    MLXBF_PKA_RING_WORDS_ADDR;
> +	ring_info_words_ptr->size = MLXBF_PKA_RING_WORDS_SIZE;
> +	ring_info_words_ptr->type = MLXBF_PKA_DEV_RES_TYPE_MEM;
> +	ring_info_words_ptr->status = MLXBF_PKA_DEV_RES_STATUS_UNMAPPED;
> +	ring_info_words_ptr->name = "MLXBF_PKA_RING_INFO";
> +
> +	/* Configure ring counters registers resource. */
> +	ring_counters_ptr = &ring->resources.counters;
> +	ring_cntrs_off = shim_ring_id * MLXBF_PKA_RING_CNTRS_SPACING;
> +	ring_counters_ptr->base = ring_cntrs_off + shim->mem_res.eip154_base +
> +				  MLXBF_PKA_RING_CNTRS_ADDR;
> +	ring_counters_ptr->size = MLXBF_PKA_RING_CNTRS_SIZE;
> +	ring_counters_ptr->type = MLXBF_PKA_DEV_RES_TYPE_REG;
> +	ring_counters_ptr->status = MLXBF_PKA_DEV_RES_STATUS_UNMAPPED;
> +	ring_counters_ptr->name = "MLXBF_PKA_RING_CNTRS";
> +
> +	/* Configure ring window RAM resource. */
> +	window_ram_split = shim->window_ram_split;
> +	if (window_ram_split == MLXBF_PKA_SHIM_WINDOW_RAM_SPLIT_ENABLED) {
> +		ring_mem_off = shim_ring_id * MLXBF_PKA_RING_MEM_1_SPACING;
> +		ring_mem_base = ring_mem_off + shim->mem_res.alt_wndw_ram_0_base;
> +	} else {
> +		ring_mem_off = shim_ring_id * MLXBF_PKA_RING_MEM_0_SPACING;
> +		ring_mem_base = ring_mem_off + shim->mem_res.wndw_ram_base;
> +	}
> +
> +	ring_window_ram_ptr = &ring->resources.window_ram;
> +	ring_window_ram_ptr->base = ring_mem_base;
> +	ring_window_ram_ptr->size = MLXBF_PKA_RING_MEM_SIZE;
> +	ring_window_ram_ptr->type = MLXBF_PKA_DEV_RES_TYPE_MEM;
> +	ring_window_ram_ptr->status = MLXBF_PKA_DEV_RES_STATUS_UNMAPPED;
> +	ring_window_ram_ptr->name = "MLXBF_PKA_RING_WINDOW";
> +
> +	ring->ring_info = devm_kzalloc(dev, sizeof(*ring->ring_info), GFP_KERNEL);
> +	if (!ring->ring_info)
> +		return -ENOMEM;
> +
> +	mutex_init(&ring->mutex);
> +	ring->status = MLXBF_PKA_DEV_RING_STATUS_INITIALIZED;
> +
> +	return 0;
> +}
> +
> +/* Release a given Ring. */
> +static int mlxbf_pka_dev_release_ring(struct mlxbf_pka_dev_ring_t *ring)
> +{
> +	struct mlxbf_pka_dev_shim_s *shim;
> +	u32 shim_ring_id;
> +
> +	if (ring->status == MLXBF_PKA_DEV_RING_STATUS_UNDEFINED)
> +		return 0;
> +
> +	if (ring->status == MLXBF_PKA_DEV_RING_STATUS_BUSY) {
> +		pr_err("mlxbf_pka error: PKA ring is busy\n");
> +		return -EBUSY;
> +	}
> +
> +	shim = ring->shim;
> +
> +	if (shim->status == MLXBF_PKA_SHIM_STATUS_RUNNING) {
> +		pr_err("mlxbf_pka error: PKA shim is running\n");
> +		return -EPERM;
> +	}
> +
> +	mlxbf_pka_dev_unset_resource_config(shim, &ring->resources.info_words);
> +	mlxbf_pka_dev_unset_resource_config(shim, &ring->resources.counters);
> +	mlxbf_pka_dev_unset_resource_config(shim, &ring->resources.window_ram);
> +
> +	ring->status = MLXBF_PKA_DEV_RING_STATUS_UNDEFINED;
> +	shim_ring_id = ring->ring_id % MLXBF_PKA_MAX_NUM_IO_BLOCK_RINGS;
> +	shim->rings[shim_ring_id] = NULL;
> +	shim->rings_num--;
> +
> +	return 0;
> +}
> +
> +/*
> + * Partition the window RAM for a given PKA ring.  Here we statically divide the 16K memory region
> + * into three partitions:  First partition is reserved for command descriptor ring (1K), second
> + * partition is reserved for result descriptor ring (1K), and the remaining 14K are reserved for
> + * vector data. Through this memory partition scheme, command/result descriptor rings hold a total
> + * of 1KB/64B = 16 descriptors each. The addresses for the rings start at offset 0x3800.  Also note
> + * that it is possible to have rings full while the vector data can support more data,  the opposite
> + * can also happen, but it is not suitable. For instance ECC point multiplication requires 8 input
> + * vectors and 2 output vectors, a total of 10 vectors. If each vector has a length of 24 words
> + * (24x4B = 96B), we can process 14KB/960B = 14 operations which is close to 16 the total
> + * descriptors supported by rings. On the other hand, using 12K vector data region, allows to
> + * process only 12 operations, while rings can hold 32 descriptors (ring usage is significantly
> + * low).
> + *
> + * For ECDSA verify, we have 12 vectors which require 1152B, with 14KB we can handle 12 operations,
> + * against 10 operations with 12KB vector data memory. We believe that the aforementioned memory
> + * partition help us to leverage the trade-off between supported descriptors and required vectors.
> + * Note that these examples give approximative values and does not include buffer word padding
> + * across vectors.
> + *
> + * The function also writes the result descriptor rings base addresses, size and type. And
> + * initialize the read and write pointers and statistics. It returns 0 on success, a negative error
> + * code on failure.
> + *
> + * This function must be called once per ring, at initialization before any other functions are
> + * called.
> + */
> +static int mlxbf_pka_dev_partition_mem(struct mlxbf_pka_dev_ring_t *ring)
> +{
> +	u64 rslt_desc_ring_base;
> +	u64 cmd_desc_ring_base;
> +	u32 cmd_desc_ring_size;
> +	u64 window_ram_base;
> +	u64 window_ram_size;
> +	u32 ring_mem_base;
> +
> +	if (!ring->shim || ring->status != MLXBF_PKA_DEV_RING_STATUS_INITIALIZED)
> +		return -EPERM;
> +
> +	window_ram_base = ring->resources.window_ram.base;
> +	window_ram_size = ring->resources.window_ram.size;
> +	/*
> +	 * Partition ring memory.  Give ring pair (cmmd descriptor ring and rslt descriptor ring) an
> +	 * equal portion of the memory.  The cmmd descriptor ring and result descriptor ring are
> +	 * used as "non-overlapping" ring. Currently set aside 1/8 of the window RAM for command and
> +	 * result descriptor rings - giving a total of 1K/64B = 16 descriptors per ring. The
> +	 * remaining memory is "Data Memory" - i.e. memory to hold the command operands and results
> +	 * - also called input/output vectors (in all cases these vectors are just single large
> +	 * integers - often in the range of hundreds to thousands of bits long).
> +	 */
> +	ring_mem_base = window_ram_base + MLXBF_PKA_WINDOW_RAM_DATA_MEM_SIZE;
> +	cmd_desc_ring_size = MLXBF_PKA_WINDOW_RAM_RING_MEM_SIZE /
> +			     MLXBF_PKA_WINDOW_RAM_RING_MEM_DIV;
> +	ring->num_cmd_desc = MLXBF_PKA_WINDOW_RAM_RING_MEM_SIZE /
> +			     MLXBF_PKA_WINDOW_RAM_RING_MEM_DIV / CMD_DESC_SIZE;
> +	/*
> +	 * The command and result descriptor rings may be placed at different (non-overlapping)
> +	 * locations in Window RAM memory space. PKI command interface: Most of the functionality is
> +	 * defined by the EIP-154 master firmware on the EIP-154 master controller Sequencer.
> +	 */
> +	cmd_desc_ring_base = ring_mem_base;
> +	rslt_desc_ring_base = ring_mem_base + cmd_desc_ring_size;
> +
> +	cmd_desc_ring_base = mlxbf_pka_ring_mem_addr(window_ram_base,
> +						     ring->shim->mem_res.wndw_ram_off_mask,
> +						     cmd_desc_ring_base,
> +						     window_ram_size);
> +	rslt_desc_ring_base = mlxbf_pka_ring_mem_addr(window_ram_base,
> +						      ring->shim->mem_res.wndw_ram_off_mask,
> +						      rslt_desc_ring_base,
> +						      window_ram_size);
> +
> +	/* Fill ring information. */
> +	memset(ring->ring_info, 0, sizeof(struct mlxbf_pka_dev_hw_ring_info_t));
> +
> +	ring->ring_info->cmmd_base = cmd_desc_ring_base;
> +	ring->ring_info->rslt_base = rslt_desc_ring_base;
> +	ring->ring_info->size = MLXBF_PKA_WINDOW_RAM_RING_MEM_SIZE /
> +				MLXBF_PKA_WINDOW_RAM_RING_MEM_DIV / CMD_DESC_SIZE - 1;
> +	ring->ring_info->host_desc_size = CMD_DESC_SIZE / sizeof(u32);
> +	ring->ring_info->in_order = ring->shim->ring_type;
> +
> +	return 0;
> +}
> +
> +/*
> + * Write the ring base address, ring size and type, and initialize (clear) the read and write
> + * pointers and statistics.
> + */
> +static int mlxbf_pka_dev_write_ring_info(struct mlxbf_pka_dev_res_t *buffer_ram_ptr,
> +					 u8 ring_id,
> +					 u32 ring_cmmd_base_val,
> +					 u32 ring_rslt_base_val,
> +					 u32 ring_size_type_val)
> +{
> +	u32 ring_spacing;
> +	u64 word_off;
> +
> +	if (buffer_ram_ptr->status != MLXBF_PKA_DEV_RES_STATUS_MAPPED ||
> +	    buffer_ram_ptr->type != MLXBF_PKA_DEV_RES_TYPE_MEM)
> +		return -EPERM;
> +
> +	pr_debug("mlxbf_pka: writing ring information control/status words\n");
> +
> +	ring_spacing = ring_id * MLXBF_PKA_RING_WORDS_SPACING;
> +	/*
> +	 * Write the command ring base address that the EIP-154 master firmware uses with the
> +	 * command ring read pointer to get command descriptors from the Host ring. After the
> +	 * initialization, although the word is writeable it should be regarded as read-only.
> +	 */
> +	word_off = mlxbf_pka_dev_get_word_offset(buffer_ram_ptr->base,
> +						 MLXBF_PKA_RING_CMMD_BASE_0_ADDR + ring_spacing,
> +						 MLXBF_PKA_BUFFER_RAM_SIZE);
> +	mlxbf_pka_dev_io_write(buffer_ram_ptr->ioaddr, word_off, ring_cmmd_base_val);
> +
> +	/*
> +	 * Write the result ring base address that the EIP-154 master firmware uses with the result
> +	 * ring write pointer to put the result descriptors in the Host ring. After the
> +	 * initialization, although the word is writeable it should be regarded as read-only.
> +	 */
> +	word_off = mlxbf_pka_dev_get_word_offset(buffer_ram_ptr->base,
> +						 MLXBF_PKA_RING_RSLT_BASE_0_ADDR + ring_spacing,
> +						 MLXBF_PKA_BUFFER_RAM_SIZE);
> +	mlxbf_pka_dev_io_write(buffer_ram_ptr->ioaddr, word_off, ring_rslt_base_val);
> +
> +	/*
> +	 * Write the ring size (number of descriptors), the size of the descriptor and the result
> +	 * reporting scheme. After the initialization, although the word is writeable it should be
> +	 * regarded as read-only.
> +	 */
> +	word_off = mlxbf_pka_dev_get_word_offset(buffer_ram_ptr->base,
> +						 MLXBF_PKA_RING_SIZE_TYPE_0_ADDR + ring_spacing,
> +						 MLXBF_PKA_BUFFER_RAM_SIZE);
> +	mlxbf_pka_dev_io_write(buffer_ram_ptr->ioaddr, word_off, ring_size_type_val);
> +
> +	/*
> +	 * Write the command and result ring indices that the EIP-154 master firmware uses. This
> +	 * word should be written with zero when the ring information is initialized. After the
> +	 * initialization, although the word is writeable it should be regarded as read-only.
> +	 */
> +	word_off = mlxbf_pka_dev_get_word_offset(buffer_ram_ptr->base,
> +						 MLXBF_PKA_RING_RW_PTRS_0_ADDR + ring_spacing,
> +						 MLXBF_PKA_BUFFER_RAM_SIZE);
> +	mlxbf_pka_dev_io_write(buffer_ram_ptr->ioaddr, word_off, 0);
> +
> +	/*
> +	 * Write the ring statistics (two 16-bit counters, one for commands and one for results)
> +	 * from EIP-154 master firmware point of view. This word should be written with zero when
> +	 * the ring information is initialized. After the initialization, although the word is
> +	 * writeable it should be regarded as read-only.
> +	 */
> +	word_off = mlxbf_pka_dev_get_word_offset(buffer_ram_ptr->base,
> +						 MLXBF_PKA_RING_RW_STAT_0_ADDR + ring_spacing,
> +						 MLXBF_PKA_BUFFER_RAM_SIZE);
> +	mlxbf_pka_dev_io_write(buffer_ram_ptr->ioaddr, word_off, 0);
> +
> +	return 0;
> +}
> +
> +/*
> + * Set up the control/status words. Upon a PKI command the EIP-154 master firmware will read and
> + * partially update the ring information.
> + */
> +static int mlxbf_pka_dev_set_ring_info(struct mlxbf_pka_dev_ring_t *ring)
> +{
> +	u32 ring_cmmd_base_val;
> +	u32 ring_rslt_base_val;
> +	u32 ring_size_type_val;
> +	int ret;
> +
> +	/* Ring info configuration MUST be done when the PKA ring is initialized. */
> +	if ((ring->shim->status != MLXBF_PKA_SHIM_STATUS_INITIALIZED &&
> +	     ring->shim->status != MLXBF_PKA_SHIM_STATUS_RUNNING &&
> +	     ring->shim->status != MLXBF_PKA_SHIM_STATUS_STOPPED) ||
> +	     ring->status != MLXBF_PKA_DEV_RING_STATUS_INITIALIZED)
> +		return -EPERM;
> +
> +	/* Partition ring memory. */
> +	ret = mlxbf_pka_dev_partition_mem(ring);
> +	if (ret) {
> +		pr_err("mlxbf_pka error: failed to initialize ring memory\n");
> +		return ret;
> +	}
> +
> +	/* Fill ring information. */
> +	ring_cmmd_base_val = ring->ring_info->cmmd_base;
> +	ring_rslt_base_val = ring->ring_info->rslt_base;
> +	ring_size_type_val = (ring->ring_info->in_order &
> +			     MLXBF_PKA_RING_INFO_IN_ORDER_MASK) <<
> +			     MLXBF_PKA_RING_INFO_IN_ORDER_OFFSET;
> +	ring_size_type_val |= (ring->ring_info->host_desc_size &
> +			      MLXBF_PKA_RING_INFO_HOST_DESC_SIZE_MASK) <<
> +			      MLXBF_PKA_RING_INFO_HOST_DESC_SIZE_OFFSET;
> +	ring_size_type_val |= (ring->num_cmd_desc - 1) & MLXBF_PKA_RING_NUM_CMD_DESC_MASK;
> +
> +	/* Write ring information status/control words in the PKA Buffer RAM. */
> +	ret = mlxbf_pka_dev_write_ring_info(&ring->shim->resources.buffer_ram,
> +					    ring->ring_id % MLXBF_PKA_MAX_NUM_IO_BLOCK_RINGS,
> +					    ring_cmmd_base_val,
> +					    ring_rslt_base_val,
> +					    ring_size_type_val);
> +	if (ret) {
> +		pr_err("mlxbf_pka error: failed to write ring information\n");
> +		return ret;
> +	}
> +
> +	ring->status = MLXBF_PKA_DEV_RING_STATUS_READY;
> +
> +	return ret;
> +}
> +
> +/*
> + * Create shim. Set shim parameters and configure shim resources. It returns 0 on success, a
> + * negative error code on failure.
> + */
> +static int mlxbf_pka_dev_create_shim(struct device *dev,
> +				     struct mlxbf_pka_dev_shim_s *shim,
> +				     u32 shim_id,
> +				     u8 split,
> +				     struct mlxbf_pka_dev_mem_res *mem_res)
> +{
> +	u64 reg_base;
> +	u64 reg_size;
> +	int ret;
> +
> +	if (shim->status == MLXBF_PKA_SHIM_STATUS_CREATED)
> +		return 0;
> +
> +	if (shim->status != MLXBF_PKA_SHIM_STATUS_UNDEFINED) {
> +		dev_err(dev, "PKA device must be undefined\n");
> +		return -EPERM;
> +	}
> +
> +	if (shim_id > MLXBF_PKA_MAX_NUM_IO_BLOCKS - 1) {
> +		dev_err(dev, "invalid shim identifier\n");
> +		return -EINVAL;
> +	}
> +
> +	shim->shim_id = shim_id;
> +	shim->mem_res = *mem_res;
> +
> +	if (split)
> +		shim->window_ram_split = MLXBF_PKA_SHIM_WINDOW_RAM_SPLIT_ENABLED;
> +	else
> +		shim->window_ram_split = MLXBF_PKA_SHIM_WINDOW_RAM_SPLIT_DISABLED;
> +
> +	shim->ring_type = MLXBF_PKA_RING_TYPE_IN_ORDER;
> +	shim->ring_priority = MLXBF_PKA_RING_OPTIONS_PRIORITY;
> +	shim->rings_num = MLXBF_PKA_MAX_NUM_IO_BLOCK_RINGS;
> +	shim->rings = devm_kzalloc(dev,
> +				   shim->rings_num * sizeof(struct mlxbf_pka_dev_ring_t),
> +				   GFP_KERNEL);
> +	if (!shim->rings) {
> +		dev_err(dev, "unable to allocate memory for ring\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* Set PKA device Buffer RAM config. */
> +	ret = mlxbf_pka_dev_set_resource_config(dev,
> +						shim,
> +						&shim->resources.buffer_ram,
> +						MLXBF_PKA_BUFFER_RAM_BASE,
> +						MLXBF_PKA_BUFFER_RAM_SIZE,
> +						MLXBF_PKA_DEV_RES_TYPE_MEM,
> +						"MLXBF_PKA_BUFFER_RAM");
> +	if (ret) {
> +		dev_err(dev, "unable to set Buffer RAM config\n");
> +		return ret;
> +	}
> +
> +	/* Set PKA device Master Controller register. */
> +	reg_size = PAGE_SIZE;
> +	reg_base = mlxbf_pka_dev_get_register_base(shim->mem_res.eip154_base,
> +						   MLXBF_PKA_MASTER_SEQ_CTRL_ADDR);
> +	ret = mlxbf_pka_dev_set_resource_config(dev,
> +						shim,
> +						&shim->resources.master_seq_ctrl,
> +						reg_base,
> +						reg_size,
> +						MLXBF_PKA_DEV_RES_TYPE_REG,
> +						"MLXBF_PKA_MASTER_SEQ_CTRL");
> +	if (ret) {
> +		dev_err(dev, "unable to set Master Controller register config\n");
> +		return ret;
> +	}
> +
> +	/* Set PKA device AIC registers. */
> +	reg_size = PAGE_SIZE;
> +	reg_base = mlxbf_pka_dev_get_register_base(shim->mem_res.eip154_base,
> +						   MLXBF_PKA_AIC_POL_CTRL_ADDR);
> +	ret = mlxbf_pka_dev_set_resource_config(dev,
> +						shim,
> +						&shim->resources.aic_csr,
> +						reg_base,
> +						reg_size,
> +						MLXBF_PKA_DEV_RES_TYPE_REG,
> +						"MLXBF_PKA_AIC_CSR");
> +	if (ret) {
> +		dev_err(dev, "unable to set AIC registers config\n");
> +		return ret;
> +	}
> +
> +	/* Set PKA device TRNG registers. */
> +	reg_size = PAGE_SIZE;
> +	reg_base = mlxbf_pka_dev_get_register_base(shim->mem_res.eip154_base,
> +						   MLXBF_PKA_TRNG_OUTPUT_0_ADDR);
> +	ret = mlxbf_pka_dev_set_resource_config(dev,
> +						shim,
> +						&shim->resources.trng_csr,
> +						reg_base,
> +						reg_size,
> +						MLXBF_PKA_DEV_RES_TYPE_REG,
> +						"MLXBF_PKA_TRNG_CSR");
> +	if (ret) {
> +		dev_err(dev, "unable to setup the TRNG\n");
> +		return ret;
> +	}
> +
> +	shim->status = MLXBF_PKA_SHIM_STATUS_CREATED;
> +
> +	return ret;
> +}
> +
> +/* Delete shim and unset shim resources. */
> +static int mlxbf_pka_dev_delete_shim(struct mlxbf_pka_dev_shim_s *shim)
> +{
> +	struct mlxbf_pka_dev_res_t *res_master_seq_ctrl, *res_aic_csr, *res_trng_csr;
> +	struct mlxbf_pka_dev_res_t *res_buffer_ram;
> +
> +	pr_debug("mlxbf_pka: PKA device delete shim\n");
> +
> +	if (shim->status == MLXBF_PKA_SHIM_STATUS_UNDEFINED)
> +		return 0;
> +
> +	if (shim->status != MLXBF_PKA_SHIM_STATUS_FINALIZED &&
> +	    shim->status != MLXBF_PKA_SHIM_STATUS_CREATED) {
> +		pr_err("mlxbf_pka error: PKA device status must be finalized\n");
> +		return -EPERM;
> +	}
> +
> +	res_buffer_ram = &shim->resources.buffer_ram;
> +	res_master_seq_ctrl = &shim->resources.master_seq_ctrl;
> +	res_aic_csr = &shim->resources.aic_csr;
> +	res_trng_csr = &shim->resources.trng_csr;
> +
> +	mlxbf_pka_dev_unset_resource_config(shim, res_buffer_ram);
> +	mlxbf_pka_dev_unset_resource_config(shim, res_master_seq_ctrl);
> +	mlxbf_pka_dev_unset_resource_config(shim, res_aic_csr);
> +	mlxbf_pka_dev_unset_resource_config(shim, res_trng_csr);
> +
> +	shim->status = MLXBF_PKA_SHIM_STATUS_UNDEFINED;
> +
> +	return 0;
> +}
> +
> +/* Configure ring options. */
> +static int mlxbf_pka_dev_config_ring_options(struct mlxbf_pka_dev_res_t *buffer_ram_ptr,
> +					     u32 rings_num,
> +					     u8 ring_priority)
> +{
> +	u64 control_word;
> +	u64 word_off;
> +
> +	if (buffer_ram_ptr->status != MLXBF_PKA_DEV_RES_STATUS_MAPPED ||
> +	    buffer_ram_ptr->type != MLXBF_PKA_DEV_RES_TYPE_MEM)
> +		return -EPERM;
> +
> +	if (rings_num > MLXBF_PKA_MAX_NUM_RINGS || rings_num < 1) {
> +		pr_err("mlxbf_pka error: invalid rings number\n");
> +		return -EINVAL;
> +	}
> +
> +	pr_debug("mlxbf_pka: configure PKA ring options control word\n");
> +
> +	/*
> +	 * Write MLXBF_PKA_RING_OPTIONS control word located in the MLXBF_PKA_BUFFER_RAM. The value
> +	 * of this word is determined by the PKA I/O block (Shim). Set the number of implemented
> +	 * command/result ring pairs that is available in this EIP-154, encoded as binary value,
> +	 * which is 4.
> +	 */
> +	control_word = (u64)0x0;
> +	control_word |= ring_priority & MLXBF_PKA_RING_OPTIONS_RING_PRIORITY_MASK;
> +	control_word |= ((rings_num - 1) << MLXBF_PKA_RING_OPTIONS_RING_NUM_OFFSET) &
> +			MLXBF_PKA_RING_OPTIONS_RING_NUM_MASK;
> +	control_word |= (MLXBF_PKA_RING_OPTIONS_SIGNATURE_BYTE <<
> +			MLXBF_PKA_RING_OPTIONS_SIGNATURE_BYTE_OFFSET) &
> +			MLXBF_PKA_RING_OPTIONS_SIGNATURE_BYTE_MASK;
> +	word_off = mlxbf_pka_dev_get_word_offset(buffer_ram_ptr->base,
> +						 MLXBF_PKA_RING_OPTIONS_ADDR,
> +						 MLXBF_PKA_BUFFER_RAM_SIZE);
> +	mlxbf_pka_dev_io_write(buffer_ram_ptr->ioaddr, word_off, control_word);
> +
> +	return 0;
> +}
> +
> +static int mlxbf_pka_dev_config_trng_clk(struct mlxbf_pka_dev_res_t *aic_csr_ptr)
> +{
> +	u32 trng_clk_en = 0;
> +	void __iomem *csr_reg_ptr;
> +	u64 csr_reg_base;
> +	u64 csr_reg_off;
> +	u64 timer;
> +
> +	if (aic_csr_ptr->status != MLXBF_PKA_DEV_RES_STATUS_MAPPED ||
> +	    aic_csr_ptr->type != MLXBF_PKA_DEV_RES_TYPE_REG)
> +		return -EPERM;
> +
> +	pr_debug("mlxbf_pka: turn on TRNG clock\n");
> +
> +	csr_reg_base = aic_csr_ptr->base;
> +	csr_reg_ptr = aic_csr_ptr->ioaddr;
> +
> +	/*
> +	 * Enable the TRNG clock in MLXBF_PKA_CLK_FORCE. In general, this register should be left in
> +	 * its default state of all zeroes. Only when the TRNG is directly controlled via the Host
> +	 * slave interface, the engine needs to be turned on using the 'trng_clk_on' bit in this
> +	 * register. In case the TRNG is controlled via internal firmware, this is not required.
> +	 */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_CLK_FORCE_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, MLXBF_PKA_CLK_FORCE_TRNG_ON);
> +	/*
> +	 * Check whether the system clock for TRNG engine is enabled. The clock MUST be running to
> +	 * provide access to the TRNG.
> +	 */
> +	timer = mlxbf_pka_dev_timer_start_msec(100);
> +	while (!trng_clk_en) {
> +		trng_clk_en |= mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off)
> +						     & MLXBF_PKA_CLK_FORCE_TRNG_ON;
> +		if (mlxbf_pka_dev_timer_done(timer)) {
> +			pr_debug("mlxbf_pka: failed to enable TRNG clock\n");
> +			return -EAGAIN;
> +		}
> +	}
> +	pr_debug("mlxbf_pka: trng_clk_on is enabled\n");
> +
> +	return 0;
> +}
> +
> +static int mlxbf_pka_dev_trng_wait_test_ready(void __iomem *csr_reg_ptr, u64 csr_reg_base)
> +{
> +	u64 csr_reg_off, timer, csr_reg_val, test_ready = 0;
> +
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_STATUS_ADDR);
> +	timer = mlxbf_pka_dev_timer_start_msec(1000);
> +
> +	while (!test_ready) {
> +		csr_reg_val = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +		test_ready = csr_reg_val & MLXBF_PKA_TRNG_STATUS_TEST_READY;
> +
> +		if (mlxbf_pka_dev_timer_done(timer)) {
> +			pr_debug("mlxbf_pka: TRNG test ready timer done, 0x%llx\n", csr_reg_val);
> +			return 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mlxbf_pka_dev_trng_enable_test(void __iomem *csr_reg_ptr, u64 csr_reg_base, u32 test)
> +{
> +	u64 csr_reg_val, csr_reg_off;
> +
> +	/*
> +	 * Set the 'test_mode' bit in the TRNG_CONTROL register and the 'test_known_noise' bit in
> +	 * the TRNG_TEST register – this will immediately set the 'test_ready' bit (in the
> +	 * TRNG_STATUS register) to indicate that data can be written. It will also reset the
> +	 * 'monobit test', 'run test' and 'poker test' circuits to their initial states. Note that
> +	 * the TRNG need not be enabled for this test.
> +	 */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONTROL_ADDR);
> +	csr_reg_val = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONTROL_ADDR);
> +
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off,
> +			       csr_reg_val | MLXBF_PKA_TRNG_CONTROL_TEST_MODE);
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_TEST_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, test);
> +	/* Wait until the 'test_ready' bit is set. */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_STATUS_ADDR);
> +	do {
> +		csr_reg_val = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +	} while (!(csr_reg_val & MLXBF_PKA_TRNG_STATUS_TEST_READY));
> +
> +	/* Check whether the 'monobit test', 'run test' and 'poker test' are reset. */
> +	if (csr_reg_val &
> +	    (MLXBF_PKA_TRNG_STATUS_MONOBIT_FAIL |
> +	    MLXBF_PKA_TRNG_STATUS_RUN_FAIL |
> +	    MLXBF_PKA_TRNG_STATUS_POKER_FAIL)) {
> +		pr_err("mlxbf_pka error: test bits aren't reset, TRNG_STATUS:0x%llx\n",
> +		       csr_reg_val);
> +		return -EAGAIN;
> +	}
> +
> +	/*
> +	 * Set 'stall_run_poker' bit to allow inspecting the state of the result counters which
> +	 * would otherwise be reset immediately for the next 20,000 bits block to test.
> +	 */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_ALARMCNT_ADDR);
> +	csr_reg_val = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr,
> +			       csr_reg_off,
> +			       csr_reg_val | MLXBF_PKA_TRNG_ALARMCNT_STALL_RUN_POKER);
> +
> +	return 0;
> +}
> +
> +static int mlxbf_pka_dev_trng_test_circuits(void __iomem *csr_reg_ptr,
> +					    u64 csr_reg_base,
> +					    u64 datal, u64 datah,
> +					    int count, u8 add_half,
> +					    u64 *monobit_fail_cnt,
> +					    u64 *run_fail_cnt,
> +					    u64 *poker_fail_cnt)
> +{
> +	u64 status, csr_reg_off;
> +	int test_idx;
> +
> +	if (!monobit_fail_cnt || !run_fail_cnt || !poker_fail_cnt)
> +		return -EINVAL;
> +
> +	for (test_idx = 0; test_idx < count; test_idx++) {
> +		csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								MLXBF_PKA_TRNG_RAW_L_ADDR);
> +		mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, datal);
> +
> +		if (add_half) {
> +			if (test_idx < count - 1) {
> +				csr_reg_off =
> +				mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								  MLXBF_PKA_TRNG_RAW_H_ADDR);
> +				mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, datah);
> +			}
> +		} else {
> +			csr_reg_off =
> +			mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +							  MLXBF_PKA_TRNG_RAW_H_ADDR);
> +			mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, datah);
> +		}
> +
> +		/*
> +		 * Wait until the 'test_ready' bit in the TRNG_STATUS register becomes '1' again,
> +		 * signaling readiness for the next 64 bits of test data. At this point, the

typo signaling -> signalling

> +		 * previous test data has been handled so the counter states can be inspected.
> +		 */
> +		csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								MLXBF_PKA_TRNG_STATUS_ADDR);
> +		do {
> +			status = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +		} while (!(status & MLXBF_PKA_TRNG_STATUS_TEST_READY));
> +
> +		/* Check test status bits. */
> +		csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								MLXBF_PKA_TRNG_INTACK_ADDR);
> +		if (status & MLXBF_PKA_TRNG_STATUS_MONOBIT_FAIL) {
> +			mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off,
> +					       MLXBF_PKA_TRNG_STATUS_MONOBIT_FAIL);
> +			*monobit_fail_cnt += 1;
> +		} else if (status & MLXBF_PKA_TRNG_STATUS_RUN_FAIL) {
> +			mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off,
> +					       MLXBF_PKA_TRNG_STATUS_RUN_FAIL);
> +			*run_fail_cnt += 1;
> +		} else if (status & MLXBF_PKA_TRNG_STATUS_POKER_FAIL) {
> +			mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off,
> +					       MLXBF_PKA_TRNG_STATUS_POKER_FAIL);
> +			*poker_fail_cnt += 1;
> +		}
> +	}
> +
> +	return (*monobit_fail_cnt || *poker_fail_cnt || *run_fail_cnt) ? -EIO : 0;
> +}
> +
> +static void mlxbf_pka_dev_trng_disable_test(void __iomem *csr_reg_ptr, u64 csr_reg_base)
> +{
> +	u64 status, val, csr_reg_off;
> +	/*
> +	 * When done, clear the 'test_known_noise' bit in the TRNG_TEST register (will immediately
> +	 * clear the 'test_ready' bit in the TRNG_STATUS register and reset the 'monobit test',
> +	 * 'run test' and 'poker test' circuits) and clear the 'test_mode' bit in the TRNG_CONTROL
> +	 * register.
> +	 */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_TEST_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_STATUS_ADDR);
> +	status = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +
> +	if (status & MLXBF_PKA_TRNG_STATUS_TEST_READY)
> +		pr_info("mlxbf_pka warning: test ready bit is still set\n");
> +
> +	if (status &
> +	    (MLXBF_PKA_TRNG_STATUS_MONOBIT_FAIL |
> +	    MLXBF_PKA_TRNG_STATUS_RUN_FAIL |
> +	    MLXBF_PKA_TRNG_STATUS_POKER_FAIL))
> +		pr_info("mlxbf_pka warning: test bits are still set, TRNG_STATUS:0x%llx\n", status);
> +
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONTROL_ADDR);
> +	val = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, (val & ~MLXBF_PKA_TRNG_STATUS_TEST_READY));
> +
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_ALARMCNT_ADDR);
> +	val = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr,
> +			       csr_reg_off,
> +			       (val & ~MLXBF_PKA_TRNG_ALARMCNT_STALL_RUN_POKER));
> +}
> +
> +static int mlxbf_pka_dev_trng_test_known_answer_basic(void __iomem *csr_reg_ptr, u64 csr_reg_base)
> +{
> +	u64 poker_cnt[MLXBF_PKA_TRNG_POKER_TEST_CNT];
> +	u64 monobit_fail_cnt = 0;
> +	u64 poker_fail_cnt = 0;
> +	u64 run_fail_cnt = 0;
> +	u64 monobit_cnt;
> +	u64 csr_reg_off;
> +	int cnt_idx;
> +	int cnt_off;
> +	int ret;
> +
> +	pr_debug("mlxbf_pka: run known-answer test circuits\n");
> +
> +	ret = mlxbf_pka_dev_trng_enable_test(csr_reg_ptr, csr_reg_base,
> +					     MLXBF_PKA_TRNG_TEST_KNOWN_NOISE);
> +	if (ret)
> +		return ret;
> +
> +	ret = mlxbf_pka_dev_trng_test_circuits(csr_reg_ptr,
> +					       csr_reg_base,
> +					       MLXBF_PKA_TRNG_TEST_DATAL_BASIC_1,
> +					       MLXBF_PKA_TRNG_TEST_DATAH_BASIC_1,
> +					       MLXBF_PKA_TRNG_TEST_COUNT_BASIC_1,
> +					       MLXBF_PKA_TRNG_TEST_HALF_NO,
> +					       &monobit_fail_cnt,
> +					       &run_fail_cnt,
> +					       &poker_fail_cnt);
> +
> +	ret |= mlxbf_pka_dev_trng_test_circuits(csr_reg_ptr,
> +						csr_reg_base,
> +						MLXBF_PKA_TRNG_TEST_DATAL_BASIC_2,
> +						MLXBF_PKA_TRNG_TEST_DATAH_BASIC_2,
> +						MLXBF_PKA_TRNG_TEST_COUNT_BASIC_2,
> +						MLXBF_PKA_TRNG_TEST_HALF_ADD,
> +						&monobit_fail_cnt,
> +						&run_fail_cnt,
> +						&poker_fail_cnt);
> +
> +	pr_debug("mlxbf_pka: monobit_fail_cnt : 0x%llx\n", monobit_fail_cnt);
> +	pr_debug("mlxbf_pka: poker_fail_cnt   : 0x%llx\n", poker_fail_cnt);
> +	pr_debug("mlxbf_pka: run_fail_cnt     : 0x%llx\n", run_fail_cnt);
> +
> +	for (cnt_idx = 0, cnt_off = 0;
> +	     cnt_idx < MLXBF_PKA_TRNG_POKER_TEST_CNT;
> +	     cnt_idx++, cnt_off += 8) {
> +		csr_reg_off =
> +		mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +						  (MLXBF_PKA_TRNG_POKER_3_0_ADDR + cnt_off));
> +		poker_cnt[cnt_idx] = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +	}
> +
> +	csr_reg_off =
> +	mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +					  MLXBF_PKA_TRNG_MONOBITCNT_ADDR);
> +	monobit_cnt = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +
> +	if (!ret) {
> +		if (memcmp(poker_cnt,
> +			   poker_test_exp_cnt,
> +			   sizeof(poker_test_exp_cnt))) {
> +			pr_debug("mlxbf_pka: invalid poker counters!\n");
> +			ret = -EIO;
> +		}
> +
> +		if (monobit_cnt != MLXBF_PKA_TRNG_MONOBITCNT_SUM) {
> +			pr_debug("mlxbf_pka: invalid sum of squares!\n");
> +			ret = -EIO;
> +		}
> +	}
> +
> +	mlxbf_pka_dev_trng_disable_test(csr_reg_ptr, csr_reg_base);
> +
> +	return ret;
> +}
> +
> +static int mlxbf_pka_dev_trng_test_known_answer_poker_fail(void __iomem *csr_reg_ptr,
> +							   u64 csr_reg_base)
> +{
> +	u64 monobit_fail_cnt = 0;
> +	u64 poker_fail_cnt = 0;
> +	u64 run_fail_cnt = 0;
> +
> +	pr_debug("mlxbf_pka: run known-answer test circuits (poker fail)\n");
> +
> +	mlxbf_pka_dev_trng_enable_test(csr_reg_ptr, csr_reg_base, MLXBF_PKA_TRNG_TEST_KNOWN_NOISE);
> +
> +	/*
> +	 * Ignore the return value here as it is expected that poker test should fail. Check failure
> +	 * counts thereafter to assert only poker test has failed.
> +	 */
> +	mlxbf_pka_dev_trng_test_circuits(csr_reg_ptr,
> +					 csr_reg_base,
> +					 MLXBF_PKA_TRNG_TEST_DATAL_POKER,
> +					 MLXBF_PKA_TRNG_TEST_DATAH_POKER,
> +					 MLXBF_PKA_TRNG_TEST_COUNT_POKER,
> +					 MLXBF_PKA_TRNG_TEST_HALF_NO,
> +					 &monobit_fail_cnt,
> +					 &run_fail_cnt,
> +					 &poker_fail_cnt);
> +
> +	pr_debug("mlxbf_pka: monobit_fail_cnt : 0x%llx\n", monobit_fail_cnt);
> +	pr_debug("mlxbf_pka: poker_fail_cnt   : 0x%llx\n", poker_fail_cnt);
> +	pr_debug("mlxbf_pka: run_fail_cnt     : 0x%llx\n", run_fail_cnt);
> +
> +	mlxbf_pka_dev_trng_disable_test(csr_reg_ptr, csr_reg_base);
> +
> +	return (poker_fail_cnt && !run_fail_cnt && !monobit_fail_cnt) ? 0 : -EIO;
> +}
> +
> +static int mlxbf_pka_dev_trng_test_unknown_answer(void __iomem *csr_reg_ptr, u64 csr_reg_base)
> +{
> +	u64 datal = 0, datah = 0, csr_reg_off;
> +	int ret = 0, test_idx;
> +
> +	pr_debug("mlxbf_pka: run unknown-answer self test\n");
> +
> +	/* First reset, the RAW registers. */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_RAW_L_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_RAW_H_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +	/*
> +	 * There is a small probability for this test to fail. So run the test 10 times, if it
> +	 * succeeds once then assume that the test passed.
> +	 */
> +	for (test_idx = 0; test_idx < 10; test_idx++) {
> +		mlxbf_pka_dev_trng_enable_test(csr_reg_ptr, csr_reg_base,
> +					       MLXBF_PKA_TRNG_TEST_NOISE);
> +
> +		csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								MLXBF_PKA_TRNG_RAW_L_ADDR);
> +		datal = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +
> +		csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								MLXBF_PKA_TRNG_RAW_H_ADDR);
> +		datah = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +
> +		pr_debug("mlxbf_pka: datal=0x%llx\n", datal);
> +		pr_debug("mlxbf_pka: datah=0x%llx\n", datah);
> +
> +		mlxbf_pka_dev_trng_disable_test(csr_reg_ptr, csr_reg_base);
> +
> +		if (!datah && !datal)
> +			ret = -EIO;
> +		else
> +			return 0;
> +	}
> +	return ret;
> +}
> +
> +/* Test TRNG. */
> +static int mlxbf_pka_dev_test_trng(void __iomem *csr_reg_ptr, u64 csr_reg_base)
> +{
> +	int ret;
> +
> +	ret = mlxbf_pka_dev_trng_test_known_answer_basic(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	ret = mlxbf_pka_dev_trng_test_known_answer_poker_fail(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	ret = mlxbf_pka_dev_trng_test_unknown_answer(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +static void mlxbf_pka_dev_trng_write_ps_ai_str(void __iomem *csr_reg_ptr,
> +					       u64 csr_reg_base,
> +					       u32 input_str[])
> +{
> +	u64 csr_reg_off;
> +	int i;
> +
> +	for (i = 0; i < MLXBF_PKA_TRNG_PS_AI_REG_COUNT; i++) {
> +		csr_reg_off =
> +		mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +						  MLXBF_PKA_TRNG_PS_AI_0_ADDR +
> +						  (i * MLXBF_PKA_TRNG_OUTPUT_REG_OFFSET));
> +
> +		mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, input_str[i]);
> +	}
> +}
> +
> +static void mlxbf_pka_dev_trng_drbg_generate(void __iomem *csr_reg_ptr, u64 csr_reg_base)
> +{
> +	u64 csr_reg_off;
> +
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONTROL_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, MLXBF_PKA_TRNG_CONTROL_REQ_DATA_VAL);
> +}
> +
> +static int mlxbf_pka_dev_test_trng_drbg(void __iomem *csr_reg_ptr, u64 csr_reg_base)
> +{
> +	u64 csr_reg_off, csr_reg_val;
> +	int i, ret;
> +
> +	/* Make sure the engine is idle. */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONTROL_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +	/* Enable DRBG, TRNG need not be enabled for this test. */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONTROL_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, MLXBF_PKA_TRNG_CONTROL_DRBG_ENABLE_VAL);
> +
> +	/* Set 'test_sp_800_90' bit in the TRNG_TEST register. */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_TEST_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, MLXBF_PKA_TRNG_TEST_DRBG_VAL);
> +
> +	/* Wait for 'test_ready' bit to be set. */
> +	ret = mlxbf_pka_dev_trng_wait_test_ready(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	/* 'Instantiate' function. */
> +	mlxbf_pka_dev_trng_write_ps_ai_str(csr_reg_ptr,
> +					   csr_reg_base,
> +					   mlxbf_pka_trng_drbg_test_ps_str);
> +	ret = mlxbf_pka_dev_trng_wait_test_ready(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	/* 'Generate' function. */
> +	mlxbf_pka_dev_trng_write_ps_ai_str(csr_reg_ptr,
> +					   csr_reg_base,
> +					   mlxbf_pka_trng_drbg_test_etpy_str1);
> +	ret = mlxbf_pka_dev_trng_wait_test_ready(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * A standard NIST SP 800-90A DRBG known-answer test discards the result of the first
> +	 * 'Generate' function and only checks the result of the second 'Generate' function. Hence
> +	 * 'Generate' is performed again.
> +	 */
> +
> +	/* 'Generate' function. */
> +	mlxbf_pka_dev_trng_write_ps_ai_str(csr_reg_ptr,
> +					   csr_reg_base,
> +					   mlxbf_pka_trng_drbg_test_etpy_str2);
> +	ret = mlxbf_pka_dev_trng_wait_test_ready(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	/* Check output registers. */
> +	for (i = 0; i < MLXBF_PKA_TRNG_OUTPUT_CNT; i++) {
> +		csr_reg_off =
> +		mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +						  MLXBF_PKA_TRNG_OUTPUT_0_ADDR +
> +						  (i * MLXBF_PKA_TRNG_OUTPUT_REG_OFFSET));
> +
> +		csr_reg_val = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +
> +		if ((u32)csr_reg_val != mlxbf_pka_trng_drbg_test_output[i]) {
> +			pr_debug
> +			("mlxbf_pka: DRBG known answer test failed: output register:%d, 0x%x\n",
> +			 i, (u32)csr_reg_val);
> +			return 1;
> +		}
> +	}
> +
> +	/* Clear 'test_sp_800_90' bit in the TRNG_TEST register. */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_TEST_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +	return 0;
> +}
> +
> +/* Configure the TRNG. */
> +static int mlxbf_pka_dev_config_trng_drbg(struct mlxbf_pka_dev_res_t *aic_csr_ptr,
> +					  struct mlxbf_pka_dev_res_t *trng_csr_ptr)
> +{
> +	u64  csr_reg_base, csr_reg_off;

remove extra ' ' before csr_reg_base

> +	void __iomem *csr_reg_ptr;
> +	int ret;
> +
> +	if (trng_csr_ptr->status != MLXBF_PKA_DEV_RES_STATUS_MAPPED ||
> +	    trng_csr_ptr->type != MLXBF_PKA_DEV_RES_TYPE_REG)
> +		return -EPERM;
> +
> +	pr_debug("mlxbf_pka: starting up the TRNG\n");
> +
> +	ret = mlxbf_pka_dev_config_trng_clk(aic_csr_ptr);
> +	if (ret)
> +		return ret;
> +
> +	csr_reg_base = trng_csr_ptr->base;
> +	csr_reg_ptr  = trng_csr_ptr->ioaddr;

remove extra ' '

> +
> +	/*
> +	 * Perform NIST known-answer tests on the complete SP 800-90A DRBG without BC_DF
> +	 * functionality.
> +	 */
> +	ret = mlxbf_pka_dev_test_trng_drbg(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	/* Starting up the TRNG with a DRBG. */
> +
> +	/* Make sure the engine is idle. */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONTROL_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +	/* Disable all FROs initially. */
> +	csr_reg_off =
> +	mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_FROENABLE_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +	csr_reg_off =
> +	mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_FRODETUNE_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +	/*
> +	 * Write all configuration values in the TRNG_CONFIG and TRNG_ALARMCNT, write zeroes to the
> +	 * TRNG_ALARMMASK and TRNG_ALARMSTOP registers.
> +	 */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONFIG_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, MLXBF_PKA_TRNG_CONFIG_REG_VAL);
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_ALARMCNT_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, MLXBF_PKA_TRNG_ALARMCNT_REG_VAL);
> +
> +	csr_reg_off =
> +	mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_ALARMMASK_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +	csr_reg_off =
> +	mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_ALARMSTOP_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +	/*
> +	 * Enable all FROs in the TRNG_FROENABLE register. Note that this can only be done after
> +	 * clearing the TRNG_ALARMSTOP register.
> +	 */
> +	csr_reg_off =
> +	mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_FROENABLE_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, MLXBF_PKA_TRNG_FROENABLE_REG_VAL);
> +
> +	/*
> +	 * Optionally, write 'Personalization string' of up to 384 bits in TRNG_PS_AI_xxx registers.
> +	 * The contents of these registers will be XOR-ed into the output of the SHA-256
> +	 * 'Conditioning Function' to be used as seed value for the actual DRBG.
> +	 */
> +	mlxbf_pka_dev_trng_write_ps_ai_str(csr_reg_ptr, csr_reg_base, mlxbf_pka_trng_drbg_ps_str);
> +
> +	/*
> +	 * Run TRNG tests after configuring TRNG.
> +	 * NOTE: TRNG need not be enabled to carry out these tests.
> +	 */
> +	ret = mlxbf_pka_dev_test_trng(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Start the actual engine by setting the 'enable_trng' and 'drbg_en' bit in the
> +	 * TRNG_CONTROL register (also a nice point to set the interrupt mask bits).
> +	 */
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONTROL_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, MLXBF_PKA_TRNG_CONTROL_DRBG_REG_VAL);
> +
> +	/*
> +	 * The engine is now ready to handle the first 'Generate' request using the 'request_data'
> +	 * bit of the TRNG_CONTROL register. The first output for these requests will take a while,
> +	 * as Noise Source and Conditioning Function must first generate seed entropy for the DRBG.
> +	 *
> +	 * Optionally, when buffer RAM is configured: Set a data available interrupt threshold using
> +	 * the 'load_thresh' and 'blocks_thresh' fields of the TRNG_INTACK register. This allows
> +	 * delaying the data available interrupt until the indicated number of 128-bit words are
> +	 * available in the buffer RAM.
> +	 *
> +	 * Start the actual 'Generate' operation using the 'request_data' and 'data_blocks' fields
> +	 * of the TRNG_CONTROL register.
> +	 */
> +	mlxbf_pka_dev_trng_drbg_generate(csr_reg_ptr, csr_reg_base);
> +
> +	/* Delay 200 ms. */
> +	mdelay(200);
> +
> +	return 0;
> +}
> +
> +/*
> + * Initialize PKA IO block referred to as shim. It configures shim's parameters and prepare
> + * resources by mapping corresponding memory. The function also configures shim registers and load
> + * firmware to shim internal rams. The struct mlxbf_pka_dev_shim_s passed as input is also an
> + * output. It returns 0 on success, a negative error code on failure.
> + */
> +static int mlxbf_pka_dev_init_shim(struct mlxbf_pka_dev_shim_s *shim)
> +{
> +	u32 data[MLXBF_PKA_TRNG_OUTPUT_CNT];
> +	int ret;
> +	u8 i;
> +
> +	if (shim->status != MLXBF_PKA_SHIM_STATUS_CREATED) {
> +		pr_err("mlxbf_pka error: PKA device must be created\n");
> +		return -EPERM;
> +	}
> +
> +	/* Configure PKA Ring options control word. */
> +	ret = mlxbf_pka_dev_config_ring_options(&shim->resources.buffer_ram,
> +						shim->rings_num,
> +						shim->ring_priority);
> +	if (ret) {
> +		pr_err("mlxbf_pka error: failed to configure ring options\n");
> +		return ret;
> +	}
> +
> +	shim->trng_enabled   = MLXBF_PKA_SHIM_TRNG_ENABLED;
> +	shim->trng_err_cycle = 0;
> +
> +	/* Configure the TRNG. */
> +	ret = mlxbf_pka_dev_config_trng_drbg(&shim->resources.aic_csr, &shim->resources.trng_csr);
> +
> +	/*
> +	 * Pull out data from the content of the TRNG buffer RAM and start the regeneration of new
> +	 * numbers; read and drop 512 words. The read must be done over the 4 TRNG_OUTPUT_X
> +	 * registers at a time.
> +	 */
> +	for (i = 0; i < MLXBF_PKA_TRNG_NUM_OF_FOUR_WORD; i++)
> +		mlxbf_pka_dev_trng_read(shim, data, sizeof(data));
> +
> +	if (ret) {
> +		/* Keep running without TRNG since it does not hurt, but notify users. */
> +		pr_err("mlxbf_pka error: failed to configure TRNG\n");
> +		shim->trng_enabled = MLXBF_PKA_SHIM_TRNG_DISABLED;
> +	}
> +
> +	mutex_init(&shim->mutex);
> +	shim->busy_ring_num = 0;
> +	shim->status = MLXBF_PKA_SHIM_STATUS_INITIALIZED;
> +
> +	return ret;
> +}
> +
> +/* Release a given shim. */
> +static int mlxbf_pka_dev_release_shim(struct mlxbf_pka_dev_shim_s *shim)
> +{
> +	u32 ring_idx;
> +	int ret = 0;
> +
> +	if (shim->status != MLXBF_PKA_SHIM_STATUS_INITIALIZED &&
> +	    shim->status != MLXBF_PKA_SHIM_STATUS_STOPPED) {
> +		pr_err("mlxbf_pka error: PKA device must be initialized or stopped\n");
> +		return -EPERM;
> +	}
> +
> +	/*
> +	 * Release rings which belong to the shim. The operating system might release ring devices
> +	 * before shim devices. The global configuration must be checked before proceeding to the
> +	 * release of ring devices.
> +	 */
> +	if (mlxbf_pka_gbl_config.dev_rings_cnt) {
> +		for (ring_idx = 0; ring_idx < shim->rings_num; ring_idx++) {
> +			ret = mlxbf_pka_dev_release_ring(shim->rings[ring_idx]);
> +			if (ret) {
> +				pr_err("mlxbf_pka error: failed to release ring %d\n", ring_idx);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	shim->busy_ring_num = 0;
> +	shim->status = MLXBF_PKA_SHIM_STATUS_FINALIZED;
> +
> +	return ret;
> +}
> +
> +/* Return the ring associated with the given identifier. */
> +struct mlxbf_pka_dev_ring_t *mlxbf_pka_dev_get_ring(u32 ring_id)
> +{
> +	return mlxbf_pka_gbl_config.dev_rings[ring_id];
> +}
> +
> +/* Return the shim associated with the given identifier. */
> +struct mlxbf_pka_dev_shim_s *mlxbf_pka_dev_get_shim(u32 shim_id)
> +{
> +	return mlxbf_pka_gbl_config.dev_shims[shim_id];
> +}
> +
> +struct mlxbf_pka_dev_ring_t *mlxbf_pka_dev_register_ring(struct device *dev,
> +							 u32 ring_id,
> +							 u32 shim_id)
> +{
> +	struct mlxbf_pka_dev_shim_s *shim;
> +	struct mlxbf_pka_dev_ring_t *ring;
> +	int ret;
> +
> +	shim = mlxbf_pka_dev_get_shim(shim_id);
> +	if (!shim)
> +		return NULL;
> +
> +	ring = devm_kzalloc(dev, sizeof(*ring), GFP_KERNEL);
> +	if (!ring)
> +		return NULL;
> +
> +	ring->status = MLXBF_PKA_DEV_RING_STATUS_UNDEFINED;
> +
> +	/* Initialize ring. */
> +	ret = mlxbf_pka_dev_init_ring(dev, ring, ring_id, shim);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize ring %d\n", ring_id);
> +		mlxbf_pka_dev_release_ring(ring);
> +		return NULL;
> +	}
> +
> +	mlxbf_pka_gbl_config.dev_rings[ring->ring_id] = ring;
> +	mlxbf_pka_gbl_config.dev_rings_cnt += 1;
> +
> +	return ring;
> +}
> +
> +int mlxbf_pka_dev_unregister_ring(struct mlxbf_pka_dev_ring_t *ring)
> +{
> +	if (!ring)
> +		return -EINVAL;
> +
> +	mlxbf_pka_gbl_config.dev_rings[ring->ring_id] = NULL;
> +	mlxbf_pka_gbl_config.dev_rings_cnt -= 1;
> +
> +	/* Release ring. */
> +	return mlxbf_pka_dev_release_ring(ring);
> +}
> +
> +struct mlxbf_pka_dev_shim_s *mlxbf_pka_dev_register_shim(struct device *dev,
> +							 u32 shim_id,
> +							 struct mlxbf_pka_dev_mem_res *mem_res)
> +{
> +	struct mlxbf_pka_dev_shim_s *shim;
> +	u8 split;
> +	int ret;
> +
> +	dev_dbg(dev, "register shim id=%u\n", shim_id);
> +
> +	shim = devm_kzalloc(dev, sizeof(*shim), GFP_KERNEL);
> +	if (!shim)
> +		return shim;
> +
> +	/*
> +	 * Shim state MUST be set to undefined before calling 'mlxbf_pka_dev_create_shim' function.
> +	 */
> +	shim->status = MLXBF_PKA_SHIM_STATUS_UNDEFINED;
> +
> +	/* Set the Window RAM user mode. */
> +	split = MLXBF_PKA_SPLIT_WINDOW_RAM_MODE;
> +
> +	/* Create PKA shim. */
> +	ret = mlxbf_pka_dev_create_shim(dev, shim, shim_id, split, mem_res);
> +	if (ret) {
> +		dev_err(dev, "failed to create shim %u\n", shim_id);
> +		mlxbf_pka_dev_delete_shim(shim);
> +		return NULL;
> +	}
> +
> +	/* Initialize PKA shim. */
> +	ret = mlxbf_pka_dev_init_shim(shim);
> +	if (ret) {
> +		dev_err(dev, "failed to init shim %u\n", shim_id);
> +		mlxbf_pka_dev_release_shim(shim);
> +		mlxbf_pka_dev_delete_shim(shim);
> +		return NULL;
> +	}
> +
> +	mlxbf_pka_gbl_config.dev_shims[shim->shim_id] = shim;
> +	mlxbf_pka_gbl_config.dev_shims_cnt += 1;
> +
> +	return shim;
> +}
> +
> +int mlxbf_pka_dev_unregister_shim(struct mlxbf_pka_dev_shim_s *shim)
> +{
> +	int ret;
> +
> +	if (!shim)
> +		return -EINVAL;
> +
> +	mlxbf_pka_gbl_config.dev_shims[shim->shim_id] = NULL;
> +	mlxbf_pka_gbl_config.dev_shims_cnt -= 1;
> +
> +	/* Release shim. */
> +	ret = mlxbf_pka_dev_release_shim(shim);
> +	if (ret)
> +		return ret;
> +
> +	/* Delete shim. */
> +	return mlxbf_pka_dev_delete_shim(shim);
> +}
> +
> +static bool mlxbf_pka_dev_trng_shutdown_oflo(struct mlxbf_pka_dev_res_t *trng_csr_ptr,
> +					     u64 *err_cycle)
> +{
> +	u64 curr_cycle_cnt, fro_stopped_mask, fro_enabled_mask;
> +	u64 csr_reg_base, csr_reg_off, csr_reg_value;
> +	void __iomem *csr_reg_ptr;
> +
> +	csr_reg_base = trng_csr_ptr->base;
> +	csr_reg_ptr = trng_csr_ptr->ioaddr;
> +
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_STATUS_ADDR);
> +	csr_reg_value = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +
> +	if (csr_reg_value & MLXBF_PKA_TRNG_STATUS_SHUTDOWN_OFLO) {
> +		curr_cycle_cnt = get_cycles();
> +		/*
> +		 * See if any FROs were shut down. If they were, toggle bits in the FRO detune
> +		 * register and reenable the FROs.
> +		 */
> +		csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								MLXBF_PKA_TRNG_ALARMSTOP_ADDR);
> +		fro_stopped_mask = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +		if (fro_stopped_mask) {
> +			csr_reg_off =
> +			mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +							  MLXBF_PKA_TRNG_FROENABLE_ADDR);
> +			fro_enabled_mask = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +			csr_reg_off =
> +			mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +							  MLXBF_PKA_TRNG_FRODETUNE_ADDR);
> +			mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, fro_stopped_mask);
> +
> +			csr_reg_off =
> +			mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +							  MLXBF_PKA_TRNG_FROENABLE_ADDR);
> +			mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off,
> +					       fro_stopped_mask | fro_enabled_mask);
> +		}
> +
> +		/* Reset the error. */
> +		csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								MLXBF_PKA_TRNG_ALARMMASK_ADDR);
> +		mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +		csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								MLXBF_PKA_TRNG_ALARMSTOP_ADDR);
> +		mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, 0);
> +
> +		csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +								MLXBF_PKA_TRNG_INTACK_ADDR);
> +		mlxbf_pka_dev_io_write(csr_reg_ptr,
> +				       csr_reg_off,
> +				       MLXBF_PKA_TRNG_STATUS_SHUTDOWN_OFLO);
> +
> +		/*
> +		 * If this error occurs again within about a second, the hardware is malfunctioning.
> +		 * Disable the trng and return an error.
> +		 */
> +		if (*err_cycle &&
> +		    (curr_cycle_cnt - *err_cycle < MLXBF_PKA_TRNG_TEST_ERR_CYCLE_MAX)) {
> +			csr_reg_off =
> +			mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +							  MLXBF_PKA_TRNG_CONTROL_ADDR);
> +			csr_reg_value  = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +			csr_reg_value &= ~MLXBF_PKA_TRNG_CONTROL_REG_VAL;
> +			mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, csr_reg_value);
> +			return false;
> +		}
> +
> +		*err_cycle = curr_cycle_cnt;
> +	}
> +
> +	return true;
> +}
> +
> +static int mlxbf_pka_dev_trng_drbg_reseed(void __iomem *csr_reg_ptr, u64 csr_reg_base)
> +{
> +	u64 csr_reg_off;
> +	int ret;
> +
> +	csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_CONTROL_ADDR);
> +	mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off, MLXBF_PKA_TRNG_CONTROL_DRBG_RESEED);
> +
> +	ret = mlxbf_pka_dev_trng_wait_test_ready(csr_reg_ptr, csr_reg_base);
> +	if (ret)
> +		return ret;
> +
> +	/* Write personalization string. */
> +	mlxbf_pka_dev_trng_write_ps_ai_str(csr_reg_ptr, csr_reg_base, mlxbf_pka_trng_drbg_ps_str);
> +
> +	return ret;
> +}
> +
> +/* Read from DRBG enabled TRNG. */
> +int mlxbf_pka_dev_trng_read(struct mlxbf_pka_dev_shim_s *shim, u32 *data, u32 cnt)
> +{
> +	u64 csr_reg_base, csr_reg_off, csr_reg_value, timer;
> +	struct mlxbf_pka_dev_res_t *trng_csr_ptr;
> +	u8 output_idx, trng_ready = 0;
> +	u32 data_idx, word_cnt;
> +	void __iomem *csr_reg_ptr;
> +	int ret = 0;
> +
> +	if (!shim || !data || (cnt % MLXBF_PKA_TRNG_OUTPUT_CNT != 0))
> +		return -EINVAL;
> +
> +	if (!cnt)
> +		return ret;
> +
> +	mutex_lock(&shim->mutex);
> +
> +	trng_csr_ptr = &shim->resources.trng_csr;
> +
> +	if (trng_csr_ptr->status != MLXBF_PKA_DEV_RES_STATUS_MAPPED ||
> +	    trng_csr_ptr->type != MLXBF_PKA_DEV_RES_TYPE_REG) {
> +		ret = -EPERM;
> +		goto exit;
> +	}
> +
> +	csr_reg_base = trng_csr_ptr->base;
> +	csr_reg_ptr = trng_csr_ptr->ioaddr;
> +
> +	if (!mlxbf_pka_dev_trng_shutdown_oflo(trng_csr_ptr, &shim->trng_err_cycle)) {
> +		ret = -EWOULDBLOCK;
> +		goto exit;
> +	}
> +
> +	/* Determine the number of 32-bit words. */
> +	word_cnt = cnt >> 2;
> +
> +	for (data_idx = 0; data_idx < word_cnt; data_idx++) {
> +		output_idx = data_idx % MLXBF_PKA_TRNG_OUTPUT_CNT;
> +
> +		/* Tell the hardware to advance. */
> +		if (!output_idx) {
> +			csr_reg_off = mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +									MLXBF_PKA_TRNG_INTACK_ADDR);
> +			mlxbf_pka_dev_io_write(csr_reg_ptr, csr_reg_off,
> +					       MLXBF_PKA_TRNG_STATUS_READY);
> +			trng_ready = 0;
> +
> +			/*
> +			 * Check if 'data_blocks' field is zero in TRNG_CONTROL register. If it is
> +			 * zero, need to issue a 'Reseed and Generate' request for DRBG enabled
> +			 * TRNG.
> +			 */
> +			csr_reg_off =
> +			mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +							  MLXBF_PKA_TRNG_CONTROL_ADDR);
> +			csr_reg_value = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +
> +			if (!((u32)csr_reg_value & MLXBF_PKA_TRNG_DRBG_DATA_BLOCK_MASK)) {
> +				/* Issue reseed. */
> +				ret = mlxbf_pka_dev_trng_drbg_reseed(csr_reg_ptr, csr_reg_base);
> +				if (ret) {
> +					ret = -EBUSY;
> +					goto exit;
> +				}
> +
> +				/* Issue generate request. */
> +				mlxbf_pka_dev_trng_drbg_generate(csr_reg_ptr, csr_reg_base);
> +			}
> +		}
> +
> +		/*
> +		 * Wait until a data word is available in the TRNG_OUTPUT_X registers, using the
> +		 * interrupt and/or 'ready' status bit in the TRNG_STATUS register. The only way
> +		 * this would hang is if the TRNG is never initialized. This function cannot be
> +		 * called if that happened.
> +		 */
> +		timer = mlxbf_pka_dev_timer_start_msec(1000);
> +		csr_reg_off =
> +		mlxbf_pka_dev_get_register_offset(csr_reg_base, MLXBF_PKA_TRNG_STATUS_ADDR);
> +		while (!trng_ready) {
> +			csr_reg_value = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +			trng_ready = csr_reg_value & MLXBF_PKA_TRNG_STATUS_READY;
> +
> +		if (mlxbf_pka_dev_timer_done(timer)) {
> +			pr_debug("mlxbf_pka: shim %u got error obtaining random number\n",
> +				 shim->shim_id);
> +			ret = -EBUSY;
> +			goto exit;
> +		}
> +	}
> +
> +	/* Read the registers. */
> +	csr_reg_off =
> +	mlxbf_pka_dev_get_register_offset(csr_reg_base,
> +					  MLXBF_PKA_TRNG_OUTPUT_0_ADDR +
> +					  (output_idx * MLXBF_PKA_TRNG_OUTPUT_REG_OFFSET));
> +	csr_reg_value = mlxbf_pka_dev_io_read(csr_reg_ptr, csr_reg_off);
> +	data[data_idx] = (u32)csr_reg_value;
> +	}
> +
> +exit:
> +	mutex_unlock(&shim->mutex);
> +	return ret;
> +}
> +
> +bool mlxbf_pka_dev_has_trng(struct mlxbf_pka_dev_shim_s *shim)
> +{
> +	if (!shim)
> +		return false;
> +
> +	return (shim->trng_enabled == MLXBF_PKA_SHIM_TRNG_ENABLED);
> +}
> +
> +/* Syscall to open ring. */
> +static int __mlxbf_pka_dev_open_ring(u32 ring_id)
> +{
> +	struct mlxbf_pka_dev_shim_s *shim;
> +	struct mlxbf_pka_dev_ring_t *ring;
> +	int ret;
> +
> +	if (!mlxbf_pka_gbl_config.dev_rings_cnt)
> +		return -EPERM;
> +
> +	ring = mlxbf_pka_dev_get_ring(ring_id);
> +	if (!ring || !ring->shim)
> +		return -ENXIO;
> +
> +	shim = ring->shim;
> +
> +	mutex_lock(&ring->mutex);
> +
> +	if (shim->status == MLXBF_PKA_SHIM_STATUS_UNDEFINED ||
> +	    shim->status == MLXBF_PKA_SHIM_STATUS_CREATED ||
> +	    shim->status == MLXBF_PKA_SHIM_STATUS_FINALIZED) {
> +		ret = -EPERM;
> +		goto unlock_return;
> +	}
> +
> +	if (ring->status == MLXBF_PKA_DEV_RING_STATUS_BUSY) {
> +		ret = -EBUSY;
> +		goto unlock_return;
> +	}
> +
> +	if (ring->status != MLXBF_PKA_DEV_RING_STATUS_INITIALIZED) {
> +		ret = -EPERM;
> +		goto unlock_return;
> +	}
> +
> +	/* Set ring information words. */
> +	ret = mlxbf_pka_dev_set_ring_info(ring);
> +	if (ret) {
> +		pr_err("mlxbf_pka error: failed to set ring information\n");
> +		ret = -EWOULDBLOCK;
> +		goto unlock_return;
> +	}
> +
> +	if (!shim->busy_ring_num)
> +		shim->status = MLXBF_PKA_SHIM_STATUS_RUNNING;
> +
> +	ring->status = MLXBF_PKA_DEV_RING_STATUS_BUSY;
> +	shim->busy_ring_num += 1;
> +
> +unlock_return:
> +	mutex_unlock(&ring->mutex);
> +	return ret;
> +}
> +
> +/* Open ring. */
> +int mlxbf_pka_dev_open_ring(struct mlxbf_pka_ring_info_t *ring_info)
> +{
> +	return __mlxbf_pka_dev_open_ring(ring_info->ring_id);
> +}
> +
> +/* Syscall to close ring. */
> +static int __mlxbf_pka_dev_close_ring(u32 ring_id)
> +{
> +	struct mlxbf_pka_dev_shim_s *shim;
> +	struct mlxbf_pka_dev_ring_t *ring;
> +	int ret = 0;
> +
> +	if (!mlxbf_pka_gbl_config.dev_rings_cnt)
> +		return -EPERM;
> +
> +	ring = mlxbf_pka_dev_get_ring(ring_id);
> +	if (!ring || !ring->shim)
> +		return -ENXIO;
> +
> +	shim = ring->shim;
> +
> +	mutex_lock(&ring->mutex);
> +
> +	if (shim->status != MLXBF_PKA_SHIM_STATUS_RUNNING &&
> +	    ring->status != MLXBF_PKA_DEV_RING_STATUS_BUSY) {
> +		ret = -EPERM;
> +		goto unlock_return;
> +	}
> +
> +	ring->status = MLXBF_PKA_DEV_RING_STATUS_INITIALIZED;
> +	shim->busy_ring_num -= 1;
> +
> +	if (!shim->busy_ring_num)
> +		shim->status = MLXBF_PKA_SHIM_STATUS_STOPPED;
> +
> +unlock_return:
> +	mutex_unlock(&ring->mutex);
> +	return ret;
> +}
> +
> +/* Close ring. */
> +int mlxbf_pka_dev_close_ring(struct mlxbf_pka_ring_info_t *ring_info)
> +{
> +	if (ring_info)
> +		return __mlxbf_pka_dev_close_ring(ring_info->ring_id);
> +
> +	return 0;
> +}
> diff --git a/drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_dev.h b/drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_dev.h
> new file mode 100644
> index 000000000000..3054476215bd
> --- /dev/null
> +++ b/drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_dev.h
> @@ -0,0 +1,657 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
> +/* SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION. All rights reserved. */
> +
> +#ifndef __MLXBF_PKA_DEV_H__
> +#define __MLXBF_PKA_DEV_H__
> +
> +/*
> + * @file
> + *
> + * API to handle the PKA EIP-154 I/O block (shim). It provides functions and data structures to
> + * initialize and configure the PKA shim. It's the "southband interface" for communication with PKA
> + * hardware resources.
> + */
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/ioctl.h>
> +
> +/* PKA ring device related definitions. */
> +#define CMD_DESC_SIZE 64
> +
> +/*
> + * Describes the PKA command/result ring as used by the hardware. A pair of command and result rings
> + * in PKA window memory, and the data memory used by the commands.
> + */
> +struct mlxbf_pka_ring_desc_t {
> +	u32 num_descs; /* Total number of descriptors in the ring. */
> +
> +	u32 cmd_ring_base; /* Base address of the command ring. */
> +	u32 cmd_idx; /* Index of the command in a ring. */
> +
> +	u32 rslt_ring_base; /* Base address of the result ring. */
> +	u32 rslt_idx; /* Index of the result in a ring. */
> +
> +	u32 operands_base; /* Operands memory base address. */
> +	u32 operands_end; /* End address of operands memory. */
> +
> +	u32 desc_size; /* Size of each element in the ring. */
> +
> +	u64 cmd_desc_mask; /* Bitmask of free(0)/in_use(1) cmd descriptors. */
> +	u32 cmd_desc_cnt; /* Number of command descriptors currently in use. */
> +	u32 rslt_desc_cnt; /* Number of result descriptors currently ready. */
> +};
> +
> +/* This structure declares ring parameters which can be used by user interface. */
> +struct mlxbf_pka_ring_info_t {
> +	int fd; /* File descriptor. */
> +	int group; /* Iommu group. */
> +	int container; /* VFIO cointainer. */

typo cointainer

> +
> +	u32 idx; /* Ring index. */
> +	u32 ring_id; /* Hardware ring identifier. */
> +
> +	u64 mem_off; /* Offset specific to window RAM region. */
> +	u64 mem_addr; /* Window RAM region address. */
> +	u64 mem_size; /* Window RAM region size. */
> +
> +	u64 reg_off; /* Offset specific to count registers region. */
> +	u64 reg_addr; /* Count registers region address. */
> +	u64 reg_size; /* Count registers region size. */
> +
> +	void *mem_ptr; /* Pointer to mapped memory region. */
> +	void *reg_ptr; /* Pointer to mapped counters region. */
> +
> +	struct mlxbf_pka_ring_desc_t ring_desc; /* Ring descriptor. */
> +
> +	u8 big_endian; /* Big endian byte order when enabled. */
> +};
> +
> +/* PKA IOCTL related definitions. */
> +#define MLXBF_PKA_IOC_TYPE 0xB7
> +
> +/*
> + * MLXBF_PKA_RING_GET_REGION_INFO - _IORW(MLXBF_PKA_IOC_TYPE, 0x0, mlxbf_pka_dev_region_info_t).
> + *
> + * Retrieve information about a device region. This is intended to describe MMIO, I/O port, as well
> + * as bus specific regions (ex. PCI config space). Zero sized regions may be used to describe
> + * unimplemented regions.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +struct mlxbf_pka_dev_region_info_t {
> +	u32 reg_index; /* Registers region index. */
> +	u64 reg_size; /* Registers region size (bytes). */
> +	u64 reg_offset; /* Registers region offset from start of device fd. */
> +
> +	u32 mem_index; /* Memory region index. */
> +	u64 mem_size; /* Memory region size (bytes). */
> +	u64 mem_offset; /* Memory region offset from start of device fd. */
> +};
> +
> +#define MLXBF_PKA_RING_GET_REGION_INFO \
> +	_IOWR(MLXBF_PKA_IOC_TYPE, 0x0, struct mlxbf_pka_dev_region_info_t)
> +
> +/*
> + * MLXBF_PKA_GET_RING_INFO - _IORW(MLXBF_PKA_IOC_TYPE, 0x1, mlxbf_pka_dev_ring_info_t).
> + *
> + * Retrieve information about a ring. This is intended to describe ring information words located in
> + * MLXBF_PKA_BUFFER_RAM. Ring information includes base addresses, size and statistics.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +
> +/* Bluefield specific ring information. */
> +struct mlxbf_pka_dev_hw_ring_info_t {
> +	/* Base address of the command descriptor ring. */
> +	u64 cmmd_base;
> +
> +	/* Base address of the result descriptor ring. */
> +	u64 rslt_base;
> +
> +	/*
> +	 * Size of a command ring in number of descriptors, minus 1. Minimum value is 0 (for 1
> +	 * descriptor); maximum value is 65535 (for 64K descriptors).
> +	 */
> +	u16 size;
> +
> +	/*
> +	 * This field specifies the size (in 32-bit words) of the space that PKI command and result
> +	 * descriptor occupies on the Host.
> +	 */
> +	u16 host_desc_size : 10;
> +
> +	/*
> +	 * Indicates whether the result ring delivers results strictly in-order ('1') or that result
> +	 * descriptors are written to the result ring as soon as they become available, or out-of-
> +	 * order ('0').
> +	 */
> +	u8 in_order : 1;
> +
> +	/* Read pointer of the command descriptor ring. */
> +	u16 cmmd_rd_ptr;
> +
> +	/* Write pointer of the result descriptor ring. */
> +	u16 rslt_wr_ptr;
> +
> +	/* Read statistics of the command descriptor ring. */
> +	u16 cmmd_rd_stats;
> +
> +	/* Write statistics of the result descriptor ring. */
> +	u16 rslt_wr_stats;
> +};
> +
> +/* ring_info related definitions. */
> +#define MLXBF_PKA_RING_INFO_IN_ORDER_MASK 0x0001
> +#define MLXBF_PKA_RING_INFO_IN_ORDER_OFFSET 31
> +#define MLXBF_PKA_RING_INFO_HOST_DESC_SIZE_MASK 0x03FF
> +#define MLXBF_PKA_RING_INFO_HOST_DESC_SIZE_OFFSET 18
> +#define MLXBF_PKA_RING_NUM_CMD_DESC_MASK 0xFFFF
> +
> +#define MLXBF_PKA_GET_RING_INFO _IOWR(MLXBF_PKA_IOC_TYPE, 0x1, struct mlxbf_pka_dev_hw_ring_info_t)
> +
> +/* Ring option related definitions. */
> +#define MLXBF_PKA_RING_OPTIONS_RING_PRIORITY_MASK 0xFF
> +#define MLXBF_PKA_RING_OPTIONS_RING_NUM_OFFSET 8
> +#define MLXBF_PKA_RING_OPTIONS_RING_NUM_MASK 0xFF00
> +#define MLXBF_PKA_RING_OPTIONS_SIGNATURE_BYTE_OFFSET 24
> +#define MLXBF_PKA_RING_OPTIONS_SIGNATURE_BYTE_MASK 0xFF000000
> +
> +/*
> + * MLXBF_PKA_CLEAR_RING_COUNTERS - _IO(MLXBF_PKA_IOC_TYPE, 0x2).
> + *
> + * Clear counters. This is intended to reset all command and result counters.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +#define MLXBF_PKA_CLEAR_RING_COUNTERS _IO(MLXBF_PKA_IOC_TYPE, 0x2)
> +
> +/*
> + * MLXBF_PKA_GET_RANDOM_BYTES - _IOWR(MLXBF_PKA_IOC_TYPE, 0x3, mlxbf_pka_dev_trng_info_t).
> + *
> + * Get random bytes from True Random Number Generator(TRNG).
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +
> +/* TRNG information. */
> +struct mlxbf_pka_dev_trng_info_t {
> +	/* Number of random bytes in the buffer or length of the buffer. */
> +	u32 count;
> +
> +	/* Data buffer to hold the random bytes. */
> +	u8 *data;
> +};
> +
> +#define MLXBF_PKA_GET_RANDOM_BYTES _IOWR(MLXBF_PKA_IOC_TYPE, 0x3, struct mlxbf_pka_dev_trng_info_t)
> +
> +/* PKA address related definitions. */
> +
> +/*
> + * Global Control Space CSR addresses/offsets. These are accessed from the ARM as 8 byte reads/
> + * writes. However only the bottom 32 bits are implemented.
> + */
> +#define MLXBF_PKA_CLK_FORCE_ADDR 0x11C80
> +
> +/*
> + * Advanced Interrupt Controller CSR addresses/offsets. These are accessed from the ARM as 8 byte
> + * reads/writes. However only the bottom 32 bits are implemented.
> + */
> +#define MLXBF_PKA_AIC_POL_CTRL_ADDR 0x11E00
> +
> +/*
> + * The True Random Number Generator CSR addresses/offsets. These are accessed from the ARM as 8 byte
> + * reads/writes. However only the bottom 32 bits are implemented.
> + */
> +#define MLXBF_PKA_TRNG_OUTPUT_0_ADDR 0x12000
> +#define MLXBF_PKA_TRNG_STATUS_ADDR 0x12020
> +#define MLXBF_PKA_TRNG_INTACK_ADDR 0x12020

is this typo 0x12020?

> +#define MLXBF_PKA_TRNG_CONTROL_ADDR 0x12028
> +#define MLXBF_PKA_TRNG_CONFIG_ADDR 0x12030
> +#define MLXBF_PKA_TRNG_ALARMCNT_ADDR 0x12038
> +#define MLXBF_PKA_TRNG_FROENABLE_ADDR 0x12040
> +#define MLXBF_PKA_TRNG_FRODETUNE_ADDR 0x12048
> +#define MLXBF_PKA_TRNG_ALARMMASK_ADDR 0x12050
> +#define MLXBF_PKA_TRNG_ALARMSTOP_ADDR 0x12058
> +#define MLXBF_PKA_TRNG_TEST_ADDR 0x120E0
> +#define MLXBF_PKA_TRNG_RAW_L_ADDR 0x12060
> +#define MLXBF_PKA_TRNG_RAW_H_ADDR 0x12068
> +#define MLXBF_PKA_TRNG_MONOBITCNT_ADDR 0x120B8
> +#define MLXBF_PKA_TRNG_POKER_3_0_ADDR 0x120C0
> +#define MLXBF_PKA_TRNG_PS_AI_0_ADDR 0x12080
> +
> +/*
> + * Control register address/offset. This is accessed from the ARM using 8 byte reads/writes. However
> + * only the bottom 32 bits are implemented.
> + */
> +#define MLXBF_PKA_MASTER_SEQ_CTRL_ADDR 0x27F90
> +
> +/*
> + * Ring CSRs: these are all accessed from the ARM using 8 byte reads/writes. However only the bottom
> + * 32 bits are implemented.
> + */
> +/* Ring 0 CSRS. */
> +#define MLXBF_PKA_COMMAND_COUNT_0_ADDR 0x80080
> +
> +/* MLXBF_PKA_BUFFER_RAM: 1024 x 64 - 8K bytes. */
> +#define MLXBF_PKA_BUFFER_RAM_BASE 0x00000
> +#define MLXBF_PKA_BUFFER_RAM_SIZE SZ_16K /* 0x00000...0x03FFF. */
> +
> +/*
> + * PKA Buffer RAM offsets. These are NOT real CSR's but instead are specific offset/addresses within
> + * the EIP154 MLXBF_PKA_BUFFER_RAM.
> + */
> +
> +/* Ring 0. */
> +#define MLXBF_PKA_RING_CMMD_BASE_0_ADDR 0x00000
> +#define MLXBF_PKA_RING_RSLT_BASE_0_ADDR 0x00010
> +#define MLXBF_PKA_RING_SIZE_TYPE_0_ADDR 0x00020
> +#define MLXBF_PKA_RING_RW_PTRS_0_ADDR 0x00028
> +#define MLXBF_PKA_RING_RW_STAT_0_ADDR 0x00030
> +
> +/* Ring Options. */
> +#define MLXBF_PKA_RING_OPTIONS_ADDR 0x07FF8
> +
> +/* Alternate Window RAM size. */
> +#define MLXBF_PKA_WINDOW_RAM_REGION_SIZE SZ_16K
> +
> +/* PKA configuration related definitions. */
> +
> +/* The maximum number of PKA shims referred to as IO blocks. */
> +#define MLXBF_PKA_MAX_NUM_IO_BLOCKS 24
> +/* The maximum number of rings supported by the IO block (shim). */
> +#define MLXBF_PKA_MAX_NUM_IO_BLOCK_RINGS 4
> +
> +#define MLXBF_PKA_MAX_NUM_RINGS (MLXBF_PKA_MAX_NUM_IO_BLOCK_RINGS * MLXBF_PKA_MAX_NUM_IO_BLOCKS)
> +/*
> + * Resources are regions which include info control/status words, count registers and host window
> + * RAM.
> + */
> +#define MLXBF_PKA_MAX_NUM_RING_RESOURCES 3
> +
> +/*
> + * PKA Ring resources.
> + * Define Ring resources parameters including base address, size (in bytes) and ring spacing.
> + */
> +#define MLXBF_PKA_RING_WORDS_ADDR MLXBF_PKA_BUFFER_RAM_BASE
> +#define MLXBF_PKA_RING_CNTRS_ADDR MLXBF_PKA_COMMAND_COUNT_0_ADDR
> +
> +#define MLXBF_PKA_RING_WORDS_SIZE SZ_64
> +#define MLXBF_PKA_RING_CNTRS_SIZE SZ_32
> +#define MLXBF_PKA_RING_MEM_SIZE SZ_16K
> +
> +#define MLXBF_PKA_RING_WORDS_SPACING SZ_64
> +#define MLXBF_PKA_RING_CNTRS_SPACING SZ_64K
> +#define MLXBF_PKA_RING_MEM_0_SPACING SZ_16K
> +#define MLXBF_PKA_RING_MEM_1_SPACING SZ_64K
> +
> +/*
> + * PKA Window RAM parameters.
> + * Define whether to split window RAM during PKA device creation phase.
> + */
> +#define MLXBF_PKA_SPLIT_WINDOW_RAM_MODE 0
> +
> +/* Defines for window RAM partition, valid for 16K memory. */
> +#define MLXBF_PKA_WINDOW_RAM_RING_MEM_SIZE SZ_2K
> +#define MLXBF_PKA_WINDOW_RAM_RING_MEM_DIV 2 /* Divide into halves. */
> +#define MLXBF_PKA_WINDOW_RAM_DATA_MEM_SIZE 0x3800 /* 14KB. */
> +#define MLXBF_PKA_WINDOW_RAM_RING_ADDR_MASK 0xFFFF
> +#define MLXBF_PKA_WINDOW_RAM_RING_SIZE_MASK 0xF0000
> +#define MLXBF_PKA_WINDOW_RAM_RING_SIZE_SHIFT 2
> +
> +/* Window RAM/Alternate window RAM offset mask for BF1 and BF2. */
> +#define MLXBF_PKA_WINDOW_RAM_OFFSET_MASK1 0x730000
> +
> +/* Window RAM/Alternate window RAM offset mask for BF3. */
> +#define MLXBF_PKA_WINDOW_RAM_OFFSET_MASK2 0x70000
> +
> +/*
> + * PKA Master Sequencer Control/Status Register.
> + * Writing '1' to bit [31] puts the Master controller Sequencer in a reset state. Resetting the
> + * Sequencer (in order to load other firmware) should only be done when the EIP-154 is not
> + * performing any operations.
> + */
> +#define MLXBF_PKA_MASTER_SEQ_CTRL_RESET_VAL BIT(31)
> +/*
> + * Writing '1' to bit [30] will reset all Command and Result counters. This bit is write-only and
> + * self clearing and can only be set if the 'Reset' bit [31] is '1'.
> + */
> +#define MLXBF_PKA_MASTER_SEQ_CTRL_CLEAR_COUNTERS_VAL BIT(30)
> +/*
> + * MLXBF_PKA_RING_OPTIONS field to specify the priority in which rings are handled:
> + *  '00' = full rotating priority,
> + *  '01' = fixed priority (ring 0 lowest),
> + *  '10' = ring 0 has the highest priority and the remaining rings have rotating priority,
> + *  '11' = reserved, do not use.
> + */
> +#define MLXBF_PKA_RING_OPTIONS_PRIORITY	0x0
> +
> +/*
> + * 'Signature' byte used because the ring options are transferred through RAM which does not have a
> + * defined reset value. The EIP-154 master controller keeps reading the MLXBF_PKA_RING_OPTIONS word
> + * at start-up until the 'Signature' byte contains 0x46 and the 'Reserved' field contains zero.
> + */
> +#define MLXBF_PKA_RING_OPTIONS_SIGNATURE_BYTE 0x46
> +
> +/*
> + * Order of the result reporting: two schemas are available:
> + *  InOrder    - the results will be reported in the same order as the commands were provided.
> + *  OutOfOrder - the results are reported as soon as they are available.
> + * Note: only the OutOfOrder schema is used in this implementation.
> + */
> +#define MLXBF_PKA_RING_TYPE_OUT_OF_ORDER_BIT 0
> +#define MLXBF_PKA_RING_TYPE_IN_ORDER MLXBF_PKA_RING_TYPE_OUT_OF_ORDER_BIT
> +
> +/*
> + * Byte order of the data written/read to/from Rings.
> + *  Little Endian (LE) - the least significant bytes have the lowest address.
> + *  Big    Endian (BE) - the most significant bytes come first.
> + * Note: only the little endian is used in this implementation.
> + */
> +#define MLXBF_PKA_RING_BYTE_ORDER_LE 0
> +#define MLXBF_PKA_RING_BYTE_ORDER MLXBF_PKA_RING_BYTE_ORDER_LE
> +
> +/*
> + * 'trng_clk_on' mask for PKA Clock Switch Forcing Register. Turn on the TRNG clock. When the TRNG
> + * is controlled via the host slave interface, this engine needs to be turned on by setting bit 11.
> + */
> +#define MLXBF_PKA_CLK_FORCE_TRNG_ON 0x800
> +
> +/* Number of TRNG output registers. */
> +#define MLXBF_PKA_TRNG_OUTPUT_CNT 4
> +
> +/* Number of TRNG poker test counts. */
> +#define MLXBF_PKA_TRNG_POKER_TEST_CNT 4
> +
> +/* TRNG configuration. */
> +#define MLXBF_PKA_TRNG_CONFIG_REG_VAL 0x00020008
> +/* TRNG Alarm Counter Register value. */
> +#define MLXBF_PKA_TRNG_ALARMCNT_REG_VAL 0x000200FF
> +/* TRNG FRO Enable Register value. */
> +#define MLXBF_PKA_TRNG_FROENABLE_REG_VAL 0x00FFFFFF

lowercase hex

> +/*
> + * TRNG Control Register value. Set bit 10 to start the EIP-76 (i.e. TRNG engine), gathering entropy
> + * from the FROs.
> + */
> +#define MLXBF_PKA_TRNG_CONTROL_REG_VAL 0x00000400
> +
> +/* TRNG Control bit. */
> +#define MLXBF_PKA_TRNG_CONTROL_TEST_MODE 0x100
> +
> +/*
> + * TRNG Control Register value. Set bit 10 and 12 to start the EIP-76 (i.e. TRNG engine) with DRBG
> + * enabled, gathering entropy from the FROs.
> + */
> +#define MLXBF_PKA_TRNG_CONTROL_DRBG_REG_VAL 0x00001400
> +
> +/*
> + * DRBG enabled TRNG 'request_data' value. REQ_DATA_VAL (in accordance with DATA_BLOCK_MASK)
> + * requests 256 blocks of 128-bit random output. 4095 blocks is the maximum number that can be
> + * requested for the TRNG (with DRBG) configuration on Bluefield platforms.
> + */
> +#define MLXBF_PKA_TRNG_CONTROL_REQ_DATA_VAL 0x10010000
> +
> +/* Mask for 'Data Block' in TRNG Control Register. */
> +#define MLXBF_PKA_TRNG_DRBG_DATA_BLOCK_MASK 0xfff00000
> +
> +/* Set bit 12 of TRNG Control Register to enable DRBG functionality. */
> +#define MLXBF_PKA_TRNG_CONTROL_DRBG_ENABLE_VAL BIT(12)
> +
> +/* Set bit 7 (i.e. 'test_sp_800_90 DRBG' bit) in the TRNG Test Register. */
> +#define MLXBF_PKA_TRNG_TEST_DRBG_VAL BIT(7)
> +
> +/* Number of Personalization String/Additional Input Registers. */
> +#define MLXBF_PKA_TRNG_PS_AI_REG_COUNT 12
> +
> +/* Offset bytes of Personalization String/Additional Input Registers. */
> +#define MLXBF_PKA_TRNG_OUTPUT_REG_OFFSET 0x8
> +
> +/* Maximum TRNG test error cycle, about one second. */
> +#define MLXBF_PKA_TRNG_TEST_ERR_CYCLE_MAX (1000 * 1000 * 1000)
> +
> +/* DRBG Reseed enable. */
> +#define MLXBF_PKA_TRNG_CONTROL_DRBG_RESEED BIT(15)
> +
> +/* TRNG Status bits. */
> +#define MLXBF_PKA_TRNG_STATUS_READY BIT(0)
> +#define MLXBF_PKA_TRNG_STATUS_SHUTDOWN_OFLO BIT(1)
> +#define MLXBF_PKA_TRNG_STATUS_TEST_READY BIT(8)
> +#define MLXBF_PKA_TRNG_STATUS_MONOBIT_FAIL BIT(7)
> +#define MLXBF_PKA_TRNG_STATUS_RUN_FAIL BIT(4)
> +#define MLXBF_PKA_TRNG_STATUS_POKER_FAIL BIT(6)
> +
> +/* TRNG Alarm Counter bits. */
> +#define MLXBF_PKA_TRNG_ALARMCNT_STALL_RUN_POKER BIT(15)
> +
> +/* TRNG Test bits. */
> +#define MLXBF_PKA_TRNG_TEST_KNOWN_NOISE BIT(5)
> +#define MLXBF_PKA_TRNG_TEST_NOISE BIT(13)
> +
> +/* TRNG Test constants*/
> +#define MLXBF_PKA_TRNG_MONOBITCNT_SUM 9978
> +
> +#define MLXBF_PKA_TRNG_TEST_HALF_ADD 1
> +#define MLXBF_PKA_TRNG_TEST_HALF_NO 0
> +
> +#define MLXBF_PKA_TRNG_TEST_DATAL_BASIC_1 0x11111333
> +#define MLXBF_PKA_TRNG_TEST_DATAH_BASIC_1 0x3555779f
> +#define MLXBF_PKA_TRNG_TEST_COUNT_BASIC_1 11
> +
> +#define MLXBF_PKA_TRNG_TEST_DATAL_BASIC_2 0x01234567
> +#define MLXBF_PKA_TRNG_TEST_DATAH_BASIC_2 0x89abcdef
> +#define MLXBF_PKA_TRNG_TEST_COUNT_BASIC_2 302
> +
> +#define MLXBF_PKA_TRNG_TEST_DATAL_POKER 0xffffffff
> +#define MLXBF_PKA_TRNG_TEST_DATAH_POKER 0xffffffff
> +#define MLXBF_PKA_TRNG_TEST_COUNT_POKER 11
> +
> +#define MLXBF_PKA_TRNG_NUM_OF_FOUR_WORD 128
> +
> +/* PKA device related definitions. */
> +#define MLXBF_PKA_DEVFS_RING_DEVICES "mlxbf_pka/%d"
> +
> +/* Device resource structure. */
> +struct mlxbf_pka_dev_res_t {
> +	void __iomem *ioaddr; /* The (iore)mapped version of addr, driver internal use. */
> +	u64 base; /* Base address of the device's resource. */
> +	u64 size; /* Size of IO. */
> +	u8 type; /* Type of resource addr points to. */
> +	s8 status; /* Status of the resource. */
> +	char *name; /* Name of the resource. */
> +};
> +
> +/* Defines for mlxbf_pka_dev_res->type. */
> +#define MLXBF_PKA_DEV_RES_TYPE_MEM 1 /* Resource type is memory. */
> +#define MLXBF_PKA_DEV_RES_TYPE_REG 2 /* Resource type is register. */
> +
> +/* Defines for mlxbf_pka_dev_res->status. */
> +#define MLXBF_PKA_DEV_RES_STATUS_MAPPED 1 /* The resource is (iore)mapped. */
> +#define MLXBF_PKA_DEV_RES_STATUS_UNMAPPED -1 /* The resource is unmapped. */
> +
> +/* PKA Ring resources structure. */
> +struct mlxbf_pka_dev_ring_res_t {
> +	struct mlxbf_pka_dev_res_t info_words; /* Ring information words. */
> +	struct mlxbf_pka_dev_res_t counters; /* Ring counters. */
> +	struct mlxbf_pka_dev_res_t window_ram; /* Window RAM. */
> +};
> +
> +/* PKA Ring structure. */
> +struct mlxbf_pka_dev_ring_t {
> +	u32 ring_id; /* Ring identifier. */
> +	struct mlxbf_pka_dev_shim_s *shim; /* Pointer to the shim associated to the ring. */
> +	u32 resources_num; /* Number of ring resources. */
> +	struct mlxbf_pka_dev_ring_res_t resources; /* Ring resources. */
> +	struct mlxbf_pka_dev_hw_ring_info_t *ring_info; /* Ring information. */
> +	u32 num_cmd_desc; /* Number of command descriptors. */
> +	s8 status; /* Status of the ring. */
> +	struct mutex mutex; /* Mutex lock for sharing ring device. */
> +};
> +
> +/* Defines for mlxbf_pka_dev_ring->status. */
> +#define MLXBF_PKA_DEV_RING_STATUS_UNDEFINED -1
> +#define MLXBF_PKA_DEV_RING_STATUS_INITIALIZED 1
> +#define MLXBF_PKA_DEV_RING_STATUS_READY 2
> +#define MLXBF_PKA_DEV_RING_STATUS_BUSY 3
> +
> +/* PKA Shim resources structure. */
> +struct mlxbf_pka_dev_shim_res_t {
> +	struct mlxbf_pka_dev_res_t buffer_ram; /* Buffer RAM. */
> +	struct mlxbf_pka_dev_res_t master_seq_ctrl; /* Master sequencer controller CSR. */
> +	struct mlxbf_pka_dev_res_t aic_csr; /* Interrupt controller CSRs. */
> +	struct mlxbf_pka_dev_res_t trng_csr; /* TRNG module CSRs. */
> +};
> +
> +/* Number of PKA device resources. */
> +#define MLXBF_PKA_DEV_SHIM_RES_CNT 6
> +
> +/* Platform global shim resource information. */
> +struct mlxbf_pka_dev_gbl_shim_res_info_t {
> +	struct mlxbf_pka_dev_res_t *res_tbl[MLXBF_PKA_DEV_SHIM_RES_CNT];
> +	u8 res_cnt;
> +};
> +
> +struct mlxbf_pka_dev_mem_res {
> +	u64 eip154_base; /* Base address for EIP154 mmio registers. */
> +	u64 eip154_size; /* EIP154 mmio register region size. */
> +
> +	u64 wndw_ram_off_mask; /* Common offset mask for alt window RAM and window RAM. */
> +	u64 wndw_ram_base; /* Base address for window RAM. */
> +	u64 wndw_ram_size; /* Window RAM region size. */
> +
> +	u64 alt_wndw_ram_0_base; /* Base address for alternate window RAM 0. */
> +	u64 alt_wndw_ram_1_base; /* Base address for alternate window RAM 1. */
> +	u64 alt_wndw_ram_2_base; /* Base address for alternate window RAM 2. */
> +	u64 alt_wndw_ram_3_base; /* Base address for alternate window RAM 3. */
> +	u64 alt_wndw_ram_size; /* Alternate window RAM regions size. */
> +
> +	u64 csr_base; /* Base address for CSR registers. */
> +	u64 csr_size; /* CSR area size. */
> +};
> +
> +/* PKA Shim structure. */
> +struct mlxbf_pka_dev_shim_s {
> +	struct	mlxbf_pka_dev_mem_res mem_res;
> +	u64 trng_err_cycle; /* TRNG error cycle. */
> +	u32 shim_id; /* Shim identifier. */
> +	u32 rings_num; /* Number of supported rings (hardware specific). */
> +	struct mlxbf_pka_dev_ring_t **rings; /* Pointer to rings which belong to the shim. */
> +	u8 ring_priority; /* Specify the priority in which rings are handled. */
> +	u8 ring_type; /*Indicates whether the result ring delivers results strictly in-order. */
> +	struct mlxbf_pka_dev_shim_res_t resources; /* Shim resources. */
> +	u8 window_ram_split; /* If non-zero, the split window RAM scheme is used. */
> +	u32 busy_ring_num; /* Number of active rings (rings in busy state). */
> +	u8 trng_enabled; /* Whether the TRNG engine is enabled. */
> +	s8 status; /* Status of the shim. */
> +	struct mutex mutex; /* Mutex lock for sharing shim. */
> +};
> +
> +/* Defines for mlxbf_pka_dev_shim->status. */
> +#define MLXBF_PKA_SHIM_STATUS_UNDEFINED -1
> +#define MLXBF_PKA_SHIM_STATUS_CREATED 1
> +#define MLXBF_PKA_SHIM_STATUS_INITIALIZED 2
> +#define MLXBF_PKA_SHIM_STATUS_RUNNING 3
> +#define MLXBF_PKA_SHIM_STATUS_STOPPED 4
> +#define MLXBF_PKA_SHIM_STATUS_FINALIZED 5
> +
> +/* Defines for mlxbf_pka_dev_shim->window_ram_split. */
> +
> +/* Window RAM is split into 4 * 16KB blocks. */
> +#define MLXBF_PKA_SHIM_WINDOW_RAM_SPLIT_ENABLED 1
> +/* Window RAM is not split and occupies 64KB. */
> +#define MLXBF_PKA_SHIM_WINDOW_RAM_SPLIT_DISABLED 2
> +
> +/* Defines for mlxbf_pka_dev_shim->trng_enabled. */
> +#define MLXBF_PKA_SHIM_TRNG_ENABLED 1
> +#define MLXBF_PKA_SHIM_TRNG_DISABLED 0
> +
> +/* Platform global configuration structure. */
> +struct mlxbf_pka_dev_gbl_config_t {
> +	u32 dev_shims_cnt; /* Number of registered PKA shims. */
> +	u32 dev_rings_cnt; /* Number of registered Rings. */
> +
> +	/* Table of registered PKA shims. */
> +	struct mlxbf_pka_dev_shim_s *dev_shims[MLXBF_PKA_MAX_NUM_IO_BLOCKS];
> +
> +	/* Table of registered Rings. */
> +	struct mlxbf_pka_dev_ring_t *dev_rings[MLXBF_PKA_MAX_NUM_RINGS];
> +};
> +
> +extern struct mlxbf_pka_dev_gbl_config_t mlxbf_pka_gbl_config;
> +
> +/* Processor speed in hertz, used in routines which might be called very early in boot. */
> +static inline u64 mlxbf_pka_early_cpu_speed(void)
> +{
> +	/*
> +	 * Initial guess at our CPU speed.  We set this to be larger than any possible real speed,
> +	 * so that any calculated delays will be too long, rather than too short.
> +	 *
> +	 * CPU Freq for High/Bin Chip - 1.255GHz.
> +	 */
> +	return 1255 * 1000 * 1000;
> +}
> +
> +/*
> + * Ring getter for mlxbf_pka_dev_gbl_config_t structure which holds all system global configuration.
> + * This configuration is shared and common to kernel device driver associated with PKA hardware.
> + */
> +struct mlxbf_pka_dev_ring_t *mlxbf_pka_dev_get_ring(u32 ring_id);
> +
> +/*
> + * Shim getter for mlxbf_pka_dev_gbl_config_t structure which holds all system global configuration.
> + * This configuration is shared and common to kernel device driver associated with PKA hardware.
> + */
> +struct mlxbf_pka_dev_shim_s *mlxbf_pka_dev_get_shim(u32 shim_id);
> +
> +/*
> + * Register a ring. This function initializes a Ring and configures its related resources, and
> + * returns a pointer to that ring.
> + */
> +struct mlxbf_pka_dev_ring_t *mlxbf_pka_dev_register_ring(struct device *dev,
> +							 u32 ring_id,
> +							 u32 shim_id);
> +
> +/* Unregister a Ring. */
> +int mlxbf_pka_dev_unregister_ring(struct mlxbf_pka_dev_ring_t *ring);
> +
> +/*
> + * Register PKA IO block. This function initializes a shim and configures its related resources, and
> + * returns a pointer to that ring.
> + */
> +struct mlxbf_pka_dev_shim_s *mlxbf_pka_dev_register_shim(struct device *dev,
> +							 u32 shim_id,
> +							 struct mlxbf_pka_dev_mem_res *mem_res);
> +
> +/* Unregister PKA IO block. */
> +int mlxbf_pka_dev_unregister_shim(struct mlxbf_pka_dev_shim_s *shim);
> +
> +/* Reset a Ring. */
> +int mlxbf_pka_dev_reset_ring(struct mlxbf_pka_dev_ring_t *ring);
> +
> +/*
> + * Clear ring counters. This function resets the master sequencer controller to clear the command
> + * and result counters.
> + */
> +int mlxbf_pka_dev_clear_ring_counters(struct mlxbf_pka_dev_ring_t *ring);
> +
> +/*
> + * Read data from the TRNG. Drivers can fill up to 'cnt' bytes of data into the buffer 'data'. The
> + * buffer 'data' is aligned for any type and 'cnt' is a multiple of 4.
> + */
> +int mlxbf_pka_dev_trng_read(struct mlxbf_pka_dev_shim_s *shim, u32 *data, u32 cnt);
> +
> +/* Return true if the TRNG engine is enabled, false if not. */
> +bool mlxbf_pka_dev_has_trng(struct mlxbf_pka_dev_shim_s *shim);
> +
> +/*
> + * Open the file descriptor associated with ring. It returns an integer value, which is used to
> + * refer to the file. If not successful, it returns a negative error.
> + */
> +int mlxbf_pka_dev_open_ring(struct mlxbf_pka_ring_info_t *ring_info);
> +
> +/*
> + * Close the file descriptor associated with ring. The function returns 0 if successful, negative
> + * value to indicate an error.
> + */
> +int mlxbf_pka_dev_close_ring(struct mlxbf_pka_ring_info_t *ring_info);
> +
> +#endif /* __MLXBF_PKA_DEV_H__ */
> diff --git a/drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_drv.c b/drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_drv.c
> new file mode 100644
> index 000000000000..a8fe0ac1df78
> --- /dev/null
> +++ b/drivers/platform/mellanox/mlxbf_pka/mlxbf_pka_drv.c
> @@ -0,0 +1,1066 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> +// SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION. All rights reserved.
> +
> +#include <linux/acpi.h>
> +#include <linux/cdev.h>
> +#include <linux/device.h>
> +#include <linux/hw_random.h>
> +#include <linux/interrupt.h>
> +#include <linux/iommu.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> +
> +#include "mlxbf_pka_dev.h"
> +
> +#define MLXBF_PKA_DRIVER_DESCRIPTION "BlueField PKA driver"
> +
> +#define MLXBF_PKA_DEVICE_ACPIHID_BF1 "MLNXBF10"
> +#define MLXBF_PKA_RING_DEVICE_ACPIHID_BF1 "MLNXBF11"
> +
> +#define MLXBF_PKA_DEVICE_ACPIHID_BF2 "MLNXBF20"
> +#define MLXBF_PKA_RING_DEVICE_ACPIHID_BF2 "MLNXBF21"
> +
> +#define MLXBF_PKA_DEVICE_ACPIHID_BF3 "MLNXBF51"
> +#define MLXBF_PKA_RING_DEVICE_ACPIHID_BF3 "MLNXBF52"
> +
> +#define MLXBF_PKA_DEVICE_ACCESS_MODE 0666
> +
> +#define MLXBF_PKA_DEVICE_RES_CNT 7
> +
> +#define MLXBF_PKA_DEVICE_NAME_MAX 14
> +
> +enum mlxbf_pka_mem_res_idx {
> +	MLXBF_PKA_ACPI_EIP154_IDX = 0,
> +	MLXBF_PKA_ACPI_WNDW_RAM_IDX,
> +	MLXBF_PKA_ACPI_ALT_WNDW_RAM_0_IDX,
> +	MLXBF_PKA_ACPI_ALT_WNDW_RAM_1_IDX,
> +	MLXBF_PKA_ACPI_ALT_WNDW_RAM_2_IDX,
> +	MLXBF_PKA_ACPI_ALT_WNDW_RAM_3_IDX,
> +	MLXBF_PKA_ACPI_CSR_IDX
> +};
> +
> +enum mlxbf_pka_plat_type {
> +	MLXBF_PKA_PLAT_TYPE_BF1 = 0, /* Platform type Bluefield-1. */
> +	MLXBF_PKA_PLAT_TYPE_BF2, /* Platform type Bluefield-2. */
> +	MLXBF_PKA_PLAT_TYPE_BF3 /* Platform type Bluefield-3. */
> +};
> +
> +static DEFINE_MUTEX(mlxbf_pka_drv_lock);
> +
> +static u32 mlxbf_pka_device_cnt;
> +static u32 mlxbf_pka_ring_device_cnt;
> +
> +static const char mlxbf_pka_acpihid_bf1[] = MLXBF_PKA_DEVICE_ACPIHID_BF1;
> +static const char mlxbf_pka_ring_acpihid_bf1[] = MLXBF_PKA_RING_DEVICE_ACPIHID_BF1;
> +
> +static const char mlxbf_pka_acpihid_bf2[] = MLXBF_PKA_DEVICE_ACPIHID_BF2;
> +static const char mlxbf_pka_ring_acpihid_bf2[] = MLXBF_PKA_RING_DEVICE_ACPIHID_BF2;
> +
> +static const char mlxbf_pka_acpihid_bf3[] = MLXBF_PKA_DEVICE_ACPIHID_BF3;
> +static const char mlxbf_pka_ring_acpihid_bf3[] = MLXBF_PKA_RING_DEVICE_ACPIHID_BF3;
> +
> +struct mlxbf_pka_drv_plat_info {
> +	enum mlxbf_pka_plat_type type;
> +};
> +
> +static struct mlxbf_pka_drv_plat_info mlxbf_pka_drv_plat[] = {
> +	[MLXBF_PKA_PLAT_TYPE_BF1] = {.type = MLXBF_PKA_PLAT_TYPE_BF1,},
> +	[MLXBF_PKA_PLAT_TYPE_BF2] = {.type = MLXBF_PKA_PLAT_TYPE_BF2,},
> +	[MLXBF_PKA_PLAT_TYPE_BF3] = {.type = MLXBF_PKA_PLAT_TYPE_BF3,}
> +};
> +
> +static const struct acpi_device_id mlxbf_pka_drv_acpi_ids[] = {
> +	{ MLXBF_PKA_DEVICE_ACPIHID_BF1,
> +	  (kernel_ulong_t)&mlxbf_pka_drv_plat[MLXBF_PKA_PLAT_TYPE_BF1],
> +	  0,
> +	  0 },
> +	{ MLXBF_PKA_RING_DEVICE_ACPIHID_BF1, 0, 0, 0 },
> +	{ MLXBF_PKA_DEVICE_ACPIHID_BF2,
> +	  (kernel_ulong_t)&mlxbf_pka_drv_plat[MLXBF_PKA_PLAT_TYPE_BF2],
> +	  0,
> +	  0 },
> +	{ MLXBF_PKA_RING_DEVICE_ACPIHID_BF2, 0, 0, 0 },
> +	{ MLXBF_PKA_DEVICE_ACPIHID_BF3,
> +	  (kernel_ulong_t)&mlxbf_pka_drv_plat[MLXBF_PKA_PLAT_TYPE_BF3],
> +	  0,
> +	  0 },
> +	{ MLXBF_PKA_RING_DEVICE_ACPIHID_BF3, 0, 0, 0 },
> +	{},
> +};
> +
> +static struct pka {
> +	struct idr ring_idr;
> +	struct mutex idr_lock; /* PKA ring device IDR lock mutex. */
> +} pka;
> +
> +struct mlxbf_pka_info {
> +	struct device *dev; /* The device this info struct belongs to. */
> +	const char *name; /* Device name. */
> +	const char *acpihid;
> +	u8 flag;
> +	struct module *module;
> +	void *priv; /* Optional private data. */
> +};
> +
> +/* Defines for mlxbf_pka_info->flags. */
> +#define MLXBF_PKA_DRIVER_FLAG_RING_DEVICE 1
> +#define MLXBF_PKA_DRIVER_FLAG_DEVICE 2
> +
> +struct mlxbf_pka_platdata {
> +	struct platform_device *pdev;
> +	struct mlxbf_pka_info *info;
> +	spinlock_t lock; /* Generic spinlock. */
> +	unsigned long irq_flags;
> +};
> +
> +/* Bits in mlxbf_pka_platdata.irq_flags. */
> +enum {
> +	MLXBF_PKA_IRQ_DISABLED = 0,
> +};
> +
> +struct mlxbf_pka_ring_region {
> +	u64 off;
> +	u64 addr;
> +	resource_size_t size;
> +	u32 flags;
> +	u32 type;
> +};
> +
> +/* Defines for mlxbf_pka_ring_region->flags. */
> +#define MLXBF_PKA_RING_REGION_FLAG_READ BIT(0) /* Region supports read. */
> +#define MLXBF_PKA_RING_REGION_FLAG_WRITE BIT(1) /* Region supports write. */
> +#define MLXBF_PKA_RING_REGION_FLAG_MMAP BIT(2) /* Region supports mmap. */
> +
> +/* Defines for mlxbf_pka_ring_region->type. */
> +#define MLXBF_PKA_RING_RES_TYPE_WORDS 1	/* Info control/status words. */
> +#define MLXBF_PKA_RING_RES_TYPE_CNTRS 2	/* Count registers. */
> +#define MLXBF_PKA_RING_RES_TYPE_MEM 4 /* Window RAM region. */
> +
> +#define MLXBF_PKA_DRIVER_RING_DEV_MAX MLXBF_PKA_MAX_NUM_RINGS
> +
> +struct mlxbf_pka_ring_device {
> +	struct mlxbf_pka_info *info;
> +	struct device *device;
> +	u32 device_id;
> +	u32 parent_device_id;
> +	struct mutex mutex; /* PKA ring device mutex. */
> +	struct mlxbf_pka_dev_ring_t *ring;
> +	u32 num_regions;
> +	struct mlxbf_pka_ring_region *regions;
> +	struct miscdevice misc;
> +};
> +
> +#define MLXBF_PKA_DRIVER_DEV_MAX MLXBF_PKA_MAX_NUM_IO_BLOCKS
> +
> +/* Defines for region index. */
> +#define MLXBF_PKA_RING_REGION_WORDS_IDX 0
> +#define MLXBF_PKA_RING_REGION_CNTRS_IDX 1
> +#define MLXBF_PKA_RING_REGION_MEM_IDX 2
> +#define MLXBF_PKA_RING_REGION_OFFSET_SHIFT 40
> +#define MLXBF_PKA_RING_REGION_INDEX_TO_OFFSET(index) \
> +	((u64)(index) << MLXBF_PKA_RING_REGION_OFFSET_SHIFT)
> +
> +struct mlxbf_pka_device {
> +	struct mlxbf_pka_info *info;
> +	struct device *device;
> +	u32 device_id;
> +	struct resource *resource[MLXBF_PKA_DEVICE_RES_CNT];
> +	struct mlxbf_pka_dev_shim_s *shim;
> +	long irq; /* Interrupt number. */
> +	struct hwrng rng;
> +};
> +
> +/* Defines for mlxbf_pka_device->irq. */
> +#define MLXBF_PKA_IRQ_CUSTOM -1
> +#define MLXBF_PKA_IRQ_NONE 0
> +
> +/* Hardware interrupt handler. */
> +static irqreturn_t mlxbf_pka_drv_irq_handler(int irq, void *device)
> +{
> +	struct mlxbf_pka_device *mlxbf_pka_dev = (struct mlxbf_pka_device *)device;
> +	struct platform_device *pdev = to_platform_device(mlxbf_pka_dev->device);
> +	struct mlxbf_pka_platdata *priv = platform_get_drvdata(pdev);
> +
> +	dev_dbg(&pdev->dev, "handle irq in device\n");
> +
> +	/* Just disable the interrupt in the interrupt controller. */
> +	spin_lock(&priv->lock);
> +	if (!__test_and_set_bit(MLXBF_PKA_IRQ_DISABLED, &priv->irq_flags))
> +		disable_irq_nosync(irq);
> +
> +	spin_unlock(&priv->lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mlxbf_pka_drv_register_irq(struct mlxbf_pka_device *mlxbf_pka_dev)
> +{
> +	if (mlxbf_pka_dev->irq && mlxbf_pka_dev->irq != MLXBF_PKA_IRQ_CUSTOM) {
> +		/* Allow sharing the irq among several devices (child devices so far). */
> +		return request_irq(mlxbf_pka_dev->irq,
> +				   (irq_handler_t)mlxbf_pka_drv_irq_handler,
> +				   IRQF_SHARED, mlxbf_pka_dev->info->name,
> +				   mlxbf_pka_dev);
> +	}
> +
> +	return -ENXIO;
> +}
> +
> +static int mlxbf_pka_drv_ring_regions_init(struct mlxbf_pka_ring_device *ring_dev)
> +{
> +	struct mlxbf_pka_ring_region *region;
> +	struct mlxbf_pka_dev_ring_t *ring;
> +	struct mlxbf_pka_dev_res_t *res;
> +	u32 num_regions;
> +
> +	ring = ring_dev->ring;
> +	if (!ring || !ring->shim)
> +		return -ENXIO;
> +
> +	num_regions = ring->resources_num;
> +	ring_dev->num_regions = num_regions;
> +	ring_dev->regions = devm_kzalloc(ring_dev->device,
> +					 num_regions * sizeof(struct mlxbf_pka_ring_region),
> +					 GFP_KERNEL);
> +	if (!ring_dev->regions)
> +		return -ENOMEM;
> +
> +	/* Information words region. */
> +	res = &ring->resources.info_words;
> +	region = &ring_dev->regions[MLXBF_PKA_RING_REGION_WORDS_IDX];
> +	/* Map offset to the physical address. */
> +	region->off = MLXBF_PKA_RING_REGION_INDEX_TO_OFFSET(MLXBF_PKA_RING_REGION_WORDS_IDX);
> +	region->addr = res->base;
> +	region->size = res->size;
> +	region->type = MLXBF_PKA_RING_RES_TYPE_WORDS;
> +	region->flags |= (MLXBF_PKA_RING_REGION_FLAG_MMAP |
> +			  MLXBF_PKA_RING_REGION_FLAG_READ |
> +			  MLXBF_PKA_RING_REGION_FLAG_WRITE);
> +
> +	/* Counters registers region. */
> +	res = &ring->resources.counters;
> +	region = &ring_dev->regions[MLXBF_PKA_RING_REGION_CNTRS_IDX];
> +	/* Map offset to the physical address. */
> +	region->off = MLXBF_PKA_RING_REGION_INDEX_TO_OFFSET(MLXBF_PKA_RING_REGION_CNTRS_IDX);
> +	region->addr = res->base;
> +	region->size = res->size;
> +	region->type = MLXBF_PKA_RING_RES_TYPE_CNTRS;
> +	region->flags |= (MLXBF_PKA_RING_REGION_FLAG_MMAP |
> +			  MLXBF_PKA_RING_REGION_FLAG_READ |
> +			  MLXBF_PKA_RING_REGION_FLAG_WRITE);
> +
> +	/* Window RAM region. */
> +	res = &ring->resources.window_ram;
> +	region = &ring_dev->regions[MLXBF_PKA_RING_REGION_MEM_IDX];
> +	/* Map offset to the physical address. */
> +	region->off = MLXBF_PKA_RING_REGION_INDEX_TO_OFFSET(MLXBF_PKA_RING_REGION_MEM_IDX);
> +	region->addr = res->base;
> +	region->size = res->size;
> +	region->type = MLXBF_PKA_RING_RES_TYPE_MEM;
> +	region->flags |= (MLXBF_PKA_RING_REGION_FLAG_MMAP |
> +			  MLXBF_PKA_RING_REGION_FLAG_READ |
> +			  MLXBF_PKA_RING_REGION_FLAG_WRITE);
> +
> +	return 0;
> +}
> +
> +static void mlxbf_pka_drv_ring_regions_cleanup(struct mlxbf_pka_ring_device *ring_dev)
> +{
> +	/* Clear PKA ring device regions. */
> +	ring_dev->num_regions = 0;
> +}
> +
> +static int mlxbf_pka_drv_ring_open(void *device_data)
> +{
> +	struct mlxbf_pka_ring_device *ring_dev = device_data;
> +	struct mlxbf_pka_info *info = ring_dev->info;
> +	struct mlxbf_pka_ring_info_t ring_info;
> +	int ret;
> +
> +	dev_dbg(ring_dev->device, "open ring device (device_data:%p)\n", ring_dev);
> +
> +	if (!try_module_get(info->module))
> +		return -ENODEV;
> +
> +	ring_info.ring_id = ring_dev->device_id;
> +	ret = mlxbf_pka_dev_open_ring(&ring_info);
> +	if (ret) {
> +		dev_dbg(ring_dev->device, "failed to open ring\n");
> +		module_put(info->module);
> +		return ret;
> +	}
> +
> +	/* Initialize regions. */
> +	ret = mlxbf_pka_drv_ring_regions_init(ring_dev);
> +	if (ret) {
> +		dev_dbg(ring_dev->device, "failed to initialize regions\n");
> +		mlxbf_pka_dev_close_ring(&ring_info);
> +		module_put(info->module);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void mlxbf_pka_drv_ring_release(void *device_data)
> +{
> +	struct mlxbf_pka_ring_device *ring_dev = device_data;
> +	struct mlxbf_pka_info *info = ring_dev->info;
> +	struct mlxbf_pka_ring_info_t ring_info;
> +	int ret;
> +
> +	dev_dbg(ring_dev->device, "release ring device (device_data:%p)\n", ring_dev);
> +
> +	mlxbf_pka_drv_ring_regions_cleanup(ring_dev);
> +
> +	ring_info.ring_id = ring_dev->device_id;
> +	ret = mlxbf_pka_dev_close_ring(&ring_info);
> +	if (ret)
> +		dev_dbg(ring_dev->device, "failed to close ring\n");
> +
> +	module_put(info->module);
> +}
> +
> +static int mlxbf_pka_drv_ring_mmap_region(struct mlxbf_pka_ring_region region,
> +					  struct vm_area_struct *vma)
> +{
> +	u64 req_len, pgoff, req_start;
> +
> +	req_len = vma->vm_end - vma->vm_start;
> +	pgoff = vma->vm_pgoff & ((1U << (MLXBF_PKA_RING_REGION_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
> +	req_start = pgoff << PAGE_SHIFT;
> +
> +	region.size = roundup(region.size, PAGE_SIZE);
> +
> +	if (req_start + req_len > region.size)
> +		return -EINVAL;
> +
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
> +
> +	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff, req_len, vma->vm_page_prot);
> +}
> +
> +static int mlxbf_pka_drv_ring_mmap(void *device_data, struct vm_area_struct *vma)
> +{
> +	struct mlxbf_pka_ring_device *ring_dev = device_data;
> +	struct mlxbf_pka_ring_region *region;
> +	unsigned int index;
> +
> +	dev_dbg(ring_dev->device, "mmap device\n");
> +
> +	index = vma->vm_pgoff >> (MLXBF_PKA_RING_REGION_OFFSET_SHIFT - PAGE_SHIFT);
> +
> +	if (vma->vm_end < vma->vm_start)
> +		return -EINVAL;
> +	if (!(vma->vm_flags & VM_SHARED))
> +		return -EINVAL;
> +	if (index >= ring_dev->num_regions)
> +		return -EINVAL;
> +	if (vma->vm_start & ~PAGE_MASK)
> +		return -EINVAL;
> +	if (vma->vm_end & ~PAGE_MASK)
> +		return -EINVAL;
> +
> +	region = &ring_dev->regions[index];
> +
> +	if (!(region->flags & MLXBF_PKA_RING_REGION_FLAG_MMAP))
> +		return -EINVAL;
> +
> +	if (!(region->flags & MLXBF_PKA_RING_REGION_FLAG_READ) && (vma->vm_flags & VM_READ))
> +		return -EINVAL;
> +
> +	if (!(region->flags & MLXBF_PKA_RING_REGION_FLAG_WRITE) && (vma->vm_flags & VM_WRITE))
> +		return -EINVAL;
> +
> +	vma->vm_private_data = ring_dev;
> +
> +	if (region->type & MLXBF_PKA_RING_RES_TYPE_CNTRS ||
> +	    region->type & MLXBF_PKA_RING_RES_TYPE_MEM)
> +		return mlxbf_pka_drv_ring_mmap_region(ring_dev->regions[index], vma);
> +
> +	if (region->type & MLXBF_PKA_RING_RES_TYPE_WORDS)
> +		/* Currently user space is not allowed to access this region. */
> +		return -EINVAL;
> +
> +	return -EINVAL;
> +}
> +
> +static long mlxbf_pka_drv_ring_ioctl(void *device_data, unsigned int cmd, unsigned long arg)
> +{
> +	struct mlxbf_pka_ring_device *ring_dev = device_data;
> +
> +	if (cmd == MLXBF_PKA_RING_GET_REGION_INFO) {
> +		struct mlxbf_pka_dev_region_info_t info;
> +
> +		info.mem_index = MLXBF_PKA_RING_REGION_MEM_IDX;
> +		info.mem_offset = ring_dev->regions[info.mem_index].off;
> +		info.mem_size = ring_dev->regions[info.mem_index].size;
> +
> +		info.reg_index = MLXBF_PKA_RING_REGION_CNTRS_IDX;
> +		info.reg_offset = ring_dev->regions[info.reg_index].off;
> +		info.reg_size = ring_dev->regions[info.reg_index].size;
> +
> +		return copy_to_user((void __user *)arg, &info, sizeof(info)) ? -EFAULT : 0;
> +
> +	} else if (cmd == MLXBF_PKA_GET_RING_INFO) {
> +		struct mlxbf_pka_dev_hw_ring_info_t *this_ring_info;
> +		struct mlxbf_pka_dev_hw_ring_info_t  hw_ring_info;
> +
> +		this_ring_info = ring_dev->ring->ring_info;
> +
> +		hw_ring_info.cmmd_base = this_ring_info->cmmd_base;
> +		hw_ring_info.rslt_base = this_ring_info->rslt_base;
> +		hw_ring_info.size = this_ring_info->size;
> +		hw_ring_info.host_desc_size = this_ring_info->host_desc_size;
> +		hw_ring_info.in_order = this_ring_info->in_order;
> +		hw_ring_info.cmmd_rd_ptr = this_ring_info->cmmd_rd_ptr;
> +		hw_ring_info.rslt_wr_ptr = this_ring_info->rslt_wr_ptr;
> +		hw_ring_info.cmmd_rd_stats = this_ring_info->cmmd_rd_ptr;
> +		hw_ring_info.rslt_wr_stats = this_ring_info->rslt_wr_stats;
> +
> +		return copy_to_user((void __user *)arg,
> +				    &hw_ring_info,
> +				    sizeof(hw_ring_info)) ? -EFAULT : 0;
> +	} else if (cmd == MLXBF_PKA_CLEAR_RING_COUNTERS) {
> +		return mlxbf_pka_dev_clear_ring_counters(ring_dev->ring);
> +	} else if (cmd == MLXBF_PKA_GET_RANDOM_BYTES) {
> +		struct mlxbf_pka_dev_trng_info_t trng_data;
> +		struct mlxbf_pka_dev_shim_s *shim;
> +		bool trng_present;
> +		u32 byte_cnt;
> +		u32 *data;
> +		int ret;
> +
> +		shim = ring_dev->ring->shim;
> +		ret = copy_from_user(&trng_data,
> +				     (void __user *)(arg),
> +				     sizeof(struct mlxbf_pka_dev_trng_info_t));
> +		if (ret) {
> +			dev_dbg(ring_dev->device, "failed to copy user request.\n");
> +			return -EFAULT;
> +		}
> +
> +		/*
> +		 * Need byte count which is multiple of 4 as required by the
> +		 * mlxbf_pka_dev_trng_read() interface.
> +		 */
> +		byte_cnt = round_up(trng_data.count, MLXBF_PKA_TRNG_OUTPUT_CNT);
> +
> +		data = kzalloc(byte_cnt, GFP_KERNEL);
> +		if (!data)
> +			return -ENOMEM;
> +
> +		trng_present = mlxbf_pka_dev_has_trng(shim);
> +		if (!trng_present) {
> +			kfree(data);
> +			return -EAGAIN;
> +		}
> +
> +		ret = mlxbf_pka_dev_trng_read(shim, data, byte_cnt);
> +		if (ret) {
> +			dev_dbg(ring_dev->device, "TRNG failed %d\n", ret);
> +			kfree(data);
> +			return ret;
> +		}
> +
> +		ret = copy_to_user((void __user *)(trng_data.data), data, trng_data.count);
> +		kfree(data);
> +		return ret ? -EFAULT : 0;
> +	}
> +
> +	return -ENOTTY;
> +}
> +
> +static int mlxbf_pka_drv_open(struct inode *inode, struct file *filep)
> +{
> +	struct mlxbf_pka_ring_device *ring_dev;
> +	int ret;
> +
> +	mutex_lock(&pka.idr_lock);
> +	ring_dev = idr_find(&pka.ring_idr, iminor(inode));
> +	mutex_unlock(&pka.idr_lock);
> +	if (!ring_dev) {
> +		pr_err("mlxbf_pka error: failed to find idr for device\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = mlxbf_pka_drv_ring_open(ring_dev);
> +	if (ret)
> +		return ret;
> +
> +	filep->private_data = ring_dev;
> +	return ret;
> +}
> +
> +static int mlxbf_pka_drv_release(struct inode *inode, struct file *filep)
> +{
> +	struct mlxbf_pka_ring_device *ring_dev = filep->private_data;
> +
> +	filep->private_data = NULL;
> +	mlxbf_pka_drv_ring_release(ring_dev);
> +
> +	return 0;
> +}
> +
> +static int mlxbf_pka_drv_mmap(struct file *filep, struct vm_area_struct *vma)
> +{
> +	return mlxbf_pka_drv_ring_mmap(filep->private_data, vma);
> +}
> +
> +static long mlxbf_pka_drv_unlocked_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> +{
> +	return mlxbf_pka_drv_ring_ioctl(filep->private_data, cmd, arg);
> +}
> +
> +static const struct file_operations mlxbf_pka_ring_fops = {
> +	.owner = THIS_MODULE,
> +	.open = mlxbf_pka_drv_open,
> +	.release = mlxbf_pka_drv_release,
> +	.unlocked_ioctl = mlxbf_pka_drv_unlocked_ioctl,
> +	.mmap = mlxbf_pka_drv_mmap,
> +};
> +
> +static int mlxbf_pka_drv_add_ring_device(struct mlxbf_pka_ring_device *ring_dev)
> +{
> +	struct device *dev = ring_dev->device;
> +	char name[MLXBF_PKA_DEVICE_NAME_MAX];
> +	int minor_number;
> +	int ret;
> +
> +	ret = snprintf(name, sizeof(name), MLXBF_PKA_DEVFS_RING_DEVICES, ring_dev->device_id);
> +	if (ret < 0) {
> +		dev_err(dev, " -- snprintf failed: ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	ring_dev->misc.minor = MISC_DYNAMIC_MINOR;
> +	ring_dev->misc.name = &name[0];
> +	ring_dev->misc.mode = MLXBF_PKA_DEVICE_ACCESS_MODE;
> +	ring_dev->misc.fops = &mlxbf_pka_ring_fops;
> +
> +	ret = misc_register(&ring_dev->misc);
> +	if (ret) {
> +		dev_err(dev, " -- misc_register failed: ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&pka.idr_lock);
> +	minor_number = idr_alloc(&pka.ring_idr,
> +				 ring_dev,
> +				 ring_dev->misc.minor,
> +				 MINORMASK + 1,
> +				 GFP_KERNEL);
> +	mutex_unlock(&pka.idr_lock);
> +	if (minor_number != ring_dev->misc.minor) {
> +		dev_err(dev, " -- idr_alloc failed with minor number %d\n", ring_dev->misc.minor);
> +		return ring_dev->misc.minor;
> +	}
> +
> +	dev_info(dev, "ring device minor:%d\n", ring_dev->misc.minor);
> +
> +	return ret;
> +}
> +
> +static struct mlxbf_pka_ring_device *mlxbf_pka_drv_del_ring_device(struct device *dev)
> +{
> +	struct platform_device *pdev = container_of(dev, struct platform_device, dev);
> +	struct mlxbf_pka_platdata *priv = platform_get_drvdata(pdev);
> +	struct mlxbf_pka_info *info = priv->info;
> +	struct mlxbf_pka_ring_device *ring_dev = info->priv;
> +
> +	if (ring_dev) {
> +		mutex_lock(&pka.idr_lock);
> +		idr_remove(&pka.ring_idr, ring_dev->misc.minor);
> +		mutex_unlock(&pka.idr_lock);
> +		misc_deregister(&ring_dev->misc);
> +	}
> +
> +	return ring_dev;
> +}
> +
> +static void mlxbf_pka_drv_get_mem_res(struct mlxbf_pka_device *mlxbf_pka_dev,
> +				      struct mlxbf_pka_dev_mem_res *mem_res,
> +				      u64 wndw_ram_off_mask)
> +{
> +	enum mlxbf_pka_mem_res_idx acpi_mem_idx;
> +
> +	acpi_mem_idx = MLXBF_PKA_ACPI_EIP154_IDX;
> +	mem_res->wndw_ram_off_mask = wndw_ram_off_mask;
> +
> +	/* PKA EIP154 MMIO base address. */
> +	mem_res->eip154_base = mlxbf_pka_dev->resource[acpi_mem_idx]->start;
> +	mem_res->eip154_size = mlxbf_pka_dev->resource[acpi_mem_idx]->end -
> +			       mem_res->eip154_base + 1;
> +	acpi_mem_idx++;
> +
> +	/* PKA window RAM base address. */
> +	mem_res->wndw_ram_base = mlxbf_pka_dev->resource[acpi_mem_idx]->start;
> +	mem_res->wndw_ram_size = mlxbf_pka_dev->resource[acpi_mem_idx]->end -
> +				 mem_res->wndw_ram_base + 1;
> +	acpi_mem_idx++;
> +
> +	/*
> +	 * PKA alternate window RAM base address.
> +	 * Note: the size of all the alt window RAM is the same, depicted by 'alt_wndw_ram_size'
> +	 * variable. All alt window RAM resources are read here even though not all of them are used
> +	 * currently.
> +	 */
> +	mem_res->alt_wndw_ram_0_base = mlxbf_pka_dev->resource[acpi_mem_idx]->start;
> +	mem_res->alt_wndw_ram_size   = mlxbf_pka_dev->resource[acpi_mem_idx]->end -
> +				       mem_res->alt_wndw_ram_0_base + 1;
> +
> +	if (mem_res->alt_wndw_ram_size != MLXBF_PKA_WINDOW_RAM_REGION_SIZE)
> +		dev_err(mlxbf_pka_dev->device, "alternate Window RAM size from ACPI is wrong.\n");
> +
> +	acpi_mem_idx++;
> +
> +	mem_res->alt_wndw_ram_1_base = mlxbf_pka_dev->resource[acpi_mem_idx]->start;
> +	acpi_mem_idx++;
> +
> +	mem_res->alt_wndw_ram_2_base = mlxbf_pka_dev->resource[acpi_mem_idx]->start;
> +	acpi_mem_idx++;
> +
> +	mem_res->alt_wndw_ram_3_base = mlxbf_pka_dev->resource[acpi_mem_idx]->start;
> +	acpi_mem_idx++;
> +
> +	/* PKA CSR base address. */
> +	mem_res->csr_base = mlxbf_pka_dev->resource[acpi_mem_idx]->start;
> +	mem_res->csr_size = mlxbf_pka_dev->resource[acpi_mem_idx]->end - mem_res->csr_base + 1;
> +}
> +
> +/*
> + * Note: this function must be serialized because it calls 'mlxbf_pka_dev_register_shim' which
> + * manipulates common counters for the PKA devices.
> + */
> +static int mlxbf_pka_drv_register_device(struct mlxbf_pka_device *mlxbf_pka_dev,
> +					 u64 wndw_ram_off_mask)
> +{
> +	struct mlxbf_pka_dev_mem_res mem_res;
> +	u32 mlxbf_pka_shim_id;
> +
> +	/* Register shim. */
> +	mlxbf_pka_shim_id = mlxbf_pka_dev->device_id;
> +
> +	mlxbf_pka_drv_get_mem_res(mlxbf_pka_dev, &mem_res, wndw_ram_off_mask);
> +
> +	mlxbf_pka_dev->shim = mlxbf_pka_dev_register_shim(mlxbf_pka_dev->device,
> +							  mlxbf_pka_shim_id,
> +							  &mem_res);
> +	if (!mlxbf_pka_dev->shim) {
> +		dev_dbg(mlxbf_pka_dev->device, "failed to register shim\n");
> +		return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mlxbf_pka_drv_unregister_device(struct mlxbf_pka_device *mlxbf_pka_dev)
> +{
> +	if (!mlxbf_pka_dev)
> +		return -EINVAL;
> +
> +	if (mlxbf_pka_dev->shim) {
> +		dev_dbg(mlxbf_pka_dev->device, "unregister device shim\n");
> +		return mlxbf_pka_dev_unregister_shim(mlxbf_pka_dev->shim);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Note: this function must be serialized because it calls 'mlxbf_pka_dev_register_ring' which
> + * manipulates common counters for the PKA ring devices.
> + */
> +static int mlxbf_pka_drv_register_ring_device(struct mlxbf_pka_ring_device *ring_dev)
> +{
> +	u32 shim_id = ring_dev->parent_device_id;
> +	u32 ring_id = ring_dev->device_id;
> +
> +	ring_dev->ring = mlxbf_pka_dev_register_ring(ring_dev->device, ring_id, shim_id);
> +	if (!ring_dev->ring) {
> +		dev_dbg(ring_dev->device, "failed to register ring device\n");
> +		return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mlxbf_pka_drv_unregister_ring_device(struct mlxbf_pka_ring_device *ring_dev)
> +{
> +	if (!ring_dev)
> +		return -EINVAL;
> +
> +	if (ring_dev->ring) {
> +		dev_dbg(ring_dev->device, "unregister ring device\n");
> +		return mlxbf_pka_dev_unregister_ring(ring_dev->ring);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mlxbf_pka_drv_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
> +{
> +	struct mlxbf_pka_device *mlxbf_pka_dev = container_of(rng, struct mlxbf_pka_device, rng);
> +	u32 *buffer = data;
> +	int ret;
> +
> +	ret = mlxbf_pka_dev_trng_read(mlxbf_pka_dev->shim, buffer, max);
> +	if (ret) {
> +		dev_dbg(mlxbf_pka_dev->device,
> +			"%s: failed to read random bytes ret=%d",
> +			rng->name, ret);
> +		return 0;
> +	}
> +
> +	return max;
> +}
> +
> +static int mlxbf_pka_drv_probe_device(struct mlxbf_pka_info *info)
> +{
> +	struct mlxbf_pka_drv_plat_info *plat_info;
> +	enum mlxbf_pka_mem_res_idx acpi_mem_idx;
> +	struct mlxbf_pka_device *mlxbf_pka_dev;
> +	const struct acpi_device_id *aid;
> +	const char *bootup_status;
> +	u64 wndw_ram_off_mask;
> +	struct hwrng *trng;
> +	int ret;
> +
> +	struct device *dev = info->dev;
> +	struct device_node *of_node = dev->of_node;
> +	struct platform_device *pdev = to_platform_device(dev);
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	mlxbf_pka_dev = devm_kzalloc(dev, sizeof(*mlxbf_pka_dev), GFP_KERNEL);
> +	if (!mlxbf_pka_dev)
> +		return -ENOMEM;
> +
> +	mutex_lock(&mlxbf_pka_drv_lock);
> +	mlxbf_pka_device_cnt += 1;
> +	if (mlxbf_pka_device_cnt > MLXBF_PKA_DRIVER_DEV_MAX) {
> +		dev_dbg(dev, "cannot support %u devices\n", mlxbf_pka_device_cnt);
> +		mutex_unlock(&mlxbf_pka_drv_lock);
> +		return -EPERM;
> +	}
> +	mlxbf_pka_dev->device_id = mlxbf_pka_device_cnt - 1;
> +	mutex_unlock(&mlxbf_pka_drv_lock);
> +
> +	mlxbf_pka_dev->info = info;
> +	mlxbf_pka_dev->device = dev;
> +	info->flag = MLXBF_PKA_DRIVER_FLAG_DEVICE;
> +
> +	for (acpi_mem_idx = MLXBF_PKA_ACPI_EIP154_IDX;
> +		acpi_mem_idx < MLXBF_PKA_DEVICE_RES_CNT; acpi_mem_idx++) {
> +		mlxbf_pka_dev->resource[acpi_mem_idx] = platform_get_resource(pdev,
> +									      IORESOURCE_MEM,
> +									      acpi_mem_idx);
> +	}
> +
> +	/* Verify PKA bootup status. */
> +	ret = device_property_read_string(dev, "bootup_done", &bootup_status);
> +	if (ret < 0 || strcmp(bootup_status, "true")) {
> +		dev_err(dev, "device bootup required\n");
> +		return -EPERM;
> +	}
> +
> +	/* Window RAM offset mask is platform dependent. */
> +	aid = acpi_match_device(mlxbf_pka_drv_acpi_ids, dev);
> +	if (!aid)
> +		return -ENODEV;
> +
> +	plat_info = (struct mlxbf_pka_drv_plat_info *)aid->driver_data;
> +	if (plat_info->type <= MLXBF_PKA_PLAT_TYPE_BF2) {
> +		wndw_ram_off_mask = MLXBF_PKA_WINDOW_RAM_OFFSET_MASK1;
> +	} else if (plat_info->type <= MLXBF_PKA_PLAT_TYPE_BF3) {
> +		wndw_ram_off_mask = MLXBF_PKA_WINDOW_RAM_OFFSET_MASK2;
> +	} else {
> +		dev_err(dev, "invalid platform type: %d\n", (int)plat_info->type);
> +		return -EINVAL;
> +	}
> +
> +	/* Set interrupts. */
> +	ret = platform_get_irq(pdev, 0);
> +	mlxbf_pka_dev->irq = ret;
> +	if (ret == -ENXIO && of_node) {
> +		mlxbf_pka_dev->irq = MLXBF_PKA_IRQ_NONE;
> +	} else if (ret < 0) {
> +		dev_err(dev, "failed to get device IRQ\n");
> +		return ret;
> +	}
> +
> +	/* Register IRQ. */
> +	ret = mlxbf_pka_drv_register_irq(mlxbf_pka_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register device IRQ\n");
> +		return ret;
> +	}
> +
> +	mutex_lock(&mlxbf_pka_drv_lock);
> +	ret = mlxbf_pka_drv_register_device(mlxbf_pka_dev, wndw_ram_off_mask);
> +	if (ret) {
> +		dev_dbg(dev, "failed to register shim\n");
> +		mutex_unlock(&mlxbf_pka_drv_lock);
> +		return ret;
> +	}
> +	mutex_unlock(&mlxbf_pka_drv_lock);
> +
> +	/* Setup the TRNG if needed. */
> +	if (mlxbf_pka_dev_has_trng(mlxbf_pka_dev->shim)) {
> +		trng = &mlxbf_pka_dev->rng;
> +		trng->name = pdev->name;
> +		trng->read = mlxbf_pka_drv_rng_read;
> +
> +		ret = hwrng_register(&mlxbf_pka_dev->rng);
> +		if (ret) {
> +			dev_err(dev, "failed to register trng\n");
> +			return ret;
> +		}
> +	}
> +
> +	info->priv = mlxbf_pka_dev;
> +
> +	return 0;
> +}
> +
> +static int mlxbf_pka_drv_remove_device(struct platform_device *pdev)
> +{
> +	struct mlxbf_pka_platdata *priv = platform_get_drvdata(pdev);
> +	struct mlxbf_pka_info *info = priv->info;
> +	struct mlxbf_pka_device *mlxbf_pka_dev = (struct mlxbf_pka_device *)info->priv;
> +
> +	if (!mlxbf_pka_dev) {
> +		pr_err("mlxbf_pka error: failed to unregister device\n");
> +		return -EINVAL;
> +	}
> +
> +	if (mlxbf_pka_dev_has_trng(mlxbf_pka_dev->shim))
> +		hwrng_unregister(&mlxbf_pka_dev->rng);
> +
> +	if (mlxbf_pka_drv_unregister_device(mlxbf_pka_dev))
> +		dev_err(&pdev->dev, "failed to unregister device\n");
> +
> +	return 0;
> +}
> +


Thanks,
Alok
